Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFEDAC87FCA
	for <intel-xe@archiver.kernel.org>; Thu, 31 Jul 2025 20:37:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5949D10E7E5;
	Thu, 31 Jul 2025 20:37:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JUg2LWiQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D319910E7E5
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Jul 2025 20:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753994243; x=1785530243;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=5SKZNSRBB/Gl+3EtRxNv7vENCzWSnleZtO+Hkr1v9Lc=;
 b=JUg2LWiQHYI+goWp5rQYxX7x7bQ3NaJjem2kqYLvOFJDdZ/WXAqHDt5h
 v6EweOdj7uF89OOK2xoweR8lOKufBwB/BcG7etciVwefijpPWyTzRgmAd
 bk9P7KkS1OSLU7wnPmGyiSIa05hOBmtXZKzT9Ri6BosrO9vwquuQlfPpW
 PcwmKNaELTFzWx8VkF4n+nlWAfNGN1eNPgDi5HfxITuzBstnR5twsyrYS
 8rij43LZ1wK9Wyy1bh9WXNBJxwnRu/7msdfnrtDNTtxGAjngURwuY/Vto
 535Kh3FaJ+JzJuACXFt6MqE6I3AD82Nxqy/PhkaWH0CNRwOULsrbUfHt5 w==;
X-CSE-ConnectionGUID: EVjlOX4DSnS0yJ2tFtiIVw==
X-CSE-MsgGUID: BwiTrs9CT9yBZwOsjDn3hg==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="67409737"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="67409737"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 13:37:14 -0700
X-CSE-ConnectionGUID: CSr/3pJbT3a4E1EmXULniw==
X-CSE-MsgGUID: h1lJ4eOBSKmiJNs0Dq0Tvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="163068415"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 13:37:14 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 31 Jul 2025 13:37:13 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Thu, 31 Jul 2025 13:37:13 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.45)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 31 Jul 2025 13:37:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f6GbJAhoQOy19kXV89yRpyj/olA5XT4peOLS37Wigt+iLWW0dOyN6pCgSyQUGcJ6QX0GrJEB/B/t+1V+5b2CkbOel1mDULUj9j/eS6I0DRPbyT7bk8i9NglvFnSSLQK6UY8Y+cnr4+Kxxp13mHvjzp7w9aG8LbWc8gu49YNL8/4qj6gf12ZAIpVZY15w9w0bsnfT7gsiszlCqVxeApEcUAzXKedh4DlihfXmeTJzYvNqbti9tSc+Mqs4spBXU0zr48JgvinEQLoUIVww+vN8JoFic0qnvnYbJ5okBeBh7IEuvH0OWrgVzrsLUZuKpNH4rVS13ZVfMo/Zvu/9DsKufw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7eetw49jl295FhjP8J67iOyKB8x43slDtTAThSt1foE=;
 b=zH8m+FXjPOzT35We/Jz2specTDGdJjQ43eBjFMAF1c7XSimUFtZgyVM0HvnzKrAEzmSbeFYibPQyjCqHENm/jEjGEuoAPAByawh/cwqp3299yjMA70YWgmJ+LprXy+P29PMBk9/jt2nNL19S+8p0qrP16goEWrN3DBIpfPt6gCCfouKE+AHdT4bVR1kIh+7xxl67gcakatw5cX5xPYY3IqQsplvSujLDt3vyYsrQyJ7HJ6OWx/2BN10RWFDWQwcPvT7mQI43Tw+z996H1cxl6K/xqb20i7KT0Ye3A9//EbRRm3LdpSrUQ35W7F1etu7abyTl3mCdtgPeWf8hXlzwfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by MW4PR11MB7128.namprd11.prod.outlook.com (2603:10b6:303:22b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Thu, 31 Jul
 2025 20:37:10 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8989.011; Thu, 31 Jul 2025
 20:37:09 +0000
Date: Thu, 31 Jul 2025 16:37:05 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, John Harrison <John.C.Harrison@intel.com>
Subject: Re: [PATCH v6 11/11] drm/xe/configfs: Allow adding configurations
 for future VFs
Message-ID: <aIvT8XHu4NCAb7wk@intel.com>
References: <20250731193339.179829-1-michal.wajdeczko@intel.com>
 <20250731193339.179829-12-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250731193339.179829-12-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR13CA0229.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::24) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|MW4PR11MB7128:EE_
