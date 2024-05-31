Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F511C25B75
	for <intel-xe@archiver.kernel.org>; Fri, 31 May 2024 11:37:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4E1510E332;
	Fri, 31 May 2024 11:37:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z+klN4Uz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ACC310E332
 for <intel-xe@lists.freedesktop.org>; Fri, 31 May 2024 11:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717155435; x=1748691435;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ElBFY0kwoVMGhuUKFGFjnzzxHtzQsqO6ayOwN9zDCnA=;
 b=Z+klN4UzkvsSOzNGZKeqJyl4cFQsptfqFwH+94r9NfOsbuIAfRyFSgbh
 xPNgXF53QUFlnpvac1MkUegWQThAcYEwjy3ieEZ0Me4L5iTJen900MQcv
 262tve4KfyBu0pSCY2BbYy2bcqOWm+cYbgFYVTT7jxWaNAr3LldkuNI1Q
 KZBNlbNzx1lMAz1xHq1pt4RGMawPjCv3uzfMmd5y9VxCqGsCir/31vla8
 nguDxT4vBln8i3h1fsQEXi9/ALa/FCHAHgMNMvtSgJej1328AkfawZFQz
 wEJzQWUiufZVQgemNOnegFimCVwWBkvrASB9krDbvXzw9aMoYhqJjPNsq w==;
X-CSE-ConnectionGUID: Sfpe3dluQzS04S22BVTc3Q==
X-CSE-MsgGUID: c+3I224ORBSqDqpGeCnU+Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="17492643"
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; d="scan'208";a="17492643"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2024 04:37:14 -0700
X-CSE-ConnectionGUID: 3XUpNeniR2CRCcbvg83GGg==
X-CSE-MsgGUID: YuOOwXoUTvq/37Kq46r/fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; d="scan'208";a="59310812"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 May 2024 04:37:14 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 31 May 2024 04:37:13 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 31 May 2024 04:37:13 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 31 May 2024 04:37:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XTX2NHjTuVS8DG9pbGOXwrVYfa9jw15cFtIfof0dmb7O8IFQbbsqJExxNzoeuUQz1B44sS/0CDfuVaH3m1bIfoBh3oil44c2KhSitIQdI3pE9JfJDoDJej7jXGuJeCFPSvVkvcCHKHZtNEOFvJdletKK8NFA8VBT7sIVYceFf/r1Ut6/nrhZHC2gBuVQ+k5GU+iUOVnvL235NSRdczq8wSEizePjMdhkKVRGmVbIcY5yl5598r8u8sm7FH4tMsM4vVBfToA8/EWcYhtikzmrfxmZctkXlm/5pAzEZrplX87prFhluFrFgiI7Cmaxrz6ufG23o8f7UmsP98bbYjIq/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tF/Y47TY93ya/yebVnClTuYDZZcoEwGhVYWxZYk6v8k=;
 b=TvrCzeVSCrlwjumhct73Q+QVM0+XypwhTdxsqL+LGx4RPn37DFPf4YLYRqoOFOhBujhGCVQiioxRwBJJY66Z+gt5UnEAUpb8q9eQP9gBJoa2bBVgEvw1fxVhY1dhDuUYPx+3LfRF43GBslWIJObWbidqB+q+g4b7hFjzbpgiLK0DV7pPY0BvJVZnlInp4ccFnPA66rxkWRy+TiJb8HuCsPAzFvT4DV7m+KDBdVqQTcsdGzW9BoXqvaG3/OhZyPYs9mt5aKHaYNmQEFH9LVr7/RcCU9z4Dh/3f7oKz40M4yDl/CB4L3tTbYZXoDFQ5zqbQS9/aYMUBtzxJmOsySmoPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.22; Fri, 31 May
 2024 11:37:11 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%6]) with mapi id 15.20.7633.018; Fri, 31 May 2024
 11:37:11 +0000
