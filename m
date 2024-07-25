Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E736BC3DA49
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jul 2024 20:19:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93A3210E2B9;
	Thu, 25 Jul 2024 20:19:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ecVOb1xe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F27A10E2B9
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Jul 2024 20:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721938750; x=1753474750;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jC6+02cFMP6ajKqcv20uTzGUJgEWei6cMjL1BBF9lAc=;
 b=ecVOb1xeQ5G5vaxoDTDcLY18l9QIi38C2ckLe6D3h6SHHdcfO3Xeapll
 fB0azGA62IBlNM2plGw2HRUXgcqgiJfqgI8Uq6F0aUWwnaSnhAhZmao7l
 05j/r9H3AZrFU3U3uhXQyoAMeJkzBWT0495dsi38V7u3zu5ACEWmgWiRE
 4UP4iYA13zpzvT9f9v/mLfbsrLSduyQ98oZuq1r0o3bRXbshZq/ji0Du7
 C7oMNwH3UgcWKpwXTuukgP4CVo535KsUEgoCTn+qaijKTXOMiAFg8lrxs
 gYUXqEPiiuwbjSiyW4Fbjr36nQTDU6QFBwyDwpHQ9fJwfIoz+ehaFtTp4 A==;
X-CSE-ConnectionGUID: miOXa0m8Sly7FHCCaEm2IQ==
X-CSE-MsgGUID: OB62NgFWSiOvkETsW0Q7GQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11144"; a="19895066"
X-IronPort-AV: E=Sophos;i="6.09,236,1716274800"; d="scan'208";a="19895066"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2024 13:19:10 -0700
X-CSE-ConnectionGUID: sri2NDOqQJmg96jqkZUI+g==
X-CSE-MsgGUID: 96YcuqAgRJKJG22P80bozQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,236,1716274800"; d="scan'208";a="52956668"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Jul 2024 13:19:09 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 25 Jul 2024 13:19:09 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 25 Jul 2024 13:19:08 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 25 Jul 2024 13:19:08 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 25 Jul 2024 13:19:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lb5g6jBDRDnEZ2L5C6Sqt/SK8gAWwbrnl775QD2cIqQ4AHxf8pdwn4yX9Uqn7TzihroeFSgMdCta25GwFzH2W75lppXRovlquCa+owhXODCLvj1woihH4msnqyNkt6jRXdRplB1HRP2atP5V7G5XBQ7M/Z34zUqxq4k5dnZbXp6EeY/BlSFszxtfW5huw7tEAPfKQPRkjy0J0fKhp9Ke4mqG9+R4yF4AOBIj+zWRamu3reO/xB7scf3kKpkTVdn1TKncVAXNhogd9mhSDLzN/TUzCkzqSUfACTghXGns+pAoCSoXnirEc4JOteMw/XFJn0mSmpF9Z3PbAFmoksXvfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x1SPFrF3LD1Qq6i1wLrqaAs519EZ5N8RxYcSzfwF+j4=;
 b=RtNDRF7YIxbZar3GA+f4o9puW3Jlh63HPEpXeixp0D2AmIvEBv1TtUfXxPc/e/vitqVCwp6+M3lrUN2M8Ufdt588JasiajlW012rHpJ652H1O8U8og8hVOevW8kwMRp01hRd6gdBWyql381q39dIZOHs4uhSmTg7yDVW8Q1d2TIJ59Wlj2s0062cWEIhHnFsfFFkTjxVjqpJjReXXht179wapTCMye5JXpw2ywN6GWpG0mdnEMz4CSjeAm92CoxHnFRUVItUk5tJnBZvEoEAT8qXL3tYXTow5mueIFfKHsgn6vOOVYKoTtI/MCjyTbdv8QYSrS1F0Ad9iNrhm0hy0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by MW3PR11MB4522.namprd11.prod.outlook.com (2603:10b6:303:2d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.28; Thu, 25 Jul
 2024 20:19:06 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%7]) with mapi id 15.20.7784.013; Thu, 25 Jul 2024
 20:19:06 +0000
Message-ID: <c38746fe-3fe1-4dec-8281-87a73439e804@intel.com>
Date: Thu, 25 Jul 2024 13:19:03 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] Move HuC and GSC FW defs for LNL and BMG to
 drm-xe-next
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, John Harrison <John.C.Harrison@intel.com>
References: <20240725003224.516233-1-daniele.ceraolospurio@intel.com>
 <tqx4jfnjgkzq3opvcdtsjcr3ivqvsw3qs3upptne37fr7afzuu@2y2ath6vpri4>
 <de2fafa3-9bf0-41c2-b9b6-b67cf3b11351@intel.com>
 <j3n7kew46ho7ougymxut5ysv3gfwtzv2tqo3hly2gonajf6tox@py5rr52lj233>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <j3n7kew46ho7ougymxut5ysv3gfwtzv2tqo3hly2gonajf6tox@py5rr52lj233>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0239.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::34) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|MW3PR11MB4522:EE_
X-MS-Office365-Filtering-Correlation-Id: f1c5ae49-1b14-4415-a0c2-08dcace70868
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SGRDenhMMENqTVpUVHpJTE55TzJnbjlMRlgvc0dlL0VORDdIWUJUUE9HUWJE?=
 =?utf-8?B?TUdIU1NVT1BNSDVwcGZuVEVDSUdyMFVaRXZTeFpLYUJINGdaTXFJMHBXUEpT?=
 =?utf-8?B?U0YxaWlteEttT2lKZjJsU2p6Zngya1gra2huZGxIS1JxOHh2Q3BLSDFsMkgv?=
 =?utf-8?B?dFdPVGM3YTNqT3ZySTlmNHdRWEhiNnNoUHA4d3dxWEpTVnZENGxtRGh2TUFH?=
 =?utf-8?B?YnF1U2MvOHpuU1lrZmlWL0E0WTQzQkRTS1Z5Z1lwaVUrVWMyTE9yak5hd2JR?=
 =?utf-8?B?ZHJvSzREN252cEVCaC9BdzZqek0wV2VKZS9ibnN5cG5LYUhqL3lZOHNzcDh6?=
 =?utf-8?B?dzU5Z2hwaGczcVV6bGM3MXNackY4cytvYm1Ka3BtazZIMFVKZ2FQb2J4UEFv?=
 =?utf-8?B?Nkk1cjZYdHlNK0NDZitkNW9nWjc3UklJZW1mMjNLc2J4L211c3dXMDRiWEhx?=
 =?utf-8?B?UjdCUVVtaU5oVW9ia0ZwNUdReXcvREwwYy9wbmdNR0JqS1Zjb1BOVkR5TDhD?=
 =?utf-8?B?YzUwMkR2dlNCSEdsd0Q5eHhQK2FqNk5nQkVqL3VVdk11akpjWnBHa0o2Zmwv?=
 =?utf-8?B?Mkp4bWFGTlhsTVcwWmNYdGhiVUc3YmNKU2Z5ZkUxTXNyRS9aSzdoemlUT0hS?=
 =?utf-8?B?aEpLSlNxb1BHUkphaWZMYzJyTDBqc0hIYzg3Yk5hN3VMWUllakVYemRSb3Zs?=
 =?utf-8?B?K0FQejRDUk51QlY4Z3RnK2ZhTDhibEV0c1o3dTh1bStBcGR2WXN2Q2NLVU9s?=
 =?utf-8?B?YjV1MzVvT2FlcXpseGp2VDZEeUNicG9zUkl2MC9OZzI1RGdkeXU5dXUzYWVS?=
 =?utf-8?B?MFNPYkhZSDFRYnkyeWR1WS94UnJuaGFBL2tVYUsvWS92ZlQ3Vi9jRzA0RHJh?=
 =?utf-8?B?QnV0QXBSQ2F6cUdTZ2lRcE5keVYyaWV4VFUvVlJQZ0NwbmhQVnY2VFlCR3pu?=
 =?utf-8?B?MkQrYnMyakI2d3VmVktieW5lczRJNWN6eGdDS1VtMlFqVlQwT3U3cjRoQkND?=
 =?utf-8?B?Yjl5WktVZTZmV0RKOW1pakFyZ3F0ZWVpdDRCTGdZY2RvWkY2L1lSbXJOZTRI?=
 =?utf-8?B?MzVJbkhMa1VpOEQ5RmdBNHg4SVFVN0I1N2VXQ01SMTRqREl4Y0dwK1FsRXRQ?=
 =?utf-8?B?cWF5aVovMktMM2o4a3R4QzBJWjd4ZWFzWnR2NDdtOFduWHVYQWZqbVJqa3V1?=
 =?utf-8?B?dStiZW14U2NkVWxKa1V0bmYrR0xaM1dQV2hXSkY4K0FSM252NGJIVlZieXVK?=
 =?utf-8?B?N3lhZWpEdTg0TDM1RllzL210eTJRTEVNZ3BBWkttRmdMdTJXcm1wVGtobTNM?=
 =?utf-8?B?SDRrbi9WekhZWnpoSFowV3NHVFloc0drcnN2b0RsWkRhUWwrSVV4cGk0TWhJ?=
 =?utf-8?B?ajlvb29YcFl3bGl6ZVRBRTZqY013MFNKRnczNW83SHVSUHJIU2hMK1JTUWJt?=
 =?utf-8?B?UTd1STJqTUhGWEVjWVhvandZZ1A0WGlyTURTbTB6SjhvRHFyRzFEN3pCV05K?=
 =?utf-8?B?T1piQVFHYzJkU1lETHB0dU5mZ21JYWJacWZncGQ5K1lmVGZwOUJkbWFjejNN?=
 =?utf-8?B?K1YxWWZhbGhEOWsrOS82czVlQmxGMVFQMTBadytIbkVtbWh0TEQ5ZStvOVND?=
 =?utf-8?B?VTFLS3BBcjcwd3hHY0JMNjcxWVBiNisra2paOEp3MTRGeVJQajlHV284b09O?=
 =?utf-8?B?bWVaQndIQlBEenNpV3F5NVhja0tDUVBPOUhuWm9ZNFhtaFRpSy80dVBUdkxq?=
 =?utf-8?Q?olAsqu0BVe1H+ThiBU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VkJHb0dYalRsUmJqSDgvTWVOSHdNWjBFaVoxSU5GUjVVSjVQVk41UjEzTTBp?=
 =?utf-8?B?bmYvOGVsRlVsUG9rTHgyV1VHVkh4cGxKblpWYlRhQU0zWHVST0tySVJXalQv?=
 =?utf-8?B?TXpMZjJxOXJOcFk5ZmJGSWdSb0twck0zdWU5TUJIT2MvOENCYkZXTm0wc0pS?=
 =?utf-8?B?R0R6YXlmS2dBd2VYcVY0NzVOVnZKK3EwMHRTd1cxODI3cWtGNkQzWUkwR2NL?=
 =?utf-8?B?SFFLaTlsWjk3ejJFaFVBNWIwdnRtSjFFZkl4VWx3bXlNRmdLNlRFUDlOTHdw?=
 =?utf-8?B?VGtMOTB0MjhITm41THE0QWVpQVA0Z3JxZTV6WHZCdnozWWhZTHlnL3J3NTB0?=
 =?utf-8?B?RkxhamFEVS9xMU5Vcy9IWVp5RE13eEI1VU4vdUJUbUh2TXFiSkRONEZCbnFh?=
 =?utf-8?B?VmRCaWVOd3NvckxSaUxiVXEwNEVWV3hCQmc4RWJMUVdZNjZmRmY5UVFuWENi?=
 =?utf-8?B?VGhQMExoR1NTL2J2SXJqcE5ZNmJKTjhkR1ZEVDQvM0RyNFRqbnoxYTJlRlVF?=
 =?utf-8?B?YVdHbkp4U1U3R3p3MnV4cDUrMDJhUkt3b1k2VnhoU0FGcFhhc1V2bzBncWF1?=
 =?utf-8?B?TXQ2OGswZWQ4TG5NTy9mN2U3cjcyQURiN29DSmkvY2lvbWtjRWw0RklnYVl0?=
 =?utf-8?B?WHdrdFNCUXNJVTc3UTMxTFpHT1d0R0ZiRHU5MG85dW56YStDTXYyN3dqQU5Z?=
 =?utf-8?B?Qm12REtqWFovZ3pHdnAySEs5RWhzTXdGbXgzV2VqdFJ6VDRUY0ZtU2Zad01M?=
 =?utf-8?B?ZlluaStTc2JhcGw5SzZRNXNuQ0dBaEFlZEZGR1NSaTc0Qit1RldNWWF5ZmxV?=
 =?utf-8?B?WTR4YTdUSmZvM0NjKytXL1h2Z3ZoNGJsdlZtejBEczZyNnZ0RWZVelNyMVAv?=
 =?utf-8?B?Y0V3bm9taGtFajM3cERrdDZBQitSNks5YnVUcStkWmpMU0ZzRTBCSGFveU41?=
 =?utf-8?B?SzBCZHdORHI0enE3Vk1PSVU0a3BXTWtQZ1ZOZlVmSi9ZbVJxN21ZaW5Dbk84?=
 =?utf-8?B?SFNMZUFnL2Zha0F1NVpsTkJiQW9JVFU0MzdxamdVUmdMTCtiSVFxSUFEM0xQ?=
 =?utf-8?B?QjREZWIvM1V6TW5WNk9oSHdDWTdJOUNmNnA3ZGdFU2xGUFFUWFdFUHdpOTVr?=
 =?utf-8?B?TFloWEZIakxETXgrQWxGZlJ6TWp5aUVaWDlTMnp1U0RjbnkzdldrVVRuYW1K?=
 =?utf-8?B?cVAzRi93VHdwaDdmdFNHTkpIQ1NpVVZvMGNlSDVkRmZpa2ZSa0taMlBia1A1?=
 =?utf-8?B?MnB3ZmZQMFRoMkFmREcyZDJRTy92V0FtZlZJYTU5ZVFmTTFMM0hjejBKbU81?=
 =?utf-8?B?UnoxVW5hRVExZHRnQm9XMkpLaFByREZhOG5kVTFTVHVXTXhvM2Vnc0RydHFK?=
 =?utf-8?B?Q2lweFRremxTYjFVUGJpVk5XWDNnVHdNOUczcFBobXY4MExLc1Y4UUZtVkdW?=
 =?utf-8?B?VjJ5R210a0lWQ1lJVCtwSFByQVBLYVRRVTVaQklkSlBPQnZTLzF3Y1V2WEg4?=
 =?utf-8?B?dms5Ukg3MjhmVEFaeXo1YlRKVVNWUDVLa2J2RGhLMFVmUDNzNVJXM1lja3Y0?=
 =?utf-8?B?Yzh4Q2FkUHRRTTJjR3NKMytDWUNCWE5kL3QxNjA4RWU2UjNuWnNSN1lPQ0F0?=
 =?utf-8?B?RlZmd2hSbkFEQzJMUWlFY3UyMVAzdGpZYW05YmtDL0FwSFVzSWVOZkJpRlNY?=
 =?utf-8?B?Z2EvR1RUK3RHNnduNGRCdkZ6L2JkQWQ0UUJUVXc1ZTd3NDZScmZOZkptaHBh?=
 =?utf-8?B?dUpXeDczZm0vV1VBVlpPVnUvaTBpVGRVYWRoQkgxQzF2YUFXVndJYmY3VEpX?=
 =?utf-8?B?ODJIbXk3aGo5NFJuUlpkaVZoU2ZRaWlmSjRoVTBaSkRPN0p0cjJsVjJ5OXhq?=
 =?utf-8?B?eE5oanoyYXVDeHIvWktZakhIUFE0enJGdXR0MnVXSm5hc3BVVnVkMFF3NGFH?=
 =?utf-8?B?djRrYmZGQzJVNU9UVG1ZWFFxV25mZUtNZ3E0TGxPeWR3VGQ2bjFESmtaTURl?=
 =?utf-8?B?MjBrdi9hZGVvUWdmMEdRQzVkWlBZaTluR2R5T0RadEd1KzdUaW5UVnBwSm92?=
 =?utf-8?B?TkhiUnpLZE1ZbHMzWmduS1ZpdzBMSEwxcEg1b2UyYXI3bDRPRWVxcm15SFE2?=
 =?utf-8?B?QWJNL0VRaWlESllLb2hFVXBRejZWM1Y2RlRQemYxbFZ5a2U2S0JuR2NFbUxP?=
 =?utf-8?Q?c2zAJV2BOjETxFIdn5m787M=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f1c5ae49-1b14-4415-a0c2-08dcace70868
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2024 20:19:06.0111 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wudx7L/OuqV+50TV7+FeehBSsrqn8adef9Av9xJ026bjilFyk4UR4p8t/hP51wZffp76Y+s5iM9Cv4hz90LTBDImHY4ZOjgaN9/rt9g+hGE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4522
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



On 7/25/2024 11:05 AM, Lucas De Marchi wrote:
> On Thu, Jul 25, 2024 at 09:00:57AM GMT, Daniele Ceraolo Spurio wrote:
>>
>>
>> On 7/24/2024 9:48 PM, Lucas De Marchi wrote:
>>> On Wed, Jul 24, 2024 at 05:32:17PM GMT, Daniele Ceraolo Spurio wrote:
>>>> The FW defines are currently in the for-ci branch because the FW blobs
>>>> weren't ready to be officially published. Now that we have updated HuC
>>>> and GSC blobs that are ready to be sent to linux-firmware, we can 
>>>> remove
>>>> the defines from the for-ci branch and add them to drm-xe-next.
>>>>
>>>> Note that the 3 reverts are not meant to be merged, they're there to
>>>> indicate the removal of those patches from the for-ci branch. Only the
>>>> latter 3 patches are meant to be merged.
>>>>
>>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>>> Cc: John Harrison <John.C.Harrison@Intel.com>
>>>
>>> not a huge fan of UFC, but the first thing that came to mind when I saw
>>> this was the catchphrase "iiiiiiiit's tiiime" :) Although I still miss
>>> GuC in the series, hopefully we can get it soon.
>>>
>>> If CI is happy, I'm happy with this.
>>>
>>> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>>
>>> It would be good to note, in the cover letter, where the firmware blobs
>>> currently are (the commit in drm/firmware containing them) and the
>>> status for sending this to upstream linux-firmware.
>>>
>>> AFAICS 
>>> https://gitlab.freedesktop.org/drm/firmware/-/commits/intel-staging?ref_type=heads
>>> up to commit 0690b69dc20da6d096450faa0c256f6896ff8365 has these 3 
>>> blobs.
>>> Can you share the plan to send them to linux-firmware? Is this going to
>>> happen just after having the CI results?
>>
>> I was planning to wait for the GuC binaries to be ready first and 
>> then send a single PR to linux-firmware with all the blobs, which 
>> means sending the PR either late this week or early next week. Note 
>> that we usually send the PR after the patches have been merged for 
>> 1-2 days, so this would be in line with that.
>>
>> CI is happy, so let me know if you prefer me to hold until we're 
>> ready with all the binaries, otherwise I'll go ahead and merge.
>
> nops, we still have some time before I send the pull request to
> drm-next, so we are fine. Please go ahead and merge.
>

Thanks, patches merged.

Daniele

> thanks
> Lucas De Marchi
>
>>
>> Daniele
>>
>>>
>>>
>>> thanks
>>> Lucas De Marchi
>>>
>>>>
>>>> Daniele Ceraolo Spurio (6):
>>>>  Revert "drm/xe/huc: Define BMG HuC"
>>>>  Revert "drm/xe/gsc: define GSC FW for LNL"
>>>>  Revert "drm/xe/huc: Define LNL HuC"
>>>>  drm/xe/huc: Define HuC binary for LNL
>>>>  drm/xe/gsc: Define GSC binary for LNL
>>>>  drm/xe/huc: Define HuC binary for BMG
>>>>
>>>> drivers/gpu/drm/xe/xe_uc_fw.c | 6 +++---
>>>> 1 file changed, 3 insertions(+), 3 deletions(-)
>>>>
>>>> -- 
>>>> 2.43.0
>>>>
>>

