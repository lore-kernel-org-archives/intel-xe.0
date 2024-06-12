Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6E0AC27C53
	for <intel-xe@archiver.kernel.org>; Wed, 12 Jun 2024 20:38:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB38D10E100;
	Wed, 12 Jun 2024 20:38:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jT3aVAIH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BD6010E100
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Jun 2024 20:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718224685; x=1749760685;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KYMwvq2dJ6Aglmx5I2JeIU1twHaTETHsRKxM1uTCZUg=;
 b=jT3aVAIHOBpGPDoqzUkjepcacFwNUxsjdJuTOp8ZSWwuxlubfznmBUso
 Zbbgb7yQh8zbbewjfdjNB8s4wa3/xEsN6Hyicy7Wkci0d3evwQvkxEqqB
 OVSn0LZPSuFD/zFcHrahpvO+g1DUDPAtfX7ojY3e9IxId+wKE8lY6l4ll
 8WKRbpjwZ+cUjx6/URzKlQ4W60yicEfIBlG9yZDK7NwJuu8iYvY/JBm5I
 16cUE54RS+Z65jpTifolGuzzDG5VM3hFcf+JEGNXDUCk5I8xrgy0cvdVU
 tGw41VTaWkSOrankt7B2IHSc11zhXkHyK9te5bxTJpVROMhPRmGxYZorX A==;
X-CSE-ConnectionGUID: cP7PwAGERO2crVbggEyPDw==
X-CSE-MsgGUID: V10zBRXQQkijsBjKFIcr4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="14815096"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="14815096"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 13:38:05 -0700
X-CSE-ConnectionGUID: xaSQP9ypQkCAu4nuxlPeCg==
X-CSE-MsgGUID: Cj23kA56TXCE0Xsf2zjh/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="70704648"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Jun 2024 13:38:05 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 12 Jun 2024 13:38:04 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 12 Jun 2024 13:38:04 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 12 Jun 2024 13:38:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HLvgrJl4jfu2oTZeECXCPqChrZwv6xEyMlCIr4yxsk1iD4uzVfVt0c591WAJYRL/6f1bV/ZSUOohTSe/Lo8KmZufXpVvQKAEdfcjd+JKxEdXUTczIWyfz6KxfOuZNYkjyKOsLpHWVz/A8Cy5/Dno/IdFSudmZ766s/Q8WBcH1kKvaWXyH1ecglegzlnNQ8lpxGES2PZKCpjiSSNAqcU3PdsZFol7E2gH6dXPAT7ObuAedF7euteLhbxvVCKyU3sPLcchMmTvItdqIG8oZ2exM9ONKgK/XO0HvpS05aV7+pv33l3+DUQzWp2Xlb3MGbniU2Wu3dXxgoSCODqFTnNqRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tw2BfsmWfO3eN8rMEhiiceJccNM9HjytIDx4H2qo2WI=;
 b=oRNIer9y4T24oLAgs16BAB+KiNbLgZxv3EFhyRqzVYOaNHqXJ125T0DSKuRU3bil40zxJ5XmZdV83Xwpi81NQ4ujDC1fY0kKsZZ3uWY2gqFkorXL/np6hv7z9xnOwiOX1Mt+oIkzAl4oRMIqfdT8QgDLy6MYPFtrQxTgPLS7Wnn8mUbGGGQVYgIEfNsVVPUVW0aeJoJInkR24MePnjNOTrRXa3hUfwB11NOJfMblxKvj8x9WWyOovYiiRX3U4P5VqMRGSYhhD/BpkfTabh6/ErdBVz9i0SohiuHd8TrLQyWFpzLo3DIYE64+JHoK0FwBJge4jC06rNCbih4iA02EBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by PH7PR11MB6332.namprd11.prod.outlook.com (2603:10b6:510:1fc::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Wed, 12 Jun
 2024 20:38:00 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%4]) with mapi id 15.20.7633.037; Wed, 12 Jun 2024
 20:38:00 +0000
Message-ID: <7b868598-9de3-466f-9ca0-01b5df296a90@intel.com>
Date: Wed, 12 Jun 2024 13:37:58 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe: Use topology to determine page fault queue
 size
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Welty, 
 Brian" <brian.welty@intel.com>
