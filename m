Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B364EE49A3
	for <intel-xe@archiver.kernel.org>; Tue, 22 Aug 2023 07:19:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA59710E2E2;
	Tue, 22 Aug 2023 07:19:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD5C510E2E2
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Aug 2023 07:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692688763; x=1724224763;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Wb7P2dxZ3KEKN2/wlQqk/ppTqza/p5hq5kYh1mPmfZE=;
 b=mcowGQH5ARt7XboxUGG0sQj2cNfZStUPfhpsVqgqMQ5EM/Hdyeq6NwwA
 KppA+QcKajsph2DObNq+3vEaNMzTBku17JzT/Ys+UY836kQzJ8irWy4gA
 Z+MhQ9FkxpFDO5GI3OXEIgLRUzg3uUMRSdjJVS7gqkNM7SVi5Ez40wAiX
 71/QWN9l0U2MHZbjGCes9E3xR/7TJP9RkAUOd2qCGrchI7a8nxSRj7gbC
 DLHBb00/C6xziPCCiqKtx+QxQcAonLqZBxIvAocEagFuWpB5F89mvA5NP
 iAx1zK8A2qosMnKvnSz9BRMBjHOoI7MAFgOQDJCAnSRny2jMr0ZVMvR6G Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="404803165"
X-IronPort-AV: E=Sophos;i="6.01,192,1684825200"; d="scan'208";a="404803165"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2023 00:19:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="739200170"
X-IronPort-AV: E=Sophos;i="6.01,192,1684825200"; d="scan'208";a="739200170"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga007.fm.intel.com with ESMTP; 22 Aug 2023 00:19:22 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 22 Aug 2023 00:19:22 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 22 Aug 2023 00:19:22 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.107)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 22 Aug 2023 00:19:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GjU0+LTX4KYbznwd4w/jyd0AKN5/ydOuqhNhQZCrWe8he7HH+oI7P/D14QabiRbo3a9s9AhhfpjiTcDMZJz7bHgIs+Bis/S5wGHQtucwgc469yDW3+b0Lb/vJy7cET8LR8x371tvdm3uiV7aboha7kacao9PikbWsRGsaHndXeIeY6vwg3tB4H8cZO1UI7iIPAF6vD9SLnKNk5qej9BPfQRRHynS+l5sAMTTE8+wN1s5fY5sHRUMQYlX+jfG61WIvo1IOyE+TlmmUmfjD2G4Mfv2kFxR/1cBhQcucHwGvbwQWDEGgd41UoSsmNx4LFQ7ebF9O14tKDVhzcontD5THQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6O6vz+tZ4jteHYgba5J5XmW3SIYO74pOCTSjJ93hKlU=;
 b=fd+hO/6r4ecipvOc0tXs6w5IcpOhI/BK5PkU7xY+O/gAYjSNpFoRSky+PkFvUDb3l+d3PFOo8Q7hQI4qhC0UYcr4SjEdwhe9XXhAT2LrE2roL4KBpgm7e7fueKt8QT86NcC5e/+mbShotx66vD3nmbTSb2kQY/LKeWUExTKT5azro9jpQsnG1oT+6ARSsr4ntYkmg4Gt7GUtWxVs3PvAYw1zIZAHWWSj+HegC9Yp9jYNr7X3zYOCoOUhP/kvZ0zZrVhG091xiNW6ll0rS14lL7QlHbTi2ouCzbgYeEdt8d8Fx5QE5GoqI7X6dk/FQngWTDLTVU4QjJsMtWd1xT+TOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 PH0PR11MB4904.namprd11.prod.outlook.com (2603:10b6:510:40::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.24; Tue, 22 Aug 2023 07:19:19 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::3382:a13a:ef37:f584]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::3382:a13a:ef37:f584%5]) with mapi id 15.20.6699.022; Tue, 22 Aug 2023
 07:19:19 +0000
Message-ID: <fce7f544-f445-9285-029d-7cfb4f7d0beb@intel.com>
Date: Tue, 22 Aug 2023 12:49:10 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
To: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20230822045825.3900964-1-sujaritha.sundaresan@intel.com>
 <20230822045825.3900964-2-sujaritha.sundaresan@intel.com>
 <0f97a804-7799-37ca-8b44-9ca27130e566@intel.com>
