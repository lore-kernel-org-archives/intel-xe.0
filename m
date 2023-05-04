Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6C83C7EE21
	for <intel-xe@archiver.kernel.org>; Thu,  4 May 2023 17:16:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FCBF10E4DA;
	Thu,  4 May 2023 17:16:13 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C41610E4DA
 for <intel-xe@lists.freedesktop.org>; Thu,  4 May 2023 17:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683220571; x=1714756571;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=js2V6i46L8AQ35Pp9t+fjv3yM0Im8hLTw6yYAcJnP2A=;
 b=CM1CpH3qTqdO2oISBSydu73Rt18YL0QE1M48b2cdqVta0SgVjlES4brd
 rRaXD8GRA3T3Rwalqhf6t0SCSsQwmsuq658dboeJhhB0KwjL0ccu9K/ew
 yoiU2eEnF8Ezdg7dIefx57WRnDCd44JzSCGqcqLKwRpTxSdY2iZhwoiow
 7Z7jQizOwSm4/jgE5tmLJsZnfvj2fkeqOQHd0cMt2LGKkv8V6g7Rx5c7q
 zcD9axBaI+hGGw5jmyxdpv04QhZG5jACqnGf7t87Sm3NCsNOf2ppqXegf
 WMTgXuIt6xGVG/JSQ2N0xD+T69fXreygmEt3IZbXizD/kytLCF2s6Drab Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="377069355"
X-IronPort-AV: E=Sophos;i="5.99,250,1677571200"; d="scan'208";a="377069355"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2023 10:13:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="766658857"
X-IronPort-AV: E=Sophos;i="5.99,250,1677571200"; d="scan'208";a="766658857"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga004.fm.intel.com with ESMTP; 04 May 2023 10:13:39 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 4 May 2023 10:13:39 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 4 May 2023 10:13:39 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 4 May 2023 10:13:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hXaBNeOeBVOhWS6IykN8TGUar2uu6JslO48F6g3SfDhl7YPc9QuPO+cQrC0bB/zI5gCfYkAxIlHdRgCb8qR70xe7pHFzITGllgq5whYOhCmwvMhMBFrhowmj7AcQO3mIkqZtTqhYZlBePdA0nCeJVyWPqs1ctIKs0fTCMEWLgsun3uBPpePRbOjpd7t5dvvya8ID2cyJBp4ZefWunpL2YAZv1AKEaSov1CW/Bi9FGULwUD78Xrnl4A24Yd4PB9466nVe0gL3MuSBXIDTfvbhmEWosatRzLJNK7q6szJ8N7ae8mDs2+REeZ+HrFJI11TAnqFgnvBd2qjbL/XmG/dkzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=js2V6i46L8AQ35Pp9t+fjv3yM0Im8hLTw6yYAcJnP2A=;
 b=b6B2tq3YbyZzd1QnOtyev9tJXefCX8dFF9PmIPC04VSTdZDvPOul/S3Qbz6gBeJ4DzIvG0Rili+gLsIENIdLdLj4WLErTdzjeBVeNT6gIH+BL1CzTGqJrxyxEy29djLqj8WT2EVWCj1nkhYIt95sAl5chCu4wQKxfS0UE9309fcgfP2VGA+nGV+GHI570ebBVdGjgWKULULQh4fsAlRxEkHEEGCLTLlk78r9HMfZdluEivleQhKPPKfVvyBfe3XQAoBwZ5EIJSrKzd98aedylnPJdhNpHI7od1ucCjZg7Ak/slN0z1AY7T4s178x8tTFWbsHxBPbljYLlAQjeE9ZsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by DS0PR11MB7902.namprd11.prod.outlook.com (2603:10b6:8:f6::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6363.22; Thu, 4 May 2023 17:13:35 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::3fa1:b97c:a5bb:651]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::3fa1:b97c:a5bb:651%3]) with mapi id 15.20.6363.026; Thu, 4 May 2023
 17:13:35 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>
Thread-Topic: [PATCH v4 2/2] drm/xe: Set default MOCS value for copy cs
 instructions
