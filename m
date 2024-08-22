Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D6BEC3DA4A
	for <intel-xe@archiver.kernel.org>; Thu, 22 Aug 2024 16:16:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8C4310EB5B;
	Thu, 22 Aug 2024 16:16:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g/QCrk3L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AE4E10EB5B
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Aug 2024 16:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724343387; x=1755879387;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=maqgxWJWKQdgUhOHz4tRf84lJRc/tm05bCrfHGsxOIk=;
 b=g/QCrk3LZomUsRa0Op3wlqH0MgrbJ1wxJS1Sl+JAQW0hlA/7rPedgBY0
 72k6uggtof8nk8XPGPuYTd0x3D/6sZLrdfZlX2pkOtAd1wNWKgouOfXtP
 1uD1kFSqpz65TSxEXmm+lYEhtgYJcKei6/bDnjpMRl9Vox+u7LhPz0hxk
 BuCuIf+jumfE5rSU3RvOBmUdf6C0cKFtC4FH8B8hMHqDfR6dieRTFFnst
 H/xM574Yp8bOGxRNm9QNmpkqjnciO9nx582jCxJAgDb7zNPE8Y/LalK76
 jNSzialKZ5H2A+oy5jT9h3abfc1Pn4HFpZHpdipMRUl+R7FZGhIMXVTku w==;
X-CSE-ConnectionGUID: r+0VAP1qSdimUpXQooCCQg==
X-CSE-MsgGUID: vPZ9+7LAS72sC8zaJ9d8iw==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="33438487"
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; d="scan'208";a="33438487"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 09:16:23 -0700
X-CSE-ConnectionGUID: nxtJ+wwyQrCiKANMwDHX6g==
X-CSE-MsgGUID: CQxhFNiBSxWQWHEe01iSkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; d="scan'208";a="92242234"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Aug 2024 09:16:22 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 22 Aug 2024 09:16:22 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 22 Aug 2024 09:16:22 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 22 Aug 2024 09:16:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MuX5e3+nohgfDYx2fVf05wBY1vrI+vU53gfwvOWDeMEKGETxyYognqcGwZufRo+ortOdn3K8sLW21A8lxnLhqYaD61lZ7nyLSq/fuQ1Qz5gSaBxXDUbZUiIRpf+FPYkheQeHqV4nwBQpXOUa04GspH570uox8kPVnBjIR1rjwaQPkr6GBOv/RRsxCdLKjr0kf7QW39FkAr6MmM6AwFzX3Inol61yzdjb6eqZf++3wN12qEZxesXnD6IlKlW1grpxgoE0/VTLz324bGMwytTrzflklzCSqcR7Vp3dXdY1DXxRFe/wodOU4PU6omsPlhYNjcCjsFB/nTYYZADRMU9EWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=maqgxWJWKQdgUhOHz4tRf84lJRc/tm05bCrfHGsxOIk=;
 b=aYxyHRjeUoMWDYsjjv6QIJslepvnWPy9kAWomlC2pMufh6X9WP43yyizf5pPRO1xCD+zTEsSiE+NAYobZtR345cOtVF7wUJV3tyhUyTSoO4aGKGzFtiX4GP92eaVMMZRN9oP3DAHkFeG2xBsx1DKiwPp2mxXB4XRBCfvTx1ZfBURn8zQOlGc6nlfw5efWryQk/Tw76aDwJflXfRiAzlpjXD5Pe3yFPQYxetxWSSQ0c37yhHnClDaVqbn389hfXMY/NvczJZzPnuN89BBCT6tFNyRMA89sBd9Btesv9IHeS1uHpCS6e3TVJkaCk6AVW/BBKjVGRe5iZNixTuZmZUCxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by MN0PR11MB6111.namprd11.prod.outlook.com (2603:10b6:208:3cd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19; Thu, 22 Aug
 2024 16:16:19 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba%3]) with mapi id 15.20.7875.019; Thu, 22 Aug 2024
 16:16:19 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>, "Heikkila,
 Juha-pekka" <juha-pekka.heikkila@intel.com>, "Auld, Matthew"
 <matthew.auld@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v3] drm/xe: Align all 64k VRAM buffers physically when
 multiple of 64k.
Thread-Topic: [PATCH v3] drm/xe: Align all 64k VRAM buffers physically when
 multiple of 64k.
