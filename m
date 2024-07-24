Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71C30C3DA61
	for <intel-xe@archiver.kernel.org>; Wed, 24 Jul 2024 21:04:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D32BC10E147;
	Wed, 24 Jul 2024 21:04:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nmY3PZ4x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C93A10E147
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Jul 2024 21:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721855082; x=1753391082;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=MVYvHL6VUKdvrKy4x5vMaNcD2q/ZgZZXdiiz/O7pSkg=;
 b=nmY3PZ4x5QGU7+ylq3We2oxL3XU46P1O3m7OmjAAHfrPHlXJ/hFydGVH
 H65ZVNGaInYua/DUTYD6Mz1kTO6x/vy7hlxHCXhRguJVY2C6Ec2oYHlLd
 b0Zg7FDcTNGJeahJWHiCJdAMKvfXhFAl1IH7MCr+8Q1CW+N/O7wVzKAM9
 5MH+hNfP9CurQsAolUJIX1BjBJiOba74fJVMXSP8uCja2ouZ/wyUs5z+y
 mGztRxx5GfV0k0FmxpWG7GscCv5mwYvE0aQm9BaAnFt0vhCoJM7w0Yc43
 DXgMNtgIQH8Hbb4SSTp89NZRupEfn88NQ4QKzt/U7H/QtB+RRszYrGPTl w==;
X-CSE-ConnectionGUID: k7TLEaDFR+WeGZaxB1QGZA==
X-CSE-MsgGUID: uAhkJ42GSdqgRrP1v7nDvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11143"; a="23370259"
X-IronPort-AV: E=Sophos;i="6.09,233,1716274800"; d="scan'208";a="23370259"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2024 14:04:41 -0700
X-CSE-ConnectionGUID: zvsfegkYTS6pPbS/l7fXUg==
X-CSE-MsgGUID: Gj6NE3UARSCCZAKvNPIixA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,233,1716274800"; d="scan'208";a="56850260"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Jul 2024 14:04:42 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 24 Jul 2024 14:04:41 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 24 Jul 2024 14:04:40 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 24 Jul 2024 14:04:40 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.44) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 24 Jul 2024 14:04:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=akz3Pg6NgQY+Usx26xrttSMM4EwqGON3LPxKuA7R7nR752Q86/wkNQdAPlufI44U9TGGNnhYZ/J+GGK4GchtfP8gQuHuFLmieOU3xLGW9gBYyQ33oOfFFeLsyTTqY/iBQhqbSSlgHjpWB0p5voOHcEJsL89kIwsQGcyOoP1aP2f/LpXhpoLbvyG2HWXULAlBs1u8dYF29I8/ceptFGqJ/cpmDn3ucowtF0i09IM6dg+kszHHuigH4PgC+4j2G69XcWCXI6U8+3upiZOKJMhN5iABTUocXWGQcJpT4WGaGOyt/Eb7oup4iu/cSrD7htM9DSPCNfTuJHFTwwudN3rnQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GSxkjj9QEXmh7qcKN5LorFYI4Uy8uRCEAP04AUDIt6g=;
 b=uW89PXRBUV2Gpx7HYWS0D10WuY6HXhkvEumR9F4P5B3qEW8o8rVU/8SoACEwLag2o3PI268AqkyIKsD1Mzf50hDrSBGQ8ujTD15SyynDsVnsSBoO2Jsx4fKuTmExJHBRKCGLb6WWKIsHKT4mP0HhnJToQUFhwbCrCUg2/r7uquDWs7uLIJiUAr9IdkIm5B0RHBdr44GGB3eOfNnpeMzinNrGBseKomhKVnn+ZYLqidcRdzcL7CA+ojAhqkTx0EQXNiZIpLFQB2sMv3+bKoyMobIWm/hXiR98oJ9806i8k0Rv8kvjq8msfs229kyw+7L74fq3x4L04rGGdpwEkOxQtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by DS7PR11MB7951.namprd11.prod.outlook.com (2603:10b6:8:eb::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.28; Wed, 24 Jul
 2024 21:04:36 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%7]) with mapi id 15.20.7784.013; Wed, 24 Jul 2024
 21:04:36 +0000
