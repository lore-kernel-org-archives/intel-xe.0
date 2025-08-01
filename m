Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA4C2C87FD2
	for <intel-xe@archiver.kernel.org>; Fri,  1 Aug 2025 00:33:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 557B210E089;
	Fri,  1 Aug 2025 00:33:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TppUnvK1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B90A10E089
 for <Intel-Xe@lists.freedesktop.org>; Fri,  1 Aug 2025 00:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754008436; x=1785544436;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Aue6vLvi0E7tB9njMIWmvY6De0nEJVHaVq4cgxSC+XQ=;
 b=TppUnvK1LWO6hgWeW5UQA8j7fu3+4UOvZU2cdlR/5Y+J0uJ1MjuqPhQO
 KqUBuhLbShiDEnrna6QzyDWTn5yvoYmb9AFheyjmGFCANeO3KHSZTvLIo
 /wvnj+dhib7TL0XDzwEec2Ri0vlJ1liXvRuLYifYj3XMNUZwbqEzKIX/L
 0yf1GnM9nzCAJHPVr/ZncAilC6hhDGD2nYrLrEu47P6MgMzFOXnZg0csO
 TC97EiagrmdVRENoAO0+X8VSDFbsQgBzXkaAiSQNw89rx6NMY+v2b/50i
 UIX2SVRg1fo8pqFnJ7ElQUXXGblQMkBB+wogtFiL/7UBNXDNAi/4Cnj3N g==;
X-CSE-ConnectionGUID: JIhakVwTTLye/1dO+Fkqaw==
X-CSE-MsgGUID: yCn2Zu+gSbiPM7cd/ig5wA==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="56046529"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="56046529"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 17:33:55 -0700
X-CSE-ConnectionGUID: ye866qlcRnSvutIH3sJyWQ==
X-CSE-MsgGUID: 3fBKRqAvRgavtJGSEMn4Mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="167885472"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 17:33:55 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 31 Jul 2025 17:33:54 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Thu, 31 Jul 2025 17:33:54 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.66)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 31 Jul 2025 17:33:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RxAO8MuvsmluoeSnXcvoShPr0LWQh0nEYphgwq24bpaFd43a+OInycYJRkl5zTDogj2xa7VBlyasJBzCLiBQ+QkhbToFJTCTKgMvobQIofQA14gozU8iyfX4ioFq6syPIiQ8TRHb84NNnW41Cn7nOPdhtRjtfp6X5Sjg50d8lbLKz+qHYwObE6vxLoAKLmwdHTHOOd5Pob7FPEWVXuxxXKjBJxm0uf2YHCWjfOt3f9QHacc/Cb2RH2FbSNGV6Nh1yx2jkncJaQk2EWBnbohNj41yVDOFA74aomhoWLWTQPbJ7hNMYrxSfZ7hir+KA2a3aWOFwel0zWjifJbDm3fFRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dMcG2HBFCWhD+cEDHnLFIxWyNm+XcVpiRt8LQvWH2qs=;
 b=ayaps//rksQITAPWo3fpRMlUtM7StMuTa1/ts27JPjA6Ifc3IWObPdC53UBlVB83ta086i7RLPLFqjaGDrKGZdPzZAZe2IKD8giP627AXB9KWshBD/FLxv0J9hmZ2yeVnf80a2f1t8GApoTfvEFWmROs6TuI+D/nb5IwHaOMWXztqNJylCpNTdcSFu6rlimilrZz1av8j2m3fP8yD1oXUlSifol8t+7FQoiHO3OJ4wUKjswtIawmUX+OUTzYOw7jkspGZO9uWNq7sE3Ba+jKh9e03XkHsd16Hjh8VghFMSAXofBlxSaiCwLXBurYhks+9fzXGm2Xf9ucgT8N5cuX1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by DM4PR11MB5970.namprd11.prod.outlook.com (2603:10b6:8:5d::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8964.27; Fri, 1 Aug 2025 00:33:11 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%5]) with mapi id 15.20.8989.010; Fri, 1 Aug 2025
 00:33:11 +0000
Message-ID: <b5a9ee94-63fa-4751-9663-aa0671d5dda6@intel.com>
Date: Thu, 31 Jul 2025 17:33:10 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] drm/xe/guc: Add test for G2G communications
To: <John.C.Harrison@Intel.com>, <Intel-Xe@Lists.FreeDesktop.Org>
References: <20250725002111.3906267-1-John.C.Harrison@Intel.com>
 <20250725002111.3906267-5-John.C.Harrison@Intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20250725002111.3906267-5-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR06CA0020.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::33) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|DM4PR11MB5970:EE_
