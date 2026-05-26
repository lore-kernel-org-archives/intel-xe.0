Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A774CD5BD5
	for <intel-xe@archiver.kernel.org>; Tue, 26 May 2026 23:43:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B374A10E082;
	Tue, 26 May 2026 23:43:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gzp7QEYv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B61410E082
 for <intel-xe@lists.freedesktop.org>; Tue, 26 May 2026 23:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779839027; x=1811375027;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=FdksO7nXjyE8We6H0HIJA2B064K5IXyOeG6c/MMTjXE=;
 b=Gzp7QEYvCLbxKVDUWcznnULP5ZqneMkpi1fX65jhvBx5eeV+TGvgrbLy
 inoC+ikXQDYDqqenbPxf08YM1MKAbiUvRZx+m2LDTlx7Z/LU7DjSd+XyU
 DJvAedr7AZ2fSDn+7/9zyccrxnBA81+a6jA3USU+mKnd8+KPbkWWNj0bu
 JvP5BhAbo7wMNxMySAqq+Yv/BA24ue6+WxnZIqK1dTV1g53rTpdudkV7R
 wjP937xRDMFOUmabQqkHx92jSZLp7RYEkJtQymSkAERkTf1B6Nx3UhzFC
 +RkX1+cqKS33Dd83AFqhkg3x2+M7FRX5w1q02iDMHZJRbycEtW0vOlYFB w==;
X-CSE-ConnectionGUID: MDwd+RvNQ1OfSDUloxI53Q==
X-CSE-MsgGUID: sdqTpHv+Sb2n905AjFtSXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="92137854"
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; d="scan'208";a="92137854"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 16:43:46 -0700
X-CSE-ConnectionGUID: Bekn9/EEQcCBoHc5OAaAqg==
X-CSE-MsgGUID: J2kqpKq5S4OxW+4/b7IXfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; d="scan'208";a="247151637"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 16:43:46 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 26 May 2026 16:43:45 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 26 May 2026 16:43:45 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.21) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 26 May 2026 16:43:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A54ZhLe0+/KLybWkiZ53DFBpvvFrVJiOcUoRKx3c1teKdtF8h7VIrSOizM3UDTPF8UNKCQ156bC2zQlZ+dSUn1a+tE+GU4kz1Qi/kvQWMxx+6uFRC/icZWp4Igylov12X47rTFqF6Fy55SJqWgXqmmPco0H4P9OOQ2fAbViHrUf0EmCHYdEWQp00enG0h8v5gJ7wwB2H/syfO12y24xoSXGlsxcz02a8Bz/px5cr2+va67W0jTaATDcJDK3nDh8nM9Fcubu8v2+SxYrDZsIA4Oprj/RXVXXjlvyC1a7M58Om65BDONPPX+oedbIkEb/y6sl/CxqOGnSvLzsAuTEH2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LKmPlOCF5BrZ3nYthP421FUy1CWUqMljLJEQWShYy0g=;
 b=kHXiCaq0qSkD6lQFMfZDPOIpUN+cJXpEvN7JIfdZF+BtQxPbg8CWtYIZWTQgCKXZAfUtewDwMBU4i+6ExIyGfNsrFKnOZ3SXUFWPsWj+Q8VROA9cMNipv77ovblijvKAG989JPazm2bR/hckYgUeOYEuxpDIuPgSTC8PVIzgH/H4nutj1C18JJslSIk1L+nwxPWEeWMIvhAMuaRcoH1lloocIqAjUY2ASRq7fqqQdo15CCFrJY7yW2RnGytmHem6+wKWs2yDdgSZ4j8K4b7pkw0rr3i7WWP1T7t+YT3s4Ov4M2quVUEUxXGDoqP8nD7iKD7+JsQXVTcRFVHLgvI9Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by MW4PR11MB7053.namprd11.prod.outlook.com (2603:10b6:303:221::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 23:43:40 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%5]) with mapi id 15.21.0071.011; Tue, 26 May 2026
 23:43:40 +0000
