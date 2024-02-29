Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61CD9C54798
	for <intel-xe@archiver.kernel.org>; Thu, 29 Feb 2024 21:19:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE32D10E5F8;
	Thu, 29 Feb 2024 21:19:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HcG11Ij2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A80A10E61B
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Feb 2024 21:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709241564; x=1740777564;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=jRSiiOGP+8UCJGNF5XOY1oULhmZLh2J3597O11yhD+w=;
 b=HcG11Ij2eA26IFHleL3uTH0ae/5qt6hrUZMrlG52K9y3xkqkoxPtWzkI
 C9MLK8qw8dAUa7gx7KVeV/txs/tMEI/dlehv7Z9Fgn4F1or1gOCuSV+x9
 b2dGA267c+pQqICImOXZeyaI1ZFZo0V6g0xQXZUHbCAlnp3eaiI93jMiQ
 DZGOYN+uqSn9ruCBrTKBNGE7+FOlFa+J9hadsoreYlTrgPv1fEWnD6zpK
 wSgmxWFOhSzGIqX3Ofp7aiCQkcmE9xrWQAcn4mZRLS2dtSvcBaI49NHGV
 QlQgqqDkQtXCdJipf/g58+bz1/5Q6C8MLjJgutH/M3Z+3DzcoFh3jEjk0 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="3865700"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="3865700"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 13:19:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="8018151"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Feb 2024 13:19:22 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 29 Feb 2024 13:19:21 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 29 Feb 2024 13:19:21 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 29 Feb 2024 13:19:21 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 29 Feb 2024 13:19:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fqf6n2jqxRYjbIYCvRBK8wfa+j6RIjqt5Xvj5RAPV2+1mSPXHYLZdnfAeCt9rMdH7D2Jz26BYUnEY8gT0gLy0YchVeysl3ByrYBv7tDI0sgfMrT+CpbbzNcpeBUyg8cCe7dAygXO6xEkEysXYfZKp0t2argoevCdsaZyfe5UbvabNvlMt7VFN4L6aJlRj4XLAFfzefxc4FSCgFOe9qGZN6p/vTVUrPZ8Dbe+I7f+y+fx0GU65ZH6fpXC46HPgXNmeMu7XGFoliSM5QSmLnunjaImkmz5U+i5eWavHzZiQv7Y8Po4sAICAWn+HpNjnk9Wx716Bpr+/yjTx52a3XuLRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lf7w9Qss4E+CvU3CnURLlk2HVlvsJ05ReIa+IplNNIk=;
 b=P/rRLmVVypooVzT4bIPWBkfuV/KeRF3vxTKsFKmXe/90pMfiTLgv/M+b0YPabDFTpz39w4O5kxFyPU8c+2Lg5nDuogRAglq3+sNjabSAhsvTbHmCG3rLRFGqyWaElQLD+KwsiqhBrebKncgJPnv2LyZ41QdWvtKk1sH1prjTIG1CXCd+KXN8lxouwYB8foJJvn26UVI7k8ircG4PCmkgs+VEWid9ulcDe2VlGFUTHuce8nvnGylJO7HDHt3Kz/EDafIv/VeqktQQLn5+KzADK69zActU+EohTxNT9Odp/OIhnPTth65xy5k/NW8jqBVIW2jXvgniteIKARd6qneR7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CY5PR11MB6463.namprd11.prod.outlook.com (2603:10b6:930:31::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.15; Thu, 29 Feb
 2024 21:19:18 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493%5]) with mapi id 15.20.7339.024; Thu, 29 Feb 2024
 21:19:18 +0000
Date: Thu, 29 Feb 2024 13:19:15 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Ruthuvikas Ravikumar
 <ruthuvikas.ravikumar@intel.com>
Subject: Re: [PATCH 1/5] drm/xe/mocs: Refactor mocs/l3cc loop
Message-ID: <20240229211915.GO5347@mdroper-desk1.amr.corp.intel.com>
References: <20240228061048.3661978-1-lucas.demarchi@intel.com>
 <20240228061048.3661978-2-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240228061048.3661978-2-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR13CA0163.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::18) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CY5PR11MB6463:EE_
