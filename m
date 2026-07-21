Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 498DDC44529
	for <intel-xe@archiver.kernel.org>; Tue, 21 Jul 2026 09:48:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06C0310E30A;
	Tue, 21 Jul 2026 09:48:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eSo/lXFD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7580A10E30A;
 Tue, 21 Jul 2026 09:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784627298; x=1816163298;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=WReVZbdD/uTW9OYctCziB4bm7/TO9SoFwwo2FSG7rYI=;
 b=eSo/lXFDtG2hcOoLu63x+5xA2E0Efdu/k+nhixzBGGNXKr9m4R4kGemX
 SfbL6gKu15XO03fwlxvFlEa0o3UbAn5acUztHjboerVYiiryqqrxjsCUE
 T4tfHvbqsVrSktJIXOl1KSWXMxB2RjkWogrYkiQnCMhz6vHuf4KHs3lwV
 Z6boHFujdrZSP0o3iJutO1h9LYVeY8M/vxAGrHT54pXpfM1AMnt9wMowe
 wtsexAhLXnYgBjyXa5E1PrzLMygepvGvlJqjmd8EBdF9UDOs0pcpFh2+s
 Ii49Y1G3dcpUjCgyH7BcSCmrid1740Cxl5GlPSr0Zqrc792YI8TJ8njSW w==;
X-CSE-ConnectionGUID: LsYiJo/SR8inDSgfs1nf9g==
X-CSE-MsgGUID: tLA/8XUiRRmR0itlOkAKXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11852"; a="88901369"
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; d="scan'208";a="88901369"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 02:48:17 -0700
X-CSE-ConnectionGUID: yhYbnFVaRk+ZOjAjfD/PHw==
X-CSE-MsgGUID: oa26doAnRIGL6SMF3lv3AA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; d="scan'208";a="261502276"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 02:48:18 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 21 Jul 2026 02:48:16 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 21 Jul 2026 02:48:16 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.52) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 21 Jul 2026 02:48:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BHnJK8gmaKM1Vh+KhwOr0FdBa/X4Xq6p7TkNlyZ0z8wy5hpyPTbB+BvAAypN5HTm1/AvnH2mAHF3Zsc3mFaTzawpv1a7ekgt4d2F9GqDTai3WJWzM7LjA4a9P9tCekGLdiaY5SQNDvOV/I0P5HglyxKE3mjWJYp/N4Rq9p7s2q6KR+ACpswNPvdGNp1rlCGgT9ISy2Kya3Almd6yg09NogkhDv0OLMq8zc0f8RMTuRVbFzV4Ztze0ecUffEGqQYFgKtDdbdB/JeephivAARTfVRFmcCrNM2yz0+1XLymdm2ZM1pEpY2sF50JweiGZkjION+zTBq1i/Ny60CfggCbWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WReVZbdD/uTW9OYctCziB4bm7/TO9SoFwwo2FSG7rYI=;
 b=uwZv9GCB3AktIAiuB4cVBA0a773z6Xtt+ZOUETWbb6hlV+KlJDycsha5TDhg163Fs1k/TmhfakpbyqHC/JeXdMHdgQ2v4s1PTZUsvIiKYHQtO3w1Y95qB/vBbkgDnEdqmFkNb7ZlKRC3tdmAX5n3/YP1b0oUvx+Pc3Z8suCL2GbNEHgiVzK3yhghrwe7WSFCUVQcQEa35PTif3e/RpYpzpW9U7YdsY0CFXcs77zjIdGnZe0i6zIXjKViyqXwT5mnQJNGrT1iL+DLc0ueFGDtWQC99xbqSKWQYohxTZbMkXhWTuM5izmoJCDBniAesWfAAGPi4XS4zSPmpm7MnKx5Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB7777.namprd11.prod.outlook.com (2603:10b6:930:71::14)
 by LV8PR11MB8769.namprd11.prod.outlook.com (2603:10b6:408:204::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 09:48:14 +0000
Received: from CY8PR11MB7777.namprd11.prod.outlook.com
 ([fe80::5a6:cd7:969c:fa41]) by CY8PR11MB7777.namprd11.prod.outlook.com
 ([fe80::5a6:cd7:969c:fa41%4]) with mapi id 15.21.0245.009; Tue, 21 Jul 2026
 09:48:14 +0000
From: "Govindapillai, Vinod" <vinod.govindapillai@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Hogander, Jouni" <jouni.hogander@intel.com>
CC: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH 2/4] drm/i915/fbc: refactor maximum plane size handling
 for fbc
Thread-Topic: [PATCH 2/4] drm/i915/fbc: refactor maximum plane size handling
 for fbc
