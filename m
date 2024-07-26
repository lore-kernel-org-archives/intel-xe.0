Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E102FC3DA49
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jul 2024 16:09:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6586B10E9D5;
	Fri, 26 Jul 2024 16:09:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fct5ncBM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF9E410E9D5
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jul 2024 16:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722010186; x=1753546186;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=pJ8t4dtWXwJKCaqoJnyKMJRZ2gxEto0fbBctcy3kMkc=;
 b=Fct5ncBM8fEXVR5cvHnG8ox/NapPz3+t3dyI5K5/miv/c/8d6vEk+Umd
 dB69jMFgwT8khyScQJVjzjFLo+kaRlxgytSO0rWJ8vbF9GXZ/dQAt3IGe
 /lQTjgh2bx/wdnDm1kI41K8g00BNJvXTtUlpWhGAHwgbm/wFTpaCQxM2y
 LglKTZrerg0GEsOQCTF491EU2bMdHStMDSJh3BQ8s08Mf1J8ntpqj02ko
 inJOqkupOnpqatICWjlDSxJgaFMQTYtyLBHNvkS/IsIpbSwdPqKsnV2A9
 P0NZNsy60Z46yLmWXgfQHpeZRnXtSr3+Ko22l6BepddCsPZBh9q9iJB19 g==;
X-CSE-ConnectionGUID: M70KlNAFSuCEY6NX/EUrqQ==
X-CSE-MsgGUID: b97ol/aoTf20tPYVTGoNiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11145"; a="19609162"
X-IronPort-AV: E=Sophos;i="6.09,239,1716274800"; d="scan'208";a="19609162"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 09:09:46 -0700
X-CSE-ConnectionGUID: Zm0OYH0eSzSXY4deldMNgw==
X-CSE-MsgGUID: J5djbqVZT+yOLWaaHWoD4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,239,1716274800"; d="scan'208";a="58094552"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jul 2024 09:09:45 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 26 Jul 2024 09:09:44 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 26 Jul 2024 09:09:44 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 26 Jul 2024 09:09:44 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 26 Jul 2024 09:09:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zdu39ffx2Wq0UPbrqKJptiiCd4VLk0H0OlOg/mEVtYXVgZ/GGOntgS/ucr+EkyxyqMWSx0aBlyXTtRQbBy/DGyhalEl/FC53NXwVgVm2mkh9L8fBZQXl99a6Ep+glImae1Y2NkLpcs08yuBsMICRy6h8Ez3xzdIKVrZAYCJODPFGUDXhTUGsY7RFrzZzgTwJnKAykGzMSyi7yGDZaE+8xlOp+H4JTWl+5izEf58x42+rv5SIlg0g1soLhLdQVV446cgbmuxyeKCX9hvEZEL3rl82aH9i21PL9g0BscoSYrV1cdcsUkny6jl7zFjER7qJ6IBXvVKBuuQUWr7Cvvci3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7HoeRPbDmLRGi74NSUG3Ux5UdvXkPqM0+B+OeWOKXZg=;
 b=hw9R0xcEi2jBNQ3hp5uD9KzwYgEsoWMI7Xt3hLJ84nRRnw1HfmZI0TEr4Hu94q1z6uOn2nYXm4PuCP0uXLHsEQN4I1hDyB6I/zudeN9BOPt0ZsB5MONcn+ApvzzXmP3hQpEtsyRyWKROwlwcehoEM08OVH99yUSDu9s6gjM/vdin3LxobAlDpM3YOFjB71879TxjMpHP6JbvaMtgS9O09C9aqQAeDlY+D3xQumlpYROfZQBCugOMZCDTMDXyDHnlyfgM2VyaGcTmO1y+xHbqsLRH5hrwf1zBXHsATjsWj6Up49Cg3oFG07rD4hB+qIeNMRhX9i2stDgciXqXi51i+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by PH7PR11MB6881.namprd11.prod.outlook.com (2603:10b6:510:200::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.19; Fri, 26 Jul
 2024 16:09:42 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%4]) with mapi id 15.20.7762.027; Fri, 26 Jul 2024
 16:09:42 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240726064337.797576-4-lucas.demarchi@intel.com>
References: <20240726064337.797576-1-lucas.demarchi@intel.com>
 <20240726064337.797576-4-lucas.demarchi@intel.com>
