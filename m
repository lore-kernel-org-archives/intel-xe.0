Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79188CD13DA
	for <intel-xe@archiver.kernel.org>; Tue,  5 May 2026 04:20:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BB0B10E021;
	Tue,  5 May 2026 04:20:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EfmCU133";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6311E10E021
 for <intel-xe@lists.freedesktop.org>; Tue,  5 May 2026 04:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777954853; x=1809490853;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=JIT+5F9C+GVJMLVYaaixs3uBR8mVIgSxErdHS9nGWug=;
 b=EfmCU133TH3JQVPHug0tUNExJAoN6FLswa37uUGtw698VMF9L4dPt8+W
 B89114ivhP8+uvO9uigPfOsWfKPURwIinAet65HdM0hge3eNDVi2JluIs
 9oKmzmdpVfDPlWmxc0H0qz8krDmwJJlaWuHSqyJCX23pN3OPwtVnbHe4U
 PbbvdOanf9+sObxTXI8SDZurOeDrUlk40uP+4qqUgGZYwc42/bvOznQja
 7NzJbeDZwkeL2U4j7Ow7FKmmxs/z9+prVOPxZ7gmvP1H/wMAicR+HBcLt
 4Tc3n0XW6ed9tX8mggFsR5+rlYQ+mXA0ZuVMZtN9118iMoPbLdidYryyG w==;
X-CSE-ConnectionGUID: h3hGOlh2R764D3vbUnB7vg==
X-CSE-MsgGUID: P2T78ceiR2ax0cnJk4LM9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="77839600"
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; d="scan'208";a="77839600"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 21:20:52 -0700
X-CSE-ConnectionGUID: VIiguaOoQwiTUgJ7C8kgRQ==
X-CSE-MsgGUID: uwm/CWurSs6XRdvvuP75UQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; d="scan'208";a="234685814"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 21:20:52 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 4 May 2026 21:20:51 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 4 May 2026 21:20:51 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.18) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 4 May 2026 21:20:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i0opmTCDtCBnyiYtPuuG+1bPd0y6dybkp1sYbnHKC8WrSKH76fqNKoV035YWxWaSWCO/pb9JtaanbV7slYDF8gyG2Ds95FvO0h9NvJ//+WRQdbz6Pa/MIYMeWSB4ak9urb4x8t9v1WbVucHFguuUEOwwIwZP5nMVuryfvZHXblBHiHmc5H72BpxHHOxoOdK8/N2ChciwRVkGIf02FERsEo0ua3hPmvpSwDAaiNaJlRUrNSyhXxv1h1J64Sr0ZVyVEB/Usd84XeRa9KXoDCa42gKEzryfchnUiCci3cAZHk1XFLpQh4SzS21XDT2MCTAAuPbeFyXqI6qBQnzSAHDj+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ez9EZVrMZ9QmtfQOhXP8zd30z//ycelXn2zjviGndYY=;
 b=A9X17VP3C4gQucY27EmCWP4fZeVf1cTWVbW+pgOMmSojN8VWDbW5oRxm9jJ+NJH+DIMQvrhg7Hhh+KxVGUI9Rqv+wCq7Oz2QmZdR3XIBkJtbv3VqmbCl5OmYPWsvEhTCbAZ5fmM8V01EFdVJ27LdX3wSyu4dXmW/kyZeOJGRE9LfXXhy2TnAXPWFXu0EIUFD8Auqf1YhYH42BEBS2qFT4eWeTvn84ma/A2CVDDXPeuubiJTsEYwkyStWLvN9c8kptb1bMQZfKnHTvk0HI53SlYwA5MzHdjtfwizNR61WoW3RRzaod153ErtBDi8Pn/AxJ7gzV6mO84lUkGjKM5hFwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by MW4PR11MB5889.namprd11.prod.outlook.com (2603:10b6:303:168::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 04:20:48 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%6]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 04:20:47 +0000
Date: Mon, 4 May 2026 21:20:45 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>,
 <stuart.summers@intel.com>
Subject: Re: [PATCH v2 8/9] drm/xe/multi_queue: Use QUEUE_TIMESTAMP as job
 timestamp for multi-queue
Message-ID: <aflwHYW-4NDZlEhc@nvishwa1-desk>
References: <20260502005332.3135977-11-umesh.nerlige.ramappa@intel.com>
 <20260502005332.3135977-19-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260502005332.3135977-19-umesh.nerlige.ramappa@intel.com>
X-ClientProxiedBy: BY3PR05CA0020.namprd05.prod.outlook.com
 (2603:10b6:a03:254::25) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|MW4PR11MB5889:EE_
