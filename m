Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5048CC4332F
	for <intel-xe@archiver.kernel.org>; Wed,  8 Nov 2023 06:06:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE41110E07D;
	Wed,  8 Nov 2023 06:06:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7567310E07D
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Nov 2023 06:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699423580; x=1730959580;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=MIiEgcmwpNnp829bY9wZMrQt9OFd5F6L5apzw/TlUxk=;
 b=TnI1E3iXCcDPahxv7EtgCFZSlaDWfJQC+kuveukm2cfhAV7E34ci5+KN
 fIPo0BZTqbov8KqnIiR2UUGWq1z+LEs4DhJ4Nmgug1inlqYi3gjZ9l41T
 TtOIo6W7ZGDqk+4WBT+/urvFxZVysx2FMTxUXFIj/L2LkgW7qy3aWGx4M
 +Hotq2qTV8jNMM2NBveAG+GcqFjr5TcR3rrfdXPuxAyTFG3sHzxz0cxZY
 h6lWaxWMPEfzEQIN/u+1Chsk0h3SkpTBniALCdE5T5lZZr29WQ73DgAjP
 S7/zptiaLPy2XUuvF7TKswCpRZfTMIPTjfzVOrf0eJJnadwvxZcF1JQXO A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="389506782"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; d="scan'208";a="389506782"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2023 22:06:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="906671473"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; d="scan'208";a="906671473"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Nov 2023 22:06:19 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 7 Nov 2023 22:06:18 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 7 Nov 2023 22:06:18 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 7 Nov 2023 22:06:18 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 7 Nov 2023 22:06:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OGRjIsyJYhyGOWBJs9MZEBV94VTL//M1QsxWaQgqrkk/zFwab+SV53AoE9Wp/UYaFc+3Xr5QNDrVGSWR/LUm2ukEZ5atEvAoB2BuApYsecIXEIf0Ine0YclJvchZAGxOeQ73vdFt/OHdWr4eJzvs8y4qHolm02yOhuVj8NKGFA4oQVCLUNcK+u4S/tKw7FUtqCrJGIQ06Qb6vpp9ZXFyZkUJIpLhObU4gPC4Fl6Gtn88wHjKV9AByONq7+E/mLlyBmNF22BhQdbFoOSk6radynrWuh6rTXD/vEXjiGNApQHvZKXM8dwnZUuGNltEBTc93LHKAraQ0WB59abZjAn+yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MIiEgcmwpNnp829bY9wZMrQt9OFd5F6L5apzw/TlUxk=;
 b=Tilm2DzlNnU9g50T/cYAhNO9Pj6BfUvb1GFAcqV0vkrbOvAnBE1mt7vFtejhuStxOgU5wqBVmyaF/nfkvwt4RlVrLETiJRTXBLwdv/lcQ63hlEUXDC2D0zisajwU3IF9OgGnpTxVVqIXKD5aXytGdV2IN0hhINOZARK+btBwJtyrpcojSwxgtawfQ19TC2LVNXCMYwfmE+Xhajz62+MMaDdvTBiB1R4ZzQrEFxfodIjP3I7UYVlpNCIJJNaOWYCF3hfQhrev+HFZyWzzR+FqB16Runvj/FvASCB2MsGM3KmJc0qA8XPmPKSLcuCG3rUY67p3YMk00U7UoDtExKSLDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 SA1PR11MB7015.namprd11.prod.outlook.com (2603:10b6:806:2b8::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Wed, 8 Nov
 2023 06:06:11 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::ea97:f0a2:fffc:b892]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::ea97:f0a2:fffc:b892%3]) with mapi id 15.20.6954.029; Wed, 8 Nov 2023
 06:06:11 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Nikula, Jani" <jani.nikula@intel.com>
