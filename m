Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C74BAE728C5
	for <intel-xe@archiver.kernel.org>; Fri, 29 Sep 2023 16:45:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 935D710E147;
	Fri, 29 Sep 2023 16:45:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E873B10E147
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Sep 2023 16:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696005951; x=1727541951;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=VRY2zW5C0XPPUbknsta7byu1IoQ3DhcPCsFMnZ/Ga6c=;
 b=TdBKmyCi3WG9lOLHsBNSuyCwz51R+xSFfjLy2ugDsYBiADm/3isT6KNw
 qH6zhitvhjYGsbJn8skpCYk59AObipRBtDmijEHxqMTWkxwhdEYZvOe1m
 9AaDxL8hT8hede5HK5UsSW39KBb2jdYDquUrVhutWAEmyurpE2b1XJKv/
 qThObo4TienJN7EAA6tmqLYL44pcAAFAf3017IdKaycgfipgvofgdXdCd
 jCkNnb5KgA0kC7zhGd8w3XS2nA+sUTE0KtonrDSUtWrDND8cVnI+ED4X8
 W5CTaQ6tKsepA8wd6buJ1+yphckay9eS81nmQjuBSeo03BFCOvc1vGOXg Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="381222006"
X-IronPort-AV: E=Sophos;i="6.03,187,1694761200"; d="scan'208";a="381222006"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2023 09:45:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="893474982"
X-IronPort-AV: E=Sophos;i="6.03,187,1694761200"; d="scan'208";a="893474982"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Sep 2023 09:44:28 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 29 Sep 2023 09:45:41 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 29 Sep 2023 09:45:40 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 29 Sep 2023 09:45:40 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 29 Sep 2023 09:45:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UnM5gnCQT48H7X7jzut/lmJ6afEsbcd34A5I2YC3d6eeMAuPsax9cr7GNndEoLuxflCcHgqG8Wdq4oQklSzhunbwJxSJIcH2SusSICR3MEAIhHe1w6X7vCslP6PrWh683bg4ju5W88QTcq3eOdCPsXgbFEg3ECCijgZExFDVH+6J4JY/E6ec8K3R3QdffhoU+UAlxu3fdQMnIj40DC8qGziw0f8PaNndRftTEGH7JfrZ1Y6pSGpMFa6gn+u25fP31hgKaJKgGDP0onhKnggUVBP7JthjvnfUe7b3I3uklCqx5HY92XmCDWiILJqGcVsIPAds2XqcOmpZAFl8MJ2ISg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VRY2zW5C0XPPUbknsta7byu1IoQ3DhcPCsFMnZ/Ga6c=;
 b=HcgVwiAJj8Fve73mW67arLHuyrY9XbFAJ4gN67f0oKiq9ms3UL6aNhvZtSWBMFKwlyVPDVNGyBNmSdVc9uvbtmtQOMqwa3KhH+w/YVUcJCHJrxFhgCj88Myy0xAM2cUDiHahGzEUElPISF5o8+UVkgJWfgklk9debEgYHwa+sE8xzdDmEg1yO8diILPOrR3ZWdVD1K4N83mOVuCW4lPsTWxKZm+kFthxz7lyq0omyUXnn0ZOQ6A0vEKJgnfA5BG4L/hFO7poX1U5pan4VVXuTeg6sqsv2xfmCTddTKOdErQHSPyoIhLQYoMQ8bVvPgOhFna5UgLr/zqUjEH8hqNT/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by SJ0PR11MB5069.namprd11.prod.outlook.com (2603:10b6:a03:2ad::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Fri, 29 Sep
 2023 16:45:35 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::d6ef:5aaf:ef8f:5d47]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::d6ef:5aaf:ef8f:5d47%7]) with mapi id 15.20.6813.027; Fri, 29 Sep 2023
 16:45:35 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Nerlige Ramappa, Umesh"
 <umesh.nerlige.ramappa@intel.com>, "Dugast, Francois"
 <francois.dugast@intel.com>
Thread-Topic: [Intel-xe] [PATCH v3 26/30] drm/xe/uapi: Add pad to
 drm_xe_engine_class_instance
