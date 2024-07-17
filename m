Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCF4DC3DA60
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jul 2024 19:32:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 674CB10E350;
	Wed, 17 Jul 2024 19:32:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GcVYlpoR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE9C410E35D
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jul 2024 19:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721244774; x=1752780774;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=fIktnNWqTSPgpnYds3fjSeZZC3wOePahe6r6juU0B4w=;
 b=GcVYlpoR4c23BYmAItVH1WfYDJjFGfY3svbqfi54qas/Z4x2trihfnLX
 timIKEMm5KMLLSOwQpU1FjIsyq8HqgWzqND2U1J+SVxtulp+9VQxn2rjn
 sT5iG6U7Fv7VfTiS7Du2Ej0r9AO7CtBorEkch/y7mjVse3yCeXgUqR2wH
 lxA3VR72HJBaJ6t1668XbTm8tBtJWxEW3WwR7nkTs10Uc4EP0rL7Csjmm
 2FVEdC0fhoHLOKr2iwRx8Nrn3DGQOUKKDiB3jz6BQOY//gnzu8AMJ6ueC
 y7f8YJkeymdQJWQgKN87AsKHDxnG3VpKF2KPrbieSp7aeVPmK86ONJHIZ Q==;
X-CSE-ConnectionGUID: 1SN5CDxmS46zQslxYCUivw==
X-CSE-MsgGUID: 0hKz4lMmTrqjhRFPtu5jLA==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="29443125"
X-IronPort-AV: E=Sophos;i="6.09,215,1716274800"; d="scan'208";a="29443125"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 12:32:54 -0700
X-CSE-ConnectionGUID: xlzDpwtuTf+v1BQ9aaegUA==
X-CSE-MsgGUID: UEQQUZNpSEaqOHEcfs3okw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,215,1716274800"; d="scan'208";a="81543404"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Jul 2024 12:32:53 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 17 Jul 2024 12:32:53 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 17 Jul 2024 12:32:53 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 17 Jul 2024 12:32:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DcUGGtfEBtFuNhyCXCuC3OGbspEIR5/CROMB26BrPAovV1I9PYXMk2zXXlbcuuO03vj3eePX+E4zVRaE0zA7TP8dCwf2VZHzqDRPoqddXe3zT52ju847BgMHGluChos1TaWLzv73G+KtjUkzqG7r2MiJEj1WXI3oCGSW7i+kXU4Vy4pAY3BdOE90tuPVGWeJLjM7u/pVxwOeIqhLA2ulcSuuzKBzQWIbT+2Kfs4fOVOJJWCJvFvXtHqUvE+kwGQ154MOQmiGQqVJu7iO/h7hFGer8LyYvUeqQ4p+uWRkXETC3Iny+kMEmI+6KTyluS5aChTgDgnV6taJ3XPbU/8Z/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4WRWQlKf4jjwp4nh0C7Ej/UMNLu3+T51VSbgX4la2vM=;
 b=AT5XqBfVF1dzRh87JQmr6NZax2JTZJHIm59nyvg+nN+YQ1m33SByW40irmiruXgY8WaERW9IlTRS0BH0ivex77+XmwX2Oqfej8xjkd93XSTqh0EZMFpi4e6P4bt4YPdnvy3CqdUbD9o7yok1H+e4e1ZCm17IE2qTtq7c8tjTp5/5SUZi3NJ44rRXW0oGkId32SPz4ZZv2KhFvvtvjn29qA15W++hRYgIVUNzYQdSzNhXyge6r8VM6g4Ntxooz+mf3mcnBHs76uDD7PR0NnoxYk65vDp81Gyk+9sWUH0639/+ww7t02WJ009qYRTDRfK64AlNdPMf0OHJGW8/AswTuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB6497.namprd11.prod.outlook.com (2603:10b6:510:1f2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.23; Wed, 17 Jul
 2024 19:32:50 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.7762.032; Wed, 17 Jul 2024
 19:32:50 +0000
Date: Wed, 17 Jul 2024 19:31:59 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: Re: [RFC v1 2/9] drm/xe/exec_queue: Add list link for the hw engine
 group
Message-ID: <ZpgcL0dZdfkv2wqm@DUT025-TGLU.fm.intel.com>
References: <20240717130821.1073379-1-francois.dugast@intel.com>
 <20240717130821.1073379-3-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240717130821.1073379-3-francois.dugast@intel.com>
X-ClientProxiedBy: SJ0PR13CA0045.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::20) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB6497:EE_
X-MS-Office365-Filtering-Correlation-Id: b849edeb-e32d-4685-bd20-08dca6973ea7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?eZ1sltULQ81G1p8HPtQPCx3djlGWWHE+fJ/BwrTZWUaY66X4c0v/bQKzEt2G?=
 =?us-ascii?Q?2fdV77/h/8oUCdLPJ4TU4SurZ8PUKkEdk6nWxnK4PvnBQNktlC8j0n/pP33v?=
 =?us-ascii?Q?1h2KmlLn/f/yl6UH9PAduDrPUEl1p85vd/nXl1/izsMtzaaHL7jTRS8ZWaHd?=
 =?us-ascii?Q?d+9OAR/9uUivxYN59m9dKXSxYPTcsDm7ki29bqGjnL6m+DVjTIPOTOhCznCa?=
 =?us-ascii?Q?2bNsa8Xe9pnlAMijpSSXaAJPdjAyBXceRQQu3vuB6pccfLx2R47lQeEvZido?=
 =?us-ascii?Q?2Hdd+xKOz1zESDzNG3vMNV9CicCMBHRtPK990Nb7RSuwOxKabWx+VuB/Shku?=
 =?us-ascii?Q?5LYmeO59si4KdTXVBJDMDc3rNJdR2x/9q1QgVnnHjoXWTJ6ep84dCZsnlqXu?=
 =?us-ascii?Q?ij7CMDaf+LdjuzCl+af2juK0locmR/yT0tD/SnSqZ5HXcKyHoFtKlUhR0yf2?=
 =?us-ascii?Q?5AInbwY5wPomlUjV/HwMRMaG4+jOqKObZknmHFd++Tu3Vy8tyecEDU2U2t1O?=
 =?us-ascii?Q?2JrYXq0VhMyXLLibKaqjpBSE90H3XNGINc6lb23IDMBt+VbKf2QMPbDAXmSF?=
 =?us-ascii?Q?HugGkTFvJRwcXXTAdFZQUG3EkKdaAZqL3MS3kl1VVY9QU6l3AFERikSuAh1p?=
 =?us-ascii?Q?ckyxqk06bCtw5xbwOdLZNyObkhswGNYa8W0SJX2PLSRoa4vTCq2lEWajMbZm?=
 =?us-ascii?Q?qp06rLIPLYfg7BDTeRfPOZZOpQW1pJnPmUd5shm52NntEz4YtJAcW9F3wrUC?=
 =?us-ascii?Q?yLqf6Lc0y57wckpTZPqAhD2cA/83waN/rmWZR25qC3TgXPdMI4dEPZWi1IbS?=
 =?us-ascii?Q?xZYBE63fIBE/cev3s0Dy4INX2SEUYhFmJhgv4+IKJ8bQHnG0J+zx4S4eCo6f?=
 =?us-ascii?Q?R0yHX1aNXRLH7E9JCMEjOQJsFA9PGf5y9YSNBY/Ed0dm+fDrQkCVL6VMa/W9?=
 =?us-ascii?Q?gaFOeIRlQ7ISaiTFKz9O7x3b24r60nL/RPM8VN8eIY3TL2in+fyHrmrQKcSa?=
 =?us-ascii?Q?sskzYoZFVSmH02pGcSGuGmxiIQlrJptkwn7EAKObR1/MiwNC6q4agla43VMb?=
 =?us-ascii?Q?9W//sPBbnTyG5oB73dtaPGN20DFbZHh+y2Jmwj6vJBpFeAjut4td1jCAj/Mi?=
 =?us-ascii?Q?I4I12dqD1vTinYJT6gbErcoRYpGvoV9jWbz2ob42Cv3/z9pnGhFJk8FF6BNY?=
 =?us-ascii?Q?X26fRC5jv0HTB2B3Z2/BE5vqy1bdSByAFLQnoTSHQXEXyCwMyQ4i//iF/Qvg?=
 =?us-ascii?Q?hX4al4fKaZ01qP3yfmmDjhvYHP+PaktJ1MLD61xJm5rwKaliiNCqRNbWreTH?=
 =?us-ascii?Q?KIcCBnHl2ZPW2D7JN3wRF5yIqvjOn+fF5S9JctZgFyckPQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?h8cxg/IfAr6k/kskoyKQaEX6ErUqIEFEgDgskkCzbT1MIIqfGG+94umrBTC3?=
 =?us-ascii?Q?fV/9zTqybjlEeJQNQt+KB7Sq7AXA3ZIz6UewLjv26iAWW9y5bwXku4nfOf7H?=
 =?us-ascii?Q?kisVW0LWqNUOFXf5RI5iiPTfWJjjOpRXfDQ7kB+nkwR75+oHLSzlAloLgh1B?=
 =?us-ascii?Q?H0MaAjB8e5PN5MIko+VAV5Qky79k76vIToY99ROSMkomMSOLrr5EgeGTO1WF?=
 =?us-ascii?Q?ginzJ3oEWGVcDxpEO0AP8tjL6CVbj0mzTlpdE8/XsAtoBwfGwDzyoCLS5anD?=
 =?us-ascii?Q?91bSDvAaq7BPzZ0HzgEF4wp4pWafghxkAx8SbwW+zymJ8Iu+0Uxvc6EeXI1D?=
 =?us-ascii?Q?AUDt5kSGTNvG9Di3V5Rz50KTEpbIsZIb2oqM4pm9iRs9uFVmsR5ZNDrw5Wf7?=
 =?us-ascii?Q?vPXPB4vhoeDhski2NNMsDSwxHKdMR40OM0GBLL3XG27Kt37guYlazk3ijY/M?=
 =?us-ascii?Q?rkT8W7dt8HTz49Wzs1dsSHAlHXc7zMHI43UaR3crYQ5j9ZQatzYWWQFZKpPQ?=
 =?us-ascii?Q?0dQXp02tjyFXcAEOYW195TSmsu9eyV7O5liAL0rs+B8HD1coQm2tXghGCGdF?=
 =?us-ascii?Q?qFxvTqTxKHSNQRa1KuaLukBeDKq6W0dCj1ICRkkwY2DqLUK8TUua/4FJkU1/?=
 =?us-ascii?Q?B+NqZYj3Sk3p7ZwHfdrwcYs+yqDKoORjZYaUTnrc5joQytUboW9hzKbj4l2N?=
 =?us-ascii?Q?nh3hAi66PDs/Ur9Futgm6AVHXpUDf1l/3QV9jQnrvG07J1uPgqXqAA6F0FXd?=
 =?us-ascii?Q?/rOhAFXQY0cfrc/uRTV+wHoZvCX5tU6AQ5vIMK6ZziAcTWDL7Jtuf7GKKY6y?=
 =?us-ascii?Q?yE1Ky6FZTKuW0fHTx/SuvVna9TqfYOIZ7t+yPCLKHSyq2doqSoivDZCDRTWR?=
 =?us-ascii?Q?AZfCxi9dSMLgea61yt/ojIxg0LGH/HPPEqp5QgUgkUo+UzoLJHENXXyz1963?=
 =?us-ascii?Q?rz922xJaU3HTrKD7w0ucRCyUoEvRWDjA8bGaVSqUuffkhIsfzCkf9CKBuNp6?=
 =?us-ascii?Q?BYw8wC132YcyB3p8kuLYD+mwSMW6m6rjn2uAe0B1nnLVaZfWIaknWCan5AQ6?=
 =?us-ascii?Q?CHKSpda0yKULITpSOzSy+Hm6BUPYZKd3AVUEvmgb0q4CuQ0am78IeC36ca5z?=
 =?us-ascii?Q?5hXCh0b9TzBRT04vEtdMmFFJyS2ugHPkC89STp45zMlVYmWMizpCC3Y+lP5o?=
 =?us-ascii?Q?DofkbB+bTGx0AvG8NZwQoUP3h8bu0GTP1oj9B9k+7Fk5Fic2fKYcZvlkgvV7?=
 =?us-ascii?Q?cBlEHXljwEmQWmB/R+kR+y6CP96a2AFyy0+Uusq+rQRiMl4OWPTn9jKscBnD?=
 =?us-ascii?Q?Uf/lqkSCvhBZKV3qttJdGcqpJGUprH00QT+f4IeLebJm25TVKRZUnZf1RHmV?=
 =?us-ascii?Q?keLTF7C9/aR5efe5ruwZ/kA4JEDBxNPZe360BWlEAzdYItiGWNv8aRBE8F+S?=
 =?us-ascii?Q?zMiLqxUHQGsJqOjx4HOH+YBGr3+KVx9KT1TJbNb8hsjVvWiava4gnEgOp2/O?=
 =?us-ascii?Q?MPdEvcHOU9VvO8iY8DdXiRjGetEM+gCyKsb3vF4JSXagLF20T40UFaOcf44s?=
 =?us-ascii?Q?NvntPwuv5SylO4rLzcB7Sto7GepHkgDOiYLALtwuKSbYNHSRmT/jg6ayZz3a?=
 =?us-ascii?Q?GQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b849edeb-e32d-4685-bd20-08dca6973ea7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2024 19:32:50.5798 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hkKlj3S6OI1DCUR8Q7OfVTt7nTjd8cvtDc91otIzj0EkVgwJBZD1gRnRcFXLzg2v7T9TSkzbGikAgcxYIofx3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6497
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

On Wed, Jul 17, 2024 at 03:07:23PM +0200, Francois Dugast wrote:
> The exec queues running on hw engines belonging to the same hw engine
> group share hardware resources. It will be necessary to navigate
> between exec queues within a group for synchronization, hence this
> new list link.
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>

I'd squash this into the next patch.

Matt

> ---
>  drivers/gpu/drm/xe/xe_exec_queue_types.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> index 201588ec33c3..7df2b532f340 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -143,6 +143,8 @@ struct xe_exec_queue {
>  	u64 old_run_ticks;
>  	/** @run_ticks: hw engine class run time in ticks for this exec queue */
>  	u64 run_ticks;
> +	/** @hw_engine_group_link: link into exec queues in the same hw engine group */
> +	struct list_head hw_engine_group_link;
>  	/** @lrc: logical ring context for this exec queue */
>  	struct xe_lrc *lrc[];
>  };
> -- 
> 2.43.0
> 
