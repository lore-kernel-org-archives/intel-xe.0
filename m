Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15A90C36008
	for <intel-xe@archiver.kernel.org>; Wed, 26 Mar 2025 06:09:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5C8410E0A2;
	Wed, 26 Mar 2025 06:09:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JkWp0kc1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A01010E0A2
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Mar 2025 06:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742969360; x=1774505360;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=cTvE+S29sddKpQwlP3RzwybrtsqdBQBaVMIRTpGGBkE=;
 b=JkWp0kc1TZ+WM5FAiHvU7t5clNU4KGBMnhwPp+XabXmEHbBZb46Z3fT4
 50emklQM0LvsWasREadoRqt2u2OI4b+8PIMV9FZKBXSTxSmjk+ptJTXrc
 7HMJmnvleaxqICKZH5JUG8Yw4iEgqd7QOVhoQmJBPVS22fOb6oQWoUAhI
 rB9HM2mRb1epC51v0L1/7E8+6ZEIKOfBgf4ZekrFZpGNc7HocS9p+jp5d
 YCHC8no3U9C36uPtX73qzdFkaxOc4QSE7mtRWM8FvRjo20i5x2T+Jjlkv
 nZ2eOzPU0+Q4perv/BkjJlfhUVlMttXAEssuTZ5lVf+4tQbB7MZHd+vcS w==;
X-CSE-ConnectionGUID: rgE+afTaQPGkGp/vvUdUkA==
X-CSE-MsgGUID: AsNhQWwBQuu64JU+VmuUVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="44361361"
X-IronPort-AV: E=Sophos;i="6.14,277,1736841600"; d="scan'208";a="44361361"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 23:09:19 -0700
X-CSE-ConnectionGUID: mwuhUpGIRPOzvq1v7MmIbQ==
X-CSE-MsgGUID: I3EJx5QST5uf/kw0+XFidA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,277,1736841600"; d="scan'208";a="125577601"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Mar 2025 23:09:19 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 25 Mar 2025 23:09:18 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 25 Mar 2025 23:09:18 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 25 Mar 2025 23:09:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mS4TW9fbqtv9XxKZpboEVXbQ62Uq5OBLnsIh6lxMqRcnse/5DWX1Bse1atG0Psu1vpqZ2NvE8RX03zthbyPrdGKWN2cgM9IBMveUbbAOYZjgBjJg2QdXbgevFeaaWpYSZpVjflM4WsHF9ygzOYzjPPHjiqG4jTcKg5Tfr76sS8NVSJWqHWiTbQzrTOQ+zsxK7V2I1gfhaL2EkE17s2D2UY9jAP5del2cjFBk4/vLnOTMsH4CFMEsNbdCTxPqeP/T4ssGcKzPNg8qujpw8XgS/TI26R0N4TjU5RFoqRIVAoFcCuA1vcSjD5bFHrMUf1Gw0ofjnOynY8LqZ6tyJsOEAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cTvE+S29sddKpQwlP3RzwybrtsqdBQBaVMIRTpGGBkE=;
 b=holC46RSRUEygifo9fVMY9/L3nhSvqc6UtuckCtjO9e8vlDIQfqFcHjWbNfbUNV2b4EyzDNmf2wVq2T9OICGuUE6WBjrypBfJDuo/s4skBMtkhbEmVN7Pcd27Mx9seABCn7vl386CxgT/EIJtmkN57p2dgMJoFHUW1/hNzlybTXe/miHXgvYzpp6RyZ9Wa5BT6It3FS3QGlCRyevIKVVxw07KvQ2ceQ19mJVLnHjC5jvAQRrP8/pusmvA+WdEVzBgWhP5nwACCca56ocrgnMBbPzQLIPaGk25y1D37jCrpHb4qZAlWGJYytGm0eBrEjcSa+4LcDUHqbJlPjGQo2ZPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by CYYPR11MB8431.namprd11.prod.outlook.com (2603:10b6:930:c7::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 26 Mar
 2025 06:09:15 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541%6]) with mapi id 15.20.8534.040; Wed, 26 Mar 2025
 06:09:15 +0000
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
To: "Auld, Matthew" <matthew.auld@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>,
 "Brost, Matthew" <matthew.brost@intel.com>, "K V P, Satyanarayana"
 <satyanarayana.k.v.p@intel.com>
Subject: RE: [PATCH v3 4/8] drm/xe/migrate: ignore CCS for kernel objects
Thread-Topic: [PATCH v3 4/8] drm/xe/migrate: ignore CCS for kernel objects
Thread-Index: AQHbj47kJMn/2bMH1EWa8os4ScF89rOFC/cQ
Date: Wed, 26 Mar 2025 06:09:14 +0000
Message-ID: <LV3PR11MB8695021C442B595651A4AF0EF9A62@LV3PR11MB8695.namprd11.prod.outlook.com>
References: <20250307182856.304850-10-matthew.auld@intel.com>
 <20250307182856.304850-14-matthew.auld@intel.com>
In-Reply-To: <20250307182856.304850-14-matthew.auld@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR11MB8695:EE_|CYYPR11MB8431:EE_
x-ms-office365-filtering-correlation-id: cbe0fcd7-0b3d-42e7-7b21-08dd6c2cbc57
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?OXVHTTF0K1BaTDMwUjNEbEtjQlFXZHhwamlsU1p3WHlPWU5Ba3JQVFM5dXN0?=
 =?utf-8?B?alZjSkxQWnUyVmc1RHJKQW5ib2ZrOXNpNkVXOWFVS01ldWRMWDZRYktoOSty?=
 =?utf-8?B?N09Uc0N0R1lSZysvRnJSenBKZXlqT0dtS2JoYk9yN3FrSkZ3Sjlmei9jMkVu?=
 =?utf-8?B?RVluaTM2WEJvWUNRYnRPZlZ3MjB1RzFwVkJTN2Y0V0x4V3l5S2JRV0NtMHow?=
 =?utf-8?B?MEdESTl5eDFIejl4cDZlVUVGSW1HRitBc0VaMWFybkRKSmhpeUFzRTEwRW9E?=
 =?utf-8?B?WWlxbjRFejFyMmRQVWZqbVI0cHRhaytFanRsMCtGaHdmL01tU256SVp6bXFa?=
 =?utf-8?B?UG1BeXBSQ2wzREZuamtZYy9xaC8zZGZYaVpzdXJXSlQzR05BOHc3RVlFVEtz?=
 =?utf-8?B?dEdPVzN5Vjc0MDE1Sk81aEdHMDhVYjdWREJwV0xLdzNNZFJsaEdrR3A2Ynlr?=
 =?utf-8?B?Y216WHNxWU9sWTZKN25ya2lSMmFlSXlPeDQyRnJDam83RXFrOVd0Vk1vazUx?=
 =?utf-8?B?djFVbkxpVzhZMHdpMHpsbitMaDRtOEp0OG1qT2Ryc0tCcDJDeUZIQ0RXWUMw?=
 =?utf-8?B?S05CSkk3T1ZPUE4zd0ljVmRNUmEybkx4VGZ0Y3BFWFRJcnppbDhYak4xaXAx?=
 =?utf-8?B?Tk9rODVsY1l4UmNTazBMNDlaZ3M0eVl3V0RqN2ZEeEk0UmlvTndWTEMxY0NE?=
 =?utf-8?B?TXVJWG5pY2VuVU9tQWI3UDZGTXRlaWZTeDNZT3pZODVEN3JUMnphVm9KaXow?=
 =?utf-8?B?UkZHL2VWSVp6bk5VTDZzR1kzWkQ3NUJvRzRQWjhZYkc1cTJWa0xqdHhwVERD?=
 =?utf-8?B?ZDdpZGxrRm83WXZpV3JGc3d4SHhFQkI5bjdFSnhLSEZqRVppaVNuZ2xQK0hX?=
 =?utf-8?B?Y0FWOWxRZnhCSzd6bDdUWEsvU1MxOG5UdEVPSWppVDcwL0Q3RUZhdVloR1pN?=
 =?utf-8?B?cU42eWlJb0N2TXZLSFUwQ0NuMTREOHR4dDNCTHNDdWwva2F3bjVoaFpqSDFF?=
 =?utf-8?B?WWdDdjV6aVIwdWdHc01DNXdkY0pyK0RoRlY5blRnRGp5Y1BaSVJZVndiRmpj?=
 =?utf-8?B?cExvd2I5RFAzUWVpYitmN2pNQURObGFaOURLRWVOb29sQkV4K0RYSGpxYTBB?=
 =?utf-8?B?UjhlOHg5cm0xcmV4SktkQjBwVTVYdHVKcWN0ZnoxV3FxSnBxUEpTY29xMjZt?=
 =?utf-8?B?c09sWDc5dnVoQk9jWnhYZ2NXYlhvd1I3MEp4K1E1cjF4VTRzRmJia3dUMS8v?=
 =?utf-8?B?UW1BR0J1WkFua3NoUC9rRU5nMVVyUmdrRjRpcERCYWtVcysxb2p3b09JVElQ?=
 =?utf-8?B?RjdlRDVDUjlRVGlMTHpXMEpnVUo3VjY2ckxJb0NIR0FjK01jMVkzZ0Z6Z21n?=
 =?utf-8?B?R1U4M1FqNmhZemtUeExzVzlDWCt6S3V4azBacHpHalpSOWZpZUNlYkRBV3pU?=
 =?utf-8?B?MEJCelBZRnhyZG1xbmdCMkpEQUpRT2hseGJaekZBRWErWVpzYXB0Y1RqaDlr?=
 =?utf-8?B?eENmYllYb0RwT3VkQ3lZYnp4ZmFTS1BCRE5nSC8ydnF1RjZaTWJua2tSTXRR?=
 =?utf-8?B?enFQZ2UwUE1IUmN2Uk9KZURTV0NwVGZJbDJMZ2R3NW9wM3pCOG5VV2NVVndw?=
 =?utf-8?B?bm83ek85SE80WERsdUNHdHphTk5oWmlHaXNNMHVmaUdLL2U5eGNhR09wSEkz?=
 =?utf-8?B?UHd5SHRsaTZFcTViV2hwOW1PZlh2Q2dKVDcwZ3F4V1k1M2llTlhhdGg1Y2VR?=
 =?utf-8?B?OGpWZXJlSW1XQ2pLU3RiUkw1ZFptd1hxbzV0TTBld3BCVHlFR052aEhWcHJ6?=
 =?utf-8?B?dFI2WG0yY08yaHNpVTFKR1ZUYm9aQlJZWU5YelYrVnIrc2xqV1VsczU3ai9z?=
 =?utf-8?B?cWZQZExYd0pJZi81S0xPaWFabzlqNDhnMm80QVhyUkJSUldkVmx5YjJKd3E3?=
 =?utf-8?B?WnFOaUpsZmRUTnY4cDRHdjd2SEVnVHpNZEJNUUVSaEQ2eVZIdTNCZVZnbDVz?=
 =?utf-8?B?V0k3SzJrNFlRPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8695.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ejJVRENnUkVoUno1cWkycS9DVS8xeHVRdE9uR2ZQdHZ2a0hPbU5zZ2pWaXhD?=
 =?utf-8?B?dEErWFduT1RKZlFzOFNnSS90dUFHTElEek1RTXJINitDZWZncGZiay9paDhR?=
 =?utf-8?B?ZUh2UVNjc1BPOEhsbStSK1htMXZuVUY1L2x3dGFNbmRTQ01BUEIwQ1NCMndF?=
 =?utf-8?B?eDR3QUlBS3ZzQVd2OFUyVndLek5mbTZlWS9DZjlaZlFvS3RJNHk5OGRNTjNC?=
 =?utf-8?B?TDhrY1grcE1YamIzemFEcFZldjZpdXNuQjVUQStFU2RhdzNDSHdvWWNGV2tq?=
 =?utf-8?B?U2hXTHp6cENjWjRjblpvSG90TEtkeUp6c3JIVXVqOE1aUlozSmVVQW5oSDJB?=
 =?utf-8?B?K0EzNFdjcjUwYVQ4RDhsYUxyemNPRm1CbmZ0TEprb1ZoaCsxRk54VUMxeFds?=
 =?utf-8?B?ZUtkWEVsTVFNWnIwbGVBeGpmMWNmOFhSMVN3OE1kckJmZHRhS3hqaUJBdks4?=
 =?utf-8?B?VlRRaXhBTGhla1ZTaFhxWXIzcElKVlM1dU8wdDd6SWlab3kwZlB1c2RxT2NU?=
 =?utf-8?B?U2ovQ0NRTFllMEU3WE81bDViWmplZ044M3NBbllmSmF3OGZyOWFCcVlpVkVQ?=
 =?utf-8?B?NDZFaERxRWZ2YlQyRzcyUndWZ0RSbVVwWnljRE5JOWYrd1doQnBwUE9QcXhT?=
 =?utf-8?B?Mzlqd2xITU9HUVVvRXhDUktSK2tIK3NEQUYzU3ZRNHpDY0NoN0QxQ2lHUVJZ?=
 =?utf-8?B?cWZPZVZRYUIvY1FRU29nc1dGMHptOUt5cGlna0p2dmljdnZ1cFJyZlJmSlV1?=
 =?utf-8?B?ckhOT1pOL253OFFFc0hmNW50V0Y2bWxJVXV1cEZBRk1EVHlINStxdm9NVWg3?=
 =?utf-8?B?cm1JWERGT2h2QXlXT1RvdWliemVxYjN4aHpaWlV1Uk1tV3dkQjU5WDdaU3lK?=
 =?utf-8?B?cVZHemc2N0tkUGl3THJVUTdZNDFleXZVQzNReWh3b3JOMlFkVVpUaDJJQmRF?=
 =?utf-8?B?M3R3b09CbmVVWXpoeXZHNElZc0RxN3V1V285K3AyZE1QNHNCTjUyWEJTRGYz?=
 =?utf-8?B?V2M0bmhTQWtkTnB4TGdZSGFEWTdnbHFYRWR3SGx4bEJPL1RrSUhaVDB5UmhR?=
 =?utf-8?B?eWhZZEZiSnJ1dm1vVjBMWHpZMW05MGt3ZWhQMU52YlVtNVZWcVMwU0Q5K0V4?=
 =?utf-8?B?S0VZdGNMQTNhMDVkM0JSUkZCYUNwRURYWmdGVVJ2NG42TWFaVndqYXFPSVZC?=
 =?utf-8?B?RTh2UXN2YncwRkwxdXJHRmhFOWVqd0ZvZFF1U01hcWlXcGcveDdlREU5MUVE?=
 =?utf-8?B?d1ZkRm1kTXNrK3RicDE4ckxyNGsvK1JRQ1drZnJXbVBBOXgvWHUwQXY4UlNH?=
 =?utf-8?B?ekowUTdkcDVDMnJ6UG8rZVlOZllidDRlVXpTWVlFL00wWnlJU0o5Vmk4RXVt?=
 =?utf-8?B?emE0dUd0WkREdk4wOXZwMnlNRlV2dWlDdmRDUWxxdXQzSHVNbHJTZXFhUnpG?=
 =?utf-8?B?YlBON21rUWxQazU3Q051UHpqUFpDcGtpUVE1RTExUlVqOHRlNEx6OC9NZkdo?=
 =?utf-8?B?K2xLeEpFRXlvc2MzZkZ4MktRRTRkUGFJSUtyaEMxamJveW5hNWpaZExpRmZ5?=
 =?utf-8?B?QlRLV2l4cGZEUEo3QURqNEt4dmpCcXNMMUJGUWxZRkc0OHcwR2ZGbXFVT1Ba?=
 =?utf-8?B?V05lQklWeGlpYWM5TFUrMENBdU5WanI2Qi8vZmJBRDRQRVFzeDk3dzNReDZM?=
 =?utf-8?B?dWlORTZVUWl4YlhYdUduQTFjUUgyOVZDZUFHUUJsOEFrMm1iT0dxN2tqUnA1?=
 =?utf-8?B?a0g3dThIejRzdVpxOFY0TnEyczNWOW1QZmlCRk5EdURLU3V0V29tdVZYeVdt?=
 =?utf-8?B?R1p2Q3ZIekMrZG5jVlhTMDFUbjlEUzJhNEJPMThHeWR2ck5mSGxDek5RNDNJ?=
 =?utf-8?B?akRqV2ZCNzZzcmd6WGJ4ZUI5dmJOa0t4Z1kyb21uWk4zV3VaWmdZZ3U3YW5G?=
 =?utf-8?B?MTFqU0NuZUNpdVRlOHhmS1Izc3JzVXJ5Q0xLOFpjWFRjajJ3amtGM0xxRkRo?=
 =?utf-8?B?VjNCM2VNY3QrTXhGOGp5aW9DVXViV0swdTZSS3lLSmczdkhqeHhzOG9mMnds?=
 =?utf-8?B?TmcxaTNNeld5azRocy9WV2hJc0NyRmJSU0p3Qnl6MDVGZ05FRWs3b2RDazZ2?=
 =?utf-8?B?V1BkRExPaEJqaVhhbktQNEFDSWRrL3NxdmlhbXVmNjR3d0E5U2pIQll5OGdD?=
 =?utf-8?B?UlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8695.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbe0fcd7-0b3d-42e7-7b21-08dd6c2cbc57
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2025 06:09:15.0481 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Do9n+z9QBmHw/nydLRyrNIAT+4LywuJO/USPgXcVCrDRMrjoBsQzOgkQVx3w7ERvWOirn/rJCudeTOJJsraObjSRHuP2X8mUOD009K2arHY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8431
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

SGkuDQo+IEZyb206IEF1bGQsIE1hdHRoZXcgPG1hdHRoZXcuYXVsZEBpbnRlbC5jb20+DQo+IFNl
bnQ6IEZyaWRheSwgTWFyY2ggNywgMjAyNSAxMTo1OSBQTQ0KPiBUbzogaW50ZWwteGVAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBLIFYgUCwgU2F0eWFuYXJheWFuYSA8c2F0eWFuYXJheWFu
YS5rLnYucEBpbnRlbC5jb20+OyBUaG9tYXMgSGVsbHN0csO2bQ0KPiA8dGhvbWFzLmhlbGxzdHJv
bUBsaW51eC5pbnRlbC5jb20+OyBCcm9zdCwgTWF0dGhldw0KPiA8bWF0dGhldy5icm9zdEBpbnRl
bC5jb20+DQo+IFN1YmplY3Q6IFtQQVRDSCB2MyA0LzhdIGRybS94ZS9taWdyYXRlOiBpZ25vcmUg
Q0NTIGZvciBrZXJuZWwgb2JqZWN0cw0KPiANCj4gRm9yIGtlcm5lbCBCT3Mgd2UgZG9uJ3QgY2xl
YXIgdGhlIENDUyBzdGF0ZSBvbiBjcmVhdGlvbiwgdGhlcmVmb3JlIHdlDQo+IHNob3VsZCBiZSBj
YXJlZnVsIHRvIGlnbm9yZSBpdCB3aGVuIGNvcHlpbmcgcGFnZXMuIEluIGEgZnV0dXJlIHBhdGNo
IHdlDQo+IG9wdCBmb3IgdXNpbmcgdGhlIGNvcHkgcGF0aCBoZXJlIGZvciBrZXJuZWwgQk9zLCBz
byB0aGlzIG5vdyBuZWVkcyB0byBiZQ0KPiBjb25zaWRlcmVkLg0KPiANCj4gU2lnbmVkLW9mZi1i
eTogTWF0dGhldyBBdWxkIDxtYXR0aGV3LmF1bGRAaW50ZWwuY29tPg0KPiBDYzogU2F0eWFuYXJh
eWFuYSBLIFYgUCA8c2F0eWFuYXJheWFuYS5rLnYucEBpbnRlbC5jb20+DQo+IENjOiBUaG9tYXMg
SGVsbHN0csO2bSA8dGhvbWFzLmhlbGxzdHJvbUBsaW51eC5pbnRlbC5jb20+DQo+IENjOiBNYXR0
aGV3IEJyb3N0IDxtYXR0aGV3LmJyb3N0QGludGVsLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dw
dS9kcm0veGUveGVfbWlncmF0ZS5jIHwgMTUgKysrKysrKysrKysrLS0tDQo+ICAxIGZpbGUgY2hh
bmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0veGUveGVfbWlncmF0ZS5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL3hl
L3hlX21pZ3JhdGUuYw0KPiBpbmRleCBkZjQyODJjNzFiZjAuLmRiZDRiZmY3NTc4MyAxMDA2NDQN
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX21pZ3JhdGUuYw0KPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0veGUveGVfbWlncmF0ZS5jDQo+IEBAIC03NzksMTAgKzc3OSwxMiBAQCBzdHJ1Y3Qg
ZG1hX2ZlbmNlICp4ZV9taWdyYXRlX2NvcHkoc3RydWN0DQo+IHhlX21pZ3JhdGUgKm0sDQo+ICAJ
Ym9vbCBkc3RfaXNfcGx0dCA9IGRzdC0+bWVtX3R5cGUgPT0gWEVfUExfVFQ7DQo+ICAJYm9vbCBz
cmNfaXNfdnJhbSA9IG1lbV90eXBlX2lzX3ZyYW0oc3JjLT5tZW1fdHlwZSk7DQo+ICAJYm9vbCBk
c3RfaXNfdnJhbSA9IG1lbV90eXBlX2lzX3ZyYW0oZHN0LT5tZW1fdHlwZSk7DQo+ICsJYm9vbCB0
eXBlX2RldmljZSA9IHNyY19iby0+dHRtLnR5cGUgPT0gdHRtX2JvX3R5cGVfZGV2aWNlOw0KPiAr
CWJvb2wgbmVlZHNfY2NzX2VtaXQgPSB0eXBlX2RldmljZSAmJg0KPiB4ZV9taWdyYXRlX25lZWRz
X2Njc19lbWl0KHhlKTsNCj4gIAlib29sIGNvcHlfY2NzID0geGVfZGV2aWNlX2hhc19mbGF0X2Nj
cyh4ZSkgJiYNCj4gIAkJeGVfYm9fbmVlZHNfY2NzX3BhZ2VzKHNyY19ibykgJiYNCj4geGVfYm9f
bmVlZHNfY2NzX3BhZ2VzKGRzdF9ibyk7DQo+ICAJYm9vbCBjb3B5X3N5c3RlbV9jY3MgPSBjb3B5
X2NjcyAmJiAoIXNyY19pc192cmFtIHx8ICFkc3RfaXNfdnJhbSk7DQo+IC0JYm9vbCB1c2VfY29t
cF9wYXQgPSB4ZV9kZXZpY2VfaGFzX2ZsYXRfY2NzKHhlKSAmJg0KPiArCWJvb2wgdXNlX2NvbXBf
cGF0ID0gdHlwZV9kZXZpY2UgJiYgeGVfZGV2aWNlX2hhc19mbGF0X2Njcyh4ZSkgJiYNCj4gIAkJ
R1JBUEhJQ1NfVkVSKHhlKSA+PSAyMCAmJiBzcmNfaXNfdnJhbSAmJiAhZHN0X2lzX3ZyYW07DQo+
IA0KPiAgCS8qIENvcHlpbmcgQ0NTIGJldHdlZW4gdHdvIGRpZmZlcmVudCBCT3MgaXMgbm90IHN1
cHBvcnRlZCB5ZXQuICovDQo+IEBAIC03OTIsNiArNzk0LDEyIEBAIHN0cnVjdCBkbWFfZmVuY2Ug
KnhlX21pZ3JhdGVfY29weShzdHJ1Y3QNCj4geGVfbWlncmF0ZSAqbSwNCj4gIAlpZiAoc3JjX2Jv
ICE9IGRzdF9ibyAmJiBYRV9XQVJOX09OKHNyY19iby0+c2l6ZSAhPSBkc3RfYm8tPnNpemUpKQ0K
PiAgCQlyZXR1cm4gRVJSX1BUUigtRUlOVkFMKTsNCj4gDQo+ICsJaWYgKHNyY19ibyAhPSBkc3Rf
Ym8gJiYgWEVfV0FSTl9PTihzcmNfYm8tPnR0bS50eXBlICE9IGRzdF9iby0NCj4gPnR0bS50eXBl
KSkNCj4gKwkJcmV0dXJuIEVSUl9QVFIoLUVJTlZBTCk7DQo+ICsNCj4gKwlpZiAoWEVfV0FSTl9P
Tih0eXBlX2RldmljZSAmJiBjb3B5X29ubHlfY2NzKSkNCj4gKwkJcmV0dXJuIEVSUl9QVFIoLUVJ
TlZBTCk7DQo+ICsNCj4gIAlpZiAoIXNyY19pc192cmFtKQ0KPiAgCQl4ZV9yZXNfZmlyc3Rfc2co
eGVfYm9fc2coc3JjX2JvKSwgMCwgc2l6ZSwgJnNyY19pdCk7DQo+ICAJZWxzZQ0KPiBAQCAtODM5
LDYgKzg0Nyw3IEBAIHN0cnVjdCBkbWFfZmVuY2UgKnhlX21pZ3JhdGVfY29weShzdHJ1Y3QNCj4g
eGVfbWlncmF0ZSAqbSwNCj4gIAkJCQkJICAgICAgYXZhaWxfcHRzLCBhdmFpbF9wdHMpOw0KPiAN
Cj4gIAkJaWYgKGNvcHlfc3lzdGVtX2Njcykgew0KPiArCQkJeGVfYXNzZXJ0KHhlLCB0eXBlX2Rl
dmljZSk7DQo+ICAJCQljY3Nfc2l6ZSA9IHhlX2RldmljZV9jY3NfYnl0ZXMoeGUsIHNyY19MMCk7
DQo+ICAJCQliYXRjaF9zaXplICs9IHB0ZV91cGRhdGVfc2l6ZShtLCAwLCBOVUxMLCAmY2NzX2l0
LA0KPiAmY2NzX3NpemUsDQo+ICAJCQkJCQkgICAgICAmY2NzX29mcywgJmNjc19wdCwgMCwNCj4g
QEAgLTg0OSw3ICs4NTgsNyBAQCBzdHJ1Y3QgZG1hX2ZlbmNlICp4ZV9taWdyYXRlX2NvcHkoc3Ry
dWN0DQo+IHhlX21pZ3JhdGUgKm0sDQo+IA0KPiAgCQkvKiBBZGQgY29weSBjb21tYW5kcyBzaXpl
IGhlcmUgKi8NCj4gIAkJYmF0Y2hfc2l6ZSArPSAoKGNvcHlfb25seV9jY3MpID8gMCA6IEVNSVRf
Q09QWV9EVykgKw0KPiAtCQkJKCh4ZV9taWdyYXRlX25lZWRzX2Njc19lbWl0KHhlKSA/DQo+IEVN
SVRfQ09QWV9DQ1NfRFcgOiAwKSk7DQo+ICsJCQkoKG5lZWRzX2Njc19lbWl0ID8gRU1JVF9DT1BZ
X0NDU19EVyA6IDApKTsNCj4gDQo+ICAJCWJiID0geGVfYmJfbmV3KGd0LCBiYXRjaF9zaXplLCB1
c20pOw0KPiAgCQlpZiAoSVNfRVJSKGJiKSkgew0KPiBAQCAtODc4LDcgKzg4Nyw3IEBAIHN0cnVj
dCBkbWFfZmVuY2UgKnhlX21pZ3JhdGVfY29weShzdHJ1Y3QNCj4geGVfbWlncmF0ZSAqbSwNCj4g
IAkJaWYgKCFjb3B5X29ubHlfY2NzKQ0KPiAgCQkJZW1pdF9jb3B5KGd0LCBiYiwgc3JjX0wwX29m
cywgZHN0X0wwX29mcywgc3JjX0wwLA0KPiBYRV9QQUdFX1NJWkUpOw0KPiANCj4gLQkJaWYgKHhl
X21pZ3JhdGVfbmVlZHNfY2NzX2VtaXQoeGUpKQ0KPiArCQlpZiAobmVlZHNfY2NzX2VtaXQpDQo+
ICAJCQlmbHVzaF9mbGFncyA9IHhlX21pZ3JhdGVfY2NzX2NvcHkobSwgYmIsIHNyY19MMF9vZnMs
DQo+ICAJCQkJCQkJICBJU19ER0ZYKHhlKSA/DQo+IHNyY19pc192cmFtIDogc3JjX2lzX3BsdHQs
DQo+ICAJCQkJCQkJICBkc3RfTDBfb2ZzLA0KPiAtLQ0KTEdUTS4NClJldmlld2VkLWJ5OiBTYXR5
YW5hcmF5YW5hIEsgViBQIDxzYXR5YW5hcmF5YW5hLmsudi5wQGludGVsLmNvbT4NCj4gMi40OC4x
DQoNCg==
