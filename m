Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 268FB606A327
	for <intel-xe@archiver.kernel.org>; Tue,  3 Nov 2026 03:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SQWJh2aG
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5550B10E17B;
	Tue,  3 Nov 2026 03:40:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38FFF10E177;
 Tue,  3 Nov 2026 03:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793677251; x=1825213251;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=UPMPrDOQzxwVd5W4+XkbOEtPb17u200jJ9YaNq9grG4=;
 b=SQWJh2aGthEKGHvPzkfg5+047awKNEScXREtTEduWnDj+1aWZ54GmG28
 C8cRiVVHsCU1R5WYCGcC5GtUXpx4bDMnt53Gjo+8VjxiZw0NxGL8L1scL
 Vh3OtZmcY+8PB0o/EvJ5W/EaIvfsKIy7LDTpIcxq3Zmu2o3uQad9rnK8H
 eL6mVw2EelZODoFQanrXIV/nHY3GWcqhgtSgCgYBO8hW9hpsGpgvwk9m5
 oW4d6ZWZN4HyePVFxyZtwB+WwnVjxf6mcEueakdOVhKJKtI7uoZJD5KQS
 Hoh2YPBpHXXOVCIPzlRjG/1UfCBWIglXxc1V+xQsRLs9SdV5un6EXiJ6s w==;
X-CSE-ConnectionGUID: lvSmuZsrSjmOfPSuXNNYGw==
X-CSE-MsgGUID: A3snbJGwQC69CiAyibwUjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2271633"
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="2271633"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 19:40:51 -0800
X-CSE-ConnectionGUID: 58uHJS/lRlmdKL8nV7C93A==
X-CSE-MsgGUID: gg7gp7c6TsaDgCC0izF6nA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="6142455"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 19:40:51 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 2 Nov 2026 19:40:50 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 2 Nov 2026 19:40:50 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.11) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 2 Nov 2026 19:40:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GVROPPllXui+BXLn+wMhFSMc7NZHT/R7v/w1gM7RJJMigzBr49T4XTuPiw75PdhM9cxskzT5ftlw4+UnURaVwWydcRdWVIwrCLKneaOqgMjY2a+QhcHaqwstOB0UQkYd0ok3pQipIbMVlx3AUGSVBoptMO9Rk0NjZCr0WdjRrrJ3zCV4gbpeHUP+be9aF8n2cZI1woEPv3e9cXEAI8JRue54QoKGIzuRlcK+LuxxgrK5h454s53i7j4jOw7Ne39i6piNHpFX7udhgvn4Kk10NwCndn86987SBPaPsNAjvLN8/ez7EDBsapH92zi5qt/ZoJNx+O1gwPNLEYKPTnbu9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UPMPrDOQzxwVd5W4+XkbOEtPb17u200jJ9YaNq9grG4=;
 b=U1sBigflCK8xJrfLrHYnT+TiLA1LSfU7YS6VsHhstEQsSneEgw+V+A7KJZCaarprCIFb6qa2OyWM4h4p2FnqJYU76Lj3EZdWrZm54lS/+lQy2k+9OCcy4St1eFETX5QJ711hPyvaVV/ZMLU2SKUHZhSCka4RBmA3coYdakcyGl767P4CEiPUu4AOfg7vZqY1SGZTAnLOcC6ZjBJmluk6poKDFphr4xvXg+bn0gU8PXE+WVmEsAx0tZTO7uQN0FsFXimiAz7P/4IkkIGWENvPa3JfvSOZMt/0hD6THVF46117F/DCG5lPhJFQX1mBKi+lGn7GsmvA5fHJU+xkf/GvAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by SA0PR11MB4525.namprd11.prod.outlook.com
 (2603:10b6:806:9d::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 3 Nov
 2026 03:40:43 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::19f5:13eb:df52:68ff]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::19f5:13eb:df52:68ff%8]) with mapi id 15.21.0569.011; Tue, 3 Nov 2026
 03:40:43 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH 02/10] drm/i915: Do intel_crtc_vblank_on() later on HSW+
Thread-Topic: [PATCH 02/10] drm/i915: Do intel_crtc_vblank_on() later on HSW+
Thread-Index: AQHdaJISwXTs8xvFjkOv+QnBzrNza7cbuM/w
Date: Tue, 3 Nov 2026 03:40:43 +0000
Message-ID: <DS4PPFE901A304FA2BD5F2E30AB6D254A39E3692@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20261030171327.29829-1-ville.syrjala@linux.intel.com>
 <20261030171327.29829-3-ville.syrjala@linux.intel.com>
