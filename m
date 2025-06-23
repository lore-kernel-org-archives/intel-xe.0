Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9192AC7115B
	for <intel-xe@archiver.kernel.org>; Mon, 23 Jun 2025 15:03:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0762810E3CD;
	Mon, 23 Jun 2025 15:03:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FobppVn+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 228CA10E3CC
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Jun 2025 15:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750691002; x=1782227002;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/Bv/ozpxRdgZayPU0EgTpbm8MuBl/8FxqeSVekAlPDQ=;
 b=FobppVn+5n+j7vQvOSqbjuWcjltY+IE+4SnY554dvNu76YXh7mJHkuvI
 g77op3jJBvGykNmoEQweR0u4UlGuSuE2+mETkpAI38MJymhLD9paWhx4W
 MQBQEHYTpywiXcQ2pXu1VlkpLXDGn0LG2c5zzaXxZnrSu9nrcPXIj2sry
 N3tpMjN3ZToli4wjh0DHSSTz0aEnld8egP592pxjRGN0LUkPyA93OyEHr
 3YDI26xWU+48or6Bh/l0fp7/cAX/FByB9LUl7yilzFLclm8JlrSxFmXQ2
 ZKvS/KzVzISCgQgs071kuJyUPZTr6xJqnVyJxtzsvr+ODGjlFhlCwJNre w==;
X-CSE-ConnectionGUID: Tcv5TNpFQaqPUcvGcoLc1w==
X-CSE-MsgGUID: KzDjXOYvQKiW3+iF1+DCHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="52973884"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="52973884"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 08:03:22 -0700
X-CSE-ConnectionGUID: YeY5p7hfRhWNBK3v8aMyMg==
X-CSE-MsgGUID: Xm1Zj6M8SE+6g/bfIW1EZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="182496520"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 08:03:21 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 08:03:21 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 23 Jun 2025 08:03:21 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.83)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 08:03:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kv+jqGc0gwhX78VIy457NInaErOG7ERFlyd+qRoon8Mg1QcObQLsfoZPYVuw4NgytP99+zbr4epQoGeoQwFDkLBSeUJzLljdBS5eSbD1khXKhw8ujeAVkdbJGaxi51V0QQ2wUlnlYAWbZpKf3LVu86/rOomYUgAcZsZzXijZEbNnSJhYTGcRQg1U4/dCYY6onCVWOHHg9SDBBSYMAy60L4rVyXM9nVL2QkEnsUzX7Ql6YR2TMhuxgMcB5LYHOy/0mgeeJeLfRg1GXUIc8Ygc2l/Kxb8/9THsDTDe2Kwzu4z2PhCpXLRztFhy/N0ARC7dx672NRYaqNT4RTOgpXHmMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VB/Aq6nSGWSHt05ivBTU3xsdSEDtr1RN4RR90kvz8+o=;
 b=Rag53cnbE/xJ085b4zOdMLXdDD3Bzy/ysXInl2FAe5F397yjA1gAdP4kkHghxfgLUVNPa7c64JZd4ok/0Gc8TDx8pbwxDyvjsRj7/eIWxx8t4P6duR7vP5NaAYCshA3VynwCSukg+oBLA+W08LURAIIkOg6SWWP0sNAmt3reCgCi2nkMQ4Ejqn41NruMJSMn9X0FUXQrClqR3/LLnhmMvNfRe1fat11rmtmi8dUw404la+eD8MEG4KIW3KzQVBnbPamS1eWIBp+JONj3tv8JyuOCBqE8Z+CfmgBKZ2tC2Unurlvj3EauzC6ZkTgzhxHQZsrOAZWXAmf7Evh5RviFgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by LV3PR11MB8580.namprd11.prod.outlook.com (2603:10b6:408:1ae::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Mon, 23 Jun
 2025 15:03:16 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%5]) with mapi id 15.20.8857.026; Mon, 23 Jun 2025
 15:03:16 +0000
