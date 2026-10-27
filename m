Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3336B606A31B
	for <intel-xe@archiver.kernel.org>; Tue, 27 Oct 2026 14:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VW4Hhd+X
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6FF010F608;
	Tue, 27 Oct 2026 14:52:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89C1D10F608
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Oct 2026 14:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793112751; x=1824648751;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=uH+B7sIjRNqMZ0XnV/eMWtAULAYLRIc0VTSKjSywQ+Y=;
 b=VW4Hhd+XU5lazyTEzxkIUBhEgW7OL3Ko45mJdV9MM/HRqchw+Hu1UNOF
 YBlbIThQrY8BzlgSi0mbMdyHFJkn4LLusAUyMh/MEz2DIlvA5dnhjkwzG
 zpVNPKY6+scjSAWIZY0ishUXSJjfkSWxJvoUWbuBCT+vUWaU18IShkGav
 UAkCSBa02nNEQ+5nwAuNUdtj2+GBKvmJSwRJE9BEsNxkZb/GPLcQNQjOQ
 izDjKkQUGu5GgsItL4TzmLr9SnBsy2b+R7nl1EOnl9qEzVnpCAcfwr12d
 WCUsBA1vd4fbx1MRpa0iDd7HNL0nvt9kn0YDnLKjjsqThPfU1ANNdjHPe g==;
