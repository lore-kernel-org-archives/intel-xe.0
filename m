Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E545DCAC5A5
	for <intel-xe@archiver.kernel.org>; Tue, 23 Sep 2025 17:27:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC26C10E686;
	Tue, 23 Sep 2025 17:27:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SdXd0iI6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D77010E686
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Sep 2025 17:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758648427; x=1790184427;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=dme2eWaPZ9YunLrFu0K/5PnDb+It0dZlwulkjlZqI2c=;
 b=SdXd0iI61zxp0tFIL+3H1s3uu7gC8cu0LkUkWT2wlNLzUoavjjN/tHie
 5vUXJGvPO+foNFu+l0bjDVzHl1QTZgNvdxUja773HoqHRuREFmruM7QEH
 hhbw4/E1Z6Y7kr8znWMxaFrqxzsB3ejUazEA0rSaW/Z23XjwlehGWQele
 Z9GMxl1e5YmHrHCbPYG297aihn0dd0ZDqNLgszoeA5giveXD7Y6tuRbMz
 oyhmP32vSbeML8ATneu6N1PqJXoky8FqqG+6qCfYdIfMdaMnJZrncs5CU
 73LKbXL9AxdozMBvM1sfXwumavlfGZBRB7b6azxCXqk0cOSEUGHdwS8pP w==;
