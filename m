Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D491C3DA4A
	for <intel-xe@archiver.kernel.org>; Mon, 19 Aug 2024 14:34:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB41110E2A7;
	Mon, 19 Aug 2024 14:34:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FB/nPUkh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81EAE10E2A9
 for <intel-xe@lists.freedesktop.org>; Mon, 19 Aug 2024 14:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724078043; x=1755614043;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=S1rqlAS4rE6Tu8yyuDxDjMpQKZpIM6qK3y2TUZu9RGo=;
 b=FB/nPUkhOUbQH/mBMJpE4a/wRXN9heVmBY50W7EORnMDaWmE0wKEm35X
 QMgSpfixu3HVSJUIrR41k6c+PxosEVLumWcHAJYCFEnFguVYsb4g9+6SQ
 quDkm776tI+CfI8eRqc1OS4OuYOFTJe7BY+sbrtXYdZIJx7Olfrqelzyd
 NhujrdFgzkbtQT0lmRvghztwn5yY9A+iV4Q+GpTVxxcKzpq4DCreQb+Kx
 70+5X0Uxpq/F3NZ5vCaMja4AllhSWQTQnI4kv6jK3W2FHFjXS9dbCDyYb
 2uLh/Kb+nJdlSyLnTBFEoPPV9cV1yk2ysGagsyGpCVGULqwSHdDLL2Kpy g==;
X-CSE-ConnectionGUID: x7sj47CeRQiTcIsQo8yrRg==
X-CSE-MsgGUID: BRIJy4y9SSqY2UZ1pe5OkQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="26123580"
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; d="scan'208";a="26123580"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 07:34:02 -0700
X-CSE-ConnectionGUID: hUNfTsgSTiu7UcPBI8l3Dg==
X-CSE-MsgGUID: tnSl7xu3SvCWoUYdVvnG/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; d="scan'208";a="61171619"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Aug 2024 07:34:02 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 19 Aug 2024 07:34:01 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 19 Aug 2024 07:33:46 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 19 Aug 2024 07:33:46 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 19 Aug 2024 07:33:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FEJwXkbcvZAkPefUln7lFVlF37XbHUKe8YtEX2/FqdSk2bocD3idDOYfvlorpdgnlG0R79VWUgyGaOidpetQ+Sy562vE10L3oG9tCpizhBLmF1pdMUVz1H4vaLbwLLnaD5T5/xkzm3SKQpkQ0XoIGhCXRd0mQwJTjdnXS8RlHdVaevGCnHVvGZ4roln6Fgzvc7o91LUXq/p7vMEEfVhxF6ru9OVQvZ4l7fdcbsu5c6Ns4UERouiM5SUkkbFE7xYkRGBsRYVyffa9Bwfqxdk2HLyec1z/tcu99M/4tAbB1/r8+8iMKGYsTqBiX0GL72QoGtEBy9ZInqC25c4F5SL36w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S1rqlAS4rE6Tu8yyuDxDjMpQKZpIM6qK3y2TUZu9RGo=;
 b=I1nQ44nny7MeZDhjGXEV05oHiaP9FLQEfzTmdtzxLZC9JjqlEoJ9b1tS45QEF9CQ9XwdlH6YDWKoHrjt3Ubt1ob6/mtWhO56eu7jalChKj/agvTFVfUMOybvzkJa5FLAx5DOqLiZPK0FrPO2t/f3+NJtSgp01efV0FcbQ0IkSQTNoMj0y/ZHLuzC/w8R4YtyfZspKCEHfkPqk7qmDYBqhYeQI/JJcT0lx8EXmAXUBzr3v62MtmA2kLEa7Z5veKdt/VMka+kUtTD3bTbgw6cLVE0EBnpNpGRUufDrbO/GLYyD91ohB0QeqDef9ysxu9C+ay5L5UZbEseqe8SRCRzdbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by CY8PR11MB7729.namprd11.prod.outlook.com (2603:10b6:930:70::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 19 Aug
 2024 14:33:44 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba%3]) with mapi id 15.20.7875.019; Mon, 19 Aug 2024
 14:33:43 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
CC: "Brost, Matthew" <matthew.brost@intel.com>, "Harrison, John C"
 <john.c.harrison@intel.com>, "Teres Alexis, Alan Previn"
 <alan.previn.teres.alexis@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v2 00/12] Add PXP HWDRM support
Thread-Topic: [PATCH v2 00/12] Add PXP HWDRM support
Thread-Index: AQHa8A66xDI/tgRAU0C7GO9aP1+217IuqXWA
Date: Mon, 19 Aug 2024 14:33:43 +0000
Message-ID: <53dc77fd622e26d794813c9d5b9c9da71be8412e.camel@intel.com>
References: <20240816190024.2176976-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20240816190024.2176976-1-daniele.ceraolospurio@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|CY8PR11MB7729:EE_
x-ms-office365-filtering-correlation-id: 8a9b2b3f-19b8-40bc-bda7-08dcc05bed56
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?STFsSWtnTzl1T0NmOW9iRVV0OUMxV3VUNEhycGphazhpUmYzRDNZS3hqcldD?=
 =?utf-8?B?c0VPTm9WUm5kRU92ZzBRanFhOUw5MzJ1WVNsT3ROSTFDTkVtS2haUklMOUlP?=
 =?utf-8?B?S2k5ckxWWU0zYTVaaTVHSnVXcmUvdytiWm1BeVhnYWVyUnNUcExLay93eURU?=
 =?utf-8?B?NzlLbGFzdkIvdmZybTZxaDN5QlhVKzBDc0xIZHk3eWpKREZJUFJDaWo1Tlln?=
 =?utf-8?B?ZHpNZXBYYXV0andTZ04xZ3VpaDErMTVjdWszNnVUd1lDQ0g3SFkzYmxkVVFZ?=
 =?utf-8?B?b1k3K3R3UHkzTTBuZTF5NGM5YjBhUGdiaVFab2VmeWRQMlp3QktFUmJpSkln?=
 =?utf-8?B?Yi9hTjR5ZldDRlkvd01RaTBIeUxVZzJiQVJST2hYUUV2Y0RVTnpyVTdkVDA1?=
 =?utf-8?B?RjlVN213ZzFkY0YrenV0cDNrOVl1VXJZcTlXdm5uMU90MUpObEZ3dFp1aXVo?=
 =?utf-8?B?TUJ5QVlwY1NWckZXdXJTZTVSdXhHeWlaR1prV21JUzhYQlVSaDlPNGRrNjlG?=
 =?utf-8?B?MUJueTlwNnhaRkFFM0NZRTlMOTh2QS9YUUVaMFphdWFkYnd3V05sdVY2V1Zy?=
 =?utf-8?B?MU9ESnl1bjRqWUlNSWZRQ010SE9PbHpBMUdzbHNPemF2M2lvL2NTN2xNU0J5?=
 =?utf-8?B?QTVyS2NaM0RITTZ0V3NZSUkwMFUvMk4yK0UwdzFxdi83dndiZlVsbjltSC9O?=
 =?utf-8?B?U3kxZTZsdk5JS1JIL2hXK25KdmFIc0JuNHlXUzRPQlNHdklUU04wem5Semkr?=
 =?utf-8?B?ZGxJbWp3Z3JkS3IyeXVueVR3SzZvRFA5RmkwbWprQmNKTml4ZDJaanJGdHE4?=
 =?utf-8?B?VEdXdUs1eW4yWm1hYkwzckxVYnd5VmJUVytkOUdwWCtYMHNvNFR6alo1QUlt?=
 =?utf-8?B?OUc2dEF6UzF1TWJDdFVuOW9YSGdjZkxGSjNRWmVhWjVmNFhGWC96NGxydjFL?=
 =?utf-8?B?SlZ5STR0L2tFWU5vT1lhYXV4NFU5SVliUEt5cEQ3Z3dQdkxIaVBCaWg3SEJE?=
 =?utf-8?B?alVXUzBXdyt2YWZPWmNaN1Z2cWp5eVhodzdVV09YME4wSzB4Y1psblR5RjRP?=
 =?utf-8?B?RjlwS3NaWExNZGV1Rkx4cE1zcUpRTDE0RU00MkR6cnFaSVVpbmJFd3BHd2FG?=
 =?utf-8?B?bWphUGtaOS9FSlBZaVRVaXNQdjBLRElxaWZVWXZmRXBRZGRsb0VnOXZEekJF?=
 =?utf-8?B?cWVFRm9PUVE2UFhpRmttYWpJTi8xQmRua2h6UFUxY1VKcGVWcHdYQy9IcFp2?=
 =?utf-8?B?anlJa0h0aTNmbDBSdVVZbzFSbSs4QUQ5dUF5K1czTnFCM2xlRmJEZU1UNXAz?=
 =?utf-8?B?LzkzM1lBdGs5UmRhSUFuRUpRZ3ZDeEk1dSs1emhQQi9zSXdqaWs5VWxuNWJQ?=
 =?utf-8?B?MFhmNkMwNTFrNjBoY1U4Mldhd2c3WmY3WDlMWmtqeDNWT0ZKRTJ5Y0hhUHNL?=
 =?utf-8?B?KzU3R0RHOVcxdWlmVzlmTFVPNFVUVDhMU0ErQ3VXLzVwSmhpdWxYRTVBTDRL?=
 =?utf-8?B?ZFp6STJoU0ZiamlvYzhsTFp6cW9lbkRVa1pQalRmZTRzZWlodmRnaHhlZVc0?=
 =?utf-8?B?d2VCQ3NFbGU1c3hwd2pra3pCOFNNWXBYOGdDYVJ5N05xYUtML3NxcDlDRlU3?=
 =?utf-8?B?dExoNDEwOWFQdXRYNDBzK2RMak1QRUlIb2MrSXRXZnZ5SWtXODBOY2dvMVhh?=
 =?utf-8?B?STAzUXN1UEoxVjNTRDlIbTFrTmhQQTAxZnNFT0p2eUZ5M3RhYnFDUjNsaG9k?=
 =?utf-8?B?U0tvR1lRNWVpa1JMSmJBU2VWbDJEZUMyNUxsVXlHOWZGTmhhdDEwNTRtcWJS?=
 =?utf-8?B?U3dmeTVMQlY3REFwcnVkUT09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MUJRek01enRxL0RwVzBDNzRINytqQ1UvMm81VTBHeUUrN3dQaVNaUGZxbWZq?=
 =?utf-8?B?T2dsZTBJdm9YZE94WGxHY3VReGk3REJwejBFa3NweFN2Y3FQanpydjFuK0xo?=
 =?utf-8?B?cnVVYVFyOTlrUEdnQUd6UElhbC9FTGxuR0lhL1ZSOExxUC8xcE9zRnRhQzMy?=
 =?utf-8?B?ckJyVHkwV1liQk03MWo4N2g2U3VKakZPUjhGNW1ubVM4b2tYSnAyN2hzZ1h2?=
 =?utf-8?B?a0d6UWZDVUlpa2lrbmpJS0h2Z0xITjRjSGV6Z05KNVd4NFptbXlnaVVpTWJv?=
 =?utf-8?B?ZURoanZqWXpjYjErWFlCZmczc3dBZ1d3TUZGaXo1NzEwTzhESFl0cHByVGYr?=
 =?utf-8?B?WU5sNVBwTHZkakJZUUZCNU1vNDJtazE3TGdVL3dUa2Vja3dNbEI1UzlDREZR?=
 =?utf-8?B?VjNjOGJ1aU5aUExFM05vT2sxZzg1NWs3ZDhnYUl5Q3MxSENWa1lERy9EZEQv?=
 =?utf-8?B?V3ZCUXhBVWxBV3NhU09XYzFIRE5zZUVWMEpYU2xxeWh4OTAwb05kYmxhbHVU?=
 =?utf-8?B?eGxucEpDRXhCVGxhYUEyTlZwSTlvZlFDTE5CaEEremg2b093SWlEZ1JFVS93?=
 =?utf-8?B?RFNxYWZyY1FJUDFmNWM0c2N5TDlITnErcXNqMG10QnNDMjRNQ0ZFMDh6ZnNw?=
 =?utf-8?B?ZS9OdXU5OElBTGFRd1orRDc2blZzZmJCUFlSd05aSkFsYS9sS3VGM3JTcjJI?=
 =?utf-8?B?NjQyczdqSTNteDBwRk0xYkgxQU1CMzlFcGYrQ1FTc0xXQ3cyL24zTk9Nak1Y?=
 =?utf-8?B?MDVncXJtWWREbFVxRnJma3VaYU5HSlNZdEtKNTRlVzluYWsveThTWTlsWmM0?=
 =?utf-8?B?dm5IenllVXRyL3Q1bmpNSG5TcmJEak1PMGNIK1g3cGtyWGRNNTNCT2JhUjBX?=
 =?utf-8?B?dWpleHhKc2NCbStuR1FBUUFQYjNpVi9zczlDZTg3VjBnNlIvbXpFbWRGM3RI?=
 =?utf-8?B?b05GelF3SGxKcldTMUdzMnpiWFBZcW1hV0ZIMDZ3ZS82YUhBVVI1b2RCL0FE?=
 =?utf-8?B?L2R0bTVYVktpVEFBVFlJdWFQdjdGemVoL3h2dFY3bDlLOE9vQVY2L3lsc0xG?=
 =?utf-8?B?MGlFcWVtbEJsdktNRXZ0K2ltQXJYRVAwdUFsWDhZTTZNZFB3eDljcGM0cWRC?=
 =?utf-8?B?RGhGc2I1MjFvRUtlZXliVEpWU3NjVERra1NhUElTNEpHZEcvWllsMlhWV2ZZ?=
 =?utf-8?B?VUI2L200V2RMa3pINEdNTHJMMXhYL2U4amRvVUtGVmJ1R1lTRmh2MjFVdHBn?=
 =?utf-8?B?SS9oQTFESjhqbDdZN3ZEWWFoeGIySVdSY1VHQjMxY045dXljOHR2T2NSWDA2?=
 =?utf-8?B?UkVGWmhZcEtWbWJLTTBLNHhLN0NoYmlUNXJvSEpRQjJxMzVjcXN4aHZPUWlz?=
 =?utf-8?B?MzQ1a2FBeXdkZ2p1S1hVdnVLQ0lsUVBjNnRkcVJjMXNzeHRFNnc4ZmJkajEw?=
 =?utf-8?B?TVdTZ25OVDd4b0JqdWw5clMvbjJyVnV3V3YzaDJXUXFlZlBSY2s1R1dnS292?=
 =?utf-8?B?V29iYW1Ya2VLcXllUFhGVENBUVVmZVhaWm9MdXJXMVd1WFBpaTZOZk4xaFlP?=
 =?utf-8?B?MmI5WFMzUVVvNW9wQ2FrQ1N5ZHVkZ2YrS2J5ME1DeEdCUFFKMklnYXFZV1hR?=
 =?utf-8?B?ZXg2MWNnQ1dEdU5nbldxaXJnUHFFT0I5bGN3THJPZVNDbzJNc0gwd1JZMmdX?=
 =?utf-8?B?SEs4V29iNm5wQ3dqWTJjTzlYUmdWcjZnMTJPem9YRU9KNUZoZElMNDBtSjBG?=
 =?utf-8?B?OGJocGdJd3l3djcwV3lvYU1RMlBpVlN4ZFdtNi96WDJDTVJ2SFhCZFd5QW5y?=
 =?utf-8?B?eGFYM3hnL2h0WmQwRGJwbXVydk1aVjdqbE5FeUtwRmw3UjAvMUlpSkptYzNH?=
 =?utf-8?B?YS80VUhQaldZckxjQjVMcGNhOUNjZDBmYkdoMVVJUWQvOUNITDFDelZMSitL?=
 =?utf-8?B?ZVNMWFRJUVVpTmtlS205YXNXWTRYaHdkWUdGWXBaR0dzVVRiR0ZsTVNTc0VE?=
 =?utf-8?B?SDZWcndYeWFRZFA4cEE3Nmw0VDFBa2NEUGVQd3BSSDBjSFpDZ2Fub2FQUDNo?=
 =?utf-8?B?MXJpd1dqakd0bmRlUEszMmd6azRpaURXajkvaCtOM1BKR1V4ckRSa3pNd1Vm?=
 =?utf-8?B?U21GYlRmNzFEK25lblk4dEhKU0w4bUpvNnF6eXZsN29rUkhIR3UxUGtBeHNa?=
 =?utf-8?B?cUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C3BBB6EF4F611A419F2C7DD36035E617@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a9b2b3f-19b8-40bc-bda7-08dcc05bed56
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2024 14:33:43.5863 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WH5eUQdfpIQCer1Yc8d0PvieJLz11fpdRtQkNKGW0XmnWfCbiLxA0b2xo4pqhQzFqMM3U3+ISGb3BX1U1P+1AA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7729
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

T24gRnJpLCAyMDI0LTA4LTE2IGF0IDEyOjAwIC0wNzAwLCBEYW5pZWxlIENlcmFvbG8gU3B1cmlv
IHdyb3RlOg0KPiBQWFAgKFByb3RlY3RlZCBYZSBQYXRoKSBhbGxvd3MgZXhlY3V0aW9uIGFuZCBm
bGlwIHRvIGRpc3BsYXkgb2YgcHJvdGVjdGVkDQo+IChpLmUuIGVuY3J5cHRlZCkgb2JqZWN0cy4g
VGhlIEhXIHN1cHBvcnRzIG11bHRpcGxlIHR5cGVzIG9mIFBYUCwgYnV0DQo+IHRoaXMgc2VyaWVz
IG9ubHkgaW50cm9kdWNlcyBzdXBwb3J0IGZvciBQWFAgSFdEUk0sIHdoaWNoIGlzIG1haW5seQ0K
PiB0YXJnZXRlZCBhdCBlbmNyeXB0aW5nIGRhdGEgdGhhdCBpcyBnb2luZyB0byBiZSBkaXNwbGF5
ZWQuDQo+IA0KPiBFdmVuIHRob3VnaCB3ZSBvbmx5IHBsYW4gdG8gc3VwcG9ydCAxIHR5cGUgb2Yg
UFhQIGZvciBub3csIHRoZSBpbnRlcmZhY2UNCj4gaGFzIGJlZW4gZGVzaWduZWQgdG8gYWxsb3cg
c3VwcG9ydCBmb3Igb3RoZXIgUFhQIHR5cGVzIHRvIGJlIGFkZGVkIGF0IGENCj4gbGF0ZXIgcG9p
bnQgaW4gdGltZS4NCj4gDQo+IEEgdXNlciBpcyBleHBlY3RlZCB0byBtYXJrIGJvdGggQk8gYW5k
IGV4ZWNfcXVldWVzIGFzIHVzaW5nIFBYUCBhbmQgdGhlDQo+IGRyaXZlciB3aWxsIG1ha2Ugc3Vy
ZSB0aGF0IFBYUCBpcyBydW5uaW5nLCB0aGF0IHRoZSBlbmNyeXB0aW9uIGlzDQo+IHZhbGlkIGFu
ZCB0aGF0IG5vIGV4ZWN1dGlvbiBoYXBwZW5zIHdpdGggYW4gb3V0ZGF0ZWQgZW5jcnlwdGlvbi4N
Cj4gDQo+IHYyOiBjb2RlIGNsZWFuZWQgdXAgYW5kIGZpeGVkIHdoaWxlIGNvbWluZyBvdXQgb2Yg
UkZDLCBhZGRyZXNzZWQgcmV2aWV3DQo+IGZlZWRiYWNrIGluIHJlZ2FyZHMgdG8gdGhlIGludGVy
ZmFjZS4NCg0KdUFQSSBpcyBBY2tlZC1ieTogSm9zw6kgUm9iZXJ0byBkZSBTb3V6YSA8am9zZS5z
b3V6YUBpbnRlbC5jb20+DQpIZXJlIHRoZSBNZXNhIHNpZGU6IGh0dHBzOi8vZ2l0bGFiLmZyZWVk
ZXNrdG9wLm9yZy9tZXNhL21lc2EvLS9tZXJnZV9yZXF1ZXN0cy8zMDcyMw0KDQoNCj4gDQo+IENj
OiBKb3PDqSBSb2JlcnRvIGRlIFNvdXphIDxqb3NlLnNvdXphQGludGVsLmNvbT4NCj4gQ2M6IEFs
YW4gUHJldmluIDxhbGFuLnByZXZpbi50ZXJlcy5hbGV4aXNAaW50ZWwuY29tPg0KPiBDYzogTWF0
dGhldyBCcm9zdCA8bWF0dGhldy5icm9zdEBpbnRlbC5jb20+DQo+IENjOiBUaG9tYXMgSGVsbHN0
csO2bSA8dGhvbWFzLmhlbGxzdHJvbUBsaW51eC5pbnRlbC5jb20+DQo+IENjOiBKb2huIEhhcnJp
c29uIDxKb2huLkMuSGFycmlzb25ASW50ZWwuY29tPg0KPiANCj4gRGFuaWVsZSBDZXJhb2xvIFNw
dXJpbyAoMTIpOg0KPiAgIGRybS94ZS9weHA6IEluaXRpYWxpemUgUFhQIHN0cnVjdHVyZSBhbmQg
S0NSIHJlZw0KPiAgIGRybS94ZS9weHA6IEFsbG9jYXRlIFBYUCBleGVjdXRpb24gcmVzb3VyY2Vz
DQo+ICAgZHJtL3hlL3B4cDogQWRkIFZDUyBpbmxpbmUgdGVybWluYXRpb24gc3VwcG9ydA0KPiAg
IGRybS94ZS9weHA6IEFkZCBHU0Mgc2Vzc2lvbiBpbnZhbGlkYXRpb24gc3VwcG9ydA0KPiAgIGRy
bS94ZS9weHA6IEhhbmRsZSB0aGUgUFhQIHRlcm1pbmF0aW9uIGludGVycnVwdA0KPiAgIGRybS94
ZS9weHA6IEFkZCBHU0Mgc2Vzc2lvbiBpbml0aWFsaXphdGlvbiBzdXBwb3J0DQo+ICAgZHJtL3hl
L3B4cDogQWRkIHNwcG9ydCBmb3IgUFhQLXVzaW5nIHF1ZXVlcw0KPiAgIGRybS94ZS9weHA6IGFk
ZCBhIHF1ZXJ5IGZvciBQWFAgc3RhdHVzDQo+ICAgZHJtL3hlL3B4cDogQWRkIEFQSSB0byBtYXJr
IGEgQk8gYXMgdXNpbmcgUFhQDQo+ICAgZHJtL3hlL3B4cDogYWRkIFBYUCBQTSBzdXBwb3J0DQo+
ICAgZHJtL3hlL3B4cDogQWRkIFBYUCBkZWJ1Z2ZzIHN1cHBvcnQNCj4gICBkcm0veGUvcHhwOiBF
bmFibGUgUFhQIGZvciBNVEwgYW5kIExOTA0KPiANCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS9NYWtl
ZmlsZSAgICAgICAgICAgICAgICAgICB8ICAgMyArDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUvYWJp
L2dzY19weHBfY29tbWFuZHNfYWJpLmggfCAgNDAgKw0KPiAgLi4uL3hlL2NvbXBhdC1pOTE1LWhl
YWRlcnMvcHhwL2ludGVsX3B4cC5oICAgIHwgIDE0ICstDQo+ICAuLi4vZ3B1L2RybS94ZS9pbnN0
cnVjdGlvbnMveGVfaW5zdHJfZGVmcy5oICAgfCAgIDEgKw0KPiAgLi4uL2dwdS9kcm0veGUvaW5z
dHJ1Y3Rpb25zL3hlX21meF9jb21tYW5kcy5oIHwgIDI5ICsNCj4gIC4uLi9ncHUvZHJtL3hlL2lu
c3RydWN0aW9ucy94ZV9taV9jb21tYW5kcy5oICB8ICAgNSArDQo+ICBkcml2ZXJzL2dwdS9kcm0v
eGUvcmVncy94ZV9lbmdpbmVfcmVncy5oICAgICAgfCAgIDEgKw0KPiAgZHJpdmVycy9ncHUvZHJt
L3hlL3JlZ3MveGVfZ3RfcmVncy5oICAgICAgICAgIHwgICA4ICsNCj4gIGRyaXZlcnMvZ3B1L2Ry
bS94ZS9yZWdzL3hlX3B4cF9yZWdzLmggICAgICAgICB8ICAyMyArDQo+ICBkcml2ZXJzL2dwdS9k
cm0veGUveGVfYm8uYyAgICAgICAgICAgICAgICAgICAgfCAxMDAgKystDQo+ICBkcml2ZXJzL2dw
dS9kcm0veGUveGVfYm8uaCAgICAgICAgICAgICAgICAgICAgfCAgIDUgKw0KPiAgZHJpdmVycy9n
cHUvZHJtL3hlL3hlX2JvX3R5cGVzLmggICAgICAgICAgICAgIHwgICAzICsNCj4gIGRyaXZlcnMv
Z3B1L2RybS94ZS94ZV9kZWJ1Z2ZzLmMgICAgICAgICAgICAgICB8ICAgMyArDQo+ICBkcml2ZXJz
L2dwdS9kcm0veGUveGVfZGV2aWNlLmMgICAgICAgICAgICAgICAgfCAgIDYgKw0KPiAgZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX2RldmljZV90eXBlcy5oICAgICAgICAgIHwgICA4ICstDQo+ICBkcml2
ZXJzL2dwdS9kcm0veGUveGVfZXhlYy5jICAgICAgICAgICAgICAgICAgfCAgIDYgKw0KPiAgZHJp
dmVycy9ncHUvZHJtL3hlL3hlX2V4ZWNfcXVldWUuYyAgICAgICAgICAgIHwgIDYxICstDQo+ICBk
cml2ZXJzL2dwdS9kcm0veGUveGVfZXhlY19xdWV1ZS5oICAgICAgICAgICAgfCAgIDUgKw0KPiAg
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX2V4ZWNfcXVldWVfdHlwZXMuaCAgICAgIHwgICA4ICsNCj4g
IGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9od19lbmdpbmUuYyAgICAgICAgICAgICB8ICAgMiArLQ0K
PiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2lycS5jICAgICAgICAgICAgICAgICAgIHwgIDIwICst
DQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfbHJjLmMgICAgICAgICAgICAgICAgICAgfCAgMTYg
Ky0NCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9scmMuaCAgICAgICAgICAgICAgICAgICB8ICAg
NyArLQ0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3BjaS5jICAgICAgICAgICAgICAgICAgIHwg
ICA0ICsNCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9wbS5jICAgICAgICAgICAgICAgICAgICB8
ICA0MiArLQ0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3B4cC5jICAgICAgICAgICAgICAgICAg
IHwgNzM4ICsrKysrKysrKysrKysrKysrKw0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3B4cC5o
ICAgICAgICAgICAgICAgICAgIHwgIDMzICsNCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9weHBf
ZGVidWdmcy5jICAgICAgICAgICB8IDEyMCArKysNCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9w
eHBfZGVidWdmcy5oICAgICAgICAgICB8ICAxMyArDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVf
cHhwX3N1Ym1pdC5jICAgICAgICAgICAgfCA1NzIgKysrKysrKysrKysrKysNCj4gIGRyaXZlcnMv
Z3B1L2RybS94ZS94ZV9weHBfc3VibWl0LmggICAgICAgICAgICB8ICAyMiArDQo+ICBkcml2ZXJz
L2dwdS9kcm0veGUveGVfcHhwX3R5cGVzLmggICAgICAgICAgICAgfCAxMjMgKysrDQo+ICBkcml2
ZXJzL2dwdS9kcm0veGUveGVfcXVlcnkuYyAgICAgICAgICAgICAgICAgfCAgMzIgKw0KPiAgZHJp
dmVycy9ncHUvZHJtL3hlL3hlX3Jpbmdfb3BzLmMgICAgICAgICAgICAgIHwgICA0ICstDQo+ICBk
cml2ZXJzL2dwdS9kcm0veGUveGVfdm0uYyAgICAgICAgICAgICAgICAgICAgfCAxNzAgKysrLQ0K
PiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZtLmggICAgICAgICAgICAgICAgICAgIHwgICA4ICsN
Cj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV92bV90eXBlcy5oICAgICAgICAgICAgICB8ICAgMSAr
DQo+ICBpbmNsdWRlL3VhcGkvZHJtL3hlX2RybS5oICAgICAgICAgICAgICAgICAgICAgfCAgOTQg
KystDQo+ICAzOCBmaWxlcyBjaGFuZ2VkLCAyMzA3IGluc2VydGlvbnMoKyksIDQzIGRlbGV0aW9u
cygtKQ0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS94ZS9pbnN0cnVjdGlv
bnMveGVfbWZ4X2NvbW1hbmRzLmgNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9k
cm0veGUvcmVncy94ZV9weHBfcmVncy5oDQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9n
cHUvZHJtL3hlL3hlX3B4cC5jDQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJt
L3hlL3hlX3B4cC5oDQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL3hlL3hl
X3B4cF9kZWJ1Z2ZzLmMNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0veGUv
eGVfcHhwX2RlYnVnZnMuaA0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS94
ZS94ZV9weHBfc3VibWl0LmMNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0v
eGUveGVfcHhwX3N1Ym1pdC5oDQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJt
L3hlL3hlX3B4cF90eXBlcy5oDQo+IA0KDQo=
