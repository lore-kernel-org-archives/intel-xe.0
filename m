Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 643C8CA5FA1
	for <intel-xe@archiver.kernel.org>; Tue, 29 Sep 2026 04:10:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E41D910E74A;
	Tue, 29 Sep 2026 04:10:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BqpzfIXf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B149210E570;
 Tue, 29 Sep 2026 04:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790655006; x=1822191006;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3o6CwTRMrPsaPSW97V1IWy1Ozt0dtrgmE1L6mZlHuHY=;
 b=BqpzfIXfzlpdUI1jX5irYFgqREjiJO/eEhLeslH8ZYX8yuyZg6ia8rqA
 5ybEgj8T6QGcpIfYZbrZZohdClNCFwHCy6f6MDOSdnlKa7AUxKouo59lZ
 XZYr//yJlGrIBjbn9OJNuSXGQQXmzPA54Ye4g4XASD/9ek8E1PAWh7n5K
 hUW6MFbts7LtokdX1dVq8khXVIOof/85X5eohWZqmhhTQWcEB9B/PhDOS
 CmpRMzJALXkecVtfFCVOp12gllAQ3n62Rk0stkl0NzqWJPxua+lImBqdq
 JCyPVTdRSCYJINFU7VEX2O/abq9uF0gic/nwnF4BaYMvfFETclBjs61bf w==;
X-CSE-ConnectionGUID: OZ3twOeESRqdRwDrT9JCrQ==
X-CSE-MsgGUID: 5akdkY4KSAmf06YUFKFSfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="90264525"
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; d="scan'208";a="90264525"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 21:10:04 -0700
X-CSE-ConnectionGUID: 5mO1qBnoQ7CJzLz3cUy4FQ==
X-CSE-MsgGUID: 7gr18xSWQHSJKU9tb6jNeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; d="scan'208";a="278456676"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 21:10:05 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 28 Sep 2026 21:10:04 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 28 Sep 2026 21:10:04 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.70) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 28 Sep 2026 21:10:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SPywAySKIvAEtPgKPNacwCh7gG+43oWkM28kRJyNPak+doY6MnuOvU8NgQIuYbtzgej8Wuca7ceFfLSEnw9cf/VJ+hoterFZIeQ6LfZx26X7tTh3135eTl5orMouYuBvnOgyKueLRpGMzWA6f6BOB2Eu2+JxJ3sKn10GjWjqZkDwDYBvhtmd1ZZJBVzb1fBxAQXuodamrFZjATMUr8IyYFCnSjE/bCXL69NGD5d3Y5bwklmGLFjaZvselKKzrkcyVkk7opXHoxiAvE7q7R9HLHj+Y5af552ftIQLl0yP1HUla3L9Ur0nfiZW6Os6UkdieSQqWH1OhpeqwtYCii5zMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3o6CwTRMrPsaPSW97V1IWy1Ozt0dtrgmE1L6mZlHuHY=;
 b=gPzzjkLfAT9YO/vDHIgFZ5+HcwFFVsPYzC61uvzv9tAZcCsdfIhqhMLe9stZwm8HGs45JZ6ULrIZDR04IKEF6r4sYwbRqNowRbj3oPR5wnZVJLNQXnhq5qYCc30pQFMD/Xjqcftk2WyfLkB2tfscRZKf3vkfGfDyR8Xn7pW87Nyo8K9ZyNHZvbEYP+HuC4H1IqD5T8sJBDX5wcJsjregcgciO6UqZvMprZtd8ry84NY7TijVZGxiPf00gvQLPvmm34zEw/HpUQb58J0VBIXVbWnHvoU9VlzhgbIDf0RAVluHBSo2WTpTSYuuBeDF5UnaE2bhWoIwLPDMWDSxOOi8lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by PH8PR11MB7023.namprd11.prod.outlook.com
 (2603:10b6:510:221::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 04:09:58 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334%8]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 04:09:58 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>, "Manna, Animesh"
 <animesh.manna@intel.com>, "Shankar, Uma" <uma.shankar@intel.com>
Subject: RE: [PATCH 2/2] drm/i915/display: Don't require a 1:1 pipe to port
 mapping for DC3co
Thread-Topic: [PATCH 2/2] drm/i915/display: Don't require a 1:1 pipe to port
 mapping for DC3co
