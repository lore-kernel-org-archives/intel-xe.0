Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5F8BE77197
	for <intel-xe@archiver.kernel.org>; Wed,  8 Jan 2025 00:55:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AD7510E41E;
	Wed,  8 Jan 2025 00:55:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KM2XNeGr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60D4610E41E
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Jan 2025 00:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736297706; x=1767833706;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9eQMQ+0oam+ldcyQBD2gCoGmxvvAxFKn26jbQeeQ9aI=;
 b=KM2XNeGrXHyjR33UUDlhF9wBcizyEWZ2jDkLM+d1M4eFvLg9KgpQArUb
 7qq9of0RPjTD0EVxLpxd8CZnAnR9ydUQKdo903INwkSTZ9cyRRfKy/7+H
 yXfruVnzAwC2UHuNzgEWFFf9IcPtxUfRrOREn5H0YaG1vTDagE+mUxtLv
 70rbtOhXoS7xbmFGMfufJLedoNBQPFlZdAPDnuiLNgX7DSRIAFcUY7biR
 G0xmoOfUNWJF4FWbm8dAubMaoYgHFCIfTyHY4goPztZp//Y/ff5JcEGCl
 G5nDcR8U8QUQyTBxf01vwxMPNZOdFMp14Qui+mpC3jk+201xOqf1HvFe6 Q==;
X-CSE-ConnectionGUID: gh62Q/XVSsGT6jdrWP/slw==
X-CSE-MsgGUID: W1SJ/LXJSZyQnbpRaSb/fA==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="36387181"
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; d="scan'208";a="36387181"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 16:55:05 -0800
X-CSE-ConnectionGUID: VWx2A01hSxSDuA8AV7JqCw==
X-CSE-MsgGUID: h0I+VgWpSqGdbh6f/ejBwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; d="scan'208";a="107801839"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Jan 2025 16:55:05 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 7 Jan 2025 16:55:04 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 7 Jan 2025 16:55:04 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.47) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 7 Jan 2025 16:55:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IcV3p/t2UTa+taJIbemT4UuaI9aYd0yx5qmqUj9nq4VPs60VlufNY6v4LEUBHU4ATTQgdMuZlKotg3FhYRnF0KSsb0Dl1UIO0jBJmO3pai9Pgtl2YBiTD7pKDnCl0om32gN+avvdq24Xj0Aikz7DqHA9oK5gDu5HCqpp7FAHG2N0en7LMCInCN8fh8yJGKS+dkbvA/QTdgY8AHoRMgBxvHN5Dj19VKLN/vd8iFh/RwjYUAY15rbU/jShRoLYl/BaVuL+rAICC6pUk6x/yCpoJfRqcGa8geQtwTQqRSINwfxedQRJ8CKumijNIg+lftaLchDDTCL5BwtfGfQUax33Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VZTtZAQEHq2QdomoEShGadWyB5XDazwz2m6bTD9hsjM=;
 b=PGbWvFQN4XD55QOhOsiUYbqzNoQOqBVcAh7y3hlKh0BJCiHS9bXC4NNFsgc4VIF7qoi/ntydeI7tJ2MROEyoja/gklRxVxxtAe5LGUITdkORf627YHOzNREemJnGgs3tCGIRoP3MdkvfqTGKSqnk/DcrNnY5C03fZeH1E3Iqur87IvKnmfIxnhs0AB7LUpXHHw6MDqcwmq4GtRfgw4d55iJIGAbnDcW+byDe6m3on1VfveD/wZzoJza17kgiXma3nkQezXB/20yMO806ESTU0slU35p5vDqltgSKMtee7rz9zutHqnjnFBPVvmYJuUsr/FXry9zZ5ZZ0/tc4HcCeTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by PH8PR11MB7991.namprd11.prod.outlook.com (2603:10b6:510:25a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.13; Wed, 8 Jan
 2025 00:54:52 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1%4]) with mapi id 15.20.8314.015; Wed, 8 Jan 2025
 00:54:52 +0000
