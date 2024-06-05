Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1520C25B76
	for <intel-xe@archiver.kernel.org>; Wed,  5 Jun 2024 22:06:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 201D710E148;
	Wed,  5 Jun 2024 22:06:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UoC3agd/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7708810E148
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Jun 2024 22:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717625163; x=1749161163;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=qVJwLPbPC2wfEoGixj/pdB+HhWu3owq7hHaYJGFoanM=;
 b=UoC3agd/owU3jAaF5ANRKBZkVVTaVJ698VDwWUlV+ztW4/L2g4iUae5H
 X/cqho5jwIGQVBEPFHFztG1h1I/xxL1dlwLZL2eaKuBNluZq88VIaTNwC
 Lwu5LL5Xd7Sx1w3foAJYX4zz+35kYxNHS4NLFkCZxUUck0j4h+Gc1WBZF
 qtZiOU9HY48y7khOmRr7LNT/jreLHIE0Up9ZKG5DQ58K7pF7+RvJoryrT
 wOucVT8zLu9QZuVRARt1oL9tputf07IAOE3RKp1ov5VWcvJcQg8gWJusQ
 6UslI3BaFy5b00IOLfB0lctUMlAxu7uK7dIF1tpt9ASGs41lN9pTbG3W/ w==;
X-CSE-ConnectionGUID: rbEW/6T5RVaoi4UF38quLA==
X-CSE-MsgGUID: Tt1q9xzrSWyrbqBplDMPLA==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="24894783"
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000"; d="scan'208";a="24894783"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 15:05:58 -0700
X-CSE-ConnectionGUID: gVNkdGDJQgmoQt7wsLBP/Q==
X-CSE-MsgGUID: tR7NEkA6SMuMYjHaOnulmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000"; d="scan'208";a="42308362"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Jun 2024 15:05:58 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 5 Jun 2024 15:05:57 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 5 Jun 2024 15:05:57 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.44) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 5 Jun 2024 15:05:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M0fwMGYdZ9dhenWe+pP10U12zgN9rJ3pXvjWL6Exny8kM1OpfdmIrfmuuHT85ivDH4cLNAnE4goWj8MR5YmIGR0X37lifWOvbgb7r68NOmPZEIbSQYBNVaZdK3XVVf1kckoTJrYvbaFDo/qstDDiU5a5hkX8uZgEgoGtN6qP0TqAumET0zfbty7y3VrYTceZfntPhaUz7l1ghRCerw1FAWk7nTQawY7myTcmQmMq8fK141OKDq7qVgbgy/6CSto8F22JzruKuwyWuH+DtQmdkVDNu+d0M2joP0HOpHNyu6aEClW0kHA+JIyTV2US5fC37GVBngnhNJ0az97qLKqzaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JZsjXRwKees3qPSh1vM45PCqHnDYeI+OWfAGIWYdhPg=;
 b=Tpe8ku96Xoz1huqTAG00Bjx6LSi5tMMGh2ZQD3/M/m+o7fnyBPPcT3lue4fGvE5YmDN5eP2c/LR3uXVRnQlYY6eZZlMQTNx+wKOjEWnoOx9JS12WGl379Ws6sehcShCfxJCq2/e8zHOwl+eUyPV4UDuDTzIKrzlC/6XkMYSpy5Ek5WecxH7e7fKy/P195BNxursqew9nqWAXw7MYkVrg4q2kWSDGZC/E6++gRobcQwqkVA71qqbP4hv07Pe/EWz2Tehxl+IWzcR8pqBj4f8j0QyOqhT0XgMvmMCJ24VbElNBCeMRn5zHq8ViRkgYd1hEKbw1TV7AcVZ13d6ltNn5Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by PH8PR11MB7992.namprd11.prod.outlook.com (2603:10b6:510:25b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.27; Wed, 5 Jun
 2024 22:05:55 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7633.021; Wed, 5 Jun 2024
 22:05:54 +0000
Date: Wed, 5 Jun 2024 18:05:52 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Badal Nilawar <badal.nilawar@intel.com>
Subject: Re: [PATCH v3 1/3] drm/xe: Cleanup force wake registers bit
 definitions
Message-ID: <ZmDhQJLrleUjetIX@intel.com>
References: <20240605095005.1261268-1-himal.prasad.ghimiray@intel.com>
 <ZmCgJoLGcLLUqInY@intel.com>
 <e8f27a5c-f2ee-43cc-accc-4a5b375bcb81@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <e8f27a5c-f2ee-43cc-accc-4a5b375bcb81@intel.com>
X-ClientProxiedBy: BYAPR11CA0049.namprd11.prod.outlook.com
 (2603:10b6:a03:80::26) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|PH8PR11MB7992:EE_
X-MS-Office365-Filtering-Correlation-Id: b4f5fdca-0443-4b60-4e0c-08dc85ababbe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YG7Sqip9z7wtZi7w1SK61b+QoGyXmaixGcRxzbMlQqhXrY/PJb2LvEKqGGCE?=
 =?us-ascii?Q?ySGjbk5lrmhy9kH/yVhmes9PgY91ABT5jcVZrIOmNcM1S82pceHnwNLgay2l?=
 =?us-ascii?Q?78CqtzYZkGv7Gx8PQBDVIvtFVSD21AQJi+pOmwoG7vdYgwc/8pQiQzOXT66G?=
 =?us-ascii?Q?koNriTwcx9gYJNSQ3oVonhkLZAfwccjx4DwR/X9VIC/sW/HdCfR5UNb9AkKC?=
 =?us-ascii?Q?iCz0AWhviOHSAY6K9TDe//m6NrDFyHSO59XHJ/CkuxHRZmaPRTTC1qES8LJ7?=
 =?us-ascii?Q?HuObtExVuSpIBZpEN6yxODiEdrKtBFUL08GNw0D70anzng8FEHIkMwlCzeso?=
 =?us-ascii?Q?cRx4oZVKuSVDQd4fRxa85dQ3IrfTESMTfW7oBgC/9bxbG5vn8HsX2cjVz42q?=
 =?us-ascii?Q?mUXyIiYHxh4N3hL9qt+/7cswgPkQk208AsGAAvdAEJNALLGpaK49jDAi4Xk/?=
 =?us-ascii?Q?IN7Ljkh3aDSmQpmrS6uaAZNAK3JZK7AVvFUpAB1q0M9/Wrv6D/CSmEyMxro1?=
 =?us-ascii?Q?ZVdEWYNe/03lOpxcyq0T2oznoaD6ftvoHiSvEPZH25xdE5Yi2Xr+sealwMkG?=
 =?us-ascii?Q?1XhJcm2/QUF1CQH1x6goRqbF933WOTaU+lOulycK6ppDDBSCzwZXCR5gyVEG?=
 =?us-ascii?Q?HA+pFatmFx89hoVLPVCViTaVtGa+lmCYw8j/33DXOE1CdwtAQfY8glaxtwZ/?=
 =?us-ascii?Q?epO6R2jogywCxImeafIA/hfDzm8EZj7WsOn36eTspgdWx8mn4E06zQkHiOdx?=
 =?us-ascii?Q?Q6EsjlyjF21qMjyoAHMasq37Uqzxlw/VxOPPV3BPYge8vwz0/+3AWxPp25VZ?=
 =?us-ascii?Q?atnfwmOTWdtQBvRstsR96/yZogIDVwTjohzPviG2W1JW5vikz5fluysdMyZx?=
 =?us-ascii?Q?8PO4etb2qF5oXePovzHWuNBAlBqaqSB8pAuHPmDheIbA2Nj7FoOvbHZcraM4?=
 =?us-ascii?Q?1YjK7LCR661rUobOoFhPFbxCORx7juxCrPeeFHPX6zgrlN0zjjb9EX63ZJk+?=
 =?us-ascii?Q?OrOaQ0iD5UXtzMEL3aDThG09UySmGLY3iVsdfXNaedFSnjSurCOQ4ps4rFBB?=
 =?us-ascii?Q?dWfHQSiygyUhg0+HlUnjXKGH9JSZbbS6XxgAfGrDilyioGe2G/bBIl6pCC7X?=
 =?us-ascii?Q?giW1zivZWPH4qWGeLUgcRKYORgduOF4rlBj0cWD+J2ppN6Afp4nNqQdIfwhw?=
 =?us-ascii?Q?GEJlF9uAPBlq0Mk+sE3/4eBkqoaKdRn10vjrzD5d4r/la2n1eslCYyCypOoS?=
 =?us-ascii?Q?tHGoRD/N+gqTVT4N3Av/OEoIUd9mulo66XavxuQtRQt10vCIac1Ieq1kajrk?=
 =?us-ascii?Q?vPesRA0GB4LrxIX6rAsAdo1Q?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0zdHMBSJ6bsZZSuQoBaSdKMDh9xnEMp4SAXPVqCy7VUZrq/L9kpUXAOAnTwv?=
 =?us-ascii?Q?00T1jkQj3hCsrTcpPJVpZjRVvYfjmgCUapGuCl5fPkSMazx5nMC+XBM50YCM?=
 =?us-ascii?Q?/yRMhffpCpCcS+hwGkmRVIGNlWCIrOU8LDBHIrDf2N4NYa4j7PT7yh8hhmY6?=
 =?us-ascii?Q?sx6QZ/5lKhuDmqGuBwN6KXKsM+cbHP4Dbxz/QmVmxoFZhrG20h9YuqgaSUYN?=
 =?us-ascii?Q?0e5YMtFPT+riG8gIKA2NXytOqakpJq6pd/tJVb/3vkwizP+vlgoFhmURm6ig?=
 =?us-ascii?Q?erkKCS/9Bx6bBYWRAM1hffpjeMzJLn4xaat8YLFzh5SG2cOtotOA6dagMRE1?=
 =?us-ascii?Q?tl87sK7C+bAQ2+QDQut0M9chxe7UYVIah2jUL+O+3gQOa2zn9c/+oTGCVMQS?=
 =?us-ascii?Q?KnxpCkSy63K6qmdnzD1yUG+SPmqLa+3zY2+hILlLYT0yqrtAyQkAdX/le3UZ?=
 =?us-ascii?Q?S7cnDsc2NC0fsCxgbvd16V/O3qa+3zXFkw2LP7z2bMv7454GhdZRRZmWSDHZ?=
 =?us-ascii?Q?FyqFF6fGwV1mCTDPzHB68t7Qzy7tAjfhda0U0peW7RByDD82882ajG+kxaNW?=
 =?us-ascii?Q?iIzopMpuWw8awI537BtRB/Qsu+jZLhQqJuS/8epWit6jtBSzdoMXVRmeQQqE?=
 =?us-ascii?Q?VV3BvZbMLgeYG7wWfn7VcDWcHK0jMNXOVlWkMy6/dDIK1/BjlWRr+RWUiaHP?=
 =?us-ascii?Q?kBObHHnYz2jSfygb3dLdXUKnR8pWBmq8gzNRmB0A7ZhWcPnSTkulaavULxa0?=
 =?us-ascii?Q?gBuTB3jgiiMv2ic8OOG4VzSlSyS+bxE9l6SzQPcNfOpPrY7s5LcZ4umMKJKA?=
 =?us-ascii?Q?2gtyNQa3Oc49uvoe+Xd/OpPlqM2+bKQGfI+PnOz0b14/iqHBCwgxoiERX6pj?=
 =?us-ascii?Q?sOpGOT21j/zdLAe7VN6uKr13vP4AXWrOauxUzvyc1OOJ79TEBny70QnWl7kq?=
 =?us-ascii?Q?Wufyxh4DILNnVuJYXQ6rl2XxHT2qq3s8oskdNxuQpEjJDhhx76NJPmsBmpQz?=
 =?us-ascii?Q?t19kJlBpTpjaK5pTk2/AKnM+yIKxWwtghBRyNo/uci0ivUNah92qaHjviNSx?=
 =?us-ascii?Q?3E9e8lnR48YMnMZZx+uOI9woWgDRHMIAMqvUF4KH3HWkgSsz5RcDBLl9D2B1?=
 =?us-ascii?Q?uaNY8SnKNA5vMRP2Xz4p03NIfohudlg4cSwBnsyBGrFY/qYZhpRlYRDbeHTe?=
 =?us-ascii?Q?sMTHvAKvp/JW5zx/lWVqskQxT3s9sOtKe+sjCN9tHiE82aE5ZWZiAUltbvQi?=
 =?us-ascii?Q?byVCxrfCDLmeNTPKFcLtpddRscdWHUfaAB1G+fXL4FPRgNrpbglwxA0MKEjk?=
 =?us-ascii?Q?arasf/23GpM/1TTToLfED75kvU/AnRQEkeHuo6NF0txDl3rBrZLvs+g+VoaL?=
 =?us-ascii?Q?HxgFCy8HfY2DfIBPaxvTOcwyJYX+7LbB6vuIsiTpjSFUNt5+JY0mG69p8XYx?=
 =?us-ascii?Q?6VO/JHbkiBHz/B9wC0HPvY5Cl930KryiQWCmtRYO4NT8XPv3f9kYhvUlKpfK?=
 =?us-ascii?Q?V/5sGjQKLQNRZ/HQEAYkzRdVFCkNKlBQwrh1+mo9F7b4o9uvg+7Vp5ZDWa60?=
 =?us-ascii?Q?T8RIG6THMmnIhevSLUoEzEGOzUCLMnDYRplMqngK?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b4f5fdca-0443-4b60-4e0c-08dc85ababbe
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2024 22:05:54.8613 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s54y4Juy6nUshtNsz8u0cYaODOeAsUJ8ZcuIAlDG8G/TkTKPNC4dFF17+7q4mLtqg+KJTjblLtLSkVr5naMOzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7992
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

On Wed, Jun 05, 2024 at 11:14:48PM +0530, Ghimiray, Himal Prasad wrote:
> 
> 
> On 05-06-2024 22:58, Rodrigo Vivi wrote:
> > On Wed, Jun 05, 2024 at 03:20:03PM +0530, Himal Prasad Ghimiray wrote:
> > > - Remove unused bit definitions.
> > > - Driver uses BIT(0) for waking/sleeping the domain and since the
> > > registers are masked respective mask bit BIT(16) needs to be set. Use
> > > defines for these bits and use them in domain initialization.
> > > 
> > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > Cc: Badal Nilawar <badal.nilawar@intel.com>
> > > Suggested-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > > Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
> > > Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/regs/xe_gt_regs.h |  8 +++++---
> > >   drivers/gpu/drm/xe/xe_force_wake.c   | 18 ++++++++++++------
> > >   2 files changed, 17 insertions(+), 9 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > > index d09b2473259f..47c26c37608d 100644
> > > --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > > +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > > @@ -487,9 +487,11 @@
> > >   	((ccs) << ((cslice) * CCS_MODE_CSLICE_WIDTH))
> > >   #define FORCEWAKE_ACK_GT			XE_REG(0x130044)
> > > -#define   FORCEWAKE_KERNEL			BIT(0)
> > > -#define   FORCEWAKE_USER			BIT(1)
> > > -#define   FORCEWAKE_KERNEL_FALLBACK		BIT(15)
> > > +
> > > +/* Applicable for all FORCEWAKE_DOMAIN and FORCEWAKE_ACK_DOMAIN regs */
> > > +#define   FORCEWAKE_KERNEL			0
> > > +#define   FORCEWAKE_MT(bit)			BIT(bit)
> > > +#define   FORCEWAKE_MT_MASK(bit)		BIT((bit) + 16)
> > >   #define MTL_MEDIA_PERF_LIMIT_REASONS		XE_REG(0x138030)
> > >   #define MTL_MEDIA_MC6				XE_REG(0x138048)
> > > diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
> > > index 9bbe8a5040da..54279c3814af 100644
> > > --- a/drivers/gpu/drm/xe/xe_force_wake.c
> > > +++ b/drivers/gpu/drm/xe/xe_force_wake.c
> > > @@ -52,13 +52,15 @@ void xe_force_wake_init_gt(struct xe_gt *gt, struct xe_force_wake *fw)
> > >   			    XE_FW_DOMAIN_ID_GT,
> > >   			    FORCEWAKE_GT,
> > >   			    FORCEWAKE_ACK_GT_MTL,
> > > -			    BIT(0), BIT(16));
> > > +			    FORCEWAKE_MT(FORCEWAKE_KERNEL),
> > > +			    FORCEWAKE_MT_MASK(FORCEWAKE_KERNEL));
> > 
> > hmm.... looking at this now I believe it would be better to just pass the FORCEWAKE_KERNEL bit
> > number as param and then use the MT and MT_MASK inside the domain_init function...
> 
> Hmm makes sense. Do we expect to use any other bit apart from
> FORCEWAKE_KERNEL? If not, how about not passing FORCEWAKE_KERNEL at all and
> instead directly using MT and MT_MASK inside the domain_init function?