Message-ID: <e46ecad3-9343-46f5-8994-818e6362dc87@intel.com>
Date: Wed, 24 Jul 2024 14:04:34 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [CI] drm/xe/guc: Enable w/a 14022293748 and 22019794406
To: Julia Filipchuk <julia.filipchuk@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20240719230525.2444543-1-julia.filipchuk@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20240719230525.2444543-1-julia.filipchuk@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0P220CA0002.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::10) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|DS7PR11MB7951:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d2fe076-0a1b-4f44-c3d9-08dcac243959
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OU1pZ2V3Z0kwbTJ6amNydi9GQzlGbDc4d05SMW9rZ2pGQmtuUkhHbGtWdVRx?=
 =?utf-8?B?L3VkaS9EQi9KK3ZRZExYQTdBT2VzVlVLUERUeEF0WWovc1Y3cTJweXQrZlU5?=
 =?utf-8?B?UU9HUk9tSVhWQjRKVnVzOStHZGQrUWN3akI3NVBIOS83SlpMcGVDcUZFRWVq?=
 =?utf-8?B?L3c3MkFVbnowMHNoNDJyQWZramJreUR0QVNLei80SU9qZENJS2R2akZ5SFlB?=
 =?utf-8?B?VGp6WmhTMjZ3eVN1amlzSXBhZHF0dlJWNnU4VGMzeEJET1BTeWlINnNnRnU1?=
 =?utf-8?B?RUNZcGhEak5oaE9XMjNjZ2wrRis5OEE5VGlHZGNDWEFmV0s2OVgzK083L010?=
 =?utf-8?B?NnR1bEFsd21rS2o3eHZmUWpWRnhRQmJBVjBYZmdhaERJYWlrUS8zWWY1R1dR?=
 =?utf-8?B?OFd2Rnl6N1FDOW45SUxRZ0V5cVhRbVhPYzErVmxEZXZYc295UUVEZlQrYnpJ?=
 =?utf-8?B?aHhmV2x0K0ZERlM1UmJzanhrOGttaWFJWWJrSHdiSitaUVFFM2RWWlJBOXNP?=
 =?utf-8?B?d1dDb2gwNkx3M0RpT1BlR0Q0TWpZam9XSEFmUjFYTnJRMlNaWVRjRTA0L1N5?=
 =?utf-8?B?Z2JZMDV0NkNvckZDT3l6R3BXQVRLYkVJcGU3KzRIS0RJczNUK0xWdWZQNGZW?=
 =?utf-8?B?RDVwc1pXRnh1ZjVRSmUxaUE1R2JnUUZlMlRnTXRWb0pzS3VJSjNvK1drVUI3?=
 =?utf-8?B?WkNESmdScTMvalRvdUllaW55RlNpWnpLK3NkbXJwdHpYc1JBOUMxNzU1MEVv?=
 =?utf-8?B?OXZZUVN3THhPek1Cek1aU1IrZHZXcmxjbjZoTDFnYTNxaGFHT3dxazNNSU51?=
 =?utf-8?B?ZFZ6SXFGZElWVWRCMTZPMDRRejJscktZQU9tcnl4NGNZZFhSbWpKdHU3WU0z?=
 =?utf-8?B?UlQ2TlRDUVpkQngwUzlYREZ2UWI5SGRWeWkxSVpEdmNoNjltU2I0SkV6V3Jx?=
 =?utf-8?B?c2FSbW5sbnlEWHVjc21xdDVxYTF4aFJ4S1ZnWjVtUmRPVzUyT1NlTlpxcklG?=
 =?utf-8?B?eUMrMkxpVGs2eFRXTUM2dG5UTlZ2QjFFZFdZeUdIY0RFc053dlN3aFJQblhi?=
 =?utf-8?B?a1RvRjZVem82MDlZdUFQMy9aRStJK3p3MVczZVpvU29yeHc4aklRZ0dXMWND?=
 =?utf-8?B?YWtRcC8xUWwvQmduZDdObUh5cWFJclVIUkhZZGVVbi91NzE0WjFhdkxUTkdH?=
 =?utf-8?B?UjcrOFBTTkZNcXlEVm5tZGMxWnpKalc3anRIcjIwTmNlMmxLUkxsZjc1eUVR?=
 =?utf-8?B?VWJCU0VpZHZYNkJ5WlA5bnVvTHM4dGpuMDlvRlMvSkM3Z2k5QTBXdTluQmNo?=
 =?utf-8?B?RXZuU2l6VVhTNlNRL0lsTWNIVTVYUFdBNDVYUkZpblVyVzdEL3djZXBLY1Vx?=
 =?utf-8?B?ajBNM05NUnN4WFBOM0E2eUpYNGlVZjRoc082NlZYMVR2TzlEblFnckloTzFL?=
 =?utf-8?B?Q08wRXc2WDFrUkpOSjJ0WlNBNFl6OHk5akNGcHVHZUltdVBYQ1FFWUw2RG8v?=
 =?utf-8?B?UXF3eENYL1B5NWwzNEkxc2pFakFiM1lrd3lmOWcxQkdROWFLcXlDMXhBU2t6?=
 =?utf-8?B?ZkhWYnY4dkRqTUJsNW1XMWo0clVneTFCYnBLU3lKK2pHbGk3b1FPdFFsVFBm?=
 =?utf-8?B?TTBFVnRxT20yejQ5Y1VjeXdTTzBHRE5GYlZwSUtCNFIwdEI5VERIM1k1eXQz?=
 =?utf-8?B?OHhUajdPV0NHRlowQWJIQzQ1bDRnU1U0ZnhITmxzL3J4Sm1JbEJ6RnlkSXcz?=
 =?utf-8?B?dkQwdUNFYWI0NGZZVjFKTzJuclc2S1JtcmxhdGJ5VkpIb3RYVk44bnUxZFNj?=
 =?utf-8?B?bmdCVnlmczJRa2M0VVJnQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VVRST3l3VmgxL2hWaXB6SG1FUzcyRWJiazVnZ2pya0VLR3JCdnRlNTlOUUJt?=
 =?utf-8?B?VGJWZDdmcEZ1eXBpYWRSNlM2SGJVelVHclR5RWRCNkVLbVMvclhMaVkwMTl6?=
 =?utf-8?B?SjhKbWdRWUp0OFBNUFBDeUxhVEdibEtTZkVPRUZGRkpGWWJ3Q051U08rdFha?=
 =?utf-8?B?QU00KzNqNGhpVklZV211MlJMZWIrdFNXcG5NRHkyNHNGQjRhT3Z3UmhhdlAz?=
 =?utf-8?B?OWVpalhmVnQ3UWtpRVNDOCs0KzhXU0lRTUk5WmJUVkdjTTMrNlhUSmdJbmE1?=
 =?utf-8?B?ZWU2UnN0djQyOGoyNnpVcTdVS1dZL0NvS21YRkJZbHF2TE5TQi9iQWpvbnhD?=
 =?utf-8?B?ZWExRWRJbUNnRUJrR3pZSWQ5VStTUGJtOWdqNUtNeFVpczlobDV4NEQwb1lP?=
 =?utf-8?B?dnhZa3BLbnR1WHdrWEIxSjYxS0hSVC80WThRVnpWUk82MEt6NEhuRGxFU0l0?=
 =?utf-8?B?aW45bVpTbFNNV3FjZk9obUpuY0dxQmd0R1NSa0Izdk9oUmNCd0E4OFZZeUJV?=
 =?utf-8?B?RnNpSjkwQ3oxdCtQOTZzTm10LzI0MkZJN09Yd0tTZjZVSVRBdWdWTDdPb1pF?=
 =?utf-8?B?YXc5K2hwTmMrNzhSR04vaVVzdXBPSmxObVpDc2RjR2cvK1VlT3FOVXMwN25S?=
 =?utf-8?B?b2VVUE9HQms3WFpPZlhwLzA0M00wMko2V1N6d1c1ZVpnM0k1VXdwaHVDRHFV?=
 =?utf-8?B?TTQ1aUVZNmpMcWc3L2NEVEFRblN1cjJrR0dOVUV5OTk3TG05dWZ1VmRZK2wy?=
 =?utf-8?B?b2ZWMTdUd0NqT1liRzdwQ3MxSVVWVXVhOFFleDdnYkZINTFtYU14SXUwdTUv?=
 =?utf-8?B?bkYyUmFFUkQwVHgzL1JPTzNjRHkyRnhNRVFCZ1VWS0NTaHp0VHdsSEZieW5S?=
 =?utf-8?B?Ky83T24vUllnNDFBai9QazJ5T1NtR091NkNFWkVyQk1ZcjVBSWdlUzhKc09h?=
 =?utf-8?B?a05WT1hvdHRsZmhrbk9kWlcrYXlPdXVXcHVheCtUa01ZdWI2amlFdUUvWFRo?=
 =?utf-8?B?eVB3QThjOUhoU0JmZ2d6dHY4TWx6S1ZvdVZkTHZHS3RMN0IzVXlUK1QwRC82?=
 =?utf-8?B?R0NYZGVST3hvVEdrMzVTZ1ltZWhoajlzVXdMS0N1NTE0SFl3SmIzNUNEc1Bn?=
 =?utf-8?B?VE4zUU4ydFRzeHoyRUNkWjdoS2RoYjNockxObDVicWcyUjFOa2tvYmczbEx5?=
 =?utf-8?B?WG9OL1prMTRTbXJ6ZjRFWTdURUZCczVWMWxlTVU2UkVqVHFkZ2hnL1B0cC9a?=
 =?utf-8?B?QzIrUjJNMXF6WnpkSXp0aGlhZUtBaEYrNW1hQkNFaW15MGF4VDJ5UzZIWmFt?=
 =?utf-8?B?cUU1QXRoWkI4Z0hrS0svWU5CMU1xcTBDM3RQM1E3VWJ2RkJDRnFZdmJ5ZXp2?=
 =?utf-8?B?c3BYU1hnLzFpelFLYW5EeDNyZTgzdE1RRXNKSzFER2xoaHowMFVCVHNkSVdx?=
 =?utf-8?B?dU5KVzBjMDd6MzdJZWkzSW1yaVdJd1Flc1ZYNGZjdmgyb00zMGlSZ211aVkv?=
 =?utf-8?B?Z1dkSjkyekxlRkF1UEFjS3Q4QzBYUXJ0S0t1b0hGTmV4eUhjb0NBMjdEdEt6?=
 =?utf-8?B?Ny9lSExNSGdhZXJMMGozajBCUWdEdVBnd1BEYXpPMG1sUGM1c3B6LzAxU213?=
 =?utf-8?B?RkxaZXJpTXVXTkFVQW1BTmxpV2dNL1hHdHRwVHJGZ3A5bm5SU0crUjdJS3Vj?=
 =?utf-8?B?eFBNSFZjSTc3TmhVYzVhZ1dqYTNDRkhicDRKdXNaVXB4dG9ISmtmZnhRcGdE?=
 =?utf-8?B?WFcwTWlNUU1JUEN3ZHlTM0NPTHFBRXRSTjcxZ0VmVldvMno3WU40OEM3Nlgw?=
 =?utf-8?B?eXVwQndCaHNpRkFHaEMyWDI3VWE5WFplZ1ZqTmJqRS9ZVFo1c0d6WFZNSGZx?=
 =?utf-8?B?SmVkdkVJdjE1MlRLRUs5WTh0bUdNcjZlaWVFTXVrU2FldGNYSlhMNDR0UnRx?=
 =?utf-8?B?YWQ1SmFmSVgzT3Z4c2czcnRveEx5WnVyNVhyUkU3ZkUrcWZjdUFVanN5Y1Rr?=
 =?utf-8?B?Y1ZNTHkwMloyR1gzM250LytKcGJ0dXJoOVg3UHVyeklVZHNxUVRmMWlRUDE0?=
 =?utf-8?B?bGhlaG8zQ0FBVGVkcEFEaG9yV2twMS9YN2lSVTFBUmRyRjN2TXJBNjZrYmNX?=
 =?utf-8?B?ZCtUajRWWGhDZDBtQmdKczV2VjVHK0NONjJSR1NBK21aZjFwWGlpdVNEdDJl?=
 =?utf-8?Q?fdJq1wu1hAKg8dnI0bKIRwA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d2fe076-0a1b-4f44-c3d9-08dcac243959
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2024 21:04:36.2308 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cept1ZgE/bjuUjuZ/wsvkvl15e2Rse1g7naes9zLi7Xu1X/PvQiXN5aNYPNk4y/ai7WKxrhrw6LipiYXMjkSNa77Q8PlD/HPZeUrEPffxQs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7951
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