Message-ID: <b93a0330-ef98-4876-a39f-451ae33b5f45@intel.com>
Date: Mon, 23 Jun 2025 11:03:12 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] drm/xe/uc: Disable GuC communication on hardware
 initialization error.
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>, "Summers, Stuart"
 <stuart.summers@intel.com>
References: <20250618233256.3422319-1-zhanjun.dong@intel.com>
 <CH0PR11MB5444EF9D7CE464D3D3B5B908E579A@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <CH0PR11MB5444EF9D7CE464D3D3B5B908E579A@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0150.namprd03.prod.outlook.com
 (2603:10b6:303:8c::35) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|LV3PR11MB8580:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cff39b4-a7da-454b-fefa-08ddb26714e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ei9hUitUZ3IwOVAydDRwZlhKaHJ2WGZIN3d1eFYxVGdGWnlDamRHbGpzTGdl?=
 =?utf-8?B?NlBzUmRzaUVCVE11TW5KdEsrTFkrQ0xpQTRiSUJEeVJhVFdDcmgyU3ZWR0Fl?=
 =?utf-8?B?eVN2aXRlYTlVS3YzOVhOWXZ5ZXlGSDI1c2d5SXRUNkVxOGVpTjJQYS9UWnJs?=
 =?utf-8?B?RldCTENWZytXTFFzZ2pMU005TTlZNjhYQXM5NHNIZm5HVUU4QlBWbUpvaHhH?=
 =?utf-8?B?UjF0WmxJYXdEYkxtcEN3dTRUc3p1QUlQWDBsMU1oK3lsLy9iN3Jia1E4WkpQ?=
 =?utf-8?B?VCt3MXRleEpHSzI3OXVsdExHVVhUakcxM1AybFFTN2hEa3hMd05QVzdrRTlo?=
 =?utf-8?B?WWtTcnNkYnNoWTRSemprL2VOZ3A0Wjd5WkVodWY2OEEyZzltM3pRY0pZVDFo?=
 =?utf-8?B?WC9lNjhsc05jdldLNmZZMHhIbnNKTHEzMnpWN0FSZmU0NXN6YTFzbzgvaTJM?=
 =?utf-8?B?VEprZkFBRER2QVZyMk03QUdLRVRuK0tBRXluRm9kd3owK0hCNFpZTzY4cXZx?=
 =?utf-8?B?QXJSSjV4bDh4d3owRzUrZndYNTJFVk5ReTROd3lmU3Mra2NMMDFrb2xqL3JW?=
 =?utf-8?B?UDBtK1NQUWc0Y2NQQUlxSnlyY3d5aDZGZ2xwbGVlb1o5S0xCM2tVa1IxMEtZ?=
 =?utf-8?B?endIVHJhUUZwem0vOFlobGdBL0FKTElUTXNLQjNESDJXVjV0cDdjdDFselJ4?=
 =?utf-8?B?RlZMbC9YUS8rZGtLODJrU2t1U3JvN3NwK29HVWd1RmJiWVl6WGg0bHVlT044?=
 =?utf-8?B?RlhFT1cxdjArN3Z2YzhMb0g4TU9KV01BbExWeEVxMmpaa09VbFRzdGoxVlFq?=
 =?utf-8?B?QStvcDlHL2xGY3pld1NrcXNYUGczSGNZNktBZ2JNVEtxTGg5clZkdC9lV2lS?=
 =?utf-8?B?bUxaYmtQRHBXTUhxSzVHQk5ab3d6bTVhUTR6MkxNbU9mSkcwTWxKcjVYSVdi?=
 =?utf-8?B?OFhvVDlyUUlQVFdZZ1lmSTRDbCtQbFcraE1YL2U2SzZ4bTBtK1NhQ1gwdTJJ?=
 =?utf-8?B?amxGTVdCZHEwWUN4eG9mSzlhK2hyNXlMTXljenpsOFFwWGJ3S3lNbXFaMklG?=
 =?utf-8?B?SS9xcGZJcTI0ajVzSmtITmVHYzhLZERxOXRMM21vQmljUWRZQmpURm92OVNK?=
 =?utf-8?B?SVFxZzlVMXRDa3lYNkFkbkoxZytLTFhZOGtZMDgveERsUjNSNGdHemZBWC9Z?=
 =?utf-8?B?QjlMdDJhbzhMZ0Z1Qk1CNmpxNy9RNitkL044dUpESUhQWVExRGJ1eFhyMm8w?=
 =?utf-8?B?Vmt0SVFzZnp3NUFUc3hFZVdDcndvTTNkR0pKQkJnbW1GNG93bDZwQk5Yc1VP?=
 =?utf-8?B?SEtub3pGTStTMmpPWGVGS3grQVgxVkdWVmRmTEdYTXVsMGxNSEM5V1NYeC9v?=
 =?utf-8?B?V1Bjby9nOEErWUFUamZnNFhBVStyK0lWOFNST1lvVEExMmNwd2Z3d3B6SjE2?=
 =?utf-8?B?YW1WVGtyS01oUkh6SHpSZjkzOEtnaUEzUG9vbkNrWm9ZL3ZHVWsxS2I1M0s4?=
 =?utf-8?B?cW1xd0VzbTRZRWE5TUVFakRYemNyMFdVRG94QmVOVVpxUER2aU1CS1JYZmhr?=
 =?utf-8?B?NjZMSnVpRE9rVGpqbnNtN0JVYk9acnYwOGFkWkpENStzcElHN3F2RnZ3OVFH?=
 =?utf-8?B?MU1ERTUrczNQVGhCdEZZY2lTVnNlWXZuVWVwZFN4YTlPbUtVOHpPQzJWTUU0?=
 =?utf-8?B?L1pnR0h5NzFBckNTN0FERVVxaW1CRFJCMmlTRjBucHY1RVBOZ1RFZFJiNEp2?=
 =?utf-8?B?NUxNOVpSUmFxVTZLMkRLT25OMmJQNTgySTErNE1xNWFscURwS3NxdngySFBN?=
 =?utf-8?Q?cEtdtx+ODuoMJmFgVry0QZE9FthP6lpa8ZRSY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z0I4QmJpYkJWcmh5bVVrMHY1RHVWU3R5emFhbjluZnBFdHVFb0ZKZkdmZm9k?=
 =?utf-8?B?eTllQmx4NWorTStOL0dIdlUvRUpITWpSUnpKaUZUUmxzQ05ybUNyeUtqOTlx?=
 =?utf-8?B?RkxrcWN3dnRib2ZpZERLV3VYY0svS3doTVVpZ1VkYW52ZDhvMHBVdTlrNU9o?=
 =?utf-8?B?ZEVTZXJLVk0rUzM0aTVUdTI4bzZkK2F6M1hVT3l4RGFmUlhVOSs0RXNka1ha?=
 =?utf-8?B?bEpRM05hTHV0dXpXMFB5WWhLWjJMeFl0bHFhMmNabzBicmtML0hvd2dzd1BV?=
 =?utf-8?B?a21QNTdMdVFZZWNvYlR3UVJQQmF2elVBTzZYS2d1NUEyN1RrSEFEdVo5U1BT?=
 =?utf-8?B?bUw1S2twSkUrdHgrZjF2VGhEL2lJT012RjUySncxT2RycTRueE9lV1RYVzBU?=
 =?utf-8?B?TUhpbnRYRUJpb081SXJiWGxtcG82M3hndE1uaEttUHYvamlvY0VGamJ2ZGxX?=
 =?utf-8?B?aE4wcFZBWlMvZjk0RnFyaEp5eTBDZTVXNlJWa05zc2FFZ2E1UUNLd29pVUsz?=
 =?utf-8?B?YUhFcmU5ajBWQXIwVFJaMTZ5MlhkNndMOCtMbk56Yno0Yk1mRFAyZGlBa010?=
 =?utf-8?B?amFzSUl6ZkF2MmwvR2dUWlpDMnZMSEUrYzJxZ0ZrTjljenZIK2x6WFdUS3F2?=
 =?utf-8?B?YTB1WWJvTkYrMDc4ODhpQmV4MEo4Mlk1TGY4dWkraGVuUEFLQmdJYTB0Snlt?=
 =?utf-8?B?dlQzVkpSVDB3Uld5L0h4aGdhektJanJvOFlObEVZcm9HMDlWV1RyeUJETVFN?=
 =?utf-8?B?T3pzK0Z6ZFJEMytFbWozSDY4VEpWSG1CYnVnNFJZeDVUakVUVUxybTZsNnRr?=
 =?utf-8?B?c3U5OEEzZEZHWkNDcUs2WkRYYkFLU01ITzFlSS93b2loU2dPV2JrWHJhNkt0?=
 =?utf-8?B?UTBOUHZWb2RJaXBvT3FXbnFHMmdNc0JtcnNJaGxNVm81RHUvSW9CMDdHMzdo?=
 =?utf-8?B?L0lUdk1NOGpkS3VST1dJWjRDb3BVM2s1RU9ZUGFSOUdTaUZiQ0xlQ25pUTZV?=
 =?utf-8?B?VlhQdUZTa09RUFpDT2ZEZ3lLN2oyYWUwY0hqQXp4bWZVOEFIUWtIdDlmMFRO?=
 =?utf-8?B?WnU2UDRqaDFFYmVKd1VMMSthMU5LMFJ6QmNTV01oUFdLdTljMlUyOTBQRmVy?=
 =?utf-8?B?Y0RRMWxldmtkZkt3RWZ4RFpBakh6RkdWYXRWMHJRcnd4WDc4VHVBSzJBSmxy?=
 =?utf-8?B?OXdxL292bG01cm1LVDJLSnBOTTFFdE5zbTdaT3g0RFBDeVR0MVVMWVdBYTlG?=
 =?utf-8?B?L0tJbkNaQzZGK2J2WUlqbUdKM3hIek11b0tMVjhPSUkzb3llY3hFTUdpRU5O?=
 =?utf-8?B?c042N0tvaENRRDJBUlo1NU1MR3NlSCtSUlVzYzN4ZVVYLzcyVW91d3h1enVS?=
 =?utf-8?B?MHBGRW1TeVdYYWZFTS9iREkvTndoVzYvNmpzVncxd1lRWXNSdXh2WjJwMWE2?=
 =?utf-8?B?RlpuejFQR0lidFE5ZEc2elNJRHhCbGRNY2huSXRyblhVQnZWRjd0YVJubXph?=
 =?utf-8?B?R0JCbzk0SVpXenlQREpsQXBuUU5laFgwS0RFcjU3TjZUNGd1VURabGNlTkda?=
 =?utf-8?B?Rml5RDI1VTdNRC84QjBWeVBiR25hTWxmN0NlWDJEa2ZxTE5BMXcrQUpTWXpR?=
 =?utf-8?B?VFl2NUtPdTVrcUNpdndBamxLbEZvT285a2dPTlNXQ3hXQWlPclorZTczSjNm?=
 =?utf-8?B?amlJVXNyc3VFMkg0ZWZZMzYybXFmYlVFK3g3a0VmNno1YmpQL2lYQVFoY25i?=
 =?utf-8?B?SGFnU3FyWUFxUUM4aXBsaFVIU1hsZjJEdU12cU1GT2RPdlQ2NXpsSWxBTVV4?=
 =?utf-8?B?SytjanFaaytZKzhaYkRZUXhSbE1iajJ5QzFNUEhTcmZ6SFVtdUtrMjNTb1c2?=
 =?utf-8?B?c3psYU4xUGE5MldDUWNaVi9qN3ZjemNha3NGN2F5cGVDL0hac2tvamFVTUFB?=
 =?utf-8?B?TGlQRUF2SXBERXhTbDl2eUc0MjFIOCtSUkZXbU1JS2p3NXlWRjdMZ1k3a1px?=
 =?utf-8?B?QzVUbDAvNGliYTFzUVAzOEMvQmkwTUJIOHRtczVrNmxqOUllOXlOeWNkb0Zh?=
 =?utf-8?B?eGhKNDZpdTJ1S3F3M2E3VXdEeE82WDhxTTNiWVBKRUFvVkdNU2pZUG9XNzlw?=
 =?utf-8?B?NzBBSkpVTFd6TFBrMEVnbTdxdnFHQWpoUEFsZHJkem9uRU9YV0JwdVYxbEh3?=
 =?utf-8?B?TEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cff39b4-a7da-454b-fefa-08ddb26714e6
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 15:03:16.0768 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IDKmg/WsDOdd4UDtDNRsqS1kbVOzQ+3qR74d2hmAoCSfOFsc2ctIzzDcEoP9DJ0o5zh6KBtiREx/ItMUV0+0LA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8580
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

