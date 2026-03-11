Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D66511125839
	for <intel-xe@archiver.kernel.org>; Wed, 11 Mar 2026 14:52:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86C1910E27A;
	Wed, 11 Mar 2026 14:52:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dmYwKc36";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDE0A10E27A
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Mar 2026 14:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773240722; x=1804776722;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=abRqNg+Il4PiU7XPolOiABxIz0jXrSTyG1KG6CSk1KA=;
 b=dmYwKc36Fi+qgj6jGwLFUTn6j/Oh2zLFdJtDe+NQjEsdENAl8KdFSgvS
 fJgLVw4DfcAGV8CbART9VvxfAP3+Wc7fFWVU43tFQyqlILdNinxX59l6N
 PN6fP+D5rb9SwaBIeNTY5KaizZQZC/R2b8lge6PsHQn4XQbK/TlcTdWsG
 uZkH/BWY0wkTxvLnQv87QDyj6sP4B+17AGGsXqHykWqGj6bUk2wTB2lwn
 WofWme1mdwVIwPmDsevCnYXnCvZph2hdvlFmxtDyMVfAMHaOyE7Bd1jI0
 AxudIzfFYMkLYzN+nXaHnvgPcaXDPTkbUERa7gBaITe4XuRauBDtiXJ/1 Q==;
X-CSE-ConnectionGUID: iosoVKz0TiC8bR8mVgh9ag==
X-CSE-MsgGUID: r80uaTbHTCaXpViVi9VSew==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="91692427"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="91692427"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 07:52:00 -0700
X-CSE-ConnectionGUID: LLwKvBXrTLi2ho8aeZBmJQ==
X-CSE-MsgGUID: NwOI6uyTTl2M9NGd5UBjtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="243510672"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 07:52:00 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 11 Mar 2026 07:51:59 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 11 Mar 2026 07:51:59 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.22) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 11 Mar 2026 07:51:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ClRX/SaxLF2Js1FDahNAWbroAMAON/tfIqLLC2rh1ylNtXpcSOfqTcfEK9snuqCtsjTC6kTBMWjwLztoimJvKX93fICpnLURpHE1eVYPySi394yG8iF/Sbflp7KfAkpkA6Z8JhuKRYaFq9SgJZgnGwyYP7cxBMc5I0v3U+a0EhJqi3sRyM79NnSSIP2rCVM1rAByHN8pPsFyd4CeNdV+x1760d9EuHm7ZgGaa42pNFqku3WqSIKeO7taZM/BdvsknbBcyI3xAWvzREkRU9MPTR2EOjSUzZlU6tjxBpSqMA3QytbJGeEI8CGt6Cj1fQPz24eHAyq8tI+lf+ygGf8OdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NF619tmgdwfAE81DZWIDuiH0a3U7vdzWXVPKMBRBb9o=;
 b=Z99GXqpHSytbRD7aMSD6TFc0OTEXTYny4YTihCOObPVK/K4rETzG0nzo7Ny96rYgrB7S9gxYcOys8fBQ3gtUNRIt7s0ptvGuGV2ttvBplypBOZjkDxuJxJ1onkmugB6QbGA+2fV0CnWAzHP1lPPOk1ijNpywIPMDirHwkBKCq00fcZJcRdrIgdNZFiD4Tj/U+F+2WTeIAUmxBoayJ25zWSFvw+YfQJnftZG4sC3uL2voAPIG27hYG6zG9D8qlM8Ql9jGOJOxvl8pmlKjm21MISrwV0MYm+vLrxOBEX1ASPG+8tm9gvcePabfIb3j5dzG98bVvwEa0m2P9dimpUnorQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 PH7PR11MB5765.namprd11.prod.outlook.com (2603:10b6:510:139::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.11; Wed, 11 Mar 2026 14:51:56 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%6]) with mapi id 15.20.9700.010; Wed, 11 Mar 2026
 14:51:56 +0000
Message-ID: <bb0159e9-18d2-4991-965b-89dea538384a@intel.com>
Date: Wed, 11 Mar 2026 20:21:49 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/11] drm/xe/xe_ras: Add structures for SoC Internal
 errors
To: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <badal.nilawar@intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260302102155.4074630-13-riana.tauro@intel.com>
 <20260302102155.4074630-22-riana.tauro@intel.com>
 <4c4e9f47-c04a-4426-91ed-b415532d9dde@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <4c4e9f47-c04a-4426-91ed-b415532d9dde@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0066.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::8) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|PH7PR11MB5765:EE_
