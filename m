Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAF70C47DDC
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jan 2024 21:12:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9849C10E72A;
	Mon, 22 Jan 2024 21:12:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36B1010EC31
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Jan 2024 21:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705957927; x=1737493927;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=i+UGMoxgf/dPOKejhM22F+e0qhZf0u1xD3RKEJ6zIPs=;
 b=FkbHitd+S/9KrZeYFL31V77kQWvBaPIxX2TC9bd4EAob9bstiLxBdQNo
 sDpG5jfYuMvSU/boqMS2+Fxd+RAhyvYCwNvbR+h0hbykKHSOALZLc9nf3
 NpAaQE3oDIZXiTGUu4ssL+5McAcQtiGpZaXEEgM4G4G4dxYfohwamTbin
 VQtPDTisqyrcGnhNzf5/Tj98VL08/DsgV/veBzq4/XNiP+3mukTb5bMv5
 ps7lfOwCyT/HfEUtKOablkkY4DZIBMH2FMFU52SjNQNEhnvU/UmcnGgpd
 ymhieKz5/6ZRQRIX7EsBMwYeDlwlx/1oxtwHB9kUXxbLKzz3XR7EU+MHO A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="1215341"
X-IronPort-AV: E=Sophos;i="6.05,212,1701158400"; 
   d="scan'208";a="1215341"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 13:12:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,212,1701158400"; d="scan'208";a="20109274"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Jan 2024 13:12:05 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Jan 2024 13:12:04 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 22 Jan 2024 13:12:04 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 22 Jan 2024 13:12:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JEp+L13tIcenR0s/3saIi1BqmGkuueVKNg6KwpjhMJe0CGjWqT/YStD8V/mUd8yaiqxXO4hPoGk3Aye5vmN3PryaYJGd7HftT+iwZiFSuKGjph0rXqaI/bFIYS8/HiErdb8jV57HY/dIG3DHC/zEqs0VsjBYIXUWhj4seIgApa4qqVcGCM4uebaraarAU/KTnKCljGPnU1tNywqKOJtg6I3oPiadEYS9kSoCiwaODIp91Jw9+6TC5pGkywy0UfcDMrgBpZzCEL0r5NoRyimnu4LZ9wIIWm8aB6NK2KhRkpJ0iisQZoRWd6zV0pUrPpiZ+6dy7OcMsafDi+97P/AxVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i+UGMoxgf/dPOKejhM22F+e0qhZf0u1xD3RKEJ6zIPs=;
 b=cqV7uT0oEQdXVy+tL32ifBLGSbxCdw/AHLXX1R+sNnzRNWIcdar0BVMfH8RNRtdlPjQHm4WHWfgVIBIh6unxLoQ/XEz8hR2o30V2MPUg4vaIvZC17wrXEdMeK8OodJh+pk9UWBfoz9rW8BpBbM8ft7SmrcbB9Pvow8JNjHhNHY613FWzhNJ4hckBpbqYVtmj6UcAOvHdc2rH/elfuLs28kqERFJwMc8M5b7cyqyJ8XPjQD2yw2UKbs1IbOAb22eOrzSBgtrvM5+xxkBtTJDnVpVxe644vIQacPzKfI/X0OcvcWZK3HFg75M0XvFRZetHtZNf5Drhmit1uas6N4K1wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by PH7PR11MB8569.namprd11.prod.outlook.com (2603:10b6:510:304::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.34; Mon, 22 Jan
 2024 21:12:01 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::98c3:e090:252e:7967]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::98c3:e090:252e:7967%4]) with mapi id 15.20.7202.034; Mon, 22 Jan 2024
 21:12:00 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Subject: Re: [PATCH 7/9] drm/xe: Print more device information in devcoredump
Thread-Topic: [PATCH 7/9] drm/xe: Print more device information in devcoredump
Thread-Index: AQHaTVUydknIJKaoiUuWlY5D3qwsT7DmRY8AgAAPCAA=
Date: Mon, 22 Jan 2024 21:12:00 +0000
Message-ID: <380090baf230c917a87adb9ddbc1e24eccfee4b7.camel@intel.com>
References: <20240122170445.108856-1-jose.souza@intel.com>
 <20240122170445.108856-7-jose.souza@intel.com> <Za7NgM_B_nBIbTXL@intel.com>
