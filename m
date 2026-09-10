Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D014C79F9F
	for <intel-xe@archiver.kernel.org>; Thu, 10 Sep 2026 12:26:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0619110E22F;
	Thu, 10 Sep 2026 12:26:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k4LXeJiR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0073310E22F;
 Thu, 10 Sep 2026 12:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789043166; x=1820579166;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=p/57lMyH6IRudN71Mo/C8uhkNBUqXNj8CKuGv3UQMa0=;
 b=k4LXeJiRQYB/5FucQQZoRGj01fQWoD6q8Ja4Jw6MWHyNulc1hVyEDlQC
 xhH91G0tPjXC3t7/o/UL6gr/1lnB7n5zHx0GoYVVhOo2rHqhZNphjn/Cm
 gpBAC9YylndTvSIhk4LIdjsFmwwxdojyLCxYHcJ/2vDJi72Ehf+UU7Oum
 jluvawKyaJqMz9nm1PGoqbyo1VxOZsWR4VqeMhKVKBDO7mgD9wes1k7Rr
 q98NaziMf8nMQZYxr89EkjmA4Rj0UGlDGwzWKQMFbbK0cqv9fwA2VK1Eh
 xY8TdXYjWbujxP2TX8WPOGjpfke61qYmv4wEUIk6ccpm++2Xvx7GigGKG g==;
X-CSE-ConnectionGUID: E5IvpgtBRw69usAVYaCE5A==
X-CSE-MsgGUID: R1T/+aE+QWi3pt5NUGQ5vg==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="93181726"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="93181726"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 05:26:04 -0700
X-CSE-ConnectionGUID: vwFuL2W9RaiIBmjcSoZ1lw==
X-CSE-MsgGUID: y0PfKv0OSeuUJB8EWOEJgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; d="scan'208";a="272121361"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 05:26:05 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 10 Sep 2026 05:26:03 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 10 Sep 2026 05:26:03 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.54) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 10 Sep 2026 05:26:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w99znSK1dyTbDjtBqt1vc0qfoX3OqccC6gu10/YuvTfwvD+X+KQjGTc+aEvZLlG9if/UeCGgxbTpYfWAIUB7G88x254G19FnMax145Ygkhn6L1AboFIe6kKPQB21+h+E1HSmigXj9mQefUjIy7Oo2ZKEs4LJ46h1IHme8bFJLifY3tNRv2hCgDNRA3LP3pGLTgxAdapZ84q5eTg8LTYt5HPk+SVtyFF5XO1M0rbEoDHGbkDsEuvRgBoM1GrE0Uj/Vgh5WYI/Nifbmb0LJE83WJtVDKhzus31Gz1+Z5OYfK1MCjivRX8AWPKtj+Kc23sMYzDCwU2NW2sUbQ5eC/lnyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p/57lMyH6IRudN71Mo/C8uhkNBUqXNj8CKuGv3UQMa0=;
 b=QATfsHEPLh/3DcdpsTjYQB0GbKMIi74vyGI9Ip7TZZN+EazJyWCOjrO7EX9NJfUo+BWCMDl6hL1S7SMu161kkoy3/t2/IzCED1sCoezLhvrRh3ElYyo5CLwyTd5INBzvKELGAJ3PkBDeB3XLzRNeWgqelpeJnsX/SU8dFiUn5R4B3VCd0ChXitb2q53G+rya7OUe4urBbnab8swW4/O/E0AOhqM9XfMKA3jv1ekbynLrNCQT1HnPTVs7bkN3CAfr6UBCNnPrEdUe+SnYeNdB7KYrcNlsCQRrxtutHk4r1+0nenxUP1X6P4mkpYOj/7HsCah3uWs1Mg69fxYL/vjMVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 DM3PPFA69606334.namprd11.prod.outlook.com (2603:10b6:f:fc00::f42)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 12:25:56 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762%6]) with mapi id 15.21.0406.007; Thu, 10 Sep 2026
 12:25:54 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Garg, 
 Nemesa" <nemesa.garg@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/i915/psr: Clear stale sel fetch enable bits on
 sel fetch disable
Thread-Topic: [PATCH 2/2] drm/i915/psr: Clear stale sel fetch enable bits on
 sel fetch disable
