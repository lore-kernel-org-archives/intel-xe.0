Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45EEEC71153
	for <intel-xe@archiver.kernel.org>; Mon,  4 Sep 2023 20:25:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8C7C10E3FF;
	Mon,  4 Sep 2023 20:25:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C30210E3FF
 for <intel-xe@lists.freedesktop.org>; Mon,  4 Sep 2023 20:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693859147; x=1725395147;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=BQ2IZluN91rq38BQrxloiE+laPBkIR2LiGBFcurDGpw=;
 b=m5pBdz5DLXlEn4Xyyr1Jj9T6xMMW2HXcnFyyqEpdjidQ+X4RvpBvRuze
 4y9T1GId0QaQMBUrO9h9+nMnQCO74mYA4bBWe80eUXYaxZuTMNckoEbH4
 G9WjlDpGyCDdFR8i/KHwx/mVkAHeQ2Rwt/lY2/RdICy8IomLS4qQ2/jCU
 RyZfg8FX58a/zcyOoprDM4MG5H/c1W1pbLWYn7pODYO68Sv8nNpAb4tHP
 z4cc1CPx/ty/OuxclKdJZE+xvXXswepee1pqMGucnSFS+LIqTf+omTEQE
 aKMY3n368ZjbwdM+1y1CTJqVrxPjiROJaNAH3ddHOIHZD7wbGMEvMmpbX A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="361687671"
X-IronPort-AV: E=Sophos;i="6.02,227,1688454000"; d="scan'208";a="361687671"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2023 13:25:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="806357284"
X-IronPort-AV: E=Sophos;i="6.02,227,1688454000"; d="scan'208";a="806357284"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Sep 2023 13:25:46 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 4 Sep 2023 13:25:46 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 4 Sep 2023 13:25:46 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 4 Sep 2023 13:25:46 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.173)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 4 Sep 2023 13:25:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a7empKvsBBTX0rdZulRtcZIKioAw39yqAV4zhtUmc4dvVuX/n/y+NQ4QGea4a/C1cyuCrqqiMNlR3Qcg5ITEbNbIKOuQTIIjHPtx+9D2VR6RdU9UtS+VH5kfdoH468tAwhvnoVT7ARdoNTSuklLsadZER2l1m7vsrVUHhZfEfZSpMx02dgLwjBG7oOKArMnyy4S07YA4HeaZ+Jvy9OarfRhV2BVu1Vh2YG2usDuEKarEg7LU7/LlO6ZzLTMIneyxrixd6WjWRJD7l1IeLfuE4lDZ6iMnS/cY0WO/OwY4KlDjuryJJxSwlPoRx0BR4Jl6cSsgV6sx7V5g8AHRWpETig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BQ2IZluN91rq38BQrxloiE+laPBkIR2LiGBFcurDGpw=;
 b=M8mz1RSb7cq6jKekekbqMO2QCYlbI0Q+IsVJl5+/iFqK4/6dCpaJexrlQPAF7Ycr8r/fdHEo5HuyL0d4DbHBftdOAwgllRnDhgPLVjGwyKy115nPLRoLNTXBX1NYnuANBeE2dgA+NFcEi57CrN/7TRvM5j/uppn+ylj7AFyFtI6dqzp6mnxxNymTN2qFqptDZsmuMQUJKmnJdWRPfVngIMU/61y4bA917WiQHvDGv7BwKSoOwq+jS5yR2JisSDGa/r2MUGgmtgQxm89QKAXpwSpZKe6rGak6X8EzsVZ3H1Ze8VzHF1uYCxfHPsIl0VWo9GYARxWYKqqjTkb27kbJig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by PH0PR11MB5205.namprd11.prod.outlook.com (2603:10b6:510:3d::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33; Mon, 4 Sep
 2023 20:25:44 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::8e21:274a:64d1:5de]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::8e21:274a:64d1:5de%4]) with mapi id 15.20.6745.030; Mon, 4 Sep 2023
 20:25:44 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Auld, 
 Matthew" <matthew.auld@intel.com>
