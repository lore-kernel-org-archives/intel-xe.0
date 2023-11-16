Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 195F9C47071
	for <intel-xe@archiver.kernel.org>; Thu, 16 Nov 2023 20:54:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8D5C10E6F0;
	Thu, 16 Nov 2023 20:54:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D476B10E6F0
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Nov 2023 20:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700168074; x=1731704074;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=9pb173bkG8g1CamFJ6DX7e2HJSqcwm0T7pzSnG0nIhY=;
 b=AQtYH5AxcqQF/C8JXAtLrN5h/CODnkznACJ23yNerRRo1iOVhRNDxRJg
 Cnr0vmwUMOx7Rb5FodIgxmxXzaQUZJfsYpQltO4RswNUfkUj3F0R8vA7y
 h4Y/qi22YiJZxG6tZyAOJqnsGlG/HuvLy0JeVkRVIdLtEErQ2Li4O7aNG
 SnGi9/tJgqypZ8uryBVW8WYMTdBYjkXNSsMIJx+eBahRCM60zNOo/ANG1
 CsvlIP73ymfraQ6u3PgOP3KZfTurY3iICQwa/8tPDqcQz4LrhAoFOTKQ5
 /cDeS/FROtTyNMJxeJyK9sYWDf0b5RMn13mNOnX8e0kHzo7dFlrFh6K92 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="388338444"
X-IronPort-AV: E=Sophos;i="6.04,205,1695711600"; d="scan'208";a="388338444"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2023 12:54:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,205,1695711600"; d="scan'208";a="13250163"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Nov 2023 12:54:34 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 16 Nov 2023 12:54:33 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 16 Nov 2023 12:54:33 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 16 Nov 2023 12:54:33 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 16 Nov 2023 12:54:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dNcHWLBq93jhOCv34VqULIUQiwZB9O2tLZgQ+g31i5XWTjA3n2OCD1znw4lFzL6km14NhEwBYs7x9kgUIap+YUuZ3u7XKcm7v1YAp7CIdeydCYAa/ywkKd1gSN5hxFShr7lf8FIqw0oY7EwqgmnutZOAw4Ie8ZmPr0em996NM4WLzmFoYfWDq6oUeqSjmA0p7mWNK4saQkguhHgpdWeThJjwRvxTXKYtcDRLmSFe3BehgD/1EWt8SnXy8wHDyA/JbZanG4FRFiaJwVk6SxOznRYjldaU5QQCFX9O3Gj1SDfwzNshFSIfeuAfyRqIdx8nQ0n8OV5gCp9GBMtuv70wAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9pb173bkG8g1CamFJ6DX7e2HJSqcwm0T7pzSnG0nIhY=;
 b=fi68ne38sYNxIOuXrl3zCW5MLbBgxyxthKX3W73SVFv7w0vIvIKm7z5ty04ytJvJN2sGN0X4oIPIxlCnT2HCM1fNsKZzHwXv1ThJc4P+1sqMV3n6wjJVcIcIC/CSsTLvwJc+QW7LDfL9sNZ/BzBlKIOLX6EvrWmURWUQel7YTKXjuhT497YB/UuLuCCqJHwlBwSVxkPRJqe2KhZ7YDKiAtFcu4Ly1C/TynkhHVd2EHgox2UdLXSfwjFJTC5xbRl0DRrCVIGwThCf3au8+pYuwQ3JB4S+2ba2qslBezIaowDyrTg15iOMIAA8liNpHMU/jF47NtsnkxF1klwUkCwMHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by CH0PR11MB5705.namprd11.prod.outlook.com (2603:10b6:610:ec::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.21; Thu, 16 Nov
 2023 20:54:31 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::8076:c5fe:e0fc:cfaf]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::8076:c5fe:e0fc:cfaf%7]) with mapi id 15.20.7002.021; Thu, 16 Nov 2023
 20:54:31 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Thread-Topic: [Intel-xe] [PATCH v1 8/8] drm/xe/uapi: Add Tile ID information
 to the GT info query
Thread-Index: AQHaGJtVUlpE4vaXb0m8R/Ou4Bm+LbB9aikAgAACU4CAAAB6AA==
Date: Thu, 16 Nov 2023 20:54:31 +0000
Message-ID: <838c405290912bb923c44b061d0eca4ca347f07a.camel@intel.com>
References: <20231116144316.7-1-francois.dugast@intel.com>
 <20231116144316.7-9-francois.dugast@intel.com>
 <e15046e7999170bb0012b519ef994487d1823f5d.camel@intel.com>
 <ZVaBHT55caDmX2Mp@intel.com>
