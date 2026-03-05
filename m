Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BAA9F513E6
	for <intel-xe@archiver.kernel.org>; Thu,  5 Mar 2026 22:59:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDE2310E112;
	Thu,  5 Mar 2026 22:59:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J5LUgniX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64AA210E112
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Mar 2026 22:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772751570; x=1804287570;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=sM/YZYIKZOhh5sY3OJ8WwvWZ0LUTNH8Ip3wN3D8iXfY=;
 b=J5LUgniX00GfoctEYk4Z/lNg0aF90Lx/uNO760MyYKVaEwnl2QR4V8Sn
 qHxy/ZSudMNLmEwHi1p492yVqKZXfG23kORi8Heh3soXMQPYk60OM9yAF
 /vmj/4flLb17WA7n4JlJnhSA9c7h/L39ACrGtuFnG3KUlArM/aCJatjjO
 utmwSOXdxElsoN3pWEIXqCsYo04OrthA/8avyCCyrdHKyCs4Vjnu3zEnZ
 msHBTd5MNj+rQyAL4X4zdmBvLEd5RlWkWUP2IlGPXzBDbFamJy+Lyvj0v
 1b7+pHq4mQzV5Qs/7DB2u4rtz9s5Jwjsx7Yjn33cLAIDF7KQRflJr2GJM A==;
X-CSE-ConnectionGUID: kFdPWbcaQBS3UGKmFTobEA==
X-CSE-MsgGUID: v/3aJVZhRJCkAJ1v7UemNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="73554362"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; d="scan'208";a="73554362"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 14:59:29 -0800
X-CSE-ConnectionGUID: eGPCS2qEQy6fARUWl8u0rw==
X-CSE-MsgGUID: 5gPxp1onR/CxfDwujueFmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; d="scan'208";a="241846236"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 14:59:29 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 5 Mar 2026 14:59:28 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 5 Mar 2026 14:59:28 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.20) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 5 Mar 2026 14:59:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B+hd0LpUMXf7UjBD2hBlHnugou2DlMNpg3Tt90JIVmhyEbzy8S5+MJ76D9jom0bfKJZxmBgAcK3+d64VbqWABwEF+guTnv0zeW5by4QwXZwFztiO8SwF09Jt0iONmwx5eF5NOw5StGhkTjq3AjoztxduyVPyG3KJ8Lx+qDZyzMTT1mMkA32mZW8pm8Ra8QQ2citj0qAb7OLUg8fKCSJvuYDFcFKeTEgr89UY8escJZqfWJFRC8/SxUbBNm0HQL74hT13eeMzXh76uk88XxZqb5p/HB/lhNMjbiVrbT7k/3lBxxD0KHCDPY7GqnJDbdHDKdFxNevXsFi+l3i+1EYbpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sM/YZYIKZOhh5sY3OJ8WwvWZ0LUTNH8Ip3wN3D8iXfY=;
 b=frxjXKEcW1i8kxERynJqPumCcoIN97Wye66KLtIg2bJvnncpoOEVabqY6d3bSRHfqLFbazfvMuNv/6CCmlMVO9aNcx6jE/UMWhmnrKNatHM21bquh8qC5oH2QiFkEX1wjYaa2HlqfCYI2y8guXIOtbFSpoypsxg7qK6hKimUgE6/Hpu9vOMyZSzd1gphKq/v5g8OVVPCIY1DWoYbZdV70tmwgxD/1LlH0uDhvGOCjQEh1Yp4gnMkpc0hf4EcGg8NJrF84CY7Ykpa6fGtRXJOrktNt9bs+H0lPApVsybnVdqTsA6SJSFg99CXg3dHKzq2Fn1ws7b64v/ffIWWp2RQCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 DM4PR11MB7375.namprd11.prod.outlook.com (2603:10b6:8:101::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18; Thu, 5 Mar 2026 22:59:25 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415%4]) with mapi id 15.20.9678.016; Thu, 5 Mar 2026
 22:59:24 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost, 
 Matthew" <matthew.brost@intel.com>
