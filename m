Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08826C77B7F
	for <intel-xe@archiver.kernel.org>; Mon,  8 May 2023 09:19:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0CAB10E1BB;
	Mon,  8 May 2023 09:19:55 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BD1710E1BB
 for <intel-xe@lists.freedesktop.org>; Mon,  8 May 2023 09:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683537594; x=1715073594;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=AGdM9CRW24h8SkzRGERWOi152L8eWAqmx6VJwZGGvp4=;
 b=Sbqu47fVt5HA/LJTCZNrNAhhJd/Xru65z9OAPaPXemcuuJLu8ZljAFJA
 wLiVtLAUBX2E6Uh7RFtDGhzn7LRhyBto32ZHmcMF6IX0Uww6e0nerxKCo
 018By0qdWnH/JuoRsBIi16hd1UMh50BdZc6X/cQ/xE3exyZwqjSeoo7I1
 THccnrjUFW7l0ZB8l18fjtY74I5WrFt01EInqLnP3Jr5EEzwRyfFZrasj
 u0MgEIx0ceH2EeMBGMNrFOWCkmBKk3lrLUdG2jmQSqrMSRdyVcssS7bu5
 IdoeUgYBCV66rOU+IgMFNQn3KNkIrv09Qu5ynkbQx9DhX2F/l8XauOdNG Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="334039045"
X-IronPort-AV: E=Sophos;i="5.99,258,1677571200"; d="scan'208";a="334039045"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2023 02:19:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="944782042"
X-IronPort-AV: E=Sophos;i="5.99,258,1677571200"; d="scan'208";a="944782042"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga006.fm.intel.com with ESMTP; 08 May 2023 02:19:51 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 8 May 2023 02:19:51 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 8 May 2023 02:19:51 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 8 May 2023 02:19:51 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 8 May 2023 02:19:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c41eF/x3YAkGOdwutad+srq45gW7FOVkkcvLtsn2sM3GKX196+oG84wstnNIcg0jdLqzunQZhrR1dncxPkN3mlA4Vi/hacGCL2d3szqt7p8UXxvo7TTSyk+qrg7dqXLE5fWModwNpurpThamzza2h7/nTLkMwSJvGNxb0nwKQlyZkKKgy0eQ7gWOM+tlcFxTgc1RrHzGWBWWnhLE5SZwS6YMpktmawKAnyx0hUU2YFgMcLtG6r1btfu2Z1kqay86a9FBQ5lBrp1F+7O6CP9vKd0ZgihwRKcH0zh4WSJu3aMvjV6ALyZC4XaS3cDyrpzrVsr370CUBTHpDuFKOPyAqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AGdM9CRW24h8SkzRGERWOi152L8eWAqmx6VJwZGGvp4=;
 b=KQCJssz7VGtGMYalhK+RTMNgNqRbzzJ1HOjqZKocU8lwTZrokUTEWezpoVv9N8B9juu8fJVnWJuWT6KUWszS3LoyBKTfj57wVrd6kWDnE8QkBTcYfluXEKmJw2VxJdkaARXbY6k7yPH6lnyD6nra3DHGGxANv0lz5Y3R+aNgS1yK8uZngOli1WyLkMwVG9aqWe9qruO7nCCO2T3ibI3W9QAznQ64q0LI9PbEcMvzTkPnGGtWXkMv02qLbD/TvOthIGj8SIh2q17uBtVCOx1fMZ5gSuO4YReZYEWlbCN82YkEVm6q04b8CXcTbvt6PuwtVA7NZupov6Rr9A5qdvDRbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 PH7PR11MB7003.namprd11.prod.outlook.com (2603:10b6:510:20a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Mon, 8 May
 2023 09:19:49 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::2796:34e3:dbb9:fe97]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::2796:34e3:dbb9:fe97%8]) with mapi id 15.20.6363.032; Mon, 8 May 2023
 09:19:48 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "rodrigo.vivi@kernel.org" <rodrigo.vivi@kernel.org>
Thread-Topic: [Intel-xe] [RFC PATCH 04/20] fixup! drm/xe/display: Implement
 display support
Thread-Index: AQHZfyvly66ZmlLTHEi0sU2VqOLg/69LwfqAgARcJYA=
Date: Mon, 8 May 2023 09:19:48 +0000
Message-ID: <2fd68f32e780c1c1436a45b410dfb4e903bdf0b2.camel@intel.com>
References: <20230505082956.2247875-1-jouni.hogander@intel.com>
 <20230505082956.2247875-5-jouni.hogander@intel.com>
 <ZFUWaYXt4guHj2F/@rdvivi-mobl4>
