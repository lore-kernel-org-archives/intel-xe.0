Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50210C6FA8F
	for <intel-xe@archiver.kernel.org>; Thu, 24 Aug 2023 17:59:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2480810E5A7;
	Thu, 24 Aug 2023 17:59:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC33310E5A5
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Aug 2023 17:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692899956; x=1724435956;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=zbbos60Q5ASCTe2c3VnDcCCZa0fgkk9/zxJ620gjemU=;
 b=VHUJagjA5yA0vlsGb9sdPIbyDwSoXtoxLu5ioEXYeidM3g86tJm65h+9
 0tpvoUzHOz7/9yAq6cVJOBwlxIyQGcziOchi5F7NDqLyU2upALl2Qov0O
 5WoJ7TAXQUoVL5h40dL2G+ukUtLlxqaPYIGJw7/TB8AFS8LBxukLMO3vl
 pKKiN7uQciPSdaa787yaT+yu9SBAxIdkCYzrAPRnQgjQN0+Bx8QPFAs/b
 JkPsuMwmWnZGVrqkNsWPOJJ0ycAJYDV4HMKv88tBW0p/9BSwaOgVfhNTP
 a7CaNDRfNHCBEiKB50OnuReuulou9PEn8TIkgWHIzidSlLLKzxKKjEbLv g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="359516250"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="359516250"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2023 10:59:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="802639872"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="802639872"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga008.fm.intel.com with ESMTP; 24 Aug 2023 10:59:16 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 24 Aug 2023 10:59:15 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 24 Aug 2023 10:59:15 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 24 Aug 2023 10:59:15 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 24 Aug 2023 10:59:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NpT72Lr4vgcFR+7wUWzh7dvZxODp+12aBKneKAX3D9F9kznEh4QJAR4WJr8PuksdnpRoEaXtHVML3DoxCWZ07gSDUEVKm8ldgl23PmidGAwiea8ELA/DtrLdkUMbYroP5aa0TyvJLVE0eROiEefcUino5uYDyQJREhMvK9E1eFNGIYzZOutVa8CFtIxWrHX5S8CKKZAlI+O8r6UdN1U8E9ee2wge9+pawkkytbensElPYcoRyd43UREYNPabM4DrWnQ4gWv1+60zYcpyniEbpbEf0ze41Ey0Ggwlkw/p4Ta82UPbgYcsSsrFoxaYacrWGCT8ttdD5l40p0hl4qgNQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BVg7YfDlSIuBxbuDeXh8EOlZXOJ0G3QJ4S1ZP6azMOw=;
 b=CKLYeim5ro8n3SuLMOjFbinLs6UYBq+kYc9YGC13vf6qLJ1C6HQuKPNvnLETdUznVPIqipjGl6s/FH/+eIxU0zOY8amSfH8ckLVPRERyrPPkQPdfHDp6YGD/8FWw9PwSBr7rIxlI6w1hZuwjEOBKUC3evlzSaD21Y2n1ZwLysJAOyR07233PMHVdSMHOsqP1T/Vq3cze/VKhLaswdFomITC9WuJADEoiYxnl6RznesI5Jm7SZTlL/+L9Fg/+kJQThGDRqZP+WQZNE1zLSqVb/bzfdMWRMKtylu+1sqvkO1yJUdj6DCo/EdzD5jJe92EDyoG17YUVUV3N9wUgtU+Nug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by BL1PR11MB6050.namprd11.prod.outlook.com (2603:10b6:208:392::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27; Thu, 24 Aug
 2023 17:59:11 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::f7ed:4327:5d1a:b8fc]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::f7ed:4327:5d1a:b8fc%4]) with mapi id 15.20.6699.022; Thu, 24 Aug 2023
 17:59:11 +0000
Date: Thu, 24 Aug 2023 10:59:08 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <ZOeabMeevXT2c2uu@nvishwa1-DESK>
References: <20230823114040.31769-1-niranjana.vishwanathapura@intel.com>
 <20230823114040.31769-3-niranjana.vishwanathapura@intel.com>
 <20230824160651.GV1529860@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230824160651.GV1529860@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: BYAPR04CA0002.namprd04.prod.outlook.com
 (2603:10b6:a03:40::15) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|BL1PR11MB6050:EE_
