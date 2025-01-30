Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40CE5C0218A
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jan 2025 17:13:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 031E110E045;
	Thu, 30 Jan 2025 17:13:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a4DnXCzg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B9FC10E045
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Jan 2025 17:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738257206; x=1769793206;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=xobDZypxucVeFhpiSjZZWOt1gJ174BeJ7/KVOGPyUnI=;
 b=a4DnXCzgsJ9FiYAHALVHUnmiDQV97vYUtC10kV0jZ7RYZA02ZTugud4f
 AVVDZ8BiOMmI2TYG6SNUPVVNUVAfiN2VSxIqm9R/dMnjWgHYt3htYq4nF
 KWTMpCyxuhsT54v5iXIp2hu4Z+E4BAdGRL8pxNrFkd3RmDUAaFleR54BA
 F6jeE1R80a5UtlJt0W90gAGXhlBrhYrF4xJnYSMzav+WPuJ3PMFDItWtD
 JUK57/lFJq6XlBU5kHqA2TvCsLuuE0WZnZmovhCHqq8oqzFv95LndaZ6K
 iRhO67wZdNtKn36q4ArIw1PvK46GzumqsTUv5IGDbDEXK5jpqHAVBvWd3 w==;
X-CSE-ConnectionGUID: +6sctKd6S96em2Q54plAhA==
X-CSE-MsgGUID: bxo7bNMaRNOZyHgLMQpq1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="38519791"
X-IronPort-AV: E=Sophos;i="6.13,245,1732608000"; d="scan'208";a="38519791"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 09:13:20 -0800
X-CSE-ConnectionGUID: hhuSXsv2SBOqo6TwHVGvbQ==
X-CSE-MsgGUID: 1xPy+fyrTS6nHjxMzFCW0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,245,1732608000"; d="scan'208";a="114390828"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Jan 2025 09:13:14 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 30 Jan 2025 09:13:12 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 30 Jan 2025 09:13:12 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 30 Jan 2025 09:13:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xpysYVbyXxB8c+egmsWwQ1dGmohBtqh0W2/TWf7a9SZIk7+TncsNKHgqZ3VqY2kjswqTxPkwep6Q+nkCZvtu1RK3bNpEhwaao1t7c+JHBybWfaWjsPD2d8MojxMP1QhMEg4DCo+UE7sjfCnL3WWG511TcusAJxloc2NBg1zYlSnYIs8T+09Bwo+gVlHkwxahJvMlMdnp97/yrHu83294I+0jRCV513muq+gWma9xZmjByGJp6FZ+hgTFXPFjlCOwE9eScxW7/YT74EocNF6z1yUaUwUrJa5OI7mqC8wDkEyRpYlUXNsByTLEw1WYBB1A9DL9yBp7NEhIOG3KORSiAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xobDZypxucVeFhpiSjZZWOt1gJ174BeJ7/KVOGPyUnI=;
 b=U8UF92TZIbNXesQni+8rCUfQ89rugpfyUZucv8sgCJnXH6/m2uSvUYZ4BqwMBhYBJbodMt9MnsmeqgmGJtXiPH+pIXHGU15q6SiWHHy1+E4+pNhINCanpPQvp2PLjR0DNh3oBuAAduve0GT//qXUvgk4qvyabaRZWCU7qFG5Rbaw5oF803MU8pmECSj6Q6M1wDtc9aUJcP7jITmsImYXy8ebHeREXUjcjzzHvRyCjEU748/DnaWe98kX90LFVJz6maAoF8GORroOGyS0TemOWyYFbA4VsCUosiFlpUcaLcEohJebFHbYXxP6n0l8QyGbPI210lxW7BsYntiw6PQj6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8398.17; Thu, 30 Jan 2025 17:13:09 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4046:430d:f16c:b842]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4046:430d:f16c:b842%5]) with mapi id 15.20.8398.020; Thu, 30 Jan 2025
 17:13:09 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: =?utf-8?B?UmU6IOKclyBYZS5DSS5GdWxsOiBmYWlsdXJlIGZvciBNYWludGVuZW5jZSBv?=
 =?utf-8?Q?f_devcoredump_<->_GuC-Err-Capture_plumbing?=
