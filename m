Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AA2CC0219B
	for <intel-xe@archiver.kernel.org>; Mon, 10 Feb 2025 07:58:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C555B10E4C1;
	Mon, 10 Feb 2025 07:58:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jlcyyFf2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55D8710E4C1
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Feb 2025 07:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739174326; x=1770710326;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=aFk9Zx2VVgRJfgOnUYMIQrA9w+ngLEah9gsMmzKbsVg=;
 b=jlcyyFf21phPSB4yNbt4TefcVXHdeh5Pl4hEfRAm9C06OlzxLUQia0XF
 8F2uTInOQusCsmaJQxdYw2BXCtyG9mxTVmT2+0J2HYtbRDuRfOgAUpvif
 R0MfCQ4Dlb1QN5pd76zF8jbH08fhRhBobpsHuAm1zeCmcoX2yPZkXpST0
 aINcaW5geFEy3xhI5M/YXwYPnRzL6pBNv78eNv/VoRbk7wnrVI18NMFJZ
 Jgsrz5rSPBM8xEReIJftgdyUDzsJt5JwAkpGbfDgzJW8qDJlVvb8URP9X
 Qm7nU6tfgkddA6Vz+STneAr1jL/pbVex/C56JX6ltzzcaY4wPdlxBJKZg g==;
X-CSE-ConnectionGUID: jScag0puT3+7/SV7798PJg==
X-CSE-MsgGUID: fkq3WKNPT6WRaXWtSz6/Iw==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="57276842"
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; d="scan'208";a="57276842"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2025 23:58:32 -0800
X-CSE-ConnectionGUID: 10JeUDm1Rr6sjZG0F81O5w==
X-CSE-MsgGUID: jFjiW3LzTxOurc0XxmPNLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="112550549"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Feb 2025 23:58:32 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sun, 9 Feb 2025 23:58:32 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Sun, 9 Feb 2025 23:58:32 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 9 Feb 2025 23:58:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gu8CgycvoZISg/f9D2uyOS2ek6y712ofKGekJRS6yUBbD2BvCfdQWAV9wSxp3ybogI0wqOxssWzeDMReHjzT2gBBTdnIw3V5o2OZGjlehUAzUJdxB4qhu40tAMCByZ9sloH7vx6kxIRivWdEx2GUqTisoWNY+9nRY4Kw2c3YHx56OxXw4mkcZg+AViOddMCe6ItKoX75WgIqAxyMxxsZdVpOL6dW+BwBLf1tqtPRUlFOAwFBq9Jkf85myEnuuNN/m1HDPIFo+K9bLTtRjf+pCtLZj2PfCsh4n/OSCAhF9fSXAEcvwTncu1AdT+9064Rjtrm0j6Ylvh+o4Ng8osQLgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aFk9Zx2VVgRJfgOnUYMIQrA9w+ngLEah9gsMmzKbsVg=;
 b=wFWoGsqHjVbPHlo5f8XOb/MIT3GoMiwy2oyzH7VzjmSwMCYZ80VL7rhUlGGdVIwSKFN8r0ojzboXqpKFXzVqoigiohboU32ijdjMoNvAgGOzUOHDKxhWswgJbRbIRLtdp/l1rqhkUrpwnSRdfoDwxGLaXofQjbK6jwC9JkaDmJA9B2DMIPEyp6BnTsOsGuH5nNVNDHrsx1FwXl9NvREeBrszf58eeeEPy70oiIkkXT8MRiTS8BNn1NXl3WLyfD0A0q9GGzBaFAOvt6wOwgMcdN3DuzBhz2y8TbYlHkwUvKcJgbE6gWPVExm9gIegnsFfwGghSBxWgjUdi5nh5NyRow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by CY8PR11MB7172.namprd11.prod.outlook.com (2603:10b6:930:93::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.12; Mon, 10 Feb
 2025 07:58:01 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541%6]) with mapi id 15.20.8422.012; Mon, 10 Feb 2025
 07:58:01 +0000
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "De Marchi, Lucas" <lucas.demarchi@intel.com>, "Wajdeczko, Michal"
 <Michal.Wajdeczko@intel.com>, "Winiarski, Michal"
 <michal.winiarski@intel.com>, "Nerlige Ramappa, Umesh"
 <umesh.nerlige.ramappa@intel.com>, "K V P, Satyanarayana"
 <satyanarayana.k.v.p@intel.com>
Subject: RE: [PATCH 2/2] drm/xe/client: Skip show_run_ticks if unable to read
 timestamp
Thread-Topic: [PATCH 2/2] drm/xe/client: Skip show_run_ticks if unable to read
 timestamp
Thread-Index: AQHbeAKwpi85OYF3RkikY7fNGtfjQrNAMssQ
Date: Mon, 10 Feb 2025 07:58:01 +0000
Message-ID: <LV3PR11MB8695C89F7941AB234C9B800CF9F22@LV3PR11MB8695.namprd11.prod.outlook.com>
References: <20250205191644.2550879-1-marcin.bernatowicz@linux.intel.com>
 <20250205191644.2550879-3-marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20250205191644.2550879-3-marcin.bernatowicz@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR11MB8695:EE_|CY8PR11MB7172:EE_
x-ms-office365-filtering-correlation-id: 4e58286c-fba2-4c36-86c6-08dd49a8a415
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?SXV5SDdvNWdvd1hoWENYRm04V0thUFdQVlhQRFo4RjVMekttVC9aTW9QYWk3?=
 =?utf-8?B?K1RmVWNKR2J3Z3E1MkdtSVUrL1JRMmFkR0VNVFYxVmxpS280cGpJTW81cDlj?=
 =?utf-8?B?SFQwOG1uMk95YWV1Mlpod2FSUkkzTUhSZElZTFFaeFBheGRNTjd6SnVMNlRl?=
 =?utf-8?B?Q0hnY1lKNm0rSXV0TWxaa09LSWpwT2x6dUQ1bFVyNHN6OE5jbklDR3J0ZXJu?=
 =?utf-8?B?WEp2TzZFV0MzV1R2WU9CaTBWUUg5dU1UOVZPUVVLVGFWV2kvcjNFMlFpN2NY?=
 =?utf-8?B?blYyNUpaWHhnaHJ1SEZLRUtqRjIxMVBDb3FGN08zd3UzcnhpM284cEdlWjNO?=
 =?utf-8?B?OUJCako1eWRZdWRZQStXUWlUMlBWVVloNU8wYkZibmJzeXlHTGw0dkFDZEJ0?=
 =?utf-8?B?MVcvS0pQUUZOTng4NW83aDFWL3RhbG9aVlhwcFgyTkxrZVVFam0zWDZvTmRn?=
 =?utf-8?B?TFFkS29aRVlVVTA1UHFWV0xlSi9TSmI1OWI5TWxUOXdQR3J2YStNRzUraUtJ?=
 =?utf-8?B?ZnZQaUtJTUpKZzA3Q2Z5cWY3WFF2bFFSd2FLc2V4QXlHcVpTM0NMbGJ4QWdQ?=
 =?utf-8?B?S3BoNngvOEhyOU9XazFTaDlReUN2WU5yZGZNZVl0Q2dLdEtmOTZYYXVLWXBT?=
 =?utf-8?B?R1VDaWpmWUVwbUlFZ1RWdTdlZmtyRVIyVjN2VzU5K3Rvd1FrZHNlcmRsSTVR?=
 =?utf-8?B?ZnIzbUhsZThzZUtvcWFQZUcxbTMramdRNUhMalRwUDdCTHlhTWl6a293RDFN?=
 =?utf-8?B?ODYwZ2pGSGFrUTRJR3BMVzJsQW43NnhQQTZNWk5JVUJtck5waXJnbmo3U2Fl?=
 =?utf-8?B?Qjk5Z1pPZlFRS0ozdmN0T3ZJTW5ndnJBRmRXQm5ydWFZYXkvd1RhQ0ZtWEFX?=
 =?utf-8?B?Qm1RWElYdjFEWXk0VUsyd25vZVc2Q1EwZUZRdHpxT1JLZU9hbndQaEpMeWMv?=
 =?utf-8?B?OUtZRjRZUVNqZk5DOWhLYm13VkZicmtGdEJ0aERRbnhLdnBSc0xZSkdzam80?=
 =?utf-8?B?bTZzRU5KWFlZVEI0b0pKSW1lRjNIL2hQOE9Ma2NrOVVGSnEyK3RyRGV0VjFD?=
 =?utf-8?B?YnZXM0FCNlIwcEJFUkpNSmRESTg5ZE5GdjZMMld2OEVaa2MwVXQ3M1BuL1hZ?=
 =?utf-8?B?cW8zRkhubzQwZU51aFlzaUw0RlBkeVhST0xaSENhUTZaU2xja2VSUDdVRmNy?=
 =?utf-8?B?U3pteWVXRTJMa29weHRxa2NaQm5oaEUvdHRvZVR2dDBjR0tDcTZjQ09iM3VN?=
 =?utf-8?B?NkxYVmRkQVhWdk80OWhWUG9rUms4Rk4yd29vZVkwVW1uUmFZemE2eisyVVNX?=
 =?utf-8?B?ZVd2TFNOZENxb040RG8zcDlyM2d2WVl4RittWkJjdXdPTytnM3RhOWpmMXlF?=
 =?utf-8?B?bWQybi9ISkRYZ1dhUjJhVC85SElOa2hDVFBxNzJoa29PWCtHS2ZaYndYWnBp?=
 =?utf-8?B?Z2FMMEVPaWlxekUrajVyMTczdGg4TWoxNXllU3EwT3NnN1pzWUpob2wwU01r?=
 =?utf-8?B?M1crTUJCWFVlMUV6SmxPcW50cnkray9WLys2Q1NGZ3dPTmw5UloyQjgvYUJO?=
 =?utf-8?B?bkh4WklLMnJzY0tVVXZkbXRRTERzem1jVURrMDZEYngwWUNuM1h2N2tBcEFp?=
 =?utf-8?B?eWpaM0VKNVZ3Mkw3MUlvdkNYNFk5TUp3S0VzT1ZOK2NzWHRTOVB6dGplQjJZ?=
 =?utf-8?B?TStEVG1IV05CVk0rT0NVc3c5NEswdGMvSkpmZWJJSGZsYjBRYW52Y3ViUWx0?=
 =?utf-8?B?WDA4cWk3eEpzblN2VmFiOFBZNnJzQXpuYmovemtBRDZUWXhjTTJWUmFOQm5Z?=
 =?utf-8?B?K3Fmd2M2NDN3aFNvQ1BWQTdvVUdyaVI0UXEwbHlnNFJHY0F0MHUrRUV0emJr?=
 =?utf-8?B?TTBrS2t4b2JmYlJLS0hZZnRkbDZrSFFrTW85cndrOHgyRHJYSXhJNXkvZmdM?=
 =?utf-8?Q?YSk0JqunrB7x7hvE/YYHBABL83K5FtA0?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8695.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MXR1VjNqRjJtMyswWnhQa1dHQUpVUlZMaEV6QXNQV1JERmkzUHNLL1NHMHBG?=
 =?utf-8?B?VFJCQkJxd3U4SjlUM3VoN0lBZFpJRXJOVjZERVJjMFp2d1JLeDlPelNJZTRP?=
 =?utf-8?B?VWNMVGtFQXhTTGZIc3h2c0F5cnovWmlzWXg1cEVtR1FBZ2YrWTFXdGRzMi9M?=
 =?utf-8?B?L1lBeENlR1lUT1dIanB1a3B0cnZZOHJLV0w4T3BnRkZtQ2cxT3A1d1pEa2Ew?=
 =?utf-8?B?ZUtxdjMvMnRXNEpnalpMbWNsV0xzRUZpWmNvR1dEejk3OUNrTW1sSWYzczhY?=
 =?utf-8?B?OS85QUE2NWdnQXpkdXhXZy9GZjdFeEZka1crWmRxbnlqOHFoSjhKMC9MUWFR?=
 =?utf-8?B?OFVjYm03VU9oQ3Ric0pBV05MeWdHL0JUL3ZMZ1YrVWRvZDNHaTI3MnJORE14?=
 =?utf-8?B?RU1iS1JaME90bks4MG1tWVh4S091TkRyTEc0dFF5MHdrK1FOQlNNUDRLelNz?=
 =?utf-8?B?Qk9ZemVoY3kwU2g0YjVWZUdBNWdhT3lWeWxoTDFXOUY0OHJRSnBIYitxdldJ?=
 =?utf-8?B?Z2RNc25KcXZQdnpwUEJMdnBYQXMrc2VieVlkZkpoZjljeTdublhMTEZzQVdt?=
 =?utf-8?B?RnJmaktpZEYzTjhVcGxHNnlYN1BQbS9vdVNsL1FUK3BFNDBXOVRSTEFlNlFG?=
 =?utf-8?B?VkJ2SHpLR0VlWWdlL29lQk5XN1pxdDlNUGRaRVhSeTk1Q09mSWthSUZzMFEv?=
 =?utf-8?B?YlB0V0NmTzhLaGw2bzU1cEdYTGJyNTl6WGxPSU9Ddms5SEtpVDJkRkZZdHBv?=
 =?utf-8?B?WlZ1YjJHWExGK1Q5dTNMUUY0a0Qza29MVE9KRUFlTDhCS04zU1lsQlFkUHFk?=
 =?utf-8?B?SGI5dTR2QUQ3MFRhcEpyVDdiUTFENXhXaGhBSStSVVVHblRDY2p4UDAzTU9V?=
 =?utf-8?B?TlV1a1ZXU1drZmNWQm5ZQTFRQUovQ1daaWMxOXhLWlY2THVmNGdQMzBmcFdI?=
 =?utf-8?B?TFU1QmJCTFBHLzUrdDl5VDIwc0NMSWhGSmZTanVMTS9hRGdrWlZ2VmREdEJ1?=
 =?utf-8?B?YTcxaUJBcHZPa0NYTk9BR2lCeXRTL3psemg0TkNwdWpGR3h0cmZBOE9iQ25N?=
 =?utf-8?B?SlQvNlNiSnRkMDBHakN0S1RkaU1nSDU0bTF3UU9BSEE3dTJnQTgxTjV4bGI1?=
 =?utf-8?B?ak9LZHZtWFgvMk82TDBocHcyZGw1SHp1bER4U2g0RS9NRitkREVKTnBYZU95?=
 =?utf-8?B?L3BTUUZGWXJUSEwxTnFLcXNJRDJ4NUlDUmE0SUNkc0JxblBUMFB0RUhISFRY?=
 =?utf-8?B?Ymdpdm9yajBRVysrRGIrNlR4SDQ5UzZQVkVBdzcxazZnY0tsM1BqOWRpYWN2?=
 =?utf-8?B?VVJPR2NsSW9Hb1l4UXZPT3ZrMHF4YUhpV3IzaDlkZWo3SitTczJSZnM4cTdh?=
 =?utf-8?B?VVFHUE5XWDFxSEZOYWErWS9VMlhaYzBHNzM4dENWTXRGN2U3ZDMxWCt0OHpk?=
 =?utf-8?B?RityTWl2RDJpVEpYNFJZOFNvK0srcFB4Q2tjSks3dnp3WGdrSEg3dW82SE9V?=
 =?utf-8?B?bVR4SEQ4QjBCTmhES0JqY2hTdHFqR2lRelk4VVBXUUFzYjZRK0NsUVpPTmd5?=
 =?utf-8?B?ZlRTR1dwNU5WOHpOM0wrU0hYNG5Mbm1Cc0V4UkxFZ2IyemJsNzdBNElVUUl0?=
 =?utf-8?B?ckhIaWdTZGZaMmh2ajd3TC9IazAyeUJhREFLVnVqOE9ZYkk0VC9hUUEreVVj?=
 =?utf-8?B?YXF3MFliWE1RT2EvUDA5dFlsQys3MlFKa0xYNE5OMnRtM1E4Y3J0bXFDV3FL?=
 =?utf-8?B?Q1JCUlE1UzAyNEtVekp3M1dTNEZkNzVxSGpPSTkyQXg5WUQ5YXRBMVhMVjQ5?=
 =?utf-8?B?U2c3d1RPYjZOOWRweWpMaWZ5cTRleXFEZmozMHVaU3RmN1dRdU9WQXNHcklG?=
 =?utf-8?B?dzdEdlhtSWhURjJIUTNIUXl1V24vcjNocEJTa0ViclZwUDZ2R0VLZDUreG1v?=
 =?utf-8?B?ZEU5RHJkbi9tRW51eTA3TGIvZEdHWmplYWdPYUQ4U1F2Q2xVRjdPYlBtUm95?=
 =?utf-8?B?MkQ3bXAxdmhieXpSVFg5dE9LbEI0cFJTOG8zZCtiSGpSUUQvTkVYVzlpRm5J?=
 =?utf-8?B?U2F0d3Q0OWd2am1BWEE1RXZYZzh5bjJZTmFZR3JoSE4vak4yWXZOcXRBSElP?=
 =?utf-8?B?aUtIZHBsdXlFNGNIWFVSMjY5YjhXQnVCaDZJL0pIR3FucFlIblNMY0xTOTVP?=
 =?utf-8?B?R3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8695.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e58286c-fba2-4c36-86c6-08dd49a8a415
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2025 07:58:01.2616 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mmpM8sPSRzyUf2M4EDpdffWhuJwCGulwa6Hp+umsjiAYbbmQxUem6mlJChpl4FKcjCrN8P2bKoVWV3Zl+pfxswkDsTdVRPdHfkAmRDweA9I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7172
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

SGkuDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEludGVsLXhlIDxpbnRl
bC14ZS1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIE1hcmNpbg0K
PiBCZXJuYXRvd2ljeg0KPiBTZW50OiBUaHVyc2RheSwgRmVicnVhcnkgNiwgMjAyNSAxMjo0NyBB
TQ0KPiBUbzogaW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBNYXJjaW4gQmVy
bmF0b3dpY3ogPG1hcmNpbi5iZXJuYXRvd2ljekBsaW51eC5pbnRlbC5jb20+OyBEZSBNYXJjaGks
DQo+IEx1Y2FzIDxsdWNhcy5kZW1hcmNoaUBpbnRlbC5jb20+OyBXYWpkZWN6a28sIE1pY2hhbA0K
PiA8TWljaGFsLldhamRlY3prb0BpbnRlbC5jb20+OyBXaW5pYXJza2ksIE1pY2hhbA0KPiA8bWlj
aGFsLndpbmlhcnNraUBpbnRlbC5jb20+OyBOZXJsaWdlIFJhbWFwcGEsIFVtZXNoDQo+IDx1bWVz
aC5uZXJsaWdlLnJhbWFwcGFAaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBbUEFUQ0ggMi8yXSBkcm0v
eGUvY2xpZW50OiBTa2lwIHNob3dfcnVuX3RpY2tzIGlmIHVuYWJsZSB0byByZWFkDQo+IHRpbWVz
dGFtcA0KPiANCj4gUklOR19USU1FU1RBTVAgcmVnaXN0ZXJzIGFyZSBpbmFjY2Vzc2libGUgaW4g
VkYgbW9kZS4NCj4gV2l0aG91dCBkcm0tdG90YWwtY3ljbGVzLSosIG90aGVyIGtleXMgcHJvdmlk
ZSBsaXR0bGUgdmFsdWUuDQo+IFNraXAgYWxsIG9wdGlvbmFsICJydW5fdGlja3MiIGtleXMgaW4g
dGhpcyBjYXNlLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTWFyY2luIEJlcm5hdG93aWN6IDxtYXJj
aW4uYmVybmF0b3dpY3pAbGludXguaW50ZWwuY29tPg0KPiBDYzogTHVjYXMgRGUgTWFyY2hpIDxs
dWNhcy5kZW1hcmNoaUBpbnRlbC5jb20+DQo+IENjOiBNaWNoYWwgV2FqZGVjemtvIDxtaWNoYWwu
d2FqZGVjemtvQGludGVsLmNvbT4NCj4gQ2M6IE1pY2hhxYIgV2luaWFyc2tpIDxtaWNoYWwud2lu
aWFyc2tpQGludGVsLmNvbT4NCj4gQ2M6IFVtZXNoIE5lcmxpZ2UgUmFtYXBwYSA8dW1lc2gubmVy
bGlnZS5yYW1hcHBhQGludGVsLmNvbT4NCj4gLS0tDQpMR1RNLg0KUmV2aWV3ZWQtYnk6IFNhdHlh
bmFyYXlhbmEgSyBWIFAgPHNhdHlhbmFyYXlhbmEuay52LnBAaW50ZWwuY29tPg0KPiAgZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX2RybV9jbGllbnQuYyB8IDggKysrKysrKysNCj4gIDEgZmlsZSBjaGFu
Z2VkLCA4IGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
eGUveGVfZHJtX2NsaWVudC5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RybV9jbGllbnQu
Yw0KPiBpbmRleCA2M2YzMGI2ZGY3MGIuLjg0OGRjMDhiZWFjZSAxMDA2NDQNCj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL3hlL3hlX2RybV9jbGllbnQuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
eGUveGVfZHJtX2NsaWVudC5jDQo+IEBAIC0zMjQsNiArMzI0LDE0IEBAIHN0YXRpYyB2b2lkIHNo
b3dfcnVuX3RpY2tzKHN0cnVjdCBkcm1fcHJpbnRlciAqcCwNCj4gc3RydWN0IGRybV9maWxlICpm
aWxlKQ0KPiAgCXU2NCBncHVfdGltZXN0YW1wOw0KPiAgCXVuc2lnbmVkIGludCBmd19yZWY7DQo+
IA0KPiArCS8qDQo+ICsJICogUklOR19USU1FU1RBTVAgcmVnaXN0ZXJzIGFyZSBpbmFjY2Vzc2li
bGUgaW4gVkYgbW9kZS4NCj4gKwkgKiBXaXRob3V0IGRybS10b3RhbC1jeWNsZXMtKiwgb3RoZXIg
a2V5cyBwcm92aWRlIGxpdHRsZSB2YWx1ZS4NCj4gKwkgKiBTaG93IGFsbCBvciBub25lIG9mIHRo
ZSBvcHRpb25hbCAicnVuX3RpY2tzIiBrZXlzIGluIHRoaXMgY2FzZS4NCj4gKwkgKi8NCj4gKwlp
ZiAoSVNfU1JJT1ZfVkYoeGUpKQ0KPiArCQlyZXR1cm47DQo+ICsNCj4gIAkvKg0KPiAgCSAqIFdh
aXQgZm9yIGFueSBleGVjIHF1ZXVlIGdvaW5nIGF3YXk6IHRoZWlyIGN5Y2xlcyB3aWxsIGdldCB1
cGRhdGVkIG9uDQo+ICAJICogY29udGV4dCBzd2l0Y2ggb3V0LCBzbyB3YWl0IGZvciB0aGF0IHRv
IGhhcHBlbg0KPiAtLQ0KPiAyLjMxLjENCg0K
