Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7FC7E810A4
	for <intel-xe@archiver.kernel.org>; Wed, 27 Sep 2023 08:38:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B208710E4A2;
	Wed, 27 Sep 2023 08:38:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16B5910E4A2
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Sep 2023 08:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695803892; x=1727339892;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=F7/kEhyWhx9t0WL2KkDq8eizMzvuQp3Lqe0t4Oh5+6Y=;
 b=fE2junzclLcE/XXGKfVrRycU2gZBUmFhJ+soes78vQzGYoZ2HRqyhERx
 4U6QsJDb6e9wcdAvA+lKZckHSkYD5GdXKwRK7FoZ/RV5JPoymWgrNSbfK
 iDBB5ot+uFIPexwlQOEjHDXf8VrzVb7FSwsilpwoNqLbC5bTDDVYAGE9b
 9ssQ1Sd7nlQPWI16y6TLAxEynqx6jDyeGmJHcC6Ta2ffVsCblN4p2zKwL
 mzDhu8TsRfnPt+AvM+dnkHbg/si0Nj2CtsG+rW0Ra3YDTT3rQiZQl1x5+
 K72O9OsRa5F7mWli7OrsptonqtBPMlcCmPHcsyUHzHiyXmyyYb88FVCAG w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="362017360"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="362017360"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 01:38:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="839345320"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="839345320"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Sep 2023 01:38:06 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 27 Sep 2023 01:38:06 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 27 Sep 2023 01:38:06 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.47) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 27 Sep 2023 01:38:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fKuc09yx+19gEWF6tkDHAKDx7Z5N2FZxpysakrdsKBcg4CrP6aoS77zKRsdgu1bPAwPOUpR+9ThztyL3lShgaqbrUwaeRcJiKvzrESRTspkLVjQR2lNjtHecNvkNvBajMFwbhL7ZvwFz6iHW3zzlrY0LSK7ML5/4MABMXW948A2wrNSSOKcM6uwB/7FQ/yc6zH+ViBCqQUFbPdOYiUEqloHs89kYeuDLQ4VQfEVnzso4Hl0nkd4dBdqSgfsv3K66vTIetJpGD2rLFniKX07oF2jBLK+kUBAUeixl8rDMQXYj1E+yHkJez7cZgO7iOlA4Q7lSk5UxeuBRSjlrynOwLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=At5wJQw+Z+4YvOMftYy7rQPHS+cCPoCcJcJTMx+BHhg=;
 b=K62deINIY7moxD9Tc6bKJc0Jcfxr69hDNf0CQA+2fp0snKOvYmqDf9Vjm30zu5JJf8KsDXdfvvfZRNnOnQweplkxgDJ6GpJp2SJGK24AI9baGKRNOmP22q9YewH9gzjpGmwTv10jdXsBhZETs9tojjU4uKcN8Mcmp+q5gihrzMXbwCAtjWuT6LhTifiiRSqXsk+kyNKyNNGyNLlIagCaZreUaBfX6GnG+zoXyMoQ/S31qTJh+JFZXecTqbcMseXLBj1MtyUrQT+MqRTupGwlQ9AayAENuWwRcBwqBxvjtIHSPZZsY9g07WGZwuPuVrqJO1k9EfrJoiKa1CrMi/y1Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by IA1PR11MB6540.namprd11.prod.outlook.com (2603:10b6:208:3a0::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.26; Wed, 27 Sep
 2023 08:38:04 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::15c8:5319:c6bb:323c]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::15c8:5319:c6bb:323c%7]) with mapi id 15.20.6813.027; Wed, 27 Sep 2023
 08:38:02 +0000
