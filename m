Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2191BD59F7C
	for <intel-xe@archiver.kernel.org>; Wed,  6 Nov 2024 23:49:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1DDB10E174;
	Wed,  6 Nov 2024 23:49:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dkH22BHO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2637B10E174
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Nov 2024 23:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730936997; x=1762472997;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=yiCsny89TTAE4j/ZPysEusmI4sN5gwIpGJYPUvp5eM0=;
 b=dkH22BHOkwMufrTf0Qm1Szo1gl2fIOZ+c/qSEURhds9+IwwgcCdeynrJ
 qQIOq8r+FAmjELVmpVFpvNaWg81qEPIvKLNrjXEGaV29ZXLcqeAn1PJfa
 ym3Mpu6Q6/N9NJ7cEped7DCAxsrgckQyLKi80Y9cN+fQQ7LgaOyj4F10X
 yhEGwMhzujW2RaB9so3SCjpDop+OBVu6cZTMMrWSgiceSKXLnbQbUU6tt
 lzSeaHiJW2jFyQA5DZpzd2tl495Yf5toliScK9Y5TfS7HfhGMN7pVXE8W
 +7vhGsZkQ4BnaOsPZyFZ6klR/6LinYIzlzSbb/eGLxV0X+rTCgjsk37fh A==;
X-CSE-ConnectionGUID: l82RPAKZTIeQ6P5EFHjiRA==
X-CSE-MsgGUID: ngJay4RKSTmhKEw6qthJMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11248"; a="30878974"
X-IronPort-AV: E=Sophos;i="6.11,264,1725346800"; d="scan'208";a="30878974"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2024 15:49:57 -0800
X-CSE-ConnectionGUID: Ts3iu4HKRMy4UWX+Tqxykg==
X-CSE-MsgGUID: VS0LB9XPSkq3+ZEYhczt5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,264,1725346800"; d="scan'208";a="88795472"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Nov 2024 15:49:56 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 6 Nov 2024 15:49:56 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 6 Nov 2024 15:49:56 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.175)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 6 Nov 2024 15:49:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QyHC18i7NYQ4GmgzPXo+MqR5/DjSnDxiYbbQA1yM00ryL+97HwqWQX+/6waUDpbUJtwcBF1yXitPVQwG/d5F2rJAXATiRaHXFL7Wr7rcrDAuo58ljdAcRZSh8JZnppt83GQPqchvkr0QZ+nvmRut9b0b8nxZuEz5unzGzZJ3pqAHlGeFAkRKWZM9CHICP0mYL3YhAncbmkT2EWPGd/4cw8kMVTtR0CUHxNYppcyv6PE5CeEkihdQg+wEzqP15JVQzeN+zLbMh4FgqsYc+iZ9rMrBI2yXqjT0LK2c+XXW48k2/thyf1BOcsTD2wNJuH3TLW5rAa62b98gsLq5HkYSZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HTuHh+th3mnH/aPPpKu/ZcbQn4/6uBFJ6QWZ4VSUOU8=;
 b=DA0we62NtWuU/gyIdRdc5EIIrdT+DqZklP/IwUStphJ5ZwKKAUbjztc+/38lAmpaKTPuU5PCnxKWt1boSOIYbNBIni5D34X29Ui5k6x19FiFCSyWpW9KmRSyMg29gi+DXxIeSI7UkVDkp902/B/2C04r88t44bHK9CZXop1zjQNS3yCMBg2NZ/xTfzAiZeYrK3m55fgSVzSh+g03C2XIf7bltL9gOw5yv8w9ssmI2JeZTexMGeoBM6cU7GiL7/440/3MCNh1Exty2jCMzwilidYIlEEQq6HvryE8bxaslCKj+icGH3L/BuscQyCv93P2VxD3N4CrtDbi32pKfkOcnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by DM4PR11MB6261.namprd11.prod.outlook.com (2603:10b6:8:a8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.18; Wed, 6 Nov
 2024 23:49:53 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%6]) with mapi id 15.20.8137.018; Wed, 6 Nov 2024
 23:49:53 +0000
