Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F10FDCD6E73
	for <intel-xe@archiver.kernel.org>; Wed, 11 Oct 2023 14:16:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCF6E10E4F9;
	Wed, 11 Oct 2023 14:16:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E3F010E4F9
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Oct 2023 14:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697033771; x=1728569771;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=7had6ds9ST2ZUPIVmdRXhl5/uELPuoAN7h916mtNEBY=;
 b=gUx60z+nI7fgfCgN2V5KBaQu+ty7pIqvVQa8BvcIvY7yL3kYvPYTpiX8
 LjSqMWgSNjmWu0SfpTjbP8foQHOhc3dH1GGcCUcVHGrIDl0PJsq9JXWJ1
 U0tcdEQFSmfNV7bUOXeSZrl+HNqbfziUKMCKnoiv7eyhsVsnMVTs2IaLF
 UrwCltSssm0dv/TwAVtT7Qlr4aJoG+bbC96l0Sq2Br2fGuGNslrZSHn8z
 TNh/NlLt+QhC3AP5mP89TZamJ5o39W7W53N3tJzKeXv5UEqsz5gjJ6YSF
 OSYaf3rcxAsJ+OkwbKoMwqldaHRRk3b+Lz7yhSV1tP1Nnof01324/LRDs A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="388536880"
X-IronPort-AV: E=Sophos;i="6.03,216,1694761200"; d="scan'208";a="388536880"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 07:16:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="870160851"
X-IronPort-AV: E=Sophos;i="6.03,216,1694761200"; d="scan'208";a="870160851"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Oct 2023 07:16:10 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 11 Oct 2023 07:16:09 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 11 Oct 2023 07:16:09 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 11 Oct 2023 07:16:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Irx8zF0dk/M3NICbIHV++ATPWnEI6vAy9UfsGeG06D1v3xA+IS/IrOzKwAYePYXflt1ZOjGHDB3rzffvs0SuPzMnz6uyVIcHRB6kHXC74SomBP+rYCELKehpK8g18fFC3UocYI3J41ezOEEu8SIDXYExRLmo3oGfMWbLnVTVIrQD3VVTeiA0Dop8vg+wq56811Mf1wtK5zLtK+rJKelRYJwV8RsimMYN8b35Tqg5amjwDdqOHoj0KCzT5v11R3JF8bZuqHyGMMn7WOSymOTotR4F4UsxfA+DcRmsmgf5x4vmcm3brN1QtkaAhHdGzFdVOPrpgJVDlWdCtfTBUjBNDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7had6ds9ST2ZUPIVmdRXhl5/uELPuoAN7h916mtNEBY=;
 b=XXRWs7GrrErl33fsKJk2MKm2n6cNOHlh1JRp4T7A0iu/qUDxnfIDY05ul4oJ1Ifpf6VlEuOGTJ+YG7LMct1lHGrl4S324EHsGnvsJjTZIR6vBznEbr/jOr3G86Ukzg6wnv/FjqFsA4UTjrV3tRuUGv2DqZBuWRI5hZesDDfbLVqiA8wscAyrgqZNsv1a230ChT8Apt/r3DxgaD4WDJn8mDnX2HOOlCTuecjRhdmyd9fVUQgk+3cGddqjpI5F0z6LAFeuhSi43hrA6zGfMl55bBS4JEn9xZYvQsE0rJNdhWKpyYSsNVR/H6NG8m5ezbD5wS/9VGsIkD+0tK0gUgfM6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by LV3PR11MB8530.namprd11.prod.outlook.com (2603:10b6:408:1b8::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.44; Wed, 11 Oct
 2023 14:16:01 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::d6ef:5aaf:ef8f:5d47]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::d6ef:5aaf:ef8f:5d47%7]) with mapi id 15.20.6863.043; Wed, 11 Oct 2023
 14:16:01 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Dugast, Francois" <francois.dugast@intel.com>
Thread-Topic: [Intel-xe] [RFC v1 17/17] drm/xe/uapi: Remove unused
 inaccessible memory region