In-Reply-To: <20261030171327.29829-3-ville.syrjala@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|SA0PR11MB4525:EE_
x-ms-office365-filtering-correlation-id: a8e2d2f0-abb1-4610-101b-08df395c3d26
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|10067099003|22082099003|261102123227099003|18002099003|56012099006|4143699003|11063799006|261026140227099003|261022105027099003|261021121427099003|261021123027099003|261022075727099003|261026121527099003|261009223027099003|261028144727099003|38070700021;
x-microsoft-antispam-message-info: PQpPYBOtJSmmFdfyqFsaphiNs2OMGl3ra8zYo6TQkAL7XtBYnGp8Q/ZX/yGaBkm7nThfPzhzRcW40RU+WJNp4u9GlIlnnkjGLwrtbIgDKnPyDFzbXj6eQhNj3UHxOL5fRPY9t3wl5Rpu8EcXDNqmtzBGYstk0IDPCz54CLx0LwGmQdw6PzSflb20D1Z+1SDYhjV0QFcB/MfiyvfqnZ5ZiJjqtSVp8yIP9ovopBVBjC8iGXkYFU0y9HYBPgg/897ywU7gPOHXKNVw6zVASTPy1GVB4jtSedawt3Oadt9pthHyNWRPOM174AK8p8RTZaDUQ31wOYJ7mWX6tNOKuCPjNcaKmIcNWH3+ihHA/c+5O1uq8nNOnHFveW9mJ+EEhNaOv898z3sok1tuZOxtYMTD7s//nkYojIB74qNxkMvQbRJ4c4AkamPW8FaytAFXRPWuZj+MbD50W7FSXPQXibbuFxmxkrxcDpSYTlMIUZLIA4j/JhRJVVk6scfVyntWcyyx5lbmmX/UhLnt4X+dlAtqN2aXPaZRwejSy0SX9o34KNcyJl6bhcuYsVvdFQoShOTn9iwFONE78cx9VFHRJiAbvT+nB8gV+O9tng8cLduvR0xHf5Q7LX8csEa/u3cU5v+FEHzNfUTzCJQju4p9RCTcH6JPi60OuiKsfQTHvSvmHzn/oRUBKgqVpKpppqR+LDeBP5tFR3qgRbIoliGolcFJnvaXwJi8L/zxJC1YICL6NtQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(10067099003)(22082099003)(261102123227099003)(18002099003)(56012099006)(4143699003)(11063799006)(261026140227099003)(261022105027099003)(261021121427099003)(261021123027099003)(261022075727099003)(261026121527099003)(261009223027099003)(261028144727099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SENTRlZ5eHFmV0dubHFJZmdqUXFocUFKekJYdjdmQ0Y5TitqU0NuTWlpYWZS?=
 =?utf-8?B?aE1JNmdRbUxwaFJ2QkZKZVFXeTJjVFdUbnZUZVhlZThSb0JiSDdCVjVybU1I?=
 =?utf-8?B?NTAxSzk2aVBhU3p3MVBBVktJNFc1UHFmalVWa3RPaDZwa2VlSmFVcSt3eUlh?=
 =?utf-8?B?Tm4wbTlBYTFsbXpOZzdRcTd3SjlNbC9ORTlMam5GM0NxZTRFV0RiTHJ5Uklx?=
 =?utf-8?B?ODQ5L2lySGIya2ppekp6TU1pbUJSQkNKbTkxTkZJS3F6WFZnd3FOZ2p2T3Ir?=
 =?utf-8?B?bDhYMHNMVHpRNGd6bDJFTXlxcFFmbjBodHk4TU5LdDJIaFNObXhQdmhEMG12?=
 =?utf-8?B?c1g5UkNVMXQ3eG1NcUhqN2doamxQLzgyajNmVVJxVXk1MHRKVkVwditxMFpZ?=
 =?utf-8?B?ZVNkNEVmRWk3K3dKSjNaS2cxTkxrbW9iVVBhMTV6TFd3V3I2MU5VdytnMWdL?=
 =?utf-8?B?aXpQNngvY3o2SU16TjNIdDVHWDlPb25TTXRpS1dySWx2c0VuSlo3UGloUDJV?=
 =?utf-8?B?TTMxbWlUNFRhWVVtckxUVzNKN3hEcE9Jc0NtM0RKMWZDZXVTQ05TQ1N6cjgw?=
 =?utf-8?B?VUNmT0pUTEVKL1h0MnVmRWpsNS94dUpCSjg0cXVGZnhudzhiQU9ZcDB4YjhQ?=
 =?utf-8?B?Z2t6cm1RdHRaa2k1cUw0TkZUM0tJTGQyMmp2ajIrVisvSVkxY0srNFVVOTNL?=
 =?utf-8?B?eUlIUk8vQ2EzZUczbWtraTlzZkkwV0ZkcFNjWUJUMmwyTWtTbFJlWWFEaEN2?=
 =?utf-8?B?UDBuazU3aFpzVEJDQTZHeWtRK2wvUTc4bFZvNkd2ekdld0pQdUZ2L0xvZTY2?=
 =?utf-8?B?bGdlS0hqMUdZQ1dVM2ptUENMSFd6a0NNbjJiRTZMdGxyZFhyV2xQNWNXZ1dU?=
 =?utf-8?B?RGcrUDFuNUpMTVRwKzM3YVBNUFlOZHo0MEZDd01lUVhVN2hWUmtnaGNpYVBI?=
 =?utf-8?B?K0J4NTc2QTZuaFVJc2pNV1VZcXBCbTJoQ0lPUHF6VzhsaUNxem4rbWl6NXpw?=
 =?utf-8?B?RzcrZ1NYZ0Vad0MxN2JQS1dlMTdnM05Mdy85WVp1b3llb0hIZDVzYS9yTGZ3?=
 =?utf-8?B?ZEI0TlZEN09YNVVhT1FDUm01bVk0WittKzdlT2lHL3hkL3d4bzdMNGIzVDVk?=
 =?utf-8?B?ZWQ1eW9yZ0JLSThWaENKeDVTRnBiaUdjRW0xcmlWVzV4QlVBZ3JlS1d5QWFu?=
 =?utf-8?B?blMzQ0FKTnVsUFFBQ0g3NkZSVkpCQ253Ni9nQ2JvTmhmSnBYMUhjanVDd0R4?=
 =?utf-8?B?ZGp6SWlKNXl6T0J0eldYZ3NVZytyMXdWcmo5djNGZEpzWHBNQnE3eWErcDY3?=
 =?utf-8?B?MEltZ0d0VjlQbEt0UGpuUW9oVUo5NTczMHZwaFNCbU1ZajBDQnd1cHR4MlhP?=
 =?utf-8?B?TFJlSmZWUUQxSGZLZnRxVVk4K3dzQ0lpblZRRFRRYVJmWjZSb3hDV0QwWXB4?=
 =?utf-8?B?cVY3WXIrU2NHV2VUMXdIa0xqV1AzUnNkaGd6UmRDRW5WZmppenBhWHZRL3lE?=
 =?utf-8?B?WU9HckJGalR2WW01dXFRRERjajdGVmVjRUVvRjVUT2pMK0NlelVNTXVWYUJT?=
 =?utf-8?B?OEltYUd6TXZ2N0ZEMFZZQ0txekhWODZtNVlFMW8xNkp6OTRpbDJaejJ0bTd4?=
 =?utf-8?B?blRmSTB3Wkcybi9jUzdmNlQ3bHFPTEpwQXVBakgzVTZhdDhTWGRoZHR6YXov?=
 =?utf-8?B?NjFhWEpydm5zWGlVZmkwT3BhV09uWExlU2NCb29vcEE2NHZWYWE4QjJyTnBY?=
 =?utf-8?B?ZHRDVHNvTHM3T1FaeFc3TDk0dENPaGxGZFhCRVZiZ0I3czlGWG9HbmZjUmJY?=
 =?utf-8?B?eUVqWVhhaVZTcjJpbmJWejNvUlk5MmhXbzZ6Q2FDaFljRHN3RnpZNmsrbEly?=
 =?utf-8?B?ZDM5VTZybnRnMEZXc1FvVVpSVlZNRWtKUDZUUFhLTC9TV1djRDhFazZ5bHZZ?=
 =?utf-8?B?Y24rU2w1cVpzWTdvbzhRampJaGhRN1FGem5WYSs5YTdaS2Z6QzU4aThveWpp?=
 =?utf-8?B?R3lNOTYxUE11dllFQ0FtUHFPZlh0dWdPamZUTTAzUDZ4Snd6R0xxMVdQQ0dW?=
 =?utf-8?B?N1FoUnpzZUlsTDVFaG03RW5aSmIvYVFpeEdCVzVqM1dCZGhyemh3Q2MwZjE5?=
 =?utf-8?B?TjNRVTNydkhOMTR4Q1Q2OHZEaGJRQ2I5WkMrODIrSmtLSlRNdjZTTmpmaXZa?=
 =?utf-8?B?M21LRHhwYkNGYkJKQmRsb2ZmLzU0Z0MxdmJXaFVYeDRJbUc0bm5PQVRnQStH?=
 =?utf-8?B?SUxxeGZlWHlZWXdoOE8rVGdHUFF2c3hDM2FhamJUWGdPRjhUMjV3b0ZCalZM?=
 =?utf-8?B?dFNTWmlHd3AvZTE5LzhOZ0pXUlQ5RVFDL3dpSWc5d2dZTXlpTVpJUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: YA8XkeEfvn/2tEo1nTBpYDYu8kDt+GDQ8TFh8hfJNID40wHoodZaGD1HTvj7WFiGz36gxEtBdCPm+xWpG5EkEPubmz3za/ly1FOs/j0Ii14b2slBJh9d2LQ9fkqGicjBGe5ZtYF9+fXAupodnb574ObtDznvIuMDCYrcYpp4Waf7OG8B4SrONgOQuuJio0Xs0Z/OqsCDzkp6JCwwZZ66+bQj3jU8g3SS0Yr7WpImYhdfwPFKYCwuK1gutQeh5w1zrjdldUdsCT/Lm8P0etxSTam4ZLggi1SDkZqGbPavEs7n4W7o4xO51xeUq2VIiCrjoXCsIDk+e8ZCqDha76xckg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8e2d2f0-abb1-4610-101b-08df395c3d26
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2026 03:40:43.5232 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Pz+yjAQq5pxg97w0ds/x90jl0hnp1hiPbtYsFf5WqawJrf0YFUKMGOaPVJQoTC8X4AXmNc2iar9joF/yxlF0Ug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4525
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

