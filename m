Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1045EC4345F
	for <intel-xe@archiver.kernel.org>; Mon, 29 Apr 2024 13:12:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B213010FAC9;
	Mon, 29 Apr 2024 13:12:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fJWYKDDh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2A0410F1E5
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Apr 2024 13:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714396342; x=1745932342;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=8sHaMNTOypYOBjHTW3J3G6FNmAdoaDfMDNIYgPwA8X0=;
 b=fJWYKDDhDW0lZ+X8N8YglCk3yLRHzBhT7lEQeVxEnudVw5uu3dYmi4PC
 fzQ2U0LEger6/i2fRz1NuyEU2Y82hleVjSSXnQp8Y86/B7+VFt2cfVGCu
 UsxQITWJnwzEqWlHaY+LCYSqnpaT/hdYLBxKA5WnSnDr642bUZ95IHBpL
 w8N42WgP8Ev7uyl1hIuOgYK7T6ztu/nLTcrDfuXzsxZlHkP7gsG/1Q19P
 XduZHhKJsDoWUAkLuX9KmkqtnLSo4HlpZCu5P+mgCGsdW7RRtaWoBTDqI
 NR1umyt77FxDV8GXbvmlYc0wivWH/5EN2Fr1E1sEBU3pYg90AorUh251e Q==;
X-CSE-ConnectionGUID: ZDW/zxnhSu+vE3SsIccc2g==
X-CSE-MsgGUID: ZB5eA8N6SPCwqS8HF7zMbw==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="21461640"
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; d="scan'208";a="21461640"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2024 06:12:21 -0700
X-CSE-ConnectionGUID: TicuxkWKRbCvW1CdTBLM6A==
X-CSE-MsgGUID: vaUQSFzPQUWQnc94zG9/AA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; d="scan'208";a="26091578"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Apr 2024 06:12:21 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 29 Apr 2024 06:12:20 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 29 Apr 2024 06:12:20 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 29 Apr 2024 06:12:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eug6WRbqOAdPt3jnlrB59gmZfFKJfB/v3YoYPYAcnm+Eo7rEvB47Jm6QAfktWExNTiVk18yNM9NP1vJ5Bkk0ifyq5VHWYie5rLd6wGDJSzf7KSSDkI+p0cyvkLpZgCxtmenhq3XFCtK77yPTcCk/h2qNYQIbpQ1QXKE4q3ofDNzM+LSE6bDUM0Q3dJzac1eJFEaoMAOh3ecsS2f/zUsoM+R4eVxM3soKAz1In2WayhQ9eyP/YAYb1NR/+IbKK5YDL/rWGeb02MgQvtHLwjGA3KHgsNHsq/pRsrWiGqxIuVOkjHsW0OU3XUvlANDc6EradE4AT1i5pzQmkQ6W4y/A0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WHI83PAh6K2fs1Vq1MDDhqdAqH2IUXay30BKISKuRqk=;
 b=FcHxsHiBlnsWrK5SHt1p6sggU++sYIzOlxNxuP69GLpRWzWOPyJsB8s9Hp1DLx58fJAkPQoOpVw9+xS4g7n+MxzETGEJdAowhCq31S41GO6+GcuR8+skVR8StGMi5nedhwDv46ZNmoKG83Ig7ecvifje/7XDW4KpwZyYmMd6ns48jd6Kk5r/83bdsr6gOaYBJDO6WEwk1h+MuxrMs6ESxKaR78kRLL1gqNHo43ON7nYjDRwzz+T0/93kK2Hgccc7KJ4NK5YNO6hA2HnYXRKHjaKYSeYj2fxAHeIHTcgjWe+ZRSpYhMdTmJSbqBc3FRjoAOqB7lEbv5kwyk0NxLGgdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW3PR11MB4585.namprd11.prod.outlook.com (2603:10b6:303:52::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Mon, 29 Apr
 2024 13:12:17 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9365:d8e6:4e8d:8711]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9365:d8e6:4e8d:8711%6]) with mapi id 15.20.7519.031; Mon, 29 Apr 2024
 13:12:16 +0000
Date: Mon, 29 Apr 2024 08:12:14 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Chauhan, Shekhar" <shekhar.chauhan@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Bommu Krishnaiah
 <krishnaiah.bommu@intel.com>, Tejas Upadhyay <tejas.upadhyay@intel.com>,
 "Matt Roper" <matthew.d.roper@intel.com>