X-MS-Office365-Filtering-Correlation-Id: af5e1365-667a-43b4-f449-08de7f7dbdd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|22082099003|56012099003|18002099003; 
X-Microsoft-Antispam-Message-Info: I+7+lHVGBFoTl1EXwHy4ZLR2o5EKrCABd4Ub1tKbIMK0t+kYFdTuTLa1A2eXoZgUS+KB6KMLETruBP79x1q+R5+N9dwOUZs7n3Mawi5x7K3ywF9WpwVlDHpjSYzT3/R5jWRLv5SLqlUm5YRn0Sh0XNqNj5e8VXUgw8g75Upqjeg8Qnb57jSqkHDj5rOiu+W1IIwhiXNO/10p/+Lg9DR3k5khV2KMBSspoQid/58/MfhCkxFdnnDrkZbRTybKcJmwGG3CxoPF7Rc7lK7dz68lffadHqfI36IATD4wlPMN7Vmt2vcd2bmsebf8qcJpFGOOUNhSLxGtA2ajFkEVcS2//Tpg2eJGkzLOJdAYt3kv7F84Wq777KAVmoPHbwPe8CSf7hMhxLUeCxauB7Mw59cWPDF1T7IdIA+bwP8edwyaRlxOkT8L7LgjjborgAJ9aqyHHyUH8c5My01i6DflZhDU6x0BtvaprXP/hMRM/Lmy1cOK326pkQzu60l+OGtnKda58t1SVt5GKReFYbkQfn0vC6u1pw6ag6MqwojdV6hxXB0IFhG/SgoOQ0O0mzLgSICi/dCUvH7lkYnkrnyfsi7Xi+JZyGiTse4BELtE8bx8W5eBYcY+P9mR5RKaQwneplh8sA53ndb9wuYVfj1uXFRA8FN1W6NULD10QkN7oVboaba8/s6j7Ic5Gu5GFHSxA48Dh+q8pail9YBxBco9kGEO591zhR+kMUHbT/knJUXzW3s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MkQxMmlEUVlPNVg5U0NETGxPclhHL3JkV0wrL2xCbDBESHFpR3NEeDlZNXBl?=
 =?utf-8?B?eitLdHZmQklWOW9aM0JpckNMZ3NnQURia25aOCtGOSswakdrTTcveVlJZFZF?=
 =?utf-8?B?SWVxbHNyMVkySzBMRkNJMGJNLzhlZEtLV0c5d0l4L3A4M1V1eTgvTlFxeTdJ?=
 =?utf-8?B?M0lXckoyTU5seFpaSVNjVEN0Tm1ReTFoLy9UbXJMYUEzYjdKU0w4bERaL25O?=
 =?utf-8?B?QmpHSzZmSDNxTHNpQi9rU055NDZwZWtBMXRvdEkwQkFocHlpL1ZXYXVwTHVI?=
 =?utf-8?B?VThpVWVTK2JJMDNMbU1SWUVSK3hqUDdVcms4KzFmQ2xUdDQyOGxuUVUyVVlT?=
 =?utf-8?B?bFJDYnVsK0oxZVpXWnFialY3aHlIWW9Mb1VHclk0bGU4RExVTFNZUkkrRFdL?=
 =?utf-8?B?SDRxd2tRQ3o2dVhmb0xPRHc2cXNOc3dyWXVCUE5DUDNqK0hXQnF4bGxwMHlV?=
 =?utf-8?B?Z2xacUtxYjRpRTM4R1dnalEyWjVuaEJ1Umk3NkErZWx2N1lUaG9NOWMvZFFz?=
 =?utf-8?B?dDJ4ZmFwZEI2S1JYZ3Y3N1habHBYdzUzR1RZaGtuRjBVVWVEM0FPVzl1THVN?=
 =?utf-8?B?clQxTVVvUVR6ajJKZUsyc1ZVcW40Q2lDejkvWEpNQ3IvSmhvbmtlTXo4ZUlj?=
 =?utf-8?B?RnRISWNyZHhQOHcyVlk3VSsvWGg2S3RpVkxmL0dJVDZuQ3d3V2hNR0VNU3VO?=
 =?utf-8?B?R3R0Y2doV3hrSUJTRnAvV0E4dmRybEpNbnltTE1waldSQ2dtRGw3K1ZzVWN0?=
 =?utf-8?B?dENpdlZ1RjloTmtHVENNbkFFR28ybENMSjZJTkp3YmpCU09zeGExb0FPejIy?=
 =?utf-8?B?Z1poaGEwZWQzSjdOTm5QZVVYSWttV1dWZWhpUHpqMmQ0VzA5MHdLQUZyVDZ4?=
 =?utf-8?B?cWw5VExuUDBQalczTlJoWXl2UTFKS0laL3ZUUUt5V1VkNEo3RUJSYUZaejlx?=
 =?utf-8?B?UmsvWGx6cXd1M3RpVjR2c09IS3dPTng2YUlvcU9aVCs3RG1Xc3hhM1U2K21W?=
 =?utf-8?B?citLZnJsbHR2SW8xVUJWSHdIaExjSHVFQlV3Rm9xUG9zajdSR1k4SXVmMjc2?=
 =?utf-8?B?dUI3RmZtNlpBdVJsQUJSU3pvVGdDVjZUdUsvZ1BDYzJqQ0o5aGd2VmxpQmh4?=
 =?utf-8?B?dURDTXBNVWZ1WXo3WFVlelpTaFNTNzhua2lRSEZaRm85ZXB3ekxuWkVVZXJn?=
 =?utf-8?B?SU10em9ScGlQeWw1M2V5K05KbzVlaEZLczhmU1d6L2VWK1R2eUJZNE5tSUJK?=
 =?utf-8?B?MlBXdDBPRHhHcnFlREUybHgyQ0FwNGIzNlRLeGU2cVo4dGx6UCtpOEFrMElY?=
 =?utf-8?B?ZmJWRHNCQ3pnL25BWGJaTlJrdHJnZXVrZWlNLzB1MERBZUlSOStydi9pRmpV?=
 =?utf-8?B?ZWg2cVhicEdoSkhTMFpwVzdTTmhmTEloYjVqTGhzTUIyamNDK3p1SDBqdk4v?=
 =?utf-8?B?SEVUM1VUT3BqUlBIMHZmNzV5VlNONTFmYlBvZERGUlB1OFBrNGRHWlAvZGlr?=
 =?utf-8?B?U1h3WExidFlRbk5mOEpkUWNDbm55dXI2RXViS1dzU0ZlcEVUL3hkdEVmWkJZ?=
 =?utf-8?B?TWE4ZHhWNllwSmFUQjUzdzRIZ2JPdkd3bnBncXNCMnRhUXRBb0FjMGpUd2VN?=
 =?utf-8?B?NkdNZmtxVjRDaEk5WDU3MFdQd1RxNEM5OTJtSTJPL21hTnp4NFVYUW45ejZz?=
 =?utf-8?B?ZTdQMEQxU2UrWnFWamRDdDUwSTFtNTRtb3ByQWwzNkI0VHVteERYS1ArSTZa?=
 =?utf-8?B?M2VHQ2hnUWpNaXBLYlZiRFI2L1B3SHo0eHVERWh1dHNhZnRUNFhaMXBOVlJI?=
 =?utf-8?B?Z1g4bWdvWGIwS1dac25LaWFhZWs4WCs5QU5NM28wbUtWejNVZTk3OGJLN0du?=
 =?utf-8?B?L2lzYmgyTWJZZkRGdjhFV3lBZXRsdERqcno5RkZ2ZVdJNFVBZVlwbTZUNmtK?=
 =?utf-8?B?azloTVNXN2VGSDBKaGJNcGNzTTVoRUxRdWlkUU9ESVZhSUVpVFh2bGVFdm9v?=
 =?utf-8?B?T0xyZy82WWdOTFNhTmpsalJvb1FTb3JlUzlOUFhkZUZtVzFYWnhSZlVmMzNN?=
 =?utf-8?B?dU1aSTZVZEFZTVRaMG05RTJGeFcxQk00V1VjVEo4R1FDZkx0MUs3QjNrdFlG?=
 =?utf-8?B?VldOUjZaeU9DNGdZT0Q0VU5IZjRJbVowVlA0WnY5UE92dUhNbE1wek1RRG9C?=
 =?utf-8?B?eEV4M253dkJobHR5OW5EQ1lpSnJYdG5DQ3dXZGFHZW1YY0NMZjQ4dU0zTzlt?=
 =?utf-8?B?OHZNa3drOXlFL0hqZjZlZG5acmFBY1hTUTFQT2VycU1LbGFSMkVQK1pYQ1k0?=
 =?utf-8?B?Y29TWno2MzVXZTEvRjdhT2t3dHlZWEREZEV2ZDZxVXdyU1J0S1dCQT09?=