Date: Fri, 31 May 2024 13:37:09 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/pf: Update the LMTT when freeing VF GT config
Message-ID: <20240531113709.gar7u3rglta27xxv@intel.com>
References: <20240527115408.1064-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240527115408.1064-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: DU7P250CA0001.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:10:54f::23) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|CO1PR11MB5057:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d92fa46-9d5c-4f5e-7c15-08dc81660301
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UmVsbUErUDh3MWx5ck9CMldTZURzS041VVMxMnFhc1N2cFRRTEc1akdaNHZT?=
 =?utf-8?B?bGFpVmlWNXRUR1dRb0dNUURKckZlbXlJQ1h2SmU4ZTBBajJ6QURWSTZ6SHg1?=
 =?utf-8?B?cEc0NHpLSjVrRGh1MGw4d1lBWWxXMEhDSFRyWEtvYmh6NWd2dk4xTzVFUWw0?=
 =?utf-8?B?STZYQTNvazJ2aVh3OTVBUDJlTCtKZjNvR2czUXIyMGQvbXV1aTJGYjd5by93?=
 =?utf-8?B?aTU4Vk1tTlhaT2pNSDJzMkRtNXcrMlAyWTRkM01CdEdxRGdyamhCVzg5QldY?=
 =?utf-8?B?TjZxZGQxTDhtTTB1d1R2ekkyVnFqT0Q1Q29xM1EwNEk4ZmNEWW1DSjUwTjdi?=
 =?utf-8?B?b3hKN3A2dXFuTHdSYTVjNzVLOEdPQ0VTV3NESDdURGo3b0VmVldWMXRWRFNK?=
 =?utf-8?B?dlhBUTN3T3BwQm9FYU51WkkwRkYxazc0VjBwOHdLMzNZeHJkNzlNYXNON1Za?=
 =?utf-8?B?d3ROMGNjWm9kZmp6SHNFSTV4NG1rc3B2cWsySzZ3Q1pDVUVNb2ptQnJsL2Zm?=
 =?utf-8?B?MXlRNWxYM1NqOXBjV2tJcmpmTXpiempDdDF0ZHArM2x4Ni9yZkN2UnRwbEtB?=
 =?utf-8?B?emhLdW9mNE1qVDRhWDE4aTJSRkdUUzlJdFAvNitsOU9mVkRhMlRnZmFjcmls?=
 =?utf-8?B?Q0VrQXlhQVpwcGJYbUd4TjEzWEM5WEdaUlh5bFpUQ2RsYXhiWmVwRUo4YnFv?=
 =?utf-8?B?c3FOTERWU2NLZVFyaVpCeEtuZGFtTzMxbVVoZnNYSllKNm4xQjdpS1lRL3Fq?=
 =?utf-8?B?TkdUUVJqWW5XQU9pUkNodkJMa3hKL3hQaUU1ZUJ0RUpndE1ENjEwTXdPTVEr?=
 =?utf-8?B?TG0yVFl3YmtnUVZhNEZuZ0dJdGpkald5ajdqTFZSQUp3SFlsWmN0QUJQbHRz?=
 =?utf-8?B?QWRvbkJuTTYzQVlmN1QxWHNIejFMcnVQa1h4WmZZVW55R1VBSTNLSGhrRk52?=
 =?utf-8?B?ZjN1aG9OS3FYZFkzNHRPb3JzODgwaFQ0QjNPWi9uc1BoVTVTNDcxYkdhMU9a?=
 =?utf-8?B?WEhnRHBIZ0dIMkFya3daRE1ERDN2blV0THhOVnJSWUcxUEZFQ1c2eFFTbG45?=
 =?utf-8?B?TzF1NzVBcnFyZU9ibHNHVS84ckpzOE1ENzh2RlBVcDRnWEpxaFJiV0lmcUhr?=
 =?utf-8?B?VGM5bHJvRG1IRVo2QnpzKzZJYzRVSUE4d3drNVVYT2VsSEh1MTBXRnJNN0JC?=
 =?utf-8?B?eTZHMVpaWEtCcS9kNmpra1lLdmVnQUtob0JDTHM3K0d5dHNrZEdPY0lxWE1T?=
 =?utf-8?B?ZFo4bG85dmtYSXZJczk2cHF3SkFHMDF5WlVOVm9sa0dTaUZmVm1EZHdET0NW?=
 =?utf-8?B?eGU3U1d2RVJjQVpJa2xQdE40RkVhYnBIeDE0SlFUZ3pXVzdqOXE1QVQzeWlJ?=
 =?utf-8?B?aFhTSUJRdW1uL2lHZ3g0L0libUN4UmZ0VU44Sk0zMDYyWXhPYyswcER5cWhZ?=
 =?utf-8?B?ZzNOUXRxZGpQMllqcTRaSlo1eFczdW1wR0o0cUNEL1JnNktWcUJ6cjU0MDJk?=
 =?utf-8?B?V3hKVEwrRmRqRU1Idk1aUGpFK1lqSlpsS2FtY3c4elhLSTlRRTJxY1doUFN3?=
 =?utf-8?B?cnpYYzR5aEhIV0tvOGRTQzVCMmdSYlFNeGlYWkdCTUhJSXAyM0ZiYmUrRWZh?=
 =?utf-8?B?b1VIeE1lazJBUk1MR3k1Q2VvVlVOQlRZUXJUMjRrbFlwdHFucW5wV2dScmtT?=
 =?utf-8?B?dFo0RXA5QktJSzdoaHVSNWV6a3dqT0VHZDNMQWZxSzdEazhzZUx6OThnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z0lvVlhMQjhDQ05TM0pOdzE4Q2JIbDErVEV5U3BDYlNIUzFmNHVKYkx4bWlU?=
 =?utf-8?B?cWNrWnVMaDJqSTJzOUk1YTdPTlJyR2YxR1ByZjFuUzl6MmdFT3prdnJra2NN?=
 =?utf-8?B?R3V1Qys3S1FGSlN6YnRSbFAzSlRtUFdEK1JEdkZHTVJ1R1F3NWRxQzQ4M2kv?=
 =?utf-8?B?WStrK2c4V0FiR1NHMC9RVXFvQmhwZ2NxWUNNWmJrTlkrU1lZTk9ZZmFFNEI2?=
 =?utf-8?B?WjduNWp4TVorQ1B4UXF6cnhZa0c0YU9hVkpFZEx1RUNzQnlGQTJnK3NISW5D?=
 =?utf-8?B?Y2JpY2Y5czRVNnViZm4ydjBOV05GZjg0ZEt4RmZMb1RZaGpaeGpKMXdKb1Zi?=
 =?utf-8?B?ZWZhRSsyWjJ6YWxiY2NSOXBPRmJCd1hEN0pKamN4bXl0ZmptNCtrVWhKZ29r?=
 =?utf-8?B?UlpQandVTjNiRmM1STA3d0szbWp1T3BSQ21obkFKYm4zUEhJVWxQZ29ER3Vq?=
 =?utf-8?B?WStXK2JPaUF5Zm96RVlya2IxRUQ0eUx5ZTk3NldKbkUyRzh2bTlXWlhoR3VY?=
 =?utf-8?B?YnVrWFBnWWRpR2EzTEQ2Sm9WNVNDUkowam5scG5TRlZPbWJYaFloMTJmRU5E?=
 =?utf-8?B?aHo1elYwVk5BRUFoelFpWHpwOU1kVlpnNW1CT05BaDVFSEZWZXdXN083SHgw?=
 =?utf-8?B?eHhiWlNkeDhQeW5ST1JQNFFzYnplZ2NuRXBqZlZJZEFZRU9rb3BwNTUvWGho?=
 =?utf-8?B?bWZrWlYvT25SeFNnQm5uMmlZT3N5YVZLbzVYckQvNXNvV2JQMkRQVjFKTTVM?=
 =?utf-8?B?aHlhSHB6S2wyVVFiTDUzYU0zQ0hONk5xRHJRV3hudjVZeXhCMUxuTmc0cHl1?=
 =?utf-8?B?Njh3aGc1SW9ObytHQndTOUtlWEZ2K0hZVzZFSUpuRFhwOGtqUzNHN0EyUGJi?=
 =?utf-8?B?UXJDYWgzaG1kSFNRR3ZvYmpxWTIwOUdQZzJtelBSaFFIQzF2N0RPL1RnY0dK?=
 =?utf-8?B?UmpYTnB3Y1JZaGlpOG9vZnZQajA5SWdPRmZCVWExUU9kdmZmZ0MrOEZ3Qy8z?=
 =?utf-8?B?UDlubmh6dzV1TVdZdmhzUmlBZ2V1c0FnekdqRGw3WnV6aXU4RFZKZHZYUWZV?=
 =?utf-8?B?OEFOZm1oNFhVdzZNZnJHK1BGNHlQTW9MTUR1bFMyNmIxTklZNFJSVllTSXFq?=
 =?utf-8?B?Q2IyZncxVWVJL0dvUldTSE5wdnJ6WkFaVWdtMHVZekxVTGVxRTFINXQvKzl4?=
 =?utf-8?B?TFBEYkt2ajZVK1E4RUlWdXh5RXNVTEhQL21meVpHOWxxbzdFU3I3b1I0RVRI?=
 =?utf-8?B?ODV4OWc0bUcvdTByMVo2SVluQ044YnJFbmhZbHlrcmE4NkM3Q2lvV0JtQkZ0?=
 =?utf-8?B?a3JPOHdkRUdHczVxVnFoSmF4S0ZiR01ma0tULzFwN0tDOWoxZ0J3dDQ4cVpK?=
 =?utf-8?B?am1ocmczL2dRejlpUzRVK2ozMzUyV2RMa3RST0NTd3BkcG5Ea0tsbEx0MlI2?=
 =?utf-8?B?ZlJLb2hSMk9YdVhPM1VrdnVaeG92SUdoYlV6KzhuWWt4RWJWc0kvbDNMTjBy?=
 =?utf-8?B?WlRxVEtnOVdoU2hHYzJYazNRV1RtYTFaeUUwZG16M3gveEtrZmxrMDRaTlpC?=
 =?utf-8?B?SHFrSlI1R0g3Ymc2RTdZMFhadi90Q2lTaDkyclpqTFhCRSswMGNtV29KSm1M?=
 =?utf-8?B?bU9rcEIwUUo0YnI3MXJ3S3QxdEg3UUxGYnoyQzFIZnRtRS9xaGFiZjBWbGxM?=
 =?utf-8?B?M2tlempINkpvYWF0UVNwRlRFOTY3bjZMOVZrTUo3dEdXUEh1aktZSHpHcWNu?=
 =?utf-8?B?djJqRWE2RWljbWhVc1YzOU93RldSM2MrL3RKS2lhK2IvVUFLQlR0OWJtOERh?=
 =?utf-8?B?VW1KR1U2R05kcCtMaEZ2Y3VacVB6NkZWdEJUWldTZ0tkNzdzTU44QzM0RWg4?=
 =?utf-8?B?UXE2NDJVb1EvK08yMVVTZFNVdEhocW9DOW1PT21LaDJTS1VxZm1MQ1ptWUNo?=
 =?utf-8?B?RlFpMUxyem9INk1VeXhQdEhHQ1R2NkViQTFGeHMrc09mK2g1Ym5NSXhRaEwy?=
 =?utf-8?B?Y1Jud2VqWjYxWTg3dE5Zb2M5aWJFTWFicy80cmZKU1JyREhVaTVBeGR2amZL?=
 =?utf-8?B?TkVITGxyZ3RmRUxkODMyTVR6NEdoT3ZZdTdxVGVrTnpQU0lEYm90eHQxSUY5?=
 =?utf-8?B?eWRtaHA0NU92UXA2S0NWbmc1Q2UrSmg0d3E3bnp6U3ZBRFBSNS9IY2I5RlZn?=
 =?utf-8?B?Tnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d92fa46-9d5c-4f5e-7c15-08dc81660301
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2024 11:37:11.8047 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rqoQA9XFAF2xCgVrvHZsGRAwBTXZmfxVY2xwyW4Opo+yHnr2YxFR0HOdyu/HBqrtAaXA6sSN4yrb5X9YlICIjxshJfFu+qsuydUniLypihg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5057
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on pon [2024-maj-27 13:54:08 +0200]:
> The LMTT must be updated whenever we change the VF LMEM configuration.
> We missed that step when freeing the whole VF GT config, which could
> result in stale PTE in LMTT or LMTT PT object leaks. Fix that.
> 
> Fixes: ac6598aed1b3 ("drm/xe/pf: Add support to configure SR-IOV VFs")
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> index f678cd1ad9c5..f49fc2917f93 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -1842,6 +1842,7 @@ static void pf_release_vf_config(struct xe_gt *gt, unsigned int vfid)
>  	if (!xe_gt_is_media_type(gt)) {
>  		pf_release_vf_config_ggtt(gt, config);
>  		pf_release_vf_config_lmem(gt, config);
> +		pf_update_vf_lmtt(gt_to_xe(gt), vfid);
>  	}
>  	pf_release_config_ctxs(gt, config);
>  	pf_release_config_dbs(gt, config);

LGTM:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

> -- 
> 2.43.0
> 

-- 
