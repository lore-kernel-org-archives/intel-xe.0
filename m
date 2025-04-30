Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83A2EC369D9
	for <intel-xe@archiver.kernel.org>; Wed, 30 Apr 2025 03:41:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46FFB10E6B4;
	Wed, 30 Apr 2025 03:41:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SlLxXzUi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22A9F10E6B4
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Apr 2025 03:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745984482; x=1777520482;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=BEHd+pZZe7jK9DRhTHaUQb1wpQ8bERd3aA/Nm14zNMU=;
 b=SlLxXzUi6T09Px923bMkHLaS0UmIu9aAPp702aujTkeaODAqoJCBCkn5
 +myGmW5O0kWq3/vcWIFfq3vh036TxGgsVLIekSgjZl8LkxEawvYgjKhBI
 RKvGXA2qpZ2p64Nfz1OUatIjpulOSImKZu+kYKBMcPfJrUfMoqwV/bt/q
 BEKTXfV5wRE3kgBKNKawCrLSpHt405EvDUI/y+pWe+PYyw4zobag4/mM4
 Vd7oUzF7fCtwa0xWlyjY2a87mFNEzds0GNkCFxIGRUD9GO81EiJ7ceTf0
 3e7p6L5CkbtyW+tn5QlH8tX15DGoma9W1BAIvcpumWiGeh3xcAS8H/hLq Q==;
X-CSE-ConnectionGUID: 8t90JFncSHWPn0GIdwYhRQ==
X-CSE-MsgGUID: 6Y2jYiqRST+v2tLdIBnDDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="47642211"
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; d="scan'208";a="47642211"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2025 20:41:21 -0700
X-CSE-ConnectionGUID: f0ZGoRqIR9qIws+7hO34CA==
X-CSE-MsgGUID: lpYYSYrDTb2yLGPX4rdZ/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; d="scan'208";a="134950128"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2025 20:41:20 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 29 Apr 2025 20:41:19 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 29 Apr 2025 20:41:19 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 29 Apr 2025 20:41:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tdV+rq74131h+65L7Eu3drEf6VidjrO7t93Wwca4I+eqnu199Qd4Vd0euOEmXdRpWzbdtLli1RVUG0WN+hwEsvINDhOA1DnaLFv2L/gb8YHnJVu/aWw211bjSTvMCXb+oWlTDpL4EUbsRFeeB6BxGgTkohwCeVJOpyDIw1uYh9ftCKydqzWZfX7pku2FiIHbLiFKjWvjKvQ0o2ZE5t4GyJLD34HuHubGh461fWBDyZERIXVq16IaNL9tGVrdu45gXBh9XOjEbizbCVhSBgR9/dr6frYHpUwOXaOSOzQOtKZ4IV5bPPHXJBQnqHxEnUl5pfsTO5kZwrsNS/nnDMoAAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UY3rbzUAI1tS71FIVcfBRX8I0CJZwt963OtzhooHHbM=;
 b=Msl5X03jFEx/9lTh1WwPlC8EVCW0m3YY4eJUrQ19CXLUA9fJzc8eI61xDFsJajlcS9A1u9UN8M0GFd2D2giWHQ/RUKF9DSNdRFjddElBoL2NkL38Wn+DfK81yM58EBZHviufhZHPAvsNEnfbLtgkd53XW4mb4JIVrPSN8S50i306KWQu4ColznU6WH2B/XnMx/f4ZSN/9LCPjr9h8oaD8lCuPvjVDW31HVPdTRarG/M0PL7W1E1+vkjmPo69BEhZGlSgEiXs6mKqQ/VaSqmfxLikLr4Ykzp1rGvGaM81xgQU5OLAVdn6YzvDNKNlV9n7G7Lvsm5JkK8PyA9Gfk0OrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by CH3PR11MB8416.namprd11.prod.outlook.com (2603:10b6:610:17f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.29; Wed, 30 Apr
 2025 03:40:40 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%5]) with mapi id 15.20.8699.012; Wed, 30 Apr 2025
 03:40:39 +0000
