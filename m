Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2A0EFF885A
	for <intel-xe@archiver.kernel.org>; Tue,  5 May 2026 04:19:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 593D010E021;
	Tue,  5 May 2026 04:19:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j5ADeWx+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 054D310E021
 for <intel-xe@lists.freedesktop.org>; Tue,  5 May 2026 04:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777954755; x=1809490755;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=I0BhW/om9e8CSRk2u2sj5ZHpCQhUxpouawGyA7u18Hs=;
 b=j5ADeWx+J/wCaSUAnz5GwWw72I8pQXE8qMkyjVv4GS5LbQaWMSnGIaeY
 cPJU/ZfRzjvyTo9h3gkxLzPF7uODALSJVoA0a/ToJ4BE3Nx4cKNIugSWO
 wjCzc8EN5BAHbnScz+Hy5HKxO+TMeggW/zRoUItVBoazzz0U7Z8XcQoy3
 0Z1VilCCL8UFDm5QTncJT2rcDAodZq6fkrQ4PFZ5by+ZMLJINfN5SqwTN
 hsTi1AVb2qOQjO6OncZz5ww77QtYCye4pbFiQupmfcjEyKCTxYK4IVTBO
 FJfQMs60cLIZGoKCWjUMnB7RE6hCnzh/GrpCJrzVD2PlkSz/veI+PyhKd Q==;
X-CSE-ConnectionGUID: hvJiQHdaTEO5nLVO+XM4Jw==
X-CSE-MsgGUID: IHFO/CKGR2a4UneCPbS6/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="66347477"
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; d="scan'208";a="66347477"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 21:19:14 -0700
X-CSE-ConnectionGUID: cMhr/VdVRTKPQPkh/i4f5g==
X-CSE-MsgGUID: waUhHbnBTVOGraEWzOuSVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; d="scan'208";a="235751365"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 21:19:15 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 4 May 2026 21:19:13 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 4 May 2026 21:19:13 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.69) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 4 May 2026 21:19:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HM4BxYZPsDIWIAgyNpt0XoWEfKnpd52v3mtLS4DGAbaf/N+8yOVexZrVEl2xWq1pq5P0WuGlLYB9UowDfPL7OecSFNhfW/+Y0+zRDE54Ly5IX2zF3C9f0aFTMInNX+rbvRWUfAHwK4/60AQSCRvKz7d7dh0L7nlgEDYp9WjXINW7ORDghbG0c1/X6RXDsh6WQ8gnnW3ZBhdpjzjZuVSGaGSdTuMiEtsQsQceT1gobkpruQiCUDrVhhxZJsDEorKc3jH6LXWyYDxoJl3P8F5kXfzsQ1IYfH8F3M51fFpGSNzGHGOYEVNsXoILTZQEIVAeG2wo2FwVg+40ggBkcV/JVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MBX5qJ+BEE8KWiB01YXPr7puXuRtoaEG+exjmEM6ubM=;
 b=FL3QnN9bcMjkEO1+s6FabVxvgwIiOtW0kXUEOt2gcbc4lfNsN3qcWkROfq/5rHddFylf8/L/TuaiD19oqOjFWXTskqVswMtAr+BX05ovPTVFfK0fyDEKzI10DJkfvW3h35Lf71H/oqf96fxxp3FGoy+Np6WMQ/I/DBsTuNp0qq+R6FW6ZHXwers9nvBCrnv5w+9Wq6wsHXNCnpxEYCYxPz3Whjzl0AN1h5PufO+DtNQeDfEm6I39Uq7dJ6ZXUNTU9EUXnGVfMR2Or7UfskxLKqKEuO1yWr9gwthPlVRt6XHWFdKZluS9Ev7K5BhyfUhFpkNFcLF4lOb8Yk2iPmoxdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by MW4PR11MB5889.namprd11.prod.outlook.com (2603:10b6:303:168::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 04:19:10 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%6]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 04:19:10 +0000
Date: Mon, 4 May 2026 21:19:07 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>,
 <stuart.summers@intel.com>
Subject: Re: [PATCH v2 7/9] drm/xe/multi_queue: Add trace event for the multi
 queue timestamp
