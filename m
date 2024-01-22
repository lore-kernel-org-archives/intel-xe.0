Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEB5CC47DD3
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jan 2024 18:43:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F56210E123;
	Mon, 22 Jan 2024 18:43:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A59110E5AB
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Jan 2024 18:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705949025; x=1737485025;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=WWiP+CdvdJ/xV4Y1CobjDAdLD+c63KBO6IGzU2j1Rog=;
 b=hzmSce2mGOYJ500FPsKwC1p1n1SKuNgXCJ/S9jaFvsxq8cV8Y0bo1/y3
 gmax70Anq7H8rBoZOls831IlajKHcr7blQ3cUQ9YvPdEyYiaVB+3XdTGO
 cMt29ox05EaVOhUD/wH40MgAW7u+KICFJhpu2Iug7AVqZujNvH/O3uMzK
 f3SPUNql8VPWOWtY794AawIu/D66uIa0y0S8oJ+fS7LKHl2aipdKLAgYS
 hnqeXT2o/C9fHFRyWHC9LcWdUG9IW4ZvWbzIfaD1QfgtEvn4jVhlnYhOa
 YD0fBOSzZjNUqOitzwwvelJP/AVN3GYSxjgfP1ToBoVUa4tDar/N1oKXZ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="8689682"
X-IronPort-AV: E=Sophos;i="6.05,212,1701158400"; 
   d="scan'208";a="8689682"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 10:43:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,212,1701158400"; 
   d="scan'208";a="1382970"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Jan 2024 10:43:45 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Jan 2024 10:43:44 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Jan 2024 10:43:43 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 22 Jan 2024 10:43:43 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 22 Jan 2024 10:43:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hyk6ANIacuFWXHHHWfZO5BAtrSEpTiMoqoCWWWp31LmflX8YqFuKmj9BUC9Ro1KEuvaKOH8rd/QbtZOAbrsNRffnnnp+IsJ/GHBQXNRdBPsIK53ij3suUHWuSpbq3NGnhV19QBd4aYuHzMbIWdzcfaefI/o7xCfWSlYO2Pwv/iu3lfzx56bqfDSDVlxVXV+PNF5hFaguitTr6noIcW+op3n7SBAtB2fICW7NZFxzmp2BpksxIQCKs88++qCP8TPapYXE0vpuPR/IdNsYBydqTDfInACn/pzLaLNKSsZKFx96bH1f868vPI4zH5mgn+yqdVBt7Z+Y/qun4wFbJCM8XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WWiP+CdvdJ/xV4Y1CobjDAdLD+c63KBO6IGzU2j1Rog=;
 b=gvMX+5zY3yG48Pup346NqnKAMtS48ixPjvB0qkq1d08op3jFF5fOm5cE6+eTem1RfyraIh44tb8OuZGeP/zcx0i9hFTe4qyNZKu4fuOsHnGqZfyhwvLFAtAx1wt6Ye4a8JK7grLTAweucZmnP/WY85DrqnorkYRt0GNLvaN8MsM1KiOf0ac8bCfa66nGAUPRDBoAeY9C47U1BM8vhz2iUgSc+4hYrKQoZ0eQl0+2uz8M+R9MN2bxqRS2B/Qu34Lr2AYuK3nKr7s2+SD+crH/rRobQvpv4l++UuXfkhKa+uQXaJxGYB5Uo0fMh0b81O0ZtidyhaaC7ESstm/8MYqe1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by MN6PR11MB8145.namprd11.prod.outlook.com (2603:10b6:208:474::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.32; Mon, 22 Jan
 2024 18:43:42 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::98c3:e090:252e:7967]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::98c3:e090:252e:7967%4]) with mapi id 15.20.7202.034; Mon, 22 Jan 2024
 18:43:42 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 3/9] drm/xe: Add functions to convert regular address to
 canonical address and back
Thread-Topic: [PATCH 3/9] drm/xe: Add functions to convert regular address to
 canonical address and back
