Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 684BCC71136
	for <intel-xe@archiver.kernel.org>; Thu, 12 Jun 2025 23:43:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B30F10E058;
	Thu, 12 Jun 2025 23:43:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IP8KDMaL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B03110E058
 for <Intel-Xe@lists.freedesktop.org>; Thu, 12 Jun 2025 23:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749771799; x=1781307799;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=v8gBDkMYkd+bgJeR7tNGOmCbFip+VNy9zy1fLTseigY=;
 b=IP8KDMaL4JQ6XDeACSkHunaDJpP/EMggrUYieUo1NMQl8jc9uDoZ01e9
 IVBzhNhvwIOQp90JyN5yk+fUawW4zHfMHY0BPrIA/7kN5FVfgEsFvnK4F
 xp1bzjrtu6qqIE8CGXOO0rGyeXBpx/iXIi/Kl8/KLe02wt2HPLHACncWb
 Vickh66X/WvMqpL/vPy4NIz+z/FaN2aGoMXdItVNEXZgRlZiFJQU8fEKT
 qd1tGIUpxTh3htGbcPQwpBksAjhLZiiikcocmW/jLpT2FrvadeR8OKTRK
 0uXuUQqL9i2ketV1tY/VCABe2mj7D2ZS/OprDdDuKfabSyV/1s/Wvph7E g==;
X-CSE-ConnectionGUID: jjgkeZV+TL2vxv5OLrFGqA==
X-CSE-MsgGUID: 2C7XHlyeTQOeoNVdYkDPuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="63328007"
X-IronPort-AV: E=Sophos;i="6.16,232,1744095600"; d="scan'208";a="63328007"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 16:43:11 -0700
X-CSE-ConnectionGUID: F3lcMg0oSpODiU5xD9F05g==
X-CSE-MsgGUID: pp0bY7cRSCKzZwATqdgsGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,232,1744095600"; d="scan'208";a="147521347"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 16:43:11 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 16:43:09 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 12 Jun 2025 16:43:09 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.46)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 16:43:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ODTrIuNFmnrIiVQYwXdXtjrTBVKNFReqCVVgJ0uL39YTgwE75NM7EWUltVPFlgnQ/19Cftc/zv+8cjmWohPLVEkbipDVpeE76Lx0bcMrnSWMiMaqGaEJGOAOxLufdF/JS5Lmb8W4970bO6sdDAQ4lf6J/MrxVVBzZoxydDMBK2/zlkGZ6+aXYq7wqfsBRZ23j64xiaWeNAKAibeFHMV1D11JB1oVYuLmu5BiQaQAHGUdw3yJFPJa4VH2IjDWKMwXkQn0RL6QIEpcQerXIoQC68e/M1DFUs0YNnJfjX297YZVoKXtPi+gcW51Ayc76pL5bBHokii80xM29bewRAadmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g+5yvhPa1yWM+ba5dsvGAct+F23UviOF9J0tQRszkKc=;
 b=NznndqHOGc7ImXKdiW4g4XyZYI/YVirmAy7lj9G+k8EIeSgutlVLRYrXDtIRTte8vSRrpXErqZbBL/GElkR035NdLJpM4lpjZ9u63JtwjPpWrLNMHly3trRp5pcFEIms83y/fFUXpvayJvSTtc2WTRK5ASYHhBDK9PcAmHY+wPCs+Vhr6Zbob/tJSi3EucaauR2YK1nS4sbyHcz/sQJ2oJ0Dxuelb5wCeyRMiJDod8Ilz5if1lSBEL20PcYg6WDnY5TfMZDE0abzQue7IEwzgRoArj/bN8vantrGcu8/9jvk+FOL0k3TYCnJ3K01WdrJHhf/2AB3REG86z+QNd6eVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by CH3PR11MB8703.namprd11.prod.outlook.com (2603:10b6:610:1cd::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Thu, 12 Jun
 2025 23:43:07 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%4]) with mapi id 15.20.8835.018; Thu, 12 Jun 2025
 23:43:07 +0000