Thread-Index: AQHdFXbwIAgETyYd3EiFTQu9ebAINLZ3tkwAgAAK3AA=
Date: Tue, 21 Jul 2026 09:48:13 +0000
Message-ID: <6c6f3a9a7dd10324ac9f0ec39d7cadf24ac37b22.camel@intel.com>
References: <20260716225956.555995-1-vinod.govindapillai@intel.com>
 <20260716225956.555995-3-vinod.govindapillai@intel.com>
 <5b25d48e55a7fc1873beac8e71dd783c96c7a90c.camel@intel.com>
In-Reply-To: <5b25d48e55a7fc1873beac8e71dd783c96c7a90c.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB7777:EE_|LV8PR11MB8769:EE_
x-ms-office365-filtering-correlation-id: 3c3253ea-fa97-4c5b-e337-08dee70d2ee0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|10070799003|366016|376014|1800799024|3023799007|38070700021|5023799004|4143699003|56012099006|11063799006|10067099003|18002099003|22082099003;
x-microsoft-antispam-message-info: g7x7B9G3i9rE3CCC9jyauGcZeDtyChWuhRSgXN/k7SfDgiF1qaGBe4jE9pwUM7G72WbN9dd1MeYtmg40WwDC9o55MxRqS5d6g1DESzqo7HzV3fqAbf9ddBDfBQ5rk0hq/KLpptUYPWp3IoaLb2ZTNBeUqNe5p44+tDJlPMil+++I2qJf6MgAWwmWdOjOQad4C+7K3iKNEmdUUccUvW1n0RnwqKCz7gG3kZob59j27QZG+1SkRj5BqNgyXqxcZm20bTwHb52qSTgwBYLLZU8URkBqOHK8qmZZGFDN88r496mh3UE8ZDKTlB18LmWetTolkwXJZlyHgmzn2wp0fMU1/YNyDExEXPj6EYM6rdrbyNW7n8KnnrxnX7mWPDCpMwdnENQQ0iCeZzWVdbaRpxRsXOzzspVVnTgcaPudOr4aBW9VB2U618ZJc7wPbe5IsOoyzMll+ytydbSqvnuNQ69ZGNn9Hq8Mzt4nP9NylC+cvdM6vaX48APZ7xpR5bgG1ZV+D3T9xN4sgj3JApB2kozpKrQdV6B29mRPCGZKz+60iabKzmlcwkJWw8l22NiVJW+HMEFgUVSw/BDXvIx5XgeTBGORzAvbQA1QTCWbrmNixzuPUWxLTdDFYjGHH8y/rI2hYJN8JkwB++ZCoAIxPRDzMnbJHD8urRuP6lYHWKFBU3wqwKMXiFoSDkzRo3AxxPWj1dRpXrMg71pVAIe4K5eZutrRBDk5/VSYOH3y7GTuWDk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7777.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(10070799003)(366016)(376014)(1800799024)(3023799007)(38070700021)(5023799004)(4143699003)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V2FlT1lKUlJhK3B6R0swYUMwYVFrcDgwU0V1akJwa2hzTkNHV3B5M0l2U1Fh?=
 =?utf-8?B?WExqejVGZW12bi9rUHVrMU5xVThwRnEzTzE5ZE9UVm1jR0dGVFVZeVkzSDc2?=
 =?utf-8?B?Q3JrbWN0L3Z5QW9rRHBuc2xyd2hweEFJVTZZelJLWGdpemwwUDUyL0d3dWJv?=
 =?utf-8?B?ZVp4SFkzdERSWWNRejVITlQydzA3MEZ3bWVaZ0VxcFBYc0p3SmgySUxFejVS?=
 =?utf-8?B?bXMzOHQvSzJseS81RmtGMlBrUGtXRXI0emJKakh3VllpSUt3eXBEOGhxR3Yw?=
 =?utf-8?B?OURteFVwczZ2V0dQYldSVStVbVlpcXBFWmgyRXBBWmVaVHhqZHlQYlI3UFpM?=
 =?utf-8?B?WWxtQzZhSS9JWWxSdW9hVW9KSUdCNHVYK29mNnNjWGh4aUp4S1Z0UFI5RG1i?=
 =?utf-8?B?OFRpYklBcWlYTW5uSXNqRGk5SkFNVHBrYTBPczl3R0dPYzF3UkZ6czJHSG1G?=
 =?utf-8?B?Q1F1am4yVEIxNGFFN0xTV1MyZDRRVkgxbHg4WktmTkhBbnRJdE13RWNnTjRt?=
 =?utf-8?B?TnN4cHNEUUYyNGZMSFZJTnFKT1JqZ2NjZW5sam5DcXJ5VzIycFRlWU1NdG1z?=
 =?utf-8?B?eTFkNW9JOUNzd2Fhclk1OVd1QnJMdkQzZGRPU0RQN0dWSDAraHNhN3phYStO?=
 =?utf-8?B?ZGRVclFTRU5ocXEwWDJxeEI3WldXU2VqNEpKTzVvbDVtYzg4TWJPU2lXRFkv?=
 =?utf-8?B?cmhZcVVRYmxKMSs0UU9LZUxubkNpQklMSG5QQmxnY0dMZk12SXdMZ3RRWm1S?=
 =?utf-8?B?UTZxNGFvMzd5WkFMcUIrUnhVcy84WTZSMGkzQUpLbDBWQXdxRzRENkpkV0to?=
 =?utf-8?B?N2RBYlY5ay9ybUxVRG04LzVJcmJLMHNmSUVEbEhHa1o0ZThvT1hVbm4wYWs1?=
 =?utf-8?B?Z2VRR3hJdEdURUNtejZuZXcwbmVjemJrL2paeUkxcmtHMW5kY1lJVy9WTzNX?=
 =?utf-8?B?YmVoOVVXVDdUMXl4SU96SndUc2lHek1MYkpWcHFuUnk0bTkvUnJvYkN4MG9m?=
 =?utf-8?B?Wmk5aDZVZU83TmhxZDZwS2RFVHZmRklSL2FPS1dmdU9mQjNHcDRMUktQaDlI?=
 =?utf-8?B?bmFVSEdvNVVsaXlPOGxMVExGaXJRZjdEVDJpSkQ3ZDZkTVEwcFJmM2s0Z1Bw?=
 =?utf-8?B?VzF6NkdySStoc3p6eStxYWQ0M1ZWTGlQaDBDWWE5MG5LOHNNbitRbXc3dTY1?=
 =?utf-8?B?dlU2ek9EM2xzaUlxRmpvOEdSZlQ1RXQrL2NROUo0UC9CaEN0cVhtN1RwZGwz?=
 =?utf-8?B?czl3QmNyYkpIeFhpSWhEYit2c0VIRjgrdmUwZnNkSDBFclNSdHV4RmhVRWkx?=
 =?utf-8?B?THpEdlhmSnpjVERQMHlVWGVBaUxlaGlDTFNQQUtsVHBFQUhDZGhKS0RjMjJs?=
 =?utf-8?B?WlBvRWFiQ2FqTW5Ha3p5UEFVNHdCdGJGc0dMT1JhckpLTDFEd0tmZWduRVlS?=
 =?utf-8?B?WkcvT1dSeVM2WWNDQTNncUtDOUtWbHhQVk9GQkJhOEgzMzZMSXNQem9jTnlm?=
 =?utf-8?B?b1Z3TzVBelBZZ01pWENPaWtkVEdhQ0xFMWNIQU9rVVZSSTd4Q251dXJ3TGsv?=
 =?utf-8?B?NDB4dENQejFNMmtKVVdVdjZOYmxMTVgrNlk0ZjZQRnlKNkd2a1huM3UxZThm?=
 =?utf-8?B?eExLbXprOWh5TDVpbGQrWCtJQW1FaENpbFQySWIxaC9DUHR5ZlYzWEphbnFC?=
 =?utf-8?B?cElDbStmckZJWmdOZnFVdzM1QkM4dzhKcnBvTzBmK0JzVG9URmYyWmU2dGND?=
 =?utf-8?B?bDh1QVFsVDBVaEhxWkRXRFFOaVhKclF6YXhNUUhoTVd3bkJ2Yk5RZ0p1c0gr?=
 =?utf-8?B?ejgzMjVUdmpKSmROWS9zdDhsTkFLcnRPQXBNaWlxQTdpRE1ES1Y0dGFlQUtj?=
 =?utf-8?B?SVdCNDFkcWpmcnlpS2J1cStDUDA5U3FqR09IYnpVTDQ3amhvdTJvYTJCRTls?=
 =?utf-8?B?Mm1EMGNlNXdaeDVobWYzaElVU2hJZXNVM0hHU3V2bmdTYkxlQjVYRmxjbXNx?=
 =?utf-8?B?ZCs3NGhnWDdVU3BEaXQrTlFJQ2RmTHdEQ2RMdWNMU3hjQ2U2RXBzbUJXajI2?=
 =?utf-8?B?V2hEOFkrbjdtajllcW5DS1dIdG5Zb24zVCtYeUg4NEVIMEhYS0FJbTZiMnk0?=
 =?utf-8?B?ekJNRnRoM0QydVFxcVgxVktJL01nUmhiZWJsMFp4anpJL1VYckNzYTAvY0N5?=
 =?utf-8?B?cnMvSjR0VVArWE9tT3JDRDBEVERvZzBaVDkzTEhXYU1pOGZyZzRES0NSajRr?=
 =?utf-8?B?bnpPMnJmSFZyUkpjazI0SnVFbkRvVUhWVTFCY1kyYWN2bU5aVDdRRW5nc0RH?=
 =?utf-8?B?YzlUN0hwVHdYQ2U0ek84ZmdoQWlJQTJSYVI2VW5jTkxtWHdYNlh6bVRFUm1R?=
 =?utf-8?Q?8BRGNKEjM7w6KdHt5VQcpLbDckVrl0cxy9weHvivBlsI6?=