X-MS-Office365-Filtering-Correlation-Id: 73ab022c-2d98-4901-416f-08ddd092fec0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aGpGYXovMmswbHR2VFRiWG5nTEQ2bWVTYjlOSXU1eE14bUpmNnNzQjk0UkJM?=
 =?utf-8?B?NEVjcnZoR244U2Eva3cyU0xYMXNMaS83SVp3WW9rU2FEN0pDOHNtQ3ZXNTVH?=
 =?utf-8?B?SkhqUkk5T095cWZSTGtjWWxrMGo3bFhUSHBCYVczaDJpUzVKLzhxaDdwbVZ2?=
 =?utf-8?B?MUt3YzZKNW55emdya1BZekxNVzJiaUMyTTNDaDR5V2JJWFBWYk5VTTdhcjZE?=
 =?utf-8?B?d2dFbFphd014WmprUGJ2MHMvSnJEVnpmeU1yVjlWV1lNc0UvMll1bnA2MUY3?=
 =?utf-8?B?dVNKYTFYc0VqaFQ5eU5DdnNlYUhpOVhxT1B0T0JHU2ZERlFybVloblg0ZHlT?=
 =?utf-8?B?dkhENlkvVnpZQ3phaTMwdnBqQWVwUEJ0bVdzNkRvWWwyZm4wME8zOVA5MzI4?=
 =?utf-8?B?cU04bWhFRndyZG5NdzZQRCtJU1hKcTdRTnRiRittY0ZGeTFma0dVUlVPc2lJ?=
 =?utf-8?B?LzdnOUJOV0lUeHBBdUpWcFRObmp6UW1VMFBvSVNTM2NKMk9KdnI4QkhybTY3?=
 =?utf-8?B?TnoxL2dPd3FSMFNVTnhmYWc4VWtzdkpFL0ZyZWplRGdtd3FZZmk0dGpWcWFw?=
 =?utf-8?B?eVN1ZUpDbG1xYytTNzFNN0YrenlINmNOOVFOcHJFNTR1M1FoamlZWDRldStG?=
 =?utf-8?B?S3dNbjVEMmlIMm1jRk1rWFpSczVBRnliL1Q3ZUs3bGFNYXZQQmdlMnBRN09U?=
 =?utf-8?B?RzVHUkczS1d6NEhlWjNYam5lZlQyc2RjdFJjTnNMSnQva0lrWjdGcG41WURn?=
 =?utf-8?B?SHFLdW96VmJMUE5CellHb2U4Y2NYRThkQWdmdDJWdW56MG9qMEY1U29MTngw?=
 =?utf-8?B?V0pFNWtPaFI3QkVzc2pVNGQwTWFUbWdQd1NxRzd4ajQwSzQ3OVhCRnpuNHVq?=
 =?utf-8?B?YzcrQ3VYWFhFRnZsT1dBZXJ0bTFjNUdUQ2x3L3NjRXRwZHV5TEE0eUVvVmZj?=
 =?utf-8?B?dlRxdG5aR0RudS94VUNYU05FdDJENkFyTUZXMk9OZTA0aDZyUVVScGt6YWRS?=
 =?utf-8?B?L0xTUlo3RThjT2N3WWVzcjFOVG5QN0NFTW8rc2xGUzRwRWlRSzVtVWNDTDFp?=
 =?utf-8?B?ZHpqUE1VZzRFVUYwbGMvdXRvajc3MDhqL09hSTlzN0dmWlBmUjEvb1QrMEp2?=
 =?utf-8?B?cjVIZHRiVUgyUDVoS2JUS2tOODdBQ3lVNGdvUkpvZ1ptT0RyOElWNzR6K1BY?=
 =?utf-8?B?OXZzZDZnTmNUMDhqZ0ttenRPTmwrb0x0eG1HYlpwaXZYQ0VEbnExRDB0TlhD?=
 =?utf-8?B?ZDJyVFM4aEJDRUNWWThLQzgvNDg5bTN6VHNEdUZGM1N0WHpndFZoWGZML2Nm?=
 =?utf-8?B?OHB2K0lSTnV1YUx6b1UwREoyc3NsWGowYW9KR3pzcFMwdks2WTVuRnlNVUlW?=
 =?utf-8?B?eGVsMnpySGdRZGlIYTEyNkdxWnFuSWZ5a214U0JlY1djNnZRaDFwNjhtaGlx?=
 =?utf-8?B?MU9VVDJpSzIvZlV5clRMT3VnVDdrSEFHTGY5ZXovd011K2g2L2RCMTE5Y3dt?=
 =?utf-8?B?czZQamJRRmdobWlMSExHeVNCckE2K0NNMzZHOFFCbVBpUTJIOXZHajJBcWJR?=
 =?utf-8?B?VjFHSU56Si84OVAxejIwbVp6M2hoZFFoY2UxakxQRmtGSllGTkNsUkJtV0Zq?=
 =?utf-8?B?Q1RqTWgrZHNiVm1sbWs5RGllQWJvY0pRWFRycVNmQXpqTUlyOVcvd2tOeTVx?=
 =?utf-8?B?ZmtNZzhPSWI2a2ZVSVR2eUIrSVg5dmp4VVRZTHFncitrVjhSeFBmZkE5Qkd6?=
 =?utf-8?B?bGVFTWd3YWgzWWc1eHZoZXFucndVTHNTdGlUSUNWN1I5SXNya2lOVG00U1BY?=
 =?utf-8?B?Qnd4RDgrVUZhbTJzY2ZsQVE0OWhDTm1zSnNTSm9vZURkNU9oV1FMOWEraG00?=
 =?utf-8?B?Y2xEck1LbzR1bGtOOFhjMnl5SFdoa1ZwMnJhVHFLb3hmYXdDRXVUS0NPRklt?=
 =?utf-8?Q?zKRqTvmA2n0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TEN2VDM0U2NyUW9LNnZYUFl1b0hURDJEKzY1bzgrTkJMa3M2Tk5KMlRHSmlh?=
 =?utf-8?B?RlhIdTBRYU5yMjdJL1krbzBEczVaNnFCNlNyaXBTRmJxQXBnMVFpcWh0dDl4?=
 =?utf-8?B?V1JISVBLVnBBVDJiSkt1RnlXSklxakZyVSt2SXB2YnlDTWVpWDF4TS9RUlVw?=
 =?utf-8?B?dUZFT2JwZ1pQRzNFSkpXWDE2L002bGNrNjJwV2dNYXliMkx4cU1WbnNOS1Ru?=
 =?utf-8?B?ZUlNSGVRMkliQ2VCWGxldGw5Z3Vzc2JOQzVCUlFNbWtvcXROazdPTUlzTjR3?=
 =?utf-8?B?SjBmYkhpTTN0M1o1bDliVUIzVnlzOFh6d09mSWpVQzFZSy8rakViM2tod3pM?=
 =?utf-8?B?allmWlBMelViVTl2eDJqek10aHJZdWUvWDlwWGZZVkNDTlZpVWk0ZHF4bnhE?=
 =?utf-8?B?SDdmUzhpUkM0UnBjbmRHN2NDN2haNzQxSWxBdkdXbmF4WjgyT3RHa3VRVjhO?=
 =?utf-8?B?emNtZmttS3hFU1lRZzJhRXNXN2lQcHBhRnBUaG5NNUhLbHBvUWlwSmZTOCs0?=
 =?utf-8?B?R3ByWG9kNVhXU3UzalA3WWRVMUQ1Zk1NeUIwZC9USmlFVW9qd2d4S2t1MTBR?=
 =?utf-8?B?a2ZlR2tKR05iYVNUUHhpN2Y4M0xMNkdXY2dqTVVURmhFOU5BSkQvNzlqZURs?=
 =?utf-8?B?NE5sQThPRkZBTUZKbU5aV25FT2RpSkRnUkk1WVVoS1V1SzlIQjQxSmFKSkds?=
 =?utf-8?B?c0Y5KzQzTkhzcis1VG1sK1hWRStVT2FBV3pMZVdrdGQ0SThqZ1RxbUw5cVcy?=
 =?utf-8?B?RCtuMDZzTkhsUzZPVHhndFVDWHlabTY5dW0zYTE1YVZNT3F2a3VFL3VLeGpx?=
 =?utf-8?B?cWU4MUUxR0hJaHQ4WE1ZcSt0cCtJU0VaTDNSamtBT1BtWjd1anZlTmlaMU1E?=
 =?utf-8?B?d2NoQ0JVdXQ4T0FoM2gwcFBFOWN6bGpwNFhpZ1RxM1BxRVRSb0VHVFd6Z0s1?=
 =?utf-8?B?eUxIYmNLeWN4SndJQ1JvWUdzU2trQ0JhRy9RYWVOemhrd3ZvUlhmNldUeE05?=
 =?utf-8?B?YlI0ZytRaG1JWFpqVFpHQmE1dVBYWVFOWnh4QmxIbEh4VXgycmJpMTEyS3lk?=
 =?utf-8?B?Y1p1dGlHU3ZWN3R2SGpXM24yZlpLQmkxZ0ZZWlZEd2VGRENrc2ZTczgvMmIv?=
 =?utf-8?B?UWowdEpuTEdwYUJEbS9xVnptRnpWWldZSjFOSEVZUC9iMlE3cHd6WGJ2dEdp?=
 =?utf-8?B?bTFCdER4L1VTUEZ3KzE3WE8vTWJUS3Flb2h4S0FveldsckZIRjQyV2J2Y2Rp?=
 =?utf-8?B?dlFPMGUrYWJaQWJoYjJkeHYxQ3hhTVhyNTBYMmFCMkJPNFpZOXFhVHpzTzc5?=
 =?utf-8?B?TWg5UGxLZklBcTlBTitZaEpRL1VMaVJ5U2JmR3ppQURkR2Z4N2R4dXA4YzRv?=
 =?utf-8?B?bXN4dFZhUkFYckhvVklKcmxxSkFURGVoVGRDakVDaTlObFMzYzVOQWxOVmFR?=
 =?utf-8?B?QW9rOEwzOSsveEJyN2cyWXNIMnBZUkRlYzlHa21sQUlNWDdheFBJU2FNZ3dn?=
 =?utf-8?B?UTEwZ21KTjRKaVpheUFJeXJ3eHBzNVhlblpzNXlRWENJbE45MFlyWTZPcXVa?=
 =?utf-8?B?Unh1YXk2ejV3KzhoMi9CVE5ucXd0T0FoUWZpS0tMbzBnOEphNENYWkpFYkEy?=
 =?utf-8?B?cTNsekZuWWttaFM5bFVpZXR1VmlLODd3eTVqVThuei8raFFBTEE0ckZpNndJ?=
 =?utf-8?B?TThVbUtxa1Q4SDNlZ0JGSWtxNjFrYTVqODhzUldzNFRMQzZnWjRMbXRvbURa?=
 =?utf-8?B?dlNndGNQbmJhbDFPUmI1WmJWNkE2bW9iL1JPanFFdXRxMUxYV0xOWDRab29F?=
 =?utf-8?B?Y1phZHNTdWpZWmc0eTF1UHM4VEEzNVNiT25UUndUamRjVFhwZXk0dWUvN0ho?=
 =?utf-8?B?ZW9mcHpDT2JKK3pFUnNXNFNheEI5V3lMWVF5bHloNlVRTmsrbkt4cGdDbGRu?=
 =?utf-8?B?RXFuTmw0a3dOQzE0dmY1V2dBd3pzVEFkY2RCREFSeWEvVlY0djRQTk45K29B?=
 =?utf-8?B?bHV1UE8rYS93UFVjakRlSGxCeEZVWnp3akVXZlpzNTZjbERJMm5TVkRZd1RW?=
 =?utf-8?B?WjJqS25ZWVNDb3BoQ3h3enRVTGpQVEJnYVZoVDkzL1VPeG5VNmFtVElwOCt6?=
 =?utf-8?B?RGh2NlNyTlM3NGVHZ3pVSzBCcU9jRXUyUkVNV3ZydHFiWXUyYkI4ZXJ2SWJY?=
 =?utf-8?Q?Y+81I6kOPdsr+3wMjIWHzM0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 73ab022c-2d98-4901-416f-08ddd092fec0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2025 00:33:11.5583 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wTg7NQdTS7m9DWwJ0Zx2NrYn56ZtyHv4lS0f1kGFY0IN37UCRqf0V4WSpZZeckPbvPjxB/sMGgEEPC2UbP4cvi1P24H3ahKFyQfN8eTag7A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5970
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