Content-Language: en-US
From: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
In-Reply-To: <0f97a804-7799-37ca-8b44-9ca27130e566@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0039.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:98::15) To DM8PR11MB5653.namprd11.prod.outlook.com
 (2603:10b6:8:25::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5653:EE_|PH0PR11MB4904:EE_
X-MS-Office365-Filtering-Correlation-Id: 496e464b-9655-49b0-87e0-08dba2e019de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yK07HHrmA/tytWcmWc8hpwdaalYw0XAXg+OUF8KGqW6wGMDbEynm/qY4WjL8hcAsPL/Oa6jpXfgThFtq7v1O+HH81VBVO6+497NrsiH6R/6Q8Al4sJoAn7/DJMmqJjh/r5ZKNarhKgUTpebrxm04PrM3/rtWs3ghxsEaChPurdARzYkJ9nzx7rZ3HgvOSgPcoqGaIZpBma8yn0oS68Zbc0/Fp3s2/nUmdPnU9pihstwo3XaxhKJGsk31HDdE/jauGGYtXlLtXVvFRfBeqG7LDZ03ltSbn4+0ZjteZlwBpdTWaHO5/BNHI7hTCx/qVJEcibd0I63Q8LGCtiXCqKvJvstGGzg4rbFbwW0/XoMJghYhsfogsW522jNWjZoQ0pJZ0vGPwOdxVqwo65Eo3Sj4mQnwpbYMhY96IvG7wW0lvs9qltmphWwdKGFUzr/WKahlbdZcc630wOv8mmJ35qmemx4CgLFaKOvYtd9NhgDN4BDJomd7rwGic//Gz17W04w1RNMcMP7ibn4mex03XuiG68hesFmNCzV2T2BhQH5qyLsxHgZzRzN2fVNmDT0IGjZNMhZSd1s9Zcekzg7xgV88mn3/tmXrfSwr2i/3GZZhiM9X+oZjkACPEGSZla9hb5xF4V5+y6gvYzpSlyZL7D1mM0QXtev18UA2eDsL9bD4O9Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5653.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(39860400002)(346002)(376002)(366004)(1800799009)(186009)(451199024)(66476007)(66556008)(316002)(66946007)(6512007)(82960400001)(8676002)(8936002)(2616005)(36756003)(41300700001)(478600001)(6666004)(38100700002)(53546011)(6506007)(6486002)(83380400001)(30864003)(2906002)(86362001)(31686004)(31696002)(5660300002)(26005)(45980500001)(43740500002)(309714004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YW11YW1QNk1XNStVaGdGK2I0MzJ3S25XaCtSYmJKWU9xVFFHZEZJeDEybGVS?=
 =?utf-8?B?V0JJS1VsRjhpSlZkM2ZJZGRESnlYdGp3cGtuR3J5bSsxblR5dHhoQmp6OE1Z?=
 =?utf-8?B?NHQ2TllBUjkzMUxjdFFXT0l5Q3VNeUxHOXJDOVN5WXRuU0RqMWUrbitaZjFh?=
 =?utf-8?B?SGFSQmR5WElnSEF3dko2YmdmQU9sNnZNWHkrUmFqalhiS1JGWjhHNDhxQUll?=
 =?utf-8?B?OGJSY2c1dHA0R2o4Mlh2bzNTejBERENKUzBISHJxdlMvNUZnQjZWMmF3ME1l?=
 =?utf-8?B?MVlVMWZ2SXcrai9MWGJ2UkVyWUwzVDgvZmxZdkhCelhCNXplbWtCWjI3LzA1?=
 =?utf-8?B?RzJ1ck1yOXZCSWN0UHdzMFhpR0FSMWdhclJqaW85Mis1cWZYRVZUR2dtamVE?=
 =?utf-8?B?V1h0ZEtyYXNZcEJQY3FUcHBqUjhzWmYxS2Q2NlRMSXVtTWxpc0VxQTlUV1hT?=
 =?utf-8?B?N2dOeXJuOXFhV3F1QmhHN2ZWRjdQNWFUSlBCR3FBRjVjVkNZUzJvVDJMZE5v?=
 =?utf-8?B?RnZWUDRkb0ptR2N2R0p5bWNOcG9lT0VHL2NtQWtTampJYUI2RW9oS0dxa2dM?=
 =?utf-8?B?UEQxVkNJeFR3amxXODduSStobUEzVzc0WEIzYzZSaTF0citxbERFQUZPMG5m?=
 =?utf-8?B?MktZZDIvOU80OWs5ZGMyQnR1SStIdTFiTE1JTzEyZVZ0U21XUjdGR0k2UDBq?=
 =?utf-8?B?bkd5bjFWQTJvRGpHRUxxWnRrQUJXM3VJS2Q3RFEvc3dEWE1EQkdES1I5N2k1?=
 =?utf-8?B?QVN0WWxYUUwrYXBuUytYL0xsZFI4KzNEZGV2eGsxdHNLOFgxWHR0WnkvNXVS?=
 =?utf-8?B?bnhZUmVWZ2pIQkZBcHU0QnpEUnVmRHd0aGQ1Vk1LcHZEL2hyNFhkcnZrVGM4?=
 =?utf-8?B?Y2dyQXh5Y0xITS9OaWhpRzVna2NhUCtEY2dEQlc2aFp1aDY2ZzBYS1Ivejkr?=
 =?utf-8?B?Y3JMUjY4QTg1cUtHOURhNW5nczJOdXdLMUY1dDU5VHJkdURCQndUdm1LK0Zp?=
 =?utf-8?B?M1lCZmpxSitJOCtTQVQ1K2JrUDFOYmNkNXVUVEtDbUMyelQzVjg0Q3Z1b1lt?=
 =?utf-8?B?V1dQdGhrWFhQL1hXZVUyZFNjVDY1YzB0OVdYR0tBODByNGtpLytVeXJuT0dF?=
 =?utf-8?B?a1VYZ3FkNm5yNTRpdWZOWHlJbTlFakpVN1JSQ09YMUdIM29FRWt5YllaT1pp?=
 =?utf-8?B?aHB6ektJU3FIMDhEbFBOMFFqcGtHSjlKait1eUorSy9JQlpLUjRBcXA4bzY3?=
 =?utf-8?B?TitoV2NlbzlWRXUyV1ZRSCtrR3NhampkbGhsOS9DdGJmZm1FZHFmT1QwcUZj?=
 =?utf-8?B?eHllZHRadUp4TDdxSUNIOXk2UGJMYWkrbmROdmRkZmNKVytBQXlmL1VGMUly?=
 =?utf-8?B?c3prVTh3WWs5YU1WclQzbEQ2WkJ1T3FxRXNyYnJRTlF3YmNWTjhSZXM3aTNt?=
 =?utf-8?B?c0ZMU1lEOTFXRXNLbTU5dUppQWFPUHU0M2VYb0RPL2llU3RsdlFsVWJ2VTBN?=
 =?utf-8?B?SUE1a2RUa1QwSGNXMHFOQk80V3gzNGFhUnFMTWZ3c0N5V1FZc25OelV5OXhE?=
 =?utf-8?B?enppVG5IZGhyN0xERklxVVNnQXNxT1V2L1ZGMVI4bVB2S0tMSG45bUJwS2d4?=
 =?utf-8?B?WkV5MnVGb3I1aHBlajltb1F1NDlqS2p6ajdMc0pJNjdGS05WbUxrVUsvb2RV?=
 =?utf-8?B?cklsYzYrZ0VHOG1lOTRGK1ZkbmE0SmlJbDZPVWJYeS9kRnVubVdEc0VwTVNG?=
 =?utf-8?B?UGQ2T3owYTlLTy95NE1UUnYwR3d4QTJaZHNnTjNrSzRFdWFZYWJxNG1xVHVW?=
 =?utf-8?B?SGkrVzRKMVZJZ3lVeVFFN0t4SXBLQTVWM1FuVGtweFpzSG1FVUJTTkxNSHBU?=
 =?utf-8?B?T2lSb0xDYnVOS056OVJTZ1cvV3cxbHpuV2x2all1YUMreTgrOGMxN1hiRVpT?=
 =?utf-8?B?SWxWNWtGZE81N3VEVFdMakNhbDhwOUxFTTRYSXFvdlUzVjRRcE9NamVzWWxi?=
 =?utf-8?B?ODdXeUVJcTBqWEx1LzNVMzVYd1lCTHJxc1BKRlU2VThMeW9SS2hzYk10OERw?=
 =?utf-8?B?N3J4NW1XWUw0cS9nYTlrOTZmSGMyd0FBamxzSVBZVTMwckVYVXRNZmZhVGh4?=
 =?utf-8?B?NjV3SDZXb09rT09ZZnVWT3JCVVFSbDdoK0FaR0xFNU02ZmhiR0lKcG1SRGpm?=
 =?utf-8?Q?MeRBBrONTtU9w7kHPGrZQA0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 496e464b-9655-49b0-87e0-08dba2e019de
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5653.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 07:19:19.4921 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z3A2AZl9/pNxGuxxa3KnuQy7Ul9ipPUSJN5ylVmu8hvumJ+Q7YSHJF5mt6LA9qGJ9LRL7q/YtmlwJIR3jIrLYqntnSTeUtLGBXWrmcNHcvw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4904
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC][PATCH 1/1] drm/xe: Add throttle reason sysfs
 attributes
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