X-CSE-ConnectionGUID: obXICUTbRYKlfM0DwTCEgw==
X-CSE-MsgGUID: 8hm2ELcZSZ6u099nKUv5wA==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="78375901"
X-IronPort-AV: E=Sophos;i="6.18,288,1751266800"; d="scan'208";a="78375901"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 10:27:07 -0700
X-CSE-ConnectionGUID: BU8xuWh5RQO3pcDHObXiIw==
X-CSE-MsgGUID: GOpOtas2QKKS84iA9traQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,288,1751266800"; d="scan'208";a="207750080"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 10:27:07 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 23 Sep 2025 10:27:06 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 23 Sep 2025 10:27:06 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.40) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 23 Sep 2025 10:27:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bkt7CUeWqylicF95DnGMTkrWeLLx1hkGQdEifkRNfk8rsjiv4LJswlwvCcRS+su5sFINWwOcf3QNsjeOPdoAovjiqIgjSCWsrL0UjPFe69wK/u8iig0n/ovbfcPznLBxFW1m3D3ulbBBjiVdhA8IU3QcmCv88TMwrx3Uu1LGB9H8KTtG0Y3d21V8j3/GErNXb1ejjXE0csHjinLN9pWH8OHZyJ/do9HmIfe3rjBlWgSvDdt2OB0j6yvIyDJKyr8hOCUprc6FyXPslon0kEIDPVAWBEEG0Elfr5Q1mGHK6w4i7yp1GjmzNull+5+jHtrAiLPKWDvM/fHKtMkpHojlrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wNqlrjNQVkVAenK/kcQlySOpMUD5lp+Y67IXbQ+P1hk=;
 b=PkagmMjY46NcGMgUoWHOz/7sCu1tJkNxXSRq5QyX8wTRn/yNz1U4NENpGMZ/bMS3cwVQsCsP1gg0sa849yTObGrX5t8eWhJ6vTDini6y96J4vnmgKQhXUNfP1sw3IupRNoOgxx/85EhRLXhZBjK7sOje8Iw/QJ6Yn5p/OgidVGRNjHIhys8hIfiSkJtsnsWbKbAor5YDoAps3Mp0zsnQAP07vVT7EDnfyb3NUXlBAOKE2uqY1u+rCORX9u6KqOEECElwwoaKynAzL9oaR6knZ7Vwz/8vNlMQ7kKQkfAd6TxiB/VVA1vD96s3Fk7CZ1nF/uvh3zyXprDyYe8dKVzZ9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB5952.namprd11.prod.outlook.com (2603:10b6:510:147::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.20; Tue, 23 Sep
 2025 17:27:02 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9137.018; Tue, 23 Sep 2025
 17:27:02 +0000
Date: Tue, 23 Sep 2025 10:26:59 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Nitin Gote <nitin.r.gote@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@intel.com>
Subject: Re: [PATCH v1 4/5] drm/xe: implement VM_BIND decompression in
 vm_bind_ioctl
Message-ID: <aNLYYwRQBNRJiTRW@lstrano-desk.jf.intel.com>
References: <20250918142529.608432-1-nitin.r.gote@intel.com>
 <20250918142529.608432-5-nitin.r.gote@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250918142529.608432-5-nitin.r.gote@intel.com>
X-ClientProxiedBy: MW4PR03CA0052.namprd03.prod.outlook.com
 (2603:10b6:303:8e::27) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB5952:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cb1c3f6-1dd2-4bdf-f99a-08ddfac66896
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?h1q0J5TbwLgnEr/moFFkf7EqiQps6mBE5ei/znb/sqSbbI5UYvp4lDNo/nnc?=
 =?us-ascii?Q?Z/Nv3vttZ104/1xZ0jF6es2gDrGer4642f/Wpf1RGgw4Dk6v4s4Vu896rTam?=
 =?us-ascii?Q?hqUcQgALOeeXQubnAZLNXuwR26YMARwAGFOKvpxaxMJPvJB+pHBUM9bonc/J?=
 =?us-ascii?Q?EfDmuvR29x5DqqgBYMv4doWTYDUOyJn45JsMF2U8sf8D1A79+ad9g0c5H8zs?=
 =?us-ascii?Q?Cx2NDpnPrNxUJTQwXNLCBMz3IBdxjwLiz2JHdoXyuId+4XZXlShuDz6pTBWG?=
 =?us-ascii?Q?FGE6RepHLiEMCnKMA0ZZILdBkmEj80dt6YB+SoJJAjbMILWCoQJVjIRR1uWu?=
 =?us-ascii?Q?wYD3GK6NMW+6fMiPkuVHjknJF64SWkUta83T64tTXecU/fmnvEx+iNeve7az?=
 =?us-ascii?Q?+8fpFal1+ubkY6ggoP7CFigHkGgMcnaWkUiQa/Y63AJAz5VNtFBdr+jAUYOA?=
 =?us-ascii?Q?uSHKxhzaYmRgIxfmHUycslHOhN0citIS2kQK81xL3f8yipO086lVDHFxAa/S?=
 =?us-ascii?Q?Iqsnh2B5NbpP6OLB6RHKZLOUAl2rZJAwVKW5BOmZD3h1Bmk1oh7rnTLjBBAZ?=
 =?us-ascii?Q?hFQ4S2ve35Qrv030zYtewT//way/Z52pSzVmRHsl0QsqJmu15zc5RJs+tcP3?=
 =?us-ascii?Q?s/NpvgCdWUUlnI1fktmdBVoewXNXyjwC9J5MdAxuxmV+0rBPqbGTgJ0Kkwtf?=
 =?us-ascii?Q?faW4ixquWDL1d9isSdqVZZYO0LWV3iNsrCUFyXdoJshumUzivr28MKIrJEz3?=
 =?us-ascii?Q?wyhIMHl1kdUm4BVwL6sFkHtHO/4PVUtxFeBT6tZEFh3wn3jYTbT/hkwY/KcY?=
 =?us-ascii?Q?bb3qwT6hmaxAeee/LWn5NAdEu67JxQfXsGa3btXlLtgBUlYkCdzOFU9KgaOm?=
 =?us-ascii?Q?cpRnGqprq2B9xP8NdVsdgexTAbmI6Ybdv44bjIvKnpJxhZb7XQRW+g/MWkHi?=
 =?us-ascii?Q?R6vXaLWBLM0wGq5cCC3czT5ijgHq5+pU560eo2DxFG3poW71/4rnvjybV9g7?=
 =?us-ascii?Q?nmRNQLnMT0FBq+lak29Y7oNrmnksD5ufCeKWnFRbGpiaRjht0YiQXjJT8Yff?=
 =?us-ascii?Q?2zjY4SIzxUlan8qp1n8JNB3pCiWG//QaZ3a4u2O/pFr9AyHPAcxU90KsgXuD?=
 =?us-ascii?Q?HT4OmJmG2IfFn+WZVTVsb9qCYYODTDpj3wnwp5biUuYlZ01wsuYd2IyJs+2z?=
 =?us-ascii?Q?yBYUDPtBqLgZQ1p+4YLSK48cNFs+x0MYvyXOtPkJr4jcfScPlDJkeYGzPjTo?=
 =?us-ascii?Q?724c5rNMZPRQ8mxc3BFJQJvlW+AC7WsuEyiTNhezvS3EzoU+lYX2eaqKcQ1e?=
 =?us-ascii?Q?bfKGBfRZQu/g9Jv4HQJTShKmQg8mBcn+9htY+ut0G4tBYYyl5xW+C8EK2c8N?=
 =?us-ascii?Q?GX787CvwVsXFzoaxj7cIqtBfrZIRADp6D/APHs0+R/wByKvGHoBDUpIqwIlL?=
 =?us-ascii?Q?6Oj81gTJeEw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UTXrt65jExW8w/FUI+sQB2naOyrh8lZf5a5FEhGLa9pMYmdYXLjRDvdibvTJ?=
 =?us-ascii?Q?yWBTNnnzQLnAf/IhnMsOj7O9zUiv8TQ/HcTMcpiQ5FkFkCi3YKjGhuoTyU9S?=
 =?us-ascii?Q?nj1WC5p9Z4pDSxO27B8W82JciNcHvpPL2lh1h17D7zy35MACjax7q3Fdmeef?=
 =?us-ascii?Q?G5E9mVde9cHqPn+1VHTByhClckU5dFzKWwj5BOD1Q76gipC4D3WaZhLV3duJ?=
 =?us-ascii?Q?DaMYT72m5V3jO9uiiYclw7pq3vewJZuKwCSXGu//+mWa8MD4R9YJ3ZrfrrvH?=
 =?us-ascii?Q?LiX83kweekLHjG2DJttLM6m2kIbT48QPi6tFgYkW4sl3+hWGHlapUa1U+9CH?=
 =?us-ascii?Q?lesjs3MEov5XoYdmahn0Gd7f6n3MrF16Zb2IK6zcjJuabI6jGq0kehIHSbTx?=
 =?us-ascii?Q?aJ0pTl1FiTo5676IheaxMdxiS/kcw2W7NKACEWFPAeUvVRQdDVUzv/c1zPmO?=
 =?us-ascii?Q?U2zVxlNg3exeMbSnNwSMJZ89JeLLj6QdSe446Gw0Yn8lPDqca7wlx3AbIOHn?=
 =?us-ascii?Q?qhYN8VQ4mlzffZ23wgaQaOHOzcNc/Pfv4mPmtOoO/aS8mOXOqlvvewaoGbrO?=
 =?us-ascii?Q?ihw1UFKs0ZLmGP4Io+YcX8OWmeLLdKTBOveBAMOAPoo+T24fnb7QmXse4FsS?=
 =?us-ascii?Q?EAF5gIWE9rjB7Djcw3v/IaPz+mPCC88MVet0bD5ou1Uc8L26bbZQGXYh+z+V?=
 =?us-ascii?Q?5x6O6SVxVYk/ySyILhyxLox8AAkvZZGP2ENXCAtUYh87hL2sK0Hj2nwv3EVJ?=
 =?us-ascii?Q?7uqvH8Pf97yyob9dLjT5pZVmXWeNBH60i81iAdCytalpdAHtUEEcVZr90DH4?=
 =?us-ascii?Q?pOrJO79sPm0RW9YdyCjObOMVBbF0YLHoBqPdJUR4X+hrBObLn6Iz0IaH/3F9?=
 =?us-ascii?Q?KAz8PYzb0yWDl33X0eOCbiNHMC+g9JiOCPJbE8eSmxeBLP8ZFFiaSWmttxZd?=
 =?us-ascii?Q?RzQsBfwdkISFW+xB7dIjU7TvHLt0i9OWgIsU/wIOITmvrdvnI38dzy/GtptL?=
 =?us-ascii?Q?rVdcEdXPz4dP4lFGbayflXlDobnSJCReXr+5vZ1ZWSieeXmmh42EoPKP2zIN?=
 =?us-ascii?Q?RGnFkl4mhFDoSyfPvOM4+1Uwrc8FaSSx9vSKeJJT0NbcHqaYUDbOz6IzdNJO?=
 =?us-ascii?Q?5hZM+QZneYO2y++rFVmIZLJG79o6AygYCPQ29UacGk4F8PNeYHnfyfXiODhX?=
 =?us-ascii?Q?CT4a3Lgpo3AbJJPCdOpXuhhdALrmB4Xnwznezq0PSIoXgK0HtSoMpqFg63/9?=
 =?us-ascii?Q?QacreGkgmQ8SDn6Sk94VswZxWFm2dgFAnLoRm6nZt4YLAtpgOOUE0H/i11pe?=
 =?us-ascii?Q?bw1sY062hzx8MMpfIK4k1DBcfcoU3w5WlZZ1hQ8SPL6tRVxe7XeJ5zKD798C?=
 =?us-ascii?Q?3L4rg3qpLXEEn2zB835RQYoJCsgw4itZP93oDP4UfOicTIjYm15ElNJ47rqB?=
 =?us-ascii?Q?zUueC4JgKAr/WjTEuajfWKuJXWwIGXdBcpRmMIR8Q2DnQm92arRuaY77+KMw?=
 =?us-ascii?Q?EjPm11t2TBNNRFXzDedjs6+yaj33WBTrGs/91FtgX4r3hEorqDDoqfD6yr7F?=
 =?us-ascii?Q?3MoryLVvBPYtTa4V2q3ddYLxees6Q1X3xdJOzgIbyssz7TKbtcurV+6sSZme?=
 =?us-ascii?Q?XA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cb1c3f6-1dd2-4bdf-f99a-08ddfac66896
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 17:27:02.3686 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n8h6Tg6M5+8AZ7Q05ZXFzFavIir7G56+iZRT6ArJJpw2u1J+FmM/FCZtPCnYkdhzQvRCGXRZiQ0I/YH50Jb1DA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5952
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

On Thu, Sep 18, 2025 at 07:55:28PM +0530, Nitin Gote wrote:
> Implement handling of VM_BIND(..., DECOMPRESS) in xe_vm_bind_ioctl.
> 
> - Validate decompression preconditions (VRAM buffer, flat CCS support,
>   XE2+ hardware, and an uncompressed PAT index).
> - Mark the BO with DRM_XE_VM_BIND_FLAG_DECOMPRESS.
> - Invalidate any overlapping VMA when required.
> - Use helper xe_vm_exec_lock_vm_and_bo(..., wait_bookkeep=true)
>   to atomically acquire the VM reservation and optional BO reservation and
>   handle BOOKKEEP wait/retry.
>   * Drop vm->lock before calling the helper.
>   * Do VMA invalidation or schedule the migrate resolve while reservations
>     are held.
>   * Call drm_exec_fini() to release reservations, then wait on the
>     migrate/decompression fence without holding reservations and
>     re-acquire vm->lock to continue.
> - Defer decompression when the VM is in fault mode.
> 
> This schedules an in-place GPU resolve (xe_migrate_resolve) for
> decompression and waits for completion before proceeding with the bind.
> The change centralises drm_exec + BOOKKEEP retry logic and avoids
> sleeping while holding resv locks.
> 
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c | 134 +++++++++++++++++++++++++++++++++++--
>  1 file changed, 130 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index fae88c4c981e..cdeb7995eab1 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3266,7 +3266,8 @@ ALLOW_ERROR_INJECTION(vm_bind_ioctl_ops_execute, ERRNO);
>  	 DRM_XE_VM_BIND_FLAG_NULL | \
>  	 DRM_XE_VM_BIND_FLAG_DUMPABLE | \
>  	 DRM_XE_VM_BIND_FLAG_CHECK_PXP | \
> -	 DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR)
> +	 DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR | \
> +	 DRM_XE_VM_BIND_FLAG_DECOMPRESS)
>  
>  #ifdef TEST_VM_OPS_ERROR
>  #define SUPPORTED_FLAGS	(SUPPORTED_FLAGS_STUB | FORCE_OP_ERROR)
> @@ -3324,6 +3325,7 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
>  		bool is_null = flags & DRM_XE_VM_BIND_FLAG_NULL;
>  		bool is_cpu_addr_mirror = flags &
>  			DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR;
> +		bool is_decompress = flags & DRM_XE_VM_BIND_FLAG_DECOMPRESS;
>  		u16 pat_index = (*bind_ops)[i].pat_index;
>  		u16 coh_mode;
>  
> @@ -3361,7 +3363,7 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
>  				 (is_null || is_cpu_addr_mirror)) ||
>  		    XE_IOCTL_DBG(xe, !obj &&
>  				 op == DRM_XE_VM_BIND_OP_MAP &&
> -				 !is_null && !is_cpu_addr_mirror) ||
> +				 is_decompress && !is_null && !is_cpu_addr_mirror) ||