Message-ID: <3b35e81c-d043-4852-bd09-3ded44c28780@intel.com>
Date: Wed, 30 Apr 2025 09:10:33 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 17/20] drm/gpusvm: Introduce
 drm_gpusvm_range_find_or_insert_start() function
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
References: <20250429104233.215602-1-himal.prasad.ghimiray@intel.com>
 <20250429104233.215602-18-himal.prasad.ghimiray@intel.com>
 <aBEb3eB36nXXLIds@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <aBEb3eB36nXXLIds@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0112.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::15) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|CH3PR11MB8416:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e30fabf-f985-4396-a04d-08dd8798c6a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?akFWTUdERVJ0bTY5cFJqTGs2aTRhRXppVjNwR2pCcjBYaFNkUnJ3VUJKeFB1?=
 =?utf-8?B?ODJ4OU8xOFNYeU5FOG91K1k2TEJUVU1UYytsT1ZUbmRnaDdQTTVKNTlNbDZq?=
 =?utf-8?B?L3FkVWplS01pU29WVklKR2JJWk1iN3QvajQvZmxRalR6WTZvbVNMMGQ0eGtm?=
 =?utf-8?B?MW5qK3JBV1k4RG1DMkR6UzFMcXk2UnNsTUh5ckRGd0IxazM4bnh2YWlkVnhL?=
 =?utf-8?B?UlNzdGhnaUNCeVppc2dCcHkwOWhoYUFlaEZraXE3Q0xBUXRnVDIxdys2ZUhU?=
 =?utf-8?B?MnRtcUh5YnNHYXBCUnJSZVJPMlc5OG1DWlNVVUFGZWFTOEhJT21Pd083VU92?=
 =?utf-8?B?YXhydFBoVzVkNk01K2Y1eGhBWmNXbmdlNHQ1K2FOK0VYL2pWQ2w2U2JGT0U0?=
 =?utf-8?B?d3NLc3cvQnlYSlU1Vml5MFhLVDdxbUNYWEErN3ppT0RZS0ZOa1czR3NUTVZC?=
 =?utf-8?B?UVNTeENkdEgxby9rQkZLb1FiZEV5N1M1RWQ3UUtEOVdsMmhOOS9sTVc5LzN5?=
 =?utf-8?B?a3ZkaVBvMUw5NmlJZ1ZDVkV1R1E3Qk8yZHJvMmFkL05wUXdlMi9ZOXlBd1RZ?=
 =?utf-8?B?SzJZci91MVJKSitvbHl3TXV4TlE3QVJFTHZ2N3Z0aEwvNFl1S3gydHlod2RC?=
 =?utf-8?B?NG1WZzVPNnk1bjIwdGlPOFBBQ1drRWFkclk5c2ZFY2J3cTYvalpvTzJhWDFj?=
 =?utf-8?B?aWt0Z0RXS0s2TU44VkdJQjVHZzlqSEJWVERFSDZPMm8ralZSNlI0cENEZUls?=
 =?utf-8?B?Wk82bUhES1RlVWUvZjdQRUx5RDBNT0hFaXpDR3VBc25kemZHb0I4RUYzcXVT?=
 =?utf-8?B?K0xSNThPQTZ6enJiM01KV2YycXh2MkFYbldlMDJOQnlaNG5Vd1Y4OHlKaC9k?=
 =?utf-8?B?cy9uaHVVQlVpVHhTUnozOXFaUFRYZUR5Tll1ejlyVHN0cFdYR2wwUHpLVmRh?=
 =?utf-8?B?b3M0YnM1T0NSN09MRWJ4dmpoZUdNTnFSWUk5VFFYUENRQWZsQU5kaXhuUlFl?=
 =?utf-8?B?YWlWS2dCdGlhZ2pIdXFkeUJWb1JSdmRRSWk1UHIrMTRESG8vWFg4YjBlUFhR?=
 =?utf-8?B?QWpCQVF3VnpaMGxHbGE5MHc3bHR3TUlsOWxYRGhyaFJwc0dndDBId1dza3hj?=
 =?utf-8?B?OXFBU0VZSWNmUnh6VjRJK0luMHZBeTlxWjJHKzIzNFFiQ053MFIvdkFaSFlp?=
 =?utf-8?B?b1NZT2VQaTZIVmUvdjcxWUREekFXQjc1V0k1d0lHTTJLdytydDNOclNyZElv?=
 =?utf-8?B?MURnL25tbzBBVXRsUXZTeHVYaE1ac2pTWnRoR0o1NDdqV3F3VG1FK2htM2Uy?=
 =?utf-8?B?VXJHeGx4Z3JDdiswcE9wVW9zdmtyMkN5ZzdOdnJhMnJNSTBSTW5ya3duTWtS?=
 =?utf-8?B?UjI2dkNiejF0WUlWZnN6TXBlcy9vWjZ4RVo3akwvSW9FY0Rac1puclVzRmNa?=
 =?utf-8?B?NEFPaTNVKzRWOU5Ka2dhTjJUVmFhdmxsdElDenBnbEw3SWE1bVpuWTBzSjht?=
 =?utf-8?B?ZmpHQ1RIaEZjSk5QSWhaYXpBY2V1VWhEWXFVbis3czcxT2kwOUFucjZ5a3I1?=
 =?utf-8?B?WHhzNm5yNXRPUmlDM3dZNDBKYWFWL0pYeUVPVXVNRWl6S0xmS3JTOXlYRUx1?=
 =?utf-8?B?TEdyY1JCOG9hQ2huU0VWUm84NEtha1dPTVEyOFVDNTg4clA3VHNEVlY4Y01M?=
 =?utf-8?B?eVN1bXlJNlI2LzlIeTFJUkNyUHl6VndyTGRyZUNEOWVPZDFuVXBBQ2tiNHNl?=
 =?utf-8?B?RXhwWm1KbkxzWFJpTjRheEo4aXZKU0x1MXBENkVrN3g0ckJLR0EzT0k3TENU?=
 =?utf-8?B?Q21TaWZVUS9JLzJIcWwrK0dlWWZnWEpPelJRTmZRUUt4OWFJbWw4aWo5L1NZ?=
 =?utf-8?B?bFZlQzNZbjc3NGZlbVJTUG1jamdkWjFMS0g4N0MzWmtrSndSUzVFQktqcnZr?=
 =?utf-8?Q?+XPAZ9+wzJU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RlRWdE92MDhZNUlOOHJucmEyTVJuVmtzdDNrZGxDTW5FU3hiOVFPZFhmWkVh?=
 =?utf-8?B?c2RSRmgwcUxIVjR5UlJORE5kTkJpYW5GZnYxdW0xWm1QbXVwSGZpQzUvSDlh?=
 =?utf-8?B?dXQ4NFcrZi90Y2VoM2ZjZDdFSGxoYVUvc1lnbFcxVEF5T3hua0hFUDgwcEpW?=
 =?utf-8?B?WWxoV1hkNEhVY2xvS2pxU25BNXRRMmRTdDNEaFFPQXNxdzU4QXc2cVdNVDBC?=
 =?utf-8?B?dWx6aTVRd2RwMjdHZUdmeG1mbDBWOXBnTElGd1AwTlFkN0FTTkFSMHFMQ3Nw?=
 =?utf-8?B?d1d3Nyt4NjljTXhGRm1iOEJ3eTVLZk9BQVVMYWJTUjFTZHUydmYwc0RnN09P?=
 =?utf-8?B?MnExR3Iya2tNTVB6akd3cjJxR0VubHFpYVAzeG9URGxBRHB3VEE4b0Nmdnpi?=
 =?utf-8?B?a2c5VldoNTVQRzNSOHhVczhIZTA2TlJuL1RQbUQxN0RwY25saHI3cy9qTFFO?=
 =?utf-8?B?VDBPajEzSUxsdUpUZlRCRGpTV1QvbzAwcDVXRnpZUHlmVGcxamZnTy9CSi9G?=
 =?utf-8?B?TlJ4cyt2eElkUGZFcFhDN1hlMHJVUkptZ1NUaWRydEJUT2VzdjFIVi9YMVFC?=
 =?utf-8?B?VjR0ejBYWHl5QWNzdnAxbElUa1VvL3YxOURvRytSUFpod2M4eHNYd3RzNUdp?=
 =?utf-8?B?QWtYNktxRlNvaWF2RThTS05PeDAxYUJSUzUrZTFBZGRkQjNIUXNKb1R2TmI3?=
 =?utf-8?B?a2Z3NnFNQmJ5Y21iSDZzTnBBMjNaYXJ3YTFUOHZOcjlSeUdrZ1pCTjBxTzdx?=
 =?utf-8?B?blNuK01uQU1oM3RVNjQwZllmNmluRGllZHk5Q1pmOFgwWXg1WXdKZ3hDZzJx?=
 =?utf-8?B?ZzlVcXFTOU03NmFXTDVoT3pmQnhqVkgrOVZiNXQrOW9RVlUvTW5CZE5BM1BB?=
 =?utf-8?B?THIwRTRBNkFydEpRQ2FOUkR3VlB5UjRuNzVtc1N2Q3RFRURFaDRhM0UwNEc5?=
 =?utf-8?B?a05TNnRNMzJ2VWQ2dGEwYWtiVHQyZ01wVWdaNmFhZkxSekk3K0lrNEo0SUQw?=
 =?utf-8?B?MUNISFlRUkxjQmR1QmxFaUFNZTlIRlVVTWdYOHNtMnJoUjRaWGN5OGlFVW5P?=
 =?utf-8?B?MENzSGtWcitoc3pXeUpIMGQxazNsZmUwM3Bna1BBaE1WOWR0UFhweHhCOUxu?=
 =?utf-8?B?SjlGVkxDRHloR3VEN1RxaVRtMEZhSXBMOUtFMEhNMXdIbFpGZEV5Nml6WFVh?=
 =?utf-8?B?MzBPRCtlS3Vzb2J2VDUvclY1bVRDUnVRVzNIWE82ZWYxZkRObVhTNFZSQmRS?=
 =?utf-8?B?WWV4R2dnd3BNUUxuK3pnczhYTDV5bnIyNVFQRnFkTGFpcUNvUFA3NElhZ0pJ?=
 =?utf-8?B?YmE2MDRZV1VmWEJQNWpzZ2FZOURCb3RVTFozZjNidHZpNHI2djAyV3d3U0Er?=
 =?utf-8?B?aC9Ic2VDR0VBOVJHN0RlYmpKZHNEYzFqMDZYWTlncEJ0c1VWa0lyNDBOeHZX?=
 =?utf-8?B?anI3UGRpSTNZeTAyNWs2NVVSSytNVmdpQ0dHM2M5ZWpwNHlIVzJVcnJ4YU9l?=
 =?utf-8?B?cEN6SGhLWjFsZnNKdE5uRE5Gb2I4aXhpZERHUkN0UVNsQmtGcml4eWQ0b1Vx?=
 =?utf-8?B?NEhzK3lpZUVmaERhU2g5bW1xRDFsOGRxSUNDdW54UUxvbFR6eXloVjlXVjlt?=
 =?utf-8?B?TTdPNXppdHMrSmpVeVZ4WWRNNnk3S0JsSjV1ZW1YZEJXdnFLaVdhWFYydDZt?=
 =?utf-8?B?ZnBWWmRsaHhRekpuZ3FFZUN0MUlVOVRNSHpJUk9oUVpDZE9LWXdwRFZkVDRp?=
 =?utf-8?B?QVpleE1zMTkwYmR2OWRXc2dLLzJnN0hRL1BLdnBNS2ZWVitFZE8wUWM0REM3?=
 =?utf-8?B?dFZjVkErREFuNVV6ZFFKeGpEK3RsZHRKbFdjR0w5c0dqQ05ZR0tnRDd5T1FE?=
 =?utf-8?B?U0lGQXRDZWZId2tkTktlMi8vUW92QkpEOFpaUjluRmVxL01UdnIzeFBOL3RY?=
 =?utf-8?B?c0N1Z2toU05rZjlYWjFocm04TzNNNFUxK1h0UkhoRXAvak0yRUw3dGsvQ1lD?=
 =?utf-8?B?N05jQlliYnFvTlYrN2U2TUQ5UC9BSFU3U1VUUk9IK2J1UkZjb2RjZndPcGlG?=
 =?utf-8?B?akR3K09yM1pXWnB2aUJEZzRJL3F6UmRXejF3TEQxcmRlNk5lNzF5cDhFVzI2?=
 =?utf-8?B?SHFiVTBUdUJBYjBrT2hyTHlHRVdmMmIzeUtxbW9aUmtqZ2VDeDhQczZIRUtu?=
 =?utf-8?Q?NyQJYYSYq4R8FpVnF+yBZkg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e30fabf-f985-4396-a04d-08dd8798c6a5
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 03:40:39.7220 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W6Ebd5y4Em7fdNYYVfVaxegLgwPSTKT5rs/eHRY2KvYUnZD+1hhZzMfzJ3C3Yuu1825dYXRbczoSDa95dK4rBKbivDrPjlTDuJHZwsyujuM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8416
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



