Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5C8CCCF9E0
	for <intel-xe@archiver.kernel.org>; Tue, 28 Oct 2025 14:37:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7477D10E105;
	Tue, 28 Oct 2025 14:37:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lm6eQ888";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1304310E105
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Oct 2025 14:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761662246; x=1793198246;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=baQEHp26esKsceIu3BApW3eBRHxEQN0DTrpH1wMS+PM=;
 b=Lm6eQ888KlbHV978K9xD2dvy1Yper3M92AejGv1sbf+ROwJ63//ITXpV
 DZ5d4kUd10R3yEOUohjEdZblnWZGX7PCyYabIEZaKRO3Wu/FcMUCwUTmE
 CLLbPbFn25xc9hHLKTRXxM9Lg5f/ETxlPy7zJSvncZy83+YMKes7ysz96
 g+Nz9WRn8Ni89a5sCoQN98uUoKdgQfw52Jubcu9kqbW5hjqJ/1yjsitoz
 HRF7tNOPRfbTRUb4Grke/BAmSbD/KUGQoFZl+FAo7U0hu5nHlQycTZDOi
 j4ICTKQEgMeQY2IbUkMEeY0n1YyOtGO6696l335AkolKa4N/jgpgIAqFW Q==;
X-CSE-ConnectionGUID: tQZuUMDORq2OmPtllzMJ4Q==
X-CSE-MsgGUID: RO3CFgPyQreO4vsJUV6Hvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63465515"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="63465515"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 07:37:26 -0700
X-CSE-ConnectionGUID: Mi82IPS7TTG+SkJ1JkoOKA==
X-CSE-MsgGUID: NiAV1AquTfeK9Nx/Bf8GjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="186110690"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 07:37:25 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 07:37:24 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 28 Oct 2025 07:37:24 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.30) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 07:37:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CTi7vbESardV+NZdyfUSY1tma446R1/tSDVJS8fdw2lztx1nnds65x39MzvEX+z/O/D3DP8L+UXAXaxeGiBgSn61rZ7/llW/ZDaZObFf5PSKUIEG8qQ56mmg1S7IKn+1sFQslv2MIJeSJLn5Q7M6NVtBbY3NacmD+WHB+qWedz8G5djBZOOz0Xc6G4NxehvGMvan1pnKUhtiYx56bjgSTaj/S5FqobkrIu1tlD28pJ91+qyOqbdf6oroqqtuAMgmL95WnW8L4eWjKF5zFa5QFONzRU3xA5MtV3QK0uhaN0pnc0xfD7nrd4e6ZrVkqDOXud1mtw6lkPWA+McyMAEhIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=baQEHp26esKsceIu3BApW3eBRHxEQN0DTrpH1wMS+PM=;
 b=qQC8DrZZa90eyCv79t1DgcL1pIFyc+nC5l4nbPrq3JAnr2gG5Zawv9snkkc9Iv9rLZu40l4nMlKqT9anSF4oFMzt9SyNQCvOvGSlZfWtrgexyS36+y1k2hkCbFdwySEC+wnIhAtI4T2826XyVkanIhLLN2FYpAtx/FhWk52Lr4wIEq+qQEF7QE0fFDWp2IexTVeIe4tMXVY9z/xuiti2t4PgIS+v43Km/WFJijzpO5gqPzxExAo9wvARYpWLBAOCLsuGgJ8oVQgZ02CCRU9ARj/NDq5XH5ohEvAsZNxPXHNAeA1Sknjr4b5HBbtMjKOTsj8+UuYaltkkm5PGF/cJuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by CYYPR11MB8307.namprd11.prod.outlook.com (2603:10b6:930:ba::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Tue, 28 Oct
 2025 14:37:21 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5081:cd4:1a4b:a73e]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5081:cd4:1a4b:a73e%5]) with mapi id 15.20.9275.011; Tue, 28 Oct 2025
 14:37:21 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Gupta, saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex"
 <alex.zuo@intel.com>, "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>,
 "Roper, Matthew D" <matthew.d.roper@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH] drm/xe/xe_guc: Dynamically decide g2g buffer owner
