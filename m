Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 848F1C5478C
	for <intel-xe@archiver.kernel.org>; Mon, 26 Feb 2024 18:11:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 117C910ED41;
	Mon, 26 Feb 2024 18:11:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P6AXUf5V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 198D110ED41
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Feb 2024 18:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708971069; x=1740507069;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Gr+OmEHnYMoKOqsJptYAMW+AYdJNVyU6C9/zRJmwwR4=;
 b=P6AXUf5Vb2gOSIZvEWWYXS+70CjbmPubWdEHULZQbQ2FpeYjzQ/VXIbU
 8zCavfPOQlARjAMLNPkZVuL1TlxMpwME7pOiuV8PT7/ga+YAJosMamESD
 jWAh2cr7lla0pTqsKiHijLRNrd/iogmBVvlHyZI+uCyaxpHc4G8ZjSKqL
 pQNqpTFRKqShV/SKoLTa1HyotFwE0fHDR0uIt+6Anjiy69D9XZ2oRS/gI
 HGb0WuUD81rDM1eriLI65WHQHlo3o7K000h2UO4EOt69yPWjgC9zkUCss
 QBrMI9ZfYueUyIc4G+4tbapPtgzRlm2IC3XF7ybZXdTfZlSR6RA799All g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="3134951"
X-IronPort-AV: E=Sophos;i="6.06,186,1705392000"; 
   d="scan'208";a="3134951"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2024 10:11:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,186,1705392000"; 
   d="scan'208";a="6956550"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Feb 2024 10:10:37 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 26 Feb 2024 10:10:36 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 26 Feb 2024 10:10:35 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 26 Feb 2024 10:10:35 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 26 Feb 2024 10:10:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NzvQ3EIZyqbhMNGFaziTgEw4TSMoCEveNOMGi0UZWjZVBpO2EWBisASUlZ9v39gRAINvH+hbL5J1PGuxRNHnHgOhRP171gZxB3bcLXQVsaH1JA28YMqqftWKSm4UUBpq1loPJanswonO+k+xUGIcnbM5i5DbH7ELtBgTP9EwOGdS66Cy5lP/mhp3Rxfl0PANr3Olvkrnt+qKGFPbusF9Sufa54QL5cQ5WxIoFapgGQIP+c9XJKMPAbT0X9Rbhnl/PvyGIxxy9buHQhep8M5rYqdqgyfnwczCT3QAtBAIChUQW0Akymlla+we0d2wQty6epsQqGmBXBH5mlpnWneIUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gr+OmEHnYMoKOqsJptYAMW+AYdJNVyU6C9/zRJmwwR4=;
 b=Lj76EC8Ke4Ugzij6XjmVX8CvfLZaW5YVjrJ0C5dnTK7slO1N1TeafLqTU2B9WAIYcqcnvWNSmbEQU7OcgRyGGc/EeKRYXdMhhtog0/xVwDcMnK8GR5dFW8tBvG4QVfayoDCxGMc8vqPRckGqkh2/xeiW9hsYdp+TXUjrGdSy2dyD/vhJL+cM/y2YM6ieBLxfWOBmHZ5xwjgVHr1iUAG63isJWa1JHpWIKVTtovNdFRkSm/fj5PyLVRhHIVkA4a5eb5BYywfVLy/Bc9GMgn+DA4dEKiWs+yULxT/FPT1AIHDhQt8xadcAZ8rXYhomrB6vcuGa0u/3cJC1Wb6QkftjJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by SJ0PR11MB6742.namprd11.prod.outlook.com (2603:10b6:a03:47b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.22; Mon, 26 Feb
 2024 18:10:33 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::c563:8fb8:d95:71ac]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::c563:8fb8:d95:71ac%3]) with mapi id 15.20.7339.024; Mon, 26 Feb 2024
 18:10:33 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "dev@lankhorst.se" <dev@lankhorst.se>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH v2 1/3] drm/xe: Move lrc snapshot capturing to xe_lrc.c
