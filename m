Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AEA5CCD199
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 18:11:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F19C10E8AB;
	Wed, 15 Oct 2025 18:11:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P8Ww8Yq2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E26A10E131
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Oct 2025 18:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760551870; x=1792087870;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=MfL5gEis4ZT44G6Oh4A937xWgcP48Ia7efWGTSU8TGQ=;
 b=P8Ww8Yq20UFEdQxgRIKjrQ3Ph2hIsl4t7UCnMgjFbuyxZQ1tM6Vj8Nm6
 QYFTf7Jc8t8Y5TlcwrkfV6FtnyjaLUF9YeQNxxxCPxh6dyXGtNCPKP0Ug
 GcqOBmTK4ZCSS+t9EN+t3VGYzvXaong+gFXZISnfRvtL17czTY8iYqrWj
 Ao2ui5ISnw+foCDQBRTMT+F2AgNYOCgy/G86UXcRhKkeTHtEoZw0Eyq22
 yY69sCm2vYqPEfLIHIm1aFyrorHStHHHenX5Lqm7+MdmNw6LQZBKoERQ+
 1hFBAasIni8+4yhrtwdYcaX5yhcWFLG36zF9QgY7mDUHGnaRG1gTZ6MSe w==;
X-CSE-ConnectionGUID: /2RyT0ETQ0a0Y1kBYbGFOQ==
X-CSE-MsgGUID: PwIWbZa0RFuXaE/3Af9D5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="73337307"
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; d="scan'208";a="73337307"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 11:11:09 -0700
X-CSE-ConnectionGUID: KOW9O1mjTUmWF9UakykmHQ==
X-CSE-MsgGUID: GPtGVXzgTkapXOWS13jPzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; d="scan'208";a="182222620"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 11:11:10 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 11:11:08 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 15 Oct 2025 11:11:08 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.40) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 11:11:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ppb/3aNz/3uduU8y8YSB/Q9oen9Y6RGBnuGHMJsh6WpSBAokJHhr+t6YtbqjpnLKnALsZaZopKMhixXfCxf82mOobBM5iSMgDGVMtdb1T9braW3XMDmer71BmqexjKNnCBDIVUiBGNCdrErL7VpJB+blhvJUTg/ym30FK4t6FMR+3VdmehinAHRP0lntjRkFww/JrZuFt36XZbHcmmUJ8yubEaW/RuUr3TQjX8kS1AVZHlArDn9f9QmDsdDOpO0yc+5Bs1zQ3WA8UDQQJDFBcFCc4MvNACb4pz18gbhp4WHZM1JLFgB5+obfsaF4c3ek1Kdb/EMylMhGHIEMhppd9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MfL5gEis4ZT44G6Oh4A937xWgcP48Ia7efWGTSU8TGQ=;
 b=k7pvQOAPZd2YwbPj8M/q/AUJ33u/jLiu3yVp0a56OCdGN/snK+vmn3AgxJ87qD7JUli0LJITDTGOTy5bR/zB+2a9bpZniwXMjwbguRH1UG0PXADW0IycUsSk8vJgxI9bVrwHhWRpQp+VcQCLIkROsGSsd/xKQ81RF6LwEKN9B4yBjifNhudjpAgqdkj5tHR4FnicOsDrxM9awIXh9Bwtw5x3WVCnOy0efhPSxxG2V6JCmYHXrmiEp/guB5KCz4dIyreLaRahZgxl4jasPOoBB0QBShyAv/y6BHhQheFvHNC1cd/zsjG04IjOAXiszNyBAsFqMK6iiFIW8lxoB+ChPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by PH8PR11MB6949.namprd11.prod.outlook.com (2603:10b6:510:227::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Wed, 15 Oct
 2025 18:11:06 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad%5]) with mapi id 15.20.9228.010; Wed, 15 Oct 2025
 18:11:06 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>, "Ceraolo Spurio, Daniele"
 <daniele.ceraolospurio@intel.com>, "Auld, Matthew" <matthew.auld@intel.com>
Subject: RE: [PATCH] drm/xe/guc: Destroy LR exec queue directly if GuC is not
 running
Thread-Topic: [PATCH] drm/xe/guc: Destroy LR exec queue directly if GuC is not
 running
