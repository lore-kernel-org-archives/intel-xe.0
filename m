Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DAF7CDB465
	for <intel-xe@archiver.kernel.org>; Mon, 16 Oct 2023 12:43:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC16310E1CB;
	Mon, 16 Oct 2023 12:43:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8993B10E1CB
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Oct 2023 12:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697460229; x=1728996229;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Xs+PjWmTOoH/3/OkGQdwdC46Gr2QOSYjz+CDZ0laL+w=;
 b=nY/EpADdTqFN2gTsB1sVQhHCDLejewguyxozicxDXnS6HS6yOfmXbeph
 ntMCCG5lzflfUQAg8NoyaU/PEMAxSrG+vE3NrTlS0LQuRvmUR6Y6Ua6+q
 t6ZSiu6u1NG+4+JchvD9DzWFOOsYHYH7N/HQW2Pa0G9xtLybhS5HjPaem
 xeM9R0QMSjC8FbGSWp4bxY1OPLkyQS8XD2dGIwzgAugLmMUZ5v2bxXDIg
 eG4jQodO1TjPBlLhWbotK0nuDMNmore77mWWfPSGP7L3zs41mp54E6CaA
 RAvIvqWFZ2lyqU9+DwZ9UyVTh7CC16J6L4MEH0P/V6shASCdIlcUoJE5L Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="4128408"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; 
   d="scan'208";a="4128408"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2023 05:43:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="1087061241"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; d="scan'208";a="1087061241"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Oct 2023 05:43:47 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 16 Oct 2023 05:43:47 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 16 Oct 2023 05:43:46 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 16 Oct 2023 05:43:46 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 16 Oct 2023 05:43:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EqaYXVeBJQpQQnCmxxarA0CuXOLKQ/dbvihZfwQlroxdXKtiTqupOUBf+KoXfJDBYpal+PNExf1h0BBbKlPXtr8ZKF++rdWNNOppwuge8QFolR7wc3Nwxq0+zdTIgrpvls1ENZgmDv0qiBOULD7amey9AWoSBt/LLJz1TzzPucjnlk06WCShpFPzxWSVEFYGxQxuPJIENKqWs7JVNyDGEBZlZlBJOKgwqdlh+OJQvFE1pSaOGx9xyDMlOjme46olcSugiW93xGqTsJJHz0LqENk/+hOU6rv7i4RQxgymaYXiByIv/r94RRT/UCc454nTwR/EWTBpn/qDI2MvzU4XNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xs+PjWmTOoH/3/OkGQdwdC46Gr2QOSYjz+CDZ0laL+w=;
 b=JUPjSnEtMd8HnDBbuN57p5cugPiXCH91okJWGCP5J6B9arMGqvJFYADES0LoTqKuS7HFt89AKqSU7LdEblJfTR8febH0QspN9xbLR+DP+zPqGPetar4y9CPLlUcvxGjAPUzLzFHjnBgZA/1y0W3tjWDBZ6SSIQDH2w5TId2EscJxjNboAWgqVjuGSGwLIr1bALjxzMjRRTiRr7sfZ7p+4QIIcL4CdpN9bR81ROefCCZzQU2YnRLTchkCZdXhi4JddA0M7FQV9MyKRZA1xlCbQs+9cWVQpI+kKe6mZ+DiQnGmkJaSOgur0iayF6Qm17PYsoLxI0Q0wcWob8WL+1m81w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by MW4PR11MB6572.namprd11.prod.outlook.com (2603:10b6:303:1ee::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Mon, 16 Oct
 2023 12:43:44 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::94b:839a:3fa0:e539]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::94b:839a:3fa0:e539%3]) with mapi id 15.20.6886.034; Mon, 16 Oct 2023
 12:43:43 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [Intel-xe] [PATCH V6 1/2] drm/xe: Introduce low level driver
 error counting APIs
Thread-Index: AQHZ/c33i8CZKWAFsEe9p7ENbrv1PbBHxtqAgASYZqA=
Date: Mon, 16 Oct 2023 12:43:43 +0000
Message-ID: <SJ1PR11MB620468C6C545DDFB7E54B49481D7A@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20231013121633.1038322-1-tejas.upadhyay@intel.com>
 <20231013121633.1038322-2-tejas.upadhyay@intel.com>
 <f97de309-a4c2-49b4-a71c-feb5c0db8f3e@intel.com>
In-Reply-To: <f97de309-a4c2-49b4-a71c-feb5c0db8f3e@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|MW4PR11MB6572:EE_
x-ms-office365-filtering-correlation-id: 379edc6e-3898-40ca-3b44-08dbce458864
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: i9t5c4y04zUnmBqWan27AAU4r6vnmI0MXUtFqpn/4uYs0WlIoYTPyvwxFekl7ihVfHPGXovL+aT2J0+b1WNNGuygmR7FfSQgkb1LVbN9uoX2pswxyYBZ4Jxj/ygZyazKs6IY4GOrKgymM+1juyvmCH1n3h8+JMx61o6UYI7sfsgL/4UaW9OQhUfK5rsFB/3A/673VZfzB2YbWH0/X9UhIk57fvZ6VgVs13u5BYx8WT2d7y1cVVFIeqyWDrecAvvyRq/WkHlZX/K07Gxd1/Wm4tNOAB43eymoToU8W1mdC5NyPtHqU77q0UDb4w764zsxDEa4UDL0aBSvC2GUjaq3ugOQgo98rU+E3m+inEJtwnotk69hjINkdwKVe2CMurZWhhlhE4y2im0RK12VNx7gOCVE+1dsPZEd1qSt4U3KlmaH2/wq7jzg7iZDzL6HB8R9+OsUZo+x5kTO+Wosgt8pNpRfAYpo+Sh7f2bhnbXgIMWjaMbRHU0YfVM4v7gyqvPxnx90MbstozsCrMTc3HGIbf7dJZIs+8F09gLvuw8zfYTaZUY7knKClXoY4mb25witVMrfRBh38THC+oMaNDLkGDXW+t/KHgDCNd4iioyY1EY9CBpKOAPAyPWo6gXJNfbe
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(346002)(376002)(136003)(396003)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(55016003)(478600001)(82960400001)(38070700005)(38100700002)(83380400001)(53546011)(122000001)(71200400001)(7696005)(6506007)(26005)(76116006)(66946007)(66556008)(66476007)(110136005)(64756008)(66446008)(316002)(107886003)(54906003)(41300700001)(33656002)(86362001)(2906002)(9686003)(5660300002)(8936002)(8676002)(52536014)(4326008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aXoySUxXaDNVWkxQYUwyWlFWM2xBOGxLNElSdk9wUitjLzdmd3VtMDJSN1dC?=
 =?utf-8?B?dlpwYzNDMEpsNEUwcmpsODlOdmNBNGJqWDR1djlEbHFhMVlsbzZvYlIza2RE?=
 =?utf-8?B?dkpjcjBrc2xKaXVsOFVoVjN5T0xwdVk2ZTQ0T0FlYWlZYTZDZWh1OExrUytV?=
 =?utf-8?B?eUlqVUM4bE1CMGFsbS8vVWVYR3pQYXNiZEtkaDB6OWdHNGpYeVYyNXAvdFpu?=
 =?utf-8?B?UldJaFJ0eExCSW1rNWxWSmVIQXNKQzBHQU0rbFM4VUs0cnE0NW1oNVFmL2po?=
 =?utf-8?B?ZmQ4Um9sSVdoYTd0cnllTldTMHN0TXBtVDNvTzdRMXBQWDlKSmhOVUlOTyt0?=
 =?utf-8?B?MWwybmdhQjVWaE9RUXc1aE5YdFVId2ZuOFJ4ZTg2N3JXTzU5MkJGakFjZDhN?=
 =?utf-8?B?V01UZGlxNWZRK2J2WlRVQnZ1a3VqTlcrUjJsZ2ZlZ1UyU0VOMU1SWHhBSVJ2?=
 =?utf-8?B?cnFEQUFPa0hjSXF6MHJ3THYrQXpwSEs4eEliM3BhR1lYem9Db3lOYXMyL1Bq?=
 =?utf-8?B?ako3cEZYbm05NkxSTVNUL0t5NVJnbDJYOVUvWU9hdFh1WUpwanhtc29wRVRi?=
 =?utf-8?B?RWxrT0FIcXhZTTNWcDJlNGV2Q1BnOVk0ZURteTBrejlSSFhhM25KaDNFMC9v?=
 =?utf-8?B?YlJyeGI3Qk92TDFIeE1hOEdKM2FETnQrNFN2RVgxN0RxbVBIR09NZUdHbC83?=
 =?utf-8?B?aU1BSi9EbHp5Sm45Wng5ak1RTjZrc0ZxT1A2UmFQNkR4eDZRTFhjdm1jQUFi?=
 =?utf-8?B?TVRlUlU0RkpTUTBGbXN5WGx6YjRydkk0cmpySGxqYnMxMWN3RkhtcTAzQVcr?=
 =?utf-8?B?R0dSZ0lEMnpqR0JQUkdyRmkwZUxQYkVLVFdrNXpJc3RId1M4ejFpWnU2aEZO?=
 =?utf-8?B?Z2lGZENVWTRoN1c3MDgvQmthNzNpd2Ewak9SZ1BwZmNTZURvVisrZFJ6UlYv?=
 =?utf-8?B?NEJuVG1IbzVaU2QwanRydlVKN2FNRmx2endDUlk0WnZVNVp6VmR2WVpHSmRE?=
 =?utf-8?B?M2t3SUtxcG01RTVVOGoybkNiK0dqUVhndVFyRG5iRTRBR0hUZzVYSVQzU0Ew?=
 =?utf-8?B?aE4xNWw0dE04Z2FqbE1yNXpWOThHY0d4MS93OXFsSWtMQlUyam9JWnhPQ3Mx?=
 =?utf-8?B?UGJ4QjJhUUp3NmFOMTluMktGNGJEMGdMK1ZYdzhoZFdZNzEzd2prcklqVzJv?=
 =?utf-8?B?QmwrM2ZaUDNyM2Mxc0laeUlWbVNJeUpkdXVKbEx0L1FDWHFqMzJ4cFJFU0hq?=
 =?utf-8?B?OEhwSDhvMnR4UnY3cXJ0WWJZOWZ0bjFrc0o0OHREK3JMcHYxWGhiaHBWb0VE?=
 =?utf-8?B?c1NiTEVGekMrdG9VU3pDZEZ5VVhNVXZFaUdCWTU3L3dxV20vWVZPa24wcHN4?=
 =?utf-8?B?aU14S2ZuQTlOTEg3K28xYUFEaXFWQWNXekZsTmh6cEpGcW9nUHB1bGxNUDRC?=
 =?utf-8?B?eml2WUR2T0w3MDdzVUVJcURDSW5yS0k4YlNxTEoxeHJvVGwvYStWa1lGN1VZ?=
 =?utf-8?B?MjZLWGlkSWI3WXE4eXN1TWV4Nk1OS3F5cFFoVU0rMVI0WXhFUUoyNU1jbkNF?=
 =?utf-8?B?UGQ0dEdoWW9vbS9OdHg4MkV1Q29GTDhUc2FMOVJzUzRYUHR6b1M5QWsydVJW?=
 =?utf-8?B?TVlHN1NsZTBuaHc1NXdwemw3T2JaUVUwaUV2WTBBNmplT3Zlc3QybFQvc3Uy?=
 =?utf-8?B?TEY0YXZPYVlZVmIyQUtFL3VDamw3d3ZpdTVlZmpJVmZodE1hd2JEc2ZrcXMz?=
 =?utf-8?B?cHZEZy9HcFdJQnJCKzZnNmd2S0JsbmtlZUlBV3ZIZ2FGU25EQkJKVkZJcUR5?=
 =?utf-8?B?MjZLK241ZkkzeEM0WHQzMWpRdURGZUFhbXEwNDNTbnlSeVpPZ3dZSUdFSXhO?=
 =?utf-8?B?UVg1MXB2aGhjanh6N2NQTEFBWXVTRUlmNndvcUZMa0FsVE1VS0RKZ0cwK2Ew?=
 =?utf-8?B?bjVoSmM5MWhzSGZ1UzdMUUhDQ2wwYnFsb2lyM01kZ1FsWVJocUlPaW5oSGo3?=
 =?utf-8?B?WDJSdjBCeW4wUmVjMW1JcjkwZTJWazUvSEJpZFU3Z0crdEd1MEw0dm5MV2Ji?=
 =?utf-8?B?Z29qRTVKQWFic2d2K0RZOUZvWEFaTnd1ZGZvTjhIeXNCNUdhd3hVUnZHTjlu?=
 =?utf-8?Q?dgYsUkr52gEb3bwlCAWzHv0PB?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 379edc6e-3898-40ca-3b44-08dbce458864
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2023 12:43:43.9067 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BIchsfdxkOwio7wiTy3gHivXd1Rkfexpl52b5hkIE+m8AQ0ecPtuyzpY2yfkqP63kL88efr08ogDI4D6BTczHcqaNc1qqrWl49ZR8UrWEd4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6572
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH V6 1/2] drm/xe: Introduce low level driver
 error counting APIs
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
Cc: "Vishwanathapura@freedesktop.org" <Vishwanathapura@freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogV2FqZGVjemtvLCBNaWNo
YWwgPE1pY2hhbC5XYWpkZWN6a29AaW50ZWwuY29tPg0KPiBTZW50OiBGcmlkYXksIE9jdG9iZXIg
MTMsIDIwMjMgNzo1NiBQTQ0KPiBUbzogVXBhZGh5YXksIFRlamFzIDx0ZWphcy51cGFkaHlheUBp
bnRlbC5jb20+OyBpbnRlbC0NCj4geGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBWaXNo
d2FuYXRoYXB1cmFAZnJlZWRlc2t0b3Aub3JnDQo+IFN1YmplY3Q6IFJlOiBbSW50ZWwteGVdIFtQ
QVRDSCBWNiAxLzJdIGRybS94ZTogSW50cm9kdWNlIGxvdyBsZXZlbCBkcml2ZXIgZXJyb3INCj4g
Y291bnRpbmcgQVBJcw0KPiANCj4gDQo+IA0KPiBPbiAxMy4xMC4yMDIzIDE0OjE2LCBUZWphcyBV
cGFkaHlheSB3cm90ZToNCj4gPiBMb3cgbGV2ZWwgZHJpdmVyIGVycm9yIHRoYXQgbWlnaHQgaGF2
ZSBwb3dlciBvciBwZXJmb3JtYW5jZSBpbXBhY3Qgb24NCj4gPiB0aGUgc3lzdGVtLCB3ZSBhcmUg
YWRkaW5nIGEgbmV3IGVycm9yIGNvdW50ZXIgdG8gR1QgYW5kIHRpbGUgYW5kDQo+ID4gaW5jcmVt
ZW50IG9uIGVhY2ggb2NjdXJyYW5jZS4gTGV0cyBpbnRyb2R1Y2UgQVBJcw0KPiANCj4gdHlwbw0K
DQpJIHdpbGwgY29ycmVjdCBpdC4NCg0KPiANCj4gPiB0byBkZWZpbmUgYW5kIGluY3JlbWVudCBl
YWNoIGVycm9yIHR5cGUgY291bnRlci4NCj4gPg0KPiA+IFY1Og0KPiA+ICAgLSBGaXggTUFYIGVu
dW0gaXNzdWUNCj4gPiAgIC0gVXNlIGtlcm5lbCBkb2MgZm9yIGVudW0gLSBOaXJhbmphbmENCj4g
PiBWNDoNCj4gPiAgIC0gTW92ZSBBUEkgZGVjbGFyYXRpb24gdW5kZXIgdGlsZS5oIC0gSmFuaQ0K
PiA+ICAgLSBUeXBvcw0KPiA+IFYzOg0KPiA+ICAgLSBjb3JyZWN0ICNkZWZpbmUgbWF4IHZhbHVl
DQo+ID4gVjI6DQo+ID4gICAtIE1vdmUgc29tZSBjb2RlIHRvIGl0cyByZWxhdGVkIHBhdGNoIC0g
TWljaGFsDQo+ID4gICAtIFJlbmFtaW5nIGlmIEFQSSBhbmQgZW51bSAtIE1pY2hhbA0KPiA+ICAg
LSBHVUMgZXJyb3JzIGFyZSBtb3ZlZCBwZXIgR1QgLSBNaWNoYWwNCj4gPiAgIC0gU29tZSBuaXRz
IC0gTWljaGFsDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBUZWphcyBVcGFkaHlheSA8dGVqYXMu
dXBhZGh5YXlAaW50ZWwuY29tPg0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVf
ZGV2aWNlX3R5cGVzLmggfCAxNyArKysrKysrKysrKysrKysrKw0KPiA+ICBkcml2ZXJzL2dwdS9k
cm0veGUveGVfZ3QuYyAgICAgICAgICAgfCAxOCArKysrKysrKysrKysrKysrKysNCj4gPiAgZHJp
dmVycy9ncHUvZHJtL3hlL3hlX2d0LmggICAgICAgICAgIHwgIDMgKysrDQo+ID4gIGRyaXZlcnMv
Z3B1L2RybS94ZS94ZV9ndF90eXBlcy5oICAgICB8IDE5ICsrKysrKysrKysrKysrKysrKysNCj4g
PiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3RpbGUuYyAgICAgICAgIHwgMTggKysrKysrKysrKysr
KysrKysrDQo+ID4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV90aWxlLmggICAgICAgICB8ICAyICsr
DQo+ID4gIDYgZmlsZXMgY2hhbmdlZCwgNzcgaW5zZXJ0aW9ucygrKQ0KPiA+DQo+ID4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2VfdHlwZXMuaA0KPiA+IGIvZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX2RldmljZV90eXBlcy5oDQo+ID4gaW5kZXggYmMzNzVkZGRhNWE3Li5h
YWM2ZDY2NjIyZDkgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2Rldmlj
ZV90eXBlcy5oDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZV90eXBlcy5o
DQo+ID4gQEAgLTU5LDYgKzU5LDIwIEBAIHN0cnVjdCB4ZV9wYXRfb3BzOw0KPiA+ICAJCSBjb25z
dCBzdHJ1Y3QgeGVfdGlsZSAqIDogKGNvbnN0IHN0cnVjdCB4ZV9kZXZpY2UgKikoKHRpbGVfXykt
PnhlKSwNCj4gCVwNCj4gPiAgCQkgc3RydWN0IHhlX3RpbGUgKiA6ICh0aWxlX18pLT54ZSkNCj4g
Pg0KPiA+ICsvKiogQGVudW0geGVfdGlsZV9kcnZfZXJyX3R5cGUNCj4gPiArICogIGVudW0gZm9y
IGRpZmZlcmVudCB0eXBlcyBvZiB0aWxlIGxldmVsIGVycm9ycyBpbiBkcml2ZXIgICovIGVudW0N
Cj4gPiAreGVfdGlsZV9kcnZfZXJyX3R5cGUgew0KPiA+ICsJLyogRXJyb3IgdHlwZSBmb3IgYWxs
IFBQR1RUIGFuZCBHVFQgZXJyb3JzICovDQo+ID4gKwlYRV9USUxFX0RSVl9FUlJfR1RULA0KPiAN
Cj4gbml0OiBhbnkgcGFydGljdWxhciByZWFzb24gd2h5IGRvIHlvdSB3YW50IHRvIHRyYWNrIHRo
ZW0gdG9nZXRoZXI/DQo+IEFGQUlLIHRoZXJlIGNvdWxkIGJlIHF1aXRlIGRpZmZlcmVudCBwcm9i
bGVtcyBpbiBHR1RUIHZzIFBQR1RUIG1hbmFnZW1lbnQNCg0KU3lzbWFuIGRvZXMgbmVlZCB0aGlz
IGtpbmQgb2YgZmluZSBncmFudWxhcml0eSBpbiBiZXR3ZWVuIEdHVCBhbmQgUFBHVFQuIEhvd2V2
ZXIgSSB3aWxsIGdvIHRocm91Z2ggZXJyb3IgcmVwb3J0ZWQgaGVyZSB0byBmaW5kIG91dCBpZiB0
aGVyZSBhcmUgUFBHVFQgYW5kIEdUVCBib3RoIHR5cGVzIGFyZSBlcnJvciBhcmUgcmVwb3J0ZWQu
DQoNCj4gDQo+ID4gKwkvKiBJbnRlcnJ1cHQgZXJyb3JzICovDQo+ID4gKwlYRV9USUxFX0RSVl9F
UlJfSU5UUiwNCj4gPiArCS8qIE1heCBkZWZpbmVkIGVycm9yIHR5cGVzLCBrZWVwIHRoaXMgbGFz
dCAqLw0KPiA+ICsJX19YRV9USUxFX0RSVl9FUlJfTUFYDQo+ID4gK307DQo+ID4gKw0KPiA+ICsj
ZGVmaW5lIFhFX1RJTEVfRFJWX0VSUl9NQVgJX19YRV9USUxFX0RSVl9FUlJfTUFYDQo+IA0KPiB3
aHkgZG8geW91IHJlZGVmaW5lIHRoaXMgTUFYPw0KPiANCj4gdGhpcyBkaWZmZXJlbnQgbmFtaW5n
IG9mIE1BWCB2YWx1ZSAodXNpbmcgZG91YmxlIHVuZGVyc2NvcmUpIHdhcyBvbg0KPiBwdXJwb3Nl
IHRvIGF2b2lkIG1peGluZyB0aGF0IHdpdGggJ3JlZ3VsYXInIGVudW0gdmFsdWVzLg0KPiB0aGlz
IGRlZmluZSBraWxscyB0aGF0DQoNCkdvdCBpdC4gSSB3aWxsIGtlZXAgX19YRV9USUxFX0RSVl9F
UlJfTUFYIGFuZCB1c2UgaXQgYXMgTUFYLg0KDQo+IA0KPiA+ICsNCj4gPiAgLyoqDQo+ID4gICAq
IHN0cnVjdCB4ZV9tZW1fcmVnaW9uIC0gbWVtb3J5IHJlZ2lvbiBzdHJ1Y3R1cmUNCj4gPiAgICog
VGhpcyBpcyB1c2VkIHRvIGRlc2NyaWJlIGEgbWVtb3J5IHJlZ2lvbiBpbiB4ZSBAQCAtMTg4LDYg
KzIwMiw5IEBADQo+ID4gc3RydWN0IHhlX3RpbGUgew0KPiA+DQo+ID4gIAkvKiogQHN5c2ZzOiBz
eXNmcycga29iaiB1c2VkIGJ5IHhlX3RpbGVfc3lzZnMgKi8NCj4gPiAgCXN0cnVjdCBrb2JqZWN0
ICpzeXNmczsNCj4gPiArDQo+ID4gKwkvKiogQGRydl9lcnJfY250OiBkcml2ZXIgZXJyb3IgY291
bnRlciBmb3IgdGhpcyB0aWxlICovDQo+ID4gKwl1MzIgZHJ2X2Vycl9jbnRbWEVfVElMRV9EUlZf
RVJSX01BWF07DQo+IA0KPiBfX1hFX1RJTEVfRFJWX0VSUl9NQVggc2hvdWxkIHdvcmsgaGVyZSB0
b28NCg0KT2sNCg0KPiANCj4gPiAgfTsNCj4gPg0KPiA+ICAvKioNCj4gPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0LmMgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3QuYw0K
PiA+IGluZGV4IGM2M2UyZTQ3NTBiMS4uYjgxZGUzOTg0NjI2IDEwMDY0NA0KPiA+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV9ndC5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hl
X2d0LmMNCj4gPiBAQCAtNDcsNiArNDcsMjQgQEANCj4gPiAgI2luY2x1ZGUgInhlX3dhLmgiDQo+
ID4gICNpbmNsdWRlICJ4ZV93b3BjbS5oIg0KPiA+DQo+ID4gKy8qKg0KPiA+ICsgKiB4ZV9ndF9y
ZXBvcnRfZHJpdmVyX2Vycm9yIC0gQ291bnQgZHJpdmVyIGVycm9yIGZvciBndA0KPiA+ICsgKiBA
Z3Q6IEdUIHRvIGNvdW50IGVycm9yIGZvcg0KPiA+ICsgKiBAZXJyOiBlbnVtIGVycm9yIHR5cGUN
Cj4gPiArICoNCj4gPiArICogSW5jcmVtZW50IHRoZSBkcml2ZXIgZXJyb3IgY291bnRlciBpbiBy
ZXNwZWN0aXZlIGVycm9yDQo+ID4gKyAqIGNhdGVnb3J5IGZvciB0aGlzIEdULg0KPiA+ICsgKg0K
PiA+ICsgKiBSZXR1cm5zIHZvaWQuDQo+ID4gKyAqLw0KPiA+ICt2b2lkIHhlX2d0X3JlcG9ydF9k
cml2ZXJfZXJyb3Ioc3RydWN0IHhlX2d0ICpndCwNCj4gPiArCQkJICAgICAgIGNvbnN0IGVudW0g
eGVfZ3RfZHJ2X2Vycl90eXBlIGVycikgew0KPiA+ICsJeGVfZ3RfYXNzZXJ0KGd0LCBlcnIgPj0g
QVJSQVlfU0laRShndC0+ZHJ2X2Vycl9jbnQpKTsNCj4gDQo+IGFzc2VydHMgdXNlIGRpZmZlcmVu
dCBsb2dpYyB0aGFuIFdBUk5fT04gc28gdGhpcyBzaG91bGQgcmF0aGVyIGJlOg0KPiANCj4gCXhl
X2d0X2Fzc2VydChndCwgZXJyID49IDApOw0KPiAJeGVfZ3RfYXNzZXJ0KGd0LCBlcnIgPCBfX1hF
X1RJTEVfRFJWX0VSUl9NQVgpOw0KDQpZZXMgdGhpcyBpcyBtaXNzLiBUaGFua3MgZm9yIHBvaW50
aW5nIGl0IG91dC4NCg0KPiANCj4gPiArCVdSSVRFX09OQ0UoZ3QtPmRydl9lcnJfY250W2Vycl0s
DQo+ID4gKwkJICAgUkVBRF9PTkNFKGd0LT5kcnZfZXJyX2NudFtlcnJdKSArIDEpOyB9DQo+ID4g
Kw0KPiA+ICBzdHJ1Y3QgeGVfZ3QgKnhlX2d0X2FsbG9jKHN0cnVjdCB4ZV90aWxlICp0aWxlKSAg
ew0KPiA+ICAJc3RydWN0IHhlX2d0ICpndDsNCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX2d0LmggYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3QuaA0KPiA+IGluZGV4IGNh
ZGVkMjAzYThhMC4uOTQ0MmQ2MTUwNDJmIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9ndC5oDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0LmgNCj4gPiBA
QCAtNjcsNCArNjcsNyBAQCBzdGF0aWMgaW5saW5lIGJvb2wgeGVfZ3RfaXNfdXNtX2h3ZShzdHJ1
Y3QgeGVfZ3QgKmd0LA0KPiBzdHJ1Y3QgeGVfaHdfZW5naW5lICpod2UpDQo+ID4gIAkJaHdlLT5p
bnN0YW5jZSA9PSBndC0+dXNtLnJlc2VydmVkX2Jjc19pbnN0YW5jZTsgIH0NCj4gPg0KPiA+ICt2
b2lkIHhlX2d0X3JlcG9ydF9kcml2ZXJfZXJyb3Ioc3RydWN0IHhlX2d0ICpndCwNCj4gPiArCQkJ
ICAgICAgIGNvbnN0IGVudW0geGVfZ3RfZHJ2X2Vycl90eXBlIGVycik7DQo+ID4gKw0KPiA+ICAj
ZW5kaWYNCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X3R5cGVzLmgN
Cj4gPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF90eXBlcy5oDQo+ID4gaW5kZXggZDQzMTBi
ZTNlMWU3Li40MjJmNTRjNDVhYzkgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hl
L3hlX2d0X3R5cGVzLmgNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3RfdHlwZXMu
aA0KPiA+IEBAIC0yNCw2ICsyNCwyMiBAQCBlbnVtIHhlX2d0X3R5cGUgew0KPiA+ICAJWEVfR1Rf
VFlQRV9NRURJQSwNCj4gPiAgfTsNCj4gPg0KPiA+ICsvKiogQGVudW0geGVfZ3RfZHJ2X2Vycl90
eXBlDQo+ID4gKyAqICBlbnVtIGZvciBkaWZmZXJlbnQgdHlwZXMgb2YgZ3QgbGV2ZWwgZXJyb3Jz
IGluIGRyaXZlciAgKi8gZW51bQ0KPiA+ICt4ZV9ndF9kcnZfZXJyX3R5cGUgew0KPiA+ICsJLyog
RHJpdmVyIGd1YyBjb21tdW5pY2F0aW9uIGVycm9ycyAqLw0KPiA+ICsJWEVfR1RfRFJWX0VSUl9H
VUNfQ09NTSwNCj4gDQo+IGRvIHdlIGNhcmUgb25seSBhYm91dCBjb21tdW5pY2F0aW9uIHdpdGgg
R3VDIChsb3N0IENUQi9NTUlPLCBlcnJvcg0KPiByZXBsaWVzKSBvciBhYm91dCBhbGwgcHJvYmxl
bXMgcmVsYXRlZCB0byBHdUMgKGNvcnJ1cHRlZCBGVywgRlcgY3Jhc2gpPw0KDQpZZXMgd2UgYXJl
IG5vdCBjYXJpbmcgYWJvdXQgR3VDIGNvcnJ1cHRlZCBvciBGVyBjcmFzaCBhcyBkcml2ZXIgaXRz
ZWxmIHdpbGwgc3RvcCB3b3JraW5nIGluIHN1Y2ggY2FzZSB0aGVuIGl0IHdpbGwgbm90IGJlIHBl
cmZvcm1hbmNlIGlzc3VlIGFueW1vcmUgd2hlcmUgY291bnRlciBoYXMgbm8gY2hhbmNlIHRvIGhl
bHAuDQoNCj4gDQo+ID4gKwkvKiBFbmdpbmUgZXhlY3V0aW9uIGVycm9ycyAqLw0KPiA+ICsJWEVf
R1RfRFJWX0VSUl9FTkdJTkUsDQo+ID4gKwkvKiBPdGhlciBlcnJvcnMgbGlrZSBlcnJvciBkdXJp
bmcgc2F2ZS9yZXN0b3JlIHJlZ2lzdGVycyAqLw0KPiA+ICsJWEVfR1RfRFJWX0VSUl9PVEhFUlMs
DQo+ID4gKwkvKiBNYXggZGVmaW5lZCBlcnJvciB0eXBlcywga2VlcCB0aGlzIGxhc3QgKi8NCj4g
PiArCV9fWEVfR1RfRFJWX0VSUl9NQVgNCj4gPiArfTsNCj4gPiArDQo+ID4gKyNkZWZpbmUgWEVf
R1RfRFJWX0VSUl9NQVgJX19YRV9HVF9EUlZfRVJSX01BWA0KPiANCj4gZGl0dG8NCg0KR290IGl0
Lg0KDQo+IA0KPiA+ICsNCj4gPiAgI2RlZmluZSBYRV9NQVhfRFNTX0ZVU0VfUkVHUwkzDQo+ID4g
ICNkZWZpbmUgWEVfTUFYX0VVX0ZVU0VfUkVHUwkxDQo+ID4NCj4gPiBAQCAtMzQ3LDYgKzM2Myw5
IEBAIHN0cnVjdCB4ZV9ndCB7DQo+ID4gIAkJLyoqIEBvb2I6IGJpdG1hcCB3aXRoIGFjdGl2ZSBP
T0Igd29ya2Fyb3VkbnMgKi8NCj4gPiAgCQl1bnNpZ25lZCBsb25nICpvb2I7DQo+ID4gIAl9IHdh
X2FjdGl2ZTsNCj4gPiArDQo+ID4gKwkvKiogQGRydl9lcnJfY250OiBkcml2ZXIgZXJyb3IgY291
bnRlciBmb3IgdGhpcyBHVCAqLw0KPiA+ICsJdTMyIGRydl9lcnJfY250W1hFX0dUX0RSVl9FUlJf
TUFYXTsNCj4gPiAgfTsNCj4gPg0KPiA+ICAjZW5kaWYNCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX3RpbGUuYw0KPiA+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3RpbGUu
YyBpbmRleCAxMzE3NTJhNTdmNjUuLjcwOGRkMzg1ZjJiMSAxMDA2NDQNCj4gPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0veGUveGVfdGlsZS5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hl
X3RpbGUuYw0KPiA+IEBAIC03MSw2ICs3MSwyNCBAQA0KPiA+ICAgKiAgLSBNT0NTIGFuZCBQQVQg
cHJvZ3JhbW1pbmcNCj4gPiAgICovDQo+ID4NCj4gPiArLyoqDQo+ID4gKyAqIHhlX3RpbGVfcmVw
b3J0X2RyaXZlcl9lcnJvciAtIENvdW50IGRyaXZlciBlcnJvciBmb3IgdGlsZQ0KPiA+ICsgKiBA
dGlsZTogVGlsZSB0byBjb3VudCBlcnJvciBmb3INCj4gPiArICogQGVycjogZW51bSBlcnJvciB0
eXBlDQo+ID4gKyAqDQo+ID4gKyAqIEluY3JlbWVudCB0aGUgZHJpdmVyIGVycm9yIGNvdW50ZXIg
aW4gcmVzcGVjdGl2ZSBlcnJvcg0KPiA+ICsgKiBjYXRlZ29yeSBmb3IgdGhpcyB0aWxlLg0KPiA+
ICsgKg0KPiA+ICsgKiBSZXR1cm5zIHZvaWQuDQo+ID4gKyAqLw0KPiA+ICt2b2lkIHhlX3RpbGVf
cmVwb3J0X2RyaXZlcl9lcnJvcihzdHJ1Y3QgeGVfdGlsZSAqdGlsZSwNCj4gPiArCQkJCSBjb25z
dCBlbnVtIHhlX3RpbGVfZHJ2X2Vycl90eXBlIGVycikgew0KPiA+ICsJeGVfYXNzZXJ0KHRpbGVf
dG9feGUodGlsZSksIGVyciA+PSBBUlJBWV9TSVpFKHRpbGUtPmRydl9lcnJfY250KSk7DQo+IA0K
PiB3cm9uZyBjb25kaXRpb24NCg0KQWNrDQoNCj4gDQo+ID4gKwlXUklURV9PTkNFKHRpbGUtPmRy
dl9lcnJfY250W2Vycl0sDQo+ID4gKwkJICAgUkVBRF9PTkNFKHRpbGUtPmRydl9lcnJfY250W2Vy
cl0pICsgMSk7IH0NCj4gPiArDQo+ID4gIC8qKg0KPiA+ICAgKiB4ZV90aWxlX2FsbG9jIC0gUGVy
Zm9ybSBwZXItdGlsZSBtZW1vcnkgYWxsb2NhdGlvbg0KPiA+ICAgKiBAdGlsZTogVGlsZSB0byBw
ZXJmb3JtIGFsbG9jYXRpb25zIGZvciBkaWZmIC0tZ2l0DQo+ID4gYS9kcml2ZXJzL2dwdS9kcm0v
eGUveGVfdGlsZS5oIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3RpbGUuaCBpbmRleA0KPiA+IDc4
MmM0N2Y4YmQ0NS4uMDkyYTZiMTdhOTdlIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV90aWxlLmgNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfdGlsZS5oDQo+
ID4gQEAgLTE0LDUgKzE0LDcgQEAgaW50IHhlX3RpbGVfYWxsb2Moc3RydWN0IHhlX3RpbGUgKnRp
bGUpOyAgaW50DQo+ID4geGVfdGlsZV9pbml0X25vYWxsb2Moc3RydWN0IHhlX3RpbGUgKnRpbGUp
Ow0KPiA+DQo+ID4gIHZvaWQgeGVfdGlsZV9taWdyYXRlX3dhaXQoc3RydWN0IHhlX3RpbGUgKnRp
bGUpOw0KPiA+ICt2b2lkIHhlX3RpbGVfcmVwb3J0X2RyaXZlcl9lcnJvcihzdHJ1Y3QgeGVfdGls
ZSAqdGlsZSwNCj4gPiArCQkJCSBjb25zdCBlbnVtIHhlX3RpbGVfZHJ2X2Vycl90eXBlIGVycik7
DQo+ID4NCj4gPiAgI2VuZGlmDQo=
