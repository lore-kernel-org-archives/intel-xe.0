Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91373CFC539
	for <intel-xe@archiver.kernel.org>; Sat, 22 Nov 2025 14:18:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D84B10E185;
	Sat, 22 Nov 2025 14:18:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SIbn6J0P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB5C410E185
 for <intel-xe@lists.freedesktop.org>; Sat, 22 Nov 2025 14:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763821118; x=1795357118;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=FzvCZSa/MvJu8mT0CoHZNbwER75BRVPzlOzGLRXsA7o=;
 b=SIbn6J0Pd/oZmPWDpVHFSsTUTYEtijvlO26fZjar8YvZQ+jgSmv4Sw7z
 nRH5AyCJO/fGLTl0y2ULX8A46mr78pPb3+p8YFG8a5jpL9l6vQqQt+fCO
 PFpVLDmzF4CqOK8om07TFoJQmRjz6NjDzF0vm7hjb/jg2oStdoQFvw2YA
 Lg+IgNhlsA7/Cd/ZfMnh5ve6xDWYG1BjzFab7/fiERasqICOvQImmrFyM
 OWc54dGlv5Wyob9ggTA4+R4QYryw7C2kuprwidNIeMpEzP7K2s8RTVd9k
 FZAq1R38hWltv5gAn7NquMbPFCpYf6rs0lbxyCkpcwu1u9tLCvjjn903Q A==;
X-CSE-ConnectionGUID: e2FrS6+RSmiptltENEZIhA==
X-CSE-MsgGUID: lh/ftDp0Q/inB8qILaQj6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11621"; a="77363866"
X-IronPort-AV: E=Sophos;i="6.20,218,1758610800"; d="scan'208";a="77363866"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2025 06:18:37 -0800
X-CSE-ConnectionGUID: NvR+trxySvWyF6QOarpdMw==
X-CSE-MsgGUID: QgBlnaLeR3OvsepHlxmGKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,218,1758610800"; d="scan'208";a="192185626"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2025 06:18:36 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 22 Nov 2025 06:18:35 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sat, 22 Nov 2025 06:18:35 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.44) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 22 Nov 2025 06:18:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M7pnw8KtorZRN6dAxl04N6EyNyap+RN6GB3R/UT1N2tjzHMONPWgT0PKSre9o7Gh+0QqsOPJ+39d7jD3xCSrI/4gIKDFoLjJ2OlYF/0BIdnJ0l/iybbsoQGVWK4ZXBLrsCE1r3XMYhJj97o14/x/vo86i0m3w3MbeBUiMmGLSduEFQUvD8gCTK7q8tVsVk9cU4k2cO+tojMBhRlNTeatsDEpLK3ZLHEmeJd0HR0skKkf1YoJqC+9woKUemjuKUPikd0IKQLsbkGyUyxLDYEbldeHZcT1vV28orBgU71TeSIUsE2Jg352VOo49q4jW72Wg48SnDrZhQ6tZ1BRmGvs+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MglrM+sBePiGpnebRI2LQ/o1H/CpLrsMAcSyRNhbY7M=;
 b=DVNP40E187A+EWr7rMxaf5qR9RDkqKnHrpQCu2lqQeyXO9OeSA9CmToa4yKDco0vDSVgUk8hr1Irb6DEGHZUswd16p//Z1i2bCNHOBzVuU8a80HK/a0fmVeSIaBkKgULvkbbK/SlNiMHZgJm/wKLSR+09ry5y6rcND5ZLiruR4fm7OmwquGb7H/yhDBM+B7HVeTcFPNzvExPx62Zpun4LarWCju3oSptbRxAXA1mf6hcSVFexTE4bpUePKXBGhXc9MXFBQQjvGdlQOEJH28evvO541NaY3k3HeIw5j6ZIrsX0XG0FN1TZIAMPLpQF9AOH7axYFtHCYZQZ13JTvNvQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DM3PPF1FCD3EAF0.namprd11.prod.outlook.com (2603:10b6:f:fc00::f12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.14; Sat, 22 Nov
 2025 14:18:33 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%5]) with mapi id 15.20.9343.011; Sat, 22 Nov 2025
 14:18:32 +0000