Thread-Index: AQHaTVUpl56fksLIN0yAQQ7OJUif3bDmKc2AgAABXIA=
Date: Mon, 22 Jan 2024 18:43:42 +0000
Message-ID: <5749b3be988a6e8e6b2c5330d817e32abba44b4c.camel@intel.com>
References: <20240122170445.108856-1-jose.souza@intel.com>
 <20240122170445.108856-3-jose.souza@intel.com>
 <ac8c0487457d8f6b7085f7fe9aec23472aff8587.camel@intel.com>
In-Reply-To: <ac8c0487457d8f6b7085f7fe9aec23472aff8587.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|MN6PR11MB8145:EE_
x-ms-office365-filtering-correlation-id: 45d69582-58f5-4ab5-85a1-08dc1b7a0e72
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SP4w60VaooO/amdvW5+yp1ke/ZeEpaOr8199Flzwbz8kj0NincvcAPIX2g808l1KTYBbh0L9ZmFpN8syoIW/gtxeq5ctZB5XFSvRwkd2ZTyxs0qx8xKWWvQ+2RJe05NEpFtur/w6p1QantUd8NuKxiGV6scUhj27oT8gBV9sACKxgSsfZXLs/dnXxdwahMnqcjUeIMf8pvFX8H6sQLgQruU/fuu2H0nSyqwA2mSh/Tz2ro1wmMFxRlcFSYwfRSaCMfjBuhD/ou/HjUn5C99rYlvwshcqJEqOWZptaZYWhoOXxHgw/NU/DepnQKuNas7yv9BL/1b6gRsNILwd/Hz1Zp0k0K/kJ+UxS7EtCmBlb/lRUjPe9asQHeSHP8fEEEx97h47ZP+XQYjJjCQhB0kv2sbrw2fis2Ukcei0F9+pUDwC7nRnoY4spmT0SJRqnUMjzlRthyzES9rNgrRreL3pw1j6ODDG/7yCqbe7GK8oBexzRiuapa1cD2s5OfuEOLlt8UWuGvO59fe/fCXBLxCz35WB2Po2uksq/ZyRQKR+c1mwX1Jgcg/6zeUrR9NU/MMe0Cnz1UYoUu554yQwPtu4u306tB6fnzrmPJ87dLWcCq6oVrMaQXb9uiqB40W3UJBS
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(396003)(136003)(376002)(346002)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(83380400001)(38070700009)(86362001)(82960400001)(36756003)(122000001)(91956017)(8936002)(8676002)(4326008)(2616005)(38100700002)(26005)(71200400001)(107886003)(6512007)(64756008)(66556008)(54906003)(110136005)(316002)(6486002)(66946007)(66476007)(76116006)(66446008)(5660300002)(6506007)(478600001)(2906002)(41300700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y1hzbU83Z09hV3pmZitkeTkzYytEL09Pd1BhV0RMcDc3VlFDSW5xdG9ucnlT?=
 =?utf-8?B?blJWU25xQm5mY090T0NsNVFIYmxnSVdmODlORlBkbUhaQ0VxbWNrR0NuLzN5?=
 =?utf-8?B?ZHhITndmQmNmNXcwak4zbVplMWFMakNndk5Pdy9ueGVuNkVNQjBjaHNFSi83?=
 =?utf-8?B?RDZkbGhjdHpKTlA3OXR5RG5LaDI3WmViV05JTEU3K0JWMXVaSnlOWW5iS0dx?=
 =?utf-8?B?UDZuaFc5dlB3OXhibUZ1R2JsMDNPNHYyTzZ6cHprMGl1UlJyeVhYK212aGlE?=
 =?utf-8?B?UjdEd2lhTmJXM3BYd2lXTTNKL2Y0MWN2TkRPbXdwdVVoNXp1b0RMU2JLMnND?=
 =?utf-8?B?eEdyQlR5UExBMU5oeXBPbVpZcDEwa0lXUHlaNnJObkJFS05LZGhlYUljaUd1?=
 =?utf-8?B?OEJMQTBnaDBrR0dReEtZOWZ0RTlSWStBVkp6ekpxY2lPZ0xaT1lGM2lUMm1I?=
 =?utf-8?B?YU9HN3QyOCtycWh3NlpUeDRONTZwdXMxSEJFNzJZdHVFZTE3OFc1ZlozeTNP?=
 =?utf-8?B?czQyS1ZqNG9kSUptN0RVVnNyNjBUYVQyQ0lDTzZHdkg4Qkd2VUF1YXRDTUhO?=
 =?utf-8?B?MWQzV1VjbWg3NFQvNGZZejRoTzdIYUJHZnRPSnN4Ynk5T2pGSUFURFZFcFNQ?=
 =?utf-8?B?WkEyMkJxUFJLM3p6ZzZNOWNVdTFSRTNxMmMvY0o3anI3OGxUWjZDWnFZVzFW?=
 =?utf-8?B?UmlDc1J6dUIzaEZPZ1JHNWNaKzlGVEtkeFF4SVc5akw5eCs5eTNhOGg3RVk3?=
 =?utf-8?B?aDdnNWFNLzJIc0tlcjNtTi9yR2ltNnV0eWhaRTJmeWt0eVJyYzJQTTg5Yisv?=
 =?utf-8?B?clAyWVl1akNLb1VJWGdaUENuM0FONzNtbnkyVUxZVmNtRTg1aHRoZUpzUnFp?=
 =?utf-8?B?REozSkFBRnR3YnhoSXJCWFgxclgrWGV0bXdjRFovVzZHTFlkTEkyeHZwSUl2?=
 =?utf-8?B?UGpaMEoyUjFmekxnOTd0dytzeVdVTHVIWmU5L3hsV2YyQkpvbi94N21vN2Y3?=
 =?utf-8?B?OFQ0K0xCY3FybmJWZnNUMmFGY2JnRWJ3VnRsQzVzb1E2eVY0emx0WktQWWpB?=
 =?utf-8?B?UGdSbmQ0ZUdaNDNSYW0rZ2JtSzVLMXB2NHNOakJGVkpzd3lrT01hOXRrdWdi?=
 =?utf-8?B?RlNSeWVVbENEY1ZWMUFDbVNJOWQ5ZFI5SUpkT1ZOOWE0SDNWaDBBdEl1ZjRo?=
 =?utf-8?B?MUhxVjBwVi9DWi9PVU5lU09aTndSeExWQXVWMGNGeTlUTkZnQTRkaTdGQzlU?=
 =?utf-8?B?MWpFUXZ1dFVJOWRSOHdjT3luanFRYzdPU2RlNUZ2eCt4TEl3UnFlTncva2tM?=
 =?utf-8?B?Kzd1dGhYRS9kYUNGM3Jhb0xZcU1QYVVMSjhyT0dKN1BUc0E3RFM1aWdlSmJU?=
 =?utf-8?B?aTBiM1RVRHBsbFEwUGVjT0o1amltVGpFRC82eUxoV3c0YUd5QlRTSUVRUFNy?=
 =?utf-8?B?UXZUSGZjN3huQW5IWmlTZDdKSUp3Sy9KdVVoYnVPWUlKbFZkVjFPOTRPVk9E?=
 =?utf-8?B?NzN4VVVRMm9yN2ZnSjV4eXJNZjRzVFpVclJ6eDR4VDQzWWVRcElqSkt2cUwx?=
 =?utf-8?B?MFQ3OWhERS9nR293THpSR2Z4TGdaMXc0SitmVFJmSWh2amRmeUJnWlN0VENQ?=
 =?utf-8?B?NUhrL25tSHg5amNCSDA5b2Z0bnFXZWZOZEJNUVpJaGtIaENOQXYvYnJzc21l?=
 =?utf-8?B?cFJBSWlEa3drTlF6Rk5oNUZKdHVmSzVSVW9nQ1RMVmthN1hkWkQ4N3o3RnQw?=
 =?utf-8?B?VUg5SDZhNEdvMnRwczJoZzRYajdEdHpsaXgzWVFxUEFITnB5MkU4d3cxa2JD?=
 =?utf-8?B?RXkzdzcxaE1qY1c5MnRzTWJ3TVBHV2t1NlQveTZlZjlsRmF0YWcxSE9Cc1hj?=
 =?utf-8?B?dmgyMmlmdTI3M3VKbVJoTXM3V2lQSUZNVEtMVnBQZ1VMMDFzWmRudGkreGFM?=
 =?utf-8?B?UjlEbXc1bmZCZm5Eck1oSDk3QUlkQnJpM0tjNGR3QTF5MFdYWXo0c3UyMnIr?=
 =?utf-8?B?aTlBSnhPc2d2V3Q1MWNJNm4xeXJvK3BOQXZCRTVSRWthQTF5U2RqZ2R2eWU2?=
 =?utf-8?B?UWRrNlhOa1N6d2hNSDhTZmd3clhlcUtqL3pONXhwbG5NaHQwdk9Pb0IwRGRL?=
 =?utf-8?B?a3BJZlR2Q3lYNmJGaUJHemg5azg0RTJaSm5GSmpiQ2ZUL0ROMnVlRFVrQ1NO?=
 =?utf-8?B?c1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DAF61BD2648B73439D825854844937EA@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45d69582-58f5-4ab5-85a1-08dc1b7a0e72
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2024 18:43:42.1618 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZO+K72oWWGsJHMoyKvhVOS7cupepY3LrZ0EL8IRmAX2fhGtHMIgix9WUxI8/au5+Xy8a2NcKdHQIKAiOs6illw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8145
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
Cc: "dev@lankhorst.se" <dev@lankhorst.se>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gTW9uLCAyMDI0LTAxLTIyIGF0IDE4OjM4ICswMDAwLCBTdW1tZXJzLCBTdHVhcnQgd3JvdGU6
DQo+IE9uIE1vbiwgMjAyNC0wMS0yMiBhdCAwOTowNCAtMDgwMCwgSm9zw6kgUm9iZXJ0byBkZSBT
b3V6YSB3cm90ZToNCj4gPiBTb21lIGluc3RydWN0aW9ucyByZXF1aXJlcyBjYW5vbmljYWwgYWRk
cmVzcyBsaWtlDQo+ID4gTUlfQkFUQ0hfQlVGRkVSX1NUQVJUKFVNRHMgbXVzdCBjYWxsIHhlX2V4
ZWMgd2l0aCBhIGNhbm9uaWNhbCBhZGRyZXNzDQo+ID4gZm9yIFhlMispLg0KPiA+IA0KPiA+IFNv
IGhlcmUgYWRkaW5nIGZ1bmN0aW9ucyB0byBjb252ZXJ0IHJlZ3VsYXIgYWRkcmVzcyB0byBjYW5v
bmljYWwNCj4gPiBhZGRyZXNzIGFuZCBiYWNrLCB0aGUgZmlyc3QgdXNlciBvZiB0aGlzIGZ1bmN0
aW9ucyB3aWxsIGJlIGFkZGVkDQo+ID4gaW4gdGhlIG5leHQgcGF0Y2hlcy4NCj4gPiANCj4gPiBD
YzogUm9kcmlnbyBWaXZpIDxyb2RyaWdvLnZpdmlAaW50ZWwuY29tPg0KPiA+IENjOiBNYWFydGVu
IExhbmtob3JzdCA8ZGV2QGxhbmtob3JzdC5zZT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBKb3PDqSBS
b2JlcnRvIGRlIFNvdXphIDxqb3NlLnNvdXphQGludGVsLmNvbT4NCj4gPiAtLS0NCj4gPiDCoGRy
aXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2UuYyB8IDE1ICsrKysrKysrKysrKysrKw0KPiA+IMKg
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZS5oIHzCoCAzICsrKw0KPiA+IMKgMiBmaWxlcyBj
aGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspDQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV9kZXZpY2UuYw0KPiA+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2Rldmlj
ZS5jDQo+ID4gaW5kZXggYWI0MTdmNGY3ZDJhNy4uYjRjZGNmMWIyMDgxYSAxMDA2NDQNCj4gPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlLmMNCj4gPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0veGUveGVfZGV2aWNlLmMNCj4gPiBAQCAtNzI3LDMgKzcyNywxOCBAQCB2b2lkIHhlX2Rl
dmljZV9tZW1fYWNjZXNzX3B1dChzdHJ1Y3QgeGVfZGV2aWNlDQo+ID4gKnhlKQ0KPiA+IMKgDQo+
ID4gwqDCoMKgwqDCoMKgwqDCoHhlX2Fzc2VydCh4ZSwgcmVmID49IDApOw0KPiA+IMKgfQ0KPiA+
ICsNCj4gPiArc3RhdGljIGlubGluZSBpbnQgaGlnaGVzdF9hZGRyZXNzX2JpdF9nZXQoc3RydWN0
IHhlX2RldmljZSAqeGUpDQo+ID4gK3sNCj4gPiArwqDCoMKgwqDCoMKgwqByZXR1cm4geGUtPmlu
Zm8uZG1hX21hc2tfc2l6ZSA+IDQ4ID8gNTcgOiA0NzsNCj4gDQo+IFdoeSBub3QganVzdCB4ZS0+
aW5mby5kbWFfbWFza19zaXplIC0gMT8NCg0KV2UgaGF2ZSBwbGF0Zm9ybXMgdGhhdCBzZXQgZG1h
X21hc2tfc2l6ZSB0byAzOSwgNDYgYW5kIDUyIGJ1dCB0aGUgY2Fub25pY2FsIGFkZHJlc3MgYm91
bmRhcmllcyBpcyA0OGJpdCBhbmQgNThiaXQgYml0cy4NCg0KPiANCj4gVGhhbmtzLA0KPiBTdHVh
cnQNCj4gDQo+ID4gK30NCj4gPiArDQo+ID4gK3U2NCB4ZV9kZXZpY2VfY2Fub25pY2FsaXplX2Fk
ZHIoc3RydWN0IHhlX2RldmljZSAqeGUsIHU2NCBhZGRyZXNzKQ0KPiA+ICt7DQo+ID4gK8KgwqDC
oMKgwqDCoMKgcmV0dXJuIHNpZ25fZXh0ZW5kNjQoYWRkcmVzcywgaGlnaGVzdF9hZGRyZXNzX2Jp
dF9nZXQoeGUpKTsNCj4gPiArfQ0KPiA+ICsNCj4gPiArdTY0IHhlX2RldmljZV91bmNhbm9uaWNh
bGl6ZV9hZGRyKHN0cnVjdCB4ZV9kZXZpY2UgKnhlLCB1NjQgYWRkcmVzcykNCj4gPiArew0KPiA+
ICvCoMKgwqDCoMKgwqDCoHJldHVybiBhZGRyZXNzICYgR0VOTUFTS19VTEwoaGlnaGVzdF9hZGRy
ZXNzX2JpdF9nZXQoeGUpLCAwKTsNCj4gPiArfQ0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0veGUveGVfZGV2aWNlLmgNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2Uu
aA0KPiA+IGluZGV4IGFmOGFjMmU5ZTI3MDkuLmNlMjBmNmZlNjIxOWEgMTAwNjQ0DQo+ID4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZS5oDQo+ID4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX2RldmljZS5oDQo+ID4gQEAgLTE3NSw0ICsxNzUsNyBAQCBzdGF0aWMgaW5saW5l
IGJvb2wgeGVfZGV2aWNlX2hhc19tZW1pcnEoc3RydWN0DQo+ID4geGVfZGV2aWNlICp4ZSkNCj4g
PiDCoA0KPiA+IMKgdTMyIHhlX2RldmljZV9jY3NfYnl0ZXMoc3RydWN0IHhlX2RldmljZSAqeGUs
IHU2NCBzaXplKTsNCj4gPiDCoA0KPiA+ICt1NjQgeGVfZGV2aWNlX2Nhbm9uaWNhbGl6ZV9hZGRy
KHN0cnVjdCB4ZV9kZXZpY2UgKnhlLCB1NjQgYWRkcmVzcyk7DQo+ID4gK3U2NCB4ZV9kZXZpY2Vf
dW5jYW5vbmljYWxpemVfYWRkcihzdHJ1Y3QgeGVfZGV2aWNlICp4ZSwgdTY0DQo+ID4gYWRkcmVz
cyk7DQo+ID4gKw0KPiA+IMKgI2VuZGlmDQo+IA0KDQo=
