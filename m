Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87B8DD18151
	for <intel-xe@archiver.kernel.org>; Mon, 14 Oct 2024 21:09:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3184210E4D4;
	Mon, 14 Oct 2024 21:09:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cfKx87qV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3570810E4D4
 for <intel-xe@lists.freedesktop.org>; Mon, 14 Oct 2024 21:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728940182; x=1760476182;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=QhiVmuXy5LniQOnpn3lisEY4FeIBpErIUeoSaNPY/1w=;
 b=cfKx87qVr1+Iy8f/7+eMKhXpXhPJlW2WqfHEAzmBMYa6WdUakmtOEMCB
 QqCD8NUOcyOEbncyl71ScA/B8oM0lyF+JDt0tSbD3pBSvODIR8/aAq41c
 6S5LlRK3OyZqXjpEUK0l/q9DDbrmGWB7ubD/9aaMoRluu3JLpSa+6OdvE
 z75UEbb2gV1agJVU4xa2WAA5unlzXCV7IwsUIvmjsfQeMd9tkZzota7li
 Ev0x5VTDz6hAcMC6LfRKSFNZtU4YY7w1mb/8I5hTqpbM/330UAaLVgXus
 m+9m8V52QJQaEV/fj/1Jfxf3y2nap8Xq7Rt3OjeAYWQkecEnf6CKTad0y g==;
X-CSE-ConnectionGUID: Z2LTcpjTSUSZDMiyjK+RoA==
X-CSE-MsgGUID: 2TYCPIMdTriEKN0RCLS+2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="28496160"
X-IronPort-AV: E=Sophos;i="6.11,203,1725346800"; d="scan'208";a="28496160"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2024 14:09:42 -0700
X-CSE-ConnectionGUID: ou2toK2dQz6glPcQsiw7AQ==
X-CSE-MsgGUID: SsM+KDazSym8Zqcol853pA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,203,1725346800"; d="scan'208";a="82454797"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Oct 2024 14:09:42 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 14 Oct 2024 14:09:41 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 14 Oct 2024 14:09:40 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 14 Oct 2024 14:09:40 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 14 Oct 2024 14:09:40 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.173)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 14 Oct 2024 14:09:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rOTshQFiYaiaKzVH9tndC0ZKIdN3r6gb0IsA0RJxyTKvEx4vffCDGxYIMu8rh0T9N/WjaKjhPobxcgoAJ1qIzwdewOpBYDC410Snenzam2VcyLB/hxzE+zJyR+d+uRu5ViZVLcF11THcBwuKRiqEKJRqLTp+RoO2msWlPtP22pGhSxJ9hCDpL7P33sEF1KU4CHcrpTHe3glyKwJx3xmFwtLE24pht9Fwt1I2ycDh/d/AWInhPfaXP+u/zgT+lI/6P1HN7TWdHD9+gDfA+AM9/K/JS0gu6KukDv74n8nCqb7XZV3DB0jETDjHpIjzx7ANOJZ1NtpckBAWbkTOhS+lGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QhiVmuXy5LniQOnpn3lisEY4FeIBpErIUeoSaNPY/1w=;
 b=Y7GZai36iGa7XdN0Xe4a8sFFgDwKO38SzKe3eM3WVRwfXQka4wTwOIPjLe4XEmh8SV9omIKVTZ5jEesh7A6Rc1Dto0EVUOB4puIR4lTJyKnCtwSvexrdiGqmYOhnaU+jq5fZNDF3V4NfiwF7bKO/cOVV4vr1h6hP4vrluCYLoVbqCMxKi2OmRpwoRbL2qO8EIeDF0V0W9JnaAB3BeaUTzEA7ByHGz7MER+QZ0pWsYiqyxC6ZYvrSFwkBz81gAFX+z+NSbIab95zKCQy6HMVvS3rmLW17d/Y/8fZ3GY2u1r6Vg2BOwIH6SAjmMfCX5fABxtTxU8PsKkH+lN1oSo3Y2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by CY8PR11MB7011.namprd11.prod.outlook.com (2603:10b6:930:55::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.27; Mon, 14 Oct
 2024 21:09:37 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad%5]) with mapi id 15.20.8048.020; Mon, 14 Oct 2024
 21:09:37 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Roper, 
 Matthew D" <matthew.d.roper@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "Zuo, Alex" <alex.zuo@intel.com>
