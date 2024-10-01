Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31167CF3188
	for <intel-xe@archiver.kernel.org>; Tue,  1 Oct 2024 22:17:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B343310E1A7;
	Tue,  1 Oct 2024 22:17:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kKbQu3Ls";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F89610E1A7
 for <Intel-Xe@lists.freedesktop.org>; Tue,  1 Oct 2024 22:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727821034; x=1759357034;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=OB6rQIftn+ii9OpwnY8lVon7OEGSxim8rHzzPx/gvbs=;
 b=kKbQu3Ls5hD6SWZ1tF9oQU9ev1mXBHClojL7KBxefqYgWSVgnQqru3uw
 uhj0ZDZvvJok0kLNG4wWNYJ7aKCn+3wY0cRhAAkvuILk1pUiVjv0xWimC
 Th5DkPC8dLjFgSlkLuVsrsk0vMGnDFLtTmGfIRNx/+//jojIV540xVGPr
 TpcnZPmRocfgbkVXAaxZpSnqe6OjGT7Zz4AJk1khdvx5OnH217yE78XaX
 NprMMCUKs0CnjHuK1fhIY0H9JT0gyaAuQevWXzUApdMEFLRRQJtB0vLpg
 aRzHKTVXFjnMi+F4Wa5uHTdoZUh5/0cdWN8aOaHlJY8eMCD8wXcQ5W8Qa A==;
X-CSE-ConnectionGUID: s2yngSIZQwm8p3sgZZ5p6g==
X-CSE-MsgGUID: o0PEC7jdQ5yf+7n9nXeGag==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="38363514"
X-IronPort-AV: E=Sophos;i="6.11,169,1725346800"; d="scan'208";a="38363514"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2024 15:17:14 -0700
X-CSE-ConnectionGUID: uFYa9FwBRli92847tGXTgg==
X-CSE-MsgGUID: 3cwFcMr2QAGDFrNRm0Jkvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,169,1725346800"; d="scan'208";a="74127202"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Oct 2024 15:17:15 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 1 Oct 2024 15:17:13 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 1 Oct 2024 15:17:12 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 1 Oct 2024 15:17:12 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 1 Oct 2024 15:17:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jqbWXRuTxC5eVhGVRfquturXhTt3BXx1JtlCMrV+iYDqzibuUrm+IDebhsVeqLPGcT+kBzS3E7j7Oiqy67AB5OKzI7XOA2MurpxOlQAUusmlwk2xw455lrMouvL2Y5pFGDNWvZD7cAnCX4N0JqGdQKS66rP1Dh+WdsxCfmw4B4zxxaO2+1E8wPdH30WPaJbK3g1YA6aUY23cXcKRbknRkElFzbY/eipZFI7p7du+ccPrdwZkH6J3NVD7EP8DS+XXEdKMMe4VHig1niZDu+4JlRuVcsywifqIAufyZ92h05StewOb+ErWXbcw7YZylEwtXKGw417EXhH3h1v6KPeorg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OB6rQIftn+ii9OpwnY8lVon7OEGSxim8rHzzPx/gvbs=;
 b=eK6ANyPwRN2pws0qI+HdaEP3vDQ9mB/hzPyhQkd5PB3KAtJClkiaj0x+wlbmKGg8jBe2ERGVLABQuSy3vOkRY2Oh5UZWQqJ5Dp518vKHq0Fp+CuL1bmAHM6KFX567YsLF/exqrYUkL078/aUv7bJrJ3I/+LyVfgUD6yTOhEsAWjw2JnGA9pKLC3lmNfeZw0RqMaNEj/JtoTWR9wf6fvzaxBEWAH1sPwNpfUTnCnxdu4Qb1CWF5m9NPkhcrlD12xk+5I3r5gTDp1rxGZ13fxp4HnHAGdfdQGK/CQUWgxJROpIXxqb7WOtEKCJElfS7PlFTnei2kHSZt0KqG2VrEJGXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7821.namprd11.prod.outlook.com (2603:10b6:208:3f0::22)
 by SJ0PR11MB6816.namprd11.prod.outlook.com (2603:10b6:a03:485::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Tue, 1 Oct
 2024 22:17:03 +0000
Received: from IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::2ca4:29ad:f305:6fc0]) by IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::2ca4:29ad:f305:6fc0%5]) with mapi id 15.20.8026.014; Tue, 1 Oct 2024
 22:17:03 +0000
