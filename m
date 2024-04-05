Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 083A7C67861
	for <intel-xe@archiver.kernel.org>; Fri,  5 Apr 2024 17:43:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5A9310E22B;
	Fri,  5 Apr 2024 17:43:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VyNNUfXl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3F351132E3;
 Fri,  5 Apr 2024 17:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712338989; x=1743874989;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=EQAz2ljOourIR6a+OOP6dHNt6oUnt9H6IDGmSGPY4Kc=;
 b=VyNNUfXlywn5cf0+VHzJMnHKKMTUFavPd8RZn4Q73ZM3updpZDzkgQc6
 GjzyQkl9skmtyOuTvCBSOeoEslJ5s93r9MoxLLMdtp6+9y40/2haksE8O
 lfvdIK/ths5NqGBbeGvNwfw/wNjswBwl2g0Q1DYffD1rjVUF814nu3Pqi
 ZPh9MU78QBuLCXg13Uzdn9kKfzfyhpcduz1gEyWf9ol1uYWCNOP9A8fJM
 EDbDueVEzkKg0Fj86VluuM0YJaIBVdUk8aEoHTyTrpNAci7epkJnd9dlZ
 IFLaPLBAjmPXDhMisQKfCU99vQotk6TTTDbPlWmRJqVO8kbn8VDUKOfUn Q==;
X-CSE-ConnectionGUID: 5dJrXfoVT6CdeWttU0OwPw==
X-CSE-MsgGUID: CITg7MmVS3Ka49OdU9uBsg==
X-IronPort-AV: E=McAfee;i="6600,9927,11035"; a="7580143"
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; 
   d="scan'208";a="7580143"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 10:42:58 -0700
X-CSE-ConnectionGUID: IKbIsdbgTWK62qUjJuICFQ==
X-CSE-MsgGUID: DmznUsVgSGagItJ2jaoSTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; d="scan'208";a="23864807"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Apr 2024 10:42:58 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 5 Apr 2024 10:42:57 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 5 Apr 2024 10:42:57 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 5 Apr 2024 10:42:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U2qkv8IPBtzKzkL628IKCM/+Zg6HRIOxBEtAM71r7YOlKk2Ov6fGK+EUoVoWolF4M1MlY4XkvreTQt/QeyTBap4aFJpNNgtQ/5V2sZTSNU0NcXb3iCp2oJO1PZIrWn8QCL2q6IGE0BSvsauuDVZQpZ11dwgjHVoIq4bL0fHHlLWUFv8JnpRKP/PsCJtWWG9SViZL0N8YRLPYXuLF9HSBSF1mSYvvU2yXjYRkUE7nF7oFoSd2ZYdPtUto+u6/5ndsdQEL2eFrBfwOrG9V7T7VCVjUc22U7M626O8bVGJV8AQL4aq8/MRNd24NQXuX2OGj7G2Ovaco1ALNWEeTXv90AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EQAz2ljOourIR6a+OOP6dHNt6oUnt9H6IDGmSGPY4Kc=;
 b=isihS23WWavGiLjN3uHzGr2YzqRBfCH7OiUDihh+F6Uy60dtlFWgx5WLd6lgmvD+H/Gd0BBsusnnsF5dWy7FKZ+nq5S0ypcU6aemmoX+spmGPu0d5UeLVPqtIjl34FsgYaHe6iHHr6sfwZC8X1yMBjO5aiiNZNlFxTTrrsYal0F8TB7RrJLb7+6iodMQbaSq4WXfcUELhy447BgbTHe9d6rgimehw9wotgV2o5O2rOjTzbt3yVbZ98P5ljb5zGWM3nbgllSDE7Gwf2b9sskYJlZqEIgASNTaH6gPHxV9Bn5L0w5kkp6EdHKCEFMQWZYT2L1pwqof4YDRQjjND70AhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by MW4PR11MB6809.namprd11.prod.outlook.com (2603:10b6:303:1e9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.24; Fri, 5 Apr
 2024 17:42:54 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::c563:8fb8:d95:71ac]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::c563:8fb8:d95:71ac%5]) with mapi id 15.20.7409.031; Fri, 5 Apr 2024
 17:42:54 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH i-g-t 2/3] lib/igt_kmod: drop devcoredump before a PCI
 module unload
Thread-Topic: [PATCH i-g-t 2/3] lib/igt_kmod: drop devcoredump before a PCI
 module unload
