Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39897C61D9B
	for <intel-xe@archiver.kernel.org>; Wed, 22 Nov 2023 19:47:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D35D10E0D5;
	Wed, 22 Nov 2023 19:47:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C77810E0D5
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Nov 2023 19:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700682472; x=1732218472;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=FEOh3VTGPjVzEzwmGe7OVuD15Vt9WRXswfmeJCV8SMc=;
 b=VzZ+pmkjgTgwK+AsEsnZ8HQbeRflLzTYXcvtNmWeo/eECxqoA9EioHLp
 R2CNY1H4QGhdYptj84BKFms9Hx5/pETMuneqMO4Jf7RgncsUlQqCgjktw
 nwkoLixj5KUywmSsTzocv4+Z2Ix23BjVht3KNtdtW/aBnqIQV187Onl/g
 f61naVgRVUlbiAe9oOQWC9zt+k+sA1GkeEq18+NiKF3Vz4NOwbaLO2Fug
 MDADjdX/s+D380D96L6lQm5qG5pOsq9boksY2XBS10h2j76VubU7GZaI/
 npvlqU3UZBJkLWXNTS1M3iTxZXpA2yxXJc7u6+3OrMxirlPl2LzPeIVyl w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="382533151"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; d="scan'208";a="382533151"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2023 11:47:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="796121339"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; d="scan'208";a="796121339"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Nov 2023 11:47:51 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 22 Nov 2023 11:47:50 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 22 Nov 2023 11:47:50 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 22 Nov 2023 11:47:50 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 22 Nov 2023 11:47:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gobm7MswAM/FgKR7HBsxQFjUdb1Qp9QrekI0AOzTY2SPQ52M4wDXzZOCbIKTOQuP0EWotMoH36nNzowTSGLBNF3ThPeY70zv8TZwg6l2YiWTYraIz+6iHFYMGk8fbb0IXoQBFB8osLUW3P0sGQ/Iqp0W3qsvDefaFOBqQrgYKh+rqrilRphb9+ZyFWhoBcNkQmSgidP+FgQvxjI4x4Os4poIbuto1c9dwlbwMvulNGfjuAf1/1ulYY4VU0ZHtkl27ELXUFn1WdDidaLGLATuyqY0j1wkyOZSiOofEHGb4Q8DsCjVJzEqzh0ylnboVPV1mUPKeqywGvDREwOqHHyphw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bz+kiCnOW5qPtcz9HI6DsPGvWbtmukDOJlwqlN7Zteg=;
 b=fNx3G3lhrIM+dHo0G3V2JFbsY2WG5Cei6z5ORs7k1g0AtMlaMTKJJYmPCrsCREyNjaMmx/Je4TDIbvJ9yidSkszgaNFJrkPWIjZ5Kcma7wSgSBxIxqbkA0feqj7/oPfR2SKh2wwU5te9Id3zD+VJdL132fF7JN5931mVGPxFeCg8K+GFDLXGcvcwQBw4ZHg5MbAZK78nj3wqt00CTXx8RXUqiol9VORgiKiOUmWPcfKX4ytG2e6AHT5SbXVG49hq5iNMo+NovRnLrtF87h0HSfRW+TsXOqo/vsCmW8Nzh8IhZN2mVNVSFDl/cq/3evUyYm1AHJjmTY5luo/1X9auuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SA1PR11MB5873.namprd11.prod.outlook.com (2603:10b6:806:228::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.18; Wed, 22 Nov
 2023 19:47:43 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0%7]) with mapi id 15.20.7025.017; Wed, 22 Nov 2023
 19:47:42 +0000
Date: Wed, 22 Nov 2023 11:47:40 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Message-ID: <20231122194740.GP1327160@mdroper-desk1.amr.corp.intel.com>
References: <20231115073804.1861-1-michal.wajdeczko@intel.com>
 <20231115073804.1861-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231115073804.1861-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR13CA0190.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::15) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SA1PR11MB5873:EE_
