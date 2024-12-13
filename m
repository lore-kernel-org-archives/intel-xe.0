Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13654E7717D
	for <intel-xe@archiver.kernel.org>; Fri, 13 Dec 2024 14:13:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD8BA10F029;
	Fri, 13 Dec 2024 14:13:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lidLgrAk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C2A010F029
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Dec 2024 14:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734099180; x=1765635180;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=w+uRhe+jpk5s0DzJoFwBrLmUAQj5t45Pq2e7wJmbfuk=;
 b=lidLgrAktS6LhmDn1m8AABwWpgXG+ZyXDCUS9gpCgEG53s8j/0glZoQ6
 OaeyJXRodnNBg2dLjNY2OMWb/GwNRVmG4bLjiWunglgYSGos3s1iOtEzh
 tI25KbXkm7J/8xN0qK7XL/49YfZkNXY2Yiq8qk+kLo9a1/Vl4r+kaEap4
 N96qnezCMjgSiaKhMxKvf5LwjxQqcjlSmTiiWkzx4l06iqDBB1wnk2u9v
 wt1RZv8EQ/fbP3LCmKgS0LOlNTofZsTnEghtQYS15dElAnlP6vZtXXzsP
 566Fryv1c6AmxALlVgp9YhprCyDKgZnD+55L5sCsTxioVxquX4Ia46uxC g==;
X-CSE-ConnectionGUID: Wat8d5p5SDyCQLlE9xGgNA==
X-CSE-MsgGUID: AA/FxNxvTXCs+8rPTZedjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11285"; a="38330971"
X-IronPort-AV: E=Sophos;i="6.12,231,1728975600"; d="scan'208";a="38330971"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2024 06:13:00 -0800
X-CSE-ConnectionGUID: kDun4t3ZSKOyCZhMceIfrA==
X-CSE-MsgGUID: Lv0IN+NSQmeMte9otcwqJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="100707467"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Dec 2024 06:13:00 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 13 Dec 2024 06:12:59 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 13 Dec 2024 06:12:59 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 13 Dec 2024 06:12:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pwQ/h7eBW2Jdn2g0HV/EcRDPs6Zv/NZB3W88nYYVXjLwWLiSVRJR4QOhddSXb+vJLi5DUQrgSaM6pprdHMW2+i77p1h3TIFUl25/IBa8/0BH3F0qBX2H0W1RHuKCW0ONxXld+HyaS89aleUqX5fB2tAm9oIOzH8M1+kXfEcEx5rFlUbzfhbAxGIFjD6p0HfU3J4bu+crgfshLlEVWqCa8+BgYsuHzVLqPJwRrEztfllqVEJ79S7l+zl7loP8/T0vKoZWCbUr4m4zbLgIwkDC5rs4PWFR1CZTHPBtqdrPllf3oNBHuerkgPQErqPeMdtHnWIV2rit87y4SptyPfn/8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8R66pBZ4wMNCr+4X1XExK33eePaRojSmPs9K9BZVCtA=;
 b=pXSwtouvDU5wHq9Di/Y2mcNk0Rp71aLtSj27vorj4LnFFP3/e19WmisXNIMae3BMK8vkkogwhqkRME29JYbXgtWtBapYOJXprXnG321E2QXHgOAIgUlz5ThK0vCbH/ewFAToer0k1PEt7EYOXLdjPCWyM7mgpKdYzEu8qO66eK2u0OzogtpLkIbMiMh1yBdiE5e14bvXK+qvNW7mS6X5axn5Kp3anI7CywkuDmSxx4lOGvQtuo0ru8EUm47B+z/zbtOq9elBw64vkIr6/6fQgA0HYaQQ9dbWIUduErCOr9rV0Ta7ZINCywYtAYT8ALW81++F9L2mGpdnFcElBiQFSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8282.namprd11.prod.outlook.com (2603:10b6:806:269::11)
 by MW3PR11MB4603.namprd11.prod.outlook.com (2603:10b6:303:5e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.18; Fri, 13 Dec
 2024 14:12:57 +0000
Received: from SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72]) by SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72%5]) with mapi id 15.20.8251.015; Fri, 13 Dec 2024
 14:12:57 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, John Harrison
 <John.C.Harrison@Intel.com>, Julia Filipchuk <julia.filipchuk@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>, "Lucas
 De Marchi" <lucas.demarchi@intel.com>, =?UTF-8?q?Thomas=20Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>
