Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B331C77B7E
	for <intel-xe@archiver.kernel.org>; Mon, 29 May 2023 14:40:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2520210E2C3;
	Mon, 29 May 2023 14:40:13 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95F8810E025
 for <intel-xe@lists.freedesktop.org>; Mon, 29 May 2023 14:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685371210; x=1716907210;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=yHFB9W8q6W6EaHSxaL/f8IIR40Bf+laCdPod9EMlhFY=;
 b=fJh8oH/oGpWv/N6+RlTz60qTISmtJ/Vs0V7uJTVCDNATnM28Se1jvA64
 B61Z1vTqsgzvB5F6OLDzVrZAjt2dg2dxOvKWGpX74T3rpiYUD6Oh0HPQS
 1qffBy8vzdBzDaY0YilRZrAUCOiqUAcLp5k5H2+yIFGn6QR5caR3p2buq
 xiIIkB6ALf9+/1E54YeYSo7lLMm9/EByEAV27hmapNo1CfKBp0/BWjpIj
 1iVmv7Ccej0032OM2Oq7fcIsNESTvlUlhu6pDtHqYuiGjR+4G0F1Js/gR
 w6/6LLGiNPiocZNcbNpjnxDiID6IxEnZflRYmIhz5KquvaSAJFrLRdH3n g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="418204855"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; d="scan'208";a="418204855"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2023 07:40:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="818456522"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; d="scan'208";a="818456522"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga002.fm.intel.com with ESMTP; 29 May 2023 07:40:09 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 29 May 2023 07:40:09 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 29 May 2023 07:40:08 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 29 May 2023 07:40:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IKwguxU8GdHHPIweZtOLoxJE+R7UFbUWzkMP1mSae0RKClvBpu/+l1x54WNn9KpLXRUB8+2AK4ifsrbx2gGP1quxHXfiLQ5MjaC6NcqS6QDx6VAmBtFH/JwSTBQiwLs92DEEvodvGxvD9gS8gACS1SSrMBkzKNyC2nLwS2OImNxr2TFdEkOCaZlKptBHawf5zrGfAs1G8TczEQBFftSmt5Omzv7yobSi0SZt6rEs5VQFLa2Puq5+83GfsGgt7g2IKqdxLX+/sBAQBI3/SHf0oFo3AsJ55b6eA9O1c7qBAMFM3qAYYN3qGjjdg26YjNJCe6vw2E6yush7taylwufbmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yHFB9W8q6W6EaHSxaL/f8IIR40Bf+laCdPod9EMlhFY=;
 b=j7jATEvgPpf8y/WakSC0WorlkFs1Tpw1NbqlHEfsk3Pp/xb78cP2Jas615M4GYRiSZzAliVIshN4SgE0+GokrHWizzXEv6MtW4Z8ADutpRGn6wLhs4I8n13uuvFSmcMGsaXRId8k6XLwPzxmo+YLee/z0bMv3vXcX88Xcs6k4wt9vwYcvt5G7V+zMweqp97JHzZEQ99jF2+nd2cnUQLc4emZUFKfDPGhZPA8fHCwhUhPQq9ziwkw/wtjzGEwk9wbHJC8u949DDgPq9EqpfSw2oSuAeDe1iQkmaYKDWO9unf5XuC1ei5BD56tqkROulJWjCIGcSD7Scr2kiBcyW7fEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by CY8PR11MB7730.namprd11.prod.outlook.com (2603:10b6:930:74::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.22; Mon, 29 May
 2023 14:40:07 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::3fa1:b97c:a5bb:651]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::3fa1:b97c:a5bb:651%3]) with mapi id 15.20.6433.022; Mon, 29 May 2023
 14:40:06 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>
Thread-Topic: [Intel-xe] [PATCH 1/3] drm/xe: Disable interruptable wait on
 xe_bo_move()