X-MS-Office365-Filtering-Correlation-Id: 19755701-1418-407f-61ae-08deaa5daeee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: Q9HmnafWJhidNbxTCfj4bTLiNKnbPhH0EvQFZ4U3jiRK8vBqJBHGBkqEENJNHPljkfAlqkFUW+D+t/wZv8w40ho6L+erps0UPwbnQeDaOwQBkK5H4NQdCw/lvDcRYM+Njn5DHgwWdbe7pQO56B/euSFwu9g6uwC+T+JBVsiCjYkcTS6UTsMpRaqNNQmlBu1Y6hVOnnVvFG2sySKVM4If1ZzD3T+6GdSPzyTLzk8ArpwSgBEYAnxDzARPIR07kYPwVxx4TYoKyrtwsTnRPBQJzlC6Fcw5dT1iz763WMsJgnX2cczSdwP1lDilovhi1ga6x2qAbSyalvZRVgKJv7qL8SRaXUlI0t7c0fdpA9WjXwEP4SxEDVi2LtaF9xpHuct98CIno9cSWlzdqT+YpTcGB6Dd2yY31DLm2pV/4n2+vvzrmRNhHDEtQEG3oB6vaO1WMPNreAdzKIpAFwy2S0JVOjRjJ9q/aOjRVHYmL4tnVorthg9342h5Z1wb3d482GK+BYzcaU9p4LMTtala8owRXAmUeP+HUbLQfPIwbk5W9K+64oeRdKHRBzbKJBqCvbNoJSySuodo0dD72yTNa6R4kV1GEn7L08xfv99Ytt7Y1LUGSi4e0vhbOCdL2L4EfqI5nZARdV+oIyimdrWNCZJ3OvADw893guhOsMPMokpFCUwdVWTCAsdT8q29xha7YXIY
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pu/sCpYSe/WzeFcMhkfeBCSuMg6ARzWif4ds75/k2k7F0zOjGrPG1YiBBqy0?=
 =?us-ascii?Q?XvxgBHD3wCazyo86/4Ha56xJxvCf08gZRarucZwtatJFUnCktLDZ8TdSY2f6?=
 =?us-ascii?Q?itJFb7qsGE6k+eIzBb+wWjHWcRy8CQbnVIvcKin9i67WwJJgjI1rPfYn67Ci?=
 =?us-ascii?Q?2t4GtFau+dILKT+PEKAqR33fgh/Y3eK1g65cQ1nYng/NKLKkgsF5WeTBfoyS?=
 =?us-ascii?Q?qhsXtvuGTJd/pt4A8LIGYI03B8exFT+Saj0qHk3CAvZMvmpc44jdWHfp1fNx?=
 =?us-ascii?Q?4O8aVvzfGk6iTGa0oXLCPIBME/XdWeUorATqHbowK0WYhHg7HuWbmgRQG3RL?=
 =?us-ascii?Q?gNtQvd0JsHkmWOy0HUq05JuIVCpyqPDQPgzNCyM7L3rYmr0x2Y9ETcf064Y/?=
 =?us-ascii?Q?DRmQBx6qGdHm7YuWg4tudBkGta88wUiPfyJOwwMIddkBi9RPcxurM0cH5B2B?=
 =?us-ascii?Q?arkfeh6wSKJKRZwYjdTAT1sdSCe6LNuUPoajsugsT1i5Vxdk5h88CWC5zhGL?=
 =?us-ascii?Q?yQkX16cY4Mhctil5OtssYVXO0vatEHKzRZKA3088+nI6vFbw19J8V0ELCqt1?=
 =?us-ascii?Q?lc5IVih71l30bg3y/jypzArXGhZz+0BZjHc2l9ve8nBco7O+u3ZqQ8AarXqj?=
 =?us-ascii?Q?wjKN9TPyBXiS0kpf6tlh3506AxlZBjCMhJ0MCah1M77roBC/DYib13vm8kR4?=
 =?us-ascii?Q?K7MStKJlp4P9KgTYTH9qiWOuqUn2rjzWRDJzaPLH8bwo/ecaMMHVx258m8U6?=
 =?us-ascii?Q?rhHijQTEE66MhU1RqaT6VBrcHV1XWbodfmiSib4wBW0JJuUZPIoIbJSb1cn8?=
 =?us-ascii?Q?PPpmsbzYoYFWOD5zWplsAc3V0g3wQGrvCgvgrBU6YTzfuTkpVxclqTb7ASR1?=
 =?us-ascii?Q?H0v09LpfxQC+JzMxvADDl97BsvYZqaZrX5zCFN0JEugLjSJP+XtKuJd94zV4?=
 =?us-ascii?Q?QEkovar0+OGwCQX8F581Sq4tz0qFCcznKeopN+bWE1R45apNd+qXKF2VWaec?=
 =?us-ascii?Q?QRw86ShJ2a/P2x7rnW0C6v9KI308sSRmaDdvqXI/QLCqcQgjLwtPxrYe4P35?=
 =?us-ascii?Q?FRpuQTEH+cyjqHBN8RkFJ/IYzZV7kTSJLyEGJE8thHtErw+YydQcvB4Dj8AC?=
 =?us-ascii?Q?Vvg8b7CIIwfJHmRpYUvh3umLlXQMAE4nEPHZdBbOyVcG0FbmsiX9sGun6uTG?=
 =?us-ascii?Q?8VGafEt1S4Frx0ntUEKIESjLEJi3tK1ChWdkHDd0/8OKtJLiOfmRuMNJbC03?=
 =?us-ascii?Q?5ysgF0QU7N1v9WAmbgsW0q2WXtDuzcmNr4aUSmi03QqRePo9HXqhMj+MjmhN?=
 =?us-ascii?Q?HVP0JXRk+bKc6jdtZv1nII8ZdjyqPmlEJfMOKTMsCBgUbAT4z1bbqcFVCgas?=
 =?us-ascii?Q?Q6NhpltJdPuV4aMQuZkjy9VMs7mthKJFdfxXMJe54TxO8XXaxz6I9U71VVZy?=
 =?us-ascii?Q?aZ4N7VHcQibKTPJ5/6+LU6w0c4cdeHetuk29NEuyPvSdAnWtSmvxIQ9L8UUI?=
 =?us-ascii?Q?ojsECmlGwQ5c94SYYWz98GEAVSG8Y73hKnUtn51g7bPTJSLPZuWoLxMzJSQk?=
 =?us-ascii?Q?Hrh88vWHsajK0HPc3J4iTeyw39VdWgdaI6AP0diUv1oAS36LzghbFeHqcQEy?=
 =?us-ascii?Q?C0U1vtCNHkPH3c16bPzZY2XA/83npW353JR7E+R00YN2u55RvHgXHZ3cei9Q?=
 =?us-ascii?Q?tBMU0VUy7h4rlNzQYC15iLWU+9mRPdyNkrOCqM+Cka5p0pYkIv6e6TzYHTp1?=
 =?us-ascii?Q?2PZjp5tDd6l8PJ3NKa6JM9LdWcPrB8TqZn2vfcfWUXF7UEx5sjDl?=
