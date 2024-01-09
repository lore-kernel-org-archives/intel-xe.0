Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A24F2C47079
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jan 2024 18:44:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63B3E10E4D6;
	Tue,  9 Jan 2024 18:44:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C6AD10E4D6
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jan 2024 18:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704825855; x=1736361855;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=mRvcjR4arYtW4zxsJaHnc4fI1WiIrthVroxm/nwd62I=;
 b=a8y5SdIlhAU9H45cZ24gvuo/N2YcVucP5m2Rgem22xrVvU9SFAGwWdkD
 EXrO/MEc4zXFVrzKytrf/xWeVLrX1vygmgzxpfXVc1119Op1K+CTJKGGm
 RZIDve7ntNWE6cqrhkhxg+lBHEi9SpfkGBhJ4ORwh/gf4MXqQOGbfUgRv
 9qAt4ESGL+NML/FymyJYf75AviOWzUlgGzrDqZWxexNVCNZhUFE9b2YKu
 EF0Vx2jUMK3biMM+C6cv2eg+TzSG6fOfG1lobILWSHCyDTXygGQnZlM21
 suMrUuGi2gJnRtNR2WEvn9Agozqllq3NXSyIOR+PFhtQUTMPTzAYL/+Au A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="484473690"
X-IronPort-AV: E=Sophos;i="6.04,183,1695711600"; d="scan'208";a="484473690"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 10:44:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="816074398"
X-IronPort-AV: E=Sophos;i="6.04,183,1695711600"; d="scan'208";a="816074398"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Jan 2024 10:44:14 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 9 Jan 2024 10:44:13 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 9 Jan 2024 10:44:13 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 9 Jan 2024 10:44:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JmzIw9nRGVPGrjeBM2mJRR4u0xKObHvhPYDpgO9D/fgD2GN1GeMrDgsgOTvGsESLBYma60rPSVQ5tOeIoq1yiwkbu4+cYT58Y3UbQFrDKUOp9dXI+s+yY4zaMvX3PY0wGEB40fLVnHdHi5MONXDUK6jFseE1Fx47n7dNhOV0YQxELt4uLZ/awSOu6+EzEqM7GEfil8zRt7P4SuUJtqD2xPwTQHE3CJGKYu852KLpo3JJWMQxzky2OSdmGMdjKjV6JS0Cub2uLpQYj6s6VFS0Q5fF+R2IfK3bQ8YsB+V2VLkBhaY9XPSGtNxXoGTg7nAqFDOv9KLt47/BgCtyf9c0xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mRvcjR4arYtW4zxsJaHnc4fI1WiIrthVroxm/nwd62I=;
 b=ESjJJ6vYtwHuWct6g2ppTFzCzSoAagC06hllFW1Vak73mBX+Pt8+x0d3YF/+eXmKkwOG2w+LDg1Mj3/Eus/6sTtm9UtIK30V3ehNy/xlVlJgVEzbgLwBTde8a/eEUxTHA6pfvAngU8589vbVUyMauDcW1TSvVZE3WP4KsVPd57PFizDcDW/KxLMCQJ6jGLsLlKaV60CQhqYLIECcfOpFPbUzC0dJJ+HLYvP+ppfQtfcveZRR9Or/UiQBjp4kXV57Dv4NoJC6Fepm1PdB6gBqD5CgmCZDk1HJj070bL7jDN4mHI3PUVpkAflC0rNOjFFrxCC72KqdvlBrZm2QYjmrxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 DS7PR11MB7930.namprd11.prod.outlook.com (2603:10b6:8:da::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7159.23; Tue, 9 Jan 2024 18:44:11 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::da85:3d5:65fd:4a21]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::da85:3d5:65fd:4a21%7]) with mapi id 15.20.7159.020; Tue, 9 Jan 2024
 18:44:11 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH 1/2] drm/xe/gsc: Initialize GSC proxy
Thread-Topic: [PATCH 1/2] drm/xe/gsc: Initialize GSC proxy
Thread-Index: AQHaLJdjvZXFOjxEi0u1IfJuYwYBuLDK9mwAgAV5qACAAY5mgA==
Date: Tue, 9 Jan 2024 18:44:11 +0000
Message-ID: <8df7e9461dfbaf87be3c7facfd63368ac8327676.camel@intel.com>
References: <20231212010600.3479465-1-daniele.ceraolospurio@intel.com>
 <20231212010600.3479465-2-daniele.ceraolospurio@intel.com>
 <a61fdbc48bb25b7e221f6c3e8edcb722a2873f1c.camel@intel.com>
 <2cd5b758-5c37-4017-9876-a84d2e9ecc97@intel.com>