This is not the correct check. What we want is to ensure is_decompress
can only be set on DRM_XE_VM_BIND_OP_MAP ops. So the if statement to
modify is:

Old code:
3567                     XE_IOCTL_DBG(xe, op != DRM_XE_VM_BIND_OP_MAP &&
3568                                  (is_null || is_cpu_addr_mirror)) ||

New code:
3567                     XE_IOCTL_DBG(xe, op != DRM_XE_VM_BIND_OP_MAP &&
3568                                  (is_decompress || is_null || is_cpu_addr_mirror)) ||


>  		    XE_IOCTL_DBG(xe, !obj &&
>  				 op == DRM_XE_VM_BIND_OP_UNMAP_ALL) ||
>  		    XE_IOCTL_DBG(xe, addr &&
> @@ -3378,8 +3380,8 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
>  				 op == DRM_XE_VM_BIND_OP_PREFETCH) ||
>  		    XE_IOCTL_DBG(xe, prefetch_region &&
>  				 op != DRM_XE_VM_BIND_OP_PREFETCH) ||
> -		    XE_IOCTL_DBG(xe,  (prefetch_region != DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC &&
> -				       !(BIT(prefetch_region) & xe->info.mem_region_mask))) ||
> +		    XE_IOCTL_DBG(xe, (prefetch_region != DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC &&
> +				      !(BIT(prefetch_region) & xe->info.mem_region_mask))) ||
>  		    XE_IOCTL_DBG(xe, obj &&
>  				 op == DRM_XE_VM_BIND_OP_UNMAP)) {
>  			err = -EINVAL;
> @@ -3698,6 +3700,130 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  		u64 obj_offset = bind_ops[i].obj_offset;
>  		u32 prefetch_region = bind_ops[i].prefetch_mem_region_instance;
>  		u16 pat_index = bind_ops[i].pat_index;
> +		bool do_decompress = flags & DRM_XE_VM_BIND_FLAG_DECOMPRESS;
> +
> +		/* Handle decompression process */
> +		if (do_decompress && bos[i]) {

This is way to much code and not correct place in bind pipeline to do this.

I think a single function call in vma_lock_and_validate is issue the
decompress what we want.

I'd make this xe_bo.c layer function which calls in xe_migrate.c layer
to issue the decompress and installs returned fence into the BOs or VMs
dma-resv kernel slot. This ensures subsequent bind operations have the
correct dependencies.

> +			struct xe_vma *existing_vma;
> +			struct dma_fence *decomp_fence;
> +			struct xe_tile *tile = xe_device_get_root_tile(xe);
> +
> +			bos[i]->flags |= DRM_XE_VM_BIND_FLAG_DECOMPRESS;
> +
> +			/* Validate VRAM buffer suitable for decompression or not */
> +			if (!mem_type_is_vram(bos[i]->ttm.resource->mem_type)) {
> +				drm_err(&vm->xe->drm,
> +					"Decompression requires VRAM buffer\n");
> +				err = -EINVAL;
> +				goto unwind_ops;
> +			}
> +

The above validation makes sense here as the BO is required.

> +			/* Check hardware support for decompression */
> +			if (!xe_device_has_flat_ccs(vm->xe)) {
> +				drm_err(&vm->xe->drm,
> +					"Decompression requires flat CCS support\n");
> +				err = -EOPNOTSUPP;
> +				goto unwind_ops;
> +			}
> +
> +			if (GRAPHICS_VER(vm->xe) < 20) {
> +				drm_err(&vm->xe->drm,
> +					"Decompression requires XE2+ hardware\n");
> +				err = -EOPNOTSUPP;
> +				goto unwind_ops;
> +			}
> +
> +			/* Validate that user provided an uncompressed PAT index */
> +			if (pat_index == vm->xe->pat.idx[XE_CACHE_NONE_COMPRESSION]) {
> +				drm_err(&vm->xe->drm,
> +					"Decompression requires uncompressed PAT index\n");
> +				err = -EINVAL;
> +				goto unwind_ops;
> +			}

The above checks likely can be moved to vm_bind_ioctl_check_args they only
rely on Xe and VM being present which vm_bind_ioctl_check_args has.

> +
> +			/* Invalidate VMA so GPU mappings are destroyed */
> +			existing_vma = xe_vm_find_overlapping_vma(vm, addr, range);
> +			if (existing_vma) {
> +				struct xe_bo *existing_bo = xe_vma_bo(existing_vma);
> +
> +				drm_dbg(&vm->xe->drm,
> +					"Found overlapping VMA - automatic invalidation will occur\n");
> +
> +				/* Drop vm->lock and atomically take VM+BO resvs via drm_exec */
> +				up_write(&vm->lock);
> +				struct drm_exec exec;
> +
> +				err = xe_vm_exec_lock_vm_and_bo(vm, existing_bo, &exec, true, true);
> +				if (err) {
> +					down_write(&vm->lock);
> +					goto put_obj;
> +				}
> +
> +				/* Invalidate the VMA while reservations are held. */
> +				err = xe_vm_invalidate_vma(existing_vma);
> +
> +				/* release reservations (drm_exec_fini releases VM+BO resvs) */
> +				drm_exec_fini(&exec);
> +
> +				/* Re-acquire vm->lock */
> +				down_write(&vm->lock);
> +
> +				if (err)
> +					goto put_obj;
> +			}
> +
> +			/* Handle decompression differently for fault mode */
> +			if (xe_vm_in_fault_mode(vm)) {
> +				drm_dbg(&vm->xe->drm,
> +					"Deferring decompression for fault mode\n");
> +				/* Skip immediate decompression */
> +				goto unwind_ops;
> +			}
> +
> +			/* Drop vm->lock and atomically acquire VM+BO reservations via drm_exec.
> +			 * Hold the reservations while we wait for BOOKKEEP and schedule the
> +			 * in-place resolve. Release the reservations (drm_exec_fini) before
> +			 * waiting on the migrate fence so we don't hold resv locks while
> +			 * sleeping.
> +			 */
> +			up_write(&vm->lock);
> +			struct drm_exec exec;
> +
> +			err = xe_vm_exec_lock_vm_and_bo(vm, bos[i], &exec, true, true);
> +			if (err) {
> +				drm_err(&vm->xe->drm,
> +					"Failed to acquire reservations for decompression: %d\n",
> +					err);
> +				down_write(&vm->lock);
> +				goto unwind_ops;
> +			}
> +
> +			/* With exec holding reservations, schedule the in-place decompression */
> +			decomp_fence = xe_migrate_resolve(tile->migrate,
> +							  bos[i], bos[i],
> +							  bos[i]->ttm.resource,
> +							  bos[i]->ttm.resource,
> +							  false);
> +
> +			/* release the reservations so scheduler can observe BO fences */
> +			drm_exec_fini(&exec);
> +
> +			if (IS_ERR(decomp_fence)) {
> +				err = PTR_ERR(decomp_fence);
> +				drm_err(&vm->xe->drm,
> +					"In-place decompression failed: %d\n", err);
> +				/* vm->lock must be held for unwind_ops cleanup */
> +				down_write(&vm->lock);
> +				goto unwind_ops;
> +			}
> +
> +			/* Wait for in-place decompression to complete without holding vm->lock */
> +			dma_fence_wait(decomp_fence, false);
> +			dma_fence_put(decomp_fence);
> +
> +			/* Now re-acquire vm->lock and continue */
> +			down_write(&vm->lock);

Everything between my last comment and above should be in moved to a new
function called in vma_lock_and_validate. Also as noted, no need to
directly wait on the fence, just install it into either VM's or BO's
dma-resv KERNEL slot - that is what xe_bo_validate does too.

Matt

> +		}
>  
>  		ops[i] = vm_bind_ioctl_ops_create(vm, &vops, bos[i], obj_offset,
>  						  addr, range, op, flags,
> -- 
> 2.25.1
> 
