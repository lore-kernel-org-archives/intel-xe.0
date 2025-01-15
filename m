Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00F85C02183
	for <intel-xe@archiver.kernel.org>; Wed, 15 Jan 2025 11:25:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B788E10E5EE;
	Wed, 15 Jan 2025 11:25:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R8BVyheF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F2C110E5EE
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Jan 2025 11:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736940341; x=1768476341;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ELPYWIW5WA3EfdXMRdRP1lOkJ/ITFEubfeEHRWuhTmQ=;
 b=R8BVyheF7XWP8nZE1wTqLWeRAii1VmagiCrVEk7FWO7N7nXoeUUbuXhA
 N1HiURADwNHsNqTckHHp/gZhfxQQ9VEPhyU6Jv3CHELPwiQNb20eF3LMe
 0sZuE8YKTnYNQVHTWALEAJTE/Bh8qZTbFaW2eeC/U2qRNejuONRgGXLRe
 IunSwAuKxXg6xmE37KmfRZ3xyL1y/D2a4NQexAHyhMVW+UBFYKJutfKTH
 nw3ZUdPnzQg+dJs+pf8qGBDx8CbROtLPZDoiVXv/hy2QBz0M1fS0q/jhU
 9Zid2CvEg7f06aE9F9wFvLpu//OV37pfRhF8p6g4MUC6Yh9bPfzSzuPIg g==;
X-CSE-ConnectionGUID: NE/3Tf+JQJS0/BYm9ChQqA==
X-CSE-MsgGUID: L1/c1rZMSMmTcrsX8KEiOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11315"; a="47758154"
X-IronPort-AV: E=Sophos;i="6.12,206,1728975600"; d="scan'208";a="47758154"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2025 03:25:40 -0800
X-CSE-ConnectionGUID: isoZqoNnQTyJ99Za5bcpSA==
X-CSE-MsgGUID: CdBSUOQOR6uGs/XWqBHCGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="110090191"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Jan 2025 03:25:40 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 15 Jan 2025 03:25:39 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 15 Jan 2025 03:25:39 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 15 Jan 2025 03:25:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AKo/ePXn9I4qrVuhAVjSHHniyG6HuA3PJCbSl3pDdCZJrF+/1ZAcx1mtW+ectupahZ5XiPj9+fsUIHcSCR2WDEcWyerVJVVTjK8sttror1Y+sz7wQoXehyXFenuE8taElCIlPzT0RTlfpDR5FkgiLCwAEFwGn5n+Gvm+rHS3hR6TxdnLPbmHm8U4t5+iMlc1M9UJw+ejAT6U4dVUL5od/B+iE6J/LznySKd/aCza8d4sF82NEkvgCzMLPHUuAQAyu1QleAQUR12HIx0B6p7MMU9zk8ufQj8DVbDNcmui7JXGOfx/sptgLWlxdxVmA8GgG0D6d5zfGUe0zAkpLMeOWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+09uQjKLzor/Kmo2PKz/kNeEMGLm91ve14mpKfjaCrY=;
 b=sDxU06e1emLXtdP/NGqWTwd2smtdrPSWOke1wve9oRLTyy7rTq9CTKn/rlvOEv1aXWBlomlVxuCdRlpvq/V8Vfvm/kCahrnH+sLAvkOzT/AFpyXje8YOt0wKYgw79DH3IAzO0O6hD+3HBE+OaNX05FHyFz1++PVHVdW+cxUfSyNGZ0svJgEMisxBvZ4A5f6CuO377/9XELchAxJK/Gk5I7efEt9ulSICRrfiLwvld0+3cUGJfKLtlS66aaIik9FgUexMGTaOxnrHl0fzk8RYcDdHMBhQStH/iZWdwrAyfu7pskSjDgaP/npomk74I0+G0aG0fwV7KXPAWmg4oyn2Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by SJ0PR11MB5866.namprd11.prod.outlook.com (2603:10b6:a03:429::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Wed, 15 Jan
 2025 11:25:22 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%4]) with mapi id 15.20.8356.010; Wed, 15 Jan 2025
 11:25:22 +0000
