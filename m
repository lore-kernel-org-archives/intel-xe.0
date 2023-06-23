Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 591B6EB64DD
	for <intel-xe@archiver.kernel.org>; Fri, 23 Jun 2023 22:55:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF6D710E013;
	Fri, 23 Jun 2023 22:55:34 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 909AE10E013
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Jun 2023 22:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687560933; x=1719096933;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=VZa0rb2IMP16IuYZ23Xu4qLe9EN/MUf6R9oxpCwg8Lg=;
 b=lopC1PZr4JNHs46Ymh7UInMuMmXGkP5NNKB79YimqY/SbxLp5ttDBAPo
 kGuGRTRTuhS+Q25MMosR+26SjgWM78pmSyuGoD3bMgnVqxNWW19Zdwtse
 3JZp+PtWWREaJ8MgUIB4kUVhrGe8OLUgwik4+JWRNrCWCBeG0j4Q5F8Q9
 wJqQBF29+3mH8c+Ye9+L4z5PXJqsvdH/448gN9CzNSUXhx5xrtGM2B9LS
 bz0TVXNUFFQbPdqb7CIKzmyXVpKGjO1GjQESbjTg7EdQ1Bu37s9i2IjXo
 H3bcdhNMgCaUNuaxmT2GIh4ylPa3qtWfiW7ZkqmijJcc8DaRFZP5Ky30H Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10750"; a="345634570"
X-IronPort-AV: E=Sophos;i="6.01,153,1684825200"; d="scan'208";a="345634570"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2023 15:55:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10750"; a="889624372"
X-IronPort-AV: E=Sophos;i="6.01,153,1684825200"; d="scan'208";a="889624372"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga005.jf.intel.com with ESMTP; 23 Jun 2023 15:55:32 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 23 Jun 2023 15:55:31 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 23 Jun 2023 15:55:31 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.42) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 23 Jun 2023 15:55:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O5xCzN+qM6REamREvIO0yYJBh0PSnqph1V4oIFTyzD0StqjDMtigwF+URj6wuxsUKKFEtJUlynEEesTRxrC07LS1eI4xu+xga+8PRbMkFl94eIWcaSOaZ2CRu0VsLvo8Wv5X/fvOOZ4VxGW0Knyy6jOzjFiA3KJQ8HB53yFu03A+KbQMidyKlOdFK5Dk52wKyWBkS7ObDVyorfOA575wt2/6PejW5aavW278MSq+fsVgjXykDa5VGEEPOjoLHw2VUo1ROw+nwUOVWZ+nWECWX5C5TCfyFN8Q6AodyOlxbZWBLXgZnZ0vL2iMNTRzRHHmphL1VxHvkpsWtHH3wQJRiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VZa0rb2IMP16IuYZ23Xu4qLe9EN/MUf6R9oxpCwg8Lg=;
 b=dtFqTB7DhYFsdoZjk/5mTHBJbKxU+UFo5adu/rtFBbwtCoA/mmoUJta2pzbAHCa4qfkTE/l6Kx7NqhpEriFAuyckidhbBnzcZTKwqvgUb0w5pBCqUo3sSgTAUf3u89D9/9HQ8KTtOWFuZ5YvceQ3qtjE6VfMhyqLJzfcayYb7BL5c+6uXgQKfuJwiRZdMbpEOa+xV+yY/ZZ8131g5HoomJXiyEzxIKa5w3yqUH2V5PYgmfuFQBEO7GeZHaMJ2ohL+phpm09KTunq8s1zPj+hiPQWjqkdmDW7qDpGMdYeWr22ulAQFvKjhbhTPoU8JhjAXA+C5sRYWF91NbnTAVm7aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by DS0PR11MB7529.namprd11.prod.outlook.com (2603:10b6:8:141::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Fri, 23 Jun
 2023 22:55:30 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::5cab:9ad8:a5ad:6e0]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::5cab:9ad8:a5ad:6e0%7]) with mapi id 15.20.6521.026; Fri, 23 Jun 2023
 22:55:30 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Auld, 
 Matthew" <matthew.auld@intel.com>
Thread-Topic: [PATCH v6 1/6] drm/xe/bo: consider bo->flags in xe_bo_migrate()
Thread-Index: AQHZop1aza1rwNsfPUK5dPeIxFUiK6+ZBmGA
Date: Fri, 23 Jun 2023 22:55:29 +0000
Message-ID: <97f3334db86a25c3b1fb387198e966dd2007d518.camel@intel.com>
References: <20230619110018.53538-8-matthew.auld@intel.com>
 <20230619110018.53538-9-matthew.auld@intel.com>