Thread-Topic: [PATCH] drm/xe/xe_guc: Dynamically decide g2g buffer owner
Thread-Index: AQHcPf86nvI6BO9nyUe7LB3mniY/O7TWmHUAgAEWyoA=
Date: Tue, 28 Oct 2025 14:37:21 +0000
Message-ID: <CH0PR11MB544495482BE4637C9A705605E5FDA@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20251015181159.92509-2-jonathan.cavitt@intel.com>
 <4c8b3cd7-13bc-4051-b58d-df5c68e45e2b@intel.com>
In-Reply-To: <4c8b3cd7-13bc-4051-b58d-df5c68e45e2b@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|CYYPR11MB8307:EE_
x-ms-office365-filtering-correlation-id: fdfab749-8619-4451-cd68-08de162f80ee
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|376014|366016|1800799024|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?allPODJXa0pWTTExUW54UXlscGdqMWZIT3dLWkdIdGtOZGI1Uy9jTTZNREw4?=
 =?utf-8?B?KzEwaTZpQVV6VzNrV3FNNXBwaEQ0dk5xaFVLQ2NBcHRlaG1oZ0wzbzFNQ3ky?=
 =?utf-8?B?Um53VlFvQXVvR0xMaW0xdjNMZ3NWUHhtbHhNTGYwTG5EcGYyQW1rMEJJZENu?=
 =?utf-8?B?TmpycStycHk3WVhBL0NjajFYamdrMkt2TFhUMmx5UUo4V3BnK3VsY21STHVM?=
 =?utf-8?B?TTNYMVNUcitFcjlmOE5qYnI2WnJaNGV0dWpac3lENXdBWUNoMFdNUkl3Z3Ez?=
 =?utf-8?B?ZGYxaGZGMFhoUmtQS1YvNnhXUUdsVGg3UXZma3l3cGRhK2JkY08rWjNpbUpQ?=
 =?utf-8?B?M0FoOWJKUkVyVXVyT2hNMGpQTWJHakFqaGVWbTVhRGl0bUFDaHRXUWIyZVJP?=
 =?utf-8?B?QXQxaWhjeVlhd0tDNklOaWdYR3FLY3crTDdGeWYxQTBGUjFEQVRnZ2UyeHZl?=
 =?utf-8?B?SXg1YXVuOHgzNGpEQnFGYXZHQTRsQm5KVGc5dmJQNEUvU2didFdmUEx3SlEz?=
 =?utf-8?B?Y1lNVnQyYU5XcUJvTlI5Lzg0a05NMFpQQXpBWFJYVVNiNGVZdllBVjh5Q0JS?=
 =?utf-8?B?ZlBUNDd2UUVBVGdMNkpKelpnZ0ZwQyt2SmVBTFdRS0NTbW5va3g3ZzE0NnhH?=
 =?utf-8?B?bTlHeTViaUdmWTg5TDdROVRlRE0vZmlmVDMreFpaV1BmWE1SRXVJZ0pINEVy?=
 =?utf-8?B?dmcvSGpTKzlZQ1BYU3Btcm5yZzdaVGlLYTNBREc3dmdzWFBNK3AxeWdoWW4z?=
 =?utf-8?B?VTlyQUdZUENVZzlJYUVDdVg0YWxkUkdoSm5Lb1FYZTd1M3VMRDZuMGVMWlFY?=
 =?utf-8?B?R1NqcUxiTndJT01BOHhuYzEyc3JjTlNGdGZITFB5aEZKSWk4NTRxbncrZ2JM?=
 =?utf-8?B?aTVqQWxTZmRLeWVadGt1Vmsxa3p2TmJCR0IvVU5IWjRpcmpSVVk3ZS9uYzYv?=
 =?utf-8?B?MUdsZUhad3A3ak5LWXdoR1U1eEZ6MXpDSlNGanVrUi94bVZRQkhVRE5nY1Bj?=
 =?utf-8?B?NTc2bk1jb0I4ODBSTVZLazd2V1BxUnJRanplZ3kwOWxXdEpRUVhWaUxPZEpE?=
 =?utf-8?B?ekQ0VHZ2QTBMSXJxYnRqRmd6cFBiS1ZrZUFUVVNyTXhiRi9icFplOXF2elJ4?=
 =?utf-8?B?YTAxWWx0aU9IYzZXQUE1Y3hlOHdDbjRRMjYyN1A2NmtnYmdCNkQwaklhQllh?=
 =?utf-8?B?QjczanNZRXE0TkRlNE8yc1dGZlNqVkJLdHAvbGpFeEtodVFlRXEwMkFtNFpw?=
 =?utf-8?B?YVFzK2UxdEpSV1VyYVlCdjhscWF5MUFISzVlVFBadWJ4Y1JUbUMza1puYVE5?=
 =?utf-8?B?M0E4NFVlV2taRzFtcWs3Ym13ckMvenN0MlBnS3lidFhUS1B2NWdZMEYzaDVC?=
 =?utf-8?B?bUExZUdaTjA3azVXbEpmNjAyM3J3cXVxK2tuYzNyVjZmU0pOWW9kS2ZNU2NP?=
 =?utf-8?B?aCtqL2V2cUJvMXVSejZNb1UyUGszbFRPUi9hNk95bU8xWFV4STZ6UnZ0d3VS?=
 =?utf-8?B?ZXRaUXVsN0dTY0IyWEVGY3NxWTh6SmxOc0VQS2ViazkvWW13ZjFMSHBUY3dq?=
 =?utf-8?B?ZHpOVEhab25ZZnJISk52T2tEV0hPS01OaGE1TkNoaFJyVGxGQWpBQjlvNEZC?=
 =?utf-8?B?dU1RMDZzMTl1K3llZWs3VHlxTHAwUCtuWHdyYkVqSk9jcGVPQlRPZVlXOWJ0?=
 =?utf-8?B?MURUclVoMFRuUUhjeFhDWGVNeWhvQ2NOMi9Mcmd2aUFtYXVZRTZvNTJwbEFN?=
 =?utf-8?B?NkVrVXM0eUNCU2w5dzFDNzVUVnQyZmsrZDJjYUJRQ09XWWluWlFXUXZIU09i?=
 =?utf-8?B?TGtTTjIxVVRCd0lXbzN4WEkxUTRCRFdiTFhkblRXZmcrL0pwT3M1S21TOVVs?=
 =?utf-8?B?S0d2bnNSRi9TMEMwUGp4MWwxMmRDR2FpbFhXengyZGpibkFPc01tMm5DeWV1?=
 =?utf-8?B?d2NiWTcyc1RLVmhHODFrQXNMVGZCOE9xVk8rcnFyc3RqTm1rd3hCUjRrR1ZE?=
 =?utf-8?B?dGZUaHNUZ2ovTUJvczBLcUp3aENTalZUOGowaFRsSHN0VmVWOVljeDNHUG1V?=
 =?utf-8?Q?r5sL64?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(376014)(366016)(1800799024)(7053199007)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RER2RDlmMSs4MU9oTTJMVi9Mck54OWFPSjFLN0FIaEs3Q1RQSmIzOG0rd3pG?=
 =?utf-8?B?YThFK2hHcFA4NHdvMXpOY29TcGtYOXMzbnFtZkphUzFxYlNoRVBEeXhNQmlD?=
 =?utf-8?B?OGVPcmtxUForTGs1VUd6Z3ZNVVVsZ3o4S25tRFZVYmkyL0tDWW1CQldVcURP?=
 =?utf-8?B?bS9uTlZ6WVBuUHBVYW9Kc00vQnIzN3p6K1BNUlJwYWVFcjVpMERzS0RBUUtO?=
 =?utf-8?B?emoyMWVRZk1FMFlIbjdxRk5KN1RJVk9FZHBkOTYzYVBDRno5M0VsOVliOFRS?=
 =?utf-8?B?SUlsOHZqeUM2NlhFdGxsVk5ZcW51TG13MDRvK1JJQVNEbjNjeFRaQlFXbThV?=
 =?utf-8?B?UUxiSnJ4RDZleHpjMGM1RVVFcFh2NVJzNURaR2NXN1hIL2g3eXAwakI4cEt2?=
 =?utf-8?B?RGhWaTVwaHY5K3MxWHpUNEFKbGJMc2F5eXhGUTJ0azcyTGtCZmRvSU9DMkdX?=
 =?utf-8?B?TUdVVnhFS1k3WVJGdm92cFgveXdkVXE4WVJVVXhUMlhKWTk5Q2JiYzA4aTNs?=
 =?utf-8?B?U1UrcTNIcDVWTExGSWxVVE9vMnR2Y0pCRjBOYXJtMWdFTlRrSVpjMUNkbnFk?=
 =?utf-8?B?K1dabFFjMXQraVlWRFhWVEhtNmFCTitqUll4ZUdETGVpck02S2R6WkVCZDFt?=
 =?utf-8?B?ai9LelU3NS9WVnh2ekFKSVlQNW5kTEw2OUtNcHh3NmIyLzdRUHRLMEZSL25X?=
 =?utf-8?B?ZTU4ZDYvM21RdXBXTFJsNW44cXRIVngvbFNoQXV6SVR5ZlREUHZkSG80T2RE?=
 =?utf-8?B?N3B6bVNTbERrWXFqb1p3NEN4c05pQTNJZXVZRzl2dlhQWFN3ZlRqVmlsQmRh?=
 =?utf-8?B?WUE5Nk15dXZWdkM4cVZTVmJteXZoTFM4R1NraVljaGJ4NkRZeEt5aXNGcjVk?=
 =?utf-8?B?bEc3UGV4MGp3N2VNRnZtVnQ4Y0JIOGs3VjVJT3RjM3E5R0ZGS0tOV0Vqc2Yr?=
 =?utf-8?B?N01wY1VvbmZNYm04bGMwTCtMeURmWFF4a2hIcVZJVGI1TFI5NzRXZU05MitD?=
 =?utf-8?B?ekJCbE9kTE1hdU5JQ1Z4ZzVCazdqY1J3ZVIyU0Jkdzd0TGZjRHprN0htV1p5?=
 =?utf-8?B?TVJOaFdkajNNQ0JWRDQybDd2Wm4zM2YwSHNCRU1zUmozUUc2SXBsQU5tR3VD?=
 =?utf-8?B?SW8yWTVHYkVaOTBOM1kydEdkeDZKTGR6eEY3dmc3dFhOMDlmdzlxTlNNS1dp?=
 =?utf-8?B?c3VoMUNrZTBKTnFPUlhtZmN5UjRNWGp4MmhCd0t1Vm1Ic3lNM0VMamFMOE1j?=
 =?utf-8?B?TWFQYVZ5Ym5yVVkxWU04RGx1Rm9pTDVpZnNtYmFua2QwdGhHeHBuL2VORzgw?=
 =?utf-8?B?MmhtVXlVWVBwaHhWUWJvN2Q2Nk8wQjFnQXpPeTRMT3E3UlU4TGhTSms3N1RI?=
 =?utf-8?B?Q0dMVkVIT3dNczN0VCtOVWo5TEdkWjNiTGpYL1RUakNpdnRvREZhVGpJQ3cx?=
 =?utf-8?B?WTVMVnp6RENXdWo1Y3FiVmJzZ0Nnd1BDV09YbXBteHBYL1d3dTJOM09hQ0o3?=
 =?utf-8?B?cEpJZFE2QWtjVFNFOEtwa0pXRU5uTGJhSUhveUhFYkNXM2dSczhINWI4Rnhu?=
 =?utf-8?B?ZFRweFMxd01EWWdaSzB0Zmkzd3o3SUlZZ1VtZWd6TVZRbWk4WEtZRExaWm40?=
 =?utf-8?B?Z3NmOHV5VVpRdDFUV25HNlZTUmFMa3huTjNJSnQxY0xwdERtaHNLaFlYTWxE?=
 =?utf-8?B?VDF1OFZSdjdVaHlhOTRNN09Rekt0MWs4eWJCTnY2MUpueWxxWjZGQmhIN0h0?=
 =?utf-8?B?UTNiNnhHRnRNYmJKVHJZYWtJVlZvaHYybHdzYm5RZzBNbnJuV3lRZHFsb29K?=
 =?utf-8?B?VjM1ZVcxMlFUMVVjK3I0ZFhTNU1LMzBnT2JBd1VUVVdtS3o4d1JLa2pjb3FX?=
 =?utf-8?B?ejVwQStSdlVseE1QZlJOK3YzaHBjSTZpZ252RVhsYnRpREJEWU0yenhnODNY?=
 =?utf-8?B?aGc1aUwzMGhaTWQ2bE5jMG1VcUZvWWxOWC9DQnpxTjhoS0xPY1lvVG5penhK?=
 =?utf-8?B?NGJMVzZoTEFVQ3B3WGxXa1loZjFaN2NBMmNDMk12MHNsQzlDSWd1SGdSSmNN?=
 =?utf-8?B?MjZ1QnBNWThCZzNsUTZGOFFoclB1Rk82WXFDdng0Y25YNjlhdWtyZTRSVUhy?=
 =?utf-8?B?RmhlbHFFUXlqOUpDcHdCRllETXFncW5SdC9zd2ZqcUg3R0w0YzBhMEhYTXNn?=
 =?utf-8?Q?3yIgfX1n+sxS4KKcm2Xyth+DjJLEGQDrDkKspV1QC3Rj?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fdfab749-8619-4451-cd68-08de162f80ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2025 14:37:21.4568 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pFx60qzQ7xU6w0VMv/jxrTk+/1U8Zz30Zdfkj+baqNYEzWt/y1Xru/shth4uWvZvGGjKLEONdauGmlG94+MBYYHRDDDqSZOlfvLqLqE+Mqw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8307
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

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IENlcmFvbG8gU3B1cmlvLCBEYW5pZWxl
IDxkYW5pZWxlLmNlcmFvbG9zcHVyaW9AaW50ZWwuY29tPiANClNlbnQ6IE1vbmRheSwgT2N0b2Jl
ciAyNywgMjAyNSAyOjQwIFBNDQpUbzogQ2F2aXR0LCBKb25hdGhhbiA8am9uYXRoYW4uY2F2aXR0
QGludGVsLmNvbT47IGludGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KQ2M6IEd1cHRhLCBz
YXVyYWJoZyA8c2F1cmFiaGcuZ3VwdGFAaW50ZWwuY29tPjsgWnVvLCBBbGV4IDxhbGV4Lnp1b0Bp
bnRlbC5jb20+OyBXYWpkZWN6a28sIE1pY2hhbCA8TWljaGFsLldhamRlY3prb0BpbnRlbC5jb20+
OyBSb3BlciwgTWF0dGhldyBEIDxtYXR0aGV3LmQucm9wZXJAaW50ZWwuY29tPg0KU3ViamVjdDog
UmU6IFtQQVRDSF0gZHJtL3hlL3hlX2d1YzogRHluYW1pY2FsbHkgZGVjaWRlIGcyZyBidWZmZXIg
b3duZXINCj4gDQo+IE9uIDEwLzE1LzIwMjUgMTE6MTIgQU0sIEpvbmF0aGFuIENhdml0dCB3cm90
ZToNCj4gPiBPbiB0b2RheSdzIGRyaXZlciwgeGVfZGV2aWNlX2dldF9ndCh4ZSwgMCk7IGNhbiBu
ZXZlciByZXR1cm4gTlVMTC4NCj4gPiBIYXJkd2FyZS13aXNlIHRoZXJlJ3MgYWx3YXlzIGF0IGxl
YXN0IG9uZSB0aWxlLCBhbmQgZXZlcnkgdGlsaWUgaGFzIGENCj4gPiBwcmltYXJ5IEdULiAgSWYg
c29tZXRoaW5nIHdlbnQgd3JvbmcgZHVyaW5nIGluaXQgb2YgdGlsZSBvciBHVCBhbmQgd2UNCj4g
PiBjb3VsZG4ndCBjcmVhdGUvaW5pdGlhbGl6ZSB0aGUgc3RydWN0dXJlcywgdGhlbiB3ZSBhbHJl
YWR5IGFib3J0ZWQgdGhlDQo+ID4gZGV2aWNlIHByb2JlIGltbWVkaWF0ZWx5IGFuZCB3ZSdsbCBu
ZXZlciBnZXQgZnVydGhlciBvbiB0byBwbGFjZXMgaW4gdGhlDQo+ID4gY29kZSB0aGF0IHdvdWxk
IGJlIGNoYXNpbmcgYSBOVUxMIHBvaW50ZXIuDQo+ID4NCj4gPiBIb3dldmVyLCB0aGVyZSdzIGN1
cnJlbnRseSBvbmdvaW5nIHdvcmsgdG8gYWxsb3cgdGhlIHByaW1hcnkgR1QgdG8gYmUNCj4gPiBk
aXNhYmxlZCB2aWEgY29uZmlnZnMgZm9yIGRlYnVnZ2luZyBwdXJwb3Nlcy4gIE9uY2UgdGhhdCBs
YW5kcywgaXQgd2lsbA0KPiA+IGJlIHBvc3NpYmxlIGZvciB0aGlzIHF1ZXJ5IHRvIHJldHVybiBh
IE5VTEwgcG9pbnRlci4gIFRoaXMgY2FuIGNhdXNlDQo+ID4gcHJvYmxlbXMgaW4gZ3VjX2cyZ19h
bGxvYywgYXMgdGhpcyBwcm9jZXNzIGN1cnJlbnRseSByZWxpZXMgb24gdGhlDQo+ID4gcHJpbWFy
eSBHVCBhbHdheXMgYmVpbmcgcHJlc2VudC4NCj4gPg0KPiA+IEluc3RlYWQgb2YgbWFraW5nIHRo
ZSBwcmltYXJ5IEdUIHRoZSBnMmcgYnVmZmVyIG93bmVyLCBtYWtlIHRoZSBmaXJzdA0KPiA+IEd1
QyBwYXNzZWQgdG8gZ3VjX2cyZ19hbGxvYyB0aGUgZzJnIGJ1ZmZlciBvd25lci4gIFRoaXMgcmVx
dWlyZXMga2VlcGluZw0KPiA+IHRyYWNrIG9mIHRoZSBnMmcgYnVmZmVyIG93bmVyIGluIHRoZSB4
ZSBkZXZpY2Ugc28gZWFjaCBHdUMgY2FuIGtub3cgaWYNCj4gPiBpdCdzIHRoZSBvd25lciBvciBu
b3QgZHVyaW5nIGluaXRpYWxpemF0aW9uLg0KPiA+DQo+ID4gTm90ZSB0aGF0IHRoZSBhc3NvY2lh
dGVkIGt1bml0IHRlc3RpbmcgY29kZSBkb2VzIG5vdCBuZWVkIHRvIGJlIHVwZGF0ZWQNCj4gPiB0
byByZWZsZWN0IHRoaXMgY2hhbmdlIGJlY2F1c2UNCj4gPiAxLiBUaGUga3VuaXQgdGVzdGluZyBj
b2RlIGFsd2F5cyBydW5zIHdpdGggdGhlIHByaW1hcnkgR1QgZW5hYmxlZCwgYW5kDQo+ID4gMi4g
VHJhY2tpbmcgdGhlIGcyZyBidWZmZXIgb3duZXIgaW4gdGhlIHhlIGRldmljZSBpcyB1bm5lY2Vz
c2FyeSB0bw0KPiA+ICAgICBwZXJmb3JtIHRoZSBmdW5jdGlvbnMgb2YgdGhlIHRlc3RzLg0KPiAN
Cj4gSSdtIG5vdCBjb252aW5jZWQgdGhpcyB3b3JrcyB3aXRob3V0IG1vZGlmaWNhdGlvbiB0byB0
aGUgc2VsZnRlc3QuIEluIA0KPiB0aGUgY2FzZSB3aGVyZSB0aGUgRzJHIGlzIGFscmVhZHkgZW5h
YmxlZCwgdGhlIHNlbGZ0ZXN0IHdpbGwgZGVzdHJveSB0aGUgDQo+IGJ1ZmZlciAoc2VlIGcyZ19m
cmVlKSB0byBjcmVhdGUgYSBuZXcgb25lIGZvciB0aGUgdGVzdGluZy4gQm90aCBmb3IgdGhlIA0K
PiBHMkdfQ1RCX1RZUEVfREVGQVVMVCBzdWJ0ZXN0IGFuZCBhcyBjbGVhbnVwIGF0IHRoZSBlbmQs
IHRoZSB0ZXN0IHdpbGwgDQo+IGNhbGwgZ3VjX2cyZ19hbGxvYygpIGFnYWluOyBpbiB0aGlzIHNj
ZW5hcmlvIHhlLT5nMmdfb3duZXIgaGFzIG5vdCBiZWVuIA0KPiBjbGVhcmVkIGJ1dCB0aGUgQk8g
aXMgbm90IGFsbG9jYXRlZCwgc28gdGhlIGNvZGUgaW4gZzJnX2FsbG9jIHdpbGwgdHJ5IA0KPiB0
byBkbyBhbiB4ZV9ib19nZXQgb24gYSBiYWQgcG9pbnRlci4gSSBjb3VsZG4ndCBmaW5kIHRoZSBn
MmcgdGVzdCBpbiB0aGUgDQo+IENJIHJlc3VsdHMgc28gY291bGRuJ3QgY29uZmlybSB0aGF0IHRo
aXMgaXMgaW5kZWVkIGhhcHBlbmluZyBhbmQgSSdtIG5vdCANCj4gbWlzc2luZyBzb21ldGhpbmcu
DQoNCk5vLCB0aGlzIGlzIGNvcnJlY3QuICBUaGUgc29sdXRpb24gaGVyZSBzaG91bGQgYmUgYXMg
ZWFzeSBhcw0KeGUtPmcyZ19vd25lciA9IE5VTEwgYXQgdGhlIGVuZCBvZiBnMmdfZnJlZSAoYW5k
IG1heWJlDQp4ZS0+ZzJnX293bmVyID0gJnJvb3RfZ3QtPnVjLmd1YyBpbiBnMmdfZGlzdHJpYnV0
ZSBmb3IgY29tcGxldGVuZXNzIHNha2UpLg0KDQpJIGhhdmUgdG8gd29uZGVyIHdoYXQgdGhlIHBv
aW50IG9mIGRpc2FibGluZyBhbmQgcmVlbmFibGluZyB0aGUgZzJnIGludGVyZmFjZQ0KaW4gdGhl
IGtlcm5lbCBkdXJpbmcgdGhlIGcyZyBzZWxmdGVzdHMgaXMgZ2l2ZW4gd2UgYXJlbid0IGV2ZW4g
dXNpbmcgdGhhdCBpbnRlcmZhY2UNCnRvIHBlcmZvcm0gdGhlc2Ugc2VsZnRlc3RzLCBidXQgd2hh
dGV2ZXIuDQotSm9uYXRoYW4gQ2F2aXQNCg0KPiANCj4gRGFuaWVsZQ0KPiANCj4gPiBTdWdnZXN0
ZWQtYnk6IE1hdHQgUm9wZXIgPG1hdHRoZXcuZC5yb3BlckBpbnRlbC5jb20+DQo+ID4gU3VnZ2Vz
dGVkLWJ5OiBEYW5pZWxlIENlcmFvbG8gU3B1cmlvIDxkYW5pZWxlLmNlcmFvbG9zcHVyaW9AaW50
ZWwuY29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEpvbmF0aGFuIENhdml0dCA8am9uYXRoYW4uY2F2
aXR0QGludGVsLmNvbT4NCj4gPiBDYzogTWljaGFsIFdhamRlY3prbyA8bWljaGFsLndhamRlY3pr
b0BpbnRlbC5jb20+DQo+ID4gLS0tDQo+ID4gICBkcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNl
X3R5cGVzLmggfCA0ICsrKysNCj4gPiAgIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWMuYyAgICAg
ICAgICB8IDkgKysrKysrLS0tDQo+ID4gICAyIGZpbGVzIGNoYW5nZWQsIDEwIGluc2VydGlvbnMo
KyksIDMgZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L3hlL3hlX2RldmljZV90eXBlcy5oIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZV90eXBl
cy5oDQo+ID4gaW5kZXggMDJjMDRhZDcyOTZlLi5lMTdmOGI4NGI4ZDQgMTAwNjQ0DQo+ID4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZV90eXBlcy5oDQo+ID4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX2RldmljZV90eXBlcy5oDQo+ID4gQEAgLTM4LDYgKzM4LDcgQEAgc3Ry
dWN0IGRyYW1faW5mbzsNCj4gPiAgIHN0cnVjdCBpbnRlbF9kaXNwbGF5Ow0KPiA+ICAgc3RydWN0
IGludGVsX2RnX252bV9kZXY7DQo+ID4gICBzdHJ1Y3QgeGVfZ2d0dDsNCj4gPiArc3RydWN0IHhl
X2d1YzsNCj4gPiAgIHN0cnVjdCB4ZV9pMmM7DQo+ID4gICBzdHJ1Y3QgeGVfcGF0X29wczsNCj4g
PiAgIHN0cnVjdCB4ZV9weHA7DQo+ID4gQEAgLTYyNiw2ICs2MjcsOSBAQCBzdHJ1Y3QgeGVfZGV2
aWNlIHsNCj4gPiAgIAlhdG9taWNfdCBnMmdfdGVzdF9jb3VudDsNCj4gPiAgICNlbmRpZg0KPiA+
ICAgDQo+ID4gKwkvKiogQGcyZ19vd25lcjogUG9pbnRlciB0byB0aGUgR3VDIHRoYXQgaXMgdGhl
IG93bmVyIG9mIHRoZSBnMmcgYnVmZmVyICovDQo+ID4gKwlzdHJ1Y3QgeGVfZ3VjICpnMmdfb3du
ZXI7DQo+ID4gKw0KPiA+ICAgCS8qIHByaXZhdGU6ICovDQo+ID4gICANCj4gPiAgICNpZiBJU19F
TkFCTEVEKENPTkZJR19EUk1fWEVfRElTUExBWSkNCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL3hlL3hlX2d1Yy5jIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Yy5jDQo+ID4gaW5k
ZXggZDk0NDkwOTc5YWRjLi45NzkwZGRhZDYwNmEgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL3hlL3hlX2d1Yy5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Yy5j
DQo+ID4gQEAgLTQ2NSw5ICs0NjUsOCBAQCBzdGF0aWMgaW50IGd1Y19nMmdfYWxsb2Moc3RydWN0
IHhlX2d1YyAqZ3VjKQ0KPiA+ICAgCWlmIChndWMtPmcyZy5ibykNCj4gPiAgIAkJcmV0dXJuIDA7
DQo+ID4gICANCj4gPiAtCWlmIChndC0+aW5mby5pZCAhPSAwKSB7DQo+ID4gLQkJc3RydWN0IHhl
X2d0ICpyb290X2d0ID0geGVfZGV2aWNlX2dldF9ndCh4ZSwgMCk7DQo+ID4gLQkJc3RydWN0IHhl
X2d1YyAqcm9vdF9ndWMgPSAmcm9vdF9ndC0+dWMuZ3VjOw0KPiA+ICsJaWYgKHhlLT5nMmdfb3du
ZXIpIHsNCj4gPiArCQlzdHJ1Y3QgeGVfZ3VjICpyb290X2d1YyA9IHhlLT5nMmdfb3duZXI7DQo+
ID4gICAJCXN0cnVjdCB4ZV9ibyAqYm87DQo+ID4gICANCj4gPiAgIAkJYm8gPSB4ZV9ib19nZXQo
cm9vdF9ndWMtPmcyZy5ibyk7DQo+ID4gQEAgLTQ5Miw2ICs0OTEsNyBAQCBzdGF0aWMgaW50IGd1
Y19nMmdfYWxsb2Moc3RydWN0IHhlX2d1YyAqZ3VjKQ0KPiA+ICAgCXhlX21hcF9tZW1zZXQoeGUs
ICZiby0+dm1hcCwgMCwgMCwgZzJnX3NpemUpOw0KPiA+ICAgCWd1Yy0+ZzJnLmJvID0gYm87DQo+
ID4gICAJZ3VjLT5nMmcub3duZWQgPSB0cnVlOw0KPiA+ICsJeGUtPmcyZ19vd25lciA9IGd1YzsN
Cj4gPiAgIA0KPiA+ICAgCXJldHVybiAwOw0KPiA+ICAgfQ0KPiA+IEBAIC01MDQsNiArNTA0LDkg
QEAgc3RhdGljIHZvaWQgZ3VjX2cyZ19maW5pKHN0cnVjdCB4ZV9ndWMgKmd1YykNCj4gPiAgIAkv
KiBVbnBpbm5pbmcgdGhlIG93bmVkIG9iamVjdCBpcyBoYW5kbGVkIGJ5IGdlbmVyaWMgc2h1dGRv
d24gKi8NCj4gPiAgIAlpZiAoIWd1Yy0+ZzJnLm93bmVkKQ0KPiA+ICAgCQl4ZV9ib19wdXQoZ3Vj
LT5nMmcuYm8pOw0KPiA+ICsJLyogZzJnIG93bmVyIGlzIG5vIGxvbmdlciB2YWxpZC4gIE1hcmsg
YXMgTlVMTCBpbiB4ZSBkZXZpY2UgKi8NCj4gPiArCWVsc2UNCj4gPiArCQlndWNfdG9feGUoZ3Vj
KS0+ZzJnX293bmVyID0gTlVMTDsNCj4gPiAgIA0KPiA+ICAgCWd1Yy0+ZzJnLmJvID0gTlVMTDsN
Cj4gPiAgIH0NCj4gDQo+IA0K
