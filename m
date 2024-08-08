Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12D18C3DA4A
	for <intel-xe@archiver.kernel.org>; Thu,  8 Aug 2024 03:52:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C87FE10E636;
	Thu,  8 Aug 2024 03:52:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SBpACQ60";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2551410E636
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Aug 2024 03:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723089123; x=1754625123;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=FGsPJdC8Mw3yOFZYHNQa4KqTgAY7JrLi9+dcj5M838k=;
 b=SBpACQ60bkEFYrLAflo4NpR6OlYsmZxqtrezzVwHKBgbysdapeZU+fXl
 7j/NwGsJ9dR3wv0rz/cwROlFAXKzRisxXbQjxLw8j+fS+Mx0NIXL6wCwP
 z3Y8JNsR/vwL7vY1K4sYelHh2+FR58+o27DA4fNrco0K5CTOxvofxGIPQ
 rWRsM3kUZkOP2WmB8lhD3vyueO7SkLG/WwbEYo4GqUoM5oYS8dzuttN/1
 9yp5QzrvDZIRwgP1aQKmwXdVwq8EaRxVGmWEgu11Be8hicpAY2se07vYf
 eWGdxuRYU8e9vG8Epjsj/JbNI4d87ozOXn61HAaLYe9WVGURD8EVmfNPM w==;
X-CSE-ConnectionGUID: 819wAHcSSjK/VpIabzgyoA==
X-CSE-MsgGUID: aj01fIJQQtKZ9HV5eYqKJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="46594458"
X-IronPort-AV: E=Sophos;i="6.09,271,1716274800"; d="scan'208";a="46594458"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2024 20:52:02 -0700
X-CSE-ConnectionGUID: /2Sutex9RPObrU/P+2mexA==
X-CSE-MsgGUID: mYnoZS9jRyGUC0kyA5Fd/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,271,1716274800"; d="scan'208";a="62021906"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Aug 2024 20:52:01 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 7 Aug 2024 20:52:00 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 7 Aug 2024 20:52:00 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 7 Aug 2024 20:52:00 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 7 Aug 2024 20:52:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yKLhf10sHdCheECoVdm44tlbwWQ4rsrK3Zre20nLNy2rdBOw8GV9JzCJMvYI2h2eFEpKzPJx/W7CjCe/+aLdWrYJqlSo5Y7nsW0zg6PxBOSCgXsW8XwIjtjPlZ2lIOE08iFRbtts07HV0Yp0f/UbuVEBmOSa0V5jVY2Gj9EHzuwaHE2UPy04VRjBXQvpoWkmTRjvJxUt4knBejI7s7uFi32IKV87AyVk8zCLBxORkBiQ2ylfJhu+O+0AQAvj5IfVnpDoqt+ZYFO5xPN8cMTDdGIqgL84WNF/MdrGzJqiJ57RpPLuGw8cfJOzr6SqCN03Eab2VMIld1kibAtYyKywaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ewTRuV/lHcBGU7W7jPulAXoTslLWKPrVURauoUYT4Ps=;
 b=IdhCx9wZoZ3qOFDkOVsZXBkUapyN0KazvugGDgBqMhShxPUfadLPKK8GzowpQ5kPhLhYcrncm+9p8Xpm8xJNNY/6KzcMEzZCPe55FPJlUlqYbxBVZ4cZOdY+g/sCX61GjPKiEFCycbDZBU/ggKX4qR0vYxGB5ZcDAI/eNFdWclaV7ccePVxpK/hrRawP3734U6IxOtOqUD9InQpMmtfjhzfy97PJZpwyLhN8GGTXaL8zz7xe+yaZkO2+YDVKPg7jZ9pbVP1jplncAO8dmGCrHsKiUf5+rZAYtQXHLMPUoiYNuwLTNn1zow6BHdoZWbp4abgG2EsMnoMboD9+tVH4ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA2PR11MB4794.namprd11.prod.outlook.com (2603:10b6:806:f9::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.19; Thu, 8 Aug
 2024 03:51:57 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7828.023; Thu, 8 Aug 2024
 03:51:57 +0000
Date: Thu, 8 Aug 2024 03:50:38 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v7 05/13] drm/xe/exec_queue: Remove duplicated code
Message-ID: <ZrRAjtTSAR2/4hIN@DUT025-TGLU.fm.intel.com>
References: <20240807162416.1307061-1-francois.dugast@intel.com>
 <20240807162416.1307061-6-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240807162416.1307061-6-francois.dugast@intel.com>
