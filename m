Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBC2ECD4F26
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jun 2026 17:47:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C95310E10C;
	Fri, 19 Jun 2026 17:47:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mLnmSR74";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 808C410E0E0
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Jun 2026 17:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781891237; x=1813427237;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+Oyo1JQdOgV3srIx33A/ORa6ONpHA/4ikLpllH8zeF4=;
 b=mLnmSR74+bf7PuG+HWfXbD8Ivafpo6I8c+bVygiypf4ZJGOfBAAEFFZk
 D+bLUrj7JsHsit7IB+D4L2ZshNlBxCZFds+nw1z6JatrjEwoMYbQ0ug9y
 To8QFQ7F13boPPh/Rw6DuIqhnpW1B26oKr4Cv+tkSrmKs9Nua6rWBKyMB
 r5u0YbfbrCR2DUO/ZdoTJKglfNAForlL+iP+VSVZUnuxiAeuwH7unn19n
 Idl4U4rU4Qu1COxxLHcNyi4EBQ7FNxDx8f2jXNW2fuSkp3+hn6GEtpK5d
 8JPWIq2vtkJl4IeJxsbXXqUHrFR38arnAWkboABB0ujrY9FC0ROEeAGvf g==;
X-CSE-ConnectionGUID: 8SNAZwctRr2DvwDh9TDhug==
X-CSE-MsgGUID: bm4rn1pMR9eu5RMJxQXTLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11822"; a="82830388"
X-IronPort-AV: E=Sophos;i="6.24,213,1774335600"; d="scan'208";a="82830388"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2026 10:47:16 -0700
X-CSE-ConnectionGUID: EjwjZschS+OSJu+IDqoJ7w==
X-CSE-MsgGUID: +9whqSiYRiqBaveBayyhBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,213,1774335600"; d="scan'208";a="244515083"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2026 10:47:16 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 19 Jun 2026 10:47:15 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 19 Jun 2026 10:47:15 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.17) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 19 Jun 2026 10:47:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PyT4sz+n7CHxqu4H5IrqCslEr2TKP4rgiwIOCg0MrjkwNMBf5c6wjN9cLvo2ps7P+qgwWmB4WjOJ7HF66t9sHZT9V21wacqFG/4/30u14ZiFafvrRNCpNUrMr6DTOliJIyN8Ycp7BZsBrcog2YA2bKHhzKS6XTi+IwPeypQ6yISfy4easVUj+ZFl2JUuZio6xjLFXXiWyWYJyNDlr6IblXuzbmWsZ6+3pe1v/GcdR2fGFrGuW+wuuT3alDG7+qNrtgwpiBnlJN1es4RVhiC8P5B50P69eiycvHSgWvKC1kdv0fgdxaI27WARcbOhBrzhEN03sgRq0fI63VdiPO4OlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Oyo1JQdOgV3srIx33A/ORa6ONpHA/4ikLpllH8zeF4=;
 b=Ul4ge82M7rHcUStW3bTSrpa2zEZST64SAA01JjGWGynWoqMgyLIQgnu9CeGwJrTtzZequJ+hVnPXgZlCeVD4wZhyMWgMqrlDTtv5WSEg0VU1GbYclhkoVWUk5A5b6QO1RBazx0PKyhfqQjLsnlUspwaBTMkblKV8BddUKhTzzdEXbgiqntoR4AdryYTEBilGYCSMfBz6dG/7w0Mzqjj5fNyrxvbzCO3SWMn9v+xy6Z27VcghQ3NOFb6FFDyHnK8RJyySU5CchhO7mDgifImvCFU5A81fJBHAOJ6O2jOS3bLo/bckdUvHRMF9zUfJnbAowrzycr6P0IReW3936eec6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6266.namprd11.prod.outlook.com (2603:10b6:208:3e6::12)
 by SA0PR11MB7158.namprd11.prod.outlook.com (2603:10b6:806:24b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.21; Fri, 19 Jun
 2026 17:47:12 +0000
Received: from IA1PR11MB6266.namprd11.prod.outlook.com
 ([fe80::eda2:e570:4314:8720]) by IA1PR11MB6266.namprd11.prod.outlook.com
 ([fe80::eda2:e570:4314:8720%5]) with mapi id 15.21.0113.015; Fri, 19 Jun 2026
 17:47:12 +0000
From: "Bhadane, Dnyaneshwar" <dnyaneshwar.bhadane@intel.com>
To: "Sousa, Gustavo" <gustavo.sousa@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Sousa, Gustavo" <gustavo.sousa@intel.com>
Subject: RE: [PATCH 2/9] drm/xe/step: Pass xe_step_info to xe_step_*_get()
 functions
Thread-Topic: [PATCH 2/9] drm/xe/step: Pass xe_step_info to xe_step_*_get()
 functions
Thread-Index: AQHc+E0clTGFrVVJRUaRND49wK6Zq7ZGNpAQ
Date: Fri, 19 Jun 2026 17:47:11 +0000
Message-ID: <IA1PR11MB6266100A1FA4D5D81E9DD88EE2E22@IA1PR11MB6266.namprd11.prod.outlook.com>
References: <20260609-xe-probe-info-v1-0-21e83e188e60@intel.com>
 <20260609-xe-probe-info-v1-2-21e83e188e60@intel.com>
In-Reply-To: <20260609-xe-probe-info-v1-2-21e83e188e60@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6266:EE_|SA0PR11MB7158:EE_
x-ms-office365-filtering-correlation-id: b1e5e131-79c1-490d-325f-08dece2acad0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|38070700021|4143699003|56012099006|6133799003|22082099003|18002099003|11063799006;
x-microsoft-antispam-message-info: HH24FX6WRliyuL05ytSvM1rYeGPJ5QetiVkH6n5usfdSwEHCjsBZCkwl8oKrRcimuEfj+IZyvsQTN5j96xUm1tzPfLPK7t17F5c3HEkPxWKFkFZTaEGTiAOcBxJqmV0dkgoUlaZ8p2gJE9LvI9bilECqZXpZcb+uygi9GBSHz4ygATnnYfSNTQBI/e23DrvSkdFKnKVZMyZkmhOMyl/XM33MArVfUmevJSZ6MP8n3iRMBbsnffrSB0LEQgBQnUApM2HTm31xk7e36bMXL0gzVDjL/QOJDWGHsX2LOmA2uiHckIViwhYQgMIL5rYomTIdPY7rHAbC5WgDI09oMFS7JofPow2cNfQ72/Id7jOjqogkaJ5U20BtVMnafLJMZyDGy3THPcWC5NCymj1dBE/72a+P7cOhCeE2fpCI4LN+rZC3uydeKoCykzc4MeesuHivA2Jak6Q47xCc/9sS5sRpCtRjurWhODQrq94ZC3A0jAlLZKytu7ylZAozjSa/0e9uZQbGcQINdcaAIWczTupdSkm3rmEVER+67URiw12GqVhPtpmZuVECR3RqtW188eurECZ5alx8zgD+d/QLEFIBSn1GcYKcrVs3azQogAVGqj6ndxhsgSTd9egH6NRMjz4l10b/swNZdKMf2Dlbqlq/fCcSP+bmgSFlbLbna5sOaS5BPqrF/NBskK6/GlUqpx15itP/mm331VdpQmWKdXmifR91Ef8b9PLJm/K6K9bEEmo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6266.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(38070700021)(4143699003)(56012099006)(6133799003)(22082099003)(18002099003)(11063799006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R1l4eVFGYk1DV3ZKTml1UHVDZzNVcDFiOXNzRXd0RmYxeSsxZ2VXQ0ZPVkdR?=
 =?utf-8?B?T29xZW4zNnRIN3FvRlNSTXFTbW8ySC9hNUlaNFJEUjZXdXNocmg2TElITTFC?=
 =?utf-8?B?ejQ0UGU3R1YzdDkvUGdMTU5jNzNTcitnUjB4SUc1WDJNVkIvY3M1NElCMkJJ?=
 =?utf-8?B?d1prLzEzZXhKbFlkVjEyS05mMVJ3K0R0YTZwSUdaZk5pTngyRVNkSWJucFNS?=
 =?utf-8?B?N0psMmFnVFZYT3FnVnJ1aXhLR0RrbmZ0TGdQVjNsTkExMklHNmk5ek9qQ21u?=
 =?utf-8?B?TUs2WUJrOG9IUEdxS3pXbS9wMUZTZTJrL2xNWG5kSUExclBQYVZjL0hiK0s3?=
 =?utf-8?B?WjRMUjV0YWdlbjFDMVlrSDVrT3B4TW1sTkgvNCsrSVFLSm9QS1dnc28yR2NY?=
 =?utf-8?B?dTVobXVaZ1ZHbWh6c0RsbXpJWWFoaTVGQ1NKcnU2cTVLb0NzS0d5YjhUYVFs?=
 =?utf-8?B?L01wNXZXUFJJeS8vaTdYYVNzUmN4M2Vlbk1XTDFXZ1VYTmRzdk5NWXpsMTk4?=
 =?utf-8?B?M2pkNDl2blBFcHZKTzArRm4yUnBYd2RnUjdmZG1TVGxBUmNGV0FwYmhsV1dP?=
 =?utf-8?B?dkxjcDF0Q3I2cHc5dDZxajdnb3VYcXh3djlLbEFIZjZlNWtSS2RrbWdlVnlM?=
 =?utf-8?B?VkoyZVowVDV3NkJ0QVVsMVUrSTdMdlF4VS9BL2REeGpJQVRFMTZzTUZoT2pG?=
 =?utf-8?B?SnlRN1NRakhEcVZleTAwREJSM0dyazE2OEgvSTNLaEV0NW5Xd1I2LzBjeGdO?=
 =?utf-8?B?TGh2YWJxMjBEclNwSjZYUHhwTFdsT3Y2WmtGMlJ2V3UvRkxtckhvVVp5QXVu?=
 =?utf-8?B?RGNMQVl0NzJTUTkwb1dyNGMyVW1JS1JPRWR4aG5GUTZRN3RpNGdJT0tJenAy?=
 =?utf-8?B?ekRCU3lBVUFlN3ZuQThKRHZUQkZZZFhuUjhCSHNkMm9XZlNqY2JRV0h3eUVV?=
 =?utf-8?B?cExtL3VwejE1djJXcFozMDcwV0RHUzAzVkFhV1hkVHlxZnYzdzduL2Qwek50?=
 =?utf-8?B?Y1ZlcXV4SW02bTh5U2pxeHFySUkyckxjbXJpSzl0cjZWZ3ZHUXVjMUNGeGFY?=
 =?utf-8?B?VWtJS3hleHAya3ZrVzAxR0hoUDdMSko0cWgrMmVuYk5ycGF2RHZZRDBEQXhJ?=
 =?utf-8?B?ZnpNcFZ2YWdCeENJL21IbnFWS0czeEhNT0FBS1A2Q2VJR1ZEb3ZIRHIvSC9z?=
 =?utf-8?B?dkp4Z1Z3UmtpTjBFdktGakViYnJZdEFUdXd6cmtoZHFJT29nM1R3eTU5VXU0?=
 =?utf-8?B?bFMvWTVVTmdTSHpucVAySTVLT3NabjBZZXVjei84Y1ZzbDlNL3JuVUE1aGF2?=
 =?utf-8?B?V2QzcjBrb1pFc3daNG9qL3pIWmlxenNIM3JsL1JKelJyWkxPdlNJSHNKK3dw?=
 =?utf-8?B?eXFwNFFieCtFNmdRclJwelVRMm9iT2NLMFFheVlMcFBWMXAyUHJGc2NTc3Zw?=
 =?utf-8?B?Y1Z0NkhSWUUwZGFVQVdaWmJmdExSYWswc1RNZ3JTYnp6cEU5dkFmZWFaaG9q?=
 =?utf-8?B?SWdxU2xPZ2xnN1UyT203T0FkYS8yNGZqdHZ5RmxTek9hTHRyWGpsLzBqT0pP?=
 =?utf-8?B?aHJqVmMrZnltQ2s0SVBtaW1BRmVpRjhodjdoQnh2Z0FnZHBmQWdQYVZNL1JJ?=
 =?utf-8?B?QnZEWlhYWjVDZzBBMWdWUnVjZkVDUjl1SjlDTkNaWCtVQXNFV2p2Qk9XMzk4?=
 =?utf-8?B?MERmT2RnSkFOK0xUZVpXOVZXQTZxano3ZEFLZU5xaldiRmdtNXlrZzc3VUtp?=
 =?utf-8?B?MDN0VnlhWU11ck4rNWlHU29tS1BOV2MxUjRjUmJEMk1NQ0U5YWY2czIwWWhu?=
 =?utf-8?B?NlhDcGRuMDJwbSs0VFlZNkRIWFJpZE8vaUxQQWU3Z0UvSzhLUjBMOVM3SWtQ?=
 =?utf-8?B?Zm9ZYVpJS2dDQ2FDNGdOdERWcTNPZ3JSZ3dDYXJaTWdUdVlkN1k3S29sa3Bo?=
 =?utf-8?B?NC9FODg1SGFhWXk4VHVxanJtQ2xQNWE5bnpSem1ZY0ZUM1h3RTVycU5TcnFk?=
 =?utf-8?B?U2laOHQ4Z1RTQ1ZRSjkwaUE0QjJCSUdGaDl4QngxMDU4ZjZuVkVST0MyamY4?=
 =?utf-8?B?aERhSTBkTzhGbUhFc3dZcWNDbi9oZEtFRWJWL2N2MGtBdFJlRlAwVnh5bytF?=
 =?utf-8?B?ZDd5WkhTczZMa2lQSTdHc3FCUWc4K08rMnFzTGI1SlllZzZTTUdWckZqcHV1?=
 =?utf-8?B?Sldza3l5MFh2cnM4dTVZcER1dmEzYnkySUxHQ3AzVDkyTkNxY2t6bTcvcU1w?=
 =?utf-8?B?dTdWV0NtREFubXBOZWVrMzROZkRVYnFDdVBmYzMvMyswQ3ZWdXdXeEkveEpj?=
 =?utf-8?B?RGh6RDZLbHlzWVhwOVBlM2ZqQmQ0a1BQRXJ3WnJHajhnVjVtSk5RenV1NkRO?=
 =?utf-8?Q?3kZB6ycU3V/fDyXs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: f9gxXyoCvUyDIgdo4SXyLfXIF3ASjt7ev4/wkhYvx8ScMCgFH5YHLQ8E74SLkjHnyK0PTa3DwLqLQS/xBAb2UQhF8ByVd4dO/8ghDaNcnXk/5E90n0W6va2X4Xvj5eb77yvJIp4mzYmHNavsdbBmGQ21LZ2kNXP9DgVo4rhX8pvVA627SK6SMUS6SVdxVJl/xF/49N3uJpI9No9UbVZSEY7+Ns0UsKtMZw3Lmc3CWVqP16cWU6GZKTaeTTOAqnZz2JVpLyFgtlMREKGGfxYdL2aHpui95AebaRMmonOmhbBKZVMnpr+JWejuSkZJYlWAYwCiScS8Yzm1Ojh5bLnG5w==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6266.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1e5e131-79c1-490d-325f-08dece2acad0
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2026 17:47:11.9268 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WR0D5hmUg5myDbD1i3+IESOMmz2L6+FqE83y0xxrPpTQy2baIGzeH7b8pBmdFwBqdip+VDFjULzBNWmOFYYJxsiV/Etp/dtEndHjJEej0wQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB7158
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSW50ZWwteGUgPGludGVs
LXhlLWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgR3VzdGF2bw0K
PiBTb3VzYQ0KPiBTZW50OiBXZWRuZXNkYXksIEp1bmUgMTAsIDIwMjYgMTo0OCBBTQ0KPiBUbzog
aW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBTb3VzYSwgR3VzdGF2byA8Z3Vz
dGF2by5zb3VzYUBpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFtQQVRDSCAyLzldIGRybS94ZS9zdGVw
OiBQYXNzIHhlX3N0ZXBfaW5mbyB0byB4ZV9zdGVwXypfZ2V0KCkNCj4gZnVuY3Rpb25zDQo+IA0K
PiBUaGUgeGVfc3RlcF8qX2dldCgpIGZ1bmN0aW9ucyB1cGRhdGUgdGhlIHN0ZXAgZGlyZWN0bHkg
aW4NCj4geGUtPmluZm8uc3RlcCBhbmQgYXJlIGNhbGxlZCBieSBmdW5jdGlvbnMgeGVfaW5mb19p
bml0X2Vhcmx5KCkgYW5kDQo+IHhlX2luZm9faW5pdCgpLg0KPiANCj4gQXMgdGhlIHN0ZXBwaW5n
IGluZm8gaXMgc29tZXRoaW5nIHByb2JlZCBmcm9tIHRoZSBoYXJkd2FyZSAodmlhIFBDSSByZXZp
ZA0KPiBhbmQvb3IgR01ESUQpIGFuZCB3ZSB3YW50IHRvIG1vdmUgYXdheSBmcm9tIHByb2Jpbmcg
aW5zaWRlDQo+IHhlX2luZm9faW5pdCooKSBmdW5jdGlvbnMsIGxldCdzIG1ha2UgeGVfc3RlcF8q
X2dldCgpIGZ1bmN0aW9ucyBtb2RpZnkgYQ0KPiBwb2ludGVyIHRvIHRoZSBzdGVwIHN0cnVjdHVy
ZSBpbnN0ZWFkIG9mIG1vZGlmeWluZyB4ZS0+aW5mby5zdGVwDQo+IGRpcmVjdGx5OiB0aGlzIHdp
bGwgYWxsb3cgYW4gdXBjb21pbmcgY2hhbmdlIHRoYXQgd2lsbCBtb3ZlIHRob3NlIGZ1bmN0aW9u
IGNhbGxzDQo+IG91dCBvZiB0aGUgaW5mbyBpbml0IGZ1bmN0aW9ucyBhbmQgd2lsbCBwYXNzIGEg
bWVtYmVyIG9mIHN0cnVjdCB4ZV9wcm9iZWRfaW5mbw0KPiBpbnN0ZWFkIG9mIHhlLT5pbmZvLnN0
ZXAuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBHdXN0YXZvIFNvdXNhIDxndXN0YXZvLnNvdXNhQGlu
dGVsLmNvbT4NCg0KTEdUTSwNClJldmlld2VkLWJ5OiBEbnlhbmVzaHdhciBCaGFkYW5lIDxkbnlh
bmVzaHdhci5iaGFkYW5lQGludGVsLmNvbT4NCg0KRG55YW5lc2h3YXINCg0KPiAtLS0NCj4gIGRy
aXZlcnMvZ3B1L2RybS94ZS94ZV9wY2kuYyAgfCAgNiArKystLS0gIGRyaXZlcnMvZ3B1L2RybS94
ZS94ZV9zdGVwLmMgfCAzMw0KPiArKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0gIGRy
aXZlcnMvZ3B1L2RybS94ZS94ZV9zdGVwLmggfCAgNw0KPiArKysrLS0tDQo+ICAzIGZpbGVzIGNo
YW5nZWQsIDI3IGluc2VydGlvbnMoKyksIDE5IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wY2kuYyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9w
Y2kuYyBpbmRleA0KPiA3ZjFkYTZkMjUwMTEuLjY0NmUwNGM2MjU0ZiAxMDA2NDQNCj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX3BjaS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94
ZV9wY2kuYw0KPiBAQCAtODExLDcgKzgxMSw3IEBAIHN0YXRpYyBpbnQgeGVfaW5mb19pbml0X2Vh
cmx5KHN0cnVjdCB4ZV9kZXZpY2UgKnhlLA0KPiAgCXhlLT5pbmZvLm1heF9ndF9wZXJfdGlsZSA9
IGRlc2MtPm1heF9ndF9wZXJfdGlsZTsNCj4gIAl4ZS0+aW5mby50aWxlX2NvdW50ID0gMSArIGRl
c2MtPm1heF9yZW1vdGVfdGlsZXM7DQo+IA0KPiAtCXhlX3N0ZXBfcGxhdGZvcm1fZ2V0KHhlKTsN
Cj4gKwl4ZV9zdGVwX3BsYXRmb3JtX2dldCh4ZSwgJnhlLT5pbmZvLnN0ZXApOw0KPiANCj4gIAll
cnIgPSB4ZV90aWxlX2luaXRfZWFybHkoeGVfZGV2aWNlX2dldF9yb290X3RpbGUoeGUpLCB4ZSwg
MCk7DQo+ICAJaWYgKGVycikNCj4gQEAgLTk2Myw3ICs5NjMsNyBAQCBzdGF0aWMgaW50IHhlX2lu
Zm9faW5pdChzdHJ1Y3QgeGVfZGV2aWNlICp4ZSwNCj4gIAlpZiAoZGVzYy0+cHJlX2dtZGlkX2dy
YXBoaWNzX2lwKSB7DQo+ICAJCWdyYXBoaWNzX2lwID0gZGVzYy0+cHJlX2dtZGlkX2dyYXBoaWNz
X2lwOw0KPiAgCQltZWRpYV9pcCA9IGRlc2MtPnByZV9nbWRpZF9tZWRpYV9pcDsNCj4gLQkJeGVf
c3RlcF9wcmVfZ21kaWRfZ2V0KHhlKTsNCj4gKwkJeGVfc3RlcF9wcmVfZ21kaWRfZ2V0KHhlLCAm
eGUtPmluZm8uc3RlcCk7DQo+ICAJfSBlbHNlIHsNCj4gIAkJeGVfYXNzZXJ0KHhlLCAhZGVzYy0+
cHJlX2dtZGlkX21lZGlhX2lwKTsNCj4gIAkJcmV0ID0gaGFuZGxlX2dtZGlkKHhlLCAmZ3JhcGhp
Y3NfaXAsICZtZWRpYV9pcCwgQEAgLTk3MSw3DQo+ICs5NzEsNyBAQCBzdGF0aWMgaW50IHhlX2lu
Zm9faW5pdChzdHJ1Y3QgeGVfZGV2aWNlICp4ZSwNCj4gIAkJaWYgKHJldCkNCj4gIAkJCXJldHVy
biByZXQ7DQo+IA0KPiAtCQl4ZV9zdGVwX2dtZGlkX2dldCh4ZSwgZ3JhcGhpY3NfZ21kaWRfcmV2
aWQsDQo+IG1lZGlhX2dtZGlkX3JldmlkKTsNCj4gKwkJeGVfc3RlcF9nbWRpZF9nZXQoeGUsIGdy
YXBoaWNzX2dtZGlkX3JldmlkLA0KPiBtZWRpYV9nbWRpZF9yZXZpZCwNCj4gKyZ4ZS0+aW5mby5z
dGVwKTsNCj4gIAl9DQo+IA0KPiAgCS8qDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
eGUveGVfc3RlcC5jIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3N0ZXAuYw0KPiBpbmRleCBmYjlj
MzE2MTNjYTcuLjQ5ZGM2NGYyYjM2MyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hl
L3hlX3N0ZXAuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfc3RlcC5jDQo+IEBAIC0x
MTEsMTEgKzExMSwxMiBAQCBfX2RpYWdfcG9wKCk7DQo+ICAvKioNCj4gICAqIHhlX3N0ZXBfcGxh
dGZvcm1fZ2V0IC0gRGV0ZXJtaW5lIHBsYXRmb3JtLWxldmVsIHN0ZXBwaW5nIGZyb20gUENJIHJl
dmlkDQo+ICAgKiBAeGU6IFhlIGRldmljZQ0KPiArICogQHN0ZXA6IFBvaW50ZXIgdG8gdGhlIHN0
ZXAgc3RydWN0IHRvIHVwZGF0ZQ0KPiAgICoNCj4gICAqIENvbnZlcnQgdGhlIFBDSSByZXZpZCBp
bnRvIGEgcGxhdGZvcm0tbGV2ZWwgc3RlcHBpbmcgdmFsdWUgYW5kIHN0b3JlIHRoYXQNCj4gLSAq
IGluIHRoZSBkZXZpY2UgaW5mby4NCj4gKyAqIGluIEBzdGVwLT5wbGF0Zm9ybS4NCj4gICAqLw0K
PiAtdm9pZCB4ZV9zdGVwX3BsYXRmb3JtX2dldChzdHJ1Y3QgeGVfZGV2aWNlICp4ZSkNCj4gK3Zv
aWQgeGVfc3RlcF9wbGF0Zm9ybV9nZXQoc3RydWN0IHhlX2RldmljZSAqeGUsIHN0cnVjdCB4ZV9z
dGVwX2luZm8NCj4gKypzdGVwKQ0KPiAgew0KPiAgCS8qDQo+ICAJICogTm90IGFsbCBwbGF0Zm9y
bXMgbWFwIFBDSSByZXZpZCBkaXJlY3RseSBpbnRvIG91ciBzeW1ib2xpYyBzdGVwcGluZw0KPiBA
QCAtMTI3LDE3ICsxMjgsMjAgQEAgdm9pZCB4ZV9zdGVwX3BsYXRmb3JtX2dldChzdHJ1Y3QgeGVf
ZGV2aWNlICp4ZSkNCj4gIAkgKi8NCj4gDQo+ICAJaWYgKHhlLT5pbmZvLnBsYXRmb3JtID09IFhF
X05PVkFMQUtFX1ApDQo+IC0JCXhlLT5pbmZvLnN0ZXAucGxhdGZvcm0gPSBTVEVQX0EwICsgeGUt
PmluZm8ucmV2aWQ7DQo+ICsJCXN0ZXAtPnBsYXRmb3JtID0gU1RFUF9BMCArIHhlLT5pbmZvLnJl
dmlkOw0KPiAgfQ0KPiANCj4gIC8qKg0KPiAgICogeGVfc3RlcF9wcmVfZ21kaWRfZ2V0IC0gRGV0
ZXJtaW5lIElQIHN0ZXBwaW5ncyBmcm9tIFBDSSByZXZpZA0KPiAgICogQHhlOiBYZSBkZXZpY2UN
Cj4gKyAqIEBzdGVwOiBQb2ludGVyIHRvIHRoZSBzdGVwIHN0cnVjdCB0byB1cGRhdGUNCj4gICAq
DQo+IC0gKiBDb252ZXJ0IHRoZSBQQ0kgcmV2aWQgaW50byBwcm9wZXIgSVAgc3RlcHBpbmdzLiAg
VGhpcyBzaG91bGQgb25seSBiZQ0KPiAtICogdXNlZCBvbiBwbGF0Zm9ybXMgdGhhdCBkbyBub3Qg
aGF2ZSBHTURfSUQgc3VwcG9ydC4NCj4gKyAqIENvbnZlcnQgdGhlIFBDSSByZXZpZCBpbnRvIHBy
b3BlciBJUCBzdGVwcGluZ3MgYW5kIHVwZGF0ZQ0KPiArIEBzdGVwLT5iYXNlZGllLA0KPiArICog
QHN0ZXAtPmdyYXBoaWNzIGFuZCBAc3RlcC0+bWVkaWEgYWNjb3JkaW5nbHkuDQo+ICsgKg0KPiAr
ICogVGhpcyBzaG91bGQgb25seSBiZSB1c2VkIG9uIHBsYXRmb3JtcyB0aGF0IGRvIG5vdCBoYXZl
IEdNRF9JRCBzdXBwb3J0Lg0KPiAgICovDQo+IC12b2lkIHhlX3N0ZXBfcHJlX2dtZGlkX2dldChz
dHJ1Y3QgeGVfZGV2aWNlICp4ZSkNCj4gK3ZvaWQgeGVfc3RlcF9wcmVfZ21kaWRfZ2V0KHN0cnVj
dCB4ZV9kZXZpY2UgKnhlLCBzdHJ1Y3QgeGVfc3RlcF9pbmZvDQo+ICsqc3RlcCkNCj4gIHsNCj4g
IAljb25zdCBzdHJ1Y3QgeGVfc3RlcF9pbmZvICpyZXZpZHMgPSBOVUxMOw0KPiAgCXUxNiByZXZp
ZCA9IHhlLT5pbmZvLnJldmlkOw0KPiBAQCAtMjM0LDkgKzIzOCw5IEBAIHZvaWQgeGVfc3RlcF9w
cmVfZ21kaWRfZ2V0KHN0cnVjdCB4ZV9kZXZpY2UgKnhlKQ0KPiAgCX0NCj4gDQo+ICBkb25lOg0K
PiAtCXhlLT5pbmZvLnN0ZXAuZ3JhcGhpY3MgPSBncmFwaGljczsNCj4gLQl4ZS0+aW5mby5zdGVw
Lm1lZGlhID0gbWVkaWE7DQo+IC0JeGUtPmluZm8uc3RlcC5iYXNlZGllID0gYmFzZWRpZTsNCj4g
KwlzdGVwLT5ncmFwaGljcyA9IGdyYXBoaWNzOw0KPiArCXN0ZXAtPm1lZGlhID0gbWVkaWE7DQo+
ICsJc3RlcC0+YmFzZWRpZSA9IGJhc2VkaWU7DQo+ICB9DQo+IA0KPiAgLyoqDQo+IEBAIC0yNDQs
OCArMjQ4LDEwIEBAIHZvaWQgeGVfc3RlcF9wcmVfZ21kaWRfZ2V0KHN0cnVjdCB4ZV9kZXZpY2Ug
KnhlKQ0KPiAgICogQHhlOiBYZSBkZXZpY2UNCj4gICAqIEBncmFwaGljc19nbWRpZF9yZXZpZDog
dmFsdWUgb2YgZ3JhcGhpY3MgR01EX0lEIHJlZ2lzdGVyJ3MgcmV2aWQgZmllbGQNCj4gICAqIEBt
ZWRpYV9nbWRpZF9yZXZpZDogdmFsdWUgb2YgbWVkaWEgR01EX0lEIHJlZ2lzdGVyJ3MgcmV2aWQg
ZmllbGQNCj4gKyAqIEBzdGVwOiBQb25pbnRlciB0byB0aGUgc3RlcCBzdHJ1Y3QgdG8gdXBkYXRl
Lg0KPiAgICoNCj4gLSAqIENvbnZlcnQgdGhlIHJldmlkIGZpZWxkcyBvZiB0aGUgR01EX0lEIHJl
Z2lzdGVycyBpbnRvIHByb3BlciBJUCBzdGVwcGluZ3MuDQo+ICsgKiBDb252ZXJ0IHRoZSByZXZp
ZCBmaWVsZHMgb2YgdGhlIEdNRF9JRCByZWdpc3RlcnMgaW50byBwcm9wZXIgSVANCj4gKyBzdGVw
cGluZ3MNCj4gKyAqIGFuZCB1cGRhdGUgQHN0ZXAtPmdyYXBoaWNzIGFuZCBAc3RlcC0+bWVkaWEg
YWNjb3JkaW5nbHkuDQo+ICAgKg0KPiAgICogR01EX0lEIHJldmlkIHZhbHVlcyBhcmUgY3VycmVu
dGx5IGV4cGVjdGVkIHRvIGhhdmUgY29uc2lzdGVudCBtZWFuaW5ncyBvbg0KPiAgICogYWxsIHBs
YXRmb3JtczogIG1ham9yIHN0ZXBwaW5ncyAoQTAsIEIwLCBldGMuKSBhcmUgNCBhcGFydCwgd2l0
aCBtaW5vciBAQCAtDQo+IDI1Myw3ICsyNTksOCBAQCB2b2lkIHhlX3N0ZXBfcHJlX2dtZGlkX2dl
dChzdHJ1Y3QgeGVfZGV2aWNlICp4ZSkNCj4gICAqLw0KPiAgdm9pZCB4ZV9zdGVwX2dtZGlkX2dl
dChzdHJ1Y3QgeGVfZGV2aWNlICp4ZSwNCj4gIAkJICAgICAgIHUzMiBncmFwaGljc19nbWRpZF9y
ZXZpZCwNCj4gLQkJICAgICAgIHUzMiBtZWRpYV9nbWRpZF9yZXZpZCkNCj4gKwkJICAgICAgIHUz
MiBtZWRpYV9nbWRpZF9yZXZpZCwNCj4gKwkJICAgICAgIHN0cnVjdCB4ZV9zdGVwX2luZm8gKnN0
ZXApDQo+ICB7DQo+ICAJdTggZ3JhcGhpY3MgPSBTVEVQX0EwICsgZ3JhcGhpY3NfZ21kaWRfcmV2
aWQ7DQo+ICAJdTggbWVkaWEgPSBTVEVQX0EwICsgbWVkaWFfZ21kaWRfcmV2aWQ7IEBAIC0yNzAs
OCArMjc3LDggQEANCj4gdm9pZCB4ZV9zdGVwX2dtZGlkX2dldChzdHJ1Y3QgeGVfZGV2aWNlICp4
ZSwNCj4gIAkJCW1lZGlhX2dtZGlkX3JldmlkKTsNCj4gIAl9DQo+IA0KPiAtCXhlLT5pbmZvLnN0
ZXAuZ3JhcGhpY3MgPSBncmFwaGljczsNCj4gLQl4ZS0+aW5mby5zdGVwLm1lZGlhID0gbWVkaWE7
DQo+ICsJc3RlcC0+Z3JhcGhpY3MgPSBncmFwaGljczsNCj4gKwlzdGVwLT5tZWRpYSA9IG1lZGlh
Ow0KPiAgfQ0KPiANCj4gICNkZWZpbmUgU1RFUF9OQU1FX0NBU0UobmFtZSkJXA0KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3N0ZXAuaCBiL2RyaXZlcnMvZ3B1L2RybS94ZS94
ZV9zdGVwLmgNCj4gaW5kZXggZWEzNmIyMmNjMjk3Li5jNmNlYTk1YTM3MjcgMTAwNjQ0DQo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9zdGVwLmgNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L3hlL3hlX3N0ZXAuaA0KPiBAQCAtMTIsMTIgKzEyLDEzIEBADQo+IA0KPiAgc3RydWN0IHhlX2Rl
dmljZTsNCj4gDQo+IC12b2lkIHhlX3N0ZXBfcGxhdGZvcm1fZ2V0KHN0cnVjdCB4ZV9kZXZpY2Ug
KnhlKTsNCj4gK3ZvaWQgeGVfc3RlcF9wbGF0Zm9ybV9nZXQoc3RydWN0IHhlX2RldmljZSAqeGUs
IHN0cnVjdCB4ZV9zdGVwX2luZm8NCj4gKypzdGVwKTsNCj4gDQo+IC12b2lkIHhlX3N0ZXBfcHJl
X2dtZGlkX2dldChzdHJ1Y3QgeGVfZGV2aWNlICp4ZSk7DQo+ICt2b2lkIHhlX3N0ZXBfcHJlX2dt
ZGlkX2dldChzdHJ1Y3QgeGVfZGV2aWNlICp4ZSwgc3RydWN0IHhlX3N0ZXBfaW5mbw0KPiArKnN0
ZXApOw0KPiAgdm9pZCB4ZV9zdGVwX2dtZGlkX2dldChzdHJ1Y3QgeGVfZGV2aWNlICp4ZSwNCj4g
IAkJICAgICAgIHUzMiBncmFwaGljc19nbWRpZF9yZXZpZCwNCj4gLQkJICAgICAgIHUzMiBtZWRp
YV9nbWRpZF9yZXZpZCk7DQo+ICsJCSAgICAgICB1MzIgbWVkaWFfZ21kaWRfcmV2aWQsDQo+ICsJ
CSAgICAgICBzdHJ1Y3QgeGVfc3RlcF9pbmZvICpzdGVwKTsNCj4gIHN0YXRpYyBpbmxpbmUgdTMy
IHhlX3N0ZXBfdG9fZ21kaWQoZW51bSBpbnRlbF9zdGVwIHN0ZXApIHsgcmV0dXJuIHN0ZXAgLQ0K
PiBTVEVQX0EwOyB9DQo+IA0KPiAgY29uc3QgY2hhciAqeGVfc3RlcF9uYW1lKGVudW0gaW50ZWxf
c3RlcCBzdGVwKTsNCj4gDQo+IC0tDQo+IDIuNTMuMA0KDQo=
