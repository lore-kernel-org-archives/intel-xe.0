Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98F67EB3633
	for <intel-xe@archiver.kernel.org>; Mon,  2 Mar 2026 20:50:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50E8710E5C3;
	Mon,  2 Mar 2026 20:50:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LgA2PTf1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B947210E5C3
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Mar 2026 20:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772484657; x=1804020657;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=HxuxFpxzpARe0zhQZ26m/qxH3kQ6fU9ArMMYSo57CnM=;
 b=LgA2PTf12H+4y4xB0c/Q8Ere926olwnHj2OATtnseH0sRtx+8O3joZzx
 rURdMeXFGBYWPStFFX3uvC2FsPkgHCIIchdisInSfffDaCYIWygij3ofk
 u1pN8XEQExfrWSpcIxIErlQXqTApqeCbu7BSmu0NFLzScPovvrTiQOZDt
 s5v9oAcJocZW+5w1mpVDhaYkCJOmgOS5yP/Q1+b/uUyfYOCNehXq6L5HG
 oWhZQ+YPQBK1QFju0vX2FtQI2vuEncGbvoI0p0u50cSEmyiLXxKl8HDLX
 uTVNYuWHb197OOemGQsVk+SFAH8qIBj1vskA6yWb+nVMvGYFhvYmO7lxX Q==;
X-CSE-ConnectionGUID: lS9gajNFTLOW5b2+G4LEeA==
X-CSE-MsgGUID: d/OIh6zIQJarFPzYLkBvSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="72535283"
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; d="scan'208";a="72535283"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 12:50:56 -0800
X-CSE-ConnectionGUID: XtzRBllZS2G1GkbGIC3Y4A==
X-CSE-MsgGUID: tr0rX3x1S7SGQ+vosWc1mA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; d="scan'208";a="215363571"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 12:50:56 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 2 Mar 2026 12:50:56 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 2 Mar 2026 12:50:56 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.27) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 2 Mar 2026 12:50:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YIBo2VR1+QeIuDtFW19lVQo5XjeSO8dtops2P6K/RFHldo2uiHw4uOjR1vDJYaIdFFesHK9JvzYh0mqwatDzLpy9ogQRyCr8g3nfYqM/rBH1Kvrn3bTU/xHuWCnRdkGSFye/7l5uMnnbmQfKhJYbX3KGoe+eZhT3jqgYRkdR11gm2uEHl/UqRrICp9wKlWLblmr2jSun/3t0iPG3JD9kGghXP8tWbMTPo347voQo8xzC/4YM2zUm8BVir48LYBj7UHH56MJMfEXsYULSuHd6xxHqdiLT8SG+WQfBhZ/VZzlLN/d9xXr9Py2HRm6s64o8frD7jmzbH4oZ6/PKC4pCPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HxuxFpxzpARe0zhQZ26m/qxH3kQ6fU9ArMMYSo57CnM=;
 b=CsFcCmlrWsJHgzu+6wQFAPwprcf9HYbzFT85IV2ELbWY1MBwT+HY0PpeXJ79tkBbTvLcT2tsoaat6gWX7ECVsIhe5RcyLzZ+R8HJ7lfkQdy41WPVvNIomEsYnM/FB/qk1o/jTwiCBkKMIJECGbOxFVdZTyXw8giOu5zpIh83Q/KgmgddYmfj1B+RZTQESeuSonP4ZUUbrBU9aDgBZedVLuh1gv71r4zo2stboWNtbQ04vFYhdycqVxmxauPpFixixz0uG/7d4g+EAKkZ+pxHY7iGPCyRZXetzq+hH8mEbumaXmqHxygWIEsc6suDblEbivH4xO1wKdxh5ZiKQ08KPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 DS7PR11MB7805.namprd11.prod.outlook.com (2603:10b6:8:ea::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.21; Mon, 2 Mar 2026 20:50:53 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415%4]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 20:50:53 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost, 
 Matthew" <matthew.brost@intel.com>
CC: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Yadav,
 Arvind" <arvind.yadav@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>, "Dugast, Francois"
 <francois.dugast@intel.com>
Subject: Re: [PATCH v3 04/25] drm/xe: Add job count to GuC exec queue snapshot
Thread-Topic: [PATCH v3 04/25] drm/xe: Add job count to GuC exec queue snapshot
Thread-Index: AQHcqFJ+dK7gR/eQcU+KAPtRv1TsULWbu94A
Date: Mon, 2 Mar 2026 20:50:53 +0000
Message-ID: <b6c4874417ec554fe18ba857a32c13f782b70383.camel@intel.com>
References: <20260228013501.106680-1-matthew.brost@intel.com>
 <20260228013501.106680-5-matthew.brost@intel.com>
In-Reply-To: <20260228013501.106680-5-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|DS7PR11MB7805:EE_
x-ms-office365-filtering-correlation-id: f2f36eca-3484-4038-fe95-08de789d653b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: mVYAro7ujx//9xcVOV1wsxI365URfK/IhrGHlpU//YNHBtaAyLLOiv2NY0q+KfceYogcSpaYIJ+BFs7Piw5QB7KsV2lvSpQPPpXHBbLXOnTiWOYF/hM7VAsTA2Wpnc0oRz8MpcoakWYwJrGe9m0oC+wwPAtqvunOFvT8ls548NRXV9Z9gi0E09sd6kd9joynhzDWhF7vCykOY1dZhroRFmO/TV9/FJaC0FS11jtrgeuf8oL44ENyhKigH/H/tgbMy9t61uzbA/RvsqS25PRmibyQ+8epJiNsEBLZtHZwthEf2MzAXV+yyCNUopaLQyD2zCZnymmXXNXw/tU1n4ljfdifr0cv0cLrfnuHmQujEC48cOmhDIio7K/4XayJ2cgraxeUIPqtdaibGnCJitiw/cmxUkeSG35X3+SbQKbFxNG5OS/wrsby5cGBJDwoon7j4en+khuhQdYeNa6LfaqKZdkHH9++w5EnUpbi/EbDwVo0dsY/MEgoQiyNZcnsVBhxEHJV5y0eEJ4Zce9OKSG9uSjKHla7/XL/e+EQAImbEmy9Z7P38RkGD4YNwEzvxr72Hdwrce+H3jAuW3aCWNxODWgOFNGz1FvZ1d0yhSLha0tSd95E987bjksnKyuq2QRyesG3pLmaTrh7/nEuRu4m5sdssTiK+IXpUPmmTKrfmrk7CXOIKqScZrG8y+wYLF1Yj1+/T9Bkns8CJseT+wx97B4tfORXgVXz5kthuXHCX2tLs5NKlBXL3xscT3F5y8gxW5PQDWK1uaKoxWme/mp+QbjR7oIcDwuXThI9SdR2rkk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y0x6Q3N1TkdVekNnTlJWbWZ2TmZFVHFGQWlXS0NNNE1zYlJnMkxaU1J1SG1X?=
 =?utf-8?B?aUdMblh2WGlhb3ZQbEVWWWlsZ3Iwc3VlZERwWnd5VmUyY0haa0NrWGE4aXdq?=
 =?utf-8?B?Z21tK1ZySUFwblljd0lDdGh2dmdvNU1EOWIzZm1BR1RrTFBLUHIwYWpDZ1RK?=
 =?utf-8?B?UlJLZkZidkt0blhYTjZ0b1NFUXZnL1BUK3JWQ1o3bDFaWTREcXJvYmFMUjJ0?=
 =?utf-8?B?VDMyUENMMWR3UklyQm0ySVJCU1JreE4vb08xMUE2ZWtkVlpQRVVpNFNNVGdr?=
 =?utf-8?B?VkxRWm5XWEZGNTJZNFdyZEpyV0tzY1JIeGE2b0xSdENxVjl3SXFxNnYvK3ow?=
 =?utf-8?B?RTNObWkyVzVvV2c2RXlka0pLNllIV2VZV3BsOStFYTdHanVGejFRYS9iQTRu?=
 =?utf-8?B?YmJmNkVoSE14Tld0VWJPSUxncFpJSnh4N2FhYlpyZkFKRk9UMlN1cW13K0NX?=
 =?utf-8?B?RE5qTUs2TkpobGVqdnArcnc0VElyOWVmR3d1RDkxSmp6R3JxdUxmRzJFaXdi?=
 =?utf-8?B?VVpCSVUvR2RCUEFxNGwzaHZ5WTc1SzI0N2dKcEFFZGlPdmQrSXFJdUJqU2U3?=
 =?utf-8?B?eFh4TS9XeDNzR1R2UlZvRjlhd2lncnJFcUdxNEVoS1JZc1oxaFZadVlwNGNT?=
 =?utf-8?B?TlBjM0VXcktLOFc4NWNQb29rY1N4ckdvTXFPaW82VFcvL2hMVmNzdmpiK25z?=
 =?utf-8?B?bjVONFhhNmtSSi9GbjV4b3pxRFI1L0FHVDhIdTB6ck00Sk1SOTNLeXJIVjZO?=
 =?utf-8?B?NU01L1FPbXE3RGFqUEJoL3VzcXZaaUkvR3JMeGhCNy9uQ2NBRVVDMUFlK3JW?=
 =?utf-8?B?UjVaOFpIVTdlT0xNZjRuOHB6ZDd2RDVRaE1neHdCbWg3M1l0SUk4QTF2cTdG?=
 =?utf-8?B?WEhXZWFHek94QUFyRlFSL3dBb0o5dzk0WjFvWnYxNUE0RlJqTkFtejRGbmxI?=
 =?utf-8?B?Q3BkTDR0TDFORHZIOTNuTkRpakt0a29pSTlKTnJJV0M5dktySmZSTldUMmRM?=
 =?utf-8?B?K0VvMER4SnV1OVBZK2Fyby93clZJR0U4d0VOOCt0b2VQVE9aSVJtVXRIZSth?=
 =?utf-8?B?ajVDU1pBeHJWMUI4NTRKbFBURDYyOHpTbTloS1lvajgzdjUyNjhMSldwQXBH?=
 =?utf-8?B?T250NUVXOXB0RVZyeFl4YmhkV0dWSWtuaHhwRnVqRnRZN0ZnVDk2MDRTZGhT?=
 =?utf-8?B?NUxBY0wwb2tkZWwraHNYRXMxSW90Y2xnRUduWTlhRGQvYzc4bVNXUk9TaVdK?=
 =?utf-8?B?cDBNS3p5dU5IYU9CMG1Da0hET3lqK3MxUlFNRnhUNmhERGVYZFZQa1pkUGFa?=
 =?utf-8?B?SW5GRktXL0RhWDhrVG5jK1BWKzJHMWdCVUU5Vjl3MUh5cVZlekZHeWZXM0tV?=
 =?utf-8?B?WFJ4VCtvT3Qvc28xYVhkZ2dGSE9YYTdzUzY5YUlBblVxT2NuSXNkbkx1SStX?=
 =?utf-8?B?TjM2QUNsWHZleW1TaW1NVk5CYmVDYzB3bXRJU2ptemZBMVF0QzdFT3dseWVI?=
 =?utf-8?B?aGZ3WU9ndXZqWU9kWURxV0x3bm1RM3ptL2hFR0R5cTRONmdFeUM3QWcrM0x0?=
 =?utf-8?B?dEtJMkNNUTdFQjVDaFVqL3hydjh5K0VwUWdhbU9Ib3V3ay9BNnVyMWNtYnNH?=
 =?utf-8?B?b05CQkZFOFA1RnkvSFlraGJ6RXY3WXFiRkM4SVp2VU40c3N1ZXphSnAzNlpv?=
 =?utf-8?B?b0dPUUwwTkhYbENZMFVqSnNpbW9xWmo1eURBUndjRlFRRXB1Z2RjcHMvL1hI?=
 =?utf-8?B?ZTZWODMzZktlNS9MZUdSYVdBSzlCcHpIcE1Eemtmb0dvYlBleVNVM1dRK3o3?=
 =?utf-8?B?cTlCeWNweStnZ2YxR2hiS0RvT0JyZEpjRDg5VDRDS0o2b2xLYzFFWW9Qd3ZK?=
 =?utf-8?B?My8zK2FROXBzeGl0QWdUOStvVXBmbnBPdXdzdGNqc2FDbjl6NHA4N0twWmNn?=
 =?utf-8?B?UjRMcUpMRVdHSDR3OVFBZDRpWUdlUDZEeGNpVjUwMDFpRzhrd2FtamdyMGQ1?=
 =?utf-8?B?eGxGYnlTM3ArbmRPUkZ0VkpJTmI0MFBaZWJIZlF0emt5N29mTjlpOHNGcnkw?=
 =?utf-8?B?Nkd3RGdnMTV0aWQvMlErbFZ2eFVGYVFITjFrZkRJeTZBdzNla1dUT0wvUkxn?=
 =?utf-8?B?WUU2NnlsVHpRUzRQWVJ3cVdhWDR1Q3locEN0VGRRaUgybHJKaExPNG02bDJB?=
 =?utf-8?B?NktmUDRrMVNBT3NyQ0g1c3pNMlRGWkJpMW5WTzAvd0tZVjJwY3VkRklXTFJU?=
 =?utf-8?B?dERMbXhJYTN0SHptUTRSWkNVdFI1aVk5SUhlaE9PZThwOTJ0dEEyQjhlWUJw?=
 =?utf-8?B?RkNHbVVscTVHb0p4MDFGWXNOZkxqMi9jSFBsYzhLSE9wQ0h5V05HeTFrbThL?=
 =?utf-8?Q?/2wp3Rhbc5LZKI6g=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7B9BEFBB7FC28A49B077A0E5D73EFE07@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2f36eca-3484-4038-fe95-08de789d653b
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Mar 2026 20:50:53.6377 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1l8EbjfJV5t1Bcv5073EMQ2vk88vFKoEFZZVC1YtwPZbChITROXjQxaXuY8chwpnnSFBSS57EtR5mk7BNC3z5yTVVHMGUe8ULL8akR/9YWY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7805
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

T24gRnJpLCAyMDI2LTAyLTI3IGF0IDE3OjM0IC0wODAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOg0K
PiBBZGQgdGhlIGpvYiBjb3VudCB0byB0aGUgR3VDIGV4ZWMgcXVldWUgc25hcHNob3QsIGFzIHRo
aXMgaXMgdXNlZnVsDQo+IGRlYnVnIGluZm9ybWF0aW9uLg0KPiANCj4gU2lnbmVkLW9mZi1ieTog
TWF0dGhldyBCcm9zdCA8bWF0dGhldy5icm9zdEBpbnRlbC5jb20+DQoNClJldmlld2VkLWJ5OiBT
dHVhcnQgU3VtbWVycyA8c3R1YXJ0LnN1bW1lcnNAaW50ZWwuY29tPg0KDQo+IC0tLQ0KPiDCoGRy
aXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfc3VibWl0LmPCoMKgwqDCoMKgwqAgfCAyICsrDQo+IMKg
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19zdWJtaXRfdHlwZXMuaCB8IDIgKysNCj4gwqAyIGZp
bGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV9ndWNfc3VibWl0LmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3Vj
X3N1Ym1pdC5jDQo+IGluZGV4IGNhN2FhNGYzNThkMC4uNDUzYWY1MWZlODdiIDEwMDY0NA0KPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX3N1Ym1pdC5jDQo+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV9ndWNfc3VibWl0LmMNCj4gQEAgLTMyMDcsNiArMzIwNyw3IEBAIHhlX2d1
Y19leGVjX3F1ZXVlX3NuYXBzaG90X2NhcHR1cmUoc3RydWN0DQo+IHhlX2V4ZWNfcXVldWUgKnEp
DQo+IMKgwqDCoMKgwqDCoMKgwqBzbmFwc2hvdC0+bG9naWNhbF9tYXNrID0gcS0+bG9naWNhbF9t
YXNrOw0KPiDCoMKgwqDCoMKgwqDCoMKgc25hcHNob3QtPndpZHRoID0gcS0+d2lkdGg7DQo+IMKg
wqDCoMKgwqDCoMKgwqBzbmFwc2hvdC0+cmVmY291bnQgPSBrcmVmX3JlYWQoJnEtPnJlZmNvdW50
KTsNCj4gK8KgwqDCoMKgwqDCoMKgc25hcHNob3QtPmpvYmNvdW50ID0gYXRvbWljX3JlYWQoJnEt
PmpvYl9jbnQpOw0KPiDCoMKgwqDCoMKgwqDCoMKgc25hcHNob3QtPnNjaGVkX3RpbWVvdXQgPSBz
Y2hlZC0+YmFzZS50aW1lb3V0Ow0KPiDCoMKgwqDCoMKgwqDCoMKgc25hcHNob3QtPnNjaGVkX3By
b3BzLnRpbWVzbGljZV91cyA9IHEtDQo+ID5zY2hlZF9wcm9wcy50aW1lc2xpY2VfdXM7DQo+IMKg
wqDCoMKgwqDCoMKgwqBzbmFwc2hvdC0+c2NoZWRfcHJvcHMucHJlZW1wdF90aW1lb3V0X3VzID0N
Cj4gQEAgLTMyNzksNiArMzI4MCw3IEBAIHhlX2d1Y19leGVjX3F1ZXVlX3NuYXBzaG90X3ByaW50
KHN0cnVjdA0KPiB4ZV9ndWNfc3VibWl0X2V4ZWNfcXVldWVfc25hcHNob3QgKnNuYXBzDQo+IMKg
wqDCoMKgwqDCoMKgwqBkcm1fcHJpbnRmKHAsICJcdExvZ2ljYWwgbWFzazogMHgleFxuIiwgc25h
cHNob3QtDQo+ID5sb2dpY2FsX21hc2spOw0KPiDCoMKgwqDCoMKgwqDCoMKgZHJtX3ByaW50Zihw
LCAiXHRXaWR0aDogJWRcbiIsIHNuYXBzaG90LT53aWR0aCk7DQo+IMKgwqDCoMKgwqDCoMKgwqBk
cm1fcHJpbnRmKHAsICJcdFJlZjogJWRcbiIsIHNuYXBzaG90LT5yZWZjb3VudCk7DQo+ICvCoMKg
wqDCoMKgwqDCoGRybV9wcmludGYocCwgIlx0Sm9iIGNvdW50OiAlZFxuIiwgc25hcHNob3QtPmpv
YmNvdW50KTsNCj4gwqDCoMKgwqDCoMKgwqDCoGRybV9wcmludGYocCwgIlx0VGltZW91dDogJWxk
IChtcylcbiIsIHNuYXBzaG90LQ0KPiA+c2NoZWRfdGltZW91dCk7DQo+IMKgwqDCoMKgwqDCoMKg
wqBkcm1fcHJpbnRmKHAsICJcdFRpbWVzbGljZTogJXUgKHVzKVxuIiwNCj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNuYXBzaG90LT5zY2hlZF9wcm9wcy50aW1lc2xpY2Vf
dXMpOw0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19zdWJtaXRfdHlw
ZXMuaA0KPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfc3VibWl0X3R5cGVzLmgNCj4gaW5k
ZXggNWNjYzVmOTU5YmIzLi41MjlkNGIxZjgzZmMgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS94ZS94ZV9ndWNfc3VibWl0X3R5cGVzLmgNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hl
L3hlX2d1Y19zdWJtaXRfdHlwZXMuaA0KPiBAQCAtNzcsNiArNzcsOCBAQCBzdHJ1Y3QgeGVfZ3Vj
X3N1Ym1pdF9leGVjX3F1ZXVlX3NuYXBzaG90IHsNCj4gwqDCoMKgwqDCoMKgwqDCoHUxNiB3aWR0
aDsNCj4gwqDCoMKgwqDCoMKgwqDCoC8qKiBAcmVmY291bnQ6IHJlZiBjb3VudCBvZiB0aGlzIGV4
ZWMgcXVldWUgKi8NCj4gwqDCoMKgwqDCoMKgwqDCoHUzMiByZWZjb3VudDsNCj4gK8KgwqDCoMKg
wqDCoMKgLyoqIEBqb2Jjb3VudDogam9iIGNvdW50IG9mIHRoaXMgZXhlYyBxdWV1ZSAqLw0KPiAr
wqDCoMKgwqDCoMKgwqB1MzIgam9iY291bnQ7DQo+IMKgwqDCoMKgwqDCoMKgwqAvKioNCj4gwqDC
oMKgwqDCoMKgwqDCoCAqIEBzY2hlZF90aW1lb3V0OiB0aGUgdGltZSBhZnRlciB3aGljaCBhIGpv
YiBpcyByZW1vdmVkIGZyb20NCj4gdGhlDQo+IMKgwqDCoMKgwqDCoMKgwqAgKiBzY2hlZHVsZXIu
DQoNCg==