Subject: Re: [PATCH] drm/xe: Merge 16021540221 and 18034896535 WAs
Message-ID: <a3c4pszai2ysc74yod3yj7ulridwqrztotyu6lrtm3n2f3ghgu@y6lh66mlz2xe>
References: <20240427135339.3485559-1-lucas.demarchi@intel.com>
 <9aa151c5-de86-4ac3-a874-894f2f780c95@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <9aa151c5-de86-4ac3-a874-894f2f780c95@intel.com>
X-ClientProxiedBy: BY5PR03CA0020.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::30) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW3PR11MB4585:EE_
X-MS-Office365-Filtering-Correlation-Id: ba268d52-3e31-4879-8ef3-08dc684dfe2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?c/kw0FlstjroL0Ag7uGbXYVqojwZ/WYO1uzVd7Ue5A7LapQ1TlPkZ4hhBKQ+?=
 =?us-ascii?Q?YCEnvQiB4ZMMqLNp/8XBS4+QJyAh4yHfADqTiKTvmqEtNyVbHJgUKmSvO4gt?=
 =?us-ascii?Q?WQuFk9vJV6n2hPSJ/e1HVQuc4HQFk1C3YYlx8mip0k+vlwNy57jc4xTAcg4z?=
 =?us-ascii?Q?pd3+AAH30O7OQbKo/jNkcJREMOzvumMnmRukMsrnqYqPpU4vkPKfODfzF+Sf?=
 =?us-ascii?Q?rPkiFQIvO75Udbe9HNcVMaTwQPw1ZqjzTCEQZZpDffzZxTbVvbqwHEqT7PeP?=
 =?us-ascii?Q?popnxBUfBtTmiJrzi45hl1XAIq5fgvLNVTIYFa0uUJeaTrYUMLSqtbwiMeWy?=
 =?us-ascii?Q?iimqTr809h9OWH9YLNkpeJTH7uaivpC4q4m0chikHXQO2cB+M0/PjoxP5ELo?=
 =?us-ascii?Q?UlJS0GsVVMOr6j3D6adPZzxwjftB3jEhPMHNdFYkTmvUa/h04cRT5SiHacxi?=
 =?us-ascii?Q?OdbqZZYPuUEVpXdkTRW1nnYbaE1GIeZufLwU96YTGYdQ/Ih1kEq5sKBhoQFY?=
 =?us-ascii?Q?FE6VrxgvK4a43yKjJRvZIHbf9s+VpIpVf6a4hunyqFtsPwRoYjYdANBkxyYf?=
 =?us-ascii?Q?q0r4ksLJk3/0RRbzWa4EhHCl8mRuRjXzk1VNY7zAD+sNI8b4M26oFy2UwxsG?=
 =?us-ascii?Q?Ja2kITXnsvH17nPZ7kRxAiziVb7ox+EYiSHhSX6WCz+aev9z17cJ2x3pL8pN?=
 =?us-ascii?Q?3J5SJ68+mQLV4yB+2IVKE6PX7ef9pTR+/lQNI7Rz4a7GFtlVj0g13FrPFqL0?=
 =?us-ascii?Q?GrpuPVWe49wpTEbr7dfgn/KV6/kYpaLUHPDcPZHfeamIWxMd4PfBWVRdTSpw?=
 =?us-ascii?Q?XQ9yUydLwW7vU2ari8DakKRp642uhhpejfEB4WHqflqLmeW5QDodhHEStCkt?=
 =?us-ascii?Q?4znXud5XEo4foxINcR6W/3ZJwj55SU7/BkmFONaW4MO2ufOllYG8QIa826B7?=
 =?us-ascii?Q?XQUlqe0A4DpeB12AVFupso2+YwLOGKRqNUZJVIbiwsP+Gp8NKNGFL6qilSlp?=
 =?us-ascii?Q?1LBU0q1N0YdVXeWbo9YnY7QzF2x4LuJTAVZjGx8e9EeNEWisNKGPJ8zosLYY?=
 =?us-ascii?Q?XjC6YmhmOSJIpLS01K5AOpkLWxNMR9zvV+o80pdkDE6jcIW4694ETotVFwVQ?=
 =?us-ascii?Q?2oBfnyTVMrKL5R/MvF7SVpoQefJr+LSlmC1YgUIiQEufWBrQBSAlC2ppdPCp?=
 =?us-ascii?Q?6EjoFg/HbjH4FN1u9XFHXSxGbhGsL9RodOUE0OQFamD1uTF72l1ua5FpAVsX?=
 =?us-ascii?Q?YFVqIZmBQWkJ1RMDh1kqpQbVraBQKvlVjUTQZBAcKA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZJBDKAomFmt/8mjtd3qBC2ObiHZLgVvCPjqT2wdEh+9aiVDaLMMKO0nHkkyH?=
 =?us-ascii?Q?RZRa394fKgimZmuJAQ08z+rW2ZgYNuMgIc0DBMp1/gIXgr6UpJ1OWbguWwyW?=
 =?us-ascii?Q?t/FzpJeOty5SkJEc2+upg0p6/jxMJ5m90JYRZRNTb+HHKtXaYebTEjFrTMLn?=
 =?us-ascii?Q?m4rIBhIF4H5IGAHjtMFU1cfiDyUjpUxwRJyNQiSuD7uR2GSMjAq/OifERbL4?=
 =?us-ascii?Q?cHOCDgxRAWkEiQzLEieR4QoQZvk024oAu83V8rLqSRyzpURfO3nycqE9d2gv?=
 =?us-ascii?Q?gJLCRiLdJVIbEWRZZ0S/VdS5GqiSaxwWuUZb04QnKWGozpCsJzdTQa2m6JM9?=
 =?us-ascii?Q?SugOSLB4noUkEke47a3adxJPz/co64zHOmXRvgy51Sp11G0bC60cRZu79U97?=
 =?us-ascii?Q?6CNjXBDzOjicVjFhGx7zqyTJBod7Y5+IAksBrhiZtNkTrhEw8OgZeLe4qdVa?=
 =?us-ascii?Q?a49s4Gxcix6p+pd6uCaY9G4yR2t6EDxPUE3/hNbM0wB/0SVuDhgDvJxqx80n?=
 =?us-ascii?Q?LkVko71ALxtW6X8XATD/6fqYJ45xecb6WWHHLRQAE6aCnd2HV9cWAIQK584h?=
 =?us-ascii?Q?FB0NhwxXTluj+/Z60LIe9vvTPMBvQq9J0Q4f90rGsqgoaj5QxoVQ7FbT3Zdp?=
 =?us-ascii?Q?TLAw/W7y7hhcXwD8isiirRwltcC7dAwun82u6LT3KhJcBWmI+uzTYfhZrk+H?=
 =?us-ascii?Q?v/LKBToCIjnzKUrzw7i+g5/OVU9BeXOYYGANIZiQKYW2LlvLgCudN/bsTH8B?=
 =?us-ascii?Q?CCdxVHAC18iXgyxgWC/1pneB/esyLfblNzRdxY1euXOEnwe/I6r2aGeRsxel?=
 =?us-ascii?Q?yS3E6nHrkPvxOf2dcNfKo4WXLEMtogQAXJA2+k+EiLjLlTsdyjZVIBjAJ1IJ?=
 =?us-ascii?Q?Hp0HG3L80QcTB65cw28C4EgTbvYDrA5MwHZP9hhkoOosiSSNjVJt3D8SAIs7?=
 =?us-ascii?Q?aU6t17vjjNwerFd3/LCJY+JFNUjXjqX7hLsJjOwfgP+vPPbaRtmEKkr4jq0M?=
 =?us-ascii?Q?+3mBF83k1MXpUuFGpiNst4fGZuNC54S7SGMXUIc9CrIZN8jBPJ4fGC/sBD0A?=
 =?us-ascii?Q?zfs+PDeL+h/T8YxqoKRcN9VEl7QLY9IAQN4dtzBwgtHakyrIwFljQ0M0eG2r?=
 =?us-ascii?Q?s4sthBaSj0AgwgUO75uWGaaaiWWTvxInRvi+3XjSsxbvmHvbgZDtX8Itamtr?=
 =?us-ascii?Q?bB8qZK2B8VdGOmcNX09VzV1IGRCn1c1yrnEOHV5LEWpHOtZUmEsXzygtEFo8?=
 =?us-ascii?Q?J15LlU4LfbxSNGW/DlYQvCsAnyZ38epmrT+vhXkhm6i3lMc9vBx53wEjXj0j?=
 =?us-ascii?Q?dET3p6Ws1uoUhSZaXF41GU9q5eqLGCf0Mp5dgZPP15Iot3xh9NadOtDV/JLW?=
 =?us-ascii?Q?RAJJ5b2yasT9u8NGeYwD98FFA7xHqDQQCKMO+WynjTC8atOKf0st+Iw9uyjY?=
 =?us-ascii?Q?l3goB03Rkpi9ZsjOvS7JdKyqIShn73Q/NHI77+RzOdNmALgM516+bc2Haeb5?=
 =?us-ascii?Q?0ENudGi0kh0HQtZXtSiOL/j9DcQwgH6MBXtg3KLH+Lt1UXnOquuIOUJeqoy6?=
 =?us-ascii?Q?+JuI4hZQIw/ck6f1VtVZ6X7JOzya+wDY04n4p3jl34ojIpeOgmslP+Nbo9BP?=
 =?us-ascii?Q?Ug=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ba268d52-3e31-4879-8ef3-08dc684dfe2c
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2024 13:12:16.8358 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zpna7VZd19nokwaocb6N4QsV1HOHxca9wtyOfx+7EwL12bvCDsn/PKVV9ydcEahJ8t7IiV9xFUYnBZEL3WPW0nO2hkoLrgAZzofCXNJDqCw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4585
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

