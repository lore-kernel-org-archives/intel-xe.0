Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D68DCCCD1BE
	for <intel-xe@archiver.kernel.org>; Wed, 22 Oct 2025 23:19:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 996B410E1C2;
	Wed, 22 Oct 2025 23:19:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E5fJ8+YN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46EB910E1C2
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Oct 2025 23:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761175158; x=1792711158;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=HJJS/7TFDnzp386R+16HJwDzfDqVl5P7keA24fyThHI=;
 b=E5fJ8+YN1ZKXmvAC9Q22U6PblHmczjO+k3J2eeRQSAMwOStRHo44Kc59
 5CrTzBysIKV0L8oI2FRXv4ofQyxvl/LhUPMQCeGzvbyggeZI2L2PXr12M
 U14NgT4cTmVwHOa6SzDFI2ix4SJVcZjt14MHqEbgEqXZS+hW+ln+Q1NIS
 H8AKhUvxLKR0ApzkzqKkyMvoWEXVQnalmzJWv1anEVLlxewxv56a8IuQF
 UY29WBPnKsTcueKTML2rlH86kTBmnpaBPTmZu3ZFqY3rqYaMmXkYK8WGO
 T0JH6tmKVY/fYxtikrZ0n73JknO4KL/d6xGbtKcwAHC/1BtCYl2uq+ar+ Q==;
X-CSE-ConnectionGUID: YdfNM08WSYC8uNd83OLN2Q==
X-CSE-MsgGUID: AppJPSC9TP6Of33a13+kMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="80773927"
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; d="scan'208";a="80773927"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 16:19:18 -0700
X-CSE-ConnectionGUID: ZBWZnGcOQ3CZ+Wy75fFasQ==
X-CSE-MsgGUID: YTT4W8VnTnekaAPfvuji4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; d="scan'208";a="188041462"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 16:19:18 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 16:19:17 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 22 Oct 2025 16:19:17 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.36) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 16:19:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hc2ae4qJcgGDiF8GD/whV81B547Z1+8knVpqvhdSjq1RtwhsmYG0Hk9Cum/FwmQs3RxFtKDQgBMkyGkjljXAbyprbFQBV39I1TBqPdwblvT/RTGk8c/z6CJWXgxsZ0bhtyWClWJ3YpFzli9L/9dBINaiT6oHg/JVbyxmavvm+EtETo08927Kitm9E+qR6f+zhzeJh4Z5+jiMhICFkgonQb6kyvSXB+CMe9fWD3fU3ZJ2m3FT/IfwMqnYXUUIhpcfLaNjZ79pTjEyPtuTaD8qxwggi+fvG/sei71oXOhDeOgOQ/6OnaWXN2QM2n5zcRXqgKxxNZdhDdSF6Aoag9MbTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4YJ0KHCctA4lEnj/fxsi1xy+itHtIBSM4c7/AcMHvwM=;
 b=m01AdbbFl1gfJTzUZwF1xqwv/ORz16KlUqXMjZH47WF5d1JYzv370KwxKddrtHIbsZ/LGIHotzuQ1Up2OcYZggWpZBhLzVzP5eACbLP3PxjcAW93Ym6b82y7rhfOfaMREs3BnY/d05Eudi2PV7oDYpwws0RrWJFFJlTvAmeIyi3Dnebx3qSEg02lgisQkPt4dQmGyHOCmkZWa0Px2Aern+m+UcnekOoQNv8ojdMss7Hhlg6AByCMQ1pz+mV8BtgGqox5XvJp8dx4Yp0zYQ/TttUJWhH4Yg2Tah8ZD7gH0SdmKKdndrXJFbt3g+yGKl5qvKixHMi5ESRvaIgjccNkQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CY5PR11MB6367.namprd11.prod.outlook.com (2603:10b6:930:39::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Wed, 22 Oct
 2025 23:19:15 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%4]) with mapi id 15.20.9253.011; Wed, 22 Oct 2025
 23:19:15 +0000
Date: Wed, 22 Oct 2025 16:19:12 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lukasz Laguna <lukasz.laguna@intel.com>
Subject: Re: [PATCH 10/12] drm/xe: Handle MERT interrupts
Message-ID: <20251022231912.GZ5409@mdroper-desk1.amr.corp.intel.com>
References: <20251021-cri-v1-0-bf11e61d9f49@intel.com>
 <20251021-cri-v1-10-bf11e61d9f49@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251021-cri-v1-10-bf11e61d9f49@intel.com>
