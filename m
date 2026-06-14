Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52D16CD98C5
	for <intel-xe@archiver.kernel.org>; Sun, 14 Jun 2026 21:22:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 019C210E128;
	Sun, 14 Jun 2026 21:22:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XdY0R1SD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4104910E127
 for <intel-xe@lists.freedesktop.org>; Sun, 14 Jun 2026 21:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781472142; x=1813008142;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=GGmwTFqqcHsLXsE8jUbHhKDkoYsfLoUNhZ0kUbxetrs=;
 b=XdY0R1SDXiUHBBezGm1SsXlXot+p3uHYWviitIdU7EMAwp8DmXVYvnV9
 o6Qn6Ruz/pVRfGQ8OYN3WTtz+9nb+dKCRdDaCC1W40fgKbgmIFJkw//23
 qXdln8V2J/wtWNkiOhgis5AM1XYVvdbShOKQ837m5JmkoyjJkFlFwi6hn
 qTXO/nVRPTiDuZWf7eyl0muv3OBlJgCfgJEy+W4OBI5e+eFrsmxHA3v3A
 p/ySjZxnk+ZcDS2Ldt+P6u+GcfEEOy1SAG/QNU17qkfQg1izrtLGxL5S+
 Wq16Wa12R2eKJFOKeuAhbkLuBKQ8zA5Cf7GnFGLtoBDNVjJbJ++uwKYE+ Q==;
X-CSE-ConnectionGUID: poeCgDG1QOKJlnQDmcvwzw==
X-CSE-MsgGUID: bpvmG31CRSamnqCFTQE5VQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="107647588"
X-IronPort-AV: E=Sophos;i="6.24,205,1774335600"; d="scan'208";a="107647588"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2026 14:22:22 -0700
X-CSE-ConnectionGUID: EuclIWEeRSOAZhoaUB1AkA==
X-CSE-MsgGUID: zc+dX6CCR0eSG1iJPp+HBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,205,1774335600"; d="scan'208";a="252393892"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2026 14:22:22 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 14 Jun 2026 14:22:21 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 14 Jun 2026 14:22:21 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.59) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 14 Jun 2026 14:22:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HGWG6CKpEmHWD1avVWozyKMGH2TosQJdEyn2I1RIiJjYBXPEbteHw9SwDz/fqyk8DPkpXUVXN1vpJqsduSfJsi4zE7JZ7YRyzeqfB8JFtM8e8TlhVcnslQA8cDA2yZ6vTo+b/6A4kzG8QKfYjHmpk3VsBNEaKZ92FyDANEbYITr12bzeCQIrigxglMAAl/080lYiiqpfaI1kA/Zk05UZdraVW9dFXH62BSwQO9WPgkYTg5DZN2QxaIAocUmZWYDoZ77CxkRijC6SM71aJQEqWknhYeUv2BJe8wFwcxalTLZPXLIcYdHNzTSPxWnmkAayE5gTkb0LKElg84jBlWC7TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xEqvaepf9vFecgZ3ANRTaEoQmLblr0J128lVcjdCb7I=;
 b=nk33xnIWLw3ZkZfWX0kRbrXz6tgBeZZGJInsjEbx43bvJHmZwlJKIL3xAXRbBDFxVDO3QWkWlL68nzH5IH0H7mlEYPHhb4otryWtbgs4S6tlqajJByPTkuBJE/7XxBAxwB+2yH83sMENkNuJsFbWLbllNqYzJoPMdn/5HBz4tn3qF1E2FvrGC4kqwqm0I5LzuBipALQ+ohhV2VCTOIpiSRChn89w6aGQpqRA5ZIPPOFYflqOkr0m6O363gbr2ye7awPYEorQctxNK7KPHH+pOdSWin9c1FAAJjd5AwSbEFB44LsV4zX2J2sJ63buY6C8FYNmtq9GS6eDTgemB9L3bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by SABPR11MB9964.namprd11.prod.outlook.com (2603:10b6:806:50c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.16; Sun, 14 Jun
 2026 21:22:18 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%4]) with mapi id 15.21.0113.013; Sun, 14 Jun 2026
 21:22:18 +0000
Date: Sun, 14 Jun 2026 14:22:15 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: <matthew.brost@intel.com>, <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH 1/2] drm/xe/guc: Add suspend refcount to exec queue ops
Message-ID: <ai8bh_WTv2UwaOEX@nvishwa1-desk>
References: <20260614211944.1268917-4-niranjana.vishwanathapura@intel.com>
 <20260614211944.1268917-5-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260614211944.1268917-5-niranjana.vishwanathapura@intel.com>
