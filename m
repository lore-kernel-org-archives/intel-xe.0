Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF299C0218B
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jan 2025 09:30:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B497210E164;
	Thu, 23 Jan 2025 09:30:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VNydB3qm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C0C810E164
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Jan 2025 09:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737624636; x=1769160636;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hr/+6owopzX3cW8M9IsQXbzSrLEJ+Gd67Xayv+fKSjs=;
 b=VNydB3qmCx8zttJ9uBwsPlWp1Bqgxx52BIUWVYd9WKkvexUSbW/02rko
 GFtwhUfpUB1stafOOotPC1Tu+AInYO8wBOUuCncGFtRY3xEASd80VaX5u
 Ycb36BbZfZ7FSU6O18crIbKW/sGklzucVNqv6xjLJew4E4qbPoqMDZ29X
 lyBEJvtxrZIjh+9oE5q/uQQUe103G40QVViAf9tlyU9h5cmUYKDVr03qm
 NxeKqn24uLIOh/Xx/UiYJww5HyRwlzrHqMSIKfZnzYKhEPUl62llNwrcy
 AAW8dWk8La/z8V1yIHPPF2YxXpXE8BN5W4xzlg+85JElT+vjZRBh+wvTF Q==;
X-CSE-ConnectionGUID: 9pAVySHeS1yvfOHWYyE3NQ==
X-CSE-MsgGUID: UgNO1IqmRHyE2L2hFHDETw==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="63462644"
X-IronPort-AV: E=Sophos;i="6.13,228,1732608000"; d="scan'208";a="63462644"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 01:30:35 -0800
X-CSE-ConnectionGUID: cPHt2bCMRC2HcoghBL9gAw==
X-CSE-MsgGUID: gV3E9cO/R1OIy/cfSjHjJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="138277066"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Jan 2025 01:30:27 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 23 Jan 2025 01:30:26 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 23 Jan 2025 01:30:26 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 23 Jan 2025 01:30:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wRB0PxqeugL/7VStD/O6XUPSf5m6w5crdWjT0aDDa1UBQUKfSX+7CZ67OkHDuDf3eoogfGbsMrAlMXP4cLdND9zEGx9j3xaMMaHLygn1ltioHqx+zV+xYBllHVqmKcN80/Tp8YspDYBe9ift+gdo1wMqcMYEhjC5dO2aGFNwIPDlErfM52RPJaARlrTDWc6Aq4H6HAWJ4AfoVAMTgxQyZrF8WKFon//MYPcE9UYg+ScoQ8+OhjmEYmHXYWpY357kz8R4b2PdCCnmhVyQ507nUyjj1ULrSg07YN+Szsxa110w1u7t9RJkInJOxXRaHU/Dax8kipAMyS0OU85F1ck7NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hr/+6owopzX3cW8M9IsQXbzSrLEJ+Gd67Xayv+fKSjs=;
 b=gHivytxSKz4fwr37wA74/RnpEa1c5WC+cUgOGDktFnIoWejQlmPyZdXAainafQ097ocdNYErY5zr4fmyH4CpKc/C/mjEmMwwSphhvro3GNrLkCeHF820V4+TZl4fs2xWNBRCpJNPMGyNA7OQWkTpagf3Hy/JRQAAFZFzJ2vrr/LwWJsvG9szy60PA7W1Ywtu7849T2esfgNnfZzVGzs5qwv6+HblBZx1GbYWnIxm08NwK3Yekt7jDAgJPxUxlhn37PO/6elESk07QTiEANHg6o8Iw0FEyA1rvl8HBrLQlAPTVGYrTDsjetMyqgTd8Bx3nZDGwt7r0kzNWOFjLSHyow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by IA1PR11MB7872.namprd11.prod.outlook.com (2603:10b6:208:3fe::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.17; Thu, 23 Jan
 2025 09:30:20 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541%6]) with mapi id 15.20.8356.020; Thu, 23 Jan 2025
 09:30:20 +0000
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
To: "Auld, Matthew" <matthew.auld@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>,
 "Brost, Matthew" <matthew.brost@intel.com>, "K V P, Satyanarayana"
 <satyanarayana.k.v.p@intel.com>
Subject: RE: [PATCH v2 7/7] drm/xe/sriov: support non-contig VRAM provisioning
Thread-Topic: [PATCH v2 7/7] drm/xe/sriov: support non-contig VRAM provisioning
Thread-Index: AQHbUUcYY2jyxgta3U2uKrkIvYplT7MkUA4A
Date: Thu, 23 Jan 2025 09:30:20 +0000
Message-ID: <LV3PR11MB8695B561FB67FA063CD2C571F9E02@LV3PR11MB8695.namprd11.prod.outlook.com>
References: <20241218121837.226393-9-matthew.auld@intel.com>
 <20241218121837.226393-16-matthew.auld@intel.com>
In-Reply-To: <20241218121837.226393-16-matthew.auld@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR11MB8695:EE_|IA1PR11MB7872:EE_
x-ms-office365-filtering-correlation-id: caab866b-3dd6-469d-9e27-08dd3b908e60
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?Y1VIZ3pJWXFWUDlCMEo4d1dUVzVQZnVTQ2dJcXZadUFUbkRHVG1WVi8zZzl5?=
 =?utf-8?B?aHlrRDRDdndJK2ZCRk5CT2hGMnRDSXNHeU5KdFNUM3hoVC93RlZDSXZOMHdI?=
 =?utf-8?B?MHA1QWxyYW10WUZWektFcGtJTm4wSlFyMUJvRFVta3RCeDJiMzNjbzUvU1JF?=
 =?utf-8?B?T25QNzRNWEdWQ0U1VFlPVllpcndOV0tidFpzbVc3SDVaNk4wSCtkRzQ1czJW?=
 =?utf-8?B?WmE4ZkgxT1l6d0MwOXc1TzRJM1VqNDlXSmVBTXlPT2gxUTFray84aUY3N2JM?=
 =?utf-8?B?RmNzeUtWWDJ5NHZQM3F5VDQ1N28yNnZ3VGI0TTJPakFGOTk5ZGs3Zjh2Mm56?=
 =?utf-8?B?NGRmd3h6TnAxTXVBWWFiUUE5UEUzaGM5aEpRZThHTEhjcWR2WjR3VmVMN1Vq?=
 =?utf-8?B?SXdaRlFTVm1NLy9tcW1Dc29YbUpsQlRhcmxGRjdaMG8xckplY2gySkViSmpG?=
 =?utf-8?B?bGptTCtiV2tDTzJsR2k3N1BwK0tneXdqNkVMcDFTNE9ua2lMcGd1M2tZelhR?=
 =?utf-8?B?STRlNU4raVhaRXVhcm91WFBjVnc1OGExYWJqUmE3SnhpZTdKOVg2MVQzbVRC?=
 =?utf-8?B?a2FRVUQ0U1MyaXBOOGc5eHhhbW5tR1dCaDN2eUxuK2ZnUXo2Ym54eUdGejVs?=
 =?utf-8?B?V3JUbVg5TUlZNnJXTHprV1NlOTg1bU5zV2x3b2RpbGdCQ1B5S2Z5Qm9sZ1l5?=
 =?utf-8?B?SER4T3o5TnNkaWJUaFA0Q1FJV3VGa0I5b2wrUTZzZjg5V1VWelpTK3RlVDJy?=
 =?utf-8?B?cWRucW5hZ0I5ZTNUZUw4ajByeXRTdWQvZjRMUG41TzF0YjhjaVZtckhBQ0NU?=
 =?utf-8?B?cm9hTTRYcWFsOU13VzZZQk5UOWdlV0RodWgxUFBBdmIrU0dtNU9uQkVwc0RN?=
 =?utf-8?B?UDBrcEVmZ0EzR1QvZzdpWUdaZ0JObkUvU0c0M0ZXa2VqTEZtWW9tZFIzb0Ux?=
 =?utf-8?B?bXdEZ2FoK0wyang2bVV1YWFuYkVGakVNVzhZMUE4dDZqT250bjk3TFhFTkt4?=
 =?utf-8?B?aXdsdjQ5ZDlySys0U3h3SnpIQStOMGpPMm82TkRNaGN1ZjV0eTQ1UTRaaVVs?=
 =?utf-8?B?RHBzVm92RHZtRFYvTlViU0psekpaZmh2MndPUm5PZTNtbE9SeXo2OURldmlI?=
 =?utf-8?B?OFBrbnVIS2g2dDZLM2xoN1pjOGF5Z3JYaU56cU9BMElzWVZ2TmllSGRMcHBJ?=
 =?utf-8?B?UzE1cW9UK2lJQXRyc0xXUE04ZVpiRmU3Y3FYcnRBTkVLSGhPRnlxTVpRdEdL?=
 =?utf-8?B?T0xvSUNkTVd4R2ZLRHBXSjlwSW85bU9TTjBHdEk1ZWlaYVlTclRnc2hORXI5?=
 =?utf-8?B?bXVvMXZjbXZVcDhBRmFzZ1NVWjBZS204YVhpaGNhbGV5THcva2xINnBnOWp5?=
 =?utf-8?B?MkdlaVExczBSMll0MTlTNHM4RzkxSGNMdU5UQ09VaGdtc1c5TzRuUzh2OTV6?=
 =?utf-8?B?QmJsTk5sMndtSXMwaTJ2NGdTTFNpNVV2aGJDL2RaUnI5UlBzWWpWTFdsSXcz?=
 =?utf-8?B?L0ZaNEhFQ1FXQ290T3k2QVZmWG5taExFcWJKWHZZb2VYMXZ1K2dGUG0wSXJp?=
 =?utf-8?B?eXdBZ1BhcksxYjhnYlBQVldUeTdWR1ZBc2xYdnVDOFdWalZvWDdGYXNVMWxK?=
 =?utf-8?B?NG9hQitJNjVwK08vVGdzQllZSlh4KzRzYU0xQU1jZ3NtU1FsYjNWM2hQYXhp?=
 =?utf-8?B?RnZja2M5RTRTTEg3eVVFOE50OWNlaWtyeWkveVUrYnpQWjR3djEvb3dVeUl6?=
 =?utf-8?B?N3dRL21NUlhPY0VHcmdGZFZNVCtCM2hTVmlXbzIvSDlRL3I0VG1KMS8yZEJ3?=
 =?utf-8?B?S2p6VTJNRVBYTE1MUHkyak1GSmExRTlJZ3l3UGl2MjliUXRybFlGQXBSbG5S?=
 =?utf-8?B?TGVaUWcwK3RrVzZPOEQxMCtkYllvcmFlQmNBbnRLMkZlcUpyK0d2bVZUQ3Q5?=
 =?utf-8?Q?jCVMMebk9PCg3e0K6N9UroZrY9sgVpoj?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8695.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aUJ0OCtNQ0hYSklYT0RGSVpuRU51N1RCWXcxZmdKZFV4MGdYWU1lQTlma1d0?=
 =?utf-8?B?M0ZDNDBZbHVET3Y1Wi95ckVnSTYxME9EeGoyVEtJTXByM1ZiTHl2SjdVaGNJ?=
 =?utf-8?B?a3lLaFpFbG41VHo4dFB1VnkxdzVtcWsrOGVkdmtiMjRhRkVNdWtSNjhnMGkz?=
 =?utf-8?B?RXlQUmpwdVFoSWNFbUhmQkw1T2o2N3hPSkxZRWRrSFk3NGxiQWR5QXZGK0JC?=
 =?utf-8?B?c0FQV20xY2ZaNHVybTJ1RGNVTzdUb2EvMGUrR0RabnJvNmxkeHJHakxXem1T?=
 =?utf-8?B?MCtjNU02d3VMMGJSbzJCd0k4MHZlVERnS2Y4Z015NzFTQVRETVJyblpjSkJ0?=
 =?utf-8?B?ODBKN1Q5bFl1dklJMThmZmpwRTJCK3JRRDFrNy82RFh0aE9RbTFZaDU3VzAw?=
 =?utf-8?B?d2hwSFBiSEErK2kvVlA0QUFZQTVpdUgwRmJIelRVSEVzODZLcTdxZmNFVU9D?=
 =?utf-8?B?R2RubTNsUXBKVjFWVHhwaUtzQTZKVjk0OFFHdjNIRndqLzZDcTZUMzRYZU4v?=
 =?utf-8?B?Zi9lbElpdzMrUXlmaW02RGowY0h4YUUzcVNiV1AxY3czZkRsTi8rL0VwUURy?=
 =?utf-8?B?NC9xYUNlY2ErTGdOVlVmM0Z2anpvTnZRUE9vL29vTnNrV2VUSG5OOGZES2VI?=
 =?utf-8?B?RjBBeDJGelc2NnRNaGpFQmNrWit6Y0FaR0Z4SDdkWmhUOHM5U1MvUzRzeWlN?=
 =?utf-8?B?WmpWNVJNbjAyVERsdXh6L2dZTUk4TCs2Ujk3RUxWd1MwNVd2enBvaUpXUTF2?=
 =?utf-8?B?SEQyMC8zYTBKTXRkUURDYStac2hMWnJnbkFpcDlyOFJJOTMxTURlMWtEb1JH?=
 =?utf-8?B?UlV0QXI4SDQ4WHJmNkJ0ZDd6elZwTlZpYm5HTVN0UGE4U1NlaHFJNXFheDBy?=
 =?utf-8?B?YW10RFZFb0p0Tjhia3p2ZldQajJ4VmNJK2hQVmsveFN5YU1Id1d6dnh3MU1P?=
 =?utf-8?B?TmZmQ21ibHA1UjZua1Q1Rk9ubkhndzdLQ2VvMUx3aStTQ3gwT0owZXVXUG8r?=
 =?utf-8?B?ZGlwdWp4WmREbm1oMjMyQ1laRTByaU5maDNJQWVTakExd0E0WE4zdUk1Mmlo?=
 =?utf-8?B?Sk8wMHcrNHMrdVZaTzdHcjM0cHZKVWlOSHBBZC9vUzhRd1U2bmJUZGlDZ05v?=
 =?utf-8?B?bnMzeVExTVQzTHozRTVGaTloODhoYlQxQzd2emx5SzlZQ3lsS214cS9DMytM?=
 =?utf-8?B?N3NoZzFkcllXRHI1KytWQUxNbDJzNjVLbGxoS2xWOXNQQUVBKzhVWldkRHFF?=
 =?utf-8?B?ejB2ZCtubXRMK1lJSklwMisvK1ZVOUtRcTcvWmxRNFdVOWpJQmd1eS9XRzFh?=
 =?utf-8?B?TU1RQ2k4bkM0Tlh5amI5L3V6Ly9laDJtZjZhY0lTRDRFRkZldW5xMFRxeUtl?=
 =?utf-8?B?Ry9xbS9FNmU3OEg2TXYxMEZseFBFVzBuYkdOT1IzcWgvMjh4VlF2QzV1MWtv?=
 =?utf-8?B?K24wUGRhY2lDMHcvQnJiSUpwV3BVckNURTdYb1BQNDgwNHlIZW00SUcrZ0Fk?=
 =?utf-8?B?TVZuVDZXc3dFelZPRHpFSG81ZTlIM3IzZFB5Mm1iZzBoNmtuV1ZxaWtjRitO?=
 =?utf-8?B?bFMycHFqYTVnODNhOU10SnlQcWN5NHhURTVhSGNoSGdyQ0dPOGEzRm5LM3Jl?=
 =?utf-8?B?cXpGem1LODhpLzFES09qNW1LOXlHOWs4NjNLazlWQ3c2RWthdVJubmM2d09D?=
 =?utf-8?B?eFdoaGIwa1VlTjk5U3MrT2U4cTVKTTFzNXdVUzJqUnBmVTU3N3VFVzlSS1FK?=
 =?utf-8?B?OFU2cW5HTGwwQVJpTTdlcHE3S1lCTUtwcGdHNmZNZkZhRGxabWE0Y2U3V1p0?=
 =?utf-8?B?bktDK0xJTjJ4QXBxem1DOWcrVVBUZjdnVDJkbHZTbkJTREFscFgzK01aU0Ra?=
 =?utf-8?B?T2VER2ZvZmw3VFdJdm92MzhCNEdTY3dLZm5xZUxxVmRpSCtSMURibnhVZ3Bt?=
 =?utf-8?B?YjlrQVlWcHNWVWFwQ1d6K1NTZU41WlR1SG45TllCWS9LL2tDdnhlUWVoNVVB?=
 =?utf-8?B?dHo3bW1FcVNXWS9tNVJ0WmVVemprYUwzbXB6Tm52YytRMmlTMEM2NDBuQW1C?=
 =?utf-8?B?ZlBhcHhnODkvY2F4enlwSjZDVkpHZDlpUy92KzFVWFMzQzZQWXdzSk1UQ1lL?=
 =?utf-8?B?RktzckFmYW13MGRuTk9hUXVtVGFFbHpHSVBYMnhMdnJTbG8ybExJckRiZmp2?=
 =?utf-8?B?R2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8695.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: caab866b-3dd6-469d-9e27-08dd3b908e60
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2025 09:30:20.6021 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bvZTChY2qRu43U9FqTHZEn0lh/1fIKDQ1znUr9lG23faUIgtYwKgwCd9PD5DGr5zV4AJFDYuTWkmrEiebLEivOHAPFA8AORRWEdzOMptqNI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7872
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBdWxkLCBNYXR0aGV3IDxtYXR0
aGV3LmF1bGRAaW50ZWwuY29tPg0KPiBTZW50OiBXZWRuZXNkYXksIERlY2VtYmVyIDE4LCAyMDI0
IDU6NDkgUE0NCj4gVG86IGludGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogSyBW
IFAsIFNhdHlhbmFyYXlhbmEgPHNhdHlhbmFyYXlhbmEuay52LnBAaW50ZWwuY29tPjsgVGhvbWFz
IEhlbGxzdHLDtm0NCj4gPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPjsgQnJvc3Qs
IE1hdHRoZXcNCj4gPG1hdHRoZXcuYnJvc3RAaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBbUEFUQ0gg
djIgNy83XSBkcm0veGUvc3Jpb3Y6IHN1cHBvcnQgbm9uLWNvbnRpZyBWUkFNIHByb3Zpc2lvbmlu
Zw0KPiANCj4gQ3VycmVudGx5IHdlIGNhbiBydW4gaW50byBpc3N1ZXMgd2l0aCBwcm92aXNpb25p
bmcgVlJBTSByZWdpb24sIGR1ZSB0bw0KPiByZXF1aXJpbmcgY29udGlnIFZSQU0gQk8gdW5kZXJu
ZWF0aC4gV2Ugc29tZXRpbWVzIHNlZSB0aGF0IGFsbG9jYXRpb24NCj4gKG11bHRpcGxlIEdCKSBj
YW4gZmFpbCBldmVuIHdoZW4gdGhlcmUgaXMgZW5vdWdoIGZyZWUgc3BhY2UuICBXZSBkb24ndA0K
PiBuZWVkIENQVSBhY2Nlc3MgdG8gdGhlIGJ1ZmZlciBpbiB0aGUgZmlyc3QgcGxhY2UsIHNvIGNh
biBmb3JnbyBwaW5fbWFwDQo+IGFuZCB0aGVyZWZvcmUgYWxzbyB0aGUgY29udGlnIHJlcXVpcmVt
ZW50LiBLZWVwIHRoZSBzYW1lIGJlaGF2aW9yIHdpdGgNCj4gc2F2ZSBhbmQgcmVzdG9yZSBkdXJp
bmcgc3VzcGVuZC9yZXN1bWUgKHdoaWNoIGNhbiBub3cgYmUgZG9uZSB3aXRoDQo+IGJsaXR0ZXIp
LiAgV2UgYWxzbyBuZWVkIHRoZSBWUkFNIHRvIG9jY3VweSB0aGUgc2FtZSBwYWdlcyBzbyB3ZSBk
b24ndA0KPiBuZWVkIHRvIHJlLXByb2dyYW0gdGhlIExNVFQsIHNvIHNob3VsZCBzdGlsbCByZW1h
aW4gcGlubmVkIChhbHNvIHdlDQo+IGRvbid0IHdhbnQgc29tZXRoaW5nIHRvIHRyeSBldmljdCBp
dCkuIFdpdGggdGhhdCBjb3ZlcnQgb3ZlciB0byBwbGFpbg0KPiBwaW5uZWQga2VybmVsIG9iamVj
dC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE1hdHRoZXcgQXVsZCA8bWF0dGhldy5hdWxkQGludGVs
LmNvbT4NCj4gQ2M6IFNhdHlhbmFyYXlhbmEgSyBWIFAgPHNhdHlhbmFyYXlhbmEuay52LnBAaW50
ZWwuY29tPg0KPiBDYzogVGhvbWFzIEhlbGxzdHLDtm0gPHRob21hcy5oZWxsc3Ryb21AbGludXgu
aW50ZWwuY29tPg0KPiBDYzogTWF0dGhldyBCcm9zdCA8bWF0dGhldy5icm9zdEBpbnRlbC5jb20+
DQo+IC0tLQ0KUmV2aWV3ZWQtYnk6IFNhdHlhbmFyYXlhbmEgSyBWIFAgPHNhdHlhbmFyYXlhbmEu
ay52LnBAaW50ZWwuY29tPg0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X3NyaW92X3BmX2Nv
bmZpZy5jIHwgMTkgKysrKysrKysrKysrKy0tLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDEzIGlu
c2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL3hlL3hlX2d0X3NyaW92X3BmX2NvbmZpZy5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL3hl
L3hlX2d0X3NyaW92X3BmX2NvbmZpZy5jDQo+IGluZGV4IDY1MDgyZjEyZjFhOC4uNTZhMTc4YWNh
MGQ0IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3Rfc3Jpb3ZfcGZfY29u
ZmlnLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X3NyaW92X3BmX2NvbmZpZy5j
DQo+IEBAIC0xNDA5LDE1ICsxNDA5LDIyIEBAIHN0YXRpYyBpbnQgcGZfcHJvdmlzaW9uX3ZmX2xt
ZW0oc3RydWN0IHhlX2d0DQo+ICpndCwgdW5zaWduZWQgaW50IHZmaWQsIHU2NCBzaXplKQ0KPiAg
CQlyZXR1cm4gMDsNCj4gDQo+ICAJeGVfZ3RfYXNzZXJ0KGd0LCBwZl9nZXRfbG1lbV9hbGlnbm1l
bnQoZ3QpID09IFNaXzJNKTsNCj4gLQlibyA9IHhlX2JvX2NyZWF0ZV9waW5fbWFwKHhlLCB0aWxl
LCBOVUxMLA0KPiAtCQkJCSAgQUxJR04oc2l6ZSwgUEFHRV9TSVpFKSwNCj4gLQkJCQkgIHR0bV9i
b190eXBlX2tlcm5lbCwNCj4gLQkJCQkgIFhFX0JPX0ZMQUdfVlJBTV9JRl9ER0ZYKHRpbGUpIHwN
Cj4gLQkJCQkgIFhFX0JPX0ZMQUdfTkVFRFNfMk0gfA0KPiAtCQkJCSAgWEVfQk9fRkxBR19QSU5O
RUQpOw0KPiArCWJvID0geGVfYm9fY3JlYXRlX2xvY2tlZCh4ZSwgdGlsZSwgTlVMTCwNCj4gKwkJ
CQkgQUxJR04oc2l6ZSwgUEFHRV9TSVpFKSwNCj4gKwkJCQkgdHRtX2JvX3R5cGVfa2VybmVsLA0K
PiArCQkJCSBYRV9CT19GTEFHX1ZSQU1fSUZfREdGWCh0aWxlKSB8DQo+ICsJCQkJIFhFX0JPX0ZM
QUdfTkVFRFNfMk0gfA0KPiArCQkJCSBYRV9CT19GTEFHX1BJTk5FRCk7DQo+ICAJaWYgKElTX0VS
UihibykpDQo+ICAJCXJldHVybiBQVFJfRVJSKGJvKTsNCj4gDQo+ICsJZXJyID0geGVfYm9fcGlu
KGJvKTsNCj4gKwl4ZV9ib191bmxvY2soYm8pOw0KPiArCWlmICh1bmxpa2VseShlcnIpKSB7DQo+
ICsJCXhlX2JvX3B1dChibyk7DQo+ICsJCXJldHVybiBlcnI7DQo+ICsJfQ0KPiArDQo+ICAJY29u
ZmlnLT5sbWVtX29iaiA9IGJvOw0KPiANCj4gIAllcnIgPSBwZl91cGRhdGVfdmZfbG10dCh4ZSwg
dmZpZCk7DQo+IC0tDQo+IDIuNDcuMQ0KDQo=
