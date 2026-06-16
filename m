Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2654CCD98D2
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jun 2026 20:22:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD36210ED54;
	Tue, 16 Jun 2026 20:22:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ibn79X/k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3F9410ED54
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Jun 2026 20:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781641347; x=1813177347;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=NQQ/qOC9hXf6LsgnPW2ANENHGyTEhDaCdw1mbpxLbO0=;
 b=ibn79X/kv8TM+2TKmBwK6UTfgPQ6pYuOxeYAKQ/N1lWg6rVmosGyqVGq
 OYdMxM3uh0bwEmOc2RZVTQAOiDf11WmczmJDVjV8dimptRb7DBGRzLsVF
 Zb/SS2W62nZQ9jyNec3oXzjjoXr4ninx85fvJoztRZkjCfh/cW9NLLCnQ
 fuISmZWuCAG2CbTAcEjFWdeF4KKUSBa8hAYOLpAyly852Di/9vkwDb92V
 RkAWMUiUPwfbZzYFqhBLt4XK00ZaMmnXxaZ1n7ohx5vxk/Wm2kgTfflYH
 krzK0a+9p7oemMXkO3laOnnMEP5IRvx/qlmhYPrzDqgx1dVdDvltKkMoQ Q==;
X-CSE-ConnectionGUID: uSXttvekR7GEZ3Fi4W5Wtw==
X-CSE-MsgGUID: vDZtIgxAQE20/vv0VAsulA==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="99836417"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="99836417"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 13:22:26 -0700
X-CSE-ConnectionGUID: af1J4iTyTG60tXNmbpL0KA==
X-CSE-MsgGUID: 8SrAhUIITgW3f86ylhqlpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="246740272"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 13:22:26 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 16 Jun 2026 13:22:26 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 16 Jun 2026 13:22:26 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.40) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 16 Jun 2026 13:22:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sOaI1jhjSDfYSWz9HQsE5B9Zm/x6uP91imSYM/SWwLn6+5OYnZ1LEpCdWVw147NDtV44GLRDcAFfSSyfgbKHxf6vwbaaFAyNqH8sF+HuSim1ZN2DQjyWMvitV10OssYgGCVulx1eFeRHIR/CgL3fdcgBIY7Vdr7E3LbV4XsQtSHyOSxFb/O6y/7BDi1tu6169m0BokL3egQnle4/c7XALHIjxjwaGUwlb2qsw6dYE0Q2C6+NjPMU0npEGKvONhHNMQ/5iDi5JgJ5/09mLpTSLdF5XV9Z8EZjIhVk4MMnYkMGtFEOMZd/aMLMgX4mlNVFdYnJENt8gLyiSXZxa39I6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sWcNbdxiBUMupBqTDbFwYbkKogVJXBC/1+9frG0MK3A=;
 b=wZLYAxPo2e9w0aBHhYJiPWHoJ8bpbFSGoEMbuwC2dQUlWe44TdwDmGTu2QA6cXKbzyUICQUnkIViMWZszadgXifPdQEurnj5eU3/tzckBivZtET+qq79gMpy2mtU6wrt1Lo+5qI697Nm8b+WZ/FjRSxHG8NxvZHR2NVhygQN+WmsLptcLvqbY3RC+TcQ3QpFEMnhSap6OaD0RSLyNjrRv2FKNJW2yImLRzZw0jR1ML2Go7E12FtBA6ycrWckFOy+poO0x79Sm16FAz3PzMMUw33yTgjgN9pvN6s9CUp3ofVbFSMb2v/AMubtN70mKBJ0DEkBW9YxA4LNQZoeyebZKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8284.namprd11.prod.outlook.com (2603:10b6:806:268::21)
 by DM4PR11MB6240.namprd11.prod.outlook.com (2603:10b6:8:a6::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.18; Tue, 16 Jun 2026 20:22:23 +0000
Received: from SN7PR11MB8284.namprd11.prod.outlook.com
 ([fe80::65e5:898b:2231:bf65]) by SN7PR11MB8284.namprd11.prod.outlook.com
 ([fe80::65e5:898b:2231:bf65%4]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 20:22:23 +0000
Date: Tue, 16 Jun 2026 13:22:09 -0700
From: Violet Monti <violet.monti@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 7/9] drm/xe: Add graphics/media IPs and their step info
 to xe_probed_info
Message-ID: <ajGwcTpjxKG5IkYh@vmonti-desk>
References: <20260609-xe-probe-info-v1-0-21e83e188e60@intel.com>
 <20260609-xe-probe-info-v1-7-21e83e188e60@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260609-xe-probe-info-v1-7-21e83e188e60@intel.com>
X-ClientProxiedBy: SJ0PR13CA0233.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::28) To SN7PR11MB8284.namprd11.prod.outlook.com
 (2603:10b6:806:268::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8284:EE_|DM4PR11MB6240:EE_
X-MS-Office365-Filtering-Correlation-Id: bb454394-e9b8-4906-302b-08decbe4f948
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|22082099003|18002099003|4143699003|5023799004|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: wVUyzl+zX4tnQD+DXox5yt1pyTbKqnlq8V/KbNY1x4sKWVNIIUA76LalV1WqexkV5e1ZT+bDW4EG/QLWD1ea9I4uZtOOG8F0s2PQB+3NhTpv75ioMd3fi+QPuCL3yG4dB0ccvyJeufQjhQi/cve8r5kjR2khc8qJN4vE/jMLpXwzrVObXzYS/xgo/g9yRgWODqHW3aHR3JHMbXjQOVfqGqxI5WqAVfReHgAGtJ5YS2CdbKK/leaB7/eobG4RqhVrHDsauCdJ73dDONuGUghZZNRswsmXsilhwf14OYNRju54UjTYmAX5NFkOXJkwF2PuJj/k9lr+FMAUWvdoFvcQqYGHmHkqQ0Z+5UcxgUc0GSil/D5BEkhnuuxGR6uWBVe3fDcqqxCds33BJ4ClgE3wNk5JgK29/4/JfLWWp9vxxnyeuR+y8aOD42RW8jElduQctA0ib2OWXIktSLaERZRQqghuY+MrD2j4ptEaF3t/W9vFsBnHIWAz05YKC4aCHWudgKn6+PjI2XzK8zgpmr27o1+YAoMzT/a2a/Lygi9uTLdlvUR1xGbDvj61HfV8aHGL3+RMZSgxeIPLw4twyAd7imQf6mzruN50yBtXY0N+hNL+LaMSLVEAsz9Jpz8xVM/FLaLDoGIjY3AePdqmOthHdzQffh2+19dX937r+PVzlXfyucVRtF5d2NtN5dvyJ0ah
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB8284.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(22082099003)(18002099003)(4143699003)(5023799004)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gH6G6Ezysuh7124SkgM3U4PfDkqUNVukOapCqBp7r5WG587BwbgYyqP4T6eF?=
 =?us-ascii?Q?E27IJSu0FEYtq+GYN16iaahFwQzJBSyDUPhqnWeY1lupSm7Fv13SnT3rTA2K?=
 =?us-ascii?Q?8aLBEg7e1PfSgiUA6BjUzcS5flAasreko4Xiq+Z8S8tI4QsD+oE6Lrn+VyQj?=
 =?us-ascii?Q?YRH2ciTqw2SrTvV4QvIjJhN8jOiytoZ84/LhalrheptsazOJtpPeKxVaRxKE?=
 =?us-ascii?Q?UtpMtnoh1t+pRN0zaDkBCXHCYCx9rRF/rov1UR3o/CBl7Qhw87GAaiYgOrA3?=
 =?us-ascii?Q?1XGL2xPsLwi95qUBJSazNDqPhD+IypDqDREh5iBO8kUfr7bCdozag7mkdaaN?=
 =?us-ascii?Q?L37jhkbRHiFkC1qgj+XseujCCCSbUu8wuGCML/+7oWLVE7apQKv3iLO1rBxw?=
 =?us-ascii?Q?q7ngm+FsOIWoAzXT845Xps4Fk0gXjvRe+4xnb9zwEkcy49QtVG2b9B6OYlJG?=
 =?us-ascii?Q?ilPUbtTtnZNTskeoDnzL28KliLbVbYF99HAIeAf0LE9Gk6BXNZx9EI1ras5D?=
 =?us-ascii?Q?MlbIh5XnAHMuw+leZsYowp67e04JuD81ei88AXk0SFtqwRVbMWmKEf4eRZRT?=
 =?us-ascii?Q?xM4LT619XJFiHp0yogcIqYiVVX/X+nDYChdIeYoHFWqSG+uX/xXIKCwc5ytY?=
 =?us-ascii?Q?j8g07wjCe/jg0OTrksI52rAOmDSSWQdS3BR73WVRAfk9Au56kb2N2SgPQTVO?=
 =?us-ascii?Q?tB8Dmrriz98W2DMGqFhO6wNTszTkduZGr+WK0x6NF8nrZB3n+x12drac1WTg?=
 =?us-ascii?Q?qKsb+z+fYf6LmtUrzGD11L3OBcHJ8Az+SC7piYASeYLFOuBLlNAvDtwR2wMT?=
 =?us-ascii?Q?pTZe7+r8shZS9DzfKw18iELfxUmv3vtge7jHsudmDQZkBbtPkm0n6syOU3fL?=
 =?us-ascii?Q?1ZS2ZsNCJrQ7QLrVHKG4UsVkbDzRH9ZMXkrs6HkUAIQjYhhC20/r9oy1y2Ch?=
 =?us-ascii?Q?4ozmUmvPa6m4ITCmfpYwpjfeNOs2CpG5yY1iVzYRt5LgSl6tezvHONcUWiof?=
 =?us-ascii?Q?jn+TBNC/PUTnFCd8eUH3Wy8RBh4x79e7tFhL6oI/n+CWdwvpUD0KfzhFGtPo?=
 =?us-ascii?Q?2OeHO226vSjfLhQtubN7eJz/v2qIKSbaHG2tY77o+omMd18UQXbxV6gVne2J?=
 =?us-ascii?Q?xGRJLINZOwoeRVhBAIglvZfqNpROZDhiLBdmFSRmSIHSTXrPQobFjOk+RE4Z?=
 =?us-ascii?Q?qHXOIaL1F1Qq8P3EfVFaJspmKi+T0XZpPiH7pW5kROKKciwUFo2jpXJMvX2+?=
 =?us-ascii?Q?be0iAZEJsAlluisqZDpHsG5oVE1d/0LGCXy+zt/Ei0yE5/55KJGYY2g6zkeT?=
 =?us-ascii?Q?Y8sXVJYK15bot6VgN6/UJIWHQRGVJLUbCSrPV1YZWYrxipNHuJ9PMORCs7Gf?=
 =?us-ascii?Q?4lNqLUsE089qw06MjuhpVtdMZ6QmRYHpYPRbzuA22VvWlJ8WKPdWodWHrgt8?=
 =?us-ascii?Q?XSCKp551lQCw20X8j/E7WPVgIpt1dp+eESwhlgr9T5YT3+bKeHwF5yL0H6UY?=
 =?us-ascii?Q?4Ei22Rh4AhyHJNmXI1/W5hb6XAWicGz4OUtKU6TUi/x7N5rZXBw/DXe8jmkK?=
 =?us-ascii?Q?MFTihaTZ0SxsyEY+qkY2clBAbQhPV2x06ZJp3bvFVYf9JrL2Dnt804ZUTNUL?=
 =?us-ascii?Q?LkmuhY3dEbPxQ4ENkouOAqgEM1oiH6wNPusklw8V+JpVwUsb84DEXcSXJnic?=
 =?us-ascii?Q?6zkiW2T8tc8/HE1tsLetN7EpxPinoQ+XOfZu6TYSALqPqUWTB3Tiu47KAZja?=
 =?us-ascii?Q?TkHUuoLYEg=3D=3D?=
X-Exchange-RoutingPolicyChecked: L8qBFLpfrvAtKA/OxuCd6KxiEBumgMUEeqPWmRUaMiC85OaKScRfesGIinOQ2w4zhb2QSxcmdNXSlp6YqWMwwmIFkPHA3VatlyFMQUeXaz4WpBGOTFCzMYQLR/U17gw7S9n/EHI6Nz+sU+CBNVWvK9GG1JsXytYy10d8gc2vRcbajyRKJCK9d0J1N4c+AatiAyYw7cd7OD7yY1ydO6DpvzLMNMjCbLnhBGufTVhTUnTiBRqK6eRdA1j86d/VNBfufkLKFuZPEHLqgcEBKf4vtOBCvcE2F6XmGt0sNjp0EVt9hwrDrB3yF4dCZxscqGMr1JzqV/SGR3SOB3XMtOzsOg==
X-MS-Exchange-CrossTenant-Network-Message-Id: bb454394-e9b8-4906-302b-08decbe4f948
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8284.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 20:22:22.9887 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wctCdA1fDrhoXeVOakbfC+zuFm8BkFwg/zIJrh0z7ibqTRlciAYna7UNeKNikeo7DeaSEko5FCcR1ZqHa3mNJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6240
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

On Tue, Jun 09, 2026 at 05:17:39PM -0300, Gustavo Sousa wrote:
> On GMDID-based platforms, the driver needs to probe the hardware by
> reading GMDID registers in order to identify the
> graphics/media/display IPs that are present in the platform as well as
> their stepping values.
> 
> Currently, xe_info_init() has such a probing logic, but that task
> should be rather responsibility of xe_probe_info().  As such, move it
> to the latter.
> 
> For pre-GMDID platforms, the IPs are identified via PCI devid and
> revid fields, which is arguably also hardware dependent.  So do the
> same for those platforms.
> 
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>

Reviewed-by: Violet Monti <violet.monti@intel.com>

> ---
>  drivers/gpu/drm/xe/tests/xe_pci.c | 44 ++++++++++----------
>  drivers/gpu/drm/xe/xe_pci.c       | 88 ++++++++++++++++++++++++---------------
>  2 files changed, 77 insertions(+), 55 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
> index a665d5dbc472..cd64b1d614c8 100644
> --- a/drivers/gpu/drm/xe/tests/xe_pci.c
> +++ b/drivers/gpu/drm/xe/tests/xe_pci.c
> @@ -311,31 +311,35 @@ const void *xe_pci_id_gen_param(struct kunit *test, const void *prev, char *desc
>  }
>  EXPORT_SYMBOL_IF_KUNIT(xe_pci_id_gen_param);
>  
> -static int fake_read_gmdid(struct xe_device *xe, enum xe_gmdid_type type,
> -			   u32 *ver, u32 *revid)
> -{
> -	struct kunit *test = kunit_get_current_test();
> -	struct xe_pci_fake_data *data = test->priv;
> -
> -	if (type == GMDID_MEDIA) {
> -		*ver = data->media_verx100;
> -		*revid = xe_step_to_gmdid(data->step.media);
> -	} else {
> -		*ver = data->graphics_verx100;
> -		*revid = xe_step_to_gmdid(data->step.graphics);
> -	}
> -
> -	return 0;
> -}
> -
>  static void fake_xe_info_probe_tile_count(struct xe_device *xe)
>  {
>  	/* Nothing to do, just use the statically defined value. */
>  }
>  
>  static int fake_probe_info(struct xe_device *xe,
> +			   const struct xe_device_desc *desc,
> +			   struct xe_pci_fake_data *data,
>  			   struct xe_probed_info *probed_info)
>  {
> +	if (!data || desc->pre_gmdid_graphics_ip) {
> +		probed_info->graphics_ip = desc->pre_gmdid_graphics_ip;
> +		probed_info->media_ip = desc->pre_gmdid_media_ip;
> +	} else {
> +		probed_info->graphics_ip = find_graphics_ip(data->graphics_verx100);
> +
> +		if (data->media_verx100) {
> +			probed_info->media_ip = find_media_ip(data->media_verx100);
> +			xe_assert(xe, probed_info->media_ip);
> +		}
> +	}
> +
> +	xe_assert(xe, probed_info->graphics_ip);
> +	if (!probed_info->graphics_ip)
> +		return -ENODEV;
> +
> +	if (data)
> +		probed_info->step = data->step;
> +
>  	return 0;
>  }
>  
> @@ -377,20 +381,16 @@ int xe_pci_fake_device_init(struct xe_device *xe)
>  	xe->sriov.__mode = data && data->sriov_mode ?
>  			   data->sriov_mode : XE_SRIOV_MODE_NONE;
>  
> -	kunit_activate_static_stub(test, read_gmdid, fake_read_gmdid);
>  	kunit_activate_static_stub(test, xe_info_probe_tile_count,
>  				   fake_xe_info_probe_tile_count);
>  
> -	err = fake_probe_info(xe, &probed_info);
> +	err = fake_probe_info(xe, desc, data, &probed_info);
>  	if (err)
>  		return err;
>  
>  	xe_info_init_early(xe, desc, subplatform_desc, &probed_info);
>  	xe_info_init(xe, desc, &probed_info);
>  
> -	if (data && !data->graphics_verx100)
> -		xe->info.step = data->step;
> -
>  	return 0;
>  }
>  EXPORT_SYMBOL_IF_KUNIT(xe_pci_fake_device_init);
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 1c53a25442a9..388771ef6a52 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -600,8 +600,6 @@ static int read_gmdid(struct xe_device *xe, enum xe_gmdid_type type, u32 *ver, u
>  	struct xe_reg gmdid_reg = GMD_ID;
>  	u32 val;
>  
> -	KUNIT_STATIC_STUB_REDIRECT(read_gmdid, xe, type, ver, revid);
> -
>  	if (IS_SRIOV_VF(xe)) {
>  		/*
>  		 * To get the value of the GMDID register, VFs must obtain it
> @@ -731,6 +729,8 @@ struct xe_probed_info {
>  	u16 devid;
>  	u8 revid;
>  	struct xe_step_info step;
> +	const struct xe_ip *graphics_ip;
> +	const struct xe_ip *media_ip;
>  };
>  
>  /*
> @@ -924,12 +924,59 @@ static struct xe_gt *alloc_media_gt(struct xe_tile *tile,
>  	return gt;
>  }
>  
> +static int xe_probe_ips(struct xe_device *xe,
> +			const struct xe_device_desc *desc,
> +			struct xe_probed_info *probed_info)
> +{
> +	/*
> +	 * If this platform supports GMD_ID, we'll detect the proper IP
> +	 * descriptor to use from hardware registers.
> +	 * desc->pre_gmdid_graphics_ip will only ever be set at this point for
> +	 * platforms before GMD_ID. In that case the IP descriptions and
> +	 * versions are simply derived from that.
> +	 */
> +	if (desc->pre_gmdid_graphics_ip) {
> +		probed_info->graphics_ip = desc->pre_gmdid_graphics_ip;
> +		probed_info->media_ip = desc->pre_gmdid_media_ip;
> +		xe_step_pre_gmdid_get(xe, &probed_info->step);
> +	} else {
> +		int err;
> +		u32 graphics_revid, media_revid;
> +
> +		xe_assert(xe, !desc->pre_gmdid_media_ip);
> +
> +		err = handle_gmdid(xe, &probed_info->graphics_ip, &probed_info->media_ip,
> +				   &graphics_revid, &media_revid);
> +		if (err)
> +			return err;
> +
> +		xe_step_gmdid_get(xe, graphics_revid, media_revid, &probed_info->step);
> +	}
> +
> +	/*
> +	 * If we couldn't detect the graphics IP, that's considered a fatal
> +	 * error and we should abort driver load.  Failing to detect media
> +	 * IP is non-fatal; we'll just proceed without enabling media support.
> +	 */
> +	if (!probed_info->graphics_ip)
> +		return -ENODEV;
> +
> +	return 0;
> +}
> +
>  /*
>   * Probe from the hardware the info required by xe_info_init().
>   */
>  static int xe_probe_info(struct xe_device *xe,
> +			 const struct xe_device_desc *desc,
>  			 struct xe_probed_info *probed_info)
>  {
> +	int err;
> +
> +	err = xe_probe_ips(xe, desc, probed_info);
> +	if (err)
> +		return err;
> +
>  	return 0;
>  }
>  
> @@ -943,44 +990,19 @@ static int xe_info_init(struct xe_device *xe,
>  			const struct xe_device_desc *desc,
>  			struct xe_probed_info *probed_info)
>  {
> -	u32 graphics_gmdid_revid = 0, media_gmdid_revid = 0;
>  	const struct xe_ip *graphics_ip;
>  	const struct xe_ip *media_ip;
>  	const struct xe_graphics_desc *graphics_desc;
>  	const struct xe_media_desc *media_desc;
>  	struct xe_tile *tile;
>  	struct xe_gt *gt;
> -	int ret;
>  	u8 id;
>  
> -	/*
> -	 * If this platform supports GMD_ID, we'll detect the proper IP
> -	 * descriptor to use from hardware registers.
> -	 * desc->pre_gmdid_graphics_ip will only ever be set at this point for
> -	 * platforms before GMD_ID. In that case the IP descriptions and
> -	 * versions are simply derived from that.
> -	 */
> -	if (desc->pre_gmdid_graphics_ip) {
> -		graphics_ip = desc->pre_gmdid_graphics_ip;
> -		media_ip = desc->pre_gmdid_media_ip;
> -		xe_step_pre_gmdid_get(xe, &xe->info.step);
> -	} else {
> -		xe_assert(xe, !desc->pre_gmdid_media_ip);
> -		ret = handle_gmdid(xe, &graphics_ip, &media_ip,
> -				   &graphics_gmdid_revid, &media_gmdid_revid);
> -		if (ret)
> -			return ret;
> -
> -		xe_step_gmdid_get(xe, graphics_gmdid_revid, media_gmdid_revid, &xe->info.step);
> -	}
> -
> -	/*
> -	 * If we couldn't detect the graphics IP, that's considered a fatal
> -	 * error and we should abort driver load.  Failing to detect media
> -	 * IP is non-fatal; we'll just proceed without enabling media support.
> -	 */
> -	if (!graphics_ip)
> -		return -ENODEV;
> +	graphics_ip = probed_info->graphics_ip;
> +	media_ip = probed_info->media_ip;
> +	xe->info.step.basedie = probed_info->step.basedie;
> +	xe->info.step.graphics = probed_info->step.graphics;
> +	xe->info.step.media = probed_info->step.media;
>  
>  	xe->info.graphics_verx100 = graphics_ip->verx100;
>  	xe->info.graphics_name = graphics_ip->name;
> @@ -1165,7 +1187,7 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  	if (err)
>  		return err;
>  
> -	err = xe_probe_info(xe, &probed_info);
> +	err = xe_probe_info(xe, desc, &probed_info);
>  	if (err)
>  		return err;
>  
> 
> -- 
> 2.53.0
> 

-- 
--
Violet Monti