On 7/24/2025 5:21 PM, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
>
> Add a test for sending messages from every GuC to every other GuC to
> test G2G communications.
>
> Note that, being a debug only feature, the test interface only exists
> in pre-production builds of the GuC firmware.
>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>   drivers/gpu/drm/xe/abi/guc_actions_abi.h    |   2 +
>   drivers/gpu/drm/xe/tests/xe_guc_g2g_test.c  | 759 ++++++++++++++++++++
>   drivers/gpu/drm/xe/tests/xe_live_test_mod.c |   2 +
>   drivers/gpu/drm/xe/xe_device_types.h        |   7 +
>   drivers/gpu/drm/xe/xe_guc.c                 |   4 +
>   drivers/gpu/drm/xe/xe_guc.h                 |   4 +
>   drivers/gpu/drm/xe/xe_guc_ct.c              |   5 +
>   drivers/gpu/drm/xe/xe_guc_fwif.h            |   1 +
>   8 files changed, 784 insertions(+)
>   create mode 100644 drivers/gpu/drm/xe/tests/xe_guc_g2g_test.c
>
> diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> index 81eb046aeebf..0395998ca75c 100644
> --- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> @@ -154,6 +154,8 @@ enum xe_guc_action {
>   	XE_GUC_ACTION_NOTIFY_FLUSH_LOG_BUFFER_TO_FILE = 0x8003,
>   	XE_GUC_ACTION_NOTIFY_CRASH_DUMP_POSTED = 0x8004,
>   	XE_GUC_ACTION_NOTIFY_EXCEPTION = 0x8005,
> +	XE_GUC_ACTION_TEST_G2G_SEND = 0xF001,
> +	XE_GUC_ACTION_TEST_G2G_RECV = 0xF002,
>   	XE_GUC_ACTION_LIMIT
>   };
>   
> diff --git a/drivers/gpu/drm/xe/tests/xe_guc_g2g_test.c b/drivers/gpu/drm/xe/tests/xe_guc_g2g_test.c
> new file mode 100644
> index 000000000000..9bc8a43f7138
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/tests/xe_guc_g2g_test.c
> @@ -0,0 +1,759 @@
> +// SPDX-License-Identifier: GPL-2.0 AND MIT
> +/*
> + * Copyright © 2024 Intel Corporation

2025?

> + */
> +
> +#include <linux/delay.h>
> +
> +#include <kunit/test.h>
> +#include <kunit/visibility.h>
> +
> +#include "tests/xe_kunit_helpers.h"
> +#include "tests/xe_pci_test.h"
> +#include "tests/xe_test.h"
> +
> +#include "xe_bo.h"
> +#include "xe_device.h"
> +#include "xe_pm.h"
> +
> +/*
> + * Payload is opaque to GuC. So KMD can define any structure or size it wants.
> + */
> +struct g2g_test_payload  {
> +	u32 tx_dev;
> +	u32 tx_tile;
> +	u32 rx_dev;
> +	u32 rx_tile;
> +	u32 seqno;
> +};
> +
> +static void g2g_test_send(struct kunit *test, struct xe_guc *guc,
> +			  u32 far_tile, u32 far_dev,
> +			  struct g2g_test_payload *payload)
> +{
> +	struct xe_device *xe = guc_to_xe(guc);
> +	struct xe_gt *gt = guc_to_gt(guc);
> +	u32 *action, total;
> +	size_t payload_len;
> +	int ret;
> +
> +	payload_len = sizeof(*payload) / sizeof(u32);
> +	KUNIT_ASSERT_EQ_MSG(test, sizeof(*payload), payload_len * sizeof(u32),
> +			    "G2G payload not u32 aligned\n");

Can't you just use a static assert on the size of the structure, instead 
of asserting at runtime?

> +
> +	total = 4 + payload_len;
> +	action = kunit_kmalloc_array(test, total, sizeof(*action), GFP_KERNEL);

The size here might be clearer to understand as sizeof(u32). Not a blocker.

> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, action);
> +
> +	action[0] = XE_GUC_ACTION_TEST_G2G_SEND;
> +	action[1] = far_tile;
> +	action[2] = far_dev;
> +	action[3] = payload_len;
> +	memcpy(action + 4, payload, payload_len * sizeof(u32));

