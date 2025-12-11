Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AD16D4335B
	for <intel-xe@archiver.kernel.org>; Thu, 11 Dec 2025 23:00:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30BEB10E2CF;
	Thu, 11 Dec 2025 23:00:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JcI1quic";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E46B10E2CF
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Dec 2025 23:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765494039; x=1797030039;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=b4nE8nSKKOZQqxNXUSuDz/mZ+D+cF6UP/8Y2y1JP1nE=;
 b=JcI1quic3VqbBGhtEW1HslaBdgaArNZ1DHAGmCs2NBWtwbnRfH87rz/I
 wf6eRc1YFRtHBtnI2pyq6f1OBYMeRAe2ZAwEAaf9oHTa3T5derNYo02Sr
 46b8Nv60Hug2AL3ZUEusdaBnJgAFiZe3+93yfnJWEzNkkh81M16MqaOAz
 w+o+YZoeq2wRc5M6ucCavDPnyVpZ4SfcwDk2SiDdtMuIptwHj6u77AeGO
 rQy3QpVvAKRM2g8d2MM/oZ18x2WK5GqcZsB1JOy45idUiEL/bTLMx6ico
 +9oYsiezFc6Bry/d6SdhQIamSTIP/JUA4M45gAmS59Gq0fC4gzC24wpQW w==;
X-CSE-ConnectionGUID: L9WCnePMT4OEECz0n5hq7Q==
X-CSE-MsgGUID: gBdbhUgjSQe0qasQk8sLhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="55035846"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="55035846"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 15:00:38 -0800
X-CSE-ConnectionGUID: 7rEoJPi/S4ST0+jVdzldSg==
X-CSE-MsgGUID: ltmwlDSfSIWSxmoIWtRzmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="202001721"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 15:00:38 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 11 Dec 2025 15:00:37 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 11 Dec 2025 15:00:37 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.40) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 11 Dec 2025 15:00:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=evJsLmCIL49k+69LSGnJsz6lRPokSpQSSs8K/xZOxL0soTiAgBnuANHIiTKctTH9rxF0fx/Ket3W7q6apJWZRvJZRxCfC8qJMiWpTvuBuQjCXv7OvtPDM/aiD8SieDjG//nQg8XxHzG4vnXgBJv4iQvGInVTF7SGK0VT2b5ph8BdrgeL8/+54De5U55ohvEcEyfIXi0e8hZ80mmbpf2XfAvWxDXpneNKpXwo3nGt7nbmzS/E4wIW6DG/26UXdVvhpkddorCLNgVddqvuShAYVhd+lPF3HWrpfKbS5acEauFVuRZlOsZtuuSlDbldLvXXtlA2GuCBHeEFZhY7i7gBGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hGU9XCJE+eoUZk64xWorgQc1H9sfDPJNsfkaXWmXiko=;
 b=YUlE9nNunyewomEggkuocnC9QIA+mzZmKOlTXocePlHlZZXN9b97rX7Lq/3vWbGR67PB1835ubqJiQWrIX1f0kBd4eib0iMvGTGR8sjVWzYWHEt10Yz512johYiYxNeAAJ+J0S4kxJ1mNR+TPRWJPuVILrOk75AwV2dXxK3YwXsPqgrvLQzFxlkmYKi8m4pdPnSkpUU+/wI811E3bqf+bDv8MQw+K8GPZXK+bBRKj0Z3WnAY9YLIrkJkEEoxxrDYEwh05WWIyaoOyFnR24q3Mmti33/AVx170fzEtl6305hjiQ95vICsX3Ixry2DVSGkEREpA01mOhH3AMYaAapq5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by CY8PR11MB7338.namprd11.prod.outlook.com (2603:10b6:930:9e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.8; Thu, 11 Dec
 2025 23:00:34 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%5]) with mapi id 15.20.9412.005; Thu, 11 Dec 2025
 23:00:34 +0000
Message-ID: <7dacdde0-805c-4c57-82d9-5817d4050ea8@intel.com>
Date: Thu, 11 Dec 2025 15:00:33 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/12] drm/xe/sriov: Add support for enabling scheduler
 groups
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20251211015700.34266-14-daniele.ceraolospurio@intel.com>
 <20251211015700.34266-18-daniele.ceraolospurio@intel.com>
 <d53cee53-e649-4997-bede-3cdae61d9ebb@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <d53cee53-e649-4997-bede-3cdae61d9ebb@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0094.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::9) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|CY8PR11MB7338:EE_
