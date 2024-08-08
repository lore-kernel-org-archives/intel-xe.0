Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8B2DC3DA4A
	for <intel-xe@archiver.kernel.org>; Thu,  8 Aug 2024 03:25:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7508510E0F4;
	Thu,  8 Aug 2024 03:25:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nTqGpyta";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB78810E0F4
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Aug 2024 03:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723087534; x=1754623534;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=4ERng8HENzYxbNY33I5x4O+tuDB6TpkBaBnqiNLbJ6M=;
 b=nTqGpyta3sQPoASsYD9wv4JHuaOyDtjYmkBWDrn7m/ycn9LiUj7JWrQh
 Bfs/eb+UpBHLXmMAMwRaCeo0tt5aJ15RHwVik6zMJnFpG4Exc0g0dC30G
 TmPX5N3mTufNH1QVhSAG/pQbdGG88970C2gVAngkT4CtEJOnTKT46Bg5x
 smzslTUo4h8L1TmIRxAq/Zz+LSj6Ff6HKDe4Zkvk6JDiQ9Snxapwt5Ois
 zHq1dIlaWfWmD5Gn7jf4nmCghSd5ili8ow5rbwdzl5XB7M/NYW0Ftaij8
 IdDgoAlTYzCXXwvR0QcQ5wfGtP93gzedzwOSmqy+I+rxjgdhI+Gx23tB7 Q==;
X-CSE-ConnectionGUID: 3hrdfEtjQlWzsVnmnt6QZg==
X-CSE-MsgGUID: s5KHjIHTQKWxO3EUzIuENA==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="32598222"
X-IronPort-AV: E=Sophos;i="6.09,271,1716274800"; d="scan'208";a="32598222"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2024 20:25:33 -0700
X-CSE-ConnectionGUID: ejmTm2YgTF+OPMvIkWIIuQ==
X-CSE-MsgGUID: gHdicKpGSOOslVjMaNRGnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,271,1716274800"; d="scan'208";a="57633396"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Aug 2024 20:25:32 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 7 Aug 2024 20:25:32 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 7 Aug 2024 20:25:32 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.176)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 7 Aug 2024 20:25:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TgKp9B+iHmGRO8cZzNOdVZQwSN4BblXRrYTrqAw18uu7jBWDHDnbFQTNIyy56mrcLLvZGdrleWLyT17mwdnWP2Esfm3A0a4bFH+0ljEdaZ1fqDEDHIaVHaLI3Qipn8QlSqlDqQ8Y+XJ9jIy3R0NJdARgpkibiUQCjNPaqxIgUSIk64z6082d7wMOKkXAe7kIFGir2GkhPbHRxy2gPR0A1YxY91cPz4RteRUmjZiPOv+6avbhsp3LkQ9/JvdeRbFGwO/RbWvDdxPYnjFMhCFUn6/PVcGS1RaAazlFHlZ5qUBI8a4ovTOgvTwh1lmDDDrsm/RGr2qOm1Q+UR00DgN+eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/iUhBmZxxRLjOPQg4Z4jmnToatphmcIcvQjegE915jk=;
 b=edi8ZWt5vk2urB1gq95xViyPFQV6l2Saq0Ug3NS5emsmOi9nhqgta+FrP8mwJR1Zi1V8Gpo51vIYO6K3sQtIX4MJKvEgPFV2Vi818MEmHU9m0dZmFtnQMqsE8K8U2aXcWM7yo0JGMIIpdHACJL0ZRT1vYNa8qbwf3/tJ8s3tfEayp3cdx4K0BbVGiZBjZo0idA8bJlriux/Rnx9tC1Ox+skgxpl+nOQ7PrantadM3r5GtFiczPH1G6bMjYWKPWOU+VJrKpVBif5zeDaY0Ng1etEIb+zP776R2uxnIfOoM3eCTLxb/jrlXIjTujb4WH7s3tnoHFENyY7IvoECmxCHng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB7472.namprd11.prod.outlook.com (2603:10b6:510:28c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.23; Thu, 8 Aug
 2024 03:25:29 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7828.023; Thu, 8 Aug 2024
 03:25:28 +0000
Date: Thu, 8 Aug 2024 03:24:09 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v7 06/13] drm/xe/exec_queue: Prepare last fence for hw
 engine group resume context
Message-ID: <ZrQ6WUjqgqf144lL@DUT025-TGLU.fm.intel.com>
References: <20240807162416.1307061-1-francois.dugast@intel.com>
 <20240807162416.1307061-7-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240807162416.1307061-7-francois.dugast@intel.com>
