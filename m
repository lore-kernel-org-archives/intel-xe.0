Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05B76C54E71
	for <intel-xe@archiver.kernel.org>; Fri, 22 Mar 2024 09:49:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A130310F780;
	Fri, 22 Mar 2024 09:49:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EKPNmHiP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E6AA10F292
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Mar 2024 09:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711100968; x=1742636968;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=tkDm+ifI6NyqErCny/Anh4bMptuAYj6eglpjb5DptU4=;
 b=EKPNmHiPpgzP5onssL2S3KiDFh/RmaYA+P1nrJAiB1Ykar8okDDND+Pj
 /u0I8sCwDhFqZhxQRXgakTziAZDkwOcpXaJksFfJSQdyI7Ee5vGWqwxDv
 1oZntPQ9kVZiYLEeLtGnmVvBcA3sGxK1+p/mecKWkB1wbHxEVvKBjwPnp
 DgBiYQOavmNIeHhFaMUc7NR2swKcGJi8cXKFyRy3Ieos6gbkr5MNgd4ZR
 LktbOwQ4ZuGVg0UgarScbBaOCSxJjx0Li9RUqxAam569WadbLfmMxg76d
 dVK/eILSaHT5j9AxiawtgHFU1rxrKRyqSn5oexC2+1Ak1jbwC5EZtGPHI g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="6349041"
X-IronPort-AV: E=Sophos;i="6.07,145,1708416000"; 
   d="scan'208";a="6349041"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 02:49:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,145,1708416000"; d="scan'208";a="45958578"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Mar 2024 02:49:28 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 22 Mar 2024 02:49:27 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 22 Mar 2024 02:49:27 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 22 Mar 2024 02:49:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V1V+OG9mRYroJqSvZJjOCjpC8XXMTWJNKIOywDpsZwwfl3+WTPGJ7ITwFx4TMojAWBXHcix88zdt0LrOukAOR+Zb6tZAB94S90JhakUHS/hUmTbw0ptTRFvfPEbZzhhTuCbXGAE9DWALRGjv4GwzmuGINhFozP6yBfBLKKkHn8yol8RThTOPUZg4I2AaDo1sLFMra4xWrq0ri91nPZ58RuikJW6ToCcsg/OdB7WH/XBZShKTJHn8oUM6GvUJrYqeu9w2Zz6RswXwgL6wsjR/9CtUOri+6yZig0G0DkMk72TKNho+NB7lJHf1GvgTREVEZs+A6VB3Jkbdd2u0UVgobA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tkDm+ifI6NyqErCny/Anh4bMptuAYj6eglpjb5DptU4=;
 b=bgAJ0p1u/ExfU8A3JixV88Ytxvm7g/ZPgOfxysrxj/R+QKUC0YLEcdtKDq4ls1oDpXcNY758Py6A/c4nFLpsrdjZu5sepPMyUn/WcuBk+u0ni13XNyiL+5BcEq1MlPPDahvjEbu21uYa8HSsqVxfXQkU7pMSGzstLXOUG/jFbRW0o7IBS7v2b/UxnYTba+6uh6TIr0dRAQm1erXNB83DoTBuJGpEBwuuoGQ1ay9mxrZjUJsb785R4+KerIggEuq88w07SGBUwAaIOdPV88wmNELpklpUl7O7Au8typr5kWstWVaywmndHqo/YK69yEw5vbd+yFrPLiYGCKxs5RzTyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by LV3PR11MB8765.namprd11.prod.outlook.com (2603:10b6:408:21d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.13; Fri, 22 Mar
 2024 09:49:25 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::8664:8749:8357:f11a]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::8664:8749:8357:f11a%7]) with mapi id 15.20.7409.023; Fri, 22 Mar 2024
 09:49:25 +0000
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
To: "Bommu, Krishnaiah" <krishnaiah.bommu@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
Subject: RE: [PATCH v3 1/2] drm/xe: prefer snprintf over sprintf
Thread-Topic: [PATCH v3 1/2] drm/xe: prefer snprintf over sprintf
Thread-Index: AQHafDtOfShPhaGEhkSRw19lpodJs7FDgI/g
Date: Fri, 22 Mar 2024 09:49:25 +0000
Message-ID: <MW4PR11MB70568A440104958C67CF5CD5B3312@MW4PR11MB7056.namprd11.prod.outlook.com>
References: <20231207012840.48432-1-krishnaiah.bommu@intel.com>
 <20231207012840.48432-2-krishnaiah.bommu@intel.com>
