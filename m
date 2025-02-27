Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7376EC19F32
	for <intel-xe@archiver.kernel.org>; Thu, 27 Feb 2025 17:05:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A33810EAEF;
	Thu, 27 Feb 2025 17:05:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gkHD/yQ+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 043BF10EAEF
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Feb 2025 17:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740675903; x=1772211903;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=wEdbgjL6ReQ/kqKY1/0rPCUN5RRdvHTzTfTVYrpqHDk=;
 b=gkHD/yQ+ZHjzevHgAlWXfzeSln7HAK+khSP3esh8AqUViVAH9ntx8CXn
 o+LYo4Cv8/0uKAE5bbT++FodHkrAOjWXkgoNzWoqw4JZG+M80gGsmP3FZ
 Gjo9SufI4LJiUpuzCXHT91kUapgBs8zijRLFXq63hMEvM7yqjVye9eCEr
 3y5HU7WKfR+5zfSyj9HYHt691XJr+ULM9MOY7mda0QITwGUKseCUOLrVe
 VoV3B5Qlb4sURwpLmnxAyuyIZOPzCaoRiHrpQtlO9QA0Wg9iGqCW/aQr/
 FCBPvKWhn9i2oQHL9JIM33xHNnMB+pSn1ZlfogJ3ZQvSEO7gVLdYAff3k w==;
X-CSE-ConnectionGUID: l7WNiinCRfuOznOlFSJcJA==
X-CSE-MsgGUID: BR1FgMpaRkacQqahL9x8/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="29183122"
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; d="scan'208";a="29183122"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 09:05:00 -0800
X-CSE-ConnectionGUID: 2N50eqL/QAiCj/GeEKBTrg==
X-CSE-MsgGUID: sYJrnw+1Qo+QCZfOaD+Ykw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="117609479"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 09:04:59 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 27 Feb 2025 09:04:58 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 27 Feb 2025 09:04:58 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 27 Feb 2025 09:04:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fWdwsM/xslvjI6i7Npxofi65a9iEDb0kUjabcyw8jkgzTJSmLn2Et90cJS6o9GC+2fp+U13YW4HE6lQpZkNNwGFmTlCo+3vN8zmWouGtab9Hx5fsaivjaTpaHVIBoAIG/mHbPdOAyyMJA0RZ0dAvBwbgnzF6z+pOva7BrScncFqlIstPy1L6bofeViJC0Qo2KbfKSVPghfqXA70IDs59OHesv9YTn+lCoh7RvV2MA7HX6QUlHcySPpd644PI4SogGqKozqJNMEhLR95lSjw73Op3QQm0U7HT4lNj2yRdS/j1BT+rvrDxneVZdbRr0c8WeUAu5ozF1nTETXDUcq2SDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EiFAW2L9/FGtdyhIxXYrgW+y1I2ruwhn19tEws5bgdY=;
 b=wb+avX4D/5cn/KKdB8wAZXq6T/SkuKd8Ot7tCzJYSe1CM438A+jkqX49NEOmC7P+hOIHxwfyWJBTfrHTJZ1U2d+OEaMnQqSE6yRKLvy4L4JGBjJLAXzZT+NIE/J7/yIlf/5xLp3TNhRm0i0jSTUT9KtPL9PJKQsmfzkLVbGrXESidtXVqPE74f296iNotzHq6v5hB5TacaXHzyIjiZ9lcbOccYnzRzAb6W73OC2FCOK7T9NUO0UK6+BGwML9gZ7o0BpvUFWcw8L5K3QPJ8kO4zezr5V138OE/HbO2FMxmFFrhVq1U0VXT5/IdMiGH0KC7DUWA3HVy2ZlnBh6+YJXRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by DM4PR11MB6526.namprd11.prod.outlook.com (2603:10b6:8:8d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Thu, 27 Feb
 2025 17:04:40 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%7]) with mapi id 15.20.8466.016; Thu, 27 Feb 2025
 17:04:40 +0000
Message-ID: <28c3265b-3baf-49d8-b5f3-47a49b4972d3@intel.com>
Date: Thu, 27 Feb 2025 09:04:39 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Only probe stolen memory when display support is
 enabled.
To: Matthew Auld <matthew.auld@intel.com>, Maarten Lankhorst
 <dev@lankhorst.se>, <intel-xe@lists.freedesktop.org>
References: <20250227145556.428738-1-dev@lankhorst.se>
 <b10d1bfe-60dd-4412-ba72-7af698e593b0@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <b10d1bfe-60dd-4412-ba72-7af698e593b0@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR11CA0046.namprd11.prod.outlook.com
 (2603:10b6:a03:80::23) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|DM4PR11MB6526:EE_