Message-ID: <ec94827f-7e07-437e-988d-2d4b9ba82162@intel.com>
Date: Tue, 7 Jan 2025 16:54:51 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 4/4] drm/xe/pmu: Add GT frequency events
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>
References: <20241220011910.103280-1-vinay.belgaumkar@intel.com>
 <20241220011910.103280-5-vinay.belgaumkar@intel.com>
 <Z2XfA0u32v3tvKiC@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <Z2XfA0u32v3tvKiC@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0114.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::29) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|PH8PR11MB7991:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b81038e-23f9-470b-de84-08dd2f7f0f99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dVE1cVN4SnNpZjdPb2RQRlJqVGY2bGpGZzBvRFEyMW9mdW9EbUtwVHVDcGN0?=
 =?utf-8?B?cHJkWVRBR3lUbGRkdFVUcHZSUzNEbXIvQy9uVXdWQXIvZFpBVVVyT2dXTFZZ?=
 =?utf-8?B?MVQxeWNBbU5NcysrcU00ZmZkOUpNTzlRUTNQZEpYZ1hBOU5tRkhjbmY2RGwv?=
 =?utf-8?B?WWl4a2R5N25kQklJYy9WOEVqZ3hXMmpLQzNDUWpyZzg0L3FCVkM0UmEybWVn?=
 =?utf-8?B?MXN2a09aS1VuTGxmVitZQWtUWC9CL2JzWTd3K3B6MGdVaUxHSmM1d1FielJH?=
 =?utf-8?B?TG04RWk1OXRCNXlFdnp1T2g2cVJQeThWWG9NUmdQMlJTcms5cHREZ3FTcVVD?=
 =?utf-8?B?eCttSGxvSVFQZFd0dkxGNUxLVmlNb3NCZnRVUnVKTW5XMzZORXhhVWcvWW10?=
 =?utf-8?B?aVArRml3YnJZcmx1VCtkUUZldnNMbk56UC8wYTVtT05qMFo1NGUvbHJtTlJX?=
 =?utf-8?B?UmZ5YllVTFhnaUlCZUVOR243Q3VidmZsT0RqdFIzOCsvR0ltNldTMzl5S2Rx?=
 =?utf-8?B?YWM3UDc1WDZzSGVnM3lzVkRtQXl6K3lLRlFTNHVkYnFFY0FBcmdKaGVOdjFr?=
 =?utf-8?B?SzBUbHpFWnUxajhvZ2FCQ2MvbEZleTRHNGZwNDBsV2QvWmJMaWVoOHc5eGR0?=
 =?utf-8?B?WklrSFVEc1N5L3VtMVRSdWQrcHhZK0g3anJ3VTJpbjl4MFJXOHluTnBuY3g0?=
 =?utf-8?B?QWRBRk5ubG91b0FaQXNxcEY4TTd2aFVaQ3d3YXZWNVQ1TUp1TkV5VXJHUVpa?=
 =?utf-8?B?Y0NORXNDckdXUW5Nb2JYQURsT1g2MnlWdG1veVU4Y1daUXpFMnROTkhLWEpG?=
 =?utf-8?B?WVluUmkyYytsYTlrL3dIck1LY3h5bkNndHJ2RkhjQW1LZHV6cjR3V3hzckZF?=
 =?utf-8?B?dEdTUXI5ZTYyWFdOQjhMSlF3a0pMbi9vUUZua01UV1pCdkRlTmJRaGp2ME03?=
 =?utf-8?B?eFl4cnloTUZoK3luSWhtbG5lc0NsUzNWSCtpWVlVRm5EN0tvU0NTSGNWdzdZ?=
 =?utf-8?B?NytRcGRtem9TdzBpWVpjczRMSGo1NjFBMmtqSG55LzJUckFJckl6UW5IeWpU?=
 =?utf-8?B?M2lRdTQxRWhQVERnR2NTNVpYS01kb0pWWkh0KzFpaXg2SjBOd21FamNZMnhR?=
 =?utf-8?B?NGlQUGt2MkVzdHhCZW1nWXEvK0V4U1hOZGdTK2Q3bTE5ajBVWTV0dXRoYWFU?=
 =?utf-8?B?UEtlajNyKzhjcXg3b0pHZEVydVIwSU1VT2JZbFhBbkJQalJyL0NhS3N5Q1NZ?=
 =?utf-8?B?ZzBtV2ZCTWt2c0w4d0RFQkQyWGJqREY4TjhZVG9HajhRYXNUbEUyQXp6R2N5?=
 =?utf-8?B?dy9pMnJscGs0OGNOQXN2YXlsTzFSZnUzY2dOQi8zQWdBV1FIVEg1aStnMUtn?=
 =?utf-8?B?N0JacTJiTFU4VUpNelpFMkVpRmNCdHd4OHlmcUozTEROd2kxUVpDeEpTeGIv?=
 =?utf-8?B?SjJuSnB6OHhIZ0JjY09QenoxOC84anBveTdJSGd5QjVvanNyZTVuVkp1cVJr?=
 =?utf-8?B?ZjQ1ZTUwaG45TXVwejRSdWxjY24rdkZtdms2TU9VZEhNY2s0c3paTW9UblVR?=
 =?utf-8?B?ak9tZVlWVlpqbzdNWjRleVhaWUxsMlpkU2w0WmpjbUYrTVdlUitPZXN1VHVQ?=
 =?utf-8?B?V1luLzhTZmJKaWlKRjNYSzFBbTRsNDdEREJhTlUxNWtITEtRbCtPOHpyUkNu?=
 =?utf-8?B?RC9PdzQzSDI3VFFEa0Z4R2dJQmJ6YVF0Uk45eE5UVFVqd3U3TUp6bjZoMFFG?=
 =?utf-8?B?enhNQzZyYk9wRXVhaHdPaTZyVjdFQmYrdE5ia0lvaEdRSThIc0RBNm54MGFL?=
 =?utf-8?B?ejFDYml1NkZSMmQySXVIUGhKSGZORTdVT2h3QUdXNE5wNFBsR0R4WFN6UUNM?=
 =?utf-8?Q?EJdXokRTfJtY7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N0ZRRHdPU2dyVEtINEh5RWxHWC90ZmMzeU92SHFVS2FnUVdCT0NablVqMlFD?=
 =?utf-8?B?Q3Y3c2NYcHl3cVdxU0QrY2hWODFHUWpCaFd3Y0Nsb0pORWEzdEZvbUF3TDVx?=
 =?utf-8?B?VXN6Z2Nva3M2d2xPekVoTUg0ZEtnUmJlaWhULzY5ZXE3a2wzRXR5ZGY4aEFk?=
 =?utf-8?B?R0xvTGVCWVRWWUxldVc4cUpBeDR2ck9LRE1UMFhJUHNERWwrVGx2bFc4SGRF?=
 =?utf-8?B?cjR4d09pUXZqcnNxQ0gwVlNFQllneCtIZmJKdFgyUmpEazNxTDVvTjJtdkpk?=
 =?utf-8?B?TE5vODZQbVgrd2RQaXdaQUYrYjloSVNGQ3htQXg0TDBiTlV1ZDJKUnlLSHpG?=
 =?utf-8?B?bklucFdOV3k4ZEF4c0l1UURUdE1iZHhyK29mM3NxUUFoY0RHT1U1NitRbUlk?=
 =?utf-8?B?Sjg5MnFGdFpMQU1wcDZCaUkrOHlma3VkUTY1Z2dQWER6TXVGbGp6a05pbG4x?=
 =?utf-8?B?bTQyK0gxSHVUays1VGNtT0xTdXBCMFFFUS9zVkFacHI0Y2JKWHBERWE1SXdI?=
 =?utf-8?B?QnU1R2ZLQ1VheXRjcDR1VTRWVFpsaHBuSDBsd0piWlI1bkFrQnNlZVpkMk1j?=
 =?utf-8?B?d0gycm45b3dhRnYxR3FNdWZUVTZvWkhKeS82NkhoUHlXUW1VK2k4NTRnVG1O?=
 =?utf-8?B?OUdINGx1SkxTOC85NnI1NEVEVXhMWVRpVkRicDRBNTY1TmJWaGgwN0FaSjZi?=
 =?utf-8?B?V01neTlHQ2JFSkFDUW1KVnZLZHBseitCenNiVG1FQmpOTUJydlFZT0xiNUM4?=
 =?utf-8?B?U0k0QlYwSFp5YnBjMjVrVmYrSUVNSE5Wc0YvblB2Z2ovVUQ3UHlrdFVmS05x?=
 =?utf-8?B?N1JqNjhnMnlZWjNmTUhka2xHUGFaaDVsZGhRY0RTVlpQeHdRSTdWM2JrWFdr?=
 =?utf-8?B?M2hjdW4vQzFUbmI1RmROeGlVT1pmcFQxNU96YW5XRjFObEdFdHc3ZkxOcXkz?=
 =?utf-8?B?L2t2MWN6WUtIRW5GeTVQOFVVZ0I3TW1YS2l0V2d2R2NqNVJIeGQ5d000dVYw?=
 =?utf-8?B?RkRjeERqR0NCUW9sSGxjU2xnamZGOTBpREJTWFdybkk4bG8rZnVYT3lFV0VU?=
 =?utf-8?B?R2N3YVRWSlJKOTZad3RSNGJBVHpTMDNOaUUzK290cEx2eW5BVXNsWHU2dWls?=
 =?utf-8?B?cElKb2FWdG5QeE1oczBJek9zcnRhZ0MvYndDcU1TMzJ2QmM4emlGU0pzY3Ju?=
 =?utf-8?B?TDVHUUxsNnpST1lhTjZPSVRGQkgzVHd5WFNDcVliTVVveXAxcis5K0ZTKzRU?=
 =?utf-8?B?eWRTV3FGbVQrOFp1YVdINWxPK0ZTOUFmRngyNTNKVTNzTFFOWGRmOHErTWdi?=
 =?utf-8?B?R3luaGlKdUV3NitwZ3lwUWsvb2RSZ2lYSVNPMGxsenBuckZURGdoY1VKRHRi?=
 =?utf-8?B?QVpkWER0L2luOGo0aVc0QktiUi91T2RtNTIrQXc3eEhCSEVabll5dXBwRVp4?=
 =?utf-8?B?QkFoWGlmWktPMXA3SjA4SW4wdzRKVlhmQ2F0UDlsNjV3RG1hVnJ6R2ZlWk81?=
 =?utf-8?B?b25IOVV2NEgwb1JKSHNuLytVa0tXM1doQVZMbkdPcmM2cU8vZDFRSjZJMnUy?=
 =?utf-8?B?ejZuK1phZTFweUZxUUdIYVJRRXlvRVFmZWNmc1VUZ2tPWWt3YkQxOUZsWEZ4?=
 =?utf-8?B?QWFJSk10clkvY214UU9mMWxNS1krUlF4VDR2eWpsb0NmcHBRaGNiUy9DbGZW?=
 =?utf-8?B?a0c1TFYrVGIremJLb2FDQnlLMTJ2Z2x0WHJjdjdoYnQxb2hYdnQ2UlFxUVRW?=
 =?utf-8?B?ZlArUlVrY3QxL0ZKUFhsV1lIZkY0bzNsTDU5cTd2bmFpQTJ6Z3krNXgyZUZU?=
 =?utf-8?B?UXNVT1NkcUt5TWZTbmF5N09LZnd2WFdMSnc3VTVOSTFZQ0pJUG5LSWQ5NTJH?=
 =?utf-8?B?by9TQktRVlFwQ1RuTFAvL0lpYU5mOUxWUWtyaTlSS3NHVTQ3Rmpodk5PYWV4?=
 =?utf-8?B?eC9kVXV1OFY1czFMTFJQMmh6SlB0ZVlMN3pBd2RRYkVXK2ZrNEdERm11Z0Zm?=
 =?utf-8?B?ancwRUVMaFJqVCtPUVdmTVNmZWI5VHZYeDgxQ3FjKzAweFRaSWZyN0JsYnZk?=
 =?utf-8?B?aFM0VkIyeHVJOWFRWWErRlZycFNxTmNkaERhcmJlYkdweXpOSzlpa0dwTjEz?=
 =?utf-8?B?aUVMYlZCU3pzeHpPRVlhd2l4bndXRWN1dThYbC9od3JsT0Fta00zbG5Fei9D?=
 =?utf-8?B?Mnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b81038e-23f9-470b-de84-08dd2f7f0f99
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2025 00:54:52.7222 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iQTbPiq5UHOytlsQ4W23NsZb6kY9GnApXUAT+o12XTWMglOjLbi/SGP1MV/EB6ZjbTjt+bSHorkrY3Pcy5k5IqLBXqpbgtEZFr3ztNlMwa4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7991
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