PiBTdWJqZWN0OiBbUEFUQ0ggMDIvMTBdIGRybS9pOTE1OiBEbyBpbnRlbF9jcnRjX3ZibGFua19v
bigpIGxhdGVyIG9uIEhTVysNCj4gDQo+IEZyb206IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3ly
amFsYUBsaW51eC5pbnRlbC5jb20+DQo+IA0KPiBXZSBhcmUgZG9pbmcgaW50ZWxfY3J0Y192Ymxh
bmtfb24oKSB0b28gZWFybHkuIFRoZSB0aW1pbmcgZ2VuZXJhdG9yIGRvZXNuJ3QNCj4gYWN0dWFs
bHkgc3RhcnQgdW50aWw6DQo+IEhETUk6IERESV9CVUZfQ1RMIGlzIGVuYWJsZWQsIFRSQU5TQ09O
RiBpcyBhbHJlYWR5IGVuYWJsZWQgZWFybGllciBEUCBTU1Q6DQo+IHN3aXRjaGluZyBEUF9UUF9D
VEwgdG8gbm9ybWFsIG1vZGUgb3IgZW5hYmxpbmcgVFJBTlNDT05GLg0KPiAgICAgICAgIFRoZSBv
cmRlciB2YXJpZXMgYmV0d2VlbiB0aGUgcGxhdG9ybXMgYSBiaXQsIGJ1dCB3aGljaGV2ZXINCg0K
KiBwbGF0Zm9ybXMNCg0KT3RoZXJ3aXNlLA0KTEdUTSwNClJldmlld2VkLWJ5OiBTdXJhaiBLYW5k
cGFsIDxzdXJhai5rYW5kcGFsQGludGVsLmNvbT4NCg0KPiAgICAgICAgIGhhcHBlbnMgbGFzdCBp
cyB0aGUgaW1wb3J0YW50IHN0ZXANCj4gDQo+IEFsbCBvZiB0aGF0IGlzIGd1YXJhbnRlZWQgdG8g
aGF2ZSBoYXBwZW5lZCBhZnRlcg0KPiBpbnRlbF9kZGlfZW5hYmxlX3tkcCxoZG1pfSgpIGhhdmUg
YmVlbiBjYWxsZWQsIG5vdCBiZWZvcmUuDQo+IFJlb3JkZXIgdGhlIGZ1bmN0aW9uIGNhbGxzIGFw
cHJvcHJpYXRlbHkuIFRoaXMgdGFrZXMgY2FyZSBvZiB0aGUgdHlwaWNhbCB1c2UgY2FzZXMuDQo+
IEZpeGluZyB0aGUgbW9yZSBleG90aWMgcG9ydCBzeW5jIGNhc2Ugd2lsbCBuZWVkIGEgYml0IG9m
IGV4dHJhIHdvcmsuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxl
LnN5cmphbGFAbGludXguaW50ZWwuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1
L2Rpc3BsYXkvaW50ZWxfZGRpLmMgfCAxMSArKysrKy0tLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQs
IDUgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RkaS5jDQo+IGIvZHJpdmVycy9ncHUvZHJt
L2k5MTUvZGlzcGxheS9pbnRlbF9kZGkuYw0KPiBpbmRleCBlZDdkNGNiYmZiNWEuLjlmYjQ1NWQ5
ODBjZSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9k
ZGkuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RkaS5jDQo+
IEBAIC0zNTcyLDYgKzM1NzIsMTEgQEAgc3RhdGljIHZvaWQgaW50ZWxfZGRpX2VuYWJsZShzdHJ1
Y3QNCj4gaW50ZWxfYXRvbWljX3N0YXRlICpzdGF0ZSwNCj4gDQo+ICAJaW50ZWxfZGRpX3dhaXRf
Zm9yX2ZlY19zdGF0dXMoZW5jb2RlciwgY3J0Y19zdGF0ZSwgdHJ1ZSk7DQo+IA0KPiArCWlmIChp
c19oZG1pKQ0KPiArCQlpbnRlbF9kZGlfZW5hYmxlX2hkbWkoc3RhdGUsIGVuY29kZXIsIGNydGNf
c3RhdGUsIGNvbm5fc3RhdGUpOw0KPiArCWVsc2UNCj4gKwkJaW50ZWxfZGRpX2VuYWJsZV9kcChz
dGF0ZSwgZW5jb2RlciwgY3J0Y19zdGF0ZSwgY29ubl9zdGF0ZSk7DQo+ICsNCj4gIAlmb3JfZWFj
aF9waXBlX2NydGNfbW9kZXNldF9lbmFibGUoZGlzcGxheSwgcGlwZV9jcnRjLCBjcnRjX3N0YXRl
KSB7DQo+ICAJCWNvbnN0IHN0cnVjdCBpbnRlbF9jcnRjX3N0YXRlICpwaXBlX2NydGNfc3RhdGUg
PQ0KPiAgCQkJaW50ZWxfYXRvbWljX2dldF9uZXdfY3J0Y19zdGF0ZShzdGF0ZSwgcGlwZV9jcnRj
KTsNCj4gQEAgLTM1NzksMTMgKzM1ODQsNyBAQCBzdGF0aWMgdm9pZCBpbnRlbF9kZGlfZW5hYmxl
KHN0cnVjdA0KPiBpbnRlbF9hdG9taWNfc3RhdGUgKnN0YXRlLA0KPiAgCQlpbnRlbF9jcnRjX3Zi
bGFua19vbihwaXBlX2NydGNfc3RhdGUpOw0KPiAgCX0NCj4gDQo+IC0JaWYgKGlzX2hkbWkpDQo+
IC0JCWludGVsX2RkaV9lbmFibGVfaGRtaShzdGF0ZSwgZW5jb2RlciwgY3J0Y19zdGF0ZSwgY29u
bl9zdGF0ZSk7DQo+IC0JZWxzZQ0KPiAtCQlpbnRlbF9kZGlfZW5hYmxlX2RwKHN0YXRlLCBlbmNv
ZGVyLCBjcnRjX3N0YXRlLCBjb25uX3N0YXRlKTsNCj4gLQ0KPiAgCWludGVsX2hkY3BfZW5hYmxl
KHN0YXRlLCBlbmNvZGVyLCBjcnRjX3N0YXRlLCBjb25uX3N0YXRlKTsNCj4gLQ0KPiAgfQ0KPiAN
Cj4gIHN0YXRpYyB2b2lkIGludGVsX2RkaV9kaXNhYmxlX2RwKHN0cnVjdCBpbnRlbF9hdG9taWNf
c3RhdGUgKnN0YXRlLA0KPiAtLQ0KPiAyLjU1LjANCg0K
