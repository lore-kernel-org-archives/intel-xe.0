Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9BB0C47258
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jan 2024 21:16:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81B4B10E08D;
	Tue, 23 Jan 2024 21:16:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1652910E14F
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Jan 2024 21:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706044576; x=1737580576;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=WaWyWnfwgsnbKASaS+ZOd9TcYmkZluO47VX2AAkidkA=;
 b=QUKI5fO+6ERObNi3gp/N0ywae8FjZimeyFZ33iZh2S+7FihnT9z8gzbd
 146F/4fDXlqoirXAjjm1sz6BNThXG3XrWZQFNgl3RMyyWNF5nCPvDwpnQ
 6VA0lelA78VU2iWVCkNhpKUd74fhDrcH7Uhr1KB7J0S/js7iDUYI4lsYR
 n5gOFSxA3X7j4/+SpNjW77GOSNeOG1W3bcGGgclK5luxCDDaAihXebMIx
 Qm2sB7RMFLxkW6KdrO11t6d2FG/SxAb3/jotlLyGxoczuPGS8FkEo8yyA
 TQlniLfCNbjFiPq5IdI+SHvwZPGEkJz1nkDA87TktxjtNDuH67ZOLKE+I w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="392070340"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; d="scan'208";a="392070340"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 13:16:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; 
   d="scan'208";a="1658890"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Jan 2024 13:16:16 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Jan 2024 13:16:15 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 23 Jan 2024 13:16:15 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 23 Jan 2024 13:16:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bgnHLEnilvZer9Amgkmqn0gzBglyrdxFq6N16ONFOswtsjZb1EMbqtPEtaaM+ACCdX0SHtQyn3VPcGNbCXg2SBpHWoNUmNAfy1UX8qVz6TY3U3McbdTYd5b7/7hkvzbMjr6K8UUvKo1znmI4iy0FirJoZiOW65uhGpLLROhC3GwrEm7U8aWLuUkOoEDGKjicqJ1cilCMvm97Do6FtaFa0BLm/Lgo7RMtZ9YQL9PJpFii+/ZKVwxHp7PjfpbdiJaJNCmT19b88GreuGzLJov/Tg1Qodkem2S6wMeYrSrisQIJtv8049k0qfNykujv/sCBVJcW5TIbLp1HQeULATH1Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WaWyWnfwgsnbKASaS+ZOd9TcYmkZluO47VX2AAkidkA=;
 b=feb1CTT5bK7bl8y3xKZw0c2WL+SuawkTFIHhgdri0qcssE6OH0IILy2try9SBK8IrA8ZHMwQXKCFaB/NHg9JDscmW6LRuUWRD8oYaXAQhVTEU9tWxvWrnMHCKbkte7lopx6z7HuhoYxjG8X0bs6KtdL5A3HIPvBh//pCSWSaPNtLE/z6lvNa/uT2uvKSG4OP3aseZCfnIUWHLLAznHt0/oqJISpHP4r2uIA/leBVlAdrtqGk/YlzbUB57jRC8atfIzXtqEOSufXV3Q3mDR3c+w3KH6lMipIsRepuHuFCzgm2ITjqHaqauZpkTJd9bStb5PddkDfs7l650V7fOx9EhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by CH3PR11MB8316.namprd11.prod.outlook.com (2603:10b6:610:17b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.37; Tue, 23 Jan
 2024 21:16:11 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::98c3:e090:252e:7967]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::98c3:e090:252e:7967%4]) with mapi id 15.20.7202.034; Tue, 23 Jan 2024
 21:16:10 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 4/9] drm/xe: Stash GMD_ID value in xe_gt
Thread-Topic: [PATCH v3 4/9] drm/xe: Stash GMD_ID value in xe_gt
Thread-Index: AQHaTj0iBASwrvJw4kyXZd6SvyH047Dn5kkA
Date: Tue, 23 Jan 2024 21:16:10 +0000
Message-ID: <903c68a932c2dca0124f758df2def1898eea2228.camel@intel.com>
References: <20240123204454.246788-1-jose.souza@intel.com>
 <20240123204454.246788-4-jose.souza@intel.com>
