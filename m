Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFC5FCCD183
	for <intel-xe@archiver.kernel.org>; Thu, 16 Oct 2025 21:26:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1BC910EA99;
	Thu, 16 Oct 2025 21:26:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GgJzIe+k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FADB10EA99
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Oct 2025 21:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760649985; x=1792185985;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=i/ZrcNteodXDSfbLsAFLy10CsVgdnaZOksfG8+uKCW4=;
 b=GgJzIe+k9ssFohFL3zq3T4IWJ0pF4laXz/HgAhjiDdIbQ3kM09j1jmVO
 6iYQYcYSHyAp2keWfVHsUuZUaJgePT93O7YO8XvzXC/F+fGWxclntwlNc
 QCrtTWIgR4HXReRmm3cAQ7LewXPmZIZIMRWcEDjQtW+pSYV+dilhPy3/J
 2AfQ51K+0RvE+A70NigUOGBW7kYBYBfIsj+0L8RuBHt0RMhtLkzZZaYvA
 i2NJ6EUh3iVfAtIwgTZuWpKYdJmZrA6Spo3KWHmRAsJDQdOQmlb9xlR+f
 xuu7d9+M6+1CLbxvEF0FPvNY5pQ46xysthMkB2V+Pv6aQ68Ywt2jjZR5k w==;
X-CSE-ConnectionGUID: HqXOLN2kTcuWq49ZZBSadQ==
X-CSE-MsgGUID: CJTbCDJfQHKiQb2lqF2JkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="62067427"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="62067427"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 14:26:24 -0700
X-CSE-ConnectionGUID: AQjSIox7RdiR0xOVVdwjWQ==
X-CSE-MsgGUID: BQTByQAPQbuio9/1wRXUkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="181701572"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 14:26:24 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 14:26:23 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 16 Oct 2025 14:26:23 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.30) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 14:26:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EMHlomfdFSkg1avWfpBWvu4O6aqqBrKW42LsUvVql4sKuXGOZfUdP8ib6RGq2TgRmkgZvVIx7W2Ud1+dZJ1ZN2zf7A4WXULipvC3OH5BMP6Ul20/7fGqKeZvPl8lzf8iQkqtLMjqh4K7cZD4O0/I8n3q/lXA1feWU0uvePwJFTK7iwiGvgEfm9xJw9W6pmp0mzGiKg/ezYiESI05zsbZ/CGRF/eJjRsiL6JRQuMMR7WXbTwlI69p2/1QRsvnm/NnZqzq0O+JPzKlAWZSesoUbe+MhD1tO3bklsoCVzQX+q/wjAZhrXaJrlEl5aTiUvomIm3hdqqgAGpm6NmM3SG4qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6av4E20RNSJsMt8/ohL7MBXu/B1Hv1ncn4gNDWeUlCs=;
 b=JZs4E8YMlG4X0MuYBKphKKpgfx66cy1XLgmHGazfqtUc8Wg6bPaRYm4cwHaO3Pbxkrmg/PKopV9TDwQIeAUIttP4xZiR9K7WbVFUruhRkNohcWOWj8WVFaLl3ptUpHIEH+Y9+NjbBHsoWNzs3jkVvPXYJfaR/1NND22YAsIFGYaFMyWDGFl/nSaQ8OfhaUihZXhCX+dqZsNAE/+a1O3IeX+oJVa4vwe8c+/UMHwPx2i79rHYv7Z9D1DyipMvj510Y5wgeC6JFT461LvskSRkOMmfTxgp3uY7IXMdn++dvpNDtI6lTpcoNcNgIfPbR02x4nudN/fB1ZUgVzFKA8BNpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH3PR11MB7938.namprd11.prod.outlook.com (2603:10b6:610:12f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.13; Thu, 16 Oct
 2025 21:26:20 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9228.009; Thu, 16 Oct 2025
 21:26:20 +0000
Date: Thu, 16 Oct 2025 14:26:18 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 5/6] drm/xe/migrate: support MEM_COPY instruction
Message-ID: <aPFi+mThPIgY27Us@lstrano-desk.jf.intel.com>
References: <20251015141929.123637-8-matthew.auld@intel.com>
 <20251015141929.123637-13-matthew.auld@intel.com>
 <aPBDTh2RA33TPaM8@lstrano-desk.jf.intel.com>
 <3950cf17-a681-4541-98af-c03ce8d64ce5@intel.com>
 <aPE9jWAlrUfmb4ve@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aPE9jWAlrUfmb4ve@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: MW4PR04CA0134.namprd04.prod.outlook.com
 (2603:10b6:303:84::19) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH3PR11MB7938:EE_