X-Exchange-RoutingPolicyChecked: jpf7/RbcbJLPcbvkav0LFsP76wwOtMDJnCY+0SlzCY/LK9dljpgOUydw4CRlXeoBLe+g+KQ/yWMJJJLw0Za/SdsGqfrmAZFjFxMiNntH6tumcQt9w5meGVhJl+5G5oubnB5ZZ+z4683QBEHSysWfSChdOtB0j0doZWFjBkF60eG9RJqL3sdlJHMl5brnIZqKFOrbxbUhw4BDD9OPs/zut4YZYY6/EzNTEH6ZnnCKwCTR+ByH/DCcLBAgzdRTvmSttbep14na3SQpJKbVaTu0BCfaxn1ej822fnK64aIQQ8sb/XcWRTKhEL3VjC7lEZv3f1dfDpswv/eGFpIVxPbVkg==
X-MS-Exchange-CrossTenant-Network-Message-Id: af5e1365-667a-43b4-f449-08de7f7dbdd0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 14:51:56.6990 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sfsv9EuNHuk4Rl15lB56fpyEyfYQdprDRp8pgeYo5ICNxletrPTWVt0xLlezrit9WkqB35hk6KQPW7/SV87RTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5765
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



On 3/10/2026 6:32 PM, Mallesh, Koujalagi wrote:
> 
> On 02-03-2026 03:52 pm, Riana Tauro wrote:
>> Add response structures for SoC Internal errors.
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_ras_types.h | 134 ++++++++++++++++++++++++++++++
>>   1 file changed, 134 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/ 
>> xe_ras_types.h
>> index 221d07efd84c..466db9f47127 100644
>> --- a/drivers/gpu/drm/xe/xe_ras_types.h
>> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
>> @@ -145,4 +145,138 @@ struct xe_ras_compute_error {
>>       u32 spare_log3;
>>   } __packed;
> Add hardware component glossary to more understanding.

