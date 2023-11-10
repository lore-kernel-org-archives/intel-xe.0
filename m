Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AA9FC4167B
	for <intel-xe@archiver.kernel.org>; Fri, 10 Nov 2023 11:56:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8FA910E0E6;
	Fri, 10 Nov 2023 11:56:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B07A10E0E6
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Nov 2023 11:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699617407; x=1731153407;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=iufs0sQJJ7c9CF5s79os7gLzRQ4vO8v8FTsz0rbQG/o=;
 b=jtSyoAlFQhlUCojd4e6B4s4qP/ntKnA4McjgjAVL+YOKMLkXUmuVbmEp
 vQkrWh5Y0u/t6ch5JD2FMvfc0EojOZQemjoLZr/tDLK2EG+NBek2GOxCa
 LrWkbp37/dI9G/0xKr7kHt2dX7L9LvDz4FySLR5QwHQBwoV51pydHcAwH
 hilLk3GjHkJN0rbNzYYbt8qNgzqrF7hq2R9RtnRtsWLIHgaqIcAkeFw6v
 yyfm6oDJRm7BF97KmJ95nGpldN6BPNE/ZK0aRnti1Jt8ydDN3nL3+2iH7
 hcSYqIuVC5P6Qcay7Ko1aETl+3MSh4a56x6yJWdyI2PI9Yf6Ra3MCd4ij w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="389034425"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; d="scan'208";a="389034425"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2023 03:56:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="798597886"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; d="scan'208";a="798597886"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Nov 2023 03:56:46 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 10 Nov 2023 03:56:46 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Fri, 10 Nov 2023 03:56:46 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Fri, 10 Nov 2023 03:56:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NjAJI6A0bk3diA+HF+k//Mwk6RblT+5Vbb4OcUbdrggeboOa6oBWK0jpHsgMSfIKN5l27xJSTtEmyAZqOInO78JgAsO1eLhMnPjYTK3XswVfrfg2RLPgUQQ4Yl19xrXqzWI59ZUHKzbNQEsq1uyE5kiPIF0HrO+oeiHmJLVrk0gvjjSiqcx85ckCA9hiqBhDDl27t9FTpPR19xfgxE5iWdHOaGoWO1qaI/rMftrPVLoSGeNg/jgrP9kwJDZTdye1VoDerfT+tJQa1smEy+HNwvrAV+nsUxf+3ci0+DnPQ9mbQ7kDa6KPt8WCGX6hS/VthqlDpW2LBfrilnGPRiZqRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iufs0sQJJ7c9CF5s79os7gLzRQ4vO8v8FTsz0rbQG/o=;
 b=SvCdWiN+yIxJ3xMwhhISzRduD1/2ptxLTlvrgNBAHIWsIVr6cfOoQ0f4z8Xa39PuGfxic9rU1jSKBCUxVIMlXbPZZd8zVmXE1yTTMQ8ll8wemBXycb38/khRBYcdjBtXifDuRIBVHKuMJjt9ny6MEINhLWJH9v6TYERMfjYo5FAeeOIaakeO7UXCkWNSdCirpI/Cidc9ZP5NbEZJcuN+qEkVAaZPh5UuYrsxxxbonSfC5nLcaRYnUiJaXxpJuZID/bHamvWpMqcFzjAs/M5VmaRCP/1ChMCpMZv3MXNGZ3Ur0zT4Xw+SA7NIFSD6RAy5sN3Av2WKbzZwj5QbKOa3pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 MW6PR11MB8337.namprd11.prod.outlook.com (2603:10b6:303:248::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Fri, 10 Nov
 2023 11:56:44 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::ea97:f0a2:fffc:b892]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::ea97:f0a2:fffc:b892%3]) with mapi id 15.20.6954.029; Fri, 10 Nov 2023
 11:56:44 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>