On 8/22/2023 11:45 AM, Riana Tauro wrote:
> Hi Suja
>
> On 8/22/2023 10:28 AM, Sujaritha Sundaresan wrote:
>> Add throttle reasons sysfs interface under device/../gt#/
>> Currently there is one overall status and eight reasons
>> attributes.
>>
>> The new sysfs structure will have the below layout
>>
>> device/<dev/gt
>>               ├── gt0
>>               │   └── throttle
>>               │       ├── <throttle_reasons>
>>               │
>>               │
>>               ├── gtN
>>               │   └── throttle
>>               │       ├── <throttle_reasons>
> add tile<n>/gt<n>
Will add.
>>
>> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
>> ---
>>   drivers/gpu/drm/xe/Makefile                   |   1 +
>>   drivers/gpu/drm/xe/regs/xe_gt_regs.h          |  13 +
>>   .../drm/xe/regs/xe_gt_throttle_sysfs_types.h  |  36 +++
>>   drivers/gpu/drm/xe/xe_gt.c                    |   3 +
>>   drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c     | 282 ++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h     |  17 ++
>>   .../gpu/drm/xe/xe_gt_throttle_sysfs_types.h   |  35 +++
>>   drivers/gpu/drm/xe/xe_gt_types.h              |   4 +
>>   8 files changed, 391 insertions(+)
>>   create mode 100644 
>> drivers/gpu/drm/xe/regs/xe_gt_throttle_sysfs_types.h
>>   create mode 100644 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
>>   create mode 100644 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h
>>   create mode 100644 drivers/gpu/drm/xe/xe_gt_throttle_sysfs_types.h
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index 550cdfed729e..eb3ccd90b2fa 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -63,6 +63,7 @@ xe-y += xe_bb.o \
>>       xe_gt_mcr.o \
>>       xe_gt_pagefault.o \
>>       xe_gt_sysfs.o \
>> +    xe_gt_throttle_sysfs.o \
>>       xe_gt_tlb_invalidation.o \
>>       xe_gt_topology.o \
>>       xe_guc.o \
>> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h 
>> b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> index baa00557f114..8416d483e7c3 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> @@ -400,4 +400,17 @@
>>   #define XEHPC_BCS5_BCS6_INTR_MASK        XE_REG(0x190118)
>>   #define XEHPC_BCS7_BCS8_INTR_MASK        XE_REG(0x19011c)
>>   +#define GT0_PERF_LIMIT_REASONS            XE_REG(0x1381a8)
>> +#define   GT0_PERF_LIMIT_REASONS_MASK        0xde3
>> +#define   PROCHOT_MASK                REG_BIT(0)
>> +#define   THERMAL_LIMIT_MASK            REG_BIT(1)
>> +#define   RATL_MASK                REG_BIT(5)
>> +#define   VR_THERMALERT_MASK            REG_BIT(6)
>> +#define   VR_TDC_MASK                REG_BIT(7)
>> +#define   POWER_LIMIT_4_MASK            REG_BIT(8)
>> +#define   POWER_LIMIT_1_MASK            REG_BIT(10)
>> +#define   POWER_LIMIT_2_MASK            REG_BIT(11)
>> +#define   GT0_PERF_LIMIT_REASONS_LOG_MASK    REG_GENMASK(31, 16)
>> +#define MTL_MEDIA_PERF_LIMIT_REASONS        XE_REG(0x138030)
>> +
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_throttle_sysfs_types.h 
>> b/drivers/gpu/drm/xe/regs/xe_gt_throttle_sysfs_types.h
> This file shouldn't be under regs. Please move it out
Ah not sure what happened here. This was an error. Will remove.
>> new file mode 100644
>> index 000000000000..b71865f467ce
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/regs/xe_gt_throttle_sysfs_types.h
>> @@ -0,0 +1,36 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_GT_THROTTLE_SYSFS_TYPES_H_
>> +#define _XE_GT_THROTTLE_SYSFS_TYPES_H_
>> +
>> +#include <linux/types.h>
>> +
>> +/**
>> + * struct xe_gt_throttle - A struct that contains frequency throttle 
>> reasons in gt
>> + */
>> +struct xe_gt_throttle {
>> +    /** @status: status */
>> +    bool status;
>> +    /** @reason_pl1: */
>> +    bool reason_pl1;
>> +    /** @reason_pl2: */
>> +    bool reason_pl2;
>> +    /** @reason_pl4: */
>> +    bool reason_pl4;
>> +    /** @reason_thermal: */
>> +    bool reason_thermal;
>> +    /** @reason_prochot */
>> +    bool reason_prochot;
>> +    /** @reason_ratl */
>> +    bool reason_ratl;
>> +    /** @reason_vr_thermalert */
>> +    bool reason_vr_thermalert;
>> +    /** @reason_vr_tdc */
>> +    bool reason_vr_tdc;
>> +};
> The structure variables are not used in the below code.
> Is the structure needed?
Hmm that's true. Shall be removed
>> +
>> +#endif /* _XE_GT_THROTTLE_SYSFS_TYPES_H_ */
>> +
>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>> index 13320af4ddd3..03be2c2980d4 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.c
>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>> @@ -24,6 +24,7 @@
>>   #include "xe_gt_pagefault.h"
>>   #include "xe_gt_printk.h"
>>   #include "xe_gt_sysfs.h"
>> +#include "xe_gt_throttle_sysfs.h"
>>   #include "xe_gt_tlb_invalidation.h"
>>   #include "xe_gt_topology.h"
>>   #include "xe_guc_exec_queue_types.h"
>> @@ -442,6 +443,8 @@ int xe_gt_init(struct xe_gt *gt)
>>         xe_gt_sysfs_init(gt);
>>   +    xe_gt_throttle_sysfs_init(&gt->throttle);
>> +
>>       err = gt_fw_domain_init(gt);
>>       if (err)
>>           return err;
>> diff --git a/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c 
>> b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
>> new file mode 100644
>> index 000000000000..7db67b5fc138
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
>> @@ -0,0 +1,282 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>> +#include <drm/drm_managed.h>
>> +
>> +#include <regs/xe_gt_regs.h>
>> +#include "xe_device.h"
>> +#include "xe_gt.h"
>> +#include "xe_gt_sysfs.h"
>> +#include "xe_gt_throttle_sysfs.h"
>> +#include "xe_guc_pc.h"
> guc_pc is not used here . Remove header
Will remove
>> +#include "xe_mmio.h"
>> +
>> +/**
>> + * DOC: Xe GT Throttle
>> + *
>> + * Provides sysfs entries for frequency throttle reasons in GT
>> + *
>> + * device/gt#/throttle/status - Overall status
>> + * device/gt#/throttle/throttle_reason_pl1 - Frequency throttle due 
>> to PL1
>> + * device/gt#/throttle/throttle_reason_pl2 - Frequency throttle due 
>> to PL2
>> + * device/gt#/throttle/throttle_reason_pl4 - Frequency throttle due 
>> to PL4, Iccmax etc.
>> + * device/gt#/throttle/throttle_reason_thermal - Frequency throttle 
>> due to thermal
>> + * device/gt#/throttle/throttle_reason_prochot - Frequency throttle 
>> due to prochot
>> + * device/gt#/throttle/throttle_reason_ratl - Frequency throttle due 
>> to RATL
>> + * device/gt#/throttle/throttle_reason_vr_thermalert - Frequency 
>> throttle due to VR THERMALERT
>> + * device/gt#/throttle/throttle_reason_vr_tdc -  Frequency throttle 
>> due to VR TDC
>> + */
>> +
>> +static struct xe_gt_throttle *dev_to_throttle(struct device *dev)
>> +{
>> +    struct kobject *kobj = &dev->kobj;
>> +
>> +    return &kobj_to_gt(kobj->parent)->throttle;
>> +}
>> +
>> +static struct xe_gt *throttle_to_gt(struct xe_gt_throttle *throttle)
>> +{
>> +    return container_of(throttle, struct xe_gt, throttle);
>> +}
>> +
>> +u32 read_perf_limit_reasons(struct xe_gt *gt)
>> +{
>> +    u32 reg;
>> +    if (xe_gt_is_media_type(gt))
>> +        reg = xe_mmio_read32(gt, MTL_MEDIA_PERF_LIMIT_REASONS);
>> +    else
>> +        reg = xe_mmio_read32(gt, GT0_PERF_LIMIT_REASONS);
>> +
>> +    return reg;
>> +}
>> +
>> +u32 xe_read_status(struct xe_gt_throttle *throttle)
>> +{
>> +    struct xe_gt *gt = throttle_to_gt(throttle);
>> +    u32 status = read_perf_limit_reasons(gt) & 
>> GT0_PERF_LIMIT_REASONS_MASK;
>> +
>> +    return status;
>> +}
>> +
>> +u32 xe_read_reason_pl1(struct xe_gt_throttle *throttle)
>> +{
>> +    struct xe_gt *gt = throttle_to_gt(throttle);
>> +    u32 pl1 = read_perf_limit_reasons(gt) & POWER_LIMIT_1_MASK;
>> +
>> +    return pl1;
>> +}
>> +
>> +u32 xe_read_reason_pl2(struct xe_gt_throttle *throttle)
>> +{
>> +    struct xe_gt *gt = throttle_to_gt(throttle);
>> +    u32 pl2 = read_perf_limit_reasons(gt) & POWER_LIMIT_2_MASK;
>> +
>> +    return pl2;
>> +}
>> +
>> +u32 xe_read_reason_pl4(struct xe_gt_throttle *throttle)
>> +{
>> +    struct xe_gt *gt = throttle_to_gt(throttle);
>> +    u32 pl4 = read_perf_limit_reasons(gt) & POWER_LIMIT_4_MASK;
>> +
>> +    return pl4;
>> +}
>> +
>> +u32 xe_read_reason_thermal(struct xe_gt_throttle *throttle)
>> +{
>> +    struct xe_gt *gt = throttle_to_gt(throttle);
>> +    u32 thermal = read_perf_limit_reasons(gt) & THERMAL_LIMIT_MASK;
>> +
>> +    return thermal;
>> +}
>> +
>> +u32 xe_read_reason_prochot(struct xe_gt_throttle *throttle)
>> +{
>> +    struct xe_gt *gt = throttle_to_gt(throttle);
>> +    u32 prochot = read_perf_limit_reasons(gt) & PROCHOT_MASK;
>> +
>> +    return prochot;
>> +}
>> +
>> +u32 xe_read_reason_ratl(struct xe_gt_throttle *throttle)
>> +{
>> +    struct xe_gt *gt = throttle_to_gt(throttle);
>> +    u32 ratl = read_perf_limit_reasons(gt) & RATL_MASK;
>> +
>> +    return ratl;
>> +}
>> +
>> +u32 xe_read_reason_vr_thermalert(struct xe_gt_throttle *throttle)
>> +{
>> +    struct xe_gt *gt = throttle_to_gt(throttle);
>> +    u32 thermalert = read_perf_limit_reasons(gt) & VR_THERMALERT_MASK;
>> +
>> +    return thermalert;
>> +}
>> +
>> +u32 xe_read_reason_vr_tdc(struct xe_gt_throttle *throttle)
>> +{
>> +    struct xe_gt *gt = throttle_to_gt(throttle);
>> +    u32 tdc = read_perf_limit_reasons(gt) & VR_TDC_MASK;
>> +
>> +    return tdc;
>> +}
>> +
>> +static ssize_t status_show(struct device *dev,
>> +               struct device_attribute *attr,
>> +               char *buff)
>> +{
>> +    struct xe_gt_throttle *throttle = dev_to_throttle(dev);
>> +    struct xe_gt *gt = throttle_to_gt(throttle);
>> +    bool status = !!xe_read_status(&gt->throttle);
>> +
>> +    return sysfs_emit(buff, "%u\n", status);
>> +}
>> +static DEVICE_ATTR_RO(status);
>> +
>> +static ssize_t reason_pl1_show(struct device *dev,
>> +                   struct device_attribute *attr,
>> +                   char *buff)
>> +{
>> +    struct xe_gt_throttle *throttle = dev_to_throttle(dev);
>> +    struct xe_gt *gt = throttle_to_gt(throttle);
>> +    bool pl1 = !!xe_read_reason_pl1(&gt->throttle);
>> +
>> +    return sysfs_emit(buff, "%u\n", pl1);
>> +}
>> +static DEVICE_ATTR_RO(reason_pl1);
>> +
>> +static ssize_t reason_pl2_show(struct device *dev,
>> +                   struct device_attribute *attr,
>> +                   char *buff)
>> +{
>> +    struct xe_gt_throttle *throttle = dev_to_throttle(dev);
>> +    struct xe_gt *gt = throttle_to_gt(throttle);
>> +    bool pl2 = !!xe_read_reason_pl2(&gt->throttle);
>> +
>> +    return sysfs_emit(buff, "%u\n", pl2);
>> +}
>> +static DEVICE_ATTR_RO(reason_pl2);
>> +
>> +static ssize_t reason_pl4_show(struct device *dev,
>> +                   struct device_attribute *attr,
>> +                   char *buff)
>> +{
>> +    struct xe_gt_throttle *throttle = dev_to_throttle(dev);
>> +    struct xe_gt *gt = throttle_to_gt(throttle);
>> +    bool pl4 = !!xe_read_reason_pl4(&gt->throttle);
>> +
>> +    return sysfs_emit(buff, "%u\n", pl4);
>> +}
>> +static DEVICE_ATTR_RO(reason_pl4);
>> +
>> +static ssize_t reason_thermal_show(struct device *dev,
>> +                   struct device_attribute *attr,
>> +                   char *buff)
>> +{
>> +    struct xe_gt_throttle *throttle = dev_to_throttle(dev);
>> +    struct xe_gt *gt = throttle_to_gt(throttle);
>> +    bool thermal = !!xe_read_reason_thermal(&gt->throttle);
>> +
>> +    return sysfs_emit(buff, "%u\n", thermal);
>> +}
>> +static DEVICE_ATTR_RO(reason_thermal);
>> +
>> +static ssize_t reason_prochot_show(struct device *dev,
>> +                   struct device_attribute *attr,
>> +                   char *buff)
>> +{
>> +    struct xe_gt_throttle *throttle = dev_to_throttle(dev);
>> +    struct xe_gt *gt = throttle_to_gt(throttle);
>> +    bool prochot = !!xe_read_reason_prochot(&gt->throttle);
>> +
>> +    return sysfs_emit(buff, "%u\n", prochot);
>> +}
>> +static DEVICE_ATTR_RO(reason_prochot);
>> +
>> +static ssize_t reason_ratl_show(struct device *dev,
>> +                struct device_attribute *attr,
>> +                char *buff)
>> +{
>> +    struct xe_gt_throttle *throttle = dev_to_throttle(dev);
>> +    struct xe_gt *gt = throttle_to_gt(throttle);
>> +    bool ratl = !!xe_read_reason_ratl(&gt->throttle);
>> +
>> +    return sysfs_emit(buff, "%u\n", ratl);
>> +}
>> +static DEVICE_ATTR_RO(reason_ratl);
>> +
>> +static ssize_t reason_vr_thermalert_show(struct device *dev,
>> +                     struct device_attribute *attr,
>> +                     char *buff)
>> +{
>> +    struct xe_gt_throttle *throttle = dev_to_throttle(dev);
>> +    struct xe_gt *gt = throttle_to_gt(throttle);
>> +    bool thermalert = !!xe_read_reason_vr_thermalert(&gt->throttle);
>> +
>> +    return sysfs_emit(buff, "%u\n", thermalert);
>> +}
>> +static DEVICE_ATTR_RO(reason_vr_thermalert);
>> +
>> +static ssize_t reason_vr_tdc_show(struct device *dev,
>> +                  struct device_attribute *attr,
>> +                  char *buff)
>> +{
>> +    struct xe_gt_throttle *throttle = dev_to_throttle(dev);
>> +    struct xe_gt *gt = throttle_to_gt(throttle);
>> +    bool tdc = !!xe_read_reason_vr_tdc(&gt->throttle);
>> +
>> +    return sysfs_emit(buff, "%u\n", tdc);
>> +}
>> +static DEVICE_ATTR_RO(reason_vr_tdc);
>> +
>> +static const struct attribute *throttle_attrs[] = {
>> +    &dev_attr_status.attr,
>> +    &dev_attr_reason_pl1.attr,
>> +    &dev_attr_reason_pl2.attr,
>> +    &dev_attr_reason_pl4.attr,
>> +    &dev_attr_reason_thermal.attr,
>> +    &dev_attr_reason_prochot.attr,
>> +    &dev_attr_reason_ratl.attr,
>> +    &dev_attr_reason_vr_thermalert.attr,
>> +    &dev_attr_reason_vr_tdc.attr,
>> +    NULL
>> +};
>> +
>> +static void gt_throttle_sysfs_fini(struct drm_device *drm, void *arg)
>> +{
>> +    struct kobject *kobj = arg;
>> +
>> +    sysfs_remove_files(kobj, throttle_attrs);
>> +    kobject_put(kobj);
>> +}
>> +
>> +void xe_gt_throttle_sysfs_init(struct xe_gt_throttle *throttle)
>> +{
>> +    struct xe_gt *gt = throttle_to_gt(throttle);
>> +    struct xe_device *xe = gt_to_xe(gt);
>> +    struct kobject *kobj;
>> +    int err;
>> +
>> +    kobj = kobject_create_and_add("throttle", gt->sysfs);
>> +    if (!kobj) {
>> +        drm_warn(&xe->drm, "%s failed, err: %d\n", __func__, -ENOMEM);
>> +        return;
>> +    }
>> +
>> +    err = sysfs_create_files(kobj, throttle_attrs);
>> +    if (err) {
>> +        kobject_put(kobj);
>> +        drm_warn(&xe->drm, "failed to register throttle sysfs, err: 
>> %d\n", err);
>> +        return;
>> +    }
>> +
>> +    err = drmm_add_action_or_reset(&xe->drm, gt_throttle_sysfs_fini, 
>> kobj);
>> +    if (err)
>> +        drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, 
>> err: %d\n",
>> +             __func__, err);
>> +}
>> +
>> +
>> diff --git a/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h 
>> b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h
>> new file mode 100644
>> index 000000000000..809213c3bba1
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h
>> @@ -0,0 +1,17 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_GT_THROTTLE_SYSFS_H_
>> +#define _XE_GT_THROTTLE_SYSFS_H_
>> +
>> +#include <drm/drm_managed.h> > +
>> +#include "xe_device.h"
>> +#include "xe_gt.h"
> Above headers not used.
Sure will remove
>> +#include "xe_gt_throttle_sysfs_types.h"
>> +
>> +void xe_gt_throttle_sysfs_init(struct xe_gt_throttle *throttle);
>> +
>> +#endif /* _XE_GT_THROTTLE_SYSFS_H_ */
>> diff --git a/drivers/gpu/drm/xe/xe_gt_throttle_sysfs_types.h 
>> b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs_types.h
> There are two files with this structure definition. please remove one
Will fix. yeah again not sure what happened with the file being added in 
so many places. Will cleanup
>> new file mode 100644
>> index 000000000000..acc23ce8d0fc
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs_types.h
>> @@ -0,0 +1,35 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_GT_THROTTLE_SYSFS_TYPES_H_
>> +#define _XE_GT_THROTTLE_SYSFS_TYPES_H_
>> +
>> +#include <linux/types.h>
>> +
>> +struct xe_gt;
> Not being used.
>
> Thanks
> Riana