X-MS-Office365-Filtering-Correlation-Id: 2917a84a-889e-4893-0825-08dba4cbd21a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WOIZI+hQ6zNejzGqjFEc7yN4d7TNADQCgeT5Oa7LTkWx4+j2jONhYh6ScHIQ9EUddR7Kk+ZobgRJMr/HGmyOTguiAcQMH8tSVtmEWoanu65ThUiWWK+Qwu/KAvpGy+bAdKDtQPzCSfzRgEvKLUSgDCzFMj7CgnSiNAXkxqydX5giMFi9oyDMISQBZVpGjfm18yQojKTlOs+xaIQ93xRHzCc9VYu9sw4jgMJEMGxu0Yq8b3l/qWX/45LXWdwe3u65kNHySTHy8aTsu8Gipf5V3VUTNIWkIqsLLZp460KsmYbIPT2Kn6JlxWUDLUpSJykqMNGcJwU5tE/UcJm13YHOY+S3uBEd0n4JvD5c9+CuiAAQiEL39iEkQJhjTR+s2WY2oaNN8/96Eu78ly6QDv1bK8kyVQu2tNqw5h9/ICEBPPhOrbm04VFuSkhoyTjyDjtgJvkFkIbaLllK0pfoB4O2JjKd5UU19aiQRUJNj/fVny2szRmZX50lyexyBEGsaHJO1rnmB8tHG/gaqidgAJl5MgkL1J4oAhAfOWb9aRwPMWTA7h+13l4ocYSt3dryw9nq
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(136003)(376002)(396003)(39860400002)(366004)(346002)(451199024)(1800799009)(186009)(33716001)(86362001)(38100700002)(82960400001)(6506007)(6666004)(478600001)(6486002)(5660300002)(316002)(2906002)(6636002)(4326008)(8676002)(6862004)(44832011)(8936002)(26005)(6512007)(9686003)(83380400001)(66946007)(66476007)(66556008)(41300700001)(107886003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5xiOwcjQttBg+nTybZiiwe8bBr2Vq+wuJ4uC10J4GOj/QvLd0ZOuEbtNUFDS?=
 =?us-ascii?Q?40nzrqx6yx1NPIBYIQ1YCzO9y5iLnDDP4MFV/TfHArRsYeP9XIj0xDf5Z4uE?=
 =?us-ascii?Q?d1ETrRI3grOjkpB6f3FDMKHEwRVDh22ThX3qTR1I3CCLqD8rLK0QvmUjBLkz?=
 =?us-ascii?Q?nP+sIyKp/LiTPQoPLVZfvUN1UTUGP5slDCnpvviYnKmonfGCAKmneMF/K+wq?=
 =?us-ascii?Q?jwbl+SFUXl323qTNpB2vY/qmYR1SXIf+JF/s8HCwJqYORL0ZhHIqOfblrGVs?=
 =?us-ascii?Q?0fDIBp85B0RNFpcmbiRfQxJfQ9K4/LEGtivRVy/AaXnJxbcyuBkIq0gUJBZQ?=
 =?us-ascii?Q?HO4egfyLRyMMpyeDpJvJrIS9XlWqIqyOy83RVFQfJH2BD9rS3rQlwJXzOI3a?=
 =?us-ascii?Q?LhFvlbdr/eCLrLxYblCJ7h2Znj9DoRGRWtB3IPNUp/HNo+sMMPF/gzTPJdJM?=
 =?us-ascii?Q?peSvkGqMS11ZsWwnhIjEflF3i+UMhGLoNNsltXkXxQvyTWJeuayUk/vpdEgw?=
 =?us-ascii?Q?2Pck7hrvim0DxhSwePs50BoS93Do9AUvENi9N7EdyYcVp/65rLLVZmYRSeAR?=
 =?us-ascii?Q?twGSeNgMqQUsIm97GkDn75yZRc8XF99fqn1M3tRze0ETrU2eBsTboyHVrLYm?=
 =?us-ascii?Q?Zx5Ki/kiDnGYjyYTQXhUVLvmN7Et563d+PtlZMA2hnhJ4nSzkZ+vsAzpFxlJ?=
 =?us-ascii?Q?z1QbDGyHFa2XuZyEzbDXonbAOJJKw+BzjejIOyp1Q/9wJ7ABnsWY30wRqszl?=
 =?us-ascii?Q?wvV9yU0P5scxjweu8TP9hA3xR7mdrwmY57QRFlZ/YbyJeD6iKSTw6sAs53Xq?=
 =?us-ascii?Q?jeNFk9g4i21z7hejRFb3HJiZZrPI5YROWNviPd7Oi57S7vxndvFfIOB3wycq?=
 =?us-ascii?Q?NwFYha5awPoa+S9e4Rnp40i2BJQFQsU3m1cWVhkzR4qkuMY7OdCrVWF36IkE?=
 =?us-ascii?Q?UBASDucDXVy5uQ1L7D3YO6D/s3O0DHD/8m4bAkDjBZIbgHM8gcaEeLQFG5KI?=
 =?us-ascii?Q?V7HJ/krZG9xqxH6nV4kk5J7kRRM/15CXdVTeahXq9pMZl+gf7rssLWkbw2aV?=
 =?us-ascii?Q?tlrwRE9Gcc0L9g2Ops3SLncjn+LtQamZpjtUFJyU7DsyGSI0FMlBotZ6Q2Zb?=
 =?us-ascii?Q?4fYldiUFJ8d1oSd+Q3+8GH2l7guEgCePBFTY+eI6LIIlT0+/Wjru1IzhMGDz?=
 =?us-ascii?Q?6sAjftxbKbRhWcH2YiVefTFIO88tzr1yb0GtqVmeij6DmaWUv0U8ECnUUhhB?=
 =?us-ascii?Q?C1yzqHYWjFNmhJeWpw+zAEu2YIiSxEoprjToMpOSc+mjtmFVpLCjWqOc2D1I?=
 =?us-ascii?Q?lKPRsZ8ZSSUM1tV1GsCaxcnSC6khJnu5DPyG+IIf7C64987tkWhdWtr739Xu?=
 =?us-ascii?Q?MAdSxZSjWVJpPJSYirSrQoQH2cd7SVBxx9AmAfSFuCi2w2+KruYCVLnjkwwg?=
 =?us-ascii?Q?8ZYFjv2+1sXrIMmcEA1FdXVWqjyznM0nQXKb4Hwl7QLkU08HD4cERiRC/943?=
 =?us-ascii?Q?4110f4ii+AD5dBrv07K42lDLuuR73g7wvIdxJ0aEu0H/1I1mT3myxEUwnHQI?=
 =?us-ascii?Q?MiiOq2yrzaDSwS1o4i8AUVt8Ut4vHRvKe60gL47IaJ3TgyC0g9Rs4gKbFwgh?=
 =?us-ascii?Q?8fFswYAl9bLcHtWJBSyD8nk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2917a84a-889e-4893-0825-08dba4cbd21a
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2023 17:59:11.4791 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kSmT8fAiyfKceY/3QxhNs/WC3AdBrrfZZTK7lKOEbroM6+WEpFVK3lW4m5K8/ijmDjixBid0zAxV5gTa43knP31rqtsg/aXnmR9VWC58STlJetE2jb86+RNzfLtMuxn6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6050
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 2/3] drm/xe/pvc: Force even num engines to
 use 64B
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
Cc: lucas.demarchi@intel.com, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Aug 24, 2023 at 09:06:51AM -0700, Matt Roper wrote:
>On Wed, Aug 23, 2023 at 04:40:39AM -0700, Niranjana Vishwanathapura wrote:
>> Wa_16017236439 requires that we update BCS_SWCTRL
>> (via indirect context batch buffer) to set 64B
>> transfers when running on an even-numbered BCS
>> engine and 256B on an odd-numbered BCS engine.
>>
>> v2: Move WA from engine_was[] to lrc_was[]
>>
>> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
>> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>> ---
>>  drivers/gpu/drm/xe/regs/xe_engine_regs.h |  1 +
>>  drivers/gpu/drm/xe/xe_wa.c               | 10 ++++++++++
>>  2 files changed, 11 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>> index 1a366d8070f3..806755f31241 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>> @@ -64,6 +64,7 @@
>>  #define RING_BBADDR_UDW(base)			XE_REG((base) + 0x168)
>>
>>  #define BCS_SWCTRL(base)			XE_REG((base) + 0x200, XE_REG_OPTION_MASKED)
>> +#define BCS_SWCTRL_DISABLE_256B			REG_BIT(2)
>
>Minor nitpick:  we usually add two extra spaces before the name of
>register fields to make them stand out from the register names.
>
>Aside from that,
>
>        Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
>