On 7/19/2024 4:05 PM, Julia Filipchuk wrote:
> Enable workarounds for HW bug where render engine reset fails.

This needs a comment that the WA is only available from GuC 70.29

>
> Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
> ---
> This patch is for testing KLV workarrounds.
>
>   drivers/gpu/drm/xe/abi/guc_klvs_abi.h | 1 +
>   drivers/gpu/drm/xe/xe_guc_ads.c       | 5 +++++
>   drivers/gpu/drm/xe/xe_uc_fw.c         | 4 ++--
>   drivers/gpu/drm/xe/xe_wa_oob.rules    | 2 ++
>   4 files changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> index 8f9f60b28306..6b30743a2f6c 100644
> --- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> @@ -351,6 +351,7 @@ enum xe_guc_klv_ids {
>   	GUC_WORKAROUND_KLV_ID_GAM_PFQ_SHADOW_TAIL_POLLING				= 0x9005,
>   	GUC_WORKAROUND_KLV_ID_DISABLE_MTP_DURING_ASYNC_COMPUTE				= 0x9007,
>   	GUC_WA_KLV_NP_RD_WRITE_TO_CLEAR_RCSM_AT_CGP_LATE_RESTORE			= 0x9008,
> +	GUC_WORKAROUND_KLV_ID_BACK_TO_BACK_RCS_ENGINE_RESET				= 0x9009,
>   };
>   
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index 1c60b685dbc6..3190bb4ce04e 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -367,6 +367,11 @@ static void guc_waklv_init(struct xe_guc_ads *ads)
>   					  0xC40,
>   					  &offset, &remain);
>   
> +	if (XE_WA(gt, 14022293748) && XE_WA(gt, 22019794406))

