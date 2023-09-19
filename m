Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33624CE79A8
	for <intel-xe@archiver.kernel.org>; Tue, 19 Sep 2023 17:19:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE80D10E148;
	Tue, 19 Sep 2023 17:19:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52D0710E148
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Sep 2023 17:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695143995; x=1726679995;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=Zrvjn4tO6vjwM4yMoGzS5Pk+geKs0sq1Go35FkaqQNQ=;
 b=nzZvSdX6FTb5iPZ1H6BtdZP14DXH0TPVQIsy85Esyvjk+RobtgINdGSm
 I6H90y1jp4WAvuh/3JmGdyEKYBfXMJVH5YXvkNtWTn/MFi5KQAbSJw0s3
 gc82gNxVO4NLWLywxL4ImWu/eak/5zkJSOp5c5VzEgq/zDYBzekn7U70n
 fac7PLZR9vCK4tUGvtEUeyFNvPfdTq1muICoucRL3f9TLxlp5WqJ6VZcH
 IKTbN7/Qh4boOogkZ9ImQEGVfj/Ce5q+o1Oe76fAHarUHmK8kstJ1RpaQ
 CgSYTeQMd3oQLaJNOPzfB6lWdb6gc2xfW8yrFEWMEiFUCLdWZOcMpexY2 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="410933752"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; d="scan'208";a="410933752"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 10:19:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="919954668"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; d="scan'208";a="919954668"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Sep 2023 10:19:53 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 19 Sep 2023 10:19:51 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 19 Sep 2023 10:19:51 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 19 Sep 2023 10:19:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b+kQy4hHASz3jR+3kLfBydtCrEHRQpprRTcLZYEnIXlerW+9DWtVJ/mgwllV5WhF86yCLhZIP2nHkE9Nf7rdyM8AxK1Zf14RpcpSJk/J69ZNRMaxdwEoYWwhps9JZkLRaki+gF253s53z8jFOfx2h/nfFCB6hstz9yilVwHukgQ+5FAPk3jkdwnz56SyCAAS2wb4Q4hFij8tHNaSh1Qh5v/Qom7DlwgnffwhkMh2rUrGSXdr21hV4v6LalytZnXfRacupG93rCIeNT/rO0CyChFRJLE/rTZbajbPAvaD3SxOVuNLzqCBx/0O+FIj6Eff3pQTZsQz4FVa6dN15WdSng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zrvjn4tO6vjwM4yMoGzS5Pk+geKs0sq1Go35FkaqQNQ=;
 b=M9T0wL7mllHNNDh8iipQEuVObL8jE1ceGhMwHMGIwn+/M/NN4i5Lj/2hYYNiplOi8nr+WzYLlc7cmLTsVtM2goJdABnDcchyDtD14UTjPq49qOxEuC+Qc07jJ7raWelRkko81mvh5Q+YXQnnnY5qiyknhYEPiN7rV2PXtsFaRgtnN81Vd6AXXQugSj8+sd1R8S9l2A+pfbO451niV7BLpcUMmMspKM9ZZg/2aVgIa5UGcHCVCJU/0OpOhd1xWj9TYndvkUlaov41NhAnvPUpUu2xVuS332wOtrQtbPzydB5DWDzZh9lTwGlgaYN4Jq1K5bOqoid649gO2co7ItmtNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by DS7PR11MB5989.namprd11.prod.outlook.com (2603:10b6:8:70::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Tue, 19 Sep
 2023 17:19:48 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::d6ef:5aaf:ef8f:5d47]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::d6ef:5aaf:ef8f:5d47%7]) with mapi id 15.20.6792.026; Tue, 19 Sep 2023
 17:19:48 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi, 
 Rodrigo" <rodrigo.vivi@intel.com>