X-MS-Office365-Filtering-Correlation-Id: 83751ed9-dfbf-4d16-feb9-08de3909178b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OXRFTm0rd1FzSUZPdzFLNUdXdFpMRjF1K3ZkbWZ1ZUhoVzdzcUJIZE5vYTFj?=
 =?utf-8?B?SWFrWFVaQ212S1Q1Zyt3TWE3OG1UYnFMU1BsTFl4YmJzUzhuZTd3NkxlNXcx?=
 =?utf-8?B?TGVyN1RPMzJ4QzJUb1lhTDdqaEs2QTVuYlVNZ3ZrWERESXFleEgxNlFIYnJJ?=
 =?utf-8?B?aWVoYUtXRnZHWkJ2Q2VGRHdyYnJsNDJwbkxSRDgvNWFBaFFVTmlFTmJBNkJV?=
 =?utf-8?B?ZFd0eEdlVnNXMkZaN3FEeGNWUU52Y3RmVTVoa1R2NzFUZlNHQXphV0NYWGlY?=
 =?utf-8?B?N3lHRlpmdnRKR3V6NjRFc3BzdjRiWTBNRll6SzN0dlJOVEhsOTVHRG44cDJI?=
 =?utf-8?B?aWtwQTM4emVzaEU2NWVuTlZaVTcyVC9QSjM2SGxaZXczaHdPZVhMakUxYVNF?=
 =?utf-8?B?dkxTYklXQ2k4Rm82dVBiS0Nsc2RNQllJems2aFpDci9vaVpjNC8vRjg5T0xB?=
 =?utf-8?B?VVY3SVNiWGtaY2FuTHRzT0FHeUN6S3ZPejUvY2YxWC9oVktMT1A3RzZWZURB?=
 =?utf-8?B?dDMwZjlrNkhDcmpYbnExSkxuNnJEZWU4cWI3d2U4UW50NlBJMVJQRmpLNmYr?=
 =?utf-8?B?QkM4YVBSaHRJTjk2RDZVR0RId0hIbWRLc0NvOXRHUFM5RmlOT3ZCVGozL3E3?=
 =?utf-8?B?cThEWTR1dU14eGtUL011STNEZ2N6WWFNQjNnbFEwSjFkSXFyeDJ1dmZPT0dT?=
 =?utf-8?B?ekxKeDVxMmdVbklWalczWHl6NUYyNjh1MHZ2UUdpb0oxOEhwMEVEVk8wRU9x?=
 =?utf-8?B?ZWZpaEYyQUhydzJzZGVnMm1XQW5hcFlzTmo3NlZ6L3h2MGhrTlQvUFZjTS9p?=
 =?utf-8?B?ZHFiMms3NUx6bVRESm5ER3hxYnVOSnhRL0xYeWJPeFVHelVKTk1kWnZtQ3cr?=
 =?utf-8?B?eWt0TWJwN2h4dVh1ZVkvdWtPeVFaL2Q0d1NFOVBDM2VmM3VxTjQ5QVFHanB3?=
 =?utf-8?B?QmtWRllnajlHTEI2RjBWSmlwNFNhK05ERjBQTVVLT3hVTWJQNnMrUGQveEtM?=
 =?utf-8?B?Ym0wZEJGY2h2dlFhZVhHMkNpbCtWanpMNHQ2am1GcmVLL0dVcHFYcHdIVjlm?=
 =?utf-8?B?eVdJVzRWVSt4Ym56L0xrclZRUEZwOTZkTVZqVkcyeFJVd1oyYWZjL0lXc1BV?=
 =?utf-8?B?WHE0dllyaWc1SDBXSWY1SFl1MDFPSHhXOFhPSlJjcHROdGN4T1A3M2ExcGhD?=
 =?utf-8?B?U2x0VlZSUWpvVUdkV3VPY0tFTWllZGNzYzE2aHcyRjIzTnhmU3FZZTlLUktK?=
 =?utf-8?B?OVBlUm0zQ0ViNTlpLzVjalE3ancrQTlOcWYvOU1iMG1CbVlPUDJkVUFvbEVZ?=
 =?utf-8?B?VG5DSDFwNTkxbnJyUFpobGF1U0hsdXFMdEdZRkdXdkptYmhLQzBTcGVmWllp?=
 =?utf-8?B?SHFQd3ZUb3JkTnZEK2pTYlFGVDRFaElVL1BiNVEzMTl5ME1CK25nODVIcXVK?=
 =?utf-8?B?VTE2NE16Y2x1R3pHRUJxZU1aNUZYd2VyVnFyWjBjaTJ4NEdOcFcxdlUzT21W?=
 =?utf-8?B?V0IzeXYyNVBCUDBtR01MdmlkOWEvbHlXaVQwUjlUTTVBOG9yZERWR29wdjF3?=
 =?utf-8?B?UDJ0ODVaVUJsKzVQMnJBU0Y0dHc0d2QyVXN2YWxvNlFxcHhDY2lBV3FDbCtC?=
 =?utf-8?B?VHpjMGppa0JETHU2Y0RLdEhIUE1WazVPL3RSMDNDVlpTV3UrWElrbFNKREkz?=
 =?utf-8?B?eWJGM2RqMVZDcmIxdjJSalJvZ1YrYXozYzRrM2RYWnhJWmxkOG0rako2TEow?=
 =?utf-8?B?OUM1Y0s0RjZNTVdQdmdQTmlNVDltdFNtQ3Z3VGgzUDJvYm81bGFYemN1WEtX?=
 =?utf-8?B?TXV3cENlRFIzMkVnZU1jQkRhSURPTWZtQ0dCYVBXcWtPNEhiSWtNR041OTVz?=
 =?utf-8?B?NGNvMHEzeE44WlU5T2d2SHFXZ0R1bFlpWWN6R3pkTmV2SzdwOGdCRTE0QVBT?=
 =?utf-8?Q?9+kAHA6ylI4v+9VgjTg9hhJ6exWrOsiF?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?THFTbmNaRVVpZFhNNVZBL0p5QTBnNzJ3UDcvYnlsZFltRk9WRTNXcTNZR3ZE?=
 =?utf-8?B?UmdPa2tzV2pNZnNKMFdaWjJRT00yeEduRGZrKzFITzZPMHJKQTVCQUtiZW5S?=
 =?utf-8?B?eFVieWJCWTFqRC9ZYnZHNzYyNVNQRlY0cnN2WW9td05XUnFzNVF2Ym9haFpN?=
 =?utf-8?B?Z2pRaGw2dzJST3M3WWhtbWU5b0xwZHQwYzJueWRhU2g5UmhQOURUZEZtZzRz?=
 =?utf-8?B?UUxoR1FSY0hGUjhtUGg5UEJBRzA2Z3FVK0U3T0w4T095R1lRVlc0MEVNZWVL?=
 =?utf-8?B?UTNzMUZSQmE1UXRyUFJYc1dmSzd6SmQ2Kzg5djdmeUV3bkFTNWRKbUpUSTNZ?=
 =?utf-8?B?a0JVWTNFWDVlVVdVR0czRFU0eGJiKzV6bjl5R3R3eUhtL25ITGMzTGJxeS9m?=
 =?utf-8?B?UHYyQnJOWStZcG4rK2MzTGQyaXE1SCtndG5kWDZEdStoakdvNDdHWnFYYkdm?=
 =?utf-8?B?Y0w3ZWlJQnEzNHBwbk40OG5MSTFRMnNFd0U1UWJvNDhxMWNyb2JNUVBPaGRP?=
 =?utf-8?B?ZEdvM0JidXVubEsySm1mRTJWOUFnUVBKQXhPRTl1NEFQOGVxekx6S2lLL0Vq?=
 =?utf-8?B?VTdLMktFclcvT2dCeUN3QUtjZXFPYVR4WldOVldGS2lSOXc5ZjU1V0dHQ1lY?=
 =?utf-8?B?Rk1OSzJVRHBZMnJaRFVPdVh3VnhsS2YrRU5DRVFlZXFqMERZSFBKYmVKTHJZ?=
 =?utf-8?B?TU1GYVZSeHpBaFpLUU5nSjlZSUJjN2VTaEErdnFWdjUxVmRXR0R3SG1mZFpK?=
 =?utf-8?B?Yks3bUdZWmkxR3pLclNUL2JSWVllKzQybGtUVGtPU0NUV3FzcGc3TU9ITmZB?=
 =?utf-8?B?WmRMeVpWRjZMYjVmOVdxVit1dlBVUGVZRUo5UjY5UDIzR3c5TlExT1JLcHBV?=
 =?utf-8?B?OHhvWlJKMUQxMHFvU3hIQWN2Ynl0VERMbjlCaC9xdE92NWVXdnFBajgxQ3N4?=
 =?utf-8?B?VFcrR1FKcFdGSzU3bGo5bm1JU3Uya05SaXNWdVdJSlVqeFFldjVKOUs5S093?=
 =?utf-8?B?eWhjeTA2b1BHNzZuM2tSbFV4WVlzNjluQllrUWhmNkIzZlN4RHFJek8wckxi?=
 =?utf-8?B?ZmthMGZMSmoxc2RBMENNUU5OZDUxdzI3cGxLTW9hYUNYV0tBeDdheXk1SEor?=
 =?utf-8?B?VHFVczZWNlRqelVubkxYa3ZaY3RPSC9MK25PNlBTemN4d2Jzb3ZLam1PTmZR?=
 =?utf-8?B?UExiVlgrZHZGUjVzc0JIdFc0cEdTajV5V0JoTE03UnZUU2MzVktLRmpGS2Zq?=
 =?utf-8?B?bUdicUdLLzlkSWJqckl6eUJ4YjJMOXQ3azc4V25JMS82S0JsL2cvU2xDdmtL?=
 =?utf-8?B?ME9kWjBqYnFWL21FOU1MemhUTHpEYjRwTTY5ZUJ1LzFLcVQwS3Fhc2hmR1RD?=
 =?utf-8?B?dHdleDhzSFFTOVpkVURhVmxJb2tzVlpKVGx0U0ZRdDA1dzlOdGo4MHd3T0pZ?=
 =?utf-8?B?bmlCbncvYlE3ekVrVlR1OEpIZEhGYyt2MkJ4N09aSkFtU09heGZMK0t5cXBT?=
 =?utf-8?B?MDZxRWRHZ3p0OFozVEdsbHdaWmI5YTRnTUxmMm4zOVhVdEY3ZEhQMWpINlYv?=
 =?utf-8?B?cS9uRTFybHNvaUNaYW1HUkV6Z2JWd09tSkExRER5VEhIS0xNUm5tVGJKaGdz?=
 =?utf-8?B?OUpBWkhQc3Njb3huWUxHWEUyWUZVanpjZVFWYUt1aTV0Tmh0Umo4TTVCUVRS?=
 =?utf-8?B?cUdhVXJidzdUa1JFMG1jT2dMSmFQWiszNXRXdmlZOXhQN1RVY1NXblBvWW9E?=
 =?utf-8?B?ekRUNmd1N0RSSnlpeFRvTGJCRGNjY2RSS09tYXB6bEI4S2NNNTBNSTY5bW1P?=
 =?utf-8?B?aFUyL1hGWlIwc2V4OHlnQkNUdkdEalZMaFQwY3k1SVQvYmdkQ0QzYW5nbGpP?=
 =?utf-8?B?ZG1pWXllbW5Jb056dVliRks0QkZlOEw1Y1VBYWRKY21YSHBJQXpsNnkzejVz?=
 =?utf-8?B?ZDMxY1krcm9tVDdHSjlvMGxTSjhxY2FrSHFGbVhlZmNMRHpLWGtLemJkSDZ1?=
 =?utf-8?B?R0pPWlQrK0dVZGVib2JKY0loYWVQWjlKcm9XalZiZCtod0JYOUpUbk5TRmoz?=
 =?utf-8?B?cFN4dTlzN1VIeGlFcldxVmpqT1BNVlh2RTdFY3d4SE4zOVFxUHRvSkwwcVpW?=
 =?utf-8?B?SmVaRWtRRHdwb1RFOGxzMTBWWG9ZNW5ObldkV2gvZUpGOUdUZVlFWjBxcFVn?=
 =?utf-8?Q?iqlJazkZYrS1mGChJGprRe8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 83751ed9-dfbf-4d16-feb9-08de3909178b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 23:00:34.7509 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uN+rubzx62a1ERUlA3yhDCoPzz80qcDYZUBHaDL+cRD6NzFl3t3JWTH3bW4oBBTjAPFswfYnVw//E0bpEean9wckhL8w3jwqDgeM4KG0HPI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7338
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