x-ms-exchange-antispam-messagedata-1: HwgE3Kg8uxkBXOSMb1ngTU8qUTwvsY0C9oE=
Content-Type: text/plain; charset="utf-8"
Content-ID: <85842D8CC13C88459833441B634655D3@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Vdtkgp/wACAIKcEoj/NlFjZe3MRhXYD7LeF0W9jObA5BVWX/ywfpWaZlJsX4N0tiVP+sBKQ7Mv+io/GImqVEN5J1oT2KvPAECAatdNiM3DZ7Iu4TrtoVzzVPiiTUXir3UFroTicArJMGV/miyYAiFP7sf/3fZrb/0Q6He8JRup8+p+IdOmwZJZrj3480/nI+j/Os96OBEo4IKvmpzu3GDj37R8glWdt1Uf5/UKRJOJ5U0anWN4G80gQgjH1Kst/BfvzS6l7iERSpYoFt/ISr9V7U9S6BdnHsQYJ+yPvOLfF2XFOXUD32x+wdNwEJV+pz4fAMVKzJomq9eqnQZye3hA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7777.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c3253ea-fa97-4c5b-e337-08dee70d2ee0
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2026 09:48:13.9945 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JYyJO9d19G9dLM9xKH0d6ZqFo7m+d4GQEaBOTxLzI9Jre97o+KemsUoAoak3wp2+zwdzu+2xJzo0lYxVAmSkzFwUEOPqCT99hI3Q/tojz4c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8769
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