even better indeed!

> 
> > 
> > but up you... my rv-b remains whatever you decide.
> > 
> > >   	} else {
> > >   		domain_init(&fw->domains[XE_FW_DOMAIN_ID_GT],
> > >   			    XE_FW_DOMAIN_ID_GT,
> > >   			    FORCEWAKE_GT,
> > >   			    FORCEWAKE_ACK_GT,
> > > -			    BIT(0), BIT(16));
> > > +			    FORCEWAKE_MT(FORCEWAKE_KERNEL),
> > > +			    FORCEWAKE_MT_MASK(FORCEWAKE_KERNEL));
> > >   	}
> > >   }
> > > @@ -74,7 +76,8 @@ void xe_force_wake_init_engines(struct xe_gt *gt, struct xe_force_wake *fw)
> > >   			    XE_FW_DOMAIN_ID_RENDER,
> > >   			    FORCEWAKE_RENDER,
> > >   			    FORCEWAKE_ACK_RENDER,
> > > -			    BIT(0), BIT(16));
> > > +			    FORCEWAKE_MT(FORCEWAKE_KERNEL),
> > > +			    FORCEWAKE_MT_MASK(FORCEWAKE_KERNEL));
> > >   	for (i = XE_HW_ENGINE_VCS0, j = 0; i <= XE_HW_ENGINE_VCS7; ++i, ++j) {
> > >   		if (!(gt->info.engine_mask & BIT(i)))
> > > @@ -84,7 +87,8 @@ void xe_force_wake_init_engines(struct xe_gt *gt, struct xe_force_wake *fw)
> > >   			    XE_FW_DOMAIN_ID_MEDIA_VDBOX0 + j,
> > >   			    FORCEWAKE_MEDIA_VDBOX(j),
> > >   			    FORCEWAKE_ACK_MEDIA_VDBOX(j),
> > > -			    BIT(0), BIT(16));
> > > +			    FORCEWAKE_MT(FORCEWAKE_KERNEL),
> > > +			    FORCEWAKE_MT_MASK(FORCEWAKE_KERNEL));
> > >   	}
> > >   	for (i = XE_HW_ENGINE_VECS0, j = 0; i <= XE_HW_ENGINE_VECS3; ++i, ++j) {
> > > @@ -95,7 +99,8 @@ void xe_force_wake_init_engines(struct xe_gt *gt, struct xe_force_wake *fw)
> > >   			    XE_FW_DOMAIN_ID_MEDIA_VEBOX0 + j,
> > >   			    FORCEWAKE_MEDIA_VEBOX(j),
> > >   			    FORCEWAKE_ACK_MEDIA_VEBOX(j),
> > > -			    BIT(0), BIT(16));
> > > +			    FORCEWAKE_MT(FORCEWAKE_KERNEL),
> > > +			    FORCEWAKE_MT_MASK(FORCEWAKE_KERNEL));
> > >   	}
> > >   	if (gt->info.engine_mask & BIT(XE_HW_ENGINE_GSCCS0))
> > > @@ -103,7 +108,8 @@ void xe_force_wake_init_engines(struct xe_gt *gt, struct xe_force_wake *fw)
> > >   			    XE_FW_DOMAIN_ID_GSC,
> > >   			    FORCEWAKE_GSC,
> > >   			    FORCEWAKE_ACK_GSC,
> > > -			    BIT(0), BIT(16));
> > > +			    FORCEWAKE_MT(FORCEWAKE_KERNEL),
> > > +			    FORCEWAKE_MT_MASK(FORCEWAKE_KERNEL));
> > >   }
> > >   static void domain_wake(struct xe_gt *gt, struct xe_force_wake_domain *domain)
> > > -- 
> > > 2.25.1
> > > 