Subject: RE: [PATCH] drm/xe: Log unreliable MMIO reads during forcewake
Thread-Topic: [PATCH] drm/xe: Log unreliable MMIO reads during forcewake
Thread-Index: AQHbHFyODx3U337AWEuEZNEdVk5Rz7KCkPqAgAISJ4CAAhQTYA==
Date: Mon, 14 Oct 2024 21:09:37 +0000
Message-ID: <DM4PR11MB5456E7B259D69FB91BC71572EA442@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20241012033445.1090373-1-shuicheng.lin@intel.com>
 <ZwoEbQAQolLNLbeq@DUT025-TGLU.fm.intel.com>
 <a4dd5112-1bbe-41e5-aee7-52addfc7d9c1@intel.com>
In-Reply-To: <a4dd5112-1bbe-41e5-aee7-52addfc7d9c1@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|CY8PR11MB7011:EE_
x-ms-office365-filtering-correlation-id: 2f5d77a7-086a-41e2-0086-08dcec9482de
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|10070799003|366016|376014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?U0NtNGt1cTJ0ejRkSnZITEtPWVhMYkczSk5BTWhteFFoOTh1bnlJUHpYTGdq?=
 =?utf-8?B?RnlzUjc0aTUvZjV4d1NnMkxHREVyK25ZTWRCVVFNMkdqb1FoUjMrdEJ1L2Ni?=
 =?utf-8?B?M1NIQW9SOUZ0YkNVQ2ZIWjhBMHNsR3A5bE1qNzVBNFVGSVZDdTAxaFJxSlcx?=
 =?utf-8?B?dTlTMkt2ZVZ2ZDIrNkNiL0wrc2hkUlYvNmErMW1tRTRORVA1RzA2Zzl4am9L?=
 =?utf-8?B?RFUzeDg3TWdZRisveFVXWWcxMFdYYUEwR3dGVWJvMFpLbnpJdjYrTXZVd21H?=
 =?utf-8?B?eVFHR2s4S1padG0vZ2lJdGVKVDZsOHE5U3plVzJsa0Z4YVZkUE5SaEhIMkdF?=
 =?utf-8?B?Z2tncGFMOGduZWlUazZjTnM3ZE5nbWZid09PclpleXYrSTMxc0tGK3h5azNU?=
 =?utf-8?B?V0FUL1Q5V2RQR2RWQzA4TGdnQzVHSDdkeTkwcFlqQWZhd21MS2Q0RU9za2Yw?=
 =?utf-8?B?VWc2bEs5QkF6K2NUbHVWdmJYdzZRdzJCaU5ydGhqK2doSENmUWRZNlhxa205?=
 =?utf-8?B?OUhJV2FWTlVJbFdvY0NDWTRBVWlnOGkrSTA1RVdROHIzRkNOaUFXYU96RGdH?=
 =?utf-8?B?VWI3SUNiaHhtZ2p1V3NqbmM2d2RUb0JRd0dsWXdRcXlUWk1tdmpSL01xbjRn?=
 =?utf-8?B?M2lhaWpqWi9UZVRGOG03UU5OUEd1RWdTRjUyU280eDV0ZW4zVGxkekFYL09W?=
 =?utf-8?B?RmFIR1J0ZHQxS0h4QTZ4cndZQ1B2SDhRYUpwTGFMWk9FazJCY0U3VUdSR0Vi?=
 =?utf-8?B?bVlFT09RZkkrc3JyVHo3aUZwMU12R3Z2dllGK1FMV0grSHVraWx6MHN2dDkz?=
 =?utf-8?B?NktRb1JsYVhUeVZQS2lEYnZQaEo2VkVyZ2pnTk5RK3c0OUd0L3dHa0dpVUph?=
 =?utf-8?B?UnV0YkVhOHhOSTBqbTNPcW9tT2l3YVBDMmdqdFlVb2xNNjNWTDVwRzUyUGhB?=
 =?utf-8?B?MzNlUTNnQ0Rkbmp0NWtEbk1WTnhQdkJMZ3hzZjZaLzF2RGo2Q1Jwc1Zsb3NZ?=
 =?utf-8?B?V2V2bnNnMWIyN0N6RTc4b1ZnNktqcUhQZlJ2R0dvSDkzUENHVmlkOGwrV1Bh?=
 =?utf-8?B?L0RZeC9rQmVuQWFVUEFORENmR0F0dEJuZ0NKOXpIOUhpa2NXcjg5SDYrNFlT?=
 =?utf-8?B?ZkVmVkt3RHUzYVZ6ZDRWaElucjJ6TW9Mb2FDcGgwR2xWekp1RG1xTXM5c1hv?=
 =?utf-8?B?c05ycWE1NGdjYThOa3ovZTZWQkRUc0YycjVtbnhDU0MxeFNma2Y3VnlLVk9N?=
 =?utf-8?B?NENJdXA2VHc4SGcwTVRNQlVNTkswd2twYkdCd0tocnd2RkpQc2lyTXpqTS9p?=
 =?utf-8?B?dEpNSEd5SUp1L0xvalBEdWdpTldwRUgvbThMOUxoTVVFMnZzNjNDa1NuWFhS?=
 =?utf-8?B?Umc1S04wK1JvSkV1RXZRTUJDNVcxQlB5U3VTTWJtZkxDanFvM1gzZWp0Z3Zp?=
 =?utf-8?B?V1NUaTkyWU9YMzNleTZRbXZnc1kwcEZBZDR3eHFQWXZxR3ZzT2MrTHVTTFpC?=
 =?utf-8?B?OWhXTkdJQk5WUFlySGlPcVBjSEVaU01vT21YL2JoRG94eFEyMEdkRE5KZE5k?=
 =?utf-8?B?Mi84MlR0UWpVYUtaOXU1Q1c1cWdzVkFOTkYyTzl2TnFaYlcwK0FzUTJxU0l5?=
 =?utf-8?B?ZUtBTFAwVWwwaXlucTI1VzRkYXYrdDE2STU0Q3Bhb1hyenlmR0VlREUycmlU?=
 =?utf-8?B?eDhlZHBNTFZtNlk5SVZ1WnJLTVFzOU5ZaFQyTFZvQnlsZ0ZOWXpLUUZBPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MVVpRlJTUlpUMnhPR2ZIbXRoNUJGRGM1RTZFSUpsNnFoR3NyS0VNOUVBcFV4?=
 =?utf-8?B?aU5TTzNXRmw1ci92VS9ROVV5YkQwckduRWVSaW9uRnRUSy9GV3pWTEtaZjJt?=
 =?utf-8?B?ZDBKZW1uU1ozT1pGZ1F5ZkJLZUpUazdlUENWZVE0VGpGRGhmcGJFZ2hmdFRU?=
 =?utf-8?B?M2RnSTc1YUdQcG9rZDI4bElOTnRuTXp1RkhqVFErL3RwQnhIdEdCbjE4U1hF?=
 =?utf-8?B?cWxJbytrOU5jSWUzdGR0VnZHalAybm55WmtZR2oyY3lMeDExSm9UQ3BBUkpP?=
 =?utf-8?B?SENJTUVBY0FRQ2dkT28rUUQyV3c2K2ZycFJub1lrenRTTFROWjFZMFVJY25U?=
 =?utf-8?B?b1JvbHpNVUxMRDZneE1xZ2lMZTN0dnJNd3RYNnVPWnV6Z1RVbk15dis0SFFS?=
 =?utf-8?B?bVlHbDBaWDl3aXRLZXdZWUNyMDg5eGtaV3ZKK0xkSnIrakVjOGRjeVdINlJY?=
 =?utf-8?B?R0VzdWgyVlFjMCttTWkveE14N2xZbGlhdkV4Z0Zpdmc4R2hEM2xnZ3l6Y3VJ?=
 =?utf-8?B?UStGSmlDQk02d3I3SFBYTnBuR0ZUM1BQVDJ2bWFzck8wamxudTNhTmFEbzNR?=
 =?utf-8?B?amZ3R29rR2w4Nm1SVDVQY0NLc05iWGpsaTdBUVBLdmFraWJ4enBGbEIwUmtv?=
 =?utf-8?B?TzYvOTFGaS9xVzdkN3RtcSs3L2drK2RLL2ozdmtvaFpKM2JES2p0dWtkeGZk?=
 =?utf-8?B?bzAwTWtSaXJTNlIwNzExL0s5TEFlamtVQ3J1NE1zMXZkZ1g4c0JhdVc5Umk1?=
 =?utf-8?B?UDlSZVk3YU00OGszbjJvR1lSUS9qaGtzWmJkT2FOTGVYRzNrSEVQS1gyY05C?=
 =?utf-8?B?ODJKY3pUTlROMTFXc2tEd0JLck9SMjZ4ak4zWlVtUkFQanprZnhlZ1VmKzVa?=
 =?utf-8?B?UU1PUEt1bGJvMk9IUjMzb1gwQ0tnMkQxS3RUZnpFMmtwRzJ1Q2piQUg4NE5o?=
 =?utf-8?B?WWFoWm5Mc2FRUis5T1cwWERPSHIybnVYK1JGQjJXQ2xjc2dkc2xPblNJTnEy?=
 =?utf-8?B?ZzFYU3JvcXZhZzJnaXphazVaRW1WUWFwczc2VGZJUGNVWDdQelFxTldUcGlx?=
 =?utf-8?B?aXZWWFVLTlJpRUt5SG44TEd1cG5NeS9YQzk2aDE2YVNUQWR2SWlNRnJsaUk4?=
 =?utf-8?B?eXBDSWMwRUxjY1dUSVcwOTlrZldxK3pkc3FsSmdkdkN4THRXQjh6MktwQmph?=
 =?utf-8?B?cG83L1VxdE5SM3dHR2s2QkUzUlJ1Zk0xc29zc0RmQzdna2xKUjdHa29KeEM4?=
 =?utf-8?B?UEpSZTR1TDV1NGtIN0lkK0hUM2JBV1pMS2FsQWtSS3JWbEhuNXZBU2hzQVdP?=
 =?utf-8?B?Sy9QblZQTjBaemN0SEhkMnl4c1RxS0R3SHNxaXRkblcvRy9leE9lNDNaZGJB?=
 =?utf-8?B?bmhOcTBuSFJ2enBGWlZsMlVESlNVV2FrMDVxN1RyazJnbzlKQzd6MzQ5Ykpp?=
 =?utf-8?B?cWh4UUtyeFlKZUd5eXM4cjRHbzdCQXlCaWh0RlBRQzRRc09QdlRKYlR4aWxt?=
 =?utf-8?B?MlVpa0VRQmNWZ1hpTmlyM3NTanZseXp5ZWVRb1d6VHhXc1ljMEZnTGFtck4y?=
 =?utf-8?B?cWdIQXladXM2NXloRTdCRDh6UFJPNmFXR1ZhTHNSWFJuNFZvaEUrS1NHaHk1?=
 =?utf-8?B?dUVMTG1JOUNGdE0zYVJ3QXpYcXJkc2pRcE8vVzVaSFJWOVoxaUJ5WS9OM01w?=
 =?utf-8?B?bUpmbzFuaWlFd201dzFabVMzNUlCRG92QndESjF5R08wa0c0NGI3VmV2RXRT?=
 =?utf-8?B?NFV5MXlQZXNDWnAzcHRFTHVNNFJjTGJ5amtyUVJjemV6dFZvNmMyRGdweDJR?=
 =?utf-8?B?YUJKL2tqMTJLNWtucEJuSzRxemRWTkdlNmlHbEd2TEluTEViZTcycnFpeTZ0?=
 =?utf-8?B?WkxNZC9vbHk0ZEYvRUp0UTI2ai9EVzNJdmVlY05PdHhrNHpRdFJTbkNWZ3ph?=
 =?utf-8?B?bktFanBSd0tTQllCdXoxaGxaVnhEclJOSGtldHJYMWtFbVVhcld0Qm56TURh?=
 =?utf-8?B?aGRMRmFUa0JRYTFoSEpGTkdTcmZINkYydmQ2N09yajFTSGliMG1iQUZ5akRy?=
 =?utf-8?B?RXhJYUZWVlNxUEZuTSt3dk5oVXhQUnA3SWUrRHVzRXBRdVcvZThkMHhtUWFC?=
 =?utf-8?B?QitQK3FwV3FvKzgzVk9LQkNRV2U4Vjh3Q29KdmozWkdvNWZxc3FXU0pRUFMz?=
 =?utf-8?Q?KqmFjRQveIMed0mO7HdDhK9PqgpYB7/bb3EV9Qnod3D6?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f5d77a7-086a-41e2-0086-08dcec9482de
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2024 21:09:37.4577 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eNIKwxxtoPL+Oh3nEudn5ztOUQcmINPRDQDH6RIc1ovv1SZNYQkAteOyncFDUNmbW2Znu/GaWOVZFzven6iNuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7011
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBXYWpkZWN6a28sIE1pY2hhbCA8
TWljaGFsLldhamRlY3prb0BpbnRlbC5jb20+DQo+IFNlbnQ6IFN1bmRheSwgT2N0b2JlciAxMywg
MjAyNCA1OjQ3IEFNDQo+IFRvOiBCcm9zdCwgTWF0dGhldyA8bWF0dGhldy5icm9zdEBpbnRlbC5j
b20+OyBMaW4sIFNodWljaGVuZw0KPiA8c2h1aWNoZW5nLmxpbkBpbnRlbC5jb20+DQo+IENjOiBp
bnRlbC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IFJvcGVyLCBNYXR0aGV3IEQNCj4gPG1hdHRo
ZXcuZC5yb3BlckBpbnRlbC5jb20+OyBWaXZpLCBSb2RyaWdvIDxyb2RyaWdvLnZpdmlAaW50ZWwu
Y29tPjsgWnVvLA0KPiBBbGV4IDxhbGV4Lnp1b0BpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0hdIGRybS94ZTogTG9nIHVucmVsaWFibGUgTU1JTyByZWFkcyBkdXJpbmcgZm9yY2V3YWtl
DQo+IA0KPiANCj4gDQo+IE9uIDEyLjEwLjIwMjQgMDc6MDksIE1hdHRoZXcgQnJvc3Qgd3JvdGU6
DQo+ID4gT24gU2F0LCBPY3QgMTIsIDIwMjQgYXQgMDM6MzQ6NDVBTSArMDAwMCwgU2h1aWNoZW5n
IExpbiB3cm90ZToNCj4gPj4gSW4gc29tZSBjYXNlcywgd2hlbiB0aGUgZHJpdmVyIGF0dGVtcHRz
IHRvIHJlYWQgYW4gTU1JTyByZWdpc3RlciwgdGhlDQo+ID4+IGhhcmR3YXJlIG1heSByZXR1cm4g
MHhGRkZGRkZGRi4gVGhlIGN1cnJlbnQgZm9yY2Ugd2FrZSBwYXRoIGNvZGUNCj4gPj4gdHJlYXRz
IHRoaXMgYXMgYSB2YWxpZCByZXNwb25zZSwgYXMgaXQgb25seSBjaGVja3MgdGhlIEJJVC4NCj4g
Pj4gSG93ZXZlciwgMHhGRkZGRkZGRiBzaG91bGQgYmUgY29uc2lkZXJlZCBhbiBpbnZhbGlkIHZh
bHVlLCBpbmRpY2F0aW5nDQo+ID4+IGEgcG90ZW50aWFsIGlzc3VlLiBUbyBhZGRyZXNzIHRoaXMs
IHdlIHNob3VsZCBhZGQgYSBsb2cgZW50cnkgdG8NCj4gPj4gaGlnaGxpZ2h0IHRoaXMgY29uZGl0
aW9uLg0KPiA+Pg0KPiA+PiBTdWdnZXN0ZWQtYnk6IEFsZXggWnVvIDxhbGV4Lnp1b0BpbnRlbC5j
b20+DQo+ID4+IFNpZ25lZC1vZmYtYnk6IFNodWljaGVuZyBMaW4gPHNodWljaGVuZy5saW5AaW50
ZWwuY29tPg0KPiA+PiAtLS0NCj4gPj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9mb3JjZV93YWtl
LmMgfCA0ICsrKysNCj4gPj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykNCj4gPj4N
Cj4gPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9mb3JjZV93YWtlLmMNCj4g
Pj4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZm9yY2Vfd2FrZS5jDQo+ID4+IGluZGV4IGE2NGMx
NDc1N2M4NC4uNDZmMzZkMDUyOTNhIDEwMDY0NA0KPiA+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
eGUveGVfZm9yY2Vfd2FrZS5jDQo+ID4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9mb3Jj
ZV93YWtlLmMNCj4gPj4gQEAgLTExNCw2ICsxMTQsMTAgQEAgc3RhdGljIGludCBfX2RvbWFpbl93
YWl0KHN0cnVjdCB4ZV9ndCAqZ3QsIHN0cnVjdA0KPiB4ZV9mb3JjZV93YWtlX2RvbWFpbiAqZG9t
YWluLA0KPiA+PiAgCXJldCA9IHhlX21taW9fd2FpdDMyKCZndC0+bW1pbywgZG9tYWluLT5yZWdf
YWNrLCBkb21haW4tPnZhbCwNCj4gd2FrZSA/IGRvbWFpbi0+dmFsIDogMCwNCj4gPj4gIAkJCSAg
ICAgWEVfRk9SQ0VfV0FLRV9BQ0tfVElNRU9VVF9NUyAqDQo+IFVTRUNfUEVSX01TRUMsDQo+ID4+
ICAJCQkgICAgICZ2YWx1ZSwgdHJ1ZSk7DQo+ID4+ICsJaWYgKHZhbHVlID09IH4wKQ0KPiA+PiAr
CQl4ZV9ndF9ub3RpY2UoZ3QsDQo+ID4+ICsJCQkgICAgICJGb3JjZSB3YWtlIGRvbWFpbiAlZDog
JXMuIE1NSU8gdW5yZWxpYWJsZQ0KPiAoZm9yY2V3YWtlIHJlZ2lzdGVyIHJldHVybnMgMHhGRkZG
RkZGRikhXG4iLA0KPiA+PiArCQkJICAgICBkb21haW4tPmlkLCBzdHJfd2FrZV9zbGVlcCh3YWtl
KSk7DQo+ID4NCj4gPiBTZXQgdGhlIHJldCB2YWx1ZSAoLUVJTykgdG8ga2ljayB0aGUgZXJyb3Ig
dG8gdXBwZXIgbGF5ZXJzPw0KPiANCj4gbm90ZSB0aGF0IGluIHVwY29taW5nIHNlcmllcyBbMV0g
dGhlcmUgd2lsbCBiZSBubyBlcnJvciBjb2RlIHJldHVybmVkDQo+IA0KPiBbMV0gaHR0cHM6Ly9w
YXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy8xMzc5ODIvI3JldjkNCj4gDQpUaGFua3Mg
Zm9yIHRoZSBpbmZvLg0KSSBjaGVja2VkIHRoZSBwYXRjaGVzLiBUaGUgY2hhbmdlIGlzIHVwcGVy
IG9mIGZ1bmN0aW9uIGRvbWFpbl93YWtlX3dhaXQoKS9kb21haW5fc2xlZXBfd2FpdCgpLCB3aGls
ZSBteSBjaGFuZ2UgaXMgaW5zaWRlIG9mIHRoZW0uDQpUaGUgcmV0dXJuIHZhbHVlIGlzIGNoZWNr
ZWQgaW4geGVfZm9yY2Vfd2FrZV9nZXQoKS94ZV9mb3JjZV93YWtlX3B1dCgpLg0KVGhlcmUgaXMg
bm8gY29uZmxpY3Qgb2YgbXkgcGF0Y2ggd2l0aCB0aGlzIHNlcmllcy4NCg0KU2h1aWNoZW5nDQo+
ID4NCj4gPj4gIAlpZiAocmV0KQ0KPiA+DQo+ID4gVGhlbi4uLg0KPiA+DQo+ID4gaWYgKHJldCkN
Cj4gPiAJLi4uDQo+ID4gZWxzZSBpZiAodmFsdWUgPT0gfjApDQo+ID4gCS4uLg0KPiA+IAlyZXQg
PSAtRUlPOw0KPiA+DQo+ID4gTWF0dA0KPiA+DQo+ID4+ICAJCXhlX2d0X25vdGljZShndCwgIkZv
cmNlIHdha2UgZG9tYWluICVkIGZhaWxlZCB0byBhY2sgJXMNCj4gKCVwZSkgcmVnWyUjeF0gPSAl
I3hcbiIsDQo+ID4+ICAJCQkgICAgIGRvbWFpbi0+aWQsIHN0cl93YWtlX3NsZWVwKHdha2UpLCBF
UlJfUFRSKHJldCksDQo+ID4+IC0tDQo+ID4+IDIuMjUuMQ0KPiA+Pg0KDQo=
