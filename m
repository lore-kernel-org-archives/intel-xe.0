Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9439BC624D4
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 19:51:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C85510E066;
	Wed,  2 Sep 2026 19:51:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kmDzE1eF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D09710E066
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Sep 2026 19:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788378708; x=1819914708;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=IyAgIU9tmu8b8LQtL5PyukpPEPv+ffmD2PXNcQx1dy0=;
 b=kmDzE1eFYKcqD11/CmeGQyARA+CQ53h2gwoEPlG9rtYA4VN6p6dh+5w6
 k7JFt5hxcPC6DML7vx3RF0WaKIiKSFA20ipJhkQmAMqR2biyNj6fc9xD9
 Ov3iwFCbdEceBCoXev16oFd28r5nYHlDdp9axG1sjH66nh1HSAg6IQUgO
 /kDTa3QkdBAfiFdEBI6G7Mq8DmbhGcKqLTJnwHe1GnXf/Vrdri7R6+1mK
 Lroo3064INsSpRqW/nubMaTiVK1CXwun0eyRtnqRZBQybJ3F3ekZOSsMg
 bl6YLuHziSwwyh6jqlYUgUCpm3LcELEFLfZGqRrKChgHptfU2ehZaUE8e Q==;
X-CSE-ConnectionGUID: PnWim7VyRfKRVmhefQ1FFQ==
X-CSE-MsgGUID: +ZyM/7AqQQ6iimuByeEVLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="87989709"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="87989709"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 12:51:48 -0700
X-CSE-ConnectionGUID: T5HKuq9mQTyrLBo/4mBaAQ==
X-CSE-MsgGUID: ouF2hmehRp2nyGC72gw65g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="274782450"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 12:51:47 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 12:51:47 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 2 Sep 2026 12:51:47 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.56) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 12:51:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gc6mcbbXaB5sl4IV90MtBFRGk3Ny4+yrKzsRiyyE/qhs1iqm7Y0YFVVTMmQE2osKhMHvQLfKfNJnVuDXrKKeSCx2t0GvFIzrOy/NA2L+o+xpjGMfSPDjRatsJXzAkutp4/C7duGbpXI1w20JBuDMUUhzaNZBhn8BfToXxu6DKEkvOfuDkumMX0JsBuRtzLA8//yzErk7aA9/4WYDYSfZ6GVeViSzl40AXUJs89MbFm2csXWiA0Tg1Vu8L9J8VwXsNr9C93Tk3L9xClR15tTxUlGtbt1gmUITj9+XudPU7k+6HcuQ6KtV714MJZk1VmKRykiyTwZVKThAonl9ILQ0Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gHHqTaTBlj5YBbqETp0L4HVcKtAr7uV9paURlS3hS4k=;
 b=P4Bdp8J6RPjs8FqNxhJeMtK2yrEDQOQDM5Hc/8ouA1aKUMT8b9xACztVEub0EX6jsc4Lch3s374fsYSlaQ4wOonMdEkOlVYcYGwxqyVDkUjhJZiBwGMnQYrI5Tew55wZvPRMbLZlHA7NSbONM3n7Uex05ehBZtfh6MPlNj5NEboyHD2OH6eqZfhriQA+E9Ith1gCME/F9Wb03Y2IieZdQ5MMbg9YI+xQrVuEn+/H14S2dzNq+Mj7GhV6p8zK2obBoQp+AJoFP8XHV/TJMM8iLnDEhiy8YD1RwezivTNjtYwK32W3KSz2/aNUbS49HTG6RxudxuH8nAHzqGuMyrD6lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB4975.namprd11.prod.outlook.com (2603:10b6:a03:2d0::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Wed, 2 Sep
 2026 19:51:45 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 19:51:38 +0000
Date: Wed, 2 Sep 2026 12:51:36 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v3 3/5] drm/xe/vram: revamp CPU VRAM mapping
Message-ID: <aph+SHcD9xgKjzTM@gsse-cloud1.jf.intel.com>
References: <20260902124117.918018-7-matthew.auld@intel.com>
 <20260902124117.918018-10-matthew.auld@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260902124117.918018-10-matthew.auld@intel.com>
X-ClientProxiedBy: MW4PR04CA0202.namprd04.prod.outlook.com
 (2603:10b6:303:86::27) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB4975:EE_