Please see my comments below.

Regards,
Zhanjun Dong

On 2025-06-23 10:28 a.m., Cavitt, Jonathan wrote:
> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Zhanjun Dong
> Sent: Wednesday, June 18, 2025 4:33 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Dong, Zhanjun <zhanjun.dong@intel.com>; Wajdeczko, Michal <Michal.Wajdeczko@intel.com>; Summers, Stuart <stuart.summers@intel.com>
> Subject: [PATCH v5] drm/xe/uc: Disable GuC communication on hardware initialization error.
>>
>> Disable GuC communication on Xe micro controller hardware initialization
>> error.
>>
>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4917
>>
>> ---
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Stuart Summers <stuart.summers@intel.com>
>>
>> Change list:
>> v5: Set wedge is excessive action, revert back to disable ct
>> v4: Fix typo and add new line
>> v3: v2 CI re-run
>> v2: Remove unnecessary jump to err-out
>>      Drop disable ct, switch to set wedge
>> ---
>>   drivers/gpu/drm/xe/xe_guc.c |  5 +++++
>>   drivers/gpu/drm/xe/xe_guc.h |  1 +
>>   drivers/gpu/drm/xe/xe_uc.c  | 23 ++++++++++++++++-------
>>   3 files changed, 22 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>> index 209e5d53c290..9d7175b16cc7 100644
>> --- a/drivers/gpu/drm/xe/xe_guc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>> @@ -1230,6 +1230,11 @@ int xe_guc_enable_communication(struct xe_guc *guc)
>>   	return 0;
>>   }
>>   
>> +void xe_guc_disable_communication(struct xe_guc *guc)
>> +{
>> +	xe_guc_ct_disable(&guc->ct);
>> +}
>> +
>>   int xe_guc_suspend(struct xe_guc *guc)
>>   {
>>   	struct xe_gt *gt = guc_to_gt(guc);
>> diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
>> index 58338be44558..285c19929f8c 100644
>> --- a/drivers/gpu/drm/xe/xe_guc.h
>> +++ b/drivers/gpu/drm/xe/xe_guc.h
>> @@ -33,6 +33,7 @@ int xe_guc_reset(struct xe_guc *guc);
>>   int xe_guc_upload(struct xe_guc *guc);
>>   int xe_guc_min_load_for_hwconfig(struct xe_guc *guc);
>>   int xe_guc_enable_communication(struct xe_guc *guc);
>> +void xe_guc_disable_communication(struct xe_guc *guc);
>>   int xe_guc_suspend(struct xe_guc *guc);
>>   void xe_guc_notify(struct xe_guc *guc);
>>   int xe_guc_auth_huc(struct xe_guc *guc, u32 rsa_addr);
>> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
>> index 3a8751a8b92d..35cf67b2c2f8 100644
>> --- a/drivers/gpu/drm/xe/xe_uc.c
>> +++ b/drivers/gpu/drm/xe/xe_uc.c
>> @@ -13,6 +13,7 @@
>>   #include "xe_gt_printk.h"
>>   #include "xe_gt_sriov_vf.h"
>>   #include "xe_guc.h"
>> +#include "xe_guc_ct.h"
>>   #include "xe_guc_pc.h"
>>   #include "xe_guc_engine_activity.h"
>>   #include "xe_huc.h"
>> @@ -157,19 +158,23 @@ static int vf_uc_init_hw(struct xe_uc *uc)
>>   
>>   	err = xe_guc_enable_communication(&uc->guc);
>>   	if (err)
>> -		return err;
>> +		goto err_out;
> 
> I feel like if xe_guc_enable_communication fails, we shouldn't need to
> disable it afterwards, as it should already not be enabled.  Specifically,
> xe_guc_enable_communication fails only when xe_guc_ct_enable fails,
> which would indicate that it wasn't enabled.
> 
> Well... okay, xe_guc_enable_communication can also return an error
> value if xe_memirq_init_guc fails, but this is only the case for systems
> where IS_SRIOV_VF and xe_device_has_memirq return true, which
> isn't a significant subset of systems.  And besides that, if
> xe_memirq_init_guc fails, then we don't even run xe_guc_ct_enable.
> 
> So, either way, the GuC CT shouldn't have been enabled if
> xe_guc_enable_communication failed.  Ergo, we shouldn't need to
> call xe_guc_ct_disable to disable a GuC CT that failed to be enabled.
#1 Yes, either way, if xe_guc_enable_communication returns non zero, ct 
is not enabled yet, so disable is not neccessary here. Will fix it in 
next rev.>
> Though maybe we need to very specifically xe_guc_ct_set_state here
> to declare the CT as disabled to GuC so it doesn't try to access it?  I can
> see that being the case.
If xe_guc_enable_communication returns 0, it means ct is enabled, so 
with the above #1 fix, seems no need to check.>
> If this needs to be fixed, then fix it first, but otherwise:
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> -Jonathan Cavitt
Thanks for review. :-)
New rev will be post shortly.

