Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAB40C2BBCA
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jun 2024 16:02:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EBF110E00D;
	Tue, 25 Jun 2024 16:02:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="elU3j3wN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBB6410E00D
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Jun 2024 16:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719331336; x=1750867336;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=m3Jx0S0NsLywlCG9K3qYVewQIx1WkO+WKXK0UY7lwWM=;
 b=elU3j3wNz4riHnx6NjwTgbAfR2YGU4Rf4uzb5eKCvRsZz2MsjxzfUi0V
 8aw0ui4+nJtZVRQLt09JdqyMWXE+dANC5bx1ElZmkls23LkoQq9GGbeyi
 fF1EJjPMBGlNitSG71lt1ovkTGnIry7dUfLBNJI7TI7x4cIxl9z/JMAT8
 Au5hBq4GcXZpzArgkSq37ClHH9e5rGMKWJum2DzVauAiyx7Ns/DkfwEah
 lHPu69gwD+6YFAoDSiR9G3SlL2CwX2ee12J/Lk6aTbsqkW2eUYi/sYmLr
 Jh/L+1Ykv7QvY6vVJii5h9tkVSdf0adTeUZ11zdJ7J5qirum96dIY/b/m Q==;
X-CSE-ConnectionGUID: bm1s9KCjQCuzeAm2wutriQ==
X-CSE-MsgGUID: gCkRn0OXTRGyqtSV2slgsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="16044220"
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; d="scan'208";a="16044220"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 09:02:16 -0700
X-CSE-ConnectionGUID: PW1DMSxSRZWQjJSu74g4vg==
X-CSE-MsgGUID: +AY530fkTUm1A998AS4N7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; d="scan'208";a="43512405"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Jun 2024 09:02:15 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 25 Jun 2024 09:02:14 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 25 Jun 2024 09:02:14 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.47) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 25 Jun 2024 09:02:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZyQJm9yM6rQvRdAt2HPbuSm8J17dkXrPgUXgzJdywN3ni6DPNZWduHimUADbm+WeJiN4F0mFDUIVV53GVH562FSks+KzDMiimnCVcqY3Uc6kSdsR8VMhdduIfrVOI1VHnz3RePCi/6+bzdhnYnm/hxWXSc9EcKuxmMXwtovyJqpqzV/n9ngmCtGKHZaxfY38/gMe/FBx9mZl6ySr5+VBToAoCuZJ5MkZUnaBBTOoDcP1n3Uxm6HNcewyM0U3LpYLIySnXmHPmghzTHYcuqQXqawT3A7PEqrw3Sv/xF6uG/F1qO/2oIugNNpoD5uhAmeb0on2gv7cPZm4EZe1d5b5iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TpntBIUTCsFq3V0EGYcxVb0VSc5XnQuR3gwtN4z3rCs=;
 b=oNjbamMCkmNR2f/kXDUAsSnjCrHNy/cBqQ4Cqr1VfzoTJ+d9n4njxIPOUgH4YPiBZiaRzVX5cAfs0J2Fw8LclpqbuseWGrQ2XsK0g+DQCmtrT7GyBrKWvxWa6bs0BxYdMIRQ4OG1h2l2FTy89v7rI4cYCdvvIn3hfsPUyNuQupvtbcd1vHKYYQoEscgsStwTXkOAQ6uFnCmCzfqN2z7a/kzG19n6vm2IQme+FcSSsneyE54hwWh1M6Wa/Q+RAz2HYn+l5uBeKIOoGQLGN4OJpwtQF2vEyucMMJ3TjuxISn60oBwi0eBQBuBzXRtkGLccKYZVijfEfHbcfD9IJybwzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH3PR11MB7345.namprd11.prod.outlook.com (2603:10b6:610:14a::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.30; Tue, 25 Jun
 2024 16:02:07 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.7698.025; Tue, 25 Jun 2024
 16:02:06 +0000
Date: Tue, 25 Jun 2024 16:01:28 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2] drm/xe: Add timeout to preempt fences
Message-ID: <Znrp2I/gL9/HKebu@DUT025-TGLU.fm.intel.com>
References: <20240625055120.3997338-1-matthew.brost@intel.com>
 <d7193933-69c2-42b6-86cc-3938c1b00624@intel.com>
 <ZnrmScq8KqFtN3eL@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZnrmScq8KqFtN3eL@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: SJ0PR13CA0192.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::17) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH3PR11MB7345:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ab0e977-daa7-4dce-f2c3-08dc9530295a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230038|366014|376012|1800799022;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2vnPwWxgCw8/H00CYCSJZ8Jium1DCCVPf9IIKw4TIVlXeGBAnsVPsXFumkOt?=
 =?us-ascii?Q?nHYkC6mE4O2z23Qb3zBIH55lnILVNNtTW0YDnehp9SQg1w8wi3LPwjaXUgQD?=
 =?us-ascii?Q?s70kF9fqNP+FzdQ/zG3A2mFWNCos0cmopRSvrWu4A/qh8Y9GU5/zdDFlzIhC?=
 =?us-ascii?Q?DyMY/v21bGOymWZqbwfkxsrAM/ugLpd92be8MhzWtuX+mzJd3mwRMYcD5B+l?=
 =?us-ascii?Q?XsVAjOzNlUr9SMNaM8ezmaeojrGjM2xgd3MuUQKk0KC4Y3/GhT+grWfJbY8k?=
 =?us-ascii?Q?AFRp8r2SL7tHRk5UdhuEIJU47IcLJhoFY/oIN+6sbaCTGTWy7OlOIUFHw6Bx?=
 =?us-ascii?Q?Hr0QKH/CIKmdnn+6IJEX71WtOTj8QvYZbSftjcPB3PQNIngG4Vf/mG9G1aeq?=
 =?us-ascii?Q?GFYyVd7JQlxjr8x3KTc1QuZJgO5n9svjYzG5mMmMv/IiQq8w5TLdL1foHdi/?=
 =?us-ascii?Q?NodRZmHOYQ70hzwIBnsyBuEXkfSNr4Cjp1P2JCbEf6GK2SpQrzXQnlHq9SJf?=
 =?us-ascii?Q?9AKaMGcpxFUBhTj2GKx6qRR+jYLDQBaKSnaUQXFwYM9nITeJqYghEuLbzCov?=
 =?us-ascii?Q?7E8DOvpYLdihwdIuQTouYJrJ24GdHK5NkUU5d1vJVeY78+8ud4Jfvbr4CkPK?=
 =?us-ascii?Q?PbxGmeIVrX6eyF9pfJhcTbIJysqZD7JiEe4kRyAyGApQKeBNo5hCxsogPdqu?=
 =?us-ascii?Q?cPQNcnCkDc2fO1SVwNWR5YSypT1mTWt24JGzRXodAvfr+dfCsf/fdILI67zr?=
 =?us-ascii?Q?c7lonISZ9YaULBePnjJGTWZ6Uw1OxEDxBch5pHdUuNhUbPOJX+DJXd2gYOB/?=
 =?us-ascii?Q?TJo4037hUr3wv6hw3YL1uABA+/oqEHEq2MKMIGuHozDAEz0OuIqiSnQLcemn?=
 =?us-ascii?Q?IA+u112P3ebnAgfz7MeEMIgHJRXrIt34Iy16En36tT6kAclump1eGB3NKJ17?=
 =?us-ascii?Q?01EWSI8KDU3oA+raU4OLe/aq81CtfMkP2UwAUSGsPStn7MQdCHVHHlQfzp3R?=
 =?us-ascii?Q?0u+tGiyfH5ZwfGzHupcDxj2hJGgfYp5p+xGEQ/GNrI3y+Y3l3/EZKdnbIslV?=
 =?us-ascii?Q?YWcLI/PWAuQ2Eus1ydscUuGABvoWVnSf1FZEYQDzIG45x6oitvVIg/fBkjxu?=
 =?us-ascii?Q?67DVsQjWXIkL7vTEy0V2/FISJcDIwe5HIQEzRSSaYBCNdigtb12oDLLUKDS2?=
 =?us-ascii?Q?IFP9WcL1FMVekjXzIixYQwwGzaWMBFhzubGnSwWDyoOCtigJOtYbZE0J2t3p?=
 =?us-ascii?Q?Y6DjaFWdyeUgs+FugyJmXFoN+qvmllm/5ekCOYQM11p35S2G27igSeWrdKDy?=
 =?us-ascii?Q?tkZD5Xc8EzL/NBk2Qi0KqGyU?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230038)(366014)(376012)(1800799022); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0gf1mhZbKxlzg0LVCbw4CsI5dv/0j4ujlgICUkeowxhxx8Z6D34i4BzgOeoo?=
 =?us-ascii?Q?k2XhHTzWml7TTrt/3ijP69k+hF6Bq2gJoChgXyPBqSma/zxYJNrZZVRpFdKn?=
 =?us-ascii?Q?/2OaJ4ohNHERbfE0INe0q1ILZvkpAI8mZ7iBwVp8ite3rH+FLQQUnq1OlTbJ?=
 =?us-ascii?Q?Z7uKlHvSYaG+eIfxbnJM1pYtP7NLtrLfJZ1uYwGYhE0Pp34PDk9vE8yTHtSR?=
 =?us-ascii?Q?1KVpsOAaBinSMJKNr92CRgd1ZxNkG7wzZIkz9o5gv94IxalfCPyUzLAixhtQ?=
 =?us-ascii?Q?9+cQduRKAhOPZBoMNHX5Mg5o8mcOvDoYGGXgZvlLPcwYdN5FDlJ/gIWuCjJc?=
 =?us-ascii?Q?6yYgtPRsqabP8BRCG4nz18fPhYFujmBbgBGnutoRnrhmB2twbh43kKI4Ejj7?=
 =?us-ascii?Q?3nrGCkM8nrnrQF3oikH0yu1HcgYSr7zjPKMhBA/wpp/w4QPVGpl9oG3HPN6z?=
 =?us-ascii?Q?bJPxqoLJckc4nXuIqOGS3mFpmauKCp9nD1lHaLoVy92a+DZkJaNxd7mbNOF8?=
 =?us-ascii?Q?HgoU/GzEWCTkA9+TnCuSJJq8gn4Hh1a3BOIWFEijmEb8hgwNTjR+sAXiXX1m?=
 =?us-ascii?Q?fLLyTyW8bqPmVEyw6EMVBEAjmOiBEeitWA3pkO7xiUiMANuJ/21p8er+yp1j?=
 =?us-ascii?Q?W49lOoonPb2debRnYU2sDKgrxUOzYUAPRKZSnQ16FMdNSVd/RX6enMiB1hb7?=
 =?us-ascii?Q?vFohilMhLPv7+qtDebt7zOXZjqta6VpNiF44KoY0+TuhQaxU6hPmK/zPyZqh?=
 =?us-ascii?Q?EbVCgvD//9/ijoOyOiD6xg9oWUV5AEP/qyNLGLHfV18BxEryhcA/SziQewY8?=
 =?us-ascii?Q?A9mV226MWUT60Pjn5Ewm2MxdoXj6dJjb2EmsXKHcuDG2dBzauMKScOfTV2zW?=
 =?us-ascii?Q?B2qY69gAhSxis3u7CnjMACRSZdr1KS7sy7VqcNnfI39lpZAiUSuLwZRKM6VW?=
 =?us-ascii?Q?Njv6pvnT+aKqGe+EFtpiiitY86IcN/7y09Z6VcKoQCHFvvxK/BcrCzfqfb6f?=
 =?us-ascii?Q?JSULiBYC1q4aTZpWDEc9+/NKKApo4AVL2sXOOPb51+iPBszmtH9vxS8qEFzd?=
 =?us-ascii?Q?0O4tg4Jt1sA4wGqxkXiB2VOObt77yjN6nm2ylviEKYGzgJGnQ/DEiwaV6LPk?=
 =?us-ascii?Q?2/GWn7A50wWNkLTWpEQctNrekAN/N+Hp5KafB6Vexix/rowCUe+Odloinvxv?=
 =?us-ascii?Q?P3w9PhTFtKPj6qql/4Sv+iPOpZ5WF06n6VEOB96birJ6F2+fVKq2FtygAHG9?=
 =?us-ascii?Q?TNwhXvrDMu+jHuJuPdOxoSVeRoSRlpxKgtJdYWy0kONV75Dd/WmqXYSNMgoE?=
 =?us-ascii?Q?/tS3F3uDgVV9uGrlyUlSwMUyn22EWLjXNk1EPAbBdHxkdgpNT3wACmd5Xlz7?=
 =?us-ascii?Q?JY6mnahD32/ugB+O+GKQLRcH5eFnRFy8NEDM0yr+ekxRg6T3/UwQTMVJiJ/o?=
 =?us-ascii?Q?gWWaRxah/w8ZPdx1uMVESgm/sgcPqmwZYLwcquzbO1RQrTWrYHt4+OllZaEG?=
 =?us-ascii?Q?ivGHX6SaSfoTA7YR7jTJhI0pqSeXc2iRNtzSRKQdtLIje9frIcEsTeIdCWeV?=
 =?us-ascii?Q?dP0X+l7SjdH6l51fBmjbmMc3zN1JUTa1nvBQqD78GcypPZd3Zw7osaiTswVq?=
 =?us-ascii?Q?aQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ab0e977-daa7-4dce-f2c3-08dc9530295a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2024 16:02:06.6447 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tber0ipAlKprqOJKPFNCpUIJqLTmjs6TnB7nLKqwqyGkmyIDaiHsSjVkoz5VpOT85Oxziz4/ZFhSY5AiHqV8iA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7345
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