In-Reply-To: <20231207012840.48432-2-krishnaiah.bommu@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB7056:EE_|LV3PR11MB8765:EE_
x-ms-office365-filtering-correlation-id: 284c741d-9798-42b2-f58e-08dc4a555bbd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bcplsH2RUCTCP3TXZRdNhiCQ6JcgSJiaT5zLo0PFIwXmyQ3zmetx25cKw/epzFxHbl0ftz9RWA1uq3T8FmREyoVrm8Smzh+NZgp3qEglbilO6iiAHQsYanjlLV/t4nvwhYPJeUZFRsWBCSS85kLCQbUUdOFDo06MMpUKQngpCvbyCuzXf6J1HDRAcgAgDm7y4VDP48pTzJTJl2pEaOYqDVtY173+RifsrLvX2n44B2vV8ez/gWk/hbp4j8wIwh2yGZ58W5Sl2FVQz22E0DXrTy/y9beX+RUVMvBVy6zfQ3hdsdaQdOAArF7uBO6Xf8jsffzNGzHOnxWlWv9Sys8dPR+X/zAaboL56FRRID8HzCGTjamy6f++12vJ+QzBroxN69Wf0vjfwhOb2X9oLfTf+hFIyRRTTjxI1T1w0pfJbBbe0T20p7Zzb+M43maFlYfvOmLGJon6n/r3XcoaE64XHv4Zd/BRdFrLedgfWmJ56FdCytaWz/S26H99AiB5Fzv1Q2VlZJSnnv+VkeZMx0h4k4ZyrRNc0Hh9/UzWztYoJGVtN6IBLedX5wy1ybtpSuhrn39tRBnxcxBMy0LtPLIGVZMS7XN/fC9D3aD8fYSzMsp+VGyRpzg8dhEPvbUwGlItiVIRibR3PASt/twgIqZmOia/NOIAK2BL6hKTc5DjcBMt5vrcg8YZnvRRFZuxdCjyKRZwUcj6snqXjxtcdVTwzw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b3hpSWRadFBtckxlc2Q4YWlaMW85VTNONnFocGFFeFR5SnQrcWdqM2U1emJo?=
 =?utf-8?B?L0hJZVRvL3M3M24vK05GSWxBZ0NTdEhsWUY1ZlhkeVFLOXJsQnR6SEZ1ZktH?=
 =?utf-8?B?QmJKUTNqUHMwdm1tdDJQa1FxcTBhQ3NBQmVYcEhxc1FGd3BUQ0JQaTNBRUk5?=
 =?utf-8?B?QnpTSU5rWS9Wb0ovQlU5RWdacCtpNUhRTXFEQWN2NWhsbTIyT3ZOSEIvVG9t?=
 =?utf-8?B?bkdGbWlnV1NYRGdzK1p0TXlRdXFIN1JLS25tRnBLei8wcTI0RENWcVM4TThv?=
 =?utf-8?B?OHhpV2xJR3pEQzZ0a3AzOUwyRzBaci83N0Nqa2swS1UwV2VCdjJNS0Zjckdt?=
 =?utf-8?B?eWpXNkxQSFlSS2htaldIcVQzcHd0NnRjZkZ0dDUxcC9NeEppVUhENTVwckRs?=
 =?utf-8?B?UTVDb0N5QTJvYnNYcTFzQjVZd0NPT1JyWVpkZWpMdzJoWU4yOFNqMm10UGlC?=
 =?utf-8?B?ZHBKY0NvN0JyYS8rOXhEU3hxNVVVVmpRU2pSNjdEcU5VWFg3Z2dSY1lJRUFX?=
 =?utf-8?B?VWVzRkcvTkgxN05kTURoSGtuRHRnZ3FYVkU5MjdHa0x3TDIrb3RPRlYrSUU3?=
 =?utf-8?B?aFJYdXhaVW40by9NamxTOWw3ak1DdGloQWdFWWYrL01lSFBOUDlUQTQyWTRo?=
 =?utf-8?B?UUtZZDE2empJdWV0bkhIaGI4QzdHSlFlS1BPc0hkWVNtSzBpa0FRWG1vWmh6?=
 =?utf-8?B?MDVRUkhRSHVabDc0Uy85MXg5MHVJVUZIdmFKbEFOd094b1ltNzZJeDdRZi91?=
 =?utf-8?B?akJNTGI5QnhtaVY2MTIvTjErSDBzSC9oSHBzaWo2TFRxTDlpTXJKL0g2dEtu?=
 =?utf-8?B?TzBBQVoyT042MTVmSG1sSTJNeUNyMzNuMVlkbzNzdTUrTUJjU2lVNHVEMWdW?=
 =?utf-8?B?UDZOSWNORS85NnFER0VjeW5rNG5ZZkFqYXFQdmtENEkxcnV5cmE2OWFPem15?=
 =?utf-8?B?d00rTy8xZW96NHAzYVkrVTJtem5XdWIzU1JsUGpwekFSNnFVQ0swOW5pd1VZ?=
 =?utf-8?B?S3FqdGlHdzUrNWNDVUFIeWRoSGtzMVpnaW1QSEVhTnQvbXAyTVQvRzFqNGx2?=
 =?utf-8?B?YnBSQUdBZ2dONFdnN3g2ZXcxdzE4WDlLUTFpblo0d3QybDF4OW9WMFhxczc1?=
 =?utf-8?B?SVp3dUdsR0VYcnNvSUkxTDBIRUFlbzFwSUJLRXlVekZOUWhVOE5jODcwNzZq?=
 =?utf-8?B?encrdkZROEtVN2JhY29hYm1ZZWhJc0FTOXNLRnE2cWVBVkk3dW9GMkkwY1V6?=
 =?utf-8?B?K091RDFHTUtGaVlzZzJGQ2tuTS9QeFYzeXBpdGl5d0JsTm0rMlc1NTgyeTI3?=
 =?utf-8?B?SzBGbk8wanFGU0tyUERKd1RFcXE3cksvQUJkS1JSOGY2OE16OUZnRWhhQ2NE?=
 =?utf-8?B?SVplYWtkdFVKdk4vWGVHQVduVnN2SEVyRU5xMEVmVzd6ZG0vYjNnSXcrVHRh?=
 =?utf-8?B?bDNiZ0d0U3YvTG1NZ2pyMFZzOVdoTG9QRUNFWHVzWHcybERXRnJJQVlVdmtT?=
 =?utf-8?B?d2hjZ0REbDRBUGp2RExWMzhGcy9rbldpMjVZRFlmclphUTBoSFc1T3NnREoy?=
 =?utf-8?B?UG5GaE5ZcFBpV2JSeFoyemZ1Ylk4K2lpcnF2MGRHVkNWaEFUWklPdlFkTi9S?=
 =?utf-8?B?K2thS2Y2VlU0NllrZU5mL1VvTnZ5ODZYZWpJV3ZzMzA2RXBwOER4UmJJaTlC?=
 =?utf-8?B?ODJSc2VYN09PRDk2N1cwTy9HdUNtejhSRDJxY3ZFRm9hTzVkOU84cE9RVXYw?=
 =?utf-8?B?Y3FIQXhIeVFhQWozK21Od3dWYm5PY1VJTHRoTzNOMWJIcWVJWGUxL3p2MG1n?=
 =?utf-8?B?TUtNclFJUXFnNmUwbXUwbzN5bHArRXBLZ2RjSEtRK3VmNkZIWTRNZFhDQzNK?=
 =?utf-8?B?b3MrcStWSG5lcjNENi9sV3lmUTdBVjdMM3htbDFja1lZUnVCOWljTjhubjJJ?=
 =?utf-8?B?MUU0YnN0NjVmZnIrUVVnckt4ODEzeU9NRVF5Ui95N3NVeTFTRWo3elBic0Vi?=
 =?utf-8?B?andiVzZETmlITGJKRDE2T0ZZcnpnYU14dkN5T21VZVhoMWtVTE9pd0lXVUpl?=
 =?utf-8?B?WW8vQXdYQ2E3Y2RPU1g5T29rMmxXWElBN0V0UWpmSnM0bHhHL0M2aFEzbXl3?=
 =?utf-8?B?NjJiMkZqWU9pK1h1R2ZXaWcrMTJwZTl5Yi9ERXU0L1IxTkd5VkszOW1qWUJV?=
 =?utf-8?B?MkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 284c741d-9798-42b2-f58e-08dc4a555bbd
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Mar 2024 09:49:25.1147 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pxjGtXXvx3Esj2mJ30lf34O43qpc50cKLY4v5q8gu16Eu+F+qYaavb/yZ7Hqc17h94U1Mo1I/VkOBFtdt8mixyl+2qsc6HWnn5b4OGkensc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8765
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQm9tbXUsIEtyaXNobmFp
YWggPGtyaXNobmFpYWguYm9tbXVAaW50ZWwuY29tPg0KPiBTZW50OiAwNyBEZWNlbWJlciAyMDIz
IDA2OjU5DQo+IFRvOiBpbnRlbC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IEJvbW11
LCBLcmlzaG5haWFoIDxrcmlzaG5haWFoLmJvbW11QGludGVsLmNvbT47IEdoaW1pcmF5LCBIaW1h
bA0KPiBQcmFzYWQgPGhpbWFsLnByYXNhZC5naGltaXJheUBpbnRlbC5jb20+OyBVcGFkaHlheSwg
VGVqYXMNCj4gPHRlamFzLnVwYWRoeWF5QGludGVsLmNvbT4NCj4gU3ViamVjdDogW1BBVENIIHYz
IDEvMl0gZHJtL3hlOiBwcmVmZXIgc25wcmludGYgb3ZlciBzcHJpbnRmDQo+IA0KPiBTdGF0aWMg
YW5hbHl6ZXIgUmVwb3J0ZWQgIkNhbGxpbmcgcmlza3kgZnVuY3Rpb24gKERDLlNUUklOR19CVUZG
RVIp4oCdDQo+IA0KPiB2MjogUmVtb3ZlZCBoYXJkIGNvZGVkIHZhbHVlcyBhYmQgdXNlZCBzaXpl
b2YoKQ0KDQpUeXBvOiAvcy9hYmQvYW5kIA0KDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBCb21tdSBL
cmlzaG5haWFoIDxrcmlzaG5haWFoLmJvbW11QGludGVsLmNvbT4NCj4gQ2M6IEhpbWFsIFByYXNh
ZCBHaGltaXJheSA8aGltYWwucHJhc2FkLmdoaW1pcmF5QGludGVsLmNvbT4NCj4gQ2M6IFRlamFz
IFVwYWRoeWF5IDx0ZWphcy51cGFkaHlheUBpbnRlbC5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9n
cHUvZHJtL3hlL3hlX2RlYnVnZnMuYyAgICB8ICAyICstDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUv
eGVfZXhlY19xdWV1ZS5jIHwgMTIgKysrKysrLS0tLS0tDQo+IGRyaXZlcnMvZ3B1L2RybS94ZS94
ZV9ndF9kZWJ1Z2ZzLmMgfCAgMiArLQ0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X2lkbGUu
YyAgICB8ICA0ICsrLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9od19mZW5jZS5jICAgfCAg
MiArLQ0KPiAgNSBmaWxlcyBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMo
LSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGVidWdmcy5jDQo+
IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RlYnVnZnMuYyBpbmRleCA4YWJkZjNjMTdlMWQuLjg2
MTUwY2FmZTBmZg0KPiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RlYnVn
ZnMuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGVidWdmcy5jDQo+IEBAIC0xMjks
NyArMTI5LDcgQEAgdm9pZCB4ZV9kZWJ1Z2ZzX3JlZ2lzdGVyKHN0cnVjdCB4ZV9kZXZpY2UgKnhl
KQ0KPiAgCQlpZiAobWFuKSB7DQo+ICAJCQljaGFyIG5hbWVbMTZdOw0KPiANCj4gLQkJCXNwcmlu
dGYobmFtZSwgInZyYW0lZF9tbSIsIG1lbV90eXBlIC0NCj4gWEVfUExfVlJBTTApOw0KPiArCQkJ
c25wcmludGYobmFtZSwgc2l6ZW9mKG5hbWUpLCAidnJhbSVkX21tIiwNCj4gbWVtX3R5cGUgLSBY
RV9QTF9WUkFNMCk7DQo+ICAJCQl0dG1fcmVzb3VyY2VfbWFuYWdlcl9jcmVhdGVfZGVidWdmcyht
YW4sIHJvb3QsDQo+IG5hbWUpOw0KPiAgCQl9DQo+ICAJfQ0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX2V4ZWNfcXVldWUuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9l
eGVjX3F1ZXVlLmMNCj4gaW5kZXggNzMwZWI3ZDJhNjM5Li43MWJkNTJkZmViY2YgMTAwNjQ0DQo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9leGVjX3F1ZXVlLmMNCj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX2V4ZWNfcXVldWUuYw0KPiBAQCAtMjI1LDIyICsyMjUsMjIgQEAgdm9p
ZCB4ZV9leGVjX3F1ZXVlX2Fzc2lnbl9uYW1lKHN0cnVjdA0KPiB4ZV9leGVjX3F1ZXVlICpxLCB1
MzIgaW5zdGFuY2UpICB7DQo+ICAJc3dpdGNoIChxLT5jbGFzcykgew0KPiAgCWNhc2UgWEVfRU5H
SU5FX0NMQVNTX1JFTkRFUjoNCj4gLQkJc3ByaW50ZihxLT5uYW1lLCAicmNzJWQiLCBpbnN0YW5j
ZSk7DQo+ICsJCXNucHJpbnRmKHEtPm5hbWUsIHNpemVvZihxLT5uYW1lKSwgInJjcyVkIiwgaW5z
dGFuY2UpOw0KPiAgCQlicmVhazsNCj4gIAljYXNlIFhFX0VOR0lORV9DTEFTU19WSURFT19ERUNP
REU6DQo+IC0JCXNwcmludGYocS0+bmFtZSwgInZjcyVkIiwgaW5zdGFuY2UpOw0KPiArCQlzbnBy
aW50ZihxLT5uYW1lLCBzaXplb2YocS0+bmFtZSksICJ2Y3MlZCIsIGluc3RhbmNlKTsNCj4gIAkJ
YnJlYWs7DQo+ICAJY2FzZSBYRV9FTkdJTkVfQ0xBU1NfVklERU9fRU5IQU5DRToNCj4gLQkJc3By
aW50ZihxLT5uYW1lLCAidmVjcyVkIiwgaW5zdGFuY2UpOw0KPiArCQlzbnByaW50ZihxLT5uYW1l
LCBzaXplb2YocS0+bmFtZSksICJ2ZWNzJWQiLCBpbnN0YW5jZSk7DQo+ICAJCWJyZWFrOw0KPiAg
CWNhc2UgWEVfRU5HSU5FX0NMQVNTX0NPUFk6DQo+IC0JCXNwcmludGYocS0+bmFtZSwgImJjcyVk
IiwgaW5zdGFuY2UpOw0KPiArCQlzbnByaW50ZihxLT5uYW1lLCBzaXplb2YocS0+bmFtZSksICJi
Y3MlZCIsIGluc3RhbmNlKTsNCj4gIAkJYnJlYWs7DQo+ICAJY2FzZSBYRV9FTkdJTkVfQ0xBU1Nf
Q09NUFVURToNCj4gLQkJc3ByaW50ZihxLT5uYW1lLCAiY2NzJWQiLCBpbnN0YW5jZSk7DQo+ICsJ
CXNucHJpbnRmKHEtPm5hbWUsIHNpemVvZihxLT5uYW1lKSwgImNjcyVkIiwgaW5zdGFuY2UpOw0K
PiAgCQlicmVhazsNCj4gIAljYXNlIFhFX0VOR0lORV9DTEFTU19PVEhFUjoNCj4gLQkJc3ByaW50
ZihxLT5uYW1lLCAiZ3NjY3MlZCIsIGluc3RhbmNlKTsNCj4gKwkJc25wcmludGYocS0+bmFtZSwg
c2l6ZW9mKHEtPm5hbWUpLCAiZ3NjY3MlZCIsIGluc3RhbmNlKTsNCj4gIAkJYnJlYWs7DQo+ICAJ
ZGVmYXVsdDoNCj4gIAkJWEVfV0FSTl9PTihxLT5jbGFzcyk7DQo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0veGUveGVfZ3RfZGVidWdmcy5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hl
X2d0X2RlYnVnZnMuYw0KPiBpbmRleCA2YjRkYzI5Mjc3MjcuLjNhZjg1YjJmNjYyNSAxMDA2NDQN
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X2RlYnVnZnMuYw0KPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0veGUveGVfZ3RfZGVidWdmcy5jDQo+IEBAIC0yNjEsNyArMjYxLDcgQEAgdm9p
ZCB4ZV9ndF9kZWJ1Z2ZzX3JlZ2lzdGVyKHN0cnVjdCB4ZV9ndCAqZ3QpDQo+IA0KPiAgCXhlX2d0
X2Fzc2VydChndCwgbWlub3ItPmRlYnVnZnNfcm9vdCk7DQo+IA0KPiAtCXNwcmludGYobmFtZSwg
Imd0JWQiLCBndC0+aW5mby5pZCk7DQo+ICsJc25wcmludGYobmFtZSwgc2l6ZW9mKG5hbWUpLCAi
Z3QlZCIsIGd0LT5pbmZvLmlkKTsNCj4gIAlyb290ID0gZGVidWdmc19jcmVhdGVfZGlyKG5hbWUs
IG1pbm9yLT5kZWJ1Z2ZzX3Jvb3QpOw0KPiAgCWlmIChJU19FUlIocm9vdCkpIHsNCj4gIAkJZHJt
X3dhcm4oJnhlLT5kcm0sICJDcmVhdGUgR1QgZGlyZWN0b3J5IGZhaWxlZCIpOyBkaWZmIC0tZ2l0
DQo+IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X2lkbGUuYyBiL2RyaXZlcnMvZ3B1L2RybS94
ZS94ZV9ndF9pZGxlLmMgaW5kZXgNCj4gMjk4NDY4MGRlM2Y5Li5iYzE0MjZmOGQ3MzEgMTAwNjQ0
DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF9pZGxlLmMNCj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX2d0X2lkbGUuYw0KPiBAQCAtMTY2LDEwICsxNjYsMTAgQEAgdm9pZCB4
ZV9ndF9pZGxlX3N5c2ZzX2luaXQoc3RydWN0IHhlX2d0X2lkbGUgKmd0aWRsZSkNCj4gIAl9DQo+
IA0KPiAgCWlmICh4ZV9ndF9pc19tZWRpYV90eXBlKGd0KSkgew0KPiAtCQlzcHJpbnRmKGd0aWRs
ZS0+bmFtZSwgImd0JWQtbWMiLCBndC0+aW5mby5pZCk7DQo+ICsJCXNucHJpbnRmKGd0aWRsZS0+
bmFtZSwgc2l6ZW9mKGd0aWRsZS0+bmFtZSksICJndCVkLW1jIiwgZ3QtDQo+ID5pbmZvLmlkKTsN
Cj4gIAkJZ3RpZGxlLT5pZGxlX3Jlc2lkZW5jeSA9IHhlX2d1Y19wY19tYzZfcmVzaWRlbmN5Ow0K
PiAgCX0gZWxzZSB7DQo+IC0JCXNwcmludGYoZ3RpZGxlLT5uYW1lLCAiZ3QlZC1yYyIsIGd0LT5p
bmZvLmlkKTsNCj4gKwkJc25wcmludGYoZ3RpZGxlLT5uYW1lLCBzaXplb2YoZ3RpZGxlLT5uYW1l
KSwgImd0JWQtcmMiLCBndC0NCj4gPmluZm8uaWQpOw0KPiAgCQlndGlkbGUtPmlkbGVfcmVzaWRl
bmN5ID0geGVfZ3VjX3BjX3JjNl9yZXNpZGVuY3k7DQo+ICAJfQ0KPiANCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9od19mZW5jZS5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL3hl
L3hlX2h3X2ZlbmNlLmMNCj4gaW5kZXggYTVkZTNlN2IwYmQ2Li5mODcyZWYxMDMxMjcgMTAwNjQ0
DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9od19mZW5jZS5jDQo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS94ZS94ZV9od19mZW5jZS5jDQo+IEBAIC0xMzAsNyArMTMwLDcgQEAgdm9pZCB4
ZV9od19mZW5jZV9jdHhfaW5pdChzdHJ1Y3QgeGVfaHdfZmVuY2VfY3R4DQo+ICpjdHgsIHN0cnVj
dCB4ZV9ndCAqZ3QsDQo+ICAJY3R4LT5pcnEgPSBpcnE7DQo+ICAJY3R4LT5kbWFfZmVuY2VfY3R4
ID0gZG1hX2ZlbmNlX2NvbnRleHRfYWxsb2MoMSk7DQo+ICAJY3R4LT5uZXh0X3NlcW5vID0gWEVf
RkVOQ0VfSU5JVElBTF9TRVFOTzsNCj4gLQlzcHJpbnRmKGN0eC0+bmFtZSwgIiVzIiwgbmFtZSk7
DQo+ICsJc25wcmludGYoY3R4LT5uYW1lLCBzaXplb2YoY3R4LT5uYW1lKSwgIiVzIiwgbmFtZSk7
DQoNCldpdGggdHlwbyBhZGRyZXNzZWQuIExHVE0NClJldmlld2VkLWJ5OiBIaW1hbCBQcmFzYWQg
R2hpbWlyYXk8aGltYWwucHJhc2FkLmdoaW1pcmF5QGludGVsLmNvbT4NCg0KPiAgfQ0KPiANCj4g
IHZvaWQgeGVfaHdfZmVuY2VfY3R4X2ZpbmlzaChzdHJ1Y3QgeGVfaHdfZmVuY2VfY3R4ICpjdHgp
DQo+IC0tDQo+IDIuMjUuMQ0KDQo=
