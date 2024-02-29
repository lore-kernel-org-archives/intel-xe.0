Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FEA4C48BF6
	for <intel-xe@archiver.kernel.org>; Thu, 29 Feb 2024 21:29:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1E7410E0CC;
	Thu, 29 Feb 2024 21:29:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hj7mApT3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A90610E0CC
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Feb 2024 21:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709242165; x=1740778165;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=CyxIgOeHgHseZZpptnJ2AXwOpwFJl3Y6GAROMAL8L5c=;
 b=hj7mApT3UtbddafmChWwwGo+5tYhHtxFJ67swxkcBnoUoks6KE0Wqz/f
 aYacF9gMkGCsqOTY4TuM6DkgXj8KrNiM50Yok/p1ZDlGcIWjibELuRETE
 aznYjpwwGxgetIsgnCpvUyFXl72ZArZqXjQ4no5qudTnGOChZh/pFL/zQ
 o2FvY+3K6G+UA5aMFKGpFFxKmlpi89i0uvHVau8QB+eiozQMr6f6DZlsY
 B8ulE3Z4vL10unPCb3wYFvCs22R3WZWDpDuS0c8PMHrITqUI69CL2DSkd
 iOjwCciTKXemEF9KwQ/Uctt5I3XEchbQWpqBp5WxmTgVD19pg+7NwSzi9 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="14455840"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; d="scan'208";a="14455840"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 13:29:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; d="scan'208";a="12630428"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Feb 2024 13:29:23 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 29 Feb 2024 13:29:22 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 29 Feb 2024 13:29:22 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 29 Feb 2024 13:29:22 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 29 Feb 2024 13:29:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aGbMfTAROqRlR7Q957HcEXqLjrmjnr1rmcY8ZLvPNYlLY6icDV8MP5x2l2d2s1hkUA5RqxvHXuBIJxnWXrO5Qnyn1NLvGGldQEmXyCByWkfHD/OxDypcyTfEfYLKqiwbnaVDuQnbw4S1cOf3dP1+27F6QybweKHYJ4QmhBHFB7+HZJCyu+cAihfyzt5KjD2ZWX08ile+gKRL2hKeiG2Qv0nJnOGuLo5KCw9BdxK1b/5S0+ZpjT+BFF2Y6O/WNwFnlR9CQoNp8ADa8sDKTPJPWCOKRMh56P5Dv8iuvGiki9PX/3uGReAGzUmNinfOUTF1Kfw6hX98C6uazy9fpiQtAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WEEf8PtJRJwoYA1VWRqSP3XzqKBtnKTQYOn437eq2rg=;
 b=WC/f45yfmZWyfbjaS7mF40RXaygj+SAxCOucSLRuoRjmdJLPqS3XyX7PWip+Hls93KzpYFusHWfPGuuyK4VdAhyPoYEvdSg0bvbBkpA54ADmSoyOXLZlicr3Yr95BMpa2RoZ7b+r1015irE2G2qb96wWWKEQxzlDUzK1yYIxuoc6d9QdMYl8tmwFbcmP0e2jgRz/Wn8xlxENTuDFCA2jDEqwwUgUxRvOTM2ot3yIMb1N5YLJUzBrYiZHsiWJaVgE4G0+LmLkvMrw+jmWmgShwaLWyxOUcDUTdFDD5s/tjrXZtwEP2v/si1w+q6S8nKbF0TdxsI33xg+ypJWKoAO5nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by MN2PR11MB4616.namprd11.prod.outlook.com (2603:10b6:208:26f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.25; Thu, 29 Feb
 2024 21:29:20 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493%5]) with mapi id 15.20.7339.024; Thu, 29 Feb 2024
 21:29:20 +0000
Date: Thu, 29 Feb 2024 13:29:17 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Ruthuvikas Ravikumar
 <ruthuvikas.ravikumar@intel.com>
Subject: Re: [PATCH 4/5] drm/xe/mocs: Allow odd number of entries on test
Message-ID: <20240229212917.GR5347@mdroper-desk1.amr.corp.intel.com>
References: <20240228061048.3661978-1-lucas.demarchi@intel.com>
 <20240228061048.3661978-5-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240228061048.3661978-5-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR03CA0291.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::26) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|MN2PR11MB4616:EE_
