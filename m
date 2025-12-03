Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED77AD116F3
	for <intel-xe@archiver.kernel.org>; Wed,  3 Dec 2025 09:29:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B42AF10E5C2;
	Wed,  3 Dec 2025 09:29:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WWFTKOzF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B68A10E353
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Dec 2025 09:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764754195; x=1796290195;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=tPPl5LcqDEJVhOAq2+HTmQQZD9yIY//VNMD4bKbAVyU=;
 b=WWFTKOzFmdy6ER8SLz0PmTJpwE4sMpHCyjiDy10wmvjqWFLgFp3MLFNk
 gMGabFcq9fQKrDFszsKoeBM12W/2cqplAys6yxM44lBqUV36u6GCYP2pA
 kteLN+p7WR5yEfm9JWyc2dS8tlJFVo3L4vRnZAA/j75zJVIIW/CNs4pNN
 /+/49HfFhG3v5UfGO5JktclU4EgUSAA3dVMMa2SNtJO+P36Pm47+UCjTn
 d3C6UfW96XNLUesU5XRFXGoq7RYnq0ZakPIWgf4kqwn9ENHmfzWdXQH9Y
 xcsgzf958LtYhvm0zcVBsyTV61yNWm5iKWa9QJE7ee/d9PX4jfXHGBpTM g==;
X-CSE-ConnectionGUID: pdc7K5ACTrePGky/gXlGig==
X-CSE-MsgGUID: vC0YOZySSEm2l98or3Cpcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66784066"
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; d="scan'208";a="66784066"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 01:29:54 -0800
X-CSE-ConnectionGUID: 8M00rG9FRYCW6hH0K3diYQ==
X-CSE-MsgGUID: JSc9VC6sSRWDhbguNJUfSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; d="scan'208";a="199571212"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 01:29:54 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 3 Dec 2025 01:29:54 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 3 Dec 2025 01:29:54 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.10) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 3 Dec 2025 01:29:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cwZWzjUBM/j2jwmlGigrHxGeT7iJIjeJ7Jt2pztc811hbECnHKHZVSAY8NSNH03zlqbD+6kehcmOGG+Qie3DQ2yDjgFLLAxAGaboAwMsXOD5BFjcgz4j01NvrmnPvTL8NcgToz0bC7l/0F9uyZ3Hla9RWqiGMDgZBv5R7fzE2UbNi6S09eUsH9EPlkz3PKrmKjBjC/eLtl4eO3xoqNWDQpNTJ3F8yPWBBlUnacJgrGZ2Y2Z7FYcaTIfvDFS59UhmsW2yvCsS512W2rg3oWS/WI/pNBFi2RgH1eMnoT4hOyta8ws8NvMgNQ25qxLUgstY7MsDjS6IjwZN75k5t6C68A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8kN7GcG7gItEEDK2rXzRh+m0Hce4cAzniKhZu35+q6E=;
 b=b2gyoHN1jk9iOUE7QQ1Lp2vU7yvt8ORI3goEWe94qIo9KiTxdsvJCz9E/5KN3sS6HEhfLS2K+Gtjym1YK9KE9O87QOKcChakcPcOjIXMDYr9ii1Xrfd5UQutgxzAzvHvPVvUQnFdxeIJhG9zbctghBKjMqVP7NXqjBqwHiFHbobpQP8Uj942PpuoojtiGfQNs0n8Aoit1OGNYyER8zXP4wdfgzZ2xER5Mp3SG24xYpCW6hC5k/L3Ju95mmApoO8hxl/xqbhHrgmTp4/nYYk1biE1437YNR6eGxGiDn9w/tl69FflzUlCbW1GX/Uvj3wckTHV926wHcavGXlVepW+dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by SJ5PPF0D0CDCDB9.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::80a) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Wed, 3 Dec
 2025 09:29:51 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541%2]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 09:29:51 +0000
Message-ID: <f805573a-cd4b-4ce1-821b-7f28aae532d2@intel.com>
Date: Wed, 3 Dec 2025 14:59:45 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] drm/xe/hwmon: Read temperature limits using pcode
 mailbox
To: <intel-xe@lists.freedesktop.org>
References: <20251202145013.3273400-1-karthik.poosa@intel.com>
 <20251202145013.3273400-2-karthik.poosa@intel.com>
