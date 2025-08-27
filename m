Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7356ECA0EFF
	for <intel-xe@archiver.kernel.org>; Wed, 27 Aug 2025 19:15:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3522310E175;
	Wed, 27 Aug 2025 19:15:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fj1I5P0T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE7F810E175
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Aug 2025 19:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756322156; x=1787858156;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=2LtSohfvhUO2uMa0ziKsQg0RgCbGj6TQDgjVBK5iY3Q=;
 b=Fj1I5P0TSmwOTA1unZ94TVUZvq9qomJDF9qhlMeIv6gmnl483flbl8MU
 TOkQnSdca5ttwdG+txv39ZrEFi3jcbdA/TWoINW3wCzDLV5QCsUUPw9N/
 EO+IfIxQpNYLBjNLGg01ziFvF2NVivoW00twDPlZZlgqc79+syraQmAK4
 h1SXy4xFGCtPEdU1QZjfvdQUUyt8+DEt5Ao/tL6ZerYUVB9mkCCttxabS
 zgiDiiD+/iquK5Ub2Sjiu3CsRiVFYs6z9aOk7lzd0LVUQFaJIRAmj9Q+c
 rF+GQludzeh9Zyyn/vgdprYqSD1AITatQeFFK6nAvjia6CTaW+KQOdqJg w==;
X-CSE-ConnectionGUID: vyEoyU8PQ6eXB/Q/YGB9hA==
X-CSE-MsgGUID: Mpz0u0QzTPKpiog4lgB8ug==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="58514116"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="58514116"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 12:15:55 -0700
X-CSE-ConnectionGUID: MEeNu8oDT+yCz43Y8waY2Q==
X-CSE-MsgGUID: fIqtptwiTZOaHK4p+kGuPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="170735678"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 12:15:55 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 27 Aug 2025 12:15:54 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 27 Aug 2025 12:15:54 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.40)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 27 Aug 2025 12:15:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N79LxTeCV4Jx0zD73F5Z5AFb5wt9xn6gxG7PUEaGN9FvKa2qGJefXmGqYIXL0uZmKNASO4vnGJHTNaV90X4NoGlD0xenPzlhsfPo56gU6CkYSpWsFT/id4kkxh2GE1DwOqHE5tqeC6CrcgQuAYfa/XoXtcfYeSE2sN3UjyUoNuYDtyWFcJon/aPtZ29MHE1YudKAzlPBNGGCvuRAXhqq/sQw3wDiS2XllP9UYpA93jp/pjlBhBR0TB4qb8e8Us41JTqKIZznLDalpizRREpCQfLCKkxgF60SzBjWOgZ9E/RnJLa2eKB8SVklTlfB6LiagfW5MzCyzFmgzX4iYp+QOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RFqR24QLCVdLEBOiAg8M0dfQrxSm1HpxAGccptHgTkM=;
 b=Rh2zOgBtF0mbqo9tpKvw/NhySpEW74Z8KmI0v3za5CW+0b25vQvFShEZmTbW+oX6U0CmboZQH5GImLirlnirdAY/g0HbQGG/QBCpPdFZCPFB4XzXNQGxCLG1wWA9739YGWzUIkGapxyNSph8Nav3hZZblMfepkhkj9WmUA/sN0P+eoRSGFYoHzW7g4NHy49xkXqGmiNNzma0LXJ8z77/yhZ3bsZNKIXwEGqp0a4gz9eW6QAftZFrD1SuBn8PBs5s/o5TMNoUX4QV5IPUFeVkGZuetJx3bkH1OSTQoWABgT+RuctQRa7k54R/RsIi2yZn8oWCSujZdKhlzD7mDAGSuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SJ1PR11MB6203.namprd11.prod.outlook.com (2603:10b6:a03:45a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.19; Wed, 27 Aug
 2025 19:15:50 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%5]) with mapi id 15.20.9052.019; Wed, 27 Aug 2025
 19:15:49 +0000
Message-ID: <eb17d7cc-bc60-4eac-86c0-ae6df3976db3@intel.com>
Date: Wed, 27 Aug 2025 21:15:46 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] drm/xe: Add more SVM GT stats
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20250827184352.175550-1-matthew.brost@intel.com>
 <20250827184352.175550-3-matthew.brost@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250827184352.175550-3-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0046.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::15) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SJ1PR11MB6203:EE_