Message-ID: <fc50ad6b-defd-42b3-9866-8e98b1f1b34b@intel.com>
Date: Tue, 26 May 2026 16:43:40 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/10] drm/xe/guc: add the plumbing for GUC_PAGING_CLASS
To: Matthew Auld <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20260526141901.62207-12-matthew.auld@intel.com>
 <20260526141901.62207-15-matthew.auld@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20260526141901.62207-15-matthew.auld@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0118.namprd03.prod.outlook.com
 (2603:10b6:a03:333::33) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|MW4PR11MB7053:EE_
X-MS-Office365-Filtering-Correlation-Id: 660992af-c723-4b61-b69f-08debb809d21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|22082099003|18002099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: ndNUKutw0UsjmQTwZWaoGg4kFqVowMuVgA1uiguBg4wroNDBwmE6g2hyKONGiUM7CKlGT0RufScMtJ1qJoitmPlrVDuLAF1QQMhUHPiO554OOt3VU0kwr6WUyYA5u4nVRTdwrRWfz7iQaJ6TDvjQ9vhgSbv42wy7MAhPY+dNDxHaTUg++OpDfHFyWwAGCAVSikVy4QNPBnOEDpjqBMEdkgj6hHz6PM8f3U1d///IP7CppFlevVuxh/lDF4LJy/1ra6GolWIPxDQa92IlU8dYBYXGjHhPRTG1e4jN5T0O6Jn64R55z4CFQxTLQmfI5hpglnUz6mAteecUWzXa1BLB6xizv3g4iNpw2rYRhfGIWripjPTVXFmS0C5G6XTFy0nZtEDEk6MoguF1ROv8ObEF06Qm5zmEi0Fh218gGV2FGuaCHP0fOD6FnzSZOTuCpnic8YoJJ1akVXz1mMP59lBvIPdYYmflkcjdby8pSpy0vZ2vAd9bkbRNmhER6PZ4bZze+Iyl3nY6qYaokLRjTWV21gDZHU2eD1vOkXLyg+HO9ylmimc2HCmWqdvOi0QBNdaA1leJl79qMP3KJ+DeEgVgbYRT43TcbjapOvDGOv7xsRW6zY15wbkUNG2K693GxBpbXpu/ltYKN7pMbl5gbKO2qzJTev8XJob4dAXzjgnFr3Abq0PcPcgKPuUT0daGqR9X
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(18002099003)(11063799006)(4143699003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RlVrQkNydVp2N2ZzNHVKbnRuZ1VqeUhDQXJzZXg3VWZhS0h3andIczJJOG90?=
 =?utf-8?B?SmRlMFJHSlVqYTFPVDZHS0FpT1B5Q015KzBYSjdtb2JXZUIzY0FNM0dEUXkz?=
 =?utf-8?B?QWtkQnA0VGdJMG1QckFPU3pTUVEydk0zeHdWN2cxTDAySi9mV2tjRHh5MG1l?=
 =?utf-8?B?MUVEeW9lRFFmS200bW9PekVlNUZmRVlrVURYRTNUamlHRG1TdG0rRUc2Qjlz?=
 =?utf-8?B?b3NZdjhKbW03cm9teUpOVkJoMlQxL2xMNU9adzNRTDJUQ1FFM01zdWVrZXkz?=
 =?utf-8?B?T0x2eDhKUGMwTXhSbkZxRVc2SElZbVZnQ3NNendhMVArWXkxRjFJTHdLby9m?=
 =?utf-8?B?dWRmYkRxR0VjUU5TTnpodzBLb1dUZGwxeWQyWnVCSVBRZnFNZ2ovdENFbkM0?=
 =?utf-8?B?QmROVjN2bXUybjVlVWpBRUFaVXRYR0lSVlVFNFFtUG1nV0hDbHVrSVZFUjE4?=
 =?utf-8?B?SmtZcktRSmZRL1hJQngrS21CeVNGRkpFblJrc2YrVVZsM0VWblF6a0dUMHBQ?=
 =?utf-8?B?SlA4ZklxeGhZVk0rb0p1L2xJMDBac25KQUI4OHVvQS93UUZJL2IyMGxjdS9F?=
 =?utf-8?B?ZEVjUm4rL3R3MitqNmZpTGJOVWFOU295dHpONVk3S01naWFrNjdtZWwvTVBZ?=
 =?utf-8?B?a2phK2tSb2Z0NFVCRlJHQk90dGlmSlIwRDZFQUoxMG5ZTzJJaWt4RGhYYTRF?=
 =?utf-8?B?UWpaanVMYVBhbTRVZ21pcUF5dGl0eWFpTFViV1hUZmc5M05ST1pPM3FnTXpW?=
 =?utf-8?B?UjBvUzhoME5DaEY0dHRjZkRxdzloNk1qOUhHSXFPQWN4dWpKeUpCaElMN091?=
 =?utf-8?B?N0RPSHNRd2FIK2ZlMkNERThDdHB3UlU5VkFxaHZFMkJ4eld1SS80ZVVQa3hx?=
 =?utf-8?B?TWdnWUhYMmZkNlZXbUkzZ0pVODhFU0p0ZjE1bDVHZCtuYlh0QkJySWNyUDFN?=
 =?utf-8?B?SnNtR0RDVy9iTndSc1V1SDl6dEtUM3FBUUl2Wi9YcnM1RklYZVR5NFhlL3dz?=
 =?utf-8?B?bUV1WDFYY2NXVjlSaHJwTGZ1ZHc3QjBoSDNDcitmQ3RZOFBzUm9lSlVHL2Ji?=
 =?utf-8?B?N0dzRmJMOVdhR00zWXo2djVaL05FTGlPQ2UxckgvVWhKSGR5Y2hacVRzcTVD?=
 =?utf-8?B?b1ZsN2RVSVpnNGZhZDY5bTk0ajNpZnZDTDNoUlhQa2pIcDVlWFU3UGQvaHJn?=
 =?utf-8?B?azc4Uk1WY0FTRnVJL3NBbnBOVjRwV2RDT1BnOXFacUZsUlNKVFhMY1dSbGhQ?=
 =?utf-8?B?eHhDTm5vVjNwS1dhaU1kSDJHZjB0Z1FGZEdkU0wwRkhUWHlmNGpEQUpFblBO?=
 =?utf-8?B?bE1HaWl0Qzh1MmxBK1JoSmlHUXIyVUdmazJWN2YxRDRwSi9WMDBDbWhFVEc3?=
 =?utf-8?B?aWIyRzhrdyt6NXZmQzB6VVZFbUdMSndZODVtb2ZLaXMwRW5rY2FUVCtIWk5l?=
 =?utf-8?B?YURXTmNMYTZpaFJhVWcvZWNsNis5amtKWUxPZ1djOEN2ZFBUQTI1YnNuamR1?=
 =?utf-8?B?b3hRUHNlN0hyaW9rSkpGaDU1WHZEN0lycXJnWm5xYlBSRW1CSldrRHU4OS85?=
 =?utf-8?B?OGlyWm9wRGtuN0xhQmU0b0ZVRjZsbU5oOTI0MnU1eEVQaks3cjk2akUrdlZl?=
 =?utf-8?B?WmZJQzg0UFEyKzRzQzlqTCtBSUJCY2xvV25hSEJWdWYwdWlONkUvVkhGS3VY?=
 =?utf-8?B?dFZwTWtCRFQ2Q1BUY04zTkIraVN5Y1UwYmpGUmNWZkVPU2dLWmVhd0pBQ0Vr?=
 =?utf-8?B?Vjhjbk5MNjFRSEQxQk42MFM0R0lQV2dmdU9vRkY2ZUgzb0ZkV2RFOXdkZVBy?=
 =?utf-8?B?QTR2ODI1V2c0NWVvYXJabGJEcGQwVitVS003WDVYYWswSnhvNXE3NEs2WEpo?=
 =?utf-8?B?RVJUU2VnYWFPdjJ6aGpiY3R0OWZka1oxTHYrRE1FUUhxQnVSWndyd2dOdU5L?=
 =?utf-8?B?RCtLRFg2QjhlNmFSdUpaYjVwVGtvNmdQVGQ2ZFVHd1hNa1UyZDY3YVdlbDRh?=
 =?utf-8?B?cERCNkY2bDRhRkxUeEVzUVJrUkcxWFNBb0dWRmJ1WmxiNTZsRjI3S3h6Tnd4?=
 =?utf-8?B?bElMUGRqYnRvWlEwMWRDTGlHZ1dZUjlBbnRxM2RvRlo2UDNUL0FLbkNpMlha?=
 =?utf-8?B?MjVFbUxRbTNTNFZIQUhpRE5UZ0ZYQjRoRHQ5VnZmdHAvNWpURmwzTHpqclN5?=
 =?utf-8?B?VVNjSExoVkovZUtFNkZVMDczS2M2Y3ZnK2hJLzdtNmtmQ2VMa2tCRG5BUmFE?=
 =?utf-8?B?RnFVVTBoMkJYRUZHcEZkL25wanpEU28yVXYxZFd1VWlhSGxTQzRkZkptSDl2?=
 =?utf-8?B?TWY4UmlyNmFaRjJKSDkwQUg2VDdTMGM0aVZsMHRxb3ZVR3A4VDNxS2MvUkJN?=
 =?utf-8?Q?3Y231kD4ahWKY4Cc=3D?=
X-Exchange-RoutingPolicyChecked: ft3IYHLp3tObIapR9gGf78QODlgVJkStTk73g5CrIHQyI4OmGKmuijMfhR/hWQ62yvo4AnJcrL1++FiTiMeM5sKjlJPJZB+dyPrZI6yuki/EOFopZFh2f3mTot8FZeZmWxOtJ11rmbhfZdvkEyj9xXPT1aK0/k5wG/uc/BPVJXpYFSOfGewtZ5Hee9+pOH/a+ezc2yqPrAI25gFQF0TNeTPtp6kGfahVoZZKqtkUoWcPatgOm/n8DN8MhxVVhkCElh6GC1pSBiyiZni2adehBf08geuMp7/jYpuZKjzl+6f3iZ0dQxvvfcnBxZqX4UzSFuTR+PFTJ7fJ9rs/yKrpqA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 660992af-c723-4b61-b69f-08debb809d21
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 23:43:40.2387 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +agZ4fE9e/vvBpyDyaefHN1Mb2XHfkx03hI8AjspWKD+sAvJz3X7BdXVunCl2ZN94oPCwsr2O9OKPACz3FgKuHjd18JC/UHVgesUXKYFIps=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7053
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



On 5/26/2026 7:19 AM, Matthew Auld wrote:
> On newer platforms, the GuC has a new engine class which we need to use
> to refer to the dedicated/reserved KMD BCS engine. With that, add the
> plumbing in the GuC backend to support GUC_PAGING_CLASS and
> GUC_CAPTURE_LIST_CLASS_PAGING.
>
> Currently this is still turned off.
>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> ---
>   drivers/gpu/drm/xe/abi/guc_capture_abi.h   |  3 ++-
>   drivers/gpu/drm/xe/abi/guc_scheduler_abi.h |  3 ++-
>   drivers/gpu/drm/xe/xe_guc.c                | 15 +++++++++++++++
>   drivers/gpu/drm/xe/xe_guc.h                |  1 +
>   drivers/gpu/drm/xe/xe_guc_ads.c            | 19 +++++++++++++++++--
>   drivers/gpu/drm/xe/xe_guc_capture.c        |  7 +++++++
>   drivers/gpu/drm/xe/xe_guc_capture.h        |  2 ++
>   7 files changed, 46 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/abi/guc_capture_abi.h b/drivers/gpu/drm/xe/abi/guc_capture_abi.h
> index dd4117553739..ff9c0ae34a28 100644
> --- a/drivers/gpu/drm/xe/abi/guc_capture_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_capture_abi.h
> @@ -32,9 +32,10 @@ enum guc_capture_list_class_type {
>   	GUC_CAPTURE_LIST_CLASS_VIDEOENHANCE = 2,
>   	GUC_CAPTURE_LIST_CLASS_BLITTER = 3,
>   	GUC_CAPTURE_LIST_CLASS_GSC_OTHER = 4,
> +	GUC_CAPTURE_LIST_CLASS_PAGING = 5,
>   };
>   
> -#define GUC_CAPTURE_LIST_CLASS_MAX	(GUC_CAPTURE_LIST_CLASS_GSC_OTHER + 1)
> +#define GUC_CAPTURE_LIST_CLASS_MAX	(GUC_CAPTURE_LIST_CLASS_PAGING + 1)
>   
>   /**
>    * struct guc_mmio_reg - GuC MMIO reg state struct
> diff --git a/drivers/gpu/drm/xe/abi/guc_scheduler_abi.h b/drivers/gpu/drm/xe/abi/guc_scheduler_abi.h
> index 19ec89bf39c5..85bba34277ed 100644
> --- a/drivers/gpu/drm/xe/abi/guc_scheduler_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_scheduler_abi.h
> @@ -21,7 +21,8 @@
>   #define GUC_BLITTER_CLASS		3
>   #define GUC_COMPUTE_CLASS		4
>   #define GUC_GSC_OTHER_CLASS		5
> -#define GUC_LAST_ENGINE_CLASS		GUC_GSC_OTHER_CLASS
> +#define GUC_PAGING_CLASS		6
> +#define GUC_LAST_ENGINE_CLASS		GUC_PAGING_CLASS
>   #define GUC_MAX_ENGINE_CLASSES		16
>   #define GUC_MAX_INSTANCES_PER_CLASS	32
>   
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 4023700ff2a9..2bc9fa5fb393 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -1846,6 +1846,21 @@ bool xe_guc_using_main_gamctrl_queues(struct xe_guc *guc)
>   	return GT_VER(gt) >= 35;
>   }
>   
> +bool xe_guc_has_paging_engine(struct xe_guc *guc)
> +{
> +	/*
> +	 * On newer platforms the GuC now has a dedicated engine class for the
> +	 * special PAGING engine, which is the driver reserved BCS engine used
> +	 * for KMD paging/binding operations. GuC requires KMD to refer to this
> +	 * using the special PAGING engine class. Note that there is no new hw
> +	 * engine here, this is purely a sw view in the GuC itself, which we
> +	 * need to respect.
> +	 */
> +
> +	/* TODO: Have some way to query this from the GuC? */
> +	return false;
> +}
> +
>   #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
>   #include "tests/xe_guc_g2g_test.c"
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
> index 12faf0ba7229..0934927e8254 100644
> --- a/drivers/gpu/drm/xe/xe_guc.h
> +++ b/drivers/gpu/drm/xe/xe_guc.h
> @@ -62,6 +62,7 @@ void xe_guc_stop(struct xe_guc *guc);
>   int xe_guc_start(struct xe_guc *guc);
>   void xe_guc_declare_wedged(struct xe_guc *guc);
>   bool xe_guc_using_main_gamctrl_queues(struct xe_guc *guc);
> +bool xe_guc_has_paging_engine(struct xe_guc *guc);
>   
>   #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
>   int xe_guc_g2g_test_notification(struct xe_guc *guc, u32 *payload, u32 len);
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index c84b98828981..cedab0e1f798 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -261,6 +261,7 @@ static inline enum xe_engine_class guc_class_to_engine_class(u16 guc_class)
>   	case GUC_VIDEOENHANCE_CLASS:
>   		return XE_ENGINE_CLASS_VIDEO_ENHANCE;
>   	case GUC_BLITTER_CLASS:
> +	case GUC_PAGING_CLASS:
>   		return XE_ENGINE_CLASS_COPY;
>   	case GUC_COMPUTE_CLASS:
>   		return XE_ENGINE_CLASS_COMPUTE;
> @@ -489,13 +490,24 @@ static void fill_engine_enable_masks(struct xe_gt *gt,
>   	struct xe_device *xe = gt_to_xe(gt);
>   	u16 guc_class;
>   
> -	for (guc_class = 0; guc_class <= GUC_LAST_ENGINE_CLASS; ++guc_class)
> +	for (guc_class = 0; guc_class <= GUC_LAST_ENGINE_CLASS; ++guc_class) {
> +		u32 mask = engine_enable_mask(gt, guc_class);
> +
>   		info_map_write(xe, info_map, engine_enabled_masks[guc_class],
> -			       engine_enable_mask(gt, guc_class));
> +			       mask);
> +
> +		/* We expect at most one paging engine per GuC instance, for now */
> +		if (guc_class == GUC_PAGING_CLASS)
> +			xe_gt_assert(gt, !mask || is_power_of_2(mask));

Maybe worth moving this assert inside engine_enable_mask()? not a blocker

> +	}
>   }
>   
>   u16 xe_hwe_to_guc_class(struct xe_hw_engine *hwe)
>   {
> +	if (xe_guc_has_paging_engine(&hwe->gt->uc.guc) &&
> +	    xe_gt_is_usm_hwe(hwe->gt, hwe))
> +		return GUC_PAGING_CLASS;
> +
>   	switch (hwe->class) {
>   	case XE_ENGINE_CLASS_RENDER:
>   		return GUC_RENDER_CLASS;
> @@ -615,6 +627,9 @@ static u32 guc_get_capture_engine_mask(struct xe_gt *gt, struct iosys_map *info_
>   	case GUC_CAPTURE_LIST_CLASS_GSC_OTHER:
>   		mask = info_map_read(xe, info_map, engine_enabled_masks[GUC_GSC_OTHER_CLASS]);
>   		break;
> +	case GUC_CAPTURE_LIST_CLASS_PAGING:
> +		mask = info_map_read(xe, info_map, engine_enabled_masks[GUC_PAGING_CLASS]);
> +		break;
>   	default:
>   		mask = 0;
>   	}
> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
> index 50c6b9466c14..c13b23c45aac 100644
> --- a/drivers/gpu/drm/xe/xe_guc_capture.c
> +++ b/drivers/gpu/drm/xe/xe_guc_capture.c
> @@ -265,6 +265,8 @@ static const struct __guc_mmio_reg_descr_group xe3p_lists[] = {
>   	MAKE_REGLIST(xe_blt_inst_regs, PF, ENGINE_INSTANCE, GUC_CAPTURE_LIST_CLASS_BLITTER),
>   	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS, GUC_CAPTURE_LIST_CLASS_GSC_OTHER),
>   	MAKE_REGLIST(xe_lp_gsc_inst_regs, PF, ENGINE_INSTANCE, GUC_CAPTURE_LIST_CLASS_GSC_OTHER),
> +	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS, GUC_CAPTURE_LIST_CLASS_PAGING),
> +	MAKE_REGLIST(xe_blt_inst_regs, PF, ENGINE_INSTANCE, GUC_CAPTURE_LIST_CLASS_PAGING),
>   	{}

NVL-S seems to use xe_hpg_lists, so need to modify that array as well.

Daniele

>   };
>   static const char * const capture_list_type_names[] = {
> @@ -279,6 +281,7 @@ static const char * const capture_engine_class_names[] = {
>   	"VideoEnhance",
>   	"Blitter",
>   	"GSC-Other",
> +	"Paging",
>   };
>   
>   struct __guc_capture_ads_cache {
> @@ -766,6 +769,10 @@ size_t xe_guc_capture_ads_input_worst_size(struct xe_guc *guc)
>   	total_size = PAGE_SIZE;	/* Pad a page in front for empty lists */
>   	for (i = 0; i < GUC_CAPTURE_LIST_INDEX_MAX; i++) {
>   		for (j = 0; j < GUC_CAPTURE_LIST_CLASS_MAX; j++) {
> +			if (!xe_guc_has_paging_engine(guc) &&
> +			    j == GUC_CAPTURE_LIST_CLASS_PAGING)
> +				continue;
> +
>   			if (xe_guc_capture_getlistsize(guc, i,
>   						       GUC_STATE_CAPTURE_TYPE_ENGINE_CLASS,
>   						       j, &class_size) < 0)
> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.h b/drivers/gpu/drm/xe/xe_guc_capture.h
> index eb954f4d1ffd..fcd4f1298536 100644
> --- a/drivers/gpu/drm/xe/xe_guc_capture.h
> +++ b/drivers/gpu/drm/xe/xe_guc_capture.h
> @@ -28,6 +28,8 @@ static inline enum guc_capture_list_class_type xe_guc_class_to_capture_class(u16
>   	case GUC_VIDEOENHANCE_CLASS:
>   	case GUC_BLITTER_CLASS:
>   		return class;
> +	case GUC_PAGING_CLASS:
> +		return GUC_CAPTURE_LIST_CLASS_PAGING;
>   	default:
>   		XE_WARN_ON(class);
>   		return GUC_CAPTURE_LIST_CLASS_MAX;