Thread-Topic: [PATCH 00/17] uAPI Alignment - take 1
Thread-Index: AQHZ6wUYemL2XMv0mkqGAzDUaP2WkbAiZO4A
Date: Tue, 19 Sep 2023 17:19:48 +0000
Message-ID: <92fe98db3da08ef89dcfa749479ad7158f01a5c7.camel@intel.com>
References: <20230919142504.91652-1-rodrigo.vivi@intel.com>
In-Reply-To: <20230919142504.91652-1-rodrigo.vivi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|DS7PR11MB5989:EE_
x-ms-office365-filtering-correlation-id: 002fbf5d-2eed-4594-825a-08dbb934a078
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cyVNylX4ernMYR0uFIr/PhWFy6cQal2lNtAhtFddIR5G/WZDGQwWU12QA6zM201W7/UQji4mlE1295GI/be6tybdWJOkQohqis4qCGLNwRdJL5vTdAMPobZFKgtzZ38ByLI+xVp0iFeLoPKs+EKqmSx4WDdehE/zEDMZcyt2i4LoSvTJZtSspQjHjAO53BeKbYfKzMUsnTKoJr5JJt83Jk7YUlhITay5DJl3tEBKI1lIE0JjLA27aR9qLCZJF2fk+Zy5gSUeNQ5t0k+22UR8jY1o83nN3qa2xzTfgjbaChMhvc8T/UVFN8/d8HoLjPzHUIrq8+Jfxb7Z24KHI2CNtL+ZB4pykaBBP1BkDLNljP8wJJuKj/3SHSPvDykCb5ChncUNKJdvhO1DsJPTkoJ0HoDOvLuItsC2B+Rw/oCipf8hkFWV3Sj24KCTPlWE7a6fEE6kb7bM4o0rEfBj2aBziOW6Sr6EElbZSh80W8cqB5+cfdrplZgfIcWp4XIsBuOyNuZV0uxkOGgRiknFzCBJH6SMYJra8VbUUIvmsk5FDCt/LBu9D5XYIXMF+UNAcwyb2ODhcztdabZQsO9riCMtOTBD0v4Pb+Nm4hXHs3UVwuaTMKgQ2NkDMBURelQhSf1AmOetaDD6TgVe/BaV0nHbBA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(396003)(39860400002)(136003)(376002)(186009)(1800799009)(451199024)(26005)(2616005)(6486002)(6506007)(6512007)(122000001)(82960400001)(36756003)(86362001)(38100700002)(38070700005)(83380400001)(5660300002)(478600001)(966005)(41300700001)(66476007)(66446008)(316002)(110136005)(64756008)(76116006)(91956017)(66946007)(8676002)(6636002)(66556008)(8936002)(71200400001)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YnhURVdkK091ZXd0Q3RNRE1nN1AwTDRmQ0tJUE5iTDFGaW90SXlGUUdkZXI4?=
 =?utf-8?B?eDBTTVdHUUE4N3pGcjhrV08wSkdjcE5NbWhCMnpESXRWK21Zc09tcTIyUk9B?=
 =?utf-8?B?dUdrRzlmaVRhc3lOTnJ6TUR5WkVZOWx5M1VURjJhWVpaajRhQ2k4cmJpUWxi?=
 =?utf-8?B?YVAxMGJIWkMvUVpYWEF5alVDam9hUENkdndEUmRnWTJsS3VVWExSRjVYNGRC?=
 =?utf-8?B?QUwwR2pjRjFZNlNXS0xnYitxVXFEYk1sTDYraWdXRmRsYWl5OEFQRGgwekwx?=
 =?utf-8?B?bmc5eHYzc2NWNnR2YzNocWMvb2ZHenBZbEw0L1AwNzl2bzJyWTRiYzdaT1dP?=
 =?utf-8?B?NzhGeEllK1RnZ25UVmd2YnYrMTFka29xaUovbFUrSDNUQ2FZVU1qR2liRUdq?=
 =?utf-8?B?eUxIVEhSd1E5bGZCOXRiek9KTW92VURRTXVMcmdIeG00QTNPV3FqSHJsSDFT?=
 =?utf-8?B?VFBiMFlxTk9TQXVmKzVzbDBNV0NCbktydExhVmFrUHF3YnJmdFNrdDFyYVJa?=
 =?utf-8?B?ZGhoRGcvaVlONjBNZ3VYM0hEVjFKSm1md2M4NmNUQWs3N0s5Y1ptMFBaaTNo?=
 =?utf-8?B?R3dpeEE2eDVJVlk5OUUyd29iNkNVeDY2QmpNeG5kMEJoVUtGaWZNL2cxSHN1?=
 =?utf-8?B?em1WYW9QR1FSaUlIWFBzdFRsNTlRY0gzZnN4bERETlFZUGU5amxLOTZjT2VL?=
 =?utf-8?B?VmVSQ0p6L0VtWmQ1aXFyRGJQLzRVUjExODZTODhZelpFR1IyV1lSTExlcGR2?=
 =?utf-8?B?WnpmeFN1RmtGd3NBN2tUcjZYeld2QWJGVVBtZWlGdDVnMVVXQ29rT25kV0o0?=
 =?utf-8?B?UkRubm9EVUNXWWF0cC9aa2haaGRkWXkzOTRDMDBUaStLZjhOYnJUb3orWE1v?=
 =?utf-8?B?YkYzenRsWTg0dWFrOG83YjNVb2loQk16bU8yM0t1b3BrNWEzaDYrbUFIdVR5?=
 =?utf-8?B?aG8wQnc0Y05Fd1c3M2lPZmdsWWRCUEFWVVk1T2gvVGNhVjVMVFJibndKNlk3?=
 =?utf-8?B?Y3ovb21tSGJWQjVaNTgrRFQ2cVFWRFdDY3dKVG5ib0VPdE9YN2tEZFk4Kzlm?=
 =?utf-8?B?M1grY1p6WlB3NWJwcS83T0NwSGhmcFFVQ1E4a2MyZ1BpMHNhY005RHJpUWlt?=
 =?utf-8?B?YnpTUWNhQjlzKzBocXAxa0UyaUF0dXJTdmg2TlNubUE3MmQrNVFBVmxsSUtm?=
 =?utf-8?B?d3d0WVdSOGtzL1J0eE5WQXpTYXRGOVZjbEhUeUp1c216Zy9pdHBlanpYYXlm?=
 =?utf-8?B?ekl1MytQdlBTTC8rYzd4bFNwOXgrNjdHbWkyaEUrbjhPczFBY0g3VVdzMDg3?=
 =?utf-8?B?cWF1QlprcEVLaFE3QlM0b25kQ1VJWlh1bXZnOTFJb3o2WkMwMjhYdThJTmwv?=
 =?utf-8?B?bDBrbG9VWGJoMU9mUFlzYU50RnJtQmZMRWFLUFNOTmMya3k5SkpGU1o5UnRS?=
 =?utf-8?B?TDZZK2d0eEpzRTBJeXQ2cDBQNEh6UGZMcC9LZVdlLzRZVTZaeVpaVGVqU0tz?=
 =?utf-8?B?eDhoNW5OTm1TZjI3ZjBPaTM2SVN1alFqYmJwd2RvMDlaM0k4Z3pEaU51T2hy?=
 =?utf-8?B?anZxbHJqcCtubC9uK1pUWE05aEl5MVV1aXZ0bGx4YjYxcDlSVU9lQWRnVDdJ?=
 =?utf-8?B?ek5GcjRUbmJxRHJhS3ppMUEzSHgyWmRPT2FLTGFuQnRqU1cxMjY1KzJsUW5r?=
 =?utf-8?B?LzFFMUNUaW5WS0Jrd1JYZFNsTU5DRy8yUVJVekxJclhpL0Flc05KZURaRDU1?=
 =?utf-8?B?aTJFNVhIMUdIQ3ZEZS84Q2doZFRKellrK2dRbkhLc2owcEd5cmtuQnlOeUZF?=
 =?utf-8?B?b05qRUFBeUpsZG05YjVKMHFKME9RSzVmMjMvS2NnZlZSdEpCejRGM2Q4R2dH?=
 =?utf-8?B?MGlPNjJqK2ZtMTVDVHUyd1hxa044d0h1dk5TOWw2U2NSWlBseEwvY2xmTkFj?=
 =?utf-8?B?S0xNL2RlZmNNbURTM0VRMGh6WjZpRVhyV3JRQVZrMnMxTmc0NzdidmUrd21u?=
 =?utf-8?B?d1BXVWliVFVhS1NQSXhWQUhvZy8zbWRTelBJbkg4UTRvNlJoSnFRYjc2OW1w?=
 =?utf-8?B?NWphck5EN1hERldlY2VYaG5DdFFJWnVxa1BkQmQxa1h0em1zT2JiQlp5aUJX?=
 =?utf-8?B?Z0xJYXVqMUlweWZiNyt4c3RiMU1SUmdHU3dOcWlYUExTeExVZm4veXJ2VGR5?=
 =?utf-8?B?RHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2AB3F961B24C0D4D8DBD6A5839249B9F@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 002fbf5d-2eed-4594-825a-08dbb934a078
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2023 17:19:48.4755 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2Q/xW99o3c4uQIADvfviqdDd0iBwxs1F7KVYCCq8piWmtC6Z5CIRv++ujgdu1/XpD9lhhVJXWKXMFmMIPNTPjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB5989
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 00/17] uAPI Alignment - take 1
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

