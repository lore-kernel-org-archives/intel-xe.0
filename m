Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98E2BE7717D
	for <intel-xe@archiver.kernel.org>; Mon,  9 Dec 2024 16:50:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 615F810E4B6;
	Mon,  9 Dec 2024 16:50:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dxMwhfSA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1FC210E4D4
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Dec 2024 16:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733763018; x=1765299018;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=CbechIoviQT1jVKGATzq8fh75aRCcOhmCg2L0YVKlcw=;
 b=dxMwhfSA5dgtZneT7edJDPRxVVExzriZJPReWoXHfc21T71ZK/uXHMIy
 sh/nPY0slMmtCU5uHH3nxhIfQYzvuVIPnkFF96BeexFw3QHtmmKnfB738
 BkfYhAFuQEkchmVTLmBgyNRe9Zei2sn9angd6b3W0aP0UNYsXncw5L6zA
 4+Keq14MiEKSNB+cIFj0bgyf/Yp9zLvHGs4875P3Eh6SCZkEGjK9upoR7
 BwZ4HYsxeGYpaqkzCaC9EEFFYlgBDotKTbhdljBchNqCjUaPWr4tgUCKT
 K53KqZbc6bxs1D9+dyg/XvMj3sohyOQBD6AIdkIXh6ruzw90igyJ2WG1/ g==;
X-CSE-ConnectionGUID: cYqQZMKnSTGi4vWnC62ccA==
X-CSE-MsgGUID: kMIahrS8R/CsD2cCUXzuag==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="44541807"
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; d="scan'208";a="44541807"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 08:50:05 -0800
X-CSE-ConnectionGUID: a5TzhZTsQn2e1CTCnh0XoA==
X-CSE-MsgGUID: 84DPHiS4RDackzRHHQ9ONA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; d="scan'208";a="118376580"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Dec 2024 08:50:05 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 9 Dec 2024 08:50:04 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 9 Dec 2024 08:50:04 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 9 Dec 2024 08:50:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NxcA38X/fU67Aj6TzQu0v3nts4R6TFwPzDuV684gXqcD9dJfvxrTMKV5N7xCd11MR12OCbaatHdcdJE5bPqyDtckd2jSCzt4mXZYLv2ph+C6fbP6/Uutp7wNbfXu6DvdRLkQZHQ1v28wNcUdVtjZlg1RBl7xYxylcRvs/JTRDtyA4mRzK4/SK/XU8v3kio1t/+1FbISAcgqC/ChuxOlokTSkUnpXJb3kTB2IH+HyHecAe1jEr3d12WfApppZaR2Vt6BfjNbHdMOrvTMlVp8Jkryyj3SfCHAcHa8w2ZaJXMh9DhDssfMqUYLCcKJlLy/sM04irBCq4fawHdHegf4TSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=esOHDJiMgqjOwVhXI7C6X+3SZKqshftQUaYu5seZc3g=;
 b=CkFWF5T48kq59v60w0mZlKjWp3LHfHhnc1DCLVGmyQFN6+hFORDLRtEj3MpxHxJMwTLSpOOwl3AyFALBd6R/JGRAhYzhahEWM25yx3C6MVoGl7W2ZyXAX/Q4gVz6Q+Q3aTJY5IOlgtAkHWrI1upHMTLEM6LUzhoDIpIAxm+Wtnk6Q8Ei9y9qlSDbhr/MGbtvYsJDNal+WaX0/D70HpIdE9wnIFAClPRKn13uA7TkF8T4eFfm7zx3KqmOWhdmTy0oB0NxUM2NvMPW5azstx4QvX/P1B6CYj0eEH0PElwrciFvbTXGsDNEEpYIy17UK7OtiVbZ1dTdzUgPlXiMVEBelw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by MN6PR11MB8172.namprd11.prod.outlook.com (2603:10b6:208:478::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.17; Mon, 9 Dec
 2024 16:50:01 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.8207.014; Mon, 9 Dec 2024
 16:50:01 +0000
Date: Mon, 9 Dec 2024 11:49:58 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Mirsad Todorovac <mtodorovac69@gmail.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v1 1/1] drm/xe: fix the ERR_PTR() returned on failure to
 allocate tiny pt
