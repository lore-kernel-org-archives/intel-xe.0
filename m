Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FBE0C88E53
	for <intel-xe@archiver.kernel.org>; Tue, 15 Sep 2026 06:00:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C609510F9BA;
	Tue, 15 Sep 2026 06:00:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gPEv5q77";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8648010F9BA;
 Tue, 15 Sep 2026 06:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789452019; x=1820988019;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=iZXm64yM9bnOw1daF5GEKg4vYBvbrW5hDysirEaSHu8=;
 b=gPEv5q77jalmovjStHEq0ChaU4GB85qD/7FksetMn6czyLCtpZTPRuyI
 xkGpoHO7xlPXt9ZQe4QnQLBA1GRcU9lV8oTGgg5lGx4YCz9xbGcpPnqNZ
 z3cRJrBZup5zpUpBFgQSDYoLPYUFLxurLgR0xS8XIw9zrxdGW0SkX2+5C
 5OCqw5nW7omZPM7L7NMV0EYU+I5ojAYV3OpUYSqNUAj1Lhm4PX9NisaBZ
 gGHyLxHj2mdUBxCaiWKs8gAECg87eWUJw4Y/GIodEZZHVmv0ZsIr2L9zu
 Hlvq9siL4w4LwiCPkcFih2+PF/23YT0AYz/5eqzl/et8CEJXqAN3zYCQY A==;
X-CSE-ConnectionGUID: ZkKmKI86SRifG706YXtB1w==
X-CSE-MsgGUID: MW5dMfXBQX6MnBsaa8hkLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100402902"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="100402902"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2026 23:00:18 -0700
X-CSE-ConnectionGUID: tOYBgr2BRteKZ82iQH3kQw==
X-CSE-MsgGUID: YvXr9mcCScCvu8l5Yc18TQ==
X-ExtLoop1: 1
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2026 23:00:18 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 23:00:17 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 14 Sep 2026 23:00:17 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.64) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 23:00:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VNsa8LBZ8dpEzc5kZilpZo60TAlHkP569r6tOfnE9z9sSfwTqpaVeKdEHelug5nA26O5ys3uwDCnjz3PDfpNTlNzO2h3Cn5h3Paqgr/n9AvMt06A6Ag+ZkZaV1+4R+EyY+TWgGiCYRAj7WWGOcGV4lNRsxeuSJO/zpl6Zh+RcvWTUT+RUqVr0Rp6YOFAR9lAThsoQoCjmmNezBy+w1G7RW8NJoaq1xJAJfEpPdb2vEy54/oKn2g+mvLQ9lGBrOB7+NJW4Pna6d2snJZti3QAIEsQ7zmybIsMYcvPn4iEXPht7CxNe60A4CK4JbObdaghjcjfBS7dLDmpmPpHQeti1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iZXm64yM9bnOw1daF5GEKg4vYBvbrW5hDysirEaSHu8=;
 b=f4KHcbmuPip/Tx3pKTU+oEv2gAwj7BjRTuSirhIH9aOOk1eToRUU8WHrnTovVZu3tcljs3oOMSC9825qNfy0gjJwQhPaPEG9F0d5g3bem7HfJCVSvOarOz4nUZfqOtnqYSiGhLuUH6j+59PM36h6ZyfElmpI4ONLZ7HFH6oH/JKTjGGF0p0xm4vl9KW+NjCIJaGhKKpP2daB5iQuJE/0fb4MyhvSzX9qjSmaxb3T4EFORDZ2yXcIU1pWgiV2Kx7oK5cvRPf5FDTcGLXTPpihn4WoMgcIKBYmI2iBGcHGNHY/5Fs+th84IOD6lHGOoBuYiTQEaWbgquKt7SLE21Ve8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by DM4PR11MB6549.namprd11.prod.outlook.com
 (2603:10b6:8:8e::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Tue, 15 Sep
 2026 06:00:09 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334%8]) with mapi id 15.21.0428.008; Tue, 15 Sep 2026
 06:00:09 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Nikula, Jani" <jani.nikula@intel.com>, "ville.syrjala@linux.intel.com"
 <ville.syrjala@linux.intel.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "Lankhorst, Maarten"
 <maarten.lankhorst@intel.com>