X-MS-Office365-Filtering-Correlation-Id: cd31cfdd-5f4d-4f86-16db-08dc396c16dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LLv8Iv0U1Tm+fqjsDC+sEZ5RozcPzESlQTLTm+lhlnpFcMPEgcEwZPPaw/JBWUnLjyA037epoeY24JkNZV6j+EWkaUsa4+ZlVgSoUBKhyHYeAXbjsULFbblDq38XKUOCXIndoAU9eX4+qsbz7WnYP2Aqf8uzqkbpLKO3BPeXM0k5xi/qz4FBP9YBg/JuCb5RShVeVuSmab/XPSw2/epKXge4DhYXiXtAZBRdiGcazBSZxPI/VFF6NLFHLQzorq4jS8crDRmJPrz7e5t/BGtEVpTBQOOaJx4pfXFmRPRXKiUnpbswj4DwwYY9Z8M6Y0nWVFAnRb5nUoVFIfyrfxcNmSN7oVOLRXZXqae0AESr+FA1ot9iaKzHYeV17P0iHNZDidRTs4UyWl77BJEB7TkUiA/Y7btu3X10fLBfFrXFbwNU5KBiBWRR5V2nMaHh9QQ1v8qJ2eit0Zmk5I3z+jPbAJjPa2k8uMvEi1OYP4iSoRUGU/klraqZx0lKDHNeiOooQmJHb8OpR1kM3+6HGgAggE20iOMBoLY05+JXJZGHrCbA6Ee4dykhx8+1nnKSeNvy7OeN4lIqAlydrTU1l3fw5gWNXOBkabiq2ksq+TAULsnSsyuIyo4jzWPdp9w+XSzb3B9DP4wLAGgZ7B4ntj0E7w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RtUxAF6qbWyOD8N0CVx2OfYmDW6Hzp97rI7G0D4pYJ2SPZiExoPt7JXofIhz?=
 =?us-ascii?Q?IYPrRvTNHxLAlt43dTUKA2Nr2VzUjmd+dVND98tEgwzWf4LvyKDPFLXzD+cf?=
 =?us-ascii?Q?MyoWqXt/q6qPlsb9KJDzjewbb0xBc1X/G17lcWXZYqGfcKEqZRh+6uk5AQ8+?=
 =?us-ascii?Q?fys3/ycswP/AI+Hdfc1EvmYoTkydCJGLL24GGxNiW9NeNwju3tGTe0xmpLwY?=
 =?us-ascii?Q?MR4J9abCk1DCTZv8bjxAQsjECtB6ZnAMDqxjSCEeEdZXfURXhC+RDBwXBRjs?=
 =?us-ascii?Q?ip90yLKebg71ol/wLbipT6rCkkcfbfORSozTvLg1ySCh3ErGamdy53KT3hTc?=
 =?us-ascii?Q?kAJdAzJUAhDVfcPQv4i+BhZ8uaCLfGwgEra3SeBG9MqvUKivBj0oYqlbkdRL?=
 =?us-ascii?Q?jug6lyE6O6G6L1K4sL0Nk1cs1GjWuYicToABALDaT19H4EEl+doSj1tzaPWH?=
 =?us-ascii?Q?mfSfptg280Gmh2brW8el78veQa8sVvkp//oCpDp/p7ggJrV0eGCzm6bn2648?=
 =?us-ascii?Q?tHY7QXyuyLHKeS/uApETLuinGuXw8kZXqpX8TshT4dtGwRfHzRtVreqJyUY/?=
 =?us-ascii?Q?xBUc7ScE8j9uXEyxuaJv4o6gC4OTSN6miajFpwfEhByuHwyjcmbUF1SegSoO?=
 =?us-ascii?Q?Wlm7c+K0R6haRxtmQwXF48bYrhH6t62I9SsN2pbjXvFORgf8UcR0m9Klp0Z2?=
 =?us-ascii?Q?GipVjjMoRXSnx0ed2mCFupdnkA3HpTKKzm24VxzjYTKnB5WqOgdzEPL9bK38?=
 =?us-ascii?Q?aXAKK6riavQfWSRKOtW4F8I1GB7oVreXMJQVNJ0LtC0W5pWndiwJGUUhCfVH?=
 =?us-ascii?Q?aIk1xD84pALaCIq9hrtZzMZumUA04SU8sOnmYuX6S8MvCTgIDbwyYtiQXRGK?=
 =?us-ascii?Q?75S7w9kSQIlVCzhP9PnTYFfpd2XPJ/CCY5YHR0U+pRw5RIK7Q+e/IhglXkvK?=
 =?us-ascii?Q?TShRuSWLX7OY3tDzXfkDbSO+e2vXj2DPZnA+HnNSnVMAMhGF5QTrzmiTC4Ip?=
 =?us-ascii?Q?cRwJTH4DMqSCD78kwoYjDlaF2l1dBprHFdVQtSTjmGW86lVGXzR+7oe9Uijs?=
 =?us-ascii?Q?WMGEUtOCg36cF1eGOJbZlZhTCvmJJ6FEMRJnRspqSP8eLdC7NboKcvb1ZBhP?=
 =?us-ascii?Q?WVHCPrG/mo7XNF3uM6lMiCoHZ/KNAICg8PDvW4v6p/Pi9ZKDXBOAFW3jJoZH?=
 =?us-ascii?Q?abhrM5jpxQZTKZAuLypACp0DYGJ/zaKZnAvk/3tm5xlWoYnG/NGRME5V5AO8?=
 =?us-ascii?Q?KS/CQppRMRgjTm3lr+BDO5m4et26/SF0YDnpqJyXvj4tVA/AEu0UhGPCjGM1?=
 =?us-ascii?Q?qoU1qwO8xLXekUrm5jUDSPLqWm4voZ/YCuoEPqmg19QkOwpD3Bd9e3K20zuA?=
 =?us-ascii?Q?aLUu9XW7LJD7MsywtsDdJpvYIETQCJFmJBVbTIEaO3KLW57JBOoDSnR1+HT7?=
 =?us-ascii?Q?exq4RZpCTlS5jF+ZNBNxiJLjCY4//KcYZA9+2sRRZdM+P3+1/Rv/Y1V3ii64?=
 =?us-ascii?Q?QpCTdm6NZ/JeNPQn2oEKGa+uJtpD6oqTg/y/286Onks7CI2jpykcrT16vj3+?=
 =?us-ascii?Q?WzPxK3FVvhKSH8JWGDHlJeOgH+3S8mwFy9FcgyB6nhb51QrP5AygyisODszS?=
 =?us-ascii?Q?Kg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cd31cfdd-5f4d-4f86-16db-08dc396c16dc
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Feb 2024 21:19:18.3958 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sqVqanq44KNX6loGZsLoDPAQ6IbBNBIL6TyWXpcEJ5OqrHSbx9Di1dnEBvC7ULRhYlXKwtZ7wWyVsiSY3Ei0kU4k/hsHcHCE+4QVDzNY06E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6463
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

On Tue, Feb 27, 2024 at 10:10:44PM -0800, Lucas De Marchi wrote:
> There's no reason to keep the assignment an condition in the same
> statement, particularly making use of the comma operator. Improve
> readability by doing each step on its own statement. This will make
> supporting odd number of entries more easily.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/tests/xe_mocs.c | 17 +++++++++--------
>  drivers/gpu/drm/xe/xe_mocs.c       | 19 +++++++++----------
>  2 files changed, 18 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_mocs.c b/drivers/gpu/drm/xe/tests/xe_mocs.c
> index df0cbb2ddcb50..7c91e01c47a3a 100644
> --- a/drivers/gpu/drm/xe/tests/xe_mocs.c
> +++ b/drivers/gpu/drm/xe/tests/xe_mocs.c
> @@ -49,11 +49,11 @@ static void read_l3cc_table(struct xe_gt *gt,
>  	ret = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>  	KUNIT_ASSERT_EQ_MSG(test, ret, 0, "Forcewake Failed.\n");
>  	mocs_dbg(&gt_to_xe(gt)->drm, "L3CC entries:%d\n", info->n_entries);
> -	for (i = 0;
> -	     i < (info->n_entries + 1) / 2 ?
> -	     (l3cc = l3cc_combine(get_entry_l3cc(info, 2 * i),
> -				  get_entry_l3cc(info, 2 * i + 1))), 1 : 0;
> -	     i++) {
> +
> +	for (i = 0; i < (info->n_entries + 1) / 2; i++) {
> +		l3cc = l3cc_combine(get_entry_l3cc(info, 2 * i),
> +				    get_entry_l3cc(info, 2 * i + 1));
> +
>  		if (GRAPHICS_VERx100(gt_to_xe(gt)) >= 1250)
>  			reg_val = xe_gt_mcr_unicast_read_any(gt, XEHP_LNCFCMOCS(i));
>  		else
> @@ -84,9 +84,10 @@ static void read_mocs_table(struct xe_gt *gt,
>  	mocs_dbg(&gt_to_xe(gt)->drm, "Global MOCS entries:%d\n", info->n_entries);
>  	drm_WARN_ONCE(&xe->drm, !info->unused_entries_index,
>  		      "Unused entries index should have been defined\n");
> -	for (i = 0;
> -	     i < info->n_entries ? (mocs = get_entry_control(info, i)), 1 : 0;
> -	     i++) {
> +
> +	for (i = 0; i < info->n_entries; i++) {
> +		mocs = get_entry_control(info, i);
> +
>  		if (GRAPHICS_VERx100(gt_to_xe(gt)) >= 1250)
>  			reg_val = xe_gt_mcr_unicast_read_any(gt, XEHP_GLOBAL_MOCS(i));
>  		else
> diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
> index 609d997b3e9b0..001e4301c639d 100644
> --- a/drivers/gpu/drm/xe/xe_mocs.c
> +++ b/drivers/gpu/drm/xe/xe_mocs.c
> @@ -473,9 +473,9 @@ static void __init_mocs_table(struct xe_gt *gt,
>  	mocs_dbg(&gt_to_xe(gt)->drm, "entries:%d\n", info->n_entries);
>  	drm_WARN_ONCE(&xe->drm, !info->unused_entries_index,
>  		      "Unused entries index should have been defined\n");
> -	for (i = 0;
> -	     i < info->n_entries ? (mocs = get_entry_control(info, i)), 1 : 0;
> -	     i++) {
> +	for (i = 0; i < info->n_entries; i++) {
> +		mocs = get_entry_control(info, i);
> +
>  		mocs_dbg(&gt_to_xe(gt)->drm, "GLOB_MOCS[%d] 0x%x 0x%x\n", i,
>  			 XELP_GLOBAL_MOCS(i).addr, mocs);
>  
> @@ -511,13 +511,12 @@ static void init_l3cc_table(struct xe_gt *gt,
>  	u32 l3cc;
>  
>  	mocs_dbg(&gt_to_xe(gt)->drm, "entries:%d\n", info->n_entries);
> -	for (i = 0;
> -	     i < (info->n_entries + 1) / 2 ?
> -	     (l3cc = l3cc_combine(get_entry_l3cc(info, 2 * i),
> -				  get_entry_l3cc(info, 2 * i + 1))), 1 : 0;
> -	     i++) {
> -		mocs_dbg(&gt_to_xe(gt)->drm, "LNCFCMOCS[%d] 0x%x 0x%x\n", i, XELP_LNCFCMOCS(i).addr,
> -			 l3cc);
> +	for (i = 0; i < (info->n_entries + 1) / 2; i++) {
> +		l3cc = l3cc_combine(get_entry_l3cc(info, 2 * i),
> +				    get_entry_l3cc(info, 2 * i + 1));
> +
> +		mocs_dbg(&gt_to_xe(gt)->drm, "LNCFCMOCS[%d] 0x%x 0x%x\n", i,
> +			 XELP_LNCFCMOCS(i).addr, l3cc);
>  
>  		if (GRAPHICS_VERx100(gt_to_xe(gt)) >= 1250)
>  			xe_gt_mcr_multicast_write(gt, XEHP_LNCFCMOCS(i), l3cc);
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
