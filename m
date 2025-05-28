Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74141C54F30
	for <intel-xe@archiver.kernel.org>; Wed, 28 May 2025 03:22:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E30588EA1;
	Wed, 28 May 2025 03:22:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P8E3ZC2e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E0D788EA1
 for <intel-xe@lists.freedesktop.org>; Wed, 28 May 2025 03:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748402557; x=1779938557;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=J8IbXMWwYKezSZ/vLShrzq0beQIfnyTADy3sObZsixA=;
 b=P8E3ZC2eplDG9HtxPbeD8SafiIvky1YEQZTAJWNzvsDEj9hsSsNP3TWK
 USVWxo6a8bezeygfKBIZoxv6C+laOo6xDoDNqerxPqT5u+shfaKEzxupA
 6cv18doxFe2rKgjbQyfaNYXz1V3Fb2coY+gQCE5YI8DHDrdySEcQAPVzD
 /AHu/ZX78B39o+ym48lCqWluxVHfG3O7maEkxDuPRYpgcHc7er+pXDZ4L
 WjRXOn/FjdEEU6y6Pid/gjJC3ctMcPPIeB0jb9+61Y5RFS8JRzleJ7t0v
 81d3y1jAFlgMnD/ScH/1SB3GHPHF0Nk6ZqfU5iqzUqzC7GEh6S0pUJjuR Q==;
X-CSE-ConnectionGUID: ZHQPN7+WTVauLrjtpV4IgQ==
X-CSE-MsgGUID: Ufd5TD0+TX6hSInIhssTNQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="50472679"
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; d="scan'208";a="50472679"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 20:22:36 -0700
X-CSE-ConnectionGUID: yVqp3+axRzWcTHKO1ImdLQ==
X-CSE-MsgGUID: Suhox866Q8G59HSleR3HVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; d="scan'208";a="148371024"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 20:22:36 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 27 May 2025 20:22:35 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 27 May 2025 20:22:35 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.63)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 27 May 2025 20:22:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nIInk5QRzuiDVVVA04logcueBkPWTUeB607Y0z2qkyyv6CwblJudN46OKaCgbD1E4RyvHmaQ9yV1VaeTT+EjrRfSSWmmYEX55E3lhk678PhjpgDWH+U7zEWb3Iw0ZpcBMw4tOdZyqw9FoSPUafBQ0W2CnDn+xRj1AcaAa6dnnKb0dqFTR/7pyzUh9WzFBhIH7GgQdR+NFGGe8zWnJcZOlyvq3XMO1JNQKLpGtvSKb6DlrDZbHsrBmrIMVTYPRwZhozpX5Up2WuXptwgBXg9MzyqJRdlIHti/i7tEQCoMN1VMLgWSPIn9pU22elkLRrG1xJ4SKmlmdRGcReOpEfAOVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WU8kxry1aAjf0tK9iRGfSebxDeF4hTh5/q3CKX3xCwk=;
 b=acGYmqppFgCFXzc7JQgd9rxdk28zp2KMFLNJsFOWeKyY1MflWXWJJYj7suLmXftWdms2OKTQzQv78D2vCdw415v8ilgfyS7K7f4SURPrEHvVOPfMCIEGF/FaCi9Kv6bumvUIj2z84wviFC2+KZxORf4zHDoj43DG1Lp9nlPK5fKDSvSMU/ErZ9OXdngdJw/kDTuJFaD5yd5KmOsVP2l27uv7PVK1BWYSNhKxz0Q+1bMNyxZqwn37AfMgGG/buVT1Vu0PdEGMuTYxwwqpp6GPQ3YtX0XmyHPW8RqZ4d0QzDTYSN70KV61vpFbV7VAl7wSyIMGAJNWfCwRiXypPTLWMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Wed, 28 May
 2025 03:22:32 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8769.021; Wed, 28 May 2025
 03:22:32 +0000
Date: Tue, 27 May 2025 20:24:02 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, =?utf-8?Q?Micha=C5=82?= Winiarski
 <michal.winiarski@intel.com>, Tomasz Lis <tomasz.lis@intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Subject: Re: [PATCH v4 1/3] drm/xe/vf: Create contexts for CCS read write
Message-ID: <aDaB0r2g+0MfJ2hj@lstrano-desk.jf.intel.com>
References: <20250521141141.17572-1-satyanarayana.k.v.p@intel.com>
 <20250521141141.17572-2-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250521141141.17572-2-satyanarayana.k.v.p@intel.com>
