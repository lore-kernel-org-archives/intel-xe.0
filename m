Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F1D4C77B7A
	for <intel-xe@archiver.kernel.org>; Thu,  1 Jun 2023 15:24:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5321D10E08B;
	Thu,  1 Jun 2023 15:24:48 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36B7C10E08B
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Jun 2023 15:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685633086; x=1717169086;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=RDe1A0FMuaC3W4rtwXTFDz5O7I4O6sDMHGZbZWX2oio=;
 b=jt1SEnVPIEc248G7CECfDO9HGro3jPrqSr3rRbS4SlulBOuWuhbTvTAd
 Zy4xFAvem9Lrfg1BgLd9EqX6n0NPWJaiHpG8uK+WNCMUzZzyHNqjljoKc
 SpPl9sZEVkcHRlyJa5S3afENMAaOykwEPnA8FgNViB3XgAEMDWzUz1O89
 stecQuwCEEj37uRJ7XeTiHfLPdYraUGanTJUzFz4krQWgw61wXKR3aXOz
 1YnVoO0/pOfx9MCDDyBnCNF/Re1TGT2v1iyrzwmJhBwXs1Cq8JxGila4p
 xXbNFEJSCsNhKFPMWss332KHU1X8MxUyEI/E8QnlGYNSi58jvkPuFweBc Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="421399269"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="421399269"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2023 08:23:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="740395906"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="740395906"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga001.jf.intel.com with ESMTP; 01 Jun 2023 08:23:31 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 1 Jun 2023 08:23:30 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 1 Jun 2023 08:23:30 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 1 Jun 2023 08:23:30 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.105)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 1 Jun 2023 08:23:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RveKdgpdshV3cx08QW2aAVwTd1E4ER2RVFIXkDRufakR8I48X46bmjgbkIyoqBHv/gdEWp2M59bJYjBgGrktTYf/4vd0HJLRMVFLz2GvCIO3KkXXLvfMRZlDjAn8DkEDXXlcCDCI24VnwMn1rXCHDLgzzB56rSCrt7hw6K/chw9aIJkzvWNL9KAjkxYC21g3D0+1JKkTXZbbM0xNerodLobJz33R9kqpSxSukIU2GG6eNUDKfXtPT/LNY/JXFGtgUIbien61GC/srXgmAN1de7URlqSBCOm+uKANE0+hBgikEWas16gyFoN+q9IJ9cUeTv5/SbJOwahLEz+nqxcK8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RDe1A0FMuaC3W4rtwXTFDz5O7I4O6sDMHGZbZWX2oio=;
 b=KicA2D4zGJGdnlDo1pcwF3DZqUdok2MASOzm5drHE1QSxizvWp7p9GuybFpZi/2zt8tTdWoGE2ofpUw7S51rp7JyKLy3jB9IjqGC+lhvKroWILmcoLnHE50kRY1LSFENT6Wv8BoD3eNBK3aEbH6T9qO5T82FZ/T5c2VKkKnOEDx2U0Z8TChnVBGLN+p8Re2ULjJUp9IPdeJKgem6yV08+pV42NBDSWFuGdAHrY2cItqz2ZoLE0X+btt8b2dQNHcCg4Yr3IGRbsB4AdLwWuHNuvbXwa2y29AOxpRVSWNFpgUam7v/XU2HwpxfSOBZIPXUZGUGtzgCCOwD1cWMTlG7Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by PH0PR11MB4774.namprd11.prod.outlook.com (2603:10b6:510:40::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.23; Thu, 1 Jun
 2023 15:23:28 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::3fa1:b97c:a5bb:651]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::3fa1:b97c:a5bb:651%3]) with mapi id 15.20.6433.022; Thu, 1 Jun 2023
 15:23:27 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>
Thread-Topic: [Intel-xe] [PATCH v2] drm/xe: Replace PVC check by engine type
 check
Thread-Index: AQHZkmellGOr781ahk2o5AlczgxKMa92EOyAgAAERwA=
Date: Thu, 1 Jun 2023 15:23:27 +0000
Message-ID: <fba0676424c0dc94c3c8782274f26a62097d162c.camel@intel.com>
References: <20230529195607.74755-1-jose.souza@intel.com>
 <20230601150805.GF6953@mdroper-desk1.amr.corp.intel.com>