Message-ID: <aflvu6cyExEL6Ega@nvishwa1-desk>
References: <20260502005332.3135977-11-umesh.nerlige.ramappa@intel.com>
 <20260502005332.3135977-18-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260502005332.3135977-18-umesh.nerlige.ramappa@intel.com>
X-ClientProxiedBy: SJ0PR05CA0001.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::6) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|MW4PR11MB5889:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f02bad6-8f7e-4a49-f9a3-08deaa5d74b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: WOM41AB+EeP3gF7uAuknMTGC/7BLOD9gjEPqp6u4TKOz3mnVkPvsItp5sI9hbhJ+TCDLDU22QSyoy+S4uDZmjHaiGU0U9GnKOEQ4La96SGo8hnb5Yb56JLSu+I+zvQxc0yrtdZqEAgR4jhnQkO0b1MWg0RXYRUTTYhEy7PRQe0nLIYFYBMActNgtm0Ic0wh3Lznh+Ate8Y6C2z7mI8KAoEegtIqSBsbFzDUQV80Ya5Ewf0Fp+PIle2kFRnf54OwJNTNQ2KZ8b/4CsadV0FF9y5ijDD7skotZVGdFKTEUO1jjdyISQL716OPkaRq2XYGnIaWpu4UgBIeomXRUGf8dRrq/goMH1QC/hEzeuEiR8O3sTWZaC8SHYIkUS7OAy1e3iw7BCatoP5gQM7dl+t7s55gd01/Ld4D6ugVBkQCRiVX2Q8Oo3WjxXRIwc5AnlI5mxqqpfAfa+dfimnMFMpP/spAiz1JH2tf/2GnMvEMKKYk1+l8tX54YkDeSFw5YTlkiXZ7wmwp0I34UkGd04koskCQA/m0hiuF+wBcncsje7FFCfikssvQ/N3BA7ARI33iB+wPuZNRFYvDNVAwM/JlVDX9V1hKbQxnYjFXc+IXDI3t27/X4Mc7ebMLqTWRBsBNt0RdES8MPAemIiVWRYm0P07kk9wQcWaczEleykrtVOgkYCHknO6OnAA4jZQ3pc8JN
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DPQn9b+Uveb1b8Iq/6sOj5ThgnQ4bRMz75xQ7hZQQJYG0hKKoUB1St7zu6SO?=
 =?us-ascii?Q?/lC6yxzFSt1nnUjwhcZ0Oyw3QEbi/l/kOFnEQfzN6nYvuAC8wdzQAvgPK2y5?=
 =?us-ascii?Q?sad7oHmVLVW5rTVTjQbimc1+vSslkpOPCspxKZKacMTc60dBZ8dH5qPTj6Gt?=
 =?us-ascii?Q?hbfqWuRyZI8ruyL6eiODB6YGYGACFiEX8B0U32uteeWzxjyUkqqYzrRrE4yw?=
 =?us-ascii?Q?P8iNeKv62gAZdkN86U1wnLgeOo6HBOJztbtf6zgSkVY1m9s+E2m8CgMUz0Be?=
 =?us-ascii?Q?S5bTva98kg0XvZxZVIiAqfEnMaceeBBnV2yMAeZdj2Cia8jeZx8Nnp7IylD2?=
 =?us-ascii?Q?PZUbv/Nr3fVfhbK8638C4bLkQ7Mi3rJ8rGLIrFKeGA3VMBIn1sC3g/AU7Nrv?=
 =?us-ascii?Q?RRq80M/nVxtlNjshYLoMWb8O3K+f2Wcmckzarh9agonqZYIc504yqnjd5OPL?=
 =?us-ascii?Q?rxFi2DTgu/8bpPPhLfCFYLgO+EcTrfJ9JIZpiStW+BBjIOMejIh7+tN7kfNy?=
 =?us-ascii?Q?QPv9LTNu5yDsT9lVUAWS506Jre5evZ3QgiArC7hpAnaXkDuiFXsDfSm3XgKk?=
 =?us-ascii?Q?Ss8c78sinQBRvoyYHg13ThtmoOnWKp36EfPtoUzib2Uq03G095Feco4jKX55?=
 =?us-ascii?Q?+dju0cwe43Ark9WWMSJsLRlQiBa2IX9uQ5wzI6Kupvs1wUsvI1BUK40rX/rw?=
 =?us-ascii?Q?ixzlKBaYVNSwyrH4u2MVJsxtJMOxyRyjDls0YQKpUu8Bj9QeT06VXYc+e6rr?=
 =?us-ascii?Q?R3PsC2ysM+vN6rnhFWERbBnuUoH6nYpz3MYy1EGBgIBeGlcBv0u/sPELVxxv?=
 =?us-ascii?Q?fpphVCvm75oacPIrPKJvh4no0hXEY0ZU9uCGr/wg+x1ij1nrQyRtSIHE1Brk?=
 =?us-ascii?Q?x30ufFesY1VXPkoHsIuSM6BOp5oT7r9YU5/MFAQMcG0ImQlTLh7z0G6ZIPpu?=
 =?us-ascii?Q?f58XkVpILi1p9110Non9wQE8BJeBZx0mxJEqdWThbHcHrJtDmNaX8hqtWg1T?=
 =?us-ascii?Q?aMUX8giMUUcUQeeBLOoI2foT6719z46NVNCQN8O3NIyuz+wdiInKEglHT40r?=
 =?us-ascii?Q?Kero2q+OhhoDvMH9MTV6ymj9UzVPbVP0+ssfSn2dWduW+NiW7RLR03Zy9rgM?=
 =?us-ascii?Q?9LWVLchk1EuI2Gzs9AvuWqdKOVVU4w85kHeegVj8bV13Uz7EkhSgCJQ60sZq?=
 =?us-ascii?Q?NQ+TdvTS+ZmunAggZQ1RPSEWcb61FKBvVda6WY4tx3Au9LyyxJUGYEOg82AI?=
 =?us-ascii?Q?pq9qYbrxX68cd6qLtpCRv3Vl19kHwGYlcKwOPYbqQS+pY0aeogArwGzTo4kR?=
 =?us-ascii?Q?9F4OHqxfo6EpeOJEZJliv7Z2Sc8/63AtFvKUg297QGpjcHxfm2EeUX8yjb3J?=
 =?us-ascii?Q?n0fPrx031Yibso3NNrl16Ax1BlwLPCIeJtMosQpj+aF/SUGKZlTIPT1ldZ+H?=
 =?us-ascii?Q?Od1OVU1kQGUmFeA9QudYR/Gk4CYHcwvPZcBdNHvN+6oozVtyFjctbS77Pu4L?=
 =?us-ascii?Q?5ptEZMw/oSiAzGRcpPy6EbZDreIjfP4VxiSstE4Xx0DHcY+JnAluZRNctYwP?=
 =?us-ascii?Q?7XPUrM+fu2Xetwe+9wKDD53uDUp2hz2cG39UIIo5xHesl0hwQ3exlwUdhRg/?=
 =?us-ascii?Q?CxMlI7s9HArhg3ftNz8YziAJAOdG9BJMElfdbNXArxx9bp9mlQ46zA6cTY80?=
 =?us-ascii?Q?t/bW+XnSSxe5KHOr1gGPsbEUnncyhX3/zvgJCF6zQZsnKq6CxY5ni7qHbEOs?=
 =?us-ascii?Q?F8UBVcomlFkojNQbgzMQuKqEBYUwmET7gYwrr1LJ0vOa0fJ7PCm5?=
