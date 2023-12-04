Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84DBDC4167B
	for <intel-xe@archiver.kernel.org>; Mon,  4 Dec 2023 08:51:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9B0810E2D4;
	Mon,  4 Dec 2023 08:51:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22C5A10E2E1
 for <intel-xe@lists.freedesktop.org>; Mon,  4 Dec 2023 08:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701679807; x=1733215807;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=1wWNYuwR0iFyhe0PQIIsW3De5XQnvjH0mIKpfDTicM0=;
 b=Edl8itsbrduRMrOaKQ91AFYFAB2M0V8ShIXGmRXyTceNQf4hXFvsz60p
 mogOji1tu18YO4r3tU0Djrs6lBLN8FJzN6LjohoEQI2MT2Bng3H9YGNKC
 xEnzTZ+72T/EKkncGSic29FJgImYJzz4YBeizo+RTaw9JA5XXfGxMiKsS
 dH+58vLrfqTFBnd2xl3jbFGG3gR2p0xp4hMuM6gV9M6AOzfjMC6vuOOiZ
 DZCrARDRaG0ngyDTYzuU/bBqrm4Vb5Kif60WhMRLOQoEqKukuSOcTGoI3
 c9RNpw0xviA2JKu1jPcFD0P2HjMxa47JWDk6rv7aaWhn0XrXwYWjmdU2i Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="424868888"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; d="scan'208";a="424868888"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2023 00:50:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="861307296"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; d="scan'208";a="861307296"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Dec 2023 00:50:03 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 4 Dec 2023 00:50:01 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 4 Dec 2023 00:50:01 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 4 Dec 2023 00:50:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WPjPKZTcKz/vyDnxDt/Q/dkjIxTRac5OMPXeCXmFJI138Sg5zCFUuv6sxX9Kf3ulRa4rNg3kUCVdcNGwfgbCcrREJVoJGniUJErPBBTdU27TJzqoQ5z4gZI+iCn2JNc+eMc/+X70El6g7MMw87DYRgLBuESs1qSWco71lLM+q6Q4bbEV0Pz8Lg2L1X4OBv/t2HUOidG0OIIfTvtHdrEVkIR6OwAnSd+NNa07Ed+l/lgDYnJpiQtAO5f0ZZPzF7kLmolLGng1xIhXcREywHDNiXoTmcLutwAWX2CZxRzYd9SFVA6tVVURgKMiuyvrLT3cpsfp7yPfWUQnB6bfE9bF8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1wWNYuwR0iFyhe0PQIIsW3De5XQnvjH0mIKpfDTicM0=;
 b=gIWcCYTVcZOwOxsOwEJBCr2voKugL0EB6WoS7bgPW/rnJqTueEjATD2EHsyux/4XPmMPjS6kA4uA4XMceWJlu59C3nWppi/dBQphJEaElMzX8ySd4/HzLt/Z/YO27bX11J+UxCmTD5/XWeKPRHgTljPSPSWQ9RngseaknyTOdn5SnGTJnI55pSs3xGc5nu0fg94vnRHysIEIB/Eevx2/sjMH21FfqSE0Ojd3Zh0XPtcWjoIXu99Bdd4/r+7CjusebAMJZDzrijryEPFpJzopoT4pfcARNXL4byq/3imfoHgkLyq0DHD8CLu4o0mm4BhV8AtuNeX+KaYR1dYNZ3OJVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 PH7PR11MB5916.namprd11.prod.outlook.com (2603:10b6:510:13d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33; Mon, 4 Dec
 2023 08:49:59 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::ea97:f0a2:fffc:b892]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::ea97:f0a2:fffc:b892%3]) with mapi id 15.20.7046.033; Mon, 4 Dec 2023
 08:49:59 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "Shankar, Uma" <uma.shankar@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Thread-Topic: [PATCH 0/4] Backport fbdev Xe preparation patches from drm-tip
Thread-Index: AQHaJGyh3eRTH2+aEkCJypCmpU2EUrCY0G0AgAAEcQA=
Date: Mon, 4 Dec 2023 08:49:59 +0000
Message-ID: <93869ab6a63ee01e0854bfa5ef21e6dc3238d1b6.camel@intel.com>
References: <20231201153923.3433110-1-jouni.hogander@intel.com>
 <CY5PR11MB634475A54F321D670BD0E8E6F486A@CY5PR11MB6344.namprd11.prod.outlook.com>
