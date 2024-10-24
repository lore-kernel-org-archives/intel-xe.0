Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6880ED0BB55
	for <intel-xe@archiver.kernel.org>; Thu, 24 Oct 2024 02:56:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DA0910E264;
	Thu, 24 Oct 2024 02:56:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dQ26FZJ6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E373410E264
 for <Intel-Xe@lists.freedesktop.org>; Thu, 24 Oct 2024 02:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729738615; x=1761274615;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=OiCpkDVnMwroPqhjJWcn2KcyH3n/WEBOSIGJUOkI2Mo=;
 b=dQ26FZJ6bBFx7ZiZ+oIXH0TxTaoDyFnYoh+81nOcsvHOMpzqOicsZOQG
 NzUerLjZZH1cJ7W1bujnMjQ07+SNlZ1DTS7s2+I9HeqBrEX4ICVHw9Zi0
 gkjaN2P/AMnQSMTF9PmyKqmMR21r77y2JA/TI8e5NaUdK+Fy1cGULTkhI
 oj1IuwzcP9/o6JhV64M/eTxJEGAPPWspRVxOEPeoaZ8EZdS/t2iLIzGAr
 4m3OzM9ocWflSzG+zFjh6KvyW80+eMxzFnQgIrsXg8XEfUYlK/7OTd6yC
 6m/gQNxYMcXLCa5LawTjs5V7W16Y4BQLqkOJq2eQ5xaXhtX7MnkgQ4zo+ w==;
X-CSE-ConnectionGUID: ToEE1b6eRtGFsd1EN8c0ZQ==
X-CSE-MsgGUID: W2A10BRRR5e6wbkYlrjQGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11234"; a="33262647"
X-IronPort-AV: E=Sophos;i="6.11,228,1725346800"; d="scan'208";a="33262647"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2024 19:56:55 -0700
X-CSE-ConnectionGUID: YdCft9gvSLmefx5DZofi7A==
X-CSE-MsgGUID: 4HcGUusgQjqwu+NrQs6x5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,228,1725346800"; d="scan'208";a="80032622"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Oct 2024 19:56:54 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 23 Oct 2024 19:56:54 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 23 Oct 2024 19:56:54 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 23 Oct 2024 19:56:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S0c27UvjnThvwrvemcWPzSDd/MqtbwPELrNWHDXeNzhEVNlC02P2kBbUQjnpsDq9AIRbi5tmnpurd5WF51QX/MFMhgcQJGlunihczw66CjgOeRp2GRw/aMEBgulN3Q/nZTRCkv0mOijAuuX3gWq1jX6ZeeozIRu94JbtarbUiR486JJimoX1bEhCfbQfImKhxdLpnUIGq/mKzU5k94t3zR/O/ESkXbRWg8vfUZD0sPXBv0azpjpV1dk1Bo9Y+QNTY4ALQBwofpEM1H+qi2UTnvdvJ+d3C3m/T6ofcCo3oOz+dYuumgtwBUAaSAg8kErvQfRqV/4r2oxTJBb5McvEVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oHnAsEY5z2PW1/94+PyOKwqU9ufh7Tdsv7aaH8qNQuk=;
 b=ApfPjIlGXWJzagzklMYqeSWJRKpW7BNS04Gj8VxcDlkcKCBZQFb10yRSG7fn2MUaNGtaD71QShYTWkWbQV/qOH9Po5EX/jg5ta6bPg1FqZ1ykPRxiAOIoUj1RtMr9YKdL0Givko6ZvHlWDug49fx9FtLxf7Q2wMA2vyv19nnVLUMimBOJrwuXCWtsH6K33DASQDRaY2D0NK0q0nNQToFRoztz1oOmaEuYe2MYC02g+4nZ1+6qNhYRvOwklgOmIqIZQQlBSMXnLEpSTW3zeb/DWq5+vlPqC8nNh2+B8mKOVDl+7SPcdY54RGRBICeHT5WvfHV0tF8Qe91sFjr4p+MMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by LV3PR11MB8578.namprd11.prod.outlook.com (2603:10b6:408:1b3::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.20; Thu, 24 Oct
 2024 02:56:49 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%3]) with mapi id 15.20.8093.014; Thu, 24 Oct 2024
 02:56:49 +0000
