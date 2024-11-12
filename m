Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 293BFD597A3
	for <intel-xe@archiver.kernel.org>; Tue, 12 Nov 2024 20:38:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC41510E236;
	Tue, 12 Nov 2024 20:38:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N8gwpNim";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95DF210E236
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Nov 2024 20:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731443930; x=1762979930;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=uJiuLadU8pRgMcBCeLd1lmGLuVDszqsulwWwe5Js4As=;
 b=N8gwpNim1gAH6/VxWIebhjqBV9fOH6/2tfnILPAPJatS0pvKtFI0ANv7
 xFJiFXpQ/p8Pn3FAgX2gHD5o0iWKyUmUb9K7Sv2wKY+xvP/fvPoNSM4gv
 ToKlAA9Jkq6fksRqWmQbeNiExdQty4oYt4rI0K50uI3dxSGxpzasqqQrd
 YPpagzZ7MqmUZdLlrZoTeQ8UbmF+zrIQ0Ra/K63mHr3AneTMbRsyYQihF
 FrCgn8ECNGCeTNIfFCQh6H7jhj4W2/PFgpPqW0R8/6RSTRrnlMpadnH7s
 ZsmJ6k2Td3aMZ1c6xj1kFdolrGtpvafP3/ACcMBG96g4gFjmAKHNaIC1f w==;
X-CSE-ConnectionGUID: NZ+fY3mTQT+fzXYSvq27/Q==
X-CSE-MsgGUID: HU8Snf9fS9irnSWLzxX2XQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="41932611"
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; d="scan'208";a="41932611"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 12:38:49 -0800
X-CSE-ConnectionGUID: PWRiOMV/TfC9LTtoY7ONfQ==
X-CSE-MsgGUID: h8P/dki+ROGD2QukFNft6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; d="scan'208";a="87804794"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Nov 2024 12:38:48 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 12 Nov 2024 12:38:48 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 12 Nov 2024 12:38:48 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 12 Nov 2024 12:38:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H4CHV9B23mDLd56Alp+L1IF4wzfMEmtWQkObNRujA5MVrikErKV0dehYx+Yv1HauLM423rKx4bLINBlmIQ29rm/CJPxVi1+1V7Vy5HGlGPNCH3Ac9LRW5Iq+0HTYlx/V1S0X58MT2wCAr36SspHkWXnJtkoouoHOaUH1EzSjY+pq+iiN5oOauvcHz2G8SMKVZ8BcEQCRB7OOHL9626rANWaJI7L7emJnDeB/OkTis1ry2JbFR2yzqqBUxQoGEkKkOkh6HYOPMFfYKgyNlw+Mz167rDq5r376Sbvfp/co3kkTsW1KH31nqzBMqHnTxDscqU9G3SV9H3RLZ5+jXYXEvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=87nOi8gc/x7XC48VkfbX2lGHtlhyegLGAnI5tTPDiSA=;
 b=KVi3NzsPv48rOeBNN/1I2lIUu/gls9nHkhWGL7lFTMLiBI8o8zmQ/zqX+2k3VkAtGze5IU8vnzfvbia4lPDU/EK5v9GH4vBVaoZ/e661i+r/m26UE7lPXibauTe5xS59UtJN2bsYce6wP8eb8JgOEi4oVyF1ChjRci9cURPaTmf2jqkvIV4sN4eukE3UEkqPe+1OScHrsLnv9FnU9UrYfZcHkjVwcxze2DDnbDhp8zRfPalf4L39yNqUEJjANhBjJvLNHXdt0yL3n/UAvlWvZia39AadZWLTYyUN9qJmeE2Fm5I/JwKNQ5ymg/mXMpfIIN/a3+2Fl15xnapqA5awag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by CY8PR11MB7108.namprd11.prod.outlook.com (2603:10b6:930:50::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.27; Tue, 12 Nov
 2024 20:38:45 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%3]) with mapi id 15.20.8158.013; Tue, 12 Nov 2024
 20:38:45 +0000
Message-ID: <62e3e655-6a55-4c7e-a079-008c2cbc4b0d@intel.com>
Date: Tue, 12 Nov 2024 12:38:42 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/xe_lrc: Rename desc to addr
To: Matt Roper <matthew.d.roper@intel.com>, Jonathan Cavitt
 <jonathan.cavitt@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <saurabhg.gupta@intel.com>,
 <alex.zuo@intel.com>, <matthew.brost@intel.com>, <zhanjun.dong@intel.com>,
 <alan.previn.teres.alexis@intel.com>
References: <20241112185515.64060-1-jonathan.cavitt@intel.com>
 <20241112195737.GH5725@mdroper-desk1.amr.corp.intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20241112195737.GH5725@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0269.namprd04.prod.outlook.com
 (2603:10b6:303:88::34) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|CY8PR11MB7108:EE_
X-MS-Office365-Filtering-Correlation-Id: 608241e5-9e7e-4a3b-fb29-08dd035a010e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VjQ1QmlJK1J4dGk2d0hiMXM1NEFXUk5sWTQ5cldhZmlCOVJ1aEZlSmhZcnYz?=
 =?utf-8?B?MXFNUnhQL2FXeHVyTUhkNHkybTVTb25jY0JHNFUvUFViUlQxdXc2T3ptbVBC?=
 =?utf-8?B?VlZwRGFpMFFYcW9YVHVlL3NWOGxsc1lteEQ0eG9xOFBqQzUxRVJFYjlxQnRn?=
 =?utf-8?B?VlZSU081TkszV1E4S1Y1L3pNYThkQlljcXRmNG96L29sUkZEUlRmRmxqdkoy?=
 =?utf-8?B?RzZuNDIwUzEwc3pheXl5Tmd2cENrcjlFcjY3aDUwamRkOGdYeVFCUmx3NWtV?=
 =?utf-8?B?eFc1TEg2QUpwQ1VRUjhYbjNvMFMzYVRMVEZqQXhFZGdXYW8vZElyNDFiMDRq?=
 =?utf-8?B?dWNrRXl0Y2RkbjFjMEp4RGlxV1JLajBGQ3g2MUQxUTJQcFRJMi9qOFJsa3BB?=
 =?utf-8?B?bUxVcjUyWUxQZjQzdTc4UWV4b1VJTnlrNXJoamhNeWRtdEJwUld2RzEzTmlR?=
 =?utf-8?B?aW9mM0cyUjBzK0NMTFc1OHF2NDhsUTlVTGprcTFxTWYxMk9CRE1hUlZZRHdt?=
 =?utf-8?B?UGNCZ0FiWEkvYWNScUdXK0Uyejl2d3NmWkl4QVY1RU1hSHY2WTdROHlnWXJS?=
 =?utf-8?B?aFRBZTQ1NXBubjhFb2JVVUZpdEE2VnpjdWtFYWxxaURkMVd0VzNGdUdpbEhU?=
 =?utf-8?B?ZzJzNWIvS0FMNzl6cTBJVUtsTzhoajQ4TjJLaVorUmJkckhEN3h4emdTMTdF?=
 =?utf-8?B?NGdZaVVuM3gyNzlCcmtEbWtrd1hTa01jR1YzOGlOWDhzRTNLdXh6VjV0dTJ4?=
 =?utf-8?B?VEJsdDdZVzRCZjNqUUIzQlVTeERTUk5ZR25tZWU5V05OL2dncTJDRTlIR2xi?=
 =?utf-8?B?WjVrMzVLWUdiVGFoVlNYQy9IV3Z6ZXN5NzZsem1VdE4wdTQvdWpiU1RzaVBm?=
 =?utf-8?B?M2JrM09Pdk05dGpyMTY4QmU1Qkx4U09RanlyS1RzcE1yN0dvWTd3NHczaDhq?=
 =?utf-8?B?dmMvRll5WXo2ZTZibDRXdHhwVUZ2QmVTVkF2cHF4L2RmWGRrL0RUUGVEZUxE?=
 =?utf-8?B?SEdQdUl3Q0pIY0Uyck1hMjBuVUY5MU5uLzhwSlc1cm9iaGFFUXd1aTkxR0JK?=
 =?utf-8?B?YW1ON25UWE5FdlZTcTZyQ09rRG1lQS8rdUZwZlZiYlRtZUJFS1R2Z0V4dWFr?=
 =?utf-8?B?K0pialZXUWcxSFN5QXBmMzRLU0NTZW81NlI5NFhjQi9nVHpSWE9nN1BTVHhm?=
 =?utf-8?B?ZW1NWWVOK0hpaG1wYTViQmtGTHIyUURLUmhrcXZvWjNZOElZVkZZdG1oQ3gx?=
 =?utf-8?B?ek5wRUNNZTNDNlJYU0twdHp0U3JscTBJMVBKaE9MTC9lWG9YRGFhZVVxSkZ0?=
 =?utf-8?B?WTIvUWdPek02YTVIdkgwOHBKcDgrSFl6SUtVU0loQlk2VUIzK0NPblFPSWRR?=
 =?utf-8?B?UzhZbXVINkM1emFYTmVQanpzTi9FQnpXakF5eUMwNFVWQ09MOU1NQmI4WFFl?=
 =?utf-8?B?THVsaSt3V1FvTFd3UEh5YzVCdGNhWkJxalcxUzFnYzY0WGJTNzZwdzE4RXJP?=
 =?utf-8?B?b0NOYVNoM2hKa1IvSkY3bHB1UnluUTZoallVRWR5UHhsZ2Q5M1BmQVd2Z09w?=
 =?utf-8?B?T3VPcy9VVFl3MXQ1SXBQMm5MRW5sQ09HYlJKMzBkajVRYm9HeVRFZW5IUHky?=
 =?utf-8?B?cGx5cmR3V1RmYzFCd1YzTWVNRWVRbERoS0hpbU8wS3VnK0pZL0hsM212M0xt?=
 =?utf-8?B?U3dTMUs4YW1qcU5BeTlrNS9Tdm44L3dETkd4S3pKRmFhRWtjQWs2TXRXUnBy?=
 =?utf-8?Q?ALTuewpdZhFNlIRU+Crw3fxJP0YyD4h3bdo2wkl?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VTloN0pUQ0FmdEVDbUdaMmF5Y01DMWJyaFZKY2lERHNjUEZGbGw4SkwvYzdQ?=
 =?utf-8?B?T1dLQ2tFZEZoU0JZRE5CNVYxV05mUnBQbGxCRlZwdDJHOTlPM20zUnB4NWV1?=
 =?utf-8?B?em9KdjJ3Y2tXNWx5U2ZZcDl0cnVYa1pwZWMvZ0t2YXFrY2R5RFlGSEFWVWRV?=
 =?utf-8?B?SkxQSmNFMjljVnRvS3RzSllUS3hSV29acUcwTWxuL05tYk9PRmk3R1dEbGpy?=
 =?utf-8?B?ODk3MjB1cTVMUlNCUU8rRW9TRVBvSVpIME1TemVtWlVRTER4SDA5MWZzRDhv?=
 =?utf-8?B?dkFmWFUrbFFmRTRtQTIzNTIxTms4Snd5Yk9wZGtKMzN3VklwK09uNUxVb0xs?=
 =?utf-8?B?eEJrZnR5MUJaMkYweWgyNGFGOVFldmdGMHV4dEhoVFVEVTk0ak1NVHpQc0ZD?=
 =?utf-8?B?UUdianh3QllFR21XMEhVb080eWV2SVdCNVpWQlU0d3pPdWppR0Q0ayt5UjAr?=
 =?utf-8?B?WXBCbU1sZnRzTGZ3dS9rdkM1cmNTRW1qWWNYWmpEYkorVEZxNkszdE9uM1NR?=
 =?utf-8?B?K0k0dnZHbCtOYWJhbVJSbndKZUxnc2swSjhlSFhzK3NvRjBXU3l6NEpxR2sr?=
 =?utf-8?B?K0hzVE5lUUwvYTRFYmhsejd4ZHQvci9oNWRIem5SUjBwNWhjU3luMFk1OEww?=
 =?utf-8?B?R2JicFQ5d1R3SmRHV1dxTk5WNG5BbWNwemVZNkN2bTdsMWM5OW9lVVN5a2dF?=
 =?utf-8?B?SEo4b21qTVV5c2VhUGxCVnRWWUdFMWVHQlVVcVQ5cXcxOHFGV2t3aVR1alBX?=
 =?utf-8?B?dEZSWEFqRkJnOVBpdndrZzczY2F0MW9qVWorZkFqSjdCZkluM1QxK0tKZFYx?=
 =?utf-8?B?N0dXR1BRdkVvUWx6czAwaTc2c3hjQmF6Nk55M0pQRWNvdHRQVVZyLzdORXhh?=
 =?utf-8?B?clZMYi9FemZBTXFMZGowVXZoY3VIbVBWZm1KcDhkUVJUSXpFYWdKY1VjZ0xP?=
 =?utf-8?B?UE9LbzdNZGZXT2NLclJoZHRMMktYS2x3RnM3Z3dLdlhyaXE0NkhvQTJqTjla?=
 =?utf-8?B?SVBJSWRBanlRUHJYNXBOaEQ1SFVjY3JOclJDSnRLUi9yY0V1dmhyTmdxTGov?=
 =?utf-8?B?bmkyZExheDgyVGN3THR3NlpsbmZaS3d2eVBYR3lJZ0VEODVRZERWQk9TQytC?=
 =?utf-8?B?Y2pWQTN1dTdvWG1tdFdnemJhcmN0Z1h0aWtQU1IzM1FLZUpqYWlBUHYrVm8v?=
 =?utf-8?B?TTJPR3I2KzlnV1Jsb3JqRVUrMUU2OVRpMzA5bVpQYkdUbmRQQnZxR1lIczYz?=
 =?utf-8?B?TU1jTzJFZFNuTGdDdmJRZThOU2VJaTNSVzdWekVNdk9peGRxcE9uajM1MVE3?=
 =?utf-8?B?SndkWVZpMFlYWit5c1loUWJXV2ZYZFZ6SzRhaEtUdXQ2UENlMjBnTlI5OUhN?=
 =?utf-8?B?VTdxKzNLVkFZU3B6RjNGclR6U3BKRHBLZjkxcGtwOUxkd2p2R3NqbHFZNkdq?=
 =?utf-8?B?cU11N2hpTzQ5Szhxc3hQY3JzRDk3NXR1TCtzUHBrRHl0RjdJM1VtS1RWaS9z?=
 =?utf-8?B?NEhyNGFTam80UllrdHBocC9pMWdjR0kyQlRZWXNCQWRDRWdLcFdMQTZlRVg4?=
 =?utf-8?B?QnZiN2pIV0ZBditaaDZ4RWo2SW9ZOW5McnV1RDBibjMrMW9jOStXSHc2VGFp?=
 =?utf-8?B?UVVSalVuMzh3MkwwREtqbnpDa2cwMmlSU2t0Y3hDZGJDem9GNEVuRUtUNjNG?=
 =?utf-8?B?VWNFRVF5VzFjeUR0QzVrbGh2OG9BWlZ5S1R1c0Q2aFROQ3NaZXJObWJJcUFE?=
 =?utf-8?B?RnM5QVlUemh5MU9RTEgyTHZBK3JrVVNhaDlCUHVzeURFZHkxWjRlZmlZOHBl?=
 =?utf-8?B?NUZVeklMaUtnR1VNVWJLblpPanFXdlhROHZhRUFDZy8wSXFOOHVUVHRlckFK?=
 =?utf-8?B?NzArb2gwU1ZYWGUzMnN3MmZVY2F0T1Q3NHYyTWhqU1p0NDY5eUFQN0hzbFc2?=
 =?utf-8?B?UnJYTm9EOWx2ZDFINTY4WmV3R1ovaFJQTlQ1Y1Vlc1BDY1FJaTlnNEFTdlhq?=
 =?utf-8?B?MEdaeHh1bDcxN25hRlRsaTFvMTZOeXdNWXkzUnJ5T0loSlZMS0lwL0dwcGtB?=
 =?utf-8?B?Slk1UmVPQlp2ZFVpbG9DMFhoeEo0QzVTSXhSRDZMZitxWmVvWXowTkdDVlNu?=
 =?utf-8?B?a29vekNtQ2EySXhwR1ZndjhwdS8vcXVnYWk5V1hUa1kvVXRZZG85YTlhNXVX?=
 =?utf-8?B?d0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 608241e5-9e7e-4a3b-fb29-08dd035a010e
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2024 20:38:45.8057 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cWmGhiovBWQC00hBxuAOe0hfN/aongtbCRT5k/SEg4uHCnDUAstR8slJdBaRGl4LepTN00vWxnJ8igpK+x6fWGtZ9ZfZps8PtTYKLuoPKL8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7108
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

On 11/12/2024 11:57, Matt Roper wrote:
> On Tue, Nov 12, 2024 at 06:55:15PM +0000, Jonathan Cavitt wrote:
>> The qualifier "desc" as used in the xe_lrc_snapshot struct is a legacy
>> term used by i915 that has been incorrectly applied to some of the
> No, "context descriptor" is a formal hardware term that's very much
> still in use.  The context descriptor is the 64-bit value that gets
> programmed into execlist submission port to ask the hardware to run a
> context.  The context descriptor contains the LRCA inside of it (among
> other things).  See for example bspec 60419, 60156, etc.
>
> So the real question is what is the capture code here trying to capture
> and dump?  The full 64-bit context descriptor or just the LRCA?  If the
> goal was to capture the full descriptor, then we should probably just
> make it do that.
>
>
> Matt
>
>> attributes.  Said attributes that use the "desc" qualifier, namely
>> "context_desc" and "indirect_context_desc", would more accurately be
>> referred to as addresses, so replace the incorrect "desc" qualifier with
>> "addr" in these cases.
>>
>> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
>> CC: John Harrison <john.c.harrison@intel.com>
>> CC: Matthew Brost <matthew.brost@intel.com>
>> CC: Zhanjun Dong <zhanjun.dong@intel.com>
>> CC: Alan Previn <alan.previn.teres.alexis@intel.com>
>> CC: Matt Roper <matthew.d.roper@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_guc_capture.c | 2 +-
>>   drivers/gpu/drm/xe/xe_lrc.c         | 8 ++++----
>>   drivers/gpu/drm/xe/xe_lrc.h         | 4 ++--
>>   3 files changed, 7 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
>> index cc72446a5de1..b95c21a18c31 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_capture.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_capture.c
>> @@ -1632,7 +1632,7 @@ xe_engine_manual_capture(struct xe_hw_engine *hwe, struct xe_hw_engine_snapshot
>>   		if (ge) {
>>   			guc_id = ge->guc.id;
>>   			if (ge->lrc[0])
>> -				lrca = ge->lrc[0]->context_desc;
>> +				lrca = ge->lrc[0]->context_addr;
>>   		}
>>   	}
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>> index 4b65da77c6e0..09f0e66952e7 100644
>> --- a/drivers/gpu/drm/xe/xe_lrc.c
>> +++ b/drivers/gpu/drm/xe/xe_lrc.c
>> @@ -1635,8 +1635,8 @@ struct xe_lrc_snapshot *xe_lrc_snapshot_capture(struct xe_lrc *lrc)
>>   	if (lrc->bo->vm)
>>   		xe_vm_get(lrc->bo->vm);
>>   
>> -	snapshot->context_desc = xe_lrc_ggtt_addr(lrc);
>> -	snapshot->indirect_context_desc = xe_lrc_indirect_ring_ggtt_addr(lrc);
>> +	snapshot->context_addr = xe_lrc_ggtt_addr(lrc);
>> +	snapshot->indirect_context_addr = xe_lrc_indirect_ring_ggtt_addr(lrc);
>>   	snapshot->head = xe_lrc_ring_head(lrc);
>>   	snapshot->tail.internal = lrc->ring.tail;
>>   	snapshot->tail.memory = xe_lrc_ring_tail(lrc);
>> @@ -1692,9 +1692,9 @@ void xe_lrc_snapshot_print(struct xe_lrc_snapshot *snapshot, struct drm_printer
>>   	if (!snapshot)
>>   		return;
>>   
>> -	drm_printf(p, "\tHW Context Desc: 0x%08x\n", snapshot->context_desc);
>> +	drm_printf(p, "\tHW Context Address: 0x%08x\n", snapshot->context_addr);
>>   	drm_printf(p, "\tHW Indirect Ring State: 0x%08x\n",
>> -		   snapshot->indirect_context_desc);
>> +		   snapshot->indirect_context_addr);
This is neither a context descriptor nor a context address (indirect or 
otherwise). As per the print text, it is the address of the indirect 
ring state object. One could call that a context in the general sense 
that 'context', 'state', 'info', 'storage', etc. can all be used to 
describe the saved state of an entity. But generally, we use context 
specifically for the entire 'thing' that needs to be saved and restored 
to switch the hardware from one user to another. The indirect ring state 
is just a small sub-part of that.

John.

>>   	drm_printf(p, "\tLRC Head: (memory) %u\n", snapshot->head);
>>   	drm_printf(p, "\tLRC Tail: (internal) %u, (memory) %u\n",
>>   		   snapshot->tail.internal, snapshot->tail.memory);
>> diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
>> index 40d8f6906d3e..f6bf81009294 100644
>> --- a/drivers/gpu/drm/xe/xe_lrc.h
>> +++ b/drivers/gpu/drm/xe/xe_lrc.h
>> @@ -24,8 +24,8 @@ struct xe_lrc_snapshot {
>>   	void *lrc_snapshot;
>>   	unsigned long lrc_size, lrc_offset;
>>   
>> -	u32 context_desc;
>> -	u32 indirect_context_desc;
>> +	u32 context_addr;
>> +	u32 indirect_context_addr;
>>   	u32 head;
>>   	struct {
>>   		u32 internal;
>> -- 
>> 2.43.0
>>