Date: Wed, 27 Sep 2023 14:07:50 +0530
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
Message-ID: <ZRPp3t006D/3mfiS@bvivekan-mobl>
References: <20230922211323.1672907-2-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20230922211323.1672907-2-matthew.d.roper@intel.com>
X-ClientProxiedBy: PN3PR01CA0083.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9a::14) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|IA1PR11MB6540:EE_
X-MS-Office365-Filtering-Correlation-Id: 036402c5-98a4-4033-1c03-08dbbf350fa8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Fzfl9LEbewWu/KZKeCoeGzA4SXLmGNIPv9EhmAPq/OyG7Cxn+FqI2UtJSV4cinc+qyiHVDW8GVlsTK6h8GnCUZ9jdB6a+Loiok0GmFJqWvA1CDuz17mxUA1IZbx4yDThtue51kgbeHGVLhq8jMPEG2ikPnEWC0N+CGyfM1ZwevHBiGogX+AW1q7GFTysk1xAjoc0+w5OsC0YbHmSRacI503HqJinu+lRvCucN3WPQM1+jYZtNIOV5LIRkJOS97hTi9NViLqc4pnfFELJ3Aglznchqc0FfVZQO4HU2CjU5PWygp/VXgQyi2fKjrurpo8D/ZPz30I8zlSnkjzdkNewkpZxfKk28HEFEBPsY3rFYTiFHUAai/y9u2ociv5tB6KJ8Lb6W3e8aLlw4X5FDgwB6cuHCn2rSsxfBIPzlFvWbZP4X7Db8UnQxRqylr6rORlYs/D/QOwugZNz1C/JCyCK/LixhOQk5UlvGZFEVtaQsKDWVDQJNf/IYfJCy+lwyeouQ7PiMvdCLnvtOuuibjJqjtKVMw6846bdbf6anHmH3GTvNblhP2RrZdLutS8ovOl+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6974.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(376002)(396003)(39860400002)(136003)(346002)(366004)(230922051799003)(186009)(1800799009)(451199024)(86362001)(8936002)(2906002)(107886003)(478600001)(41300700001)(66556008)(66946007)(82960400001)(66476007)(33716001)(38100700002)(6486002)(44832011)(6512007)(6506007)(83380400001)(8676002)(26005)(6666004)(316002)(9686003)(53546011)(4326008)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ajJSU0gxS3BBVXZ1UFAzaGd3b3ZoU2VSUmFVQmJrdDJaa1VTR05jNGR1Mmk3?=
 =?utf-8?B?N21HUUZ4TVhRSG9PMFh2VFN0WEp2OGpNWEltT2wwT00zM3dQZ0s1Y2ZrSWQy?=
 =?utf-8?B?M2p1SGU2b09hMlZHVUU3WGdkSUR0QnY2dWk5WHJBQmpyN05IYXhxaHZ3TUNa?=
 =?utf-8?B?TGppcUtjMFd3VVpyemVtTGs4aklpTkVSZE93cVQwUEcvUEFmeGVwL2d5c3Vn?=
 =?utf-8?B?TWYwUWdVSnFHZytkZjJkQWp1c3paZWw1K2lSYmFUTERDWlNCQnR1YjRrQm90?=
 =?utf-8?B?MUNmTUl2ek1sWEVpOHhiMDErL1Vqdmh2Nk9DYVFvdjhsTTM3bjRkVWNNSzJv?=
 =?utf-8?B?eFFLTCtYcjVIU0paTXBzRWJYdTY2VTNyb3dWWWdHRE1mVVN4Q2RVTXA2UnlU?=
 =?utf-8?B?R1lJYWx5ZGgxUEo3V3Vhb25YY2d5QWd6K01VWHBQSWxUcTNxcjZSVGxSZkgz?=
 =?utf-8?B?dkVuUngvTmpKZ0hjUkp5Rk5YQ3BwSVJCeWhLN2J5ajBCSFVkZkdIVXNHRSts?=
 =?utf-8?B?R01WV0tiaHFFOGJoUUVGRGgrVkR1RnVadjZBS2dlV1RxSVE2eURhL0hRaFJN?=
 =?utf-8?B?cUZYdTd1MXc2SjlhNGpVaVZ6QWMvMXNyaHR0RExBeDJVNTUwQlNRaUhzbm0y?=
 =?utf-8?B?MjljYzNPU1RvNVp5VU1kVEN2Qk1xdm1QY2NJNW9Bb054UUlIVUVuUnlGN0M5?=
 =?utf-8?B?WHFtUzVnOXlYbFpmVUpNN0MwdzFQT0U1cktITGFTWW1oR3BRZ280MzFlU2Mv?=
 =?utf-8?B?WTlNR3M4TG82ZWZ6eW5zWDlxaDd3cEZnVllCb2Q5U3N2NjU4dGphTHhmaEVq?=
 =?utf-8?B?MHB2QTJ6bWtXNjZORFhTMGtQd3JsYWRoUDMrd3FrcVRkTlpyc1kvb05OcXl5?=
 =?utf-8?B?Z0I1Y21HSlVjaWpoYnFjbEdtemhvdmV5Qjh0UXBsWW5HeTFiMEhpa0lGcjZq?=
 =?utf-8?B?dG5KRm5lYWYwR0VoaldBOUtUbXlLc2dDTXFNQ3pvN01wcUE2NXpkRC9rb0hQ?=
 =?utf-8?B?MnIvTlJsSGsyNHFDelRkSXA4cTdIOWZnTnVPYTh3b3kzOGFSZStpczducTJ0?=
 =?utf-8?B?dFFYcFVaVWtlU1B6ZlFmT1BCTk9LS0xUNXFBK2Y4RFFJRlU4QkZmK3VPdkI5?=
 =?utf-8?B?S1ByT0VUM0JOV1RvU0ZzNDNpSG1IMG9DRzdFbnpmMkVBWHkyUFBpR25taU0x?=
 =?utf-8?B?NHNQRmkyZVVoMXhYa2xMR1gySnVhRXF1K21TMGduQjJvekRxWHN3N29iK0VQ?=
 =?utf-8?B?aXNIclpsUHQ0bURvMUhUZHhQUnFYSm9GSDM4TGNVUStBcWZ0RzVNN0xWNlJh?=
 =?utf-8?B?NGVVSG9MWWI5QW5PT2NPemdpdTRSbFlCRjZHNmpVRUFEWndhRHFmUEtsSlpQ?=
 =?utf-8?B?QmtUcStGeFM5K2xQNVZvMDcvU2tNVTNQTEZyYWpCVjR2ZE9tOWYwZzJYcGhw?=
 =?utf-8?B?MDIyN2tpRFZOOCtQOGxudnF5UTloR1NRU2Y5UnRTTlNhaVhCSjlpeGZVYzJH?=
 =?utf-8?B?TERxeHU2THdFclNGOHBhamU3YXFBRXpqWk1NZUpvWFVEK0k4Tmd2RDkzM0RZ?=
 =?utf-8?B?d2d3UUExMk0rT2R3TTRsbkxQREFMeGlCc1J6NE92bjNmbTVXSENZMG1SSnJx?=
 =?utf-8?B?WE4wVmltRnlkWmswekpQRDRzMWE5REJuS2RrVVJqZGF4cTRnN0lMYXV3bHQz?=
 =?utf-8?B?citXR3U3LzFBZUhKWnJQS05lWk1PakxtUzNDZTBEak9FUjdpVncyUHpsMFFL?=
 =?utf-8?B?YldMZW5PZjZkWmdtY3pEVEhOcHdmT3p6M3B5UUxPVHJuVHArR1NyRnQ3QVdX?=
 =?utf-8?B?RVI4N0UrRGpTRWVCQmEwU01LSjdkYnZPVFdIV0ZDcUtSZWVZMEpaU2E3Y3JN?=
 =?utf-8?B?Y3RyYlFpQm4xOEhOTDJvQ1NDSDk5Qmp0a2FaeHlFVTRZNncwM0JQbnVYOHFS?=
 =?utf-8?B?ZzdBb0NaSk95eGQ1ekNiSnByenFBUmgvamJFKzhyMlhEQWlFUHJ6QlMxUUxE?=
 =?utf-8?B?N3VBeTl2U3l4Zk9td21jSUEvb2RMeHdvc0pyRjNTbmkyUlNtQ0I3V0pCMmNR?=
 =?utf-8?B?Q0dhL2UxYjVvK3dqUTNBOU53UGhwTzJiWFNtemNQQy91LzdVbDFtM1p4eW5n?=
 =?utf-8?B?NjBiVXM4dGJONHJjdUxmY3U2SGRzcVR3NFJlT0puK05tRWw0OEJmejZvN05P?=
 =?utf-8?Q?SFVHssXRxUwlExZOgRt9WLY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 036402c5-98a4-4033-1c03-08dbbf350fa8
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 08:38:02.3746 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Oo+zwivNEWODrO8QKrOkYbxQ7pHXxjohcm4D6Z/PvfMZT61FDO5UcxyT64XKSNI1pkZhDfxn3zdh0x9HJLZ8FZRjuW8bc9bU/0TEINmqIpo/fEI+YYc+E5vj4N8fz1Cj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6540
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Infer service copy functionality
 from engine list
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On 22.09.2023 14:13, Matt Roper wrote:
> The newer MEM_SET / MEM_COPY blitter instructions are available on any
> platform designed with service copy support.  Since the GT's IP
> definition already has the list of (pre-fusing) engines, we can
> determine whether these instructions will be supported without needing
> an extra feature flag.  Deriving this functionality from the engine list
> also fixes an oversight where our Xe2 IP definition was missing this
> feature flag, even though it supports the MEM_SET and MEM_COPY
> instructions.
> 
> For clarity, "service copy" is a general term that covers any blitter
> engines that support a limited subset of the overall blitter instruction
> set (in practice this is any non-BCS0 blitter engine).  The "link copy
> engines" introduced on PVC and the "paging copy engine" present in Xe2
> are both instances of service copy engines.

