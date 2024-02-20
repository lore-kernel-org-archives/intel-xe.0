Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88384C48BC3
	for <intel-xe@archiver.kernel.org>; Tue, 20 Feb 2024 17:16:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50F0C10E59C;
	Tue, 20 Feb 2024 17:16:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MlnkE1Hd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 233DD10E59B
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Feb 2024 17:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708449377; x=1739985377;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=+cCXPcHykQrbHmou0XHXsikR8u6CO3tnpPzHeWn7HC8=;
 b=MlnkE1HdPcB/8YRu8n/JKfemcgAwolLNTmh7nwy3xum0dl0JIvDSRAJx
 psbJdGfIoj/YbVmolPxQRlBfip0HEVRC1XuaDlqAJmZJqZDgSWk/lCf1y
 T08giywL2jywkw097zYfHkjvnk9skXbsXqPxziOY6x0Wdpimr9Lg+J3P5
 VMRdvc2wJ4B4cI/TFdIqj0cuuYk9Z5B6p3l85jIdHn+Dt2CMMmWFgwaKf
 BlydktHs4CC4FHQD/CuI0FP38N55MFwUgcUdKS8S+FaaNcEsLd6Eunqgz
 hJgcFbX0L0XQcb7UCkA/X8LOftP5qYNo5vENLOyQEv3ysHTy4bOAOZc1Z Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="2427988"
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="2427988"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 09:16:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="936480974"
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; d="scan'208";a="936480974"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Feb 2024 09:16:15 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 20 Feb 2024 09:16:14 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 20 Feb 2024 09:16:14 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 20 Feb 2024 09:16:14 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 20 Feb 2024 09:16:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H38LAxeViOvxMoePCxUkU1G+fxlVt/S9noHWGRKzg04ugbcjC5AhQ/d+SWMYyWMFvpXXM9PmLi7/aog74c2dpvLloX9GfGsyZlrqYuQehTKJxGa0ozmRTboTxwLJZ58yj1uC11hlITOSjELlJHqyckOTSS21L20VXErgIFJhYeBFVSmORFyNYfuBtWwL8iSexwOj0QmvPd8BMZqTiw0ZrD7FBk0ugGayJND86FyU5qmodgl6cC5QUySzMyBwMVLFDtW4t0SX2Zr4sJJVkIhtfI4nmCy99nIPx7ifaIMqYOXnzRf/Xt/YEZjsTtb1HSv/HAA3u2sIEqhRgSDhztoynA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DeFvtgdaRGRBsXbgBtGDTOlpe5UAp9anjSWOeZm1ZDs=;
 b=X0EQihSbrRssGEbBrNqbHBuSuXYzjEU3X96/NI9LwP+4QlZKeWqDi5inw57l+oeJOhgLP3UP5bc582WT1ufhw4rTwTtm6wMe5fh6q0yzzq9euGsQom1X+hkZCJimfDLAX/eC+p2mjD0SUIR9T8JO4LPDQrM8D7H55FLo6Ml3yLeZLu3huzKzfwfCUlE7PbB2t9XllWYxKW5JFySJNr9MJV/i51uE4cGHQE17Q7MeEtOHhLPOzxqYB5Ns9I6e0i4tIN5cLGoHDkkhhaJ9VfUf88xnB5r3ywHQZ6/hWrVRsu5znT7Xqk6gFDsXzWVwb6nqTjQb2bvsYX4/sUs/ZVzuFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS7PR11MB6015.namprd11.prod.outlook.com (2603:10b6:8:74::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.39; Tue, 20 Feb
 2024 17:16:12 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::5e59:3f96:d8fd:f144]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::5e59:3f96:d8fd:f144%7]) with mapi id 15.20.7292.036; Tue, 20 Feb 2024
 17:16:12 +0000
Date: Tue, 20 Feb 2024 15:05:27 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Shuicheng Lin <shuicheng.lin@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Skip TLB invalidation time out log if ct is
 disabled