Thread-Topic: [6/9] FIXME drm/i915/display: add_dma_resv_fences is i915 only
Thread-Index: AQHaE8z52cUK+4BHyUqZ4HGNl6naSA==
Date: Fri, 10 Nov 2023 11:56:44 +0000
Message-ID: <155162cd479420e3a5fdfa1e80acc1a002a8316b.camel@intel.com>
References: <20231109150759.44549-7-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20231109150759.44549-7-maarten.lankhorst@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|MW6PR11MB8337:EE_
x-ms-office365-filtering-correlation-id: d653b9fc-8751-4993-510d-08dbe1e41c19
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9bf9qbq4uBtdxUOK1Y+dn3ripQeRArVhP+f1zkbeDUu5u+lbLsWO+qG8w5mRBRPDHNSNDQCeM9jQvGiMYQ3wg/KAAGd9onMW9ssq4miMsQXaZkejMwpQEr7wD7enyvsuGcj/6gfZde85dXmIZ0G74Qpvl4MlbT9JUQmJaYuYULvSYl0GfMpytFIZYOIxUv4PwjxWXadFwTkVUalYkCHPdGkWoGoNuZirEbBJSlGiOUDBNd+XzTRbJ8cWTceU2dfMg9K7p0meAIGpxyLOZ6ckWB9aD8ue2d++V5SUovX6QB6oSTUNS9LCfaigxnOAinavDOrtkEyiQRpT7VI4qm+gUVL/VtE1NRSXXMD1u6eh+iT6SodGuq/vnkkCqSMrDC8MIHpwiL7knoiOMcTxZr+o+EohM93bIIRzqhCC9i/oVOMktVj7kzaTjHMSVY1jZ+aNwI2Vj1iK9H09taCwazDgW0TMlNWEd7XIYl/P24S8mmb2t101UL5dQo0Kne0yOHM/Yb9sbujcdM1T6JHALzc8uHTql/2gevXDQ1WCwdnp33pB+kt9UGBy3ww9vt2PnSZmK4ccwGAC5kzC6pqaez5nq8qvX0eOC9CpTklM5IJ7gbHnwU8Da98VCAi7KZQmJrux
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(39860400002)(346002)(136003)(376002)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(66556008)(6486002)(26005)(71200400001)(2616005)(83380400001)(66574015)(5660300002)(8936002)(2906002)(66446008)(38100700002)(4326008)(41300700001)(8676002)(316002)(76116006)(110136005)(66476007)(6506007)(66946007)(91956017)(6512007)(64756008)(478600001)(36756003)(86362001)(82960400001)(38070700009)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q0JYd0xKbnFDUDlYaCtORkppRDVQWiswcUFBbytQNVpVSnpzU3NaSFNudE5v?=
 =?utf-8?B?QWZNSDNDY3pGNkhSK1Uxa2JXeExLZWZIWUc2Mm5qU3JCVWRQUnRDU1plRDBX?=
 =?utf-8?B?ZUpRKzFlWmhWVWIxN28wOHZTRDE1OVdKYVloc3N1dzgwVW9aZml2eTdJMTRO?=
 =?utf-8?B?SVhXZUlwM3p3dXJhWnRPVXVwSmxDVzFEeFpjaVY5N21POWQ2Z1BOR3A1aVFz?=
 =?utf-8?B?OTZ4OHNHQ3BMenVySUE0dENraDFpMldlbFg0WitqRit6Q1pPSlpERk04Mitr?=
 =?utf-8?B?RXdWOS9valczdll6b1BPTzJPSVlMSUlOQWV3bHdQOVlXRHYvYWF6MU9LalBR?=
 =?utf-8?B?VmJYeWlERnlVbWt3ZlJMU1p6NjBpZlRBRFFUa2lmUFdxd3ZTajBYZjNPQTJT?=
 =?utf-8?B?ZThnWEx6SFl2V2wxbElQRGFtb3hVT1lJaldmaFNXNkNnTjB5dE41R1VoVHRZ?=
 =?utf-8?B?b1NTYll4QlEvelFPcDY5ais3SVZ0dW0yS2FBaEpLVFJGZ0N3VExpckJoMmhZ?=
 =?utf-8?B?SFlpQmpQNGlqL2daaVhNUnJ4dEFlS3BIRXhleHdFM21IaHljNVNFalBnR2tQ?=
 =?utf-8?B?N1ZYMDIvenhqZDR5ZjZtRllyUXBLdUtLOW52ZmRRRUY4ZEh2VU15aVlJODZn?=
 =?utf-8?B?K2JuNnFoZWJWNHdoc0xQUVlIeTZia0JYUkF0ZldoOVZFbjJoM0ZhMnNlT0dT?=
 =?utf-8?B?eDRiYmRUbk1mNUhKSFNuYldGcWZoUHBxQkE4UEhnTkpTZFYyaDBCa2l0bFNa?=
 =?utf-8?B?MVRTUG1UZDZuNU4ybmpRc1A2YisvMVV0cVBWcmJOOTdibXQ4bGZlenExdVJx?=
 =?utf-8?B?RFUweDVsUTZodDQrTGxuTjR3ZGJ1S0Y3V1JHQXNCV0lOYUZzMm94Z3cxWVRB?=
 =?utf-8?B?RG1zY1IrakVySFd0cU9tRGV0TUl4OTlxbTAzNEJNK3kzM1QzQllQa3Z5N3Nz?=
 =?utf-8?B?cE5CWVNBeEFORElIamxXZ0VNc1Y2RHRFSm1PZXhzMVpMNHlWY2VmdWlKdVpp?=
 =?utf-8?B?QUkweUVONkRDaEgxdWRTblVuV0M3M0hhQXhPZzF0bVowR1BaVGJFMlVnTlEy?=
 =?utf-8?B?a09wRFlDeWF4WWM1aVBSc0lHWUVPUmdjelZzbjREclowTE5yeStmeWJPTXpU?=
 =?utf-8?B?bkx0Zk1wTmtkNUdxWkdmcldFWWt6RVIxTE1OYWxBV3BZME5MMkUyOGxLT1My?=
 =?utf-8?B?LzMzdW1Hd21aSlJFMEg0NzFMR29PSnBJZXN6Nk00c1YyRkxYSUJuei9SVm45?=
 =?utf-8?B?VGMyTW15WjhZenBQNVd6UmpnY0VyUXo5WXBSVVB1UEtLeFJrU0tXRkhqQWdC?=
 =?utf-8?B?U1cwRzVmL1FtVXRUaHpUL29vTC9FN1Q0MkM3K0ZuSWdMaEJxSXAxcTVPbmxK?=
 =?utf-8?B?bjlNcVBUR1IwNmtHTlFZTkRkazJCOHVqOXJFeStiUFhxOG1sTFVwOHlaWnYz?=
 =?utf-8?B?ZC8zNXN1blREWW1UdDNuMUdKWGpJT1YvMi9mNEdBQjB2SythZytRME52SE1o?=
 =?utf-8?B?RlhOeUIxeGUzaVphWUpqeklLbVRrd3dlQk1WMDFYalEzWUJrWVFQZHhIbWpq?=
 =?utf-8?B?N3AvdmFoQVk5M294NUVIS1E5ZVVEWkd5aFlNVmIyMTNCekxFdVRTM2ZzMXhv?=
 =?utf-8?B?WEZTRFduSWRoQ1hyazBCcjVqSW1FSG5aZnZyVTJiK25KZU5paEZuQVNheDJK?=
 =?utf-8?B?VXhvcE5hZ1hkSHNiRHdFSmdKWktFa2lJQzYzbDJqMGc1d3BSNDNIeDZoQ0Fn?=
 =?utf-8?B?NmZLcTg5ekpyUXdYMWlNdW5qUU1KVDMvTURQSTNCMW1IczNXRE1rb0dnUWlm?=
 =?utf-8?B?TFk3NmRVOHI3cmFSa2t6VFBWTk1Gc2FabUpZVk0rdGpmVm9WK20wdHJFT1oz?=
 =?utf-8?B?cUVzelRuTW9pMU1PbzJHemRpY0YxZ05UcUczendIRlBRdWJXTFFZUXVzQ2xa?=
 =?utf-8?B?SmZlSTJUNy9PZWxvdkJvTkNLTGdUclFPaXNqUnJuN2xnT0pJOCszYXVYeFJ2?=
 =?utf-8?B?NFF0aXFqVTFSUTFncnNWaFZmd3BsTTMxQkdzYmNCcksvc0ozZzdMZGJjK0FC?=
 =?utf-8?B?bEFpZXZ6NWpMZ2xQbkNudWcyR3QxMWFla2Z1S0tKWVZVMW5oVEpJVjFibXds?=
 =?utf-8?B?RUNNWVA3Si9VMVFhNFBaa2RrWU9LY2U2b0JBM3Mxb0RyVndrY1ZUSGpZY3pZ?=
 =?utf-8?B?N2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DEB08F21F81D39428AF8D391D5CE3EE3@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d653b9fc-8751-4993-510d-08dbe1e41c19
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2023 11:56:44.2669 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5lLkd1nfvNc/Xs8j3H2t4ZkfL9N7rvmclmOPculXAx11tOt+slu2zWAsMMjwqCHGXQ8C3ZyGpTHoSB41Jh9REs2xW5F7MSAOspDN08FWsyQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8337
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [6/9] FIXME drm/i915/display: add_dma_resv_fences is
 i915 only
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
Cc: "dev@lankhorst.se" <dev@lankhorst.se>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDIzLTExLTA5IGF0IDE2OjA3ICswMTAwLCBNYWFydGVuIExhbmtob3JzdCB3cm90
ZToNCj4gRnJvbTogTWFhcnRlbiBMYW5raG9yc3QgPGRldkBsYW5raG9yc3Quc2U+DQo+IA0KPiBJ
J20gOTklIHN1cmUgdGhhdCB0aGlzIGNvZGUgaXMgbm8gbG9uZ2VyIG5lZWRlZCBvbiBpOTE1LCBi
dXQgSSdtIDEwMCUNCj4gc3VyZSBpdCB3b24ndCBiZSBuZWVkZWQgZm9yIHhlLg0KDQpBbmQgaXQg
ZG9lcyBub3RoaW5nIGZvciBYZSAtPiBpZmRlZnMgYWRkZWQgYnkgdGhpcyBwYXRjaCBhcmUganVz
dA0Kb3B0aW1pemF0aW9uIHRvIG5vdCBidWlsZCB0aGlzIHBhcnQgZm9yIFhlLg0KDQpUaGlzIGlz
bid0IGJsb2NraW5nIGFueSBYZSB3b3JrIHNvIGlmIHlvdSB0aGluayB0aGlzIGlzbid0IG5lZWRl
ZCBmb3INCmk5MTUgSSB0aGluayB5b3Ugc2hvdWxkIHNlbmQgdGhlIHBhdGNoIHRvDQppbnRlbC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnLiBEbyB0aGUgcmV2aWV3IGFuZCBDSSB0ZXN0aW5nIHRo
ZXJlIGFuZA0KdGhlbiBiYWNrcG9ydC4NCg0KQlIsDQoNCkpvdW5pIEjDtmdhbmRlcg0KDQo+IA0K
PiBTaWduZWQtb2ZmLWJ5OiBNYWFydGVuIExhbmtob3JzdCA8ZGV2QGxhbmtob3JzdC5zZT4NCj4g
LS0tDQo+IMKgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9hdG9taWNfcGxhbmUu
YyB8IDQgKysrLQ0KPiDCoDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRp
b24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2lu
dGVsX2F0b21pY19wbGFuZS5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRl
bF9hdG9taWNfcGxhbmUuYw0KPiBpbmRleCBlZjU1MzI3MGMwNzk2Li5hNWVlNGFmMjU4MzZmIDEw
MDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2F0b21pY19w
bGFuZS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfYXRvbWlj
X3BsYW5lLmMNCj4gQEAgLTEwMjEsOSArMTAyMSwxMCBAQCBpbnQgaW50ZWxfcGxhbmVfY2hlY2tf
c3JjX2Nvb3JkaW5hdGVzKHN0cnVjdA0KPiBpbnRlbF9wbGFuZV9zdGF0ZSAqcGxhbmVfc3RhdGUp
DQo+IMKgc3RhdGljIGludCBhZGRfZG1hX3Jlc3ZfZmVuY2VzKHN0cnVjdCBkbWFfcmVzdiAqcmVz
diwNCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHN0cnVjdCBkcm1fcGxhbmVfc3RhdGUNCj4gKm5ld19wbGFuZV9zdGF0ZSkNCj4g
wqB7DQo+ICvCoMKgwqDCoMKgwqDCoGludCByZXQgPSAwOw0KPiArI2lmZGVmIEk5MTUNCj4gwqDC
oMKgwqDCoMKgwqDCoHN0cnVjdCBkbWFfZmVuY2UgKmZlbmNlID0gZG1hX2ZlbmNlX2dldChuZXdf
cGxhbmVfc3RhdGUtDQo+ID5mZW5jZSk7DQo+IMKgwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgZG1hX2Zl
bmNlICpuZXc7DQo+IC3CoMKgwqDCoMKgwqDCoGludCByZXQ7DQo+IMKgDQo+IMKgwqDCoMKgwqDC
oMKgwqByZXQgPSBkbWFfcmVzdl9nZXRfc2luZ2xldG9uKHJlc3YsIGRtYV9yZXN2X3VzYWdlX3J3
KGZhbHNlKSwNCj4gJm5ldyk7DQo+IMKgwqDCoMKgwqDCoMKgwqBpZiAocmV0KQ0KPiBAQCAtMTA1
MCw2ICsxMDUxLDcgQEAgc3RhdGljIGludCBhZGRfZG1hX3Jlc3ZfZmVuY2VzKHN0cnVjdCBkbWFf
cmVzdg0KPiAqcmVzdiwNCj4gwqANCj4gwqBlcnJvcjoNCj4gwqDCoMKgwqDCoMKgwqDCoGRtYV9m
ZW5jZV9wdXQoZmVuY2UpOw0KPiArI2VuZGlmDQo+IMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gcmV0
Ow0KPiDCoH0NCj4gwqANCg0K
