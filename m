Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD119D3901A
	for <intel-xe@archiver.kernel.org>; Wed, 14 Jan 2026 21:17:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F3EA10E69A;
	Wed, 14 Jan 2026 21:17:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X7jHHNpM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 451F810E69C
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Jan 2026 21:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768425451; x=1799961451;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=pT0YZC5V1mxHOePnTMY9++YQkUHFr58Mhhc0SYt6Lt4=;
 b=X7jHHNpM8OVrAXor5kOeMpX2CebmK0wfqdT1z49+xgpH8QE8fdJPayca
 NMgHjLfF113zxPSzpgWXGTQEDMOIgjFOFrgJSMd3b5j088Iag4fbzXu17
 udzVyLNw7D0PucTkACP1POsV8LFQKvCPeXXE+uvqadQ54g0gjWrSjEdT6
 x/o9F5z6VEmW9lRhXWbcvSMx2W+6kHza0D53KrKGS4vnq2l18JfWmrToJ
 vsbXtgGZRIHksQrH1D7ERRxlowmA6hp7CZjiBmMH6y/ymAT6q9Xu7P9vT
 1KxUqVp6ig3zXhFhFS0eAp75qOYsvxoVK2TyO5/zrhUHN6yIpNHZHzVUv Q==;
X-CSE-ConnectionGUID: sSXhup8ISfOYns83ItOzOw==
X-CSE-MsgGUID: VJDKp/4oSdeK37IOAQBDIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="80453894"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; d="scan'208";a="80453894"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2026 13:17:30 -0800
X-CSE-ConnectionGUID: 3JyoXnhrRuOWAuFWa1E6XQ==
X-CSE-MsgGUID: IorDcs26Q96EuI/qxefmsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; d="scan'208";a="203999796"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2026 13:17:26 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 14 Jan 2026 13:17:21 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 14 Jan 2026 13:17:21 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.39) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 14 Jan 2026 13:17:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KT8YLL7salm9HhFAmrVeYYvWhPaAX1KlFJeDdaYAXpeFQtVWjGJwQdhsHRuxQ/+btLzvTKVTgYwEL6qxtYbak+5o7M6iWdT0t0Iw836u2MGhD4oRW1FaMfEfP2Keme9xIfXFbOZe/krsO4BjgmaSCJu73YtyzknLPpp6yySWh2mYVylXZ1FR81bJTv8mt2JOFsdalG4KVbsgR05uqW9XtIFVSaxLP8lxJKWGIQ2VqVeR7lXFWfmsKcZ+V2edI7kzMVk2mBdBX4pk1EvT6HGYtMS1P2L7Cbi5mTHdiM9h4nIEUVOWOwtuoNrJqNFKZcdX6tqOrCl+1EZ57DZe0wmZNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pT0YZC5V1mxHOePnTMY9++YQkUHFr58Mhhc0SYt6Lt4=;
 b=BmyhA1so1jOnWCA14lRHNtLX0XaViBFLqW4IP/DFaOOHLkcsL6Cw/UhPpG4cAlc8NI7RX48WVBSEPabLVLwO0pjTwmLjEN3GrmpJmQW8ibHKP3Yg3KZUTz6XDlouvqxjefNMtdtdeTUk05ibJmvlNkoQqxPAPLhNDIHkTi0TxrmgZ3ocqYeiT+TfwFpnvPbtrXzB4hm4JwP8adZWLfajYbcQXA1EpW3q7pcbbwtQPoOSv0hoNbK1mIwEBfVOrgUTAaqZCObJxK/Od8BGyr2crbOiIjNbn5wgthu/cADkl92z1v/ZD9fFfJ/2q4+r1GuDy+DQblvupHKb6ZpisS7HTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 SN7PR11MB6946.namprd11.prod.outlook.com (2603:10b6:806:2a9::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Wed, 14 Jan
 2026 21:17:18 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415%4]) with mapi id 15.20.9520.005; Wed, 14 Jan 2026
 21:17:18 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v4 10/12] drm/xe: Add exec queue active vfunc
Thread-Topic: [PATCH v4 10/12] drm/xe: Add exec queue active vfunc
Thread-Index: AQHchDe0SuBnIDUK9U+ntLOGaNjbl7VQn+0AgAAMMQCAAAFEAIABgICA
Date: Wed, 14 Jan 2026 21:17:18 +0000
Message-ID: <34980f8931ff389d1bbee61b8b317ddaef845604.camel@intel.com>
References: <20260113025232.3504648-1-matthew.brost@intel.com>
 <20260113025232.3504648-11-matthew.brost@intel.com>
 <ea9d5cbec2dfd68f0cc2f54834b28055ca29ab92.camel@intel.com>
 <aWbEQt0B/7CRgfzA@lstrano-desk.jf.intel.com>
 <a3868286e8d300a50af06209feb313646440d446.camel@intel.com>
