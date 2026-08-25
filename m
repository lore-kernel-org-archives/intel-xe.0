Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 743EBC61DBE
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 10:53:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2090F10E9DF;
	Tue, 25 Aug 2026 10:53:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M4Xpw67+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D45A910E9DF
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Aug 2026 10:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787655225; x=1819191225;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lRMzreJab4T5uGmWMoe7f4YtjMjDMy5PCgOpAU7YzTw=;
 b=M4Xpw67+xbXnj6wR9VF46vk7+gWkLGE4A7qdcZzF3Wa486zzUkGqP8/W
 94WKyQ2/Hq0zAAmtr9iDrjm6uYU8n5eAJ72r5yHbdSH9jxtk2laTVNXd6
 P9j4PFS9nChLI/kzU2AlxFWnCWWWcewvCvu2KlwhYxWKvjLuMqUjKyoO0
 vgf/KJkFgP9KI8XkhOUQ+bJE3BVR0IomW4+reSrJqG2auQd8qYasy5Kn9
 CuCcDnV2kiR05/llgzZAjU76e5y2czkmxc+v269P4F2ByFOGNVlbWqzNH
 xYg3flapa3nE5ZtUVfZ2EBgzeTDSKoSG+HN/txa8QW5Lp1SefI542e3tC w==;
X-CSE-ConnectionGUID: oJym7GpVT+qUUniLh8cq0A==
X-CSE-MsgGUID: OxM4XQxuRp2GQ7gXDgy4ew==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="87977769"
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; d="scan'208";a="87977769"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 03:53:45 -0700
X-CSE-ConnectionGUID: BzLlZjstQNirJU+1c5PwjQ==
X-CSE-MsgGUID: D/A/+Wd/QlaPBvh9majjdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; d="scan'208";a="267301865"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 03:53:45 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 25 Aug 2026 03:53:44 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 25 Aug 2026 03:53:44 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.20) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 25 Aug 2026 03:53:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GoFRb19aMEf5JKBvzvaoSaRzXE4IfrxIozVy2iOvsELhqUKeZ1tRcXLEi0jb0ITX4o1uJQIqaT3pyGaTh3E/Kph1MV6MMgu93P6m79Tao9JzyvnVhaSDPEUVpUqBqHGHHOQw7KA2y6fNnE/cjXC0EuPkbMGbOONGfb++QEtklrHAwXXkqjK8g1Uvg8UMCn6G1E8yHNwAS/fz4gI6gVL6GE2GCx9qwqH93sAeZjIn62/d0wCgYXFqU/+/+4poxCV9uSinUDFKnyVIVnSwfVvHOjQOWQMfAplYlhL8glrSh3MpLpd/b5wgj8V6vyRSIYcF6KY3TAmLPT92MszeFkz7Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=25p4DijLnKi0q5YoUmb2xy0+I6+qJrFajcYEQZBedDU=;
 b=GHwQgIZ4nI8knMb6r1SeVTQGcitcMka+8OGskVOz4p2aWNVT/sQu84oHftUa/nYYFpTDJyeT9HPoBQ2F3nNPMvDe2vYymSeSkoYvBn04dzhROcrI2XSro3MqslZVhVwPDADsAwCPGlKzvtpWuJVEyORCdGEfjv9TMK7ggU/HgzAyvzPNHdit1KK3a9N9J1cdEIEjYe1fgt/+MRo7micbgiuGoKA5fgejfrmN0ZIF7udtqFi7hGE3+BVzEjhoJnOxsfxZp0ahyWMWbWST6O2CFB1PIn9oZuqfMWiwPMUiiVM+EIbYGH2Xy4X2sZ3CUiCI6ksAZyd9C3xam77vXNhcYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB6195.namprd11.prod.outlook.com (2603:10b6:208:3e9::8)
 by MW4PR11MB7079.namprd11.prod.outlook.com (2603:10b6:303:22b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 10:53:39 +0000
Received: from IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391]) by IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391%3]) with mapi id 15.21.0360.005; Tue, 25 Aug 2026
 10:53:39 +0000
Message-ID: <0de98b7e-2c74-4af5-933d-2c14f367ba71@intel.com>
Date: Tue, 25 Aug 2026 12:53:35 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drm/xe/guc: Allow GuC CT for wedged device
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>,
 <michal.wajdeczko@intel.com>, <daniele.ceraolospurio@intel.com>,
 <sk.anirban@intel.com>