Thread-Index: AQHZ/EuQ3+QZY+YgLUy7h35jNn0I97BEolKA
Date: Wed, 11 Oct 2023 14:16:01 +0000
Message-ID: <8fdd1f9be1ed2e7951a1d85ed363e96cfa6b367e.camel@intel.com>
References: <20231011135926.7-1-francois.dugast@intel.com>
 <20231011135926.7-18-francois.dugast@intel.com>
In-Reply-To: <20231011135926.7-18-francois.dugast@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|LV3PR11MB8530:EE_
x-ms-office365-filtering-correlation-id: bbc1f04a-b2a9-4cb9-f727-08dbca649928
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nlIZJqNHa+O7ZMvUNwfRr47TZkuPJ7DjSroY5ygtQ1nnEC5x5ssg6cv3EMVEfHI19AF2uhfDGMR9rZNnqYCCq8k4sUrqyheQQyKBY3nHIVSX0NqRIR3x5N3GtuLSHepROTntnRd0dlrjVbPaW6wdSKDqsa0ANNiZhdWG3Inn6vfMS/iHol3PYiXnA8dTH25BbVVhrZ81fGcXH8ioe76JP4uDxtG/cnwVjXNFXd7voxcEwUeymHu4SFl1TON59AnIIifpRfvfaa8FPyzCobAvNrOQzsI1tIesmENEKPio+Vbgr5uyfWHNSesF/xRHZR/AjRskopp2N75qkaFKwfUh/OZcsEiUpT0r2XkVmQGw887ESuwI4OQgN3tz/BJiKJVdD2mr01Kjy7S81KslDPmTgcku0R774PF1t6FFdVoIwujoS6LmkZD7GGvWQJYSxWpK75eYVmjulppB9T/lhZXzBkTFKF+B4coFWwNv0IVlhUbyR1/qQlh5kKbkJfXNg1eNTm4QcwDz9h35SMGISqRUhBM/kl9V19lS+ZodD/LxMHlsQiuALU+HouyItBh6M247p4upQEDMY6tVrUQ0FAIfFTdO3BtAdUj8IVjy10waPmjxr/827dJsFt0IYYDj7Nmy
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(136003)(39860400002)(366004)(396003)(376002)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(6486002)(478600001)(71200400001)(66556008)(64756008)(66446008)(66476007)(76116006)(316002)(6636002)(91956017)(110136005)(66946007)(86362001)(4744005)(38070700005)(122000001)(82960400001)(2906002)(8676002)(8936002)(36756003)(4001150100001)(38100700002)(5660300002)(41300700001)(26005)(6512007)(2616005)(83380400001)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ckJRdVo4ZFVZTW1YVWRYazNhNG9Gc1NkR0ovMUZlQWpRNWZGMjRjYzR0SkJ5?=
 =?utf-8?B?eEMrcHU5TytKcDVCaWlLRGluNlJURDFrYzBFdDhiL2VWQld3a1VpY0dVWWNh?=
 =?utf-8?B?R0RQLzVXOUJkb2pRWnpZSUN0NjFJM3BPRGJGY0RGdmRwTUY2UmRWT2xPZE40?=
 =?utf-8?B?S1BIU0pLT0FuTHJrNy9Md2QzcC9yMGtyOVBabHVOdVNweTZjOTM0UC9WNHBr?=
 =?utf-8?B?eXZlYlFwSnpBL0R1aDRtaEFid1A0R1VJeUZ5K2pYb2QrVUE0VnFUUjlabXVl?=
 =?utf-8?B?YUYwaU02RnBNN2pKL1VjYkpnMThIODBKTWZkSDJ4NFYxc09nZU05M3orZFFi?=
 =?utf-8?B?TDIzWWYyZDRXVGh3S0pNNkJVNEtQMjQ3VFhGa0tOcDhpVkpKR2NncGJhenc1?=
 =?utf-8?B?M1NQN29vOUNYQ3I4RktHaXUyUTFLTExuUzA1TWljNXh6cUtIWW9WdStIQVh2?=
 =?utf-8?B?dVNBQ0VIZERRRDV2UlVqUHVxOUJML1Bka2U2MzNnWFo4Y25tUlNNNTY3QjRn?=
 =?utf-8?B?VTAvcXdEbnJ6VGxTZS9CWmliYXJSQzhoWmhFVDI3MFFwUUNObWhMaU1uVjRw?=
 =?utf-8?B?OXc5SWpMU204ZnBGalNUemE3TjJlUEdvQlZSVG9qRS9sc1hUYmRyNjVKSUM3?=
 =?utf-8?B?TUw3LysyWnJTZmRoVytmeWVmMXR5cXMzZ0xqYzh3SjRBcklSa2lwcnBobWZJ?=
 =?utf-8?B?QS9vTHNiY3hVUTlvaUdLTktSSnMyQUk5VHhOaDhWSkpCWnB5eGs4aVBpTnNZ?=
 =?utf-8?B?bUg2N05qTWlwZmU1OWlJQm5xK2lLbUpjcngzdURHNEdWRlA4TmwrUUhySWhz?=
 =?utf-8?B?cXlGSGM0NjZpVERlQzBPU1MzYXBZblpTdmV5cnd4SlJiK21wVjhSYTZFMWYx?=
 =?utf-8?B?Mkx1RTZkMi9oZTZxOXVRYXhSbWVkbk1waVFOR2xqWXJvZmx4ejJEQjd6QmZT?=
 =?utf-8?B?Zy92WGxyMUhCVFJDZmRpaXVaMFI0OE1LUTJxeXY3eUdkS3c5R3NDYnhGRjlt?=
 =?utf-8?B?TVpSZTFjQWJ3OXQ1YnBGTU5RWFVNWWxZN3R3emlTN2Izb2pQajRWakNqc01D?=
 =?utf-8?B?RWl3aWszY1dnMnpxTXk2NXV4UUg3ZFo3NC9NSTFVOTNiazVCZGtKUkZoZ3Yx?=
 =?utf-8?B?bDNxbUZwcW5JQ3Yxd3lNOUpnWUIvUXZselpNSXNqcTI5L01EYUhSYUlnRlMx?=
 =?utf-8?B?dnpkcGhYdzJGV1Z5K0JCOTVzWnlzZG5EMHgrNGMrWENzM0lCS1hmVUNrcGdQ?=
 =?utf-8?B?SERSZHVvUWJpL01lNy9KOENualljMTlISkdmOWZWN2FqcVJ3WUVBL04zVlRR?=
 =?utf-8?B?Zk0vWTRPeUhranBITy81Snl0MzV0ak02OHdjRURQaTBaSnlINGMwNlJJNEhi?=
 =?utf-8?B?K04rZ2NJZVJDZHlEUHEzSXRRSWxMNG9WMDVOQThSVU91WGx1YUlZR3k4anVo?=
 =?utf-8?B?VW01eDBIeTJGd01XTU4wY2VhSnhrRGRONWpRRHNCN3U5OVRESVdpT00zeHBl?=
 =?utf-8?B?a2FyQUVTMXQzdU16OGZRUVBEVk5PRUd4QTQ4OVNQMWZZT3BGZTVCcDJ0a1BH?=
 =?utf-8?B?SDg3QTgybk55a0RTNU5nZi9GQy9ZWlFLMDdmb0lCSzB5Z1J0dHc3L3NSOGlr?=
 =?utf-8?B?QmpUM1IzS0I5L3RPaHVUQmtBSm1YWmt6Y2VQb3VuU1duZWkvanZvTWp6bXhZ?=
 =?utf-8?B?SUwrd0ozZ2V4SmQ4b0R0bUlzRmg5TllrV291VnJxeE5wUEFHS042NlZ3WDNC?=
 =?utf-8?B?R2VkZ2VHcUJrV0srNm1PMno4dUNIRUkyVnpvRSsySm5uV3JHYlRMTy9zSUUw?=
 =?utf-8?B?Ylk4YUdOUnJ0cjFYZE4xMXVrZDM1bzV4YktHZ3RsTHRSZDRnMEhFRzR4Q1ly?=
 =?utf-8?B?VDVhWlNZQ2l4Y0xKT0xFOEJuUjloblgzNTFVV2NSSmR2Y2I0TFZERFR6U0h2?=
 =?utf-8?B?MitOQjFnRGRnc3lEb01KNTl4VndkOVB4eTUzYUkrNG5odUVpQXFhT2dYcHBW?=
 =?utf-8?B?clJGc2pEaFpTdmt1YjZWLzhndit4SzYzZnBjU3RHeTNwVFlWdDFMTGFmWkNS?=
 =?utf-8?B?dzlnc2RaS0N6L2tUWW10MFh1aitRSXZ6Z2FGb0FUZUdIR1E5SHozZ3lLSEZL?=
 =?utf-8?B?TVQycCtxNVo4U3dUL09GaEhiMkZnSFRZZjNzbUVtWDg4T1JzY0p0dUlwUEhY?=
 =?utf-8?B?WHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4C44263A8EDA2A43AA0EE2D073436D4F@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbc1f04a-b2a9-4cb9-f727-08dbca649928
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2023 14:16:01.8129 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NCSQcG18ZYIlH+4GONwvuLG95cIO+6l7toUx2Soj2dr4wple6DW9Ih5EDBAMg1qgGiCFOUVjB/2ME7bMaLYUyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8530
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC v1 17/17] drm/xe/uapi: Remove unused
 inaccessible memory region
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

