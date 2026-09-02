Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05C68C61DFD
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 05:30:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB55A10EB36;
	Wed,  2 Sep 2026 05:30:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EI35Foxa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 599DA10EB36;
 Wed,  2 Sep 2026 05:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788327039; x=1819863039;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=P2jbLm3tDabJnwUzTDclEq/q390tXtpMLhGJEjtt4rU=;
 b=EI35FoxatAACSe3rQfXr64mTetz3SL6gV0k2SCkwzIfm1n5abFlVBBDM
 w+i1ryElvvnNFx0ZLcK0qX6arLNqKVYrCy3X5LqReSnR6E69EGxbFzWIy
 QnFF1C5yWicpv+MmgPqBgzeb5Xrfrw+UxdNAqIGyHbSspAy/9myPrQK8c
 DoFG39X8HLVRzxNgPAi6FIoE4k2Y9AKMFmtLvosFVs6Irmvgvv/Fan9ga
 aF+ct1rdR/8F4iHyOAglHWD1GfrSGmBcXJX0y+oblk8AsMLKq+g0IZB/4
 vSFr2OBSbCqz+xy8MprHHNO0OarHu7aYF3FCQnOempgxa0E6F+2/nH6v8 A==;
X-CSE-ConnectionGUID: gV2y8EGlRROXhILUzS9SQQ==
X-CSE-MsgGUID: 40G36S3iRwqnt8puisqAEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="88976972"
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208";a="88976972"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2026 22:30:39 -0700
X-CSE-ConnectionGUID: dtYc5ILeTRe63iv0TjR/Uw==
X-CSE-MsgGUID: RM2WI7qyT1uvlYSsQbDg3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208";a="274570234"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2026 22:30:38 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 1 Sep 2026 22:30:38 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 1 Sep 2026 22:30:38 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.7) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 1 Sep 2026 22:30:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WLapsWg/ZTdv34r+ZG7r26qLagxqTyKhzcgD7Q1uxLY5ZNv/ZnYFKxq/XFqW53y+krMxofQ4AfIxlJhLe6eqO7qFJZT1/PQLsE3socbrhI5eQCLl048SaUG4Co/jMJD0MfQgY5L0cKpFxnLNJKcyBPR+YfsEWIP38mnaD81iF6mT214yLNr6o1US+52Sm6gz3PvYvswP2ta3SAAKcQZp+zb59OfdgQvx+lv2z4jqXvSl35+fe8ApB0qwsyhR8QZd6Ja3tIDxE7+pplitilc9kjEcwuxcMt+vTSTgXRi6P5h7+pfHNSZWFlSy68Ok86JOMzhmR0PuSAWUZDDLRI6aZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P2jbLm3tDabJnwUzTDclEq/q390tXtpMLhGJEjtt4rU=;
 b=Raz4vltE/UhpXH3Ij0HWny+N9QE28bM1FJdW0Y65WqsUiR+CsOvDwhAXeiiqn+6/l98Inx0x83IeAFIHAxpmzQknZMNL3TZrERWEKBhrIKksvOpQB9lLnZ+/Z7Ym9WwcFU6JUh+JrI1ea2P2LOunu02HJowQgnCSoP57tLHeLJua1E1taSpb8TC8Ox8kaEN+tM0AwD/VCYSXjrPh90nTp4abIW7Rk0C2Nc7Z0iMrnxwlIr71ZEaSD1fOZfZ816P7pzvK0HpGNQsOfHNebBx8gK6G5eWSCodeEwplbjnL43uUrsbyZHhD2WlqLR624gTWBs0Ue0212fh2pZnXy4FMPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 MN0PR11MB6182.namprd11.prod.outlook.com (2603:10b6:208:3c6::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 05:30:30 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762%6]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 05:30:30 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Manna,
 Animesh" <animesh.manna@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
CC: "Nikula, Jani" <jani.nikula@intel.com>
Subject: Re: [PATCH v5 02/15] drm/i915/alpm: Move alpm sink capabality readout
 in separate function
Thread-Topic: [PATCH v5 02/15] drm/i915/alpm: Move alpm sink capabality
 readout in separate function
Thread-Index: AQHdNFmtMaNIWz24eUmhvyQk92IHWLauZfEAgAxpsIA=
Date: Wed, 2 Sep 2026 05:30:30 +0000
Message-ID: <9cff98891161b2849a7f92aaca8322bf09fdf8ff.camel@intel.com>
References: <20260825054536.3455704-1-animesh.manna@intel.com>
 <20260825054536.3455704-3-animesh.manna@intel.com>
 <DS4PPFE901A304FCAFBDB20533981EAC946E3AF2@DS4PPFE901A304F.namprd11.prod.outlook.com>
In-Reply-To: <DS4PPFE901A304FCAFBDB20533981EAC946E3AF2@DS4PPFE901A304F.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|MN0PR11MB6182:EE_
x-ms-office365-filtering-correlation-id: 0f8e578b-022b-4ee4-0e1b-08df08b34db3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|366016|376014|10067099003|6133799003|18002099003|22082099003|56012099006|4143699003|11063799006|38070700021;
x-microsoft-antispam-message-info: a+YBgg0ybmoX3IBAB11EMp3/RvY1E4OvPfpI0kqzdSMyTinoN1/mHwaRC9bUnhfA4Jaq00m8yrSUGSXwVGtiH6MMSdPy/8oMowMMPmHFVxG7uQL/2ElmKCCsFVccn6+QS0o/eynxb4zMUr8r+vfDJJKvVcDLnxnRE4VAXembReebBYTQy/quJUDXpCbz67ACQTqt0sYTlc9vQ1MSeJiknqi71aIbTiS5nZlTcPpB74LEWtbOJ0DvkBMG38Q4cqyCf5uMNudtScomV75PMBy3FQsFbk0flB0GdONABhOkzSsz4ZVkhogLXSTjn7b5axEz1R91kjsZqA0lVrb/2TWbGmAK95iUyqeoaG3jqVKDa+rW6lEdedmRZvdpKKY3+ghBUKdmmADJuKzjORa1g0D6iaI4+2EIq2Q7LKA9ztANq3weXVoBeJrLJR1vb3osOLX6SWQb6v627AsH9qhUf1WPZbEv/DeNwbd08cCTuD61fEpNFqWq3Pj4QL12S5E5F21JeWrTZTBylDYB2/JN+5Q6ug1bae7GhPE9ne0otpkMURfsW6OFJq4HJWN1C/Z6c6IKoeHJDuhJ5Y3SpXYG19i3qdSbgScK+vLL82vW7F961Q1w550A3I1ugWYzrl3CxB5aMjTqQIDijApw6nlM8Io1E4TnUm2jvL1wn1daenpYIRYo2NUdIWxf6GfUM6PKtGaBeFJ+IiqWtm2Yml0vTfosTA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(10067099003)(6133799003)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d1RCbm5ydWhmWkF1RERpeW1md2VtU0YzeCt6Z2N6WldUVnBZK2g0RWZWNVNt?=
 =?utf-8?B?VFk3SVVXYnJ6VGh2SWVZdjZvVmdzd2pHcmt2OFBOdjBoZGs0RkFWVm5BWkNV?=
 =?utf-8?B?Z3VaS3RQMzd2WmwvMnFvUndEYURYc0Z5OU9RUHl6RmN5YU9Ma2xkYmowdmRp?=
 =?utf-8?B?Ry8zWnA5ZWZYdTVqYktYaWRzZXl5SkMvNDRXT1hqUHk2NHE2UG13OGxaMUFq?=
 =?utf-8?B?ZG9uMkVYTFlPQjJpV2ZqQkhjT1ZFbko2WlRxMFpmOVA1b3JnR1FvV0ZuWHJt?=
 =?utf-8?B?ZEpOM3h2ZjgyZjZld1lSbmJaWklIeGIrZ21scmRvV2orazc1aDFXcSsxVmJj?=
 =?utf-8?B?dExhTVhPblNabkZGRXAzNkwrekJBclk0TTdoN09pNEJ6bUtxMzdJOFpHMndw?=
 =?utf-8?B?RFBSTGsvdFBQNzVxZ2YrYkg2TVdKZGszSml1eWFWTmNJQ25KNVVLbnhpVEho?=
 =?utf-8?B?TEhidDY0ckdvRXVvL3pqQWhtUEdHQjlwVlllZVAzM3E0QzlZQThKVGdCWkVQ?=
 =?utf-8?B?Y0s3WWVFek9FOGVDeWZXZDdtQjF3NlRxL0t1NnNkSDBaQUZQSW83VXhEdi9D?=
 =?utf-8?B?RkpvYXNSUS9UeTlXM3Y4WmRRNFBDZGl5UEYxdmhNR2s2cTVFd1FzOUNQbUkx?=
 =?utf-8?B?bzVUUXhUVzVFbTJNL2dXQkxQZEdhTFpNYWxYcUNZeE9XMUc0ckhjN3ZnTGtX?=
 =?utf-8?B?OHRuVnBoN0t5MHp4M29vUU1TVURyY29NQUZYZ1hBeURqZEc0QXJDblBBanRq?=
 =?utf-8?B?emNnY3hUcjhjUC9DaUJlU1Rqb3ZIdHJ1RGdYaGFielRaVGJPSkNYcnEwWm5l?=
 =?utf-8?B?M2ZqcGxzd2t5M3NGWEFtblNaMUhtSEZ3aTl4eVJWS1prdEphMUVMSDBGRndq?=
 =?utf-8?B?UWlRSzR4Y1ZoM29HM2VWUnZlTHBhTU96TC9jZ0pCY1ZVWW4yT3FJQk5Pb3ZC?=
 =?utf-8?B?ZEtLN2srZHBuMU5URnBtUjhpU2kwemRIVXo2eFlVbUJGdnpyd1U0NXkyZGFY?=
 =?utf-8?B?NEFBMWVTN0d0VldRUVlnbkRoanIxQk83cmVPTWlXZ1JTYlBiRHJad1NKS0Ni?=
 =?utf-8?B?Q1hJLzA5TW1IcHcvejdSc21IZTdPTG9pQnp4ZFhkUkZNSDlJSmJ5QlRTVncv?=
 =?utf-8?B?cnBTRDErZG5vQ1lzaUpsZHk3VHNmZ1RBWTJsbDF3cjJiWVZmQTBnUkVqcGQx?=
 =?utf-8?B?elNNSmVCQ1Uvc1RoOFY2WlhEQ0FhRnpIZGV0SVRqb1JsZDVwNzZFS0pPRVpE?=
 =?utf-8?B?TXkySFprM2xjdWtmYjZYbDV3OUNoSzNrNUVpREVqNXZvZkFnMGRjYnlmcGNq?=
 =?utf-8?B?S1puS0dEOTZnQktCOWJpcDNLbCtnOUhtOWNNWExLOVNWOTRERlhNc2hoenZt?=
 =?utf-8?B?TlFPb1RYbG00TjF4ZkxmVGdVWkdGeWF5VWFWWlQ3ZDNJanFIS1BMb3VBdGJm?=
 =?utf-8?B?Y2pRYVgxZjJlenF5WHYzaHhoYUpjQm0wcmtUdUVhMkVoVzBwTE9nNGxTWUcz?=
 =?utf-8?B?a2RUMytoS2YrNW5HQlVKSjNBMG9uVHpVYUdwbU1VVHBpV0VYK3JrU1RrVUMz?=
 =?utf-8?B?UWJCS0NsM3hQbzExY3U3NVBDQVhIQUdzdmJ6YmJQc0dmRFo5MHUyT0ZaZVIv?=
 =?utf-8?B?S2F1d3NxTlBTUzQxcHAyeGdkdWlvTnB0WHlMZkVKQ3dXbi9QSzlSaStKTU1X?=
 =?utf-8?B?N01WdDNrVVJocUlPdWZBMEVmZ1VDS2JCMnluTmxpekRPK3A4TDF5WnlGdlhK?=
 =?utf-8?B?TC9HOE10ZzRMcTJtRTBxWEMzMHFhY2gzWTdEdVgyaUhWUVMxVVllSjg2S2lW?=
 =?utf-8?B?Y21uZTd2djR1SDZ4cnMzVzNnVE85VnR4WDBxbUJCQldVN1ZRelJuT1N3U0xZ?=
 =?utf-8?B?OXdBbmh2Q0tveEtSdnBaanhJVi9MeUVRVnhtNm4rR0Z6UjBjRndqQ3BQNXlq?=
 =?utf-8?B?NHNrdW9kNVlRVnQ0K242ZTl3ZEJUU3EwOEZLVXpqT0dVaDE1azZBZGxzT2I3?=
 =?utf-8?B?Qm5wY1dtYUJ4cnZpdWMxSnYyMW5vd25wWjVUQ0NOY3pzVGk4bElVVU4za1B3?=
 =?utf-8?B?K3VteGtsb0FRRGpKelZGM0FDSlZyYVFPdVFKblZIQUhmL0lrR0w3ZXZtQ01C?=
 =?utf-8?B?bEY4MVpxSW5hb3RaMXpmUW1SWXZtTklUZ0VYcFRYeEFUUjk5T1lUbEY1dnly?=
 =?utf-8?B?dlJqUUI1UFZBR2JiZjc5ZThyOHQySEFOb2VSZFFJYzNTTExldUdMcGdsdU4v?=
 =?utf-8?B?S2RrZlZWTk5TelcwbmZUQTcyVW9kam8xRmpxS0RDeldOUWFMbkdsOXJuRDAr?=
 =?utf-8?B?Q2hJbEljWmZESUlycEtoYnBzbUNEbmxUanRvbytvMUxLblFiL2RoN01tTFIv?=
 =?utf-8?Q?a4/H2P64x0HVRys4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7BD21DEA7F5AAC4294849EF350F4D40C@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: rBb5RmqW2vzQ9+sy0SpFU6agUI5A2s51nGnzuYCiYA9O/5M71+gMTXtkT5kHlE54cHWClVnTghjIZAuxjuU5A2x5gV4u7z9fPr1Ck/OwI/J9z9XkhMOwPtxAyivq0H3o20A4EiU43FBe6Hhax9qWym5rd++FScEIgoYokTp4Y97xZUQ038iOIByf0yA31pIQlSTANMrCmLrTRG5ythGlMruCxmh7aqLdZmXpF7WEEWE0b0kYH0Ugh7WrC/ksTFQAoD3abnpWI+3GHzGLGkd0D7Puth0O5JlNNLSxMYBSffcfXHV0RC/FZ6sslaBtfTO3o/Z/WsnMXL9A5LBEbWsEqw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f8e578b-022b-4ee4-0e1b-08df08b34db3
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2026 05:30:30.5159 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W2ihtlAZXuJUAxeABjphp78TgP3+l4NUhJRE+VemILQkTNBbdrIGfCSinVmnAthAYadevhlbnFY8Z0KXoY2K24QG8sKSB6zY/zzsRlqw9hA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6182
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