Message-ID: <Z1cfti-AJCku7BWS@intel.com>
References: <20241121212057.1526634-2-mtodorovac69@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241121212057.1526634-2-mtodorovac69@gmail.com>
X-ClientProxiedBy: MW4PR04CA0226.namprd04.prod.outlook.com
 (2603:10b6:303:87::21) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|MN6PR11MB8172:EE_
X-MS-Office365-Filtering-Correlation-Id: 592d0d70-e883-42df-7000-08dd187185f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eFIyOFZiaEcyS2FFRlEyUVhPTy9reDBlOFVBTHB5M3BiZ3I5aXJWK0IxT2ZP?=
 =?utf-8?B?OVgwUnQ1b0Rvd3dUek9vNmdPSENvVDVWbzA5bWhqWDVlUkJ1Z1lSaC93SHR1?=
 =?utf-8?B?a1MrQ0FGRGxURTV1WlZiVkl1M0cvSjd4Y25PaGliZDViTkNXZUp0ZDVkWE9X?=
 =?utf-8?B?dndPcFZabTZLRmg0VGFVWFVERHo4bkpCSUlNb0VEQW9GSzhHQVY0aHEvMnhZ?=
 =?utf-8?B?U29GZHFqOTRiZWJhMHdQYXMzWGhtRmZJMDJNQ1RwTTJEenp1U2FoRkhnZ3hq?=
 =?utf-8?B?c1pCMGlxNzlKbWp3aGF0YkRwZ3I1U2x6V2FqY1l1c09TMjJmekp1V3ZYZGNE?=
 =?utf-8?B?a3VId2JwRGNuaThNRjRvWnJyZ1Q1aUc1TS9EdVNoL2dDYUVrR0JtK3Z2ZmQ1?=
 =?utf-8?B?aE9oR291OHI3Y0tDMXE4ZUV2a1dQbGtJeVpZdGF2VjNEbi9rbkhJTHJRMmda?=
 =?utf-8?B?WDZJOW14UnBPYi81ZFlkazk3VmlBWjZJRUZud1grNzVjaFJoOFNjR1gwQStD?=
 =?utf-8?B?ekttRG1yT2h4NjYxYUswQjdSVGR5NkM5NlZjbzJDMnNLVFN1eXcvUW1DeEFS?=
 =?utf-8?B?TG9aMzMxWGlaZTd3RWx2RFZsWlEvRmhySXNuQXZ0VlFKcG9mZElPUGVZNzZE?=
 =?utf-8?B?SlNtUVE0eXVpWnJzaEI4T0RqMFFyZUxxQlZ0Wk1GWVdVblFnMGpRYW4yYkYz?=
 =?utf-8?B?MWdob3ZHWHR1Z0FUQXhpVlpOOVdUWnRvWWJsWWZYMVZHWUs3WnMxVmdxaWdo?=
 =?utf-8?B?WGNzWnlpMFZjUnhOR1oyM0hFV1Z4WkNDbkJkLzVjeXVMY2tJTk9rUGE3L2NY?=
 =?utf-8?B?KzVwQ094NGd3djloNFFPVVU4LzZHcFJER3B0NUFCT1dWZkordW5ObUhzbzY5?=
 =?utf-8?B?eUNUQ2pYWTFmV1gvWjgvalRwRWtyejYvWFJPRURwbEVTVTZNU0dCR1NIL05l?=
 =?utf-8?B?bzFaUnA2NUUzL1d3WTUzWWtRQTAwTEk5cTBOL2NMRUZHOXk2VDczZ1FMQ0lT?=
 =?utf-8?B?a3p2cldYU2tPS3FzSDJtREk1YXJWdE82cHAyRWFFa1hiOW80VGpGM3BrTDNF?=
 =?utf-8?B?eDRpaUxOdzQ2UkxpWVl6QVVPYjlIMmFVTmdtWlJML1p1UlNMWnpoYmZ3bnht?=
 =?utf-8?B?N2xOOUd1YXVKdHBBbkV5VFV1T3E0bmNET3M5aGZ5ZjBhVGJUd1FHeXF3WVQy?=
 =?utf-8?B?UVFuM1VzSFdRNDBZWWl2a0ZiODBiLzdiU1pmL3M2WXc5dlRHY1RaTTRPa2My?=
 =?utf-8?B?R1A0bWtNTHk3VzFpSWc0bWJNWUplRVZtNDUzUFdIWFBxQVJ3UFl6ZFUrSHY0?=
 =?utf-8?B?UWVXMURXeXhENFA2MHdFWXEvQkFveVd5bGJ1dncxci9kZXl2Rk5jbFhkaVdB?=
 =?utf-8?B?VU5rSTZHSjBUT3Z4K1U4cWZncXhoNE5KTENXdWV6SmNUOXA4ZnJQMXZzM0ti?=
 =?utf-8?B?dGpiWERBMk5halRzekxHY2xOeVRaem8reUVPMkxNN3cwM055Y3hPSkVMd3dC?=
 =?utf-8?B?SFNpcm9wUzZ6YXplQjBnODNMREF1YTI2OGswN0hVaXU3Wk0yM3h4a0YzMkdJ?=
 =?utf-8?B?VU9rVXVCM2s1UEhsZjFGSUNUZkVJUjNxSFdCUG9WeEU2THdlZXBzMXJkYTB0?=
 =?utf-8?B?WUYwbXpHY251a3c0NXdidXJ1WlBKc25IaTJTd0FGam1hcUoxRWtrTWEyb0pO?=
 =?utf-8?B?VlJkallVRkdxVVNmL0tJWVlHZ1p0MW5ITERxMml5SmVpV3BsMUhzdWw5SUlu?=
 =?utf-8?B?QXcrbGx6RU9idUtBL2hzRXdGRW9rcTVCcDZlWE1lUkd3NzRvVWcrL1N5a1hj?=
 =?utf-8?B?WXRjUUcySWd0cHVKL2oyUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K0R0aEF3TUloK29IdDZaa1IvNTZvMXhUUG4yY0lIVnhEOTNSdGJzVGpjUHhu?=
 =?utf-8?B?dzVHQzdCaG9PWENqNGZQMkZ5eWY2d0xiZ3F0bGJ0emc4Q0NnQUhuc2QybmE5?=
 =?utf-8?B?U3JoRlhqUmo3RDU3Q0hHWGgzRGZveE9BdFp3dkV6eE9WVFZ1WkQ3dHYxRngz?=
 =?utf-8?B?TWE4eXdNSDdBQnZWRlVYMFM4S0xrRW0xaEhTbE5SV0wzNkpEWFoyYnlGNWV4?=
 =?utf-8?B?WExwQXVZdmdpYWZvZ04vOFFzTGVrSWpPT0VFQzhpZmNxdk9GZzBZM3RURXJu?=
 =?utf-8?B?SzhuU3ZBVEk3R1FENGdVRE9sQ1JxZDdOcVdaaFRwbWJqeThEdm10VDdMTGJ0?=
 =?utf-8?B?K0Y3cEtSVWVWTEtlSVBNTHovSXRwcWhrcHV6cno2ajhzeXpwdHVLUTE3bVdS?=
 =?utf-8?B?ak1IQTFBRU81QWZDTGZKT0VESkJQSTFGR29hdWd4RndSTVIrWUkzYzhwSVRE?=
 =?utf-8?B?MUQ1U1B2QTZzbTA4dE5mZ2Y4cmZOdEhRaDVsTVJuRVE5UjNxREhpL0wyTEFo?=
 =?utf-8?B?ZnRPQ0F5UVpLVTNsV3lSWFlYcWE1ZnNaQzNSNGJIR3Q2M2gvU0VNOXEvMjk3?=
 =?utf-8?B?L1BoZnNmd1hESVh6cEo5ZFVEOHRvOFM4TWtidXNiWjFGOERTelhSUVp2MzFJ?=
 =?utf-8?B?aVNFWEcxTk1KenJjRnk3dFhzTVdwTGNzRG1hTFhhUkhtck1PK1BqRTh4bUpq?=
 =?utf-8?B?QkJUSmlCSkFSWXBkU0wxcUF2OXVkSXF3bGVVQlcycHNPb3MwenJ2S0VQcmRk?=
 =?utf-8?B?R0Rpek0xb3c3N255UTgzUmt4eXdDMFYwZ3JocGJBa2k1V3QzTzJlY0Yva1px?=
 =?utf-8?B?V21UeUZxL2p1TmpUVEJJN2ptS1ZGaTZuQWFITFlKaERFaWZ0Tkl2WWY0NlU1?=
 =?utf-8?B?b1U0aHFvLzFoVUhlMXMwa2VCdDFzRVZacWpwdVB3d3ZJcVR0aGxQR01CZ0Fj?=
 =?utf-8?B?VVRMWjlYTmlxdmJWamtWZXlsL0ozSEMzUWZCTGlyK0NuVEVEMVd4NzdBSHAr?=
 =?utf-8?B?bFJpM1VxS1FLRmg3MGJYL3NKZUMxaXNpak40WTVkMHlHNVVFdTVTZVh6Z05u?=
 =?utf-8?B?TzhFWGU3YWxRd2lsRktCalYzMTRIb3EvYTBrdWsxdDFidnBpWUFyNCt1cHV5?=
 =?utf-8?B?VzNKQk9LUUwwL2tucHk4T3o4WUNqVTZneFdwQUtqeFlBRjEwN0FOTklJcHBL?=
 =?utf-8?B?WG5XWmI0R09NNVB1MEEvOThuRCtlOExmYk1zbW1pYkgza05lVXplWVlBeSt2?=
 =?utf-8?B?V0ZQTEsvNjhiMGVjYjBzTlFhNHJYU3BvNFZMTHg3Zkpxa2Jwemlwd2FqRklB?=
 =?utf-8?B?em9PMzJYNEFXYnUrN3hmNVY2aHR6bXJJcGJYOGpvNGwyZ0lFYWVQNFgrT1FT?=
 =?utf-8?B?aDRCMEJqbUpjN2JPTE40QVBrRG1lS3lGSWJ5cDVvcG1jZ3lNczJ2UmFoa3Vt?=
 =?utf-8?B?ZTRvS2JBRjFKVEpLKy9xazhNYk00ZExVSHllY1ZxK0w2MzZORVlnRFhlbDlt?=
 =?utf-8?B?ZXl6MWREd3d6cVllYmllaXk1WHpXUnJkcUZETTc2MnI1Ym5aa25aNGFFWGdz?=
 =?utf-8?B?d0hxdkl1SklXTVAwZ0lHcnR2cEg3MXpPRnZROGVIYkNqcThrKzhJdi9mZHBn?=
 =?utf-8?B?YmJnRERrQ1dXUTFna1NlRHZLTWpSbXBCcEZwODBhYnNITXpUSk83VE9zRFpq?=
 =?utf-8?B?U2QxNU9oTW5xNjZzemFuZjI2QUtMeEpUQ3hrMDBWRWVmbUNyOHFYeStQSTA1?=
 =?utf-8?B?T2JCL3FVdHh3SlF2bGZCUlBwdkhTVTRzRWxTOGNJU1FwSytnV1lKR3ByaTE1?=
 =?utf-8?B?Unhra0tXajFRVXZQOWhaTmFhdW81MUtvalc0QjFSY245M0JQVzEvU1JxR1dk?=
 =?utf-8?B?ZXNqcnhnOVl5V05mOEk2dyttZXRRd2l1Vk40VGRzbnpvTUU2L3E3Yk5ObEg4?=
 =?utf-8?B?emNUV01icy9FWjdiMStvaEtiQk9JMGgwN2ZUdlhoaGFaT1VCWEhiQ0lKcTk1?=
 =?utf-8?B?eDhiVVZEdndBZHh5d1JmcmFKUTJOY1JrK1JGZDZ4RUpKWDE0bVNEMzdaaG5V?=
 =?utf-8?B?Rjd6RHJ0S0poL3pJRzI5L0RHTFJZQzN4SDRpRkhuUlc1Q1oxekV6VDM2dUdl?=
 =?utf-8?B?V0tpcWI2anZwNnNBaXZCSGVOWFRHTnVuNTZsUEhqcEVMeGgzVUtESkErYXZh?=
 =?utf-8?B?UWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 592d0d70-e883-42df-7000-08dd187185f0
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2024 16:50:01.6112 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pcopla/w8bKOlNqTt9gXRCZ1+K+sk1hfJpq21f/S4J0spcq/zKeC39HvfiyveqYBiP0iUGaSJpBfi+6Dj0I/9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8172
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