Thread-Index: AQHZkAUrljm/3MaEc0a+WHqPJWrM0a9w960AgAAZsgCAAEV+gA==
Date: Mon, 29 May 2023 14:40:06 +0000
Message-ID: <376886023a6aed008f3e9e438722403a6278d348.camel@intel.com>
References: <20230526190609.61529-1-jose.souza@intel.com>
 <323d497f6ea67a8eb813ffac043393644c57fa67.camel@linux.intel.com>
 <cba9fb1a0374286bf847325d4d574e7d9b9b665d.camel@linux.intel.com>
In-Reply-To: <cba9fb1a0374286bf847325d4d574e7d9b9b665d.camel@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|CY8PR11MB7730:EE_
x-ms-office365-filtering-correlation-id: 45ccec5b-2710-424c-da13-08db60529842
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: D35tmm5HBbtfhmkIMeC/r4Ear4GVtttvOEHtrpX8PAf0wO9BZHGryRMhDvQ8930O2CWj/5QaeBMY9OxTHgvn4N80YvMFaa/hSgeCbt6KjXKBS1q4LmHBETaDDyuHuuzvaXGcrQZqyLD8c9g/W4+KEOY78AIxpUhYPtFnh1PxuAgRSzRC5MAN67FSL7CZ0e9kV8NMBGLAUUNkby17crbkhZuwqOw9SOxtTegnjqfNZTLdQfiZO+RJzIuEPlYPXQNUJfd679Q/f9ZHGRH0ulcf843/CRTVaGmcDFHMqZq6MSVVBMxrVstOfDT35T0HS7LRfg/O7b7nhbgx3nyyVfOnkdzw6cOwqfjWmkFCboIUAbfhZ3BUcuBxAtDnfvbFNZvLguWQdp2nN5O+sd085l02EXHcdIt2t42QvZNeUQmlU3aiSdU1f8PNFdl1Std+BPf/jQaOnZIX2Muj4qqUYdzE84+EBGl2aYCfOJ9rLIzwu/G1U9w4ujXg+Zvf+PpwhreKI8SksDW/+AKtj9MzwZmbG16d5Hzy4RXwy+w5y46N19IndmhvcrbrZY7asq0taoXh
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(396003)(346002)(39860400002)(376002)(136003)(451199021)(6506007)(6512007)(186003)(2906002)(2616005)(110136005)(478600001)(26005)(66574015)(83380400001)(38070700005)(86362001)(122000001)(6486002)(8676002)(82960400001)(41300700001)(38100700002)(8936002)(966005)(5660300002)(76116006)(64756008)(66946007)(66446008)(66476007)(66556008)(316002)(71200400001)(36756003)(91956017)(4326008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c1pDY3pYUS9id3FVek04ejZoR0hGMUVpL2ZXdkR5aHA3dnhkOFZFQXpRN2Yz?=
 =?utf-8?B?aSs3SVRQOC9lR0M3TU1jVklIYWowMk5sbE11SFEzVUlQQVBNbXQyWXVzYkts?=
 =?utf-8?B?UDRBVnlFRzlaZDhwUlFTNWZzM0x3ZFZ4dHhMVlF0SDBEVkNWQWRRcFZtNTJr?=
 =?utf-8?B?cDB1N00vQVhmZEs2UCtXQnlzQzhYdThlbEczOEtRNS9yTWdZTkNVV3RZc0E4?=
 =?utf-8?B?NUhDRnMwNUVRUGJ0VU1pWXh0TzFmZmc3dEdwaFZ4cjdqZGw0ZHpPTG4rN1Vr?=
 =?utf-8?B?ckdjNnl2eGlGaUhPK0VHRjFQUzk0ZnFXVVhTOVhxKzZvcGlqRlFQVXJtY0x4?=
 =?utf-8?B?elAyRmF5bnBLUmNuV1p5OCttNUFVa3BlbDlsVld4NW5penR5eU1peVpkZ3du?=
 =?utf-8?B?TWpqZURuTDVuQkJEUHJDZTVITEtCVldYV1Q2VjNwbEpOeHNnS3dxV2F3N29j?=
 =?utf-8?B?YWVHcVhJNFJiVHZoSU16Mjh1aG9pYTAvVFA4YUtxUk9aRFY1ZjA1ODZUVkJZ?=
 =?utf-8?B?YzFSMDc1TnpPSlkvUTMxZzVrdlpDaWJ3TzdLQUNrZDdyNFpEKzhacTVmNG11?=
 =?utf-8?B?bnlFQ0pQT01Sbm9zdVV2ckFiYWFFTkJqU1I3MXRqZkNkdEFhZVE5M3c1ME9W?=
 =?utf-8?B?K2ZSeDE0MmFnai9mU1NpVlJKTUdWNHArdjZTWFVJWWR3ems2U1g2WmI1UVdm?=
 =?utf-8?B?bE9JMUM3V0pmeVBpeFhYQkpVOHZON3psNVJROW5ueXhxUXRuQ3hkSlhFNFhG?=
 =?utf-8?B?RHBxT2pyQ3hzTTRma1BGZHBnUUtLOG96YVZ2SXkrVW8yK1NGVnB0NWtTYXdw?=
 =?utf-8?B?eGFWRVArTXQ2aDROSldRQ1BaZ2hLaTZsU1pRbmQrQ0gyUklqa25MSGtlY1RI?=
 =?utf-8?B?cDQvd05ucWF2MHNFYVk3NkszdWY2V0xhaXdZQUxudytPMStaQktFZWkyb2RL?=
 =?utf-8?B?aXJzbjUvSEx6QTdwM1VvT3lyMDJROEUyKzh5SkJDYVU2cGFkUWdZNmdjZDdu?=
 =?utf-8?B?Q2gzNFFYOU00MUFGamNxRlk1Ky95eUVkaEhob2EyVE1FR1Y5cFlEOHhOWWRI?=
 =?utf-8?B?Q2t2UXRaZ1pBWnJyTUZyZ3lNam52M1hyRE9kamVTRE5MakhaWnZLdDZUOERa?=
 =?utf-8?B?b002VExNUEMwajQwdUp4Z0Fwd0F3MnlzMWpnYVIvOXJxZmNHSURLZTEydkFy?=
 =?utf-8?B?V3lBUUJ0KzJxbEladkZ0UWpsUDlDaVFqM2RXamp1TUFaWVdPWWc4MTFFR3dM?=
 =?utf-8?B?U1Q3cDdsM3FPTjJ5RlJYZ1I2UE5mUUx6YmFCRUJEZWpBc01SR295eGM0VUMv?=
 =?utf-8?B?SHFkTmpLeHpONkZTN01IWHVNT2huaUZ0ODNOS2lFVUhwSWx0ZFd1cVdpZm45?=
 =?utf-8?B?eDQ5SkJDYTE0bmk3dytseWxvTSszSGZBQk5waGVTWFRic2xFNlkrOEFjaWtB?=
 =?utf-8?B?Y01vVHVPdWRSZU96MzZlYk10RGFNRmZaWHQrelFKd05IWDZmdVhDV3NQREI2?=
 =?utf-8?B?V1FqUHlzSW1YU2Jsbk1WQWVIRWJpdTBFTC80MTJBODVmK2Q5Sm1nbGVKSlpD?=
 =?utf-8?B?N3krZWZkS1VnWjBSa09YNU14UXE2eTNXd2dCYmtYUkVsUkxmOTlhRDZTMW1G?=
 =?utf-8?B?dEw2c2hHTUd6a2oza2ZOaXZXVVM0bDIvd1l1VDFrenltRFdRMHlNYkY4NWxY?=
 =?utf-8?B?bjNVMzFsUU5QSUI5aHZESGt0UmpwQkVnSE8xSktKTU81U1NQYjNmbGQyclhF?=
 =?utf-8?B?aUZ0eU1IYTVTelhJcDlkNUhrMGNJazFxSU1PMmFGeXlpRjkrWHRjRXNxRmFi?=
 =?utf-8?B?QWxzSkxwVGpPQy93UXJLeDBjOVNVc3Ewa1NDeEM2TVNLRHBPT2JNd1IwMk5N?=
 =?utf-8?B?b3ZSMnlsRkZsTHNZRTd1MW12bFRTV01vQmRPKzhBbFowTTBnUnZaQWFTdGtw?=
 =?utf-8?B?dEFvVHVCdGsrSG51UTMranQzVkJKT25ZZ0x5Y2lqd05zSkpWVEtvaXJ4eVA2?=
 =?utf-8?B?WjZwY2JPRzZCY2NRR0huc1BGTWtPZ3NYSEQ5UTlFVi92aFRrOStjdTlSaS8y?=
 =?utf-8?B?Z1doVEUwRk5UdXVhUkdFNzZ0SWlGdDdKTUZUNStDdGlNV3BnQjRkWDBPWHZK?=
 =?utf-8?Q?X+MUdS7qfs5B33CQeOnM7ttr2?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C2CB33AC847C5349B95EDE6746195B72@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45ccec5b-2710-424c-da13-08db60529842
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2023 14:40:06.1118 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NGCvphQ2XJpcfgxjZY2YviLI1kFNz3k8lu7IrwiSiONWS6y1YJnPU8x1vRU0Ctc2AgDO6Fx//sUBwo+0o5Algw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7730
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/3] drm/xe: Disable interruptable wait on
 xe_bo_move()
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