sizeof(*payload), instead of payload_len * sizeof(u32) ?

> +
> +	atomic_inc(&xe->g2g_test_count);
> +
> +	/*
> +	 * Should specify the expected response notification here. Problem is that
> +	 * the response will be coming from a different GuC. By the end, it should
> +	 * all add up as long as an equal number of messages are sent from each GuC
> +	 * and to each GuC. However, in the middle negative reservation space errors
> +	 * and such like can occur. Rather than add intrusive changes to the CT layer
> +	 * it is simpler to just not bother counting it at all. The system should be
> +	 * idle when running the selftest, and the selftest's notification total size
> +	 * is well within the G2H allocation size. So there should be no issues with
> +	 * needing to block for space, which is all the tracking code is really for.
> +	 */
> +	ret = xe_guc_ct_send(&guc->ct, action, total, 0, 0);
> +	kunit_kfree(test, action);
> +	KUNIT_ASSERT_EQ_MSG(test, 0, ret, "G2G send failed: %d [%d:%d -> %d:%d]\n", ret,
> +			    gt_to_tile(gt)->id, G2G_DEV(gt), far_tile, far_dev);
> +}
> +
> +/*
> + * NB: Can't use KUNIT_ASSERT and friends in here as this is called asynchronously
> + * from the G2H notification handler. Need that to actually complete rather than
> + * thread-abort in order to keep the rest of the driver alive!
> + */
> +int xe_guc_g2g_test_notification(struct xe_guc *guc, u32 *msg, u32 len)
> +{
> +	struct xe_device *xe = guc_to_xe(guc);
> +	struct xe_gt *rx_gt = guc_to_gt(guc), *test_gt, *tx_gt = NULL;
> +	u32 tx_tile, tx_dev, rx_tile, rx_dev, idx, got_len;
> +	struct g2g_test_payload *payload;
> +	size_t payload_len;
> +	int ret = 0, i;
> +
> +	payload_len = sizeof(*payload) / sizeof(u32);
> +
> +	if (unlikely(len != (G2H_LEN_DW_G2G_NOTIFY_MIN + payload_len))) {
> +		xe_gt_err(rx_gt, "G2G test notification invalid length %u", len);
> +		ret = -EPROTO;
> +		goto done;
> +	}
> +
> +	tx_tile = msg[0];
> +	tx_dev = msg[1];
> +	got_len = msg[2];
> +	payload = (struct g2g_test_payload *)(msg + 3);
> +
> +	rx_tile = gt_to_tile(rx_gt)->id;
> +	rx_dev = G2G_DEV(rx_gt);
> +
> +	if (got_len != payload_len) {
> +		xe_gt_err(rx_gt, "G2G: Invalid payload length: %u vs %zu\n", got_len, payload_len);
> +		ret = -EPROTO;
> +		goto done;
> +	}
> +
> +	if (payload->tx_dev != tx_dev || payload->tx_tile != tx_tile ||
> +	    payload->rx_dev != rx_dev || payload->rx_tile != rx_tile) {
> +		xe_gt_err(rx_gt, "G2G: Invalid payload: %d:%d -> %d:%d vs %d:%d -> %d:%d! [%d]\n",
> +			  payload->tx_tile, payload->tx_dev, payload->rx_tile, payload->rx_dev,
> +			  tx_tile, tx_dev, rx_tile, rx_dev, payload->seqno);
> +		ret = -EPROTO;
> +		goto done;
> +	}
> +
> +	if (!xe->g2g_test_array) {
> +		xe_gt_err(rx_gt, "G2G: Missing test array!\n");
> +		ret = -ENOMEM;
> +		goto done;
> +	}
> +
> +	for_each_gt(test_gt, xe, i) {
> +		if (gt_to_tile(test_gt)->id != tx_tile)
> +			continue;
> +
> +		if (G2G_DEV(test_gt) != tx_dev)
> +			continue;
> +
> +		if (tx_gt) {
> +			xe_gt_err(rx_gt, "G2G: Got duplicate TX GTs: %d vs %d for %d:%d!\n",
> +				  tx_gt->info.id, test_gt->info.id, tx_tile, tx_dev);
> +			ret = -EINVAL;
> +			goto done;
> +		}
> +
> +		tx_gt = test_gt;
> +	}
> +	if (!tx_gt) {
> +		xe_gt_err(rx_gt, "G2G: Failed to find a TX GT for %d:%d!\n", tx_tile, tx_dev);
> +		ret = -EINVAL;
> +		goto done;
> +	}
> +
> +	idx = (tx_gt->info.id * xe->info.gt_count) + rx_gt->info.id;
> +
> +	if (xe->g2g_test_array[idx] != payload->seqno - 1) {
> +		xe_gt_err(rx_gt, "G2G: Seqno mismatch %d vs %d for %d:%d -> %d:%d!\n",
> +			  xe->g2g_test_array[idx], payload->seqno - 1,
> +			  tx_tile, tx_dev, rx_tile, rx_dev);
> +		ret = -EINVAL;
> +		goto done;
> +	}
> +
> +	xe->g2g_test_array[idx] = payload->seqno;
> +
> +done:
> +	atomic_dec(&xe->g2g_test_count);
> +	return ret;
> +}
> +
> +/*
> + * Send the given seqno from all GuCs to all other GuCs in tile/GT order
> + */
> +static void g2g_test_in_order(struct kunit *test, struct xe_device *xe, u32 seqno)
> +{
> +	struct xe_gt *near_gt, *far_gt;
> +	int i, j;
> +
> +	for_each_gt(near_gt, xe, i) {
> +		u32 near_tile = gt_to_tile(near_gt)->id;
> +		u32 near_dev = G2G_DEV(near_gt);
> +
> +		for_each_gt(far_gt, xe, j) {
> +			u32 far_tile = gt_to_tile(far_gt)->id;
> +			u32 far_dev = G2G_DEV(far_gt);
> +			struct g2g_test_payload payload;
> +
> +			if (far_gt->info.id == near_gt->info.id)
> +				continue;
> +
> +			payload.tx_dev = near_dev;
> +			payload.tx_tile = near_tile;
> +			payload.rx_dev = far_dev;
> +			payload.rx_tile = far_tile;
> +			payload.seqno = seqno;
> +			g2g_test_send(test, &near_gt->uc.guc, far_tile, far_dev, &payload);
> +		}
> +	}
> +}
> +
> +#define WAIT_TIME_MS	100
> +#define WAIT_COUNT	(1000 / WAIT_TIME_MS)
> +
> +static void g2g_wait_for_complete(void *_xe)
> +{
> +	struct xe_device *xe = (struct xe_device *)_xe;
> +	struct kunit *test = kunit_get_current_test();
> +	int wait = 0;
> +
> +	/* Wait for all G2H messages to be received */
> +	while (atomic_read(&xe->g2g_test_count)) {
> +		if (++wait > WAIT_COUNT)
> +			break;
> +
> +		msleep(WAIT_TIME_MS);
> +	}
> +
> +	KUNIT_ASSERT_EQ_MSG(test, 0, atomic_read(&xe->g2g_test_count),
> +			    "Timed out waiting for notifications\n");
> +	kunit_info(test, "Got all notifications back\n");
> +}
> +
> +#undef WAIT_TIME_MS
> +#undef WAIT_COUNT
> +
> +static void g2g_clean_array(void *_xe)
> +{
> +	struct xe_device *xe = (struct xe_device *)_xe;
> +
> +	xe->g2g_test_array = NULL;
> +}
> +
> +#define NUM_LOOPS	16
> +
> +static void g2g_run_test(struct kunit *test, struct xe_device *xe)
> +{
> +	u32 seqno, max_array;
> +	int ret, i, j;
> +
> +	max_array = xe->info.gt_count * xe->info.gt_count;
> +	xe->g2g_test_array = kunit_kcalloc(test, max_array, sizeof(u32), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xe->g2g_test_array);
> +
> +	ret = kunit_add_action_or_reset(test, g2g_clean_array, xe);
> +	KUNIT_ASSERT_EQ_MSG(test, 0, ret, "Failed to register clean up action\n");
> +
> +	/*
> +	 * Send incrementing seqnos from all GuCs to all other GuCs in tile/GT order.
> +	 * Tile/GT order doesn't really mean anything to the hardware but it is going
> +	 * to be a fixed sequence every time.
> +	 *
> +	 * Verify that each one comes back having taken the correct route.
> +	 */
> +	ret = kunit_add_action(test, g2g_wait_for_complete, xe);
> +	KUNIT_ASSERT_EQ_MSG(test, 0, ret, "Failed to register clean up action\n");
> +	for (seqno = 1; seqno < NUM_LOOPS; seqno++)
> +		g2g_test_in_order(test, xe, seqno);
> +	seqno--;
> +
> +	kunit_release_action(test, &g2g_wait_for_complete, xe);
> +
> +	/* Check for the final seqno in each slot */
> +	for (i = 0; i < xe->info.gt_count; i++) {
> +		for (j = 0; j < xe->info.gt_count; j++) {
> +			u32 idx = (j * xe->info.gt_count) + i;
> +
> +			if (i == j)
> +				KUNIT_ASSERT_EQ_MSG(test, 0, xe->g2g_test_array[idx],
> +						    "identity seqno modified: %d for %dx%d!\n",
> +						    xe->g2g_test_array[idx], i, j);
> +			else
> +				KUNIT_ASSERT_EQ_MSG(test, seqno, xe->g2g_test_array[idx],
> +						    "invalid seqno: %d vs %d for %dx%d!\n",
> +						    xe->g2g_test_array[idx], seqno, i, j);
> +		}
> +	}
> +
> +	kunit_kfree(test, xe->g2g_test_array);
> +	kunit_release_action(test, &g2g_clean_array, xe);
> +
> +	kunit_info(test, "Test passed\n");
> +}
> +
> +#undef NUM_LOOPS
> +
> +static void g2g_ct_stop(struct xe_guc *guc)
> +{
> +	struct xe_gt *remote_gt, *gt = guc_to_gt(guc);
> +	struct xe_device *xe = gt_to_xe(gt);
> +	int i, t;
> +
> +	for_each_gt(remote_gt, xe, i) {
> +		u32 tile, dev;
> +
> +		if (remote_gt->info.id == gt->info.id)
> +			continue;
> +
> +		tile = gt_to_tile(remote_gt)->id;
> +		dev = G2G_DEV(remote_gt);
> +
> +		for (t = 0; t < XE_G2G_TYPE_LIMIT; t++)
> +			guc_g2g_deregister(guc, tile, dev, t);
> +	}
> +}
> +
> +/* Size of a single allocation that contains all G2G CTBs across all GTs */
> +static u32 g2g_ctb_size(struct kunit *test, struct xe_device *xe)
> +{
> +	unsigned int count = xe->info.gt_count;
> +	u32 num_channels = (count * (count - 1)) / 2;
> +
> +	kunit_info(test, "Size: (%d * %d / 2) * %d * 0x%08X + 0x%08X => 0x%08X [%d]\n",
> +		   count, count - 1, XE_G2G_TYPE_LIMIT, G2G_BUFFER_SIZE, G2G_DESC_AREA_SIZE,
> +		   num_channels * XE_G2G_TYPE_LIMIT * G2G_BUFFER_SIZE + G2G_DESC_AREA_SIZE,
> +		   num_channels * XE_G2G_TYPE_LIMIT);
> +
> +	return num_channels * XE_G2G_TYPE_LIMIT * G2G_BUFFER_SIZE + G2G_DESC_AREA_SIZE;
> +}