Message-ID: <d662c9b3-feeb-47b5-9b97-7fe9f3c726f0@intel.com>
Date: Thu, 12 Jun 2025 16:43:01 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe/guc: Add support for NPK as a GuC log target
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <Intel-Xe@lists.freedesktop.org>
References: <20250611210553.3756700-1-John.C.Harrison@Intel.com>
 <20250611210553.3756700-3-John.C.Harrison@Intel.com>
 <mgjvnmzve36ippij5wgjc37iskd5zeughb6vaceatuf55md7eq@qdtfddo5bztv>
 <2b862e51-ff9d-453f-b444-5783df07c600@intel.com>
 <ipcuzymwpfnoikxo5jp4d4vgobed7ip3wp5ccrljvyprx27yob@bcmzpft4vsnm>
Content-Language: en-US
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <ipcuzymwpfnoikxo5jp4d4vgobed7ip3wp5ccrljvyprx27yob@bcmzpft4vsnm>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CP6P284CA0084.BRAP284.PROD.OUTLOOK.COM
 (2603:10d6:103:1a9::9) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|CH3PR11MB8703:EE_
X-MS-Office365-Filtering-Correlation-Id: 692746aa-e575-4166-3d2f-08ddaa0ae1ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bXBLbzFvak9PUGNaeHFBWG8va0FEWkdONkRDTW9yRnpYbHVDYTdwdnY2c01R?=
 =?utf-8?B?RFMyTGtSQ2JIRTFlWlJvMFZGcWE3QWdhWHZVWlR6Ri9HZ3ZxMzBzMERXSXN1?=
 =?utf-8?B?N0ZJRndmaytGNERVbFNvMWlGTEQwRUc1eCtJNmhuMVFib1RxVk4wZ3g5cFBP?=
 =?utf-8?B?TTFlb1RESVBHTG9pTk1GZ3E4ay9VYU1iOEQxdnl6VTJ5Tjd0dEJTZFRseWZQ?=
 =?utf-8?B?bTRkWDN0dTZQWnJvRDRXbTdJZzJPV2JYa3NNbzlrZ1I5Um5vaTFKTUJQTFF3?=
 =?utf-8?B?ZGcvOVJKUTVJaFhWOGJWcktKV2RZRXpaaVVwTHRJd2xMckN6WkoyTkRHREFt?=
 =?utf-8?B?UnRiQUZuODlzZW5XcFRzelJJb0dtM2VETkhxQzFMYzNGVE1WWWRQWU54aVhj?=
 =?utf-8?B?T2Y5d2N1Y2JKZW5ScW94OEpTMjJJaFJjbFBCcGNtK3R1clNrc0l4VkxSalBN?=
 =?utf-8?B?TFdtdTBoY0E3TEUydkhEY0ZqVXdxVitVd1ROTThWV1pHT1VKRUluQkpIZDVm?=
 =?utf-8?B?NzByVUJSNG1aRk1xNWZHWDkxbDkwSC9NR0JyaXRpSWRrVTdXSllPckY3VjlS?=
 =?utf-8?B?NU41YXBlaVFySmtMTXhyYmVzMFVBc2hKZE5yYnYwODdQWmhGVGgxNVYwV0E0?=
 =?utf-8?B?Y3d6WWVPeUJOMzE3VVJWZG0yQVNObzhhVUV3N0JlczRaSUZLbTM0dSthaFRr?=
 =?utf-8?B?bUxPR05QR1dVcEJoN2NqMHI0dlI4YXFDb0l2dXRSY1BaTVNsdnl0LzNHZDZN?=
 =?utf-8?B?UVhZMnNuOGVnTjN6M0RCY1RKL052Wkc5eTl2YUlCTmlNWjNoUFFoalVzYXlQ?=
 =?utf-8?B?M2tEaW15ZnlHaDBRWnFieXJxbExGYVRJYlFOTkdPcTJLQzR2U01LdmFaeEdy?=
 =?utf-8?B?RWcyMEVVUzcza2dJZ2VpcERhSUg1ZG1WV016eHBIRVpyY1ppenBBc2RWbEhp?=
 =?utf-8?B?Y1FVaHAySEdqTUhCTmpMYmRXVHRQOSt1NFZQdGt5VHFaYXluRjAwOG9SbXdQ?=
 =?utf-8?B?cUpwUmpLRmVTUGt3TEpPS3ExeHMyVzFDb0ExdUdCTDAwazhhbXJiQXpNOEt1?=
 =?utf-8?B?cVFLUzFuRzZhZ2pxNm1GNlRtSjZaRVZpZUZjTUZuQWNYQ25jZFNqVGRYZ0hD?=
 =?utf-8?B?emh0bmdkSVY5ZzAxZFlpVGszc0x2Yks0QzNhd2lOOG5EYytNS240a0NycE00?=
 =?utf-8?B?dUxWU3VFRG1vSEFBU01kNHJpazMxUEVmS0xrbTVDMlVEdTlZVGtab2tQTW1V?=
 =?utf-8?B?SU9xSmxMOXpGZkF5OXV1ajhPNys4akx4ZWtMU3U5UHduTjA1TmltajYzNkxn?=
 =?utf-8?B?NkV1QTFZRC9pRlp6c0FmaUFId3BreEo0aXowcHZtQWovZXExVis0a1BCelE5?=
 =?utf-8?B?VGF3VTFIbE5PRkhyYnh1dGxVNDkwUVFWWjFYb1ptRTlMMU9JSkJqL1ZoUGVx?=
 =?utf-8?B?STdoTTkrY3RkelV0UzhPZFpTSzNqU2haUkJwdzI4VjZTaFJSKzArY0NITVVu?=
 =?utf-8?B?TU5zZGFzWGZhMk0vZC9POXNVeG15UFp6ZHFBMFNNTjAzUm1KRmk2WXdUWTgw?=
 =?utf-8?B?czlOOG5mL0hRM3NDS2tpYmh2eHpSZUdGWUh0aFQ5MDVrVkZrUE1aOGdHQWE3?=
 =?utf-8?B?Q1R5SzZmRjRYQXk5elNXb1JObHZURm1ZNk1ZVzFRRnRwRGY2UlVMNEVUQ2ln?=
 =?utf-8?B?Z2ZhMkF5L0srbW9hcWswRlFZNnpGZW8vVlpIbkFGV29FWnRzWkZPUTZaOHRB?=
 =?utf-8?B?OUdhaDN1bkZJa2h6ZmhiVnRCcVdUbnRzOUxsTzhBWUlyM0NKYytoeVk3L2Y5?=
 =?utf-8?B?cXZTZUNPeEIzWFlDUnczSjdqeTMzdC9SbFN3VzhLOWxsempYMk1aNDc2T2ZB?=
 =?utf-8?B?RjRKenJIM1FDMnA4UjFNUFBlQ2lGTGh4RkhFZGlMR3FQaUVRUGpIbkh6UGlj?=
 =?utf-8?Q?whwNQz01vDU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QUNOSzRnb094L3hrRm1KaVBGUndQOVc1MCs2dFZXZlg3OGNCczJCeU5HYUNB?=
 =?utf-8?B?RXRBVFhqSHlsb0J2N0JQb0tmaEpKKzRCa010QXc2SHNDeU84ZnQzeTBkWGVP?=
 =?utf-8?B?SEhLbUsrOVhCR1BjcG8xd2Jqc0hqUjArZnA3UHBqRkhoK1U5MVM2bHZiODNr?=
 =?utf-8?B?MllQRCtyQU4yMXlZcnNTRTdFNHRJN2lvc1B2RmpoM1pJMzR3dG5XcDdwZjRF?=
 =?utf-8?B?SjNEVTNFZTdNZzdwUXZlWmNoUW50TnNlVXlIekY3T3M2MHF5SEJRb21VeGhK?=
 =?utf-8?B?ZGpqT3pIY1VyY01jUktXem1RZ1Fwdm9lb0hlWjNvUHJVY2tyaVRmNDhWQmZC?=
 =?utf-8?B?OG9COTRxSXk5cDFCd0tpZk83VnhMUW0zV0tpMW5yYXI0VGJjMXFXMW82YlBr?=
 =?utf-8?B?bnlVQWpoelNOdWN2VG40akdySWhlcWVYNFBBekRZSWdZMDBJeTJGT2tPTm9S?=
 =?utf-8?B?dmVlQzNVUzVoczhIZStGRmNaL3ZLTmkvenIwemorSUtFWitjMkM4NmdSaGpU?=
 =?utf-8?B?UlVScXY5T0szY2N1cnpPTGtiNnpyLzZKRzdKYmtySjhVUWVzK0hKVmc4b3hW?=
 =?utf-8?B?dWdRVDI4eDBSMDJtKzVLSEtlRDFhdHUxTC9MZ1pGR2ZwWWxrMW4yb09NbGsr?=
 =?utf-8?B?UXk3cm96azN3NFRCc1k3SDhJeTdJWTRYQnVZVDB4NXBxa294OUYzenAwSGxQ?=
 =?utf-8?B?MFVSZVNka2ZJZTlUUHNFZlc3bWtoaFEvSHoxekFYZlBUWHExZ0FySHVLU2U4?=
 =?utf-8?B?L0xjOTdMVGVvWVRXNWJtcXhIb094RUlIUG5TQ0daR3dBR2dpckZCckR0ZUNX?=
 =?utf-8?B?OGlNazMyWUE3eCtEU2hwaTVRVVJmbVhkUGtmU0ZrUWQyOGlwL2tWaVhEeHQ1?=
 =?utf-8?B?SGVURFZ0NERFQmwvNWliZm1lbExPbzRweVI0YjdGcmZWc1E3NnFrRFJad09W?=
 =?utf-8?B?QlZidEFUR3ZKMkhETWpVRWt6NGdDMmFjRnJRUEdKcy81SFJ6S0FkaVhGZ0x1?=
 =?utf-8?B?b0h6bzI3VlpESnNaZk1Ld0dWakpjZ2NET2ZyanRZQjRjc2piNkx6eDVOQzF4?=
 =?utf-8?B?Snd0bzhhRmxEZ3BTZFBiUE5ma3BYSmlCS3dNbGM0UzY3VzBZWGNySFFwdk1H?=
 =?utf-8?B?aGE0NERYcWpOTUZWN3QwM3FCT0t1L08zUjB0RmxNNi9FT0xGRWNUZ3psNHhE?=
 =?utf-8?B?L2E1Y281a3k0RmRwRnNaazV0MFVFcS9kSjlEc3NrdlpnaDVJYmQ1djZBMkRs?=
 =?utf-8?B?YTc0eUNDaEdmOEJNc2pFOTliK0p3NnRTVUh1OWRqdmp1VnpZbS9pV3FjSWhq?=
 =?utf-8?B?RW9DQUdWVmFVVVRQUWpnZm9JOHZzMnVabGU0UFVOZlcxZ0dkUWlTR0kvdEJX?=
 =?utf-8?B?QUtQZjBUamppUEVsQnplM3BVVFVnT1l1YmxoRER4VTdoeU00WFpKdW5EUWE3?=
 =?utf-8?B?VURVamtpYXhDaVZ2cEFGZ3hHQk5jQklHNkpVOE1FemdvMlJWTHRKTnVRNEl2?=
 =?utf-8?B?SU5FeTVZc3hEbHFERlBDazBaTWorYWZCZ0dlTHZpUjRERldidUtLNjk2anFB?=
 =?utf-8?B?T3o4Y2VURnp1ZUlzQ092aTRwbk5CUi9YSDJkUXA4S2FVcHhsbzNNN2EzTFRV?=
 =?utf-8?B?Y3RXWjByblpTMlQzQnE3elRlcElFVXFHUmIzYUFOWXZwcmNXWC83cE5lVVEx?=
 =?utf-8?B?SkVGeGV1WWZTb29XR2E1UEc3am5VUFN6T09XQ01GVDhCdzJxZUhCcVQ2d1Vk?=
 =?utf-8?B?bnlxNWIzMUREQzZCUWlPNk5jZzR2bDV1blhHVE5hdVAwaWJsNlFvb2xmVjBt?=
 =?utf-8?B?ditBU2JHLzBOTFZvcDVwdkMxT2ZxT1FUVVlQMXBKTHM3L0ZJR0xreUNpcGZ6?=
 =?utf-8?B?RVE5K21tUm9lMmtPZWd2bXdsM2ZKaTJldEJkMlBKNVFtcFZtZGNMWlE0RXNh?=
 =?utf-8?B?V3lHTi9tVnE2WGllVTZtUUpuSUtDa3R5WVNmeFVET3hOUmd3WTVaTTFWLy9Q?=
 =?utf-8?B?TkNPOVVGUklSNENQb0gzN0FpWkRSN2xDU0NiMDNkc3lrbjRkNTF0SnJTOTRR?=
 =?utf-8?B?R2xuaWZNMTVtTnRjaWdUSmFlUGlvb0t3c0EveWFvZTZHSGdQcGVNNHlxRG1O?=
 =?utf-8?B?RHJEQURNWVU1Tm5wcmU0NHZJRk1UekUvWE80VStHelRHVzhaWUVLZllaVnNz?=
 =?utf-8?B?WEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 692746aa-e575-4166-3d2f-08ddaa0ae1ac
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 23:43:07.2613 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EqRSNDSOTDcN1uVv09Zly9QgWg6g23CNIRHu2rSBcddcReyBAsnI5Hcty9yEVgK+Ep4psWAqgm34FHHwJFHnm+7/QeOUujqpNH5jZZZZnkE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8703
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

