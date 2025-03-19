Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0FCEC35FFA
	for <intel-xe@archiver.kernel.org>; Wed, 19 Mar 2025 20:20:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77E5610E0AA;
	Wed, 19 Mar 2025 20:20:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MK95zKVI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F2DC10E0AA
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Mar 2025 20:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742415652; x=1773951652;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=c52RJod0vuA3ZZqfkzomZoZzILTPDAM26ftoc78RnDk=;
 b=MK95zKVIk/Lo47ymbyBlAhNsd9mM43Nv5zfdFQr1pd9Mj2Iqnz/WNF5m
 aJsD2h+DFSahlc7Suf1dtmC30tV+i2NkQzazF0Ru4IknH/o5yhNuPzar7
 ziLdCewo8SEjbbGv+3UOf+nlFHuV1jR5DdNT9HwPGdZkMQFuOKopgJxku
 rOp1N3Tl8GgSELT4nIhuZEVC9jCGOy0LeJ6PG3jWeZJ7HGtTzxIo0MRJh
 zlCIfreyFKOIg1VspdSksDzTAJviu9EtW9OFtKlkR9LQB6rVyAprJ70g0
 rRQKCYaAhKmLu+uh84mJvyfLSAYI0Nl8u0rtxJnki5Kxzttm9K7e/3GFx w==;
X-CSE-ConnectionGUID: 9rs0Z3ZwRZeWiUwB0K0ZFQ==
X-CSE-MsgGUID: XgpKWrdtTzCo+GDt46wXPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11378"; a="55006888"
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; d="scan'208";a="55006888"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2025 13:20:51 -0700
X-CSE-ConnectionGUID: dvLctKytRI+1oEwp8X4fvA==
X-CSE-MsgGUID: 0rkOiIQ3R9etEPlDFLusHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; d="scan'208";a="123254541"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Mar 2025 13:20:51 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 19 Mar 2025 13:20:50 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 19 Mar 2025 13:20:50 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 19 Mar 2025 13:20:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r/rl2mHTfjw3PIDonXVTtX3JgjijAQDPvRD8RvcnoJulmyqjGnR2Ae9EyCmqLyfUfjbHnVQfR6bqMyLT7gOGh7Sjw1DGWFL/WO0vesGtvcaXtBKtpKuB2C/Yse2S4lJglfrYwhfVLlpJMs06CFgSIHEm82yXCpAfxfHFYU9QgwmHctuFvgvI1sGOzv10pAlsJKRCatDvoQZEXiyL9qrZ/Eo/aKZFv70C53tX2YnngoC+XNohSjKF1RuKiEmSXfqheG/4X98hp/2c9yixypqP1BJN1q6AjKfrXGr4MQkundnr0CNpBpNjICiOiMIPxcZr9A3OZPKGgtHVv8eX5MxkDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n/OxyEPLAHvVW721LygLNTQJzTcQ4nyeONdZpZqd19s=;
 b=TnIabWK+s8o1GCMQTXl29S4dUuvzqzKVW9dHasJNfYNdqOSZe3D7zAdygdslj1IcHbde6tj1ylOyOVk0nG76merUfSCmELj/Ulkwp52nCifbrv3qMoKjy03wEwt1heEhySii10nFyIEXLBIJBL1uUReGwqkzZR32SUiiC4t9hUkcCUUEYwPNbIyY2p/kcZ6tbwxD7Cr/bcxMJEQpxfCuZ5SXoymN7UYsiDXJ5NQy60Od//eCpwsO/IBBOMpKDjWTxMPNHE2+qa5SpUUREUxPWyWj3I+9Sg6q3vZy3ip53xPZZzVRiMVAOAfwXuafHY1SNFAzHWBI67v/gWQMYQPcvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by MW4PR11MB6888.namprd11.prod.outlook.com (2603:10b6:303:22d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Wed, 19 Mar
 2025 20:20:44 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%5]) with mapi id 15.20.8534.031; Wed, 19 Mar 2025
 20:20:43 +0000
