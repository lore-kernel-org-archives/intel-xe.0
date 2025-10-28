Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DD6ACCD1BF
	for <intel-xe@archiver.kernel.org>; Tue, 28 Oct 2025 09:33:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E54D910E36D;
	Tue, 28 Oct 2025 09:33:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jMNRtOiv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55B4310E36F
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Oct 2025 09:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761643993; x=1793179993;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=trH3Csv3iumMbNW5JZc3BXN74pQHVKjQfP6jKhOF0Wk=;
 b=jMNRtOivYB8k9hbTxnwN4RL8yYUEsDbMMD0x4cDUyj2Iiv8ttOhxnjYW
 z9rd7hKTDS21cZg7hLT6e55Fc9HeNs7Mvx24VmHXXa74AjLH2p2Vj4lhv
 9bo/eXz6pMjuhF13RksXNMQsC0rffIvFoy8CuJ6LkkxFpIqiqFR0BAa1n
 WUaoUOUwj/knNDjXdNEQMGj18dtqNTHLQXvEki2tEv7Bba0TWFwBjMU+v
 d2tyg5/KWEY54huztoxbtFSqfUbImArfzM/+6QkfZ6qHlnFI+kFSXNgiY
 EunAIJnhVHUzmLI+ZB4KIQgjVwMVNDFj3OgZW2PaW8luEM3kwjYDZClPG w==;
X-CSE-ConnectionGUID: A9+JRUiET/+PDlsgcVTilw==
X-CSE-MsgGUID: fGW2Cm+kQSK95UgdzVtD0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63776052"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="63776052"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 02:33:12 -0700
X-CSE-ConnectionGUID: QnIfP9Q/RJ+ly2gEFU3liQ==
X-CSE-MsgGUID: qfeX5HfgRS+mHazAGMUCpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="208896164"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 02:33:12 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 02:33:11 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 28 Oct 2025 02:33:11 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.31) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 02:33:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ehhaBqdHulk+jeYlSiOJxgYTFLzCBcwLsKem8WoSBQ1ZTgukV67hrLwArdEZ+eoEX3qL99P9bpu5PZo11w0LrpBPhoh2cBIQN/RiUIejIpoH6Up7lg9lKCYIsDmYSF7XeF8+LbQhcc8CLoqOEaMtYDG2R30knkTwShqaQkJzoK+j9Ss0CIymddnxgjTaCHvd1fAe327HDliEiwUOq6DfoOy6hBeAyQjmQiy32y8pWutXqmTqiDvIlqY8hvT0HqiT4NrpOfSQ4JfkDW1bbnZZbtebthuQhFgcGRS9YIqwzdDDQKdfWseRM6vgtjkA0hVH0yMI8DYPc1oqz8dt4L3kmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RHtel+Sv4d3J6Cy5rMcqyQ83uZOnAtfiIvzH2Yl0FYw=;
 b=rub+A3rPuxikuusiqxe5Tv3UVv/pcca2BAhR+PVomDy0krIF/Zmk4JxYNXCrFswYBPTihuvfDLe2enEWnAss5A5+7PBzvYmY59mGXDVW9c7kmFMsHtttB1Q1PPlwBjpp+k9sybKnDw2AMei/+xbP4jO1m7NROVO18HKm2UrruMnGc1IxFLR54/3Oyac66bzoYXWFGVUzK4HWUiN7VOJRfQvsA95FElBNE+E88prnBUk2FMGOgtAxFQkx2yybkuQJ74VDLiQh9LK79GSXLO/sZN9S/tfALfvIZcETON8g+fBcc7Cpzcf1vnHMHgPkuQZl//LACC1jb8n9kGevMe7dug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by SA2PR11MB4924.namprd11.prod.outlook.com (2603:10b6:806:113::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.19; Tue, 28 Oct
 2025 09:33:09 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229%5]) with mapi id 15.20.9253.018; Tue, 28 Oct 2025
 09:33:09 +0000