In-Reply-To: <20230619110018.53538-9-matthew.auld@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|DS0PR11MB7529:EE_
x-ms-office365-filtering-correlation-id: 77cf1b91-1524-4563-87d5-08db743cf153
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: D0R1GkKwqP9SXdlJWOnGMpMYq4/v2Ww82wFXNV6bLQ93y7bB+taCXhyA/a80o+gK9KVoH6WEEJVQ3i8YTpfijWqGxeMFkTMtQLEn6vnshP7ZxtPsnLAuScbQjkrEp2L0IrtZ1lAWLkHqRi8YjE1TdWlLVLMs15BHTXB9JAuwqrf4yrlAbRFeHI0U6BOenPJexM3/yFT/E5e1p1DLBFLjQbEQlBQMlBPEIVr/YluXh0HTrsnRn+Cz6BFJUClXcRZNoZUu+d/pI4iR4Yg3+o8SdXOnUNx68wqc/Xv9Iv/HEPoJPJlz+Sm5/pcU7DOt6gKAfG+RlM0+Aq7HxqJtk+7kt9M755qHUkObpiB0ffgEPh8Bwn7r+H7CvciIsL5uakWXu2W+g864CuM9CJgU69GVpKNaNKdxL/fC/g0uODCRCQfR6aoVMHnikC8DUiAnlqmteC0b0QGyXj5IHphO0RD+sOyiWCqTWGO8DDdYmiGMAKsBwruep4XEPs8DKzhIQ8aQXYVsLV0F+RHwv4n402AtmctGMzF1GJuLDyu5KMBwTWOasLFEmLuU1Nys9n2DcPbFxvwY4wbHRFEzGykR6+L46jA9t9CzlpE7ixu6VOG9Pa1GgDjP36BfOPKHVqRh2Srk
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(346002)(376002)(39860400002)(366004)(136003)(451199021)(38070700005)(66574015)(6636002)(83380400001)(4326008)(2616005)(316002)(66446008)(86362001)(36756003)(5660300002)(6486002)(71200400001)(478600001)(6512007)(8936002)(8676002)(66476007)(41300700001)(186003)(82960400001)(66556008)(122000001)(2906002)(38100700002)(6506007)(26005)(91956017)(76116006)(64756008)(66946007)(110136005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UW8wSzFZZmVxaVhNZFl3M3U4Wmg3Z1pPemdQYkZ5aUJkS3pwbjZ4Q3lvc09z?=
 =?utf-8?B?Uit6ay9xNGFWSU9yTTlTaytURVZnTEJ4Rlo0bzE2QjJLV2pzWldiOC85ZkVx?=
 =?utf-8?B?Q0thMnBNOGRYR2N0NHRUeWlRSGdlVFJaWjc4SEtheVZmR3dUNXIzQmFzWkhM?=
 =?utf-8?B?S1VxeDBvY3RVc3Q4elZhbDN2N3FTM1RQYWpTOWpKdDdZZGErZzA0MnNiVHlV?=
 =?utf-8?B?QmtpTGlZTGVEZHRPL1N5cDljbXEwY3RvVjVkZ2RYTjJidEUyci9WNERiMk1X?=
 =?utf-8?B?VVRmRW5KVmlkNXdzODRMK2QvTWdZU0V4VDgvOThIOGNERFphTGtRQStjbWhH?=
 =?utf-8?B?cTVDMW51R2VLTThCa0ZjMWNYaW1BdkVMV0dEcHNWYjI5U2llZ0J4TUd4WDQw?=
 =?utf-8?B?Ym1XU1VOV1VqcXp3eW56WlRVeVVMcXhpeDJsanBNMUxLYU9zYmNVd0pyWFpo?=
 =?utf-8?B?VGR4d2NTQnZ1SGRvZ3VpUkhJVENaSnFwV0FYSDdtdWw3elFMWURvYjRhRDUv?=
 =?utf-8?B?QnZsTng5aFQvb2RFOE1CMkF6bWxpTGZQR2IvbFM5cWNPWTFuUm9XTVBURy9k?=
 =?utf-8?B?QkIxclNQSldleW5VN3I5OHpuU095Z1REeStIT0Rmazhvd0F5VlFrK0FpelIx?=
 =?utf-8?B?U1NnUGx1Z0Q5aDhnbWh6NlJVNjlQQThEc0M5cGtsdlFUQTVrS1lOeVFiTklr?=
 =?utf-8?B?cGhIWXlGampBTS9FZ2VJNm94UlNsLzN2UEprbUJxVGVzdC9IamJ6clIxN09i?=
 =?utf-8?B?YVllZEVDUWU3N3l3Mk1lRll4UWxDK1pJeE53VlhMT1dQOVE0Q0hoSG9vZHpX?=
 =?utf-8?B?QVgrdUl6S2NVZ0hiN2N1a3dpZTZvUXhYR3ByOHZzUE05MFc3NVZ3dURkT2U5?=
 =?utf-8?B?cU1tSHpXS2poTjc5WkN5TFpJMDRFY1E2Q2NJRjJXc3lsL1YyeXhNZDhIRkds?=
 =?utf-8?B?Tm9IczhlcDBVcTBzb3pZNjBvV21TWEp5Q3NOaEpjY3RMakdKOGcxaHBxYzZO?=
 =?utf-8?B?Q2JJSzlLeXBQNFNkL0V0V1NhZGo4bEFRanQ1UmhLMGg3RG9KQ2o1d1RCTjlq?=
 =?utf-8?B?NVlGZzh5Mm5lYmVFZVNsMVVJTWV6T1hIVFFXSnFKQ0F3SVBFREovWnZwVVdK?=
 =?utf-8?B?MnZ3OW5oSWpqNDh1UnFMU3N1clVtY0hyUnZ3eFNkaUxVZ1JMMG00MWZCZWNL?=
 =?utf-8?B?VDk3YTk2U3RuN2NLbm4zT05vNUFZQnFKS3UvYjNiOExqTnl3WEJXSURLelV0?=
 =?utf-8?B?dlFYajEyVVlHT0VMUGlCeGlWRlI3dXVKd0paR1l3TFIxR21PVmtORDZaci83?=
 =?utf-8?B?NTdPQ3pxWUZQT09rNFdvVVF4d0FjSGNNT08yTDEzVC9RTlMvcllpV2hjYU9U?=
 =?utf-8?B?UW43VVpVTkdGVDVNWEt3bFRuVlRKY2I0amVENk8yUkUxd0ZudU1zdmZoOHg0?=
 =?utf-8?B?eTB3TXhwT3k2eWVlbkYrVnVLN2lHZlZxcGxzNUJmQ0h3N29sYzdzMENiSURP?=
 =?utf-8?B?Y2pibW16Qlo2UGdhelc1UmRRazcvVFprUk9iWU91VjRKSG1jOXBrWTNzK09n?=
 =?utf-8?B?QkZQdkZYdFA1NVZZanRQVTZVR05sam1EdzFzSTVnNlBDZ2YwclhiU3JYMGJW?=
 =?utf-8?B?MlEvYUdyM1J1VUxqNVpZcnJSdGlkOHJuaXl5TzJzaWgzMG5lSFRPMGVoQ3c4?=
 =?utf-8?B?THFodTczaUc3S1VQKzcwa2xGdmpVSFBVeEZKNzNvaHY4ZlVKTnpNUmZta3Jp?=
 =?utf-8?B?bGFjQ2dKY2MwOG1PRFBoeTIxUSt2WjFlS1hXeCs3aHh2ckF2UUJ5aU5qL3dp?=
 =?utf-8?B?eWZ3dUFtVnFFYTg3VFFnWXFkMmxRZDRMWW9Qdnp2ZmpzTEl1YUJnT3AyM1hn?=
 =?utf-8?B?MGNVclFWd25LM2w0QTlCQ0g5VFJJck03RHZaRi9BaXE0QjdOamM3NTBWNlFP?=
 =?utf-8?B?b09VMmlncXluYzhNRkN5dW1PZGk5UHFZVnhpR0dsS2IrekRmeVpRd1o3N2RW?=
 =?utf-8?B?MW9pS0VBY0R3bzB4N1JTdEZ1bWw4QW54ZndCQndtZ1g2TmgwUmV3QjZrMmVT?=
 =?utf-8?B?VmdvWDcrKzgrOHU2WjNnUE5zZVBjUjJZczVvV2M0NmZOeE56YitFSTg2NXhs?=
 =?utf-8?B?UlRjWGJMbHNDTnNzNHM3d0xGOTA3NmV5NlpjU0l6aUpxWFczaEpOUWNvRnJF?=
 =?utf-8?B?R3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1D3B9EF7A9140043A2BDED8748F77A76@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77cf1b91-1524-4563-87d5-08db743cf153
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jun 2023 22:55:29.8686 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: phkZqXZdM0H03TVR5+0y0K8OC76UZREiYo5vLsQJGvjXea5MZB9fdWIlSndIBqTE+LUiEZsdW/yWiYHJ8aINQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7529
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v6 1/6] drm/xe/bo: consider bo->flags in
 xe_bo_migrate()
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