Content-Language: en-US
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
In-Reply-To: <20251202145013.3273400-2-karthik.poosa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0075.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ad::7) To LV3PR11MB8695.namprd11.prod.outlook.com
 (2603:10b6:408:211::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8695:EE_|SJ5PPF0D0CDCDB9:EE_
X-MS-Office365-Filtering-Correlation-Id: 0140e5c4-9eac-4d26-a95a-08de324e8296
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aTk4cFV4TlorOHpzVnFxYkhHdzRGN1Z0ak1tNEtnTWVKZmtxNkdTK3p2R3pp?=
 =?utf-8?B?OUEvbXRpbmhROHZxRFlGQWNnNXJOcU1OcHJtNm1XVmkyTWI5dXFkb3FZQkRB?=
 =?utf-8?B?WHhONngrWDlQRWxzNklVYkFjd1dyYnROakg3akwzMHp0YVJGNWNRd09YYlR5?=
 =?utf-8?B?ZVd2RWtwZFU4YUJyWENKOU0yUDNObWYyVjhKRnNtVit3TnZoV1pIczdxY3Rh?=
 =?utf-8?B?U2tvc094Y09ieVYvYkEzUDREK0hVWDdkSDl6NGdsWWtrRzlCeDFuVWhYdEFN?=
 =?utf-8?B?ZHU1U2VYY2FFeHdTdFZ2M0VldVNZWmJydUVXUTBSNlV4aVUrNG1SbFkzbm83?=
 =?utf-8?B?SkZ0M3hCUDVJQXFQTHB5WER6SWNmbkYrazBXREI3TUdGOElLSDZSQ0lYbDFm?=
 =?utf-8?B?NGdmbWt0eDJ6T1dudWFNWHNzQVJ2R1NKV1UrLzhka1RwcDZZN0hxMW94M1ZG?=
 =?utf-8?B?U0xTTHJGcEsydVJIaFFoc2t3anU0NUw2dXArbDlwbEJMQTN1aEszOUhLRzQx?=
 =?utf-8?B?ZkdWL0x2RDA4OEhQNzA0cjh3VzliLzk4WDFlVnE5RmlXTGtpN3BtMXEzWVJy?=
 =?utf-8?B?L2V2S2FnQkowZXc3enVGY2duSVBPcmh6TzBUekhpeThHdDZTaFZuQzIzQkxF?=
 =?utf-8?B?V1M3SXRlTWp2cW1wb0ZNUkZhcUVPcXFZamFBNlNkdzZnY2ZIdlhLU2x4Q05C?=
 =?utf-8?B?MXZIa3BBcHhOaE1yT05FcThQWnBSUFRUSzdVRFBMbXBUYzU2MzdISmVadnU3?=
 =?utf-8?B?aWNad3NiVlgrOXhFbitzQ2RDL2tBOU1DVGw2M01TRHRxR1lrQW84WHFxbmxL?=
 =?utf-8?B?MmFnS0cxK3lNRHRsUjJwUzVIcURFai9oblNKdDJkc0QzdVZWdTJWa3VZOTFy?=
 =?utf-8?B?WjZKQ0taSGM5YWxScFo0SVhkdEI3bWxsbHRWREVWOW5PMFkrNXlGemdJZXFH?=
 =?utf-8?B?TTg4YWpYWDlYS1RmY1ovdWZKcy95OVhGc0RwL1RaTk96elVjSDEvdXVsUzdC?=
 =?utf-8?B?MmZoUnVibnN2SVBGdDQwK05IYlhFcVp2SlZNdXNmRWlxRkxxWDV5d01RSFdq?=
 =?utf-8?B?cjlYNFJzVS9CUy9raGQyWGRHVzNmM3dDcERsSjllOVBEUkgwSmtwVXpaaEdq?=
 =?utf-8?B?Tnh6cFR1bVhBeDFqRXMxSVMzcWdtRkVPdlVIcm1MdzBham1zRG1lQnhiNnVk?=
 =?utf-8?B?ZnJmZjRCWGN3cEFxeUc4WW94aXBRV3R1UmQ4blo0eE1JQ3JCWFJTaHgzTFNt?=
 =?utf-8?B?ZGJBSXBlQVNwQTRoVy9NeDBtWktzVDNTdWR3YUEwYWZyNEFaSlIxL3J4Ylcy?=
 =?utf-8?B?d3BMQmZHUjNDRmZybmZuTnZjeGpLMWQ0TnZDc29RV3VCRDlMT09PVmJCU0w2?=
 =?utf-8?B?UFhMYVZQN1RNM2JLMk1QeTdTcVhSV2lMczFzN2Y1OEI2UUs1NUpmVlgyTzM1?=
 =?utf-8?B?b3FYM0V1TTZHeUFPRW0vSnNjSXJhbnhBaERwdXdtL0YrcCs3eWEvOE55NVpZ?=
 =?utf-8?B?V3ZQcGwyNm5mcVo5NG1VdGhQNWQ2RTlDcC8xVDJmL1hIUjQxcWVSR0trbzZo?=
 =?utf-8?B?RERjYTg4bGREeXNmZXprR2FzMEkwUU5Rdi9JRU0xbTJVVzlRY2Zxd2crL0Vm?=
 =?utf-8?B?bU9JL1VNdWNRcFB1UERPL3A5RlJHSEdmU2RsYTBhdDVRdGtoNy9hZTFCR05i?=
 =?utf-8?B?elh0M2daTmRxVUViRnRWK2xGZERlaW5seEhEVHFhWlAxYUhxZEJpWHZ5bjVB?=
 =?utf-8?B?R2Z4Vk8vVlkwODE0V3hwTW5CTFZybDBCbm5ydEtxdXE2QWZIQjh4SVJHdHVh?=
 =?utf-8?B?ZTBMYWp0RW1maXhYMGVsK3M3WmR5eGQrSllDMFo4ci9BQ01BTGhsUU9OS3lr?=
 =?utf-8?B?Rnp1S1FIeWxYdFhzTzVQaVR3bHhVY2dtRHdNOFNDZmhRNEgzWSswZlIwSC96?=
 =?utf-8?Q?e4eS+iEJ6zfpNNTELMV+M9Dh4nMcAQxT?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8695.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cElpb1A0UEVHTWJYTm96NlJOSGk5eHhVTkxmdmhIR3BGN3RYUnFYdWZNSUcy?=
 =?utf-8?B?a0RRcitqbGdvMXlzZGo1WGh6UkxQZWcxTXRtL2gzRjIwaFJ0Z0hndEEyNFdO?=
 =?utf-8?B?TkV5d1RHVmNjeU9kUklLaEhraDZQcXZDa0diRW5salZGc0xpeVBKNGJhWE1H?=
 =?utf-8?B?RFNkSVNiZW45Y0ZNNTNxR0IySi9tODJaM1AxUzJDYmlGQ21NQ2VRS1lhcTQ5?=
 =?utf-8?B?MmFUMXFsb3ZWVUdGSDNGTUd0REFNUmNKd1Y3cnQwRkMwblJHR3VxUHJMK2FK?=
 =?utf-8?B?MFp0dlZ1T3RIeTM0TVRacUl3UFNpRzIyYjVNNFovbFRMdklxTkYwdWtBL1BF?=
 =?utf-8?B?aFArdU05MzJvUm1pL1UvaVJQbXdiUTYwbUZpUUQ4ZEhzR2ZENDByRGprcHhP?=
 =?utf-8?B?bWRrd3FUaFFpck94SDJObFdnTytDa0dFeHF4eTlvNW5NUWpqL2g0S1lrak5y?=
 =?utf-8?B?NUFDZmNhckpES3VEWWo2bFI3aEtFTVVwR2YxWjU1KzQ1TzRJSHVRWHd6eGZY?=
 =?utf-8?B?YlpTOWhzVlFoQjhzR3FqQUdkRXNzdkljRVJsV3g1b2RvRzNOckJtN3JRWHZL?=
 =?utf-8?B?NnJUS3VFcHBjMHBUZnJ0VFhmV09PNGtBdjhqbHhpejJQaVZVQ1paNGsyWkZl?=
 =?utf-8?B?VnZGdEo1elYwcnRuWnJOdWNxNkdsMHZWazRtVStSTTlwYkE3S3VCMjdCRWdi?=
 =?utf-8?B?Y0I2Mmg4QzU0bWVXME5tdG5MdURtbkF5c3Y3OWZ4QmRXZGdFSE9iVFJEdjNQ?=
 =?utf-8?B?TE9tU2ZGYytmaHBORDFwUnlBVmU5aDdYY21NbWozbGJoZWdhNkRkSlV3dnVZ?=
 =?utf-8?B?TjFRNTZVR3N0dXZQQ01aL2ZQa0ExZ3hKSFI0aGFPN2tSUUF2MVFSRCtrTnRV?=
 =?utf-8?B?OTJaaG1JVEpTdTB0c0ljcUJGVEJOSVVKUUMyUkpYMnhvY0xldmM2TlBOTXA4?=
 =?utf-8?B?OUZQcXNoWEVTbnoxc0xVcEcyWkFtVk4zVDB2TURleHBDVDliOEF4OTV0bGll?=
 =?utf-8?B?V2VVcEk3akZHcU1iM055UHVLc0J5a21wL0ZyRHF6c3BqM1VYSGxteXgrb2RM?=
 =?utf-8?B?UFZSanlLQjVnWjc0bFRFRGw4MExxNEV2TGNsQzNOWWRTbUNVM041ZGJMNTI1?=
 =?utf-8?B?YVBORlFNOGFjSE1qZHRsSWIyOGNzbUpsNHN6UWtuZGo3dVZ0MjZOd3NZZFpB?=
 =?utf-8?B?Umt0V2doY25NTHpQbytHRGpacHRKV0RYblBocktCZDMzNTgvbGZrWUJNQ2dE?=
 =?utf-8?B?QmRrYUF0SHUzWjBvaVNUNkdPNmdndUNmaGpMSjdqcTZKNjdnR0tQZ3FORUs0?=
 =?utf-8?B?dWFBblNaTGcwNmtvMzdkV1BVT1FyWFJHanZnL2ZWY3R4SFNlUjNSSERqY0Mw?=
 =?utf-8?B?TTNHQmI0VWNUc0MyanI4bEdwTW43aDU0RDA5eDhwa0taUlpMbnJlQ0Fxb1BZ?=
 =?utf-8?B?dXdLSHlMdzRJTEdVRzEzTnhLSDRub0RDMzVlSGh4T3d2QW12VnVOYkxIUXF4?=
 =?utf-8?B?SFBwNGJ0cEovTXVtYVprYlJ3RlNVNExPOTRBN3VWWUVYVGczZE13b0dZUnVS?=
 =?utf-8?B?eGNLZk5nVVE5ZndmVXkyZmFjb0xRQlIrZFhyVXlIWVRpb01BUFl1d0hkT1FK?=
 =?utf-8?B?VWFHQlpsbWlZMUxqM3dpK244cjRzQ3E5dzBJR3JFTmhLRjRiRHZHOFQ4UGFE?=
 =?utf-8?B?UDB5djBwUGRiVi9VekV5VWV5K2poeC9JNUw5NVcralVSWGt3b2F5L3EyRnhz?=
 =?utf-8?B?dVFCQ2NpMmwwcDlLTTNVbXpxeDdkUlFMNGhDcXRaZnN4dDc0QitYK0dpdWFy?=
 =?utf-8?B?cnRONTc0ek5Cc1J5d0RSV2xzS0cvN3F4UWt1ajM0bWMzNzZoV2ZCRjhtSCs4?=
 =?utf-8?B?a1hDTjhSbWx5bDlldTlMRm90WHZsL1YwQTRkQTNUQnVnWnVra21EUWFZZks3?=
 =?utf-8?B?bFB6dFBDRERGUzZhKzNmV0h2aVpzZFRGeURocUE4MkVpbWdiK1ZDRlVHSFBO?=
 =?utf-8?B?Q1lBamZVTm9qcFQ0UDhsSHpqckx0cFkxNTF3Ti9pcElOVE1qTy81ZmpIOStS?=
 =?utf-8?B?cUNUSGNMd3B1bjhZMjNwdmRNZkVSV2Z1aVRxTnczeW50L3QvREdEREJYT3RK?=
 =?utf-8?B?V3o1ekhFUjNzVkpmNVJmcks2ZCtFRmQrWjBBOGM0ZWFqdGRUWXdCMCtENC9S?=
 =?utf-8?B?MHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0140e5c4-9eac-4d26-a95a-08de324e8296
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8695.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 09:29:51.6424 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iwhoEbOWpSn63cdNyLqP6IU0NLk/0Cw80r03Vi/jMb3sALm7jIWu/nYW+qinLtLzh0lDxh5xuxu42DUtIMTPnBxI+9tJoHMSLIULGUXRmPQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF0D0CDCDB9
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


On 02-Dec-25 8:20 PM, Karthik Poosa wrote:
> Add support to read temperature limits using pcode
> thermal mailbox commands.
>
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_hwmon.c     | 44 ++++++++++++++++++++++++++++++-
>   drivers/gpu/drm/xe/xe_pcode_api.h |  5 ++++
>   2 files changed, 48 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index ff2aea52ef75..df1df55c2499 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -53,6 +53,14 @@ enum xe_fan_channel {
>   	FAN_MAX,
>   };
>   
> +enum xe_temp_limit {
> +	TEMP_LIMIT_PKG_SHUTDOWN,
> +	TEMP_LIMIT_PKG_TJMAX,
> +	TEMP_LIMIT_MEM_SHUTDOWN,
> +	TEMP_LIMIT_PKG_CRIT,
> +	TEMP_LIMIT_MEM_TJMAX,
> +};
> +

Enums are defined in this patch, but never used. Move to appropriate 
patch where these are used.

Also, sort enums in alphabetical order like below.

enum xe_temp_limit {
	TEMP_LIMIT_MEM_SHUTDOWN,
	TEMP_LIMIT_MEM_TJMAX,
	TEMP_LIMIT_PKG_CRIT,
	TEMP_LIMIT_PKG_SHUTDOWN,
	TEMP_LIMIT_PKG_TJMAX,	
};

>   /* Attribute index for powerX_xxx_interval sysfs entries */
>   enum sensor_attr_power {
>   	SENSOR_INDEX_PSYS_PL1,
> @@ -111,6 +119,18 @@ struct xe_hwmon_fan_info {
>   	u64 time_prev;
>   };
>   
> +/**
> + * struct xe_hwmon_thermal_info - to store temperature data
> + */
> +struct xe_hwmon_thermal_info {
> +	union {
> +		/** @limits: temperature limits */
> +		u8 limit[8];
> +		/** @data: limits data dwords */
> +		u32 data[2];
> +	};
> +};
> +
>   /**
>    * struct xe_hwmon - xe hwmon data structure
>    */
> @@ -137,7 +157,8 @@ struct xe_hwmon {
>   	u32 pl1_on_boot[CHANNEL_MAX];
>   	/** @pl2_on_boot: power limit PL2 on boot */
>   	u32 pl2_on_boot[CHANNEL_MAX];
> -
> +	/** @thermal_limits: Temperature info */
> +	struct xe_hwmon_thermal_info temp;
>   };
>   
>   static int xe_hwmon_pcode_read_power_limit(const struct xe_hwmon *hwmon, u32 attr, int channel,
> @@ -689,6 +710,25 @@ static const struct hwmon_channel_info * const hwmon_info[] = {
>   	NULL
>   };
>   
> +static int xe_hwmon_pcode_read_thermal_limits(struct xe_hwmon *hwmon)
> +{
> +	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
> +	int ret = 0;
> +
> +	if (hwmon->xe->info.platform <= XE_PVC)
> +		return -ENXIO;

Write a helper function with bool return type which returns true if the 
feature is supported and false if the feature is not supported.

This way we can add more unsupported platforms in the helper function.

-Satya.

> +
> +	/* Read thermal info */
> +	ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_THERMAL_INFO, READ_THERMAL_LIMITS, 0),
> +			    &hwmon->temp.data[0], &hwmon->temp.data[1]);
> +	drm_dbg(&hwmon->xe->drm, "thermal info read ret %d, val 0x%x val1 0x%x\n", ret,
> +		hwmon->temp.data[0], hwmon->temp.data[1]);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
>   /* I1 is exposed as power_crit or as curr_crit depending on bit 31 */
>   static int xe_hwmon_pcode_read_i1(const struct xe_hwmon *hwmon, u32 *uval)
>   {
> @@ -1263,6 +1303,8 @@ xe_hwmon_get_preregistration_info(struct xe_hwmon *hwmon)
>   	for (channel = 0; channel < FAN_MAX; channel++)
>   		if (xe_hwmon_is_visible(hwmon, hwmon_fan, hwmon_fan_input, channel))
>   			xe_hwmon_fan_input_read(hwmon, channel, &fan_speed);
> +
> +	xe_hwmon_pcode_read_thermal_limits(hwmon);
>   }
>   
>   int xe_hwmon_register(struct xe_device *xe)
> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
> index 70dcd6625680..16201da0cf6b 100644
> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
> @@ -65,6 +65,11 @@
>   #define       FAN_TABLE				1
>   #define       VR_CONFIG				2
>   
> +#define	PCODE_THERMAL_INFO			0x25
> +#define	READ_THERMAL_LIMITS			0x0
> +#define	READ_THERMAL_CONFIG			0x1
> +#define	READ_THERMAL_DATA			0x2
> +
>   #define   PCODE_FREQUENCY_CONFIG		0x6e
>   /* Frequency Config Sub Commands (param1) */
>   #define     PCODE_MBOX_FC_SC_READ_FUSED_P0	0x0