Message-ID: <ZdS/t2KKI79Kyy7C@DUT025-TGLU.fm.intel.com>
References: <20240220021356.3514454-1-shuicheng.lin@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240220021356.3514454-1-shuicheng.lin@intel.com>
X-ClientProxiedBy: BY5PR20CA0025.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::38) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS7PR11MB6015:EE_
X-MS-Office365-Filtering-Correlation-Id: a1076b18-b8ff-45d5-a723-08dc3237a2f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6f5C2IHQ0VvU1Va5wdUn7wzWTLeZSlNPwU/ai3SNaoiVq0gUiHVUs1oaA3CSJmuQ5CBWm8DSS8XGPK2ve0T1NydZ4mHJjax39uf/AjPE674ecbSKmAkqzI2PUS5+E6s/snGG0nasP/L8knlM9YMXxEI/jR8aJudf0iA/xpQRqbht7yMRxf8+Sq5+pMlCZCrYoncI4oTdmCmHmLp/3TAbnSdpZPiEzyzgUyuM2r6Kz9ScCO9DwaAYIZ/ViV+jqiX5Bszh1/6727AxDAugYqOSCKI4IzUmvrHxYBPyusUZHe58+NkzlMKa6XvYBtj8p+1qhE+SBblrCw9NctXiWXZtk8ZxtdeCnesAXjikCi4zn57AcEhNkmuOrUxzEY2axh0cr26E7LmYXTDBdtX3J9ObQsv30emt3RgIHBZNmokWTZ8X2lAA2VAEzlEUW19m2HmUxCij+2yEiUCraUsMdAiYOidX0VjhmMXChJOXw2ZjdVA+NImOVO7dK+AuIleWUQFCy6tSs0HR+ERe4cAtWLHKsg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bWc5RGhuaGgzU2c3RlhlWVpLV1V5cGpCMlQ2OW1sWVhMVTA4azJocnZicFVK?=
 =?utf-8?B?UUd4T2F6SWZtYlgzbFNmd05GZi84S3dZK1pUWnk1WmRWZVk1QUR1dGRaMiti?=
 =?utf-8?B?RmNCR0RzVmNvdUJyVFJlNTdCUHhnczA4TXdQekZnZ25JblROYTc5QlBZQWw5?=
 =?utf-8?B?ZTI5K0FvM0R2RUVTcmtPM3pmK3UyTVRaMGIvZE5hUkU0Q1dpazRxT25ScS84?=
 =?utf-8?B?aVVXZ3BkV2ozVE5CNWFXcDMwY2czWENvTjZLNkpiOWMyemhjK0l1ODYvNjdk?=
 =?utf-8?B?a1RFcXRha0FORCtNNGpXZEJvemRtK0x3OVFZNU1HSll3Ymp2Z24ydFhUdFF0?=
 =?utf-8?B?Y1VwYWxkclg2alNDeGtZU2ZPWjJ2VlR5QVN4YVJ0ZVV3QVJhMjlXRVFXRlRy?=
 =?utf-8?B?aE9uZzBZTG9DcnUxL0k5VTdVWVpDS2YxYndxVGMrR3puQk80UzVLV0hHNmxK?=
 =?utf-8?B?OCs5Um1uSjVwa0FvYmRiMjl4Nnh5UndDbkJOS2pZOFZMRWFTUkxuaXJybDd4?=
 =?utf-8?B?SDQ3ZThPcTlmWHJZVThKMWhjU0pvZkFQSUVZWk9rL1MrbE9yR1F0N21POXpo?=
 =?utf-8?B?KzM3Mm5pZitHZWhnUXdRbUtLaGxxQUVpOHdqblVhNklSQzEybTJKYnd3YkJI?=
 =?utf-8?B?L2o2M3RjTXJBTzZnZHlhdmREdTR1bExZNWwwaHJ2WnFld2NGTFAzWlRjbURP?=
 =?utf-8?B?eGJiZExQNnlwMzhVNHF3aXc0ZmQ3cUJEZzlIejFlVll3QUE0RmRqYmNKMmNq?=
 =?utf-8?B?ZFZZV2RJWDlINUVhQVBnTFdQMTRLYmhLSlJkdXJsNS9MY3VvNC9DdjB3bVRV?=
 =?utf-8?B?RjVxNXM3bjF1UjI0MG43ZW0rRDFaWmdJcGdDM2Z6Q3phZ1pmTWkxcVlPTEsx?=
 =?utf-8?B?Kzg3b0JWYTBCaFVDdjd2Um9GUWpZYmJCR3dtcUV1OFlSSWZtWll4ajIyb0kr?=
 =?utf-8?B?ampMTzJkbW9uS24zZi9jQ3EweHBiNlY2cnN5ajRqcERaSXVZMGE0a1RZRGNP?=
 =?utf-8?B?RFJzS1kya1RoMXFBVmdRWkdiRytkQkE0dUxueE9PNDFRV3k1a09wSUZmWW56?=
 =?utf-8?B?UFd3NnZocmJGTVJIaEZ2ZXdMTklaZVpzajBiNm5CS2ZLWkxjTGQ4c0Z5L0JQ?=
 =?utf-8?B?V2NBTFlrUm9BUUVMUVlsak8wNFhYZkNXdERrYzg3bXAxbnJYL25BOWxaN3hN?=
 =?utf-8?B?S1NXcko1YnFjemVVczBhUTNIRE03d3dlYjIzMWZQZm4xUndERlJMd1ZqaG9V?=
 =?utf-8?B?R3djKzNQd0Rmb3loTnB5NkVJVlBhNFR6anZXM1JnNWQ1ZklMR281YnU5cUVX?=
 =?utf-8?B?Zm1KdENrSmN6TTlpKzloWHNpL2U5V3czcC80dFdhWXRlSEwxMVpZckNMazRz?=
 =?utf-8?B?bXFJWkhodmtnZ1FJK3A2ZFpHbWdDODVBTzNJaU12K0g2QjlFNktxVzl4czM3?=
 =?utf-8?B?UWdWU04ySW53QUUwNzIvMjdNZ1M1Mkttb1hGSXI1Si91NGNwNEplZVJZd0s3?=
 =?utf-8?B?NkdHWXNrb2x0c0dzR1pqMEFxT2VjdzFVdFcxMkxrQ2NheGk2TWtWdVBCY042?=
 =?utf-8?B?aGtYQ3BLZk5UM1NGNUVJRUhXV1Yra1BpMWQrNDU2MWQrbmFuTUFOTFJ1UXdD?=
 =?utf-8?B?cVJ4ZXN5NWN5aEVoU1k5dzc5TnJPZ21PTXk1YlhPREhUZXJWd3lodldaT3hV?=
 =?utf-8?B?N09WRVZlWm40cTVuRGhXV1dIWHZFYS8xMmVabnJ1dk1PakRJK1JwVkFrQ1Nt?=
 =?utf-8?B?SGNjaENUVWd2Qlg0bnh3WVJJTm9DeWdyRzR6TExwTUxJUERvNE92SFJ1cXp3?=
 =?utf-8?B?a09rQUNianFQZEZWZU55RUxCSERFdXpSdUdPZ0JmR20vR3Rhb1dac29sZ0R6?=
 =?utf-8?B?bld3RHltTEZkVTFVdURuRll6VGFIYmtSQWFXWjFqN0JVR0VTSmYxVmh6S3lq?=
 =?utf-8?B?VE9nN1doa252dlBMVGpyZzl1VUI2ZGVaalBOS2YzamxRZ1ZJa0FJczNtL1dI?=
 =?utf-8?B?MW91UVJzMlBUOE5kS1hJdDN0dlVRMk5jNkVJTXVJR3FKVkpNclNtY05VcVVN?=
 =?utf-8?B?QTM4ODFjWWhZaENCaGxPZS9VV3lGSSszR0M3Z1Bjc1MzK1FWSDNVU1NEUmYr?=
 =?utf-8?B?Ukl4WGNCN3EzM2NSVHlzYWpzT2ZaTEpyUmZDNzQ4S2JqWmwyQmJBWUxnS1Zz?=
 =?utf-8?B?Y1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a1076b18-b8ff-45d5-a723-08dc3237a2f8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2024 17:16:11.9855 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VZSeK4RqJZ2wxTVVdP67w1RtTcj7AnVBekYnwaV6ob1aTuyGbIcGeaSioYzXzIihkoduJA6mdhZ/wIr6Uzfu1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6015
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