Message-ID: <33aff812-d941-43e1-910c-afe33e168e9d@intel.com>
Date: Tue, 28 Oct 2025 10:33:05 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/12] drm/xe/pf: Add TLB invalidation support for MERT
To: Lucas De Marchi <lucas.demarchi@intel.com>, Matthew Brost
 <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20251021-cri-v1-0-bf11e61d9f49@intel.com>
 <20251021-cri-v1-11-bf11e61d9f49@intel.com>
 <aPkiQ5qSAQmgjU7L@lstrano-desk.jf.intel.com>
 <a3mxo7dyi4lg4hj6looiw6ig7dto75ryjspwfcyonint6kfvcz@mvrk6ypi5vdc>
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
Content-Language: en-US
In-Reply-To: <a3mxo7dyi4lg4hj6looiw6ig7dto75ryjspwfcyonint6kfvcz@mvrk6ypi5vdc>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE0P281CA0032.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:14::19) To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|SA2PR11MB4924:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b03318c-cc5b-4bb4-4c5f-08de1605018c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bWNIaWhDSmRYaGp3eTcvVXN0SVRVSTFTWGIvME9MTDJ5ZUR4dDYxWUVDZWkx?=
 =?utf-8?B?YkhtdjdMc09FYjFocGNnTFFSM1kvb1BwUENyVnZ5N2NuYk5qYUY5UUpCZGI2?=
 =?utf-8?B?K2tMOFhDVXRidEdjSHBnK09JKy84Z1VxUy82bGFBZTRQa0IwVCtlT3RXVkQy?=
 =?utf-8?B?R0FGeGVWWkx0QkxPVjJmcDhmNU90RHRSNUFPQXdiWmtOc0RHYUJoK2RDQlgy?=
 =?utf-8?B?S1hwZGt5cE9HZTJrUjRPeUxPQkZ1NU1JeThrMFp6MldCRlhTTVhMRHRLR0lp?=
 =?utf-8?B?S3IvQ0QrRnFQbndpbHk0RDZNV1pBd3ZOYVVhaGgzTTRBL2xDQis0andpWXNH?=
 =?utf-8?B?aWtSbVNJL3dCazVRbFJDK3FqTWx3MjJjMC91UXJhT2JXWC95VzRuRWpZaXM0?=
 =?utf-8?B?akF3MGJNSmVrVVZMUDBhczZDRHhKRUF0dis4NnVqRm5UczNqRlRCTFpkeFVy?=
 =?utf-8?B?Q0ljdVJkMTYrenpjK2VRWVBEY2gxMmdMVGFhWVBJWE93SUMzZnFRSGlTVkdO?=
 =?utf-8?B?WWUrRUdQZ3IyM3ZyNzdCMWpnOW1waEhKM1FYbnpZeFpjU3Bxd3VNODY0QkVV?=
 =?utf-8?B?ZHM3L2h3RFZhUkYzV3lnR1ZXN3NvNnNmWmNxMUFBdWx0UWg0SHZ6bGpCendt?=
 =?utf-8?B?TDVGRnZETGt5Q0VXdUNSWElmV3pHcVloK1pWMzZhaTZLYi9OeTJCSHVEMFNk?=
 =?utf-8?B?WXgzK1RGTDIvZTgzaG5ya2dzaDhlTmZXQ1Z0cEYzZytPSHdmSkU5NmhYck82?=
 =?utf-8?B?UHFIZm8rYW5UN3YyYnBuampDYWJlYWJiWDN6aEpPaWtjNEwrbWF6Q1RPc2xF?=
 =?utf-8?B?ZVUzNlJuUWJFekFyMi9PcHlneVRFKy9ycXVEYXR6T0NUdm5WZk9FcmRnN29q?=
 =?utf-8?B?M3BXUVIzYXI1SXpOU3d2SThHTmI0VWVCN3A1OU5RYnM5RTVGV2dLQ3VuV1F0?=
 =?utf-8?B?eTFWei81TUx1UVVPRDFlTUR6Sm5veXE0WGgwcVNMVGd1OEdCalBBbVJmMjgw?=
 =?utf-8?B?RjcydmY5QXluZHByREI3Z0NpcldvNlQzMG1hYStVYXp2VmJZMEZnc2JSSHRz?=
 =?utf-8?B?Sm8xUUV3eGdrTlk0T0xVYVdJcXI3NUtwMTFyNk5wWGkvQ1ZIUjZHdzBrRTVm?=
 =?utf-8?B?VjZaSllMNnlNTkI2OG9pS2ZFTWcrOU0zMS83ZjJnV3N4NE9kSmRva2pSc3F0?=
 =?utf-8?B?dkRiTWVaeDBtSnlzK1QwRFJmQjdwdkxwY2JGbDRKY0RnTHBaU2puWUp6Z3dN?=
 =?utf-8?B?b1N2TDdHR2RWQ2hXZ3ppMElSUElCcTZ4anBYTjFRRURKVHk3d2Y3NktPci83?=
 =?utf-8?B?cWNPTE1xRncxWTdzZ1JqY01RaDFYV09VWlZtUTdGNU54K2cyQlYwVXorVVR1?=
 =?utf-8?B?V2x5VHlidVV1SXpHVUhpMFg4VXZNSUdUQUFqaGg3N3VUQm91MXBhNnBaQjI3?=
 =?utf-8?B?SG5lVGdIMVM2YWJ4RzVGcnN1WlMyS296bGxSS2VEd0lSek02WnFUQkpneExN?=
 =?utf-8?B?aCtCMGN1UmFEcnZlNGF3aVY0cDgya204VmNselZ1NkRkVWZCOFBOUTFqekJU?=
 =?utf-8?B?MFhGU0tRVXJ0eHNJTU43ekpXSHdjZFVVUlRIcVo3WXJHenRhV3FiaFRaNnR6?=
 =?utf-8?B?YTBmdVJGOEFzajJpaldTSVZoYldRV1dOM3RERWg5OGV6L21NVXJBWjlDMGVF?=
 =?utf-8?B?VlNSaWlITGx4d2dPSisxQzMxYmVFcnJJam9sSlpTSHZMZVA2RnpBY2JnRDlG?=
 =?utf-8?B?UktTSzN3VVIrcUZRQ2pvSUpQcDZqWU9XNUV1OVNzdEQ0V1JreVo3MVVZaEEz?=
 =?utf-8?B?dTBLNnlsemMvMVFoYUF2MUF1c1BvMXYvZ0xCVWlzMTNKK1FZdE05TlFKRVpI?=
 =?utf-8?B?dVZQVmlhb3NIaGhjWFZZZ1RqSGFqazVZV3VvR21EdzcxNmM3T1lUS0thdmFh?=
 =?utf-8?Q?RFhcPErynYMShV2YYD3jChPcjwhQ7X4E?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MFR4RHRrQVdVWFNicHhyeUQrV2EvTUxLeUhrRFoyVDlBNzJLUFB0clZNaGkw?=
 =?utf-8?B?R2NnbVhqZEdRaldwellYcU12ckRJcFpkYkc4WjlrdzZwSWoyaWw4N2dsVzFz?=
 =?utf-8?B?VUpaK0UxYUk0Vmtxelc5bmFTM1FpRkY4QnRnVEUvYzUvL2V6OXRIWTl5RVRl?=
 =?utf-8?B?RDlHZCtuZVRBdkpKTndCSWc4TnEyM2ZIQ0h5L1p3b3d6Y0NMMEcvMjJneUpV?=
 =?utf-8?B?TUFxdVVJM1IwNjN4ZGg5Q3dodUdSR0JtVzlNVHZ0ZmVZMDRlMGRlNlhIZlE1?=
 =?utf-8?B?bHVsdzMxTW84WXFjRld2WFFoSmcwUDVQdEs3eW1DblVDMU9RT1A1L2l1Umhr?=
 =?utf-8?B?OUhpQkIxZUdpT2paOFlvbTIwVG5aVlUyY0RhdTJQdnhuSnBHMHJOUzBKdGRy?=
 =?utf-8?B?UFpyNUxKanRQZFM3T01jeG1TRzFUWnZTUXBtMmR0V0d2T09ROTRhWWd3RDBp?=
 =?utf-8?B?NEtLT2tJbnNjSFpyTUt2dWxCUXlYVjFsL2tBNDVBYVJONG5aT0RPU25GcFpn?=
 =?utf-8?B?RnBISnVNd1Q1U3RrREVwd29nM0NyQnBoNlh2RUFNWDJIUjhFRkhuekV5aURm?=
 =?utf-8?B?RDJGSk41RzJpaFc0YXdJV1ljRnNNUWxMUGhDVGxLcW1heGI4SzF6UE9yKzVT?=
 =?utf-8?B?eWg0U1lIUklUZXZ6dlZKd3Nzb2kwZ2xqWUVnbTh5Z01EK2NKNlRMWkJ2Vlg4?=
 =?utf-8?B?ZWVoVGpyMEFJdERVZG94MG44bm9abE4valJyYmVKMUZ3ZVBCNlVkT2pINmd3?=
 =?utf-8?B?Y0l3bkdWN2VPMFgvMmRheSs3bi9meTh6UnFQT2lnOFhEc1VHdnpBZE82QU9G?=
 =?utf-8?B?WnkzQ0JmbDI5Ynhzc0czVkEzbXJsalFOakRoZkJuQ2xvYWhINTVpNG5od3d6?=
 =?utf-8?B?d1BPVU9URG5wNEcvMG81WUtWOWp6TThxc2FJZlR6ekl1YzEzSE5Tb0Z3SG9q?=
 =?utf-8?B?UzBiNHVSNjhDNEh3WUtibDdrV01aVVpBazYwR2l5Szl4TkhDcExQZDdIdmhM?=
 =?utf-8?B?dkxsUm1uN3ZoYnA3MDhOcDZrcjBhbHdrTXlWOHlMenhuNGduVURzNlJKbXh3?=
 =?utf-8?B?WkJYMW9yZkJCamhBWEVtRU9MbUQ0UzRtM1FkeEhEYWxhMHdxODNHYUFaR25o?=
 =?utf-8?B?Q283SEdWamdLUlNaV1ZXVWljL2ZUUWs2eWh5T0RrR3NIbUE5Umd6VnNsK2F4?=
 =?utf-8?B?aXJCay82M2t2V0NUZFFXRHIvTUR3czdGSEFkc2dmVmhrb1loSis3eUlEVk8z?=
 =?utf-8?B?ZFV4ck1xWVliZ2E5dzhjQ1lCaUd3WXVMUVBzL1YweTVHYXl3N1dYYUt1T09Z?=
 =?utf-8?B?bkVXMTJNTzkyL2hDQW8vVDdOUHNzdGlsOTNRNHNrcklPbVM3RHdYMGFuR2Uw?=
 =?utf-8?B?QjY0Y3JqWW5tYSs0aHdsaklkNzdBVTJTaXpCQ1hiMFN6Z3hGR09IM292YmFM?=
 =?utf-8?B?SzJiKzRYSXdLdXFLTEMzQmxMaDlkQytCVnppbVI3Qk1vMG5ScnpNdnVWWjFP?=
 =?utf-8?B?TitBNXRidnZCZGU0bG0rQ3pwb0EybmpvZ29HRGI0cTVLNzQ2NGdpbkdCdHlo?=
 =?utf-8?B?NytJYlVVMDI5TnQrZDl4VGhrVnkwQ09hVHZyaDQ2QTRrN1FqTzF6Y3daSnZU?=
 =?utf-8?B?Nys3cEdZQlgxdXdsTXV3eFh2SURoS0EwWThZdEtLb0N5eTBXOVp3NU40WW5v?=
 =?utf-8?B?R2VGZ3J5OVpFK2dkeVZiN0pOTlJVaTY2N3kzYXdIMU1ZeGdDeG9YcnNJa0Rj?=
 =?utf-8?B?OXZMb0huSTBERVdlZnpjSEREUnR5MDNudmJuYnNkQ3lSYmlGaXozWm8vQ1Nz?=
 =?utf-8?B?aEdpa0VyZWpZTmxNUFlpSjFTSGp3ajMwcmp6Rm42THNRQitTWE5EYkdwNDk3?=
 =?utf-8?B?M3kzOFJyYmJaWHQ2S2taNEw4UEUwbFdSS2tsMFRpUVlMaTdOb1VZQmNoV1E0?=
 =?utf-8?B?TWRzQ3ZxSXhvMzlWNmJFYzFHYkZiU1MxTFNLMU51RXVYMDNFL0dzT1NQTzRi?=
 =?utf-8?B?dVdjS0RRbkZuWm53SzZRU1FwKzVQR2hnKzV2dkxqSWUwa3E4b0RxU2VtOHJs?=
 =?utf-8?B?WE1wSE1LcUtJVUhPUnhUNWdCbWNKMmY2SUZXalU5VTBUSUMzL0hSblowOHlY?=
 =?utf-8?B?MERQMzhBcXA5YUFXNnlTTXY5M0FHanJNcC9UMDRYVVJUbWZ1K0lUQmNGTWM3?=
 =?utf-8?B?MWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b03318c-cc5b-4bb4-4c5f-08de1605018c
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 09:33:09.1691 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fSqtCFbuyJcZFAfx9CcCU/zFscBb48xDL7hUwMKpNwRN3ALQ3d3onkXpsV4LnsuDHa+s5P8pB+COuRL0xJ+xUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4924
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