X-ClientProxiedBy: MW4P220CA0002.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::7) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY8PR11MB7828:EE_
X-MS-Office365-Filtering-Correlation-Id: f14127a3-26c2-4b0a-0219-08dd9d96e1f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VEt6eU5BcHNuZWVsWU81RUVMMDFwTlljbzVGemNmT1NKUlpyNEF3dnlJSU9n?=
 =?utf-8?B?NkdiMk5VYXl4STVZSHhJUThvY1lQcEY4dHArbXJSVzQ2ZDZNdnVPamw2K1BN?=
 =?utf-8?B?SWdsZFp6Y3RSSmlXY3o5K2dIaEVvUEFpdm1RR05XZjV3OStuOWpBVXJxT1Bn?=
 =?utf-8?B?SmM0Rzh4WW9uWHowV0NkSU5tbDUwZ1VGMUJjVW9URXRmekprZHlyRGh5b0Vl?=
 =?utf-8?B?NDFVL3cvQWdLeXJJRDZNMnZzSFRIQS84TWFDWXZIMndRVVhQQ0tvTDhmZjJt?=
 =?utf-8?B?V1Y5THlsNDl1KyswY1J1NkdQWWV3R2R2UFRud014c3VmZjRicVF5ajYvR1A1?=
 =?utf-8?B?TEl3cmZkR2t1OEp4cXdVRzVMUEFob3hrWTJqbDcrRExnY1h4Z3FXRTduck1F?=
 =?utf-8?B?SEdOSmpFdVcyWWhnY0Y4bXAwNy8wLzRESUJSdGEzOCtyYm15eWJzdjl6VTlN?=
 =?utf-8?B?NlB2WGlZNCtRWDZjY05qVlk0MngydDJCRWpud1c2NVJRSVh0TWVxbVNxeWwz?=
 =?utf-8?B?Q3Z3eGsyRDBpN1BkVXc2YzBxK09ML0hYWUh3bm1FYklza0h2a3lEU0pXVldQ?=
 =?utf-8?B?ZVR2SmFJRkxoR2ZTUngyZXBGUTJFbDhGTE90SXZ1c0owbEJRZ1B4Ti9VNGZL?=
 =?utf-8?B?bmpPR0lORDZzWXlWUmIxVHB4em5EekNSVVpsZlEvalMybWF5NXZzWkJURkw3?=
 =?utf-8?B?Nys5QjV3YWJLS3V2cWF1bDI1OHAzWkc0NDhmcU10V1AzdmpwcmY1ZXd0YjZZ?=
 =?utf-8?B?anpQZS9HM2gxVUxTdFVuSGpsSlN1cSt3Y2k5QXhHajF6aEw3SXduRTd3MSts?=
 =?utf-8?B?UERxbGJ2Z3ROK09ycmwva09iamNzTGYvTnpDUTJCTEdGNG1sQ0Zpc3RTR1ds?=
 =?utf-8?B?aC9pRDJaMVYxc0FVMDU4cE1ZSTRuZlRnTVFvcHNOclhyMFJpRlp3c0Z5TFNP?=
 =?utf-8?B?bnZRa0lIU3ZlM3NnNG45cElWaklvaFMzNnhuaW5uSnoxWXNjUXQvU1ZEelR6?=
 =?utf-8?B?bTJ6UUNBZVN3Rm1DQW1aSWMydWJZOXFNa045bG1QOTFXSlZyK1ViYU5HUHdp?=
 =?utf-8?B?NHNRV21rYW4rTG96b1Z5OXArWHdaQ2RFUE1XZFB2VVZ3NHMrdTZ6VjJPaEQ0?=
 =?utf-8?B?djMyWWpnbGhnWXNDVGRRdVozUU9VT2lyaXEzRnAwelN5dUppZW9WaEJDSDk3?=
 =?utf-8?B?UUJkYmgrMUl4N29LSWpiMmZDZ3B6M0d3UkkvR2Z0L0NOWC9FVDJ0S1Q5YUtL?=
 =?utf-8?B?Kyt2YWRCUGI5d050RWVvLzlOZEYyZzVKeFlTMDdUSTdldkVyaVNiOUQzQkQ2?=
 =?utf-8?B?OHU1R29SSUVPRmg3d2p2N0RtU1ZXR1dWek9qUGNiT1FpYVB3V3RBb2hpeHVZ?=
 =?utf-8?B?aWRoWFJ4eENYWkE1T3JWQ1krYkVpaEcwZ2ZMY2RFbjljaHBZQm85eUdQNFdT?=
 =?utf-8?B?N1FsanMvTkRGMjdtSUwzUTF0Mk02WmhqaUR1YmNJdGRtbkdyeXZEdzBuMVBG?=
 =?utf-8?B?cWFHbGx3QmRSZ0NRL2NsVERlSzdGd2tTYlNYVjBUTGxDQTIvVG1mV21LeTE2?=
 =?utf-8?B?RFI2TGY5VXRaTklPanRheE15RSsyQzJCclBmbUlBYWdKWm5hRjR6UTltUDAv?=
 =?utf-8?B?U0VTdjI4emV4aFVNU1dtLzhpNEg0Qm5rNThoY0ZyQ21QUitoMVFVRmF2SlpY?=
 =?utf-8?B?REpUL05sKzMrTUNwVC9WRUx4U2JLQUlPVmE5L1YwMHJXMkRaS0tac0FQbFdv?=
 =?utf-8?B?bmxLT2tnQi94TC9vRmVTV2RkMVhzdGZpL2RtNkV6UUNSS043YjJWOU1obHov?=
 =?utf-8?B?cUI5OUplb0hieFJhZ0VIUXRqKzB1cXhjaHFsY0dUbnd1NGgycUMzYVYvd0tS?=
 =?utf-8?B?LzNrRXg3RU1YMTFad0w2TS85RlhUbDdwL3JFNzJFcGxlY3lVcXVTVmZVaG9o?=
 =?utf-8?Q?kcIVKebJDN4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TDNrQ081N2kwcFJrTE1rbXlFRWVPZlBlWlIwczVZN2hWbkpNeERkNE1odlFQ?=
 =?utf-8?B?Q0wvbWtaMzNxRGtRazBnVGM2eWoyc0I5M0ZkdlZCeVBGS2lPREh2bzFBWWZx?=
 =?utf-8?B?OVV1c2JrbWVpcHAyR1RKRWtkVUpKeTdXaEtrWDBQVDZPSXREcEpzUDlhOHBk?=
 =?utf-8?B?VktrSis5UGNjUmZWSDQxSmRMbm02MWdpOHhFMk1UemFMVE8xcVFKMmwvZU54?=
 =?utf-8?B?MG1hNUYrSW8vbEpIRDdZd01MbFl2TXRuYmY3MDQ4Nm80NVRhMFNwVkREKzBV?=
 =?utf-8?B?Yy9SbFpWUDVwRmRBTnFpWUhHWXEwQ3E2ZzRFYkdRbGZUUVBadktKTDMrVk1L?=
 =?utf-8?B?ZldFL1hLVDdkak9TdWtXWkhGOUNuQW9LcE1kVGw1OXNyeFFjMERPN0ZHZGRW?=
 =?utf-8?B?T1E0d2FLdW00QXFQbUFyVEJzcUhOODIyRnA0MGNDc3VhQUhzbXhyY1JaR3NR?=
 =?utf-8?B?d1Zqc1M4SlJPQ3VhUmwrV1VQaDBQdVNHR0l2ckw1SWRMN0JsYzFySmJtVURD?=
 =?utf-8?B?Mytod05ZL2xhVkNJR3R6TlZtazlQbWhaRm5nS0FyeXZEaGZURFRaOTN3Qm1x?=
 =?utf-8?B?bUt4UjR2a2JhdVhpcnArOGxBcWNEMWplZ3FOTnA0ZldaTW1GOHVGRmRUelo2?=
 =?utf-8?B?K1dZL1lYZktwanR3MGsrMGZsQ08yRUhPTmhUSHNxNXFiaXlWMFA2YlRsdzFZ?=
 =?utf-8?B?OFBCQmxiODBBbFRsY050SmZEU0llcG9mMXB3eXVBL0F5QUFuUi9rSFdIdE4w?=
 =?utf-8?B?WTk2UVhMWWk4emloczRVdVBtUG5hVXBZTEJMVHk5TkNjY0Y1RC9Zamhvb2Fo?=
 =?utf-8?B?TVFTVUQxOVVvR3lpUTg5eFdnenM2UkF1bFI0eWRDOVJkZEJWT2tyNVZBSk8x?=
 =?utf-8?B?RjZCQ2F2ZVpGalp5QlFYTWg5UG16UHlmcTBUaEdvZlRZV1k5UURjaUhEZG1P?=
 =?utf-8?B?QWl3Rk0xSXJWeEZNN1h2a25tblQzM0M3UTdoUVNqeEtQSmxzQnhNeE5qa0Jr?=
 =?utf-8?B?QlRUbitiellhY1lTNTBlQU9Jck1UekJKMnEvUkYxVDJaRGdMYk51elA1ZnQ0?=
 =?utf-8?B?TkdrZ1laUVdCMHdnUkszUXpxOHVwcWlpYWpiR1lKQjF0d2VpcVlTVnNzbi9m?=
 =?utf-8?B?TVF0ck1RdUZNMWx1c1ZKZ2laYjRkM0RDbmJuaFpEZXp0MnN1Z1Q3UEdxZUVl?=
 =?utf-8?B?WGVoT2RKbmN3QllQbjhaazFVZlBVellxQkE2NXVHcVBOU2hxMmtOcXAzOFM4?=
 =?utf-8?B?NEJGY2FyWW9DcFY2NzlKK0FaK094V09wUmxEMStQV3NQcTJ3bGhKNXRXS2lR?=
 =?utf-8?B?NlNSOTR4ZnYySWtsdEhMZWo3RzJNbTJ6VmZjUWRzS0JKckR4WDlqUWJiTlkw?=
 =?utf-8?B?UXlXVW43TnRqRmthUUhEMENDQTFzN2JjT3VvRnZnZThUdyt3N2o3azlrdmxh?=
 =?utf-8?B?Nk9UaG8yRjJmd3poSGkzS1FhVFJmTWcxam9BUWNSQXg5Qmd4RkpNUkhpNzYz?=
 =?utf-8?B?V214ZVlROHlZNUcwdnhLRzBsb2psaGp1T0MzcVZwdm1qV3o4VkF1MTFJZm9U?=
 =?utf-8?B?U21vQXhETUVqNi83K3pkTGxnY1ZVb013cCs4bVEwUXhrN0FFalhsQ1RJRmtB?=
 =?utf-8?B?bTliRkNpdENxSFo2Tk5XdFZNTzB4YzAwTW1aVWdBZUc4ZHdycDZyZEh4a2Fn?=
 =?utf-8?B?R0FuYnh6WmJrT0Y3MGJCaE5nSUI3Uk9qdTZ0eHFlY0xFSmhtbUxkTFM0UGJv?=
 =?utf-8?B?V25CSmpaNEcra01ENFh4aGdPdVdEcWFHZjVySnVoNi93WUZPemY4RUdBaUZU?=
 =?utf-8?B?YXFhSmRkWmpHS29EZkxsSFRuRXpxU2dWQTNZaUJvRGF1S2RJd3VTM292QWdJ?=
 =?utf-8?B?dlN2RGQ3L0xkVUpDS2pHWVFlNkJRZE5CVUZCWjdjWitHZHJvdzlVbFJYcUVV?=
 =?utf-8?B?ai92ZVNteE4yOXlHMHhST1BzbGwyUlFhV20waVpiMEhyYVNlMFcxU2Nvckpj?=
 =?utf-8?B?RUQ0bkowcEVLTDNNeEVlUVNMUnhTUE1Gcnc4Znk2TnNpK2VhNnA3MEZvK3Zv?=
 =?utf-8?B?VjlUUWM2Z01wanpieGhrbFdaS0JabW9yUkVpVEJsUHJhYzJDdmlQYjFUV3ZP?=
 =?utf-8?B?K05sS0lIdm91ZVdqZUZ0S0lRVEd0STk3dTNUdm5xaXpwSFBrZ0NoRFJmMFR6?=
 =?utf-8?B?V2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f14127a3-26c2-4b0a-0219-08dd9d96e1f2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 03:22:31.9969 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eKviWWsXeRwHiqy4pY93egJHVz7qjag6ERVe+XO4quJvM6L7v52OpqWSbVKcWTWrByjHLSzfbW9zXNGsC0Zysg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7828
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