T24gV2VkLCAyMDIzLTEwLTExIGF0IDEzOjU5ICswMDAwLCBGcmFuY29pcyBEdWdhc3Qgd3JvdGU6
DQo+IFRoaXMgaXMgbm90IHVzZWQgYW5kIGFsc28gdGhlIG5lZ2F0aXZlIG9mIHRoZSBvdGhlciAy
IHJlZ2lvbnM6DQo+IG5hdGl2ZV9tZW1fcmVnaW9ucyBhbmQgc2xvd19tZW1fcmVnaW9ucy4NCg0K
UmV2aWV3ZWQtYnk6IEpvc8OpIFJvYmVydG8gZGUgU291emEgPGpvc2Uuc291emFAaW50ZWwuY29t
Pg0KDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBGcmFuY29pcyBEdWdhc3QgPGZyYW5jb2lzLmR1Z2Fz
dEBpbnRlbC5jb20+DQo+IC0tLQ0KPiAgaW5jbHVkZS91YXBpL2RybS94ZV9kcm0uaCB8IDUgLS0t
LS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCA1IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBh
L2luY2x1ZGUvdWFwaS9kcm0veGVfZHJtLmggYi9pbmNsdWRlL3VhcGkvZHJtL3hlX2RybS5oDQo+
IGluZGV4IDMxYTQ2YjMyZjMxNS4uYTlkNjU0ZWFiZjA4IDEwMDY0NA0KPiAtLS0gYS9pbmNsdWRl
L3VhcGkvZHJtL3hlX2RybS5oDQo+ICsrKyBiL2luY2x1ZGUvdWFwaS9kcm0veGVfZHJtLmgNCj4g
QEAgLTM5MywxMSArMzkzLDYgQEAgc3RydWN0IGRybV94ZV9xdWVyeV9ndCB7DQo+ICAJICogdGhl
eSBsaXZlIG9uIGEgZGlmZmVyZW50IEdQVS9UaWxlLg0KPiAgCSAqLw0KPiAgCV9fdTY0IHNsb3df
bWVtX3JlZ2lvbnM7DQo+IC0JLyoqDQo+IC0JICogQGluYWNjZXNzaWJsZV9tZW1fcmVnaW9uczog
Qml0IG1hc2sgb2YgaW5zdGFuY2VzIGZyb20NCj4gLQkgKiBkcm1feGVfcXVlcnlfbWVtX3VzYWdl
IHRoYXQgaXMgbm90IGFjY2Vzc2libGUgYnkgdGhpcyBHVCBhdCBhbGwuDQo+IC0JICovDQo+IC0J
X191NjQgaW5hY2Nlc3NpYmxlX21lbV9yZWdpb25zOw0KPiAgCS8qKiBAcmVzZXJ2ZWQ6IFJlc2Vy
dmVkICovDQo+ICAJX191NjQgcmVzZXJ2ZWRbOF07DQo+ICB9Ow0KDQo=