In-Reply-To: <20240123204454.246788-4-jose.souza@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|CH3PR11MB8316:EE_
x-ms-office365-filtering-correlation-id: b31d8061-ba11-4b64-e572-08dc1c5885ec
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MvDvnCZ2sQ/RLGwZbqONyd83zZ1eDb+3Zo83v4RnYZAJHuuZNIdqQyKclLYeTshYRPX6/ScLZV83Z+kNTBXx8XFx5UF40ko3sf35NKW6kDKd5duUuSWbhPctRm6YHXybFSIyj4vCQy5znqyPuH21K7TT0cHfw+t0LpkI/MEir2GqwkI4qDBpWOWhaqFwFacd/oDE3Cu6yVmMu8tZXNpV3krZMgG4aFgSfyixGw3rvkxxg1POo8BVtSev3dLrgFiBnVKXu+FsBNXUr04kzQHa8dyiA8pHpohQcrI73DH7ZA3ZD0oPKyHz1yhJtHxz2BGwyXDMWvTN14ureNRrl1pNuUVz14JSVx+Q1h6/l/BBa1VvEBNsosrq18rbbtdVpplICH41jDIvzEl5RMV88MIUSpbny2cBWAsOdV2GEHNUvP0+RXDjhVnrWV4UFbF1UaVakQqbz8Vs6tkA7+YBLEgxNk5kfVTbe2YACzNXXyXaXOndKjQeASY/XMWCur/0oquUKyoClGdP4kRI+AE1cowMy1QKQHo0Stb7hR9UBxirCHvOGOcBhCXM3PviUIWtugCgi87uDshRvdKm1S5Me5xwUyfDRTQr3aLtHuofxq50Gfsu5wZ/ZVI3vYvKd5334mqI
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(136003)(346002)(376002)(396003)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(83380400001)(91956017)(36756003)(86362001)(82960400001)(38070700009)(38100700002)(26005)(122000001)(6916009)(107886003)(2616005)(6486002)(41300700001)(6512007)(66476007)(6506007)(2906002)(76116006)(66556008)(54906003)(478600001)(4326008)(66946007)(316002)(66446008)(71200400001)(64756008)(8676002)(5660300002)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M21zQTdVaHV5Y3lqN2NqeDM2R3JrU3RPTy9DejZuN0pabU56c0tvbHlnVko0?=
 =?utf-8?B?RzZhNUFKTEdUNE1MQ2tyOFJNNlhtd1NiYUk1OHp0Z0dJU0lSaklEUDJhN1pt?=
 =?utf-8?B?ZjdoYitnSDJmblZvZW9jb0JDcG1KcW1RaVByVUNFNXRaditDa09TQ0FXVTBr?=
 =?utf-8?B?c1BDaG1OdHIzbzNERnNNUHBvczgwZGlBVDBVT1d1cGkwYVcxVHgvdVVlR0pv?=
 =?utf-8?B?NFhxQkR5Mkp5MXI4VTFPYU4vT2pNazlCaWw0aGRuK3hmR1hZRENuSXkwOHNO?=
 =?utf-8?B?Ymc3ZE1rR3ZtT2pRTlF5QmVqUHBuZS95UXNjakF0T21hMFNxYlZIbXpodFZo?=
 =?utf-8?B?T0JidjZkZ25qYncrT1hIVXc0TnM5Q1lKTFZQT24xaFk0QVFNUEJXRXkxeXZL?=
 =?utf-8?B?TzNmbGsrNWIyTVpCbkpOeGd5M2VOOHJxWjFDRzdCbEpjTDVVWmVvUWhMcVNE?=
 =?utf-8?B?Y0MxZmFWU2xJMTA5bXZLNW5pUTJvUEFyc2c4cHI0Sm9oRXRwR3dkQ3grZzl1?=
 =?utf-8?B?Q3JQdm5QQTNUU2s4NE1EOUlXQ0cwSDN5aGsra0JQY29hVVdjZjBUQUl4TTJI?=
 =?utf-8?B?ZUpib1V6MkwwamlYbm5KNGN1NTArRnIvNEJReFk3Nk9IQzEyaWlsNGZEc045?=
 =?utf-8?B?ZUpaOVdvOFc1OGJ5bVlqdG9GbHBYTE9jVnZqUjhiZlYxZmhFR3M1OTVSbkJS?=
 =?utf-8?B?YzRuTEQwaTd3TEhYVzJwNzlqU21udUhXeHdqSFpja0FKVFFySW9ZclpSc2h6?=
 =?utf-8?B?SmU3enFIYVcrNGlRMEpoWWUxSDZVOThxKzlhNW9ZazNWa29VUm5Rb0FISitm?=
 =?utf-8?B?NzJQdTl5SmFhVXFGbUJ6VmVYbUMySG95bWwwY3JrU0EwaHUxTWx3R3JiNDAz?=
 =?utf-8?B?YkNvODBURlp0dTFvNzJLbDRPUkYxMUlCVjZDcnk5ektsMzMwMTJsVVc4NmxJ?=
 =?utf-8?B?b0x6dnhSK2RMUjR0T3VBVk93Q3VYcWJVQXdJRVhITlUxNGFRVEhzcjVkRUNS?=
 =?utf-8?B?bktDcXI2Y1UxQWhZT2NuQ3NvaHFJcS95dGpGR05RV0F3Y3JVNk9Xdm56VXYr?=
 =?utf-8?B?alhsaXBZZGQxR1g5eUErSlhDa2RxSkVhYUFEK1gvR3hkbDA0SS9jbUNkU0pP?=
 =?utf-8?B?MkJKNmhSWjVrM1paaTd3SFVielR6aHJnUi9ReWdPZUhvaFRNMUtxeDM1MzVu?=
 =?utf-8?B?ekYvYlBXa1JzYllwUmNtUktLVnlialRMMXFSK2FpMm9TM3RxNklpZzdzWFRK?=
 =?utf-8?B?cXlLbWs4RUQ2Z2dQVGNDM2VwNUV5MnhYWjZveS9xbWI1QTZ3aGFXZTNzbkZ4?=
 =?utf-8?B?SkxCMGpOR3ZhMGM0WGlMazFWNDVlcldab0F4c09sRjdPT0RDOVI5SW1LQm1K?=
 =?utf-8?B?Z1QwUEdlM0xJNHFIaGpWNG5aVmhlSitWZGJPQkhSY3RjSWlMbmMyOG5lV1Vq?=
 =?utf-8?B?cFArallGMDlnQVU0dG9QdEQ5NkV0WWpUZWJkQkIyQm50bGNIcE9BRG1adkpP?=
 =?utf-8?B?UjhqcVMrbURGN2VtR1N5RzI2S2NGQ3NoNG9MVzkzbU94TUhrN0E2VWxGSU1r?=
 =?utf-8?B?YjlJMk5yQlhOOUhuUkZTSkNQVHFpdHIyTlpxZlpsT1VEaWhBN0lIWWo2Umxy?=
 =?utf-8?B?ekh4VkZ5NlJJcnBmSC9JTFcwTjhQR2RvUjg0eDV0RDliMUhveEZzOEx6Ynhu?=
 =?utf-8?B?ZmE1eWZvVmkzUlEyVjQ2djEwSWUvYmh3S0hNazFyRHdHaUppeUNWUDBBWWx6?=
 =?utf-8?B?VmtnZG5xeUNMK2NiZFV0dEdma0lRQzNQYzNOVHlQTCtpUXY3ZjNoeXRMRDI3?=
 =?utf-8?B?aTNKVFU0c3BteVJhQ0IzeDVNcXVGZXFZNGEvc085ZmJLNUVZMkpZT2ZSclpv?=
 =?utf-8?B?RTBaaEEydU8vZE1SNUtQeDBWVXVpc000NHNTOXZKV2hJT2ZZc2hwWXh2OUl6?=
 =?utf-8?B?UEtndTFQUTZUbWdrOG0yRzJ0QzZtTG0vdnE1dVRZSFRhbUd3Z1NreCsvVWJ3?=
 =?utf-8?B?Mzh3cENPMk5pN1EwNEVrUFpnMXZJaW1XZXFOYkYxb3o0aDkzeFRlQ3hCZnA3?=
 =?utf-8?B?SmpENnp4Q3gzK2xLbFhDYzN4WjdSNUVQMmpteHF1MXZXVjFtaTMwL2d5dkR0?=
 =?utf-8?B?SmE0WmhYMUMxWFl6ZUZWemNyRVUrMmgwQ0U3MFM2eEFyK1dydnZFNVg5K0hB?=
 =?utf-8?B?aVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B68F82333952C148BB1AAC6990CEA87A@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b31d8061-ba11-4b64-e572-08dc1c5885ec
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2024 21:16:10.9156 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SQhXjsKXFybNuTWL+3c2lshuCuAc0QJ1hJe5Wmi8hJnow+ofS+ecD/MyWZ6OrFO6XSRHx9wRMLHxMZhpNK236w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8316
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
Cc: "De Marchi, Lucas" <lucas.demarchi@intel.com>, "Roper,
 Matthew D" <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDI0LTAxLTIzIGF0IDEyOjQ0IC0wODAwLCBKb3PDqSBSb2JlcnRvIGRlIFNvdXph
