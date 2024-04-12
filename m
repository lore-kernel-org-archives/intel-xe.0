Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18BCAC4345F
	for <intel-xe@archiver.kernel.org>; Fri, 12 Apr 2024 20:50:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A554510E8CC;
	Fri, 12 Apr 2024 20:50:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g+S7Ljs+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0548E10E8CC
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Apr 2024 20:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712955038; x=1744491038;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=+7svStPjeco9ujsBG55/T2prETURWVe9XDBGJSDpR4Y=;
 b=g+S7Ljs+XkIvI38VtgV0kNriTCx3vwHrA8j5FFcawNI6DYAZ486bSHgr
 q74yY8kPVnwQUtH+Rb0swGZO+e/1tP9iIDPdPI+KgMyIjD/BsW8sRR3K2
 FlacTca1g7ujp05Kej+7DkMRuBhKAPuwDIkIqxd4tE/LhjvoeX4uewEDb
 w1EH7NhBqXiRTa9QEf5G6mKczFAFG31g5stVD2aElEiXBOF0Y+2TQyy/j
 l1Q2t30jRpVoI540LgjIMJCGDKEqIkCCClg/oJ+omlLK0saen4G5yWyNh
 f/boBk4I7ev4ALkZdjuR4TlIzCLeeB5gWJf+1J5zj93G4lb7cm2DJnIX9 Q==;
X-CSE-ConnectionGUID: l8pnbVmETTeEZlmNx5hLXg==
X-CSE-MsgGUID: DDOqHSISSviLiFL1SdYO1Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11042"; a="25945006"
X-IronPort-AV: E=Sophos;i="6.07,197,1708416000"; d="scan'208";a="25945006"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 13:50:37 -0700
X-CSE-ConnectionGUID: gvZ7/AP6Q2SNOGQ4ESjuHg==
X-CSE-MsgGUID: N6IJxgAkQX+WHoG5zPKXTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,197,1708416000"; d="scan'208";a="21408562"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Apr 2024 13:50:37 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 12 Apr 2024 13:50:36 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 12 Apr 2024 13:50:36 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 12 Apr 2024 13:50:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O+GDatpTnWyRZkIlkGgXrToTqO385MJhHhuqEJACK3mNwgCuCkGXoDlHjCnPRY/jSO4KPT/oteKvrePDiOgdqOmFmE147xRpQmiyRqFQGFMttnS/j/ik4qiffZT0JMQFCVKomUAGi0vabHLr2eaD4BSMci7nsuqYiBKPlj7CGXuPbIsG2w2leWRplzN2v+qrTyDS98eqnsOaz7UplXQdIIlqknygOP2iUsTOoEPMZipy4OBkpoNbV8J8f0fa3h7m8gkE7jswo6/GH47RA0JAY3dfGu1m2GGP3e8KH2QHTlFKRhnqCy+NDXCIgRWXe21WExYUY8UsCIUVbHp0bLcH5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+7svStPjeco9ujsBG55/T2prETURWVe9XDBGJSDpR4Y=;
 b=bz6YGeYscv6mWciNJWlZQWU0ea+w+WD6nBHn+zfJOA1bpHAG2KUFyueUi5FvVgsKwxuZgy9eMkAjk65ySi5yOMX0Ycui1lcYKnhpWcspw85sDFRGH1do1EM/bVylWuyH1wyopxRApeYrNcqAoie2mW7X2SJsRnGs47YC/lnTgzA2GXaKhgoUZUt8V/dmNtB+68R8XFo22M+xw0pPJJzqgghJvdRVwAM66nd0gTLBt2LRX+LByQ178DCDRX8i8uOLvoYyAv3J/3h22mZoLRmBRWSSgZZ90kBWQEiEGgei8/56LyX23AG+swI2zNqofPlnEWxj4Oi9DyCK9kgtwmZoCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 MN2PR11MB4518.namprd11.prod.outlook.com (2603:10b6:208:24f::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Fri, 12 Apr
 2024 20:50:27 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::36d1:7f54:624d:aabf]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::36d1:7f54:624d:aabf%6]) with mapi id 15.20.7452.019; Fri, 12 Apr 2024
 20:50:27 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
CC: "Brost, Matthew" <matthew.brost@intel.com>, "Harrison, John C"
 <john.c.harrison@intel.com>, "Gupta, saurabhg" <saurabhg.gupta@intel.com>,
 "De Marchi, Lucas" <lucas.demarchi@intel.com>
Subject: Re: [PATCH v4 3/3] drm/xe/xe_guc_submit: Declare reset if banned or
 killed
Thread-Topic: [PATCH v4 3/3] drm/xe/xe_guc_submit: Declare reset if banned or
 killed
Thread-Index: AQHah4SZVcMkXsmeBUy4NyFelNZ3/LFlJwyA
Date: Fri, 12 Apr 2024 20:50:27 +0000
Message-ID: <bb51c48274c7a6947d1b9cd356a752cae4ee110d.camel@intel.com>
References: <20240405175505.1161756-1-jonathan.cavitt@intel.com>
 <20240405175505.1161756-3-jonathan.cavitt@intel.com>
In-Reply-To: <20240405175505.1161756-3-jonathan.cavitt@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|MN2PR11MB4518:EE_
x-ms-office365-filtering-correlation-id: 6912fc08-6267-4f31-38e8-08dc5b322f1b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: F0kEv3amglLfPNKR0G2QhUygSZ1oIrMmem/HFRi62RbX+XuNTBQ8R2IL/E8WvMZX0ylHF6GwuxFL2Sxn5FbLaUskJkzOJ536pTMtPcPkbwxX8Lt4rakO97NV10ij4kJaB6CVUQzIKZBSAJYbDk9wuNij/a5S3YtQXOa/KhT3PO7BpQikuSowyQIZPALP/uqJrBWTK03qwNLgEKih7ahL+F0so/W4BbR2yB1FyHzSOu4zeGGVxgLA8T8ksr7ocncQcWbBHg/sBBRhovkrHhhK4IL35cJJ7HTkTaZukwmQpNsOawEkq3RbF+qRvH4ojTcGMIos1TLb2xZSNvrrttBjEH/yG+jmY+Qfp+bUyvG7TdC2zx7rEDHdmzicjfoaCL4VA2oCpIBWifNYTFEIKStMnbXWlE5UCSA15CXSipxRNwd0vD9At3hrxVQ+JtLPblbvBcqeAtWIepr0Bn0UvdKbdCtr7wGIQZ+UKgdwEDgLMb1/iWeaf6NMGSeuWDoQOiC8xKUJtzwaS4QBvnkBwSjjosREiD4iHvvcLzGlJIB3LSFz3fLe0Tx+Ic9JTMWaSniE2UCCL6tz1v0Tj5ASdCVacDq6se5KAP9iky0D+6lL3ww4ebthuI/7/f6eYc+dIUQiuLISGaRYcRTHN513lVW4jxVRz/LDOpGmoaeEJOVtL4Tf9jej3jhl7H5+cCW3jkm4IMthnsKJcbVlMxpoXvh2N/xiFHvurfRBmrG70qurfxk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q0d2U1ZWU1d3RFFoNWZoNGI3THVmRXZVYmZyWVRYYTU0YTc2MVNXZzlGSm1U?=
 =?utf-8?B?VVZUeEsvaGFtV2s0STJDeWMwUFBUTDN0SEkxei9UQm5TQWpLVzRvcWNQWEZy?=
 =?utf-8?B?Qnd3OEViWWFrT1djV1UxclhPK1hSYzB4aWRNenp4VFBrV0FTdWJQM1J0STNY?=
 =?utf-8?B?V25ISnc4ZFhrcEZGa0tJdVc4TEtsc1VrWXBrM2tGNHBzR2ZQcEJYVEY3NC9H?=
 =?utf-8?B?VjRlSE5QOHQyQ25qWU1qZENraDZFZHFCc3Y3amZ4N1RhSHZDdW8weExOem9i?=
 =?utf-8?B?aWxCNG9YOGwvRmdhNUVMb01qTUVlUjJLOEpMQ3F4SjNCVXBuSDk1UDNxeUxv?=
 =?utf-8?B?RnF6VlZ6M0tzbnRDSFVFdndISGtvL1BLMm9YR2pyV3NFdkM2ZFNQcThWcDZw?=
 =?utf-8?B?MWJPTnpRMWlmTE5md1lsZFJRYy9qRXI1UDEza2J6WDZmYVU4cVFNM3dXdFBJ?=
 =?utf-8?B?cXluYno2TGxxcGk5OUh5cThTYkZjU1RJTmp2VXdCb0d1UmJYRzQ4Z2hIZ3Ur?=
 =?utf-8?B?eVBCYUZHYkZpMDB1VFJzSjQrU01YNmtnbnMyYW52Rk90cy8rUTFiYTFVT3J3?=
 =?utf-8?B?YjhFV2drWi8wYnNRZHBkQ2lYY1ZoSURYdExvVWdxVnVPeTR3WHVOdEUvK0Fq?=
 =?utf-8?B?a05IYzg0YkR0eVdkZHF0QzQzeVh1dnJHSENpbkdUNjJ0UXcwZWhBcktFWXVv?=
 =?utf-8?B?WncyRlYrMnBqb2oxRGlEWlAybnhERkd5ckZmVUVyczhuaHU4NTk0ZitkN3c5?=
 =?utf-8?B?UjJoT3dWUldVb1A0cmwyWGtZRUVUMHRBK2dBS0ErL3lzR3EreWZPUmVLeXd2?=
 =?utf-8?B?UHM1aWFuWnZ5Y21JbWVNN29qWjFrODBtY05GYW82V1h5NVJnOGJJbW5ZeWt3?=
 =?utf-8?B?N25Bdnp0TWdJUDhQbFYydC9WQjBsVjJ3ZWVXZ082SERlbHZEWWk0a29lNVVQ?=
 =?utf-8?B?VGdDK1cvSXlPWC9GMW1kZFBDR3FmS3VoelRNcU5MenJ5a2tBbnhRQjlIMEx0?=
 =?utf-8?B?dkUzMi9hZHg3WjhxNlFrRUkzVE9QVnNXQ1NyMU1OMnRBbWxRYm9QTzVYL0E4?=
 =?utf-8?B?ZTFJbE1aR2lJQkVSUUVqVC9zeDhHSWJZVUs1WG1HdjNHYXNEQWduSzJUNWFy?=
 =?utf-8?B?NzYyL1pUWmYrOUl2LzBnUVJGM3hkU3R6bGp2YzJGNFExZDNnV2NTSUtIT256?=
 =?utf-8?B?dG4vODIxTlZpNDlpVHFtaTNuWWxVc1YrMHRJWVN3Q25CbGd5S05iTmlzYnpD?=
 =?utf-8?B?VVE4bVg4Mk1vdzdYVW1xa09XdWNScGVINE1ZL0VVYmxUMk51aUo1S1NFQkFa?=
 =?utf-8?B?eW90dlZtbGpzR2oydk1ldFgzNVBHbXVkek5ZWUtpVzRveExSMzZpT1k1VWU0?=
 =?utf-8?B?Q3JDNjkvdml5ZWxmTVNFOFVNWERyUzhMcDhURS9sb2Q3N21Rc0UrUXRrek5K?=
 =?utf-8?B?TEp0eGlkcXd2VHBLcXdjSVRVOE0relVjdUZHTU1ETGhWVEF5azdPbXVUbEZx?=
 =?utf-8?B?Y2VrZVBOK1YxZmZ3TVJVRG9MdmtjUE9HbVE4VGFWamZybzE5dzlwUDk2S0J1?=
 =?utf-8?B?dnJWeDlvS01TeHo4bkw5NHNBRGt1L2R2YkZwOFZNUGQ5OWthQmhTMjRGRzlR?=
 =?utf-8?B?OFQzRDFkN1lNQStCYXorMTdqNWVSNm9jNHZReThDOUVqR2YwZURnRzhlR3V0?=
 =?utf-8?B?WCtJQ0VUaFVTZmNSc1BTbmdEd1JUeGpRWDdLT1RyTHFkcEtJdWRuOTAxaFlv?=
 =?utf-8?B?RjAxSG9IYnZ6LzdrSEVhbDBlUTE3b05KUDRDZEFRaEFTb05rY0ZhQ1lSL0Iw?=
 =?utf-8?B?RkphR2RrcDVFM21Ock9mb2ZGb3dqL2pRUUFNMnY0clkrS2xVbVVGQU1uRVgy?=
 =?utf-8?B?d3hJR05rWlM1a2RtdWxkdVFiamZ1R3NVN2I4UVZkWGR0Z2NMZko0L0VkN3gx?=
 =?utf-8?B?N3Y0bXowVkZRMitJblZISnVBb1BVTHBjdlIyMDE4ckdvcWJuWWRzWFhCeWlz?=
 =?utf-8?B?R3VmVldTL2dJQUdJbVorVnV3QXdFNHJQU0NVN0xjT0xLTFhjajNPK3FkZEIw?=
 =?utf-8?B?bEJ6RnJCdzNOYmNoNGpVd0tnN2greGxlOCtlZ1RPbzdrcjF5clk2MUlwWnN2?=
 =?utf-8?B?dkRaMHJaWmMzN3BuR3pPMkVVNjA1bWtTRXFYb2xtRXBZQndNdDVsQ3A5VmZ0?=
 =?utf-8?B?bHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FB88ADBA969F9B43832339DDB223E842@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6912fc08-6267-4f31-38e8-08dc5b322f1b
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Apr 2024 20:50:27.5953 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eKVRHVW3rK1HEFKS8HoAOc7BBSJsfitrSG2VxhNVPas4DgEq01DaekzGHLeJ9+a91LT1FbPzyuuzk+1wklUnous5joD4sgwqQ6QnUXRlSrk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4518
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