References: <20240610203300.182615-1-stuart.summers@intel.com>
 <20240610203300.182615-2-stuart.summers@intel.com>
 <7e08f192-1b2d-4099-9e0f-c83749496658@intel.com>
 <29065404957bff03d2cf4acf59d772b0562d7020.camel@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <29065404957bff03d2cf4acf59d772b0562d7020.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR02CA0027.namprd02.prod.outlook.com
 (2603:10b6:303:16d::32) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|PH7PR11MB6332:EE_
X-MS-Office365-Filtering-Correlation-Id: 52e1c930-949f-46c9-bfbb-08dc8b1f8cec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230034|376008|1800799018|366010;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z3MwZ0hFVGlCQ202aUhaU3NyOFY4QllHOXFvSmtBbE1JSGNDczN5YmJlUUcy?=
 =?utf-8?B?bGtXanpaWTNGWXBna2tBVTFCcTBGbXY3Wkw4aTJ2WDdDMXhLbm04VzluNGVY?=
 =?utf-8?B?QVp6RFdpalNKY2FBUGk3dE1LaVFHSndYT2JPV0xvaDJKbWhkcFV3dlRNMDJj?=
 =?utf-8?B?SEVCc21jbThsN01nZEp1ZTgvYi9JQTFaemppdVUxZWY2S2N2N1JET2lRSTZW?=
 =?utf-8?B?Z0RPamkrSkd1Q25XN1RHdDRmSkJ0MERMNXlwOTUvUlQwcks5VEl3RkgxVTVq?=
 =?utf-8?B?MWpqeFhHbzdLaC80R3pSem5BaWVHY1BpWWl2bnhSRHlZZHlpKys1dHpmMVNv?=
 =?utf-8?B?Y210R1NLZ1RXNHI4c09WQVVpMnhxZjFsVnp1UEk5RWhDaUFDNFZWT0xUc1Iz?=
 =?utf-8?B?UWV3ODJZK0Fwb0FLNHJlRjI0WjhvZTZKK3VsOFZWNmx0R3Z0THVhU2M2Tm9Z?=
 =?utf-8?B?aUJ6Qy9MYjN2OXRpc29reUt4YmtpS2hZZDZSYnNtSVhIdEZKYmhNZXhSOHRS?=
 =?utf-8?B?K05HaE4rQUNMYlZveC8xaGZXNG9uZDVDK0ZRVm1GNEVOQ0pVWnkxSnhSZEt4?=
 =?utf-8?B?SWZoYmNIMTU5YjdwYnU0R1Y4aG5JTmFrMXpXcU9QR0p5dWdFNEVMUmxtQmlo?=
 =?utf-8?B?MklpS0FpL1plcG9wa0RSRGVNRlJESWI0RFBFdmtKcTk5UG1oaTAwbmd6bGNQ?=
 =?utf-8?B?YkViT24rRVY5UFJPdWVNUGZGWU1PcmZYNG5USkhEQ3VYR0F4Uko4RmFpRU1j?=
 =?utf-8?B?VDdMU2xkUDdkYWFTQzZZeGRJMUZUUTcrQzBraGQ2dUZITUpDOGthcXdzVDhk?=
 =?utf-8?B?L0w4dHR4Q3U4RXZuMUU5d2Mza3FLbGlWekg5VVoyZU5NZUk4SEtVbEUyb01l?=
 =?utf-8?B?YlI5QU15akZJUldMby9ISEM0QUhaajNFbjFKNk41UmMrbEl2dVJzMC9MNlY0?=
 =?utf-8?B?elpsaXNJcGVqejJzc3NLeUJOTEE3bmhvZHA2cXhYZzZDSHhmYzN3NDhyODJu?=
 =?utf-8?B?Ti81dDJuMmpLQ3pMNnMvMS9lYU5Od2szT1dSRU01RXhGQVpnL25pSTUvUHB6?=
 =?utf-8?B?NGRuUThsTWFtejNuVlUwckZuQ2FiclBXWUFERjJHQnA0bXJoZWlBZEdKTEt3?=
 =?utf-8?B?WWxEbVkyUXB4cVlNZXdrSy8zbVNZSzU3UTFteGFlcUdqY29PamdFMG1lTmZu?=
 =?utf-8?B?eGJ0cGMzVDB2aEFFT1R1aHlSSVNqYWc0Mk9wZ2RJSjQyVEV1eDNUU0hpeS9r?=
 =?utf-8?B?Z3doUXlVQThyYmpSL1FLOUNNZTdPL2dMYWt4QUFpbEpuQzB0U1VLRVlMUVda?=
 =?utf-8?B?MXR2czZuMU4vRW5oajkvcGUrUWZpWktjMzlIUHkzQlRXaFAzWmFyaGhDa0tM?=
 =?utf-8?B?ZnlDNkRiTUVGeThJRGh0NGlZRUdXVHBwRG5UblNmb1h4MTlWWlBueGFrc3lz?=
 =?utf-8?B?VzNSbmREWUZWbkdoY1hPc3dNK0FGRGs5dDJsZVNZM2lRTEFCU3ZrVzBhYjEr?=
 =?utf-8?B?RlFpT2pTSzU2OUdLdElJQ2h5cWYvYVV4UTBwWUVQelE3bWV0MkJMalpkUEdq?=
 =?utf-8?B?SDQ0RHBTRVNJbG9CSnJVQ1ZqaEswUmNnSmd1ZlEzQ0pJVUZRQndhWTJFQ3p4?=
 =?utf-8?B?YUUxbytFUkY3WXY0cUUwUVRkT2NXOFZBQzBBREQvYStIS3gxN1NsaTFCRHo1?=
 =?utf-8?B?U2pqWXdYUDBFd0J2T1JZZ253T2ZZbzhPbUhaeld3dE9WTnAySUo1UUt1L2FZ?=
 =?utf-8?Q?ELB6FUvM/dq6FI+GO8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230034)(376008)(1800799018)(366010); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q1kyZkJlQ0RucE9lWllBdW9ac1FaVUtVQVNTZ2NyenJTdjR0aTc2VWY3ZXIz?=
 =?utf-8?B?TnNXV3YyV0JFOTFwMFZ4S2Vad0htWVMyb2djK2lzZ0hzU2l1S0RyVGYyRnEw?=
 =?utf-8?B?ZXFFalRva0JFYi9HZEdvUXhORVhaOVI3bkZIbXdOQkJDRTc4VHNEMXU3REpl?=
 =?utf-8?B?eCtFdDBXU1pyMTYzbE9GOHhBOVVYTW5zUWtnVU1YZzhKNzlNM2F4ZFFQOXVh?=
 =?utf-8?B?bkxoKzY1MGZzdkM4TzFiSWdocWdBUnRRcGlvbmM5KzZNbGYvdEhXS3huMCtU?=
 =?utf-8?B?K3QxZjNZOG9zYjZGZ1hlQWYyTnBNUnl4bW9USHNmYmpYVGtscFpYbGNDNW45?=
 =?utf-8?B?cmI4L1pMS1dpeU1YZ2Q1TzFkclhaOE95ZDFYWld1dlo3ektueFF4eFFHWXpO?=
 =?utf-8?B?YWZwbFQrYjBqekE5QnB6cG5ZN1RtaFBEQTd2a1U4ZkVubDJLTjcvQnh0TG1P?=
 =?utf-8?B?S2R2UUMvcVY1dzN4aTljTzgrVENsVkdBMGJsK2pKUkpTcm83MXFzOXRaV2ZI?=
 =?utf-8?B?Qi8zU0VsM0d5QjEvTDkwckJtZG5aMVQxUzRFdFEwU3BKZnN3bWZ0eW43NnhK?=
 =?utf-8?B?TXcycDlIcGdMUFRBR3JsdWZKd3FiTWM1ZVEwL3Z0WEhGVXdydklWTHVTeGov?=
 =?utf-8?B?NW03bi9yc3NKLyt0VTIwbXkxQUVmck9vMkNtU1ZnVjlTaHQ5dmRJb2hzZXMx?=
 =?utf-8?B?bUwvdTMrcmIwakNpOTYyc203R2xLbzVocmRuN1pLNUJKZUJOR1MrTjVZWVNn?=
 =?utf-8?B?RXpXODkwaDRaR2RwVjBTMUliYUhRQTM3SkVPNjZwVHFvTFY5d1JjcnJ5YjdQ?=
 =?utf-8?B?U3k5T0JUMWQyM2h4TDhIS2NDdlM2aWFOMWY0WWpiL1RCYTBRK2ZjMnlpVFVi?=
 =?utf-8?B?UVUzUExCZ2VDQjlEcVhVdzhmK1hQdyt1eTdrOW1OTG1JOWZDRHhqOU4vQTZD?=
 =?utf-8?B?MDhUdzVCZERDd0VpVkFNdlN3NXIyWmlLTlJ4eTBvQlVUYXBrcmR5bXQ2UmZ1?=
 =?utf-8?B?ZnVuMFZGRXRWTHRZMi81NXVsUm9tbDFIMXI3VFpIdVFRY1hMVXA5V2xyRXVi?=
 =?utf-8?B?bForcDNWWi9JSmNDelpDSXdYYm85c2RreWEzVmhjMTRNeTkyNU8xMlI1ak1Y?=
 =?utf-8?B?dkdYaG1NdUdLVHBuTXlMSzNEQkQwWVVGZjQybVBreXhNTXhYdWhTUHpldmQ4?=
 =?utf-8?B?UlJQdWQ0ekxTeVlCQnZIc1c2bzY5R1dEOHp2cFY3aGE4elM3OHpRZmdFMEpG?=
 =?utf-8?B?bHFnaEMvdjhoWXQvMWVmS0xoaFRlMkdjamlXSmcvMS9wZmJlV3haN0lXN0hz?=
 =?utf-8?B?U3ZCK0hFdDJMZmxHSUkvSmhTRWhDekpyTDR4UWxZNXQvUnNwQWs5SEdZNmtL?=
 =?utf-8?B?MXdEMmZGOGxoREhHblpaZStIbEVTOFRIQzAzcUhyV0d4MlR5Q2VNRnRWd01V?=
 =?utf-8?B?czJCWTluYWZsQmtTTkJTK1hMS0NwcnFYU2pld2JmeEZ3Snk2aXBSYlVHWDJY?=
 =?utf-8?B?aEdNVzRBQ1VsNm94NHo4R1VSRjQ1Vm16bHVkWHFacGVHdXNTRHNjVjE4b1By?=
 =?utf-8?B?TGRXSGduL2pNRGNoR05GWFAraDFHQzZ3QVU0QW4wOUlJV2d3b0hMU1JPUlEx?=
 =?utf-8?B?dlk2c0hSNkFMbytyaFdlQk1MZDNabThFZm8zTk5HV2luRWNTaG5nUStHMC9j?=
 =?utf-8?B?MXhodUhsWUgrMDJHU0Nha0MyNEd1dnpYdi9hSGFwSENNSGZab1V3cVV3eWw2?=
 =?utf-8?B?eEdxNU5uQWlzTzQ4a0ZhaUJSRVA3dEtQMVdiWUV2SDh6aytTUjluZXArRnlR?=
 =?utf-8?B?N25rRWlXem1uRG1KTTJ3VnFBWXR3MU9tbVhYUG9NQVNWNUFiSTNDMlJ4VFI1?=
 =?utf-8?B?QnNLc20zVlBrQmF0RTJDUXZML2lKS3BCbStHaHpTdGRiWks4d2JBc3FRZmx3?=
 =?utf-8?B?U3dHeENXR3JzZlZIa1V4SXdjWUFVeDZJNDZMVDNIcllUbms3SmduUWc3MXhP?=
 =?utf-8?B?UVJuVUhDeEw1RTFwejNJVnN3SElPN1VsRTFFd1diSCsxUmhRalJTOWJWRDB5?=
 =?utf-8?B?MGV0Q0VuUm5BTDNtWVFiSFE4a1JyNlF1a2xBOUpwTmN1VGY2SHVUaEw1aHFN?=
 =?utf-8?B?OFArVDNHY0x2ZkowWVY2ZndERzB5TlJBQlpDWm5YS0tWY283UThYVHR4K3Nk?=
 =?utf-8?B?Y0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 52e1c930-949f-46c9-bfbb-08dc8b1f8cec
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2024 20:38:00.6023 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zIaj2aU88jlYMdLC2TWNMad7VV936cBXyeNL6LGxNgNt0PUxIYgt6IIIMjngJyY8IRda14DFYcVhmPGencd2O7JviZlo3Hv1ic7+lOi39r0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6332
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