Date: Wed, 15 Jan 2025 12:25:13 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: Matt Atwood <matthew.s.atwood@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/xe3: Generate and store the L3 bank mask
Message-ID: <Z4ea8HrkPavnQBut@fdugast-desk>
References: <20250114203853.35055-1-matthew.s.atwood@intel.com>
 <20250114212954.GC5109@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250114212954.GC5109@mdroper-desk1.amr.corp.intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: VI1PR04CA0130.eurprd04.prod.outlook.com
 (2603:10a6:803:f0::28) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|SJ0PR11MB5866:EE_
X-MS-Office365-Filtering-Correlation-Id: dad048f3-e1df-42d1-32ad-08dd35574c90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xEnIVzLQ3blJPIm+xbz7klAyDwM7zCkzvmSmJi2JC1WxOfQbmNZeSeFErAcG?=
 =?us-ascii?Q?0g2x+DWmi9fYM5W/fy17m4pXsZ71HpJAfldAoB+y1LrFpfwwk2Im/9RVpxPM?=
 =?us-ascii?Q?d4NHsAmRgmWIuwPlmlkfx78guW3w/882Sq75fPPcoc1hzPXuxMp/CuXKZvSc?=
 =?us-ascii?Q?LFc1bWoy7D4uDr99Ac3KXhfesI79SmZ/dzZBPaTgB3ZdJ0c3VV3NwLwJ+aPK?=
 =?us-ascii?Q?X1reu9QS/7iHqZQWZThfKSiL4sPm1Zto9ISvNTO7jNwSsRUEbX0zjNeSOJLT?=
 =?us-ascii?Q?COCDNg5PxIQ7QvNl08ZX2S0FoXkilTq6WTzBRzahGpFtMPOQ1yLtJCZIQIg1?=
 =?us-ascii?Q?zxLUQytfYqzQMNScOVGYaDhiFYABELyjMQ31EvrwWia77pQ5IUXCdHTjXNCN?=
 =?us-ascii?Q?qMoVvIYH09XtabWo6rQFjIEC4K20snkNaWAOJfzEkEU6Y3D0FDuXGwWzF6eZ?=
 =?us-ascii?Q?f95/aDz5OecUR4TVtqzS5aH8YfnGNcrcQSvxdqZmU5++v7gPScUKd4p7gCGQ?=
 =?us-ascii?Q?Ts+5vAy8NqgCrhO3eyb00lHBE8iqWLUqTbfg4vxdT/7oZAbUHJWlmzYOgzEv?=
 =?us-ascii?Q?5NWDw+1OM2w9SIXHMpf0oFT30TtZvBKS8Sf4bGnCFX600kf2swvKY5m9Q2iK?=
 =?us-ascii?Q?9QjgT0stChS16KU2Os5uW4X2zskh+U/6w4cxb073E+C28N+efm1qeQ1PYKBb?=
 =?us-ascii?Q?BOMouynan6V61KEFmMNbnU75vuQtiqUj0SmLVK048OMchwdUGPodZOk35jo2?=
 =?us-ascii?Q?ezGwv6gtTyqG4p5kbK0Yh1dKp+TgjlrOTZyfv949kOkxK2myGRtHcrtnMH0K?=
 =?us-ascii?Q?kI/RawQYT3dvtXcrQTehWMxhbix47YSHDRZM9yDzET7Aj/2uiPJmbF+xSJXz?=
 =?us-ascii?Q?UDaA4JlxSzoAlBr+rsqvJ2UCRHuVxfqS5vZPvM3Na3DBo6ijqc8zG4tcpvyM?=
 =?us-ascii?Q?AJc0SZb9Ttl8FztvDpTQXpt5K24MRrM23tAYCt0DuOe8/UJDcTHIfdd9dKEG?=
 =?us-ascii?Q?xMaqShA2Zgy9nYP1Y1gWC4SM52jxhabtqix9jYSf6W2U8EQn3RRu8x2s98Ej?=
 =?us-ascii?Q?fsqKYnrXBKCiUvGrRbpBRMMh9FlRsSoCV5zxtaW/dO3zIsRukJXW3QdRQkD0?=
 =?us-ascii?Q?N7rK15H4db6KRTcGICn2jPZNZdAAZ1Y3OULosFtQbVF+utGY2V11wTblEOaU?=
 =?us-ascii?Q?e2Z7SfBxxmNRT4CJ7SczO0C1dH23pHMrd+CdBuEywxSVYPMQIDKcBOO0Bzlf?=
 =?us-ascii?Q?n/FpqIoGHsq+S2T9rwB55eYVcfIZ0mhCOou3nOncw8E4rUlR27/7pNxNCDBx?=
 =?us-ascii?Q?0Qysr8c3naoIM/gumHP4Mgk+i8DdmFl9hqIoKGAq70wo6z6h0c4n/P0vGh8M?=
 =?us-ascii?Q?w2r+v2QeX4TSKQEH98Cr/MiYwNyN?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9GEl+U54Brjm4crl6wL25iWBg90esLHMNdiUfN3B6yOtB54MkjHCXYkRaFc9?=
 =?us-ascii?Q?z918fGsRbz+2YNIWKFaVznJE8hBYqqEVIJwPOIjp+RWaKR3VoKbDE0e3TAeK?=
 =?us-ascii?Q?+Ikn1NEQ15Odsd/teF2iq3xj6DFwhK+xLNWiptMwtgfhASYDJVtnOqxPsNO8?=
 =?us-ascii?Q?iBm3fneawbzNHcDkua13X+njPz3+zvAmSxVEy67YblDPv9ZVbxULqPzgjron?=
 =?us-ascii?Q?nXrxLVz815Su9VoxDmBFZcURmSCFTHtCl2HQ/26cW3e9ci11lMguTNPkDOvS?=
 =?us-ascii?Q?9leXa9K0jxiAxx5rw+9osUkiR7ik0Sypn3oXqjuR+EYRalBXECo8heM/LPhZ?=
 =?us-ascii?Q?aHPCXBjoX0XhFHgItSoQzv3kWpmcqroXb+eWhVdm80Dwgp1riaMvHu5j9dI9?=
 =?us-ascii?Q?5/bJOvfpz3QbMLlpPaQU8uToU+n1O6fZo+zcOk9CGBt+8GCPUoB1YHB/GxIE?=
 =?us-ascii?Q?YzqjG25sIrzMndDU3wk+SxDnc7Aeblg4xkmvAcZ9fx20IyozLCtYfpKc74kg?=
 =?us-ascii?Q?2ufRm1D/8NVxxbVA33xyIVYPih0IuiS2B/5IYVsj/YA+Oi5lWCSp8GQkiGj2?=
 =?us-ascii?Q?Z9Owv9PAHtLifMXlfDeL25Nw3KCX+5SyoDvIe8qMNcAneW6hBsXN8LrjYWIX?=
 =?us-ascii?Q?VjbDB1Ebc1JhGPzUCvqHXvvzEcIDZcrkNoPzLHBpwG0DGUB1tcQmciJ5Rg1m?=
 =?us-ascii?Q?O769woPd6IJpOzSdtTDc5EetM1zZIMANLQ64ghGdA1D/MYzhJFpjz65MmyrA?=
 =?us-ascii?Q?C5hVBU0tzx10t+dAbpC8Lp1BoJJ3FQ6K3L14jQhfWjrHJnYAnP2G0FiIBQhr?=
 =?us-ascii?Q?dswjUwM4WXNxQx+wN9qvHgOWw5bRMalaztQzJLXJ8prha4mBSpg988YohCJ7?=
 =?us-ascii?Q?eVwUxGBAQPvkiGbYHb92Uy2G4CAUOoZ08J8oUYwxAVfrB0e1Egiu2+RTEVAM?=
 =?us-ascii?Q?G9ywKOZJkh3uwPqIuMO3dbtwnrrI+5SRz7A+8adCLWcHHaX/UgwIe4AxfbMu?=
 =?us-ascii?Q?V2LQNlBJBsgmoPZ/AJL3Srpo7aTLIlGIjIJVdXjIxLxbE3p5j4nblJZW8XIu?=
 =?us-ascii?Q?Ca8Uf0clIy6sYRavoY4Yr5TyYmQpH4HHPQheI7FG+77B0shMCtIsj5/8+zvJ?=
 =?us-ascii?Q?44cVeWxfmgXqdPHSSm/vN5dNBLMYNFBYqA32i7jkdbJFE9ZFxs0CZOPuuJVb?=
 =?us-ascii?Q?UjVcQwnU1EkdXL9h4oD6r5AmFCSk1wtmOx75cZmO8S1+ELyaiMEvbOLETBFz?=
 =?us-ascii?Q?vRKIJ/6YTaxKcB4tRf6V9Rf/LEWs9hi+10cIP5ylZMpfCtAbckoYqc3nEqhp?=
 =?us-ascii?Q?0U0qDqUaGFFhmMg+hcvNNIfaC15HL1PsciQU1CSaLv3fss1hVOYPXPZyxob9?=
 =?us-ascii?Q?obrRk2FAw83PkaJtLqQ1KFjGNvtyMh29DvHBmV1HQy09KwZ+TfloZcnZOHVP?=
 =?us-ascii?Q?s4USxUnVaGXvdbh+RQUNcO6+xhQS0BN7+jA2HyYCQcHOt/3I78Bw1ODTxVen?=
 =?us-ascii?Q?5+tQsZB+9E8BL5A5uSGEt9CxDoRbdr9hAdjlD9I43eOWXTMHuJSxkCTX8A1u?=
 =?us-ascii?Q?1k2s8VUCrtEGyDrLzdEpOCjnmeVfd35Z3glWx2NF82tupvcjdZ9ohBe3yk1t?=
 =?us-ascii?Q?2Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dad048f3-e1df-42d1-32ad-08dd35574c90
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2025 11:25:22.0636 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ttq2R537N0QlSvAIJ1Xm4jJyWAgicgyy9orcLGKk5kOs78f78a823fgLrw9T+u7gmRjCJixaqQ4P7A5fHUtSzg7q1td1ZavOanUag38yxVg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5866
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi,

