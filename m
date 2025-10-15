Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 865B4CCD18E
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 02:47:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3295410E6D3;
	Wed, 15 Oct 2025 02:47:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MtU47P5J";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC7D610E6D3
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Oct 2025 02:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760496446; x=1792032446;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xAE7iRZTweOwsODzfR8DJ1A+4cTh08iFRC50Y4SDbBI=;
 b=MtU47P5JYT1fFrbx1uCSE6yXUhfjrp1C//1x0caEcLmCcawHlFIMlSJL
 AKgZI7bnsGG3wZtOd+lH2KyZtxD8Pe8oKHOIuyaEVLB0PbRoai7ogF5k+
 oFfB8LfQIP6XPhpdTd1NdoRPQdACp0aDc7PyrzLekYMd0O+hf7eYCzo0W
 8pHvDmBABYYZ7l/hQwcnYnlp772HXxTcpAV/RurTiRzaLABTogGSvz8oH
 c6ulbCa/C+P5oUi65uMP3VclhYTSCVN3I9ZRXtHCyxdUqtV1/dU8xbnST
 CbYCLDqd1O0GR+BuuGdouOP4bt69E9GRpKXUkqqFTw6msMVQyVZkMItHv A==;
X-CSE-ConnectionGUID: WceyeoBtSvy6iGmSeYGp4w==
X-CSE-MsgGUID: lP7CYqSeSc+F5m8pxjWkdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="62559111"
X-IronPort-AV: E=Sophos;i="6.19,230,1754982000"; d="scan'208";a="62559111"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 19:47:26 -0700
X-CSE-ConnectionGUID: 6R0VXEzzQAyXNL/B3nx+6g==
X-CSE-MsgGUID: ik1IyyS1THGmHzpzFmz9CQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,230,1754982000"; d="scan'208";a="186294216"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 19:47:26 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 19:47:24 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 14 Oct 2025 19:47:24 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.24) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 19:47:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oLthmJ1cu8KQHR6MIlO5dz9dCMricwmNHr00eXcmvYnXim2k/NlTWTD/c1Y9dYINiqinvlrgPyw3ykzYk3ZIEuonaQ3UM2FH7cyBqARv5CM8cHsckOZgGwXrLTa349FwkCDbTSrPE8KnFUW0ePWo+8JMiJ4Ys/0J3PlOlMzMjm0l6pCYy9EDgplXfixq18sjwTja7u9MXX4cyybKSHbj84Mc1cnPVB73KawgxPDc13jhImnpKGcrBhC/N8WX9mugocjP2CL5vEQU/bu5U06t4+P2qEr1v5CDCz7xZXPCl9jIpEe9wxdUFtJzeHOJmHmrs4/jgCMpEOzXeZ/RjMwkrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4OKY+sN3y6AE/gS1QeRJPBYhcNnI+yJ3wiAogTkY7PY=;
 b=fsbIRI8/4phXKk03cj9/mRUFxL6ikU+k1hx2UtvO8fwvf2F+cbIfc1Il3U14ThQeEtSA+m/nyhLjKNkabknYEGViKkcvyAsWz3DqildFlt4tU5rZyX2UHAcBsDju3vNAe1fgVJzxs1PksV3AosLZn6+UEy8FJ/B5py0ALhpMA1b9IVJyTLg1U5YpaOBzLB7b//r5b0rnJ4zpoG9ufsJh2NVYLucz4+cEf/RZE1c2edBuT0Nr5G0W7+je9FCmbkTC/IznR2N9kwn7OnNupzYEwqwXXxwOX6KMojwjcKmW3KD6mgY9lJbjuD9bdhzWWSfnWvx/UbEkjBX975Sc3Qq0Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV8PR11MB8607.namprd11.prod.outlook.com (2603:10b6:408:1ec::18)
 by CY5PR11MB6209.namprd11.prod.outlook.com (2603:10b6:930:27::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Wed, 15 Oct
 2025 02:47:17 +0000
Received: from LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::55b1:592:df13:a9f3]) by LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::55b1:592:df13:a9f3%5]) with mapi id 15.20.9203.009; Wed, 15 Oct 2025
 02:47:16 +0000