On 30-04-2025 00:05, Matthew Brost wrote:
> On Tue, Apr 29, 2025 at 04:12:30PM +0530, Himal Prasad Ghimiray wrote:
>> The drm_gpusvm_range_find_or_insert_start() function is used to
>> determine the starting address of a CPU VMA within a specified user
>> range. If the range does not contain any VMA, the function returns
>> ULONG_MAX.
>>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> ---
>>   drivers/gpu/drm/drm_gpusvm.c | 29 +++++++++++++++++++++++++++++
>>   include/drm/drm_gpusvm.h     |  5 +++++
>>   2 files changed, 34 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
>> index 40a56f38ff8e..bb7c589b8d15 100644
>> --- a/drivers/gpu/drm/drm_gpusvm.c
>> +++ b/drivers/gpu/drm/drm_gpusvm.c
>> @@ -980,6 +980,35 @@ static void drm_gpusvm_driver_lock_held(struct drm_gpusvm *gpusvm)
>>   }
>>   #endif
>>   
>> +/**
>> + * drm_gpusvm_range_find_or_insert_start() - Find or insert start address for range
>> + * @gpusvm: Pointer to the GPU SVM structure
>> + * @start: The inclusive start user address.
>> + * @end: The exclusive end user address.
>> + *
>> + * Returns: The start address of first VMA within the provided range,
>> + * ULONG_MAX otherwise. Assumes start_addr < end_addr.
>> + */
>> +unsigned long
>> +drm_gpusvm_range_find_or_insert_start(struct drm_gpusvm *gpusvm,
>> +				      unsigned long start,
>> +				      unsigned long end)
> 
> We don't really do an insertion here, so maybe:
> 
> s/drm_gpusvm_range_find_or_insert_start/drm_gpusvm_find_vma_start