On 6/12/2025 3:05 PM, Lucas De Marchi wrote:
> On Wed, Jun 11, 2025 at 04:51:24PM -0700, John Harrison wrote:
>> On 6/11/2025 2:49 PM, Lucas De Marchi wrote:
>>> On Wed, Jun 11, 2025 at 02:05:53PM -0700, John.C.Harrison@Intel.com 
>>> wrote:
>>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>>
>>>> The GuC has an option to write log data via NPK. This is basically a
>>>> magic IO address that GuC writes arbitrary data to and which can be
>>>> logged by a suitable hardware logger. This can allow retrieval of the
>>>> GuC log in hardware debug environments even when the system as a whole
>>>> dies horribly.
>>>>
>>>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>>> ---
>>>> drivers/gpu/drm/xe/xe_guc.c    | 4 ++++
>>>> drivers/gpu/drm/xe/xe_module.c | 4 ++++
>>>> drivers/gpu/drm/xe/xe_module.h | 1 +
>>>> 3 files changed, 9 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>>>> index e16d19b44bcc..9c0e3113f7d5 100644
>>>> --- a/drivers/gpu/drm/xe/xe_guc.c
>>>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>>>> @@ -35,6 +35,7 @@
>>>> #include "xe_guc_submit.h"
>>>> #include "xe_memirq.h"
>>>> #include "xe_mmio.h"
>>>> +#include "xe_module.h"
>>>> #include "xe_platform_types.h"
>>>> #include "xe_sriov.h"
>>>> #include "xe_uc.h"
>>>> @@ -74,6 +75,9 @@ static u32 guc_ctl_debug_flags(struct xe_guc *guc)
>>>>     else
>>>>         flags |= FIELD_PREP(GUC_LOG_VERBOSITY, 
>>>> GUC_LOG_LEVEL_TO_VERBOSITY(level));
>>>>
>>>> +    if (xe_modparam.guc_log_target)
>>>> +        flags |= FIELD_PREP(GUC_LOG_DESTINATION, 
>>>> xe_modparam.guc_log_target);
>>>
>>> is this supported across the board for all platforms and firmware
>>> versions? Otherwise, what'd happen if you have and old igfx and you are
>>> debugging a new dgfx? or vice-versa.
>> All platforms that have a GuC and all firmware builds that have been 
>> supported under Linux. North PeaK is part of the host chipset not the 
>> GuC or GT.
>
> so I imagine this only works in igfx? I'm mostly concerned about this
AFAIK, all platforms means all platforms. TGL, DG2, PVC, LNL, BMG, PTL, 
everything.

> being a module param and then you try to debug one card and get the
> other to do what you don't want (or crash, or refuse to load). For
> similar reason we've been adding these debug aids via configfs rather
> than module param.  If it's harmless, then.... well guc_log_level is
> already there, doesn't hurt much to have the other.
Yeah, Stuart mentioned the configfs thing. I'm going to take a look at 
doing it that way. My only concern with that is the learning curve to 
use configfs seems quite high. We can't just add a comment to an end 
user bug report saying "please set the module parameter". It would take 
quite a bit of explaining to get someone to set an option via configfs.

For this particular setting, it's not so much of a concern. As 
mentioned, this is not something any random end user can actually make 
use of. It requires some serious hardware to be attached to get the logs 
out. So someone using this is going to be more hack savvy than an 
average user.

John.

>
> Lucas De Marchi