Thread-Index: AQHahdmbxDe05+fdS0+T0qR29GUdsLFZ8/EAgAABuQA=
Date: Fri, 5 Apr 2024 17:42:54 +0000
Message-ID: <4be0c16d91e0974cc689db3a78ec5dab6f603723.camel@intel.com>
References: <20240403151411.113159-1-rodrigo.vivi@intel.com>
 <20240403151411.113159-2-rodrigo.vivi@intel.com>
 <zwrpstbmzbpkhbu6k7rjv5lm2a6wjvjs5t7msosmhhl5mtk2pq@4agb7ra6ceqf>
In-Reply-To: <zwrpstbmzbpkhbu6k7rjv5lm2a6wjvjs5t7msosmhhl5mtk2pq@4agb7ra6ceqf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|MW4PR11MB6809:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VFzdH2k5bDdwmKQte2M48rWoSOM/btCrd1f9SQMht8/MV4CRvDS9P8C+cE4nuPQ9yy2Td/TOPsZzbyBR5mmn18T0rPLhDN+ud+EuMhfCs+AylnJedFgOcl8u8qTNFyp24N302Me5kpo3gaIy6uhsLqFJdL5rE2xgJ2HzYOl0zxxkrMX7OziX6wglwhG8bV7hfW4cJe2UojtOENDADjy6skL8uoUBZo9hzMV0s+2mKGHrgpIigHUfok0F8OZsnfcyFl3pTI0QBL8ydXiohGWQSFnX/Cak8/ezLxkb1Cgp2EgyLlynWuha5R6hDkksFfoK3rx0Ni3ed3bgUjjB2UMnb6WbTZxvUeQpgALPZkN+eZntiEkHLtOvF87q8skXK5YUYteToSqm2FSgJHg0h47OL2manklNACZD1QIwAyNiqAvAhmjGy4csRTBtLO6dKkbW6SFKepEN1VA8ul8U9WSNyOO0eocpeA6cphTVRbbIknvaFp8xOKrUhBPbrD+ZWlSnfezMXySyM862Kcu4Ky2zW2THAwFxZbWnAfsQseVxi4IpvtBO+GaJ0ru/SpLZrYVP9RAqAH4EqKnPlue+AhaxchJi2Ln1+4jktExvKzoa2/OZqH6UhXId13hWMWpQ11rhBn3U3ZVUMZGggM30m0R7ZMrlEkCUhcVG5mLAxzpXXYY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bzJCVUNUNkdrTVNWdVF6bU16VzNmRFI5U084MzhZQlFZeVB3eHZHM011eUNr?=
 =?utf-8?B?SlZETUlkYkgvOTBOVEsyV09NTm9TV2F6cTM0WUpKeW10RmxiM0lFRnh1b0xM?=
 =?utf-8?B?ajNKams5aUJTRTJJcDlRaG1od0dGeGNPMlRYVlNZRjNmMHVRVWRZM0Y1eVh6?=
 =?utf-8?B?TGJ1ZkRFSDVUUHZ6ZnlqOHJ5UG5zZnVTdE5lT0dXSVZXdUlkZktCekdDRDlK?=
 =?utf-8?B?SlBaS0UrekowN0FpbnZyMi9MWXpmTDYzbFhyQ3I2TWpzeXpaOHlVTWM5c3ZZ?=
 =?utf-8?B?VmVtMUs2QU9VYklDRUh6NG5PQ3cvRnhveDQzb1ZianBwczRERjhxSlNxOUI1?=
 =?utf-8?B?dzRiT08zczMxbzNWNDQ1ZnZjb2NEcmxJeVFhVkIyZGtrUk9HN1hTaEVXZVJm?=
 =?utf-8?B?eTN4UnNRajdGM29TYk9rUzRxbmY2Sy9DNUN3cXRhL1pjUnhDbWtuYVZPYjQr?=
 =?utf-8?B?M2dKMEtoZ3dNQkJ2VmFZVmVlaVhRVmZlVmp2cU5HL0pVUEZNbGZXZ2JQVlFQ?=
 =?utf-8?B?VjRDREJvbFNpeTN2QkpEVUM1V1dRQW9ER1dPSjRPYzZlRy9ueEtZY0VKcHlU?=
 =?utf-8?B?WFB4NHJMS3ZCcjFLZmtLWnU5VDdEbzZMSnZpSDJhSFdWZDc3WURMREYxTGFI?=
 =?utf-8?B?ZnAzMVc0WmlaWlF6WDB4ZmsrU2hOcG5iNVJnRERWQi92L29QN1ZuTnpqRmRY?=
 =?utf-8?B?SitDZ0h2OWRBMldZVUZYblVhL2tkajdrR2RvQ1EvaW1RY1FqbHZWbzdINXUx?=
 =?utf-8?B?UVUwcnprOFRIbjNXVEoxbllza1dkZXZGMGVNR0JWK09qQ1JJS0FGdU5wTGo0?=
 =?utf-8?B?MWh5a3JmMSs1eU1FUEl1em5qeVlxbEtnSUN6aHV2RDZKVGVjTi9oTDBpMkl2?=
 =?utf-8?B?VnoraHNQR0lSVnhvTnlneHZBaW5GVXpiQXhmejhnQ0poUmgzcDJFSkdQRytJ?=
 =?utf-8?B?NEFtOVUyVUJnZldwSGVUbTJDWGlzeHpmOGNWWEYyOVRIb3oxYnRRSllIUXVh?=
 =?utf-8?B?WUJEUXZvcEdiaHByejdCaWhaMHMweXQrUm9lNjFiZ2h6Qm9GTGdyeEViT25h?=
 =?utf-8?B?YmhvblY1SzNSM0t0bEtSdG91bmg1Nm0rVk1FTG9pdTlwd0lsZTFyQ1Iza1hD?=
 =?utf-8?B?NjF1dUw0MzB2RE1lOUhHb0h4clkxVGo5M0JkQzkybnMzbmoyaFNYb2VOL1pz?=
 =?utf-8?B?WHdHNE5tTG5SMHdpQlRhc2VjdUVJOUhrWWhOUzZsdlhLa1I5Y0dXbE8rYUhr?=
 =?utf-8?B?UUpzUTBMbVd2SXZBTUtVZ3prZk04cHgwc2tKOG1FL25NTjF0QkZZNFZFUlJQ?=
 =?utf-8?B?b1lkWkxZaDM1dWp6aVZxRzFob29Qei9xc0FzdEh6MDE5WnkxSE95QTdaZldU?=
 =?utf-8?B?SjNrVjR5Y1hvVVBkRWpFMEdvTTlBS1FEWklSdnBoaW92RjdHYUltT2Q3MWQr?=
 =?utf-8?B?NzdZMEdiZEI0dTFudnNrdWsvaGltOHkwWE9MRm5Dck9xelhQUG5yRGNZV3BS?=
 =?utf-8?B?Z2xYWWlORFlkR2lOL2VqbWx5R2Q2Tys4K1ZCdmpYQktiUWFkcXBhTE9vRWNV?=
 =?utf-8?B?RElnbTJqeXMza2FyQkJCajdaOG9YaVUvL3l1d2Ewa1F2YzZzYy9YWmZpZzZk?=
 =?utf-8?B?RE04K29XeUZlSlB3OCtQbGQ4UjAxVDkzcWdJOEZhcDJYc3c1MWlBdzNQQWll?=
 =?utf-8?B?VlBBVVg3VEhHZHF5YVpOaklDdkFpSlJVMjMyMjBxTG9FdkJvelRWSEQ2ZGlQ?=
 =?utf-8?B?QmVvVXJWRnlXR2hRUitETU9SS2grVDNaNTNXT3djNjJrZjZxcERmV1FUU04x?=
 =?utf-8?B?UFY1czVwblowWmFRd2d4djJsMjJGcEdZdGtXckhXbmdSY0x5aVRaSmhWVzJH?=
 =?utf-8?B?UCtMVEkxU3JZWEFYeUtBUUlJNDNkclFTdzlEZnR6cHlrbC9GSFFWczVTck9w?=
 =?utf-8?B?dXZTenVIeGQzNDJ4aEtLTm1vTVNmbEE4TEE0b1lseEYrTWFDZVJnMWRZOWUr?=
 =?utf-8?B?QVQ5NTcxR2JaRHoxSGxxRDZ1MDJ6RFhKLzI5OTdaakJVVXVUb3FaVUNNYVV0?=
 =?utf-8?B?dWREWkpQa1MxSjNGK2VQRHRocDdwQWErRTgrZ2dINlZWdnM2ZFJZZ3lEY2pI?=
 =?utf-8?B?S0trcHlKeFJtNGY0RGtBL2VUSWZ0S2hHenlOU2U5S2NDZE1YZHN5YlM4ZTds?=
 =?utf-8?B?Q1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7AEC74B1AE29024CA0C9E9D1ABD1CE6C@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 093f97c6-7e4f-40b0-6ef5-08dc5597d2e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Apr 2024 17:42:54.5842 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HKy50bUgM2DUHcO5pz16DIjT/zEftBhqAPtE+qrT0p7StUhC3qT11H2mTAqjscG5T39g99/wxAls4xWIEFJGrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6809
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