CC: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Yadav,
 Arvind" <arvind.yadav@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>, "Dugast, Francois"
 <francois.dugast@intel.com>
Subject: Re: [PATCH v3 25/25] drm/xe: Add modparam to enable / disable ULLS on
 migrate queue
Thread-Topic: [PATCH v3 25/25] drm/xe: Add modparam to enable / disable ULLS
 on migrate queue
Thread-Index: AQHcqFKCS8DKofXIUUWW3eCxGK07F7WglsQA
Date: Thu, 5 Mar 2026 22:59:24 +0000
Message-ID: <e279c757d8f837cbbee475b4cac652a2997bff0d.camel@intel.com>
References: <20260228013501.106680-1-matthew.brost@intel.com>
 <20260228013501.106680-26-matthew.brost@intel.com>
In-Reply-To: <20260228013501.106680-26-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|DM4PR11MB7375:EE_
x-ms-office365-filtering-correlation-id: 349cfe2f-f658-4e6c-c299-08de7b0ad8bb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: +bMi1+ja02lyCeT1L5IXw4IZRDGPn1/1Sr251k3Ijy3sybWXZdN/riwzWYj+A/OFJLDW9bSvvHRhn7rV7Mkhv9u0sHCoUuCS45uBBQDtqO480gShehC7f8J7np3K3yNHACzuSl/zJ0aZ6F6s4wLMEgHwO8csHtAtmyOm44aUebO7LbJXtDsC50kSIdQH6U+xMj35xR/KF9GSYlKcry++AXw3fVjCz8M/MGDnOcBmlR19OaL6NLApPkmqgLdw+ELAhOcLlGC69aYvgK3en6HvrAyba50C5g03wCrA1SBOsyGIDGCDrVh/g5Cn1suTqE6Pl2tndPwDz1oPTztyy7DjbqRkJWh/W6SSJgtRvspwkDIpjLGXyPdk5QV8pXu7XMIRJ0mzAqwDUtVv8B/8Z3IyzSr2r2ZUIGe3cPq08wSyNqfgk3Rcx+6s+EHnEK9b28LbM2UzA4x8IFwJr87JhOeMfms2HhTZx34+OKIjgIpCZlIWx+WH2GEXJBZyNnSAQANbB8Z8h3Q3/SC1q+KCds8+undWY19Y6DNg9hbp/xXy7qaILVQKLkdN+8bnE6DYOJsXj0P/XpnjZNlWnPutvf4hujy+IsljfQTGBxLEt5SrqtcCYDtYeL43q0/Em+BDDapaHdPGDG7CIYx3+hyUxzihWvQoeXpQudvyyLzRDFjpPgoX/wV+syLadS1Ic8+QzT7NQnI/Gp4zfVvlGawPMkfTKi7RXi6NL+HVRK93NI7kFGFa/nWFh4+A8Pt4wb/lCPQxGbbRzsu9xmXHL7r2HEDaX1NwjjlyG6DoZdL81xmwdK8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L0IrVldleXM4VEtGS2FDWE5KMTJPQm04eTlhdjBEeGVvdHlGYnJ4SGgzVUZa?=
 =?utf-8?B?Wjlwa3VJOS9KQ3A4NFgxNkFqSC8weG5qdkd6RHJKZ2N3QmpUNE9lWlNyOHlX?=
 =?utf-8?B?TFlzMUoxQ2lIczBQK0ZKbEY2KzZZRmpiS1ZYWGlNeFdjaU9Caysxd2hTRVRq?=
 =?utf-8?B?dUFvblJNWFFCUWEzc1h3ZTBQQjVzL3FSUmc0NENORE8xK1llMlN0RWw4cHN6?=
 =?utf-8?B?ZlMyK0ZmSXRNbHNwcGtvMXlDeGg1c0VpZ1dZT3RNcnNhR3BUT2YyNzJqL0hC?=
 =?utf-8?B?Y0dMdjNHNDdGanlTUnlmYVRNeGg3Nyt6WHNuMGRBbGZIZjN5alFKRzRFKzZq?=
 =?utf-8?B?VmpvUXVrWEM3UjRxTm54UVVZUWZTR0VKNHl4aWZqdmhkVlpDdnNSVk1MeVBT?=
 =?utf-8?B?SXhseXlLU1BySnl6a1J3SUcrZkxGWDJRdDN6QWxXdDZhQTB3RGEwVVJSSEJy?=
 =?utf-8?B?RFcwU0swcGd3clh0Z3JybEtMNGJlcmQybWVyMUV0RGg2ajBxZTQ4cWp2dVVl?=
 =?utf-8?B?eSsxVW9zRWJlbk9lYjlzVjZNcklKMnRrT0syUEVzSlhuR0JJWjhJTkd5M0NV?=
 =?utf-8?B?THNQSFpibWJHRkFxc2dValJHeWJyWTRxOHk0Ukk2cnhOZGxKNmtCNGVYVENN?=
 =?utf-8?B?U3k0WnE4STArbFFpU1VFM2lQaStRM3BUaWdGYTRzejgyUlVORWZOdmt2ZC9s?=
 =?utf-8?B?RHJKVW9McXlPNFh3ZWx6MlNMdFliUzROd21ocVMxNlQrazd0Ulprb0t6TmNy?=
 =?utf-8?B?RXFIWXk4dUFRdXFOWVdLN2RwZDFYa0xNc1lSc1NpMHpURWdmd1licisxY3Qr?=
 =?utf-8?B?R0M4czh1RHhjZG0wMEYzUGh5TGpVNnlzOEx5azhGWTFvbmE2SkEvNlJhYklh?=
 =?utf-8?B?dEs3VDcwUm9pQWIzYlZxNzZJS0F0eSt0Si9BUUYxejVwYzEyd0pneWt4Szg2?=
 =?utf-8?B?MU9MU0lQRnY1OE50M2F5b0QrWGFzOGg5Qit5ZWFpWlJqdmpTTlZBVGRvdnhI?=
 =?utf-8?B?Nk92dC9uaXhrNDRjYlEva0E2WVBWamQzYnFtdVpvM0NvZm9VK21XRWxiU2VX?=
 =?utf-8?B?R3FMZDV6MmZDT3h4anF2eksrRlJEa3Z2SWJPWUM4bzdVN1p6SlhCTUpLZEZ3?=
 =?utf-8?B?TldWTm53NEZlblFBT2pET3BibnZQVlZvU0dGQ0JBTkVkY2NvZDl4RDJCRnFn?=
 =?utf-8?B?ZnZoYzg3ekZ4dHdnU3Mzc08wQk9ZUVV1dVV5WktKTk8xWjBCVktSa3FwM251?=
 =?utf-8?B?RFNQNDA5VnNwZmxCOHZZTk1FVEd1ZHk1ZDNyUTMwdUtGT1lUMGg3dkZJT2lu?=
 =?utf-8?B?NVdtOVVYMVZhelFnQ25hNVJUaVkvY3N2c2ljS1F4TnJ6R2ZxbWJDdXdxR2Nk?=
 =?utf-8?B?MER3T2krZXEyMzkvNXNDbmdEOGM2cXVBLzN5NXdRQnQ0anVxd0ZwTlFNcWdS?=
 =?utf-8?B?ZHZvVmFveFUydTdJSTlMVG9Wa0hFdlZWWURtZSt2WTc2K3VBTlNxT2UvZ0xr?=
 =?utf-8?B?MzF0UEMyaDdrcEllWFNNZ2xsVWo2VGljckw5WUtxdGQxUFZrOGY0K24vNDE3?=
 =?utf-8?B?RSt6MkZSUHhTNUxvdXdTaFhGUWlFanBHTFJUM2xCNmxyOEc1WitGRHJoSjYw?=
 =?utf-8?B?czZvMksyYnlZMENoUXlscHo0aDM0OHlJanJmUEVZaTFST3lYUDI5SUF6dmZS?=
 =?utf-8?B?aWNiZVJ2T3lSZ0hGbk1wYVljeFpsbURUWE9qdit0dGM5b2JEZEkxRDhQSm5E?=
 =?utf-8?B?L0g4MkZiV3V5MC95Rkhvd1M5eWJhZ1pDRmFRTE9FdmFFV3ZncDRXLzJKZm5N?=
 =?utf-8?B?MG52eVBSdWorNEgrc21naDJQUWp4akxWSmdsODhGZURkaDJPRU9FU3NkdEtN?=
 =?utf-8?B?TStaYVVuWDZkclFnSEQrNG12cHkrSGxqMmNGak9zWHd0ZURWTjRhTGtSVzlG?=
 =?utf-8?B?TSsvWmNWUVZOMk45WDE0WlZzMkJ6VVNJcnFqdzhWbXRaUHJ3TEFOVnJ1SUJU?=
 =?utf-8?B?Lzl0dWlNc2lLcU5INVlDN1M4WDhiWVcvK3VTVkJUQXlMbG1NV0YvL01EUCtk?=
 =?utf-8?B?YkJvR3BMemc0UEY5Yk0zZzdSSkFMeUlxc0ZpM29Xc0c3enI4cHF1NjAxcUNq?=
 =?utf-8?B?dE5jd2xPdW9KcUdNa2JlUDI1YzVuWitDMVZNcHhBaHA2SDE2MDQ2d2FXdUJK?=
 =?utf-8?B?TVBJbjlITHMrb05pdEMxSXZRV3BqNHhWOFh0UEt2MzJRZzZVbjYwOEhydWNs?=
 =?utf-8?B?bHB4YlFzZU9nMmg1WHpGZ0FpTEpVNzJmbDAvR0dVNFBKWVNDREZjaldWSktu?=
 =?utf-8?B?ZTdIaVJGNlpHSGVoUi9rd0hhdEhqWXRmamtqRlRiWUNNaTNsWjV0aHRkcStG?=
 =?utf-8?Q?UsfDJqoCvJ4ogFc0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <774915F6410D83499022460E4FAA3FE9@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: wPNEoHo8Yy8mV7tgJpd/Wonr9jg2LwVvos20DBcwmx/kbzf4wNa+52kLvd3iO8Ijfb5RbiZo4ILzxXz5Q8J9BpphcGTtZ0XnHbLarCzls+6yabOtHu+MXc9r8oNb8j9FqDA6etu5pQAwPb/Ce0tiEd4gGCKKbHxXHVWYa571FpASXWzn4o/fjJAvYya+B71HeN/QStAtrtIFLEMlgJ4uSvpyVJmyOuH5mkKKKKG0fRk4n0m7+kvC6Nxje8rtXM5J1SmZweocm0xndg9kTV5T8sOJBzm1q3CDd9vRLa6lAr3fPxVNpmYOr0DJbKvj4dvNClYkrMX3g+Ur0AwqKcJb+w==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 349cfe2f-f658-4e6c-c299-08de7b0ad8bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2026 22:59:24.8798 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WOU5VsaqqtKgFtAMunps5cndpQfeTjXUbX1tN6ptcSkmBhka+flZdp5VgzmdaqkjyREihAIlRx6dV8WOeI1xuYvmJ/m2Psn82gq1PDA3sTs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7375
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

T24gRnJpLCAyMDI2LTAyLTI3IGF0IDE3OjM1IC0wODAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOgo+
IEhhdmluZyBtb2RwYXJhbSB0byBlbmFibGUgLyBkaXNhYmxlIFVMTFMgb24gbWlncmF0ZSBxdWV1
ZSB3aWxsIGhlbHAKPiB3aXRoCj4gcXVpY2sgZXhwZXJpbWVudHMuCgpDYW4gd2UgZG8gdGhpcyBp
biBjb25maWdmcyBpbnN0ZWFkPwoKVGhhbmtzLApTdHVhcnQKCj4gCj4gU2lnbmVkLW9mZi1ieTog
TWF0dGhldyBCcm9zdCA8bWF0dGhldy5icm9zdEBpbnRlbC5jb20+Cj4gLS0tCj4gwqBkcml2ZXJz
L2dwdS9kcm0veGUveGVfZGVidWdmcy5jwqDCoMKgwqDCoCB8wqAgMSArCj4gwqBkcml2ZXJzL2dw
dS9kcm0veGUveGVfZGVmYXVsdHMuaMKgwqDCoMKgIHzCoCAxICsKPiDCoGRyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9kZXZpY2UuY8KgwqDCoMKgwqDCoCB8IDEyICsrKysrKysrKy0tLQo+IMKgZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX2RldmljZV90eXBlcy5oIHzCoCA1ICsrKysrCj4gwqBkcml2ZXJzL2dw
dS9kcm0veGUveGVfbWlncmF0ZS5jwqDCoMKgwqDCoCB8wqAgMiArLQo+IMKgZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX21vZHVsZS5jwqDCoMKgwqDCoMKgIHzCoCA0ICsrKysKPiDCoGRyaXZlcnMvZ3B1
L2RybS94ZS94ZV9tb2R1bGUuaMKgwqDCoMKgwqDCoCB8wqAgMSArCj4gwqA3IGZpbGVzIGNoYW5n
ZWQsIDIyIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV9kZWJ1Z2ZzLmMKPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9k
ZWJ1Z2ZzLmMKPiBpbmRleCA4NDRjZmFmZTFlYzcuLjA0OTM4OTIwNWIzZiAxMDA2NDQKPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGVidWdmcy5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L3hlL3hlX2RlYnVnZnMuYwo+IEBAIC04NSw2ICs4NSw3IEBAIHN0YXRpYyBpbnQgaW5mbyhzdHJ1
Y3Qgc2VxX2ZpbGUgKm0sIHZvaWQgKmRhdGEpCj4gwqDCoMKgwqDCoMKgwqDCoGRybV9wcmludGYo
JnAsICJ0aWxlX2NvdW50ICVkXG4iLCB4ZS0+aW5mby50aWxlX2NvdW50KTsKPiDCoMKgwqDCoMKg
wqDCoMKgZHJtX3ByaW50ZigmcCwgInZtX21heF9sZXZlbCAlZFxuIiwgeGUtPmluZm8udm1fbWF4
X2xldmVsKTsKPiDCoMKgwqDCoMKgwqDCoMKgZHJtX3ByaW50ZigmcCwgImZvcmNlX2V4ZWNsaXN0
ICVzXG4iLCBzdHJfeWVzX25vKHhlLQo+ID5pbmZvLmZvcmNlX2V4ZWNsaXN0KSk7Cj4gK8KgwqDC
oMKgwqDCoMKgZHJtX3ByaW50ZigmcCwgInVsbHNfZW5hYmxlICVzXG4iLCBzdHJfeWVzX25vKHhl
LQo+ID5pbmZvLnVsbHNfZW5hYmxlKSk7Cj4gwqDCoMKgwqDCoMKgwqDCoGRybV9wcmludGYoJnAs
ICJoYXNfZmxhdF9jY3MgJXNcbiIsIHN0cl95ZXNfbm8oeGUtCj4gPmluZm8uaGFzX2ZsYXRfY2Nz
KSk7Cj4gwqDCoMKgwqDCoMKgwqDCoGRybV9wcmludGYoJnAsICJoYXNfdXNtICVzXG4iLCBzdHJf
eWVzX25vKHhlLT5pbmZvLmhhc191c20pKTsKPiDCoMKgwqDCoMKgwqDCoMKgZHJtX3ByaW50Zigm
cCwgInNraXBfZ3VjX3BjICVzXG4iLCBzdHJfeWVzX25vKHhlLQo+ID5pbmZvLnNraXBfZ3VjX3Bj
KSk7Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZWZhdWx0cy5oCj4gYi9k
cml2ZXJzL2dwdS9kcm0veGUveGVfZGVmYXVsdHMuaAo+IGluZGV4IGM4YWUxZDVmM2Q2MC4uMjk5
MzYwNTQ2MjgzIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZWZhdWx0cy5o
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RlZmF1bHRzLmgKPiBAQCAtMTQsNiArMTQs
NyBAQAo+IMKgI2VuZGlmCj4gwqAKPiDCoCNkZWZpbmUKPiBYRV9ERUZBVUxUX1BST0JFX0RJU1BM
QVnCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBJU19FTkFCTEVEKENPTkZJR19EUk1fWEVf
RElTUEwKPiBBWSkKPiArI2RlZmluZSBYRV9ERUZBVUxUX1VMTFNfRU5BQkxFwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoHRydWUKPiDCoCNkZWZpbmUgWEVfREVGQVVMVF9WUkFNX0JB
Ul9TSVpFwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgMAo+IMKgI2RlZmluZQo+IFhFX0RF
RkFVTFRfRk9SQ0VfUFJPQkXCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgQ09ORklH
X0RSTV9YRV9GT1JDRV9QUk9CRQo+IMKgI2RlZmluZSBYRV9ERUZBVUxUX01BWF9WRlPCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB+MAo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlLmMKPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZp
Y2UuYwo+IGluZGV4IGI3YWQ3Zjk3ZTY4Yy4uMThhZjAwM2M5NWM1IDEwMDY0NAo+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2UuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94
ZV9kZXZpY2UuYwo+IEBAIC00MzcsNiArNDM3LDE0IEBAIHN0YXRpYyB2b2lkIHhlX2RldmljZV9k
ZXN0cm95KHN0cnVjdCBkcm1fZGV2aWNlCj4gKmRldiwgdm9pZCAqZHVtbXkpCj4gwqDCoMKgwqDC
oMKgwqDCoHR0bV9kZXZpY2VfZmluaSgmeGUtPnR0bSk7Cj4gwqB9Cj4gwqAKPiArc3RhdGljIHZv
aWQgeGVfZGV2aWNlX3BhcnNlX21vZHBhcmFtKHN0cnVjdCB4ZV9kZXZpY2UgKnhlKQo+ICt7Cj4g
K8KgwqDCoMKgwqDCoMKgeGUtPmluZm8uZm9yY2VfZXhlY2xpc3QgPSB4ZV9tb2RwYXJhbS5mb3Jj
ZV9leGVjbGlzdDsKPiArwqDCoMKgwqDCoMKgwqB4ZS0+aW5mby51bGxzX2VuYWJsZSA9IHhlX21v
ZHBhcmFtLnVsbHNfZW5hYmxlOwo+ICvCoMKgwqDCoMKgwqDCoHhlLT5hdG9taWNfc3ZtX3RpbWVz
bGljZV9tcyA9IDU7Cj4gK8KgwqDCoMKgwqDCoMKgeGUtPm1pbl9ydW5fcGVyaW9kX2xyX21zID0g
NTsKPiArfQo+ICsKPiDCoHN0cnVjdCB4ZV9kZXZpY2UgKnhlX2RldmljZV9jcmVhdGUoc3RydWN0
IHBjaV9kZXYgKnBkZXYsCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29uc3Qgc3RydWN0IHBjaV9kZXZpY2VfaWQg
KmVudCkKPiDCoHsKPiBAQCAtNDcwLDkgKzQ3OCw3IEBAIHN0cnVjdCB4ZV9kZXZpY2UgKnhlX2Rl
dmljZV9jcmVhdGUoc3RydWN0IHBjaV9kZXYKPiAqcGRldiwKPiDCoAo+IMKgwqDCoMKgwqDCoMKg
wqB4ZS0+aW5mby5kZXZpZCA9IHBkZXYtPmRldmljZTsKPiDCoMKgwqDCoMKgwqDCoMKgeGUtPmlu
Zm8ucmV2aWQgPSBwZGV2LT5yZXZpc2lvbjsKPiAtwqDCoMKgwqDCoMKgwqB4ZS0+aW5mby5mb3Jj
ZV9leGVjbGlzdCA9IHhlX21vZHBhcmFtLmZvcmNlX2V4ZWNsaXN0Owo+IC3CoMKgwqDCoMKgwqDC
oHhlLT5hdG9taWNfc3ZtX3RpbWVzbGljZV9tcyA9IDU7Cj4gLcKgwqDCoMKgwqDCoMKgeGUtPm1p
bl9ydW5fcGVyaW9kX2xyX21zID0gNTsKPiArwqDCoMKgwqDCoMKgwqB4ZV9kZXZpY2VfcGFyc2Vf
bW9kcGFyYW0oeGUpOwo+IMKgCj4gwqDCoMKgwqDCoMKgwqDCoGVyciA9IHhlX2lycV9pbml0KHhl
KTsKPiDCoMKgwqDCoMKgwqDCoMKgaWYgKGVycikKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX2RldmljZV90eXBlcy5oCj4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNl
X3R5cGVzLmgKPiBpbmRleCBiMzczN2RmY2M0NWMuLmEyMGZmMTcwNzIyNyAxMDA2NDQKPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlX3R5cGVzLmgKPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0veGUveGVfZGV2aWNlX3R5cGVzLmgKPiBAQCAtMjMxLDYgKzIzMSwxMSBAQCBzdHJ1Y3Qg
eGVfZGV2aWNlIHsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHU4IHNraXBfcGNv
ZGU6MTsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoC8qKiBAaW5mby5uZWVkc19z
aGFyZWRfdmZfZ3Rfd3E6IG5lZWRzIHNoYXJlZCBHVCBXUQo+IG9uIFZGICovCj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB1OCBuZWVkc19zaGFyZWRfdmZfZ3Rfd3E6MTsKPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgLyoqCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCAqIEBpbmZvLnVsbHNfZW5hYmxlOiBFbmFibGUgVUxMUyBvbiBtaWdyYXRpb24gcXVl
dWUKPiBpbiBMUiBWTQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKiBvcGVuCj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqLwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqB1OCB1bGxzX2VuYWJsZToxOwo+IMKgwqDCoMKgwqDCoMKgwqB9IGluZm87Cj4g
wqAKPiDCoMKgwqDCoMKgwqDCoMKgLyoqIEB3YV9hY3RpdmU6IGtlZXAgdHJhY2sgb2YgYWN0aXZl
IHdvcmthcm91bmRzICovCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9taWdy
YXRlLmMKPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9taWdyYXRlLmMKPiBpbmRleCA2MmYyNzg2
OGY1NmIuLjlmMDJlMjM4ZTdjNiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVf
bWlncmF0ZS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX21pZ3JhdGUuYwo+IEBAIC00
NDcsNyArNDQ3LDcgQEAgdm9pZCB4ZV9taWdyYXRlX3VsbHNfZW50ZXIoc3RydWN0IHhlX21pZ3Jh
dGUgKm0pCj4gwqAKPiDCoMKgwqDCoMKgwqDCoMKgeGVfYXNzZXJ0KHhlLCB4ZS0+aW5mby5oYXNf
dXNtKTsKPiDCoAo+IC3CoMKgwqDCoMKgwqDCoGlmICghSVNfREdGWCh4ZSkgfHwgSVNfU1JJT1Zf
VkYoeGUpKQo+ICvCoMKgwqDCoMKgwqDCoGlmICghSVNfREdGWCh4ZSkgfHwgSVNfU1JJT1ZfVkYo
eGUpIHx8ICF4ZS0+aW5mby51bGxzX2VuYWJsZSkKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoHJldHVybjsKPiDCoAo+IMKgam9iX2FsbG9jOgo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0veGUveGVfbW9kdWxlLmMKPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9tb2R1bGUu
Ywo+IGluZGV4IDRjYjU3ODE4MjkxMi4uYmI0ZmI5NjdhZWM5IDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS94ZS94ZV9tb2R1bGUuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9t
b2R1bGUuYwo+IEBAIC0yMiw2ICsyMiw3IEBACj4gwqAKPiDCoHN0cnVjdCB4ZV9tb2RwYXJhbSB4
ZV9tb2RwYXJhbSA9IHsKPiDCoMKgwqDCoMKgwqDCoMKgLnByb2JlX2Rpc3BsYXkgPcKgwqDCoMKg
wqDCoMKgwqBYRV9ERUZBVUxUX1BST0JFX0RJU1BMQVksCj4gK8KgwqDCoMKgwqDCoMKgLnVsbHNf
ZW5hYmxlID3CoMKgwqDCoMKgwqDCoMKgwqDCoFhFX0RFRkFVTFRfVUxMU19FTkFCTEUsCj4gwqDC
oMKgwqDCoMKgwqDCoC5ndWNfbG9nX2xldmVsID3CoMKgwqDCoMKgwqDCoMKgWEVfREVGQVVMVF9H
VUNfTE9HX0xFVkVMLAo+IMKgwqDCoMKgwqDCoMKgwqAuZm9yY2VfcHJvYmUgPcKgwqDCoMKgwqDC
oMKgwqDCoMKgWEVfREVGQVVMVF9GT1JDRV9QUk9CRSwKPiDCoCNpZmRlZiBDT05GSUdfUENJX0lP
Vgo+IEBAIC00NSw2ICs0Niw5IEBAIE1PRFVMRV9QQVJNX0RFU0MocHJvYmVfZGlzcGxheSwgIlBy
b2JlIGRpc3BsYXkgSFcsCj4gb3RoZXJ3aXNlIGl0J3MgbGVmdCB1bnRvdWNoZWQKPiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAiW2RlZmF1bHQ9IiBfX3N0cmluZ2lmeShYRV9ERUZB
VUxUX1BST0JFX0RJU1BMQVkpCj4gIl0pIik7Cj4gwqAjZW5kaWYKPiDCoAo+ICttb2R1bGVfcGFy
YW1fbmFtZWQodWxsc19lbmFibGUsIHhlX21vZHBhcmFtLnVsbHNfZW5hYmxlLCBib29sLAo+IDA0
NDQpOwo+ICtNT0RVTEVfUEFSTV9ERVNDKHVsbHNfZW5hYmxlLCAiRW5hYmxlIFVMTFMgb24gbWln
cmF0aW9uIHF1ZXVlIGlmIExSCj4gVk0gb3BlbiAoZGVmYXVsdDogdHJ1ZSkiKTsKPiArCj4gwqBt
b2R1bGVfcGFyYW1fbmFtZWQodnJhbV9iYXJfc2l6ZSwgeGVfbW9kcGFyYW0uZm9yY2VfdnJhbV9i
YXJfc2l6ZSwKPiBpbnQsIDA2MDApOwo+IMKgTU9EVUxFX1BBUk1fREVTQyh2cmFtX2Jhcl9zaXpl
LCAiU2V0IHRoZSB2cmFtIGJhciBzaXplIGluIE1pQgo+ICg8MD1kaXNhYmxlLXJlc2l6ZSwgMD1t
YXgtbmVlZGVkLXNpemUsID4wPWZvcmNlLXNpemUgIgo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgICJbZGVmYXVsdD0iIF9fc3RyaW5naWZ5KFhFX0RFRkFVTFRfVlJBTV9CQVJfU0la
RSkKPiAiXSkiKTsKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX21vZHVsZS5o
Cj4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfbW9kdWxlLmgKPiBpbmRleCA3OWNiOTYzOWMwZjMu
LmYwMjIwYjY5NGM0MCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfbW9kdWxl
LmgKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfbW9kdWxlLmgKPiBAQCAtMTIsNiArMTIs
NyBAQAo+IMKgc3RydWN0IHhlX21vZHBhcmFtIHsKPiDCoMKgwqDCoMKgwqDCoMKgYm9vbCBmb3Jj
ZV9leGVjbGlzdDsKPiDCoMKgwqDCoMKgwqDCoMKgYm9vbCBwcm9iZV9kaXNwbGF5Owo+ICvCoMKg
wqDCoMKgwqDCoGJvb2wgdWxsc19lbmFibGU7Cj4gwqDCoMKgwqDCoMKgwqDCoGludCBmb3JjZV92
cmFtX2Jhcl9zaXplOwo+IMKgwqDCoMKgwqDCoMKgwqBpbnQgZ3VjX2xvZ19sZXZlbDsKPiDCoMKg
wqDCoMKgwqDCoMKgY2hhciAqZ3VjX2Zpcm13YXJlX3BhdGg7Cgo=