Thread-Topic: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw6IGZhaWx1cmUgZm9yIE1haW50ZW5lbmNlIG9mIGRl?=
 =?utf-8?Q?vcoredump_<->_GuC-Err-Capture_plumbing?=
Thread-Index: AQHbck1RLAAIQ9CNf06ay29LFy5/0bMvj9kA
Date: Thu, 30 Jan 2025 17:13:09 +0000
Message-ID: <28ae16a6acf4cb55e9c1e97374622f1af22dfea2.camel@intel.com>
References: <20250128183653.4027915-1-alan.previn.teres.alexis@intel.com>
 <173815528724.2353200.4382833443422323387@b555e5b46a47>
In-Reply-To: <173815528724.2353200.4382833443422323387@b555e5b46a47>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|BL3PR11MB6508:EE_
x-ms-office365-filtering-correlation-id: a685c6cb-f527-47e2-adbe-08dd41515ed2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?YlFtdkpnSEVSSGdiUEZUYkkvMHYzenVpakp0Wmk5Y3hUbHVwUDNBQW03dk1U?=
 =?utf-8?B?dXdnMWRBSCtPTENZdWg5NlAxU2tTM3RrUFVZSGdZc0NTaXNxWFNXSHpIMTZ0?=
 =?utf-8?B?SC81TFg0WjlST2dMM01iVGVnUXlkekNRRjJyajNyZUx5UHFRaDlvOVhMLzlu?=
 =?utf-8?B?dzVzSFF1S0J1RjkwZHo1MEs4Y1lhSEZYYXZmeFVNM2NxZEpvQTVUZ1ZheUx4?=
 =?utf-8?B?MEpObU9paEo5ZmNXMnFjc3lpTVd5WTBpVXJvcVVpNFV0aTFNTXpBU1RQMW9F?=
 =?utf-8?B?QjBRK2Q1d1EzUFdQZHFqcGdiNUgyVEtWN1FaRVp6UkZOS29vanBPNUowU3hB?=
 =?utf-8?B?L2wrZ202akJMYnI1Y1ZhK0VCRi9qclhqV0k5VnRUK3Q3eWw1YUQ2OXZva1Br?=
 =?utf-8?B?TTFFWWg1eUR5Ykl2aUZNZ3d6blFUZGFabzV1b0V3bUhnMFkzTVRWdHRMWHI0?=
 =?utf-8?B?elFNSm9PSnNyWlZRVXRKalFLUEIxOCtZcS9RZ0ppa1VabTFQbUdoQUVsdHgv?=
 =?utf-8?B?WEtEcGpvaTdVQTV6NHZpRW85a2xtRUFtSzdBQTUyVWY5eXBUYVpYb1djOVVL?=
 =?utf-8?B?NkNLSm9ZYkNvOHBRcVNRbzN1R3Z3Z0l5ZWIwTFpOd1JuTWl5YmE1dGx5YU9B?=
 =?utf-8?B?b2ZoRUc4UU1iZ0ZwQ1pJV0loR1hTcndHQXZKUUI4ak85aWxBVDJLaVc2WTJJ?=
 =?utf-8?B?d3VRb0cvRGVvWnZMQ1pKMk9wc2djNkpJRnNEMFdqMEY4UXVmQ2l4Zi9rbVYy?=
 =?utf-8?B?WS9BSG5EZWo1MUlRWGdWbnVPL1BpVEtzOHQ1ZEdXTWRhZWc0QUtqUTRDOGNE?=
 =?utf-8?B?VjI2c1hhbFk4Z0lFNjNJa0p2QTF3dm1jbXR1U09keE1rSy9ITVRFa2VpOElB?=
 =?utf-8?B?WU1ybmRJZHhzS2xRam5JbkxmMzV0WDdsZk40YUhRakxqaHdLYUNTcWdFN2I3?=
 =?utf-8?B?MUFMdS9JYjVtMTRMTlBraUdHVk0zY2lEOTJFUkEwU2c2T2dvZWhBK0hFZFox?=
 =?utf-8?B?dmZ6dDd4M1J6d0UzSHRtV0FFZmJJTlpjYnc0VmF3dXdsck00ZXRHYnhLcUxD?=
 =?utf-8?B?VnJTOWVtck41QkhLL0V4bFZVT2YybDRCMEE4MHhnbU1LS0dlMmtuOXhEa2oz?=
 =?utf-8?B?VmhueUhFN3IyL05UaFJUZ3F6Wm1zS0JpRGRYNU5oTG4xakZWZ0huaGxiMzlR?=
 =?utf-8?B?N1VtM3J2S2N5U3g4QzRnMGdjWWtMSWpQZlVDT1g4M3RvRzdmaUY3V0FqMXR4?=
 =?utf-8?B?R0crZEdtelF6aFZ4OHlpVWViajBIejlFRTRiV0daRXlCcE8xWEo4L1crdnZi?=
 =?utf-8?B?L2g1NWoxTUhJTHIwM0RYdDlFdnIrT3gvK2FHRTluSGNTYk1WS3h6N3Mwc3hN?=
 =?utf-8?B?ZHZWUi9qanZMMUs2QW1NMERPdDRXSW5sWWZKVnhSTXZYUUFIVXV0NENSYzJO?=
 =?utf-8?B?VGY5bmdHYzZ1d2pRc0pHN0g2dkMxa0d2Y3hGc210TDlEd1Y2aHZyajdXSzJX?=
 =?utf-8?B?V1FOck9HVzM3VFJ3c09DSnZpdlE4M29aYzd3Z09YUHBaUTArMkw2SE54dENC?=
 =?utf-8?B?OFFVT1lqQUxEbjk0OERKNzFYUmtHYUpmVVExZjBLREJqNmpjeXdYRFdZenFt?=
 =?utf-8?B?a0pjUDlBVGtaaEUxRXVuZEQ5cjBiSVk5dTl6QkVzZWNwblBFazNKV25lOEVn?=
 =?utf-8?B?aHE0dlhnYW1RbG4vcU5POEp4U2FaTmRKcFpyMkpKeWpJTHFvU0xDTTBhczk4?=
 =?utf-8?B?ZmsvL2FMbFQyYXc2NGlobHRNR3hsQldzS21RSG5rZzZqNWJLTXBEV2d5aDdR?=
 =?utf-8?B?N09pb1pZcTFkQW9Ha2dKNE9uN2tjOVBpajBXOFFsaUZKV3gxNW1mdDF0aFNG?=
 =?utf-8?Q?1Au8CyMPEq8mr?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bEFmcE1DYUQ2SXZBQVdpdG9mTkxnUy84Z0YvdW5JQUw0Unlta1BlNVBqWHg0?=
 =?utf-8?B?QjVXM09rNmdpWlQ1V3JxQnBXSWcvY3FwVy9VUHRPMm1QMmZpM1J4M0x5eUVr?=
 =?utf-8?B?b3JWTjgxRGxqYkkzTFNScUQxakJUT3lERkd1bTdWKzZEbUNyejEycURYSWdh?=
 =?utf-8?B?VVJUQWszNmZpbjFmdXRUNmVZdktlYlpjOGN5eW03ckhieHVCaUh1UWxmZlFR?=
 =?utf-8?B?aUJwTk00VnEyeENoOXIrN2hWMGZZbWxMODVMaUxSOU9iWDBLVFF6RHlwY3cx?=
 =?utf-8?B?dWRXTXVRMFpsQkVkRjUzbDh2SkhWMkc0SGZlY2NnSUh1MWJjK0tYMlpENTJl?=
 =?utf-8?B?RDZkY3NWRGhoUnJ2Njd4ZVJURXVzY0ExY2VsMXFtcGF4Ym5Kd2VlNnNWaUZi?=
 =?utf-8?B?YjJqekFIb1hTU2NGVnU5eG1ZeGEwTFN5TGhZbFNIWitlMTRRUVN0NkdvbkF0?=
 =?utf-8?B?d3FwRWw3amtuQkZlaEljOTZEekRoN253aDRXekZ4WU9jWlZQak85OWtpVlZL?=
 =?utf-8?B?eURQeUlhdWQ5c2phQ25yYXRZSXJneUJhM2pyOUZVWG1qOEVsM2x5dzdoOW90?=
 =?utf-8?B?MG1VbzFrMVJubjNwWGlEWWsyYnZoby90K2p4QTFiaTdnd3ZLK1MwSHhFeWtG?=
 =?utf-8?B?SXk4Y0YzMXBsR1N1Z3k3Zlh0RTFrN3RxK0NWQUFIb0laZjNvS1JVS1VHaDNx?=
 =?utf-8?B?YzZsZUo3Sjh0KzFkQjRRbFpPckpyRndnL1N3M0hkVmZsN20xd044cThaSUQr?=
 =?utf-8?B?dWpKaVk0WWtGcS9Wc2E4aXk3eHc1MFZ0aGw1Y28weUJwNTBsc3JzMkFubjF4?=
 =?utf-8?B?LzFUYis3NUJGa253YTN1M1hONmhVamEvcFdNSjdKUzJMWk42cXhmSjVhL1dv?=
 =?utf-8?B?TGloVXNlUFhyVzBYNDZlY0pTOWZOc3VneVZoZWlKdGNOb0lUcmpraVhTS0Vq?=
 =?utf-8?B?UWIxWW1FK3ZzMlRJSktUYWlUcDVjd2lCMS91MHRjd0I1T3V4N3FaN2ZHV0Rm?=
 =?utf-8?B?eEc0NnczNGdURy9VU2NRbE1KeHNMYTA5TCtqaFc0cnlBS2VjWGQ3eVBWeUNG?=
 =?utf-8?B?cVdycDlVQy9yYUtkS1g0akRFa1pHMGpRZEFjdllBc3ZHQUVTV05GSHRJeUc2?=
 =?utf-8?B?ZklaS0xxL3hUcDd0MnRuUDcyc1U4WlNxd2FERk5jZThjZHRsclF4UnB1TG5T?=
 =?utf-8?B?Y2FrS1FzY1JEZFljV1Y4VlA2N0FZa1lVUE1EZ2VpTXpOemppeG4zZ0FiQVMy?=
 =?utf-8?B?RytjemZ2NExDZk5MN0MxL2tWYkxIUzhGMVdHQ3hmQkN3azNSQ0hrSTVPY054?=
 =?utf-8?B?Q2dIOVhDeWJ5am9wSDhUalBTekxnMXU0U25hRllHUm1MeGpuOC9KQXdzczhs?=
 =?utf-8?B?ckdOWjlqcVlpRXhnNnYvRXZ2bVZoSjVjaFV5dVZHbHNOOThvbURjdG1idXAv?=
 =?utf-8?B?dGo0MXZmd2x2YldwZUJacGxqMFROcjRWekRjYnlaQjhJSmZNMW1qdTBCWlpK?=
 =?utf-8?B?MzczRHpoQXJCQUxBckFTc2VhRE1WZlpaUkpObHJIbWsrM3QwNWVBT095b0hz?=
 =?utf-8?B?RkF2VXZyeURSWGhzNEl4OXIvZHZFRGJRS2pWRUhKV2V4KzN4VzMzMzV1S0ov?=
 =?utf-8?B?WVR2Z2Z6MzNCVDJpNG9qZllSVm5lSzFhVXEvcnhEVDVXV29WbGc2M1lxZmx1?=
 =?utf-8?B?ZGZKL3kwdkpRUFZZRHJ1b2RuUUJHRThzZlFsZmp1OTByNTluUDlSVm1LNHhK?=
 =?utf-8?B?QkNZSjh3WUs5UUxmUGtCWWhoYjhoS2ZzemU1WWU4am9oZng0RExROGM3Zm1Q?=
 =?utf-8?B?YXp3NDFPVjRSVElxdzFCTWNrRjhXRzVhZEt0eWRnSTMvQ1YzS0NuQmlUMUNH?=
 =?utf-8?B?KzVkc29tZ002OCtaNVFiMUg3MTliKzBraXhBdmE0WTY3TDQxZk16Qm1KYUtD?=
 =?utf-8?B?U3FtcDFPQjE1WHRBSFBUYjdWcmkxV0xhSVlYT3RmWDgyTTdYU2ltM1o5TzZB?=
 =?utf-8?B?YkNTUmplcElhbjFiRXIyTERWV2FLdXNTUkFBR3kyTTU5SEdvQXZ3L1JKWnNG?=
 =?utf-8?B?SlBKZjlJc0VPcDE1MlovQkhwMHIwZTQvVlhsRElMaW5EVmZ5NnVta0E4dWU3?=
 =?utf-8?B?RUNiVE5PeUFsVXpLMWsvVHI2bTF3SkQzL3drLzZLeWNRN1dBRmFuRWtybUpE?=
 =?utf-8?Q?xGX0HFdWDJeoJ2jt34fFEMg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D4F5CF96C7DF7747B1F9ACDB0995DF31@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a685c6cb-f527-47e2-adbe-08dd41515ed2
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2025 17:13:09.5078 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mI+4fH4fyobCvmYZiCSzdx15rIWtu3bnygUShJ6BkHc/rTtPXoc5ZZJONNUJIqZ5VtdIex15RszHUzRFvXzEa764guaCOD2FeOW/J1o2zUP9VjGR8boNBniHF8IQrtiO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6508
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

T24gV2VkLCAyMDI1LTAxLTI5IGF0IDEyOjU0ICswMDAwLCBQYXRjaHdvcmsgd3JvdGU6DQo+IFBh
dGNoIERldGFpbHMNCj4gU2VyaWVzOiBNYWludGVuZW5jZSBvZiBkZXZjb3JlZHVtcCA8LT4gR3VD
LUVyci1DYXB0dXJlIHBsdW1iaW5nIFVSTDogaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Au
b3JnL3Nlcmllcy8xNDQwNTAvDQo+IFN0YXRlOiBmYWlsdXJlIERldGFpbHM6IGh0dHBzOi8vaW50
ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2ludGVsLXhlL3hlLXB3LTE0NDA1MHYxL2luZGV4Lmh0bWwg
DQo+IENJIEJ1ZyBMb2cgLSBjaGFuZ2VzIGZyb20geGUtMjU2Ni0yMDc1OTUyNmMwNGE3Zjc3NmY0
NzdiZWU2NjMwMGRhZTMzYjUxODcyX2Z1bGwgLT4geGUtcHctMTQ0MDUwdjFfZnVsbFN1bW1hcnlG
QUlMVVJFDQo+IFNlcmlvdXMgdW5rbm93biBjaGFuZ2VzIGNvbWluZyB3aXRoIHhlLXB3LTE0NDA1
MHYxX2Z1bGwgYWJzb2x1dGVseSBuZWVkIHRvIGJlDQo+IMKgdmVyaWZpZWQgbWFudWFsbHkuDQo+
IElmIHlvdSB0aGluayB0aGUgcmVwb3J0ZWQgY2hhbmdlcyBoYXZlIG5vdGhpbmcgdG8gZG8gd2l0
aCB0aGUgY2hhbmdlcw0KPiDCoGludHJvZHVjZWQgaW4geGUtcHctMTQ0MDUwdjFfZnVsbCwgcGxl
YXNlIG5vdGlmeSB5b3VyIGJ1ZyB0ZWFtIChJOTE1LWNpLWluZnJhQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZykgdG8gYWxsb3cgdGhlbQ0KPiDCoHRvIGRvY3VtZW50IHRoaXMgbmV3IGZhaWx1cmUgbW9k
ZSwgd2hpY2ggd2lsbCByZWR1Y2UgZmFsc2UgcG9zaXRpdmVzIGluIENJLg0KPiBQYXJ0aWNpcGF0
aW5nIGhvc3RzICg0IC0+IDQpTm8gY2hhbmdlcyBpbiBwYXJ0aWNpcGF0aW5nIGhvc3RzDQo+IFBv
c3NpYmxlIG5ldyBpc3N1ZXNIZXJlIGFyZSB0aGUgdW5rbm93biBjaGFuZ2VzIHRoYXQgbWF5IGhh
dmUgYmVlbiBpbnRyb2R1Y2VkIGluIHhlLXB3LTE0NDA1MHYxX2Z1bGw6DQo+IElHVCBjaGFuZ2Vz
UG9zc2libGUgcmVncmVzc2lvbnMgKiBpZ3RAa21zX2ZsaXBfc2NhbGVkX2NyY0BmbGlwLTY0YnBw
LXh0aWxlLXRvLTMyYnBwLXh0aWxlLWRvd25zY2FsaW5nOnNoYXJkLWRnMi1zZXQyOg0KPiBOT1RS
VU4gLT4gSU5DT01QTEVURSArMSBvdGhlciB0ZXN0IGluY29tcGxldGUNCj4gwqAqIGlndEBrbXNf
ZnJvbnRidWZmZXJfdHJhY2tpbmdAZmJjLXNocmZiLXNjYWxlZHByaW1hcnk6c2hhcmQtYWRscDog
UEFTUyAtPiBETUVTRy1XQVJOICsyIG90aGVyIHRlc3RzIGRtZXNnLXdhcm4NCj4gwqAqIGlndEBr
bXNfcGxhbmVfbG93cmVzQHRpbGluZy00OnNoYXJkLWRnMi1zZXQyOiBQQVNTIC0+IERNRVNHLVdB
Uk4gKzQgb3RoZXIgdGVzdHMgZG1lc2ctd2Fybg0KPiDCoCogaWd0QGttc19wbV9ycG1AdW5pdmVy
c2FsLXBsYW5lczpzaGFyZC1sbmw6IFBBU1MgLT4gSU5DT01QTEVURSArMSBvdGhlciB0ZXN0IGlu
Y29tcGxldGUNCj4gwqAqIGlndEB4ZV9leGVjX3Jlc2V0QGd0LXJlc2V0LXN0cmVzczpzaGFyZC1s
bmw6IFBBU1MgLT4gRE1FU0ctV0FSTg0KPiDCoCogaWd0QHhlX3dlZGdlZEB3ZWRnZWQtYXQtYW55
LXRpbWVvdXQ6c2hhcmQtYm1nOiBQQVNTIC0+IERNRVNHLVdBUk4NCg0KYWxhbjogV2VudCB0aHJv
dWdoIHRoZSA1IHBvc3NpYmxlLXJlZ3Jlc3Npb25zIGFib3ZlIGFuZCBpIGJlbGlldmUgdGhlIGZp
cnN0IDMgYXJlIHVucmVsYXRlZCB0byB0aGlzIHNlcmllcy4NCkhvd2V2ZXIsIHRoZSBsYXN0IDIg
c2VlbXMgdG8gYmUgdHJpZ2dlcmVkIGJlY2F1c2UgSSBhZGRlZCB0aGUgZm9sbG93aW5nIGxpbmUg
d2hlbiB3ZSB3ZXJlIGF0dGVtcHRpbmcgYQ0KeGVfaHdfZW5naW5lX3NuYXBzaG90wqBidXQgbmVp
dGhlciBhIEd1Qy1nZW5lcmF0ZWQgbm9yIGEgbWFudWFsIGR1bXAgd2FzIGF2YWlsYWJsZS4gVGhh
dCBzYWlkIGkgYW0NCm5vdCBzdXJlIGlmIHRoaXMgaXMgYW4gaXNzdWUgd2l0aCBzdXJyb3VuZGlu
ZyBjb2RlIG9yIGlmIGkgc2hvdWxkIGp1c3QgY2hhbmdlIHRoaXMgY29kZSB0byBhIHhlX2d0X2Ri
Zw0KKGluc3RlYWQgb2Ygd2FybikuIEkgdGhpbmsgdGhlIGxhdHRlciAob3IgY29tcGxldGUgb21t
aXNpb24pIG1ha2VzIHNlbnNlIGZvciB0aGUgd2VkZ2VkIGNhc2UuIFdpbGwNCmludmVzdGlnYXRl
IG9uIHRoZSBmb3JtZXIuDQoNCgl4ZV9ndF93YXJuKGh3ZS0+Z3QsICJDYW4ndCByZXRyaWV2ZSBh
bnkgR3VDLUVyci1DYXB0dXJlIG5vZGUiKTsNCg0KPiBLbm93biBpc3N1ZXNIZXJlIGFyZSB0aGUg
Y2hhbmdlcyBmb3VuZCBpbiB4ZS1wdy0xNDQwNTB2MV9mdWxsIHRoYXQgY29tZSBmcm9tIGtub3du
IGlzc3VlczoNCj4gDQphbGFuOnNuaXANCg==