In-Reply-To: <20230601150805.GF6953@mdroper-desk1.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|PH0PR11MB4774:EE_
x-ms-office365-filtering-correlation-id: fcc05fcb-010a-4082-a878-08db62b4261c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: X6HfEh3iN6oLUeP9xzAJtF0RiQLAshYIf8MW11yTxXeVwuYQmfR+y9WZfJgp3sWyWuspn5fqdFBJ7qTKSysoDl2Z9hfZyVpsk+zvJB3Fa6VJmZUC0kKd0BoppECvuSWNZa2K2/ByXxQOV6mTokjJhH4a+45GSvUyD5LpZHzN2QJRmHdrm96UiDzIem9zsGmErHt/0xkMIz5XFwXbr2er0AVGNWUiBZyHLhDxA9dpLNEovtIEt0NBInFJahXYDYOpKYUcnIeXkXJHd0XOh3nIEiddBTrMhdxkPEb93JCtta/O6CFYQfLDsZy9ebkLFhm2dQTPPyiiAdbgNsH5oO4uwIy4vhPBfDUP1WU6EpoH2SDjJ4c+WZggqG4zmA9aeegaG0ef0ppXxydmVdLfOvTbAVav3O4MkwA8Uxp9FQ6qHYuA2F+h0MizZVs+SjiR80OT0oT1SNEuOTlms4XY8DKSzRRHdw/mQQEVaxj556UvJcpeDpUyiWePqJINLY5InSkiELMBTgFiUwJZ1RateN2gcLhbh+LHt/Scsa/YzRJ3H5m34mxU0EC9B71J8Y2CvmkGub6pGn+Fz5LuS2xILEa+iQlafBuIaWuy7hPES1UXAR4xlqCpOae0kbx7r0yME83o
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(396003)(136003)(366004)(39860400002)(346002)(451199021)(6486002)(71200400001)(478600001)(36756003)(6506007)(6512007)(26005)(186003)(2616005)(83380400001)(38100700002)(86362001)(38070700005)(122000001)(82960400001)(316002)(6636002)(4326008)(41300700001)(64756008)(66556008)(66476007)(66446008)(66946007)(76116006)(91956017)(2906002)(8676002)(5660300002)(8936002)(6862004)(37006003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OTdOa0hnUzAxMm1ZbElXR2tkUTJxWFl5bWE0YnpTcmZzelhiQ0hqeXRBQmtn?=
 =?utf-8?B?L3NUMVVmRjh3RmpCeWNkOHFEL0RKUFZQbVRnN1Y1QWw2eStIcGlKWkppSGJC?=
 =?utf-8?B?L3NQVmNUVjd3M2dyK3VKeWsyQUQrZHhvcmc4aElLN1Y1WHIwTld1WVpOOWZW?=
 =?utf-8?B?bmFveXVrU05KT21wWmxLTzFFTEJJdlR1MTBlakdtblRsTlM4LzUvN0UzdlY5?=
 =?utf-8?B?TzBWdTU4akl1MmkzQlFtYVJzVGNaWGJ1THI3endKNk0valB6M1ltNGVEMm1C?=
 =?utf-8?B?TTRvMkQ3akNmRUNXYXNjeXo1MVp2bGtzVE9Xd1FjVllSci9NV1lSNU9NZG1x?=
 =?utf-8?B?VE5kaDh1aE4wWXdNdVdlWG8xUktVRERKOFlybXprZVVrOEZtNGMxYmdlWk0x?=
 =?utf-8?B?czg5RGdUNTJlZ0s3d09mK1p1Y1dETzU0SEs5dFBuanAwd1pHV0o0VVJCOWl6?=
 =?utf-8?B?SkxhaUwrV0dZMDZTYjIxSVp3RVQyN0FXWGkzdUtLdGRIaDlObnBNZktmNHJ2?=
 =?utf-8?B?QU1rZEEydTJ6bHJYMGFDS1ZnVlZWN0xjSXZra0M3L3pHZHgxUkRoUHpPK25L?=
 =?utf-8?B?SHVDTmdqZlFQTk0zbzlscVpUdEJPVUZmVEVpeUQwSlpadmxLUnY1OG9wZHh5?=
 =?utf-8?B?aFhpTEE4cG9oL0gzUDdBV2VVS3Z2YXU4RkgvTU9TRG9zVkoyR1ZxS3dKUjN5?=
 =?utf-8?B?a3FsUitDREtnNFFDbmF3UVJiU2ZaUzI3aWlFN2NseWVvR2tYME1aTnZsMWND?=
 =?utf-8?B?WGtza3RCTitoWmgrNWxEaE1FZE9YZHJmNVI5bncyQU1MY2JBektyeUMvdW44?=
 =?utf-8?B?TEpxeVVzckphZnFYU0dncGV6SXplNUFsSkJXaUF0UVBvaHExeUNHc1FjRXBz?=
 =?utf-8?B?VTdrNElWWlFQLysyMXMra0R2U0lYTWg5clFQWlhqMVB3eU5XdU04MmoxbWxR?=
 =?utf-8?B?TVBzaUQvZlhhS1VFWW9aWVJsOFFtbUlqWDhZb2xrOTFLbVBVeC9qeUM3WGIx?=
 =?utf-8?B?Zm9uaUV1RGJYc1llWjdGeGFHRmhxaTJCbFpMMU1RbnRIbXNjSFVnYmNUQ0Q0?=
 =?utf-8?B?Y0R6S3l6aXNBMkJVdHZGM2N5U1ZWQmVWNTNpcGZCTmNoNGdxYjVwWDRZaHJO?=
 =?utf-8?B?MUJXcVE5eGpUNVFjSHNpVjNocC9PdUhkT3ZqRGI5YzZFbzdKMEp5c0ZYWHpy?=
 =?utf-8?B?V3ZtQW5TdHV6V3F1c1U5czhtOW0yc0RMUWU3TDd3ZjF0UnNYdlFxY1FKMjh2?=
 =?utf-8?B?L0pYSWt4ajE3UGpvaUZTdFBIVHhTTUZKaHpueDdObFEvbXgwNGtNcXFZMW5K?=
 =?utf-8?B?d1M4Vjk1MWlEY3FkQ0xiWThiT2hjMTNuakFIdkVoYXhzUXRqSTgvYjJwTTB6?=
 =?utf-8?B?STJaei9kWDBEcHdkZ1BTSnYrbUtHL2xBWWxvV2U1RUhlV1RhMlBWWWp2VkxY?=
 =?utf-8?B?aWNpbzluNTUvS2VxOE5tZ1lvQktpd3U2d2NMc1ozT3RXQ2F0b0RaeWJOaVZZ?=
 =?utf-8?B?WmZJcUlrK2pKTy8xcWZEVEYzRnN2WWtyS3d5dlhGQ1Q1QkVZMmJOS1kvV2hW?=
 =?utf-8?B?ajR5cmNybEtjTVJXbDE3ZFVNc2FEbzJPUUJEMG80ZzZIQkR0alZqOVdsYldh?=
 =?utf-8?B?bjNvdWoyTHNMU1FteE1yZlJmTWVxK25raHQzUWFMbi9SYXA2ZEdYM09hN3Vq?=
 =?utf-8?B?eEZVcUt1UHFZUXFwTWFvMGhjNWd5dVdENHEyUzVUeGtnT3VJeWZSL0dvRDhZ?=
 =?utf-8?B?WGNOWHBXdFA0dGFsWVVrYVlGQkhvTEFYNnNYa1RNaUdzQk5yOTA3SzBRTXVZ?=
 =?utf-8?B?Wkh3cVkvK0k0NS9oaTMxckpDWFZzNURFb2F5SlFXRy9YYWlpbytPYm1ES2RJ?=
 =?utf-8?B?VitYMW4ycjVXQnZmN3lXRTN0R3BtcWF3Z3ZMR1pDK2g2MmMwd0JENzA5UEJm?=
 =?utf-8?B?eURQZFN3T0J6LytNRExSZ0M2T2IrTnlHekVSR3E4RVQzUlc4eHhuYi96QjA0?=
 =?utf-8?B?eFVUV3VXUkU5aTlGemI5dWplbmNiTzRFSlkzVmxJWk1TaWxFc2xTNVU1WlUz?=
 =?utf-8?B?V0VwaXdqOUExZW16R29IN2NyYXFlL0g0S2Zmdk0yL2FEVG96TndPeWNWOC91?=
 =?utf-8?Q?f2lPh0ygrZBNQ5Ukozg4sOBHC?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C6C419D359F2FE4FBB2FE409365E9686@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcc05fcb-010a-4082-a878-08db62b4261c
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jun 2023 15:23:27.5709 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UYcXJCt9cTwqnP2xcYSyF1SYf+0B7fZ8rN27w9tgv/J6gMXMV8moGknggCR5G834b9r68z/auJDFKCW4jaJ5MA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4774
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2] drm/xe: Replace PVC check by engine type
 check
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