Thread-Index: AQHa9J8XEkdBLwlg6USde66XZWeBgbIzXXqAgAAWg4A=
Date: Thu, 22 Aug 2024 16:16:19 +0000
Message-ID: <5c1f268da2427ddcbc4b3d831a80d577320b3787.camel@intel.com>
References: <20240822142346.818434-1-maarten.lankhorst@linux.intel.com>
 <ZsdRbE3uuqFuo6y2@intel.com>
In-Reply-To: <ZsdRbE3uuqFuo6y2@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|MN0PR11MB6111:EE_
x-ms-office365-filtering-correlation-id: 3c469390-a1ae-4803-1cea-08dcc2c5c1e9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?czRXWnBHZkZnS3ZJVXRlSWd5cDd5WDJXS0V1RE1xWnJqZFU1U29TZzNpYm5k?=
 =?utf-8?B?bFZxUUdwZTBwLytJU3FuZ0JPTC9sWmNTbDJOdWtiVnRTanA4QThENDY4U3pG?=
 =?utf-8?B?R0J0VE9KWWovbWJnMmUwQVYrRXd1RFdMRDBGMDVISkNMOC83cExza2g0TFRu?=
 =?utf-8?B?VVpVdXFCaTZBbjYwMFVWK0djYWFpdzFyQ3lEMGNSNnQxYWFqOXVtSEVEYWdL?=
 =?utf-8?B?MXg1MndIdXBOVi9BWm1Ka2NEdi9IdXpZOE9VQlZGZmt4NExTd3dUdjhoSGxU?=
 =?utf-8?B?RTBxY1d5UFFWQ1dVRXpZSytXWnJPS1pPdzdwRWpIdzkvUzdQZDJTUEY4c3lG?=
 =?utf-8?B?UW9JY0RNYkp4NExqaFEvTHJWRWNMMXQwMXhaQnRYdFhLajBUQ3lGNCtEaGVz?=
 =?utf-8?B?MUI2TTI4aXVBamo1Q3FXQnduYWF6N29kcXphNTJTY0xtekZZd1daQ0w3VUFP?=
 =?utf-8?B?b0ZjTGsrWE1EQVkxbHhwN0IzMmdPMUlXdDU0UzlmWjcwTkhWVEhNZTlpc0h4?=
 =?utf-8?B?ZTJEOENBZlc3aldqSit0aG9BYlFSdUUrdXJDMXFpQWJBWk54MHgzckNRdUov?=
 =?utf-8?B?K2E1RXdtTGpERXN4YVFSaW9zWlJsMWpBdTB0SXNaaXliSmRkRmRaTmNac1Mx?=
 =?utf-8?B?ckwxMFNnWWFrZDZNZWZock9oRXIxOUN0cXJnTW1Pbk0zVDI1NXBDY1dKUDNU?=
 =?utf-8?B?STNYODV1ZVV5WjZOSlJZb016V1hPaythcjJNTm5ualUxZXlseGZDbVRJZnAv?=
 =?utf-8?B?bEpCSkNISWR0MXlSN2taM1NpcGlkWkNkSWE4MlBEbkpWdElFRnlNcjhHZmZh?=
 =?utf-8?B?QmJpWmkyTU5mNk1qWXhpaVBpemVSQ2pCNVlxM2dvS000TWNMUGpoZDIvRk1V?=
 =?utf-8?B?VTBYNkVCVCtBejFVR2RkeklMOHhZdm1OeUlrNC80bUdYbjMvWitTRUNTbFNW?=
 =?utf-8?B?ekpCTDR3OVBWL0xYWlYxZjRrT2JyRWhuNWFlN2xkamYxUzdzTGRnc09ITGFO?=
 =?utf-8?B?T25NbnR4eGNabHJjN2hURXQ2aElJQWFYbkJJZTUwbjBlNTQwTlp2NVVyenB1?=
 =?utf-8?B?Vk5xczFpQ1MvbjlFWVU0Q3M5YXltV0ZWUVhndUZSb05mMEZjazFGbnU3NFpJ?=
 =?utf-8?B?azl1THpseGh2Z2pWRkNXSGlkVkY2ejA5U0ZqdHkzKytWcCtjdXJrcmJtRzRr?=
 =?utf-8?B?Qm9CQjNrS0FSVHowbHdqQlZQYTZqZTNPaDR6ZzdieFZ3WE5nNWtranBQMnJZ?=
 =?utf-8?B?WkJaanVCOXdBa2ZIcEtqUkE0WE5pd2tBVjE4bHl4RWZsY3UxTFljYkVhdWEy?=
 =?utf-8?B?d3FmNFJCcWFmZUZpOG55YSt0aEhqeHMrdDB0YXdXL2xMNllVckw0bk9GRTF3?=
 =?utf-8?B?V0tBaG5nNWFHVVhXa0ZWYXIremxhTUcvTjYzenpKcHNIVFltbEJlZnhRWDRh?=
 =?utf-8?B?TFNGL2RRdlpHZ0F2aW9DS094aWkzd1Z1QzEyOWpnd2swRXJXampmemFCdHhk?=
 =?utf-8?B?K0FKSFBmZk5sNGFZQ0ZiL2hocStsbUVjMUNrdFJnRzJPRXRkN2hQbldRR2dy?=
 =?utf-8?B?M29mMmxuZFQ5cFJVR1FWVGwwTHFkeVhXVi9KM243MkdnbUpZN1RrYlZOdzVj?=
 =?utf-8?B?ZGQ3K1RXTU9WeE1nNWhpdFFmemtiZVBkSThNbUl2eTBqUWhHT213R3pMbTdQ?=
 =?utf-8?B?RU1uRmVTMHp2cEgyZktTcEdXRTQrWWZZMU5zY2FvSFpFR1VKandCVEs5eU1U?=
 =?utf-8?B?SytoeUhpc3FVWFZoTncvdFhydXV4ZSt3b1k0YXVlSCsyNzBTeVl1UWxTUmt3?=
 =?utf-8?B?NmlzTktnNGZCRFdsdHdTZklyVEVqejdBTkF3dUhRdW12eGw1R01ON3BVUmJm?=
 =?utf-8?B?V29NdnJ4WFZrL1NjVHVrNVFUU01nVkU4aUZqcHo5T3RRSmc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R2I0THRBVHREbUlUdTlacUdaWGVzT2dMMzF2cEMzUStmUm9jMmtMa1JsNTQy?=
 =?utf-8?B?WUdXM1QrV3dOa1NFdFNFYm9uL2o4TlVMcG0wOHVWWEM5QXdVVVVLRHlvT3oz?=
 =?utf-8?B?MldWVFV6NmYwbWZrQmtDaXBUNUZzY0RHaEF5bk1yWkYwaVA5R0FOdG1uZXJn?=
 =?utf-8?B?ZEhpUmxGNWV1bzNKdmUwTWZ1MmxKOUUvV1R6UlpoVndBN2NrdFUvUnBDQUZm?=
 =?utf-8?B?Z0NRTU1IVSs3bFI5anV2NzJKUDY1cDlYdlpkMFhNS0UrSlU5emlYdXgvYmZr?=
 =?utf-8?B?eWlYMnNDdDJ4M2dpaThQREk1TXFoK0hTZ3hrc0hVOVBzREZzMmJ1dWhBVVhw?=
 =?utf-8?B?NDNFbnVrVEV5a2VWR1YyaHNPV0VXNHV6RG1uM0MzV3BOS3FXRktISEdqazk1?=
 =?utf-8?B?SHF6WXNJMEI2STZ5UmE3TThXNjhCWW5sSjMzTW42dlRCMXN6eVVnS29yK1hR?=
 =?utf-8?B?VFdMdHlNLy9GWlhhZ1BXNTJHRUpsWGxqNVltTWZwYlM0blJyR2JhQnpYMGpK?=
 =?utf-8?B?SnNYL0VmdXJwUUNuZXhpclJEQWxYVEIyYTBoT01hZFYvN3U3UUFSMkZudDJV?=
 =?utf-8?B?VjlEaEdGcm1WV0RXVUQwYXNpUGxod3U5NGJpK20rbVpOenZPNFYxZmtwUmFt?=
 =?utf-8?B?OEdMSFZTM1N6TVVpaitXQVg2amN0SGl0TGwydWlQdUxjTEU0WmNaUzBFekZn?=
 =?utf-8?B?OGNWMkwvMFUzdWg1aG5rRzlleWRvd0s4M0hwUTR3WUFHUGltZkNJQTQ3QlMx?=
 =?utf-8?B?UjRvVHhlOEJJanArZnh3Z01EUG01ZVdjWE8wTmIrY2I5L253NHp5UkRyc3lJ?=
 =?utf-8?B?RUJNdHhsYXd2b1h5dWFFTDhCVUJ6Y0xiZUNFU1M3c1dQcW1uNUpkQ3dTYWlR?=
 =?utf-8?B?TmZGdTJ1TVM2cGpSSjNrSk1oRE9lVTlrUUlhRWJYR2pSeDc5UzI1ZVNjd3hQ?=
 =?utf-8?B?Zk13OVhYbS9hRW10OUQ3aUJDMDVsdGJuMFlkMlVwZHZtSDV0U3VKTGlrcUdl?=
 =?utf-8?B?bHRKS1dZaTdYVkg1UXJpakNGYnpMMmJPZ0g1cVNZaUdHSUVYL0pLUjF4MGh0?=
 =?utf-8?B?dEk0Y2J3QnI1NzJSZ1BJNlRSdm94SC8zK1hYUUExOVR1azMxUVljSU9XWFpp?=
 =?utf-8?B?RzQ4ZytKcEo5WWFUcXRaQ094TDQ5QnQ5QnZ3TEs4N0g3N1haWnh4d1BsV0ll?=
 =?utf-8?B?YVg2RFA1U1g0SHp5VFdHTU51dHhMeXBQM1FndkV6STIza20xQWVtSFdrZGN2?=
 =?utf-8?B?c0xlQmdvSElGVldoOERzR1NsTTk1RWp4bkxGdjV3Zy9UaE4yM09EanFJYmZi?=
 =?utf-8?B?T0VlYVl5cjBIWUtXTUxYODhnckdwWEs5ckxYcnRaRUs5dUxLc1U1VEhvTWVm?=
 =?utf-8?B?MVlkS1VJR3lUVEtuTWRvNWlObFVZd0plUkV5OU14ejNsSWZlOFpZQ2hsRTNx?=
 =?utf-8?B?U0E4c2RleTVGYVVOVGxVd3BlT0t3Nk1BeVZLWUxMQ2pHeEVncWJ5MXo2U0d1?=
 =?utf-8?B?eFg1YVNuZmRtNXUvZjhGMVVSZzE2R0xYMmpHWE53V1BFTXB5TjdQTHkzelU1?=
 =?utf-8?B?bzVQcTZhQ3ArKzFmZWlPUElWaEdqRC9LbXNtbHA3TzVSUlk1Tm0yMU0yVVhI?=
 =?utf-8?B?dUs1VE4zWjFoYzVGS0thS05CY3NKdjB5bmVsZ3BDNDVuQ0dnWnA5d0hqL2ln?=
 =?utf-8?B?b3Z5T1orazdkY3hWaDhzL2lPZWo2clBPeThuMmpVV2JXTlVNZkJsUTNTdXpT?=
 =?utf-8?B?TmNRUlowcC9SUGNXNTFtV0hoYVhkTC8vOHFzTmpuS21XQ0swc0d2Z1BobGJ6?=
 =?utf-8?B?S2lOUVd1UWUyQkNUcGZIWkFqQWRzdUdaTWpuRktxYlNzRitYZndJYi93QjU2?=
 =?utf-8?B?dy9VemJjampBSWZvaEduK3NUbkFDNmJxclNoZmcxZkxkV3d4NzN5di85aGRi?=
 =?utf-8?B?U1ZBMzhKcFQzSnVXdSs3YzkvbXRiN25mQUdURG9vT3MzTU1PcnhhRHU2S2tp?=
 =?utf-8?B?aUttYXNid0tndUhtTkdNbGF5a3ZZTm9rMm1jVWJwb21VV0JKRUN2M3ZrNGVx?=
 =?utf-8?B?YkhvMWZLRmNjdHpwZzJ1RWtWQTBmUzNUazZJOVBaeTBJSDNtRE1YWVQxUmpz?=
 =?utf-8?B?T3UwaGxJejJ5NzErYVl2bjRoKy8zS1lxODFLUi9IR0pNdHQvdFg3MnZYdUdN?=
 =?utf-8?B?QUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <ABC5054C7BDE6C478297884E235B3DFA@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c469390-a1ae-4803-1cea-08dcc2c5c1e9
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2024 16:16:19.6886 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HVWWnPlH06qLVqgysxQwayrSDg6yZx8i6KOcSy4Cv2C2tomt1ifYu5jG3Jm+FpltE9MvECT47/HvKfUiND537A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6111
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

