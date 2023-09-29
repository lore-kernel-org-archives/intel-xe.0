Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 273E5E810D5
	for <intel-xe@archiver.kernel.org>; Fri, 29 Sep 2023 12:03:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC34910E6F6;
	Fri, 29 Sep 2023 12:03:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 078A010E6F6
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Sep 2023 12:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695988982; x=1727524982;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hA8bF8Ivt6+b8qkVR1gNyYtWMSsUOuT44xNw722IB78=;
 b=dd63YU9poP25Syn/0642vPp99kMeJUn+t5ny/efb/EV8E6Bav/CnGEqL
 Csho0pns8KkwKX030SE5OEspvZ2959fbYzCGSrIYV0V7cxvN8QBERp8Am
 kTZqQWH6oI0/fP2J8oH5X83QBBRCBFl0daFQqv/zf/2Uk47A7HnoHy4Ca
 N6ZSKQNgmwLQ3nW59b5zRD4wkCoGPa4GX1NW2pI+uEwyMFm2O5LkjDMbz
 kDd3KS6Qm/4A+YoZ6Ency+DP6Y94l4SJqqqRn+/NwbsrTebS19He10yrV
 1j6L4nmBJSncU043KUrowAJGo2JW++Sh223sdzVRTJ2dZXhU++opF0MrA g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="381170757"
X-IronPort-AV: E=Sophos;i="6.03,187,1694761200"; d="scan'208";a="381170757"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2023 05:02:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="779253250"
X-IronPort-AV: E=Sophos;i="6.03,187,1694761200"; d="scan'208";a="779253250"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Sep 2023 05:02:34 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 29 Sep 2023 05:02:34 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 29 Sep 2023 05:02:33 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 29 Sep 2023 05:02:33 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 29 Sep 2023 05:02:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EGK0YqeZ+eMmkcl2thaEX8LGEVfTrrYQFfBO/rpzORtT+FV7JDaZt6g71CX9AyDxLosbhHBn3FvL8mB7ZC6NmKHwPeZMI4H2Q9TLpbFw86I6XRMjx5KPD2a9jd/VyNcqHVjZrzy8pLsGwG3yFw+/77nf5nC/epAdD120ynr3nZHdzmvWgRVFe+p+0R5/s541FGfiPnqoduzG1VqwDs1mWaOn3tkDoPXDfVhgRLcLvB5sa8nCYm+KaWq+PkPIZ4/3EmMEFasQuTwhEa8nEiZMZ9vTb4rISHxsLzG807OCCv/qo6arnaXtStoPnanZJKFLIWpEZiYUxLGRz8fTjHdTBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hA8bF8Ivt6+b8qkVR1gNyYtWMSsUOuT44xNw722IB78=;
 b=VNt7roHIClHiGi4vtOULTDCCwRB6qNdECNd206IO6C56pYqZ65hTa20SJFcGXhve7MjwBodPUX68mGw+EsrXyOo62dDehj9jrYIxI+nHHDV+uVF/FSmPf178A/tUOT82qkpgJ6ncBpnHt4R9d1dhiGsLt3f4bGzuiwkH1cvFkKHj9VfydPuIcv6/4cCUKirvBYiXcFSt0vQ9LSX1SgAY5ftgCQhcVp1kkACZSduy8ze29r62dCumVUvUsCZspjYxrVhHxPZlazhMuXaLiofMAqYEBg7Q1a2ug33v3D97h6RzvyjOOLy3ExG0+FLWJHYAr3n/klBCkyKNXiX0RCaINA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by CH3PR11MB7770.namprd11.prod.outlook.com (2603:10b6:610:129::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.26; Fri, 29 Sep
 2023 12:02:31 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::ed57:a908:f0ad:13cd]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::ed57:a908:f0ad:13cd%7]) with mapi id 15.20.6792.026; Fri, 29 Sep 2023
 12:02:31 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [Intel-xe] [PATCH V5 1/2] drm/xe: Introduce low level driver
 error counting APIs