X-ClientProxiedBy: SJ0PR03CA0221.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::16) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|SABPR11MB9964:EE_
X-MS-Office365-Filtering-Correlation-Id: a3d6510c-85e0-4f7f-8e94-08deca5b03a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|366016|18002099003|22082099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: JQk30UJrIYNLuT7BAX1+VLNefH9jyUF/1G1pmk749hQv47XV2ZSr1DpsxOKsrrgmsDa0trDiyf0NwUhnFzt9DeZ9nv6G/X0GhaNAMA05ZSl/xulL1iX/z6PyhBruILLsn9qGqoQTBeSSkL0u3nsk0zMLes09CJl60oCCAv9+eQ+P27ziDfN54t3bzl1hQ2VwfAVkoLJDqImNnt235kTu77DOLMOMSVaBi6mviBXvW+7/mT0imKs4N6RRm0xMDtp2pnnfP0q91s7v2j8LoZdafRtNlJ+h9++FdBvnSBH6trdOGxOW9VXIDlqndAKJ3wzDVffW86OHvu6dAgtD+vMhNOA3kaiWE7hG3gYjhCP4dwwd73ipbmnFJNUV6j2IoDhMvMMbobAo6+Vj4nkMImcsN633CoZI0HKaruPmD5apcX5Y+E63Q0L65CZnY/Or6AydPvEZY+KCUOtcqHqsVk9MNrEmk+3DH7PVI/qPidffXHH41NhKYvX0EPe9iJy6U6nFz1olJN1clbjIS/M+XpoNwu38iqzXnPrDS+hjmG0qbQPE26EZELuKmVGnr4IhTHEljMNXQ8BX1DiwlQdqgtDnKPakC9kCVbWjzMxWm1b340FIgRSxsjgqHggbMkqdmmM4aEzdidzUgyECacEc9Ye3sA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(18002099003)(22082099003)(4143699003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?RjMHla9GYvLUjV4zLyOcm4gL1NTbv5LSMQG5z61fL5xdK+P0G7q6Y3cuK2?=
 =?iso-8859-1?Q?Of6oeiyHljNHBVHiCfCbD+6KRRaU5VbaPF2oGw/ymdKZOXj1jKDsCv7eUZ?=
 =?iso-8859-1?Q?eU7pCxKX9cNA/sQnx6CqFr5BZIKx+H27xdQs/vyvysi2Z9IkRFTquzqrfg?=
 =?iso-8859-1?Q?5v4ai2ili8TkjapsWZTWYsKeO7uyx5ttZOMZkfOtci8voTJS+JcwxxKmXI?=
 =?iso-8859-1?Q?zsp3TqhFjL4s/UQhnmP/RkEjXIly7pOkNM4G6j3Zd01OmPeyh+u1L0vOD+?=
 =?iso-8859-1?Q?d/G6jF0ZDtN6Ypp7JJTMIBxe2TRcnAGvpIIVoN4/Dtu4W1VBWDiQ7uMuh1?=
 =?iso-8859-1?Q?anCSQwPwngmSoya7iYPO5rRReM/vm6NDjKpBefw9Uv+nLdrUSFvtVRGfba?=
 =?iso-8859-1?Q?lo8eGHkrkvOWh93C4kLhIuyyZcP9w1nr5ZhzeDsG+z+30SNMP1VOXZGJ/G?=
 =?iso-8859-1?Q?H4mSpKyYkwLkbqj5OKw7R/pnF5iLrswzk2Sj9iosCF74XVb7pOjMf2/FTn?=
 =?iso-8859-1?Q?yhmohyO82Tt5dZf4ww4r8g7QPDlOO8qB2DILIDSJ/qqoLL25iUpkruj/SO?=
 =?iso-8859-1?Q?auxVsmlmtMla5NpahqhyZsCmhMs/qoTdFRmRX0Z2goYVKojhHU7Sa06+7F?=
 =?iso-8859-1?Q?/101F6mG64NIJ29aaIiNABZZK/PdNyeVeVIbkYPfYxNJgvME44IcciDg/q?=
 =?iso-8859-1?Q?Q3BBbLFq301eRO21GnCfLP2mYTgNzaa+6VOnZJ0Hf5jvsU9VpVL7dFsTen?=
 =?iso-8859-1?Q?VHS6GgHcK3TMCs6gIGfsruxsQxRT5PbfE/3Hb+Oj/6b4j6blrF9wCU1Js+?=
 =?iso-8859-1?Q?dA1Oi3nU4xQH3XpOVzSavpFH1ilpU8oMY0ivrcXkthkIilcYIMWY7iQiAQ?=
 =?iso-8859-1?Q?w34N7npLspu4L0ePoTGUMBzdBtuX0F1Y/ym9V1wr5kiAJt1hfPsvImYkOi?=
 =?iso-8859-1?Q?k56H8V69EQaNuZ/fuoCSZFDOmT9yZfnB5nDJqyehZrY8ZHDB5u4jrVK/re?=
 =?iso-8859-1?Q?2+B+4csmtZNS4svaYNOV1wVj6mQh6/ACqgUVGmbN7epL+diVY5g3I3O/9C?=
 =?iso-8859-1?Q?LU4ufUL37+N8SsVQve9gwzf6A9hh8V2SJ5hLj/Ge1rJRi2/WkqksDBYVz7?=
 =?iso-8859-1?Q?kGyAlpwqPvSgFnO5akVEvtS475tItw7fFo4CAp19QnfBgVY2GltQtMWhTU?=
 =?iso-8859-1?Q?AcZbYOLiRosYxWZp4jT7yXLRN+sButdD2R/zqdZwnOH4Gxrk5q2k+3fTZz?=
 =?iso-8859-1?Q?5dO9ePqIYNNNOz5ACbbCDqWeL8E1H5gtL0SwNzMzSrprbbjmRkVjA205ZR?=
 =?iso-8859-1?Q?CX6SKgQdcBojgvuEngYj2EB38e7nZ5HXUUqASC8lHasziEXxKFRghregJX?=
 =?iso-8859-1?Q?fif2NAQ8NiVTpn5TA1g0PmOik/F3F+6fBwgu8BE1uv3fKfwCYiZ7iyqwx0?=
 =?iso-8859-1?Q?iSvQpBtSFmE/84UC0LIL4x7Jr9jVXJ8S6oDKYWr/mZaYsB7AULL3rtfydH?=
 =?iso-8859-1?Q?FQNWLeGco41M+zRAkx9MizgLthNPq1vtsSY4GH++yCvxxPbJCJS/b8EGKX?=
 =?iso-8859-1?Q?TMaJFE/tVWzSturQRsVZXIY/qzm5RI8VexiEeBHrVhCQGLQeUD071qGiXU?=
 =?iso-8859-1?Q?7MfnxSO9Y8ZyQS3341VWztO3I0X0c9l8IdN5f1/LqY47+13McieRa8UZXa?=
 =?iso-8859-1?Q?UKl5mGN3ZD3/pFZJBJ1j0OUIc4VvTJEqWHG3k795VBchk3ymvvvx/m60Bs?=
 =?iso-8859-1?Q?daMYnC0DCefl4Wq6+ns4R2w2zp7ht4lyAOtp/medv1o0tOrjjWHo9HC23L?=
 =?iso-8859-1?Q?+iL9MycwBNdmnitE3R0jvk9OJqAxCN/e+guNrUx8IlsCCtsa8IdA?=
X-Exchange-RoutingPolicyChecked: H9T4kzrBHl2AOA6Or930QKAf2uEt26UoasL5fU1yNOjaDhJyX+iFWEaYAoz3xZJN11CGc2vE0dJQWCEiduyIo5DoxywtUduY+0Mplrxezi29F4ENswjuszr07A+SrWcFBTVfddPpHByjGhym/K450CXw1deCCw2mecMKrLfCxt0JngOmZGpDc45lTGKVpfU7ugTACXfEeuUivyZA5hPzRaFWDtqnQaMA8wjoNU5yx/jqqbhdPsYuy7JYREkBOpKwg3UVJYNd+zAS48E3yQulfMbDZXRzkrq/Rx3prEppb2OxxtCL7H5EoiqqB95YQWQNYnLIEXEdjwlo7vO8+iR1zg==
X-MS-Exchange-CrossTenant-Network-Message-Id: a3d6510c-85e0-4f7f-8e94-08deca5b03a1
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2026 21:22:18.6388 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i4cTu4qz+mHBpK3ojU4VWs3L9z4z6JFQatwILT3hgxDRIoigdXCiEhGacwkQqWK53a21qOVAhdJNZhRathCcCy1wZqFyeaAqfglPC0qxo2n8ipwibsJEoXRstKj2NDCh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SABPR11MB9964
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

On Sun, Jun 14, 2026 at 02:19:40PM -0700, Niranjana Vishwanathapura wrote:
>From: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>
>Concurrent call sites that suspend exec queues (PM, mode switching,
>preempt fences) each need to pair their own suspend/resume without
>caring about other callers. Without coordination, a resume from one
>path can prematurely re-enable a queue still suspended by another.
>
>Add a reference count to exec queue suspend operations. A queue remains
>suspended as long as any caller holds a suspend; it resumes only when
>the last caller releases it. Each caller simply pairs its own suspend
>with a resume without needing to know about others.
>
>Assisted-by: GitHub_Copilot:claude-sonnet-4.6
>Co-authored-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

This patch is derived from the below original work
https://patchwork.freedesktop.org/patch/727811/?series=167032&rev=3

Niranjana

>---
> drivers/gpu/drm/xe/xe_guc_exec_queue_types.h |  7 +++++
> drivers/gpu/drm/xe/xe_guc_submit.c           | 30 ++++++++++++++------
> 2 files changed, 28 insertions(+), 9 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
>index e5e53b421f29..1207d51cf770 100644
>--- a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
>+++ b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
>@@ -49,6 +49,13 @@ struct xe_guc_exec_queue {
> 	wait_queue_head_t suspend_wait;
> 	/** @suspend_pending: a suspend of the exec_queue is pending */
> 	bool suspend_pending;
>+	/**
>+	 * @suspend_count: Reference count of active suspend requests. The
>+	 * exec_queue remains suspended while this is non-zero, allowing
>+	 * multiple concurrent callers to independently hold a suspend without
>+	 * prematurely re-enabling the queue. Protected by @sched.msg_lock.
>+	 */
>+	int suspend_count;
> 	/**
> 	 * @needs_cleanup: Needs a cleanup message during VF post migration
> 	 * recovery.
>diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>index afe5d99cdd8b..8803e70ae4fc 100644
>--- a/drivers/gpu/drm/xe/xe_guc_submit.c
>+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>@@ -2165,15 +2165,21 @@ static int guc_exec_queue_set_multi_queue_priority(struct xe_exec_queue *q,
>
> static int guc_exec_queue_suspend(struct xe_exec_queue *q)
> {
>-	struct xe_gpu_scheduler *sched = &q->guc->sched;
>-	struct xe_sched_msg *msg = q->guc->static_msgs + STATIC_MSG_SUSPEND;
>+	struct xe_guc_exec_queue *ge = q->guc;
>+	struct xe_gpu_scheduler *sched = &ge->sched;
>+	struct xe_sched_msg *msg = ge->static_msgs + STATIC_MSG_SUSPEND;
>
> 	if (exec_queue_killed_or_banned_or_wedged(q))
> 		return -EINVAL;
>
> 	xe_sched_msg_lock(sched);
>-	if (guc_exec_queue_try_add_msg(q, msg, SUSPEND))
>-		q->guc->suspend_pending = true;
>+	if (++ge->suspend_count == 1) {
>+		bool added = guc_exec_queue_try_add_msg(q, msg, SUSPEND);
>+
>+		/* slot must be free at 0->1 */
>+		xe_gt_assert(guc_to_gt(exec_queue_to_guc(q)), added);
>+		ge->suspend_pending = true;
>+	}
> 	xe_sched_msg_unlock(sched);
>
> 	return 0;
>@@ -2224,14 +2230,20 @@ static int guc_exec_queue_suspend_wait(struct xe_exec_queue *q)
>
> static void guc_exec_queue_resume(struct xe_exec_queue *q)
> {
>-	struct xe_gpu_scheduler *sched = &q->guc->sched;
>-	struct xe_sched_msg *msg = q->guc->static_msgs + STATIC_MSG_RESUME;
>+	struct xe_guc_exec_queue *ge = q->guc;
>+	struct xe_gpu_scheduler *sched = &ge->sched;
>+	struct xe_sched_msg *msg = ge->static_msgs + STATIC_MSG_RESUME;
> 	struct xe_guc *guc = exec_queue_to_guc(q);
>
>-	xe_gt_assert(guc_to_gt(guc), !q->guc->suspend_pending);
>-
> 	xe_sched_msg_lock(sched);
>-	guc_exec_queue_try_add_msg(q, msg, RESUME);
>+	xe_gt_assert(guc_to_gt(guc), !ge->suspend_pending);
>+	xe_gt_assert(guc_to_gt(guc), ge->suspend_count > 0);
>+	if (--ge->suspend_count == 0) {
>+		bool added = guc_exec_queue_try_add_msg(q, msg, RESUME);
>+
>+		/* slot must be free at 1->0 */
>+		xe_gt_assert(guc_to_gt(guc), added);
>+	}
> 	xe_sched_msg_unlock(sched);
> }
>
>-- 
>2.43.0
>