X-CSE-ConnectionGUID: IEUB697JSNSlsh831REBtg==
X-CSE-MsgGUID: p5RbqtJaSeO05E9EjrgSjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1830803"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1830803"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 07:52:31 -0700
X-CSE-ConnectionGUID: X10qNJvOQDqZqcVvhOet/g==
X-CSE-MsgGUID: RYgpVyl1QcKlwTByM4jrgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="4519684"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 07:52:31 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 07:52:30 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 27 Oct 2026 07:52:30 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.60) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 07:52:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hhl2r4culNfhLPG7lTvKITjsxOR1xZahSGDObV+KlMc/nzLiFcabOi0RYhfYdw1/N2rCtdBfGQ8ILEzXRX4NH258xftwnQiW0+UiaEXdcs0JjebS3PX13PmqwYi3XaFGfe1GDaTWn9UR2M4yM8RelWe/ZNpafxZBJBtvNrrDXUVrTtfC+OEdTJKuYgdVmB4SxXpqvxlIbFRWPQKAMHUKYo6dmoXypE2k2P6vyBZOxKE0X/s3BOw15zg73x/IWLXCk4iV4dNrHI9KTi5GY+rjI+hBbjzCSOI2uOBWGKbuyRM9fIepicYiBsgTAfe3GNeey5vJhz4FQjT4Hta/WReS6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uH+B7sIjRNqMZ0XnV/eMWtAULAYLRIc0VTSKjSywQ+Y=;
 b=UOLrTUuaWvjj8skDjl4llRnrv0Kbij5y7v092B73fyvaahFajOAIgfZNHHGRmoNl51CJPoU8smJx+EkZMa2VDTkQNbV4yzgYsqrJFLkXvpGU27NoSG1/00ZTuUJrWfpg/5L+WQyBGdFNOeGJ4qI8nMo4SSI/66+sLU1J/E2dzSCUIcGmiJJ2j9M45WcOy+GNEmEKIRB2vPyEGtXlxFwPqsLSzHrCpAQIkhLxpxoKmqG0l2s7mjZ+38aIA0RnWJ+tBRzMlmD6IOPfLa/MByIESVq3IYl90MxmzduwQi6mF4A1rDSSDVGm1xV1cawU/xeSBzM9qV50S0jATzuuuYKDsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB5039.namprd11.prod.outlook.com (2603:10b6:a03:2da::22)
 by CO1PR11MB5153.namprd11.prod.outlook.com (2603:10b6:303:95::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 14:49:19 +0000
Received: from SJ0PR11MB5039.namprd11.prod.outlook.com
 ([fe80::d9f2:247d:ca72:fc1e]) by SJ0PR11MB5039.namprd11.prod.outlook.com
 ([fe80::d9f2:247d:ca72:fc1e%6]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 14:49:19 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Subject: RE: [v2,1/2] drm/xe/bo: Add xe_bo_addr_iter.
Thread-Topic: [v2,1/2] drm/xe/bo: Add xe_bo_addr_iter.
Thread-Index: AQHdaaRAylrOTjw0AUdV7G37aa1ZFrcQrxRAgABtgACAAFJkQA==
Date: Tue, 27 Oct 2026 14:49:18 +0000
Message-ID: <SJ0PR11MB5039FFFA8D91025D86F90CB1BA602@SJ0PR11MB5039.namprd11.prod.outlook.com>
References: <20261023114616.735366-1-dev@lankhorst.se>
 <SJ0PR11MB5039A2297A745041F33B3539BA602@SJ0PR11MB5039.namprd11.prod.outlook.com>
 <50cf7c79-bbf2-473c-b5b3-cbb8b3d2dff8@lankhorst.se>
In-Reply-To: <50cf7c79-bbf2-473c-b5b3-cbb8b3d2dff8@lankhorst.se>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB5039:EE_|CO1PR11MB5153:EE_
x-ms-office365-filtering-correlation-id: 944f81f1-030a-42af-1b95-08df34397aeb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|366016|10070799003|1800799024|376014|261009223027099003|261021121427099003|261021123027099003|10067099003|56012099006|6133799003|18002099003|22082099003|261026121527099003|11063799006|4143699003|38070700021;
x-microsoft-antispam-message-info: Cts75UYSZlh6iFydWuTCx38h0YXrNoZlFtLEBANM2pTsld+7SpFwih8+BSxLDhPyDw+Vu6a3MfXmfsIMOaYTH+vGmfQDPp0TDpPKIDhWBPDoPZFBLhDUPfmFDJ21psSgyE6OeJuc+HAZvdtbrWniLcu0u6UdHlqQ1T4h834W3TKm4GAWZFQ3sqYKlt1C9eSahmb94/JwSYY1RZ0He3AVHNqg8lb4rSXSrWDNM8ghNnyFBTpP0v5FCBFKiWkNBbowxrckkIve0nDxHmqkxMCXsJc4NryiFEntBxVQpD4FAYNzLBelbIt0/N+1kIB88rMHVCdx25s2QuZPQbN4u8SKJxHrdB5lLmTyZigvl0RpaKMf/u6a0c6h/Tviua/lHG1K8Acu9IQ1iPbnDkoNVSqH0SlWFIm1sh+DH8D5E2MF0i9BVULJj5MRvXW58YIpU70t9yFOQDmJiUlCjYSsTSu9cQIO7dwopqsjCgXSXGHwFJCD8U52ixj1YxzZIiv8KcIXTVJGvPv9SH3GvCIagu1b8OIYlq3o52SQ7Kd8ETzdb3IA4wlGB635SrZYhCLzHIYVXBBkmh7caTEsgxMwyo6HoLEFkoXXrNwNQsiArbcSGuXN1yI0i90Zm6MX46PU22M5z4Hz6S/ujV0RoJWVGQjf4yju2q5t79kBU4+FEvZmmT7hExEWbQnuSWka0/RjVtNTbmicnXCxkzpTLTnbnPw3+Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB5039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(10070799003)(1800799024)(376014)(261009223027099003)(261021121427099003)(261021123027099003)(10067099003)(56012099006)(6133799003)(18002099003)(22082099003)(261026121527099003)(11063799006)(4143699003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MVUxbkpjRXZpVWw3azNtL1V2MTIzVDhnM1MxMmFSd1lrTFlWZS9mWmxTajRU?=
 =?utf-8?B?eE93bWIweS80NXpDWnRjT1FXYlZSWFRvRElIWi9XWEY2L0xITTFENG1Udkps?=
 =?utf-8?B?aUlvNkRGL21WR3ZGV3hUc0JBKy9McEE4UmJWVlFSSHVrWE83SjdtbmIrMlBO?=
 =?utf-8?B?MXgvREwyYTMyQ0ZDSFdrN0ZZUi9XNmorcXptdTZxc0pCYmZKc1ljQ1A4MkQv?=
 =?utf-8?B?WDJidWY1bU9jbWlJaklMckM2elF3QjZremFpVWx3YWZjbjBPeEgxZVNFNHI2?=
 =?utf-8?B?NUx3UnRaV2VwM2pVa0RQMEd6SEZYdWl2Ym8vUW1wd3plTXZaYzlZZ1ZMT2hZ?=
 =?utf-8?B?NmwrL0dvcXdVZXRIdG1nSTdGTFM4WmQzSTQxMWtvZmM1WjlUYldSbmpidnp1?=
 =?utf-8?B?WUk0bDh4MGR6U3JHSFBZaFNUY01iL0N1ZjNIbUNpUy9oZFd1UFRrbFVyY1VU?=
 =?utf-8?B?NG9hNitDVG1uOXR4eEVHWmxNUGd5a2N5VHErM256WWdCVGdUUnF6OHJ0aE5R?=
 =?utf-8?B?bnRGYitSZGw4MnplcHlJbDArUzV4OHEzZHNxcUdkcmZOVUNVMHhLNmwyUFFa?=
 =?utf-8?B?QVZVM0RDOHloczlGNFlQMk93Um5pN3UvNFpHcXM5RVkzRFdnRmNYVlFRNmpJ?=
 =?utf-8?B?RUIrKysyVXRzQ2xVRmoyQ3kzV3BhdkpLWlVGQ01ZVmlHYzNWQ0N4dDdjcGo4?=
 =?utf-8?B?ejF5VmJ2WXNySnJtYjh5U29SU1NQSnBMOTZZSlNBcUxxWnlxRm9mVEpxV2My?=
 =?utf-8?B?R25Cc2dsZkc5SnFhU1VPa0s3YldBTEhta0Y0SlZwRkNkTzd0SEVtWUtzaGVv?=
 =?utf-8?B?SzBKZmxzalFsajcwZVpXRkRqTTN4N3A5dk12NkxxTXhBT3c3MUpINXFMbVZK?=
 =?utf-8?B?L1BCVStPRElCYXM2cXZVY3kxblptT3pFdWpGN1VMaSszVnJBRk54M3VCSGZY?=
 =?utf-8?B?SkVOYnkwNUQ0Q3pURG9UM2hLWFBBbk13NnBNWE16VlJ3ZXdGSy9lWlp2WEtX?=
 =?utf-8?B?QlJWdXZkNGg0NE5hRmNBWjdHRmh5VGluSFV1Z051Q1BMNUwzUnRYUHZFQ3M3?=
 =?utf-8?B?L1gwclVOU09VYzZLSzEvQ2tiZHVjb2YydTZtRWlGSGFhRW10d1BqM00ycTBG?=
 =?utf-8?B?dTY5VFB1TE9CbFc0ZDNxYXNlSGlJbGhvc2xGYWZ3dUVoSE9ia0dWb1BWZjY2?=
 =?utf-8?B?amxhb2JJQTNhdlluL2tNVTAzVGVUMW1sWHZSVnpSUWhXT1BIbm44UVhQWlZW?=
 =?utf-8?B?a21lVDdRVHNwckJTV1B2L0Nja0ZVMTRnZE9LNk4rT01zSnh2cVUyajhCUFY5?=
 =?utf-8?B?Y3VuZkRSdlFvSm4zK0xFSVdkekNPUjlOcjBuYjY2K3RwMXJuS3REMUJuWEdv?=
 =?utf-8?B?d3BKMEpxNStoeHNFb3VrdUg1N1duTGFGYmJZdWVqcWR2aHlBQ1Z1MzEyZlBG?=
 =?utf-8?B?RTNaYmEyN1RWVWNBcTNIdXVYb2E4Nk5IY1MrYjlkN2sxYTNpZ0xFMit4OGRJ?=
 =?utf-8?B?aGs4bGN5SitBZTNudnA0UExtSXcyajdWUWx0cTNSTldSNld0aXhlZi9UUFdX?=
 =?utf-8?B?SXc1cURpT1RvcHpaYmZEM1J5ZnVtUW1rN2dnMWdyaWlOUlkwb1dRR2xDR01N?=
 =?utf-8?B?NGNvRUk0ZXB5Ny8zQnFLMU9rNFppYjV6c0diVFBIbWd4dUhHZWhvaEhpZFBv?=
 =?utf-8?B?dm83UUlBNjFzN2RqdGJSWkJJUDYzUG1VNm9Zd0ptYlZLbzhSM25tZEJ1OE9k?=
 =?utf-8?B?TDNDSHZDU0JOYVd3Vjd0SXhKbm4vMzZURGVwTFh4RDlNd1B5WnhaL2hPb1h4?=
 =?utf-8?B?VlJCOFZFUTdsaEZlN0cvMkFXN3JPUFpVTHNINHp4NU54d0kxa1FnbXdJMldF?=
 =?utf-8?B?VGM5a29FZVVZSVJSY054RkRMNWlDeThheHppQmtvS0V0V3QyRTJOZVd6YkM0?=
 =?utf-8?B?T3QzY1A4OWFZWlpxYTM5RVRFamI1NW9Ma0psZGdFYS9GcGw4dUJMV2VZU1pZ?=
 =?utf-8?B?Q2hvRDl5cWM2ekdkcjZHUUdTd2R3ZjM2bjJBcmpaT3d5b285dFJySG5lamhF?=
 =?utf-8?B?V0ZMenluS2RLMDhIRW1XazNjdjI2aWJ2VnhJTUg1Q29mczVxbTcybC9RNWN4?=
 =?utf-8?B?Q0JtTkhPRHlBYmtSTDllVFRYcVdta25DdzR5REp3ZVMySUxVbVpPSnN5WWhy?=
 =?utf-8?B?aWNlMVNuVlFGT21OU2JmaVJkeTlVWUpSNWE1V0orWkJsRzlIZkFrckQ3cHpv?=
 =?utf-8?B?TmNxd0lsRmVvVEtvN0JZVHdMajMxZmRDQS9tYnppajI1N09ObHo1WE0vZWVt?=
 =?utf-8?B?SStwYWlleVJQRWc4bVZabTVqNnI2Z095ZUZYbEZiTUl3Wlc3aGRnK20zdnEv?=
 =?utf-8?Q?urHqy0FZaM5s9YetKck3PT21dQj0E2dsqKsaUsrSY5ZsU?=
x-ms-exchange-antispam-messagedata-1: x2PCx/iPf5A7AA==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: dCIZ2tocDOJmmTcUs0J4HnJs6VsggU/cwQRjXRIjPAbx1KYLo64N/oyz6sqExQJctn625OsJkRtfetZAh2sp5ebRR53RvW95zuVGGbDa+pPvuQxJAOQgbsCEp4Tt/yzEh4ob41ptFE2o7WRu1vemjBbLkwKGLjWcKl5NiYEpAAio5uKmaXe6ZqCfc8z9fdx8SicnJJrvULUQQ+oMMOyLul04dXAK0pBZAr7nkybvsb4g8w53NOLGzQm99F87qFKLIwWSqwus+gjVhZxvtdVD3ceHS20mF+Ks6pc2LN7uy6Bicb6s8eORP9ZKzND3ptq7XlAKEeeg9+CWqW9TxLxlcA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 944f81f1-030a-42af-1b95-08df34397aeb
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2026 14:49:18.9727 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TTf1WLffZ0Hr1+Gh9WjeO+l3wdpR8WQho+cBI52ks8gbG5uCklkZqt+TC+jst1kFQfoizmUGPZesVxfeCXrbsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5153
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IE1hYXJ0ZW4gTGFua2hvcnN0
IDxkZXZAbGFua2hvcnN0LnNlPg0KPiBTZW50OiBUdWVzZGF5LCBPY3RvYmVyIDI3LCAyMDI2IDM6
MTYgUE0NCj4gVG86IE11cnRoeSwgQXJ1biBSIDxhcnVuLnIubXVydGh5QGludGVsLmNvbT47IGlu
dGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBTdWJqZWN0OiBSZTogW3YyLDEvMl0gZHJt
L3hlL2JvOiBBZGQgeGVfYm9fYWRkcl9pdGVyLg0KPiANCj4gSGV5LA0KPiANCj4gT24gMTAvMjcv
MjYgMDU6MTMsIE11cnRoeSwgQXJ1biBSIHdyb3RlOg0KPiA+DQo+ID4+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+ID4+IEZyb206IE1hYXJ0ZW4gTGFua2hvcnN0IDxkZXZAbGFua2hvcnN0
LnNlPg0KPiA+PiBTZW50OiBGcmlkYXksIE9jdG9iZXIgMjMsIDIwMjYgNToxNiBQTQ0KPiA+PiBU
bzogaW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+ID4+IENjOiBNYWFydGVuIExhbmto
b3JzdCA8ZGV2QGxhbmtob3JzdC5zZT4NCj4gPj4gU3ViamVjdDogW3YyLDEvMl0gZHJtL3hlL2Jv
OiBBZGQgeGVfYm9fYWRkcl9pdGVyLg0KPiA+Pg0KPiA+PiBGb3IgZGlzcGxheSB3ZSBpdGVyYXRl
IG9mdGVuIG92ZXIgdGhlIHBpbm5lZCBWUkFNL3N5c3RlbSBtZW1vcnkgQk8uDQo+ID4+IEFkZCBz
b21lIGNvZGUgdG8gc3BlZWQgdXAgRFBUL0dHVFQgcHJvZ3JhbW1pbmcuDQo+ID4+DQo+ID4+IFNp
Z25lZC1vZmYtYnk6IE1hYXJ0ZW4gTGFua2hvcnN0IDxkZXZAbGFua2hvcnN0LnNlPg0KPiA+PiAt
LS0NCj4gPj4gQ2hhbmdlcyBzaW5jZSB2MToNCj4gPj4gLSBBZGQgZG9jdW1lbnRhdGlvbi4NCj4g
Pj4gLS0tDQo+ID4+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfYm8uYyB8IDY0DQo+ID4+ICsrKysr
KysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tDQo+ID4+ICBkcml2ZXJzL2dwdS9kcm0v
eGUveGVfYm8uaCB8ICAzICsrDQo+ID4+ICAyIGZpbGVzIGNoYW5nZWQsIDQ4IGluc2VydGlvbnMo
KyksIDE5IGRlbGV0aW9ucygtKQ0KPiA+Pg0KPiA+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX2JvLmMgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfYm8uYw0KPiA+PiBpbmRleCAx
MmU1MjNjNjFjMWYzLi5iNTk3MjE4MWE4ZWJkIDEwMDY0NA0KPiA+PiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0veGUveGVfYm8uYw0KPiA+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfYm8uYw0K
PiA+PiBAQCAtMzQzNCwzNyArMzQzNCw2MyBAQCBib29sIHhlX2JvX2lzX3hlX2JvKHN0cnVjdCB0
dG1fYnVmZmVyX29iamVjdA0KPiA+PiAqYm8pDQo+ID4+ICAJcmV0dXJuIGZhbHNlOw0KPiA+PiAg
fQ0KPiA+Pg0KPiA+PiAtLyoNCj4gPj4gLSAqIFJlc29sdmUgYSBCTyBhZGRyZXNzLiBUaGVyZSBp
cyBubyBhc3NlcnQgdG8gY2hlY2sgaWYgdGhlIHByb3Blcg0KPiA+PiBsb2NrIGlzIGhlbGQNCj4g
Pj4gLSAqIHNvIGl0IHNob3VsZCBvbmx5IGJlIHVzZWQgaW4gY2FzZXMgd2hlcmUgaXQgaXMgbm90
IGZhdGFsIHRvIGdldA0KPiA+PiB0aGUgd3JvbmcNCj4gPj4gLSAqIGFkZHJlc3MsIHN1Y2ggYXMg
cHJpbnRpbmcgZGVidWcgaW5mb3JtYXRpb24sIGJ1dCBub3QgaW4gY2FzZXMNCj4gPj4gd2hlcmUg
bWVtb3J5IGlzDQo+ID4+IC0gKiB3cml0dGVuIGJhc2VkIG9uIHRoaXMgcmVzdWx0Lg0KPiA+PiAr
LyoqDQo+ID4+ICsgKiB4ZV9ib19hZGRyX2l0ZXJfZmlyc3QgLSBJdGVyYXRlIG92ZXIgYSBibw0K
PiA+PiArICogQGJvOiBUaGUgQk8NCj4gPj4gKyAqIEBjdXI6IFBvaW50ZXIgdG8gYSAmeGVfcmVz
X2N1cnNvciBmb3IgaXRlcmF0aW9uDQo+ID4+ICsgKiBAb2Zmc2V0OiBPZmZzZXQgaW50byBCTy4N
Cj4gPj4gKyAqIEBzaXplOiBTaXplIG9mIGl0ZXJhdGlvbi4NCj4gPj4gKyAqDQo+ID4+ICsgKiBJ
bml0aWFsaXplcyBAY3VyIGZvciBpdGVyYXRpb24gb3ZlciBhbGwgR1BVIGFkZHJlc3NlcyBpbiB0
aGUNCj4gPj4gK3JhbmdlDQo+ID4+ICsgKiBbQG9mZnNldC4uLkBvZmZzZXQrQHNpemUpLg0KPiA+
PiArICoNCj4gPj4gKyAqIFRoaXMgaXMgdXNlZnVsIGZvciBnZXR0aW5nIHRoZSBHUFUgYWRkcmVz
cyBmb3IgYSByYW5nZSBvZiBwYWdlcywNCj4gPj4gKyAqIHJhdGhlciB0aGFuIGNhbGxpbmcgeGVf
Ym9fYWRkciBzZXBhcmF0ZWx5IGZvciBlYWNoIHBhZ2UuDQo+ID4+ICAgKi8NCj4gPj4gLWRtYV9h
ZGRyX3QgX194ZV9ib19hZGRyKHN0cnVjdCB4ZV9ibyAqYm8sIHU2NCBvZmZzZXQsIHNpemVfdA0K
PiA+PiBwYWdlX3NpemUpDQo+ID4+ICt2b2lkIHhlX2JvX2FkZHJfaXRlcl9maXJzdChzdHJ1Y3Qg
eGVfYm8gKmJvLCBzdHJ1Y3QgeGVfcmVzX2N1cnNvcg0KPiA+PiArKmN1ciwNCj4gPj4gK3U2NCBv
ZmZzZXQsIHU2NCBzaXplKQ0KPiA+PiAgew0KPiA+PiAgCXN0cnVjdCB4ZV9kZXZpY2UgKnhlID0g
eGVfYm9fZGV2aWNlKGJvKTsNCj4gPj4gLQlzdHJ1Y3QgeGVfcmVzX2N1cnNvciBjdXI7DQo+ID4+
IC0JdTY0IHBhZ2U7DQo+ID4+IC0NCj4gPj4gLQl4ZV9hc3NlcnQoeGUsIHBhZ2Vfc2l6ZSA8PSBQ
QUdFX1NJWkUpOw0KPiA+PiAtCXBhZ2UgPSBvZmZzZXQgPj4gUEFHRV9TSElGVDsNCj4gPj4gLQlv
ZmZzZXQgJj0gKFBBR0VfU0laRSAtIDEpOw0KPiA+Pg0KPiA+PiAgCWlmICgheGVfYm9faXNfdnJh
bShibykgJiYgIXhlX2JvX2lzX3N0b2xlbihibykpIHsNCj4gPj4gIAkJeGVfYXNzZXJ0KHhlLCBi
by0+dHRtLnR0bSk7DQo+ID4+DQo+ID4+IC0JCXhlX3Jlc19maXJzdF9zZyh4ZV9ib19zZyhibyks
IHBhZ2UgPDwgUEFHRV9TSElGVCwNCj4gPj4gLQkJCQlwYWdlX3NpemUsICZjdXIpOw0KPiA+PiAt
CQlyZXR1cm4geGVfcmVzX2RtYSgmY3VyKSArIG9mZnNldDsNCj4gPj4gKwkJeGVfcmVzX2ZpcnN0
X3NnKHhlX2JvX3NnKGJvKSwgb2Zmc2V0LCBzaXplLCBjdXIpOw0KPiA+PiAgCX0gZWxzZSB7DQo+
ID4+IC0JCXN0cnVjdCB4ZV9yZXNfY3Vyc29yIGN1cjsNCj4gPj4gKwkJeGVfcmVzX2ZpcnN0KGJv
LT50dG0ucmVzb3VyY2UsIG9mZnNldCwgc2l6ZSwgY3VyKTsNCj4gPj4NCj4gPiBDYW4gdGhpcyB0
cmlnZ2VyIFhFX1dBUk5fT04oc3RhcnQgKyBzaXplID4gcmVzLT5zaXplKSBpbiB4ZV9yZXNfZmly
c3QoKT8NCj4gPg0KPiA+IFRoZSBvbGQgY29kZSB1c2VkIChwYWdlIDw8IFBBR0VfU0hJRlQpIGFz
IHRoZSBzdGFydCwgc28gdGhlIHJhbmdlIHdhcw0KPiA+IGFsd2F5cyBwYWdlIGFsaWduZWQgYW5k
IHN0YXllZCBpbnNpZGUgdGhlIEJPLiBOb3cgdGhlIHJhdyBvZmZzZXQgaXMgdXNlZC4NCj4gPiBJ
ZiBvZmZzZXQgaXMgbm90IHBhZ2UgYWxpZ25lZCwgb2Zmc2V0ICsgcGFnZV9zaXplIGNhbiBnbyBw
YXN0IHRoZSBCTw0KPiA+IHNpemUNCj4gDQo+IEkgZG9uJ3Qgc2VlIHRoZSBwYWdlIHNpemUgYWN0
dWFsbHkgYmVpbmcgdXNlZCBhbnl3aGVyZT8NCj4gDQpUaGUgcGFnZSBzaXplIGlzIHRoZSBzaXpl
IHBhc3NlZCB0byB4ZV9yZXNfZmlyc3QqKCk6IHRoZSBvbGQgY29kZSB1c2VkIHBhZ2UgPDwgUEFH
RV9TSElGVCBhcyBzdGFydCB3aXRoIHNpemUgcGFnZV9zaXplLCBzbyB0aGUgcmFuZ2Ugd2FzIGFs
d2F5cyBpbnNpZGUgdGhlIEJPLiBXaXRoIHRoZSByYXcgb2Zmc2V0IGluIF9feGVfYm9fYWRkcigp
LCBhbiB1bmFsaWduZWQgb2Zmc2V0IGluIHRoZSBsYXN0IHBhZ2UgZ2l2ZXMgb2Zmc2V0ICsgcGFn
ZV9zaXplID4gcmVzLT5zaXplLCB3aGljaCBoaXRzIHRoZSBYRV9XQVJOX09OIGluIHhlX3Jlc19m
aXJzdCgpLg0KDQpJIG1heSBub3QgYmUgZXhwcmVzc2luZyBjbGVhcmx5LiBQbGVhc2UgY2hlY2sg
YmVsb3chDQoNCj4gTG9va3MgbGlrZSB0aGUgY29kZSB3YXMgb3JpZ2luYWxseQ0KPiAgICAgcmV0
dXJuIGJvLT50dG0udHRtLT5kbWFfYWRkcmVzc1twYWdlXSArIG9mZnNldDsNCj4gDQo+IFdoaWNo
IGdvdCBjaGFuZ2VkIGludG86DQo+ICAgICB4ZV9yZXNfZmlyc3Rfc2coeGVfYm9fZ2V0X3NnKGJv
KSwgcGFnZSA8PCBQQUdFX1NISUZULCBwYWdlX3NpemUsICZjdXIpOw0KPiAgICAgcmV0dXJuIHhl
X3Jlc19kbWEoJmN1cikgKyBvZmZzZXQ7DQo+IA0KPiBCdXQgc2luY2UgeGVfcmVzX2RtYSBjdXJy
ZW50bHkgaGFuZGxlcyB0aGlzIGNhc2UsIHRoZXJlIHNob3VsZCBiZSBubyBmdW5jdGlvbmFsDQo+
IGNoYW5nZSB0bzoNCj4gICAgIHhlX3Jlc19maXJzdF9zZyh4ZV9ib19nZXRfc2coYm8pLCBvZmZz
ZXQsIHBhZ2Vfc2l6ZSwgJmN1cik7DQo+ICAgICByZXR1cm4geGVfcmVzX2RtYSgmY3VyKTsNCj4g
DQo+IGttc19iaWdfZmIgc3RpbGwgYWJvcnRzIG9uIHRoaXMgdmVyc2lvbiwgYnV0IGxpa2VseSBu
b3QgYmVjYXVzZSBvZiB0aGlzLg0KPiBNb3JlIGxpa2VseSBpcyBhbm90aGVyIGJ1ZyByZXNpZGlu
ZyBpbnNpZGUgdGhlIGNoYW5nZWQgRFBUIGhlbHBlcnMuDQo+IA0KQWdyZWVkIHRoYXQgdGhlIGtt
c19iaWdfZmIgYWJvcnQgcHJvYmFibHkgY29tZXMgZnJvbSB0aGUgRFBUIGhlbHBlcnMsIGFuZCBJ
J2xsIGxvb2sgdGhlcmUuDQoNCj4gS2luZCByZWdhcmRzLA0KPiB+TWFhcnRlbiBMYW5raG9yc3QN
Cj4gDQo+ID4NCj4gPiBUaGFua3MgYW5kIFJlZ2FyZHMsDQo+ID4gQXJ1biBSIE11cnRoeQ0KPiA+
IC0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ID4NCj4gPj4gLQkJeGVfcmVzX2ZpcnN0KGJvLT50dG0u
cmVzb3VyY2UsIHBhZ2UgPDwgUEFHRV9TSElGVCwNCj4gPj4gLQkJCSAgICAgcGFnZV9zaXplLCAm
Y3VyKTsNCj4gPj4gLQkJcmV0dXJuIGN1ci5zdGFydCArIG9mZnNldCArIHZyYW1fcmVnaW9uX2dw
dV9vZmZzZXQoYm8tDQo+ID4+PiB0dG0ucmVzb3VyY2UpOw0KPiA+PiArCQl4ZV9hc3NlcnQoeGUs
ICFjdXItPmRtYV9hZGRyKTsNCj4gPj4gKwkJY3VyLT5kbWFfc3RhcnQgPSB2cmFtX3JlZ2lvbl9n
cHVfb2Zmc2V0KGJvLT50dG0ucmVzb3VyY2UpOw0KPiA+PiAgCX0NCj4gPj4gIH0NCj4gPj4NCj4g
Pj4gKy8qKg0KPiA+PiArICogeGVfYm9fYWRkcl9pdGVyX2FkZHIgLSBHZXQgdGhlIEJPJ3MgR1BV
IGFkZHJlc3MgYXQgY3VycmVudCBjdXJzb3IuDQo+ID4+ICsgKiBAY3VyOiBQb2ludGVyIHRvIGEg
JnhlX3Jlc19jdXJzb3IgaW5pdGlhbGl6ZWQgYnkNCj4gPj4gK3hlX2JvX2FkZHJfaXRlcl9maXJz
dCgpDQo+ID4+ICsgKg0KPiA+PiArICogUmV0dXJuczogYSA2NC1iaXRzIERNQSBhZGRyZXNzIGZv
ciB1c2FnZSBvbiB0aGUgZGV2aWNlLg0KPiA+PiArICovDQo+ID4+ICtkbWFfYWRkcl90IHhlX2Jv
X2FkZHJfaXRlcl9hZGRyKHN0cnVjdCB4ZV9yZXNfY3Vyc29yICpjdXIpIHsNCj4gPj4gKwlpZiAo
Y3VyLT5tZW1fdHlwZSA9PSBYRV9QTF9UVCkNCj4gPj4gKwkJcmV0dXJuIHhlX3Jlc19kbWEoY3Vy
KTsNCj4gPj4gKw0KPiA+PiArCXJldHVybiBjdXItPnN0YXJ0ICsgY3VyLT5kbWFfc3RhcnQ7IH0N
Cj4gPj4gKw0KPiA+PiArLyoNCj4gPj4gKyAqIFJlc29sdmUgYSBCTyBhZGRyZXNzLiBUaGVyZSBp
cyBubyBhc3NlcnQgdG8gY2hlY2sgaWYgdGhlIHByb3Blcg0KPiA+PiArbG9jayBpcyBoZWxkDQo+
ID4+ICsgKiBzbyBpdCBzaG91bGQgb25seSBiZSB1c2VkIGluIGNhc2VzIHdoZXJlIGl0IGlzIG5v
dCBmYXRhbCB0byBnZXQNCj4gPj4gK3RoZSB3cm9uZw0KPiA+PiArICogYWRkcmVzcywgc3VjaCBh
cyBwcmludGluZyBkZWJ1ZyBpbmZvcm1hdGlvbiwgYnV0IG5vdCBpbiBjYXNlcw0KPiA+PiArd2hl
cmUgbWVtb3J5IGlzDQo+ID4+ICsgKiB3cml0dGVuIGJhc2VkIG9uIHRoaXMgcmVzdWx0Lg0KPiA+
PiArICovDQo+ID4+ICtkbWFfYWRkcl90IF9feGVfYm9fYWRkcihzdHJ1Y3QgeGVfYm8gKmJvLCB1
NjQgb2Zmc2V0LCBzaXplX3QNCj4gPj4gK3BhZ2Vfc2l6ZSkgew0KPiA+PiArCXN0cnVjdCB4ZV9y
ZXNfY3Vyc29yIGN1cjsNCj4gPj4gKw0KPiA+PiArCXhlX2JvX2FkZHJfaXRlcl9maXJzdChibywg
JmN1ciwgb2Zmc2V0LCBwYWdlX3NpemUpOw0KDQpXaGF0IEkgbWVhbnQgd2FzDQoNCiAgICAgICAg
LyoNCiAgICAgICAgICogU3RhcnQgdGhlIGl0ZXJhdGlvbiBvbiBhIHBhZ2UgYm91bmRhcnkgc28g
W3N0YXJ0LCBzdGFydCArIHBhZ2Vfc2l6ZSkNCiAgICAgICAgICogc3RheXMgaW5zaWRlIHRoZSBC
TywgdGhlbiBhZGQgdGhlIHN1Yi1wYWdlIG9mZnNldCBiYWNrLg0KICAgICAgICAgKi8NCiAgICAg
ICAgeGVfYm9fYWRkcl9pdGVyX2ZpcnN0KGJvLCAmY3VyLCBvZmZzZXQgJiBQQUdFX01BU0ssIHBh
Z2Vfc2l6ZSk7DQoNClRoYW5rcyBhbmQgUmVnYXJkcywNCkFydW4gUiBNdXJ0aHkNCi0tLS0tLS0t
LS0tLS0tLS0tLS0tLQ0KPiA+PiArCXJldHVybiB4ZV9ib19hZGRyX2l0ZXJfYWRkcigmY3VyKTsN
Cj4gPj4gK30NCj4gPj4gKw0KPiA+PiAgZG1hX2FkZHJfdCB4ZV9ib19hZGRyKHN0cnVjdCB4ZV9i
byAqYm8sIHU2NCBvZmZzZXQsIHNpemVfdCBwYWdlX3NpemUpICB7DQo+ID4+ICAJaWYgKCFSRUFE
X09OQ0UoYm8tPnR0bS5waW5fY291bnQpKQ0KPiA+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX2JvLmggYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfYm8uaA0KPiA+PiBpbmRleA0K
PiA+PiA3N2IzYTAyZTliOGViLi4yODZmNTIyMjViYzc5IDEwMDY0NA0KPiA+PiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0veGUveGVfYm8uaA0KPiA+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVf
Ym8uaA0KPiA+PiBAQCAtMTEzLDYgKzExMyw3IEBAIGVudW0geGVfbWFkdl9wdXJnZWFibGVfc3Rh
dGUgeyAgfTsNCj4gPj4NCj4gPj4gIHN0cnVjdCBzZ190YWJsZTsNCj4gPj4gK3N0cnVjdCB4ZV9y
ZXNfY3Vyc29yOw0KPiA+Pg0KPiA+PiAgc3RydWN0IHhlX2JvICp4ZV9ib19hbGxvYyh2b2lkKTsN
Cj4gPj4gIHZvaWQgeGVfYm9fZnJlZShzdHJ1Y3QgeGVfYm8gKmJvKTsNCj4gPj4gQEAgLTM3NSw2
ICszNzYsOCBAQCBzdGF0aWMgaW5saW5lIHZvaWQgeGVfYm9fdW5waW5fbWFwX25vX3ZtKHN0cnVj
dA0KPiA+PiB4ZV9ibyAqYm8pICB9DQo+ID4+DQo+ID4+ICBib29sIHhlX2JvX2lzX3hlX2JvKHN0
cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8pOw0KPiA+PiArdm9pZCB4ZV9ib19hZGRyX2l0ZXJf
Zmlyc3Qoc3RydWN0IHhlX2JvICpibywgc3RydWN0IHhlX3Jlc19jdXJzb3INCj4gPj4gKypjdXIs
DQo+ID4+ICt1NjQgb2Zmc2V0LCB1NjQgc2l6ZSk7IGRtYV9hZGRyX3QgeGVfYm9fYWRkcl9pdGVy
X2FkZHIoc3RydWN0DQo+ID4+ICt4ZV9yZXNfY3Vyc29yICpjdXIpOw0KPiA+PiAgZG1hX2FkZHJf
dCBfX3hlX2JvX2FkZHIoc3RydWN0IHhlX2JvICpibywgdTY0IG9mZnNldCwgc2l6ZV90DQo+ID4+
IHBhZ2Vfc2l6ZSk7IGRtYV9hZGRyX3QgeGVfYm9fYWRkcihzdHJ1Y3QgeGVfYm8gKmJvLCB1NjQg
b2Zmc2V0LA0KPiA+PiBzaXplX3QgcGFnZV9zaXplKTsNCj4gPj4NCg0K