Message-ID: <76f06baa-59b2-4d6a-87e5-a89a2d94904b@intel.com>
Date: Wed, 19 Mar 2025 13:20:40 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/guc: Disable lite restore for MTL
To: Zhanjun Dong <zhanjun.dong@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Julia Filipchuk <julia.filipchuk@intel.com>
References: <20250319172825.3334036-1-zhanjun.dong@intel.com>
Content-Language: en-US
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20250319172825.3334036-1-zhanjun.dong@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4P220CA0011.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::16) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|MW4PR11MB6888:EE_
X-MS-Office365-Filtering-Correlation-Id: 159619c0-1da9-487e-11b4-08dd6723869b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UlBuUkI5NHphditSNWwrOUd2K0ZNSDlMOGpVZzVxVVhXc0JhTEdpOFRxc3A2?=
 =?utf-8?B?Q3NXRDhnZlcxVTlicnVIaHAyMHV2NHdCQWw0V1ZoN3Q4dW82d2dwN2lCb0Jv?=
 =?utf-8?B?MHcyOHpSRllYTU9oL3NRYzMxaGtYUSsreWlvQ2tXWTI1cVFQUGcwdzM2d3Yy?=
 =?utf-8?B?Wm95dlBBTkJaVmJud0VkUTc2RkdZaVhLUmNmQTBnOVhZaytvYkZLUWt5anpG?=
 =?utf-8?B?Qm41UlZpQnFQOER6bklmS3hYNG92YkFWQTJSWWExQnZJTTM0Z283MkZlb1k2?=
 =?utf-8?B?VmtFdVQ4M0pGdWYxdmJUZy8wR0dodkd6YUVxUUhxRFBpRlhsRUdHcnpseTk1?=
 =?utf-8?B?a3owMUJOS2puTDMwYm9LWVExcGt1enBnMWcxemRFVFgzeDhaUy9XUzB4Z1gz?=
 =?utf-8?B?SndIa3VDbWtpVXpBS3Y0SGUrQ1l0bzgyQ1JvZUVlQ1hFeVFKbVlhZHNFSE5Y?=
 =?utf-8?B?ZC92akpMMjErNlpiclRZZGdSNm56aVd1NlBETmwvNmMxYnIwd0dBL3FmRWhq?=
 =?utf-8?B?VVpnWG81RmM3b2ZhSDZ6dWZVOU0vazJCLzF6WXE2UTN2Z0RkTTdwRGVWeUsx?=
 =?utf-8?B?SlZRSnNlZitmZmtXTjdHdUFIUXRyZ05HQklCUE4xSGN2a2Z2ZmdRUTVJRDQ4?=
 =?utf-8?B?Q3lGd3hDK0J5cnErUDFCVWhQRzJOOSt5NHlLT1h4QVR4dURvYmg4TDlQMHJo?=
 =?utf-8?B?RTEzUGg4QTFhRi83T0ZETzZkOUdvVkg3QjJubnRCMFpFWU5tc08xNURLbTFq?=
 =?utf-8?B?aWgvdGZkdzRHTnR5OUp2VVF5QmZ0bnRhMWVLQWJMQ2FoeTV4WFR4NG03QWtY?=
 =?utf-8?B?MGJ2cGZldTB2MkM2QnIwbXEyVG8vU2FYUTZtdW14YW1TY3pLWVZONmxPN0hS?=
 =?utf-8?B?NUdkWnNoS29TTG9hWjQzenQwMGlES3Rid1EyWEJTR1hta01DYXA1bGZ4dGNN?=
 =?utf-8?B?aGEwSUpub2Y3dk9WbS9peGl0Z2ErbVJDZko0Qmo5SVN2aXArN0RuTTRGSkdM?=
 =?utf-8?B?TUIrY3dxYkNCdzJsTDRFcS9sdFFYbk9VU05MTFBLTEVSb3dxWHNkTGIvTFky?=
 =?utf-8?B?Rm5XZjd4OTBZbmI4ZTh3Y1VkcXlSNFd1YzBCcTJBK3F6S3piM05EYWFMVEhQ?=
 =?utf-8?B?VEttZU9oK0l4ZnlkOXFGdWp5ZmYrTkVoRHZnZXVMNi9Kb05yRXBTb0s1c3Iv?=
 =?utf-8?B?aVZtb3NLdkJkbFJOQWc2RWovMWJ0S01FeDA3SFVZZTUxZWZxanBtUFVISEp6?=
 =?utf-8?B?SVB2ME1aN2VlenhjVHFReFRmU0d4Zmx0dGlCWWxzOHJqc3M4NDk5VE5QTnBr?=
 =?utf-8?B?azNubTJrdzI1bFcwUVJFY3hsVGdQSzAvNDBxcjhSL2hwb0V6V2hFcEJUTWxB?=
 =?utf-8?B?c2o0RWFMeUdFV0t0ZHBLQWlnVDRxMWRzM2RnWEFHMmFJTml3WE4xeXh0Q090?=
 =?utf-8?B?TXA0dkJJR2FPSkRwYldleUVGREZYWGtLMEpwQWxJTzYvUjdoUDNzVmNnRWNW?=
 =?utf-8?B?QXMwUFd4YW5tS3Bicm5pbFQxMU1OUTh4OW5Vb09nTlpmblJMVVNWdlg3VGY0?=
 =?utf-8?B?Z1hmcHBFQVoyNnQwT0U5d2txa2FoaXk5eFpHTndFdUxYT2xtTUhPYUhkd0Ev?=
 =?utf-8?B?WG02YWg4bGxpYnVQM0t3WGxvS0tBNHZ1dzRMRWdZQUFQZ0xsU3ZkcUdBdDRo?=
 =?utf-8?B?ZGo1S21VNm8vQXdNQWxYSmY5THltcUd2YUJieEdodWYzeExWS2lvZTgzaXl4?=
 =?utf-8?B?ZzR0eFU4Y0ZUWXQ4eUFnaDN6SXJlRnFWSks4eFZGMUpoRlQ1ZGZVWWFoeVRP?=
 =?utf-8?B?MW9Ddk8yWnNJNHEyMzY4SS9GYk84OFY1bmJyNEpYTzFEN0IrejNSMGpxTEda?=
 =?utf-8?Q?MlG7ENh6zTIze?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZGpIc0t3dHdOa0F1T0lDUTdDNFhpYjlkMjlHdWxiREFSOFAvZTRLVmE4YmxL?=
 =?utf-8?B?QWowSXpZTDZvbkRsdXg4QmFzT1k5Z0UvM0IvVytrMmhWUkgyTW5OdXc3MU5E?=
 =?utf-8?B?ZElMeWlVd2haNkhpTGJnNUZRazFZSjNHVmN5ZVJya0VBOEpoRjhMeTNsME1s?=
 =?utf-8?B?Y0lQckN0K0QrV1dmRjloYnc0cWhic1BxMGJIS0dCU3lxczQvUFVBTUtBNE5H?=
 =?utf-8?B?VEVrTStoVWU1ZzlHUVJSZFVZOVlmTXdMWE9aZ3dzd0E3ZlloRW5wZ21tWXl6?=
 =?utf-8?B?Z292WTRIOUFpVlgrUmQya0c2bXA4blhoc1ZEUTI1a21WYngrbkw2c0FTM1Nm?=
 =?utf-8?B?V0hGS25RcVJGaXZJYTBrZEl0ZjFackt2MGlSUS84NGZ6ZlNUcXkveE5rTUVr?=
 =?utf-8?B?VFlabmdpNFh4cFpQTUZEakgzT0J2bGgrdExmYW5PcFJYN1U0K2d1Nm9KSnha?=
 =?utf-8?B?ck9aUzJneUhDT3dKV2g3MmdZRXVnSVJsNGJBQ2lOcElkeDVvek9iUlVzRlpO?=
 =?utf-8?B?bnhNOWFvR0kyT0RJTXRXeHNpb2NZMlhpLy9vN3JwS2w2a1ZFclQ5ZlJEaloz?=
 =?utf-8?B?M2RSYmlxejZhMWZyYVhac0p4NTMxU0VEcldaMXBJM1pNOFNxa1VTaXVqVW05?=
 =?utf-8?B?OGs0eXdDTWVRRXVoZE1ENVlWV2VRL0tsVlZaaWp6VFJ2RU5VeTFpdmdVRWcv?=
 =?utf-8?B?Sk9EYWs2MERNY242Ti9nRUtsYmNOZEp3bUhzNWRBQnA1T0JFdzNOOWdocytx?=
 =?utf-8?B?eldhVGZ0YWdkVThFejlHNEYyMGtTNzFrZ0l2ZWZtd0psd0EyTG5scGRxUTBt?=
 =?utf-8?B?alhPanNhdjV2dlF5UlpXZlorV2RjYkx6NmN2dXRCZk9aSGowYUVjamt2Tk81?=
 =?utf-8?B?dnFsZFFMWXRUT2RSV1lKNEZnZEJyYUV1N2tqbVlWV09XY1MrbnA0RVdiS3or?=
 =?utf-8?B?bjZjd29YT1U4NmxpU0Q0TnZwSDNEaVJUS2g2SlVITmtucjFpaUl5ejljZlpN?=
 =?utf-8?B?TTVMVkgrVWEwa2o2N0lENjlHV0ZqUjFRdTdkcjc4dHVjNko4NElscE1HU1B1?=
 =?utf-8?B?V1ZEUmpBR1J3M2M0SWU5TWZlUlVMdVNxeHduZVRnL3luNVRBWW8yZ0pmTmRG?=
 =?utf-8?B?RWVWTGc5UUJTclZTcWNxMFFIaGJ2clBMQVVWdk40aWJzazFFZW5Ud3BTalRi?=
 =?utf-8?B?dEU2eFkwanFhdW8vWmdXUjIwemZzYVZLbTBTYlJxZjJqNmVyVUVpclVNelJn?=
 =?utf-8?B?blk2Z2FFVkV1SndMWmR4Z0FMNEcyY1lwUmk4dVo3aTM1TFg4SmpJak9EM2JN?=
 =?utf-8?B?b3JNakVKLzdxQTVXUEZtQks4SWQ4YmVJT3V0V3RMbERVbnQvV243empMeVJT?=
 =?utf-8?B?VlhYVTYwUDhXZitGTVdyL1pNWWhBa2dUai94cFBCMUlsODgyMGF0WXZmZTI4?=
 =?utf-8?B?M1paRTZneHFMeXc4RURoaU5OSCtVeXlyT01qNWZVMkYyM0p4aUtSM2RWQ0ZE?=
 =?utf-8?B?cWZ6aDc3RytPdGlXVlNudjNleGU3MmZJcEc3THFFbi9qRjdybExVT2JyUE9O?=
 =?utf-8?B?c1k5SVl4QW1jRGx2STIreUg4b2ZpUkpLMnh0SVBnRVlKK3ZBbnplY2tWVCtZ?=
 =?utf-8?B?WElHSnVSQysxbjRDcnBrTlZreUtMQ01QVmRlc3FUWjhDcFUrU1RnNVQra2I1?=
 =?utf-8?B?akwrazkvTFJ6eXhEUm5HajkwMUF5RG5DNnhQM1N0blZISElNTTlSSVlhK0hB?=
 =?utf-8?B?R2VJNkgwVnh0NEJZaEtCTUVMRmpXUEY0UlA0dEdqV1lGMzgrMko4WkRqenVU?=
 =?utf-8?B?RWxjMmMzYjduSkgvRzNSK016OG11T1k2MjA2elhWdWp2L1VIb2lnWU9qVlRJ?=
 =?utf-8?B?MzZrNTFJQ2NrMWFxb2NIbWo4Sk9yWDN5SW1VVDJYdjAwdFh0YXVGN3V6bTNR?=
 =?utf-8?B?ZXRMS2lXYWp1Si9KWnBZNm1GYmlSbWtRd2VFZGxjNWdqZ1IrRzJhRjVCMy9l?=
 =?utf-8?B?QStkOVphVURrQmVtd2gzYWpyZWQyUlhqa2NhbExuMzNLSzNCek1RREYwNDlS?=
 =?utf-8?B?OWV6b0MvZ2NmV25EUk5VbXZ6VlFxUUhWQTJvcGZVWWpTNUlwVmVrdVVjeEti?=
 =?utf-8?B?Z2dIZ1MvcGhSWERyWkQ4WDZxM05FNmNINDAxcTN1bUw3V1lCUU5wdWxwbU9q?=
 =?utf-8?B?RHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 159619c0-1da9-487e-11b4-08dd6723869b
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2025 20:20:43.8026 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OmMFcZ0Ci6OONukyk7L3IgN0nKuWsOPHJguDNsxIil7EulXE2hzwdQXRCdY9Sy478W1SqpBSxIaoZ5Z22e3IXT3JMkWFeBkA0wJ09+DOEPs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6888
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

