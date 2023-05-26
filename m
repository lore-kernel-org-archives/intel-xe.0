Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B347C77B7A
	for <intel-xe@archiver.kernel.org>; Fri, 26 May 2023 04:43:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1560C10E1A8;
	Fri, 26 May 2023 04:43:00 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A81C10E1A8
 for <intel-xe@lists.freedesktop.org>; Fri, 26 May 2023 04:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685076178; x=1716612178;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=RXMItbZ00YdXF5vTjXoZGmhk9pBbNw8D/Ui0SMUOnAk=;
 b=EbLgpUwrwnR0y6wgVB5jDstf3l+phSWLLIZw9Hmwaj8h9yBvhhEGS31v
 z5b/v8qvGed0hZWRyrn6c/XHJFcepkgEyqKbC7ZtKtOp1RiBd+1H54x9Z
 mNXxm1TXMwkdO7o+bbzNlJv9rrOMusCuUP6Tpr96jtOidec2Gx6wuzkWy
 7+GQ4Nup6+gGSUqsVmpCnBgrCMSa2XH8XvmyhOTw7z8H5vtUDofUiFcfA
 YcrZm+gNtx1XX58N7r6TaKoTzVVmZqCNqb1fMVIFZajM9bqI6r7hk7fp3
 ol6b7wvny0nQ1RBTHs0xeTShDuqhjQyh5pS7jTS9kD2Jbv8LLCrGwAUVH g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="333744145"
X-IronPort-AV: E=Sophos;i="6.00,193,1681196400"; d="scan'208";a="333744145"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 21:42:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="699290227"
X-IronPort-AV: E=Sophos;i="6.00,193,1681196400"; d="scan'208";a="699290227"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga007.jf.intel.com with ESMTP; 25 May 2023 21:42:57 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 25 May 2023 21:42:56 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 25 May 2023 21:42:56 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 25 May 2023 21:42:56 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.108)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 25 May 2023 21:42:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZhbAOa0Li2vW7x/3DurIxT6yztXBUfjwkad7VFsj8VsRvgps2WhWpkfMCj8R4k+sx6AMHjefNMyDexSZfsMtxSwWXXH3ifmSXo7lg+T2nWGKt8cPWQMykihgwDnHVMhZf9tZXPDRCYnna1Ea8A7tyseAKDgSdlZAaGI52dymqdQ6I5pFyra9NJ+rxJ14Vxb4PHdNSd+n9izOzT8Iv/PXaTWFQS0lKLQBfhtgx6b/sI0+q1wEm5S/94OoKiWfmVuNglteESwj89jWOVxfPiecwdybqjB5a4OOo1D7iwx99ezjV9e1BKG7EaX+Zr2/BCS6eAGH70gkWGvzw4KvBJKEOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KzugXd/CYi5Sv09O8UVXOmTxHLgWNGBN7m4GFkYtlSU=;
 b=YgLbqPkKKQi0FuOhbXWqXOs5XIaQqT3JwqX09aFQJIW7apb0ugAIz1+3IuEVTKEdOaRAMo14wGyOcfswrfFrFbtGsuwxziwoIH9wuQdOrM9ULOx29vH8yq+viUA6YKNDFdXWob2zwViT0kiUDR2PuQ4kjbtiiTyGwPoBn5EUg5NtH7jFaeKZ3fXF9H85AqFRbIYQIuhV7poF82V0WCkuPqMVc+ms3ACxPbfrOdAagEkpV3es6ButsJrpoMwsbXt+c3HxWJXdR/JE2H8H3E3GijW+fVKZrplvmN5beejRz7ePhywt7ADTSCCx7JZBK8Rdo3/lk0kCuYugE/iyYL+Zuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB7760.namprd11.prod.outlook.com (2603:10b6:8:100::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.16; Fri, 26 May
 2023 04:42:53 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6433.017; Fri, 26 May 2023
 04:42:53 +0000
Date: Thu, 25 May 2023 21:42:50 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <wrxlvx5gciwc3ldifdg4x6neterna4wrkytkp2jmkki6mwjag6@3mwvrndee3bs>
References: <20230525213407.3907094-1-lucas.demarchi@intel.com>
 <20230525213407.3907094-15-lucas.demarchi@intel.com>
 <20230525231729.GB10045@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230525231729.GB10045@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: BYAPR07CA0083.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::24) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB7760:EE_