X-MS-Office365-Filtering-Correlation-Id: c2a45cd1-123c-47bd-ae72-08dd5750d2b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L3N4YXNzbERadWZpMDhQVmo1d2pLNzVQaTNYMDRSdUUzdDZXN0k2dVBtMWZk?=
 =?utf-8?B?TWNkZjJYd092U0VrNVBBRVY4d2w0clcydDBWaWxkKzBSVTMzNUw0WjJXZVJO?=
 =?utf-8?B?aFFrUkpIWWpvSmdVVms3RHk4RzI2TGFYVHJub3orbXJOSG5nM3NYcjdYSUor?=
 =?utf-8?B?Szk5TVBMV2Zsb1N3NVpQWEdzMW9JMWZDTGNhZCtGVnJlZXVwbjdmU0RPOG1n?=
 =?utf-8?B?d1BXT3JmY0gzQWI1bHJnQnZrbFVTaWd6QmJ4aWthdUhHOXRJTHhjN1RubnZz?=
 =?utf-8?B?N1d3cWxlbjQyc1pxRnJEZVlScnVJOUMwVFBJaGtHalJrM3FydTA4ZVJHNHBk?=
 =?utf-8?B?aGNlbWVxanBhQ3BkcklZNUFZSTRuZVZuVHExd21PUFZPZVE3V3NUZDVwbDRm?=
 =?utf-8?B?VnM2MGxvZDVldDE3YTR6U1oxdjd0QkJpRjZ5bkcyOEdONlNvMmNHUmFEaCtJ?=
 =?utf-8?B?VGJXMm1Sc1NhWENDbDFRNDRyMkJhMFd0RDg1aURIRTNSMmNmcDdVQVV6Q3Va?=
 =?utf-8?B?NndpVHFUK1lEbkVaSlZyRXJmb08zRUlYcXBSR3VlaUhQNFFiZEUzTUNsYlAw?=
 =?utf-8?B?OHBTVDJuMWhOY3ZmQ0prb0VjeFhZa0ZXTE1rNHdiL0JpNmtheE1iTm5YaEVn?=
 =?utf-8?B?REk2elU0WFhrcitmang4TnhCN0plWEx1SEprMW1LZjArd0p6TlN6MXFoSTU2?=
 =?utf-8?B?T25PTzdRays1WjZUWEFLMXBPaVdkYko1dEVWNW9BR2YwQUJ3R25ZZzZ3S3FQ?=
 =?utf-8?B?Z0R2ODd5TzF5YzNoYzdzWDZCVUU1a1RhUmZiMjA5UmlPUm8vL211Zm15RDdh?=
 =?utf-8?B?THVjOXZrVVEvcG1lUThYejJXRFkzOElpdE5CNHZkNmROVTdCSDJvK3o2a0ZE?=
 =?utf-8?B?T2F0Z0FLdFUxYWZWR24vRFF6aVg3N3BhZGl5OC9mZGdiYlBPcytWSjVQaVNo?=
 =?utf-8?B?RzRKTmpSa2JLUHFGN0MyT21ObHI1QUk2S0dDSzNtdktuNmEwWjl2bFpMKzJY?=
 =?utf-8?B?ZnpPc012MDFCMi95TFhDRXA1a2NmSDJGajZEUEY0bStzWE9sQ21DTXQyWGVX?=
 =?utf-8?B?UEwweklyT2VZaEJZaFJhV2JGR3hKdnhJWFVTY3FybTBEWTdMN3lpL01QQ1RJ?=
 =?utf-8?B?cDhEczd2bFFadCtkMmlQdWJLUXROd3JpZFVLalNTd3VVMHN1TFZmVFZ4NlFr?=
 =?utf-8?B?OUxHWHA4R2E5T1FicStUNWtZMDJIRnFMK3pwVFJ3RE9oSEJ5aWtXa2M4YkFQ?=
 =?utf-8?B?Yjk3UjBEVm9MT2JOOWJZaVg5algvOTdKNi8wZTRaeWxuUXRlK1ZaeWV2RmpB?=
 =?utf-8?B?Z0FFc1piMUZ4Rld5YmxJMy9lZ2E1cThjd0xMT09saUhSUU1iUEhDRGVFYUx2?=
 =?utf-8?B?NGRTSGo3K3E1aGtmN1FkNGZBNjJuOHhLell1aWovelFBcStRaksxN3dWY0RN?=
 =?utf-8?B?TkxtMjErVnpJU2pRVkpJb0VlM0xJQW9za3Q5K0twRjdabldtU2hPc3grc29Z?=
 =?utf-8?B?a0dNYW9oZytsUXRsSDRLOFZ4aWp6RU9QSGhtaXJzV3JNZFpkTTl0LzJoVUZw?=
 =?utf-8?B?bytUVXRDcWZqS2ZUMmgvbS9IYTdWVFo0aUpzMU5tVENKTkR4endaTUYyWi9C?=
 =?utf-8?B?cVhOMGY3eUhIa0U1RW5TREdDZEM5alFpV1dweVY0TFpGUXMwbW5KWEFZMmxk?=
 =?utf-8?B?SlVNdEdWak5UVWVUbXlnQ3pDMi91M0tQYWtFR3djNVFPQ3BscmNFNnNsbllQ?=
 =?utf-8?B?S3dwSmxxdkZwajdVZzkxdCt0c2NTL21hN2RYMjFtOGtwMVFQaHpIenI2QVhJ?=
 =?utf-8?B?ZnkvVnJKMXRhQnFFaWZnd3JMd0hUdEZQanB0VDhSSElQa0NEY2hiNTdhV044?=
 =?utf-8?Q?iM2Ctg2Hb0+5L?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?blRBY2lUNExvMEtaVDZwQ1VldUhjM21rQktvU1QzdkIxcCs3a1BhQ0JwRmh1?=
 =?utf-8?B?aUxaM0NDYXU4cS85K1NmYWJDTVl5eng3cFRqY3cveGNncXVJN21KNTJDYmU4?=
 =?utf-8?B?VzduR0R3dGlidUFPS1BXa2pvU1hFcGhhWmwzdHVkQUVWanFCWDAvUHZGRWxC?=
 =?utf-8?B?WW13VWN3T2RXRDBScDgvbWl1Y08xbWs1K3diZGUxTXQ2QjRtNU5Kb0RjVUJZ?=
 =?utf-8?B?dUppSFZNVmNNVUVGRS9KMllRRmYrOFM5c0NnZWtvNGZ6ekNSeWM1eGxYaXFo?=
 =?utf-8?B?UDZRWDFtN1VCOUdsMHR1aEg3clZldkhDck1aMjBQQXk0VFd4Q0M5cWN3d0lh?=
 =?utf-8?B?UlA0V0g5RTJrSlQyNU1DMDAweGNoVzEvc2psa29GSVRWRy9taTJPQWRuL3N2?=
 =?utf-8?B?N2NiR0puZVRuaW05N1cyQW9xZmc3Y3ppMEtzRDZGZnplYS9mNlNJUWdraG95?=
 =?utf-8?B?aFVmbEFBOHpHNkQ3UWRWS3IvZlprdW5PbTdLNTJzQzdpZTVBSHU5Z1BJbTRz?=
 =?utf-8?B?d1lDWWM5a1RleFZVaGhreUxVSnBUWlN3Y1NxN2ZRSzZoS3hCTUhDR2p4VkJl?=
 =?utf-8?B?Z09JWG9EUmJmTmdxNTZOVzRVdW4zT0tNNVhvZnBxUzdxNiszZStiOG84MmhI?=
 =?utf-8?B?MGR6T0ZWQXh5Y2FZaFg5UkRBTTVKVndpRitveXRoc1ZRaTVrdEdtZmV4cG9J?=
 =?utf-8?B?N1plN3cvN09TbDdoN3FmSmw3VFNBaEFUTWZ6VlhsYTlMQ2xxa3M1ZFVjTWI3?=
 =?utf-8?B?bFFuODNNdTBneE1hSmdrS2pmNWRiMGppOXVKRjNNWjdsTkdobTJzejgraVNO?=
 =?utf-8?B?RmRncEhTQWdXb0RTYjVWc0JqK2RmeXgxd0tkSEovK0s0aDhQZURyeG9DajJn?=
 =?utf-8?B?cUxzRXZUYVhKc3JvbWtaK0tJWjJMaHNUS0RrVHFKOWlFUEh2MFRDRXVwSm1X?=
 =?utf-8?B?UDU2QTFCSVhYNVR5K0lrTDlpeFJDZ3VvWVB3YldDRVFodktIOHFpQ1Q4WnVm?=
 =?utf-8?B?Q21iOUpwYThZYTFVeTMzZ293VlpjUXYxcXF4OUdQaWpjUWVrTHF5ZzU0cURG?=
 =?utf-8?B?ZHkyNUsyTFVua2NXeVlFOHA0T016OW5qUXRuaE4xc1IveWtWUVNIVndKVmV2?=
 =?utf-8?B?eHMrcVNqSFJOQnk2MGdldjJDbVpWNC9GUGJETENCelM4dkdiNmZYbkEwZG1E?=
 =?utf-8?B?WGR4d01UbTRPdVNlbEQ5bENRRDRiUmhjY3h1ZmtkRW9YTG1DTnVxTHJKZjJt?=
 =?utf-8?B?TjgxYmdVcS9Pd1dPd3l2c0RHWE90QmFONDgvdjZtcWxXbHJOUm1HRHRRRnhh?=
 =?utf-8?B?bmorZzlsQzR0eHFmb0tpdWowMHZOUDlkZG4xbThnWTlzSWI0V3drSUpkQnN3?=
 =?utf-8?B?ZEJZQ2pYWlRQNTNVbnpLNDY5d1hsaXYrNHh6YW12OUtVUHJIUXM5OTRUaUlR?=
 =?utf-8?B?TlVFYUtzYldWWm9wZThWVHpNTnRyeHpKM0g0N2FkVzVvRU9OY0kvRVpKM1NN?=
 =?utf-8?B?QkYwV0RoT0RIUEJETm5UNTI5dkg5MEtCd0hRY2ZJNW9LTWIyRjhWeW9PSGlo?=
 =?utf-8?B?MUdkTDB3bHBtbU53REorUHRjdS9zRkJrNjg2R1NKdHlURnRQZTZzdTcyWVFM?=
 =?utf-8?B?Q0c1RHk2N3Zncy9uWDBZczBXK0VIOHBBQUxxOXkzbUVNeDZpbmE1VExtVHVF?=
 =?utf-8?B?ZmloTWxMYWVsTTVQL05uYm5HaC9xRDNJUEdET2xDSHF4RDZCNEI5SEJKcHRt?=
 =?utf-8?B?RGFpMWZuQWkzU0RZZDZOdDNtb3pzbTFoTU1wbHFGVFdYc05WUFFLajFyenQ3?=
 =?utf-8?B?WTNSNThMU0huajVVbjkzYTBrRlFJSWIxWHl5UlVFMlNFSmR1Unh0dTlhaFRT?=
 =?utf-8?B?THIvQ0RVVjNkQU1oMTFiV3hEOFZSbUdWOVFaZHFnU3RVQW4vVStFeHlUaExO?=
 =?utf-8?B?R29TbjgzdUNzSllTaDQwV1czM0ZOUWFSWkdqZW5rZFhkWkovVGNzMnM3WU9l?=
 =?utf-8?B?TWxZYko1OHhlVGxtQXI4R1lsa0U2Zy9lT2dtRU9oQ2FxNmJYbzdrdTBhSEVl?=
 =?utf-8?B?OGJWbStOdWVPOTVEOGxLSzduNjQ2OXVteUZCbHRiVVNFd1FjQk5IbzFBV0h2?=
 =?utf-8?B?MGtQeVh5S1dwNUxTdDJsUzJObXBSbk1wcnJRRzNqOHFrSVQrL1JQOHZHS0Yr?=
 =?utf-8?Q?uLg+WUuoaV3do5Kj7K1OzsM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c2a45cd1-123c-47bd-ae72-08dd5750d2b5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2025 17:04:40.2995 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pBs4FwSRsUyZXdqmVY0ywj2Oxfz1Z4ZlK3bM9Pjxk1CQTMUSyloDDmG1LJLOWTeNJ5Sr4y3waX/gaF5w/CGH/iACmt4JSEMw/mB6lxsPsWw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6526
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



