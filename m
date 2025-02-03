Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0D53C02190
	for <intel-xe@archiver.kernel.org>; Mon,  3 Feb 2025 05:15:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 719DF10E05C;
	Mon,  3 Feb 2025 05:15:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="maxmzB5X";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D65B10E05C
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Feb 2025 05:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738559755; x=1770095755;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=FiKhX0mvwEQ0ynavWgtUy2gCbSesBtcTlE+F77MukEo=;
 b=maxmzB5X9BRpdIJcpAhFfHyox6RPkmftx9J8LqrjR6cj+n1t3CxZGkMu
 7xL+k9opOcxnTvl1JdNQTqiXeSTAtfHKuNCnHXVLcpunsYKqIwRXb49RJ
 F3rRIXhUIWndp2fB23Kj+4qfG/LP9i+RsZlsdR607hcXyA6aUSoZ8XrB1
 ig3MAuBY2JaUz4EdNzmpTvmxoWJJLF3pxSw7TSYSNsR1a7MHugYIOXrTl
 3KY3nQtKjSkUVGIu2oNoAKYFTkUfqPzvWIhOQ9n9VpC1drtHoB+pLT25v
 vkFfP0lVOe0g9JQ3wowJt6NElYp0yjMlahq2NNMnLnaO1u7s7t8vH0gLM Q==;
X-CSE-ConnectionGUID: 2eBkUH1IT6meYLFigjPSIw==
X-CSE-MsgGUID: cBlvRmYFRdefXDB14wMt0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11334"; a="50431093"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; d="scan'208";a="50431093"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2025 21:15:54 -0800
X-CSE-ConnectionGUID: djxPucrAQcWeD78x4QqPEg==
X-CSE-MsgGUID: 2SCGU0LeQx6kafGRnww5yA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; d="scan'208";a="110026505"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Feb 2025 21:15:54 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sun, 2 Feb 2025 21:15:53 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Sun, 2 Feb 2025 21:15:53 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 2 Feb 2025 21:15:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ho3tCAXaS7KQBm6Xk0F/JKzGpbutJNHO31LM8najFCjwaIj6G0M2jUVhfj5PF12ST4x+q7HLXNBqwXIHnP2lXa/b3hbcrzHluzVuiktB8TMSj9FCDfDDtiz9fAUgMcbnLBfd7njpJXY2EqC9pSdFDlH6tClxXFp/p/7G8pmwI51LUoPX+5hYRyp5DOoLQs+JYqbw2jqLZO3dAmNTRKVWl327HU8qtWPZdlaoYUGvCQNkubPmpaE3oJe2OLwIhk/9BW8LTx5f41wd1U0oH9JS8quWG6pZM/xcgAKDsXGbZE48+dupFhrf+qHKGVPqb/5RQONz7NnEGwQuD+/P0bL4Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rAo/ekHOS1geZv4tNb5GxPZC8H82sgzDmnNSKn8CmGk=;
 b=rQjX1+yw3cREQjg/dVaCWzkDN22b9VMIK/X7hs9F4arF6CqqYVFnOIYCUP3ExfrQP5uAFZlmQJ87dVSvhzIy5YLeDF02FEwSraZtAtfcO7cQrn0OIBeyIn5fHxk2iOqtTtlilGMD2mp6elxSDbHmRDNoAiowz4K5FbYoSrrK/Uer+nN4At6tozmpB/6O4ifHMN8/rf4ABUtbz4foYYb+ykGzlY2+tJA9xvlu91D8/QJ7tTupFl9tM4KIgWkj+Czd0CUK9QESkVCv5hJIc+6iFUKTv8wYyVSZ3MwHddvnpiz9Q6AmKiT679a4hW8uvS4C5ZSFguVHspYZ0+VmK3A9kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 LV3PR11MB8554.namprd11.prod.outlook.com (2603:10b6:408:1bb::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Mon, 3 Feb
 2025 05:15:50 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%4]) with mapi id 15.20.8398.025; Mon, 3 Feb 2025
 05:15:50 +0000
Message-ID: <fa601a72-5ace-4367-ba1e-1af0cb8ba34d@intel.com>
Date: Mon, 3 Feb 2025 10:45:42 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/8] drm/xe: Add per-engine-class activity support
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>, <vinay.belgaumkar@intel.com>,
 <soham.purkait@intel.com>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>
References: <20250129101653.1976699-1-riana.tauro@intel.com>
 <20250129101653.1976699-2-riana.tauro@intel.com>
 <Z5rHtFUIbLNRfBfk@orsosgc001> <Z5rlgedsHPm6lhSw@intel.com>
 <d2bb059f-61a3-4e5c-bd84-b8a746a10f87@intel.com> <Z5v-00L-GsSTye0h@intel.com>
 <fof33aho3t55pqxhnaclyzhld2iroeqwckd3uk47wvn3ec73iq@fftqnbgdfuic>
 <Z50Et4/UGF7npJ0r@orsosgc001>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <Z50Et4/UGF7npJ0r@orsosgc001>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BM1P287CA0024.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:40::25) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|LV3PR11MB8554:EE_
