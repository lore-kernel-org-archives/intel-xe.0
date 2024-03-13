Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E640C54E66
	for <intel-xe@archiver.kernel.org>; Wed, 13 Mar 2024 17:06:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF94C10E93D;
	Wed, 13 Mar 2024 17:06:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lUTch+Hs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01E5710E93D
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Mar 2024 17:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710349594; x=1741885594;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=LqTM9UteF5lTSWJ+vW6qFmL1fcavvTpHE/2GD8yRYS0=;
 b=lUTch+HsbKAJA8vikzGncnKrppd5Dozaw9h4GEPFcCkq4RAEPcaUBSdY
 ZvZ6kAD/+zd0SGorM+zbH79O2lj2a2+fOpCnjhzm6tf7rVhZjZ2APnFuA
 r5AK7vWssfjIBqtvdmmXC6btlVoDLjupPcSwF5/3Z0Tmtlva5k60PZ8xv
 f97hzFGuBrOsxwEGAAVM2Be/Nbamv2HBQcZJelJXKRKW5OsN99BLShrCN
 coZX12q/gHOsldlga8+5BpiCGQpzcqZ3aCcN3gez8GBKIDEKC0C6zn70T
 CL/hsEs8EWPaP1QjUSbOHL/YIoK9cMhNDiJZ37kpdyvdpiAFDioPqLycP w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="5001003"
X-IronPort-AV: E=Sophos;i="6.07,123,1708416000"; 
   d="scan'208";a="5001003"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 10:06:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,123,1708416000"; d="scan'208";a="11886782"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Mar 2024 10:06:35 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 13 Mar 2024 10:06:33 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 13 Mar 2024 10:06:33 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 13 Mar 2024 10:06:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HaWgKfFzAttt18bSmNJ5PdfbmTa5W6SFzsygTQLUjdsQPFIrhTOXw4NlMoJ5/5VG1eDfrY8fIF1dFA24gxLVCoVrxZ+JeXVOhtz52ZvTkgCvo1AUPVGygkZhNOH+sUcEiwfVa1jobbR24NulqBMKH7ROU4UIVsDk+ptoZfuLUvrym+gdjMeO7bi/7wlnotseeSy421bRx6EsqQA1X8tePCAVTNJwhJn7MFwb/RetF6NogDFXtpR83pBUOMTztygJxABtRnizlOpSySQ5QEnphpVDp5fz3wUkmxM7cpjYWdJDOUEptiI6qvrhjx6bV8Lz5Id+43yyo10EptmAZLLXFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LqTM9UteF5lTSWJ+vW6qFmL1fcavvTpHE/2GD8yRYS0=;
 b=nAr9y0+Ugs/SvL6oL1C9iCzNqpl3nEwt4dQsVir9mvdUYtzfntMYrrtD4pBIB4d6jWKTtPzAlRySBXbh7pWVpoQrif5u+hv1UP20MFjXYUUQ7VIZraLOESgBa9LF08WhaM/LZhkmnvddSzjWAGjHgslrAqKYjJ6g+kkfEx95UoQ7kQb86puXD8RYY5xrQ0qIqIzgwuwdLIcOsdvViXJ47tSVD4znE2ohxz09LJ1GYxZwyDWooE0PH10zYDqQdxRYasyS0mWo8YlZG7QEnYS+ZQV2UG+oJTdai4Ks7NR95mfsf1iDCr6Xca2RTJyKzoDdlKxQgeo0v3U745qDuFRtDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by DM3PR11MB8672.namprd11.prod.outlook.com (2603:10b6:0:44::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.18; Wed, 13 Mar
 2024 17:06:30 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d%5]) with mapi id 15.20.7362.017; Wed, 13 Mar 2024
 17:06:30 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>,
 "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: Separating xe_vma- and page-table state