On 12/11/2025 10:59 AM, Michal Wajdeczko wrote:
>
> On 12/11/2025 2:57 AM, Daniele Ceraolo Spurio wrote:
>> Scheduler groups are enabled by sending a specific policy configuration
>> KLV to the GuC. We don't allow changing this policy if there are VF
>> active, since the expectation is that the VF will only check if the
>> feature is enabled during driver initialization.
>>
>> The functions added by this patch will be used by sysfs/debugfs, coming
>> in follow up patches.
>>
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> ---
>> v2: code improvements, add GUC_MAX_SCHED_GROUPS define, don't add
>>      XE_SRIOV_SCHED_GROUPS_NONE to supported_modes (Michal)
>> v3: fix enum/integer mismatch, use GUC_MAX_SCHED_GROUPS to define the
>>      max KLV length and not the other way around
>> ---
>>   drivers/gpu/drm/xe/abi/guc_klvs_abi.h         |  19 +++
>>   drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c    | 151 ++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h    |   3 +
>>   .../gpu/drm/xe/xe_gt_sriov_pf_policy_types.h  |   6 +
>>   drivers/gpu/drm/xe/xe_guc_klv_helpers.c       |   2 +
>>   5 files changed, 181 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>> index 265a135e7061..f0a87a1cb12f 100644
>> --- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>> +++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>> @@ -8,6 +8,8 @@
>>   
>>   #include <linux/types.h>
>>   
>> +#include "abi/guc_scheduler_abi.h"
>> +
>>   /**
>>    * DOC: GuC KLV
>>    *
>> @@ -200,6 +202,20 @@ enum  {
>>    *      :0: adverse events are not counted (default)
>>    *      :n: sample period in milliseconds
>>    *
>> + * _`GUC_KLV_VGT_POLICY_ENGINE_GROUP_CONFIG` : 0x8004
>> + *      This config allows the PF to split the engines across scheduling groups.
>> + *      Each group is independently timesliced across VFs, allowing different
>> + *      VFs to be active on the HW at the same time. When enabling this feature,
>> + *      all engines must be assigned to a group (and only one group), or they
>> + *      will be excluded from scheduling after this KLV is sent. To enable
>> + *      the groups, the driver must provide a masks array with
>> + *      GUC_MAX_ENGINE_CLASSES entries for each group, with each mask indicating
>> + *      which logical instances of that class belong to the group. Therefore,
>> + *      the length of this KLV when enabling groups is
>> + *      num_groups * GUC_MAX_ENGINE_CLASSES. To disable the groups, the driver
>> + *      must send the KLV without any payload (i.e. len = 0). The maximum
>> + *      number of groups is 8.
>> + *
>>    * _`GUC_KLV_VGT_POLICY_RESET_AFTER_VF_SWITCH` : 0x8D00
>>    *      This enum is to reset utilized HW engine after VF Switch (i.e to clean
>>    *      up Stale HW register left behind by previous VF)
>> @@ -214,6 +230,9 @@ enum  {
>>   #define GUC_KLV_VGT_POLICY_ADVERSE_SAMPLE_PERIOD_KEY	0x8002
>>   #define GUC_KLV_VGT_POLICY_ADVERSE_SAMPLE_PERIOD_LEN	1u
>>   
>> +#define GUC_KLV_VGT_POLICY_ENGINE_GROUP_CONFIG_KEY	0x8004
>> +#define GUC_KLV_VGT_POLICY_ENGINE_GROUP_MAX_COUNT	GUC_MAX_SCHED_GROUPS
> nit: maybe we should still add LEN defines?
>
> #define GUC_KLV_VGT_POLICY_ENGINE_GROUP_CONFIG_MIN_LEN 0
> #define GUC_KLV_VGT_POLICY_ENGINE_GROUP_CONFIG_MAX_LEN \
> 	(GUC_MAX_ENGINE_CLASSES * GUC_MAX_SCHED_GROUPS)
>
>> +
>>   #define GUC_KLV_VGT_POLICY_RESET_AFTER_VF_SWITCH_KEY	0x8D00
>>   #define GUC_KLV_VGT_POLICY_RESET_AFTER_VF_SWITCH_LEN	1u
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
>> index 003860661687..7738d515ea9e 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
>> @@ -97,6 +97,23 @@ static int pf_push_policy_u32(struct xe_gt *gt, u16 key, u32 value)
>>   	return pf_push_policy_klvs(gt, 1, klv, ARRAY_SIZE(klv));
>>   }
>>   
>> +static int pf_push_policy_payload(struct xe_gt *gt, u16 key, void *payload, u32 num_dwords)
>> +{
>> +	CLASS(xe_guc_buf, buf)(&gt->uc.guc.buf, GUC_KLV_LEN_MIN + num_dwords);
>> +	u32 *klv;
>> +
>> +	if (!xe_guc_buf_is_valid(buf))
>> +		return -ENOBUFS;
>> +
>> +	klv = xe_guc_buf_cpu_ptr(buf);
>> +
>> +	klv[0] = PREP_GUC_KLV(key, num_dwords);
>> +	if (num_dwords)
>> +		memcpy(&klv[1], payload, num_dwords * sizeof(u32));
>> +
>> +	return pf_push_policy_buf_klvs(gt, 1, buf, GUC_KLV_LEN_MIN + num_dwords);
>> +}
>> +
>>   static int pf_update_policy_bool(struct xe_gt *gt, u16 key, bool *policy, bool value)
>>   {
>>   	int err;
>> @@ -397,6 +414,17 @@ static void pf_sched_group_media_slices(struct xe_gt *gt, struct guc_sched_group
>>   	if (group < 2)
>>   		return;
>>   
>> +	/*
>> +	 * If we have more groups than the GuC can support then we don't want to
>> +	 * expose this specific mode, because the GuC will return an error if we
>> +	 * try to enable it.
>> +	 */
>> +	if (group > gt->sriov.pf.policy.guc.sched_groups.max_groups) {
>> +		xe_gt_sriov_notice(gt, "media_slice mode has too many groups: %u vs %u\n",
>> +				   group, gt->sriov.pf.policy.guc.sched_groups.max_groups);
> nit: is this something that could happen in production build on production platform?
> maybe assert or dbg will be sufficient

My worry here is with derivative platforms, because those tend to be 
GuC-compatible with the base platform. Let's say we get a derivative 
with 3 media slices; a new GuC would be released to support 3 groups, 
but the old GuC would still likely run on the new platform and that 
would only support 2 groups, leading to this check failing. It's 
unlikely, but not impossible.

>
>> +		return;
>> +	}
>> +
>>   	/* The GuC expects an array with a guc_sched_group entry for each group */
>>   	values = drmm_kcalloc(&gt_to_xe(gt)->drm, group, sizeof(struct guc_sched_group),
>>   			      GFP_KERNEL);
>> @@ -459,6 +487,15 @@ static void pf_init_sched_groups(struct xe_gt *gt)
>>   	if (!xe_sriov_gt_pf_policy_has_sched_groups_support(gt))
>>   		return;
>>   
>> +	/*
>> +	 * The GuC interface supports up to 8 groups. However, the GuC only
>> +	 * fully allocates resources for a subset of groups, based on the number
>> +	 * of engines and expected usage. The plan is for this to become
>> +	 * queryable via H2G, but for now GuC FW for all devices supports a
>> +	 * maximum of 2 groups so we can just hardcode that.
>> +	 */
>> +	gt->sriov.pf.policy.guc.sched_groups.max_groups = 2;
>> +
>>   	for (m = 0; m < XE_SRIOV_SCHED_GROUPS_MODES_COUNT; m++) {
>>   		u32 *num_groups = &gt->sriov.pf.policy.guc.sched_groups.modes[m].num_groups;
>>   		struct guc_sched_group **groups =
>> @@ -478,14 +515,127 @@ static void pf_init_sched_groups(struct xe_gt *gt)
>>   		}
>>   
>>   		xe_gt_assert(gt, *num_groups < GUC_MAX_SCHED_GROUPS);
>> +
>> +		if (*num_groups)
>> +			gt->sriov.pf.policy.guc.sched_groups.supported_modes |= BIT(m);
>>   	}
>>   }
>>   
>> +/**
>> + * xe_sriov_gt_pf_policy_has_multi_group_modes() - check whether the GT supports
>> + * any scheduler modes that have multiple groups
>> + * @gt: the &xe_gt to check
>> + *
>> + * This function can only be called on PF.
>> + *
>> + * Return: true if the GT supports modes with multiple groups, false otherwise.
>> + */
>> +bool xe_sriov_gt_pf_policy_has_multi_group_modes(struct xe_gt *gt)
>> +{
>> +	return gt->sriov.pf.policy.guc.sched_groups.supported_modes;
>> +}
>> +
>> +/**
>> + * xe_sriov_gt_pf_policy_has_sched_group_mode() - check whether the GT supports
>> + * a specific scheduler group mode
>> + * @gt: the &xe_gt to check
>> + * @mode: the mode to check
>> + *
>> + * This function can only be called on PF.
>> + *
>> + * Return: true if the GT supports the specified mode, false otherwise.
>> + */
>> +bool xe_sriov_gt_pf_policy_has_sched_group_mode(struct xe_gt *gt, u32 mode)
> nit: shouldn't this 'mode' param be declared as enum xe_sriov_sched_group_modes ?

