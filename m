Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09517C54F30
	for <intel-xe@archiver.kernel.org>; Tue, 27 May 2025 19:05:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB3CD10E00C;
	Tue, 27 May 2025 19:05:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nBcE3T39";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C538010E00C
 for <intel-xe@lists.freedesktop.org>; Tue, 27 May 2025 19:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748372709; x=1779908709;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=oL/MUysEhG8SNDRwnkYcNKzCSFUJpTW5EfFlah+HY+0=;
 b=nBcE3T39+Rp4CaakjoiJB8Pze8q7CFrDVwi6RDP+idzaMu41zSIgJfq5
 k2SWIaob1XX1hV/y9oR+ogj1fLSpQZGRYxttNEmJiWPnv2/W+6L3jLRVW
 Z7N9dEOxTGU2GJbZMbR1/ZjUbddVZRHYr/huI7rOkR0n1zcwJkSaxpBlR
 5khAFZpyPbDhMCAj0eCj+X/jq6IFByXpt3xCg6jvgCPNuvhu5s6h8hKZw
 H6xeZwRV1qmMEzG81vMOMvoUTxr9ai9L1BPWscC4FKzaDVrR5JzHyCQdT
 D3+bb6+T8WlQMAgRYqM8P5mzsc+hpbIc27gLTrDOxdzh65oJPsQtI+AG/ g==;
