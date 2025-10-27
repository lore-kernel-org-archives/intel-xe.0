Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4E33CCF9EE
	for <intel-xe@archiver.kernel.org>; Mon, 27 Oct 2025 18:19:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BE7D10E547;
	Mon, 27 Oct 2025 18:19:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hfgeg16q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4136A10E54B
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Oct 2025 18:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761589143; x=1793125143;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=G2PG4gyNvAZuzh0CqXhjr9rmN4FjDMkub4lvXwagymo=;
 b=hfgeg16qPOp4J/9Nmj6QiYk8ND464D0jGRKnes8wWRSYxR2/SgvN1zdM
 u7kQJh7uNKzeKbmXxRNKlwtMAcErVc7+2jsBhucIHaar8WjFKMAcSQlfo
 yAa/Jt0g+Hxuz+WG6FCvCGKxC/mqDU6qONY8KQIUa+R81jY+fAjQS0lTM
 00I8dS5edOmRVDH5D+gLkPqTHGy5LsO2EeZRreRxXybu/SKUNtrcttzOy
 LszyFGDZRjpXRqoPHURCjqeHcAR48JVrttJ/L/I0XiInZeRgptcQXQIKI
 VV3SGS/Xnye2fH0sqgQNJGGXcMcf4GacieAGBv7QISfVizRZFbTp56Bks w==;
X-CSE-ConnectionGUID: PsImTPWqQOWZ1kNWh325fQ==
X-CSE-MsgGUID: bPr1rBl0SouFbvBjTud4DA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62710799"
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="62710799"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 11:19:03 -0700
X-CSE-ConnectionGUID: 3PdIYx9XT2aOHs+1ai5wHA==
X-CSE-MsgGUID: qqtL52g5Rpa90vNcEMR/SA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="184818528"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 11:19:03 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 11:19:02 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 27 Oct 2025 11:19:02 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.57) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 11:19:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gYBWQHJkz2PfIljGi30E4Oi2GMKt7+A5BReLwVgIfn2pBpMjbiInJ7iB1FUjQs5qGB+4OD0fCkbYmsEj5WYmj6KKJSJOsLTXxL2PUyzaIn5T46Ev0PEexmlKQN8Zz3357wbyCfaSJMAlYzNsXZxwFJlt//uSqcLc2xIHgTNoxZJhQsuU1z1UX4bc/2eGzQALgCntPClBGZhVLXxo/Hiul/2C60wwy8vu+hSvp0lCEeKiWuNT9ydheBLrkoTNyNm8dzbOg/ZLh/pMs2VsjGDZ0GoqBlsSRYcZ5FcOHHmV8ReogmBEEIOQeM3yFuou7trtuD7tmYYSK3Sz4EGvv7TNCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G2PG4gyNvAZuzh0CqXhjr9rmN4FjDMkub4lvXwagymo=;
 b=or/wS0PXAmkmu6KQ5LeK46lwZPzaML+vEUKozEXtlT6JGkctZEaMopne849RRMz4KpAz19y49cUk4mfkGxAe0bG1UBEzU0l0gkEZ22dbba+fNCvYCP8vCQpHJnvLXXBb1dReezqLCBylABbBP/PiRMpsVn0uHWBQGC7pT2GVwpDiYh1E0OSJrpIgnu2qR6pomVm8WUnhrap7AitOKXKNVcVngndQ5hDYXu5XSKasGaNLIknRG/pKUHAX7Bly/1Tg79MUxMYl3uu7R7kz2RaXrNMb0IGZlmTLUbDTtG40GsgPo6sh7Hb/vVGxPqm37z7dJq3Ivv+aIzWcGTUxSfMUCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 SA2PR11MB5098.namprd11.prod.outlook.com (2603:10b6:806:11c::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 18:19:00 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%5]) with mapi id 15.20.9253.018; Mon, 27 Oct 2025
 18:19:00 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re:  CI.KUnit: failure for Fix a couple of wedge corner-case memory
 leaks (rev6)
