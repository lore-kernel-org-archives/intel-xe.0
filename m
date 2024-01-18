Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E165C4707B
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jan 2024 08:02:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0634810E0D5;
	Thu, 18 Jan 2024 08:02:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCF1D10E141
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Jan 2024 08:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705564931; x=1737100931;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=e5dVWdrMb2HL3M/voI4bjB4Et94e7HdcoUWulqEz5Ss=;
 b=B7MPB6krzd2qUO5uD3S7kuUPtEr17YCKKsZ3CvTGA7EN0Vp29z6MQ7Q/
 bgWQkcKGhIZlX1i3V7QwTBinsbIzDg/ZvfUZtNMSq4rjdmNqvOe3/AOae
 F9ZccFUs4h/EdYoMvC0apngWUoKZtPmd4VahGT8xZGcds+gNa7ht3vMhK
 N67ISRwUEQk2lvN5QBsrPyuPmr2rS/SxiyMACgo1g3FkFmGFcBRyRR2l1
 orUEYgIxiCuLdzcL3rjG/r+xoDoING9AT6lqVImXA5hbW8sYvYoAzDUfg
 Jnbv7ytXY0XvqOCAU1ho9oS4DDZFqLEsjaPjqu5eM5M4eg22gWZLTVvB9 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="400043567"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; d="scan'208";a="400043567"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2024 00:02:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="1031573106"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; d="scan'208";a="1031573106"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Jan 2024 00:02:11 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Jan 2024 00:02:10 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 18 Jan 2024 00:02:10 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 18 Jan 2024 00:02:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iW2Q7qbrJUbjJTdDuQrhUZhs2DtYwgfgbAQ9wVpdqyrZJ/jZt43ge9s0M8UlS6WjzY+OGWUb0rrawGtaWj8wcFhCLEeCfleUYggRJHY2KFT53j0R4N8A5nJhKEltzCLFuEVe4yKbTyKibE0YUJm7AcRSmVGc1wwDWf2dCxR1xO6ndOLjnNG5x79aLl/BynzaNrqf7icmUC/Z5yEGJM6c4pgyLpzHAp5J2u+SAxnQyNnj4RjeQi0o34pXQKy4/jRpNZD0vvsZeKy4hZGrii31JqCsUy8BeDfODaF4JVWryFhUAGs0UdMT1cp6GKUvx0wbA/LlYIr3/BrRYOZAsUnwNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JIiCeWyQtuRmNQPmaqAvw/iw9UVi9w8hJBpUzfsNTRg=;
 b=CsxTb6Dg4ejUFG4bZQYV0KFMJQ3ixrD6gVmqA6FMuDTTyjhgJfBxG+GBurbcN5znaAdGcwW69pmlroNriz2Ia3V88BkKpSGG3SuSX3qHJTVIE2oVBL5aPwgZ64vB9n4v58EFZh7N/6xJkROVin8BKz7QIJPp7nPKm4yKnwITxauKoTdRWeLc2cv2bXJA5f4xrY0wCly/y4TmwSTrcXRm/eDHaSyE6tm28iBfVOkTDAHdant4RnnkEo6FDw4G+boPqCLVjbxIwIaPiqciVKq+VPgj76C+04wLHPKuGHxwsbGPLcECU6ETTeiuKNXKPr/xqHW47pyEiTWje2iDyGeiOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by BL1PR11MB5463.namprd11.prod.outlook.com (2603:10b6:208:315::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.24; Thu, 18 Jan
 2024 08:02:08 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::8178:9420:e286:3136]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::8178:9420:e286:3136%4]) with mapi id 15.20.7202.024; Thu, 18 Jan 2024
 08:02:08 +0000