Thread-Index: AQHZ8HoCT8+YQLbJpkKRbdinWmJVh7Aw+RCAgACOj4CAAHOwgIAADHaA
Date: Fri, 29 Sep 2023 16:45:35 +0000
Message-ID: <4bb2a25702832a21263c3e5780644b979697998b.camel@intel.com>
References: <20230926125540.7-1-francois.dugast@intel.com>
 <20230926125540.7-27-francois.dugast@intel.com>
 <ZRYcFy97svJ8Z4NS@unerlige-ril> <ZRaTrQ6qqa9wIO9n@fdugast-desk.home>
 <ZRb0uavwuieKeqVy@unerlige-ril>
In-Reply-To: <ZRb0uavwuieKeqVy@unerlige-ril>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|SJ0PR11MB5069:EE_
x-ms-office365-filtering-correlation-id: f765f3d1-fc72-484b-0ec3-08dbc10b80e8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xp9TsENmnSS5rNFFHiip4sxXOxuRMS77Bf7mAflm7/yCLw7ECcjYZFr5c/5ahvyJbjnXWtEwixuqisqhoDoNfJwn/N9lUQxop0BOvuBb4B6Sn/uwGtzlweKZmGa91iCUdrQBSh6EzJTwDdy+kZSTvOhg3Ibk6UqTriW9pHziQJcXxlqI/8lwDgG+hZPeRRznYy1cpv7irO6lVtZsL3uAyqFweJ0h6Pd8nRPiZshAfyjDozCAqu+DWRNkmTTXkmwz3JrOeoUpoXG8JCMGbAebNvFz+55yk1jgIsiz/YLYVN74ui9oTkYg7kFDvlG1IO4eamQgfi4RO95H+rb1LtiXixrpb88EmQJ4uaqJyPSulkmTDrFpXAFIUPNr7bQGE1EPfe8n5gvJtA5Ry6RUEu1BCcBj7KjEMeU0T5VBlUPAbeTXQT5nGj2fre22QQSWfZKNEa7IaMoThjL5nKRhcLgMMJKYn4rscdtJy9mB2rtcMmw7KuT8RI1OEETCBEeZS+XPXPW241aWOmcahKsPBTT0Qv5i+CfAYPUWIF4VEB7Cnfem7BzfTb8IF19U81UFkVHXEA+jb53VJoYi8u33kI5vQ3X2mqtBfIG70mshtbZ4qDs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(39860400002)(376002)(396003)(346002)(230922051799003)(1800799009)(64100799003)(451199024)(186009)(38100700002)(110136005)(66446008)(66556008)(5660300002)(76116006)(66476007)(91956017)(66946007)(41300700001)(8936002)(6636002)(316002)(4326008)(64756008)(8676002)(2906002)(122000001)(478600001)(82960400001)(38070700005)(966005)(86362001)(2616005)(71200400001)(83380400001)(26005)(6512007)(6506007)(6486002)(36756003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z2xEVVJTTW9LMnoybERtUTNjRkF6c2pZU2hxeEsvcThzcVh3YUVLcUt1OHhn?=
 =?utf-8?B?QTZ6Qk5FcmtVOStWR2c2M3p2N0pZVXAyWnVRemtVWUxxODg4SVlyVVFOSFJ1?=
 =?utf-8?B?REZ5dkRFMUZiVVlxLzJzUCt4QXVacXlQcWp0WkY2WmxmRjhzU2hqcEtwUkVT?=
 =?utf-8?B?bkwxc2M5Y2RyaldJRDFacXp1VUk3RStuT1ErSUxiSE96TmE2eDA1L3lodjVu?=
 =?utf-8?B?R1lMeWZOeExVOGJ0WlpwcUs2SHRDU1l3VU45YXN6SlJKa0hRZHZ2K3o4MmNj?=
 =?utf-8?B?VkFjajk0M1ErdThLQUNqbWdkTkNkazlUdm9CWTZnK2I3QzhxQTNsYTBQa0tL?=
 =?utf-8?B?RXVvU3ZTcGQxNGptdXVmdjhVNDRFUE55TmVmSGZoSWdKRjlkb0lhRGp5T2R3?=
 =?utf-8?B?UmVwbkp2bEtseWJUUjNPZXdpUTZhOGNYdHowZGo1SXV2Q3RYdVZJT3NjQnQ5?=
 =?utf-8?B?VU9oOWt0MUxpaE5COHVIKzN0Z2NveFFlemJOODFmRXdmWDBrZDFUM1dHczQr?=
 =?utf-8?B?YzB1WlRaRzVqUytvRy8xRFhrV0txRVJFSEQzWkdoVEFMbUFrNmkyWk5JcHgy?=
 =?utf-8?B?blA2VmRvdWtlM0VZNVprNDZrZSswamxmMUh6YW1UMFQzY2RMNE1iaDBjeWky?=
 =?utf-8?B?aTd1Vy9ubEdyN3BNU09ITXJWbmozRmZjMVYrVFErVTdSMjZDMkF3QkpNeWRI?=
 =?utf-8?B?Wlh5NGo3eE9nZmpSYSs1YkMzWEt6cVliMnY2Q1IyT2RMYVpvNTRKUFJQWmhn?=
 =?utf-8?B?eFl0a205dW4ya3lYTXh1bHpwenE1U20vVEFqU3NpTzFQY3UyTkhseTFUSWhP?=
 =?utf-8?B?TExCMnJHaitnS3NoNU4vMS9vUmxNdGZWQ0toTVZkU3BhUWNRZTEzNWxzTW1v?=
 =?utf-8?B?OUpLSFkwSEFJdXVyeXZwSGV3em9CLzk2d2pZUXowQlJ6dkJtckEzTlpzM2xH?=
 =?utf-8?B?Z25sN0lDaUc3VFcxTWZvYjZ2Z1lnbmNNUHp0eTNvUytYaHJDQVdNWnU2cTJV?=
 =?utf-8?B?bUExVG5nbEp3YWFVaUR4eFBaWmFSdUJHeDJmbFFGeUZEVXNoZ2tLeXFGSVhw?=
 =?utf-8?B?NkpPM0dYcGZBM3hPWW5PeXZYZDVFRTEzUmVtNGVRSWMxd2ZRTGM5NkRhTGl3?=
 =?utf-8?B?aTZteHVGME9SSkY5K1I1M3BoZzJVMlMvQ1lZakxkZ1BOVEJhVWphMTFmL1lR?=
 =?utf-8?B?cmdoMS8yaWdWYVd5NE5QajRocUR5UGFrK0RKaCtURk1XWU8vZWJUWWdNWERC?=
 =?utf-8?B?bUNaTWZOQlBKYlZkeWFUSlVnc3UyTFJBZFJoU2NTd05LVXZJNG9GMjBySDhH?=
 =?utf-8?B?dmU1VUkwOHVuOW90M3JzdjFhQThrcWdNZjdxYkJ2YkVDd3JaMXd2cWt4Q0N2?=
 =?utf-8?B?U3lFdCs1UHkrbmNMallJMGJpbkdrdEdLSU9idk1nV2o1VEFkOUNxQ2tUQUR1?=
 =?utf-8?B?bEZaVWFmV3YxaWVkOGsvSlVXa0MzWmU0SjFVTlpFemttK1RJaXJmN21OSHFE?=
 =?utf-8?B?eDdjWUZlL2ovQmJEQVlLenA5WG1TczlraFZzSzVZQkdMcUlTWkxEcHUyWTA3?=
 =?utf-8?B?N1Q5UGM5OTZiVUNkZjFiemI5VENlQzV6bFFYbXFpTU1RZXBmcThNcWxyTFg0?=
 =?utf-8?B?RGVjaFR2SngycEFDTUdUZUlxelVENjA5VXhZOGE5eUhIaGZiMmE5ZzcvdnJ3?=
 =?utf-8?B?cFV4TXZZUWVnZk9aU2tISnN1aW5POGdUQnFGN3dDRXR6K2ZjcUpKb2V0N1Nr?=
 =?utf-8?B?VGdLRE9vZXVzczFvY3h0c3JwRWZiaGxEOTZ4T0ZyQTQxMERKZ0l0Rkt0Z0RK?=
 =?utf-8?B?VG1nOVc5WER2emY1ZXRtV3RIdUZzOFlaUy9kVlpiaXNMdG1OUkZwR1JXd2VJ?=
 =?utf-8?B?SVc0bXI4MmR4Z2UxQ1gybUpnbStoUVN5WjlhVE9GZUdjb2FreUx2RXA3Tk5N?=
 =?utf-8?B?bGlxK1FsdmwxVnpZWDhXUElzZkFTMk5hdFRSUHpGWVNKbDhBRlpiU2c3UWRz?=
 =?utf-8?B?YjNYOTM2NjE2NVFNVTNkMmRndGUrZU5iTXI2TlpnVkIvbVdWZ29BSGxNM3Ew?=
 =?utf-8?B?bnFoWXVhQVJvRlMrNFQ3cUpmU2FSQnVwdWU0ZG9WT2tveENlTG1QTEhqSWhw?=
 =?utf-8?B?S0xYY3dIc1VLaTBIbTVWSDlhalU2TE94VjZVa0xBUDNuMGpCVEJ3a2psRDBN?=
 =?utf-8?B?OVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9BD516645267544CB3437F23B62F5DC7@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f765f3d1-fc72-484b-0ec3-08dbc10b80e8
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2023 16:45:35.4137 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PNT84KYPA3lAZrCItsak7Nj8yK9ZVobZJhEVIJq2BFqG9hGmvLy6k8QOH2uRbIfGmDcTuYsRL6voEFddu2w+Aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5069
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 26/30] drm/xe/uapi: Add pad to
 drm_xe_engine_class_instance
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