X-MS-Office365-Filtering-Correlation-Id: db751dc0-ce7a-4c86-3b11-08db5da3aace
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PQ4lENalaE9t+zZtl2oktf4bFvYA49i4+VtMsXpZJ0585EQJX0HdyBZ1jTccih1N6IlYaonvuu7vCTZUwMTumbEVW1PFs09dWfxhYmhI8lCLYWZ1+UICXwHf51dIMz0QUeL3R9ZRAW59oS2rHnq7gbf9StA6H16qv+TaI58sZ314lnWxaGO8qul0gEJ66Ryx5rBqtN43Zl2VIk3i032+W2rrDg+c3n8lCaO5qVcATAsI3Oni+ZJjU5f+soYdk9PSx6hYO+/WWX7f4AXUwEskkssfNQAU5q7Ss/IcYDJ4I53dDPZZxN71ik1Rm6SL1wznQucegqS1t/Ehe9vN32Okg7SBshPVD/lPFa/YMbuMf0dhbt92GqP8RsG18z9Ga4nIPnmzLr+8fcBSxs41VlyQvI55aAMg5HHdYvEdeBTEp7aFOmOGNVbSPoh4dFGzH9kBgDH9GSpLryNcxqLx1EPpuDJEUyv5Lv754zo4aX8vzXtrnv2TPA6iSzeJLk6r3QPW7qQjAiDLD3HPEF4Dg/FKj79fYDziwd9+GVyBlahjjsZtfKhld+zxUO4En6zt1RUD
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(396003)(376002)(366004)(39860400002)(136003)(346002)(451199021)(66946007)(4326008)(66476007)(66556008)(82960400001)(6636002)(316002)(478600001)(41300700001)(6486002)(86362001)(186003)(6512007)(8936002)(6506007)(83380400001)(8676002)(6862004)(26005)(2906002)(33716001)(5660300002)(38100700002)(9686003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EjlszuF9OjhdRoQcPZdAsDteG0VAjT5mRUG4e1FlKQ7tTvbjZ6laW316ZN6U?=
 =?us-ascii?Q?Ac+EVxe9jSO7xAKtoislCPbe66t/9DWoJzEAwfyoExxrcLR4zyvOjSwmqqzF?=
 =?us-ascii?Q?r5/WVxXgDv6XVqphKmeeUKFr/bN1J9a4rPOK8JI5jSIyVyiKDEjOAUpDLyKu?=
 =?us-ascii?Q?UVzCJM7C76P2ZMgk9w4yFfLdop6pPP+ClSzBn6M+NKVChY+yQ1XneZJmrGpR?=
 =?us-ascii?Q?kRXFDZb22zi65WUCHg7zKiy01dWrVPknmVixQFihYfbEV2qP7+ZXc/9EybF8?=
 =?us-ascii?Q?F/DtAJOVQz+W+9i7xefL43Zgv0Lw8ySdB7yPU4Mt/NMRCL5jAz28uVoCVGfv?=
 =?us-ascii?Q?2Iok5F4GecK0FaQI47oWlcrmmVtqV6UXu1cPPOfDV5/XniuuYmelBFdYSkgG?=
 =?us-ascii?Q?ydtiYxAHLQgUGHGSd86v8QLde0bJCnZug6tH+bnRsbeKgedBiq/WPriVqu3O?=
 =?us-ascii?Q?FdG2vjptsZsmGg4vulw31zPX37kZaUqcwJHZgGLC3+UNs1a9rdm4X/75jYVA?=
 =?us-ascii?Q?Usouy3Ny5Jsbt7MNvM4o5pl/KO4CCS3K9/Moc5uhRl/hKU+qVuSJswL9uMjW?=
 =?us-ascii?Q?O/qqAJrRRbV8tHryghUk3GKnFmiGssTgc5523plNMYbp+QUFpmFiTgFBUYSo?=
 =?us-ascii?Q?Kvrgb8R2A5yzJWcvtMM/BwE/lcNx9iBS9Ad6LmLMhk2HnSp81dFg5EvynMxj?=
 =?us-ascii?Q?aWyavRdE0V37kKJXDx/GWleH0/fg6nfGckzX3hvEpRukd0OdTBSvK/yI6hO2?=
 =?us-ascii?Q?foOgQC7Xn/8c2uokNDjRRjif+p8iyvHxLHXeVyfZfMi7m7TwQaybArDhnDH9?=
 =?us-ascii?Q?jMFsZOsc6+0JDSRKDs9PH37TiBb8R00H05qWSTMugyaR2V/7rN2sU6Aa1iPd?=
 =?us-ascii?Q?sXmyVaLNsuFzZ9X0SOib4xvEjTvgPuKNMBdj+WaZ/rvuiLiRaQF0OH0osKA3?=
 =?us-ascii?Q?VZmkWPfRgDWHweuP5P81VUNgdKLWZwtD3lNkVyYG/R59zrxmvoAdVJDfqWPb?=
 =?us-ascii?Q?r6uPngmAbqLkhcemqBPutmGtbbMLf79AphdcaJuRW2pn3uiJkOJs5hbayD9A?=
 =?us-ascii?Q?LpKhj8nXzrhHzTh9Yiyt6VmkDFhZL2SwApLkJmJ2oGkzstr7L3mCh1wZv9Fi?=
 =?us-ascii?Q?bUNlV0EtjzRkb9vAbxNSYnR7qXcLBh1ISIG5wj+U8GcdsjtbWmNu7fe6d/Cd?=
 =?us-ascii?Q?4oojUOugawxZSZq05UWVjymk83+dlvYEpy9s7EnXERo00fMdU5BMZpSzCEP5?=
 =?us-ascii?Q?v/BIaU6Sas65muGOED2mApbVxg7gP5Ab0BNyL2VJOYcS6zPr/y1CnokJx0N0?=
 =?us-ascii?Q?FYj6IfzRFQOvjeVo5M8PWyLVYI10InyqasvxlVVYP1er14gqqKS4jQv9I2aa?=
 =?us-ascii?Q?j4ytdBj1JGX4xk5I4CuyD4hekgldbhRvZREFmG0ezRJ9YuZ8Wc+MbNXJk3zh?=
 =?us-ascii?Q?eHYXbVroe5rhm88VFqHcJ1sm7yQXJTmYr/XKuqUgl4oJK1sbr0fpfKyeEWY9?=
 =?us-ascii?Q?dEKCk2JVX/DFIqsjFyFlRl7JcrmeWhMon+2187iTaf/pXVRUj4YrsOaye+sf?=
 =?us-ascii?Q?pniTOWQrN3V2RCToYaBGaF0xJDZoSDgVkLK9x88/kJZMpUaI8No1KDG51uwt?=
 =?us-ascii?Q?kQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: db751dc0-ce7a-4c86-3b11-08db5da3aace
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2023 04:42:53.3071 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F0DWmfv3KkVSYIkudFViA5tNmJcV0XhhMLmABSjHDuxwddqBpcdyaY1KYJAbqdw7c7m2mz9l7jxiOSU0FSR1t6XGGDCOQuXhxzjc6NesQqM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7760
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v4 14/21] drm/xe/guc: Port Wa_16011759253 to
 xe_wa
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, May 25, 2023 at 04:17:29PM -0700, Matt Roper wrote:
>On Thu, May 25, 2023 at 02:34:00PM -0700, Lucas De Marchi wrote:
>> Port Wa_16011759253 to oob. Wa_22011383443, that has the same action,
>> doesn't need to be ported as it targets early PVC steppings.
>
>Technically Wa_22011383443 is also targeting early steppings of DG2.
>But we can come back and prune the DG2 pre-production workarounds later;
>this is a correct conversion of the code that already exists today.