Message-ID: <babeb85d-e03f-4433-ac71-1a244485eea8@intel.com>
Date: Thu, 18 Jan 2024 13:32:01 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc: Enable WA 14018913170
Content-Language: en-US
To: Karthik Poosa <karthik.poosa@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20240117055035.2417711-1-karthik.poosa@intel.com>
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20240117055035.2417711-1-karthik.poosa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0121.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:6::6) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|BL1PR11MB5463:EE_
X-MS-Office365-Filtering-Correlation-Id: af50b059-4db8-4a91-68e0-08dc17fbc468
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1n1WHF+LErha8M6zZEnyEJXblxW09bWKXx4omfJpOyBS/evvHwAKs7Yd7u+MoLfc1+QvPzt8VQc28QMKZYRIMfnBdiayjVuHo7eLQ7UIiZkIpQPN63DXNPGCHtyLJvd9r50gTgEUSBaZlZTg6KzGX1xodcQXTyilaDyG8FOc9s1E+021itCVMhEqVGYG7LV9J0YRqvLt+Fk0QFEjGKgNqB+lh1topm12vlgJlwi8qVhM+u9Z4PW0H2nlbRWSHr+oIBeFEhDeI8FN6BOruDv+n1BpolHw1D6FABBl5uaYnbbiywRrikS6KdKk2tnE4XnN2j5bbPuw9AqQ/sWAeuZzLB4EeGw3zF6oyg9O9Vo/HrG2kYcBzu8oaUngiCtmuI01q/MsZVGFop3cejIxs8tB+Q9L66hI/MbasBecUKoaCEz2hFuctTYAFI+Eh3322aFf8aHQZ7Ib7MyeV2iLwfVGD/cJBghc6yO1gdlkq7pweJuctlvMWrcYHYmOcd7MRW+Fl1v2jBDImTOWpwdYsnrVzBzTMjILhTFUQe5hrNRNO4dZ03wfTg0U86wXVANR4EZWuBxdgwakzeiMod7x6UXjJLLcVWa/nu5PnAMhMdNibfW2edIxh4XOEomFQDu5mLnr/LjY+AJ2Lc4Fy0pVoe3b5818cePru2TLYW6zW/4ufgTrgsLjjyihUI99KJH2pFiU
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(346002)(376002)(39860400002)(396003)(230922051799003)(230273577357003)(230173577357003)(64100799003)(1800799012)(451199024)(186009)(38100700002)(2906002)(36756003)(31696002)(86362001)(41300700001)(82960400001)(53546011)(316002)(6512007)(6666004)(66946007)(66556008)(66476007)(478600001)(6506007)(6486002)(8676002)(4326008)(5660300002)(83380400001)(8936002)(2616005)(26005)(107886003)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d3JuZThQZW0xbGpJakhNOHpKYlppN0JmZXNNbUZmdnhCbEZLbzFBRmNmWlBk?=
 =?utf-8?B?QWJRditUbXBGc1RoWHVpWEJUV0ZrcEhqRHg2bzF6L2RCM21wMGdyQm0zU0dm?=
 =?utf-8?B?bGJJdU9Ubk5kSFE0R0dpZ3dSd0pOUGhYbkV0TC81cUlHK1doWGtLNW5KQ1Bx?=
 =?utf-8?B?dWtqc3Ftd1FwL0Q3cmVlZlVKaHVTb1hMR2dtOGtXL1dxWTJycUdNUmNVODZ5?=
 =?utf-8?B?N2s0VG9ZemYvNCt0b2J6OThPbUFIWWlvV0orcllMRmd5ejk5OS9RSE9pVGJv?=
 =?utf-8?B?ZjlQT0M2QytGL2xTN1NIUTAvb2xsb3ZqMk9iZTZSbUc4d3JMYnFPdXdjUDJw?=
 =?utf-8?B?amc0N2VWRzhHQ0ZDbk1oNUJTUzhRQzFvVTlQNldvckNDK3lxNTc4Z0l0Unpv?=
 =?utf-8?B?VTRVZUlWa0dkTUg2WXFOVzJxSGZRT0toRzFRdmJpKzVpNS9qb3BaSHV3Yndq?=
 =?utf-8?B?OGNuaFBrbmp1U3BTckV4blVJaU1NdVN4TFRNVXZydG1HRjlBWk1HMlEwc3hZ?=
 =?utf-8?B?NVJaeXVDbE5ZaVdPaXR4djRMZm1pMDhaQ040b09xOUxCUW16UkZxV3YwZnN0?=
 =?utf-8?B?TUZHL1pTMSsybW5neFE1Z3c4R1hJaVJFa1FnSFJPbTN2eGJjcUE4RFcrelhw?=
 =?utf-8?B?bDNHSERjRFIzTUtWUDg1b1pYc2Q4bDVwUlJOTk5WSXBYUHRXQkFnaTdzUFY5?=
 =?utf-8?B?dHpEOWFjRmoreFdZOHZzWDBac1hNN005RmJubWZmWDRVMHB4R3h5V2cvdlBC?=
 =?utf-8?B?YnZXeHZSbzcza0pGU0VTcmEzaEplbjArSU1MY3gvN2gyOGFxQjgrNzhDUkQr?=
 =?utf-8?B?cCt1SUN2ZTJPR3NQd0ozNzlkWjhySkkySWNjMjV2UVBDYkVwUzUwT3V0RDQy?=
 =?utf-8?B?YjJxM0VrVkZMVkxPTkRyVndTRTZQVzB3QWdqLzFqZGN3OWt0d2p5NDRPRGtE?=
 =?utf-8?B?c3VGSEdTZ2Z0ZkdTL09ua1JuaW00TFlFUlVmVkUzR1JodFJPKy8relNFTnFk?=
 =?utf-8?B?U0ZRQmQ0R0dNZkdQQk1XcWdxZHNucXBzRG5UbGNJTDNzS1A0VzFGTnRYejRR?=
 =?utf-8?B?OC9Xa1Q2YjBxb1UweHUwNVUvOExJZ1o1eDBRYWZNUDlYY0NYeG9iTnpRZERu?=
 =?utf-8?B?Q2J5N1FBN2U5QmhTcHAyTm5OTlF1MCtHcmFydWpYcVl6NmozNStSWS9HRzlJ?=
 =?utf-8?B?bGFnOEdKSkcycmlnSzBNeU5CUnhHd1dNcDByMWg0WGEyUUQxNTNDSHpCWmdN?=
 =?utf-8?B?VUxUN2tnaFNQaldDVG1vaU5vT1A1Smw3UXhhL1NaNWJhWlpBSnhUK1lNWFpP?=
 =?utf-8?B?NEZFOFlLU25uVTQ0OElWYThHdGUvUWV5UHhNSVRaTHEwMHhVdll1Z3FlQ3l1?=
 =?utf-8?B?WElVSkUxcWZVb2NOZGt1TDZYS0RqaUt2U09Bby91RGpSQ3dSam0wSzRaMjdI?=
 =?utf-8?B?YTVFRjBRUk9JYWNCM3pGQUIyMitnL1Fnd3FRdkJLenF1RnFNNzh2OTBPYVpz?=
 =?utf-8?B?V1pEeVhLVHltcUtDWlJXNXNxckJ2UXBUSlZTZGhSWUJndXJNaEh2N1Q1RU9W?=
 =?utf-8?B?Y29EeWZGd0puMmNUNXZXNkcwNHJUVEdkMTFDZUY1akJyTzNld1FWOGh1VGRt?=
 =?utf-8?B?cStiVmh6WEROR1RwcUg4bi9nRFQwczFoZ3hqNVpneUF3MnA2YnhjZHpqWnFH?=
 =?utf-8?B?d3VxYjNHbHNQWWlZbFBac3dXRHZ4NGplaWVNRXJFNlNwK1FzS2NDVzJHWjZJ?=
 =?utf-8?B?eStONC9oVDl4OTE5d0IvaHh6K3QvWkVPQUYwQk8xVE5xejV1YnlZdDNtbUpO?=
 =?utf-8?B?YUhmUVJoWHY5MWtKNVVkWXJPeEkzV1VKaFlPZHpZSGRGUWY5a2w3aXVPODYw?=
 =?utf-8?B?ZmUzRE1oZHE1Z1VsU2ZsdkZ5SlRMVnkwWExZU3NBSS9VUHMyaDBCdVg2L2V1?=
 =?utf-8?B?WkFuVTZQazlVNERhZ0hUbkpCTXNzOUZvU2xBSExKSS9MNk1nbWFUZ1BQaGN3?=
 =?utf-8?B?QStvVE9IUm8vU0ZpYXltMDAwUllkcUpRdkJuV1NYUVc5ZjFyQzY4MkVOeGZI?=
 =?utf-8?B?TTJWakc0clBSQWJJWjByYUVNNEhpS01vQXp3MmlyS3lRRXEwdHVJY0UrOW5T?=
 =?utf-8?B?RkZoMjJwNzhsQnNhQ0ZQMW1EVFo3WncwTUFWTUFhTEJrdmUyblJSWi83ZzB4?=
 =?utf-8?B?VlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: af50b059-4db8-4a91-68e0-08dc17fbc468
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2024 08:02:08.2848 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jtkfHRNJBVwmv6srHxNVkJYhc/Y94ehHdjObCibRU8qsZIOZEsvANtP5IQdcc/JWZ7BtcrJ/5pXRwumM43qa9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5463
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
Cc: matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 17-01-2024 11:20, Karthik Poosa wrote:
> The GuC handles the WA, the KMD just needs to set the flag to enable
> it on the appropriate platforms.
> 
> v2:
>    - Fixed CI checkpatch warning, alignment should match open parenthesis.
>    - Fixed GUC FW version check to use XE_UC_FW_VER_RELEASE which points to
>      current GUC FW version instead of XE_UC_FW_VER_COMPATIBILITY which
>      holds GUC FW I/F version (Badal).
> v3:
>    - Removed extra character in debug print.
> 
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>

LGTM
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc.c        | 13 +++++++++++++
>   drivers/gpu/drm/xe/xe_guc_fwif.h   |  1 +
>   drivers/gpu/drm/xe/xe_wa_oob.rules |  5 +++++
>   3 files changed, 19 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 235d27b17ff9..2891b0cc4f7f 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -132,10 +132,15 @@ static u32 guc_ctl_ads_flags(struct xe_guc *guc)
>   	return flags;
>   }
>   
> +#define GUC_VER(maj, min, pat)	(((maj) << 16) | ((min) << 8) | (pat))
> +
>   static u32 guc_ctl_wa_flags(struct xe_guc *guc)
>   {
>   	struct xe_device *xe = guc_to_xe(guc);
>   	struct xe_gt *gt = guc_to_gt(guc);
> +	struct xe_uc_fw *uc_fw = &guc->fw;
> +	struct xe_uc_fw_version *version = &uc_fw->versions.found[XE_UC_FW_VER_RELEASE];
> +
>   	u32 flags = 0;
>   
>   	if (XE_WA(gt, 22012773006))
> @@ -165,6 +170,14 @@ static u32 guc_ctl_wa_flags(struct xe_guc *guc)
>   	if (XE_WA(gt, 1509372804))
>   		flags |= GUC_WA_RENDER_RST_RC6_EXIT;
>   
> +	if (XE_WA(gt, 14018913170)) {
> +		if (GUC_VER(version->major, version->minor, version->patch) >= GUC_VER(70, 7, 0))
> +			flags |= GUC_WA_ENABLE_TSC_CHECK_ON_RC6;
> +		else
> +			drm_warn(&xe->drm, "can't apply WA 14018913170, GUC version expected >= 70.7.0, found %u %u %u\n",
> +				 version->major, version->minor, version->patch);
> +	}
> +
>   	return flags;
>   }
>   
> diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
> index 4dd5a88a7826..c281fdbfd2d6 100644
> --- a/drivers/gpu/drm/xe/xe_guc_fwif.h
> +++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
> @@ -97,6 +97,7 @@ struct guc_update_exec_queue_policy {
>   #define   GUC_WA_POLLCS			BIT(18)
>   #define   GUC_WA_RENDER_RST_RC6_EXIT	BIT(19)
>   #define   GUC_WA_RCS_REGS_IN_CCS_REGS_LIST	BIT(21)
> +#define   GUC_WA_ENABLE_TSC_CHECK_ON_RC6	BIT(22)
>   
>   #define GUC_CTL_FEATURE			2
>   #define   GUC_CTL_ENABLE_SLPC		BIT(2)
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index e73b84e01ea1..b138cbd51bdb 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -17,3 +17,8 @@
>   14019821291	MEDIA_VERSION_RANGE(1300, 2000)
>   14015076503	MEDIA_VERSION(1300)
>   16020292621	GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0)
> +14018913170	GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0)
> +		MEDIA_VERSION(2000), GRAPHICS_STEP(A0, A1)
> +		GRAPHICS_VERSION_RANGE(1270, 1274)
> +		MEDIA_VERSION(1300)
> +		PLATFORM(DG2)