Sorry didn't get this.

>> +/**
>> + * struct xe_ras_soc_error_source - Source of SOC error
>> + */
>> +struct xe_ras_soc_error_source {
>> +    /** @csc: CSC error */
>> +    u32 csc:1;
>> +    /** @soc: SOC error */
>> +    u32 soc:1;
>> +    /** @reserved: Reserved for future use */
>> +    u32 reserved:30;
>> +} __packed;
>> +
>> +/**
>> + * struct xe_ras_soc_error - SOC error details
>> + */
>> +struct xe_ras_soc_error {
>> +    /** @error_source: Error Source */
>> +    struct xe_ras_soc_error_source error_source;
>> +    /** @additional_details: Additional details */
>> +    u32 additional_details[15];
> Use Macro

This is remaining part of existing macro

+#define XE_RAS_MAX_ERROR_DETAILS	16

This is not used across files and adding a macro
for every array creates unnecessary defines for a single
file. If we explicitly change or use this array
we can add it.

>> +} __packed;
>> +
>> +/**
>> + * struct xe_ras_csc_error - CSC error details
>> + */
>> +struct xe_ras_csc_error {
>> +    /** @hec_uncorr_err_status: CSC error */
>> +    u32 hec_uncorr_err_status;
>> +    /** @hec_uncorr_fw_err_dw0: CSC f/w error */
>> +    u32 hec_uncorr_fw_err_dw0;
>> +} __packed;
>> +
>> +/**
>> + * struct xe_ras_ieh_error - SoC IEH error details
>> + */
>> +struct xe_ras_ieh_error {
>> +    /** @ieh_instance: IEH instance */
>> +    u32 ieh_instance:2;
>> +    /** @reserved: Reserved for future use */
>> +    u32 reserved:30;
>> +    union {
>> +        /** @global_error_status: Global error status */
>> +        u32 global_error_status;
>> +        /** @error_sources_ieh0: Error sources for IEH0 */
>> +        struct {
>> +            /** @psf0_psf1_npk: PSF0, PSF1, NPK */
>> +            u32 psf0_psf1_npk:1;
>> +            /** @punit: PUNIT */
>> +            u32 punit:1;
>> +            /** @reserved_2: Reserved */
>> +            u32 reserved_2:1;
>> +            /** @oobmsm: OOBMSM */
>> +            u32 oobmsm:1;
>> +            /** @i2c: I2C */
>> +            u32 i2c:1;
>> +            /** @pciess_gpma: PCIESS GPMA */
>> +            u32 pciess_gpma:1;
>> +            /** @lpioss_pma: LPIOSS PMA */
>> +            u32 lpioss_pma:1;
>> +            /** @fabss0_pma: FabSS0 PMA */
>> +            u32 fabss0_pma:1;
>> +            /** @fabss1_pma: FabSS1 PMA */
>> +            u32 fabss1_pma:1;
>> +            /** @reserved_9: Reserved */
>> +            u32 reserved_9:1;
>> +            /** @reserved_10: Reserved */
>> +            u32 reserved_10:1;
>> +            /** @reserved_11: Reserved */
>> +            u32 reserved_11:1;
>> +            /** @reserved_12: Reserved */
>> +            u32 reserved_12:1;
>> +            /** @reserved_13: Reserved */
>> +            u32 reserved_13:1;
>> +            /** @memss_ieh1: MEMSS -> IEH1 */
>> +            u32 memss_ieh1:1;
>> +            /** @memss_ieh2: MEMSS -> IEH2 */
>> +            u32 memss_ieh2:1;
>> +            /** @saf0_mhb0: SAF0 MHB0 */
>> +            u32 saf0_mhb0:1;
>> +            /** @saf0_mhb1: SAF0 MHB1 */
>> +            u32 saf0_mhb1:1;
>> +             /** @saf0_mhb2: SAF0 MHB2 */
> Please remove space

Thanks. Will remove it.

>> +            u32 saf0_mhb2:1;
>> +            /** @saf0_mhb3: SAF0 MHB3 */
>> +            u32 saf0_mhb3:1;
>> +            /** @saf0_mhb4: SAF0 MHB4 */
>> +            u32 saf0_mhb4:1;
>> +            /** @saf0_mhb5: SAF0 MHB5 */
>> +            u32 saf0_mhb5:1;
>> +            /** @saf0_mhb6: SAF0 MHB6 */
>> +            u32 saf0_mhb6:1;
>> +            /** @saf0_mhb7: SAF0 MHB7 */
>> +            u32 saf0_mhb7:1;
>> +            /** @saf1_mhb0: SAF1 MHB0 */
>> +            u32 saf1_mhb0:1;
>> +            /** @saf1_mhb1: SAF1 MHB1 */
>> +            u32 saf1_mhb1:1;
>> +            /** @saf1_mhb2: SAF1 MHB2 */
>> +            u32 saf1_mhb2:1;
>> +            /** @saf1_mhb3: SAF1 MHB3 */
>> +            u32 saf1_mhb3:1;
>> +            /** @saf1_mhb4: SAF1 MHB4 */
>> +            u32 saf1_mhb4:1;
>> +            /** @saf1_mhb5: SAF1 MHB5 */
>> +            u32 saf1_mhb5:1;
>> +            /** @saf1_mhb6: SAF1 MHB6 */
>> +            u32 saf1_mhb6:1;
>> +            /** @saf1_mhb7: SAF1 MHB7 */
>> +            u32 saf1_mhb7:1;
>> +        } error_sources_ieh0;
>> +    };
>> +
>> +    /** @lerr_status_ieh0: Local error status of IEH0 */
>> +    struct {
>> +        /** @reserved_0: Reserved for future use */
>> +        u32 reserved_0:1;
>> +        /** @psf0: PSF0 */
>> +        u32 psf0:1;
>> +        /** @psf1: PSF1 */
>> +        u32 psf1:1;
>> +        /** @reserved_26: Reserved */
>> +        u32 reserved_26:26;
> Reserved bit 3_28 right?, need to change name

Will just rename it to reserved 0,1,2 instead of bits

>> +        /** @npk: NPK */
>> +        u32 npk:1;
>> +        /** @reserved_30: Reserved */
>> +        u32 reserved_30:2;
> Reserved bit 30_31 right?
>> +    } lerr_status_ieh0;
>> +
>> +    /** @gerr_mask: Global error mask */
>> +    u32 gerr_mask;
>> +    /** @additional_info: Additional information */
>> +    u32 additional_info[10];
> 
> ditto above

Replied above

Thanks
Riana

> 
> Thanks
> 
> -/Mallesh
> 
>> +} __packed;
>> +
>>   #endif

