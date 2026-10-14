Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF2CACC6B2C
	for <intel-xe@archiver.kernel.org>; Wed, 14 Oct 2026 19:34:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CCBA10E348;
	Wed, 14 Oct 2026 19:34:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E103E10E348
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Oct 2026 19:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792006434; x=1823542434;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Yvyd0u8PlZK1+WK0Jj1+s1nMJudbeDe0XbGZ9lmI698=;
 b=YX8Cp6kAj3oaZ56CqDhywdt/B2WDhaS7mPdSF8ocyf2yh+CzJzb53NNP
 EBOBUKDrt0yHg4QFYuHAB0tOKFmy6gnDxEi7slVMn/3vednGY7BLXZg4s
 XEDEtx1tB2fztL+SbyKfiOF+iRQcWOPSL3mcGUQDZ65SZDVXo7KHoYJoS
 ZXJoyz41AKUxBtAY3q75iMH6w/exsZmg3LU5IufPRqikgO3fQ5Yqyo+2D
 slId1kgmr1MlPpFgtIOpUjE1jIL4ay68861Ojrwpk9NkYVCbo/SIDfFx7
 5RWh1K6QdWBDh8r/cifxjGrQQ0wVaqkeiFDchD7HZa2HKucxKKMdWcaNX g==;
X-CSE-ConnectionGUID: Judb8h4LS5WS/9mJFNQQuA==
X-CSE-MsgGUID: QTorgYYBTHS1MSmGJevuTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="756094"
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="756094"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 12:33:53 -0700
X-CSE-ConnectionGUID: NKKgmZzgRvOeBNAFnpNl7A==
X-CSE-MsgGUID: OWLL7bFdTw62HiuOJ69DeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="1588284"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 12:33:52 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 14 Oct 2026 12:33:52 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 14 Oct 2026 12:33:52 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.38) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 14 Oct 2026 12:33:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j25jHndpzCctmMuHI3Lp6jnoCnwATZX/L5YwJE0RWjLfjpTlDsTA6i7tRBF17aC7JsLWxJgr7KWlj8/ml5rdX8CJYD5ToiNDrDKInwOXN+0CM0yQdWKNB5vHxtYC0IyO755ckrtDTbuUVtRM6U3mAZE7ukuHavoeIwQzSzOsla0yA7EjgrlUKiSB6AJD+WXN/h43tTvE5m5vxPCuHBZP1IlVZaLUZ0S1IVr3fJQeaz9+yKBlGHlXcyrC+83yJuhlI+RIm96zwugljwV/Qulzg+zx+Iy7k5i5aezhkSiwts69/2m0Ou2UyXgNyUwDZHwunFeVYiPIe2wv3RaSMuYuXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CNa/EOO2+FTZO3F7m+yhNUgDThjSpR1b2IWH3YT9XJI=;
 b=vMDEk9Skyi+UgNryTQhFFHyN97KrBVCyPHUdiBMbT1eEkfuiuMCsOI8SaQCTPOs+ErXZsES4SYPflTZwWOP2p48yN79yWr4PjzTAOhIbDPLugqmOYOLt/NSKqO7GJkfPTUUNe1UCJMXLdOXixSxgoNs7jpj8b5FA4BmTZYchBFdp/RIqOfdSOsmkQzGHdTYKYH3WJgkj083n6lFTgE9uS5Pi0XKTYGZgBlhsa7rus6mqeTHCIs3515sy1eXxrzXHnawuw3cz4rNyP5uAje73rhavltEWpIRHm+aPgA4+lDyEM21bB/wVR8a3c8OyX/kuLZiaU8NkdLPPAU5it8SRAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH8PR11MB852307.namprd11.prod.outlook.com
 (2603:10b6:610:32c::22) by CH3PR11MB901483.namprd11.prod.outlook.com
 (2603:10b6:610:348::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.24; Wed, 14 Oct
 2026 19:33:45 +0000
Received: from CH8PR11MB852307.namprd11.prod.outlook.com
 ([fe80::5f8e:c1ed:445a:a4b7]) by CH8PR11MB852307.namprd11.prod.outlook.com
 ([fe80::5f8e:c1ed:445a:a4b7%4]) with mapi id 15.21.0522.012; Wed, 14 Oct 2026
 19:33:45 +0000
Message-ID: <e7e47f48-112f-48b3-898f-af2a4fc6788c@intel.com>
Date: Thu, 15 Oct 2026 01:03:36 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 12/16] drm/xe/hwmon: Update memory controller
 temperature offset for CRI
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>, <riana.tauro@intel.com>
References: <20261014115806.831459-1-karthik.poosa@intel.com>
 <20261014115806.831459-13-karthik.poosa@intel.com>
 <as_BTb-GDagB03do@intel.com>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <as_BTb-GDagB03do@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0243.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:223::18) To CH8PR11MB852307.namprd11.prod.outlook.com
 (2603:10b6:610:32c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR11MB852307:EE_|CH3PR11MB901483:EE_
X-MS-Office365-Filtering-Correlation-Id: b1b60dd8-1d19-4026-09c4-08df2a2a0fad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|6133799003|10067099003|22082099003|18002099003|3023799007|4143699003|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info: 1tntJQkBRo5h3Qk85d1HchJYS9bNHKjzg5ruTj8SOva2L6gqrxzaayURy9L4tfpBIDBCsl9ThV3eFv2EFIsZpuP8VJBdEM0uOGk4PqY5/cx5h1R3kkm22Gy3hx7Lw4213TStT/9S6RjB1DN+gVyB7FAr2fjo2FLHmURSUJ4tVrL9c9G3LUhj9SoETeZBIf4A+YLS3c7hJrSTuxYTaggsZNEbVI+rGioq9o611kke9D5gAVXvtw6WDeV9tZM32jg+FdlQ0S6I1tRtcXejybsJqcDRZ9mS4IGf/intLFwHN/wnQkv61HZnEGkH3LuzkEFquaaGhEyzUjEJJHtE8jKH8enPhwB9gYI/uhdYiF40JsyCQbGdvkjhzsUvnCxHVyEEY+2lUv3jVDK7b3ZsuUKCCPPj37gD1S1VW0TPH496Zqq/TMB8Wpj/FAFwLUgN6rZiEkIZT4erof9x6t9oqSwWIHv57lKPpblnvNGLEzJSPpHOcJiUEDWFIflTkKad2Lsih9R/kgzVFPHFHoVKOX+VA6rtZRBDVdpdugRXBldsLRtsi1+JGJpbe2e8QJ98Gi8gQg3Fn4LnHFlMdc6BMBSiNDigquHxi9luTjlPEFBeoyp46N0kyfYuep5K8+kwB+g47t+qgG1qywYcnfys0ev9t6MIOLCwPpGtll6s1Hbg0YM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH8PR11MB852307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(6133799003)(10067099003)(22082099003)(18002099003)(3023799007)(4143699003)(11063799006)(261009223027099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UlNZYTBtQlBvYjNlNXRBMkZES09UOG51eGtmb0VzMVF0djROMDc0UFpMVXc2?=
 =?utf-8?B?S0czNlV1UWRsMGpMbmdpL0htcnBzdFRKVlZiaFZjRU84NGFRYU01bVNZRUh2?=
 =?utf-8?B?a09qdHprRmE4UFNsdW9KS25xRW5uUW9NZlo4WnR1cHcyZFFOZERtOHJnbmV0?=
 =?utf-8?B?YTdDaTNKTG9IMmdWVWFTQ0g2SFRqRlUyc1ZjcFFGL05kQ2lRdmtLNnlEZHRH?=
 =?utf-8?B?RFB4aVNhMlBIYTV5Z0JCSHBnV0pRSllob1A4VFRxTjVqTjJTNW1VNW9YT01P?=
 =?utf-8?B?NXVqb0dlellRVEVHelE1WFdoUjh0VHlPdEljMVhDek1HQWtiVkVGZityVmxE?=
 =?utf-8?B?UUR2K216LzBrVWhjK0dpTFZLcXBVZGtEcjBweDFCbUFmYWRYOWVhMTdWei9r?=
 =?utf-8?B?RFg0SUZOdXowcFJCdzlmVjJNWUpMK1RnbGdvcW04Zi9YdzVjOG50T2RoWk43?=
 =?utf-8?B?eXpIQ2xHazlwMzBJUXZKdTc2QVlQaGNRdkZNUmVrZzVreG9DR1M4YzFENUdN?=
 =?utf-8?B?czYzdFR6aVpKdzNyNHBlZGJpd3Byc0NKSzJSb0xWSCttUExNN3hOZnpMTE90?=
 =?utf-8?B?ay9md3ZCTGJYRCtQZW4vOUZaV3dSSW9ZUlFKLzVQd25yRW9DczZnbkpWSUtM?=
 =?utf-8?B?VFkyT09qd1JKbmNmclZUbSt1TDVETUVmODBTNGFFS1FLN29VRVpYYm83eHpz?=
 =?utf-8?B?Ty9XS2FsS2ZlZjV5WlFTa0d3MXhkcU1CaHNNMitIaGNJVnVNTHc2bDg0QTZt?=
 =?utf-8?B?dDh3Z3VzZk9sZGlvRTA2WVBVVTdMVFljd3piZzdYSXpnNXpTcWE0dVQzV0lw?=
 =?utf-8?B?Y2t0UnR3VlB0ZE92WXpoWktaZE44S1djcDUyejBUcG4zTW1jRjRqVnBHQ2E4?=
 =?utf-8?B?bnJ3MWRKMnBLa29pVzZuejJrVlg5dldhZ1B3QTNZNUc1dEEvTlhMWXhPdDA3?=
 =?utf-8?B?azE1T1lvcDM0c3k5SDJpUVMyT1NYUEtVOHFrT0JZVWVpd1BkLzJGRzFIVWJM?=
 =?utf-8?B?eXdTcmRNVUo3Mno2MnR2TDBDM3lpTVRPK1ViLzBZZ1Q0b2dzNW9ldUFIU2pr?=
 =?utf-8?B?SjhkaVVCaExYSjFZeThVNG8zN2dkNW8ybUlZRTVRYnlSVWl2NXBZOFVlQndw?=
 =?utf-8?B?UitwWFFPQnEwdDE1RnlEMmlGZi9kQlY0THp3MDZQempob0ppQ3liNjlsTDg3?=
 =?utf-8?B?SGQ1eXhGUVFBUjdYODQ3Z0tvYnRjTGQ4Nm52WVZSS1pCMVowLzBmZnZiQ3BZ?=
 =?utf-8?B?RHZzZS84SGR0aVpVRzlONzRxZVZrRk9Kb0JaMFJabGJoUCt5MjJhS3ZvN04r?=
 =?utf-8?B?YlZ5ZytRZEZCOExqOHdWUkwxSy9hTUQ5TS94K1o3VUw2V1JJS1Zrd0FIeU9I?=
 =?utf-8?B?emFQdlBLNTl3OXZ4dDY5QjBNendxaGFJa1BtdUFXSEVQNEtpSEIwcHpyNWRV?=
 =?utf-8?B?Um1SSGVHRWxrbHJCS3NCUVJydXMxcDk1VkhJNFBkcTBPNGVHMnFUM3BESUZ0?=
 =?utf-8?B?ZnZFc3RTRk1lUlpSb2orZXlZaWpnVEVyY0FSQ2pzWXdSQnd4Zis3SnRvcGZU?=
 =?utf-8?B?Z3lPWWRWR0E5bGZqTEUydExIY1NIMDRUdnN5VjNHQ3ZMY1dacnZXSllvdmNt?=
 =?utf-8?B?N1FPOTFFaDZFd1VNUC9NSmw0MEVIUWdpRGdFUmZxZldkWGgxNWJtOU5iYjVR?=
 =?utf-8?B?WkdiRjRBVk9xb2h0bWtyanFGZ01iNjBjMXFkSWgydTQ0bnRUaHdQRnZqYkda?=
 =?utf-8?B?T1pGb2k5MUdOaVpPdG81TTRHQWtlSEhjZFg4WHF3K3JMQXBKOCtKYitzS1I4?=
 =?utf-8?B?bk1EczgrV2N5U0lIb2M4Z3lBY3lUYy92bkIxY0s0Sy81bzZDSGNvYmZzcFBl?=
 =?utf-8?B?NUd0aTVzVjIxTjQ0SUVOU3pqOVlBWHJQRVVBS0dodTFmVmdzelRFaXJQcDFZ?=
 =?utf-8?B?WlRvK0pUQ1BJbmYycmswb2NpVTlxdzN5WFhtU08xY0VoSmRNVG44ZzFaU3pX?=
 =?utf-8?B?QW5YaThnUlk3VXpzU3E4T1hScWxOZmJ3dk5Gd1dONHpXVEhwQThERVZhQXoy?=
 =?utf-8?B?THJRL2JXcTBNMHA4Qm5ZK1ZrbW9MZDFMRlBSWjRqNlc4RjVGZ3hQQ3drNjNm?=
 =?utf-8?B?NGs0WHprYmkzc0RDalFNYkRpb2pyM2tVTnpMZjRwT20vR2FkU25rVG85MDZC?=
 =?utf-8?B?MVhHbEgvWUFZWExydWtmUDJpK3puRjJ0a0lQRHV4eFVPRzhsVm5MR3hseVRs?=
 =?utf-8?B?cjlQL3FVT2x0Q2QzZzV5eUxwNmQ5R2prcVhiRlJ4a3dPODUrQmgzMXdFMWlB?=
 =?utf-8?B?L3djYjRvcjV0SUIvRXhSSHJrSkhweW1kT3lKaGpPNkFNalF1S2JkZz09?=
X-Exchange-RoutingPolicyChecked: AtkGq5XvlengJNQWefdoZYBHe9ZieDf33y5/3jBhtyOnWgEwuH5udQbB+d59rdvxHABZqylEmscoTytesTmgb1xy2D+qPZa4+IHZO+9pfq23oRg4XkNG/YQEuC1G8xNXsvxSoM83Uaqp3hdxju8klZB5hJ1XE3UG8CdkK7v1YRbDm0jE4RRzu5D68LaFE/fli3nORB1TT8qKFC55kZZlJLEnGsnE7ajBvw+DNKuL20oPM69oywqcQ2C+YYmkff2K5bKr195NFXNBVBg+Knfi8tJCJ2wP4tprTDe118TDWVqqZ0gY2N4jKeX8/wdALb4YDkmZS8f2g8EdsKo1p0bASQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: b1b60dd8-1d19-4026-09c4-08df2a2a0fad
X-MS-Exchange-CrossTenant-AuthSource: CH8PR11MB852307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 19:33:45.0768 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xGk2FzjV1WKYN5d7C8lju6HEShKgfoGTSSig35KgwGFC7kYeI7EDFPNfBCzESxrJ1qMODaBPn/GtuAFFR9Xz2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB901483
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


On 14-10-2026 23:22, Rodrigo Vivi wrote:
> On Wed, Oct 14, 2026 at 05:28:02PM +0530, Karthik Poosa wrote:
>> On CRI the memory controller temperatures moved in the READ_THERMAL_DATA
>> output: they now occupy bytes 16..19 instead of starting at byte 2.
>>
>> Read and average the CRI memory controller sensors from bytes 16..19,
>> keeping the existing byte 2..count-1 range for earlier platforms. Only
>> the group(s) covering the used bytes are fetched.
>>
>> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
>> ---
>>
>> v2: Use the CRI memory temperature mapping only on
>>      Crescent Island. (sashiko)
>>
>>   drivers/gpu/drm/xe/xe_hwmon.c | 20 ++++++++++++++++----
>>   1 file changed, 16 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
>> index dad2397db141..eef6560569ce 100644
>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>> @@ -109,6 +109,10 @@ enum sensor_attr_power {
>>   /* Index of memory controller in READ_THERMAL_DATA output */
>>   #define TEMP_INDEX_MCTRL	2
>>   
>> +/* On CRI the memory controller temperatures are READ_THERMAL_DATA bytes 16..19. */
>> +#define CRI_TEMP_INDEX_MCTRL	16
>> +#define CRI_TEMP_MCTRL_COUNT	4
>> +
>>   /* Mailbox sentinel reported for an unavailable temperature sensor */
>>   #define TEMP_MBX_INVALID	0xFF
>>   
>> @@ -986,14 +990,22 @@ static int mbx_temp_decode(u8 value)
>>   static int get_mc_temp(struct xe_hwmon *hwmon, long *val)
>>   {
>>   	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
>> -	int ret, i, count = 0;
>> +	int ret, i, start, end, count = 0;
>>   	s32 average = 0;
>> +	u32 data = 0;
>>   
>>   	guard(mutex)(&hwmon->hwmon_lock);
>>   
>> -	for (i = 0; i < DIV_ROUND_UP(hwmon->temp.count, sizeof(u32)); i++) {
>> -		u32 data = 0;
>> +	/* CRI relocated the memory controller temperatures to READ_THERMAL_DATA bytes 16..19. */
>> +	if (hwmon->xe->info.platform == XE_CRESCENTISLAND) {
> we need to be consistent... we either use >= cri everywhere or we use ==...

I used == explicitly here, as sensor mapping can change based on the 
platform configuration.

where as MMIO definitions and mailbox definitions are expected to be 
same in future platforms.

if those can change, I shall make all places == XE_CRESCENTISLAND

>
>> +		start = CRI_TEMP_INDEX_MCTRL;
>> +		end = CRI_TEMP_INDEX_MCTRL + CRI_TEMP_MCTRL_COUNT;
>> +	} else {
>> +		start = TEMP_INDEX_MCTRL;
>> +		end = hwmon->temp.count - 1;
>> +	}
>>   
>> +	for (i = start / sizeof(u32); i < DIV_ROUND_UP(end, sizeof(u32)); i++) {
>>   		ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_THERMAL_INFO, READ_THERMAL_DATA, i),
>>   				    &data, NULL);
>>   		if (ret)
>> @@ -1002,7 +1014,7 @@ static int get_mc_temp(struct xe_hwmon *hwmon, long *val)
>>   		hwmon->temp.dword[i] = cpu_to_le32(data);
>>   	}
>>   
>> -	for (i = TEMP_INDEX_MCTRL; i < hwmon->temp.count - 1; i++) {
>> +	for (i = start; i < end; i++) {
>>   		if (!mbx_temp_valid(hwmon, hwmon->temp.value[i]))
>>   			continue;
>>   		average += mbx_temp_decode(hwmon->temp.value[i]);
>> -- 
>> 2.25.1
>>