X-ClientProxiedBy: SJ0PR03CA0211.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::6) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CY5PR11MB6367:EE_
X-MS-Office365-Filtering-Correlation-Id: 3099e632-1f37-4839-bb37-08de11c16b05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UBXt/1QGJR0V16TbcyYZW1VwwbuDq9cxsr4Ln9hciFDc0jOvloUf36RUQ8XK?=
 =?us-ascii?Q?WoDwhMUJ+3cv+w7sfBlvgHzHILdnIOJTndJnhNmmowGVj539/gTHR049XXp2?=
 =?us-ascii?Q?6zvKdeSCOUAlJaVg34JmbL+0++99MTvPpmZyQP5lkEjtB8PnysIX74jU0s/U?=
 =?us-ascii?Q?cOw7FJNEZi6l4/Jy11OJJI52TbeMMYHzJCoVqkbEF51dMPbUTQAnC7mS9ySM?=
 =?us-ascii?Q?X3gemeHHx9SWUB/W2U8HFLZmK0DwDQ87mLZUXyrfs1Dy5xs1V89rkUvY6L1I?=
 =?us-ascii?Q?Fj+xQktbgOSuuMRl5tknpEcNe48EHCBAQDBOFACJb2eWo9B/D9hOolEzzUEj?=
 =?us-ascii?Q?U1WKeKGmWEPwQ6vegI2khKQ7cJa/QoKXy1JwFasuqcEV2D+ueB3Jrwpu7CkV?=
 =?us-ascii?Q?qLn9pyPyL0Kj47eRtv8fylwseQ2V/Ny4vBx4IxHTzP3lMaqMZqt2itvBwdkb?=
 =?us-ascii?Q?FLQeT2tK6jfcMUSp4pBlFWyDQi70nWv2DWglz8Vvt6UGGtWVC0BwP8vOrgWQ?=
 =?us-ascii?Q?lMcLHw1Kfb2HO6h6fwj9W8g7G+f/6UKR+x1ldOY5a1HHr3S6XvDHBixAKck9?=
 =?us-ascii?Q?GNXHa+QxBi/k9zQOcsMDu8t3vJQzJ3ZvibC5SLyOXTrV7FqpmKtl01/0q8Yn?=
 =?us-ascii?Q?9cp47bUBAn5CQ/aTaFgyra6AGe2LVB+ynx+U++5jutNgNbzpddtK94VNNVI8?=
 =?us-ascii?Q?4mTc+y2ZHHSShwY2gJxU/dDDFIXXegn4qJpq0L+kt++1tTiKV4Mdk3KK62df?=
 =?us-ascii?Q?Lmc9tNm0O+JYTse3NaI9dsi8EbuMprkLYovtvK3VaVMyZWQtIle6M/83VXIF?=
 =?us-ascii?Q?vcFs1TYmVG5X0CubYaRgUQ67cBmv2VWykaYAsnrs0eYU5EHIByFZW0krXFZi?=
 =?us-ascii?Q?m971x50dReFgfKo/dZCkAKW2h0Cb6/gO0Gjfg6260IVPr9iyEKqzEPW4J47Q?=
 =?us-ascii?Q?i5ldBInHtQ1QGPH4MTUr7oYXrL7eJW37XOocZZfDE01ENO0oIqYIHJKXRK+j?=
 =?us-ascii?Q?Bf3WVIEPnDX1+DbyRrzWnyusuUOUhMLelyKLsssXlKiZCHAxpG2hnm+/c9v8?=
 =?us-ascii?Q?8NoYUXA/KgTi+orufEmiz6ZS4A0d2Y6zZ/vXabNEDiavRa2BX+ZecXHPpZsr?=
 =?us-ascii?Q?NWopkSAmXZmDgZpUUpoNIa7tMCaTfLpGPYK9zKi+jEAcowrqWdYwrAtTRU1S?=
 =?us-ascii?Q?13MBcECtTRDVYNc6M00spzaZ5RYTsVekXGjgEFt6TgmNge39mKOGQkJAij64?=
 =?us-ascii?Q?OTexqZzBEW0YARpsCp1Z9E4SHvR94l7SSrDlLXvqTh0nRJuWC+GKxUwJ4R3X?=
 =?us-ascii?Q?6w0g47ugs75hKkK3kVGRcngQxbxDKC2T2icfM23MJW3akAIPQbAyQDtHsM24?=
 =?us-ascii?Q?v+GbpDtuZYAZRVSw4UGjyoUhE2z2xqo4rYc6vVQeuCvjHoFUW73JZXwZMe7x?=
 =?us-ascii?Q?T9zG9GTmrvfttqR2DT7cz2jQfRbg+ZR9?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jFKN2rt2ECq6/pI5YzMnlOf5r5NUfBqPjCCxFA9BedBddbFNSDpZTdS56so4?=
 =?us-ascii?Q?OV6+WRgIPpcojnDHmSe66NJUX1+1xTXXZnQxN/+zuNjUWwTPaUIT1IPtBeqk?=
 =?us-ascii?Q?SlsAjp6t1hi4N19QcwBaSFkOUEvAks0WxBBpW1GPVgPP1rmVOKEq2cscr4sT?=
 =?us-ascii?Q?dEko6LmeN8l13wqipalX71gbQyh6IVotZeTlTfOoj3tLxdqqARQv8rExKTlV?=
 =?us-ascii?Q?unpK/uEJXc9kzJwKlry5FGLfPgAHSGaRFJpoOw1TNT09S1IC+6ki/alNy2SB?=
 =?us-ascii?Q?CeW3D5iwNayYyy57+p1s1xCDAVJHgIx3V0WHK6t213wsmohJXtaG4Cp6zOFH?=
 =?us-ascii?Q?IG0t/LlA7R9cCnvfkHhGlJW6GkARUo8+eLyKv49bHZ8N8j6GhsqAjzp1wc+L?=
 =?us-ascii?Q?M75ZZF4CRtoQng1rnaaG/IOK2tD0krn3KG2UHI9pUZ/j0vIBd/z7Ty0sKLLS?=
 =?us-ascii?Q?h+XBKU+ygQzdiEpwTsQD/rgcI2QE4/ytYzSjJvFNaBnHZmcQ3Fp/8HFK87qw?=
 =?us-ascii?Q?uXuUbi34nzMUZB2iM/O3dmBGe4RwK9bsWKrZq849Ug1b6uCOwShduAdQABD4?=
 =?us-ascii?Q?4q5yf77/0PaojV6AfD7oXLeG2sNJpjh6METYob9FrgD/ERBvekQ40ILEIpd0?=
 =?us-ascii?Q?fp1aiYfJH54hedeulFxHQ/7/uNEA/erWW83/T2A7ubJNqsz9ars6WFzZyQvO?=
 =?us-ascii?Q?SbyLORVcrhg6ZA9xQf51BYoynyIqqmbI0YJlhbQ2lf165V3JAcT5/uPwLgs7?=
 =?us-ascii?Q?yaui0FaKCQhZw9KDeptRU4wE7fVBEV7xE0OW1GpujY6qMT1b+8nGe/q3WDEV?=
 =?us-ascii?Q?RWo7IxjkYDY9PVt20UBIx9A2DjPkGsOidf88aG8r/sgkfBwLH9+DVxBxD9Bc?=
 =?us-ascii?Q?+F4deqfo/3bUPWv6pJmx/DjZcq9bPjBZ2yzKhYGwHNR+r8zOBcdKw5AJQmDR?=
 =?us-ascii?Q?eW+pEZiHjRb4AObZU2lJXh0iBnnLttGdBYZSt1lJ4UoXcSDLxW170VPrkX9w?=
 =?us-ascii?Q?cvImgvMgzCF6LgwIFhwA3R9RowVX+iIMv8eR3VH3PBqvq53UR1waoMwYVBgH?=
 =?us-ascii?Q?xcZ93ZNfCXChFTUD1MDcPpfL1i9cA+J0Ohs/3hlYUHVST7m0O2jTv4qKA4N/?=
 =?us-ascii?Q?5LVzHmniQzcwnwUbpUEZCjPVhx6HJI7IVd53M86B4oGThWbJjPskyqKlhMHR?=
 =?us-ascii?Q?XmtJJ6nwh8IDxb0eyz5mbCe6PYVVVA2kYLcY2s+wb7TvUtdIi427pvrYUjW0?=
 =?us-ascii?Q?ntlGgFkbRfpK9/w08OZd6MjOw8UKBh3cTmmGsXhK0CwqonS/6RERS+A3T4Rx?=
 =?us-ascii?Q?lr86SRq00AJruWA19kUom/caovbr05WoCCZVkmZyGmJvBlrs3x2F4vaPnOt5?=
 =?us-ascii?Q?eruFQnQ41woIJ/J67yhrifK5uoAE/Pn3wZSLXrQaectBl2Hlj/HRYeGb6pZT?=
 =?us-ascii?Q?BiUJzfGtyecCWZTT3y6wmGw2VWDB/Opu71uR3jogze6G5ej+zGNDsgy5/ByK?=
 =?us-ascii?Q?YrvOVyX3dA59WSHRZSjuU1nijgvhgzV451K0hZye5KUkTxeYPILpBGATKft3?=
 =?us-ascii?Q?0b3jtsv1UKksJo7fha8uZj0dVKv8mWGRqD0lAIAN+a/gBrI7krvBfWSzZlEK?=
 =?us-ascii?Q?yg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3099e632-1f37-4839-bb37-08de11c16b05
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 23:19:15.6205 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cpkBtBjl6VW90b7uhDY+IeOWyM5jBLslH3hCTKFImDb8gVGAudNp39kBp6GGGfcVYTzcXCwwQufPsDA2ezCeYryOcuQZuBlJ6tbFb7q52ic=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6367
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

