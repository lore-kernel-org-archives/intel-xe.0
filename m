Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFA15C8303C
	for <intel-xe@archiver.kernel.org>; Mon,  7 Jul 2025 10:02:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B75B10E337;
	Mon,  7 Jul 2025 10:02:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nltKqsD4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83A7610E337
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Jul 2025 10:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751882527; x=1783418527;
 h=message-id:date:cc:subject:to:references:from:
 in-reply-to:mime-version;
 bh=7TkKHeOdGR5R115XH5YVoBWLo5kefi51mOJjLnLZI4A=;
 b=nltKqsD4nvztnShW89VvMh/ppP9bAecpC2nsVp/DTMeIFmS9X8Ib6BPi
 gfr9Ot1i/HHr8XMdo4RwbObyUfDrwZ/BSZd1yIEsZAFYfydgIcncBcOZb
 9Kh8Siyx3qytMdO3U1tMxDjRI1W4oXOtCFjN7KwcZh73PGpOOuh15vMlT
 P4M0yf6WGxrMcSIm6vFU2d8ATbAZF4UfOpeDZVP4Z3VzW5Q06V7YJ7aiE
 +bL63osOKIn29SWUt8Q09lUsljXSlzo4VXOeOQs3SZp0wDv9i4uH/EhaO
 hi1p4CmQlzmr2c15V7dO6VoOz2EuBKMdue8zvZrDUnTwxMhci4Ffo8GJt A==;
X-CSE-ConnectionGUID: ynyi4yLSR2yqUXAee6xa5Q==
X-CSE-MsgGUID: 5O5uuG1gQsedug9CJ0ohtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11486"; a="76649099"
X-IronPort-AV: E=Sophos;i="6.16,294,1744095600"; d="scan'208,217";a="76649099"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 03:02:00 -0700
X-CSE-ConnectionGUID: WaHM5vQlQcmZoZ/nAmDfhg==
X-CSE-MsgGUID: coYs3p0eSD+7HCY0TQQT5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,294,1744095600"; 
 d="scan'208,217";a="159438551"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 03:01:55 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 7 Jul 2025 03:01:54 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 7 Jul 2025 03:01:54 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.59)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 7 Jul 2025 03:01:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JDjzF8DbbiqHEqPSYjajg0uhz+YDTHOVPzKq6a+MhpSivwRUBMmnHJw9YLbhluqm9VYz7Nj56nj5OzdqjyBsl1cOhvItfkZ9B8rWQgeuZfGY0V2inOAOM8t3CtjV4y6cONKyNPswKk6iePDZjUXA6dzH47C9lOPMvmTsJhX/lPPOURT+nHHXi15VBqIE+BJ3993MVnDCtyjIA0WCYtq6NavFp1MqjTx07W70vJdFLU3y73iW8L9j+SdFdNF6I7n+TMPHV+zl7Mc1modnE4gzcGLeGfy7NI7Ba3vG3MdZwCtKjSPyYG+QGGUj1+7j2Uy+T+GRwexSDJP/JXyMv3HmAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UhUV/u04wW5dWvryrAxnL8oY0h2SH/DgA0ft9/xJFDs=;
 b=HrCZfm0/vLsgVCHMfrjuiGxqzkXaOd19xjYlAkYlx7lbIgrRRIjJh1NMHqtmLsaLnBod/E23ns9EtBGtJQzlekqRtMidz0/jUQo+GuMKQCCVV4015Jz2qJ6E8CxOKskFqMYJbYRRJ0JurVejLQNn8jDr2bw5vF4IiXzeNEFjuwwVJ6pE+3aXjWJXBCWYxeGJiEHI6PpccM8V4xJ4qrSnNTxDKyRWqPHQc0VXym6cGCroI7cEis1uBnebF6lXybLuBzjlBDoqE6INTjrUau4jBnu/ugfGKdGw28DRKqqnoGCqG00S02eUARhXj37H0POMKvRlpHyZoMWwxb3BXcPVKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by SA0PR11MB4736.namprd11.prod.outlook.com (2603:10b6:806:9f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Mon, 7 Jul
 2025 10:01:19 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541%5]) with mapi id 15.20.8901.024; Mon, 7 Jul 2025
 10:01:18 +0000
Content-Type: multipart/alternative;
 boundary="------------n0vjiyWsAGgE7DZvZx0xrYYq"
Message-ID: <d3ed20e2-4cd9-4c33-be38-1f587b30dd81@intel.com>
Date: Mon, 7 Jul 2025 15:31:13 +0530
User-Agent: Mozilla Thunderbird
CC: <satyanarayana.k.v.p@intel.com>
Subject: Re: [PATCH v8 3/4] drm/xe: Move struct xe_vram_region to a dedicated
 header
To: <intel-xe@lists.freedesktop.org>
References: <20250702084424.3609863-1-piotr.piorkowski@intel.com>
 <20250702084424.3609863-4-piotr.piorkowski@intel.com>
