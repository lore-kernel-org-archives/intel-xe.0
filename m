Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D32C4CCF9EB
	for <intel-xe@archiver.kernel.org>; Mon, 27 Oct 2025 19:53:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9352010E193;
	Mon, 27 Oct 2025 19:53:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nnibFxmP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB64110E193
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Oct 2025 19:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761594814; x=1793130814;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=AZ9U8inkkVR+TWR6JS9Q2dCj6rHcqUVRYwMWlvhe5lo=;
 b=nnibFxmPRK5Dp551zCvAngRL5zlfBDKdUzwpezhXNcAcI3JZuTDzD/xm
 BRfxr47rbiKHQzHvr7kKmINEsWQruSetRChs4rAjq6wV4qInJJ+DDtK8P
 4EaRcjfijV+uCOviGKu46BBwuX58asIRUvHBSiPua9U1G74oDtyhwhwoJ
 1/wMek/5jIiknMdTvwMyGmCk+FvD6l8R2Frxpa0XNBsbApmlytwfysXLg
 ejdvJWbcID3v+wZKYiGmhO+ru2NrK2Q/m7kWn2YCPzBazeqn5pvBl/mtg
 mM8D4TZvow4eE8EyP7l+ndIQPL5RJoaEuUM1HuLWVxY02hohx8+WLTdUK w==;