Since you're including this file from xe_guc.c, can't you call 
guc_g2g_size directly? we'll miss the log but I'm not sure how helpful 
that log is anyway.

> +
> +/*
> + * Use the driver's regular CTB allocation scheme.
> + */
> +static void g2g_alloc_default(struct kunit *test, struct xe_device *xe)
> +{
> +	struct xe_gt *gt;
> +	int i;
> +
> +	kunit_info(test, "Default [tiles = %d, GTs = %d]\n",
> +		   xe->info.tile_count, xe->info.gt_count);
> +
> +	for_each_gt(gt, xe, i) {
> +		struct xe_guc *guc = &gt->uc.guc;
> +		int ret;
> +
> +		ret = guc_g2g_alloc(guc);
> +		KUNIT_ASSERT_EQ_MSG(test, 0, ret, "G2G alloc failed: %pe", ERR_PTR(ret));
> +		continue;
> +	}
> +}
> +
> +static void g2g_distribute(struct kunit *test, struct xe_device *xe, struct xe_bo *bo)
> +{
> +	struct xe_gt *root_gt, *gt;
> +	int i;
> +
> +	root_gt = xe_device_get_gt(xe, 0);
> +	root_gt->uc.guc.g2g.bo = bo;
> +	root_gt->uc.guc.g2g.owned = true;
> +	kunit_info(test, "[%d.%d] Assigned 0x%p\n", gt_to_tile(root_gt)->id, root_gt->info.id, bo);
> +
> +	for_each_gt(gt, xe, i) {
> +		if (gt->info.id != 0) {
> +			gt->uc.guc.g2g.owned = false;
> +			gt->uc.guc.g2g.bo = xe_bo_get(bo);
> +			kunit_info(test, "[%d.%d] Pinned 0x%p\n",
> +				   gt_to_tile(gt)->id, gt->info.id, gt->uc.guc.g2g.bo);
> +		}
> +
> +		KUNIT_ASSERT_NOT_ERR_OR_NULL(test, gt->uc.guc.g2g.bo);
> +	}
> +}
> +
> +/*
> + * Allocate a single blob on the host and split between all G2G CTBs.

Isn't this the same as the default on integrated? I'm wondering if it's 
worth skipping xe_live_guc_g2g_kunit_allmem entirely on integrated, 
given that the default case is already covered by 
xe_live_guc_g2g_kunit_default

> + */
> +static void g2g_alloc_host(struct kunit *test, struct xe_device *xe)
> +{
> +	struct xe_bo *bo;
> +	u32 g2g_size;
> +
> +	kunit_info(test, "Host [tiles = %d, GTs = %d]\n", xe->info.tile_count, xe->info.gt_count);
> +
> +	g2g_size = g2g_ctb_size(test, xe);
> +	bo = xe_managed_bo_create_pin_map(xe, xe_device_get_root_tile(xe), g2g_size,
> +					  XE_BO_FLAG_SYSTEM |
> +					  XE_BO_FLAG_GGTT |
> +					  XE_BO_FLAG_GGTT_ALL |
> +					  XE_BO_FLAG_GGTT_INVALIDATE);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, bo);
> +	kunit_info(test, "[HST] G2G buffer create: 0x%p\n", bo);
> +
> +	xe_map_memset(xe, &bo->vmap, 0, 0, g2g_size);
> +
> +	g2g_distribute(test, xe, bo);
> +}
> +
> +/*
> + * Allocate a single blob on the given tile and split between all G2G CTBs.
> + */
> +static void g2g_alloc_tile(struct kunit *test, struct xe_device *xe, struct xe_tile *tile)
> +{
> +	struct xe_bo *bo;
> +	u32 g2g_size;
> +
> +	KUNIT_ASSERT_TRUE(test, IS_DGFX(xe));
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, tile);
> +
> +	kunit_info(test, "Tile %d [tiles = %d, GTs = %d]\n",
> +		   tile->id, xe->info.tile_count, xe->info.gt_count);
> +
> +	g2g_size = g2g_ctb_size(test, xe);
> +	bo = xe_managed_bo_create_pin_map(xe, tile, g2g_size,
> +					  XE_BO_FLAG_VRAM_IF_DGFX(tile) |
> +					  XE_BO_FLAG_GGTT |
> +					  XE_BO_FLAG_GGTT_ALL |
> +					  XE_BO_FLAG_GGTT_INVALIDATE);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, bo);
> +	kunit_info(test, "[%d.*] G2G buffer create: 0x%p\n", tile->id, bo);
> +
> +	xe_map_memset(xe, &bo->vmap, 0, 0, g2g_size);
> +
> +	g2g_distribute(test, xe, bo);
> +}
> +
> +static void g2g_free(struct kunit *test, struct xe_device *xe)
> +{
> +	struct xe_gt *gt;
> +	struct xe_bo *bo;
> +	int i;
> +
> +	for_each_gt(gt, xe, i) {
> +		bo = gt->uc.guc.g2g.bo;
> +		if (!bo)
> +			continue;
> +
> +		if (gt->uc.guc.g2g.owned) {
> +			xe_managed_bo_unpin_map_no_vm(xe, bo);
> +			kunit_info(test, "[%d.%d] Unmapped 0x%p\n",
> +				   gt_to_tile(gt)->id, gt->info.id, bo);
> +		} else {
> +			xe_bo_put(bo);
> +			kunit_info(test, "[%d.%d] Unpinned 0x%p\n",
> +				   gt_to_tile(gt)->id, gt->info.id, bo);
> +		}
> +
> +		gt->uc.guc.g2g.bo = NULL;
> +	}
> +}
> +
> +static void g2g_stop(struct kunit *test, struct xe_device *xe)
> +{
> +	struct xe_gt *gt;
> +	int i;
> +
> +	for_each_gt(gt, xe, i) {
> +		struct xe_guc *guc = &gt->uc.guc;
> +
> +		if (!guc->g2g.bo)
> +			continue;
> +
> +		g2g_ct_stop(guc);
> +	}
> +
> +	g2g_free(test, xe);
> +}
> +
> +/*
> + * Generate a unique id for each bi-directional CTB for each pair of
> + * near and far tiles/devices. The id can then be used as an index into
> + * a single allocation that is sub-divided into multiple CTBs.
> + *
> + * For example, with two devices per tile and two tiles, the table should
> + * look like:
> + *           Far <tile>.<dev>
> + *         0.0   0.1   1.0   1.1
> + * N 0.0  --/-- 00/01 02/03 04/05
> + * e 0.1  01/00 --/-- 06/07 08/09
> + * a 1.0  03/02 07/06 --/-- 10/11
> + * r 1.1  05/04 09/08 11/10 --/--
> + *
> + * Where each entry is Rx/Tx channel id.
> + *
> + * So GuC #3 (tile 1, dev 1) talking to GuC #2 (tile 1, dev 0) would
> + * be reading from channel #11 and writing to channel #10. Whereas,
> + * GuC #2 talking to GuC #3 would be read on #10 and write to #11.
> + */
> +static int g2g_slot_flat(u32 near_tile, u32 near_dev, u32 far_tile, u32 far_dev,
> +			 u32 type, u32 max_inst, bool have_dev)
> +{
> +	u32 near = near_tile, far = far_tile;
> +	u32 idx = 0, x, y, direction;
> +	int i;
> +
> +	if (have_dev) {
> +		near = (near << 1) | near_dev;
> +		far = (far << 1) | far_dev;
> +	}
> +
> +	/* No need to send to one's self */
> +	if (far == near)
> +		return -1;
> +
> +	if (far > near) {
> +		/* Top right table half */
> +		x = far;
> +		y = near;
> +
> +		/* T/R is 'forwards' direction */
> +		direction = type;
> +	} else {
> +		/* Bottom left table half */
> +		x = near;
> +		y = far;
> +
> +		/* B/L is 'backwards' direction */
> +		direction = (1 - type);
> +	}
> +
> +	/* Count the rows prior to the target */
> +	for (i = y; i > 0; i--)
> +		idx += max_inst - i;
> +
> +	/* Count this row up to the target */
> +	idx += (x - 1 - y);
> +
> +	/* Slots are in Rx/Tx pairs */
> +	idx *= 2;
> +
> +	/* Pick Rx/Tx direction */
> +	idx += direction;
> +
> +	return idx;
> +}
> +
> +static int g2g_register_flat(struct xe_guc *guc, u32 far_tile, u32 far_dev, u32 type, bool have_dev)
> +{
> +	struct xe_gt *gt = guc_to_gt(guc);
> +	struct xe_device *xe = gt_to_xe(gt);
> +	u32 near_tile = gt_to_tile(gt)->id;
> +	u32 near_dev = G2G_DEV(gt);
> +	u32 max = xe->info.gt_count;
> +	int idx;
> +	u32 base, desc, buf;
> +
> +	if (!guc->g2g.bo)
> +		return -ENODEV;
> +
> +	idx = g2g_slot_flat(near_tile, near_dev, far_tile, far_dev, type, max, have_dev);
> +	xe_assert(xe, idx >= 0);
> +
> +	base = guc_bo_ggtt_addr(guc, guc->g2g.bo);
> +	desc = base + idx * G2G_DESC_SIZE;
> +	buf = base + idx * G2G_BUFFER_SIZE + G2G_DESC_AREA_SIZE;
> +
> +	xe_assert(xe, (desc - base + G2G_DESC_SIZE) <= G2G_DESC_AREA_SIZE);
> +	xe_assert(xe, (buf - base + G2G_BUFFER_SIZE) <= xe_bo_size(guc->g2g.bo));
> +
> +	return guc_action_register_g2g_buffer(guc, type, far_tile, far_dev,
> +					      desc, buf, G2G_BUFFER_SIZE);
> +}

