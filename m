Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4680D111B6
	for <intel-xe@archiver.kernel.org>; Wed, 26 Nov 2025 22:59:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93B5A10E726;
	Wed, 26 Nov 2025 22:59:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d+HGpDPh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26A7E10E724
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Nov 2025 22:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764197948; x=1795733948;
 h=message-id:date:from:subject:to:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=lCKi5YugMC8m4Zd4qugc5jitJyvQS+I+fFg6HsQL6rs=;
 b=d+HGpDPhlvU2D6LRCHCg6JrWp8qKXSOdgM7i9k1O8C9rsDEfKDiKcUmG
 OBGX2Mn5OczOVllwa634RwF6j5JBHDILONCf8dFAO6POU2ldzDsNcrBLr
 6m3trv9YC8C9dexiw8depN0rXank0tGj8iRyS6GiHFSjlPnic5YSdvt+e
 QcIAW/9u/Zl7JRdYp93PIjzjlh2MYT6+koDuH27CJq8mNUM3jdnB0Rrex
 iVzairRNrh+HFSme5wc5SAyQ7SSSpkmXXwrZAblJ1tTUtQkXvxQS7P3BC
 nN0vopMSztAq98hxiAJvfq3WUck2eJxWzxRCUwhXQmMGtCBafFu5USDKs A==;
X-CSE-ConnectionGUID: +e6j34PQT/GZj3x52vcKTw==
X-CSE-MsgGUID: 0KJB1RrwRTG3OyTR/zUDkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="70105854"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; d="scan'208";a="70105854"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 14:59:07 -0800
X-CSE-ConnectionGUID: bJh9wOaDSlurO4f8/qtHJA==
X-CSE-MsgGUID: Ylkn27dIQ+yc8s4hXtt/Vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; d="scan'208";a="193874132"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 14:59:08 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 26 Nov 2025 14:59:07 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 26 Nov 2025 14:59:07 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.49) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 26 Nov 2025 14:59:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o/FhsDmKCDK6xM8J11i2A14yNuv166fyW2u24R9c28lRvWu3bPouYdHgVoE9FDyHYLtjHqyBZDItIdJ0dHr4D1/gZTUClEQoBQqP7LSDFlkDTuFVscoCMsYoFQqAbMUWnoMDbogDIhmMnb5lkLTABkMl15SwGxYzDLfOdFfzW3XZ2SBPlc81GvgUHdB13JQLcp11ZIMr0J4fIjaQTV6zrS8acLzikrwMXvlJjFLLu0qzJtK9dnd8kDqcIQYwlGF2TxxMtho8k33jLSO1Gww3ati7thvlUgN25PbMkRWsD9kK8dc3Z0VkpBCq5cetAnE0bgqDsbOVW1mbCpqfSMPD8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NyY537ZHA+mc+pTg2I0tJ9sa4G4U+KuddTEaoUxiewE=;
 b=xHvhKm4pbdmMmyAsUTJ4uupyt5QfK6SgY2ipw2hrvomYva1d07vywq0Yhj37vnpP/og2w0eZRRKUFCzmmPa5VRufeD0OeGnA7wD4twQgHfZmRoIbMg1W5QIzegZudSyiz9QHVAe+0zp7QEBTpoBX8KZQdduZw3Dv2FZ2LJiXtEHziqd/m6xfndvOk6biEjexDcVVjgpvC6++BrEqD7Gzv0BCXdA4Yi2mUQtqrpa8TbwQzIEoaHn4SlCQRhBk3yGe4/hbiMbimV+aAwjyu+cGFKsS61M4RdcFFMo2HM87YVn54ZLui1ZKqsNwyorYALQ7n4aLFWwyjoAZJWzMvRNiEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by BL1PR11MB5238.namprd11.prod.outlook.com (2603:10b6:208:313::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.11; Wed, 26 Nov
 2025 22:59:05 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%5]) with mapi id 15.20.9343.016; Wed, 26 Nov 2025
 22:59:05 +0000