Sure.

> 
>> +{
>> +	struct mm_struct *mm = gpusvm->mm;
>> +	struct vm_area_struct *vma;
>> +	unsigned long addr = ULONG_MAX;

Does this return in case of no vma found makes sense to you ?
Initially I thought of returning 0, but wasn't sure whether under any 
scenario cpu vma can start at 0 or not.

>> +
> 
> Hmm, do you think we need a mmget here? I'd expect this be called from a
> user context where we'd have a MM ref but maybe to be safe add a
> mmget/put?
Yup, mmget/mmput makes it more reliable. Will add it

> 
> Matt
> 
>> +	mmap_read_lock(mm);
>> +
>> +	vma = find_vma_intersection(mm, start, end);
>> +	if (vma)
>> +		addr =  vma->vm_start;
>> +
>> +	mmap_read_unlock(mm);
>> +	return addr;
>> +}
>> +EXPORT_SYMBOL_GPL(drm_gpusvm_range_find_or_insert_start);
>> +
>>   /**
>>    * drm_gpusvm_range_find_or_insert() - Find or insert GPU SVM range
>>    * @gpusvm: Pointer to the GPU SVM structure
>> diff --git a/include/drm/drm_gpusvm.h b/include/drm/drm_gpusvm.h
>> index cce217bc136f..b0e9ee5c6226 100644
>> --- a/include/drm/drm_gpusvm.h
>> +++ b/include/drm/drm_gpusvm.h
>> @@ -315,6 +315,11 @@ void drm_gpusvm_fini(struct drm_gpusvm *gpusvm);
>>   
>>   void drm_gpusvm_free(struct drm_gpusvm *gpusvm);
>>   
>> +unsigned long
>> +drm_gpusvm_range_find_or_insert_start(struct drm_gpusvm *gpusvm,
>> +				      unsigned long start,
>> +				      unsigned long end);
>> +
>>   struct drm_gpusvm_range *
>>   drm_gpusvm_range_find_or_insert(struct drm_gpusvm *gpusvm,
>>   				unsigned long fault_addr,
>> -- 
>> 2.34.1
>>

