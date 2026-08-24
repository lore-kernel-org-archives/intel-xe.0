Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8298EC5DF9C
	for <intel-xe@archiver.kernel.org>; Mon, 24 Aug 2026 20:18:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DFDE10E198;
	Mon, 24 Aug 2026 20:18:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q2YDEHHE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AD1310E02D
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Aug 2026 20:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787602691; x=1819138691;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=QeQma68acuJ9ozMUpnz/+sZJJ29ofPXnBeR2S/QAGtg=;
 b=Q2YDEHHEc2s+Vzl98GLf20FPT9lZuQeF96Q2cTPo90NWaspVeNa4DeHh
 zwTSmCQ+7EPHJE9fuWdAuAq8A+S5h7LxmcL39vYckYTEy6a4TOo1btkzN
 jbAlSUHDerWjT7aPMSTSqTv6JvbqvNokPu2tSr/7D+fg/hVe3JgZBfXLE
 9w4tbtYC8+KGa9Yc1OqaMA09CcjUFvF3URDr2we7PrNHhRA/Vp1oesgD/
 qutMxPtPPzRdNHuPCKauizezZ/aewBVlX8lZaiuTbzRoqPYglgQGoHAV8
 ltRa5jZVZ2pwKk0iXu17JxPuz+E5EprCq3CCTKjSfXkqgBBNxlKwayrYV g==;
X-CSE-ConnectionGUID: z4d0oB2gRLiICicTUT6Kbg==
X-CSE-MsgGUID: wQPQqkxySu6RuGgPwb2iGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="113602709"
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; d="scan'208";a="113602709"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 13:18:11 -0700
X-CSE-ConnectionGUID: N58nlHUtTCWhumamTeG6RQ==
X-CSE-MsgGUID: A7q4N9FMRQ630m6jewW/lQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; d="scan'208";a="269040868"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 13:18:10 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 24 Aug 2026 13:18:10 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 24 Aug 2026 13:18:10 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.41) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 24 Aug 2026 13:18:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ap0O7qETBur6GRttjNKditSkB4P2BNwMmxYHSLSYBhCiBAycp4LB7RRSXhyW/wm/xBU85r1vef5linxhY2i5wbg7yuu3fQbTtOpEk6jzR55hQymsSXAUxKKyYjKLGMbKJlvTGBziMtCd5BgKYkT1qqKd0nv/Pu9ZweKNL9XSDrpdfNenJwcW/tTJTuqEsMFGqZCvgap6146r/nC1P5kVawFF83hDEZlFYJZ5IhExWAcYbXV45ySstr/3ePyyGj4a0pgGtvsWUKI6Z2rgYJ65wh3L0fJYDgt7En/tDYzfUE5kSLR+TI4BqiPen91WyAF5c+naa+6rr1DEGGa/KR4Xtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QeQma68acuJ9ozMUpnz/+sZJJ29ofPXnBeR2S/QAGtg=;
 b=Wr39X9PbFgtiL0bAz2KfQV98oxkxNCm6ANGqz4EvbnEwfdmOo86lYHiTExInG8snoihaGC3Zoz4H++ZoEIWgCqOyVomuqLUiVlELQQR2WaDKXQt9cU0/oFKa8a/Ly7G3WFWfEudKAX5xUdvCgN77dZ3mZQuPjdeofXU0kduwV0Z+ZPzwDH0Dmy6xM2lvpu4yVjwNa2P2wl6HDFeB30M5/suWbKMBO297V8MIB3fAD7VRcQO4KRpyNIBeuKL0t0XcZVtE8MrhitmBvaQES7arTDw1W2uBE3QI1qEry1ctdKad4wr7uQNmwIPJi17Bs03vdca7tXcTdodcnxrEGQQoCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6320.namprd11.prod.outlook.com (2603:10b6:930:3c::9)
 by DSWPR11MB9761.namprd11.prod.outlook.com (2603:10b6:8:356::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 20:18:07 +0000
Received: from CY5PR11MB6320.namprd11.prod.outlook.com
 ([fe80::9cd7:94d5:90f:4d76]) by CY5PR11MB6320.namprd11.prod.outlook.com
 ([fe80::9cd7:94d5:90f:4d76%3]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 20:18:06 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>, "Wajdeczko, Michal"
 <michal.wajdeczko@intel.com>, "jani.nikula@linux.intel.com"
 <jani.nikula@linux.intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi, 
 Rodrigo" <rodrigo.vivi@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, "Nerlige Ramappa, Umesh"
 <umesh.nerlige.ramappa@intel.com>, "Ceraolo Spurio, Daniele"
 <daniele.ceraolospurio@intel.com>, "Lin, Shuicheng" <shuicheng.lin@intel.com>
Subject: Re: [PATCH 04/10] drm/xe: Add a new debug focused configfs group
Thread-Topic: [PATCH 04/10] drm/xe: Add a new debug focused configfs group
Thread-Index: AQHdMOfXWVyKvDOmlUWOtx6rnO7gVrapEX6AgAMXqYCAAYBfAA==
Date: Mon, 24 Aug 2026 20:18:06 +0000
Message-ID: <9522d5c81f1616d1362be71eca0b29443cd2f9f0.camel@intel.com>
References: <20260820210639.107524-12-stuart.summers@intel.com>
 <20260820210639.107524-16-stuart.summers@intel.com>
 <20260821220853.GG681121@mdroper-desk1.amr.corp.intel.com>
 <face4f61-b67c-4dca-ae02-a32cef75dbc9@intel.com>
In-Reply-To: <face4f61-b67c-4dca-ae02-a32cef75dbc9@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6320:EE_|DSWPR11MB9761:EE_
x-ms-office365-filtering-correlation-id: 2336220e-87c7-456f-c613-08df021ccecf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|10067099003|56012099006|6133799003|3023799007|22082099003|18002099003|4143699003|11063799006|38070700021;
x-microsoft-antispam-message-info: Z8GKeFSX3KYzZfmIrO9VjGAil2m8Oq1JtNEBgQEFbmnI3eD1ZEhNgFsj8TR9N0qnz+IPoXgMyRfCjylAQAPrFPU18m3avpgl9oRWkVUec6eXkQmih0aAQ1JEA9gBLYOuvoVnXFkfDK/kYefRS/1pDFvKJ3IqbSPSKtDYGJFgKaX2Hkq1h/RrDolcLNidb6+X3ksi084dqHDqsyVjynKOhL5iS9ZGWa1QRW2SGsbZLgdmmvg+GmJYvyJ26LasvxmikA7JuIw8wLWF8BlnOqp/QetAOqIjLYU91iVqiz5SxU3froVzrqiL9xN9P7FIPguZh7ndOue+VLIptss2DrERCO//u2oAXzqFinaD9c0xPI1ziwoYUV83HiEnjvdqXgDi+mhX2s9tc3nBf2XDmxsgON6oOZEyDOjOyv/gOC/VWrsl3goJKF2mgnc2VT8gAMnfvPEgDpf1VKg1GFjgS2oTvoGiX2jth/kNNVXAK9q8SLGAMMUaabNuI+3uEVe+S6D+/E/ucArsXnXbYO7ftD4SI7EnUWRf+08bjI4mPomsBMmBwPlMtVdz1aBDZg9SygpoBCiJ/S95f/sr/7KHrULea2qKUXDO4qrfXj9W0WJ1/XbAo6WElR+y2Gqu68wGWp/n9fFZ4bajmmP6qK6Yt62PDC4v3e7Na8s0/lvHV649X0w=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6320.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(10067099003)(56012099006)(6133799003)(3023799007)(22082099003)(18002099003)(4143699003)(11063799006)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S1RTTjNmcnJGYVlwNVU1ZTZUbXRsUDRxNGRIR2hzcWFjQjhiajB1aVB6cmNB?=
 =?utf-8?B?YzNQL3VqeWdEN1VrR2YrV2Q3TVJ4NGg2Y1RNSkIzMnR2ZEJYSEFzRjdrNm1H?=
 =?utf-8?B?NmI3WnlNV09SUGdvQTd3a1J4L25mQWs0VlpDZEx5QkJYVlpaL3EramswZ21o?=
 =?utf-8?B?MFdtRXJVUmI5K3FDK0Fnc1FVVzh0N1FCdHdYYURHa2szcXMxYU1yQXBab09P?=
 =?utf-8?B?Z2ZwMEE3YUJNRUhoRjlIUU9DcnpaTXZYclY3NURVS09nVUhzbXA3bnRPR3V2?=
 =?utf-8?B?dE5lTjN6ZUE0cSs5ZTlnN3k2V1VaUHo3MUtHbnNIVWVDVGd3dVQxQmxCVHF5?=
 =?utf-8?B?cFFNWG5scG12VTd6UmxDY2s3NjZmbExDN2hzVDJvTk5TU0ZsVG1rZTZCV09v?=
 =?utf-8?B?Q3BDZCtEUHU0VkhwVVZ5N1lqcDlNVGY3djJRSVFTMzVESUNveHgyUitFb1hP?=
 =?utf-8?B?SXY0S21lN0FSWG5yRkkrdmswSUlxcWgzTnhWenhLTExxdGV4Rzl5SFNuWmli?=
 =?utf-8?B?Wko1WWpqMmRQMzIxdlh2VTh1dW5SK3pvNE9TUkNpZnFuY2Z4Q1RnL3dqWnZs?=
 =?utf-8?B?ZXVXLy9QcXMwczJiS2FOemw0eUlrQjJWaHAyRHZqN245SFpnWDZoUHFEVjMy?=
 =?utf-8?B?TXhhSHpFakFzblRsbFhad3BkUUhPK0JHRXNBem93ajlycTRRVWk5TlE1R2M1?=
 =?utf-8?B?TnR6ei9yeE9IdlFWMkllbGZSSTErekw3TDlZdWc1MEFwSVdST2dXdDhaY21p?=
 =?utf-8?B?MVBNNmYrNGIzVElTb0tQWTBlc2NPaHMxY0lEUFhFMXdDaC9QdlVqYXk1OFRO?=
 =?utf-8?B?VDBvODhIM29VUkVwNXdMcTF5aUhiYWd0aUEvMkNYZUY1UUNZTG9tSXZLaEh3?=
 =?utf-8?B?dEpFMUNtTzdSSzBHZVZtOGVUWTB1WmlwYnNxbmZjaWVpNFBYemxLVlJ4R2xL?=
 =?utf-8?B?VVJkMXliQnVXQzNzQ2dyUEEzYU1tVmpWaHFTS1Y1Z0I1aWVsajU3QTByVTBF?=
 =?utf-8?B?NitwTnFnWTNRazZMUUFDdkMwOXMxeUZ1RE9WRHg1QVo3bDVuamt3R0t2RFZu?=
 =?utf-8?B?Qis1SmkxZkY2TWY3eEpyR3BTK01QUXZlLzJ1VE1yNEp2bERvTHhNNkthRHl2?=
 =?utf-8?B?dFFCOHJZaG9jOEtVKzV2SjNCWloyMXpLTkpZZi9aVnlWeTBwekw5RWVlVCtF?=
 =?utf-8?B?Ujd3NEVoSXJJNE5adDE1QzNFeEMyZ0FKWU4wanJhZ3JZaVhtdXV0S29XZlRS?=
 =?utf-8?B?NWViZkRMOVcrejdteWR1cklaUHorYXhMWHRxV2VZTXVIc25TUTNVeGRIcEpH?=
 =?utf-8?B?WWl3VThpUlhmbkxmeFJtUEsxRDNMQVgzdU9LbkdnL3RKY2tObFp4cDBJYXpu?=
 =?utf-8?B?Ylk5NHNsZlRzNVhUY0xueWVBRjdyK2pMYStGMnllbFpFdEhoVXY1b3V4RWwx?=
 =?utf-8?B?UnZPay9hc0p5dXZkNVJCY2VKT2FWY21HOTZ1aHdNNUY3d3NOdDJIUzI4ZTlF?=
 =?utf-8?B?T3Y0WFllbW5vTUNwZmQ5TmRYNit5ZEZuZFBKNURCNWRGZi9ySVNaS1FPcUky?=
 =?utf-8?B?ZkZua3d1dWw2YTJCMk1lcGNyYVBrTmx1YXZCUXNrNTBGREhacVVTYkFlOVFJ?=
 =?utf-8?B?VnNLZFoxS0JzSVNMS3A2ekhnbHVWM2pkSWVXdUIxeW55SUkzZVZqRWpmU0M4?=
 =?utf-8?B?NGVqbmRGeEx1d1NaK3hPRmZvZXcxVHJoY2FhR0dOR1pNYlg2YmpXV0FTVVI2?=
 =?utf-8?B?V1BLRDJSYkVTV2hzdEhjTTV6Tk9hcTVZL0QrL2FPR29kMnVYYzUwMGZNRHR5?=
 =?utf-8?B?cUxpR0ZYRzRvNDVSazJXYS9jUHVxN25nY3k0aGc1Rk9lSndFbTJKVDJrc2dk?=
 =?utf-8?B?WlFRSmcrdStZczRrME9nQXJLOTZVSEN3VHRzQmo4V3d6allaUms4MHNyVmV6?=
 =?utf-8?B?ZElzTUdMQk16M2lKMFN1RXdyZXhZSnRBanJJUS9OWG9MT2J2OTdIOXgvZC9h?=
 =?utf-8?B?NnhuaUF3aXoyQWhXQ0puSVZDaTdlVUR4c3BQUFBVSUdIT2Qxdm1xeEpDdXcx?=
 =?utf-8?B?d0Y5TXV2L1FkbjEwYVF1citFVDZMbWxkQkhoZ1c4YlBldlBQS2FBbDl2emJl?=
 =?utf-8?B?UzBNZE5peEJtTCtWcC9EanpER3EyY2VaVlBEQ28xRUQ1eStTZ2R5dUNKTzZz?=
 =?utf-8?B?WnZVdkdhSXJDMjlBRXRla3NsdC9aOE5YL2o0WjJoS3N1dExrUlJWN1U2Yk5r?=
 =?utf-8?B?djU3VWM5ZUNwNklqSXRTaWQvbGsyenBralhJdVdYTnVhQ21GMllOS0ZQemNZ?=
 =?utf-8?B?WjA0d3ZVa1k1aUFNWWs1aFJnaWZxWXpmOVJSTUtFaVJTUmxLZHA1Q0lQMmY1?=
 =?utf-8?Q?k/6+CXEGX7FGatws=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <54BE7177899A744F93181776789C105E@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: LCVs7TT5v1OI0Fjvdfniqd2hYxwxsW1taAr4Sei9zhsA4rlHDhb+p80BIVuULCXThjDNo21JtL/raJbPcgsut9Qe8SnZf03bPyXuB/lKcMUlCobamXCIGgYp/hMm8pvY4pW7J5L6ht3gB2SNHwaKKrXa4su1z61osghx6v4BZtZ33KZR2Rf68sVUE53JpMyuB2nkI7LObYUtlDNhbiCoHtv9toJnlLii33ruCb2az65l4Zl800qjU7TLLiTW8+dtty0GZbHFnjkI0VwpZnnppEDrlIFnxU3pXlSV5nzoeYkFo1X0K8BeubrGS7GieKHIoKlLABJdQ03B5Zz09ZhjXg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6320.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2336220e-87c7-456f-c613-08df021ccecf
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2026 20:18:06.1534 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rikAPUG4nVd2xRrYmw9XRvk5d9Th/vMgccbf+wsL/jSMJSfwb+97kIP+cTN7au0i6q6fNh+5S+wfhikwD1WMoQYwEF7ueYoTOExQCNZ7jKE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSWPR11MB9761
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

T24gU3VuLCAyMDI2LTA4LTIzIGF0IDIzOjIyICswMjAwLCBNaWNoYWwgV2FqZGVjemtvIHdyb3Rl
Og0KPiANCj4gDQo+IE9uIDgvMjIvMjAyNiAxMjowOCBBTSwgTWF0dCBSb3BlciB3cm90ZToNCj4g
PiBPbiBUaHUsIEF1ZyAyMCwgMjAyNiBhdCAwOTowNjo0M1BNICswMDAwLCBTdHVhcnQgU3VtbWVy
cyB3cm90ZToNCj4gPiA+IEFkZCB0aGUgc2tlbGV0b24gY29kZSBmb3IgYSBuZXcgZGVidWcgc3Bl
Y2lmaWMgY29uZmlnZnMgZ3JvdXAuDQo+ID4gPiBKdXN0IGFkZCB0aGUgc3RydWN0dXJlIGZvciBu
b3cuIEFjdHVhbCBkZWJ1ZyBjb250ZW50IHdpbGwgYmUNCj4gPiA+IGFkZGVkIGluIGEgc3Vic2Vx
dWVudCBwYXRjaC4NCj4gPiA+IA0KPiA+ID4gU2lnbmVkLW9mZi1ieTogU3R1YXJ0IFN1bW1lcnMg
PHN0dWFydC5zdW1tZXJzQGludGVsLmNvbT4NCj4gPiA+IEFzc2lzdGVkLWJ5OiBDb3BpbG90OmNs
YXVkZS1zb25uZXQtNC42LGNsYXVkZS1vcHVzLTQuNw0KPiA+ID4gUmV2aWV3ZWQtYnk6IFJvZHJp
Z28gVml2aSA8cm9kcmlnby52aXZpQGludGVsLmNvbT4NCj4gPiA+IC0tLQ0KPiA+ID4gwqBkcml2
ZXJzL2dwdS9kcm0veGUvTWFrZWZpbGXCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAyICsrDQo+
ID4gPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9jb25maWdmcy5jwqDCoMKgwqDCoMKgIHzCoCA1
ICsrKysrDQo+ID4gPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9jb25maWdmc19kZWJ1Zy5jIHwg
MTQgKysrKysrKysrKysrKysNCj4gPiA+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2NvbmZpZ2Zz
X2RlYnVnLmggfCAxMyArKysrKysrKysrKysrDQo+ID4gPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94
ZV9jb25maWdmc190eXBlcy5oIHzCoCAzICsrKw0KPiA+ID4gwqA1IGZpbGVzIGNoYW5nZWQsIDM3
IGluc2VydGlvbnMoKykNCj4gPiA+IMKgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9jb25maWdmc19kZWJ1Zy5jDQo+ID4gPiDCoGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2
ZXJzL2dwdS9kcm0veGUveGVfY29uZmlnZnNfZGVidWcuaA0KPiA+ID4gDQo+ID4gPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL01ha2VmaWxlDQo+ID4gPiBiL2RyaXZlcnMvZ3B1L2Ry
bS94ZS9NYWtlZmlsZQ0KPiA+ID4gaW5kZXggOTIxMzQ3MDlkOTk4Li4wYjcxZjMxMWM5YzQgMTAw
NjQ0DQo+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUvTWFrZWZpbGUNCj4gPiA+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS94ZS9NYWtlZmlsZQ0KPiA+ID4gQEAgLTE2Myw2ICsxNjMsOCBAQCB4
ZS0kKENPTkZJR19IV01PTikgKz0geGVfaHdtb24ubw0KPiA+ID4gwqANCj4gPiA+IMKgeGUtJChD
T05GSUdfUEVSRl9FVkVOVFMpICs9IHhlX3BtdS5vDQo+ID4gPiDCoHhlLSQoQ09ORklHX0NPTkZJ
R0ZTX0ZTKSArPSB4ZV9jb25maWdmcy5vDQo+ID4gDQo+ID4gTm90IHJlYWxseSBhbiBpc3N1ZSB3
aXRoIHlvdXIgcGF0Y2ggaGVyZSwgYnV0IHNpbmNlIHdlJ3JlIG1lc3NpbmcNCj4gPiB3aXRoDQo+
ID4ga2NvbmZpZyBzdHVmZiBpdCByZW1pbmRzIG1lIC0tLSBJJ20gbm90IHN1cmUgb3VyIHByZS1l
eGlzdGluZw0KPiA+IGNvbmZpZ2ZzDQo+ID4ga2NvbmZpZyBoYW5kbGluZyBpcyBlbnRpcmVseSBj
b3JyZWN0IChhbmQgSSB0aGluayBJJ3ZlIHNlZW4ga2VybmVsDQo+ID4gdGVzdA0KPiA+IHJvYm90
IHdhcm5pbmdzIGFib3V0IHRoYXQgdG9vKS7CoCBUaGUgY29uY2VybiBpcyB0aGF0IG91ciBoZWFk
ZXINCj4gPiBmaWxlDQo+ID4gZG9lcyBhIHR5cGljYWwgSVNfRU5BQkxFRChDT05GSUdfQ09ORklH
RlMpIHR5cGUgb2YgY2hlY2sgdG8gZGVjaWRlDQo+ID4gYmV0d2VlbiBleHRlcm4gZnVuY3Rpb24g
ZGVjbGFyYXRpb25zIG9yIG5vb3Agc3R1YnMuwqAgQnV0IGlmIFhlIGlzDQo+ID4gYnVpbHQNCj4g
PiBpbnRvIHRoZSBiekltYWdlLCBidXQgY29uZmlnZnMgaXMgY29uZmlndXJlZCBhcyBhIC5rbywg
dGhlbiBYZQ0KPiA+IGNhbid0DQo+ID4gcmVhY2ggdGhlIGNvbmZpZ2ZzIGZ1bmN0aW9ucy7CoCBJ
IGJlbGlldmUgdGhlcmUncyBhbiBJU19SRUFDSEFCTEUoKQ0KPiA+IHRoYXQNCj4gPiBtYXliZSB3
ZSBzaG91bGQgYmUgdXNpbmcgaW5zdGVhZCwgYWx0aG91Z2ggSSBoYXZlbid0IGdvdCBhcm91bmQg
dG8NCj4gPiBhY3R1YWxseSBsb29raW5nIGNsb3NlciBhbmQgdHJ5aW5nIGl0IG91dCBteXNlbGYu
DQo+IA0KPiBJIHdhcyBhbHJlYWR5IHRyeWluZyB0byB1c2UgSVNfUkVBQ0hBQkxFIFsxXSBidXQg
SmFuaSBpcyBhZ2FpbnN0IGl0DQo+IFsyXQ0KPiANCj4gWzFdDQo+IGh0dHBzOi8vcGF0Y2h3b3Jr
LmZyZWVkZXNrdG9wLm9yZy9wYXRjaC82OTYxMDMvP3Nlcmllcz0xNTkzOTUmcmV2PTENCj4gWzJd
DQo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2ludGVsLXhlL2UyMmE1MzVhNjQwNTQxMmFhZWIw
ZjIyNTE3MzM4NDBiNzJjOTNiNTZAaW50ZWwuY29tLw0KDQpNYXliZSB3ZSBqdXN0IGFkZCBDT05G
SUdfQ09ORklHRlMgYXMgYSByZXF1aXJlbWVudCBvZiBDT05GSUdfRFJNX1hFPw0KDQpCdXQgYWxz
byBJJ2QgcmF0aGVyIGhhdmUgdGhpcyBkaXNjdXNzaW9uIHNlcGFyYXRlIGZyb20gdGhlIHBhdGNo
IHNlcmllcw0KaGVyZSBpZiBwb3NzaWJsZS4gSSBkaWRuJ3Qgd2FudCB0byBjaGFuZ2UgYW55dGhp
bmcgZnVuZGFtZW50YWwgaGVyZQ0Kb3RoZXIgdGhhbiBhZGRpbmcgdGhlIGRlYnVnLW9ubHkgcGll
Y2VzLg0KDQpMZXQgbWUga25vdyB3aGF0IHlvdSB0aGluayBoZXJlLg0KDQpUaGFua3MsDQpTdHVh
cnQNCg0KPiANCj4gPiANCj4gPiBZb3VyIGFjdHVhbCBjaGFuZ2VzIGluIHRoaXMgcGF0Y2ggbG9v
ayBva2F5IHRvIG1lLg0KPiA+IA0KPiA+IFJldmlld2VkLWJ5OiBNYXR0IFJvcGVyIDxtYXR0aGV3
LmQucm9wZXJAaW50ZWwuY29tPg0KPiA+IA0KPiA+IA0KPiA+IE1hdHQNCj4gPiANCj4gPiA+ICt4
ZV9kZWJ1Z19jb25maWdmc19vYmotJChDT05GSUdfRFJNX1hFX0RFQlVHKSA6PQ0KPiA+ID4geGVf
Y29uZmlnZnNfZGVidWcubw0KPiA+ID4gK3hlLSQoQ09ORklHX0NPTkZJR0ZTX0ZTKSArPSAkKHhl
X2RlYnVnX2NvbmZpZ2ZzX29iai15KQ0KPiA+ID4gwqANCj4gPiA+IMKgIyBncmFwaGljcyB2aXJ0
dWFsaXphdGlvbiAoU1ItSU9WKSBzdXBwb3J0DQo+ID4gPiDCoHhlLXkgKz0gXA0KPiA+ID4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9jb25maWdmcy5jDQo+ID4gPiBiL2RyaXZl
cnMvZ3B1L2RybS94ZS94ZV9jb25maWdmcy5jDQo+ID4gPiBpbmRleCAwMjljOWY2ODJjOGUuLjMz
YWVhMTE1MGM4NiAxMDA2NDQNCj4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9jb25m
aWdmcy5jDQo+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfY29uZmlnZnMuYw0KPiA+
ID4gQEAgLTE0LDYgKzE0LDcgQEANCj4gPiA+IMKgDQo+ID4gPiDCoCNpbmNsdWRlICJpbnN0cnVj
dGlvbnMveGVfbWlfY29tbWFuZHMuaCINCj4gPiA+IMKgI2luY2x1ZGUgInhlX2NvbmZpZ2ZzLmgi
DQo+ID4gPiArI2luY2x1ZGUgInhlX2NvbmZpZ2ZzX2RlYnVnLmgiDQo+ID4gPiDCoCNpbmNsdWRl
ICJ4ZV9kZWZhdWx0cy5oIg0KPiA+ID4gwqAjaW5jbHVkZSAieGVfZ3RfdHlwZXMuaCINCj4gPiA+
IMKgI2luY2x1ZGUgInhlX21vZHVsZS5oIg0KPiA+ID4gQEAgLTEyNDIsNiArMTI0MywxMCBAQCBz
dGF0aWMgc3RydWN0IGNvbmZpZ19ncm91cA0KPiA+ID4gKnhlX2NvbmZpZ19tYWtlX2RldmljZV9n
cm91cChzdHJ1Y3QgY29uZmlnX2dyb3VwICpncm8NCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgY29uZmlnX2dyb3VwX2luaXRfdHlwZV9uYW1lKCZkZXYtPnNyaW92LCAic3Jp
b3YiLA0KPiA+ID4gJnhlX2NvbmZpZ19zcmlvdl90eXBlKTsNCj4gPiA+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgY29uZmlnZnNfYWRkX2RlZmF1bHRfZ3JvdXAoJmRldi0+c3Jpb3Ys
ICZkZXYtDQo+ID4gPiA+Z3JvdXApOw0KPiA+ID4gwqDCoMKgwqDCoMKgwqDCoH0NCj4gPiA+ICsj
aWYgSVNfRU5BQkxFRChDT05GSUdfRFJNX1hFX0RFQlVHKQ0KPiA+ID4gK8KgwqDCoMKgwqDCoMKg
Y29uZmlnX2dyb3VwX2luaXRfdHlwZV9uYW1lKCZkZXYtPmRlYnVnLCAiZGVidWciLA0KPiA+ID4g
JnhlX2NvbmZpZ2ZzX2RlYnVnX3R5cGUpOw0KPiA+ID4gK8KgwqDCoMKgwqDCoMKgY29uZmlnZnNf
YWRkX2RlZmF1bHRfZ3JvdXAoJmRldi0+ZGVidWcsICZkZXYtPmdyb3VwKTsNCj4gPiA+ICsjZW5k
aWYNCj4gPiA+IMKgDQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgbXV0ZXhfaW5pdCgmZGV2LT5sb2Nr
KTsNCj4gPiA+IMKgDQo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2Nv
bmZpZ2ZzX2RlYnVnLmMNCj4gPiA+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2NvbmZpZ2ZzX2Rl
YnVnLmMNCj4gPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+ID4gPiBpbmRleCAwMDAwMDAwMDAw
MDAuLjQ1NjE3MjgyY2VjNQ0KPiA+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ID4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX2NvbmZpZ2ZzX2RlYnVnLmMNCj4gPiA+IEBAIC0wLDAgKzEsMTQgQEAN
Cj4gPiA+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogTUlUDQo+ID4gPiArLyoNCj4gPiA+
ICsgKiBDb3B5cmlnaHQgwqkgMjAyNiBJbnRlbCBDb3Jwb3JhdGlvbg0KPiA+ID4gKyAqLw0KPiA+
ID4gKw0KPiA+ID4gKyNpbmNsdWRlIDxsaW51eC9jb25maWdmcy5oPg0KPiA+ID4gKyNpbmNsdWRl
IDxsaW51eC9tb2R1bGUuaD4NCj4gPiA+ICsNCj4gPiA+ICsjaW5jbHVkZSAieGVfY29uZmlnZnNf
ZGVidWcuaCINCj4gPiA+ICsjaW5jbHVkZSAieGVfY29uZmlnZnNfdHlwZXMuaCINCj4gPiA+ICsN
Cj4gPiA+ICtjb25zdCBzdHJ1Y3QgY29uZmlnX2l0ZW1fdHlwZSB4ZV9jb25maWdmc19kZWJ1Z190
eXBlID0gew0KPiA+ID4gK8KgwqDCoMKgwqDCoMKgLmN0X293bmVywqDCoMKgwqDCoMKgwqA9IFRI
SVNfTU9EVUxFLA0KPiA+ID4gK307DQo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L3hlL3hlX2NvbmZpZ2ZzX2RlYnVnLmgNCj4gPiA+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2Nv
bmZpZ2ZzX2RlYnVnLmgNCj4gPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+ID4gPiBpbmRleCAw
MDAwMDAwMDAwMDAuLjVmOTM4NDUwYWVkMg0KPiA+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ID4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2NvbmZpZ2ZzX2RlYnVnLmgNCj4gPiA+IEBAIC0wLDAg
KzEsMTMgQEANCj4gPiA+ICsvKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogTUlUICovDQo+ID4g
PiArLyoNCj4gPiA+ICsgKiBDb3B5cmlnaHQgwqkgMjAyNiBJbnRlbCBDb3Jwb3JhdGlvbg0KPiA+
ID4gKyAqLw0KPiA+ID4gKyNpZm5kZWYgX1hFX0NPTkZJR0ZTX0RFQlVHX0hfDQo+ID4gPiArI2Rl
ZmluZSBfWEVfQ09ORklHRlNfREVCVUdfSF8NCj4gPiA+ICsNCj4gPiA+ICsjaWYgSVNfRU5BQkxF
RChDT05GSUdfRFJNX1hFX0RFQlVHKSAmJg0KPiA+ID4gSVNfRU5BQkxFRChDT05GSUdfQ09ORklH
RlNfRlMpDQo+ID4gPiArc3RydWN0IGNvbmZpZ19pdGVtX3R5cGU7DQo+ID4gPiArZXh0ZXJuIGNv
bnN0IHN0cnVjdCBjb25maWdfaXRlbV90eXBlIHhlX2NvbmZpZ2ZzX2RlYnVnX3R5cGU7DQo+ID4g
PiArI2VuZGlmDQo+ID4gPiArDQo+ID4gPiArI2VuZGlmIC8qIF9YRV9DT05GSUdGU19ERUJVR19I
XyAqLw0KPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9jb25maWdmc190
eXBlcy5oDQo+ID4gPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9jb25maWdmc190eXBlcy5oDQo+
ID4gPiBpbmRleCAzYmU3ZDYxNjBiNGMuLmUyMmI5NDI0ZjcxOSAxMDA2NDQNCj4gPiA+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9jb25maWdmc190eXBlcy5oDQo+ID4gPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0veGUveGVfY29uZmlnZnNfdHlwZXMuaA0KPiA+ID4gQEAgLTIyLDYgKzIyLDkg
QEAgc3RydWN0IHdhX2JiIHsNCj4gPiA+IMKgc3RydWN0IHhlX2NvbmZpZ19ncm91cF9kZXZpY2Ug
ew0KPiA+ID4gwqDCoMKgwqDCoMKgwqDCoHN0cnVjdCBjb25maWdfZ3JvdXAgZ3JvdXA7DQo+ID4g
PiDCoMKgwqDCoMKgwqDCoMKgc3RydWN0IGNvbmZpZ19ncm91cCBzcmlvdjsNCj4gPiA+ICsjaWYg
SVNfRU5BQkxFRChDT05GSUdfRFJNX1hFX0RFQlVHKQ0KPiA+ID4gK8KgwqDCoMKgwqDCoMKgc3Ry
dWN0IGNvbmZpZ19ncm91cCBkZWJ1ZzsNCj4gPiA+ICsjZW5kaWYNCj4gPiA+IMKgDQo+ID4gPiDC
oMKgwqDCoMKgwqDCoMKgLyoNCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqAgKiBGaWVsZHMgc29ydGVk
IGJ5IHR5cGUgKGxhcmdlc3QgZmlyc3QpIHRoZW4gbmFtZToNCj4gPiA+IHN0cnVjdCBhcnJheXMs
DQo+ID4gPiAtLSANCj4gPiA+IDIuNDMuMA0KPiA+ID4gDQo+ID4gDQo+IA0KDQo=