Date: Thu, 24 Oct 2024 02:56:29 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: <John.C.Harrison@intel.com>
CC: <Intel-Xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 2/2] drm/xe/guc: Separate full CTB content from
 guc_info debugfs
Message-ID: <Zxm3XZgu/Ahrvfpn@DUT025-TGLU.fm.intel.com>
References: <20241024002554.1983101-1-John.C.Harrison@Intel.com>
 <20241024002554.1983101-3-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241024002554.1983101-3-John.C.Harrison@Intel.com>
X-ClientProxiedBy: SJ0PR05CA0018.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::23) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|LV3PR11MB8578:EE_
X-MS-Office365-Filtering-Correlation-Id: c6352fd9-8dcc-4db7-6d8a-08dcf3d7816b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Cj0URaYnC8tc7YcZCyPzzJ6AfpST137ec8NqNM/f/Wcuqj3GTiVyMVZg8+JC?=
 =?us-ascii?Q?Cesjuh7NjhofFYcrmyF/mIwqMibLzE9kE9YXXC4X/k54GmPoOU5tUk/AKWVN?=
 =?us-ascii?Q?LzIjD73ASkS+9/tBGopAAtV/bd4B2AcTTLJpTNB3sqfF84Imrq1rbUnl72gv?=
 =?us-ascii?Q?zWxYS8sTV5/gJMX5w++TJW7ApHQoRkCnseOP1MS7hd3CRpFRuqP/NBp3HlOR?=
 =?us-ascii?Q?4d+dRkSt10fZ9+6hQapwS62we321i2mhrOdz77Kqt0/N49ucFEX1ZULb8olX?=
 =?us-ascii?Q?QYhMNJnPv5F34iqCDaF3HX3+dlrAhcInYXkrVg92UvkCZ+aDJSF+n+vorxD5?=
 =?us-ascii?Q?LdATBmWTNbVcfBw8mABSgNqgAmisebLYAPbTzAPidMcsOHIc1Whbhx2GNoBe?=
 =?us-ascii?Q?YZ4FjAHKyjkEygMxxspH2d7s550b+NORMT83CHYcoycgnlYvZ4ABxwAuLYFH?=
 =?us-ascii?Q?2coisesrhvD1tBVAlkOxssnf4kHBLodCtjGLmfGJnCXT5OmRDfnsCKi31utG?=
 =?us-ascii?Q?Jv85GUCTU6ukCH8iNXyA1Glg28xPppcNjp/PnQaEK9K4O4OCGTX8OeWSMR53?=
 =?us-ascii?Q?SdjaBm/WHt9K0KGBBfZxD2/B90qHT2ZbcFv6oU7BGK1K1D5WIazCRCYt9IL6?=
 =?us-ascii?Q?brdi8/5ETDPrpsh4Hzw5RvJlah8IIuYbdpaWg+YDBM5JSErTFpY2R84DVHLZ?=
 =?us-ascii?Q?sYuGlDgLb8x7KalzoGjumHTM/Zh7b/IR7VRnwZsJ6UzEr+C0KWvCwNrwc8C4?=
 =?us-ascii?Q?e7wiwcWxTm9Q58dvrh0VLeQB3rvvSoOV211P5cPqp/CHiD2ojbMuSBh+LDjs?=
 =?us-ascii?Q?/wMumr4x5Jp26dRkqv7rL9V//DjGeq10Hp7Ig+/pvPXBOzFfkEmUSvVUYpfs?=
 =?us-ascii?Q?0q4AXVtWBr6bxlt+i4dgbYFb+QsuTUzy88/lHtVxtOXRYYyCvOuHL8mIko3d?=
 =?us-ascii?Q?5EIDn4QhWGVhBqkOMStKvyCM+fbBE9ADWLVS3YeXe4BdTDFRuk6MA5RG9b9h?=
 =?us-ascii?Q?d0xqlKtTYw3hm3JjqCWvcEv9GMhyx6dBLKgGsz7Tvvdg5t9/bcWt2dDqvAHd?=
 =?us-ascii?Q?CS2ssDH66jKYdNSJ+krMLOtRp0NNjuv+sC4E5f+IxPbPCWYX9gN0eLhl1dQN?=
 =?us-ascii?Q?viKn5TVxHAbAzHZ2RyTIUZCyqo84X7KCvi6bsiCc54rhK+4lIemeQ5Xc01wm?=
 =?us-ascii?Q?3L8nIeAQPwy42Vf+tgHANbWso2vV/PmHE2BoD2BtC2L00YK4XvqJhLMhJ74z?=
 =?us-ascii?Q?6LQ07auD6N3Jhy55DS8lkJLtky3ZLtYvxqP8+ClzoJtvzbeSL/vBTtEUz0L/?=
 =?us-ascii?Q?h8nJnnpqrgZH4DCUgVZJLGjQ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1iqjTc0EUHKXlQ1PrgeTrPx4V3FE95/gAR3RqIFGF7aCsvRdOq9dabirXFBN?=
 =?us-ascii?Q?sfzq3u69UDLJ8tGsN1uC4uJs1a6+Q86kiy8PYdNle10jbEhazxR5usA2Oj45?=
 =?us-ascii?Q?I2X2j01WJjs3CfCOCIXaA/Q3Won5Djq0H/ETOXi9d4E1FeeukHyFGzDHz642?=
 =?us-ascii?Q?CYf96Dg+JhEtq+DW5R2LUN0VYDVJEVIwgwMVd6rD8i1LthqFIB87PS08kTYX?=
 =?us-ascii?Q?5+RsAaAUxC7WZz2uS0gFMpSgx5Duu+RwcANBEC44Dm/r513pTrvSjgunMwCL?=
 =?us-ascii?Q?uQgHyAdomdVAp9rFw/CqIXo+IU75sfBXKlj7BTe6HCzKl2H70gCz4aE6GNIw?=
 =?us-ascii?Q?0g0V7fjDPLqMX5KZOcJI332OggfxV/kNSMoBLPZdALb1CEJFcd8oAgO4CahK?=
 =?us-ascii?Q?Ucx737V8mde5Pe5YmuPKA/RzSjTgsohQ76rHgmBIbZGqupf5WoRVpo1jiJl4?=
 =?us-ascii?Q?z1s0Q24ehRxbdVtB04q5Pq4ZEiLhZ005JCxC8plMfmH+b8N+tcCHZ7uWcnHI?=
 =?us-ascii?Q?+sY93JHDrZUc5qAOtGK35gzDtd7u5VWmibhVSoKGUEqAg17If0yYug/lwt6s?=
 =?us-ascii?Q?o7Jm7Pzla6IO4/NmI2CjpBscDidse9IVwCAiry67vOkOuYX+kEgv8gDOrrPA?=
 =?us-ascii?Q?dw15G6f/91VVOv06SZdnWSQn9MC7DPNlCq0s3QvPbAO7u7gsiq+g8+v40N9c?=
 =?us-ascii?Q?C99sn0S8cfZRJi7TIIFiodOxZb017vyyB/P4LPvSlbaUxiASFiS+GgHo0BfI?=
 =?us-ascii?Q?kkH7wS8GCeJMvrNkHZnkAgYrnXofbi6mGQYi+BewMObjBO47R/hqTAiUrXc0?=
 =?us-ascii?Q?RsPVvL8uxG49ccAa1TZWIEAImvNXqKtdZazgsrGgE0NWDkD9xsmL1c9ckx74?=
 =?us-ascii?Q?SU8jIgx/asawjQEVG3uXfe1C9r51iVfegtgnAgmDsRE5H6+bDP0x+BfC5LRB?=
 =?us-ascii?Q?Zzuu753ZfzIu50l/MfAsw67yNLULfGTK+q8kBj1mjPTOMdoylIUl7IfCAIx/?=
 =?us-ascii?Q?Tb++kYdLv2C0fu5a0xZif32RfA4PwOEqJAXfGEOPn1gT/7SyANPutcf4XiaN?=
 =?us-ascii?Q?3BfDzv62Z9wh4+1M109wpfYd0lzC90nsPaUvci2U/81r3Bt1snHWhpEaTkj0?=
 =?us-ascii?Q?8FPTimFpwiWmNz5TOW43Nw50GBtRrHwQt1gE0Na/9q6vplxoEvU7h1eTcUHH?=
 =?us-ascii?Q?VQemRRUMc5wzTRNo/NA8kdoMkOkITSx48ULHjpP/TQYIc77vOx5CNCe02U7t?=
 =?us-ascii?Q?Lbuv0olqnNmKMFtwRtWPDJ3v+5GRpQBreYzNA/Y+qLrvuHRQa2yvAVwCEwHz?=
 =?us-ascii?Q?hX7He7SaZyf9LU9qvkwwPJetzDorCPfeQtdBbZmSJn53P8JUy3sdnuHCPNPs?=
 =?us-ascii?Q?QlmKTVrrwmhIZtRDzdwWXC57jqfAQ91ujp/5CBbJOU2Bu/KBOHqBOpj8SRcr?=
 =?us-ascii?Q?kwAEYBD+VhHws4Rde2BSDWtlx7rmSwqXjTfddZj36IX3+1EpIWP0EHn09csN?=
 =?us-ascii?Q?cO7JSjCxOgjNYVDnvTwnttLeQlpqXFkilx1Do7xuwEvhPKdyyJ1eZl/i6Bb8?=
 =?us-ascii?Q?/Obo+bctcCJ6L7rI4SPu72yiiV7I9DVF8iTLQRPho076RWGPugTIyOAIKL7a?=
 =?us-ascii?Q?Hw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c6352fd9-8dcc-4db7-6d8a-08dcf3d7816b
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 02:56:49.6346 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7fZan1xvualAQeTOjWS8aZSfeLlTkj2O4kmpIEA/azBxrHNrtIYA9AxMb3pcFxdaKDQo3QfpOpqO4t5pLSdvfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8578
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