Message-ID: <d7d6240a-a812-477e-a799-1b71e4eec463@intel.com>
Date: Tue, 1 Oct 2024 15:17:01 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 06/11] drm/xe/guc: Use a two stage dump for GuC logs
 and add more info
To: <John.C.Harrison@Intel.com>, <Intel-Xe@Lists.FreeDesktop.Org>
References: <20240920032108.629796-1-John.C.Harrison@Intel.com>
 <20240920032108.629796-7-John.C.Harrison@Intel.com>
Content-Language: en-US
From: Julia Filipchuk <julia.filipchuk@intel.com>
Organization: Intel
In-Reply-To: <20240920032108.629796-7-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR08CA0067.namprd08.prod.outlook.com
 (2603:10b6:a03:117::44) To IA1PR11MB7821.namprd11.prod.outlook.com
 (2603:10b6:208:3f0::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7821:EE_|SJ0PR11MB6816:EE_
X-MS-Office365-Filtering-Correlation-Id: b7755f40-dfa4-4991-3823-08dce266c6d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U2lPSmtXOGx2WEZWUU5hUG4ycjhaSjB6aHFjSE9oWWJ6MXhXaUxNL3VmbDQx?=
 =?utf-8?B?Q3QvVzZnSjVrcFpLL2NOK3Y1bnN1QlJURExMcWNoR0tXK2NIMHc1YW9nWnlS?=
 =?utf-8?B?NFlUc1piZ1BCWkc4UHZKVWNudUh4REE2cmVyOHJ2MnJJM3hJTW83VUZzKzJt?=
 =?utf-8?B?WkJKeWlpSXpGY2VoNFBZTmNoVjBId3VxVkdZTStBUDlSZE15NFVCY01Nc2lE?=
 =?utf-8?B?c2x4dFdaaHF3dTlCbVhuRmxnMDFYQXU3dmZGQzgxR25yRW1xR0NuM2Y1TmtW?=
 =?utf-8?B?dWp4dGliSVFFeE45M0ZwU1haQUN0OXI4MVdXM3JMVE9hNkw3cG13d214YlA2?=
 =?utf-8?B?Zm8rcDNJMkRRY2g2elQzbTROZC9tZDVScHlJN1NVRHd2TUdNb2prTW5xbTNu?=
 =?utf-8?B?Ri9odWUzRmpJQUhZdWM1K3Fvd1VpU294K3hGczFYZVNzWmpCOFhVWDBTb056?=
 =?utf-8?B?QzgzdTJROWJkZXNlVmFBS2NWbjlFQTdjZnpFbzZhWUlCeHhyZUtrU3p3bXdL?=
 =?utf-8?B?Ulg4MTVkUGRmWGlOVXRFZDI4S2xZOXh1TjN5aGV6UUF1Y28yayt6Zi9KZ2V6?=
 =?utf-8?B?Rk9kdHRTbk90VDFlK3A3aFFQZHYrNDhnUFBiaEZnWk5xV2lTelN4cDgrMXdB?=
 =?utf-8?B?dGNueFZRdTB0Zkl3QlFLY0M1VVE0b3lhdVRZRXhMQi84SG0yOGZSY21FSDRT?=
 =?utf-8?B?Z1RwVEVlZ1N2YUJrMklqdU9nUVBHVlE4SzVnaUpSL1ZiSURMV0JsZUdHZ1or?=
 =?utf-8?B?Q3hNUkJ3VnBBcjhEbzFTQ3QrYjJ3aDdGekR6aG56NzY0Um13ZGdpcDZneG9s?=
 =?utf-8?B?TVhzeTBNRzdtVFpzNWhmbGxCZDlzTWJ4OXVZc2tvak5zU1RWL2FSSCsySEox?=
 =?utf-8?B?TzRZQTE2NDRvMGNFTmZKenBiVkFLV29VeVVrMWd4ZFJmRFM2cU03TUhyNXJs?=
 =?utf-8?B?bWVoMFNhbkxUQkFRc2JlbHZMdXJtemdOVTNTV2hKckZPeXJSZjRvUHowNFZ6?=
 =?utf-8?B?WlE2cjVxWnNERW5hSHBlWExIOStLM010RzRnT1JnWDFzbWo5RUszK2ovSHZr?=
 =?utf-8?B?SGVGU1F6dUIvVk1OT1RyeGJpcDFMTlRLRDNOWmZjVzhLdko3ekR3Y05tcXdQ?=
 =?utf-8?B?RGxlY2sraUJVbUNvZUZpSXdKckY2R3NBRlZLNUU3SXUrazBJMC95Mm5KVXF5?=
 =?utf-8?B?UXQwM1dsOUtTZXJQSEpIQ3hadE1tOWQvSG8vbFFDMHBjTy9EMHhtZ2pjYjlr?=
 =?utf-8?B?Q3hvUmFIdUQrWitlTXBCOWJyaWRDakxCRW5zWHdkdlo3RXpiaXA3VGZBNE9n?=
 =?utf-8?B?dCtUY0VuRXZDUUxQZVNPWm1EakJlTGdTK09aZDF5YVBKVXpGRlRmanpaaURp?=
 =?utf-8?B?Q0Y3VDBoT3JOU2RvTVJWNVBnTUFnM20zR1hCbzZIbkNTaWNZanZONThyenYv?=
 =?utf-8?B?ODhtKy9iL0dkOEdkV3FQcjFNNnlxSnoyUVF5Lzg2TlIvUkFnbDhWTTZzV0xw?=
 =?utf-8?B?UHJ0MGhGcUs3TVBlU3FyZnFUUTloTElmWnoyMUVUZlQ0Zm13aW1USlFJdE1N?=
 =?utf-8?B?TFlyVE9yaGpVTUFhdXRueXhXOUQyWHo1QllzSUQ3cnZ0K3MvUDZSbExieWtK?=
 =?utf-8?B?UWNGWmwrUEdmL1k3MENpMEhDT3pFTGxLNCtROC9tU1Q3UVJ3VUlRZ3Z1R0g3?=
 =?utf-8?B?U3lPc1cxNzhTSG9HcHlTY3dPWGZlZWZGOWxKWnhobUdQUXZBS0ZKT2xBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7821.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OEpYMFViZFpFWWUrU3FZQ1RaSWs5N3Z1a2V0UmFyRDA1aXd0TGN5bmFnSXVI?=
 =?utf-8?B?MTA5VlVabE1mMWk0dG9VTEhmVWpLSGhQYjNOdkswV3ZFZW9Ha25PdFBqVEpG?=
 =?utf-8?B?UlJHOVpFYUZMTDYvY21mbUNSQ3AxVWlUYTFCVGhIUkxUUFFsOHlLQTRhUW5p?=
 =?utf-8?B?QUxqY1pQZ0MyTFovWXI2a0FDT1h2NzFGdmV0WC9aS0dBMEtJamd4UXNYSkQ2?=
 =?utf-8?B?SC9SL0ZMRU52bjkxNUZUUldIRlVyRlVtdjR2aVJTNDkra1hITy9lNzlueks2?=
 =?utf-8?B?aEE2a2YzelVaQ0dpd3NxU2s1MHpaU2NwTDc3c0lmZ3hhb1JjdEhiWlcxZ1Vv?=
 =?utf-8?B?SFhRWlA1bTRqMjc4YjdWemxtV1BBSFR5Z05FOEpHMW9ZRittQ25ZK3IxSU5J?=
 =?utf-8?B?QXM1LzFmZ0s0RDhsb3lkcDBzUHM3YUg2bkg1ZFp0aGw4alBwTldGdHpQK0wx?=
 =?utf-8?B?ZCsrcmFidmZOV0k2Z00ySU9rTDNCbnJsdDYwMkxwdUFrZFpKdHZzcTVWVkhy?=
 =?utf-8?B?M053TmNuRXVmdERlckVVY0poV2ZGeVpEd202dURBZDF6SnlMTmRTSENjVWxE?=
 =?utf-8?B?NWh0WWh2cytHWkl3YytrbnVqb09ydFEyMWoyWTNSRnJFaW54Y0xsSmMvenNN?=
 =?utf-8?B?QXdrV0JnUTdXQTAyaCtMc2VoR24xK0JPQ3orVGhiUjl5cm1zQnliU2MzOTln?=
 =?utf-8?B?U1hNWEo5MVlOSEpYSUx6N2J4cjJzVWJMR3I5dm1ZWWJaU01FVlZ4VkRmYWhV?=
 =?utf-8?B?QmRWNVhEVGNOU1R2eUhzeDdTYVN4a2hTVWN0TWJUMFN6MVJrdDhHQitrR1BX?=
 =?utf-8?B?Z29RdkRSdEQzRXhpaURrU1JqYWpBdFIyZnRMVGRXZUwrdU92OVlZOFZSZ3Jr?=
 =?utf-8?B?N3BnbHpuWnNKbVY1NTY3T2tqNEhIdzlKMGYydXlTUWR0cVJpeWFQaVQrOWxB?=
 =?utf-8?B?WGRLaFNtSkxSMlJQWTFSVEswSWVCRDJiNTRXNVFPVmlaUnVMTHRvVVlOVGlx?=
 =?utf-8?B?Y1BmNnFvd3dTV3R0THpJZG41V3lFNUw3bWlUQzRNU2graTNiVm9SdWtHRkhp?=
 =?utf-8?B?R0FpdDNCSGg1RXRmSnlMUWRsT3ZKQUhMU0JPUUxWNHZmbGdRanEzNVdGaUc5?=
 =?utf-8?B?QTJOS3NNQ0dFOHNCK0wwVGdXbmpuRzA5WGlQR1NkMnFBY09VcjJ4QVBUNzlT?=
 =?utf-8?B?dGg3QmFIS3c3ODIyRVI0bUYxUU40YzdvNDk5bXJtV2h5M2Zlb3JRSTA2dmx1?=
 =?utf-8?B?N1N2SXFOMHFtbUZETlVtMnJYdjY2TjQyaDJVYkMxYXRHYUNWbno3bloxL0ds?=
 =?utf-8?B?emd4S21veWhnTXpoYjlQQ0xhenRnallMU0tId3BZSFcrSmFkMjZrWTNUZnl6?=
 =?utf-8?B?RXNIRDZIVlZZOXdlZEhHdnRYdGlZTzhCUHoxNGRqNXhHL0dvcE9TbEUrL0do?=
 =?utf-8?B?a1g2cmE2UFNZemg1eGE2MXh0cThaZ1UxQmZ4emdUUC8wVkxUak54akdQQVdm?=
 =?utf-8?B?UUg4NmYyb3VnSS95UmYwS00zR1d4LzhIaEUvcS93cU5XMDlaZC91TjJaU3hO?=
 =?utf-8?B?Ly9HL2VZSk5VdEhDRUNKUWZWNTc3SmJ2WGo4ZjNzd21MSGVlN3lKY2c4clpr?=
 =?utf-8?B?d09ReFptUE9PRFVyZnZmVzJxMzVzNWJNSnFvRTVDTUFQeUV0RmxvajZaNXg2?=
 =?utf-8?B?MXRCQ2JEWU9WWXRGVzJwL2RTNjR2MzZSY2RvZ0o3NVVub1ZTZ0VGY0IzZVJp?=
 =?utf-8?B?WUovdU1ZaVVYL1JIdy9yVlB5S3g0SHpwNkZWai8vSmordWpPNUlIVXlmWFkz?=
 =?utf-8?B?L3QzbVhHbnk3WE52cmlhdTE0M3BLZCtpekxoYkNBT2hvaTJvdEg4ZjVhK25V?=
 =?utf-8?B?YmNIdW8zVGdjN3ZaZ1FtazhoSE5UTEVWbXZvcldaNzU5MEpDZThLaE1nWkFk?=
 =?utf-8?B?SHE1ZU50L2ZGTVIyZVZnd1hmNldDVEMvTHZjbERKWUgxZUZ4ZVNPbzR3WXAw?=
 =?utf-8?B?eTFHVVlrSXVjL1R5a0gxVXJ1SW05TGdVeFZGRlVYNjh6TWhKNmI4Kzl6ZXJp?=
 =?utf-8?B?bTNhd0g3UGVxUzdpSjZqa2lsMWJheEhZMlFuN2VWU05SUEFQY05UbCsyY0xH?=
 =?utf-8?B?MWNKbGZUUUkzanBLQWQwMzJhTkk3K3ErYkI5SWFpN2U1dW5xenBRZUtSa292?=
 =?utf-8?B?RGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b7755f40-dfa4-4991-3823-08dce266c6d7
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7821.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2024 22:17:03.2475 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tSgNTHRuAWQizcUnh8EFx80Twtpn8TsdOtcxGHYMSKNuJvwN/uvxUhJXovRNB9UCSvN8GY5Wv5rEDNpzqfOsAzEGBCFS9Eb6MEGPn0+2mE8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6816
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

Reviewed-by: Julia Filipchuk <julia.filipchuk@intel.com>
