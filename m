Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81889FF5107
	for <intel-xe@archiver.kernel.org>; Tue,  7 Apr 2026 15:22:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DE8610E0C7;
	Tue,  7 Apr 2026 15:22:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M6a/RS8L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E746410E0C7
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Apr 2026 15:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775575373; x=1807111373;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=0SWaF73pNR4j/a96hBXBfaRA3lz4NTtfQ11GfXHXXB8=;
 b=M6a/RS8LYDgbI1n0+z67Ne/wzfWPjJ+XYFhQfEgxsT0sR4/ZbuzKyMEA
 feWl813giOmx0AzfCrf6hdxOhYMq2ZiSHeABJtcpj/ewH/kr6TujQjVnz
 QWp1dSfp9eKxCG6qmySnHtF9bou+205BpfrjFbpOy8vtegZI41/Gjzi+p
 2Wq4ag9v5bh0ChJ+vwbHJ5axMQG4mGTkcQgjY2sE92uR/4XS8pRhcflJV
 xgM4FqIU9EMz3rStsyKf5Q9CIuLF8axPijoh98l1g2HHIV4EAgydV0RnT
 F0+xmp4iBFE4cMDyGoKKWGxX2EoEnQXC43TVNkQSGQgRzardirJyKaM3+ w==;
X-CSE-ConnectionGUID: DBACLQi3QAWOunElfkTj3A==
X-CSE-MsgGUID: /ZSfujTzREKTvWCSyBOMMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="80399233"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="80399233"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 08:22:52 -0700
X-CSE-ConnectionGUID: h5aatKJPRtiO+7laY8yMtQ==
X-CSE-MsgGUID: AS2+YnvqRxSTiMGREaM8yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="228124714"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 08:22:52 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 7 Apr 2026 08:22:51 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 7 Apr 2026 08:22:51 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.62) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 7 Apr 2026 08:22:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VhU+aut32QpBvhrOyRDoAUMQi+DnN25eRCkwaFA/rWsjetJm/y5FVyp1UzZOwbbYikARDvhq9PoOiqfwsBxtSEQkZUmQer9DxRfAffFNRA2JYAYo1Q8GnLHEW7g6kDonkc02eRxkLHrA7UCHAw1FINDfA60qbaNhUSLSN7FiLO++cu447B/7WfsvxnZ5bIf/WxRScAP54nYMQagVxfFeBxyute0AR7lMSlRQ7qne4DKVgLMkIwt0RgtfuLNw9GNWSPeBZw5RO2GRvWWmTy8mK8LFIahzJZLCi91ReelYHPRhDSx7+QvVQ0TZeaRbWkwsAxGT2ZdatByR96MTYe0oig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TTFeuUnjngqrppjh+OPqniBCXmGS8RCfC9rYQ1M/z4Q=;
 b=jdfZVYwguMt/i0F6S4VnmVJpRUrFz8Yf3mdBt9H1tTYAX3mwOriYeWzMPaNrJe62xgP3c8GA9zBAOSaMXQ1Xzf6X6hiS4l5yQNB+uhcM6PMvxBa/DVvfo6fu3sA5/Wl5Ty3+yPhrBVWgIyuvrdYS1XIDLZ5tULsAKV7uCIGSSSk/q4BPRi0J2fS3oNcCuU1jQRXp0JTqlK+2kxvxyb/WBxehFQVST851qvF0wJRUWoG6rNgG6wc0PvirhwGCkEXYTkxignggCgcL996adCeaHbmdzW5SKEncqAkK8fO0ZNfckO326LW9aoE69aSAfjKo6ZBNX/09JIu90zTNIp/Aeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by SJ2PR11MB8585.namprd11.prod.outlook.com (2603:10b6:a03:56b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Tue, 7 Apr
 2026 15:22:44 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1171:db4d:d6ad:3277]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1171:db4d:d6ad:3277%3]) with mapi id 15.20.9769.020; Tue, 7 Apr 2026
 15:22:44 +0000
Date: Tue, 7 Apr 2026 17:22:36 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <stuart.summers@intel.com>,
 <arvind.yadav@intel.com>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v3 08/25] drm/xe: Add helpers to access PT ops