On Wed, Oct 23, 2024 at 05:25:54PM -0700, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> The guc_info debugfs file is meant to be a quick view of the current
> software state of the GuC interface. Including the full CTB contents
> makes the file as a whole much less human readable and is not
> partiular useful in the general case. So don't pollute the info dump
> with the full buffers. Instead, move those into a separate debugfs
> entry that can be read when that information is actually required.
> 
> Also, improve the human readability by adding a few extra blank lines
> to delimt the sections.
> 
> v2: Hide the internal capture/print params from external callers that
> don't need to know (review feedback from Matthew Brost).
> 

Looks better.

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>  drivers/gpu/drm/xe/xe_devcoredump.c |  2 +-
>  drivers/gpu/drm/xe/xe_guc.c         |  5 ++-
>  drivers/gpu/drm/xe/xe_guc_ct.c      | 54 +++++++++++++++--------------
>  drivers/gpu/drm/xe/xe_guc_ct.h      |  5 ++-
>  drivers/gpu/drm/xe/xe_guc_debugfs.c | 14 ++++++++
>  5 files changed, 49 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
> index 8b0ea77661b2..d2679c5d976b 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> @@ -267,7 +267,7 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
>  	fw_ref = xe_force_wake_get(gt_to_fw(q->gt), XE_FORCEWAKE_ALL);
>  
>  	ss->guc.log = xe_guc_log_snapshot_capture(&guc->log, true);
> -	ss->guc.ct = xe_guc_ct_snapshot_capture(&guc->ct, true);
> +	ss->guc.ct = xe_guc_ct_snapshot_capture(&guc->ct);
>  	ss->ge = xe_guc_exec_queue_snapshot_capture(q);
>  	ss->job = xe_sched_job_snapshot_capture(job);
>  	ss->vm = xe_vm_snapshot_capture(q->vm);
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index b065bb9973e9..fcb540003e53 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -1187,7 +1187,10 @@ void xe_guc_print_info(struct xe_guc *guc, struct drm_printer *p)
>  
>  	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>  
> -	xe_guc_ct_print(&guc->ct, p);
> +	drm_puts(p, "\n");
> +	xe_guc_ct_print(&guc->ct, p, false);
> +
> +	drm_puts(p, "\n");
>  	xe_guc_submit_print(guc, p);
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index c260d8840990..0ae0fc1f0084 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -1607,7 +1607,8 @@ static void g2h_worker_func(struct work_struct *w)
>  	receive_g2h(ct);
>  }
>  
> -struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_alloc(struct xe_guc_ct *ct, bool atomic)
> +static struct xe_guc_ct_snapshot *guc_ct_snapshot_alloc(struct xe_guc_ct *ct, bool atomic,
> +							bool want_ctb)
>  {
>  	struct xe_guc_ct_snapshot *snapshot;
>  
> @@ -1615,7 +1616,7 @@ struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_alloc(struct xe_guc_ct *ct, bool a
>  	if (!snapshot)
>  		return NULL;
>  
> -	if (ct->bo) {
> +	if (ct->bo && want_ctb) {
>  		snapshot->ctb_size = ct->bo->size;
>  		snapshot->ctb = kmalloc(snapshot->ctb_size, atomic ? GFP_ATOMIC : GFP_KERNEL);
>  	}
> @@ -1645,25 +1646,13 @@ static void guc_ctb_snapshot_print(struct guc_ctb_snapshot *snapshot,
>  	drm_printf(p, "\tstatus (memory): 0x%x\n", snapshot->desc.status);
>  }
>  
> -/**
> - * xe_guc_ct_snapshot_capture - Take a quick snapshot of the CT state.
> - * @ct: GuC CT object.
> - * @atomic: Boolean to indicate if this is called from atomic context like
> - * reset or CTB handler or from some regular path like debugfs.
> - *
> - * This can be printed out in a later stage like during dev_coredump
> - * analysis.
> - *
> - * Returns: a GuC CT snapshot object that must be freed by the caller
> - * by using `xe_guc_ct_snapshot_free`.
> - */
> -struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_capture(struct xe_guc_ct *ct,
> -						      bool atomic)
> +static struct xe_guc_ct_snapshot *guc_ct_snapshot_capture(struct xe_guc_ct *ct, bool atomic,
> +							  bool want_ctb)
>  {
>  	struct xe_device *xe = ct_to_xe(ct);
>  	struct xe_guc_ct_snapshot *snapshot;
>  
> -	snapshot = xe_guc_ct_snapshot_alloc(ct, atomic);
> +	snapshot = guc_ct_snapshot_alloc(ct, atomic, want_ctb);
>  	if (!snapshot) {
>  		xe_gt_err(ct_to_gt(ct), "Skipping CTB snapshot entirely.\n");
>  		return NULL;
> @@ -1682,6 +1671,21 @@ struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_capture(struct xe_guc_ct *ct,
>  	return snapshot;
>  }
>  
> +/**
> + * xe_guc_ct_snapshot_capture - Take a quick snapshot of the CT state.
> + * @ct: GuC CT object.
> + *
> + * This can be printed out in a later stage like during dev_coredump
> + * analysis. This is safe to be called during atomic context.
> + *
> + * Returns: a GuC CT snapshot object that must be freed by the caller
> + * by using `xe_guc_ct_snapshot_free`.
> + */
> +struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_capture(struct xe_guc_ct *ct)
> +{
> +	return guc_ct_snapshot_capture(ct, true, true);
> +}
> +
>  /**
>   * xe_guc_ct_snapshot_print - Print out a given GuC CT snapshot.
>   * @snapshot: GuC CT snapshot object.
> @@ -1704,12 +1708,8 @@ void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot,
>  		drm_printf(p, "\tg2h outstanding: %d\n",
>  			   snapshot->g2h_outstanding);
>  
> -		if (snapshot->ctb) {
> +		if (snapshot->ctb)
>  			xe_print_blob_ascii85(p, "CTB data", snapshot->ctb, 0, snapshot->ctb_size);
> -		} else {
> -			drm_printf(p, "CTB snapshot missing!\n");
> -			return;
> -		}
>  	} else {
>  		drm_puts(p, "CT disabled\n");
>  	}
> @@ -1735,14 +1735,16 @@ void xe_guc_ct_snapshot_free(struct xe_guc_ct_snapshot *snapshot)
>   * xe_guc_ct_print - GuC CT Print.
>   * @ct: GuC CT.
>   * @p: drm_printer where it will be printed out.
> + * @want_ctb: Should the full CTB content be dumped (vs just the headers)
>   *
> - * This function quickly capture a snapshot and immediately print it out.
> + * This function will quickly capture a snapshot of the CT state
> + * and immediately print it out.
>   */
> -void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p)
> +void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p, bool want_ctb)
>  {
>  	struct xe_guc_ct_snapshot *snapshot;
>  
> -	snapshot = xe_guc_ct_snapshot_capture(ct, false);
> +	snapshot = guc_ct_snapshot_capture(ct, false, want_ctb);
>  	xe_guc_ct_snapshot_print(snapshot, p);
>  	xe_guc_ct_snapshot_free(snapshot);
>  }
> @@ -1776,7 +1778,7 @@ static void ct_dead_capture(struct xe_guc_ct *ct, struct guc_ctb *ctb, u32 reaso
>  		return;
>  
>  	snapshot_log = xe_guc_log_snapshot_capture(&guc->log, true);
> -	snapshot_ct = xe_guc_ct_snapshot_capture((ct), true);
> +	snapshot_ct = xe_guc_ct_snapshot_capture((ct));
>  
>  	spin_lock_irqsave(&ct->dead.lock, flags);
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
> index 338f0b75d29f..82c4ae458dda 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.h
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
> @@ -17,11 +17,10 @@ void xe_guc_ct_disable(struct xe_guc_ct *ct);
>  void xe_guc_ct_stop(struct xe_guc_ct *ct);
>  void xe_guc_ct_fast_path(struct xe_guc_ct *ct);
>  
> -struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_alloc(struct xe_guc_ct *ct, bool atomic);
> -struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_capture(struct xe_guc_ct *ct, bool atomic);
> +struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_capture(struct xe_guc_ct *ct);
>  void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot, struct drm_printer *p);
>  void xe_guc_ct_snapshot_free(struct xe_guc_ct_snapshot *snapshot);
> -void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p);
> +void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p, bool want_ctb);
>  
>  static inline bool xe_guc_ct_enabled(struct xe_guc_ct *ct)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_guc_debugfs.c b/drivers/gpu/drm/xe/xe_guc_debugfs.c
> index d3822cbea273..995b306aced7 100644
> --- a/drivers/gpu/drm/xe/xe_guc_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_guc_debugfs.c
> @@ -47,9 +47,23 @@ static int guc_log(struct seq_file *m, void *data)
>  	return 0;
>  }
>  
> +static int guc_ctb(struct seq_file *m, void *data)
> +{
> +	struct xe_guc *guc = node_to_guc(m->private);
> +	struct xe_device *xe = guc_to_xe(guc);
> +	struct drm_printer p = drm_seq_file_printer(m);
> +
> +	xe_pm_runtime_get(xe);
> +	xe_guc_ct_print(&guc->ct, &p, true);
> +	xe_pm_runtime_put(xe);
> +
> +	return 0;
> +}
> +
>  static const struct drm_info_list debugfs_list[] = {
>  	{"guc_info", guc_info, 0},
>  	{"guc_log", guc_log, 0},
> +	{"guc_ctb", guc_ctb, 0},
>  };
>  
>  void xe_guc_debugfs_register(struct xe_guc *guc, struct dentry *parent)
> -- 
> 2.47.0
> 
