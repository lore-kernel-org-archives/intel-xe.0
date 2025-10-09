Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DC51CCD184
	for <intel-xe@archiver.kernel.org>; Thu,  9 Oct 2025 23:06:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D479310E045;
	Thu,  9 Oct 2025 23:06:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nbc78ig9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C909910E045
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Oct 2025 23:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760051211; x=1791587211;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=/Pv2CYYiyRcmUQNFARY4I6WIKpsBxm2K5158O8XnjWs=;
 b=nbc78ig9eb7kNUi7QI7V6K+qgX0CZynQOKllhrq3/YcC4aq5HZMp2+4k
 oZdeKoFhTA3IUSksiPn4EGmwuSksBosvxyOaaGNEVJO9DOIkJxmh+eoDu
 3Yt7IZWH0X1hmrJSCa2lYdB/Hjvuub2386TE4QZ4D1oc0G4zpzGmfEDM+
 K3jwyPFgGCNBaQ9Vl7NkLpnO9LVjyZe7Y9yZFG1AzvrzIVtlVYLgg/7Bg
 VAeUcaz3RBGQPEhIVEkJkOte+dMKJVB9tUdN9P5xjEdeHFxaEEDdi0Y66
 3sNpIogID1Mds/kxSCnAU+6smn+3J2OukjuMKbOHKjIY/vukoCnwuDxyx A==;