Thread-Index: AQHdS+m/MpW5+Qr/YUStYOAGJQ4517bjlpmAgAFMLQA=
Date: Tue, 29 Sep 2026 04:09:58 +0000
Message-ID: <DS4PPFE901A304F40713143543D237F17EAE38C2@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20260924055734.2138787-1-suraj.kandpal@intel.com>
 <20260924055734.2138787-3-suraj.kandpal@intel.com>
 <26087b72-fd59-42d2-9791-adff6924a645@intel.com>
In-Reply-To: <26087b72-fd59-42d2-9791-adff6924a645@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|PH8PR11MB7023:EE_
x-ms-office365-filtering-correlation-id: 4852b654-f729-43eb-6575-08df1ddf86a7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|11063799006|10067099003|6133799003|56012099006|18002099003|22082099003|4143699003|38070700021;
x-microsoft-antispam-message-info: P1y2tze8FUU7VC9lwQrlvWXhC/2ndIBrSuiOWxLusNv2+ck5tMY6RdAuj1yX4ooPxZMDf53oeCrHS4hpbDeGgCV5WqVCZaYk3+T8Ngn18yZKnWuw/u3RC2xzKXpdM1yK5suipcxW6lA4iio2/NGxhr51TquAqE1cj3089f/aA0qn4CypLMK/jKAuC7WVXLur5sq9lKeLi8keh6L7D56o64FijEyj6/V/0/EviaBq38d0DWT9/9XhwjAIbrHNmjLzd99oAbt85qgFLZflqg98oT5Y/9a3/KJVknhufC65ONwzzwgc0vkY+W77KPGAbsMS6mnv+DxpLtfj9oCMSMezyxRIktyNpjNZtVAkSf4tFz2OYcUwoh6t3CsdRhCmoRo7k1+w1jzWsPbLTJDoBgeKJ45HrommWm6jnTJ+HjtuIwc9obcj98uBq5NOU0lASlpfo3VeE28HjRQ0kiBDrxSsSDOqrg5yn6Ki/CRtixaa+hiqJxbkJ0B6GgHVhjeYzSJeLK275pQ2WG6ieGIfW7G4+E+dt+h3pB0v4lw9Ocm+VYjyH0xQzNUtW0uAXK6HDzcJQ+aAzsIUIndzq3m8s4olPk6vZx9V+dzjPl2yFy5bIVhWH6XC2BpHtcvNIo86JNgtkDFA0f8Nj041Oz4mYrR2BaM7aoyAEZq44FuTxUxp3fcSqHBIwTvMBtwKX7Q6uLqfs/uYGZSR4Pl3q2DBN867Nj52bRK+HNOrS7O5zFVjEtg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(11063799006)(10067099003)(6133799003)(56012099006)(18002099003)(22082099003)(4143699003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?THZoSTZISWV5Ty81TkF6Mnh2UkVCdkdzc05HN1QxNU91cHhHTVpFRXkzVVIz?=
 =?utf-8?B?cG13Q0prd3BZVW5SRHlmb1c5ZGlsNU1Rd1o1UFdoLy9oeWkwT0VkTzlSYVE4?=
 =?utf-8?B?UWRTTkd5TWt4OXZMOUJSZ0NWSnpkWHcwZ2V4Y1RFK2QvcHRrN2FOQXRqTkQ5?=
 =?utf-8?B?cW80WG1SdkFvLzc3bndXY0lNR0R4OTQxSVR3VjhtNkFkZFZ6TzRTWWM3VDI5?=
 =?utf-8?B?a3ZLZTFrVE4wOElZL1ZveFhROUtNZGVGTm5hNmtnejVGa2tzWlRKQll5Mmd3?=
 =?utf-8?B?cnVrbDBiaXIrQlU2VHdsZEVCRzVac2FmbTgrK1RMM2NKaW91RDVnVU9saDBS?=
 =?utf-8?B?cU54eWpFc0o5UVBxZ3lvTEtFSDVNQ2FmMnlmWnkrRitDclIyZGdzVFU0QXFI?=
 =?utf-8?B?ZHc1dFpwdEwrRFZNMENpV2d1MklvTk9VK2ZWRElTMlRPRlI3dGFhZ2JMTGVi?=
 =?utf-8?B?QVFvNTh6bzV1ZlNuNjQvcCtDV2R6ZGNrdTJURlZmTjNXR3lwSXJESG9ybFJs?=
 =?utf-8?B?cnNUTmVCNEg0cTVHY0dBODRlb21uUnJ1SklMZldmMkJia1NqQVR4TlRlZWFr?=
 =?utf-8?B?ZmJJS1dQdTFscnBxNGhqVGRNWUs5d0xtZHdIc3ZMdHN6OXgzZEo1Wm43UGxk?=
 =?utf-8?B?UHNaV1RZR0ttZ1M3NzR5TEtkWkgwWTg1SkxpTTNtV1hNQUNJWWVlcFlOeFRV?=
 =?utf-8?B?cjZFWnBjUGk5UWdoR2VMaXpUTzFBVVhqTHV4YnlUZ0pMSW1TWGw0UFNPTDZt?=
 =?utf-8?B?OW85UkJwUXZ0T1ZGUDIybXBSNEpEU0dMMGprRWJ4NmpoNU1EeUR1NDZ3Yzdo?=
 =?utf-8?B?Q0tYem01MDIwdE44QkRlbE56Y1gzYUVodjFFUXdUUG5tY0ttaitvYkJvRjZk?=
 =?utf-8?B?VGM0ZEt3MzlNU3ZpOTc3am11bzFVK2RSYjlzK1BEeEVqZ3BrQWlIMnkwYnNT?=
 =?utf-8?B?NElBSDkvNDl3UUhra0ZRU3NkNnkyekhJYTRCWWQ4NEl4c1VxL0VLQmFHbzJ6?=
 =?utf-8?B?R2FWOTg1WEp4VnFUQVRydDFHOFYvNG9yRERCVEE2K05FZmlrT05XSjhUZVg3?=
 =?utf-8?B?UWljYmZwNXRUOXQ2elFEcndIeGV6R2lIWEJUTVl4R3FWa3VNYkQ1alJhQXRh?=
 =?utf-8?B?eG00VWszYzd2QkljMHFWOTlTTHV0dmk3REtCU0lSSElKODJNZ2l1NHAvaDIy?=
 =?utf-8?B?YVRncGZzVDROQ3Rwb1JFakdnN3ZBR1EzK21IL2VmSUptQjU0NHYyMCtHbDZa?=
 =?utf-8?B?c24rSjJ3RjF4cEIzMEJHVHFocGd0cElSQWFRSUwxTDBERmV6QjY3UVdHYkw4?=
 =?utf-8?B?M3hjbFg5clFkUUM1cVcvNHJvS25Lb25PeHJlR0lJWi9kTjlGdW8xZnNsai90?=
 =?utf-8?B?ZlE4VHRIQTljam5LVGVaSyt2ZmxkL2NMMHNrWnBJbCtTY1kvczRyS1FBM25R?=
 =?utf-8?B?a3hMTlFMVTJVTGNyUVJ6RC9WMGQ1Mmk3YWlTRVloTS84aE54REZYU0EwKzd3?=
 =?utf-8?B?UGtQR2E4U0VGK05tZm9VZS9BUStDSEl6ak1KRUNBZStYSnFPR01ZWkI2eFkr?=
 =?utf-8?B?Q05hNDVDUTNUUjFQdnZjb3M2eUdKcDBtK0NoZlRyUVRkVjNJbkpQM3Jxa1Np?=
 =?utf-8?B?RUJvQU53OVU3N3BqNXVBRWtSb01UN051aDNueFVjRGU5c0NyWiswVmcwSHJO?=
 =?utf-8?B?ZmFlK0I0K3NKWGpwcGZYSFFRdWhpNWo1dmtBcXZuV3VaVklSN3V3MGF3bkxQ?=
 =?utf-8?B?bk9ud3g4YXBodmZLQ3Y1Z2lZT3VPNG5uMTZnaGJUQTV6RGFWbWxrNjkxYmc3?=
 =?utf-8?B?aE1IaDFVblRhRlZDNWpGN28zbFhkb2RyZWFmVElkRmtkbDFaNkFNc3poZXZk?=
 =?utf-8?B?UVA2R2Y1WmtyY2NQMi9lSWVvU0U0Q0xiTFhhbWo3Um1YZXZxRTBsWUdaRjBl?=
 =?utf-8?B?VHRXOHpYWXF2STJpakRkTzkvOVY4clpkb01ZWEpLTk1kSVVEM3JUQXcvM3BI?=
 =?utf-8?B?UzZZNHE1Wnh6YkhNcmNxS1kwbXR4WUVOaStkUFU1WDR2WmJlS2g1WGQwTzlz?=
 =?utf-8?B?MzdYK2REREkzeUVtSEZtV0dsSUZDV1dlbnRyeXMyMU1GQ1lNVVdueDM2S0Vs?=
 =?utf-8?B?K0JDcSs3USs2VlQxR2ZNZnQ1amVKMmZsNTh6dWRFZERBaThkaEJ6THVlcmow?=
 =?utf-8?B?dmVmSXJ2SnV4T1dkR29CaVlwbTB4MEZwOFRSRWt0Q09FLzh0eGZHc0ZES04x?=
 =?utf-8?B?L2JOelZCTnZPMHQvNEdUUFRqWGEvbTY3S0RGYURhRWtTYlRhZTRwUnQ0ZGJE?=
 =?utf-8?B?QnNtSTd6aU5FQXFXNDE5dUdFamEzWFBVRnFTdnUxZlZ1a0Vha0pwZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: DIwCT4nx5T/2yIyRF7b3UwzTxIvFmY/BqXZKY0ZOyjFJn7kX0m+pYIQWxZYcH9BTjeRQYbGjlozL1Kgt+dHDtY5YTy0DZsmVhZUE1C/DSJ44YW/2Zfix/Qxv1RNSRzW7zgahMuXmeJnSBr/dYSfXxA4oVF+x2QDvxcJyxXjcDaDOTGnqUI+eEIF6vM1hTWw4mN8+yRwkqtqJIDOVdYRSELkSHwXwahF/UBpeVR5yqesbezu0yBA9qcOSBIOmlxKcLsjthk0GJ0svUwbdM1lx1jUb5C7Jjd8xWwAnJuORQkZb5ZIDosjTBZKVJRK5T6zW9w8iOT/SIPLZTbo9jyu5hA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4852b654-f729-43eb-6575-08df1ddf86a7
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2026 04:09:58.3510 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jWdV/vvXO48xjOKET/4nFR9SSJZaL57zVuphwO2nM3rxT8B6wbtRmHfRGXdrm+WO3pCiriRMf515GB3K06Qb+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7023
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

PiBTdWJqZWN0OiBSZTogW1BBVENIIDIvMl0gZHJtL2k5MTUvZGlzcGxheTogRG9uJ3QgcmVxdWly
ZSBhIDE6MSBwaXBlIHRvIHBvcnQNCj4gbWFwcGluZyBmb3IgREMzY28NCj4gDQo+IE9uIDkvMjQv
MjAyNiAxMToyNyBBTSwgU3VyYWogS2FuZHBhbCB3cm90ZToNCj4gPiBCc3BlYyBhbGxvd3MgdHJh
bnNjb2RlciBBIGFuZCB0cmFuc2NvZGVyIEIgdG8gZHJpdmUgZWl0aGVyIHBvcnQgQSBvcg0KPiA+
IHBvcnQgQiB3aXRoIERDM2NvLCBhbmQgQ01URyBkb2Vzbid0IHJlc3RyaWN0IHRoaXMuIFJlcXVp
cmluZyBhIHN0cmljdA0KPiA+IDE6MSBtYXBwaW5nIG9uIFhlM3BfTFBEIGp1c3QgbG9zZXMgREMz
Y28gb24gZURQIHBhbmVscyB3aXJlZCB0byB0aGUNCj4gPiBvdGhlciBwb3J0Lg0KPiANCj4gWW91
IGFyZSByaWdodCB0aGF0IERDM0NPIGRvZXMgbm90IHJlcXVpcmUgdGhlIDE6MSByZXN0cmljdGlv
bi4NCj4gQXMgbWVudGlvbmVkIGluIHRoZSBjb21tZW50LCB0aGUgcmVzdHJpY3Rpb24gd2FzIGFk
ZGVkIGR1ZSB0byB0aGUgQ01URw0KPiBsaW1pdGF0aW9uLg0KPiBXaGlsZSB0aGlzIGlzIG5vdCBl
eHBsaWNpdGx5IHN0YXRlZCwgc29tZSByZWxldmFudCBpbmZvcm1hdGlvbiBpcyBhdmFpbGFibGUg
aW4gQlNwZWMNCj4gNjg5MTUuDQoNCkhpIERpYmluLA0KVGhhbmtzIGZvciB0aGUgcmV2aWV3DQoN
ClNvIGZyb20gdGhlIEJzcGVjIHlvdSBtZW50aW9uZWQgc2F5czoNCiJDTVRHIEEgd2lsbCBiZSBj
b25uZWN0ZWQgdG8gUGlwZSBBIC8gVHJhbnNjb2RlciBBOyBDTVRHIEIgd2lsbCBiZSBjb25uZWN0
ZWQgdG8gUGlwZSBCIC8gVHJhbnNjb2RlciBCLiINCml0IHRhbGtzIGFib3V0IENNVEcgQS9CIGJl
aW5nIGVuYWJsZWQgZm9yIFRyYW5zY29kZXIgQS9CLiBXaGljaCBJcyBkaWZmZXJlbnQgZnJvbSBh
IHN0cmljdCBwaXBlIEEgcG9ydCBBIG1hcHBpbmcuDQooSnVzdCB0byBwb2ludCBvdXQgQ01URyBC
IHdhcyBuZXZlciBiZWluZyBlbmFibGVkIHVwIHVudGlsIG5vdyBzbyB0aGUgUGlwZSBCIHRyYW5z
Y29kZXIgQiB3YXMgbm90IA0KRXZlbiBleGVyY2lzZWQgc2VlIHBhdGNoIDEpLg0KDQpNb3Jlb3Zl
ciBldmVuIGlmIHRoYXQgd2FzIHRoZSBjYXNlICh3aGljaCBmcm9tIHRoZSB3b3JkaW5nIG9mIEJz
cGVjIGxvb2tzIGxpa2UgaXRzIG5vdCkNCnRoZSBjb3JyZWN0IHBsYWNlIHRvIGFkZCB0aGlzIHJl
c3RyaWN0aW9uIHdvdWxkIG5vdCBiZSBpbg0KYSBmdW5jdGlvbiBuYW1lZCAnaW50ZWxfZGMzY29f
cG9ydF9waXBlX2NvbXBhdGlibGUoKScgc2luY2UgdGhpcyBzaG91bGQgb25seSBjaGVjayBmb3IN
CkRDM0NPIHJlc3RyaWN0aW9uIG9uIHBpcGUgYW5kIHBvcnQgYW5kIGlmIENNVEcgcmVhbGx5IGRv
ZXMgaGF2ZSBhIHJlc3RyaWN0aW9uIGxpa2UgdGhpcw0KSXQgc2hvdWxkIGhhbmRsZSBpdCB0aGVy
ZS4NCg0KPiANCj4gQ291bGQgeW91IHBsZWFzZSBjaGVjayB3aGV0aGVyIHRoZSBuZXdseSBlbmFi
bGVkIGNvbWJpbmF0aW9ucywgUE9SVCBBIOKAkyBQSVBFDQo+IEIgb3IgUE9SVCBCIOKAkyBQSVBF
IEEsIGFyZSB3b3JraW5nIGZvciBEQzNDTyB0ZXN0cz8NCg0KDQpJbGwgaGF2ZSBhIGxvb2sgSSBk
b27igJl0IHNlZSBhbnkgZmFpbGluZyBpbiBDSSBydW5zIHlldC4NCg0KUmVnYXJkcywNClN1cmFq
IEthbmRwYWwNCg0KDQo+IA0KPiA+IEJzcGVjOiA3NTI1Mw0KPiA+IEZpeGVzOiBkNzVlYTUzMzE0
ZGIgKCJkcm0vaTkxNS9kaXNwbGF5OiBBZGQgREMzQ08gY29tcHV0ZSBhbmQgc2V0DQo+ID4gdGFy
Z2V0IHN0YXRlIGluIGNvbW1pdCB0YWlsIikNCj4gPiBTaWduZWQtb2ZmLWJ5OiBTdXJhaiBLYW5k
cGFsIDxzdXJhai5rYW5kcGFsQGludGVsLmNvbT4NCj4gPiAtLS0NCj4gPiAgIGRyaXZlcnMvZ3B1
L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheV9wb3dlci5jIHwgMTAgKysrLS0tLS0tLQ0K
PiA+ICAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkNCj4g
Pg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rp
c3BsYXlfcG93ZXIuYw0KPiA+IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9k
aXNwbGF5X3Bvd2VyLmMNCj4gPiBpbmRleCAxYjYwY2UyZGQwMGMuLjRjZTk0MTMxOTY2NCAxMDA2
NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXlf
cG93ZXIuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlz
cGxheV9wb3dlci5jDQo+ID4gQEAgLTQyNywxOCArNDI3LDE0IEBAIHZvaWQgaW50ZWxfZGlzcGxh
eV9wb3dlcl9kYzNjb191cGRhdGUoc3RydWN0DQo+IGludGVsX2Rpc3BsYXkgKmRpc3BsYXksIHUz
MiB0cmlnZ2VyDQo+ID4gICBzdGF0aWMgYm9vbCBpbnRlbF9kYzNjb19wb3J0X3BpcGVfY29tcGF0
aWJsZShzdHJ1Y3QgaW50ZWxfZHAgKmludGVsX2RwLA0KPiA+ICAgCQkJCQkgICAgIGNvbnN0IHN0
cnVjdCBpbnRlbF9jcnRjX3N0YXRlDQo+ICpjcnRjX3N0YXRlKQ0KPiA+ICAgew0KPiA+ICsJc3Ry
dWN0IGludGVsX2Rpc3BsYXkgKmRpc3BsYXkgPSB0b19pbnRlbF9kaXNwbGF5KGludGVsX2RwKTsN
Cj4gPiAgIAlzdHJ1Y3QgaW50ZWxfZGlnaXRhbF9wb3J0ICpkaWdfcG9ydCA9IGRwX3RvX2RpZ19w
b3J0KGludGVsX2RwKTsNCj4gPiAgIAllbnVtIHBpcGUgcGlwZSA9IHRvX2ludGVsX2NydGMoY3J0
Y19zdGF0ZS0+dWFwaS5jcnRjKS0+cGlwZTsNCj4gPiAgIAllbnVtIHBvcnQgcG9ydCA9IGRpZ19w
b3J0LT5iYXNlLnBvcnQ7DQo+ID4gICAJaW50IG51bV9waXBlcyA9IGludGVsX2NydGNfbnVtX2pv
aW5lZF9waXBlcyhjcnRjX3N0YXRlKTsNCj4gPg0KPiA+IC0JLyogTmVlZCB0byBmb2xsb3cgMTox
IG1hcHBpbmcgYmVjYXVzZSBvZiBDTVRHIHJlc3RyaWN0aW9uICovDQo+ID4gLQlpZiAoRElTUExB
WV9WRVIodG9faW50ZWxfZGlzcGxheShjcnRjX3N0YXRlKSkgPT0gMzUpDQo+ID4gLQkJcmV0dXJu
IG51bV9waXBlcyA9PSAxICYmDQo+ID4gLQkJICAgICAgICgocGlwZSA9PSBQSVBFX0EgJiYgcG9y
dCA9PSBQT1JUX0EpIHx8DQo+ID4gLQkJCShwaXBlID09IFBJUEVfQiAmJiBwb3J0ID09IFBPUlRf
QikpOw0KPiA+IC0JZWxzZQ0KPiA+IC0JCXJldHVybiBudW1fcGlwZXMgPT0gMSAmJiBwaXBlIDw9
IFBJUEVfQiAmJiBwb3J0IDw9IFBPUlRfQjsNCj4gPiArCXJldHVybiBESVNQTEFZX1ZFUihkaXNw
bGF5KSA9PSAzNSAmJiBudW1fcGlwZXMgPT0gMSAmJiBwaXBlIDw9DQo+IFBJUEVfQiAmJg0KPiA+
ICsJCXBvcnQgPD0gUE9SVF9COw0KPiA+ICAgfQ0KPiA+DQo+ID4gICB2b2lkIGludGVsX2Rpc3Bs
YXlfcG93ZXJfZGMzY29fY29tcHV0ZShzdHJ1Y3QgaW50ZWxfYXRvbWljX3N0YXRlDQo+ID4gKnN0
YXRlKQ0KDQo=