In-Reply-To: <CY5PR11MB634475A54F321D670BD0E8E6F486A@CY5PR11MB6344.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|PH7PR11MB5916:EE_
x-ms-office365-filtering-correlation-id: a4896eba-617c-4c6b-ae96-08dbf4a5ff29
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HFF4/B2Ky+kX/HxtDYSHGa8a/eKvkyIkpoG4h1vmakbw04jpCo+H2rLipwrlAuOvKKBh8R06ADW4URbmrQnH5fqgazgGn+9/I1oHXTyTNvpIy1EnPfaPyhbRCEA8tMWHDzBoesnB1DIT4pCDD3DI9UvdpbwoVsbP2Ve2cqsZwpjx8+SZVmNB+j8mHiguQ7+gUpKOTocDPajx1SCK43SQOuJC93r1kOFpqgmquRUUyY9ZbWdWcOjUkuU5abBl48mCFTvgpo5PVFz9fgrmpQj3rZdH0a05mwcniP+MYOginYax6Wx4zDMBZKIJN1iWoFnzZI7NbUBOC+X5v848RKEYKge9oqDerFPSFDEtldLwRBp+rCPO7yzCTV+mpXCd2oAA30jKR2ihwY/GkNY6i/D7ozfLU26Pelh0C4bjVGN423S1xn1uX8PnAhrxdTOMjSOnjf1HyAMWlY8V7A1qb3LTQa3qJY6NJFas8wywdcxEHDWhpjuyQY3EUXcolCQDzfLtRx8tv0ki9zRk7fIzb0BxiWvIg3e7ZK3CdDzxy219cWB2/aQUQ9PW/mNwBtoHuqasa5X8XHR021SQeqghxWuxn5oHHlVsxQqB706PXPGszMm4NejEtYMQW9pbTJn27JHP
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(136003)(39860400002)(396003)(366004)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(71200400001)(6512007)(2616005)(6506007)(53546011)(122000001)(110136005)(66556008)(66446008)(316002)(91956017)(66946007)(76116006)(66476007)(54906003)(64756008)(83380400001)(26005)(66574015)(8676002)(4326008)(38100700002)(6486002)(478600001)(82960400001)(8936002)(2906002)(41300700001)(5660300002)(36756003)(86362001)(38070700009);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RTgxcnNScFQySlRUMDgvb0FaQXVUUGduc3h1OGsxY0R4OHBoU1VNRzR2Z1k3?=
 =?utf-8?B?MW1kYzZhT01SQllJcTZPQ2RYWE1iWUxWSnYvSGNSTC9jSGUzZDJoN3Rwc3B4?=
 =?utf-8?B?cDJRck43OEFwSkxJUGdQdzd3MWhkc3VWZXk3c21XZmJINjI3aDBNNCszM2ZS?=
 =?utf-8?B?cHJ6OGhUMmg4L250MlYzWitaQWpWOVdabkowdVhFSk9hVWR4d0xNZUs0Q05r?=
 =?utf-8?B?cnlweEF1UWpXdCt5cW9KZXM2MGNGMHNYK0kxNkp0TWlzTE8yZXhQOTNlWk1Y?=
 =?utf-8?B?c3h0MUtpN0tHelB6M0g4ajhaRUs1R3RhS0dYSXo0TkxtcXdwdklhSENVNFNN?=
 =?utf-8?B?V3JtVGdjQVFPL3QzUEJGK2labFlxVzRUY3dEUU1TOXdPeElpcE5PMHcxMGNK?=
 =?utf-8?B?eWowbEJNZ3J5cWxNQ1k5VW05YWhNeVF0RlBUcWJwbDF0ZkZBMHVtNTBFaXl6?=
 =?utf-8?B?RU9GV0ExOEgzSW1ldFUrWlVIcHhxNHBrRkpicDBtWm56WHFoUVhaK09PTDlj?=
 =?utf-8?B?TEhEbS9FMVVhUm85VWhCUXlqeUdDcThsN3dENTdEdTR5bDRkMXVQVWxySThY?=
 =?utf-8?B?Z1ozcW0rTlAvNDRhY1Q1RHFHRFh1NHM4MnNkeHJDdEQ2aDJVVnNaMStIbUtu?=
 =?utf-8?B?bEF5bFZJMmNrZmFXQlF0ZG9ybFNtNjE1cENpY2hqWWVzbjVZMFl1RG9SRGcy?=
 =?utf-8?B?STkwMlRQQnRFUG4zMEV4MWQzRFdoMWsrQlhqMUhueUcyd0RidEFuNmJRNDdm?=
 =?utf-8?B?YlBBVWxVL09la3ZFcCtNUWhMcVhyUWR2WUlrZ1ZzSGpEZ1pGUkNRQzVjQjVv?=
 =?utf-8?B?R3RBd2kyV1llUkZZVHM0dDFCK0NWUklBRlBRT05wOWxFcllMMkJ6S0o0cWRX?=
 =?utf-8?B?YXEzL0xMd1hkQVJwV1dFQjZ5Zzl1eTBQa01RQjljUGFINWdNWmNmWUdKUDgw?=
 =?utf-8?B?T1l1c2lLdU44UzlaWkJFOWlWMVBxcFVwOW5VeDNqMzFUeW05MW9WMnBiaHdQ?=
 =?utf-8?B?ZmFIV3NCd0ZpbE1mVE5yS1pOOTJJSEhBU1N4M0h5WU8wMFErSEQ3blEycWxm?=
 =?utf-8?B?RmtyRXBFaE1sVy9HT1N6bXFYdVJyN3haUWlycHZ5NFE4L01tTGpRYy9JOGZl?=
 =?utf-8?B?Rm1TaUpnRUVMdHNvNVlmOEUvTkRpU1VrbjQvakQwMEh5UHJmMndpRFhoSEhr?=
 =?utf-8?B?UFByb040NkZXRVQyNUlmNzB6ancvVGJ3V1g0U0I2TGZGZUViUGRiOElJMC9M?=
 =?utf-8?B?RHRxNzg1K2NVRElQS0xZaHRXdWtCemhKWXo1Tk9IODJna0tlZEFxWno2WEpD?=
 =?utf-8?B?VHFoK1RHSXo4TVVHLzA2dHorZjdjZ2tLUzJBNjcxNGFzV0JKYjFNVFZEOVVD?=
 =?utf-8?B?dGF0OEFNdVdGR096Rys4VFJoTm1xQWJlUG9XSG5lcGR0K29VZEY0NjRCRTd6?=
 =?utf-8?B?b2QxdCtJV1AzV3IwWFZxWUNzOWVBMndZYzNTK21uU21BSmxidTdTblo5NzNH?=
 =?utf-8?B?N3hMT2JqcDc1azRuWEg5cGFLV21ZTVRtdG1XejhXTFNkNmNnRW1SMXlTQ0pX?=
 =?utf-8?B?TnovdjdsS3o4Rk1ZbnVCSjEzMFFFMXFRM0x3MEd2Y2pEbE8zUWJ1TXp3aGNB?=
 =?utf-8?B?Q0JuR2xaVkIxZzRiWUJZZU9PR0wvdDdkeEhPL0tlbm5abFlSSllCVlJLOXhU?=
 =?utf-8?B?Y0s2MHhhcVlnM1BFRmZaa2FlTGV0REIxV04zZEJ1MkZXV1lSb2Y0ckpmMHlT?=
 =?utf-8?B?YmdqRlk4OHJLdHZKcE14L3pobzZ1R3J4ZENMdjR3U0k4MFRnNVJJTTlaeUpo?=
 =?utf-8?B?QW9WWkJzTlZZaGgza0hjUVVTRUZnVmhjZU9aTUhxQkZsaWJRQkxUZGhINjM0?=
 =?utf-8?B?VndJL3hUM3Y2WXFmcG81WTdES1pGTjFObVNsdzJraDgzbTh3RWVScW0ybm52?=
 =?utf-8?B?Y0VBdWlhM0hYcGI1VmcrbktnVnJxRnFBMGpIcS9HT2Z2SEdtdnVLSGFVNUNS?=
 =?utf-8?B?UG9qSEhFay9Na0pIVlJxRExwZU9xUDY4T00yOUJpWXNPNDhpSE5PN28raFFV?=
 =?utf-8?B?alB4R29uSDlSb0V3YWdpZDV4amg1M0pHQzZyUkdER21RZElzb2lFMk51aWRC?=
 =?utf-8?B?eTdGUjd2VlZldmkvSFFpeUlOdHdJVFU1UVZ0VENHcnVYN1NkTExlVS9kOUM4?=
 =?utf-8?B?L2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A94A8B143C9BB74C941E220EB75B768B@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4896eba-617c-4c6b-ae96-08dbf4a5ff29
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2023 08:49:59.0214 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pCYtIK9IABxNVM/yNb60ZIIbOdh5fk48h+Zk/U0DPBG3cag3mwZzuNUhrwjecp0qnLiDgFtWqgCfzb1Zc7/F+qTDtcmhWgQdcsVrV/fTe5s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5916
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 0/4] Backport fbdev Xe preparation patches
 from drm-tip
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
Cc: "Nikula, Jani" <jani.nikula@intel.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gTW9uLCAyMDIzLTEyLTA0IGF0IDA4OjM0ICswMDAwLCBTaGFua2FyLCBVbWEgd3JvdGU6DQo+
IA0KPiANCj4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+IEZyb206IEhvZ2FuZGVy
LCBKb3VuaSA8am91bmkuaG9nYW5kZXJAaW50ZWwuY29tPg0KPiA+IFNlbnQ6IEZyaWRheSwgRGVj
ZW1iZXIgMSwgMjAyMyA5OjA5IFBNDQo+ID4gVG86IGludGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZw0KPiA+IENjOiBIb2dhbmRlciwgSm91bmkgPGpvdW5pLmhvZ2FuZGVyQGludGVsLmNvbT47
IFZpdmksIFJvZHJpZ28NCj4gPiA8cm9kcmlnby52aXZpQGludGVsLmNvbT47IE5pa3VsYSwgSmFu
aSA8amFuaS5uaWt1bGFAaW50ZWwuY29tPjsNCj4gPiBTaGFua2FyLCBVbWENCj4gPiA8dW1hLnNo
YW5rYXJAaW50ZWwuY29tPjsgTWFhcnRlbiBMYW5raG9yc3QNCj4gPiA8bWFhcnRlbi5sYW5raG9y
c3RAbGludXguaW50ZWwuY29tPg0KPiA+IFN1YmplY3Q6IFtQQVRDSCAwLzRdIEJhY2twb3J0IGZi
ZGV2IFhlIHByZXBhcmF0aW9uIHBhdGNoZXMgZnJvbQ0KPiA+IGRybS10aXANCj4gPiANCj4gPiBS
ZXZlcnQgbG9jYWwgZmJkZXYgaTkxNSBjaGFuZ2VzIGFuZCBiYWNrcG9ydCBzYW1lIHBhdGNoZXMg
ZnJvbSBkcm0tDQo+ID4gdGlwLg0KPiANCj4gQWNrZWQtYnk6IFVtYSBTaGFua2FyIDx1bWEuc2hh
bmthckBpbnRlbC5jb20+DQoNClRoYW5rIHlvdSBVbWEuIFRoaXMgaXMgbm93IHB1c2hlZCB0byBp
bnRlbC14ZS1uZXh0Lg0KDQpCUiwNCg0KSm91bmkgSMO2Z2FuZGVyDQoNCj4gDQo+ID4gQ2M6IFJv
ZHJpZ28gVml2aSA8cm9kcmlnby52aXZpQGludGVsLmNvbT4NCj4gPiBDYzogSmFuaSBOaWt1bGEg
PGphbmkubmlrdWxhQGludGVsLmNvbT4NCj4gPiBDYzogVW1hIFNoYW5rYXIgPHVtYS5zaGFua2Fy
QGludGVsLmNvbT4NCj4gPiBDYzogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0
QGxpbnV4LmludGVsLmNvbT4NCj4gPiANCj4gPiBKb3VuaSBIw7ZnYW5kZXIgKDQpOg0KPiA+IMKg
IFJldmVydCAiZHJtL2k5MTUvZGlzcGxheTogdXNlIGludGVsX2JvX3RvX2RybV9ibyBpbiBpbnRl
bF9mYmRldiINCj4gPiDCoCBSZXZlcnQgImRybS9pOTE1L2Rpc3BsYXk6IHNwbGl0IGk5MTUgc3Bl
Y2lmaWMgY29kZSBmcm9tDQo+ID4gaW50ZWxfZmJkZXYiDQo+ID4gwqAgZHJtL2k5MTUvZGlzcGxh
eTogc3BsaXQgaTkxNSBzcGVjaWZpYyBjb2RlIGZyb20gaW50ZWxfZmJkZXYNCj4gPiDCoCBkcm0v
aTkxNS9kaXNwbGF5OiB1c2UgaW50ZWxfYm9fdG9fZHJtX2JvIGluIGludGVsX2ZiZGV2DQo+ID4g
DQo+ID4gwqBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2ZiZGV2LmPCoMKgwqAg
fCA2ICsrKy0tLQ0KPiA+IMKgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9mYmRl
dl9mYi5jIHwgMyArKy0NCj4gPiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Zi
ZGV2X2ZiLmggfCAyICstDQo+ID4gwqAzIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwg
NSBkZWxldGlvbnMoLSkNCj4gPiANCj4gPiAtLQ0KPiA+IDIuMzQuMQ0KPiANCg0K