Thread-Index: AQHZfpJ/cgSv2HmXlUug6Uvkt8PM269KKcmAgAAwkwA=
Date: Thu, 4 May 2023 17:13:35 +0000
Message-ID: <fdbcd2cad83dad46453ff6887723468024a8c3df.camel@intel.com>
References: <20230504141227.29785-1-jose.souza@intel.com>
 <20230504141227.29785-2-jose.souza@intel.com>
 <20230504141941.GF6250@mdroper-desk1.amr.corp.intel.com>
In-Reply-To: <20230504141941.GF6250@mdroper-desk1.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|DS0PR11MB7902:EE_
x-ms-office365-filtering-correlation-id: 79602e18-1694-46bc-daad-08db4cc2e4f9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: P7GP/HXtQYt8nowhDSNURMhi+8fznTVuRKxMBKiopLvmL4k/4gL0eL2PjhTg7JCbrz+9CajXXflLQe+FizEzCt6SWtjcOtfCXZvhU+FKlMdT0JeQD6L7+uSxRRd1/zmuEUSjkZT1AbLvQQo9N1+4jGaV/SNpgIPgtXVUYP7wVgWNdMXwz2lvyxzJXnKh8JXtFa9lcgRrkHxke9il321KALLgmd4S2gZwKseRVPa79G2miZtCSv90xU/gBspxZsePiVANMimCaxM45Z6XVZIuikRAPv4OMOogXY7eRpy5jeGiLXXSlet7LjUB2nQITUXeegGBe0EfEE3P2mJxEzTwu8m7CzHcOQGXdwhmL99vV3RUrhF3ae2QtsEm7ljmDlDBWcLw53GTlqzOdHmfdh1bS+cYAHM5cP3SVAvHUFcuVWaHO3XK/RacFHFhmgKxdypDTAFL9uQcxzftoKjjC4T9r7e+qEoSGnbaWsRKZyBMbdRZbmneXEBZiUHOn8eNibJDZsj61s9wUQuWQwnVKtArf+jeFiwZ5xrE7GUujFj1Ba0C1iuvdEsw3tDVdQmWne5MGLjF+DYq8jdVFdfDvBo4B4zrNptuaGAktz8zzBC9BacUR4dhRUCnQYAkZA/ylpSE
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(396003)(366004)(376002)(136003)(39860400002)(451199021)(86362001)(36756003)(91956017)(37006003)(76116006)(478600001)(66556008)(66446008)(64756008)(66946007)(6636002)(71200400001)(4326008)(66476007)(6486002)(316002)(5660300002)(8936002)(41300700001)(2906002)(6862004)(38070700005)(82960400001)(186003)(8676002)(122000001)(38100700002)(2616005)(26005)(6512007)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y2Q2cWl4Y05iMjdJdC8rYmFzd082T25VcGg3OVBsNkVFenozenY5a1RBYk9I?=
 =?utf-8?B?SGk4THZFcmw1MldMZ1NSRzFrdkkzSWF6eFVVUVUrUzJ0d1ZLZnVBTE1DcVBx?=
 =?utf-8?B?T2ZucEQzcXBndTdSR05QM083TUIxd3ZQcVRqRjllZ0pHaG5QcTlubXNLNERx?=
 =?utf-8?B?REx2MXEzdzY0dGpzM3RaVE1WVHVVc0drdGk5MzFwRTZYcVkwWFkvUXZUa1Rt?=
 =?utf-8?B?TVJhL3NWMGFCdmN4SjhTYlNjVjNYTUNyK2tGbkV0Q0VhL2x4cnJKdUpyaVVr?=
 =?utf-8?B?a1VRbnYzcWlsdzVrVEsydkhIYWF6ZUhnVzJTL3paZ2xxcXF4dFFqdWlyTmQ1?=
 =?utf-8?B?QlY4ZGdGbzdtTWo1elU2REJCbTdHZGxsRU1HenAwdUp2L0VMRmRnMU5oQzZN?=
 =?utf-8?B?STlIYzk3Y3FMbmM0Qk9OTEZiSTdYMk9XcUg0c3piM2tPQ0ZKZ3QwS2pPQng5?=
 =?utf-8?B?ZVgveGVIbXZ1R0dtWnpieTVtNCt1S2c3RGdzOTFtWk1XSlNEb1U4U2N2VTl0?=
 =?utf-8?B?enRBUUVPUzJndWN4cWFmUWZrd0NwTmdzM28zY0UrWWVLYWJ0MnZPcEZ6K1ph?=
 =?utf-8?B?ZkEzY3MxWHNPMUNkRUY0QmNwTnlXcXViamNPejNBYTNmdXpjVUtpdkE4VnRm?=
 =?utf-8?B?MUxPSDVQOE1UTnphS242R0FoSEsra0QzWS8xWnRKTDRpMXZDbUI1UDByUnpw?=
 =?utf-8?B?em9FUXgvVlRWa0hJaURnWlZuZkgxR3R2bXBvemg2d2pOb3dCVStCZEhJR3Vx?=
 =?utf-8?B?YUE3QzhUcnliYklEdTRudHM5MnlES1VUdmV3UzYvMUtSY3p2OFlGMXpwWFhy?=
 =?utf-8?B?bDV0T2tlZVhwVFdCcWdTV0dvd05yZVR4bXp5S3d0VUZiWGVWMHZsbW14dXhL?=
 =?utf-8?B?RG45Z3lRenBNM3Q2Y3AwQ1lWNG5hdWl1eVJPTzRBV2xSanZjVWpJMnVTd2Yr?=
 =?utf-8?B?WVVJS2ZkeXNuUmRXNHBaL3o4ck9IMi8vcGRZM3VJd2RNeWJvRTNFQitEOUVs?=
 =?utf-8?B?aUJzd2tCTXkrcnhLY3AyVytYb1pNbVYwSHBsSGNmeWROS2svbHVXQlgwMVNR?=
 =?utf-8?B?SXNxTGJMaC9IOEU2UHVvYWJ0b1A5UFlRczlKYWtOOUE3MDNKNU4xSnZIYUc3?=
 =?utf-8?B?UVhla2o5Y1V0bmRleUVPK1g1MVhRRlNuaE1DR2FxdStLUXQ4Nm9hVXNjTytN?=
 =?utf-8?B?NUZxZ2ZzeGdKczBRWERQbzkxbjErUVd2V3VtLzZXblJFSXBJZVNwaEhveWxE?=
 =?utf-8?B?OGpsOGU2RFg0TytlYnJhNFF1Z0RobjFWSSszdmlUcFJrM1g5Z1pIakpIK3Fw?=
 =?utf-8?B?akNxaTlxa1hVU3hrRmc4dHJHTVQxeC9NYmhYTUxzZy9VU3ZSYzBVNUErWXV5?=
 =?utf-8?B?aXJMSEZuZFk0cTNldUNFL1VUdlZQdTljOXlqWlhHaHAxWlJCRkZRazV2QmFP?=
 =?utf-8?B?b0tUMTE0UU9DTStJd0ZuODZlUmUxdmQ5YVl4TXFFMHcvUEJFYlp5SXM0QmlN?=
 =?utf-8?B?QjlBSElRaUVlS0VDWnk0WlF5Q2pJZ244Q2d6TGpvZUZxQkxPa1hqZWhWZ3RR?=
 =?utf-8?B?SXF3NkFhTTNLb3BKcXRiWjdicXBJdUZ4OWkrVG14WThDZCtuMC9sdVhKWS9J?=
 =?utf-8?B?a0pVVkIrSFZjYmhIRWxuc0pwTGxXcUswamNQZHc0VTNDUHJ5OFpWY3hxZjhs?=
 =?utf-8?B?dmovSHNOZnlaMFpCSkJOMGhrcjd0VFBBMi9PMU1KSDFlOThxNmRXZ3VsbTRr?=
 =?utf-8?B?QWZnUkVyYmxCRWp3a3VVV0ZBZHozWDYraUl0eU1hNDBiYWpybTlCVEkrdnFt?=
 =?utf-8?B?bWE3b2xjNFFHTm56dEVqSUpHOGtock5JVUswOUFRcS9zMGlyTWNpeFMzd0VQ?=
 =?utf-8?B?THhRVjhlTFgzazhEWDl2QVVrL1VTbVFQdXFRYnE0NkE2cDRtVC9oVW14OUV2?=
 =?utf-8?B?Wkhuai9NeC9BZlhtMnY5d2hPcFJzV20xNmU3NVZSQ1Z6c3JUNzR1aFdDTjBy?=
 =?utf-8?B?NlVHWlhncG1uT21MRkpwejBIUFY5UG5FZWljY05hUkh3cHFRNGRVcnRWZXBC?=
 =?utf-8?B?NHVscnBwNnplQWJzckZkQU1nc0ZJZG56NDNuamRRc2loYmRRaVJHbjQxdE4r?=
 =?utf-8?Q?Q6EMm/jzaDsKxbR0HlQRw7unW?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <928BF38D6FB00E4D8DF2F73CAB71C27B@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79602e18-1694-46bc-daad-08db4cc2e4f9
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 May 2023 17:13:35.1476 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pgsoHCeo1GKDEE3OKYZVGxD778cy9TYKtP3eGm9hDHR+o9aIwUFCA0ZblZ1exqVXRHm/pR6/dzspkk7dm98zRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7902
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v4 2/2] drm/xe: Set default MOCS value for
 copy cs instructions
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

T24gVGh1LCAyMDIzLTA1LTA0IGF0IDA3OjE5IC0wNzAwLCBNYXR0IFJvcGVyIHdyb3RlOg0KPiBP
biBUaHUsIE1heSAwNCwgMjAyMyBhdCAwNzoxMjoyN0FNIC0wNzAwLCBKb3PDqSBSb2JlcnRvIGRl
IFNvdXphIHdyb3RlOg0KPiA+IGNvcHkgY3MgaW5zdHJ1Y3Rpb25zIHRoYXQgZG9udCBoYXZlIGEg
ZXhwbGljdCBNT0NTIGZpZWxkIHdpbGwgdXNlIHRoaXMNCj4gPiBkZWZhdWx0IE1PQ1MgdmFsdWUu
DQo+ID4gDQo+ID4gVGhpcyB3YXMgbWFpbmx5IGNvcGllZCBmcm9tIGk5MTUgc291cmNlIGNvZGUu
DQo+IA0KPiBOaXQ6ICBJdCBraW5kIG9mIHNlZW1zIGxpa2UgWGUgaGFzIG1vdmVkIGZhciBlbm91
Z2ggYXdheSBmcm9tIHRoZQ0KPiBvcmlnaW5hbCBpOTE1IGNvZGUgdGhhdCB0aGlzIHNlbnRlbmNl
IGlzbid0IHJlYWxseSBuZWVkZWQgb24gZWl0aGVyIG9mDQo+IHRoZXNlIHBhdGNoZXM/DQoNClJl
bW92ZWQgb24gdjUuDQoNCnY1IHdhcyB3YXMgbmVlZGVkIGJlY2F1c2UgaHdlLT5yZWdfbHJjIGlz
IGluaXRpYWxpemVkIGxhdGVyIGFuZCBJIG9ubHkgY2F1Z2h0IGl0IG9uIENJID0vLg0KU28gdGhl
cmUgaXMgc29tZSBtaW5vciBjaGFuZ2VzLCBjYW4geW91IHRha2UgYW5vdGhlciBsb29rPw0KDQp0
aGFuayB5b3UNCg0KPiANCj4gUmV2aWV3ZWQtYnk6IE1hdHQgUm9wZXIgPG1hdHRoZXcuZC5yb3Bl
ckBpbnRlbC5jb20+DQo+IA0KPiA+IA0KPiA+IHYyOg0KPiA+IC0gbW92ZSB0byB4ZV9od19lbmdp
bmUuYw0KPiA+IC0gcmVtb3ZlIEJMSVRfQ0NUTCBhdXhpbGlhcnkgbWFjcm9zDQo+ID4gLSByZW1v
dmVkIE1BU0tFRF9SRUcNCj4gPiANCj4gPiB2MzoNCj4gPiAtIHJlYmFzZWQNCj4gPiANCj4gPiB2
NDoNCj4gPiAtIHByb2Nlc3Mgd29ya2Fyb3VuZCBpbiBod2UtPnJlZ19scmMNCj4gPiANCj4gPiBC
U3BlYzogNDU4MDcNCj4gPiBDYzogTWF0dCBSb3BlciA8bWF0dGhldy5kLnJvcGVyQGludGVsLmNv
bT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBKb3PDqSBSb2JlcnRvIGRlIFNvdXphIDxqb3NlLnNvdXph
QGludGVsLmNvbT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9ncHUvZHJtL3hlL3JlZ3MveGVfZW5n
aW5lX3JlZ3MuaCB8ICA2ICsrKysrKw0KPiA+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfaHdfZW5n
aW5lLmMgICAgICAgIHwgMjAgKysrKysrKysrKysrKysrKysrKysNCj4gPiAgMiBmaWxlcyBjaGFu
Z2VkLCAyNiBpbnNlcnRpb25zKCspDQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS94ZS9yZWdzL3hlX2VuZ2luZV9yZWdzLmggYi9kcml2ZXJzL2dwdS9kcm0veGUvcmVncy94
ZV9lbmdpbmVfcmVncy5oDQo+ID4gaW5kZXggNzE3ZDU2MDYyNmNlYy4uNzk4NzNiZjY0ZThkZCAx
MDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUvcmVncy94ZV9lbmdpbmVfcmVncy5o
DQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3JlZ3MveGVfZW5naW5lX3JlZ3MuaA0KPiA+
IEBAIC01OCw2ICs1OCwxMiBAQA0KPiA+ICANCj4gPiAgI2RlZmluZSBSSU5HX0JCQUREUihiYXNl
KQkJCVhFX1JFRygoYmFzZSkgKyAweDE0MCkNCj4gPiAgI2RlZmluZSBSSU5HX0JCQUREUl9VRFco
YmFzZSkJCQlYRV9SRUcoKGJhc2UpICsgMHgxNjgpDQo+ID4gKw0KPiA+ICsvKiBIYW5kbGluZyBN
T0NTIHZhbHVlIGluIEJMSVRfQ0NUTCBsaWtlIGl0IHdhcyBkb25lIENNRF9DQ1RMICovDQo+ID4g
KyNkZWZpbmUgQkxJVF9DQ1RMKGJhc2UpCQkJCVhFX1JFRygoYmFzZSkgKyAweDIwNCkNCj4gPiAr
I2RlZmluZSAgIEJMSVRfQ0NUTF9EU1RfTU9DU19NQVNLCQlSRUdfR0VOTUFTSygxNCwgOSkNCj4g
PiArI2RlZmluZSAgIEJMSVRfQ0NUTF9TUkNfTU9DU19NQVNLCQlSRUdfR0VOTUFTSyg2LCAxKQ0K
PiA+ICsNCj4gPiAgI2RlZmluZSBSSU5HX0VYRUNMSVNUX1NUQVRVU19MTyhiYXNlKQkJWEVfUkVH
KChiYXNlKSArIDB4MjM0KQ0KPiA+ICAjZGVmaW5lIFJJTkdfRVhFQ0xJU1RfU1RBVFVTX0hJKGJh
c2UpCQlYRV9SRUcoKGJhc2UpICsgMHgyMzQgKyA0KQ0KPiA+ICANCj4gPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX2h3X2VuZ2luZS5jIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hl
X2h3X2VuZ2luZS5jDQo+ID4gaW5kZXggZDQ5N2YwMjg5YzM3Mi4uYTdkNWQ4MTMzNWY0NyAxMDA2
NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfaHdfZW5naW5lLmMNCj4gPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0veGUveGVfaHdfZW5naW5lLmMNCj4gPiBAQCAtMjc3LDYgKzI3Nyw4
IEBAIGh3X2VuZ2luZV9zZXR1cF9kZWZhdWx0X3N0YXRlKHN0cnVjdCB4ZV9od19lbmdpbmUgKmh3
ZSkNCj4gPiAgCWNvbnN0IHU4IG1vY3NfcmVhZF9pZHggPSBndC0+bW9jcy51Y19pbmRleDsNCj4g
PiAgCXUzMiByaW5nX2NtZF9jY3RsX3ZhbCA9IFJFR19GSUVMRF9QUkVQKENNRF9DQ1RMX1dSSVRF
X09WRVJSSURFX01BU0ssIG1vY3Nfd3JpdGVfaWR4KSB8DQo+ID4gIAkJCSAgICAgICAgUkVHX0ZJ
RUxEX1BSRVAoQ01EX0NDVExfUkVBRF9PVkVSUklERV9NQVNLLCBtb2NzX3JlYWRfaWR4KTsNCj4g
PiArCXUzMiBibGl0X2NjdGxfdmFsID0gUkVHX0ZJRUxEX1BSRVAoQkxJVF9DQ1RMX0RTVF9NT0NT
X01BU0ssIG1vY3Nfd3JpdGVfaWR4KSB8DQo+ID4gKwkJCSAgICBSRUdfRklFTERfUFJFUChCTElU
X0NDVExfU1JDX01PQ1NfTUFTSywgbW9jc19yZWFkX2lkeCk7DQo+ID4gIAljb25zdCBzdHJ1Y3Qg
eGVfcnRwX2VudHJ5IGVuZ2luZV93YXNbXSA9IHsNCj4gPiAgCQkvKg0KPiA+ICAJCSAqIFJJTkdf
Q01EX0NDVEwgc3BlY2lmaWVzIHRoZSBkZWZhdWx0IE1PQ1MgZW50cnkgdGhhdCB3aWxsIGJlDQo+
ID4gQEAgLTI5Nyw4ICsyOTksMjYgQEAgaHdfZW5naW5lX3NldHVwX2RlZmF1bHRfc3RhdGUoc3Ry
dWN0IHhlX2h3X2VuZ2luZSAqaHdlKQ0KPiA+ICAJCX0sDQo+ID4gIAkJe30NCj4gPiAgCX07DQo+
ID4gKwljb25zdCBzdHJ1Y3QgeGVfcnRwX2VudHJ5IGxyY193YXNbXSA9IHsNCj4gPiArCQkvKg0K
PiA+ICsJCSAqIFNvbWUgYmxpdHRlciBjb21tYW5kcyBkbyBub3QgaGF2ZSBhIGZpZWxkIGZvciBN
T0NTLCB0aG9zZQ0KPiA+ICsJCSAqIGNvbW1hbmRzIHdpbGwgdXNlIE1PQ1MgaW5kZXggcG9pbnRl
ZCBieSBCTElUX0NDVEwuDQo+ID4gKwkJICogQkxJVF9DQ1RMIHJlZ2lzdGVycyBhcmUgbmVlZGVk
IHRvIGJlIHByb2dyYW1tZWQgdG8gdW4tY2FjaGVkLg0KPiA+ICsJCSAqLw0KPiA+ICsJCXsgWEVf
UlRQX05BTUUoIkJMSVRfQ0NUTF9kZWZhdWx0X01PQ1MiKSwNCj4gPiArCQkgIFhFX1JUUF9SVUxF
UyhHUkFQSElDU19WRVJTSU9OX1JBTkdFKDEyMDAsIFhFX1JUUF9FTkRfVkVSU0lPTl9VTkRFRklO
RUQpLA0KPiA+ICsJCQkgICAgICAgRU5HSU5FX0NMQVNTKENPUFkpKSwNCj4gPiArCQkgIFhFX1JU
UF9BQ1RJT05TKEZJRUxEX1NFVChCTElUX0NDVEwoMCksDQo+ID4gKwkJCQkgQkxJVF9DQ1RMX0RT
VF9NT0NTX01BU0sgfA0KPiA+ICsJCQkJIEJMSVRfQ0NUTF9TUkNfTU9DU19NQVNLLA0KPiA+ICsJ
CQkJIGJsaXRfY2N0bF92YWwsDQo+ID4gKwkJCQkgWEVfUlRQX0FDVElPTl9GTEFHKEVOR0lORV9C
QVNFKSkpDQo+ID4gKwkJfSwNCj4gPiArCQl7fQ0KPiA+ICsJfTsNCj4gPiAgDQo+ID4gIAl4ZV9y
dHBfcHJvY2VzcyhlbmdpbmVfd2FzLCAmaHdlLT5yZWdfc3IsIGd0LCBod2UpOw0KPiA+ICsJeGVf
cnRwX3Byb2Nlc3MobHJjX3dhcywgJmh3ZS0+cmVnX2xyYywgZ3QsIGh3ZSk7DQo+ID4gIH0NCj4g
PiAgDQo+ID4gIHN0YXRpYyB2b2lkIGh3X2VuZ2luZV9pbml0X2Vhcmx5KHN0cnVjdCB4ZV9ndCAq
Z3QsIHN0cnVjdCB4ZV9od19lbmdpbmUgKmh3ZSwNCj4gPiAtLSANCj4gPiAyLjQwLjENCj4gPiAN
Cj4gDQoNCg==