T24gRnJpLCAyMDIzLTA5LTI5IGF0IDA5OjAwIC0wNzAwLCBVbWVzaCBOZXJsaWdlIFJhbWFwcGEg
d3JvdGU6DQo+IE9uIEZyaSwgU2VwIDI5LCAyMDIzIGF0IDExOjA2OjUzQU0gKzAyMDAsIEZyYW5j
b2lzIER1Z2FzdCB3cm90ZToNCj4gPiBIaSBVbWVzaCwNCj4gPiANCj4gPiBPbiBUaHUsIFNlcCAy
OCwgMjAyMyBhdCAwNTozNjozOVBNIC0wNzAwLCBVbWVzaCBOZXJsaWdlIFJhbWFwcGEgd3JvdGU6
DQo+ID4gPiBPbiBUdWUsIFNlcCAyNiwgMjAyMyBhdCAxMjo1NTozNlBNICswMDAwLCBGcmFuY29p
cyBEdWdhc3Qgd3JvdGU6DQo+ID4gPiA+IEFkZCBwYWQgdG8gcmVzZXJ2ZSBzcGFjZSBmb3IgZnV0
dXJlIHVzZXMgc3VjaCBhcyBzcGVjaWFsIGNvbmZpZ3VyYXRpb25zDQo+ID4gPiA+IGZvciBtZWRp
YS4NCj4gPiA+ID4gDQo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEZyYW5jb2lzIER1Z2FzdCA8ZnJh
bmNvaXMuZHVnYXN0QGludGVsLmNvbT4NCj4gPiA+IA0KPiA+ID4gSSBzYXcgYSBjb21tZW50IGlu
IHY0IHRoYXQgeW91IGRyb3BwZWQgdGhlIHBhdGNoZXMgdGhhdCBhcmUgbm90IHJldmlld2VkLCBz
bw0KPiA+ID4gdGhpcyBpczoNCj4gPiA+IA0KPiA+ID4gUmV2aWV3ZWQtYnk6IFVtZXNoIE5lcmxp
Z2UgUmFtYXBwYSA8dW1lc2gubmVybGlnZS5yYW1hcHBhQGludGVsLmNvbT4NCj4gPiA+IA0KPiA+
ID4gSG9waW5nIHRoaXMgd2lsbCBiZSBwYXJ0IG9mIHRoZSBmaW5hbCBzZXJpZXMgdGhhdCB5b3Ug
bWVyZ2Ugc2luY2UgdGhlDQo+ID4gPiBFTkdJTkVfQ1lDTEVTIHF1ZXJ5IGlzIHVzaW5nIHRoaXMg
c3RydWN0dXJlIGFuZCByZWxpZXMgb24gdGhpcyBwYWRkaW5nLg0KPiA+IA0KPiA+IEFjdHVhbGx5
IHVzaW5nIHlvdXIgb3JpZ2luYWwgc3VibWlzc2lvbiBbMV0gdGhpcyBwYXRjaCBzaG91bGQgbm90
IGxvbmdlcg0KPiA+IGJlIG5lY2Vzc2FyeSwgcmlnaHQ/IEl0IGluY2x1ZGVzOg0KPiA+IA0KPiA+
ICAgX191MTYgcnN2ZDsNCj4gPiANCj4gPiBbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvaW50
ZWwteGUvMjAyMzA4MTQyMjM3MzQuMzc1NDQ5LTUtdW1lc2gubmVybGlnZS5yYW1hcHBhQGludGVs
LmNvbS8NCj4gDQo+IEhtbW0sIEkgZmFpbGVkIHRvIG5vdGljZSB0aGF0IGVhcmxpZXIuIE15IGJh
ZC4gdjQgbG9va3MgZ29vZCwgeW91IGNhbiANCj4gaWdub3JlIHRoaXMuDQoNCkl0IGlzIG5hbWVk
IGFzIHJzdmQgYnV0IGl0IHNob3VsZCBiZSBhIHBhZC4NCg0KV2UgY2FuJ3QgbGVhdmUgYXMgcmVz
ZXJ2ZWQgdG8gYmUgZnV0dXJlIHVzZWQgdG8gcmV0dXJuIG1lZGlhIGVuZ2luZSBjYXBhYmlsaXRp
ZXMgYmVjYXVzZSBkcm1feGVfZW5naW5lX2NsYXNzX2luc3RhbmNlIGlzIGFsc28gdXNlZCBhcyBp
bnB1dCB0byBvdGhlcg0KdUFQSXMgYW5kIHRoYXQgaXMgdXNlbGVzcyBpbmZvcm1hdGlvbiBhZnRl
ciBpbml0aWFsaXphdGlvbiB0aGF0IFVNRHMgc2hvdWxkIG5vdCBuZWVkIHRvIGNhcnJ5IGFyb3Vu
ZC4NCg0KSW5zdGVhZCBEUk1fWEVfREVWSUNFX1FVRVJZX0VOR0lORVMgc2hvdWxkIHJldHVybiBz
b21ldGhpbmcgbGlrZQ0KDQpzdHJ1Y3QgZHJtX3hlX2VuZ2luZV9pbmZvIHsNCglzdHJ1Y3QgZHJt
X3hlX2VuZ2luZV9jbGFzc19pbnN0YW5jZSBpbnN0YW5jZTsNCglfX3UzMiByc3ZkOy8qIGZ1dHVy
ZSBjb3VsZCBiZSBfX3UxNiBjYXBhYmlsaXRpZXM7IF9fdTE2IHJzdmQ7ICovDQp9Ow0KDQpUaGlz
IGNhbiBiZSBmaXhlZCBpbiB1QVBJIHRha2UgMi4NCg0KPiANCj4gVGhhbmtzLA0KPiBVbWVzaA0K
PiA+IA0KPiA+IEZyYW5jb2lzDQo+ID4gDQo+ID4gPiANCj4gPiA+IFRoYW5rcywNCj4gPiA+IFVt
ZXNoDQo+ID4gPiA+IC0tLQ0KPiA+ID4gPiBpbmNsdWRlL3VhcGkvZHJtL3hlX2RybS5oIHwgMiAr
Kw0KPiA+ID4gPiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspDQo+ID4gPiA+IA0KPiA+
ID4gPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS91YXBpL2RybS94ZV9kcm0uaCBiL2luY2x1ZGUvdWFw
aS9kcm0veGVfZHJtLmgNCj4gPiA+ID4gaW5kZXggNzllNDc3MDhkNTI2Li44NDA5MTg2MGM3ZDIg
MTAwNjQ0DQo+ID4gPiA+IC0tLSBhL2luY2x1ZGUvdWFwaS9kcm0veGVfZHJtLmgNCj4gPiA+ID4g
KysrIGIvaW5jbHVkZS91YXBpL2RybS94ZV9kcm0uaA0KPiA+ID4gPiBAQCAtMTQzLDYgKzE0Myw4
IEBAIHN0cnVjdCBkcm1feGVfZW5naW5lX2NsYXNzX2luc3RhbmNlIHsNCj4gPiA+ID4gDQo+ID4g
PiA+IAlfX3UxNiBlbmdpbmVfaW5zdGFuY2U7DQo+ID4gPiA+IAlfX3UxNiBndF9pZDsNCj4gPiA+
ID4gKwkvKiogQHBhZDogTUJaICovDQo+ID4gPiA+ICsJX191MzIgcGFkOw0KPiA+ID4gPiB9Ow0K
PiA+ID4gPiANCj4gPiA+ID4gLyoqDQo+ID4gPiA+IC0tDQo+ID4gPiA+IDIuMzQuMQ0KPiA+ID4g
PiANCg0K