On Tue, Oct 21, 2025 at 10:17:42PM -0700, Lucas De Marchi wrote:
> From: Lukasz Laguna <lukasz.laguna@intel.com>
> 
> The MERT interrupts are indicated via bit 13 in the GFX master interrupt
> register. Detect these interrupts and start supporting them.

This patch doesn't actually do anything yet; I don't think it needs to
exist on its own.  Can we just squash it into patch #12 where the
interrupt starts being handled?


Matt

> 
> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_irq_regs.h | 1 +
>  drivers/gpu/drm/xe/xe_irq.c           | 7 +++++++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_irq_regs.h b/drivers/gpu/drm/xe/regs/xe_irq_regs.h
> index 2f97662d958de..9d74f454d3ffd 100644
> --- a/drivers/gpu/drm/xe/regs/xe_irq_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_irq_regs.h
> @@ -20,6 +20,7 @@
>  #define   GU_MISC_IRQ				REG_BIT(29)
>  #define   ERROR_IRQ(x)				REG_BIT(26 + (x))
>  #define   DISPLAY_IRQ				REG_BIT(16)
> +#define   SOC_H2DMEMINT_IRQ			REG_BIT(13)
>  #define   I2C_IRQ				REG_BIT(12)
>  #define   GT_DW_IRQ(x)				REG_BIT(x)
>  
> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> index e5ed0242f7b1d..011b5eb66102f 100644
> --- a/drivers/gpu/drm/xe/xe_irq.c
> +++ b/drivers/gpu/drm/xe/xe_irq.c
> @@ -466,6 +466,12 @@ static void dg1_intr_enable(struct xe_device *xe, bool stall)
>  		xe_mmio_read32(mmio, DG1_MSTR_TILE_INTR);
>  }
>  
> +static void mert_irq_handler(struct xe_device *xe, u32 master_ctl)
> +{
> +	if (!(master_ctl & SOC_H2DMEMINT_IRQ))
> +		return;
> +}
> +
>  /*
>   * Top-level interrupt handler for Xe_LP+ and beyond.  These platforms have
>   * a "master tile" interrupt register which must be consulted before the
> @@ -525,6 +531,7 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
>  				xe_heci_csc_irq_handler(xe, master_ctl);
>  			xe_display_irq_handler(xe, master_ctl);
>  			xe_i2c_irq_handler(xe, master_ctl);
> +			mert_irq_handler(xe, master_ctl);
>  			gu_misc_iir = gu_misc_irq_ack(xe, master_ctl);
>  		}
>  	}
> 
> -- 
> 2.51.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