On 10/23/2025 17:11, Lucas De Marchi wrote:
> On Wed, Oct 22, 2025 at 11:28:19AM -0700, Matthew Brost wrote:
>> On Tue, Oct 21, 2025 at 10:17:43PM -0700, Lucas De Marchi wrote:
>>> From: Lukasz Laguna <lukasz.laguna@intel.com>
>>>
>>> Trigger MERT's TLB invalidation after LMTT updates ensuring memory
>>> translations remain coherent.
>>>
>>> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
>>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>> ---
>>>  drivers/gpu/drm/xe/regs/xe_mert_regs.h     |  3 +++
>>>  drivers/gpu/drm/xe/xe_device_types.h       |  6 ++++++
>>>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 19 +++++++++++++++++++
>>>  drivers/gpu/drm/xe/xe_irq.c                |  8 ++++++++
>>>  drivers/gpu/drm/xe/xe_sriov_pf.c           |  3 +++
>>>  5 files changed, 39 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/xe/regs/xe_mert_regs.h 
>>> b/drivers/gpu/drm/xe/regs/xe_mert_regs.h
>>> index 5b7c15e08747e..aef66c04901d2 100644
>>> --- a/drivers/gpu/drm/xe/regs/xe_mert_regs.h
>>> +++ b/drivers/gpu/drm/xe/regs/xe_mert_regs.h
>>> @@ -10,4 +10,7 @@
>>>
>>>  #define MERT_LMEM_CFG                XE_REG(0x1448b0)
>>>
>>> +#define MERT_TLB_INV_DESC_A            XE_REG(0x14cf7c)
>>> +#define   MERT_TLB_INV_DESC_A_VALID        REG_BIT(0)
>>> +
>>>  #endif /* _XE_MERT_REGS_H_ */
>>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h 
>>> b/drivers/gpu/drm/xe/xe_device_types.h
>>> index fb401809fae5a..6fcd35bee73b5 100644
>>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>>> @@ -219,6 +219,12 @@ struct xe_tile {
>>>
>>>      /** @debugfs: debugfs directory associated with this tile */
>>>      struct dentry *debugfs;
>>> +
>>> +    /** @mert: MERT-related data */
>>> +    struct {
>>> +        /** @mert.tlb_inv_done: completion of TLB invalidation */
>>> +        struct completion tlb_inv_done;
>>> +    } mert;
>>>  };
>>>
>>>  /**
>>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c 
>>> b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
>>> index c0c0215c07036..ebe81cb21f5ab 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
>>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
>>> @@ -10,6 +10,7 @@
>>>  #include "abi/guc_klvs_abi.h"
>>>
>>>  #include "regs/xe_guc_regs.h"
>>> +#include "regs/xe_mert_regs.h"
>>>
>>>  #include "xe_bo.h"
>>>  #include "xe_device.h"
>>> @@ -31,6 +32,7 @@
>>>  #include "xe_lmtt.h"
>>>  #include "xe_map.h"
>>>  #include "xe_migrate.h"
>>> +#include "xe_mmio.h"
>>>  #include "xe_sriov.h"
>>>  #include "xe_ttm_vram_mgr.h"
>>>  #include "xe_vram_types.h"
>>> @@ -1346,6 +1348,20 @@ static int pf_distribute_config_lmem(struct 
>>> xe_gt *gt, unsigned int vfid, u64 si
>>>      return 0;
>>>  }
>>>
>>> +static void invalidate_mert_lmtt(struct xe_device *xe)
>>> +{
>>> +    const long timeout = HZ / 4;
>>> +    struct xe_tile *tile = xe_device_get_root_tile(xe);
>>> +
>>> +    xe_assert(xe, xe_device_has_mert(xe));
>>> +
>>
>> It is not obvious how upper layers which call this function get
>> exclusive access to what appears to be a per device resource.
>
> this is a static function that will only be called by the function
> below... I think the lockdep should rather be added in that entrypoint?
>
>>
>> Is xe_sriov_pf_master_mutex held here? If so, I'd add a lockdep assert
>> so this is self documenting on how exclusion is achieved and to prevent
>> misuse. If not, you probably need a lock here.
>

xe_sriov_pf_master_mutex is held here, but there can still be a race 
between reinit_completion() and complete(). I'll prepare a new locking 
approach.

Thanks,
Lukasz

> yep, but another question below for Lukasz or you...
>
>>
>> Matt
>>
>>> + reinit_completion(&tile->mert.tlb_inv_done);
>
> is that the right thing here? Is xe_sriov_pf_master_mutex preventing 2
> waiters?
>
> Lucas De Marchi
>
>>> +    xe_mmio_write32(&tile->mmio, MERT_TLB_INV_DESC_A, 
>>> MERT_TLB_INV_DESC_A_VALID);
>>> +
>>> +    if (!wait_for_completion_timeout(&tile->mert.tlb_inv_done, 
>>> timeout))
>>> +        drm_err(&xe->drm, "MERT TLB invalidation timeout\n");
>>> +}
>>> +
>>>  static void pf_force_lmtt_invalidate(struct xe_device *xe)
>>>  {
>>>      struct xe_lmtt *lmtt;
>>> @@ -1359,6 +1375,9 @@ static void pf_force_lmtt_invalidate(struct 
>>> xe_device *xe)
>>>          lmtt = &tile->sriov.pf.lmtt;
>>>          xe_lmtt_invalidate_hw(lmtt);
>>>      }
>>> +
>>> +    if (xe_device_has_mert(xe))
>>> +        invalidate_mert_lmtt(xe);
>>>  }
>>>
>>>  static void pf_reset_vf_lmtt(struct xe_device *xe, unsigned int vfid)
>>> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
>>> index 011b5eb66102f..82bf0d3995dfe 100644
>>> --- a/drivers/gpu/drm/xe/xe_irq.c
>>> +++ b/drivers/gpu/drm/xe/xe_irq.c
>>> @@ -12,6 +12,7 @@
>>>  #include "display/xe_display.h"
>>>  #include "regs/xe_guc_regs.h"
>>>  #include "regs/xe_irq_regs.h"
>>> +#include "regs/xe_mert_regs.h"
>>>  #include "xe_device.h"
>>>  #include "xe_drv.h"
>>>  #include "xe_gsc_proxy.h"
>>> @@ -468,8 +469,15 @@ static void dg1_intr_enable(struct xe_device 
>>> *xe, bool stall)
>>>
>>>  static void mert_irq_handler(struct xe_device *xe, u32 master_ctl)
>>>  {
>>> +    struct xe_tile *tile = xe_device_get_root_tile(xe);
>>> +    u32 reg_val;
>>> +
>>>      if (!(master_ctl & SOC_H2DMEMINT_IRQ))
>>>          return;
>>> +
>>> +    reg_val = xe_mmio_read32(&tile->mmio, MERT_TLB_INV_DESC_A);
>>> +    if (!(reg_val & MERT_TLB_INV_DESC_A_VALID))
>>> +        complete(&tile->mert.tlb_inv_done);
>>>  }
>>>
>>>  /*
>>> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf.c 
>>> b/drivers/gpu/drm/xe/xe_sriov_pf.c
>>> index bc1ab9ee31d92..b40701d75dacb 100644
>>> --- a/drivers/gpu/drm/xe/xe_sriov_pf.c
>>> +++ b/drivers/gpu/drm/xe/xe_sriov_pf.c
>>> @@ -88,6 +88,7 @@ bool xe_sriov_pf_readiness(struct xe_device *xe)
>>>   */
>>>  int xe_sriov_pf_init_early(struct xe_device *xe)
>>>  {
>>> +    struct xe_tile *root_tile = xe_device_get_root_tile(xe);
>>>      int err;
>>>
>>>      xe_assert(xe, IS_SRIOV_PF(xe));
>>> @@ -103,6 +104,8 @@ int xe_sriov_pf_init_early(struct xe_device *xe)
>>>
>>>      xe_sriov_pf_service_init(xe);
>>>
>>> +    init_completion(&root_tile->mert.tlb_inv_done);
>>> +
>>>      return 0;
>>>  }
>>>
>>>
>>> -- 
>>> 2.51.0
>>>