X-MS-Office365-Filtering-Correlation-Id: df8cd7ee-9bcc-4424-7ace-08ddd0720539
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?blYrVit0bTFQV1RlS2t6cU9McXZGME1uZnJVYjFjcVlxU0lqS2xoT2ZtQUh3?=
 =?utf-8?B?V2g0TU9TQnFGajFmUHZtM1Z1WmV6L3FFcjNUaWxRQk4vVFVackMrUTkydGFL?=
 =?utf-8?B?SXBQTzhDcm01MW1OYjdkbVVMQm1pb0NsMDlmR2ErM0hrcnhUc1BKWTcxU3JS?=
 =?utf-8?B?ZTZ5VzhScG5aNGhPL3N2WE0xZDBKMXdIdlh5YzJSWFpGWG14ZWpGT3ZhK1Nt?=
 =?utf-8?B?alg3SkVvMi9FVkVtS291VjMvTmpVaDFtVTlWcnUzQTZXbXNLdWREd2JYZWRD?=
 =?utf-8?B?Z2ZvOWJ3a1ppNmlQRWswVHFPTnd5Q0hJTld3bG9BdkRvd2tpVHBHbzB0QURN?=
 =?utf-8?B?RXBOc25DV0VqVUN5WGpYRktCaHI1WlBPdkZ1TUdCbHJ0RVBSM0p3T01vZklz?=
 =?utf-8?B?bWNQUGVpTExXOG1IOGs3Ri9EZ0x1SkZqRldtakJPY2ZnclN5SHFZK2dYb2Zj?=
 =?utf-8?B?NWU4UExwVXl4c0ZReVl6dEhBd1paMi9LNlllVUVmbXF3TVROT0FQOFI0M0V5?=
 =?utf-8?B?WWtObFhHNkExSVZtVzNSMjFzNVhXaXMzeXN6QXYrQ29iSHBvZy9kaHd2TE9E?=
 =?utf-8?B?ejBSMHZ3aHlLc1dvSjRqbXdvRkUvVlB4T2Jna2o2Vm9YTzBPZlF4c2crNnIz?=
 =?utf-8?B?anVXT3k4Y3VJUnEyZnExdVVOUDlEeFBod1hDQ2ZxZU5aSHRsbWRMd1NRMWY0?=
 =?utf-8?B?RkI3c0p6Tko1VVYwSGFSU3laLzVGUkRFQVpaR3ArcEsxZGVhL29sWHgyY2pj?=
 =?utf-8?B?a0JuT2U2VWMxTERwaGtVejFEcGVZQWZ6dmJaNDhsMkhaampFSWs1Mzh2WFBw?=
 =?utf-8?B?R0VSbnZMKzl1ZXM1SFptWjlxcTFJY3B4eldEL1pCYWpsM0dYcW1UdnJHSW1m?=
 =?utf-8?B?V0hZUkVkd1dMcU8rQVhwRUtNZ0d5WDg3UzRtdWloZGFvem5lajdRR2xBQ3g5?=
 =?utf-8?B?ZjNOWnA4NllXa1puSGNYSnYzVGJ0Q09NU3NSYlFUSlVLeUs1QVB6OG5YeGp6?=
 =?utf-8?B?OVRvVXoxaDRLeURtMHRLbzVjWFV3Sy96ZWNjS3MyTTNCbm1TaUp0M3V2VXFY?=
 =?utf-8?B?QWl6T0ltMEJuUlBhaVNpNEp2NXh4dmVYWldoNWVKbmlnYWNYUFhtVGNqYUZN?=
 =?utf-8?B?cW9pRUw0UktYZTlDQ0tGTnRFWVpRVnZEMVpJazJ0eHJscmJyaG4wcTNRcHhC?=
 =?utf-8?B?amxxSVNYblU4VVozWm5DRHVuaFRCczJsUkFxbXdGMGNSaTdGUDlQcFNmR0V4?=
 =?utf-8?B?VGpWcGJOaXVSQWEwUjJ5K2ZuTWNpMWpNb3JZS2NITDNSWXdnNHJGZjZMRnZZ?=
 =?utf-8?B?L1VMWUhzMFZKekRuMjJCZnJ1NWZBWE5pcGJKTzZZalNvYVJIVE1xZ2dlaGZk?=
 =?utf-8?B?RzBxQlpKTDZFWDlKcU5wMlZENmlkSWtVWG5YZDhBNmovUm9MQmVDUGRIS1NW?=
 =?utf-8?B?UXZzRXZveGtHcU1iTTlMcFhkYTI2TWVtbEQ0bFFLbkhpNE1RL3d6U296bmRp?=
 =?utf-8?B?cE44S2RLOE9md3pHTmpKQUdLcDZXRGdQZXRJNytWNlpNRVdjM2E5NUdoZnM4?=
 =?utf-8?B?U2p2Rjd2cFZTU3FWSXk1LzNJNHNtaXREaW0wSjZHeGVXaFFscnB2N085Sk5T?=
 =?utf-8?B?MjhMTWpLbU43M0lPTXpxQzFndmN4cXlVSEhvamJuUVNhZGc4cmtNdlB2aitk?=
 =?utf-8?B?TFJER0dERXhkNWZ1MHdPSGJtYWVDMlNXdTE4R2xEcGNPM3dCMU04RWpWaG4y?=
 =?utf-8?B?emNwL0pHMnhvVklXaUFicVdxVFU5aXNiRVdpWnVTMW9DYVRCNER1VVFXenIr?=
 =?utf-8?B?UTFId1ZUei9KTFZ4VzFXUE4xYktpVDEyVGVYT05adVBKRHFKZTBkQUV5SmVt?=
 =?utf-8?B?MS9xSk9tckgvWVAwdGx0eEtucFBOcnk3MytOem0vRXk0aEF5UzZXS2FGL0hu?=
 =?utf-8?Q?Nox/HBvqIsE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eHRuZFR6K0EyWFBEeExrQmNMUmtJQ04zZmtKWW5sN3lvVElNZThlUE5rYnM5?=
 =?utf-8?B?aGdiQlNCRTBmMWFXQmxCc25kVG9rUWo0aDhjNU9NTTdGWW1sK2xnUUVWQUp3?=
 =?utf-8?B?OXNTS0lYekk5Z0ZORDFFcllweEZyRmNoZVFZOTVKN0RkQjZjNEZSRlY2TTky?=
 =?utf-8?B?WUt5WG9jeTQ5RUNsZWF5T1JMK2ZiOFFScHZYUW9JNkpnREgrc0ZCM1VLUk8y?=
 =?utf-8?B?VHVqSzI3YTFtd3Qva1I3dlBhWG9ueFVhMWhaN1d2MC9paUFQV2RYcXRsNXU5?=
 =?utf-8?B?Y2duSS95QnppMU80cGZOTWlrM1Y3ajlVSExPOUF4STUzajI4NEhWSlFOLzBv?=
 =?utf-8?B?R2JNOWpock5nanNOYUlZaWp0Y2RYeFgyYjR6cXQyVnBYSktVVHZWZGtHTkg5?=
 =?utf-8?B?bEF5NzZpV2xHQjdybUx1aFRkWldEY3RhTUdhRTFOTTMvKzhwVXg2QmVQbEds?=
 =?utf-8?B?ZlhsQ1R4M0xlZzFyZjJDVFd0d3hiejBxSHdhTjdYdFAvQVY5NThMRVlYUm4y?=
 =?utf-8?B?dDN5QW8vRElpby9pL3dCMXhFSkMzc05BYXZYdys2TnZvZEZDVGZDZzlueTdD?=
 =?utf-8?B?NitkbnRuM3JDeW9PWG5WbFZibm1aeWp5WGJZeDZJdkY5QWNOK0ZtSWhTd2Qv?=
 =?utf-8?B?L1c2NFpGbWo2bXc3eG5KWWdlMnFnd2tCYmZFeU5HeDZhYWVOT29VVjl6QkU0?=
 =?utf-8?B?a3dvNE5yZVRpaFVDWEx6M3RvUHJ4QnY0RXl0L0FaMVlFdW45VWluL2FveVNt?=
 =?utf-8?B?eWM3VU9ZU2FXWENmY2JtMXdIRWRPWEwrN2pVUW5JZ2dKdmhUSjEwbUMzRHNS?=
 =?utf-8?B?bDhwY1FBQkNkbnJrUU9RdDh2bDlRVmJZckJUalJkZHBPWnpBaUIyTjFxNVU5?=
 =?utf-8?B?dHZ2UlVMLzY2RGpPUzhSb3hJdnNNMlV6Q1pOQTE3TUJ1bUhhaDZGaklPYTBE?=
 =?utf-8?B?SE45UWgwenZYZlVEWmtYWjN0REw2ckxsR1FWcjlnUVZGV3FWVkQ4SEpVTW93?=
 =?utf-8?B?Z2JHTlVKdTFYeGtGNnFtVWgyWFQvR2JZcnBtUVNZRXcxemM5RVFiSSt2eFVZ?=
 =?utf-8?B?M25Jem5QRXRwazJzWjZBVFp6Zlc1T1grSi9HNHV3c1Q5S0o0NFo1U1NzanBN?=
 =?utf-8?B?V1R2dUJrbnhUbkVUaEY0RTJJVEgvcm5qc21ZTGR1SlQwRmtKUThPYU5FcUxk?=
 =?utf-8?B?bGNsOWdPVktRMkc2U29sSGxPWGRvM3lpQjRUVEk0ZDhhMGF2T1JsQzNsa2FP?=
 =?utf-8?B?R3lBb2Y1MmFnRThYQ09nSGFUbG56MW0vYzZsQXRFS3FXR1ZzQ1ZCby9mY0h1?=
 =?utf-8?B?c2tWRGJqZ0RhU1BidWNmMkpuemYybUJYVzVHS2FQYXNrOWhkbDhIUXc5N2pI?=
 =?utf-8?B?REJMSFBGT2QrcjF1MkJFS3FwMDJUSDBXTENyOHo2NmVrR0ZyN21kNlNVc052?=
 =?utf-8?B?OGw3Z21BQ09pa2lkSWJXVm10M3dXQUZRelVQa1NpcDd0eENSYUI5NnVUTDJU?=
 =?utf-8?B?Y3BjWEZjcDY3VU9pSk41K0xZdStXeHlPcituRVZrcFR4SUhmeU5oZmtSVEJR?=
 =?utf-8?B?MGJKN1FHZzZGUlVqQ2RRMmhUaVcvUEdybEREdlJvdStsenZoSmtKVDFUcHpT?=
 =?utf-8?B?WFE3dWwvcXl2QVdiZHZnKy94aDFacm5vWEhDS282YVJpNDRFSElyM1huR2Ir?=
 =?utf-8?B?MVhJUkt6Yi9VcHRVaVFBM3FzVnZ3QnFLeiszU0NvWWxjMGk3WENTdWRaQjZD?=
 =?utf-8?B?TlNrbFRTYnpNajFJcnY3bFUxSDRhNDZSeUNsN2RKN2pTNXF1MUU4dmppYmx6?=
 =?utf-8?B?eVRCS3FVcU4wTHZjQllaUVlhTGZHencvdkEyWTVqelFWRFRKS05yVndDdjB5?=
 =?utf-8?B?SktaRWFEeVcvamZPNi9lNlk4UC95cXBFbjViSFN5NlN1L05pMmVBR2wzUFVk?=
 =?utf-8?B?Wm5VM3JHS0w2Y2VoR0VxcTFqSXRrMjA2MFNXbExwT1p5TjRDMWlBRlBlY0hW?=
 =?utf-8?B?Q3IrLzM1MWFHaXNjYjkzSi95MWZMV3ZqTXl3dnBnazhyMGNZN3E2aXgzanBF?=
 =?utf-8?B?TDd5TWdrYXV4MmthM0RldGNMR0NwczdDV1BOM3BaYTBGaERJUGNRYnRTM3Y5?=
 =?utf-8?Q?F3sykmmOdTpjO+KMqlwET0ASO?=