Message-ID: <adUhMDwc_06s7hBg@fdugast-desk>
References: <20260228013501.106680-1-matthew.brost@intel.com>
 <20260228013501.106680-9-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260228013501.106680-9-matthew.brost@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DU2P250CA0005.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:10:231::10) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|SJ2PR11MB8585:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d278dc4-5a3a-4de2-40e6-08de94b9841c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: m/HA4F9h350rnmofaCIyLQFkCNW5imn/UbYDbK+zCwLjiQYBl/7qd+q9I427Y98aiLk0XESnkbbPUmbbohXk0Rspupn0JNqLIxiCMPRZqC7saCir1Lg56qcDLHKGvHjb/YxKXlN3kt8g9dvmUX+rPdWhC0nxUAqOqWjFUBxdDB/qVjQloe8+Rsty02Hm/NKBgRhrxuSvskvZ7I82ZEJM00xHYyvFWD/WabEpa8ZxUyf5okxpfhegVqhQydvdTH37J4KD7kTyNqjkFwBCQCJNbjwyx5VW1p0OoeSWz+fglAAuBV22MX5Ncvs1U6/PB3XKa5/1bOtYhvDWaprRrBIceLkpQXFhIkJvrekPLiGBtEoYw0AQaMlrvU1yGfovvYrbRAaIf4tJ7WBkUfvx3lrjJvN22hq0IglBDWHDUlBWB9jnqmCQIixpqGdOauD1Emq837HL5wie9gDqp9OvoMK9LR+L+/zd8l/LmsZYiRfCV9I/xtAaIItjh6uYFlBFpSQOgqatLxhasdhH1sD9o3dLHrFKv/jT+/C7T+xj0j3CsGQ2T4vR0dQT9YSdeYmT+9CO/8DN0/3/wmGWFmNOQRQkRY0ZyZZefAMiWwmEyQb6YbdcCj91dJD/XE+ChmLCyLEgg2UnJ8Zn76q/Hq+V5nnMHaNxTCO6wOYmGj/NzmbTTaPUMfzmOxrL05rXsZKSx8E5gOflr05/1s/kYr2pRe5fYsLAKQp4/26BdDkjnFZ8c2I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WZEM1zTXuxkSmmaawUEUnQT6sI/6CSaBLsN6/Uwm+3sZSI1exk3qYBWi6+18?=
 =?us-ascii?Q?/byRFoZafQu+EO6qJNHhaFAUsSifxR/IqqIVj5CibE95sdnKyH4H2m/hoZny?=
 =?us-ascii?Q?gVsrGaw0RKygAEPKUgh8Exx3Ba/F/oqhu5cELafZDwXJpzlcGQe/pBwECGNh?=
 =?us-ascii?Q?qlctxNiSTr4wXFR0H3Ij88ncdZ9XfwNrL1eJOaVGZ1vx/kDALG2gK0LIdfta?=
 =?us-ascii?Q?mvMaPCy4sAszif8w9bmGC5M8DEhkmzLqM9pWEJwkqg3s1z4GSx827FuyLM16?=
 =?us-ascii?Q?2LF86YOzptxeyCrlMJKkj7wBwkP8dqikiCK9CgyqAT1zQe41S20X8FDLpaom?=
 =?us-ascii?Q?IB9ONH+nFdT939uUfwU1E22rcXoFgbZmpbi9pa77jJPOnHo0wzCWO9Jqe49F?=
 =?us-ascii?Q?UQd5vf3afyJPZ+mV3E2FLUghIAyk53YTpsDX1ol6/XHk4dC5R90nY5WlHf0e?=
 =?us-ascii?Q?VnRYedaYXD7USIVawGAN+xuPpxSuAVJm1jmoq6M7pmtLbmjhaSxC2L/uHOBb?=
 =?us-ascii?Q?iNwPvuY73y1msjZy2bDs05U6FenfCRtZUkjsJf9Gz4ctDs1JEeIpjpXrCxNe?=
 =?us-ascii?Q?vIfuRcx1UccYn0QLj6IJjDth5BQ0+szZ+TvIxHTTIVIr+E/tEnXWwGTKYy9b?=
 =?us-ascii?Q?QWkl+vl0BDYeFOKUP+tHvKuXsZGbpyPyo/Jy54fqjasPV+iU7FS34XdSMbiK?=
 =?us-ascii?Q?HXYqzKwaE29xrteo9zi7GmvIWGiTzc9UWE7VJtQfGlESS3lctPgjEsQWvZfR?=
 =?us-ascii?Q?m3vQH1suJ8CMnnvmdIyc1mrR/Uuq9NlDkkkYVTMOeBzuvwvelwsvzTwvYHiV?=
 =?us-ascii?Q?cZ0VdOttFWi8z24RzJBK0AMV+7gsvJvKS6/FRYu8ZtTDlQ7MwwquftV0IFAd?=
 =?us-ascii?Q?TAL891JW9Yhfittqw9Q0IneZ7rBYJ8TJgJLhbmZDQ42oDE5TNYb5E0KI1Y8G?=
 =?us-ascii?Q?GwptkKa/mSsscUqSwCWp9QEiRsTQLjWOKFZlD5ZvgeB5ta/175Ht6+dlSLjD?=
 =?us-ascii?Q?K9YGcdqUI98Jf73KueycD4wXTduAt+Mx48flVzb+JCr0GVKv9OR/TqEwDcUv?=
 =?us-ascii?Q?a8kp3G7L/+CnPOGP1yRxQMk8gkAl204L/3Ih5DFbvtPyi/Ud3Qh2drwTMGhz?=
 =?us-ascii?Q?HGgpz8op300XkxcNpy0PG93cs5gBHtw9YPW3k9PNbYP9p+fzmvKW6HEyAj0r?=
 =?us-ascii?Q?nKcccY3nnOqWYXTEIGRRGMtc/5N6oxG7cKxILpX9/mtvq7KBbnL+rNXS1bQT?=
 =?us-ascii?Q?kKzaJD34virA67vVs59tlQVzJJnfKrNhXwi/jivp2PX7LFh9kEzWMnI79Zf3?=
 =?us-ascii?Q?bMUZPC3x22cKXuxlBsIpjySbkbbtommUhIO7v26AQzPCalJpSNRcezrV612G?=
 =?us-ascii?Q?ctc8t8hIefuMnjrk1Pygn3muEYuT6pJEplgIHR/eMAgIyHEEQOFnit2tBw9c?=
 =?us-ascii?Q?NT6vxVaP9ipYU0RsLK7xf5FXz5RQsI2gOuy7lC47J8+6DGLljxAEOIboVjBh?=
 =?us-ascii?Q?+epmIMqveLztMaVbZ4wPmRzpLQEDAJzXgsIgGwqBbWyDCKrpSvz3z9mYLTkX?=
 =?us-ascii?Q?pQrg9j6L4dYP144nK86bn3HtXVSWRCeqs4Ffrnraf7J3Jz1vB2nsI/Bd392P?=
 =?us-ascii?Q?7FUxlia645RfIdRWm/0KmmJp9dxqgNcyQkGUqHPbnYyNx2qAACN9Z8arvnGt?=
 =?us-ascii?Q?hJFzP3a6CWLKb6L8u/kd8xtRCONTzqF/NmdE+uYfu5Yvk6VdtLZJxFL6d7z8?=
 =?us-ascii?Q?isnfk8EL4aiVPL7ggBxF7vTD/RMv8z0=3D?=