when we were porting the workarounds, due to the hw availalble and type
of WAs we'd need, we decided to support early steppings for DG2, but
skip for PVC and MTL.

Agreed we can come back later and remove the early steppings of DG2.

>
>Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

thanks
Lucas De Marchi

>
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_guc.c        | 4 +---
>>  drivers/gpu/drm/xe/xe_wa_oob.rules | 1 +
>>  2 files changed, 2 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>> index 08362db6a886..1b3fbbd74923 100644
>> --- a/drivers/gpu/drm/xe/xe_guc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>> @@ -139,9 +139,7 @@ static u32 guc_ctl_wa_flags(struct xe_guc *guc)
>>  	if (XE_WA(gt, 22012773006))
>>  		flags |= GUC_WA_POLLCS;
>>
>> -	/* Wa_16011759253 */
>> -	/* Wa_22011383443 */
>> -	if (IS_SUBPLATFORM_STEP(xe, XE_DG2, XE_SUBPLATFORM_DG2_G10, STEP_A0, STEP_B0))
>> +	if (XE_WA(gt, 16011759253))
>>  		flags |= GUC_WA_GAM_CREDITS;
>>
>>  	/* Wa_14014475959 */
>> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
>> index b54f70eeccf4..9b29a0dd0934 100644
>> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
>> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
>> @@ -1 +1,2 @@
>>  22012773006	GRAPHICS_VERSION_RANGE(1200, 1250)
>> +16011759253	SUBPLATFORM(DG2, G10), GRAPHICS_STEP(A0, B0)
>> --
>> 2.40.1
>>
>
>-- 
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation
