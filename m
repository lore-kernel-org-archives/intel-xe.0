Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC10ECD11C2
	for <intel-xe@archiver.kernel.org>; Tue, 19 Mar 2024 15:17:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AED910FB87;
	Tue, 19 Mar 2024 15:17:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OhuZM7Tr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3854C10FB87
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Mar 2024 15:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710861437; x=1742397437;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3yyPngFn2Zi7SBsrcq2giBNiXSdFzozN8prw41/xkso=;
 b=OhuZM7Tr2fpp7JYVO9cAwTVd7w5aU0btUU5gSSZhl51F0F4D9wC97fNf
 R18U3ScY9c5GaiYvO4dEC2jmy9MM7ZVf4XI68AKYlEZ5oGyi48XG/Lpkv
 2+hyed86uE/wPXM+wTnlwL3JYJCfhYLctVxUD1nn10IXvCJX/g7BsVkN0
 ZTBdqVW/h4IDru1BIUukAK4qE+sN5UeJ5WIV5IDYeidjhWSZKgPX2kn57
 /886dDIl3gozQbquEt8/oGi5ZyAyrQQ1cIWV/oQfHvrMWYIqMlKWOP+rS
 CP0KyHrAMIb8lN9wDcphdm51+DqNDbVZXJ4mZYTc3j+wAfOurPu1J153d w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11018"; a="8681324"
X-IronPort-AV: E=Sophos;i="6.07,137,1708416000"; 
   d="scan'208";a="8681324"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2024 08:17:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,137,1708416000"; d="scan'208";a="13738189"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Mar 2024 08:17:10 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 19 Mar 2024 08:17:09 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 19 Mar 2024 08:17:09 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 19 Mar 2024 08:17:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vce4gkDtNi2TLIJupL7PnaT3nxqJ/R4vT1Oediam9V4KdX2U1UhX1qeyOcsGpRR/sa4TmGe2leyzF4W03GFgc3KZJZcxJmi4xz0xB91Vs1VgdMETbJNq+rcB5ChD94Hs92gWivPSaan7300mCalfLLO7zFojoOyBnIJ0LDIcSMGICBaP/XPyYytvNimfmB6yRkH+lGUM6WYWWTWd3V6aO6HqVafuVv55655Xg1wRNYaPsyWcLB3yX8V+D6O/chGhS3nT3PXTmPKbsC0svLGsqx+5hxO5u5FtXUSZG98m3NmKTu5p4T2IadTONqhC8uCibGx140CQ5QhIGam/q8iObg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8BH4nppVpsEqyJVP4u8Fm4o5hoGG7OY0phZ6dwlDqAQ=;
 b=h9ZBOH5u5AM8Y+JA7iHLB/x4yizqcoRDQmixy5Xfm5POuSzPyK8i1q9kjPD3ekP/2675ZtOcabIlOj6I9YA/Ch2+O7KvBZzWOAj0i45QXSbEtQtlSYmgkUAe++guvZNSBIHc1PXYDqnJ4fRK7/29sFlPYkES99CkzPKo/6aJ5Iov2g9OLVkDyOwSP3iTLw5pQguxfGk7VM4el4E9yzFxrW/Uv9oGcH6yygYsLPY9pZ3fSg3Yg5uk1OfBBZAKlmaLU7QXhens3NrJO68OCp3cjEJJG37mOcE2S+LYzAVAJxpEFIoWG7r+OXmkqUnIiSNZNseGRyqM6fv1EueDw3cOqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by PH8PR11MB6951.namprd11.prod.outlook.com (2603:10b6:510:225::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.11; Tue, 19 Mar
 2024 15:17:02 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::eb80:5333:fa3e:cb6c]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::eb80:5333:fa3e:cb6c%4]) with mapi id 15.20.7409.010; Tue, 19 Mar 2024
 15:17:02 +0000
Message-ID: <8af127e0-a5a5-4602-9012-e875a79cd256@intel.com>
Date: Tue, 19 Mar 2024 20:46:54 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe/lnl: Enable GuC Wa_14019882105
To: John Harrison <john.c.harrison@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <lucas.demarchi@intel.com>,
 <matthew.d.roper@intel.com>
References: <20240315112147.2460691-1-badal.nilawar@intel.com>
 <20240315112147.2460691-3-badal.nilawar@intel.com>
 <835a2607-9d3b-4a05-95ac-186e2988683c@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <835a2607-9d3b-4a05-95ac-186e2988683c@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BMXP287CA0002.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:2c::17) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|PH8PR11MB6951:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cbfb2eb-44dc-467a-1ded-08dc4827a121
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TuQcWZekieEpeOm2RJkb/0aMLA2sOCDBT7LaiBjP04KCRWPLvZsUpE7CAaOT5RuJEWCam9VAyaUMJMNa6f7zg3f0cu14mfk1BjCydANGi8QHx20r1p+6BeE9fBzvygdfgVX8ypgSECo4cfWeEOIrsfewYz4NWfd9cM4gd1I5DuZqHXL0HGOtdO5IQNP4m+PNxo3a0Jw9CXL51x5YLMrNACm8ywEzanuJg2RCqLMsuVLE+3OQv/4WCIpOKIKAYrwqRfOA/s8NykfcYSCExTboTZvRQU3raM0HdYDc1Pp0GmeXb033TT2RQN1fuo5k3WyKw2vnwfhN4hhIS2xRBh7F2TN3XTJeN1wmb7XtZWXmG0jQi6z0CLq52uFOQiH5f50i6n3agHswTqdjuahGSAmQM31wXXP87+iq2f95ImNFyVUFaNtkP7GmcSoKVo6RsxNfA53kRXHIFJ3kKxftBef7uVQk/YaanWRBQphydrvDr2/2sIeacN/0YC/+JbXC/LBAoHFjhTBPviedfc6CaQt69qibVy73ugTJgFeaqZJk48iLcGOsyJvnEhvYEHM2lX+jFzGkxrTCxOn4woMfzSpq5DpsJDJW0j8bQzpAYYOHK8xNdJ/qIckgVqggGGsnENlhsbOD23CIVe2oxsXruaY2X6yNKposQoVjc4jCbxEH1Rc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ck90VmNVSEpWdUxJbGtPY3pMellPMTh4dG9vOUJPb3l0c09oWDBTTWxBZ2xo?=
 =?utf-8?B?ZWFaTzAybDRkbmY2Zmh1L2sxV3Z3bkZpb01ZVkhSKzZGMWZ2WTFwNGpwdTRa?=
 =?utf-8?B?UEZjUlFaK2U3U0M1eHlvMFhuTEZkK0pULzgrNkZmaE9BdHcvamxJMkJYYzhE?=
 =?utf-8?B?cTNFbFlJVHdkRURtYlB4Rk8xRFc0SXJ4L0k0dlFwc3JtMTJvSjM2a1o4akxP?=
 =?utf-8?B?R01xYVc0TDc5bXhlUmdOSmhCYkcwNXlZeU9tVTZubWt3SitkakFzcVowR0Vx?=
 =?utf-8?B?RlhIeS9JMTVRUjZUVTVjUkZ1bUJpcFJ4THZIUDBpQU9IQmdteUxMRDhaWXUw?=
 =?utf-8?B?cFNPVk1uMExLRUMrZVBIWExqdHZ1MHZlSW53a0FKUStBR3NjNm4vcUhoMXc3?=
 =?utf-8?B?L3JZVWhkSE1UQjM4MDU2MjRHeDNkSmh6dXo0M1hlQUxRcGR1Yk9VdkdUVUpI?=
 =?utf-8?B?MCtWeHI4c1F3VnMwSDI3ZTJkOVFBekJLWlZhV2FRekhqTlROaUhRTC8rQ3hN?=
 =?utf-8?B?MlJTWUJldzBpSS9aSUpGc1lXZ3ZPbTVVQTB6K0Z0dTdCSG9qSkd2Um52SnJv?=
 =?utf-8?B?Znl2V0loN2c2VzBUWGYycFhtbjB3M1dvUlIwaU9JeEJSTEY1UXF3TUxNUFgv?=
 =?utf-8?B?Rk40bzcxKzlGcGlYcStEbWNVWW03VjE0bTMyVjNKZFdCNlUzNGxLQURrRTNF?=
 =?utf-8?B?NzdHbmk3ZWhld2tXVVN5K3FjVGZZRkd5dHpmbUt3UWF2T1lQVlRZK2RWZlow?=
 =?utf-8?B?TjdPaEVETDZCV2lnWTlyNXFHcFZIWlhHVElKRWQreWdCalBqYVdCcjJZdTdy?=
 =?utf-8?B?WHFmbU5WeWdlZXlTVEhRWFRVN0JCMm5Ta1VzbzIxRHJoenhvT05FOEh4WjBk?=
 =?utf-8?B?QlpoUHpUeDNRbWplTDBQK2FINDJhTVdoM0wvVDFNaFp4SWFlWmRIRmpaeklF?=
 =?utf-8?B?elpDTlJrL1VvM2RRNW9tdFg4QUl6M2p1aEhDbmhEN2lrUDYyc2EyUklrZ3No?=
 =?utf-8?B?Vk5FQVVHZDNDOWh2dmNKMng4ams3L1RFam9tc0V6d1l0aWlGZ21xeFhTam15?=
 =?utf-8?B?d0tuK0dtTjNBZzhvM091Q2lBS3pFWER0QjBicEwzbVB6cHpCQmVjdUFLVEJN?=
 =?utf-8?B?WExLNkRENzlOd1BJdGtFdVZJa3NqUUhrOHhWQUdRcVZEOG14OCtQWklSb1hI?=
 =?utf-8?B?R0hzWkN5aGFOZEFaNFFaMzZrQjZ6NVZpNG1iMmdKd2crQ01adGg2OU1FbUMw?=
 =?utf-8?B?L2JmOW5yL3Iraklmc0pEUTNFLzE3bHlGZy9aUEwzZC9hVTJ3SkNEUjhIM01r?=
 =?utf-8?B?R0ZUVHZFcnlLVXdtTFZxZFlZT1BNZExzaVZBZkEvbFNNbkx2NDk5dFk4bzg1?=
 =?utf-8?B?SVRRVHQ1L29veW9hSDR4b0x2cDZCRjVpbkxZWW02dUMyZ2szMlVERUdPdWZQ?=
 =?utf-8?B?U2grMzBvaTFhaXNxMjcrdzF2Y3VTaSsxSFFmQ2I2a0poelhHdGozaEZBa283?=
 =?utf-8?B?Y0pEY0ducUx0bGJvZysrVnM0cXZiZ1ZPcUppZzR3NHVPUms5RnFCVUZpcjJq?=
 =?utf-8?B?YkZENVhKaGV2YzlVQTZJZmhxZnozYjFPTm5NSmdNS21PdGQyQjMxMHNDazVJ?=
 =?utf-8?B?TVZtSDAwQ2hmVmwzRGprWXNtMGlTNWVMcWl0RXZ1NFlMalhsbmovTzJua05L?=
 =?utf-8?B?d1h1UTNQSXdjVmkzaC9tR29rZThIekxrRWx2bzBxRjNTRTlqVC9HWWFJeEh5?=
 =?utf-8?B?VHpCZGt5K3JkR0NtUi9QQkhQVGVCb2J3M0I5SjJWSy91NzVwQ0dwZE0ycjBn?=
 =?utf-8?B?SDN6SG14c0VQem5ldmxZWGRHZS9ncEYxbTlJQXJFUEtLUlBTMjJ6cGlTejJ6?=
 =?utf-8?B?OVR1SzY0S2UzL2NhbFY1T0JiUldZN1l0YitKL09CNmxMZ3llbXMvaUZOOXVD?=
 =?utf-8?B?REFiZEtzQ0xFT3FSUVhhWXVUWngvc1Q2Q3BINnJOTlhzdVdzWStHUU8vaG9L?=
 =?utf-8?B?VEsveWxuR0RDVkNKMG4xZ0syU2IzU2ZlbE83NitJNGtDUERPMm5RR0d5d0Mz?=
 =?utf-8?B?aWtxUGxLY0FUZDEvWkpsbHJCM0dpWUtJdnZ6ODN5SHg0SjAwYlJQbm4vQS9i?=
 =?utf-8?B?c05IKzVzc2l2S2x6Q0dueTJZdzNCSUlzemxhMUwzZGtPQXQybWJnbnJnTFRD?=
 =?utf-8?B?Mnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cbfb2eb-44dc-467a-1ded-08dc4827a121
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2024 15:17:02.7092 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7J5OyPNLRb1AvyeTsAcvwaOcmyvYz7SkaVafMPZe5sM3vu+Xr56gmGYdlY/eViub78TLNP35fVW+qiDQAfNnnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6951
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



