Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C11FCCCD1AB
	for <intel-xe@archiver.kernel.org>; Fri, 24 Oct 2025 04:09:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8333210E9C7;
	Fri, 24 Oct 2025 04:09:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UOExs4NK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9291010E9C7
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Oct 2025 04:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761278968; x=1792814968;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=DoLaE0Fvs2jTar8UISehH3zpihHeRclETxYW3u3qDC0=;
 b=UOExs4NKYoGAJASUWYJhrjUnDb2Lu6eZo3xvepXDtbnuWNzRIyu5g1QQ
 arYnX0KMSTgTbu62dSdwsIjzNcX2stze03nSwDoPPdSjnS9BN2WYkhRSV
 o8XX0JlSc9YXqurAnX0VvoWBo0iWnL2ayEfn2jwG+n5g2w29Yqd6UfaRU
 g+9qKL/Wrp0TKWsUl0r5PsX6JDB+NYi4BDb1SdHCKkBJJqzkkbUI0kyuN
 lcEBdBwWtywV3uDSzQRO2E7HziDE8T/SggEDXNuDaCvlqCVV28Rt4OYPW
 lWDr5qqjky7A5PbHMVab3zIQt19uKax3GME9WU5ZZKqtN8YEWaJVlL1lq A==;
X-CSE-ConnectionGUID: nk4BUO8dRdS7puuh8ZSwxQ==
X-CSE-MsgGUID: bpqyy60OSgabbBVBtjMAtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63162919"
X-IronPort-AV: E=Sophos;i="6.19,251,1754982000"; d="scan'208";a="63162919"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 21:09:28 -0700
X-CSE-ConnectionGUID: ofh7J7hDTF6w4zhW95UVGQ==
X-CSE-MsgGUID: 7ojjB4cLSbKJ3x/gap8hFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,251,1754982000"; d="scan'208";a="188392100"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 21:09:28 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 21:09:27 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 23 Oct 2025 21:09:27 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.46) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 21:09:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ItBJlNgsO9VGDFENBXZnjvLCa43BJsi7ppLGj+4VJ43ZFyl5F9FZO9Gz89i+dHhgPRdYYGSszUDXtQgCSEXR0PqKiFfE/By93UgR2ByLvwJjm+pgdtPEwJ8hEGvjAcKyhwRF3ii7n5h4To/qLdCZBI4lq3/bb96SgW99zH9IH6osfIZlWXDvF7EP2VAobI8tDN/3HxyNZVoLOYbfiiu0XvNsszGZyzxlu0qrLhsvXGljJbHLRWbqDwsrjK0x189ftDb5eczAjBj1OvD7OAPg/WRXNyBfHu8mgoLEfcd6rJJzfAmNMvLmJz3EAckm8Sd3CsDfq7Zcwp9Tv0xxTgCuig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9MvEaKApFLkc7eXCrxt2mUQveLvoEV21thDH5E+vphA=;
 b=wsQb4UQMZqREJ6VZisB8YZFxkk7YHDV3KEFcceEnHDcxoPCl3gRL8CyJV0JS9tQHIovRpYMBkCUWO43tv2LB2s1sIg/rjkLD/+ks9azPLE+ZUFXrhti9zGphpaPrStou61Xlg4CFqM89l9rgHVjMWNCqIV784zti9kPgN7mIEMRE5PM7E6TDMZZiuSRYSXX4hNYpXzs1Vy3FgiZzEXexgO1CwM30aBu0n8mPCg9hPPcfLHUmRWN3WeEQyqrXuIHL9J5nTgAP6JDVAZb49kajmDhQdnsrUXtHHj/huVEcX4qs31bztXbBJezYD1T2oNqz22GI0+QsxojlxXILP+8Fxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by PH7PR11MB6930.namprd11.prod.outlook.com (2603:10b6:510:205::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 04:09:25 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541%2]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 04:09:25 +0000
Message-ID: <30bed83f-9730-43fe-a81a-719057d03e33@intel.com>
Date: Fri, 24 Oct 2025 09:39:18 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/vf: Fix up GGTT on S4 resume under SR-IOV
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Michal Winiarski <michal.winiarski@intel.com>,
 Tomasz Lis <tomasz.lis@intel.com>
References: <20251023064610.4499-2-satyanarayana.k.v.p@intel.com>
 <aPrpPxQxUq/M/14S@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
