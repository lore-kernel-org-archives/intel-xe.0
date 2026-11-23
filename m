Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FD22606A321
	for <intel-xe@archiver.kernel.org>; Mon, 23 Nov 2026 07:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dCiO0yC6;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=bGdv0eWM
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4118110E548;
	Mon, 23 Nov 2026 07:01:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA85A10E548
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Nov 2026 07:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795417254; x=1826953254;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=gakpZ2MOoHPYNEyeA0rQLCVQTTTnFyF6D7MX1eQ7H+8=;
 b=dCiO0yC6X2NKAB2Pfc4lTu6P+cAY4GDEXQteFr8aTLsTJklh55Lm+9nM
 qMNLrsEsQXtn0eb4KfstsPerWCd0nqdoqM0oiAJLLVpmpPANkOMqgi/zL
 KhMB8imWw5aLvlFzFS502e2Ou+86zeMerOp8svKdrArLbsiftoVVaJGrY
 zEfaiBwOwhvU4BUA2Ciw56QFs4cTT3Vx6WKbH0GoQI5gNLx2IaAZiT1Y1
 KsKP6D06TMiYffPDG2zVrGhBDlxy+auIl5rpZV5uhKZnl74M/7AGxtthV
 z3oZagSIbHPALL3tSWPHXy76Rfw+kEpySppJineCrQ8jjJlJjUHqf8tZy Q==;
X-CSE-ConnectionGUID: N0P08WLzQGqGzhGRPDZ53w==
X-CSE-MsgGUID: 89d9dqPUQbWI1jEswX9xDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4124287"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4124287"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2026 23:00:52 -0800
X-CSE-ConnectionGUID: hC4y3tm3SfO1Ch1HU0d/cw==
X-CSE-MsgGUID: 5J5oaSGXRhePGlmdVc4K4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; d="scan'208";a="11428061"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2026 23:00:53 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Sun, 22 Nov 2026 23:00:52 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Sun, 22 Nov 2026 23:00:52 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.65)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sun, 22 Nov 2026 23:00:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kklPw7GkcosbChnBYa1Bud559C7BrxtEOQQIB4V5DMAeCx3DSlYi6DC9tDnYiVJSCs/N7UkkJVUnSkiBZljibOKuyy+mCdOxynJtTp9Wwu4HRGJLJIxckcvQXj+NQ+VEdr+09i/Rd4g7G1yATtHcm4M/YomnksJySUrc0MfArrrHx3Tgb4vIwVZf4MCGg7BbtH8Wlvycb1dBnqqDbKPi7T7fxL6Ms9ERODuFWGbNGgFf3IWtjTfm3DOxpDd5mud1yeZ2A+d65XDLVgquUCKSNXelYz7OVjSWs3ZTIhw3UXTk0xN3tdRKexqGoN4WdMP6qTHn8wXSiLXWwoDyxSmJGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l+2G3MW9US9CDXrq1VbrS+l5uXJsEiFhoikaftPHtyo=;
 b=MhCLIvVfxax3VUS9o+9d0hFrOVnMwgZ4Ame593CAqFT0rgiRshs5KZK0+pjheARTRcDT6LQBrZWRaCq39Jk3RLEQOwkMWzChONvw3pTwYCj/f4+pIrpUqmbNqwnnb1Fp3E6746kT4N/TzQRNE973ljyIhZ9vIEfXNkNe/QHyg2Y0LUGwlboRDqkn/FkylDMDZQiyd+JUVQR3gkTt7JI75KYJOhndr0wAhOjJOWGk4TRvlk06XEwuQtj5bTOEjokoAHppWYp/OAcGVKDjPRc6uguVKznVYBHDtBzaXpcDykf6CY47BmA+OTlQtRbhf7RNQGwPI0LMObTdgHuauDBclQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l+2G3MW9US9CDXrq1VbrS+l5uXJsEiFhoikaftPHtyo=;
 b=bGdv0eWMwMTv3wy1PMJrJoqcVz5NcMmI/KGiWEk9pzaYMf8hHL/s6xFNH6FkDTOqeAXtc8dIz7BPoIEfVhEWTmMynh8N5FvzdngMjh62TmgPp299GAr3tYhKxAo1nw42OqR26uTOJ2jY5zvDvYIVRniPKwQJrxQuIwBhNa43I8Q=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 DSWPR11MB9930.namprd11.prod.outlook.com (2603:10b6:8:3a0::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.12; Mon, 23 Nov 2026 07:00:44 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 07:00:44 +0000
Message-ID: <b2d3e243-2c3e-4e43-9b6c-54451297f655@intel.com>
Date: Mon, 23 Nov 2026 12:30:37 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] drm/xe/drm_ras: Protect against unplugged or
 wedged device
