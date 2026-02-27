Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 858DFFEFB70
	for <intel-xe@archiver.kernel.org>; Fri, 27 Feb 2026 17:49:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F3AE10EBE2;
	Fri, 27 Feb 2026 17:49:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Iy3n4lpm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F02A110EBEC
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Feb 2026 17:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772214556; x=1803750556;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=7NvFha+6a6+9uDl+HemrzkDA/rkNArr2Vg5Uj4M0EG0=;
 b=Iy3n4lpmQzhtp1WVUTv6R88s0o7REms6QqAAQjCFhBYE5j93YrPqmcfO
 sFdLHs5lU1KvgpQaqfelU6HVF/PSO6sAnsBex2T/SIPmgeYywK2QBR71W
 0s3rmHAaJd7paCKhBUNYVyjjhsb7MrY3IekG7uD+nVph3Nd/rIHaHyW9r
 uZ4BqzGNJWbEl99o9pyVw0l3shhwO+ghacUUZ0viZLeBb6lg1m5kNUybM
 Vm/No5gLL71WmQ9CIwDL2wDT3cAM88tAqPtLywrpLcmvrbDaRJTL6E673
 LrQwZzCQrAKBOUKS1pZYhditX6eFIl4PQYzqup29y/nBmIv1dohTtMphN Q==;
X-CSE-ConnectionGUID: EyzI5tTdQcqyYMONdsiKAg==
X-CSE-MsgGUID: 1/Rlo3VPRo6cGrbLvBn/sA==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="83633607"
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="83633607"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 09:49:15 -0800
X-CSE-ConnectionGUID: 1GGRjYxjQVydtN6bdZQz7A==
X-CSE-MsgGUID: p6fW6pBNQa+jkHKRwkMycQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="221102092"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 09:49:15 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Feb 2026 09:49:15 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 27 Feb 2026 09:49:15 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.48) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Feb 2026 09:49:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yqRRvKEQZpArSUYCgAJZjbkuIht1RZF64fSUQGiBgRAvRpFbo9kLCYTtDmoW8t2urNmtkAOtDNX3G3SYp+3VA2AYi0H3o91bvY3KcmDrFXA98snz3lHK3lCzE7ge1GxGYnF5GlJHr53QwlLo3VPhJ/5ytvan2xNZMeGM7+QpHyroapL++By+xtJfTWFzlE6kmGFLBPGSqN4dZe5pbU2mjp8VUY6roQ4/hCyrFU6vsMye8PUmzgU84AFXgjVHuDBzUtqlJara64/IasfYfEW9tNCjkcQ6xdxtD04uFWablk5zkCB+n87WteC+XoN+gM4+hHTmXOlOanEWhZocy9zdYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7NvFha+6a6+9uDl+HemrzkDA/rkNArr2Vg5Uj4M0EG0=;
 b=U7/NrFBLCZX4qbw9gzLXnpJHtFLu/y4u20ZrBQ5sgN1/ejxS3Kyag+Azf5bjrCye4hK1GJJ46Eqkcj0uwuBDWzN+X07e2ZTO1T4ReAHb+s3tDZeEbFXhmsFZBCQ1szCIKCh1bLORv5iWf8wPbsZ6Je/2D32WeqJ8N7ahK4icdSJyecEcDAXjOI0jYQtby3006mBbHtKCwHWki958ROPidppnZ9N8yszZcJXMgPKpSlJGHV5hlwECSfRetI5cIr8UgRsrAjEjVWlRhc47B1PBijbkFzilsuEb8OjN1QW16SwxfZZUFx3gpmGY9H9v6gcfxbBvNnQK75OToF7SFa5o6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SJ1PR11MB6203.namprd11.prod.outlook.com (2603:10b6:a03:45a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.16; Fri, 27 Feb
 2026 17:49:12 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9654.015; Fri, 27 Feb 2026
 17:49:12 +0000
From: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Jadav, 
 Raag" <raag.jadav@intel.com>, "aravind.iddamsetty@linux.intel.com"
 <aravind.iddamsetty@linux.intel.com>
CC: "Auld, Matthew" <matthew.auld@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>, "Brost, Matthew" <matthew.brost@intel.com>,
 "Winiarski, Michal" <michal.winiarski@intel.com>,
 "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>,
 "maarten@lankhorst.se" <maarten@lankhorst.se>, "Tauro, Riana"
 <riana.tauro@intel.com>, "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>
Subject: Re: [PATCH v2 9/9] drm/xe/pci: Introduce PCIe FLR
Thread-Topic: [PATCH v2 9/9] drm/xe/pci: Introduce PCIe FLR
Thread-Index: AQHcqAsQo9F0Ae/w2kuw+MZZQqBU7rWW0qoA
Date: Fri, 27 Feb 2026 17:49:12 +0000
Message-ID: <f6183892f5caac00192c83b213e3e22e5e9ad453.camel@intel.com>
References: <20260227170049.3418863-1-raag.jadav@intel.com>
 <20260227170049.3418863-10-raag.jadav@intel.com>
In-Reply-To: <20260227170049.3418863-10-raag.jadav@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.58.3 (3.58.3-1.fc43) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CYYPR11MB8430:EE_|SJ1PR11MB6203:EE_
x-ms-office365-filtering-correlation-id: 1141ae37-a182-4ebd-73f3-08de76288447
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: qScQ8Q7k6vZ+l08B/vrq94U80PHjmwXutCkKH0MEjdo11YZ6oVy63KCbDHqnREiSsZpaXNLA7CPOVnN5YfXwadquatnD3sgyf0pc0TUtqTaMxTCjPtg7BSVNc+xkwVnz/xZxh5FMKYO9OSz6/Xbr6NX8djdfin9qw2KBYuSaUVIOkFldkuc8/QeVqre7aaZ3aVEOIIeu1ZOYr5ZUvuKXDyokHnlwOt2fFBbw8LqudI9YmpIY0orlznXLcyX7F2AZg+cRXX9LqYt3Oa9vEP4yrZZkg8TAcuzR5JpTbXGANo2aryQZ4gXnlFZRIS3Q6NPyK2SqAFeWYmH0T16sQn8N+v1kkLP/+EZJt3Y5k7gP5tWHhAP0vlpx/0kvYE506kqZ3O6XLFOAmDukhRP/jhoJHGnyp3hA7kX1ZuBHS58TlJxdIij7yY825GuiQdmBJ5kX1ApxCln1e5K7U56/l0R/gBmzD+QPJP5Igz7HPJIQh9qXqtg3R+TkNIe3cmf0uaCqLRUd5QNckVNwKhNZU+IfdvcFNu1I03pp0Q7q/WtWqRaSkbwvx23G2KwpUutb4KPNoSxkCRlB8RIxY+joxa1Me7dWuVolY/00abK/MP+x6ojz3n2aSWyO0SL9AntSgTOByvPRNN7jwF/EVKP+01PxKGyU/cQ45TNUlbTd74XwFVAgqY+V25uNCuHnvQOSaoJZm0g9OJriKUPdhqW6Z6CuQR9BiQzUiU6qBSRERokzUS745QymPfBZZiZBGUPunHXeiNtfq6XoGexwrALGapJY/IDPA8KMSBT9I5Hna9M1PRs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cW1yUlBiSThOQXlpV3dVa1c1MlRVblBjb2dFUG55Y2pQaWt1ZlNoc2daOEF0?=
 =?utf-8?B?NStpS2RxSVdBcllyOUMrNm9BbFpzcVNaaHNYTERoSVExQmZUaEZseWQzdnJF?=
 =?utf-8?B?ZWRzRzRwNFB3V2IzZVIyaUlZYitkbkhmc2NWaDRsTWZMRXFvV1JERk5lbWZy?=
 =?utf-8?B?R3U2TXhhY3ZKdUdqUHJ6VzQ1ZkJydWdvdEF4UkM1NFdLSmlaUE03dFhKZjRq?=
 =?utf-8?B?dlFjKzBJUGJVWGx3a1lDZnRpa1gzTzRRdm9LQ3FhcVJDekEyS3lsYVVzZU0y?=
 =?utf-8?B?RXNXVGdJNWkyUUdRMk5RNCsrbTBpenBtQkY0ejVRdWV0MDBRTWJrM2E3dUdt?=
 =?utf-8?B?OXR5WDlHZFZzU1RoMHVEQXVDSFpxN1dDN2lCQndtTXRpQkJNT2RYSzl4TktO?=
 =?utf-8?B?TE5qRzAxYk92ajNLRXdlb0ZlenExQlB1d2VsQWQzQ2ZtTVlVZk5qMUlra3ZE?=
 =?utf-8?B?bjJoeDFaaEtMSnBSZm9QbWVrampYamtzbWRqa1FDV0VQWXg4d2pmQUhUVWVZ?=
 =?utf-8?B?Vy9YTGdEUjRIQXRsdGdJZjUwUkhRamNtYXZBbUVLdVBPVzNZTDlQR0ttcytw?=
 =?utf-8?B?dGZ4dzh1RkRvN2dHSkRIN0ZNMVZydmdreHBDNHQ0U1hsblorYU5LaDRieVdk?=
 =?utf-8?B?MlNpekJlRWl6Z0YzQk5CTmRqRUpIYXlOVjRaY3B2WS9aMTBIa1lXRWE4MlNF?=
 =?utf-8?B?c1dTU0h0K2toMkh4dmtXb1NvSEovTWVMVGQ3dHJqU3RBUVUrcDRLeFdJSS9w?=
 =?utf-8?B?WmpLa0wwSUxqRXVWY2hsRWJRazlvRDROY2dmT1JpSGN4VUIvWU5aeXd5NTdS?=
 =?utf-8?B?Zlh4b1kzRHRlSlkxTHlBTU5CTWlTTGJ2bE5mSSt0TGtuTFFNM2treE9tRHV3?=
 =?utf-8?B?REFXelBxUTBJQWNXVzR3RWVYQ1Zta01kbElzU2MrdGxVdkhjL2tBSEEvYjNG?=
 =?utf-8?B?S3ZMK3hXenN6Uk03NHIreStLV2d5Mmtoa1RoWWpxRndWYWdzQVZpZVEvODlV?=
 =?utf-8?B?VUxSSVQ3NzJhaVpGdXBPeS9xU2N6V0xPN29RY2FyWnAzRWtVQ0pVS1NIbHRs?=
 =?utf-8?B?aFFmS0xJVzhCQTBqOXIwaENZWkNpbjBub2hUWHIzTVFOS2Z2VGNVZjEwZVYx?=
 =?utf-8?B?R1Z0WmlNSjZYR3QzNVQrMGFMMzBlWHR2cGtySkg2OGZmejVzVmdOS05COWYw?=
 =?utf-8?B?VVlEdC9CSGFyZlIwb09pMkNDQ3dlaUdPZnlDNytmRngxUVVxRHZKMSsvWjlL?=
 =?utf-8?B?TnJaRnFNMUpnMUdQSHNIcS9nZEVZbWp5TnlWcTVFaCtiMTV2dlhGMmt1Q2VM?=
 =?utf-8?B?dml5czMvK2kyNFNKUnlHeDk1cWdFc1A3c3NPREdlVk5sdVFtSkRxVWlEZXYy?=
 =?utf-8?B?TVZBTHRBNTR6aFF4ellXQm54c1NLQlNFY1M3VzlwdDl4Rzl5K2s1cHQ4eE9M?=
 =?utf-8?B?R1BlTXdqcnRsbTB3L1g3ZDJHY0hlZzBVTGFzRjVoejJhV2IwZ2IvdDc2Y0hx?=
 =?utf-8?B?RFlyTG8vN3UxaTMvVThNcUUzcmYzcjlYL0JvemV5ZlRGNjVldEVWem1XTmJz?=
 =?utf-8?B?cklhZ0d2d09uUEY2Mm1iWmF2TUZtMTZ1U2p3NVM1UHFveHBzSWFLMEg1Yktp?=
 =?utf-8?B?bjlIZW1yNnBBMWlmUUxCa3M5M0pPOVRXUXlrOG9zWWVCdVU5MXNDRHBQZDFC?=
 =?utf-8?B?TlorUzZ0TjFHdUYxME5BclZxbjBvTHhjSlREQWdSRWpBQ3hzWDhsQXgyM0Fz?=
 =?utf-8?B?b1VVSFlodG1pb1UybkgybHFsZXZBalVhZGJwU3M4RE41MmNwZGFQaCtkY0dZ?=
 =?utf-8?B?NC9nNlF4UEZYN2drdmVybkNtV1JmS3RGNlJQUWlJbmk5YUl3OVU5eHdIV3Bt?=
 =?utf-8?B?TE0wbHRTeEVqNVpnNG1tMlc0ZEVzc2dVS2swanVCU0J2YUtFSW10Ylk1bWRN?=
 =?utf-8?B?SjNRZFJiZmNqUmUwL2pKY3cwb3JNNkZ5RnJoRldMY1J6dHhNMVpzNkFFNTVK?=
 =?utf-8?B?NjdyTFppeWFySWZNeTFZQTV5NG1qYjdEYURxYVNNM3pUQkVSNjRObjR0NTFl?=
 =?utf-8?B?Q1FTMFNNTHVXK251ZzlqMHBGQmoxeEtTZ0lvSzFnMmw2K1k4VGFmMnhkbVdG?=
 =?utf-8?B?Yjk3OW5hSW5jY0RQclFGSXB5bmFSbS9kME1RckZFWVV2ZDN4bGlQTXdLZjQ3?=
 =?utf-8?B?a25SQlJLaFhQQk9Pd0Ewb25PRUZLamFDY1RaNWZOSGpNMzUvcG9mOTAzNi9m?=
 =?utf-8?B?L0xNa04vU3hEY1h3cEpTRmtyWEpYakxrcmZtTzZvd0ttOWJFa2RmWmhXNTBp?=
 =?utf-8?B?eklsaDhtbDJWVFNaNnJnQWlEcTI1Z2NhQTF3bzRGVkFST2sydFU2VzM0SlQr?=
 =?utf-8?Q?X50Ygq3/mxjP9TR4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CD408419B43F2B42B31A1F102F99F013@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1141ae37-a182-4ebd-73f3-08de76288447
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2026 17:49:12.3160 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i306dT/ld+cE1JZAyotqe5VsTGauiIkD166iWy73dDiXW3+UjeWh7OhYc6CcOD9PecTxa1EH+z4mxCr93F/RtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6203
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

T24gRnJpLCAyMDI2LTAyLTI3IGF0IDIyOjMwICswNTMwLCBSYWFnIEphZGF2IHdyb3RlOg0KPiBX
aXRoIGFsbCB0aGUgcGllY2VzIGluIHBsYWNlLCB3ZSBjYW4gZmluYWxseSBpbnRyb2R1Y2UgUENJ
ZSBGdW5jdGlvbg0KPiBMZXZlbA0KPiBSZXNldCAoRkxSKSBoYW5kbGluZyB3aGljaCByZS1pbml0
aWFsaXplcyBoYXJkd2FyZSBzdGF0ZSB3aXRob3V0IHRoZQ0KPiBuZWVkDQo+IGZvciByZWxvYWRp
bmcgdGhlIGRyaXZlciBmcm9tIHVzZXJzcGFjZS4gQWxsIFZSQU0gY29udGVudHMgYXJlIGxvc3QN
Cj4gYWxvbmcNCj4gd2l0aCBoYXJkd2FyZSBzdGF0ZSwgc28gdGhlIGRyaXZlciB0YWtlcyBjYXJl
IG9mIHJlY3JlYXRpbmcgdGhlDQo+IHJlcXVpcmVkDQo+IGtlcm5lbCBib3MgYXMgcGFydCBvZiBy
ZS1pbml0aWFsaXphdGlvbiwgYnV0IHVzZXIgc3RpbGwgbmVlZHMgdG8NCj4gcmVjcmVhdGUNCj4g
dXNlciBib3MgYW5kIHJlbG9hZCBjb250ZXh0IGFmdGVyIFBDSWUgRkxSLg0KPiANCj4gU2lnbmVk
LW9mZi1ieTogUmFhZyBKYWRhdiA8cmFhZy5qYWRhdkBpbnRlbC5jb20+DQoNCkNjOiBNaWNoYcWC
IFdpbmlhcnNraSA8bWljaGFsLndpbmlhcnNraUBpbnRlbC5jb20+DQpDYzogQXJhdmluZCBJZGRh
bXNldHR5IDxhcmF2aW5kLmlkZGFtc2V0dHlAbGludXguaW50ZWwuY29tPg0KDQpEbyB3ZSByZWFs
bHkgaGF2ZSBldmVyeXRoaW5nIGluIHBsYWNlPyBJJ20gbWlzc2luZyB0aGUgaGFuZGxpbmcgb2Yg
VkYNCmhlcmUuIEhlbmNlIHdlIHdvdWxkIGhhdmUgdGhlIHNhbWUgZGVhZGxvY2sgcG9pbnRlZCBv
dXQgYnkgTWljaGFsIHdoZW4NCkFyYXZpbmQgYXR0ZW1wdGVkIGl0IGxhc3QgdGltZSwgbm8/IQ0K
DQpXZSBwcm9iYWJseSBuZWVkIHRvIHVzZSB0aGUgZ3VjIHJlbGF5IGNvbW11bmljYXRpb24gaGVy
ZSBzbyBQRiBjYW4NCmluZm9ybSBWRiBvZiB0aGUgRkxSLCB0aGVuIHN0b3AgYWxsIHRoZSB3b3Jr
bG9hZCBhbmQgd2VkZ2UgdGhlIGRldmljZSwNCmJlZm9yZSB0aGUgQUVSIHRyaWdnZXJzIGEga2ls
bCBvZiB0aGUgVk0sIG5vPyENCg0KPiAtLS0NCj4gdjI6IFNwZWxsIG91dCBGdW5jdGlvbiBMZXZl
bCBSZXNldCAoSmFuaSkNCj4gLS0tDQo+IMKgZHJpdmVycy9ncHUvZHJtL3hlL01ha2VmaWxlwqDC
oMKgwqAgfMKgwqAgMSArDQo+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3BjaS5jwqDCoMKgwqAg
fMKgwqAgMSArDQo+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3BjaS5owqDCoMKgwqAgfMKgwqAg
MiArDQo+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3BjaV9lcnIuYyB8IDE1MA0KPiArKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKw0KPiDCoDQgZmlsZXMgY2hhbmdlZCwgMTU0IGluc2Vy
dGlvbnMoKykNCj4gwqBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3Bj
aV9lcnIuYw0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS9NYWtlZmlsZQ0K
PiBiL2RyaXZlcnMvZ3B1L2RybS94ZS9NYWtlZmlsZQ0KPiBpbmRleCA3ZmM2N2MzMjAwODYuLmJj
NDY4YTlhZmM0OCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL01ha2VmaWxlDQo+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS9NYWtlZmlsZQ0KPiBAQCAtOTksNiArOTksNyBAQCB4
ZS15ICs9IHhlX2JiLm8gXA0KPiDCoAl4ZV9wYWdlX3JlY2xhaW0ubyBcDQo+IMKgCXhlX3BhdC5v
IFwNCj4gwqAJeGVfcGNpLm8gXA0KPiArCXhlX3BjaV9lcnIubyBcDQo+IMKgCXhlX3BjaV9yZWJh
ci5vIFwNCj4gwqAJeGVfcGNvZGUubyBcDQo+IMKgCXhlX3BtLm8gXA0KPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX3BjaS5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3Bj
aS5jDQo+IGluZGV4IDBhM2JjNTA2N2E3Ni4uNDdhMmY5ZGU5ZDYxIDEwMDY0NA0KPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0veGUveGVfcGNpLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hl
X3BjaS5jDQo+IEBAIC0xMzAxLDYgKzEzMDEsNyBAQCBzdGF0aWMgc3RydWN0IHBjaV9kcml2ZXIg
eGVfcGNpX2RyaXZlciA9IHsNCj4gwqAjaWZkZWYgQ09ORklHX1BNX1NMRUVQDQo+IMKgCS5kcml2
ZXIucG0gPSAmeGVfcG1fb3BzLA0KPiDCoCNlbmRpZg0KPiArCS5lcnJfaGFuZGxlciA9ICZ4ZV9w
Y2lfZXJyX2hhbmRsZXJzLA0KPiDCoH07DQo+IMKgDQo+IMKgLyoqDQo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0veGUveGVfcGNpLmgNCj4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfcGNp
LmgNCj4gaW5kZXggMTFiY2M1ZmUyYzViLi44NWU4NWU4NTA4YzMgMTAwNjQ0DQo+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV9wY2kuaA0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVf
cGNpLmgNCj4gQEAgLTgsNiArOCw4IEBADQo+IMKgDQo+IMKgc3RydWN0IHBjaV9kZXY7DQo+IMKg
DQo+ICtleHRlcm4gY29uc3Qgc3RydWN0IHBjaV9lcnJvcl9oYW5kbGVycyB4ZV9wY2lfZXJyX2hh
bmRsZXJzOw0KPiArDQo+IMKgaW50IHhlX3JlZ2lzdGVyX3BjaV9kcml2ZXIodm9pZCk7DQo+IMKg
dm9pZCB4ZV91bnJlZ2lzdGVyX3BjaV9kcml2ZXIodm9pZCk7DQo+IMKgc3RydWN0IHhlX2Rldmlj
ZSAqeGVfcGNpX3RvX3BmX2RldmljZShzdHJ1Y3QgcGNpX2RldiAqcGRldik7DQo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfcGNpX2Vyci5jDQo+IGIvZHJpdmVycy9ncHUvZHJt
L3hlL3hlX3BjaV9lcnIuYw0KPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiBpbmRleCAwMDAwMDAw
MDAwMDAuLjE2ZmM2YTlmODI4OQ0KPiAtLS0gL2Rldi9udWxsDQo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS94ZS94ZV9wY2lfZXJyLmMNCj4gQEAgLTAsMCArMSwxNTAgQEANCj4gKy8vIFNQRFgtTGlj
ZW5zZS1JZGVudGlmaWVyOiBNSVQNCj4gKy8qDQo+ICsgKiBDb3B5cmlnaHQgwqkgMjAyNiBJbnRl
bCBDb3Jwb3JhdGlvbg0KPiArICovDQo+ICsNCj4gKyNpbmNsdWRlICJ4ZV9ib19ldmljdC5oIg0K
PiArI2luY2x1ZGUgInhlX2RldmljZS5oIg0KPiArI2luY2x1ZGUgInhlX2d0LmgiDQo+ICsjaW5j
bHVkZSAieGVfZ3RfaWRsZS5oIg0KPiArI2luY2x1ZGUgInhlX2kyYy5oIg0KPiArI2luY2x1ZGUg
InhlX2lycS5oIg0KPiArI2luY2x1ZGUgInhlX2xhdGVfYmluZF9mdy5oIg0KPiArI2luY2x1ZGUg
InhlX3BjaS5oIg0KPiArI2luY2x1ZGUgInhlX3Bjb2RlLmgiDQo+ICsjaW5jbHVkZSAieGVfcHJp
bnRrLmgiDQo+ICsjaW5jbHVkZSAieGVfcHhwLmgiDQo+ICsjaW5jbHVkZSAieGVfd2EuaCINCj4g
Kw0KPiArc3RhdGljIGludCB4ZV9mbHJfcHJlcGFyZShzdHJ1Y3QgeGVfZGV2aWNlICp4ZSkNCj4g
K3sNCj4gKwlzdHJ1Y3QgeGVfZ3QgKmd0Ow0KPiArCWludCBlcnI7DQo+ICsJdTggaWQ7DQo+ICsN
Cj4gKwllcnIgPSB4ZV9weHBfcG1fc3VzcGVuZCh4ZS0+cHhwKTsNCj4gKwlpZiAoZXJyKQ0KPiAr
CQlyZXR1cm4gZXJyOw0KPiArDQo+ICsJeGVfbGF0ZV9iaW5kX3dhaXRfZm9yX3dvcmtlcl9jb21w
bGV0aW9uKCZ4ZS0+bGF0ZV9iaW5kKTsNCj4gKw0KPiArCWZvcl9lYWNoX2d0KGd0LCB4ZSwgaWQp
DQo+ICsJCXhlX2d0X2Zscl9wcmVwYXJlKGd0KTsNCj4gKw0KPiArCXhlX2lycV9kaXNhYmxlKHhl
KTsNCj4gKw0KPiArCS8vIFRPRE86IERyb3AgYWxsIHVzZXIgYm9zDQo+ICsJeGVfYm9fcGNpX2Rl
dl9yZW1vdmVfcGlubmVkKHhlKTsNCj4gKw0KPiArCXJldHVybiAwOw0KPiArfQ0KPiArDQo+ICtz
dGF0aWMgaW50IHhlX2Zscl9kb25lKHN0cnVjdCB4ZV9kZXZpY2UgKnhlKQ0KPiArew0KPiArCXN0
cnVjdCB4ZV90aWxlICp0aWxlOw0KPiArCXN0cnVjdCB4ZV9ndCAqZ3Q7DQo+ICsJaW50IGVycjsN
Cj4gKwl1OCBpZDsNCj4gKw0KPiArCWZvcl9lYWNoX2d0KGd0LCB4ZSwgaWQpDQo+ICsJCXhlX2d0
X2lkbGVfZGlzYWJsZV9jNihndCk7DQo+ICsNCj4gKwlmb3JfZWFjaF90aWxlKHRpbGUsIHhlLCBp
ZCkNCj4gKwkJeGVfd2FfYXBwbHlfdGlsZV93b3JrYXJvdW5kcyh0aWxlKTsNCj4gKw0KPiArCWVy
ciA9IHhlX3Bjb2RlX3JlYWR5KHhlLCB0cnVlKTsNCj4gKwlpZiAoZXJyKQ0KPiArCQlyZXR1cm4g
ZXJyOw0KPiArDQo+ICsJeGVfZGV2aWNlX2Fzc2VydF9sbWVtX3JlYWR5KHhlKTsNCj4gKw0KPiAr
CWVyciA9IHhlX2JvX3Jlc3RvcmVfbWFwKHhlKTsNCj4gKwlpZiAoZXJyKQ0KPiArCQlyZXR1cm4g
ZXJyOw0KPiArDQo+ICsJZm9yX2VhY2hfZ3QoZ3QsIHhlLCBpZCkgew0KPiArCQllcnIgPSB4ZV9n
dF9mbHJfZG9uZShndCk7DQo+ICsJCWlmIChlcnIpDQo+ICsJCQlyZXR1cm4gZXJyOw0KPiArCX0N
Cj4gKw0KPiArCXhlX2kyY19wbV9yZXN1bWUoeGUsIHRydWUpOw0KPiArDQo+ICsJeGVfaXJxX3Jl
c3VtZSh4ZSk7DQo+ICsNCj4gKwlmb3JfZWFjaF9ndChndCwgeGUsIGlkKSB7DQo+ICsJCWVyciA9
IHhlX2d0X3Jlc3VtZShndCk7DQo+ICsJCWlmIChlcnIpDQo+ICsJCQlyZXR1cm4gZXJyOw0KPiAr
CX0NCj4gKw0KPiArCXhlX3B4cF9wbV9yZXN1bWUoeGUtPnB4cCk7DQo+ICsNCj4gKwl4ZV9sYXRl
X2JpbmRfZndfbG9hZCgmeGUtPmxhdGVfYmluZCk7DQo+ICsNCj4gKwlyZXR1cm4gMDsNCj4gK30N
Cj4gKw0KPiArc3RhdGljIHZvaWQgeGVfcGNpX3Jlc2V0X3ByZXBhcmUoc3RydWN0IHBjaV9kZXYg
KnBkZXYpDQo+ICt7DQo+ICsJc3RydWN0IHhlX2RldmljZSAqeGUgPSBwZGV2X3RvX3hlX2Rldmlj
ZShwZGV2KTsNCj4gKw0KPiArCS8qIFRPRE86IEV4dGVuZCBzdXBwb3J0IGFzIGEgZm9sbG93LXVw
ICovDQo+ICsJaWYgKCFJU19ER0ZYKHhlKSB8fCBJU19TUklPVl9WRih4ZSkgfHwgcGNpX251bV92
ZihwZGV2KSB8fA0KPiB4ZS0+aW5mby5wcm9iZV9kaXNwbGF5KSB7DQo+ICsJCXhlX2Vycih4ZSwg
IlBDSWUgRkxSIG5vdCBzdXBwb3J0ZWRcbiIpOw0KPiArCQlyZXR1cm47DQo+ICsJfQ0KPiArDQo+
ICsJLyogV2VkZ2UgdGhlIGRldmljZSB0byBwcmV2ZW50IHVzZXJzcGFjZSBhY2Nlc3MgYnV0IGRv
bid0DQo+IHNlbmQgdGhlIGV2ZW50IHlldCAqLw0KPiArCWF0b21pY19zZXQoJnhlLT53ZWRnZWQu
ZmxhZywgMSk7DQo+ICsNCj4gKwkvKg0KPiArCSAqIFRoZSBoYXJkd2FyZSBjb3VsZCBiZSBpbiBj
b3JydXB0ZWQgc3RhdGUgYW5kIGFjY2Vzcw0KPiB1bnJlbGlhYmxlLCBidXQgd2UgdHJ5IHRvDQo+
ICsJICogdXBkYXRlIGRhdGEgc3RydWN0dXJlcyBhbmQgY2xlYW51cCBhbnkgcGVuZGluZyB3b3Jr
IHRvDQo+IGF2b2lkIHNpZGUgZWZmZWN0cyBkdXJpbmcNCj4gKwkgKiBQQ0llIEZMUi4gVGhpcyB3
aWxsIGJlIHNpbWlsYXIgdG8geGVfcG1fc3VzcGVuZCgpIGZsb3cNCj4gYnV0IHdpdGhvdXQgbWln
cmF0aW9uLg0KPiArCSAqLw0KPiArCWlmICh4ZV9mbHJfcHJlcGFyZSh4ZSkpIHsNCj4gKwkJeGVf
ZXJyKHhlLCAiRmFpbGVkIHRvIHByZXBhcmUgZm9yIFBDSWUgRkxSXG4iKTsNCj4gKwkJcmV0dXJu
Ow0KPiArCX0NCj4gKw0KPiArCXhlX2luZm8oeGUsICJQcmVwYXJlZCBmb3IgUENJZSBGTFJcbiIp
Ow0KPiArfQ0KPiArDQo+ICtzdGF0aWMgdm9pZCB4ZV9wY2lfcmVzZXRfZG9uZShzdHJ1Y3QgcGNp
X2RldiAqcGRldikNCj4gK3sNCj4gKwlzdHJ1Y3QgeGVfZGV2aWNlICp4ZSA9IHBkZXZfdG9feGVf
ZGV2aWNlKHBkZXYpOw0KPiArDQo+ICsJLyogVE9ETzogRXh0ZW5kIHN1cHBvcnQgYXMgYSBmb2xs
b3ctdXAgKi8NCj4gKwlpZiAoIUlTX0RHRlgoeGUpIHx8IElTX1NSSU9WX1ZGKHhlKSB8fCBwY2lf
bnVtX3ZmKHBkZXYpIHx8DQo+IHhlLT5pbmZvLnByb2JlX2Rpc3BsYXkpDQo+ICsJCXJldHVybjsN
Cj4gKw0KPiArCWlmICgheGVfZGV2aWNlX3dlZGdlZCh4ZSkpIHsNCj4gKwkJeGVfZXJyKHhlLCAi
RGV2aWNlIGluIHVuZXhwZWN0ZWQgc3RhdGUsIHJlLQ0KPiBpbml0aWFsaXphdGlvbiBhYm9ydGVk
XG4iKTsNCj4gKwkJcmV0dXJuOw0KPiArCX0NCj4gKw0KPiArCS8qDQo+ICsJICogV2UgYWxyZWFk
eSBoYXZlIHRoZSBkYXRhIHN0cnVjdHVyZXMgaW50YWN0LCBzbyB0cnkgdG8gcmUtDQo+IGluaXRp
YWxpemUgdGhlIGRldmljZS4NCj4gKwkgKiBUaGlzIHdpbGwgYmUgc2ltaWxhciB0byB4ZV9wbV9y
ZXN1bWUoKSBmbG93LCBleGNlcHQgd2UnbGwNCj4gYWxzbyBuZWVkIHRvIHJlY3JlYXRlDQo+ICsJ
ICogYWxsIFZSQU0gY29udGVudHMuDQo+ICsJICovDQo+ICsJaWYgKHhlX2Zscl9kb25lKHhlKSkg
ew0KPiArCQl4ZV9lcnIoeGUsICJSZS1pbml0aWFsaXphdGlvbiBmYWlsZWRcbiIpOw0KPiArCQly
ZXR1cm47DQo+ICsJfQ0KPiArDQo+ICsJLyogVW53ZWRnZSB0byBhbGxvdyB1c2Vyc3BhY2UgYWNj
ZXNzICovDQo+ICsJYXRvbWljX3NldCgmeGUtPndlZGdlZC5mbGFnLCAwKTsNCj4gKw0KPiArCXhl
X2luZm8oeGUsICJSZS1pbml0aWFsaXphdGlvbiBzdWNjZXNzXG4iKTsNCj4gK30NCj4gKw0KPiAr
LyoNCj4gKyAqIFBDSWUgRnVuY3Rpb24gTGV2ZWwgUmVzZXQgKEZMUikgc3VwcG9ydCBvbmx5Lg0K
PiArICogVE9ETzogQWRkIFBDSWUgZXJyb3IgaGFuZGxlcnMgdXNpbmcgc2ltaWxhciBmbG93Lg0K
PiArICovDQo+ICtjb25zdCBzdHJ1Y3QgcGNpX2Vycm9yX2hhbmRsZXJzIHhlX3BjaV9lcnJfaGFu
ZGxlcnMgPSB7DQo+ICsJLnJlc2V0X3ByZXBhcmUgPSB4ZV9wY2lfcmVzZXRfcHJlcGFyZSwNCj4g
KwkucmVzZXRfZG9uZSA9IHhlX3BjaV9yZXNldF9kb25lLA0KPiArfTsNCg==