On Mon, Apr 29, 2024 at 09:14:30AM GMT, Chauhan, Shekhar wrote:
>
>On 4/27/2024 19:23, Lucas De Marchi wrote:
>>In order to detect duplicate implementations for the same workaround,
>>early in the implementation of RTP it was decided to error out even if
>>the values set are exactly the same. With the introduction of 18034896535
>>in commit 74671d23ca18 ("drm/xe/xe2: Add workaround 18034896535"), LNL
>>stepping with graphics stepping A1 now gives the following error on
>>module load:
>>
>>	xe 0000:00:02.0: [drm] *ERROR* GT0: [GT OTHER] \
>>	discarding save-restore reg e48c (clear: 00000200, set: 00000200,\
>>	masked: yes, mcr: yes): ret=-22
>>
>>RTP may be improved in the future, but for now simply join the entries
>>like done with e.g. "1607297627, 1607030317, 1607186500".
>>
>>Fixes: 74671d23ca18 ("drm/xe/xe2: Add workaround 18034896535")
>>Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
>>Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
>>Cc: Matt Roper <matthew.d.roper@intel.com>
>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>---
>>  drivers/gpu/drm/xe/xe_wa.c | 7 +------
>>  1 file changed, 1 insertion(+), 6 deletions(-)
>>
>>diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
>>index 9d9b7fa7a8f0..db7c7c7875c5 100644
>>--- a/drivers/gpu/drm/xe/xe_wa.c
>>+++ b/drivers/gpu/drm/xe/xe_wa.c
>>@@ -449,12 +449,7 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>>  	  XE_RTP_RULES(GRAPHICS_VERSION(2004), FUNC(xe_rtp_match_first_render_or_compute)),
>>  	  XE_RTP_ACTIONS(SET(ROW_CHICKEN3, XE2_EUPEND_CHK_FLUSH_DIS))
>>  	},
>>-	{ XE_RTP_NAME("16021540221"),
>>-	  XE_RTP_RULES(GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0),
>>-		       FUNC(xe_rtp_match_first_render_or_compute)),
>>-	  XE_RTP_ACTIONS(SET(ROW_CHICKEN4, DISABLE_TDL_PUSH))
>>-	},
>>-	{ XE_RTP_NAME("18034896535"),
>>+	{ XE_RTP_NAME("18034896535, 16021540221"), /* 16021540221: GRAPHICS_STEP(A0, B0) */
>>  	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2004),
>
>w/a 16021540221 is applicable to only Steppings A0 to B0 (B0 not 
>inclusive). With your change, I think the w/a will be applied to all 
>the steppings. Wouldn't this be incorrect? Please provide some 
>guidance.

both 18034896535 and 16021540221 have the same action:

	SET(ROW_CHICKEN4, DISABLE_TDL_PUSH)

In other words, 18034896535 applies to a superset of platforms
16021540221 applies to. So even when we remove support for steppings A*,
we want to keep the WA (possibly removing the comment about 16021540221
and renaming it).

Lucas De Marchi

>
>>  		       FUNC(xe_rtp_match_first_render_or_compute)),
>>  	  XE_RTP_ACTIONS(SET(ROW_CHICKEN4, DISABLE_TDL_PUSH))
>
>-- 
>-shekhar
>