On Tue, Jan 14, 2025 at 01:29:54PM -0800, Matt Roper wrote:
> On Tue, Jan 14, 2025 at 12:38:53PM -0800, Matt Atwood wrote:
> > From: Francois Dugast <francois.dugast@intel.com>
> > 
> > On Xe3, the register used to indicate which L3 banks are enabled on
> > the system is a new one called MIRROR_L3BANK_ENABLE. Each bit
> > represents one bank enabled in each node.
> > Extend the existing topology code for Xe3 to read this register and
> > generate the correct L3 bank mask, which can be read by user space
> > throug the topology query.
> > 
> > Bspec: 72573, 73439
> > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
> > ---
> >  drivers/gpu/drm/xe/regs/xe_gt_regs.h |  3 +++
> >  drivers/gpu/drm/xe/xe_gt_topology.c  | 16 +++++++++++++---
> >  2 files changed, 16 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > index b4283ac030f4..096859072396 100644
> > --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > @@ -221,6 +221,9 @@
> >  
> >  #define MIRROR_FUSE1				XE_REG(0x911c)
> >  
> > +#define MIRROR_L3BANK_ENABLE			XE_REG(0x9130)
> > +#define   XE3_L3BANK_ENABLE			REG_GENMASK(31, 0)
> > +
> >  #define XELP_EU_ENABLE				XE_REG(0x9134)	/* "_DISABLE" on Xe_LP */
> >  #define   XELP_EU_MASK				REG_GENMASK(7, 0)
> >  #define XELP_GT_SLICE_ENABLE			XE_REG(0x9138)
> > diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
> > index df2042db7ee6..516c81e3b8dd 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_topology.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_topology.c
> > @@ -129,7 +129,8 @@ static void
> >  load_l3_bank_mask(struct xe_gt *gt, xe_l3_bank_mask_t l3_bank_mask)
> >  {
> >  	struct xe_device *xe = gt_to_xe(gt);
> > -	u32 fuse3 = xe_mmio_read32(&gt->mmio, MIRROR_FUSE3);
> > +	struct xe_mmio *mmio = &gt->mmio;
> > +	u32 fuse3 = xe_mmio_read32(mmio, MIRROR_FUSE3);
> >  
> >  	/*
> >  	 * PTL platforms with media version 30.00 do not provide proper values
> > @@ -143,7 +144,16 @@ load_l3_bank_mask(struct xe_gt *gt, xe_l3_bank_mask_t l3_bank_mask)
> >  	if (XE_WA(gt, no_media_l3))
> >  		return;
> >  
> > -	if (GRAPHICS_VER(xe) >= 20) {
> > +	if (GRAPHICS_VER(xe) >= 30) {
> > +		xe_l3_bank_mask_t per_node = {};
> > +		u32 meml3_en = REG_FIELD_GET(XE2_NODE_ENABLE_MASK, fuse3);
> > +		u32 mirror_l3bank_enable = xe_mmio_read32(mmio, MIRROR_L3BANK_ENABLE);
> > +		u32 bank_val = REG_FIELD_GET(XE3_L3BANK_ENABLE, mirror_l3bank_enable);
> > +
> > +		bitmap_from_arr32(per_node, &bank_val, 32);
> 
> Doesn't each bit in L3BANK_ENABLE represent a pair of banks rather than
> a single bank?  It doesn't look like that's accounted for here.

On this platform, MEML3_EN represents enabled nodes, which can be 0x1 (1 node)
or 0x3 (2 nodes). L3BANK_ENABLE represents enabled banks in each enabled node.

If 2 nodes are enabled, each bit in L3BANK_ENABLE will account for 2 banks in
the resulting mask, one in each bank, thanks to gen_l3_mask_from_pattern().

For example, if 2 nodes are enabled with 8 banks each then:
  meml3_en = 0x3
  per_node = 0xf
  l3_bank_mask = 0x0000000f0000000f

This seems correct.

Francois

> 
> 
> Matt
> 
> > +		gen_l3_mask_from_pattern(xe, l3_bank_mask, per_node, 32,
> > +					 meml3_en);
> > +	} else if (GRAPHICS_VER(xe) >= 20) {
> >  		xe_l3_bank_mask_t per_node = {};
> >  		u32 meml3_en = REG_FIELD_GET(XE2_NODE_ENABLE_MASK, fuse3);
> >  		u32 bank_val = REG_FIELD_GET(XE2_GT_L3_MODE_MASK, fuse3);
> > @@ -155,7 +165,7 @@ load_l3_bank_mask(struct xe_gt *gt, xe_l3_bank_mask_t l3_bank_mask)
> >  		xe_l3_bank_mask_t per_node = {};
> >  		xe_l3_bank_mask_t per_mask_bit = {};
> >  		u32 meml3_en = REG_FIELD_GET(MEML3_EN_MASK, fuse3);
> > -		u32 fuse4 = xe_mmio_read32(&gt->mmio, XEHP_FUSE4);
> > +		u32 fuse4 = xe_mmio_read32(mmio, XEHP_FUSE4);
> >  		u32 bank_val = REG_FIELD_GET(GT_L3_EXC_MASK, fuse4);
> >  
> >  		bitmap_set_value8(per_mask_bit, 0x3, 0);
> > -- 
> > 2.45.0
> > 
> 
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