On 19-03-2024 03:36, John Harrison wrote:
> On 3/15/2024 04:21, Badal Nilawar wrote:
>> Enable GuC Wa_14019882105 to block interrupts during C6 flow
>> when the memory path has been blocked
>>
>> Cc: John Harrison <john.harrison@intel.com>
>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>> ---
>>   drivers/gpu/drm/xe/abi/guc_klvs_abi.h |  7 +++++
>>   drivers/gpu/drm/xe/xe_guc_ads.c       | 41 +++++++++++++++++++++------
>>   drivers/gpu/drm/xe/xe_wa_oob.rules    |  1 +
>>   3 files changed, 40 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h 
>> b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>> index 0400bc0fccdc..5dd45e06f0b6 100644
>> --- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>> +++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>> @@ -319,4 +319,11 @@ enum  {
>>   #define GUC_KLV_VF_CFG_BEGIN_CONTEXT_ID_KEY    0x8a0b
>>   #define GUC_KLV_VF_CFG_BEGIN_CONTEXT_ID_LEN    1u
>> +/*
>> + * Workaround keys:
>> + */
>> +enum xe_guc_klv_ids {
>> +    
>> GUC_WORKAROUND_KLV_BLOCK_INTERRUPTS_WHEN_MGSR_BLOCKED                = 
>> 0x9002,
>> +};
>> +
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c 
>> b/drivers/gpu/drm/xe/xe_guc_ads.c
>> index ee48cf01fe22..3d2048747230 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
>> @@ -7,6 +7,8 @@
>>   #include <drm/drm_managed.h>
>> +#include <generated/xe_wa_oob.h>
>> +
>>   #include "regs/xe_engine_regs.h"
>>   #include "regs/xe_gt_regs.h"
>>   #include "regs/xe_guc_regs.h"
>> @@ -19,6 +21,7 @@
>>   #include "xe_map.h"
>>   #include "xe_mmio.h"
>>   #include "xe_platform_types.h"
>> +#include "xe_wa.h"
>>   /* Slack of a few additional entries per engine */
>>   #define ADS_REGSET_EXTRA_MAX    8
>> @@ -281,8 +284,30 @@ static size_t calculate_golden_lrc_size(struct 
>> xe_guc_ads *ads)
>>   #define GUC_VER(maj, min, pat)    (((maj) << 16) | ((min) << 8) | 
>> (pat))
>> +static u32 guc_waklv_opt_in(struct xe_guc_ads *ads,
>> +                enum xe_guc_klv_ids klv_id, u32 offset, u32 remain)
> If going straight to a generic helper, I would recommend following the 
> i915 version - move the += size / -= size inside the helper rather than 
> duplicating for each call.
Sure, I will move this calculation inside function.
> 
> Also, not sure opt_in is the best name. There could be future KLVs that 
> take parameters (it did almost happen already but the direction changed 
> for other reasons) which would still be an opt in. Hence the i915 
> version is called guc_waklv_enable_simple.
I will use guc_waklv_apply here.
> 
>> +{
>> +    u32 size;
>> +    u32 klv_entry[] = {
>> +        /* 16:16 key/length */
>> +        FIELD_PREP(GUC_KLV_0_KEY, klv_id) |
>> +        FIELD_PREP(GUC_KLV_0_LEN, 0),
>> +        /* 0 dwords data */
>> +    };
>> +
>> +    size = sizeof(klv_entry);
>> +
>> +    if (remain < size)
>> +        drm_warn(&ads_to_xe(ads)->drm, "Cannot apply guc wa klv_id 
>> %d\n", klv_id);
> The message says 'cannot apply' and the copy is skipped but the size is 
> still returned and overflow will still happen.
Sure will fix this.

Badal
> 
> John.
> 
> 
>> +    else
>> +        xe_map_memcpy_to(ads_to_xe(ads), ads_to_map(ads), offset,
>> +                 klv_entry, size);
>> +    return size;
>> +}
>> +
>>   static void guc_waklv_init(struct xe_guc_ads *ads)
>>   {
>> +    struct xe_gt *gt = ads_to_gt(ads);
>>       u32 addr_ggtt, offset, remain, size;
>>       struct xe_uc_fw *uc_fw = &ads_to_guc(ads)->fw;
>>       struct xe_uc_fw_version *version = 
>> &uc_fw->versions.found[XE_UC_FW_VER_RELEASE];
>> @@ -293,15 +318,13 @@ static void guc_waklv_init(struct xe_guc_ads *ads)
>>       offset = guc_ads_waklv_offset(ads);
>>       remain = guc_ads_waklv_size(ads);
>> -    /*
>> -     * Add workarounds here:
>> -     *
>> -     * if (want_wa_<name>) {
>> -     *      size = guc_waklv_<name>(guc, offset, remain);
>> -     *      offset += size;
>> -     *      remain -= size;
>> -     * }
>> -     */
>> +    if (XE_WA(gt, 14019882105)) {
>> +        size = guc_waklv_opt_in(ads,
>> +                    
>> GUC_WORKAROUND_KLV_BLOCK_INTERRUPTS_WHEN_MGSR_BLOCKED,
>> +                    offset, remain);
>> +        offset += size;
>> +        remain -= size;
>> +    }
>>       size = guc_ads_waklv_size(ads) - remain;
>>       if (!size)
>> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules 
>> b/drivers/gpu/drm/xe/xe_wa_oob.rules
>> index 48cdba1cbf95..a8d15f004b6c 100644
>> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
>> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
>> @@ -19,3 +19,4 @@
>>           GRAPHICS_VERSION_RANGE(1270, 1274)
>>           MEDIA_VERSION(1300)
>>           PLATFORM(DG2)
>> +14019882105    GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0)
> 