X-CSE-ConnectionGUID: XZUjG/bsQMOcXh7vL7ltlw==
X-CSE-MsgGUID: x05cQXrkSvegZSTYtsHdlg==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="61432782"
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; d="scan'208";a="61432782"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 12:05:09 -0700
X-CSE-ConnectionGUID: lZxOkEpqTHyj/vYAEMT8IQ==
X-CSE-MsgGUID: ZqDJc6BQTUiudr3+vrCydg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; d="scan'208";a="180151003"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 12:05:09 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 27 May 2025 12:05:08 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 27 May 2025 12:05:08 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.45)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 27 May 2025 12:05:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WeytBDGdP8zWUXZS+/NeuP2YRLcQVx6LOeIlsOGgttiXLzSweIEeWpDsjqWGSN9zUwr/J2ttSE1FWMjf68nJKN1lT2wjMRkgMpru17H+dP2os0424vMRUkvNuIswjoc70BZM/ft9DNltRlhdXL2kLNJuEqzLpbme5nAUbcFtsK106sgtEkCnGwR3ufwhIW1fDnSEzxo0ojW4uLrOs051bC3ZfbzRJTeJM5odgGI3LjmAvapsvOE20xHhmaJXSP6EtZseGregLMh0GgHtWqHzWGU92yAHwqyN+Wa/DUFy8leyDHib7xApAR45zYoKjoauhB684SOXo3GT8zDJpR8EjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rgq61BKw5Pmt1Kle3YpRly9U4VeV/bRWto0vGA6fLSo=;
 b=RVzi1dTB8fOBpOB8BSrduwpumLY3ESMHauds71gWaEgBGTYWRqiVJJAgkisdqLhqtznjmsNhCtfzGXOj6Nl6BxDlNCU7ln/h/KQ3ijprh2baAl4EY33eoVdouq4AJLbSgbyR8sus2VxfSfMlohp3WLfVeNMd4Q9E2oXn8Ub+ZD9+8WFjhRcv1rE1HNUC6VOx3glbTAW8CDnQCAGOdUyii/79UGmqwfbgHzGnefXDu2oPzt/h+dj8I6x2Mk40Smk9ZRM3HmwWnSPTyiNNzpimzx5p+atQO0MNcL1OLA5KLryjXZt5gbER+gBzqyzqO/j/9u+D4dNZibdyXF8qaGYSvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY8PR11MB7876.namprd11.prod.outlook.com (2603:10b6:930:7d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Tue, 27 May
 2025 19:05:05 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8769.025; Tue, 27 May 2025
 19:05:05 +0000
Date: Tue, 27 May 2025 14:05:02 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 <intel-xe@lists.freedesktop.org>, <kernel-dev@igalia.com>
Subject: Re: [PATCH 3/3] drm/xe/xelp: Add Wa_18022495364
Message-ID: <ilqz74jidondfilqyo5csckrumcahmpqem6nxu6k3rrwuzrinj@kedmnvovvcbu>
References: <20250516074412.46863-1-tvrtko.ursulin@igalia.com>
 <20250516074412.46863-4-tvrtko.ursulin@igalia.com>
 <20250516190650.GM5080@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250516190650.GM5080@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: SJ0P220CA0008.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::17) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CY8PR11MB7876:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a66cb9f-0231-49ee-e585-08dd9d5163d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7053199007|27256017; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9qFpLrgfK4vKAgLYyUnwSb2SleeyS9/1KeHHkk/HDWnHFwTT5YLQOffhsaK5?=
 =?us-ascii?Q?+9V96FOEEb0/YVofkkfcUOgg9GfGg6tFFYjt+q+1CMykEtQfVP2EQ/YiOb78?=
 =?us-ascii?Q?GG8j1YOBl/LqwEdlj0wA2vJKgzqGwEe9WP4cst43FYdYnSaCEoeEuw38gFJR?=
 =?us-ascii?Q?WhmkR/0Y+OXABowO+lVztnkcH6xqaWqCrp/Hc8iLYwiQN1gOH4puJL715Mf/?=
 =?us-ascii?Q?PpsyscR7Plr8xKfbFhE7rcNSmxCGE/7ukndNV89PotNmso1roeD0Rfa1lkbt?=
 =?us-ascii?Q?Z7xps/tGLP3ZP29fil0c5nGwaOQ6DY4WIc1B0+wRPDhyzUQbt7Zzs2YA/C9Z?=
 =?us-ascii?Q?jiJSyoBwNRwjvrSCwpa83Bz1lM5e0Wy0VTOjh7I7QHgl/J311qCYiUd5307H?=
 =?us-ascii?Q?MyrZeAZWAnBcUOBXCq/J3yKnsSow63QpbHB1oH3XtbfR3WoBNxlVrYNfl4Xp?=
 =?us-ascii?Q?T9vbgv9c+m/DILbWLgwJa4rx3ktbnPz3UcgVPnNXST5FgjIyis7dnNmd6CFM?=
 =?us-ascii?Q?4hVLJAK3j8jFluT4K35hVFJVsQxY3UaJV+a9mCps/JfhcYBQ0WoMUNboQvhB?=
 =?us-ascii?Q?GwwqKKL+PXQfPj5ErteRR7v14sZP5ogv9XAyEC4byJbsyCbAVyVQACjwofy/?=
 =?us-ascii?Q?Xwx8D43W9AjDMadPQOzvXkUaFY6qp/BLEWRqQZ0s4u6Q9OwxrHKAdL6g6zp8?=
 =?us-ascii?Q?GOhoXp7KPAMsS+Jou293ouSGCiJkOcGwyP5yx+t2lPYZJKmwTPF2ZVAgoyhh?=
 =?us-ascii?Q?dH7fHS9tOR4h/joM1Z/q/7l0xJ4YM67RcMWjBT252zbyU+nBctFd4HHyf0oW?=
 =?us-ascii?Q?KfgWb0WyoUIQIXgdUvA7zJRw56NFOC8wAYC7oirFxBwgIqBCajRjqc2ErECV?=
 =?us-ascii?Q?YsaNgvp8niOLR/iDjbmh2zv7vZ9zgiFlwoUzxlFkaSJDXuesJR/0bWhla7Zj?=
 =?us-ascii?Q?UrrcLA5ESOu0+O2zkCGLTYyt8Efulb9zp08BRtFrK5U0hnaW3VwYpltjXhe3?=
 =?us-ascii?Q?u5dmszyUKLOk3LmwCOzv1BA660eRWEUqN4N4AdT51O9js+mdWTAZfXi3j4yg?=
 =?us-ascii?Q?YE2PcKi4nS7ZZuC0sHjlrUK1Stgy2akVJqZH9h74hHoj0M7hQMwJluwk2kqm?=
 =?us-ascii?Q?WyaElxTsuYOop/5o64EWea2YKr60LIdOsIK6DpUiTSDhGws6XZYZcXtHaZXf?=
 =?us-ascii?Q?5bJESvV14KG8R7t0Z4+MxB/7fZg0cxi/6vG5zZQ6h3EncEJ92HC+MRUSLmYE?=
 =?us-ascii?Q?Q4g8Df1wel4FcKcvLqJ3u/xcpVw2Mibp0ezwUcgldi5tEny9TfjaW8b7CsJu?=
 =?us-ascii?Q?655IK8Xe+DWuCjbwG4ACf7Qk6rKtf6BPFFMWlsdmwYjnoh1vQx0TiWfpe7Gg?=
 =?us-ascii?Q?AXi7BxAsTVvITMVyYWE44hJ9bQPqiGyYU3Ow5gj9KAl0olYBBt082o5RrG4K?=
 =?us-ascii?Q?9PN6Pm9aDTOq3hgLSxLyOgR+ktXfSvWLU78DUGLRW73zr4h2NKVzGw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(27256017); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LqzfDDyinMalAImYBDrhvi3gmfWrfIMu/ho88JFsx5qoxuAoJxQ2aSRe9gLc?=
 =?us-ascii?Q?cdDuSoQn0Pdj/OI320tA0LcNA18Cn60aTBrZ1h3p435zoNz/l5AV6HVnLiqe?=
 =?us-ascii?Q?MVvl4Q59ajTZaUlAg7D0g4x8a2SbFL7VdZFCVJkXY5FGr6Z9iff/2bIl7ETN?=
 =?us-ascii?Q?yplD3G+WJan9AZRLsrQ4YtnCF/0Wrz0t+ozY6e/t4umfoTO3rNVzg/9e+gmv?=
 =?us-ascii?Q?9YLEI6D3k0d+k6Bj3It1dcackGGIojISKLMWM5nCd8r+EUAQygmnXNVhks6l?=
 =?us-ascii?Q?jAQ32eC/32H7LDOUUL9GtS9oNgzKigTiwMMHDi8EKvAeGx4H0QzDIg6nXFkW?=
 =?us-ascii?Q?uBabuGbXve81vxa8N6rz1f3oBNyz+FLdzZj1jPqDEMEMAftnwTIGYFqySP5X?=
 =?us-ascii?Q?1KGhEnSvlYfjnbnaAN9dF1to51/nnCsiiJytJtru68++wdgQePB3AxfRgZX1?=
 =?us-ascii?Q?Hf+JWnBvOq/8FtwH3BMoP+NApcB0PiUDOeYLZ2hZo1P1yFbYoCF9qXFsiZ/X?=
 =?us-ascii?Q?qrN4u2bJSMgpPoA79zwxIJAtEE+igK0gQxo93vqPkijdVgm8iyiyHw6ZruV7?=
 =?us-ascii?Q?S1X7WKXJP2Lwz5Mp4tUVkSQfRauF90dNXxmvlEwcRE9t/c7Nc0cfpc48Hlf1?=
 =?us-ascii?Q?6xfMZxrLxc2zLQGtk3TfxAFm298rdkbEm7EsJb6cVBMgzPgxfXsn0GdgkjM2?=
 =?us-ascii?Q?gugQ5x4p7Xu0RAztXHTPRQhlhH8FV4QI5oOjCCu5PZ4vEe2wh4GheLXqEoS8?=
 =?us-ascii?Q?G2/HPKR4QLfhrDpJaO8L/CchZnHWD+uXTKMg7Y5XLSfjN/ZjMltSdgmZhIbK?=
 =?us-ascii?Q?UcCLt5SC9+/glX/mtKcGu4s+y8C4WJ9QJ8+Of/JzXN9POy9FfTrhr64y34bk?=
 =?us-ascii?Q?oGYU2sVl2SfPR/7l8SPzhXOtMgzFMYOigI7Ch6t4+U13wtxTvSSdcSa6vj5c?=
 =?us-ascii?Q?lvf84BMwXw0bb02KJ574QM6HlhL6JH+C55jIMew5Za9gYgtpgMcCyKEYjG7x?=
 =?us-ascii?Q?4Egm444diCundwZtYsYi7LhxAatAvn8vxeZfw9Owjbzw2OSXQAuHaMRlUrnN?=
 =?us-ascii?Q?IlPd5aF9/41TyoJoA5RhYIs4ieTn/nX9LLlO9EtAMsqEOFRWBkFXzZjumaYW?=
 =?us-ascii?Q?0Kpb16D9XdtIPfOvBLG/tTJxA7kNKbirFZoEjJNFgOUAhOiIZDsxTq3Hodbe?=
 =?us-ascii?Q?HZPaxOt0xcfI9GCNCX7weBf2pXteQRNaVdf6ZIC7kKw4bx+zTpLbOgiAWSCy?=
 =?us-ascii?Q?k40Za6Nyq8HGsy86GxaN8sdErch8zdrA8PQtjprhMZa83RSBlfdqNRo/eRWn?=
 =?us-ascii?Q?o/0FpzhAzD+Z7Jn1FIhwFXhS/JfffU+y4YmHVPaGAwdKUrmMAMo0kLDvm7dH?=
 =?us-ascii?Q?pyDbK8OFUNWrWx6zVBRX6WltZFVoYSE75qWxsaI87rdFHxR/D+kib+GLGXnO?=
 =?us-ascii?Q?kV5ydQJ+X9U7rfblsV9pTTyVX4k/raw3ys8z1pY5pi1W4VMKAEEi7t0gslNW?=
 =?us-ascii?Q?OMpHhapGicIGEQICOEB9p0lSRdY8vCloUhW/5JrSqBxYwdvZ2FTnbQWnUiSt?=
 =?us-ascii?Q?YyB5sm9jy5tNjVrDlIbGj4NxvCET3f0LfvGQV6elGY2XqpjeBCXv207ukfB3?=
 =?us-ascii?Q?3w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a66cb9f-0231-49ee-e585-08dd9d5163d0
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 19:05:05.1583 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H5BVKeLPgSL1n5XJY2HMUtPg9LeOb+wDQqlAZhVpfypTf5hSJDAA+vwu5J/oJbtg6/4H7LpKIJTo4sHZGXFM9GkYVkoShCqFlUofHMeIgQ4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7876
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