On Thu, Nov 21, 2024 at 10:20:58PM +0100, Mirsad Todorovac wrote:
> Running coccinelle spatch gave the following warning:
> 
> ./drivers/gpu/drm/xe/tests/xe_migrate.c:226:5-11: inconsistent IS_ERR and PTR_ERR on line 228.
> 
> The code reports PTR_ERR(pt) when IS_ERR(tiny) is checked:
> 
> → 211         pt = xe_bo_create_pin_map(xe, tile, m->q->vm, XE_PAGE_SIZE,
>   212                                   ttm_bo_type_kernel,
>   213                                   XE_BO_FLAG_VRAM_IF_DGFX(tile) |
>   214                                   XE_BO_FLAG_PINNED);
>   215         if (IS_ERR(pt)) {
>   216                 KUNIT_FAIL(test, "Failed to allocate fake pt: %li\n",
>   217                            PTR_ERR(pt));
>   218                 goto free_big;
>   219         }
>   220
>   221         tiny = xe_bo_create_pin_map(xe, tile, m->q->vm,
> → 222                                     2 * SZ_4K,
>   223                                     ttm_bo_type_kernel,
>   224                                     XE_BO_FLAG_VRAM_IF_DGFX(tile) |
>   225                                     XE_BO_FLAG_PINNED);
> → 226         if (IS_ERR(tiny)) {
> → 227                 KUNIT_FAIL(test, "Failed to allocate fake pt: %li\n",
> → 228                            PTR_ERR(pt));
>   229                 goto free_pt;
>   230         }
> 
> Now, the IS_ERR(tiny) and the corresponding PTR_ERR(pt) do not match.
> 
> Returning PTR_ERR(tiny), as the last failed function call, seems logical.
> 
> Fixes: dd08ebf6c3525 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Philippe Lecluse <philippe.lecluse@intel.com>
> Cc: Nirmoy Das <nirmoy.das@intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: José Roberto de Souza <jose.souza@intel.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Faith Ekstrand <faith.ekstrand@collabora.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
> Cc: David Kershner <david.kershner@intel.com>
> Cc: intel-xe@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-kernel@vger.kernel.org

