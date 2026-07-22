Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 823ECC44536
	for <intel-xe@archiver.kernel.org>; Wed, 22 Jul 2026 11:51:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4091710E3E2;
	Wed, 22 Jul 2026 11:51:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gFXWiUpJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8B3610E292;
 Wed, 22 Jul 2026 11:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784721078; x=1816257078;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=bQVmpdUKswoVG1k0WssFHC04wwXQyXdKCYkQgfishos=;
 b=gFXWiUpJNNKVC14mSctS1+LyJFfcxNcgFmpmvcTx84hdS37wjfLDy7T5
 rrGaa/rE04eTiHkbgQB7i7qRPvAXidgnmGqF/L6v7GSN10bvINYl7XMGJ
 VGJUkksFRsSv1ls47GPaKqfLXj310VmeGOfFo/dgdqUXyBHbodaCxYDwx
 Jrz1TrldAD+bqjEwDbYErJ3xu177dp8NNXRYQRdlFz8ujOHMn5LWcp7YG
 nX5blSH+jC9oBQpRVjBuiUTK9JXL+HtgybGqBuwPv276jUE0cRfD/Tf+2
 vDX6aqsHT5ORkW8OsT7E8ZENyLViqcotyjOjlo2GmwbwSzJ3RCFOg5HGz A==;
X-CSE-ConnectionGUID: b0BpYR8dSU+o3JdNp3Yc7A==
X-CSE-MsgGUID: 9eKlomjSQrifmgub7DXJXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="89246048"
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; d="scan'208";a="89246048"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2026 04:51:18 -0700
X-CSE-ConnectionGUID: 03mmRo08QmaQmyLAxw6BiQ==
X-CSE-MsgGUID: Gq4EOag5T2ibyX47N6q/7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; d="scan'208";a="256829048"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2026 04:51:17 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 22 Jul 2026 04:51:17 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 22 Jul 2026 04:51:17 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.10) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 22 Jul 2026 04:51:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FdZdfSM/PaCxf4PgVbG5IpLTWhN0tllfngo2YIfjHU0bWWW5CZXtT1y5NmyDtMZYv8dA/FYqiQzlX2qiMZDHtIltYT0wm1Z10FttaPup8Olwv1+z5LZZHswvmRl0oorPx9fGLl87FcIp+9drly0AxrHh2sPq8Een4oCyi7GArFIF82nZLT+aJTDuPncgOnjlk4JbwuYzs1n7tspkgyts2vmcrwLtrG+QNJY+CTxS5JiAj0hihtP4ErlfPJQ74nTshHQPl9huqcU+fsIdUdKvmLVZObovjqmGxCjGi0yi0ZIefwlWZKW9dJb8EcYOpEhPI7TCEL9E1IB8zRKYj+0sbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3RjVtzZP3/1fJLZ5Q244shOynzr/cB96YXlXTYZsjTc=;
 b=MGGaXC2sqoP9U/kMSipmz8T1N4EwlLAq7I7779Lt0Mr6xoIK4p6kY+f8Df+4VimTRynfJ3BGG0ucvj/uDA9Gm/JGvlZtwEnbOgbcoPKJWouBHnqf8PgnUbdYNODZxnKp/amyxSrYxsFYSLlyy/ExEfptc8COsVNbcox7zNaGCs2rVSigPHNGIrSdDbtdmdQLjNx18rt0Fl44413Wff6qejfbKW9/3eXV6UiZIm/uJbSmHGBeQ1Hm4jCATE+h9h1jh+Yj2WhHlxq/mI6Ri3o07Rv3V+t/ALEF+XqymwRtH6d3Y3xlbeUe5Q9gseUWUWWH0t60nc6HswtTmZqK4BvShg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7636.namprd11.prod.outlook.com (2603:10b6:510:26f::13)
 by SN7PR11MB6702.namprd11.prod.outlook.com (2603:10b6:806:269::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 11:51:14 +0000
Received: from PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b]) by PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b%5]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 11:51:14 +0000
Message-ID: <1694b25b-4b2c-4b35-874b-1347754814e7@intel.com>
Date: Wed, 22 Jul 2026 17:21:07 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/i915/dp:
 s/intel_dp_needs_vsc_sdp/intel_dp_needs_vsc_colorimetry
To: "Samala, Pranay" <pranay.samala@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20260709113951.3557968-1-chaitanya.kumar.borah@intel.com>
 <20260709113951.3557968-2-chaitanya.kumar.borah@intel.com>
 <PH7PR11MB605359AFC82D07B1ED71C782E7C72@PH7PR11MB6053.namprd11.prod.outlook.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <PH7PR11MB605359AFC82D07B1ED71C782E7C72@PH7PR11MB6053.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0065.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b3::7) To PH0PR11MB7636.namprd11.prod.outlook.com
 (2603:10b6:510:26f::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7636:EE_|SN7PR11MB6702:EE_
X-MS-Office365-Filtering-Correlation-Id: b90cbfb6-58d5-4320-c6d9-08dee7e787d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|11063799006|4143699003|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: zF0QW3f2aS9fgJ7ddl+WJwFxOAMZeLxex01m5CZyfrpL7Qi7k6gkh3V8mXZYvTEiiXDeF7xy5koSRZNieYQS30uFQGOAxGMddkJ03K8p63UoHmrVgfryXaHLq3b9hfJlEaqYnYRiaHNrc7PxF9M+obB6HA0iW/Zfy+W2iH8LNRtOH73NTfKKqibUxm2zExNvfMXYvUa2VJpj4w/d8QB/mpHHa9cZhsrSFIDchhRu7ZHC432S1/Oy5zTSBqxWDYSScPLLv7RyzvKhpgXtsQ1NgocpgrycCveZOTkpiJiZ/YIpEqTEgoapiYaO0ic7C7SR2KWLzHwClBNKn3NieD9S5ntK3iF21g3p6vDpDWmvQC1bqV9TfaCDdmAtfJJ98Xuh8y6AuEAC57syctkxge0OShQNaNnw0gTUFJ8O0tpVJrpfzROWO4ZCpEn85JZO07Jl/rXJVDkfS7UAWj/TcLF2cILOr0YN2RRLaJhQbE+9OF07I0OgPMJ8JACy1UL4beVqiaYL3zCVQSYjkoLQ2R7LW8DjvxNHzs9hIPu1mWyKgTvij7CaWeKQXjkBbsWTbRayOcoM38o9t91RpoNunLe/ZGLc8rQR+tNZLTvqYGN6013jh5dd+WF/L6VWczzyW5QbhiTe79awKBzIrI/lonV6k8Kvy8JwfrH0gi8+226M0YU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7636.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(11063799006)(4143699003)(10067099003)(56012099006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M3F6UUZaMFYxRVlCVndERWptRU5Mc01HSkVvZVhNbGlmci93SnpOZklqV3pG?=
 =?utf-8?B?QkROWHdJREFUaFFDa1NzOTkrNjFwYlJHQmp3dmZPdllIYjM5YU9Ldi9WZ0da?=
 =?utf-8?B?N2RUWUcva0h4azRMZHM2elliTzVDT0IzMTZ4RjRrYzcySDJyUEtSdzZmWVV5?=
 =?utf-8?B?b09maWoxSlJqai9JTXJyMUVCV0RrTFlHNFJvdHNrMUJTdkRpVmFRV1RuT0hJ?=
 =?utf-8?B?ei9wckxYRTBiV3d4QUd3aUxhOE83OC90NDZLVFZRbkNQSEJYL3VyTlB6REE5?=
 =?utf-8?B?YTFnNHF5emVXUGVmbEFVSWptK01nZTYwRkNvcStjVExjWjlqTHg0dC93aUU2?=
 =?utf-8?B?R0pnNkg5TzViMG9OM0hLT0xEZDFRa045cmc3K0EyQnRyVmExU0Zod2FncjNn?=
 =?utf-8?B?eURLUmNqN3JXZC9KYjBPSWhsaXk1ay9PK0FBT0VxeUIySXcwYWJqYlhYN0RP?=
 =?utf-8?B?TzIvTkZaWG9zdjVMRnplbUdkQTB0L0xuWTQvRkdQV20yMTV3OEpaZ2gxeGhZ?=
 =?utf-8?B?NnNHaGtXRnVrR3B2NEx6WjVWUnMvMjNNdDlyclN5WW10U2dzUnNqT28yakZW?=
 =?utf-8?B?MVUvUTFtYVF3Zk80b3FqNExYN3ZZM1U4b25DR21kSGNLUzFvRmZQOTdWUUVJ?=
 =?utf-8?B?RVc1d1dEeFpudGZ5RnhRanc2Ny8wdnZhQ0x2dk5TMW91TlpySjBWZ2tIZ3Q0?=
 =?utf-8?B?WjBwdUlKQWZ0MmZ5TE81aUtJZWticGdwQUhPN3o0cU9BWXZneUFKRDFrSUx2?=
 =?utf-8?B?elNueVRoR1FKL2xlcFJyTkh5ajlXNUV2TllKTCs5R05ZMVVCZlNSbzJwNGNK?=
 =?utf-8?B?N2lISmF1emw1dDlYUFR6c2EyZDdUSE1qKy9XcmVTdWMvTWErckZoYUkyb1Zk?=
 =?utf-8?B?a296UU16YnFDdEtBZDllN0FUM0NBYWVjMWwwZCszTnZxazFPK3ZObkdmOGMx?=
 =?utf-8?B?ZkV3VFR1WWNsYW5kNG5nNnBpTy8wQWN5RGU2YmEzZkpTS25tUlNDSllRSFh4?=
 =?utf-8?B?VHRxWDVpQTZOSzJQSDN1cUZXK01UZlNta3Biby83ZnpzUENueEJwTkswQXo2?=
 =?utf-8?B?S1pnOTI1a0NVd2FMUXdUY1ZJMjMrUDViSlUwaFJQemxmV2FIZG9iNXVtaUdX?=
 =?utf-8?B?cVZja29SVXVwbDk1U3E1WTBNNnNzMWdaNjdRNWx1bjFnSzlwVzdTbWFHM0Fw?=
 =?utf-8?B?USt0YnV5YTdJUVpMRGFuM0RkdlI1NnUrSTFJM29ZaE90bjhYSGwzaHRkUUs3?=
 =?utf-8?B?a3VjOWZFejhVVWxrVVhEV3RZRUN0Nm9OaFVnNnIxNUJTcS9RQUp4LzhPcm1B?=
 =?utf-8?B?UVdyY3d1c1U3RWNyZG0rOUR5djZBVVlPemlRYzZ1MVBBMVdHb0ROU2JMZzd2?=
 =?utf-8?B?akF3R3RQby9BRmV3eEd4bHFLa2V5RGhEdTlZOXYzanUrSWgzNGUzd0ZRdHpI?=
 =?utf-8?B?RFNhdFVwMkc1aExsSit6WS92ZEtYRW5qNW9pMVhVVlR5R2xNcUtpS1NWdm9P?=
 =?utf-8?B?cWNkYm1uZ2hZclJNQkpMelFmczJHM1E0Z0ZTL09mVnV3dFNrb001TTRCckZq?=
 =?utf-8?B?Tkc3bXMycXo1QWJpTHpydmE4eHl6Y3p6MCtuYXNQTlZHR3FQR1hhSjd5M1Fs?=
 =?utf-8?B?U1g0L1owWWpHdkV6T1d0QWsrRm1udU5oZnhzQjNEa0lYQkRLbnQ0T1doc0du?=
 =?utf-8?B?WFFCQTFOVGVXQm4vS09OZStZUTRLTkFTUms5MXRELzZiOU55R3ZWUlhWMTRk?=
 =?utf-8?B?WXNOZXI1eU5wTU00Q0p3bGl0Ky9TUjFYN1ZMM1VDRWlOL0wrbEZyWXB4bkQ4?=
 =?utf-8?B?YzFaYmMzMmtJMUt5eFhzWjJZS3RsNG15Smx4RzVQOHJaUTBpYjBKdGczc0Nl?=
 =?utf-8?B?SzRWL2J2YWNmcm8zN2oxUExyelhRQnZiOE1hWStoNTVnb2lmb3lweSt0Vk9h?=
 =?utf-8?B?bk9KUFZqUGhWbXRqaHNDM3psTzJWMUVXQ29JRFkrd1poUDI3ZHNVd0YwMkNk?=
 =?utf-8?B?enIvM0xBeFQ1YmZIV2dVcndsNUVSUkFuYjE3Y1FjT0RSVnJON2lJZkxUWDly?=
 =?utf-8?B?Zk1UQ1lkQUE0ak5abmxFUWI3SUkrRno2S2NMbUMwcnFPUitxNXp1ZTdsZ3M4?=
 =?utf-8?B?V0kvc2ZKLzZRV2FmN1pHa09CVWF2NE95Z2pRVUlscjJZd1NDai9uWmVLbFkz?=
 =?utf-8?B?VlNlRm5iQXJYUy9aRER1UnBDRU5QNjhvbVFWT09YM2Y0SVVIYUlkZE1FVjVm?=
 =?utf-8?B?QlREQ2h5ZnBTWXZ3bnQ3MDhSd2J4RmZhTC80alZFZDM1Z0NvQ1prQXIwaFU3?=
 =?utf-8?B?Zk1qQWR3UVRNME04amxrVkVFcXluZFI0ZndIZ28xVm1IMnJ0Ry9Md0szWnI3?=
 =?utf-8?Q?hQ86TYqEmiBqeTl0=3D?=
X-Exchange-RoutingPolicyChecked: QidWcMro9y/UC/QkFWdI+UzfYMMHAymsJzmBlJm6x+Q6foS8/5T8diB8X4zvMhN6nx+hSP5qRpKuS3J1MkfOcxhrdWEkpOF8FFRfm63UbFHAacLJJo3rDpg0/WYBtVDmMzJ4hWKC2rvfbEZcuGEXQbD+p57vdQ9Z44BScRuT/WoNn7I4jqhQ/fwnDqD++lmJBpZFtKVK7RLAsL6NHSVU5tZAA45i+XeQQnc5eVklbjrjS4YzPqFE5PdKwqZ4ysieHWkezWWkaXDeBF/m4hNODK4869fDnghGuWemSDmnhJZgMjimQcv0Tve6mbdd9T6nX6atp06XuKQdkiVzpNAZTQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: b90cbfb6-58d5-4320-c6d9-08dee7e787d6
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7636.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 11:51:13.9123 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QM2YQ501hsYBynhvxwMVA5hRylPLio7IkuDpZ5azhLu3pfjPj11Vwf5Zvdd7LaagUSEyT07x6VTxMRGl0opanuQSD7ZypbQxlryn7nWb/Ck=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6702
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



On 7/16/2026 11:03 AM, Samala, Pranay wrote:
> Hi Chaitanya,
> 
>> -----Original Message-----
>> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
>> Chaitanya Kumar Borah
>> Sent: Thursday, July 9, 2026 5:10 PM
>> To: intel-gfx@lists.freedesktop.org; intel-xe@lists.freedesktop.org
>> Cc: Borah, Chaitanya Kumar <chaitanya.kumar.borah@intel.com>
>> Subject: [PATCH 1/2] drm/i915/dp:
>> s/intel_dp_needs_vsc_sdp/intel_dp_needs_vsc_colorimetry
>>
>> The function answers whether a VSC SDP with colorimetry payload is
>> required by the content being displayed. Rename it to reflect that.
>>
> 
> Since this helper also controls VSC signaling for YCbCr420 pixel encoding,
> it would be better to update commit message to indicate that it covers both cases.
> 
> Apart from this, changes LGTM.
> Reviewed-by: Pranay Samala <pranay.samala@intel.com>

pushed to drm-intel-next with commit message change. Thank you for the 
review.

> 
>> No functional change intended.
>>
>> Assisted-by: GitHub_Copilot:claude-sonnet-4.6
>> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
>> ---
>>   drivers/gpu/drm/i915/display/intel_ddi.c | 2 +-
>> drivers/gpu/drm/i915/display/intel_dp.c  | 8 ++++----
>> drivers/gpu/drm/i915/display/intel_dp.h  | 4 ++--
>>   3 files changed, 7 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c
>> b/drivers/gpu/drm/i915/display/intel_ddi.c
>> index 2b7eb010511b..c764472bd69a 100644
>> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
>> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
>> @@ -470,7 +470,7 @@ void intel_ddi_set_dp_msa(const struct
>> intel_crtc_state *crtc_state,
>>   	 * YCBCR 420, HDR BT.2020 signals we should program MSA MISC1
>> fields
>>   	 * which indicate VSC SDP for the Pixel Encoding/Colorimetry Format.
>>   	 */
>> -	if (intel_dp_needs_vsc_sdp(crtc_state, conn_state))
>> +	if (intel_dp_needs_vsc_colorimetry(crtc_state, conn_state))
>>   		temp |= DP_MSA_MISC_COLOR_VSC_SDP;
>>
>>   	intel_de_write(display, TRANS_MSA_MISC(display, cpu_transcoder),
>> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
>> b/drivers/gpu/drm/i915/display/intel_dp.c
>> index ade7e51e7590..93282694c29b 100644
>> --- a/drivers/gpu/drm/i915/display/intel_dp.c
>> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
>> @@ -3164,7 +3164,7 @@ static void intel_dp_compute_vsc_sdp(struct
>> intel_dp *intel_dp,
>>   	struct drm_dp_vsc_sdp *vsc;
>>
>>   	if ((!intel_dp->colorimetry_support ||
>> -	     !intel_dp_needs_vsc_sdp(crtc_state, conn_state)) &&
>> +	     !intel_dp_needs_vsc_colorimetry(crtc_state, conn_state)) &&
>>   	    !crtc_state->has_psr)
>>   		return;
>>
>> @@ -3174,7 +3174,7 @@ static void intel_dp_compute_vsc_sdp(struct
>> intel_dp *intel_dp,
>>   	vsc->sdp_type = DP_SDP_VSC;
>>
>>   	/* Needs colorimetry */
>> -	if (intel_dp_needs_vsc_sdp(crtc_state, conn_state)) {
>> +	if (intel_dp_needs_vsc_colorimetry(crtc_state, conn_state)) {
>>   		intel_dp_compute_vsc_colorimetry(crtc_state, conn_state,
>>   						 vsc);
>>   	} else if (crtc_state->has_panel_replay) { @@ -5100,8 +5100,8 @@
>> static bool intel_dp_get_and_ack_sink_irq_esi_sst(struct intel_dp *intel_dp,
>> u8  }
>>
>>   bool
>> -intel_dp_needs_vsc_sdp(const struct intel_crtc_state *crtc_state,
>> -		       const struct drm_connector_state *conn_state)
>> +intel_dp_needs_vsc_colorimetry(const struct intel_crtc_state *crtc_state,
>> +			       const struct drm_connector_state *conn_state)
>>   {
>>   	/*
>>   	 * As per DP 1.4a spec section 2.2.4.3 [MSA Field for Indication diff --
>> git a/drivers/gpu/drm/i915/display/intel_dp.h
>> b/drivers/gpu/drm/i915/display/intel_dp.h
>> index 02b691df6755..54570aa142f4 100644
>> --- a/drivers/gpu/drm/i915/display/intel_dp.h
>> +++ b/drivers/gpu/drm/i915/display/intel_dp.h
>> @@ -128,8 +128,8 @@ int intel_dp_max_link_data_rate(struct intel_dp
>> *intel_dp,  bool intel_dp_joiner_needs_dsc(struct intel_display *display,
>>   			       int num_joined_pipes);
>>   bool intel_dp_has_joiner(struct intel_dp *intel_dp); -bool
>> intel_dp_needs_vsc_sdp(const struct intel_crtc_state *crtc_state,
>> -			    const struct drm_connector_state *conn_state);
>> +bool intel_dp_needs_vsc_colorimetry(const struct intel_crtc_state
>> *crtc_state,
>> +				    const struct drm_connector_state
>> *conn_state);
>>   void intel_dp_set_infoframes(struct intel_encoder *encoder, bool enable,
>>   			     const struct intel_crtc_state *crtc_state,
>>   			     const struct drm_connector_state *conn_state);
>> --
>> 2.25.1
> 