X-ClientProxiedBy: SJ0PR03CA0211.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::6) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB7472:EE_
X-MS-Office365-Filtering-Correlation-Id: 87ad6063-c34d-469d-32d3-08dcb759c06e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?854C7KgnDNqIhIp/piMG9j5oppRMjb4U9YxJVcY6UHGGNB1ZnedJzTgtbDih?=
 =?us-ascii?Q?ZblkDFZmvoTwnd456YzfwKHEwbJW0FcZ8q+MAj4qj/0xsPtfNAV0UzudpGmk?=
 =?us-ascii?Q?rwbsusMrfOlmyVuzs7C5WNhoWa+s2tw+0STDO+qE3nDmgGc1v8tRMkQ/Mvrg?=
 =?us-ascii?Q?Ejklg1ONBvs0WjJiX+twMRDVa1+uhxaPzbKIh/0efPcuscm0ifS/vrkhQnEx?=
 =?us-ascii?Q?s9hwVvJ4O47ev/18IGqEXSnJ9byjWsnlJdVaiKXL3vHmIBFcW1U5dfSc3PEq?=
 =?us-ascii?Q?bXhtcpNjNR00Y7ASVnDgt9+zPL76yBPagf1iFmCdURbMO0n54Ld3M03aUk9S?=
 =?us-ascii?Q?8YHmxA9rcQKKtv9E27DLNa8510ET0MbuZcSHyRqKLOyjcJeQK8H+cFSDGPUg?=
 =?us-ascii?Q?3sTnV4/bT093CMz51N55iGtoU7HWk+Kn9W1paJFh78tPJViOz/3WxnVr6zjF?=
 =?us-ascii?Q?HqOwiZ7xyaJAmOh00RGBKqFgmRKT9yUDn9rdhc1AFhKjHYggOeIBHSwMLfe6?=
 =?us-ascii?Q?4r9jrcN1XPEfhJDH0LgXEt9bj2FDthvChgFNsaE27pbtPkSFjxg88qCUjY9D?=
 =?us-ascii?Q?Sw0aBnuMYWPg+YNSJr4+yWDZmVY7YzyJKgUF6FBgxei6SzNzRP4jQebrqH7M?=
 =?us-ascii?Q?JPA8VPq3r79sBH3XguTX27v27JrIVf7L1uvo8HwhuEU6wFRoDBHFUv0JM3L8?=
 =?us-ascii?Q?qDzTBMieHQG8PtGWlp3/BZHuupDuNtXNGhuVCcaUZxpoVxQgYXqUmsikcSWg?=
 =?us-ascii?Q?W+MGkaUWXW+q/OeDcCUUu1Bq82VH7y3YgG2YlmMw5QrQ0riTLHQC64cWC/bO?=
 =?us-ascii?Q?rcC+Rf60fD9OIxBWlSYULlQHJk9TD2ErCcu0aOkA/zHwv5R7dyClhCG0D/rg?=
 =?us-ascii?Q?hhzXLDKC9r6kTWLWjz38/cx8Sc6m+sm+elLD8N4Zcr24sZtTEHwp3kaRwyA4?=
 =?us-ascii?Q?EF7lXi7hi11m6z78dqIj7uVYZHHAXhjgwnSeal2e0NcI2dmteXeyHE/bn6hN?=
 =?us-ascii?Q?Mfcj+JOi4AEJhbgpAunkhcu+dMblvIKwxbscFgX/H9gzzTuuVZCo6+Vc9NpS?=
 =?us-ascii?Q?ATyld8zVHmT3iudNNHssdRtWPAqOP0NkB1NFMJMlQR6B7un5hdetUyapgKJa?=
 =?us-ascii?Q?2k8it3ihOg2ne8+OY+k6ryM7RFIJt3U466zA0I3ecIAiwVdBLgzqdj87mZcx?=
 =?us-ascii?Q?0ynMnnb5vxleTuQ4U2KUA9a6f/+6dpJ+NEbb08m4+nKk+//K/sAnj8x7/4cW?=
 =?us-ascii?Q?YATXluHJw27OptHtyMuLJgtDdgdvu6GNtVBEXbII6oUWsOkIKeIFoVa5efW2?=
 =?us-ascii?Q?u/s=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vNZi02ZRi2Usd8io93o8YYJZZCAT1r2nXtrOE5/abi3eIFMqzLA0/Q8VeLDa?=
 =?us-ascii?Q?eqwV4ieELtESm1vVaUJY4uBN+g9CIJq3DjliMgfIcoK+mi5ZP2FL6ZN1KGSn?=
 =?us-ascii?Q?NQwvhzxJ8sU0Jwp+BXLwbMRJFtpnzXQFraU7gt9X82DK8SYW5oLig8MBdIPW?=
 =?us-ascii?Q?73omxR37AV1xYh9505cfF68Gidzd8rLYfrp5QhSYNZ0os+h6GyriQU62sdMu?=
 =?us-ascii?Q?LrVI2280LCDGnM1TrNQA9SsFehyQClsmB5kik5xA+nxWEu2PKttN6zvg2XpJ?=
 =?us-ascii?Q?HH7ZC09PWU4auR/HeWBzIQPy3j8Uf6NhJzqIDIEF3KOalga+3TU4YJJVZTbx?=
 =?us-ascii?Q?EjkU1vMxPG0neMKbKt93qmFKW7/HaS0/6q1ZGpwInBalc8NYo+vwx+K9tA7g?=
 =?us-ascii?Q?abbKwhfsK3aoAl9u1Ny1zLhmCVzCGULR75gEEe2TbHNkfSII+sHeJZYYsWw8?=
 =?us-ascii?Q?qGUXiI+kDW6/4EWyR8DP35nPZW7XlJlA4ROCii4R0Kp0x4npJz/ovVI5jtm7?=
 =?us-ascii?Q?hFB3PfTNao2bUhfC9QV6oMLJ7Sf4dgd30Bsi4sBbHERYIz9BadK4ZiFZJVXG?=
 =?us-ascii?Q?C9Q/xY7GbOGUlweyR3hN5dS4lN9/puqSq3ODrQvFSSbvlHqeWQpDGG+7X+wU?=
 =?us-ascii?Q?Y3ti5kn415rh/awLhG83LepE417fUkCLdWhL+li/uxfHzJHnesxJS0ir79/O?=
 =?us-ascii?Q?Gw3nv7TbddDAsZ//QVKICRYqdh+JPcC5kEOYiu5x1iy0oea4xrYEdm7Lx5tK?=
 =?us-ascii?Q?NAafe6hwDO+ibN3hK6lap3VUB4yowwUghEme7iwlZFZRojfitZ5vouJTLI4B?=
 =?us-ascii?Q?yvpyesGkOaQ/2Uf4W8pxT8P0JKw42BY7cunwFA8vgvXmIGwG7qIccMqquKPd?=
 =?us-ascii?Q?d/KJqHB6wOOvEvkW+Ie27EOgys3Fx09biDwJTZdMMjK3BoGIavpmFPLfOTo0?=
 =?us-ascii?Q?E2zleyBCcOfxkoYEjWElb4aZ8FhKa3BtcERDBBHPPp7x2ozLLmsDIMRDHfwh?=
 =?us-ascii?Q?V56eeDkRxQ30uRPVp7IV5BWKUgGiZXsjLiG5BEl6r/FtuHNwYIXowuhozBKZ?=
 =?us-ascii?Q?98JID30k6RrI+pFOmUYgWuWZ2ni7WtbCiwgQZLxJ9FFNSrk+rezDlfaZ2+DV?=
 =?us-ascii?Q?R1cnstVCpK26i32bezDYLfkC3JOye8MZ3mgj0dp15XHWxUEei3FsKgTe2eS0?=
 =?us-ascii?Q?01Q22QNgISTxHHOOk5vq5ujr/YIbIoDrGcyp84bH/EWKimyZ9ODmr3OOZ6dG?=
 =?us-ascii?Q?UlT5PCyD1gEhw8NBUVE49xKBoDBNoWUrmZiqZ3uqhWjcrvSiTdmKU6jjWALW?=
 =?us-ascii?Q?GhEX6MZb4I5sl+Tm5NEJbk6DZtFBEEK0DkSgXdPMurgqP+ton4XczyUkQZWu?=
 =?us-ascii?Q?HC5EvytMp8MzHQKSSWnUpcfVZ/eY9XwPpAxndI4dLj5pFRoy4PefP0vnVC70?=
 =?us-ascii?Q?+yCIbqwcBrMQ6z5NXVmB/6xEc6bafS1JPfiTzfswQ2Ri9SEv9aQinaqXp0hi?=
 =?us-ascii?Q?fZVXkuSJ9mgzpGOAzsykGeM3/MEa2OoyDjiKNZl7R8RSB5PKPGHNBr8bXBvO?=
 =?us-ascii?Q?gxOa04EC36f7xgKEfK05z0DnoBfpOoszZtqeMNQKkMMhi7P4ofbrCiapnwIA?=
 =?us-ascii?Q?eg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 87ad6063-c34d-469d-32d3-08dcb759c06e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2024 03:25:28.8836 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cO5Jr8NioVJIy5uAf/TaYxmSgGGJZ8wgD82nN1TQTceNrf+UlWD5H0nGVP6kRJrpAf65vPcZQ+uGHevFLNhA/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7472
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