Thread-Topic: [PATCH v2 1/3] drm/xe: Move lrc snapshot capturing to xe_lrc.c
Thread-Index: AQHaaMzfF75jU98XpEK2uw7CoLabsbEc7JAA
Date: Mon, 26 Feb 2024 18:10:33 +0000
Message-ID: <cae3348f378cbab91926a538cef3ecfebf9dfaff.camel@intel.com>
References: <20240226155913.77158-1-dev@lankhorst.se>
In-Reply-To: <20240226155913.77158-1-dev@lankhorst.se>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|SJ0PR11MB6742:EE_
x-ms-office365-filtering-correlation-id: 78958d40-8849-4bb4-19c6-08dc36f63969
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6+MBZe4q9+SWXdfn5y/SQqN8mdlTM7RVkwju/kDgvsuIKveIGf+r3lFwVuYXXFtspKxrPh+SJk1ffXFFDHkCVj4AtDNBA9nwWRGpLo8PmLppVecmVRgHql/3VUAcpsGY1/E1WBfqqFaD+I9jtRj12ZTczUkVMAUyUfgnoIiHgQYnq3hORgdo03tXrUq09dCCFJHyYDdlbGDeIplBmbbkltugkfgXeOFES4/DOg0h3dmdZh/U8O/4nrW2R9gZmyJRSY+mqsUOkbUW3po7qpcxRZrJT/qmX9C8VLcnRo8Ju/TrOgoXaxcVXW7Hw9NEzZV9zGW2ZnOyuwI/0Sttg45vxlveHXQY6aTpt/tpak/wTRnIKdO8XZ0r55ETzc3ST95SG2wPe+Aj/+QCwvHxUAhsvsJli1ZbIrwoYLzN+NFXZbSZ3bPz8bJdBsL0mrc9KbBfQLT21AFwZVtX2DubJ+czJ4FfWsmwqeFo/76PTRpggnNATa7DFW4FHQhyakk6O6BMGWKVTsjVTYa9gaCKfxM7J+pkdAl8XMg0oQVeml/+yuM4UTKig79WbJBy4Z31jXygV/x1k1k3Ho16I2nuUZuf0Yw9T5p0G8ZCDIVQtcaWz+zZBhPZ66JHdXrOiJHNzfXOZr7Y5DsnbHOoyJSlXcXu0dduqv9Q3yXwCNQc77kISDUgqrdAjvZAUTgqG/xtx8/Mx7ZNNmB84f6OH112M5CdCDBDJ2NiLHmvkS+PSGQ26CM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M0h3V1dLWVFBUm5IK3lOZmZKRGRITUpiZklUMGo0U293TmtLV0tQMTJqT0ZT?=
 =?utf-8?B?R1lYRjYvNVprbzFrbGlzYmFseUhLUkJsOHExMUlYc3l4SnNEV0dxR0JoZ29R?=
 =?utf-8?B?cmw2U0tOS2IrWGZxeFk4dElScm1xYjl6ZDRiUlZtT2l3bHFwMFVXdjllelFx?=
 =?utf-8?B?ZnFrTFdRMXBGQS9pR0RPdzRLWVRLaFR4VFpVcVRqcTJvUzZKNU0wRDdENGR5?=
 =?utf-8?B?bks1cjBqaS9nM0lDRDJBQlovdnp2THgrbHRjdnZOSWZuYWhMeWVzMkI0Tlc2?=
 =?utf-8?B?dTFUczJoTk01a2tOS0R2RDZzcDBNa0FTc0c3S2c2WC9tSUx5WTR5aklXRWI0?=
 =?utf-8?B?clBVUHRZeWpqQVNoUUR1ZGJ5THUyN1AwUVZ5QkQvZkpRSTNsSDlFalFpZWtm?=
 =?utf-8?B?eW0rQmRXNTAwSTIyYXBSaXdmQkxpbXkrYkhYWFdhNFcwOWJ1RmNqQkdQN1d3?=
 =?utf-8?B?c2NxaCs0M0xPZjVRakFEbFFucDhhWElpc3FjTlA2RklmQVhBb3NGcFVYRHEr?=
 =?utf-8?B?TGdMTkl6MkNLOENOWEkwYk1TVDRENG91aEEvaVpmQUV5YjRrdFR6Ny9KNTBx?=
 =?utf-8?B?OGxnS3VwNWMyRi9aRUZ0VjkzZDhSbGF5Mjl0R1N4VjdhUSszMFV1ZEx6RzJS?=
 =?utf-8?B?UzFWM05Yb2d4dHA1ZDIzMHF1Smlkc2VJcnhvWXo0V2g5NTFJR3lsaklNeXc3?=
 =?utf-8?B?THpwNFdqQTRWT1lYV1JTalpvdG9iMnNaeW5IaEpMWThpYnEyOTdhV2ZtVlVl?=
 =?utf-8?B?NmhEOTlRMEFoQThid2E5ajQyVThuSDVhNlpsRGViTWxlWEpaTFRuL25Ka045?=
 =?utf-8?B?bVRpS0o5SUg2K1dpck5vcWthV285d2NUbHJMbGg4ckFLZ0hPaGluQncvaGYw?=
 =?utf-8?B?VWROd1VKMjlBd09QT1kvOEJBejZTc1QyQ3dvRG1sT0VNU1ZrZGxNb1QzVlBp?=
 =?utf-8?B?eHZlQlpaVnh0SXloalJrRkdKdXZWRDBXeUpPOXk1VU5hREZSMys2b3VNWlZ6?=
 =?utf-8?B?U29rYUxFU1MwYU1OMi81dm9wT0V6Mk9OaDkvZlhTWVFNbWhiQjRJT3NmMmt3?=
 =?utf-8?B?M3h4WnVkTkZBN2h5R01kRzlvcm5EVGZxZ1VUb01YSGRKbGVSdGNiVjZwVjhX?=
 =?utf-8?B?YTJlMTV3c0FFbEVRa3UyR3pyUGVwVFBqQkhCaW53NGhTOHJMeTNtOHpaTi8z?=
 =?utf-8?B?b2RNZXhPOG16bHdjZlNad2JORCtNNksxd29BcGJpcEduM3lUTmZxNkc1WEFV?=
 =?utf-8?B?anFHWGs0Z2RpZjU1cUJVeDBqZWU2a0FTSFRjb3Q3UHNFWHdnZzhodHc5a2FP?=
 =?utf-8?B?YzEwaDlCUXhFYWIrY1h3d0dqL0x6Ujl5NHhpNnIrNXk2bzFudmRLZ2V3OWEy?=
 =?utf-8?B?MEZkQ096RkYzcTM4eUE2NXNLUlRmQW5GNnN1cCtQcGdaZEJrREdZOXNVSS9i?=
 =?utf-8?B?UE9ELzhPMW80dUFBUVJzWGZlay84WkNzSDN3UERCVTFocHVDNDB5bTJCQk95?=
 =?utf-8?B?eG1tcE1qZ1BFaXBKNVRVejJXdmhNZGVUeTZOYzdydUszamhqZ2VkQm1OdG14?=
 =?utf-8?B?NmNpRFpGZldmYXhrWGxEMmV2Y2RhVmRqR3dVVzBrSGUyWHNFSmg4YUVrbHQ5?=
 =?utf-8?B?emFSNWtDTGRGZHcvV1FpQ1ZaZ1dFOFZJbjdUT1hlemNnbHBxeUo3NVVodzRP?=
 =?utf-8?B?MTVFeGxFbUlQMjRoZmVuNXRUU1JLWE5WSU9lSU9uNE9YVDUycVVOajBPZFFn?=
 =?utf-8?B?cXV5UWlacWtUaEwveGxqQ0llSUxZZkFESHU2ei8zR21RUmx6RXhuYllzaHhz?=
 =?utf-8?B?U1ZJRGpDQ1FWb2FpM0RuOGEwNFY2MUNTLzFzTUYrZVM1U1V6VmpPRENIMFJD?=
 =?utf-8?B?TVBybWJCRDV1QVJIajZOb1BQeUsyN3Rta2dGZ3dEMmFlcW1aNWlObFUxTitS?=
 =?utf-8?B?d1B5VVZJVUxCcnl4YVRUU2RVakNUaTRJTFFlZUNzSHB2dWh0WEgzSU1tSk1W?=
 =?utf-8?B?eTlHV2N4ZG92VHZ3Sjg0SUpIeklvT0g4U3lKeStQS1o2WHk1STJNMnBrZU5F?=
 =?utf-8?B?VGlSdnlCSTV4OFBwYXBpU1VvaWs2Ymdqb0VvR0x2eHZNK2hoa2FtZXVZeHUw?=
 =?utf-8?B?MWg3Zk9KL1Q3U01MWVErL1QzYkdVTlFEdm4rbmpVWERXYUNmSmRFbnU0bm4w?=
 =?utf-8?B?Nmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <442180BF7971974FBB41498A64FC5603@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78958d40-8849-4bb4-19c6-08dc36f63969
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Feb 2024 18:10:33.2699 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: svy/SN1x+SBuueUyLZx8IyX3QxqftS6JpJQKOTw6kUHAt4Vbs5k2GKo3e9qsEXsO6v2kW1nUQmCoHeGcXetRKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6742
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gTW9uLCAyMDI0LTAyLTI2IGF0IDE2OjU5ICswMTAwLCBNYWFydGVuIExhbmtob3JzdCB3cm90
ZToNCj4gRnJvbTogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4Lmlu
dGVsLmNvbT4NCj4gDQo+IFRoaXMgYWxsb3dzIHRoZSBkdW1waW5nIG9mIEhXU1AgYW5kIEhXIENv
bnRleHQgd2l0aG91dCBleHBvcnRpbmcgbW9yZQ0KPiBmdW5jdGlvbnMuDQo+IA0KPiBDaGFuZ2Vz
IHNpbmNlIHYxOg0KPiAtIEdGUF9LRVJORUwgLT4gR0ZQX05PV0FJVC4gKFNvdXphKQ0KDQpSZXZp
ZXdlZC1ieTogSm9zw6kgUm9iZXJ0byBkZSBTb3V6YSA8am9zZS5zb3V6YUBpbnRlbC5jb20+DQoN
Cj4gDQo+IFNpZ25lZC1vZmYtYnk6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3Jz
dEBsaW51eC5pbnRlbC5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19z
dWJtaXQuYyAgICAgICB8IDMzICsrKysrKy0tLS0tLS0tLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0v
eGUveGVfZ3VjX3N1Ym1pdF90eXBlcy5oIHwgMTMgKy0tLS0tLQ0KPiAgZHJpdmVycy9ncHUvZHJt
L3hlL3hlX2xyYy5jICAgICAgICAgICAgICB8IDQ1ICsrKysrKysrKysrKysrKysrKysrKysrKw0K
PiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2xyYy5oICAgICAgICAgICAgICB8ICA0ICsrKw0KPiAg
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX2xyY190eXBlcy5oICAgICAgICB8ICAyICsrDQo+ICA1IGZp
bGVzIGNoYW5nZWQsIDYzIGluc2VydGlvbnMoKyksIDM0IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfc3VibWl0LmMgYi9kcml2ZXJzL2dw
dS9kcm0veGUveGVfZ3VjX3N1Ym1pdC5jDQo+IGluZGV4IGZmNzdiYzhkYTFiMi4uNzM0ODY4OWVj
NWFlIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX3N1Ym1pdC5jDQo+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfc3VibWl0LmMNCj4gQEAgLTE4MTQsMjEg
KzE4MTQsMTQgQEAgeGVfZ3VjX2V4ZWNfcXVldWVfc25hcHNob3RfY2FwdHVyZShzdHJ1Y3QgeGVf
c2NoZWRfam9iICpqb2IpDQo+ICAJc25hcHNob3QtPnNjaGVkX3Byb3BzLnByZWVtcHRfdGltZW91
dF91cyA9DQo+ICAJCXEtPnNjaGVkX3Byb3BzLnByZWVtcHRfdGltZW91dF91czsNCj4gIA0KPiAt
CXNuYXBzaG90LT5scmMgPSBrbWFsbG9jX2FycmF5KHEtPndpZHRoLCBzaXplb2Yoc3RydWN0IGxy
Y19zbmFwc2hvdCksDQo+ICsJc25hcHNob3QtPmxyYyA9IGttYWxsb2NfYXJyYXkocS0+d2lkdGgs
IHNpemVvZihzdHJ1Y3QgeGVfbHJjX3NuYXBzaG90ICopLA0KPiAgCQkJCSAgICAgIEdGUF9BVE9N
SUMpOw0KPiAgDQo+ICAJaWYgKHNuYXBzaG90LT5scmMpIHsNCj4gIAkJZm9yIChpID0gMDsgaSA8
IHEtPndpZHRoOyArK2kpIHsNCj4gIAkJCXN0cnVjdCB4ZV9scmMgKmxyYyA9IHEtPmxyYyArIGk7
DQo+ICANCj4gLQkJCXNuYXBzaG90LT5scmNbaV0uY29udGV4dF9kZXNjID0NCj4gLQkJCQlsb3dl
cl8zMl9iaXRzKHhlX2xyY19nZ3R0X2FkZHIobHJjKSk7DQo+IC0JCQlzbmFwc2hvdC0+bHJjW2ld
LmhlYWQgPSB4ZV9scmNfcmluZ19oZWFkKGxyYyk7DQo+IC0JCQlzbmFwc2hvdC0+bHJjW2ldLnRh
aWwuaW50ZXJuYWwgPSBscmMtPnJpbmcudGFpbDsNCj4gLQkJCXNuYXBzaG90LT5scmNbaV0udGFp
bC5tZW1vcnkgPQ0KPiAtCQkJCXhlX2xyY19yZWFkX2N0eF9yZWcobHJjLCBDVFhfUklOR19UQUlM
KTsNCj4gLQkJCXNuYXBzaG90LT5scmNbaV0uc3RhcnRfc2Vxbm8gPSB4ZV9scmNfc3RhcnRfc2Vx
bm8obHJjKTsNCj4gLQkJCXNuYXBzaG90LT5scmNbaV0uc2Vxbm8gPSB4ZV9scmNfc2Vxbm8obHJj
KTsNCj4gKwkJCXNuYXBzaG90LT5scmNbaV0gPSB4ZV9scmNfc25hcHNob3RfY2FwdHVyZShscmMp
Ow0KPiAgCQl9DQo+ICAJfQ0KPiAgDQo+IEBAIC0xODk0LDE4ICsxODg3LDkgQEAgeGVfZ3VjX2V4
ZWNfcXVldWVfc25hcHNob3RfcHJpbnQoc3RydWN0IHhlX2d1Y19zdWJtaXRfZXhlY19xdWV1ZV9z
bmFwc2hvdCAqc25hcHMNCj4gIAlkcm1fcHJpbnRmKHAsICJcdFByZWVtcHQgdGltZW91dDogJXUg
KHVzKVxuIiwNCj4gIAkJICAgc25hcHNob3QtPnNjaGVkX3Byb3BzLnByZWVtcHRfdGltZW91dF91
cyk7DQo+ICANCj4gLQlmb3IgKGkgPSAwOyBzbmFwc2hvdC0+bHJjICYmIGkgPCBzbmFwc2hvdC0+
d2lkdGg7ICsraSkgew0KPiAtCQlkcm1fcHJpbnRmKHAsICJcdEhXIENvbnRleHQgRGVzYzogMHgl
MDh4XG4iLA0KPiAtCQkJICAgc25hcHNob3QtPmxyY1tpXS5jb250ZXh0X2Rlc2MpOw0KPiAtCQlk
cm1fcHJpbnRmKHAsICJcdExSQyBIZWFkOiAobWVtb3J5KSAldVxuIiwNCj4gLQkJCSAgIHNuYXBz
aG90LT5scmNbaV0uaGVhZCk7DQo+IC0JCWRybV9wcmludGYocCwgIlx0TFJDIFRhaWw6IChpbnRl
cm5hbCkgJXUsIChtZW1vcnkpICV1XG4iLA0KPiAtCQkJICAgc25hcHNob3QtPmxyY1tpXS50YWls
LmludGVybmFsLA0KPiAtCQkJICAgc25hcHNob3QtPmxyY1tpXS50YWlsLm1lbW9yeSk7DQo+IC0J
CWRybV9wcmludGYocCwgIlx0U3RhcnQgc2Vxbm86IChtZW1vcnkpICVkXG4iLA0KPiAtCQkJICAg
c25hcHNob3QtPmxyY1tpXS5zdGFydF9zZXFubyk7DQo+IC0JCWRybV9wcmludGYocCwgIlx0U2Vx
bm86IChtZW1vcnkpICVkXG4iLCBzbmFwc2hvdC0+bHJjW2ldLnNlcW5vKTsNCj4gLQl9DQo+ICsJ
Zm9yIChpID0gMDsgc25hcHNob3QtPmxyYyAmJiBpIDwgc25hcHNob3QtPndpZHRoOyArK2kpDQo+
ICsJCXhlX2xyY19zbmFwc2hvdF9wcmludChzbmFwc2hvdC0+bHJjW2ldLCBwKTsNCj4gKw0KPiAg
CWRybV9wcmludGYocCwgIlx0U2NoZWR1bGUgU3RhdGU6IDB4JXhcbiIsIHNuYXBzaG90LT5zY2hl
ZHVsZV9zdGF0ZSk7DQo+ICAJZHJtX3ByaW50ZihwLCAiXHRGbGFnczogMHglbHhcbiIsIHNuYXBz
aG90LT5leGVjX3F1ZXVlX2ZsYWdzKTsNCj4gIA0KPiBAQCAtMTkzMCwxMCArMTkxNCwxNSBAQCB4
ZV9ndWNfZXhlY19xdWV1ZV9zbmFwc2hvdF9wcmludChzdHJ1Y3QgeGVfZ3VjX3N1Ym1pdF9leGVj
X3F1ZXVlX3NuYXBzaG90ICpzbmFwcw0KPiAgICovDQo+ICB2b2lkIHhlX2d1Y19leGVjX3F1ZXVl
X3NuYXBzaG90X2ZyZWUoc3RydWN0IHhlX2d1Y19zdWJtaXRfZXhlY19xdWV1ZV9zbmFwc2hvdCAq
c25hcHNob3QpDQo+ICB7DQo+ICsJaW50IGk7DQo+ICAJaWYgKCFzbmFwc2hvdCkNCj4gIAkJcmV0
dXJuOw0KPiAgDQo+IC0Ja2ZyZWUoc25hcHNob3QtPmxyYyk7DQo+ICsJaWYgKHNuYXBzaG90LT5s
cmMpIHsNCj4gKwkJZm9yIChpID0gMDsgaSA8IHNuYXBzaG90LT53aWR0aDsgaSsrKQ0KPiArCQkJ
eGVfbHJjX3NuYXBzaG90X2ZyZWUoc25hcHNob3QtPmxyY1tpXSk7DQo+ICsJCWtmcmVlKHNuYXBz
aG90LT5scmMpOw0KPiArCX0NCj4gIAlrZnJlZShzbmFwc2hvdC0+cGVuZGluZ19saXN0KTsNCj4g
IAlrZnJlZShzbmFwc2hvdCk7DQo+ICB9DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
eGUveGVfZ3VjX3N1Ym1pdF90eXBlcy5oIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19zdWJt
aXRfdHlwZXMuaA0KPiBpbmRleCA3MmZjMGY0MmIwYTUuLmRjNzQ1NmMzNDU4MyAxMDA2NDQNCj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19zdWJtaXRfdHlwZXMuaA0KPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX3N1Ym1pdF90eXBlcy5oDQo+IEBAIC02MSwxNyArNjEs
NiBAQCBzdHJ1Y3QgZ3VjX3N1Ym1pdF9wYXJhbGxlbF9zY3JhdGNoIHsNCj4gIAl1MzIgd3FbV1Ff
U0laRSAvIHNpemVvZih1MzIpXTsNCj4gIH07DQo+ICANCj4gLXN0cnVjdCBscmNfc25hcHNob3Qg
ew0KPiAtCXUzMiBjb250ZXh0X2Rlc2M7DQo+IC0JdTMyIGhlYWQ7DQo+IC0Jc3RydWN0IHsNCj4g
LQkJdTMyIGludGVybmFsOw0KPiAtCQl1MzIgbWVtb3J5Ow0KPiAtCX0gdGFpbDsNCj4gLQl1MzIg
c3RhcnRfc2Vxbm87DQo+IC0JdTMyIHNlcW5vOw0KPiAtfTsNCj4gLQ0KPiAgc3RydWN0IHBlbmRp
bmdfbGlzdF9zbmFwc2hvdCB7DQo+ICAJdTMyIHNlcW5vOw0KPiAgCWJvb2wgZmVuY2U7DQo+IEBA
IC0xMDksNyArOTgsNyBAQCBzdHJ1Y3QgeGVfZ3VjX3N1Ym1pdF9leGVjX3F1ZXVlX3NuYXBzaG90
IHsNCj4gIAl9IHNjaGVkX3Byb3BzOw0KPiAgDQo+ICAJLyoqIEBscmM6IExSQyBTbmFwc2hvdCAq
Lw0KPiAtCXN0cnVjdCBscmNfc25hcHNob3QgKmxyYzsNCj4gKwlzdHJ1Y3QgeGVfbHJjX3NuYXBz
aG90ICoqbHJjOw0KPiAgDQo+ICAJLyoqIEBzY2hlZHVsZV9zdGF0ZTogU2NoZWR1bGUgU3RhdGUg
YXQgdGhlIG1vbWVudCBvZiBDcmFzaCAqLw0KPiAgCXUzMiBzY2hlZHVsZV9zdGF0ZTsNCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9scmMuYyBiL2RyaXZlcnMvZ3B1L2RybS94
ZS94ZV9scmMuYw0KPiBpbmRleCA3YWQ4NTNiMDc4OGEuLjgyMzNkNDUxMmZjNiAxMDA2NDQNCj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2xyYy5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9scmMuYw0KPiBAQCAtMzEsNiArMzEsMTcgQEANCj4gICNkZWZpbmUgRU5HSU5FX0NM
QVNTX1NISUZUCQkJNjENCj4gICNkZWZpbmUgRU5HSU5FX0lOU1RBTkNFX1NISUZUCQkJNDgNCj4g
IA0KPiArc3RydWN0IHhlX2xyY19zbmFwc2hvdCB7DQo+ICsJdTMyIGNvbnRleHRfZGVzYzsNCj4g
Kwl1MzIgaGVhZDsNCj4gKwlzdHJ1Y3Qgew0KPiArCQl1MzIgaW50ZXJuYWw7DQo+ICsJCXUzMiBt
ZW1vcnk7DQo+ICsJfSB0YWlsOw0KPiArCXUzMiBzdGFydF9zZXFubzsNCj4gKwl1MzIgc2Vxbm87
DQo+ICt9Ow0KPiArDQo+ICBzdGF0aWMgc3RydWN0IHhlX2RldmljZSAqDQo+ICBscmNfdG9feGUo
c3RydWN0IHhlX2xyYyAqbHJjKQ0KPiAgew0KPiBAQCAtMTMwMCwzICsxMzExLDM3IEBAIHZvaWQg
eGVfbHJjX2VtaXRfaHdlX3N0YXRlX2luc3RydWN0aW9ucyhzdHJ1Y3QgeGVfZXhlY19xdWV1ZSAq
cSwgc3RydWN0IHhlX2JiICpiDQo+ICAJCWJiLT5sZW4gKz0gbnVtX2R3Ow0KPiAgCX0NCj4gIH0N
Cj4gKw0KPiArc3RydWN0IHhlX2xyY19zbmFwc2hvdCAqeGVfbHJjX3NuYXBzaG90X2NhcHR1cmUo
c3RydWN0IHhlX2xyYyAqbHJjKQ0KPiArew0KPiArCXN0cnVjdCB4ZV9scmNfc25hcHNob3QgKnNu
YXBzaG90ID0ga21hbGxvYyhzaXplb2YoKnNuYXBzaG90KSwgR0ZQX05PV0FJVCk7DQo+ICsNCj4g
KwlpZiAoIXNuYXBzaG90KQ0KPiArCQlyZXR1cm4gTlVMTDsNCj4gKw0KPiArCXNuYXBzaG90LT5j
b250ZXh0X2Rlc2MgPSBsb3dlcl8zMl9iaXRzKHhlX2xyY19nZ3R0X2FkZHIobHJjKSk7DQo+ICsJ
c25hcHNob3QtPmhlYWQgPSB4ZV9scmNfcmluZ19oZWFkKGxyYyk7DQo+ICsJc25hcHNob3QtPnRh
aWwuaW50ZXJuYWwgPSBscmMtPnJpbmcudGFpbDsNCj4gKwlzbmFwc2hvdC0+dGFpbC5tZW1vcnkg
PSB4ZV9scmNfcmVhZF9jdHhfcmVnKGxyYywgQ1RYX1JJTkdfVEFJTCk7DQo+ICsJc25hcHNob3Qt
PnN0YXJ0X3NlcW5vID0geGVfbHJjX3N0YXJ0X3NlcW5vKGxyYyk7DQo+ICsJc25hcHNob3QtPnNl
cW5vID0geGVfbHJjX3NlcW5vKGxyYyk7DQo+ICsJcmV0dXJuIHNuYXBzaG90Ow0KPiArfQ0KPiAr
DQo+ICt2b2lkIHhlX2xyY19zbmFwc2hvdF9wcmludChzdHJ1Y3QgeGVfbHJjX3NuYXBzaG90ICpz
bmFwc2hvdCwgc3RydWN0IGRybV9wcmludGVyICpwKQ0KPiArew0KPiArCWlmICghc25hcHNob3Qp
DQo+ICsJCXJldHVybjsNCj4gKw0KPiArCWRybV9wcmludGYocCwgIlx0SFcgQ29udGV4dCBEZXNj
OiAweCUwOHhcbiIsIHNuYXBzaG90LT5jb250ZXh0X2Rlc2MpOw0KPiArCWRybV9wcmludGYocCwg
Ilx0TFJDIEhlYWQ6IChtZW1vcnkpICV1XG4iLCBzbmFwc2hvdC0+aGVhZCk7DQo+ICsJZHJtX3By
aW50ZihwLCAiXHRMUkMgVGFpbDogKGludGVybmFsKSAldSwgKG1lbW9yeSkgJXVcbiIsDQo+ICsJ
CSAgIHNuYXBzaG90LT50YWlsLmludGVybmFsLCBzbmFwc2hvdC0+dGFpbC5tZW1vcnkpOw0KPiAr
CWRybV9wcmludGYocCwgIlx0U3RhcnQgc2Vxbm86IChtZW1vcnkpICVkXG4iLCBzbmFwc2hvdC0+
c3RhcnRfc2Vxbm8pOw0KPiArCWRybV9wcmludGYocCwgIlx0U2Vxbm86IChtZW1vcnkpICVkXG4i
LCBzbmFwc2hvdC0+c2Vxbm8pOw0KPiArfQ0KPiArDQo+ICt2b2lkIHhlX2xyY19zbmFwc2hvdF9m
cmVlKHN0cnVjdCB4ZV9scmNfc25hcHNob3QgKnNuYXBzaG90KQ0KPiArew0KPiArCWtmcmVlKHNu
YXBzaG90KTsNCj4gK30NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9scmMu
aCBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9scmMuaA0KPiBpbmRleCAyOGIxZDNmNDA0ZDQuLmQ2
ZGQ0MDQ1ZDZkNyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2xyYy5oDQo+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9scmMuaA0KPiBAQCAtNTUsNCArNTUsOCBAQCB2
b2lkIHhlX2xyY19kdW1wX2RlZmF1bHQoc3RydWN0IGRybV9wcmludGVyICpwLA0KPiAgDQo+ICB2
b2lkIHhlX2xyY19lbWl0X2h3ZV9zdGF0ZV9pbnN0cnVjdGlvbnMoc3RydWN0IHhlX2V4ZWNfcXVl
dWUgKnEsIHN0cnVjdCB4ZV9iYiAqYmIpOw0KPiAgDQo+ICtzdHJ1Y3QgeGVfbHJjX3NuYXBzaG90
ICp4ZV9scmNfc25hcHNob3RfY2FwdHVyZShzdHJ1Y3QgeGVfbHJjICpscmMpOw0KPiArdm9pZCB4
ZV9scmNfc25hcHNob3RfcHJpbnQoc3RydWN0IHhlX2xyY19zbmFwc2hvdCAqc25hcHNob3QsIHN0
cnVjdCBkcm1fcHJpbnRlciAqcCk7DQo+ICt2b2lkIHhlX2xyY19zbmFwc2hvdF9mcmVlKHN0cnVj
dCB4ZV9scmNfc25hcHNob3QgKnNuYXBzaG90KTsNCj4gKw0KPiAgI2VuZGlmDQo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfbHJjX3R5cGVzLmggYi9kcml2ZXJzL2dwdS9kcm0v
eGUveGVfbHJjX3R5cGVzLmgNCj4gaW5kZXggMjRmMjBlZDY2ZmQxLi5iNzE2ZGYwZGZiNGUgMTAw
NjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9scmNfdHlwZXMuaA0KPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0veGUveGVfbHJjX3R5cGVzLmgNCj4gQEAgLTQzLDQgKzQzLDYgQEAgc3Ry
dWN0IHhlX2xyYyB7DQo+ICAJc3RydWN0IHhlX2h3X2ZlbmNlX2N0eCBmZW5jZV9jdHg7DQo+ICB9
Ow0KPiAgDQo+ICtzdHJ1Y3QgeGVfbHJjX3NuYXBzaG90Ow0KPiArDQo+ICAjZW5kaWYNCg0K