X-ClientProxiedBy: SJ0PR13CA0128.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::13) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA2PR11MB4794:EE_
X-MS-Office365-Filtering-Correlation-Id: 45eca384-a9c9-4d65-143a-08dcb75d736d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mrycvLk1FXmziPrp+yu/KlU0meb/6r/GsyJALumq9edYXP+z0f9/KWeE30Ni?=
 =?us-ascii?Q?fPXhIGF5BbDxkzfRvvJARSSkVbWMivif2u7pBiNqCJIBNm989mrhvyqkXMK6?=
 =?us-ascii?Q?4mRLWmgNxgvmUNSWUcAh5p7LGZbaAjtUUbBlkWdGeMPFXgSWf47A9UJd47ZZ?=
 =?us-ascii?Q?8u8hH7dhtzglq2FYDNPFE7kfiI6hAqw3IzXHdri54nPf0VNNKia/sep4mhA+?=
 =?us-ascii?Q?UsP38vi9rA4sxgGnxIVWHsoNu1C6aqOG6GxwRszS5lDA4TQvNByqpVf4h/LZ?=
 =?us-ascii?Q?JiD1h7v3UbvJcjuJZUm6I4tkxETG8TvGh31GyNloUkQniGqXFageVpeBKpah?=
 =?us-ascii?Q?y1DNdrZEGPq5ZyiJsREKaV8mQJYKYOjGJozNXrWC9FhQXUCFFR6ssqNo9IoI?=
 =?us-ascii?Q?5xxkjLuCZI+VihfIkChXls55WqlIgacBCIRsxEyInsQ74fEihVp/FDrTlGmv?=
 =?us-ascii?Q?pprcUGWpFVyKHoum6kvbfhqE07TLmf4aAWCxCCjb8crHMcKnUG3f6OrCUVaB?=
 =?us-ascii?Q?ZNMhhwXIcVc6Y31I1Y4QFhtU0i1SIhN2+th7psDL7MlNasvmK99sYtwtNS+G?=
 =?us-ascii?Q?lGzIcTQ4tv9SDGdWVW0pVfUgQX/G/b3h/XoUe1sr5SCZaNlMNjLFJpZNVvbf?=
 =?us-ascii?Q?MSaDn0u2dKfHUtxDZZ5acPiiMReWlJFVaR6USrrIWzfl7PqnXJeczfyobEq7?=
 =?us-ascii?Q?1h2Hl1lesfiAXOCpiupCEfMnGndnipzVU1C9+smGvEVMskYRjAOLsYEj/ZOD?=
 =?us-ascii?Q?3eD/DCeOdbBeffvN/JwDzgPTl9TQHemAVgnN1Uq6JmV0gHXQARNUPM71ErBy?=
 =?us-ascii?Q?zmjVcla1N9JQq5uOodwJwEeUB8r7JqEbhlEfHE64SbGWXjN5hzU4eMJy6iZ6?=
 =?us-ascii?Q?54isAANRGoke09fkNmOxTw2R+MWlzJJ3ylGb3wulhFmBkfK7GF4Tk2xmfJ/I?=
 =?us-ascii?Q?faURo8qdLLUEkRxGkBb5oz6jnk6oeIpmHMNXkIlxw//PnyrPLty3lqrPhU3T?=
 =?us-ascii?Q?vrZTWhF9Cgz8SjGD/nxc+/uCz9sAvsP3Dcl7K242gdX0hE49uqEuuXRmWgac?=
 =?us-ascii?Q?LxKC+iTMgqUsyK+KYp54kpHcdTQS8YDznRivtNrCdrDZw5s53f1Y0iHGZuWv?=
 =?us-ascii?Q?meXe6kHYH9kXFrdKHhnE5qGaggxAi/0M6T5OfMmTVhgy9R8ybA+JED47LulH?=
 =?us-ascii?Q?7D6GqdNt7Jl2xb8RqKA7aHWThLC+ypWyBd4Rb2jv/51rdC+qkc1iRT7V9cbB?=
 =?us-ascii?Q?JWAuRO8OSASLHRk+/WlM0sooGpSDIy0LSJTzj3m5JbO6hltTi5R7L9oyj0Hf?=
 =?us-ascii?Q?GhxJ7J8jwxoWGrYTGps4rVDV4ZCJKUwVtYGZIdtZ9Y5QVw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xKM5tbF7kaJdoMipesHryO7i8ZKfmdfOzitIrNsZl35J8Nrsl3znhUL8gYYD?=
 =?us-ascii?Q?7TmSRCVOSwGYCNPBpFVJpZoFV734U6vggAox1J6SJonGqHIjEMjIbri0tqgF?=
 =?us-ascii?Q?lJOO9aMyRUfwBs+guZOoyL0Z00Cz99mxoAPEfraYA+KImtsXbzGBPRxIq5Nd?=
 =?us-ascii?Q?ogYsyW9jj5aFyPvWvR4Pm9MLGP0F7u+gdEB1w35WH+yp/to9LgSdV08Q5d3S?=
 =?us-ascii?Q?Fn2PapzQlVKtKLbwZq2OlVGi746NzV6z5QANOssPGvNDsLDJYWzoL/fDyo9t?=
 =?us-ascii?Q?Lq0SFnw7DPGgkVFwY/89E9rVvPAsbjVpFkXzVWdgQsNass/gl+KOUnUQfyQ9?=
 =?us-ascii?Q?aDeUXXIJIx7wjPebcnm+I2PE7t1yxo63nEoga+ey51iGnVxBnNflWQWN8RCa?=
 =?us-ascii?Q?WSCx9YtgWOuFwWOF48UATqsXsq1E+Ck7Y2me0JKsohwJ0RnkirL0oW2lcHc8?=
 =?us-ascii?Q?7mWjAK++76roGxkERfRQFe5N4w8C8NyJOdMkKSzwwcIvugWSYiYsz/DZyfZI?=
 =?us-ascii?Q?b92ggpeqNb7AjRA4/eC/1J8SZtDmMpV++TbpjwpCt3XjbXBhuoOFvwafDuJm?=
 =?us-ascii?Q?5w4c00H/D2vygGQyO0TO0l8H+KkLoILwXfHEL1iY3L4zL3/p/OQSsDDpEEFK?=
 =?us-ascii?Q?hrbAJH7dAZMQachbURIt3DHbHK8vOVBdOlzAj3b2flxkmEQ8iiMyPL50D34C?=
 =?us-ascii?Q?D8hzpLZOQBUpi0ve/E9IaiNmWo6Gv3FlFqFKWmHNsfE2mjMxp9krucfwLUmV?=
 =?us-ascii?Q?HB59yyU5smjPMrseq1IUbmeG3plmyd7xx5BebgHyXbtWNNBF644H58k5y77K?=
 =?us-ascii?Q?QeHtsiYss3QlFMjcPWUHclaM/c59Wk550ooe/hDbhuufE0tKZhd/u8z7ZRBa?=
 =?us-ascii?Q?hDWUXnTltMYAHF5v+B8bL/3KYHBbHHZZqtWjW7vyY7lF4t0rIo1+u1u+Qi0V?=
 =?us-ascii?Q?ni77ooXaHKR1J+EThm7dqDoXJFvB1lsRORvHg29Nz9794rQpnv16W1M2T/Ug?=
 =?us-ascii?Q?AYjRQ1fchW9qeDtMCSzSP0dSIb8lQ/XOrlKNYXqvr8+xQsRiP4FoLbodQjHW?=
 =?us-ascii?Q?hOWzz/Xqvh3ggzGLunyrhik1g/niPiP5Zfv4qeFQ5xH+NG1t57cCOZ9hn9v3?=
 =?us-ascii?Q?HnleeTyxU2lJrNyvV6KbogoewbJq8CrvtJnXtuEvXJwkVzHKP78kCJKNsQ8O?=
 =?us-ascii?Q?yvfLVf54VB7yQDN0KCHwsyKmHn2clMdLYcWYjTkRH2Msj6SKyD+Gulcv8o6x?=
 =?us-ascii?Q?LqXG7jdGWQwddr7MOUr6eqrnlKB6TzJivIEyofUnnhxUMZCTp2XuEDovOdtH?=
 =?us-ascii?Q?rDf53szNHAedmZ8zOzqx1PnCPNEJIml4mIme117V2WkBbKOFl+MhVUme9uq4?=
 =?us-ascii?Q?VnSS7rIqT8oTm8ZMcl+2b2owyWZk5XWUs0VGmk4psSTPAK2AUUTCwcz64AQ4?=
 =?us-ascii?Q?tr3EeiWurRUewpQ7cF/XcU9MncCFH7Gq9xWegXU88dofMAq+O4Hy7KFVCcqb?=
 =?us-ascii?Q?7Dq6/1KdezomIZXijIAh/ZjcSiqVSpnDeiFMuATFevmm3NvMz0eqRGYt66Ce?=
 =?us-ascii?Q?pUVQS+Ut3f/ICjrQ4dUarf96hrSeX3vhHpEQZF/QWj958dqNQWuEZBJ7J7AB?=
 =?us-ascii?Q?rw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 45eca384-a9c9-4d65-143a-08dcb75d736d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2024 03:51:57.7120 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QHtkDeRpc7PBBNxjLtazxWw8JMXT4Nr/F4pwvvDmmCuhDDeCBn7g+/NUzzFY2yGuCiXQy7j7Mpk0SrOZVfvDkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4794
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

On Wed, Aug 07, 2024 at 06:23:34PM +0200, Francois Dugast wrote:
> This code section is the same as the body of
> xe_exec_queue_last_fence_put_unlocked() so call the function instead and
> remove duplicated code to make maintenance easier.
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 77edb20aa21c..85da2a30a4a4 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -833,10 +833,7 @@ void xe_exec_queue_last_fence_put(struct xe_exec_queue *q, struct xe_vm *vm)
>  {
>  	xe_exec_queue_last_fence_lockdep_assert(q, vm);
>  
> -	if (q->last_fence) {
> -		dma_fence_put(q->last_fence);
> -		q->last_fence = NULL;
> -	}
> +	xe_exec_queue_last_fence_put_unlocked(q);
>  }
>  
>  /**
> -- 
> 2.43.0
> 
