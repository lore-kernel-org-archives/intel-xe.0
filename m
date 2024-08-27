Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 957A6C5473F
	for <intel-xe@archiver.kernel.org>; Tue, 27 Aug 2024 23:05:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AB3410E053;
	Tue, 27 Aug 2024 23:05:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VUT1nRL9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADA3C10E053
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Aug 2024 23:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724799933; x=1756335933;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=nQvibJNXVUT3zcE4nQbAzMVDYME+wp1VRErQcLkW2uo=;
 b=VUT1nRL9DrlHLm0k34Fw7Xdz4K9YxYYm4/WU/bzTOBWyqYqF2EnXLETY
 7xjHTRuKirubugBrwUaeX4vmlI0dIgIZkbDCyyNm4IOD6OV1lSWbvhkJz
 NWWL39XOddJhzfzicfgLZLPwLE7CafbGFEYWptcMS320A5te1BFVNFuVk
 bsBEu9KgSSFHT0GUReke9meLG3ZGW38tQ87ihP3F+nPbouvjozmxa5rRW
 Ms6ETGcFolYrGvBHgWT8hrQR3Q5BUBzcNbYZPCn/Fjwu33WAGKCeGN6Wx
 glE91nLbdrjWXyZGyHlvypy1pFT4Y0bGAIm4KGnNreS0wdnGxUC6HpFga w==;
X-CSE-ConnectionGUID: StpvCn0lQlKDcfx7D3ut8w==
X-CSE-MsgGUID: E1VkutSAT365DXE2wlG7oA==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="33929287"
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; d="scan'208";a="33929287"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 16:05:32 -0700
X-CSE-ConnectionGUID: DsbG7e3uRhCW2D7rvYG35g==
X-CSE-MsgGUID: JcwB2Tq4RMi7v4sLXaIuDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; d="scan'208";a="62749322"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Aug 2024 16:05:32 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 27 Aug 2024 16:05:31 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 27 Aug 2024 16:05:30 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 27 Aug 2024 16:05:30 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 27 Aug 2024 16:05:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XBHKnvxEPUW0nHNQmKPKSoqLO1CDOOJt1n2fGvLPI+g2workjTZAE3xtuD06SmOyyFgCPGOOuJwuyNhp0bALUxxT27FR0LPkk+uSTRfWEae3Fz7T7vkJ7bE9VgBoEialUgq5HaUoTqB0ET3/HnkRKtHKsxFaY10g9r9EJ5mVDlF8lvh+PAlyolrvQf1L84HLieQzG35POT3Wp8iophCnpQDRTqvOYWBhUjmBclw/AMwii9IyIht3IJJQaQ5Bx3jex/ckyZ0fqy9Un5ifCms1ZQjGNEs6wBuciDk8hiFdgCMk2dYvgbQu4bm+65mkhFV+RZYUdSYGSAkfuoY2tavtCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nQvibJNXVUT3zcE4nQbAzMVDYME+wp1VRErQcLkW2uo=;
 b=PY6pfbAZhrqQmZBYXlrQtvq2HDHfv0vh+VcuPa0ZHlaI+L0Q6uMauznjFHrdju+S7da90NlOCHBnA1ZFw4dv6Hh75ZI0RYkFLKKoi2RTXPr/7T6on5X6/Jn7XdJnfIZuZlJ1X/8SMmZOoMsVEL7cPZtB8wdGLA+ZUUgJHSEQaB0PNPwHgN/CLqMYjKHJrou3rESbxgqIFMPsErD6i+evf00BnVmspmvZPXMKpBSfAKSXYUaujKHlUbXcPwAnEpFNn+6McbIWWMPG5baopWw825viAfm80jtxTs7wmExiF3NOa6Myi/RG1jhZX2W+Ff90Uj4QkbnirNnHcpr+wxWxvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 MN2PR11MB4646.namprd11.prod.outlook.com (2603:10b6:208:264::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7897.25; Tue, 27 Aug 2024 23:05:19 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4046:430d:f16c:b842]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4046:430d:f16c:b842%4]) with mapi id 15.20.7875.019; Tue, 27 Aug 2024
 23:05:19 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Dong, Zhanjun" <zhanjun.dong@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v17 1/7] drm/xe/guc: Prepare GuC register list and update
 ADS size for error capture
Thread-Topic: [PATCH v17 1/7] drm/xe/guc: Prepare GuC register list and update
 ADS size for error capture
Thread-Index: AQHa+Mq9D//hX1Mn+0Ch+TPwqvOotbI7uZSA
Date: Tue, 27 Aug 2024 23:05:19 +0000
Message-ID: <b9002ac2e473614ecdfe604214fc280b8ecee9d7.camel@intel.com>
References: <20240827214726.1183935-1-zhanjun.dong@intel.com>
 <20240827214726.1183935-2-zhanjun.dong@intel.com>
In-Reply-To: <20240827214726.1183935-2-zhanjun.dong@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|MN2PR11MB4646:EE_
x-ms-office365-filtering-correlation-id: baf6ccf7-b528-4c7d-67c2-08dcc6ecb8dc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?djVudUtzNklQd2hKY000NTdSYzlvT1pqcDBUaWFlbUxPbEJHODlsSFA2WjVP?=
 =?utf-8?B?bHlLNy9WU1pNMGI2ODY2b3RwWDcrU2VWbzFTNFlydFZmU2twSmx4Z1U3ckNJ?=
 =?utf-8?B?SkJKR0QyQWk0TjJrUHg0bys4UVZlVmw3ODU3MEc3YTBpNmdUcEE4TWw1SGdC?=
 =?utf-8?B?MHpKS3UzMm9DbTh4UGNYa04zUlIySENXK0d4RUVPakNSblp6aFB2SHZ6Q00z?=
 =?utf-8?B?S3RaM2pVajgwM0VXbmtOQmRIR0ZrTGFwUTRzeU5teStCdERKYWQyVVJqRGZh?=
 =?utf-8?B?aUxoM2hPMVp3WTBuNXZiWUlNdE1qWU5KMW1Fbml1bllwQ2U1N3N0eE15N1FG?=
 =?utf-8?B?eG9scC9TcUNweWh0R1RzTXFqSjhldDRpZXZsb25yUnR6QXZ4TDhSdGtOcmZI?=
 =?utf-8?B?eFVwZDFQKzFuNmxJVFNrcldoMTdtbXVkcTg4V3NCV3FlYjFhVXp0cE5JZWc2?=
 =?utf-8?B?UTd1TWJxVjJ3a082YmQyKzNKWFdMNFkxVC84YUhuNGdUdlNiM051Tmp6MS81?=
 =?utf-8?B?VENYeHVNV3c3TU11d0RkcUxyb3h4dXo5SXlDRkw2NGp0RU9QR2FEVGdDdklZ?=
 =?utf-8?B?NXQ4M2lSVE5yOXppS3luNG4vTThybU05V2c5dHJtUDlMd3dPcDM4RDB4d2hU?=
 =?utf-8?B?STlOZVV2MkU0bzBjSmI3UzM2OGhFL1FyMG16ZWFjTlF6Q2cvUUt0clpvcHNa?=
 =?utf-8?B?YldPTE0vbTJqcW03aWt2c29QU2RiQ05MU0VzNUVkNzArZWQrQ2hCNUl6VUhr?=
 =?utf-8?B?aUZvYlFsUzdhTWZPSEJrUDF0eHlabWEyaFlSZUROU3BYcnNRTTNSZlExd2Y1?=
 =?utf-8?B?TnBNSnIyaSswbGJHVmVJT2VaZHQyUXExbHZLb3dtYjZURE5rWExLYXlIakEy?=
 =?utf-8?B?UmJaSDUxZDF5dHltTGJxNTJaT0J1MEl6TytjMU9KTWNqajROSlM4MWIvUDNR?=
 =?utf-8?B?cmQ5QjNtSWdNMG51dVB3cllYOFMxQUN5V2hIMEtIZUJjN1hMcEhvQUZGY3Vh?=
 =?utf-8?B?Z2MrL0xJQllnaTFCZW1Bclc2UkZVYU8zSTNhbHJneUNlZXR5TTlCUHlqNzJC?=
 =?utf-8?B?MWJsMHhxaCsxQ0V5SmFRSS9NZXhOREFZNmhCUEpHQjNzVk0vWm50UmowRWZE?=
 =?utf-8?B?anBmVVNmSm1nREdsMWtSazNMWVJiYTJRK1FuWDNYYVROQVlwYXpSekpDZCtS?=
 =?utf-8?B?VlFCZDJzK1JoZlFRSWR1dGsvbWdrREhLbXJubzFYN3MxeFFuMndDVU9Xa0lY?=
 =?utf-8?B?NExtU0Q3eDU2T3A3WTBPdmcrQXUvbGpOV1FRbnYxREpJT2hMTExPb2RDVnIx?=
 =?utf-8?B?NnpGUWZUZ2hJcEFTQk94K1ZGWGRhSjNHSGpyRFp4bDZFcFRzNkJpNmRiSGJG?=
 =?utf-8?B?YWFSR1ZqclROZ2tReFNVR21kWlpkeFQ5ZjFBRGR3dzFvazFJNGVFcXR1dmxs?=
 =?utf-8?B?TCsyalZzaHl3MEtBQjVOaGViVkRqRnRZdVVRWjdZVVN6VjJmRzc2ODdubk83?=
 =?utf-8?B?MWNMbkdJajV3Qys4YzZZTFVRekJBUEtRY1pJT1lwbk1MTUJzcE9vdTNFZkRm?=
 =?utf-8?B?aWtZYTV0T1J2QndDWDB1RVM5dkpQTWJlZWdvb1gyR1hET3dPNHdLdTVGQnc5?=
 =?utf-8?B?Yi9EZzI5dXlEcjJvaERrZkd1OVNPNllPMjRTZlo2TjlxSVl4LzFycTEvUWxE?=
 =?utf-8?B?UTRkOUk1YUd3M212cGRMWFhHWnNVZlNWQi9GWUN6MHY2eHY1K0UrVUdaK1ZX?=
 =?utf-8?B?U0trZHFLd1ovY3BSK3lQN3dQdVd0clErcWZyMVRsbEtjT280b2g0aThxdmYz?=
 =?utf-8?B?TzRpREdUVXVXcVB4SjFNeUFUNS9xWEV1T05KbG1QVE00dXlGV0hYUEhhMng2?=
 =?utf-8?B?c0NKQWtySTF0SXV0ZFlMT2NkREJFQ3ZGN1RiTUZ4WDRXelE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YU1wODA2aGdJUTlQYW9BS3JCNTloOVJKbDN2L3BpeUtSYUJXSjVPUlovVlNk?=
 =?utf-8?B?ZEYrSHc5QXJTMEFmQWxsMWdid0FWaDV6RTNZRGxaWHJSOTE1UW9YOGF1UFMz?=
 =?utf-8?B?Yjd4QWg3aDM1MWVZQjd0ZzJSL0Y5RE9ZUG5Mc1RjVFB1R0FkaldlYTVLZDMr?=
 =?utf-8?B?VTZjdkx0TXVvSlBLRC8xRkI3b2dLQWhObW9sNGRuZHgrRUROb0Vodkdubk5v?=
 =?utf-8?B?R0t2eUFzM1l5d3psdDF5aUM1WGJ5OWRNOEc3blByZG5NelY1OWpyRVFld3l1?=
 =?utf-8?B?alA5NUM0YjczcnFCYWQxdUttOC9VYkVRdFNyQW5lRDluT2hjMmUzVCtqa3Rs?=
 =?utf-8?B?Q0xzM2lyZXQySG5wYnBwZWQzcU1saFZjYTR4dzNJU0xyN3lMZThYWEZYK0lY?=
 =?utf-8?B?WjZHdFZXeWZyNUd2UzdCdE4yc2lMbVZaeHBReG5aaWYzOFIvRnhLOGVRZy9u?=
 =?utf-8?B?Yk1WSlBMWGMxRU9TRVZXTHVxVXlKdDZ4QnlRNnE1VW5iamtZVk9LcVJ5bXgv?=
 =?utf-8?B?TVMzd3JBYkIrbXYyeXQxSWUwWXc1cGlqdENMWWVDQU5ueWlJNUJoWFQvaHFI?=
 =?utf-8?B?WWtqbkdJU2Qwak82QVl5TXNQTkUzRG85UFRTM3NzYis5U1VOOVJKM0s2ZFVD?=
 =?utf-8?B?dzRRRDJuMHhPVUxaQTNKcHd5aEFBNTJvY3d6N0hVM1E4NnVUMGZJUG96VXlW?=
 =?utf-8?B?Wk5rUER0U3FMU3dmeGFuK0xOdDZPbVRWTm51ZFZWTjVFV2kyd1ZrcnVxcFVh?=
 =?utf-8?B?LzlyZFJ3ZU91WXpsTmZXWjB5WmNYUEV0aXplVS9iSWNHR3FvZS9rWmd1YXA2?=
 =?utf-8?B?OFFVNWZNdmF3cDlwVzlYYzM0OHV3cE5CQmZnV2IzSnB0N0RncHYxdHI2bDE5?=
 =?utf-8?B?OGhLVEVMQzEyd2V3WU55ZjFKZWFrVlRBSlRQYjN5VzlTWjJZM1BhNGNkUE5k?=
 =?utf-8?B?Q0xWbHRjb0FMYlZFL2hMS1MyMlQ4bUEyMXlLejVCRFFmU1JrbzUzQ1VKKzdC?=
 =?utf-8?B?L2NTQzVlOEVVZjBvSHdsNVNScUpHUDFmSnRITzRtUGJ3RmpaZGtDK2FLYjkz?=
 =?utf-8?B?UjIvMThnK3JrUStvL3VjUElTS3dHWFUvajRSeUVSampRRStxSWFmajdPSWRD?=
 =?utf-8?B?Z2VPbWhGWWV6VXAvb3dZdm16SHR0V1ZKdlhlMjFWN3lsQ1E4b3d3MnJNbTIy?=
 =?utf-8?B?WEN1NmlFemdIMlRCQlpDTUpvRU9JRTlZelRQdkIrTWROd0g4OVdMNnBBNFd4?=
 =?utf-8?B?VHZEc0duZVVlNi95NEpsZzFxN1JhZkxDNEpOVUdBK3hTM2ttd1ZwUElnVTha?=
 =?utf-8?B?a0RxdjViTVJ1ZkxONDBHZ1E0U0VKWXVQQ2dwcy9HWFI3Qzl5ZzRqc2gxYzFq?=
 =?utf-8?B?cFhsSTV6TXpIdVRIckZFNVJjZDBrNGtIQjlqT1NkbmhWRVVTSFFCQ1hUVHdF?=
 =?utf-8?B?d0VxRUg3b0V6NFVLVzB5U21DZklzNjNRcGZ6TG91VFNJbXB6TFFXTXQ1UGRu?=
 =?utf-8?B?NXJxMGZ6OC9vQTN1Q0ZnVzJuTi9EdnR6eDNTU0tQWXZMYXFOSURzQ1BxeERM?=
 =?utf-8?B?eWFFNFlpZkNUb0M0Wkk5REh4U1ppRE9NMFNKVTBGZWkrV09KYzVHcW52R2t4?=
 =?utf-8?B?R3krT3JGTTZJTHhSRGZFRndiaE9TSDQweUNjazVsL0dqN1l0Zk1ENlNsaUVW?=
 =?utf-8?B?Mk5EVk80SkNBYi91aTNLSDdRaE9wOEl2MEZLNHRkSTFrZmNWcVFHWU5TbmNs?=
 =?utf-8?B?YzMxanZnMGlQM21TbTAyS1JGMG4xUG40RkRVVnRKSjRTR2JDRUlZWUVKYnRE?=
 =?utf-8?B?aHN2OTA3MWRVNERlbm80SkFLTEI3ak5INCsyS3Z3bXhzbVVFVDQ2N0FXVTJJ?=
 =?utf-8?B?TWh5U2hDbTNpQnQ5T05ORE5NN3FKbHF0Znc5aFc0UnJ0eHpYMUVZZ0F6T0tV?=
 =?utf-8?B?eGdUVXFDU2dYcUdYT1IybEVLWnFtTEVDNUVuNTRFdjRSV0JaOGdzY0N6eEdB?=
 =?utf-8?B?NDZpRE5NenJ1VHdPSXlBRE9icEc1RWo5YUpGR3dMdmlCaXgzcjk0TmZuOGRw?=
 =?utf-8?B?S0ZyUmEzaU90NGpnTW9FTzQ5VzFTTjlLeisvZ2hreWdiMXA3YXBBMHI1ZVRP?=
 =?utf-8?B?bTlaYlRqRjhZc1JlYXJQbmxZYXY5UFdlc21mM2duMEdYMHR2aHhkcHIvUkha?=
 =?utf-8?Q?VyQNNGzVKW8yNPUX+WvhNSw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D9C885A1A5B30541A1357943CAA36462@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: baf6ccf7-b528-4c7d-67c2-08dcc6ecb8dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2024 23:05:19.5733 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EWtLEdAYXEl01izyLHyEAix3M2gWKNKWb+tqEHheJYv+3vKLpg3MBEmUakf4F3BGClJN2vMK5OVw/hFSC3GfEuhA9arUjzaIg0kcewmzcQd19MY/foUHCoERnMHTcNov
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4646
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

DQoNCk9uIFR1ZSwgMjAyNC0wOC0yNyBhdCAxNDo0NyAtMDcwMCwgWmhhbmp1biBEb25nIHdyb3Rl
Og0KPiBBZGQgcmVmZXJlbmNlZCByZWdpc3RlcnMgZGVmaW5lcyBhbmQgbGlzdCBvZiByZWdpc3Rl
cnMuDQo+IFVwZGF0ZSBHdUMgQURTIHNpemUgYWxsb2NhdGlvbiB0byBpbmNsdWRlIHNwYWNlIGZv
cg0KPiB0aGUgbGlzdHMgb2YgZXJyb3Igc3RhdGUgY2FwdHVyZSByZWdpc3RlciBkZXNjcmlwdG9y
cy4NCj4gDQo+IFRoZW4sIHBvcHVsYXRlIEd1QyBBRFMgd2l0aCB0aGUgbGlzdHMgb2YgcmVnaXN0
ZXJzIHdlIHdhbnQNCj4gR3VDIHRvIHJlcG9ydCBiYWNrIHRvIGhvc3Qgb24gZW5naW5lIHJlc2V0
IGV2ZW50cy4gVGhpcyBsaXN0DQo+IHNob3VsZCBpbmNsdWRlIGdsb2JhbCwgZW5naW5lLWNsYXNz
IGFuZCBlbmdpbmUtaW5zdGFuY2UNCj4gcmVnaXN0ZXJzIGZvciBldmVyeSBlbmdpbmUtY2xhc3Mg
dHlwZSBvbiB0aGUgY3VycmVudCBoYXJkd2FyZS4NCj4gDQo+IEVuc3VyZSB3ZSBhbGxvY2F0ZSBh
IHBlcnNpc3RlbnQgc3RvcmFnZSBmb3IgdGhlIHJlZ2lzdGVyIGxpc3RzDQo+IHRoYXQgYXJlIHBv
cHVsYXRlZCBpbnRvIEFEUyBzbyB0aGF0IHdlIGRvbid0IG5lZWQgdG8gYWxsb2NhdGUNCj4gbWVt
b3J5IGR1cmluZyBHVCByZXNldHMgd2hlbiBHdUMgaXMgcmVsb2FkZWQgYW5kIEFEUyBwb3B1bGF0
aW9uDQo+IGhhcHBlbnMgYWdhaW4uDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBaaGFuanVuIERvbmcg
PHpoYW5qdW4uZG9uZ0BpbnRlbC5jb20+DQo+IC0tLQ0KTEdUTS7CoA0KT2ZjIGFzIHBlciBsYXN0
IHJldiBhbmQgb2ZmbGluZSBkaXNjdXNzaW9ucywgd2hpbGUgd2UgY2xvc2UNCm9uIHRoZSByZW1h
aW5pbmcgcmV2aWV3IGNvbW1lbnRzIG9mIHRoZSBlbnRpcmUgc2VyaWVzLCBsZXRzDQplbnN1cmUg
dGhlIHJlZ2lzdGVyIHByaW50b3V0IG9yZGVyaW5nIGlzIGdvb2QgZm9yIGRlYnVnIHRvb2xzLg0K
DQpSZXZpZXdlZC1ieTogQWxhbiBQcmV2aW4gPGFsYW4ucHJldmluLnRlcmVzLmFsZXhpc0BpbnRl
bC5jb20+DQo=
