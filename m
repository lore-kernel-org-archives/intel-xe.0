Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EF77C6FD1C
	for <intel-xe@archiver.kernel.org>; Wed, 22 Mar 2023 16:18:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 662DD10E3C3;
	Wed, 22 Mar 2023 16:18:39 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E137410E3C3
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Mar 2023 16:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679501917; x=1711037917;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=sp/gyZ5zJNo9H3/Rv2LyBtxRUJyfp+c0U6zdTc15CrY=;
 b=djX6sugL5miYzuMVh39+lqvrPqWg0K9cRN1kb6NBMSr6F+uGd6TxvpYX
 YVJJrlyrSfjmKaqUvHe6CRgrsG7oy5cSh5ni1fBNHg8+Q3ye+0JaBydo1
 aH4iwNdirMyljeWN5sUwwlWMq0pFk5geljEUvMAlAUwuI1Lpng6HMqodz
 gHX+PrWwg946K2ChO4N6D2zCOMMAqsxOLAnvk4O2IAX0FGJfeDrqGvLi1
 nKpz/Y9ppIYYQ149HSGMZBGBjzCTuILytVUuwfh+VvnYExrRep2Q0TQQH
 bp7bmnzzqjJ9kn1TI4ziTTwMqFqdAw3DPRapVECvuBitwbbqGrzI0tPjU A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="323104881"
