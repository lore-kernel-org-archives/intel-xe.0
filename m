Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 205E4C55170
	for <intel-xe@archiver.kernel.org>; Fri, 20 Feb 2026 09:33:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D551510E056;
	Fri, 20 Feb 2026 09:33:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EMl2qO0o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B735010E056
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Feb 2026 09:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771580004; x=1803116004;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lHUIyrpvshW3oPkOnYcweonkHJWl7tVxAxmj+DV+CFI=;
 b=EMl2qO0oDFE5YAlPeP061IOjJ33UbHoPtOqX7IZs3Xo3AoTNYeUH4J3g
 CfAuMMtWkj11MfA6JNYfVJRtfjfpkqWzHEbgWoUzVffkAWWC/lj8MnyDl
 d2rgRAMJFUJ63cNkxpQh/x7zmlsBm1538CIdE0nmWCmGcpD+VmWg9o+CC
 8PMEVNK8yO10cU/fw0eEazq/7PajwbiH1xkHtpAutppKo8Jh9aj4NNejM
 u5JuazJQWV+QcNk5gi5GQtS1gbImAelDKhO2N5HApxhqDrCWeB7QRs844
 JcZ6GaqylJ2WdBA5Ao7pT4DUGmul60j6hac5EzS/S052tzwvGBoicbOK0 Q==;
X-CSE-ConnectionGUID: DmNOCGuDTTGdCpLsG/Hfqw==
X-CSE-MsgGUID: iRtQ26qyScqLddxdf3AX/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="76535216"
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; d="scan'208";a="76535216"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 01:33:23 -0800
X-CSE-ConnectionGUID: IxKVkOm1TLqTe2IqQ97ftw==
X-CSE-MsgGUID: taKgBsmrTAyuU5VNixHmqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; d="scan'208";a="218939106"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 01:33:24 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 20 Feb 2026 01:33:22 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 20 Feb 2026 01:33:22 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.5) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 20 Feb 2026 01:33:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UZyttjTE+bDPS2s92Ckp54TW7D1YHoMXcJ9FBuWUjUiW1TiqFcgU7u8o+W02AC66KIiGCUTtzqKhN0SqpuH/tW6OcCfRMqXwDKrGZygH9XRRlo5fn4vIuw2R6KJasZBRsXYCtImY2mdl4N/vlvNNeIqIWXJzvOBYWDVbWbbXmVS8EcQQT/SO10IlHISVKPcxDU7TDp9jPgXDqbMHciK8NDWjp62e6kkWDzw2msWc8H3yGFbA5b7Y5ufU8icxqSW41zxiZt2hJVh5Dcpqqvb4Q2N8U5ViNMwgvfFHG41tIUAD5w5syAsIuRPFKLV+RdXJdFpmaa1PtOH/m5Bb+0jDCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lHUIyrpvshW3oPkOnYcweonkHJWl7tVxAxmj+DV+CFI=;
 b=ApsSlZzxU50fa5sy8/Z7orj6cMSXso2gYOO7mh6fLfO8+81LX/DeUW/humQyUqyGWu03aPC7/AUazlR9SVCHJX/cUs2AbLbKrIaZ9m9jS0lJrcP3qpiepc0WWbx9o0JYdltrKteePJZaRFdj8HsWmNxzhCegpnaA4aF4pBLScbWXPoUq+n2LwZLLRCFL/j8aF+Jx19KTpk7S2XVsf/LRX7ycSj7Xj3gP6W8mKxygj7dQYbPopjnUTkwciOcpx7/o78UW2+M882FKdfmGoUAG6TeZw8yxpWXqwtlLmRJ8gHlwi2ez7T1hrrw5I3peZ9G7yPZ1A61mlf/sts8ffSCTuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by DS0PR11MB8133.namprd11.prod.outlook.com (2603:10b6:8:15b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Fri, 20 Feb
 2026 09:33:20 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::7c84:683c:21bf:e437]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::7c84:683c:21bf:e437%6]) with mapi id 15.20.9632.010; Fri, 20 Feb 2026
 09:33:19 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Auld, Matthew" <matthew.auld@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>
