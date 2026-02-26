Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75588FD9E21
	for <intel-xe@archiver.kernel.org>; Thu, 26 Feb 2026 23:14:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2717810E09B;
	Thu, 26 Feb 2026 23:14:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EEcnlOwd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53D1810E09B
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Feb 2026 23:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772147685; x=1803683685;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=cEXVpAwSeYeFJ+MvqLL52gUVSuXi0mInI/yO1j4SVlw=;
 b=EEcnlOwdfdyzQMkXOsqLhBn4kGp8BYOdB7ay6DdZjjvPmKlHhhkD+qz3
 LMHVPoU91U+5k47SRueeZjwE42ai59BjR2R0j0jRjTDOarofxO1jBzFbg
 fWBTT28XHnuLKHJCmxz8GB603wWEAZ0P3Ei8oVCB5Cv3xc4JUzRQaW3xT
 fhrkFbhevWlBjIBGxIEnzwTOzuJrRGl36wpd0zIyl5JaZXJ3fh3rTgOGK
 pf5APrxZR/otSm1USa3GGKLNt5bX72REe1EZqVgYB41b1XMZuPxzJIUQt
 vv0IHVj18AShNjibTBQUDWVOOyIajMxY/urdhJL9ElhcTEbmFzInhbknZ Q==;
X-CSE-ConnectionGUID: Xfr+BRV7R6uucPJfhLefDQ==
X-CSE-MsgGUID: sNLyF0nbS0yASWupYFMLDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="73196030"
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; d="scan'208";a="73196030"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 15:14:43 -0800
X-CSE-ConnectionGUID: gUQazz1sSJG3Y6i0pCyiWg==
X-CSE-MsgGUID: UPlV8YHWQmK5ZkAm1ZSt0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; d="scan'208";a="221228262"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 15:14:41 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Feb 2026 15:14:40 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 26 Feb 2026 15:14:40 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.24) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Feb 2026 15:14:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yd+H2V3m9Mb0wuOEWrVAQWYOuwIdzM/Z1ON9zEGddCrlHC58KB4ZFsquYCKfBu8EOzxbVJ910/CiidnshMUPd2RgKCb6TK/FkApQVtD/IBOf2ynZkj5ySJ0t8XMYJDjbH6fZtbieX1tEpWt+APmfLiYLkexGJfMGo+ei5ciInbaPUaf+FsL9IHNMlOvbRSn6fEXsRWluMjyBPfOcDL6Yc8bgKNFlZa2R/gSd1aMJyutzk1HTUNq6NNLxGgE0/e+A87J8NJtqeKkAoXdJgxGZhga4FV3mwqljyPYmd8w35S+3qlD6GM1D7G3CgF/j8gqCaLVXc+7v6ESW8yM5K/6Bpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o+7O+4stqvx6EchYJWOqAWsNt909GlNsDsqiqWADjQ0=;
 b=pA1tAdMcnlXN6BajL0P1izAjWvdT34RiYRclGkqrVDsG4nl9C19nQldzvR4h6TJRqqgO53Is9fD/zfcmgN1MEE8vmNOpmB4mQ9RtvwOpCFuLMwAaJPBrJDG9UIicHoRQmfXZtpice8uAzxMorNURAGrn7hqpneivWJr5H6UV4Fyt3QCRO8IXRp1IVly1ILLs6WJkPbikvZ2MsDlDSYLJW1ZeUPVs1AwYEJJp6OEBQZr4YwmO5N2y5KEyGqfdD1hoKNF9Z7U1cUed7AOs5th9EuDqs3Jrub2IqR5MTqdOjPDoOhmdZQo1DUOHLb0i4siROVOLHQCZaCKaMv25s+i8+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by LV4PR11MB9490.namprd11.prod.outlook.com (2603:10b6:408:2e1::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.11; Thu, 26 Feb
 2026 23:14:38 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9654.013; Thu, 26 Feb 2026
 23:14:38 +0000
Date: Thu, 26 Feb 2026 15:14:35 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Tomasz Lis <tomasz.lis@intel.com>
CC: <intel-xe@lists.freedesktop.org>, =?utf-8?Q?Micha=C5=82?= Winiarski
 <michal.winiarski@intel.com>, =?utf-8?Q?Micha=C5=82?= Wajdeczko
 <michal.wajdeczko@intel.com>, Piotr =?iso-8859-1?Q?Pi=F3rkowski?=
 <piotr.piorkowski@intel.com>
Subject: Re: [PATCH v4 4/4] drm/xe/vf: Redo LRC creation while in VF fixups
Message-ID: <aaDT2zGaneeuByug@lstrano-desk.jf.intel.com>
References: <20260226212701.2937065-1-tomasz.lis@intel.com>
 <20260226212701.2937065-5-tomasz.lis@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260226212701.2937065-5-tomasz.lis@intel.com>
X-ClientProxiedBy: BYAPR01CA0054.prod.exchangelabs.com (2603:10b6:a03:94::31)
 To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|LV4PR11MB9490:EE_
X-MS-Office365-Filtering-Correlation-Id: fe508026-0b77-4e37-d1f3-08de758cd00a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: lTdhYk7vLL4jZVTcaQvkE2mPu07pk13+NIO61L0gS0SoYLmK44IsdvlgEHOPp7rQ63can8qVItGJJmwn321gTtVNPzfI/YvUl+YN9gB+ITgoiFWouscNNLjWt5zW69jqLDYvNMdPCkSV6SD9t7TqsFXxA0lnJQ91itbATnyMrC5j2cIovYdIyiLqr+DG3p6DjeAa/2s1eywhN97mJm4US4BlRrvrrXrEfvnBxROURlJgfb1bPFhIXYTCnERsxvHlDvxbqTMIRribCH4MbkQbq7VobXWDcQQnLsqTBPjdxVAbaBq+IHFIFSOsk2pPMGNFPYqjRZ9UKNgLRucfc++w/wqNXGpeL4nQTnezBBOLmR0qCIxZpyxQcHssDroQ63Mz7ltn/Xs6PEQOms3ZTJ9QFhCpAxr6ZkoZV0i/eGXJIVwYr9V6p4moiz4W+UroVd3tcB3QrZ2RB5kTAIfGOGPXHFM7LVtSF8K+etAJgJOHdLL8HER4bUAr+jxJwrMWiRcJFWMqQeKA7Dd5PHlPmNoPvhUh7IC72Ldj4NTjPb17D+4oebo55xEVSlE0Jv5l1lzF1M6gEx5prv5Va4JjVZlAuAXy4Dx1UdWmjOcth45DKqfQ+NhCMqwo3Yot3LXOfnTzG19TV13ilufFJKikgMEYU691/oLLJ72ADgETVh9Pkc6kGYCaME6jkucLM3mBFweImrT9Judcov2sfiJMGOi0679vr9iPxJLxqbIdOgk8Pk8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BbKMyWscb1kuYNW/0ubM7Jo9sr30pOJoC6nmVhmxozeEa+SRjA4wHOYwIshW?=
 =?us-ascii?Q?tNxyA9gyRhXWn3PKkmugLldkaRQ4Fz8jA0YWrf/rmYAOKHAoiEuDHk1JjJ+L?=
 =?us-ascii?Q?5RChaMDsH0viYM/+nL6HPT8woE8DBqgoq6ix1Z6LAdwH5yQZinVfi+9z9liT?=
 =?us-ascii?Q?jlb4rnEbxRrwZTU1iIdir2sPyGsaCUqOry89dfNRGD+0KzmIj5ZqBUE5sPS7?=
 =?us-ascii?Q?KCjEIFLoHZ3yjL9PbEVNHajbqg3XL1Cf5yNIkm+gligaeyUfM54SPchaMNZF?=
 =?us-ascii?Q?EBVZ+W/Ju3wbXPzryBzYdfcCWb2HSkG4ieM+D3MHo7ioEKvc5uNqRCIV+z7M?=
 =?us-ascii?Q?L81kVWop58SZdXXxggZH/XE8NUrnUNg6VYGxOPr/a0NcVooNTD/S5xvfdSN7?=
 =?us-ascii?Q?6vl/p0SykviksMqiGkycz3xlArum9zHUPplgIOILZghKIjMnAzO0Zvlbivp9?=
 =?us-ascii?Q?LQA9gU4FGrZlDaCKa5lsXdPNnvEyVByD9lWc0K+8qkA/Ml2OxFHMzW2SXg4K?=
 =?us-ascii?Q?QTAbrpw3P21mlX/3o5SIWq8bdOEeFcHfo86wndGCQpu6xE66H401e2M9wV/P?=
 =?us-ascii?Q?96Lbbq7Mk9HmE9Isf/1g9Qn6GShnABDKw/qkYd5NQUxIhKSxWk+H8Vprbsgs?=
 =?us-ascii?Q?LcIkPjrqgVcxxs6zkP5tvX0t5OHYG2rd2t21HKHaJzcURqIx6l/OJH1AbfHR?=
 =?us-ascii?Q?pHB1Jlfx5tido+Q9S7UYVoBFEhEYJxU6jjwC61mfEYY7f8kj0jKct7Aq4r7V?=
 =?us-ascii?Q?Qm0UQuD4SxbbuYDNZC+nNySWCNLSUb+phEz9aTW5HecXotRDyrCWswee7o1G?=
 =?us-ascii?Q?oWqdhoQnZlHGvTiPXw1yR0s43n2uKebcljWF/CR0+sC3WgNHR5VyNS3ONBJm?=
 =?us-ascii?Q?0thVY6dMrboY2yuxvTQ9sfXJk2wMMBrdTBklqKw5wtivw6mSXeKE2uUeI1cQ?=
 =?us-ascii?Q?76ZYIi1aJ5XE1oUJnIlRbRuGd9AgdgAVUOpD98Z2MAbtj/XhFjlQwSYkPxMn?=
 =?us-ascii?Q?U2p8VN0AuJ43M/ihBzOhAPD4OyWI8Vs0oyy8Sb/69cdDoznkpQdoxLau6QEW?=
 =?us-ascii?Q?YyY7q+7ggUp3OrpU2WfWiGkGUZGHKPwe76siB4aGwqlEIrxy4QuMOPeN4chH?=
 =?us-ascii?Q?T9w/nR6yuULBSP65RCPIK/tHpgtoWemqIUH25CvF68yMtMsjpbakOLQAisw1?=
 =?us-ascii?Q?94WAfEP5QwC1bEMVo8gdNCb7A4yDxfDi1b3kS8SdKjv81uk2i0GGwkxElQZP?=
 =?us-ascii?Q?DtGXT8zAlrBLib8nwm9nmG6XDaNhSbb2MmgNh5XAnviqhEiQQVPTGtLZY8ap?=
 =?us-ascii?Q?Z2ZO/QgCMpea5DtehP4OEkHdaAiQYKr/fJRshXlIZrJRVc/UMqJMCczKCQDe?=
 =?us-ascii?Q?bys+RIFFixG5jmzJaOkxrMYdc6X9A3rKkEUCyWgDI8DBxF1OGvORJS8KnRYA?=
 =?us-ascii?Q?Zg6qJXH3D31IHLf8oY7P4sb8WeQYCRCexykbKKBZ/CRLnSclhN820m2fq/7k?=
 =?us-ascii?Q?gTdyIukGnNfojXqpNVoJkeZwfE0fz6l+TRCkz0+GTLKIPfU7Q9WLfL33vMZx?=
 =?us-ascii?Q?4TDuzBycQgKZ+mnNKyi1ghrC5AglQXAB2K0ijHDbcBcfus0SKglEg9r2oVvB?=
 =?us-ascii?Q?Ji0eRvkWO0KXp2DwXkEaYnbagZHgoSDfvTTL7d5kXtuXc8+STgouzI1l69i7?=
 =?us-ascii?Q?s54yJ2qO/CEXUpBZsDQF/nyPLXQsLiVv8vVXePEAGutBp/xnvaEGodrK2xLh?=
 =?us-ascii?Q?wJoLgKbt+0WleVtb5BWZuUt/yaLBbMQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fe508026-0b77-4e37-d1f3-08de758cd00a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 23:14:38.1025 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ulOMv69IhxUelxT+XmzcBAFRMB4fH5sPIOH4UIaUPcR+Zms1Mkq1YzmCeAoF6DfnWrKo9FO2U19OSNNTo0SVPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV4PR11MB9490
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

On Thu, Feb 26, 2026 at 10:27:01PM +0100, Tomasz Lis wrote:
> If the xe module within a VM was creating a new LRC during save/
> restore, this LRC will be invalid. The fixups procedure may not
> be able to reach it, as there will be a race to add the new LRC
> reference to an exec queue.
> 
> Even if the new LRC which was being created during VM migration is
> added to EQ in time for fixups, said LRC may still remain damaged.
> In a small percentage of specially crafted test cases, the resulting
> LRC was still damaged and caused GPU hang.
> 
> Any LRC which could be created in such a situation, have to be
> re-created.
> 
> Due to VM having arbitrarily set amount of CPU cores, it is possible
> to limit the amount to 1. In such case, there is a possibility that
> kernel will switch CPU contexts in a way which allows to miss
> VF migration recovery running in parallel (by simply not switching
> to the LRC creation thread during recovery). Therefore checking
> if the migration is in progress just after LRC creation, is not
> enough to ensure detection.
> 
> Free the incorrectly created LRC, and trigger a re-run of the
> creation, but only after waiting for default LRC to get fixups.
> Use additional atomic value increased after fixups, to ensure any VF
> migration that avoided detection by just checking for recovery in
> progress, will be caught.
> 
> v2: Merge marker and wait for default LRC, reducing amount of calls
>   within xe_init_eq(). Alter the LRC creation loop to remove a race
>   with post-migration fixups worker.
> v3: Kerneldoc fixes. Rename fixups_complete_count.
> 
> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c        | 29 +++++++++++------
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 38 +++++++++++++++++++++--
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.h       |  3 +-
>  drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h |  2 ++
>  4 files changed, 59 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index c0e95f1a9911..faea993e756d 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -368,17 +368,28 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q, u32 exec_queue_flags)
>  	 * from the moment vCPU resumes execution.
>  	 */
>  	for (i = 0; i < q->width; ++i) {
> -		struct xe_lrc *lrc;
> +		struct xe_lrc *__lrc = NULL;
> +		int marker;
>  
> -		xe_gt_sriov_vf_wait_valid_ggtt(q->gt);
> -		lrc = xe_lrc_create(q->hwe, q->vm, q->replay_state,
> -				    xe_lrc_ring_size(), q->msix_vec, flags);
> -		if (IS_ERR(lrc)) {
> -			err = PTR_ERR(lrc);
> -			goto err_lrc;
> -		}
> +		do {
> +			struct xe_lrc *lrc;
> +
> +			marker = xe_gt_sriov_vf_wait_valid_ggtt(q->gt);
> +
> +			lrc = xe_lrc_create(q->hwe, q->vm, q->replay_state,
> +					    xe_lrc_ring_size(), q->msix_vec, flags);
> +			if (IS_ERR(lrc)) {
> +				err = PTR_ERR(lrc);
> +				goto err_lrc;
> +			}
> +
> +			xe_exec_queue_set_lrc(q, lrc, i);
> +
> +			if (__lrc)
> +				xe_lrc_put(__lrc);
> +			__lrc = lrc;
>  
> -		xe_exec_queue_set_lrc(q, lrc, i);
> +		} while (marker != xe_vf_migration_fixups_complete_count(q->gt));
>  	}
>  
>  	return 0;
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index 7f83c0d3b099..8989c8e1be95 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -1277,6 +1277,8 @@ static int vf_post_migration_fixups(struct xe_gt *gt)
>  	if (err)
>  		return err;
>  
> +	atomic_inc(&gt->sriov.vf.migration.fixups_complete_count);
> +
>  	return 0;
>  }
>  
> @@ -1515,20 +1517,50 @@ static bool vf_valid_ggtt(struct xe_gt *gt)
>  	return true;
>  }
>  
> +/**
> + * xe_vf_migration_fixups_complete_count() - Get count of VF fixups completions.
> + * @gt: the &xe_gt instance which contains affected Global GTT
> + *
> + * Return: number of times VF fixups were completed since driver
> + * probe, or 0 if migration is not available, or -1 if fixups are
> + * pending or being applied right now.
> + */
> +int xe_vf_migration_fixups_complete_count(struct xe_gt *gt)
> +{
> +	if (!IS_SRIOV_VF(gt_to_xe(gt)) ||
> +	    !xe_sriov_vf_migration_supported(gt_to_xe(gt)))
> +		return 0;
> +
> +	/* should never match fixups_complete_count value */
> +	if (!vf_valid_ggtt(gt))
> +		return -1;
> +
> +	return atomic_read(&gt->sriov.vf.migration.fixups_complete_count);
> +}
> +
>  /**
>   * xe_gt_sriov_vf_wait_valid_ggtt() - wait for valid GGTT nodes and address refs
> - * @gt: the &xe_gt
> + * @gt: the &xe_gt instance which contains affected Global GTT
> + *
> + * Return: number of times VF fixups were completed since driver
> + * probe, or 0 if migration is not available.
>   */
> -void xe_gt_sriov_vf_wait_valid_ggtt(struct xe_gt *gt)
> +int xe_gt_sriov_vf_wait_valid_ggtt(struct xe_gt *gt)
>  {
>  	int ret;
>  
> +	/*
> +	 * this condition needs to be identical to one in
> +	 * xe_vf_migration_fixups_complete_count()
> +	 */
>  	if (!IS_SRIOV_VF(gt_to_xe(gt)) ||
>  	    !xe_sriov_vf_migration_supported(gt_to_xe(gt)))
> -		return;
> +		return 0;
>  
>  	ret = wait_event_interruptible_timeout(gt->sriov.vf.migration.wq,
>  					       vf_valid_ggtt(gt),
>  					       HZ * 5);
>  	xe_gt_WARN_ON(gt, !ret);
> +
> +	return atomic_read(&gt->sriov.vf.migration.fixups_complete_count);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> index 7d97189c2d3d..a6f7127521a5 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> @@ -39,6 +39,7 @@ void xe_gt_sriov_vf_print_config(struct xe_gt *gt, struct drm_printer *p);
>  void xe_gt_sriov_vf_print_runtime(struct xe_gt *gt, struct drm_printer *p);
>  void xe_gt_sriov_vf_print_version(struct xe_gt *gt, struct drm_printer *p);
>  
> -void xe_gt_sriov_vf_wait_valid_ggtt(struct xe_gt *gt);
> +int xe_gt_sriov_vf_wait_valid_ggtt(struct xe_gt *gt);
> +int xe_vf_migration_fixups_complete_count(struct xe_gt *gt);
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> index fca18be589db..80562ffadb16 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> @@ -54,6 +54,8 @@ struct xe_gt_sriov_vf_migration {
>  	wait_queue_head_t wq;
>  	/** @scratch: Scratch memory for VF recovery */
>  	void *scratch;
> +	/** @fixups_complete_count: Counts completed fixups stages */
> +	atomic_t fixups_complete_count;
>  	/** @debug: Debug hooks for delaying migration */
>  	struct {
>  		/**
> -- 
> 2.25.1
> 