On Tue, Jun 25, 2024 at 03:46:17PM +0000, Matthew Brost wrote:
> On Tue, Jun 25, 2024 at 02:03:38PM +0100, Matthew Auld wrote:
> > Hi,
> > 
> > On 25/06/2024 06:51, Matthew Brost wrote:
> > > To adhere to dma fencing rules that fences must signal within a
> > > reasonable amount of time, add a 5 second timeout to preempt fences. If
> > > this timeout occurs, kill the associated VM as this fatal to the VM.
> > > 
> > > v2:
> > >   - Add comment for smp_wmb (Checkpatch)
> > >   - Fix kernel doc typo (Inspection)
> > >   - Add comment for killed check (Niranjana)
> > > 
> > > Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/xe_exec_queue_types.h |  6 ++--
> > >   drivers/gpu/drm/xe/xe_execlist.c         |  3 +-
> > >   drivers/gpu/drm/xe/xe_guc_submit.c       | 41 ++++++++++++++++++++----
> > >   drivers/gpu/drm/xe/xe_preempt_fence.c    | 14 +++++++-
> > >   drivers/gpu/drm/xe/xe_vm.c               | 10 +++++-
> > >   drivers/gpu/drm/xe/xe_vm.h               |  2 ++
> > >   6 files changed, 65 insertions(+), 11 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > > index 201588ec33c3..1e51c978db7a 100644
> > > --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > > @@ -172,9 +172,11 @@ struct xe_exec_queue_ops {
> > >   	int (*suspend)(struct xe_exec_queue *q);
> > >   	/**
> > >   	 * @suspend_wait: Wait for an exec queue to suspend executing, should be
> > > -	 * call after suspend.
> > > +	 * call after suspend. In dma-fencing path thus must return within a
> > > +	 * reasonable amount of time. A non-zero return shall indicate an error
> > > +	 * waiting for suspend.
> > >   	 */
> > > -	void (*suspend_wait)(struct xe_exec_queue *q);
> > > +	int (*suspend_wait)(struct xe_exec_queue *q);
> > >   	/**
> > >   	 * @resume: Resume exec queue execution, exec queue must be in a suspended
> > >   	 * state and dma fence returned from most recent suspend call must be
> > > diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
> > > index db906117db6d..7502e3486eaf 100644
> > > --- a/drivers/gpu/drm/xe/xe_execlist.c
> > > +++ b/drivers/gpu/drm/xe/xe_execlist.c
> > > @@ -422,10 +422,11 @@ static int execlist_exec_queue_suspend(struct xe_exec_queue *q)
> > >   	return 0;
> > >   }
> > > -static void execlist_exec_queue_suspend_wait(struct xe_exec_queue *q)
> > > +static int execlist_exec_queue_suspend_wait(struct xe_exec_queue *q)
> > >   {
> > >   	/* NIY */
> > > +	return 0;
> > >   }
> > >   static void execlist_exec_queue_resume(struct xe_exec_queue *q)
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > index 373447758a60..9df97ee94fca 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > @@ -1301,6 +1301,17 @@ static void __guc_exec_queue_process_msg_set_sched_props(struct xe_sched_msg *ms
> > >   	kfree(msg);
> > >   }
> > > +static void __suspend_fence_signal(struct xe_exec_queue *q)
> > > +{
> > > +	if (!q->guc->suspend_pending)
> > > +		return;
> > > +
> > > +	q->guc->suspend_pending = false;
> > > +	smp_wmb();	/* Ensure suspend_pending change is visible */
> > 
> > I guess it was already like that, but where is the matching smp_rmb()? If
> > adding smp_wmb() there should usually always be a barrier on the reader
> > side.
> > 
> > If this is just simple wake_up() / wait_event() pattern with single
> > dependant store/load vs wait/wakeup then I don't think we need explicit
> > barrier, it should be handled already by the api IIRC.
> >
> 
> Yea, I knew some smp_* barrier usage was wrong. Let me drop this.
>  
> > > +
> > > +	wake_up(&q->guc->suspend_wait);
> > > +}
> > > +
> > >   static void suspend_fence_signal(struct xe_exec_queue *q)
> > >   {
> > >   	struct xe_guc *guc = exec_queue_to_guc(q);
> > > @@ -1310,9 +1321,7 @@ static void suspend_fence_signal(struct xe_exec_queue *q)
> > >   		  guc_read_stopped(guc));
> > >   	xe_assert(xe, q->guc->suspend_pending);
> > > -	q->guc->suspend_pending = false;
> > > -	smp_wmb();
> > > -	wake_up(&q->guc->suspend_wait);
> > > +	__suspend_fence_signal(q);
> > >   }
> > >   static void __guc_exec_queue_process_msg_suspend(struct xe_sched_msg *msg)
> > > @@ -1465,6 +1474,7 @@ static void guc_exec_queue_kill(struct xe_exec_queue *q)
> > >   {
> > >   	trace_xe_exec_queue_kill(q);
> > >   	set_exec_queue_killed(q);
> > > +	__suspend_fence_signal(q);
> > >   	xe_guc_exec_queue_trigger_cleanup(q);
> > >   }
> > > @@ -1561,12 +1571,31 @@ static int guc_exec_queue_suspend(struct xe_exec_queue *q)
> > >   	return 0;
> > >   }
> > > -static void guc_exec_queue_suspend_wait(struct xe_exec_queue *q)
> > > +static int guc_exec_queue_suspend_wait(struct xe_exec_queue *q)
> > >   {
> > >   	struct xe_guc *guc = exec_queue_to_guc(q);
> > > +	int ret;
> > > +
> > > +	/*
> > > +	 * Likely don't need to check exec_queue_killed() as we clear
> > > +	 * suspend_pending upon kill but to be paranoid but races in which
> > > +	 * suspend_pending is set after kill also check kill here.
> > > +	 */
> > > +	ret = wait_event_timeout(q->guc->suspend_wait,
> > > +				 !q->guc->suspend_pending ||
> > > +				 exec_queue_killed(q) ||
> > > +				 guc_read_stopped(guc),
> > > +				 HZ * 5);
> > > -	wait_event(q->guc->suspend_wait, !q->guc->suspend_pending ||
> > > -		   guc_read_stopped(guc));
> > > +	if (!ret) {
> > > +		xe_gt_warn(guc_to_gt(guc),
> > > +			   "Suspend fence, guc_id=%d, failed to respond",
> > > +			   q->guc->id);
> > > +		/* XXX: Trigger GT reset? */
> > > +		return -ETIME;
> > > +	}
> > > +
> > > +	return 0;
> > >   }
> > >   static void guc_exec_queue_resume(struct xe_exec_queue *q)
> > > diff --git a/drivers/gpu/drm/xe/xe_preempt_fence.c b/drivers/gpu/drm/xe/xe_preempt_fence.c
> > > index e8b8ae5c6485..8356d9798206 100644
> > > --- a/drivers/gpu/drm/xe/xe_preempt_fence.c
> > > +++ b/drivers/gpu/drm/xe/xe_preempt_fence.c
> > > @@ -16,11 +16,23 @@ static void preempt_fence_work_func(struct work_struct *w)
> > >   	struct xe_preempt_fence *pfence =
> > >   		container_of(w, typeof(*pfence), preempt_work);
> > >   	struct xe_exec_queue *q = pfence->q;
> > > +	int err = 0;
> > >   	if (pfence->error)
> > >   		dma_fence_set_error(&pfence->base, pfence->error);
> > > +	else if (!q->ops->reset_status(q))
> > > +		err = q->ops->suspend_wait(q);
> > >   	else
> > > -		q->ops->suspend_wait(q);
> > > +		dma_fence_set_error(&pfence->base, -ENOENT);
> > > +
> > > +	if (err) {
> > > +		dma_fence_set_error(&pfence->base, err);
> > > +
> > > +		down_write(&q->vm->lock);
> > > +		xe_vm_kill(q->vm, false);
> > > +		up_write(&q->vm->lock);
> > 
> > I think grabbing vm->lock will deadlock here, right? Calling vm_kill might
> > also be scary? lockdep will not see it unless we have some way of triggering
> > the error path here. For reference: 3cd1585e57908b6efcd967465ef7685f40b2a294
> > 
> 
> Yea I think you are right. I was thinking we could grab this here as I
> thought having a dedicated ordered work queue here allowed the vm->lock
> to be safely taken about that thinking is wrong. Hmm, I need to rethink
> this design. I might be able to refactor xe_vm_kill to not require the
> vm->lock... Let me play around with this.
> 

Scratch what I said wrt to dropping vm->lock requirement to kill, I'll
defer the kill preempt rebind worker via checking dma-fence error state,
set a per VM flag which indicates skip calling suspend_wait, and
document that preempt fences must use an ordered wq (at least within a
single VM).

Matt

> Matt
> 
> > > +	}
> > > +
> > >   	dma_fence_signal(&pfence->base);
> > >   	/*
> > > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > > index 5b166fa03684..e7c15b7877b1 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > @@ -311,7 +311,15 @@ int __xe_vm_userptr_needs_repin(struct xe_vm *vm)
> > >   #define XE_VM_REBIND_RETRY_TIMEOUT_MS 1000
> > > -static void xe_vm_kill(struct xe_vm *vm, bool unlocked)
> > > +/**
> > > + * xe_vm_kill() - VM Kill
> > > + * @vm: The VM.
> > > + * @unlocked: Flag indicates the VM's dma-resv is not held
> > > + *
> > > + * Kill the VM by setting banned flag indicated VM is no longer available for
> > > + * use. If in preempt fence mode, also kill all exec queue attached to the VM.
> > > + */
> > > +void xe_vm_kill(struct xe_vm *vm, bool unlocked)
> > >   {
> > >   	struct xe_exec_queue *q;
> > > diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> > > index b481608b12f1..c864dba35e1d 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm.h
> > > +++ b/drivers/gpu/drm/xe/xe_vm.h
> > > @@ -259,6 +259,8 @@ static inline struct dma_resv *xe_vm_resv(struct xe_vm *vm)
> > >   	return drm_gpuvm_resv(&vm->gpuvm);
> > >   }
> > > +void xe_vm_kill(struct xe_vm *vm, bool unlocked);
> > > +
> > >   /**
> > >    * xe_vm_assert_held(vm) - Assert that the vm's reservation object is held.
> > >    * @vm: The vm