On Tue, Feb 20, 2024 at 02:13:56AM +0000, Shuicheng Lin wrote:
> Suspend may cause the TLB invalidation time out as below log.
> Skip the log print if ct is disabled to make log clean.
> "
> [  228.812266] xe_gt_tlb_invalidation_wait enter
> [  228.812311] xe_gt_suspend enter
> [  228.812782] xe 0000:03:00.0: [drm] GT0: suspended
> [  228.812786] xe_gt_suspend enter
> [  228.813508] xe 0000:03:00.0: [drm] GT1: suspended
> …
> [  229.067007] xe 0000:03:00.0: [drm] *ERROR* TILE0 [GTT] GT0: TLB invalidation time'd out, seqno=321, recv=319
> [  229.067099] xe 0000:03:00.0: [drm] *ERROR* GT0: CT disabled
> "
> 

This doesn't look right for a few reasons.
- The timeout still can race suspend and then a resume
- The xe_guc_ct_enabled check also supresses the -ETIME return
- I think this message it actually valid

What should probably be done is signal all pending TLB invalidations on
suspend. I think we are doing a bit of rework in [1] in this area too.
I'd say let's get [1] to land and if this is still an issue fixup the
suspend path to signal all TLB invalidation waiters. Signaling all
waiters on suspend shoud avoid having this message be printed.

Matt

[1] https://patchwork.freedesktop.org/series/129217/

> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 17 ++++++++++++-----
>  1 file changed, 12 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> index 7b3a54748b49..8aac12efea84 100644
> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> @@ -330,11 +330,18 @@ int xe_gt_tlb_invalidation_wait(struct xe_gt *gt, int seqno)
>  	if (!ret) {
>  		struct drm_printer p = xe_gt_err_printer(gt);
>  
> -		xe_tile_report_driver_error(gt_to_tile(gt), XE_TILE_DRV_ERR_GTT,
> -					    "GT%u: TLB invalidation time'd out, seqno=%d, recv=%d",
> -					    gt->info.id, seqno, gt->tlb_invalidation.seqno_recv);
> -		xe_guc_ct_print(&guc->ct, &p, true);
> -		return -ETIME;
> +		/*
> +		 * guc ct may be disabled during the waiting period and lead to the timeout.
> +		 * Such as power suspend just after this tlb invalidation wait.
> +		 * Skip the error log print if ct is disabled.
> +		 */
> +		if (xe_guc_ct_enabled(&guc->ct)) {
> +			xe_tile_report_driver_error(gt_to_tile(gt), XE_TILE_DRV_ERR_GTT,
> +						    "GT%u: TLB invalidation time'd out, seqno=%d, recv=%d",
> +						    gt->info.id, seqno, gt->tlb_invalidation.seqno_recv);
> +			xe_guc_ct_print(&guc->ct, &p, true);
> +			return -ETIME;
> +		}
>  	}
>  
>  	return 0;
> -- 
> 2.25.1
> 