Message-ID: <c4a3958b-7f0c-4e38-ae56-e658ac286344@intel.com>
Date: Wed, 26 Nov 2025 17:59:02 -0500
User-Agent: Mozilla Thunderbird
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
Subject: Re: [PATCH v7 5/6] drm/xe/guc: Only add GuC crash dump if available
To: Julia Filipchuk <julia.filipchuk@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20250828174159.1232994-1-zhanjun.dong@intel.com>
 <20250828174159.1232994-6-zhanjun.dong@intel.com>
 <48e7b91f-d340-49bd-8b7a-e4d05185e1f1@intel.com>
Content-Language: en-US
In-Reply-To: <48e7b91f-d340-49bd-8b7a-e4d05185e1f1@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0290.namprd04.prod.outlook.com
 (2603:10b6:303:89::25) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|BL1PR11MB5238:EE_
X-MS-Office365-Filtering-Correlation-Id: 26d0d929-f3e4-4e8a-8fff-08de2d3f65ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RjdDVFNibjl2eXBxdkRnYlFYZjhMYVMyemVsZ2N0NEJ2T3E2cW9ROEQxZ2Yy?=
 =?utf-8?B?c3BxNTYyTk1QQzVDUTFad0ZrVW5JN2VXbGhrQmhHaTkzb29KUHc2TkN3R2RM?=
 =?utf-8?B?QURXVlBKb2IvTC9QUlFiUldzSDc0UjVWOTBUeGltdEpsdHZ0cWU2eHlIUUxl?=
 =?utf-8?B?U2kzdXd6a2hNK0paT0FuRTZmNThmL05NMW1vNDlEbUQ2MmJKQ0EwZUYxbTBS?=
 =?utf-8?B?QVYrckh3SkZtZ0NEaDNnWEZxMkE3VVJGbVJNdnk0c2tCczA4YWxhamMwb1R1?=
 =?utf-8?B?bXFmaEJjU3duM2VqNkE0S2NreFpaVnFLbGFVbWxMeHlGMTkzVjJETWRXNzVp?=
 =?utf-8?B?SVNYZXN4dTVZakpieERTcDhrTGNqdHQvb29pWUd2dDB2Wnd5N2Fzb2tuN3hB?=
 =?utf-8?B?QktSRFo5U1RNRFY0NldUNE81MXVNclRjRENZaW5HdkNROXJ2Smk3OXMybWpO?=
 =?utf-8?B?Y05lNUhFc08rRkthdUsrZkdyWCtXekFNYk1VREo4WnpoekFrOGRreEx4TlJL?=
 =?utf-8?B?S29nYnRFOTNEdWYvVFdyeThrQ1RQOG1aUG9IRFJmU1Rvb1NhZ1E4TjlHVmZp?=
 =?utf-8?B?MEpBaEhWRkhqN0p4SGdEaVdFSFhMTFBaT2pLS0tJV21GZklxNDdhTXViNGs0?=
 =?utf-8?B?TVdwTm93enNMazZRUFI0bzNHM2FJVUJrNEhPNnRKdkVJZnVyUHo3TFlCaFp6?=
 =?utf-8?B?S1JacHhvSjZqVjdFQ0Jyd2MybUl3NThTVkdSV1dzVUtXMHRTSk5majZUVEs0?=
 =?utf-8?B?Y3ZYcmVodEJpd3JiREEyRXhmdDNzVUo3YWtlRFYvR3l6QTlFNFNKUDNvV205?=
 =?utf-8?B?U0NxNytVYytNRzU2RGpPWDRkSjlhME1mV1g3M1dLdHRDRk81VVYzVE9nWm93?=
 =?utf-8?B?VGRjalROdW5NY2hYS2kwSWZCWVNlTndzcjdKWW9tU1c5QVdtdVJRTnZOWHhB?=
 =?utf-8?B?MWVXZDlJMktaSFlMalFERk5sVytlWWRSODlQQ0dRYTZWYjBpM1pmVHVGS0pV?=
 =?utf-8?B?d2ZPcVN3dkdkYVVYOTd0YmZYQlpHeUxWYlMwMHlReTFlSUJJeS80M0tNeHo1?=
 =?utf-8?B?V0pPL0tVV09zQnRRN1JydzFyNXRPN2RFaEhxYWJZVGFIYUNGN2d4bHRtejNY?=
 =?utf-8?B?MGFoTVA1Qm9MVWp3bjZXSVpuTU9mbXg4V2pEREF0cjBaRlJyaGNGcTJOU0pq?=
 =?utf-8?B?bVJJTjNxNzZXSk1uRW1zSXVsWVJVNXJVR0FONnFQUUpWWCt6Rkc4bUh4dWho?=
 =?utf-8?B?cFA4MVVxQ08xL3lNNkx6cGtlRU5XNTFqT1ZZRlZHdWRKdWlDZEJCdEsyeU11?=
 =?utf-8?B?cllKUGJZSU50QlNzbHRXdnZhaXJyMmd3MDd0bXhoZEtHVERaak5rQ2VmQ2xD?=
 =?utf-8?B?RzRHTU9xYTFlTWQ0Nlg3N1FpRnNOb1JSUE1TMHNlb0Vob2IzMERsRTFqWnYr?=
 =?utf-8?B?Z3lCVkQyV3oxbEViV2xtVmIrcXBzdzVObUx3QnVQZnBSUklFNks5cVdIVldB?=
 =?utf-8?B?cHNqZUh4dUxuYjFyajNhVnlHZVBXK2FBRE9OOElyNUZhKzFHNEZJU0Y0UFla?=
 =?utf-8?B?ZEdySGxZbWN4Ylc1cHo5WnpxdXRXRnNTdkU4NWVaUEQyNWlZUlJKaDRoZnQ5?=
 =?utf-8?B?SXl1TmpKeG5TUzhaRGVqWWVSMytPRjU1Y21NaERzVjcwcENhMnYwUkZCamtP?=
 =?utf-8?B?QkRjd3BjOEFCQUJWSGVJcktyRjlaMTBHREt0bHJTVDJWa3FyVFF0U0laRDQ2?=
 =?utf-8?B?ZTE2RWRMRTlmbXRqNTFWSmUxTVEvNWlCNTdvd1lKcTdiaXIzVUZZc001SjJp?=
 =?utf-8?B?NDVHN3h2aG5rTzdHbWdJZ3plK3J1ODRWSXVuSjVZaFUrZEcycDY1YkswSlZJ?=
 =?utf-8?B?S2dFUjhLcjIrOVdVejNraktIQlhaRU1XeG5HTDV6RXpiK3h6TkdXMUFxZ3lu?=
 =?utf-8?Q?FIXYf/4gnPjqFRvuFDpcT0CYlFs4m77k?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dzZRTWN3eDk4VEgvZUJJNjA3WDdSR3E1aXVYMHhJTGJmK0VUZlFOempscjZk?=
 =?utf-8?B?eWoraVExdTNwZWJDYVFZMjZqOUZHWU5tcWhyRnNWVHdtVm8rb1RqWGVGTXhP?=
 =?utf-8?B?Q1dMNGxXS2tvamswQTBucFB3d0M1N2hwZlpCZWN5Y3dsUHJzVW5QY0YzajIz?=
 =?utf-8?B?YkxnQ3FMbSs0eGFyOXgzWUlIYlBER2JNdHhIeFRHMmJYZU92MTBleUFnT1VR?=
 =?utf-8?B?NGFjN3MzelE2UkZ2Vm1Ja0s2YXB1SDcySnE3TTFwZTl0OGJzSjQvRitEMmhn?=
 =?utf-8?B?cE5PU0xEQlN2ZFoxWFVCMVh0V3FwbjdNQlZOV01EeGVoRSs1eEpUcy9ZVUYx?=
 =?utf-8?B?dUkrMGF3NEprdWtTY3U4NnFjVkFCME8wU0lLUENrL292cGs0ZVZNTkJkVXVV?=
 =?utf-8?B?Y1c3WE9QbUg2NkpQM2N5aVRQcFRWaTUzSldTdXRUMFFZN0xYUXloUnIydmQ4?=
 =?utf-8?B?SXBwUjBoZmlsNWN6eEVlc3kremsrTVRTR1ZXZzVjODVYdkNraTY5MHpGcTRI?=
 =?utf-8?B?aFZQeXlHY093OXROTUwydjBFa2p4NEdQR21XODJselNXWEVicE1FQ3pEMVZ3?=
 =?utf-8?B?VEh3ZFJGcHV3cW1DNS91cno1MCtUdWxyRzgzNzhrb29vZnRGWnd2RE9nbXFL?=
 =?utf-8?B?QUY4bUJsMFh2Q1dnK1E5UHJZa2Y3ejlmNFpPY09VNjBUSmZFcmViVFpHRXFh?=
 =?utf-8?B?NlVZRDVrN1FVT1R4VmdLNTBCYXY4akhsUHJXd1FkUjh4eTR2QllsZzNIZWY1?=
 =?utf-8?B?V1FtNVVBQ1ZETFpFdEQrMUNqdGlBZG11K1RKVXJsTkxHNHpqeHJFMS9QVGh3?=
 =?utf-8?B?V0s4cWtYTzFQSURFUzAwSjV1VHgwczhnZFhNc1g5MU9iM1h6dzd1L2hLZXlS?=
 =?utf-8?B?R29tbGZDRTh4azZBRXJEN212Y3pIVHI1UFhaTmxzWTlBOEpzTUdkbkRMNGIy?=
 =?utf-8?B?Y2xyRHFudDA2bmFiY0FsRFNZZTY3Mk5yaWZVejdSWHdFOWxiUStTb0FMbks3?=
 =?utf-8?B?RFVlVmd4Q1pkTDVxdWxCOVNsbHdGaVRrWFB4RjByVDdOblNvRDRQZGxVYnhv?=
 =?utf-8?B?OWx1NWlkamxPV0xaR3cvdzdENm8zUDhzOEMycDVrS3IyYUZNcmczeFF4TDFF?=
 =?utf-8?B?MEpBTWZ5Uk1vR2dLakMzNGdaSUNDZkZIa3YxTGRXRUZhTTdvMHFpejVnMno5?=
 =?utf-8?B?RlpSWG9tTDBUb00vaXBkT2RBUDh5MndrUm5oV0ZnUE84TFF3OC9XN25maG1F?=
 =?utf-8?B?QmF6YnFkby9WT0Z6TUsxWXNlemJCT2R3S2Z1c1N1Lzg0UXVaVWxhWHh0ODFB?=
 =?utf-8?B?WVl6MnB3VHRpUVN1NVNYcGVadUlOK0ZlTWRNYlI2cVFzTlZwdXg1VHdoTDZq?=
 =?utf-8?B?UUY5dmE3MFNqbGxrNkpQTWxCdGhVeE9HWmxwM3lVS3hUK1lsWGx2eGpha2V4?=
 =?utf-8?B?clJOcXFVd21temlwYXFVeE9JMEt6aEFsZnZPeStwQjBWUU5rN3gwSzUxZ2hj?=
 =?utf-8?B?SzFFWnZEWldBbUVWM090VzNveDZtaTNmeUtVWVpmelFicE80aWJRTitUemRP?=
 =?utf-8?B?MEl3blVOUmg1VGJtK3NsYkZkRWRsVUdJVVJWZUZ3VENjSjlxOFNKZk0xRVd6?=
 =?utf-8?B?WG8vbUMyNEowdlczanlVaTNib2VxTGErTExOVnkyWlk0UnY2TFdrUS9tbUFC?=
 =?utf-8?B?QVcxUk9wRzFkNmRsYS9YTUdlOWcvYWtwODFJakthSmdUMnJ5VCtNWnZsdk9I?=
 =?utf-8?B?bkJDVTlOclplMGxxNG9kOE42ZUxtMzlWWUJOQVlkZy9ZRHMxK2NnVFl4KzhS?=
 =?utf-8?B?YW1tTkt1bXJoME9TMjM4YkpkaGo2aVZQUTQ5ZHJXTzZraXllejNqNHdUcGtP?=
 =?utf-8?B?dHprdFlOMWlPenE3elNtT2hqeE4yMXhHTVFwUkRKL1A4UUFqczdzamJucmdG?=
 =?utf-8?B?dmlyM1FaUzZZRlNPalN4Sk9sbVRnVzRKREFwQXpxU0dUNUgvdk5nWG9kYnVW?=
 =?utf-8?B?b2NVRC9keWNNb24yK2lVTDZUczlKQjhuNFk4U1JEQ2RaMVZYcjV4MmdBSzdP?=
 =?utf-8?B?SmJsMnlRaVBRVnBiMVgzNU5oNWk3L0dxYitST1hmbFh4S3oxRG5mSFlLallo?=
 =?utf-8?B?YTJPVWFVcXNzSGxqam4zL1FLamd6bm9MOVhzYllhTWhiQ21LZW1tU0hhS0NC?=
 =?utf-8?B?b1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 26d0d929-f3e4-4e8a-8fff-08de2d3f65ff
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 22:59:05.2301 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k54ljKCvTSXsqFAwsdMCqcj7dPYgpeVeNsaF2AHlZnwZJx098ugrQT+/31qNW92hSaEAcIJxUWcfKixoNy+z1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5238
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



On 2025-10-20 7:11 p.m., Julia Filipchuk wrote:
> Some questions on this patch.
> 
> 
>> +static int
>> +xe_guc_log_add_crash_dump(struct drm_printer *p, struct xe_guc_log_snapshot *snapshot,
>> +			  struct guc_lic_save *config)
> 
> Is this return value just here because of convention?
>> +	/* Check if crash dump section are all zero */
>> +	from = entry->offset;
>> +	to = entry->offset + entry->buf_size;
>> +	chunk_from = from % GUC_LOG_CHUNK_SIZE;
>> +	chunk_id = from / GUC_LOG_CHUNK_SIZE;
>> +	buf32 = snapshot->copy[chunk_id] + chunk_from;
>> +	for (i = 0; i < entry->buf_size / sizeof(u32); i++)
>> +		if (buf32[i])
>> +			break;
> 
> This check looks incorrect.
> 
> buf32 is looking at a max GUC_LOG_CHUNK_SIZE chunk but here is checked against
> full `entry->buf_size`.
> 
> Is it a simplification to check if only the first chunk is zero?
There is a story behind: In v6 review, John raised the concern of the 
crash dump is very small, only in 8K, 12K or 16K. That's why we use this 
simplified code.
> 
> 
> 
>> +
>> +	/* Buffer has non-zero data? */
>> +	if (i < entry->buf_size / sizeof(u32)) {
>> +		struct guc_lfd_data lfd;
>> +
>> +		size = xe_guc_log_add_lfd_header(&lfd);
>> +		lfd.header |= FIELD_PREP(GUC_LFD_DATA_HEADER_MASK_TYPE, GUC_LFD_TYPE_FW_CRASH_DUMP);
>> +		/* Calculate data length */
>> +		lfd.data_count = DIV_ROUND_UP(entry->buf_size, sizeof(u32));
>> +		/* Output GUC_LFD_TYPE_FW_CRASH_DUMP header */
>> +		lfd_output_binary(p, (char *)&lfd, size);
>> +
>> +		/* rd/wr ptr is not used for crash dump */
>> +		xe_guc_log_print_chunks(p, snapshot, from, to);
>> +	}
>> +	return size;
> Should this size be additionally incremented by length of printed data?
The size is the actual data size used in buffer, data output by 
lfd_output_binary do not use buffer, that's why not add up.

Regards,
Zhanjun Dong
> 
> 