Subject: [PATCH] Revert "drm/xe/devcoredump: Add ASCII85 dump helper function"
Date: Fri, 13 Dec 2024 09:12:52 -0500
Message-ID: <20241213141252.1488109-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.47.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0045.namprd04.prod.outlook.com
 (2603:10b6:303:6a::20) To SN7PR11MB8282.namprd11.prod.outlook.com
 (2603:10b6:806:269::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8282:EE_|MW3PR11MB4603:EE_
X-MS-Office365-Filtering-Correlation-Id: bb78d2ee-dd01-4df1-ba13-08dd1b803e81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eXQwNW1SZTdtNzlHelJPekRuV3FhSmZtRzMyMnNnQjk5SEV6c1JTSmlnODE2?=
 =?utf-8?B?OU0rSjlmMFlhNDVBekhSOUtQNkw3YUZuRFpUUis5RGxCMmVXc0dOZ3k3S2hE?=
 =?utf-8?B?NnJGQmxBY0dtT3EwekdoY1lTV1lhTmFnRlZibnhFYUR2TjA2dkVzTEk5cXdH?=
 =?utf-8?B?Q1habGVOOUVpRFRiQVByTk9QbUtBM2l6TzgwWXQ3M1k5QWtUYXBSLzRLdWhi?=
 =?utf-8?B?TjkyakpSbFhPektsM1ZlYk16ajVpK3RCY0w4NG16SXVZWXAvWkNLU1lsMnlD?=
 =?utf-8?B?ZEw0RE1xTXZ0dTlvbnhQZThOYmlxakNJazV3VkIvajFWbWtpMnZRaGFFTFJE?=
 =?utf-8?B?U1ZSODUyUDZEYzdNei9vaWZPZ1RXYnQ1SXUwNXBHYmFvR05Cc0djdHNieTla?=
 =?utf-8?B?L2hGSkwvek5qemdUZEtMTFJrbGZHSGxqZm5DcWlYTHVBc2REeE9jSUlRS0sr?=
 =?utf-8?B?OEtYc2VtMksrNW5tUWVQMGFIaW5QTnJDNFRVdkxkTUdVSHZOV2lVSFd0WFJj?=
 =?utf-8?B?dnpQcjJvMnJvQUJhMjluOG8zTjdlcFNqVTRXb044ZlhqeGEwdTVZbFYwWGM5?=
 =?utf-8?B?TXcxWEhiemFqcStHcE1OVFpIRmZMRGF1WHlHRVI2VTdISGhzYXkxRmNZR3Ax?=
 =?utf-8?B?K0hIT2Q0Ujl2L0NQYkluK3JUWUxsdkttMUpnNzdxbmg2alpaZEhEVzdGMjdZ?=
 =?utf-8?B?VndNY0RMOGJWT1lHOERHREU0bkNhNHppN01LSnJxRjRncFk1em11NVg5TVhi?=
 =?utf-8?B?ODFlMnlMR1FGRnZxME5rY0ZIUVNVd1RNdHBUakw1bkZNK2J0bStNTzM0bjB5?=
 =?utf-8?B?NEMzcWhXSi8vZzd1NTVVZmRtdFpKNFhLMEdLMVlOQWMyZW40Z0ZJZ1NBUDc3?=
 =?utf-8?B?NEdmeVM5eG1vVDdYSkpSME5KVHV1TjJpMUJzUjBDYXdkWDNiWjVlN0tkL0tV?=
 =?utf-8?B?STlEaVcrWmZITm1GeWhNVTBnTk81VFVCaUl4RHU1UE9LOG9wTDlRUERQc09w?=
 =?utf-8?B?aGQvR0dlcXI5em1VZmZ0eVdsSlFJc2pPY0FJd1R6blR0ZEQyMnkyZVF6ZkhH?=
 =?utf-8?B?YjBKTzRGbnhvd3hVdHZ6TVBSQWRtQU1xSFBPcjA2NFR3NVE1L2hKUUZ4RGIr?=
 =?utf-8?B?MlZXQjB2U1l0enUzQW1nK1l6L0V1ZWtmcnZ2dXNmc0VnQ0hacEVwUjhoanUx?=
 =?utf-8?B?OCtQTFNlZm04TFMxOU9vcENWMWxIYTV6cTA1bFJLa2UvKzQwRGFIZTJBWTdK?=
 =?utf-8?B?NmJPRlVkTnVFb1VFYU0yaXFhbEpvY2s5YUFiL1hVN2QydWlEWTI4Nmpub3V2?=
 =?utf-8?B?bXRraUowZVJONjBRcDVXWnZTTjhYaEp6WmxGQlJibEE2ZXRKaTVSbVFxdlBC?=
 =?utf-8?B?OVRob3UrWGVEVTl5S3ZOV1FwaDl4SEhDRDNEY01ad0Jrb3ZZdUZITTNVbmJ3?=
 =?utf-8?B?SFpCUGJMT20vWjU5SVNmK0IxZ0tDVmx2OXZ1RTBDL2hhempHa2FTRWlzQ25R?=
 =?utf-8?B?clNqT0c2c3lOOTFFSlAxMWV4M29JbEhpZlBPdm9xMUR6RkVmeElWTG5UZTF3?=
 =?utf-8?B?aUZZZ1FBSXByMEhvVDltcFpJWGovK1ppNU9qV3JjaC9TVXhZMmdXeXZrcXZx?=
 =?utf-8?B?eGliSHJxTEtYY214Rzc4OHpMT1p5b3BIbUY5VGtUM3ZZUkFROXp0ejhud3RB?=
 =?utf-8?B?RjY5U2M1MCtQd0VON1lwT2NBTDBlekg0bUg3ZnZMa3VYZFI2SDdRSW42U2ox?=
 =?utf-8?B?VHN6NkI3WDJkdUMrSHFQaEFrN1hLTCsreVJpendtZk9KK0FKdHVtYWg4eFVF?=
 =?utf-8?B?T3dtU0dqNjdhaDk0TkhNQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB8282.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S0tTK1BwZ1ZCVTMrRExibTlQck5XRFl1c1VIVlVPZmxDK3JBS0JRMGlMTDRh?=
 =?utf-8?B?MG5jWkdrSWgySXlDWHdjajVhaTR3MWw2VlNPQ2t2cU9CcjUwWEsxTXZmam1V?=
 =?utf-8?B?VlVzSFlHY3RqLy9yb0J1eUYyQVI2NWhRdEZFYndqZGFySk5ZSk54NmhVZHVk?=
 =?utf-8?B?bXd1MUVyTEZhUm4yWEhIMGdndUNtYmh4THVHWmJKeGtTQ0tmeUZTTGtpSjdj?=
 =?utf-8?B?V1JpelhPNWUwb2p5aDhQZ3laZDNSSzVWbnZBRHNsbWFObHZqdnI3cEtIbGFQ?=
 =?utf-8?B?N3JCalNaTkNJRFF1MlhUZS9NNjE1Y1FEUWtMT1BBTkJ4Y3RxMnZZS2FxNVJm?=
 =?utf-8?B?SFV3c1BoV0U3dU9yUlFNcncxczlxL2U1WUYwNUtrZ0lCU3MybElteEhMM0pE?=
 =?utf-8?B?QzdRbWZ2Y0RlSTNXbi9scklrczM4Qk52cHdGdjZQM1d1NWtIUFNFakxiUHAv?=
 =?utf-8?B?eUNZYy83WDdXRlk2TkJWOXBTck90YmhYWkVFcHdZR05DYnhnUE0yTHlkQTB0?=
 =?utf-8?B?aENYVHBGMHBRUHZMNjJFSG0wdEh2U2k1SC9lVzJ4Rm56bjdET2VIU3Z2YVNW?=
 =?utf-8?B?TTQzYU5DL0JvWExVSGJ2Tk54OWV3ZUpEMkQ4WnlQbzV4ZGNRaWlTK0xhcDdG?=
 =?utf-8?B?emtqdGJEZFFQVkROMnJPeE56SkhrNWVSSGxmcENGMlpsOStSSnRPTmpqTGIw?=
 =?utf-8?B?SXh5U0RwSXpVSkh2enRsQWMyMkw4dmhKM204QldURFdldHBxd2NKTVg5MnJm?=
 =?utf-8?B?NS96TW13ODc2SEdIN29KT3JNZGljd1JucUdqUzUyUk9wc2FYY0MrQS9ZVExD?=
 =?utf-8?B?Qko5RjN5RzBhL1F6c1ZvS1FoVE13VTgzTDdxbm50M0wwSlR3RDVab2sxY0FP?=
 =?utf-8?B?U0tvSmQvT3BIS1ZWZTNUYmRVT2FPdDY1V3l6dXFBK1VGTFF0RnN6WFhHNFF2?=
 =?utf-8?B?ZklWYnplbVlmN0ludldHYllTQWtKNy9WTVRWNzlwNjlIdkdkU3ZHT2JCUGF1?=
 =?utf-8?B?bjhscWhIKzBySHg1TEhITFdyUHU1T1dqMWpKa1l4Q0Q4dXZQS3FUQ2E1NFdG?=
 =?utf-8?B?dXBMbkRzTk5iT2J1cFpFcksvOEdSYS9ibkkvOHVoT2ZoVmZTVm5HcFZGdXRX?=
 =?utf-8?B?bzVwRzMxQTI4cEV6eWdzQnJjT3VVSDVvbWozS1NiM1VPbVlCTFVvRTRZQUxY?=
 =?utf-8?B?NHRkUkEzOUVKdkQzWUZXWjlablBGSFk4cUh6TzQyWW1FMSt2a1F0RVJMaFZB?=
 =?utf-8?B?YnZaVG5wWjg4SXUzK25EYnJmMGtqbXIvSWFwTjByQVM1Snp3QU01MHVjNU9E?=
 =?utf-8?B?c0RQWi9GY3ZZQ0FRTTF0a08rLzlNd0NHL21NcisyMkVmbGoxamluRFNMaDZC?=
 =?utf-8?B?QVloczQ4TjdwTndrY2VDK3oyNk95SDdaZjdrY1paSnBiZXZQY1FUME83RlZR?=
 =?utf-8?B?MnBhYWlDZzE2VENPU2xaTmdpMkFXUXcyUGRHSjFYWFh2ZS9QajVoOUxuZGxC?=
 =?utf-8?B?U1puZno2TkNuK0JWeTZEeUthNVRVQXpxbjFST0pObGpBbVM2UmtlbHNYWjdV?=
 =?utf-8?B?bkt4a0xLTEpqeTFKZFVNbEQyQ2hxYnBNVy9Fa3hFSEZ0YTdsWE9MNHFZYVAx?=
 =?utf-8?B?em5LSUdEOGhLeFNuaG5kU2hTNjRLM25wUnl6bXRTdHhVc21tT0hXNmRaNEZN?=
 =?utf-8?B?eGRudU1IY3NzaXFXNkIycDFtWitrZU03QzQ4Um9LOGxST3Q1K3hETWdKd0R6?=
 =?utf-8?B?RjZ0QmR2ZGZFZXZGWXltelEwY1lVNXlkWWM5M1FoclZTZm1RODU4RVg5dGdu?=
 =?utf-8?B?dmtMeWZHL0Z3SHhXc2xDNlViUEtPVHNrS2gvM2l5cmpqUEFaNG5XZHliTnVa?=
 =?utf-8?B?ekNock5PWnJ3K3g1cGdGV1ZLS2w4aUdTNlVZTGJDUmJOUUUyaE55OUdnKzEv?=
 =?utf-8?B?bTdqSmpFUDc3NkszTlFFdXlXeGZESE9KQU12UUtHQzhMOWRSVmRUWDBINk9R?=
 =?utf-8?B?ak5TSGpGelMzanIzdTBxS2lDa21aQWVGWHBnUXB3Q1kweC8yNGU4QytlWWNW?=
 =?utf-8?B?U1hRYm91RTBmUHRoQ0pla3VqVTYwT29HWmdjenloczQ3VTcwYXQyRzI1dS9G?=
 =?utf-8?B?NmU5ZG83YlpIb0pHTlYzWm1CSFV5VWtFbHVDYmtOOXlBV3UvUm9zUVp4emhr?=
 =?utf-8?B?UkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bb78d2ee-dd01-4df1-ba13-08dd1b803e81
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2024 14:12:57.6873 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jasSzMI7AYRZB8O0/OuwzZSLNyUHDpzNQ5a5bV3XPMpL8yS1FRdqSPApZnEZkDKUikJSaTi1ystUZzIY3ub92w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4603
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

We do not break userspace.

This reverts commit ec1455ce7e35a31289d2dbc1070b980538698921.

Fixes: ec1455ce7e35 ("drm/xe/devcoredump: Add ASCII85 dump helper
function")
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
Cc: José Roberto de Souza <jose.souza@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_devcoredump.c | 87 -----------------------------
 drivers/gpu/drm/xe/xe_devcoredump.h |  6 --
 2 files changed, 93 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index 71636e80b71d..025b70b0eb0f 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -6,7 +6,6 @@
 #include "xe_devcoredump.h"
 #include "xe_devcoredump_types.h"
 
-#include <linux/ascii85.h>
 #include <linux/devcoredump.h>
 #include <generated/utsrelease.h>
 
@@ -387,89 +386,3 @@ int xe_devcoredump_init(struct xe_device *xe)
 }
 
 #endif
-
-/**
- * xe_print_blob_ascii85 - print a BLOB to some useful location in ASCII85
- *
- * The output is split to multiple lines because some print targets, e.g. dmesg
- * cannot handle arbitrarily long lines. Note also that printing to dmesg in
- * piece-meal fashion is not possible, each separate call to drm_puts() has a
- * line-feed automatically added! Therefore, the entire output line must be
- * constructed in a local buffer first, then printed in one atomic output call.
- *
- * There is also a scheduler yield call to prevent the 'task has been stuck for
- * 120s' kernel hang check feature from firing when printing to a slow target
- * such as dmesg over a serial port.
- *
- * TODO: Add compression prior to the ASCII85 encoding to shrink huge buffers down.
- *
- * @p: the printer object to output to
- * @prefix: optional prefix to add to output string
- * @blob: the Binary Large OBject to dump out
- * @offset: offset in bytes to skip from the front of the BLOB, must be a multiple of sizeof(u32)
- * @size: the size in bytes of the BLOB, must be a multiple of sizeof(u32)
- */
-void xe_print_blob_ascii85(struct drm_printer *p, const char *prefix,
-			   const void *blob, size_t offset, size_t size)
-{
-	const u32 *blob32 = (const u32 *)blob;
-	char buff[ASCII85_BUFSZ], *line_buff;
-	size_t line_pos = 0;
-
-#define DMESG_MAX_LINE_LEN	800
-#define MIN_SPACE		(ASCII85_BUFSZ + 2)		/* 85 + "\n\0" */
-
-	if (size & 3)
-		drm_printf(p, "Size not word aligned: %zu", size);
-	if (offset & 3)
-		drm_printf(p, "Offset not word aligned: %zu", size);
-
-	line_buff = kzalloc(DMESG_MAX_LINE_LEN, GFP_KERNEL);
-	if (IS_ERR_OR_NULL(line_buff)) {
-		drm_printf(p, "Failed to allocate line buffer: %pe", line_buff);
-		return;
-	}
-
-	blob32 += offset / sizeof(*blob32);
-	size /= sizeof(*blob32);
-
-	if (prefix) {
-		strscpy(line_buff, prefix, DMESG_MAX_LINE_LEN - MIN_SPACE - 2);
-		line_pos = strlen(line_buff);
-
-		line_buff[line_pos++] = ':';
-		line_buff[line_pos++] = ' ';
-	}
-
-	while (size--) {
-		u32 val = *(blob32++);
-
-		strscpy(line_buff + line_pos, ascii85_encode(val, buff),
-			DMESG_MAX_LINE_LEN - line_pos);
-		line_pos += strlen(line_buff + line_pos);
-
-		if ((line_pos + MIN_SPACE) >= DMESG_MAX_LINE_LEN) {
-			line_buff[line_pos++] = '\n';
-			line_buff[line_pos++] = 0;
-
-			drm_puts(p, line_buff);
-
-			line_pos = 0;
-
-			/* Prevent 'stuck thread' time out errors */
-			cond_resched();
-		}
-	}
-
-	if (line_pos) {
-		line_buff[line_pos++] = '\n';
-		line_buff[line_pos++] = 0;
-
-		drm_puts(p, line_buff);
-	}
-
-	kfree(line_buff);
-
-#undef MIN_SPACE
-#undef DMESG_MAX_LINE_LEN
-}
diff --git a/drivers/gpu/drm/xe/xe_devcoredump.h b/drivers/gpu/drm/xe/xe_devcoredump.h
index 6a17e6d60102..1f7fabfa2eb4 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.h
+++ b/drivers/gpu/drm/xe/xe_devcoredump.h
@@ -6,9 +6,6 @@
 #ifndef _XE_DEVCOREDUMP_H_
 #define _XE_DEVCOREDUMP_H_
 
-#include <linux/types.h>
-
-struct drm_printer;
 struct xe_device;
 struct xe_exec_queue;
 struct xe_sched_job;
@@ -29,7 +26,4 @@ static inline int xe_devcoredump_init(struct xe_device *xe)
 }
 #endif
 
-void xe_print_blob_ascii85(struct drm_printer *p, const char *prefix,
-			   const void *blob, size_t offset, size_t size);
-
 #endif
-- 
2.47.1

