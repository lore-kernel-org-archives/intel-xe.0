Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6ABAC982ED
	for <intel-xe@archiver.kernel.org>; Mon, 21 Sep 2026 22:53:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2722010E564;
	Mon, 21 Sep 2026 22:53:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="byU/s0Ku";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A798910E564
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Sep 2026 22:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790031181; x=1821567181;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=0ofW0BdI35R8NUG36wjdf6alJeb49/Lp3as1xIkqMmI=;
 b=byU/s0KutPtlfV97BUOpM+QmAS+SwizVKfr0Rrqux0lyNRBjkR3z47co
 HDq51v4cX7sBBMS66EaG4oWdD8kyGo+9Cmsey2Kpb+AGleJ2wmA7dL8Qq
 mwlzq4LknFTQXBEnFZtaw7WZHZZPzpu9IHVs/Q0i7dxSUVFdXhu1izSva
 iFZy8T7NdvGlnpM8ZODSv5qd15Qtq2ruI1GpmDuPAcsnF3IRDzwzbnSF8
 P6/8/TmDbvTAslWQBB/aqn745FqQdKaaCgPlWJ9zGx5pIF5/AiH78pS06
 rUK6N5pek2pAzKUrN+y9fzc/LRpkCUXDwxc50c9x6sIt35QeOhhBXPbTh w==;
X-CSE-ConnectionGUID: GPZCg2d8SceAYYgub8gqug==
X-CSE-MsgGUID: 9e6KC9OuSDGF5b4yqnMCFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="1090843"
X-IronPort-AV: E=Sophos;i="6.27,115,1787036400"; 
   d="scan'208";a="1090843"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2026 15:53:00 -0700
X-CSE-ConnectionGUID: gj61oMDPSfiP9bFcs4VwYg==
X-CSE-MsgGUID: yJeCl+N6SyKxvGRqGKRQCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,115,1787036400"; d="scan'208";a="271387470"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2026 15:52:59 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 21 Sep 2026 15:52:59 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 21 Sep 2026 15:52:58 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.44) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 21 Sep 2026 15:52:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U7kNJFtvA/G92zz57QkgkdMxnhhGFTWAFTUBsLj7hH301j1rZXsKQDF196jff6s3VRC0OxAvyPAQfNs2HbAbCdvoiGqt9Fis+F6tElHn1OaCLsYqONLt8s4/P40SXSA/vgRkZ8OtdQuBivSdZyDnZaGT4rp8OaXnCkRHpPt7pjs43l/udViRIFSo59f0D6248PpWC97m85IVWLGp5hKXokOnFD8JxQqXw7gE7E+4LVvJUv7E1ZhPDAJNKYeEbAKPx8m9GvK6FXripYsQKE6UI1o1ncThfndXw05dKTD1u1vPN5qUeI7N6014Hlft+yDcVjp8dhbTW5aRSm9zmLUFYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HwfzvXHWTQFw/6t/4BnVJSSDs1hJ3+KHogRrH+gcRyM=;
 b=G2hmWpXPUJHVtbEc6Ltm36r+T/+jhSGG74jm24kICoFyMsLm8IkY9w94PCN/3JtSXNi3Ts7dNg6+kTVv3mUk0uD1vP273Ss+InSpd9m5MElJiKfN9RMvY3DamXipvsv+yCaF5HwGtB9dYQBS7n3R30APsB+fWHmtF/Xqw1lwhDo2/0gdZg8VmoHV+zJO8pS/9hLdBXJ5UqDqktvHrLVd9yX6mkeVBCk/LOofJWxKvUaA0DAs/OYcrWG4yN++TZWZ77dFMOEU7JF4zqdYo/2nCnIIGvvRBNWx+MxsYytGQwlXvdnxJotzZWEqHzjtZMLnE/LcYQbjYjh1lPB8siTK6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by MW4PR11MB8268.namprd11.prod.outlook.com (2603:10b6:303:1ef::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 22:52:55 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::f3ff:11d0:7a52:db0c]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::f3ff:11d0:7a52:db0c%5]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 22:52:55 +0000