X-CSE-ConnectionGUID: 1QugGETTSQ+JQh9I6wjDKQ==
X-CSE-MsgGUID: B1QyMqAzSKauuPiB2POs7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="67550947"
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="67550947"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 12:53:34 -0700
X-CSE-ConnectionGUID: 76tg9lX2RMWZYfAzsUU0tw==
X-CSE-MsgGUID: FJqcQs+8TuSl775wN+fzNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="185036245"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 12:53:33 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 12:53:33 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 27 Oct 2025 12:53:33 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.19) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 12:53:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=igzJyDhesuL80+s2xM6ry0o4KbosPavDetJcT915k0anqpdI7NyNV9o9/6Ftp7fBNi268en4uPd93biggcQ93o0q4OWJaRvkp0s0vAM8ytMIZ0muWcEdJ5PZaTZgqntKVcfMTuu3NQuMkgSm21yyie5nZJuRgkZ4547/eEL0FvQy+qCQ+prTKZ7hOC4V5MUmV8KQB7ndipJ8c4yKibHvI3QcnHwIivOeGPXRBND7qZEaPxkayowy+JKB/OYy5AnOfFvrhzLVBcSwXVtKkNPtdPXYNkCeRZh2uXk+wa9Bc9OIyBOLuZLNkWKj1PnMr+eNzrpWGgU8/btLSkuV3tG/iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cyRyoXKfWyHblzgn2Qo2fBODQ48unjR8pX83AX1EWyE=;
 b=CxsCZtv/39dCdONWtlU49LbBloeDgaPIUYLV8d+AXMy2xG3GYeo6b5Z+Bm9qhmfKhCftcxLYfatDFeBnvPL9AALAz155y61+R55OjY5tR1u26D/dChKg9n2D6yMS8HwLS6G5s80GSL4+f2CpxAMU4p9/Rx/6WbEvgPJOodfhSCnrjSlDdnGKJb6KQt64r1S0fQG9F3ARQVufMpfL4DlfOKCISz89dslpbH2Ju9vI5sUBDCOom6Fq7zCd539IOnGjd4VUDR2U0Ue8VH3tS43NPNbFe1QbnOK6FwFaXsQd4Xo1ZLWJGAv6C7A2Kuz4wvzZf6HD/pi9XNGgK/PY2yO4dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA3PR11MB9228.namprd11.prod.outlook.com (2603:10b6:208:57a::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 19:53:30 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 19:53:30 +0000
Date: Mon, 27 Oct 2025 12:53:27 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Shuicheng Lin <shuicheng.lin@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <stuart.summers@intel.com>
Subject: Re: [PATCH] drm/xe: Limit number of jobs per exec queue
Message-ID: <aP/Nt8TKVfwhfoVn@lstrano-desk.jf.intel.com>
References: <20251022181036.2868787-2-shuicheng.lin@intel.com>
 <aP+evyn9qN1iVJDK@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aP+evyn9qN1iVJDK@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: MW4PR04CA0329.namprd04.prod.outlook.com
 (2603:10b6:303:82::34) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA3PR11MB9228:EE_
X-MS-Office365-Filtering-Correlation-Id: 166ad086-04b4-4929-4cc4-08de159280df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?AWyZepk+4rWPb3BB0xCxzSt90jjtwyBUEsT8yC4ZaB8Kga5LXmPwAGjNJJi3?=
 =?us-ascii?Q?z7RZjPhBE/nNwVhYAU3Sl0Eqzho2WfuXzVTYVUN7ALlFODv/IWvpae5PunUb?=
 =?us-ascii?Q?jOisvV1b5+IUzFFlwZX5eJjL+AkmgS9qBYWTNXQKl7aA+nZFdzUS0Ik2aQSi?=
 =?us-ascii?Q?gi10DaalB2PHhgaDwAKpeNuOIEfNPGqDinwLOFdD9wd/XHJmJm/xtKbJ38Ad?=
 =?us-ascii?Q?gIJ+4cl1BwIM736UqtydkNIxjjLjuP7OkfnLkUNJgtPLPJ2Ru/WHMnGb4GI5?=
 =?us-ascii?Q?DDcn0Y21GkeyHSPb8nus94fMffm4jKY3rHVYTz8hHDm8wfl8ZBFv5JnMOfpX?=
 =?us-ascii?Q?eX1+HGiojxujv6SOukzKuOdGd3H9xqOoydWh/MXYxByILa+BavX33dHCTQZk?=
 =?us-ascii?Q?s2Dx9fGcXzvtiZ/VbmVE2Fo1WqNmqyGEOTT/WHwM2K3oq7FWKU7h40sw74ZR?=
 =?us-ascii?Q?iDb7+zqCm/euwrTv5ZWVJ76pxfwH45ebk3ns4V2w9KHXgUT6I+E7G7D86siU?=
 =?us-ascii?Q?5n1oAQY6IKg0/gEm1wU2qHl3CLPkINJvCsXvSjPvPnUxxoVs/AeEyxif+Q76?=
 =?us-ascii?Q?vEHlofOOhSVgpC9JfZqXFJQBe5YFUu8ows2KZZuCypIE+V+PY6EC0N0+yGJM?=
 =?us-ascii?Q?+BdfiW8KetuwTnrquRhTN+HzmZYJkVFRVmNadNWmlrBbrvP9C6PzPlY+7N0X?=
 =?us-ascii?Q?XWJAaypykPYauUUzEbmXT8mGDfEcGoKqHTrnHp21zWnkmSC3z9Xry3MKINGC?=
 =?us-ascii?Q?IUCGwUWnC5al4KAdQvBc5wYuUgAjGvwxuxqOIwQDZV/phuFPqH3d2Bbrb2bw?=
 =?us-ascii?Q?7jkNasc429lYW2AfBEWSpFHXKgwt2tQPYZ8L3KnDNY/GK2x7evvitt0kjCVX?=
 =?us-ascii?Q?Nsba31TeRxzibn7TmAHpZDHQA7ulkc+2jZHhHM+VtFDZdqLD1XKuAvMvaa8v?=
 =?us-ascii?Q?wTsom1JYW9olgCYxdQDWI5Hf1dD2ZyrlNWWIvxS74I2rWXK0jvXoo7TQeJet?=
 =?us-ascii?Q?0y6HtvQ5lQhM3iMOZSxn+YHQtcYFNDYXgHdJrWdVniSlI5t8ab9YINwIHW2p?=
 =?us-ascii?Q?CgsF+NjMu0BVyK0LuoyzGazs3soY5Wc7dWj01ua/DK37LiWTS2UOqm4er4X2?=
 =?us-ascii?Q?l4KHXWxS/+TDdGI4RFYiPYsVKzJBamax8CzBzRL4qptN0vTQkuelqDnn0QhV?=
 =?us-ascii?Q?53PgrkJo201GwR+AUxRaYHsHtYCcWeVYhTgNkqXoD30wOwcADVZbxe4TAq52?=
 =?us-ascii?Q?48z8odfO/qOIIBWSTZOYYouJ/Ry/lUtUWB6Xa467TllZahZa4F0xXxOgVyz1?=
 =?us-ascii?Q?iKitIaHX+1jjzC+u0Ecbn7essIaSj9l/Wk5cq49NXOv39AymQWNfelcW8Ms7?=
 =?us-ascii?Q?XTF3JB32HztYFphz9X6K3qz8TSusDW+z8gxNBP/rhA1/zUjmNatVm9gxSpQn?=
 =?us-ascii?Q?SHeK9W/Y+ORTo/c99VwUZRMHs2Inrwod?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qf5U7TVTlENAYDdtEis7JZP5Gb3tcShmzMVCXfv3T4OOvKxboTthLqCwJEEH?=
 =?us-ascii?Q?92yEiPlCgjnlu0tUB13EXXXMrc2S4TV/JAHVKWEVCSpx3H0oDLg/zboirkgS?=
 =?us-ascii?Q?AbCQzsMlukJu9c62VO0VZRdKYyZVDTq/B43scCeaDQMK/Dora1kbsP3Orujn?=
 =?us-ascii?Q?wGpdrN59fuc3Bk3DnLIFT8mD4yQszwrvXQqHnPxkYZwGonnV+bTJQy4ZwZVY?=
 =?us-ascii?Q?5J93SPTyBUC0jxAHWpP/7gP4A8OGZbw8uo1Mv4WDvaV4gtSUXmH3EtHGrmq/?=
 =?us-ascii?Q?eJMj7KSGRkVJQjx4be5DHAnUN9XefVtv3/LcuEiIkU+PA+ojMKbwNn1frHxf?=
 =?us-ascii?Q?scm6hd9YnTWK16kDcBSoo8soSm2x6DfOmCMmxl2yvfjWy01Tayqb7vZx4LFg?=
 =?us-ascii?Q?C1DFL4t37HAT9LecDPl2RviWFXghQaATK2IczOVTT1d8V+keukAEX4up39q9?=
 =?us-ascii?Q?MTBMFecMKB+hsRkEGe/3Vcmtydcpa2UJeyX9g0QE+Z1hVUSr8B9OTEnoM+BK?=
 =?us-ascii?Q?TdMktYXX4SNUrHLHlBIEWm1qTIIwU+ZysZ14UifralzMJAWXK6NcAigdyhPU?=
 =?us-ascii?Q?TkOWT06sIgNY4V3VsJPrBKZ2qL/M69o1N7YlweKGvqsu4NAXW9l/YqboxAx4?=
 =?us-ascii?Q?pz+kn9ENTttuqkNTuRMun2WUV96ATv33jFXg3wgl3Zh7I6Omvh8/TD7Q2jln?=
 =?us-ascii?Q?KV1ADsDvzkc3P3HnrrK6r0zO122AtkElrrebOyHSlUQAViJVXMQToVkJCRty?=
 =?us-ascii?Q?GzYBMr73pD+4kp5qf7iiGLCnpi+UeT02JzdsGyxlXH5rJ/ApXcGulI+heibl?=
 =?us-ascii?Q?bN0t1cbU4aEEMTWhampPOpS8A7NRbIcTyRKIM65VMJpbmiB9cR3AWic7gCTU?=
 =?us-ascii?Q?g07wjfbIXh27lQSnIqymsqhnhzZxRjgFSnL/WfLQdfsp/ms4YmFGrVhPpykJ?=
 =?us-ascii?Q?MbfIgtOfjlwOxXUwh2i/K+vPONfw4hXAyLDtIE1G6EePo3MN4y7aEwbnvPqg?=
 =?us-ascii?Q?QtKdtKbx2cR4OrAZ5GbZyNrv0mOA54q0U9pGX9jSgAbVHNexsTgI2lysnTRB?=
 =?us-ascii?Q?KsQkzvFs01TLrQJuGoeVDqRIkotkZPNdgKqpt+d9KyPFBOWK42tTRnyY+SEp?=
 =?us-ascii?Q?jk/UWXwezCNmPrKUZ3VsnvRrK/+vrOVKZGb9n7R8vnR/wJcbhV56QeeqUgLS?=
 =?us-ascii?Q?2SlGpBhViYGUgolzocXTFHj/HZBnhGfa3k2fRwsbl+hwYEDx75yQYMAcL/e1?=
 =?us-ascii?Q?GliAQSjGMKBaQp6WBXMFoOT6h57oPJLwYLbc+4mJRSktio2yWQT1VdN8R6Kx?=
 =?us-ascii?Q?Uo2pvyVAg09cTR4GYzyX2OE8/TnfGYRjZr6wUXrnbeQlZ6gZlr+VKKl/HKFe?=
 =?us-ascii?Q?VScMN0XN1cCm1QW3BabeGUNBH4mAgJ3STXwbfnDSvX5O0vgJUGZnvRQtlede?=
 =?us-ascii?Q?M7/XQ9g3neCefR4lTa8vGfFsyDnB1cTwJVNEuBkZCpieKunIm4u0N+jIco9U?=
 =?us-ascii?Q?vpvr+ItoxbKl6UNjGRzRs8qjr7R9p7ZkRHOetb7/qYYytdf5MjyWR6XNlPzr?=
 =?us-ascii?Q?aSmifMjH4/bETF1jCVJJSK4eCgiUsntjpuDmfsi8x/xnkkRex1z+fU6TKRGN?=
 =?us-ascii?Q?Uw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 166ad086-04b4-4929-4cc4-08de159280df
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 19:53:30.6976 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uvnJG/q4us8o89bmaZAyxu3fGYHWLDVI+nQqt/yv306SuRg5iUSuFDCqdgqP793lxshsAcxzxlwtkO6xZaSZpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9228
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

On Mon, Oct 27, 2025 at 09:33:03AM -0700, Matthew Brost wrote:
> On Wed, Oct 22, 2025 at 06:10:37PM +0000, Shuicheng Lin wrote:
> > Add a limit to the number of jobs that can be queued in a single
> > exec queue to avoid potential resource exhaustion.
> > 
> > A new field `job_cnt` is introduced in `struct xe_exec_queue` to
> > track the number of active DRM jobs, along with a maximum limit
> > `XE_MAX_JOB_COUNT_PER_EXEC_QUEUE` set to 0x1000.
> > 
> > If the job count exceeds this threshold, `xe_exec_ioctl()` now
> > returns `-EAGAIN` to signal that the caller should retry later.
> > 
> 
> This patch looks correct. One extra suggestion - can we get an assert in
> xe_exec_queue_destroy that q->job_cnt is zero?
> 

This was sent to wrong version.

Matt

> > Suggested-by: Matthew Brost <matthew.brost@intel.com>
> > Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_exec.c             | 5 +++++
> >  drivers/gpu/drm/xe/xe_exec_queue_types.h | 5 +++++
> >  drivers/gpu/drm/xe/xe_sched_job.c        | 2 ++
> >  3 files changed, 12 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> > index 0dc27476832b..722a5ac0200a 100644
> > --- a/drivers/gpu/drm/xe/xe_exec.c
> > +++ b/drivers/gpu/drm/xe/xe_exec.c
> > @@ -154,6 +154,11 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> >  		goto err_exec_queue;
> >  	}
> >  
> > +	if (q->job_cnt >= XE_MAX_JOB_COUNT_PER_EXEC_QUEUE) {
> > +		err = -EAGAIN;
> > +		goto err_exec_queue;
> > +	}
> > +
> >  	if (args->num_syncs) {
> >  		syncs = kcalloc(args->num_syncs, sizeof(*syncs), GFP_KERNEL);
> >  		if (!syncs) {
> > diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > index 282505fa1377..5f3219acec3c 100644
> > --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > @@ -162,6 +162,11 @@ struct xe_exec_queue {
> >  	const struct xe_ring_ops *ring_ops;
> >  	/** @entity: DRM sched entity for this exec queue (1 to 1 relationship) */
> >  	struct drm_sched_entity *entity;
> > +
> > +#define XE_MAX_JOB_COUNT_PER_EXEC_QUEUE	0x1000
> > +
> 
> I'd lose newline here
> 
> > +	/** @job_cnt: number of drm jobs in this exec queue */
> > +	u32 job_cnt;
> 
> And add one here.
> 
> Matt
> 
> >  	/**
> >  	 * @tlb_flush_seqno: The seqno of the last rebind tlb flush performed
> >  	 * Protected by @vm's resv. Unused if @vm == NULL.
> > diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
> > index d21bf8f26964..37f58be7cbcc 100644
> > --- a/drivers/gpu/drm/xe/xe_sched_job.c
> > +++ b/drivers/gpu/drm/xe/xe_sched_job.c
> > @@ -146,6 +146,7 @@ struct xe_sched_job *xe_sched_job_create(struct xe_exec_queue *q,
> >  	for (i = 0; i < width; ++i)
> >  		job->ptrs[i].batch_addr = batch_addr[i];
> >  
> > +	q->job_cnt++;
> >  	xe_pm_runtime_get_noresume(job_to_xe(job));
> >  	trace_xe_sched_job_create(job);
> >  	return job;
> > @@ -177,6 +178,7 @@ void xe_sched_job_destroy(struct kref *ref)
> >  	dma_fence_put(job->fence);
> >  	drm_sched_job_cleanup(&job->drm);
> >  	job_free(job);
> > +	q->job_cnt--;
> >  	xe_exec_queue_put(q);
> >  	xe_pm_runtime_put(xe);
> >  }
> > -- 
> > 2.49.0
> > 