In-Reply-To: <ZVaBHT55caDmX2Mp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|CH0PR11MB5705:EE_
x-ms-office365-filtering-correlation-id: c4d3cc7f-1733-4529-4126-08dbe6e63b15
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bMWleRpE69JCl6gMSYpRh06pZ+c1TNJtqu25lrAW08k9b2suoyCtMVLRq4EYIwrar1NVo72H3rYK1Ti/eWbpQc01oVPRFxYtbrzN2uYlAh/PJiI1KTJDjxXQHSMa6uZVzbi5ANTrDpBsSrscOU9wB1PfS+HGJ6RS4+wAEU7M4xyeATjdE2WYhHj5eeHWQdM/CgB21Uh+iwoPafe9ExWyHBcmr0tQUx8GQus6uY+P55owEnoLr0B2DQazPZ0XVbE7hqN6rtwvOSMmuojUfLmsIkw6sIXlHp+IKN0IVpcXFkOHSRShFXr59BoQ12QUMoGw4buNod2miiASHaeUjTS/IDniKOjRgOACqlyc1pAkASEsD6WMUu/VhJNV3r5K3BkSBPz3CIcWWUmAZAXj6zrXTNV9rMXhxAat1k9oIYLioDt60jkgCoFCgo4WRwa5qZVwTtQGVz+VMHKYLEtLuQsU6L9o27JnKJ76/X/lbys95hoKU4++bZYe70FdF5jr5LnUiAO/JHKIb4I1nu/9PuWbMEtDzp8pD1C5yZPcT2Xu4qAvEhDKaV4dGsLWBYYUtp1bsiCZ9m/VH6pYwXIcaG5ag97PUpGeKcN123RQAZXrbZZlIbvrZCEao0AU5GGBUBWr
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(366004)(376002)(136003)(346002)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(38100700002)(83380400001)(122000001)(2616005)(107886003)(26005)(6512007)(6506007)(71200400001)(6486002)(64756008)(91956017)(86362001)(4326008)(66946007)(66476007)(478600001)(76116006)(66556008)(66446008)(5660300002)(37006003)(316002)(6862004)(8936002)(82960400001)(6636002)(8676002)(54906003)(2906002)(4001150100001)(41300700001)(38070700009)(36756003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cVE1MTlOMWtzclg0MHVrMm82aExsdGdMbVh3NVRzRkdsL2hWZTd3SXVmczJk?=
 =?utf-8?B?MFpSTVo2VkJuNng0WURIOFRWclJRZzE4YkJUWVVuaTZ0aGhsR0hlRVZHeE1l?=
 =?utf-8?B?ZTZxVFVWNlN1T0V6VkRQYXRjTmRoZVpQUHc0R2k2UUNjalZVRDhMSVIrODJl?=
 =?utf-8?B?VHlBc3hMOWVqZDQzUWJzUFFKdnowR0xoOEVTYVJDaStQNlE3aXdCeEVmVTl0?=
 =?utf-8?B?eldSeHNFWXBhbzIwTktlaGhMSzFrMnIvWWtRTm96U3NYOUJEaXJpMkl4Wktx?=
 =?utf-8?B?T3dZK0p0Q0RVcUlxWXhReWVhKzJodTNoTGc1VEF0dllvQXJmbHREQ3RJTUhQ?=
 =?utf-8?B?UlF2QXFKRlAxUjR3RERxd0ZUTUNpampZQm9KMG84aEc1dmFuNHhLcy9vaGtS?=
 =?utf-8?B?V3dFS2s1bG1UK1hLdTVRRFhFRUpqSmdFUS9pd01zWklZSVdJZ3RJNDBPMlls?=
 =?utf-8?B?VW01RWNrVnJmb2l1VWhKRHZwVFcrRHc5c1hONEZUNTJpOUc5RnFkb2pUTkxj?=
 =?utf-8?B?dlBQcnZxK1Z0MXJsa05qWGlRR2pGcDNuc2tYZDArZmpIQUlaQnFET3lDV3hl?=
 =?utf-8?B?WkFveWNJZnloMjJweDlUSitTL3RLM1JzNHlCM3d4T2dlL2dsUEQ1T2RTbjJz?=
 =?utf-8?B?eFpvVWpacUZXMHEvb0NSZ01xMm9ySmtZWlRYaGtYK3ZHdGM3dGVyWVpZZEdt?=
 =?utf-8?B?bmpwY0tWV1YzZldpbVRnOFR4ZWpFaEQ4ZVlJSUtFV0xKRmxtb1pNZmVEVmFh?=
 =?utf-8?B?Q0NNR05vdFQxOHV5eElKRFh5NFFXd0R0M2pTWDdIUjR6eHFLelRFenl5YTQr?=
 =?utf-8?B?aS9SemJ1YTBRcWdNcHdJSmZ2aTRZUFRxdVhPV0RqS3hDNkYyK0FadWFNcHht?=
 =?utf-8?B?cTY2bnBKZE5MTWh1NEFhSThaMU9CVDMyZTdoeW0vWkJwcVcyNityd3hoTnpI?=
 =?utf-8?B?M3E2Ym1WUUFBcjAxRlJlUzVkZ0VlV0hFZzgzZ1lXa3hLNlUwUGhkbnhZcVFo?=
 =?utf-8?B?WGk0YmVkV0prY1V3emxCVHFFZ0d0OS9xRDRSS25SMTRPbnlrMU45SXdMaGw1?=
 =?utf-8?B?Z0VrVGkzL285TTBjU1dkTTF3eEVQK1BFUjNXWmIwZ0Z5Z3JmT0d0RmNxb3l6?=
 =?utf-8?B?L0pUY3BvOXBJOVJuQ3JIWkZja3c1TlNXVHJOUkpZTXRUTytEckhMMWI3ak1I?=
 =?utf-8?B?ci9yMmpuV3U0RkU3S1I3ZXlid0NBdEtZS0VlN2VWN1VLeXVlOWx4WE00MzQ2?=
 =?utf-8?B?RVZmN2lad3lCYmUrY2tqV0hLeUJLa0NUVll5TG50NWNIT01DcU5oNmJIVkFO?=
 =?utf-8?B?c01aSXJTcjdNdGZ1bVpINEgwRFk0UFR3dFFHeVVWTit4cHJHUjkwK2FheElZ?=
 =?utf-8?B?QzFHTkU5YlpuOTVWSXVRN3RTZ1ZONHJvWGdwL2lmdUZnRGpTTjFtT0JpckdM?=
 =?utf-8?B?eVRGNzlUMjRPdGZ2S0xXbnNoUHg0ZEl6NWhlRzVCSGJTSUNKMFRuSVFhQXBu?=
 =?utf-8?B?N2RzZm44NUNPRkFoM3NBL2JlS0lKQm1lUmF1YTFQSUJBQVNFclpzaWtJbWJI?=
 =?utf-8?B?VHFrK3hPNHIrM0Q3VFNVNjJkVStQRFBJZDJjRGpRcWY1ek9WZWd3cDRndmNB?=
 =?utf-8?B?RHN3c1NvMnZITlFPU0NCdWpQZmZjRkZCbFcvaGRyUmQ4V3lnVGpCZmxwVGNH?=
 =?utf-8?B?enkyUFJFVDRYbEVZMEk5TU8rbmpkNHNxNDBmazRNRGVNUnFmQ0ZPWjdXcFhX?=
 =?utf-8?B?TmVKTUZjOXNmMWRBV2dHYzJhRU45ZU43VGExdm5KdmZlQUp1d0dMK2JZU1dn?=
 =?utf-8?B?L2gvcGdyRnFhcmdZekU5ODBhcDE3Tk9MWHBjWllwYWlESXhxMFpjMmJsbHUx?=
 =?utf-8?B?aElIUVlGU0RBeVhMZVk4ZGg1MUlxRm5paFRsSUE1bm9WdnhBZHpMWGF0Z2Iy?=
 =?utf-8?B?bzNqbjU4S01IWUFaTWk4eGE4YnRNNjRkOVRiamRESGh3d0Y5WFduajNOWjV4?=
 =?utf-8?B?QWxuS0JpOVYxUnpVbTVkZHFtWXZFMFNCZkl6aDZYdzNudHdqREVmUVBTdlpo?=
 =?utf-8?B?Y1BqK0Q3UWdlckx1MkpRR3pUTnA4R0hIeC8vNWxGUS9EeTdyTzlaMnc1K3BX?=
 =?utf-8?B?RjZicUhyVVQ2NEswRDFQYUEvT09rSytOalBCcVhvS3dFSkd0b3NCRlVaOExJ?=
 =?utf-8?B?REE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <94BA317B005B7E41B6DAE2B08498194B@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4d3cc7f-1733-4529-4126-08dbe6e63b15
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2023 20:54:31.0696 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mgDlGeAhx3FfcGCkhd1JM03Oc4/IRneTdVah3iHw0Jv8IAByUWClzz/+XLlosLykkZeoDeHEurc8kKpNDmIt4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5705
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v1 8/8] drm/xe/uapi: Add Tile ID information
 to the GT info query
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
Cc: "Dugast, Francois" <francois.dugast@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDIzLTExLTE2IGF0IDE1OjUyIC0wNTAwLCBSb2RyaWdvIFZpdmkgd3JvdGU6DQo+
IE9uIFRodSwgTm92IDE2LCAyMDIzIGF0IDA4OjQ0OjI5UE0gKzAwMDAsIFNvdXphLCBKb3NlIHdy
b3RlOg0KPiA+IE9uIFRodSwgMjAyMy0xMS0xNiBhdCAxNDo0MyArMDAwMCwgRnJhbmNvaXMgRHVn
YXN0IHdyb3RlOg0KPiA+ID4gRnJvbTogUm9kcmlnbyBWaXZpIDxyb2RyaWdvLnZpdmlAaW50ZWwu
Y29tPg0KPiA+ID4gDQo+ID4gPiBBcyBhbiBpbmZvcm1hdGlvbiBvbmx5LiBTbyBVc2Vyc3BhY2Ug
Y2FuIHVzZSB0aGlzIGluZm9ybWF0aW9uDQo+ID4gPiBhbmQgYmUgYWJsZSB0byBjb3JyZWxhdGUg
ZGlmZmVyZW50IEdUcy4NCj4gPiA+IA0KPiA+ID4gTWFrZSBBUEkgc3ltbWV0cmljIGJldHdlZW4g
RW5naW5lIGFuZCBHVCBpbmZvLg0KPiA+ID4gDQo+ID4gPiBUaGVyZSdzIG5vIG5lZWQgcmlnaHQg
bm93IHRvIGluY2x1ZGUgYSB0aWxlX3F1ZXJ5IGVudHJ5DQo+ID4gPiBzaW5jZSB0aGVyZSdzIG5v
IG90aGVyIGluZm9ybWF0aW9uIHRoYXQgd2UgbmVlZCBmcm9tIHRpbGUNCj4gPiA+IHRoYXQgaXMg
bm90IGFscmVhZHkgZXhwb3NlZCB0aHJvdWdoIGRpZmZlcmVudCBxdWVyaWVzLg0KPiA+ID4gDQo+
ID4gPiBIb3dldmVyLCB0aGlzIGNvdWxkIGJlIGFkZGVkIGxhdGVyIGlmIHdlIGhhdmUgZGlmZmVy
ZW50IFRpbGUNCj4gPiA+IGluZm9ybWF0aW9uIHRoYXQgY291bGQgbWF0dGVyIHRvIHVzZXJzcGFj
ZS4gQnV0IGxldCdzIGtlZXANCj4gPiA+IHRoZSBBUEkgcmVhZHkgZm9yIGEgZGlyZWN0IHJlZmVy
ZW5jZSB0byBUaWxlIElEIGJhc2VkIG9uDQo+ID4gPiB0aGUgR1QgZW50cnkuDQo+ID4gPiANCj4g
PiA+IFNpZ25lZC1vZmYtYnk6IFJvZHJpZ28gVml2aSA8cm9kcmlnby52aXZpQGludGVsLmNvbT4N
Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IEZyYW5jb2lzIER1Z2FzdCA8ZnJhbmNvaXMuZHVnYXN0QGlu
dGVsLmNvbT4NCj4gPiA+IC0tLQ0KPiA+ID4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9xdWVyeS5j
IHwgMSArDQo+ID4gPiAgaW5jbHVkZS91YXBpL2RybS94ZV9kcm0uaCAgICAgfCAyICsrDQo+ID4g
PiAgMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykNCj4gPiA+IA0KPiA+ID4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9xdWVyeS5jIGIvZHJpdmVycy9ncHUvZHJtL3hl
L3hlX3F1ZXJ5LmMNCj4gPiA+IGluZGV4IDg3MzQ1ZWQ5OTE1MS4uODM4ZjAzNzk1ODQxIDEwMDY0
NA0KPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3F1ZXJ5LmMNCj4gPiA+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9xdWVyeS5jDQo+ID4gPiBAQCAtMzgyLDYgKzM4Miw3IEBA
IHN0YXRpYyBpbnQgcXVlcnlfZ3RfbGlzdChzdHJ1Y3QgeGVfZGV2aWNlICp4ZSwgc3RydWN0IGRy
bV94ZV9kZXZpY2VfcXVlcnkgKnF1ZXJ5DQo+ID4gPiAgCQkJZ3RfbGlzdC0+Z3RfbGlzdFtpZF0u
dHlwZSA9IERSTV9YRV9RVUVSWV9HVF9UWVBFX01FRElBOw0KPiA+ID4gIAkJZWxzZQ0KPiA+ID4g
IAkJCWd0X2xpc3QtPmd0X2xpc3RbaWRdLnR5cGUgPSBEUk1fWEVfUVVFUllfR1RfVFlQRV9NQUlO
Ow0KPiA+ID4gKwkJZ3RfbGlzdC0+Z3RfbGlzdFtpZF0udGlsZV9pZCA9IGd0X3RvX3RpbGUoZ3Qp
LT5pZDsNCj4gPiA+ICAJCWd0X2xpc3QtPmd0X2xpc3RbaWRdLmd0X2lkID0gZ3QtPmluZm8uaWQ7
DQo+ID4gPiAgCQlndF9saXN0LT5ndF9saXN0W2lkXS5jbG9ja19mcmVxID0gZ3QtPmluZm8uY2xv
Y2tfZnJlcTsNCj4gPiA+ICAJCWlmICghSVNfREdGWCh4ZSkpDQo+ID4gPiBkaWZmIC0tZ2l0IGEv
aW5jbHVkZS91YXBpL2RybS94ZV9kcm0uaCBiL2luY2x1ZGUvdWFwaS9kcm0veGVfZHJtLmgNCj4g
PiA+IGluZGV4IGI2ZDNkNGQ1MmRhOS4uODYxMGFjNDYxNjE5IDEwMDY0NA0KPiA+ID4gLS0tIGEv
aW5jbHVkZS91YXBpL2RybS94ZV9kcm0uaA0KPiA+ID4gKysrIGIvaW5jbHVkZS91YXBpL2RybS94
ZV9kcm0uaA0KPiA+ID4gQEAgLTM4MCw2ICszODAsOCBAQCBzdHJ1Y3QgZHJtX3hlX2d0IHsNCj4g
PiA+ICAjZGVmaW5lIERSTV9YRV9RVUVSWV9HVF9UWVBFX01FRElBCQkxDQo+ID4gPiAgCS8qKiBA
dHlwZTogR1QgdHlwZTogTWFpbiBvciBNZWRpYSAqLw0KPiA+ID4gIAlfX3UxNiB0eXBlOw0KPiA+
ID4gKwkvKiogQHRpbGVfaWQ6IFRpbGUgSUQgd2hlcmUgdGhpcyBHVCBsaXZlcyAoSW5mb3JtYXRp
b24gb25seSkgKi8NCj4gPiA+ICsJX191MTYgdGlsZV9pZDsNCj4gPiANCj4gPiBhY2sgb24gYWRk
aW5nIGl0IGJ1dCBqdXN0IGFkZGluZyBpdCBicmVha3MgdGhlIHN0cnVjdCBhbGlnbm1lbnQgZm9y
IDMyLzY0Yml0cyB1c2VyLXNwYWNlLg0KPiANCj4gVGhlIHBhZGRpbmcgd2FzIGJyb2tlbiBldmVu
IHdpdGhvdXQgdGhpcyBwYWQuIEkgaGFkIG5vdGljZWQgdGhpcyB5ZXN0ZXJkYXksIHNvIEkNCj4g
cmV2aWV3ZWQgdGhhdCBhc3BlY3QgYW5kIGZvdW5kIG1hbnkgbW9yZSBpbmNvcnJlY3QgcGFkZGlu
Z3MuIFdlIHdpbGwgbmVlZCB0byBzZW5kDQo+IGEgc2VwYXJhdGVkIHBhdGNoIHRvIGZpeCB0aGVt
IGFsbCBpbnN0ZWFkIG9mIGh1bnRpbmcgd2hpY2ggcGF0Y2ggd2FzIHRoZSBjdWxwcml0ICBub3cg
OigNCg0KQ2FuIHRoYXQgYmUgaW5jbHVkZWQgaW4gdGhpcyBzZXJpZXM/IEJlY2F1c2Ugd2UgcnVu
IFhlIEtNRCB3aXRoIHNvbWUgZ2FtZXMgaW4gU3RlYW0gdGhhdCBhcmUgMzJiaXRzLg0KDQo+ID4g
DQo+ID4gPiAgCS8qKiBAZ3RfaWQ6IFVuaXF1ZSBJRCBvZiB0aGlzIEdUIHdpdGhpbiB0aGUgUENJ
IERldmljZSAqLw0KPiA+ID4gIAlfX3UxNiBndF9pZDsNCj4gPiA+ICAJLyoqIEBjbG9ja19mcmVx
OiBBIGNsb2NrIGZyZXF1ZW5jeSBmb3IgdGltZXN0YW1wICovDQo+ID4gDQoNCg==
