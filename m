Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D87DFC5CFDB
	for <intel-xe@archiver.kernel.org>; Thu, 13 Aug 2026 10:25:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CD5910E028;
	Thu, 13 Aug 2026 10:25:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OwPn95dY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8FF210E028
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Aug 2026 10:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786616729; x=1818152729;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=5zX/TTAVEx2m6ihtFxBA7yTlKC1JJPUGROInD57+ZxY=;
 b=OwPn95dY/wUJgGPVM23Wl6lMB5D96/HV9kKbQ9OWd8duuxbVyiWXNimp
 btnfMa8zeYV4ay5+MUJUCO1TrknV7oETYHjNSKrH63vRSKxjBPyW4Spet
 GMlySBmKQn+AS4m3ZKmt0Y3AjgdT9W71BuCUjYz8ktykJDSJMmsnFzGwl
 F06ulQCpZCWf9uBr844Qx+D3SdEsD9uBbkv9ZYyHdl/9PK8bUoqjgka5A
 9/DA2I56pnaal/eZnsADIB7uxAr1CxB1ksEBmii2QWXC6dnzFr81+0Twt
 87uwFLQM1naXKbz6NgveW0iZfZp47AjPNePDvheRAmOnXPML5TGVXbjs1 A==;
X-CSE-ConnectionGUID: y2GWUmotRQaYDJKD0gqzFA==
X-CSE-MsgGUID: xvBcdqMDTv2wWvg7yFAExA==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="90865423"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="90865423"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 03:25:28 -0700
X-CSE-ConnectionGUID: kyxw0y8mQoOhsktuLrG4ug==
X-CSE-MsgGUID: dW9FnMJnSmu23eCQB9VYpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="265887228"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 03:25:28 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 03:25:27 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 13 Aug 2026 03:25:27 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.6) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 03:25:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vbjXSDIUSmMc3kuU8YWUbR7Fs5zmvt5AhGD/FPq+yXKcicqXkjOhfiPjRMXjUc8TaICvHWd3T1NXgOOFZ+P9oDqjilyMyaTMpA3ca+VmuUjoZgjtVPYGocRCX1R6vYPQTOMioqSH7b2eFVnk/ddy14d5Aq1NQ7oUj05dOSG4TjtyXMIsk5IB42PqxGGK/vFFMLmVAeUcm/a++4Bxxk7UlXSdUfo+fyfHJ6BDBb7AKRBj88II4G/cX+uvxqyJf0Vk06D4f7Eq1pv9EGG5D26fJTR9Ha4eGZlTaQLQu7MGE69tXJ4IXzlIkcsHGNmYMC1FcT49a58uL3lDWDr5wK6bSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p5bkLuaW1T8TYA1CABT2ITM+H8cFNAXL/Whq2+rFPvo=;
 b=PXINNhZLSq9vxcnizaLyRD5TWoCl19Ri4fnwbt/07Seq1rJYtlrKgtX5JUcJtfal0tkspgHH2BMvLAvuLrYKXhDHhIW0eww94ijhAiWVw7yNDHImsTQe+4I4rTJPy+Vq2mNlgIPs3axL7ujQrg+M2JTwI2umQObzOY4A1OHs8xVbEScsGowDCvYVnSJyVqfQM/HPp/epv0jqMrxiqlWxaQsWtuJszQYUcEMyoWHhu3UXpM9uxV/rBMFY5QV5TqSu/j7jCSA6+yAcavPRuSeWXxstsiWJMPhNYn9dDxCX+ppfuQtaTWIZ1IzOJL9DQ6+pqpmyougUNuyN0cUcCQoIVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by IA1PR11MB8802.namprd11.prod.outlook.com (2603:10b6:208:598::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Thu, 13 Aug
 2026 10:25:19 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0315.012; Thu, 13 Aug 2026
 10:25:19 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v1 0/4] Introduce PF-mem VRAM regions
