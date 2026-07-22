Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79C96C44512
	for <intel-xe@archiver.kernel.org>; Wed, 22 Jul 2026 04:28:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19F4110E29E;
	Wed, 22 Jul 2026 04:28:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DjZBUICu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 131F610E29E
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Jul 2026 04:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784694521; x=1816230521;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=qETOfrMRjGuUYWZoY0dEg0X77qUlD6TRlBDwJoN7vUc=;
 b=DjZBUICuhrMK6OZRhppEBe8OI6oZ0XMdKthpdsswUg5+lJu6keOcNrWL
 hYUF4oXYYKBwenhlPJiixQd0zhC33lyrLhUvrQ+NaNSbDDPOAGWRQdtFY
 tjq/phRowHJBwNbzPSyiQI6N6R8eXUOs4q1Mxo5qvSV3ZMFdB7GiSeI5B
 AeVL8WQP1T0J/3Uprwo0/r+Vu+nDsONVN5Lduyi6VIjR2Yh6+FFoaDM/J
 i9zabSaaYxedf60bqNlq83ZANsabdUGgl90/L3YwDux45Y1PmaXiBH8k4
 /o0zgEokOtj2UfPdZRFq78LDn7pMY4GEZOXRhrS1AlmvskdVmBrJ5lxek Q==;
X-CSE-ConnectionGUID: YNIkc0oyQFaOSix7VOVStQ==
X-CSE-MsgGUID: 2Ox7r0qNRGOOi6f1dKU7Xg==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="85513519"
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; d="scan'208";a="85513519"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 21:28:41 -0700
X-CSE-ConnectionGUID: wTWpo8FxTn+unXoK5DSSYg==
X-CSE-MsgGUID: S3mgNrRASaaS1ZjH3YQ6TQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; d="scan'208";a="262910369"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 21:28:39 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 21 Jul 2026 21:28:39 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 21 Jul 2026 21:28:39 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.34) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 21 Jul 2026 21:28:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YsAkHk1H2Qw3JksjIHLT/eMflgy6O2BzKieNXUVCf8NbwL7iDonE/phROwxWclt6d7sMEu3QDrbHzTp6F7zPPRnWw8VOli47KrDQhI/qM0N1GhQe1ZDbVNm4mGiot7ckAXqW12EHTiE80cjErrJnX43Y8ihwZjfzh47NX3fXVhK//2i4GEKsHw+wEkw2r6doDWhVJpu9xOW2CLV5dmTRHxAEY3cu16ydJclf6WHSG1utY4LJGfiHLmO7b5uTqLiqmedncP5H+ZgTdc6ecY2Tzj1FbSA1vsYt473CPymKcqNcsGqy3gqrazxEZ6hMBqYkMH9uqP9G829ggfHIC8xNOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oCM0XkMFLPwLX6VuXMRlaH6IyXGfF+Z4IduCW4y59pw=;
 b=yJwjIySTGD/FNbuiWqvIqMapNqnN6Jy3dlKoTbEAdDNRiF1O5gY1faD8Q/nVssBc23S9n7qDNDxvbYOKi9kktk3/OaIB1ONoWEPIDeAiSQ/Om9UVijx9xyAdfi50GskwqdkA30kH6Thba+oi/64BD+X5c8BcYV4gnukSNeu1bVtBngOMov9XIi+2EFt7kO/12fBSrVWW6+MxzzCDS6WVrXJpaDZDxZeAUqM4Wm73peM9uICA7XJWn4GCKEMEqQ0svaARMtabP9yPQiQHlERyjaCJOaSaXOXnVbmxS7b5ZnZVe+YNHvGpQzpSw91c+fn31/QeMgqKB0rNxYtOFsaplg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB5111.namprd11.prod.outlook.com (2603:10b6:510:3c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 04:28:30 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 04:28:30 +0000
Date: Tue, 21 Jul 2026 21:28:27 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/xe/multi_queue: Add needs_cgp_sync mechanism for
 VF post-migration recovery
Message-ID: <amBG6xTIqqSVD4lu@gsse-cloud1.jf.intel.com>
References: <20260722005617.2912343-4-niranjana.vishwanathapura@intel.com>
 <20260722005617.2912343-6-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260722005617.2912343-6-niranjana.vishwanathapura@intel.com>
X-ClientProxiedBy: SJ0P220CA0001.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::7) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB5111:EE_
X-MS-Office365-Filtering-Correlation-Id: 676584b2-abf3-4ca9-378a-08dee7a9aea1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|4143699003|11063799006|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: vjJEPkukUcdKNk6pwL8tIfZZtiwdGIKvHv/lIWiGmUjqlukC1ejm7LW0BBmYQpW2Jvkbg0gCgoWDP2DZ2LNcM3mxe+AZiHB07WGxVCcltSY88fIe6oK8LOi5+mJVVTG0MvOrBd+Es7slJD2usZ0OOYTXX1eA6is+7fSupyUrhOBYVczH8FI77EIGhl1jrnGs0YrUm4B3teuZGkF2ii5npBP5yVDHxGxdHWv6gRGQ9E7g9e4+KjPGUE6TvmGhgp3mM7lTW/F74uFM4gcLk18C62J05L12TbC4FKU3VRgYgbVWTaJlV8N2Gbd+hwU4yan1P/Quhi4/qJgPy5dWd5txDIVUwQUXcuKXJNA/Nue/zNLk9fk67UNqoIOoLIMZWXLYkC8vK++3Sh1L2V1jjqMM1wWpCjIHOmkdvkfblNRw/5pDibT5E7kjhmA2Vcx0UkyxSk+/iqKQ2r2DaRgV5xWN1Yqn/VrHtAaNKOa3zjOneVfKtShSpvpRUtnqpNUHhAc69JYnp87HvaqLeAes0WyRUdnlnFpRnJmaOvAXthpk3+yAxMprFPoQ8en8N7mVOIuvMMnSscMMe8ziN8Ndb2rfp7zjG0QJVLbB0oH0bzqccjyYHLcQwsg0W34xDWxLaw0rf1RGdO30uzp2EY73FqPkw7b3W37KDSIQSORxg/Nw4X8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(4143699003)(11063799006)(10067099003)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?o3HmckDWshOvP0gGI8xzMdTjKB4fLyFTJdt1GurKl9JyeKMreiOWZ8KOU8DP?=
 =?us-ascii?Q?augRfQmW+F9JKlVg6CjgvWRvevwWZ4GwOPb7KDNRq/5JXWJSw7txNloqjCpY?=
 =?us-ascii?Q?S/VKSCPdzqyFvKzboZJ8cL05BpnWZFjhKK2+a8b1KSyu1CDNxkqmQISzmANn?=
 =?us-ascii?Q?X7YaeXhsn2Nxj4aAjWXvLftmO2n7ndSBzIfmsy/bfrvbW/li45kM5SLYc6/x?=
 =?us-ascii?Q?FmBpPgnEdA090D7gmfb3wUBimyctiJ3F4aw6Ty4eP75ydcdeS+T9Q+UQNIjy?=
 =?us-ascii?Q?6cVLo7aom4denGWKC24FFetrr7sx9/6UeVa6eS4QnbchdKvNsgwfJ6vAfW4s?=
 =?us-ascii?Q?TPfeKIRSBfcoWC5xxtErnA9N0gTlLD+TC/DA+P+u6Qo+OBs06kgOcloxaYA0?=
 =?us-ascii?Q?qjFW7g18jhDwVTi2Y6DcAM3MNF0LS3eZ/kcVIIc/dZ3URwEY23nLvuri8EU6?=
 =?us-ascii?Q?tNsMBJFvJZJBTRd3DRM6A8h/dmu5PIn4AVu5mRphnM/cMHblAaLv+DbEg1Vb?=
 =?us-ascii?Q?AvVr0QhpypRNzJFXQ9kqY9ZwPgAMQ16l71qwuDmlUopIcUn2ngk/GDs73eIj?=
 =?us-ascii?Q?hImjoLLgflBJPisyi4SBgrgqjdsULX2rwO93GlgFA3iF98jz5DU3rZgdOTBI?=
 =?us-ascii?Q?3Ag/Dh7fcPMw5YybCCz47GNHrmFn+zjQvNwwmacJB5mik27seHLvthAWSG8g?=
 =?us-ascii?Q?lMk0Xnk3OCscFjw9LmzIWIfbbpBg1ejE2HRC0PSYJO1ci/pVuuhlXfrKumII?=
 =?us-ascii?Q?hjmaMm0ZolaAyytVur/Jn6kuN3kx2GweBfvuOtxvyWag1U7XLXa+6XPojiYV?=
 =?us-ascii?Q?RrynG/C3CAWsZfULY/u0sQ+2Ewzwtxn506CFPOCraYGHA2HypwjBkXF/vtuY?=
 =?us-ascii?Q?qVwBzXjiZaZ8tq2/jLx0NWtDn/z6B1w9phPjy0tnsk2LNFJSwwAm/1RNtJMi?=
 =?us-ascii?Q?hKOdkgiKfhyMapZIItgj8oxNTV1wvCdSBBNFfrgDdiv7gkG4u2apAsM7D/0N?=
 =?us-ascii?Q?VPiOm+jMefoT51Wg+Qt2+Cewvnn+UsRJA/vLQSjQDYcwQA2t7j9MLfYyU9mz?=
 =?us-ascii?Q?Rxu5nqz6WM0Z+zfQRSAUoSVJcalXNimgUxZ/HkyE2YU5aY60C0SdSfnVohnZ?=
 =?us-ascii?Q?em8xQxUAQG/MLFBU0QCmiZ9FmfKVPdnWTFe1ASrRB7eT6I9UN0vAermhLbtW?=
 =?us-ascii?Q?Avw3a0Xjs5XoKdh58W+HKV1LPDtsU9q1h1yDxY6rf2TTifh7GlKdfrcN3d1u?=
 =?us-ascii?Q?vTN5vGIF2FoPuhASQLSh3c9nYF9zT4MK3hvISQ7wbziNQrJklE0O2peW3/3t?=
 =?us-ascii?Q?abk7/AHeVuXqHjAFMkvDoF7HgLFwAYwpiwjGKbDcuM+iSHZs1+eYVL/475qr?=
 =?us-ascii?Q?Q7AgTLD0epMRRAlYAPQ9klafxfTL4pOs6e6LMb4ZgPzRtkkUVS37UDEy01O7?=
 =?us-ascii?Q?16pm2MGSvISzM8OJUisAsLddx30/rGUnr4am8QXJBuLVKLY5o6UYdJ4OL4eX?=
 =?us-ascii?Q?T9N/Vl3mI2iYs0zGqk4nkIG5BiL9mmgFm2l2y4sy4+ZZ34O+8KchBcPj3+j4?=
 =?us-ascii?Q?6anIk/ypPsQycKgRCwRvk2gEGAS6vWBjj2TdluUfPSejgdL+kYTHV91Lz4W+?=
 =?us-ascii?Q?N4DHxRcelfM9l0SOVg72+YkfsHHcKFUA/yhole12CzrkGwfBQ8YmHA+ZPTZv?=
 =?us-ascii?Q?jpHQZVtJR1SY9cnmEW7428bmmOof+n6q5ovqxYoLKmGef6yafsSZRo2vtXwe?=
 =?us-ascii?Q?d3PTbFRhMiuQidOmQf2zZ/EdcQHDOog=3D?=
X-Exchange-RoutingPolicyChecked: sVtg8tGu1/N11gFH9nqyZf5yHUQ40paF7WRzJy4aitiafXxdPRjgie2svQxOC7z6+W9yQVeLMU761m0fCvEJoUvGUZTOKB1IPUuw3Q9I9DICB669BpLC2pRAB9D6xrdx+BKP9M5gmXTYGPRhnaRLPKdImLgPygJ8e7phn9I96i0oH5KUA0XLKNlizdwRkWeW2RvHCsHhRaTsZgbv836CnV2GlMClZB5GLYC3UswCi36H0ztByvUnJimi29jn4hKvisXqWQGkhcpm1dJFS5r3ysMy7uhY2eU4CA0DrVsVWG891i6Y9YCGfeiTL4eIn1Dng84kJuaOmhbTphOsJkrPfw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 676584b2-abf3-4ca9-378a-08dee7a9aea1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 04:28:30.2487 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oXzcm2+2ajEs+BM6EuJkA+MQodmUrTejUNaoRGjcsYoyvUyDBvx4PmCdTDRDTqtWu/9Y6w7WbguQNy1EsfspZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5111
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

On Tue, Jul 21, 2026 at 05:56:17PM -0700, Niranjana Vishwanathapura wrote:
> Multi-queue groups use CGP_SYNC H2G messages to notify GuC of queue
> additions and priority changes. If a CGP_SYNC was in-flight when a VF
> migration was detected, the response will never arrive and sync_pending
> will be stuck set, causing a timeout on the next attempt.
> 
> Introduce a needs_cgp_sync flag in xe_guc_exec_queue (mirroring the
> existing needs_resume / needs_suspend / needs_cleanup pattern) to track
> this case:
> 
> - In guc_exec_queue_revert_pending_state_change(), if sync_pending is
>   set on a multi-queue exec_queue, clear it (preventing a timeout on
>   recovery) and set needs_cgp_sync, unless the queue is about to be
>   re-registered (which will issue its own CGP_SYNC).
> 
> - In guc_exec_queue_replay_pending_state_change(), if needs_cgp_sync is
>   set, push a STATIC_MSG_CGP_SYNC to the scheduler head so the CGP_SYNC
>   is replayed after unpause.
> 
> Wire up the new CGP_SYNC_MSG opcode and STATIC_MSG_CGP_SYNC static
> message slot, along with __guc_exec_queue_process_msg_cgp_sync() to
> handle the message in the scheduler workqueue.
> 
> Assisted-by: GitHub Copilot:claude-sonnet-4.6
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc_exec_queue_types.h |  7 +++-
>  drivers/gpu/drm/xe/xe_guc_submit.c           | 39 ++++++++++++++++++++
>  2 files changed, 45 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
> index acdc24d1a6bd..f7945bb40813 100644
> --- a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
> @@ -36,7 +36,7 @@ struct xe_guc_exec_queue {
>  	 * a message needs to sent through the GPU scheduler but memory
>  	 * allocations are not allowed.
>  	 */
> -#define MAX_STATIC_MSG_TYPE	3
> +#define MAX_STATIC_MSG_TYPE  4
>  	struct xe_sched_msg static_msgs[MAX_STATIC_MSG_TYPE];
>  	/** @destroy_async: do final destroy async from this worker */
>  	struct work_struct destroy_async;
> @@ -76,6 +76,11 @@ struct xe_guc_exec_queue {
>  	 * recovery.
>  	 */
>  	bool needs_resume;
> +	/**
> +	 * @needs_cgp_sync: Needs a CGP_SYNC message during VF post migration
> +	 * recovery.
> +	 */
> +	bool needs_cgp_sync;
>  };
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 213e5be1e775..9f2a6040aa57 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1928,11 +1928,20 @@ static void __guc_exec_queue_process_msg_set_multi_queue_priority(struct xe_sche
>  	kfree(msg);
>  }
>  
> +static void __guc_exec_queue_process_msg_cgp_sync(struct xe_sched_msg *msg)
> +{
> +	struct xe_exec_queue *q = msg->private_data;
> +
> +	if (guc_exec_queue_allowed_to_change_state(q))
> +		guc_exec_queue_send_cgp_sync(q);
> +}
> +
>  #define CLEANUP				1	/* Non-zero values to catch uninitialized msg */
>  #define SET_SCHED_PROPS			2
>  #define SUSPEND				3
>  #define RESUME				4
>  #define SET_MULTI_QUEUE_PRIORITY	5
> +#define CGP_SYNC_MSG			6
>  #define OPCODE_MASK	0xf
>  #define MSG_LOCKED	BIT(8)
>  #define MSG_HEAD	BIT(9)
> @@ -1959,6 +1968,9 @@ static void guc_exec_queue_process_msg(struct xe_sched_msg *msg)
>  	case SET_MULTI_QUEUE_PRIORITY:
>  		__guc_exec_queue_process_msg_set_multi_queue_priority(msg);
>  		break;
> +	case CGP_SYNC_MSG:
> +		__guc_exec_queue_process_msg_cgp_sync(msg);
> +		break;
>  	default:
>  		XE_WARN_ON("Unknown message type");
>  	}
> @@ -2128,6 +2140,7 @@ static bool guc_exec_queue_try_add_msg(struct xe_exec_queue *q,
>  #define STATIC_MSG_CLEANUP	0
>  #define STATIC_MSG_SUSPEND	1
>  #define STATIC_MSG_RESUME	2
> +#define STATIC_MSG_CGP_SYNC	3
>  static void guc_exec_queue_destroy(struct xe_exec_queue *q)
>  {
>  	struct xe_sched_msg *msg = q->guc->static_msgs + STATIC_MSG_CLEANUP;
> @@ -2716,6 +2729,22 @@ static void guc_exec_queue_revert_pending_state_change(struct xe_guc *guc,
>  			  q->guc->id);
>  	}
>  
> +	/*
> +	 * If a CGP_SYNC was in flight when the VF was paused, clear the pending
> +	 * flag to prevent a timeout during recovery. Only schedule a replay if
> +	 * the queue won't be re-registered (which would include its own
> +	 * CGP_SYNC as part of the registration process).
> +	 */
> +	if (xe_exec_queue_is_multi_queue(q) &&
> +	    READ_ONCE(q->multi_queue.group->sync_pending)) {
> +		WRITE_ONCE(q->multi_queue.group->sync_pending, false);
> +		if (!(pending_enable && !pending_resume)) {
> +			q->guc->needs_cgp_sync = true;
> +			xe_gt_dbg(guc_to_gt(guc), "Replay CGP_SYNC - guc_id=%d",
> +				  q->guc->id);
> +		}
> +	}
> +
>  	q->guc->resume_time = 0;
>  }
>  
> @@ -2921,6 +2950,16 @@ static void guc_exec_queue_replay_pending_state_change(struct xe_exec_queue *q)
>  	struct xe_gpu_scheduler *sched = &q->guc->sched;
>  	struct xe_sched_msg *msg;
>  
> +	if (q->guc->needs_cgp_sync) {
> +		msg = q->guc->static_msgs + STATIC_MSG_CGP_SYNC;
> +
> +		xe_sched_msg_lock(sched);
> +		guc_exec_queue_try_add_msg_head(q, msg, CGP_SYNC_MSG);
> +		xe_sched_msg_unlock(sched);
> +
> +		q->guc->needs_cgp_sync = false;
> +	}
> +
>  	if (q->guc->needs_cleanup) {
>  		msg = q->guc->static_msgs + STATIC_MSG_CLEANUP;
>  
> -- 
> 2.43.0
> 