References: <20260821122114.567725-1-raag.jadav@intel.com>
 <4ad586b1-14c5-4cd4-98aa-056cb47265a8@intel.com>
 <ao1okNN6fR9mQ0cM@black.igk.intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <ao1okNN6fR9mQ0cM@black.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIUP296CA0050.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:34b::11) To IA1PR11MB6195.namprd11.prod.outlook.com
 (2603:10b6:208:3e9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB6195:EE_|MW4PR11MB7079:EE_
X-MS-Office365-Filtering-Correlation-Id: d73be846-a4a3-4b8c-d44b-08df02971f30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|10067099003|4143699003|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: xA+vZx72flHOE/jnFXR1yldWbyybVuxErAGvL2Y6VCGrHD1vQppuCKEFK+WVWVkRApWkvbKvd28OuBXpxYmUbZUUsWOv4xY/kJ0OiTn/Ur8Xg+nmn1r9JbXo8RAWoMoHqoc8pGv8yiAGu5p1y6CodtWpVnK4UxSjFh44dxz7WDBlreN2AIlOf6AB8t3IIQKGRypIY4jRQqYY4pCLgDBjXdy0jWEwpumB0cQYZHq+FURcURK0QmzNSy9LQATZ93IVM0JCC/fBLIoWMGaq4L0xv3RN/gCRoDjayvgOdRJkM120tI0dqJY/1U3WCT37SRYXcopkCrw/pCuYfFSOu4IopfTWomJujYzCKi+ORyWP6SfYBp9yNoqOgJNYwNMqwRLNgMkS1hmAGBt6UOQta0rTHz4b2gXQRXw5iEPOZq2j58ueaeCxdemd7BX4jATt79tDPTBlRu5YMkkJLFuVeWYuyuROKfmaoGiRwW0XaRi4OXHhmFJjJOOM7mOlS1gp9LESow6+eHEToziw9zuxUG5fPNzpPTQkEHMPSlOZgXezEfan5jLEBuqV+kAVw/WiX67WOos8f7pcDm6o/Lt96CWbRh9J6sZWNRUyyUyXeKr2Dt2PMir25lP6SKyU/6FvnksodrGRWmmkLvdKRPP6l66f14+nTenBpjjZuii++Mp96rs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6195.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(10067099003)(4143699003)(22082099003)(18002099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Wkl1a2liMjJwS3BidTk0NE44eEhkTHd1T1c2T3JNY2tibVhvdmRSWmZpWWxL?=
 =?utf-8?B?RTFKaVBLRWh3TEJiN2xDQ2xoNEIzTDZNOXJaaEhqWjRHQkJXNWxtQ1VYcSs1?=
 =?utf-8?B?Mm5LaXpXYkloRXJaWTZjTE1HczNiZ0QzYzdMQVpzVkFpbVMzcFk2c3JJVXo3?=
 =?utf-8?B?c08rNmNhUDExMmpqbUhiLzVSUHJrSS9YSk4xUFZuNVRjVHg3RlIxb1F5eHBR?=
 =?utf-8?B?cmx4ZkltSnpkSW9VanFuLzgwblM4UERMbHltSkEwQUNmSG4rL3J4dnFOK2tJ?=
 =?utf-8?B?SDhqdVNlTTVydUNSejU3RWE3UHJEcFV4Vm5CSzJQamZDMHJLOFB3emFLTUVX?=
 =?utf-8?B?amNmY1NjeEVxWVhtNTdEMzRDNUtuSVpNcFVycTdEVFA3NkhjS1ZKWFBJcS8r?=
 =?utf-8?B?cXNyV3FVUEtjSkp6QWtCNDVHdEp3Sm5IM2k5WEFWL2lFVEM2bzNJQXFZbzBW?=
 =?utf-8?B?K2lqV2hVVXBiUzlXSFhpOGR1NWFOWktyL2ZkOVFNRFBYbW10NFZiVGF3WUht?=
 =?utf-8?B?eWt2SFYwVlZXSitYNW5vMDNBWGNENUR3TncvN1h4cWlJMDJtQkJFSHlMdXFp?=
 =?utf-8?B?a3NMV3hqZGNKWThGbGowaGVDWEdpOGNJUmtRaDVIQlMxRElyckdpWm1HT0p6?=
 =?utf-8?B?eTBuQm9Qb05CL29MQjM4U2lVNWU2aHBacVJJQ3pEZGxuUzBjbUJMVTBmaG5s?=
 =?utf-8?B?WkwyOStMdkdxdVJxQ2I2THRGYmlwNDF1ZWxSTWNXUFNsNSszSFhGZlpwNXJB?=
 =?utf-8?B?eHI3dlhuSk1DNUYyY1RqNGdIZzlCdS8zOUtFYXBmcE1meHBpdWxSM1ZDbXpu?=
 =?utf-8?B?YXZFSm9Yakt2UUwvTDlxNzgyUFB3cGNVVWllUHhnOGJKTVRTRHg3OE9LUEQz?=
 =?utf-8?B?azU3cDkwVkxicEwwZk5rbmllaHVjZ2F0ekU1ZGl1ZlBSei80UFh0aWJsemxR?=
 =?utf-8?B?RXZQbU5QVHdBallkLy9IbXdaZGVVNVFPVUpXVUFUTDFvYkozNFZUV1lna0I0?=
 =?utf-8?B?aXkzK2hxYzRHcG1NMGhiMVNvSFArTkh2OVM4c0RoZEtCL2dYWCtRcXg0UURI?=
 =?utf-8?B?dGY4d1ZlV1VyZFNtM3YwcVpuYUxjZTd6dTFkVHh0cU5kNzMxRTU1TWxmZGdX?=
 =?utf-8?B?ZzB0dVcxNEdobG9FNFN3MEFBTkpYNWQ3OGNOeGg2Skw1RjRKWlhZcmp4Zlo5?=
 =?utf-8?B?WHNUdkZpWjV1R2pwZFpBOXZWQXpnNXk1cVd2U2hNdnB5eWNIcEE5Rkt2Q1J3?=
 =?utf-8?B?ZjVZdml4RTJWQTd1L2hMazh6TDB0dWFUeWp1cHBOM00ray9MU2U0d2RycVBx?=
 =?utf-8?B?clVTdURsY3BQR200ODF3SFJRa1AxTkxsZHIvSTcwQWtDdlVjSnBqQ1Nua212?=
 =?utf-8?B?WXpsQmZ3UlpQTG1pdTFNcktndGI2cTNuOHdJSjlVR3pRR2d1dnlvWnM2ZVlH?=
 =?utf-8?B?ditIdnk2YWhIRFJDckkzS2R5RnJOUVFyOEYzSHNDb2xOS0xZWW1MdnVpQ21y?=
 =?utf-8?B?Y1NIZlhkaGtQcFdsU3lobnQ3YmI4UHZzVFpISFA5WDVBZ00rUnpxcEMzTU5X?=
 =?utf-8?B?SGhIaC8zVFZ3LzNrV0ljVHk5ZzNVdnV1OHhwY3V3TUhaTm1mRTdaWWFKaExt?=
 =?utf-8?B?MElTMkpFdnBBRnJ5TXN3TFJoNVJyUTBNYm85M0tQeG9mbVFHUGZkdkFoLzJ3?=
 =?utf-8?B?ME5ZcWRFUnplOGloT0JhaktzbWsyMHNjUHlITVZnbm9GLzdEQ3RmY0dWcFdX?=
 =?utf-8?B?aCtKQ2QxU0ZFWWFJaUs1Z0pKRGhBWUtnY0x0cjRlRDBSN0pDaFpWS2h1NjRY?=
 =?utf-8?B?K0ZTMENxUEdsdFR0MEM0VXIwR2JnTy85K2FGbldIVHEyOXlrdmU0eFRNcFVm?=
 =?utf-8?B?eStVTVpDeTcwRUVZMWgxTVR6bW9UejhvNDFBZVpFMEl4YlhycVV3aGs3eFMz?=
 =?utf-8?B?S0RhemgzNURpZG55dlpvR1lYSjl3eHN6dUZqQWQrenJsb3g0aGxMUXRwcnlU?=
 =?utf-8?B?dkFYYmVsYkRhbjFrYkVXc1JMY01uekROZ3J5T2JtTUhjV2NSbUVDTDMzUTdC?=
 =?utf-8?B?VEU1UE0xNUxkT3FickVreDZxSHh0TXh4cDNxNVJ6Y1h3dndTRWQvWlZFTVV5?=
 =?utf-8?B?U0JRemVlUGNicC9iYWFpKzhwbVlRa1Q5TzdqZ1FkNUFtSTJIQzJ3UHhMT3VX?=
 =?utf-8?B?K1JDZk1ZTUk0b2poUEtLUlhNcGxUZjBTVFNZSUF1ZEY2bXhJd3hSTCtsM0Jm?=
 =?utf-8?B?MUtCdEU2TGVncm5jTnJjNGcyUWdhQVlscnBwRVBKYmFMYjgzZ1g0N3RCR2tP?=
 =?utf-8?B?RlhWM0doWEo0QjI3LzRiakdRcWZZUWFSalp6TWVYQjJIbFhycmV3UT09?=
X-Exchange-RoutingPolicyChecked: 3bdtwD+g/cb7q7hBEdbOrVhSRDZwY0IRIuKH9ufK0uH6JQDj5n3inqt4U+SAwet0N/++K+fiH1BhRfxRaK/0ANFT3xYnZ8IL/ltygDD1f7pTlk5OYRBYe05r2Ngss8MV3f0XPshocbEE+ukqXWERL2WmCoQOgLbgrSqUUzaO4n0IBQCQBMNpp3F1DenaHY1YGRGO+LQBrJsBginYykhsx7r193VZo1+unBzoByNok5Jayq7ePeQG8xA+HJ/bjHS4bLWXssCGQJqD/uspISbCqcWkNnVHi3SwhcVysbyZxfRgfqWYj+9Jur5NE1E7r5B0RMYNewdCrBP2z3l6qbqs1Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: d73be846-a4a3-4b8c-d44b-08df02971f30
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6195.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 10:53:39.7528 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vdc0w/4WFATi6rUzawtLbW4oheeFThkl+gtG3jujY0LGh7XhgWB+eepmnqpHVWEQma4kzK7SBAj1ZoeirEMdgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7079
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


On 8/25/2026 12:04, Raag Jadav wrote:
> On Tue, Aug 25, 2026 at 11:39:44AM +0200, Laguna, Lukasz wrote:
>> On 8/21/2026 14:21, Raag Jadav wrote:
>>> Commit 50fa9acac26f ("drm/xe/guc: distinguish wedged from recoverable
>>> cancellation") introduced distinguishable error codes for g2h failure
>>> cases, but also blocked GuC CT for wedged device. This is problematic
>>> in cases where we want to prevent user from accessing the device but
>>> also keep GuC CT functioning on temporarily wedged device. First user
>>> of such requirement is PCIe FLR handling where we require uC firmware
>>> loading while the device is temporarily wedged.
>>>
>>> Fixes: 50fa9acac26f ("drm/xe/guc: distinguish wedged from recoverable cancellation")
>>> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
>>> ---
>>>    drivers/gpu/drm/xe/xe_guc_ct.c | 8 --------
>>>    1 file changed, 8 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
>>> index 5c4733da385c..97e38147effd 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>>> @@ -1062,11 +1062,6 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
>>>    	xe_gt_assert(gt, g2h_len || !num_g2h);
>>>    	lockdep_assert_held(&ct->lock);
>>> -	if (xe_device_wedged(ct_to_xe(ct))) {
>>> -		ret = -ENOTRECOVERABLE;
>>> -		goto out;
>>> -	}
>>> -
>>>    	if (unlikely(ct->ctbs.h2g.info.broken)) {
>>>    		ret = -EPIPE;
>>>    		goto out;
>>> @@ -1813,9 +1808,6 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>>>    	xe_gt_assert(gt, xe_guc_ct_initialized(ct));
>>>    	lockdep_assert_held(&ct->fast_lock);
>>> -	if (xe_device_wedged(xe))
>>> -		return -ENOTRECOVERABLE;
>>> -
>>>    	if (ct->state == XE_GUC_CT_STATE_DISABLED)
>>>    		return -ENODEV;
>> There's also third instance in guc_ct_send_recv().
>>
>> Shouldn't we distinguish between temporary and permanent wedge here rather
>> than removing the checks entirely?
> I thought of adding a xe_device_wedged_perm() but this would create
> confusion with existing xe_device_wedged() regardling it's usage.
> So perhaps we need a better name? Or a better idea? Open to suggestions.

What about xe_device_needs_recovery()?
In this case, we should also change the ENOTRECOVERABLE to something 
else, maybe ENOLINK or ESHUTDOWN?

Lukasz

>> And it looks like it should be a part of the FLR series. This patch doesn't
>> make sense without this series, and FLR series doesn't work without it.
>> I'm also not sure if it deserves the fixes tag, it wasn't broken at the
>> time.
> Agree, will add it as part of FLR series once we have some conclusion.
>
> Raag