T24gTW9uLCAyMDIzLTA1LTI5IGF0IDEyOjMxICswMjAwLCBUaG9tYXMgSGVsbHN0csO2bSB3cm90
ZToKPiBPbiBNb24sIDIwMjMtMDUtMjkgYXQgMTA6NTkgKzAyMDAsIFRob21hcyBIZWxsc3Ryw7Zt
IHdyb3RlOgo+ID4gT24gRnJpLCAyMDIzLTA1LTI2IGF0IDEyOjA2IC0wNzAwLCBKb3PDqSBSb2Jl
cnRvIGRlIFNvdXphIHdyb3RlOgo+ID4gPiBBbGwgdGhlIFhlIHVzZXJzIG9mIGRtYV9yZXN2X3dh
aXRfdGltZW91dCgpIGFsc28gZGlzYWJsZSB0aGUKPiA+ID4gaW50ZXJydXB0YWJsZSB3YWl0Lgo+
ID4gPiBBbmQgZG9pbmcgc28gdGhpcyBhdm9pZHMgRFJNX0lPQ1RMX1hFX0VYRUMgZmFpbHMgd2hl
biB1bmRlciBtZW1vcnkKPiA+ID4gcHJlc3N1cmUuCj4gPiAKPiA+IEludGVycnVwdGlibGUgd2Fp
dHMgYXJlIGNydWNpYWwgZm9yIHNpZ25hbCBkZWxpdmVyeSBsYXRlbmN5IGFuZCBmb3IKPiA+IHVz
ZXIgZXhwZXJpZW5jZSAoYmVpbmcgYWJsZSB0byBjdHJsLWMgYXdheSBmcm9tIHNvbXRldGhpbmcg
dGhhdCBpcwo+ID4gc3R1Y2spLgo+ID4gCj4gPiBVbmludGVycnVwdGlibGUgd2FpdHMgc2hvdWxk
IG9ubHkgZXZlciBiZSB1c2VkIGluIHNpdHVhdGlvbnMgd2hlcmUKPiA+IGl0J3MKPiA+IGltcG9z
c2libGUgdG8gcmVjb3ZlciBmcm9tIGFuIGVycm9yLCBsaWtlIGluIGVycm9yIG9yIHBvc3NpYmx5
Cj4gPiBkZXN0cnVjdGlvbiBwYXRocy4KPiA+IAo+ID4gSW4gdGhpcyBjYXNlIGV4ZWNidWYgc2hv
dWxkIGJlIGFibGUgdG8gaGFuZGxlIHRoZSAtRUlOVFIgcmV0dXJuZWQKPiA+IGZyb20KPiA+IHRo
ZSBpb2N0bCBhbmQgcmVzdGFydC4gSWYgaXQgZG9lc24ndCB0aGVyZSdzIGFuIGVycm9yIGVsc2V3
aGVyZS4KPiA+IAo+ID4gQnV0IE1hYXJ0ZW4gaGFkIGEgcGF0Y2ggdG8gcmV0dXJuIHRoZSByZWFs
IGVycm9yIGNvZGUgcmF0aGVyIHRoYW4KPiA+IHJld3JpdGluZyBpdCB0byAtRVRJTUUuCgpUaGlz
IHBhdGNoPyBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvcGF0Y2gvNTM5NjMzLz9z
ZXJpZXM9MTE4NDI4JnJldj0xCgpUaGlzIHdvdWxkIGNhdXNlIGl0IHRvIHJldHVybiBFUkVTVEFS
VFNZUyB0byB1c2VyLXNwYWNlLgoKPiA+IAo+ID4gL1Rob21hcwo+IAo+IFVwb24gY2xvc2VyIGlu
c3BlY3Rpb24gb2YgdGhlIGNvZGUsIHRoYXQgYm9vbCBub3cgc2V0IHRvIHRydWUgc2hvdWxkCj4g
cmVhbGx5IGJlIGN0eC0+aW50ZXJydXB0aWJsZS4gU3RpbGwgTWFhcnRlbidzIHBhdGNoIHdvdWxk
IGJlIG5lZWRlZCB0bwo+IGF2b2lkIHRoZSAtRVRJTUUgcmV3cml0ZSwgdGhvdWdoLgo+IAo+IC9U
aG9tYXMKPiAKPiAKPiA+IAo+ID4gCj4gPiAKPiA+ID4gCj4gPiA+IExpbms6IGh0dHBzOi8vZ2l0
bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0veGUva2VybmVsLy0vaXNzdWVzLzIzOQo+ID4gPiBDYzog
VGhvbWFzIEhlbGxzdHLDtm0gPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPgo+ID4g
PiBDYzogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNv
bT4KPiA+ID4gU2lnbmVkLW9mZi1ieTogSm9zw6kgUm9iZXJ0byBkZSBTb3V6YSA8am9zZS5zb3V6
YUBpbnRlbC5jb20+Cj4gPiA+IC0tLQo+ID4gPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9iby5j
IHwgMiArLQo+ID4gPiDCoDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlv
bigtKQo+ID4gPiAKPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9iby5j
Cj4gPiA+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2JvLmMKPiA+ID4gaW5kZXggMGRiOWMwNTA5
N2QwNy4uNmVkN2UwODI2OWU4MiAxMDA2NDQKPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hl
L3hlX2JvLmMKPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2JvLmMKPiA+ID4gQEAg
LTYwOSw3ICs2MDksNyBAQCBzdGF0aWMgaW50IHhlX2JvX21vdmUoc3RydWN0IHR0bV9idWZmZXJf
b2JqZWN0Cj4gPiA+ICp0dG1fYm8sIGJvb2wgZXZpY3QsCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgbmV3X21lbS0+bWVtX3R5cGUgPT0gWEVfUExfU1lTVEVNKSB7Cj4gPiA+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgbG9uZyB0aW1lb3V0ID0gZG1hX3Jlc3Zfd2FpdF90aW1l
b3V0KHR0bV9iby0KPiA+ID4gPiBiYXNlLnJlc3YsCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgCj4gPiA+IERNQV9SRVNWX1VTQUdFX0JPT0tLRUVQ
LAo+ID4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHRy
dWUsCj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
ZmFsc2UsCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgCj4gPiA+IE1BWF9TQ0hFRFVMRV9USU1FT1VUKTsKPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqBpZiAodGltZW91dCA8PSAwKSB7Cj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldCA9IC1FVElNRTsKPiA+IAo+IAoK