IHdyb3RlOg0KPiBGcm9tOiBNYXR0IFJvcGVyIDxtYXR0aGV3LmQucm9wZXJAaW50ZWwuY29tPg0K
PiANCj4gQWx0aG91Z2ggd2UndmUgc3RvcmVkIHRoZSBtYWpvciBhbmQgbWlub3IgdmVyc2lvbnMg
Zm9yIGdyYXBoaWNzL21lZGlhIGluDQo+IHhlX2RldmljZSwgaXQgd2lsbCBiZSBzaW1wbGVyIHRv
IGltcGxlbWVudCB0aGUgdWFwaSB2ZXJzaW9uIHF1ZXJ5IGlmIHdlDQo+IGFsc28gc3Rhc2ggdGhl
IHJhdyByZWdpc3RlciB2YWx1ZSBpbiB0aGUgR1QgaXRzZWxmLg0KPiANCj4gU2lnbmVkLW9mZi1i
eTogTWF0dCBSb3BlciA8bWF0dGhldy5kLnJvcGVyQGludGVsLmNvbT4NCj4gUmV2aWV3ZWQtYnk6
IEx1Y2FzIERlIE1hcmNoaSA8bHVjYXMuZGVtYXJjaGlAaW50ZWwuY29tPg0KPiAtLS0NCj4gIGRy
aXZlcnMvZ3B1L2RybS94ZS94ZV9ndC5jICAgICAgIHwgNiArKysrKysNCj4gIGRyaXZlcnMvZ3B1
L2RybS94ZS94ZV9ndF90eXBlcy5oIHwgMiArKw0KPiAgMiBmaWxlcyBjaGFuZ2VkLCA4IGluc2Vy
dGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3QuYyBi
L2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndC5jDQo+IGluZGV4IDFmZTRkNTQ0MDlkMzQuLjQ3Y2I4
N2Y1OTllNDYgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndC5jDQo+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndC5jDQo+IEBAIC0zOTksNiArMzk5LDEyIEBAIHN0
YXRpYyBpbnQgZ3RfZndfZG9tYWluX2luaXQoc3RydWN0IHhlX2d0ICpndCkNCj4gIAkvKiBJbml0
aWFsaXplIENDUyBtb2RlIHN5c2ZzIGFmdGVyIGVhcmx5IGluaXRpYWxpemF0aW9uIG9mIEhXIGVu
Z2luZXMgKi8NCj4gIAl4ZV9ndF9jY3NfbW9kZV9zeXNmc19pbml0KGd0KTsNCj4gIA0KPiArCS8q
DQo+ICsJICogU3Rhc2ggaGFyZHdhcmUtcmVwb3J0ZWQgdmVyc2lvbi4gIFNpbmNlIHRoaXMgcmVn
aXN0ZXIgZG9lcyBub3QgZXhpc3QNCj4gKwkgKiBvbiBwcmUtTVRMIHBsYXRmb3JtcywgcmVhZGlu
ZyBpdCB0aGVyZSB3aWxsIChjb3JyZWN0bHkpIHJldHVybiAwLg0KPiArCSAqLw0KPiArCWd0LT5p
bmZvLmdtZGlkID0geGVfbW1pb19yZWFkMzIoZ3QsIEdNRF9JRCk7DQo+ICsNCj4gIAllcnIgPSB4
ZV9mb3JjZV93YWtlX3B1dChndF90b19mdyhndCksIFhFX0ZXX0dUKTsNCj4gIAlYRV9XQVJOX09O
KGVycik7DQo+ICAJeGVfZGV2aWNlX21lbV9hY2Nlc3NfcHV0KGd0X3RvX3hlKGd0KSk7DQo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3RfdHlwZXMuaCBiL2RyaXZlcnMvZ3B1
L2RybS94ZS94ZV9ndF90eXBlcy5oDQo+IGluZGV4IDNjYWFlYTJmZjkwOGEuLjM1NGQ1ODlmYjky
ZDUgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF90eXBlcy5oDQo+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF90eXBlcy5oDQo+IEBAIC0xMTcsNiArMTE3LDgg
QEAgc3RydWN0IHhlX2d0IHsNCj4gIAkJICogaHdjb25maWcgYmxvYi4NCj4gIAkJICovDQo+ICAJ
CXU2NCBfX2VuZ2luZV9tYXNrOw0KPiArCQkvKiogQGdtZGlkOiByYXcgR01EX0lEIHZhbHVlIGZy
b20gaGFyZHdhcmUgKi8NCg0KTGFzdCBDSS5Ib29rIGZhaWx1cmVkIGlzIGNhdXNlZCBiZWNhdXNl
IHRoaXMgbGluZSBzaG91bGQgYmU6DQoNCi8qKiBAaW5mby5nbWRpZDogcmF3IEdNRF9JRCB2YWx1
ZSBmcm9tIGhhcmR3YXJlICovDQoNCldpbGwgZml4IGluIG5leHQgdmVyc2lvbiBvciB3aGlsZSBh
cHBseWluZy4gDQoNCj4gKwkJdTMyIGdtZGlkOw0KPiAgCX0gaW5mbzsNCj4gIA0KPiAgCS8qKg0K
DQo=