In-Reply-To: <a3868286e8d300a50af06209feb313646440d446.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|SN7PR11MB6946:EE_
x-ms-office365-filtering-correlation-id: e09cd510-2482-46bb-bf27-08de53b24c89
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?YWp4R0YrSUhjQk1hY2JUSUd4K0t3VXRodXI5QVpMNmpTc2dwTkxqWk82cGJO?=
 =?utf-8?B?cDJQRlZ2MmZmV1ZJd2wvalp5MVF0RVArYkEvbDN6WXBtK3BlMk5raUZERGJS?=
 =?utf-8?B?ek12K2dtVkpXZENWYnZNSnUrWnByOUZCUmFkTHN4YmdWZkxEb1NXL2djR0c0?=
 =?utf-8?B?MkFVQzhwREpqcVlDODJjOHRxOVNqVFZaMzFnY3JRMXQ4YkhXQmg5ZXhEelJK?=
 =?utf-8?B?WFRpdjg3eWJFSWNmOG5kY0NSeGxNMXdQOHFBZnBkd2dUaHE3WUVIUTNjZERz?=
 =?utf-8?B?MU9MTEdudU5WdVFYMmlCTmRpd2ZoR3BVKzlNNEg3NVV4eXRKSlp6c1RLV3c4?=
 =?utf-8?B?Z1lmaUx0Vk5IMTg4b0l1aXpDK2hlWnA1NWVUQVk0aVppNUJwWkdrS3ZQcjkr?=
 =?utf-8?B?R1Z4bkRmdkN3dms3aS9jK1B0d0ZyZnd6Z3BsbXMzU1BqTGVRYkNlazBnT21z?=
 =?utf-8?B?eUROMkxyL3JXNExrK21kZ3l0R3BzSktKOGpOVmNNb3BNcnd2RVZ3Q25WK0RS?=
 =?utf-8?B?d0MzcEl6TU1BRlBtOXBWWjFkWVhqWTU0Tm90K00xOXUvR3RQZ2VwK3YxV3pj?=
 =?utf-8?B?NjFRSkNicjQ1UTdiQnRnY3lFdEVGcGV3OTMybWpFNGtscVBLYmV2V2Qzdnpq?=
 =?utf-8?B?YlAzdzRrS0hLM29NNzdPMHROcmtzUGRhMDdTanVFVGlzNFVvVDVHekhVSXJj?=
 =?utf-8?B?aXNXZG9UMWI4VkNiMVhteGVkcWtWS3lPWFFCZGpKK3hSRlZDc25Pd3R6dk1v?=
 =?utf-8?B?U0prWU1zZHd5bkNScjgvWEZteU4wN2s1MWpkZ29ENTJ6SWJNQ0lUTG9CUHJj?=
 =?utf-8?B?dmI1WWQxY1pJVnozT0NxNEt4S1dxc21NbG9zSUJoTm9zOThSYWIzQzJHa21W?=
 =?utf-8?B?dTZoNEFSWUFaTm9qRGlxVzBpaHJHczZUMDU0Y3FrRkcyMk1GTXlsTmlIYmZ5?=
 =?utf-8?B?bGF1ZGs1R2hSN3dHcjl2S3UrbUpTK2FSM3ZPNDlvVjFhcmxOUGdwTDVWNHJp?=
 =?utf-8?B?MTJYb1hJMzBQeFRFSVJ1WW1XTy8wRXhCUUJiRTB4dXVXQVY0WUtPZ2dCYjZB?=
 =?utf-8?B?U0s1b1FMY2FiTmpyTjdNV1ZCRHFEeUl2dTRiZWt5QzRXTXd4eXBoaFNYUk1h?=
 =?utf-8?B?a0l4OVN3YlZ5UVNndWxYYVVWbnUxL1RsUWZKV0M3SGNMcFRvdmhSN1FycE9Z?=
 =?utf-8?B?MVd6S2Y3MHYxcU5PMW10ZEtnOEwzU0EzQU9BYTN2UC9Id09pR1BDbXBnTlVv?=
 =?utf-8?B?RHlLUllmaE12Q1hyS0ErdTJ5TlAzT21ZaDRQc2xTSndpdmNwTUUwRUtHQWtl?=
 =?utf-8?B?RGtwYUZjUDIxbHlvSG5YTmRxc1Uycm5zZ0dzUHBWcDlXb2tON0F6QnVnNjVX?=
 =?utf-8?B?MVVNMzBzWWs4VjRMbWsvVjMycGNjNHRXUDlaVnE4R0NCYjRZenpyV0VhYlZ3?=
 =?utf-8?B?bVkzZElyTjN3Z2ZibU80bVEzTmlSbFpJR0VjcTBpdUUyMmFHL1hxMElYQjYz?=
 =?utf-8?B?eDlxT0ZiV0hzQldQZW1xUDM5cExSOCtNVXo2WWFCb1BKY0cvNGswVVpKN2hi?=
 =?utf-8?B?WHVUMTFrSXJ1TG4xV0JORVNHWWFPR3ZSS0VFS0NQY0VvY2l0WTFyVURJL1FJ?=
 =?utf-8?B?ek9qMkRTdXhlUWRZa3pwaGwvNHNCa3VBK3JvU0JzVkE1c0FHZDlWUy9OSnQ3?=
 =?utf-8?B?MGZDVzZGaHNtWW43dmIwUUovUVY3S3BjSGwxVjBQMm82cEc3Mks2SVltYTRr?=
 =?utf-8?B?MGM5bnRESEVJdWtWcTFBSHBDaVlEdVhycWJEbG5NY2JDNVkrVGo0UWpNeUMv?=
 =?utf-8?B?K1Zqd3FSQ2xhWERaV1VCUHhibnFzS0lzSDk1OW1sTnlRL1haOEdmZkpJZVlz?=
 =?utf-8?B?NzVsV0Q4S3gxem96aHBxcFNxb1BKTmN4eDNWMlNyNDAzd240ZmppN3FZN1FC?=
 =?utf-8?B?U3JSYkRlcytxQ2xPUXpFdDJIcWJoeDlRMjdzVU5EME9CRzFEWGFMK2ZncG1F?=
 =?utf-8?B?WHZWeFg1bWdTYWhkZXlwQVZsTCsvQjFSYjVoeGdXRTRiejlSbzlMTTNOSFYz?=
 =?utf-8?B?ZFFxelRoMFlOMEZmVVBSVVR6eDM5V0lvcjBsMHg0VTZnNFdZTjVqL2IzODMx?=
 =?utf-8?B?QUdpMFhya1N1NzU1TVBBSVlBblVhdi9Fc0d1U1B1d1NMZW9xQ0pwWWoxSTE2?=
 =?utf-8?Q?g8Ys/lKnuMB+ciOWzhbsm7I=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dVQ0dUU4L1hlZUp3M0twbWxPYlZwdkNvSTN5TVlEeGxoTThUY0xRZlB4MlVa?=
 =?utf-8?B?MU1kb3ZvTE9oZ2s5d283TnpCQSszajRiMTNMemVQVlE0b2tDNFJoUzBuVUtl?=
 =?utf-8?B?bGR4cnFHQUV0YXFscVM5amI2OXdkSksvY090L0J0NjBoSlRCdGNjdVBvTm5Q?=
 =?utf-8?B?MFFscHhjSkp5WGc2LzRER1VSeUFVai8zWVBrWm1NcWhBYkxQTDlTQUcxbE5z?=
 =?utf-8?B?ekF2bGtJRDRyb1FsNlpUS1k3cWJqOHFLR1M3V3dxdXorKzJ4K0VaZXIwUjlX?=
 =?utf-8?B?TkFpcmFRRTFKajUyU0Zacms5ekhQYTFGK2pGNmJWVUNmYTBjMkQ5a2h3UCtm?=
 =?utf-8?B?Y0s1VTcyY3d4NmhyMW9DWFBvMWFOUGIwcTV6YnhsbkpLUVBRWnJ2WTcrTCtp?=
 =?utf-8?B?ai9xVkdYM0llVEJ1dGtNZHV5T0M1MnpGcVlETjl1ZUhmMXU0SDIzdU92dXJX?=
 =?utf-8?B?RTNGbDFySXZ1bjZhYlFyL1NweXc1NXVDV3RINmNSRG9oRlgvMi8zR0V4WEo1?=
 =?utf-8?B?NGgvMEMrS2U3dldnR1NYYTQ0aU5rbVMxMGJRcVRjRGhFdi90aGNjdGpzeW1v?=
 =?utf-8?B?dlNXMTYzLzFvUkJYczc0ZEkzVm1VbEUxdTFrejJiYi94TlVvdmdGdlN5UGtR?=
 =?utf-8?B?S3h5VTVDSHUxUW5TSkxObnpYbmVxK0FjNWJ5TUUzTzRUanJTRlJoYlNvRHVy?=
 =?utf-8?B?cE52OTEwUkRlalNxTE5WVkVad3dicnlmTTZTSHhCVkRLY21xSXc2OURyRGNZ?=
 =?utf-8?B?dkNiUGJiaFprYkx4YS84cVZjaEdYRXdtVC81ZW1OSWVkcDYveHZLM3c4blkr?=
 =?utf-8?B?Z3FCcEtoSUJWKzY1Y3ZhUEdFZmYzbnIyQW55QTFTeHRoUEZRNkgxTUNuTDMv?=
 =?utf-8?B?WHg3WWNJUGtNSFdXZkxodzNEMURhSUxiaGtRWHhJUHBrekdXVUhQY1VjZU9w?=
 =?utf-8?B?Ri82eUZ1bXVSUWM5dFliNUIyb1JBYjVzUkt3blhhMjFUdW9BNUhuRno3UUsy?=
 =?utf-8?B?WVRRamM1NERYZkE1Q0RJNXlOemd2MTc0enpqdVBDUW05UVhLNWxaOXkxMWMz?=
 =?utf-8?B?bWI1dEZ3SjFnck53aVo3elZmRjNJdlhTeDB4VHFaZEJ0eGNFa1RhM2plQk9y?=
 =?utf-8?B?b2s5Sm91TmJsMEoyZGlPRWRMWXJpZStWNkJhN1ExRkVmTVRpVjVZakhqanlH?=
 =?utf-8?B?TnRWMm1KQ0M1MklLSjBwSkwvOWcvM1c3SjhvaFo3NWJ5UmthV1R0SDdtRU1X?=
 =?utf-8?B?MVh5UDdDYlVEY0k5eGVoNEZiclNpZG9aZ21adDd5VFBPWmYwV3hhcG9WSzFB?=
 =?utf-8?B?cU02M2d2QnZkWGdDNWI4d1poVGkzSlVxbTl0TGtHemdZUGJ3QW9LTy96VEp3?=
 =?utf-8?B?clBnRys1aTVGc3FmeHhhQ1R3WWM1dzVPbUdtZG93N0w3aFpQc0JhanVXb1Uw?=
 =?utf-8?B?cmU2OExXVjhjL3lBZEpYcHFGZ1JiTS94TnVmY2VWR1plT3lMcUttWWt5RkMz?=
 =?utf-8?B?SXYrNjZoT0xxdUV3cGJVbVFRVVU5YklDcEdoa2FWb1BCTFRpT2NCY1NNNVpJ?=
 =?utf-8?B?all5VkdBZ3NWR255T0srRHA2ZHZOV0FPRjBnb3NRVTNSOFFTQmhRQkZNaUgr?=
 =?utf-8?B?T3ZuK2lBYVJkVWdPdnlmd1gvQ0RyUGZvYlFnOWZwRUdGZFU1dHJRblJHN1dN?=
 =?utf-8?B?eFZLWjlDY3VUYzhVV2ZzUjFycFVDbzBGblhvb0xSbUluUnN1QmVIN0ppWEY4?=
 =?utf-8?B?NTNEU25EbkIyb3lmYmZNYW8xcjJ2UlQ4T1JCcDQrVDFUOEwzMEhLdllBQ1FH?=
 =?utf-8?B?RUtsZEF1NFAyUnQwbVBHMk1aTFBsdndGa2VIbG9PZ3RWdGdlSmN5VGVNWGk2?=
 =?utf-8?B?WmNWem9xN3lzclNreUU2MFcyU2huYlhOV2hiQlhOLzNHenhwMHp5MVEwOTVH?=
 =?utf-8?B?a3BLUURoaFFTczZRM01EN09MNzdKTmtwUzBhK0ZqOXg0QjRvY2FTMjJJUGhq?=
 =?utf-8?B?TWNzK3lub2xMQ1hGS3RnUGhQckpXKzMvbEZZMVF3dWRMbGg5MGtwcEVzd1lI?=
 =?utf-8?B?dkI2WFloL0tuV216U3R3RkZKYno0M09oTkJ0c0pKeXgvSXU0ZldXMVBLdTJa?=
 =?utf-8?B?aUFvT2Z3aFRHdFV6eGszZWpaU3FYdUVUVnJraVVOYTNGV2lrTXh5WDhDQXQw?=
 =?utf-8?B?b2xzbHdtT2FRV2VTbi96czhHS0hrTUZjOERSUEZGVllXTHEybWJQdlpKWk5Z?=
 =?utf-8?B?VFJ4ZjhvQ2FrUTQzdW03SEpsWUltWXVieE1teHYvd0VUNm1CZWYramh2cklE?=
 =?utf-8?B?SXZHMzNXQVNkTGpmc0lieVJ0cFdLZHA0Q2lIUmI1cEdPRitkbkxZaGxXRTJy?=
 =?utf-8?Q?osZdBVMmVLwa6PmI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7AEFC3B7E844874C9AD7CC9D6962B4A2@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e09cd510-2482-46bb-bf27-08de53b24c89
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2026 21:17:18.6269 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zJJ9oK7kjN7tZaEmHWoA9wJI4D/5mT307xY9fmUqE3fXgaqGY3kU5SFC7kTHnj/9U9K9mqowzf5nUYygXkrdJlFq9Z7ItOGc6o1eXhDgsUw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6946
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