On Fri, May 16, 2025 at 12:06:50PM -0700, Matt Roper wrote:
>On Fri, May 16, 2025 at 08:44:12AM +0100, Tvrtko Ursulin wrote:
>> Add Wa_18022495364 as a context indirect workaround.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> ---
>>  drivers/gpu/drm/xe/regs/xe_engine_regs.h |  3 +++
>>  drivers/gpu/drm/xe/xe_lrc.c              | 12 ++++++++++++
>>  drivers/gpu/drm/xe/xe_wa_oob.rules       |  1 +
>>  3 files changed, 16 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>> index d1d2592e010d..94d778d5425d 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>> @@ -112,6 +112,9 @@
>>  #define   PPHWSP_CSB_AND_TIMESTAMP_REPORT_DIS	REG_BIT(14)
>>  #define   CS_PRIORITY_MEM_READ			REG_BIT(7)
>>
>> +#define CS_DEBUG_MODE2(base)			XE_REG((base) + 0xd8, XE_REG_OPTION_MASKED)
>> +#define   INSTRUCTION_STATE_CACHE_INVALIDATE	REG_BIT(6)
>> +
>>  #define FF_SLICE_CS_CHICKEN1(base)		XE_REG((base) + 0xe0, XE_REG_OPTION_MASKED)
>>  #define   FFSC_PERCTX_PREEMPT_CTRL		REG_BIT(14)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>> index 6022068ce6b6..9a07fc6d78ab 100644
>> --- a/drivers/gpu/drm/xe/xe_lrc.c
>> +++ b/drivers/gpu/drm/xe/xe_lrc.c
>> @@ -1028,6 +1028,15 @@ xelp_emit_cmd_buf_wa(struct xe_lrc *lrc, u32 *cmd)
>>  	return cmd;
>>  }
>>
>> +static u32 *xelp_invalidate_state_cache(u32 *cmd)
>> +{
>> +	*cmd++ = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(1);
>> +	*cmd++ = CS_DEBUG_MODE1(0).addr;
>> +	*cmd++ = _MASKED_BIT_ENABLE(INSTRUCTION_STATE_CACHE_INVALIDATE);
>> +
>> +	return cmd;
>> +}
>> +
>>  static u32 *
>>  xelp_setup_indirect_ctx_rcs(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>>  			    u32 *cmd)
>> @@ -1037,6 +1046,9 @@ xelp_setup_indirect_ctx_rcs(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>>  	cmd = xelp_emit_cmd_buf_wa(lrc, cmd);
>>  	cmd = xelp_emit_restore_scratch(lrc, cmd);
>>
>> +	if (XE_WA(lrc->gt, 18022495364))
>> +		cmd = xelp_invalidate_state_cache(cmd);
>
>This is another one where the official workaround description asks us to
>use the per-context workaround bb rather than the indirect context
>workaround bb.  This register is already part of the LRC, so which batch
>buffer gets used determines whether this extra write will happen before
>or after the standard write that would have been part of the LRC
>restore; I'm not sure if that matters or not from a functional
>perspective.

Does it really matter considering this is a masked register? Doesn't
that mean it could just be implemented as an LRC workaround ?

Lucas De Marchi

>
>
>Matt
>
>> +
>>  	return cmd;
>>  }
>>
>> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
>> index 9efc5accd43d..a32f5ee9e917 100644
>> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
>> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
>> @@ -1,4 +1,5 @@
>>  1607983814	GRAPHICS_VERSION_RANGE(1200, 1210)
>> +18022495364	GRAPHICS_VERSION_RANGE(1200, 1210)
>>  22012773006	GRAPHICS_VERSION_RANGE(1200, 1250)
>>  14014475959	GRAPHICS_VERSION_RANGE(1270, 1271), GRAPHICS_STEP(A0, B0)
>>  		PLATFORM(DG2)
>> --
>> 2.48.0
>>
>
>-- 
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation
