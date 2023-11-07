Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C89AAC4332F
	for <intel-xe@archiver.kernel.org>; Tue,  7 Nov 2023 00:15:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E8D610E47D;
	Tue,  7 Nov 2023 00:15:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FE8210E47D
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Nov 2023 00:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699316104; x=1730852104;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=DfRR/XhrYBUdqidWE0XvBGlDIRRomss0wylYaRikFVk=;
 b=EVH3MNX/2tW+OfpmsnmJ9pEAiUqAZM7uJy1by91+l43PzzzcISqgRyFs
 go7SJ9hMWoiJM9D3E7dBAa2drMOe0lT3CB9e/ooQ3KT5pTyD9Hwsejrmu
 Z4ZkKg34oMsBGWSQurHGf4m1UtKvpViQCwZNNHdVooAWUhPOkORXRReCm
 dST4v5/2Me2TgL6/54t/pbHz32keWcgPjIw4+Q7KeAeQuCb9P5y0HPCXM
 7+GgbHAAC/ZNpVG8ePQSEZPlS1AdeGzYtQ5o26iWsU7XVvJRQcWlcb625
 9AQbcpgewhxj2+/NMpqu8qX+sG2URJcx6DN+s25Fnicy0afNmSGlr3MTQ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="393287904"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; d="scan'208";a="393287904"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 16:15:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="832881990"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; d="scan'208";a="832881990"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Nov 2023 16:14:46 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 6 Nov 2023 16:14:46 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 6 Nov 2023 16:14:45 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 6 Nov 2023 16:14:45 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 6 Nov 2023 16:14:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JkGw1039BLXMcPpQ+/o32uPZ7WLtbre4M8cPsUi+4i2yuSbSD74GmPG4pVGwQvGvoZtDE8EmAZZskzq8VsWSxcygimTyhZnMMTUCXSMAHqp3E5F7VybmLV/LMN2MPdJIrC/BiqzF1UDyroSccfThowinPYjF4BDJyVGRRBF8h02RpE2CF1lUVIK5F/xoYzS+moJR49L/wkJQhYmKVFwFe3/DdPU9wIGsqBdCfOKUy7IqRqY8REPDx6sPZeFaLjmVGSdIjZBzsGbrTUb9VjRFz51Pf890qhnWi1VOxSxC5vcc1kZ7RkiIu3Yjizm1O2yG7zbOXRsOPzRam3ZZ/Dl75w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DfRR/XhrYBUdqidWE0XvBGlDIRRomss0wylYaRikFVk=;
 b=GVevKWqh20bN6oQEncX7nz9JLnWdh//nGAY1Q+N/4jumlMx3wycjsqRqjBkiNzs5xNppAysNbaJZl/RDWlWF2j3bcGlJNRY6ryh+5ClAznmKQUumtA8CWpe8ByPGieSa8jrjE2VdNbSYlDmAM+eE05Q494tGogBjkDsL3KHv247OR++ALZmHzHLWI5XV/An/oxJ+zGqW3xiq/p0tEz4T8OvpqpkV2sBRNjPU2n6TICFtTxzsM2MWMOo4eNXXVvkNplyPOcsMHv/WV0hgSB9+hXsy0tzK5ksfcruRAtY94NFQkxLQnRD+zJxtcvQ0741Y69DIeD5PWi1v1kUf+L1q0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB6490.namprd11.prod.outlook.com (2603:10b6:208:3a6::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Tue, 7 Nov
 2023 00:14:43 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::3f66:aa7d:51d5:777]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::3f66:aa7d:51d5:777%7]) with mapi id 15.20.6954.028; Tue, 7 Nov 2023
 00:14:43 +0000
From: "Brost, Matthew" <matthew.brost@intel.com>
To: "Mishra, Pallavi" <pallavi.mishra@intel.com>, "Welty, Brian"
 <brian.welty@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Thread-Topic: [Intel-xe] [PATCH] drm/xe: Prevent null ptr dereference
Thread-Index: AQHaDpo8mJ1rM9JNrEKXr9U7yCJp5LBtufkAgAAJEACAAD5iwA==
Date: Tue, 7 Nov 2023 00:14:43 +0000
Message-ID: <PH7PR11MB652249F8AC935D24D66C089DEFA9A@PH7PR11MB6522.namprd11.prod.outlook.com>
References: <20231103211924.426715-1-pallavi.mishra@intel.com>
 <921e39ea-5e8c-4787-9077-a16666af24ed@intel.com>
 <PH0PR11MB5782FE8704BD97023EC56EDB82AAA@PH0PR11MB5782.namprd11.prod.outlook.com>
In-Reply-To: <PH0PR11MB5782FE8704BD97023EC56EDB82AAA@PH0PR11MB5782.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6522:EE_|IA1PR11MB6490:EE_
x-ms-office365-filtering-correlation-id: e61fc15f-b414-4655-4816-08dbdf268aaa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OIlxP/FsZFHFgT0VF/Zb0ZdEyGAwZnW/yVCOf326qcEyZ+pooIz0Tna1ObVcnMLw8Yf/mZEF08CaZdsa5nZ4Y+J4An2e2TGwY4nYuwJ602LATYQXPMfIeq/5Ar1WKLUfROsv5DJPlYTu5KbRPrJPfSw+TLI2T5yBI7h9stk1XOEqd/FIRTAAVQAaPC9cscf1HV83zqiL0VRd82kAc/D64twj3I0Y/w+XEnphRZF8fUKvPaRzpNEjih1e2zCEDXMqteAUDl/oSH/R1jn05qjX/Wo2EHh0GYOLewkZiCBD5DFZNAg2XLnupso1FL4t0czqKYZcuEgauALauqUnWkSj0xTKItq16orD/D2vIqcn95brWdiL+FUtqCQ0vOYEBdw4ElLsN+WhqZStA+9pFhNUUHhmD1a5gJjNE+0IySOXzlu2Njizn259CTicG5agPINfEyiz3Iiy5jR5qAuKIVWVRdCaXprhM5xdQJipiZkgy9uVJWF/6gVTUZ59e519Vi/djoutaEfAe8TosqGaWQK25IcQIsIJEN9i00pb8xWJw1dEbkoykScwfAul3U8re5z0yqB5T8hI1pBmzPv3EM4ahYFT6e0jn3hIuSl2t/zxJrLZFK/fKqBSt3zzwek3TzXK
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(366004)(396003)(376002)(39860400002)(230922051799003)(64100799003)(1800799009)(451199024)(186009)(55016003)(83380400001)(33656002)(52536014)(8936002)(38070700009)(41300700001)(86362001)(2906002)(8676002)(316002)(110136005)(71200400001)(478600001)(7696005)(6506007)(66446008)(53546011)(82960400001)(122000001)(5660300002)(38100700002)(64756008)(66556008)(26005)(66476007)(66946007)(76116006)(9686003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?akZlTGtQeEw3L2k1OWwxaGFTWmxWTWVuTmNNR0x2TTRQZDQwVlFqMkJNMjBS?=
 =?utf-8?B?YnVXU3BzRWlTSkw5VUZrK1hhaHlKc0djNDlOSGdwZGJWTnp2cGkxcktQY0h5?=
 =?utf-8?B?ZWR3dUplWG9DRHhRd2U3ZlBuOUROeDNWVzBkOEVaWFhZbWp4SWljbWZXdWts?=
 =?utf-8?B?bWZsZWpaWHNIK0dXNnMrME94Nk9FTDZYbzFyMTd6aDNuV0wvSE5yWURadzBr?=
 =?utf-8?B?L2l5RGpVemV1QlplVzRtbWJJTTJESXg0d01lKzJ4dFZESmNFU3hldzUzQW1w?=
 =?utf-8?B?NlAzaUJLWVEwRitvVEVFbmNlZVF0b1NvRVdva2VVZW9uYmlINzVYR2plTUtz?=
 =?utf-8?B?dTloWWN1UjRKTEQ3SEdGYUhkVk41a2VWUXVVdkx0eUhVZHpicUhIdTlMQjhW?=
 =?utf-8?B?L2lyQUlhUUpISkdxTy82cENxQ2h5K3dOMGQrNEQreTZYYUFNRGZmeWw5Kzlz?=
 =?utf-8?B?dzNmUGU0YkcwRWNCVGdHRENUWWluQjdmVVBWc1ZIRUdGQXlYWFN4WitiMGVl?=
 =?utf-8?B?S1gwL2NTL21CUjJHUmU2YVF4NWZsZmJjbmN1NU96NG01MXdIRG1qYXZvSmpG?=
 =?utf-8?B?TjFkUzAvWEtycEdsTnFhd3BiV0QrdExiUTgrdFF5STBVc1dsOWZUeVRFUWQr?=
 =?utf-8?B?MlY2K01GdUhLTlNCQ0t0bWQzVU40bUxQdVBFNW9HT0hHZGtmTDJzbkVqSVkz?=
 =?utf-8?B?WnQxenN5VCtaSGJLT2VjYzVtdi9LaU5GWmRmTW9HTGlUWmZiS1pjU01hdTZJ?=
 =?utf-8?B?aG5aVysveVVuOVhjYlNuSEZDVHZ0QlBPNjI0b0piWFdCUzM5R0RERUdGYkFK?=
 =?utf-8?B?aXZ2WVQ3bEIrZy9saEU4NkJpdDcrbC9kM0VWRGdaVXE3L3lFZnZBRWw1TDRL?=
 =?utf-8?B?WmFyRWZBMERmS2FSR0xHbDFYWklxRThhdTE2clVaeEpsL2hwcEtYd0l4MGVQ?=
 =?utf-8?B?eThVUk9NYUlhNXYyUHpCeTRlY2VYemhMQWFuYk5CdkQraWxJeVZwc2EvRjFa?=
 =?utf-8?B?a3BwSmxZWDRDdXJ4RFJWa3BWME5CTGtWN21LN05XSzk4T2xEN21xUVh2N0lT?=
 =?utf-8?B?d0xyOU0ybTE4UFVEa2FPWDZDRDZod3lZSFZ3anVORkxMOE9wRlJhSFk5RU1B?=
 =?utf-8?B?dWhMM1JFeUg4cjk1clloTmZWRkdNZTRHRFVCdXZVelJUQkZHOVZaNEljaFNK?=
 =?utf-8?B?UUVmdFdmY00rTVg4bS80dHd0UUJQeGhPMXhKTmNqMGV3WXNJcnJBYkptbDBP?=
 =?utf-8?B?dlcwUEptWjZ1K2NGa0IvdGIzYWMzQmFsVlJyM2pFNUJiYTQwdlUxTVhkVVc2?=
 =?utf-8?B?U0M4eENCZ2NKUmRDOGFoRnlFOGNhdEs5blo0QzYwRGI0L1ZXWjlXdWxUVFpP?=
 =?utf-8?B?TWZPd2g1bExBUlR0OGtXWlR3Y2dGemgwK0szQm90c0graSs0OU95SkkrM2Q1?=
 =?utf-8?B?YnFyNWZVa2hJKzBVNE5oeURlQXVnRzJnTG1rSnYyWnlIVVd3Vy9wdXI2UmJM?=
 =?utf-8?B?REppbGt0Tm5jbDdXanZNT3BjeTJBOHI4aEYvbGVhY3Q3MVQwYVduTGJjOEhk?=
 =?utf-8?B?eDY3NlhKT1A0QzRVVFVYMUxrR2wwdnR5MzYwYUdNRnI5OWFUSzlGZHNpay94?=
 =?utf-8?B?c0VBcFlrL3gwQTB6U3RpU2dJRHBrTkxLQjlLYk44Q2thcktCRXFLWWhEbnhl?=
 =?utf-8?B?UjV2YTVtSGF5NjRtYWd3blBRcWFpeUxyTkdzRE53ZlBtVDVDa3FaY0RvYzA2?=
 =?utf-8?B?TUQ3L2hZQ01NMGhMODJxUStMZWk5alZaYU1TNkxIL0h1YytwN2xwdkJnc0Mz?=
 =?utf-8?B?V3hpNFJucERibXkyWnlNMkNSVWxTYm5qQWZFKzZBUlZLUjVuSFg4alpCNXpF?=
 =?utf-8?B?RVBQZmVHQ0lPcEFSV2lSOEVoODcvOTBMYk0rQmowc2d1bU56ZWtKUVNWK3Uy?=
 =?utf-8?B?WDdnTTJibThtaTZ3L3d1bDRucTVJOUQzZlBlRkZyVmNMQlFUSzk2L1BIR1NV?=
 =?utf-8?B?RG83T0hWUlhubUVTUHZRR3F3VklZNDVWeGQ1Y3NpTDZUa0lhNHVrV29HSXNU?=
 =?utf-8?B?RFdBVDZBNjFMVjI3dkMwajNqOE12MjZiQ1M3VXREb1VMMDBXb29oMk0xVXVE?=
 =?utf-8?Q?GacQeV+ND1DSzxNw/uhq5eKbL?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e61fc15f-b414-4655-4816-08dbdf268aaa
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Nov 2023 00:14:43.0893 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: m0mvOMt+ZT49qqidajiBfEWLPSRiX7Kki0FAllKXM52Hlq0rTT6/HuaOqswry+uUWmceOZgfVlXbHf3Fff3aeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6490
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Prevent null ptr dereference
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

SSdkIGxlYW4gdG93YXJkcyBmaXhpbmcgdGhlIHRlc3QgcmF0aGVyIHRoYW4gdGhlIG1pZ3JhdGUg
Y29kZS4NCg0KTWF0dA0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogSW50ZWwt
eGUgPGludGVsLXhlLWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2Yg
TWlzaHJhLCBQYWxsYXZpDQpTZW50OiBNb25kYXksIE5vdmVtYmVyIDYsIDIwMjMgMTozMSBQTQ0K
VG86IFdlbHR5LCBCcmlhbiA8YnJpYW4ud2VsdHlAaW50ZWwuY29tPjsgaW50ZWwteGVAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnDQpTdWJqZWN0OiBSZTogW0ludGVsLXhlXSBbUEFUQ0hdIGRybS94ZTog
UHJldmVudCBudWxsIHB0ciBkZXJlZmVyZW5jZQ0KDQoNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQ0KPiBGcm9tOiBXZWx0eSwgQnJpYW4gPGJyaWFuLndlbHR5QGludGVsLmNvbT4NCj4g
U2VudDogTW9uZGF5LCBOb3ZlbWJlciA2LCAyMDIzIDExOjU4IEFNDQo+IFRvOiBNaXNocmEsIFBh
bGxhdmkgPHBhbGxhdmkubWlzaHJhQGludGVsLmNvbT47IA0KPiBpbnRlbC14ZUBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcNCj4gU3ViamVjdDogUmU6IFtJbnRlbC14ZV0gW1BBVENIXSBkcm0veGU6IFBy
ZXZlbnQgbnVsbCBwdHIgZGVyZWZlcmVuY2UNCj4gDQo+IA0KPiANCj4gT24gMTEvMy8yMDIzIDI6
MTkgUE0sIFBhbGxhdmkgTWlzaHJhIHdyb3RlOg0KPiA+IEluIHNjZW5hcmlvcyB3aGVyZSB2bSBp
cyBub3QgaW5pdGlhbGl6ZWQsIHVzZSB4ZV9taWdyYXRlIHRvIGdldCB0aGUgDQo+ID4gYWRkcmVz
cy4NCj4gDQo+IENhbiB5b3UgZGVzY3JpYmUgdGhpcyBzY2VuYXJpbz8NCj4gSXMgaXQgbGVnYWwg
dG8gY2FsbCB4ZV9taWdyYXRlX3VwZGF0ZV9wZ3RhYmxlcyB3aXRob3V0IGEgdm0/DQo+IFdoYXQg
Y29kZSBwYXRoIGRvZXMgdGhhdD8NCg0KSSBzZWUgdGhpcyBpbiB4ZV9saXZlX2t0ZXN0IGluIG1p
Z3JhdGUgc3VidGVzdC4gdGVzdF9wdF91cGRhdGUgcGFzc2VzIHZtIGFzIE5VTEwuDQoNCj4gDQo+
IEp1c3QgdHJ5aW5nIHRvIHVuZGVyc3RhbmQgaWYgc2hvdWxkbid0IGJlIGluc3RlYWQgcmV0dXJu
aW5nIGFuIGVycm9yIA0KPiBpZiB2bSBpcyBOVUxMLiBPciB0aGF0IGlzbid0IHNvbWUgb3RoZXIg
ZHJpdmVyIGJ1Zy4NCj4gDQo+IC1Ccmlhbg0KPiANCj4gDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5
OiBQYWxsYXZpIE1pc2hyYSA8cGFsbGF2aS5taXNocmFAaW50ZWwuY29tPg0KPiA+IC0tLQ0KPiA+
ICAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX21pZ3JhdGUuYyB8IDUgKysrKy0NCj4gPiAgIDEgZmls
ZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gPg0KPiA+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfbWlncmF0ZS5jIA0KPiA+IGIvZHJpdmVycy9n
cHUvZHJtL3hlL3hlX21pZ3JhdGUuYyBpbmRleCBlNmEzMWY5MGViZGIuLmY3OWVjOGU0YWU0ZQ0K
PiA+IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9taWdyYXRlLmMNCj4g
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfbWlncmF0ZS5jDQo+ID4gQEAgLTEyOTYsNyAr
MTI5NiwxMCBAQCB4ZV9taWdyYXRlX3VwZGF0ZV9wZ3RhYmxlcyhzdHJ1Y3QgeGVfbWlncmF0ZSAN
Cj4gPiAqbSwNCj4gPg0KPiA+ICAgCQkJeGVfdGlsZV9hc3NlcnQodGlsZSwgcHRfYm8tPnNpemUg
PT0gU1pfNEspOw0KPiA+DQo+ID4gLQkJCWFkZHIgPSB2bS0+cHRfb3BzLT5wdGVfZW5jb2RlX2Jv
KHB0X2JvLCAwLA0KPiBwYXRfaW5kZXgsIDApOw0KPiA+ICsJCQlpZiAodm0pDQo+ID4gKwkJCQlh
ZGRyID0gdm0tPnB0X29wcy0+cHRlX2VuY29kZV9ibyhwdF9ibywgMCwNCj4gcGF0X2luZGV4LCAw
KTsNCj4gPiArCQkJZWxzZQ0KPiA+ICsJCQkJYWRkciA9IG0tPnEtPnZtLT5wdF9vcHMtDQo+ID5w
dGVfZW5jb2RlX2JvKHB0X2JvLCAwLCBwYXRfaW5kZXgsIDApOw0KPiA+ICAgCQkJYmItPmNzW2Ji
LT5sZW4rK10gPSBsb3dlcl8zMl9iaXRzKGFkZHIpOw0KPiA+ICAgCQkJYmItPmNzW2JiLT5sZW4r
K10gPSB1cHBlcl8zMl9iaXRzKGFkZHIpOw0KPiA+ICAgCQl9DQo=
