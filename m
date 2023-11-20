Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51008C197A0
	for <intel-xe@archiver.kernel.org>; Mon, 20 Nov 2023 18:32:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C5AA10E112;
	Mon, 20 Nov 2023 18:32:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6851110E112
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Nov 2023 18:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700505147; x=1732041147;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=liy/RTxDMQq/cahMmaOONHObrJIJlJNySwz6+6kURk4=;
 b=CWLrU9eHY/OMzJkuiEfgF9J8RR7w+Xyj4NnXMShFb+AmIw3lsQsxLiF9
 eoiyzfdJEaIf8D1jopw13Z7IkInA84atznT+JtVbuzQ3+9j7mzknkkSyh
 nlUwBgoa8C0O/woZ/Ju6KDEUCPr+W7b70OWOsnzZGPiuMhnxkeTVizGW8
 hbeAboymgCogxs3A9S12jXWRB8mFpYFJaQoiTB4xH/sUcZm0mHn+ELRts
 hDDOdlv2d57hv87ktyn8FSQ5vgH0LOQDybl0JZASpIskKpfFL1ZHB+KQf
 alYtCUgib5RlDkOLU1N5FJY/4uFpD3dv0udNeGGsySWGh7lWUF7h6bSGs w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="388823168"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; d="scan'208";a="388823168"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2023 10:32:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="795553240"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; d="scan'208";a="795553240"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Nov 2023 10:32:26 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 20 Nov 2023 10:32:26 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 20 Nov 2023 10:32:25 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 20 Nov 2023 10:32:25 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 20 Nov 2023 10:32:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G4maHDXKCx25fY5HFMwyqqrBIAwFFtwG0RWUfkj189w7favMXdeaHR8qkF2hhNxCVezNoKtEIZAsuLnUvvYlA3BKaphSYBaMxwZRUSpy5VrZuZYgPOuYRUyVSL4wd5wsZ0C/ADpEpaBUGPbOxnL4u44cV/KAX2AkgZWa1/vYPe3EdyOPglkcfxiEQw4K3zZkiIyOlGrKZj8lV7zMvWlcZxaxN32YPlT2EguHiab43AACv/aoV+SEpDTqKrLaZ86PG5dgmbmwMAobBMZP1TBuu/2mmbbK/8LeqwD6YhO0QsP1TprKNowbVO+kZoULJ8vLrrBOXRM7llmGJ9C81tOPpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=liy/RTxDMQq/cahMmaOONHObrJIJlJNySwz6+6kURk4=;
 b=N+84zoL84zHQOi8+GRhDmw0BgOpHr5gKwFgO5/wstPSFyY/IUxgFgU4jv8SDkzIDoON7fF+fREEmyNG1LA3pauwP6KYw7bl6jSohc2aDSvyvQrbZaNJICTCqRIcDBEOYJ5lQcVOE96Kf3LgrDf+VWNvr7rBhUWYZYdSmYEpINL7xGJ7wqgF8ux/8Gg04Lb5oWbxKbjaZIzC0T9vJLe0m3WRDOK02bY8+u/2063DMfBe/paZaCATxept5ctl1Qo9vcHYIA2hTdB2Z+IhiV4YxRmfAkuL7SXFj4XxxZ5DOxJd9UOPn0OC4vHwBZw0pMDwZ9i6fMAy61d0/EFB1RHdpfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by LV8PR11MB8558.namprd11.prod.outlook.com (2603:10b6:408:1ed::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.27; Mon, 20 Nov
 2023 18:32:23 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::8076:c5fe:e0fc:cfaf]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::8076:c5fe:e0fc:cfaf%7]) with mapi id 15.20.7002.027; Mon, 20 Nov 2023
 18:32:22 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>
Thread-Topic: [Intel-xe] [PATCH 1/2] drm/xe: Include RPL-U to pciidlist
Thread-Index: AQHaG9xvzRJ+FwQRmkiCp9XyjGHnP7CDhLaAgAADWwA=
Date: Mon, 20 Nov 2023 18:32:22 +0000
Message-ID: <be47b688cfa4f0edbee002567ffd07be2d432322.camel@intel.com>
References: <20231120180717.55182-1-jose.souza@intel.com>
 <yruodwexdnecbqxuenxnad5xqg2th5n4qqzf3j6p7hcm4ovbh4@ekxxdfzuxkvo>