X-MS-Office365-Filtering-Correlation-Id: f83b3857-4563-48d9-6425-08dd4411d29a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QWZNaGNGcTBWY0FZSXpFZ3UvRHBsTFRJanZhMVJrbkFURjdNeUs1UGV2OU1l?=
 =?utf-8?B?WTRQK0NCNTUxU3VXSVBnT0ZGeTRXTGFOUUNsSllaU0ttbmEwQk8vcmxlYUI0?=
 =?utf-8?B?c3g0OWYzU3QxVGFYR010YzB1bFNnWHVwRVNyU0xhckFFelRxc0xkZGlsNXB3?=
 =?utf-8?B?bmkrUERXNi9DRmFPanFjdEVEbWxWSlQvVUNOVFU3Q0VMcXB2S05CdTZ6Vjdt?=
 =?utf-8?B?UndnL3I3WStvdXFZWEZiM0VrK0lnbnFPUWh3YjRML3VjSUVFLytCaUIyTk5E?=
 =?utf-8?B?WDJsbjk1VjNrelRPd0VoUW9uQmZ1bWxuaC9wVVRBRWpIdEZiN2UyY2lFUEdV?=
 =?utf-8?B?K2tNdzZybG55anBWRVB0cXE1T1MyYk1TM1FiRzJGT2JkS2NUNi9ZZytqY1J3?=
 =?utf-8?B?djJNZVFRclBDUytzQjFCSDJob2ZaTHdiSExHbGtOY2lYeDdSamRkUWw3QXAv?=
 =?utf-8?B?bis0MnlnVmVoS2ZtSmlwL2lTZERYd2p1Q0VBUmhvTFpqZ0dwQmhnYUNCOFFR?=
 =?utf-8?B?QWdNWEgwOUNONzNyZWdCNTFLcGYwaU5VZmRTNVVIT1dKa0dzcHptMnZFd2VK?=
 =?utf-8?B?U1ZNcmhra216dy9QZDUyak9aeHJSaDdyQ0NndWw3dVdlYUhPVHNTWUpzYklS?=
 =?utf-8?B?aG9MMnkwdXdWV25CTnB0NDlkajU4T2pNYkFSVTJ4aWVOR3BudkVqYjYxdWNQ?=
 =?utf-8?B?LzBNdHJaOEpTa2k5dm9ZTVVHZjdwNnl0OHp1dkkyeW9TaUxIcDYvM09mRG9j?=
 =?utf-8?B?N2xCYk0xKzU2dG91dzVFa1Y1YzA2MXY0TG44VmFWaG51SFIyOHNUYXFWNUc1?=
 =?utf-8?B?SXU1T3AyVXdROEEwUi9XOFBxdTV1eHpVVU16WTRRdExSczdrbUkrT2g1U3E2?=
 =?utf-8?B?d0dMUGJCODd6cTMreGlINGpscElFcHFlYkpCdENLeGYyQnBaT290ZUZqOXBU?=
 =?utf-8?B?T2MyVHR3Q1BMZnpwWUpRU2thdTNaUWdDVEhScTVFWEJ5U3pkS0VLc210ZEFr?=
 =?utf-8?B?Tjl2RXFCbkZYdFJXTEg5YU5oS3B3UkJRK2VIMzdUUjcwcTBmUVh3OFc3OW5D?=
 =?utf-8?B?aFpkWHl4WlBYek95RjZlNWtxTnNKQnBaM1dPMDVyU0Z2RU4vWnl1cm1lakl2?=
 =?utf-8?B?UTZ4Uk9CdmRveVg1VzJWaXBURXE4YjUrY25kVkhUa3k1bnErTTdITXhJdXZV?=
 =?utf-8?B?WmdhRXpReEtBa0hKVHZNMzl0Z1Rka2NhNmxMSWR1OTZkQTJPUjhMSEdPemh0?=
 =?utf-8?B?WERYMXk3THpyVXRHM2tqOXJjWkc0dGwvenBSOUtQNFhJK1JSR0lqSWZ3SVNk?=
 =?utf-8?B?c0NNSWdjOVNSYnM5Tm1yUVRhbTJtWG1QalJzUE5iMkczN3RPck9EWmp0S2ZO?=
 =?utf-8?B?M24zWjRiV0Y0aFlicDlxbDE2SW9xQU9pcGpuNVovRVg4VUhsbU5uWFNiR1J5?=
 =?utf-8?B?eEtmWFVOWUQrZldpNVRMOE5TdTRpMkVCOXNTVWhpeTlrd1dSOVpyQ1R3c1FV?=
 =?utf-8?B?elZOMU51THZxMlNvcTZoRndnMzJ5QUVCc0Zacitrb0l5ZlpZWjcxWUdOUTk2?=
 =?utf-8?B?eWlTSkhncVFMdmc4eVhZNlhTblBlL0JZRzcrcWpLVDE1cHptV3I2aE1xM09r?=
 =?utf-8?B?YkpncDA1L0RDNmJ1QmowcE92VDYxUHU0MnZENXJ3TzRtUC96NHcxWXd0aW1i?=
 =?utf-8?B?V3dBN3NKNFFqU053VnhNclhKNUk4ZVJ5dGVqQjFjMitCTVdXRk40MVBaTVNB?=
 =?utf-8?B?QTBkRkpvQUhEMzg5QUZUZ0dsSUtuTVRpSnVCUDI3K1VyOFcrcUxkRmMvemg3?=
 =?utf-8?B?MUhoRHFGM2Z0aEwyZnpXTnZYK2V0Z1NkR1ZHSytadWFPaStxeFVDeW04ZWFJ?=
 =?utf-8?Q?6lZxtTwyJDHO5?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L3J2OGF6aGd4Q3NlWndJckwxWjJLeXY5bjJGYlJnM2c0R3docVVnN2xhZGxD?=
 =?utf-8?B?QnQySXlvbUIyVUgxdFAyeEZ5V1phSERCUkdmcjFLQU1IeTNXOUpHYVpTMnFk?=
 =?utf-8?B?bnBNWWZ3VGFxaExlaHBQYzUvYVdMSVRKek1BL0Jpa1NmalExWTltOE5EdTl0?=
 =?utf-8?B?ZGIwN2t1bUEzUGtmajdrNklESmhpc2p6MFJGckVTMDRiY1hJalFJQ1RhR3p4?=
 =?utf-8?B?R0tCNVFLUkxlYWNqSzNCY3ZQdzU1ZFlwM3BOeE5rVERMMjNHWEpCVVN4Qkdk?=
 =?utf-8?B?NlNEdVdWdVRmU01QWUJldGc5TmNyY1ordUVmcFljRE5BVlZrL1B6MGRRanBI?=
 =?utf-8?B?REpndWJ5eXR1SldpRUY5aHpIR0lnbC9mOVdIcjV0ajJhMXdCSUdtWWN1Y1Zu?=
 =?utf-8?B?VWttdzRWdDZzdmZFdE5PM3N2bjMwYUhES1ZVa0l6amcwcURCS1A3dGNVNUNW?=
 =?utf-8?B?ZFBUVVFTMFJ4MmIwK2VHYThxcHh2YlZvRzJZVGhQZ3JBM0NYc2dpK203b0I1?=
 =?utf-8?B?Mlc1VFhEYUxQR1FEeVh3dHFISUJiL1pCeUZiZ2NsWmZHUEVaWWFxTUEzSFZ4?=
 =?utf-8?B?Qkh1bU9QYnVIRlNmS2M4TEswT0ZQbVNPSitiRWtxZ0x6UkZUZEs2WnhGSzAx?=
 =?utf-8?B?QW85Y1E5bnBKanNnc1hhbkFNeEtRWmFhOHBDVm5sdWtaR3d4dGV1UFVZdVVR?=
 =?utf-8?B?WVJWNnR4VkRnc1V3dE8zUWZDSEtFMXZ0ZG9KcTlvQm9LNHBaQXhDcXlHOUVL?=
 =?utf-8?B?SitLZmlURGFMVVdsUmZ4QmF0ZkswN3cxb1BqUCtzRVF6eTNnQnJyRFRVRVgy?=
 =?utf-8?B?cHhrQlBDMUFpRm05VWE2UVNVNys0TFNWU2ZidFNTVWE5d1ArVVBZNGhvQ295?=
 =?utf-8?B?bGVkcU1OYmltYUlwYXp2eUlyVVNVem5UUGNjdUsvaVh4OXJ3VGpUQlhJVCtO?=
 =?utf-8?B?MXgydmo0V2s5TzlBdmV5Q29nTUJzSUdoODFQdDZlY09URkpFRmtyZXNHNmJl?=
 =?utf-8?B?bXFtdVZvdnpJUlVQZVU1TGx3YUEzZkdYVVcyaE9CNzJ6OVF2aW5zdWxncXVj?=
 =?utf-8?B?Rm1rc0dpSi9ZT05hZ3BHZllreG1QWlN3QUNqL0craWc4VHZoMnV0eGQrWkFr?=
 =?utf-8?B?NmxuekljOEQ3VnN4Nm1rTVFmNnYxdk5QSUlOU0JFVlhJOS82d2U5aDgvblAr?=
 =?utf-8?B?czc2bmZTRGxkcjcxOUZNRHpUVlJhYVBKY3p4TVA1MWxIZ3dwa0pqWWRHM3Bx?=
 =?utf-8?B?UEJyblUzMk42WVRjZy9uM0tMd0pveWJvWWpJd29PMVhrMkpwMDR2NFlEbWsr?=
 =?utf-8?B?K2FCMFplM3VDdTVad0M4ZEdGMEZoUkoxaDUvbWlHQkZ1dndyMjFoT2c2YktI?=
 =?utf-8?B?Y0tUWG4zZE9sY1A3c3hkWWNUR3gxRkJUNXRncG5GTHNENThid001UUVMMmhr?=
 =?utf-8?B?MVJhaXI1UGNHcnYvbVdzS1RKSk5uM3lBMjVyWFFIdjNoVTR2Q0RQbWRDZW56?=
 =?utf-8?B?ckp1dEVGODFIUkQvb0YzaGhFODVVLzJ0WWdTNmY1NENHdGJkbW9EZzdLMHYx?=
 =?utf-8?B?SC9KcnI4aEVoTGtlaCtZRWJxY2tLWVR1MW1wNElWcExabWVmQW54UG5sYk12?=
 =?utf-8?B?OVJjWnRVOVZJY3Z4SC9CRUdNRHNrMEZtd0k1WDBFYUJmUW5Yd1lqbER2NUpl?=
 =?utf-8?B?UjRGY1BHdVhBalpxMk4xVlM2MTUvM2gyS3hpL05vTHloR2hEQlpOLzAwRzdv?=
 =?utf-8?B?VUthSHJJZWs1bDVWcEJJUk5QbUFIQks3bjgyczVPajZ5Ty9rY0tTdFM4aEY2?=
 =?utf-8?B?TW14TElOWnpDVjFhN3I2b1JhZ0VNUElENjl2aUFlNzQ1aWZ4RmVmWkhRZVYz?=
 =?utf-8?B?dWgxTC9MdlVzNTRxN1dIdVIzYVoraytDTGlyQUoyWlU5QjhUR0NtUWZ1VjBY?=
 =?utf-8?B?a05mK1AvNHlDMGk3Q1g1NytuZFE2V2pUSGwwWDY3Y2VLNWlBd21EM0hVUHRG?=
 =?utf-8?B?K0FPSTUySFBQK25sKzlENGxKUy96bWJCeStaMUxGVmllUjY2a1ljaDMramdR?=
 =?utf-8?B?SUJuZmdXM1FXUUh1NGovOEJ1MytzOVJDbkp2ZGVpQzhrdkQwM1NHcGMzYTdQ?=
 =?utf-8?Q?qJ+u1gvR6lne4wUz2mR4wPoPP?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f83b3857-4563-48d9-6425-08dd4411d29a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2025 05:15:49.9552 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sz3bFw/pHFC5nO2tdsMiEQ42XBQFW/Z14mI3ut30aVbfIDVUP3ueyaEihdJ4cH3PePRi0G2ta4Zae/YMZbWXWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8554
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