X-MS-Exchange-CrossTenant-Network-Message-Id: df8cd7ee-9bcc-4424-7ace-08ddd0720539
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2025 20:37:09.1048 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n+2Brxgcea5enRrcB5GQJLNTOIWKcI0a4hBUoI+S/1PFYGZ8Ud7nta9SPeTYe8vMhbqT/e3DNpdqfu8FYcppiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7128
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

On Thu, Jul 31, 2025 at 09:33:39PM +0200, Michal Wajdeczko wrote:
> Since we are expecting that all configuration directory names
> will match some of the existing devices, we can't provide any
> configuration for the VFs until they are actually enabled.
> 
> But we can relax that restriction by just checking if there
> is a PF device that could create given VF. This is easy since
> all our PF devices are always present at function 0 and we can
> query PF device for number of VFs it could support.
> 
> Then for some system with PF device at 0000:00:02.0 we can add
> configs for all VFs:
> 
>   /sys/kernel/config/xe/
>   ├── 0000:00:02.0
>   │   └── ...
>   ├── 0000:00:02.1
>   │   └── ...
>   ├── 0000:00:02.2
>   │   └── ...
>   :
>   └── 0000:00:02.7
>       └── ...
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com> #v3


Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
> v2: rebase and improve checks, fix include order
> v3: put correct device (Lucas)
> v4: rebase and change reporting
> ---
>  drivers/gpu/drm/xe/xe_configfs.c | 35 +++++++++++++++++++++++++++++---
>  1 file changed, 32 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
> index 0e2da7907afc..c2da2c60e321 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.c
> +++ b/drivers/gpu/drm/xe/xe_configfs.c
> @@ -12,9 +12,9 @@
>  #include <linux/string.h>
>  
>  #include "xe_configfs.h"
> -#include "xe_module.h"
> -
>  #include "xe_hw_engine_types.h"
> +#include "xe_module.h"
> +#include "xe_pci_types.h"
>  
>  /**
>   * DOC: Xe Configfs
> @@ -285,6 +285,15 @@ static const struct xe_device_desc *xe_match_desc(struct pci_dev *pdev)
>  	return found ? (const void *)found->driver_data : NULL;
>  }
>  
> +static struct pci_dev *get_physfn_instead(struct pci_dev *virtfn)
> +{
> +	struct pci_dev *physfn = pci_physfn(virtfn);
> +
> +	pci_dev_get(physfn);
> +	pci_dev_put(virtfn);
> +	return physfn;
> +}
> +
>  static struct config_group *xe_config_make_device_group(struct config_group *group,
>  							const char *name)
>  {
> @@ -293,6 +302,7 @@ static struct config_group *xe_config_make_device_group(struct config_group *gro
>  	const struct xe_device_desc *match;
>  	struct pci_dev *pdev;
>  	char canonical[16];
> +	int vfnumber = 0;
>  	int ret;
>  
>  	ret = sscanf(name, "%x:%x:%x.%x", &domain, &bus, &slot, &function);
> @@ -306,12 +316,31 @@ static struct config_group *xe_config_make_device_group(struct config_group *gro
>  		return ERR_PTR(-EINVAL);
>  
>  	pdev = pci_get_domain_bus_and_slot(domain, bus, PCI_DEVFN(slot, function));
> +	if (!pdev && function)
> +		pdev = pci_get_domain_bus_and_slot(domain, bus, PCI_DEVFN(slot, 0));
> +	if (!pdev && slot)
> +		pdev = pci_get_domain_bus_and_slot(domain, bus, PCI_DEVFN(0, 0));
>  	if (!pdev)
>  		return ERR_PTR(-ENODEV);
>  
>  	match = xe_match_desc(pdev);
> -	if (!match)
> +
> +	if (PCI_DEVFN(slot, function) != pdev->devfn) {
> +		pdev = get_physfn_instead(pdev);
> +		vfnumber = PCI_DEVFN(slot, function) - pdev->devfn;
> +		if (!dev_is_pf(&pdev->dev) || vfnumber > pci_sriov_get_totalvfs(pdev)) {
> +			pci_dev_put(pdev);
> +			return ERR_PTR(-ENODEV);
> +		}
> +	}
> +
> +	match = xe_match_desc(pdev);
> +	if (match && vfnumber && !match->has_sriov) {
> +		pci_info(pdev, "xe driver does not support VFs on this device\n");
> +		match = NULL;
> +	} else if (!match) {
>  		pci_info(pdev, "xe driver does not support configuration of this device\n");
> +	}
>  
>  	pci_dev_put(pdev);
>  
> -- 
> 2.47.1
> 