X-MS-Office365-Filtering-Correlation-Id: 8270a1ce-fd8d-4109-f918-08dc396d7d75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0FsqWxgI7JT2bgw0sXiwA+2CqzMB3qWmbhbTOxC2QIauW9v1nhONv38NygWiFVMigcPKia56MoFWA508JOe+UbBc8yqvu0govmtZjKaZ4cidXAKpQ1cxvOS/+uJeQLZusypxBuhtKfJ5QpuTEaTCN3JN07TURXbLue1HJ+izL4SEtkxAVMdGOejtONhA1fuxMBkpsBW8IdFthWRbWlanN8hgHyLDN/pkKrSH+fUT77Gu6WZ9FtNx0A3TlM8zm9+zf5cuOMT+2xNQbwPXtH+OWtK+P8+8wy+tEgIwdDDYz5YjEHXR00kj6jVwFaMo7E8j+hEo6065oj4Gfk8sj97KRlMZKcESyFtvsKCQDInGTv1zRiOjJxL9VAivI/U529Wv5BHbqqyrXXMSiR/WqBYZ3rvFh4IMzxvmhKq9n22nV/gv45hK4+PlI8FEscyx1jpiYqYciqAazFU2PDBswIwokYuDybT+LN+dM1cM3Qu923JZ9h5rw2eP5RWqFwdn6rscxd2NQBrm+H4DPnMEbEouXYZmsUgxJtSgrtBVp2d4Y8dNpngDEMMbj4w9wDoSFrCO46vny0CQ+iMnaLJApxYqXzaHIBZ3DxrLSdgSBCdIKUMi0LaQMOB3idMbczm/otnSR/FLhbBU4PecMxOcp1/+Ag==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pbO3FYukjIWg8k85lwNOt1PgM3oTv5rIV7482kPGhPrV0ARX43KQZH+0iiF6?=
 =?us-ascii?Q?HeoJOqIbTwLCm0krnfiKbIqBurwQq2qnco/DYuMbyHFVPIdslxJ4K4mWDVGZ?=
 =?us-ascii?Q?iQjXmVpZheFIn+Jj9ILpskHHfUqTH8n3qEgrchdqZoEe54NyyftS/YWWbEQ1?=
 =?us-ascii?Q?GB0dO9b56pqkGJOz3nQuxge3y+IZ8/MksiFZlIMsECjY5Vc85LqywrY3mljj?=
 =?us-ascii?Q?rIzm3hhPtPAuRjCMhTLLLT4BnW+0On2CFtyZ2/B1fvO0r5x2w632pQ8+0gPj?=
 =?us-ascii?Q?hs6SzNIvXgW/5W0uYoSErE8MqNZOCooarRwmBdzu7jgLHiDGjL0gbKk+47XI?=
 =?us-ascii?Q?zgMPouU917sGGLsrZEByAoTO5Q/zcb/0FcPR+muWlog11Wf5Eq7rR01FYnbW?=
 =?us-ascii?Q?UeC6wN7Eq9t1vKk5LwpNh6pOVNqeKOCBvpPhf0EBFMrooj2ZdAByRiWJlmgm?=
 =?us-ascii?Q?/JOGpnsJt+D5xwfdHawkHCwJNOXL37J9M4LkL0O3faJvdwu/yhbVYVaTLPjV?=
 =?us-ascii?Q?MZGvqnml6g+2/qNyWA1nEld2yr0uHFbTRjY4u+tsxCtf9aHm+HGmIdTeHRQy?=
 =?us-ascii?Q?lOy2eHZC6iBWvAvYEIlzeqCE5EeYwxsPOgcV+3j1Xyb3LYM5vcVq1prLrFgp?=
 =?us-ascii?Q?9Mz1VwKIwt0W5b7tINQUczkaMRcJhuDNUxJmLkrUJXSfQG9KVk5iC3lLWtk3?=
 =?us-ascii?Q?LJUuorMqmyPeKFJM1ChyTLlZliLWXnCGBuoyCUgldoaNrhqcyaIixd2LdX1O?=
 =?us-ascii?Q?EovFHR4rob28wGfWVGhYEAzaq6oQ6QrdvoUOPQJmdDEl22sq4yMDBq1HC98t?=
 =?us-ascii?Q?ujNxqOevGZAJbId2+rtK3BC/EMHOsqq4hmixkEcrPKK3Os2RMFLy2DNGf7zo?=
 =?us-ascii?Q?HGURSKdmMMixNiqfVvSpDFxzF/BHNqinPRmGGcaKDJzU97bhNjZl+NFi4kqp?=
 =?us-ascii?Q?jmdvTztgwNcXKgXmemmC/umbwJmBBwavGHCn9QhX8JDXhAJBdCHcuo22Laiy?=
 =?us-ascii?Q?lEGZ8DRGqrXaZ8jdZAxKJrYDSuX7IAPkJe5bjBIapSdE0dTjXVB6Hr6FeVYc?=
 =?us-ascii?Q?Qc2TJJeCe6ixibtfpcYNyxdmi1nW+6kqhgPHxlvZuSM+hBCHP2r6IJf2P9nC?=
 =?us-ascii?Q?PkSduIUSSEjqvfvj9bLRF7QiICligz+clR7PBNEj2dnM4Rra3uqqXF4GZcW7?=
 =?us-ascii?Q?npfWIQE+YuKWWxxyRxm/1zUGAioH6uAg0ezub7n16vZP8Gb3d4qOF0mpRnqJ?=
 =?us-ascii?Q?dIhJIdjJj2tjhRHKWC69MwRKcrSfaYAkcmPKqQqbHkYaZvkqiFrsC5lUfvt3?=
 =?us-ascii?Q?TgAyikarxPFieZjjJrPf8eQ+0acBiZcGKideBgxTKRSWgoz6wqz10IryzA2M?=
 =?us-ascii?Q?VCdOIcdmpods8F8wR/22umbbeZmzadiJ7Gdio72BJT8pJvZkSfGRU4mPYJhp?=
 =?us-ascii?Q?cdQpqSOyVxpPjFCPYcRkrKg/gNRQdGipjF+Iwi13Sx7s5/RS6CSkryOr8tQV?=
 =?us-ascii?Q?ZUSn/XC0myO/Zm260LOEUj3gJqf1gfnIeMJReOHh76khNOH4JD5g1Wj8vufR?=
 =?us-ascii?Q?UfT0TxTobHkikj8TXY2rZTOEUexyuqjtzyDmB4BueWckGlGd83Ugvp2REF2I?=
 =?us-ascii?Q?wA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8270a1ce-fd8d-4109-f918-08dc396d7d75
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Feb 2024 21:29:19.9908 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9mGMDuAu+UoXbOCzqHKt1huXmrJM57AhjU81eutyM9HZRWWr8kVlbzN+Tb6cQZDcMaxW9W7VI1ZoK6d2bfdoyAou9o6895MZebfw1HN8Kzs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4616
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