Message-ID: <f0606c25-251d-478e-b138-5462b2cad381@intel.com>
Date: Mon, 21 Sep 2026 15:52:52 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe: harden adjust_idledly() against
 divide-by-zero and overflow
To: <tilak.tirumalesh.tangudu@intel.com>, <shuicheng.lin@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260916100545.779894-1-tilak.tirumalesh.tangudu@intel.com>
 <20260916100545.779894-2-tilak.tirumalesh.tangudu@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <20260916100545.779894-2-tilak.tirumalesh.tangudu@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR03CA0021.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::26) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|MW4PR11MB8268:EE_
X-MS-Office365-Filtering-Correlation-Id: ae435d03-ee49-4c6e-e530-08df183312c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|18002099003|22082099003|56012099006|11063799006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info: 3Vf6cfK7J8oqKp2Y/QHJrfWO/KAtEwyQZg3iEPZonqhqV/O1c3qlYFfUrciwvokeSMsxNK2/c/JWkywRXUh+v/6iHyZMeXQlOAtw3pO9x4ZLOP89JSqJ7RKK/koNpormulmRLgAJT7L8q/kCIAXxGGvL0v07oEHNOYw3Re0S0i7YhcL7fBDM4tzzQWpHWYgvDkrq47lRHvOLuLcjZiHGLFdy5+j1o5LLGU/OGjWlASymXlBOLeIR1VeGVjMOrUgFO7OU9M41veiHuFFLMNQUy6B7pH7GTdUTGqVuCVH+BJN053rhU9ZnM96gm4X3Oxp7pJyKheodoahU9em49/UN8335XkQudE3apbBqttuvGuFwhKcYwIQdYJPZvShUOaJK9LEmCT6WPTDZ6izaSWJruNvZRnNqLhPY6N7rB1Y5b8jf1dCASoTvMvMnuxAiV778+KlntnQ2j1qme9x2osEqXhPQ7tvqgXtQ0lb8ytnsxZqRGCJ9P3IID6R5nNucQzuzepFSct44pLAj5wnF0DDOJzahCNqh59Gy5N8k6Ff+2ywc17b7+rQiYCvd0x223x68RgloDmWVzhQPaAckorGPTC6X4OPZIaeYecrinKMBIVEvHzbvkgaEZltQDiP/Qagfx9oJTyEFCYHQpXK+i0nZ/NFHfgWOP14U6D+sLv7aYS4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(18002099003)(22082099003)(56012099006)(11063799006)(4143699003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VnVIbm9KSmdLWVlVYlpwVDAwNk1uSm8wVlhjTlhzbE1OclpPNVBKaTNydXc3?=
 =?utf-8?B?ZHppL3YzLzArbjZHMDQ3Z0ZiakJZVDRKczlmT1pEWmdVSXVZUHB5WmlNOGl6?=
 =?utf-8?B?d3I1WmliSUpsZVFjaXBmbG9lbmJXU0J0RTZmTitLVG1VbWp1a0NRcUIxZVNV?=
 =?utf-8?B?N0JMWlZmS1pmUHJBWmN0YzdEdktveUZMZzROUDRTQ2hPdUJaWFhxemNmeG5L?=
 =?utf-8?B?cEpHVzdsUFgyWlFUZ1piVGp2dWVlVGRQWDRETkdWU1MwSWg5SHh5VExPeU1u?=
 =?utf-8?B?bHo2QWJocCtpcGJjQUthSHpYd1J6T1V5VUFralNSS0JJWGc3OUp5Z0ZoTmhY?=
 =?utf-8?B?LzFnSkx6UVZ2SmQ2TWttK0JCNFNObENITXMxV3UvWU5xNTlocVFyVVFhL3RM?=
 =?utf-8?B?cDRpV1ZCbzZ6VW9tM2xZcUJJNmM4T2RINWpaQ1U3ck5yYWdSODlhak51NURG?=
 =?utf-8?B?RUhzSmJ5R1R6TlhzMG9WVFF3L01oYkZodTNBdDZaQlNPQlk5a1NVcTFwOXdW?=
 =?utf-8?B?VjU1SnI3WHVZd1JQS1BLWk0vUG1BbndGdEg5UVpFRjZYemVkR256UXErdm5p?=
 =?utf-8?B?M0tjRmNEQk5NYzB0bDByTExJTktKciszNmRxV3dGSFNzRStHUlJoR3lkbWVl?=
 =?utf-8?B?Z2huSUIzbE5NTHJ3QVo5UEFMSnpOODI3eHpnRDRwZnhZSFhPS3psNnRuY3Qx?=
 =?utf-8?B?bnBxTkhqWGltMEJLMDhNYmNxWmZ4V2FzVk9OeG5sY1pibDlJR0ErK0tuYkM5?=
 =?utf-8?B?M0pPQUlxdXlUV2lFWENnSjl0dVV2ZlhheUtpV1A0N1VrNEsxV1pSbGdaR1dC?=
 =?utf-8?B?dmFrRkZsV1JjSDJoaVZ6blduUW1qcEkvYnJ2TzlpRmFZNUYvSG82SzV2U3B5?=
 =?utf-8?B?ZVh0N1ZCOHA3dGw3UzZON2hKR3p6Zk5OWXQ2SFVCRTBzd2paa2Vud01lQmlJ?=
 =?utf-8?B?S2pRRi8yUGVXdDdWMFlxaFZhZmN1dEx5ellNNTJkY3FRRmJSaDRLWHB4NnNj?=
 =?utf-8?B?bDB1NXVnQWE0YXVxZjA2TEF1V3NnS3k5bVM2TDkzOGJaQ09OeERLcy91UWY5?=
 =?utf-8?B?L1M5Q2ZRYU1UT1RvY2RrT0RValNZM1lQRnVXU092TUhpVkNtNjVQUktybG5t?=
 =?utf-8?B?Rkg0a2hrREpaUm5RU2s5Um5IRndnWkpYY1dvYlZoSEdmZ2JmVy9CWGpYOU9C?=
 =?utf-8?B?Yzc0MlVyNzhjOG5GcFJhck94eG1DSEtZUGtCNjBPTFgyd0JZeTB5aUowU2JR?=
 =?utf-8?B?MEJWNUh3Q05pODFoeEEvbGFndExOQWdwYUZMMXpaMWpFWkxNajdPa1RZZ052?=
 =?utf-8?B?d2pCZC91OWRFRzVUaW04QVgzdmNsODVxOTV2RGF1WHpPRThxa2daamFyZ3dG?=
 =?utf-8?B?V3g4b25walVNeUVYam5oZ2ptYmdkeGVRZE1UcWc1cnpQdnQ1KzBSRG5MMHBj?=
 =?utf-8?B?bnFleXNhMVZRZjlOV2lkR2FTRDU2VGtsOHVKM0hnZWtQYTJmaE93ZXhaalVZ?=
 =?utf-8?B?bTkxQlZmcWx1RVRhc3lPMnBvcVR1SlVBUEQwSy9pLzFvd01HWWZhbTd0MjdP?=
 =?utf-8?B?em5wVnIxbWJlU0tkSVU2Q094VFVzM1FJYWFSZ0FrT3NXV3hibERub252Nm43?=
 =?utf-8?B?NmlPcnRvaVN1cWt5dHdPQWpKenpXdmg3ck5UVEVDUGs3QUptSFdZa1BRYVY2?=
 =?utf-8?B?UHpIOTlwZi96TSszZWpYYS8xWXhHSDRySlRIckczemc5dUFBMGtidVBWcURS?=
 =?utf-8?B?bjRtRW81eEYrbTFmbWtKTGpFQUZTTkJiY21ZOU54eDN1cU1nVDNjTkNhMXFi?=
 =?utf-8?B?YzF5QktaMkJSZkNMbHpYZzhkVXQ4bExNSjJzQjUzTWJoc2cxQU9jYUhZZUhQ?=
 =?utf-8?B?RXVSL0I1clIzVlUrU2xETVR4WFAyc2k4R3ltVDVHNFdzL0VVMThJRXpCSUIw?=
 =?utf-8?B?VkUweUErQmtvcVlDcTVyRkxBZjU3ZzliTVZBU3BUZFY3MURENnRRMEU3dUpZ?=
 =?utf-8?B?Y1VSbGNhYWp1WFBtT0c3a1BLNVRWN2NhZWtpdVdCWGlyWjJYbTV3THpsOThX?=
 =?utf-8?B?R2UxSjVHZDU1L254Q003dTZUWURQR29OVk9iVG5RV0RBaklJRk5ZRTZTa2tk?=
 =?utf-8?B?aTZRY0ZqK2lDNzRqblBMMG9vVlhRdlEzNDliaEN4czVlclFzeUIrM1J0eUhW?=
 =?utf-8?B?cSszdmthY2lYb1FoZXdjWmVCeUNLZVR3K1VtZmZJUUhaSjJLamxNQ1d1L1BU?=
 =?utf-8?B?YWs2M0djTUJrL3h1TmdDUTlqSFVGS28xS1J4aG9Da0dDOTdObTdGN2JCUEhR?=
 =?utf-8?B?bjB6RmRVUlZCU1l4bW1vY0xUWlNJdDd6M0YzWFZHV1AzREt6cCt5djczY2l6?=
 =?utf-8?Q?JcZ2yVIW6B+7yijM=3D?=
X-Exchange-RoutingPolicyChecked: 3PzOd+dNLd+kxHDdjVkMLxRWlo7j+mLS6xh6GbpFUnnKtPrpRva2XBAMItTXFzx+v6rl0FOeE5nFM6ZwevRAH6moLCQTjg8VTTn7KybR46KghYcUQczlbnVRVD9ISpUzNN9tUeiUStRnWqgb2GGUTXkdJpo922dqkupd/SJxRBIHHYI0fUvX/Wvd+nRkX4/xH5AVbRoStRr1vNq+bMAu7469wWLJ2TnW0evBSAB3UWBeCnJ3j0ejc9kkzB5P2gUUwJcoxm+pMcaGLP2wZNjJp6hhMX+LfeVHxDPlaKdSKB/vUXs/7EXDbEiwDmG+Hq9PtGqGE1kphcsyNlWuG+D4PQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: ae435d03-ee49-4c6e-e530-08df183312c9
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 22:52:54.9281 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rhYCjdDiQQ7AI5hv/X9LFean6iCE4h5Ez1uxJgKQZIlpkfrZpy2hqMCzUkSnauxCD7UrraI3drrnPszCcv1Nima6Z8ZhIqE1pWeUV7TMv7E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB8268
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


On 9/16/2026 3:05 AM, tilak.tirumalesh.tangudu@intel.com wrote:
> From: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
>
> adjust_idledly() has several corner-case issues flagged during review:
>
>    1. If xe_gt_clock_init() failed to recognise the crystal clock,
>       gt->info.timestamp_base is 0, which makes idledly_units_ps also 0.
>       The subsequent DIV_ROUND_CLOSEST(..., idledly_units_ps) is then a
>       divide-by-zero and panics the kernel.
>
>    2. The tick-to-ns conversions are done in u32:
>          idledly * idledly_units_ps, (maxcnt - 1) * 1000
>       Both overflow u32 before DIV_ROUND_CLOSEST() sees them.
>
>    3. If IDLE_WAIT_TIME reads back as 0, maxcnt evaluates to 0 and
>       the maxcnt - 1 clamp wraps to 0xFFFFFFFF in u32.
>
>    4. The register only stores whole ticks, so the clamped ns value has
>       to be converted to ticks and back. DIV_ROUND_CLOSEST() can round
>       that conversion up past maxcnt:
>
>         maxcnt = 640 ns, one tick = 666664 ps
>
>         clamp:        maxcnt - 1        = 639 ns
>         ns -> ticks:  639000 / 666664   = 0.958 -> rounds to 1 tick
>         tick -> ns:    1 * 666664 / 1000 = 667 ns
>
>       667 ns is programmed into RING_IDLEDLY, but 667 >= maxcnt (640),
>       so xe_gt_WARN_ON() fires again on every subsequent init.

LGTM,

Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

>
> Return early if timestamp_base is 0 (the unknown-crystal path).
> Do the conversions in u64 via the *_ULL() helpers so they cannot wrap.
> Clamp with a floor (DIV_ROUND_DOWN_ULL) so the programmed delay stays
> strictly below maxcnt, and guard the maxcnt == 0 case with a zero delay
> while still writing RING_IDLEDLY so INHIBIT_SWITCH_UNTIL_PREEMPTED is
> cleared.
>
> v2: Drop the redundant warn on the timestamp_base == 0 path;
>      xe_gt_clock_init() already warns on an unrecognised crystal clock.
>      Keep the early return to avoid the divide-by-zero. - Vinay
>
> v3: Field-mask the RING_IDLEDLY write with REG_FIELD_PREP(IDLE_DELAY, ...)
>      instead of writing the raw tick count, which could clobber
>      INHIBIT_SWITCH_UNTIL_PREEMPTED and reserved bits. Split the
>      inhibit-switch clear from the maxcnt clamp so a set inhibit bit no
>      longer forces a needless delay overwrite when the delay itself is
>      already valid. Use gt_to_xe(gt) instead of gt_to_xe(hwe->gt).
>
> Fixes: d2de4410a88f ("drm/xe: Apply Wa_16023105232")
> Cc: stable@vger.kernel.org
> Assisted-by: GitHub_Copilot:claude-opus-4.8
> Signed-off-by: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_hw_engine.c | 27 +++++++++++++++++++++------
>   1 file changed, 21 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index 010499766fce..d868af8e3301 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -592,22 +592,37 @@ static void adjust_idledly(struct xe_hw_engine *hwe)
>   	u32 idledly_units_ps = 8 * gt->info.timestamp_base;
>   	u32 maxcnt_units_ns = 640;
>   	bool inhibit_switch = 0;
> +	bool wa_applied = false;
> +
> +	if (!IS_SRIOV_VF(gt_to_xe(gt)) && XE_GT_WA(gt, 16023105232)) {
> +		/* xe_gt_clock_init() warns and zeroes timestamp_base on unknown crystal clock. */
> +		if (!idledly_units_ps)
> +			return;
>   
> -	if (!IS_SRIOV_VF(gt_to_xe(hwe->gt)) && XE_GT_WA(gt, 16023105232)) {
>   		idledly = xe_mmio_read32(&gt->mmio, RING_IDLEDLY(hwe->mmio_base));
>   		maxcnt = xe_mmio_read32(&gt->mmio, RING_PWRCTX_MAXCNT(hwe->mmio_base));
>   
>   		inhibit_switch = idledly & INHIBIT_SWITCH_UNTIL_PREEMPTED;
>   		idledly = REG_FIELD_GET(IDLE_DELAY, idledly);
> -		idledly = DIV_ROUND_CLOSEST(idledly * idledly_units_ps, 1000);
> +		idledly = DIV_ROUND_CLOSEST_ULL((u64)idledly * idledly_units_ps, 1000);
>   		maxcnt = REG_FIELD_GET(IDLE_WAIT_TIME, maxcnt);
>   		maxcnt *= maxcnt_units_ns;
>   
> -		if (xe_gt_WARN_ON(gt, idledly >= maxcnt || inhibit_switch)) {
> -			idledly = DIV_ROUND_CLOSEST(((maxcnt - 1) * 1000),
> -						    idledly_units_ps);
> -			xe_mmio_write32(&gt->mmio, RING_IDLEDLY(hwe->mmio_base), idledly);
> +		/* Clear the inhibit switch without disturbing a valid delay. */
> +		if (inhibit_switch)
> +			wa_applied = true;
> +
> +		if (xe_gt_WARN_ON(gt, idledly >= maxcnt)) {
> +			/* Floor below maxcnt; write 0 to still clear the inhibit bit. */
> +			idledly = maxcnt ?
> +				DIV_ROUND_DOWN_ULL((u64)(maxcnt - 1) * 1000,
> +						   idledly_units_ps) : 0;
> +			wa_applied = true;
>   		}
> +
> +		if (wa_applied)
> +			xe_mmio_write32(&gt->mmio, RING_IDLEDLY(hwe->mmio_base),
> +					REG_FIELD_PREP(IDLE_DELAY, idledly));
>   	}
>   }
>   