X-MS-Office365-Filtering-Correlation-Id: 79f7e723-49d4-44cb-beab-08dbeb93e46a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: i7sMADpIcCijQ9KEozlia9W4BC7COGc3WKxhz+bs1HArwbGy/x0cZwHTaYfg+onfvTNZvEwAzXTU5ElfCBCD6E5ndK25e05D0CPtkYZBQsTG7G8cmLVTXOyo60ljEe2sSoO1jrCWs3BLDKakSKz+cUR/P7PaJQtemAWqXVbrv0fl+OplgHdryj1qyCNCLMFJx5F6QNpxfKn2U0VUX8668oWZMA34L/EL+jwxFnEjOvkosWFeGvVRusOP8pSgp4xtSWyvY3SWSFcMPGJ+jh/bGZxH3ud3DAygHdurwnfKCBqCjmW1WsumlmNiuv6BeL3UrXSDYniNQ+NWe8qsZZYeMnoiE6Pj2SKqlIv7FvsqQ6Fkh25QdzKTFouOgZ9UA3d0zeNg707bEyKRwL1gsR9ylLi1OiewjqTKh1n6OBFUal2YHvSM6z6mJznd6ewss3dGVa8guGjuY9o030a+c0ge0qpx+vNS+i3C/k1D//gD1Yy3DPqxQTNZHKZTbG2HlpIMdB8oObXDN2YOvBHKeWGOPrNIEJZ4cHdfmD5fgLRB4s1YmljeSVa8vxpFsgAGb+j5
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(136003)(346002)(39860400002)(376002)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(83380400001)(26005)(6486002)(6506007)(478600001)(82960400001)(66946007)(66476007)(6636002)(316002)(1076003)(6512007)(8676002)(4326008)(6862004)(38100700002)(8936002)(66556008)(5660300002)(41300700001)(33656002)(86362001)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Ar7OZ9Xtk+HtrhDYgtlkh7tUSEzgubZ74h3cllDXYTpPa2Lb/KMDdNqDAX?=
 =?iso-8859-1?Q?w+gHhCsajyXFFtOIbhw6QJmnbkDkOyPkVOPInApKYIi7rjp8ytEWJt5o91?=
 =?iso-8859-1?Q?hBVmcxg5/lAu8gQRmlfaEpLwTokZqybfbRl5AffofdMt76gZMSrKsNgqnl?=
 =?iso-8859-1?Q?uyp2ve/zWJzwWfkevy2u3NAoH7FQER6Gf+lyN76RsPJBKqbS3iBGfcwbtb?=
 =?iso-8859-1?Q?IQi19Rwj+7WlMJDNLWhzFOzL9QosRaJHU/5fKsxMv+iRp+Jb+EiqnJ9rZ7?=
 =?iso-8859-1?Q?xF0pwrX5BYA1N25URp4brn/pTxpfmPdSwXMcVPKhqgv/thCuPKMJllLAlT?=
 =?iso-8859-1?Q?zkScWmfNG1ZJHR6WvpBWHjNBdvWFJsHLbNn0vQpNg62rDpGVPjDlueXUQY?=
 =?iso-8859-1?Q?kimTt+nSkdNPfPNysx/MESnDTO8tLNWM9pSG+tm8qT3BVkd6qmVjNSu5q8?=
 =?iso-8859-1?Q?ZfaWOmTdBh45OlXNGPARvuOxebjfsRqWCSAO5no4oJN786jHs/BWy2GfHK?=
 =?iso-8859-1?Q?t/3f6PYQJC6Uf4RP6/oCo1OBibG93h7ZiK7niPuCAmNcnCItFrJmEjhtGK?=
 =?iso-8859-1?Q?UmH3qqb0UhRxoAtcUsR8lVmRXGc47/LyL/Je7l6Np1XgGVgYRe02rep0jw?=
 =?iso-8859-1?Q?RUAC+hVIjn03QShhFFJnNNAvJKrzKh+ZN3RZB2dvPBRxoDQDoE3mhOl1ik?=
 =?iso-8859-1?Q?seM1dKGL/S2v40a/JWywrjAaVz13eGdRNoTV95YgrPgzmsgE0nWs+7mLue?=
 =?iso-8859-1?Q?OOKrchuKopAylPJMzjkR74aGEqiUZxqChcZ5WYJq2NsavRfJ9d6issZIg6?=
 =?iso-8859-1?Q?LCZ0QQjng/JoXzIIVejLWbVsN5bHX/3BvzSJG7zXlfHr6r0F0o3x+XoiX6?=
 =?iso-8859-1?Q?siMTwhdUBfPbkmoVs7e+bSFZMo2xa29jS6ibOEq/AGbwQ4TgxS9WaLEEQV?=
 =?iso-8859-1?Q?JwPApRbmRPMBTTVr4B3owZKCS2jSSvD4E+J4Q6toyyWF3Wyw8lNbjCsbsT?=
 =?iso-8859-1?Q?ZcggEjyapaDK7fOEvbnb5P/EsUnarbjLxF1SM5+ypIUiSYEfFc0Txo+9ZO?=
 =?iso-8859-1?Q?5of69Ua6QewANcM4uEvlOwQpu/PTGR3GryYmYKT+Jahh8Y7kzvm9bFNoS5?=
 =?iso-8859-1?Q?771gBOnWwTgRNEo3Qeltgv+AcwbZr9iVzdN+TEsSeKmhH8iPqAD1tZlLzL?=
 =?iso-8859-1?Q?Js9nI4b5+McZ3mo+4dral5F4LUV9RGpSqs0tTa4/+p56X67RHHK6S/z+wu?=
 =?iso-8859-1?Q?BuhDElFcpmlXhu3XfG+uJJB7Unu3T5hvoWfK55JNplkcQCZfAJRKKlQlu6?=
 =?iso-8859-1?Q?jnZiG3THc6PihFXcj8le2zZQs7Ai56uIvTTNqDijTYEK2dWcB/o11H9UGR?=
 =?iso-8859-1?Q?i6RU+M3VuoBLmvsougyyJTd7ICuhXcRl/otUOPeqvbmMbpZ4TEmw0WGqNd?=
 =?iso-8859-1?Q?ffMx51Qj7F4pq4LobWzv45Dnd9BU7fLbjf+uAt8h28cDStUFQOMNoJH6Ig?=
 =?iso-8859-1?Q?8yfWBrPe4L163qAiG+Gqhup3GokLs8nPtP6YcdDzYTFUjCKrTBwtc/39xY?=
 =?iso-8859-1?Q?U963vJI7hPs7wVU8sJTpNDbh/KZc16ftkiKz0pkGJHbXD+Nj8S+eQrPxTN?=
 =?iso-8859-1?Q?STKsI8jkNC2gQL0xq3iXtXOlMD9zIAUEQIx0YVYl8wED0UVDrqlOsEuA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 79f7e723-49d4-44cb-beab-08dbeb93e46a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2023 19:47:42.9158 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YGR/7LtqIheROylRlnKutVfZoGr3cI7wL3i3l+3MwkEnRJDHBKlY0JJtnSM+Wkx32JSeCCako44988Ii8602sy3LrckVP7naM1s1L6VGAUM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5873
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/3] drm/xe: Prepare for running in different
 SR-IOV modes
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Nov 15, 2023 at 08:38:03AM +0100, Michal Wajdeczko wrote:
> We will be adding support for the SR-IOV and driver might be then
> running, in addition to existing non-virtualized bare-metal mode,
> also in Physical Function (PF) or Virtual Function (VF) mode.
> 
> Since these additional modes require some changes to the driver,
> define enum flag to represent different SR-IOV modes and add a
> function where we will detect the actual mode in the runtime.
> 
> We start with a forced bare-metal mode as it is sufficient to
> enable basic functionality and ensures no impact to existing code.