T24gVHVlLCAyMDI2LTAxLTEzIGF0IDIyOjIxICswMDAwLCBTdW1tZXJzLCBTdHVhcnQgd3JvdGU6
DQo+IE9uIFR1ZSwgMjAyNi0wMS0xMyBhdCAxNDoxNiAtMDgwMCwgTWF0dGhldyBCcm9zdCB3cm90
ZToNCj4gPiBPbiBUdWUsIEphbiAxMywgMjAyNiBhdCAwMjozMjo1OFBNIC0wNzAwLCBTdW1tZXJz
LCBTdHVhcnQgd3JvdGU6DQo+ID4gPiBPbiBNb24sIDIwMjYtMDEtMTIgYXQgMTg6NTIgLTA4MDAs
IE1hdHRoZXcgQnJvc3Qgd3JvdGU6DQo+ID4gPiA+IElmIGFuIGV4ZWMgcXVldWUgaXMgaW5hY3Rp
dmUgKGUuZy4sIG5vdCByZWdpc3RlcmVkIG9yDQo+ID4gPiA+IHNjaGVkdWxpbmcNCj4gPiA+ID4g
aXMNCj4gPiA+ID4gZGlzYWJsZWQpLCBUTEIgaW52YWxpZGF0aW9ucyBhcmUgbm90IGlzc3VlZCBm
b3IgdGhhdCBxdWV1ZS4gQWRkDQo+ID4gPiA+IGENCj4gPiA+ID4gdmlydHVhbCBmdW5jdGlvbiB0
byBkZXRlcm1pbmUgdGhlIGFjdGl2ZSBzdGF0ZSwgd2hpY2ggVExCDQo+ID4gPiA+IGludmFsaWRh
dGlvbg0KPiA+ID4gPiBsb2dpYyBjYW4gaG9vayBpbnRvLg0KPiA+ID4gPiANCj4gPiA+ID4gU2ln
bmVkLW9mZi1ieTogTWF0dGhldyBCcm9zdCA8bWF0dGhldy5icm9zdEBpbnRlbC5jb20+DQo+ID4g
PiA+IC0tLQ0KPiA+ID4gPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9leGVjX3F1ZXVlX3R5cGVz
LmggfCAyICsrDQo+ID4gPiA+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2V4ZWNsaXN0LmPCoMKg
wqDCoMKgwqDCoMKgIHwgNyArKysrKysrDQo+ID4gPiA+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hl
X2d1Y19zdWJtaXQuY8KgwqDCoMKgwqDCoCB8IDYgKysrKysrDQo+ID4gPiA+IMKgMyBmaWxlcyBj
aGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspDQo+ID4gPiA+IA0KPiA+ID4gPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX2V4ZWNfcXVldWVfdHlwZXMuaA0KPiA+ID4gPiBiL2RyaXZl
cnMvZ3B1L2RybS94ZS94ZV9leGVjX3F1ZXVlX3R5cGVzLmgNCj4gPiA+ID4gaW5kZXggZDNlMjc4
OWNmNWJjLi45Y2NhNTU4YzU4MDkgMTAwNjQ0DQo+ID4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9leGVjX3F1ZXVlX3R5cGVzLmgNCj4gPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L3hlL3hlX2V4ZWNfcXVldWVfdHlwZXMuaA0KPiA+ID4gPiBAQCAtMjk4LDYgKzI5OCw4IEBAIHN0
cnVjdCB4ZV9leGVjX3F1ZXVlX29wcyB7DQo+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqB2b2lkICgq
cmVzdW1lKShzdHJ1Y3QgeGVfZXhlY19xdWV1ZSAqcSk7DQo+ID4gPiA+IMKgwqDCoMKgwqDCoMKg
wqAvKiogQHJlc2V0X3N0YXR1czogY2hlY2sgZXhlYyBxdWV1ZSByZXNldCBzdGF0dXMgKi8NCj4g
PiA+ID4gwqDCoMKgwqDCoMKgwqDCoGJvb2wgKCpyZXNldF9zdGF0dXMpKHN0cnVjdCB4ZV9leGVj
X3F1ZXVlICpxKTsNCj4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgLyoqIEBhY3RpdmU6IGNoZWNrIGV4
ZWMgcXVldWUgaXMgYWN0aXZlICovDQo+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoGJvb2wgKCphY3Rp
dmUpKHN0cnVjdCB4ZV9leGVjX3F1ZXVlICpxKTsNCj4gPiA+ID4gwqB9Ow0KPiA+ID4gPiDCoA0K
PiA+ID4gPiDCoCNlbmRpZg0KPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hl
L3hlX2V4ZWNsaXN0LmMNCj4gPiA+ID4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZXhlY2xpc3Qu
Yw0KPiA+ID4gPiBpbmRleCA0NmMxN2ExOGEzZjQuLmU0YTI2NzRmNDhjNyAxMDA2NDQNCj4gPiA+
ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2V4ZWNsaXN0LmMNCj4gPiA+ID4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX2V4ZWNsaXN0LmMNCj4gPiA+ID4gQEAgLTQ2OSw2ICs0Njks
MTIgQEAgc3RhdGljIGJvb2wNCj4gPiA+ID4gZXhlY2xpc3RfZXhlY19xdWV1ZV9yZXNldF9zdGF0
dXMoc3RydWN0IHhlX2V4ZWNfcXVldWUgKnEpDQo+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqByZXR1
cm4gZmFsc2U7DQo+ID4gPiA+IMKgfQ0KPiA+ID4gPiDCoA0KPiA+ID4gPiArc3RhdGljIGJvb2wg
ZXhlY2xpc3RfZXhlY19xdWV1ZV9hY3RpdmUoc3RydWN0IHhlX2V4ZWNfcXVldWUNCj4gPiA+ID4g
KnEpDQo+ID4gPiA+ICt7DQo+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoC8qIE5JWSAqLw0KPiA+ID4g
PiArwqDCoMKgwqDCoMKgwqByZXR1cm4gZmFsc2U7DQo+ID4gPiA+ICt9DQo+ID4gPiA+ICsNCj4g
PiA+ID4gwqBzdGF0aWMgY29uc3Qgc3RydWN0IHhlX2V4ZWNfcXVldWVfb3BzIGV4ZWNsaXN0X2V4
ZWNfcXVldWVfb3BzDQo+ID4gPiA+ID0NCj4gPiA+ID4gew0KPiA+ID4gPiDCoMKgwqDCoMKgwqDC
oMKgLmluaXQgPSBleGVjbGlzdF9leGVjX3F1ZXVlX2luaXQsDQo+ID4gPiA+IMKgwqDCoMKgwqDC
oMKgwqAua2lsbCA9IGV4ZWNsaXN0X2V4ZWNfcXVldWVfa2lsbCwNCj4gPiA+ID4gQEAgLTQ4MSw2
ICs0ODcsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHhlX2V4ZWNfcXVldWVfb3BzDQo+ID4gPiA+
IGV4ZWNsaXN0X2V4ZWNfcXVldWVfb3BzID0gew0KPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgLnN1
c3BlbmRfd2FpdCA9IGV4ZWNsaXN0X2V4ZWNfcXVldWVfc3VzcGVuZF93YWl0LA0KPiA+ID4gPiDC
oMKgwqDCoMKgwqDCoMKgLnJlc3VtZSA9IGV4ZWNsaXN0X2V4ZWNfcXVldWVfcmVzdW1lLA0KPiA+
ID4gPiDCoMKgwqDCoMKgwqDCoMKgLnJlc2V0X3N0YXR1cyA9IGV4ZWNsaXN0X2V4ZWNfcXVldWVf
cmVzZXRfc3RhdHVzLA0KPiA+ID4gPiArwqDCoMKgwqDCoMKgwqAuYWN0aXZlID0gZXhlY2xpc3Rf
ZXhlY19xdWV1ZV9hY3RpdmUsDQo+ID4gPiA+IMKgfTsNCj4gPiA+ID4gwqANCj4gPiA+ID4gwqBp
bnQgeGVfZXhlY2xpc3RfaW5pdChzdHJ1Y3QgeGVfZ3QgKmd0KQ0KPiA+ID4gPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19zdWJtaXQuYw0KPiA+ID4gPiBiL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV9ndWNfc3VibWl0LmMNCj4gPiA+ID4gaW5kZXggYmU4ZmE3NmJhZjFkLi4x
OTI4MmU1Y2E4OTcgMTAwNjQ0DQo+ID4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9n
dWNfc3VibWl0LmMNCj4gPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19zdWJt
aXQuYw0KPiA+ID4gPiBAQCAtMjIwMyw2ICsyMjAzLDExIEBAIHN0YXRpYyBib29sDQo+ID4gPiA+
IGd1Y19leGVjX3F1ZXVlX3Jlc2V0X3N0YXR1cyhzdHJ1Y3QNCj4gPiA+ID4geGVfZXhlY19xdWV1
ZSAqcSkNCj4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoHJldHVybiBleGVjX3F1ZXVlX3Jlc2V0KHEp
IHx8DQo+ID4gPiA+IGV4ZWNfcXVldWVfa2lsbGVkX29yX2Jhbm5lZF9vcl93ZWRnZWQocSk7DQo+
ID4gPiA+IMKgfQ0KPiA+ID4gPiDCoA0KPiA+ID4gPiArc3RhdGljIGJvb2wgZ3VjX2V4ZWNfcXVl
dWVfYWN0aXZlKHN0cnVjdCB4ZV9leGVjX3F1ZXVlICpxKQ0KPiA+ID4gPiArew0KPiA+ID4gPiAr
wqDCoMKgwqDCoMKgwqByZXR1cm4gZXhlY19xdWV1ZV9lbmFibGVkKHEpICYmDQo+ID4gPiA+ICFl
eGVjX3F1ZXVlX3BlbmRpbmdfZGlzYWJsZShxKTsNCj4gPiA+IA0KPiA+ID4gU28gSSB0aGluayB0
aGUgcmVxdWlyZW1lbnQgaGVyZSBpcyAhZXhlY19xdWV1ZV9wZW5kaW5nX2Rpc2FibGUgJiYNCj4g
PiA+ICFleGVjX3F1ZXVlX2Rlc3Ryb3llZCByYXRoZXIgdGhhbiBleGVjX3F1ZXVlX2VuYWJsZWQu
Li4gQnV0IGlmDQo+ID4gPiB0aGUNCj4gPiANCj4gPiBJZiBkZXN0cm95ZWQgaXMgc2V0LCB0aGUg
cmVmY291bnRpbmcgZXhjaGFuZ2UgaW4gdGhlIGZvbGxvd2luZw0KPiA+IHBhdGNoDQo+ID4gd2ls
bCBmYWlsLCBzbyBleGVjX3F1ZXVlX2Rlc3Ryb3llZCBjaGVjayBoZXJlIGlzbid0IG5lZWRlZC4N
Cj4gDQo+IE9rLiBTdGlsbCBsb29raW5nIG92ZXIgdGhhdCBvdGhlciBjb21tZW50IGJ1dCBpdCBs
b29rcyBwcm9taXNpbmcuLi4NCj4gDQo+ID4gDQo+ID4gPiBjb250ZXh0IGlzbid0IGVuYWJsZWQg
KHNldCBydW5uYWJsZSB0byB0cnVlIGluIEd1QyksIGl0IG1lYW5zDQo+ID4gPiBoYXJkd2FyZQ0K
PiA+ID4gc2hvdWxkbid0IGJlIHRvdWNoaW5nIGFueSBvZiB0aGUgYXNzb2NpYXRlZCBtZW1vcnkg
YW55d2F5IGFuZCB3ZQ0KPiA+ID4gc2hvdWxkbid0IGJlIGlzc3VpbmcgYW55IGludmFsaWRhdGlv
bnMsIHNvIHRoaXMgc3RpbGwgbG9va3Mgb2sgdG8NCj4gPiA+IG1lLg0KPiA+ID4gSXQgbWVhbnMg
d2UnbGwgYmUgZG9pbmcgZnVsbCBpbnZhbGlkYXRpb25zIGZvciB0aG9zZSBJIHRoaW5rDQo+ID4g
PiB0aG91Z2gNCj4gPiA+IHdoaWNoIGNvdWxkIGFkZCBzb21lIHBlcmZvcm1hbmNlIGltcGFjdCBp
biB0aGUgdGltZSBiZXR3ZWVuDQo+ID4gPiByZWdpc3Rlcg0KPiA+ID4gYW5kIGVuYWJsZS4gRm9y
IG5vdyB0aG91Z2ggYXMgbG9uZyBhcyB0aGlzIGlzIHdvcmtpbmcgKHN0aWxsDQo+ID4gPiBkb2lu
Zw0KPiA+ID4gc29tZQ0KPiA+ID4gdGVzdGluZyBvbiBteSBlbmQgYW5kIEkgaGFkIHNvbWUgcXVl
c3Rpb25zIGluIGEgbGF0ZXIgcGF0Y2gpLCB3ZQ0KPiA+ID4gY2FuIGdvDQo+ID4gPiB3aXRoIHRo
aXMuDQo+ID4gDQo+ID4gTXkgcmVhc29uaW5nIGhlcmUgaXMgdGhhdCB0aGUgY29udGV4dCBpcyBu
b3QgZW5hYmxlZCwgc28gd2UgZG9u4oCZdA0KPiA+IG5lZWQNCj4gPiB0byBpc3N1ZSBhbiBpbnZh
bGlkYXRpb24gYmVjYXVzZSB0aGUgbmV4dCBjb250ZXh0IHN3aXRjaCB0byB0aGUNCj4gPiBoYXJk
d2FyZQ0KPiA+IHdpbGwgaXNzdWUgb25l4oCUdGhhdOKAmXMgdGhlIGN1cnJlbnQgaGFyZHdhcmUg
YmVoYXZpb3IuIElmIHRoYXQNCj4gPiBjaGFuZ2VzLA0KPiA+IHRoaXMgY291bGQgc2ltcGx5IGJl
Y29tZSBhbiBleGVjX3F1ZXVlX3JlZ2lzdGVyZWQgY2hlY2suIEkgZm9yZ2V0DQo+ID4gaWYNCj4g
PiB0aGlzIGlzIGNoYW5naW5nIGluIGZ1dHVyZSBoYXJkd2FyZS4NCj4gDQo+IE9rLi4uIHllYWgg
SSBndWVzcyB3ZSBjYW4gYWRkcmVzcyB0aGlzIGlmIGl0IGNvbWVzIHVwLiBJIHdhcyBtb3JlDQo+
IHdvcnJpZWQgYWJvdXQgdGhpcyBmYWxsaW5nIGJhY2sgdG8gdGhlIGZ1bGwgaW52YWxpZGF0aW9u
IGlmIHRoZSBsaXN0DQo+IHdhcyBlbXB0eSBoZXJlLg0KPiANCj4gPiANCj4gPiBJIGFsc28gbm90
aWNlZCBJIGhhdmUgYSBtdWx0aS1xdWV1ZSBidWcgaGVyZSB0b28uIFRoaXMgbmVlZHMgdG8NCj4g
PiBjaGVjaw0KPiA+IHRoZSBwcmltYXJ5IHF1ZXVl4oCZcyBzdGF0ZSBmb3IgbXVsdGktcXVldWUu
DQo+IA0KPiBBaCB0cnVlLCBnb29kIGNhdGNoLi4uDQoNCkp1c3QgYSBxdWljayBjb25maXJtYXRp
b24uLiBubyBvdGhlciBjb25jZXJucyBmcm9tIG1lIG9uIHRoaXMgcGF0Y2gNCm91dHNpZGUgb2Yg
dGhlIHNlY29uZGFyeSBxdWV1ZSBjaGVjayB5b3UgaGFkIG1lbnRpb25lZC4NCg0KVGhhbmtzLA0K
U3R1YXJ0DQoNCj4gDQo+IFRoYW5rcywNCj4gU3R1YXJ0DQo+IA0KPiA+IA0KPiA+IE1hdHQNCj4g
PiANCj4gPiA+IA0KPiA+ID4gVGhhbmtzLA0KPiA+ID4gU3R1YXJ0DQo+ID4gPiANCj4gPiA+ID4g
K30NCj4gPiA+ID4gKw0KPiA+ID4gPiDCoC8qDQo+ID4gPiA+IMKgICogQWxsIG9mIHRoZXNlIGZ1
bmN0aW9ucyBhcmUgYW4gYWJzdHJhY3Rpb24gbGF5ZXIgd2hpY2ggb3RoZXINCj4gPiA+ID4gcGFy
dHMNCj4gPiA+ID4gb2YgWGUgY2FuDQo+ID4gPiA+IMKgICogdXNlIHRvIHRyYXAgaW50byB0aGUg
R3VDIGJhY2tlbmQuIEFsbCBvZiB0aGVzZSBmdW5jdGlvbnMsDQo+ID4gPiA+IGFzaWRlDQo+ID4g
PiA+IGZyb20gaW5pdCwNCj4gPiA+ID4gQEAgLTIyMjIsNiArMjIyNyw3IEBAIHN0YXRpYyBjb25z
dCBzdHJ1Y3QgeGVfZXhlY19xdWV1ZV9vcHMNCj4gPiA+ID4gZ3VjX2V4ZWNfcXVldWVfb3BzID0g
ew0KPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgLnN1c3BlbmRfd2FpdCA9IGd1Y19leGVjX3F1ZXVl
X3N1c3BlbmRfd2FpdCwNCj4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoC5yZXN1bWUgPSBndWNfZXhl
Y19xdWV1ZV9yZXN1bWUsDQo+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqAucmVzZXRfc3RhdHVzID0g
Z3VjX2V4ZWNfcXVldWVfcmVzZXRfc3RhdHVzLA0KPiA+ID4gPiArwqDCoMKgwqDCoMKgwqAuYWN0
aXZlID0gZ3VjX2V4ZWNfcXVldWVfYWN0aXZlLA0KPiA+ID4gPiDCoH07DQo+ID4gPiA+IMKgDQo+
ID4gPiA+IMKgc3RhdGljIHZvaWQgZ3VjX2V4ZWNfcXVldWVfc3RvcChzdHJ1Y3QgeGVfZ3VjICpn
dWMsIHN0cnVjdA0KPiA+ID4gPiB4ZV9leGVjX3F1ZXVlICpxKQ0KPiA+ID4gDQo+IA0KDQo=