X-MS-Office365-Filtering-Correlation-Id: cd02c3f3-1d35-4b8b-292f-08df092b9a58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|18002099003|22082099003|10067099003|56012099006|4143699003|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: lu+ercTRWcDYNOwApuQFw/upXevH0F4fh3JubQZdTk4DKgvC/tBZg2jIzoQ/JhP/C0jbUJzHviW4+3fZo8tfZv3r4LhGGJn7l8aEIZHvx4BXIDnOdTUgJazFW4eZ41iKVhTSvXvE4tvEFSOpxQoJtDL48xkHBZ3v2OMC9FDi557TQoA4lXf1U0Zz36Ngi62v46bknv5CvtB+IG/1Fji1aMbPuSowfB2kj19D/aOt0jYCWXwWfDNrgX3b+vSKiT5tiG6Cst1LxBolB4eMa7aLPGLJY/z4WEzqt+SkvbN5RHERU/dPGlTrikvw8y7l/kKqHM79PqGRoGrMLUre0HwEmQfllEBhDkrz3ViarPggibYPgNEgyqISu10ZMxW3BxFw/rJjiV9veeQ/YyDRSXijebcSmvWuQ/J3MmbZGdCRF9UniHzV7cnz2NiBNvWFvoiO9SMEd+Uav0VNa3Ftpyw4EZKz90UD8Uuk3IoBOCfXmapwo/oNYGDYhBr6DlNJSLpqKWyGUaQ9eTAaHSiuWeOE1ORSlI5Afz9ZCVcKyhDMdaADoWOZfZ+9trMKEMNnYKyETnsOD62PGm6QlsSMgMqZ2TKWqihyIu3WyPQzgLVuttWuWZ4KxTXNs953PDtk+yapDMiukJzWvyQPDJPC1N/fDdhIH+adWGdr7AysQ7RIPas=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(18002099003)(22082099003)(10067099003)(56012099006)(4143699003)(11063799006)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?8DcflNprXrkVrf1UsrrBfZvHgAam7ALg7wQJnVltLTBb3uIlIz11it5G3F?=
 =?iso-8859-1?Q?0g624gTlPjQu8MavJyfqEnp3X/XMLcor4NlCqj6rTU+gd0RGF4RitTWR4A?=
 =?iso-8859-1?Q?Oy7gsFXqz98ALbvWbPyoi8CZvzHWX5VGTUQDHJwSEQpeNrlejC23H5VpEs?=
 =?iso-8859-1?Q?+aFBzea60C9P24hrIfikOYB+lbxoZS09lb3iIxdlZhsUKjIqYV+0cw/il+?=
 =?iso-8859-1?Q?syv8+gE98c6sZDGY6oH1EB7VXIFZqi74dJchy5iEUnBbn3GMrDYL5+s+AO?=
 =?iso-8859-1?Q?/N5XIRopJkjakzzarywjSfocEqi43YhSUQshHUVBSVR1fkWlXa2WHQ9YmD?=
 =?iso-8859-1?Q?PNPmIWKP9yzdXfbu1x++wPzHooFdf3wue/AsMnZpbtLjItB9SY1ar6M7+k?=
 =?iso-8859-1?Q?pOosjXbcfCXrpubawogV5rIc2Jb1WiNsbNCdtLwl6seI/aXvIhVVFYZOs3?=
 =?iso-8859-1?Q?9DoLzat53qWdktl8qZosDZ+Xei5E5BeGOdzS+n1HvSkjLkvi6DPG6lXSec?=
 =?iso-8859-1?Q?LK6GkcjGpmN2HafjZorgJe2rvMDo+1HuisMJEq9PBiN4wvgIkKYq/rcvB8?=
 =?iso-8859-1?Q?kQFLOmiy51lG45+PbsHb+6Tt5p6/eGopDWgWrdpafqsi4DBAbwgaeHa41C?=
 =?iso-8859-1?Q?iXW9KckwCalSLWE0/rJJVqUVWeZ0/tMKLFoVa7QlbU/66JSiMIlorPw+WT?=
 =?iso-8859-1?Q?QCQPNIhBe4BRYYN2f7BF30z+s0QggydBjGhtUHMRvzqo81rrPFSk2FUlkE?=
 =?iso-8859-1?Q?43wmnJ6lBamCssb8EVQBfQJaIwOp0AVZWdn00ZDJ/7AurWpXOgXjjWlEAg?=
 =?iso-8859-1?Q?fgoXFENxacT9diXialwO7in10rLiYe9dzTfa3CsiSJSKvY8IJyrl/sb6oc?=
 =?iso-8859-1?Q?cfkTeiACM0nMwqi4krnRFPGQE+pN9nZb9j7lP+JAnN3h9gZfDA/Jl5r4ir?=
 =?iso-8859-1?Q?+0dr9lgCBof9RACfj+tlqFlQSz6SuP/8lqJ5t+huaqHPHbM8AnE5Vm50TB?=
 =?iso-8859-1?Q?UHVLUYU0HcJvS5aoDg9gQahSFzS3jRX7Fv8S8Ahd20iyjdTgWoclLXPDCy?=
 =?iso-8859-1?Q?HgudfWNfrTE5nZe0GipoPwVkI+ecDaMaviMgvqeN/AWk9No7xCvgNkz5ai?=
 =?iso-8859-1?Q?CH+uLezl1xkAwt7F/nsAni5WtOQEtnGE5gKjK+7U6PGwH5j2BQ99eFWE+T?=
 =?iso-8859-1?Q?J/ewnpgT0IlIxiHWZeNgXG5RHlFY/ToX7sxkbL1Gy0W6UOYImhUlG8xNNv?=
 =?iso-8859-1?Q?iqd2VVn71zdCJ25XHFENp0v35PTqgCIH1MZszIUBqLFE1KOM2n+jvj16OL?=
 =?iso-8859-1?Q?sv3P2GCRIwcqRUTqfT5wO+H79UvpFhJZoUKYETrziWhAiljtb7ZNuqiAAa?=
 =?iso-8859-1?Q?37jfyuiXPe+JB3uubgCThJAU9XDh5CaYtNpHWrYX9X20kU+pfkNqLF98H7?=
 =?iso-8859-1?Q?M6cqp8VxsjlySmVszYgY6PTuB3YcwKcIVsVf7dYX+wf/9XqIXUw09GcUOr?=
 =?iso-8859-1?Q?eL4yJLxg2+2enulIP7vJ3OMC8tsVODX5z7y6V961lYLvQGx7syV3ryM17L?=
 =?iso-8859-1?Q?EtriqIGf79TbsGoQdWW9xfC9EqoRVbqYy8/v596WS3nMdnJQC7+0UNR7er?=
 =?iso-8859-1?Q?sOMnBfOKv6EM4dThyfPglFY0HGtbMYCoTrOZ8jRnMu2v/CRYZMaCGQAGf8?=
 =?iso-8859-1?Q?Y2pH+LA3vr2ilyHocciXGS6jznrrzAKSdPwJuvrJyStO/aNr2BhmRI+0SO?=
 =?iso-8859-1?Q?9V1EnCoyOqjOc6Vqi2PvRJfMbIjzinPqNHWqTC20Rk0tcbcgNiVIYuN2u4?=
 =?iso-8859-1?Q?MDYwSldDO3WYhaWCEFlUxbN5DOBfH9k=3D?=