Thread-Topic: [PATCH 0/8] Backport i915_sw_fence to dma fence conversion
Thread-Index: AQHaEH1SJ8oDVXiyJEm72z/F9nF0fLBu0rSAgAEfpoA=
Date: Wed, 8 Nov 2023 06:06:10 +0000
Message-ID: <6a7350564d401a247485b1439673a12944d7c770.camel@intel.com>
References: <20231106064834.161647-1-jouni.hogander@intel.com>
 <87v8adyb5m.fsf@intel.com>
In-Reply-To: <87v8adyb5m.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|SA1PR11MB7015:EE_
x-ms-office365-filtering-correlation-id: 388ae671-e8ad-4305-7b1f-08dbe020ce78
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bprYPhCEe4xC8VwzIXMed/m5CxNkic5TmxqCXd1rfeoNmBb+L3ryPmNP+lo5elrRgKduzCcJL6oiJhcKrgib32qyNL75esOIDgbdRCG44Lc7nnTWVph90Rek9vpVgJ+3Rh+XvPL7VNmramcKoIJ37yblx1HXm8gjFoV466K25/UOtBxoi/DIY8PtVx00rggAK4zJoWlnwQWlLrZ7iLoV0H+pHtyjoT/wChZkp4KT0ptJ77/3bKXe+vNwLPR5MLzWecA5bSBE1icPD3Swsz9g6mYvp7deIiuy70ATr+a2tIEVDBrV2E1PDx5cfJsV8ooO+hFrcCEWqXraaJRF2tk2IgNs6XzLc1EkfbSHlT6z9Jn+IFL3HXpRwGZEhscEGWgCVs3b9BiQpUDFGvDFfrs+LRfbVCE8OGY4zZVFBevgLREqKd1NzM3sHN0XS7p/OnaEZ80KL6/dXlACYtnDc1fQ1qT6YZG8Z5QwhVmY23CIxmvsFZK/drH/RpuKEtqsuvdGap0Bppu3QM71vROxAEhNjHu86YIQSCnnyvKRgIH8jfTRBExKI6DnCOnUZA56FAt5vOs6Z+KygcAzpVy7LF2FyaynURJuPPOA/EkCnmUCuDYYlvYA1qCv5Q0FhcBDKqXa
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(346002)(366004)(39860400002)(396003)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(54906003)(41300700001)(4326008)(6486002)(66446008)(64756008)(6512007)(6636002)(316002)(36756003)(8676002)(8936002)(2906002)(38100700002)(5660300002)(86362001)(66946007)(76116006)(66556008)(83380400001)(66476007)(26005)(2616005)(82960400001)(38070700009)(122000001)(110136005)(66574015)(71200400001)(91956017)(478600001)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MjYxN1l3akZzMlNVSUV6K2Z3Ykp1STBDWXhmR1FMQjBYcmE5bUd1VDhDeElM?=
 =?utf-8?B?K0ltU1V3b0t1Q0hXVkZrd0d6SzRTdGEzbk8wdkluSC95Q2ppSzJUSHdnMEdL?=
 =?utf-8?B?YURNMUNLRVh2Mll6SStaN2RvK1dyakVhc005MVU4OGNUVDd4LzAzT1I3TGQr?=
 =?utf-8?B?YkVFVHViTHMweHRlb25sYlBkMEpPYWphZ0RvVGs4aXV2THdDb0hhQzNiM0dF?=
 =?utf-8?B?bnBsWUtJYnJGamowVHJCS3gwZW12bkxwS3krWDZCb1diczAxbHJjOGg2OTNP?=
 =?utf-8?B?bFd5UGtmb0dvczVydXJYeTVFWi92dXFxWDdCV1dXd1Q1Qy9PMFAyWjlRK1ly?=
 =?utf-8?B?dGovbkZPOVN0d1lPcEJKM0ppUCtBUkRKZk9HOEZGL09NcDR2OVlBSW11bm51?=
 =?utf-8?B?bEdLZGpiUkt5bXdQUFlLNFNsbVRLdkZWV0Z1aGVzZ0dZL1pyR1J4SkRCUjRu?=
 =?utf-8?B?K3EzaWpDbGNwL3F2K1FnQ1VLUCszek1zTWVWdWNucmxTalhCRmJRcVBnMCtj?=
 =?utf-8?B?cThaU1gwZ1VqNmk1aUVua2NQaHduU3AyRlk2OTZxNjNhVGVSdDl1WWwzcHlH?=
 =?utf-8?B?cHZDeHJzakcvb1QvTmFCTmR5MjU5a3E4eFFXRXhyWWNBRWZUTC9oSC93SlNN?=
 =?utf-8?B?Q1BSSkpqSGF5bnhHNFR1dnRKdTUrNSt6eXg3RFVsVFl3MFZKNXQxQ0NZOEd4?=
 =?utf-8?B?YnU1b2dHZ25nQmVzakZzZWxrbmFURVhHeWw4bDZzenVhb1lvN1E2aktqaXp5?=
 =?utf-8?B?SzR5UTBwVkZJNGdMZkhIQ205QTY2eEpoREU2M3dLVEk5Wk1SekE1QjdoejJW?=
 =?utf-8?B?dVE2a1pKVlQxOGM1MTFmVWhpc0FUSTlJbUdUY0hjU2FLajF5Q2VCWmJ0eW9Y?=
 =?utf-8?B?Q3VKVUhaMHZXb0RlZlQwRFg1K0JHN0dnWW1Mb2lGUVQ1cVN3NDc4ZEY4UzBG?=
 =?utf-8?B?ZEcwWUtWU2l4OG9tKzZIZ2dGNVNQWTA5VlljUWxHWUR4RHRudFJ3eTRzT21X?=
 =?utf-8?B?UEpPNFpySUdGd0IyUUt1TUJiVWFoR3BoMG1OWVVWR092QTd3ampoTnVRUVc2?=
 =?utf-8?B?S3FGSlk1enFWVEZHeUc4a1JjdkdHTkRET2ZTTWhXaHJXK1VlU1VFQlRpbFR3?=
 =?utf-8?B?QU56b0p5cjFCM09JSUE5UThZRFJxUTNKNmpvZnZnOGtRMUxzYktTQzFCV1gx?=
 =?utf-8?B?V0J4T3ZrbGxERzZMRDJSaHE5N0tGTlpxSEVITHF6aEpDNy82YXRnQ1M1NFRs?=
 =?utf-8?B?WUU3Y1hVdjRTWkZhRVRLNmh5ZFZHREErUVRHWmJ6dkNsRVRlT2FlZ3l1STE4?=
 =?utf-8?B?Z1R2VzZNOTUvY3hJaW5aS2dXeWFKWERzQlB5blp0L21PeEw1MWVyWG5WSm5D?=
 =?utf-8?B?M2FCWEdFbVZneUhOeUQwNlNLUWJtMjFDTUNVVDFLa2ZpSmhwZFVoeWpZelVv?=
 =?utf-8?B?Njh3WDM1SFdPMUlRa3lJcnk0aEJyYUZEUU4yS09JQjl4SkdIR05SL2swc3hp?=
 =?utf-8?B?Y3BoaGxzQzlJRk5KVC9DMnlkdHBEYXEwUmpIbnYzTStOSGdNOU52Nmc0Y1RD?=
 =?utf-8?B?RW1Hemwza2hFZ0ZKa2pXaDh1N2FRbUZFQVM3Q0I2RmxBSmRJV01YZUVwamk1?=
 =?utf-8?B?S2pXZlM4ZFljN2JPZjdYaTQ1OFREcEFHQnZNd1k5SVZpMTM5c2R1MXhZR3Fp?=
 =?utf-8?B?UmxrUzg5Lzg2T1EyZ2daNU83NWZoZ2VGbTdTbzB4amtpeWx2VitzOTNlS3cz?=
 =?utf-8?B?dmZCYU5vVzE2ZUpNZHJiLzMrV0lycjQwdkEzcjRZVDNZQzN1bUtFSWF6NkJZ?=
 =?utf-8?B?OUV0RzJBTXowUEs0SmRtL3Qwa2wyYjVGd2ZENk5MWUdYZEVRTUswU0JhTzNs?=
 =?utf-8?B?aE1KZ01aTHJ5R1dhdUViK2hGaGxTS1VwVGRRTER3NkZhZXVJdUZMQU1lcTlB?=
 =?utf-8?B?emJ0UTlwaFkwR2RSamlBVjJXc2dtZ3E1K0l6Znltek1UbExFQ25tZnpnM2k2?=
 =?utf-8?B?a3lUSENSRTV1VkZMZkN2OStobjdDcXlZQ1RhMW1ZYW5NcW5CeXFxK2lYbjh3?=
 =?utf-8?B?NEhLZWdxaThQREIwQkJ1ajMvUHBFZ2kyWkFiaUNFZWhRRkFLL3dvNkYza0dZ?=
 =?utf-8?B?dXNDbEdEWmp0REZqS1FTTVRvSVBNZVdSNCtmekhHMFV5aGN6SGJxQ01SQzNU?=
 =?utf-8?B?RHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AA0A506049EC954D8E53897BBDD2AB34@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 388ae671-e8ad-4305-7b1f-08dbe020ce78
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Nov 2023 06:06:11.0094 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ulAWCKVEAPi6zTbiuZI/s+TDRsvqWsBMdMNee3UbA6PkTx0+vZXTXBzwLRUfA26S/8OSyeNHGBsMcPf67r+FaoIhjz923y/s8TdWVFD3IB4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7015
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 0/8] Backport i915_sw_fence to dma fence
 conversion
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
Cc: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDIzLTExLTA3IGF0IDE0OjU2ICswMjAwLCBKYW5pIE5pa3VsYSB3cm90ZToNCj4g
T24gTW9uLCAwNiBOb3YgMjAyMywgSm91bmkgSMO2Z2FuZGVyIDxqb3VuaS5ob2dhbmRlckBpbnRl
bC5jb20+IHdyb3RlOg0KPiA+IEluIGRybS1pbnRlbC1uZXh0IGJyYW5jaCB3ZSBoYXZlIG5vdyBy
ZW1vdmVkIHVzYWdlIG9mIGk5MTVfc3dfZmVuY2UNCj4gPiBmcm9tIGRpc3BsYXkgY29kZSBhbmQg
dXNpbmcgZG1hX2ZlbmNlIGluc3RlYWQuIEJhY2twb3J0IHRoZXNlDQo+ID4gcGF0Y2hlcw0KPiA+
IGFuZCByZXZlcnQgcmVsYXRlZCBGSVhNRSBwYXRjaGVzIGFuZCBvdGhlciBicmFuY2ggaW50ZXJu
YWwgY2hhbmdlcw0KPiA+IGZyb20gZHJtLXhlLWludGVsIGJyYW5jaC4NCj4gPiANCj4gPiBGb3Ig
bm93IGhhbmRsZSBpOTE1X2dlbV9mZW5jZV93YWl0X3ByaW9yaXR5IGJ5IGFkZGluZyBlbXB0eSBk
ZWZpbmVzDQo+ID4gaW50byBjb21wYXRpYmlsaXR5IGhlYWRlcnMuIFRoaXMgaXMgbm90IGludGVy
ZmVyaW5nIG9uZ29pbmcgd29yayB0bw0KPiA+IHJlbW92ZSBpOTE1X2dlbV9mZW5jZV93YWl0X3By
aW9yaXR5IGZyb20gaTkxNS4gVGhlc2UgZW1wdHkgZGVmaW5lcw0KPiA+IGNhbg0KPiA+IGJlIGVh
c2lseSByZW1vdmVkIHdoZW4gdGhhdCB3b3JrIGlzIGRvbmUuDQo+ID4gDQo+ID4gQ2M6IEphbmkg
TmlrdWxhIDxqYW5pLm5pa3VsYUBpbnRlbC5jb20+DQo+ID4gQ2M6IE1hYXJ0ZW4gTGFua2hvcnN0
IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+DQo+ID4gQ2M6IFJvZHJpZ28gVml2
aSA8cm9kcmlnby52aXZpQGludGVsLmNvbT4NCj4gDQo+IE90aGVyIHRoYW4gdGhlIGNvbW1lbnQg
b24gcGF0Y2ggMSwgdGhlIHNlcmllcyBpcw0KPiANCj4gQWNrZWQtYnk6IEphbmkgTmlrdWxhIDxq
YW5pLm5pa3VsYUBpbnRlbC5jb20+DQoNClRoYW5rIHlvdSBKYW5pIGZvciBjaGVja2luZyBteSBw
YXRjaGVzLiBUaGVzZSBhcmUgbm93IG1lcmdlZC4NCg0KQlIsDQoNCkpvdW5pIEjDtmdhbmRlcg0K
DQo+IA0KPiANCj4gPiANCj4gPiBKb3VuaSBIw7ZnYW5kZXIgKDgpOg0KPiA+IMKgIGZpeHVwISBk
cm0veGUvZGlzcGxheTogSW1wbGVtZW50IGRpc3BsYXkgc3VwcG9ydA0KPiA+IMKgIFJldmVydCAi
RklYTUU6IGRybS9pOTE1OiBmZW5jZSBzdHVmZiINCj4gPiDCoCBSZXZlcnQgImRybS94ZS9kaXNw
bGF5OiBBcHBlbmQgZG1hX2J1ZiBmZW5jZXMgdG8gZnJhbWVidWZmZXINCj4gPiBmZW5jZXMiDQo+
ID4gwqAgZml4dXAhIGRybS94ZS9kaXNwbGF5OiBJbXBsZW1lbnQgZGlzcGxheSBzdXBwb3J0DQo+
ID4gwqAgZHJtL2k5MTUvZGlzcGxheTogVXNlIGRtYV9mZW5jZSBpbnRlcmZhY2VzIGluc3RlYWQg
b2YNCj4gPiBpOTE1X3N3X2ZlbmNlDQo+ID4gwqAgZHJtL2k5MTUvZGlzcGxheTogVXNlIGludGVs
X2JvX3RvX2RybV9ibyBpbnN0ZWFkIG9mIG9iai0+YmFzZQ0KPiA+IMKgIGZpeHVwISBkcm0veGUv
ZGlzcGxheTogSW1wbGVtZW50IGRpc3BsYXkgc3VwcG9ydA0KPiA+IMKgIGZpeHVwISBGSVhNRTog
ZHJtL2k5MTUvZGlzcGxheTogUmVtYWluaW5nIGNoYW5nZXMgdG8gbWFrZSB4ZQ0KPiA+IGNvbXBp
bGUNCj4gPiANCj4gPiDCoGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfYXRvbWlj
LmPCoMKgIHzCoMKgIDUgLQ0KPiA+IMKgLi4uL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2F0
b21pY19wbGFuZS5jIHwgMTAxICsrKysrKysrLS0tLS0tDQo+ID4gLS0tLQ0KPiA+IMKgZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5LmPCoCB8wqAgOTEgKysrLS0tLS0t
LS0tLS0NCj4gPiAtLQ0KPiA+IMKgLi4uL2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheV90
eXBlcy5owqDCoMKgIHzCoMKgIDQgLQ0KPiA+IMKgLi4uL2RybS94ZS9jb21wYXQtaTkxNS1oZWFk
ZXJzL2k5MTVfY29uZmlnLmjCoCB8wqDCoCA4ICstDQo+ID4gwqAuLi4vZ3B1L2RybS94ZS9jb21w
YXQtaTkxNS1oZWFkZXJzL2k5MTVfZHJ2LmggfMKgwqAgNyArLQ0KPiA+IMKgNiBmaWxlcyBjaGFu
Z2VkLCA2OSBpbnNlcnRpb25zKCspLCAxNDcgZGVsZXRpb25zKC0pDQo+IA0KDQo=