Message-ID: <36752865-b12b-4ed1-9679-550b49875e24@intel.com>
Date: Wed, 6 Nov 2024 15:49:51 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/12] drm/xe/pxp: Add VCS inline termination support
To: John Harrison <john.c.harrison@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20240816190024.2176976-1-daniele.ceraolospurio@intel.com>
 <20240816190024.2176976-4-daniele.ceraolospurio@intel.com>
 <5aad84d8-b884-4f34-9f79-d4403916f304@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <5aad84d8-b884-4f34-9f79-d4403916f304@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR05CA0019.namprd05.prod.outlook.com
 (2603:10b6:a03:254::24) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|DM4PR11MB6261:EE_
X-MS-Office365-Filtering-Correlation-Id: dd24b379-d603-4ea7-1016-08dcfebdb5b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y09GZmZuTTZvdi95V2Z3TkF1OStPYk1jMTFkVE1XNWVsQ1pmTWhGSFZHSjZE?=
 =?utf-8?B?QXZtd0JFZ1BaWlVuZy90NzVYSyt0bk9nVUpjVW1PRktUWEtkR29iMkF2OEM1?=
 =?utf-8?B?L0oyZVZxWmZqaHd0NFlFbHQ5TTkxWDY3VWxqdW03WWJ4aEdDdWZkdEpJT3J6?=
 =?utf-8?B?c05uOXlEZUVaQ3Z6Q01GajFYQU5aMk1JL0hHSTUyS2ZrMVp0QmZ2NzFXYXE4?=
 =?utf-8?B?clNkamZvZHNnbnVkUUIwTlVZL2F0OE83RDVFL0M4ZktvekNUOUVBVWVqYkkr?=
 =?utf-8?B?TmdCRlkwV0p6cE9KeFRWbG1vTEUra0pVS3hiN3J3eXIxVmhydGFDcjdvWXk3?=
 =?utf-8?B?YmVSMzBJUTlCUDZZbHdVd2xxcGo3bmx2S1gwaFNVa28rZGR2WFFuT1J1M3Fv?=
 =?utf-8?B?dGdURGU5alIva05ZeWp5SUU5M0s1ZzArZnFsS0VXbEJxRmxxRHdQOEFmQ1J3?=
 =?utf-8?B?NUROTWhVaWVBUzliS09DM29qMFVieW4yRXBaVndWMzdPdjY2Q2oxYTV0MGIz?=
 =?utf-8?B?MWovV0pleDIvQ2JXaUhZZW5ualJjczBJZSs2eXl0V0dFZ3BnMXNXS2NucVZY?=
 =?utf-8?B?SnlaTzRHUkRCbGVNQnhXd2lsaitYOFV5VlI0aG5XQmxoYUNPOTRwdm5LbjMw?=
 =?utf-8?B?WW9YblQvZlZlVitjZk82QVpPdkpuQjcwNXZmeFcxcFE1bnVlK0U4WXFzcUF3?=
 =?utf-8?B?cjZBVDBHaThqcWt4Lzd2NCtvdmdJZThOb2VRZHNCamZ2djNhN0IvblNkWkh1?=
 =?utf-8?B?SFU4NHdpdStIRE9VZkp1Y2N2N09xU1F0YmdndGV5ejBYRkpMWmpnUGM1aDFv?=
 =?utf-8?B?Z2dKbmw2NHpFcUYxbUxGSDMweFVwZU5XSm41Z0k4Y1RjWDlWOU9idG44bUpu?=
 =?utf-8?B?TDhzc1hvRUlwM0JGS25HaWp0ekx3eXh2dmQ5VTAwTlowMzlFZXlHaEtCemh3?=
 =?utf-8?B?bkxWQ0xrRFVReE9MYnZpeGN0SlpLN2Z4M1Z5dzBLZE9mcWsvdkhqUy90RjhM?=
 =?utf-8?B?MTJQdldncFg4YUdpVUJleEJhNTg5dVU1VElORzVMM09ETkJ1SGtqSkhCa3pz?=
 =?utf-8?B?UmIwQmtWeEdlL2wzYjRDeHVJbnFFeU9MTTNYL2UyR1JpNW1OOXVJaHF2eWFs?=
 =?utf-8?B?K1dVWVN5NUY4bkhnNDhZdjJlREhwVTl4V1NiWW5lRGQyTWtJTTd6UXo2VUNq?=
 =?utf-8?B?SGNKVnhzUWdBMVdVWUxYUlpKMVdJZXI1dlZpTmtWcUlLQ0FBemoxVXY2a2dP?=
 =?utf-8?B?djZHb3JwdXB3R2srZzRTVDdpcFRlM3k5VzRZUnBTYmkrREhndm83MmxJQkpZ?=
 =?utf-8?B?ZTdVUml2T29wSFFkbndvMi9CVmdWOUFlcDNhV1duN0pGWEVVZXA3ZXB6c254?=
 =?utf-8?B?TGZSOWw3bjRRNDRZc3lCOVExZFc3Z09RRUpFNzFmeVNsK2UweDd3MGQrRjg1?=
 =?utf-8?B?blVlUlk3MldJcmRXRXF5d3RsSkFLUlhIajBBdjkzMHR2bVNkdzdDRUF3N0sv?=
 =?utf-8?B?d0JESVlremM4TWZ0NTNPcXpPaEFVa085dHZzRUZFbmg2WDZWRG90L0JTT2wy?=
 =?utf-8?B?OEE4T3FncXAwWUJRVWMyVE5pQ2kwN1dUOFZNelVVTGJ1TzUzeTFsbVdXZVo4?=
 =?utf-8?B?NWZ1amwvWEQzTHpjR0Z6Z1pUVlc2c2pZYXU1YWlJamlqVTIyUjZINzNHRjdN?=
 =?utf-8?B?UGljUlNESmhwWWpwK3oxRm1LdlY5NHlGZFc3KzBLbnBTNXhzVTZZVHVhNUxr?=
 =?utf-8?Q?OyRA951liYqhvri3xspiBhmmW/Mh24UU+4n3aPm?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SGhOd3BkRUVXMEZQWkRYOXBxV0QySEtVN0VtV1JmQlFlbFR0L1FpbEx4aE5S?=
 =?utf-8?B?RVo5dEhZSmloSHpWdGxsTnRCM05iOUVCb1JKYmQ2S3hva1hRTXhrOE1zazRi?=
 =?utf-8?B?b2JXVG9Iei80MU94RVFabWFtTXNKWHEyakxVQlpUOTRKZGRUNHp4cVp4ck5I?=
 =?utf-8?B?bG5tUWpWK2VjdkppQmVkdVEwb1Nlbk1Pb0wrcHZYKzh6ZzVLNytvN3JxdmJ2?=
 =?utf-8?B?endWcHByenRvOE1HbDgyNVFRNzY0dDU2Rm5kcmVtZDZEcTBIRmxkVDhrR2U0?=
 =?utf-8?B?Ti8wVXF6YXZ3SndtRWhQeEVHOXdvNGwyaWNidERwR040cnUzVmRCSWZ6RDY2?=
 =?utf-8?B?RFJZU1Y3eFdxeGZ2aVBnSmdtOGVXSXVackgzVlBQdUdsOVA5WGcvOUY2azl5?=
 =?utf-8?B?V3k4WDZZUXBzN0ZraVNLMUpITnBPRG15S3Y5NVB2cFplTDdyRkRveHNQRDB5?=
 =?utf-8?B?ZXZHZ0NQQzBONnp4V0Q3Y0RZMFlvajlTcmtlK3JuNVJsM3hPZ2FpOURnVEJM?=
 =?utf-8?B?U0tIMW9nVlRRNFJzSGZueDkvK2paeGN0dnRCd2c3U2todEcrcklLKzNuNjIv?=
 =?utf-8?B?RXFKWFRQSHNpaTYwdnBUY2FTYVNXZVZkaDF1UUc5RlFucjJHRFRFM2VybDNI?=
 =?utf-8?B?K3FHdkpCM05lNy9JU3FnaTZWYWhFQW5GK251cXBCQytSMjUvVktDTUNKWGox?=
 =?utf-8?B?UVUrTVlLT2NuZ3p1c3JVVXB3QkZKZTNhUDZ1OFhORlZTNlpEa0dCOHJUR3Fm?=
 =?utf-8?B?TlpZZHo2TkNvdlpLc2M3OFVXWlFNc3hrbHZzclI2eVNybmVoTTJNRDgvck1K?=
 =?utf-8?B?Q0dTbi85V01mOVR3eG5jVFJqK24zam5CNUtGRG1uQUpZZmpOMnpjRlN2ZVRM?=
 =?utf-8?B?V1JJMTZQYjhSTENVN2YrbnBtc1JIYkNWK0RPcFNzbVFlSTBaa3RhUGwzK21V?=
 =?utf-8?B?UG80ZjE3c25rTERZUVB5RXBEMGJjZURVMjhLNVhRNDVidjZ2MGVZLzh2K0Fp?=
 =?utf-8?B?TEFVM3A3WVdUWXRhQkQraXpkVWExZzFaZDhMYTFLcUZ0elRiMXd0RHdudk9U?=
 =?utf-8?B?YVRIQ21OeEZLWmdBRVZRNVNMcTc0Rjg0akQySkxjSUxQREp2NENlcmo1QkND?=
 =?utf-8?B?MjgvWS91emFqdTBNYmtMRjB5L0ZPWk0vK2FzR0ZmRS90S1VlcXduYWtqcFBt?=
 =?utf-8?B?a3lDZFlDa2JLa2FhWS9KSllpcUptZjZIL0lwblZEVEZCcEh3eE9CZDdWdVRR?=
 =?utf-8?B?UDhtQlZFNytnS05KUUdoTWpxSDlKUElWNStYcFoyaU1YOUROd3ErVUFxQ2tk?=
 =?utf-8?B?K2lJbDk2OHh3dXlMdk9IOVVhOWRaMStVOVJwZTh2TG1DVlhtYmJvdGNEVjdS?=
 =?utf-8?B?ZTBIbkQrb2FzS29XNHgyMWdBc1B1UUZHWjJVcTRHRnhDRzYzRHRJL0NETUZT?=
 =?utf-8?B?eDFHd0xaZ096S1BXTDN5UGNtUVdrZDlscTRINHdraFU1TkFhMFMvNVRidW9M?=
 =?utf-8?B?eVZVSGp4TTVxaTEyZDVvZXEyZ3gyQllyOW9pcmMrWXl5WGIzWlpabVEwSW9Z?=
 =?utf-8?B?L0ZTaDBYUlA2YmVQRFA1cEJuMVA1Z2xrOSt2THYydVpPeElzTmNHVjU4UUli?=
 =?utf-8?B?MHY4TFlZOHZDdW00UUZNMWgxYlRZdjhUbmVnY3BTUFRVUDYvRUVxVXQza1Ez?=
 =?utf-8?B?M0tNNVk1S3o0UVNwZDZnSjZkSmQzd1RQV2p0WGgwbUM0dUNXZ21XNkVBM0F4?=
 =?utf-8?B?WEQ0b2JJd3lub2RTdUZWTkd6Yyt1WDZsa3hyeDRZYWdGS3daOHpibTN3U2hD?=
 =?utf-8?B?OGxJblFqUUpMNk1yakIwYUtKZUUrb2xEOGVOUERacUJ6L25WMmlwSmFvWkZ0?=
 =?utf-8?B?NGREeGdvb2ZVaitpdnhOeVNIM0l0Q3FmVDhiL0RyMWh4aE44RmdCb2lralIy?=
 =?utf-8?B?Sk0zaGlIWUJ5UHNUMTBQV1pVQ21iZkRwc0g5UlowUDFKSnJFMUlqU1FTbGls?=
 =?utf-8?B?UVEyRFRLQ0I5YzJPU0RWbkpTOVRVY2JVb3E5ektzN1U1YmlQVW5UQnFUUm9U?=
 =?utf-8?B?dkFISytkRWxzbTloZzg0d0dLMVVCLzBoRE40R2hCaXBCTHMrRmFLWGhYazJm?=
 =?utf-8?B?d3oxdnUxd01yUGdwK1NCbk85QXJYNzZYbkhQTmRwV21lTzFlc2U2MXlEbE1h?=
 =?utf-8?Q?snSOzo/eOqhTVU2P36JdOR8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dd24b379-d603-4ea7-1016-08dcfebdb5b5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2024 23:49:53.1853 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sqMdNIJWOO+WuU5PsSEOAiAm5xtViRpKbd9RJkaxc4/txIxryveXYRUPpI3zSRgCEZMMBZnr0snzmJn63g2CbRac8yzpk2bt7gf5diPYfmw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6261
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


On 10/4/24 15:25, John Harrison wrote:
> On 8/16/2024 12:00, Daniele Ceraolo Spurio wrote:
>> The key termination is done with a specific submission to the VCS
>> engine.
>>
>> Note that this patch is meant to be squashed with the follow-up patches
>> that implement the other pieces of the termination flow. It is separate
>> for now for ease of review.
>>
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> ---
>>   .../gpu/drm/xe/instructions/xe_instr_defs.h   |   1 +
>>   .../gpu/drm/xe/instructions/xe_mfx_commands.h |  29 +++++
>>   .../gpu/drm/xe/instructions/xe_mi_commands.h  |   5 +
>>   drivers/gpu/drm/xe/xe_lrc.h                   |   3 +-
>>   drivers/gpu/drm/xe/xe_pxp_submit.c            | 108 ++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_pxp_submit.h            |   2 +
>>   drivers/gpu/drm/xe/xe_ring_ops.c              |   4 +-
>>   7 files changed, 149 insertions(+), 3 deletions(-)
>>   create mode 100644 drivers/gpu/drm/xe/instructions/xe_mfx_commands.h
>>
>> diff --git a/drivers/gpu/drm/xe/instructions/xe_instr_defs.h 
>> b/drivers/gpu/drm/xe/instructions/xe_instr_defs.h
>> index fd2ce7ace510..e559969468c4 100644
>> --- a/drivers/gpu/drm/xe/instructions/xe_instr_defs.h
>> +++ b/drivers/gpu/drm/xe/instructions/xe_instr_defs.h
>> @@ -16,6 +16,7 @@
>>   #define XE_INSTR_CMD_TYPE        GENMASK(31, 29)
>>   #define   XE_INSTR_MI REG_FIELD_PREP(XE_INSTR_CMD_TYPE, 0x0)
>>   #define   XE_INSTR_GSC REG_FIELD_PREP(XE_INSTR_CMD_TYPE, 0x2)
>> +#define   XE_INSTR_VIDEOPIPE REG_FIELD_PREP(XE_INSTR_CMD_TYPE, 0x3)
>>   #define   XE_INSTR_GFXPIPE REG_FIELD_PREP(XE_INSTR_CMD_TYPE, 0x3)
>>   #define   XE_INSTR_GFX_STATE REG_FIELD_PREP(XE_INSTR_CMD_TYPE, 0x4)
>>   diff --git a/drivers/gpu/drm/xe/instructions/xe_mfx_commands.h 
>> b/drivers/gpu/drm/xe/instructions/xe_mfx_commands.h
>> new file mode 100644
>> index 000000000000..686ca3b1d9e8
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/instructions/xe_mfx_commands.h
>> @@ -0,0 +1,29 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2024 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_MFX_COMMANDS_H_
>> +#define _XE_MFX_COMMANDS_H_
>> +
>> +#include "instructions/xe_instr_defs.h"
>> +
>> +#define MFX_CMD_SUBTYPE        REG_GENMASK(28, 27) /* A.K.A cmd pipe */
>> +#define MFX_CMD_OPCODE        REG_GENMASK(26, 24)
>> +#define MFX_CMD_SUB_OPCODE    REG_GENMASK(23, 16)
>> +#define MFX_FLAGS_AND_LEN    REG_GENMASK(15, 0)
>> +
>> +#define XE_MFX_INSTR(subtype, op, sub_op, flags) \
>> +    (XE_INSTR_VIDEOPIPE | \
>> +     REG_FIELD_PREP(MFX_CMD_SUBTYPE, subtype) | \
>> +     REG_FIELD_PREP(MFX_CMD_OPCODE, op) | \
>> +     REG_FIELD_PREP(MFX_CMD_SUB_OPCODE, sub_op) | \
>> +     REG_FIELD_PREP(MFX_FLAGS_AND_LEN, flags))
>> +
>> +#define MFX_WAIT                XE_MFX_INSTR(1, 0, 0, 0)
>> +#define MFX_WAIT_DW0_PXP_SYNC_CONTROL_FLAG    REG_BIT(9)
>> +#define MFX_WAIT_DW0_MFX_SYNC_CONTROL_FLAG    REG_BIT(8)
>> +
>> +#define CRYPTO_KEY_EXCHANGE            XE_MFX_INSTR(2, 6, 9, 0)
>> +
>> +#endif
>> diff --git a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h 
>> b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
>> index 10ec2920d31b..167fb0f742de 100644
>> --- a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
>> +++ b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
>> @@ -48,6 +48,7 @@
>>   #define   MI_LRI_LEN(x)            (((x) & 0xff) + 1)
>>     #define MI_FLUSH_DW            __MI_INSTR(0x26)
>> +#define   MI_FLUSH_DW_PROTECTED_MEM_EN    REG_BIT(22)
>>   #define   MI_FLUSH_DW_STORE_INDEX    REG_BIT(21)
>>   #define   MI_INVALIDATE_TLB        REG_BIT(18)
>>   #define   MI_FLUSH_DW_CCS        REG_BIT(16)
>> @@ -66,4 +67,8 @@
>>     #define MI_BATCH_BUFFER_START        __MI_INSTR(0x31)
>>   +#define MI_SET_APPID            __MI_INSTR(0x0e)
>> +#define MI_SET_APPID_SESSION_ID_MASK    REG_GENMASK(6, 0)
>> +#define MI_SET_APPID_SESSION_ID(x) 
>> REG_FIELD_PREP(MI_SET_APPID_SESSION_ID_MASK, x)
>> +
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
>> index c24542e89318..d411c3fbcbc6 100644
>> --- a/drivers/gpu/drm/xe/xe_lrc.h
>> +++ b/drivers/gpu/drm/xe/xe_lrc.h
>> @@ -20,7 +20,8 @@ struct xe_lrc;
>>   struct xe_lrc_snapshot;
>>   struct xe_vm;
>>   -#define LRC_PPHWSP_SCRATCH_ADDR (0x34 * 4)
>> +#define LRC_PPHWSP_FLUSH_INVAL_SCRATCH_ADDR (0x34 * 4)
>> +#define LRC_PPHWSP_PXP_INVAL_SCRATCH_ADDR (0x40 * 4)
>>     struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct 
>> xe_vm *vm,
>>                    u32 ring_size);
>> diff --git a/drivers/gpu/drm/xe/xe_pxp_submit.c 
>> b/drivers/gpu/drm/xe/xe_pxp_submit.c
>> index b777b0765c8a..3b69dcc0a00f 100644
>> --- a/drivers/gpu/drm/xe/xe_pxp_submit.c
>> +++ b/drivers/gpu/drm/xe/xe_pxp_submit.c
>> @@ -6,14 +6,20 @@
>>   #include "xe_pxp_submit.h"
>>     #include <drm/xe_drm.h>
>> +#include <linux/delay.h>
>>     #include "xe_device_types.h"
>> +#include "xe_bb.h"
>>   #include "xe_bo.h"
>>   #include "xe_exec_queue.h"
>>   #include "xe_gsc_submit.h"
>>   #include "xe_gt.h"
>> +#include "xe_lrc.h"
>>   #include "xe_pxp_types.h"
>> +#include "xe_sched_job.h"
>>   #include "xe_vm.h"
>> +#include "instructions/xe_mfx_commands.h"
>> +#include "instructions/xe_mi_commands.h"
>>   #include "regs/xe_gt_regs.h"
>>     /*
>> @@ -199,3 +205,105 @@ void xe_pxp_destroy_execution_resources(struct 
>> xe_pxp *pxp)
>>       destroy_vcs_execution_resources(pxp);
>>   }
>>   +#define emit_cmd(xe_, map_, offset_, val_) \
>> +    xe_map_wr(xe_, map_, (offset_) * sizeof(u32), u32, val_)
>> +
>> +/* stall until prior PXP and MFX/HCP/HUC objects are cmopleted */
> completed
>
>> +#define MFX_WAIT_PXP (MFX_WAIT | \
>> +              MFX_WAIT_DW0_PXP_SYNC_CONTROL_FLAG | \
>> +              MFX_WAIT_DW0_MFX_SYNC_CONTROL_FLAG)
> Why define an XE_MFX_INSTR macro that takes a flags word only to 
> manually OR the flags in outside of the macro?

Maybe flags is a misnomer here, but I couldn't think of anything 
clearer. Some commands have bits that are always set within that flags 
field, so for those we would add them at definition time; other 
commands, like MFX_WAIT, do instead have optional flags, which we can 
set as needed in the code.

Given that I haven't defined any XE_MFX_INSTR command that requires a 
value in the flags field, I'll just remove that field from the 
XE_MFX_INSTR macro for now to make things clearer.


>
>> +static u32 pxp_emit_wait(struct xe_device *xe, struct iosys_map 
>> *batch, u32 offset)
>> +{
>> +    /* wait for cmds to go through */
>> +    emit_cmd(xe, batch, offset++, MFX_WAIT_PXP);
>> +    emit_cmd(xe, batch, offset++, 0);
> This zero is just padding to ensure 64bit alignment of future 
> instructions?

yes


>
>> +
>> +    return offset;
>> +}
>> +
>> +static u32 pxp_emit_session_selection(struct xe_device *xe, struct 
>> iosys_map *batch,
>> +                      u32 offset, u32 idx)
>> +{
>> +    offset = pxp_emit_wait(xe, batch, offset);
>> +
>> +    /* pxp off */
>> +    emit_cmd(xe, batch, offset++, MI_FLUSH_DW | MI_FLUSH_IMM_DW);
>> +    emit_cmd(xe, batch, offset++, 0);
>> +    emit_cmd(xe, batch, offset++, 0);
>> +    emit_cmd(xe, batch, offset++, 0);
>> +
>> +    /* select session */
>> +    emit_cmd(xe, batch, offset++, MI_SET_APPID | 
>> MI_SET_APPID_SESSION_ID(idx));
>> +    emit_cmd(xe, batch, offset++, MFX_WAIT_PXP);
> Seems odd to define a helper function to emit this instruction and 
> then only use it for some instances.


I didn't want the extra padding here or to make the function 
conditionally add it only when needed. I'll just add it, it's not like 
we don't have enough memory (the BO is 1 page and we only use a few 
dwords for the termination).