Content-Language: en-US
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
In-Reply-To: <20250702084424.3609863-4-piotr.piorkowski@intel.com>
X-ClientProxiedBy: MAXP287CA0017.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::35) To LV3PR11MB8695.namprd11.prod.outlook.com
 (2603:10b6:408:211::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8695:EE_|SA0PR11MB4736:EE_
X-MS-Office365-Filtering-Correlation-Id: 507ed5d9-6bfd-4bd4-d5c9-08ddbd3d37ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MU43UC9EVm5CK3JkTTBSNEVORjZEZ0RmRk81ZjVQb2lUZzRGTE5PN2NvRTlm?=
 =?utf-8?B?VDdQd3RUWktJNUY5Sng3Q0pYaDh2T1ZDNGRTT0E2YmMxWWcydkFXVVFrSlhZ?=
 =?utf-8?B?VDFOd1pPYVVHak8rSzhXRUg0bGNKRGhYTkVmQk9YZm1Oam01aFArTjJEeHk1?=
 =?utf-8?B?THRrdEtSYkROWXVva1RrUkgwaVpmSTMzbmZUeW5jbE5qMWxQV3I1MzZLZ3BS?=
 =?utf-8?B?V0YwSGpGQUdjTUdlL3htSlNKcVNUdHdPVS8rNVZvMlVoMkhmQk0rKzVOQnZp?=
 =?utf-8?B?Q1hlNTN6TjNHRTR5anQ1T3dvVjRwRk1FUmNhT0s5bEVtV0RIbkJsZEJxWXVV?=
 =?utf-8?B?U0NtejZmU20xWmMyT3RLK2dvVmhnM3VvUkhyV1oyT1Vqd2lSUlNEeEQxdmlN?=
 =?utf-8?B?MW1QdkozVGhVYnZrZ3NpUWhBN08xN012UDdLdHZHUTFYdE1FU1ArZEdTSE5s?=
 =?utf-8?B?QW96cnRyUkdieE9HZkNHL3NneVRRYk93Q0NwU0RqVHk5UThkY3B0VnR3UllU?=
 =?utf-8?B?VjFTVmNnRytoOWl6a3pZZEN1Q3RLajlrT0g1dzQrVHlDYXdCRnpiaHdnN3o1?=
 =?utf-8?B?akhOSXdXdUFtT3F3MnRmQ1VOR1dQLzJsU055UjRzMUFFM0NmSW9WY1hGSHho?=
 =?utf-8?B?dVp0d1NPK2I5MXMydUg5VzlGWENhanhxL0Y2d1JUZXZ5d3Flam5PdFRrMEFO?=
 =?utf-8?B?ZVBpL2QyWktKSTRKQWZrNlN4TWxCT0xpQ2RIeUJuSHBSNC8zdkV4RUlTOTdW?=
 =?utf-8?B?b2FEQzRPMzQ4SGZOMENWRFFUdHdidzBFeGlrK09hZVhkOFMrZWF4UmpKeVVT?=
 =?utf-8?B?akFtZmFIVjVaZnJjOFpzM2RmWEtxdUdPQ0hvRUwraXh5RlZCaUR6MmI0Rk9B?=
 =?utf-8?B?ZEtTWnlKSmkxNFllRjhBN3BDSW1SeXBhanZjUU41NStsT2ZwZTVuQkZDME9Q?=
 =?utf-8?B?R1ZvUVlkWllRbkJEMnpocGNrZTJwMGFIMWdsS3FxalZwY3JmeUtERHRuY1ZO?=
 =?utf-8?B?K2FzSlRQUVNRMDNJV2t1cGZTRW4xK05WVTN1VnZoMkk2Vm1ENDJBWkQ0OEJ5?=
 =?utf-8?B?a01CaUQwMkVzdDJtYnBvL0pVb2d6RmlYdWZTSHVjbHQ1UUJSZjRHNUlrQjh4?=
 =?utf-8?B?NWM3Q0VOZE9BM0pKcEY1QnVuMTlaYlEyeGFReklmWjFmUVlpUGJ6K3dhTzdt?=
 =?utf-8?B?bGFUa1VWbis5MU85TGpsV01JZitXNVdJUytUdHFlZ21CZ3RETU56anYxUUxs?=
 =?utf-8?B?Rm1hUHhyeXNZUE5QZ0hLSTVjM0oxcXNBWWRGcmNhUkZpaFQ3c0ZVVFMzWlJ6?=
 =?utf-8?B?ODFmNUZHbUNlZDRqZGNPU25ES3lvWGlWNU4zbzViVTM5eXRZcUtyY2RUaWxj?=
 =?utf-8?B?aWxaZ0p6UTh3aUVGc09FRUlHM3I0UEcwY0JiZDdpcmpta1FlcmVFNm5ZQW9J?=
 =?utf-8?B?L1FOMnd6U1ZPY2QzWHNydy9adDRieXRNMEZPOU83Wng1TzVjWFZuY3hCQWow?=
 =?utf-8?B?VlNVZ2I2MkJmSHdTdmxNRjBvTWJCTW5maHJkSHFhbWIvK0lHWUIwVUFzdkcy?=
 =?utf-8?B?MUM4eXRpbURCTEJZWGh5a1VzT1ZDeEFTYjZ0U01taXpEUGxCWEVBRzVCa2x0?=
 =?utf-8?B?Mnk5VmMzZkFUQXlCL2l4RVRybm5BTmZYbHRjYmhYSkJIelNHSlRpbEtFNVVr?=
 =?utf-8?B?c2gwQVNCaCtUUStMckVCd2FIRHFnQXVTQW9rU210QnNDenJYYWxuUXVhbkJi?=
 =?utf-8?B?Rng4S0NtVE12cUpHbTlyZy9LdDR4dlpiZ3phbUJtdnczTC9uQ1VEcDI4bDFW?=
 =?utf-8?B?NEtXSHF2MElVZmdFTkpIbGtTOWoxdEdmN2kwS3EvNUZZcnNsc1hsTGlZYlVV?=
 =?utf-8?B?Njd6WVM3Z1RPYXdsakdrNlJwV0k2dzQ4UVppa0kxb24zQ1d6cjJrQW1DZHVV?=
 =?utf-8?Q?MW7NWt9CjAM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8695.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RFRCOHVMOTNNUWpnVU4rdytBL2RsWmNNNlo3em5mTWw1WThzVWgwU21TSmZI?=
 =?utf-8?B?cHo0Zmh2dVlvNXVyMnNpUW5UNS9RR2FvaHpiRjhhSVpFb3dxcU9wb3dPUTFq?=
 =?utf-8?B?cVFhbUY2Q0Z6bnd3WmJtS0dDN0JyaldtVDlvT0VnWW95djhhVWMwZnF0cndl?=
 =?utf-8?B?eEFwRFltZ3A4dkd6bmE3d0RjYVlKR2NuZ1ZYb2ZUVldmb0RpMkgxSGFLWnZs?=
 =?utf-8?B?b0gwMDQrblkwN0lZclkraDBwdFdkc0szNWhvbktWWGhrRitoUlB0SHV5eXJT?=
 =?utf-8?B?bW5TL05PVlA3SkpBWEVncXAreGNSOWlGYjBJbitRMlA2Zzl2VzJXOHlRS1g1?=
 =?utf-8?B?QUY3T0NDY2Q5TXAxRWE5VCtIR0V0UStXaGdMbndsOVNvd1dYbTY2QU1MNlJE?=
 =?utf-8?B?T0Vxa005QVVCVlRZeVF5eVptczZyOU1GZlBOVzRKeit5dWl4aHlHN3pqOXpL?=
 =?utf-8?B?TFFkVlVTUzdVRXdmUGFLc2V5bzhJeUJuc1gvU2lkSkhJSXYzbkFzajJoZGNY?=
 =?utf-8?B?Tkh5TVRjQ3NlQ2VJbGJRVU5zYmFRZjZjNHVuaWo2c0Z5aGlWdld0MTc0WnFB?=
 =?utf-8?B?amNKVVBkcVhZWGhxVzhsUGZrL01uelc5ZGVTMFN2dzdmaUM0eDZ2c0Q2UjhE?=
 =?utf-8?B?TmRGczJTU3VIY255d2IvcjNKTDJ4TTdXbEZzUldqcUZpNDNrZm5rN3VCK0Qr?=
 =?utf-8?B?cCt2VHF6UTZFOXBGR2wrNXA5bkRTN0hOU2FWY3dyRS9RWlJtUHJMamhBTVF0?=
 =?utf-8?B?c3JFSjBtT0RSbDczYWtLUkZMdmtNdmhOVDIvTDc1YmY2UC9uQloyQ0lCd2py?=
 =?utf-8?B?UWthZjZMR2pNOGU4c0NPZ2ZoellEOGdMR2VvMzFSemNidnVyWGtOZTJIRXJl?=
 =?utf-8?B?OCtaajBUMHlja1AyNDhuZkxSbk05cHczWmJaSlJLZzR3dW9Tbi9oWTZsNFhF?=
 =?utf-8?B?dm5xMzJ2ZGFWMkpBOUNDU2o3ZURhWkYvRDd0c1BUVDRqUWcxQ1JhbHNiZWZO?=
 =?utf-8?B?dFcwdUdBKzdYNmVkcXB4dVlxdUFuQUxYbGpESEFPTlZJQ3NEOG9tMDliaHFQ?=
 =?utf-8?B?aWNzTjEzQnRJazFqemZaUVluQ2JBdi96K3R5QVIvMGpKaXZUd2FhVEFWWEtC?=
 =?utf-8?B?cnF1ZW40MGdkVEVRT2EvL3FFaWQxWmlrM2dicVFtK1ZCdVUra2l0d2N3c0Vt?=
 =?utf-8?B?em1qdUJCTkRSYmFGQXh5eElYbTd3OVpWdDEvOUxzbjNDbUkvOENoQ3JvbXJM?=
 =?utf-8?B?MUxQZjlYaXg1RlFzY243SSt2dzl1VnVVemloNWlFb2xSL2g0cUYzYlJ2UGhY?=
 =?utf-8?B?WnJFN3JCcUZ0dktkaVJrY2U1SXNhRUJFbFpwWFJSd1g0TW11VUxXWGNkdHlL?=
 =?utf-8?B?NENXMHVPWXVqUEg2dGV6N0d4VCtxOGRxd0xvcjVFZll5Ri92NVY3OVRUWWY4?=
 =?utf-8?B?Z0hYN2lFdmpxZ2R5YTJLM1NMdkJPcExSMUhLTFVnQThUcGlQbGs1SEVUdWwy?=
 =?utf-8?B?MVo1TENuOS9GeUQ5VVNyWjFKUWh3bFp3Uk1ySys5RW8rbFdLMmhPWDlnanF1?=
 =?utf-8?B?YVk1Z0pBUGY0WUEzOVFPUUNOT3YxSk80WDh2MkxKL205Zzhaek1vMDQyMnE2?=
 =?utf-8?B?cnRwQXRvY01OdFJORG9PRFFpMTJHYnVSZUFOejcwY2oraHhHN01vSW9pT2R5?=
 =?utf-8?B?M0w4VFhhN2ZUTlhCTFlzTGpaTVRZOWk0S1kwMkcxWU1ta0ttcG5yemxEVUQ3?=
 =?utf-8?B?dG01dUptMnJCbkMwaFNod3FQYjZSS2sreE1tSkhJaUIvNlBuZCtpY003MVYv?=
 =?utf-8?B?RDhLcjl1TVB1MUZMdndsWmsveXVRMnJjSDBGMkg5RDdjdmhYTC90NkFDckVh?=
 =?utf-8?B?SHkxQ3doZEJBYkF0ZlcrZ3hyeHU2WHVKZnArREorWTNPakpSM0ZFV1poZy9F?=
 =?utf-8?B?V2ZOZ0hyZHFmZ281UUZrZjhJM2x5RGVET05iZk13cEF1aG1YQTJGTTgvT3Y1?=
 =?utf-8?B?YW9XQ0hzR0JWanpySHJXclFPMEI1SzVHMjAwVUxWcDQ1dURYR3R0dzR4SkNF?=
 =?utf-8?B?NERzU1FiRTZLR2phenE2Qldld1R1UW5IZVh6R2x2ci9IVlYzTEpwVkZzUUp1?=
 =?utf-8?B?QldBRTVscmxycFpjcGd0MVYybzkraFE3a3hIOUFqOVc1bUpTckgvbnFQMGw1?=
 =?utf-8?B?ZWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 507ed5d9-6bfd-4bd4-d5c9-08ddbd3d37ed
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8695.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 10:01:18.9099 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rMCO9Diy/oE05nJfCndTf9107TUF21jJotObMzAdwdXTEzwocPhDE8Ck98iwD0dGf/LdtfE7me1QsCaH08xoZbfjun4D14neKvx833eFULk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4736
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

--------------n0vjiyWsAGgE7DZvZx0xrYYq
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 02-07-2025 14:14, Piórkowski, Piotr wrote:
> From: Piotr Piórkowski<piotr.piorkowski@intel.com>
>
> Let's move the xe_vram_region structure to a new header dedicated to VRAM
> to improve modularity and avoid unnecessary dependencies when only
> VRAM-related structures are needed.
>
> v2: Fix build if CONFIG_DRM_XE_DEVMEM_MIRROR is enabled
> v3: Fix build if CONFIG_DRM_XE_DISPLAY is enabled
>
> Signed-off-by: Piotr Piórkowski<piotr.piorkowski@intel.com>
> Suggested-by: Jani Nikula<jani.nikula@intel.com>
> ---
>   drivers/gpu/drm/xe/display/xe_fb_pin.c        |  1 +
>   drivers/gpu/drm/xe/display/xe_plane_initial.c |  1 +
>   drivers/gpu/drm/xe/xe_bo.c                    |  1 +
>   drivers/gpu/drm/xe/xe_bo_types.h              |  1 +
>   drivers/gpu/drm/xe/xe_device.c                |  1 +
>   drivers/gpu/drm/xe/xe_device_types.h          | 60 +--------------
>   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    |  1 +
>   drivers/gpu/drm/xe/xe_svm.c                   |  3 +-
>   drivers/gpu/drm/xe/xe_tile.c                  |  1 +
>   drivers/gpu/drm/xe/xe_tile.h                  | 11 ---
>   drivers/gpu/drm/xe/xe_ttm_vram_mgr.c          |  1 +
>   drivers/gpu/drm/xe/xe_vram.c                  |  1 +
>   drivers/gpu/drm/xe/xe_vram_types.h            | 74 +++++++++++++++++++
>   13 files changed, 86 insertions(+), 71 deletions(-)
>   create mode 100644 drivers/gpu/drm/xe/xe_vram_types.h
>
> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> index 2187b2de64e1..f2cfba674899 100644
> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> @@ -16,6 +16,7 @@
>   #include "xe_device.h"
>   #include "xe_ggtt.h"
>   #include "xe_pm.h"
> +#include "xe_vram_types.h"
>   
>   static void
>   write_dpt_rotated(struct xe_bo *bo, struct iosys_map *map, u32 *dpt_ofs, u32 bo_ofs,
> diff --git a/drivers/gpu/drm/xe/display/xe_plane_initial.c b/drivers/gpu/drm/xe/display/xe_plane_initial.c
> index 873f4e18cb2a..a47e3275acb0 100644
> --- a/drivers/gpu/drm/xe/display/xe_plane_initial.c
> +++ b/drivers/gpu/drm/xe/display/xe_plane_initial.c
> @@ -22,6 +22,7 @@
>   #include "intel_plane_initial.h"
>   #include "xe_bo.h"
>   #include "xe_wa.h"
> +#include "xe_vram_types.h"
Sort the header files in ascending order.

>   
>   #include <generated/xe_wa_oob.h>
>   
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 7f8470b22dc9..a35a9e0dbfae 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -34,6 +34,7 @@
>   #include "xe_trace_bo.h"
>   #include "xe_ttm_stolen_mgr.h"
>   #include "xe_vm.h"
> +#include "xe_vram_types.h"
>   
>   const char *const xe_mem_type_to_name[TTM_NUM_MEM_TYPES]  = {
>   	[XE_PL_SYSTEM] = "system",
> diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
> index ff560d82496f..57d34698139e 100644
> --- a/drivers/gpu/drm/xe/xe_bo_types.h
> +++ b/drivers/gpu/drm/xe/xe_bo_types.h
> @@ -9,6 +9,7 @@
>   #include <linux/iosys-map.h>
>   
>   #include <drm/drm_gpusvm.h>
> +#include <drm/drm_pagemap.h>
>   #include <drm/ttm/ttm_bo.h>
>   #include <drm/ttm/ttm_device.h>
>   #include <drm/ttm/ttm_placement.h>
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 19019b032c78..4bd0619574ff 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -63,6 +63,7 @@
>   #include "xe_ttm_sys_mgr.h"
>   #include "xe_vm.h"
>   #include "xe_vram.h"
> +#include "xe_vram_types.h"
>   #include "xe_vsec.h"
>   #include "xe_wait_user_fence.h"
>   #include "xe_wa.h"
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index bd8aa742618b..619728bba77a 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -10,7 +10,6 @@
>   
>   #include <drm/drm_device.h>
>   #include <drm/drm_file.h>
> -#include <drm/drm_pagemap.h>
>   #include <drm/ttm/ttm_device.h>
>   
>   #include "xe_devcoredump_types.h"
> @@ -24,7 +23,6 @@
>   #include "xe_sriov_types.h"
>   #include "xe_step_types.h"
>   #include "xe_survivability_mode_types.h"
> -#include "xe_ttm_vram_mgr_types.h"
>   
>   #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>   #define TEST_VM_OPS_ERROR
> @@ -36,6 +34,7 @@ struct intel_dg_nvm_dev;
>   struct xe_ggtt;
>   struct xe_pat_ops;
>   struct xe_pxp;
> +struct xe_vram;
Follow inverse xmas tree format.

>   
>   #define XE_BO_INVALID_OFFSET	LONG_MAX
>   
> @@ -68,63 +67,6 @@ struct xe_pxp;
>   		 const struct xe_tile * : (const struct xe_device *)((tile__)->xe),	\
>   		 struct xe_tile * : (tile__)->xe)
>   
> -/**
> - * struct xe_vram_region - memory region structure
> - * This is used to describe a memory region in xe
> - * device, such as HBM memory or CXL extension memory.
> - */
> -struct xe_vram_region {
> -	/** @tile: Back pointer to tile */
> -	struct xe_tile *tile;
> -	/** @io_start: IO start address of this VRAM instance */
> -	resource_size_t io_start;
> -	/**
> -	 * @io_size: IO size of this VRAM instance
> -	 *
> -	 * This represents how much of this VRAM we can access
> -	 * via the CPU through the VRAM BAR. This can be smaller
> -	 * than @usable_size, in which case only part of VRAM is CPU
> -	 * accessible (typically the first 256M). This
> -	 * configuration is known as small-bar.
> -	 */
> -	resource_size_t io_size;
> -	/** @dpa_base: This memory regions's DPA (device physical address) base */
> -	resource_size_t dpa_base;
> -	/**
> -	 * @usable_size: usable size of VRAM
> -	 *
> -	 * Usable size of VRAM excluding reserved portions
> -	 * (e.g stolen mem)
> -	 */
> -	resource_size_t usable_size;
> -	/**
> -	 * @actual_physical_size: Actual VRAM size
> -	 *
> -	 * Actual VRAM size including reserved portions
> -	 * (e.g stolen mem)
> -	 */
> -	resource_size_t actual_physical_size;
> -	/** @mapping: pointer to VRAM mappable space */
> -	void __iomem *mapping;
> -	/** @ttm: VRAM TTM manager */
> -	struct xe_ttm_vram_mgr ttm;
> -#if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
> -	/** @pagemap: Used to remap device memory as ZONE_DEVICE */
> -	struct dev_pagemap pagemap;
> -	/**
> -	 * @dpagemap: The struct drm_pagemap of the ZONE_DEVICE memory
> -	 * pages of this tile.
> -	 */
> -	struct drm_pagemap dpagemap;
> -	/**
> -	 * @hpa_base: base host physical address
> -	 *
> -	 * This is generated when remap device memory as ZONE_DEVICE
> -	 */
> -	resource_size_t hpa_base;
> -#endif
> -};
> -
>   /**
>    * struct xe_mmio - register mmio structure
>    *
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> index e69a05126dae..275ab5f03291 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -33,6 +33,7 @@
>   #include "xe_migrate.h"
>   #include "xe_sriov.h"
>   #include "xe_ttm_vram_mgr.h"
> +#include "xe_vram_types.h"
>   #include "xe_wopcm.h"
>   
>   #define make_u64_from_u32(hi, lo) ((u64)((u64)(u32)(hi) << 32 | (u32)(lo)))
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index e6871734ffa9..ee015e3f5d9e 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -17,6 +17,7 @@
>   #include "xe_ttm_vram_mgr.h"
>   #include "xe_vm.h"
>   #include "xe_vm_types.h"
> +#include "xe_vram_types.h"
>   
>   static bool xe_svm_range_in_vram(struct xe_svm_range *range)
>   {
> @@ -1006,7 +1007,7 @@ int xe_svm_alloc_vram(struct xe_tile *tile, struct xe_svm_range *range,
>   	xe_assert(tile_to_xe(tile), range->base.flags.migrate_devmem);
>   	range_debug(range, "ALLOCATE VRAM");
>   
> -	dpagemap = xe_tile_local_pagemap(tile);
> +	dpagemap = &tile->mem.vram->dpagemap;
>   	return drm_pagemap_populate_mm(dpagemap, xe_svm_range_start(range),
>   				       xe_svm_range_end(range),
>   				       range->base.gpusvm->mm,
> diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
> index 858ce0183aaa..bd2ff91a7d1c 100644
> --- a/drivers/gpu/drm/xe/xe_tile.c
> +++ b/drivers/gpu/drm/xe/xe_tile.c
> @@ -20,6 +20,7 @@
>   #include "xe_ttm_vram_mgr.h"
>   #include "xe_wa.h"
>   #include "xe_vram.h"
> +#include "xe_vram_types.h"
>   
>   /**
>    * DOC: Multi-tile Design
> diff --git a/drivers/gpu/drm/xe/xe_tile.h b/drivers/gpu/drm/xe/xe_tile.h
> index fb0473fa9098..8dd87ccb2aca 100644
> --- a/drivers/gpu/drm/xe/xe_tile.h
> +++ b/drivers/gpu/drm/xe/xe_tile.h
> @@ -18,15 +18,4 @@ int xe_tile_alloc_vram(struct xe_tile *tile);
>   
>   void xe_tile_migrate_wait(struct xe_tile *tile);
>   
> -#if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
> -static inline struct drm_pagemap *xe_tile_local_pagemap(struct xe_tile *tile)
> -{
> -	return &tile->mem.vram->dpagemap;
> -}
> -#else
> -static inline struct drm_pagemap *xe_tile_local_pagemap(struct xe_tile *tile)
> -{
> -	return NULL;
> -}
> -#endif
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> index 3de2df47959b..8f9b8a1d2c05 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> @@ -15,6 +15,7 @@
>   #include "xe_gt.h"
>   #include "xe_res_cursor.h"
>   #include "xe_ttm_vram_mgr.h"
> +#include "xe_vram_types.h"
>   
>   static inline struct drm_buddy_block *
>   xe_ttm_vram_mgr_first_block(struct list_head *list)
> diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
> index 71f463f2c3be..35fd7f5d7cff 100644
> --- a/drivers/gpu/drm/xe/xe_vram.c
> +++ b/drivers/gpu/drm/xe/xe_vram.c
> @@ -20,6 +20,7 @@
>   #include "xe_module.h"
>   #include "xe_sriov.h"
>   #include "xe_vram.h"
> +#include "xe_vram_types.h"
>   
>   #define BAR_SIZE_SHIFT 20
>   
> diff --git a/drivers/gpu/drm/xe/xe_vram_types.h b/drivers/gpu/drm/xe/xe_vram_types.h
> new file mode 100644
> index 000000000000..a01838236036
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_vram_types.h
> @@ -0,0 +1,74 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef _XE_VRAM_TYPES_H_
> +#define _XE_VRAM_TYPES_H_
> +
> +#if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
> +#include <drm/drm_pagemap.h>
> +#endif
> +
> +#include "xe_ttm_vram_mgr_types.h"
> +
> +struct xe_tile;
> +
> +/**
> + * struct xe_vram_region - memory region structure
> + * This is used to describe a memory region in xe
> + * device, such as HBM memory or CXL extension memory.
> + */
> +struct xe_vram_region {
> +	/** @tile: Back pointer to tile */
> +	struct xe_tile *tile;
> +	/** @io_start: IO start address of this VRAM instance */
> +	resource_size_t io_start;
> +	/**
> +	 * @io_size: IO size of this VRAM instance
> +	 *
> +	 * This represents how much of this VRAM we can access
> +	 * via the CPU through the VRAM BAR. This can be smaller
> +	 * than @usable_size, in which case only part of VRAM is CPU
> +	 * accessible (typically the first 256M). This
> +	 * configuration is known as small-bar.
> +	 */
> +	resource_size_t io_size;
> +	/** @dpa_base: This memory regions's DPA (device physical address) base */
> +	resource_size_t dpa_base;
> +	/**
> +	 * @usable_size: usable size of VRAM
> +	 *
> +	 * Usable size of VRAM excluding reserved portions
> +	 * (e.g stolen mem)
> +	 */
> +	resource_size_t usable_size;
> +	/**
> +	 * @actual_physical_size: Actual VRAM size
> +	 *
> +	 * Actual VRAM size including reserved portions
> +	 * (e.g stolen mem)
> +	 */
> +	resource_size_t actual_physical_size;
> +	/** @mapping: pointer to VRAM mappable space */
> +	void __iomem *mapping;
> +	/** @ttm: VRAM TTM manager */
> +	struct xe_ttm_vram_mgr ttm;
> +#if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
> +	/** @pagemap: Used to remap device memory as ZONE_DEVICE */
> +	struct dev_pagemap pagemap;
> +	/**
> +	 * @dpagemap: The struct drm_pagemap of the ZONE_DEVICE memory
> +	 * pages of this tile.
> +	 */
> +	struct drm_pagemap dpagemap;
> +	/**
> +	 * @hpa_base: base host physical address
> +	 *
> +	 * This is generated when remap device memory as ZONE_DEVICE
> +	 */
> +	resource_size_t hpa_base;
> +#endif
> +};
> +
> +#endif
With nits fixed,
Reviewed-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com 
<mailto:satyanarayana.k.v.p@intel.com>>

--------------n0vjiyWsAGgE7DZvZx0xrYYq
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <br>
    <br>
    <div class="moz-cite-prefix">On 02-07-2025 14:14, Piórkowski, Piotr
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20250702084424.3609863-4-piotr.piorkowski@intel.com">
      <pre wrap="" class="moz-quote-pre">From: Piotr Piórkowski <a class="moz-txt-link-rfc2396E" href="mailto:piotr.piorkowski@intel.com">&lt;piotr.piorkowski@intel.com&gt;</a>

Let's move the xe_vram_region structure to a new header dedicated to VRAM
to improve modularity and avoid unnecessary dependencies when only
VRAM-related structures are needed.

v2: Fix build if CONFIG_DRM_XE_DEVMEM_MIRROR is enabled
v3: Fix build if CONFIG_DRM_XE_DISPLAY is enabled

Signed-off-by: Piotr Piórkowski <a class="moz-txt-link-rfc2396E" href="mailto:piotr.piorkowski@intel.com">&lt;piotr.piorkowski@intel.com&gt;</a>
Suggested-by: Jani Nikula <a class="moz-txt-link-rfc2396E" href="mailto:jani.nikula@intel.com">&lt;jani.nikula@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c        |  1 +
 drivers/gpu/drm/xe/display/xe_plane_initial.c |  1 +
 drivers/gpu/drm/xe/xe_bo.c                    |  1 +
 drivers/gpu/drm/xe/xe_bo_types.h              |  1 +
 drivers/gpu/drm/xe/xe_device.c                |  1 +
 drivers/gpu/drm/xe/xe_device_types.h          | 60 +--------------
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    |  1 +
 drivers/gpu/drm/xe/xe_svm.c                   |  3 +-
 drivers/gpu/drm/xe/xe_tile.c                  |  1 +
 drivers/gpu/drm/xe/xe_tile.h                  | 11 ---
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c          |  1 +
 drivers/gpu/drm/xe/xe_vram.c                  |  1 +
 drivers/gpu/drm/xe/xe_vram_types.h            | 74 +++++++++++++++++++
 13 files changed, 86 insertions(+), 71 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_vram_types.h

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index 2187b2de64e1..f2cfba674899 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -16,6 +16,7 @@
 #include &quot;xe_device.h&quot;
 #include &quot;xe_ggtt.h&quot;
 #include &quot;xe_pm.h&quot;
+#include &quot;xe_vram_types.h&quot;
 
 static void
 write_dpt_rotated(struct xe_bo *bo, struct iosys_map *map, u32 *dpt_ofs, u32 bo_ofs,
diff --git a/drivers/gpu/drm/xe/display/xe_plane_initial.c b/drivers/gpu/drm/xe/display/xe_plane_initial.c
index 873f4e18cb2a..a47e3275acb0 100644
--- a/drivers/gpu/drm/xe/display/xe_plane_initial.c
+++ b/drivers/gpu/drm/xe/display/xe_plane_initial.c
@@ -22,6 +22,7 @@
 #include &quot;intel_plane_initial.h&quot;
 #include &quot;xe_bo.h&quot;
 #include &quot;xe_wa.h&quot;
+#include &quot;xe_vram_types.h&quot;</pre>
    </blockquote>
    Sort the header files in ascending order.<br>
    <br>
    <blockquote type="cite" cite="mid:20250702084424.3609863-4-piotr.piorkowski@intel.com">
      <pre wrap="" class="moz-quote-pre">
 
 #include &lt;generated/xe_wa_oob.h&gt;
 
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 7f8470b22dc9..a35a9e0dbfae 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -34,6 +34,7 @@
 #include &quot;xe_trace_bo.h&quot;
 #include &quot;xe_ttm_stolen_mgr.h&quot;
 #include &quot;xe_vm.h&quot;
+#include &quot;xe_vram_types.h&quot;
 
 const char *const xe_mem_type_to_name[TTM_NUM_MEM_TYPES]  = {
 	[XE_PL_SYSTEM] = &quot;system&quot;,
diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
index ff560d82496f..57d34698139e 100644
--- a/drivers/gpu/drm/xe/xe_bo_types.h
+++ b/drivers/gpu/drm/xe/xe_bo_types.h
@@ -9,6 +9,7 @@
 #include &lt;linux/iosys-map.h&gt;
 
 #include &lt;drm/drm_gpusvm.h&gt;
+#include &lt;drm/drm_pagemap.h&gt;
 #include &lt;drm/ttm/ttm_bo.h&gt;
 #include &lt;drm/ttm/ttm_device.h&gt;
 #include &lt;drm/ttm/ttm_placement.h&gt;
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 19019b032c78..4bd0619574ff 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -63,6 +63,7 @@
 #include &quot;xe_ttm_sys_mgr.h&quot;
 #include &quot;xe_vm.h&quot;
 #include &quot;xe_vram.h&quot;
+#include &quot;xe_vram_types.h&quot;
 #include &quot;xe_vsec.h&quot;
 #include &quot;xe_wait_user_fence.h&quot;
 #include &quot;xe_wa.h&quot;
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index bd8aa742618b..619728bba77a 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -10,7 +10,6 @@
 
 #include &lt;drm/drm_device.h&gt;
 #include &lt;drm/drm_file.h&gt;
-#include &lt;drm/drm_pagemap.h&gt;
 #include &lt;drm/ttm/ttm_device.h&gt;
 
 #include &quot;xe_devcoredump_types.h&quot;
@@ -24,7 +23,6 @@
 #include &quot;xe_sriov_types.h&quot;
 #include &quot;xe_step_types.h&quot;
 #include &quot;xe_survivability_mode_types.h&quot;
-#include &quot;xe_ttm_vram_mgr_types.h&quot;
 
 #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
 #define TEST_VM_OPS_ERROR
@@ -36,6 +34,7 @@ struct intel_dg_nvm_dev;
 struct xe_ggtt;
 struct xe_pat_ops;
 struct xe_pxp;
+struct xe_vram;</pre>
    </blockquote>
    Follow inverse xmas tree format.<br>
    <br>
    <blockquote type="cite" cite="mid:20250702084424.3609863-4-piotr.piorkowski@intel.com">
      <pre wrap="" class="moz-quote-pre">
 
 #define XE_BO_INVALID_OFFSET	LONG_MAX
 
@@ -68,63 +67,6 @@ struct xe_pxp;
 		 const struct xe_tile * : (const struct xe_device *)((tile__)-&gt;xe),	\
 		 struct xe_tile * : (tile__)-&gt;xe)
 
-/**
- * struct xe_vram_region - memory region structure
- * This is used to describe a memory region in xe
- * device, such as HBM memory or CXL extension memory.
- */
-struct xe_vram_region {
-	/** @tile: Back pointer to tile */
-	struct xe_tile *tile;
-	/** @io_start: IO start address of this VRAM instance */
-	resource_size_t io_start;
-	/**
-	 * @io_size: IO size of this VRAM instance
-	 *
-	 * This represents how much of this VRAM we can access
-	 * via the CPU through the VRAM BAR. This can be smaller
-	 * than @usable_size, in which case only part of VRAM is CPU
-	 * accessible (typically the first 256M). This
-	 * configuration is known as small-bar.
-	 */
-	resource_size_t io_size;
-	/** @dpa_base: This memory regions's DPA (device physical address) base */
-	resource_size_t dpa_base;
-	/**
-	 * @usable_size: usable size of VRAM
-	 *
-	 * Usable size of VRAM excluding reserved portions
-	 * (e.g stolen mem)
-	 */
-	resource_size_t usable_size;
-	/**
-	 * @actual_physical_size: Actual VRAM size
-	 *
-	 * Actual VRAM size including reserved portions
-	 * (e.g stolen mem)
-	 */
-	resource_size_t actual_physical_size;
-	/** @mapping: pointer to VRAM mappable space */
-	void __iomem *mapping;
-	/** @ttm: VRAM TTM manager */
-	struct xe_ttm_vram_mgr ttm;
-#if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
-	/** @pagemap: Used to remap device memory as ZONE_DEVICE */
-	struct dev_pagemap pagemap;
-	/**
-	 * @dpagemap: The struct drm_pagemap of the ZONE_DEVICE memory
-	 * pages of this tile.
-	 */
-	struct drm_pagemap dpagemap;
-	/**
-	 * @hpa_base: base host physical address
-	 *
-	 * This is generated when remap device memory as ZONE_DEVICE
-	 */
-	resource_size_t hpa_base;
-#endif
-};
-
 /**
  * struct xe_mmio - register mmio structure
  *
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index e69a05126dae..275ab5f03291 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -33,6 +33,7 @@
 #include &quot;xe_migrate.h&quot;
 #include &quot;xe_sriov.h&quot;
 #include &quot;xe_ttm_vram_mgr.h&quot;
+#include &quot;xe_vram_types.h&quot;
 #include &quot;xe_wopcm.h&quot;
 
 #define make_u64_from_u32(hi, lo) ((u64)((u64)(u32)(hi) &lt;&lt; 32 | (u32)(lo)))
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index e6871734ffa9..ee015e3f5d9e 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -17,6 +17,7 @@
 #include &quot;xe_ttm_vram_mgr.h&quot;
 #include &quot;xe_vm.h&quot;
 #include &quot;xe_vm_types.h&quot;
+#include &quot;xe_vram_types.h&quot;
 
 static bool xe_svm_range_in_vram(struct xe_svm_range *range)
 {
@@ -1006,7 +1007,7 @@ int xe_svm_alloc_vram(struct xe_tile *tile, struct xe_svm_range *range,
 	xe_assert(tile_to_xe(tile), range-&gt;base.flags.migrate_devmem);
 	range_debug(range, &quot;ALLOCATE VRAM&quot;);
 
-	dpagemap = xe_tile_local_pagemap(tile);
+	dpagemap = &amp;tile-&gt;mem.vram-&gt;dpagemap;
 	return drm_pagemap_populate_mm(dpagemap, xe_svm_range_start(range),
 				       xe_svm_range_end(range),
 				       range-&gt;base.gpusvm-&gt;mm,
diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
index 858ce0183aaa..bd2ff91a7d1c 100644
--- a/drivers/gpu/drm/xe/xe_tile.c
+++ b/drivers/gpu/drm/xe/xe_tile.c
@@ -20,6 +20,7 @@
 #include &quot;xe_ttm_vram_mgr.h&quot;
 #include &quot;xe_wa.h&quot;
 #include &quot;xe_vram.h&quot;
+#include &quot;xe_vram_types.h&quot;
 
 /**
  * DOC: Multi-tile Design
diff --git a/drivers/gpu/drm/xe/xe_tile.h b/drivers/gpu/drm/xe/xe_tile.h
index fb0473fa9098..8dd87ccb2aca 100644
--- a/drivers/gpu/drm/xe/xe_tile.h
+++ b/drivers/gpu/drm/xe/xe_tile.h
@@ -18,15 +18,4 @@ int xe_tile_alloc_vram(struct xe_tile *tile);
 
 void xe_tile_migrate_wait(struct xe_tile *tile);
 
-#if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
-static inline struct drm_pagemap *xe_tile_local_pagemap(struct xe_tile *tile)
-{
-	return &amp;tile-&gt;mem.vram-&gt;dpagemap;
-}
-#else
-static inline struct drm_pagemap *xe_tile_local_pagemap(struct xe_tile *tile)
-{
-	return NULL;
-}
-#endif
 #endif
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index 3de2df47959b..8f9b8a1d2c05 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -15,6 +15,7 @@
 #include &quot;xe_gt.h&quot;
 #include &quot;xe_res_cursor.h&quot;
 #include &quot;xe_ttm_vram_mgr.h&quot;
+#include &quot;xe_vram_types.h&quot;
 
 static inline struct drm_buddy_block *
 xe_ttm_vram_mgr_first_block(struct list_head *list)
diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
index 71f463f2c3be..35fd7f5d7cff 100644
--- a/drivers/gpu/drm/xe/xe_vram.c
+++ b/drivers/gpu/drm/xe/xe_vram.c
@@ -20,6 +20,7 @@
 #include &quot;xe_module.h&quot;
 #include &quot;xe_sriov.h&quot;
 #include &quot;xe_vram.h&quot;
+#include &quot;xe_vram_types.h&quot;
 
 #define BAR_SIZE_SHIFT 20
 
diff --git a/drivers/gpu/drm/xe/xe_vram_types.h b/drivers/gpu/drm/xe/xe_vram_types.h
new file mode 100644
index 000000000000..a01838236036
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_vram_types.h
@@ -0,0 +1,74 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef _XE_VRAM_TYPES_H_
+#define _XE_VRAM_TYPES_H_
+
+#if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
+#include &lt;drm/drm_pagemap.h&gt;
+#endif
+
+#include &quot;xe_ttm_vram_mgr_types.h&quot;
+
+struct xe_tile;
+
+/**
+ * struct xe_vram_region - memory region structure
+ * This is used to describe a memory region in xe
+ * device, such as HBM memory or CXL extension memory.
+ */
+struct xe_vram_region {
+	/** @tile: Back pointer to tile */
+	struct xe_tile *tile;
+	/** @io_start: IO start address of this VRAM instance */
+	resource_size_t io_start;
+	/**
+	 * @io_size: IO size of this VRAM instance
+	 *
+	 * This represents how much of this VRAM we can access
+	 * via the CPU through the VRAM BAR. This can be smaller
+	 * than @usable_size, in which case only part of VRAM is CPU
+	 * accessible (typically the first 256M). This
+	 * configuration is known as small-bar.
+	 */
+	resource_size_t io_size;
+	/** @dpa_base: This memory regions's DPA (device physical address) base */
+	resource_size_t dpa_base;
+	/**
+	 * @usable_size: usable size of VRAM
+	 *
+	 * Usable size of VRAM excluding reserved portions
+	 * (e.g stolen mem)
+	 */
+	resource_size_t usable_size;
+	/**
+	 * @actual_physical_size: Actual VRAM size
+	 *
+	 * Actual VRAM size including reserved portions
+	 * (e.g stolen mem)
+	 */
+	resource_size_t actual_physical_size;
+	/** @mapping: pointer to VRAM mappable space */
+	void __iomem *mapping;
+	/** @ttm: VRAM TTM manager */
+	struct xe_ttm_vram_mgr ttm;
+#if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
+	/** @pagemap: Used to remap device memory as ZONE_DEVICE */
+	struct dev_pagemap pagemap;
+	/**
+	 * @dpagemap: The struct drm_pagemap of the ZONE_DEVICE memory
+	 * pages of this tile.
+	 */
+	struct drm_pagemap dpagemap;
+	/**
+	 * @hpa_base: base host physical address
+	 *
+	 * This is generated when remap device memory as ZONE_DEVICE
+	 */
+	resource_size_t hpa_base;
+#endif
+};
+
+#endif
</pre>
    </blockquote>
    With nits fixed,<br>
    <span style="font-family:Menlo">Reviewed-by: </span><span style="font-family:Aptos">Satyanarayana
      K V P &lt;</span><a href="mailto:satyanarayana.k.v.p@intel.com"><span style="font-family:Aptos">satyanarayana.k.v.p@intel.com</span></a><span style="font-family:Aptos">&gt;<br>
      <br>
    </span>
  </body>
</html>

--------------n0vjiyWsAGgE7DZvZx0xrYYq--