T24gVGh1LCAyMDI0LTA4LTIyIGF0IDEwOjU1IC0wNDAwLCBSb2RyaWdvIFZpdmkgd3JvdGU6DQo+
IE9uIFRodSwgQXVnIDIyLCAyMDI0IGF0IDA0OjIzOjQ2UE0gKzAyMDAsIE1hYXJ0ZW4gTGFua2hv
cnN0IHdyb3RlOg0KPiA+IEZvciBDQ1MgZm9ybWF0cyBvbiBhZmZlY3RlZCBwbGF0Zm9ybXMsIEND
UyBjYW4gYmUgdXNlZCBmcmVlbHksIGJ1dA0KPiA+IGRpc3BsYXkgZW5naW5lIHJlcXVpcmVzIGEg
bXVsdGlwbGUgb2YgNjRrIHBoeXNpY2FsIHBhZ2VzLiBObyBvdGhlcg0KPiA+IGNoYW5nZXMgYXJl
IG5lZWRlZC4NCj4gPiANCj4gPiBBdCB0aGUgQk8gY3JlYXRpb24gdGltZSB3ZSBkb24ndCBrbm93
IGlmIHRoZSBCTyB3aWxsIGJlIHVzZWQgZm9yIENDUw0KPiA+IG9yIG5vdC4gSWYgdGhlIHNjYW5v
dXQgZmxhZyBpcyBzZXQsIGFuZCB0aGUgQk8gaXMgYSBtdWx0aXBsZSBvZiA2NGssDQo+IA0KPiBJ
IGRvbid0IHNlZSB0aGlzIGhhcHBlbmluZyBpbiB0aGUgY29kZSBhbnltb3JlLiBXaGVyZSdzIHRo
ZSBjaGVjayBmb3INCj4gdGhlIHNjYW5vdXQgZmxhZz8gV2hhdCBhbSBJIG1pc3Npbmc/DQo+IA0K
PiA+IHdlIHRha2UgdGhlIHNhZmUgcm91dGUgYW5kIGZvcmNlIHRoZSBwaHlzaWNhbCBhbGlnbm1l
bnQgb2YgNjRrIHBhZ2VzLg0KPiANCj4gSWYgSSBoYWQgdW5kZXJzdG9vZCBpdCBjb3JyZWN0bHks
IHRoaXMgaXMgb25lIG9mIHRoZSB0aGluZ3MgdGhhdA0KPiBKb3NlIHdhcyBhc2tpbmcgdXMgdG8g
YXZvaWQgc2luY2UgdGhlIGFsaWdubWVudCBvbiB0aGUgYWRkcmVzcw0KPiB3YXMgbm90IGFjdHVh
bGx5IG5lZWRlZC4gQnV0IEkgbWlnaHQgaGF2ZSB1bmRlcnN0b29kIGhpbS4NCj4gDQo+IENjOiBK
b3PDqSBSb2JlcnRvIGRlIFNvdXphIDxqb3NlLnNvdXphQGludGVsLmNvbT4NCg0KUGh5c2ljYWwg
YWRkcmVzcyBhbGlnbm1lbnQgZG9uJ3QgYWZmZWN0IE1lc2EsIHdlbGwgaXQgY291bGQgYWZmZWN0
IHBlcmZvcm1hbmNlIGJ1dCBhc2tpbmcgYXJvdW5kIGl0IHdvdWxkIHByb2JhYmx5IGltcHJvdmUg
cGVyZm9ybWFuY2UgYnV0IGF0IHRoZSBjb3N0DQpvZiBmcmFnbWVudCBwaHlzaWNhbCBtZW1vcnkg
cGxhY2VtZW50Lg0KDQorCWlmICgoYm8tPmZsYWdzICYgWEVfQk9fRkxBR19JTlRFUk5BTF82NEsp
ICYmDQorCSAgICAoeGUtPmluZm8udnJhbV9mbGFncyAmIFhFX1ZSQU1fRkxBR1NfTkVFRDY0Sykp
IHsNCg0KVGhpcyBza2lwcyB0aGUgYmxvY2sgdGhhdCBjaGVja3MgaWYgVk1BIGFkZHJlc3MgaXMg
YWxpZ25lZCB0byA2NGsgYXMgYWdyZWVkIGJ1dCBJIHRoaW5rIGl0IGRlc2VydmUgc29tZSBjb21t
ZW50LCBpdCBpcyBub3Qgc2ltcGxlIHRvIHVuZGVyc3RhbmQgaXQgbm93DQphbmQgd2lsbCBvbmx5
IGdldCBtb3JlIGNvbXBsaWNhdGVkIHdpdGggdGltZS4NCg0KV2lsbCBhc2sgWmhhbmcgZnJvbSBN
ZXNhIHRlYW0gdG8gdHJ5IGl0IG91dC4NCg0KPiANCj4gPiANCj4gPiBJZiB0aGUgQk8gaXMgbm90
IGEgbXVsdGlwbGUgb2YgNjRrLCBvciB0aGUgc2Nhbm91dCBmbGFnIHdhcyBub3Qgc2V0DQo+ID4g
YXQgQk8gY3JlYXRpb24sIHdlIHJlamVjdCBpdCBmb3IgdXNhZ2UgYXMgQ0NTIGluIGRpc3BsYXku
IFRoZSBwaHlzaWNhbA0KPiA+IHBhZ2VzIGFyZSBsaWtlbHkgbm90IGFsaWduZWQgY29ycmVjdGx5
LCBhbmQgdGhpcyB3aWxsIGNhdXNlIGNvcnJ1cHRpb24NCj4gPiB3aGVuIHVzZWQgYXMgRkIuDQo+
ID4gDQo+ID4gVGhpcyBpcyBhIHNsaWdodGx5IGRpZmZlcmVudCBhcHByb2FjaCBmcm9tIG15IHBy
ZXZpb3VzIHBhdGNoLiBJbnN0ZWFkDQo+ID4gb2YgcmVxdWlyaW5nIGEgc2Nhbm91dCBmbGFnIGF0
IEZCIGNyZWF0aW9uLCB3ZSBub3cgbWFrZSBhbGwgYnVmZmVycyBvZg0KPiA+IHRoZSByaWdodCBz
aXplIHBoeXNpY2FsbHkgYWxpZ25lZCBjb3JyZWN0bHksIHNvIG5vIGNoYW5nZSBmcm9tIHVzZXJz
cGFjZQ0KPiA+IGlzIG5lZWRlZC4NCj4gDQo+IGNvdWxkIGJlIGEgdjM6IG1hcmsgYW5kIGEgbW9y
ZSBpbXBlcmF0aXZlIGxhbmd1YWdlLiBTb21ldGhpbmcgbGlrZToNCj4gDQo+IHYzOiBJbnN0ZWFk
IG9mIHJlcXVpcmluZyBzY2Fub3V0IGZsYWcgYXQgRkIgY3JlYXRpb24sIHdlIG5vdyBtYWtlLi4u
DQo+IA0KPiA+IA0KPiA+IEl0IHdpbGwgYmUgaW50ZXJlc3RpbmcgdG8gc2VlIGlmIGl0IGFmZmVj
dHMgcGVyZm9ybWFuY2UgaW4gYW55IHdheSwNCj4gPiBjb3VsZCBwb3RlbnRpYWxseSBldmVuIGlt
cHJvdmUgdGhpbmdzIHdpdGggNjRrIFBURSdzLg0KPiA+IA0KPiA+IEluc3BpcmVkIGJ5IFpiaWdu
aWV3cyBwYXRjaC4NCj4gDQo+IFRoaXMgMiBwaHJhc2VzIGFib3ZlIHNob3VsZCBwcm9iYWJseSBi
ZSBhZGRlZCBiZWxvdyB0aGUgJy0tLScgbWFyaywNCj4gYW5kIG5vdCBhcyBwYXJ0IG9mIHRoZSBj
b21taXQgbWVzc2FnZS4NCj4gDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogTWFhcnRlbiBMYW5r
aG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4NCj4gPiBDby1kZXZlbG9w
ZWQtYnk6IFpiaWduaWV3IEtlbXBjennFhHNraSA8emJpZ25pZXcua2VtcGN6eW5za2lAaW50ZWwu
Y29tPg0KPiANCj4gWmJpZ25pZXcsIHdlIG5lZWQgeW91ciBzaWdub2ZmLWJ5IGhlcmUgYXMgd2Vs
bCBpZiB0aGlzIGlzIHRoZSBjYXNlLg0KPiANCj4gPiBDYzogTWF0dGhldyBBdWxkIDxtYXR0aGV3
LmF1bGRAaW50ZWwuY29tPg0KPiA+IENjOiBSb2RyaWdvIFZpdmkgPHJvZHJpZ28udml2aUBpbnRl
bC5jb20+DQo+ID4gQ2M6IFRob21hcyBIZWxsc3Ryw7ZtIDx0aG9tYXMuaGVsbHN0cm9tQGxpbnV4
LmludGVsLmNvbT4NCj4gPiBDYzogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0
QGxpbnV4LmludGVsLmNvbT4NCj4gPiBDYzogSnVoYS1QZWtrYSBIZWlra2lsw6QgPGp1aGEtcGVr
a2EuaGVpa2tpbGFAaW50ZWwuY29tPg0KPiA+IC0tLQ0KPiA+IENoYW5nZXMgc2luY2UgcHJldmlv
dXMgdmVyc2lvbjoNCj4gPiAtIERyb3AgRElTUExBWV9ORUVENjRLLg0KPiA+IC0gSGFyZGNvZGUg
Y2hlY2sgZm9yIEk5MTVfRk9STUFUX01PRF80X1RJTEVEX0JNR19DQ1MsIG9ubHkgb25lIGFmZmVj
dGVkLg0KPiANCj4gSSBsaWtlIHRoZXNlIDIgY2hhbmdlcyBmb3IgYSBjbGVhbmVyIGNvZGUuDQo+
IA0KPiA+IA0KPiA+ICBkcml2ZXJzL2dwdS9kcm0veGUvZGlzcGxheS9pbnRlbF9mYl9iby5jIHwg
IDUgKysrKysNCj4gPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2JvLmMgICAgICAgICAgICAgICB8
IDEwICsrKysrKysrKysNCj4gPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZtLmMgICAgICAgICAg
ICAgICB8ICAzICsrLQ0KPiA+ICAzIGZpbGVzIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL2Rp
c3BsYXkvaW50ZWxfZmJfYm8uYyBiL2RyaXZlcnMvZ3B1L2RybS94ZS9kaXNwbGF5L2ludGVsX2Zi
X2JvLmMNCj4gPiBpbmRleCBmODM1NDkyZjczZmI0Li5kZTYxMzMyNWUwYmIwIDEwMDY0NA0KPiA+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS9kaXNwbGF5L2ludGVsX2ZiX2JvLmMNCj4gPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0veGUvZGlzcGxheS9pbnRlbF9mYl9iby5jDQo+ID4gQEAgLTI4LDYg
KzI5LDEwIEBAIGludCBpbnRlbF9mYl9ib19mcmFtZWJ1ZmZlcl9pbml0KHN0cnVjdCBpbnRlbF9m
cmFtZWJ1ZmZlciAqaW50ZWxfZmIsDQo+ID4gIAlzdHJ1Y3QgeGVfZGV2aWNlICp4ZSA9IHRvX3hl
X2RldmljZShiby0+dHRtLmJhc2UuZGV2KTsNCj4gPiAgCWludCByZXQ7DQo+ID4gIA0KPiA+ICsJ
aWYgKFhFX0lPQ1RMX0RCRyh4ZSwgbW9kZV9jbWQtPm1vZGlmaWVyWzBdID09IEk5MTVfRk9STUFU
X01PRF80X1RJTEVEX0JNR19DQ1MgJiYNCj4gPiArCQkJICAgICAhKGJvLT5mbGFncyAmIFhFX0JP
X0ZMQUdfTkVFRFNfNjRLKSkpDQo+IA0KPiBwYXJlbnRoZXNpcyBtaXNhbGxpZ25tZW50DQo+IA0K
PiA+ICsJCXJldHVybiAtRUlOVkFMOw0KPiA+ICsNCj4gPiAgCXhlX2JvX2dldChibyk7DQo+ID4g
IA0KPiA+ICAJcmV0ID0gdHRtX2JvX3Jlc2VydmUoJmJvLT50dG0sIHRydWUsIGZhbHNlLCBOVUxM
KTsNCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2JvLmMgYi9kcml2ZXJz
L2dwdS9kcm0veGUveGVfYm8uYw0KPiA+IGluZGV4IDZlZDBlMTk1NTIxNTkuLmRkNTRjYmMxNGU5
ZDggMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2JvLmMNCj4gPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0veGUveGVfYm8uYw0KPiA+IEBAIC0yMDE5LDYgKzIwMTksMTYgQEAg
aW50IHhlX2dlbV9jcmVhdGVfaW9jdGwoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdm9pZCAqZGF0
YSwNCj4gPiAgDQo+ID4gIAlib19mbGFncyB8PSBhcmdzLT5wbGFjZW1lbnQgPDwgKGZmcyhYRV9C
T19GTEFHX1NZU1RFTSkgLSAxKTsNCj4gPiAgDQo+ID4gKwkvKg0KPiA+ICsJICogTGV0cyBzZWUg
d2hhdCBoYXBwZW5zIGlmIHdlIHNpbXBseSBhbGlnbiBhbnkgYnVmZmVyIHRoYXQncw0KPiA+ICsJ
ICogYSBtdWx0aXBsZSBvZiA2NGsgdG8gNjRrIGluIHBsYWNlcyB3aGVyZSBpdCdzIG5vdCBvZmZp
Y2lhbGx5DQo+ID4gKwkgKiBuZWVkZWQuDQo+ID4gKwkgKi8NCj4gPiArCWlmICgoYm9fZmxhZ3Mg
JiBYRV9CT19GTEFHX1ZSQU1fTUFTSykgJiYNCj4gPiArCSAgICAhKHhlLT5pbmZvLnZyYW1fZmxh
Z3MgJiBYRV9WUkFNX0ZMQUdTX05FRUQ2NEspICYmDQo+ID4gKwkgICAgIShhcmdzLT5zaXplICUg
U1pfNjRLKSkNCj4gDQo+IHNob3VsZG4ndCB3ZSBiZSBjaGVja2luZyBmb3IgdGhlIHNjYW5vdXQg
aGVyZSBhcyB3ZWxsPw0KPiANCj4gPiArCQlib19mbGFncyB8PSBYRV9CT19GTEFHX05FRURTXzY0
SzsNCj4gPiArDQo+ID4gIAlpZiAoYXJncy0+ZmxhZ3MgJiBEUk1fWEVfR0VNX0NSRUFURV9GTEFH
X05FRURTX1ZJU0lCTEVfVlJBTSkgew0KPiA+ICAJCWlmIChYRV9JT0NUTF9EQkcoeGUsICEoYm9f
ZmxhZ3MgJiBYRV9CT19GTEFHX1ZSQU1fTUFTSykpKQ0KPiA+ICAJCQlyZXR1cm4gLUVJTlZBTDsN
Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZtLmMgYi9kcml2ZXJzL2dw
dS9kcm0veGUveGVfdm0uYw0KPiA+IGluZGV4IGQxYmZkMGI2ZTk1NTguLmFmMjE1ZjZkNjU4OGIg
MTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZtLmMNCj4gPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0veGUveGVfdm0uYw0KPiA+IEBAIC0yODc4LDcgKzI4NzgsOCBAQCBzdGF0
aWMgaW50IHhlX3ZtX2JpbmRfaW9jdGxfdmFsaWRhdGVfYm8oc3RydWN0IHhlX2RldmljZSAqeGUs
IHN0cnVjdCB4ZV9ibyAqYm8sDQo+ID4gIAkJcmV0dXJuIC1FSU5WQUw7DQo+ID4gIAl9DQo+ID4g
IA0KPiA+IC0JaWYgKGJvLT5mbGFncyAmIFhFX0JPX0ZMQUdfSU5URVJOQUxfNjRLKSB7DQo+ID4g
KwlpZiAoKGJvLT5mbGFncyAmIFhFX0JPX0ZMQUdfSU5URVJOQUxfNjRLKSAmJg0KPiA+ICsJICAg
ICh4ZS0+aW5mby52cmFtX2ZsYWdzICYgWEVfVlJBTV9GTEFHU19ORUVENjRLKSkgew0KPiA+ICAJ
CWlmIChYRV9JT0NUTF9EQkcoeGUsIG9ial9vZmZzZXQgJg0KPiA+ICAJCQkJIFhFXzY0S19QQUdF
X01BU0spIHx8DQo+ID4gIAkJICAgIFhFX0lPQ1RMX0RCRyh4ZSwgYWRkciAmIFhFXzY0S19QQUdF
X01BU0spIHx8DQo+ID4gLS0gDQo+ID4gMi40NS4yDQo+ID4gDQoNCg==