Thread-Index: AQHdQEtDw1hTOHkyLku+/+dwQIYeP7bHvnMA
Date: Thu, 10 Sep 2026 12:25:54 +0000
Message-ID: <615974f2a7d9784de6bb39f0406015a600130518.camel@intel.com>
References: <20260909110332.3528029-1-nemesa.garg@intel.com>
 <20260909110332.3528029-3-nemesa.garg@intel.com>
In-Reply-To: <20260909110332.3528029-3-nemesa.garg@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|DM3PPFA69606334:EE_
x-ms-office365-filtering-correlation-id: 2b1b9013-0f44-484d-85a5-08df0f36a8de
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|38070700021|6133799003|10067099003|56012099006|4143699003|11063799006|18002099003|22082099003;
x-microsoft-antispam-message-info: vs72P+o1gIdzJBuPwfAZ+iQz/TFf3u3FBNN/k8N+bA/SUk1eAVNob4/sI00g2oR564F2edqC9CHRkEBw8e7rluyZsYP0QtiJbjRs0cAeAMVzX2LFnjOV7tep1GAN8PSZA2VV4V+SNR7/Xv36QH3wixyhL33IwP3OUgZUV0vB0qID3K32htDaQj6wlewpv993GgqAxx37pRKrU6U1XjewIMf2Tmcml3KsokCljN/67kH+QxBktSgz0P89mVK07PWADT7FmBXXpjqM5kyk2xRY3Lfk4WRGhZZyfeD0Je8XHcj0CRj7cL+GlJvlPKksQzvGD5u+n4HWb6BbvFOZDlwIf5VexanrMkHrCa1I/Q58PuG1VWtkXYPwyVLqR/zOpvsWj45Y92ZSzaLoXN5mETHlhPjlWqoN8ZyrMj7/3cSEBjMFmobAfAIKOEkTNvaA9lnAxQFhGEV4Jeduleo6qu4hPAq7KxIa11srnub3QfmdaRUZnVOI4ovbZjGM87hB393CHpZhUzHUmvZDHSLMheO1jjLKPMjCklMBdOb5PvslBXQHMDX6e9CFO3wWEXFNy0OoAPAI54JTgJR4g9D2HA/OC8e5i/0NabrkPI1v1ofq033qPGOxOqjqx8UuSeFqiYLFzcwJnyX/0xBaE/lRHK9dZ9qQa3PbuYGtFkkHaqRWSKs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(38070700021)(6133799003)(10067099003)(56012099006)(4143699003)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bEZVcXhWYllhbUVyYXpqWjRlZTNzWHpSaWpTOUhvclV1Z3FkcG1Zc1J0VnZX?=
 =?utf-8?B?Vm5kdHBIODRGbzROZkV2SUJSTFVQQTRUV0NWTUZPWWZPMjRJeGE0RXpnZUJR?=
 =?utf-8?B?eTA5RzhQeTdOdHBRK0Rla3hvNExXTWE2ZHVIbVk2RUNXZWJXaDIzMDZOUXpY?=
 =?utf-8?B?aWYxdkxWNWhLcCtVdVpZNmNUTGt5QkhLM2VjcTJaY2NjK0lrVE53Ykc3SHhn?=
 =?utf-8?B?ZldSUG9UZWp4TUo1S0FaSHRHenl0eU1LbXZUOEtIUndvUnBWR3FSQmtSUCtk?=
 =?utf-8?B?cEhTV0Y5a21xNkFDYzR0VENYQ2ZjamdIK0NENHBSUHRlYkhVeVN1SDBIclVj?=
 =?utf-8?B?VjBDYWJJdkZGSDJsMnVOa3ZNb0Q0NDRDaHBoaHd2TktpRVI2SjZHbFZLKzhV?=
 =?utf-8?B?d2psUjc0OWU1V2Nnd3MxM0NzeCsxRGVHSXA0TU1ndld1VzdkWGMyeUdjd05s?=
 =?utf-8?B?VzN4V3o5KzR3aXNSVkpZNUo1RmEzcVp5bUxUTm1BRjFyaG5rQ0lQNHU5d1pz?=
 =?utf-8?B?OUVyeC9Oa1Fkd2hueTFwbEt4NlMrQ0xLSG5SNDdEQ2dlN1hnSWJZZjNtTm5X?=
 =?utf-8?B?d0c1L0c1ZUdIeTZzYlBETm9OcTdBZTNXZVhTWXRUdDlGdGFyZFF6YkFWWm14?=
 =?utf-8?B?L3UydGI2eGtva0dDMFBTejQ3SElIV3plZWo2dVIvVnpZelBhdmVkNE8zZmt0?=
 =?utf-8?B?ZFZzZ3lyQTdoeVBFbGV0ZUNOR2gvaGJhSzRBZzFMMFgwNER0YW5xc1pqYUpp?=
 =?utf-8?B?OTZsN29HdzVPckkzQWF2SUZCNG9ZemwrdVNza0hyYzRNUFYxQmgvcEI4L1JS?=
 =?utf-8?B?dlFsWFd1ZmJ0ZVdHM3ZlcUJWTjNIYnlQeDcwcG94SnNqWGhOUkRnQVNyS0tC?=
 =?utf-8?B?ODFXWEVuUWhzZi9JZ1lkZVBZYzZndWR3NS84NzFuNHpzWlZ3OGxPdE1tZERw?=
 =?utf-8?B?VzNyN1JhRHRrRGdqSitic1BFQ3ZwWkE0VmM4bDVwTzF5SHVpNUdNR0dGdS8w?=
 =?utf-8?B?bENCV1ZxQWRSY3ZXVk43UnhlbXUySTZBMU5ML1M3dHZQMGI1QTlsSm1LMjFM?=
 =?utf-8?B?SHVRekRqMnViMlRaTSsvWjc4ZXBvV3pTcGNFTUJzZ3VkRnpiM3YzR2gwQmIy?=
 =?utf-8?B?ZkUrVVNUL3U0aFRJWU1hZXlwT01CZmQyVjRiVVliZWtGeDdMbkJrUWdrTS9j?=
 =?utf-8?B?b2EweWtYMWkwY1hRRjJmWmU3eWtSL1dMVVFXcEhWcUd2MUp0NXdGL2plczFR?=
 =?utf-8?B?ZXB5dTVwTm1ZVnRHaldhQU5kZlBEd0s0c0I4b1NNQUhyejNLcGZRbG8rQm4z?=
 =?utf-8?B?NHFEeFpQQjRZZWtxakFTM3FuSUhuQmlKeFNrcC9BdHdUYzFhcUtHVmRsSTdF?=
 =?utf-8?B?M0p5dTM1ZmtuUHgxd09BMERvVVgrRzdxTkxyQ041SCtvajAwYmk1U1oyYlUr?=
 =?utf-8?B?aGdOVDU3Vnl4NnZPY0d1enFlaFJabnd4dG1NQmoyRlBlWWwvMXQzVmxRUmxQ?=
 =?utf-8?B?aXJZMEl6NWN3dGNPWnFhVU5ZRmxFV2RyWHhFSjFCd2h3cWRQajdDb3lIWEt3?=
 =?utf-8?B?cEdFaVZNd0xmdUM3OWZPaEgxQzVNZlRrTzIvU3F2b2t0bmYwUmN3ejNpN3Ry?=
 =?utf-8?B?eDJKQXM4TURsQlBFMnJFZWtPeTVuTzRyWTVLcEJsY1lSUEc2NzFCelY1NzUr?=
 =?utf-8?B?N05tZHFScXlJcjRzUWZ6aml0TnZ0emtDcHYrSWFldjlUdnRWNTh4MTFxaks3?=
 =?utf-8?B?WCsvelFWV2pxbGFQY2VlS0pOZ1M5Nm9yY0hjNHZVRm41NkNqNEQrcG1QenhM?=
 =?utf-8?B?OVloYjk2azlGeDNPMFVoK3JLUG5zbnl4REhpc2RJUExVU2NoeDhWUDhWMVBp?=
 =?utf-8?B?Y2dtcWdaNjR3WHNCL1hyQklnanFjbk40OVVQZllBMTI5Yisyc00wQS9DbjF6?=
 =?utf-8?B?VldWbnduclgxd0QxNTl4dGlsTElSWEpiVUxQOGJhTVN4Sm9wVDVpOVorYktJ?=
 =?utf-8?B?a3JiTDZ4ZlhkbU1CM1BwN2F6TURSR3hEb3lKUUlGWEYwQUhZNCtNczJ0YUNE?=
 =?utf-8?B?dVpKWVFYeDJLd08rTjM3ajJ4N1BHaUlRYVI2ZkY3R1Y5QjdFNTN3Yk8rZitW?=
 =?utf-8?B?QjJLdmlNY1c2NHZraFZpcTZtT2JYUkZpcVdiREV1TVJtdW80NG80cVd0c1p3?=
 =?utf-8?B?MWp3VnJhbVNQZmc2cS9qc2FrZWFEc0FobG5mZm11dDJZZ1M0bzFXeXhhemlN?=
 =?utf-8?B?ck5iTmxiQ2RaRHFYVUxzSWluODU3R2JqMXZpT2xROUQ4ODV6bk4wY0NiVnNB?=
 =?utf-8?B?SU40K3VPbnMyR0RvQkdDTGcrdnJ2Z3VlcFJURktzdzZCb3JGbjJFMEthOUJI?=
 =?utf-8?Q?h6bIVViJ9Kuil3T4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E4D87FFD03F9594A8E86C5016C6D8119@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 5LJl7jmKNKI1cYTCWgEOld/xh4OiG/uHHjXVThD48G8ebYc2+It6Gqybgv++gPNC/NulWPxTK6u5t8aUA9YZNYe0TnIEN5WH4sL2AR92fYpt51jvbhc7d6TaDeJAT0K5aIsrTqe0+4el/ur/OYHghiOg2jB3n53qCqLUarf58HWkCDdlDCal/3RT7V1Y9AG8c6Hi9s6sbfLFPKf/peJ8s80IgU7Qf2JvJjxgvsuSaCaByrNAU235GxSdp0Csx54pm8xyxWhRU1iFYlEq7SoOf4hYsbqmVANCMbGBrxJ5JEPaNJLg7pUsUHEJ+hkIu5XRY6Y2XuFG0/aeE/5zDTGzWQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b1b9013-0f44-484d-85a5-08df0f36a8de
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2026 12:25:54.5456 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qYIkUFIi9Z1+BUVa0HFxa+ko/U3QrFPoPgeUbxDCmKfmoL8CjvcUIMfNYUHx34X1aaxRhpomgoDmwny/Ykj0F0gNm8ifYOd1h1vUtS5EuvM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFA69606334
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