X-Exchange-RoutingPolicyChecked: Bmz5Fwe7V57TP4mh4Tqmr46XHH94m4qopHY1NhXdB6RuppQvszTEd/xC30Dl3FG5Rank9G78fSC/NmdvkI8XDK/hjq/2OFOsb9uZCvRXDCQkhu8+HOx6Hyh67G0FXbwbGwvfWdNdyVw24izci93S/w7meb7KBsX9Y8f0E1yVlyqQJgtvsiFyD9AMJjzitOTSIVDgu1GW5/IKUPzSHyEVOnVLWYGq7DodW4CuORCL8Fdi1Csvsvtd+NyRZoD5SlOpgAjZmGK1Jsvry6HScybpjp8rsYSX8AIHKqaj72G2qzCkPzVpx3pSaTU3KLXD2XNt1PROwSPJm+O+UQjJ3SmLpA==
X-MS-Exchange-CrossTenant-Network-Message-Id: cd02c3f3-1d35-4b8b-292f-08df092b9a58
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 19:51:38.9226 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1NSO8FWKh4s02BwgzmlunDfT/QahH5kFW0IGMHRk9/O2I2ORidUDBDU31n9dosl7qbzBxnu0VXOMCctUjJQY6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4975
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

On Wed, Sep 02, 2026 at 01:41:21PM +0100, Matthew Auld wrote:
> Previously, we called devm_ioremap_wc() for the entire PCI LMEM BAR (which
> can be significantly larger than usable memory, e.g., mapping 16G for a
> 10G card), and then simply assigned subsets of this global mapping to each
> tile.
> 
> By moving the devm_ioremap_wc() call into vram_region_init() and mapping
> on a per-tile basis, we restrict the virtual address space to exactly
> the usable_size of each tile. The other big win is that the core kernel
> will place a guard page at the end of each per-tile mapping to help
> catch OOB CPU writes (e.g. into the flat CCS storage) by triggering an
> immediate page fault instead of silent memory corruption.
> 
> As a consequence the global vram->mapping is now NULL. But that was
> unused anyway, with CPU access already correctly routed through the per
> tile mapping.
> 
> v2 (Sashiko)
>   - Make sure to update the panic flow to now use the root tile.
> 
> Assisted-by: Gemini:gemini-3.1-pro-preview
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/display/xe_panic.c |  3 ++-
>  drivers/gpu/drm/xe/xe_vram.c          | 14 +++++++++-----
>  2 files changed, 11 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/display/xe_panic.c b/drivers/gpu/drm/xe/display/xe_panic.c
> index 12c6fb99015d..1a6cee25e9d7 100644
> --- a/drivers/gpu/drm/xe/display/xe_panic.c
> +++ b/drivers/gpu/drm/xe/display/xe_panic.c
> @@ -52,7 +52,8 @@ static void xe_panic_page_set_pixel(struct drm_scanout_buffer *sb, unsigned int
>  	if (new_page != panic->page) {
>  		if (xe_bo_is_vram(bo)) {
>  			/* Display is always mapped on root tile */
> -			struct xe_vram_region *vram = xe_bo_device(bo)->mem.vram;
> +			struct xe_vram_region *vram =
> +				xe_device_get_root_tile(xe_bo_device(bo))->mem.vram;
>  
>  			if (panic->page < 0 || new_page < panic->page) {
>  				xe_res_first(bo->ttm.resource, new_page * PAGE_SIZE,
> diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
> index 56cff1e44530..04d831b101bd 100644
> --- a/drivers/gpu/drm/xe/xe_vram.c
> +++ b/drivers/gpu/drm/xe/xe_vram.c
> @@ -55,9 +55,6 @@ static int determine_lmem_bar_size(struct xe_device *xe, struct xe_vram_region *
>  	/* XXX: Need to change when xe link code is ready */
>  	lmem_bar->dpa_base = 0;
>  
> -	/* set up a map to the total memory area. */
> -	lmem_bar->mapping = devm_ioremap_wc(&pdev->dev, lmem_bar->io_start, lmem_bar->io_size);
> -
>  	return 0;
>  }
>  
> @@ -196,7 +193,7 @@ static void vram_fini(void *arg)
>  	struct xe_tile *tile;
>  	int id;
>  
> -	xe->mem.vram->mapping = NULL;
> +	xe_assert(xe, !xe->mem.vram->mapping);
>  
>  	for_each_tile(tile, xe, id) {
>  		tile->mem.vram->mapping = NULL;
> @@ -257,8 +254,15 @@ static int vram_region_init(struct xe_device *xe, struct xe_vram_region *vram,
>  		return -ENODEV;
>  	}
>  
> +	if (vram != xe->mem.vram) {
> +		struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> +
> +		vram->mapping = devm_ioremap_wc(&pdev->dev, vram->io_start, vram->io_size);
> +		if (!vram->mapping)
> +			return -ENOMEM;
> +	}
> +
>  	vram->dpa_base = lmem_bar->dpa_base + offset;
> -	vram->mapping = lmem_bar->mapping + offset;
>  	vram->usable_size = usable_size;
>  
>  	print_vram_region_info(xe, vram);
> -- 
> 2.55.0
> 