X-Exchange-RoutingPolicyChecked: DSYC4b196yK/BWsEEo0++X8CMBPF4e1/+3j0xH1DK+ozM46FXTxRWSmgwaWfTHRlNlM05KS0GbWxTF67uIZXguY8LGXpcSlT4+6wUqxYhM4heQDoUywYgnGtIV10YzW6u7dwg3bGtnUXq6gqm4xp3iiHD4kXhtzyux0gpNziU7OW6mcacQl+UqsD0EuKqyiuwV8ThxT2AFQNY+3g1KNE6xjd5y1las5ECAQIS8tyiqCtvGzroi6m6saQZ0kF21TV/UL3yLQUDSIqEIdExqZr3EZtlZai4DeYUn4N4B0L+Ga2E4Tq3RJpE4mYgLsQhTXgWND/IuwTBIbQ5x/zf6A7mg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 19755701-1418-407f-61ae-08deaa5daeee
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 04:20:47.7772 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 42K159ZUAcCxwgpeqlE258CqArdcvK78eG446n62tl9xUPzd+5EWJR7ZOXK41cFoW8cGCs5WoUH63uCLZWVU5lmEueESdZrHRRG/daW4C+mAtwlA/S2wdrB0WULmVb+F
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5889
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

On Fri, May 01, 2026 at 05:53:41PM -0700, Umesh Nerlige Ramappa wrote:
>Each queue in a multi queue group has a dedicated timestamp counter. Use
>this QUEUE TIMESTAMP register to capture the start timestamp for the
>job.
>
>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

LGTM
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

>---
>v2: Use xe_lrc_is_multi_queue for check (Niranjana)
>---
> drivers/gpu/drm/xe/xe_ring_ops.c | 8 ++++++--
> 1 file changed, 6 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
>index cfeb4fc7d217..39a670e91ba7 100644
>--- a/drivers/gpu/drm/xe/xe_ring_ops.c
>+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
>@@ -269,8 +269,12 @@ static u32 get_ppgtt_flag(struct xe_sched_job *job)
> static int emit_copy_timestamp(struct xe_device *xe, struct xe_lrc *lrc,
> 			       u32 *dw, int i)
> {
>+	const struct xe_reg reg = xe_lrc_is_multi_queue(lrc) ?
>+				   RING_QUEUE_TIMESTAMP(0) :
>+				   RING_CTX_TIMESTAMP(0);
>+
> 	dw[i++] = MI_STORE_REGISTER_MEM | MI_SRM_USE_GGTT | MI_SRM_ADD_CS_OFFSET;
>-	dw[i++] = RING_CTX_TIMESTAMP(0).addr;
>+	dw[i++] = reg.addr;
> 	dw[i++] = xe_lrc_ctx_job_timestamp_ggtt_addr(lrc);
> 	dw[i++] = 0;
>
>@@ -281,7 +285,7 @@ static int emit_copy_timestamp(struct xe_device *xe, struct xe_lrc *lrc,
> 	if (IS_SRIOV_VF(xe)) {
> 		dw[i++] = MI_STORE_REGISTER_MEM | MI_SRM_USE_GGTT |
> 			MI_SRM_ADD_CS_OFFSET;
>-		dw[i++] = RING_CTX_TIMESTAMP(0).addr;
>+		dw[i++] = reg.addr;
> 		dw[i++] = xe_lrc_ctx_timestamp_ggtt_addr(lrc);
> 		dw[i++] = 0;
> 	}
>-- 
>2.43.0
>
