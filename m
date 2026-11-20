Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF48660A380C
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 02:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dqBHtpNj;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=JU457dCR
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75CF110E8EE;
	Fri, 20 Nov 2026 02:34:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B4EE10EB7F
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Nov 2026 02:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795142070; x=1826678070;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=0h4JVzEjMnjXsQ25ELsVj5UDJuW+E1ttiYkxQMplzpM=;
 b=dqBHtpNjmFz4CLFshH/5xsYIwk0lel7XTEuNA8IuV0FgaYn9ZRB/ugVl
 YMvxgAVhQVVCQq6TBDmnCQP4ub1JUag3Po4UUO7u4idQI9kUbss4SfebG
 JLYfWlwYiwfOzRy3Zv/XGpQgU3dK9V3wTyJLsFs/d3H+dAq9CU1DwdeJ3
 T9iDQQgN5WxrasHA3Hr4XfnxGsQWWqSZp2NCl13+SfrEndfjHIsByKdgG
 wlRhwpyKId7kCKdXp5ebO5WKzlhya+5YBnd7FD8deGdEU6cR9DEcqpRlC
 4CwW0DjxHm11aUTSV6lyY++u0wpSlNGYwxQsx4Oq3YweXTz0fdvQ0Y7et g==;
X-CSE-ConnectionGUID: hoaobFWtSuO3z6HGgnf8xw==
X-CSE-MsgGUID: 69mc2vOmSnat3MG3l8Bagw==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="4009101"
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="4009101"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 18:34:27 -0800
X-CSE-ConnectionGUID: QPg6DbwqTtuFnn072MSHlw==
X-CSE-MsgGUID: wbEl0bsTSnSnhQScVyBnVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; d="scan'208";a="10673249"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 18:34:25 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 18:34:25 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 19 Nov 2026 18:34:25 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.32) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 18:34:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lpiw00K1JaS6GJ9bylddP3TAlP+WM8ZxpIOVOMWpuFOEqUFhYBCU0Gft/0SFhGfqfEP7xMzfRC2dfEkAnEom3Q9C7pT9Usf5vVFwrm/nlSfp68UjbkQAB2Ds6H7tROhfMxFzYbwsCWKIL0GLeNSPuNrjzp2BWt09xIS/u9f+3dFOJjNqfhHcygd9tExzyobaRtZFFahNDqJt7yGDEoAUw+KniuDgP5o90MifosjnFGWxZCbHlK3zmcfw4GVpo98hU8s5eqM3tY0oAJ2zGT5xfEdFQtWcnK7r1PcoCwMs2B/jtjn/0UqqJFCCVdqNsibKPmE+mxvHah8KcwdThvrl8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wQrfdyBOQD4XvVI74z7vf3ujgtafeVmfBoZmlgmk3gw=;
 b=ASN2Tr0JnZh9yBk/wkoPsMJT23MW+pUmw19mC+ere71tOo6wwbXWFVW+C+8EuPO3q0xjnD5LiEyRpFcKdB84tetxCSntJHYZ1WoIVd/s7HCYQY7hw1D18KG32jkkv2N3RDmRnSEvnVNDBVZyRpaX3gsi1MpzgXYbuZDLXGDDQy2BX+x7sk/C68tVAmxJBpzcf9XOQVtQJJByDMQ6tXSgCThIv7OfjUjCOCgaLZ3dWwx0p10ESp0P8j1ldTqTjTaEDlmVDFamZ0Ub9XOyWpZDL5QzXmiCsazE8hzSRDokb22t8sl72fdUoHv6z2d8nBQHuP1oXyBaPg6Xa5nSMlzCYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wQrfdyBOQD4XvVI74z7vf3ujgtafeVmfBoZmlgmk3gw=;
 b=JU457dCRXJ5MWvzfAxqwAS8iJbXVW7cbDFdvTrMux9Htt1tPoNQiUz1n8cStqLnRq54WePimS7Z7sHmXiMTp09xEN2iiRtOmDWmXhr0GoiiIlBdau1QS8ZgCJjics7ICy/52xFdyhv2hV+Q8KMkflWtPAJIFBi7onRDt7VY935o=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4787.namprd11.prod.outlook.com (2603:10b6:303:95::23)
 by DS7PR11MB6014.namprd11.prod.outlook.com (2603:10b6:8:73::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Fri, 20 Nov
 2026 02:34:17 +0000
Received: from CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd]) by CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd%4]) with mapi id 15.21.0615.013; Fri, 20 Nov 2026
 02:34:16 +0000