Subject: RE: [PATCH V2 3/4] drm/xe/xe3p_lpg: Enable L2 flush optimization
 feature
Thread-Topic: [PATCH V2 3/4] drm/xe/xe3p_lpg: Enable L2 flush optimization
 feature
Thread-Index: AQHcoZRGuM29R55TykmW5Go++wRFTLWKBLUAgAFPy/A=
Date: Fri, 20 Feb 2026 09:33:19 +0000
Message-ID: <SJ1PR11MB6204330B2E51A2F28FA775C58168A@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20260219113743.1588081-6-tejas.upadhyay@intel.com>
 <20260219113743.1588081-9-tejas.upadhyay@intel.com>
 <073a3aa0-e070-420a-a229-15e51a379a54@intel.com>
In-Reply-To: <073a3aa0-e070-420a-a229-15e51a379a54@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|DS0PR11MB8133:EE_
x-ms-office365-filtering-correlation-id: 7e84f7b5-3635-4302-b113-08de7063158a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|10070799003|1800799024|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?amJOWGRWR3dLSGtpME1Gd25EL0FEYWtnV1l1dTVXcUs0bnM1UjRKbUVRSGpu?=
 =?utf-8?B?NXYvMEZJVEg5eGlxaFlmSjZqMXM1amYwdDhGY1NxbHR0UldxZ3QrU1NrbTZT?=
 =?utf-8?B?d2VoeVpMZHRINGtJaEdpT0lqQ1I3bEllekVvN20wQ3B5Y29UY3RhU2lPY0Vj?=
 =?utf-8?B?b2RrYU9ZQnRWL0ZjQjM0R1laU1dzRHJYZ2w5QjJvMUI2TjYzNEpyWC9zTnpV?=
 =?utf-8?B?UFZzMWRQTkNpVXBRdXBVeGZSMWRPY1FMemU2KzQzdFk2dTFjVmlIeEpKWFpB?=
 =?utf-8?B?STI5dDl5N050NENsUnZ0cTBtczF2Z3Q5TVNTeUQyN09KZkpBc1FFNHluM2hO?=
 =?utf-8?B?MGd6VTdKdUJRTkx4WkZSOHk2T2ZTTExNL29YRGsvVzU2MVdEWGx2OUNJNFVy?=
 =?utf-8?B?UzhWYkpYVGVxOVN5OHR0Y3RTbnpuZUtMbHJsL3k2Q2MrYWc1N1Y4NFpMUjly?=
 =?utf-8?B?ZDF2SjNNVHhVNDZLeUQwbW9DeTlMd1JndkpuQTJWak00TmNnYy9lKzRBSjJT?=
 =?utf-8?B?bEJiaEhOdldPTk9hMVRRd0crSXB0TStTNUhBWVlyRjJDZnBZWStvNkU4Sksw?=
 =?utf-8?B?VEwraHlsOGRab1RBQVhYT1hveWIyUXRCaEIyMlZYT0hKL0oxVkhxaW5OTklX?=
 =?utf-8?B?MlQ0Qnc2bTlBd1FveC9kU3k1R3dmTnlJT1Fjc2QyOFcxcGRsdjBqMlBRTVFr?=
 =?utf-8?B?UFNDbVdBTWVmSXpSZkZRNzVySjZJYit3clU3MDlqaUd3Ty9Kclk4VkxvSEt2?=
 =?utf-8?B?MnJReU02cTQ3a282dUprTW93YTlFWnd6S3VtQnJrV2FhN2dYVlhJSDBIUDZ3?=
 =?utf-8?B?YWFHMHlFWmdhWmZvTkh2TW5LbzRWQlhzeXZoRWNRWE9LdGpneWxVd0ZVMGsr?=
 =?utf-8?B?Vy8zMjl1azdHK1lCVGpvanE4THlzMEFoQlZFQkwzNmt5eG5JMWlwK0VXRkZR?=
 =?utf-8?B?N3dIZmg0R2E4V0w5Q0c3ZkNxZHNxRWFXZjJKR3JtaHFxWGU1NzdZeXJiWHJw?=
 =?utf-8?B?ZGlUa2hsTzRDT3E1SXFFUElZOUxkYzNIWDNZK0k2NllCWDB0cnQzY2Zaakkx?=
 =?utf-8?B?R253dUdXZzlpNlpNUVEzYVhKY01DKzY5dWx4WWtpeFkrVXZ1bytSb1doY1A3?=
 =?utf-8?B?TmtSRUJGWFR3VU0zVTJJTFp2Q3ExYW9LTjR4dEdpVnNCMkx3UWlTTkJXYlhL?=
 =?utf-8?B?VjBGN0ZpaytFclBzZFMwUnM2UlpvWEVyN2FvMm9WM3ZrZXpJdFpzU0ZML0k2?=
 =?utf-8?B?NzFWWWszcFNHcTNTZ3JFekJoNHZMMUErbFNYOGlBTXQ0dnVtZ3U5dGI0THZq?=
 =?utf-8?B?azNuaVJ0QUdaL0d2ZTR0Njd1SUxuOW1vQW1HMllzL2xCQndLcHVsdFdYTW84?=
 =?utf-8?B?WGFBQ2tUVDUyNzJjZHNqS3FZTnlLZGJNUVNha3ZrRmU5dkRMYVdVNEt1UlZY?=
 =?utf-8?B?NG95cXJsL0NXejdmSUZpYUpUdmVUQ1F2Z1Nnbkx2a2NIOEJuVGZYVUpUa0Nx?=
 =?utf-8?B?Yy9KL3dhRlUvSmQ0OVF0bVVncW51V0tFTGFBYmsrRnN5eEhEL05NbE5jMW9Z?=
 =?utf-8?B?WXZocVdZK1VaaWtIdnc4TEFCUHhJL1IxTDFOelJXY0xnME5PaExaK3FCV1pv?=
 =?utf-8?B?QTFGeTA5UWkrUHVGNkU1Y3ZsK1l2czNiTjhsbHQ1N09BMElPU2F3T3VOdGF6?=
 =?utf-8?B?SUdaY09lNzRQZUh4a1puSGhCZU8ya2srdmQ2Nk9CSUdUZ0NyTnJwUlk4SlFy?=
 =?utf-8?B?ZHlOc0JrTXRjcjVlOXc5eDBnM2graG82cC9wL3VXelZySWFzRmhOL1Q1SHlr?=
 =?utf-8?B?RzZ5cW1IdUV4Z056bjQ5YmVreE9XT096VExpd1dRWWRRR3RxVHEvSmFUWkc1?=
 =?utf-8?B?N1JMQXAwVUtiQTc4eFJmdW1EK0Z5NW4xeStHQUZTSExUY3ZLNTFtS0loOFcz?=
 =?utf-8?B?ZXF3OVdIQ2xTdW9ISGg0TVVOWVZrTTBqQ3VKd2ZEcnREeUJtUS92ZUhHV2th?=
 =?utf-8?B?U05mLzVEbEY4R0w3dUxwWFRjcHN3a3VxKzI2d3FYQzhQV2dTZ1FXQTFhRDFn?=
 =?utf-8?B?TXNtaWdWOEYwc3RtdTYrTlhBSTdpS1RvMjRCMG9KOHFCV21PdE50cjJkbEhT?=
 =?utf-8?B?d2tZdzJJYmtBVUg1Wkw2VHdCc2hISy8rYTlIdUVDVVlOSkFFVjYwS2tkTUZB?=
 =?utf-8?Q?4ePAlDyJaMzVgJbPR65kEWU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(10070799003)(1800799024)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SnlYM1ZiRXBhbXZIMXg5NzdMcDU5R09ya3k0OXJSNDlpbE05cFpQTHlJMVlE?=
 =?utf-8?B?ZHhSZ2xUT2hBQ2luaXA2ZE5sSGVLWENJSVFsck9SdXU5VDU4b1Q3dytyUndk?=
 =?utf-8?B?K3dXNXFuQ0lRTWhhMFZpUlAxdUN4ZW5Qbkx1Y1NzQ3hQckdIVUtTdGYzd0Ra?=
 =?utf-8?B?NTNwOHo3Z3ZxQmpvZm9MdDVBcjI3K0UrdjdQSEVBMkludG84aHROU21tQ1Y0?=
 =?utf-8?B?UnZDenNIL1NJUWI1aWpTQVJxaVNUVXpWSURZaFNuSDBvRFBWY0daQjJvVU93?=
 =?utf-8?B?ZE9nZDU5WklqMHZ6TDhJNUVyemxiZFM5Y1pmVEJkSTlqbEQzZzlNVUc1QWUy?=
 =?utf-8?B?Rnc2b0JuMnk0ZjBKYU5YOFdkSVU3MW9GRjlaQlhEdlhJY2JjRWhRcE5STXNF?=
 =?utf-8?B?SkVwOU9YL1BPak9MeDE1eW5Bdmk5Q2RSMWs4RSthWFVxSks3ajB5UDZNWXZX?=
 =?utf-8?B?bG1EempDVG0razlOVUV1cWlQQnp2ZG5ibTQ4UDU1cnN0TUd5MGd6K0tJdTll?=
 =?utf-8?B?dWNCNHRSbG9hb0lzdi8wcXlKVEhFNmVHcDBNaWxxR2N5Tkk2bFFxSEt2SGVm?=
 =?utf-8?B?V2lKY1NNWlYyYU94QVhJVG1FYWk3azEwczRDZnB3aUc4R0h6eW0wNWR6dVp4?=
 =?utf-8?B?czUzamo4QmRTMGVZdnk2b29EdU1aMEhCZTJsVEx4bzZ2eUhSSUdwUHNsdjJp?=
 =?utf-8?B?MmRWSDlJWHB0aEhxNGdaWldQVndLYkVyMzlKZDhJMWhQM1J5clZOQlkyTEd1?=
 =?utf-8?B?WkJBcWpkVTVIZVFzaWZjT1Q2N0VJOEtoWCtQdCttVHRGYUlkdEdLRzQ3Qis1?=
 =?utf-8?B?TjgzYURGMjJBVG04anZNVXg2eHpLczVZMERWN2FZQ2xPNjN1MG42dnh6bVlJ?=
 =?utf-8?B?UmU5c1J4cHZsZUplRXptaGtjZTcvUU04U1FLcjhLcWl1S1RzeGhySUtUaHJV?=
 =?utf-8?B?SWJmUmcwbHZYMFk5TWtMZzNoYXpzSFZVdWpJdFllc0g0TU5SbUFCNHE2RTJ6?=
 =?utf-8?B?WS9YbTRJM2FoQXo4YXVGcGludlRFbUZhNU5tcTdiV25WNmtWbjJBSFVsMk5Q?=
 =?utf-8?B?NGlWUmVzZ0VZSDNhN2FkR0x4bGRTMERlWlFSYTAxY2J4dDRuVERpeXlNN3Zq?=
 =?utf-8?B?ak9CdVZ4eEZTL2d6Z2NIK1Z4Q2lLby95WStIZWt5WUp4Y2VwcEIwbzZMOUxR?=
 =?utf-8?B?cTZoYTkraWhUajVCY0tiNGFwQk9PdFV2T0t3dGJpYTdDWDd3dHVKdnRLRkFi?=
 =?utf-8?B?Tm55NzlsWnRIZ3U5R2hKaXpQMGlKd2kxTFl1dm51dk1LNlY2cnhOQUZQZmwr?=
 =?utf-8?B?Lys2S1FpakdxTzdLdi9YZUxLSzhIRHg0Nm5qY3lPejZ4aGJnRjcvd2xBQUVk?=
 =?utf-8?B?Uno4V1lJVTJaeW9YMVAwRWxUWkZsZytWTktNSUdMTjNXSVYxbjkvWWh1WGU4?=
 =?utf-8?B?Vjl1Nzlpdk1rMm1oVjIwZTIrREVvSFZHVVRQNEJrT3lxd2c5MlVWNlQ3ZUND?=
 =?utf-8?B?Mmk2KzdZTDFSL0UwdW5xb1JiYWhKSnJSV1RSWm5xOTNaWFJOUCtxeXVsdEJu?=
 =?utf-8?B?Y3NjRzJDQVNyejdnVWNUaEl3c0t5bFExWHpoVDA4MWZOZEZUK2s4Z0p3Unlp?=
 =?utf-8?B?NkJaMXNncjVGVXk1WUZlc0FPcmg1Q1d5eXVXSWNacFN5SUhpcnFLbVo1TGtS?=
 =?utf-8?B?SkxDdWQ4RUk0aktCOUZBazRrREE4dHhWczczZlpiSi9BRExBWFcwM09IUTJx?=
 =?utf-8?B?Y2ZJRHBCYkNyYlgzOXBWL0lhK2RTSklIbFNjVWZwY1MrMVB1WlJaZ0lGYXEy?=
 =?utf-8?B?b0sxcGZOdWhhelNKaGo1T1JFdGlCa3dpZUE0OEZITlNDNGg5NDlOWmFXVGp0?=
 =?utf-8?B?QXRwOG13NW9JTU5xckc0cUNEekJ0Y3JxTDQya2hNREd6VFFXbldGb2NFRXlq?=
 =?utf-8?B?dkZYVk1IQ3NTVlZvVU55MzBsVWlHU3lFSmR6R205U1pzZWVJL3dyRDk1bGU5?=
 =?utf-8?B?TVBUcGxod2VDUHppbUNkTGdzUjkwRUg1Z294Y29XcnB4ZHpuNmIyK0FIK0lM?=
 =?utf-8?B?MFJvQ0JnaFRjd290M29aQ0RkSS9mN2htWVByWDBTQTFPLzZwMi9Ya3hhM3ly?=
 =?utf-8?B?MmR0ekhtdnRHM09JNzdWQTVtRTlaVGlPelFwVU9ScGhGdVFFVVg2VlBPNTZG?=
 =?utf-8?B?TzlRMlNNT0FXVXJib2hiWTlWcWJ5aDNnS1pQbTBCdlFGSEFKU2NoTHdsbkFT?=
 =?utf-8?B?S1F2RTkzZ2U3WEhld3ltRlFKSlFwVlNpbUVVL1M1akNaN1QwNHdDdWZVYlRh?=
 =?utf-8?B?bzh4cVE1aHF5S050YTdQTTBPV0c4SjdpYy9XYkliSFY1d2xuRVVFUk55QU1E?=
 =?utf-8?Q?s6N8U+VZ4tD+qNLrE5dyxjwH3yQ0vy2vJlimqrOQVtG4u?=