In-Reply-To: <2cd5b758-5c37-4017-9876-a84d2e9ecc97@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.50.0-1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|DS7PR11MB7930:EE_
x-ms-office365-filtering-correlation-id: e2a37e83-ba90-44e7-310f-08dc1142f887
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: T4h1miGheLCK19rsaDFwqxN2VCzLU+2SKRYzJDjjD/5Fwoy9nFHJm1yaYMloAGJVTLlTUkaiJFVTOf3BOFwFhj0m5Pg/r4SXe58S5yGarrVLZpJtokc3o+XaA4qN0jTQvScYspzHsM9NmX4QqT4AufhT0VH96TQaHEn/odMKXdibooatLEIfTdLEffuL+GbX9qvdiDz3gRYoE3H5O7GsO7OREpIcI0RhoZE5nzos40WcYZQydNgR6wMZmX1PSxl5sa4RCpVS6K4Euq7H6E24gYzCn8K4O4kWhaBv+b4UKZ9fpY3ca+/W6WfuPhIvrcCErXELoKFnKKOfuY3qkUzeaJGkcpq8Z2Js0k7WPODR5j7j+9APRyP69P8GPobfSkjzl0m1SRNCRNky9M3DFTgHLtVGMeoqZuXNA/u2z1nnBY2Uz/EoiQ9vORxldoldtK/CEci5iSyceSmW4KbZr75leaVAP9Q+GVbCWN4f1Q31fA36l8J5pUOAgs2GeXDbjz3iGfwpkasDmpRo5demshuknE/wgBofigTggww1v476o5uMxQ9JaS2+2DLNHmrE3LZg1uS9MZvZC8qZ4ruDxANtURbLvvC0MFKuEl0hik4r1UGEtCnt1mq3wiEDEMBo3Lhw
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(346002)(136003)(39860400002)(366004)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(478600001)(5660300002)(71200400001)(82960400001)(6486002)(107886003)(86362001)(6506007)(2616005)(6512007)(8676002)(53546011)(66556008)(316002)(8936002)(91956017)(41300700001)(66476007)(110136005)(64756008)(76116006)(66946007)(6636002)(36756003)(66446008)(122000001)(38100700002)(83380400001)(26005)(38070700009)(4326008)(2906002)(4001150100001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M2poRmhpVmZaWk1xdWpBUTF4Rnhxa2l2QkkrY0pGMDIva3Y2RXcrVlhNTVd5?=
 =?utf-8?B?MHZoM1V3R0w3cEFJaE4rYVZNWWNxVHZzVFFCNUZyODczTVVFckdQOXpWOXpO?=
 =?utf-8?B?QnV6YnRYSHpGak9uRGo1T3JtZHh0eXVlVThWTnFLeG0xZE5wT0dJNjNVVFRq?=
 =?utf-8?B?cE1xZG1kQkp6VVZNd0RPY3pxdndFZkdmWWJMTUI1QmNKU0lyM0E5Qlh2a1hE?=
 =?utf-8?B?N09pUElGSTBadk81aTBJMlNpNE5oTGdsQTNteU5sN1orcnFqdTQ1Uk94L3dW?=
 =?utf-8?B?NWR5blYvQmNidU8vWXZnU3FTTnozaHBvZ2pSYzZDbFF1Q3ZqekZmVm1XVnV0?=
 =?utf-8?B?ai92VWJkS3ZQWkU2cVc4bmFjWHZsN2FnUytReXRDNnFkSEhjRWVIdlFSS1dC?=
 =?utf-8?B?OTljelE2SWh5Sm1PRFNLY2dxQTJ4TkFtM3dUNm1VcnlncUQ0TENwbGVGWVI3?=
 =?utf-8?B?OVo5NGhobDI2emJURStCMFR2Q2NkZEhzMDZnMnFKWUpwNXNlNWZodm10eUdv?=
 =?utf-8?B?SS9sZ3dCZmQwWC9nR0hWT3dVdlpweDJoNFZQeEFPeFN3YW9heVlnOU1EUHVZ?=
 =?utf-8?B?NWdDRE11Yk1sTEFya1Z5cE14b1JiWXpuWWxkZEFjMW1uUCtyVG9yT3FCVFV0?=
 =?utf-8?B?YXpGTncvSkdweWZWVTQwc252QTk4WTF4dElaVXFicDVrK0IwbUJ4akZWa3Zk?=
 =?utf-8?B?ZnNza3VGQ2JoVlp1WEpXY3k2UllMd0ZmVTRPc05ERXdDdUFlNWhjdGJIWmND?=
 =?utf-8?B?NHczQUluMjJ4OUVNUW1Wc28rRTZ1WGlLREErWVNCNEIxZVFldHBKbzdtSkJi?=
 =?utf-8?B?enQxRXBGVDhKd0h0RlA0Q1dOUnh5RU1DSWhNRVdmcFdTWU5FNVFXSURvUTZt?=
 =?utf-8?B?c3ZPWlpuYTVhQlc3cWRsN1JxeGZZRjdFb1lrTXpzYTVCckJKNlVHeDA2SDZW?=
 =?utf-8?B?ZU9leTZJcC9HTGl1ZjdaaWxaaG9aTUNSUURsVkZSaE8wTUwxdjV0SWNpa3JW?=
 =?utf-8?B?eExZQzc5dGJybHpoRG1tcnRKUGdwM3BSMDczaDgrdVA5V2FWcUNGVHV4SE5l?=
 =?utf-8?B?cUtCU05VN2FsS05obVpINlh1N1NrSkJUOWJ4TVVLK3pvL3BHMERGQmhOb0pO?=
 =?utf-8?B?cFJ4dWkxRUZhWnF3aEdaZnQ1WkppUVZya2drazRMd2cvVTYxOXlIQW9RY3NQ?=
 =?utf-8?B?ejM3NzBzT0hLN0FwUldRQ2RGNmRkNWJaTkkzRmNoeTcvUWx3eCtiNDFVM2NV?=
 =?utf-8?B?RHFJakZyMzZtdnVIK2dXSDZHamw5cTJVRFJkd1ZCZVRCZmIydDl4dDA1eG0w?=
 =?utf-8?B?bDh1cHdGVlpDZUZCUnIrU0k1TW5wT1RPSTd2dTN2K1hUUHNuMy9PckxkbndK?=
 =?utf-8?B?aG1kOHdQd3RNK0N2elB6akdhT2l2UWo3VldRbS9SeFlsbW1iekl1ckwrVXZ5?=
 =?utf-8?B?VSthN3crMXF0VDNpT1E4elJwajNwem1pMWhrYm1CQ3lrUUlQanUvZmVtMi9W?=
 =?utf-8?B?bEozc2lWL1lucDc1RExISFpoN0VuaUJzNk5Fckt2YVNLRkxZbk9wc0oyL1Na?=
 =?utf-8?B?b1pLVDJ4cXRJYWorWWxFMU5aVG41d0dIZU1RNStKVERhSHlVbGpockFPVmZn?=
 =?utf-8?B?RW82Y2xrWHlOUnlHV2hjRHRtcjdGZFJrRHVsVzJoR2lEWldpeERrbmw3ZEFu?=
 =?utf-8?B?TlJ4ZTRkaU0xd2xrZEtoOTUrQ2RMdjMvNktlWnVQdnBBei9IMFY0dzhiSlJM?=
 =?utf-8?B?cHVvN1JXNDByVHNwNXV2YmtZVVR2V1c2UTE4MDduRkpxYkUvMjNqV3Z2c0o2?=
 =?utf-8?B?U1owOXk1Y013R0lpdGgrbEZJdkVjM3RCYmFTNVg2QjZFaXlWRFIzRkVhYXQv?=
 =?utf-8?B?dlltZ2FDYU1pdWhtQmJDY0VpZzN3RW1YcWtDaHdwaUk4bUVDVkptZmZzTGdG?=
 =?utf-8?B?VVVNSFhiUDBBTlIwQkxXNUpMc0d4bmg4WEhJaEZVYllvUk1FVGxta2NyZWpn?=
 =?utf-8?B?QWMwSHp4enBmblpQQXVScEJSdm9lZkdvTGV1cm1NbjZwUFIvQVRTWXlIY1dj?=
 =?utf-8?B?TzJLbkQ3ZnRRRWdmWFNZV0p4VE1xZnNPT3cvY3U3UlFyWC9lT3YxQXRLMzRG?=
 =?utf-8?B?M2REL0xlNjlJK1dWRUJKdGRNaWxFV2dkV2prb3luTGJINlBZYVJ4SHVxenBa?=
 =?utf-8?Q?oFyV+yiMxKitLslLEyHTfZE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7DE3BA9D70C7704487A7668D05516723@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2a37e83-ba90-44e7-310f-08dc1142f887
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2024 18:44:11.4795 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vycRgaZVRK+TKiecTp0NmXDwlJ/LxQoBPDZj/F3I/IH2fDctmMNd6cnZrv5FSRdSZ6r+d9KAJxyax6sNo42twIdjZRERC5PGlMjD2HPrNAtuCojdQ0ZTy6LkvrgXLft9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7930
X-OriginatorOrg: intel.com
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

SSB0aGluayB3ZSBhcmUgcmVhZHkgZm9yIGEgcmIgYWZ0ZXIgdGhlIG5leHQgcmV2Og0KDQpPbiBN
b24sIDIwMjQtMDEtMDggYXQgMTA6NTggLTA4MDAsIERhbmllbGUgQ2VyYW9sbyBTcHVyaW8gd3Jv
dGU6DQo+IE9uIDEvNC8yMDI0IDExOjIxIFBNLCBUZXJlcyBBbGV4aXMsIEFsYW4gUHJldmluIHdy
b3RlOg0KPiA+IE9uIE1vbiwgMjAyMy0xMi0xMSBhdCAxNzowNSAtMDgwMCwgRGFuaWVsZSBDZXJh
b2xvIFNwdXJpbyB3cm90ZToNCj4gPiANCj4gPiBhbGFuOiBwZXIgb2ZmbGluZSBjaGF0LCBhcG9s
b2dpZXMgb24gbXkgZGVsYXkgY2F1c2luZyB0byB3YXJyYW50IGEgcmViYXNlLg0KPiA+IGFsYW46
IChuaXQ/L25vdC1uaXQ/KTogZm9yIFhlIGRyaXZlciwgYXJlIHdlIGVuZm9yY2luZyB0byBlbnN1
cmUgYWxsDQo+ID4gZnVuY3Rpb25zIHJlcXVpcmUgZG9jdW1lbnRhdGlvbj8gKGRlc2NyaXB0aW9u
LCBpbnB1dCwgb3V0cHV0LCByZXR1cm4uLi4pLg0KPiA+IElmIHNvLCBpIHRoaW5rIG1hbnkgZnVu
Y3Rpb25zIGluIHRoaXMgcGF0Y2ggaXMgbGFja2luZyB0aGlzLg0KYWxhbjpzbmlwDQoNCj4gPiAN
Cj4gPiA+ICAgDQo+ID4gPiArZXJyX2ZpbmlfZ3Q6DQo+ID4gPiArCWZvcl9lYWNoX2d0KGd0LCB4
ZSwgaWQpIHsNCj4gPiA+ICsJCWlmIChpZCA8IGxhc3RfZ3QpDQo+ID4gPiArCQkJeGVfZ3RfcmVt
b3ZlKGd0KTsNCj4gPiBhbGFuOiBzaW5jZSB4ZV9ndF9pbml0IGRvZXMgYSBkcm1tX2FkZF9hY3Rp
b25fb3JfcmVzZXQoLi4uIGd0X2ZpbmkgLi4uKSwNCj4gPiBpcyB0aGVyZSBhIHJlYXNvbiB3ZSBk
b24ndCB3YW50IHRvIHBsYWNlIHRoZSBuZXcgeGVfdWNfcmVtb3ZlIHVuZGVyIHRoZXJlPw0KPiA+
ICh3aGljaCBpbiB0dXJuIGNhbGxzIHRoZSBuZXcgeGVfZ3NjX3JlbW92ZSkuDQo+IA0KPiBDb3B5
aW5nIGZyb20gdGhlIGNvbW1pdCBtZXNzYWdlOg0KPiANCj4gTm90ZSB0aGF0IHRoZSBjb21wb25l
bnQgbXVzdCBiZSByZW1vdmVkIGJlZm9yZSB0aGUgcGNpX3JlbW92ZSBjYWxsIA0KPiBjb21wbGV0
ZXMsIHNvIHdlIGNhbid0IHVzZSBhIGRybW0gaGVscGVyIGZvciBpdCBhbmQgd2UgbmVlZCB0byBp
bnN0ZWFkIA0KPiBwZXJmb3JtIHRoZSBjbGVhbnVwIGFzIHBhcnQgb2YgdGhlIHJlbW92YWwgZmxv
dy4NCmFsYW46IG9oIG15IGJhZCwgZ290IGl0LCB0aGFua3MuDQphbGFuOnNuaXANCg0KPiANCj4g
PiA+ICsvKiBzaG9ydGhhbmQgZGVmaW5lIGZvciBjb2RlIGNvbXBhY3RuZXNzICovDQo+ID4gPiAr
I2RlZmluZSBQUk9YWV9IRFJfU0laRSAoc2l6ZW9mKHN0cnVjdCB4ZV9nc2NfcHJveHlfaGVhZGVy
KSkNCj4gPiBhbGFuOiBuaXQ6ICJHU0NfUFJPWFlfSERSX1NJWkUiPyAoZm9yIG5vIHJlYXNvbiBv
dGhlciB0aGFuIGNvbnNpc3RlbmN5KS4NCj4gDQo+IEknZCBwcmVmZXIgdG8ga2VlcCBpdCBhcyBz
aG9ydCBhcyBwb3NzaWJsZS4gVGhpcyBpcyBkZWZpbmVkIGluIGEgLmMgDQo+IGZpbGUsIHNvIHRo
ZXJlIHNob3VsZG4ndCBiZSByaXNrIG9mIGNvbmZ1c2lvbiBhcyBpdCBjYW4ndCBiZSB1c2VkIGlu
IA0KPiBhbm90aGVyIG5vbi1nc2MgZmlsZS4NCmFsYW46IHdhcyBqdXN0IGEgbml0IC0gc28gaXRz
IGdvb2QuIGp1c3QgbmljZSByZWFkLWNvbnNpc3RlbmN5IGluIHRoZSBoZWFkZXIuDQoNCg0KPiA+
ID4gK3N0YXRpYyBpbmxpbmUgc3RydWN0IHhlX2RldmljZSAqa2Rldl90b194ZShzdHJ1Y3QgZGV2
aWNlICprZGV2KQ0KPiA+ID4gK3sNCj4gPiA+ICsJcmV0dXJuIGRldl9nZXRfZHJ2ZGF0YShrZGV2
KTsNCj4gPiBhbGFuOiBzZWVpbmcgc29tZSBvdGhlciB4ZSBjb2RlcyB0aGF0IGNvbnZlcnQgZnJv
bSBkZXYgdG8geGUsIHNob3VsZCB0aGlzIHJhdGhlciBiZToNCj4gPiAJcmV0dXJuIHRvX3hlX2Rl
dmljZShkZXZfZ2V0X2RydmRhdGEoa2Rldik7DQo+IA0KPiBBRkFJQ1Mgd2Ugc2V0IHRoZSBkcnZk
YXRhIHRvIHRoZSB4ZSBzdHJ1Y3R1cmUgKHZpYSBwY2lfc2V0X2RydmRhdGEpLiBUaGUgDQo+IGRy
bSBkZXZpY2UgaXMgdGhlIGZpcnN0IHN0cnVjdHVyZSBpbnNpZGUgdGhlIHhlX2RldmljZSBzdHJ1
Y3QsIHNvIGEgDQo+IHBvaW50ZXIgdG8gdGhlIGRybSBzdHJ1Y3QgaXMgYWxzbyBhIHBvaW50ZXIg
dG8gdGhlIHhlIHN0cnVjdCwgd2hpY2ggaXMgDQo+IHdoeSB0aGUgY29kZSB5b3Ugc3VnZ2VzdGVk
IHdvcmtzIGFzIHdlbGwgKHdpdGggYW4gZXh0cmEgdW5uZWVkZWQgc3RlcCkuDQphbGFuOiBzb3Vu
ZHMgZ29vZC4gdGhhbmtzDQo+IA0KPiA+ID4gK30NCj4gPiA+ICsNCj4gPiA+ICtzdGF0aWMgYm9v
bCBnc2NfcHJveHlfaW5pdF9kb25lKHN0cnVjdCB4ZV9nc2MgKmdzYykNCj4gPiBhbGFuOiBub3Qg
YmxvY2tpbmc6IGFzIGkgY29tcGFyZWQgc2ltcGxlIGh3L2Z3IGZhY2luZyBoZWxwZXJzIGxpa2UN
Cj4gPiB0aGlzIGFnYWluc3QgaTkxNSAobG9naWNhbGx5IHRoZSBzYW1lKSwgSSBub3RpY2UgdGhh
dCBpbiB4ZSwgd2UgZG9udA0KPiA+IGhhdmUgdGhlIGVxdWl2YWxlbnQgZm9yIGk5MTUncyBfX3dh
aXRfZ3NjX3Byb3h5X2NvbXBsZXRlZCB3aGljaA0KPiA+IGlzIGNhbGxlZCBmcm9tIHNlbGZ0ZXN0
IGNvZGUuIEluIGk5MTUgdGhhdCBoZWxwZXIgY2FsbHMgYSBnc2MtaGVscGVyDQo+ID4gc2FtZSBh
cyB0aGlzIGZ1bmN0aW9uIGFmdGVyIGFsc28gY2hlY2tpbmcgQ09ORklHX0lOVEVMX01FSV9HU0Nf
UFJPWFkNCj4gPiBhbmQgdGhlIGZ3IGxvYWRpbmcgc3RhdGUuIERvIHdlIG5vdCBuZWVkIHRoaXMg
dHlwZSBvZiBjaGVja2luZyBmb3INCj4gPiB4ZSBCSVNUcyB0aGF0IGV4Y2VyY2lzZSBhbGwgZW5n
aW5lcz8gVG8gYmUgZmFpciB0aGF0IGNhbiBiZSBhIHNlcGFyYXRlDQo+ID4gcGF0Y2guIFByb2Jh
Ymx5IGFuIG9mZmxpbmUgdG8tZG8uDQo+IA0KPiBBRkFJQ1Qgd2UgZG9uJ3QgaGF2ZSB4ZSBzZWxm
dGVzdHMgeWV0LCBzbyBubyB1c2VyIGZvciB0aGF0IGZ1bmN0aW9uLg0KYWxhbjogc291bmRzIGdv
b2QuIHRoYW5rcyBmb3IgY2hlY2tpbmcuDQphbGFuOnNuaXANCj4gPiANCg0KPiA+ID4gK3UzMiBl
bWl0X3Byb3h5X2hlYWRlcihzdHJ1Y3QgeGVfZGV2aWNlICp4ZSwgc3RydWN0IGlvc3lzX21hcCAq
bWFwLCB1MzIgb2Zmc2V0KQ0KPiA+ID4gK3sNCj4gPiA+ICsJeGVfbWFwX21lbXNldCh4ZSwgbWFw
LCBvZmZzZXQsIDAsIFBST1hZX0hEUl9TSVpFKTsNCj4gPiA+ICsNCj4gPiA+ICsJcHJveHlfaGVh
ZGVyX3dyKHhlLCBtYXAsIG9mZnNldCwgaGRyLA0KPiA+ID4gKwkJCUZJRUxEX1BSRVAoR1NDX1BS
T1hZX1RZUEUsIEdTQ19QUk9YWV9NU0dfVFlQRV9QUk9YWV9RVUVSWSkgfA0KPiA+ID4gKwkJCUZJ
RUxEX1BSRVAoR1NDX1BST1hZX1BBWUxPQURfTEVOR1RILCAwKSk7DQo+ID4gYWxhbjogdGhpbmtp
bmcgb2YgZGlzY3JldGUgZGV2aWNlcywgaSBhc3N1bWUgcHJveHkgbWVzc2FnZXMgYXJlIG9jY2Fz
aW9uYWwgYW5kIGluIGJldHdlZW4NCj4gPiAobm90IHN1cmUgYWJvdXQgaG93IG9jY2FzaW9uYWwg
Zm9yIGhkY3AgY2FzZSksIHNvIGFzIGEgbG93IHByaW9yaXR5IGZlZWRiYWNrOg0KPiA+IHBlcmhh
cHMgaXRzIG1vcmUgZWZmaWNpZW50IChhdCB0aGUgaHcgcGNpIGJ1cyB0cmFuc2FjdGlvbiBsZXZl
bCkgaWYgd2UgY3JlYXRlIGEgbG9jYWwNCj4gPiBzdHJ1Y3R1cmUgZmlsbGVkIHVwIGFuZCB0aGVu
IHVzZSBpb3N5c21hcCBmb3IgYSBtZW1jcHkgYXMgb3Bwb3NlZCB0byB3cml0aW5nIGR3b3Jkcw0K
PiA+IG9uZSBhdCBhIHRpbWU/IG9yIGFtIG1pc3Npbmcgc29tZXRoaW5nIGFib3V0IGhvdyB3ZSBh
cmUgY2FjaGUvZmx1c2ggdGhlc2UgYnVmZmVycyBsZWFkaW5nDQo+ID4gdXAgIHRvIHN1Ym1pc3Np
b24/DQo+IA0KPiBJIGRpZG4ndCB0aGluayBhYm91dCBvcHRpbWl6aW5nIHRoaXMgc2luY2UsIGFz
IHlvdSBzYWlkLCBpdCdzIHJlbGF0aXZlbHkgDQo+IHJhcmUuIEkgY2FuIHN3aXRjaCB0byBhIG1l
bWNweSBpZiB5b3UgdGhpbmsgaXQgd29ya3MgYmV0dGVyLg0KYWxhbjogaSBsZWF2ZSB0aGlzIHRv
IHlvdS4gQmFzZWQgb24gY3VycmVudCBwbGF0Zm9ybXMgYW5kIGZlYXR1cmUsIHRoZXJlIGlzIG5v
DQppbW1lZGlhdGUgbW90aXZhdGlvbiB0byBwdXJzdWUgd2l0aCBjb3JuZXIgY2FzZSBvcHRpbWl6
YXRpb24uIFBlcmhhcHMgd2Ugc2VuZCBhbg0Kb2ZmbGluZSBmeWkgdG8gdGhlIGhkY3AgZm9sa3Mg
c28gdGhleSBjYW4gbG9vayBhdCBpdCBsYXRlciBpZiB0aGV5IGNob29zZSB0by4NCmFsYW46c25p
cA0KDQo+ID4gDQo+ID4gPiArc3RhdGljIGludCBwcm94eV9xdWVyeShzdHJ1Y3QgeGVfZ3NjICpn
c2MpDQo+ID4gPiArew0KPiA+ID4gKwlzdHJ1Y3QgeGVfZ3QgKmd0ID0gZ3NjX3RvX2d0KGdzYyk7
DQo+ID4gPiArCXN0cnVjdCB4ZV9kZXZpY2UgKnhlID0gZ3RfdG9feGUoZ3QpOw0KPiA+ID4gKwlz
dHJ1Y3QgeGVfZ3NjX3Byb3h5X2hlYWRlciAqdG9fY3NtZV9oZHIgPSBnc2MtPnByb3h5LnRvX2Nz
bWU7DQo+ID4gPiArCXZvaWQgKnRvX2NzbWVfcGF5bG9hZCA9IGdzYy0+cHJveHkudG9fY3NtZSAr
IFBST1hZX0hEUl9TSVpFOw0KPiA+ID4gKwl1MzIgd3Jfb2Zmc2V0Ow0KPiA+ID4gKwl1MzIgcmRf
b2Zmc2V0Ow0KPiA+ID4gKwl1MzIgc2l6ZTsNCj4gPiA+ICsJaW50IHJldDsNCj4gPiA+ICsNCj4g
PiA+ICsJd3Jfb2Zmc2V0ID0geGVfZ3NjX2VtaXRfaGVhZGVyKHhlLCAmZ3NjLT5wcm94eS50b19n
c2MsIDAsDQo+ID4gPiArCQkJCSAgICAgICBIRUNJX01FQUREUkVTU19QUk9YWSwgMCwgUFJPWFlf
SERSX1NJWkUpOw0KPiA+ID4gKwl3cl9vZmZzZXQgPSBlbWl0X3Byb3h5X2hlYWRlcih4ZSwgJmdz
Yy0+cHJveHkudG9fZ3NjLCB3cl9vZmZzZXQpOw0KPiA+ID4gKw0KPiA+ID4gKwlzaXplID0gd3Jf
b2Zmc2V0Ow0KPiA+ID4gKw0KPiA+ID4gKwl3aGlsZSAoMSkgew0KPiA+ID4gKwkJLyogY2xlYXIg
dGhlIEdTQyByZXNwb25zZSBoZWFkZXIgc3BhY2UgKi8NCj4gPiA+ICsJCXhlX21hcF9tZW1zZXQo
eGUsICZnc2MtPnByb3h5LmZyb21fZ3NjLCAwLCAwLCBTWl80Syk7DQo+ID4gYWxhbjogYW55IHJl
YXNvbiB3ZSBhcmUgY2xlYXJpbmcgb3V0IGEgd2hvbGUgcGFnZSBhcyBvcHBvc2VkIHRvDQo+ID4g
anVzdCB0aGUgc2l6ZW9mKGdzYy1jbWQtaGVhZGVyKSBvciBzaXplb2YoZ3NjLWNtZC1oZWFkZXIp
ICsgc2l6ZW9mKHByb3h5LWhlYWRlcik/DQo+IA0KPiBUaGlzIGZ1bmN0aW9uIGhhcyBubyB2aXNp
YmlsaXR5IG9mIGhvdyBiaWcgdGhlIEdTQyBjbWQgaGVhZGVyIGlzICh0aGlzIA0KPiBpcyBvbiBw
dXJwb3NlKS4gSW4gdGhlb3J5IHRoZSBvbmx5IHRoaW5nIHdlIG5lZWQgdG8gY2xlYXIgaXMgdGhl
IGZpcnN0IA0KPiBkd29yZCAod2hlcmUgdGhlIGhlYWRlciBtYXJrZXIgaXMpLCBidXQgSU1PIGNs
ZWFyaW5nIHRoZSB3aG9sZSBwYWdlIGlzIA0KPiBiZXR0ZXIgc28gd2UncmUgc3VyZSBhbGwgaGVh
ZGVyIGFyZSBjbGVhcmVkIChpbmNsdWRpbmcgd2hhdGV2ZXIgaXMgYXQgDQo+IHRoZSBiZWdpbm5p
bmcgb2YgdGhlIHBheWxvYWQsIHdoaWNoIGlzIGEgYmxhY2sgYm94IHRvIHVzKS4NCmFsYW46IGkg
dGhpbmsgaXRzIGJldHRlciB0byBjbGVhciBqdXN0IHRoZSBtb3N0IGltcG9ydGFudCBwYXJ0cyBv
ZiB0aGUgaGVhZGVyDQoobWFnaWMsIGRlc3QsIHNpemUpLi4uIDRLIGlzIGEgYmlnIGNodW5rIG9m
IHRyYW5zYWN0aW9uIHNpemUuIEFzIHBlciBzcGVjLCB0aGF0DQpzaG91bGQgd29yayBqdXN0IGZp
bmUuIFdoYXRkeWEgdGhpbms/DQphbGFuOnNuaXANCg0KPiA+ID4gKwkJLyogY2hlY2sgdGhlIHJl
cGx5IGZyb20gR1NDICovDQo+ID4gPiArCQlyZXQgPSB4ZV9nc2NfcmVhZF9vdXRfaGVhZGVyKHhl
LCAmZ3NjLT5wcm94eS5mcm9tX2dzYywgMCwNCj4gPiA+ICsJCQkJCSAgICAgUFJPWFlfSERSX1NJ
WkUsICZyZF9vZmZzZXQpOw0KPiA+IGFsYW46IG5pdDogY291bGQgd2UgcmVuYW1lICJyZF9vZmZz
ZXQiIHRvICJnc2NfcGF5bG9hZF9vZmZzZXQiPyAoaSBiZWxpZXZlIHRoaXMNCj4gPiB3b3VsZCBi
ZSBtb3JlIGRlc2NyaXB0aXZlIG9mIGhvdyBpdCdzIHVzZWQgaW4gdGhlIHN1YnNlcXVlbnQgcGxh
Y2VzIGluIHRoaXMgbG9vcCkNCj4gDQo+ICJwYXlsb2FkIiB3b3VsZCBiZSBpbmNvcnJlY3QsIHNp
bmNlIHRoaXMgaXMgcHJveHlfaGVhZGVyICsgDQo+IHByb3h5X3BheWxvYWQuIEkgY2FuIGNoYW5n
ZSBpdCB0byAicmVwbHlfb2Zmc2V0Ii4NCmFsYW46IHNvdW5kcyBnb29kIC0gaXQgd2FzIGEgbml0
IGZlZWRiYWNrIC0gYnV0IHJlcGx5IG9mZnNldCBpcyB3YXkgbW9yZSBkZXNjcmlwdGl2ZSAtIHRo
YW5rcy4NCg0KPiANCj4gPiANCj4gPiA+ICsJCWlmIChyZXQpIHsNCj4gPiA+ICsJCQl4ZV9ndF9l
cnIoZ3QsICJJbnZhbGlkIGdzYyBoZWFkZXIgaW4gcHJveHkgcmVwbHkgKCVwZSlcbiIsDQo+ID4g
PiArCQkJCSAgRVJSX1BUUihyZXQpKTsNCj4gPiBhbGFuOiB3aHkgdGhlIEVSUl9QVFIgY29udmVy
c2lvbiBoZXJlPw0KPiBiZWNhdXNlICVwZSB0YWtlcyBhbiBlcnJvciBwb2ludGVyIGFuZCBjb252
ZXJ0cyBpdCB0byBhIHJlYWRhYmxlIGVycm5vIA0KPiBzdHJpbmcuDQphbGFuOiBnb3QgaXQgLSB0
aGFua3MuDQphbGFuOnNuaXANCg0KPiA+ID4gK3ZvaWQgeGVfZ3NjX3Byb3h5X3JlbW92ZShzdHJ1
Y3QgeGVfZ3NjICpnc2MpDQo+ID4gPiArew0KPiA+ID4gKwlzdHJ1Y3QgeGVfZ3QgKmd0ID0gZ3Nj
X3RvX2d0KGdzYyk7DQo+ID4gPiArCXN0cnVjdCB4ZV9kZXZpY2UgKnhlID0gZ3RfdG9feGUoZ3Qp
Ow0KPiA+ID4gKw0KPiA+ID4gKwlpZiAoZ3NjLT5wcm94eS5jb21wb25lbnRfYWRkZWQpIHsNCj4g
PiA+ICsJCWNvbXBvbmVudF9kZWwoeGUtPmRybS5kZXYsICZ4ZV9nc2NfcHJveHlfY29tcG9uZW50
X29wcyk7DQo+ID4gYWxhbjogd2Ugb3VnaHQgdG8gcHV0IHRoZSB3YWl0IGZvciB0aGUgd29ya2Vy
IHRvIGNvbXBsZXRlIHNpbmNlIHRoYXQgd29ya2VyDQo+ID4gY291bGQgdGFrZSBsb25nIHRpbWUg
Zm9yIHRoZSBjb21wb25lbnQgdG8gZ2V0IGFkZGVkIC0gd2UgY291bGQgZ2V0IHJhY3kgbm8/DQo+
IA0KPiBUaGUgd2FpdCBpcyB0aGUgZmlyc3QgdGhpbmcgaW5zaWRlIHRoZSB1bmJpbmQoKSBhY3Rp
b24sIHNvIHRoZSB1bmJpbmQgDQo+IGNhbid0IGNvbXBsZXRlIHVudGlsIHRoZSB3b3JrZXIgaXMg
ZG9uZS4NCmFsYW46IGdvdCBpdCAtIHRoYW5rcy4NCg0KDQo=
