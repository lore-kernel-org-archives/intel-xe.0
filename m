Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9373CC25B74
	for <intel-xe@archiver.kernel.org>; Tue, 21 May 2024 15:31:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D49910ED31;
	Tue, 21 May 2024 15:31:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P2Np8bZx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9470E10ED31
 for <intel-xe@lists.freedesktop.org>; Tue, 21 May 2024 15:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716305497; x=1747841497;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=VD9Vczc7BZ05r89RZnlGB/rad/0D/aIlpr21H02hB/M=;
 b=P2Np8bZxh0q/pKFsS0qsST/WUyJGGpU6zP1yDGJ+PFeADCC9YdIf+vTi
 yHyoWXhMBZaea1D4upqTPYLvI6jEk+KJYFnHb5D4I4MXYfdYf67NnvrGQ
 73/Bltu9kU4soWEunu0bMAxInzYUvf21Kgrl//m7QIKPHYseIs9BBINXA
 3riqbl7tVvxs+H25kYMw8fe7zOf7a7KoZsLw0GZNT7qYbaIGttJA+Rrgt
 wmYrUwwh6umR9TUuoJqmT79qZEmhWdsXLoah9Yhlut5YXzcGiY0ZEITRm
 Y0ISTEwFIKdCYOZGa4fAn98K8eIrre43fY7W4rTxw8mJg2+RQ9OERensj g==;
X-CSE-ConnectionGUID: m78y53ufQdqg3s8/oQpoHA==
X-CSE-MsgGUID: tgvK2gwFQb2O3aOM2B2ZaQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="15457610"
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; d="scan'208";a="15457610"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 08:31:36 -0700
X-CSE-ConnectionGUID: qVjFDLBSQYi9E+1ZjJDb8g==
X-CSE-MsgGUID: zbkVGnIVQKucZpXoR0LffQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; d="scan'208";a="63789317"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 May 2024 08:31:36 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 21 May 2024 08:31:35 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 21 May 2024 08:31:35 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 21 May 2024 08:31:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CBzipOXLyUBmyaUY2PMHMs3r1+LXeWaCeLQsnZwhsiQDjR7XKRiQRblgiLKoCvM0GKPIpi/hLCaXZ5JBWP9ouMGecUFceMHAn3Ie8Xzf2aQrjpQ9FFX1GN/opMo25L71ArYnfVIbTnVcNHSAG5fqEoIo8hvIZoALx6B+YcpT/ZcWCiWQQdBSPr8XCnJTyr7tWqoL8+HrMgvEuTLDpREo21yvvli/tz6zlXIKoQilB7M5M1rHcYVKlTaoDa6v3/60eVlw5KLmJgVbELodI7GFV3YMJsEDOtytOBKR9Xpo0PxzgMrgYfVXmhNeIEWx6b9r7Rklr1rs/U05D3d2m5jfFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VD9Vczc7BZ05r89RZnlGB/rad/0D/aIlpr21H02hB/M=;
 b=PoJ+MfG93n/rSXe+/vSS6SmMYs1NbT/dIW298Cl77OO+WWVy+9TS9W0qCs7uSuXU+MM2+uyFktiVSd/n8pezxegH7ftDIKex1i4xEhKOg/vnw8geMbkItUIfcDkQv7KD2kXh6tW5EFYmz9XeQa45CeF3FY2Z3RHZpALNlRj7uAlkzt8n7u8tmTe6ThaE9EpW+GotXZUOYKzBtjkD/smzZN0wVYJ90AzdEuFbwTcV3Q4ZPOX/zcvI51EkvfoSlrJMUvccMM9zpq12qDepb5EKordZxHtNTWNZOOnb3Yo752ut1NlacYFVlQ9SOWWOtGzgAlsGyxwXeqh1vbZ4l6plbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by MW3PR11MB4713.namprd11.prod.outlook.com (2603:10b6:303:2f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Tue, 21 May
 2024 15:31:33 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba%6]) with mapi id 15.20.7587.028; Tue, 21 May 2024
 15:31:12 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Dugast, Francois" <francois.dugast@intel.com>
CC: "Krzemien, Robert" <robert.krzemien@intel.com>, "Jablonski, Mateusz"
 <mateusz.jablonski@intel.com>, "Roper, Matthew D" <matthew.d.roper@intel.com>
Subject: Re: [PATCH v3 1/1] drm/xe/uapi: Expose the L3 bank mask
Thread-Topic: [PATCH v3 1/1] drm/xe/uapi: Expose the L3 bank mask
Thread-Index: AQHakA25o46sx96PKEWDrEFHhMpwJrGiB7OA
Date: Tue, 21 May 2024 15:31:12 +0000
Message-ID: <2a0eaa1aeb074fdd98f32d3df84826d7903c981b.camel@intel.com>
References: <20240416145037.7-1-francois.dugast@intel.com>
 <20240416145037.7-2-francois.dugast@intel.com>
In-Reply-To: <20240416145037.7-2-francois.dugast@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|MW3PR11MB4713:EE_
x-ms-office365-filtering-correlation-id: f2327efb-9feb-4c09-1060-08dc79ab0bab
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|366007|1800799015|376005|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?WGFNMTVrT0daa3RXL29BZ0Z6V2Eva240YUpXaER5aks4SVJ4ZHFFbVdtVmlH?=
 =?utf-8?B?aEtHUHkvd2M0UTd6QkFYN0VlbDlwdE1zR3dXN01KUnRJRURMMUp2eVpoczNu?=
 =?utf-8?B?K0RPcTZBZ1lYQkZISm9aQmhTaDNJd2k4UUl4VUFQTzNQbjgvbE5lbHNWYnR2?=
 =?utf-8?B?MTZtTE15ZTNpZGxaRll0d1pXU21wbWlVT3ZhZXlvSFNwRWxQZ011a3cwdnRo?=
 =?utf-8?B?cHBjY056Q3VJSE8vSEp2OTBpZDBMbVl1UG9VZ3ZJWHRHV0hnb20ranFlVkZW?=
 =?utf-8?B?TlhvdkxVYUpXNHF5U3R3dWxWdWNOV2huajRZY3VOTDMxdW5xK01wYjBjRjQw?=
 =?utf-8?B?SjdCSm9yaE9pWEZEYW5sYXIwQkJlNFZKa291UXU4K1lzR3JBcmloZlRZcHZs?=
 =?utf-8?B?TU5kRVQwZExlVTl1Y2U1QXpwM2NsZXAvQWZRdVRtblBhbXpTaXpYb3F2cUxQ?=
 =?utf-8?B?dTBabHgvbHBmdDVBVWs1RG9FbVExN0NnWUN2SURVb1NFTXRvQVlEVE0xQUZq?=
 =?utf-8?B?R2VtTmRzc1JQc0VVZk9KWXlpWGk5eHhqRWtnN09KTWtnRzMralBvVEc5ZUNK?=
 =?utf-8?B?dGd5Tm50T3lZUFlrUnNHMXlpeHhqejZuRFArc010NlFwc3E5TE5ZQUpMZWxt?=
 =?utf-8?B?ajloSGIyVGdRVlF6Zkp3WkpmN0xleStrcVpxQ1NlSDFlS3BYc28wRFV0ZUZU?=
 =?utf-8?B?QmtVWGdCeUpjYUQvcDIwVkl0UVVaOU1tbm1aMFFKLzRtVGhVN1ZHTEZKWUVi?=
 =?utf-8?B?LzBDZThmeWtzMFVhdWgrbzk0Q0t1by8vQkNvSHc3cDlWTnowMjBKUnVRdVBI?=
 =?utf-8?B?T0pvQm1sYlF4bGE3QTUydnZMY2pRemtadjdKTHlqWjc3ZXhSSTI0dEI1amNa?=
 =?utf-8?B?R1cwUS91OGFkMXZxTGdMa1BhU2RJSGZUOEdjUGs0Rmd1dHlZR3Z4cngxVWpN?=
 =?utf-8?B?SGM2TCtwcFE1UVRjcjlDUjJIN3kydDBkOUFzWmZBMUhjV21LZzR5dEMzYStH?=
 =?utf-8?B?OEVnSm9td28yWUdzNzBITitGZnJzL0lYUFpGcGc0bHhrVE5rWE9jVEU4amtm?=
 =?utf-8?B?dCtIR3E1ajBJUzF4Zm15Z2hkOGZXNWVIUm82WHRLTFNXekVuaG0vR0N6ZFJz?=
 =?utf-8?B?a2IzQjZ1S01iL1VzZlRZTDJ1M1pZaCtXdzRZRmU3cDJmWWVuL1R2bDM1dnJ4?=
 =?utf-8?B?RUJYbGVZdGpUT1NvRjhLTkZ0TDJZNWl2c3V4VVFRaU1nS2JUWGVjejd1WjFS?=
 =?utf-8?B?S2FobUV0dmVIUjF5UnlEeUpndis0ZWpJMnFrdVhYWFM2ME1iNWVkNC9pNUd4?=
 =?utf-8?B?VHlQWGF6SHFYRERNOXJwWll1dkF3QVl6eWVwYm4rU3lkc2JheElBdzJjQU5K?=
 =?utf-8?B?djdzR29Xa212Zmo3ekVhSDF0Mjc5WTkxaWN0aG1qczllL0JpSUtZTmR6YzJJ?=
 =?utf-8?B?eUlxS2tZeWhBcnlvS3FlQ0srbUJDOHNoaUM0WmNrbE10WndjaXdHOVcvbG5z?=
 =?utf-8?B?UlNNN2djODg4ZW14UjdBUThPSm5mSjgvUmgyT1lOR3ZrdW41ZEhXRFUzdHdm?=
 =?utf-8?B?am5WNllod1VJRFFaZTF0eUZHVFNTY01zMjN2MjIrSmpVd3dYSGRJbGp6cndj?=
 =?utf-8?B?REsvYWZnVkdSeElmZ2plRmNUd0dTenBocVZ5NkFOK2UwRUg5WGNWMkFMSFpO?=
 =?utf-8?B?M2wvMlgrVUw5K1A3NGpLNStOV0NMVUR2ckNiNnBtbTdOTEFvckttOUpRPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VTQySUJKUllyQXhWVStHQUZ0TytrTXcwTHBUSzFHeHoyVHlrck9VQi9KKzJr?=
 =?utf-8?B?S0xHdlVUb2tCN3Y3N3pDMXBqQTJPT2ZLbGVucFZYRXQ3R3N0blZTTkI3emJF?=
 =?utf-8?B?bWNNUGtaRjhuWTNHOVREMnVleFhjTlJOZFFLbUhqQ2gvY0Jxc3BEaFJDVjVR?=
 =?utf-8?B?R1RYV0psUjhOd24vKys1UXVTc05WTFpQNkFuMU5GM0tQc0Yyd1BXdkRWUE1i?=
 =?utf-8?B?R1VnVFAxMW5HSUJQZ0dTVDVWdzRyakVUMG5Hd0t1R3l6WXFwc2d1dlpLUWIv?=
 =?utf-8?B?U2dtdFpHSEplOG4zNWtWVVBmRUtaZHNMemcxcEF3NGhydDhXZGd3c1htcDJy?=
 =?utf-8?B?L0dMS01LSmgzcXV6SGlLZEc1OHR4Z2xoUHFaTXNTNFYrZ0tHaWZjdmVNR0o3?=
 =?utf-8?B?dzJVRFZVbkxLWjRWUVV3b3pFR0w0UHZ0MVM2TmlJclFLSFc1ZDArMjFTeXc1?=
 =?utf-8?B?UUVxdEp1Tk1uQ3FlUDdWbUpjZ1pwMi9XNGtNU0pHL09DMUpXOGVMNkl5YnNN?=
 =?utf-8?B?S202SXd4TDJ5eVdOUDJtR2Z1M3BhZmhDY0JNS2VqNXBCMnMvMmc4RzlRTlRF?=
 =?utf-8?B?VlgyeldtaEZKVHc5RHdsVFNEL2ZCNDZKbnB4TGVERE5GOFhuWnpTVWt3Sm5u?=
 =?utf-8?B?dk1ORnluVHdrM2IrTXFTaGtrZnFqejh0V0VyR1NLcm5DOVV1WU5jSkUxWEd0?=
 =?utf-8?B?c216Q2hNaFR5dzYwd2N5S1dIYjBIeUg2ZFc1aHNDd25ZZ0I4MlVieDRQakcr?=
 =?utf-8?B?cm5nVU9FaE15Szl3cU55MUFTZjJ6bGhKUXBUR0hFa29NSkU3a0h3RXlFcjRl?=
 =?utf-8?B?ZTVXVGk5QVFGVnpvUGRDcFV2YXVndlV0SXVJRTRGVTZza092US82dzFoZXRD?=
 =?utf-8?B?S0VQNHc0SmpwNjZtdXhoUnFFbXpjdWdadmhYc0Ywb05wejVtMGFNRmxGUkFk?=
 =?utf-8?B?RHlQZjRmeitiaGd0dktkQWFNU3BicldqQzVCL0VWUTBQemUwQ2Q4Q2dGSHBr?=
 =?utf-8?B?TjVFKzBrSzRZdEluNUQwV2F1bFR2VzFWQ2JUa0ZhblpzY0E2dExSbExCWm5U?=
 =?utf-8?B?LzQxUERmbENnbTJKcVJMaFNrRzlJMytHeG1YcENiUGVuN3BvSFJad3M5emUr?=
 =?utf-8?B?TkNKNmhzYnVWUFdFcGtvNHlVT1YyVm5JSTNnd25yNzhyK0UrUXZFWEVadTlu?=
 =?utf-8?B?RnhXdkZ2QzduQytSUFlZZURjd3JEYkZmNWdLaFdBK2xMYlhJcGlmYTkwNnRY?=
 =?utf-8?B?Z25oVzF3d00yN0NENUdkNEhsY25oOWZKMHdqbzJKZVZmeE41cThJZmxWSUhk?=
 =?utf-8?B?Rzc4MDJ2ZEtEVk5RaWpTOExhOXMzdVdtV0hNbTNPRHdoZXhtQWM2RWJHTEZP?=
 =?utf-8?B?ZFBnd2RvWTVtcytnSlhzVFVnblFLYjJWQmw2Sm5sc3NnaU0xL1NibjlCcjhw?=
 =?utf-8?B?UUphdEVzZlJVQVUvT0VyMkF1QmUwT2VFMmk4OHhaeFd4UmNKaVFtZHhxNkkx?=
 =?utf-8?B?VklKTWtCV0x6Z2hBdm42bzhFRnh5aW16TTRidGRMLy9qbnNVZFpZeUR3ZVpp?=
 =?utf-8?B?Tndlb1R4emJVMkhHSHUxekZVZThjVS84bWhmRkZGYXJMMVIwa3Mya0x0OGFR?=
 =?utf-8?B?MXNLOGU2VlJ6eEQwVExoODZRQmJHSzM2TGJGK0VUNUdJSzFNTVk1YmNCbDBS?=
 =?utf-8?B?anJVb0lWUDRRcEZwZndZM3RWUldZaTMxSUpuMVpZRnRZaHpmTGU2SzRsVG1Z?=
 =?utf-8?B?SmxsOVBwWUQ4a0lZVG15VUpTOWRxSTQ1bnp0dVpMcFYvVUhMNThvcllub2tS?=
 =?utf-8?B?TmdkOUpsOFRqUml5amZzWGxOWlprZGJzb0Zsc1g0QUV6eU1yRVdhWkhKMXdu?=
 =?utf-8?B?OExnRGtzNlJENlhpV28yTGxLbmpMR0J0T3hSS1hWd3ptSkFsM25rVTlHWnVz?=
 =?utf-8?B?aFRqcW9QeUJRL2Vuek5SYlF3NzNpYnlOVzlvM09OQUdoN25vS0kzYnpBeXp2?=
 =?utf-8?B?TEx3UGNtTFBkeUM2bG9iMVFOM2ZEQkVmNE9pNDlpMC9jOWtVSFA1Ymo0MkNY?=
 =?utf-8?B?KzRJUHhIRWFRR2ZuK0NBVHJrUXkrWGhoWlcrNVovSndNcEdwaXpxeGdzQ1FR?=
 =?utf-8?B?WnRtRllYRTh6VWwvOHpRaVhaUUdTWmtaMm41QU9PSzZLNzArYkowdlorUHU1?=
 =?utf-8?B?OWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <252790AE14C97946B6B556B34B02AB0D@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2327efb-9feb-4c09-1060-08dc79ab0bab
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2024 15:31:12.1798 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CC8XLUNNkQoy2tAZFpWJUo7gNvRqtRWANOCdN1eMmCTy87hffe40aKO6pzK+G0SwX6oaD1gK6P6uVi/e5th6uQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4713
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

T24gVHVlLCAyMDI0LTA0LTE2IGF0IDE0OjUwICswMDAwLCBGcmFuY29pcyBEdWdhc3Qgd3JvdGU6
DQo+IFRoZSBMMyBiYW5rIG1hc2sgaXMgYWxyZWFkeSBnZW5lcmF0ZWQgYW5kIHN0b3JlZCBpbnRl
cm5hbGx5IHdpdGgNCj4gdGhlIHJlc3Qgb2YgdGhlIEdUIHRvcG9sb2d5LiBJbiB1c2VyIHNwYWNl
LCB0aGUgY29tcHV0ZSBydW50aW1lDQo+IG5vdyBuZWVkcyB0aGlzIGluZm9ybWF0aW9uIHRvIGJl
IGFkZGVkIHRvIHRoZSBkZXZpY2UgcHJvcGVydGllcw0KPiB0aGVyZWZvcmUgdGhlIHRvcG9sb2d5
IG1hc2sgcXVlcnkgaXMgZXh0ZW5kZWQgdG8gcHJvdmlkZSBhIG5ldw0KPiBtYXNrIHdoaWNoIHJl
cHJlc2VudHMgdGhlIEwzIGJhbmtzIGVuYWJsZWQgb24gdGhlIEdULg0KPiANCj4gVGhlIGNoYW5n
ZXMgaW4gdGhlIGNvbXB1dGUgcnVudGltZSBhcmUgcmVhZHkgYW5kIGFwcHJvdmVkLCBzZWUNCj4g
bGluayBiZWxvdy4NCj4gDQo+IHYyOiBSZXdyaXRlIGNvbW1pdCBtZXNzYWdlIGFuZCBhZGQgYSBs
aW5rIHRvIHRoZSBjb21wdXRlDQo+ICAgICBydW50aW1lIFBSIChGcmFuY29pcyBEdWdhc3QpDQo+
IA0KDQpSZXZpZXdlZC1ieTogSm9zw6kgUm9iZXJ0byBkZSBTb3V6YSA8am9zZS5zb3V6YUBpbnRl
bC5jb20+DQoNCj4gQ2M6IE1hdHQgUm9wZXIgPG1hdHRoZXcuZC5yb3BlckBpbnRlbC5jb20+DQo+
IENjOiBSb2JlcnQgS3J6ZW1pZW4gPHJvYmVydC5rcnplbWllbkBpbnRlbC5jb20+DQo+IENjOiBN
YXRldXN6IEphYmxvbnNraSA8bWF0ZXVzei5qYWJsb25za2lAaW50ZWwuY29tPg0KPiBMaW5rOiBo
dHRwczovL2dpdGh1Yi5jb20vaW50ZWwvY29tcHV0ZS1ydW50aW1lL3B1bGwvNzIyDQo+IFNpZ25l
ZC1vZmYtYnk6IEZyYW5jb2lzIER1Z2FzdCA8ZnJhbmNvaXMuZHVnYXN0QGludGVsLmNvbT4NCj4g
LS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfcXVlcnkuYyB8IDkgKysrKysrKystDQo+ICBp
bmNsdWRlL3VhcGkvZHJtL3hlX2RybS5oICAgICB8IDIgKysNCj4gIDIgZmlsZXMgY2hhbmdlZCwg
MTAgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS94ZS94ZV9xdWVyeS5jIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3F1ZXJ5LmMN
Cj4gaW5kZXggZGY0MDdkNzNlNWY1Li42ZTAxNzBiZGFlNDQgMTAwNjQ0DQo+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS94ZS94ZV9xdWVyeS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9x
dWVyeS5jDQo+IEBAIC00NTQsOSArNDU0LDEwIEBAIHN0YXRpYyBpbnQgcXVlcnlfaHdjb25maWco
c3RydWN0IHhlX2RldmljZSAqeGUsDQo+ICBzdGF0aWMgc2l6ZV90IGNhbGNfdG9wb19xdWVyeV9z
aXplKHN0cnVjdCB4ZV9kZXZpY2UgKnhlKQ0KPiAgew0KPiAgCXJldHVybiB4ZS0+aW5mby5ndF9j
b3VudCAqDQo+IC0JCSgzICogc2l6ZW9mKHN0cnVjdCBkcm1feGVfcXVlcnlfdG9wb2xvZ3lfbWFz
aykgKw0KPiArCQkoNCAqIHNpemVvZihzdHJ1Y3QgZHJtX3hlX3F1ZXJ5X3RvcG9sb2d5X21hc2sp
ICsNCj4gIAkJIHNpemVvZl9maWVsZChzdHJ1Y3QgeGVfZ3QsIGZ1c2VfdG9wby5nX2Rzc19tYXNr
KSArDQo+ICAJCSBzaXplb2ZfZmllbGQoc3RydWN0IHhlX2d0LCBmdXNlX3RvcG8uY19kc3NfbWFz
aykgKw0KPiArCQkgc2l6ZW9mX2ZpZWxkKHN0cnVjdCB4ZV9ndCwgZnVzZV90b3BvLmwzX2Jhbmtf
bWFzaykgKw0KPiAgCQkgc2l6ZW9mX2ZpZWxkKHN0cnVjdCB4ZV9ndCwgZnVzZV90b3BvLmV1X21h
c2tfcGVyX2RzcykpOw0KPiAgfQ0KPiAgDQo+IEBAIC01MTAsNiArNTExLDEyIEBAIHN0YXRpYyBp
bnQgcXVlcnlfZ3RfdG9wb2xvZ3koc3RydWN0IHhlX2RldmljZSAqeGUsDQo+ICAJCWlmIChlcnIp
DQo+ICAJCQlyZXR1cm4gZXJyOw0KPiAgDQo+ICsJCXRvcG8udHlwZSA9IERSTV9YRV9UT1BPX0wz
X0JBTks7DQo+ICsJCWVyciA9IGNvcHlfbWFzaygmcXVlcnlfcHRyLCAmdG9wbywgZ3QtPmZ1c2Vf
dG9wby5sM19iYW5rX21hc2ssDQo+ICsJCQkJc2l6ZW9mKGd0LT5mdXNlX3RvcG8ubDNfYmFua19t
YXNrKSk7DQo+ICsJCWlmIChlcnIpDQo+ICsJCQlyZXR1cm4gZXJyOw0KPiArDQo+ICAJCXRvcG8u
dHlwZSA9IERSTV9YRV9UT1BPX0VVX1BFUl9EU1M7DQo+ICAJCWVyciA9IGNvcHlfbWFzaygmcXVl
cnlfcHRyLCAmdG9wbywNCj4gIAkJCQlndC0+ZnVzZV90b3BvLmV1X21hc2tfcGVyX2RzcywNCj4g
ZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9kcm0veGVfZHJtLmggYi9pbmNsdWRlL3VhcGkvZHJt
L3hlX2RybS5oDQo+IGluZGV4IDE0NDZjM2JhZTUxNS4uZDdiMDkwM2MyMmIyIDEwMDY0NA0KPiAt
LS0gYS9pbmNsdWRlL3VhcGkvZHJtL3hlX2RybS5oDQo+ICsrKyBiL2luY2x1ZGUvdWFwaS9kcm0v
eGVfZHJtLmgNCj4gQEAgLTUwOCw2ICs1MDgsNyBAQCBzdHJ1Y3QgZHJtX3hlX3F1ZXJ5X2d0X2xp
c3Qgew0KPiAgICogICAgY29udGFpbmluZyB0aGUgZm9sbG93aW5nIGluIG1hc2s6DQo+ICAgKiAg
ICBgYERTU19DT01QVVRFICAgIGZmIGZmIGZmIGZmIDAwIDAwIDAwIDAwYGANCj4gICAqICAgIG1l
YW5zIDMyIERTUyBhcmUgYXZhaWxhYmxlIGZvciBjb21wdXRlLg0KPiArICogIC0gJURSTV9YRV9U
T1BPX0wzX0JBTksgLSBUbyBxdWVyeSB0aGUgbWFzayBvZiBlbmFibGVkIEwzIGJhbmtzDQo+ICAg
KiAgLSAlRFJNX1hFX1RPUE9fRVVfUEVSX0RTUyAtIFRvIHF1ZXJ5IHRoZSBtYXNrIG9mIEV4ZWN1
dGlvbiBVbml0cyAoRVUpDQo+ICAgKiAgICBhdmFpbGFibGUgcGVyIER1YWwgU3ViIFNsaWNlcyAo
RFNTKS4gRm9yIGV4YW1wbGUgYSBxdWVyeSByZXNwb25zZQ0KPiAgICogICAgY29udGFpbmluZyB0
aGUgZm9sbG93aW5nIGluIG1hc2s6DQo+IEBAIC01MjAsNiArNTIxLDcgQEAgc3RydWN0IGRybV94
ZV9xdWVyeV90b3BvbG9neV9tYXNrIHsNCj4gIA0KPiAgI2RlZmluZSBEUk1fWEVfVE9QT19EU1Nf
R0VPTUVUUlkJMQ0KPiAgI2RlZmluZSBEUk1fWEVfVE9QT19EU1NfQ09NUFVURQkJMg0KPiArI2Rl
ZmluZSBEUk1fWEVfVE9QT19MM19CQU5LCQkzDQo+ICAjZGVmaW5lIERSTV9YRV9UT1BPX0VVX1BF
Ul9EU1MJCTQNCj4gIAkvKiogQHR5cGU6IHR5cGUgb2YgbWFzayAqLw0KPiAgCV9fdTE2IHR5cGU7
DQoNCg==