Patch looks good to me. But I think commit description is missing to
emphasize the reason to check for service copy engine exists.

Actually the patch is changing the method we are using to check the
existence of service copy engines. So either we skip description of why
we are checking of service copy engine or change the description to
empahize on the primary reason.

The instruction XY_FAST_COLOR_BLT is only available on resource copy
engine but is not supported by service copy engines. Whereas the
instructions MEM_SET/MEM_COPY are available on both types of engines.

If the platform has service copy engine, instead of checking in detail
on which type of copy engine the instructions would be executed, for
simplicity, we are using the MEM_SET/MEM_COPY (non-optimized compared to
XY_FAST_COLOR_BLT ?) instructions which is supported by any type of
copy engine.

So I am thinking we should emphasize on the unavailibity of
XY_FAST_COLOR_BLT instruction in the service copy engines.

There is also a checkpatch warning to be fixed.

Regards,
Bala

> 
> Bspec: 65019
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device_types.h |  2 --
>  drivers/gpu/drm/xe/xe_migrate.c      | 32 +++++++++++++++++-----------
>  drivers/gpu/drm/xe/xe_pci.c          |  2 --
>  drivers/gpu/drm/xe/xe_pci_types.h    |  1 -
>  4 files changed, 20 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 32ab0fea04ee..2d20bcbe8d9b 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -234,8 +234,6 @@ struct xe_device {
>  		u8 has_llc:1;
>  		/** @has_range_tlb_invalidation: Has range based TLB invalidations */
>  		u8 has_range_tlb_invalidation:1;
> -		/** @has_link_copy_engines: Whether the platform has link copy engines */
> -		u8 has_link_copy_engine:1;
>  		/** @enable_display: display enabled */
>  		u8 enable_display:1;
>  
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 9438f609d18b..3fa47df52d4e 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -854,28 +854,36 @@ static void emit_clear_main_copy(struct xe_gt *gt, struct xe_bb *bb,
>  	bb->len += len;
>  }
>  
> -static u32 emit_clear_cmd_len(struct xe_device *xe)
> +static bool has_service_copy_support(struct xe_gt *gt)
>  {
> -	if (xe->info.has_link_copy_engine)
> +	/*
> +	 * What we care about is whether the architecture was designed with
> +	 * service copy functionality (specifically the new MEM_SET / MEM_COPY
> +	 * instructions) so check the architectural engine list rather than the
> +	 * actual list since these instructions are usable on BCS0 even if
> +	 * all of the actual service copy engines (BCS1-BCS8) have been fused
> +	 * off.
> +	 */
> +	return gt->info.__engine_mask & GENMASK(XE_HW_ENGINE_BCS8,
> +						XE_HW_ENGINE_BCS1);
> +}
> +
> +static u32 emit_clear_cmd_len(struct xe_gt *gt)
> +{
> +	if (has_service_copy_support(gt))
>  		return PVC_MEM_SET_CMD_LEN_DW;
>  	else
>  		return XY_FAST_COLOR_BLT_DW;
>  }
>  
> -static int emit_clear(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
> +static void emit_clear(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
>  		      u32 size, u32 pitch, bool is_vram)
>  {
> -	struct xe_device *xe = gt_to_xe(gt);
> -
> -	if (xe->info.has_link_copy_engine) {
> +	if (has_service_copy_support(gt))
>  		emit_clear_link_copy(gt, bb, src_ofs, size, pitch);
> -
> -	} else {
> +	else
>  		emit_clear_main_copy(gt, bb, src_ofs, size, pitch,
>  				     is_vram);
> -	}
> -
> -	return 0;
>  }
>  
>  /**
> @@ -928,7 +936,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
>  		batch_size = 2 +
>  			pte_update_size(m, clear_vram, src, &src_it,
>  					&clear_L0, &clear_L0_ofs, &clear_L0_pt,
> -					emit_clear_cmd_len(xe), 0,
> +					emit_clear_cmd_len(gt), 0,
>  					NUM_PT_PER_BLIT);
>  		if (xe_device_has_flat_ccs(xe) && clear_vram)
>  			batch_size += EMIT_COPY_CCS_DW;
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index dc233a1226bd..11d8017d6745 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -138,7 +138,6 @@ static const struct xe_graphics_desc graphics_xehpc = {
>  
>  	.has_asid = 1,
>  	.has_flat_ccs = 0,
> -	.has_link_copy_engine = 1,
>  	.supports_usm = 1,
>  };
>  
> @@ -574,7 +573,6 @@ static int xe_info_init(struct xe_device *xe,
>  	xe->info.has_asid = graphics_desc->has_asid;
>  	xe->info.has_flat_ccs = graphics_desc->has_flat_ccs;
>  	xe->info.has_range_tlb_invalidation = graphics_desc->has_range_tlb_invalidation;
> -	xe->info.has_link_copy_engine = graphics_desc->has_link_copy_engine;
>  
>  	xe->info.enable_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
>  				  enable_display &&
> diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
> index df6ddbc52d7f..bd0b0d87413e 100644
> --- a/drivers/gpu/drm/xe/xe_pci_types.h
> +++ b/drivers/gpu/drm/xe/xe_pci_types.h
> @@ -24,7 +24,6 @@ struct xe_graphics_desc {
>  
>  	u8 has_asid:1;
>  	u8 has_flat_ccs:1;
> -	u8 has_link_copy_engine:1;
>  	u8 has_range_tlb_invalidation:1;
>  	u8 supports_usm:1;
>  };
> -- 
> 2.41.0
> 