Thread-Topic: [Intel-xe] [RFC 0/5] PAT and cache coherency support
Thread-Index: AQHZ2pcHU5yliXY9TUO3swsyvmd14LALJsUA
Date: Mon, 4 Sep 2023 20:25:44 +0000
Message-ID: <d1518a22903a9275558861d0ccb7d269aa134148.camel@intel.com>
References: <20230829162840.73444-7-matthew.auld@intel.com>
In-Reply-To: <20230829162840.73444-7-matthew.auld@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|PH0PR11MB5205:EE_
x-ms-office365-filtering-correlation-id: 3a56871f-1fcc-4718-5289-08dbad851d87
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gugGAPgBtL0NGY/3FTimWfwrTeBHePDapkOCj7d8/kijhkKvD1G4E9MZaFRiOXgUtm0jOFEc0g/H59FfUYYalf8f79gPFtuNbp+wyFyNolDuK6glrGXo8ngn98amv+cX534nAu466e3RnvRQvtL9gEWmCjkDRDku+h4K5DpeOM/q+3/Jh1HPFpfwTeWpgAPkLMjZj6XJzG2887jDuYXdGlU5542LGyJKYhqx3BFX0lQrUxFUc/M/1a4D8uVlzBG/XNUDSDupIju1FoZzKO4LvqKHeMtwUBqSASKogp8dqAqsC3i5Oyo11uy9ShQa0GoUjvi8eb/JzA1zSj6/yBD6GmKSnI42k4UCWM+/Fgs/AxeLHf7njZThUiwIMG6pWmOBR/KZ+HYUYc5PI4K0B/Qu9F1iGFCHyEOc1HmX8pVeKsg4fs6exlNHfof8Mp3ghRVj2uTyrzw+o0Lr//kvkMXdVvWRsc7oCRmCua0fikSWFXRzjox+itY+uP4PceZuO70g9gzdM5nLPMRZOAn3j4nJDtglEAwLlom5qC5yDTfdErP69c8NPdubxgxxv9Tsa15Ooe3FVlDhpbCHOYVlCyEQI9/Gispfls77Wi0NCXL0g5E=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(366004)(376002)(136003)(346002)(1800799009)(186009)(451199024)(478600001)(966005)(71200400001)(91956017)(110136005)(66476007)(76116006)(66556008)(66946007)(66446008)(26005)(2616005)(64756008)(6486002)(6506007)(6512007)(8676002)(2906002)(6636002)(8936002)(316002)(41300700001)(5660300002)(86362001)(122000001)(82960400001)(38070700005)(38100700002)(36756003)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RWlXQldUSjdmT0F6UjNhYkFhQ2tncG9vNlgxQ1hQNHE0Tm5Oa0FpRTNsZHRl?=
 =?utf-8?B?Zk1yVjNSZzl4L095eGYwTXF3RkZOYVFQNGNrQWhwdmlOM1dwOWpCSXhjLzZk?=
 =?utf-8?B?d0srMzhaL1hGL1ZFOFNIRUg1UFhQTXNJYVAvVmhqY0YwTXFSTzJXQzV0VHFF?=
 =?utf-8?B?aUNzeTc0a1YyTHU1b3RpT2lQR1dsT3dIUzExbmduWitST05MdFp1WGd4a2kw?=
 =?utf-8?B?NjdnRElyajZ1bXgzUTM5ZjVnSzFtOGZWUFk3NmVDVytHdm16VEpLUmJlcEto?=
 =?utf-8?B?UE54N2x1SXVMZ2FMbGZ3VGlGcnJLZ1kybjg3Q0dzQnN0L0tiNnlNeVN1dWJK?=
 =?utf-8?B?dFU3SnV6OWRIckFvV3lCRjA1K0VsZkZ2d01BQzVzRDR5WncwZHpocC94ZmVs?=
 =?utf-8?B?K0FpaERSV2FjVGt0ZngxS2dMVitKeGFHU00rY00wd1NRdldoMGZ4Y2p1enU2?=
 =?utf-8?B?WHZpOUUwVTYwWmxLY3pjNC9oNnNoWEY1eFZoRDluOVVQSTVRZStHYTZvd3Vm?=
 =?utf-8?B?Mlh0NUVQUGc1d05oSXM3c0R4QWJWcUdCckNSTldpR25USXE5QmpIQkVWRFkw?=
 =?utf-8?B?SVJiQ0FhazR6S3J3c0MrVUlsWTdhUGk3eGNTNnd5TGlZUEFhK2JEdGY2R1V0?=
 =?utf-8?B?NjR5Ni85MWxDTmhsSUpUejNFTVMrUWZ2UmFSMDd3c3Z4SDQ0eWVUYWtjc1ps?=
 =?utf-8?B?V0o2THRqVUhBTTFyQWxsNHpXTDIyS1puVTlhczQ5NHRLK2d6SHVkY3pvRjZr?=
 =?utf-8?B?WndJYlZESlpmVUlXNzVMQlg4Y0tQOXR3NjBhWnVkVmJWbXp6ODJ2WUVQUUl1?=
 =?utf-8?B?RVo4NHpBSkxqd2ZleEd0cXU3S2lUYkJ1Z3N0aytHUUZKYjNBRlNDUkFiYWZN?=
 =?utf-8?B?NUpFa2k5TnlrdnZ4YkVVeE5OTmJqT3lNam4xeUFNaXZwNncvVzJ1TjVtNzBM?=
 =?utf-8?B?NVBla3VrU2RBTSt5WTFzcTRPSmRyLzFyZDZNeVdBWkVEN0ZibTFuclBESk8z?=
 =?utf-8?B?dUJaNzNlenViRk1IbnB5RGo3b3lyYW1QUzhvRlgrdmhMRVN0aUhza3ZkQTNC?=
 =?utf-8?B?RGpMNlcycXI5SnVmUmpZSkcvZkpCZWRXY00xbzViL2lPdTlHZjdWckV2VCtJ?=
 =?utf-8?B?QktGUTE5NzIwZTVvMDl5R09NZDdEWUw4ejRVaGN6SEQ5NTlhdUhGNk1nL1lC?=
 =?utf-8?B?bmdzeWNZeitqVWd1SzdYMWlWRERrU1cwdnpOcVRRSUcveE4zL1FvS2pLdWJ6?=
 =?utf-8?B?N2ZvQjZIRzRLVk9QZk40RDFydWxTVmJpWEtza2J6cjdDTmpRS2xya3htY0tP?=
 =?utf-8?B?V1NYMGVsR1NxaSt6b256YklyZGlOWDdLYndMa2tsNmJIcHpHN25hd3lySkky?=
 =?utf-8?B?VGF4dFBGY2lIY1R0c0JpSk5hZjZZODduemIvb0JwajRSd3IyZURvN01tdDFP?=
 =?utf-8?B?ak1MMnF0MUlqS2U3OHVIUXNzbmprc00zWHowOW9kL1VDSGJIVThCWCtpK0w2?=
 =?utf-8?B?aEExWUVwaVhhVFJJK243dDRUMXhCU1VyS3NxOG1BTjgwcXlvMmpVbWlDenlk?=
 =?utf-8?B?ZGNjbVNvRXk3NkF2UEcxNFdveCtBMU0wUlc3Vk1kWk9ONzVMNFJha29WTEp4?=
 =?utf-8?B?K056VjByazNoSG9lbUY2dUlRb3pvNW1xa1l3bGtpRktSYzNoV2RGU0oxVmlF?=
 =?utf-8?B?cVpxZ3ZUUitaWmhvbjJPNFlSVnlBb2ZRSEMramJTVm9KRkU3cDVnSFdyL3Fz?=
 =?utf-8?B?emp5UnMrcHpTblZwbW56cXVsOTdBK2kyTzlOUUJSR2JTdi9QVGxpZ0JVeDJz?=
 =?utf-8?B?TTdlcE5qSENBb3NIUDd3OUV3NDNXbExMRi9GYk9NQThVWmRIRHpvUmF6RzVJ?=
 =?utf-8?B?MzNVcW45cDd3WmNqYUhBT1E4V3I5VmlBQUpmR3R2QmlRTjdSTThicUlkajFT?=
 =?utf-8?B?WGlFcU1UcDZMMUZXTVBZeUk1YlJoNlpMWDF5NThmVXFDZnVMTDY4RDFzOHg3?=
 =?utf-8?B?SWh5aTQrRDJ2MTR4dm1PVHN5YWowUU14dXV6MmZ5ZlpwRUZtY2Vzejg1UUdm?=
 =?utf-8?B?eHdJREdCSXIwSGY4TDVGWFBaQWR1L1pFYnlTMzVDZml1Z2p6ZzcvSHZtZFNT?=
 =?utf-8?B?dlcraktkQ0dmdyswWks0VzN4dVJWMURqblFTL0pYVmxydktnVjdVNEN3Qk9q?=
 =?utf-8?B?d3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7E4B28DB4BD4EE4589139F2BBA21CD39@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a56871f-1fcc-4718-5289-08dbad851d87
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2023 20:25:44.0653 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NHWxVM2WrhZPpyVbWFc4w5h49wMlFziRX3sYRgdHdVEa86QXX9BP6Ct00Jvap3wAcj5ljdoxh6/sFphsXPjiUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5205
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC 0/5] PAT and cache coherency support
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