X-CSE-ConnectionGUID: g2fxd2U0SA+Jj9OjwlqqJA==
X-CSE-MsgGUID: Lg3nr6VNTD6avl2TTOrGXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="73374673"
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; d="scan'208";a="73374673"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 16:06:50 -0700
X-CSE-ConnectionGUID: H9/LeKt2S0O7JtIDXiPp5w==
X-CSE-MsgGUID: ATNxgdocQEmikqUF4j0jGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; d="scan'208";a="180651503"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 16:06:50 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 9 Oct 2025 16:06:49 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 9 Oct 2025 16:06:49 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.48) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 9 Oct 2025 16:06:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OE+XccG0YehuHTJc0i6evFNq5zZ/zBdOxdbuAf2IoleR0BXEW1W/MFEpPPGZKiL+9l1lhgR1A0d9AUgrBDJkdePE2ptsuNd2pNMCplIMzrgGJTUd7ZA8N2Tm/Ed6IUWkMocxSBXXuglD0Fz4HSwCHF9c9heyCKgzkcC82Jc1JKAAz1miWXhXUABrEPDleDYLtIPs22nNC1/EMbkj9V7j43Ons5ffO9Syo2OUlzqNES41ExtJxq9YubK9KAKbXpQMZdyaqLOhavvGoaOxzeG9rGQ/tKLfiyhmxZMQICcAxopCMgmbAwxO4fxEEb11eSO6YGE7VuMkX+8eQ0qpPnB8IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CX4eh+mOV3pjvaoQ3eFdKcBbrXb61XxPF3cLyuNJAbg=;
 b=idAN1tpjxzBvd0WvOfh6SDi5uVKkH0qry7qfrIc7jETHzwRaOcm421Ztl/0yCtkMYDN+A2AQHycPCidvR3qJHpDa4R8EQa8Z5gvysfl/aRvZ/RgCKUoH6TvF8ILd6Nu6CttDVU9uMnnATjNVlqte3V6y84b2jLBufC7ICExw0ccLe9UghTcqEIuWx35jAFbp/c0Z2tsDNTXShulRSuyG+ChF+PEHB1tkq4DhQ5tKqVWD2xmmIgMmd26C1IWF1zQ9PZIE654kMClyTJiVJYDK62zoWly7tXuPYhRDCsAdoEnrUUZDelZk53QFDju+PlRO1P+FJ7T8rboJ6ZAjdzfByw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SA0PR11MB4605.namprd11.prod.outlook.com (2603:10b6:806:95::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Thu, 9 Oct
 2025 23:06:41 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.20.9203.009; Thu, 9 Oct 2025
 23:06:40 +0000
Date: Thu, 9 Oct 2025 16:06:38 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Satyanarayana K V P
 <satyanarayana.k.v.p@intel.com>, <intel-xe@lists.freedesktop.org>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Subject: Re: [PATCH v5 1/3] drm/xe/migrate: Atomicize CCS copy command setup
Message-ID: <20251009230638.GF1207432@mdroper-desk1.amr.corp.intel.com>
References: <20251008101145.11506-5-satyanarayana.k.v.p@intel.com>
 <20251008101145.11506-6-satyanarayana.k.v.p@intel.com>
 <aObsmCaIbrSgHrvd@lstrano-desk.jf.intel.com>
 <aOex-1E8yBlGFbwI@intel.com>
 <aOfeoWV87W+Gt6HH@lstrano-desk.jf.intel.com>
 <aOgAXul_Az3JLC0V@intel.com>
 <aOgDrJhtrEqgpAJk@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aOgDrJhtrEqgpAJk@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: BYAPR08CA0033.namprd08.prod.outlook.com
 (2603:10b6:a03:100::46) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SA0PR11MB4605:EE_
X-MS-Office365-Filtering-Correlation-Id: 966e655e-9c93-46c0-b5ad-08de078881bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Mk1sMkxjNTlEQUZneURlNHFnZDllN2NKWWtVUnRPZC9rL3d1RFVHREhvZ1Mw?=
 =?utf-8?B?U1NITUEydG1uZnNJbnZFaGl6NHRaOWxPQ1VKdHBPYnhwMHFWVTVibEc5MGxw?=
 =?utf-8?B?MmJBVmVucTFzbEdmV0MwaHU0dU1JWVJveXFuRlBmV096clRyZldTTENlRXNN?=
 =?utf-8?B?ellKdWxVWGc5M0MrOTZGU05Od3JwU3FHRytEVHFYa0RhRnJGYVV3UzFTY1BZ?=
 =?utf-8?B?S1FUS2ZhbU43TWs1Tnd0eW5kM3N2S2swRm1OWFkzcWxIS0gwekxONmtzdDh6?=
 =?utf-8?B?TS9qaVlacHNjNnRqQktzV0VxWG5BYUMyYXRRbHBjbENrK2ljdzNsNUtYZTVo?=
 =?utf-8?B?a1JaMUNrN3hCYkh3MEJPZllwNkZnQ3dIRzlrU0xUOGdISWZkVExVbC9VQW9X?=
 =?utf-8?B?SCs3eTkrRHhsdDFMSlBmZW90MEJBOHVvY2tvckVTU3VCeUFjeWo4UnVwQURt?=
 =?utf-8?B?c3hvSVZJSTRVNlpXZ2FXNjhYdW9hWnR4TkpYbWZZY3pSUHlhNnU1UFNuR1Zt?=
 =?utf-8?B?Q2xEUFRNeVlKdmVJcWpCUkw0OWhRR3J3R3o5M0R0dG1kSUI0dUhxZUZVaEds?=
 =?utf-8?B?SzdHNTlXcEdFdHQzSXhvOVkrVlpzNUV3RXNMSE9ZdmNQaTZHbnhwUkRGTThY?=
 =?utf-8?B?bDg1blozR0Ivc3E2MXJWQXU4bjBzQThwRXlPQjFQREpIbXRkR0thZFJiOXFv?=
 =?utf-8?B?NlFDVFdpRER3N2t3RWJyaGVXNjB6TDRCN0xYSjR2OFRJUlp0VkUvMStvTU45?=
 =?utf-8?B?NFl6TXRoeHMzazBsam1uVHlMajZlMDhmNkF6ZXZXWXoxK0JHOUcwZGZTaDRG?=
 =?utf-8?B?TjRqa0gwTXh1UE9pRXYyam9BN2pyRTZTaUtpZlhiL3AwQVpOa2s1L2NiT0t4?=
 =?utf-8?B?QTYwazBwWDRpcU8yTTNWNVRtaEUxaTJVNWJEVytmL3ozOE1BZ3dvbE1hMUNn?=
 =?utf-8?B?WGZaK3VFeEJQQmxnbStybmxWelRQOXY1eEZXUWxwbllkNFR2bGRVSEc4dEJZ?=
 =?utf-8?B?elM4ejB4cWNqK1FPaUpKdVZ5UW1aSElJNFVXM3RKWDF6d1FvQ3lia1BoeHo2?=
 =?utf-8?B?Vm9lbVYrSmZ4eVVTWkRWOGw0cWNSWVlhRGdUZTR3S1FCbVJZUWV0ZC9HQzAx?=
 =?utf-8?B?ZnpKYjUzeFBWazFrZXRoSmNsdjlaTS9yV3AwREZuTzRaQ0xWV1JtRFBwMndX?=
 =?utf-8?B?a0lvdmpySExGOEljaFIvaGwxdy9SbzhUWngybDNrbThpODYzZi9vQlVYWmcr?=
 =?utf-8?B?QzZDZ2lZZTZRVnZBU3pUQWtRN09wbkdCKzA4THBzNGVCNDIyRU9UcFMvN0tR?=
 =?utf-8?B?Z2pHTEtnTCsrTzhWM1ZiVEt5TEJYanhYV2lvS08rb0lQTHN6ck50dEFUWUVO?=
 =?utf-8?B?S3g2ZUo2d1MvQTl5SHRMVVZOWXk1Y2FEVGRyM0hxb2xXYmhsQUdGMUNqYWw2?=
 =?utf-8?B?ME42NzlCbUthWUVwZXlvcmtPaXdvWjhyeml6TWorQTFnZDNlbW1iY3RnMytP?=
 =?utf-8?B?TzZ2T092VGZDZ3BZMTVMQ2NiMjBRRytGNWhwRlJTMW9GRkFkRHJKK3U1YWU0?=
 =?utf-8?B?ODhWbDVYUEJ5dVlEV3M0S3Fma0tVbE5rd1ZhL3dSL0lBSXFoNC91ckhYU2VF?=
 =?utf-8?B?L3QwTEpFQjNUSWFiN2hkVUNhSmx4S3VQUWZsWnUzdmhsc0RMdjREQkVKa1ph?=
 =?utf-8?B?T3U3YmNJTHVTRGlDb0s2TVl3ZWpTbFkxUDZKZU9sZ0M1VTlqQ3NVM3hHak9C?=
 =?utf-8?B?RUNiNlk0VEJuY3RZRFdFTHkxWEh1ZVZTWno0Tzd1OEk0VFd4OHVkbTNqd05y?=
 =?utf-8?B?VXc1UThObWVmU2drOTQrYzBweU9wR2E4dWJUcWpzdDMrUTk0NjZ3SGJyMHAz?=
 =?utf-8?B?SmVpVTlQRE9NK2FUdDJUVlFhbXZETG9oOWIrK2MzOHUvSUE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SFFOKzMxdHBWaWtaU2ltdE5UbUcrWXVSZFQ5WGFQZjE2SHB5djBkYUpyeElT?=
 =?utf-8?B?bVRZaTI2QUZKNnRnYlExMElhYWJDN3B0L1owbXJ6aDNMWVp1OENVbFlZaFl1?=
 =?utf-8?B?alJWcTg2R2JTZW9rYTIydXNMNFVTVGRPNkYrNmVQdUQ2bk5MWWZyZnlyQ2h5?=
 =?utf-8?B?RnJOMElYdmt4SU5PTVBiaXVBR0xPVlYxZzBpU3NnSlFCSEZOcEoxQ2xlYVpp?=
 =?utf-8?B?djJQMDVwWHFzaVdOcHc1WWlQcE5nSHhRYzRiUFEwajJ4cmF2SWs0ODN3WEZi?=
 =?utf-8?B?cXBQUUFTZWw5TnV5OEpJUzV2V2FtRStFRUJ1bE13RnBtd3dGVkd6NzdnU0d6?=
 =?utf-8?B?Z3Q2RENPM2xaY0EvcEo3b2J4R3JQaTZPQ1RvSnFnRG5IVFVwb3Qzd3V1Umlr?=
 =?utf-8?B?c0JrM1c4YTBWSXNCdXB2eGJSMXpoMjk5NS9xNU04THhGQW41R0lTMklyN213?=
 =?utf-8?B?L1VKcUs3RjhSVVZsbFlWNmJ2aE83eCtuWVQ2ZHFpWFYvL1AyZUp5UElmSHFj?=
 =?utf-8?B?Q01MZ2tUMlZVREdGMEIxWVFNbGpuNnkvNUxTdjAvalVmRC94b1VnUkZ2aUNx?=
 =?utf-8?B?cUlvaTBCTTFkVE15NGl1SVNuVktEcEZ3MU53VUlDeS8rZmplUEtuVGI3Wk5z?=
 =?utf-8?B?TXhHMmxnZGZ0bEN1b3FydnRqK3ZYZU1jdVFLVUFaSW02dW45cjgxWDdHNDMy?=
 =?utf-8?B?UEkwdUtQWXg5OVNvMHE0R0hqYmFxMklhNmVDdkZGZ3Jhc00vQVV2U1RsMnhT?=
 =?utf-8?B?SkUxR1RNSTdueTQ2MGFqcU9UUHk0bGpIUXB2SU9QRUxKd09vb1JsNXh4eDdY?=
 =?utf-8?B?dndyUkhybGVhQzV5b3N1bnljbkVmd0J4cFZydTVYa3ArUDRaaXY4bnJMMlZP?=
 =?utf-8?B?K2NPd2toU2JFNzMvNGJZK2hGSmt3ZVVzbmVrSzBFMk1VOW1uckNvTFVTZ0NE?=
 =?utf-8?B?TkY0bTFSZWJaeCsrWE9aQVM3T1NpTFA4VUxOM3YzNE1GTVVEVml2bW5XQTRQ?=
 =?utf-8?B?c29RMDIyZnI0TzErTit2SjhXMDgzTU0yNlJBR05mODdMRUd5VVd1c0lyQXdX?=
 =?utf-8?B?Mnloc2RCditjNEFJd0M0LzVIM1U5aHgrM1RKbVZzbCtaSGRpSWFIbXRjSk9t?=
 =?utf-8?B?OXY0Nk9xRFhHUk1hNmh6US95Sklnc0o5bU1WY0dabVdMU3F1WlQ0MHpreUlI?=
 =?utf-8?B?VEZlN1BhYWkxVTQ4YUVSS0N4cU9OWFV6a2dEMzdEMGNSSzhVSWJkUEYzZGFJ?=
 =?utf-8?B?SjZWZGRnYmNSUEhabTEvTUFXeW9KajRUUjlicVhKalQ0aTVaOFM1MkFBVHFr?=
 =?utf-8?B?T3Q5cUhrVHhhSWhMcTVDS1l4ZXhKRi9XT2MxN1FuVGxKYzZkb0NSb2tIV3ky?=
 =?utf-8?B?cytYZjlIK2p1UXI5TjB1M2Z5TUZ4OGF0UDRTdGNDalBVZEZpR29KZlVYZXho?=
 =?utf-8?B?Rk5JOEYvMEFMWWc3dW04aU9TZVV6OFJaM2dLNEIrSHhLL3EzWDl1N3gxWjNy?=
 =?utf-8?B?YWRjdkZ5Um45RnBwc0NQc3plS2s4V3dQa1ltSVFNRldEcmdKcnBldW1VRUl1?=
 =?utf-8?B?cHJWUTdxcVphVnJTVzlHdGgrWlA2VjdQbzJ0QTJsRkNUWmV0WFFKUkpjYVJC?=
 =?utf-8?B?dG5Pbnkremw3cm9ZR2puYlZuZWJyYi9KMW5BdVdEQm1Kb013UUt2ZUFwOEtX?=
 =?utf-8?B?ZVpWZEpIbi9EbW42UXRhOFppMXU1SWNKMnh5ZmZRMHpFNjIzQ3BlMFptVEFX?=
 =?utf-8?B?OTdMSk1vM0phUzdaZDRISEZLTXpBd0pzV3I4UXdkeUhNS3RyZHI3T1dHekJS?=
 =?utf-8?B?Y2Zpck96N2FUVEthd2N6Tm9Qa2VEWHdnNWF3emdzeUFLVzRWWExGK0xYekt4?=
 =?utf-8?B?RmVMd0lOV0VwZFlzMVo0ZHVSOWQ5MUlYY01UWTBaSDBsazFBSUZob3hzcjI0?=
 =?utf-8?B?aTlqL1V0WVFjbmk1UDUrWG5CZkk2QWdNRUpTdEVVcEpjVHBPOWIwT3JCMGdr?=
 =?utf-8?B?QjB5RFN1KzNoVFk3bVQzeXpRV21scm5hSWRXNk1zcFBveFV0cmdDaEE1Q3px?=
 =?utf-8?B?eEtjd280U1R4Um9nNFA3MEthQmgySDZSeWQzM2o3ak9uWVZPYWpqMW5TKzdP?=
 =?utf-8?B?OWRsVm9tZlpldmlpenR3TWpwTDBtVm8zWWZ0ekE3TWlEZkkvaHVsU0hDcW5T?=
 =?utf-8?B?a3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 966e655e-9c93-46c0-b5ad-08de078881bc
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 23:06:40.8600 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J+4GrNnn4gW9Cz54L7gMEzj9qipOZ6GwzREPg5fLmBIqPmWvbdDTveRaQ69BEAXns9faBWY+YZ58LByzy/79invlaXVahKbjzY/ShnLXg+o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4605
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

On Thu, Oct 09, 2025 at 11:49:16AM -0700, Matthew Brost wrote:
> On Thu, Oct 09, 2025 at 02:35:10PM -0400, Rodrigo Vivi wrote:
> > On Thu, Oct 09, 2025 at 09:11:13AM -0700, Matthew Brost wrote:
> > > On Thu, Oct 09, 2025 at 09:00:43AM -0400, Rodrigo Vivi wrote:
> > > > On Wed, Oct 08, 2025 at 03:58:32PM -0700, Matthew Brost wrote:
> > > > > On Wed, Oct 08, 2025 at 03:41:47PM +0530, Satyanarayana K V P wrote:
> > > > > > The CCS copy command is a 5-dword sequence. If the vCPU halts during
> > > > > > save/restore while this sequence is being programmed, partial writes may
> > > > > > trigger page faults when saving IGPU CCS metadata. Use the VMOVDQU
> > > > > > instruction to write the sequence atomically.
> > > > > > 
> > > > > > Since VMOVDQU operates on 256-bit chunks, update EMIT_COPY_CCS_DW to emit
> > > > > > 8 dwords instead of 5 dwords.
> > > > > > 
> > > > > > Update emit_flush_invalidate() to use VMOVDQU operating with 128-bit
> > > > > > chunks.
> > > > > > 
> > > > > > Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> > > > > > Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > > > > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > > > > Cc: Matthew Auld <matthew.auld@intel.com>
> > > > > > 
> > > > > > ---
> > > > > > V4 -> V5:
> > > > > > - Fixed review comments. (Matt B)
> > > > > > 
> > > > > > V3 -> V4:
> > > > > > - Fixed review comments. (Wajdeczko)
> > > > > > - Fix issues reported by patchworks.
> > > > > > 
> > > > > > V2 -> V3:
> > > > > > - Added support for 128 bit and 256 bit instructions with memcpy_vmovdqu
> > > > > > - Updated emit_flush_invalidate() to use vmovdqu instruction.
> > > > > > 
> > > > > > V1 -> V2:
> > > > > > - Use memcpy_vmovdqu only for x86 arch and for VF. Else use memcpy
> > > > > >   (Auld, Matthew)
> > > > > > - Fix issues reported by patchworks.
> > > > > > ---
> > > > > >  drivers/gpu/drm/xe/xe_migrate.c | 93 +++++++++++++++++++++++++--------
> > > > > >  1 file changed, 72 insertions(+), 21 deletions(-)
> > > > > > 
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> > > > > > index c39c3b423d05..b629072956ee 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > > > > > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > > > > > @@ -5,7 +5,9 @@
> > > > > >  
> > > > > >  #include "xe_migrate.h"
> > > > > >  
> > > > > > +#include <asm/fpu/api.h>
> > > > > >  #include <linux/bitfield.h>
> > > > > > +#include <linux/cpufeature.h>
> > > > > >  #include <linux/sizes.h>
> > > > > >  
> > > > > >  #include <drm/drm_managed.h>
> > > > > > @@ -33,6 +35,7 @@
> > > > > >  #include "xe_res_cursor.h"
> > > > > >  #include "xe_sa.h"
> > > > > >  #include "xe_sched_job.h"
> > > > > > +#include "xe_sriov_vf_ccs.h"
> > > > > >  #include "xe_sync.h"
> > > > > >  #include "xe_trace_bo.h"
> > > > > >  #include "xe_validation.h"
> > > > > > @@ -644,18 +647,49 @@ static void emit_pte(struct xe_migrate *m,
> > > > > >  	}
> > > > > >  }
> > > > > >  
> > > > > > -#define EMIT_COPY_CCS_DW 5
> > > > > > +static void memcpy_vmovdqu(void *dst, const void *src, u32 size)
> > > > > > +{
> > > > > > +#ifdef CONFIG_X86
> > > > > > +	kernel_fpu_begin();
> > > > > > +	if (size == SZ_128) {
> > > > > > +		asm("vmovdqu (%0), %%xmm0\n"
> > > > > > +		    "vmovups %%xmm0,   (%1)\n"
> > > > > > +		    :: "r" (src), "r" (dst) : "memory");
> > > > > > +	} else if (size == SZ_256) {
> > > > > > +		asm("vmovdqu (%0), %%ymm0\n"
> > > > > > +		    "vmovups %%ymm0,   (%1)\n"
> > > > > > +		    :: "r" (src), "r" (dst) : "memory");
> > > > > > +	}
> > > > > > +	kernel_fpu_end();
> > > > > > +#endif
> > > > > 
> > > > > Everything in this patch LGTM but I think we maintainer input to ensure
> > > > > we are breaking some rules about inlined asm code in a driver (no idea
> > > > > if this exists) or if a better place would be somewhere common. Can you
> > > > > ping Lucas, Thomas, or Rodrigo and ask them about this?
> > > > 
> > > > Well, it is possible and we have asm code in i915 for instance (i915_memcpy.c)
> > > > 
> > > > But the rule does exist:
> > > > https://www.kernel.org/doc/html/latest/process/coding-style.html#inline-assembly
> > > > 
> > > > "don’t use inline assembly gratuitously when C can do the job. You can and should
> > > > poke hardware from C when possible"
> > > > 
> > > > In this case here, please explain why exactly memcpy with smp_wmb barriers and
> > > > or WRITE_ONCE code combined couldn't solve it.
> > > > 
> > > > Also, please explain how exactly vmovdqu guarantees the atomicity promised by
> > > > the commit message. On a quick search here my take is that for this 128 or 256
> > > > bits, atomicity is not guaranteed.
> > > 
> > > I don't think cache atomicity is what we're after here—rather, it's vCPU
> > > halting atomicity.
> > > 
> > > Consider the following case:
> > > b++ = XY_CTRL_SURF_COPY_BLT;
> > > b++ = addr;
> > > 
> > > If the vCPU is halted during the instruction that stores
> > > XY_CTRL_SURF_COPY_BLT, the address will be invalid. The GuC executes the
> > > batch buffer (BB) that is being programmed as part of the VF save. This
> > > will clearly cause the BB to hang due to a page fault on the copy
> > > command.
> > 
> > okay, perhaps this is what is getting me confused most
> > what I don't understand in the flow is: why GuC is already
> > executing it or going to execute it while you are going to a halt when
> > writing the command to the buffer?  and not writing to the buffer first
> > and then sending it to the exec queue?
> > 
> 
> It how this feature was architected, will send over SaS link of the list.

I'm confused by this too.  At the point we're filling in the
batchbuffer, the GuC isn't aware of the batch at all yet as far as I can
see.  In xe_migrate_copy(), we've called xe_bb_new() to allocate a new
batchbuffer, and then we start calling emit_* functions to poke
instructions into that buffer.  At the point we call
xe_migrate_ccs_copy(), the hardware still isn't aware that this buffer
exists, so it shouldn't be possible for it to start executing.  Only
later on when we eventually create a job for the batchbuffer (after
we've finished emitting all of the commands) should it be possible for
the hardware to start executing this.

If there's some other *future* changes (not present in the driver today)
that change the design such that we allocate a batchbuffer and tell the
GuC it's free to start executing it, but only fill in the contents after
that point, then that needs to be clearly explained in the commit
message.  But that also sounds like an fundamentally racy design, so I'm
not sure why vCPU would be the only situations we'd be running into
problems.


Matt

> 
> > > 
> > > If the entire XY_CTRL_SURF_COPY_BLT is stored via an AVX instruction,
> > > then either the GPU entire instruction is written or none of it is. I
> > > believe vCPU halting guarantees that a CPU instruction is either fully
> > > executed or not at all—regardless of how many micro-operations (uOPs) it
> > > decodes into. If this guarantee does not hold, then the entire
> > > architecture of CCS save/restore on PTL is fundamentally broken which is
> > > always possible.
> > 
> > Okay, this is guaranteed. I mean, the vCPU won't get halted in the middle
> > of the vmovdqu nor vmovups. only before, between, or after them.
> > 
> > But is this uncached and/or coherent? isn't there really any possibility that
> > the command finished, but GuC mid-flight executing things aren't still
> > seeing different cachelines?
> > 
> 
> The GuC won't start executing until vCPU unpause on the save flow.
> Restore flow is bit more tricky as vCPU are live when this happens but
> we can W/A that race in software I think. That part is not in this
> series.
> 
> > > 
> > > > 
> > > > So, imho this patch is introducing a unmaintainable, complex, and fragile code
> > > > that is not even doing what it is claiming to do. But I will be glad if someone
> > > > can challenge this and prove me wrong.
> > > > 
> > > 
> > > Let me know if the above makes any sense.
> > 
> > Okay. But how to handle cases where AVX might not be available? really not needed?
> > 
> 
> This iGPU feature for PTL so shouldn't be an issue as PTL has AVX
> instructions.
> 
> Matt
> 
> > > 
> > > Matt
> > > 
> > > > Thanks,
> > > > Rodrigo.
> > > > 
> > > > > 
> > > > > Matt 
> > > > > 
> > > > > > +}
> > > > > > +
> > > > > > +static void emit_atomic(struct xe_gt *gt, void *dst, const void *src, u32 size)
> > > > > > +{
> > > > > > +	u32 instr_size = size * BITS_PER_BYTE;
> > > > > > +
> > > > > > +	xe_gt_assert(gt, instr_size == SZ_128 || instr_size == SZ_256);
> > > > > > +
> > > > > > +	if (IS_VF_CCS_READY(gt_to_xe(gt)) && static_cpu_has(X86_FEATURE_AVX))
> > > > > > +		memcpy_vmovdqu(dst, src, instr_size);
> > > > > > +	else
> > > > > > +		memcpy(dst, src, size);
> > > > > > +}
> > > > > > +
> > > > > > +#define EMIT_COPY_CCS_DW 8
> > > > > >  static void emit_copy_ccs(struct xe_gt *gt, struct xe_bb *bb,
> > > > > >  			  u64 dst_ofs, bool dst_is_indirect,
> > > > > >  			  u64 src_ofs, bool src_is_indirect,
> > > > > >  			  u32 size)
> > > > > >  {
> > > > > > +	u32 dw[EMIT_COPY_CCS_DW] = {MI_NOOP};
> > > > > >  	struct xe_device *xe = gt_to_xe(gt);
> > > > > >  	u32 *cs = bb->cs + bb->len;
> > > > > >  	u32 num_ccs_blks;
> > > > > >  	u32 num_pages;
> > > > > >  	u32 ccs_copy_size;
> > > > > >  	u32 mocs;
> > > > > > +	u32 i = 0;
> > > > > >  
> > > > > >  	if (GRAPHICS_VERx100(xe) >= 2000) {
> > > > > >  		num_pages = DIV_ROUND_UP(size, XE_PAGE_SIZE);
> > > > > > @@ -673,15 +707,23 @@ static void emit_copy_ccs(struct xe_gt *gt, struct xe_bb *bb,
> > > > > >  		mocs = FIELD_PREP(XY_CTRL_SURF_MOCS_MASK, gt->mocs.uc_index);
> > > > > >  	}
> > > > > >  
> > > > > > -	*cs++ = XY_CTRL_SURF_COPY_BLT |
> > > > > > -		(src_is_indirect ? 0x0 : 0x1) << SRC_ACCESS_TYPE_SHIFT |
> > > > > > -		(dst_is_indirect ? 0x0 : 0x1) << DST_ACCESS_TYPE_SHIFT |
> > > > > > -		ccs_copy_size;
> > > > > > -	*cs++ = lower_32_bits(src_ofs);
> > > > > > -	*cs++ = upper_32_bits(src_ofs) | mocs;
> > > > > > -	*cs++ = lower_32_bits(dst_ofs);
> > > > > > -	*cs++ = upper_32_bits(dst_ofs) | mocs;
> > > > > > +	dw[i++] = XY_CTRL_SURF_COPY_BLT |
> > > > > > +		  (src_is_indirect ? 0x0 : 0x1) << SRC_ACCESS_TYPE_SHIFT |
> > > > > > +		  (dst_is_indirect ? 0x0 : 0x1) << DST_ACCESS_TYPE_SHIFT |
> > > > > > +		  ccs_copy_size;
> > > > > > +	dw[i++] = lower_32_bits(src_ofs);
> > > > > > +	dw[i++] = upper_32_bits(src_ofs) | mocs;
> > > > > > +	dw[i++] = lower_32_bits(dst_ofs);
> > > > > > +	dw[i++] = upper_32_bits(dst_ofs) | mocs;
> > > > > >  
> > > > > > +	/*
> > > > > > +	 * The CCS copy command is a 5-dword sequence. If the vCPU halts during
> > > > > > +	 * save/restore while this sequence is being issued, partial writes may trigger
> > > > > > +	 * page faults when saving iGPU CCS metadata. Use the VMOVDQU instruction to
> > > > > > +	 * write the sequence atomically.
> > > > > > +	 */
> > > > > > +	emit_atomic(gt, cs, dw, sizeof(dw));
> > > > > > +	cs += EMIT_COPY_CCS_DW;
> > > > > >  	bb->len = cs - bb->cs;
> > > > > >  }
> > > > > >  
> > > > > > @@ -993,18 +1035,27 @@ static u64 migrate_vm_ppgtt_addr_tlb_inval(void)
> > > > > >  	return (NUM_KERNEL_PDE - 2) * XE_PAGE_SIZE;
> > > > > >  }
> > > > > >  
> > > > > > -static int emit_flush_invalidate(u32 *dw, int i, u32 flags)
> > > > > > +/*
> > > > > > + * The MI_FLUSH_DW command is a 4-dword sequence. If the vCPU halts during
> > > > > > + * save/restore while this sequence is being issued, partial writes may
> > > > > > + * trigger page faults when saving iGPU CCS metadata. Use
> > > > > > + * emit_atomic() to write the sequence atomically.
> > > > > > + */
> > > > > > +#define EMIT_FLUSH_INVALIDATE_DW 4
> > > > > > +static int emit_flush_invalidate(struct xe_exec_queue *q, u32 *cs, int i, u32 flags)
> > > > > >  {
> > > > > >  	u64 addr = migrate_vm_ppgtt_addr_tlb_inval();
> > > > > > +	u32 dw[EMIT_FLUSH_INVALIDATE_DW] = {MI_NOOP}, j = 0;
> > > > > > +
> > > > > > +	dw[j++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | MI_FLUSH_DW_OP_STOREDW |
> > > > > > +		      MI_FLUSH_IMM_DW | flags;
> > > > > > +	dw[j++] = lower_32_bits(addr);
> > > > > > +	dw[j++] = upper_32_bits(addr);
> > > > > > +	dw[j++] = MI_NOOP;
> > > > > >  
> > > > > > -	dw[i++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | MI_FLUSH_DW_OP_STOREDW |
> > > > > > -		  MI_FLUSH_IMM_DW | flags;
> > > > > > -	dw[i++] = lower_32_bits(addr);
> > > > > > -	dw[i++] = upper_32_bits(addr);
> > > > > > -	dw[i++] = MI_NOOP;
> > > > > > -	dw[i++] = MI_NOOP;
> > > > > > +	emit_atomic(q->gt, &cs[i], dw, sizeof(dw));
> > > > > >  
> > > > > > -	return i;
> > > > > > +	return i + j;
> > > > > >  }
> > > > > >  
> > > > > >  /**
> > > > > > @@ -1049,7 +1100,7 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
> > > > > >  	/* Calculate Batch buffer size */
> > > > > >  	batch_size = 0;
> > > > > >  	while (size) {
> > > > > > -		batch_size += 10; /* Flush + ggtt addr + 2 NOP */
> > > > > > +		batch_size += EMIT_FLUSH_INVALIDATE_DW * 2; /* Flush + ggtt addr + 1 NOP */
> > > > > >  		u64 ccs_ofs, ccs_size;
> > > > > >  		u32 ccs_pt;
> > > > > >  
> > > > > > @@ -1090,7 +1141,7 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
> > > > > >  	 * sizes here again before copy command is emitted.
> > > > > >  	 */
> > > > > >  	while (size) {
> > > > > > -		batch_size += 10; /* Flush + ggtt addr + 2 NOP */
> > > > > > +		batch_size += EMIT_FLUSH_INVALIDATE_DW * 2; /* Flush + ggtt addr + 1 NOP */
> > > > > >  		u32 flush_flags = 0;
> > > > > >  		u64 ccs_ofs, ccs_size;
> > > > > >  		u32 ccs_pt;
> > > > > > @@ -1113,11 +1164,11 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
> > > > > >  
> > > > > >  		emit_pte(m, bb, ccs_pt, false, false, &ccs_it, ccs_size, src);
> > > > > >  
> > > > > > -		bb->len = emit_flush_invalidate(bb->cs, bb->len, flush_flags);
> > > > > > +		bb->len = emit_flush_invalidate(q, bb->cs, bb->len, flush_flags);
> > > > > >  		flush_flags = xe_migrate_ccs_copy(m, bb, src_L0_ofs, src_is_pltt,
> > > > > >  						  src_L0_ofs, dst_is_pltt,
> > > > > >  						  src_L0, ccs_ofs, true);
> > > > > > -		bb->len = emit_flush_invalidate(bb->cs, bb->len, flush_flags);
> > > > > > +		bb->len = emit_flush_invalidate(q, bb->cs, bb->len, flush_flags);
> > > > > >  
> > > > > >  		size -= src_L0;
> > > > > >  	}
> > > > > > -- 
> > > > > > 2.51.0
> > > > > > 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