Hi Umesh

On 1/31/2025 10:43 PM, Umesh Nerlige Ramappa wrote:
> On Thu, Jan 30, 2025 at 05:56:05PM -0600, Lucas De Marchi wrote:
>> On Thu, Jan 30, 2025 at 05:36:03PM -0500, Rodrigo Vivi wrote:
>>> On Thu, Jan 30, 2025 at 10:19:24AM +0530, Riana Tauro wrote:
>>>> Hi Umesh/Rodrigo
>>>>
>>>> On 1/30/2025 8:05 AM, Rodrigo Vivi wrote:
>>>>> On Wed, Jan 29, 2025 at 04:28:36PM -0800, Umesh Nerlige Ramappa wrote:
>>>>> > On Wed, Jan 29, 2025 at 03:46:44PM +0530, Riana Tauro wrote:
>>>>> > > GuC provides support to read engine counters to calculate the
>>>>> > > engine activity. KMD exposes two counters via the PMU interface to
>>>>> > > calculate engine activity
>>>>> > >
>>>>> > > Engine Active Ticks(engine-active-ticks) - number of active 
>>>>> ticks for engine
>>>>> > > Engine Total Ticks (engine-total-ticks) - total ticks of engine
>>>>> > >
>>>>> > > Engine activity percentage can be calculated as below
>>>>> > > Engine activity % = (engine active ticks/engine total ticks) * 
>>>>> 100.
>>>>> > >
>>>>> > > v2: fix cosmetic review comments
>>>>> > >     add forcewake for gpm_ts (Umesh)
>>>>> > >
>>>>> > > v3: fix CI hooks error
>>>>> > >     change function parameters and unpin bo on error
>>>>> > >     of allocate_activity_buffers
>>>>> > >     fix kernel-doc (Umesh)
>>>>> > >     use engine activity (Umesh, Lucas)
>>>>> > >     rename xe_engine_activity to xe_guc_engine_*
>>>>> > >     fix commit message to use per-engine class(Lucas)
>>>>> > >
>>>>> > > v4: remove forcewake as engine is already running
>>>>> > >     when reading gpm timestamp
>>>>> >
>>>>> > + Rodrigo
>>>>> >
>>>>> > Sorry, I think I mentioned offline that the runtime pm get is 
>>>>> sufficient for
>>>>> > reading this register, but it's not. It does need a forcewake of 
>>>>> the GT
>>>>> > domain.  At the same time, we cannot use the xe_force_wake_get 
>>>>> because of
>>>>> > the lockdep issue you mentioned and also I assume that 
>>>>> xe_force_wake_get may
>>>>> > sleep and the event may be read from irq context.
>>>> The lockdep issue is due to perf holding a raw_spinlock and 
>>>> forcewake having
>>>> a spinlock. In 6.13 due to config PROVE_RAW_LOCK_NESTING being 
>>>> enabled was
>>>> seeing this issue. Latest patch has disabled this due to issues with 
>>>> i915.
>>>>
>>>> [  465.359017] =============================
>>>> [  465.363050] [ BUG: Invalid wait context ]
>>>> [  465.367063] 6.13.0-rc5-xe #11 Tainted: G     U
>>>> [  465.372544] -----------------------------
>>>> [  465.376555] swapper/0/0 is trying to lock:
>>>> [  465.380652] ffff88810d5b8098 (&fw->lock){....}-{3:3}, at:
>>>> xe_force_wake_get+0x1f9/0x8c0 [xe]
>>>> [  465.389168] other info that might help us debug this:
>>>> [  465.394221] context-{5:5}
>>>> [  465.396847] 1 lock held by swapper/0/0:
>>>> [  465.400682]  #0: ffff88885f031fb8 (&cpuctx_lock){....}-{2:2}, at:
>>>> __perf_event_read+0x60/0x230
>>>> [  465.409295] stack backtrace:
>>>
>>>
>>> hmmm I had forgotten about this...
>>>
>>> Lucas, since you were the last one that looked into it,
>>> would be feasible to switch at least the xe_force_wake towards
>>> raw_spinlock?
>>
>> no, I don't think so. We hold the spinlock and then call
>> xe_mmio_wait32(... XE_FORCE_WAKE_ACK_TIMEOUT_MS). Yeah.. it's only upper
>> bound, but we should look at other solutions.
>>
>> 1) move the read to the hrtimer, like is done for e.g. rapl. We can then
>>   continue using spinlock for the hw interaction.
> 
> My concern with (1) is that counter resolution will depend on the timer 
> periodicity and I am slightly hesitant to do that in the KMD.  If 
> possible, KMD should not be the limiting factor. In the past I recall 
> i915 pmu had a 200hz timer running for sampling some events, but that 
> was deemed to be CPU intensive at some point.
yeah had the same question here. What should be sampling frequency.
Should it be same as frequency events or how to handle this?
> 
> Also if the GPU timestamp is being populated in memory at hrtimer 
> intervals, and the engine activity is populated in memory by GuC on a 
> different timeline, we may end up having to sync those two in KMD to 
> reduce the error margin (since eventually engine activity is a ratio of 
> these two counters).
> 
>>
>> 2) introduce a raw_spinlock that will protect only domain->ref
>>   that would allow us to implement an _if_active variant. But I
>>   don't know how that would help here since we need to read the
>>   register. What do we do when the fw is not taken?
> 
> _if_active was a bad suggestion for force_wake. I was confusing it with 
> runtime_pm. In this case, we want to get the force_wake and read the 
> register.
>>
>>   on gt-c6 that idea was dropped on the floor since it was
>>   not working well and overcomplicating it.
>>
>> 3) ... something else?
> 
> Maybe along with raw_spinlock in the force_wake_get, have a fastpath for 
> force_wake_get (essentially lower timeout). If that fails, we just 
> return the previous engine_activity/gpu_timestamp.
There was disagreement to converting force_wake lock to raw_spinlock.
Can there be another api for force_wake with raw_spinlock ?
> 
> 4) Would it make sense to acquire a FORCEWAKE_ALL (or a subset if we 
> know the specific domains of interest) at event_init and then release it 
> on event_destroy?
We could do it only for engine events since gt-c6 events are present too
in pmu and it would always report 0 residency if done for all.