T24gRnJpLCAyMDI0LTA0LTA1IGF0IDEyOjM2IC0wNTAwLCBMdWNhcyBEZSBNYXJjaGkgd3JvdGU6
DQo+IE9uIFdlZCwgQXByIDAzLCAyMDI0IGF0IDExOjE0OjA4QU0gLTA0MDAsIFJvZHJpZ28gVml2
aSB3cm90ZToNCj4gPiBkZXZjb3JlZHVtcCBob2xkcyBhIG1vZHVsZSByZWZlcmVuY2UsIGJsb2Nr
aW5nIHRoZSBtb2R1bGUgcmVtb3ZhbC4NCj4gPiANCj4gPiBJdCBpcyBpbnRlbnRpb25hbCBmcm9t
IHRoZSBkZXZjb3JlZHVtcCBwZXJzcGVjdGl2ZSB0byBrZWVwIHRoZQ0KPiA+IGxvZyBhdmFpbGFi
bGUgZXZlbiBhZnRlciB0aGUgdW5iaW5kL3VucHJvYmUuIEhvd2V2ZXIgaXQgYmxvY2tzDQo+ID4g
b3VyIG1vZHVsZSByZW1vdmFsIGhlcmUuDQoNCidkZXZjb3JlZHVtcDogQWRkIGRldl9jb3JlZHVt
cF9wdXQoKScgd2FzIHJldmlld2VkIGJ5IGRldmNvcmVkdW1wIG1haW50YWluZXJzLCBzbyB3ZSBj
YW4gcmVtb3ZlIGRldmNvcmVkdW1wIGJlZm9yZSB1bmxvYWQgWGUuDQpTbyBJIGRvbid0IHRoaW5r
IHdlIHdpbGwgbmVlZCB0aGlzIHBhdGNoLg0KDQpJdCBpcyBzdGlsbCBwZW5kaW5nIG9uIGdldHRp
bmcgcHVzaGVkIGJ1dCB3ZSBjb3VsZCBhZGQgdG8gdGhlIHRvcGljIGJyYW5jaGVzIHRvIHVuYmxv
Y2sgQ0kgaWYgbmVlZGVkLg0KDQo+ID4gDQo+ID4gdjI6IEFjY2VwdGluZyBtYW55IHN1Z2dlc3Rp
b25zIGZyb20gTHVjYXMuDQo+ID4gDQo+ID4gQ2M6IEx1Y2FzIERlIE1hcmNoaSA8bHVjYXMuZGVt
YXJjaGlAaW50ZWwuY29tPg0KPiA+IENjOiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5r
aG9yc3RAbGludXguaW50ZWwuY29tPg0KPiA+IENjOiBKb3PDqSBSb2JlcnRvIGRlIFNvdXphIDxq
b3NlLnNvdXphQGludGVsLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBSb2RyaWdvIFZpdmkgPHJv
ZHJpZ28udml2aUBpbnRlbC5jb20+DQo+ID4gLS0tDQo+ID4gbGliL2lndF9rbW9kLmMgfCA1NSAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiA+IDEg
ZmlsZSBjaGFuZ2VkLCA1NSBpbnNlcnRpb25zKCspDQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL2xp
Yi9pZ3Rfa21vZC5jIGIvbGliL2lndF9rbW9kLmMNCj4gPiBpbmRleCBjYzI0MjgzOGYuLjE0ZDUx
ZjRmNiAxMDA2NDQNCj4gPiAtLS0gYS9saWIvaWd0X2ttb2QuYw0KPiA+ICsrKyBiL2xpYi9pZ3Rf
a21vZC5jDQo+ID4gQEAgLTMyMyw2ICszMjMsNTkgQEAgc3RhdGljIGludCBpZ3Rfa21vZF91bmxv
YWRfcihzdHJ1Y3Qga21vZF9tb2R1bGUgKmttb2QsIHVuc2lnbmVkIGludCBmbGFncykNCj4gPiAJ
cmV0dXJuIGVycjsNCj4gPiB9DQo+ID4gDQo+ID4gK3N0YXRpYyB2b2lkIGlndF9kcm9wX2RldmNv
cmVkdW1wKGNvbnN0IGNoYXIgKmRyaXZlcikNCj4gPiArew0KPiA+ICsJY2hhciBzeXNmc3BhdGhb
UEFUSF9NQVhdOw0KPiA+ICsJRElSICpkaXI7DQo+ID4gKwljaGFyICpkZXZjb3JlZHVtcDsNCj4g
PiArCUZJTEUgKmRhdGE7DQo+ID4gKwlzdHJ1Y3QgZGlyZW50ICplbnRyeTsNCj4gPiArCWludCBs
ZW4sIHJldDsNCj4gPiArDQo+ID4gKwlsZW4gPSBzbnByaW50ZihzeXNmc3BhdGgsIHNpemVvZihz
eXNmc3BhdGgpLA0KPiA+ICsJCSAgICAgICAiL3N5cy9idXMvcGNpL2RyaXZlcnMvJXMiLCBkcml2
ZXIpOw0KPiA+ICsNCj4gPiArCWlndF9hc3NlcnQobGVuIDwgc2l6ZW9mKHN5c2ZzcGF0aCkpOw0K
PiA+ICsNCj4gPiArCSAvKiBOb3QgYSBQQ0kgbW9kdWxlICovDQo+ID4gKwlpZiAoYWNjZXNzKHN5
c2ZzcGF0aCwgRl9PSykpDQo+ID4gKwkJcmV0dXJuOw0KPiA+ICsNCj4gPiArCWRldmNvcmVkdW1w
ID0gc3lzZnNwYXRoICsgbGVuOw0KPiA+ICsNCj4gPiArCWRpciA9IG9wZW5kaXIoc3lzZnNwYXRo
KTsNCj4gPiArCWlndF9hc3NlcnQoZGlyKTsNCj4gPiArDQo+ID4gKwl3aGlsZSAoKGVudHJ5ID0g
cmVhZGRpcihkaXIpKSAhPSBOVUxMKSB7DQo+ID4gKwkJaWYgKGVudHJ5LT5kX3R5cGUgIT0gRFRf
TE5LIHx8DQo+ID4gKwkJICAgIHN0cmNtcChlbnRyeS0+ZF9uYW1lLCAiLiIpID09IDAgfHwNCj4g
PiArCQkgICAgc3RyY21wKGVudHJ5LT5kX25hbWUsICIuLiIpID09IDApDQo+ID4gKwkJCWNvbnRp
bnVlOw0KPiA+ICsNCj4gPiArCQlyZXQgPSBzbnByaW50ZihkZXZjb3JlZHVtcCwgc2l6ZW9mKHN5
c2ZzcGF0aCkgLSBsZW4sDQo+ID4gKwkJCSAgICAgICAiLyVzL2RldmNvcmVkdW1wIiwgZW50cnkt
PmRfbmFtZSk7DQo+IA0KPiBJICB0aGluayB0aGlzIGNvdWxkIGJlIHNpbXBsaWZpZWQgYSBsaXR0
bGUgYml0IGZ1cnRoZXINCj4gDQo+IAkJcmV0ID0gc25wcmludGYoZGV2Y29yZWR1bXAsIHNpemVv
ZihzeXNmc3BhdGgpIC0gbGVuLA0KPiAJCQkgICAgICAgIi8lcy9kZXZjb3JlZHVtcC9kYXRhIiwg
ZW50cnktPmRfbmFtZSk7DQo+IAkJaWd0X2Fzc2VydChyZXQgPCBzaXplb2Yoc3lzZnNwYXRoKSAt
IGxlbik7DQo+IA0KPiAJCWRhdGEgPSBmb3BlbihzeXNmc3BhdGgsICJ3Iik7DQo+IAkJaWYgKGRh
dGEpIHsNCj4gCQkJaWd0X2luZm8oIlJlbW92aW5nIGRldmNvcmVkdW1wIGJlZm9yZSBtb2R1bGUg
dW5sb2FkOiAlc1xuIiwNCj4gCQkJCSBzeXNmc3BhdGgpOw0KPiANCj4gCQkJLyoNCj4gCQkJICog
V3JpdGUgYW55dGhpbmcgdG8gZGV2Y29yZWR1bXAvZGF0YSB0bw0KPiAJCQkgKiBmb3JjZSBpdHMg
ZGVsZXRpb24NCj4gCQkJICovDQo+IAkJCWZwcmludGYoZGF0YSwgIjFcbiIpOw0KPiAJCQlmY2xv
c2UoZGF0YSk7DQo+IAkJfQ0KPiANCj4gc28gaXQgZHJvcHMgdGhlIFRPQ1RPVSBvZiBhY2Nlc3Mo
KS9vcGVuKCkgYW5kIG1ha2UgaXQgc2hvcnRlci4NCj4gLi4uIGJ1dCB0b3RhbGx5IG9wdGlvbmFs
LiBBbmQgdW50ZXN0ZWQpLg0KPiANCj4gDQo+IFJldmlld2VkLWJ5OiBMdWNhcyBEZSBNYXJjaGkg
PGx1Y2FzLmRlbWFyY2hpQGludGVsLmNvbT4NCj4gDQo+IEx1Y2FzIERlIE1hcmNoaQ0KDQo=