Message-ID: <f0b90bc7-d03a-4325-9a82-ab55697ec85f@intel.com>
Date: Sat, 22 Nov 2025 15:18:27 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/11] drm/xe: Add debugfs support for page reclamation
To: Brian Nguyen <brian3.nguyen@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <tejas.upadhyay@intel.com>, <matthew.brost@intel.com>,
 <shuicheng.lin@intel.com>, <stuart.summers@intel.com>
References: <20251118090552.246243-1-brian3.nguyen@intel.com>
 <20251118090552.246243-12-brian3.nguyen@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251118090552.246243-12-brian3.nguyen@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DUZPR01CA0240.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b5::8) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DM3PPF1FCD3EAF0:EE_
X-MS-Office365-Filtering-Correlation-Id: 0956ddc7-ef5f-4383-fd00-08de29d2044e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QUE1SjhuT3k1aU5aelc0b1VqSXNBU0hWNTJUanRJT1A1NlZlcDVMQ1M5czFw?=
 =?utf-8?B?blZpcWdEZkhqcnNSV3RtbzhySEM2QldxMEQvZnlhVUhrRFl4Z2NDSXFWSDJt?=
 =?utf-8?B?cmd4eXhLOC9yNnl0c01ZRkhsYnk5SmtvVnBmRmNvOFNTMkF4RWh5TjU5ZVpw?=
 =?utf-8?B?TUxLK2txenFuMUZXMk1pRys2ZHpUK3RqQnFDQU5WeFU2VXJWVlBzY0Y3cm13?=
 =?utf-8?B?VnpsRDZxWW42SmdEdTc3ejJrR3pCUDZ3MnJGWDMvT04wRklxbElQampYajdn?=
 =?utf-8?B?VFV0YnkzYU1pNUpiQmltY0QzWjdwaW1ocXo5Z2o5NXV0U0NyZVZzM2NzUE5K?=
 =?utf-8?B?djR2VkR4Q2pyaDcrakNaU1dUZkFjMG5yQXdFRlZVOXpDRDlxMUpvUitmV2gx?=
 =?utf-8?B?dVBVTnJycnpqOVo2ZHNuVnFqYnJWdnVRdkNaZHUvOTlqcno3amxvSXQ1V3Zh?=
 =?utf-8?B?bGNvSUlrdGxIVEdqdmswMnFNcFdFZ3Y4T3h4clZLNUlXamdlMUMzNmwxSFRM?=
 =?utf-8?B?SGNLTmEwcnBZTTFXdUwxNjREMG1KRWl6Ym9rYkR5SERkNkI4TzBpOE4vU2ta?=
 =?utf-8?B?Zk54cDM5bXkvczZEUStrVWVvSC91TnYvQjBJRzduSjVvWmQyRE9wVDRWS05T?=
 =?utf-8?B?bHk5dWE1TjBMWU5zNUZjY1c2T2pBQjBsQ010R2VlRDBtYUxVK1d1NXlpbEFz?=
 =?utf-8?B?TjJPTlN5RkN4YnZlcTlOazM0WWx2MUxsa1BROTFjaktXekdNVWw5SjNHUUJs?=
 =?utf-8?B?N2h6Q2VKcE55S1NRekxhYmIxZjhMMCtvTUJTTUpIc1NTdVVIdW5YMGFNQnUr?=
 =?utf-8?B?U1VMcXhVVHBFVmtDdWtRQnA0MU0raGplY2pTWkFrUWppODJUbkJFdlVaTzFC?=
 =?utf-8?B?V3YwQ1o3SWptK241WitxSnZFSTdqdDhrUEc4THZLa3BQeUp6YXZjbk91SndJ?=
 =?utf-8?B?aGJpUGRvUE1OUFU0TjdOb1dDRXZta0VrTkxpZ2l2SThpTWxsV3AzRCtoSlQv?=
 =?utf-8?B?R3B0c3UyV2I5ODk1Q2ZYVXNDbysxZ2IzMTJzaCtWRk8vOVlWclhnOE56QXNG?=
 =?utf-8?B?N0pOMkFOR2kvSlo4YVlSV3pmUWY2blZvMVphWkxaelVaN1I3dDc0U1VmVkpx?=
 =?utf-8?B?eVQwTjBOT0FsMk1vdjEzbXlRUkgyRlpxcWRNbC9oV2ZrSFpNTFdkdHhrTUZN?=
 =?utf-8?B?a0dBS3pKaHJsaVdzSy82QWI4TUxERGF2VXo3OUYvWVN0MzRoVkt1TjdkNTBI?=
 =?utf-8?B?VVVNcHFZY29nMklmeEpzd0RDNi85Yjh6eUVpQzdIdCt1akJKTWdsWlFkYjRD?=
 =?utf-8?B?dVZlU2lsRDhtTXkrdkM4U3daVWl5Kzg4VllPRXNoVTR1eDhuOUpMQ20xZW5j?=
 =?utf-8?B?OFF0QkdjWjJ5L0lpdjVNYkdJMVBhSDJWTzBUa2pNQUNRTC82U08yM3Ztd3Ir?=
 =?utf-8?B?b1U5bmFEbUltL3ViYWl4Yy8zMzZDYStEVnNja3JxUWw0MTExK2l2UnVsYjZF?=
 =?utf-8?B?eFNlK0Y3KzZzS2U2SGY1OElFWFZwNFRpbzFQc09IR1gvSGNIeVJsQ1p3TUxT?=
 =?utf-8?B?Yjg1M2tlNm1BaEcrQUFrUHo3Q3kvL09FZUNlUlpmelpIeUw3TU5MUTltY2JE?=
 =?utf-8?B?dXpIbU5wVDZ4aG9QSzhUaWhtVHVDYytVSEl2UHBSSVkxMkZZQ0pyOUp2TFpQ?=
 =?utf-8?B?dDlGR3hSRHI1dDhsYWc0OER0R2ZsQm00dzZ6UEJsbG5vNlBHNy82d1hNSXJs?=
 =?utf-8?B?TzFRSVpzMUpJbk1vWGtteXdYQWdCOXZndkVOZEQzMzBiRFk2a1RNZXZzejNI?=
 =?utf-8?B?TlA3bHNsYlpsU1ROMENFT05EczRHbjBlWDljVldUZ01iL3JJTmx6YVV3U0do?=
 =?utf-8?B?YmhMRmdtbVF6cUZXUmZHVDVPaWJsYnR3MUlUZzNtdDBzZS9NdlByZ2NCR24w?=
 =?utf-8?Q?G55zs2lRe87t0srT9XB4kB0LIem0h2Vr?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U2xDV29jeHFTWHhMUjdwMzM2eGxkS01mTi9hckl1SGcrNEJBSDhUMGdXMTVB?=
 =?utf-8?B?WHVXN1cvYjE5Z2N5OEx2UnJ5NnFtTDZhYkZXMGw0UFBISjNkN29QQ29DdGlB?=
 =?utf-8?B?MXpwdW1tRFJnajU4cTNFUTNLQ1JUd3dIS3BCY3JlemlrN2szQ3pUL1BMYzZv?=
 =?utf-8?B?R1d0TVhIeGU2UHFxUElycWFzR0RldU1JaktHRnVuZWxnQ1E0TGQvdHhSM1lz?=
 =?utf-8?B?QjRad2hRRHhPaVlUSFBNczQ1TlhSdERoOUY5REtuWFNuWGgwMnRMVUlHbHls?=
 =?utf-8?B?T2k0azdTWW1BYTVQK2M2S1hyYmZmVjFkaytKZ1JQOUFFVnE4R2dRb0NnOFlR?=
 =?utf-8?B?OFl2N1Irc29nOVdQS3dScVc3N2hQVmFrVVpvWkdnWFB6NHNPRFUvQURGblFW?=
 =?utf-8?B?UmdaNmdjajJLVkdCVzA3d1pkZXl1azAxUHhDYXJmeVNuZUQwWkVLbVNxY1B4?=
 =?utf-8?B?UFJoblFaRzBlUW91SGkreHpFaHRJT1NoVUtwNXJqNVgwWjFFbHZ4Q2dHd0Rn?=
 =?utf-8?B?SGFSY2huZ3UrNHlNTXcwNVFvSmNXTUxOOFpld0VUcVFMQmt2VjN3WHFLbm1p?=
 =?utf-8?B?YjMxTDB2eGlhZXdIM0xneUNBRWpTeGR1TDhWbXhxeEt3aXVZNHhhSUg2Mnc3?=
 =?utf-8?B?UHgvZHNBaFRiQWRwMlV4eFA3QmQ0cmhiQVJncTh2a2FXbjQ0Z1R6bkdnTE5h?=
 =?utf-8?B?SUJZMUZEemltRXVrSXNkamRUNmhydUZFRm9ydUZiOWpGOGMyZHBoSXdxZW1s?=
 =?utf-8?B?RU1tekM0b1BXelJzUEc2WGI1Y1I1VWsweTlla0hCMlJPZUNjeTRyWGJabUl2?=
 =?utf-8?B?UU5FaTA0cWhVYTlmVE5wMGp2akNoR1lvUW5VUVFPU3FNWlV4OTg3VXZSdm55?=
 =?utf-8?B?dkF6WHl2QkhldU1JQ0s1b29PZS95ZFlSVVRXMkZCeHZjemlTUjVaaXZhT3NV?=
 =?utf-8?B?TlBzWEJjMCthZkJOeWFSVnFjRmZaSzgzZUQ0elFZdzNZL0FkR2Q5NVJ6Q0ZP?=
 =?utf-8?B?aDJrWlFSSkxHL3UwVzN5Z1NRaEZQY0t4aWw4RU5wckQ3WkQwZ0pielhYR0xF?=
 =?utf-8?B?VDV6cjNBWFl0WkMxa0IvK2ZtTGhrNUxTTnZTTDIrMzZiNXpRRTlxNVlVZzhD?=
 =?utf-8?B?MGpWVk14enpBczMvWHpmaCtOM00wMlJJQXpqb0h4cFA4Y2tMRzVWdHlqWXpJ?=
 =?utf-8?B?MzBHcHB2N015QWlkYmIwWWdVY0JCcm9lNjZEV3pUQ0RDWUhnZEFYakllUGp6?=
 =?utf-8?B?YXF0eUpjUGN6VEpQRTBWdUFMUTg4ZjRDTWc2dzhtUU1OSXVNQUk4Sk9uQ0Vt?=
 =?utf-8?B?OXBtZFBtcEIwS2FzSWJGSzQzcmtkTnpEbThJV2NwUUsyQlZ4TUkyc3U3VDQ0?=
 =?utf-8?B?OUVjZnRKVVEzSVZoOHdMeGFHWlcyRVl3b1JsNDd5WmNkZElUMXNhVjRxRi9v?=
 =?utf-8?B?eERSaG95eHhIS1k0Vk9wNlBVek1KWjk2N2YzVnN6RExlUnI0ZCswNFBOTG8w?=
 =?utf-8?B?SkgvN0kxYk1xTGZoRWtzM1ZkaUhuVVovREpORHRwRXd6RG9IVFEyQ2wzdlNl?=
 =?utf-8?B?Ris0TVdKWGFKTHlrdjI2S3JaS0t2b2Q3QVNQY1hHWlVxOHlHbE5nb0pwOVdu?=
 =?utf-8?B?ME9jWkF6eSttUlF2K2tDZU1wL2duc0NDRlpXVVRSNERUZWx5eXFINjhsdjF0?=
 =?utf-8?B?QXdJK3E3aVVxMmhnWlVhMUphdWlHaUtIaHJWSlpGSmdKOTFEeE9Cc3JQT3g3?=
 =?utf-8?B?TllKeW1VQUkvelY3alFneUdZbXZZd1dUOXpDUHZRd1BwcGJUSEdld3ViWFI0?=
 =?utf-8?B?Mjh3M2pzcU5INUhvREdtZFRYRUxBN1hTdnJJaEZESWpzTy9nYkVkNWNONUR2?=
 =?utf-8?B?WjgyRm9oUnMwNmV0SzRTckhlVzRLUENpdWd6OHRsTDVlb3FoNktYSHU4LzJD?=
 =?utf-8?B?Y0tMNTVDOFl3eGlLTE9UVmFkTUZaTDcrN3dqeHphMThuZzEvSVZFMEh1Sngz?=
 =?utf-8?B?emZ0RWlyeXZyWklsTXlyaDROd0JKbTZWcWJHNlNpNzhmYUpqeFkwVGdHS0FR?=
 =?utf-8?B?R0tsdlJONWhndUVKbndYNXpHUm1YY2pXc0xXVVhrSzR2OFoxcFlCVGlSUnhm?=
 =?utf-8?B?dCsyZE1pU0Zhd1BJaHVsTUtLdkI1aklXZERUNGFHYXFTbWg2cFh4alhFMVJV?=
 =?utf-8?B?bVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0956ddc7-ef5f-4383-fd00-08de29d2044e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2025 14:18:32.7329 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1hA5vnkPGcNKjxKVNrFZku2S/7ymVeNfZ93Hq+cwUjutO8p1XobuunjRpmb78DJtwyrBkh01F47Hll4m+Nd1ylyuBXJY2e9M/u9bsOphlKc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF1FCD3EAF0
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