Subject: Re: [PATCH v2 3/7] drm/xe/kunit: Test active rtp entries
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: Lucas De Marchi <lucas.demarchi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
Date: Fri, 26 Jul 2024 13:09:35 -0300
Message-ID: <172201017572.1586.924227310998218601@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: MW4PR04CA0154.namprd04.prod.outlook.com
 (2603:10b6:303:85::9) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|PH7PR11MB6881:EE_
X-MS-Office365-Filtering-Correlation-Id: 08320a8d-dc10-4578-5ac4-08dcad8d5b8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NTJod0FCUHU0bmM4M1JXTXBtMXNoK2xTNitQM09CNDlSQnlBcHlYbW96eWox?=
 =?utf-8?B?aW5KcmRmMWhCcmtHZFdacC9Gb0pzMmRCenpjTFo3NmxaZkZFTGxmc3k1WGhW?=
 =?utf-8?B?UzJDS3E0V3ZpZlBMSk1jYkhDOTVRT0lKSXhDMkVzcEw2TEFrRXpIMENCUjlR?=
 =?utf-8?B?dzdLaHRqdU9PaXNRRWhCTjZGUmhEVVRzZTNWTkV3TU00WS9UdTNsUUFSclpv?=
 =?utf-8?B?dldtUUhYeFBleHZLZG96Ri9jdldUM09IV0VrcGZsMVpuM0RwYi9RMUdmdENV?=
 =?utf-8?B?cEs5VFAxOWxKbHFIeWJKbWZNRlowVUNCUjN4QWxSdUNoVTI5L0hPNDFqM2My?=
 =?utf-8?B?WXhHb1B0Sm5JQ2NjL3FPK3NFQk02Sm41VHU0MnlNdUZiMjErWCs1RU9qOE81?=
 =?utf-8?B?YXB1RUdDTDdzbEw2ajh0S3N0Y3lmVGFRZWlXTWtGRm5CSTRGSlhpU0pvODd2?=
 =?utf-8?B?UmdabUt2WWFnZFZVYzk2ME5DOUdYYnQrTjArajFnSUZVT1d4SnRxZ05KU2VC?=
 =?utf-8?B?NzhmblRsQ1R5RFFEUlhyNEwrU3pML05tRjgydWRvOXFNZmlVeUJJMHhnM0J3?=
 =?utf-8?B?TkxJUXdZRStMMkVQZkQ3Y2ZWU1YxcUZwV3h1RW5lSWhQbzFHWU9qbGZnVFZG?=
 =?utf-8?B?amsrY09WckNUQ1kvSi9USmI4NTR0dkVvTEJQNDYzZWdnUmwyQm94WlZzQUtO?=
 =?utf-8?B?ZHJVekYvTWVHeThQdUkzWVdIMmNQN1ZqTjQ3U2dmeENUWHFrNVkrZlI0TlBZ?=
 =?utf-8?B?Vmc1c05JUDlSb3VMcENJWENBTjk0QUhSWlJXQ0lKTnJVVmIzTnRMNWJuVVAr?=
 =?utf-8?B?d3JDZTNpbTBkaWhMcG44NjlVMkFSU0FTeVFlWU9CTk9hdUZxQ0pFckdKS3FX?=
 =?utf-8?B?WVlCa0V6Z2hjY1VlbFVPY0hmUlVZaHNZZVB0d0NpZkJyZ1JGbS8xbU9RVmVX?=
 =?utf-8?B?c3I0REhZTzdCTGhjUHo4U0lLeVFURjJ1Mjc0TlBGTlFRaE9nRDVhMGR4TGxq?=
 =?utf-8?B?TlZPU3hNenV5Vko4MUM4Y0R1aFJoNVBJTnBHQTk5RDdObHNiY1lnTXQ2Mzl3?=
 =?utf-8?B?L1loSGM2cTF2dmVWblM2Y0I3Znk4Z29GcEtOMVpNVlpxclRMa0hCSTF6SElw?=
 =?utf-8?B?b1pSWDAwZVBiUGVQNEd2UkVQTHdIbFdYeFpBVnVSOTZleVRuV0dTV2RMSmZT?=
 =?utf-8?B?R1dkVm1RMDRqQ2VtMUJQUHRmU1BEWjlySjBMT090VGJmVmR2YklRV0NRbzJo?=
 =?utf-8?B?c2pmNk85aU5jUS9pOEd2RC9waUNuS2R0cVFDR042ekUxcTVKN0hvNmNkZmZY?=
 =?utf-8?B?YTJ6TC9obWMrS2N6TzAwWktXalgzczB5dmUvNmphc09JM1RRVUwzNUtGeWhO?=
 =?utf-8?B?aXd2MXJLTzYyQnk2Skh5Vk1DMGNVTHRIRGhDRVVTcTdXNVpvbE1DbzRMQzFk?=
 =?utf-8?B?WnBPQTZUZU15Wmk0NisyUzhRUjkxY3IyR3ZseTkvazV4NW81NVFROW1JamRJ?=
 =?utf-8?B?amFwUlNjd0FwZGcyQ0lnR1JSVmM2dHpkVlp6WEM5WEpicWdJMnlEek0vUkZa?=
 =?utf-8?B?S2NGRm5BK1AyWTJ3blRiSlhFY3JsaG04bzJqRGw4OTM0R0hrdUp2TUh6dDQ1?=
 =?utf-8?B?SFRyTVpUV25udW82RVpzQU4rcTNORnh5TkdpM0Z2a05ZZTl2WUYxVGlRanlv?=
 =?utf-8?B?dmZzQm5Fb1B1YmVKTnBPMU41R01zTU9kN1VtWFJsUExCWVZtbFpRWUJvNUUy?=
 =?utf-8?B?Rk5zTEl0NW51RlM4cFNyUHdSR3V6b0hKZERwd1Z1U1M5N29pL2VvVlVYdnEv?=
 =?utf-8?B?UE95MENUVjk1NmxFQTdRZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZXN5cnVLMFNTYks2TkVaZ3VZSC9lbVhhNXNpOVpDN3MxdloyU2EwOGcvNlhu?=
 =?utf-8?B?YnVWeGkrS2k3ckRGSEx1Nnc0RXA1eS9Ja09TdjZseU9qTWt1UVV3YVRvc3Zy?=
 =?utf-8?B?d2RwZjEvRDdIUGxIeEI0SEE0c0dlVWFzc0xSTXNFVHVSZURYRE8vck9uOVhY?=
 =?utf-8?B?dEFaVXN6SVBiYmYrdi9xSnhuRjR2dlU5WW9taUhOV3lVOTdkS1Z3b2VOOHVN?=
 =?utf-8?B?R0x2MExMU3JBTWJDaVo4Y2JqMk9WYnllSm9UeVFqQjh5dnNUdjRZQkFPNGtn?=
 =?utf-8?B?aHNBQURUcmQ5Q1RGVkxsbHorTTM0NGhRclFMa3BtV0RHUS9Fd0tYY3IzSUFE?=
 =?utf-8?B?aU9icnM1UzBUWGhKcm8zTExKK2RNdDgyMXdPMEVaY2F1d3luSGwrOEVSWCtK?=
 =?utf-8?B?VE9WL3g0OVRqOWxsZ1VVMFZkSDIreFpHUWxzQWRXdVNFMjM3K3piTHA4Q3hs?=
 =?utf-8?B?N0trZVplOXpnWXdDOVFxTExwU3Y2L05JVDlSUzRMYkRReUFpS2JxcEhtSkMv?=
 =?utf-8?B?azVKdUw0ajRxR0EvU1c3bHY4WkpKOEE3eHZGdlp0ZmxaUUtQT1ZNdGcxakNz?=
 =?utf-8?B?QUdWWHZLZTdnMkhMRjNlUFdiQVVaaXB4VzJRbWxsZEJsRHRqTXZ5Y0pQSzUy?=
 =?utf-8?B?cTFQMkd4dStkd1NhNkRENld3dGpGS0ZzeGtiNGtvV1loMjdydVpTWXRCVVl1?=
 =?utf-8?B?ZHh6c0pLNGZSUFFHRXpHWTBBRXoyTU5GK3pBZS9XaCtRazhCMnVkV1k1MkJ1?=
 =?utf-8?B?MTRkWDJwVkRxRW93UGtvNmlpVnRlQWY4V3ZlMDBDUUF3K0RCREdmWnYwMlFt?=
 =?utf-8?B?ck5PTmt2Uy9EaDBPeHlUMUt6RnJyNlJLVFl3WVJ4QXl6aVZtTjVuQ0JFQjdj?=
 =?utf-8?B?VGRvMHNncC8zaVhac1hBZ2RRclNmbUIvVm1PS3l1SG51M0k5TlcxWng1Uktx?=
 =?utf-8?B?NXEwaVBsVnZBY0hYRW9MWlA3cFRjU2orbEErbGtyaEhtQXlhR1lvVXQ1YmZ1?=
 =?utf-8?B?QXlJQUUrZXdiNTUzblhsbldLNFhXc0RYNnl4dGd4TU1PdXIzdExlSXZjRnp4?=
 =?utf-8?B?R0E0UmpON3M0ZzhhdUhlVHRyNzZqRzFndWpHenZIOFJsRzhVRThSQm9Hdldt?=
 =?utf-8?B?YXNCRDlseHdaeVZVWjFVd0dYcnJCeGEybnE4TlVwYmZqbk9KcWdVVktYclRP?=
 =?utf-8?B?ajFiVDQxMjVJeHNJbS95UDFMTXF1ZXZydDZZK1oxdm1vSGxkeXZ0bVJ5MnNH?=
 =?utf-8?B?YWp5SFB3WWp2cnZPWWMyaHBOL3NpSDNDZldFTi9XNExlYUROUkRveUwwMS9r?=
 =?utf-8?B?dFRIQmhpTFRrTWdlVUNMVXpvM0xST2hTWUFuQ2JtclBzeVVSdnVkMGlaOU5X?=
 =?utf-8?B?dE5wOXA0ZDQvajdSMmQ5c3kwNVVFRVc5QzFOc2poUmN4SDdibW9NRFBTaTdF?=
 =?utf-8?B?NE5MdEZvazhteWgxekdzMEJPbE5MeFBnUFBXMmEwTmx3SmZRQzh0bWNqb0cz?=
 =?utf-8?B?TjNRVmtsWXA3SEdvUGd6dUU2UW1SV2N4dXVJWE9SSW1aSFh1Q2xZT2xubUkr?=
 =?utf-8?B?ekhveWlKUVF3YVlndVhPUTh6Tk9hMXAvRWRhbk1ITXdDRFZtMTRrMG5sZll5?=
 =?utf-8?B?U3BxbnhFNG5jN0JpZ0xiK0pwaUFkV1RKYWxXcXdDU09aa0FNVUJlT1FMMENH?=
 =?utf-8?B?cWcyOUxVYXRDSUllT1hxTTNmd3lLY2ZmbVh0TnpNSHVkdWYvWG9vVEE2MVhP?=
 =?utf-8?B?TjlZSXpKdlRiWUFVdmFTRTZHckFSM0tocUNyd0ZYeVBJeE5HQjF2dmsyMmR2?=
 =?utf-8?B?dDAwWHVRS1ZiSk15YmRPd2dFUThTZHZ4bFZRN1VHRDN3WUc4M2FENXRzaG8v?=
 =?utf-8?B?dzdtWXFSdC9WQ2E3ejVHeFB3YVFKV21CQjRVRTMrM1NQcUhRWFlTKzkzekRp?=
 =?utf-8?B?Q21BWDRTTzBpS1paTExJT0hSVCtzclgxWlRzM1RWTEFRU0lub043UTdUcWVl?=
 =?utf-8?B?SC9zZGU3MFdUU0xTaU9RTXgzcGIxWmltSi9ubFN4dlk5Tk5xNFVmZzBibHlv?=
 =?utf-8?B?ZXRiaUp4MkRWSVd3VGJCRGx6SkVFeUpvQ2NOcVZiS1NZb3czMU5Wc1o3eXhQ?=
 =?utf-8?B?OWlGNHNaK2FtcmNKUncrbjQzTmZXajFvUGNXMHVnd0gzNkZIaHpNNitvbGx5?=
 =?utf-8?B?UGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 08320a8d-dc10-4578-5ac4-08dcad8d5b8d
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2024 16:09:42.0038 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y0JqK+L0v4os9a8z24HhOY6Fa40CmWHS5KryFFD0kbA7533ylokHBFNNVsLFbIwU5VSVU43FoSG+8GAMKiy/lQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6881
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