Similar comment as above for those 2 _flat functions: can't you just 
call the original?

> +
> +static void g2g_start(struct kunit *test, struct xe_guc *guc)
> +{
> +	struct xe_gt *remote_gt, *gt = guc_to_gt(guc);
> +	struct xe_device *xe = gt_to_xe(gt);
> +	unsigned int i;
> +	int t, ret;
> +	bool have_dev;
> +
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, guc->g2g.bo);
> +
> +	/* GuC interface will need extending if more GT device types are ever created. */
> +	KUNIT_ASSERT_TRUE(test,
> +			  (gt->info.type == XE_GT_TYPE_MAIN) ||
> +			  (gt->info.type == XE_GT_TYPE_MEDIA));
> +
> +	/* Channel numbering depends on whether there are multiple GTs per tile */
> +	have_dev = xe->info.gt_count > xe->info.tile_count;
> +
> +	for_each_gt(remote_gt, xe, i) {
> +		u32 tile, dev;
> +
> +		if (remote_gt->info.id == gt->info.id)
> +			continue;
> +
> +		tile = gt_to_tile(remote_gt)->id;
> +		dev = G2G_DEV(remote_gt);
> +
> +		for (t = 0; t < XE_G2G_TYPE_LIMIT; t++) {
> +			ret = g2g_register_flat(guc, tile, dev, t, have_dev);
> +			KUNIT_ASSERT_EQ_MSG(test, 0, ret, "G2G register failed: %pe", ERR_PTR(ret));
> +		}
> +	}
> +}