I clean up this cc list. no reason for this simple patch to have this huge list.

I also fixed the checkpatch complains in the commit message.

And pushed to drm-xe-next

Thanks for the patch.

> Signed-off-by: Mirsad Todorovac <mtodorovac69@gmail.com>
> ---
>  v1:
> 	There is also the logical problem which this patch developer is not qualified to fix:
> 	first the fake pt tries to allocate size of (1 << (XE_PT_SHIFT=12)) = 4096 bytes,
> 	then "tiny pt" tries to allocate 2 * SZ_4K, twice as much. Is this what was meant
> 	to accomplish?
> 
> 	drivers/gpu/drm/xe/xe_bo.h#L46:
> 	#define XE_PTE_SHIFT			12
> 	#define XE_PAGE_SIZE			(1 << XE_PTE_SHIFT)
> 
> 	include/linux/sizes.h#L23:
> 	#define SZ_4K				0x00001000
> 
>  drivers/gpu/drm/xe/tests/xe_migrate.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
> index 1a192a2a941b..3bbdb362d6f0 100644
> --- a/drivers/gpu/drm/xe/tests/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
> @@ -224,8 +224,8 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
>  				    XE_BO_FLAG_VRAM_IF_DGFX(tile) |
>  				    XE_BO_FLAG_PINNED);
>  	if (IS_ERR(tiny)) {
> -		KUNIT_FAIL(test, "Failed to allocate fake pt: %li\n",
> -			   PTR_ERR(pt));
> +		KUNIT_FAIL(test, "Failed to allocate tiny fake pt: %li\n",
> +			   PTR_ERR(tiny));
>  		goto free_pt;
>  	}
>  
> -- 
> 2.43.0
> 