Thread-Index: AQHcPLwdKRsd0GwLskWBa7x77cQcnrTDcNpAgAARAQCAAAGyQA==
Date: Wed, 15 Oct 2025 18:11:06 +0000
Message-ID: <DM4PR11MB5456A099DB75CBEC655B3B8EEAE8A@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20251014033646.1619865-2-shuicheng.lin@intel.com>
 <DM4PR11MB5456BE10B3AFD01CA3AC61CBEAE8A@DM4PR11MB5456.namprd11.prod.outlook.com>
 <14bbd55cc2e92dc8b70fd894a955e2785dc74204.camel@intel.com>
In-Reply-To: <14bbd55cc2e92dc8b70fd894a955e2785dc74204.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|PH8PR11MB6949:EE_
x-ms-office365-filtering-correlation-id: 01511028-310e-4a68-8d5f-08de0c1635b6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?T1UxOU4vQTFPcUd3YWliVWQxbTUySzFvNWtkSHhwQjZjM2xBMXo3Z1Rqb05I?=
 =?utf-8?B?UUhFZ0c2WTFaUnZQMFlaZHFCOEJMTHU0OEZnVEdBbldrSVFmY2JTcS9oZWh0?=
 =?utf-8?B?WWQrRjZkZGErN2JKWVRYSTFlUTZKT2NWME40dE01ZEdkOGZnN0I0SW5mNVZy?=
 =?utf-8?B?RVhIRjBJMEUzZWdnalZtR0hKUDRUYkZVaFFCbkx1a2EyVTJaQ1M3c0VpVkQ1?=
 =?utf-8?B?RUhhV0pEanowenNjMmp6WTdSajMxYVgwaWVkWXcxNXUvbmcycTdyL3NaMmVY?=
 =?utf-8?B?TWxRb0lscFF3bzhRYTZUWHc2Q3o0ZGJ6OEhmaHRRK0lmSzl0YmxuTm1xaTNM?=
 =?utf-8?B?aWxaeXhLSjFtT3NGb1BSVStkeXNRbkNVMzVOVEwwYVpoVUVibHpEOFN0bG42?=
 =?utf-8?B?VXVIQmhTOEZJbEowSVp2eC9zVk5ZVkJINFJwWVRFQk9vOEhPUWlVVFNDcWdI?=
 =?utf-8?B?dnNSYTRmRWFKWTJ2OU4rcFZDdEhqQ28rRlliWEN1VVV0RmgxTkVtams5NXhp?=
 =?utf-8?B?Z0YrNjhHZGNNazhuMUtPSm9lTlpuSk95dVJzR3B2TlhVMFAyZWdmTE9Yc2FE?=
 =?utf-8?B?QmUwc0JSclNXcnVsVmwrTXJOT0hiZEFibTdYSjdMWndzZlNCaDUxWFp3aFZ1?=
 =?utf-8?B?Q1VUbCs2bnRpVFZyb2tsN0owUTBiQnZCOGhLd2J4SDI0OUdPYjVWdDJnb1lx?=
 =?utf-8?B?SlV3eXl1RW14cVo3MWN5NzhuZ1A2cDcrYWFXUysxRHE1bXplZHcrNFY1L2FD?=
 =?utf-8?B?SkQ4aHA1NE9KSzNVRkRIYXpTU2Rwdks5bVVSSEMrRzB0VllXWHRubXEyNHVj?=
 =?utf-8?B?TzA2N3gxSmFzVzRubjZubjdMS1E3aGVKNGIzK3N3UzRmanVXSEE4RDZyU0Jh?=
 =?utf-8?B?UWZ1WGhoTjkzdFJ5QWdVQmpZSkp1dXFaUmt0dG1wVVdDOFhSMExXb2pnWVFt?=
 =?utf-8?B?M3R4NTdEZXJ5cjI0Skl1TVQxU0JGeHp1MnFvcHhCS25JRkZUeG5lSjZiWTNP?=
 =?utf-8?B?UEt3RVZ4d0x5NldzYmVVNkZzVnhWN1JJRmpINXUzVTZBamdCVCtVWThzRHhr?=
 =?utf-8?B?cDFhWS9aTzBOTklJaFN0WlFxTUdTZlYrR0pDUVdXcTU4REE3M2ZvMHhiK2tU?=
 =?utf-8?B?cDlvVGVVTGlXQnpVSnFzcnZ6QXBpWW03dzlhblFRQ1drV3JiRWtHeDFaczM5?=
 =?utf-8?B?ekNYT29UOEI3TUxjZkM1UllaeG9CbFI0Z05JWUNvbHNzKy9qRGg3bVhSb2U3?=
 =?utf-8?B?UnFOQTNwcUJZeDNIY204Q1FraWdTT2Z0MldlaE5Hbi9Uak5ydkljSW9NUnlv?=
 =?utf-8?B?NG9HcFQ5elBFWmVUdlIwbDdwOXZZb1JWbjBlQnhyeWlkckNvWlVTd0FOVC9P?=
 =?utf-8?B?eEg5VDlwdXNYUTE2ZmI5U3NVRmUwOGxLeFdTcjNpRkdGNVBFenhPUS9RUE9v?=
 =?utf-8?B?YmJ5dk9tVTBrRTBKQWk3Y09wNzVpVWdzOWs4RnkwWlU4cHZodXQ5Q2NtT1Ba?=
 =?utf-8?B?MlN6cVBITmpya1I2dWw0MktDVktyd2JJa0YrTittZGxUdjVvTzc0YmxjNHpp?=
 =?utf-8?B?Q0pLY0F2eEF3OU5FN3BsMnlVdlBLMWNEVS8zc2Z2M29ja010MnUva0l3MUEx?=
 =?utf-8?B?bUdVclFjQXdnLzFPVzl3MGF4ck83ZnpGNGE3Nkk3SXVJeThEREhhMnFMSk5a?=
 =?utf-8?B?UEhRV1VodGZUbjBLUERiSFdqMWFJWm9zeXRWN3dDMVY3ZDcwUmtvZ05MQ1Aw?=
 =?utf-8?B?VVRGS3VpTzE4MDF4VjVVTEJZakE4SkpKQUp3ZE9mQTg4cWRXd1NkVFA4dVNG?=
 =?utf-8?B?RnFnZzUxUEFrRkhJMVFQZTg4aXdEU3pvb1c5ZFR5V1hIZ1RlUi9zWHNORVIz?=
 =?utf-8?B?a3RZYk1pSEFZdHJlb1dGODV2Yit6QjZRWkFRbjNFUjdTN0J0NVJlOHhkTElk?=
 =?utf-8?B?d05uUE9obmhNM1dVL3cwSkxtaTBkYnNkb3N6TmJxajhWdUhZTHdETGZtNjdt?=
 =?utf-8?B?MUc1RExtMXJBPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bjloWEQyS0RCeDZCSzd2c1kyQk1VZTREWlRRSDEwZEtVcERkUk1EWVp5Nnc5?=
 =?utf-8?B?OENDcU9UWDZ4VjUxMFpNM2wwcGliTXFOMHpKam9nb1VFRGgzcjRhRDh4WGNN?=
 =?utf-8?B?eGpVaE5Ic21yQ3Z0TmgwdDUweVRoMmRYbk9vMVZ0RjVwTHY1em9VaVZWNWxL?=
 =?utf-8?B?cUxya0gxQlYvY1ZEcWx4L051TUxQc3pvSEl3WE4xNFVSU3pEMzJjNVBRR2h5?=
 =?utf-8?B?c3U4K0R1dFpDL0ljbEwxeU9PZUs2ZGsrZlJYVlc3amJaK1BqejRINEpKMmxE?=
 =?utf-8?B?d0h5SmdhaEVvY3FNT245Q1kzU3VyUGE2eXpOKytUVGR1WjFLZ1VnZHNEUy9V?=
 =?utf-8?B?dUVlSGJaNnRpSHVHdmt4NC9JNnNROGpHRW4wMEhNWTFJNllybHE5a2pLUzVH?=
 =?utf-8?B?VGRwYVhxbXNnRFlkYVN1ck1TQVc4VG5OdWRYME4xY2JWRVFrRU94TnFJZDRm?=
 =?utf-8?B?MWFIcEFVRXppRnJTNTU1WFRRY2xzSVpWQUNveFBPN3lvWU1UTXFjSFhCQ3pG?=
 =?utf-8?B?YlZsaGNWcmlrQ0ZMSlJMbFV2VldmTi9WY3U4Mld6aWlDM2ttbU9nMGI1M2lh?=
 =?utf-8?B?dFBEeVFRNWV0aU0xc0NIMllYeUIzdGhtMlpGQ0crY1U2SnkzUU1jMjNLR3lY?=
 =?utf-8?B?L25IUU1FQm1uOGdUdkMrQThqeDRzOGRCMFJWQkxzTjFpR2Q3cjBNdVhFNVBL?=
 =?utf-8?B?S3hWNSs1cHRZVjN5YmdjM2E1eDh6RzJxaElkUGFmMEVlZzNFZkFnS082aExU?=
 =?utf-8?B?MFFYS0liUWNPaXdoV2M1VzRCTUJ0K2hQU05GSnlCeGZxK2FMT3pMOTVJUzhT?=
 =?utf-8?B?eXprTVVsTEVqazlXeHA5MUovOVgrVmRYaXBSQlRQU0xUT0RtNkQrbWdMWkhK?=
 =?utf-8?B?N2JQWGI0YjBJaWo4MkpZNkZ3blZiSGFrZ1VvbGxKVnpyNE1FV1A5K3RhaHE2?=
 =?utf-8?B?b1FLZU1tSkc2a1FsMDNTZkE0WGhPMThWVUhiZlhSUXZ6MnAxZjNtVW1hTlZ0?=
 =?utf-8?B?SFgvMnRnWTZzMEU1Y1M2VHZCWVI3YldlaWFPS1BXUUxka0RtdnE5NWhCTDU3?=
 =?utf-8?B?VTkwR0pEK2tDbmp5QUorajNDZFlPOS9VQUhSY2FPVmZLVDVPeHFaNXlFbVAv?=
 =?utf-8?B?VUxxeWwrcnd4MWVsT0JmSVYvY2xKRnc3MmNFV0dBVk1KS0d3MWQweTNNandh?=
 =?utf-8?B?MGpkeEVCUThjdWdLNVFkcTdhdkk5VUE5Qjk2Qk54T3FpZks1ZVpzVVBLSDRr?=
 =?utf-8?B?a0pGS1l0cU9wd3J5RVBCU3J0YWVGdFJSakVNWTIzRnFRV1NSVmo1MjUyVzZD?=
 =?utf-8?B?bE01UW1HQjU1UkpSYWN4Q3c1NU8zVGtGMFZSd0ZUZm9VZVhoRlJVTjVyMnd4?=
 =?utf-8?B?N0MwMEtKekNaY1hqQ3I1dUd6TXJuNWV5c1ZTeTdpSjVHUXRKanlYdGkydEU4?=
 =?utf-8?B?VlFYVmdHVFRmcVltTlMwcUxVMTExc1owOFZSVDVmdmhkajdNblJWWkNpZ2FE?=
 =?utf-8?B?aklqVlhBRld3cW5jcERodUtTbkdLMFFMWGYwaFUxL0ZKSG1mNVFXYVdxRWVL?=
 =?utf-8?B?dEE1UWxNOVRFSmhLdEFhMDNSNjBkNFB4WnBKNTMyT3phN0l5akJ1NWhUNVRn?=
 =?utf-8?B?YXB2N1dHNklVaGVyaUQ4Tk11ZWRGd3p0Y1NtOGNwMm9xSEdOajJHbFBLcm1L?=
 =?utf-8?B?VU8xWC92YUVzbXpyeXo4TjlTelY3c0NlMjRRTnlnT3dUSnkxbDlzektvM2NS?=
 =?utf-8?B?eTBrWFJJOVpLTEhGNndrNzNHZVJERDhVZDRCYVppMVdodmdhY2VMUU12Tk9N?=
 =?utf-8?B?SjN1WTFMTEV1V3BwU3Z6S2JWT2RjQTBhamNqbHV3VGd6cG9ZVC9mUTRIRFkw?=
 =?utf-8?B?ZjRSUDJ3d05jZnEza2sxMWxRbjRpMnBaSUVUclJvZjdwVjdEMllvRCtGZlB6?=
 =?utf-8?B?UDIwbnhxUjZKWFdtT0ZwVVdaZ2RlcFRYZ1lYWC93QlJsR0hZNXdRVnVxaUwv?=
 =?utf-8?B?cHgwTEVERW5iRHgzRUtGbTQyeEwybmUyLytGQ1Rab2hFNk9KK29uN0VNMGZU?=
 =?utf-8?B?OFhoR1YvRjNTamVkNGt6b3ZZemkyRVBsaTZkY2Y3SkFmcHYwTzhGRGNDeTZy?=
 =?utf-8?Q?DU+gWxg2OoX1xbkvCE+x4SFlP?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01511028-310e-4a68-8d5f-08de0c1635b6
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2025 18:11:06.2552 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RVnlerBU2kWSV3cyNus9Tspg3+DFppSjXWckZbGAja8IweeetedYlc2AuMIHSkkF6Br3R9sN0OXMu9AlV59LPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6949
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