On Wed, Aug 07, 2024 at 06:23:35PM +0200, Francois Dugast wrote:
> Ensure we can safely take a ref of the exec queue's last fence from the
> context of resuming jobs from the hw engine group. The locking requirements
> differ from the general case, hence the introduction of
> xe_exec_queue_last_fence_{get,put}_for_resume().
> 
> v2: Add kernel doc, rework the code to prevent code duplication
> 
> v3: Fix kernel doc, remove now unnecessary lockdep variants (Matt Brost)
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c | 48 ++++++++++++++++++++++++++++--
>  drivers/gpu/drm/xe/xe_exec_queue.h |  3 ++
>  2 files changed, 49 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 85da2a30a4a4..99ddcc826bce 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -818,10 +818,12 @@ int xe_exec_queue_destroy_ioctl(struct drm_device *dev, void *data,
>  static void xe_exec_queue_last_fence_lockdep_assert(struct xe_exec_queue *q,
>  						    struct xe_vm *vm)
>  {
> -	if (q->flags & EXEC_QUEUE_FLAG_VM)
> +	if (q->flags & EXEC_QUEUE_FLAG_VM) {
>  		lockdep_assert_held(&vm->lock);
> -	else
> +	} else {
>  		xe_vm_assert_held(vm);
> +		lockdep_assert_held(&q->hwe->hw_engine_group->mode_sem);
> +	}
>  }
>  
>  /**
> @@ -836,6 +838,21 @@ void xe_exec_queue_last_fence_put(struct xe_exec_queue *q, struct xe_vm *vm)
>  	xe_exec_queue_last_fence_put_unlocked(q);
>  }
>  
> +/**
> + * xe_exec_queue_last_fence_put_for_resume() - Drop ref to last fence
> + * @q: The exec queue
> + * @vm: The VM the engine does a bind or exec for
> + *
> + * Only safe to be called in the context of resuming the hw engine group's
> + * long-running exec queue, when the group semaphore is held.
> + */
> +void xe_exec_queue_last_fence_put_for_resume(struct xe_exec_queue *q, struct xe_vm *vm)

My bad, missed this eariler. This is not needed as stated in [1].

Matt

[1] https://patchwork.freedesktop.org/patch/607429/?series=136192&rev=7#comment_1104026

> +{
> +	lockdep_assert_held_write(&q->hwe->hw_engine_group->mode_sem);
> +
> +	xe_exec_queue_last_fence_put_unlocked(q);
> +}
> +
>  /**
>   * xe_exec_queue_last_fence_put_unlocked() - Drop ref to last fence unlocked
>   * @q: The exec queue
> @@ -875,6 +892,33 @@ struct dma_fence *xe_exec_queue_last_fence_get(struct xe_exec_queue *q,
>  	return fence;
>  }
>  
> +/**
> + * xe_exec_queue_last_fence_get_for_resume() - Get last fence
> + * @q: The exec queue
> + * @vm: The VM the engine does a bind or exec for
> + *
> + * Get last fence, takes a ref. Only safe to be called in the context of
> + * resuming the hw engine group's long-running exec queue, when the group
> + * semaphore is held.
> + *
> + * Returns: last fence if not signaled, dma fence stub if signaled
> + */
> +struct dma_fence *xe_exec_queue_last_fence_get_for_resume(struct xe_exec_queue *q,
> +							  struct xe_vm *vm)
> +{
> +	struct dma_fence *fence;
> +
> +	lockdep_assert_held_write(&q->hwe->hw_engine_group->mode_sem);
> +
> +	if (q->last_fence &&
> +	    test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &q->last_fence->flags))
> +		xe_exec_queue_last_fence_put_for_resume(q, vm);
> +
> +	fence = q->last_fence ? q->last_fence : dma_fence_get_stub();
> +	dma_fence_get(fence);
> +	return fence;
> +}
> +
>  /**
>   * xe_exec_queue_last_fence_set() - Set last fence
>   * @q: The exec queue
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
> index ded77b0f3b90..fc9884a6ce85 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.h
> @@ -71,8 +71,11 @@ enum xe_exec_queue_priority xe_exec_queue_device_get_max_priority(struct xe_devi
>  
>  void xe_exec_queue_last_fence_put(struct xe_exec_queue *e, struct xe_vm *vm);
>  void xe_exec_queue_last_fence_put_unlocked(struct xe_exec_queue *e);
> +void xe_exec_queue_last_fence_put_for_resume(struct xe_exec_queue *e, struct xe_vm *vm);
>  struct dma_fence *xe_exec_queue_last_fence_get(struct xe_exec_queue *e,
>  					       struct xe_vm *vm);
> +struct dma_fence *xe_exec_queue_last_fence_get_for_resume(struct xe_exec_queue *e,
> +							  struct xe_vm *vm);
>  void xe_exec_queue_last_fence_set(struct xe_exec_queue *e, struct xe_vm *vm,
>  				  struct dma_fence *fence);
>  int xe_exec_queue_last_fence_test_dep(struct xe_exec_queue *q,
> -- 
> 2.43.0
> 