T24gVGh1LCAyMDIzLTA2LTAxIGF0IDA4OjA4IC0wNzAwLCBNYXR0IFJvcGVyIHdyb3RlOg0KPiBP
biBNb24sIE1heSAyOSwgMjAyMyBhdCAxMjo1NjowN1BNIC0wNzAwLCBKb3PDqSBSb2JlcnRvIGRl
IFNvdXphIHdyb3RlOg0KPiA+IF9fZW1pdF9qb2JfZ2VuMTJfcmVuZGVyX2NvbXB1dGUoKSBtYXNr
cyBzb21lIFBJUEVfQ09OVFJPTCBiaXRzIHRoYXQNCj4gPiBkbyBub3QgZXhpc3QgaW4gcGxhdGZv
cm1zIHdpdGhvdXQgcmVuZGVyIGVuZ2luZS4NCj4gPiBTbyBoZXJlIHJlcGxhY2luZyB0aGUgUFZD
IGNoZWNrIGJ5IHNvbWV0aGluZyBtb3JlIGdlbmVyaWMgdGhhdCB3aWxsDQo+ID4gc3VwcG9ydCBh
bnkgZnV0dXJlIHBsYXRmb3JtcyB3aXRob3V0IHJlbmRlciBlbmdpbmUuDQo+ID4gDQo+ID4gUmV2
aWV3ZWQtYnk6IFRob21hcyBIZWxsc3Ryw7ZtIDx0aG9tYXMuaGVsbHN0cm9tQGxpbnV4LmludGVs
LmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBKb3PDqSBSb2JlcnRvIGRlIFNvdXphIDxqb3NlLnNv
dXphQGludGVsLmNvbT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3Jpbmdf
b3BzLmMgfCA2ICsrKy0tLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAz
IGRlbGV0aW9ucygtKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfcmluZ19vcHMuYyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9yaW5nX29wcy5jDQo+ID4gaW5k
ZXggZDJmYTBiNGM4YmNjMC4uYjc5ZGFmYmU3YzRmOCAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0veGUveGVfcmluZ19vcHMuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94
ZV9yaW5nX29wcy5jDQo+ID4gQEAgLTI0OSwxMSArMjQ5LDExIEBAIHN0YXRpYyB2b2lkIF9fZW1p
dF9qb2JfZ2VuMTJfcmVuZGVyX2NvbXB1dGUoc3RydWN0IHhlX3NjaGVkX2pvYiAqam9iLA0KPiA+
ICAJdTMyIHBwZ3R0X2ZsYWcgPSBnZXRfcHBndHRfZmxhZyhqb2IpOw0KPiA+ICAJc3RydWN0IHhl
X2d0ICpndCA9IGpvYi0+ZW5naW5lLT5ndDsNCj4gPiAgCXN0cnVjdCB4ZV9kZXZpY2UgKnhlID0g
Z3RfdG9feGUoZ3QpOw0KPiA+IC0JYm9vbCBwdmMgPSB4ZS0+aW5mby5wbGF0Zm9ybSA9PSBYRV9Q
VkM7DQo+ID4gKwlib29sIGxhY2tzX3JlbmRlciA9ICEoeGUtPmd0WzBdLmluZm8uZW5naW5lX21h
c2sgJiBYRV9IV19FTkdJTkVfUkNTX01BU0spOw0KPiANCj4gSXMgdGhlcmUgYSBzcGVjaWZpYyBu
ZWVkIHRvIGNoZWNrIHhlLT5ndFswXSByYXRoZXIgdGhhbiB0aGUgZ3QgcG9pbnRlcg0KPiB3ZSBh
bHJlYWR5IGhhdmU/ICBUaGlzIGZ1bmN0aW9uIHdpbGwgb25seSBnZXQgY2FsbGVkIG9uIGEgcHJp
bWFyeSBHVA0KPiAoc2luY2UgbWVkaWEgR1RzIGRvbid0IGhhdmUgcmVuZGVyL2NvbXB1dGUgZW5n
aW5lcyksIHNvIGl0IHNlZW1zIGxpa2UNCj4gY2hlY2tpbmcgdGhlIGN1cnJlbnQgdGlsZSdzIHBy
aW1hcnkgd291bGQgaGF2ZSBiZWVuIGZpbmU/DQoNCkh1dW0hIFllYWggZm9yIGFsbCBjdXJyZW50
IHBsYXRmb3JtcyBpdCB3b3VsZCBiZSBmaW5lIGNoZWNraW5nIGFnYWluc3QgZ3Qgb3IgeGUtPmd0
WzBdLg0KQnV0IEkgaGF2ZSBhbHJlYWR5IHB1c2hlZCBpdC4uLg0KDQo+IA0KPiANCj4gTWF0dA0K
PiANCj4gPiAgCXUzMiBtYXNrX2ZsYWdzID0gMDsNCj4gPiAgDQo+ID4gIAlkd1tpKytdID0gcHJl
cGFyc2VyX2Rpc2FibGUodHJ1ZSk7DQo+ID4gLQlpZiAocHZjKQ0KPiA+ICsJaWYgKGxhY2tzX3Jl
bmRlcikNCj4gPiAgCQltYXNrX2ZsYWdzID0gUElQRV9DT05UUk9MXzNEX0FSQ0hfRkxBR1M7DQo+
ID4gIAllbHNlIGlmIChqb2ItPmVuZ2luZS0+Y2xhc3MgPT0gWEVfRU5HSU5FX0NMQVNTX0NPTVBV
VEUpDQo+ID4gIAkJbWFza19mbGFncyA9IFBJUEVfQ09OVFJPTF8zRF9FTkdJTkVfRkxBR1M7DQo+
ID4gQEAgLTI3NSw3ICsyNzUsNyBAQCBzdGF0aWMgdm9pZCBfX2VtaXRfam9iX2dlbjEyX3JlbmRl
cl9jb21wdXRlKHN0cnVjdCB4ZV9zY2hlZF9qb2IgKmpvYiwNCj4gPiAgCQkJCQkJam9iLT51c2Vy
X2ZlbmNlLnZhbHVlLA0KPiA+ICAJCQkJCQlkdywgaSk7DQo+ID4gIA0KPiA+IC0JaSA9IGVtaXRf
cGlwZV9pbW1fZ2d0dCh4ZV9scmNfc2Vxbm9fZ2d0dF9hZGRyKGxyYyksIHNlcW5vLCBwdmMsIGR3
LCBpKTsNCj4gPiArCWkgPSBlbWl0X3BpcGVfaW1tX2dndHQoeGVfbHJjX3NlcW5vX2dndHRfYWRk
cihscmMpLCBzZXFubywgbGFja3NfcmVuZGVyLCBkdywgaSk7DQo+ID4gIA0KPiA+ICAJaSA9IGVt
aXRfdXNlcl9pbnRlcnJ1cHQoZHcsIGkpOw0KPiA+ICANCj4gPiAtLSANCj4gPiAyLjQwLjENCj4g
PiANCj4gDQoNCg==