Date: Thu, 13 Aug 2026 12:25:07 +0200
Message-ID: <20260813102511.200690-1-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DUZP191CA0034.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:4f8::11) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|IA1PR11MB8802:EE_
X-MS-Office365-Filtering-Correlation-Id: 70fba99d-6e11-418b-4058-08def9252cab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|18002099003|11063799006|56012099006|10067099003|6133799003;
X-Microsoft-Antispam-Message-Info: grWQi67mNeYrinMGD1GkVQbxHWhJqDoRm6rmVCpHWy4QMhSE7DEItzaTZLlkc/r911dYGA3P0WmHDyS5GB4WC48VhGh2lTkqcqJRg60eiSdmb173UcCocIDSVQ5+M41oXKwZqVD7xca+9BRc3jFucIzP95nM6Ca0d3bM1trh/LaGwikcYZOU/wxegv0JViqAaI8pyKqHatq7wtQo4r8COevWTgCj9NBR8E3sNgefxnNowznx8ssYvFsgNTnSSsu8q6Wb0ij/arAbFL3qlxd8DKwrIvKh5ykM5KmEtvfHHM185bU4JMNoZ7pWYaE8oSp8URR3jjeM+jcxFLggNCLQFCVKeYEM5hxtKwEUTerUGaatRJbADt7LSAzMdWGKvk5R8KD3cHl1uztMoevuPkDTyrYyDzjL6X0QzUi9Wk6TJA3WThpL2U+Ipm/cUtZJDW9t84NRuGa/iYnhupfdwEUaMCGeuW8/sv5llq7nxKREmxCKSj3HafAXcwvk9sa8XN2+uKxqJdeVWWUflpENQtmX0uC5W4pW5gdfpGxF688RKrLT6q8JsaO8mPvLCURw169ta7VSMCSvncY8ZrCwVty7TS80vN5CaJK8V6arOIHMiTopVFHQo2WuAcQTjs29evsfg8FekavUJQ2CUgLhHy1slGR3UOaHfmV4NuHZLVv9vrI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(18002099003)(11063799006)(56012099006)(10067099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YXdjbjcvN2N5aTdhUmhKTTFFSi8xcVYwVFdZazA3MmM1KzZoMHlrVnVhbFRU?=
 =?utf-8?B?SThoUC95K0FyQmhjTEt3M1I4RWlWRmYrZzFXbVR1RCthb0w4TXMvQklGZCsy?=
 =?utf-8?B?SFB5YWp0bk90a2lBWjhKb0tqN2pJR3BPZEJEa2FXZkdpVStzSldIb2RGZjNV?=
 =?utf-8?B?WkwxU0RzdVE5WHBBTC94RHZISTN3TW1rMWdsc0V3NEYxNWhIbjB6TUhLYVdS?=
 =?utf-8?B?SytyM2I0czd0Z0xaSzhqa2JJNjY5NTJCV0VXbHA4L0dnTGpUbkhUdWpBTFFa?=
 =?utf-8?B?cDFIRHllSHNRWnYzWmVqRTFhMGo4ZmQ4QTFleU5yRFBKVG1jUUNVaUp5bWds?=
 =?utf-8?B?N1hIeDV2OGFiQUl3Q3NLUUdIYVcra1NIdTlYcDFMVUR2dktQMm5TVUE5M0s1?=
 =?utf-8?B?M1pVcmxSR3NZam9xc2ZxYnczOTlNekhUaEV5UnJGaTIzZ3Z4bldQdHk5SDFB?=
 =?utf-8?B?WVcxL2thYnJ6dHdSTSs0Zk5sY0R6Ly85UU9BMzlZZkZoZ25xOG9ZS2xQUTVz?=
 =?utf-8?B?V2QreFRuZGh1VVVmbXRYd1hBNk9iY0tGaVpZQ1VPd253Qi9VZlk5NjFER0N1?=
 =?utf-8?B?TDBhN1JNWU1zUEdJRmgrbnNRc2ZFaTBsK0Y1RkVIUDFnYmp6K0pkY3o4YmYy?=
 =?utf-8?B?ZlNBQjJFU1dPY1BYeW5SMDZ2aEdsaC9DUlFuNFRPYWdnN3YxRUpIZXJycFdY?=
 =?utf-8?B?bVZPZWJZMGRsSzhLaDRsZ09QMy9ZWm5SRjVMT3BPR0UzOXpqYlY4c0s1K0lW?=
 =?utf-8?B?U2Y2YU9YRFJuUmVGalBnY1k2WlVRL2RkVk96bHRwQW9xR2NUQzJYZ2Q4VWw3?=
 =?utf-8?B?UWFMQVFqUmc0b3JDOXNvT2RQR2U3SVJESkV6TTYrSW12MHdHR3UvNk5HUlAr?=
 =?utf-8?B?enlBKzFGdXIwMHpKWEZMMGZrYlp2bTRGLzFWbHliMkhidXJ6QmVZQnBrZ28w?=
 =?utf-8?B?Wmp6SG93aFlBcUZER2VDY24wVW05Tk5NTmsvTExRMFFZZnpjRkN4b3BNMUZW?=
 =?utf-8?B?dCtBVzRTWUgyOHhHTERBQ1d0dHAzbHFPVzZLdWxIclNtTjVDRnFHNDZEeTlk?=
 =?utf-8?B?MDNrT2xUdkN2YmlQODYyQ29nZ3dOSklCUnhLU1NPV2VGN0RzcXRTZEg3YVd2?=
 =?utf-8?B?TmZaUUVGL3B1VG5TRGx4anFTR1dpUXlvT2ZWSDJtUm9HeVhvUmZiemJUZE9C?=
 =?utf-8?B?QXN2ODVuTFhDczZqdGRKeUF6eEdtSUZvMWVaZ0ExQUpxMmZYTFlIbHpNc2Z4?=
 =?utf-8?B?Q2dhUlRvQTdWZ1FyK0Jsa1gxUjhQeWxTOTFyMEIrSFQvenpqa0NnTm5POU80?=
 =?utf-8?B?WEhwbFB0MVFNaWRKWU9Eam5uNDh3dHNzbXhDSmZTK1dMSkxwYTJtZzFQZWN4?=
 =?utf-8?B?azFETy9zeTNYVzVpT2M5QURNbDVNcERFYXFTU1NHQmZ2Q3habm5aWDY4VG80?=
 =?utf-8?B?K05UMmxqeTNTVTVhQTNOWC96YU0rNnFFbXU1cXgzVkM3MlpYSCtGZHJkcDFj?=
 =?utf-8?B?UlBuZWg3dkRtK1Z3RnhCb01QWXpMbGg3SE03OTVOUDloL1pCbjFCZGMyU3RD?=
 =?utf-8?B?UGtOdFpUSVluUWk0K2YwRU5vdFRwUlVCa08zVVZsZWZUWjNXKzRZQml2NlYy?=
 =?utf-8?B?K0k4U09rVldNYytsQnpqV25oOTJMQ0o5cWdTdFBRYVhIUHVtdGFCTVM2a2lX?=
 =?utf-8?B?dk5kcDFkTjBjOUhqV0VnUkcva2dzMEZta3dPclllSURDTXhscEVnNVJ6MHFO?=
 =?utf-8?B?ZytUV1pwM1E3K0ZycU0za0taOTAvdFRacGRpSjUvU0NjRnVWKzlQTHJQUUc5?=
 =?utf-8?B?MjJtMnhKazlwbVgwNkZjOG4vY1VXcVdaT09BYnhlR1V6YWVUQkRwb1N1WnZu?=
 =?utf-8?B?RzJUWWNiRVEwOVlna3RqWmczdGRHRlFmbFZvN2JjOGthMlVVZ2c2ODEzYXgz?=
 =?utf-8?B?UWVLRlo5b05XZEVxRWkzUnNXdWFkazBXZDc4VXB2S0hFa1Z6VnBnbUk0c2xI?=
 =?utf-8?B?d0ltVjF0c1NSNy9MZE9rcXRha3RHMnhxUFZ2TFNsQ0tZaTJ2NktScGhreml6?=
 =?utf-8?B?R1pYSW00WTBaTjNFRFRIZEcvYXVnSkJMUmhkUHQwRXdXT1BhRkZ3aGxTVCtU?=
 =?utf-8?B?SkRyRG12ZVdhOTlvYjVSWFlsNWRVcXpjQUxtOGtESXRmbEhJMVlaajhlQVRB?=
 =?utf-8?B?UjFzRWtZSG9rd3dLeVR4UG84ZE85d0pRYUx6SHhkMkVSd1JUenZ3aFI3Tk4y?=
 =?utf-8?B?WkQyZzN6MkM1dXlWak5lTWVJakZSS2RZTGo0OEhsVWpnR0lUMVNBdGt1Qmx4?=
 =?utf-8?B?UGg0SjI3UjIxNU5mclh4NGs2SjRNMU9SSXpYVmJ4aXJIbFN4Vkd1K2I4akgz?=
 =?utf-8?Q?obfODA5TOke8WMos=3D?=
X-Exchange-RoutingPolicyChecked: rJ/3zFrzBG78/wV1IacgXQ0oyRe60ySdbDMBjRS57e/rXb1eQFSrvef3k9yb8SgBVPYxYRTv0Rzm5jAjJ/JxJKO/YNcqzqhgCY0AHm9u9QcEfg1QaAk8NaGJJRAcEu0m5uzV1lEMB3qeS0BHW474rBBlyD3eDE4UhL/WFnEV7HHoqOCGLGWHGgxYAle110JyypblT+NwT0CTRht615pUx4w//mV5R1Heeb+FHNLFM6LZrg1o/QmxZRUmAh0rI29kiKORNaz/E22DFhTROt2GF3vI0L1cSAXwoKL8C1pNZmKiswjoRHobCpif9I6oZeRAs6TV8dMTKm0G7O47TEMxyA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 70fba99d-6e11-418b-4058-08def9252cab
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 10:25:19.3841 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pbMqqtZxcLW3z2JAhT/2WMl4nMhuHLswg68XaDn3kYoVnaH2he/4eB4c5anytgTjhIDgU1GKtzZr0tT7RgeC1WKh9EOkLT9aIY/cwNo+kY8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8802
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

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

This series lays the groundwork for PF-mem regions: VRAM regions
dedicated to kernel-only allocations, where buffers are allocated
exclusively by the kernel driver and are never exposed to userspace
workloads.

Today a tile exposes a single VRAM region shared by both kernel and
userspace allocations. Some use cases need a separate VRAM region
carved out of a tile and reserved for the kernel driver only. For
example, on an SR-IOV PF most of the tile VRAM is provisioned to VFs;
the kernel driver still needs its own allocations, which must come from
a region reserved for the kernel and kept apart from the VRAM handed
out to VFs. That reserved kernel region is what PF-mem provides.

To support this, the VRAM region abstraction needs a way to distinguish
regions by purpose, dedicated TTM placements so the BO paths can route
and evict such buffers correctly, and helpers to create a region from a
caller-provided parent, offset, and size.

Piotr Piórkowski (4):
  drm/xe/vram: Add binding information to VRAM regions
  drm/xe/ttm: Add PF-mem VRAM placement types for TTM
  drm/xe/vram: Add initial support for PF-mem regions
  drm/xe/kunit: Add tests for PF-mem regions

 drivers/gpu/drm/xe/tests/xe_vram.c   | 115 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_bo.c           |  16 +++-
 drivers/gpu/drm/xe/xe_bo.h           |  17 ++++
 drivers/gpu/drm/xe/xe_bo_evict.c     |   2 +-
 drivers/gpu/drm/xe/xe_pm.c           |   4 +-
 drivers/gpu/drm/xe/xe_res_cursor.h   |   9 ++-
 drivers/gpu/drm/xe/xe_tile.c         |  10 ++-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c |   6 +-
 drivers/gpu/drm/xe/xe_vram.c         |  85 ++++++++++++++++++--
 drivers/gpu/drm/xe/xe_vram.h         |  11 ++-
 drivers/gpu/drm/xe/xe_vram_types.h   |  14 +++-
 11 files changed, 266 insertions(+), 23 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/tests/xe_vram.c

-- 
2.34.1