And this one is almost the same as guc_g2g_start(). Could just do:

static void g2g_start(struct kunit *test, struct xe_guc *guc)
{
         struct xe_gt *remote_gt, *gt = guc_to_gt(guc);
         int ret;

         KUNIT_ASSERT_NOT_ERR_OR_NULL(test, guc->g2g.bo);

         KUNIT_ASSERT_TRUE(test,
                       (gt->info.type == XE_GT_TYPE_MAIN) ||
                       (gt->info.type == XE_GT_TYPE_MEDIA));

         ret = guc_g2g_start(guc);
         KUNIT_ASSERT_EQ_MSG(test, 0, ret, "G2G register failed: %pe", 
ERR_PTR(ret));
}


> +
> +enum {
> +	G2G_CTB_TYPE_DEFAULT,
> +	G2G_CTB_TYPE_HOST,
> +	G2G_CTB_TYPE_TILE,
> +};
> +
> +static void g2g_reinit(struct kunit *test, struct xe_device *xe, int ctb_type, struct xe_tile *tile)
> +{
> +	struct xe_gt *gt;
> +	int i, found = 0;
> +
> +	g2g_stop(test, xe);
> +
> +	for_each_gt(gt, xe, i) {
> +		struct xe_guc *guc = &gt->uc.guc;
> +
> +		KUNIT_ASSERT_NULL(test, guc->g2g.bo);
> +	}
> +
> +	switch (ctb_type) {
> +	case G2G_CTB_TYPE_DEFAULT:
> +		g2g_alloc_default(test, xe);
> +		break;
> +
> +	case G2G_CTB_TYPE_HOST:
> +		g2g_alloc_host(test, xe);
> +		break;
> +
> +	case G2G_CTB_TYPE_TILE:
> +		g2g_alloc_tile(test, xe, tile);
> +		break;
> +
> +	default:
> +		KUNIT_ASSERT_TRUE(test, false);
> +	}
> +
> +	for_each_gt(gt, xe, i) {
> +		struct xe_guc *guc = &gt->uc.guc;
> +
> +		if (!guc->g2g.bo)
> +			continue;

Do we actually have a case where the g2g buffer is enabled on some GTs 
but not others?

Daniele

> +
> +		g2g_start(test, guc);
> +		found++;
> +	}
> +
> +	KUNIT_ASSERT_GT_MSG(test, found, 1, "insufficient G2G channels running: %d", found);
> +
> +	kunit_info(test, "Testing across %d GTs\n", found);
> +}
> +
> +static void g2g_recreate_ctb(void *_xe)
> +{
> +	struct xe_device *xe = (struct xe_device *)_xe;
> +	struct kunit *test = kunit_get_current_test();
> +
> +	g2g_stop(test, xe);
> +
> +	if (xe_guc_g2g_wanted(xe))
> +		g2g_reinit(test, xe, G2G_CTB_TYPE_DEFAULT, NULL);
> +}
> +
> +static void g2g_pm_runtime_put(void *_xe)
> +{
> +	struct xe_device *xe = (struct xe_device *)_xe;
> +
> +	xe_pm_runtime_put(xe);
> +}
> +
> +static void g2g_pm_runtime_get(struct kunit *test)
> +{
> +	struct xe_device *xe = test->priv;
> +	int ret;
> +
> +	xe_pm_runtime_get(xe);
> +	ret = kunit_add_action_or_reset(test, g2g_pm_runtime_put, xe);
> +	KUNIT_ASSERT_EQ_MSG(test, 0, ret, "Failed to register runtime PM action\n");
> +}
> +
> +static void g2g_check_skip(struct kunit *test)
> +{
> +	struct xe_device *xe = test->priv;
> +	struct xe_gt *gt;
> +	int i;
> +
> +	if (IS_SRIOV_VF(xe))
> +		kunit_skip(test, "not supported from a VF");
> +
> +	if (xe->info.gt_count <= 1)
> +		kunit_skip(test, "not enough GTs");
> +
> +	for_each_gt(gt, xe, i) {
> +		struct xe_guc *guc = &gt->uc.guc;
> +
> +		if (guc->fw.build_type == CSS_UKERNEL_INFO_BUILDTYPE_PROD)
> +			kunit_skip(test,
> +				   "G2G test interface not available in production firmware builds\n");
> +	}
> +}
> +
> +/*
> + * Simple test that does not try to recreate the CTBs.
> + * Requires that the platform already enables G2G comms
> + * but has no risk of leaving the system in a broken state
> + * afterwards.
> + */
> +static void xe_live_guc_g2g_kunit_default(struct kunit *test)
> +{
> +	struct xe_device *xe = test->priv;
> +
> +	if (!xe_guc_g2g_wanted(xe))
> +		kunit_skip(test, "G2G not enabled");
> +
> +	g2g_check_skip(test);
> +
> +	g2g_pm_runtime_get(test);
> +
> +	kunit_info(test, "Testing default CTBs\n");
> +	g2g_run_test(test, xe);
> +
> +	kunit_release_action(test, &g2g_pm_runtime_put, xe);
> +}
> +
> +/*
> + * More complex test that re-creates the CTBs in various location to
> + * test access to each location from each GuC. Can be run even on
> + * systems that do not enable G2G by default. On the other hand,
> + * because it recreates the CTBs, if something goes wrong it could
> + * leave the system with broken G2G comms.
> + */
> +static void xe_live_guc_g2g_kunit_allmem(struct kunit *test)
> +{
> +	struct xe_device *xe = test->priv;
> +	int ret;
> +
> +	g2g_check_skip(test);
> +
> +	g2g_pm_runtime_get(test);
> +
> +	/* Make sure to leave the system as we found it */
> +	ret = kunit_add_action_or_reset(test, g2g_recreate_ctb, xe);
> +	KUNIT_ASSERT_EQ_MSG(test, 0, ret, "Failed to register CTB re-creation action\n");
> +
> +	kunit_info(test, "Testing CTB type 'default'...\n");
> +	g2g_reinit(test, xe, G2G_CTB_TYPE_DEFAULT, NULL);
> +	g2g_run_test(test, xe);
> +
> +	kunit_info(test, "Testing CTB type 'host'...\n");
> +	g2g_reinit(test, xe, G2G_CTB_TYPE_HOST, NULL);
> +	g2g_run_test(test, xe);
> +
> +	if (IS_DGFX(xe)) {
> +		struct xe_tile *tile;
> +		int id;
> +
> +		for_each_tile(tile, xe, id) {
> +			kunit_info(test, "Testing CTB type 'tile: #%d'...\n", id);
> +
> +			g2g_reinit(test, xe, G2G_CTB_TYPE_TILE, tile);
> +			g2g_run_test(test, xe);
> +		}
> +	} else {
> +		kunit_info(test, "Skipping local memory on integrated platform\n");
> +	}
> +
> +	kunit_release_action(test, g2g_recreate_ctb, xe);
> +	kunit_release_action(test, g2g_pm_runtime_put, xe);
> +}
> +
> +static struct kunit_case xe_guc_g2g_tests[] = {
> +	KUNIT_CASE_PARAM(xe_live_guc_g2g_kunit_default, xe_pci_live_device_gen_param),
> +	KUNIT_CASE_PARAM(xe_live_guc_g2g_kunit_allmem, xe_pci_live_device_gen_param),
> +	{}
> +};
> +
> +VISIBLE_IF_KUNIT
> +struct kunit_suite xe_guc_g2g_test_suite = {
> +	.name = "xe_guc_g2g",
> +	.test_cases = xe_guc_g2g_tests,
> +	.init = xe_kunit_helper_xe_device_live_test_init,
> +};
> +EXPORT_SYMBOL_IF_KUNIT(xe_guc_g2g_test_suite);
> diff --git a/drivers/gpu/drm/xe/tests/xe_live_test_mod.c b/drivers/gpu/drm/xe/tests/xe_live_test_mod.c
> index 81277c77016d..c55e46f1ae92 100644
> --- a/drivers/gpu/drm/xe/tests/xe_live_test_mod.c
> +++ b/drivers/gpu/drm/xe/tests/xe_live_test_mod.c
> @@ -10,12 +10,14 @@ extern struct kunit_suite xe_bo_shrink_test_suite;
>   extern struct kunit_suite xe_dma_buf_test_suite;
>   extern struct kunit_suite xe_migrate_test_suite;
>   extern struct kunit_suite xe_mocs_test_suite;
> +extern struct kunit_suite xe_guc_g2g_test_suite;
>   
>   kunit_test_suite(xe_bo_test_suite);
>   kunit_test_suite(xe_bo_shrink_test_suite);
>   kunit_test_suite(xe_dma_buf_test_suite);
>   kunit_test_suite(xe_migrate_test_suite);
>   kunit_test_suite(xe_mocs_test_suite);
> +kunit_test_suite(xe_guc_g2g_test_suite);
>   
>   MODULE_AUTHOR("Intel Corporation");
>   MODULE_LICENSE("GPL");
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 38c8329b4d2c..0416b0eba3bf 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -576,6 +576,13 @@ struct xe_device {
>   	atomic64_t global_total_pages;
>   #endif
>   
> +#if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
> +	/** @g2g_test_array: for testing G2G communications */
> +	u32 *g2g_test_array;
> +	/** @g2g_test_count: for testing G2G communications */
> +	atomic_t g2g_test_count;
> +#endif
> +
>   	/* private: */
>   
>   #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 1ca7f4f27e26..7c069236d1be 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -1673,3 +1673,7 @@ void xe_guc_declare_wedged(struct xe_guc *guc)
>   	xe_guc_ct_stop(&guc->ct);
>   	xe_guc_submit_wedge(guc);
>   }
> +
> +#if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
> +#include "tests/xe_guc_g2g_test.c"
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
> index 22cf019a11bf..1cca05967e62 100644
> --- a/drivers/gpu/drm/xe/xe_guc.h
> +++ b/drivers/gpu/drm/xe/xe_guc.h
> @@ -53,6 +53,10 @@ void xe_guc_stop(struct xe_guc *guc);
>   int xe_guc_start(struct xe_guc *guc);
>   void xe_guc_declare_wedged(struct xe_guc *guc);
>   
> +#if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
> +int xe_guc_g2g_test_notification(struct xe_guc *guc, u32 *payload, u32 len);
> +#endif
> +
>   static inline u16 xe_engine_class_to_guc_class(enum xe_engine_class class)
>   {
>   	switch (class) {
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 3f4e6a46ff16..f44967f84d30 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -1439,6 +1439,11 @@ static int process_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
>   	case XE_GUC_ACTION_NOTIFY_EXCEPTION:
>   		ret = guc_crash_process_msg(ct, action);
>   		break;
> +#if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
> +	case XE_GUC_ACTION_TEST_G2G_RECV:
> +		ret = xe_guc_g2g_test_notification(guc, payload, adj_len);
> +		break;
> +#endif
>   	default:
>   		xe_gt_err(gt, "unexpected G2H action 0x%04x\n", action);
>   	}
> diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
> index ca9f999d38d1..bc94f8d0f037 100644
> --- a/drivers/gpu/drm/xe/xe_guc_fwif.h
> +++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
> @@ -15,6 +15,7 @@
>   #define G2H_LEN_DW_SCHED_CONTEXT_MODE_SET	4
>   #define G2H_LEN_DW_DEREGISTER_CONTEXT		3
>   #define G2H_LEN_DW_TLB_INVALIDATE		3
> +#define G2H_LEN_DW_G2G_NOTIFY_MIN		3
>   
>   #define GUC_ID_MAX			65535
>   #define GUC_ID_UNKNOWN			0xffffffff

