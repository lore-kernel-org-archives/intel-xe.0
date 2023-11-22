Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 219EDC61D9B
	for <intel-xe@archiver.kernel.org>; Wed, 22 Nov 2023 17:28:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF0B710E09D;
	Wed, 22 Nov 2023 17:28:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CE8C10E09D
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Nov 2023 17:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700674098; x=1732210098;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=JOgWTJC9DFuYaLZFXjhQCW4HqG3gaLLE5sKGaW6MEbA=;
 b=LeOzWlkPw4+vo8eb8EcEcBZfS+rbdcdFKAJNJjrNb8vAXHyi+cSdd0jx
 neoDoau4msqVmGZoUjfPdGiVhyeESMZoktiackVWm0Pex62OSji5kkplk
 ybU9+7hLCrDjM9NInTkxqhhKtGMPG0QTyOasKauZR04uhmRbiCnlYyoyB
 tnKAKzpWrUzg0Fiz39ByAHSZmb2tvPExZQ9k0e+RFltuw8cUFkYmBfPDs
 ajiQCpoG4YmzjpqR9kvLNsubm/Dam1C5Ibyq8bemgQFcUTYOjuUcNCoMX
 ucBfa/cWjMECrnymbHpPFVvFw38XuqZSdi1dbSY5+l1jaMzABM0bJJkOQ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="13648981"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; d="scan'208";a="13648981"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2023 09:28:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; 
   d="scan'208";a="8559810"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Nov 2023 09:28:18 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 22 Nov 2023 09:28:17 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 22 Nov 2023 09:28:16 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 22 Nov 2023 09:28:16 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 22 Nov 2023 09:28:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GNBeOGOEdcoQV+WS/kqOgaFiSG/L6SSCGZhBiI9mW5/YJV5Vv33UUjaL8LeLxTOao85XJD16tc6mhzeIu0frt1JQ5RLWD7rwmP2KrWHDT5QFUxCLqffN7wqmrhBVAniBsXquECA26IjRpRKKZR3qKVUg7MTbL6cN+sM9R4rJwzjtWZpB1mVchTkVFPqFZQRzYRnMe1OXFYYM8wX8agVaf4DBEUEcHBJShnWWiALWNqUShCNsravIDf7XWeuxVEu57aAgik8JYrhUYcGjKC/RIm5ef2orhQ/pIwMLE9/nSLJfQwqF2UxJ50Y7SlYTsaSYd8uMjBsJB7v+Idxz3jQykg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JOgWTJC9DFuYaLZFXjhQCW4HqG3gaLLE5sKGaW6MEbA=;
 b=M2A4Fm8P5EMcQqw7mUXEAPlF/PubcLN7hWl7xDoOBEK06+h1jY1s95diLKEySl5+4UrOsGuY9njv0fczyngvmTgBPCc2cz58pRDmMoodA0nrV3+a9BQ1Br9VMgpsbkRMKeClJ1tDM3MGmEuWfU+iFVXwS1YQq3vvwLrtv3xqb0NHOMSGuJc+rNV2dRAqB3L3ajdGM3fRYUIlGarKsMwh2KT8C736w5Hc0tVOeADpbHO1k+zRdpCu0nZ9mNeDN24cu87r4Y6IKxI2d4Nqg+FE5UNAPJfjJgMBMfmvoJr0Ow5DRHhesRfr40TYze2/5fNQhedxnS4dYqDBuTrkaMnl+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7864.namprd11.prod.outlook.com (2603:10b6:208:3df::14)
 by CH3PR11MB7794.namprd11.prod.outlook.com (2603:10b6:610:125::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.18; Wed, 22 Nov
 2023 17:28:14 +0000
Received: from IA0PR11MB7864.namprd11.prod.outlook.com
 ([fe80::2341:5d0e:a1b0:c7c8]) by IA0PR11MB7864.namprd11.prod.outlook.com
 ([fe80::2341:5d0e:a1b0:c7c8%2]) with mapi id 15.20.7002.028; Wed, 22 Nov 2023
 17:28:14 +0000
From: "Grzegorzek, Dominik" <dominik.grzegorzek@intel.com>
To: "mika.kuoppala@linux.intel.com" <mika.kuoppala@linux.intel.com>,
 "andi.shyti@linux.intel.com" <andi.shyti@linux.intel.com>
Thread-Topic: [Intel-xe] [RFC 03/25] drm/xe/eudebug: Introduce exec_queue
 events
Thread-Index: AQHaEKOEcs+0toWelUGaWbqiQ9KTXLCGmD+AgAAZAYA=
Date: Wed, 22 Nov 2023 17:28:14 +0000
Message-ID: <01ccd1935007538ed2a7b0347476e8c5ecb447b9.camel@intel.com>
References: <20231106111845.2333093-1-mika.kuoppala@linux.intel.com>
 <20231106111845.2333093-4-mika.kuoppala@linux.intel.com>
 <ZV4lMfD0b37rhb7j@ashyti-mobl2.lan>
In-Reply-To: <ZV4lMfD0b37rhb7j@ashyti-mobl2.lan>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7864:EE_|CH3PR11MB7794:EE_
x-ms-office365-filtering-correlation-id: 7fd938f5-43ec-4c91-cd18-08dbeb806862
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OOC25t1Y9HgDZrc9QYJjgsEqXoJkwLyfSIWu7BxjJc7O7cTRqbJDT98L6dA5tAodvCjY8Gy5oQWbMP4a9T7PWTXk/+xBqNvRcqHXPFbHU2OveCGehXklR6UEOKrFlsw+XVXdrMInCZP5ZZCYjtmVp8ho0y0ASw5cadteTQqGL/D1DI6ftbI3s+BNDXN2/jQ4+2M2urna0Bby3hM04OzDcYOml9jVYa5V28C/chRefsFZQoalqLWG0p248Fz3AAGvwso2XeL3fxuLNYqa2pD1B5kdQuXz3Kxqn82OO2/DhQqlKYcsQOtHbWJIrpojFZBHwOsXRltTP8gJ7bLQ/VuUSEc7i8tJn8FHyjoXvPz38hHVgA/ZhyjBasJ7D+TWWMhgkiiAUy3m72AB1j8DNBfwn0Qg28CZiXY96HxOQc+apndhyhk0OO+dPH7GQk5DevrTKZg8TuOscZOXL3eAPD0qfTmvIIDw9P587dBrTIgOrYvpQNbVvH3BI2alG9QDaWCSfCtcUSCNv/jHTcqYmjdZTwvssyT8JXZqTJVwp7/XG5CqKE3RFwez5Pxc+QpWA4J3KjNWMfgudqSy/H9/1zyXSGm5lZmYHXpMDLRMI8Ln11yn4QZ4sGiKVCJDo0467BoU
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7864.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(136003)(346002)(376002)(39860400002)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(4001150100001)(8676002)(5660300002)(8936002)(4326008)(41300700001)(2906002)(66556008)(64756008)(110136005)(66476007)(66446008)(76116006)(91956017)(66946007)(316002)(86362001)(26005)(38070700009)(71200400001)(6486002)(6512007)(36756003)(2616005)(6506007)(122000001)(478600001)(38100700002)(82960400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Wk41WlJKaHFtRG5GRTRoUUtaMGdBTi8rbjlEeDJSMDA0alg0elVUNUxDRkpw?=
 =?utf-8?B?bDhxbjRucDNHY2huQ1U0RzM1SGo2bUJLWFVINjVYS211aUZpMmp3TU9VWUZq?=
 =?utf-8?B?MlNYOFduUko1NEFFVHlyQnBtQ2pLL2lVM0hlcFBlOGFBdkFLUnIyRDVhVHhI?=
 =?utf-8?B?TkRmQ0Y1MHdrRHN6ZFNwZGNLSGJCV2Z3d3FZYnd4OFBkN3VMYVFYdTVKNk1L?=
 =?utf-8?B?ZzlzL0hhelppREJSc3BkMGtZczVWR3dWVXc1ZiswMjdPUm5Ua3N1ZXRNaW9w?=
 =?utf-8?B?T1VPKzdlSEFKckc5cG9FbnEyWXZhZUJSUlNrb2pMejhjeXhPWjFUNFFOVXBO?=
 =?utf-8?B?MmdqWFhnZ2tDbVZGbVg5LzdMV0NONHJISHdJWGdLUnkzN2Fsb0UvYVZGNzRj?=
 =?utf-8?B?bHlKNUlieUJ5QzQwWGIvYUZSbW9PaGxPU2tqa2NIV1NCWThuTVlsRWRoUVhU?=
 =?utf-8?B?OGNvSk41alAzWG13ekE0bURySVdUc1BBQmRNV2lYaFJPWEZFemUra2MyWWVV?=
 =?utf-8?B?VXFleWl5ci9RUVpKdmE5M05GeURtUjZXYUtUWlNGZUV2dlZKRjBLRzVwaVdm?=
 =?utf-8?B?Y0FiQnEveDlIRE54eEJYSjFEZjJHMXdPcThNb3NEM1laTGk5ZnFlZVZPS3R3?=
 =?utf-8?B?Z1FsaWNtcCt0b21XUEFtWWpVd3QveHdVelNxK0RBWVVxem80MlgyampqcW1h?=
 =?utf-8?B?Z2M2WmRVU0dEenJvZkN1L041RmtIMnlpRkVsaUtRMVBQOFBMS2p3eUNLcE56?=
 =?utf-8?B?NWU1OWhOTW53NDVwREFJcHFoSnhzbDBtODdpbXZ4VkQvSjh2dkhjcWhXTkpO?=
 =?utf-8?B?MUIwQjNsa3N3aHFMOVRDajdLcGhVZG5EbXk4NjhlTE9INXd0aUh1YnIyUTVu?=
 =?utf-8?B?ZWxPSHpmaDhBeXhHM0dtS1QwK3RMNE1Bb3U4dTdpVHg2dnVhNnh5ZngraTZD?=
 =?utf-8?B?SjZrT2s5d1VnSFcyeTlMTjBUbVZUbE9BK2RvTVNRSWdBT0dzWHczUktzcmRi?=
 =?utf-8?B?NHZLbzdnYjFFZUlyZ0JoTDZNSmxieXdCVWRjbmFmOGF3cEVmV1dBTUQ0OE4v?=
 =?utf-8?B?SDVHSFEwelBCOGU5ZEZyZG55NE9rNlN3eEZOT2hob1ZTUjIrYUVId1d5WVVS?=
 =?utf-8?B?SDd2Ly90NmJ5TEFFRmE0Mmp0cjFieDZUUDk1VHZkRWo4Z3pQMlAybWxnYzVZ?=
 =?utf-8?B?eGQ3a1V5Q0hRNzVzY0tzU2FoTXZXWjV6ekQ1cW1kekt2MWVVRXdTTHdrRWdY?=
 =?utf-8?B?YkFRcEdpWjgreVQrR1l4K1BMZ0dWWTZBU29ieGdob3BBR0RLbHM5SXExcFNm?=
 =?utf-8?B?UE9mcnI4Tk1qV2NqNWI1Z0pGUDhHYUFhcE1GaWhUd0hPeXRnVHNJT3plUkE3?=
 =?utf-8?B?SVpPVHBiY3FxdmV1NGhEVUtML3psY08rN2h3NnR0d3ZXaTN6am9Vd3RrZWNN?=
 =?utf-8?B?Y2hzak5SdEVCMWVCaEo2ZTdXdHBBTlE3dEVxMjlyZEVzaVpTOEQyQUk2YkhR?=
 =?utf-8?B?OWRDTlU2blJVMDhBcGVrR2hpSDNGejFMVTlGTVJuTXRBM0pRblJjNzhMRUJ3?=
 =?utf-8?B?NkhoNkpSTXZoZWFYNTFkNW9QRmtKOGZDaS9ObjkyVlhzeWcvd3FTSlRRcG56?=
 =?utf-8?B?U3RPTXJDMCtnTDkrYlVzQ1VNV3BlNVBOODlBWGdkcnZVeDlIcU43ZFBYUVF1?=
 =?utf-8?B?TzhwWG1WT2N5Tlo1UHRrU0tERjJGejBaOG00TzJUUFpaNUs1SHpOZEM0RVdr?=
 =?utf-8?B?OFljS3pMS1BiNTUwd1ZkSDZnc28yMTl5UzcxeTR5eHZQSzdEK2ZaQUJDTzUy?=
 =?utf-8?B?Q2tFNC9MM2ZQODNzZk1zbk00VVNmL0N1alpmYlRKbFEzWWo2Y3pKU0ptMHJB?=
 =?utf-8?B?SHhYQWJqamZlTmR1RURHM1VyN2ZvanBQN3piV24zWloxZnhWRDdPZUhaMWNz?=
 =?utf-8?B?clphY2xnbXphbXFGM3Z2OUVKRjI4QlA2NTZtcVNXMzZUREo0b1g4UGx2eHZz?=
 =?utf-8?B?azVXMTkxc3BPQzRGbmIrMDI1MGpVS01xZ3U0MllHVDFIR2wzSFVuZmZHd2hN?=
 =?utf-8?B?NUhWZ05WZ1JjelgyNFFCYlVIVGgzYzlldUYwVGU3ZGdRMjI0RHhaK1h0ZW0x?=
 =?utf-8?B?REtzRklqbVViNVFQeWd6SEVQd3VvdFpOcmJ1V0I1aHNjR0Q0OEdDTGtSTXlN?=
 =?utf-8?Q?i9796/1jv/Uo8ps0YnHiR+s=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F0521F2BA1328047AB4B187D37077C0D@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7864.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fd938f5-43ec-4c91-cd18-08dbeb806862
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2023 17:28:14.2524 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WQQzQ04imHdiB37iT2yQkMH9A3vuO7/u56cvEY3t94uQFdVXTff1hx+U7F0mAE7I7s279oxZXQPhf7gEJY5SbpZYuN+iwa9hBBGC42i0InA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7794
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC 03/25] drm/xe/eudebug: Introduce exec_queue
 events
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

SGkgQW5kaSENCg0KT24gV2VkLCAyMDIzLTExLTIyIGF0IDE2OjU4ICswMTAwLCBBbmRpIFNoeXRp
IHdyb3RlOg0KPiBIaSBEb21pbmlrIGFuZCBNaWthLA0KPiANCj4gT24gTW9uLCBOb3YgMDYsIDIw
MjMgYXQgMDE6MTg6MjNQTSArMDIwMCwgTWlrYSBLdW9wcGFsYSB3cm90ZToNCj4gPiBGcm9tOiBE
b21pbmlrIEdyemVnb3J6ZWsgPGRvbWluaWsuZ3J6ZWdvcnpla0BpbnRlbC5jb20+DQo+ID4gDQo+
ID4gSW50cm9kdWNlIGV4ZWNfcXVldWUgZXZlbnRzLg0KPiANCj4gSSBsb3ZlIGV4ZWNfcXVldWVz
LCBJIGxvdmUgdGhlbSBtb3JlIHdoZW4gdGhleSBhcmUgcHJvcGVybHkNCj4gaW50cm9kdWNlZC4N
Cg0KRmFpci4NCj4gDQo+ID4gU2lnbmVkLW9mZi1ieTogRG9taW5payBHcnplZ29yemVrIDxkb21p
bmlrLmdyemVnb3J6ZWtAaW50ZWwuY29tPg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTWlrYSBLdW9w
cGFsYSA8bWlrYS5rdW9wcGFsYUBsaW51eC5pbnRlbC5jb20+DQo+IA0KPiB3aGljaCBkb2Vzbid0
IHByZXZlbnQgeW91IGZyb20gcmV2aWV3aW5nIHRoaXMgcGF0Y2guDQo+IA0KPiAuLi4NCj4gDQo+
ID4gK3N0YXRpYyBpbnQgZXhlY19xdWV1ZV9jcmVhdGVfZXZlbnQoc3RydWN0IHhlX2V1ZGVidWcg
KmQsDQo+ID4gKwkJCQkgICBzdHJ1Y3QgeGVfZmlsZSAqeGVmLCBzdHJ1Y3QgeGVfZXhlY19xdWV1
ZSAqcSkNCj4gPiArew0KPiA+ICsJaW50IGhfYywgaF92bSwgaF9xdWV1ZTsNCj4gPiArCXU2NCBo
X2xyY1tYRV9IV19FTkdJTkVfTUFYX0lOU1RBTkNFXTsNCj4gPiArCWludCBpOw0KPiA+ICsNCj4g
PiArCWhfYyA9IGZpbmRfaGFuZGxlKGQtPnJlcywgWEVfRVVERUJVR19SRVNfVFlQRV9DTElFTlQs
IHhlZik7DQo+ID4gKwlpZiAoaF9jIDwgMCkNCj4gPiArCQlyZXR1cm4gaF9jOw0KPiA+ICsNCj4g
PiArCWhfdm0gPSBmaW5kX2hhbmRsZShkLT5yZXMsIFhFX0VVREVCVUdfUkVTX1RZUEVfVk0sIHEt
PnZtKTsNCj4gPiArCWlmIChoX3ZtIDwgMCkNCj4gPiArCQlyZXR1cm4gaF92bTsNCj4gPiArDQo+
ID4gKwloX3F1ZXVlID0geGVfZXVkZWJ1Z19hZGRfaGFuZGxlKGQsIFhFX0VVREVCVUdfUkVTX1RZ
UEVfRVhFQ19RVUVVRSwgcSk7DQo+ID4gKwlpZiAoaF9xdWV1ZSA8IDApDQo+ID4gKwkJcmV0dXJu
IGhfcXVldWU7DQo+ID4gKw0KPiA+ICsJZm9yIChpID0gMDsgaSA8IHEtPndpZHRoOyBpKyspIHsN
Cj4gPiArCQlpbnQgaCA9IHhlX2V1ZGVidWdfYWRkX2hhbmRsZShkLA0KPiA+ICsJCQkJCSAgICAg
IFhFX0VVREVCVUdfUkVTX1RZUEVfTFJDLA0KPiA+ICsJCQkJCSAgICAgICZxLT5scmNbaV0pOw0K
PiANCj4gcGxlYXNlLCBpbXBvcnRhbnQgYXNzaWdubWVudHMgbmVlZCB0byBiZSBzZXBhcmF0ZSBm
cm9tIHRoZQ0KPiBkZWNsYXJhdGlvbi4NCj4gDQo+ID4gKwkJaWYgKGggPCAwKQ0KPiA+ICsJCQly
ZXR1cm4gaDsNCj4gPiArDQo+ID4gKwkJaF9scmNbaV0gPSBoOw0KPiA+ICsJfQ0KPiA+ICsNCj4g
PiArCS8qIE5vIG5lZWQgdG8gY2xlYW51cCBmb3IgYWRkZWQgaGFuZGxlcyBvbiBlcnJvciBhcyBp
ZiB3ZSBmYWlsDQo+ID4gKwkgKiB3ZSBkaXNjb25uZWN0DQo+ID4gKwkgKi8NCj4gDQo+IHRoaXMg
Y29tbWVudCBpcyBtaXNwbGFjZWQgYW5kIG5vdCBwcm9wZXJseSBmb3JtYXR0ZWQuDQo+IA0KPiBB
bnl3YXksIGZvciAtRUVYSVNUIGFuZCAtRU5PVENPTk4sIHlvdSBkb24ndCByZWFsbHkgZmFpbCwg
SSB0aGluaw0KPiB0aG9zZSBuZWVkIHRvIGJlIGNoZWNrZWQgYW5kIHRyZWF0ZWQgc2VwYXJhdGVs
eS4gSWYgLUVFWElTVCwgSQ0KPiBiZWxpZXZlIHRoZSBjb3JyZWN0IGJlaGF2aW9yIHNob3VsZCBi
ZSAnY29udGludWUnLCByYXRoZXIgdGhhbg0KPiAncmV0dXJuJy4NCg0KSXNuJ3QgdGhhdCBhbHJl
YWR5IGhhbmRsZWQgaW4geGVfZXVkZWJ1Z19leGVjX3F1ZXVlX2NyZWF0ZT8gSW4gZmFjdCwgDQpp
ZiByZXNvdXJjZSBleGlzdHMgd2UgZG8gY29udGludWUsIHdlIGp1c3QgZG8gbm90IHNlbmQgYW4g
ZXZlbnQgdHdpY2UuDQoNCllvdSBhY3R1YWxseSBtYWRlIG1lIHRoaW5rIGlmIHdlIHNob3VsZG4n
dCBiZSBtb3JlIHJhZGljYWwgYW5kIGRpc2Nvbm5lY3QgaWYgc3RowqANCmFscmVhZHkgZXhpc3Rz
IGluIG91ciByZXNvdXJjZSB0cmFja2luZy4gDQo+IA0KPiA+ICsJcmV0dXJuIHNlbmRfZXhlY19x
dWV1ZV9ldmVudChkLCBEUk1fWEVfRVVERUJVR19FVkVOVF9DUkVBVEUsDQo+ID4gKwkJCQkgICAg
IGhfYywgaF92bSwgaF9xdWV1ZSwgKHUxNilxLT5jbGFzcywNCj4gPiArCQkJCSAgICAgcS0+d2lk
dGgsIGhfbHJjKTsNCj4gPiArfQ0KPiA+ICsNCj4gPiArc3RhdGljIGludCBleGVjX3F1ZXVlX2Rl
c3Ryb3lfZXZlbnQoc3RydWN0IHhlX2V1ZGVidWcgKmQsDQo+ID4gKwkJCQkgICAgc3RydWN0IHhl
X2ZpbGUgKnhlZiwgc3RydWN0IHhlX2V4ZWNfcXVldWUgKnEpDQo+ID4gK3sNCj4gPiArCWludCBo
X2MsIGhfdm0sIGhfcXVldWU7DQo+ID4gKwl1NjQgaF9scmNbWEVfSFdfRU5HSU5FX01BWF9JTlNU
QU5DRV07DQo+ID4gKwlpbnQgaTsNCj4gPiArDQo+ID4gKwloX2MgPSBmaW5kX2hhbmRsZShkLT5y
ZXMsIFhFX0VVREVCVUdfUkVTX1RZUEVfQ0xJRU5ULCB4ZWYpOw0KPiA+ICsJaWYgKGhfYyA8IDAp
DQo+ID4gKwkJcmV0dXJuIGhfYzsNCj4gPiArDQo+ID4gKwloX3ZtID0gZmluZF9oYW5kbGUoZC0+
cmVzLCBYRV9FVURFQlVHX1JFU19UWVBFX1ZNLCBxLT52bSk7DQo+ID4gKwlpZiAoaF92bSA8IDAp
DQo+ID4gKwkJcmV0dXJuIGhfdm07DQo+ID4gKw0KPiA+ICsJaF9xdWV1ZSA9IHhlX2V1ZGVidWdf
cmVtb3ZlX2hhbmRsZShkLA0KPiA+ICsJCQkJCSAgIFhFX0VVREVCVUdfUkVTX1RZUEVfRVhFQ19R
VUVVRSwNCj4gPiArCQkJCQkgICBxKTsNCj4gPiArCWlmIChoX3F1ZXVlIDwgMCkNCj4gPiArCQly
ZXR1cm4gaF9xdWV1ZTsNCj4gPiArDQo+ID4gKwlmb3IgKGkgPSAwOyBpIDwgcS0+d2lkdGg7IGkr
Kykgew0KPiA+ICsJCWludCBoID0geGVfZXVkZWJ1Z19yZW1vdmVfaGFuZGxlKGQsDQo+ID4gKwkJ
CQkJCSBYRV9FVURFQlVHX1JFU19UWVBFX0xSQywNCj4gPiArCQkJCQkJICZxLT5scmNbaV0pOw0K
PiA+ICsNCj4gPiArCQlpZiAoaCA8IDApDQo+ID4gKwkJCXJldHVybiBoOw0KPiANCj4gd2h5IG5v
dCBjb250aW51ZT8NCj4gDQo+IEFuZGkNCkJlY2F1c2Ugd2UgY2FuJ3Qgc2VuZCB2YWxpZCBkZXN0
cm95IGV2ZW50LCBzbyB3ZSBkaXNjb25uZWN0LiBJZiB3ZSBlbmQgdXAgaW4gc2l0dWF0aW9uIHdo
ZXJlIHRoZXJlDQppcyBleGVjX3F1ZXVlIHdpdGggbHJjIG1pc3NpbmcsIGl0IG1lYW5zIHdlIGFy
ZSBhbHJlYWR5IGluIGFuIGludmFsaWQgc3RhdGUuIA0KDQpNYW55IHRoYW5rcywNCkRvbWluaWsN
Cj4gDQo+ID4gKwkJaF9scmNbaV0gPSBoOw0KPiA+ICsJfQ0KPiA+ICsNCj4gPiArCXJldHVybiBz
ZW5kX2V4ZWNfcXVldWVfZXZlbnQoZCwgRFJNX1hFX0VVREVCVUdfRVZFTlRfREVTVFJPWSwNCj4g
PiArCQkJCSAgICAgaF9jLCBoX3ZtLCBoX3F1ZXVlLCAodTE2KXEtPmNsYXNzLA0KPiA+ICsJCQkJ
ICAgICBxLT53aWR0aCwgaF9scmMpOw0KPiA+ICt9DQoNCg==