Date: Thu, 19 Nov 2026 18:34:15 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <fei.yang@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <stuart.summers@intel.com>
Subject: Re: [PATCH] drm/xe: Serialize migrate ULLS enter against a pending
 exit
Message-ID: <av+xp0Nt6VFANLxk@gsse-cloud1.jf.intel.com>
References: <20261120004635.3902529-1-fei.yang@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261120004635.3902529-1-fei.yang@intel.com>
X-ClientProxiedBy: MW4P223CA0007.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::12) To CO1PR11MB4787.namprd11.prod.outlook.com
 (2603:10b6:303:95::23)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4787:EE_|DS7PR11MB6014:EE_
X-MS-Office365-Filtering-Correlation-Id: 789724ef-2b58-4bae-a24e-08df46aec5c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|6133799003|18002099003|22082099003|56012099006|11063799006|5023799004|261026121527099003|261026140227099003|261022115727099003|261022105027099003|261022075727099003|261028144727099003|261102123227099003|261021121427099003|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info: Eh46yRgDE0mrEmg+cIEXKo8Glfgfcm2zWSD1GKIHsclmRvis9nzFl/EoKv+chdDtHSpcBBTGE81dYCYF4LUsd68Ls2KEQegaHiQR00OCCDi/L9uklzi7qZq8u2upAwtXEfrtWkRpOpR/JXWkCeqO8vA3xnuV+Gg0fdZYbBAOFH0idhDCXDcJG0ocurHHG2iWcnQpZrjz6DzCOpad83b6rpW/bPXRd/Nt8DFtN5SsTSI/oXVrirAvZvnwIUKKFUiyOjYMNqkvjt4ibRKnl5Gc0viE3+8j3JAy2COTk9gfccpHoatUenWvIDdfWTlAWEf9KJ7jsJuFi5ZpcTv2WvOcNri1HYpTXuRIjdrB03yDBMZe/L5YPDE6LtwjnvVrm/GawEb4djNPYn9EgcUCCPHoe0o0d7WmSJqEuSFu1M9xHCxNbCtU0QtCV+71ksFrnoXYk182H0MwAvGtnNKRvTOFSlmvHPGa6FtH5v0sSmA41yl6oWNQLUf19Vrzlh2pab+FLr0HkQvy8NSWYf5ex3ha0cqVUzZiLOVffAgfdTHEWmPNzcRj3mlAD1eGneMV7wQC5xTtlnXCcbpAEpZkQrwiT5a/zvRBeOqMy08zmPbZHhJJ4ju2BRfYGeuH4bWO3PrQ4aSudNrJPD2zCO6BzBbsMM9g3wfAsYccy5gLIOuPmrI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4787.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(6133799003)(18002099003)(22082099003)(56012099006)(11063799006)(5023799004)(261026121527099003)(261026140227099003)(261022115727099003)(261022105027099003)(261022075727099003)(261028144727099003)(261102123227099003)(261021121427099003)(261009223027099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jHfFk2psVwpFifNVInUuf1Zt82mF5vLidvj6LZeswsw8VRrN96FR8h2+P9gL?=
 =?us-ascii?Q?8F2HZsL63ILLnM6W2o9GzbqtGRTpL81mg+mBkrgkPi7MUq6yWveEnVIM+npI?=
 =?us-ascii?Q?nR2Gcam6h7NNO3oFmS1LpfQUWjyjXrdPGC2NL8mNaHP/zchNe+CRnPQ0nOOO?=
 =?us-ascii?Q?iRpoTijCP/T+L548l1l4I8C8yAQnKZkJytMDauj33eCnwu5u6dVbcfbhDmOs?=
 =?us-ascii?Q?q83GhrmJwWwlVqBZuUV/zsxd4XW4/f3VDtyfxgyo20SD9s3Etn0bCHz6kCHh?=
 =?us-ascii?Q?ZhHSFf7vnt5l36+1IAF01VSUqze/n1tPquhSwUVjige1SmEVu+tI4mPocyrz?=
 =?us-ascii?Q?UpCXL6arN1DEC2wwAIlsyXF0ru8RyqHLMrwmzuLpMGe/IknlbVWwteV0l04y?=
 =?us-ascii?Q?4FswP4DmejfhGfMIQlxDgFqLjBjvDoc0vWEimIkAP4rheY9c859lAn4f/bTd?=
 =?us-ascii?Q?vemRs8O/svWA8qvKqZelqhKLrLe7lbpNqOiEQpMCLtIUpWVv+5JB0sFhezZF?=
 =?us-ascii?Q?6Y2TGSn20YdS6rZV3xY8GU1277Q0C0pAo0zNYRqMXtTcU7bs/mS+U2VBA3Ml?=
 =?us-ascii?Q?L5iOT8bCIDg2FV/nlX87LFeiHfC3TkNbWaAG5nUw8d51FyAeNw+JVr7GrCsh?=
 =?us-ascii?Q?pOvLLoB0u3g+qv44AfqCrQMr3CW9MwbiEO9Ih+EcM/8/8eoCzH6j4QfSS6Xu?=
 =?us-ascii?Q?MWiuHCwanhW1P9z/lmbqS7J9RftUUZnGKHH4wv7cqcIBaE+a8BOg7fGA360u?=
 =?us-ascii?Q?HiM4+AJY0V/gEtj8hGPE24xwrokj3ThYK2Yp1gelg2R00sOBG+ykS1tIgSFz?=
 =?us-ascii?Q?RfBPpMmeeYcXAtR+3BAKThkabBoc8mLiAAe2kq7dPPVFKrSUSJ8XsJTfsYz8?=
 =?us-ascii?Q?5mFFnlrcGBL6tHQlvi0aYsTjyL15aIJK7RaBrXig+oJ4lq7y5v0qDGoek147?=
 =?us-ascii?Q?6LE2ghT/+viHlA/5qzLEG0zqW4sUjKHqmfv6pThzvNLgWgiMH+XcIRXlzei8?=
 =?us-ascii?Q?1pWNwC5BHm/7gifM2UJrRaiRASbLSgBRVnbiRSZsgsN1ICFCIvG7MrxEEPYM?=
 =?us-ascii?Q?wfcwoGRpqSgmtL7+5iEkwyI2FEG7sNTWAbtekfsBn41G8b6yzWOLVnwHY8Em?=
 =?us-ascii?Q?ibesYAyYl0NTgZthrwoGOe5/ybnab/f1gOC/JoSsIQ+8yqkS0T4hC+akUvge?=
 =?us-ascii?Q?wW/E45uWhXLvX3fECTNgU+Pg7AEBJOrEv1kAsT5bmIBUhYcnu+QjWyw4AInt?=
 =?us-ascii?Q?Jp3fgsTkL7tX7yy44zJy17DmDfp7hHc0pw8GCBPJja0WbbUzegLF0KMNu6BA?=
 =?us-ascii?Q?a7MuExFuc0+zLjC0net01K32d1Csl+AWjuWRzxSX480Kjst05XnRiiFTt/Gm?=
 =?us-ascii?Q?QdfAAd+oICAoDXwm+VaE6YUm3iTVDEto3VQLadL9XVSpIAowDFkxvnkXstCm?=
 =?us-ascii?Q?zqNYLuzEpYuCf+6peTYf/aSgIHX1VLhdXlq2NcyMr4rzFy7hM9OG4iQZrApX?=
 =?us-ascii?Q?OVpYu4TonzcpA4ONaIN5t5Ruce3sWGEA3OCP3Y5u8weyv+wOo5c4HJXSahpv?=
 =?us-ascii?Q?U2KnKXm4yWyMdXLfB48P93Xymb2tYcxZ/MxpVjZG+kduwwpXJN8+/M7ezNK0?=
 =?us-ascii?Q?plb7W/rbX4np1vhuOdh06QoV4z5/Y9HnaL/tkxgcYvh05q6Gm70gewl4izMW?=
 =?us-ascii?Q?wE/T59PyiWeGQBkC3WZtCUEnK0dy+ssrJ0+hcqiXqQw7FPR0MDpVD4pSOg9/?=
 =?us-ascii?Q?HeyaT+0S2d5ZHJVsuVodwh0Q9b3hcKY=3D?=
X-Exchange-RoutingPolicyChecked: Dlp7VSt6vfjNfoW/7N4dxcUcvr4H9+/KGyQgaCTva5eatYMACjb9t9UI/e9DSLFzZuG/GdOln6mkKhhFS/CQnziZqe7SbA54Hzj+hD26LWlnsg7Iv5xrfGO3NmSiOYFQTOoC1OcW0gyMUY47FRHm7ttd9aIXuvQeXB0PBeZKh6nOXbHEPFOUSNPqPFSYj74GdY+WLDnXwkqxtNh6IfLcFGrsHL4CBUQjH7OHF3fi74vZhQFt87SjEpAutxfYLbr7USdZYD1xE7m9Jc5whPPPGS6OSUGN7tm83xX/zOZvwTzMstH91wL03gCkbnkP1c38l2DkqMbDvooimaeO2I/YwA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 789724ef-2b58-4bae-a24e-08df46aec5c2
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4787.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 02:34:16.7568 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h6H5J63USwaiBYYykF2Cza7XviQ4uQDJ5LUuGTuO2cqOeTTOr9Ehp3WIKtaudDTUAUiDKWRJbzcXI8CsYpMHtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6014
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 19, 2026 at 04:46:35PM -0800, fei.yang@intel.com wrote:
> From: Fei Yang <fei.yang@intel.com>
> 
> xe_migrate_ulls_exit() clears ulls.enabled as soon as the ULLS_EXIT job is
> pushed, and drops job_mutex without waiting for it. A page fault arriving
> in that window finds ULLS disabled and pushes a ULLS_ENTER job while the
> previous ULLS chain is still executing.
> 
> ULLS_ENTER is not chained, so submit_exec_queue() publishes its ring tail
> with xe_lrc_set_ring_tail(). That only updates the saved tail in the
> context image, which is what a context restore loads RING_TAIL from. It is
> therefore correct for a context that is off the hardware - but the context
> only leaves the hardware once the exit job has retired.
> 
> Submitted before then, that write races the postamble of the job preceding
> the exit job. The postamble publishes the same saved tail, and RING_TAIL,
> at the end of the exit job. If it lands after the CPU's write the tail is
> rewound behind the enter job, which the command streamer never executes.
> Its fence never signals, so job_cnt never drops, xe_exec_queue_is_idle()
> stays false and the exit worker re-arms itself forever while the context
> sits parked on the engine.
> 
> Wait for the exit job's fence in the exit worker before dropping
> job_mutex. xe_migrate_ulls_enter() takes job_mutex to submit, so it is
> serialized behind the exit job retiring. The exit job carries no batch
> and is only pushed once the queue is idle, so the wait is short and
> depends on nothing else on the queue.
> 
> Fixes: 8ab0d5ca31ca ("drm/xe: Add ULLS migration job support to migration layer")
> Assisted-by: LLM
> Signed-off-by: Fei Yang <fei.yang@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_migrate.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index d7a8d8ecffe63..a8deb5fa714ca 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -188,6 +188,18 @@
>   * The PM reference is then dropped. If the queue was not idle, the worker
>   * simply re-arms itself.
>   *
> + * The worker waits for the "last" job to retire before dropping
> + * @xe_migrate.job_mutex, so a subsequent enter is serialized behind it. A
> + * "first" job is not chained, so it publishes its own ring tail with
> + * xe_lrc_set_ring_tail(), which updates the saved tail in the context image
> + * only. That is enough for a context which is off the hardware, since a
> + * context restore loads RING_TAIL from there, but the context is only off the
> + * hardware once the "last" job has retired. Submitted before then, the write
> + * races the postamble of the job preceding the "last" one, which puts that
> + * same saved tail - and RING_TAIL - at the end of the "last" job. The
> + * postamble landing second rewinds the tail behind the "first" job, which the
> + * command streamer then never executes.
> + *
>   * Job state
>   * ---------
>   *
> @@ -768,6 +780,9 @@ static void xe_migrate_ulls_exit(struct work_struct *work)
>  	scoped_guard(mutex, &m->job_mutex) {
>  		if (xe_exec_queue_is_idle(m->q, 1)) {
>  			fence = __xe_migrate_job_push(m, job, ULLS_EXIT);
> +
> +			/* Keep enter out until the context is off the HW */
> +			dma_fence_wait(fence, false);
>  			dma_fence_put(fence);
>  
>  			xe_pm_runtime_put(xe);	/* Pairs with PM get in enter */
> -- 
> 2.43.0
> 