In-Reply-To: <yruodwexdnecbqxuenxnad5xqg2th5n4qqzf3j6p7hcm4ovbh4@ekxxdfzuxkvo>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|LV8PR11MB8558:EE_
x-ms-office365-filtering-correlation-id: 40acc924-bb10-4ba5-648b-08dbe9f70964
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: N2ZMnlLcY2v9ZK/7sabEFHg9NxPNRX++WkRuDfDpTr86sZMgbprnuFjbGIZqLuXgDKSsg0rRNfOfwUsf+hj24qBnUICNTYEMmeMKwL0ktOP7RKiiQUkvAcrWMQzswmUQrdaR+FfMM8IaxFu9xITeqginujqq0bFIcQGWWuq/s9wt6lW2lr0Uwx2lqm+FD9bhaDKmHynRiLNDt1rL3W3M1cD1SqCEHaxnDUhsIref+nWv70dCwsftdP0orKnzwq641S11a1sHU+b0b+yDnkwapKo07YLng7VDv2Id0uHtTB2+grK18oDf0OGACMQ3DPmTOWavYXZS14NBeWlTOicmQ3IufPJYKiuI0Q06Wh74BDcfmmUM9jhqv0le8xulxCXsuKhjHeOVsDSZ13t+gweQOxPgNWzD3k0iVtbYG3aH77KuJ4O4XEHEUtnPHyNDEWt2F3gRtol4WQEfT+S+EkgwjbPVrAZlkcUOcEAoP2S4g4KtsfP+62w0macmJfDC1g25mfoHWi1Bz2H1Sm93q7qvq9VBba1HSYiREgkM/uPJeTK5koOgUe8lv/AErrubYqFOcrJVkq4f0PZjUqucGV6mxHt/22KwcAy9lt2R1PAWUHxgU9DMK0W6hbCiaG+EtwaY
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(396003)(376002)(136003)(366004)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(5660300002)(86362001)(4001150100001)(2906002)(64756008)(66446008)(66946007)(37006003)(316002)(66556008)(66476007)(6636002)(76116006)(91956017)(4326008)(6862004)(8936002)(8676002)(36756003)(38070700009)(41300700001)(83380400001)(6486002)(122000001)(478600001)(6506007)(6512007)(82960400001)(71200400001)(2616005)(26005)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d2R6V0p5Rjl3dnpvS1BDUi9SNHRZTjYydE0ySlNkcFkybmVFM0VYMEFMRHJE?=
 =?utf-8?B?eUJ2QVk1bERadEJtWDJBRXVlWklFL0ExRGU5KzZwS0NoV1hTbXZ2bzl0NWZp?=
 =?utf-8?B?UWlHN3gzM28zRFVBZkFVQUtLSk02dHhndGh3WXBZNFk5alVoL0JyUU9IdFMx?=
 =?utf-8?B?K1VhRXJ1RnhnbGxtcWVidHNYNHlkbDlMcXo2K1REUVdwVFc5R1VkbnBTMEF4?=
 =?utf-8?B?eXZrdkpEKzJWWERmUHZXZm9lKzUwMExyY1FtUXY5OTdyZTNNcWx2U3loaU5H?=
 =?utf-8?B?OUdqcjA2d1RTVDlYMTVjL0xMQjRKQnhKd1gyTVN5V0lhWk5OWVhZYUZBNFZF?=
 =?utf-8?B?ZVpsNlVsZFljejNEcTY0OFVDbVdleThBZjYyMXJ5VWVJRHFKNzBZWmpWc0FC?=
 =?utf-8?B?bG9sNVN3ZXpOUkppTFlJTytzNnMyRXIwSFVqT2FCWjc1RWltYzZiNkFlUEYw?=
 =?utf-8?B?VHJMYlBWNURnWkFKWnhVSFFOU3gvbmtQV2o1aVhUL0dPN1c5eStZRzI0VHpp?=
 =?utf-8?B?ZktXeHpmTHRQTDhyd2NoSFNWMWgyVFVBQ2tsbVFUdHBlQVhTb2I1SHg2d1BU?=
 =?utf-8?B?MFhwR2N3bUlvSXNha21NdXVvaHlQZXNsTTM2ZUxaYjh1cU0vcmNKa3IyeU5E?=
 =?utf-8?B?ekhEZm5YNElUYXkrdm5DWVZJUkZKOFdaM2dmZXRRSUZTVldqemVTN3FBNllG?=
 =?utf-8?B?NFBkUEJuc1FnVWtaQ25CSFNkRm9EcXljSUNoTGRSdnpqWTJETlRrYnRRTDYw?=
 =?utf-8?B?SWxsSW1zZ0J5OFVPQjZlY3BLSVY3elNISlJDVmg3b056T2lRYWNIUWMwbWJX?=
 =?utf-8?B?aklycnZHMkY5SGx5bFgrTERObi9iOFRxM1Z2ODhneHpPWW82TVoyQ05CbDhI?=
 =?utf-8?B?S004aXNmczloVnNjQ3oxanoyMEtiek5VSGlESnV4QTVhMHpmOXFmRm00djVF?=
 =?utf-8?B?dGVuY3o4TW94aUw1T3dyVHZ2NnpxUzBVb2FUdGI2S2FBMURmTEJMTXkxMW5R?=
 =?utf-8?B?NkZnOVhWOTF4QWlrVFlkd01TaFFnQ3VSMW9VSy9JS1NTM3VXdDVhdDlaUk1W?=
 =?utf-8?B?MEdJSEZ4dHlOSWR4MExGUU10U3dBaHhHNlA1Z1RSalJTRE44YTNrUXZYdTlv?=
 =?utf-8?B?b01jVFdHMC84emJKTVdiYkk5a1NTS0sxSzV0bXYzTWgyTWJoRUZaSTE2dXJ1?=
 =?utf-8?B?cHBpSlhZNnZhM01DQk5kZ2VYY1Z4QTd4NkIxNVkwZkx6dTNJVGJ4aW5uZ3FE?=
 =?utf-8?B?aVgyQ243Mi9ndEZmM20wMFBWUWV0V05QVFZRdzdtRGdPbnNnQWQzZzVBSnBk?=
 =?utf-8?B?QmZudjAxdnNIdUNyWFhnSDZPREdXbTFPemh5M1hKTEJYQ3ROUU1HMldMYnVy?=
 =?utf-8?B?V0tHTmprbG53cjN0emF1UmZONlpxVVJqZWIyQlhwUk53MFMxYWsrUHpwalRN?=
 =?utf-8?B?WEFROEtmZEM4SGI2S1MvR1FWUFc1WTgzT1FSZUMzZXJteERRblAvQUZwLzAw?=
 =?utf-8?B?M25xYXRlcnNLOHRseUJ5M3ZIUm8yMkxzM0txS0ZHam5KRmRyVnFsV3h1Qmd0?=
 =?utf-8?B?TnMwOURpTWFXOThGdFhiZmU5QWkyVE5YNWw3aU11cWlRUzB5SDZONkxnL0Nm?=
 =?utf-8?B?azdDb3huV0FvU0xTWGoydnJLNGJ3d0EwWFpOUS9ycnNmUWxaTTBxUFFRbkZR?=
 =?utf-8?B?dmdkM1krWXh5czFKaTg2OE9aaGlsNWE5c2hSSkdvRm53WDYxeVBlTUo2NTdm?=
 =?utf-8?B?L3FpK3ZsL25JY0c3bEtka2I5VWl6citsM3hkZ0RKUTQwRFFGQWpMa1V5L3VL?=
 =?utf-8?B?Ynl1VTBMVi9SN2tFU1kwei9MM2UyRW96Q3ZGUDFDWE4xTUQvRnFLVXgwTk0z?=
 =?utf-8?B?UWNoS2l1eHE2dUlwSlI1S1FQdWY5RkdwM00wRDVtb0g2WXgrTnVhL2hPdUUw?=
 =?utf-8?B?anQ3cmwwVGQrR2laUURGbTZJRWViTmZDMzBoeGhmT1NwZ2VvUFAyTE0wVVF2?=
 =?utf-8?B?a25FOGtXa05oZFpETXAzem9UbUZZM1hZWlR6YmhRUFc0c0tuZE5RT0tkZ1NW?=
 =?utf-8?B?MThYOXN4NTFSSVVYdzY2bThJai9MRmJNTWxCY00rU1JGNlRMZ0FhNjVFc3hm?=
 =?utf-8?B?eGRvKzZpZ0NJRmxxVGVpNzljWXZSUDFiVFVrUlhxbndlZFp1TjgzSDZ2YVR4?=
 =?utf-8?B?NUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EA18AB2C57FCD04BB5D7D4DCBBC4C9B7@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40acc924-bb10-4ba5-648b-08dbe9f70964
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2023 18:32:22.6641 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aHaS6uZo6jLlF0cyjImK4LorMQPYiMa9mYyy0DblD27pE0ICNUgokdTplm0ayqARCMhb3+229Sp7CTDv/EVWog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8558
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe: Include RPL-U to pciidlist
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

T24gTW9uLCAyMDIzLTExLTIwIGF0IDEyOjIwIC0wNjAwLCBMdWNhcyBEZSBNYXJjaGkgd3JvdGU6
DQo+IE9uIE1vbiwgTm92IDIwLCAyMDIzIGF0IDEwOjA3OjE2QU0gLTA4MDAsIEpvc2UgU291emEg
d3JvdGU6DQo+ID4gUlBMLVUgaXMgZGVmaW5lZCBhcyBhIHN1YnBsYXRmb3JtIGJ1dCB0aG9zZSBQ
Q0kgaWRzIHdlcmUNCj4gPiBub3QgaW5jbHVkZWQgaW4gcGNpaWRsaXN0IHNvIFhlIEtNRCB3b3Vs
ZCBuZXZlciBwcm9iZSBkZXZpY2Ugd2l0aA0KPiA+IHRob3NlIGlkcy4NCj4gPiBUaGlzIGlzIGZv
bGxvd2luZyB3aGF0IGk5MTUgZG9lcyB0byBpbmNsdWRlIFJQTC1VIHRvIFBDSSBpZHMNCj4gPiBw
cm9iZSBsaXN0Lg0KPiA+IA0KPiA+IENjOiBMdWNhcyBEZSBNYXJjaGkgPGx1Y2FzLmRlbWFyY2hp
QGludGVsLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBKb3PDqSBSb2JlcnRvIGRlIFNvdXphIDxq
b3NlLnNvdXphQGludGVsLmNvbT4NCj4gPiAtLS0NCj4gPiBpbmNsdWRlL2RybS94ZV9wY2lpZHMu
aCB8IDMgKystDQo+ID4gMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlv
bigtKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS94ZV9wY2lpZHMuaCBiL2lu
Y2x1ZGUvZHJtL3hlX3BjaWlkcy5oDQo+ID4gaW5kZXggNjhmYmFiMTYxZmViMC4uNTc0YTE3YzAy
MjQ5MCAxMDA2NDQNCj4gPiAtLS0gYS9pbmNsdWRlL2RybS94ZV9wY2lpZHMuaA0KPiA+ICsrKyBi
L2luY2x1ZGUvZHJtL3hlX3BjaWlkcy5oDQo+ID4gQEAgLTExOSw3ICsxMTksOCBAQA0KPiA+ICNk
ZWZpbmUgWEVfUlBMUF9JRFMoTUFDUk9fXywgLi4uKQkJXA0KPiA+IAlNQUNST19fKDB4QTcyMCwg
IyMgX19WQV9BUkdTX18pLAlcDQo+ID4gCU1BQ1JPX18oMHhBN0EwLCAjIyBfX1ZBX0FSR1NfXyks
CVwNCj4gPiAtCU1BQ1JPX18oMHhBN0E4LCAjIyBfX1ZBX0FSR1NfXykNCj4gPiArCU1BQ1JPX18o
MHhBN0E4LCAjIyBfX1ZBX0FSR1NfXyksCVwNCj4gPiArCVhFX1JQTFVfSURTKE1BQ1JPX18sICMj
IF9fVkFfQVJHU19fKQ0KPiANCj4gbm8sIGk5MTUgaGFzIHRoaXM6DQo+IA0KPiAvKiBSUEwtUCAq
Lw0KPiAjZGVmaW5lIElOVEVMX1JQTFBfSURTKGluZm8pIFwNCj4gICAgICAgICAgSU5URUxfUlBM
VV9JRFMoaW5mbyksIFwNCj4gICAgICAgICAgSU5URUxfVkdBX0RFVklDRSgweEE3MjAsIGluZm8p
LCBcDQo+ICAgICAgICAgIElOVEVMX1ZHQV9ERVZJQ0UoMHhBN0EwLCBpbmZvKSwgXA0KPiAgICAg
ICAgICBJTlRFTF9WR0FfREVWSUNFKDB4QTdBOCwgaW5mbyksIFwNCj4gICAgICAgICAgSU5URUxf
VkdBX0RFVklDRSgweEE3QUEsIGluZm8pLCBcDQo+ICAgICAgICAgIElOVEVMX1ZHQV9ERVZJQ0Uo
MHhBN0FCLCBpbmZvKQ0KPiANCj4gV2hhdCBJIHdhbnQgaXMgdG8gYmUgYWJsZSB0byBkbw0KPiAN
Cj4gCWdpdCBkaWZmIC0td29yZC1kaWZmIC0tbm8taW5kZXggaW5jbHVkZS9kcm0ve2k5MTUseGV9
X3BjaWlkcy5oDQo+IA0KPiB0byBzZWUgd2hhdCBpcyBkaWZmZXJlbnQuIEZvciBleGFtcGxlLCB3
ZSBjYW4gY2xlYXJseSBzZWUgd2UgYXJlIG1pc3NpbmcNCj4gb25lIHBjaWlkIG9mIEFETC1TOg0K
PiANCj4gLyogQURMLVMgKi8NCj4gI2RlZmluZSBbLUlOVEVMX0FETFNfSURTLV17K1hFX0FETFNf
SURTK30oWy1pbmZvLV17K01BQ1JPX18sIC4uLit9KSAgICAgICAgICAgICBcDQo+ICAgICAgICAg
IFstSU5URUxfVkdBX0RFVklDRS1deytNQUNST19fK30oMHg0NjgwLCBbLWluZm8tXXsrIyMgX19W
QV9BUkdTX18rfSksICAgIFwNCj4gICAgICAgICAgWy1JTlRFTF9WR0FfREVWSUNFLV17K01BQ1JP
X18rfSgweDQ2ODIsIFstaW5mby1deysjIyBfX1ZBX0FSR1NfXyt9KSwgICAgXA0KPiAgICAgICAg
ICBbLUlOVEVMX1ZHQV9ERVZJQ0UtXXsrTUFDUk9fXyt9KDB4NDY4OCwgWy1pbmZvLV17KyMjIF9f
VkFfQVJHU19fK30pLCAgICBcDQo+ICAgICAgICAgIFstSU5URUxfVkdBX0RFVklDRS1deytNQUNS
T19fK30oMHg0NjhBLCBbLWluZm8pLCBcLV0NCj4gWy0gICAgICBJTlRFTF9WR0FfREVWSUNFKDB4
NDY4QiwgaW5mby1deysjIyBfX1ZBX0FSR1NfXyt9KSwgICAgIFwNCj4gICAgICAgICAgWy1JTlRF
TF9WR0FfREVWSUNFLV17K01BQ1JPX18rfSgweDQ2OTAsIFstaW5mby1deysjIyBfX1ZBX0FSR1Nf
Xyt9KSwgICAgXA0KPiAgICAgICAgICBbLUlOVEVMX1ZHQV9ERVZJQ0UtXXsrTUFDUk9fXyt9KDB4
NDY5MiwgWy1pbmZvLV17KyMjIF9fVkFfQVJHU19fK30pLCAgICBcDQo+ICAgICAgICAgIFstSU5U
RUxfVkdBX0RFVklDRS1deytNQUNST19fK30oMHg0NjkzLCBbLWluZm8tXXsrIyMgX19WQV9BUkdT
X18rfSkNCj4gDQo+IGFuZCB0aGF0IFJQTC1bVVBdIGlzIHRoZSBtZXNzIHlvdSdyZSB0cnlpbmcg
dG8gZml4Lg0KPiBUaGUgZGlmZiBmb3IgREcyIGlzIGJlY2F1c2Ugd2UgZGlkbid0IGNoZXJyeS1w
aWNrDQo+IGQwYzkwOGQyOTc4ZTBlZjNjMWFjMTM1N2MxYzU4MjI0YTE1M2Y4ZDQgYXMgaXQncw0K
PiBub3QgcmVhbGx5IG5lZWRlZC4NCg0KR290IGl0IG5vdywgd2lsbCBmaXggb3JkZXIgYW5kIGFk
ZCB0aGUgbWlzc2luZyBBREwtUyBpZC4NCg0KVGhlcmUgaXMgZGlmZnMgaW4gTVRMIGlkcyBiZXR3
ZWVuIGk5MTUgYW5kIFhlIHRoYXQgSSB3aWxsIGxlYXZlIGZvciBzb21lb25lIGVsc2UgdG8gZml4
Lg0KDQo+IA0KPiBMdWNhcyBEZSBNYXJjaGkNCj4gDQo+ID4gDQo+ID4gLyogREcyICovDQo+ID4g
I2RlZmluZSBYRV9ERzJfRzEwX0lEUyhNQUNST19fLCAuLi4pCQlcDQo+ID4gLS0gDQo+ID4gMi40
Mi4xDQo+ID4gDQoNCg==