T24gVHVlLCAyMDI2LTA4LTI1IGF0IDA3OjU3ICswMDAwLCBLYW5kcGFsLCBTdXJhaiB3cm90ZToN
Cj4gPiBTdWJqZWN0OiBbUEFUQ0ggdjUgMDIvMTVdIGRybS9pOTE1L2FscG06IE1vdmUgYWxwbSBz
aW5rIGNhcGFiYWxpdHkNCj4gPiByZWFkb3V0DQo+ID4gaW4gc2VwYXJhdGUgZnVuY3Rpb24NCj4g
PiANCj4gPiBOb24gZnVuY3Rpb25hbCBjaGFuZ2UuDQo+IA0KPiBQbGVhc2UgYWRkIGEgZGVmaW5p
dGlvbiBhcyB0byB3aGF0IHRoZSBwYXRjaCBpcyBkb2luZyBzb21ldGhpbmcgbGlrZQ0KPiAiQWJz
dHJhY3QgQUxQTSBEUENEIGluaXRpYWlsaXphdGlvbiBpbnRvIGl0cyBvd24gZnVuY3Rpb24iDQoN
CkFkZGl0aW9uIHRvIGNvbW1lbnQgZnJvbSBTdXJhajogUGxlYXNlIGRyb3AgIk5vbiBmdW5jdGlv
bmFsIGNoYW5nZSINCmNvbXBsZXRlbHkgYXMgaXQgaXMgbm90IHRydWUuIEN1cnJlbnRseSBmYWls
dXJlIGluIGRybV9kcF9kcGNkX3JlYWRiIGlzDQp0cmlnZ2VyaW5nIGVhcmx5IGV4aXQuIEFmdGVy
IHlvdSBjb21taXQgaXQgaXMgbm90Lg0KDQpCUiwNCkpvdW5pIEjDtmdhbmRlcg0KDQo+IA0KPiBS
ZWdhcmRzLA0KPiBTdXJhaiBLYW5kcGFsDQo+IA0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IEFu
aW1lc2ggTWFubmEgPGFuaW1lc2gubWFubmFAaW50ZWwuY29tPg0KPiA+IC0tLQ0KPiA+IMKgZHJp
dmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9hbHBtLmMgfCAxMCArKysrKysrKysrDQo+
ID4gZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9hbHBtLmggfMKgIDEgKw0KPiA+
IMKgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcC5jwqDCoCB8wqAgNyArLS0t
LS0tDQo+ID4gwqAzIGZpbGVzIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25z
KC0pDQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkv
aW50ZWxfYWxwbS5jDQo+ID4gYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Fs
cG0uYw0KPiA+IGluZGV4IGYxMzgzNzY0YjcwMi4uNTQyOTAwZTI5YTAxIDEwMDY0NA0KPiA+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfYWxwbS5jDQo+ID4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9hbHBtLmMNCj4gPiBAQCAtNDMsNiAr
NDMsMTYgQEAgYm9vbCBpbnRlbF9hbHBtX2lzX2FscG1fYXV4X2xlc3Moc3RydWN0IGludGVsX2Rw
DQo+ID4gKmludGVsX2RwLA0KPiA+IMKgCQkoY3J0Y19zdGF0ZS0+aGFzX2xvYmYgJiYNCj4gPiBp
bnRlbF9hbHBtX2F1eF9sZXNzX3dha2Vfc3VwcG9ydGVkKGludGVsX2RwKSk7DQo+ID4gwqB9DQo+
ID4gDQo+ID4gK3ZvaWQgaW50ZWxfYWxwbV9pbml0X2RwY2Qoc3RydWN0IGludGVsX2RwICppbnRl
bF9kcCkgew0KPiA+ICsJdTggZHBjZDsNCj4gPiArDQo+ID4gKwlpZiAoZHJtX2RwX2RwY2RfcmVh
ZGIoJmludGVsX2RwLT5hdXgsDQo+ID4gRFBfUkVDRUlWRVJfQUxQTV9DQVAsDQo+ID4gJmRwY2Qp
IDwgMCkNCj4gPiArCQlyZXR1cm47DQo+ID4gKw0KPiA+ICsJaW50ZWxfZHAtPmFscG1fZHBjZCA9
IGRwY2Q7DQo+ID4gK30NCj4gPiArDQo+ID4gwqB2b2lkIGludGVsX2FscG1faW5pdChzdHJ1Y3Qg
aW50ZWxfZHAgKmludGVsX2RwKcKgIHsNCj4gPiDCoAltdXRleF9pbml0KCZpbnRlbF9kcC0+YWxw
bS5sb2NrKTsNCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9p
bnRlbF9hbHBtLmgNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfYWxw
bS5oDQo+ID4gaW5kZXggMWNmNzA2NjhhYjFiLi5mYWU2OGQ1NTc5NjAgMTAwNjQ0DQo+ID4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9hbHBtLmgNCj4gPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2FscG0uaA0KPiA+IEBAIC0xNSw2ICsx
NSw3IEBAIHN0cnVjdCBpbnRlbF9jb25uZWN0b3I7wqAgc3RydWN0DQo+ID4gaW50ZWxfYXRvbWlj
X3N0YXRlO8KgIHN0cnVjdA0KPiA+IGludGVsX2NydGM7DQo+ID4gDQo+ID4gK3ZvaWQgaW50ZWxf
YWxwbV9pbml0X2RwY2Qoc3RydWN0IGludGVsX2RwICppbnRlbF9kcCk7DQo+ID4gwqB2b2lkIGlu
dGVsX2FscG1faW5pdChzdHJ1Y3QgaW50ZWxfZHAgKmludGVsX2RwKTvCoCBib29sDQo+ID4gaW50
ZWxfYWxwbV9jb21wdXRlX3BhcmFtcyhzdHJ1Y3QgaW50ZWxfZHAgKmludGVsX2RwLA0KPiA+IMKg
CQkJwqDCoMKgwqDCoMKgIHN0cnVjdCBpbnRlbF9jcnRjX3N0YXRlDQo+ID4gKmNydGNfc3RhdGUp
OyBkaWZmIC0tZ2l0DQo+ID4gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rw
LmMNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHAuYw0KPiA+IGlu
ZGV4IDZiNjBlMGExYzhlZS4uNzdkNTE2ZjBiZDA3IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHAuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHAuYw0KPiA+IEBAIC00NzY0LDcgKzQ3NjQsNiBAQCBzdGF0
aWMgYm9vbA0KPiA+IMKgaW50ZWxfZWRwX2luaXRfZHBjZChzdHJ1Y3QgaW50ZWxfZHAgKmludGVs
X2RwLCBzdHJ1Y3QNCj4gPiBpbnRlbF9jb25uZWN0b3INCj4gPiAqY29ubmVjdG9yKcKgIHsNCj4g
PiDCoAlzdHJ1Y3QgaW50ZWxfZGlzcGxheSAqZGlzcGxheSA9DQo+ID4gdG9faW50ZWxfZGlzcGxh
eShpbnRlbF9kcCk7DQo+ID4gLQlpbnQgcmV0Ow0KPiA+IA0KPiA+IMKgCS8qIHRoaXMgZnVuY3Rp
b24gaXMgbWVhbnQgdG8gYmUgY2FsbGVkIG9ubHkgb25jZSAqLw0KPiA+IMKgCWRybV9XQVJOX09O
KGRpc3BsYXktPmRybSwgaW50ZWxfZHAtPmRwY2RbRFBfRFBDRF9SRVZdICE9DQo+ID4gMCk7DQo+
ID4gQEAgLTQ4MDQsMTEgKzQ4MDMsNyBAQCBpbnRlbF9lZHBfaW5pdF9kcGNkKHN0cnVjdCBpbnRl
bF9kcA0KPiA+ICppbnRlbF9kcCwNCj4gPiBzdHJ1Y3QgaW50ZWxfY29ubmVjdG9yICpjb25uZWN0
b3INCj4gPiDCoAkgKi8NCj4gPiDCoAlpbnRlbF9kcF9pbml0X3NvdXJjZV9vdWkoaW50ZWxfZHAp
Ow0KPiA+IA0KPiA+IC0JLyogUmVhZCB0aGUgQUxQTSBEUENEIGNhcHMgKi8NCj4gPiAtCXJldCA9
IGRybV9kcF9kcGNkX3JlYWRfYnl0ZSgmaW50ZWxfZHAtPmF1eCwNCj4gPiBEUF9SRUNFSVZFUl9B
TFBNX0NBUCwNCj4gPiAtCQkJCcKgwqDCoCAmaW50ZWxfZHAtPmFscG1fZHBjZCk7DQo+ID4gLQlp
ZiAocmV0IDwgMCkNCj4gPiAtCQlyZXR1cm4gZmFsc2U7DQo+ID4gKwlpbnRlbF9hbHBtX2luaXRf
ZHBjZChpbnRlbF9kcCk7DQo+ID4gDQo+ID4gwqAJLyoNCj4gPiDCoAkgKiBUaGlzIGhhcyB0byBi
ZSBjYWxsZWQgYWZ0ZXIgaW50ZWxfZHAtPmVkcF9kcGNkIGlzDQo+ID4gZmlsbGVkLCBQU1IgY2hl
Y2tzDQo+ID4gLS0NCj4gPiAyLjI5LjANCj4gDQoNCg==
