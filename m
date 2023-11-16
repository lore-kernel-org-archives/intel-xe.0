Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9BDAC54FB9
	for <intel-xe@archiver.kernel.org>; Thu, 16 Nov 2023 15:30:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C96010E621;
	Thu, 16 Nov 2023 15:30:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1273310E621
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Nov 2023 15:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700148657; x=1731684657;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=4EqefeIZzINFEX5Vdh4A5r4yrxvnvlRABUD2bRZEWUw=;
 b=S15mZUKICalYAzU1h7PEOL6q6uqJs2F6DbPUEsY9FomWBI9rQd5onG7y
 ClzzClEI/Dp1UTu5ohWyYnCnr+BPPXzAGQKQ4sUSMnPWWeUWj1Iwi+rlE
 yzu/49eUJE7WMsCjFFUL8z1gOMFqs5nyEwj9lp23JwwIji9CLN+B9CvwT
 F+5OWbN2vBK9Y7nZ/npmLKsfYcSRy6VHX5AgFPcS30jbzmnqUdH9iNtMK
 PKeDHb85r5Y7JGmdDggubyVuaAonBJiuEY3YzON8vetWIcMbiddKD8Hul
 VgDMJ0cbgSjTxTSoucumtOLeGoA+ICtoFrDDuFcpcCLY/soGlQ4mfkIgh Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="457602284"
X-IronPort-AV: E=Sophos;i="6.04,204,1695711600"; d="scan'208";a="457602284"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2023 07:30:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="758864858"
X-IronPort-AV: E=Sophos;i="6.04,204,1695711600"; d="scan'208";a="758864858"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Nov 2023 07:30:55 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 16 Nov 2023 07:30:55 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 16 Nov 2023 07:30:55 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 16 Nov 2023 07:30:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BpA6dKtqM0lIGxgtc7Jzrxu04fTcjaJmdEfR12XvN2d3r6tcMwx+O188nHyrdQli9XvADxRSWQ3ZTFW7JwUW1Rl9btIhkvqY1UCTUAINwgiRUWZPrGlNfbLi9hRhyOzuZQhrqYsogjySJwzN8cTAIN3uHGSULKmI9nTPegmouXt77gS76irwT9TiUJ17PPwGnAaJHSX+FgVv/DdIdNRPafuCjM0dPY9z5H2yBKd5BP09OuNuF90ZuRzCzdmtWDbHkC4wdI3ZJ0QB5QGlSQOWn68K7BF9YrLeTeZqauLCfZkuiINJLh4HdI/u2SlbFB1KjANYYKqHrauToFRI7hsF0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4EqefeIZzINFEX5Vdh4A5r4yrxvnvlRABUD2bRZEWUw=;
 b=W80+VfLCDjsez5OK47Jga3tFw4NcShZjpX/vH2srQIs2XsCzPj9GIKHUgEkfhhCaeK8IsJi762Y/KtS/V8XhcaChiQnNkD+79xLAiy19LkxwvjIh4Qv0YqO+Lxsmx1RpSI02UnRY+aMR7jYkvCUOUjNutpYHmfHHKF7ufh4Fc8IV3hEYYCp23cloDBqnqdKlh/E8merXu2ZECltBk4paSZv2TgMD+VyFEOO2thlYPWpZu8QokG1U/UhwrgEmW2e1vrZo0LYLt8BwVdHRFsUT0YkGyPNds6Go83rlMVGJqTOgEVCHE3GTBKRGlUNGHJuXBvRDc4EqufOGQeplej3NLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.21; Thu, 16 Nov
 2023 15:30:30 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::8076:c5fe:e0fc:cfaf]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::8076:c5fe:e0fc:cfaf%7]) with mapi id 15.20.7002.021; Thu, 16 Nov 2023
 15:30:30 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Dugast, Francois" <francois.dugast@intel.com>
Thread-Topic: [PATCH v1 3/8] drm/xe/uapi: Change rsvd to pad in struct
 drm_xe_class_instance
Thread-Index: AQHaFv9Z5FgK9DXwtEGo46MSR4Q0HbB9FaeA
Date: Thu, 16 Nov 2023 15:30:29 +0000
Message-ID: <660e3c5d07ffa8b82d29c5a81da50133aa58ae21.camel@intel.com>
References: <20231114133434.7-1-francois.dugast@intel.com>
 <20231114133434.7-4-francois.dugast@intel.com>