In-Reply-To: <Za7NgM_B_nBIbTXL@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|PH7PR11MB8569:EE_
x-ms-office365-filtering-correlation-id: 93b3560f-a371-4731-c450-08dc1b8ec663
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oE3sJRR29vzwJXq5KwYk2IX4jd9/bhIGqp+WWU8LLw7jIFXh3i1NLMrrp0rR3pWSQars6lgTJkyqSxoTLM7hSFDHnMJiubOo3tLmANpRZ+91/O3PCssn5AQ+FOcqBd8/jiJ3r+EoFE5igqg4x2DUZ6bZ6vJCC96pm19HmdsXlrA6GKWTSroZiN6GfU8KTFuwao5hsY+kT2VZwloPaXZRoXWoNrI0qLaeQzO+XfvBqXrKBh5jeUCeSVNNZbMrMzVB8ktxCEBIQ7MnIbXCmB2n6qDJ05nKJjmJwyjCQMwoqR2lBeolBXDyA8vb1CfBfMLkNURlFy7/phqZwd+WyDO/yt46+DG+dnmiZm9pfsf6dYjCrHmNcy0zcfaA1bFHx2kYrz/7eeJarnz21jC2eyOdkF4EyPK54Tr9P2XWTagQlIVY3PH23oF0RkWcRLh6K5UeFuVG46/iqD1zV+XzKu+GyZ+b8fZSnjXikHcdE2TGv7SWdfA+lKGTT0tJTxwa5Bpu1cbZXCr49sVnPBTRIExgTGsgVDnWepgfXa6LRylEhjMnpH448/HrwmLdDgpagL3JBrlKvA/IOOuHH4vUWf5CqfR65F3ioJU9ajDIAmPsehz4xT4q+ttFWfrlkkZ0Hi+Y
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(346002)(396003)(39860400002)(136003)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(6506007)(26005)(2616005)(71200400001)(6512007)(122000001)(83380400001)(478600001)(5660300002)(8936002)(2906002)(41300700001)(91956017)(66476007)(66556008)(6862004)(6486002)(4326008)(8676002)(66446008)(6636002)(316002)(37006003)(76116006)(54906003)(64756008)(66946007)(82960400001)(36756003)(86362001)(38100700002)(38070700009);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Uk1SOGQ1ZCtsTDdYRlBRZ2FLejVRY2xaUVRuZHlDMEM4UEpxN0dhQ0dKUERn?=
 =?utf-8?B?TDFOcWZaaGdrQzR3d2ZSUkhhaGdWZE83K0lJUXZPZHgvOEgxSzkxSXQzamtl?=
 =?utf-8?B?Wk0rT3FaSDVFUmtGMlN6V0JNU21zM3E0Tm9zb3F3aG84dVl3TkQ2c0wxeXhX?=
 =?utf-8?B?ZG1jMW9nUmlobmVLNzlFaGFYUXh5Vis3dysxUHI5UEpRczF0TFFSTHV1ZGcw?=
 =?utf-8?B?Wk1ndXkrbC9SZ1hpNklLOU9sSWR6N2lSTjMyYXFHbmdUUXVvS2xQQmowVXow?=
 =?utf-8?B?T3F4bGhHVzh4R2ZNY1ROdThWRlF4WnhadGc0VVFyckt1ZFg2cUR6aDQyN05t?=
 =?utf-8?B?bFdjN3RZdTM5d0VzMGlWbk5ZejhkYVN1b2RtYnBvc0JlNXEwcmRKTk41RC95?=
 =?utf-8?B?UXRDazc3NHFndXpVMS95UDlsZ0FUVWkwSG9MUVVXbkhGNExLWGxFbmorczZE?=
 =?utf-8?B?TkZ4TDJPQkZTVk9mN2Z2eXg1RUVxRStFd3hlRTJydDNJS0hIOUd3cmdZOFFq?=
 =?utf-8?B?YlQrL3lreVdhNklDSURqVVdNTDQrOWtEV3I3VG94TCtuSVV0WCtsNS9tQmdt?=
 =?utf-8?B?aVI4YWhOb2VDTzFKUklsMUtwUVhhZ1daQU00QVJxek5uaU5QeEJuQ2MwRE5R?=
 =?utf-8?B?Ni96UWdNVS9oRXdHTTJNMnI1aUpySm5LUXY0YVhWeUZUb2lDa0FWWnBCNThU?=
 =?utf-8?B?bUtUb1RYNlBvZzNDeTEvVU04YzVPZkdBOHhlL1hQTkQ2cmFRYnRmZlJmakhI?=
 =?utf-8?B?eVVHRmU0V3BuU1Y5Q1gwWlExbEVaTElSZjIzc2VmSmpIZmpZYy9UWVdZbk55?=
 =?utf-8?B?aUJCdCt4NmtGZXFteWsyVUJEUVB4QWowbXJ5YkIvUFQ2UnIzYzIxVmZBajJi?=
 =?utf-8?B?aCtDSE1MMVBrc0tldFlqK0F6RWlhalJUWWxqNldEaDNFNHJTQmgwaGNrelZC?=
 =?utf-8?B?Q2xaazhRR3Q2WWNsaFptYk1zZENzUEhhelkrcU83a2VTZktjeC9XZ2lMY0Rh?=
 =?utf-8?B?WTVBekJJRFkvMGZPNGsxYXMyR0w4dUVXTlNNeitNTGxQdlZVdkIvTFhTbVdl?=
 =?utf-8?B?dnpJNmhMckhnb24yR0dGcG5wU3RvNUNGYTBBZkgrOEwzUXc2K2NXRTYxcnRQ?=
 =?utf-8?B?dWxjdGYvdFI3cnVLUWJ1UnphUjBSTndUVUkxNHU3YmpvK2J1WjV6RXNCZHpM?=
 =?utf-8?B?Ym1iSWVMRXI2MU5pOTlkY1FEMVNuRXNOVG5EZ2R6N2xZRE9lZmYzeFdKbWNZ?=
 =?utf-8?B?ZXIyQUxhY3lHMUhPL2EvdzdrVFRwQ1dBaEFSVzZhLzZVSjBlRDNKbm5mVlJx?=
 =?utf-8?B?cmV4Q0V4QlNSbjBDSEt3ZUpFUVRiZHJrQ2N2L2oyamVWdHgvQ1JNR0Rhb29x?=
 =?utf-8?B?cUV6bXg3c3VWS3NQd3NNYktoeXNVenFnS0Y3UjY5RVlkWldQbUEzZW5NdlhB?=
 =?utf-8?B?dHRYYUxtalV5NGpLQVluMlFjckVRcW0wNGVsa2o1d1lSQXptaVdtQlJWVjhN?=
 =?utf-8?B?RE5hWW5mTUdqa1J5SGlrVFE5VlRIT0V4Q0pMVkhoODM4YzIyQVcxT2M1MmxG?=
 =?utf-8?B?cHAxSHFNNjR1NnhQbXlDYi9OOGNHU0xhY0d0cW5lZmpYclpKUU54K2p1MkRP?=
 =?utf-8?B?anVEY0Fla0NtaWJlOGRQNVVJSlB2d0VqVXVrTGtBOEJuWWk0MHdGYU5HZmpp?=
 =?utf-8?B?c0lOZEIrSXhwL05zQzBhbEhUejJXeHVZbmUxSko2b3gvQ0V4ZzJhUG0xM3Rl?=
 =?utf-8?B?YWx4ekJaT05mRzBJdktQTzl0SFpuSnA3RTllVm9QZ1dHZHlITXplQ3VZVVpL?=
 =?utf-8?B?Z1VyQmloS0RyNzg0bjRuOUxVS0didEk1czVJbENUNVArWFkrcXRDcGpvWXJN?=
 =?utf-8?B?cUtMa21NOVFyZ2llVW5CUWlMYTBMSEQwbE1Bd1ppZkc2SVl4Q2NCZ0RFbWFq?=
 =?utf-8?B?ZWI3bmRQWU92dGxmY2dHUVAycGpCdW9TVHZraFFvOWJiUWFldHBtb3VjU1cy?=
 =?utf-8?B?TUcvZWpVMVJURmtzV2piRG1CRS9CTyszeEJpdEt5VGl2QXZzTnQ3dDZsZTE4?=
 =?utf-8?B?cEpuVXF4R0tTcXEwYmlRS2I2OS9wRUlsb3hJckc5MVNPclF6YjE2KzJCUkpU?=
 =?utf-8?B?TzlYMGpySm9lZFB5d3VTY2NLR1R4bXhDY1Z3WGxlZlVSMlFGVk5kVVBRb2cr?=
 =?utf-8?B?dEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BC19A1D4F0353848A722ED98DABE144A@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93b3560f-a371-4731-c450-08dc1b8ec663
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2024 21:12:00.6601 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IiV0dsVjM+31t6KGlSZhaH+S1Yg3DMxRR/qntpf3s0483g/WGl67ZxDH0q1Fn3fg7BMya2dDa4cP7bkAXSnbqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8569
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
Cc: "dev@lankhorst.se" <dev@lankhorst.se>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gTW9uLCAyMDI0LTAxLTIyIGF0IDE1OjE4IC0wNTAwLCBSb2RyaWdvIFZpdmkgd3JvdGU6DQo+
IE9uIE1vbiwgSmFuIDIyLCAyMDI0IGF0IDA5OjA0OjQzQU0gLTA4MDAsIEpvc8OpIFJvYmVydG8g
ZGUgU291emEgd3JvdGU6DQo+ID4gVG8gcHJvcGVybHkgZGVjb2RlIGJhdGNoIGJ1ZmZlciBNZXNh
IHRvb2xzIG5lZWRzIHRvIGtub3cgd2hhdA0KPiA+IHBsYXRmb3JtIGlzIHRoaXMgb25lLCBmb3Ig
bm93IHdlIGNhbiBkbyB0aGF0IHdpdGggUENJIGlkIGJ1dA0KPiA+IGFscmVhZHkgbWFraW5nIGl0
IGZ1dHVyZSBwcm9vZiBieSBhbHNvIHByaW50aW5nIEdUcyBHTUQgdmVyc2lvbi4NCj4gPiANCj4g
PiBDYzogUm9kcmlnbyBWaXZpIDxyb2RyaWdvLnZpdmlAaW50ZWwuY29tPg0KPiA+IENjOiBNYWFy
dGVuIExhbmtob3JzdCA8ZGV2QGxhbmtob3JzdC5zZT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBKb3PD
qSBSb2JlcnRvIGRlIFNvdXphIDxqb3NlLnNvdXphQGludGVsLmNvbT4NCj4gPiAtLS0NCj4gPiAg
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmNvcmVkdW1wLmMgfCAgMiArKw0KPiA+ICBkcml2ZXJz
L2dwdS9kcm0veGUveGVfZGV2aWNlLmMgICAgICB8IDIwICsrKysrKysrKysrKysrKysrKysrDQo+
ID4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2UuaCAgICAgIHwgIDIgKysNCj4gPiAgMyBm
aWxlcyBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCspDQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZjb3JlZHVtcC5jIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hl
X2RldmNvcmVkdW1wLmMNCj4gPiBpbmRleCBhMGUzNzMyNDQwYWI1Li40M2I2NmNhNzEwZjg1IDEw
MDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZjb3JlZHVtcC5jDQo+ID4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmNvcmVkdW1wLmMNCj4gPiBAQCAtNjMsNiAr
NjMsNyBAQCBzdGF0aWMgc3NpemVfdCB4ZV9kZXZjb3JlZHVtcF9yZWFkKGNoYXIgKmJ1ZmZlciwg
bG9mZl90IG9mZnNldCwNCj4gPiAgCQkJCSAgIHNpemVfdCBjb3VudCwgdm9pZCAqZGF0YSwgc2l6
ZV90IGRhdGFsZW4pDQo+ID4gIHsNCj4gPiAgCXN0cnVjdCB4ZV9kZXZjb3JlZHVtcCAqY29yZWR1
bXAgPSBkYXRhOw0KPiA+ICsJc3RydWN0IHhlX2RldmljZSAqeGUgPSBkZXZjb3JlZHVtcF90b194
ZV9kZXZpY2UoY29yZWR1bXApOw0KPiA+ICAJc3RydWN0IHhlX2RldmNvcmVkdW1wX3NuYXBzaG90
ICpzczsNCj4gPiAgCXN0cnVjdCBkcm1fcHJpbnRlciBwOw0KPiA+ICAJc3RydWN0IGRybV9wcmlu
dF9pdGVyYXRvciBpdGVyOw0KPiA+IEBAIC04OSw2ICs5MCw3IEBAIHN0YXRpYyBzc2l6ZV90IHhl
X2RldmNvcmVkdW1wX3JlYWQoY2hhciAqYnVmZmVyLCBsb2ZmX3Qgb2Zmc2V0LA0KPiA+ICAJZHJt
X3ByaW50ZigmcCwgIlNuYXBzaG90IHRpbWU6ICVsbGQuJTA5bGRcbiIsIHRzLnR2X3NlYywgdHMu
dHZfbnNlYyk7DQo+ID4gIAl0cyA9IGt0aW1lX3RvX3RpbWVzcGVjNjQoc3MtPmJvb3RfdGltZSk7
DQo+ID4gIAlkcm1fcHJpbnRmKCZwLCAiVXB0aW1lOiAlbGxkLiUwOWxkXG4iLCB0cy50dl9zZWMs
IHRzLnR2X25zZWMpOw0KPiA+ICsJeGVfZGV2aWNlX3NuYXBzaG90X3ByaW50KHhlLCAmcCk7DQo+
ID4gIA0KPiA+ICAJZHJtX3ByaW50ZigmcCwgIlxuKioqKiBHdUMgQ1QgKioqKlxuIik7DQo+ID4g
IAl4ZV9ndWNfY3Rfc25hcHNob3RfcHJpbnQoY29yZWR1bXAtPnNuYXBzaG90LmN0LCAmcCk7DQo+
ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2UuYyBiL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV9kZXZpY2UuYw0KPiA+IGluZGV4IGI0Y2RjZjFiMjA4MWEuLmUwMTM2ZTdk
NWFlNTIgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZS5jDQo+
ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZS5jDQo+ID4gQEAgLTc0MiwzICs3
NDIsMjMgQEAgdTY0IHhlX2RldmljZV91bmNhbm9uaWNhbGl6ZV9hZGRyKHN0cnVjdCB4ZV9kZXZp
Y2UgKnhlLCB1NjQgYWRkcmVzcykNCj4gPiAgew0KPiA+ICAJcmV0dXJuIGFkZHJlc3MgJiBHRU5N
QVNLX1VMTChoaWdoZXN0X2FkZHJlc3NfYml0X2dldCh4ZSksIDApOw0KPiA+ICB9DQo+ID4gKw0K
PiA+ICt2b2lkIHhlX2RldmljZV9zbmFwc2hvdF9wcmludChzdHJ1Y3QgeGVfZGV2aWNlICp4ZSwg
c3RydWN0IGRybV9wcmludGVyICpwKQ0KPiA+ICt7DQo+ID4gKwlzdHJ1Y3QgeGVfZ3QgKmd0Ow0K
PiA+ICsJdTggaWQ7DQo+ID4gKw0KPiA+ICsJZHJtX3ByaW50ZihwLCAiUENJIElEOiAweCUwNHhc
biIsIHhlLT5pbmZvLmRldmlkKTsNCj4gPiArCWRybV9wcmludGYocCwgIlBDSSByZXZpc2lvbjog
MHglMDJ4XG4iLCB4ZS0+aW5mby5yZXZpZCk7DQo+ID4gKw0KPiA+ICsJZm9yX2VhY2hfZ3QoZ3Qs
IHhlLCBpZCkgew0KPiA+ICsJCWRybV9wcmludGYocCwgIkdUIGlkOiAldVxuIiwgaWQpOw0KPiA+
ICsJCWRybV9wcmludGYocCwgIlx0VHlwZTogJXNcbiIsDQo+ID4gKwkJCSAgIGd0LT5pbmZvLnR5
cGUgPT0gWEVfR1RfVFlQRV9NQUlOID8gIm1haW4iIDogIm1lZGlhIik7DQo+ID4gKwkJZHJtX3By
aW50ZihwLCAiXHRJUCB2ZXI6ICV1LiV1LiV1XG4iLA0KPiA+ICsJCQkgICBSRUdfRklFTERfR0VU
KEdNRF9JRF9BUkNIX01BU0ssIGd0LT5pbmZvLmdtZGlkKSwNCj4gPiArCQkJICAgUkVHX0ZJRUxE
X0dFVChHTURfSURfUkVMRUFTRV9NQVNLLCBndC0+aW5mby5nbWRpZCksDQo+ID4gKwkJCSAgIFJF
R19GSUVMRF9HRVQoR01EX0lEX1JFVklELCBndC0+aW5mby5nbWRpZCkpOw0KPiA+ICsJCWRybV9w
cmludGYocCwgIlx0Q1MgdGltZXN0YW1wIGZyZXF1ZW5jeTogJXVcbiIsIGd0LT5pbmZvLnJlZmVy
ZW5jZV9jbG9jayk7DQo+IA0KPiBJIGRvbid0IGxpa2UgbXVjaCB0aGUgd29yZCAnZnJlcXVlbmN5
JyBhbG9uZyB3aXRoIHRoaXMgYmVjYXVzZSBvZiB0aGUNCj4gdHJhZGl0aW9uYWwgY29uZnVzaW9u
IHdpdGggdGhlIG1haW4gcnVubmluZyBHVCBmcmVxdWVuY3kuDQo+IEltaG8gYW55IGNvbWJpbmF0
aW9uIHdpdGggdGhlIHdvcmRzOiB0aW1lc3RhbXAgcmVmZXJlbmNlIGNyeXN0YWwgY2xvY2sgd291
bGQNCj4gYmUgYmV0dGVyLg0KPiANCj4gQnV0IEkgd2lsbCBsZWF2ZSB0aGUgZGVjaXNpb24gdG8g
eW91Li4uDQoNCmNoYW5naW5nIHRvDQoNCi0JICAgICAgICBkcm1fcHJpbnRmKHAsICJcdENTIHRp
bWVzdGFtcCBmcmVxdWVuY3k6ICV1XG4iLCBndC0+aW5mby5yZWZlcmVuY2VfY2xvY2spOw0KKwkg
ICAgICAgIGRybV9wcmludGYocCwgIlx0Q1MgcmVmZXJlbmNlIGNsb2NrOiAldVxuIiwgZ3QtPmlu
Zm8ucmVmZXJlbmNlX2Nsb2NrKTsNCiAJfQ0KDQo+IA0KPiBSZXZpZXdlZC1ieTogUm9kcmlnbyBW
aXZpIDxyb2RyaWdvLnZpdmlAaW50ZWwuY29tPg0KDQp0aGFuayB5b3UgZm9yIHRoaXMgYW5kIGFs
bCBvdGhlciByZXZpZXdzLg0KDQo+IHJlZ2FyZGxlc3MNCj4gDQo+ID4gKwl9DQo+ID4gK30NCj4g
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZS5oIGIvZHJpdmVycy9n
cHUvZHJtL3hlL3hlX2RldmljZS5oDQo+ID4gaW5kZXggNzgxYTFhYTE2NGVjZi4uN2RmN2NjZTIx
ODc3MCAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlLmgNCj4g
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlLmgNCj4gPiBAQCAtMTgzLDQgKzE4
Myw2IEBAIHUzMiB4ZV9kZXZpY2VfY2NzX2J5dGVzKHN0cnVjdCB4ZV9kZXZpY2UgKnhlLCB1NjQg
c2l6ZSk7DQo+ID4gIHU2NCB4ZV9kZXZpY2VfY2Fub25pY2FsaXplX2FkZHIoc3RydWN0IHhlX2Rl
dmljZSAqeGUsIHU2NCBhZGRyZXNzKTsNCj4gPiAgdTY0IHhlX2RldmljZV91bmNhbm9uaWNhbGl6
ZV9hZGRyKHN0cnVjdCB4ZV9kZXZpY2UgKnhlLCB1NjQgYWRkcmVzcyk7DQo+ID4gIA0KPiA+ICt2
b2lkIHhlX2RldmljZV9zbmFwc2hvdF9wcmludChzdHJ1Y3QgeGVfZGV2aWNlICp4ZSwgc3RydWN0
IGRybV9wcmludGVyICpwKTsNCj4gPiArDQo+ID4gICNlbmRpZg0KPiA+IC0tIA0KPiA+IDIuNDMu
MA0KPiA+IA0KDQo=