Subject: RE: [PATCH 2/4] drm/i915/display: use struct intel_atomic_state
 *state variable naming
Thread-Topic: [PATCH 2/4] drm/i915/display: use struct intel_atomic_state
 *state variable naming
Thread-Index: AQHdQVygEjR6HqSC7UaDk2WYHwBEtbbPLA6Q
Date: Tue, 15 Sep 2026 06:00:09 +0000
Message-ID: <DS4PPFE901A304F6284CFCFA7A6F132F628E3BA2@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <cover.1789069102.git.jani.nikula@intel.com>
 <988f1253004e68d565f3915cbd24182ca95dee49.1789069102.git.jani.nikula@intel.com>
In-Reply-To: <988f1253004e68d565f3915cbd24182ca95dee49.1789069102.git.jani.nikula@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|DM4PR11MB6549:EE_
x-ms-office365-filtering-correlation-id: 884b5f58-7674-4815-c6f3-08df12ee997a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|23010399003|1800799024|376014|10067099003|4143699003|3023799007|18002099003|22082099003|56012099006|11063799006|38070700021;
x-microsoft-antispam-message-info: vvhRGejTEX0savegUY7CYbQMWLpfB5IskyMOEm+o9ZNobVtxfJsoEtrJfTFThqwU0fREojH4/Cj8sTLLB3HY1fpbs5fhlSqBLNfdw+DqdPomQ+IW9xntSH9s/VpaOmG23lTsOf+LgZAB5xqbCC2p2UB66AGIH+wuKX0OhAlQl7zAlMxW87wO7vpBt+blZR+aLHg84YsxNEvZecKtmkKrd1EvBDknqpTWi9mtfv/lpj10Nt2qa3gRoELn9rzVaKGtlfCUk0BuN7i5Ewqq2OXhb2hSUfZKwfyyQjfPwBkdAJ2VcnDEk3Fpii4eT/t+3F++NQ68+C/1Z+a78be6JyHvBHa0OuPlhvUDxhI/2Qrkmi9tMb5SAP/KTiOwtftnXMgK8V4ranapp3Ng84IQIadpfX+edn22uMJxBMEhsaABUn39CYCrHtLVJ96a5yWJq44ud9Pjh3VreSTMs/UBH9br+KpN2ttH3dfsTuFS6PFgng79c9zG9HKQXx5nEUPhfMlI3SJ6D2fmPYav2qTiuw3Mzib3rXRsqI4DJdU+RJmDmo0yOmcKq75ACtSiqh8Yt1HiDYaSOI0pCcfYDCVg/cAOuqql4Ny6sGWCItnyT+LvXbI6bPxYx+FItIUrTqggnM4odqqIBsw8UCnvhKf4zxDrYUZoHYqUyGN7JR/Y6/x0xNWNSkOwQ78XiZBBvQoU32IENxUgcaJG35FtoFyEtLDWXkFaF6IkXkm9nulVTQRsSHA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(10067099003)(4143699003)(3023799007)(18002099003)(22082099003)(56012099006)(11063799006)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZUJsQTRmRnZhUE1Qd0M2djNpeldGZ2NiWWRVVHNJVDk0MHlVcEgwWFdtYnNP?=
 =?utf-8?B?UUNJRkFCWUZKTGhDZHl6bVo0U0NOVDhMQk5qTTVhKzVJTWtNVFM4T3hHd0hl?=
 =?utf-8?B?ZE11Tm1LQVJqTGMrYUlSZVQxREgySHczNWc0bEN1N2lJenpMREJKczFwYllZ?=
 =?utf-8?B?WlJ5QTFmck1Bc0dWUHYzcmVEbGZ5OHlGN1BiNTRJR3lUL2hTdkNMVTcwMWRJ?=
 =?utf-8?B?ZXVmNkRKN1plQncxR3NZQXZZaE9lMFJjWVpwM2V5RFVGVHBxU3U3THpFTVNG?=
 =?utf-8?B?TFdEa1hQR05kRTArb1dTaTd3TUFKa0g1RWpjMzdXUWhJU1pTcmU3d0dBTXJv?=
 =?utf-8?B?c0ZKZWJmb1lmR2phdFFOUWNWVU5zZTNFVE1tS25YaDQvQ3VyNlVRaXVURzBz?=
 =?utf-8?B?MzlXRk5QbzFqSVFwK1AyeTJKMlJibVNnamNWZEtjWW9CVkc4ZzJXN0wrRlpU?=
 =?utf-8?B?Nk1talV2dGhwY0FhbnBzRU0zUStiSDdmNHdpQWtKNExvZXVpbmFObGRtOGFB?=
 =?utf-8?B?T3hKeDRQbysrQjBFbE96c1NNRXBqVFpFZ1BJemVxYnhYSWxYN2U0dDJCQ1lI?=
 =?utf-8?B?c2V4Vmc5NzZVSnhFNG1YVkRvR3UyUEtjZTdaTEVlOUZNRFNldFJQSnN0Z21M?=
 =?utf-8?B?U3lGdXlmcUNIRExUT1dFN21SR1k3MGxENW5GNUlaMXBrRGxlTlZ4Z2duUEN3?=
 =?utf-8?B?VTRtTnJGOHd6ODRLL2tOSWZ6RUtXVnE0WU81OHcvRW95M2xhZ2JQeFRmUVov?=
 =?utf-8?B?ZUpZZ0JXcGJCZE5hSTQwa0tiQVNSWEI2MTdEaVlwV3dsU3FZQ29rbjgzWVlr?=
 =?utf-8?B?NTE0UUI4eHFYTEQwdlFTMis1SDRrSnhnMEh3NnR2TlhiekF0akdwZkRGWHJM?=
 =?utf-8?B?aFo5WXRic0hxdmI0ZjdIYkpsamxyOERWZktjNEczcFBDQUYyeEtMK2QvcFpD?=
 =?utf-8?B?U0pOUEhyaWRIOWQ1TkdoRmZYSWdYK2pOWXl6WnVDeVZZdlFkQ1NSVndicm1w?=
 =?utf-8?B?NWgyQ2hqbkVweXpNQUZicVZlUi8rU2FJajNXbmlpSGEwU0w5SEtGd2xXM20y?=
 =?utf-8?B?dm1jSGRSL1hRSitURWJ3ZERuaHRNbVNnU0NZamdldTN6V2JxdjduQ1pkZjB2?=
 =?utf-8?B?ZDVoNERUOWdOQjNOQkpWSDNITWFaMThxVXNnTFYzOEFGM1hDTXUrb1piMDVi?=
 =?utf-8?B?QlY2dUdibU9WbmRhVkRxMS8yU2t5Tm40TUxSRlNiN1VLNnY2Z1pmeXZDayt2?=
 =?utf-8?B?RWtRaFR3dm5vS2JKUlFDME1mMG9CQTdaNlAzalBBTWZObUdKZGVTZW9RdEg2?=
 =?utf-8?B?blJDazByMGdmU1VOU3RWRVlNbWx1SnptVTdVb3BQYjY0OTMxSmM2REh1QU81?=
 =?utf-8?B?ZjE0MkRVM2p6N2hILzZVc3VLVEcyckxmQ1hENWNuenNHYzN6YnVtK1kyYTlm?=
 =?utf-8?B?TDZRZGhTWEhYbW1LMTZpb2FKQ1gvWHpEa1A1c285TWRmTEIyc05sK09aY0pT?=
 =?utf-8?B?U2UxVmE2YTJHSkZra0pOK1lwbEozTUpMb0NrYVMwK3N2N1Nic2EzWCtqSVhB?=
 =?utf-8?B?K2tMTnV3QWdTb20vQ3U5dEg3aGJjbkxzdkI0RS9MbTdwMms1UHN6TlloSkI5?=
 =?utf-8?B?YkRlSFMyLzhjSjNpRHhtNXNrYit3TnNIdC9Kc3RTRXV3VCtlRUtjODJVOVR3?=
 =?utf-8?B?TEFhbUQ2R2JOSUhDNTNpSWVxcGdmMk1CL0prRmxvK2l1VGlhYjlWSFhJQzh1?=
 =?utf-8?B?OGJZbXlCNVZSWENJTm95dzNEYmVtK1JhVzdkQlZwZS8wcFlvK1ZVOHRweVlF?=
 =?utf-8?B?clFEYld4bXB1ZVdUTjVkUitIdFgwSG5PNERjUExpYnJBZ1ZlQzFVYnk3RTdQ?=
 =?utf-8?B?dFdBUnIveHEyaktGeTFHSy9oS1phOFpUSDJxNGt6MmwvMVdzWlZadGY1SE9I?=
 =?utf-8?B?SHdhc2J5YjZwenlFZDNkQURlRGZkZ3BISjBMSFExNzAzYmFlUzcrY2hkNlNM?=
 =?utf-8?B?VFdMajlaSFpyT3JocXN2VGRET3MrbVRuM2t6dWhrTGxUdWpFN1IyQkxMdUJq?=
 =?utf-8?B?Ymc5Qm1saVB4K3lJRkZTL01GQ3VCZUd6Z1R3cGhRSHByMzJOVktDMmRvem9F?=
 =?utf-8?B?eVQrREl6OTFpWHh2QjdOTHdFQmp0cnFhZU8rWUszNll6SnNkaFJDblUrT1JG?=
 =?utf-8?B?NTNUVytQK29kS3NlSTVOTU5WUk92YUlwV0x3eUNpM0dYTlpuNURCZmVFV3Zq?=
 =?utf-8?B?bm9YMWdIRzhGcWRDWEgrMm53bW4vTVlpVWJnSVdyNWsvN3V2dGtPQTlZekRH?=
 =?utf-8?B?SXgyZzlQRW4xRHhVa0hYMmU1d2hZb0lscU9WczFFd3ZPMUxSTWUzQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: liTWiMCNySurbe7Y/l3g0JJnpJE35fSvuyY95kmU5p6G1Q2HueAzYgJFaVbUErCheiM5qkdEShpsKRG8kD7TaUEoZlX2ngw/uUbb+pw7j1yk1N26OH7DHyNMDv88rRpHsvsMu7rGuCPIzbW/dTR1a4NiHk55lXuzN5sie9EoSWpoMh0l1vZaSdlCLOIHCMWt/BA2OmTZRNJO0RWY3yreoMebfUjxWqfpvG+YGtbClmVKD3h5DM8YXTvYC19GlXIMwMsdq5I4eBH1/wLNTKhg768oxyci/+nRh/IYm7XYQjUfYlnc1YedOzdm+q62Bb1zfWdpoLTOnT50Bq1n88XTIg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 884b5f58-7674-4815-c6f3-08df12ee997a
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2026 06:00:09.6041 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gY/QrkyVk3KpdXOudSFLLArxrkCZYiTN4wYX7hZZ1MU5HSWn0DFCgnpwjd5c36+o2KSplrfVOlbSbSi/RtGGNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6549
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