You need a check on the GuC version here. More comment on the version below.

> +		guc_waklv_enable_simple(ads,
> +					GUC_WORKAROUND_KLV_ID_BACK_TO_BACK_RCS_ENGINE_RESET,
> +					&offset, &remain);
> +
>   	size = guc_ads_waklv_size(ads) - remain;
>   	if (!size)
>   		return;
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
> index c902f4a10f44..d145ce77008e 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> @@ -105,8 +105,8 @@ struct fw_blobs_by_type {
>   };
>   
>   #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)			\
> -	fw_def(BATTLEMAGE,	major_ver(intel-ci/xe,	guc,	bmg,	70, 24, 0))	\
> -	fw_def(LUNARLAKE,	major_ver(intel-ci/xe,	guc,	lnl,	70, 24, 0))	\
> +	fw_def(BATTLEMAGE,	major_ver(intel-ci/xe,	guc,	bmg,	70, 29, 0))	\
> +	fw_def(LUNARLAKE,	major_ver(intel-ci/xe,	guc,	lnl,	70, 29, 0))	\

A couple of notes here:

- The LNL and BMG guc defines are CI-only patches for now, so this 
update can't be done as part of a normal patch meant for the full tree. 
We're planning to move to the official patches very soon, so my 
recommendation would be to drop this change here and just add the 
official patch directly with 70.29

