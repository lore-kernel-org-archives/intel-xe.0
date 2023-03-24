Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16EF4C6FD1C
	for <intel-xe@archiver.kernel.org>; Fri, 24 Mar 2023 15:38:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D933710E511;
	Fri, 24 Mar 2023 15:38:23 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6604B10E511
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Mar 2023 15:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679672301; x=1711208301;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=RibsrbaLtHPQ+Jy4/JCT1lVCJBmkdCztwLJWVGxb8Zc=;
 b=KZIudHSN0IBappTqvtj9lqs8agiX+22xcj2KNNY9KBmsAb5Qi1PMb2AV
 kaiTkokCplgFtrkI8HVRrvTDzHvXpzSoirc9l1mwDd+Fy8SwKaxyVy6lZ
 VaIFUtkqsLCDCvBxkATPaohEbzZNZyQwK2ozMxvaKsOb8+99RUgenl8g2
 HEmX+3sSJno98iu5feGyf6VseiSe6eJvzm1IUCavSRzQ1F+X7k4rMIVVJ
 iGPV6JN1Slyckugtj+OhYjX8mJTTobhB88ImEaKYpYs6xfM7zTCU/GbYp
 yENjyPvuOk+yrKjUWLJzZUCfKUKZ1y+HzyGlo5W1w5VIBTfQTOMvDijBz Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="328228780"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; d="scan'208";a="328228780"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2023 08:38:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="771933938"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; d="scan'208";a="771933938"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by FMSMGA003.fm.intel.com with ESMTP; 24 Mar 2023 08:38:10 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 24 Mar 2023 08:38:10 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 24 Mar 2023 08:38:09 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 24 Mar 2023 08:38:09 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 24 Mar 2023 08:38:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LRhjv8K8EQnpq7P+QPIp4GFSwBvUzSQE1D+ua3TpRezSWKoTBOssJLaxV09HrGz95xmMslH0LFoQ68BlRP7LYTPbeC3U8SnW0hRCH9nFLTt6Zw+Z3txiljkjgn4z7Ij+LO/t8CfrwtGS3lZC6OBeqJv7xI+pwvWsrCq8tXWYtLVVeTqRi0kzsOxRUPJCVOkZ3Q61ZMAHo8LL1jPVSq0VqBUv/cr5sSf9yRW1nZDetqhfyPQ8F8dnNt81be2Td4BCI0zbZb0QUyv6m5wrGa3SCBxNMV8xD83kjXcsAZmjxvTR5axnIcRpc28K2nrKLO9jh3dUy2WlpS1W9T6ziuFztQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RibsrbaLtHPQ+Jy4/JCT1lVCJBmkdCztwLJWVGxb8Zc=;
 b=WSRKd+fiNQXC62qVLqlLf5paQ1CIS52XxaTvOILFs83u5U+G/gRTonGOmsSVlk6AYQ4OlhGK47S9CWHKmz5zJlD6fXtNAhqcWBnwBWTOSxza+kYLp78jwhlozQVbdpuxv3HqST/anNc54JGEUb1Ftnn9WhEtDU/ByI4UbamR3650c9GWIAe/7U9THkohbW/Qq8U90IejsiLLySmjWUV+jTy4s0ISDWnwoJvNX/WDol/E7eMYEc+Ff3mYw3pu2DYLiCGJd9qPCbhk218UZvx32vYdhXAQB2KT3wcJ3X1Nlle+1V5PB5RTLYpUsWMx6ZZ7NxOkkvINfeTxpxvS3fFmcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY4PR11MB2054.namprd11.prod.outlook.com (2603:10b6:903:2d::9)
 by PH0PR11MB5190.namprd11.prod.outlook.com (2603:10b6:510:3c::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Fri, 24 Mar
 2023 15:38:08 +0000
Received: from CY4PR11MB2054.namprd11.prod.outlook.com
 ([fe80::ecb6:23da:cb6c:683b]) by CY4PR11MB2054.namprd11.prod.outlook.com
 ([fe80::ecb6:23da:cb6c:683b%10]) with mapi id 15.20.6178.038; Fri, 24 Mar
 2023 15:38:08 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost, 
 Matthew" <matthew.brost@intel.com>
Thread-Topic: [Intel-xe] [RFC PATCH v3 2/2] drm/xe/uapi: Add query engines uAPI
Thread-Index: AQHZXTNZ/Fi/ZnkWrUCcwLFnU8Lv968KEtgA
Date: Fri, 24 Mar 2023 15:38:07 +0000
Message-ID: <6ab82ea776173e3a3e6c0fc280c62770bb4ecffe.camel@intel.com>
References: <20230323025801.822678-1-matthew.brost@intel.com>
 <20230323025801.822678-3-matthew.brost@intel.com>
In-Reply-To: <20230323025801.822678-3-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY4PR11MB2054:EE_|PH0PR11MB5190:EE_
x-ms-office365-filtering-correlation-id: b350d1ed-2666-413f-8d2d-08db2c7dc45a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4sdyOLqJibTXhKdjPORnMU9dJ4HL6ljT0ltoaKEmv2cL4Cv5TtQVSs3o7HAW0s8KCB6M/OqAE/hiHCxRKnIbAW78EpKjbSd0iJuetdCB697k7BTT437CPKr8ReTrDMrYZ74oH0mjRMKxOLQhARnmuLvHhSS5gR/F5FCqqjJwNjNwm2B9MQqgJGcnTOGXUS6czeaifvtH6yEQoXUMF3RZgyLdgIRwVEMlCxYs9NowhikQm3XVFttVgAV0hl9Wj8jA7gTouQ0oopd82RmUv7oRLaUQ+Z75zmG7bq5US1GmbIGwD9DHTrfvD5Hk3k/7v5XBNrQxn8sv/xMEl6YZ61RP3OPLdvY7KFWAHdXvEwibIRePVnPBiHwFaDMV5PGXsZJeBPI+V5hzVc/I6pNpGT2BezhPOc6YRpwLsJdFz/NPvkjS9hv6jwAVRA/0EuzXMEbInU58o+cqquxfGbTcybQP25F7Qonjw4+rFjZkALX5GrJSIdJd+XDpUQ21AvyoTIJgzzYKXVpMwer/OElvH1qToVWVSw5wS4xaqqyN0FJ9hVQ2dycbCzxceg9yho6BRxCGbj5O1XefcEGZBf3e4YdR7CyduQQ2RIzLG9VSESjgW2RPBQudJXOT/EPAr2zSzhdwxpDkK3HbMvYqck9UtpOQ9+ZMMXG9C0aHWLfZp++mwGAyOkwJHucM6qafSSP7tVqsDCuYXfhvTJ8FrTPC3LIR4Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR11MB2054.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(39860400002)(376002)(346002)(396003)(136003)(451199018)(38070700005)(38100700002)(2906002)(478600001)(6486002)(71200400001)(8676002)(186003)(36756003)(2616005)(86362001)(110136005)(91956017)(66946007)(316002)(76116006)(6636002)(66446008)(66556008)(66476007)(64756008)(6512007)(26005)(6506007)(8936002)(122000001)(5660300002)(82960400001)(41300700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cDh5a0d5ZHRhWUlhQ29YVU5JRWx5dkVLK1RPcUREVTA4UUZlRmxueDFaMXZ4?=
 =?utf-8?B?MC9uTXJTU1hEVkdqOXdwK3JNUzJockthNUtFM25YQkF3NzdtNUI4S2xNR2dO?=
 =?utf-8?B?WlNwYmN3QVNIbGFteDJOOWc3eWVTWm52Y3R0ZHVqN3FORzZmVnBqRG5MRWlm?=
 =?utf-8?B?amJnS2ljL29uUDc1RGJ6bnJVRFk1SlF0cVVuYlVGTUZtc1dMOUpOREpoSkhJ?=
 =?utf-8?B?MVlub2N0VFVyU01leG82UWt3ZXl4ZjBPNjUrbHpLNlRIa3JqT2M5RmJWekVP?=
 =?utf-8?B?VGdhayt5VVlNdU9xRUxNRU5NWGZ5UnlrUTZUYUFOY3J2TWNPQXRmcnJiVkZj?=
 =?utf-8?B?UGtEUmc2dW5vKzg2NXZnMCsvWjhYZFBJRUgyck1DMUs4bXBzbS9pcE1FblYz?=
 =?utf-8?B?c01UZGEzbmhrTzAxNGNCazRsem9BZ2pZY3paZEI0YnBnN3JPbS9lWEZxVHh4?=
 =?utf-8?B?dlBRSmpwT2VEZVkxd01FWkNmd1QxckpKREtEZUxCclN6TU4zbC95OTRSMXFI?=
 =?utf-8?B?YjRzNGs3ZFpCTWswQ3Qwa2RLRThrMDJRZDZHVDRLQ1pTbHFJeDdIb0Q3MWJP?=
 =?utf-8?B?czk3V3hOUXhLQ2JBWlhuMm5UK3dtNGlVWkJDdnozTkhsMFRBOHlBT3JFb0tx?=
 =?utf-8?B?ZHNKQWNWTEJUdk5XMyt3OGU2Y0JrckR6RjNEemxDb0N6TkRwWnczeHVDYXpo?=
 =?utf-8?B?Q2QrQ200ZTVtaU5OU2ppbEVmVzd3U21ieWlrbHFlRHlidm5OUFYxdVhqK204?=
 =?utf-8?B?eUNvcmdxdmJ3WVh4R1JWWk80cEtkVFV3REJBUVlDQ0ttcUt5bmx2cWVzUUxJ?=
 =?utf-8?B?dDhtWlliUlkreFF5N2VVa0RJeUNpTVJ2VGdnOFNoUmlNR1ZRL0RtVWpJdC9V?=
 =?utf-8?B?L1h1dzE5emkrbEovNUxJTlpNNUZIVERoL3pINkMzL3BkMlRmbmkwNFE2WG1B?=
 =?utf-8?B?a01sSXRSMUNQUWwxYjVKeUNMQ1VjRVlSbDdCcDRtOCtUVEU5bVo2SVNyeHNP?=
 =?utf-8?B?dXdORW5jVlRMVSswQnBZb3ExNzlXSEN0cDZNS0lqOGRRVTFXcCs4TGxmbkE2?=
 =?utf-8?B?cDZUSUoya1VtRjM2Y1RwYVFncmJzeTdkUGdpM0xUbmhuS2MyanVlVlRzZE95?=
 =?utf-8?B?dC9kUjlvTkdsUVFZNXFXdjhEc0pzNXVzbC91TUpvZlpoampmQTlsU282T1hL?=
 =?utf-8?B?U0gxRk5xeCtBUXd4T21rZk42M3FSbnY3bU9CRVZNRzgvM2dpZjVzQThKTzdN?=
 =?utf-8?B?UVBNV2IvbVYvZk9aTmkvYnE2WTZzdWgyTjgxbDJCSkZCMEpzN3ZSaHpObVdV?=
 =?utf-8?B?Qldpc0RQOFBpbnBVd1VqUXJWanV6OHRJN2o3T1pzQzdONmdzNGEyb1ordm56?=
 =?utf-8?B?bTRrbXN5NmNubjB1elJVYUxNdytLZWNyY1Z6djVYTHBNQnczTUVDeHBQRnZC?=
 =?utf-8?B?aXNySWJzNk85Z0svenA3cjhrKzNidS9EWlBwV1lIdWU1dzZqTys4WWR0RTRG?=
 =?utf-8?B?eEZNTm9uQU5KSWx4UWVEbFNCby9BTGNJRzFMcnFJYjU4MEhCY0ZjYmt3M3Mx?=
 =?utf-8?B?RE9aS3RsOVBKVGsvRXo1T1psb01adUdEbXhoNmt2UU1wb2pTMzZpTGtFZEVU?=
 =?utf-8?B?aE5kRVRVbVQvaGwwaGtsYW9sN2JXbXd3Zk1qNDdWMVRzQ0NhSVNSYjVhYlk3?=
 =?utf-8?B?bnZrWlNFRDBRa2hld213N2lLdC9lZVA3T1VBUWpGMFRRVWFTMUxqVlUrRnp3?=
 =?utf-8?B?UzFZV3gxRVpZYXo3eXVyQ0E1SGpmYXpMdUwvT3BJd09RWEZnSVFMd2M3TDBH?=
 =?utf-8?B?TGhTV3VCM3hhbWJ4OXpHM1VJeFZId003Q2FadEFnOWVWS1k1MUFTeFRRbERo?=
 =?utf-8?B?UEtKU05aaHlqZlZacEowZWJwdGttcUJCRXd5UGNZVHMvSVRzMGZ4NFI4TW1Y?=
 =?utf-8?B?eFlaek1KeG51NzZMM1dyZFR5eDNzTXhndGJmVWJPeXpLMFZ5M29sYk9yQjJZ?=
 =?utf-8?B?L3Z0SEEvME5BcEdxMkJmeE42TmhaMjNCTmtEVDhkRHRsYytlUGEramYvanBS?=
 =?utf-8?B?RWl2R0F4a3BGWStUQ2k0ckVJTjh5UVBIMGhjYlEwZ3FxOWgvTi9yYnVNbC9a?=
 =?utf-8?B?WEw3ZjREQ2l1TnBWL0tCdzNQZjBralhBemVjMUMreTF3ZWpVNjN4UXp6ak8v?=
 =?utf-8?B?cUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EA59EE692BB9804F954AC178F8D9CB53@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR11MB2054.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b350d1ed-2666-413f-8d2d-08db2c7dc45a
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2023 15:38:07.9391 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NpBfwm26b8O5Ut8rG/PYuUqDHdNeUhgVp/ctJeh2QMyN90yNmT5MOCiibccC2p1z1bi4xmWqw2j+OUIdUTBEgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5190
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC PATCH v3 2/2] drm/xe/uapi: Add query engines
 uAPI
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

T24gV2VkLCAyMDIzLTAzLTIyIGF0IDE5OjU4IC0wNzAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOg0K
PiBOb3QgYWxsIGhhcmR3YXJlIGVuZ2luZXMgYXJlIGNyZWF0ZWQgZXF1YWxseSwgY2VydGFpbiBp
bnN0YW5jZSBoYXZlDQo+IHVuaXF1ZSBjYXBhYmlsaXRpZXMgb3IgcHJvcGVydGllcy4gSW50cm9k
dWNlIGEgdUFQSSB0byBxdWVyeSBmb3IgYm90aA0KPiBjYXBhYmlsaXRpZXMgYW5kIHByb3BlcnRp
ZXMuIFRoZSBjYXBhYmlsaXRpZXMgYXJlIHJlcHJlc2VudGVkIGJ5IGEgYml0DQo+IG1hc2sgd2hp
Y2ggaXMgdW5pcXVlIHRvIGVhY2ggY2xhc3MuIFRoZSBwcm9wZXJ0aWVzIGFyZSByZXByZXNlbnRl
ZCBieSBhDQo+IG5hbWUgYW5kIHZhbHVlIHJldHVybiBpbiBhbiBhcnJheSB0byB0aGUgdXNlci4N
Cj4gDQo+IHYzOiBzL3hlX2VuZ2luZS94ZV9od19lbmdpbmUNCj4gDQo+IFNpZ25lZC1vZmYtYnk6
IE1hdHRoZXcgQnJvc3QgPG1hdHRoZXcuYnJvc3RAaW50ZWwuY29tPg0KPiAtLS0NCj4gIGluY2x1
ZGUvdWFwaS9kcm0veGVfZHJtLmggfCA0MSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysNCj4gIDEgZmlsZSBjaGFuZ2VkLCA0MSBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZm
IC0tZ2l0IGEvaW5jbHVkZS91YXBpL2RybS94ZV9kcm0uaCBiL2luY2x1ZGUvdWFwaS9kcm0veGVf
ZHJtLmgNCj4gaW5kZXggODk1OTZkMzUzZDNlLi4yZjkzNmZlMmU0NTIgMTAwNjQ0DQo+IC0tLSBh
L2luY2x1ZGUvdWFwaS9kcm0veGVfZHJtLmgNCj4gKysrIGIvaW5jbHVkZS91YXBpL2RybS94ZV9k
cm0uaA0KPiBAQCAtMTE5LDYgKzExOSw3IEBAIHN0cnVjdCB4ZV91c2VyX2V4dGVuc2lvbiB7DQo+
ICAjZGVmaW5lIERSTV9YRV9XQUlUX1VTRVJfRkVOQ0UJCTB4MGINCj4gICNkZWZpbmUgRFJNX1hF
X1ZNX01BRFZJU0UJCTB4MGMNCj4gICNkZWZpbmUgRFJNX1hFX0VOR0lORV9HRVRfUFJPUEVSVFkJ
MHgwZA0KPiArI2RlZmluZSBEUk1fWEVfSFdfRU5HSU5FX1FVRVJZCQkweDBmDQoNCjB4MGUNCg0K
PiAgDQo+ICAvKiBNdXN0IGJlIGtlcHQgY29tcGFjdCAtLSBubyBob2xlcyAqLw0KPiAgI2RlZmlu
ZSBEUk1fSU9DVExfWEVfREVWSUNFX1FVRVJZCQlEUk1fSU9XUihEUk1fQ09NTUFORF9CQVNFICsg
RFJNX1hFX0RFVklDRV9RVUVSWSwgc3RydWN0IGRybV94ZV9kZXZpY2VfcXVlcnkpDQo+IEBAIC0x
MzUsNiArMTM2LDcgQEAgc3RydWN0IHhlX3VzZXJfZXh0ZW5zaW9uIHsNCj4gICNkZWZpbmUgRFJN
X0lPQ1RMX1hFX0VOR0lORV9TRVRfUFJPUEVSVFkJRFJNX0lPVyggRFJNX0NPTU1BTkRfQkFTRSAr
IERSTV9YRV9FTkdJTkVfU0VUX1BST1BFUlRZLCBzdHJ1Y3QgZHJtX3hlX2VuZ2luZV9zZXRfcHJv
cGVydHkpDQo+ICAjZGVmaW5lIERSTV9JT0NUTF9YRV9XQUlUX1VTRVJfRkVOQ0UJCURSTV9JT1dS
KERSTV9DT01NQU5EX0JBU0UgKyBEUk1fWEVfV0FJVF9VU0VSX0ZFTkNFLCBzdHJ1Y3QgZHJtX3hl
X3dhaXRfdXNlcl9mZW5jZSkNCj4gICNkZWZpbmUgRFJNX0lPQ1RMX1hFX1ZNX01BRFZJU0UJCQlE
Uk1fSU9XKCBEUk1fQ09NTUFORF9CQVNFICsgRFJNX1hFX1ZNX01BRFZJU0UsIHN0cnVjdCBkcm1f
eGVfdm1fbWFkdmlzZSkNCj4gKyNkZWZpbmUgRFJNX0lPQ1RMX1hFX0VOR0lORV9RVUVSWQkJRFJN
X0lPV1IoRFJNX0NPTU1BTkRfQkFTRSArIERSTV9YRV9IV19FTkdJTkVfUVVFUlksIHN0cnVjdCBk
cm1feGVfaHdfZW5naW5lX3F1ZXJ5KQ0KPiAgDQo+ICBzdHJ1Y3QgZHJtX3hlX2h3X2VuZ2luZV9j
bGFzc19pbnN0YW5jZSB7DQo+ICAJX191MTYgZW5naW5lX2NsYXNzOw0KPiBAQCAtMjUzLDYgKzI1
NSw0NSBAQCBzdHJ1Y3QgZHJtX3hlX2RldmljZV9xdWVyeSB7DQo+ICAJX191NjQgcmVzZXJ2ZWRb
Ml07DQo+ICB9Ow0KPiAgDQo+ICtzdHJ1Y3QgZHJtX3hlX2h3X2VuZ2luZV9xdWVyeV9wcm9wZXJ0
eSB7DQo+ICsJLyoqIEBuYW1lOiBuYW1lIG9mIHRoZSBwcm9wZXJ0eSAqLw0KPiArCV9fdTY0IG5h
bWU7DQoNCk5hbWUgYWN0dWFsbHkgd2lsbCBiZSBhIHByb3BlcnR5IGlkPyBNYXliZSBuYW1lIGl0
IHByb3BfaWQsIHByb3BlcnR5X2lkLCBpZD8NCldpbGwgdGhlIHRoZSBwcm9wZXJ0aWVzIGJlIGFk
ZGVkIGluIGltcGxlbWVudGF0aW9uIHBhdGNoPw0KDQpXaXRoIGEgcmVuYW1lIGFuZCB0aGUgcGFk
IHRoYXQgTWF0dGhldyBBdWxkIG1lbnRpb25lZCB0aGlzIGlzDQoNClJldmlld2VkLWJ5OiBKb3PD
qSBSb2JlcnRvIGRlIFNvdXphIDxqb3NlLnNvdXphQGludGVsLmNvbT4NCg0KPiArDQo+ICsJLyoq
IEB2YWx1ZTogdmFsdWUgcHJvcGVydHkgKi8NCj4gKwlfX3U2NCB2YWx1ZTsNCj4gKw0KPiArCS8q
KiBAcmVzZXJ2ZWQ6IHJlc2VydmVkICovDQo+ICsJX191NjQgcmVzZXJ2ZWRbMl07DQo+ICt9Ow0K
PiArDQo+ICtzdHJ1Y3QgZHJtX3hlX2h3X2VuZ2luZV9xdWVyeSB7DQo+ICsJLyoqIEBleHRlbnNp
b25zOiBwb2ludGVyIHRvIHRoZSBmaXJzdCBleHRlbnNpb24gc3RydWN0LCBpZiBhbnkgKi8NCj4g
KwlfX3U2NCBleHRlbnNpb25zOw0KPiArDQo+ICsJLyoqIEBlY2k6IGVuZ2luZSBjbGFzcyBpbnN0
YW5jZSB0byBxdWVyeSAqLw0KPiArCXN0cnVjdCBkcm1feGVfaHdfZW5naW5lX2NsYXNzX2luc3Rh
bmNlIGVjaTsNCj4gKw0KPiArCS8qKiBAY2FwYWJpbGl0aWVzOiBiaXQgbWFzayBvZiBjYXBhYmls
aXRpZXMsIHNwZWNpZmljIHRvIGVhY2ggY2xhc3MgKi8NCj4gKwlfX3U2NCBjYXBhYmlsaXRpZXM7
DQo+ICsNCj4gKwkvKioNCj4gKwkgKiBAc2l6ZTogU2l6ZSBvZiB0aGUgcXVlcmllZCBwcm9wZXJ0
aWVzLCBpZiB1c2VyIHBhc3NlcyBpbiB6ZXJvIHRoZSBLTUQNCj4gKwkgKiByZXR1cm5zIHRoZSBz
aXplIG9mIHRoZSBwcm9wZXJ0aWVzIGFycmF5LCBpZiB1c2VyIHBhc3NlcyBpbiB0aGUgc2l6ZQ0K
PiArCSAqIG9mIHRoZSBwcm9wZXJ0aWVzIGFycmF5IHRoZSBLTUQgY29waWVzIHRoZSBwcm9wZXJ0
aWVzIHRvIHRoZSB1c2VyDQo+ICsJICogcG9pbnRlci4NCj4gKwkgKi8NCj4gKwlfX3UzMiBzaXpl
Ow0KPiArDQo+ICsJLyoqDQo+ICsJICogQHByb3BlcnRpZXM6IHVzZXIgcG9pbnRlciB0byB3aGlj
aCBhbiBhcnJheSBvZiAgc3RydWN0DQo+ICsJICogZHJtX3hlX2h3X2VuZ2luZV9xdWVyeV9wcm9w
ZXJ0eSBhcmUgY29waWVkIHRvIGlmIHNpemUgaXMgbm9uLXplcm8NCj4gKwkgKi8NCj4gKwlfX3U2
NCBwcm9wZXJ0aWVzOw0KPiArDQo+ICsJLyoqIEByZXNlcnZlZDogcmVzZXJ2ZWQgKi8NCj4gKwlf
X3U2NCByZXNlcnZlZFsyXTsNCj4gK307DQo+ICsNCj4gIHN0cnVjdCBkcm1feGVfZ2VtX2NyZWF0
ZSB7DQo+ICAJLyoqIEBleHRlbnNpb25zOiBQb2ludGVyIHRvIHRoZSBmaXJzdCBleHRlbnNpb24g
c3RydWN0LCBpZiBhbnkgKi8NCj4gIAlfX3U2NCBleHRlbnNpb25zOw0KDQo=