x-ms-exchange-antispam-messagedata-1: rZymCSUMGiM4Gg==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e84f7b5-3635-4302-b113-08de7063158a
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2026 09:33:19.8607 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 62ETHs4QboCTGFJTgoRA9QA6iTFkRvlzc2xsgTB3RxQ9bYBI/q2T+S0rBGRkFoB9WSw99MBWfAm9omSrPHTs2cSJD6od/Vdz7C8wcta8Gi4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8133
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQXVsZCwgTWF0dGhldyA8
bWF0dGhldy5hdWxkQGludGVsLmNvbT4NCj4gU2VudDogMTkgRmVicnVhcnkgMjAyNiAxOTowMQ0K
PiBUbzogVXBhZGh5YXksIFRlamFzIDx0ZWphcy51cGFkaHlheUBpbnRlbC5jb20+OyBpbnRlbC0N
Cj4geGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiB0aG9tYXMuaGVsbHN0cm9tQGxpbnV4
LmludGVsLmNvbQ0KPiBTdWJqZWN0OiBSZTogW1BBVENIIFYyIDMvNF0gZHJtL3hlL3hlM3BfbHBn
OiBFbmFibGUgTDIgZmx1c2ggb3B0aW1pemF0aW9uDQo+IGZlYXR1cmUNCj4gDQo+IE9uIDE5LzAy
LzIwMjYgMTE6MzcsIFRlamFzIFVwYWRoeWF5IHdyb3RlOg0KPiA+IFdoZW4gc2V0LCB0aGUgTDIg
Zmx1c2ggb3B0aW1pemF0aW9uIGZlYXR1cmUgd2lsbCBjb250cm9sIHdoZXRoZXIgTDIgaXMNCj4g
PiBpbiBQZXJzaXN0ZW50IG9yIFRyYW5zaWVudCBtb2RlIHRocm91Z2ggbW9uaXRvcmluZyBvZiBt
ZWRpYSBhY3Rpdml0eS4NCj4gPg0KPiA+IFRvIGVuYWJsZSBMMiBmbHVzaCBvcHRpbWl6YXRpb24g
aW5jbHVkZSBuZXcgZmVhdHVyZSBmbGFnDQo+ID4gR1VDX0NUTF9FTkFCTEVfTDJGTFVTSF9PUFQg
Zm9yIE5vdmFsYWtlIHBsYXRmb3JtcyB3aGVuIG1lZGlhIHR5cGUgaXMNCj4gPiBkZXRlY3RlZC4N
Cj4gPg0KPiA+IEFsc28sIHJlc3RyaWN0IHVzZXJwdHIsIHN2bSBhbmQgZG1hYnVmIG1hcHBpbmdz
IHRvIGJlIGVpdGhlciAyV0FZIG9yDQo+ID4gWEErMVdBWQ0KPiA+DQo+ID4gU2lnbmVkLW9mZi1i
eTogVGVqYXMgVXBhZGh5YXkgPHRlamFzLnVwYWRoeWF5QGludGVsLmNvbT4NCj4gPiAtLS0NCj4g
PiAgIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWMuYyAgICAgICAgfCAzICsrKw0KPiA+ICAgZHJp
dmVycy9ncHUvZHJtL3hlL3hlX2d1Y19md2lmLmggICB8IDEgKw0KPiA+ICAgZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX3ZtLmMgICAgICAgICB8IDcgKysrKysrKw0KPiA+ICAgZHJpdmVycy9ncHUvZHJt
L3hlL3hlX3ZtX21hZHZpc2UuYyB8IDQgKysrKw0KPiA+ICAgNCBmaWxlcyBjaGFuZ2VkLCAxNSBp
bnNlcnRpb25zKCspDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hl
X2d1Yy5jIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Yy5jDQo+ID4gaW5kZXggY2JiYjRkNjY1
YjhmLi45N2MzM2MzZGQ1MjAgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hl
X2d1Yy5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Yy5jDQo+ID4gQEAgLTk4
LDYgKzk4LDkgQEAgc3RhdGljIHUzMiBndWNfY3RsX2ZlYXR1cmVfZmxhZ3Moc3RydWN0IHhlX2d1
YyAqZ3VjKQ0KPiA+ICAgCWlmICh4ZV9ndWNfdXNpbmdfbWFpbl9nYW1jdHJsX3F1ZXVlcyhndWMp
KQ0KPiA+ICAgCQlmbGFncyB8PSBHVUNfQ1RMX01BSU5fR0FNQ1RSTF9RVUVVRVM7DQo+ID4NCj4g
PiArCWlmIChHUkFQSElDU19WRVIoeGUpID49IDM1ICYmICFJU19ER0ZYKHhlKSAmJg0KPiB4ZV9n
dF9pc19tZWRpYV90eXBlKGd1Y190b19ndChndWMpKSkNCj4gPiArCQlmbGFncyB8PSBHVUNfQ1RM
X0VOQUJMRV9MMkZMVVNIX09QVDsNCj4gPiArDQo+ID4gICAJcmV0dXJuIGZsYWdzOw0KPiA+ICAg
fQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfZndpZi5o
DQo+ID4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX2Z3aWYuaA0KPiA+IGluZGV4IGEzM2Vh
Mjg4YjkwNy4uMzlmZjdiM2U5NjBiIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94
ZS94ZV9ndWNfZndpZi5oDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19md2lm
LmgNCj4gPiBAQCAtNjcsNiArNjcsNyBAQCBzdHJ1Y3QgZ3VjX3VwZGF0ZV9leGVjX3F1ZXVlX3Bv
bGljeSB7DQo+ID4gICAjZGVmaW5lICAgR1VDX0NUTF9FTkFCTEVfUFNNSV9MT0dHSU5HCUJJVCg3
KQ0KPiA+ICAgI2RlZmluZSAgIEdVQ19DVExfTUFJTl9HQU1DVFJMX1FVRVVFUwlCSVQoOSkNCj4g
PiAgICNkZWZpbmUgICBHVUNfQ1RMX0RJU0FCTEVfU0NIRURVTEVSCUJJVCgxNCkNCj4gPiArI2Rl
ZmluZSAgIEdVQ19DVExfRU5BQkxFX0wyRkxVU0hfT1BUCUJJVCgxNSkNCj4gPg0KPiA+ICAgI2Rl
ZmluZSBHVUNfQ1RMX0RFQlVHCQkJMw0KPiA+ICAgI2RlZmluZSAgIEdVQ19MT0dfVkVSQk9TSVRZ
CQlSRUdfR0VOTUFTSygxLCAwKQ0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfdm0uYyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV92bS5jDQo+ID4gaW5kZXggYzA2ZmQyNTBl
MDM3Li4wOTE4MjVhMzQxMzggMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hl
X3ZtLmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfdm0uYw0KPiA+IEBAIC0zNDc0
LDYgKzM0NzQsMTMgQEAgc3RhdGljIGludCB2bV9iaW5kX2lvY3RsX2NoZWNrX2FyZ3Moc3RydWN0
DQo+IHhlX2RldmljZSAqeGUsIHN0cnVjdCB4ZV92bSAqdm0sDQo+ID4gICAJCQkJIG9wID09DQo+
IERSTV9YRV9WTV9CSU5EX09QX01BUF9VU0VSUFRSKSB8fA0KPiA+ICAgCQkgICAgWEVfSU9DVExf
REJHKHhlLCBjb2hfbW9kZSA9PSBYRV9DT0hfTk9ORSAmJg0KPiA+ICAgCQkJCSBvcCA9PQ0KPiBE
Uk1fWEVfVk1fQklORF9PUF9NQVBfVVNFUlBUUikgfHwNCj4gPiArCQkgICAgWEVfSU9DVExfREJH
KHhlLCB4ZV9kZXZpY2VfaXNfbDJfZmx1c2hfb3B0aW1pemVkKHhlKSAmJg0KPiA+ICsJCQkJIChv
cCA9PQ0KPiBEUk1fWEVfVk1fQklORF9PUF9NQVBfVVNFUlBUUiB8fA0KPiA+ICsJCQkJICAvKiBk
bWFidWYgKi8NCj4gPiArCQkJCSAgb3AgPT0gRFJNX1hFX1ZNX0JJTkRfT1BfTUFQIHx8DQo+IA0K
PiBUaGlzIGlzIG5vdCByZWFsbHkgZG1hLWJ1ZiwgYnV0IHJhdGhlciBhbGwgQk9zLiBZb3UgbGlr
ZWx5IG5lZWQgdG8gYWRkIHNvbWV0aGluZw0KPiBpbiB4ZV92bV9iaW5kX2lvY3RsX3ZhbGlkYXRl
X2JvKCksIGNoZWNraW5nIGZvciBkbWEtYnVmLiBTZWUgdGhlIGNvaCBjaGVja3MsDQo+IGZvciBl
eGFtcGxlLg0KDQpTdXJlIGdvdCBpdC4NCg0KPiANCj4gPiArCQkJCSAgLyogc3ZtICovDQo+ID4g
KwkJCQkgIG9wID09IChEUk1fWEVfVk1fQklORF9PUF9NQVAgJiYNCj4gaXNfY3B1X2FkZHJfbWly
cm9yKSkgJiYNCj4gPiArCQkJCSAocGF0X2luZGV4ICE9IDE5IHx8IGNvaF9tb2RlICE9DQo+IFhF
X0NPSF8yV0FZKSkgfHwNCj4gPiAgIAkJICAgIFhFX0lPQ1RMX0RCRyh4ZSwgY29tcF9lbiAmJg0K
PiA+ICAgCQkJCSBvcCA9PQ0KPiBEUk1fWEVfVk1fQklORF9PUF9NQVBfVVNFUlBUUikgfHwNCj4g
PiAgIAkJICAgIFhFX0lPQ1RMX0RCRyh4ZSwgb3AgPT0NCj4gRFJNX1hFX1ZNX0JJTkRfT1BfTUFQ
X1VTRVJQVFIgJiYgZGlmZg0KPiA+IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZtX21h
ZHZpc2UuYw0KPiA+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZtX21hZHZpc2UuYw0KPiA+IGlu
ZGV4IDFhMWFkOGMwN2Q0OS4uZTY4ZWU1YjA5MmQ2IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV92bV9tYWR2aXNlLmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfdm1fbWFkdmlzZS5jDQo+ID4gQEAgLTMwNCw2ICszMDQsMTAgQEAgc3RhdGljIGJvb2wgbWFk
dmlzZV9hcmdzX2FyZV9zYW5lKHN0cnVjdA0KPiB4ZV9kZXZpY2UgKnhlLCBjb25zdCBzdHJ1Y3Qg
ZHJtX3hlX21hZHYNCj4gPiAgIAkJaWYgKFhFX1dBUk5fT04oY29oX21vZGUgPiBYRV9DT0hfMldB
WSkpDQo+ID4gICAJCQlyZXR1cm4gZmFsc2U7DQo+ID4NCj4gPiArCQlpZiAoWEVfSU9DVExfREJH
KHhlLCB4ZV9kZXZpY2VfaXNfbDJfZmx1c2hfb3B0aW1pemVkKHhlKSAmJg0KPiA+ICsJCQkJIChw
YXRfaW5kZXggIT0gMTkgfHwgY29oX21vZGUgIT0NCj4gWEVfQ09IXzJXQVkpKSkNCj4gDQo+IEkg
dGhpbmsgeW91IG5lZWQgdG8gbWFrZSB0aGlzIGNvbmRpdGlvbmFsIG9uIHdoYXQgdGhlIHZtYShz
KSBhcmUgbWFwcGluZz8gU28NCj4gZG1hLWJ1ZiwgdXNlcnB0ciwgc3ZtIGFuZCBub3JtYWwgQk9z
Pw0KDQpZZWFoIGxldCBtZSBhZGQgdGhhdCB2YWxpZGF0aW9uLg0KDQpUZWphcw0KPiANCj4gPiAr
CQkJcmV0dXJuIGZhbHNlOw0KPiA+ICsNCj4gPiAgIAkJaWYgKFhFX0lPQ1RMX0RCRyh4ZSwgYXJn
cy0+cGF0X2luZGV4LnBhZCkpDQo+ID4gICAJCQlyZXR1cm4gZmFsc2U7DQo+ID4NCg0K
