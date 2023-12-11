Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC4B6C4167B
	for <intel-xe@archiver.kernel.org>; Mon, 11 Dec 2023 11:01:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC78110E0DD;
	Mon, 11 Dec 2023 11:01:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56C9910E0DD
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Dec 2023 11:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702292472; x=1733828472;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6+Mvt7oif1Kb7HpxDue/E+N8GhJDozLdl7pM2S7/TYw=;
 b=AEUkvbFPAUqkGQNpzpkGubd8YTLv96TavaTtqHQMyW8OwTy1popdBXAJ
 qWKOkBDT7gYGbWDFtyHMOxopBd3Q2XqkiWFsaZzxwvTFL5BrPm+jj6r2g
 uYQGc73csriSEgm/ghDPjPKJHvlX42gl2EUrblCntSoxgYNV+KpfPyUVU
 oNgcD8svKI/k0LxWbZs7z7FOMEEK7VoIdZdgsdUMW/vDZtcMtYcUvCwxp
 iRMWhc6XuCdQIG5dWwVME2SMCxO+GFj1hd1hOPcitmZQZKH7HV9F6n5T8
 ABqGbwhJ932xrhkLWhRNSi817kDTgTuHmNA4ciP1r94OF3BUaP1HDluPY w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="374787721"
X-IronPort-AV: E=Sophos;i="6.04,267,1695711600"; d="scan'208";a="374787721"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2023 03:01:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="722738076"
X-IronPort-AV: E=Sophos;i="6.04,267,1695711600"; d="scan'208";a="722738076"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Dec 2023 03:01:12 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Dec 2023 03:01:12 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Dec 2023 03:01:11 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 11 Dec 2023 03:01:11 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 11 Dec 2023 03:01:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xpg3MyvgXRIClu+GGVmcSAXFdsnAsVT0hsGNlzzdW4kk4qclhO+FwpWuTqmrpcYPZnDysxGmxCfb7J7BN+UN39mKzszE6o+NxH8h257pmNqBw8LqU2Qk6k0JHT6Wj3e9GtrRCg2RZkMPBWjBEK/uW56gRpsvqRDyHZwJMDX+hxzpOVTZd12QOEmxTw7f3TdIYQdXvl07UIF+0hV+0sidRgMZk/oBTBbNoYcn2Fvt7Z0lj1sua9V2dtE5UutEsMPtjfJzRe6nJlkxre3l0nSNV/zLhmFh7B/iOyR5/ucNa3Wc5ceWCgR+M0D+zsJSAVXmrZPo/n0KChzpPmp8OGOnlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6+Mvt7oif1Kb7HpxDue/E+N8GhJDozLdl7pM2S7/TYw=;
 b=eVKcLRPNq7RFHs1Wymu02BDGDuciwn9uUFqt3njiZZQPdq9yTTJW6BVyLkw7VVB7S9m+2BZXVqx+xCAsUBEL+jfPD9FgdX/g/Ndio2GfbCBa7uNZQYx59atFH1a3FvDkU3BAdXkE6wVJMcg4mJEMF6yaSirJMLAJ4KBZlfSUM3bzrDiIi4MKRrwOLDvwUQHMpVjUobY/k2oLD06ocKCpeYgdISsu7Hgll+nCQ/L/+eJYhcYAeUfmFHo/+9EweVFtED0U3hIOXvkK8fVQmchve1n9XoTFcd7fw2wptNOR4SYOoG0ZAgulD0CypXK7npm6j0RX1QQRjT1JR5vcIiMLKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS7PR11MB6197.namprd11.prod.outlook.com (2603:10b6:8:9b::17) by
 PH7PR11MB8036.namprd11.prod.outlook.com (2603:10b6:510:248::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32; Mon, 11 Dec
 2023 11:01:07 +0000
Received: from DS7PR11MB6197.namprd11.prod.outlook.com
 ([fe80::dcc5:de54:e4ab:7e49]) by DS7PR11MB6197.namprd11.prod.outlook.com
 ([fe80::dcc5:de54:e4ab:7e49%4]) with mapi id 15.20.7068.031; Mon, 11 Dec 2023
 11:01:07 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>, "Tauro, Riana"
 <riana.tauro@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Subject: RE: [v3 1/2] drm/xe: Add a new memory directory under tile
Thread-Topic: [v3 1/2] drm/xe: Add a new memory directory under tile
Thread-Index: AQHaKR6fNKdGlUEMC0CrghroNxq/z7Cez/JggAA+zYCABM7DgIAABfIAgAAMp0A=
Date: Mon, 11 Dec 2023 11:01:07 +0000
Message-ID: <DS7PR11MB61976F9270AF44005B1DD97E818FA@DS7PR11MB6197.namprd11.prod.outlook.com>
References: <20231207151739.1241374-1-sujaritha.sundaresan@intel.com>
 <20231207151739.1241374-2-sujaritha.sundaresan@intel.com>
 <SJ1PR11MB6204399019B23285D88A04B1818AA@SJ1PR11MB6204.namprd11.prod.outlook.com>
 <692a9b93-dfba-43b9-a838-9e4cd20fa093@intel.com>
 <cb403e6c-cca5-4495-b1d1-57b38fffdaab@intel.com>
 <16f7e629-98da-456c-9506-27448c8246fe@intel.com>
In-Reply-To: <16f7e629-98da-456c-9506-27448c8246fe@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR11MB6197:EE_|PH7PR11MB8036:EE_
x-ms-office365-filtering-correlation-id: dd086163-f380-480e-a486-08dbfa3879f7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: N0O0ulCHstDk1yGxffGFZ2Zy0Lnwm+rlGmgtXzZepBNfdrePpUODKAsunGcUfVBBu3d5K3jot7IvgTrUlnYE9CXBfUYQJxgUyHxAXM20rPsxhIgCLrDREyCBmS1MhQkgkEwhafO4GytwqVn0U1JuHQAnbqmOsdMhIpNH7jsCCrcFjIq7dt3yojQkUIHQ/eHORlE/tZN0lg6M4MsSPv/od+FFqk/Giuv5BpWpo2fDz3h3MPyXvGthd8/uj7QFD4g/yUFgyLmRxHQtLSXmvBvSbtCMwFXt8LJFx3r1WISeHtuWT4Rrzjy92/YbUTPhqVjlYwAlwYUmo37Q5ioZezgGCkIq4ZZz4xCIz0HGwp8USTxt1m0Bexc45m8/GJH/6uu/w8Wwsgfod7XTEG+YCVYKbVH9U5kCnyQsXColkRLb4tLwrRo8sKwuz5M7urUWnBhhK2VIXBk4L8SEg9yAQuNzR3vxscB6daXxLKGBvldlFb+YAf76PvV4GGvFNwtakwvy1Q5HfnzZ+nCQZ6llQipnbFOstob4j5Qlx67DIzYNzr7baARFQohLcyC44tGCu4vMKUCtLZiZtDR7HsyNt8T+t2gNMF7GBWh9ZxacDclpj0iHivBAcS4aAhKBPP26ZBLH
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB6197.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(366004)(376002)(346002)(136003)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(6506007)(7696005)(2906002)(64756008)(66446008)(66476007)(66556008)(66946007)(52536014)(53546011)(9686003)(71200400001)(122000001)(38100700002)(86362001)(33656002)(8936002)(4326008)(8676002)(316002)(5660300002)(76116006)(55016003)(110136005)(478600001)(41300700001)(107886003)(82960400001)(38070700009)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MzltdUhlMmtKVFduS2lxTFRmOWxuaS9TNkljdzdoalY4TDB2bEZlb29TMWM5?=
 =?utf-8?B?emV5elFFTlc2cFY0VTJiajM4K3F1VWowTW1tU2wrNFpZMlplc3FXRHNQd1Q1?=
 =?utf-8?B?MndQbU8xZVllTHdtTEM2SnVHOFBpTTlsT3QzaGh0czVGRFVhSGRpa3lxMUg1?=
 =?utf-8?B?Q0l2eS9vUVVjQk9hanBUbHQ0QjhWOG9iSzNkZ1RoNlhGcXRZWkpka3RCdmxP?=
 =?utf-8?B?cy8zaG9EVFBTMldQdWI1dDg5bDlDeE9TLzNxbE1SbzZWMmhKdlZ1Wnd3V1ds?=
 =?utf-8?B?RkdQYVNoYjZxK3FuUFJ5VGxlZnpFQVI0STFLdTRPYzcveVpTWXlqWFhvYjc5?=
 =?utf-8?B?TVcycEZZTjZIcjBPYjJYY0d0R2w4WVAvb0RIMkN3ZG9FSGltT1k3eW1jazZn?=
 =?utf-8?B?UzlRRHFpVU9vNWk3cDVaR1dZSzI4WWNvOTRlUlYwakNwSDR6b29GM296R0g1?=
 =?utf-8?B?dk1xc3NYSEc3TmNQMStDWkQxVFJwc0ovcTZKYW5sMW43NFlLSnJBbGlqbnM1?=
 =?utf-8?B?MUN5UnQ3VFI0Q1FObUNqSnBEeVRNL0RzMUZtWEJWc2EreUtXcFhtQUc5QjBQ?=
 =?utf-8?B?eC95cXlMSDhNdXBTM0NBWXpBeFkzWFVhNnhSaVEvcXJoU29WM2NkVXpRaFZG?=
 =?utf-8?B?U2JrenV6dkcvQ1UwVHczeE5LQldNbG1laHppMGZ5cGFMcXEyVlNmRDB3a2Zi?=
 =?utf-8?B?OFkzQkNIMWd0QnVieGtGd2dUVSt5RzRJNmtLR01ZQVVJTENyeGwwd2pwRTRv?=
 =?utf-8?B?SStqL0M4Ymx1VFc0QkllQzQ0OEt3MWEybmJveXA3OEFyM3pHOStEcHlyamJ5?=
 =?utf-8?B?MVZrc0dwU1hjaVRuY25SVFVnNDNnaHBZWndCaGtqMzNMOHFPVzZmVEZIK01I?=
 =?utf-8?B?SWU2cnVPNklhNUhOcjRHWWFmOEhyZ0RWNTB2OS8vK242SXN2RG1XMWdnTm1j?=
 =?utf-8?B?b2pkOFF4Qzc0RWtNYVNDdGdTNnpjck5pOTBtRHNySEppaUlsb2pwbHNycU41?=
 =?utf-8?B?aW5LWlFJMWQxSEhmOWoyTVM4MmdQdFFuL1I1QytLdHN6dU0wRTF5UUFYR2ND?=
 =?utf-8?B?ajdxNklyWEp3RUhJL1g3Z0Vyc0tWQUZ3Skc1cGhpZnh6SnFLdGN3UUpSNklp?=
 =?utf-8?B?aStZUUFsRHlaY2YrTjlVWUZvTkhXTk1KK20vVkpzWGVSczZhQ2dzZmxiU3dF?=
 =?utf-8?B?aTJWQ0svdjg2aFhwM3B4YSt3T3lRUyt2OU5UOEhLRy8wSHd6UktPU1BhWkZW?=
 =?utf-8?B?V3JJQmNCMnl1Y0J1QjdMRHh5WTlUc3picUdNSUZYV2hsNS95QXI0MjZLLzBu?=
 =?utf-8?B?RjZDVm16VjQ0TW0ra1QyN1c5YVBLU0cvc1BxS0JiQzVUOEt5SXdlc3FLTG5W?=
 =?utf-8?B?U1hjUDI0VWpEODBYSU5Sb2ZOY2MwcFNXYmpWTnhQMjFxOHc3WngxdkVvM2hR?=
 =?utf-8?B?RU1xZVE0dFBBRzRMc3Z2bzlLdCtRQzZ2NUJFQkZaZlRaZGNiL1lxK1UyL3J5?=
 =?utf-8?B?Skx4SVRPUVR6aTk0b3Fjb1d3SnUwclZ1Ymswd2N4NDBHc0hLdW1uQnFMd0F3?=
 =?utf-8?B?ZjFlZ2NIaDJSaE5nblljc2FaT2tuRnpLRGNFRVowWU9Wd3BXTzBvUWRIT2Vp?=
 =?utf-8?B?OWRBV0lDM0tRVjhZa3Nqa1RhMmlLRmtXb0RqUzMwcEJWVnRNb3JIMDQ4bzdq?=
 =?utf-8?B?NldYWUNxbkZyRjJLam5HelI4THdmdlNDUmdvM1BmTzZlTzk2QmFBZ3I4aFZs?=
 =?utf-8?B?dWRCNnI2OTVZNVllUDM4aGo2S3pWZWxBa2VFMkdQS3VWR1huenhnQVRKRlAy?=
 =?utf-8?B?SE12OXJ6eEE0eWk3M1RQcjBxWVNSd2RzUHpSYlQvYWV5bC9ZRHFXaEczak4r?=
 =?utf-8?B?NVBBTXUzaGVNM3Z4NEIwUU9ZNndwMFk3U2YvaEJ0VWNVallJVWFyYit6ckgr?=
 =?utf-8?B?ZVNxM2tCb3lwZk4vWDJTOXl5Ymw0WG9SRjg1bHN4YlNZS1I2V2hVTERvcThz?=
 =?utf-8?B?VW1zWlltajlVemZVVnp3RXBRdko4Uk42THNFelJ3aWNhR1Y2eUdEL0N5V0dr?=
 =?utf-8?B?aXc5cW5CcThIcGR2bUtIQTRmN2tLYnZCSzFQbVdtV2VrVGdhbmtFQkwycXJ5?=
 =?utf-8?B?R2FIbzFSK3pCdXgwQnE3SjcxZDRFMVpRZkVNTXNzMXV0Q01vcVhkcUgyNTZP?=
 =?utf-8?Q?Uo395hmqZrWFijmqGgmTlHOmcbVQb1udJ8PFvQagipSk?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6197.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd086163-f380-480e-a486-08dbfa3879f7
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2023 11:01:07.4074 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uQHuoYGXR6akVp7ezbjSjPa1JZNIjsrruSP4MCNhYj2p9m+TdvLkk1FcOhLskeFFAYM+F6I123uqw1unf+4Ng7rZHz16tVCc+f3cTlNzkk8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8036
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogU3VuZGFyZXNhbiwgU3Vq
YXJpdGhhIDxzdWphcml0aGEuc3VuZGFyZXNhbkBpbnRlbC5jb20+DQo+IFNlbnQ6IE1vbmRheSwg
RGVjZW1iZXIgMTEsIDIwMjMgMzo0NSBQTQ0KPiBUbzogVGF1cm8sIFJpYW5hIDxyaWFuYS50YXVy
b0BpbnRlbC5jb20+OyBVcGFkaHlheSwgVGVqYXMNCj4gPHRlamFzLnVwYWRoeWF5QGludGVsLmNv
bT47IGludGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogR3VwdGEsIEFuc2h1bWFu
IDxhbnNodW1hbi5ndXB0YUBpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbdjMgMS8yXSBkcm0v
eGU6IEFkZCBhIG5ldyBtZW1vcnkgZGlyZWN0b3J5IHVuZGVyIHRpbGUNCj4gDQo+IA0KPiBPbiAx
Mi8xMS8yMDIzIDM6MjMgUE0sIFJpYW5hIFRhdXJvIHdyb3RlOg0KPiA+IEhpIFN1amENCj4gPg0K
PiA+IE9uIDEyLzgvMjAyMyAxOjU4IFBNLCBTdW5kYXJlc2FuLCBTdWphcml0aGEgd3JvdGU6DQo+
ID4+DQo+ID4+IE9uIDEyLzgvMjAyMyAxMDozMyBBTSwgVXBhZGh5YXksIFRlamFzIHdyb3RlOg0K
PiA+Pj4NCj4gPj4+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+Pj4+IEZyb206IFN1
bmRhcmVzYW4sIFN1amFyaXRoYSA8c3VqYXJpdGhhLnN1bmRhcmVzYW5AaW50ZWwuY29tPg0KPiA+
Pj4+IFNlbnQ6IFRodXJzZGF5LCBEZWNlbWJlciA3LCAyMDIzIDg6NDggUE0NCj4gPj4+PiBUbzog
aW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+ID4+Pj4gQ2M6IFVwYWRoeWF5LCBUZWph
cyA8dGVqYXMudXBhZGh5YXlAaW50ZWwuY29tPjsgVGF1cm8sIFJpYW5hDQo+ID4+Pj4gPHJpYW5h
LnRhdXJvQGludGVsLmNvbT47IEd1cHRhLCBBbnNodW1hbg0KPiA+Pj4+IDxhbnNodW1hbi5ndXB0
YUBpbnRlbC5jb20+OyBTdW5kYXJlc2FuLCBTdWphcml0aGENCj4gPj4+PiA8c3VqYXJpdGhhLnN1
bmRhcmVzYW5AaW50ZWwuY29tPg0KPiA+Pj4+IFN1YmplY3Q6IFt2MyAxLzJdIGRybS94ZTogQWRk
IGEgbmV3IG1lbW9yeSBkaXJlY3RvcnkgdW5kZXIgdGlsZQ0KPiA+Pj4+DQo+ID4+Pj4gQWRkIGEg
bmV3IG1lbW9yeSBkaXJlY3RvcnkgdW5kZXIgL2RldmljZS90aWxlPG4+IGFuZCBtb3ZlDQo+ID4+
Pj4gcGh5c2ljYWxfdnJhbV9zaXplIGF0dHJpYnV0ZSB0byB0aGUgbmV3IGRpcmVjdG9yeS4NCj4g
Pj4+Pg0KPiA+Pj4+IE5ldyBoaWVyYXJjaHk6DQo+ID4+Pj4NCj4gPj4+PiAvZGV2aWNlL3RpbGU8
bj4vbWVtb3J5L3BoeXNpY2FsX3ZyYW1fc2l6ZV9ieXRlcw0KPiA+Pj4+DQo+ID4+Pj4gdjI6IEZp
eCBoZWFkaW5nIHR5cG8gKFJpYW5hKQ0KPiA+Pj4+IMKgwqDCoMKgIEZpeCBjbGVhbnVwIGVycm9y
IG9uIHVubG9hZC9yZWxvYWQgY3ljbGUNCj4gPj4+Pg0KPiA+Pj4+IHYzOiBGaXggcmVsb2FkIGVy
cm9yIHdpdGgga29iamVjdF9wdXQgaW4gcGxhY2UNCj4gPj4+PiDCoMKgwqDCoCBvZiBrb2JqZWN0
X2RlbCAoVGVqYXMpDQo+ID4+Pj4NCj4gPj4+PiBTaWduZWQtb2ZmLWJ5OiBTdWphcml0aGEgU3Vu
ZGFyZXNhbg0KPiA+Pj4+IDxzdWphcml0aGEuc3VuZGFyZXNhbkBpbnRlbC5jb20+DQo+ID4+Pj4g
LS0tDQo+ID4+Pj4gwqAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3RpbGVfc3lzZnMuYyB8IDE5ICsr
KysrKysrKysrKysrLS0tLS0NCj4gPj4+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMTQgaW5zZXJ0aW9u
cygrKSwgNSBkZWxldGlvbnMoLSkNCj4gPj4+Pg0KPiA+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0veGUveGVfdGlsZV9zeXNmcy5jDQo+ID4+Pj4gYi9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfdGlsZV9zeXNmcy5jDQo+ID4+Pj4gaW5kZXggMTYzNzY2MDdjNjhmLi42NGJlMWYzYTM4YTkg
MTAwNjQ0DQo+ID4+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3RpbGVfc3lzZnMuYw0K
PiA+Pj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV90aWxlX3N5c2ZzLmMNCj4gPj4+PiBA
QCAtMjQsNyArMjQsOCBAQCBzdGF0aWMgc3NpemVfdA0KPiA+Pj4+IMKgIHBoeXNpY2FsX3ZyYW1f
c2l6ZV9ieXRlc19zaG93KHN0cnVjdCBkZXZpY2UgKmtkZXYsIHN0cnVjdA0KPiA+Pj4+IGRldmlj
ZV9hdHRyaWJ1dGUgKmF0dHIsDQo+ID4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgY2hhciAqYnVmKQ0KPiA+Pj4+IMKgIHsNCj4gPj4+PiAtwqDCoMKgIHN0cnVjdCB4
ZV90aWxlICp0aWxlID0ga29ial90b190aWxlKCZrZGV2LT5rb2JqKTsNCj4gPj4+PiArwqDCoMKg
IHN0cnVjdCBrb2JqZWN0ICprb2JqID0gJmtkZXYtPmtvYmo7DQo+ID4+Pj4gK8KgwqDCoCBzdHJ1
Y3QgeGVfdGlsZSAqdGlsZSA9IGtvYmpfdG9fdGlsZShrb2JqLT5wYXJlbnQpOw0KPiA+Pj4gQXMg
Q2hyaXN0bWFzIGlzIGFwcHJvYWNoaW5nLCB5b3UgbWlnaHQgd2FudCB0byBhZGp1c3QgdGhpcyBp
bg0KPiA+Pj4gQ2hyaXN0bWFzIHRyZWUgb3JkZXIuDQo+ID4+Pg0KPiA+Pj4+IMKgwqDCoMKgwqAg
cmV0dXJuIHN5c2ZzX2VtaXQoYnVmLCAiJWxsdVxuIiwNCj4gPj4+PiB0aWxlLT5tZW0udnJhbS5h
Y3R1YWxfcGh5c2ljYWxfc2l6ZSk7DQo+ID4+Pj4gwqAgfQ0KPiA+Pj4+IEBAIC0zNiw4ICszNywx
MCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGF0dHJpYnV0ZQ0KPiA+Pj4+ICpwaHlzaWNhbF9tZW1z
aXplX2F0dHIgPQ0KPiA+Pj4+DQo+ID4+Pj4gwqAgc3RhdGljIHZvaWQgdGlsZV9zeXNmc19maW5p
KHN0cnVjdCBkcm1fZGV2aWNlICpkcm0sIHZvaWQgKmFyZynCoCB7DQo+ID4+Pj4gLcKgwqDCoCBz
dHJ1Y3QgeGVfdGlsZSAqdGlsZSA9IGFyZzsNCj4gPj4+PiArwqDCoMKgIHN0cnVjdCBrb2JqZWN0
ICprb2JqID0gYXJnOw0KPiA+Pj4+ICvCoMKgwqAgc3RydWN0IHhlX3RpbGUgKnRpbGUgPSBrb2Jq
X3RvX3RpbGUoa29iai0+cGFyZW50KTsNCj4gPj4+IERpdHRvDQo+ID4+Pg0KPiA+Pj4+ICvCoMKg
wqAga29iamVjdF9wdXQoa29iaik7DQo+ID4+Pj4gwqDCoMKgwqDCoCBrb2JqZWN0X3B1dCh0aWxl
LT5zeXNmcyk7DQo+ID4+Pj4gwqAgfQ0KPiA+Pj4+DQo+ID4+Pj4gQEAgLTQ2LDYgKzQ5LDcgQEAg
dm9pZCB4ZV90aWxlX3N5c2ZzX2luaXQoc3RydWN0IHhlX3RpbGUgKnRpbGUpDQo+ID4+Pj4gwqDC
oMKgwqDCoCBzdHJ1Y3QgeGVfZGV2aWNlICp4ZSA9IHRpbGVfdG9feGUodGlsZSk7DQo+ID4+Pj4g
wqDCoMKgwqDCoCBzdHJ1Y3QgZGV2aWNlICpkZXYgPSB4ZS0+ZHJtLmRldjsNCj4gPj4+PiDCoMKg
wqDCoMKgIHN0cnVjdCBrb2JqX3RpbGUgKmt0Ow0KPiA+Pj4+ICvCoMKgwqAgc3RydWN0IGtvYmpl
Y3QgKmtvYmo7DQo+ID4+Pj4gwqDCoMKgwqDCoCBpbnQgZXJyOw0KPiA+Pj4+DQo+ID4+Pj4gwqDC
oMKgwqDCoCBrdCA9IGt6YWxsb2Moc2l6ZW9mKCprdCksIEdGUF9LRVJORUwpOyBAQCAtNjQsMTIg
KzY4LDE3IEBADQo+ID4+Pj4gdm9pZCB4ZV90aWxlX3N5c2ZzX2luaXQoc3RydWN0IHhlX3RpbGUg
KnRpbGUpDQo+ID4+Pj4NCj4gPj4+PiDCoMKgwqDCoMKgIHRpbGUtPnN5c2ZzID0gJmt0LT5iYXNl
Ow0KPiA+Pj4+DQo+ID4+Pj4gLcKgwqDCoCBpZiAoSVNfREdGWCh4ZSkgJiYgeGUtPmluZm8ucGxh
dGZvcm0gIT0gWEVfREcxICYmDQo+ID4+Pj4gLcKgwqDCoMKgwqDCoMKgIHN5c2ZzX2NyZWF0ZV9m
aWxlKHRpbGUtPnN5c2ZzLCBwaHlzaWNhbF9tZW1zaXplX2F0dHIpKQ0KPiA+Pj4+ICvCoMKgwqAg
a29iaiA9IGtvYmplY3RfY3JlYXRlX2FuZF9hZGQoIm1lbW9yeSIsIHRpbGUtPnN5c2ZzKTsNCj4g
Pj4+PiArwqDCoMKgIGlmICgha29iaikgew0KPiA+Pj4+ICvCoMKgwqDCoMKgwqDCoCBkcm1fd2Fy
bigmeGUtPmRybSwgIiVzIGZhaWxlZCwgZXJyOiAlZFxuIiwgX19mdW5jX18sIC0NCj4gPj4+PiBF
Tk9NRU0pOw0KPiA+Pj4+ICvCoMKgwqAgfQ0KPiA+DQo+ID4gVGhlcmUgd2lsbCBiZSBhbiBlbXB0
eSBtZW1vcnkgZGlyZWN0b3J5IGluIGNhc2Ugb2YgaWdmeC4gU2hvdWxkIHRoZQ0KPiA+IG1lbW9y
eSBkaXJlY3RvcnkgYmUgY3JlYXRlZCBvbmx5IGlmIHRoZXJlIGFyZSBhdHRyaWJ1dGVzIGF2YWls
YWJsZT8NCg0KWWVzIEkgdGhpbmsgaXQgc2hvdWxkIGJlIHRha2luZyBjYXJlIG9mIGFsbCBjb25k
aXRpb25zIHdoaWNoIHBoeXNpY2FsX21lbXNpemVfYXR0ciBzeXNmcyBmaWxlIHdhcyBjcmVhdGVk
IHdpdGguDQoNClRoYW5rcywNClRlamFzDQo+ID4NCj4gPiBUaGFua3MNCj4gPiBSaWFuYQ0KPiAN
Cj4gSSBjYW4gaGF2ZSBpdCBhZGRlZCBvbmx5IGlmIElTX0RHRlggaWYgdGhhdCB3b3Jrcy4NCj4g
DQo+IFRoYW5rcywNCj4gDQo+IFN1amENCj4gDQo+ID4+PiB7IH0gaXMgbm90IHJlcXVpcmVkIGhl
cmUuDQo+ID4+Pg0KPiA+Pj4gVGVqYXMNCj4gPj4NCj4gPj4gV2lsbCBmaXggYWxsIG9mIHRoZSBh
Ym92ZS4NCj4gPj4NCj4gPj4gVGhhbmtzLA0KPiA+Pg0KPiA+PiBTdWphDQo+ID4+DQo+ID4+Pj4g
Kw0KPiA+Pj4+ICvCoMKgwqAgaWYgKGtvYmogJiYgSVNfREdGWCh4ZSkgJiYgeGUtPmluZm8ucGxh
dGZvcm0gIT0gWEVfREcxICYmDQo+ID4+Pj4gK8KgwqDCoMKgwqDCoMKgIHN5c2ZzX2NyZWF0ZV9m
aWxlKGtvYmosIHBoeXNpY2FsX21lbXNpemVfYXR0cikpDQo+ID4+Pj4gwqDCoMKgwqDCoMKgwqDC
oMKgIGRybV93YXJuKCZ4ZS0+ZHJtLA0KPiA+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgIlN5c2ZzIGNyZWF0aW9uIHRvIHJlYWQgYWRkcl9yYW5nZSBwZXIgdGlsZQ0KPiA+Pj4+IGZh
aWxlZFxuIik7DQo+ID4+Pj4NCj4gPj4+PiAtwqDCoMKgIGVyciA9IGRybW1fYWRkX2FjdGlvbl9v
cl9yZXNldCgmeGUtPmRybSwgdGlsZV9zeXNmc19maW5pLA0KPiA+Pj4+IHRpbGUpOw0KPiA+Pj4+
ICvCoMKgwqAgZXJyID0gZHJtbV9hZGRfYWN0aW9uX29yX3Jlc2V0KCZ4ZS0+ZHJtLCB0aWxlX3N5
c2ZzX2ZpbmksDQo+ID4+Pj4gK2tvYmopOw0KPiA+Pj4+IMKgwqDCoMKgwqAgaWYgKGVycikgew0K
PiA+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBkcm1fd2FybigmeGUtPmRybSwgIiVzOiBkcm1tX2Fk
ZF9hY3Rpb25fb3JfcmVzZXQgZmFpbGVkLA0KPiA+Pj4+IGVycjogJWRcbiIsDQo+ID4+Pj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBfX2Z1bmNfXywgZXJyKTsNCj4gPj4+PiAtLQ0KPiA+
Pj4+IDIuMjUuMQ0K