In-Reply-To: <ZFUWaYXt4guHj2F/@rdvivi-mobl4>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|PH7PR11MB7003:EE_
x-ms-office365-filtering-correlation-id: e8bedc95-5534-4768-f2ac-08db4fa55f2c
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rNRGQLaBs4AcP6DsEU/j5zWScQ/mw1m3FYHuBtxJrA/HjeirYOR6prSligPDN7FuhbAKE9MPSlvOoaIB/2tWRVU8xBqddgng2JwhbgecqS+m29bsIwoBeNVcq6QF9v2z/KqCNtfe4eFEEJLGHFZmuyqDsNlWsKMWC7wyLuDK63pRM3nMzE5PZh8t0wILbXIvY4mAzokcN6HxSzKwKL1Ao2dwvByJPvImbyG6GQ02xJOWBKt1nYN1ijZmzd3HuxECceMoPIn3EHOSxfwGCDYL4xtTW5r8wcVJOQTV3qGhEMuwyZUUlgqDpVW6PiiqwXlFQQyu/IWS4StQg+sj3THpA3Q96vNA7TxOAyRQWiCxgc729DO/eaFU+A050ALfNW/nNgm9To6fbdD3A39xPJjvJhYa73tUD2HLmLwGz/ZWQtFqCa+725ekERieF/RvAY7KFcE5xZ73EeEBowheizV38R18cRIZrD7v2X1N6uYN21I5poKTzX8MKgyhnkNqM7fMOarGasHH/DJXeo2Sc8/TFStp1Bm6Aug3ESJ6RATyuXU7tr2JARygT4dNPuvHAtira0CV/hP5ktw6M634vccWxrEZDWKOogiYjdMrWyDHUaButN2pKXsr8RGHKldoO74A
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(396003)(346002)(376002)(136003)(366004)(451199021)(6506007)(6512007)(26005)(6486002)(66574015)(83380400001)(36756003)(2616005)(122000001)(38100700002)(86362001)(38070700005)(82960400001)(186003)(41300700001)(478600001)(2906002)(54906003)(6916009)(5660300002)(66476007)(66556008)(4326008)(64756008)(66446008)(316002)(8936002)(8676002)(91956017)(66946007)(76116006)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ckxMR2lxMDMrdmRJaXN4U1M0eWU2ZVZCRzRLQ1hELzRjOHRmMFQ2MWpCcjR1?=
 =?utf-8?B?UXJpMGR2SWpCSjMxWW9PTHdXUnRsQ2F5em1zRHJSSllhaGFoaW5nWUVTNzVS?=
 =?utf-8?B?UzRvYVFSR2o0eU01RnN0MUsxVXhnK2RRSmFwVmxlOU8wbVpab3hMdkkvT09Y?=
 =?utf-8?B?R0dONzN6N3U4QkJLWExucUlTM3JmeC9MdU1yc0UvTmZjSmRWRE5RTUZ1VnNx?=
 =?utf-8?B?ZVUyeGxsbHpPQno2a3dpRGIvaEVpMEsrUHVXTG8ydUk5b0RLa1ErL29Wc3dm?=
 =?utf-8?B?ZEFrY1c0aEFNVGFtZ1AydGJkMjRvTXpqNXpqd2FGNDVBNzlYOEYrSTVFQUNw?=
 =?utf-8?B?YUhKcy9TR3V3Z0d4eTZxbXMrYmxEZVFEcWVkQzR5M3E2NFNFMWQwUTd0K3dR?=
 =?utf-8?B?ZWZ1dGxOU2hvMlh0WkhMOWI0Nkx6dEVoVzdVNzB3NzNJN1NmY0llQm5hcDhL?=
 =?utf-8?B?akVQSjl3WXgzTmh5WUFrcnhVQmFSWTV2ek9JT0xGQ0RVMmg1RSt6OGNlNEVQ?=
 =?utf-8?B?NGJzcHRJNU1ZUlJJeVBOWUR6WG1rR1FXOTNlSFZjRThPNFNYQ2g0eDhuVzBl?=
 =?utf-8?B?RFhKd2RKZDFWYlh3N1Y5L1FHa3g4RGdNaHlpYUsza0o0Qm55Tk1oa09HSURl?=
 =?utf-8?B?bmY0UU5ValBBRTFQeTYxR1dHWEpsY2VGODVTbGxtbmIyVWR6cFZJVE5JeklI?=
 =?utf-8?B?N0xwQ2VaZXVoUXRTV2JoRGdGZkpZbGhGRlBOS1BsY0NMZXAwZUNRbmJDSVVH?=
 =?utf-8?B?eUNSRFp6bzlvelJaQ21WVThXMFo3NSsveEtNYUJhNHU5RlEvYWhiV0lUaU03?=
 =?utf-8?B?b2pTTkFveGJxeFYrcVYxRkpudFdVbHhCVmRtclplM2laeDhlVTJhQUg1cXZO?=
 =?utf-8?B?QTRvMFFZaC9ZOExtam9SdU5rc0lzeGI2Rlg5QlBUZHlRWVdnU3F6TndrU1hu?=
 =?utf-8?B?OWo5OFFNamw5elJsK01PT0NnMlhXbE1uazVtNkVIWmpOTFF3NEhwT2VpTis2?=
 =?utf-8?B?aHFid2pZWEpNRTRWVGFHZjNyRjFuc1RQSkRJeksyZ1JsbW5kR0ZTQS9WbkZC?=
 =?utf-8?B?a1RHSmZVTlNXaFlrTUtRbUFaZXlSdWFrTktzRTR0ZmRaeXJYdUQwRWk5R2tW?=
 =?utf-8?B?b21LT2VVUVQ4VU1jc3JWWDFXY0Q3OC9ETndETlU5YzBkeU0zd2FwUzhJdGg1?=
 =?utf-8?B?WUpYR3FFRWpFNVduZlpRand1QUNFbDR4eDUxU082YWtHMmpOWTlDYnZuWXBM?=
 =?utf-8?B?V0VJdVB0dVdoNXcwSEtTVDBDczVZTnhTVm9YRCt2VG52NDFGTVc0aC8ya0tp?=
 =?utf-8?B?UW1EVytCRUhMenU0ck85YTZRQ09zM2h6d3Z3MjJqMUl3TTlyTmpxTlA5MkQz?=
 =?utf-8?B?Tms3cHdvamZDOWdpWjZWOVRWWmVwbyt1TFhrMG0vc2xRY25TNnpLSmdWTGZT?=
 =?utf-8?B?MUZVTlgrZkEwKzFnUHhzU1F1MVdIeC9ROWVLVFhWdnltakdwRUx0bXhkaUsx?=
 =?utf-8?B?dXdodkVKTHZhOVNoTG9ZU2t0MkJsb3dNZnNuQWJsUk9xaDJicTNaSU8xbnNU?=
 =?utf-8?B?OU44U2tCRHpSM3p5UGFYU1BtcUsyTytxQmxVRWUyaE9nYzFtT1hWUVp4UmIx?=
 =?utf-8?B?OTZ1dUN5THBVa1N2Wk9IY0o0ZXlwYXdLMVRUOVVUZjVWMjlncmtZUklveHhs?=
 =?utf-8?B?eXdlTlNEQkRJSlM4elVSdC9WRENGYmhsc3Zka2ZvZmtSSGl6TGd3VHp0c20v?=
 =?utf-8?B?c1JXV3o5c01DbitZeXptMzdCazlJWjNhanVDeTZqRmQ3Ym94NGVQVEY1Vlc1?=
 =?utf-8?B?QU9xR01FZW1hUWVrVndsWFczK0MwamJBcTZSc094bnlSZUhHa2kzUVIyQzB0?=
 =?utf-8?B?aktXem40NHJKTnhTb0l5Z2h1RkNjdm5jNEFIVjk1Rzg1QkVqYUQ5ZDk0RUk0?=
 =?utf-8?B?QVNrNmxPQzZmNFpQd2dybnBuWG9ReWM1YzlQeFV1dCtxakJ1L0NRcEdqRm1h?=
 =?utf-8?B?c2prblZSNmRsb1kxRWp5RDRISHJCR3FkQVFGaTJjZlNUQ256QUZDWS8yanNB?=
 =?utf-8?B?L3JEeG1PL0xhWFpkUzdYWEFkY2l2QXZwakJmRVl3ZEVyZUF6a05ZSGg1MEk5?=
 =?utf-8?B?cm5oMWpBYUQ5MG9ES3dyRmFkSUw5WndSQ0RxU2xEaDBJNi9MV2FpWlpNVFlB?=
 =?utf-8?B?MGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A2866B690CA31C4C8CE6C83D24EA3634@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8bedc95-5534-4768-f2ac-08db4fa55f2c
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2023 09:19:48.7424 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: z2B18OnYpINGg1GtvyuzAHRZyyDCiP4l5sp6DpXaS3X3/6sPMamDAM6ZJ0eGgTXCb74t+Sesfd2FhqJUEITR8gjCMswicJffK2nrJJjOemY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7003
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC PATCH 04/20] fixup! drm/xe/display: Implement
 display support
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
Cc: "Nikula, Jani" <jani.nikula@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gRnJpLCAyMDIzLTA1LTA1IGF0IDEwOjQ0IC0wNDAwLCBSb2RyaWdvIFZpdmkgd3JvdGU6DQo+
IA0KPiBJIGJlbGlldmUgd2UgY291bGQgYWxyZWFkeSBzdGFydCBtZXJnaW5nIHBhdGNoZXMgMS00
LCBubz8hDQoNClBhdGNoZXMgMS00IGFsb25lIGFyZSBjdXJyZW50bHkgYnJlYWtpbmcgYnVpbGQu
IEkgY2FuIGZpeCB0aGF0LsKgDQoNCkdlbmVyYWxseTogaW4gY3VycmVudCBmb3JtIEdQVSBmcm9u
dGJ1ZmZlciByZW5kZXJpbmcgKyBQU1IsRkJDIGRvZXNuJ3QNCndvcmsgd2l0aCBYZSBkcml2ZXIg
aW4gZHJtLXhlLW5leHQgYnJhbmNoLiBBZGRpdGlvbmFsbHkgaXQgaXMgYnJlYWtpbmcNCml0IGZv
ciBpOTE1IGFzIHdlbGwuIElmIHBhdGNoZXMgMS00IGFyZSBhcHBsaWVkIGk5MTUgR1BVIGZyb250
YnVmZmVyDQpyZW5kZXJpbmcgKyBQU1IsRkJDIGlzIG5vdCBicm9rZW4gYW55bW9yZS4gRHJhd2Jh
Y2sgaXMgdGhhdCBuZWl0aGVyIENQVQ0Kb3IgR1BVIGZyb25idWZmZXIgcmVuZGVyaW5nICsgUFNS
LEZCQyBpcyB3b3JraW5nIGFueW1vcmUgd2l0aCBYZQ0KZHJpdmVyLiBTdWJzZXF1ZW50IHBhdGNo
ZXMgYXJlIGZpeGluZyB0aGF0Lg0KPiANCj4gTWFhcnRlbj8NCj4gDQo+IE9uIEZyaSwgTWF5IDA1
LCAyMDIzIGF0IDExOjI5OjQwQU0gKzAzMDAsIEpvdW5pIEjDtmdhbmRlciB3cm90ZToNCj4gPiBT
aWduZWQtb2ZmLWJ5OiBKb3VuaSBIw7ZnYW5kZXIgPGpvdW5pLmhvZ2FuZGVyQGludGVsLmNvbT4N
Cj4gPiAtLS0NCj4gPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS9kaXNwbGF5L3hlX3BsYW5lX2luaXRp
YWwuYyB8IDIgKy0NCj4gPiDCoDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUvZGlzcGxh
eS94ZV9wbGFuZV9pbml0aWFsLmMNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS9kaXNwbGF5L3hl
X3BsYW5lX2luaXRpYWwuYw0KPiA+IGluZGV4IGQwZjkxZjM3YjZkOC4uMzRhZTQ2MTg2NWE3IDEw
MDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS9kaXNwbGF5L3hlX3BsYW5lX2luaXRp
YWwuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS9kaXNwbGF5L3hlX3BsYW5lX2luaXRp
YWwuYw0KPiA+IEBAIC0yMjgsNyArMjI4LDcgQEAgaW50ZWxfZmluZF9pbml0aWFsX3BsYW5lX29i
aihzdHJ1Y3QgaW50ZWxfY3J0Yw0KPiA+ICpjcnRjLA0KPiA+IMKgwqDCoMKgwqDCoMKgwqBwbGFu
ZV9zdGF0ZS0+dWFwaS5jcnRjID0gJmNydGMtPmJhc2U7DQo+ID4gwqDCoMKgwqDCoMKgwqDCoGlu
dGVsX3BsYW5lX2NvcHlfdWFwaV90b19od19zdGF0ZShwbGFuZV9zdGF0ZSwgcGxhbmVfc3RhdGUs
DQo+ID4gY3J0Yyk7DQo+ID4gwqANCj4gPiAtwqDCoMKgwqDCoMKgwqBhdG9taWNfb3IocGxhbmUt
PmZyb250YnVmZmVyX2JpdCwNCj4gPiAmdG9faW50ZWxfZnJhbWVidWZmZXIoZmIpLT5iaXRzKTsN
Cj4gPiArwqDCoMKgwqDCoMKgwqBhdG9taWNfb3IocGxhbmUtPmZyb250YnVmZmVyX2JpdCwNCj4g
PiAmdG9faW50ZWxfZnJvbnRidWZmZXIoZmIpLT5iaXRzKTsNCj4gPiDCoA0KPiA+IMKgwqDCoMKg
wqDCoMKgwqBwbGFuZV9jb25maWctPnZtYSA9IHZtYTsNCj4gPiDCoA0KPiA+IC0tIA0KPiA+IDIu
MzQuMQ0KPiA+IA0KDQo=