X-MS-Office365-Filtering-Correlation-Id: 4de0465d-29ce-4c0f-fa26-08dde59e21e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VUh6Y1pZSklYUXZ4Mkh6V0ZSaU42V1J4SEc1RFlNRkZBb1k0blVRQVpCbTFJ?=
 =?utf-8?B?bHpKTVQxWmFydnZ3cklyYzhaY1ZXMGxES2JCM1BVSXh3a2dhUFNMUGphOFJE?=
 =?utf-8?B?NUsyZ2ZSTzd6V1dtZkY2b2pBMFBGUmhZbkRIaFVueVM3WElKYmV1SE5vR0Jl?=
 =?utf-8?B?MStyc2YvY1hoNXpNdmlRTjZpWEhFUE5OallMU1F5WFJWUHFqQno1K3ZkcWpz?=
 =?utf-8?B?NERtZG5OS0FOOXFxNStzVVdWYzdRd3hGYU1VNUpsUW1XemZaNUdkN3MvNi9V?=
 =?utf-8?B?V3h6N21sUTE4NVRhdi9OTFFqMXljK3BOTVQrTy9aSStPVnk0SkZSenQwZm9K?=
 =?utf-8?B?NVFsMFg4T1JQd0JnQkdRcVMyWTRHZ1A5WFkyQmcyZDVURmpzVTRHb2pHbFdr?=
 =?utf-8?B?dHBCSEZGNndJYy9IQ003dkFqcEU0K0QvVElDTWZ4NkFZeWt3Q0hrV1hVc0s0?=
 =?utf-8?B?ZjNsbUNab256cCs4LzBzbzBKQmFiNUN3SG4zZExmclowVDAvaFpnRVBzYUEz?=
 =?utf-8?B?bmlndDgrU1oxWkhUTDdqT1JoS0M5Q1JiS3ZxVkZhNURmR3E4VzFjL0hWN1FF?=
 =?utf-8?B?NDRqWEt2eVhJYjJadE1wTkhSdE5WWVBvZ2F0R3JlNCtyRVB3akZ0RlovRlZD?=
 =?utf-8?B?ZHdUTVdCMWdnd29IYTR3ci81bnI0b0FkeERaYjgzZW1naUd6YlhvTEcyUThG?=
 =?utf-8?B?OFp6M1NCMHNnWWxFVThPdVFmTGt2b1p5S2pYa242NGQrRy9sN1E2Qkl6Qkg2?=
 =?utf-8?B?eTNxT212YktIejFHbkxoV3FJbXFVRDAyRGw5MzYvZ0ZCbmRzejlSa0hjQVY4?=
 =?utf-8?B?SmI0c21nNjcwWGw1MGx4RjV6RWVudDNMZjNPZkp5dzlYdUZTL295eEZIazlp?=
 =?utf-8?B?eno5WmN0RzNGVGtlRkZNOUVWRVREWTA0UDBYTlo3bFBkZnVJYVp6azJLVVdv?=
 =?utf-8?B?ZUFzWERqOVk3TmRBU25GZWM5NEpKSUFuZE9vaGxlMTRDb0xEZE8zZCtvOXFL?=
 =?utf-8?B?dklQQkRvM1RTNnZLcXNJYUtjUWRHbjVudFAya2plUlgydHlyOEYybTBJb1Ax?=
 =?utf-8?B?dGEzd0Y5YklLang5VWZ5clFJSGxIRTJNRmVNbmtBRVpWMkNuWDBqbXgrMEZL?=
 =?utf-8?B?ZnZhUUJlSnFxRWZXOUVUci96MkpZeUZyMnhGenpOYzZ5c0Z6RzU1Rm9PZWJK?=
 =?utf-8?B?ZFJLK3FFWjRKRFZnajd2Z0NUQk4zdE9vZytITzAxRmF0TndaTXRrNzJKM2NC?=
 =?utf-8?B?UkpvaTJLVEVQLzJhYnkxZ2NYZVA1bXNrMXNEV0JaRGp2SnRLelAyNnlnaHVu?=
 =?utf-8?B?dHFNSFhzRXpRZ0c3dDM4K1BuZStIWHEyNnlacjA2T1Z5T3E5RnVkc0l1YTRt?=
 =?utf-8?B?K2MzR3drY0doVkNBMWc1RVVqSlpwQzR4M0ROdzRJd01LMmhvLzEvL2V2cSt6?=
 =?utf-8?B?a1JZK2VJRHlMVXhxT3BpczdMa2ZnNTN1RTZIM0RjcEtYVmJPeUlOQUFybDNN?=
 =?utf-8?B?OWF1dVBQVzk5Mk5wWVhBYUpsaWc1dVhWSFpybVNTdzgvUWkzdjY3a3BrR1V5?=
 =?utf-8?B?blFGeVRyS3drcTFCZkZzZXZpZkMzUEZQUC9FWTA3MFFVamRoRnJRc3FnbUwx?=
 =?utf-8?B?NDJmRzlLeGFnRG1YdmFUUk9Tc0J4V3VkMEdWbzVobjAvWUJGNmxEK2pjTm0x?=
 =?utf-8?B?Z0pMMXE1RUZCMWpydmM2MXhwNFl5SDZFZ1hGeSt3bVQzN0loQ1VnY0hJYmVF?=
 =?utf-8?B?Z0RLemJhNG5tZ0VmYUI0Q0tLbUNHOUNxTEh2SGowS2prRXhWTG1zT2ZXc25x?=
 =?utf-8?B?ckwwamxDYThEMnlMeURENFNCQ2FQSUhtRy9NajMrU0JKNExFaUVXNkNxbzA2?=
 =?utf-8?B?VlJMd0xjSmxYVGpVTUpTejFBcGl0blFzNU14QXBuMHFvSmpkQ1VTRkNjM3lG?=
 =?utf-8?Q?ULAfl6wPlWg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a1UrNVFrMHk5bjByMzV2RzNVM2Q5Skd4SHR0d0FBc2htTWg3RXhzYU8rSTJB?=
 =?utf-8?B?RVA4K3RwVmF3QVRoQkJtNEtueVA1MjBOU2ZuZlpGM3c2RWVSTnNxa2ZjUGlY?=
 =?utf-8?B?eER2ampVYkhBa0tVRnd1ZmxZQ2Y2Y1VwWXZ3cmE3MWpWcWZxWjJnMUpQT25i?=
 =?utf-8?B?ejBzZTBmSGI3ckwrOHR5Sis0cDJOalpBaURBL3RWSmpIZWx5N2pBcUpIMlNG?=
 =?utf-8?B?dGhtNng5TGZqY1VaN29DOWhFUUtRNDUrbkIwU0JNMm5xU1E5WTdRL1BMZ0kz?=
 =?utf-8?B?aGx6a3FvaEpCblpKN2d3TElVZkZpSW9tK3VGYkpSdFpwbFJsVmVJcFVVbVMz?=
 =?utf-8?B?WktQSzZqWE5sTXc2czFTYjRCQkh4UWZrR0VRZUJaZFRsdzVscjZDQWpqTVJG?=
 =?utf-8?B?V1hYUDlaVmxnMFpGMFZrSlorcW8xVjd6aVBOWlMwWStuVGVVajhTQ3dlTWt0?=
 =?utf-8?B?THg1VTFxeHI1ZVNBaEpKMmxYYWtrT2hZemwreU1wSjF3c0FEeGZNRDZUYmpV?=
 =?utf-8?B?YnJOdGdRTnhTaDJndVJzcHFRaHVUZ1RmbEdvOVdmSTZ4Qmk2blNvN1BMNVVB?=
 =?utf-8?B?M2NKb1NVV0N5eDFQekw4bS9hT2NjdzhjWE1MQ1E3Zzc5SlVhU3NSRDhYMGZU?=
 =?utf-8?B?eDhsVzdhNW9LR01wd2V0OVRBQ09zYUpuTnZ4SCtoakNLM2lHVDQydmt6WVM0?=
 =?utf-8?B?dmZweFhPSHhjUGcrRDBrd25keTY3LzFITUpCUm5rMzR1ZW5vS0ppY0tSTkJu?=
 =?utf-8?B?QzlOWFVQM1c4N0JwNWQ0cVl2cElFVUwzcGtZVkNnSWJmM0lERHo0QncvYXYr?=
 =?utf-8?B?WFBGanpuZlV0akN6V3U4SXhoYkdnUEJyZC92eTRwQmFvUWhhZllrczF3czcz?=
 =?utf-8?B?Zld5SDBvOE9zMlFoeVNnTzg0enUvVmxoRExGYnU4SERxN1NKZ29OSnZyaW5v?=
 =?utf-8?B?cG4xWXJXQ3ZPNnJDdE9QZnBEa0hGaWVwTjZDajVkZTJHenViYzExekg1bkN3?=
 =?utf-8?B?Mk5BOWtZNHNKSTBrV082SXM4Y0VHVG4yOE92cTZ4Rjl2ZnhWSXFFUWM2T003?=
 =?utf-8?B?ZW01ZzFPUlhzTDJVNnE1OVpNdlBxV0ZxNnVLQVY1OWU1ZTI0aURiV2twZGZV?=
 =?utf-8?B?N29GQnVTdGFtRWtRa3RMUUcrUHpQcDZCcUZ2dkd3ajlwdVNTN0NaMFZYVW1k?=
 =?utf-8?B?Y1Q0b2Y5YWVBdHNOUlRleGtCU3E1UW9YU2ZXdjErdkl2dkV3UGM2ZGtQdFRM?=
 =?utf-8?B?Si9SdnhXRkxKTTNXaWJMWnlEWkNGUWNuYVViRWMreTRsM3FjRE53ZFE0OWY2?=
 =?utf-8?B?SFRES0doYzIzOUJEUGs1Wm9MbGhCSjNGU0s4SFJaYjBjMjlYU2VENTU4ckxu?=
 =?utf-8?B?VFh0QldGcXlubG56NkQvU1VBZzUyVGVtTVRmdis1UEJCeDlremV2KzN4TDJv?=
 =?utf-8?B?aDIxbFM5NkJIMzdNVGV6eFhxN1pJN01IeXZ0alRENTErTzEzaWw4NWtEbTAv?=
 =?utf-8?B?SXhINnpIcG1FUWZnRE5pcERYUFRuWDFIRTRtYXhPU0RxRmovRG05NDdtMEk3?=
 =?utf-8?B?SjRYNThlRy9VRGNuaXJGNGVtMHE2ZnVwWDIzZkZSVnNhZUZ1NTY0V2FkUGFJ?=
 =?utf-8?B?VUZlS3VHcEg2M0lRUXVMNjNoYW04RDFMWU9PWm5qOUZhVmNVUkhMMmtRYUgr?=
 =?utf-8?B?NWhaMXFWdDdFVnBrTFlFL1dYdHFFY3FKQmxqY09qMC9wZFR3cTZvOUkvSVg3?=
 =?utf-8?B?WW5GWFZwdjRlamdLdkxhb1JzSGdyREN5R3psZVlaQzlvZDdRR2pUTjg1Rito?=
 =?utf-8?B?SXJxR2R3VWs1NWR2eXBGaythQU9wVGF1NmM0WGc2Q1hjUm9DMUVyK3c2SHhK?=
 =?utf-8?B?TWxkaUNlUmZWdkJkcnR6UUYxU1FjYVlQNytkY3oyS0FVczR1RXc5RTl0K3NO?=
 =?utf-8?B?c1F4UUxjdWZ2VVBrYzhOYzlIT00zdGNiODNla212OUxYamNrTWNYbEllZ1dw?=
 =?utf-8?B?U2FPUEt0dEw4RER6T3pBYkdPdm00c3JZek9wczc2Z2pPWFJYL2ZPL2pRejZ0?=
 =?utf-8?B?OFV1K1NQOTFWTHFFK2xJNnpvK3NwTlp0WWJaNWtxL0Y1N3hkRkRBQzVQRUVI?=
 =?utf-8?B?OHAvOEIwNmYyaDViZVc0aVpwdXNLcnRwMUFCL2hmVHp4dTFrTUhPdU04WnJm?=
 =?utf-8?B?akE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4de0465d-29ce-4c0f-fa26-08dde59e21e0
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 19:15:49.3506 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3D8QvxsH7xjB8al4PXmoyry7OS2AjYaW68lAk57TO4c1nRpvx/Pnk+sAq2sXtNlAFC4+SorCcrCwdrb83q1/sCjAUtEKnwfNecNHgcJ2DW0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6203
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