Message-ID: <dc5015d9-cafd-4ed8-b975-9a556fa589c9@intel.com>
Date: Wed, 15 Oct 2025 08:17:08 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/23] drm/xe/xe3p_xpc: Add Xe3p_XPC IP definition
To: Matt Roper <matthew.d.roper@intel.com>
CC: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>, Balasubramani Vivekanandan
 <balasubramani.vivekanandan@intel.com>, Tejas Upadhyay
 <tejas.upadhyay@intel.com>
References: <20251013-xe3p-v1-0-bfb74f038215@intel.com>
 <20251013-xe3p-v1-17-bfb74f038215@intel.com>
 <e06bc7ee-e672-41b6-b911-51c90e73e8c7@intel.com>
 <20251014173311.GV5409@mdroper-desk1.amr.corp.intel.com>
Content-Language: en-US
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
In-Reply-To: <20251014173311.GV5409@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0147.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d7::9) To LV8PR11MB8607.namprd11.prod.outlook.com
 (2603:10b6:408:1ec::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR11MB8607:EE_|CY5PR11MB6209:EE_
X-MS-Office365-Filtering-Correlation-Id: 57d84bac-e9cd-427c-ba10-08de0b952681
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YnJ3TzFXNEx6ekN1aXFiZWlQQy9XckpMZXJ4UU1WQUx5RkdCd2xEUko4Q2ZH?=
 =?utf-8?B?c2xmQUIrMFQvQTNiN0Nyei9MYWc1SVpiVnZoTzhXSUxpS01ReWVGeHJudkFK?=
 =?utf-8?B?NWltSzEvQVpjZXFaTG9BMjB2Mm5LL1VWTitPaUg3eW1uOTR3WFYxbVFOZVll?=
 =?utf-8?B?d2c3T0VqbzBGOGh5cEJmeEp3NzV3ZUdVZ1g2Q1ZqdWlITERidWR1VzJQOG5m?=
 =?utf-8?B?dlYrbzRLUklWZU5IT0xWRVpObjFwVW9uRWthMlhnY2lxclM0K1ZwcE9ZK2ty?=
 =?utf-8?B?dm4wT3BmSURzZUYwbXBscnMzUjlLZ2hYYk9XYVJhOUlackxRTmRtWEFOVXlj?=
 =?utf-8?B?NVBabHVOT0FEenNQdFU2Wm1rcnJKOXM3aStsVTg1N3oydWVDV0xPeHN1L1JE?=
 =?utf-8?B?ODhvR2tsMWNOdlU5UCtpWU51ME9mQ0NaTFBqWTZlTWZTNnRUOFFJRkJNckc5?=
 =?utf-8?B?QkUwVmdCYStKbnpxeFpkWGhxcUVqa1JyUXRXd2pVTzlBM3lxVUZLSkNTK1VK?=
 =?utf-8?B?Z3lTM3Z2Vzc2cTlTVW5jdHEvS3YrM2Q5OTNCQTFXRmhXRndja0QrWVJHMk5R?=
 =?utf-8?B?a3QzTHNlN1ZZT2FIRlhDczJrb2JtYnBUS085N0ZWRzg4OWplUnM0bk9XT3NL?=
 =?utf-8?B?N3ZSaDhwdzVoeXdvb1UxQjJQeTlVVnNsRVhZVEp4RlpWekkzYmFpVmNwM0t6?=
 =?utf-8?B?b2ZLd0QxM3JReWp6QVFMM1dJd1ZRMkFJeUtlVkVKVm1NdnhFNzZBL3IzUUpm?=
 =?utf-8?B?VGFrb2JtSEtIdGFpaEltcE1YcjMvMGNEQnFMQkNrSHl6SDl2dU1NaEtCTlJT?=
 =?utf-8?B?OFJlb051NWw2a2lLcDBCQmp2ZGlsYjF5S1MrTWhlWFNrYkRBSXBDVytDRk4v?=
 =?utf-8?B?VEVCVkZpeVFDWUhVWWt1UTdZSGl3OURab2VaT0dWV0luVkdUdFpJaFdaa2lJ?=
 =?utf-8?B?SkJMeVdrS3hjN0lWU3l4ZWJkMVdXVUxlZXNxOE1hVmVXR1hEMmdoakZxZW1C?=
 =?utf-8?B?c25lYURBZHI4SnVqc2svYlRmSSs3WWRhUXNQbFhLWEpvczVpdkR5TXFqZVhi?=
 =?utf-8?B?RHpyeGJXNVlYdE54MkJ6SmFaWDdxMnhYYXJhM1Y5N21mWnNZRUNTT3VlMnRY?=
 =?utf-8?B?QktabUxENk45Tnc4RjNkdWc5WWg0TWlOb1BjZHRrbk5rZFBlS2RoN1l2QXc0?=
 =?utf-8?B?U2hOR3R1STNyMUNrS3dxTnFSQzcwSnQxRHZqamJlR0hOZEt0SHdMcTBSMDY0?=
 =?utf-8?B?bjNHTW54NTlmQ3BiQjR6K1M4dlBrNDFEZ2xBREtaSUlZWEN5NWZqb0NpNFk2?=
 =?utf-8?B?aHFqWjlaTXhIWW5HMkE1T3lkellqWTRKUEtwZ25taW9SMi9xV3dZMmV5c2Na?=
 =?utf-8?B?dHdrMjBMV3FJSGM2NUM2YTEvbndENWxVRjNjSXBnYy9VOHFVMG5Hb0hrQk9i?=
 =?utf-8?B?TXFETVdFak9keEcyZmZVaG5iN3FubytZTDB4YzF3dXE5RDZmQXVCRHF6YmQ1?=
 =?utf-8?B?SjZ1bmtyVGJZd08wL1dJelBKWE83cXMxai9Kdm9wbnh6MlNVY0J4dVlMQWxx?=
 =?utf-8?B?VDc2S0Z3UjQ1dFhDajFZZUFFcnlydDQ1STh6SkRoa1VNbDZsaU1UMGZTVk92?=
 =?utf-8?B?RXY4clljVndQZnEzbUJpdndDeUNBKzBER0tKZlBaK0h6SnUvWkE0Q1VmMDk0?=
 =?utf-8?B?dlNBaUlyM2pnTi9MSTBQWVRrYlhFb0VQelB0QzUzdXhydnVEUjhaSHNrSjFJ?=
 =?utf-8?B?WWw1aU5INEhSRVBqWktSaGE3TjRtWnlwL2ZZdTgxUjdrbnl4Y0NVTXpndHFP?=
 =?utf-8?B?ZVBmM2hULzdwWEZRVkNSZjRCK0xzLzYxbHJoM0J6Nk9ZQnlEMGl5OTI0dzZh?=
 =?utf-8?B?R2U2SW5GWmhMYVh1V3l5cG10K245dHI2NGpBM2lRcGRna2pKbDkxR053UGtM?=
 =?utf-8?Q?iMILvD08/33RiByVPEaqB1Of1JvAKKQg?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR11MB8607.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ajNGU0lSZG0wR2Vhc1p1UXBHOHptZk1WTHVSdUZ0VDN1Vmp0N1AraHpQdXlE?=
 =?utf-8?B?QThWMlc0OU5BdXdhRDJuNW5xWDFvN0t0SmhQQnZLdlhjZlhCM0QzWDN2MDk3?=
 =?utf-8?B?MHZzYzFnNVhDQ0NuQXlJTmhMNFk3M012VEhlLzRJc1JVODdmemplZWU1dHZx?=
 =?utf-8?B?NThPUVIzZXJWZ0MrYXlTdTNYa2wyU0hYeVBaNEdSVmdGTXdRQWFiTitPKzBm?=
 =?utf-8?B?N3JmMWtkWjMyR2w3Z3dFcENGWVl3SjA5ZnV5QURENjc1MEZlNTUwaWxqZ21N?=
 =?utf-8?B?RHZqcjlpVllzWmdkK3U4MVRUS2JqaS93QTZ4SWtGc2NSZ2xIYVhoL0RmM3hk?=
 =?utf-8?B?WXlabVZraWhuaWVrVm4wYlRkaDBwM045NWFXSWRuK1lzeE9FcVNsMkxZbGox?=
 =?utf-8?B?Z1BISlpJUVZtTmMvMExTOFhwL2hYR1N5VU9yd2pzeEZ5Y2FiSXVkUExTb2R2?=
 =?utf-8?B?bHVQVWZKUzE1WEQ2RGlpdkp4VndXV0ZKMEYwMEVsemtvNVorQVRsYzFMeGY1?=
 =?utf-8?B?RFhid2N6eURySytGbWRaSVlEU3B6ZzlOYTIvRkFBcE9BK21DeVh2b3BpVmlS?=
 =?utf-8?B?WkhZSXU5WkdudThuZFFNWHRjYmsrbzhXNXdIRVRHc2JFYXd3RGt1VTFyZUt2?=
 =?utf-8?B?am5xR0Vsano2d25UREFRZVFnR1Nicm92MFQ5c2NKS0x4cGJ2ZkNBVWd4elNz?=
 =?utf-8?B?UjJ2czJWc1QzcmY4VTlYQVJKUkFOaFVFenE5by9qV0pyK2QrNFE3YzIwR2ZW?=
 =?utf-8?B?QmZUNW5xVFE5aXQxYWs2UEVaNEMwRW1kRFZCdDREUTBSZkxpQm5yTU5mWU8y?=
 =?utf-8?B?VmdCV2xkc01aTkNqTTBnaE1vUlNxdjJpQ3hlZ0pJS0Z0akFqcXJjZEltMU16?=
 =?utf-8?B?NU43MFJpQ3JzMndBdUVGSWswWFVMejFwcFpLSHIzeXFvSVVPK3BQR0lTNkVh?=
 =?utf-8?B?bkMzSDlkeC9jV1RDbzkwUGFFWVJwbTlHelBrc0R3OHVPS0lOdVh1OWlsbW1C?=
 =?utf-8?B?cU1LbzdrVWxUSC9Xd2ZKS0VNRkJ5U1NrYkNLTVJ4QmwxYXpSMkcwbnF6Y3dm?=
 =?utf-8?B?TWR0b1VuVkIzUlVNbFpTU3oxSjlMZEhyVk5tMzBVRE96bm5tZlI4MmJKMGNM?=
 =?utf-8?B?NjQzZDJab2hiQ0cyZmtYV01CUHRIYm8zQ1JLNHNFK2RqQ1hObDl2VmFxeXRQ?=
 =?utf-8?B?NmxXTkxRUTRWblZ6Yk5BS3ZqMnRhZlc5aHVIMjR3TGtKRnpSY0pjNnJua3VR?=
 =?utf-8?B?TlYxbnluSytkREZBcHg4czJiQ3V6T1BiazNVVGpwTFh0cU5jVDl1STEyWU5L?=
 =?utf-8?B?Rmp3NDkrYytWRlFYWnduSlQzcVlpQW9HbU1TalBQSDdLUk9BRTZiWXJOV281?=
 =?utf-8?B?OTYreGd5UU12NmxTdUUzNFM4S0x6eGhHSDBuNUhJcUFrQkhOODdldFN4dWJT?=
 =?utf-8?B?UEtIak1wK2Nha2M2Z3BvNDI5Z2ZMakxOYlFnWHlkWnJadWZuQVhOSzQ1OEZT?=
 =?utf-8?B?Y0pyMnp2dDFhNjJ5ZnV0alRZcERETUNZMG1CekZBVnpQWkk4bXg1bDEveWpS?=
 =?utf-8?B?RzcrUEtsY3dTb3h6TnYvdTljNWdPYVFOeXBxK2NvM3gwMGJlVWJtdzgzT0Vj?=
 =?utf-8?B?cFlLUmhTSmcxRWVvWGRKekJnTHd6ZEcrMWhYTjlQWUJaLzI5SHN5akRNSkdC?=
 =?utf-8?B?TGFZTUo5dHY1bUpmUTFjVkhxYUNITXh2MThaZkwwaEEyRE9MeWw3WHNNYURD?=
 =?utf-8?B?NmtkL21kZWNFOWxUeUtVQnJub1RCa21Td0dnSldSNHZJaUsvR21maExyWkhL?=
 =?utf-8?B?ZWJEY0w2ZW52b2QvSTFRMXJsaWdUT05Wa0JWMWk2dGlDUGRBNWtlOU9ydWJD?=
 =?utf-8?B?aXpLZnVjNTlGSFdhR0RnakltOWZyb1d6bE5DU0NKT1IzMi9YZXBVTklJaVFS?=
 =?utf-8?B?UzBzRllTWDRuNFdLSnVBcnBRTEFZejRrQjNuVERMUDhoVWtLV0pkRHNLTTJY?=
 =?utf-8?B?OXp1L1E1WWVaRng1cE9XMHovNGlRTEJsOXRRa0pZWUJJdHlrdHZXUHRLRHNG?=
 =?utf-8?B?TGRxZk43M1NEeGp5ckhHQlFEaE1uMjNiNXcySmVtT3UrMHZxYk1HOVVZMVkv?=
 =?utf-8?B?MjFBVVhZbzFua1ZISGN0NmVOdG92VFJjZldXZEc4ZmV6TVBVOTNTMXdPNmlT?=
 =?utf-8?B?Y0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 57d84bac-e9cd-427c-ba10-08de0b952681
X-MS-Exchange-CrossTenant-AuthSource: LV8PR11MB8607.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 02:47:16.1820 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /t3HteejrvfKGBNBdNc96QH+6EqRBJR72TttWew9OY18YTzUI7typIAkOMVXrxys+WpagfRQ4kUslqlPlxh7+bS5gX/UGSzPERS8EZ2HIwk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6209
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


On 10/14/2025 23:03, Matt Roper wrote:
> On Tue, Oct 14, 2025 at 01:34:30PM +0530, Shekhar Chauhan wrote:
>> On 10/14/2025 8:54, Lucas De Marchi wrote:
>>> From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
>>>
>>> Add support for graphics IP Xe3p_XPC having IP version 35.11.
>>>
>>> Bspec: 77979, 77975
>>> Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
>>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>> ---
>>>    drivers/gpu/drm/xe/xe_pci.c | 10 ++++++++++
>>>    1 file changed, 10 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>>> index aa8359a4c5594..83e5e0c314a42 100644
>>> --- a/drivers/gpu/drm/xe/xe_pci.c
>>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>>> @@ -119,6 +119,15 @@ static const struct xe_graphics_desc graphics_xe2 = {
>>>    	XE2_GFX_FEATURES,
>>>    };
>>> +static const struct xe_graphics_desc graphics_xe3p_xpc = {
>>> +	XE2_GFX_FEATURES,
>>> +	.hw_engine_mask =
>>> +		GENMASK(XE_HW_ENGINE_BCS8, XE_HW_ENGINE_BCS1) |
>> In Bspec, I see the number of RES_COPY_ENGINES as 0, which signals that
>> there is no BCS0. But, at the same time, I see SERVICE_COPY_ENGINES as 0.
>> So, why are we having a mask from BCS1 to BCS8? Maybe I'm interpreting the
>> table wrong in some way.
> The table on page 74110?  I see all non-zero values for
> SERVICE_COPY_ENGINES (which makes sense because I don't think we'd be
> able to function at all without at least one copy engine to assist with
> various vram operations).
>
> But note that the details on that page are product/SKU-specific numbers
> and not something we're allowed to hardcode in the driver.  In general
> we have a way to discover the presence/absence of up to 8 engines via
> fuses, so we give a mask that matches what the fuses allow us to
> discover.  The actual engine mask will get reduced down during
> initialization according to what we discover upon fuse readout.  We do
> the same thing with other engine types that are runtime discoverable as
> well.
>
>
> Matt

Okay okay, thanks

-shekhar

>
>> But, aside from this change, other changes look fine, I can provide the RB
>> once the above query is clarified.
>>
>>> +		GENMASK(XE_HW_ENGINE_CCS3, XE_HW_ENGINE_CCS0),
>>> +	.va_bits = 57,
>>> +	.has_flat_ccs = false,
>>> +};
>>> +
>>>    static const struct xe_media_desc media_xem = {
>>>    	.hw_engine_mask =
>>>    		GENMASK(XE_HW_ENGINE_VCS7, XE_HW_ENGINE_VCS0) |
>>> @@ -151,6 +160,7 @@ static const struct xe_ip graphics_ips[] = {
>>>    	{ 3003, "Xe3_LPG", &graphics_xe2 },
>>>    	{ 3004, "Xe3_LPG", &graphics_xe2 },
>>>    	{ 3005, "Xe3_LPG", &graphics_xe2 },
>>> +	{ 3511, "Xe3p_XPC", &graphics_xe3p_xpc },
>>>    };
>>>    /* Pre-GMDID Media IPs */
>>>