X-MS-Office365-Filtering-Correlation-Id: 626c3d92-a3e6-468b-3552-08de0cfaa64f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VVJNZVR0VEE1T1dKcmtQbnhsbUJNZFNxVjN4OW1HYkdJajNlUHFFVm1ndWxn?=
 =?utf-8?B?NUxFcVdZc216VkVXWE83ZThISTgwa2Riam02YVRkMWhvZWpkdFNMcTVydjc0?=
 =?utf-8?B?OVFFQU1rcUl1RDlYQmtRT2ZuTHE0dVVkbVB3a1hhdFpPdWRyQ2o5WitQK3RT?=
 =?utf-8?B?MHNNVXFUTCtsOWF6NElGdFBZb3VHUnUvei9SYlFpSHM5cC9jRHFGbmZNS3Bx?=
 =?utf-8?B?YldxQm1HODBTNlBzT0R5dVRYYnlGT2hNb1ViRzRIelBkMDMrUm9mb2E5ZXJU?=
 =?utf-8?B?QWIvRjFuYlZ3YUQvM25ONXBEZHZ3N3FScGRRRG5seFRLV01JL1F3R1Y2dEtn?=
 =?utf-8?B?djBkamx4bXhrMGNYelR6RnNldTF3aE4zWWszQ0s4YnpweEJrbmFyeGRRNm5J?=
 =?utf-8?B?M1A2QnJTK0h2SHRZRmpleTJSeHlzME4vMzdsZUE0QWI4dnMreUZac05YYUt1?=
 =?utf-8?B?T3E4ZUJRdHdKdHAyU2VaYVRvdVJTQ2hEU2l2clkxRCtBV0FBdlBQQVhLTWVM?=
 =?utf-8?B?S2doSHM0WnY2K3NncW9WdHYwYWpzM0xjL0VaU056THY1bzhILzZ1S3UxSk5Q?=
 =?utf-8?B?ODl2RTcvMDhmZGl1SFRjaDl1aHNaV0UzdGROQStrMkRnRG9tczZrampUMnhJ?=
 =?utf-8?B?aGJZQkNvOTVtYjA1eENEUndBcTZ6bkFNSVFzQXVEUWZRbXJDdHY2cGZ5Yzl6?=
 =?utf-8?B?a21odStNVFNORi9zZmhKaHBqNk5nUlFCdjBXajEvZkRCMzBFT1ptRlhsMi9w?=
 =?utf-8?B?dmxXcTZWUm9uMDUxdS9NZ1hkclNJSEloQ25BUW5ubkpXdHdWdWtGN1FTYURz?=
 =?utf-8?B?aWR0Ull0TnFBTjREbnBwOWltdDhxRDhaT3plZThxV0svR0dJZ0xKditJSk4x?=
 =?utf-8?B?YVhtRzVKVHY2WGEwNllZU2xDc25aMXkyUEkvd1VSczNUZEtqdThzdXAvQXR5?=
 =?utf-8?B?KzRRRjc3WHFaZUJpU1lSWUx2NkQwS05GeHRsN255dTUvOUxLbXp4ZUozZzFU?=
 =?utf-8?B?ZER4WGUvaHduaHJVZ2VGUEVCMzRsd0Z6QzBaNjJaUnZZMkZZdnNldUliT3o4?=
 =?utf-8?B?NlhOUlFzWVlLbGR1QlJ2RUxYeEFaeFZOSnkxaGdPbUsxd2ZMVkNiU1ZLcjk3?=
 =?utf-8?B?UWdUbXY5cWJTSDlTdm5MNXBreXVoUjJHamJIdFkyWkYwN2ovbFNsbEhFOU5S?=
 =?utf-8?B?a3l4RXRtQTkreCtoOCt5Wkt5eWpjUnRZekZxT0szclVacDFORUJzenIrSGZD?=
 =?utf-8?B?bEhTaTVmZ2cxMzJiWjQ4OTd6M3BpRG82WEhPdHFZbERjdEQwRTN5NEREdEEz?=
 =?utf-8?B?UmVDek42YWE0a2tVQmpDU1RPT1p4cnN1TklQek9heWZ0Smdwd3hkUDFsYW5W?=
 =?utf-8?B?eUlMVFJhMlZYa0JPakNYZm9Jd3NQakNNQU1PZ0tmSWIwU0prd1YybUV6WUxa?=
 =?utf-8?B?V1l4REdScUpxandIRnU3YjdHSHh6V0dtZ3ljQ0RjODNSWGlWdXJ4ZlYyMlZ3?=
 =?utf-8?B?eXkwUjd4bW9HRTZKditHb29JMEt1a2w0dE1IU1pYdE1WQVZsTXVWSlNncTFz?=
 =?utf-8?B?ZUkxNFAvTVgyVHM1UVlXb0Z6bHJFRllMb3ppbjJtdUk5RDZxekE2WExzZGZo?=
 =?utf-8?B?MEZJQndEWmFaemtUd3ZySDlNUjdyOWN6UEFuZXBFZSt1MDMrUUVQSE9TOElh?=
 =?utf-8?B?Z2tTMitNdXozQUs3VmRyWERzajNpQVZXME9Pcml3eHEraXdhUy9OTVFjdXhw?=
 =?utf-8?B?M01zRzlFSy9ucVU0NlgyQktwZFJnak9xUXV3bkk1L1FMY2E2cmxHVzJMNHQw?=
 =?utf-8?B?Q0FuS052S3c5QlgwaCs5TVdUZGpqcGdYWStETmlhL0VWajZOVHJ6TjROS3dF?=
 =?utf-8?B?Qk5jWkp0dkN2RzFKRVRqbmZDc2REczlzb1dacndVczYzbFE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Qi9yOHdMWnFVeHk4WGtqTjhyNU5XMVpuYjlKdldvai9SOHoxUDBMYkJDc1BO?=
 =?utf-8?B?VTA2T0k1NzJLMUFoNWJCWW9iUzdPKzdjRjhNTWlpOVlhazhXVFFMWEZwOWxZ?=
 =?utf-8?B?ZHhVR2RWWCtLY1RSM244T0ZJUnlNeFJ4WlFXblk4bHI4cCtVQzJEMjlYYlVZ?=
 =?utf-8?B?OVVqdWNlRzFUdjNxNUlEdU5OWStSRmZDM3IyNFdFbkZiSVRmZ0wyNEhTbExn?=
 =?utf-8?B?ZzUrR2ZtdENuaWhPQTQxRlVBQjViRU9Fb240ak54cW9CSUQ5YTErRXRVYjBj?=
 =?utf-8?B?NUdRK0g2RlErN1BsWVBzYTZUQjV3ajFnNHhUU3ZXWTFIZVJ6MWhZMVJGeFpV?=
 =?utf-8?B?ZTVKMFEvWm51MlpqdXRORnVNWVkzZE1ZNkp3SnFrRmNsYXg2WVpyUFd0K1JI?=
 =?utf-8?B?VENpUFV4anlreTdxL1pXeFEyMWpUTzNxdTd3OGhIZHZ4d3QzN0hOY0F2N0lr?=
 =?utf-8?B?ZU5NL0E3N2szMFVPaTBvcWljZ0tjbzRReDQ1N0lObjEwclNwV3ZVajlJeWlC?=
 =?utf-8?B?TDRHRWNsMksvTElMOSt6ZGV0ZTVIM20vRzdYbFNYalpvdlVhSzlHdk45dGVU?=
 =?utf-8?B?Y1Y3UWpsRFZGZDk0dHFybnovbDZHRWF0dnJzandScXRVZGU0WWtXRUlaWERs?=
 =?utf-8?B?UTI1amxnOEl3UzdwV0Q4NE9oOEs0QWFJVnJILzMwYTVTQkhIeXpaTUh2YmVN?=
 =?utf-8?B?SXVWVTkvbE1mbEhKODAvUytqVG1yMFk4TGtKMFdta0JHelFEOTVXeGU3eVpz?=
 =?utf-8?B?Sjg4MWFzZzRaclo1Qy9LZnJKMUNYNmZyd0ZpaXBPejBSV00wb2Q2L3BsOS9z?=
 =?utf-8?B?cHFBaDhDSlgya044QXFBa3QzeGsyNWRWMWlLS002ZTd4ZWg1NHhJS3NHblNW?=
 =?utf-8?B?dDhpVmtoZTNJeGpjS3JibTNNUEMrdHA3NlhOOHNFb05GaGxpYzkzRVJwYzV5?=
 =?utf-8?B?bm9DdzJqbFRJRGVHOHlXb25BVjNKS2xacTE2SFVrWVBlWXVZb2MrZUEwZ0JS?=
 =?utf-8?B?Y01waEo3eDRtRGFKOEV0S1lra3AvOHRNLzllSTlnaGlVOTREN3dNNTdDSkE5?=
 =?utf-8?B?cEMxcXNLRHhJbTJlN3hMejRZSUhQeE9LRlpwWFN5bmhCOEZJZ0hYWVlCcUx6?=
 =?utf-8?B?MkpTaDlTUGgzK2FiQWh1c1lxK1Q2R0lnazFzcUpBbm5OdnZvb1BjVTNwQlI3?=
 =?utf-8?B?RDJHVUNsYVY1SFNhdTJwOWs2cHg5cVkvbTZ3YU4vQms4MlZ4T05Pd2Q2R0Mx?=
 =?utf-8?B?eFZHNElmWnNkUW5zRW9HaU95dzk3cnhzOW8rN0xWZGE5c2d6UHNoMFJnWUFU?=
 =?utf-8?B?WHNYNEl0dGo2Nk5Ya1ZKazVtRVVZM2JUdkp3QTNJV1duV2ZSQmRObkN6bnZ0?=
 =?utf-8?B?NEVJbSs0clgvelRiT0dWUmE3Sjlmcy9NSE1na3htc1YydXNybml3UXk0NjhP?=
 =?utf-8?B?RUJNL25sQlNUQ0VvT3FvUkgwM1lFUzdyODJEVER6OCs1RUhKeGZzS0VyZVVV?=
 =?utf-8?B?MnhGd0VRNFRYcmJsQU0yNzJtMlF1QzNuSzhXbmYwMGdraklSUnRqZS9IWnlF?=
 =?utf-8?B?b3dReW52NFhNOXNNNlBOZndtRmtRS200RTloLzVXZTd0dTRlN09TR2I3QkQ0?=
 =?utf-8?B?TldlajJ5MGQ4TFNoUmxEc3ZkZVVUOGtENEFoaDVOVUxkYUh6cHR4Zk13MVVD?=
 =?utf-8?B?aHZ2dmwrS2ZScElZbEJzb3pUeDZHd3hwQy9MZC92VzUxVkc5Zi9FSi9EWkM2?=
 =?utf-8?B?NG1ScWhIdTFlcDF2QzRxOGZFUmlJa3NieFdsaHE5am1PM2xWQzcvTzExUjY2?=
 =?utf-8?B?Q1dBbjdSK1FOU25KRi9Wa1NSalhQdDMvYWhkM3pxRTduMGhpRFpGREEycXVo?=
 =?utf-8?B?b2RTM0tqeFpFVWltQzN6dE43MHV0ekVHYW9xbW10UUlXaGkwdlA3QTF6emxl?=
 =?utf-8?B?OEFXZlRpejR3RjdKcG9oUUU5YTQrbWhsbU9rVWw5M1MzVUZqeVkyQW9Ba09Z?=
 =?utf-8?B?clNRQUZKWkNkekhhOEp2NkwrOGkvWGdKcHR1eHprV1RNUzNiWXNBYmNIQi9n?=
 =?utf-8?B?Nm9SRnNxQUJFS0hDOG1rN3YrOGQ3VlR6d1lhZlQ1b0NwSXY4c2pab05BUUpw?=
 =?utf-8?B?MWZUdmZkdGpUZWlIekhVM29hNG5mcWplSUgzdW9wK1p6ZXY4c2FhN2d5Ukxr?=
 =?utf-8?B?V1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 626c3d92-a3e6-468b-3552-08de0cfaa64f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 21:26:20.6253 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /Xa+ErS3BErlzmTg/F0NOccQnHy/uiOSJgXDD1qwdHBTc+6d5A7TcSq4wMyECGJk2jYRFmXZayQJGJ8ehLU+Lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7938
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

