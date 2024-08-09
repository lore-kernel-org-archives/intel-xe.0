Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FA28C3DA4A
	for <intel-xe@archiver.kernel.org>; Fri,  9 Aug 2024 03:41:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0F5010E84B;
	Fri,  9 Aug 2024 03:41:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bmv2c28d";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C270510E849
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Aug 2024 03:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723174910; x=1754710910;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=zo26i62EwmjZvFfzRW9P6tkefdBghTtFCNepJpuAGYM=;
 b=bmv2c28dC0EKH30ZYshih/dP7BNj/md7PIme986aFyVQGCJIZRAi6GKj
 SFB+Q1Ntd/bY2aBkJAc60gZKMN1VqAxvIyMadZ+3fV11PZNpm8SrVFSXo
 SvRmrLK3tPkv9F+ryrjXwoYwCSj99cJ6e7C5bMQn81WRi2FdxYGS6Dz0j
 KcKr0kHc8hZWwFxVUqiaVNA1T35JQ59VfYFUs5CcLwGsa/C8FwHfCToa3
 AIT7ZkQPhSE2HgLe9L3jZ/yBbWYf+uzM8VCcnhqjD9lnqZpcb/BdbMLn2
 gfIaWfEXFJkTshhdcGdLsiKtHN23fCv/OqbAac/yV2y+0jIxAwy3zsMYU g==;
X-CSE-ConnectionGUID: KKJ55KmqQ9izxKSFsWAVoQ==
X-CSE-MsgGUID: MfGLkF5TSse7c1mTtqUQyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="32743839"
X-IronPort-AV: E=Sophos;i="6.09,275,1716274800"; d="scan'208";a="32743839"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2024 20:41:50 -0700
X-CSE-ConnectionGUID: jp0COzP7Rdui9Y3CPQVqNg==
X-CSE-MsgGUID: flfZ1ScCR/KHPeDN+53RPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,275,1716274800"; d="scan'208";a="57096390"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Aug 2024 20:41:49 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 8 Aug 2024 20:41:48 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 8 Aug 2024 20:41:48 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 8 Aug 2024 20:41:48 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 8 Aug 2024 20:41:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fxIrVtPSwzh8ZZQLnFkPM7C2CiWAj9AzmScSAp1P/sa5DRnccVqIkUCAhnfn33OIV1u8hX3Al0EtbHSqcF7jsnHAeXZgMg+W77Y0BOahQk4om4NVdzKVogLeMjYJdEJSl4y/1phamy4qm/c02skFh4MczFpM3EFWABJ+W1scRuWIDjxEo45qKp4b+Mf2DOcb8Cb0gzF+l8sUD/TU0UdPQjpiuJW/pq8DaGbW+CA+B7IdjLsTe7ZThfGqj8TRjWVNDungIgqAs8pfuvn7W0lEmhfx5U+N7+ZNJ3mFnV4jhpNKRP1H0ImExSIEB6qx4I2ccaKzWmYEitEWsHQ4Z/9j1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q4S8j4oKbacE7gxKZUdeB2Em5TGz31VN0o5epkVXF5o=;
 b=dJqGtilaG7/ia2PJNdbeTf0XelpO3s75zVCA3iM3TWEfbz9ANaOpOnPaya/U+P7w807ASRVliIBQS4QImqjyrK62zSjVreNwYvtEZT8t3DfveghaM7oulHGM9rnrKmNwEJxMTcffZ98kaA2I5sZyXKBgu/I2hKNoAgCJwaMDDlwZ7QRhXmtohKU7OHflBmM+GJxxs/caqNAN1Mfu3LsNG36d+Tg+Qf1qoe+oZOMHZFJpdSSrQ9uH75aR18MM/RqrinsHdnSlvIQw6Pud+nV8hv9NReXQLU4ImYdz+5tgRn87I6CBL5EAGSp8XKxVlk7MzaQYFTCUy2yylghTiXhHKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by SN7PR11MB7510.namprd11.prod.outlook.com (2603:10b6:806:349::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.31; Fri, 9 Aug
 2024 03:41:45 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.7828.023; Fri, 9 Aug 2024
 03:41:45 +0000
Date: Fri, 9 Aug 2024 03:40:22 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v8 08/11] drm/xe/hw_engine_group: Ensure safe transition
 between execution modes
Message-ID: <ZrWPpm08mjwVayK+@DUT025-TGLU.fm.intel.com>
References: <20240808184220.1715625-1-francois.dugast@intel.com>
 <20240808184220.1715625-9-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240808184220.1715625-9-francois.dugast@intel.com>