Thanks, fixed and pushed.

Niranjana

>>
>>  /* Handling MOCS value in BLIT_CCTL like it was done CMD_CCTL */
>>  #define BLIT_CCTL(base)				XE_REG((base) + 0x204)
>> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
>> index e2b6e17d7ec4..f45e9452ba0e 100644
>> --- a/drivers/gpu/drm/xe/xe_wa.c
>> +++ b/drivers/gpu/drm/xe/xe_wa.c
>> @@ -604,6 +604,16 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
>>  	  XE_RTP_ACTIONS(SET(CACHE_MODE_1, MSAA_OPTIMIZATION_REDUC_DISABLE))
>>  	},
>>
>> +	/* PVC */
>> +
>> +	{ XE_RTP_NAME("16017236439"),
>> +	  XE_RTP_RULES(PLATFORM(PVC), ENGINE_CLASS(COPY),
>> +		       FUNC(xe_rtp_match_even_instance)),
>> +	  XE_RTP_ACTIONS(SET(BCS_SWCTRL(0),
>> +			     BCS_SWCTRL_DISABLE_256B,
>> +			     XE_RTP_ACTION_FLAG(ENGINE_BASE))),
>> +	},
>> +
>>  	/* Xe_LPG */
>>  	{ XE_RTP_NAME("18019271663"),
>>  	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1270, 1271)),
>> --
>> 2.21.0.rc0.32.g243a4c7e27
>>
>
>-- 
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation
