Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6FC1E67A81
	for <intel-xe@archiver.kernel.org>; Tue,  3 Mar 2026 07:10:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FD5510E11A;
	Tue,  3 Mar 2026 07:10:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R6TZv0ps";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F42C10E11A
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Mar 2026 07:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772521806; x=1804057806;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=2qoPLfEq07DNULR6z3SpKyIpavVugDbdHx1dwwsVrJs=;
 b=R6TZv0psya2aK+0rOzjSdenNhvV0UOufb6oKrfm8Pq4VmAxvl/CCK7wJ
 MErbVfwFnRrkUb8e39B8nMPS6vo5i0ZYmIsGzmJ0ZNsiR+jEwed+vpex0
 k67CPCBNJ++GA5L7PUuGZcwT6CnqT6ZI19e4NpSykmAl50HieglEkqGYS
 KIjLlmUygGpJSBj+lmnAogQVL2Zy0NNmTeMWbBBBcTWzqPHdv8cSdP5QU
 AAHA1yd4OhGOayy32MWfHfr8ILt38V41ZyDQsf30Q4fzVbRnsdaexQKjO
 9nau2lsoxzGS9QoWZYOMtUdixFPRCMzGNjqAjTBT4Ve6Qbni9OB+92fM0 g==;
X-CSE-ConnectionGUID: fim1/QYjScGjZYYSS76aTw==
X-CSE-MsgGUID: pl/TzoyxQjapFGD8gSr1rQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="77413003"
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; d="scan'208";a="77413003"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 23:10:05 -0800
X-CSE-ConnectionGUID: bfrSloXXRGuQjJfNVliT6w==
X-CSE-MsgGUID: VWTFFl4rQXClSqrw0KO6nA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; d="scan'208";a="222568758"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 23:10:05 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 2 Mar 2026 23:10:05 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 2 Mar 2026 23:10:05 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.34) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 2 Mar 2026 23:10:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FvdApQSOACmrjdszyDkUwAEQ3sxRssIv+/VrdPhvUVR2Z7CghZCrwm3QwnbNwtO9TGTlfVj67/9sujDTDdwhYQ557IrxJFzKJKj+ruOsgnes165etENuzm0SeEoyHMWyTFsQA+EJZhcNvUq4a1rulBroBw/4Oe0SloBY0eihD7QMMHcyi7tXS1Dye8choMAqg1UWTC+a28hMrL7YgSVTtN6Sj4OlNeCJK6+Xw0oy894Phl+lbMORTQtDfOW45Jx8+jXm36gY02/1f/3j0tn3+xgnhe6nntXZXNaiDxJJ97EUPYJMxKxYdNYX525t2Y5zRSyyaMWvBVudqT9rv1ctdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V/4rFgCXFD0+ZER8cHZupa0XCBtIsOOFILRnTq8yku0=;
 b=hg5RrkNXp5PeL4vlbE4Y06/lLgZ5q0KTxsrEnid/1lRhvPxZ6lusWBxS0wKPHKkF4MppDcVHewLgEJ9EqUv+angbwwyN79yqgHDgLCo1P7JCGBgqFC//X6A0cFtR5ffOF+TZ8bsBP44UcAf8Of8rlJ9qis5tBG7XGbg60ANWWjpY3x1ErMmW46MeIswYsZlaO8Fy7NV1noVsJZIt2YxRW0Z+b/YFXwgVqhD1QjLVEPNbazQsZcFIuXanE8YE/sSXuBt79ZhaaqXTrRdVbB5I30i209Aq4H1tkPrGQeVDrxbZtSk5tRgDinQjT87RzVLlqggMNR/yn+UUd74MGrcY1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH3PR11MB8381.namprd11.prod.outlook.com (2603:10b6:610:17b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Tue, 3 Mar
 2026 07:10:03 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.20.9654.020; Tue, 3 Mar 2026
 07:10:02 +0000
Date: Mon, 2 Mar 2026 23:10:00 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Add missing kernel docs in xe_exec_queue.c
Message-ID: <aaaJSPy/cGJs0JSn@lstrano-desk.jf.intel.com>
References: <20260303044611.122857-2-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260303044611.122857-2-niranjana.vishwanathapura@intel.com>
X-ClientProxiedBy: SJ0PR03CA0230.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::25) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH3PR11MB8381:EE_
X-MS-Office365-Filtering-Correlation-Id: c460ef74-d5ef-4d20-98e3-08de78f3e3be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: iK8epDh51kFtu8UKawz7qZh5wKmyFe9TyK463Q+ROGm7vx5oWOuX79vMWL48bFmuvh3xoV5YdbxTP3fvw6Fv0e6nxs9nwOa+y3wPZpUIDujYxZKuRwY6qzv/+mG5/zjBEDyOZ8sxNp8snhxNoQ90xTli/whbBASmVpexyk9vRtT3c5DcZ4kbbfcnX7yN8QFbxPY0F5pUISL2NohS97HZKgQ0sNElkzj0kjyuXFl7V8PjY07VB6Yl1FD1blBqJwXSBmi8ritjWf4OL6yIkpK25+8gC6EpSxMQhNlcm8dp0iBZP6NgFG/uVqZIMDwr9WRCtIiHVtDuVUZxIlkWdt6hi+LrU9A2JdBVn1X0pqHiW09G8l3j5z/yWb8p8YGIVHcprEppucEG5kDfsArCbAiG/QezpFEjHKg3OG3PwkFT0S27OQOc2lJzY11kow5ELB0lrNZR1FJjn+eBQrhS2p63tw5HE+dfnCX7kP6TbW09SFg1mIImVNJgSSQEBuys4KDzJ1Xruht80HeR1E6a7D1yp8t5pUd1vWgJmaELrYIcUIXQPnAlENzlXMBH3psa5dnDd/eljebVlSjonQJ3b33ACMdsrYhc9w25Io80l59+oVVbVVD6mWe4spbRv+1o/GJjHRQTt97XlJEgAuId2Pi0cS4u9Ze/xSOXdCp5y27Z+l9Wt0N8l3lx8E64yEvLHw12
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9MsH4HevFWCBw/uf1tNnMqfxldKYFagFEp2bzAuUPGHgOMGrhTbY3Ce1llHv?=
 =?us-ascii?Q?5Yv6nG3fDWNpqNIfOSt7Vwz3H5thaHLOBPh3qxgoLR+AatSOG3JCRlyE4piY?=
 =?us-ascii?Q?917vNbaMGbvgNq/HQR1xpOuYXB4rOHPjdUBdOuRSGuf3nGo6i8dv5xO9d7Yb?=
 =?us-ascii?Q?Jat2h9aradraJ2NYtMCxlFmBU4MOefWo/x5D8XjiB9B65Hz4t1LhBat7f3+T?=
 =?us-ascii?Q?11kYV82wlvxtlKrOxkf7C7fettzMJCItkOHzizPBD8U17ngV9YUCAm+dcwl0?=
 =?us-ascii?Q?PQFPC9gAAU7x2Wuhi+c0MVwMJrEBkpbSY9cBgKUXiE8tIyTOFZ09BYcVRFkE?=
 =?us-ascii?Q?M3FJs9LhVi7xBEBx+IwPc4MZ9HtOYh0Q7HCfL5PFjYgfbE4x4meUwzT40RMb?=
 =?us-ascii?Q?RDFXRi8NsCh/ldRmGjHDRc0/9KVcF5KY+iZ+jociycNjSjWBfMhFpGVC81Pn?=
 =?us-ascii?Q?TNau7Nxv/mzY1P0o2IqSJMPD486qubTNwZU9KSdBZN99E9ICNBwtfC3SGP2c?=
 =?us-ascii?Q?eLRVWOHWuDOdDoLc14ESEiG6naWWFGj4NljH3cAkHTlE59r+ErIFF4h5kyId?=
 =?us-ascii?Q?fflUT4lXvyLZrZLzMWQ3k9V9prkm+HIgcH3p6va897ULbD4NVdReVy7MzePd?=
 =?us-ascii?Q?5hhRiGrEiTF+wW8aow5AqRD1OTBARKaHzE3rQtrNSVooRI0pVdiC5HWX5S5S?=
 =?us-ascii?Q?HOFU9DlZiWB0E7Z+SFQ+m1U4JkJqKJPGyH6B41Bt/JYSm18d0cRDudYY1wjN?=
 =?us-ascii?Q?rNkbOyzCW5DmXfbAg5VsBpDST2UOeIn0d+MQSx/Ru0vMVC0LiPDjT1nzAozf?=
 =?us-ascii?Q?9GadybQYfcDe9Mq5QFalHfa4rd6W2z20UMsPdfgA5K4HIepmWJNaYiPfHMmw?=
 =?us-ascii?Q?nrUfGhHKcNNtFfeIO54Pfo/KyfDo1/cwj71bDFhPVWHh5b4FXc42M4CUxdk6?=
 =?us-ascii?Q?d2FxJF7GoPnTct64937lg+xK7RzZ0rzvHTkhzv+cJoLxSijDYnhLhF1JWQKO?=
 =?us-ascii?Q?Xz8IQ+yy+S5M8ZWm8zw+09i2kU+a1lbEboE80Xike9fUNs9a9cMG1aLY8INK?=
 =?us-ascii?Q?OWVlYxpyqexBLKB1C0Rg6ADyv4p7g1aMQQliszTyLN4UY6FcSGGT9co7eM6o?=
 =?us-ascii?Q?M8kCb3i9ix+JmFIeUr8GitNpjLc5vNdpJkIHRzcrW56aFfHmCLj9Xc7xTR2R?=
 =?us-ascii?Q?49TuYUv3Tf5PxytJLKZPz0y1g12dPOLmR9QGcJ8co7EWFXnZCiKZFBLURa/W?=
 =?us-ascii?Q?mqHRJE6Fbtr6eedet3YjXWjPNADiwsd6SnGWijqSBaFIDniOvFCCL5hDD/gE?=
 =?us-ascii?Q?BKoxmnajEEMzf+8tY3DCnHqjKfNUV4IGoAh1qdvZkhM7DFaTNUlFu4OR8p1l?=
 =?us-ascii?Q?YfdS2saxaFbwUNPQYd7aEMBNyG9x2ObKL/luslvDBfhM52nwHRPhE5fetwTc?=
 =?us-ascii?Q?jH2McocyRT5FmETZAMbX+W0aCi9/Jbf/v4xWNYKp1IM+yokNdz+tShsnL/cC?=
 =?us-ascii?Q?XtM7tK4ucJ+h5fZ8Q+hD/10d5H8KsRKKX0wl/33fPzftytoNeuiA4xnmAUwA?=
 =?us-ascii?Q?UqWeE8zvG3qqNi87Qt6rOopUi4nX+T9zOXIE83jRvUZfJoe90VDII326VdXB?=
 =?us-ascii?Q?rQutzOT+7N0rwSGlIlYK5UXNpdtDrNGLIODoHX9LnfbxoC6dQo42iF2yFp5C?=
 =?us-ascii?Q?I/IZv4yXoP0Nwr7Z+wxlm4SPl1HHuwjncSMQiirRRm9sXL79z+rFgZbMF8lz?=
 =?us-ascii?Q?/IehhmNIM+bpWzuZtiEGULtx/yIMzSc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c460ef74-d5ef-4d20-98e3-08de78f3e3be
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 07:10:02.7856 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 14iYRhgKra82OyfzXRpMY5S0oxrnrgRSGkbGqfKqaav37vGbT0cyjRPoKknaOyV/cIJX9jllmH+t5YjZhlOTkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8381
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