X-ClientProxiedBy: SJ0PR05CA0163.namprd05.prod.outlook.com
 (2603:10b6:a03:339::18) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|SN7PR11MB7510:EE_
X-MS-Office365-Filtering-Correlation-Id: 79d9b724-2670-43ec-e54b-08dcb825312a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?OJqvXersnEUYza++Jh8kQWC98qvMLR//3ivjEFT6FYj8MEUi6WXQr834XnCG?=
 =?us-ascii?Q?DwSuF8e+3NRZI2kwEKNtEbhFih4bfOMTdmw4mvhVzfoqyCqQfN2U4F2HW8Or?=
 =?us-ascii?Q?RcAoNE/ocRxi5f8645MS8wIV06WLA94q9IUrYPCh1Nh7WpWjVUKNgbey4lD9?=
 =?us-ascii?Q?km8IDz0yrNycjaFTTy81Kl8BAuya1yTgQivr4g2IQD+3qCgtBqfI4KdRQBv/?=
 =?us-ascii?Q?Ypf2Uh+VqW6F2961Cqx59VRU5KkqPsYmenjoNI4p3uzyJjSzuEV5tQK313aZ?=
 =?us-ascii?Q?bz99nXc5s7lxK+dJEaJRsDE4z7sYyHQWg82ABsYBQEPK5sAZAMi5atLbwPZD?=
 =?us-ascii?Q?W/0mNx6UImbYaW2y7XG8FQntDK3jmeewbZhY/My/ntC0K0n9iD/pjYO8ot95?=
 =?us-ascii?Q?T5vyOFoQ02SMiN/EG1DOaLyGp038XE+xXGDJ2Va8lTIVeGWnnLniGtv3oVcb?=
 =?us-ascii?Q?gLlcya3F31R5O2kbeY/yYmSwOX6kWQjPE6p/v7JKs5rZNC995BKmuVgybkex?=
 =?us-ascii?Q?eDR6efrYyOaG532D3Af/42Covt8DAtpTwOD0fXukGTchy8A2P9BvBQZYHygP?=
 =?us-ascii?Q?shyF+JgSEoIjcnPR1TP3ijVbseptFmq0SYi/SHmpLPR8P9YXPU7aoIehF1wE?=
 =?us-ascii?Q?W4b3pbVepNb8NKkGWJ2dBmXOdrUHPCL6eAymFOnwvnQpO56b84P7Eux99nj0?=
 =?us-ascii?Q?mEp3tFBBZ70eeDLFvVeDjciObBLkSpJbXL4KTyIujzBaV8jcihCrVQmVhJfN?=
 =?us-ascii?Q?ai0TBnEh+lTFEVPaXLKPG61yL8nJ9K+02h/eVlYle+5bMpnPL7Atk3VArUNx?=
 =?us-ascii?Q?FvugelIo0BQS1D6Lzam/uupd2pokOpPUd8NA9WdKqCyCBqFSh6sJUfxiGI8A?=
 =?us-ascii?Q?1NECltZAfNflE9y8G/hSh1Nry8AenlI1Fsuk15aiuUDFjAsSpaOHgtP7Hm53?=
 =?us-ascii?Q?bcd9Z/fEz+qBTj43JCSJDIO3OCkXQUrgGuUGIKjWbom2bO2/P9ajh11S+DaW?=
 =?us-ascii?Q?knqNNvC4n1mmYZzcgorI4/KWrgOk6V502TZbBuEr3vdH89ZQrvuXnss623wz?=
 =?us-ascii?Q?Mpx2hCfoxIiIKD3WS1hl3bX77Py/lo3Lr06j5eZuQ+qjWYCVRXz7LZaf/uye?=
 =?us-ascii?Q?Ta7tpNQQBA6L9Y+LfKOONSfbrSjZPXEbqiAXI7T7nbBGSRQM+P3XQHoJwbAE?=
 =?us-ascii?Q?qlco1Lp6l6oMSa1whQZbUEFZJr+pyCzD0Oii0OqjC7QtpOdvrB5UHOIu2MeI?=
 =?us-ascii?Q?N0prSaF++FO7tcAoHbhUUX+QJLEjgPHQ5d8nfvjF/6FVkljLExv4mRkWvoVD?=
 =?us-ascii?Q?i2qwXdLpZscseTLO/I7gYwhcsTsLY6MH4RpiZbm+izHecw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dDJwbGzTfCG6JKH/AYO4yeD0PTxNIAABXqONUEB/aLfgO2Kz4zR9e2hUQcH2?=
 =?us-ascii?Q?AnxtVqYGI0S2+UxP76ufc4M17nLGlDf9ll80buuNasJzpEx6FpM8Xb80QYUD?=
 =?us-ascii?Q?KiNPOHeJj94yw3HTvmPF2/2bdfw8RdWd06ryc8NBqDzRFmlJ+ffg/lv0gazZ?=
 =?us-ascii?Q?w1jUe2OwFjWlDgx7y+HlcRugI+T6deOpsLR4rMxnxbH6dhYBqouziRwxx6xe?=
 =?us-ascii?Q?MH8S8Yp3hVIIPe7VdgNBnXSp3be3iTHMO7BJPpNeGuJyFBV5V233eTYr5ch0?=
 =?us-ascii?Q?tcBw5chrD+wvs7IXlBQveIMCbTUS9a23y+5wXEvGDikeRTvqR212Hk//bTvF?=
 =?us-ascii?Q?QVPGVXMRavWKjFVv4Lr8lCEaHX2i2G4AdWZVBdzug7snIyELHJVdIkIv0oec?=
 =?us-ascii?Q?aRokqYKb8JhtjwMv/HIo1pmD4E/U1KmkW8klv8EDx8bs814eTSqEoZnAOzRj?=
 =?us-ascii?Q?gnInKeeIFcNpRlyhY23MdQTOCUAuLCGy8zak2OE3qKseZ6+rg11iHkSpNUdV?=
 =?us-ascii?Q?32vRLj4FS6+f0QmTpYe2PIbmHufoQc3zoXDV9twWE7RbJHbZNLddddtjWE5P?=
 =?us-ascii?Q?ilQ+YhGpf32TQV8HZ/1rwfU3jylFhHcagRJQ8/H5lxBRANRaWJPtH3/PbKGF?=
 =?us-ascii?Q?NV5x7xIdy/1xaDHZ5qoLtRydJUbsw8n8aR5P1aA9Tw//A4mp/9y7CPaQlle+?=
 =?us-ascii?Q?5VPEB3HplQ0+a7jj7cIb9ldFjgMrMa8eHabZqXk8sNg4ols8HknbCgIfqGsw?=
 =?us-ascii?Q?FqXojpdQEq6z/xmAblZ+EI3zBWWW3pkCHMd9WJllFHmWaFWJs4QRY66FqiyV?=
 =?us-ascii?Q?3OdaByC+LB5wfhUvXZEQ3be3qbVnH5pFMgxcPc1c3CcG7tOFzTE53fv+al0d?=
 =?us-ascii?Q?vr/ntq1cPbSZglOT3IZp8ecpaSOypTi912zJUqRx8u9ge6/aeyQl9kymrmty?=
 =?us-ascii?Q?buU9Rj/6UCI7D23ZAfArFBYHvcMb5SNT0FiCWFaijnTcXm8wZoh5xH1hpcBG?=
 =?us-ascii?Q?F9TQeJnEtmvaThFyptIammTADacMTCeURdoaa82dWeEokB/MMLJnUJSpeRnd?=
 =?us-ascii?Q?/qBbWilJp/lM2zHqmncVEOTg6RkpPHZDwC7o5kofSaUyMQbAq6kKBgWW5hf0?=
 =?us-ascii?Q?v95o9ws/YdBauYq4XpA1v4nbjwJLW2TRUBRc5szvk5Dhj534lm8SjIxfxPvx?=
 =?us-ascii?Q?yQx0CGgk5JnFN0vsTJqZLHjS8IoRnbTi+Ivshh55aoHG4iZXO1wSiZ9D1s4M?=
 =?us-ascii?Q?xprE9OAO3eTRjKwQ6oqHZo1UnNNZ5N13d8jqGDD+05/4fTHPnNz1fM/GwntT?=
 =?us-ascii?Q?Kn/7fHBRHKi1Xv2Ts2ZE8vk6snoZmwGbs/58OVB2qj1kSV8JSNDvKoLVtBq1?=
 =?us-ascii?Q?+IYE61Mk4imh/lp3vWsPEBgGS1ta1WhSi+f2dOAIIAOATBwTOLgSYEOYEJrQ?=
 =?us-ascii?Q?tOH3Kiv1Nnoddc/Okg0G7IrC292piyCq1EJs4/Rz18sMZV2mQpohUj6FtBgC?=
 =?us-ascii?Q?THCPnddMgqe48VAHYhhOWn1/X1EJje91Du4Sz4IhwHqTWRaQgn9ZsQghQxJg?=
 =?us-ascii?Q?fV9u65zvjrOX7H2lXIeOgNznbllNWVP1863lFvbzRjW4yUYYta0ERXDJnzbO?=
 =?us-ascii?Q?lA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 79d9b724-2670-43ec-e54b-08dcb825312a
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2024 03:41:45.8569 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WYQV0ejve9FxJqjvnwpc1TXT6HJg9/UUt7AHk60cobI9uO4OpGKWFUoakdLiIET2WBb83arlWyBAFt6+uYleuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7510
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