Will fix.

Thanks for the review,

Suja

>> +
>> +struct xe_gt_throttle {
>> +    /** @status: overall throttling status */
>> +    bool status;
>> +    /** @pl1: throttling reason is PL1 */
>> +    bool pl1;
>> +    /** @pl2: throttling reason is PL2 */
>> +    bool pl2;
>> +    /** @pl4: throttling reason is PL4 */
>> +    bool pl4;
>> +    /** @thermal: throttling reason is thermal */
>> +    bool thermal;
>> +    /** @prochot: throttling reason is PROCHOT */
>> +    bool prochot;
>> +    /** @ratl: throttling reason is running average thermal limit */
>> +    bool ratl;
>> +    /** @thermalert: throttling reason is vr thermalert */
>> +    bool thermalert;
>> +    /** @tdc: throttling reason is vr tdc */
>> +    bool tdc;
>> +};
>> +
>> +#endif /* _XE_GT_THROTTLE_SYSFS_TYPES_H_ */
>> +
>> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h 
>> b/drivers/gpu/drm/xe/xe_gt_types.h
>> index 35b8c19fa8bf..c55815d1114a 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_types.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
>> @@ -8,6 +8,7 @@
>>     #include "xe_force_wake_types.h"
>>   #include "xe_gt_idle_sysfs_types.h"
>> +#include "xe_gt_throttle_sysfs_types.h"
>>   #include "xe_hw_engine_types.h"
>>   #include "xe_hw_fence_types.h"
>>   #include "xe_reg_sr_types.h"
>> @@ -298,6 +299,9 @@ struct xe_gt {
>>       /** @sysfs: sysfs' kobj used by xe_gt_sysfs */
>>       struct kobject *sysfs;
>>   +    /** @throttle: frequency throttling reasons in GT */
>> +    struct xe_gt_throttle throttle;
>> +
>>       /** @mocs: info */
>>       struct {
>>           /** @uc_index: UC index */