T24gV2VkLCBPY3QgMTUsIDIwMjUgMTE6MDEgQU0gU3R1YXJ0IFN1bW1lcnMgd3JvdGU6DQo+IE9u
IFdlZCwgMjAyNS0xMC0xNSBhdCAxNzowNyArMDAwMCwgTGluLCBTaHVpY2hlbmcgd3JvdGU6DQo+
ID4gSGkgYWxsLA0KPiA+IENvdWxkIHlvdSBwbGVhc2UgaGVscCByZXZpZXcgdGhlIHBhdGNoPw0K
PiA+IFRoYW5rcyBpbiBhZHZhbmNlIGZvciB5b3VyIHRpbWUgYW5kIHN1cHBvcnQhDQo+ID4NCj4g
PiBCZXN0IFJlZ2FyZHMNCj4gPiBTaHVpY2hlbmcNCj4gPg0KPiA+IE9uIE1vbiwgT2N0wqAgMTMs
IDIwMjUgODozNyBQTSBTaHVpY2hlbmcgTGluIHdyb3RlOg0KPiA+ID4gRHVyaW5nIExSIGV4ZWMg
cXVldWUgY2xlYW51cCwgaWYgdGhlIEd1QyBmaXJtd2FyZSBpcyBub3QgcnVubmluZywNCj4gPiA+
IHRoZSBkcml2ZXIgY2Fubm90IGNvbW11bmljYXRlIHdpdGggdGhlIEd1QyB0byBwcm9wZXJseSBk
ZXJlZ2lzdGVyDQo+ID4gPiB0aGUgZXhlYyBxdWV1ZS4gSW4gdGhpcyBjYXNlLCBkaXJlY3RseSBk
ZXN0cm95IHRoZSBleGVjIHF1ZXVlDQo+ID4gPiBpbnN0ZWFkIG9mIGF0dGVtcHRpbmcgZGVyZWdp
c3RyYXRpb24uDQo+ID4gPg0KPiA+ID4gVGhpcyBwcmV2ZW50cyBzY2hlZHVsZSBkaXNhYmxlIGZh
aWx1cmUgYW5kIEd1QyBJRCByZXNvdXJjZSBsZWFrcyBhcw0KPiA+ID4gYmVsb3cgZG1lc2cgbG9n
Og0KPiA+ID4gIg0KPiA+ID4gW8KgwqAgNTAuMjQyNTY0XSBwY2kgMDAwMDowMzowMC4wOiBbZHJt
XSBHVDA6IFNjaGVkdWxlIGRpc2FibGUgZmFpbGVkDQo+ID4gPiB0byByZXNwb25kLCBndWNfaWQ9
MiBbwqDCoCA1MC4yNDI1NjhdIC0tLS0tLS0tLS0tLVsgY3V0IGhlcmUNCj4gPiA+IF0tLS0tLS0t
LS0tLS0gW8KgwqAgNTAuMjQyNTg0XSBwY2kgMDAwMDowMzowMC4wOiBbZHJtXSBBc3NlcnRpb24g
YHJldGANCj4gPiA+IGZhaWxlZCENCj4gPiA+IC4uLg0KPiA+ID4gW8KgwqAgNTAuMjQ0OTQyXSBw
Y2kgMDAwMDowMzowMC4wOiBbZHJtXSAqRVJST1IqIEdUMDogR1VDIElEIG1hbmFnZXINCj4gPiA+
IHVuY2xlYW4gKDEvNjU1MzUpIFvCoMKgIDUwLjI0NDk3MF0gcGNpIDAwMDA6MDM6MDAuMDogW2Ry
bV0gR1QwOg0KPiA+ID4gdG90YWwgNjU1MzUgW8KgwqAgNTAuMjQ1MDAyXSBwY2kgMDAwMDowMzow
MC4wOiBbZHJtXSBHVDA6wqDCoMKgwqAgdXNlZCAxIFsNCj4gPiA+IDUwLjI0NTAzMl0gcGNpIDAw
MDA6MDM6MDAuMDogW2RybV0gR1QwOsKgwqDCoMKgIHJhbmdlIDIuLjIgKDEpICINCj4gPiA+DQo+
ID4gPiBGaXhlczogOGFlOGEyZThkZDIxICgiZHJtL3hlOiBMb25nIHJ1bm5pbmcgam9iIHVwZGF0
ZSIpDQo+ID4gPiBDYzogTWF0dGhldyBCcm9zdCA8bWF0dGhldy5icm9zdEBpbnRlbC5jb20+DQo+
ID4gPiBTaWduZWQtb2ZmLWJ5OiBTaHVpY2hlbmcgTGluIDxzaHVpY2hlbmcubGluQGludGVsLmNv
bT4NCj4gPiA+IC0tLQ0KPiA+ID4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX3N1Ym1pdC5j
IHwgMTAgKysrKysrKysrLQ0KPiA+ID4gwqAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCsp
LCAxIGRlbGV0aW9uKC0pDQo+ID4gPg0KPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9ndWNfc3VibWl0LmMNCj4gPiA+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19z
dWJtaXQuYw0KPiA+ID4gaW5kZXggMGVmNjdkMzUyM2E3Li5kMmRmYmRjODI5MjAgMTAwNjQ0DQo+
ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX3N1Ym1pdC5jDQo+ID4gPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX3N1Ym1pdC5jDQo+ID4gPiBAQCAtNDcsNiArNDcs
OCBAQA0KPiA+ID4gwqAjaW5jbHVkZSAieGVfdWNfZncuaCINCj4gPiA+IMKgI2luY2x1ZGUgInhl
X3ZtLmgiDQo+ID4gPg0KPiA+ID4gK3N0YXRpYyB2b2lkIF9fZ3VjX2V4ZWNfcXVldWVfZGVzdHJv
eShzdHJ1Y3QgeGVfZ3VjICpndWMsIHN0cnVjdA0KPiA+ID4gK3hlX2V4ZWNfcXVldWUgKnEpOw0K
PiA+ID4gKw0KPiA+ID4gwqBzdGF0aWMgc3RydWN0IHhlX2d1YyAqDQo+ID4gPiDCoGV4ZWNfcXVl
dWVfdG9fZ3VjKHN0cnVjdCB4ZV9leGVjX3F1ZXVlICpxKcKgIHsgQEAgLTEwNjAsMTAgKzEwNjIs
MTUNCj4gPiA+IEBAIHN0YXRpYyB2b2lkIHhlX2d1Y19leGVjX3F1ZXVlX2xyX2NsZWFudXAoc3Ry
dWN0IHdvcmtfc3RydWN0ICp3KQ0KPiA+ID4gwqDCoMKgwqDCoMKgwqDCoCAqIHN0YXRlLg0KPiA+
ID4gwqDCoMKgwqDCoMKgwqDCoCAqLw0KPiA+ID4gwqDCoMKgwqDCoMKgwqDCoGlmICghd2VkZ2Vk
ICYmIGV4ZWNfcXVldWVfcmVnaXN0ZXJlZChxKSAmJg0KPiA+ID4gIWV4ZWNfcXVldWVfZGVzdHJv
eWVkKHEpKSB7DQo+ID4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc3RydWN0IHhl
X2d1YyAqZ3VjID0gZXhlY19xdWV1ZV90b19ndWMocSk7DQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoGludCByZXQ7DQo+ID4gPg0KPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqBzZXRfZXhlY19xdWV1ZV9iYW5uZWQocSk7DQo+ID4gPiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgLyogSWYgR3VDIGlzIG5vdCBydW5uaW5nLCBqdXN0IGRlc3Ry
b3kgdGhlIGV4ZWMNCj4gPiA+IHF1ZXVlIGFzIHdlDQo+ID4gPiBjYW4ndCBjb21tdW5pY2F0ZSB3
aXRoIGl0ICovDQo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWYgKCF4ZV91
Y19md19pc19ydW5uaW5nKCZndWMtPmZ3KSkgew0KPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBfX2d1Y19leGVjX3F1ZXVlX2Rlc3Ryb3koZ3VjLCBx
KTsNCj4gDQo+IEhleSBTaHVpY2hlbmcsDQo+IA0KPiBNYXR0IEIuIGhhZCBhbHNvIHBvaW50ZWQg
bWUgdG8geW91ciBzZXJpZXMgLSBJIGhhZCBtaXNzZWQgaXQgc29tZWhvdy4NCj4gSSdtIHNlZWlu
ZyBzb21ldGhpbmcgc2ltaWxhciBidXQgaW4gdGhlIHdlZGdlZCBwYXRoIGFuZCBoYXZlIGFuIGlk
ZWEgaW4gWzFdLg0KPiBMZXQgbWUgdGVzdCB5b3VyIGxhdGVzdCBjaGFuZ2VzIGhlcmUgYW5kIEkn
bGwgZ2V0IGJhY2sgaGVyZSAtIGhhcHB5IHRvIGdvIHdpdGgNCj4geW91ciBjaGFuZ2UgaWYgaXQn
cyB3b3JraW5nIChub3QgYSBmdWxsIHJldmlldyBoZXJlDQo+IHlldC4uKQ0KPiANCj4gVGhhbmtz
LA0KPiBTdHVhcnQNCj4gDQo+IFsxXSBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcv
c2VyaWVzLzE1NTM1Mi8NCg0KSGkgU3R1YXJ0LA0KVGhpcyBwYXRjaCBpcyBzcGVjaWZpY2FsbHkg
Zm9yIExSIGV4ZWMgcXVldWUuDQpBbmQgdGhlcmUgaXMgYW5vdGhlciBwYXRjaCBmb3Igbm9ybWFs
IGV4ZWMgcXVldWUgdGhhdCBpcyBhbHJlYWR5IG1lcmdlZDoNCmh0dHBzOi8vcGF0Y2h3b3JrLmZy
ZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTU1NDE3Lw0KDQpCZXN0IFJlZ2FyZHMNClNodWljaGVuZw0K
DQo+IA0KPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqBnb3RvIHNraXBfZGVyZWdpc3RlcjsNCj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqB9DQo+ID4gPiArDQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGRp
c2FibGVfc2NoZWR1bGluZ19kZXJlZ2lzdGVyKGd1YywgcSk7DQo+ID4gPg0KPiA+ID4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAvKg0KPiA+ID4gQEAgLTEwODgsNiArMTA5NSw3IEBA
IHN0YXRpYyB2b2lkDQo+ID4gPiB4ZV9ndWNfZXhlY19xdWV1ZV9scl9jbGVhbnVwKHN0cnVjdA0K
PiA+ID4gd29ya19zdHJ1Y3QgKncpDQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoH0NCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqB9DQo+ID4gPg0KPiA+ID4gK3NraXBfZGVyZWdp
c3RlcjoNCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqBpZiAoIWV4ZWNfcXVldWVfa2lsbGVkKHEpICYm
ICF4ZV9scmNfcmluZ19pc19pZGxlKHEtDQo+ID4gPiA+bHJjWzBdKSkNCj4gPiA+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgeGVfZGV2Y29yZWR1bXAocSwgTlVMTCwgIkxSIGpvYiBj
bGVhbnVwLCBndWNfaWQ9JWQiLA0KPiA+ID4gcS0NCj4gPiA+ID4gZ3VjLT5pZCk7DQo+ID4gPg0K
PiA+ID4gLS0NCj4gPiA+IDIuNDkuMA0KPiA+DQoNCg==