On Wed, May 21, 2025 at 07:41:39PM +0530, Satyanarayana K V P wrote:
> Create two LRCs to handle CCS meta data read / write from CCS pool in the
> VM. Read context is used to hold GPU instructions to be executed at save
> time and write context is used to hold GPU instructions to be executed at
> the restore time.
> 
> Allocate batch buffer pool using suballocator for both read and write
> contexts.
> 
> Migration framework is reused to create LRCAs for read and write.
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> ---
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Michał Winiarski <michal.winiarski@intel.com>
> Cc: Tomasz Lis <tomasz.lis@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> 
> V3 -> V4:
> - Fixed issues reported by patchworks.
> 
> V2 -> V3:
> - Added new variable which denotes the initialization of contexts.
> 
> V1 -> V2:
> - Fixed review comments.
> ---
>  drivers/gpu/drm/xe/Makefile                |   3 +-
>  drivers/gpu/drm/xe/xe_device.c             |   4 +
>  drivers/gpu/drm/xe/xe_device_types.h       |   4 +
>  drivers/gpu/drm/xe/xe_gt_debugfs.c         |  36 +++++
>  drivers/gpu/drm/xe/xe_sriov.c              |  20 +++
>  drivers/gpu/drm/xe/xe_sriov.h              |   1 +
>  drivers/gpu/drm/xe/xe_sriov_types.h        |   5 +
>  drivers/gpu/drm/xe/xe_sriov_vf_ccs.c       | 159 +++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_sriov_vf_ccs.h       |  13 ++
>  drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h |  35 +++++
>  10 files changed, 279 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
>  create mode 100644 drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
>  create mode 100644 drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index e4bf484d4121..ad2fb025463a 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -139,7 +139,8 @@ xe-y += \
>  	xe_guc_relay.o \
>  	xe_memirq.o \
>  	xe_sriov.o \
> -	xe_sriov_vf.o
> +	xe_sriov_vf.o \
> +	xe_sriov_vf_ccs.o
>  
>  xe-$(CONFIG_PCI_IOV) += \
>  	xe_gt_sriov_pf.o \
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index d4b6e623aa48..56ade9b7c564 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -929,6 +929,10 @@ int xe_device_probe(struct xe_device *xe)
>  
>  	xe_vsec_init(xe);
>  
> +	err = xe_sriov_late_init(xe);
> +	if (err)
> +		goto err_unregister_display;
> +
>  	return devm_add_action_or_reset(xe->drm.dev, xe_device_sanitize, xe);
>  
>  err_unregister_display:
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 902b2e30b3b9..5611cedf3f49 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -22,6 +22,7 @@
>  #include "xe_pmu_types.h"
>  #include "xe_pt_types.h"
>  #include "xe_sriov_types.h"
> +#include "xe_sriov_vf_ccs_types.h"
>  #include "xe_step_types.h"
>  #include "xe_survivability_mode_types.h"
>  #include "xe_ttm_vram_mgr_types.h"
> @@ -237,6 +238,9 @@ struct xe_tile {
>  		struct {
>  			/** @sriov.vf.ggtt_balloon: GGTT regions excluded from use. */
>  			struct xe_ggtt_node *ggtt_balloon[2];
> +
> +			/** @sriov.vf.ccs: CCS read and write contexts for VF. */
> +			struct xe_tile_vf_ccs ccs[XE_SRIOV_VF_CCS_RW_MAX_CTXS];
>  		} vf;
>  	} sriov;
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> index 119a55bb7580..48412ebcacb5 100644
> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> @@ -152,6 +152,30 @@ static int sa_info(struct xe_gt *gt, struct drm_printer *p)
>  	return 0;
>  }
>  
> +static int sa_info_vf_ccs(struct xe_gt *gt, struct drm_printer *p)
> +{
> +	struct xe_tile *tile = gt_to_tile(gt);
> +	struct xe_sa_manager *bb_pool;
> +	int ctx_id;
> +
> +	if (!IS_VF_CCS_READY(gt_to_xe(gt)))
> +		return 0;
> +
> +	xe_pm_runtime_get(gt_to_xe(gt));
> +
> +	for_each_ccs_rw_ctx(ctx_id) {
> +		drm_printf(p, "ccs %s bb suballoc info\n", ctx_id ? "write" : "read");
> +		drm_printf(p, "-------------------------\n");
> +		bb_pool = tile->sriov.vf.ccs[ctx_id].mem.ccs_bb_pool;
> +		drm_suballoc_dump_debug_info(&bb_pool->base, p, bb_pool->gpu_addr);
> +		drm_puts(p, "\n");
> +	}
> +
> +	xe_pm_runtime_put(gt_to_xe(gt));
> +
> +	return 0;
> +}
> +
>  static int topology(struct xe_gt *gt, struct drm_printer *p)
>  {
>  	xe_pm_runtime_get(gt_to_xe(gt));
> @@ -323,6 +347,13 @@ static const struct drm_info_list vf_safe_debugfs_list[] = {
>  	{"hwconfig", .show = xe_gt_debugfs_simple_show, .data = hwconfig},
>  };
>  
> +/*
> + * only for GT debugfs files which are valid on VF. Not valid on PF.
> + */
> +static const struct drm_info_list vf_only_debugfs_list[] = {
> +	{"sa_info_vf_ccs", .show = xe_gt_debugfs_simple_show, .data = sa_info_vf_ccs},
> +};
> +
>  /* everything else should be added here */
>  static const struct drm_info_list pf_only_debugfs_list[] = {
>  	{"hw_engines", .show = xe_gt_debugfs_simple_show, .data = hw_engines},
> @@ -363,6 +394,11 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
>  		drm_debugfs_create_files(pf_only_debugfs_list,
>  					 ARRAY_SIZE(pf_only_debugfs_list),
>  					 root, minor);
> +	else
> +		drm_debugfs_create_files(vf_only_debugfs_list,
> +					 ARRAY_SIZE(vf_only_debugfs_list),
> +					 root, minor);
> +
>  
>  	xe_uc_debugfs_register(&gt->uc, root);
>  
> diff --git a/drivers/gpu/drm/xe/xe_sriov.c b/drivers/gpu/drm/xe/xe_sriov.c
> index a0eab44c0e76..a773bc4acb6f 100644
> --- a/drivers/gpu/drm/xe/xe_sriov.c
> +++ b/drivers/gpu/drm/xe/xe_sriov.c
> @@ -15,6 +15,7 @@
>  #include "xe_sriov.h"
>  #include "xe_sriov_pf.h"
>  #include "xe_sriov_vf.h"
> +#include "xe_sriov_vf_ccs.h"
>  
>  /**
>   * xe_sriov_mode_to_string - Convert enum value to string.
> @@ -157,3 +158,22 @@ const char *xe_sriov_function_name(unsigned int n, char *buf, size_t size)
>  		strscpy(buf, "PF", size);
>  	return buf;
>  }
> +
> +/**
> + * xe_sriov_late_init() - SR-IOV late initialization functions.
> + * @xe: the &xe_device to initialize
> + *
> + * On VF this function will initialize code for CCS migration.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_sriov_late_init(struct xe_device *xe)
> +{
> +	int err = 0;
> +
> +	if (IS_SRIOV_VF(xe) && !IS_DGFX(xe) && xe_device_has_flat_ccs(xe) &&
> +	    GRAPHICS_VER(xe) >= 20)
> +		err = xe_sriov_vf_ccs_init(xe);
> +
> +	return err;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_sriov.h b/drivers/gpu/drm/xe/xe_sriov.h
> index 688fbabf08f1..0e0c1abf2d14 100644
> --- a/drivers/gpu/drm/xe/xe_sriov.h
> +++ b/drivers/gpu/drm/xe/xe_sriov.h
> @@ -18,6 +18,7 @@ const char *xe_sriov_function_name(unsigned int n, char *buf, size_t len);
>  void xe_sriov_probe_early(struct xe_device *xe);
>  void xe_sriov_print_info(struct xe_device *xe, struct drm_printer *p);
>  int xe_sriov_init(struct xe_device *xe);
> +int xe_sriov_late_init(struct xe_device *xe);
>  
>  static inline enum xe_sriov_mode xe_device_sriov_mode(const struct xe_device *xe)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_sriov_types.h b/drivers/gpu/drm/xe/xe_sriov_types.h
> index ca94382a721e..8abfdb2c5ead 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_types.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_types.h
> @@ -71,6 +71,11 @@ struct xe_device_vf {
>  		/** @migration.gt_flags: Per-GT request flags for VF migration recovery */
>  		unsigned long gt_flags;
>  	} migration;
> +
> +	struct {
> +		/** @initialized: Initilalization of vf ccs is completed or not */
> +		bool initialized;
> +	} ccs;
>  };
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> new file mode 100644
> index 000000000000..3ef801a1f117
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> @@ -0,0 +1,159 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#include "instructions/xe_mi_commands.h"
> +#include "xe_bo.h"
> +#include "xe_device.h"
> +#include "xe_migrate.h"
> +#include "xe_sa.h"
> +#include "xe_sriov_printk.h"
> +#include "xe_sriov_vf_ccs.h"
> +#include "xe_sriov_vf_ccs_types.h"
> +
> +/**
> + * DOC: VF save/restore of compression Meta Data
> + *
> + * VF KMD registers two special contexts/LRCAs.
> + *
> + * Save Context/LRCA: contain necessary cmds+page table to trigger Meta data /
> + * compression control surface (Aka CCS) save in regular System memory in VM.
> + *
> + * Restore Context/LRCA: contain necessary cmds+page table to trigger Meta data /
> + * compression control surface (Aka CCS) Restore from regular System memory in
> + * VM to corresponding CCS pool.
> + *
> + * Below diagram explain steps needed for VF save/Restore of compression Meta
> + * Data::
> + *
> + *    CCS Save    CCS Restore          VF KMD                          Guc       BCS
> + *     LRCA        LRCA
> + *      |           |                     |                              |         |
> + *      |           |                     |                              |         |
> + *      |     Create Save LRCA            |                              |         |
> + *     [ ]<----------------------------- [ ]                             |         |
> + *      |           |                     |                              |         |
> + *      |           |                     |                              |         |
> + *      |           |                     |   Register LRCA with Guc     |         |
> + *      |           |                    [ ]--------------------------->[ ]        |
> + *      |           |                     |                              |         |
> + *      |           |                     |                              |         |
> + *      |           | Create restore LRCA |                              |         |
> + *      |          [ ]<------------------[ ]                             |         |
> + *      |           |                     |                              |         |
> + *      |           |                     |                              |         |
> + *      |           |                    [ ]-----------------------      |         |
> + *      |           |                    [ ]  Allocate main memory |     |         |
> + *      |           |                    [ ]  Allocate CCS memory  |     |         |
> + *      |           |                    [ ]<----------------------      |         |
> + *      |           |                     |                              |         |
> + *      |           |                     |                              |         |
> + *      | Update Main memory & CCS pages  |                              |         |
> + *      |   PPGTT + BB cmds to save       |                              |         |
> + *     [ ]<------------------------------[ ]                             |         |
> + *      |           |                     |                              |         |
> + *      |           |                     |                              |         |
> + *      |           | Update Main memory  |                              |         |
> + *      |           | & CCS pages PPGTT + |                              |         |
> + *      |           | BB cms to restore   |                              |         |
> + *      |          [ ]<------------------[ ]                             |         |
> + *      |           |                     |                              |         |
> + *      |           |                     |                              |         |
> + *      |           |                   VF Pause                         |         |
> + *      |           |                     |                              |Schedule |
> + *      |           |                     |                              |CCS Save |
> + *      |           |                     |                              | LRCA    |
> + *      |           |                     |                             [ ]------>[ ]
> + *      |           |                     |                              |         |
> + *      |           |                     |                              |         |
> + *      |           |                   VF Restore                       |         |
> + *      |           |                     |                              |         |
> + *      |           |                     |                              |         |
> + *      |           |                    [ ]--------------               |         |
> + *      |           |                    [ ] Fix up GGTT  |              |         |
> + *      |           |                    [ ]<-------------               |         |
> + *      |           |                     |                              |         |
> + *      |           |                     |                              |         |
> + *      |           |                     |                              |Schedule |
> + *      |           |                     |                              |CCS      |
> + *      |           |                     |                              |Restore  |
> + *      |           |                     |                              |LRCA     |
> + *      |           |                     |                             [ ]------>[ ]
> + *      |           |                     |                              |         |
> + *      |           |                     |                              |         |
> + *
> + */
> +
> +#define MAX_CCS_RW_BB_POOL_SIZE	(SZ_4K * XE_PAGE_SIZE)
> +
> +static int alloc_bb_pool(struct xe_tile *tile, struct xe_tile_vf_ccs *ctx)
> +{
> +	struct xe_device *xe = tile_to_xe(tile);
> +	struct xe_sa_manager *sa_manager;
> +	int offset, err;
> +
> +	sa_manager = xe_sa_bo_manager_init(tile, MAX_CCS_RW_BB_POOL_SIZE, SZ_16);
> +
> +	if (IS_ERR(sa_manager)) {
> +		xe_sriov_err(xe, "Suballocator init failed with error: %pe\n",
> +			     sa_manager);
> +		err = PTR_ERR(sa_manager);
> +		return err;
> +	}
> +
> +	offset = 0;
> +	xe_map_memset(xe, &sa_manager->bo->vmap, offset, MI_NOOP,
> +		      MAX_CCS_RW_BB_POOL_SIZE);
> +
> +	offset = MAX_CCS_RW_BB_POOL_SIZE - sizeof(u32);
> +	xe_map_wr(xe, &sa_manager->bo->vmap, offset, u32, MI_BATCH_BUFFER_END);
> +
> +	ctx->mem.ccs_bb_pool = sa_manager;
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_sriov_vf_ccs_init - Setup LRCA for save & restore.
> + * @xe: the &xe_device to start recovery on
> + *
> + * This function shall be called only by VF. It initializes
> + * LRCA and suballocator needed for CCS save & restore.
> + *
> + * Return: 0 on success. Negative error code on failure.
> + */
> +int xe_sriov_vf_ccs_init(struct xe_device *xe)
> +{
> +	struct xe_migrate *migrate;
> +	struct xe_tile_vf_ccs *ctx;
> +	struct xe_tile *tile;
> +	int tile_id, ctx_id;
> +	int err = 0;
> +
> +	xe_assert(xe, (IS_SRIOV_VF(xe) || !IS_DGFX(xe) ||
> +		       xe_device_has_flat_ccs(xe)));
> +
> +	for_each_tile(tile, xe, tile_id) {
> +		for_each_ccs_rw_ctx(ctx_id) {
> +			ctx = &tile->sriov.vf.ccs[ctx_id];
> +			migrate = xe_migrate_init(tile);

I said this in a private review - I'm unsure why you need to create a
new migrate instance for each CCS context. The migrate layer sets a
special VM which points to itself + creates a queue for migration. I
think VM could be shared and just create a couple of extra queues for
the CCS migration if needed. Not a huge amount of memory to create an
individual migration VM for CCS migration but still seems a bit odd.

Could you elborate why you create a migration instance per CCS context?

Matt

> +			if (IS_ERR(migrate)) {
> +				err = PTR_ERR(migrate);
> +				goto err_ret;
> +			}
> +			ctx->migrate = migrate;
> +
> +			err = alloc_bb_pool(tile, ctx);
> +			if (err)
> +				goto err_ret;
> +		}
> +	}
> +
> +	xe->sriov.vf.ccs.initialized = 1;
> +
> +	return 0;
> +
> +err_ret:
> +	return err;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
> new file mode 100644
> index 000000000000..5df9ba028d14
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef _XE_SRIOV_VF_CCS_H_
> +#define _XE_SRIOV_VF_CCS_H_
> +
> +struct xe_device;
> +
> +int xe_sriov_vf_ccs_init(struct xe_device *xe);
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h b/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
> new file mode 100644
> index 000000000000..f07bb4741cf2
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
> @@ -0,0 +1,35 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2022-2023 Intel Corporation
> + */
> +
> +#ifndef _XE_SRIOV_VF_CCS__TYPES_H_
> +#define _XE_SRIOV_VF_CCS__TYPES_H_
> +
> +#define XE_SRIOV_VF_CCS_READ_CTX	0
> +#define XE_SRIOV_VF_CCS_WRITE_CTX	1
> +#define XE_SRIOV_VF_CCS_RW_MAX_CTXS	(XE_SRIOV_VF_CCS_WRITE_CTX + 1)
> +
> +#define for_each_ccs_rw_ctx(id__) \
> +	for ((id__) = 0; (id__) < XE_SRIOV_VF_CCS_RW_MAX_CTXS; (id__)++)
> +
> +#define IS_VF_CCS_READY(xe) ({ \
> +		struct xe_device *___xe = (xe); \
> +		xe_assert(___xe, IS_SRIOV_VF(___xe)); \
> +		___xe->sriov.vf.ccs.initialized; \
> +		})
> +
> +struct xe_migrate;
> +struct xe_sa_manager;
> +
> +struct xe_tile_vf_ccs {
> +	/** @migrate: Migration helper for save/restore of CCS data */
> +	struct xe_migrate *migrate;
> +
> +	struct {
> +		/** @ccs_rw_bb_pool: Pool from which batch buffers are allocated. */
> +		struct xe_sa_manager *ccs_bb_pool;
> +	} mem;
> +};
> +
> +#endif
> -- 
> 2.43.0
> 