Thread-Index: AQHZ8pyNwJOnNThiwU2HqwMXhySsOLAxpmwAgAANlAA=
Date: Fri, 29 Sep 2023 12:02:31 +0000
Message-ID: <SJ1PR11MB6204801CE5E849950B9EB44181C0A@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20230929062420.394375-1-tejas.upadhyay@intel.com>
 <20230929062420.394375-2-tejas.upadhyay@intel.com>
 <85323d59-28c0-bb42-67af-1a6a2b8550ab@linux.intel.com>
In-Reply-To: <85323d59-28c0-bb42-67af-1a6a2b8550ab@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|CH3PR11MB7770:EE_
x-ms-office365-filtering-correlation-id: 755c69b6-8f95-416a-0aad-08dbc0e3f592
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Eow3dEoPcjPFbFFis8UISvy9I3dX38i3qQw9qrEFxw1z01TFFZuCYD57MDqm76qcR8YW9dGoSHdCzLIIAF3opES8CM2hb+2gQdCElfQOiatB+bwibcgAS/JRoFi2NbQY6mTWVLKCwvqQTmFiBXXeDc6gbxvyu/AaxHL+6I35sI6ZbFm6AuXvHl/aYMmSjwwg8t0qNV6Es4dh+2Yz/ebl4X2Wk16MAUjTh9ocOdgLqcdQKg2paffSqBxFQogzF+1KOWm8/mNBVV88l6zxW72dDZnthmtcmaUTOo8bFfwCn264sygEqxXSUx3lQ5VGBtN/gZmApMyZkrPyc8AQegfTGlRJXRjcgRdIIxo298ncRLcw6X956q2Xss17SYQt0RtyOJC8QJO2+4sRBQQI6IKLRxmZpIGLuM+5djP0QfSkHGAYrIZwBWwAWzjIbkqHTqjLsjUtEued5zahPU1Y3LkhQ+w4LEo5quZApAf+Dw0diIvfssoIY5+D84OCB7BK8NbguouPCcNIR6oi5XIp6LETSwgusUlGWAOd7KiTczyLsD1+0Sj88YizO/FjvTU+fuI/ReAQmwU5p71mAkG9jX6nzqUrw1CXFf4g2iuSOL/V/sQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(39860400002)(136003)(376002)(346002)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(316002)(110136005)(55016003)(54906003)(64756008)(86362001)(76116006)(66556008)(66476007)(66946007)(66446008)(478600001)(38100700002)(38070700005)(71200400001)(2906002)(41300700001)(52536014)(5660300002)(4326008)(8676002)(8936002)(26005)(33656002)(83380400001)(122000001)(6506007)(53546011)(55236004)(82960400001)(9686003)(7696005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q3NqeEVkZzhhU254ays0UEptaVNRYTllay8ya3MzNGFCUVhJZTcrN0g2YXd1?=
 =?utf-8?B?bStmeVJwVWNnYnRtemhWOFFSODZhL1M1dkt4bzg4N2wyN0RoNTdBL1RseXNI?=
 =?utf-8?B?OGU0ZWRPT2k5cWp5VlhXV3JCcHN6MUxCZm1KNU5GaWpFQUYxZXlXdkRTZHhN?=
 =?utf-8?B?TUY4akdmQmU5UXFkdnZ3TmV2bGlhS243dk00eXBjRGpqZVZJUzNOcjU3VHFi?=
 =?utf-8?B?eDA0Yjg3VndPOU9HL2tqalVMendpTnk2QStQbFZoU2NueDVFalJ1Yzh5NzNV?=
 =?utf-8?B?UlRUSWZtc2NlcTVwOHRwUExpb3VWakM4WjMrQ0xZUjN6SkltSHlHell1YUNN?=
 =?utf-8?B?OEsrZ2ZjaVB4dk5abitqaUF1Sm55eEpNRDhZS1VzMGJHUUpsaFRaeU80Vit4?=
 =?utf-8?B?WUt3SHRTUEcvazF2MVlLdWRLRVRobjg4cTlvanZrMUhlL0NvcEgzT09RWDRY?=
 =?utf-8?B?cS9XaWtLZzgrQ3hBUTRwSHdBS3lYdEc3SUsxeEh3UGFCVGRZMDR2SVowZVcx?=
 =?utf-8?B?Q29PV0tIS0NyQlhxZTJabzBKQ2VpbnZuaEN3NWpwZXY2Z1g2QmlzUVlIQkl3?=
 =?utf-8?B?RWNBdnN4MXQ3UEZXUDR1K1ZvTGpzVzZuaXU0WmZ1UWxGN2oxelpwSFhmZUVu?=
 =?utf-8?B?R2pVNEFsMmdkbnoxYUtKUHpvUm9HYWlsR3NZS0ZDdW52N0FxcXhGVUV6UUZH?=
 =?utf-8?B?VFFUdTEya1dWcUVsUFpnUXZwbVFzMGhVS2NsSU5xRjJ1elAyamorM0JNYVlJ?=
 =?utf-8?B?ODRnUyt5MXg5M3M4ckI4dDFKZVlIN2xoaEh2VkY2NU13RTVNY2ZrRUxQaVBV?=
 =?utf-8?B?US9BY1FRVnJBbEpoZVJRbFYydU5HZ3poa3J1aCtrYm1XYXBmSithTHhVNk9t?=
 =?utf-8?B?aXlNbHR4a2NEd1RKTkRDYWZtLzFxTWIrMlFuRzNDWHNYUXJtSDMwanFDU1Mw?=
 =?utf-8?B?eU15K2xsdExIcjAvYjVYMC9CelJCWWN1dm5GZHJ1U09STEhGUmR2NXFIbUt1?=
 =?utf-8?B?L1dCY29aUmxSU3RGMVdGNE9qMkhDTDMvMWFqbmxzUFRrdlk5WHhrYTlWK2dw?=
 =?utf-8?B?VlRrVkhiSE9yZEdvL2tVTllMRTh1VmF3S3ZLVDQ1cDRuMWZkOWdZMmcrM3pD?=
 =?utf-8?B?K0RhWDZodjFUVnFtaWFFck1IbktqN0FTRUJqTm9KeWhlcVE4eit2NjMxN1RV?=
 =?utf-8?B?NytwUVJkYjNJVTExQkVhUFRRaHVFOVc3WHFYV2RxdXJHOHdHbTFsc1Qyd0Jt?=
 =?utf-8?B?T1ArcUplTlV5b0UxamxKZENKZkNpN201OUVFS1dmSXpnQjM5UW9BTDFoL1FL?=
 =?utf-8?B?MU1xMHhuTGZqNVJnSEt0Mnd5VXZ3dU9MalFBUXNFVE9RQUJidnRocS81dTcz?=
 =?utf-8?B?YllPUklHOWFia0cxYjR5MWU3S3V2REtZbG1uLzAyLzN5MHdPRWNSWndhQ0NR?=
 =?utf-8?B?SGtSVC9mQW9yR2x3a3RqZXh2YkdxNThqdTJTbEpaWkRWN2NPYlFQVEZKTTVR?=
 =?utf-8?B?dCs1SENCYjBjVDE3MkdGanlmOHNiQm55enlIMnlEMVUrNGliRDJZTWk5eDRi?=
 =?utf-8?B?bGQ2UHk4NlhpaTZYaTBmczJwcmlMOUFETGpONitXQUF2aDR3b2JkL253c0NV?=
 =?utf-8?B?eVhvV2N5RzdxN0V6ZlBWR2I5Z09nQ1I5NThkWDVzZjhWKzFMSnI2Z3JsUVVu?=
 =?utf-8?B?WnZKYmJYWTRtU25WN29HY1huUTd3T1lSRk5mdklBSGpveWlzZFpjWUYza25o?=
 =?utf-8?B?eFVtZlRLdGFMOExscjdaUDN6eUhINzV1Q1VKOWpoZ1BDMTBkNkdwa2NTaWZS?=
 =?utf-8?B?RDJLaXVaaktHT0dKN1BZNlRBN1Y0S09VNWlsZEpaRmUvNDdWa0xXdVFuQjF6?=
 =?utf-8?B?a1Y2TTBqUTFuZVZyYnRsQXg2WldhMUdlWDV4am5lQS9sb3dyWXlDZFl4QWh2?=
 =?utf-8?B?Z0I2TGNHajl3V2p2azAzWTI4WDlJYldJN1lKeWlvaGtMZFArSDdXZXlRUjNO?=
 =?utf-8?B?djZ1bGRoQnZQLzI1SHhlZHdoVjFLR3B6WGpjS1R2L3FUWndhSSs3VGhUcm1H?=
 =?utf-8?B?akdJS29lcGJxL1RpekdVQlJKUmUzeHpBVmJkS3gyZllYMFZhaVkwQ1l2VHpX?=
 =?utf-8?Q?1vBVCBSqhx1LxK3Keea0bfBMw?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 755c69b6-8f95-416a-0aad-08dbc0e3f592
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2023 12:02:31.2912 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +0RIFH4kki/73PLngsFgASVUANySqJpesj1hTwg8lRu63OVmlTnX84yfGWRbRoEALSulmMbsUxFCL0ieDwQns6dPyajq3bGLMe4NNA8Rhj8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7770
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH V5 1/2] drm/xe: Introduce low level driver
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
Cc: "Roper@freedesktop.org" <Roper@freedesktop.org>, "Roper,
 Matthew D" <matthew.d.roper@intel.com>,
 "Wajdeczko@freedesktop.org" <Wajdeczko@freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQXJhdmluZCBJZGRhbXNl
dHR5IDxhcmF2aW5kLmlkZGFtc2V0dHlAbGludXguaW50ZWwuY29tPg0KPiBTZW50OiBGcmlkYXks
IFNlcHRlbWJlciAyOSwgMjAyMyA0OjQyIFBNDQo+IFRvOiBVcGFkaHlheSwgVGVqYXMgPHRlamFz
LnVwYWRoeWF5QGludGVsLmNvbT47IGludGVsLQ0KPiB4ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmcN
Cj4gQ2M6IFJvcGVyQGZyZWVkZXNrdG9wLm9yZzsgV2FqZGVjemtvQGZyZWVkZXNrdG9wLm9yZzsg
Um9wZXIsIE1hdHRoZXcgRA0KPiA8bWF0dGhldy5kLnJvcGVyQGludGVsLmNvbT4NCj4gU3ViamVj
dDogUmU6IFtJbnRlbC14ZV0gW1BBVENIIFY1IDEvMl0gZHJtL3hlOiBJbnRyb2R1Y2UgbG93IGxl
dmVsIGRyaXZlciBlcnJvcg0KPiBjb3VudGluZyBBUElzDQo+IA0KPiANCj4gT24gMjkvMDkvMjMg
MTE6NTQsIFRlamFzIFVwYWRoeWF5IHdyb3RlOg0KPiA+IExvdyBsZXZlbCBkcml2ZXIgZXJyb3Ig
dGhhdCBtaWdodCBoYXZlIHBvd2VyIG9yIHBlcmZvcm1hbmNlIGltcGFjdCBvbg0KPiA+IHRoZSBz
eXN0ZW0sIHdlIGFyZSBhZGRpbmcgYSBuZXcgZXJyb3IgY291bnRlciB0byBHVCBhbmQgdGlsZSBh
bmQNCj4gPiBpbmNyZW1lbnQgb24gZWFjaCBvY2N1cnJhbmNlLiBMZXRzIGludHJvZHVjZSBBUElz
IHRvIGRlZmluZSBhbmQNCj4gPiBpbmNyZW1lbnQgZWFjaCBlcnJvciB0eXBlIGNvdW50ZXIuDQo+
ID4NCj4gPiBWNDoNCj4gPiAgIC0gTW92ZSBBUEkgZGVjbGFyYXRpb24gdW5kZXIgdGlsZS5oIC0g
SmFuaQ0KPiA+ICAgLSBUeXBvcw0KPiA+IFYzOg0KPiA+ICAgLSBjb3JyZWN0ICNkZWZpbmUgbWF4
IHZhbHVlDQo+ID4gVjI6DQo+ID4gICAtIE1vdmUgc29tZSBjb2RlIHRvIGl0cyByZWxhdGVkIHBh
dGNoIC0gTWljaGFsDQo+ID4gICAtIFJlbmFtaW5nIGlmIEFQSSBhbmQgZW51bSAtIE1pY2hhbA0K
PiA+ICAgLSBHVUMgZXJyb3JzIGFyZSBtb3ZlZCBwZXIgR1QgLSBNaWNoYWwNCj4gPiAgIC0gU29t
ZSBuaXRzIC0gTWljaGFsDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBUZWphcyBVcGFkaHlheSA8
dGVqYXMudXBhZGh5YXlAaW50ZWwuY29tPg0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL2dwdS9kcm0v
eGUveGVfZGV2aWNlX3R5cGVzLmggfCAgOSArKysrKysrKysNCj4gPiAgZHJpdmVycy9ncHUvZHJt
L3hlL3hlX2d0LmMgICAgICAgICAgIHwgMTggKysrKysrKysrKysrKysrKysrDQo+ID4gIGRyaXZl
cnMvZ3B1L2RybS94ZS94ZV9ndC5oICAgICAgICAgICB8ICAzICsrKw0KPiA+ICBkcml2ZXJzL2dw
dS9kcm0veGUveGVfZ3RfdHlwZXMuaCAgICAgfCAxMCArKysrKysrKysrDQo+ID4gIGRyaXZlcnMv
Z3B1L2RybS94ZS94ZV90aWxlLmMgICAgICAgICB8IDE4ICsrKysrKysrKysrKysrKysrKw0KPiA+
ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfdGlsZS5oICAgICAgICAgfCAgMiArKw0KPiA+ICA2IGZp
bGVzIGNoYW5nZWQsIDYwIGluc2VydGlvbnMoKykNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlX3R5cGVzLmgNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS94
ZS94ZV9kZXZpY2VfdHlwZXMuaA0KPiA+IGluZGV4IDA3MTc4MzlhZTk2NC4uZGM1N2IzOGQ3ZTYz
IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2VfdHlwZXMuaA0K
PiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2VfdHlwZXMuaA0KPiA+IEBAIC01
OSw2ICs1OSwxMiBAQCBzdHJ1Y3QgeGVfcGF0X29wczsNCj4gPiAgCQkgY29uc3Qgc3RydWN0IHhl
X3RpbGUgKiA6IChjb25zdCBzdHJ1Y3QgeGVfZGV2aWNlICopKCh0aWxlX18pLT54ZSksDQo+IAlc
DQo+ID4gIAkJIHN0cnVjdCB4ZV90aWxlICogOiAodGlsZV9fKS0+eGUpDQo+ID4NCj4gPiArI2Rl
ZmluZSBYRV9USUxFX0RSVl9FUlJfTUFYCTINCj4gPiArZW51bSB4ZV90aWxlX2Rydl9lcnJfdHlw
ZSB7DQo+ID4gKwlYRV9USUxFX0RSVl9FUlJfR0dUVCwNCj4gPiArCVhFX1RJTEVfRFJWX0VSUl9J
TlRSDQo+ID4gK307DQo+ID4gKw0KPiBpIGd1ZXNzIHlvdSBtaXNzZWQgdG8gbm90aWNlIG15IGVh
cmxpZXIgY29tbWVudCwgcmVwYXN0aW5nIGhlcmU6DQo+IA0KPiAiaW4gdGhhdCBjYXNlIGRvIGxp
a2UgdGhpcywgc28gb25lIHdvdWxkIG5vdCBhY2NpZGVudGFsbHkgbWlzcyB1cGRhdGluZyB0aGUg
bWF4DQo+IHdoZW4gZW51bSBpcyB1cGRhdGVkLg0KPiANCj4gZW51bSB4ZV90aWxlX2Rydl9lcnJf
dHlwZSB7DQo+IMKgwqDCoCBYRV9USUxFX0RSVl9FUlJfR0dUVCwNCj4gwqDCoMKgIFhFX1RJTEVf
RFJWX0VSUl9JTlRSLA0KPiDCoMKgwqAgX19YRV9USUxFX0RSVl9FUlJfTUFYDQo+IH07DQo+IA0K
PiAjZGVmaW5lIFhFX1RJTEVfRFJWX0VSUl9NQVggX19YRV9USUxFX0RSVl9FUlJfTUFYIg0KPiAN
Cj4gY2hlY2sgYmVsb3cuDQo+IA0KPiA+ICAvKioNCj4gPiAgICogc3RydWN0IHhlX21lbV9yZWdp
b24gLSBtZW1vcnkgcmVnaW9uIHN0cnVjdHVyZQ0KPiA+ICAgKiBUaGlzIGlzIHVzZWQgdG8gZGVz
Y3JpYmUgYSBtZW1vcnkgcmVnaW9uIGluIHhlIEBAIC0xNzUsNiArMTgxLDkgQEANCj4gPiBzdHJ1
Y3QgeGVfdGlsZSB7DQo+ID4NCj4gPiAgCS8qKiBAc3lzZnM6IHN5c2ZzJyBrb2JqIHVzZWQgYnkg
eGVfdGlsZV9zeXNmcyAqLw0KPiA+ICAJc3RydWN0IGtvYmplY3QgKnN5c2ZzOw0KPiA+ICsNCj4g
PiArCS8qKiBAZHJ2X2Vycl9jbnQ6IGRyaXZlciBlcnJvciBjb3VudGVyIGZvciB0aGlzIHRpbGUg
Ki8NCj4gPiArCXUzMiBkcnZfZXJyX2NudFtYRV9USUxFX0RSVl9FUlJfTUFYXTsNCj4gPiAgfTsN
Cj4gPg0KPiA+ICAvKioNCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0
LmMgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3QuYw0KPiA+IGluZGV4IDY4Y2Q5YTdlZTA4Ny4u
YThiNWYwMTI1ODhiIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndC5j
DQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0LmMNCj4gPiBAQCAtNDcsNiArNDcs
MjQgQEANCj4gPiAgI2luY2x1ZGUgInhlX3dhLmgiDQo+ID4gICNpbmNsdWRlICJ4ZV93b3BjbS5o
Ig0KPiA+DQo+ID4gKy8qKg0KPiA+ICsgKiB4ZV9ndF9yZXBvcnRfZHJpdmVyX2Vycm9yIC0gQ291
bnQgZHJpdmVyIGVycm9yIGZvciBndA0KPiA+ICsgKiBAZ3Q6IEdUIHRvIGNvdW50IGVycm9yIGZv
cg0KPiA+ICsgKiBAZXJyOiBlbnVtIGVycm9yIHR5cGUNCj4gPiArICoNCj4gPiArICogSW5jcmVt
ZW50IHRoZSBkcml2ZXIgZXJyb3IgY291bnRlciBpbiByZXNwZWN0aXZlIGVycm9yDQo+ID4gKyAq
IGNhdGVnb3J5IGZvciB0aGlzIEdULg0KPiA+ICsgKg0KPiA+ICsgKiBSZXR1cm5zIHZvaWQuDQo+
ID4gKyAqLw0KPiA+ICt2b2lkIHhlX2d0X3JlcG9ydF9kcml2ZXJfZXJyb3Ioc3RydWN0IHhlX2d0
ICpndCwNCj4gPiArCQkJICAgICAgIGNvbnN0IGVudW0geGVfZ3RfZHJ2X2Vycl90eXBlIGVycikg
ew0KPiA+ICsJeGVfZ3RfYXNzZXJ0KGd0LCBlcnIgPj0gQVJSQVlfU0laRShndC0+ZHJ2X2Vycl9j
bnQpKTsNCj4gPiArCVdSSVRFX09OQ0UoZ3QtPmRydl9lcnJfY250W2Vycl0sDQo+ID4gKwkJICAg
UkVBRF9PTkNFKGd0LT5kcnZfZXJyX2NudFtlcnJdKSArIDEpOyB9DQo+ID4gKw0KPiA+ICBzdHJ1
Y3QgeGVfZ3QgKnhlX2d0X2FsbG9jKHN0cnVjdCB4ZV90aWxlICp0aWxlKSAgew0KPiA+ICAJc3Ry
dWN0IHhlX2d0ICpndDsNCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0
LmggYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3QuaA0KPiA+IGluZGV4IGNhZGVkMjAzYThhMC4u
OTQ0MmQ2MTUwNDJmIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndC5o
DQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0LmgNCj4gPiBAQCAtNjcsNCArNjcs
NyBAQCBzdGF0aWMgaW5saW5lIGJvb2wgeGVfZ3RfaXNfdXNtX2h3ZShzdHJ1Y3QgeGVfZ3QgKmd0
LA0KPiBzdHJ1Y3QgeGVfaHdfZW5naW5lICpod2UpDQo+ID4gIAkJaHdlLT5pbnN0YW5jZSA9PSBn
dC0+dXNtLnJlc2VydmVkX2Jjc19pbnN0YW5jZTsgIH0NCj4gPg0KPiA+ICt2b2lkIHhlX2d0X3Jl
cG9ydF9kcml2ZXJfZXJyb3Ioc3RydWN0IHhlX2d0ICpndCwNCj4gPiArCQkJICAgICAgIGNvbnN0
IGVudW0geGVfZ3RfZHJ2X2Vycl90eXBlIGVycik7DQo+ID4gKw0KPiA+ICAjZW5kaWYNCj4gPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X3R5cGVzLmgNCj4gPiBiL2RyaXZl
cnMvZ3B1L2RybS94ZS94ZV9ndF90eXBlcy5oDQo+ID4gaW5kZXggZDQzMTBiZTNlMWU3Li40NjQ1
ZWE5Yjc4OTMgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X3R5cGVz
LmgNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3RfdHlwZXMuaA0KPiA+IEBAIC0y
NCw2ICsyNCwxMyBAQCBlbnVtIHhlX2d0X3R5cGUgew0KPiA+ICAJWEVfR1RfVFlQRV9NRURJQSwN
Cj4gPiAgfTsNCj4gPg0KPiA+ICsjZGVmaW5lIFhFX0dUX0RSVl9FUlJfTUFYCTMNCj4gPiArZW51
bSB4ZV9ndF9kcnZfZXJyX3R5cGUgew0KPiA+ICsJWEVfR1RfRFJWX0VSUl9HVUNfQ09NTSwNCj4g
PiArCVhFX0dUX0RSVl9FUlJfRU5HSU5FLA0KPiA+ICsJWEVfR1RfRFJWX0VSUl9PVEhFUlMNCj4g
PiArfTsNCj4gPiArDQo+ID4gICNkZWZpbmUgWEVfTUFYX0RTU19GVVNFX1JFR1MJMw0KPiA+ICAj
ZGVmaW5lIFhFX01BWF9FVV9GVVNFX1JFR1MJMQ0KPiA+DQo+ID4gQEAgLTM0Nyw2ICszNTQsOSBA
QCBzdHJ1Y3QgeGVfZ3Qgew0KPiA+ICAJCS8qKiBAb29iOiBiaXRtYXAgd2l0aCBhY3RpdmUgT09C
IHdvcmthcm91ZG5zICovDQo+ID4gIAkJdW5zaWduZWQgbG9uZyAqb29iOw0KPiA+ICAJfSB3YV9h
Y3RpdmU7DQo+ID4gKw0KPiA+ICsJLyoqIEBkcnZfZXJyX2NudDogZHJpdmVyIGVycm9yIGNvdW50
ZXIgZm9yIHRoaXMgR1QgKi8NCj4gPiArCXUzMiBkcnZfZXJyX2NudFtYRV9HVF9EUlZfRVJSX01B
WF07DQo+IA0KPiBzaG91bGQgdGhpcyBiZSB1bnNpZ25lZCBsb25nPw0KDQpBcmUgd2UgZXhwZWN0
aW5nIHRoaXMgdG8gb3ZlcmZsb3c/IEZvciBleHRyZW1lIHNhZmV0eSB3ZSBjYW4gcHV0LCBidXQg
SSB0aGluayBwcmFjdGljYWxseSBpdCBtYXkgbmV2ZXIgb3ZlcmZsb3cuDQoNClRoYW5rcywNClRl
amFzDQoNCj4gDQo+IFRoYW5rcywNCj4gQXJhdmluZC4NCj4gPiAgfTsNCj4gPg0KPiA+ICAjZW5k
aWYNCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3RpbGUuYw0KPiA+IGIv
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX3RpbGUuYyBpbmRleCAxMzE3NTJhNTdmNjUuLjcwOGRkMzg1
ZjJiMSAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfdGlsZS5jDQo+ID4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3RpbGUuYw0KPiA+IEBAIC03MSw2ICs3MSwyNCBA
QA0KPiA+ICAgKiAgLSBNT0NTIGFuZCBQQVQgcHJvZ3JhbW1pbmcNCj4gPiAgICovDQo+ID4NCj4g
PiArLyoqDQo+ID4gKyAqIHhlX3RpbGVfcmVwb3J0X2RyaXZlcl9lcnJvciAtIENvdW50IGRyaXZl
ciBlcnJvciBmb3IgdGlsZQ0KPiA+ICsgKiBAdGlsZTogVGlsZSB0byBjb3VudCBlcnJvciBmb3IN
Cj4gPiArICogQGVycjogZW51bSBlcnJvciB0eXBlDQo+ID4gKyAqDQo+ID4gKyAqIEluY3JlbWVu
dCB0aGUgZHJpdmVyIGVycm9yIGNvdW50ZXIgaW4gcmVzcGVjdGl2ZSBlcnJvcg0KPiA+ICsgKiBj
YXRlZ29yeSBmb3IgdGhpcyB0aWxlLg0KPiA+ICsgKg0KPiA+ICsgKiBSZXR1cm5zIHZvaWQuDQo+
ID4gKyAqLw0KPiA+ICt2b2lkIHhlX3RpbGVfcmVwb3J0X2RyaXZlcl9lcnJvcihzdHJ1Y3QgeGVf
dGlsZSAqdGlsZSwNCj4gPiArCQkJCSBjb25zdCBlbnVtIHhlX3RpbGVfZHJ2X2Vycl90eXBlIGVy
cikgew0KPiA+ICsJeGVfYXNzZXJ0KHRpbGVfdG9feGUodGlsZSksIGVyciA+PSBBUlJBWV9TSVpF
KHRpbGUtPmRydl9lcnJfY250KSk7DQo+ID4gKwlXUklURV9PTkNFKHRpbGUtPmRydl9lcnJfY250
W2Vycl0sDQo+ID4gKwkJICAgUkVBRF9PTkNFKHRpbGUtPmRydl9lcnJfY250W2Vycl0pICsgMSk7
IH0NCj4gPiArDQo+ID4gIC8qKg0KPiA+ICAgKiB4ZV90aWxlX2FsbG9jIC0gUGVyZm9ybSBwZXIt
dGlsZSBtZW1vcnkgYWxsb2NhdGlvbg0KPiA+ICAgKiBAdGlsZTogVGlsZSB0byBwZXJmb3JtIGFs
bG9jYXRpb25zIGZvciBkaWZmIC0tZ2l0DQo+ID4gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfdGls
ZS5oIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3RpbGUuaCBpbmRleA0KPiA+IDc4MmM0N2Y4YmQ0
NS4uMDkyYTZiMTdhOTdlIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV90
aWxlLmgNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfdGlsZS5oDQo+ID4gQEAgLTE0
LDUgKzE0LDcgQEAgaW50IHhlX3RpbGVfYWxsb2Moc3RydWN0IHhlX3RpbGUgKnRpbGUpOyAgaW50
DQo+ID4geGVfdGlsZV9pbml0X25vYWxsb2Moc3RydWN0IHhlX3RpbGUgKnRpbGUpOw0KPiA+DQo+
ID4gIHZvaWQgeGVfdGlsZV9taWdyYXRlX3dhaXQoc3RydWN0IHhlX3RpbGUgKnRpbGUpOw0KPiA+
ICt2b2lkIHhlX3RpbGVfcmVwb3J0X2RyaXZlcl9lcnJvcihzdHJ1Y3QgeGVfdGlsZSAqdGlsZSwN
Cj4gPiArCQkJCSBjb25zdCBlbnVtIHhlX3RpbGVfZHJ2X2Vycl90eXBlIGVycik7DQo+ID4NCj4g
PiAgI2VuZGlmDQo=