For platforms that support SRIOV, can you describe what the benefit is
of running in bare-metal mode vs just running in PF mode with no VFs
active?  Will we wind up needing to do extra initialization in PF mode
that could be counter-productive if someone didn't actually want to use
any virtualization?  Will the system have additional limitations in PF
mode that we can avoid in bare-metal mode?

Aside from adding some explanation for that,

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile          |  3 ++
>  drivers/gpu/drm/xe/xe_device_types.h |  7 ++++
>  drivers/gpu/drm/xe/xe_pci.c          |  3 ++
>  drivers/gpu/drm/xe/xe_sriov.c        | 55 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_sriov.h        | 42 +++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_sriov_types.h  | 28 ++++++++++++++
>  6 files changed, 138 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_sriov.c
>  create mode 100644 drivers/gpu/drm/xe/xe_sriov.h
>  create mode 100644 drivers/gpu/drm/xe/xe_sriov_types.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index cb41b4fead08..fbba74d9a330 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -123,6 +123,9 @@ xe-y += xe_bb.o \
>  # graphics hardware monitoring (HWMON) support
>  xe-$(CONFIG_HWMON) += xe_hwmon.o
>  
> +# graphics virtualization (SR-IOV) support
> +xe-y += xe_sriov.o
> +
>  # i915 Display compat #defines and #includes
>  subdir-ccflags-$(CONFIG_DRM_XE_DISPLAY) += \
>  	-I$(srctree)/$(src)/display/ext \
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index f2ba4f746fa2..2712905c7a91 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -18,6 +18,7 @@
>  #include "xe_platform_types.h"
>  #include "xe_pt_types.h"
>  #include "xe_pmu.h"
> +#include "xe_sriov_types.h"
>  #include "xe_step_types.h"
>  
>  #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
> @@ -299,6 +300,12 @@ struct xe_device {
>  		struct ttm_resource_manager sys_mgr;
>  	} mem;
>  
> +	/** @sriov: device level virtualization data */
> +	struct {
> +		/** @sriov.__mode: SR-IOV mode (Don't access directly!) */
> +		enum xe_sriov_mode __mode;
> +	} sriov;
> +
>  	/** @usm: unified memory state */
>  	struct {
>  		/** @asid: convert a ASID to VM */
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index c1c8048bbc0f..3030b223e4a0 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -24,6 +24,7 @@
>  #include "xe_module.h"
>  #include "xe_pci_types.h"
>  #include "xe_pm.h"
> +#include "xe_sriov.h"
>  #include "xe_step.h"
>  
>  enum toggle_d3cold {
> @@ -706,6 +707,8 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  
>  	pci_set_master(pdev);
>  
> +	xe_sriov_probe_early(xe, desc->has_sriov);
> +
>  	err = xe_info_init(xe, desc, subplatform_desc);
>  	if (err)
>  		goto err_pci_disable;
> diff --git a/drivers/gpu/drm/xe/xe_sriov.c b/drivers/gpu/drm/xe/xe_sriov.c
> new file mode 100644
> index 000000000000..42a0e0c917a0
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sriov.c
> @@ -0,0 +1,55 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#include "xe_assert.h"
> +#include "xe_sriov.h"
> +
> +/**
> + * xe_sriov_mode_to_string - Convert enum value to string.
> + * @mode: the &xe_sriov_mode to convert
> + *
> + * Returns: SR-IOV mode as a user friendly string.
> + */
> +const char *xe_sriov_mode_to_string(enum xe_sriov_mode mode)
> +{
> +	switch (mode) {
> +	case XE_SRIOV_MODE_NONE:
> +		return "none";
> +	case XE_SRIOV_MODE_PF:
> +		return "SR-IOV PF";
> +	case XE_SRIOV_MODE_VF:
> +		return "SR-IOV VF";
> +	default:
> +		return "<invalid>";
> +	}
> +}
> +
> +/**
> + * xe_sriov_probe_early - Probe a SR-IOV mode.
> + * @xe: the &xe_device to probe mode on
> + * @has_sriov: flag indicating hardware support for SR-IOV
> + *
> + * This function should be called only once and as soon as possible during
> + * driver probe to detect whether we are running a SR-IOV Physical Function
> + * (PF) or a Virtual Function (VF) device.
> + *
> + * SR-IOV PF mode detection is based on PCI @dev_is_pf() function.
> + * SR-IOV VF mode detection is based on dedicated MMIO register read.
> + */
> +void xe_sriov_probe_early(struct xe_device *xe, bool has_sriov)
> +{
> +	enum xe_sriov_mode mode = XE_SRIOV_MODE_NONE;
> +
> +	/* TODO: replace with proper mode detection */
> +	xe_assert(xe, !has_sriov);
> +
> +	xe_assert(xe, !xe->sriov.__mode);
> +	xe->sriov.__mode = mode;
> +	xe_assert(xe, xe->sriov.__mode);
> +
> +	if (has_sriov)
> +		drm_info(&xe->drm, "Running in %s mode\n",
> +			 xe_sriov_mode_to_string(xe_device_sriov_mode(xe)));
> +}
> diff --git a/drivers/gpu/drm/xe/xe_sriov.h b/drivers/gpu/drm/xe/xe_sriov.h
> new file mode 100644
> index 000000000000..5af73a3172b0
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sriov.h
> @@ -0,0 +1,42 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef _XE_SRIOV_H_
> +#define _XE_SRIOV_H_
> +
> +#include "xe_assert.h"
> +#include "xe_device_types.h"
> +#include "xe_sriov_types.h"
> +
> +const char *xe_sriov_mode_to_string(enum xe_sriov_mode mode);
> +
> +void xe_sriov_probe_early(struct xe_device *xe, bool has_sriov);
> +
> +static inline enum xe_sriov_mode xe_device_sriov_mode(struct xe_device *xe)
> +{
> +	xe_assert(xe, xe->sriov.__mode);
> +	return xe->sriov.__mode;
> +}
> +
> +static inline bool xe_device_is_sriov_pf(struct xe_device *xe)
> +{
> +	return xe_device_sriov_mode(xe) == XE_SRIOV_MODE_PF;
> +}
> +
> +static inline bool xe_device_is_sriov_vf(struct xe_device *xe)
> +{
> +	return xe_device_sriov_mode(xe) == XE_SRIOV_MODE_VF;
> +}
> +
> +#ifdef CONFIG_PCI_IOV
> +#define IS_SRIOV_PF(xe) xe_device_is_sriov_pf(xe)
> +#else
> +#define IS_SRIOV_PF(xe) (typecheck(struct xe_device *, (xe)) && false)
> +#endif
> +#define IS_SRIOV_VF(xe) xe_device_is_sriov_vf(xe)
> +
> +#define IS_SRIOV(xe) (IS_SRIOV_PF(xe) || IS_SRIOV_VF(xe))
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_sriov_types.h b/drivers/gpu/drm/xe/xe_sriov_types.h
> new file mode 100644
> index 000000000000..999a4311b98b
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sriov_types.h
> @@ -0,0 +1,28 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef _XE_SRIOV_TYPES_H_
> +#define _XE_SRIOV_TYPES_H_
> +
> +#include <linux/build_bug.h>
> +
> +/**
> + * enum xe_sriov_mode - SR-IOV mode
> + * @XE_SRIOV_MODE_NONE: bare-metal mode (non-virtualized)
> + * @XE_SRIOV_MODE_PF: SR-IOV Physical Function (PF) mode
> + * @XE_SRIOV_MODE_VF: SR-IOV Virtual Function (VF) mode
> + */
> +enum xe_sriov_mode {
> +	/*
> +	 * Note: We don't use default enum value 0 to allow catch any too early
> +	 * attempt of checking the SR-IOV mode prior to the actual mode probe.
> +	 */
> +	XE_SRIOV_MODE_NONE = 1,
> +	XE_SRIOV_MODE_PF,
> +	XE_SRIOV_MODE_VF,
> +};
> +static_assert(XE_SRIOV_MODE_NONE);
> +
> +#endif
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