On 12/20/2024 1:17 PM, Rodrigo Vivi wrote:
> On Thu, Dec 19, 2024 at 05:19:10PM -0800, Vinay Belgaumkar wrote:
>> Define PMU events for GT frequency (actual and requested). This is
>> a port from the i915 driver implementation, where an internal timer
>> is used to aggregate GT frequencies over certain fixed interval.
>> Following PMU events are being added-
>>
>>    xe_0000_00_02.0/actual-frequency/              [Kernel PMU event]
>>    xe_0000_00_02.0/requested-frequency/           [Kernel PMU event]
>>
>> Standard perf commands can be used to monitor GT frequency-
>>    $ perf stat -e xe_0000_00_02.0/requested-frequency,gt_id=0/ -I1000
>>
>>       1.001175175                700 M    xe/requested-frequency,gt_id=0/
>>       2.005891881                703 M    xe/requested-frequency,gt_id=0/
>>       3.007318169                700 M    xe/requested-frequency,gt_id=0/
>>
>> Actual/requested frequencies will be 0 when GT is suspended.
>>
>> v2: Checkpatch fix, moved timer code to this patch
>> v3: Fix kunit issue
>> v4: Checkpatch warning fixes
>> v5: Make PMU events per device (Lucas)
>> v6: Reuse bits from config mask for gt_id (Lucas)
>> v7: Fix bug in pmu_enable (Riana)
>>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com> #v3
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_gt.c        |   2 +
>>   drivers/gpu/drm/xe/xe_pmu.c       | 259 +++++++++++++++++++++++++++++-
>>   drivers/gpu/drm/xe/xe_pmu.h       |   2 +
>>   drivers/gpu/drm/xe/xe_pmu_types.h |  26 +++
>>   4 files changed, 288 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>> index 64e60bcf131a..88ce52c63018 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.c
>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>> @@ -939,6 +939,8 @@ int xe_gt_resume(struct xe_gt *gt)
>>   
>>   	xe_gt_idle_enable_pg(gt);
>>   
>> +	xe_pmu_resume(gt);
>> +
>>   	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>   	xe_gt_dbg(gt, "resumed\n");
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
>> index 1115724a580d..7b0921ef8a1b 100644
>> --- a/drivers/gpu/drm/xe/xe_pmu.c
>> +++ b/drivers/gpu/drm/xe/xe_pmu.c
>> @@ -26,6 +26,8 @@
>>   static cpumask_t xe_pmu_cpumask;
>>   static unsigned int xe_pmu_target_cpu = -1;
>>   
>> +#define FREQUENCY 200
> this is too generic... please add a better name to represent what this is for...
> specially in a case that is adding gt frequency stuff this can get very confusing...
Will use TIMER_SAMPLING_FREQUENCY.
>
>> +
>>   /**
>>    * DOC: Xe PMU (Performance Monitoring Unit)
>>    *
>> @@ -65,6 +67,29 @@ static unsigned int xe_pmu_target_cpu = -1;
>>    *      2352945
>>    *
>>    * Each value is roughly a 1000ms increment here as well. This is expected GT residency when idle.
>> + *
>> + * PMU frequency events use a software timer to aggregate GT freq values over the time of capture.
>> + * This allows us to calculate a rough average over the timespan. This is why sysfs is the best way
>> + * to obtain instantaneous frequency if accuracy is intended. Advantage of using PMU is that it
>> + * results in lesser CPU utilization as compared to dumping sysfs entries repeatedly.
>> + *
>> + * To list GT frequency events, use the following-
>> + *
>> + * $ perf list | grep frequency
>> + *   xe_0000_00_02.0/actual-frequency/              [Kernel PMU event]
>> + *   xe_0000_00_02.0/requested-frequency/           [Kernel PMU event]
>> + *
>> + * $ perf stat -e xe_0000_00_02.0/requested-frequency,xe_gt_id=0/ -I1000
>> + *             time             counts unit events
>> + *      1.001189056               1950 M    xe_0000_00_02.0/requested-frequency,xe_gt_id=0/
>> + *      2.006388494               1960 M    xe_0000_00_02.0/requested-frequency,xe_gt_id=0/
>> + *      3.007930311               1959 M    xe_0000_00_02.0/requested-frequency,xe_gt_id=0/
>> + *
>> + * Dumping requested freq from sysfs-
>> + * $  while true; do cat /sys/class/drm/card0/device/tile0/gt0/freq0/cur_freq ; sleep 1; done
>> + *    1950
>> + *    1950
>> + *    1950
>>    */
>>   
>>   static struct xe_pmu *event_to_pmu(struct perf_event *event)
>> @@ -90,6 +115,12 @@ static unsigned int pm_bit(const u64 config)
>>   	case XE_PMU_C6_RESIDENCY:
>>   		val = __XE_PMU_C6_RESIDENCY_ENABLED;
>>   		break;
>> +	case XE_PMU_ACTUAL_FREQUENCY:
>> +		val =  __XE_PMU_ACTUAL_FREQUENCY_ENABLED;
>> +		break;
>> +	case XE_PMU_REQUESTED_FREQUENCY:
>> +		val = __XE_PMU_REQUESTED_FREQUENCY_ENABLED;
>> +		break;
>>   	default:
>>   		/*
>>   		 * Events that do not require sampling, or tracking state
>> @@ -106,6 +137,22 @@ static unsigned int config_bit(const u64 config)
>>   	return pm_bit(config);
>>   }
>>   
>> +static u32 config_mask(const u64 config)
>> +{
>> +	unsigned int bit = config_bit(config);
>> +
>> +	if (__builtin_constant_p(config))
>> +		BUILD_BUG_ON(bit >
>> +			     BITS_PER_TYPE(typeof_member(struct xe_pmu,
>> +							 enable)) - 1);
>> +	else
>> +		WARN_ON_ONCE(bit >
>> +			     BITS_PER_TYPE(typeof_member(struct xe_pmu,
>> +							 enable)) - 1);
>> +
>> +	return BIT(config_bit(config));
>> +}
>> +
>>   static unsigned int event_bit(struct perf_event *event)
>>   {
>>   	return config_bit(event->attr.config);
>> @@ -134,6 +181,10 @@ config_status(struct xe_device *xe, u64 config)
>>   		if (xe->info.skip_guc_pc)
>>   			return -ENODEV;
>>   		break;
>> +	case XE_PMU_ACTUAL_FREQUENCY:
>> +		fallthrough;
>> +	case XE_PMU_REQUESTED_FREQUENCY:
>> +		break;
>>   	default:
>>   		return -ENOENT;
>>   	}
>> @@ -198,6 +249,12 @@ store_sample(struct xe_pmu *pmu, unsigned int gt_id, int sample, u64 val)
>>   	pmu->event_sample[gt_id][sample].cur = val;
>>   }
>>   
>> +static void
>> +add_sample_mult(struct xe_pmu *pmu, unsigned int gt_id, int sample, u32 val, u32 mul)
>> +{
>> +	pmu->event_sample[gt_id][sample].cur += mul_u32_u32(val, mul);
>> +}
>> +
>>   static u64 get_c6(struct xe_gt *gt)
>>   {
>>   	struct xe_device *xe = gt_to_xe(gt);
>> @@ -243,6 +300,7 @@ static u64 __xe_pmu_event_read(struct perf_event *event)
>>   {
>>   	struct xe_device *xe =
>>   		container_of(event->pmu, typeof(*xe), pmu.base);
>> +	struct xe_pmu *pmu = &xe->pmu;
>>   	const u64 config = event->attr.config;
>>   	const u64 gt_id = config >> __XE_PMU_GT_SHIFT;
>>   	struct xe_gt *gt = xe_device_get_gt(xe, gt_id);
>> @@ -252,6 +310,18 @@ static u64 __xe_pmu_event_read(struct perf_event *event)
>>   	case XE_PMU_C6_RESIDENCY:
>>   		val = get_c6(gt);
>>   		break;
>> +	case XE_PMU_ACTUAL_FREQUENCY:
>> +		val =
>> +		   div_u64(read_sample(pmu, gt_id,
>> +				       __XE_SAMPLE_FREQ_ACT),
>> +			   USEC_PER_SEC /* to MHz */);
>> +		break;
>> +	case XE_PMU_REQUESTED_FREQUENCY:
>> +		val =
>> +		   div_u64(read_sample(pmu, gt_id,
>> +				       __XE_SAMPLE_FREQ_REQ),
>> +			   USEC_PER_SEC /* to MHz */);
>> +		break;
>>   	default:
>>   		drm_warn(&gt->tile->xe->drm, "unknown pmu event\n");
>>   	}
>> @@ -280,11 +350,153 @@ static void xe_pmu_event_read(struct perf_event *event)
>>   	local64_add(new - prev, &event->count);
>>   }
>>   
>> +static u32 frequency_enabled_mask(void)
>> +{
>> +	unsigned int i;
>> +	u32 mask = 0;
>> +
>> +	for (i = 0; i < XE_PMU_MAX_GT; i++)
>> +		mask |= config_mask(__XE_PMU_ACTUAL_FREQUENCY(i)) |
>> +		config_mask(__XE_PMU_REQUESTED_FREQUENCY(i));
>> +
>> +	return mask;
>> +}
>> +
>> +static bool
>> +frequency_sampling_enabled(struct xe_pmu *pmu, unsigned int gt)
>> +{
>> +	return pmu->enable &
>> +	       (config_mask(__XE_PMU_ACTUAL_FREQUENCY(gt)) |
>> +		config_mask(__XE_PMU_REQUESTED_FREQUENCY(gt)));
>> +}
>> +
>> +static void
>> +frequency_sample(struct xe_gt *gt, unsigned int period_ns)
>> +{
>> +	struct xe_device *xe = gt_to_xe(gt);
>> +	const unsigned int gt_id = gt->info.id;
>> +	struct xe_pmu *pmu = &xe->pmu;
>> +	bool device_awake;
>> +	int ret;
>> +	u32 cur_freq;
>> +
>> +	if (!frequency_sampling_enabled(pmu, gt_id))
>> +		return;
>> +
>> +	/* Report 0/0 (actual/requested) frequency while GT is suspended. */
>> +	device_awake = xe_pm_runtime_get_if_active(xe);
>> +	if (!device_awake)
>> +		return;
>> +
>> +	if (pmu->enable & config_mask(__XE_PMU_ACTUAL_FREQUENCY(gt_id))) {
>> +		u32 val;
>> +
>> +		/*
>> +		 * We take a quick peek here without using forcewake
>> +		 * so that we don't perturb the system under observation
>> +		 * (forcewake => !rc6 => increased power use). We expect
>> +		 * that if the read fails because it is outside of the
>> +		 * mmio power well, then it will return 0 -- in which
>> +		 * case we assume the system is running at the intended
>> +		 * frequency. Fortunately, the read should rarely fail!
>> +		 */
> I'm just wondering here if we could/should use the latest know valid freq
> when we read 0...?!

Sysfs will return 0, so we should do the same here as well? Also, 
returning a non-zero value here will skew the data. User can always look 
at requested_freq which will be non-zero (assuming system is not suspended).

Thanks,

Vinay.

>
>> +		val = xe_guc_pc_get_act_freq(&gt->uc.guc.pc);
>> +
>> +		add_sample_mult(pmu, gt_id, __XE_SAMPLE_FREQ_ACT,
>> +				val, period_ns / 1000);
>> +	}
>> +
>> +	if (pmu->enable & config_mask(__XE_PMU_REQUESTED_FREQUENCY(gt_id))) {
>> +		ret = xe_guc_pc_get_cur_freq(&gt->uc.guc.pc, &cur_freq);
>> +		if (!ret)
>> +			add_sample_mult(pmu, gt_id, __XE_SAMPLE_FREQ_REQ,
>> +					cur_freq,
>> +					period_ns / 1000);
>> +	}
>> +
>> +	xe_pm_runtime_put(xe);
>> +}
>> +
>> +static enum hrtimer_restart xe_sample(struct hrtimer *hrtimer)
>> +{
>> +	struct xe_pmu *pmu = container_of(hrtimer, struct xe_pmu, timer);
>> +	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
>> +	u64 period = max_t(u64, 10000, NSEC_PER_SEC / FREQUENCY);
>> +	unsigned int period_ns;
>> +	struct xe_gt *gt;
>> +	unsigned int i;
>> +	ktime_t now;
>> +
>> +	if (!READ_ONCE(pmu->timer_enabled))
>> +		return HRTIMER_NORESTART;
>> +
>> +	now = ktime_get();
>> +	period_ns = ktime_to_ns(ktime_sub(now, pmu->timer_last));
>> +	pmu->timer_last = now;
>> +
>> +	/*
>> +	 * Strictly speaking the passed in period may not be 100% accurate for
>> +	 * all internal calculation, since some amount of time can be spent on
>> +	 * grabbing the forcewake. However the potential error from timer call-
>> +	 * back delay greatly dominates this so we keep it simple.
>> +	 */
>> +
>> +	for_each_gt(gt, xe, i) {
>> +		if (!(pmu->active_gts & BIT(i)))
>> +			continue;
>> +		frequency_sample(gt, period_ns);
>> +	}
>> +
>> +	hrtimer_forward(hrtimer, now, ns_to_ktime(period));
>> +
>> +	return HRTIMER_RESTART;
>> +}
>> +
>> +static bool pmu_needs_timer(struct xe_pmu *pmu)
>> +{
>> +	u32 enable;
>> +
>> +	/*
>> +	 * Only some counters need the sampling timer.
>> +	 *
>> +	 * We start with a bitmask of all currently enabled events.
>> +	 */
>> +	enable = pmu->enable;
>> +
>> +	/*
>> +	 * Mask out all the ones which do not need the timer, or in
>> +	 * other words keep all the ones that could need the timer.
>> +	 */
>> +	enable &= frequency_enabled_mask();
>> +
>> +	/*
>> +	 * If some bits remain it means we need the sampling timer running.
>> +	 */
>> +	return enable;
>> +}
>> +
>> +static void __xe_pmu_maybe_start_timer(struct xe_pmu *pmu)
>> +{
>> +	u64 period = max_t(u64, 10000, NSEC_PER_SEC / FREQUENCY);
>> +
>> +	if (!pmu->timer_enabled && pmu_needs_timer(pmu)) {
>> +		pmu->timer_enabled = true;
>> +		pmu->timer_last = ktime_get();
>> +		hrtimer_start_range_ns(&pmu->timer,
>> +				       ns_to_ktime(period), 0,
>> +				       HRTIMER_MODE_REL_PINNED);
>> +	}
>> +}
>> +
>>   static void xe_pmu_enable(struct perf_event *event)
>>   {
>>   	struct xe_pmu *pmu = event_to_pmu(event);
>> +	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
>> +	struct xe_gt *gt;
>>   	const unsigned int bit = event_bit(event);
>>   	unsigned long flags;
>> +	bool device_awake;
>> +	unsigned int i;
>>   
>>   	if (bit == -1)
>>   		goto update;
>> @@ -302,6 +514,18 @@ static void xe_pmu_enable(struct perf_event *event)
>>   	pmu->enable |= BIT(bit);
>>   	pmu->enable_count[bit]++;
>>   
>> +	/*
>> +	 * Start the sampling timer if needed and not already enabled.
>> +	 */
>> +	__xe_pmu_maybe_start_timer(pmu);
>> +
>> +	device_awake = xe_pm_runtime_get_if_active(xe);
>> +	if (device_awake) {
>> +		for_each_gt(gt, xe, i)
>> +			pmu->active_gts |= BIT(gt->info.id);
>> +		xe_pm_runtime_put(xe);
>> +	}
>> +
>>   	raw_spin_unlock_irqrestore(&pmu->lock, flags);
>>   update:
>>   	/*
>> @@ -331,8 +555,10 @@ static void xe_pmu_disable(struct perf_event *event)
>>   	 * Decrement the reference count and clear the enabled
>>   	 * bitmask when the last listener on an event goes away.
>>   	 */
>> -	if (--pmu->enable_count[bit] == 0)
>> +	if (--pmu->enable_count[bit] == 0) {
>>   		pmu->enable &= ~BIT(bit);
>> +		pmu->timer_enabled &= pmu_needs_timer(pmu);
>> +	}
>>   
>>   	raw_spin_unlock_irqrestore(&pmu->lock, flags);
>>   }
>> @@ -497,6 +723,8 @@ create_event_attributes(struct xe_pmu *pmu)
>>   		const char *unit;
>>   	} events[] = {
>>   		__event(0, "c6-residency", "ms"),
>> +		__event(1, "actual-frequency", "M"),
>> +		__event(2, "requested-frequency", "M"),
>>   	};
>>   
>>   	struct perf_pmu_events_attr *pmu_attr = NULL, *pmu_iter;
>> @@ -705,6 +933,31 @@ void xe_pmu_suspend(struct xe_gt *gt)
>>   	raw_spin_unlock_irq(&pmu->lock);
>>   }
>>   
>> +/**
>> + * xe_pmu_resume() - Restart the timer if needed
>> + * @gt: GT object
>> + */
>> +void xe_pmu_resume(struct xe_gt *gt)
>> +{
>> +	struct xe_device *xe = gt_to_xe(gt);
>> +	struct xe_pmu *pmu = &xe->pmu;
>> +
>> +	if (!pmu->base.event_init)
>> +		return;
>> +
>> +	raw_spin_lock_irq(&pmu->lock);
>> +
>> +	/*
>> +	 * Re-enable sampling timer when GPU goes active.
>> +	 */
>> +	if (pmu->active_gts == 0)
>> +		__xe_pmu_maybe_start_timer(pmu);
>> +
>> +	pmu->active_gts |= BIT(gt->info.id);
>> +
>> +	raw_spin_unlock_irq(&pmu->lock);
>> +}
>> +
>>   /**
>>    * xe_pmu_unregister() - Remove/cleanup PMU registration
>>    * @arg: Ptr to pmu
>> @@ -722,6 +975,8 @@ void xe_pmu_unregister(void *arg)
>>   
>>   	pmu->registered = false;
>>   
>> +	hrtimer_cancel(&pmu->timer);
>> +
>>   	xe_pmu_unregister_cpuhp_state(pmu);
>>   
>>   	perf_pmu_unregister(&pmu->base);
>> @@ -769,6 +1024,8 @@ void xe_pmu_register(struct xe_pmu *pmu)
>>   		return;
>>   
>>   	raw_spin_lock_init(&pmu->lock);
>> +	hrtimer_init(&pmu->timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
>> +	pmu->timer.function = xe_sample;
>>   	pmu->cpuhp.cpu = -1;
>>   
>>   	pmu->name = kasprintf(GFP_KERNEL,
>> diff --git a/drivers/gpu/drm/xe/xe_pmu.h b/drivers/gpu/drm/xe/xe_pmu.h
>> index 17f5a8d7d45c..fb6e3819d7bc 100644
>> --- a/drivers/gpu/drm/xe/xe_pmu.h
>> +++ b/drivers/gpu/drm/xe/xe_pmu.h
>> @@ -16,12 +16,14 @@ void xe_pmu_exit(void);
>>   void xe_pmu_register(struct xe_pmu *pmu);
>>   void xe_pmu_unregister(void *arg);
>>   void xe_pmu_suspend(struct xe_gt *gt);
>> +void xe_pmu_resume(struct xe_gt *gt);
>>   #else
>>   static inline int xe_pmu_init(void) { return 0; }
>>   static inline void xe_pmu_exit(void) {}
>>   static inline void xe_pmu_register(struct xe_pmu *pmu) {}
>>   static inline void xe_pmu_unregister(void *arg) {}
>>   static inline void xe_pmu_suspend(struct xe_gt *gt) {}
>> +static inline void xe_pmu_resume(struct xe_gt *gt) {}
>>   #endif
>>   
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_pmu_types.h b/drivers/gpu/drm/xe/xe_pmu_types.h
>> index f47a6e1b109c..5d873bae4a0d 100644
>> --- a/drivers/gpu/drm/xe/xe_pmu_types.h
>> +++ b/drivers/gpu/drm/xe/xe_pmu_types.h
>> @@ -12,6 +12,8 @@
>>   enum {
>>   	__XE_SAMPLE_C6,
>>   	__XE_SAMPLE_C6_LAST_REPORTED,
>> +	__XE_SAMPLE_FREQ_ACT,
>> +	__XE_SAMPLE_FREQ_REQ,
>>   	__XE_NUM_PMU_SAMPLERS
>>   };
>>   
>> @@ -28,7 +30,11 @@ enum {
>>   #define __XE_PMU_PM(x) ___XE_PMU_PM(0, x)
>>   
>>   #define XE_PMU_C6_RESIDENCY                    __XE_PMU_PM(0)
>> +#define XE_PMU_ACTUAL_FREQUENCY			__XE_PMU_PM(1)
>> +#define XE_PMU_REQUESTED_FREQUENCY		__XE_PMU_PM(2)
>>   #define __XE_PMU_C6_RESIDENCY(gt)              ___XE_PMU_PM(gt, 0)
>> +#define __XE_PMU_ACTUAL_FREQUENCY(gt)		___XE_PMU_PM(gt, 1)
>> +#define __XE_PMU_REQUESTED_FREQUENCY(gt)	___XE_PMU_PM(gt, 2)
>>   
>>   /*
>>    * Non-engine events that we need to track enabled-disabled transition and
>> @@ -36,6 +42,8 @@ enum {
>>    */
>>   enum xe_pmu_tracked_events {
>>   	__XE_PMU_C6_RESIDENCY_ENABLED,
>> +	__XE_PMU_ACTUAL_FREQUENCY_ENABLED,
>> +	__XE_PMU_REQUESTED_FREQUENCY_ENABLED,
>>   	__XE_PMU_TRACKED_EVENT_COUNT, /* count marker */
>>   };
>>   
>> @@ -116,6 +124,24 @@ struct xe_pmu {
>>   	 * @sleep_last: Last time GT parked for C6 estimation.
>>   	 */
>>   	ktime_t sleep_last[XE_PMU_MAX_GT];
>> +	/**
>> +	 * @timer: Timer for internal Xe PMU sampling.
>> +	 */
>> +	struct hrtimer timer;
>> +	/**
>> +	 * @timer_last:
>> +	 *
>> +	 * Timestmap of the previous timer invocation.
>> +	 */
>> +	ktime_t timer_last;
>> +	/**
>> +	 * @timer_enabled: Should the internal sampling timer be running.
>> +	 */
>> +	bool timer_enabled;
>> +	/**
>> +	 * @active_gts: GT active mask.
>> +	 */
>> +	unsigned int active_gts;
>>   };
>>   
>>   #endif
>> -- 
>> 2.38.1
>>