On 3/19/2025 10:28 AM, Zhanjun Dong wrote:
> Lite restore for MTL is not POR for Xe, then disable it for MTL.
The point is that it is causing unexplained problems. And it is Xe as a 
whole that is not POR on MTL, not just lite restore. Hence no priority 
to investigate what is going wrong and how to fix it properly.

You should also reference the upstream bug that this is in response to. 
I think the tag is 'Closes:'?

>
> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> Reviewed-by: Julia Filipchuk <julia.filipchuk@intel.com>
> ---
> Changes from prior revs:
>    v2:- Changed long conditional initialization to simple if statement.
>
>   drivers/gpu/drm/xe/xe_guc.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index bc5714a5b36b..d9a0daf584b4 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -80,9 +80,13 @@ static u32 guc_ctl_debug_flags(struct xe_guc *guc)
>   
>   static u32 guc_ctl_feature_flags(struct xe_guc *guc)
>   {
> +	struct xe_device *xe = guc_to_xe(guc);
>   	u32 flags = GUC_CTL_ENABLE_LITE_RESTORE;
>   
> -	if (!guc_to_xe(guc)->info.skip_guc_pc)
> +	if (xe->info.platform == XE_METEORLAKE)
> +		flags &= ~GUC_CTL_ENABLE_LITE_RESTORE;
This needs a comment to explain this non-standard behaviour. Otherwise, 
in the future, someone might try to turn it back on thinking this was 
some kind of oversight. E.g.
     /* Lite restore seems to cause issues on MTL (see bug XXX) so 
disable it for now */

Maybe even add a one line synopsis of the symptoms being seen in the bug 
report.

John.

> +
> +	if (!xe->info.skip_guc_pc)
>   		flags |= GUC_CTL_ENABLE_SLPC;
>   
>   	return flags;