On 2/27/2025 7:05 AM, Matthew Auld wrote:
> On 27/02/2025 14:55, Maarten Lankhorst wrote:
>> Without display, there is no need for display stolen memory.
>>
>> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
>
> There is also xe_gsc_init_post_hwconfig() which looks to use stolen, 
> and I don't think that is dependent on display. But maybe that gsc 
> stuff doesn't have to use stolen? Daniele, any idea here?

The GSC allocation does have to use stolen, at least on some platforms. 
I think the requirement might be gone from recent platforms (PTL 
onwards) because the FW is now being copied to WOPCM instead, but I am 
not 100% sure. I didn't confirm this because we still need to keep using 
stolen for older platforms and it was just easier to keep using stolen 
everywhere; if you think there is value in changing this for newer 
platforms I can check with the GSC team and confirm.

Daniele

>
>> ---
>>   drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c 
>> b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
>> index d9c9d2547aadf..2e60d5346ec43 100644
>> --- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
>> +++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
>> @@ -218,7 +218,7 @@ int xe_ttm_stolen_mgr_init(struct xe_device *xe)
>>       if (!mgr)
>>           return -ENOMEM;
>>   -    if (IS_SRIOV_VF(xe))
>> +    if (!xe->info.probe_display)
>>           stolen_size = 0;
>>       else if (IS_DGFX(xe))
>>           stolen_size = detect_bar2_dgfx(xe, mgr);
>