In-Reply-To: <20231114133434.7-4-francois.dugast@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|BL3PR11MB6410:EE_
x-ms-office365-filtering-correlation-id: 9c7a1568-4b49-4bae-7b55-08dbe6b8f74b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: l4mrMV5wO+KxY/lNT6dNUHAhsVFz8bS/wWNqjzOv49z3CSBgrUq7OB7fXroWkus3HJcZ8lYwVAEMlcLesUb9SbGQOwGHznFTTo/b7KvTCQM+EbPhzn8FbJTNm/1KrlUK5BnkHDyynyas2vD2NpzW/cVjiomB7cigvyDN9R8LXmIX4tQlmo3eFFeXg/ieJpYFWUFR/65mDUXrHKAInqULjqOevtVmhG6qZEADUpdLiXOyVhFH7sw/zmrJxcpTy/czLf+TJqGc9lUtJxgJD6+Bmxv3O7JSkVd6Di417OjPf0WHN9DtPtW/M6AZGFsAV8cfJzeBx3huRKLrWRDk3dZqAvFOUyYkRwrdObevxxWV/vnelK5WdhhAbgZEwUtaFBh+B3WTtUPHGz8agL8gRXql2CuMLDb/X8LbXpUZOHyLxvJqZtvQi+9mN53AeF89YsrMuZbniscym4LQ36dWHJSBPAf+hFC5We4oL0PhCO2LabIz1G0AWuLAlA0bh4HyncoaHp5MXVL+KGiPvpMDrfyrs+FmOZhgw5Rzc1/GdEOP3QeAF+1DUe82gG5jDRQ5WRRKLv2Cedk4Zvl/1iM7C38npyG4nnTqS0nUGRP5bxZhDjAF3EohW0wDfjipsmRxGxtz
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(366004)(396003)(136003)(39860400002)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(91956017)(110136005)(66446008)(66476007)(76116006)(66556008)(64756008)(66946007)(316002)(6636002)(83380400001)(26005)(2616005)(36756003)(6506007)(38070700009)(71200400001)(6512007)(6486002)(107886003)(478600001)(5660300002)(38100700002)(122000001)(82960400001)(4001150100001)(41300700001)(2906002)(86362001)(8936002)(8676002)(4326008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZFlISnE1K0NzTDNsQi9IRUU2dWxUNXp6TEtjTEE1bHhEQytzM204cFZBdnRG?=
 =?utf-8?B?MWhaS280SDdMU0IxditnUG50ekV2d0NjL3hndG1BS0R2ZE9QYVJ2STZNNXBT?=
 =?utf-8?B?dFBGZHNqT1R2R0FEREh6aU5BMHRjWWJ2ODVLRFp3dGZjNTRxN3U4RkcvVTh5?=
 =?utf-8?B?MWV6TlA5QnJOdG1NN3l6T3duNE5FU0RlN1JWMXlMVkdOdmNsN0dkZjRja2lD?=
 =?utf-8?B?cFdTdEVwbFV0ZDdEZE1abllvYUxaem9vWitlUlNOY1JUc0ROa21yUjVmUmdS?=
 =?utf-8?B?ZlhmN0NoN0k4QWxRVlA3YThMZ1hWMnN4eVhnS0tOSE1QNGdlbk1vVDNhblJM?=
 =?utf-8?B?TnNsU1E3TC83ektqUVRVTkJVWHViYmNsdllVTmkzWUVVbFNRU1BoZkNVSXhp?=
 =?utf-8?B?QmZnRnpraWdhQVNnUkdrTTRCZy90T3h2Y0Y1Tko1RVlCanUveUZscVlHS3Nt?=
 =?utf-8?B?NkR0RUxNTmpOV09rd3E0WFFrZ1NGVTdjaitESmZzbDZ3NWU3MHZGWVozUEhm?=
 =?utf-8?B?TW95WE5LazBOZ0E2VWpDSXRBMVUyK0drS1dWSGFOTTRqQkxoUzB0MlRpR1pn?=
 =?utf-8?B?R2l5MmhjWmJXMHBjcjFweGhTRmQrUEJXTVoxcGllVGVaR0FTb1FIL29Uclc3?=
 =?utf-8?B?M1AxaFlxaWJhNWRKWlllc2pTL0JObjYvS1lKUlVhbk1Rd05oaUtaZEVVWlFG?=
 =?utf-8?B?ZC9zSElwWXh4My9NK2w0dHdHeGpZZXJPTW8zRmJKYXU2TXdCbzUwV0g0dlZW?=
 =?utf-8?B?WTNhQzZDOFF1MWc3Z0lqM3pIVmlzeTY3bTMvWFQ2ZlBaRm4vUndQM2NReVly?=
 =?utf-8?B?TFprOFB3aXMwUDdVci9Hd1ZQczc2enA0VVEyVmcrWjA4aUlqa1RXZ2Z3MWwz?=
 =?utf-8?B?S1dhNzRZa0FQendEWVZWUFQvREkzNU8zbmxvbFJ2cUJha1dNUllsVjZYSnor?=
 =?utf-8?B?WkN3ZXNCNXlHMmdoaUNmK09iYXNncGoxSitVdS9qSVpadi8zZzlIbEF6dlh0?=
 =?utf-8?B?dm9mODIwLzBhZkc4NGU4a1ZmNjJsd3A2aHNzcUVhTTBSUEdWMWlXTHRROEtj?=
 =?utf-8?B?bVFSby94Wm1tVWdvczliY0V5RG04WnZoZThFL0VOUFJXU1YvSlJDQjk2SHFK?=
 =?utf-8?B?V0M2Y2Y4V1Z0Ly94ZkRPcGJ5RDdVVHMzdjVkak5lakRyd21rSlVSKzN1MCs0?=
 =?utf-8?B?eVNxSlZLQllSRGpiVGNpRkh0YW9VdEFQR0ZyMDV6ME8rVGttbmhNdmErWm16?=
 =?utf-8?B?cFZXTWlhZ0dSSk14VGZMK2hHanRLUXQvZTZvYTZ4aUxtcEtXSHA0M21HM1VO?=
 =?utf-8?B?blllMlRBcHgvZG9acXhXQncvc1VqbkRYRC9Gcngrc2pqVFRlNHVLd2dkUHJD?=
 =?utf-8?B?Q0gvMTU5UkNoWkpRYkdEdDJGWU4rZFVwcm9TVmRrbzU0NVhVZGhWeXhDK2h1?=
 =?utf-8?B?UytLSU9ucTFxOXFYaXhhYWNVcFRyMXA4TFBtNWtleXlNZzhCRitJNnFNS08x?=
 =?utf-8?B?eGFRQWp2ejZKM0FtbWw2eXFBQjlSaW1WcFR5SVVYUDRsaWlvdjgvUDlQVzhR?=
 =?utf-8?B?ckUxQUJuWkx2TGl6d1UwRk90Rnczdzk3bzBHYXVodE9VMUtpL0cxeUxBcG9h?=
 =?utf-8?B?WmJkMXFJeDlWNTk0azFXODVGeEVrVXI4VGV1ZFNCTnhlYkJnYlRXR1ZVSGw3?=
 =?utf-8?B?TmtBRjVveU5XQUVQN2lhUEx1M2l2RzUvQjd4M3dVSkVJQXA0aDhGVS9wOWIx?=
 =?utf-8?B?MGpObFpsVkdWLzNZMzBDZ3B2MlpLVmlCcWVmaW1kSTF2SEIrNUNvRDNOUFZ0?=
 =?utf-8?B?NWVtb3BqTWsvQnB4MHlkajZYMmMzSVVZTkRRTmpJNGtkOXlDUUNOMGdlbHdE?=
 =?utf-8?B?RWtiZ0xKc2E4R2I1TFlCVVVlZmZ2TVBCTXZlWGZVTUMwaC85a0VkeHFqMTNX?=
 =?utf-8?B?N0lmblhSay9CbDA3aEs1QitYcUNRQjVWaEdKMXRaZERGQzBTVy9jbFZjUGx1?=
 =?utf-8?B?ZTR2bXdMbkE0cXhKRUozV1JvejhzbXoraVhxL3ZrUTFtckMyaGhYVndQUTJU?=
 =?utf-8?B?Vk1XSTlBRmYwK1RGOWthUVB2SFRUbHd4Yy9yQUxONUlyOHlySHNOUytRMnNZ?=
 =?utf-8?B?anBmQ21Ha0FlNmpibzhnT1pvaTJodEJKenY1b09WaWJSLzg2QllWYzlnOUlV?=
 =?utf-8?B?WGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FC733F9FACC929408DF15ED20AF6B6EF@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c7a1568-4b49-4bae-7b55-08dbe6b8f74b
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2023 15:30:29.9845 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hhSqknvnMSFCstyxlv/40Lu4SKP6RPyfRU/gwjOeJzgjL6oLprgboN99pqVVeUM/Ix9HoAizx26XZc//+GdEvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6410
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v1 3/8] drm/xe/uapi: Change rsvd to pad in
 struct drm_xe_class_instance
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