Thread-Topic: CI.KUnit: failure for Fix a couple of wedge corner-case memory
 leaks (rev6)
Thread-Index: AQHcR24qJM4nbwnWGUSLbPloww5wHQ==
Date: Mon, 27 Oct 2025 18:18:59 +0000
Message-ID: <690f7dc218ae124b7eb56836819c78c53981d375.camel@intel.com>
References: <20251027180412.63743-1-stuart.summers@intel.com>
 <176158904091.59660.2314497415900577533@97596180aaec>
In-Reply-To: <176158904091.59660.2314497415900577533@97596180aaec>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|SA2PR11MB5098:EE_
x-ms-office365-filtering-correlation-id: b62e0b09-5eee-424f-b85e-08de15854cfe
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?SGdYTWsyTFFwNWtMNTNPM25KVUZTZVVtSVRycjRIS0NlR1dKbXpmZGNmazJD?=
 =?utf-8?B?bFo5UWN1RGNPcWZ3ZXN2NHd2VEtwMDdpT3R3clhLbTZwUWhNK3duNldQWnZu?=
 =?utf-8?B?NnFJRjVxOXRIMGpSb1V5ME0rNWxFZ2tKY1VvU3hROEUwVm9YaDNSMFJhTm44?=
 =?utf-8?B?eDZaREowR2VRTXczTlpBUkpiUnZHeWU0cFA4azB6L0Vma2RDOUh4cW5rN25G?=
 =?utf-8?B?NnRMKzFFcnFOS1BHZnpESmNqNmsrdDJmQnhYL255YXdVYXFYS1lnenAvMFlB?=
 =?utf-8?B?NTZmanZ5Y2gzZzlLY2NPVjkvOWJ0SXBPRWJFcmVXd0k4RE5qVU1IMUVYQlov?=
 =?utf-8?B?QkwwV0xLd1U3TDdReWZDMHZ1UEk4Wk5OdEVqL0tOMGtyTkVIcUdweTVYMEJj?=
 =?utf-8?B?aTgwa2tEaXg4L3M4cFRoNTBCRWxzNFM2NlB5ZWFkUy8zSWlnUk9mdjhFdk1V?=
 =?utf-8?B?dnBZb2NNMFNxWUdxZ2h2Z2puY1NIWlV4WWtCTXE0QTVWbHl3b01pYUMxVFZP?=
 =?utf-8?B?alpBc0lhcDdzMVNNSndhQ0tQYkw0NjcyNnZHRHZRMThPdnh0bTQ1b1dkRCsy?=
 =?utf-8?B?VTZnQ2RXbXg4ZHU3MUt2UFV0M2ZWcHVoaFFaTmYvbzZ2RXNmREN6aXlWT1U5?=
 =?utf-8?B?eGdXVTc3dnZlYldGa2V6T3hndks4ZFhQdDllRm82V21kWEh3TnNXQmZzcFdX?=
 =?utf-8?B?YjhrQzY1cWRtTk9KVUhsTVdqN2dKM01RNGt3eldKODBuM0hDb2M0QVh1Nk0z?=
 =?utf-8?B?a3A5NXlMQ3J5RllpdlZleHdIUk9LeW5GSmw2OUhpUnMrYjd1emMzS0RQeG1M?=
 =?utf-8?B?Z1laWWxpLzBXcVhRQVJlT01LWGI0S3k3b0ZTYXNKNENCTmV3dE1RSmFOV0pK?=
 =?utf-8?B?TXFvVk5Db1ZZSjZkWkU0YlRBakxIWGxGYlVXRTJZWUdSdkpaSEtQTkNOQ3VK?=
 =?utf-8?B?OFB4ZDFKNlE5L0J5ajNrSHBlMlV3dE1RbmdBNEhRQmhkbUY5WThXSHh0eUJZ?=
 =?utf-8?B?WDFNZk5JTXkrK3ZJYTJFd3JFME0xRThqNzRJelVsK3VVdFlDMzBMYWhUaWVR?=
 =?utf-8?B?U0hCZ2Nka2VjajgyekdZcGRqZjNvblJBdkZaVG9sS05uQklpZ2xUa1ZoOXIr?=
 =?utf-8?B?aTdId3h6Nm4yODJlZnFUaFVyMGErVmlVdG1wQVZ5UCtBZW1qN3ArdXFBanY0?=
 =?utf-8?B?am5vT3crMVJxVEN4R3pLMWcwNGpVeDZYbEpIL1N3NDdTOFFGeWVOZmFjTnIv?=
 =?utf-8?B?Zkh5ckVvVzJ3blh2TEhGSmgycXBmSEdQVUNnK2Z4RTZ4QThkRmlUTldJMFRn?=
 =?utf-8?B?bzk5eVhXSWxlVlFSekovN0lxeURpTXVOdUpBQ0J5ZUFHNG5CcitQRTJjK1RO?=
 =?utf-8?B?emp5bEpiZkg4dGVEQjNuNUZCb1NQMUJkSEhMZjhGdHp2OGpMVG5JWXp0MTJ3?=
 =?utf-8?B?a0ErVjZaT1pQOXl5WnhvWGhtbUV2ZTVwV0toZjhsc0ltL1M5RVNoUnBzUGxk?=
 =?utf-8?B?SW45MU9FL0lKeHQ3YWZ0ZzFzT2ZEVjVLaWZ3eEx0THpYQThRWEhjcmQ5QTFM?=
 =?utf-8?B?aFRiWnhBaEcwRlUxaHJWaHplL0ZSY00wcDcvTUVRNHVaQnF6WWJFZE5MZHM4?=
 =?utf-8?B?V2V3clUxdllJUG0zSHRRRkY5dHZWclAzd21pUlFRVGdXam9oZkFmZ1lIdGJj?=
 =?utf-8?B?ODNsSXh5emtGUHAweXhzS2FWZ3ljMVVjQmdTa3lvUHgvOW5mWWZ4c1FOcmIx?=
 =?utf-8?B?U1lQWWRnMjdtdjJPNUNzZEVnT2pod3ZSeTR2TkZkVFF0WlRoZ00vbjhQaU0r?=
 =?utf-8?B?Wm81SU5YQVdWeWVxWGlBOE9GVEV6TndLSnVlWWIzSm8rZzdHV1hXV21oek9h?=
 =?utf-8?B?UHltc3NoY0RRbWY4STIwZE5pTEI5bkNxR0lod0ZUS1paNlREV2QrOURPVjlX?=
 =?utf-8?Q?LIgvyRJ6tb2Bvh1TThapLcPPghvpWV/q?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Vk1qQVVuZGRlOUU2a1lnM2Rqb05SL0ZVWFBLUm5wUkhibkFyWUNwNThwY01M?=
 =?utf-8?B?STA3NG5MZ0FPZUZldGtVamNVM2xjc0hqSi9EUFlicTFSdXkwZkJ6di9qWThk?=
 =?utf-8?B?QkN6VlhHNGc5NlVYWnlxMld4Y2FtTEtWd21HNU1laVllRkxVbnNBMFZERFNS?=
 =?utf-8?B?Q3d2ZVhwNmw1amR6M2RGMSt0WTFYelo3THA3Qk1hVTNKSjRPazVHUHNFbE5o?=
 =?utf-8?B?MVJTcFhFTHVBb0ozanVsK0pOTEl6dUdCQjNQYzQ5eEQxcWhUMWs3UjJqZHpI?=
 =?utf-8?B?K1RVRDVxczlaN3d0TzZxYjJuV2FIUHIxRUlNK3lmdGJhNmZhdkJNbmxXbmJG?=
 =?utf-8?B?UFloKytIVHdPR2Z2N01JNnJzSEFSd0VYYkphOUVvbHhvZkdTYWl5amFVY050?=
 =?utf-8?B?RFFJUDRMNG9GYzdsUlA3Vzd4amI0YW1GdmMzZkZ0MmlBR0ZWYWVKTVdWd3I3?=
 =?utf-8?B?L1hudEYxUEZrRktTVjlpWms4STQxYmlUdzRrdzFZNGQ1dDNXczlGVC83aXU1?=
 =?utf-8?B?NlpKbG9DZktCNmorN1lQNld4UUd3SCtxcnh1cTIrNnFKZWo5Kzk1MUVGcDla?=
 =?utf-8?B?U25zQWVTdXhvTE1NUUJSR1hKeVJoREhCLzVDUVVlK3BvSkI5N09OYjdIUit0?=
 =?utf-8?B?Vy9qaURtRFNSdGdIOENzTkdKTmpPQXlmSlRBRUMrYzhFbnJ0elBSUmpiV2dn?=
 =?utf-8?B?Ny92UkM3THh6RzVIVEtLOXNKdVU5Y1oycjFnNERIRjdJa3RISXlDRzlXSFBk?=
 =?utf-8?B?STFlNE9zZ0hBczNZSVdZVUZ4M3FNanBPb0ZXeDZPcUh5VXh1SGMvQ3V1b2dy?=
 =?utf-8?B?R1IzWmQ1NkxVVHY4UGxrb20xWWdHZ1B3MThtUllmRzJOczl5S3N3czFoc3Ay?=
 =?utf-8?B?SEhrVCt6V29oMXJJWm1TSUhFckEzQ0x4REl1bk5icGRGY2t3amFlZFJ0ZmZo?=
 =?utf-8?B?b1UyMWVsZWhjVHZBM2w1UG1OS0ZwT1ZxaVdOeldVd2ZXZFdTWHlhRzRDcnZq?=
 =?utf-8?B?UkpQMjJMV1UybWdZOWFTeVRuOHB0aXBJdW5BWkNpemhBSmJNOGJTdHd0MStQ?=
 =?utf-8?B?L1hqSXdJcTBreW9yUnF3VE1RR0lVQkFhSWtkV2kxWmtEMkZWeG90d3BaY3pu?=
 =?utf-8?B?NW0yS1JUQ0taa0gxN095MWlJaGlRek4zLzF1ZW5XaHA5WFF1emZCL1hPWWZT?=
 =?utf-8?B?aU1XWllQUVkvTlFZdG9aREVJb25lVTdWSTRXVHIvRHJJeGw4VG53RkppNEkr?=
 =?utf-8?B?RUNVRUVRTDJRajhQQWhHK3RweUE3WWFJc2IzVDdRRC9yTXIweWRXUlZnRjNr?=
 =?utf-8?B?MjdGK2orbndUNlovK01JSkN6UG0xdHcyZWkxcnM3LzRaRUM0MlM0YmhjZy82?=
 =?utf-8?B?emdOaUdXOXdLVDZ3MXhoeDA2YjRqU3NuZWd2NHIyOTBqdTREbmYwMjEzWkFV?=
 =?utf-8?B?Z21TTXJCWkJqcVpDNHlNQkQ0YTJGTlFsTXlQMnlZcHV2VTllZ1JDQlhGS0hY?=
 =?utf-8?B?NjRuMHZDSlgvTUdDcU14SFV1UHd3ZHdXc3NnRzJDYXE4RHNsODErTWRZWmFR?=
 =?utf-8?B?UDliWHU4Ujc3TytIRWFLZnRYeGNmMk41WGRnOGErRm1ZNkFTMUdxUzYrTnRX?=
 =?utf-8?B?c0ZmZ09TbFZEazVHRVlxY1ZVd0tkZUJIN3lFOTlEcnJwSWVWMzE3T2JzK0c4?=
 =?utf-8?B?MWVCVFYvTlp4N3RQT3gveWxCY1AvbEE2Ulg1L0c3UlNyUDVUOUhqanR5WUpS?=
 =?utf-8?B?WDNPbjl2aGdNUmdpZDRGQm1HVWcyTUllcXpjRUdDT3VXbGtGczdmTzVNdFVB?=
 =?utf-8?B?TFF6YndJZGdxSll0SVVGbnV0YmE3VWZrTndUbDF0UzFWVUNZa1dDbzJsWmEy?=
 =?utf-8?B?akNpaE0xKzJtbktMTGYzNmFpYzAydll3L2ovU1YvNXZRSkUvL3IwYVQ2b1g0?=
 =?utf-8?B?eHdDNW5KeGdlUXFlaWQ1b01jNVlSOGtFTzhEZENIaFV6ZnIzT2tZamFrNEt1?=
 =?utf-8?B?Wk9xSkZwQXJVeEFVM1R2bFFBV0U2Skw4QVQ3clNjd05KL1JHT1V3LzRIc3Nm?=
 =?utf-8?B?MlFKd2FMWjViODhhVk5rZTdnWDI1cVdVVnRDWi93MWtNZ2l2QWpiUmxNZDh0?=
 =?utf-8?B?MisrWUUydTJYamg3VUY5NlhTYzVWVTh3aTh0V0E4dlFjcU1NMXJLQmhnZXZY?=
 =?utf-8?B?bEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1CF17068ACAAD44BB49770463055975A@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b62e0b09-5eee-424f-b85e-08de15854cfe
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2025 18:18:59.9153 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W7/QiUdfzmLYL3k7v07u5JzWGiPcy8xdU5uAzoATN76zS1hRfhyqkNayYhYfqxYVjO32cW+ic/inNRl7CA8Dk6YmSORO4TMUBnRZpo7f4V4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5098
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

T24gTW9uLCAyMDI1LTEwLTI3IGF0IDE4OjE3ICswMDAwLCBQYXRjaHdvcmsgd3JvdGU6Cj4gPT0g
U2VyaWVzIERldGFpbHMgPT0KPiAKPiBTZXJpZXM6IEZpeCBhIGNvdXBsZSBvZiB3ZWRnZSBjb3Ju
ZXItY2FzZSBtZW1vcnkgbGVha3MgKHJldjYpCj4gVVJMwqDCoCA6IGh0dHBzOi8vcGF0Y2h3b3Jr
LmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTU1MzUyLwo+IFN0YXRlIDogZmFpbHVyZQo+IAo+ID09
IFN1bW1hcnkgPT0KPiAKPiArIHRyYXAgY2xlYW51cCBFWElUCj4gKyAva2VybmVsL3Rvb2xzL3Rl
c3Rpbmcva3VuaXQva3VuaXQucHkgcnVuIC0ta3VuaXRjb25maWcKPiAva2VybmVsL2RyaXZlcnMv
Z3B1L2RybS94ZS8ua3VuaXRjb25maWcKPiBFUlJPUjpyb290OkluIGZpbGUgaW5jbHVkZWQgZnJv
bSAuLi9pbmNsdWRlL2xpbnV4L2JpdGZpZWxkLmg6MTAsCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgZnJvbSAuLi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX3N1Ym1pdC5jOjg6
Cj4gLi4vZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19zdWJtaXQuYzogSW4gZnVuY3Rpb24KPiDi
gJhndWNfc3VibWl0X3dlZGdlZF9maW5p4oCZOgo+IC4uL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9n
dWNfc3VibWl0LmM6MzAwOjMxOiBlcnJvcjogaW1wbGljaXQKPiBkZWNsYXJhdGlvbiBvZiBmdW5j
dGlvbiDigJhkcm1fc2NoZWRfaXNfc3RvcHBlZOKAmTsgZGlkIHlvdSBtZWFuCj4g4oCYZHJtX3Nj
aGVkX3N0b3DigJk/IFstV2Vycm9yPWltcGxpY2l0LWZ1bmN0aW9uLWRlY2xhcmF0aW9uXQoKSG0u
LiBJIGRpZG4ndCBzZWUgdGhpcyB3aGVuIHRlc3RpbmcgbG9jYWxseS4gSSdsbCBkb3VibGUgY2hl
Y2sgaGVyZS4KCi1TdHVhcnQKCj4gwqAgMzAwIHzCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICFkcm1fc2NoZWRfaXNfc3RvcHBlZCgmcS0+
Z3VjLQo+ID5zY2hlZC5iYXNlKSk7Cj4gwqDCoMKgwqDCoCB8wqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIF5+fn5+fn5+fn5+fn5+fn5+
fn5+Cj4gLi4vaW5jbHVkZS9saW51eC9idWlsZF9idWcuaDozMDo2Mzogbm90ZTogaW4gZGVmaW5p
dGlvbiBvZiBtYWNybwo+IOKAmEJVSUxEX0JVR19PTl9JTlZBTElE4oCZCj4gwqDCoCAzMCB8ICNk
ZWZpbmUgQlVJTERfQlVHX09OX0lOVkFMSUQoZSkgKCh2b2lkKShzaXplb2YoKF9fZm9yY2UKPiBs
b25nKShlKSkpKQo+IMKgwqDCoMKgwqAgfMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAKPiBeCj4gLi4vZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX2Fzc2VydC5oOjExMjo5OiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFjcm8KPiDi
gJhfX3hlX2Fzc2VydF9tc2figJkKPiDCoCAxMTIgfMKgwqDCoMKgwqDCoMKgwqAgX194ZV9hc3Nl
cnRfbXNnKF9feGUsCj4gY29uZGl0aW9uLMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwKPiDCoMKgwqDCoMKgIHzCoMKgwqDCoMKgwqDCoMKgIF5+
fn5+fn5+fn5+fn5+fgo+IC4uL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9hc3NlcnQuaDoxNDg6OTog
bm90ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3JvCj4g4oCYeGVfYXNzZXJ0X21zZ+KAmQo+IMKgIDE0
OCB8wqDCoMKgwqDCoMKgwqDCoCB4ZV9hc3NlcnRfbXNnKHRpbGVfdG9feGUoX190aWxlKSwgY29u
ZGl0aW9uLCAidGlsZToKPiAldSBWUkFNICVzXG4iIG1zZyzCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIFwKPiDCoMKgwqDCoMKgIHzCoMKgwqDCoMKgwqDCoMKgIF5+fn5+fn5+fn5+
fn4KPiAuLi9kcml2ZXJzL2dwdS9kcm0veGUveGVfYXNzZXJ0Lmg6MTcyOjk6IG5vdGU6IGluIGV4
cGFuc2lvbiBvZiBtYWNybwo+IOKAmHhlX3RpbGVfYXNzZXJ0X21zZ+KAmQo+IMKgIDE3MiB8wqDC
oMKgwqDCoMKgwqDCoCB4ZV90aWxlX2Fzc2VydF9tc2coZ3RfdG9fdGlsZShfX2d0KSwgY29uZGl0
aW9uLCAiR1Q6Cj4gJXUgdHlwZSAlZFxuIiBtc2cswqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgXAo+IMKgwqDCoMKgwqAgfMKgwqDCoMKgwqDCoMKgwqAgXn5+fn5+fn5+fn5+fn5+fn5+
Cj4gLi4vZHJpdmVycy9ncHUvZHJtL3hlL3hlX2Fzc2VydC5oOjE2OTozNzogbm90ZTogaW4gZXhw
YW5zaW9uIG9mIG1hY3JvCj4g4oCYeGVfZ3RfYXNzZXJ0X21zZ+KAmQo+IMKgIDE2OSB8ICNkZWZp
bmUgeGVfZ3RfYXNzZXJ0KGd0LCBjb25kaXRpb24pIHhlX2d0X2Fzc2VydF9tc2coKGd0KSwKPiBj
b25kaXRpb24sICIiKQo+IMKgwqDCoMKgwqAgfMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBefn5+fn5+fn5+fn5+
fn5+Cj4gLi4vZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19zdWJtaXQuYzoyOTk6MTc6IG5vdGU6
IGluIGV4cGFuc2lvbiBvZgo+IG1hY3JvIOKAmHhlX2d0X2Fzc2VydOKAmQo+IMKgIDI5OSB8wqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgeGVfZ3RfYXNzZXJ0KGd1Y190b19ndChndWMp
LAo+IMKgwqDCoMKgwqAgfMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIF5+fn5+fn5+
fn5+fgo+IGNjMTogc29tZSB3YXJuaW5ncyBiZWluZyB0cmVhdGVkIGFzIGVycm9ycwo+IG1ha2Vb
N106ICoqKiBbLi4vc2NyaXB0cy9NYWtlZmlsZS5idWlsZDoyODc6Cj4gZHJpdmVycy9ncHUvZHJt
L3hlL3hlX2d1Y19zdWJtaXQub10gRXJyb3IgMQo+IG1ha2VbN106ICoqKiBXYWl0aW5nIGZvciB1
bmZpbmlzaGVkIGpvYnMuLi4uCj4gbWFrZVs2XTogKioqIFsuLi9zY3JpcHRzL01ha2VmaWxlLmJ1
aWxkOjU1NjogZHJpdmVycy9ncHUvZHJtL3hlXQo+IEVycm9yIDIKPiBtYWtlWzVdOiAqKiogWy4u
L3NjcmlwdHMvTWFrZWZpbGUuYnVpbGQ6NTU2OiBkcml2ZXJzL2dwdS9kcm1dIEVycm9yIDIKPiBt
YWtlWzRdOiAqKiogWy4uL3NjcmlwdHMvTWFrZWZpbGUuYnVpbGQ6NTU2OiBkcml2ZXJzL2dwdV0g
RXJyb3IgMgo+IG1ha2VbM106ICoqKiBbLi4vc2NyaXB0cy9NYWtlZmlsZS5idWlsZDo1NTY6IGRy
aXZlcnNdIEVycm9yIDIKPiBtYWtlWzJdOiAqKiogWy9rZXJuZWwvTWFrZWZpbGU6MjAxMDogLl0g
RXJyb3IgMgo+IG1ha2VbMV06ICoqKiBbL2tlcm5lbC9NYWtlZmlsZToyNDg6IF9fc3ViLW1ha2Vd
IEVycm9yIDIKPiBtYWtlOiAqKiogW01ha2VmaWxlOjI0ODogX19zdWItbWFrZV0gRXJyb3IgMgo+
IAo+IFsxODoxNjo0N10gQ29uZmlndXJpbmcgS1VuaXQgS2VybmVsIC4uLgo+IEdlbmVyYXRpbmcg
LmNvbmZpZyAuLi4KPiBQb3B1bGF0aW5nIGNvbmZpZyB3aXRoOgo+ICQgbWFrZSBBUkNIPXVtIE89
Lmt1bml0IG9sZGRlZmNvbmZpZwo+IFsxODoxNjo1MV0gQnVpbGRpbmcgS1VuaXQgS2VybmVsIC4u
Lgo+IFBvcHVsYXRpbmcgY29uZmlnIHdpdGg6Cj4gJCBtYWtlIEFSQ0g9dW0gTz0ua3VuaXQgb2xk
ZGVmY29uZmlnCj4gQnVpbGRpbmcgd2l0aDoKPiAkIG1ha2UgYWxsIGNvbXBpbGVfY29tbWFuZHMu
anNvbiBzY3JpcHRzX2dkYiBBUkNIPXVtIE89Lmt1bml0IC0tCj4gam9icz00OAo+ICsgY2xlYW51
cAo+ICsrIHN0YXQgLWMgJXU6JWcgL2tlcm5lbAo+ICsgY2hvd24gLVIgMTAwMzoxMDAzIC9rZXJu
ZWwKPiAKPiAKCg==