On 8/27/2025 8:43 PM, Matthew Brost wrote:
> Add more SVM GT stats which give visibility to where time is spent in
> the SVM page fault handler. Stats include number of faults at a given
> size, total SVM page fault time, migration time in us, copy time in us,
> copy kb, get pages time in us, and bind time in us. Will help in tuning
> SVM for performance.
> 
> v2:
>  - Include local changes
> v3:
>  - Add tlb invalidation + valid page fault + per size copy size stats
> v4:
>  - Ensure gt not NULL when incrementing SVM copy stats
>  - Normalize stats names
>  - Use magic macros to generate increment functions for ranges
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Reviewed-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_stats.c       |  33 +++++
>  drivers/gpu/drm/xe/xe_gt_stats_types.h |  33 +++++
>  drivers/gpu/drm/xe/xe_svm.c            | 196 +++++++++++++++++++++++--
>  3 files changed, 253 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_stats.c b/drivers/gpu/drm/xe/xe_gt_stats.c
> index 7e12fc3759e2..2422577e4dee 100644
> --- a/drivers/gpu/drm/xe/xe_gt_stats.c
> +++ b/drivers/gpu/drm/xe/xe_gt_stats.c
> @@ -29,8 +29,41 @@ void xe_gt_stats_incr(struct xe_gt *gt, const enum xe_gt_stats_id id, int incr)
>  static const char *const stat_description[__XE_GT_STATS_NUM_IDS] = {
>  	"svm_pagefault_count",
>  	"tlb_inval_count",
> +	"svm_tlb_inval_count",
> +	"svm_tlb_inval_us",

maybe use

	[XE_GT_STATS_ID_SVM_TLB_INVAL_COUNT] = "svm_tlb_inval_count",
	[XE_GT_STATS_ID_SVM_TLB_INVAL_US] = "svm_tlb_inval_us",
	...

to avoid mistakes?

and I guess it would be ok to use helper macro like

#define DEF_STAT_STR(ID,name) [XE_GT_STATS_ID_ ## ID] = name

	DEF_STAT_STR(SVM_TLB_INVAL_COUNT, "svm_tlb_inval_count"),

or if you're brave enough go with a super-macro, like [1] ;)

[1] https://elixir.bootlin.com/linux/v6.17-rc3/C/ident/MAKE_XE_GUC_KLV_THRESHOLDS_SET


>  	"vma_pagefault_count",
>  	"vma_pagefault_kb",
> +	"svm_4K_pagefault_count",
> +	"svm_64K_pagefault_count",
> +	"svm_2M_pagefault_count",
> +	"svm_4K_valid_pagefault_count",
> +	"svm_64K_valid_pagefault_count",
> +	"svm_2M_valid_pagefault_count",
> +	"svm_4K_pagefault_us",
> +	"svm_64K_pagefault_us",
> +	"svm_2M_pagefault_us",
> +	"svm_4K_migrate_count",
> +	"svm_64K_migrate_count",
> +	"svm_2M_migrate_count",
> +	"svm_4K_migrate_us",
> +	"svm_64K_migrate_us",
> +	"svm_2M_migrate_us",
> +	"svm_device_copy_us",
> +	"svm_4K_device_copy_us",
> +	"svm_64K_device_copy_us",
> +	"svm_2M_device_copy_us",
> +	"svm_cpu_copy_us",
> +	"svm_4K_cpu_copy_us",
> +	"svm_64K_cpu_copy_us",
> +	"svm_2M_cpu_copy_us",
> +	"svm_device_copy_kb",
> +	"svm_cpu_copy_kb",
> +	"svm_4K_get_pages_us",
> +	"svm_64K_get_pages_us",
> +	"svm_2M_get_pages_us",
> +	"svm_4K_bind_us",
> +	"svm_64K_bind_us",
> +	"svm_2M_bind_us",
>  };
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_gt_stats_types.h b/drivers/gpu/drm/xe/xe_gt_stats_types.h
> index be3244d7133c..d8348a8de2e1 100644
> --- a/drivers/gpu/drm/xe/xe_gt_stats_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_stats_types.h
> @@ -9,8 +9,41 @@
>  enum xe_gt_stats_id {
>  	XE_GT_STATS_ID_SVM_PAGEFAULT_COUNT,
>  	XE_GT_STATS_ID_TLB_INVAL,
> +	XE_GT_STATS_ID_SVM_TLB_INVAL_COUNT,
> +	XE_GT_STATS_ID_SVM_TLB_INVAL_US,
>  	XE_GT_STATS_ID_VMA_PAGEFAULT_COUNT,
>  	XE_GT_STATS_ID_VMA_PAGEFAULT_KB,
> +	XE_GT_STATS_ID_SVM_4K_PAGEFAULT_COUNT,
> +	XE_GT_STATS_ID_SVM_64K_PAGEFAULT_COUNT,
> +	XE_GT_STATS_ID_SVM_2M_PAGEFAULT_COUNT,
> +	XE_GT_STATS_ID_SVM_4K_VALID_PAGEFAULT_COUNT,
> +	XE_GT_STATS_ID_SVM_64K_VALID_PAGEFAULT_COUNT,
> +	XE_GT_STATS_ID_SVM_2M_VALID_PAGEFAULT_COUNT,
> +	XE_GT_STATS_ID_SVM_4K_PAGEFAULT_US,
> +	XE_GT_STATS_ID_SVM_64K_PAGEFAULT_US,
> +	XE_GT_STATS_ID_SVM_2M_PAGEFAULT_US,
> +	XE_GT_STATS_ID_SVM_4K_MIGRATE_COUNT,
> +	XE_GT_STATS_ID_SVM_64K_MIGRATE_COUNT,
> +	XE_GT_STATS_ID_SVM_2M_MIGRATE_COUNT,
> +	XE_GT_STATS_ID_SVM_4K_MIGRATE_US,
> +	XE_GT_STATS_ID_SVM_64K_MIGRATE_US,
> +	XE_GT_STATS_ID_SVM_2M_MIGRATE_US,
> +	XE_GT_STATS_ID_SVM_DEVICE_COPY_US,
> +	XE_GT_STATS_ID_SVM_4K_DEVICE_COPY_US,
> +	XE_GT_STATS_ID_SVM_64K_DEVICE_COPY_US,
> +	XE_GT_STATS_ID_SVM_2M_DEVICE_COPY_US,
> +	XE_GT_STATS_ID_SVM_CPU_COPY_US,
> +	XE_GT_STATS_ID_SVM_4K_CPU_COPY_US,
> +	XE_GT_STATS_ID_SVM_64K_CPU_COPY_US,
> +	XE_GT_STATS_ID_SVM_2M_CPU_COPY_US,
> +	XE_GT_STATS_ID_SVM_DEVICE_COPY_KB,
> +	XE_GT_STATS_ID_SVM_CPU_COPY_KB,
> +	XE_GT_STATS_ID_SVM_4K_GET_PAGES_US,
> +	XE_GT_STATS_ID_SVM_64K_GET_PAGES_US,
> +	XE_GT_STATS_ID_SVM_2M_GET_PAGES_US,
> +	XE_GT_STATS_ID_SVM_4K_BIND_US,
> +	XE_GT_STATS_ID_SVM_64K_BIND_US,
> +	XE_GT_STATS_ID_SVM_2M_BIND_US,
>  	/* must be the last entry */
>  	__XE_GT_STATS_NUM_IDS,
>  };
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index 0596039ef0a1..7ab63e6b77b0 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -6,6 +6,7 @@
>  #include <drm/drm_drv.h>
>  
>  #include "xe_bo.h"
> +#include "xe_exec_queue_types.h"
>  #include "xe_gt_stats.h"
>  #include "xe_gt_tlb_invalidation.h"
>  #include "xe_migrate.h"
> @@ -113,6 +114,11 @@ xe_svm_garbage_collector_add_range(struct xe_vm *vm, struct xe_svm_range *range,
>  		   &vm->svm.garbage_collector.work);
>  }
>  
> +static void xe_svm_tlb_inval_count_stats_incr(struct xe_gt *gt)
> +{
> +	xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_TLB_INVAL_COUNT, 1);
> +}
> +
>  static u8
>  xe_svm_range_notifier_event_begin(struct xe_vm *vm, struct drm_gpusvm_range *r,
>  				  const struct mmu_notifier_range *mmu_range,
> @@ -145,13 +151,19 @@ xe_svm_range_notifier_event_begin(struct xe_vm *vm, struct drm_gpusvm_range *r,
>  	 */
>  	for_each_tile(tile, xe, id)
>  		if (xe_pt_zap_ptes_range(tile, vm, range)) {
> -			tile_mask |= BIT(id);
>  			/*
>  			 * WRITE_ONCE pairs with READ_ONCE in
>  			 * xe_vm_has_valid_gpu_mapping()
>  			 */
>  			WRITE_ONCE(range->tile_invalidated,
>  				   range->tile_invalidated | BIT(id));
> +
> +			if (!(tile_mask & BIT(id))) {
> +				xe_svm_tlb_inval_count_stats_incr(tile->primary_gt);
> +				if (tile->media_gt)
> +					xe_svm_tlb_inval_count_stats_incr(tile->media_gt);
> +				tile_mask |= BIT(id);
> +			}
>  		}
>  
>  	return tile_mask;
> @@ -171,6 +183,24 @@ xe_svm_range_notifier_event_end(struct xe_vm *vm, struct drm_gpusvm_range *r,
>  						   mmu_range);
>  }
>  
> +static s64 xe_svm_stats_ktime_us_delta(ktime_t start)
> +{
> +	return IS_ENABLED(CONFIG_DEBUG_FS) ?
> +		ktime_us_delta(ktime_get(), start) : 0;
> +}
> +
> +static void xe_svm_tlb_inval_us_stats_incr(struct xe_gt *gt, ktime_t start)
> +{
> +	s64 us_delta = xe_svm_stats_ktime_us_delta(start);
> +
> +	xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_TLB_INVAL_US, us_delta);
> +}
> +
> +static ktime_t xe_svm_stats_ktime_get(void)
> +{
> +	return IS_ENABLED(CONFIG_DEBUG_FS) ? ktime_get() : 0;
> +}
> +
>  static void xe_svm_invalidate(struct drm_gpusvm *gpusvm,
>  			      struct drm_gpusvm_notifier *notifier,
>  			      const struct mmu_notifier_range *mmu_range)
> @@ -178,8 +208,10 @@ static void xe_svm_invalidate(struct drm_gpusvm *gpusvm,
>  	struct xe_vm *vm = gpusvm_to_vm(gpusvm);
>  	struct xe_device *xe = vm->xe;
>  	struct drm_gpusvm_range *r, *first;
> +	struct xe_tile *tile;
> +	ktime_t start = xe_svm_stats_ktime_get();
>  	u64 adj_start = mmu_range->start, adj_end = mmu_range->end;
> -	u8 tile_mask = 0;
> +	u8 tile_mask = 0, id;
>  	long err;
>  
>  	xe_svm_assert_in_notifier(vm);
> @@ -232,6 +264,13 @@ static void xe_svm_invalidate(struct drm_gpusvm *gpusvm,
>  	r = first;
>  	drm_gpusvm_for_each_range(r, notifier, adj_start, adj_end)
>  		xe_svm_range_notifier_event_end(vm, r, mmu_range);
> +	for_each_tile(tile, xe, id) {
> +		if (tile_mask & BIT(id)) {
> +			xe_svm_tlb_inval_us_stats_incr(tile->primary_gt, start);
> +			if (tile->media_gt)
> +				xe_svm_tlb_inval_us_stats_incr(tile->media_gt, start);
> +		}
> +	}
>  }
>  
>  static int __xe_svm_garbage_collector(struct xe_vm *vm,
> @@ -385,11 +424,66 @@ enum xe_svm_copy_dir {
>  	XE_SVM_COPY_TO_SRAM,
>  };
>  
> +static void xe_svm_copy_kb_stats_incr(struct xe_gt *gt,
> +				      const enum xe_svm_copy_dir dir,
> +				      int kb)
> +{
> +	if (dir == XE_SVM_COPY_TO_VRAM)
> +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_DEVICE_COPY_KB, kb);
> +	else
> +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_CPU_COPY_KB, kb);

shouldn't we code this like:

	if (dir == XE_SVM_COPY_TO_VRAM)
		id = XE_GT_STATS_ID_SVM_DEVICE_COPY_KB;
	else
		id = XE_GT_STATS_ID_SVM_CPU_COPY_KB;

	xe_gt_stats_incr(gt, id, kb);

to have just one function call? or we rely on the compiler to optimize that?

> +}
> +
> +static void xe_svm_copy_us_stats_incr(struct xe_gt *gt,
> +				      const enum xe_svm_copy_dir dir,
> +				      unsigned long npages,
> +				      ktime_t start)
> +{
> +	s64 us_delta = xe_svm_stats_ktime_us_delta(start);
> +
> +	if (dir == XE_SVM_COPY_TO_VRAM) {
> +		switch (npages) {
> +		case 1:
> +			xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_4K_DEVICE_COPY_US,
> +					 us_delta);
> +			break;
> +		case 16:
> +			xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_64K_DEVICE_COPY_US,
> +					 us_delta);
> +			break;
> +		case 512:
> +			xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_2M_DEVICE_COPY_US,
> +					 us_delta);
> +			break;
> +		}
> +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_DEVICE_COPY_US,
> +				 us_delta);
> +	} else {
> +		switch (npages) {
> +		case 1:
> +			xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_4K_CPU_COPY_US,
> +					 us_delta);
> +			break;
> +		case 16:
> +			xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_64K_CPU_COPY_US,
> +					 us_delta);
> +			break;
> +		case 512:
> +			xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_2M_CPU_COPY_US,
> +					 us_delta);
> +			break;
> +		}
> +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_CPU_COPY_US,
> +				 us_delta);
> +	}
> +}
> +
>  static int xe_svm_copy(struct page **pages,
>  		       struct drm_pagemap_addr *pagemap_addr,
>  		       unsigned long npages, const enum xe_svm_copy_dir dir)
>  {
>  	struct xe_vram_region *vr = NULL;
> +	struct xe_gt *gt = NULL;
>  	struct xe_device *xe;
>  	struct dma_fence *fence = NULL;
>  	unsigned long i;
> @@ -397,6 +491,7 @@ static int xe_svm_copy(struct page **pages,
>  	u64 vram_addr = XE_VRAM_ADDR_INVALID;
>  	int err = 0, pos = 0;
>  	bool sram = dir == XE_SVM_COPY_TO_SRAM;
> +	ktime_t start = xe_svm_stats_ktime_get();
>  
>  	/*
>  	 * This flow is complex: it locates physically contiguous device pages,
> @@ -423,6 +518,7 @@ static int xe_svm_copy(struct page **pages,
>  
>  		if (!vr && spage) {
>  			vr = page_to_vr(spage);
> +			gt = xe_migrate_exec_queue(vr->migrate)->gt;
>  			xe = vr->xe;
>  		}
>  		XE_WARN_ON(spage && page_to_vr(spage) != vr);
> @@ -462,6 +558,9 @@ static int xe_svm_copy(struct page **pages,
>  			int incr = (match && last) ? 1 : 0;
>  
>  			if (vram_addr != XE_VRAM_ADDR_INVALID) {
> +				xe_svm_copy_kb_stats_incr(gt, dir,
> +							  (i - pos + incr) *
> +							  (PAGE_SIZE / SZ_1K));
>  				if (sram) {
>  					vm_dbg(&xe->drm,
>  					       "COPY TO SRAM - 0x%016llx -> 0x%016llx, NPAGES=%ld",
> @@ -500,6 +599,8 @@ static int xe_svm_copy(struct page **pages,
>  
>  			/* Extra mismatched device page, copy it */
>  			if (!match && last && vram_addr != XE_VRAM_ADDR_INVALID) {
> +				xe_svm_copy_kb_stats_incr(gt, dir,
> +							  (PAGE_SIZE / SZ_1K));
>  				if (sram) {
>  					vm_dbg(&xe->drm,
>  					       "COPY TO SRAM - 0x%016llx -> 0x%016llx, NPAGES=%d",
> @@ -533,6 +634,14 @@ static int xe_svm_copy(struct page **pages,
>  		dma_fence_put(fence);
>  	}
>  
> +	/*
> +	 * XXX: We can't derive the GT here (or anywhere in this functions, but
> +	 * compute always uses the primary GT so accumlate stats on the likely
> +	 * GT of the fault.
> +	 */
> +	if (gt)
> +		xe_svm_copy_us_stats_incr(gt, dir, npages, start);
> +
>  	return err;
>  #undef XE_MIGRATE_CHUNK_SIZE
>  #undef XE_VRAM_ADDR_INVALID
> @@ -846,6 +955,57 @@ bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range *range, struct xe_vm
>  	return true;
>  }
>  
> +#define DECL_SVM_RANGE_COUNT_STATS(elem, stat) \
> +static void xe_svm_range_##elem##_count_stats_incr(struct xe_gt *gt, \
> +						   struct xe_svm_range *range) \
> +{ \
> +	switch (xe_svm_range_size(range)) { \
> +	case SZ_4K: \
> +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_4K_##stat##_COUNT, 1); \
> +		break; \
> +	case SZ_64K: \
> +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_64K_##stat##_COUNT, 1); \
> +		break; \
> +	case SZ_2M: \
> +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_2M_##stat##_COUNT, 1); \
> +		break; \
> +	} \
> +} \
> +
> +DECL_SVM_RANGE_COUNT_STATS(fault, PAGEFAULT)
> +DECL_SVM_RANGE_COUNT_STATS(valid_fault, VALID_PAGEFAULT)
> +DECL_SVM_RANGE_COUNT_STATS(migrate, MIGRATE)
> +
> +#define DECL_SVM_RANGE_US_STATS(elem, stat) \
> +static void xe_svm_range_##elem##_us_stats_incr(struct xe_gt *gt, \
> +						struct xe_svm_range *range, \
> +						ktime_t start) \
> +{ \
> +	s64 us_delta = xe_svm_stats_ktime_us_delta(start); \
> +\
> +	switch (xe_svm_range_size(range)) { \
> +	case SZ_4K: \
> +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_4K_##stat##_US, \
> +				 us_delta); \
> +		break; \
> +	case SZ_64K: \
> +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_64K_##stat##_US, \
> +				 us_delta); \
> +		break; \
> +	case SZ_2M: \
> +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_2M_##stat##_US, \
> +				 us_delta); \
> +		break; \
> +	} \
> +} \
> +
> +DECL_SVM_RANGE_US_STATS(migrate, MIGRATE)
> +DECL_SVM_RANGE_US_STATS(get_pages, GET_PAGES)
> +DECL_SVM_RANGE_US_STATS(bind, BIND)
> +DECL_SVM_RANGE_US_STATS(fault, PAGEFAULT)
> +
> +
> +
>  static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>  				     struct xe_gt *gt, u64 fault_addr,
>  				     bool need_vram)
> @@ -867,6 +1027,7 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>  	struct xe_tile *tile = gt_to_tile(gt);
>  	int migrate_try_count = ctx.devmem_only ? 3 : 1;
>  	ktime_t end = 0;
> +	ktime_t start = xe_svm_stats_ktime_get(), bind_start, get_pages_start;
>  	int err;
>  
>  	lockdep_assert_held_write(&vm->lock);
> @@ -885,23 +1046,34 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>  	if (IS_ERR(range))
>  		return PTR_ERR(range);
>  
> -	if (ctx.devmem_only && !range->base.flags.migrate_devmem)
> -		return -EACCES;
> +	xe_svm_range_fault_count_stats_incr(gt, range);
>  
> -	if (xe_svm_range_is_valid(range, tile, ctx.devmem_only))
> -		return 0;
> +	if (ctx.devmem_only && !range->base.flags.migrate_devmem) {
> +		err = -EACCES;
> +		goto out;
> +	}
> +
> +	if (xe_svm_range_is_valid(range, tile, ctx.devmem_only)) {
> +		xe_svm_range_valid_fault_count_stats_incr(gt, range);
> +		range_debug(range, "PAGE FAULT - VALID");
> +		goto out;
> +	}
>  
>  	range_debug(range, "PAGE FAULT");
>  
>  	dpagemap = xe_vma_resolve_pagemap(vma, tile);
>  	if (--migrate_try_count >= 0 &&
>  	    xe_svm_range_needs_migrate_to_vram(range, vma, !!dpagemap || ctx.devmem_only)) {
> +		ktime_t migrate_start = xe_svm_stats_ktime_get();
> +
>  		/* TODO : For multi-device dpagemap will be used to find the
>  		 * remote tile and remote device. Will need to modify
>  		 * xe_svm_alloc_vram to use dpagemap for future multi-device
>  		 * support.
>  		 */
> +		xe_svm_range_migrate_count_stats_incr(gt, range);
>  		err = xe_svm_alloc_vram(tile, range, &ctx);
> +		xe_svm_range_migrate_us_stats_incr(gt, range, migrate_start);
>  		ctx.timeslice_ms <<= 1;	/* Double timeslice if we have to retry */
>  		if (err) {
>  			if (migrate_try_count || !ctx.devmem_only) {
> @@ -918,6 +1090,8 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>  		}
>  	}
>  
> +	get_pages_start = xe_svm_stats_ktime_get();
> +
>  	range_debug(range, "GET PAGES");
>  	err = xe_svm_range_get_pages(vm, range, &ctx);
>  	/* Corner where CPU mappings have changed */
> @@ -937,11 +1111,13 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>  	}
>  	if (err) {
>  		range_debug(range, "PAGE FAULT - FAIL PAGE COLLECT");
> -		goto err_out;
> +		goto out;
>  	}
>  
> +	xe_svm_range_get_pages_us_stats_incr(gt, range, get_pages_start);
>  	range_debug(range, "PAGE FAULT - BIND");
>  
> +	bind_start = xe_svm_stats_ktime_get();
>  retry_bind:
>  	xe_vm_lock(vm, false);
>  	fence = xe_vm_range_rebind(vm, vma, range, BIT(tile->id));
> @@ -955,14 +1131,16 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>  		}
>  		if (xe_vm_validate_should_retry(NULL, err, &end))
>  			goto retry_bind;
> -		goto err_out;
> +		goto out;
>  	}
>  	xe_vm_unlock(vm);
>  
>  	dma_fence_wait(fence, false);
>  	dma_fence_put(fence);
> +	xe_svm_range_bind_us_stats_incr(gt, range, bind_start);
>  
> -err_out:
> +out:
> +	xe_svm_range_fault_us_stats_incr(gt, range, start);
>  
>  	return err;
>  }