On Thu, Aug 08, 2024 at 08:40:26PM +0200, Francois Dugast wrote:
> Provide a way to safely transition execution modes of the hw engine group
> ahead of the actual execution. When necessary, either wait for running
> jobs to complete or preempt them, thus ensuring mutual exclusion between
> execution modes.
> 
> Unlike a mutex, the rw_semaphore used in this context allows multiple
> submissions in the same mode.
> 
> v2: Use lockdep_assert_held_write, add annotations (Matt Brost)
> 
> v3: Fix kernel doc, remove redundant code (Matt Brost)
> 
> v4: Now that xe_hw_engine_group_suspend_faulting_lr_jobs can fail,
>     propagate the error to the caller (Matt Brost)
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_hw_engine_group.c | 75 +++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_hw_engine_group.h |  5 ++
>  2 files changed, 80 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.c b/drivers/gpu/drm/xe/xe_hw_engine_group.c
> index 8d3ddfc4ee82..e6c235119351 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_group.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_group.c
> @@ -235,3 +235,78 @@ static int xe_hw_engine_group_wait_for_dma_fence_jobs(struct xe_hw_engine_group
>  
>  	return 0;
>  }
> +
> +static int switch_mode(struct xe_hw_engine_group *group)
> +{
> +	int err = 0;
> +	enum xe_hw_engine_group_execution_mode new_mode;
> +
> +	lockdep_assert_held_write(&group->mode_sem);
> +
> +	switch (group->cur_mode) {
> +	case EXEC_MODE_LR:
> +		new_mode = EXEC_MODE_DMA_FENCE;
> +		err = xe_hw_engine_group_suspend_faulting_lr_jobs(group);
> +		break;
> +	case EXEC_MODE_DMA_FENCE:
> +		new_mode = EXEC_MODE_LR;
> +		err = xe_hw_engine_group_wait_for_dma_fence_jobs(group);
> +		break;
> +	}
> +
> +	if (err)
> +		return err;
> +
> +	group->cur_mode = new_mode;
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_hw_engine_group_get_mode() - Get the group to execute in the new mode
> + * @group: The hw engine group
> + * @new_mode: The new execution mode
> + * @previous_mode: Pointer to the previous mode provided for use by caller
> + *
> + * Return: 0 if successful, -EINTR if locking failed.
> + */
> +int xe_hw_engine_group_get_mode(struct xe_hw_engine_group *group,
> +				enum xe_hw_engine_group_execution_mode new_mode,
> +				enum xe_hw_engine_group_execution_mode *previous_mode)
> +__acquires(&group->mode_sem)
> +{
> +	int err = down_read_interruptible(&group->mode_sem);
> +
> +	if (err)
> +		return err;
> +
> +	*previous_mode = group->cur_mode;
> +
> +	if (new_mode != group->cur_mode) {
> +		up_read(&group->mode_sem);
> +		err = down_write_killable(&group->mode_sem);
> +		if (err)
> +			return err;
> +
> +		if (new_mode != group->cur_mode) {
> +			err = switch_mode(group);
> +			if (err) {
> +				up_write(&group->mode_sem);
> +				return err;
> +			}
> +		}
> +		downgrade_write(&group->mode_sem);
> +	}
> +
> +	return err;
> +}
> +
> +/**
> + * xe_hw_engine_group_put() - Put the group
> + * @group: The hw engine group
> + */
> +void xe_hw_engine_group_put(struct xe_hw_engine_group *group)
> +__releases(&group->mode_sem)
> +{
> +	up_read(&group->mode_sem);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.h b/drivers/gpu/drm/xe/xe_hw_engine_group.h
> index 857a83787504..e0deb7c7bb5b 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_group.h
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_group.h
> @@ -17,4 +17,9 @@ int xe_hw_engine_setup_groups(struct xe_gt *gt);
>  int xe_hw_engine_group_add_exec_queue(struct xe_hw_engine_group *group, struct xe_exec_queue *q);
>  void xe_hw_engine_group_del_exec_queue(struct xe_hw_engine_group *group, struct xe_exec_queue *q);
>  
> +int xe_hw_engine_group_get_mode(struct xe_hw_engine_group *group,
> +				enum xe_hw_engine_group_execution_mode new_mode,
> +				enum xe_hw_engine_group_execution_mode *previous_mode);
> +void xe_hw_engine_group_put(struct xe_hw_engine_group *group);
> +
>  #endif
> -- 
> 2.43.0
> 