Thread-Topic: Separating xe_vma- and page-table state
Thread-Index: AQHadFDywx5K1cRH40+OxAMGoL7g0rE0pF2ggAA+GgCAAJ8GAIAAWfmg
Date: Wed, 13 Mar 2024 17:06:30 +0000
Message-ID: <SA1PR11MB69915B6A778A81CD41F6A544922A2@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <72ea6bc36260bcc2eaeb97d1abcb8bebf69f3f53.camel@linux.intel.com>
 <SA1PR11MB699139B15B97B2B056312F41922B2@SA1PR11MB6991.namprd11.prod.outlook.com>
 <ZfEA5ieJ+M9rttI3@DUT025-TGLU.fm.intel.com>
 <a8c507084e016186e0fb75c45b826f612ddc6c40.camel@linux.intel.com>
In-Reply-To: <a8c507084e016186e0fb75c45b826f612ddc6c40.camel@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|DM3PR11MB8672:EE_
x-ms-office365-filtering-correlation-id: 49e9a51f-b1f5-44bb-1cbe-08dc437fed83
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: R0/4iPwAvwZoUHFW5RUT8xtWB6WRrnJtV7d8KDSH2wgc0hMWAItLpMheZh4tzvTyBxZDz4V8TbkBTBnd3ZIGq0z8vqF2VojfmD+VzOuWBqKLfVJU0zEHz3ellsYTwLdqtnPL1KGgHHq1O+UjOUvO9AE+Fdr2LoNJHiMZ0BYYrM6glbt/weGmUnMwYzKG0BZzpriWmn0Mq1BvTTx/Dbov5MFSo7lIHzWN7ZhrQnoceo9pH7fJimx7sd02AM9AbEdXVB44jJLdwrAV/Si5SM2LPbENa3ahqu76z5v3V0gsUX9eK8QIPULybzJBxpQZdMId6rh7CezO8Qgmsy5gwtMPWd2rLjyggTx0AO5LvzUDkSQQLXdE7xSFixp4OHMavvmIfRxDl0/PCSOkQAQkQyxVxBBLgU8GqtohkmJeo5PPR8c2JL3shVDG64d5YYxpO1Q4X5PILOfiPRab4kCBTa1E5dRsgbfSNwFmjI/T4vbEA1WnZdV99qoHyGaTSUu/LfJAK86kl6ANY/BFFmTG1rPa6OzCOQ3iQ4fSFf5t5/KEWOeP4999P+EpR9meaoUT44yXRuL6w9TdfUOKsrW3/lnBbmCoMb1Xc5Pdph35TQszke6S/PhvJVl1rmzZ+US6xxDNwc5RM4o8ichDjHVQlJPTTGmhlahSeNNcVN4h3ZqGvb/9VXts8MPboWK07XR5/5/sQnlSboMxyzBJlMlZc7EIYA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K0FsY0lvVzVqZDRQa2tYRW5pWWV2dUV2ZWl2NWZIbnI0aHFCbkJUNVdWblNw?=
 =?utf-8?B?aW1GcWY2YVBGTGI3OHJHaGI2cXVJcHl5TWJveGJCODVMbFlJWXJNclJ2dCtv?=
 =?utf-8?B?ekdVUE4xVi8wMWNtemM5VnN4dnZEYmhiUjAzTm5aSkVHcW1HWE1YdzBMSm9W?=
 =?utf-8?B?dTZoaXYvQUoyUG5sWTJ3ZzhGRWhMUEwySEJiK3pFNm9IdjVlazFYUEpTK1NU?=
 =?utf-8?B?d0RFdWUvaWdBMDBjY1dhd2tIOEszcU0vZ3pieC9TeTVzOGtkZXBBcG1oWnJU?=
 =?utf-8?B?Skh1Szd4REhCRHlKYmlBa1EvaURpQVVsZUVlblBUU0VSbkk3RG02USt3N1lL?=
 =?utf-8?B?TGFJenFHVTlRWkFScVdMOC91ellyeDNCSHVvbVl1MGZZYVpLNzBWbWkwajYw?=
 =?utf-8?B?emdDS0I3WWovaDNxaDZ2ZTJNeDlibjEzRGNJYmdNdFF5MUlUN1FRWTNlQ1RV?=
 =?utf-8?B?b2FNd3dVRXVmZ2dlOUpRd0YvQWZNb0Nha3IvOVVBYk1tUlFDOGtnQ2JGRFpG?=
 =?utf-8?B?QnZhRVRCWnhqeTVNTDVlSmw3M1NjYUlXc1JFbzR1VXFDUWRUTFpUVTk3RXRL?=
 =?utf-8?B?Y0wyZVl4L1puOVV4UG44K0VBUzh4S0V4ZmFyR1dYYlAzTmovTzcySmNldVph?=
 =?utf-8?B?eXRVNjYwd3JDVGZrZkhSKy9QcjBoMkQrUmVaMld2b1FCUDcxc0FJVFppVnBD?=
 =?utf-8?B?dFZBd2dhNWxPM1pMYUZDRGpoL1d1dnk3MjNQV2lCRy8yUEdQMnpDclNkOGpn?=
 =?utf-8?B?NUlXYkJMcCsxMmxKeUVObnZtdnVTVSswbkxvWGhXZFVIbnNWZGpDc2thMmE3?=
 =?utf-8?B?QWk2b2FhRTVqWWMyNVN0dkRRa2N1QkpNWnlJNkR4Z3JYTmNDbzlKRnVMM0ZL?=
 =?utf-8?B?YW52YWxzQUszQjZLS0lIY1VQUWg4WlgvenRuMDFNNjk2UkkxSTM0T1R4U0JK?=
 =?utf-8?B?WGk4Y3hiSHJGd2NBWFVJMVdMaE0xbC9aRzhGUUEva0NPY1ZqM2J2a2N0SGZ5?=
 =?utf-8?B?UFFzbkYxUXZiOTdaSmYxTnkvMUtDVUNQbENhdE5VaTlsNGZzNXhMajRQU3RP?=
 =?utf-8?B?NDZCdEZjeG5zQ3FCM1gwODd2aGY4Qk5HTFF5dzY3bGlXa3d1UlR2VENpTUJB?=
 =?utf-8?B?cVhTNXJ5RUhBS1lodXdXWGRCM1dMeWl1dGRjN3BQdnlDS004U0tkK20wd1lw?=
 =?utf-8?B?VXdKNXhuVHo1YjJPS1h6Q0FaTDRwMGtiL0t2bG9Bdm9idFl3S0NoMy9heDFv?=
 =?utf-8?B?djU1bDVSaGhCUTltelVmUEwwZWpUbE8yT053UEVObGhFV0RIazJSRHNWR1NW?=
 =?utf-8?B?dXMzdXk0WGNFZ3pacjRlRGxCaVVJallRaThZYThRZWlQSkE1UlExeVJZNDdV?=
 =?utf-8?B?bFFSUFM1TzFYVU9FdHpYWm9ZZ0hibGtuSEVvYnJtcU11RzhtSnoxM2V2T25X?=
 =?utf-8?B?ZmtoNjVtOTZQRFI5THdjamlxQUVuajV0c2JkV3dKZWR3Y3hLZDVIaUVEdXNL?=
 =?utf-8?B?TTMxaTZPV3lsRDdvVWk2ZnFxK254a0g5d3diU2dicTE2OVBDTkFGVUhFOGQr?=
 =?utf-8?B?cVJIMmJiU1lHZkQ4N0QxcXlKR3JXcXp4L1RuRG9SRlRScWtmdjBBUDErbGRO?=
 =?utf-8?B?UzgrbjRNTWFTcjh4KzJ0Q296NnZyZGJmN0pHWVJZOHk2aHpxNnlZNWxtdFBF?=
 =?utf-8?B?bXZyWGpTRC9WN01EbS9rMjJzODh5U0Ivcm03My9kSlJCZnRYWWdRejF0WTRa?=
 =?utf-8?B?K241TlZNYVZBZjVrRFBvZExXK1ZNTVBqM0tpUmpJYURuRVN6b3c4Ni8zeDI1?=
 =?utf-8?B?RHBYYldTcE50MEtyYTE4b3NvOWhOTTdJL1Btd01ueUtEUVUzeWpJaU5USnh2?=
 =?utf-8?B?T3h3ME9kWFZsSXBnbi9tS0VNYUJtSDFJQlNLdXFFekRxZkl4OXNnYWVjZjJ4?=
 =?utf-8?B?c1FpVisvcWlUWFE1Ym91UTdpL1Vsd2djK3lBVlhsL2MxazZ4RGExQkwzU1N4?=
 =?utf-8?B?N3BaQlR0N3FORXl3akVrc1FYUWQ5Wm1GZDhPYUthOVhra1p2eFVBbWNiZ2VM?=
 =?utf-8?B?S3UvS3J5alh6eFYxaVZDN1N4K0ZQem5pYjVESFpiS1FLaU1OM1NLd0l5dk1h?=
 =?utf-8?Q?oHrE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49e9a51f-b1f5-44bb-1cbe-08dc437fed83
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Mar 2024 17:06:30.4039 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8g35rCCw/J6uaD2iJ45B9OtjKvfyMcBCnPCenhsVudXbeSC41diVCt8TJawNOO3+4/5XuC7a6ZJe4cRHVI1CSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8672
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