>
>> +
>> +    /* pxp on */
>> +    emit_cmd(xe, batch, offset++, MI_FLUSH_DW |
>> +                      MI_FLUSH_DW_PROTECTED_MEM_EN |
>> +                      MI_FLUSH_DW_OP_STOREDW | 
>> MI_FLUSH_DW_STORE_INDEX |
>> +                      MI_FLUSH_IMM_DW);
>> +    emit_cmd(xe, batch, offset++, LRC_PPHWSP_PXP_INVAL_SCRATCH_ADDR |
>> +                      MI_FLUSH_DW_USE_GTT);
>> +    emit_cmd(xe, batch, offset++, 0);
>> +    emit_cmd(xe, batch, offset++, 0);
>> +
>> +    offset = pxp_emit_wait(xe, batch, offset);
>> +
>> +    return offset;
>> +}
>> +
>> +static u32 pxp_emit_inline_termination(struct xe_device *xe,
>> +                       struct iosys_map *batch, u32 offset)
>> +{
>> +    /* session inline termination */
>> +    emit_cmd(xe, batch, offset++, CRYPTO_KEY_EXCHANGE);
>> +    emit_cmd(xe, batch, offset++, 0);
>> +
>> +    return offset;
>> +}
>> +
>> +static u32 pxp_emit_session_termination(struct xe_device *xe, struct 
>> iosys_map *batch,
>> +                    u32 offset, u32 idx)
>> +{
>> +    offset = pxp_emit_session_selection(xe, batch, offset, idx);
>> +    offset = pxp_emit_inline_termination(xe, batch, offset);
>> +
>> +    return offset;
>> +}
>> +
>> +/**
>> + * xe_pxp_submit_session_termination - submits a PXP inline termination
>> + * @pxp: the xe_pxp structure
>> + * @id: the session to terminate
>> + *
>> + * Emit an inline termination via the VCS engine to terminate a 
>> session.
>> + *
>> + * Returns 0 if the submission is successful, an errno value otherwise.
>> + */
>> +int xe_pxp_submit_session_termination(struct xe_pxp *pxp, u32 id)
>> +{
>> +    struct xe_sched_job *job;
>> +    struct dma_fence *fence;
>> +    long timeout;
>> +    u32 offset = 0;
>> +    u64 addr = xe_bo_ggtt_addr(pxp->vcs_exec.bo);
>> +
>> +    offset = pxp_emit_session_termination(pxp->xe, 
>> &pxp->vcs_exec.bo->vmap, offset, id);
>> +    offset = pxp_emit_wait(pxp->xe, &pxp->vcs_exec.bo->vmap, offset);
>> +    emit_cmd(pxp->xe, &pxp->vcs_exec.bo->vmap, offset, 
>> MI_BATCH_BUFFER_END);
>> +
>> +    job =  xe_sched_job_create(pxp->vcs_exec.q, &addr);
> Double space
>
>> +    if (IS_ERR(job))
>> +        return PTR_ERR(job);
>> +
>> +    xe_sched_job_arm(job);
>> +    fence = dma_fence_get(&job->drm.s_fence->finished);
>> +    xe_sched_job_push(job);
>> +
>> +    timeout = dma_fence_wait_timeout(fence, false, HZ);
>> +
>> +    dma_fence_put(fence);
>> +    if (timeout <= 0)
>> +        return -EAGAIN;
> Does it not matter what the error was? Why/how would this fail in a 
> way that needs to be re-tried?
>
> Although looking at the later patches, the return value from this 
> function is just treated as a pass/fail bool anyway. So why bother 
> munging it at all?


Timeout can be 0 on failure, so can't return that directly. I'll change 
it to return timeout if negative and an error if it actually timed out.

Daniele


>
> John.
>
>> +
>> +    return 0;
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_pxp_submit.h 
>> b/drivers/gpu/drm/xe/xe_pxp_submit.h
>> index 1a971fadc081..4ee8c0acfed9 100644
>> --- a/drivers/gpu/drm/xe/xe_pxp_submit.h
>> +++ b/drivers/gpu/drm/xe/xe_pxp_submit.h
>> @@ -13,4 +13,6 @@ struct xe_pxp;
>>   int xe_pxp_allocate_execution_resources(struct xe_pxp *pxp);
>>   void xe_pxp_destroy_execution_resources(struct xe_pxp *pxp);
>>   +int xe_pxp_submit_session_termination(struct xe_pxp *pxp, u32 id);
>> +
>>   #endif /* __XE_PXP_SUBMIT_H__ */
>> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c 
>> b/drivers/gpu/drm/xe/xe_ring_ops.c
>> index 0be4f489d3e1..a4b5a0f68a32 100644
>> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
>> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
>> @@ -118,7 +118,7 @@ static int emit_flush_invalidate(u32 flag, u32 
>> *dw, int i)
>>       dw[i++] |= MI_INVALIDATE_TLB | MI_FLUSH_DW_OP_STOREDW | 
>> MI_FLUSH_IMM_DW |
>>           MI_FLUSH_DW_STORE_INDEX;
>>   -    dw[i++] = LRC_PPHWSP_SCRATCH_ADDR | MI_FLUSH_DW_USE_GTT;
>> +    dw[i++] = LRC_PPHWSP_FLUSH_INVAL_SCRATCH_ADDR | 
>> MI_FLUSH_DW_USE_GTT;
>>       dw[i++] = 0;
>>       dw[i++] = ~0U;
>>   @@ -156,7 +156,7 @@ static int emit_pipe_invalidate(u32 mask_flags, 
>> bool invalidate_tlb, u32 *dw,
>>         flags &= ~mask_flags;
>>   -    return emit_pipe_control(dw, i, 0, flags, 
>> LRC_PPHWSP_SCRATCH_ADDR, 0);
>> +    return emit_pipe_control(dw, i, 0, flags, 
>> LRC_PPHWSP_FLUSH_INVAL_SCRATCH_ADDR, 0);
>>   }
>>     static int emit_store_imm_ppgtt_posted(u64 addr, u64 value,
>