> 
>>   
>>   	err = xe_gt_sriov_vf_connect(uc_to_gt(uc));
>>   	if (err)
>> -		return err;
>> +		goto err_out;
>>   
>>   	uc->guc.submission_state.enabled = true;
>>   
>>   	err = xe_gt_record_default_lrcs(uc_to_gt(uc));
>>   	if (err)
>> -		return err;
>> +		goto err_out;
>>   
>>   	return 0;
>> +
>> +err_out:
>> +	xe_guc_disable_communication(&uc->guc);
>> +	return err;
>>   }
>>   
>>   /*
>> @@ -197,19 +202,19 @@ int xe_uc_init_hw(struct xe_uc *uc)
>>   
>>   	ret = xe_guc_enable_communication(&uc->guc);
>>   	if (ret)
>> -		return ret;
>> +		goto err_out;
>>   
>>   	ret = xe_gt_record_default_lrcs(uc_to_gt(uc));
>>   	if (ret)
>> -		return ret;
>> +		goto err_out;
>>   
>>   	ret = xe_guc_post_load_init(&uc->guc);
>>   	if (ret)
>> -		return ret;
>> +		goto err_out;
>>   
>>   	ret = xe_guc_pc_start(&uc->guc.pc);
>>   	if (ret)
>> -		return ret;
>> +		goto err_out;
>>   
>>   	xe_guc_engine_activity_enable_stats(&uc->guc);
>>   
>> @@ -221,6 +226,10 @@ int xe_uc_init_hw(struct xe_uc *uc)
>>   	xe_gsc_load_start(&uc->gsc);
>>   
>>   	return 0;
>> +
>> +err_out:
>> +	xe_guc_disable_communication(&uc->guc);
>> +	return ret;
>>   }
>>   
>>   int xe_uc_fini_hw(struct xe_uc *uc)
>> -- 
>> 2.34.1
>>
>>

