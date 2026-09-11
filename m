Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64B1CC88E4D
	for <intel-xe@archiver.kernel.org>; Fri, 11 Sep 2026 17:44:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF5CB10E16A;
	Fri, 11 Sep 2026 17:44:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bFV8m1Vs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C41510E16A
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Sep 2026 17:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789148649; x=1820684649;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=K+/jC3ezYCn63Pz2W8/QVGTg7E6Bk4pG4DvI3CcZhUw=;
 b=bFV8m1VsC7mqZTsknggUN6bRbdhLPoMdaOIiXB8x2hPw82m+m1CJVGkS
 gXS8cRGMXeQYwoAHV2A47cPujOt/NYKQoMA7ZLuA1UyQcZo/kZfELPhEq
 mcXbpn6g0LnLGQvb5jsA24O+f2ZBayQSdBib6xpYYe/UbHOLJrDZCrqj7
 TJXtvOFb3LuxAdjl9LvqssUR5E1Cnt5e8yuSDkZW6EHmA4BwL9tsS9s/p
 D824bxYgw2wMhiSxjkxCfkVB9RQ9MInexrzRCrblCMerzLM6u9QR2Z0as
 AJmHQ+WCMmhesAop4esTK+zYa+WWrkxYIAgxNOziiaxm9ahYMVLJwZhKm Q==;
X-CSE-ConnectionGUID: zsEYqNW/T/C+8u4fgGMU7Q==
X-CSE-MsgGUID: q2QZEzqLQbus7uIfwU4Dlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="77178533"
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="77178533"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2026 10:44:09 -0700
X-CSE-ConnectionGUID: WemIP3HgQlOTm1ejKiOB0A==
X-CSE-MsgGUID: ue2ffBviTneGZcqeP00LUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; d="scan'208";a="310244744"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2026 10:44:09 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 11 Sep 2026 10:44:08 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 11 Sep 2026 10:44:08 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.67) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 11 Sep 2026 10:44:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t6v65p84EHNjlPTtsXuUow7SaK80K6SxwaVugpIyAy4tGOsNgjNk+5pkWOI5nu+DjhtDvB1hU1k4T9/TKvVJuR527wlzcuta4tO4uyIhwBv3XORe0eBGd+BKdT5WovVyESphjNqgyfc2xXvOoRGx81VZcZiayYevexIyMw2ktjAMGRjpv1womJp7Tb4lxSZJVc4+i0Doqvo+j4nvuzdP7JKo4pf69HdC+4xClHq5FNKwyHuTfPvBYwLlVTN2RspRrGtraFQ/EqtB2KYCbt9+MCuTeEMVaELEr3vczziRaay3J+vLxnPrzfqsPEKCSfPWaXgaEA9chBwA1oP7LqWIjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K+/jC3ezYCn63Pz2W8/QVGTg7E6Bk4pG4DvI3CcZhUw=;
 b=keas1+Z3BZkJyStoPKR3YMeOG/LkcHeBAyFdfVhftRHld1ZiTG1QDyvAuojNCOH1xadMsAjXlm22bebplDMj8Y+mE8HI3+t01KJXu6GVoa3mXR38FkSc1cTCJqhFiTFhoJLHNkt1KxBg+/4s6CjAFsyWaoR6h/JYzR3PknIjE/WSC51eWabaasseA4hM7lmBnEmqwPoBlxZ/7HqdnbwEGzm/cmQRv1PPRnY953n77Qu/7CFyXKSWl46GAsCa3kZUdVYqWPLKxCLPUcX4TFYHE6IIjEVM45stOx5B0u8a+Tk6cTnZZi2nHYGC8/fPuZBw93VQl3WDioyJ9PWdq74pSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA3PR11MB7625.namprd11.prod.outlook.com (2603:10b6:806:305::12)
 by DM3PPFCA4893B55.namprd11.prod.outlook.com (2603:10b6:f:fc00::f4d)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.10; Fri, 11 Sep
 2026 17:44:05 +0000
Received: from SA3PR11MB7625.namprd11.prod.outlook.com
 ([fe80::a120:f916:60ba:5ad3]) by SA3PR11MB7625.namprd11.prod.outlook.com
 ([fe80::a120:f916:60ba:5ad3%6]) with mapi id 15.21.0406.005; Fri, 11 Sep 2026
 17:44:05 +0000