On Mon, Mar 02, 2026 at 08:46:12PM -0800, Niranjana Vishwanathapura wrote:
> Add kernel doc to all exported functions that do not have
> a kernel doc in xe_exec_queue.c.
> 
> Assisted-by: Claude 4.5 Sonnet

Thomas has a patch here [1] suggesting Agent:Model for the 'Assisted-by'
tag. Let's see how the community responds but the tag as is likely fine
until the checkpatch change is merged.

[1] https://patchwork.freedesktop.org/patch/708137/?series=162433&rev=1

One more nit below.

> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c | 111 +++++++++++++++++++++++++++++
>  1 file changed, 111 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index bb273ca02d28..d34d5df0e9bf 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -399,6 +399,20 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q, u32 exec_queue_flags)
>  	return err;
>  }
>  
> +/**
> + * xe_exec_queue_create() - Create an exec queue
> + * @xe: Xe device
> + * @vm: VM for the exec queue
> + * @logical_mask: Logical mask of HW engines
> + * @width: Width of the exec queue (number of LRCs)
> + * @hwe: Hardware engine
> + * @flags: Exec queue creation flags
> + * @extensions: Extensions for exec queue creation
> + *
> + * Create an exec queue (allocate and initialize) with the specified parameters
> + *
> + * Return: Pointer to the created exec queue on success, ERR_PTR on failure
> + */
>  struct xe_exec_queue *xe_exec_queue_create(struct xe_device *xe, struct xe_vm *vm,
>  					   u32 logical_mask, u16 width,
>  					   struct xe_hw_engine *hwe, u32 flags,
> @@ -442,6 +456,19 @@ struct xe_exec_queue *xe_exec_queue_create(struct xe_device *xe, struct xe_vm *v
>  }
>  ALLOW_ERROR_INJECTION(xe_exec_queue_create, ERRNO);
>  
> +/**
> + * xe_exec_queue_create_class() - Create an exec queue for a specific engine class
> + * @xe: Xe device
> + * @gt: GT for the exec queue
> + * @vm: VM for the exec queue
> + * @class: Engine class
> + * @flags: Exec queue creation flags
> + * @extensions: Extensions for exec queue creation
> + *
> + * Create an exec queue for the specified engine class.
> + *
> + * Return: Pointer to the created exec queue on success, ERR_PTR on failure
> + */
>  struct xe_exec_queue *xe_exec_queue_create_class(struct xe_device *xe, struct xe_gt *gt,
>  						 struct xe_vm *vm,
>  						 enum xe_engine_class class,
> @@ -533,6 +560,14 @@ struct xe_exec_queue *xe_exec_queue_create_bind(struct xe_device *xe,
>  }
>  ALLOW_ERROR_INJECTION(xe_exec_queue_create_bind, ERRNO);
>  
> +/**
> + * xe_exec_queue_destroy() - Destroy an exec queue
> + * @ref: Reference count of the exec queue
> + *
> + * Called when the last reference to the exec queue is dropped.
> + * Cleans up all resources associated with the exec queue.
> + * This function should not be called directly; use xe_exec_queue_put() instead.
> + */
>  void xe_exec_queue_destroy(struct kref *ref)
>  {
>  	struct xe_exec_queue *q = container_of(ref, struct xe_exec_queue, refcount);
> @@ -565,6 +600,14 @@ void xe_exec_queue_destroy(struct kref *ref)
>  	q->ops->destroy(q);
>  }
>  
> +/**
> + * xe_exec_queue_fini() - Finalize an exec queue
> + * @q: The exec queue
> + *
> + * Finalizes the exec queue by updating run ticks, releasing LRC references,
> + * and freeing the queue structure. This is called after the queue has been
> + * destroyed and all references have been dropped.
> + */
>  void xe_exec_queue_fini(struct xe_exec_queue *q)
>  {
>  	/*
> @@ -579,6 +622,14 @@ void xe_exec_queue_fini(struct xe_exec_queue *q)
>  	__xe_exec_queue_free(q);
>  }
>  
> +/**
> + * xe_exec_queue_assign_name() - Assign a name to an exec queue
> + * @q: The exec queue
> + * @instance: Instance number for the engine
> + *
> + * Assigns a human-readable name to the exec queue based on its engine class
> + * and instance number (e.g., "rcs0", "vcs1", "bcs2").
> + */
>  void xe_exec_queue_assign_name(struct xe_exec_queue *q, u32 instance)
>  {
>  	switch (q->class) {
> @@ -605,6 +656,15 @@ void xe_exec_queue_assign_name(struct xe_exec_queue *q, u32 instance)
>  	}
>  }
>  
> +/**
> + * xe_exec_queue_lookup() - Look up an exec queue by ID
> + * @xef: Xe file private data
> + * @id: Exec queue ID
> + *
> + * Looks up an exec queue by its ID and increments its reference count.
> + *
> + * Return: Pointer to the exec queue if found, NULL otherwise
> + */
>  struct xe_exec_queue *xe_exec_queue_lookup(struct xe_file *xef, u32 id)
>  {
>  	struct xe_exec_queue *q;
> @@ -618,6 +678,14 @@ struct xe_exec_queue *xe_exec_queue_lookup(struct xe_file *xef, u32 id)
>  	return q;
>  }
>  
> +/**
> + * xe_exec_queue_device_get_max_priority() - Get maximum priority for an exec queues
> + * @xe: Xe device
> + *
> + * Returns the maximum priority level that can be assigned to an exec queues.
> + *
> + * Return: Maximum priority level (HIGH if CAP_SYS_NICE, NORMAL otherwise)
> + */
>  enum xe_exec_queue_priority
>  xe_exec_queue_device_get_max_priority(struct xe_device *xe)
>  {
> @@ -924,6 +992,17 @@ static const xe_exec_queue_set_property_fn exec_queue_set_property_funcs[] = {
>  							exec_queue_set_multi_queue_priority,
>  };
>  
> +/**
> + * xe_exec_queue_set_property_ioctl() - Set a property on an exec queue
> + * @dev: DRM device
> + * @data: IOCTL data
> + * @file: DRM file
> + *
> + * Allows setting properties on an existing exec queue. Currently only
> + * supports setting multi-queue priority.
> + *
> + * Return: 0 on success, negative error code on failure
> + */
>  int xe_exec_queue_set_property_ioctl(struct drm_device *dev, void *data,
>  				     struct drm_file *file)
>  {
> @@ -1148,6 +1227,17 @@ static bool has_sched_groups(struct xe_gt *gt)
>  	return false;
>  }
>  
> +/**
> + * xe_exec_queue_create_ioctl() - Create an exec queue via IOCTL
> + * @dev: DRM device
> + * @data: IOCTL data
> + * @file: DRM file
> + *
> + * Creates a new exec queue based on user-provided parameters. Supports
> + * creating VM bind queues, regular exec queues, and multi-queue groups.
> + *

also multi-lrc exec queues.

Feel free to add the above part when merging.

With that:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> + * Return: 0 on success with exec_queue_id filled in, negative error code on failure
> + */
>  int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>  			       struct drm_file *file)
>  {
> @@ -1324,6 +1414,17 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>  	return err;
>  }
>  
> +/**
> + * xe_exec_queue_get_property_ioctl() - Get a property from an exec queue
> + * @dev: DRM device
> + * @data: IOCTL data
> + * @file: DRM file
> + *
> + * Retrieves property values from an existing exec queue. Currently supports
> + * getting the ban/reset status.
> + *
> + * Return: 0 on success with value filled in, negative error code on failure
> + */
>  int xe_exec_queue_get_property_ioctl(struct drm_device *dev, void *data,
>  				     struct drm_file *file)
>  {
> @@ -1461,6 +1562,16 @@ void xe_exec_queue_kill(struct xe_exec_queue *q)
>  	xe_vm_remove_compute_exec_queue(q->vm, q);
>  }
>  
> +/**
> + * xe_exec_queue_destroy_ioctl() - Destroy an exec queue via IOCTL
> + * @dev: DRM device
> + * @data: IOCTL data
> + * @file: DRM file
> + *
> + * Destroys an existing exec queue and releases its reference.
> + *
> + * Return: 0 on success, negative error code on failure
> + */
>  int xe_exec_queue_destroy_ioctl(struct drm_device *dev, void *data,
>  				struct drm_file *file)
>  {
> -- 
> 2.43.0
> 