On 11/18/2025 10:05 AM, Brian Nguyen wrote:
> Allow for runtime modification to page reclamation feature through
> debugfs configuration. This parameter will only take effect if the
> platform supports the page reclamation feature by default.
> 
> Move xe_match_desc to common header for debugfs access to read default
> device values of xe driver for current platform.

this seems to be unnecessary, see below

> 
> Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_configfs.c | 11 +-------
>  drivers/gpu/drm/xe/xe_debugfs.c  | 47 ++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_device.c   | 10 +++++++
>  drivers/gpu/drm/xe/xe_device.h   |  2 ++
>  4 files changed, 60 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
> index 9f6251b1008b..efc6d0690b27 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.c
> +++ b/drivers/gpu/drm/xe/xe_configfs.c
> @@ -15,6 +15,7 @@
>  
>  #include "instructions/xe_mi_commands.h"
>  #include "xe_configfs.h"
> +#include "xe_device.h"
>  #include "xe_gt_types.h"
>  #include "xe_hw_engine_types.h"
>  #include "xe_module.h"
> @@ -925,16 +926,6 @@ static const struct config_item_type xe_config_sriov_type = {
>  	.ct_attrs	= xe_config_sriov_attrs,
>  };
>  
> -static const struct xe_device_desc *xe_match_desc(struct pci_dev *pdev)
> -{
> -	struct device_driver *driver = driver_find("xe", &pci_bus_type);
> -	struct pci_driver *drv = to_pci_driver(driver);
> -	const struct pci_device_id *ids = drv ? drv->id_table : NULL;
> -	const struct pci_device_id *found = pci_match_id(ids, pdev);
> -
> -	return found ? (const void *)found->driver_data : NULL;
> -}
> -
>  static struct pci_dev *get_physfn_instead(struct pci_dev *virtfn)
>  {
>  	struct pci_dev *physfn = pci_physfn(virtfn);
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> index e91da9589c5f..572c61ee1e29 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -19,6 +19,7 @@
>  #include "xe_gt_printk.h"
>  #include "xe_guc_ads.h"
>  #include "xe_mmio.h"
> +#include "xe_pci_types.h"
>  #include "xe_pm.h"
>  #include "xe_psmi.h"
>  #include "xe_pxp_debugfs.h"
> @@ -297,6 +298,49 @@ static const struct file_operations wedged_mode_fops = {
>  	.write = wedged_mode_set,
>  };
>  
> +static ssize_t page_reclaim_hw_assist_show(struct file *f, char __user *ubuf,
> +					   size_t size, loff_t *pos)
> +{
> +	struct xe_device *xe = file_inode(f)->i_private;
> +	char buf[8];
> +	int len;
> +
> +	len = scnprintf(buf, sizeof(buf), "%d\n", xe->info.has_page_reclaim_hw_assist);
> +	return simple_read_from_buffer(ubuf, size, pos, buf, len);
> +}
> +
> +static ssize_t page_reclaim_hw_assist_set(struct file *f, const char __user *ubuf,
> +					  size_t size, loff_t *pos)
> +{
> +	struct xe_device *xe = file_inode(f)->i_private;
> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> +	const struct xe_device_desc *desc = xe_match_desc(pdev);
> +	unsigned int val;
> +	ssize_t ret;
> +
> +	ret = kstrtouint_from_user(ubuf, size, 0, &val);

kstrtobool_from_user

> +	if (ret)
> +		return ret;
> +
> +	/**
> +	 * Don't modify if page reclamation support isn't normally
> +	 * supported by the HW.
> +	 */
> +
> +	if (!desc || !desc->has_page_reclaim_hw_assist)
> +		return -ENODEV;

instead of checking desc->has_page_reclaim_hw_assist capability here

> +
> +	xe->info.has_page_reclaim_hw_assist = !!val;
> +
> +	return size;
> +}
> +
> +static const struct file_operations page_reclaim_hw_assist_fops = {
> +	.owner = THIS_MODULE,
> +	.read = page_reclaim_hw_assist_show,
> +	.write = page_reclaim_hw_assist_set,
> +};
> +
>  static ssize_t atomic_svm_timeslice_ms_show(struct file *f, char __user *ubuf,
>  					    size_t size, loff_t *pos)
>  {
> @@ -403,6 +447,9 @@ void xe_debugfs_register(struct xe_device *xe)
>  	debugfs_create_file("disable_late_binding", 0600, root, xe,
>  			    &disable_late_binding_fops);
>  

better to expose "page_reclaim_hw_assist" file *only* if required
capability is present and we can get that flag directly from the xe:

	if (xe->info.has_page_reclaim_hw_assist)

> +	debugfs_create_file("page_reclaim_hw_assist", 0600, root, xe,
> +			    &page_reclaim_hw_assist_fops);
> +
>  	for (mem_type = XE_PL_VRAM0; mem_type <= XE_PL_VRAM1; ++mem_type) {
>  		man = ttm_manager_type(bdev, mem_type);
>  
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index c7d373c70f0f..16afddc5e35e 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -1295,3 +1295,13 @@ void xe_device_declare_wedged(struct xe_device *xe)
>  		drm_dev_wedged_event(&xe->drm, xe->wedged.method, NULL);
>  	}
>  }
> +
> +const struct xe_device_desc *xe_match_desc(struct pci_dev *pdev)

note that this function was specific for configfs case where might not
have the xe device, hence the manual lookup was needed

if in the future for some reasons we would like to get access to the desc
from the xe, then we should rather consider adding a const pointer to it

> +{
> +	struct device_driver *driver = driver_find("xe", &pci_bus_type);
> +	struct pci_driver *drv = to_pci_driver(driver);
> +	const struct pci_device_id *ids = drv ? drv->id_table : NULL;
> +	const struct pci_device_id *found = pci_match_id(ids, pdev);
> +
> +	return found ? (const void *)found->driver_data : NULL;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index 32cc6323b7f6..a66e8e4b3e01 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -193,6 +193,8 @@ void xe_device_declare_wedged(struct xe_device *xe);
>  struct xe_file *xe_file_get(struct xe_file *xef);
>  void xe_file_put(struct xe_file *xef);
>  
> +const struct xe_device_desc *xe_match_desc(struct pci_dev *pdev);
> +
>  int xe_is_injection_active(void);
>  
>  /*