I wanted to avoid having enum xe_sriov_sched_group_modes in the .h, 
since that would require including the types.h as well, but if you think 
that's worth it I'll add it in.

Daniele

>
>> +{
>> +	if (mode == XE_SRIOV_SCHED_GROUPS_DISABLED)
>> +		return true;
>> +> +	return gt->sriov.pf.policy.guc.sched_groups.supported_modes & BIT(mode);
>> +}
>> +
>> +static int __pf_provision_sched_groups(struct xe_gt *gt, u32 mode)
>> +{
>> +	struct guc_sched_group *groups = gt->sriov.pf.policy.guc.sched_groups.modes[mode].groups;
>> +	u32 num_groups = gt->sriov.pf.policy.guc.sched_groups.modes[mode].num_groups;
>> +
>> +	return pf_push_policy_payload(gt, GUC_KLV_VGT_POLICY_ENGINE_GROUP_CONFIG_KEY,
>> +				      groups, num_groups * GUC_MAX_ENGINE_CLASSES);
>> +}
>> +
>> +static int pf_provision_sched_groups(struct xe_gt *gt, u32 mode)
>> +{
>> +	int err;
>> +
>> +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
>> +	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
>> +
>> +	if (!xe_sriov_gt_pf_policy_has_sched_group_mode(gt, mode))
>> +		return -EINVAL;
>> +
>> +	/* already in the desired mode */
>> +	if (gt->sriov.pf.policy.guc.sched_groups.current_mode == mode)
>> +		return 0;
>> +
>> +	/*
>> +	 * We don't allow changing this with VFs active since it is hard for
>> +	 * VFs to check.
>> +	 */
>> +	if (xe_sriov_pf_num_vfs(gt_to_xe(gt)))
>> +		return -EBUSY;
>> +
>> +	err = __pf_provision_sched_groups(gt, mode);
>> +	if (err)
>> +		return err;
>> +
>> +	gt->sriov.pf.policy.guc.sched_groups.current_mode = mode;
>> +
>> +	return 0;
>> +}
>> +
>> +static int pf_reprovision_sched_groups(struct xe_gt *gt)
>> +{
>> +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
>> +	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
>> +
>> +	/* We only have something to provision if we have possible groups */
>> +	if (!xe_sriov_gt_pf_policy_has_multi_group_modes(gt))
>> +		return 0;
>> +
>> +	return __pf_provision_sched_groups(gt, gt->sriov.pf.policy.guc.sched_groups.current_mode);
>> +}
>> +
>> +static void pf_sanitize_sched_groups(struct xe_gt *gt)
>> +{
>> +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
>> +	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
>> +
>> +	gt->sriov.pf.policy.guc.sched_groups.current_mode = XE_SRIOV_SCHED_GROUPS_DISABLED;
>> +}
>> +
>> +/**
>> + * xe_gt_sriov_pf_policy_set_sched_groups_mode() - Control the 'sched_groups' policy.
>> + * @gt: the &xe_gt where to apply the policy
>> + * @value: the sched_group mode to be activated
>> + *
>> + * This function can only be called on PF.
>> + *
>> + * Return: 0 on success or a negative error code on failure.
>> + */
>> +int xe_gt_sriov_pf_policy_set_sched_groups_mode(struct xe_gt *gt, u32 value)
>> +{
>> +	if (!xe_sriov_gt_pf_policy_has_multi_group_modes(gt))
>> +		return -ENODEV;
> nit: maybe at this point we could just assert and force the caller (debugfs) to check?
>
>> +
>> +	guard(mutex)(xe_gt_sriov_pf_master_mutex(gt));
>> +	return pf_provision_sched_groups(gt, value);
>> +}
>> +
>>   static void pf_sanitize_guc_policies(struct xe_gt *gt)
>>   {
>>   	pf_sanitize_sched_if_idle(gt);
>>   	pf_sanitize_reset_engine(gt);
>>   	pf_sanitize_sample_period(gt);
>> +	pf_sanitize_sched_groups(gt);
>>   }
>>   
>>   /**
>> @@ -524,6 +674,7 @@ int xe_gt_sriov_pf_policy_reprovision(struct xe_gt *gt, bool reset)
>>   	err |= pf_reprovision_sched_if_idle(gt);
>>   	err |= pf_reprovision_reset_engine(gt);
>>   	err |= pf_reprovision_sample_period(gt);
>> +	err |= pf_reprovision_sched_groups(gt);
>>   	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
>>   
>>   	xe_pm_runtime_put(gt_to_xe(gt));
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
>> index f5e3b2595063..d1b1fa9f0a09 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
>> @@ -18,6 +18,9 @@ bool xe_gt_sriov_pf_policy_get_reset_engine(struct xe_gt *gt);
>>   int xe_gt_sriov_pf_policy_set_sample_period(struct xe_gt *gt, u32 value);
>>   u32 xe_gt_sriov_pf_policy_get_sample_period(struct xe_gt *gt);
>>   bool xe_sriov_gt_pf_policy_has_sched_groups_support(struct xe_gt *gt);
>> +bool xe_sriov_gt_pf_policy_has_multi_group_modes(struct xe_gt *gt);
>> +bool xe_sriov_gt_pf_policy_has_sched_group_mode(struct xe_gt *gt, u32 mode);
>> +int xe_gt_sriov_pf_policy_set_sched_groups_mode(struct xe_gt *gt, u32 value);
>>   
>>   void xe_gt_sriov_pf_policy_init(struct xe_gt *gt);
>>   void xe_gt_sriov_pf_policy_sanitize(struct xe_gt *gt);
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy_types.h
>> index d228cadcd8b0..04015fb907ee 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy_types.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy_types.h
>> @@ -24,6 +24,9 @@ enum xe_sriov_sched_group_modes {
>>   
>>   /**
>>    * struct xe_gt_sriov_scheduler_groups - Scheduler groups policy info
>> + * @max_groups: max number of groups supported by the GuC for the platform
>> + * @supported_modes: mask of supported modes
>> + * @current_mode: active scheduler groups mode
>>    * @modes: array of masks and their number for each mode
>>    * @modes.groups: array of engine instance groups in given mode, with each group
>>    *                consisting of GUC_MAX_ENGINE_CLASSES engine instances masks. A
>> @@ -33,6 +36,9 @@ enum xe_sriov_sched_group_modes {
>>    *                    are in the same group.
>>    */
>>   struct xe_gt_sriov_scheduler_groups {
>> +	u8 max_groups;
>> +	u32 supported_modes;
>> +	enum xe_sriov_sched_group_modes current_mode;
>>   	struct {
>>   		struct guc_sched_group *groups;
>>   		u32 num_groups;
>> diff --git a/drivers/gpu/drm/xe/xe_guc_klv_helpers.c b/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
>> index 146a6eda9e06..1b08b443606e 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
>> @@ -26,6 +26,8 @@ const char *xe_guc_klv_key_to_string(u16 key)
>>   		return "sched_if_idle";
>>   	case GUC_KLV_VGT_POLICY_ADVERSE_SAMPLE_PERIOD_KEY:
>>   		return "sample_period";
>> +	case GUC_KLV_VGT_POLICY_ENGINE_GROUP_CONFIG_KEY:
>> +		return "engine_group_config";
>>   	case GUC_KLV_VGT_POLICY_RESET_AFTER_VF_SWITCH_KEY:
>>   		return "reset_engine";
>>   	/* VF CFG keys */
> again, just nits, so:
>
> Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>