T24gVHVlLCAyMDI2LTA3LTIxIGF0IDA5OjA5ICswMDAwLCBIb2dhbmRlciwgSm91bmkgd3JvdGU6
DQo+IE9uIEZyaSwgMjAyNi0wNy0xNyBhdCAwMTo1OSArMDMwMCwgVmlub2QgR292aW5kYXBpbGxh
aSB3cm90ZToNCj4gPiBSZXN0cmljdGlvbnMgdG8gZW5hYmxlIEZCQyBiYXNlZCBvbiBmaXhlZCBw
bGFuZSB3aWR0aCBhbmQgaGVpZ2h0DQo+ID4gaGF2ZSBiZWVuIGltcHJvdmluZyBpbiBuZXdlciBw
bGF0Zm9ybXMgYW5kIGV2ZW50dWFseSBtYXkgYWxsb3cNCj4gPiB0aGUgbWF4aW11bSBwbGFuZSBz
aXplIGFzIHBlciB0aGUgcGxhdGZvcm0gcmVzb2x1dGlvbiBzdXBwb3J0Lg0KPiA+IFVwZGF0ZSB0
aGUgZnVuY3Rpb24gd2hpY2ggY2hlY2tzIHN1Y2ggYSBzaXplIHJlc3RyaWN0aW9uIHRvIGhhdmUN
Cj4gPiB0aGUgcG9zc2liaWxpdHkgdG8gZ2V0IHRoZSBtYXhpbXVtIHBsYW5lIHdpZHRoIGFuZCBo
ZWlnaHQNCj4gPiBjb21wYXJlZCByYXRoZXIgdGhhbiB0aGUgaGFyZCBjb2RlZCB2YWx1ZXMuDQo+
ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogVmlub2QgR292aW5kYXBpbGxhaSA8dmlub2QuZ292aW5k
YXBpbGxhaUBpbnRlbC5jb20+DQo+IA0KPiBJIGRvbid0IHNlZSBhbnkgYmVuZWZpdCBoYXZpbmcg
dGhpcyBhcyBhIHNlcGFyYXRlIHBhdGNoLiBZb3UgY291bGQNCj4ganVzdA0KPiBmaW5lIHNxdWFz
aCB0aGlzIGludG8gcGF0Y2ggMy80Lg0KDQpBY2suDQoNCkJSDQpWaW5vZA0KPiANCj4gQlIsDQo+
IEpvdW5pIEjDtmdhbmRlcg0KPiANCj4gDQoNCg==
