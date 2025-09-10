Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95428CA101F
	for <intel-xe@archiver.kernel.org>; Wed, 10 Sep 2025 15:39:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C33510E954;
	Wed, 10 Sep 2025 15:39:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AQNEC0G/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02ABE10E954
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Sep 2025 15:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757518757; x=1789054757;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pYYauOr0zThhjUHpiarL+EBUUcQ51AMmb4dNAyxX9M4=;
 b=AQNEC0G/AFjb70eP4GMF5xjG6GAN3+2biv160AHUzKQYCTRVPUyZCZfF
 XQqKIDSEWYVc4PF2upFY/iZWrvDPR/OZt0yXIZE518i2+VLTocUChR0xC
 rn8dtfQRTr2Jh+pFXVb20NIwjAJVIh/r0I4BwPFx3NBaB5tO++7CY5C3Z
 6y+yXrR/uQuu+hbx4IHrbxnTQGBMURA9lXoiaXRXHZGfSchg2jvETCM9P
 DybTdOhdyfRFdcy35gwo2hVUx1BxyCB/4WZ2UFFwoGc+mXeW3gsPT4QaX
 4GHLH/pckfC35Z06DevLKtCsYbIc4mu2hsTSMdgYcg0VEfXef0Rx3Ee+x A==;
X-CSE-ConnectionGUID: IVjC0EA8SG+ALqARhDc9eA==
X-CSE-MsgGUID: vpyySjB4RwSoAXm88z4H3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="85278181"
X-IronPort-AV: E=Sophos;i="6.18,254,1751266800"; d="scan'208";a="85278181"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 08:39:17 -0700
X-CSE-ConnectionGUID: mDqfIgtYSdeKBs6IYLt9Ow==
X-CSE-MsgGUID: hp25XfHFSquvoX1opzJiOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,254,1751266800"; d="scan'208";a="173338860"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 08:39:17 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 08:39:15 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 10 Sep 2025 08:39:15 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.66)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 08:39:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UV7OqXJAMHoLAztwCaZ3LDEzeCd9hgvdWI6QJlAiAXCsfGrOyMVI80dUhfcZnpmDH8+KtzK+6yAQos0MoVs9UibWqS0gqYwtXWUuS7E49RP75WjFuAKEglQnRmK1AqKtZanECB3fYfZnxeC/IOzByrlYHbORESXJCqoLJvTC3f2aYCB1a+CqF8LctdSvxMKb9ZoMpJsI/yFuTN1ow17DUie9jRJBgOlKGwebJUbNLWQYmVPmrh69VnBOGneDcPR2tWP5rVRb2n7hjljlUbNyra+8aFm6m8HoC/jyD+2bXcxBxb5IFRpfOO5UfpbhxmjXEmnV0XcYFBW1vsEfrS0cvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pYYauOr0zThhjUHpiarL+EBUUcQ51AMmb4dNAyxX9M4=;
 b=nBqBm/SgT/BNTGd/OIR2nSs7YHe6AsH81uNm+7AloRYJiadvtYUhDnFIoBfw8Oz22lLX7FTk+tYe61VevO44XNrpMnEAxglsKT2elVfmFNNrbanFAaaCVudsXNoWV3Jw54yDmRsaQAOSmDofucUQ7TwOm1pgTK1PMGjA22g7aLGASp4gsmUjWfbC7w21tGMHZYdxcVLmlv0jXHe9P2AdNvDyAlg5WMNWDxTOPikvu5GL3Gc/yH71CvIrU853/NRzNgT6mgN3vDAbkXA2R6egYPUzuNjW7roBw5dZ5+1nvMVx1wvlxaNvZDzqSQ2ugWJkYZvGnHverpdr/v6YtXZ4Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by CO1PR11MB4929.namprd11.prod.outlook.com (2603:10b6:303:6d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 15:39:12 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5081:cd4:1a4b:a73e]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5081:cd4:1a4b:a73e%3]) with mapi id 15.20.9094.021; Wed, 10 Sep 2025
 15:39:12 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>, Jani Nikula
 <jani.nikula@linux.intel.com>, "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH] drm/xe: Fix uninitialized return values
Thread-Topic: [PATCH] drm/xe: Fix uninitialized return values
Thread-Index: AQHcImVR8RCp/oBOT0yxLIzyDuizVLSMhuzQ
Date: Wed, 10 Sep 2025 15:39:12 +0000
Message-ID: <CH0PR11MB5444CF1FA4EEF9650C47A093E50EA@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250910151128.49693-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20250910151128.49693-1-thomas.hellstrom@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|CO1PR11MB4929:EE_
x-ms-office365-filtering-correlation-id: 4e965133-6542-4e62-a59f-08ddf080311c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|10070799003|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?ZzA4MkJQREdrczJvNEh3S1BMRk9jNWgybFRZcVAweTlHNkVuejVCd2NUT0N3?=
 =?utf-8?B?WThEU29vNnkwTUw1ZjUzRVZ2VVowM0d5UGlrZkZkdjRGcHpTL2dMWFYzSEZt?=
 =?utf-8?B?dXdVRWx2RWtWUDAwTFUySExMc2JzRGlBRVNZVGR1Ym9kVmVyaDVsMXpGREhZ?=
 =?utf-8?B?UGpxblduV0hVOHBXT1I3bTcyNGEzQ2tlbThQd1hoMFZNdmh5VE9SSXczZFJG?=
 =?utf-8?B?d1pHN2ZvR01GMTI5QXo5ZkVwNGltWGFrc0U4Smt4NWRoTHg0KzM0QTcyU1gy?=
 =?utf-8?B?a21ic002a3dUSzF3djBtSGplMm1PYmczYXY4ekk3WnNJSHhuRGxrZ08rVFJD?=
 =?utf-8?B?N2ZibGFnVzFicXd2cHhxdFBwb3hPZVI1aXY3NWNsRUtYNmtRRTVMQ0ZOSkMz?=
 =?utf-8?B?VWpTWEZscWVGOUE5RlBqRHlNSE9MT242RGh4K0Y0bTRadGZldDVvUS9qaGUw?=
 =?utf-8?B?aWxSaDJ6bmNpd1pzSFkxb1BCeTFRTUh0cmlKR2Vxd2ZldS9pRXRSSG5LMkUr?=
 =?utf-8?B?cW5BTU9KMWRLbUFGTUdKWFN6SzNCbkZaMys5NmIrbVV2N0E5RlhjL1N0TWRt?=
 =?utf-8?B?NVhNM213NUF2NHNlb1RkWldWSG1Ea3JGNTdWZVJOR3Y5WTdnR0x3ZDQyZjNY?=
 =?utf-8?B?VGdLL1diU3RjaVd1L0plbEp4Q1k0TUkxSVJ6a2FBakRLQTRIU1ZlcFF2MVJ5?=
 =?utf-8?B?T3hIcUxnaDA5c1JGZFljMjJJMmFkL0lhdDVRUE91R3ZKbVhDZkZlejMzNmVY?=
 =?utf-8?B?cjk5TUZ0RkNTeW80Vk9EejJVSGl5cFY1K04vVldMdG9vQjhWUVFCNWd4OUNu?=
 =?utf-8?B?aW1mRjNnQ2gvQmxJRmRZbjdZMVo1Z0xsNWQrcUFyM1JiSFVXZ1N1K3V4TkJB?=
 =?utf-8?B?VWltdnlDTmJOYWdITG45WVc0aENYZlVYRFhvVmNwaHdJM3Rxb0xSajI1cXpp?=
 =?utf-8?B?dnRGbU5iV1N3UmtPNHdxTm5lbTdVRm9NT3A2RUF1eXF1R2xvVnJDLzB6TzU5?=
 =?utf-8?B?S2RpZEdzY0gwSXNBS3B3U0djc0NCcllNVU9xbURjNDhzMEJaNWE4djRBbkZt?=
 =?utf-8?B?ekxrVC9nbExmb2xkTXo4UE1XblhJWmJ0SVUva0g5RTRDUjZaWEIxaFp1L24y?=
 =?utf-8?B?SjlJS3o4UnZ6SU9wU1o3UlpuaEhCWUJqeHRDYldOaldmaDdSbjBGdFplemM2?=
 =?utf-8?B?bUVwZXpDaHB2K3d3SFdtWGNmWnd1ckQzVVJJRWNrQzF6YiswSVVNYmNsTkk5?=
 =?utf-8?B?aDB6Q1V0c0xCNHhORWhWdHlRUlJubzlBUjdwUHJMT2swb2NGckEwWmNaeDRa?=
 =?utf-8?B?bnJtUFI0K3BBMWZZS3dBY0ZLVVFXb1c5RWF5aUhyL2lkNWJ4cTR2M2wvUjE0?=
 =?utf-8?B?RDQ1U1hrMFpsajJPNDRXdlphQ3RqeW81VHA0c1RkTGNhU29rcHY0L01qSVRY?=
 =?utf-8?B?L2t5OEpHaHVzV3FSeWwzZGJuWjNvUERNcDE1QldHYXh6OWoyeFEva0hnODF1?=
 =?utf-8?B?UXpPeklVQnovOFVSVHN3QmJvMHhnTUNsck1yVHpvY0VoTVVOY09udzZGY0da?=
 =?utf-8?B?UEk5eTA4WHpTN0ZDUE1nYW5tT29LN21wUlF0YklYbmpMQ0FuUXc1VDFzbDZJ?=
 =?utf-8?B?ZzZjNXFBUGowUGVRbzlSSDhJaEUzaGJUWFFQVkNDZlFKb3g2M3pCb2NwOVZE?=
 =?utf-8?B?SGlmV25XK1BMaW1neDIyRVBQZFh5QmFyanVhSEhlbE92V0hiU3RyTjg3alVa?=
 =?utf-8?B?V2t0V2lvdWZHZWlCREh6NnR0MnlGN1ZJRkN0d0N3VGpiY0pvSk9ITVVUeGhV?=
 =?utf-8?B?YVRuV0V4OEtQR2E1UU5hWjIrVG5wSWlhR0dmazlsSU0wakRzcjNGR0hGZy9Z?=
 =?utf-8?B?dlJSY002NUdVZ2xzZGs4YUtZZ3J3WExrdkZjTTBPV1ZTaTZiOUFaekM0Nk5O?=
 =?utf-8?B?RnMwL0V1dURHWkovbTIzOGZhaUc5QTN0OGZuaktoeGRDWUVDdTZkcDhwQ0pS?=
 =?utf-8?Q?tHkkFM4187D/RViQrLsGFIGaMwkKlw=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(10070799003)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aWFxSi9tWkx2cG1lb2tWN0tRdzlUdGgzblRuSUF5OSs4K1Jub3pxZ3Z5VEp5?=
 =?utf-8?B?MVJ5S1VlNTNhTW95NWoxaUJWSDBmTEhiVFdVVjU1ZVZnakU0cVZDVmFtTFVR?=
 =?utf-8?B?ckJzc25NbmlrTWtjLy9oa2pkWkxjVjNGTEpmdnhoSEFZS1laMEVoN1ByclpD?=
 =?utf-8?B?UjkwbDNzTlBvZDlMNE9hbE40MjZhUFZGWjRPZWcxWjJqZGtXVm0xYW85RmFl?=
 =?utf-8?B?YUo5bVJ6bjFsTzRzL0hBMWxWSGF4K3lnRHQ5SjJaVzBpaFVwY3hRRGV5MEhl?=
 =?utf-8?B?K09PS1hvVDhWcEF6cmVqQThyTkIxMzY1RmRpa0RFUlI4bjF4MTZTM25QZlVV?=
 =?utf-8?B?ZG1qQStqeDg5Z05paHNFWGd2QzBsalJYNTlYN3hQTlpBTFZpaXRwVzZ4N3F5?=
 =?utf-8?B?Uk04VWIyUGFjY3Z5NUtFTkRqK05MYVdVZXNRaWJhdGJPdUFYMXE2dzhDQUNU?=
 =?utf-8?B?ckptNWNVVm1RVmJDS3I3cFVYbE8wYnJic1Ntb0J6cUZhamtSRjNHWVRzcWJ1?=
 =?utf-8?B?MTlEQXZCUDdsS095UjNJZE9mRHdJalF4djRsVTZIRWhWR0wvcEZIOTBWWTZl?=
 =?utf-8?B?NFhtbTFJMmRINXNINjBzdWxNbk9TdXREdDVHNXBuTVN1blEvWkxCNm1yTUgv?=
 =?utf-8?B?aXM4djZMWjhMc2ExcjRLR0NFeDhWZEp4OVZLSjdmNktKZ1QreWxVczdGNzhp?=
 =?utf-8?B?dEpJTG5zVEErdWthMzRsc1lvbS9NMlU0ZFgwenFvMXNnRlFUUmZ0ZUlwM3gr?=
 =?utf-8?B?MTJrbVg2WGNUWWJtMmJzMkhtcCsvcFQ4MHRPS1VNR1p0R0h2SFY5YjFwcDRZ?=
 =?utf-8?B?cHIvd1ozSEtGU0krVVZOQlJUbUhxeWhYTjZYRFUyNXJYa0kyUm40S0NzdlR4?=
 =?utf-8?B?UkQ5cmxQVTRCaGJNNDlMSkZyOEJaYS9WTjRucTEwMCtWWkgrVmpkU1hubW4v?=
 =?utf-8?B?bjNzUm1KbnM2ZXp6cXBXNnpXVVl6ak1VdTJVd0d4OTRiZzhqaU5HYk84YXFx?=
 =?utf-8?B?dFFXZWRTbE1PQk15YVRWL0U5MHJSaWM4Q3JuQlNldFViK2I0b2o0QVVncTFv?=
 =?utf-8?B?VHFZWFBsUVJHTTl5UlBhL1VQUG9jZFM2S0ZWSkVvaGJCR1JBSnB0WHNoRCsy?=
 =?utf-8?B?eFFqZjZrNlNhdTFLT2h3bVBhNXNVMGxXWXFEL3JYOGY2UDc5NlMwckFzNUZj?=
 =?utf-8?B?MUlmbU1FQ1JuZjZCY1o2K0hXV2FyTGIyRmNrV0xCaEtsL3JWY1U1ejU4cTdi?=
 =?utf-8?B?UjdudS80TlNoQU14eXdxWS9xcFRHc3N2UjZBQVBmRFUya0FWc1JwOHJBM3lK?=
 =?utf-8?B?QWdMS0hacVdIdGp3RWVQeG0rNDdtSzBpS1NrblNyaGFKbWlDQVRVQ2FYcWtG?=
 =?utf-8?B?QXo1VktFdm9RcXJzQTJqbUJDTXowSllrRnIvWkpUN2NVRklUVk85WkFWRXI3?=
 =?utf-8?B?WTducXEySFEySVR6RlpTWDQ5YXRhRnlNMXRDZDlBeEIxUWxObTB4bjgrc2pp?=
 =?utf-8?B?eFJuMC91c0hlbjI1aHJOZTdrYjliMG5OYUJ2VHdmY0hrc2lGSGVka1RuaGcr?=
 =?utf-8?B?ZW9RTEduK2Q4VWg4UTFjejFiaWIxZmYyZXFqN05qc3kya1dXaWFucFVteGkr?=
 =?utf-8?B?SnpQMUVGbjdBQU84MzUvcmtraVdCRTZxUnRJZHcvdGRSTFdYTllZTUovVDdq?=
 =?utf-8?B?Z0UwVU9wb1U2SzRaT2Z5MmlTTnNEcmFtSlFXNlFoc05wbXZIL1NhTHZDMUhy?=
 =?utf-8?B?RU5rTnllZ3VFZnlHOFFWbWpTK2o3c1pWV2hON0dPRDNwcGgwVzRtRXREM0tm?=
 =?utf-8?B?WW8wMW5RYkJhSStlelVhVzRPeWRSMEh2YTI5RW9UOGl5RlE3NE5GendXcG5Z?=
 =?utf-8?B?dUx0eVluZldqd3Y4dTg3TUVISFB4d3g0eFB1Q0ZyU0I5eGRSdGhBRDZHOEIx?=
 =?utf-8?B?Q1VvWkttM09pSm11bXpJeUdydS9DL2lkNDc3MGdwdU54Yy9XOHZQVy91dEw1?=
 =?utf-8?B?ckgrUUUvL3Z2WHRmOG9FUkdDY3l2cGR6WTVqd1ZvdmRvQVFhaFcyNVp1SUgy?=
 =?utf-8?B?QjhOcm9xZmFnM05pZm5rMGMvaStTQTd1U2FFWWVNWEpLY1R5dmIycXc5NHht?=
 =?utf-8?B?MXRCSkZtelBQcHJQd2F6VWlMZzRBaVN4TU9uZjhVQVIxaW9pNDZPSTZ1cTls?=
 =?utf-8?Q?xZo+lYn2/Yo2UOPvBZZw7Csr6lNuz1CArEIQ/hO2gv2j?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e965133-6542-4e62-a59f-08ddf080311c
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2025 15:39:12.6453 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NlO3UBUQOVAIpsC2Bis12/38PcLERrT+Lp9x4Kz3C+QYKiDLGC7DedPxIpesHvt5Z2SmlxYtlUVHgEgLMD0qbBpSldYS2zCsXEo+CtoZ0Rk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4929
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

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEludGVsLXhlIDxpbnRlbC14ZS1ib3Vu
Y2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIFRob21hcyBIZWxsc3Ryw7Zt
DQpTZW50OiBXZWRuZXNkYXksIFNlcHRlbWJlciAxMCwgMjAyNSA4OjExIEFNDQpUbzogaW50ZWwt
eGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpDYzogVGhvbWFzIEhlbGxzdHLDtm0gPHRob21hcy5o
ZWxsc3Ryb21AbGludXguaW50ZWwuY29tPjsgQnJvc3QsIE1hdHRoZXcgPG1hdHRoZXcuYnJvc3RA
aW50ZWwuY29tPjsgSmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGxpbnV4LmludGVsLmNvbT4NClN1
YmplY3Q6IFtQQVRDSF0gZHJtL3hlOiBGaXggdW5pbml0aWFsaXplZCByZXR1cm4gdmFsdWVzDQo+
IA0KPiBjbGFuZyB3YXJuZWQgYWJvdXQgdHdvIHVuaW5pdGlhbGl6ZWQgdmFyaWFibGVzIHVzZWQg
YXMgcmV0dXJuDQo+IHZhbHVlcyBpbiB0aGUgZXhoYXVzdGl2ZSBldmljdGlvbiBzZXJpZXMuDQo+
IA0KPiBGaXggdGhvc2UuDQo+IA0KPiBGaXhlczogMWYxNTQxNzIwZjY1ICgiZHJtL3hlOiBSZXdv
cmsgaW5zdGFuY2VzIG9mIHZhcmlhbnRzIG9mIHhlX2JvX2NyZWF0ZV9sb2NrZWQoKSIpDQo+IEZp
eGVzOiA3YmNiNmUzOGMxNGQgKCJkcm0veGUvZGlzcGxheTogQ29udmVydCBfX3hlX3Bpbl9mYl92
bWEoKSIpDQo+IENjOiBNYXR0aGV3IEJyb3N0IDxtYXR0aGV3LmJyb3N0QGludGVsLmNvbT4NCj4g
Q2M6IEphbmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBsaW51eC5pbnRlbC5jb20+DQo+IFNpZ25lZC1v
ZmYtYnk6IFRob21hcyBIZWxsc3Ryw7ZtIDx0aG9tYXMuaGVsbHN0cm9tQGxpbnV4LmludGVsLmNv
bT4NCg0KSSBzZWUgYW4gYWx0ZXJuYXRlIHNvbHV0aW9uIHRvIHRoZSBpc3N1ZSBpbiBpOTE1X2dl
bV9zdG9sZW4uaCwgYnV0IG90aGVyd2lzZToNClJldmlld2VkLWJ5OiBKb25hdGhhbiBDYXZpdHQg
PGpvbmF0aGFuLmNhdml0dEBpbnRlbC5jb20+DQoNCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0v
eGUvY29tcGF0LWk5MTUtaGVhZGVycy9nZW0vaTkxNV9nZW1fc3RvbGVuLmggfCAyICstDQo+ICBk
cml2ZXJzL2dwdS9kcm0veGUvZGlzcGxheS94ZV9mYl9waW4uYyAgICAgICAgICAgICAgICAgICAg
ICAgfCAyICstDQo+ICAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUvY29tcGF0LWk5MTUt
aGVhZGVycy9nZW0vaTkxNV9nZW1fc3RvbGVuLmggYi9kcml2ZXJzL2dwdS9kcm0veGUvY29tcGF0
LWk5MTUtaGVhZGVycy9nZW0vaTkxNV9nZW1fc3RvbGVuLmgNCj4gaW5kZXggYTJkMWY2ODRhM2E4
Li5mMDk3ZmM2ZDUxMjcgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS9jb21wYXQt
aTkxNS1oZWFkZXJzL2dlbS9pOTE1X2dlbV9zdG9sZW4uaA0KPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0veGUvY29tcGF0LWk5MTUtaGVhZGVycy9nZW0vaTkxNV9nZW1fc3RvbGVuLmgNCj4gQEAgLTIy
LDcgKzIyLDcgQEAgc3RhdGljIGlubGluZSBpbnQgaTkxNV9nZW1fc3RvbGVuX2luc2VydF9ub2Rl
X2luX3JhbmdlKHN0cnVjdCB4ZV9kZXZpY2UgKnhlLA0KPiAgCQkJCQkJICAgICAgIHUzMiBzdGFy
dCwgdTMyIGVuZCkNCj4gIHsNCj4gIAlzdHJ1Y3QgeGVfYm8gKmJvOw0KPiAtCWludCBlcnI7DQo+
ICsJaW50IGVyciA9IDA7DQoNCk5JVDoNCk9uIHRoZSBvdGhlciBoYW5kLCBsb29raW5nIGF0IHRo
ZSByZXN0IG9mIHRoZSBmdW5jdGlvbiwgd2UgcHJvYmFibHkgZG9uJ3QgZXZlbg0KbmVlZCAnaW50
IGVycicgYXQgYWxsLiAgU3BlY2lmaWNhbGx5Og0KDQoiIiINCnN0YXRpYyBpbmxpbmUgaW50IGk5
MTVfZ2VtX3N0b2xlbl9pbnNlcnRfbm9kZV9pbl9yYW5nZShzdHJ1Y3QgeGVfZGV2aWNlICp4ZSwN
CgkJCQkJCSAgICAgICBzdHJ1Y3QgaTkxNV9zdG9sZW5fZmIgKmZiLA0KCQkJCQkJICAgICAgIHUz
MiBzaXplLCB1MzIgYWxpZ24sDQoJCQkJCQkgICAgICAgdTMyIHN0YXJ0LCB1MzIgZW5kKQ0Kew0K
CXN0cnVjdCB4ZV9ibyAqYm87DQoJdTMyIGZsYWdzID0gWEVfQk9fRkxBR19QSU5ORUQgfCBYRV9C
T19GTEFHX1NUT0xFTjsNCg0KCWlmIChzdGFydCA8IFNaXzRLKQ0KCQlzdGFydCA9IFNaXzRLOw0K
DQoJaWYgKGFsaWduKSB7DQoJCXNpemUgPSBBTElHTihzaXplLCBhbGlnbik7DQoJCXN0YXJ0ID0g
QUxJR04oc3RhcnQsIGFsaWduKTsNCgl9DQoNCglibyA9IHhlX2JvX2NyZWF0ZV9waW5fcmFuZ2Vf
bm92bSh4ZSwgeGVfZGV2aWNlX2dldF9yb290X3RpbGUoeGUpLA0KCQkJCQkgc2l6ZSwgc3RhcnQs
IGVuZCwgdHRtX2JvX3R5cGVfa2VybmVsLCBmbGFncyk7DQoJaWYgKElTX0VSUihibykpDQoJCXJl
dHVybiBQVFJfRVJSKGJvKTsNCg0KCWZiLT5ibyA9IGJvOw0KDQoJcmV0dXJuIDA7DQp9DQoiIiIN
Cg0KTm90ZSB0aGF0IHdlJ3JlIG5vIGxvbmdlciBzZXR0aW5nIGJvID0gTlVMTCBpbiB0aGUgZXJy
b3IgcGF0aCwgYnV0IHRoYXQgaGFkIG5vIGVmZmVjdCBhbnl3YXlzLA0KQUZBSUNULiAgV2FzIHRo
aXMgZnVuY3Rpb24gcHJldmlvdXNseSBwYXNzaW5nIGFuIHhlX2JvIHBvaW50ZXIgYXMgb25lIG9m
IGl0cyBwYXJhbWV0ZXJzPw0KLUpvbmF0aGFuIENhdml0dA0KDQo+ICAJdTMyIGZsYWdzID0gWEVf
Qk9fRkxBR19QSU5ORUQgfCBYRV9CT19GTEFHX1NUT0xFTjsNCj4gIA0KPiAgCWlmIChzdGFydCA8
IFNaXzRLKQ0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL2Rpc3BsYXkveGVfZmJf
cGluLmMgYi9kcml2ZXJzL2dwdS9kcm0veGUvZGlzcGxheS94ZV9mYl9waW4uYw0KPiBpbmRleCAy
ODdiMGM0MzU1ZWYuLjFmZDRhODE1ZTc4NCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L3hlL2Rpc3BsYXkveGVfZmJfcGluLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL2Rpc3Bs
YXkveGVfZmJfcGluLmMNCj4gQEAgLTI4Myw3ICsyODMsNyBAQCBzdGF0aWMgc3RydWN0IGk5MTVf
dm1hICpfX3hlX3Bpbl9mYl92bWEoY29uc3Qgc3RydWN0IGludGVsX2ZyYW1lYnVmZmVyICpmYiwN
Cj4gIAlzdHJ1Y3QgeGVfYm8gKmJvID0gZ2VtX3RvX3hlX2JvKG9iaik7DQo+ICAJc3RydWN0IHhl
X3ZhbGlkYXRpb25fY3R4IGN0eDsNCj4gIAlzdHJ1Y3QgZHJtX2V4ZWMgZXhlYzsNCj4gLQlpbnQg
cmV0Ow0KPiArCWludCByZXQgPSAwOw0KPiAgDQo+ICAJaWYgKCF2bWEpDQo+ICAJCXJldHVybiBF
UlJfUFRSKC1FTk9ERVYpOw0KPiAtLSANCj4gMi41MS4wDQo+IA0KPiANCg==