T24gTW9uLCAyMDIzLTA2LTE5IGF0IDEyOjAwICswMTAwLCBNYXR0aGV3IEF1bGQgd3JvdGU6DQo+
IEZvciBWUkFNIGFsbG9jYXRpb25zIHRoZSBiby0+ZmxhZ3MgY2FuIGNvbnRyb2wgc29tZSBjaGFy
YWN0ZXJpc3RpY3Mgb2YNCj4gdGhlIHVuZGVybHlpbmcgbWVtb3J5LCBsaWtlIHdoZXRoZXIgaXQg
bmVlZHMgdG8gYmUgY29udGlndW91cywgYW5kIGluDQo+IHRoZSBmdXR1cmUgd2hldGhlciBpdCBu
ZWVkcyB0byBiZSBpbiB0aGUgQ1BVIHZpc2libGUgcG9ydGlvbi4gUmF0aGVyIHVzZQ0KPiBhZGRf
dnJhbSgpIGluIHhlX2JvX21pZ3JhdGUoKSB3aGljaCBzaG91bGQgdGFrZSBjYXJlIG9mIHN1Y2gg
dGhpbmdzIGZvcg0KPiB1cy4NCg0KUmV2aWV3ZWQtYnk6IEpvc8OpIFJvYmVydG8gZGUgU291emEg
PGpvc2Uuc291emFAaW50ZWwuY29tPg0KDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBNYXR0aGV3IEF1
bGQgPG1hdHRoZXcuYXVsZEBpbnRlbC5jb20+DQo+IENjOiBUaG9tYXMgSGVsbHN0csO2bSA8dGhv
bWFzLmhlbGxzdHJvbUBsaW51eC5pbnRlbC5jb20+DQo+IENjOiBKb3PDqSBSb2JlcnRvIGRlIFNv
dXphIDxqb3NlLnNvdXphQGludGVsLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUv
eGVfYm8uYyB8IDEzICsrKysrKysrKysrKysNCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMyBpbnNlcnRp
b25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2JvLmMgYi9k
cml2ZXJzL2dwdS9kcm0veGUveGVfYm8uYw0KPiBpbmRleCBiOWY0YjYxMzgxY2EuLjcxYTE0ZTFm
MjViZSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2JvLmMNCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX2JvLmMNCj4gQEAgLTE4NTIsNiArMTg1Miw3IEBAIHN0YXRp
YyB2b2lkIHhlX3BsYWNlX2Zyb21fdHRtX3R5cGUodTMyIG1lbV90eXBlLCBzdHJ1Y3QgdHRtX3Bs
YWNlICpwbGFjZSkNCj4gICAqLw0KPiAgaW50IHhlX2JvX21pZ3JhdGUoc3RydWN0IHhlX2JvICpi
bywgdTMyIG1lbV90eXBlKQ0KPiAgew0KPiArCXN0cnVjdCB4ZV9kZXZpY2UgKnhlID0gdHRtX3Rv
X3hlX2RldmljZShiby0+dHRtLmJkZXYpOw0KPiAgCXN0cnVjdCB0dG1fb3BlcmF0aW9uX2N0eCBj
dHggPSB7DQo+ICAJCS5pbnRlcnJ1cHRpYmxlID0gdHJ1ZSwNCj4gIAkJLm5vX3dhaXRfZ3B1ID0g
ZmFsc2UsDQo+IEBAIC0xODc2LDYgKzE4NzcsMTggQEAgaW50IHhlX2JvX21pZ3JhdGUoc3RydWN0
IHhlX2JvICpibywgdTMyIG1lbV90eXBlKQ0KPiAgCXBsYWNlbWVudC5wbGFjZW1lbnQgPSAmcmVx
dWVzdGVkOw0KPiAgCXBsYWNlbWVudC5idXN5X3BsYWNlbWVudCA9ICZyZXF1ZXN0ZWQ7DQo+ICAN
Cj4gKwkvKg0KPiArCSAqIFN0b2xlbiBuZWVkcyB0byBiZSBoYW5kbGVkIGxpa2UgYmVsb3cgVlJB
TSBoYW5kbGluZyBpZiB3ZSBldmVyIG5lZWQNCj4gKwkgKiB0byBzdXBwb3J0IGl0Lg0KPiArCSAq
Lw0KPiArCWRybV9XQVJOX09OKCZ4ZS0+ZHJtLCBtZW1fdHlwZSA9PSBYRV9QTF9TVE9MRU4pOw0K
PiArDQo+ICsJaWYgKG1lbV90eXBlX2lzX3ZyYW0obWVtX3R5cGUpKSB7DQo+ICsJCXUzMiBjID0g
MDsNCj4gKw0KPiArCQlhZGRfdnJhbSh4ZSwgYm8sICZyZXF1ZXN0ZWQsIGJvLT5mbGFncywgbWVt
X3R5cGUsICZjKTsNCj4gKwl9DQo+ICsNCj4gIAlyZXR1cm4gdHRtX2JvX3ZhbGlkYXRlKCZiby0+
dHRtLCAmcGxhY2VtZW50LCAmY3R4KTsNCj4gIH0NCj4gIA0KDQo=