To: Raag Jadav <raag.jadav@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <stuart.summers@intel.com>
References: <20261119102344.2053821-1-raag.jadav@intel.com>
 <20261119102344.2053821-2-raag.jadav@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <20261119102344.2053821-2-raag.jadav@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0115.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a7::9) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|DSWPR11MB9930:EE_
X-MS-Office365-Filtering-Correlation-Id: 845b800a-1f18-4b50-e34e-08df492f7e66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|6133799003|22082099003|18002099003|11063799006|261022113327099003|261022105027099003|4143699003|261028144727099003|10067099003|261026121527099003|261021123027099003|261009223027099003|261021121427099003|56012099006|261022075727099003|261102123227099003|261026140227099003;
X-Microsoft-Antispam-Message-Info: +lSszf9W5GB5/d3C18v3GhNLtuDB1nI8Pz03XHUGdlrmc4rSBqj96ynxYrfwGaacuRYQ9f5ZnA7xcm0C2k3Z8etp3+MXOhlDK2akS5VbQqaoT0JwnBK8scMDGzRQvkGkfduHWy/AjICgUAgknZRDSk9X8eeJMQaF7NlFmob7GRNVWyQO3PCi40PEFD/VrADjzsnAD2HzSg7TSLWDj+YV3iFggbRLxrnob8IcmQEROkwgsqWxM35lokYUvHpOaI3h/+oSk79CI4m5iiVhACrUk++xTfiouzc9cRVyWfe7rTISSTXvKUcTmW0RkUnTCk0vypu/O9+d1FnUP6jmYbsY32HxLmsv+rDztfj/R3M1x5hVszoQzTZlNeFQGOw9hN8se3LiL8s3JHZK6/MjGKQ/bFt7OsXcF1kmvp44YYdxb0w/e1Yl4xCTBo+cTM9aPWr0oEZ7yrfcrOkrNJ9AZC3g+LMQY80HP9bHOkRdvY4cKGC+iRncoqmHqIyCSWRNGQAB2eTvTLWTiCrHDuVgxyuTK5cKafbzQuBszV+VYG2WStgJI9KEyEfeztsu1pqHpERcI2FGsxEytcnilJmb1Qg+Om40QQmqVeCTLNtZaJp133BONpZrk+va9f/3eU6+eFVUzcUhX0Wf7lA6YSk1cmkPhEdIBG3p1QEmWIZFkyXmda8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(6133799003)(22082099003)(18002099003)(11063799006)(261022113327099003)(261022105027099003)(4143699003)(261028144727099003)(10067099003)(261026121527099003)(261021123027099003)(261009223027099003)(261021121427099003)(56012099006)(261022075727099003)(261102123227099003)(261026140227099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZGlOTHgydm1LYW5uWUM4ZjBSU3hTbUtZTURueW5YL3VsbG44ZDhlcmdYaVpV?=
 =?utf-8?B?Z1VIR3NBTTFHYmVKazN6dXdFUHFGb2FsMHVsRjRUWUdwMHh5aWhvTW15YWhV?=
 =?utf-8?B?RysvNHUzbVpDUDZoWVdZbWN3K25wNnQxb3B6cUtIOVBNSkRGRnJMNnhhTVZQ?=
 =?utf-8?B?dzdUSmhBMWVXUTQrY1pxYVM3NTFZam5VOE1CZ21yWHFPeHM5OTd5VEZqY2Qv?=
 =?utf-8?B?MHoybFovNWV6S1Rmb0hLNHhFVWVLV05kdWlzL2JFMlA1c011MnlCckh3S3Yr?=
 =?utf-8?B?UldQRVBYb3dld3BtcDlIUWhZWG8vQ2R3elR5TW16Z2NYYnp5VjJOR1ZPczZN?=
 =?utf-8?B?STZCaTE5S3B6MWZMZkxiTlpTZnBkQVYrNkdoQ2VYYWpoQjVYcTJzS3JLbXcw?=
 =?utf-8?B?WlBEVi8wa0dvdjJSQkEzMXF5dnYxYTJodVJBaU56bThKZ05qSENsY3krR1kz?=
 =?utf-8?B?ODFhTU1ZK090dUl0b3BOc1o0MVRBdjdROTAvd3N6SVlEY3FUNDBTT1dqMzhj?=
 =?utf-8?B?cWdMZlNZQjFtZ3RVNXBqeHVORVU4enFqMS9ZU3Y2WE9UMW1xNDRoSkQ2eC9s?=
 =?utf-8?B?aTNLamI1QllrQW5WV0hZL2hqbkFnbDVNVitzd3lDZmlaOVJjLzRmVUtCZklD?=
 =?utf-8?B?YVhZS2t3OHNUcVFxbW9QTjh5aEl4VmhXS3RnbDU0a0orT01CVXZDclR2cThp?=
 =?utf-8?B?eTNabGNSSFM0ODdlVlUyV2pSWExSaGpESlNHbktxNTAwM05oN3pyMUpsMHMy?=
 =?utf-8?B?SG1WODJGazhGSS9uUW1uTjVZbzRHczFiekZpZG9paEJUdHBRNFFhZ1FydWZj?=
 =?utf-8?B?c0ozbFZTZXpZSzVRUWlVbUtvYnBHQ1F5WHEzb0ZHV01laFBLL2IrTThNYzd3?=
 =?utf-8?B?VHFidVVybWFSQkdHN0xnY0w0ZWlhbW5iV0NXbGF1WlZrdDFFdkdnMTRNdzJz?=
 =?utf-8?B?S3cwaXZZZGdzR3lIZy9LNWdPSEJmZHR2WXBSbXhRbGRFK2tOU1RnMXB2eFpQ?=
 =?utf-8?B?d3JUKzJUazR1SjVlUlFIbU54azNsbzF4R0dKVE8vZG56YThURXo0OHNVZ3ZT?=
 =?utf-8?B?eVkzTkxvakpqcHVwa2VyVXBYTWRPeDlTZ3RXTHo3N3JIbnpmUFVYOWY0NkJ0?=
 =?utf-8?B?V05DUW11aUhOaDV4WmRaKyt6OXVoWlJ6VDVWWFdQbi9CZlBwd3AzeGFZSytp?=
 =?utf-8?B?a1VoVXowTlF0WDdCNHNvdVJWZGNheWhJV1RzdkdEQnF2cW5xQlpyRDBpRGM3?=
 =?utf-8?B?YVIxL3ByOUVIWVFYRm1yZUhiV3d5eElXa3hJdWpqOGczSXlxSTlmTFEycitm?=
 =?utf-8?B?V2VaaWJjandVTVBZUElkdUlYOWw4cW8xN29hb3VpYnp3SmJobzZocktuTnRC?=
 =?utf-8?B?NGd4N1A2WVl6dy9aRnl3dGdFKzJtNXRXYWNUSFNHdzh4MTQ1YUlGU2NZQWhK?=
 =?utf-8?B?WFNZZlRIMzlObEVjaTBTdTRraXBXaEYvK1c0aExpcUt0emhOSDBGWk16Q0ZJ?=
 =?utf-8?B?alFSSnA2ZWpNa2lueHZiZjNtcjJXTnp3RVlSUm93YkdTN0FxZ2l1UEY3TWhv?=
 =?utf-8?B?ekl5QWZvNW01cFBvdmZkQVc2OThvcThlYnZrVWhWSkt0KzdGdVhYejA0VEZC?=
 =?utf-8?B?NTdmYjJkakhzeFpLeWFOVEQ1bGtad3pyQVZDR1d6Y0phUWVha2tid3BhM3Mz?=
 =?utf-8?B?emR2RVJWOTg4bVBoa0FoeFhyNGNNbmllMXdNRzQwOE1hTmVwS3JhcHFTTnp6?=
 =?utf-8?B?TWlnSDhneTJsMGJBemtBMXRoV3FDTCszVzZDRGRoVHdzODJqUE5vSWQwd2RO?=
 =?utf-8?B?Yi83Qk42RFNDWGlmYTdkOVF2bnlzOXVHM2pPMnRYSTlOMDBHMEpmWVRGTDJt?=
 =?utf-8?B?VUhYZ1dMRGN2VmlLYVJSaHJlOGJUbU04YUFkN1hvN1o5RVJRd1NPUDdrR3dL?=
 =?utf-8?B?elM4dGdMUnVveUVtd3UvRGREOWJCam5uT1FEU2JsN2VnMjZJeGpySXN3akhJ?=
 =?utf-8?B?UXh2MDc4RmZ6aUVCSXFreUpMaHNsSWcwRFUzcG5McVpoT3ZENU9sTHFrK0ky?=
 =?utf-8?B?djlpTVZZeGlhc3h5aS9BcWFnaUIxNnZHWjhNM0s5RnJuNnlDZmQxVjNGNS9E?=
 =?utf-8?B?UTBDYnBXcVBweFI2dk5FVXNuSzBsbTVjRjBhc05EaXJQQm5XTTJ4VDVuNFEw?=
 =?utf-8?B?Z2ZCeXN5TlNxcGV5TXpDU1JLV3BrT2YydFdsbGNHdXRIdmlMYVJqb2tqck1W?=
 =?utf-8?B?ZU1sckNrUWhPeDFMTmsyWHFmTXFEcm5ZMkE3S0NwR0ZhTGY5cjVYZTFSR1d4?=
 =?utf-8?B?R3FLbTBTcWZ0alU1OU5Fa3k2QW85Mk01RTJFTXR2K0FPNldyTmVudz09?=
X-Exchange-RoutingPolicyChecked: UQUvoxGlFv6krGa1T14VpgDlvr/l1dRGFQXxza2qeM9v2WwKVNMYgCAdMTtdMk10KD2wTOHI0TqCbQjBJnx0YEyVCYX5b/n4NrCOD6Nk/h+k+NHT087ar/jyS/g5SI3gXh4HFIz7vUDll4J4vmuWg6supEBiSK03xfgQoz55bnraVizBSU1RRgpNHjCf6Fis5pnCeCYPa9WRTz8lK/TAJeYvfDFhKuJAsw7A5/E2pbOeGXT7lnEsDwJA5ywnegxjlcNp1klWhMEjA+ULO7M9x+IRNrmnRNtww4ofYAfmLZqfrhPCiQ1tjo4i0BzSUdjJexXgOQL/8n4V75bm564Qkw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 845b800a-1f18-4b50-e34e-08df492f7e66
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 07:00:44.4313 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wFdYDMbNKnftYSHs18rf8SVmsbbtGWboWw5ik4BzNVrYk2IK3hDAxihEjAag3B5kctgmm06Y9W1EFciyrnrydg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSWPR11MB9930
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
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 19-11-2026 15:52, Raag Jadav wrote:
> Xe driver exposes drm_ras counters to userspace through netlink interface,
> which the user can access during the device lifetime. But this should not
> be done in case of unplugged or wedged device. Protect against such cases.
>
> Fixes: b40db12b542f ("drm/xe/xe_drm_ras: Add support for XE DRM RAS")
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> Reviewed-by: Stuart Summers <stuart.summers@intel.com>
Reviewed-by: Riana Tauro <riana.tauro@intel.com>
> ---
> v2: Allow counter access with XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET (Riana)
> ---
>   drivers/gpu/drm/xe/xe_drm_ras.c | 93 ++++++++++++++++++++++++---------
>   1 file changed, 69 insertions(+), 24 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_drm_ras.c b/drivers/gpu/drm/xe/xe_drm_ras.c
> index 7554803aae11..3ca6c82345dd 100644
> --- a/drivers/gpu/drm/xe/xe_drm_ras.c
> +++ b/drivers/gpu/drm/xe/xe_drm_ras.c
> @@ -5,6 +5,7 @@
>   
>   #include <linux/bitmap.h>
>   
> +#include <drm/drm_drv.h>
>   #include <drm/drm_managed.h>
>   #include <drm/drm_print.h>
>   #include <drm/drm_ras.h>
> @@ -12,10 +13,33 @@
>   #include "xe_device_types.h"
>   #include "xe_drm_ras.h"
>   #include "xe_ras.h"
> +#include "xe_wedge.h"
>   
>   static const char * const error_components[] = DRM_XE_RAS_ERROR_COMPONENT_NAMES;
>   static const char * const error_severity[] = DRM_XE_RAS_ERROR_SEVERITY_NAMES;
>   
> +static int drm_ras_counter_get(struct xe_device *xe, struct xe_drm_ras_counter *info,
> +			       u32 error_id, int *idx)
> +{
> +	if (xe_wedged(xe) && xe->wedged.mode != XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET)
> +		return -ECANCELED;
> +
> +	if (!info || !info[error_id].name)
> +		return -ENOENT;
> +
> +	/* Must be last */
> +	if (!drm_dev_enter(&xe->drm, idx))
> +		return -ENODEV;
> +
> +	return 0;
> +}
> +
> +static void drm_ras_counter_put(int idx)
> +{
> +	/* Pair with drm_ras_counter_get() */
> +	drm_dev_exit(idx);
> +}
> +
>   static bool drm_ras_counter_is_valid(u32 severity, u32 component)
>   {
>   	if (!in_range(severity, DRM_XE_RAS_ERR_SEV_CORRECTABLE, DRM_XE_RAS_ERR_SEV_MAX))
> @@ -33,19 +57,23 @@ static int query_error_counter(struct xe_device *xe,
>   {
>   	struct xe_drm_ras *ras = &xe->ras.nl_data;
>   	struct xe_drm_ras_counter *info = ras->info[severity];
> +	int idx, ret;
>   
> -	if (!info || !info[error_id].name)
> -		return -ENOENT;
> -
> -	*name = info[error_id].name;
> +	ret = drm_ras_counter_get(xe, info, error_id, &idx);
> +	if (ret)
> +		return ret;
>   
>   	/* Fetch counter from system controller if supported */
>   	if (xe->info.has_sysctrl)
> -		return xe_ras_get_counter(xe, severity, error_id, val);
> +		ret = xe_ras_get_counter(xe, severity, error_id, val);
> +	else
> +		*val = atomic_read(&info[error_id].counter);
>   
> -	*val = atomic_read(&info[error_id].counter);
> +	if (!ret)
> +		*name = info[error_id].name;
>   
> -	return 0;
> +	drm_ras_counter_put(idx);
> +	return ret;
>   }
>   
>   static int clear_error_counter(struct xe_device *xe,
> @@ -54,17 +82,20 @@ static int clear_error_counter(struct xe_device *xe,
>   {
>   	struct xe_drm_ras *ras = &xe->ras.nl_data;
>   	struct xe_drm_ras_counter *info = ras->info[severity];
> +	int idx, ret;
>   
> -	if (!info || !info[error_id].name)
> -		return -ENOENT;
> +	ret = drm_ras_counter_get(xe, info, error_id, &idx);
> +	if (ret)
> +		return ret;
>   
>   	/* Clear counter from system controller if supported */
>   	if (xe->info.has_sysctrl)
> -		return xe_ras_clear_counter(xe, severity, error_id);
> +		ret = xe_ras_clear_counter(xe, severity, error_id);
> +	else
> +		atomic_set(&info[error_id].counter, 0);
>   
> -	atomic_set(&info[error_id].counter, 0);
> -
> -	return 0;
> +	drm_ras_counter_put(idx);
> +	return ret;
>   }
>   
>   static int query_uncorrectable_error_counter(struct drm_ras_node *ep, u32 error_id,
> @@ -103,15 +134,21 @@ static int query_correctable_error_threshold(struct drm_ras_node *ep, u32 error_
>   	struct xe_device *xe = ep->priv;
>   	struct xe_drm_ras *ras = &xe->ras.nl_data;
>   	struct xe_drm_ras_counter *info = ras->info[DRM_XE_RAS_ERR_SEV_CORRECTABLE];
> -
> -	if (!info || !info[error_id].name)
> -		return -ENOENT;
> +	int idx, ret;
>   
>   	if (!xe->info.has_sysctrl)
>   		return -EOPNOTSUPP;
>   
> -	*name = info[error_id].name;
> -	return xe_ras_get_threshold(xe, DRM_XE_RAS_ERR_SEV_CORRECTABLE, error_id, threshold);
> +	ret = drm_ras_counter_get(xe, info, error_id, &idx);
> +	if (ret)
> +		return ret;
> +
> +	ret = xe_ras_get_threshold(xe, DRM_XE_RAS_ERR_SEV_CORRECTABLE, error_id, threshold);
> +	if (!ret)
> +		*name = info[error_id].name;
> +
> +	drm_ras_counter_put(idx);
> +	return ret;
>   }
>   
>   static int set_correctable_error_threshold(struct drm_ras_node *ep, u32 error_id, u32 threshold)
> @@ -119,14 +156,19 @@ static int set_correctable_error_threshold(struct drm_ras_node *ep, u32 error_id
>   	struct xe_device *xe = ep->priv;
>   	struct xe_drm_ras *ras = &xe->ras.nl_data;
>   	struct xe_drm_ras_counter *info = ras->info[DRM_XE_RAS_ERR_SEV_CORRECTABLE];
> -
> -	if (!info || !info[error_id].name)
> -		return -ENOENT;
> +	int idx, ret;
>   
>   	if (!xe->info.has_sysctrl)
>   		return -EOPNOTSUPP;
>   
> -	return xe_ras_set_threshold(xe, DRM_XE_RAS_ERR_SEV_CORRECTABLE, error_id, threshold);
> +	ret = drm_ras_counter_get(xe, info, error_id, &idx);
> +	if (ret)
> +		return ret;
> +
> +	ret = xe_ras_set_threshold(xe, DRM_XE_RAS_ERR_SEV_CORRECTABLE, error_id, threshold);
> +
> +	drm_ras_counter_put(idx);
> +	return ret;
>   }
>   
>   static struct xe_drm_ras_counter *allocate_and_copy_counters(struct xe_device *xe)
> @@ -244,7 +286,7 @@ void xe_drm_ras_event(struct xe_device *xe, u32 component, u32 severity, u32 val
>   	struct xe_drm_ras *ras = &xe->ras.nl_data;
>   	struct xe_drm_ras_counter *info;
>   	struct drm_ras_node *node;
> -	int ret;
> +	int idx, ret;
>   
>   	/* Event is supported only if drm-ras is enabled */
>   	if (!xe->info.has_drm_ras)
> @@ -256,13 +298,16 @@ void xe_drm_ras_event(struct xe_device *xe, u32 component, u32 severity, u32 val
>   	node = &ras->node[severity];
>   	info = ras->info[severity];
>   
> -	if (!info || !info[component].name)
> +	ret = drm_ras_counter_get(xe, info, component, &idx);
> +	if (ret)
>   		return;
>   
>   	ret = drm_ras_nl_error_event(node, component, info[component].name, value);
>   	if (ret)
>   		drm_err_ratelimited(&xe->drm, "drm-ras error-event failed: %d for %s %s\n", ret,
>   				    info[component].name, error_severity[severity]);
> +
> +	drm_ras_counter_put(idx);
>   }
>   
>   /**