In-Reply-To: <aPrpPxQxUq/M/14S@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0213.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ab::11) To LV3PR11MB8695.namprd11.prod.outlook.com
 (2603:10b6:408:211::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8695:EE_|PH7PR11MB6930:EE_
X-MS-Office365-Filtering-Correlation-Id: d210f200-5bc6-453c-ae85-08de12b31e1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d1JHQmtnc3gxaWdUYXJLV1c1ektGQ0tpcXNJcHhQY0NRYWRmRkE0dEs5QWUx?=
 =?utf-8?B?aGRPNkJ3V1gzWHBKaTRiVEQ3cHJtTjE3TmlmeG5KYm00Y0VRbElTUHNIcVpk?=
 =?utf-8?B?dEFwMS9Jck9BbHR6VTh3UTFsT3BJQzBCOG53V09VRXZuRUxqcVc5d2p6anA2?=
 =?utf-8?B?WnJwSGI3VWtSOUF3cTB3YVFSc3RSQ3E2TlZ1WGtEM2tobDZhZ0V3aWQrQUNH?=
 =?utf-8?B?NjM0SXB6Q2NWY3d0T3k0Nk45M3NPOTd2YjRycm1sN3lvNGdVR2VTSWQzS0lM?=
 =?utf-8?B?V21JMmhBaGRnTjJjMjFaNGYyTzQ5dlZUcDgxVUc2OWpwTkoyMm0xTWp6MTBp?=
 =?utf-8?B?RzFvVnhNYW1BUThSUEM2OTBwWFl5aU1qbmdPQzNLQVRHVkphc1FaWTREa25S?=
 =?utf-8?B?R2pJeHlFYlZucGtkNmgzYm9ITHY4eDN1WERsODZ5NlZaekloSHNqazBhMnRx?=
 =?utf-8?B?cFB5K3BwSHdyN25KaW5hWENmOE5heWNtWFJPV0o3cURRV1ZzSzFCMzJKZmww?=
 =?utf-8?B?eVFMeEFyL2p2czI4T2tnbjZnQUQ2QndjU3VUaE5PVUF2YWE0NVVUbmdpY2dz?=
 =?utf-8?B?QVBVZ0FFZGh3ekxrQ2ZJSHptQlI4QW5uSXZGYnVueUtwV0theVladS9JcUNu?=
 =?utf-8?B?WDRJbVdUWXdsYyt2NkVsemlUNmZWRzJLVWRBTHZBd21zc2VuR3NRbTR5ekpJ?=
 =?utf-8?B?TjcyUDAwdzZQWmVpRlk4NlRpUThscWpIMGxEMXI4NUtxMDNkZEhkOXA0MVE5?=
 =?utf-8?B?ZzlHLzd6OHdIVzlldHFmVW1LL0IwMXFOS1U5Ukw0NDV6TDU1RitJSXBWSCt5?=
 =?utf-8?B?bHVaMXNQNk9UdTRoWnROWS9kMFJLYlV6VXZudEFqZUxOQ214RUdIMmtGVlhn?=
 =?utf-8?B?UFN0NGxZZG0zTnhySDVDWC9IK3VBVXViUEx3T3FMR0VLVHdBdnBUQ2pjTGtF?=
 =?utf-8?B?b2d3ZFlsT2xkdjdlVzFFRGtLZTN2RXB6RzQ3WnVwZ2ZrVEhCc3lqQUJJUHdN?=
 =?utf-8?B?NlBxWFMwb2c4blhXUGltWWUvWUlpYzc0bmtqR2RDUHRFdkp4RnJDREhDbTJ1?=
 =?utf-8?B?K1EvSGIrSUpIMTFNZGdWM1hHZGlvTnhJM1g3Mkt4eURBR2RHRGlyWnlPRDV0?=
 =?utf-8?B?eXQ1YjRMZVVWYVV0alBoUG4vWmVrQ0JrOW92ZkRiaUhBK3dJM0RxS1FwUGI1?=
 =?utf-8?B?V3B1NnlrK3VSUUhoZWxTeUJSVVcxZU42SVcyRHBUdEd3N1gzclQ3Tmp1TnMr?=
 =?utf-8?B?L1ZmajBJNnNTMGJ5QlVEYkdmT1NVT2tHaTdEUHl3b3daallCb3VqTlpnM3VM?=
 =?utf-8?B?MHpROHUxMkxVR1FabmN5bnNQV3JTaWpFUStiWkVhNDlzUGVPUk8wRTczYjdO?=
 =?utf-8?B?OFRUdDl2RTJjL2RqU2JnSHpoMVdMc0wza1ZYUnp6SU8xOGx0ekRlNjBDRmtZ?=
 =?utf-8?B?YnIyL1gyNVN3Wk9ySHluSWd6dURlUk9iY3F1bHVFekg1Um9IUlVFTjBzQUc1?=
 =?utf-8?B?NFFDdnFyZGNKZjJ6Y2Q1Wk4zN1pxVzRaMzgyU1JwVkg1akNuUWFOQXZFNktn?=
 =?utf-8?B?aTUrKytQWjNtUmg3VkQ5ZHNvQXBZU1p4ZXBIbnVvSlFiWmZrT3pnMjFwektm?=
 =?utf-8?B?OUZhVkgvc1JNd3FIM1VoY0pnTThzMFcwaHR4TGQySk9PMjZSL2YrNmlGZVlL?=
 =?utf-8?B?eVlvNXpUbWRLNkdVakVlNHZjajZRL3NLWVp1ajJtdGdZUzRWRzQzTXFwYzJN?=
 =?utf-8?B?c1lydnRqZ0dLSnpDWlRLMlBMR1RqTG1hdXE1N2RBMXdYYi9OTjhFZGgzMVZW?=
 =?utf-8?B?M3dmNEp1S045YmN1d21oUUw1dEw3UHlvd1M4T1hqS05DZE9Ta3FuMlZoWk9t?=
 =?utf-8?B?TmVFYVIwS2N4N3ovVS9EU1J0RTQyOGQyMmZBOUpyWHBwdkwydy9xdGlTS1BG?=
 =?utf-8?Q?8ltvBR5o8YIu0fr0llhISfVERqvJ5j3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8695.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RWdSUTd5V2loREQwZytPZ1hPUklyZGNTSEdXSnByZGhYVVMyYTlMWUllMTJG?=
 =?utf-8?B?ZE1OTHNadlRvdHg3OVJJZUM1NllNcktBYzlyZUxud3JyUGRkcVFnVnhiRG9n?=
 =?utf-8?B?UjdEcXVVVURITjZmR1poNXdvSkVRWFllZGVWckRUQUNBU3hUc2l3a0E4MzlV?=
 =?utf-8?B?elRkUm9qVFFxcWdraHA2NmNTcUdsWUtobk8wQ2xwaU9CVDgrZExhSUN4UmRY?=
 =?utf-8?B?bU5ZR0JzNjlYTHk3Sm5NOTMrekNuZmpiNmkxNTdwa2huNXNxbmR2Wlhpd0sz?=
 =?utf-8?B?V0pKa2Z5ZUIwQSswck03SE1IVW1KMHh5Uy9ueXBxdGw5RmxTbllaSVhLV2Na?=
 =?utf-8?B?ZytWSkd4L0dmako4a2JKS2dwVWRwZUFlVzg3Vk5uUHdoMWdIa0luMTNtRnEx?=
 =?utf-8?B?KzZtakhqTGxHSGQ1ZlJrR0hsNitvV3FIMDk3dlFZKzRuRVJycG5zeVJzZVpR?=
 =?utf-8?B?elY5dUlaYVRBV3hLWXJOektDakRyOGF2REhJSWg1UzRzc0h3MXhIbDFUZmxU?=
 =?utf-8?B?eWpZWndERWQxZEx5RTZZeVg0TEowZXVYclRtWjl4NVNPdzE4bkJ1UlIvYTE2?=
 =?utf-8?B?MUNubzRGWXNiblR4aVZXRE9WRERCd21jbGNRaERXcnFxdTJOdXFFcTdNOTcw?=
 =?utf-8?B?Y3AzQ3l0TG5qaE43b3lGN2ZER3dzSmtxbnVKeVJLdEY1S2JnVER4QmxGUHM0?=
 =?utf-8?B?TDVEaTJ5eGtxUjlCdE1kN2p2WWhqcFAxbTJCaVorSVJmR0h3UlBpMUxJcnFJ?=
 =?utf-8?B?OEI3Mml3dDdaZFlKOEsrSW4ybC83ZUVyQjY1Z1J1TGN2aE5vMnhoYmo2N2JE?=
 =?utf-8?B?c0pBZDlKUkxjVUp5a0VjVHhkNkdWVklBcDNoK1pTZWVFeG1zU0pUak9TRmQ4?=
 =?utf-8?B?dnZKRFJqNEp0cVY2ckxlMmZpUVYzZlJRNlNiQWl2elcxcDlINlMzOVhBSStN?=
 =?utf-8?B?OHZXL1VQNTVKNXRuUlhiRDlpakNLR2N4Ky92SW5IdG80VHI4OFNxODFFRzlT?=
 =?utf-8?B?TmNIVzdPQ3UxNlVZMVJUMHVpZjJhS3VoTWN6T3VGRWhMZnVsWlVNb0Q4UEdC?=
 =?utf-8?B?MC9pRnUvUE5KRzBNL3ErR3NoZ2hKWjBnNHJVK1pJSy9hbHNMYmU3aDdWVlZr?=
 =?utf-8?B?U2dkeUNnL3IreThkNUF5ZG1kU01KeUlqdGJJQXhFWHFJMmNTODU0SDV0TUxB?=
 =?utf-8?B?cjlYZXNNR0pDaEZKYlQveUN2bjg4RVVVRHpMU1pWcjFCUFNIcy9xUTJidTBW?=
 =?utf-8?B?L0xpZWZnei9oY2wxNEJOZXp3TnZ0SW90ZjVva0x6MURWWitQaHJjUjl6cm12?=
 =?utf-8?B?RWZRK0JmcG9JR2FHMVdpaDNuakppQmY1aEg5WUlwdi82Snpic3JSRHRqdnRP?=
 =?utf-8?B?V3ErNUUrZURHUFFXQjdEWjNGZ2h5U1BzMlA1RXUxQUxMbjNTMHIzdnJjdWdk?=
 =?utf-8?B?b21pelo4MkRvcHNBOUFyUnNWOHVnS2NPaC9ZQ040M2pmZlhIM0lITUJlVWNy?=
 =?utf-8?B?YjVERFEvL2UwVWxOT0tPallWZ0w4ZUh3TWtRbGFpWDA1SXFnOUQ1RnBpY25F?=
 =?utf-8?B?bDNzb1BLcUhrM3pMdEZZSXdwZGU5RWYzQXRIVTZSOUNMZ1RxSXVoVnd4c0NG?=
 =?utf-8?B?cEpDZ1BuSWVtN2R3OXZBdVU0SU81dzd0dkpaYjFVV3E4Qlg0SitUeUdpUWNs?=
 =?utf-8?B?Z3NYQlZyUHVVNVJZOG01L21rdjVQM0ZRMEk2cEQ5eEJ2WkRKdFhSQTNYT09n?=
 =?utf-8?B?Z2hVVkxEQXFaaENqaGdNWTVBRVRnVGMxdjRrT3Nzcjk2VkpUOEJPQzBlTVlp?=
 =?utf-8?B?VWtxRlpiYzhBV0p5emVjZWNUUFF5ZmdLWGh6bk1rK2lKc2tpaUUxajlqRDdn?=
 =?utf-8?B?MTlpRzN1OXNtZklCaVFBc2pUMTdBcUJRMVFyWU9ubmRITUdRamFLUHpNenhQ?=
 =?utf-8?B?M0VYK1FUeFluWTdicUpTZFlyNXpNUGxadHplVG1oRUtxZkRZWEgxcktPZytB?=
 =?utf-8?B?RjlyM2RsU0NPMW9OWkpkV2FrdTJidEtRZFpKckI3OGZsd09lR1ltVzVVRFBa?=
 =?utf-8?B?a21Wbmw2WDRVelROZUdQR015TnlBVUhVc0JoeXZXQWNicS9LaXFHc1gvMWVi?=
 =?utf-8?B?SjJQVWNxZzh5RGFDalc3VDlZNWt3a3JOdDdtdTNCUFdOaVg3V0laMUZTVzQ2?=
 =?utf-8?B?WHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d210f200-5bc6-453c-ae85-08de12b31e1b
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8695.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 04:09:25.1137 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oD1lARwe/ugO22jq1i9R3YfEjmi9ukU7npAhJHF4ASZ+4uLslD1EKoVR8nSKu6wAqMybR7UwSiLhEX1EPzq312r4xms+UIXe+n2+XafTSlE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6930
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



On 24-10-2025 08:19, Matthew Brost wrote:
> On Thu, Oct 23, 2025 at 12:16:11PM +0530, Satyanarayana K V P wrote:
>> With SRIOV enabled, while resuming from S4, there is a possibility that,
>> the VM might have been suspended on one VF and resumed on another VF.
>> Since GGTT space is not virtualized, we need to fixup all the GGTT
>> references while resuming.
>>
>> While resuming from S4, check whether the GGTT space is same or not for
>> the given VF and fix-up if it is different.
>>
> 
> Before I really think about if this will work - quick question, have you
> been able to test this out and see GGTT shift after S4 exit? Also with
> running workloads?
> 
> Matt
Hi Matt,
  Yes. I have checked it with idle system and by running basic 3D 
workload glxgears. They work fine.
-Satya. >
>> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Michal Winiarski <michal.winiarski@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Tomasz Lis <tomasz.lis@intel.com>
>> ---
>> V1 -> V2:
>> - Rebased to latest drm-tip.
>> ---
>>   drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 32 +++++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_gt_sriov_vf.h |  1 +
>>   drivers/gpu/drm/xe/xe_pm.c          | 12 +++++++++++
>>   3 files changed, 45 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>> index d0b102ab6ce8..38528495478f 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>> @@ -1375,3 +1375,35 @@ void xe_gt_sriov_vf_wait_valid_ggtt(struct xe_gt *gt)
>>   					       HZ * 5);
>>   	xe_gt_WARN_ON(gt, !ret);
>>   }
>> +
>> +/**
>> + * xe_sriov_vf_fixup_ggtt - Fix up GGTT on resume from S4.
>> + * @gt: the &xe_gt.
>> + *
>> + * This function shall be called only by VF.
>> + * Main GT and media GT share the same GGTT space. So, fixups are needed
>> + * only for Main GT.
>> + *
>> + * Returns: 0 if the operation completed successfully, or a negative
>> + * error code otherwise.
>> + */
>> +int xe_gt_sriov_vf_fixup_ggtt(struct xe_gt *gt)
>> +{
>> +	int err = 0;
>> +
>> +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>> +
>> +	if (gt->info.type != XE_GT_TYPE_MAIN)
>> +		return err;
>> +
>> +	xe_guc_comm_init_early(&gt->uc.guc);
>> +	err = xe_gt_sriov_vf_bootstrap(gt);
>> +	if (err)
>> +		goto out;
>> +
>> +	err = vf_post_migration_fixups(gt);
>> +
>> +out:
>> +	return err;
>> +}
>> +
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>> index af40276790fa..17004223f33a 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>> @@ -39,5 +39,6 @@ void xe_gt_sriov_vf_print_runtime(struct xe_gt *gt, struct drm_printer *p);
>>   void xe_gt_sriov_vf_print_version(struct xe_gt *gt, struct drm_printer *p);
>>   
>>   void xe_gt_sriov_vf_wait_valid_ggtt(struct xe_gt *gt);
>> +int xe_gt_sriov_vf_fixup_ggtt(struct xe_gt *gt);
>>   
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
>> index 210298c4bcb1..68bf08ae62f6 100644
>> --- a/drivers/gpu/drm/xe/xe_pm.c
>> +++ b/drivers/gpu/drm/xe/xe_pm.c
>> @@ -19,6 +19,7 @@
>>   #include "xe_ggtt.h"
>>   #include "xe_gt.h"
>>   #include "xe_gt_idle.h"
>> +#include "xe_gt_sriov_vf.h"
>>   #include "xe_i2c.h"
>>   #include "xe_irq.h"
>>   #include "xe_late_bind_fw.h"
>> @@ -248,6 +249,17 @@ int xe_pm_resume(struct xe_device *xe)
>>   
>>   	xe_display_pm_resume_early(xe);
>>   
>> +	/* GGTT fixups (if needed) have to be done before restoring BOs */
>> +	if (IS_SRIOV_VF(xe)) {
>> +		for_each_gt(gt, xe, id) {
>> +			err = xe_gt_sriov_vf_fixup_ggtt(gt);
>> +			if (err) {
>> +				drm_err(&xe->drm, "GGTT fixups failed with %d\n", err);
>> +				return err;
>> +			}
>> +		}
>> +	}
>> +
>>   	/*
>>   	 * This only restores pinned memory which is the memory required for the
>>   	 * GT(s) to resume.
>> -- 
>> 2.51.0
>>