Quoting Lucas De Marchi (2024-07-26 03:43:33-03:00)
>Enabling active tracking in the rtp context and check for all the tests
>the expected entries become active.
>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>---
> drivers/gpu/drm/xe/tests/xe_rtp_test.c | 22 +++++++++++++++++++++-
> drivers/gpu/drm/xe/xe_rtp.c            |  1 +
> 2 files changed, 22 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_test.c b/drivers/gpu/drm/xe/t=
ests/xe_rtp_test.c
>index 5ebaed1af3f2..dbf982b1ada8 100644
>--- a/drivers/gpu/drm/xe/tests/xe_rtp_test.c
>+++ b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
>@@ -38,6 +38,7 @@ struct rtp_test_case {
>         u32 expected_clr_bits;
>         unsigned long expected_count_sr_entries;
>         unsigned int expected_sr_errors;
>+        unsigned long expected_active;
>         const struct xe_rtp_entry_sr *entries;
> };
>=20
>@@ -57,6 +58,7 @@ static const struct rtp_test_case cases[] =3D {
>                 .expected_reg =3D REGULAR_REG1,
>                 .expected_set_bits =3D REG_BIT(0) | REG_BIT(1),
>                 .expected_clr_bits =3D REG_BIT(0) | REG_BIT(1),
>+                .expected_active =3D BIT(0) | BIT(1),
>                 .expected_count_sr_entries =3D 1,
>                 /* Different bits on the same register: create a single e=
ntry */
>                 .entries =3D (const struct xe_rtp_entry_sr[]) {
>@@ -76,6 +78,7 @@ static const struct rtp_test_case cases[] =3D {
>                 .expected_reg =3D REGULAR_REG1,
>                 .expected_set_bits =3D REG_BIT(0),
>                 .expected_clr_bits =3D REG_BIT(0),
>+                .expected_active =3D BIT(0),
>                 .expected_count_sr_entries =3D 1,
>                 /* Don't coalesce second entry since rules don't match */
>                 .entries =3D (const struct xe_rtp_entry_sr[]) {
>@@ -95,6 +98,7 @@ static const struct rtp_test_case cases[] =3D {
>                 .expected_reg =3D REGULAR_REG1,
>                 .expected_set_bits =3D REG_BIT(0) | REG_BIT(1) | REG_BIT(=
2),
>                 .expected_clr_bits =3D REG_BIT(0) | REG_BIT(1) | REG_BIT(=
2),
>+                .expected_active =3D BIT(0) | BIT(1) | BIT(2),
>                 .expected_count_sr_entries =3D 1,
>                 .entries =3D (const struct xe_rtp_entry_sr[]) {
>                         { XE_RTP_NAME("first"),
>@@ -148,6 +152,7 @@ static const struct rtp_test_case cases[] =3D {
>                 .expected_reg =3D REGULAR_REG1,
>                 .expected_set_bits =3D REG_BIT(0),
>                 .expected_clr_bits =3D REG_BIT(0),
>+                .expected_active =3D BIT(0),
>                 .expected_count_sr_entries =3D 1,
>                 /* Don't coalesce second entry due to one of the rules */
>                 .entries =3D (const struct xe_rtp_entry_sr[]) {
>@@ -167,6 +172,7 @@ static const struct rtp_test_case cases[] =3D {
>                 .expected_reg =3D REGULAR_REG1,
>                 .expected_set_bits =3D REG_BIT(0),
>                 .expected_clr_bits =3D REG_BIT(0),
>+                .expected_active =3D BIT(0) | BIT(1),
>                 .expected_count_sr_entries =3D 2,
>                 /* Same bits on different registers are not coalesced */
>                 .entries =3D (const struct xe_rtp_entry_sr[]) {
>@@ -186,6 +192,7 @@ static const struct rtp_test_case cases[] =3D {
>                 .expected_reg =3D REGULAR_REG1,
>                 .expected_set_bits =3D REG_BIT(0),
>                 .expected_clr_bits =3D REG_BIT(1) | REG_BIT(0),
>+                .expected_active =3D BIT(0) | BIT(1),
>                 .expected_count_sr_entries =3D 1,
>                 /* Check clr vs set actions on different bits */
>                 .entries =3D (const struct xe_rtp_entry_sr[]) {
>@@ -207,6 +214,7 @@ static const struct rtp_test_case cases[] =3D {
>                 .expected_reg =3D REGULAR_REG1,
>                 .expected_set_bits =3D TEMP_FIELD,
>                 .expected_clr_bits =3D TEMP_MASK,
>+                .expected_active =3D BIT(0),
>                 .expected_count_sr_entries =3D 1,
>                 /* Check FIELD_SET works */
>                 .entries =3D (const struct xe_rtp_entry_sr[]) {
>@@ -225,6 +233,7 @@ static const struct rtp_test_case cases[] =3D {
>                 .expected_reg =3D REGULAR_REG1,
>                 .expected_set_bits =3D REG_BIT(0),
>                 .expected_clr_bits =3D REG_BIT(0),
>+                .expected_active =3D BIT(0) | BIT(1),
>                 .expected_count_sr_entries =3D 1,
>                 .expected_sr_errors =3D 1,
>                 .entries =3D (const struct xe_rtp_entry_sr[]) {
>@@ -245,6 +254,7 @@ static const struct rtp_test_case cases[] =3D {
>                 .expected_reg =3D REGULAR_REG1,
>                 .expected_set_bits =3D REG_BIT(0),
>                 .expected_clr_bits =3D REG_BIT(0),
>+                .expected_active =3D BIT(0) | BIT(1),
>                 .expected_count_sr_entries =3D 1,
>                 .expected_sr_errors =3D 1,
>                 .entries =3D (const struct xe_rtp_entry_sr[]) {
>@@ -265,6 +275,7 @@ static const struct rtp_test_case cases[] =3D {
>                 .expected_reg =3D REGULAR_REG1,
>                 .expected_set_bits =3D REG_BIT(0),
>                 .expected_clr_bits =3D REG_BIT(0),
>+                .expected_active =3D BIT(0) | BIT(1) | BIT(2),
>                 .expected_count_sr_entries =3D 1,
>                 .expected_sr_errors =3D 2,
>                 .entries =3D (const struct xe_rtp_entry_sr[]) {
>@@ -295,9 +306,16 @@ static void xe_rtp_process_tests(struct kunit *test)
>         struct xe_reg_sr *reg_sr =3D &gt->reg_sr;
>         const struct xe_reg_sr_entry *sre, *sr_entry =3D NULL;
>         struct xe_rtp_process_ctx ctx =3D XE_RTP_PROCESS_CTX_INITIALIZER(=
gt);
>-        unsigned long idx, count_sr_entries =3D 0;
>+        unsigned long idx, count_sr_entries =3D 0, count_rtp_entries =3D =
0, active =3D 0;
>+        const struct xe_rtp_entry_sr *rtp_entry;
>=20
>         xe_reg_sr_init(reg_sr, "xe_rtp_tests", xe);
>+
>+        for (rtp_entry =3D param->entries; rtp_entry && rtp_entry->rules;
>+             rtp_entry++, count_rtp_entries++)
>+                ;

I think the "rtp_entry &&" part of the condition is unnecessary.

With that,

    Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

Also, an alternative loop where we have only one increment:

        for (count_rtp_entries =3D 0; param->entries[count_rtp_entries].rul=
es;
             count_rtp_entries++);

Up to you.

--
Gustavo Sousa

>+
>+        xe_rtp_process_ctx_enable_active_tracking(&ctx, &active, count_rt=
p_entries);
>         xe_rtp_process_to_sr(&ctx, param->entries, reg_sr);
>=20
>         xa_for_each(&reg_sr->xa, idx, sre) {
>@@ -307,6 +325,8 @@ static void xe_rtp_process_tests(struct kunit *test)
>                 count_sr_entries++;
>         }
>=20
>+        KUNIT_EXPECT_EQ(test, active, param->expected_active);
>+
>         KUNIT_EXPECT_EQ(test, count_sr_entries, param->expected_count_sr_=
entries);
>         if (count_sr_entries) {
>                 KUNIT_EXPECT_EQ(test, sr_entry->clr_bits, param->expected=
_clr_bits);
>diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
>index 02e28274282f..acb35b95a3f6 100644
>--- a/drivers/gpu/drm/xe/xe_rtp.c
>+++ b/drivers/gpu/drm/xe/xe_rtp.c
>@@ -217,6 +217,7 @@ void xe_rtp_process_ctx_enable_active_tracking(struct =
xe_rtp_process_ctx *ctx,
>         ctx->active_entries =3D active_entries;
>         ctx->n_entries =3D n_entries;
> }
>+EXPORT_SYMBOL_IF_KUNIT(xe_rtp_process_ctx_enable_active_tracking);
>=20
> static void rtp_mark_active(struct xe_device *xe,
>                             struct xe_rtp_process_ctx *ctx,
>--=20
>2.43.0
>