X-Exchange-RoutingPolicyChecked: ImeZQXqBdBx5ej5Dej9WGhZd7MEskbQfw/UQ49qJp1CkJYXOKim/+wf7ua9PHCz3A9Q98lApCE1Zm3C9o849AhuEtVp9ABIL5kGiaVvaztYaCE7j0nOtKLsSE+33bmNj0JDUUeCdbyNwosLKDUALgGIScpzXgNvRstWJ8evshHzPhkvAbH/1Dmu4US0CDC1oR59rcsXEcGz91vUXGd1zdoFompYfxfZipWYUT814yaFLgNgD28oydjAgkyJGCJCrbwH7emjwfHtzLomvWiek6l0qXkshHP+iSwJ1fQBS/N5Nz1l5T41ds8pUMzXVLt1luLXglvTvGeamZFN7Swgzlg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f02bad6-8f7e-4a49-f9a3-08deaa5d74b7
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 04:19:10.1398 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MQ3LDBEAbZT3mQMzY6RFjV6kciwTRC1OL+1vY8uC4sGz/DIHDRJJnJUCpOB7R4QmCRdcSu0B5pDU0/69zBBjeMHI2uv5BG2izVlePneBzbKAwbzOfcGv+/Hw9le9VAAt
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

On Fri, May 01, 2026 at 05:53:40PM -0700, Umesh Nerlige Ramappa wrote:
>Add a trace event for multi queue timestamp capture.
>
>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>---
>v2:
>- Split traces from original patch (Stuart)
>- Print primary lrc in the trace (Niranjana)
>---
> drivers/gpu/drm/xe/xe_lrc.c       |  2 ++
> drivers/gpu/drm/xe/xe_trace_lrc.h | 27 +++++++++++++++++++++++++++
> 2 files changed, 29 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>index 023202be5d52..6bd93803cb7f 100644
>--- a/drivers/gpu/drm/xe/xe_lrc.c
>+++ b/drivers/gpu/drm/xe/xe_lrc.c
>@@ -2711,6 +2711,8 @@ static u64 xe_lrc_update_multi_queue_timestamp(struct xe_lrc *lrc, u64 *old_ts)
> 	*old_ts = lrc->queue_timestamp;
> 	lrc->queue_timestamp = xe_lrc_multi_queue_timestamp(lrc);
>
>+	trace_xe_lrc_update_queue_timestamp(lrc, *old_ts);
>+
> 	return lrc->queue_timestamp;
> }
>
>diff --git a/drivers/gpu/drm/xe/xe_trace_lrc.h b/drivers/gpu/drm/xe/xe_trace_lrc.h
>index d525cbee1e34..fdc77102fa77 100644
>--- a/drivers/gpu/drm/xe/xe_trace_lrc.h
>+++ b/drivers/gpu/drm/xe/xe_trace_lrc.h
>@@ -12,6 +12,7 @@
> #include <linux/tracepoint.h>
> #include <linux/types.h>
>
>+#include "xe_exec_queue_types.h"
> #include "xe_gt_types.h"
> #include "xe_lrc.h"
> #include "xe_lrc_types.h"
>@@ -42,6 +43,32 @@ TRACE_EVENT(xe_lrc_update_timestamp,
> 		      __get_str(device_id))
> );
>
>+TRACE_EVENT(xe_lrc_update_queue_timestamp,
>+           TP_PROTO(struct xe_lrc *lrc, uint64_t old),
>+           TP_ARGS(lrc, old),
>+           TP_STRUCT__entry(
>+                    __field(struct xe_lrc *, lrc)
>+                    __field(u8, pos)
>+                    __field(u64, old)
>+                    __field(u64, new)
>+                    __string(name, lrc->fence_ctx.name)
>+                    __string(device_id, __dev_name_lrc(lrc))
>+           ),
>+
>+           TP_fast_assign(
>+                  __entry->lrc = lrc->multi_queue.primary_lrc;
>+                  __entry->pos = lrc->multi_queue.pos;
>+                  __entry->old = old;
>+                  __entry->new = lrc->queue_timestamp;
>+                  __assign_str(name);
>+                  __assign_str(device_id);
>+                  ),
>+           TP_printk("lrc=:%p pos=%d lrc->name=%s old=%llu new=%llu device_id:%s",
>+                     __entry->lrc, __entry->pos, __get_str(name),
>+                     __entry->old, __entry->new,
>+                     __get_str(device_id))

I meant printing both current LRC and primary LRC (otherwise, it won't help).
As I mentioned before, printing pos, may not be of much value here.

Niranjana

>+);
>+
> #endif
>
> /* This part must be outside protection */
>-- 
>2.43.0
>