On Tue, Feb 27, 2024 at 10:10:47PM -0800, Lucas De Marchi wrote:
> Refactor the mocs/l3cc kunit test to support odd number of entries. This
> switches out from the "check the register value" approach to check the
> entry value if it makes sense from the register read. This provides an
> easier output to reason about and cross check with bspec.
> 
> Some code reordering and variable re-use was also done so the 2
> functions follow more or less the same logic.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/tests/xe_mocs.c | 67 +++++++++++++++++-------------
>  1 file changed, 37 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_mocs.c b/drivers/gpu/drm/xe/tests/xe_mocs.c
> index 9787546e42249..25dd93ff16062 100644
> --- a/drivers/gpu/drm/xe/tests/xe_mocs.c
> +++ b/drivers/gpu/drm/xe/tests/xe_mocs.c
> @@ -39,30 +39,37 @@ static int live_mocs_init(struct live_mocs *arg, struct xe_gt *gt)
>  static void read_l3cc_table(struct xe_gt *gt,
>  			    const struct xe_mocs_info *info)
>  {
> +	struct kunit *test = xe_cur_kunit();
> +	struct xe_device *xe = gt_to_xe(gt);
> +	u32 l3cc, l3cc_expected;
>  	unsigned int i;
> -	u32 l3cc;
>  	u32 reg_val;
>  	u32 ret;
>  
> -	struct kunit *test = xe_cur_kunit();
> -
>  	ret = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>  	KUNIT_ASSERT_EQ_MSG(test, ret, 0, "Forcewake Failed.\n");
> -	mocs_dbg(&gt_to_xe(gt)->drm, "L3CC entries:%d\n", info->n_entries);
>  
> -	for (i = 0; i < (info->n_entries + 1) / 2; i++) {
> -		l3cc = l3cc_combine(get_entry_l3cc(info, 2 * i),
> -				    get_entry_l3cc(info, 2 * i + 1));
> -
> -		if (GRAPHICS_VERx100(gt_to_xe(gt)) >= 1250)
> -			reg_val = xe_gt_mcr_unicast_read_any(gt, XEHP_LNCFCMOCS(i));
> -		else
> -			reg_val = xe_mmio_read32(gt, XELP_LNCFCMOCS(i));
> -		mocs_dbg(&gt_to_xe(gt)->drm, "%d 0x%x 0x%x 0x%x\n", i,
> -			 XELP_LNCFCMOCS(i).addr, reg_val, l3cc);
> -		if (reg_val != l3cc)
> -			KUNIT_FAIL(test, "l3cc reg 0x%x has incorrect val.\n",
> -				   XELP_LNCFCMOCS(i).addr);
> +	for (i = 0; i < info->n_entries; i++) {
> +		if (!(i & 1)) {
> +			if (GRAPHICS_VERx100(xe) >= 1250)
> +				reg_val = xe_gt_mcr_unicast_read_any(gt, XEHP_LNCFCMOCS(i >> 1));
> +			else
> +				reg_val = xe_mmio_read32(gt, XELP_LNCFCMOCS(i >> 1));
> +
> +			mocs_dbg(&xe->drm, "reg_val=0x%x\n", reg_val);
> +		} else {
> +			/* Just re-use value read on previous iteration */
> +			reg_val >>= 16;
> +		}
> +
> +		l3cc_expected = get_entry_l3cc(info, i);
> +		l3cc = reg_val & 0xffff;
> +
> +		mocs_dbg(&xe->drm, "[%u] expected=0x%x actual=0x%x\n",
> +			 i, l3cc_expected, l3cc);
> +
> +		KUNIT_EXPECT_EQ_MSG(test, l3cc_expected, l3cc,
> +				    "l3cc idx=%u has incorrect val.\n", i);
>  	}
>  	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>  }
> @@ -70,35 +77,35 @@ static void read_l3cc_table(struct xe_gt *gt,
>  static void read_mocs_table(struct xe_gt *gt,
>  			    const struct xe_mocs_info *info)
>  {
> +	struct kunit *test = xe_cur_kunit();
>  	struct xe_device *xe = gt_to_xe(gt);
> -
> +	u32 mocs, mocs_expected;
>  	unsigned int i;
> -	u32 mocs;
>  	u32 reg_val;
>  	u32 ret;
>  
> -	struct kunit *test = xe_cur_kunit();
> -
>  	KUNIT_EXPECT_TRUE_MSG(test, info->unused_entries_index,
>  			      "Unused entries index should have been defined\n");
>  
>  	ret = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>  	KUNIT_ASSERT_EQ_MSG(test, ret, 0, "Forcewake Failed.\n");
> -	mocs_dbg(&gt_to_xe(gt)->drm, "Global MOCS entries:%d\n", info->n_entries);
>  
>  	for (i = 0; i < info->n_entries; i++) {
> -		mocs = get_entry_control(info, i);
> -
> -		if (GRAPHICS_VERx100(gt_to_xe(gt)) >= 1250)
> +		if (GRAPHICS_VERx100(xe) >= 1250)
>  			reg_val = xe_gt_mcr_unicast_read_any(gt, XEHP_GLOBAL_MOCS(i));
>  		else
>  			reg_val = xe_mmio_read32(gt, XELP_GLOBAL_MOCS(i));
> -		mocs_dbg(&gt_to_xe(gt)->drm, "%d 0x%x 0x%x 0x%x\n", i,
> -			 XELP_GLOBAL_MOCS(i).addr, reg_val, mocs);
> -		if (reg_val != mocs)
> -			KUNIT_FAIL(test, "mocs reg 0x%x has incorrect val.\n",
> -				   XELP_GLOBAL_MOCS(i).addr);
> +
> +		mocs_expected = get_entry_control(info, i);
> +		mocs = reg_val;
> +
> +		mocs_dbg(&xe->drm, "[%u] expected=0x%x actual=0x%x\n",
> +			 i, mocs_expected, mocs);
> +
> +		KUNIT_EXPECT_EQ_MSG(test, mocs_expected, mocs,
> +				    "mocs reg 0x%x has incorrect val.\n", i);
>  	}
> +
>  	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>  }
>  
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