- The version in this list is the recommended version, but the driver 
will still load if an older GuC is found, so setting it here will not 
guarantee that 70.29 will be loaded, so you still need to check when 
setting the WA above. However,  we didn't distribute anything below 
70.29 for LNL and BMG, so we could indeed assume we always have at least 
70.29; if you want to go this way, please add a comment above the WA to 
make it clear why the version check is being omitted.


>   	fw_def(METEORLAKE,	major_ver(i915,	guc,	mtl,	70, 19, 2))	\
>   	fw_def(PVC,		mmp_ver(intel-ci/xe, guc, pvc,	70, 24, 0))	\
>   	fw_def(DG2,		major_ver(i915,	guc,	dg2,	70, 19, 2))	\
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index 540d38603f32..b0d7d4114967 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -27,6 +27,8 @@
>   16022287689	GRAPHICS_VERSION(2001)
>   		GRAPHICS_VERSION(2004)
>   13011645652	GRAPHICS_VERSION(2004)
> +14022293748	GRAPHICS_VERSION(2004)
> +22019794406	GRAPHICS_VERSION(2004)

2004 is LNL, but this also applies to BMG (which is 2001)

Daniele

>   22019338487	MEDIA_VERSION(2000)
>   		GRAPHICS_VERSION(2001)
>   22019338487_display	PLATFORM(LUNARLAKE)