X-IronPort-AV: E=Sophos;i="5.98,282,1673942400"; d="scan'208";a="323104881"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 09:18:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="927884297"
X-IronPort-AV: E=Sophos;i="5.98,282,1673942400"; d="scan'208";a="927884297"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga006.fm.intel.com with ESMTP; 22 Mar 2023 09:18:36 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 22 Mar 2023 09:18:36 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 22 Mar 2023 09:18:36 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.104)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 22 Mar 2023 09:18:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EUdhIiszmQ0BJpOBN/TqgrYAL8xhjdOxYv7Hq209Q5R/5dVHgRaKMSlQOMH508UI35CW5KW6dCzQtR+uP8tjWL1swzN6tiezXeHX74jPJuZZows9pDQXtC9ZDTgsk2I/cTYa4XDdWuiqkspRL+jpe/YUai1Lxix9Mw46BoDxZPwbLr0zvPZWYNiEEIp56CctSdSAdbANZyadDygoGoSx/TA0nlkpouE1pfgzR/yp4d6VeHkg3HZS/33FXVNPuYj6gSaxl66/vDN0tLG/zRr8nIVwCliRUjC/I+NBTi46SL35byFLSs/ULYfWR62EJcgcAj14Lc38Elvk6eaUjkF7nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sp/gyZ5zJNo9H3/Rv2LyBtxRUJyfp+c0U6zdTc15CrY=;
 b=NBFrCqbBwvgvtNFcAPbmSAIMLA7HiB3yQ+OdU+LjRAIxl0sF7q8aL21lJQvn4iWGiFIUdJyTI1Yd0gdfwKgHN+cAoUz5NRq8tZDIyrfxImk1AZsE84d2+n/HKaMnXQHhzEQe1QesqMcTIlnZ5QGKsy7MR//BV9OKg33fLc2L0G3lcZnyiZlH1Pj9wRQxwDPpwIJv4ziJWZisuRHa33wTYmNuFhuo07QI4Q41LSdSzICGjGcUsaMGuUYqfvihdE4ICSW4P0/Lg0K9yjfX9IVL+TLlNCOz+ZBJM54/WIM9vXnjNMKjWWtzB9pEnRViPFg88Nj0CtlJjeOS2asSWYzUnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY4PR11MB2054.namprd11.prod.outlook.com (2603:10b6:903:2d::9)
 by DM4PR11MB5536.namprd11.prod.outlook.com (2603:10b6:5:39b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 16:18:34 +0000
Received: from CY4PR11MB2054.namprd11.prod.outlook.com
 ([fe80::ecb6:23da:cb6c:683b]) by CY4PR11MB2054.namprd11.prod.outlook.com
 ([fe80::ecb6:23da:cb6c:683b%10]) with mapi id 15.20.6178.037; Wed, 22 Mar
 2023 16:18:34 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost, 
 Matthew" <matthew.brost@intel.com>
Thread-Topic: [Intel-xe] [RFC PATCH 1/1] drm/xe/uapi: Add query engines uAPI
Thread-Index: AQHZXGbsAjQA9H08+0qQM9pldiqpl68G+xMA
Date: Wed, 22 Mar 2023 16:18:33 +0000
Message-ID: <105d0e79d27c445b99a2ef04193f36e7c66f9d42.camel@intel.com>
References: <20230322023450.797598-1-matthew.brost@intel.com>
 <20230322023450.797598-2-matthew.brost@intel.com>
In-Reply-To: <20230322023450.797598-2-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY4PR11MB2054:EE_|DM4PR11MB5536:EE_
x-ms-office365-filtering-correlation-id: 61db2e83-2e67-4087-60ca-08db2af11575
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nanGQuncScNdr9iq7f6YDUVq78u/pDGArRl9dku4BUBWoThBw3DM5zI6q3fFtAZk85C+2Xxa9l4Z5GU56/+PDsgYJLI5nbWdsGd9wr9tP+7bAKbrnnUW7SCRINp/PAVhqAorIRrw4OjSXzt9lZMzR77CdoxOucN86HadIpQw45rv5YM67mJdQRe/nXp2bwSU/dioLY7f/3N4uzdYRG8M49/r+keUlvMIbDBBxzPFwsT8pzPbm8u8qb/PdtVf8do8IPl5nHrB4b5RjoJG+sgZscmhL557MNjsRyBnIJNK4sChyn2FXVPBXL2OnDNkjayiqkyDH3xZ3/TVSLQmOjEIA/8PGMjCPgP4zXK/yeGc10L6dA45gCNMJvUGsxs/BBAcqMxgfgtKIj/R+XogUEa86PkRhTTgyjub3ruLUcndziXWSIRxfyg0ik24kHn8U3zfdZy3bYLzUPwN91k2CeEQCOyxzb4ZOj6yw5+l0blQV2UKMqYu/CiO5Rm6CRh1h06vDb8TthGSv65U75RLSCLmsGCspledG/YWF6d59zvNJuXe/nBNmMvl1R+Ef7//Dsn7BHLFpEQws74Zrcc8IRx9792c5+YKt8/J5zhmcuBigonC75yBryeFH7iSUEsNyImZBX5UT5BVKdahsg5FbFPJpACA3jlDIqpChZdm8Z/fUq/ARKuSi/44Bed62P9anQVneDqc11afhSmHjY7TrFWmMw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR11MB2054.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(376002)(366004)(136003)(39860400002)(346002)(451199018)(6636002)(2616005)(316002)(478600001)(26005)(71200400001)(38070700005)(5660300002)(6512007)(6486002)(110136005)(186003)(2906002)(6506007)(41300700001)(122000001)(38100700002)(86362001)(8936002)(76116006)(82960400001)(66446008)(91956017)(64756008)(66476007)(8676002)(66556008)(66946007)(36756003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TlRTenNETVBndDhPWFFMMVRjejhhSkt4RnIwZ2VEdjA3ZUtFMXRlNFk4Wlp0?=
 =?utf-8?B?RzIyc1N0VlRycDU1Z2Q2eVBzMkhmcUJqU0MyQlQxYXVLc1lOMEY3cTZSbEdu?=
 =?utf-8?B?NUg0ZXVJZVdPam94bmRQWW1hUFQ5Q240WFBxTU9hY2l6TjNpaG1WZHdqc3NL?=
 =?utf-8?B?aTlmMzYwNjJUR3NvNFN0MEZmcTlydzV6eTZ6U0NDRlhrakRCZmRmcnJuaVJI?=
 =?utf-8?B?ZERDUjV0anIwK3p6UmU4eWRLRlhuVExlK2JxRVltVUZINGJ2c2RUQ2FnNjEr?=
 =?utf-8?B?QXBYczRidlFVRmNpQkJWSUtTM2NsYU5uS3RrTGZkQUtwTjdoUWZoMlRMc0pZ?=
 =?utf-8?B?NEhHQ05ZaS9qcUpiWlFqYXhTYkVHMCt0ZWVWNHFYTlhpREpiT3ozZ0pJbUV2?=
 =?utf-8?B?NVcyV3E3QXpBK1laWmhTenhpaHNaR2N1NDZYc2txZmthV2JDL3JEUzZHZUdU?=
 =?utf-8?B?ejgzN1Z6MXljK3BPaUsxSUZlNDZ3UkRPRUE0V2g4Q2t4QTRMaDRIcFg1bktV?=
 =?utf-8?B?NEF1ZjZSdmU4NjNlcU5VUDlBMlBZZG5rQTBwUFZsY0pRSXFneFlNbUdzUDRh?=
 =?utf-8?B?MVdiSlVSYlV1NEp0OG1Ga21mbXdJaVc1cWhSUFZtYU1McjZlMzRaMU9CTXhz?=
 =?utf-8?B?dE5PMnhrU0krMjZUZFVwclZPWEplT21ZMHFHdlpFUFNmUG40MnlJRWJ0MHRm?=
 =?utf-8?B?dGNyWndBR0tkcmpDTlV5WVF4RlpsaXc3VllFVTQ5TSsvbVZWZnR0bjFFMnQv?=
 =?utf-8?B?VldvU0Fnb09Hc0V6R2ZaaGdnZDd4Zk1hMUFvczFESFpvazAwTWl3ZXV3NXd0?=
 =?utf-8?B?NGdkSGRrWHhKU3JJTjdmbGNwUDgzUEpsOVpFM1pvQm8rVGJqY3ZqSUVUNUFR?=
 =?utf-8?B?enpGUlczNU92dUtyenpVaUovUWxhTGdHQ2MwUjI3dHJGQ3grWnJSdW1IZ04z?=
 =?utf-8?B?RnU1L0VoNVpBeWFxeUtQazhWMTV1blV2WVlKdEtlZEs5c1RtN2RGT0NCMm1X?=
 =?utf-8?B?NmYxVEtBUVRITzlYazlXV1oxMUIyemMrVFIxUVBGTFBjakhoMHF5eThzQXN4?=
 =?utf-8?B?ak14Sml2azByM2p1ekgvOFVTY0J3OWh1N2xIN3RyZnN6bTJNT0kyUnZKSFQ3?=
 =?utf-8?B?YWo5TkFocUtTWS9hbGJNN3oxMzRLYUJoaEVOSFpSZzV4RWduVjhLZzRuK0xK?=
 =?utf-8?B?enE4eEJNMHdTbnovWE5OTllkSTBkVzk0bUtMWXdrM2RFRzYzcUJRUml1b2Fa?=
 =?utf-8?B?enVtYlc1QTU4a29MMG5BcHQzV1JyUnlpaUdGcE5hV0tWdlZlMGpmS0JiV1V6?=
 =?utf-8?B?NUZCVDlUcDZzNFJKSDZWSEVBQW5CT1V2NHRYVzNqeVJzN1ZKUE1JTm9ZdUhV?=
 =?utf-8?B?VXVXNWdsaTk3UXNLbkU1aC9WME45OXFjMjJ2QlVCV1piNzdlSkRCcEVSeVN5?=
 =?utf-8?B?azkxV1pLUGpDc25aU1BkUjFENzJpTFBwMWQ0Sm1ITEVvSzVTZ2dCQ29za1Fy?=
 =?utf-8?B?WFBZK2JxV3pYRjF2aEt1RHh4NTkvMjVXL09TMWNOT0V6eEZ0SXA0b0MweUox?=
 =?utf-8?B?azRPaGlmaTZNaVoyQXdvTGNXMlAzbzVDdWMvVFRXQjRqT2VFaTJYT3VuN2xz?=
 =?utf-8?B?NDE2Rk85NGdCS0NDOHFodUphcEFRN1FwSmtRSUo3c1Fwcm9RRExVTkZOZ0h0?=
 =?utf-8?B?bzkvZktlakVkajFYWHpOc0NFa1A3Z3g5RkJWKytHTU5yQ01TQzdhV3BoVmpI?=
 =?utf-8?B?bG1VU0RiNGd2Vmcvd1JNTnl4b0l2RG9SVzdBNWNsclFQNm11WXBhT3V5MjZs?=
 =?utf-8?B?SGNqR2FNYjNhZ0xzMERhZGNLWGY4Q3Q2UFJZcURyVnNGemtsRzdva1VxRUJx?=
 =?utf-8?B?ODcwRUVaakFwOUo4b2dPdVYwYWo1UFZ2aXVPQTdKdk0zYXlFMkNkV1ZVeE5n?=
 =?utf-8?B?U0hLa3BYUlRab3QvUVh3N1p4U055eTJvUlFZb3pKZytzaXdoSG45L21KVSs2?=
 =?utf-8?B?TW9jQWZqdU1ZSStTRGRuMHRmUHdpVGNOeDZvaENCaWh6clJTSzRLaXlKVGpM?=
 =?utf-8?B?ckdsYStqTUFLY0llLy9mcVJuTXBrOCt3TVRqb3p6MjhTc3VMTFo3QnV5ZHRE?=
 =?utf-8?B?QXlUQWlGVmhNSXVtYkN3QktPakpvazNIUTIrRTlEeVlNQ3Z6UVEzYlVrbDNz?=
 =?utf-8?B?QkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6FB76618B66C4C449A0CF84AF1A18ABD@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR11MB2054.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61db2e83-2e67-4087-60ca-08db2af11575
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Mar 2023 16:18:33.8399 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pYdaJ0tH2B1DRk9xUMOOZ3XbXwrXcGQIbvxVy2rqNWwpT7ijRJ9OFrjqMhtiVwyGcmpsRbUo9e0BS5C/LCFiww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5536
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC PATCH 1/1] drm/xe/uapi: Add query engines uAPI
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