From: "Tangudu, Tilak Tirumalesh" <tilak.tirumalesh.tangudu@intel.com>
To: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>, "Upadhyay, Tejas"
 <tejas.upadhyay@intel.com>, "Sousa, Gustavo" <gustavo.sousa@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH 1/2] drm/xe: harden adjust_idledly() against
 divide-by-zero and overflow
Thread-Topic: [PATCH 1/2] drm/xe: harden adjust_idledly() against
 divide-by-zero and overflow
Thread-Index: AQHdQHchOhYKuWbDLU+d4jPxedhtILbJqA4AgAAAmAA=
Date: Fri, 11 Sep 2026 17:44:05 +0000
Message-ID: <SA3PR11MB762565FCDC02A5E620D24CD5C8BE2@SA3PR11MB7625.namprd11.prod.outlook.com>
References: <20260909161844.125147-1-tilak.tirumalesh.tangudu@intel.com>
 <20260909161844.125147-2-tilak.tirumalesh.tangudu@intel.com>
 <8ad01b22-8f27-4971-85ae-a806c5910769@intel.com>
In-Reply-To: <8ad01b22-8f27-4971-85ae-a806c5910769@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR11MB7625:EE_|DM3PPFCA4893B55:EE_
x-ms-office365-filtering-correlation-id: eccefa91-d3d1-4cf1-7a1e-08df102c4638
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|22082099003|18002099003|38070700021|4143699003|10067099003|56012099006|11063799006;
x-microsoft-antispam-message-info: KnIlddM9L8KNa2myBo3rxaZxMRi6PJnUNF9sREpTj5wipG5ThISjHXb+6fcpyS8DBKWLXe7K7kC+uaIK8swqyiHgPDp6nEAjqJdjino0+t4TTb9r0BK08zbY0XVkOZYiPrYHL/4PNy4JQ9QultwBW6DmFVX281raTvu9+rkJ/HbZMKgbYfCHeXwqnUkVYzOEjpTHthlSk6Fz2VM/DE9RAZn3Mgt5Pid/EmXHD4I4d578hnx6eN0KZw9FzhW5/fUa+b9e7yQxhPqEHgjWmOHP+BYrKjffxrF2tcK7RAGh3QyLarsC3QDS/d4yHoHOd2w9ZYVKE2GZ2Q3+yNAX//fcca0WBrIo7F60ha7TYTHidwn513s+fcL+ThXDzjCk5eIEVDEIkuC1btH+DFw5HYlpqBRyw60PtTTWKp7b+q6VzsXIG50Oq0wM1iVCHn43s/tYRN0z0fPArbCnT92hza7LN9b1L4tQ9yc0c/C5NRPhti/FPsXMXZzF3hRgv4KEIfZpj/AO+IXGZciFfFMQZSS7fRDCQC03iQsyQ+gaMHKpalUVRn9Srxn8ad8lClg7bKe4PfQLhHprFs45jv1ja/ms5ntAMKlp4FWXcfSJol7viFwzJMPR1aEvVJmZnl28eEDDm65S1aYYzYDjoI0YhvTiJukhDRdqKP8Ee+dx8em/FAqQSagxNWMO3I8NClCPBuzHzecZNBqEgxjKzy/nXxObBXsLpGE9AxgFWgoJOOvODJw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB7625.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(22082099003)(18002099003)(38070700021)(4143699003)(10067099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T3lwcnREbCtQRmt5SjkvZUpFZDdXL25Relc2NW5SRmVtSjNlTW1wRjF0T0k3?=
 =?utf-8?B?WlFKZnUvWFg3TFlhRjh0VHdYOGxYbFlOYXo0K0FLS2dFYzFUMXZsOFBTUmh3?=
 =?utf-8?B?WTNYb0M0ZTFlL2JjNU52OWw1NlB1d3VZa0hvMHJ4a3kvK3VnQmJSblo1bXMy?=
 =?utf-8?B?RFMrZWg2bVNTVUlUUDd2eHYvek9raUhzU3Y5OERQR0dXVHRrWnZEZ2JCY1hm?=
 =?utf-8?B?WkdoUysrZExKWUprOHUraFF1b2dqQVc5QkpvTDdFTk9nYmRzb0tEazByNlpt?=
 =?utf-8?B?Y3c3Y3FqRTg0Rmd6WG11UFh4cVR2N2YxMlF5cGdlMzdublRqNk40blUvTXg5?=
 =?utf-8?B?T0cyR0JlUG8vWnZ3dmlzQ0p5dldiZCtyalkxSm5MdStkYStibGpGUnZpVVZH?=
 =?utf-8?B?bkFETjU0U2ZUNWpFRjQwcjFXN21LcFlHT0hERmp3ZGliaGdTMlJNN1JwZDFM?=
 =?utf-8?B?SDEwc0hsM1lqMy9weStXaWhPdmVKekgvYWlkc294TGFwWFIxSjN5aEhvR0dD?=
 =?utf-8?B?N1pyZG95N2h5Q0k2L09ZdXlncjZtYkhiclVmZWxJVHBXR1R6cTV0dU5PZEtS?=
 =?utf-8?B?Q2hNWHZuNjVKdGpRR1d3N1RjRENvdWVSeVlyUHlnMVcrRk1RdEpnTWYzVFNZ?=
 =?utf-8?B?MWltay9xRWx6alhIMlRCU0ppY25qeHNDR0pCR2RGZUc5b1JnV25JOXBZdTk4?=
 =?utf-8?B?NEU2cmZXMlNmKzg3UVlZOTIyYmVUdWdKb0wzUDAzN3E2OGdMbXFySmZpYjds?=
 =?utf-8?B?cm5WZ1kyaTFueVRFVHVtVTJMdVhDZVk2aTJZZDFJbUQxSkE5RnZHQzYvV1hz?=
 =?utf-8?B?RVZ6bVJOam5LNjBpcjRmeDIrdXhIcGE5cWdRYjJsWEdoVW9VYzduaXNScktu?=
 =?utf-8?B?VFZ1MDM1QUYxWHU4T3hEcEVBbDBhV3VEQWYxNzlkMmwvdTk5UHpqVDg1QlZD?=
 =?utf-8?B?NENsU005b29oYm1KdEFDM2RyZ0RqNmthTG5jd0l3RGhVMEJtaUkxV3lQTEFo?=
 =?utf-8?B?Zm1oWHFoTGwxVVh1VU9pOHhIYmZwUzdST2xoWkluWGdXS2VEc0Zyc0YzRDI5?=
 =?utf-8?B?dFZoWTNORVJmTFhTVWMxeDJMYTJidmMrSGUwb2didW9nWnJ6TU1MWmNqYnpq?=
 =?utf-8?B?Y2JEVG5kK293bGM0eHhGblY5c2cyMEo2aHpMcDFKTGFWWnQ3VmNRbFNUR2kv?=
 =?utf-8?B?RGpGMEJ4eXljZUlCYzN3NnEzT0NPajlYK05GMlpES0hFbU9hZE9OSzNVejNO?=
 =?utf-8?B?M3FUV09yR0pXNi9MaThYaVRReHZ0WUdvOXgrVGkzNEdNQjFmUXdaQlM0Ly9B?=
 =?utf-8?B?L1FDcUJvbklwd2JYYy8rZFk3VG1zZXdUVFlVQjhsODkxWDBVREdscEpHWi9T?=
 =?utf-8?B?VVBtK2ZiUkF2MHBCaU5MMVliTTFJUEN2bU1KODQyY2FKVld5eXFNUmNaWWNs?=
 =?utf-8?B?dThDS1RsYXhGYU5ZaWtDN1ozSGlzS0VmckswK2theiszYkJtemg0dkl0V2ZZ?=
 =?utf-8?B?YUdlTUdrNzBhWUNySFQ5czFvdjRlZGgyUG1nQTNmcUNRTUFGWW1nNHdLQ3Mx?=
 =?utf-8?B?ei81R0o0RVFENEY4VVdZUVV3ak9EVVRSTzV6VnNPL2dsbVQxR2lmcU5XTThV?=
 =?utf-8?B?bEo2WjN0Q29wZmJnaWw2clNIOWxQb1ptZm03a1BDTEdXbndQSXBpQ3JuR1JP?=
 =?utf-8?B?L2Q5clRNdzRXSDZwVlpIOVRIOFdmc1lEWUlodTN3WlF4SnNiMmswSEVXTy91?=
 =?utf-8?B?UFp6YytLYkhwTjdnWVVvQjVlWFNneEU1Yk9uS3pMSWpqRHJ4b0lwWEcrUGpP?=
 =?utf-8?B?Ukhjb1JZYzU5Z0tRTS90MHZEMjFEUWxUYUtWQzIrNUUxSW9yVzRldHJZRDdQ?=
 =?utf-8?B?cHRuMHltV3RzRTU2QmdIWUNhQzRGSmZHR2RoTlBmQklCYzVOK1EybjZ5Umsw?=
 =?utf-8?B?SHRCcStWYmdsN0M3MjZtRkhTUTgwQkRpUDJDUkp6N0lxbzZZWGsvc3pxZFlK?=
 =?utf-8?B?SS9FZ2VMdUcrUVdvd1V0RC9DUUpPNHhMbWd0REVqelczMXBMd2ZtM1JzMk5X?=
 =?utf-8?B?Y0pVWTNWbDdzVTdWTU8zZis3cjFLUG1URjlmQ3NVZjllRGpza1BaUE5QdE9l?=
 =?utf-8?B?Z2RyZ05tUk9td2NRTFNrQnAwK3ZmbjQ5ZzRPRmFQU0tmY0dBMWRFdHI2dmRq?=
 =?utf-8?B?c2V2TEVWTlZ1a1dMdDd6YXNraHlrZXQyU1JNK1dnQWJSNFovVml2bUZ5T05l?=
 =?utf-8?B?WTFBbjNScnh5bEVtemFWQXQramNEYkhxUHR1OU5INGdvWlhTTUdkem1xZUQ1?=
 =?utf-8?B?TS9SR1g2SzJ6cHRQYVdlQzIxWHozbnl0b3MrKzVVRjdiTHZyYXhZR2ZZOTVP?=
 =?utf-8?Q?iW2mYuU36MB3v1uo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: f+bK9lebDL2zd2S6FJSSnR6xGI4Jb+6LWjxXxEYUiWBEDquyXrgoOGemBsDlXAB89k7sLBcpW/w8wamfXzZgFHLcVXPzVe2CwfV6GHyAgPNW5TvvfZpus2vZkxV5N2U7342GzOvygu1d6kF5nOVWly9S5H2pR7DUFJNbSInEOLToKkcdbowHyzU0bvQa/yezh6Xm7r7GT85jeltkGzkAQdJBtcR1Fyfn5TBYD0hOdES2anwQj0+hchivM+GptPN2PeiwvgAGU3jHxhWEETmZI5eD0i5FFRIMh2nidb6BRH7SlOvZW8VbVKOpaInf08NbiK12DMSy3HJ7eOiENDX7yg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB7625.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eccefa91-d3d1-4cf1-7a1e-08df102c4638
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2026 17:44:05.1961 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XwAigjCtq50HCTeLeWaAFXfoq63C1rgCOotaUAjWeHpVKdoByezj158/cw/8AYT7fHzBOHURzxPqL/YYZ+VGyROlU7K47/l5EM8mgvqsUuMt+ljrpVseiB9N30mzk2Xg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFCA4893B55
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQmVsZ2F1bWthciwgVmlu
YXkgPHZpbmF5LmJlbGdhdW1rYXJAaW50ZWwuY29tPg0KPiBTZW50OiAxMSBTZXB0ZW1iZXIgMjAy
NiAyMzowOQ0KPiBUbzogVGFuZ3VkdSwgVGlsYWsgVGlydW1hbGVzaCA8dGlsYWsudGlydW1hbGVz
aC50YW5ndWR1QGludGVsLmNvbT47DQo+IFVwYWRoeWF5LCBUZWphcyA8dGVqYXMudXBhZGh5YXlA
aW50ZWwuY29tPjsgU291c2EsIEd1c3Rhdm8NCj4gPGd1c3Rhdm8uc291c2FAaW50ZWwuY29tPjsg
aW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMS8y
XSBkcm0veGU6IGhhcmRlbiBhZGp1c3RfaWRsZWRseSgpIGFnYWluc3QgZGl2aWRlLWJ5LQ0KPiB6
ZXJvIGFuZCBvdmVyZmxvdw0KPiANCj4gDQo+IE9uIDkvOS8yMDI2IDk6MTggQU0sIHRpbGFrLnRp
cnVtYWxlc2gudGFuZ3VkdUBpbnRlbC5jb20gd3JvdGU6DQo+ID4gRnJvbTogVGFuZ3VkdSBUaWxh
ayBUaXJ1bWFsZXNoIDx0aWxhay50aXJ1bWFsZXNoLnRhbmd1ZHVAaW50ZWwuY29tPg0KPiA+DQo+
ID4gYWRqdXN0X2lkbGVkbHkoKSBoYXMgc2V2ZXJhbCBjb3JuZXItY2FzZSBpc3N1ZXMgZmxhZ2dl
ZCBkdXJpbmcgcmV2aWV3Og0KPiA+DQo+ID4gICAgMS4gSWYgeGVfZ3RfY2xvY2tfaW5pdCgpIGZh
aWxlZCB0byByZWNvZ25pc2UgdGhlIGNyeXN0YWwgY2xvY2ssDQo+ID4gICAgICAgZ3QtPmluZm8u
dGltZXN0YW1wX2Jhc2UgaXMgMCwgd2hpY2ggbWFrZXMgaWRsZWRseV91bml0c19wcyBhbHNvIDAu
DQo+ID4gICAgICAgVGhlIHN1YnNlcXVlbnQgRElWX1JPVU5EX0NMT1NFU1QoLi4uLCBpZGxlZGx5
X3VuaXRzX3BzKSBpcyB0aGVuIGENCj4gPiAgICAgICBkaXZpZGUtYnktemVybyBhbmQgcGFuaWNz
IHRoZSBrZXJuZWwuDQo+ID4NCj4gPiAgICAyLiBUaGUgdGljay10by1ucyBjb252ZXJzaW9ucyBh
cmUgZG9uZSBpbiB1MzI6DQo+ID4gICAgICAgICAgaWRsZWRseSAqIGlkbGVkbHlfdW5pdHNfcHMs
IChtYXhjbnQgLSAxKSAqIDEwMDANCj4gPiAgICAgICBCb3RoIG92ZXJmbG93IHUzMiBiZWZvcmUg
RElWX1JPVU5EX0NMT1NFU1QoKSBzZWVzIHRoZW0uDQo+ID4NCj4gPiAgICAzLiBJZiBJRExFX1dB
SVRfVElNRSByZWFkcyBiYWNrIGFzIDAsIG1heGNudCBldmFsdWF0ZXMgdG8gMCBhbmQNCj4gPiAg
ICAgICB0aGUgbWF4Y250IC0gMSBjbGFtcCB3cmFwcyB0byAweEZGRkZGRkZGIGluIHUzMi4NCj4g
Pg0KPiA+ICAgIDQuIFRoZSByZWdpc3RlciBvbmx5IHN0b3JlcyB3aG9sZSB0aWNrcywgc28gdGhl
IGNsYW1wZWQgbnMgdmFsdWUgaGFzDQo+ID4gICAgICAgdG8gYmUgY29udmVydGVkIHRvIHRpY2tz
IGFuZCBiYWNrLiBESVZfUk9VTkRfQ0xPU0VTVCgpIGNhbiByb3VuZA0KPiA+ICAgICAgIHRoYXQg
Y29udmVyc2lvbiB1cCBwYXN0IG1heGNudDoNCj4gPg0KPiA+ICAgICAgICAgbWF4Y250ID0gNjQw
IG5zLCBvbmUgdGljayA9IDY2NjY2NCBwcw0KPiA+DQo+ID4gICAgICAgICBjbGFtcDogICAgICAg
IG1heGNudCAtIDEgICAgICAgID0gNjM5IG5zDQo+ID4gICAgICAgICBucyAtPiB0aWNrczogIDYz
OTAwMCAvIDY2NjY2NCAgID0gMC45NTggLT4gcm91bmRzIHRvIDEgdGljaw0KPiA+ICAgICAgICAg
dGljayAtPiBuczogICAgMSAqIDY2NjY2NCAvIDEwMDAgPSA2NjcgbnMNCj4gPg0KPiA+ICAgICAg
IDY2NyBucyBpcyBwcm9ncmFtbWVkIGludG8gUklOR19JRExFRExZLCBidXQgNjY3ID49IG1heGNu
dCAoNjQwKSwNCj4gPiAgICAgICBzbyB4ZV9ndF9XQVJOX09OKCkgZmlyZXMgYWdhaW4gb24gZXZl
cnkgc3Vic2VxdWVudCBpbml0Lg0KPiA+DQo+ID4gV2FybiBhbmQgcmV0dXJuIGVhcmx5IGlmIHRp
bWVzdGFtcF9iYXNlIGlzIDAgKHRoZSB1bmtub3duLWNyeXN0YWwgcGF0aCkuDQo+ID4gRG8gdGhl
IGNvbnZlcnNpb25zIGluIHU2NCB2aWEgdGhlICpfVUxMKCkgaGVscGVycyBzbyB0aGV5IGNhbm5v
dCB3cmFwLg0KPiA+IENsYW1wIHdpdGggYSBmbG9vciAoRElWX1JPVU5EX0RPV05fVUxMKSBzbyB0
aGUgcHJvZ3JhbW1lZCBkZWxheQ0KPiBzdGF5cw0KPiA+IHN0cmljdGx5IGJlbG93IG1heGNudCwg
YW5kIGd1YXJkIHRoZSBtYXhjbnQgPT0gMCBjYXNlIHdpdGggYSB6ZXJvDQo+ID4gZGVsYXkgd2hp
bGUgc3RpbGwgd3JpdGluZyBSSU5HX0lETEVETFkgc28NCj4gPiBJTkhJQklUX1NXSVRDSF9VTlRJ
TF9QUkVFTVBURUQgaXMgY2xlYXJlZC4NCj4gPg0KPiA+IEZpeGVzOiBkMmRlNDQxMGE4OGYgKCJk
cm0veGU6IEFwcGx5IFdhXzE2MDIzMTA1MjMyIikNCj4gPiBDYzogc3RhYmxlQHZnZXIua2VybmVs
Lm9yZw0KPiA+IEFzc2lzdGVkLWJ5OiBHaXRIdWJfQ29waWxvdDpjbGF1ZGUtb3B1cy00LjgNCj4g
PiBTaWduZWQtb2ZmLWJ5OiBUYW5ndWR1IFRpbGFrIFRpcnVtYWxlc2gNCj4gPiA8dGlsYWsudGly
dW1hbGVzaC50YW5ndWR1QGludGVsLmNvbT4NCj4gPiAtLS0NCj4gPiAgIGRyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9od19lbmdpbmUuYyB8IDE0ICsrKysrKysrKysrLS0tDQo+ID4gICAxIGZpbGUgY2hh
bmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfaHdfZW5naW5lLmMNCj4gPiBiL2RyaXZlcnMvZ3B1
L2RybS94ZS94ZV9od19lbmdpbmUuYw0KPiA+IGluZGV4IDAxMDQ5OTc2NmZjZS4uYzg2ODkwZTA5
YjU1IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9od19lbmdpbmUuYw0K
PiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9od19lbmdpbmUuYw0KPiA+IEBAIC01OTQs
MTggKzU5NCwyNiBAQCBzdGF0aWMgdm9pZCBhZGp1c3RfaWRsZWRseShzdHJ1Y3QgeGVfaHdfZW5n
aW5lDQo+ICpod2UpDQo+ID4gICAJYm9vbCBpbmhpYml0X3N3aXRjaCA9IDA7DQo+ID4NCj4gPiAg
IAlpZiAoIUlTX1NSSU9WX1ZGKGd0X3RvX3hlKGh3ZS0+Z3QpKSAmJiBYRV9HVF9XQShndCwNCj4g
MTYwMjMxMDUyMzIpKSB7DQo+ID4gKwkJLyogeGVfZ3RfY2xvY2tfaW5pdCgpIHplcm9lcyB0aW1l
c3RhbXBfYmFzZSBvbiB1bmtub3duDQo+IGNyeXN0YWwgY2xvY2suICovDQo+ID4gKwkJaWYgKCFp
ZGxlZGx5X3VuaXRzX3BzKSB7DQo+ID4gKwkJCXhlX2d0X3dhcm4oZ3QsICJpZGxlZGx5IFdBIHNr
aXBwZWQ6IHRpbWVzdGFtcF9iYXNlDQo+IGlzIDBcbiIpOw0KPiBUaGVyZSBpcyBhbHJlYWR5IGEg
eGVfZ3Rfd2FybiBpbiB4ZV9ndF9jbG9jay5jIHdoZW4gdGltZXN0YW1wX2Jhc2UgaXMgc2V0IHRv
DQo+IDAgaW4geGVfZ3RfY2xvY2suYywgc28gdGhpcyBpcyByZWR1bmRhbnQuIENJIGZhaWx1cmVz
IHdpbGwgaGFwcGVuIGlmIHRoaXMgaXMgdGhlDQo+IGNhc2UgYW55d2F5Lg0KDQpJIHdpbGwgbWFr
ZSBpdCBzaWxlbnQgYW5kIHJlbW92ZSB3YXJuIGJ1dCAicmV0dXJuIiBzaG91bGQgc3RheSByaWdo
dD8NCj4gPiArCQkJcmV0dXJuOw0KPiA+ICsJCX0NCj4gPiArDQo+ID4gICAJCWlkbGVkbHkgPSB4
ZV9tbWlvX3JlYWQzMigmZ3QtPm1taW8sIFJJTkdfSURMRURMWShod2UtDQo+ID5tbWlvX2Jhc2Up
KTsNCj4gPiAgIAkJbWF4Y250ID0geGVfbW1pb19yZWFkMzIoJmd0LT5tbWlvLA0KPiA+IFJJTkdf
UFdSQ1RYX01BWENOVChod2UtPm1taW9fYmFzZSkpOw0KPiA+DQo+ID4gICAJCWluaGliaXRfc3dp
dGNoID0gaWRsZWRseSAmDQo+IElOSElCSVRfU1dJVENIX1VOVElMX1BSRUVNUFRFRDsNCj4gPiAg
IAkJaWRsZWRseSA9IFJFR19GSUVMRF9HRVQoSURMRV9ERUxBWSwgaWRsZWRseSk7DQo+ID4gLQkJ
aWRsZWRseSA9IERJVl9ST1VORF9DTE9TRVNUKGlkbGVkbHkgKiBpZGxlZGx5X3VuaXRzX3BzLA0K
PiAxMDAwKTsNCj4gPiArCQlpZGxlZGx5ID0gRElWX1JPVU5EX0NMT1NFU1RfVUxMKCh1NjQpaWRs
ZWRseSAqDQo+IGlkbGVkbHlfdW5pdHNfcHMsDQo+ID4gKzEwMDApOw0KPiA+ICAgCQltYXhjbnQg
PSBSRUdfRklFTERfR0VUKElETEVfV0FJVF9USU1FLCBtYXhjbnQpOw0KPiA+ICAgCQltYXhjbnQg
Kj0gbWF4Y250X3VuaXRzX25zOw0KPiA+DQo+ID4gICAJCWlmICh4ZV9ndF9XQVJOX09OKGd0LCBp
ZGxlZGx5ID49IG1heGNudCB8fCBpbmhpYml0X3N3aXRjaCkpIHsNCj4gPiAtCQkJaWRsZWRseSA9
IERJVl9ST1VORF9DTE9TRVNUKCgobWF4Y250IC0gMSkgKiAxMDAwKSwNCj4gPiAtCQkJCQkJICAg
IGlkbGVkbHlfdW5pdHNfcHMpOw0KPiA+ICsJCQkvKiBGbG9vciBiZWxvdyBtYXhjbnQ7IHdyaXRl
IDAgdG8gc3RpbGwgY2xlYXIgdGhlIGluaGliaXQNCj4gYml0LiAqLw0KPiA+ICsJCQlpZGxlZGx5
ID0gbWF4Y250ID8NCj4gDQo+IHNob3VsZG4ndCB0aGlzIGJlIGlkbGVkbHkgPj0gbWF4Y250ID8N
CiBpZGxlZGx5ID49IG1heGNudCAgdGhpcyBpcyBhbHJlYWR5IGluIGlmIGd1YXJkIA0KdGhlIGFi
b3ZlIGNoZWNrIGlzIGZvciBtYXhjbnQgemVybyBjYXNlDQoNCj4gDQo+IFRoYW5rcywNCj4gDQo+
IFZpbmF5Lg0KPiANCj4gPiArCQkJCURJVl9ST1VORF9ET1dOX1VMTCgodTY0KShtYXhjbnQgLSAx
KSAqDQo+IDEwMDAsDQo+ID4gKwkJCQkJCSAgIGlkbGVkbHlfdW5pdHNfcHMpIDogMDsNCj4gDQo+
ID4gICAJCQl4ZV9tbWlvX3dyaXRlMzIoJmd0LT5tbWlvLCBSSU5HX0lETEVETFkoaHdlLQ0KPiA+
bW1pb19iYXNlKSwgaWRsZWRseSk7DQo+ID4gICAJCX0NCj4gPiAgIAl9DQo=
