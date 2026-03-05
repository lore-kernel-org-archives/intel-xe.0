Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31EB4F3094F
	for <intel-xe@archiver.kernel.org>; Thu,  5 Mar 2026 11:53:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E04DA10E002;
	Thu,  5 Mar 2026 11:53:29 +0000 (UTC)
Received: from mgamail.intel.com (unknown [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCDAA10E002
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Mar 2026 11:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772711604; x=1804247604;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vHBakU+T5Kywe7O7Y77tF5zGQ34L6D3D+y0FTT7JHjo=;
 b=gDtNgKZXv0muGGxOX108UOlzuAK8rp1A+b7atRGEXVeuwSzdw/Vmm51J
 O0WORAYaYxMunJqBbN1szGh2JWiVugDcYHPJSNHEyNBDXgHUnd9CTSjOZ
 pr/YANoKyeuYvKuhxoW2nxHXSRjZd8UfRcQfdYc+oZ+QXnxMkLKu4Nzps
 GwL/Lz6UKEfLqR2LNfORyBfRtI+Q1pIBoISWfdNqKx8iiDrGyncb7ThdV
 d/RkUjEMXFYUseOEC0RWNP94pJT75RX2pBI+AfFF8oCa3yFRWbpOLbWOB
 INMerMi8UixVqiC+i0ZyB8freSzSNYCxihvq3Pd0UIeemzI8RmXy2u9IN g==;
X-CSE-ConnectionGUID: Yfn6BfzVRo2ryhfiSuzoOQ==
X-CSE-MsgGUID: gNpYMdSJQ9ePt5JMyRyWLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="77667888"
X-IronPort-AV: E=Sophos;i="6.23,102,1770624000"; d="scan'208";a="77667888"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 03:53:13 -0800
X-CSE-ConnectionGUID: UgVHnz3gSGiqd1V9e6cabw==
X-CSE-MsgGUID: 721dbw8dS8CBOxbiqdhVhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,102,1770624000"; d="scan'208";a="223622381"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 03:53:13 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 5 Mar 2026 03:53:11 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 5 Mar 2026 03:53:11 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.65) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 5 Mar 2026 03:53:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e3H3Lt2E0/K7YitzVULJmxzcyCHYSqxQlvJk833JV9jpmdns82KxMY41OMy+DL2nbNcwMkCtdh9vFaTFhgwhobghQLU+FncoKckb6UFkePIEZDA1F4wpsQ+cyeB999uAuwNGm5ilhaVxaark64w48J0PwW0SLaAttdXv9nhdLahhGMoCWjM1ipMGIUlkOjBMtrvmG5LMMpsQVyYeQR1dbkXnR8PrS6DzVxfe9H2oIh3qmeDp/MBX7c4vZZbyMVnEoktk5z2csMCjmoprMWvb8fRmoiXLmdFYtjaRT36qvhWzEWkc9xdXvYDiSkAZI/t2UYgIJ43KBPJ/vrZYN3lDLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vHBakU+T5Kywe7O7Y77tF5zGQ34L6D3D+y0FTT7JHjo=;
 b=QK75ib+ZAuKcmU/JtfpTfuEv9x6yi9+fAYtHx+rw2c13Jh0WAEQCx7kUGGY6wfCbNrtyQMHsSndRhpBseHNRKu3VepYNE63vBdGknKnnVQaZ9jMpczhZwbb8zoheKDAmCourwz8CHuUEeWLT1vGRovVkeSIdLqabdalpAkmlDwteHp3X/G0Bw+pyyvAr3cwh+gdZK7nWzfoZTjfm5q/dg0I0HKzEgdzwMvkGI7aERhkYYAbO03+AcEO0dCsVFQucKnFw6TvOYZ6a1ORZPoSkBDI9JLManwb3tbKiy/AgiE1HS4aHKZM6DDx0DFY9SoxYp1MFmjUxsxtsGTLftfUeoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS7PR11MB6197.namprd11.prod.outlook.com (2603:10b6:8:9b::17) by
 IA4PR11MB8913.namprd11.prod.outlook.com (2603:10b6:208:565::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 11:53:04 +0000
Received: from DS7PR11MB6197.namprd11.prod.outlook.com
 ([fe80::94d6:d249:877b:756b]) by DS7PR11MB6197.namprd11.prod.outlook.com
 ([fe80::94d6:d249:877b:756b%4]) with mapi id 15.20.9678.017; Thu, 5 Mar 2026
 11:53:04 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Auld, Matthew" <matthew.auld@intel.com>, "Zhang, Carl"
 <carl.zhang@intel.com>, "Souza, Jose" <jose.souza@intel.com>, "Mrozek,
 Michal" <michal.mrozek@intel.com>
Subject: RE: [PATCH V5 3/4] drm/xe/xe3p_lpg: Restrict UAPI to enable L2 flush
 optimization
Thread-Topic: [PATCH V5 3/4] drm/xe/xe3p_lpg: Restrict UAPI to enable L2 flush
 optimization
Thread-Index: AQHcqtZ7y/5ycQmAKEikLgS6Gh7CSrWfyXWAgAALVhA=
Date: Thu, 5 Mar 2026 11:53:04 +0000
Message-ID: <DS7PR11MB61974A513C272F5856DAD008817DA@DS7PR11MB6197.namprd11.prod.outlook.com>
References: <20260303062441.1860959-6-tejas.upadhyay@intel.com>
 <20260303062441.1860959-9-tejas.upadhyay@intel.com>
 <2ecfbbf73b825da172c7176c7ae9c46096221bd4.camel@linux.intel.com>
In-Reply-To: <2ecfbbf73b825da172c7176c7ae9c46096221bd4.camel@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR11MB6197:EE_|IA4PR11MB8913:EE_
x-ms-office365-filtering-correlation-id: f8e0f373-8ce8-4efa-81ae-08de7aadc269
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: /7ekL8uF5BAbyH/EIWkHNwRg7a6Nvt1cu5H0hwN6NEbRRG5jlUzXxr7lV5PMH4Ri2O2j3/pVyfmOgKNe+fIYiUnK+okBllZEgSImVK6WZB710w1vM5gMUhbWsCgfpu38KhfMw9ReMOcI3jcORXmhgm6Osss6D4dMdEGvqwe/g9J+ZcqtiQwRoATp8wTzYjUUrj3DNGZK5dP7OuAATWfkps/msk4n1mvTCIOPPG21lx7gI4tyq9agH4vFVRwTcWstLyWt6ErNEZlOkadzlcHOhhSSXQa9JAHcIdlwOCdfYjHrM2vCXtuv1lqWwKizZRuXRZUVDatr6ZyxE7azbvT84/wBQ3/SZB3nKAyVs4TJUT6aMt26ot3qJ3UUkR/deDUtNgl7Loy7bG9WfOHc7vDoIOhZ8Vf57M5wyUJttGXqwnXVSZxU2yN0+L1t+D6xX/V9RgnnYAIXg4Mxaqj1iRiLiGLUWgZ3a9s98LkcwWJ3XqrkerhF+EDMz11EsvehtrP+WA7J+D/6RhzqfvERj5pta4Fmnlg/DIDnPfOy2pdkN//sJGzwnuRy/PzsN2we9Q63b193O97Pf1I3Py7S6s9evMOX2lt73QMw2q6f9Hj1DQM0IRfPEr17MDwSJl/I5wHDmmb/3qml21yZGuU94yQd1CqI9OTb46Y7MEmhQy4f3csO9Nja7QD+1BHusveAD2QxyTRsNxZ5veF5z+7i68oWUE/6/AB6AyggUO+Im9MVqOJMPgdRlu8vp2ImVqTYKGVzWLP65B++03UKiGijkP/nB22Is/X5LA6wvZUlu0Ey3Vs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB6197.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eXhTR3IwOTBZZUdDMXBlU25NN3ZpSHNYa2RMbXQ1ZVd1c1JCQUUxdStkaGFr?=
 =?utf-8?B?U3NIQ1NTSndtYmE0cVVvNlB6WXJyUHNFWVF1RENPc2hoUTI4ZmN1S050RWRV?=
 =?utf-8?B?OEtIZ2Y4YzE2QVZzejlVUklrMVRKRnZocGJTRFBGTzgzUVc0T3lxcGszT2ZD?=
 =?utf-8?B?VUpSL1BqQ1RmVHFwbnN1WjN4NVRPYS9KZU5iMWp5NkNhK3VzeUcwZVY1c3ZW?=
 =?utf-8?B?TnBldUFOL2VpQ015bVErRnFCbXVZTTNEdHJacE9KK29iTXJKWHV4U0FJOUxo?=
 =?utf-8?B?RW8vV3dtS0ZwVGU4czExTlErVDBLY1NIUjd1K2JMbGJ1OU5lczNzK2NYbXVY?=
 =?utf-8?B?TjZnUjB2aVBQdzdJRVNOQVp3TyszcGc1Nlk1aG1qdFRYNENlenpFcUk2WCto?=
 =?utf-8?B?d0txTGp0WmtkK2Z3Q1hNQmcxdzhSanNxbTdjUGd1bFZCQ3hLK2Vua2h0VFh5?=
 =?utf-8?B?OFBqNXZJZmdNU2xCeWRDNDJ2Nk0rbmJnbGNsdUd0WWlXRThUWmN5eXdyWERJ?=
 =?utf-8?B?WkFxYUs2U0Y5emlxVUJBSWg1d2x2SzhNR2ltQWdiOVB6Vm5xbHJ4TFJ0TG1w?=
 =?utf-8?B?bDhMeVhjbGFhN2xuV0NkREEyNW1xZjdnc29JUCtCTjB2c0ZmMDF2ellIN25l?=
 =?utf-8?B?OS9vNjJldVFOZ2pSL3RTS3MydmpQbnovZXI5VE1aZFk3M2JtT215SGpJZ3RP?=
 =?utf-8?B?bEJRTWlYMy9udWpRYVJPa3daQWs0NU90eG1KWFRtOVBadjV6UjJvNENLSUs5?=
 =?utf-8?B?STBFV3BqYUx6RmNXaEhVMytVM1huNWZBVVo0OFZvZTdhZWg0QWJMaEdMYkNM?=
 =?utf-8?B?bDJodlhTZjB0Y1ppNUhtSlRublk5OE1yMk5xb0xUYjV5cUtyVzZuOGpCeGpx?=
 =?utf-8?B?YzVsUzRNbFFhb0RMUlFVaXJhTW5ZU0Nodk5kS0xMbmt4aThBeXp3anVHZkpa?=
 =?utf-8?B?TDh5blBrN0pWaTRacGwvOGRxZ3E2My9aS3lYZlltdWZVUVN3RHFHN1RhMmVY?=
 =?utf-8?B?SlhtQ3lJMUVMWnh3cEU1R0FWMkVnVnluQ3ZmcTZocUZjOHRaTzMreHA2Zk8r?=
 =?utf-8?B?VUZaTmpacElkOWE1RmFjV21oQmZmaTcxSFBNTGhCYkhGcDRQS0RLczh1Nyt4?=
 =?utf-8?B?MTlOL1E3dTE5RTZiUmZaRjljZkJ6RldXM0grRjl6ZWVVVC96OHZEblVJQUJu?=
 =?utf-8?B?Qzg1cFJEbG1mL0FOOFh6ejVWdFFtSDFVVGtycThQVVQvOTI3a1V0SFByM2gr?=
 =?utf-8?B?K2FROTNFcFpKUnBNVWxlek9jbk5yT3ArQTE1N0owUUMvdXJydG9KZ0d6UldP?=
 =?utf-8?B?L0pkeEIrSU03MDFIZncwSUZHVUtORUh6b2NlUDBINkpjUVhpK1U4WE0xRXdl?=
 =?utf-8?B?UUdidkRsYXl2S0hSY2dZQXFrM0JLMDFoUUhUUHpQWGI4MlB3TitMeUE4TEVs?=
 =?utf-8?B?K2k3OUlkeHlVTndQN09KVEM3NWFtYWFzTmdENUpTVnZmRlBUeHBZQlpjelRq?=
 =?utf-8?B?dUNKc0UxNjJhdkcyU2VKbTFsM1hpZlVVQ2U2VnVNQXlhRkZIc0hHYXRZdkQ4?=
 =?utf-8?B?RzYzUitoSm9rSTM5WkdaN1VvdDhVWkZnQ0JiSlZKT2V2a2dWNWFDamQ1OHg4?=
 =?utf-8?B?MkZEUTZKQmtmUUJqTGdCN2tjUWRxRUlJR3QxWGtnVlZPQWpCY0RQbVkyR2NQ?=
 =?utf-8?B?NjJqWmVpT01jQWtkdVQxS1BMVWh4RkRIaWZmc2l0aEF5cEl6MHlhMDJMUDFZ?=
 =?utf-8?B?MHlXcG04ck1RRi83bmo0U053VzYvRllocnEyZ29vczFTOFU4bnZmd3k1TFhV?=
 =?utf-8?B?RGRWWjM1UWZobWJabkJrclhtRVN6YmN4YVZ0MUw1Ty9CaDdFVzU5bG1XTkQw?=
 =?utf-8?B?RU1wWnFjd29FQVFpSTEvZTd0aEZDc2t4S2F4VGFhTWtNT2NJSUZSYU1jbTNU?=
 =?utf-8?B?MVA3aGF4M2NiRkpYdVViV2FBanIvb3ZYUEY5L0VwM3lzVUFFa3Zta2tuRTZI?=
 =?utf-8?B?OHNnVlp4cEVqOHM5bDJra3ZsVlRXN0JJa3ZhM3QvYUJvYmpEVXpwOWJiZFpH?=
 =?utf-8?B?djd3R29kMzZvemNBMVR3UTJ2dHhvMjc2SGFxT2RndkdwRTF1VGY3YmVaRXAz?=
 =?utf-8?B?dUJzSWNZTXFiQURlYXNwUzgvMHYxdmoxQ1ZvZklUUythbHJ1VE9uSjZpblVz?=
 =?utf-8?B?MXMzV1ptay9NRlJKODR0VkhTSWxVUEZoV1k3c29vU1ZnL3pKRUVOcWJwOVRH?=
 =?utf-8?B?NXhhOWMwait5RkZvRlVic1pGUnU4TmJiS29tU1VvS2VQZVFhMEJCRGJmbkQ2?=
 =?utf-8?B?RmxLVmliUEVhR2M2dlVZODJiYjhWeHFxK2RHSm11cXRDYTR5d1V5Zz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: vxJ6uzxX3ThzqT72zIthPjzR1fX79kHoOkzfvinhWsiC3mfdfiSJpXlvqIS9VewjVWC7VJcYT3+QpaEEJdT/iWoBiMBKAlZqmsRJ0UyMj2numIUCN0mauW1V2GmRSLzlTs8JkyotLVfuxl84OY/obFb75U8w6kBVOkrt0k5wwQx3sgUrPwHEuGWSyQ72vHVzBRAR8H8U5ZiKmdefAwwA4eJ0umOkfpoNLgqgzrV5EWyTK/Dy0BQ4ZA6S8ud4ogWBuLpIq0sr1NJCkpnYjQqtCgqt6Pd9vGfuqrjOm74oT7QO9BCN69xpksjgF7MbPoZeefzCQjNJHDom38W9Wwee8Q==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6197.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8e0f373-8ce8-4efa-81ae-08de7aadc269
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2026 11:53:04.2181 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eYMSC+leIi23I5ShNegExEYPfGByMGGWbvu3Jb60yLt0Wg7mkjBWh5+i9fZELtmSjpvQDb7IbJsx4M0NENr7LH9VQ0n2fq4LwDBbE+Swi1M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB8913
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogVGhvbWFzIEhlbGxzdHLD
tm0gPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPg0KPiBTZW50OiAwNSBNYXJjaCAy
MDI2IDE2OjMzDQo+IFRvOiBVcGFkaHlheSwgVGVqYXMgPHRlamFzLnVwYWRoeWF5QGludGVsLmNv
bT47IGludGVsLQ0KPiB4ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IEF1bGQsIE1hdHRo
ZXcgPG1hdHRoZXcuYXVsZEBpbnRlbC5jb20+OyBaaGFuZywgQ2FybA0KPiA8Y2FybC56aGFuZ0Bp
bnRlbC5jb20+OyBTb3V6YSwgSm9zZSA8am9zZS5zb3V6YUBpbnRlbC5jb20+OyBNcm96ZWssIE1p
Y2hhbA0KPiA8bWljaGFsLm1yb3pla0BpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0gg
VjUgMy80XSBkcm0veGUveGUzcF9scGc6IFJlc3RyaWN0IFVBUEkgdG8gZW5hYmxlIEwyIGZsdXNo
DQo+IG9wdGltaXphdGlvbg0KPiANCj4gSGksIFRlamFzLA0KPiANCj4gT24gVHVlLCAyMDI2LTAz
LTAzIGF0IDExOjU0ICswNTMwLCBUZWphcyBVcGFkaHlheSB3cm90ZToNCj4gPiBXaGVuIHNldCwg
c3RhcnRpbmcgeGUzcF9scGcsIHRoZSBMMiBmbHVzaCBvcHRpbWl6YXRpb24gZmVhdHVyZSB3aWxs
DQo+ID4gY29udHJvbCB3aGV0aGVyIEwyIGlzIGluIFBlcnNpc3RlbnQgb3IgVHJhbnNpZW50IG1v
ZGUgdGhyb3VnaA0KPiA+IG1vbml0b3Jpbmcgb2YgbWVkaWEgYWN0aXZpdHkuDQo+ID4NCj4gPiBU
byBlbmFibGUgTDIgZmx1c2ggb3B0aW1pemF0aW9uIGluY2x1ZGUgbmV3IGZlYXR1cmUgZmxhZw0K
PiA+IEdVQ19DVExfRU5BQkxFX0wyRkxVU0hfT1BUIGZvciBOb3ZhbGFrZSBwbGF0Zm9ybXMgd2hl
biBtZWRpYSB0eXBlIGlzDQo+ID4gZGV0ZWN0ZWQuDQo+ID4NCj4gPiBUaWdodGVuIFVBUEkgdmFs
aWRhdGlvbiB0byByZXN0cmljdCB1c2VycHRyLCBzdm0gYW5kIGRtYWJ1ZiBtYXBwaW5ncw0KPiA+
IHRvIGJlIGVpdGhlciAyV0FZIG9yIFhBKzFXQVkNCj4gPg0KPiA+IFY0KE1hdHRBKTogTW9kaWZ5
IHVhcGkgZG9jIGFuZCBjb21taXQNCj4gPiBWMyhNYXR0QSk6IGNoZWNrIHZhbGlkIG9wIGFuZCBw
YXRfaW5kZXggdmFsdWUNCj4gPiBWMihNYXR0QSk6IHZhbGlkYXRlIGRtYS1idWYgYm9zIGFuZCBt
YWR2aXNlIHBhdC1pbmRleA0KPiA+DQo+ID4gQWNrZWQtYnk6IE1pY2hhbCBNcm96ZWsgPG1pY2hh
bC5tcm96ZWtAaW50ZWwuY29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFRlamFzIFVwYWRoeWF5IDx0
ZWphcy51cGFkaHlheUBpbnRlbC5jb20+DQo+ID4gLS0tDQo+ID4gwqBkcml2ZXJzL2dwdS9kcm0v
eGUveGVfZ3VjLmPCoMKgwqDCoMKgwqDCoCB8wqAgMyArKysNCj4gPiDCoGRyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9ndWNfZndpZi5owqDCoCB8wqAgMSArDQo+ID4gwqBkcml2ZXJzL2dwdS9kcm0veGUv
eGVfdm0uY8KgwqDCoMKgwqDCoMKgwqAgfMKgIDggKysrKysrKysNCj4gPiDCoGRyaXZlcnMvZ3B1
L2RybS94ZS94ZV92bV9tYWR2aXNlLmMgfCAyMyArKysrKysrKysrKysrKysrKysrKysrKw0KPiA+
IMKgaW5jbHVkZS91YXBpL2RybS94ZV9kcm0uaMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgNCArKyst
DQo+ID4gwqA1IGZpbGVzIGNoYW5nZWQsIDM4IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkN
Cj4gPg0KPiANCj4gQ2xhdWRlIGhhcyBzb21lIHN1Z2dlc3Rpb25zIG9uIHRoaXMgcGF0Y2g6DQo+
IA0KPiAiDQo+IGNvbW1pdCA3NzI3MWQ4YzMyMzQ4NmViZTVkYzZmMTI2NGZjMzE4YTQzYTI5MDg0
DQo+IEF1dGhvcjogVGVqYXMgVXBhZGh5YXkgPHRlamFzLnVwYWRoeWF5QGludGVsLmNvbT4NCj4g
DQo+IGRybS94ZS94ZTNwX2xwZzogUmVzdHJpY3QgVUFQSSB0byBlbmFibGUgTDIgZmx1c2ggb3B0
aW1pemF0aW9uDQo+IA0KPiBUaGlzIGNvbW1pdCBhZGRzIFVBUEkgdmFsaWRhdGlvbiB0byByZXN0
cmljdCB1c2VycHRyLCBzdm0sIGFuZCBkbWFidWYNCj4gbWFwcGluZ3Mgb24gTDIgZmx1c2ggb3B0
aW1pemVkIHBsYXRmb3JtcyAoWGUzcCsgbm9uLURHRlgpIHRvIHVzZSBlaXRoZXINCj4gMldBWSBj
b2hlcmVuY3kgb3IgWEEgd2l0aCAxV0FZIGNvaGVyZW5jeSAocGF0X2luZGV4IDE5KS4NCj4gDQo+
ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV92bS5jIGIvZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX3ZtLmMNCj4gPiBpbmRleCA5OWZhMzYxMjNmNTguLjQyMzU2ZDczY2E2NSAxMDA2
NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfdm0uYw0KPiA+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS94ZS94ZV92bS5jDQo+IA0KPiBbIC4uLiBdDQo+IA0KPiA+IEBAIC0zNDgwLDYg
KzM0ODAsMTAgQEAgc3RhdGljIGludCB2bV9iaW5kX2lvY3RsX2NoZWNrX2FyZ3Moc3RydWN0DQo+
IHhlX2RldmljZSAqeGUsIHN0cnVjdCB4ZV92bSAqdm0sDQo+ID4gIAkJCSBvcCA9PSBEUk1fWEVf
Vk1fQklORF9PUF9NQVBfVVNFUlBUUikgfHwNCj4gPiAgCSAgICBYRV9JT0NUTF9EQkcoeGUsIGNv
aF9tb2RlID09IFhFX0NPSF9OT05FICYmDQo+ID4gIAkJCSBvcCA9PSBEUk1fWEVfVk1fQklORF9P
UF9NQVBfVVNFUlBUUikgfHwNCj4gPiArCSAgICBYRV9JT0NUTF9EQkcoeGUsIHhlX2RldmljZV9p
c19sMl9mbHVzaF9vcHRpbWl6ZWQoeGUpICYmDQo+ID4gKwkJCSAob3AgPT0gRFJNX1hFX1ZNX0JJ
TkRfT1BfTUFQX1VTRVJQVFIgfHwNCj4gPiArCQkJICBpc19jcHVfYWRkcl9taXJyb3IpICYmDQo+
ID4gKwkJCSAocGF0X2luZGV4ICE9IDE5IHx8IGNvaF9tb2RlICE9IFhFX0NPSF8yV0FZKSkNCj4g
fHwNCj4gDQo+IFRoZSBjb25kaXRpb24gdXNlcyB8fCBidXQgc2hvdWxkIHRoaXMgdXNlICYmIGlu
c3RlYWQ/DQo+IA0KPiBUaGUgY29tbWl0IG1lc3NhZ2Ugc2F5cyBtYXBwaW5ncyBzaG91bGQgYmUg
YWxsb3dlZCBpZiB0aGV5IHVzZSAiZWl0aGVyDQo+IDJXQVkgb3IgWEErMVdBWSIuIFRoZSBVQVBJ
IGRvY3VtZW50YXRpb24gYWxzbyBzYXlzICJ0aGUga2VybmVsIGV4cGVjdHMNCj4gZWl0aGVyIDJX
QVkgb3IgMVdBWSBhbmQgWEEgQHBhdF9pbmRleCIuDQo+IA0KPiBMb29raW5nIGF0IHhlM3BfbHBn
X3BhdF90YWJsZSBpbiB4ZV9wYXQuYzoNCj4gDQo+ICAgICBbMTldID0gWEUyX1BBVCggMSwgMCwg
MCwgMiwgMywgMiApDQo+IA0KPiBUaGUgbGFzdCBwYXJhbWV0ZXIgaXMgY29oX21vZGU9Miwgd2hp
Y2ggbWFwcyB0byBYRV9DT0hfMVdBWSBiYXNlZCBvbg0KPiB0aGUgWEUyX1BBVCBtYWNybzoNCj4g
DQo+ICAgICAuY29oX21vZGUgPSBfX2NvaF9tb2RlID8gX19jb2hfbW9kZSA6IFhFX0NPSF9OT05F
DQo+IA0KPiBTbyBwYXRfaW5kZXggMTkgaGFzIGNvaF9tb2RlPVhFX0NPSF8xV0FZLCBub3QgWEVf
Q09IXzJXQVkuDQo+IA0KPiBXaXRoIHRoZSBjdXJyZW50IHx8IGNvbmRpdGlvbiwgZm9yIHBhdF9p
bmRleCAxOToNCj4gICAtIHBhdF9pbmRleCAhPSAxOSBpcyBmYWxzZQ0KPiAgIC0gY29oX21vZGUg
IT0gWEVfQ09IXzJXQVkgaXMgdHJ1ZSAoc2luY2UgY29oX21vZGUgaXMgWEVfQ09IXzFXQVkpDQo+
ICAgLSBmYWxzZSB8fCB0cnVlID0gdHJ1ZSwgdmFsaWRhdGlvbiBmYWlscw0KPiANCj4gVGhpcyBt
ZWFucyB1c2VycHRyL3N2bSBvcGVyYXRpb25zIHdpbGwgYWx3YXlzIGZhaWwgdmFsaWRhdGlvbiBv
biBMMiBmbHVzaA0KPiBvcHRpbWl6ZWQgcGxhdGZvcm1zLCBldmVuIHdoZW4gdXNpbmcgdGhlIGNv
cnJlY3QgcGF0X2luZGV4IDE5Lg0KPiANCj4gU2hvdWxkIHRoZSBjb25kaXRpb24gYmU6DQo+IA0K
PiAgICAgKHBhdF9pbmRleCAhPSAxOSAmJiBjb2hfbW9kZSAhPSBYRV9DT0hfMldBWSkNCg0KUmln
aHQuIEl0cyBtaXNzLg0KDQo+IA0KPiBUaGlzIHdvdWxkIGZhaWwgb25seSBpZiB0aGUgbWFwcGlu
ZyBpcyBuZWl0aGVyIHBhdF9pbmRleCAxOSAoWEErMVdBWSkgbm9yDQo+IHVzaW5nIDJXQVkgY29o
ZXJlbmN5LCBtYXRjaGluZyB0aGUgY29tbWl0IG1lc3NhZ2UgaW50ZW50Lg0KPiANCj4gVGhlIHNh
bWUgaXNzdWUgYXBwZWFycyBpbiB4ZV92bV9iaW5kX2lvY3RsX3ZhbGlkYXRlX2JvKCkgYW5kDQo+
IHhlX3ZtX21hZHZpc2VfaW9jdGwoKSBhdCB0aGUgc2ltaWxhciB2YWxpZGF0aW9uIHBvaW50cy4N
Cj4gDQo+ICINCj4gDQo+IFRoYW5rcywNCj4gVGhvbWFzDQoNCg==
