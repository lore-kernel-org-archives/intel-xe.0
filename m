Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB7F4D29C2E
	for <intel-xe@archiver.kernel.org>; Mon, 19 Jan 2026 14:25:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BE9C10E46F;
	Mon, 19 Jan 2026 14:25:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QdPbdiSV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4404D10E46F
 for <intel-xe@lists.freedesktop.org>; Mon, 19 Jan 2026 14:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768832710; x=1800368710;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6K2cuK32GA+6GsXDuzJSNJZ++UoG7mYcoc0eXOWpxXQ=;
 b=QdPbdiSV9SqKBMH2LIOHho4TEZ46ehlK//mtfLncJCMPSOpoCU+LOZOz
 7aoOUw1QP264lk/VUoNrHkQsVUDt9lgv2VYW/Cn3feRcmjXkeKhKHwLx9
 BGyaJEJJOTxCeglwwVuThICBysb8Qkiyz424fBU1Q+2yM8fB52N1AzWXh
 HSgMqa+SPGIaWkQU5rKnB8oBgE+4mCJM8T1aPnO7nCOnuveWZRstUrK+D
 GY+5WHhwYE6IC6Bhx/AjXPKKJOsnr3uwHIRB+eys8WU2GkKOa8aoLPqjO
 AG6vLU0zfQG1ddAXn025PS0MrLhdkYhMsy7tBN/xzTzS25kRMoFBClxwM Q==;
X-CSE-ConnectionGUID: dm5WmiagTCa6qU7RLidsUw==
X-CSE-MsgGUID: 6UWwZtA3RQqsqHA/EQdtsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="69244064"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; d="scan'208";a="69244064"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 06:25:03 -0800
X-CSE-ConnectionGUID: XHIv9R3sRla5y8BVMwE3Ew==
X-CSE-MsgGUID: u7vPl3LTQ5uJmbOBMK8J5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; d="scan'208";a="210364655"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 06:24:45 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 19 Jan 2026 06:24:44 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 19 Jan 2026 06:24:44 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.9) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 19 Jan 2026 06:24:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w/MCcMfZFsEG3DkqwtlFPkSn/xAKjWCpHgfbmv05kULT2PTNQFgqbkhYn4Vluakxdu+haQ/NRD55iyJXhpQ/u7bPdx+ZaHMJJrZ1F/yTp4D9Ka6ZDPA4cDtelwEcTcepf6qO6iNJR6LqYUemwU+o/taPm8WqDjyUpP1GDPM+JhqqyLK4RJK9o+8BOTqH0ne+Njmz3mRb1SZvA7jFS5+4tIklM9O4CU4Jzgv/sQWJLuuSgC12YoFWZdRwuObYUxnEmyuoREpO+gEYvGOmVQZTwY+BqIdSx6KtD2dbSi+15jGLZUE/AyhowcvN3mSFaLAlBbhrWhVqj3+HyUVxfawcsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6K2cuK32GA+6GsXDuzJSNJZ++UoG7mYcoc0eXOWpxXQ=;
 b=KUmeXbcpXFJvRPp922F0NxK2m7uUCyuVCqBqUR/HU6tAocYKv+f1qo5dQTuML+qLQHkH1MwbzGV/xWdo4T7l7H2Vft0ofhHUlUGf2H5sJtavlKPdg4WDibqP9I3A5gjoRbG40xk7909pkFTJB0bXne7jQZol5SCPgiOh/qSLL1CJ5HH2zVHUQDNDffaj9OMlAbyroGMvD2TFO3PHl7VO/7WHvMPRTH+rhoUO3NOPn4eoTQx5rgu/vGExnLkPClLhvgJKRO2/KdbJ6FwCfMDChQQ1YT1SzgiTVGtkMvViv8gUsbRBbbyuW6SxxQog9c7HqyTBYBVx/GhdeZE+XrhQkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB8987.namprd11.prod.outlook.com (2603:10b6:208:574::18)
 by DS0PR11MB9478.namprd11.prod.outlook.com (2603:10b6:8:28f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Mon, 19 Jan
 2026 14:24:43 +0000
Received: from IA3PR11MB8987.namprd11.prod.outlook.com
 ([fe80::c011:ff94:944e:f96e]) by IA3PR11MB8987.namprd11.prod.outlook.com
 ([fe80::c011:ff94:944e:f96e%6]) with mapi id 15.20.9520.011; Mon, 19 Jan 2026
 14:24:43 +0000
From: "Gote, Nitin R" <nitin.r.gote@intel.com>
To: "Auld, Matthew" <matthew.auld@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>
Subject: RE: [PATCH] drm/xe: derive mem copy capability from graphics version
Thread-Topic: [PATCH] drm/xe: derive mem copy capability from graphics version
Thread-Index: AQHciTk7tML9CwAeFkOe3rIRSNg8lLVZeXeAgAASYhA=
Date: Mon, 19 Jan 2026 14:24:43 +0000
Message-ID: <IA3PR11MB8987BCBE8A66EE4791E7EFB0D088A@IA3PR11MB8987.namprd11.prod.outlook.com>
References: <20260119121819.1676700-2-nitin.r.gote@intel.com>
 <ccc20c84-9c83-4068-82be-dc693b397cc5@intel.com>
In-Reply-To: <ccc20c84-9c83-4068-82be-dc693b397cc5@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB8987:EE_|DS0PR11MB9478:EE_
x-ms-office365-filtering-correlation-id: 88d5f8fe-992e-47ea-7d34-08de57667d55
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?MzFlaXdkUEtWY3R3R1ZvVE5CWmlzT2xyd3dyOGhUTHlGT0JqVE1pbUQ2Ylpn?=
 =?utf-8?B?dm9xSno5REFreU1YdWZDMkVhMHJvR2J0UldJS083QVpqNmVzTXpPWDBMVTRo?=
 =?utf-8?B?bVIvcWltMmdBNHRJbWd5SkxXTGVoWFZFQTlETDlUVmFwTktzK2JsZXNQK1Vm?=
 =?utf-8?B?MUdzaTRmbHZOTzM4Tmh6QzVqS0dtMVF5Sm5Qb0N4djNweGV1anluWFRud0lH?=
 =?utf-8?B?cTJzYmE4R21TWEN0VmlFUi9jUFdjMks3NXp3ZCtOeENTUm4zb3ltUlNBYktv?=
 =?utf-8?B?d0o0Q2J2NVNzeEVNYmtSYnhWS3NMWm5lWE8yb0IzR2JmRCtMNDBUMlY0eXFo?=
 =?utf-8?B?YzZ1Y0FGcjVBeW5XbFNFM2NsMDBaNk5mc2hsWnVOZmpwU0VrWmlXK1J0YUpz?=
 =?utf-8?B?ZmJObDZzQSs4bzRtSnVzdS9UT0JXUml0YkRzbm5XaDlPeWZXVUE4N0tYVkFj?=
 =?utf-8?B?UkU1d3NlQk9sbnFpWFBxSStVSWhkVlBJc0wxQWRSQmRZTE52MXlrd0xEcGk2?=
 =?utf-8?B?TzZZN01Hc0NvTU1Ycll2VlR6SmxzYnhCVnZKREJxd0NZUzJYZVA5MEdPU2Nz?=
 =?utf-8?B?ZXJFS0FyYkhVcjdXbjZldGQ0Wkx0YW5neHVkZ0pXNjNVQXZNVllndEhTRE12?=
 =?utf-8?B?SVlwZHZlWS9SMlJQdG5xOW56TmdlREhJdkN0MHJUTXNLanAwODM3bHZ3TERK?=
 =?utf-8?B?RlpEcGVPeUdRSk45Ykw0M2ZKRXd3UmttMWUvSUFodzNZaFhhQlpzbS8zdkVG?=
 =?utf-8?B?RENhWmhmRVFQdG5QdW5kYkZlaTFUTVlCcEk4eGJ3eVM5bjBydzNYNUszN24y?=
 =?utf-8?B?NHNaMHA3cWw3N0wrK3FXMmZUNGRtcG5ScmNLSEV3b0thdUtYeEhjeWMxMi9k?=
 =?utf-8?B?V0Q0dmtGbjQvM2d6WUJvNEEvaWZQKzBHMXpXa0x2UHBVK3Btb2g3M21BaUhw?=
 =?utf-8?B?Vnl3T0NOaXZkQXFUc1I2S2w2YVZuNEJTL3ZId2NxSWpTWWppVmJSYU5udkRF?=
 =?utf-8?B?dHZyZnl4aFZ6OHIyMVZDd2NmMVNES1ZMVHhQdnpUQ2tEbXNUSndoM1hqMXpl?=
 =?utf-8?B?WWtxVlEreXMxMkJ6TkVTc2xHL3VQNDhuTW1HbldEeUxrWjI1elAxSzA3ajEy?=
 =?utf-8?B?VzRjeTdhcHR3V3hRNmplWGpRNzhoWTgrcFd5cXhaUzZrKzB0aTFKMHRySk1P?=
 =?utf-8?B?dXBzS3RwWHB4UWdYeVl0cDhnMXd0Zml1djh0Nm9kV3c0V1ZiWUNpc2ljZ2JN?=
 =?utf-8?B?dGZKVW96Y0hVaHViZVdOc01YMDZrRURxTEZnMTB1VFpPdjV1cHMwRjJDRk14?=
 =?utf-8?B?RlE2ZWZJNTg3NGVVNFVuZHdpOTlySys0Nk04NFlETTh3b3h2YXk5UFFCV0xt?=
 =?utf-8?B?SVd2Sk1BbjNsN2xFVCtGRndxWXlkZFFKMFdvNVdyWnpyWDJENGV6NTZ2NytE?=
 =?utf-8?B?cHBIclhWbVFSNHFjOW5XS3FFU1A5OW5leVVmQ1Zrem0vUDMvQWpFUVdNdThR?=
 =?utf-8?B?Vmp2NGpldXU1bnNPazFNY3RXTzNZUVdnWDZIUExIdmF6L3ZBSGRRSFZValhX?=
 =?utf-8?B?YndBYithb1MzOUFWUzM2RnhNYVJWazVWelhuVkJUTzNaaERJSlgrTUdRb0V5?=
 =?utf-8?B?VmNuWTdkUjliSnIwOENUWVlMNXgrbmxDVGdaUUNFejRQZWE0OFh4cWZEYTEr?=
 =?utf-8?B?REJjOHVBMzNXSGxxcnBrOUVselcxbEhRZm82anlIcERVQmppek94aDkzMTRN?=
 =?utf-8?B?NzFDSmtTM3RtSjFqZEtCRk54MzRNVWxxbTFEZFJWWkpRb0N6ZlZLRUYxdnlP?=
 =?utf-8?B?TUNDeDdRODRQVGRDTmVreThFU0pEelBOK3pVVmM0cmJYN2VHSkV6dVc1OG9P?=
 =?utf-8?B?VmhyRlN5UkkwaXRNTm1NNnA3UG9DR3B5Mjk2a0dmTXVVNWhRWlZOWUVsVlZ6?=
 =?utf-8?B?N3ZYL2R0RkVFZFdmaGxRb09HYkNMSlp3b1dNZTRmaktmeXJ6TmtUVEJuTUsr?=
 =?utf-8?B?ZWFJMFdzTllJWC9GTkd4aUlrQWVzU1lHdGlrSm16MWF4blVqQlhaamN1VUs4?=
 =?utf-8?B?Q2UvZVhmb2R5Rk4rWVRXVS9nWWlja2dYRmNHdHp4clUyZUhhWlprbExneWtU?=
 =?utf-8?B?R3FvTS85bzlscDZJYkdzU3N0ZGFVK3lPenpscXB0ZS9lLzI5S1V5Unk1Ti9v?=
 =?utf-8?Q?uEbqmk6IIlzNHrMR4vFMG2Q=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB8987.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UzlmWnM5d25YRkFSZWZXQ0s2SFlnd0FHSUJod2lUVVhBcTRHWnorUkJkNFk1?=
 =?utf-8?B?VE9MQ0xxWXN0Nk5NYVNPSEVoNTZEWEd4eTF2ZzF4Qnd1cXVranN0Uk02N0Vh?=
 =?utf-8?B?U2s5aHJ4UUg4NFVFR3M5VFNzNk1zRml2WnR4ZVdFbUQ3aG5abWlmUSt2QUNV?=
 =?utf-8?B?Q1RRd05JdzJPaHg5QXprUHpXWjBYMmJycXRNOWlKRG9raExZVzZ3b1hOQVIy?=
 =?utf-8?B?QTNPN1AyM0dVbFdyM0VsY0gySllsc0ZXajhUZ3pOeDA3dlNWendNQS9ReVFy?=
 =?utf-8?B?bHpDU3BnYWhTMTV3UzVhVThNaFNkalVFTHRjbEhVdTAvZU1meGR2VkcrL1Rs?=
 =?utf-8?B?N0J0bUVhczB3WWRYbDUzN3RHQWExWEk3bXN6ZWV6VXVaS3pMM3puaXgvb0VS?=
 =?utf-8?B?QWxvOXFWdW8vODBOLzFRR2JUWU5uSmd3c0l2MnlpUUN0M2F2SjgzdGRERUlt?=
 =?utf-8?B?cU9LUHlZUENsMkhyWmhlOXI3djVoVFhnbllrRFVSS0RkbUNObUVzOFhqNHp6?=
 =?utf-8?B?NS9SS2Z3TXd3ZGdJd1pZanJMS1EzQWhubVdjY1RVQmV4aEpYYXR4NjJ3OVFl?=
 =?utf-8?B?ZlNPNTMvYURvRk9MemorOCt5TzVzWnE5ci8zRityTmdKVVFqZWIvdENRbHg4?=
 =?utf-8?B?L1djOUJVczlwOUZNVzQrUmZObjJNdEkxQkQ3Wm05YmtOcXRqZTlGTldEbWpt?=
 =?utf-8?B?a1hYTjFUWWN2RGk1bE9idXJrR1ZBUWZxRlVxWGgwZGdSeHFyckZNUWoweStG?=
 =?utf-8?B?cnF5NG9GUnB3ek4wUlFFTklLMElZVWZpdTdhK0JGNjFjYklleWhQenVoMDU5?=
 =?utf-8?B?RitaQU5rcFVib3A4ek1sSnl1ejQ2dHl0MGRhL1JkbFVZT2VTZXlKUEJoc3ZI?=
 =?utf-8?B?bDFBdW0zRFF1eVZsOWhON3o2WlRqWUdqOWVrQTJUNGJBY3h3WkVKMnFEdXRk?=
 =?utf-8?B?WE1NZXc3eFRMZjVXdEZhVEV6SE8yNUNYUWYramIwMXgwUHltQ1pralp3UjRD?=
 =?utf-8?B?Y2pBZjNIeDQrRk52NEZIK3ZhMXNOTEtCVVBHWFZYVU1zcmtMVThRMzdiOCtK?=
 =?utf-8?B?ZjVLVnRKNmJTbGp1c3RsTU1YdHFXUmczSGJUZEpHU2QvYXJFV1cyVVdCVU1G?=
 =?utf-8?B?NVkzdkllY2sydTNHSU5TOUIrS0U4bEYyWGxGSUFrdENBaU5CSG1OS2dHaFZ4?=
 =?utf-8?B?WjhTZUM1RUp4OHB6QlMxcW0zN2ZXTlFBUEhWK2sxaWdnbnZ0enc5TVBCVERM?=
 =?utf-8?B?SlpQaDR6WFNxL0UrMkRKREI1cTl3QTRjR3B6YXB0KzdGY0xXbGlSWlRINnFo?=
 =?utf-8?B?M3hHRk5FV25yU1JhVFgxa3UrNHNNei9zcnJ1bW8zQ1J5d2l2TG9BTHF2L3oz?=
 =?utf-8?B?UWx6T01rcnJ6ek9SQmRTT0Y3NHBQLy95TTVRcG5DOTRrcGUxT0NXei9UaVVR?=
 =?utf-8?B?SlE2VkRSbTF5MnJHYnpxVUo1WmhwcXB1QnhkSHJDMkludEhqUW9KY25lV0xN?=
 =?utf-8?B?dFNObyt4dUxRV2JPQTNEbmFTeS9BRVZHWmUrOWZONEUxVmUxWEp6V3FNMjVC?=
 =?utf-8?B?M3R0TWNIaDVPdEVLcWxFekNnd21BS1VSaHVpdGkySSsvM0o0Zy8yUUtBeE9r?=
 =?utf-8?B?N3c0RTkxRVZlcktnUlJoMTlvc1ZDRHlFWVJta1dMd0tHblAwa2wyNEhiODE4?=
 =?utf-8?B?OXlVNE1IOWV4Vmo5NHcrZTcrQSt2TjJuRTlWbTRuTEFDazhhQ3B2WS9tZ1Ew?=
 =?utf-8?B?ZE95M1hWM1RkcGZsUENaWkEzaVZpYThLNi9QUjcxem9PeDV3MUUvQndkV1g2?=
 =?utf-8?B?cjYyVDR1L0c0SWxkVnlzMnFDdElFcTUvTWd6Mkhad09taS9iSDhHTUZ5b0hF?=
 =?utf-8?B?YzA2RlN3cU9SSFdydGlncG11aDlVcHhZUWpOVXdxZGM1RVJXMzRVamlqRld3?=
 =?utf-8?B?aGMyT1BmcUN6cDNxZ3k4elIycE9jWmQ1bzcvcXhEbm1BWTRocHpXK3ByeFlL?=
 =?utf-8?B?WEhFdWh5MVdCaVdobnVZd0k2N0NxWTVzS3Uwa295dWxCbG5HL1dGSUpuSFNn?=
 =?utf-8?B?VlJYdmY2eTBBU2NqaFpQWTliWFVDcjZoMGdkYjVCblVHd2J3eC95Uy9VaExh?=
 =?utf-8?B?ZWNjQmQ5VExYRENFalFVbm92V3c5MHdRNCt1YmtQdDdTb0NvalJlQnVDcGtr?=
 =?utf-8?B?dHlSYW9xRUFUa0JCQ2R0N2NlSW5QeHFtTFg2SFhINlBDZW5FcWEydW9JdHNW?=
 =?utf-8?B?MkVTd0JtUnpIZjNMd092TC94RkF6cGtZRUZpOUs2ODZBUnpKU2dudXI0NjQ2?=
 =?utf-8?B?YyttdER4ZEt6anpLVzBReTRMTURMODBBZFFFdUtyeTEyaXYxNlNTZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB8987.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88d5f8fe-992e-47ea-7d34-08de57667d55
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2026 14:24:43.4036 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hNEQHgWFHXTRYP+XekS7w1GRi2DPpOX5OeES8mvzheXgggIEHHqFkr/aepWyI8MRofnu7jjNiolqb8tJRufrNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB9478
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

PiBPbiAxOS8wMS8yMDI2IDEyOjE4LCBOaXRpbiBHb3RlIHdyb3RlOg0KPiA+IERyb3AgLmhhc19t
ZW1fY29weV9pbnN0ciBmcm9tIHRoZSBwbGF0Zm9ybSBkZXNjcmlwdG9ycyBhbmQgY29tcHV0ZSBp
dA0KPiA+IGluIHhlX2luZm9faW5pdCgpIG9uY2UgaGFuZGxlX2dtZGlkKCkgcG9wdWxhdGVzIGdy
YXBoaWNzX3ZlcngxMDAuDQo+ID4gRWFybHkgaW5pdCB3YXMgcnVubmluZyB3aXRoIGdyYXBoaWNz
X3ZlcngxMDA9PTAsIHNvIHRoZSBvbGQgcGxhY2VtZW50DQo+ID4gc2lsZW50bHkgZGlzYWJsZWQg
TUVNX0NPUFkgb24gZXZlcnkgR01ESUQgcGxhdGZvcm0uIENlbnRyYWxpemluZyB0aGUNCj4gPiBH
UkFQSElDU19WRVIoeGUpID49IDIwIHx8IHBsYXRmb3JtID09IFhFX1BWQyBjaGVjayBrZWVwcyBY
ZTIrL1BWQw0KPiA+IGVuYWJsZWQgYW5kIHJlbW92ZXMgcmVkdW5kYW50IHBlci1wbGF0Zm9ybSBw
bHVtYmluZyBmb3IgZnV0dXJlIFhlIHBsYXRmb3Jtcy4NCj4gDQo+IFBWQyBoYWQgYSBzbGlnaHRs
eSBkaWZmZXJlbnQgaW5zdHJ1Y3Rpb24gbGF5b3V0IGZvciB0aGlzIElJUkMsIHdoaWNoIGlzIHdo
eSBJIGtlcHQgaXQgdG8NCj4geGUyKy4gSSBkb3VidCBpdCBpcyB3b3J0aCB0aGUgZWZmb3J0LCBi
dXQgaWYgeW91IHdhbnQgdG8gYWRkIHN1cHBvcnQgZm9yIFBWQyBJIHRoaW5rDQo+IGJlc3Qga2Vl
cCBhcyBhIHNlcGFyYXRlIHBhdGNoIChuZWVkIHRvIGFsc28gY2hhbmdlIHRoZSBpbnN0cnVjdGlv
biBlbWl0IHBhcnQpLg0KDQpUaGFuayB5b3UgZm9yIHRoZSByZXZpZXcuIEkgd2lsbCBkcm9wIFBW
QyBmb3Igbm93Lg0KLSBOaXRpbg0KDQo+IA0KPiA+DQo+ID4gQnNwZWM6IDU3NTYxDQo+ID4NCj4g
PiBGaXhlczogMWUxMmRiYWU5ZDcyICgiZHJtL3hlL21pZ3JhdGU6IHN1cHBvcnQgTUVNX0NPUFkg
aW5zdHJ1Y3Rpb24iKQ0KPiA+IENjOiBNYXR0IFJvcGVyIDxtYXR0aGV3LmQucm9wZXJAaW50ZWwu
Y29tPg0KPiA+IFN1Z2dlc3RlZC1ieTogTWF0dGhldyBBdWxkIDxtYXR0aGV3LmF1bGRAaW50ZWwu
Y29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IE5pdGluIEdvdGUgPG5pdGluLnIuZ290ZUBpbnRlbC5j
b20+DQo+ID4gLS0tDQo+ID4gICBkcml2ZXJzL2dwdS9kcm0veGUveGVfcGNpLmMgICAgICAgfCA3
ICsrLS0tLS0NCj4gPiAgIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9wY2lfdHlwZXMuaCB8IDEgLQ0K
PiA+ICAgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pDQoN
Cg==