T24gVHVlLCAyMDIzLTA5LTE5IGF0IDEwOjI0IC0wNDAwLCBSb2RyaWdvIFZpdmkgd3JvdGU6DQo+
IEFzIGEgcmVzdWx0IG9mIHRoZSB1QVBJIHJldmlldyBlZmZvcnRzIHN0YXJ0ZWQgYnkgVGhvbWFz
WzFdLA0KPiB3ZSBoYXZlIGlkZW50aWZpZWQgbWFueSB1cGRhdGVzIG9uIG91ciB1QVBJIHRoYXQg
d291bGQgbGVhZCB0bw0KPiBicmVha2FnZSBpbiB0aGUgY29tcGF0aWJpbGl0eS4gV2hhdCBpdCBp
cyBub3QgYWNjZXB0YWJsZSBhZnRlcg0KPiB3ZSBhcmUgbWVyZ2VkIHVwc3RyZWFtLiBTbywgbGV0
J3MgYnJlYWsgaXQgYmVmb3JlIGl0IGlzIHRvbyBsYXRlLA0KPiBhbmQgc3RhcnQgdXBzdHJlYW1p
bmcgYSBnb29kLCByZWxpYWJsZSBhbmQgY2xlYW4gdWFwaS4NCj4gDQo+IE1vc3Qgb2YgdGhpcyB3
b3JrIG9uIHB1dHRpbmcgdGhlc2UgcGF0Y2hlcyB0b2dldGhlciBmb3IgYSBzaW5nbGUNCj4gc2hv
dCB3YXMgbGVkIGJ5IEZyYW5jb2lzLg0KPiANCj4gVGhlIElHVCBjb3VudGVyIHBhcnQgb2YgdGhp
cyBzZXJpZXMgaXMgYXZhaWxhYmxlIGFzIHdlbGxbMl0uDQo+IA0KPiBbMV0gLSBodHRwczovL2xv
cmUua2VybmVsLm9yZy9hbGwvODYzYmViZDBjNjI0ZDZmYzJiMzhjMGEwNmI2M2U0NjhiNDE4NTEy
OC5jYW1lbEBsXA0KPiBpbnV4LmludGVsLmNvbS8NCj4gWzJdIC0gaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvYWxsLzIwMjMwOTE5MTQyMDAwLjkxMzYzLTEtcm9kcmlnby52aXZpQGludGVsLmNvbQ0K
PiANCg0KTWVzYSBNUjogaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL21lc2EvbWVzYS8t
L21lcmdlX3JlcXVlc3RzLzI1MzAwDQoNCkFja2VkLWJ5OiBKb3PDqSBSb2JlcnRvIGRlIFNvdXph
IDxqb3NlLnNvdXphQGludGVsLmNvbT4NCg0KPiBBc2h1dG9zaCBEaXhpdCAoMSk6DQo+ICAgZHJt
L3hlL3VhcGk6IFVzZSBjb21tb24gZHJtX3hlX2V4dF9zZXRfcHJvcGVydHkgZXh0ZW5zaW9uDQo+
IA0KPiBGcmFuY29pcyBEdWdhc3QgKDQpOg0KPiAgIGRybS94ZS91YXBpOiBTZXBhcmF0ZSBWTV9C
SU5EJ3Mgb3BlcmF0aW9uIGFuZCBmbGFnDQo+ICAgZHJtL3hlL3ZtOiBSZW1vdmUgVk1fQklORF9P
UCBtYWNybw0KPiAgIGRybS94ZS91YXBpOiBSZW1vdmUgTU1JTyBpb2N0bA0KPiAgIGRybS94ZS91
YXBpOiBGaXggbmFtaW5nIG9mIFhFX1FVRVJZX0NPTkZJR19NQVhfRVhFQ19RVUVVRV9QUklPUklU
WQ0KPiANCj4gTWF0dGhldyBCcm9zdCAoNCk6DQo+ICAgZHJtL3hlOiBGaXggeGVfZXhlY19xdWV1
ZV9pc19pZGxlIGZvciBwYXJhbGxlbCBleGVjIHF1ZXVlcw0KPiAgIGRybS94ZTogRGVwcmVjYXRl
IFhFX0VYRUNfUVVFVUVfU0VUX1BST1BFUlRZX0NPTVBVVEVfTU9ERQ0KPiAgICAgaW1wbGVtZW50
YXRpb24NCj4gICBkcm0veGU6IFJlbmFtZSBleGVjX3F1ZXVlX2tpbGxfY29tcHV0ZSB0bw0KPiAg
ICAgeGVfdm1fcmVtb3ZlX2NvbXB1dGVfZXhlY19xdWV1ZQ0KPiAgIGRybS94ZTogUmVtb3ZlIFhF
X0VYRUNfUVVFVUVfU0VUX1BST1BFUlRZX0NPTVBVVEVfTU9ERSBmcm9tIHVBUEkNCj4gDQo+IFJv
ZHJpZ28gVml2aSAoNSk6DQo+ICAgZHJtL3hlOiBLaWxsIFhFX1ZNX1BST1BFUlRZX0JJTkRfT1Bf
RVJST1JfQ0FQVFVSRV9BRERSRVNTIGV4dGVuc2lvbg0KPiAgIGRybS94ZS91YXBpOiBEb2N1bWVu
dCBkcm1feGVfcXVlcnlfZ3QNCj4gICBkcm0veGUvdWFwaTogUmVwbGFjZSB1c2VsZXNzICdpbnN0
YW5jZScgcGVyIHVuaXF1ZSBndF9pZA0KPiAgIGRybS94ZS91YXBpOiBSZW1vdmUgdW51c2VkIGZp
ZWxkIG9mIGRybV94ZV9xdWVyeV9ndA0KPiAgIGRybS94ZS91YXBpOiBSZW5hbWUgZ3RzIHRvIGd0
X2xpc3QNCj4gDQo+IFVtZXNoIE5lcmxpZ2UgUmFtYXBwYSAoMyk6DQo+ICAgZHJtL3hlOiBGaXgg
YXJyYXkgYm91bmRzIGNoZWNrIGZvciBxdWVyaWVzDQo+ICAgZHJtL3hlOiBTZXQgdGhlIGNvcnJl
Y3QgdHlwZSBmb3IgeGVfdG9fdXNlcl9lbmdpbmVfY2xhc3MNCj4gICBkcm0veGU6IENvcnJlbGF0
ZSBlbmdpbmUgYW5kIGNwdSB0aW1lc3RhbXBzIHdpdGggYmV0dGVyIGFjY3VyYWN5DQo+IA0KPiAg
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZS5jICAgICAgICAgICB8ICAgMSAtDQo+ICBkcml2
ZXJzL2dwdS9kcm0veGUveGVfZXhlY19xdWV1ZS5jICAgICAgIHwgIDk5ICsrKy0tLS0tDQo+ICBk
cml2ZXJzL2dwdS9kcm0veGUveGVfZXhlY19xdWV1ZV90eXBlcy5oIHwgICA2ICstDQo+ICBkcml2
ZXJzL2dwdS9kcm0veGUveGVfZ3RfdHlwZXMuaCAgICAgICAgIHwgICAyICstDQo+ICBkcml2ZXJz
L2dwdS9kcm0veGUveGVfbW1pby5jICAgICAgICAgICAgIHwgMTAyIC0tLS0tLS0tLQ0KPiAgZHJp
dmVycy9ncHUvZHJtL3hlL3hlX3BjaS5jICAgICAgICAgICAgICB8ICAgNCAtDQo+ICBkcml2ZXJz
L2dwdS9kcm0veGUveGVfcXVlcnkuYyAgICAgICAgICAgIHwgMTg3ICsrKysrKysrKysrKystLQ0K
PiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZtLmMgICAgICAgICAgICAgICB8IDIyMSArKysrKy0t
LS0tLS0tLS0tLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV92bS5oICAgICAgICAgICAgICAg
fCAgIDEgKw0KPiAgaW5jbHVkZS91YXBpL2RybS94ZV9kcm0uaCAgICAgICAgICAgICAgICB8IDI4
MCArKysrKysrKysrKystLS0tLS0tLS0tLQ0KPiAgMTAgZmlsZXMgY2hhbmdlZCwgNDAyIGluc2Vy
dGlvbnMoKyksIDUwMSBkZWxldGlvbnMoLSkNCj4gDQo+IC0tDQo+IDIuNDEuMA0KDQo=