On Thu, Oct 16, 2025 at 11:46:37AM -0700, Matthew Brost wrote:
> On Thu, Oct 16, 2025 at 10:41:33AM +0100, Matthew Auld wrote:
> > On 16/10/2025 01:58, Matthew Brost wrote:
> > > On Wed, Oct 15, 2025 at 03:19:35PM +0100, Matthew Auld wrote:
> > > > Make this the default on xe2+ when doing a copy. This has a few
> > > > advantages over the exiting copy instruction:
> > > > 
> > > > 1) It has a special PAGE_COPY mode that claims to be optimised for
> > > >     page-in/page-out, which is the vast majority of current users.
> > > > 
> > > > 2) It also has a simple BYTE_COPY mode that supports byte granularity
> > > >     copying without any restrictions.
> > > > 
> > > > With 2) we can now easily skip the bounce buffer flow when copying
> > > > buffers with strange sizing/alignment, like for memory_access. But that
> > > > is left for the next patch.
> > > > 
> > > 
> > > How you tested if this series has an affect on bandwidth of copies?
> > 
> > I only tested it from functionaly pov. Main interest for this series was
> > with 2) atm.
> > 
> > > 
> > > We have some SVM tests which can measure this bandwidth rather
> > > effectively. I can give these tests a try a but it may take a few days.
> > > 
> > > With that, feel free to breakout the first 4 patches into an individual
> > > series while we explore the affects on bandwidth for th last two
> > > patches.
> > 
> > Sounds good. Can you point me to those SVM tests? I see some fault and
> > pre-fetch benchmarks in IGT, is it those? I can try them.
> > 
> 
> Yes, the prefetch benchmark test is a good one but it is software
> limited atm so might not give the best view.
> 
> Running 'xe_exec_system_allocator --r many-large-malloc' and then
> looking at the GT stats the copy bandwidth can be derived. I have
> scripts that do this, I believe Francios uploaded these somewhere
> internally but here is a public link to a script which parses these [1].
> 
> I can try to find time to see the bandwidth before / after this series
> today and report back.
> 

I didn’t observe a noticeable performance drop when using MEM_COPY_CMD
in the SVM tests. However, for various reasons, this path is still
software-limited in the KMD. Once we land additional software
optimizations to accelerate the copies, switching between commands will
be straightforward. So, there’s no performance concern with these
changes.

> Matt
> 
> [1] https://pastebin.com/rZZN5sgh
> 
> > > 
> > > Matt
> > > 
> > > > BSpec: 57561
> > > > Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> > > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > > ---
> > > >   .../gpu/drm/xe/instructions/xe_gpu_commands.h |  6 ++
> > > >   drivers/gpu/drm/xe/xe_migrate.c               | 64 ++++++++++++++++---
> > > >   2 files changed, 61 insertions(+), 9 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h b/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
> > > > index 8cfcd3360896..5d41ca297447 100644
> > > > --- a/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
> > > > +++ b/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
> > > > @@ -31,6 +31,12 @@
> > > >   #define   XY_FAST_COPY_BLT_D1_DST_TILE4	REG_BIT(30)
> > > >   #define   XE2_XY_FAST_COPY_BLT_MOCS_INDEX_MASK	GENMASK(23, 20)
> > > > +#define MEM_COPY_CMD (2 << 29 | 0x5a << 22 | 0x8)
> > > > +#define   MEM_COPY_PAGE_COPY_MODE REG_BIT(19)
> > > > +#define   MEM_COPY_MATRIX_COPY REG_BIT(17)
> > > > +#define   MEM_COPY_SRC_MOCS_INDEX_MASK	GENMASK(31, 28)
> > > > +#define   MEM_COPY_DST_MOCS_INDEX_MASK	GENMASK(6, 3)
> > > > +
> > > >   #define	PVC_MEM_SET_CMD		(2 << 29 | 0x5b << 22)
> > > >   #define   PVC_MEM_SET_CMD_LEN_DW	7
> > > >   #define   PVC_MEM_SET_MATRIX		REG_BIT(17)
> > > > diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> > > > index 3801152b7f8f..da1fefb96070 100644
> > > > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > > > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > > > @@ -699,37 +699,83 @@ static void emit_copy_ccs(struct xe_gt *gt, struct xe_bb *bb,
> > > >   }
> > > >   #define EMIT_COPY_DW 10
> > > > -static void emit_copy(struct xe_gt *gt, struct xe_bb *bb,
> > > > -		      u64 src_ofs, u64 dst_ofs, unsigned int size,
> > > > -		      unsigned int pitch)
> > > > +static void emit_xy_fast_copy(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
> > > > +			      u64 dst_ofs, unsigned int size,
> > > > +			      unsigned int pitch)
> > > >   {
> > > >   	struct xe_device *xe = gt_to_xe(gt);
> > > > -	u32 mocs = 0;
> > > >   	u32 tile_y = 0;
> > > > +	xe_gt_assert(gt, GRAPHICS_VER(xe) < 20);
> > > >   	xe_gt_assert(gt, !(pitch & 3));
> > > >   	xe_gt_assert(gt, size / pitch <= S16_MAX);
> > > >   	xe_gt_assert(gt, pitch / 4 <= S16_MAX);
> > > >   	xe_gt_assert(gt, pitch <= U16_MAX);
> > > > -	if (GRAPHICS_VER(xe) >= 20)
> > > > -		mocs = FIELD_PREP(XE2_XY_FAST_COPY_BLT_MOCS_INDEX_MASK, gt->mocs.uc_index);
> > > > -

Can we keep this part in case we want to experiment with switching
between commands on Xe2+? It isn't a huge amount of code to carry in
emit_xy_fast_copy to support Xe2+.

> > > >   	if (GRAPHICS_VERx100(xe) >= 1250)
> > > >   		tile_y = XY_FAST_COPY_BLT_D1_SRC_TILE4 | XY_FAST_COPY_BLT_D1_DST_TILE4;
> > > >   	bb->cs[bb->len++] = XY_FAST_COPY_BLT_CMD | (10 - 2);
> > > > -	bb->cs[bb->len++] = XY_FAST_COPY_BLT_DEPTH_32 | pitch | tile_y | mocs;
> > > > +	bb->cs[bb->len++] = XY_FAST_COPY_BLT_DEPTH_32 | pitch | tile_y;
> > > >   	bb->cs[bb->len++] = 0;
> > > >   	bb->cs[bb->len++] = (size / pitch) << 16 | pitch / 4;
> > > >   	bb->cs[bb->len++] = lower_32_bits(dst_ofs);
> > > >   	bb->cs[bb->len++] = upper_32_bits(dst_ofs);
> > > >   	bb->cs[bb->len++] = 0;
> > > > -	bb->cs[bb->len++] = pitch | mocs;
> > > > +	bb->cs[bb->len++] = pitch;
> > > >   	bb->cs[bb->len++] = lower_32_bits(src_ofs);
> > > >   	bb->cs[bb->len++] = upper_32_bits(src_ofs);
> > > >   }
> > > > +static void emit_mem_copy(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
> > > > +			  u64 dst_ofs, unsigned int size, unsigned int pitch)
> > > > +{
> > > > +	u32 mode, copy_type, width;
> > > > +
> > > > +	xe_gt_assert(gt, IS_ALIGNED(size, pitch));
> > > > +	xe_gt_assert(gt, pitch <= U16_MAX);
> > > > +	xe_gt_assert(gt, size);
> > > > +
> > > > +	if (IS_ALIGNED(size, 256) &&
> > > > +	    IS_ALIGNED(lower_32_bits(src_ofs), 256) &&
> > > > +	    IS_ALIGNED(lower_32_bits(dst_ofs), 256)) {

s/256/SZ_256 or perhaps a define for page copy mode alignment
requirements?

Nits aside, everything LGTM.
Matt

> > > > +		mode = MEM_COPY_PAGE_COPY_MODE;
> > > > +		copy_type = 0; /* linear copy */
> > > > +		width = size / 256;
> > > > +	} else {
> > > > +		xe_gt_assert(gt, size / pitch <= U16_MAX);
> > > > +		mode = 0; /* BYTE_COPY */
> > > > +		copy_type = MEM_COPY_MATRIX_COPY;
> > > > +		width = pitch;
> > > > +	}
> > > > +
> > > > +	xe_gt_assert(gt, width <= U16_MAX);
> > > > +
> > > > +	bb->cs[bb->len++] = MEM_COPY_CMD | mode | copy_type;
> > > > +	bb->cs[bb->len++] = width - 1;
> > > > +	bb->cs[bb->len++] = size / pitch - 1; /* ignored by hw for page copy above */
> > > > +	bb->cs[bb->len++] = pitch - 1;
> > > > +	bb->cs[bb->len++] = pitch - 1;
> > > > +	bb->cs[bb->len++] = lower_32_bits(src_ofs);
> > > > +	bb->cs[bb->len++] = upper_32_bits(src_ofs);
> > > > +	bb->cs[bb->len++] = lower_32_bits(dst_ofs);
> > > > +	bb->cs[bb->len++] = upper_32_bits(dst_ofs);
> > > > +	bb->cs[bb->len++] = FIELD_PREP(MEM_COPY_SRC_MOCS_INDEX_MASK, gt->mocs.uc_index) |
> > > > +			    FIELD_PREP(MEM_COPY_DST_MOCS_INDEX_MASK, gt->mocs.uc_index);
> > > > +}
> > > > +
> > > > +static void emit_copy(struct xe_gt *gt, struct xe_bb *bb,
> > > > +		      u64 src_ofs, u64 dst_ofs, unsigned int size,
> > > > +		      unsigned int pitch)
> > > > +{
> > > > +	struct xe_device *xe = gt_to_xe(gt);
> > > > +
> > > > +	if (GRAPHICS_VER(xe) >= 20)

Would it be better to stick this in xe_pci.c / xe_device.info rather
than inline IP version check?

Nits aside, patch looks correct.

Matt

> > > > +		emit_mem_copy(gt, bb, src_ofs, dst_ofs, size, pitch);
> > > > +	else
> > > > +		emit_xy_fast_copy(gt, bb, src_ofs, dst_ofs, size, pitch);
> > > > +}
> > > > +
> > > >   static u64 xe_migrate_batch_base(struct xe_migrate *m, bool usm)
> > > >   {
> > > >   	return usm ? m->usm_batch_base_ofs : m->batch_base_ofs;
> > > > -- 
> > > > 2.51.0
> > > > 
> > 