T24gRnJpLCAyMDI0LTA0LTA1IGF0IDEwOjU1IC0wNzAwLCBKb25hdGhhbiBDYXZpdHQgd3JvdGU6
DQo+IEFkZCBhbiBhZGRpdGlvbmFsIGNvbmRpdGlvbiB0byB0aGUgcmVzZXRfc3RhdHVzIGd1Y19l
eGVjX3F1ZXVlX29wDQo+IHRoYXQNCj4gcmV0dXJucyB0cnVlIGlmIHRoZSBleGVjIHF1ZXVlIGhh
cyBiZWVuIGJhbm5lZCBvciBraWxsZWQuwqAgVGhlDQo+IHJlc2V0X3N0YXR1cyBvcCBpcyBvbmx5
IHVzZWQgZm9yIGV4aXRpbmcgYW55IHhlX3dhaXRfdXNlcl9mZW5jZV9pb2N0bA0KPiB0aGF0IHdh
aXRzIG9uIGFuIGV4ZWMgcXVldWUgd2l0aG91dCB0aW1pbmcgb3V0LCBzbyBkb2luZyB0aGlzIHdp
bGwNCj4gZXhpdA0KPiB0aGUgaW9jdGwgZWFybHkgaW4gY2FzZXMgd2hlcmUgdGhlIGV4ZWMgcXVl
dWUgY2FuIG5vIGxvbmdlciBmdW5jdGlvbiwNCj4gc3VjaCBhcyBhZnRlciBhIEd1QyBzdG9wIGR1
cmluZyBhIHJlc2V0Lg0KPiANCj4gU3VnZ2VzdGVkLWJ5OiBNYXR0aGV3IEJyb3N0IDxtYXR0aGV3
LmJyb3N0QGludGVsLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogSm9uYXRoYW4gQ2F2aXR0IDxqb25h
dGhhbi5jYXZpdHRAaW50ZWwuY29tPg0KDQpNYWtlcyBzZW5zZS4NCg0KUmV2aWV3ZWQtYnk6IFN0
dWFydCBTdW1tZXJzIDxzdHVhcnQuc3VtbWVyc0BpbnRlbC5jb20+DQoNCj4gLS0tDQo+IMKgZHJp
dmVycy9ncHUvZHJtL3hlL3hlX2d1Y19zdWJtaXQuYyB8IDIgKy0NCj4gwqAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0veGUveGVfZ3VjX3N1Ym1pdC5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hl
X2d1Y19zdWJtaXQuYw0KPiBpbmRleCBlNzJmMmE2Y2FkNjBhLi5kNTE4MmY2NjE3N2YxIDEwMDY0
NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX3N1Ym1pdC5jDQo+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfc3VibWl0LmMNCj4gQEAgLTEzNzEsNyArMTM3MSw3IEBA
IHN0YXRpYyB2b2lkIGd1Y19leGVjX3F1ZXVlX3Jlc3VtZShzdHJ1Y3QNCj4geGVfZXhlY19xdWV1
ZSAqcSkNCj4gwqANCj4gwqBzdGF0aWMgYm9vbCBndWNfZXhlY19xdWV1ZV9yZXNldF9zdGF0dXMo
c3RydWN0IHhlX2V4ZWNfcXVldWUgKnEpDQo+IMKgew0KPiAtwqDCoMKgwqDCoMKgwqByZXR1cm4g
ZXhlY19xdWV1ZV9yZXNldChxKTsNCj4gK8KgwqDCoMKgwqDCoMKgcmV0dXJuIGV4ZWNfcXVldWVf
cmVzZXQocSkgfHwgZXhlY19xdWV1ZV9raWxsZWRfb3JfYmFubmVkKHEpOw0KPiDCoH0NCj4gwqAN
Cj4gwqAvKg0KDQo=