PiBTdWJqZWN0OiBbUEFUQ0ggMi80XSBkcm0vaTkxNS9kaXNwbGF5OiB1c2Ugc3RydWN0IGludGVs
X2F0b21pY19zdGF0ZSAqc3RhdGUNCj4gdmFyaWFibGUgbmFtaW5nDQo+IA0KPiBUaGUgc3RydWN0
IGludGVsX2F0b21pY19zdGF0ZSAqIHBvaW50ZXIgdmFyaWFibGVzIGFuZCBwYXJhbWV0ZXJzIGFy
ZSBuYW1lZA0KPiAic3RhdGUiIGV2ZXJ5d2hlcmUuIEZvbGxvdyBzdWl0IGluIGludGVsX2F0b21p
Y19jb21taXRfZmVuY2Vfd2FpdCgpLg0KPiANCj4gQ2M6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUu
c3lyamFsYUBsaW51eC5pbnRlbC5jb20+DQo+IENjOiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRl
bi5sYW5raG9yc3RAaW50ZWwuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBKYW5pIE5pa3VsYSA8amFu
aS5uaWt1bGFAaW50ZWwuY29tPg0KDQpMR1RNLA0KUmV2aWV3ZWQtYnk6IFN1cmFqIEthbmRwYWwg
PHN1cmFqLmthbmRwYWxAaW50ZWwuY29tPg0KDQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2k5
MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5LmMgfCA0ICsrLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5LmMNCj4gYi9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXkuYw0KPiBpbmRleCA1NzliMDMwMzRjNDYuLjFj
MmU1MGM2ZDk4YSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9p
bnRlbF9kaXNwbGF5LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRl
bF9kaXNwbGF5LmMNCj4gQEAgLTcyODgsMTQgKzcyODgsMTQgQEAgc3RhdGljIHZvaWQgc2tsX2Nv
bW1pdF9tb2Rlc2V0X2VuYWJsZXMoc3RydWN0DQo+IGludGVsX2F0b21pY19zdGF0ZSAqc3RhdGUp
DQo+ICAJZHJtX1dBUk5fT04oZGlzcGxheS0+ZHJtLCB1cGRhdGVfcGlwZXMpOyAgfQ0KPiANCj4g
LXN0YXRpYyB2b2lkIGludGVsX2F0b21pY19jb21taXRfZmVuY2Vfd2FpdChzdHJ1Y3QgaW50ZWxf
YXRvbWljX3N0YXRlDQo+ICppbnRlbF9zdGF0ZSkNCj4gK3N0YXRpYyB2b2lkIGludGVsX2F0b21p
Y19jb21taXRfZmVuY2Vfd2FpdChzdHJ1Y3QgaW50ZWxfYXRvbWljX3N0YXRlDQo+ICsqc3RhdGUp
DQo+ICB7DQo+ICAJc3RydWN0IGRybV9wbGFuZSAqcGxhbmU7DQo+ICAJc3RydWN0IGRybV9wbGFu
ZV9zdGF0ZSAqbmV3X3BsYW5lX3N0YXRlOw0KPiAgCWxvbmcgcmV0Ow0KPiAgCWludCBpOw0KPiAN
Cj4gLQlmb3JfZWFjaF9uZXdfcGxhbmVfaW5fc3RhdGUoJmludGVsX3N0YXRlLT5iYXNlLCBwbGFu
ZSwNCj4gbmV3X3BsYW5lX3N0YXRlLCBpKSB7DQo+ICsJZm9yX2VhY2hfbmV3X3BsYW5lX2luX3N0
YXRlKCZzdGF0ZS0+YmFzZSwgcGxhbmUsIG5ld19wbGFuZV9zdGF0ZSwNCj4gaSkgew0KPiAgCQlp
ZiAobmV3X3BsYW5lX3N0YXRlLT5mZW5jZSkgew0KPiAgCQkJcmV0ID0gZG1hX2ZlbmNlX3dhaXQo
bmV3X3BsYW5lX3N0YXRlLT5mZW5jZSwgZmFsc2UpOw0KPiAgCQkJaWYgKHJldCA8IDApDQo+IC0t
DQo+IDIuNDcuMw0KDQo=
