Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9ADEC88E7B
	for <intel-xe@archiver.kernel.org>; Tue, 15 Sep 2026 12:38:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56DE810FA57;
	Tue, 15 Sep 2026 12:38:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kPeTdYSU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 720A810FA47;
 Tue, 15 Sep 2026 12:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789475922; x=1821011922;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=s9j3XMos3uiBaVDkOoqZ6KxdwTi1d+41LnbMwPv4PKs=;
 b=kPeTdYSUcp5PmhmahY9meYW5PEtPhQjLG+eIWiOdSLEm4ceV/M6iMYUf
 C/3SPFsZ/n3XOksUDOR/Og7il2qKA5XujdevCPb2lMwYxacFZGZhKm7Mv
 PBB/dhi2h+nUBmB7Kwa7iXg1/GKhRWLgmq4YoxbTz5QIfIWmI8JAUw1va
 MWfyEtCbKkqw74iAPsYXDtaB+aQpawiDqJWHGzbz7PkzD0NcWmXA/aR6a
 6fzVZg9K3+WqbZL/yzodpIGM6CSo8tZ2gJDVgbcNecKavT4ji/MsCTZVj
 Ga+kKWH35diRNWeVnnIUZ4yd7W/nFLmYXtAQ3E1l3nVy2P0qhHYHGb2f6 w==;
X-CSE-ConnectionGUID: Na4SPtciSYOVECdgV1yjfg==
X-CSE-MsgGUID: ivf5qXsCS1qShCFW8FYYwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="344462"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="344462"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 05:38:42 -0700
X-CSE-ConnectionGUID: JBUfyFtLSSSq8x57BaJb6Q==
X-CSE-MsgGUID: VcK41ZRcTMSuckBzkgFmoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="296504264"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 05:38:42 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 15 Sep 2026 05:38:41 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 15 Sep 2026 05:38:41 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.64) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 15 Sep 2026 05:38:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gB+KFK/RXvMFn1vKQV3tRe9Gj+YWWyiu782+zMC6wclGj2Wt2HNAeA338svQOpgvoZtnvvch6EUP3B7rkVMbRnu9dOSD5Ow192s2e59CoYCX281klglKYK6851mbcssX2F9Z2KYoSjGla0dF6daxSgYieAr8q+0mVGrPM6mcLPQXs2b3mDMNH80UoNzrp7grd9AvznVUrtg0VQQ4Y3yxf6AxTyI2lupVY2gZzyxa1Ctq8pi37xBb5G+zSS/IK5KSjXTIwNOSqSa7sY6I4DQJyYcZNwaIDfvp8rFdEP4AmwOce4masJvPyn7JHupjOTSM1y1Bei9e/FSIkr5yGHxjsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s9j3XMos3uiBaVDkOoqZ6KxdwTi1d+41LnbMwPv4PKs=;
 b=g8t9k/xWrQ6rNonyxUHLJ9F0SxOEgvqMpktvqITPDZcXqnO67YaOrNVr4ZpV++D+7sfiNsKcubkve3kHHFzgmhxIijUOcDa9KRdNlrbQF5ld6KvtT0Kpfl6oTvwYdt3Sd+WmCY8YGxnbvKenQzgHN4OYQki0fS7TCfUaJGiOmNAa/pe5af/gG60VuQqFb9WYKgiod10T17vx6dTKtwJRpSAs4HDCvwVxYNR4ZxH/6R//CfNl6mdqp2gTwiDJoq2CodLxUxuR/jTrSjsjleryv1TM1Zo+FXqgxjLynh65ufuHbmsCWW40QFJReLybvtLBKzQqTi/7jktEk7/Bniq4RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 SN7PR11MB6924.namprd11.prod.outlook.com (2603:10b6:806:2ab::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.11; Tue, 15 Sep 2026 12:38:35 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762%6]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 12:38:35 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Govindapillai, Vinod" <vinod.govindapillai@intel.com>
Subject: Re: [PATCH v8 2/5] drm/i915: add pme_enabled() to the parent interface
Thread-Topic: [PATCH v8 2/5] drm/i915: add pme_enabled() to the parent
 interface
Thread-Index: AQHdRPQySNmXfCBJOUerjQxaZOlMELbPlFSA
Date: Tue, 15 Sep 2026 12:38:34 +0000
Message-ID: <c5e03bfe62b289eb26198a2bbf89539fbe045792.camel@intel.com>
References: <20260915092518.639448-1-vinod.govindapillai@intel.com>
 <20260915092518.639448-3-vinod.govindapillai@intel.com>
In-Reply-To: <20260915092518.639448-3-vinod.govindapillai@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|SN7PR11MB6924:EE_
x-ms-office365-filtering-correlation-id: 336eccce-0040-413b-579d-08df13264236
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|23010399003|1800799024|376014|56012099006|11063799006|4143699003|6133799003|10067099003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info: PbLXs/+fa9uxBg0mRa5COic6Dn4B/gCh1eJiYT570onPT+bkCQHZH0qeYA0FtDGarEis1KJQvvoyPDbyLWQWDk8v8ljQi2wv68d22G/XvOUtwB8wA7y1hXhjfCJcOZ/uBJQLt+VZPLTSIPvV+3N0/WhVVJ8Kjo0U7H6L9fgR+18pD5iWIr68n1XUqusyWiuTMDqVrKztI7q8DoRIWvBO1Xef6V7ed3mlFV5ng+5VH5qqSyxhugqrICJslkrNe1OhQqHwuTkf5X6fNVWVkIiT+7yJ+qZsA/1lYe6kmMXrE2k61BpbMmaWuMOfs91AWqFyZ+bUEoPOycXD9PIh/NlAaDA0D3trBTDfb27zySv10CxOOzWKjXixuoOi85MBy2j3CCpDj+GC2XH7XUrJZpVEDtPCw/LrUHa1eiw//GmyyWdMxoapYc7NDP81ccJnaWDgvoxkJxo+XdraDrBeu2k9H/r2JkjI4GNLjGKewN9KM/SWiiw1/iSY8jdPxvq5xoqOrApnTw/hBNhsco5YsNBtdF5JkSRrxAY/IyyGAJ/z5TqdQEzBGXviVGtQGlH0twaTXF6ii+l+bjhduPiqdCqdYMd/mNkhAZtMdyaSufWOTt2H1Ecfah/2TBDfxr5SQNLErYbyGmvcMpoPO71bBtx32BwG/HKAYHRi9mTdt3JnsRkBeh8ve5SLDZISfaYZl+ID1fHw3CmcyCz56CW22nAPk2btmxlgID7wya87D0nNDJQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(56012099006)(11063799006)(4143699003)(6133799003)(10067099003)(22082099003)(18002099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OHJzejJ1Y3FQek5LRXZ3T1BQZUY1cHk1Qk9Ka3BqV0RtKzZBOGlSR3hSZFd2?=
 =?utf-8?B?ZjY1QjdmOXVQdk13MjVCN2VNa0Y4RnpNZmtIRndLaEZGVWR5d1k5VlF0K3hZ?=
 =?utf-8?B?ZFdaay9YQUpld3dVMlErT0lJMWdhTEVIVkwrQXdjaDlxYTdreVV6L0VQdFdv?=
 =?utf-8?B?aGErZVFJb1ZCSE41azEyT2FvaHhXdUtLeHptWXBmTGZ6amUxdEVJR2lMYVVN?=
 =?utf-8?B?eXJlSEJzTk5iYktHTVpOVGgveEYzSGxWaWZWUjRrRmJ4WTh6bk1QbStsTVBx?=
 =?utf-8?B?ZkVrdFY3ZlZOMm90WWZZaFFmVEpuMjFxWE1FbTVWMVA0NmlSVVNreVVrd2RT?=
 =?utf-8?B?OTdCY1BvQ2NPcUhCeUlMNlVmVXVNRkdLdHVzRnlKRU12OWRsaTdUWi8rY0lZ?=
 =?utf-8?B?TWw3SzlWVkkzUVY0MWppS0VZcUpKQnhMUVp5RklFT0hsbSs0YWxaZ2RrTWtm?=
 =?utf-8?B?M1FKeEVYUTh5RW1ZZFZWVHRsSndCS3ZYVEtBSlplb2tHMTdjT2RvRVVOeUsz?=
 =?utf-8?B?Q3c5eER4MjRDcDA2Y1Z1Mk8zYmdDanIreE1FV1UzWjRzYWlKelBIMDBFZHIw?=
 =?utf-8?B?NlVXTnMwcThxMlI1WWY4SlJmdjM5RXd2QVoxN1FMTDFEZ0dBSm5RcFVGdWZR?=
 =?utf-8?B?ZndKWkJRdlJjRUpRUjV5VGpGc2gyNGpteEVWUHdEendtNmZ2WkUwc0hMeGJD?=
 =?utf-8?B?WTM1c2tCUEtvUGp5MzZNTGtOcTUxdE1zZURNWEd1YlR5Ymg2TVdJWXpLS2xh?=
 =?utf-8?B?aXZNbjN1VjFtS2F3Zkp0NjVxdzNoYmVLd0psajJBR243T0F3NVB0cVpDODBJ?=
 =?utf-8?B?U2szWlVTdTNualJCNXQ3RnFJWWIyRXYrY2ZtNndiZ2FXRWNOcXpyalJCa0RI?=
 =?utf-8?B?WTA1aEdnZDRrMXJPcThSVlFBb3FPQnh4VitSbmt4eDJNOWtrNThEUjZKT0Vh?=
 =?utf-8?B?K0hJRytWM3NQNVpmL3VncUZwengreTZQbHd4NVhUY0ZWVXp1MHNNYWloV1V2?=
 =?utf-8?B?cE56UG9VZkd1dEI3L3diT0pUZzJDWG5GUGtPdzlmckhtcW1MNjA5UDdlbmd2?=
 =?utf-8?B?OXJxSU9kcUxqYTBxYWNHNUMxYW9oaklRQW9mTktWRjhKdHVNRC9abGVnZDZt?=
 =?utf-8?B?QVV2UnBKblN4dEhqblJjZ3VVT3V0Y1ZHM0YyM1g2ZVZkL0xrdmUxb3RxRmVj?=
 =?utf-8?B?Q2ZUMW5ET3EyZTc5STczY1VjQUZEeTJ3b2FIZVFKRCtzc3d1SVd5c0FuY3Aw?=
 =?utf-8?B?TWVhUTM2WWFiaGt5alZZNEpLSXRkUHdpYThUUXdUWkRKN2dINCtUcWEzbDVR?=
 =?utf-8?B?RWRubFJSaERLMHRHRjVndVdWWEJuc0pqMGdOcU1ObzdSVjQ1cUNGZXBDMTNx?=
 =?utf-8?B?NzlLNU9DUGNIU1JZVzVlMUlYUVFKSTZoaEtVamtDMEQxajdudlpTNVZJVlIr?=
 =?utf-8?B?aDJmaHZ2WmVOZ1Y4by85Y0w0aE1OR1dGUEhKYldoZ0FtTTNPSTBMcVY5YWM2?=
 =?utf-8?B?Ly81b2F4ajA5cFNsZnk2TWFIQmZhRWt4YTZzUDdCTlBPaVB3ZjdZU1NHcG4v?=
 =?utf-8?B?VlhPcWN1UkYydkJJUDRRWVVUd1ZhRUJNcmsvNlpBOWJOb2Z5a3hFcTNxNk9W?=
 =?utf-8?B?ODJlb25LS2pwUTJYMGppQ2dSSWd5NzhHSTdjaUxWZmg5M3NsbkY0bTNvU0J6?=
 =?utf-8?B?akwrNDRlRU10ZGRjQ1VsWlEwQUtrdXFJZUdYTW9kc3IrTnB2cjNvV214Rlpj?=
 =?utf-8?B?ZlpsMk9WWTZlNk5PSDNNTzBJdDZTUUhLS2xVWFFuQzhQbm5qRlFOTWRIRHFz?=
 =?utf-8?B?SENjaG43OFgzenlZeTZRQTQrMDFTRGVjZUM4YTk2c3hrM3VNUlFVTFdpZFlq?=
 =?utf-8?B?RUZhcWZzU3J3UllrRHROaDIrU1dWekZ5UnlkemJIcXRRTGYyMXNGUDZ5OGpW?=
 =?utf-8?B?TDVYbmRlYkZ4TE1PNTlJd21MbVd1WEZrc2o0QnJTVTN2Ykg1RkJNSXp5SEo5?=
 =?utf-8?B?WWM4djFRTm5zVUl6ZU41d3BudXUzSTZFbVJQT1gvd2hmcmUwSGhuUGl3K2Zj?=
 =?utf-8?B?c1hmT0J0eE1KcU44bU5rVExPeVltRHlCVk03YWJvZUoxQnhOa3JhckhNRGtU?=
 =?utf-8?B?OHRoVktTQW9kOVk5R0gwTUlIdTVWb2VsMEY5MmZDMWM4dGRtbDE2MlQ1TWhi?=
 =?utf-8?B?VEJGUzhyOGlnUnJub0pIdk1uc0Y1djVNVnl1SWQvL09OWnNnOFdvbU1JMHdR?=
 =?utf-8?B?QXlxRW4yMXF1a3N2ZW14dVNkbktUM0JCNHkrY3ZXMmRjYzFseW1RazRDQzJL?=
 =?utf-8?B?Q3FidXZZbEF2UjBUcEtiSEw2eWc3VVQ2YUdFbDhGakZIWnFqTmtvK2VwQWlZ?=
 =?utf-8?Q?c9zfDyX7yNgNi9E8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9E897C09A9A285468BDB26642BCE49D2@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Qh1dI7spwsaeyTV3dX59kDwiGPfY9dBVQprbJzVlSqoA4QpOmjQyDwuwlb3gj5DAlwsDj2L2sLMgFCovL+utSkiE7N424rsAo+4CsGBmKCXSB9Z6y+yn4bAAkOI0+iuh9+jDJRVrbJhkDJSBkPu9lx0S38FhchU/O6cilyx2j8ZabKybeUVjlGlmDIo5jIpkXO8uE4qpNLXZrqWEhq2iZkcMEApo390Sgx5DbFX1B0MXXJd9MHcJehvnGEwMYmU7F1hU7yMpxMS7Q6g1Dh+iGahLO3kNhZmOHa8Iz6CsqLaQKL/Vmi4O454YnFXfuGTBTKPAdx694adOYUX4vOcyWA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 336eccce-0040-413b-579d-08df13264236
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2026 12:38:34.9221 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /2Grw7qaTIKiYxhoQGJ0OllZ0uBN63NSAuIR6waZLZxIGPTtta09ZySzhY8GbmZTFbAsp9sIOzpsmIb8LKW+HSFU1Hg9IYBY+vRvom0+Nt4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6924
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

T24gVHVlLCAyMDI2LTA5LTE1IGF0IDEyOjI1ICswMzAwLCBWaW5vZCBHb3ZpbmRhcGlsbGFpIHdy
b3RlOg0KPiBQTUUgY2FwYWJpbGl5IG5lZWQgdG8gYmUgYXNzZXNzZWQgdmVyeSBlYXJseSBkdXJp
bmcgcnVudGltZSBzdXNwZW5kDQo+IHJvdXRpbmUgdG8gYXZvaWQgcmVzZXR0aW5nIEhQRHMgZHVy
aW5nIElSUSByZXNldHMuIEFzIGRpc3BsYXkNCj4gcnVudGltZSBwbSByb3V0aW5lcyBhcmUgYmVp
bmcgZXhlY3V0ZWQgaW4gdGhlIGluZGVwZW5kZW50IGludGVsDQo+IGRpc3BsYXkgZHJpdmVyIGVu
dHJ5IHBvaW50cywgd2UgbmVlZCB0byBoYXZlIGluZGVwZW5kZW50IGFjY2Vzcw0KPiB0byB0aGUg
cG1lIHN0YXR1cyBhcyB3ZWxsLiBBZGQgYSBwcm92aXNpb24gdG8gcXVlcnkgdGhlIG9wdGlvbmFs
DQo+IHBtZV9lbmFibGVkIHRvIHRoZSBwYXJlbnQgaW50ZXJmYWNlIHNvIHRoYXQgaXQgY291bGQg
YmUgY2FsbGVkDQo+IGluZGVwZW5kZW50bHkgYmFzZWQgb24geGUvaTkxNSdzIHBtZV9lbmFibGVk
KCkgaW1wbGVtZW50YXRpb24uDQo+IA0KPiBBc3Npc3RlZC1ieTogR2l0SHViX0NvcGlsb3Q6Y2xh
dWRlLW9wdXMtNQ0KPiBTaWduZWQtb2ZmLWJ5OiBWaW5vZCBHb3ZpbmRhcGlsbGFpIDx2aW5vZC5n
b3ZpbmRhcGlsbGFpQGludGVsLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IEpvdW5pIEjDtmdhbmRlciA8
am91bmkuaG9nYW5kZXJAaW50ZWwuY29tPg0KPiAtLS0NCj4gwqBkcml2ZXJzL2dwdS9kcm0vaTkx
NS9kaXNwbGF5L2ludGVsX2Rpc3BsYXlfcnBtLmMgfCA3ICsrKysrKysNCj4gwqBkcml2ZXJzL2dw
dS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXlfcnBtLmggfCAxICsNCj4gwqBpbmNsdWRl
L2RybS9pbnRlbC9kaXNwbGF5X3BhcmVudF9pbnRlcmZhY2UuaMKgwqDCoMKgIHwgMSArDQo+IMKg
MyBmaWxlcyBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXlfcnBtLmMNCj4gYi9kcml2ZXJz
L2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXlfcnBtLmMNCj4gaW5kZXggMGEzMzFm
ODliNGRiLi45OTI3MTE5YTBmZDEgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2Rpc3BsYXkvaW50ZWxfZGlzcGxheV9ycG0uYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9kaXNwbGF5L2ludGVsX2Rpc3BsYXlfcnBtLmMNCj4gQEAgLTQ2LDYgKzQ2LDEzIEBAIGJvb2wg
aW50ZWxfZGlzcGxheV9ycG1fc3VzcGVuZGVkKHN0cnVjdA0KPiBpbnRlbF9kaXNwbGF5ICpkaXNw
bGF5KQ0KPiDCoAlyZXR1cm4gZGlzcGxheS0+cGFyZW50LT5ycG0tPnN1c3BlbmRlZChkaXNwbGF5
LT5kcm0pOw0KPiDCoH0NCj4gwqANCj4gK2Jvb2wgaW50ZWxfZGlzcGxheV9ycG1fcG1lX2VuYWJs
ZWQoc3RydWN0IGludGVsX2Rpc3BsYXkgKmRpc3BsYXkpDQo+ICt7DQo+ICsJY29uc3Qgc3RydWN0
IGludGVsX2Rpc3BsYXlfcnBtX2ludGVyZmFjZSAqcnBtID0gZGlzcGxheS0NCj4gPnBhcmVudC0+
cnBtOw0KPiArDQo+ICsJcmV0dXJuIHJwbS0+cG1lX2VuYWJsZWQgJiYgcnBtLT5wbWVfZW5hYmxl
ZChkaXNwbGF5LT5kcm0pOw0KPiArfQ0KPiArDQo+IMKgdm9pZCBhc3NlcnRfZGlzcGxheV9ycG1f
aGVsZChzdHJ1Y3QgaW50ZWxfZGlzcGxheSAqZGlzcGxheSkNCj4gwqB7DQo+IMKgCWRpc3BsYXkt
PnBhcmVudC0+cnBtLT5hc3NlcnRfaGVsZChkaXNwbGF5LT5kcm0pOw0KPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5X3JwbS5oDQo+IGIvZHJp
dmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5X3JwbS5oDQo+IGluZGV4IDZl
ZjQ4NTE1Zjg0Yi4uNWQ5YTFjZGRkZmE3IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXlfcnBtLmgNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5X3JwbS5oDQo+IEBAIC0yMSw2ICsyMSw3IEBAIHZv
aWQgaW50ZWxfZGlzcGxheV9ycG1fcHV0KHN0cnVjdCBpbnRlbF9kaXNwbGF5DQo+ICpkaXNwbGF5
LCBzdHJ1Y3QgcmVmX3RyYWNrZXIgKndhDQo+IMKgDQo+IMKgLyogT25seSBmb3Igc3BlY2lhbCBj
YXNlcy4gKi8NCj4gwqBib29sIGludGVsX2Rpc3BsYXlfcnBtX3N1c3BlbmRlZChzdHJ1Y3QgaW50
ZWxfZGlzcGxheSAqZGlzcGxheSk7DQo+ICtib29sIGludGVsX2Rpc3BsYXlfcnBtX3BtZV9lbmFi
bGVkKHN0cnVjdCBpbnRlbF9kaXNwbGF5ICpkaXNwbGF5KTsNCj4gwqANCj4gwqB2b2lkIGFzc2Vy
dF9kaXNwbGF5X3JwbV9oZWxkKHN0cnVjdCBpbnRlbF9kaXNwbGF5ICpkaXNwbGF5KTsNCj4gwqB2
b2lkIGludGVsX2Rpc3BsYXlfcnBtX2Fzc2VydF9ibG9jayhzdHJ1Y3QgaW50ZWxfZGlzcGxheSAq
ZGlzcGxheSk7DQo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9pbnRlbC9kaXNwbGF5X3BhcmVu
dF9pbnRlcmZhY2UuaA0KPiBiL2luY2x1ZGUvZHJtL2ludGVsL2Rpc3BsYXlfcGFyZW50X2ludGVy
ZmFjZS5oDQo+IGluZGV4IDVlNDRjMDIyZDFhZS4uZjM2MTM0ZTg5Y2I2IDEwMDY0NA0KPiAtLS0g
YS9pbmNsdWRlL2RybS9pbnRlbC9kaXNwbGF5X3BhcmVudF9pbnRlcmZhY2UuaA0KPiArKysgYi9p
bmNsdWRlL2RybS9pbnRlbC9kaXNwbGF5X3BhcmVudF9pbnRlcmZhY2UuaA0KPiBAQCAtMTk2LDYg
KzE5Niw3IEBAIHN0cnVjdCBpbnRlbF9kaXNwbGF5X3JwbV9pbnRlcmZhY2Ugew0KPiDCoAl2b2lk
ICgqcHV0X3VuY2hlY2tlZCkoY29uc3Qgc3RydWN0IGRybV9kZXZpY2UgKmRybSk7DQo+IMKgDQo+
IMKgCWJvb2wgKCpzdXNwZW5kZWQpKGNvbnN0IHN0cnVjdCBkcm1fZGV2aWNlICpkcm0pOw0KPiAr
CWJvb2wgKCpwbWVfZW5hYmxlZCkoY29uc3Qgc3RydWN0IGRybV9kZXZpY2UgKmRybSk7IC8qDQo+
IE9wdGlvbmFsICovDQo+IMKgCXZvaWQgKCphc3NlcnRfaGVsZCkoY29uc3Qgc3RydWN0IGRybV9k
ZXZpY2UgKmRybSk7DQo+IMKgCXZvaWQgKCphc3NlcnRfYmxvY2spKGNvbnN0IHN0cnVjdCBkcm1f
ZGV2aWNlICpkcm0pOw0KPiDCoAl2b2lkICgqYXNzZXJ0X3VuYmxvY2spKGNvbnN0IHN0cnVjdCBk
cm1fZGV2aWNlICpkcm0pOw0KDQo=