Thanks
Riana
> 
> I would prefer (4) though if that's not a big power impact. Although I 
> don't know how it will affect the rc6_residency counter itself.
> 
> Regards,
> Umesh
> 
>>
>> Lucas De Marchi
>>
>>>
>>>
>>>>
>>>>
>>>> Since in this case we are checking mmio only when engine is running
>>>> and gt will be active. i thought we could remove it.
>>>>
>>>>>>> +    if (ea->running) {
>>>>>>> +        gpm_ts = xe_mmio_read64_2x32(&gt->mmio, MISC_STATUS_0) >>
>>>>>>> +             engine_activity->gpm_timestamp_shift;
>>>>>>> +        ea->active = lower_32_bits(gpm_ts) -
>>>> cached_activity->last_update_tick;
>>>>>>> +    }
>>>>
>>>> But yeah, gt might enter c6 just after reading ea->running. To avoid 
>>>> this,as
>>>> lucas suggested have to use hr timer.
>>>>
>>>> I thought if needed, will add it as part of a separate series.
>>>> I can add the forcewake back as the config is removed and add hr 
>>>> timer in
>>>> another series.
>>>>
>>>> Thanks
>>>> Riana
>>>>>
>>>>> I don't understand this statement entirely. force wake get cannot 
>>>>> sleep.
>>>>> It is based on spin locks. It should not be issuing any lockdep here.
>>>>> It is quite simple flow with minimal or none interdependency. Remember
>>>>> that in i915 for instance it exists and lives in the middle of every
>>>>> mmio read and write call...
>>>>>
>>>>> >
>>>>> > I would check if we can add a helper 
>>>>> xe_force_wake_get_if_active() and just
>>>>> > use that to bump up the wakeref.
>>>>>
>>>>> I would prefer to not complicate things...
>>>>>
>>>>> >
>>>>> > @Rodrigo, @Vinay Any thoughts on this ^ ?
>>>>>
>>>>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>>>>
>>>>> >
>>>>> > Thanks,
>>>>> > Umesh
>>>>> >
>>>>> > >
>>>>> > > Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>>>>> > > Reviewed-by: Umesh Nerlige Ramappa 
>>>>> <umesh.nerlige.ramappa@intel.com>
>>>>> > > ---
>>>>> > > drivers/gpu/drm/xe/Makefile                   |   1 +
>>>>> > > drivers/gpu/drm/xe/abi/guc_actions_abi.h      |   1 +
>>>>> > > drivers/gpu/drm/xe/regs/xe_gt_regs.h          |   2 +
>>>>> > > drivers/gpu/drm/xe/xe_guc_engine_activity.c   | 317 +++++++++++ 
>>>>> +++++++
>>>>> > > drivers/gpu/drm/xe/xe_guc_engine_activity.h   |  18 +
>>>>> > > .../gpu/drm/xe/xe_guc_engine_activity_types.h |  89 +++++
>>>>> > > drivers/gpu/drm/xe/xe_guc_fwif.h              |  19 ++
>>>>> > > drivers/gpu/drm/xe/xe_guc_types.h             |   4 +
>>>>> > > 8 files changed, 451 insertions(+)
>>>>> > > create mode 100644 drivers/gpu/drm/xe/xe_guc_engine_activity.c
>>>>> > > create mode 100644 drivers/gpu/drm/xe/xe_guc_engine_activity.h
>>>>> > > create mode 100644 drivers/gpu/drm/xe/ 
>>>>> xe_guc_engine_activity_types.h
>>>>> > >
>>>>> > > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/ 
>>>>> Makefile
>>>>> > > index 328aff36831b..7e93461c60bd 100644
>>>>> > > --- a/drivers/gpu/drm/xe/Makefile
>>>>> > > +++ b/drivers/gpu/drm/xe/Makefile
>>>>> > > @@ -33,6 +33,7 @@ xe-y += xe_bb.o \
>>>>> > >     xe_device_sysfs.o \
>>>>> > >     xe_dma_buf.o \
>>>>> > >     xe_drm_client.o \
>>>>> > > +    xe_guc_engine_activity.o \
>>>>> > >     xe_exec.o \
>>>>> > >     xe_execlist.o \
>>>>> > >     xe_exec_queue.o \
>>>>> > > diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h b/ 
>>>>> drivers/gpu/drm/xe/abi/guc_actions_abi.h
>>>>> > > index fee385532fb0..ec516e838ee8 100644
>>>>> > > --- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>>>>> > > +++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>>>>> > > @@ -140,6 +140,7 @@ enum xe_guc_action {
>>>>> > >     XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_LRC = 0x4601,
>>>>> > >     XE_GUC_ACTION_CLIENT_SOFT_RESET = 0x5507,
>>>>> > >     XE_GUC_ACTION_SET_ENG_UTIL_BUFF = 0x550A,
>>>>> > > +    XE_GUC_ACTION_SET_DEVICE_ENGINE_ACTIVITY_BUFFER = 0x550C,
>>>>> > >     XE_GUC_ACTION_NOTIFY_MEMORY_CAT_ERROR = 0x6000,
>>>>> > >     XE_GUC_ACTION_REPORT_PAGE_FAULT_REQ_DESC = 0x6002,
>>>>> > >     XE_GUC_ACTION_PAGE_FAULT_RES_DESC = 0x6003,
>>>>> > > diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/ 
>>>>> gpu/drm/xe/regs/xe_gt_regs.h
>>>>> > > index 096859072396..124cc398798e 100644
>>>>> > > --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>>>>> > > +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>>>>> > > @@ -358,6 +358,8 @@
>>>>> > > #define   RENDER_AWAKE_STATUS            REG_BIT(1)
>>>>> > > #define   MEDIA_SLICE0_AWAKE_STATUS        REG_BIT(0)
>>>>> > >
>>>>> > > +#define MISC_STATUS_0                XE_REG(0xa500)
>>>>> > > +
>>>>> > > #define FORCEWAKE_MEDIA_VDBOX(n)        XE_REG(0xa540 + (n) * 4)
>>>>> > > #define FORCEWAKE_MEDIA_VEBOX(n)        XE_REG(0xa560 + (n) * 4)
>>>>> > > #define FORCEWAKE_GSC                XE_REG(0xa618)
>>>>> > > diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity.c b/ 
>>>>> drivers/gpu/drm/xe/xe_guc_engine_activity.c
>>>>> > > new file mode 100644
>>>>> > > index 000000000000..088209b9c228
>>>>> > > --- /dev/null
>>>>> > > +++ b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
>>>>> > > @@ -0,0 +1,317 @@
>>>>> > > +// SPDX-License-Identifier: MIT
>>>>> > > +/*
>>>>> > > + * Copyright © 2025 Intel Corporation
>>>>> > > + */
>>>>> > > +#include "xe_guc_engine_activity.h"
>>>>> > > +
>>>>> > > +#include "abi/guc_actions_abi.h"
>>>>> > > +#include "regs/xe_gt_regs.h"
>>>>> > > +
>>>>> > > +#include "xe_bo.h"
>>>>> > > +#include "xe_force_wake.h"
>>>>> > > +#include "xe_gt_printk.h"
>>>>> > > +#include "xe_guc.h"
>>>>> > > +#include "xe_guc_ct.h"
>>>>> > > +#include "xe_hw_engine.h"
>>>>> > > +#include "xe_map.h"
>>>>> > > +#include "xe_mmio.h"
>>>>> > > +
>>>>> > > +#define TOTAL_QUANTA 0x8000
>>>>> > > +
>>>>> > > +static struct iosys_map engine_activity_map(struct xe_guc 
>>>>> *guc, struct xe_hw_engine *hwe)
>>>>> > > +{
>>>>> > > +    struct xe_guc_engine_activity *engine_activity = &guc- 
>>>>> >engine_activity;
>>>>> > > +    struct engine_activity_buffer *buffer = &engine_activity- 
>>>>> >device_buffer;
>>>>> > > +    u16 guc_class = xe_engine_class_to_guc_class(hwe->class);
>>>>> > > +    size_t offset = 0;
>>>>> > > +
>>>>> > > +    offset = offsetof(struct guc_engine_activity_data,
>>>>> > > +              engine_activity[guc_class][hwe->logical_instance]);
>>>>> > > +
>>>>> > > +    return IOSYS_MAP_INIT_OFFSET(&buffer->activity_bo->vmap, 
>>>>> offset);
>>>>> > > +}
>>>>> > > +
>>>>> > > +static struct iosys_map engine_metadata_map(struct xe_guc *guc)
>>>>> > > +{
>>>>> > > +    struct xe_guc_engine_activity *engine_activity = &guc- 
>>>>> >engine_activity;
>>>>> > > +    struct engine_activity_buffer *buffer = &engine_activity- 
>>>>> >device_buffer;
>>>>> > > +
>>>>> > > +    return buffer->metadata_bo->vmap;
>>>>> > > +}
>>>>> > > +
>>>>> > > +static int allocate_engine_activity_group(struct xe_guc *guc)
>>>>> > > +{
>>>>> > > +    struct xe_guc_engine_activity *engine_activity = &guc- 
>>>>> >engine_activity;
>>>>> > > +    u32 num_activity_group = 1;
>>>>> > > +
>>>>> > > +    engine_activity->eag = kmalloc_array(num_activity_group,
>>>>> > > +                         sizeof(struct engine_activity_group),
>>>>> > > +                         GFP_KERNEL);
>>>>> > > +
>>>>> > > +    if (!engine_activity->eag)
>>>>> > > +        return -ENOMEM;
>>>>> > > +
>>>>> > > +    memset(engine_activity->eag, 0, num_activity_group * 
>>>>> sizeof(struct engine_activity_group));
>>>>> > > +    engine_activity->num_activity_group = num_activity_group;
>>>>> > > +
>>>>> > > +    return 0;
>>>>> > > +}
>>>>> > > +
>>>>> > > +static int allocate_engine_activity_buffers(struct xe_guc *guc,
>>>>> > > +                        struct engine_activity_buffer *buffer)
>>>>> > > +{
>>>>> > > +    u32 metadata_size = sizeof(struct 
>>>>> guc_engine_activity_metadata);
>>>>> > > +    u32 size = sizeof(struct guc_engine_activity_data);
>>>>> > > +    struct xe_gt *gt = guc_to_gt(guc);
>>>>> > > +    struct xe_tile *tile = gt_to_tile(gt);
>>>>> > > +    struct xe_bo *bo, *metadata_bo;
>>>>> > > +
>>>>> > > +    metadata_bo = xe_managed_bo_create_pin_map(gt_to_xe(gt), 
>>>>> tile, PAGE_ALIGN(metadata_size),
>>>>> > > +                           XE_BO_FLAG_SYSTEM |
>>>>> > > +                           XE_BO_FLAG_GGTT |
>>>>> > > +                           XE_BO_FLAG_GGTT_INVALIDATE);
>>>>> > > +    if (IS_ERR(metadata_bo))
>>>>> > > +        return PTR_ERR(metadata_bo);
>>>>> > > +
>>>>> > > +    bo = xe_managed_bo_create_pin_map(gt_to_xe(gt), tile, 
>>>>> PAGE_ALIGN(size),
>>>>> > > +                      XE_BO_FLAG_VRAM_IF_DGFX(tile) |
>>>>> > > +                      XE_BO_FLAG_GGTT |
>>>>> > > +                      XE_BO_FLAG_GGTT_INVALIDATE);
>>>>> > > +
>>>>> > > +    if (IS_ERR(bo)) {
>>>>> > > +        xe_bo_unpin_map_no_vm(metadata_bo);
>>>>> > > +        return PTR_ERR(bo);
>>>>> > > +    }
>>>>> > > +
>>>>> > > +    buffer->metadata_bo = metadata_bo;
>>>>> > > +    buffer->activity_bo = bo;
>>>>> > > +    return 0;
>>>>> > > +}
>>>>> > > +
>>>>> > > +static struct engine_activity 
>>>>> *hw_engine_to_engine_activity(struct xe_hw_engine *hwe)
>>>>> > > +{
>>>>> > > +    struct xe_guc *guc = &hwe->gt->uc.guc;
>>>>> > > +    struct engine_activity_group *eag = &guc- 
>>>>> >engine_activity.eag[0];
>>>>> > > +    u16 guc_class = xe_engine_class_to_guc_class(hwe->class);
>>>>> > > +
>>>>> > > +    return &eag->engine[guc_class][hwe->logical_instance];
>>>>> > > +}
>>>>> > > +
>>>>> > > +static u64 cpu_ns_to_guc_tsc_tick(ktime_t ns, u32 freq)
>>>>> > > +{
>>>>> > > +    return mul_u64_u32_div(ns, freq, NSEC_PER_SEC);
>>>>> > > +}
>>>>> > > +
>>>>> > > +#define read_engine_activity_record(xe_, map_, field_) \
>>>>> > > +    xe_map_rd_field(xe_, map_, 0, struct guc_engine_activity, 
>>>>> field_)
>>>>> > > +
>>>>> > > +#define read_metadata_record(xe_, map_, field_) \
>>>>> > > +    xe_map_rd_field(xe_, map_, 0, struct 
>>>>> guc_engine_activity_metadata, field_)
>>>>> > > +
>>>>> > > +static u64 get_engine_active_ticks(struct xe_guc *guc, struct 
>>>>> xe_hw_engine *hwe)
>>>>> > > +{
>>>>> > > +    struct engine_activity *ea = 
>>>>> hw_engine_to_engine_activity(hwe);
>>>>> > > +    struct guc_engine_activity *cached_activity = &ea->activity;
>>>>> > > +    struct guc_engine_activity_metadata *cached_metadata = 
>>>>> &ea->metadata;
>>>>> > > +    struct xe_guc_engine_activity *engine_activity = &guc- 
>>>>> >engine_activity;
>>>>> > > +    struct iosys_map activity_map, metadata_map;
>>>>> > > +    struct xe_device *xe =  guc_to_xe(guc);
>>>>> > > +    struct xe_gt *gt = guc_to_gt(guc);
>>>>> > > +    u32 last_update_tick, global_change_num;
>>>>> > > +    u64 active_ticks, gpm_ts;
>>>>> > > +    u16 change_num;
>>>>> > > +
>>>>> > > +    activity_map = engine_activity_map(guc, hwe);
>>>>> > > +    metadata_map = engine_metadata_map(guc);
>>>>> > > +    global_change_num = read_metadata_record(xe, 
>>>>> &metadata_map, global_change_num);
>>>>> > > +
>>>>> > > +    /* GuC has not initialized activity data yet, return 0 */
>>>>> > > +    if (!global_change_num)
>>>>> > > +        goto update;
>>>>> > > +
>>>>> > > +    if (global_change_num == cached_metadata->global_change_num)
>>>>> > > +        goto update;
>>>>> > > +    else
>>>>> > > +        cached_metadata->global_change_num = global_change_num;
>>>>> > > +
>>>>> > > +    change_num = read_engine_activity_record(xe, 
>>>>> &activity_map, change_num);
>>>>> > > +
>>>>> > > +    if (!change_num || change_num == cached_activity->change_num)
>>>>> > > +        goto update;
>>>>> > > +
>>>>> > > +    /* read engine activity values */
>>>>> > > +    last_update_tick = read_engine_activity_record(xe, 
>>>>> &activity_map, last_update_tick);
>>>>> > > +    active_ticks = read_engine_activity_record(xe, 
>>>>> &activity_map, active_ticks);
>>>>> > > +
>>>>> > > +    /* activity calculations */
>>>>> > > +    ea->running = !!last_update_tick;
>>>>> > > +    ea->total += active_ticks - cached_activity->active_ticks;
>>>>> > > +    ea->active = 0;
>>>>> > > +
>>>>> > > +    /* cache the counter */
>>>>> > > +    cached_activity->change_num = change_num;
>>>>> > > +    cached_activity->last_update_tick = last_update_tick;
>>>>> > > +    cached_activity->active_ticks = active_ticks;
>>>>> > > +
>>>>> > > +update:
>>>>> > > +    if (ea->running) {
>>>>> > > +        gpm_ts = xe_mmio_read64_2x32(&gt->mmio, MISC_STATUS_0) >>
>>>>> > > +             engine_activity->gpm_timestamp_shift;
>>>>> > > +        ea->active = lower_32_bits(gpm_ts) - cached_activity- 
>>>>> >last_update_tick;
>>>>> > > +    }
>>>>> > > +
>>>>> > > +    return ea->total + ea->active;
>>>>> > > +}
>>>>> > > +
>>>>> > > +static u64 get_engine_total_ticks(struct xe_guc *guc, struct 
>>>>> xe_hw_engine *hwe)
>>>>> > > +{
>>>>> > > +    struct engine_activity *ea = 
>>>>> hw_engine_to_engine_activity(hwe);
>>>>> > > +    struct guc_engine_activity_metadata *cached_metadata = 
>>>>> &ea->metadata;
>>>>> > > +    struct guc_engine_activity *cached_activity = &ea->activity;
>>>>> > > +    struct iosys_map activity_map, metadata_map;
>>>>> > > +    struct xe_device *xe = guc_to_xe(guc);
>>>>> > > +    ktime_t now, cpu_delta;
>>>>> > > +    u64 numerator;
>>>>> > > +    u16 quanta_ratio;
>>>>> > > +
>>>>> > > +    activity_map = engine_activity_map(guc, hwe);
>>>>> > > +    metadata_map = engine_metadata_map(guc);
>>>>> > > +
>>>>> > > +    if (!cached_metadata->guc_tsc_frequency_hz)
>>>>> > > +        cached_metadata->guc_tsc_frequency_hz = 
>>>>> read_metadata_record(xe, &metadata_map,
>>>>> > > +                                         guc_tsc_frequency_hz);
>>>>> > > +
>>>>> > > +    quanta_ratio = read_engine_activity_record(xe, 
>>>>> &activity_map, quanta_ratio);
>>>>> > > +    cached_activity->quanta_ratio = quanta_ratio;
>>>>> > > +
>>>>> > > +    /* Total ticks calculations */
>>>>> > > +    now = ktime_get();
>>>>> > > +    cpu_delta = now - ea->last_cpu_ts;
>>>>> > > +    ea->last_cpu_ts = now;
>>>>> > > +    numerator = (ea->quanta_remainder_ns + cpu_delta) * 
>>>>> cached_activity->quanta_ratio;
>>>>> > > +    ea->quanta_ns += numerator / TOTAL_QUANTA;
>>>>> > > +    ea->quanta_remainder_ns = numerator % TOTAL_QUANTA;
>>>>> > > +    ea->quanta = cpu_ns_to_guc_tsc_tick(ea->quanta_ns, 
>>>>> cached_metadata->guc_tsc_frequency_hz);
>>>>> > > +
>>>>> > > +    return ea->quanta;
>>>>> > > +}
>>>>> > > +
>>>>> > > +static int enable_engine_activity_stats(struct xe_guc *guc)
>>>>> > > +{
>>>>> > > +    struct xe_guc_engine_activity *engine_activity = &guc- 
>>>>> >engine_activity;
>>>>> > > +    struct engine_activity_buffer *buffer = &engine_activity- 
>>>>> >device_buffer;
>>>>> > > +    u32 metadata_ggtt_addr = xe_bo_ggtt_addr(buffer- 
>>>>> >metadata_bo);
>>>>> > > +    u32 ggtt_addr = xe_bo_ggtt_addr(buffer->activity_bo);
>>>>> > > +    int len = 0;
>>>>> > > +    u32 action[5];
>>>>> > > +
>>>>> > > +    action[len++] = 
>>>>> XE_GUC_ACTION_SET_DEVICE_ENGINE_ACTIVITY_BUFFER;
>>>>> > > +    action[len++] = metadata_ggtt_addr;
>>>>> > > +    action[len++] = 0;
>>>>> > > +    action[len++] = ggtt_addr;
>>>>> > > +    action[len++] = 0;
>>>>> > > +
>>>>> > > +    /* Blocking here to ensure the buffers are ready before 
>>>>> reading them */
>>>>> > > +    return xe_guc_ct_send_block(&guc->ct, action, 
>>>>> ARRAY_SIZE(action));
>>>>> > > +}
>>>>> > > +
>>>>> > > +static void engine_activity_set_cpu_ts(struct xe_guc *guc)
>>>>> > > +{
>>>>> > > +    struct xe_guc_engine_activity *engine_activity = &guc- 
>>>>> >engine_activity;
>>>>> > > +    struct engine_activity_group *eag = &engine_activity->eag[0];
>>>>> > > +    int i, j;
>>>>> > > +
>>>>> > > +    for (i = 0; i < GUC_MAX_ENGINE_CLASSES; i++)
>>>>> > > +        for (j = 0; j < GUC_MAX_INSTANCES_PER_CLASS; j++)
>>>>> > > +            eag->engine[i][j].last_cpu_ts = ktime_get();
>>>>> > > +}
>>>>> > > +
>>>>> > > +static u32 gpm_timestamp_shift(struct xe_gt *gt)
>>>>> > > +{
>>>>> > > +    u32 reg;
>>>>> > > +
>>>>> > > +    reg = xe_mmio_read32(&gt->mmio, RPM_CONFIG0);
>>>>> > > +
>>>>> > > +    return 3 - 
>>>>> REG_FIELD_GET(RPM_CONFIG0_CTC_SHIFT_PARAMETER_MASK, reg);
>>>>> > > +}
>>>>> > > +
>>>>> > > +/**
>>>>> > > + * xe_guc_engine_activity_active_ticks - Get engine active ticks
>>>>> > > + * @hwe: The hw_engine object
>>>>> > > + *
>>>>> > > + * Return: accumulated ticks @hwe was active since engine 
>>>>> activity stats were enabled.
>>>>> > > + */
>>>>> > > +u64 xe_guc_engine_activity_active_ticks(struct xe_hw_engine *hwe)
>>>>> > > +{
>>>>> > > +    struct xe_guc *guc =  &hwe->gt->uc.guc;
>>>>> > > +
>>>>> > > +    return get_engine_active_ticks(guc, hwe);
>>>>> > > +}
>>>>> > > +
>>>>> > > +/**
>>>>> > > + * xe_guc_engine_activity_total_ticks - Get engine total ticks
>>>>> > > + * @hwe: The hw_engine object
>>>>> > > + *
>>>>> > > + * Return: accumulated quanta of ticks allocated for the engine
>>>>> > > + */
>>>>> > > +u64 xe_guc_engine_activity_total_ticks(struct xe_hw_engine *hwe)
>>>>> > > +{
>>>>> > > +    struct xe_guc *guc =  &hwe->gt->uc.guc;
>>>>> > > +
>>>>> > > +    return get_engine_total_ticks(guc, hwe);
>>>>> > > +}
>>>>> > > +
>>>>> > > +/**
>>>>> > > + * xe_guc_engine_activity_enable_stats - Enable engine 
>>>>> activity stats
>>>>> > > + * @guc: The GuC object
>>>>> > > + *
>>>>> > > + * Enable engine activity stats and set initial timestamps
>>>>> > > + */
>>>>> > > +void xe_guc_engine_activity_enable_stats(struct xe_guc *guc)
>>>>> > > +{
>>>>> > > +    int ret;
>>>>> > > +
>>>>> > > +    ret = enable_engine_activity_stats(guc);
>>>>> > > +    if (ret)
>>>>> > > +        xe_gt_err(guc_to_gt(guc), "failed to enable activity 
>>>>> stats%d\n", ret);
>>>>> > > +    else
>>>>> > > +        engine_activity_set_cpu_ts(guc);
>>>>> > > +}
>>>>> > > +
>>>>> > > +static void engine_activity_fini(void *arg)
>>>>> > > +{
>>>>> > > +    struct xe_guc_engine_activity *engine_activity = arg;
>>>>> > > +
>>>>> > > +    kfree(engine_activity->eag);
>>>>> > > +}
>>>>> > > +
>>>>> > > +/**
>>>>> > > + * xe_guc_engine_activity_init - Initialize the engine 
>>>>> activity data
>>>>> > > + * @guc: The GuC object
>>>>> > > + *
>>>>> > > + * Return: 0 on success, negative error code otherwise.
>>>>> > > + */
>>>>> > > +int xe_guc_engine_activity_init(struct xe_guc *guc)
>>>>> > > +{
>>>>> > > +    struct xe_guc_engine_activity *engine_activity = &guc- 
>>>>> >engine_activity;
>>>>> > > +    struct xe_gt *gt = guc_to_gt(guc);
>>>>> > > +    int ret;
>>>>> > > +
>>>>> > > +    ret = allocate_engine_activity_group(guc);
>>>>> > > +    if (ret) {
>>>>> > > +        xe_gt_err(gt, "failed to allocate activity group 
>>>>> %d\n", ret);
>>>>> > > +        return ret;
>>>>> > > +    }
>>>>> > > +
>>>>> > > +    ret = allocate_engine_activity_buffers(guc, 
>>>>> &engine_activity->device_buffer);
>>>>> > > +    if (ret) {
>>>>> > > +        xe_gt_err(gt, "failed to allocate activity 
>>>>> buffers%d\n", ret);
>>>>> > > +        kfree(engine_activity->eag);
>>>>> > > +        return ret;
>>>>> > > +    }
>>>>> > > +
>>>>> > > +    engine_activity->gpm_timestamp_shift = 
>>>>> gpm_timestamp_shift(gt);
>>>>> > > +
>>>>> > > +    return devm_add_action_or_reset(gt_to_xe(gt)->drm.dev, 
>>>>> engine_activity_fini,
>>>>> > > +                    engine_activity);
>>>>> > > +}
>>>>> > > diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity.h b/ 
>>>>> drivers/gpu/drm/xe/xe_guc_engine_activity.h
>>>>> > > new file mode 100644
>>>>> > > index 000000000000..c00f3da5513d
>>>>> > > --- /dev/null
>>>>> > > +++ b/drivers/gpu/drm/xe/xe_guc_engine_activity.h
>>>>> > > @@ -0,0 +1,18 @@
>>>>> > > +/* SPDX-License-Identifier: MIT */
>>>>> > > +/*
>>>>> > > + * Copyright © 2025 Intel Corporation
>>>>> > > + */
>>>>> > > +
>>>>> > > +#ifndef _XE_GUC_ENGINE_ACTIVITY_H_
>>>>> > > +#define _XE_GUC_ENGINE_ACTIVITY_H_
>>>>> > > +
>>>>> > > +#include <linux/types.h>
>>>>> > > +
>>>>> > > +struct xe_hw_engine;
>>>>> > > +struct xe_guc;
>>>>> > > +
>>>>> > > +int xe_guc_engine_activity_init(struct xe_guc *guc);
>>>>> > > +void xe_guc_engine_activity_enable_stats(struct xe_guc *guc);
>>>>> > > +u64 xe_guc_engine_activity_active_ticks(struct xe_hw_engine 
>>>>> *hwe);
>>>>> > > +u64 xe_guc_engine_activity_total_ticks(struct xe_hw_engine *hwe);
>>>>> > > +#endif
>>>>> > > diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity_types.h 
>>>>> b/drivers/gpu/drm/xe/xe_guc_engine_activity_types.h
>>>>> > > new file mode 100644
>>>>> > > index 000000000000..a2ab327d3eec
>>>>> > > --- /dev/null
>>>>> > > +++ b/drivers/gpu/drm/xe/xe_guc_engine_activity_types.h
>>>>> > > @@ -0,0 +1,89 @@
>>>>> > > +/* SPDX-License-Identifier: MIT */
>>>>> > > +/*
>>>>> > > + * Copyright © 2025 Intel Corporation
>>>>> > > + */
>>>>> > > +
>>>>> > > +#ifndef _XE_GUC_ENGINE_ACTIVITY_TYPES_H_
>>>>> > > +#define _XE_GUC_ENGINE_ACTIVITY_TYPES_H_
>>>>> > > +
>>>>> > > +#include <linux/types.h>
>>>>> > > +
>>>>> > > +#include "xe_guc_fwif.h"
>>>>> > > +/**
>>>>> > > + * struct engine_activity - Engine specific activity data
>>>>> > > + *
>>>>> > > + * Contains engine specific activity data and snapshot of the
>>>>> > > + * structures from GuC
>>>>> > > + */
>>>>> > > +struct engine_activity {
>>>>> > > +    /** @active: current activity */
>>>>> > > +    u64 active;
>>>>> > > +
>>>>> > > +    /** @last_cpu_ts: cpu timestamp in nsec of previous sample */
>>>>> > > +    u64 last_cpu_ts;
>>>>> > > +
>>>>> > > +    /** @quanta: total quanta used on HW */
>>>>> > > +    u64 quanta;
>>>>> > > +
>>>>> > > +    /** @quanta_ns: total quanta_ns used on HW */
>>>>> > > +    u64 quanta_ns;
>>>>> > > +
>>>>> > > +    /**
>>>>> > > +     * @quanta_remainder_ns: remainder when the CPU time is 
>>>>> scaled as
>>>>> > > +     * per the quanta_ratio. This remainder is used in subsequent
>>>>> > > +     * quanta calculations.
>>>>> > > +     */
>>>>> > > +    u64 quanta_remainder_ns;
>>>>> > > +
>>>>> > > +    /** @total: total engine activity */
>>>>> > > +    u64 total;
>>>>> > > +
>>>>> > > +    /** @running: true if engine is running some work */
>>>>> > > +    bool running;
>>>>> > > +
>>>>> > > +    /** @metadata: snapshot of engine activity metadata */
>>>>> > > +    struct guc_engine_activity_metadata metadata;
>>>>> > > +
>>>>> > > +    /** @activity: snapshot of engine activity counter */
>>>>> > > +    struct guc_engine_activity activity;
>>>>> > > +};
>>>>> > > +
>>>>> > > +/**
>>>>> > > + * struct engine_activity_group - Activity data for all engines
>>>>> > > + */
>>>>> > > +struct engine_activity_group {
>>>>> > > +    /** @engine: engine specific activity data */
>>>>> > > +    struct engine_activity engine[GUC_MAX_ENGINE_CLASSES] 
>>>>> [GUC_MAX_INSTANCES_PER_CLASS];
>>>>> > > +};
>>>>> > > +
>>>>> > > +/**
>>>>> > > + * struct engine_activity_buffer - engine activity buffers
>>>>> > > + *
>>>>> > > + * This contains the buffers allocated for metadata and 
>>>>> activity data
>>>>> > > + */
>>>>> > > +struct engine_activity_buffer {
>>>>> > > +    /** @activity_bo: object allocated to hold activity data */
>>>>> > > +    struct xe_bo *activity_bo;
>>>>> > > +
>>>>> > > +    /** @metadata_bo: object allocated to hold activity 
>>>>> metadata */
>>>>> > > +    struct xe_bo *metadata_bo;
>>>>> > > +};
>>>>> > > +
>>>>> > > +/**
>>>>> > > + * struct xe_guc_engine_activity - Data used by engine 
>>>>> activity implementation
>>>>> > > + */
>>>>> > > +struct xe_guc_engine_activity {
>>>>> > > +    /** @gpm_timestamp_shift: Right shift value for the gpm 
>>>>> timestamp */
>>>>> > > +    u32 gpm_timestamp_shift;
>>>>> > > +
>>>>> > > +    /** @num_activity_group: number of activity groups */
>>>>> > > +    u32 num_activity_group;
>>>>> > > +
>>>>> > > +    /** @eag: holds the device level engine activity data */
>>>>> > > +    struct engine_activity_group *eag;
>>>>> > > +
>>>>> > > +    /** @device_buffer: buffer object for global engine 
>>>>> activity */
>>>>> > > +    struct engine_activity_buffer device_buffer;
>>>>> > > +};
>>>>> > > +#endif
>>>>> > > +
>>>>> > > diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/ 
>>>>> drm/xe/xe_guc_fwif.h
>>>>> > > index 057153f89b30..6f57578b07cb 100644
>>>>> > > --- a/drivers/gpu/drm/xe/xe_guc_fwif.h
>>>>> > > +++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
>>>>> > > @@ -208,6 +208,25 @@ struct guc_engine_usage {
>>>>> > >     struct guc_engine_usage_record 
>>>>> engines[GUC_MAX_ENGINE_CLASSES][GUC_MAX_INSTANCES_PER_CLASS];
>>>>> > > } __packed;
>>>>> > >
>>>>> > > +/* Engine Activity stats */
>>>>> > > +struct guc_engine_activity {
>>>>> > > +    u16 change_num;
>>>>> > > +    u16 quanta_ratio;
>>>>> > > +    u32 last_update_tick;
>>>>> > > +    u64 active_ticks;
>>>>> > > +} __packed;
>>>>> > > +
>>>>> > > +struct guc_engine_activity_data {
>>>>> > > +    struct guc_engine_activity 
>>>>> engine_activity[GUC_MAX_ENGINE_CLASSES][GUC_MAX_INSTANCES_PER_CLASS];
>>>>> > > +} __packed;
>>>>> > > +
>>>>> > > +struct guc_engine_activity_metadata {
>>>>> > > +    u32 guc_tsc_frequency_hz;
>>>>> > > +    u32 lag_latency_usec;
>>>>> > > +    u32 global_change_num;
>>>>> > > +    u32 reserved;
>>>>> > > +} __packed;
>>>>> > > +
>>>>> > > /* This action will be programmed in C1BC - SOFT_SCRATCH_15_REG */
>>>>> > > enum xe_guc_recv_message {
>>>>> > >     XE_GUC_RECV_MSG_CRASH_DUMP_POSTED = BIT(1),
>>>>> > > diff --git a/drivers/gpu/drm/xe/xe_guc_types.h b/drivers/gpu/ 
>>>>> drm/xe/xe_guc_types.h
>>>>> > > index 573aa6308380..63bac64429a5 100644
>>>>> > > --- a/drivers/gpu/drm/xe/xe_guc_types.h
>>>>> > > +++ b/drivers/gpu/drm/xe/xe_guc_types.h
>>>>> > > @@ -13,6 +13,7 @@
>>>>> > > #include "xe_guc_ads_types.h"
>>>>> > > #include "xe_guc_buf_types.h"
>>>>> > > #include "xe_guc_ct_types.h"
>>>>> > > +#include "xe_guc_engine_activity_types.h"
>>>>> > > #include "xe_guc_fwif.h"
>>>>> > > #include "xe_guc_log_types.h"
>>>>> > > #include "xe_guc_pc_types.h"
>>>>> > > @@ -103,6 +104,9 @@ struct xe_guc {
>>>>> > >     /** @relay: GuC Relay Communication used in SR-IOV */
>>>>> > >     struct xe_guc_relay relay;
>>>>> > >
>>>>> > > +    /** @engine_activity: Device specific engine activity */
>>>>> > > +    struct xe_guc_engine_activity engine_activity;
>>>>> > > +
>>>>> > >     /**
>>>>> > >      * @notify_reg: Register which is written to notify GuC of 
>>>>> H2G messages
>>>>> > >      */
>>>>> > > --
>>>>> > > 2.47.1
>>>>> > >
>>>>