SGkgVGhvbWFzLA0KDQpGb3Igc2ltcGxpY2l0eSBvZiB0aGUgZGlzY3Vzc2lvbiwgbGV0J3MgZm9y
Z2V0IGFib3V0IEJPIHZtX2JpbmQsIGZvcmdldCBhYm91dCBtZW1vcnkgYXR0cmlidXRlcyBmb3Ig
YSBtb21lbnQuLi4gT25seSBjb25zaWRlciBzeXN0ZW0gYWxsb2NhdG9yLiBTbyB3aXRoIHRoZSBz
Y2hlbWUgYmVsb3csIHdlIGhhdmUgYSBnaWdhbnRpYyB4ZV92bWEgaW4gdGhlIGJhY2tncm91bmQg
aG9sZGluZyBzb21lIGltbXV0YWJsZSBzdGF0ZSwgbmV2ZXIgc3BsaXQuIEFuZCB3ZSBoYXZlIG11
dGFibGUgcGFnZS10YWJsZSBzdGF0ZSB3aGljaCBpcyBjcmVhdGVkIGR1cmluZyBHUFUgYWNjZXNz
IGFuZCBkZXN0cm95ZWQgZHVyaW5nIENQVSBtdW5tYXAvaW52YWxpZGF0aW9uLCBkeW5hbWljYWxs
eQ0KDQpGb3IgdGhlIG11dGFibGUgcGFnZS10YWJsZSBzdGF0ZSwgeW91IHdvdWxkIG1haW50YWlu
IGFub3RoZXIgUkItdHJlZSBzbyB5b3UgY2FuIHNlYXJjaGluZyBpdCwgYXMgSSBkaWQgIGluIFBP
QywgdGhlIHRyZWUgaXMgaW4geGVfc3ZtLiBGb3IgQk8gZHJpdmVyLCB5b3UgZG9u4oCZdCBuZWVk
IHRoaXMgZXh0cmEgdHJlZSwgeW91IGp1c3QgbmVlZCB0aGUgeGVfdm1hIHRyZWUgYXMgeGVfdm1h
IGhhcyAxOjEgbWFwcGluZyB3aXRoIHBhZ2UtdGFibGUtc3RhdGUgZm9yIEJPIGRyaXZlci4uLg0K
DQpJIHNhdyB0aGlzIHNjaGVtZSBjYW4gYmUgYWxpZ25lZCB3aXRoIG15IFBPQy4uLi4NCg0KTWFw
cGluZyB0aGlzIHNjaGVtZSB0byB0aGUgdXNlcnB0ciAiZnJlZSB3aXRob3V0IHZtX3VuYmluZCIg
dGhpbmcsIEkgY2FuIHNlZSB3aGVuIHVzZXIgZnJlZSwgd2UgY2FuIGRlc3Ryb3kgcGFnZS10YWJs
ZS1zdGF0ZSBkdXJpbmcgbW11IG5vdGlmaWVyIGNhbGxiYWNrLCB3aGlsZSBrZWVwIHRoZSB4ZV92
bWEuIElzIHRoaXMgYWxzbyBob3cgeW91IGxvb2sgYXQgaXQ/IA0KDQpOZWVkIHRvIHNheSwgdGhl
ICJmcmVlIHdpdGhvdXQgdm1fdW5iaW5kIiB0aGluZyBzaG91bGQgb25seSBhZmZlY3Qgb3VyIGRl
Y2lzaW9uIHRlbXBvcmFyaWx5OiBvbmNlIHN5c3RlbSBhbGxvY2F0b3IgaXMgcmVhZHksIFVNRCB3
b3VsZG4ndCBuZWVkIHRoZSB1c2VycHRyIHZtX2JpbmQgYW55bW9yZSwgc28gdGhlIHByb2JsZW0g
d2lsbCBiZSBtb3JlIHBlcmZlY3RseSBzb2x2ZWQgd2l0aCBzeXN0ZW0gYWxsb2NhdG9yIC0gdW1k
IGp1c3QgcmVtb3ZlIHRoZSB2bV9iaW5kLCB0aGluZ3Mgd291bGQgbWFnaWNhbGx5IHdvcmsgd2l0
aCBzeXN0ZW0gYWxsb2NhdG9yLiBJIGd1ZXNzIHdoYXQgdXNlciBuZWVkIGlzIHJlYWxseSBhIHN5
c3RlbSBhbGxvY2F0b3IgYnV0IHdlIGRvbid0IGhhdmUgaXQgYXQgdGhhdCB0aW1lLCBzbyB1c2Vy
cHRyIHRlY2hub2xvZ3kgaXMgdXNlZC4gRm9yIGxvbmcgdGVybSwgc3lzdGVtIGFsbG9jYXRvciBz
aG91bGQgZXZlbnR1YWxseSByZXBsYWNlIHVzZXJwdHIuDQoNCk9uZSB0aGluZyBJIGNhbid0IHBp
Y3R1cmUgY2xlYXJseSBpcywgaG93IGhhcmQgaXMgaXQgdG8gY2hhbmdlIHRoZSBjdXJyZW50IHhl
a21kIHRvIHNlcGFyYXRlIHhlX3ZtYSBpbnRvIG11dGFibGUgYW5kIHVubXV0YWJsZT8gDQoNCklz
IHRoZSBzcGxpdCBzY2hlbWUgd2l0aCB4ZV92bWEgbWFpbnRhaW5pbmcgYm90aCBtdXRhYmxlIGFu
ZCB1bm11dGFibGUgc2ltcGxlcj8gSXQgZG9lc24ndCBoYXZlIHhlX3N2bSBjb25jZXB0LiBObyB4
ZV9zdm1fcmFuZ2UvcGFnZV90YWJsZS1zdGF0ZSwgc2luZ2xlIFJCIHRyZWUgcGVyIGdwdXZtLCBu
byBuZWVkIHRvIHJlLWNvbnN0cnVjdCB4ZV92bWEuLi4uZGVwZW5kaW5nIG9uIGhvdyB3ZSB3YW50
IHRvIHNvbHZlIHRoZSBtdWx0aXBsZSBkZXZpY2UgcHJvYmxlbSwgdGhlIHhlX3N2bSBjb25jZXB0
IGNhbiBjb21lIGJhY2sgdGhvdWdoLi4uDQoNCk9haw0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2Fn
ZS0tLS0tDQo+IEZyb206IFRob21hcyBIZWxsc3Ryw7ZtIDx0aG9tYXMuaGVsbHN0cm9tQGxpbnV4
LmludGVsLmNvbT4NCj4gU2VudDogV2VkbmVzZGF5LCBNYXJjaCAxMywgMjAyNCA2OjU2IEFNDQo+
IFRvOiBCcm9zdCwgTWF0dGhldyA8bWF0dGhldy5icm9zdEBpbnRlbC5jb20+OyBaZW5nLCBPYWsN
Cj4gPG9hay56ZW5nQGludGVsLmNvbT4NCj4gQ2M6IGludGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZw0KPiBTdWJqZWN0OiBSZTogU2VwYXJhdGluZyB4ZV92bWEtIGFuZCBwYWdlLXRhYmxlIHN0
YXRlDQo+IA0KPiBPbiBXZWQsIDIwMjQtMDMtMTMgYXQgMDE6MjcgKzAwMDAsIE1hdHRoZXcgQnJv
c3Qgd3JvdGU6DQo+ID4gT24gVHVlLCBNYXIgMTIsIDIwMjQgYXQgMDU6MDI6MjBQTSAtMDYwMCwg
WmVuZywgT2FrIHdyb3RlOg0KPiA+ID4gSGkgVGhvbWFzLA0KPiA+DQo+ID4NCj4gDQo+IC4uLi4N
Cj4gDQo+ID4gVGhvbWFzOg0KPiA+DQo+ID4gSSBsaWtlIHRoZSBpZGVhIG9mIFZNQXMgaW4gdGhl
IFBUIGNvZGUgZnVuY3Rpb24gYmVpbmcgbWFya2VkIGFzIGNvbnN0DQo+ID4gYW5kIGhhdmluZyB0
aGUgeGVfcHRfc3RhdGUgYXMgbm9uIGNvbnN0LiBJdCBtYWtlcyBvd25lcnNoaXAgdmVyeQ0KPiA+
IGNsZWFyLg0KPiA+DQo+ID4gTm90IHN1cmUgaG93IHRoYXQgd2lsbCBmaXQgaW50byBbMV0gYXMg
dGhhdCBzZXJpZXMgcGFzc2VzIGFyb3VuZA0KPiA+IGEgInN0cnVjdCB4ZV92bV9vcHMiIHdoaWNo
IGlzIGEgbGlzdCBvZiAic3RydWN0IHhlX3ZtYV9vcCIuIEl0IGRvZXMNCj4gPiB0aGlzDQo+ID4g
dG8gbWFrZSAic3RydWN0IHhlX3ZtX29wcyIgYSBzaW5nbGUgYXRvbWljIG9wZXJhdGlvbi4gVGhl
IFZNQXMgYXJlDQo+ID4gZXh0cmFjdGVkIGVpdGhlciB0aGUgR1BVVk0gYmFzZSBvcGVyYXRpb24g
b3IgInN0cnVjdCB4ZV92bWFfb3AiLg0KPiA+IE1heWJlDQo+ID4gdGhlc2UgY2FuIGJlIGNvbnN0
PyBJJ2xsIGxvb2sgaW50byB0aGF0IGJ1dCB0aGlzIG1pZ2h0IG5vdCB3b3JrIG91dA0KPiA+IGlu
DQo+ID4gcHJhY3RpY2UuDQo+ID4NCj4gPiBBZ3JlZSBhbHNvIHVuc3VyZSBob3cgMTpOIHhlX3Zt
YSA8LT4geGVfcHRfc3RhdGUgcmVsYXRpb25zaGlwIGZpdHMgaW4NCj4gPiBobW1wdHJzLiBDb3Vs
ZCB5b3UgZXhwbGFpbiB5b3VyIHRoaW5raW5nIGhlcmU/DQo+IA0KPiBUaGVyZSBpcyBhIG5lZWQg
Zm9yIGhtbXB0cnMgdG8gYmUgc3BhcnNlLiBXaGVuIHdlIGZhdWx0IHdlIGNyZWF0ZSBhDQo+IGNo
dW5rIG9mIFBURXMgdGhhdCB3ZSBwb3B1bGF0ZS4gVGhpcyBjaHVuayBjb3VsZCBwb3RlbnRpYWxs
eSBiZSBsYXJnZQ0KPiBhbmQgY292ZXJpbmcgdGhlIHdob2xlIENQVSB2bWEgb3IgaXQgY291bGQg
YmUgbGltaXRlZCB0bywgc2F5IDJNaUIgYW5kDQo+IGFsaWduZWQgdG8gYWxsb3cgZm9yIGxhcmdl
IHBhZ2UtdGFibGUgZW50cmllcy4gSW4gT2FrJ3MgUE9DIHRoZXNlDQo+IGNodW5rcyBhcmUgY2Fs
bGVkICJzdm0gcmFuZ2VzIg0KPiANCj4gU28gdGhlIHF1ZXN0aW9uIGFyaXNlcywgaG93IGRvIHdl
IG1hcCB0aGF0IHRvIHRoZSBjdXJyZW50IHZtYQ0KPiBtYW5hZ2VtZW50IGFuZCBwYWdlLXRhYmxl
IGNvZGU/IFRoZXJlIGFyZSBiYXNpY2FsbHkgdHdvIHdheXM6DQo+IA0KPiAxKSBTcGxpdCBWTUFz
IHNvIHRoZXkgYXJlIGVpdGhlciBmdWxseSBwb3B1bGF0ZWQgb3IgdW5wb3B1bGF0ZWQsIGVhY2gN
Cj4gc3ZtX3JhbmdlIGJlY29tZXMgYW4geGVfdm1hLg0KPiAyKSBDcmVhdGUgeGVfcHRfcmFuZ2Ug
LyB4ZV9wdF9zdGF0ZSB3aGF0ZXZlciB3aXRoIGFuIDE6MSBtYXBwaW5nIHdpdGgNCj4gdGhlIHN2
bV9tYW5nZSBhbmQgYSAxOk4gbWFwcGluZyB3aXRoIHhlX3ZtYXMuDQo+IA0KPiBJbml0aWFsbHkg
bXkgdGhpbmtpbmcgd2FzIHRoYXQgMSkgV291bGQgYmUgdGhlIHNpbXBsZXN0IGFwcHJvYWNoIHdp
dGgNCj4gdGhlIGNvZGUgd2UgaGF2ZSB0b2RheS4gSSBsaWZ0ZWQgdGhhdCBicmllZmx5IHdpdGgg
U2ltYSBhbmQgaGUgYW5zd2VyZWQNCj4gIkFuZCB3aHkgd291bGQgd2Ugd2FudCB0byBkbyB0aGF0
PyIsIGFuZCB0aGUgYW5zd2VyIGF0IGhhbmQgd2FzIG9mYw0KPiB0aGF0IHRoZSBwYWdlLXRhYmxl
IGNvZGUgd29ya2VkIHdpdGggdm1hcy4gT3IgcmF0aGVyIHRoYXQgd2UgbWl4IHZtYQ0KPiBzdGF0
ZSAodGhlIGhtbXB0ciByYW5nZSAvIGF0dHJpYnV0ZXMpIGFuZCBwYWdlLXRhYmxlIHN0YXRlICh0
aGUgcmVnaW9ucw0KPiBvZiB0aGUgaG1tcHRyIHRoYXQgYXJlIGFjdHVhbGx5IHBvcHVsYXRlZCks
IHNvIGl0IHdvdWxkIGJlIGENCj4gY29uc2VxdWVuY2Ugb2Ygb3VyIGN1cnJlbnQgaW1wbGVtZW50
YXRpb24gKGxpbWl0YXRpb25zKS4NCj4gDQo+IFdpdGggdGhlIHN1Z2dlc3Rpb24gdG8gc2VwYXJh
dGUgdm1hIHN0YXRlIGFuZCBwdCBzdGF0ZSwgdGhlIHhlX3N2bQ0KPiByYW5nZXMgbWFwIHRvIHB0
IHN0YXRlIGFuZCBhcmUgbWFuYWdlZCBwZXIgaG1tcHRyIHZtYS4gVGhlIHZtYXMgd291bGQNCj4g
dGhlbiBiZSBzcGxpdCBtYWlubHkgYXMgYSByZXN1bHQgb2YgVU1EIG1hcHBpbmcgc29tZXRoaW5n
IGVsc2UgKGJvKSBvbg0KPiB0b3AsIG9yIFVNRCBnaXZpbmcgbmV3IG1lbW9yeSBhdHRyaWJ1dGVz
IGZvciBhIHJhbmdlIChtYWR2aXNlIHR5cGUgb2YNCj4gb3BlcmF0aW9ucykuDQo+IA0KPiAvVGhv
bWFzDQo+IA0KPiANCj4gDQo+IA0KPiANCj4gDQo+IA0KPiANCg0K
