Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1CECC4332F
	for <intel-xe@archiver.kernel.org>; Fri, 10 Nov 2023 15:51:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 743F210E108;
	Fri, 10 Nov 2023 15:51:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84EC310E103
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Nov 2023 15:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699631490; x=1731167490;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=6JZXDuZUGHiPQLeqYfh322CfU4iV19hKSsGI9IHQj8Q=;
 b=UHG1VtvyGwsSE6PKZJox6fo7bsQEdch5gBS1NE3cCo9dkrnAB+xDCZYT
 Jq2+HN7m1LzowNyfDhrehur9XUAQsE9c24rhr6CoArRjYPWw0Fb+Fel82
 3zXg4SH20HrHWkLLApgWoUsj4Yghf9FI5WDw5QdaE98dhBuTvjYRtbGq4
 yBcZTqmMNxy71fH6l7MgR7P3cpf86R7tYWMjJlduhIPaOWhb7kaoaVTa+
 z396NXW29y9WKYV6SgX6c7HYBABRVPE9LAX8afjvxu9sAYEmNGSFWni1r
 9bgOkzAG1dboRUfUryoVLEHWt6Af9vpWiHroEawe64EpQBmTOSVvX9++g g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="476422897"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; d="scan'208";a="476422897"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2023 07:51:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="5081537"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Nov 2023 07:51:29 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 10 Nov 2023 07:51:29 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Fri, 10 Nov 2023 07:51:29 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Fri, 10 Nov 2023 07:51:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jguED4XM8+co56PtkDnfKYGXi7N/PCizZITNTrY5KQKOEUQYGBZ4q7jDmeJIBnIibYtCxoleG982c0p5VrIoHQ92uJC5qGVTSmiljrSg/0Bj196MWYQ/xSlmf+JPjQO5tnQRNpypj/v5EUbNZsFRYc7uNRWTJ6n5ImXOu7xv3o3cUxacRrcw8AxD4RJKJ8IfOoh4b4Pg7AygtvfOy23382RDtzOGmubNd34dFNI3MUSIujMT7cmC932+0OAb+13SjDvMhP9D1+sH4OIWGhZb0X69PkyHTVssse3bUFGjU0r50uAetDF8GYJuswp3Gx/2MaUQ1W4c8UnkSNSfv8lb6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6JZXDuZUGHiPQLeqYfh322CfU4iV19hKSsGI9IHQj8Q=;
 b=QKIGXF+J9pZWSo8hNktwXAANeeLqwiY68hPX09K26DBD36mdM2bFUjn5E4XvXrWJsCS+vH57xKsu3IbI60SP046R1t3EsXvx4TIPgR/p647gIT9jWGb+/Ds9lI4zB0W9FNRyRc4LKe5j6t4hYEk2xppfnXtuAGhHF9F5B3rwxb5yPXg6nVT8JyNuEz+6zoVm8zAuygP3/qy9zaw+HJnM3Lz5bTG9tt/QwngJx+TduU5L6ozQAc5W88tfMgA09cydfhEo2e84j8/yY9Mid7PTdc3fXv7aLIlGe3qEqbLzaL/4jc7cLfBp7SlKGxDZ2BKYsdpDDyS6tJYofWUQXgkpww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by PH8PR11MB7093.namprd11.prod.outlook.com (2603:10b6:510:217::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Fri, 10 Nov
 2023 15:51:27 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::78d8:6f60:e1a1:7b15]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::78d8:6f60:e1a1:7b15%6]) with mapi id 15.20.6977.020; Fri, 10 Nov 2023
 15:51:27 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Dugast, Francois" <francois.dugast@intel.com>
Thread-Topic: [Intel-xe] [PATCH v1 1/7] drm/xe/uapi: Remove useless
 XE_QUERY_CONFIG_NUM_PARAM
Thread-Index: AQHaE+yGAyY8rCjMZ0GmjDSfc4PfQrBzs6uA
Date: Fri, 10 Nov 2023 15:51:27 +0000
Message-ID: <0a32993fdb0acebd35e0cff364649bf8a3cbcf34.camel@intel.com>
References: <20231110154156.6-1-francois.dugast@intel.com>
 <20231110154156.6-2-francois.dugast@intel.com>
In-Reply-To: <20231110154156.6-2-francois.dugast@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|PH8PR11MB7093:EE_
x-ms-office365-filtering-correlation-id: 523137c1-cc5f-4d48-7f90-08dbe204e622
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XoS3lGiMiWVL05Y4SFULEmjHoctWjyhJc0Dxrr4A/4yA75LkxVAQPAFcEbqk9gf5nXfPpf1EeTsdXLRmBSNDqJvRf+cBLUJkRiZjS/jRCSpvVh4va9X1HfiJETiZPu/vwHWYvtKi/rB5f8Oh78sKgWXCkMfk+yqAfPLJDH4AXUCvVeLsxDej8YabQxpxrX2exeTJl7YlPYrjvXtBqj2KjaRpdxGICuUlMchm12VWV20+2pweDhodITP1b6J4b5m5mt3huOqPCGN8VKP0gvtzL2uZZVBkfk7QvW2uGFU8eXD35nBGJNlE9XTmZvb/ZzTLB+NJfpKeOKa24AjO6Nc6f7gwTUJspm+fZvH/yFmU5eIQvJpL0u3ilw0N1tE7WBSaIzdGgUrfP5mWOY3wypOb4BVuW8dAfebPR25ddGTPGFh+Rx6fEckI84dxPRbPxVj3Ja+676rt1mjJ+Q9WSznkmB9+AskFnoBZ8eXqaxbuqARXFcAp8Gt4D0dUfkteSNp95Qau4wrku7YYkGPb8h/UjzaNr5Z5VkWkb1X7yJQkVqhw7v0sJ2pyI4G3fhrU6/x9+sdj4FUHRCLu6OLKZN44hVGGlPAhvb2NXUBIKyGERCu8socOBZc92TW0vFgfWuvR
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(366004)(136003)(346002)(39860400002)(230922051799003)(1800799009)(64100799003)(186009)(451199024)(478600001)(41300700001)(6512007)(2616005)(6506007)(6486002)(71200400001)(83380400001)(66446008)(8676002)(64756008)(66946007)(8936002)(110136005)(316002)(66476007)(5660300002)(6636002)(66556008)(76116006)(91956017)(26005)(4001150100001)(38100700002)(2906002)(122000001)(86362001)(82960400001)(36756003)(38070700009);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U09qSDFhNk1VRFNib3BuY3NPZWdsTXFNVDNrQWZESEZ3MVFiSGsyT3ZGQVBK?=
 =?utf-8?B?UDRGWkxOeHhEZEtMRGt4dUhPMzFVZ3dDLytGbitCOTJGVHd4ZG5qRGJ2aTZr?=
 =?utf-8?B?NHQxSWpUZjA1S1Q0MmozTExPZzN6Ym40d1NWQWdVUFBZN1lrbHBRVkgxeWg0?=
 =?utf-8?B?VTg2Si9oVWlnR0I0citFZVM2WEs1dmsxVjJiWXQwU2hDL2o1QnRucnZpa2ph?=
 =?utf-8?B?YXpkcElEelZDKzJsQXZnRFI4azJVN0N0NEJkdVNrMHV6bGo3SVYwZnFabHA3?=
 =?utf-8?B?R0xxOVFiakN6OFlsdXRMdUNYbnBDRE9uZEpIQisvQjIvd3hueFFDdmpVb3Uz?=
 =?utf-8?B?WHgrUzhhUWJSZ3F3NUJ1Y0tLS3FwNmlvL3N1c29pY3NpYzlhQ3VJanIwZ2JC?=
 =?utf-8?B?bjBaamk2cDdLWGVjK3VsNno5QmNUQlphUS9yTkpnakpWNlB3MGF0MUx5Q3lk?=
 =?utf-8?B?VVZWVnJETWdGNDlDOVBnRWtYUCtpc1pBVStVNktNREUxcURKc280VDdpbmFL?=
 =?utf-8?B?b2VYbXNEbm03dkwrT3ZBN1Y3ZGV1cDVBemUzbWhhWTJrYXJNYTJwZjBOYm1S?=
 =?utf-8?B?VGNRWS9adVdlYXJwMytRVXYwUmpwTGlZSXBrbHpwMWtFOWpTZUV6RDVTN0hH?=
 =?utf-8?B?Z3RpZGFVWTZzU1ozWU1PbFBZVUZ0NDNhbCtjNVNJNjdkSXBHQ2lMVVJ4Z1Zt?=
 =?utf-8?B?Tks0enFwOVh0NkMySThjZ2NJSCtqMG9BQzhPVHA4ZHdRQit1VERlano3SGJ1?=
 =?utf-8?B?andLeFhGeVFMWVBmbXJWSDVrUHlyaFdPV1IxekttSjgxZGxnR0dmRTNzdTFj?=
 =?utf-8?B?blNQa3FNbVN0QUxrTEgrdHhqRnRXNEcwaUpMQjQzR3RpVkpjSEZ5ckVzVE4z?=
 =?utf-8?B?aFN4NkZwM0tkL05DYzNhTVduZmRjNitOc3RIbG0rdkpzdUxSWE5xV0pNWmls?=
 =?utf-8?B?NlJsdFgwSEVZWS85dkJzRkF5U2JvKzh1SVFreUdNL1p5MENSdDk3Sy9ncEh6?=
 =?utf-8?B?Z0VsSGMxWjk1d0dPcDRQem01RlRROUtxdDRaYzY5RHRjdWVFcTRubEVsUWQ0?=
 =?utf-8?B?MTdPL3dZNExGRDV0NUx3VnlnOFoxclBxRTJ1TFNmM2Fxd3NBV05sa2F5M3Fl?=
 =?utf-8?B?VlV2MzZrN0UzNEdZaHVmWFUwWC9BVjFkSEo2YjZaTm9DOTdDaTNkTTU1dmZv?=
 =?utf-8?B?OFJuTy9XalFScDRlZ3psY0lqa3FDQ0M1bGEwamI1dmZxN01JWUNmZ0d2cFVa?=
 =?utf-8?B?Uk4wMTIvNlZUemtZN0NadnJvTXI3SGk2ZW5RYjBUbHYrYkhDN1hjNWhyajRU?=
 =?utf-8?B?bjIzdndQRkRKWmRJSUJPZEFFV3JrYWZ5enRLZ0hrSGJCcTRwa3c0V0hkclVZ?=
 =?utf-8?B?OVp1RzNKaTVySXovQmRUN0M0elB6bjlGMmUvNFVMVzk1ZHE5M01KZDhCUzBq?=
 =?utf-8?B?c3QyRk9JajN3TlBsM1NWTHM2Y2lzNzdZb1lvdXl6YlUycGdDUG4zS1JWU3NU?=
 =?utf-8?B?YzZzRzB3NnNRMUpacGU3cDNFT0hEcUVPeDBNbXJvUlY2UnVlaEIzOTZFUFRY?=
 =?utf-8?B?MzlpbmFxMzFYK1J6bU0wY3dpeThjdUFwbmZZMStkc0c5eFhEdjk3OExOSkVj?=
 =?utf-8?B?OVNwdE5KdTNxWjNzeW9LOFdYMjNRcVRRK3JQbXFJZzBJQkJidWxrQlBDUUpV?=
 =?utf-8?B?Rmt3MGt0eVMrRWdGWXNhYTBLSGdmeFpSU2ZoYS9TaHFNYmZRUDNWbUc0dGti?=
 =?utf-8?B?VWdTNFZHZXRaR3pRaHFTWFFnYzFQNnVuRVBCMmpqTGtoN1JRTGJPNkRiQzVP?=
 =?utf-8?B?c0xueEJWN0hWUHZzYXZsbm0veXpsaHJ0azZlRGEwVGY1WUp0UnpERXAzSm5F?=
 =?utf-8?B?bWh6OERjWjkrOWFNMkJXWWhjeFFMTDZkbjNuTWphTW92L2h0d2xMdnBMd0E3?=
 =?utf-8?B?TWtvSWRsVlRrd0hSQVd1RmF4NU9iTGJLdTdqREtBbWM0VmtidmsrVFVFbFdv?=
 =?utf-8?B?dDlBNXZERDVPZjFyWUxaVEQ3S0JSMXF2eFNKdVJMV1JCdFdEM2lzdGdwZm9H?=
 =?utf-8?B?RW4weEl4bDlidEpDd1NadWVuVmxWekhCU2daNFFNa2xqV21pZlB3eG80UEZt?=
 =?utf-8?B?YnZiNEJJakFWMlVOMTk3Q1FtYVA2ZDlIeHZtbUpwRldkZVdST1pqbVZld1Nt?=
 =?utf-8?B?VlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4D916A9CA6B5494A9AC9DB50A6BB19E3@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 523137c1-cc5f-4d48-7f90-08dbe204e622
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2023 15:51:27.1586 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SQECQd/V8LSx9tzzoVp7tqrW4Xxd40baZzaMbq+zHo7pJN1udS/ZJffxPgCM6nY3X0Ygxm59lJMW490Kyu+Hrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7093
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v1 1/7] drm/xe/uapi: Remove useless
 XE_QUERY_CONFIG_NUM_PARAM
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

T24gRnJpLCAyMDIzLTExLTEwIGF0IDE1OjQxICswMDAwLCBGcmFuY29pcyBEdWdhc3Qgd3JvdGU6
DQo+IG51bV9wYXJhbXMgY2FuIGJlIHVzZWQgdG8gcmV0cmlldmUgdGhlIHNpemUgb2YgdGhlIGlu
Zm8gYXJyYXkNCj4gZm9yIHRoZSBzcGVjaWZpYyB2ZXJzaW9uIG9mIHRoZSBrZXJuZWwgYmVpbmcg
dXNlZC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEZyYW5jb2lzIER1Z2FzdCA8ZnJhbmNvaXMuZHVn
YXN0QGludGVsLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfcXVlcnkuYyB8
IDEgKw0KPiAgaW5jbHVkZS91YXBpL2RybS94ZV9kcm0uaCAgICAgfCAxIC0NCj4gIDIgZmlsZXMg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0veGUveGVfcXVlcnkuYyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9x
dWVyeS5jDQo+IGluZGV4IDEwYjk4NzhlYzk1YS4uNmIxY2Q1YzY4YTk5IDEwMDY0NA0KPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0veGUveGVfcXVlcnkuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
eGUveGVfcXVlcnkuYw0KPiBAQCAtMzA1LDYgKzMwNSw3IEBAIHN0YXRpYyBpbnQgcXVlcnlfbWVt
b3J5X3VzYWdlKHN0cnVjdCB4ZV9kZXZpY2UgKnhlLA0KPiAgDQo+ICBzdGF0aWMgaW50IHF1ZXJ5
X2NvbmZpZyhzdHJ1Y3QgeGVfZGV2aWNlICp4ZSwgc3RydWN0IGRybV94ZV9kZXZpY2VfcXVlcnkg
KnF1ZXJ5KQ0KPiAgew0KPiArI2RlZmluZSBYRV9RVUVSWV9DT05GSUdfTlVNX1BBUkFNCShYRV9R
VUVSWV9DT05GSUdfTUFYX0VYRUNfUVVFVUVfUFJJT1JJVFkgKyAxKQ0KPiAgCXUzMiBudW1fcGFy
YW1zID0gWEVfUVVFUllfQ09ORklHX05VTV9QQVJBTTsNCg0KVGhlcmUgaXMgbm8gcmVhc29uIHRv
IGtlZXAgWEVfUVVFUllfQ09ORklHX05VTV9QQVJBTS4NCg0KY29uc3QgdTMyIG51bV9wYXJhbXMg
PSBYRV9RVUVSWV9DT05GSUdfTUFYX0VYRUNfUVVFVUVfUFJJT1JJVFkgKyAxOw0KDQpXaXRoIHRo
aXM6DQpSZXZpZXdlZC1ieTogSm9zw6kgUm9iZXJ0byBkZSBTb3V6YSA8am9zZS5zb3V6YUBpbnRl
bC5jb20+DQoNCj4gIAlzaXplX3Qgc2l6ZSA9DQo+ICAJCXNpemVvZihzdHJ1Y3QgZHJtX3hlX3F1
ZXJ5X2NvbmZpZykgKyBudW1fcGFyYW1zICogc2l6ZW9mKHU2NCk7DQo+IGRpZmYgLS1naXQgYS9p
bmNsdWRlL3VhcGkvZHJtL3hlX2RybS5oIGIvaW5jbHVkZS91YXBpL2RybS94ZV9kcm0uaA0KPiBp
bmRleCA5YmQ3MDkyYTdlYTQuLmI5YTY4ZjhiNjlmMyAxMDA2NDQNCj4gLS0tIGEvaW5jbHVkZS91
YXBpL2RybS94ZV9kcm0uaA0KPiArKysgYi9pbmNsdWRlL3VhcGkvZHJtL3hlX2RybS5oDQo+IEBA
IC0zMjksNyArMzI5LDYgQEAgc3RydWN0IGRybV94ZV9xdWVyeV9jb25maWcgew0KPiAgI2RlZmlu
ZSBYRV9RVUVSWV9DT05GSUdfR1RfQ09VTlQJCTQNCj4gICNkZWZpbmUgWEVfUVVFUllfQ09ORklH
X01FTV9SRUdJT05fQ09VTlQJNQ0KPiAgI2RlZmluZSBYRV9RVUVSWV9DT05GSUdfTUFYX0VYRUNf
UVVFVUVfUFJJT1JJVFkJNg0KPiAtI2RlZmluZSBYRV9RVUVSWV9DT05GSUdfTlVNX1BBUkFNCQko
WEVfUVVFUllfQ09ORklHX01BWF9FWEVDX1FVRVVFX1BSSU9SSVRZICsgMSkNCj4gIAkvKiogQGlu
Zm86IGFycmF5IG9mIGVsZW1lbnRzIGNvbnRhaW5pbmcgdGhlIGNvbmZpZyBpbmZvICovDQo+ICAJ
X191NjQgaW5mb1tdOw0KPiAgfTsNCg0K