T24gVHVlLCAyMDIzLTExLTE0IGF0IDEzOjM0ICswMDAwLCBGcmFuY29pcyBEdWdhc3Qgd3JvdGU6
DQo+IENoYW5nZSByc3ZkIHRvIHBhZCBpbiBzdHJ1Y3QgZHJtX3hlX2NsYXNzX2luc3RhbmNlIHRv
IHByZXZlbnQgdGhlIGZpZWxkDQo+IGZyb20gYmVpbmcgdXNlZCBpbiBmdXR1cmUuDQo+IA0KPiB2
MjogQ2hhbmdlIGZyb20gZml4dXAgdG8gcmVndWxhciBjb21taXQgYmVjYXVzZSB0aGlzIHRvdWNo
ZXMgdGhlDQo+ICAgICB1QVBJIChGcmFuY29pcyBEdWdhc3QpDQo+IA0KDQpSZXZpZXdlZC1ieTog
Sm9zw6kgUm9iZXJ0byBkZSBTb3V6YSA8am9zZS5zb3V6YUBpbnRlbC5jb20+DQoNCj4gU2lnbmVk
LW9mZi1ieTogVW1lc2ggTmVybGlnZSBSYW1hcHBhIDx1bWVzaC5uZXJsaWdlLnJhbWFwcGFAaW50
ZWwuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBGcmFuY29pcyBEdWdhc3QgPGZyYW5jb2lzLmR1Z2Fz
dEBpbnRlbC5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3F1ZXJ5LmMgfCA1
ICsrKystDQo+ICBpbmNsdWRlL3VhcGkvZHJtL3hlX2RybS5oICAgICB8IDMgKystDQo+ICAyIGZp
bGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfcXVlcnkuYyBiL2RyaXZlcnMvZ3B1L2RybS94
ZS94ZV9xdWVyeS5jDQo+IGluZGV4IDU2NWE3MTYzMDJiYi4uNDhiZWZkOWYwODEyIDEwMDY0NA0K
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfcXVlcnkuYw0KPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0veGUveGVfcXVlcnkuYw0KPiBAQCAtMjE1LDcgKzIxNSwxMCBAQCBzdGF0aWMgaW50IHF1
ZXJ5X2VuZ2luZXMoc3RydWN0IHhlX2RldmljZSAqeGUsDQo+ICAJCQkJeGVfdG9fdXNlcl9lbmdp
bmVfY2xhc3NbaHdlLT5jbGFzc107DQo+ICAJCQlod19lbmdpbmVfaW5mb1tpXS5lbmdpbmVfaW5z
dGFuY2UgPQ0KPiAgCQkJCWh3ZS0+bG9naWNhbF9pbnN0YW5jZTsNCj4gLQkJCWh3X2VuZ2luZV9p
bmZvW2krK10uZ3RfaWQgPSBndC0+aW5mby5pZDsNCj4gKwkJCWh3X2VuZ2luZV9pbmZvW2ldLmd0
X2lkID0gZ3QtPmluZm8uaWQ7DQo+ICsJCQlod19lbmdpbmVfaW5mb1tpXS5wYWQgPSAwOw0KPiAr
DQo+ICsJCQlpKys7DQo+ICAJCX0NCj4gIA0KPiAgCWlmIChjb3B5X3RvX3VzZXIocXVlcnlfcHRy
LCBod19lbmdpbmVfaW5mbywgc2l6ZSkpIHsNCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9k
cm0veGVfZHJtLmggYi9pbmNsdWRlL3VhcGkvZHJtL3hlX2RybS5oDQo+IGluZGV4IGY2MzQ2YTgz
NTFlNC4uYThkMzUxYzlmYTdjIDEwMDY0NA0KPiAtLS0gYS9pbmNsdWRlL3VhcGkvZHJtL3hlX2Ry
bS5oDQo+ICsrKyBiL2luY2x1ZGUvdWFwaS9kcm0veGVfZHJtLmgNCj4gQEAgLTE0MSw3ICsxNDEs
OCBAQCBzdHJ1Y3QgZHJtX3hlX2VuZ2luZV9jbGFzc19pbnN0YW5jZSB7DQo+ICANCj4gIAlfX3Ux
NiBlbmdpbmVfaW5zdGFuY2U7DQo+ICAJX191MTYgZ3RfaWQ7DQo+IC0JX191MTYgcnN2ZDsNCj4g
KwkvKiogQHBhZDogTUJaICovDQo+ICsJX191MTYgcGFkOw0KPiAgfTsNCj4gIA0KPiAgLyoqDQoN
Cg==