T24gV2VkLCAyMDI2LTA5LTA5IGF0IDE2OjMzICswNTMwLCBOZW1lc2EgR2FyZyB3cm90ZToNCj4g
U2VsZWN0aXZlIGZldGNoIGlzIGRyb3BwZWQgd2hpbGUgcGlwZSBDUkMgaXMgYWN0aXZlLCBhbmQg
dGhlIHBsYW5lcw0KPiBrZWVwDQo+IHRoZWlyIFNFTF9GRVRDSF9QTEFORV9DVEwgLyBTRUxfRkVU
Q0hfQ1VSX0NUTCBlbmFibGUgYml0IHNldCBpbg0KPiBoYXJkd2FyZQ0KPiBvdmVyIHRoYXQuIEEg
cGxhbmUgZGlzYWJsZWQgd2hpbGUgc2VsZWN0aXZlIGZldGNoIGlzIG9mZiBuZXZlciBnZXRzDQo+
IHRoZQ0KPiBiaXQgY2xlYXJlZCwgYXMgdGhlIGRpc2FibGUgcGF0aCBpcyBndWFyZGVkIGJ5IGVu
YWJsZV9wc3IyX3NlbF9mZXRjaC4NCj4gT25jZSBzZWxlY3RpdmUgZmV0Y2ggY29tZXMgYmFjayB0
aGUgaGFyZHdhcmUgcmVzdW1lcyBmZXRjaGluZyBmb3IgYQ0KPiBwbGFuZSB0aGF0IGlzIG5vIGxv
bmdlciBlbmFibGVkIGFuZCBrZWVwcyBpdHMgRERCIHJhbmdlIHJlc2VydmVkLg0KPiANCj4gQ2xl
YXIgdGhlIGJpdHMgYXMgc2VsZWN0aXZlIGZldGNoIGlzIHR1cm5lZCBvZmYgaW5zdGVhZC4gQXRv
bWljIGNoZWNrDQo+IGhhcyBib3RoIHRoZSBvbGQgYW5kIHRoZSBuZXcgY3J0YyBzdGF0ZSwgc28g
cmVjb3JkIHRoZSB0cmFuc2l0aW9uDQo+IHRoZXJlDQo+IGFuZCBsZXQgdGhlIHBsYW5lIGFuZCBj
dXJzb3IgYXJtIHBhdGhzIHdyaXRlIHRoZSByZWdpc3RlcnMgdG8gMCBmb3INCj4gdGhhdA0KPiBj
b21taXQuDQo+IA0KPiB2MjogRHJvcCB0aGUgb2xkX2NydGNfc3RhdGUtPmh3LmFjdGl2ZSBjaGVj
ay4gW0pvdW5pXQ0KDQpSZXZpZXdlZC1ieTogSm91bmkgSMO2Z2FuZGVyIDxqb3VuaS5ob2dhbmRl
ckBpbnRlbC5jb20+DQo+IA0KPiBGaXhlczogYjFmNTI3OWI1OTgxICgiZHJtL2k5MTUvcHNyOiBN
b3ZlIHBsYW5lIHNlbCBmZXRjaA0KPiBjb25maWd1cmF0aW9uIGludG8gcGxhbmUgc291cmNlIGZp
bGVzIikNCj4gQ2xvc2VzOg0KPiBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZHJtL3hl
L2tlcm5lbC8tL3dvcmtfaXRlbXMvODczOQ0KPiBBc3Npc3RlZC1ieTogQ29waWxvdDpDbGF1ZGUt
T3B1cy01DQo+IFNpZ25lZC1vZmYtYnk6IE5lbWVzYSBHYXJnIDxuZW1lc2EuZ2FyZ0BpbnRlbC5j
b20+DQo+IC0tLQ0KPiDCoGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfY3Vyc29y
LmPCoMKgwqDCoMKgwqAgfMKgIDcgKysrKystLQ0KPiDCoC4uLi9ncHUvZHJtL2k5MTUvZGlzcGxh
eS9pbnRlbF9kaXNwbGF5X3R5cGVzLmjCoMKgwqAgfMKgIDIgKysNCj4gwqBkcml2ZXJzL2dwdS9k
cm0vaTkxNS9kaXNwbGF5L2ludGVsX3Bzci5jwqDCoMKgwqDCoMKgwqDCoMKgIHwgMTUNCj4gKysr
KysrKysrKysrKysrDQo+IMKgLi4uL2dwdS9kcm0vaTkxNS9kaXNwbGF5L3NrbF91bml2ZXJzYWxf
cGxhbmUuY8KgwqDCoCB8wqAgOSArKysrLS0tLS0NCj4gwqA0IGZpbGVzIGNoYW5nZWQsIDI2IGlu
c2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9jdXJzb3IuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS9p
OTE1L2Rpc3BsYXkvaW50ZWxfY3Vyc29yLmMNCj4gaW5kZXggOTAxNzMwNDBkODI1Li40YWZkMjc1
ZGU4NmUgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxf
Y3Vyc29yLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9jdXJz
b3IuYw0KPiBAQCAtNTM3LDcgKzUzNyw4IEBAIHN0YXRpYyB2b2lkDQo+IGk5eHhfY3Vyc29yX2Rp
c2FibGVfc2VsX2ZldGNoX2FybShzdHJ1Y3QgaW50ZWxfZHNiICpkc2IsDQo+IMKgCXN0cnVjdCBp
bnRlbF9kaXNwbGF5ICpkaXNwbGF5ID0gdG9faW50ZWxfZGlzcGxheShwbGFuZSk7DQo+IMKgCWVu
dW0gcGlwZSBwaXBlID0gcGxhbmUtPnBpcGU7DQo+IMKgDQo+IC0JaWYgKCFjcnRjX3N0YXRlLT5l
bmFibGVfcHNyMl9zZWxfZmV0Y2gpDQo+ICsJaWYgKCFjcnRjX3N0YXRlLT5lbmFibGVfcHNyMl9z
ZWxfZmV0Y2ggJiYNCj4gKwnCoMKgwqAgIWNydGNfc3RhdGUtPmNsZWFyX3BzcjJfc2VsX2ZldGNo
KQ0KPiDCoAkJcmV0dXJuOw0KPiDCoA0KPiDCoAlpbnRlbF9kZV93cml0ZV9kc2IoZGlzcGxheSwg
ZHNiLCBTRUxfRkVUQ0hfQ1VSX0NUTChwaXBlKSwNCj4gMCk7DQo+IEBAIC01NzAsOCArNTcxLDEw
IEBAIHN0YXRpYyB2b2lkDQo+IGk5eHhfY3Vyc29yX3VwZGF0ZV9zZWxfZmV0Y2hfYXJtKHN0cnVj
dCBpbnRlbF9kc2IgKmRzYiwNCj4gwqAJc3RydWN0IGludGVsX2Rpc3BsYXkgKmRpc3BsYXkgPSB0
b19pbnRlbF9kaXNwbGF5KHBsYW5lKTsNCj4gwqAJZW51bSBwaXBlIHBpcGUgPSBwbGFuZS0+cGlw
ZTsNCj4gwqANCj4gLQlpZiAoIWNydGNfc3RhdGUtPmVuYWJsZV9wc3IyX3NlbF9mZXRjaCkNCj4g
KwlpZiAoIWNydGNfc3RhdGUtPmVuYWJsZV9wc3IyX3NlbF9mZXRjaCkgew0KPiArCQlpOXh4X2N1
cnNvcl9kaXNhYmxlX3NlbF9mZXRjaF9hcm0oZHNiLCBwbGFuZSwNCj4gY3J0Y19zdGF0ZSk7DQo+
IMKgCQlyZXR1cm47DQo+ICsJfQ0KPiDCoA0KPiDCoAlpZiAoZHJtX3JlY3RfaGVpZ2h0KCZwbGFu
ZV9zdGF0ZS0+cHNyMl9zZWxfZmV0Y2hfYXJlYSkgPiAwKQ0KPiB7DQo+IMKgCQlpZiAoY3J0Y19z
dGF0ZS0+ZW5hYmxlX3BzcjJfc3VfcmVnaW9uX2V0KSB7DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXlfdHlwZXMuaA0KPiBiL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheV90eXBlcy5oDQo+IGluZGV4IDkwMTZi
ZTUyYzdlYS4uZWM5OWZmMTAzOTFjIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9kaXNwbGF5L2ludGVsX2Rpc3BsYXlfdHlwZXMuaA0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXlfdHlwZXMuaA0KPiBAQCAtMTE5MCw2ICsxMTkwLDgg
QEAgc3RydWN0IGludGVsX2NydGNfc3RhdGUgew0KPiDCoAlib29sIGhhc19zZWxfdXBkYXRlOw0K
PiDCoAlib29sIGVuYWJsZV9wc3IyX3NlbF9mZXRjaDsNCj4gwqAJYm9vbCBlbmFibGVfcHNyMl9z
dV9yZWdpb25fZXQ7DQo+ICsJLyogRHJvcCB0aGUgc3RhbGUgc2VsZWN0aXZlIGZldGNoIGVuYWJs
ZSBiaXRzIGFzIHNlbGVjdGl2ZQ0KPiBmZXRjaCBpcyB0dXJuZWQgb2ZmICovDQo+ICsJYm9vbCBj
bGVhcl9wc3IyX3NlbF9mZXRjaDsNCj4gwqAJYm9vbCByZXFfcHNyMl9zZHBfcHJpb3Jfc2Nhbmxp
bmU7DQo+IMKgCWJvb2wgaGFzX3BhbmVsX3JlcGxheTsNCj4gwqAJYm9vbCBsaW5rX29mZl9hZnRl
cl9hc19zZHBfd2hlbl9wcl9hY3RpdmU7DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9kaXNwbGF5L2ludGVsX3Bzci5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxh
eS9pbnRlbF9wc3IuYw0KPiBpbmRleCBmNDkwYmViNjY2MjkuLjg3MmUyNTNkYjE3OCAxMDA2NDQN
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9wc3IuYw0KPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3Bzci5jDQo+IEBAIC0yODg5LDYg
KzI4ODksOCBAQCBpbnQgaW50ZWxfcHNyMl9zZWxfZmV0Y2hfdXBkYXRlKHN0cnVjdA0KPiBpbnRl
bF9hdG9taWNfc3RhdGUgKnN0YXRlLA0KPiDCoAkJCQlzdHJ1Y3QgaW50ZWxfY3J0YyAqY3J0YykN
Cj4gwqB7DQo+IMKgCXN0cnVjdCBpbnRlbF9kaXNwbGF5ICpkaXNwbGF5ID0gdG9faW50ZWxfZGlz
cGxheShzdGF0ZSk7DQo+ICsJY29uc3Qgc3RydWN0IGludGVsX2NydGNfc3RhdGUgKm9sZF9jcnRj
X3N0YXRlID0NCj4gKwkJaW50ZWxfYXRvbWljX2dldF9vbGRfY3J0Y19zdGF0ZShzdGF0ZSwgY3J0
Yyk7DQo+IMKgCXN0cnVjdCBpbnRlbF9jcnRjX3N0YXRlICpjcnRjX3N0YXRlID0NCj4gaW50ZWxf
YXRvbWljX2dldF9uZXdfY3J0Y19zdGF0ZShzdGF0ZSwgY3J0Yyk7DQo+IMKgCXN0cnVjdCBpbnRl
bF9wbGFuZV9zdGF0ZSAqbmV3X3BsYW5lX3N0YXRlLCAqb2xkX3BsYW5lX3N0YXRlOw0KPiDCoAlz
dHJ1Y3QgaW50ZWxfcGxhbmUgKnBsYW5lOw0KPiBAQCAtMjkwMSw2ICsyOTAzLDE5IEBAIGludCBp
bnRlbF9wc3IyX3NlbF9mZXRjaF91cGRhdGUoc3RydWN0DQo+IGludGVsX2F0b21pY19zdGF0ZSAq
c3RhdGUsDQo+IMKgCWJvb2wgZnVsbF91cGRhdGUgPSBmYWxzZSwgc3VfYXJlYV9jaGFuZ2VkOw0K
PiDCoAlpbnQgaSwgcmV0Ow0KPiDCoA0KPiArCS8qDQo+ICsJICogU2VsZWN0aXZlIGZldGNoIGlz
IG5vdCBhbHdheXMgdXNhYmxlLCBmb3IgaW5zdGFuY2UgaXQgaXMNCj4gZHJvcHBlZA0KPiArCSAq
IHdoaWxlIHBpcGUgQ1JDIGlzIGFjdGl2ZS4gVGhlIHBsYW5lcyBrZWVwIHRoZWlyIHNlbGVjdGl2
ZQ0KPiBmZXRjaA0KPiArCSAqIGVuYWJsZSBiaXQgc2V0IGluIGhhcmR3YXJlIG92ZXIgdGhhdCwg
YW5kIGEgcGxhbmUNCj4gZGlzYWJsZWQgd2hpbGUNCj4gKwkgKiBzZWxlY3RpdmUgZmV0Y2ggaXMg
b2ZmIG5ldmVyIGdldHMgdGhlIGJpdCBjbGVhcmVkLiBPbmNlDQo+IHNlbGVjdGl2ZQ0KPiArCSAq
IGZldGNoIGNvbWVzIGJhY2sgdGhlIGhhcmR3YXJlIHdvdWxkIHJlc3VtZSBmZXRjaGluZyBmb3Ig
YQ0KPiBwbGFuZSB0aGF0DQo+ICsJICogaXMgbm8gbG9uZ2VyIGVuYWJsZWQgYW5kIGtlZXAgaXRz
IEREQiByYW5nZSByZXNlcnZlZCwgc28NCj4gaGF2ZSB0aGUNCj4gKwkgKiBwbGFuZSB1cGRhdGUg
ZHJvcCB0aGUgYml0IGZvciBldmVyeSBwbGFuZSBvZiB0aGUgcGlwZSBhcw0KPiBzZWxlY3RpdmUN
Cj4gKwkgKiBmZXRjaCBpcyB0dXJuZWQgb2ZmLg0KPiArCSAqLw0KPiArCWNydGNfc3RhdGUtPmNs
ZWFyX3BzcjJfc2VsX2ZldGNoID0gb2xkX2NydGNfc3RhdGUtDQo+ID5lbmFibGVfcHNyMl9zZWxf
ZmV0Y2ggJiYNCj4gKwkJIWNydGNfc3RhdGUtPmVuYWJsZV9wc3IyX3NlbF9mZXRjaDsNCj4gKw0K
PiDCoAlpZiAoIWNydGNfc3RhdGUtPmVuYWJsZV9wc3IyX3NlbF9mZXRjaCkNCj4gwqAJCXJldHVy
biAwOw0KPiDCoA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9z
a2xfdW5pdmVyc2FsX3BsYW5lLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L3Nr
bF91bml2ZXJzYWxfcGxhbmUuYw0KPiBpbmRleCAwN2E2ODMyOTMzNTIuLmViNWVkOTgxYjQwZiAx
MDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9za2xfdW5pdmVyc2Fs
X3BsYW5lLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9za2xfdW5pdmVy
c2FsX3BsYW5lLmMNCj4gQEAgLTg4NSw3ICs4ODUsOCBAQCBzdGF0aWMgdm9pZA0KPiBpY2xfcGxh
bmVfZGlzYWJsZV9zZWxfZmV0Y2hfYXJtKHN0cnVjdCBpbnRlbF9kc2IgKmRzYiwNCj4gwqAJc3Ry
dWN0IGludGVsX2Rpc3BsYXkgKmRpc3BsYXkgPSB0b19pbnRlbF9kaXNwbGF5KHBsYW5lKTsNCj4g
wqAJZW51bSBwaXBlIHBpcGUgPSBwbGFuZS0+cGlwZTsNCj4gwqANCj4gLQlpZiAoIWNydGNfc3Rh
dGUtPmVuYWJsZV9wc3IyX3NlbF9mZXRjaCkNCj4gKwlpZiAoIWNydGNfc3RhdGUtPmVuYWJsZV9w
c3IyX3NlbF9mZXRjaCAmJg0KPiArCcKgwqDCoCAhY3J0Y19zdGF0ZS0+Y2xlYXJfcHNyMl9zZWxf
ZmV0Y2gpDQo+IMKgCQlyZXR1cm47DQo+IMKgDQo+IMKgCWludGVsX2RlX3dyaXRlX2RzYihkaXNw
bGF5LCBkc2IsIFNFTF9GRVRDSF9QTEFORV9DVEwocGlwZSwNCj4gcGxhbmUtPmlkKSwgMCk7DQo+
IEBAIC0xNjM0LDEwICsxNjM1LDggQEAgc3RhdGljIHZvaWQNCj4gaWNsX3BsYW5lX3VwZGF0ZV9z
ZWxfZmV0Y2hfYXJtKHN0cnVjdCBpbnRlbF9kc2IgKmRzYiwNCj4gwqAJc3RydWN0IGludGVsX2Rp
c3BsYXkgKmRpc3BsYXkgPSB0b19pbnRlbF9kaXNwbGF5KHBsYW5lKTsNCj4gwqAJZW51bSBwaXBl
IHBpcGUgPSBwbGFuZS0+cGlwZTsNCj4gwqANCj4gLQlpZiAoIWNydGNfc3RhdGUtPmVuYWJsZV9w
c3IyX3NlbF9mZXRjaCkNCj4gLQkJcmV0dXJuOw0KPiAtDQo+IC0JaWYgKGRybV9yZWN0X2hlaWdo
dCgmcGxhbmVfc3RhdGUtPnBzcjJfc2VsX2ZldGNoX2FyZWEpID4gMCkNCj4gKwlpZiAoY3J0Y19z
dGF0ZS0+ZW5hYmxlX3BzcjJfc2VsX2ZldGNoICYmDQo+ICsJwqDCoMKgIGRybV9yZWN0X2hlaWdo
dCgmcGxhbmVfc3RhdGUtPnBzcjJfc2VsX2ZldGNoX2FyZWEpID4gMCkNCj4gwqAJCWludGVsX2Rl
X3dyaXRlX2RzYihkaXNwbGF5LCBkc2IsDQo+IFNFTF9GRVRDSF9QTEFORV9DVEwocGlwZSwgcGxh
bmUtPmlkKSwNCj4gwqAJCQkJwqDCoCBTRUxfRkVUQ0hfUExBTkVfQ1RMX0VOQUJMRSk7DQo+IMKg
CWVsc2UNCg0K