On 6/12/2024 07:48, Summers, Stuart wrote:
> On Tue, 2024-06-11 at 17:58 -0700, John Harrison wrote:
>> On 6/10/2024 13:33, Stuart Summers wrote:
>>> Currently the page fault queue size is hard coded. However
>>> the hardware supports faulting for each EU and each CS.
>>> For some applications running on hardware with a large
>>> number of EUs and CSs, this can result in an overflow of
>>> the page fault queue.
>>>
>>> Add a small calculation to determine the page fault queue
>>> size based on the number of EUs and CSs in the platform as
>>> detmined by fuses.
>>>
>>> Signed-off-by: Stuart Summers <stuart.summers@intel.com>
>>> ---
>>>    drivers/gpu/drm/xe/xe_gt_pagefault.c | 49 +++++++++++++++++++++--
>>> -----
>>>    drivers/gpu/drm/xe/xe_gt_types.h     |  4 +--
>>>    2 files changed, 39 insertions(+), 14 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c
>>> b/drivers/gpu/drm/xe/xe_gt_pagefault.c
>>> index 3858c8e0b707..5565732e79e9 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
>>> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
>>> @@ -287,7 +287,7 @@ static bool get_pagefault(struct pf_queue
>>> *pf_queue, struct pagefault *pf)
>>>                          PFD_VIRTUAL_ADDR_LO_SHIFT;
>>>    
>>>                  pf_queue->tail = (pf_queue->tail + PF_MSG_LEN_DW) %
>>> -                       PF_QUEUE_NUM_DW;
>>> +                       pf_queue->pf_queue_num_dw;
>>>                  ret = true;
>>>          }
>>>          spin_unlock_irq(&pf_queue->lock);
>>> @@ -299,7 +299,8 @@ static bool pf_queue_full(struct pf_queue
>>> *pf_queue)
>>>    {
>>>          lockdep_assert_held(&pf_queue->lock);
>>>    
>>> -       return CIRC_SPACE(pf_queue->head, pf_queue->tail,
>>> PF_QUEUE_NUM_DW) <=
>>> +       return CIRC_SPACE(pf_queue->head, pf_queue->tail,
>>> +                         pf_queue->pf_queue_num_dw) <=
>>>                  PF_MSG_LEN_DW;
>>>    }
>>>    
>>> @@ -312,11 +313,6 @@ int xe_guc_pagefault_handler(struct xe_guc
>>> *guc, u32 *msg, u32 len)
>>>          u32 asid;
>>>          bool full;
>>>    
>>> -       /*
>>> -        * The below logic doesn't work unless PF_QUEUE_NUM_DW %
>>> PF_MSG_LEN_DW == 0
>>> -        */
>>> -       BUILD_BUG_ON(PF_QUEUE_NUM_DW % PF_MSG_LEN_DW);
>>> -
>>>          if (unlikely(len != PF_MSG_LEN_DW))
>>>                  return -EPROTO;
>>>    
>>> @@ -327,7 +323,8 @@ int xe_guc_pagefault_handler(struct xe_guc
>>> *guc, u32 *msg, u32 len)
>>>          full = pf_queue_full(pf_queue);
>>>          if (!full) {
>>>                  memcpy(pf_queue->data + pf_queue->head, msg, len *
>>> sizeof(u32));
>>> -               pf_queue->head = (pf_queue->head + len) %
>>> PF_QUEUE_NUM_DW;
>>> +               pf_queue->head = (pf_queue->head + len) %
>>> +                       pf_queue->pf_queue_num_dw;
>>>                  queue_work(gt->usm.pf_wq, &pf_queue->worker);
>>>          } else {
>>>                  drm_warn(&xe->drm, "PF Queue full, shouldn't be
>>> possible");
>>> @@ -382,18 +379,42 @@ static void pf_queue_work_func(struct
>>> work_struct *w)
>>>    
>>>    static void acc_queue_work_func(struct work_struct *w);
>>>    
>>> +static int xe_alloc_pf_queue(struct xe_gt *gt, struct pf_queue
>>> *pf_queue)
>>> +{
>>> +       xe_dss_mask_t all_dss;
>>> +       int num_dss, num_eus;
>>> +
>>> +       bitmap_or(all_dss, gt->fuse_topo.g_dss_mask, gt-
>>>> fuse_topo.c_dss_mask,
>>> +                 XE_MAX_DSS_FUSE_BITS);
>>> +
>>> +       num_dss = bitmap_weight(all_dss, XE_MAX_DSS_FUSE_BITS);
>>> +       num_eus = bitmap_weight(gt->fuse_topo.eu_mask_per_dss,
>>> +                               XE_MAX_EU_FUSE_BITS) * num_dss;
>>> +
>>> +       /* user can issue separate page faults per EU and per CS */
>>> +       pf_queue->pf_queue_num_dw =
>>> +               ALIGN(num_eus + XE_NUM_HW_ENGINES, PF_MSG_LEN_DW);
>> Do you mean ALIGN here? This is queue size in dwords according to the
>> name so isn't it just max_queue_entries * entry_size_in_dwords? I.e.
>> num_dw = (num_eus + num_engines) * msg_len_dw. ALIGN is just going to
>> round up not multiply up.
> Thanks John. No actually this variable is the number of dwords in the
> queue, not the size in dwords. The alignment is to adhere to some
> assumptions made elsewhere in the pagefault queue handling.
That doesn't make sense. You mean the current queue content size rather 
than the total size? If not, then how is 'the number of dwords in the 
queue' not equal to the 'size in dwords'? And if it is the current count 
then it should be initialised to zero not to some confused max.

Either way, num_eus + num_engines is the maximum number of page faults. 
I.e. the maximum number of *items* in the queue. That number has no 
direct connection to dwords. You have to multiple by the dword size of 
each item to get a dword count. And given that the name is _dw and you 
say it must be aligned to a dword size, it does rather seem like it 
should be the dword count.

E.g. 10 EUs and 3 engines would be a max queue depth of 13. If it is 4 
dwords per queue entry then rounding to 16 does you nothing. That is 
only 4 actual entries before it overflows. You need a queue size of 52 
dwords to fit all 13 entries. And if this is really meant to just be 13, 
i.e. the max item count, then the name should be pf_queue_num not 
pf_queue_num_dw and any code which is assuming a multiple of 4 is broken 
code that needs to be fixed because it is working in the wrong units.

John.

>
> Thanks,
> Stuart
>
>> John.
>>
>>> +
>>> +       pf_queue->gt = gt;
>>> +       pf_queue->data = kzalloc(pf_queue->pf_queue_num_dw,
>>> GFP_KERNEL);
>>> +       spin_lock_init(&pf_queue->lock);
>>> +       INIT_WORK(&pf_queue->worker, pf_queue_work_func);
>>> +
>>> +       return 0;
>>> +}
>>> +
>>>    int xe_gt_pagefault_init(struct xe_gt *gt)
>>>    {
>>>          struct xe_device *xe = gt_to_xe(gt);
>>> -       int i;
>>> +       int i, ret = 0;
>>>    
>>>          if (!xe->info.has_usm)
>>>                  return 0;
>>>    
>>>          for (i = 0; i < NUM_PF_QUEUE; ++i) {
>>> -               gt->usm.pf_queue[i].gt = gt;
>>> -               spin_lock_init(&gt->usm.pf_queue[i].lock);
>>> -               INIT_WORK(&gt->usm.pf_queue[i].worker,
>>> pf_queue_work_func);
>>> +               ret = xe_alloc_pf_queue(gt, &gt->usm.pf_queue[i]);
>>> +               if (ret)
>>> +                       return ret;
>>>          }
>>>          for (i = 0; i < NUM_ACC_QUEUE; ++i) {
>>>                  gt->usm.acc_queue[i].gt = gt;
>>> @@ -418,12 +439,16 @@ int xe_gt_pagefault_init(struct xe_gt *gt)
>>>    void xe_gt_pagefault_fini(struct xe_gt *gt)
>>>    {
>>>          struct xe_device *xe = gt_to_xe(gt);
>>> +       int i;
>>>    
>>>          if (!xe->info.has_usm)
>>>                  return;
>>>    
>>>          destroy_workqueue(gt->usm.acc_wq);
>>>          destroy_workqueue(gt->usm.pf_wq);
>>> +
>>> +       for (i = 0; i < NUM_PF_QUEUE; ++i)
>>> +               kfree(gt->usm.pf_queue[i].data);
>>>    }
>>>    
>>>    void xe_gt_pagefault_reset(struct xe_gt *gt)
>>> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h
>>> b/drivers/gpu/drm/xe/xe_gt_types.h
>>> index 10a9a9529377..c40b9c1b5fec 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
>>> @@ -232,9 +232,9 @@ struct xe_gt {
>>>                  struct pf_queue {
>>>                          /** @usm.pf_queue.gt: back pointer to GT */
>>>                          struct xe_gt *gt;
>>> -#define PF_QUEUE_NUM_DW        128
>>>                          /** @usm.pf_queue.data: data in the page
>>> fault queue */
>>> -                       u32 data[PF_QUEUE_NUM_DW];
>>> +                       u32 *data;
>>> +                       u32 pf_queue_num_dw;
>>>                          /**
>>>                           * @usm.pf_queue.tail: tail pointer in DWs
>>> for page fault queue,
>>>                           * moved by worker which processes faults
>>> (consumer).