T24gVHVlLCAyMDIzLTA4LTI5IGF0IDE3OjI4ICswMTAwLCBNYXR0aGV3IEF1bGQgd3JvdGU6DQo+
IFNlcmllcyBzdGlsbCBuZWVkcyBidW5jaCBvZiB0ZXN0aW5nLCBidXQgc2VuZGluZyBhcyBSRkMg
dG8gZ2V0IGVhcmx5IGZlZWRiYWNrDQo+IHdoaWxlIHRoZSBJR1QgYml0cyBhcmUgYmVpbmcgd29y
a2VkIG9uLiBOb3RlIHRoYXQgdGhlIHNlcmllcyBhbHNvIGRpcmVjdGx5DQo+IGRlcGVuZHMgb24g
dGhlIFdJUCBzZXJpZXMgaGVyZTogaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nl
cmllcy8xMjI3MDgvDQoNCkxlZnQgc29tZSBjb21tZW50cyBpbiB0aGUgcGF0Y2hlcyBidXQgY2Fu
J3Qgc3RhcnQgZXhwZXJpbWVudGluZyBiZWNhdXNlIGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNr
dG9wLm9yZy9zZXJpZXMvMTIyNzA4LyBicmVha3MgZHJpdmVyIGxvYWQuDQp4ZV9wdGVfZW5jb2Rl
KCkgY2FsbHMgX19wdGVfZW5jb2RlKCkgd2l0aCBhIE5VTEwgdm1hLg0KDQo+IA0KPiBHb2FsIGhl
cmUgaXMgdG8gYWxsb3cgdXNlcnNwYWNlIHRvIGRpcmVjdGx5IGNvbnRyb2wgdGhlIHBhdF9pbmRl
eCB3aGVuIG1hcHBpbmcNCj4gbWVtb3J5IHZpYSB0aGUgcHBHVFQsIGluIGFkZHRpb24gdG8gdGhl
IENQVSBjYWNoaW5nIG1vZGUgZm9yIHN5c3RlbSBtZW1vcnkuIFRoaXMNCj4gaXMgdmVyeSBtdWNo
IG5lZWRlZCBvbiBuZXdlciBpZ3B1IHBsYXRmb3JtcyB3aGljaCBhbGxvdyBpbmNvaGVyZW50IEdU
IGFjY2VzcywNCj4gd2hlcmUgdGhlIGNob2ljZSBvdmVyIHRoZSBjYWNoZSBsZXZlbCBhbmQgZXhw
ZWN0ZWQgY29oZXJlbmN5IGlzIGJlc3QgbGVmdCB0bw0KPiB1c2Vyc3BhY2UgZGVwZW5kaW5nIG9u
IHRoZWlyIHVzZWNhc2UuICBJbiB0aGUgZnV0dXJlIHRoZXJlIG1heSBhbHNvIGJlIG90aGVyDQo+
IHN0dWZmIGVuY29kZWQgaW4gdGhlIHBhdF9pbmRleCwgc28gZ2l2aW5nIHVzZXJzcGFjZSBkaXJl
Y3QgY29udHJvbCB3aWxsIGFsc28gYmUNCj4gbmVlZGVkIHRoZXJlLg0KPiANCj4gVG8gc3VwcG9y
dCB0aGlzIHdlIGFkZGVkIG5ldyBnZW1fY3JlYXRlIHVBUEkgZm9yIHNlbGVjdGluZyB0aGUgQ1BV
IGNhY2hlDQo+IG1vZGUgdG8gdXNlIGZvciBzeXN0ZW0gbWVtb3J5LCBpbmNsdWRpbmcgdGhlIGV4
cGVjdGVkIEdQVSBjb2hlcmVuY3kgbW9kZS4gVGhlcmUNCj4gYXJlIHZhcmlvdXMgcmVzdHJpY3Rp
b25zIGhlcmUgZm9yIHRoZSBzZWxlY3RlZCBjb2hlcmVuY3kgbW9kZSBhbmQgY29tcGF0aWJsZSBD
UFUNCj4gY2FjaGUgbW9kZXMuICBXaXRoIHRoYXQgaW4gcGxhY2UgdGhlIGFjdHVhbCBwYXRfaW5k
ZXggY2FuIG5vdyBiZSBwcm92aWRlZCBhcw0KPiBwYXJ0IG9mIHZtX2JpbmQuIFRoZSBvbmx5IHJl
c3RyaWN0aW9uIGlzIHRoYXQgdGhlIGNvaGVyZW5jeSBtb2RlIG9mIHRoZQ0KPiBwYXRfaW5kZXgg
bXVzdCBtYXRjaCB0aGUgZ2VtX2NyZWF0ZSBjb2hlcmVuY3kgbW9kZS4gVGhlcmUgYXJlIGFsc28g
c29tZSBzcGVjaWFsDQo+IGNhc2VzIGxpa2Ugd2l0aCB1c2VycHRyIGFuZCBkbWEtYnVmLg0KPiAN
Cg0K