X-Exchange-RoutingPolicyChecked: j/xQvN2sTqZjBOYM1mVtnyx0Yi1ukkXcZ6Qs4ZWDr0pmMBDlJ9F1JBWLW25SjQ2JVN8ra4/5tXln7GQi3HiLdVg1KpTDZQhh2wdm/KXaRlpwmczAM/ZvzBUuFnYcdZL59SbSgN+Q6HvbrpASFzFnvKMS6+zuqaCMur422JWNO+CKItAm8Yd0VP0PYpkPWP22LxecP6ajsApU8Yu5Q2s0IzxYuz7739Q2XiEolvKFsYPYaO8lYPYoNlwt4yFxh5TGpHbXeO3CRbMSCnYfd1Oe7Sh9tw+rMVCsyjqBUG51SMROUfcb2WaAr6+7i0vWKQdIfrsKPIy2XvbOf4EhU7w7FQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d278dc4-5a3a-4de2-40e6-08de94b9841c
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2026 15:22:44.1763 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YOT7ZzwYO6qPUApMf3uFBOuCl9NCiCAkREKSPI2x2+JE/a4cVghjuFIKJ0o13ss5qPFJDO8UaTkub0TbTWA3O6tNHaakEE8be5OEI9poRf4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8585
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

On Fri, Feb 27, 2026 at 05:34:44PM -0800, Matthew Brost wrote:
> Add helpers to access PT ops, making it easier to shuffle the location of
> the ops structures without requiring widespread code changes.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_pt.c | 65 ++++++++++++++++++++++++++------------
>  1 file changed, 45 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 83dacc91b7b3..1f24eff75185 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -1881,13 +1881,37 @@ xe_pt_commit_prepare_unbind(struct xe_vma *vma,
>  	}
>  }
>  
> +static struct xe_vm_pgtable_update_op *
> +to_pt_op(struct xe_vm_pgtable_update_ops *pt_update_ops, u32 op_idx)
> +{
> +	return &pt_update_ops->ops[op_idx];
> +}
> +
> +static u32
> +get_current_op(struct xe_vm_pgtable_update_ops *pt_update_ops)
> +{
> +	return pt_update_ops->current_op;
> +}
> +
> +static struct xe_vm_pgtable_update_op *
> +to_current_pt_op(struct xe_vm_pgtable_update_ops *pt_update_ops)
> +{
> +	return to_pt_op(pt_update_ops, get_current_op(pt_update_ops));
> +}
> +
> +static void
> +incr_current_op(struct xe_vm_pgtable_update_ops *pt_update_ops)
> +{
> +	++pt_update_ops->current_op;
> +}
> +
>  static void
>  xe_pt_update_ops_rfence_interval(struct xe_vm_pgtable_update_ops *pt_update_ops,
>  				 u64 start, u64 end)
>  {
>  	u64 last;
> -	u32 current_op = pt_update_ops->current_op;
> -	struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops->ops[current_op];
> +	struct xe_vm_pgtable_update_op *pt_op =
> +		to_current_pt_op(pt_update_ops);
>  	int i, level = 0;
>  
>  	for (i = 0; i < pt_op->num_entries; i++) {
> @@ -1922,8 +1946,8 @@ static int bind_op_prepare(struct xe_vm *vm, struct xe_tile *tile,
>  			   struct xe_vm_pgtable_update_ops *pt_update_ops,
>  			   struct xe_vma *vma, bool invalidate_on_bind)
>  {
> -	u32 current_op = pt_update_ops->current_op;
> -	struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops->ops[current_op];
> +	struct xe_vm_pgtable_update_op *pt_op =
> +		to_current_pt_op(pt_update_ops);
>  	int err;
>  
>  	xe_tile_assert(tile, !xe_vma_is_cpu_addr_mirror(vma));
> @@ -1952,7 +1976,7 @@ static int bind_op_prepare(struct xe_vm *vm, struct xe_tile *tile,
>  		xe_pt_update_ops_rfence_interval(pt_update_ops,
>  						 xe_vma_start(vma),
>  						 xe_vma_end(vma));
> -		++pt_update_ops->current_op;
> +		incr_current_op(pt_update_ops);
>  		pt_update_ops->needs_svm_lock |= xe_vma_is_userptr(vma);
>  
>  		/*
> @@ -1989,8 +2013,8 @@ static int bind_range_prepare(struct xe_vm *vm, struct xe_tile *tile,
>  			      struct xe_vm_pgtable_update_ops *pt_update_ops,
>  			      struct xe_vma *vma, struct xe_svm_range *range)
>  {
> -	u32 current_op = pt_update_ops->current_op;
> -	struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops->ops[current_op];
> +	struct xe_vm_pgtable_update_op *pt_op =
> +		to_current_pt_op(pt_update_ops);
>  	int err;
>  
>  	xe_tile_assert(tile, xe_vma_is_cpu_addr_mirror(vma));
> @@ -2014,7 +2038,7 @@ static int bind_range_prepare(struct xe_vm *vm, struct xe_tile *tile,
>  		xe_pt_update_ops_rfence_interval(pt_update_ops,
>  						 xe_svm_range_start(range),
>  						 xe_svm_range_end(range));
> -		++pt_update_ops->current_op;
> +		incr_current_op(pt_update_ops);
>  		pt_update_ops->needs_svm_lock = true;
>  
>  		pt_op->vma = vma;
> @@ -2032,8 +2056,8 @@ static int unbind_op_prepare(struct xe_tile *tile,
>  			     struct xe_vma *vma)
>  {
>  	struct xe_device *xe = tile_to_xe(tile);
> -	u32 current_op = pt_update_ops->current_op;
> -	struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops->ops[current_op];
> +	struct xe_vm_pgtable_update_op *pt_op =
> +		to_current_pt_op(pt_update_ops);
>  	int err;
>  
>  	if (!((vma->tile_present | vma->tile_staged) & BIT(tile->id)))
> @@ -2072,7 +2096,7 @@ static int unbind_op_prepare(struct xe_tile *tile,
>  				pt_op->num_entries, false);
>  	xe_pt_update_ops_rfence_interval(pt_update_ops, xe_vma_start(vma),
>  					 xe_vma_end(vma));
> -	++pt_update_ops->current_op;
> +	incr_current_op(pt_update_ops);
>  	pt_update_ops->needs_svm_lock |= xe_vma_is_userptr(vma);
>  	pt_update_ops->needs_invalidation = true;
>  
> @@ -2112,8 +2136,8 @@ static int unbind_range_prepare(struct xe_vm *vm,
>  				struct xe_vm_pgtable_update_ops *pt_update_ops,
>  				struct xe_svm_range *range)
>  {
> -	u32 current_op = pt_update_ops->current_op;
> -	struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops->ops[current_op];
> +	struct xe_vm_pgtable_update_op *pt_op =
> +		to_current_pt_op(pt_update_ops);
>  
>  	if (!(range->tile_present & BIT(tile->id)))
>  		return 0;
> @@ -2134,7 +2158,7 @@ static int unbind_range_prepare(struct xe_vm *vm,
>  				pt_op->num_entries, false);
>  	xe_pt_update_ops_rfence_interval(pt_update_ops, xe_svm_range_start(range),
>  					 xe_svm_range_end(range));
> -	++pt_update_ops->current_op;
> +	incr_current_op(pt_update_ops);
>  	pt_update_ops->needs_svm_lock = true;
>  	pt_update_ops->needs_invalidation |= xe_vm_has_scratch(vm) ||
>  		xe_vm_has_valid_gpu_mapping(tile, range->tile_present,
> @@ -2282,7 +2306,7 @@ int xe_pt_update_ops_prepare(struct xe_tile *tile, struct xe_vma_ops *vops)
>  			return err;
>  	}
>  
> -	xe_tile_assert(tile, pt_update_ops->current_op <=
> +	xe_tile_assert(tile, get_current_op(pt_update_ops) <=
>  		       pt_update_ops->num_ops);
>  
>  #ifdef TEST_VM_OPS_ERROR
> @@ -2515,7 +2539,7 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
>  	lockdep_assert_held(&vm->lock);
>  	xe_vm_assert_held(vm);
>  
> -	if (!pt_update_ops->current_op) {
> +	if (!get_current_op(pt_update_ops)) {
>  		xe_tile_assert(tile, xe_vm_in_fault_mode(vm));
>  
>  		return dma_fence_get_stub();
> @@ -2583,8 +2607,9 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
>  	}
>  
>  	/* Point of no return - VM killed if failure after this */
> -	for (i = 0; i < pt_update_ops->current_op; ++i) {
> -		struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops->ops[i];
> +	for (i = 0; i < get_current_op(pt_update_ops); ++i) {
> +		struct xe_vm_pgtable_update_op *pt_op =
> +			to_pt_op(pt_update_ops, i);
>  
>  		xe_pt_commit(pt_op->vma, pt_op->entries,
>  			     pt_op->num_entries, &pt_update_ops->deferred);
> @@ -2708,9 +2733,9 @@ void xe_pt_update_ops_abort(struct xe_tile *tile, struct xe_vma_ops *vops)
>  
>  	for (i = pt_update_ops->num_ops - 1; i >= 0; --i) {
>  		struct xe_vm_pgtable_update_op *pt_op =
> -			&pt_update_ops->ops[i];
> +			to_pt_op(pt_update_ops, i);
>  
> -		if (!pt_op->vma || i >= pt_update_ops->current_op)
> +		if (!pt_op->vma || i >= get_current_op(pt_update_ops))
>  			continue;
>  
>  		if (pt_op->bind)
> -- 
> 2.34.1
> 