T24gVHVlLCAyMDIzLTAzLTIxIGF0IDE5OjM0IC0wNzAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOg0K
PiBOb3QgYWxsIGhhcmR3YXJlIGVuZ2luZXMgYXJlIGNyZWF0ZWQgZXF1YWxseSwgY2VydGFpbiBp
bnN0YW5jZSBoYXZlDQo+IHVuaXF1ZSBjYXBhYmlsaXRpZXMgb3IgcHJvcGVydGllcy4gSW50cm9k
dWNlIGEgdUFQSSB0byBxdWVyeSBmb3IgYm90aA0KPiBjYXBhYmlsaXRpZXMgYW5kIHByb3BlcnRp
ZXMuIFRoZSBjYXBhYmlsaXRpZXMgYXJlIHJlcHJlc2VudGVkIGJ5IGEgYml0DQo+IG1hc2sgd2hp
Y2ggaXMgdW5pcXVlIHRvIGVhY2ggY2xhc3MuIFRoZSBwcm9wZXJ0aWVzIGFyZSByZXByZXNlbnRl
ZCBieSBhDQo+IG5hbWUgYW5kIHZhbHVlIHJldHVybiBpbiBhbiBhcnJheSB0byB0aGUgdXNlci4N
Cg0KV2hlbiByZS1zZW5kaW5nIHRoZSBzYW1lIHBhdGNoIHNlcmllcyB3aXRoIGZpeGVzLCBwbGVh
c2UgaW5jbHVkZSAidlgiIGluIHRoZSBzdWJqZWN0IHdlIGtub3cgd2hhdCBpcyB0aGUgbGF0ZXN0
IHZlcnNpb24gdG8gcmV2aWV3Lg0KDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBNYXR0aGV3IEJyb3N0
IDxtYXR0aGV3LmJyb3N0QGludGVsLmNvbT4NCj4gLS0tDQo+ICBpbmNsdWRlL3VhcGkvZHJtL3hl
X2RybS5oIHwgNDQgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ICAx
IGZpbGUgY2hhbmdlZCwgNDQgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2luY2x1
ZGUvdWFwaS9kcm0veGVfZHJtLmggYi9pbmNsdWRlL3VhcGkvZHJtL3hlX2RybS5oDQo+IGluZGV4
IDY2MWQ3OTI5MjEwYy4uNTU3YzlhZTZmMzY0IDEwMDY0NA0KPiAtLS0gYS9pbmNsdWRlL3VhcGkv
ZHJtL3hlX2RybS5oDQo+ICsrKyBiL2luY2x1ZGUvdWFwaS9kcm0veGVfZHJtLmgNCj4gQEAgLTEx
OSw2ICsxMTksNyBAQCBzdHJ1Y3QgeGVfdXNlcl9leHRlbnNpb24gew0KPiAgI2RlZmluZSBEUk1f
WEVfV0FJVF9VU0VSX0ZFTkNFCQkweDBiDQo+ICAjZGVmaW5lIERSTV9YRV9WTV9NQURWSVNFCQkw
eDBjDQo+ICAjZGVmaW5lIERSTV9YRV9FTkdJTkVfR0VUX1BST1BFUlRZCTB4MGQNCj4gKyNkZWZp
bmUgRFJNX1hFX0VOR0lORV9RVUVSWQkJMHgwZg0KDQpzLzB4MGYvMHgwZQ0KDQpUbyBhdm9pZCBj
b25mdXNpb24gd2l0aCBEUk1fWEVfRU5HSU5FX0dFVF9QUk9QRVJUWSwgd291bGQgYmUgYmV0dGVy
IHRvIG5hbWUgdGhpcyBhbmQgcmVsYXRlZCBzdHVmZiBhcyBEUk1fWEVfRU5HSU5FX0NMQVNTX1FV
RVJZLg0KDQo+ICANCj4gIC8qIE11c3QgYmUga2VwdCBjb21wYWN0IC0tIG5vIGhvbGVzICovDQo+
ICAjZGVmaW5lIERSTV9JT0NUTF9YRV9ERVZJQ0VfUVVFUlkJCURSTV9JT1dSKERSTV9DT01NQU5E
X0JBU0UgKyBEUk1fWEVfREVWSUNFX1FVRVJZLCBzdHJ1Y3QgZHJtX3hlX2RldmljZV9xdWVyeSkN
Cj4gQEAgLTEzNSw2ICsxMzYsNyBAQCBzdHJ1Y3QgeGVfdXNlcl9leHRlbnNpb24gew0KPiAgI2Rl
ZmluZSBEUk1fSU9DVExfWEVfRU5HSU5FX1NFVF9QUk9QRVJUWQlEUk1fSU9XKCBEUk1fQ09NTUFO
RF9CQVNFICsgRFJNX1hFX0VOR0lORV9TRVRfUFJPUEVSVFksIHN0cnVjdCBkcm1feGVfZW5naW5l
X3NldF9wcm9wZXJ0eSkNCj4gICNkZWZpbmUgRFJNX0lPQ1RMX1hFX1dBSVRfVVNFUl9GRU5DRQkJ
RFJNX0lPV1IoRFJNX0NPTU1BTkRfQkFTRSArIERSTV9YRV9XQUlUX1VTRVJfRkVOQ0UsIHN0cnVj
dCBkcm1feGVfd2FpdF91c2VyX2ZlbmNlKQ0KPiAgI2RlZmluZSBEUk1fSU9DVExfWEVfVk1fTUFE
VklTRQkJCURSTV9JT1coIERSTV9DT01NQU5EX0JBU0UgKyBEUk1fWEVfVk1fTUFEVklTRSwgc3Ry
dWN0IGRybV94ZV92bV9tYWR2aXNlKQ0KPiArI2RlZmluZSBEUk1fSU9DVExfWEVfRU5HSU5FX1FV
RVJZCQlEUk1fSU9XUihEUk1fQ09NTUFORF9CQVNFICsgRFJNX1hFX0VOR0lORV9RVUVSWSwgc3Ry
dWN0IGRybV94ZV9lbmdpbmVfcXVlcnkpDQoNCg0KDQo+ICANCj4gIHN0cnVjdCBkcm1feGVfZW5n
aW5lX2NsYXNzX2luc3RhbmNlIHsNCj4gIAlfX3UxNiBlbmdpbmVfY2xhc3M7DQo+IEBAIC0yNTMs
NiArMjU1LDQ4IEBAIHN0cnVjdCBkcm1feGVfZGV2aWNlX3F1ZXJ5IHsNCj4gIAlfX3U2NCByZXNl
cnZlZFsyXTsNCj4gIH07DQo+ICANCj4gK3N0cnVjdCBkcm1feGVfZW5naW5lX3F1ZXJ5X3Byb3Bl
cnR5IHsNCj4gKwkvKiogQHByb3BlcnR5OiBwb2ludGVyIHRvIHRoZSBmaXJzdCBwcm9wZXJ0eSBz
dHJ1Y3QsIGlmIGFueSAqLw0KPiArCV9fdTY0IHByb3BlcnR5Ow0KPiArDQo+ICsJLyoqIEBuYW1l
OiBuYW1lIG9mIHRoZSBwcm9wZXJ0eSAqLw0KPiArCV9fdTY0IG5hbWU7DQo+ICsNCj4gKwkvKiog
QHZhbHVlOiB2YWx1ZSBwcm9wZXJ0eSAqLw0KPiArCV9fdTY0IHZhbHVlOw0KPiArDQo+ICsJLyoq
IEByZXNlcnZlZDogcmVzZXJ2ZWQgKi8NCj4gKwlfX3U2NCByZXNlcnZlZFsyXTsNCj4gK307DQo+
ICsNCj4gK3N0cnVjdCBkcm1feGVfZW5naW5lX3F1ZXJ5IHsNCj4gKwkvKiogQGV4dGVuc2lvbnM6
IHBvaW50ZXIgdG8gdGhlIGZpcnN0IGV4dGVuc2lvbiBzdHJ1Y3QsIGlmIGFueSAqLw0KPiArCV9f
dTY0IGV4dGVuc2lvbnM7DQo+ICsNCj4gKwkvKiogQGVjaTogZW5naW5lIGNsYXNzIGluc3RhbmNl
IHRvIHF1ZXJ5ICovDQo+ICsJc3RydWN0IGRybV94ZV9lbmdpbmVfY2xhc3NfaW5zdGFuY2UgZWNp
Ow0KPiArDQo+ICsJLyoqIEBjYXBhYmlsaXRpZXM6IGJpdCBtYXNrIG9mIGNhcGFiaWxpdGllcywg
c3BlY2lmaWMgdG8gZWFjaCBjbGFzcyAqLw0KPiArCV9fdTY0IGNhcGFiaWxpdGllczsNCj4gKw0K
PiArCS8qKg0KPiArCSAqIEBzaXplOiBTaXplIG9mIHRoZSBxdWVyaWVkIHByb3BlcnRpZXMsIGlm
IHVzZXIgcGFzc2VzIGluIHplcm8gdGhlIEtNRA0KPiArCSAqIHJldHVybnMgdGhlIHNpemUgb2Yg
dGhlIHByb3BlcnRpZXMgYXJyYXksIGlmIHVzZXIgcGFzc2VzIGluIHRoZSBzaXplDQo+ICsJICog
b2YgdGhlIHByb3BlcnRpZXMgYXJyYXkgdGhlIEtNRCBjb3BpZXMgdGhlIHByb3BlcnRpZXMgdG8g
dGhlIHVzZXINCj4gKwkgKiBwb2ludGVyLg0KPiArCSAqLw0KPiArCV9fdTMyIHNpemU7DQo+ICsN
Cj4gKwkvKioNCj4gKwkgKiBAcHJvcGVydGllczogdXNlciBwb2ludGVyIHRvIHdoaWNoIGFuIGFy
cmF5IG9mICBzdHJ1Y3QNCj4gKwkgKiBkcm1feGVfZW5naW5lX3F1ZXJ5X3Byb3BlcnR5IGFyZSBj
b3BpZWQgdG8gaWYgc2l6ZSBpcyBub24temVybw0KPiArCSAqLw0KPiArCV9fdTY0IHByb3BlcnRp
ZXM7DQo+ICsNCj4gKwkvKiogQHJlc2VydmVkOiByZXNlcnZlZCAqLw0KPiArCV9fdTY0IHJlc2Vy
dmVkWzJdOw0KPiArfTsNCj4gKw0KPiAgc3RydWN0IGRybV94ZV9nZW1fY3JlYXRlIHsNCj4gIAkv
KiogQGV4dGVuc2lvbnM6IFBvaW50ZXIgdG8gdGhlIGZpcnN0IGV4dGVuc2lvbiBzdHJ1Y3QsIGlm
IGFueSAqLw0KPiAgCV9fdTY0IGV4dGVuc2lvbnM7DQoNCg==
