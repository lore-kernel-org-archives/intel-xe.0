Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC615C001B0
	for <intel-xe@archiver.kernel.org>; Tue,  8 Aug 2023 18:59:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C01A10E3EE;
	Tue,  8 Aug 2023 18:59:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E02510E3EE
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Aug 2023 18:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691521156; x=1723057156;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=KvJVGwQRmHQvduIl5n+tP0NfN5BPyI8gX5ejrBZLnoI=;
 b=Q0LqaJluSqgWZc88120ysSxZAzGdAiBpgxq0NwQ7TVo5CwPzKgcqI1yE
 d9NbCxdgt0jenZIWj2BppOznp/vDZwp0XsbD5ZwubtJ6kwvkU/YYfz9za
 QCAjBH6Gyj81L0+cuUAt+bgf+A8Dk5UOR6rNLn7LwPjxNRYHOMEMEfBQa
 ibI2K06QKDXyG5wyyu0aFzQpUdYu2nxZ6OL6WPvCw0htGpH4vND3tqZVW
 DS0fhGZkzZa0EGSa3nc7C9jEb/TysPJWI4GijaCNPHbPL4UdmcxCJi761
 /8EovCDD+lrd33qfxigatoyj2/YiXWTKATrz+Bujg/casdB3uhPnPPFzb Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="374632909"
X-IronPort-AV: E=Sophos;i="6.01,157,1684825200"; d="scan'208";a="374632909"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2023 11:43:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="681369734"
X-IronPort-AV: E=Sophos;i="6.01,157,1684825200"; d="scan'208";a="681369734"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga003.jf.intel.com with ESMTP; 08 Aug 2023 11:43:23 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 8 Aug 2023 11:43:23 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 8 Aug 2023 11:43:23 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.47) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 8 Aug 2023 11:43:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=elnZvOmJJf/+8LZEal0z+q3IGy4cClUuDf6BYZ1jiUPScUerthlpCUogEN4jfhcbIUwxMWczGgj3q0QaYQtZ6Z3EpeaIvF9wF6ZIhHMVPOWholToVS7ngCtSiuAUC13yjPpyur5ye7MRI65QrSnPjDnsovJiUr5Q4FAvU7Gy6k+nD5hbCQe5Wk1sqbvXF8mg+i9Fmx98uYZuEPFeQlT/Y5/gbpl5CD8Q2yEmv+mwK/gtBt64JDQLPpex58LzL2ihcLPLWrWMpaOoYwVMYrp/XW4qQMWaarcJTZ92fp+qp0Q84vafnuMNxv+0JsOSHpCToyQho1Cf9Zb/m5SdExe5JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0asYA02Ode3FyIhMGe/fu/PqKPYFUAOGtaLeMdJeTXI=;
 b=AuVnmohuFjFbMH48u5IuoS2kcuvcZxZBLG+ME9oDU1vXvSQvXulEynceVbvjb7RLsWjsboFTEEXEeLBwH4k/oMI5PRDYeEb4j9fJSaZwaHftMlzZ5LC+0MAown4o3IKFTlAfvWMGgWnAOT/Om+chJsB8FbRCbJEluOSvv44MM1C8W5AMypmefyDQHEad3vhnhJEQOuVZ3fpLXsl5KmE/WcILluExUxd6vfyN9u190R6zTzH4DPH7VO1LLb2NP5FHXVisF6ZWmn6S8aQnUQ3OjEqgf7EATCZ7qyscHIBSQF0q9WeyUk6BgEv4tO3lSTDRPGTPjPLN7dEr/a5C/n9Umw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DS0PR11MB7803.namprd11.prod.outlook.com (2603:10b6:8:f5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.26; Tue, 8 Aug
 2023 18:43:19 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6652.026; Tue, 8 Aug 2023
 18:43:19 +0000
Date: Tue, 8 Aug 2023 14:43:14 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: David Kershner <david.kershner@intel.com>
Message-ID: <ZNKMwjwO2T5aSm65@intel.com>
References: <20230808164534.1027552-1-david.kershner@intel.com>
 <20230808164534.1027552-3-david.kershner@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230808164534.1027552-3-david.kershner@intel.com>
X-ClientProxiedBy: BYAPR01CA0053.prod.exchangelabs.com (2603:10b6:a03:94::30)
 To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DS0PR11MB7803:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bb02e89-0dda-417d-b07a-08db983f55b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wsVOBZcQcdJO1ZXq/iyb4rLZqlqkxY1vewo3aBp/CXv97oqQ00XpWzHh+Wa1DX3Us0mTW9M4yRniME4lXW3L0nDGtRvJ/B1hPaYiai3tv0gGjvP5OL6UUCKQgjyz/3x1lhdF8vM/XdN0UXBoTcbGSKnU2aV7wMzjKTHPV5ZOJcqepjoafkfJgXaScvEUphb3gVUGrccioqDH3stfpk4UrFwQVEp1DmZfZ40BuFTa4fs/5upSqcW+TdT4F7MPG/q85g7X7ilZmL+OWbJGpnGQG1rNKuCs5Q7RgS6IlSiGtJTmokli+4dBaPDexG+BX1+QIEfv4eCz52qQuDpqplSnByNED7st9tcXXWhYdA5b/w4WkaUBAy54f8y6aKJfK8jOGbV7FC47GXkvDaZo4Pz5amkmVpfFv9OsBBB8sQu0HXPRggOJsJnsIW7YtRmRFSa9JynOwXhivqWhcYPr1anzjKNLxbDvQ4W5YhqQElZunnHoZNQqIbaW91LfaRfQw9enXT+WN2L4vvUVDuQbM1KoIjKqYpv7FbuXB5y/8R9biAKpLgvwBAy2cAXRMiNgKC02
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(6029001)(346002)(396003)(366004)(376002)(39860400002)(136003)(451199021)(186006)(1800799003)(83380400001)(66899021)(2616005)(38100700002)(4326008)(37006003)(6636002)(30864003)(8676002)(2906002)(44832011)(6862004)(316002)(5660300002)(8936002)(66946007)(66476007)(41300700001)(66556008)(86362001)(6512007)(478600001)(6666004)(82960400001)(6486002)(6506007)(107886003)(26005)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?xhMFN8McfZcb3CKLfXJ99pl6SF+XvLO2a8md/jQUwn1qd17hMQdytPKfIZ?=
 =?iso-8859-1?Q?qYBqKPmnMkZ3zJLbWuPPQyVd+M2GFQxV2FPmH1UcAzxQaxuvWDjPHFEHS0?=
 =?iso-8859-1?Q?r1nhTq7gG5X6qaOW/IViFhbvL3sFSlrC+uKsfafE7KOCNOvrr2uyTFzpJZ?=
 =?iso-8859-1?Q?ozqqVQEYgIZ0OVAOURycQtIu44vikVgpGUQYTJDf/nxgfBIDocHtwEcQKD?=
 =?iso-8859-1?Q?4A147g9AWK6ZImIqEvnHMyu2xPdcwr8j83cErRVHd7RHMOWCPPM821OMlR?=
 =?iso-8859-1?Q?hrxU5a13MT0MUSLywFEVV9drX2SsnmsGwDihWL4+7fYasOSYJ6Czk6Eifv?=
 =?iso-8859-1?Q?p+4IgiyY2wPssjEKyKjYSW8NVwiDVObMlxv8FWWrQgkuwSSh2lIvGdUAxD?=
 =?iso-8859-1?Q?1DAN/mYRIFnWiC0SzM/TpPfBr4xYyb7WzzSCGBoHob2GIFhqzE0+dOoIvQ?=
 =?iso-8859-1?Q?ZDNSmvPHOxG9QXf1TNtL6+Ae0pGyqDL/AMV6bGHyKIKKUxsVhXhF+ygH+x?=
 =?iso-8859-1?Q?LlYfHfyQc5gT/zgmfgF6kBbJBo38u80KfQE8jRIFfluaMKt6Mkessx7dkH?=
 =?iso-8859-1?Q?iQLlZK6m5/9PBtB3H1zp0HmtCsaZIYp1XxRYJIyZhj30L3bm+buKI3cKhS?=
 =?iso-8859-1?Q?62/G1cLsnE1vN9yrUF7nP06YlaZW2+8TKPe51oldBg5l1AcJ4kRpe5CR/M?=
 =?iso-8859-1?Q?ikaWCDNj0q3BqGiKTgQZ/7GScRipvxvUjZjgSoKhB4UoTdOyMMl8ihyKfl?=
 =?iso-8859-1?Q?rdsL6kFI3iqGlZ6VZRZmjJmM7ckkl+kaXOcUeVJZimJ6oeEU6XMvyGQ2Ay?=
 =?iso-8859-1?Q?4qVHIOct33vB0gFNPq1U6sA9HhpXnkEzuuUSM/92o7kijwWfte06TXx3Nz?=
 =?iso-8859-1?Q?pfPvrF874qR59h8v+dFWBPZBaO5Yd1rc9oiU7a/5Bmcijp0ymmsh2FY/n+?=
 =?iso-8859-1?Q?NaWnq07JlC5tTUSWBsPno2ODF9K/P7oshnNF2C6ly5asE5lmG6v17csfCQ?=
 =?iso-8859-1?Q?ky6pOpmPwOHxhwJc2mw1lQyARHKkThfyNEMcGRrImzrOxDkkeO7hJxMwTn?=
 =?iso-8859-1?Q?flFgQAMj37Sc9cQGRZbAEb6qop0NudoRqBU03IsZqEOHZGbN23pQpVWeQd?=
 =?iso-8859-1?Q?Mkt8ZG+SJzB5bb1fv7MIwmAC15qWCzgUEth8FWSkIt47IvtOv8Ub5h8YRP?=
 =?iso-8859-1?Q?Kk54+0gtXsytOtLV/rX4/UUgf791irE7ghNcU05nEHEk8TZKULNKk5/dUt?=
 =?iso-8859-1?Q?jvmAkSPdzjenrooZuiRBQNraGyXE99bSq7/1qPbI0elTuH7AEcXg4EhMLR?=
 =?iso-8859-1?Q?I3nTtT9ltsRwXDpHMoUJIot2gpX4Ei5M8c0Q+2QsORuYFX+TSIVp03IhS4?=
 =?iso-8859-1?Q?iDCtCA67XNx+MW/68m+qozCbH3f1UcE8+hy/qGf5tV2tpU8+PxD3hXIPZ7?=
 =?iso-8859-1?Q?g4iHnXEdXroKZOBttzGCENIGriimUaJlXf5z6e+YQZ+ezn7wdGHiEDH466?=
 =?iso-8859-1?Q?W6iCMt4RcekjF1kXrC9taa/YYsy3Q3EuAGy8irtq0B3sut/ZvaBpAVArvz?=
 =?iso-8859-1?Q?a7VusTjwYcQUfEbrlHmI9WnFXtH8YfcHFWe+pzzQwsRKSnuA4jpolmQh+h?=
 =?iso-8859-1?Q?l0ViU0zLs6zZBwZqIIEU5YJkN9qGQm/uvmUQe9GdHMMqDpFaKDugUqnw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bb02e89-0dda-417d-b07a-08db983f55b3
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 18:43:19.5223 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +eZIb5ei7VstIcI2OzG3ZtzToOdlBAILQwfPTKXZR5YuHV7m+2uNByYttQzeZ1wd7G4/hAW9E1OMXXac7eiCmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7803
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/3] drm/xe: Introduce XeLink device
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
Cc: lucas.demarchi@intel.com, john.fleck@intel.com, matthew.d.roper@intel.com,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Aug 08, 2023 at 12:45:33PM -0400, David Kershner wrote:
> Add XeLink support for PVC devices.
> 
> Introduce the initial platform data structure that will be shared
> between the Xe driver and the XeLink driver.
> 
> If the device is PVC, and there is an XeLink device present, add
> and initialize an Auxbus device with the appropriate resources.
> 
> Add the XeLink information register.
> 
> Add package address register for defining the Device Physical Address
> space (DPA).
> 
> Add initial interrupt support.
> 
> The package address register defines the device physical
> address (DPA) space for the given device.
> 
> Using the "unique" xa_array index, generate a DPA address
> for the device and program the package register appropriately.
> 
> Update the LMEM offset to use the DPA address.
> 
> Signed-off-by: David Kershner <david.kershner@intel.com>
> ---
>  drivers/gpu/drm/xe/Kconfig           |   1 +
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h |  20 ++
>  drivers/gpu/drm/xe/xe_device.c       |  13 +-
>  drivers/gpu/drm/xe/xe_device_types.h |  27 ++
>  drivers/gpu/drm/xe/xe_gt_types.h     |   2 +
>  drivers/gpu/drm/xe/xe_irq.c          |  28 +-
>  drivers/gpu/drm/xe/xe_mmio.c         |   2 +-
>  drivers/gpu/drm/xe/xe_pci.c          |   2 +
>  drivers/gpu/drm/xe/xe_pci_types.h    |   1 +
>  drivers/gpu/drm/xe/xe_xelink.c       | 447 +++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_xelink.h       |  36 +++
>  include/drm/intel_xelink_platform.h  | 140 +++++++++
>  12 files changed, 716 insertions(+), 3 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_xelink.h
>  create mode 100644 include/drm/intel_xelink_platform.h
> 
> diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
> index 0a4ea965645b..9d396ca7708a 100644
> --- a/drivers/gpu/drm/xe/Kconfig
> +++ b/drivers/gpu/drm/xe/Kconfig
> @@ -36,6 +36,7 @@ config DRM_XE
>  	select DRM_SCHED
>  	select MMU_NOTIFIER
>  	select WANT_DEV_COREDUMP
> +	select AUXILIARY_BUS
>  	help
>  	  Experimental driver for Intel Xe series GPUs
>  
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index d654f3311351..fa78cbcd1058 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -81,6 +81,11 @@
>  #define GLOBAL_MOCS(i)				XE_REG(0x4000 + (i) * 4) /* Global MOCS regs */
>  #define GFX_CCS_AUX_NV				XE_REG(0x4208)
>  
> +#define PKG_ADDR_RANGE				XE_REG(0x41B0)
> +#define   PKG_ADDR_RANGE_RANGE_SHIFT		20
> +#define   PKG_ADDR_RANGE_BASE_SHIFT		1
> +#define   PKG_ADDR_RANGE_ENABLE			1
> +
>  #define VD0_AUX_NV				XE_REG(0x4218)
>  #define VE0_AUX_NV				XE_REG(0x4238)
>  
> @@ -88,6 +93,11 @@
>  #define   AUX_INV				REG_BIT(0)
>  
>  #define XEHP_TILE_ADDR_RANGE(_idx)		XE_REG_MCR(0x4900 + (_idx) * 4)
> +#define   XEHP_TILE_LMEM_RANGE_SHIFT            8
> +#define   XEHP_TILE_LMEM_BASE_SHIFT             1
> +#define   XEHP_TILE_LMEM_BASE_MASK              REG_GENMASK(7, 1)
> +#define   XEHP_TILE_LMEM_RANGE_MASK             REG_GENMASK(14, 8)
> +
>  #define XEHP_FLAT_CCS_BASE_ADDR			XE_REG_MCR(0x4910)
>  
>  #define CHICKEN_RASTER_1			XE_REG_MCR(0x6204, XE_REG_OPTION_MASKED)
> @@ -349,6 +359,11 @@
>  #define RCU_MODE				XE_REG(0x14800, XE_REG_OPTION_MASKED)
>  #define   RCU_MODE_CCS_ENABLE			REG_BIT(0)
>  
> +#define PKG_ADDR_BASE				XE_REG(0x108390)
> +#define   PKG_ADDR_BASE_RANGE_SHIFT		20
> +#define   PKG_ADDR_BASE_BASE_SHIFT		1
> +#define   PKG_ADDR_BASE_ENABLE			1
> +
>  #define FORCEWAKE_ACK_GT			XE_REG(0x130044)
>  #define   FORCEWAKE_KERNEL			BIT(0)
>  #define   FORCEWAKE_USER			BIT(1)
> @@ -397,4 +412,9 @@
>  #define XEHPC_BCS5_BCS6_INTR_MASK		XE_REG(0x190118)
>  #define XEHPC_BCS7_BCS8_INTR_MASK		XE_REG(0x19011c)
>  
> +#define PUNIT_MMIO_CR_POC_STRAPS		XE_REG(0x281078)
> +#define NUM_TILES_MASK				REG_GENMASK(1, 0)
> +#define CD_ALIVE				REG_BIT(2)
> +#define SOCKET_ID_MASK				REG_GENMASK(7, 3)
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 766df07de979..296953b7d512 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: MIT
>  /*
> - * Copyright © 2021 Intel Corporation
> + * Copyright © 2021 - 2023 Intel Corporation

we should probably do a fixup patch on the original files changing everything to 2023...

>   */
>  
>  #include "xe_device.h"
> @@ -34,6 +34,7 @@
>  #include "xe_vm.h"
>  #include "xe_vm_madvise.h"
>  #include "xe_wait_user_fence.h"
> +#include "xe_xelink.h"
>  
>  #ifdef CONFIG_LOCKDEP
>  struct lockdep_map xe_device_mem_access_lockdep_map = {
> @@ -262,6 +263,8 @@ int xe_device_probe(struct xe_device *xe)
>  	if (err)
>  		return err;
>  
> +	xe_xelink_init_early(xe);
> +
>  	for_each_tile(tile, xe, id) {
>  		err = xe_tile_alloc(tile);
>  		if (err)
> @@ -272,6 +275,8 @@ int xe_device_probe(struct xe_device *xe)
>  	if (err)
>  		return err;
>  
> +	xe_xelink_init_mmio(xe);
> +
>  	for_each_gt(gt, xe, id) {
>  		err = xe_pcode_probe(gt);
>  		if (err)
> @@ -292,6 +297,8 @@ int xe_device_probe(struct xe_device *xe)
>  			goto err_irq_shutdown;
>  	}
>  
> +	xe_xelink_init(xe);
> +
>  	err = xe_mmio_probe_vram(xe);
>  	if (err)
>  		goto err_irq_shutdown;
> @@ -333,6 +340,8 @@ int xe_device_probe(struct xe_device *xe)
>  
>  	xe_display_register(xe);
>  
> +	xe_xelink_init_aux(xe);
> +
>  	xe_debugfs_register(xe);
>  
>  	err = drmm_add_action_or_reset(&xe->drm, xe_device_sanitize, xe);
> @@ -365,6 +374,8 @@ void xe_device_remove(struct xe_device *xe)
>  
>  	xe_display_unlink(xe);
>  
> +	xe_xelink_remove(xe);
> +
>  	xe_irq_shutdown(xe);
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index f84ecb976f5d..7b27a5178aca 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -16,6 +16,7 @@
>  #include "xe_gt_types.h"
>  #include "xe_platform_types.h"
>  #include "xe_step_types.h"
> +#include "xe_xelink.h"
>  
>  #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
>  #include "ext/intel_device_info.h"
> @@ -219,6 +220,10 @@ struct xe_device {
>  		u8 has_asid:1;
>  		/** @force_execlist: Forced execlist submission */
>  		u8 force_execlist:1;
> +		/** @has_xelink: Has XeLink */
> +		u8 has_xelink:1;
> +		/** @enable_guc: GuC submission enabled */
> +		u8 enable_guc:1;
>  		/** @has_flat_ccs: Whether flat CCS metadata is used */
>  		u8 has_flat_ccs:1;
>  		/** @has_4tile: Whether tile-4 tiling is supported */
> @@ -376,6 +381,28 @@ struct xe_device {
>  	 */
>  	struct task_struct *pm_callback_task;
>  
> +	/** @intel_xelink: XeLink information, for those gpus with XeLink connectivity */
> +	struct {
> +		/** @ops: shared interface operations */
> +		const struct xelink_ops *ops;
> +		/** @handle: XeLink device handle */
> +		void *handle;
> +		/** @pd: platform data needed for auxiliary bus */
> +		struct xelink_pdata *pd;
> +		/** @dpa: base device physical address */
> +		u64 dpa;
> +		/** @irq_base: base IRQ for multi tile devices */
> +		int irq_base;
> +		/** @index: internal index for xe devices */
> +		int index;
> +		/** @xelink_id: XeLink id generated by the XeLink device */
> +		u32 xelink_id;
> +		/** @socket_id: socket from certain platforms */
> +		u8 socket_id;
> +		/* @present: Reflect PUNIT presence information */
> +		bool present;
> +	} intel_xelink;
> +
>  	/* private: */
>  
>  #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index 35b8c19fa8bf..e9e551fea95b 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -346,6 +346,8 @@ struct xe_gt {
>  		/** @oob: bitmap with active OOB workaroudns */
>  		unsigned long *oob;
>  	} wa_active;
> +	/** @xelink_irq: IRQ value assigned to the ANR HW */
> +	int xelink_irq;
>  };
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> index 2022a5643e01..aaf9569426cc 100644
> --- a/drivers/gpu/drm/xe/xe_irq.c
> +++ b/drivers/gpu/drm/xe/xe_irq.c
> @@ -1,10 +1,11 @@
>  // SPDX-License-Identifier: MIT
>  /*
> - * Copyright © 2021 Intel Corporation
> + * Copyright © 2021 - 2023 Intel Corporation
>   */
>  
>  #include "xe_irq.h"
>  
> +#include <linux/irq.h>
>  #include <linux/sched/clock.h>
>  
>  #include <drm/drm_managed.h>
> @@ -27,6 +28,15 @@
>  #define IIR(offset)				XE_REG(offset + 0x8)
>  #define IER(offset)				XE_REG(offset + 0xc)
>  
> +/* Define the BAR and offset for XeLink CSRs */
> +#define XE_XELINK_IRQ BIT(8)
> +#define CD_BASE_OFFSET 0x291000
> +#define CD_BAR_SIZE (256 * 1024)
> +
> +#define CPORT_MBDB_CSRS				XE_REG(CD_BASE_OFFSET + 0x6000)
> +#define CPORT_MBDB_CSRS_END			XE_REG(CD_BASE_OFFSET + 0x1000)
> +#define CPORT_MBDB_INT_ENABLE_MASK		XE_REG(CD_BASE_OFFSET + 0x8)
> +
>  static void assert_iir_is_zero(struct xe_gt *mmio, struct xe_reg reg)
>  {
>  	u32 val = xe_mmio_read32(mmio, reg);
> @@ -362,6 +372,18 @@ static void dg1_intr_enable(struct xe_device *xe, bool stall)
>  		xe_mmio_read32(mmio, DG1_MSTR_TILE_INTR);
>  }
>  
> +/*
> + * xelink_irq_handler - handle XeLink IRQs
> + *
> + * PVC can have an XeLink attached.  Handle the IRQs that are sourced by
> + * the device supporting the XeLink.
> + */
> +static void xelink_irq_handler(struct xe_gt *gt, const u32 master_ctl)
> +{
> +	if (master_ctl & XE_XELINK_IRQ)
> +		generic_handle_irq(gt->xelink_irq);
> +}
> +
>  /*
>   * Top-level interrupt handler for Xe_LP+ and beyond.  These platforms have
>   * a "master tile" interrupt register which must be consulted before the
> @@ -423,6 +445,7 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
>  			xe_display_irq_handler(xe, master_ctl);
>  			gu_misc_iir = gu_misc_irq_ack(xe, master_ctl);
>  		}
> +		xelink_irq_handler(mmio, master_ctl);
>  	}
>  
>  	dg1_intr_enable(xe, false);
> @@ -469,6 +492,9 @@ static void gt_irq_reset(struct xe_tile *tile)
>  	xe_mmio_write32(mmio, GPM_WGBOXPERF_INTR_MASK,  ~0);
>  	xe_mmio_write32(mmio, GUC_SG_INTR_ENABLE,	 0);
>  	xe_mmio_write32(mmio, GUC_SG_INTR_MASK,		~0);
> +
> +	if (tile->xe->intel_xelink.present)
> +		xe_mmio_write64(mmio, CPORT_MBDB_INT_ENABLE_MASK, 0);
>  }
>  
>  static void xelp_irq_reset(struct xe_tile *tile)
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index aa9c573b1243..1b0184135d45 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -173,7 +173,7 @@ static int xe_determine_lmem_bar_size(struct xe_device *xe)
>  	if (!xe->mem.vram.io_size)
>  		return -EIO;
>  
> -	xe->mem.vram.base = 0; /* DPA offset */
> +	xe->mem.vram.base = xe->intel_xelink.dpa;
>  
>  	/* set up a map to the total memory area. */
>  	xe->mem.vram.mapping = ioremap_wc(xe->mem.vram.io_start, xe->mem.vram.io_size);
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 46e3a9632efe..a2258524c577 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -162,6 +162,7 @@ static const struct xe_graphics_desc graphics_xehpc = {
>  
>  	.has_asid = 1,
>  	.has_flat_ccs = 0,
> +	.has_xelink = 1,
>  	.has_link_copy_engine = 1,
>  	.supports_usm = 1,
>  };
> @@ -563,6 +564,7 @@ static int xe_info_init(struct xe_device *xe,
>  	xe->info.vm_max_level = graphics_desc->vm_max_level;
>  	xe->info.supports_usm = graphics_desc->supports_usm;
>  	xe->info.has_asid = graphics_desc->has_asid;
> +	xe->info.has_xelink = graphics_desc->has_xelink;
>  	xe->info.has_flat_ccs = graphics_desc->has_flat_ccs;
>  	xe->info.has_range_tlb_invalidation = graphics_desc->has_range_tlb_invalidation;
>  	xe->info.has_link_copy_engine = graphics_desc->has_link_copy_engine;
> diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
> index ba31b933eb8e..85fec0c9e638 100644
> --- a/drivers/gpu/drm/xe/xe_pci_types.h
> +++ b/drivers/gpu/drm/xe/xe_pci_types.h
> @@ -22,6 +22,7 @@ struct xe_graphics_desc {
>  	u8 max_remote_tiles:2;
>  
>  	u8 has_asid:1;
> +	u8 has_xelink:1;
>  	u8 has_flat_ccs:1;
>  	u8 has_link_copy_engine:1;
>  	u8 has_range_tlb_invalidation:1;
> diff --git a/drivers/gpu/drm/xe/xe_xelink.c b/drivers/gpu/drm/xe/xe_xelink.c
> index 51a31f6a4740..ac4cff76f81d 100644
> --- a/drivers/gpu/drm/xe/xe_xelink.c
> +++ b/drivers/gpu/drm/xe/xe_xelink.c
> @@ -3,7 +3,20 @@
>   * Copyright © 2023 Intel Corporation
>   */
>  
> +#include <linux/auxiliary_bus.h>
> +#include <linux/firmware.h>
> +#include <linux/irq.h>
>  #include <linux/moduleparam.h>
> +#include <linux/xarray.h>
> +
> +#include <drm/intel_xelink_platform.h>
> +
> +#include "xe_device.h"
> +#include "xe_mmio.h"
> +#include "xe_gt_mcr.h"
> +#include "xe_xelink.h"
> +#include "regs/xe_reg_defs.h"
> +#include "regs/xe_gt_regs.h"
>  
>  /*
>   * This module parameter is needed because SRIOV PF and XeLink are mutually
> @@ -15,3 +28,437 @@
>  static bool xe_enable_xelink = true;
>  module_param_named(enable_xelink, xe_enable_xelink, bool, 0400);
>  MODULE_PARM_DESC(enable_xelink, "Enable XeLink feature (default: true)");
> +
> +#define HAS_XELINK(xe) ((xe)->info.has_xelink)
> +/* Define the BAR and offset for the XeLink CSRs */
> +#define GTTMMADR_BAR 0
> +#define CD_BASE_OFFSET 0x291000
> +#define CD_BAR_SIZE (256 * 1024)
> +
> +/* Xarray of XeLink devices */
> +static DEFINE_XARRAY_ALLOC(intel_fdevs);
> +
> +static struct query_info *default_query(void *handle, u32 xelink_id)
> +{
> +	return ERR_PTR(-EOPNOTSUPP);
> +}
> +
> +static int default_handle_event(void *handle, enum xelink_parent_event event)
> +{
> +	return -EOPNOTSUPP;
> +}
> +
> +static const struct xelink_ops default_ops = {
> +	.connectivity_query = default_query,
> +	.parent_event = default_handle_event,
> +};
> +
> +static int register_dev(void *parent, void *handle, u32 xelink_id,
> +			const struct xelink_ops *ops)
> +{
> +	struct xe_device *xe = parent;
> +
> +	WARN(xe->intel_xelink.ops != &default_ops, "XeLink: already registered");
> +
> +	xe->intel_xelink.handle = handle;
> +	xe->intel_xelink.xelink_id = xelink_id;
> +	xe->intel_xelink.ops = ops;
> +
> +	drm_info(&xe->drm, "XeLink: registered: 0x%x\n", xelink_id);
> +
> +	return 0;
> +}
> +
> +static void unregister_dev(void *parent, const void *handle)
> +{
> +	struct xe_device *xe = parent;
> +
> +	WARN(xe->intel_xelink.handle != handle, "XeLink: invalid handle");
> +
> +	drm_info(&xe->drm, "XeLink: unregistered: 0x%x\n",
> +		 xe->intel_xelink.xelink_id);
> +	xe->intel_xelink.handle = NULL;
> +	xe->intel_xelink.ops = &default_ops;
> +}
> +
> +static int dev_event(void *parent, void *handle, enum xelink_dev_event event,
> +		     void *event_data)
> +{
> +	return 0;
> +}
> +
> +/**
> + * init_pd - Allocate and initialize platform specific data
> + * @xe: Valid xe instance
> + *
> + * Return:
> + * * pd - initialized xelink_pdata,
> + * * NULL - Allocation failure
> + */
> +static struct xelink_pdata *init_pd(struct xe_device *xe)
> +{
> +	struct xelink_pdata *pd;
> +	u32 reg;
> +
> +	pd = kzalloc(sizeof(*pd), GFP_KERNEL);
> +	if (!pd)
> +		return NULL;
> +
> +	pd->version = XELINK_VERSION;
> +	pd->parent = xe;
> +	pd->product = XELINK_PONTEVECCHIO;
> +	pd->index = xe->intel_xelink.index & 0xFFFF;
> +	pd->sd_cnt = xe->info.tile_count;
> +	pd->socket_id = xe->intel_xelink.socket_id;
> +	pd->slot = PCI_SLOT(to_pci_dev(xe->drm.dev)->devfn);
> +
> +	pd->resources = NULL;
> +	pd->num_resources = 0;
> +	pd->register_dev = register_dev;
> +	pd->unregister_dev = unregister_dev;
> +	pd->dev_event = dev_event;
> +
> +	/*
> +	 * Calculate the actual DPA offset and size (in GB) for the device.
> +	 * Each tile will have the same amount of memory, so we only need to
> +	 * read the first one.
> +	 */
> +	reg = xe_gt_mcr_unicast_read_any(xe_device_get_root_tile(xe)->primary_gt,
> +					 XEHP_TILE_ADDR_RANGE(0)) & XEHP_TILE_LMEM_RANGE_MASK;
> +
> +	// TILE0 is < 8Gb, PVC needs 8GB, so fake it.
> +	if (reg >> XEHP_TILE_LMEM_RANGE_SHIFT < 8) {
> +		drm_err(&xe->drm, "XEHP_TILE0_ADDR_RANGE: %x\n", reg);
> +		reg = 8 << XEHP_TILE_LMEM_RANGE_SHIFT;
> +	}
> +	pd->dpa.pkg_offset = (u32)xe->intel_xelink.index * MAX_DPA_SIZE;
> +	pd->dpa.pkg_size = (reg >> XEHP_TILE_LMEM_RANGE_SHIFT) * pd->sd_cnt;
> +
> +	return pd;
> +}
> +
> +/**
> + * init_resource - Create the resource array, and apply the appropriate data
> + * @xe: valid xe instance
> + * @res_cnt: pointer to return number of allocated resources
> + *
> + * First resource [0] is for the IRQ(s).  Each device gets 1 IRQ. Subsequent
> + * resources describe the IO memory space for the device(s).
> + *
> + * Make sure to set the gt->xelink_irq value.
> + *
> + * Return:
> + * * res - Initialized resource array
> + * * NULL - Allocaction failure
> + */
> +static struct resource *init_resource(struct xe_device *xe,
> +				      u32 *res_cnt)
> +{
> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> +	struct xe_gt *gt;
> +	struct resource *res_base, *res;
> +	u32 cnt = xe->info.tile_count * 2;
> +	unsigned int i;
> +
> +	/* Each sd gets one resource for IRQ and one for MEM */
> +	res_base = kcalloc(cnt, sizeof(*res_base), GFP_KERNEL);
> +	if (!res_base)
> +		return NULL;
> +
> +	res = res_base;
> +	for_each_gt(gt, xe, i) {
> +		res->start = xe->intel_xelink.irq_base + i;
> +		res->end = xe->intel_xelink.irq_base + i;
> +		res->flags = IORESOURCE_IRQ;
> +		res++;
> +
> +		res->start = pci_resource_start(pdev, GTTMMADR_BAR) + CD_BASE_OFFSET +
> +			     i * gt_to_tile(gt)->mmio.size;
> +		res->end = res->start + CD_BAR_SIZE - 1;
> +		res->flags = IORESOURCE_MEM;
> +		drm_info(&xe->drm, "XeLink: mem_resource = %pR\n", res);
> +		res++;
> +		gt->xelink_irq = xe->intel_xelink.irq_base + i;
> +	}
> +
> +	*res_cnt = cnt;
> +	return res_base;
> +}
> +
> +/**
> + * xelink_irq_mask - Null callback.  Masking/unmasking happens in the parent
> + * driver
> + * @d: Valid irq_data information
> + */
> +static void xelink_irq_mask(struct irq_data *d)
> +{
> +}
> +
> +static void xelink_irq_unmask(struct irq_data *d)
> +{
> +}
> +
> +static struct irq_chip xelink_irq_chip = {
> +	.name = "xelink_irq_chip",
> +	.irq_mask = xelink_irq_mask,
> +	.irq_unmask = xelink_irq_unmask,
> +};
> +
> +/**
> + * init_irq_desc - Allocate IRQ descriptors to use for the xelink
> + * @xe: Valid xe instance
> + *
> + * Allocate the required IRQ descriptor(s) and initialize the
> + * appropriate state.
> + *
> + * Return:
> + * * 0 - Success
> + * * errno - Error that occurred
> + */
> +static int init_irq_desc(struct xe_device *xe)
> +{
> +	unsigned int num_subdevs = xe->info.tile_count;
> +	int err;
> +	int irq;
> +	int irq_base;
> +
> +	irq_base = irq_alloc_descs(-1, 0, num_subdevs, 0);
> +	if (irq_base < 0) {
> +		err = irq_base;
> +		goto cleanup;
> +	}
> +
> +	err = 0;
> +	for (irq = irq_base; !err && irq < irq_base + num_subdevs; irq++) {
> +		irq_set_chip_and_handler_name(irq, &xelink_irq_chip,
> +					      handle_simple_irq,
> +					      "xelink_irq_handler");
> +		err = irq_set_chip_data(irq, xe);
> +	}
> +
> +	if (err) {
> +		irq_free_descs(irq_base, num_subdevs);
> +		goto cleanup;
> +	}
> +
> +	drm_info(&xe->drm, "XeLink: IRQ base: %d  cnt: %d\n", irq_base,
> +		 num_subdevs);
> +
> +	xe->intel_xelink.irq_base = irq_base;
> +
> +	return 0;
> +
> +cleanup:
> +	xe->intel_xelink.index = err;
> +	drm_err(&xe->drm, "XeLink: Failed to allocate IRQ data: %d\n", err);
> +	return err;
> +}
> +
> +/**
> + * xe_xelink_init_early - Set the XeLink info to the defaults
> + * @xe: valid xe instance
> + *
> + * index is set to ENODEV to show that, by default, there is no device.
> + * If any of the initialization steps fail, it will be set to the appropriate
> + * errno value.
> + */
> +void xe_xelink_init_early(struct xe_device *xe)
> +{
> +	xe->intel_xelink.ops = &default_ops;
> +	xe->intel_xelink.index = -ENODEV;
> +}
> +
> +/**
> + * xe_xelink_init_mmio - check if XeLink is available via MMIO
> + * @xe: valid xe instance
> + *
> + * Read the relevant regs to check for XeLink availability and get the socket id
> + */
> +void xe_xelink_init_mmio(struct xe_device *xe)
> +{
> +	u32 xelink_info;
> +
> +	if (!HAS_XELINK(xe) || !xe_enable_xelink)
> +		return;
> +
> +	xelink_info = xe_mmio_read32(xe_device_get_root_tile(xe)->primary_gt,
> +				     PUNIT_MMIO_CR_POC_STRAPS);
> +
> +	xe->intel_xelink.socket_id = REG_FIELD_GET(SOCKET_ID_MASK, xelink_info);
> +
> +	if (REG_FIELD_GET(CD_ALIVE, xelink_info)) {
> +		drm_info(&xe->drm, "XeLink available\n");
> +		xe->intel_xelink.present = true;
> +	}
> +}
> +
> +/**
> + * xe_xelink_init - Allocate device index and complete initial HW setup
> + * @xe: valid device instance
> + *
> + * NOTE: index is zero inited.  If the XeLink is not present, or an error occurs
> + * during setup, this must be 0 for the range registers.
> + *
> + */
> +void xe_xelink_init(struct xe_device *xe)
> +{
> +	struct xe_gt *gt;
> +	static u32 last_id;
> +	unsigned int i;
> +	u32 index = 0;
> +	u32 range;
> +	u32 base;
> +	int err;
> +
> +	if (!HAS_XELINK(xe))
> +		return;
> +
> +	if (!xe->intel_xelink.present)
> +		goto set_range;
> +
> +	err = init_irq_desc(xe);
> +	if (err) {
> +		xe->intel_xelink.index = err;
> +		goto set_range;
> +	}
> +
> +	/*
> +	 * Try the socket id first.  Systems with this feature, will
> +	 * get a deterministic value.  If not, try with the cyclic.
> +	 */
> +	err = xa_insert(&intel_fdevs, xe->intel_xelink.socket_id, xe,
> +			GFP_KERNEL);
> +	if (!err)
> +		index = xe->intel_xelink.socket_id;
> +
> +	/* socket_id is not available */
> +	if (err == -EBUSY) {
> +		/*
> +		 * NOTE: index is only updated on success i.e. >= 0
> +		 * < 0 err, 0 ok, > 0 wrapped
> +		 */
> +		err = xa_alloc_cyclic(&intel_fdevs, &index, xe,
> +				      XA_LIMIT(0, MAX_DEVICE_COUNT - 1),
> +				      &last_id, GFP_KERNEL);
> +	}
> +	if (err < 0) {
> +		index = 0;
> +		xe->intel_xelink.index = err;
> +		drm_err(&xe->drm,
> +			"XeLink: Failed to allocate index: %d\n",
> +			err);
> +		irq_free_descs(xe->intel_xelink.irq_base,
> +			       xe->info.tile_count);
> +		goto set_range;
> +	}
> +	xe->intel_xelink.index = index;
> +	xe->intel_xelink.dpa = (u64)index * MAX_DPA_SIZE * SZ_1G;
> +	drm_info(&xe->drm, "XeLink: [dpa 0x%llx-0x%llx\n", xe->intel_xelink.dpa,
> +		 ((u64)index + 1) * MAX_DPA_SIZE * SZ_1G - 1);
> +
> +	/*
> +	 * Set range has to be done for all devices that support device
> +	 * address space, regardless of presence or error.
> +	 */
> +set_range:
> +	/* Set GAM address range registers */
> +	range = index * MAX_DPA_SIZE << PKG_ADDR_RANGE_BASE_SHIFT;
> +	range |= MAX_DPA_SIZE << PKG_ADDR_RANGE_RANGE_SHIFT;
> +	range |= PKG_ADDR_RANGE_ENABLE;
> +
> +	/* set SGunit address range register */
> +	base = index * MAX_DPA_SIZE << PKG_ADDR_BASE_BASE_SHIFT;
> +	base |= MAX_DPA_SIZE << PKG_ADDR_BASE_RANGE_SHIFT;
> +	base |= PKG_ADDR_BASE_ENABLE;
> +
> +	/* Needs to be set for each gt */
> +	for_each_gt(gt, xe, i) {
> +		xe_mmio_write32(gt, PKG_ADDR_RANGE, range);
> +		xe_mmio_write32(gt, PKG_ADDR_BASE, base);
> +	}
> +}
> +
> +static void xe_xelink_release_dev(struct device *dev)
> +{
> +	struct auxiliary_device *aux = to_auxiliary_dev(dev);
> +	struct xelink_pdata *pd = container_of(aux, struct xelink_pdata, aux_dev);
> +
> +	kfree(pd->resources);
> +	pd->resources = NULL;
> +
> +	kfree(pd);
> +}
> +
> +/**
> + * xe_xelink_init_aux - Initialize resources and add auxiliary bus interface
> + * @xe: valid xe instance
> + *
> + */
> +void xe_xelink_init_aux(struct xe_device *xe)
> +{
> +	struct device *dev = &to_pci_dev(xe->drm.dev)->dev;
> +	struct resource *res = NULL;
> +	struct xelink_pdata *pd;
> +	int err = -ENOMEM;
> +	u32 res_cnt;
> +
> +	if (!xe->intel_xelink.present)
> +		return;
> +
> +	if (xe->intel_xelink.index < 0) {
> +		err = xe->intel_xelink.index;
> +		goto fail;
> +	}
> +
> +	pd = init_pd(xe);
> +	if (!pd)
> +		goto cleanup;
> +
> +	res = init_resource(xe, &res_cnt);
> +	if (!res)
> +		goto cleanup;
> +
> +	pd->resources = res;
> +	pd->num_resources = res_cnt;
> +
> +	pd->aux_dev.name = "xelink";
> +	pd->aux_dev.id = pd->index;
> +	pd->aux_dev.dev.parent = dev;
> +	pd->aux_dev.dev.release = xe_xelink_release_dev;
> +
> +	err = auxiliary_device_init(&pd->aux_dev);
> +	if (err)
> +		goto cleanup;
> +
> +	err = auxiliary_device_add(&pd->aux_dev);
> +	if (err) {
> +		auxiliary_device_uninit(&pd->aux_dev);
> +		goto cleanup;
> +	}
> +
> +	xe->intel_xelink.pd = pd;
> +
> +	return;
> +
> +cleanup:
> +	xa_erase(&intel_fdevs, xe->intel_xelink.index);
> +	irq_free_descs(xe->intel_xelink.irq_base, xe->info.tile_count);
> +	kfree(res);
> +	kfree(pd);
> +	xe->intel_xelink.index = err;
> +fail:
> +	drm_err(&xe->drm, "XeLink: Failed to initialize err: %d\n", err);
> +}
> +
> +void xe_xelink_remove(struct xe_device *xe)
> +{
> +	if (xe->intel_xelink.index < 0)
> +		return;
> +
> +	auxiliary_device_delete(&xe->intel_xelink.pd->aux_dev);
> +	auxiliary_device_uninit(&xe->intel_xelink.pd->aux_dev);
> +	xa_erase(&intel_fdevs, xe->intel_xelink.index);
> +	irq_free_descs(xe->intel_xelink.irq_base, xe->info.tile_count);
> +
> +	xe->intel_xelink.ops = &default_ops;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_xelink.h b/drivers/gpu/drm/xe/xe_xelink.h
> new file mode 100644
> index 000000000000..e17faacc7b1c
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_xelink.h
> @@ -0,0 +1,36 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2019 - 2023 Intel Corporation
> + */
> +
> +#ifndef _XE_XELINK_H_
> +#define _XE_XELINK_H_
> +
> +/*
> + * Define the maximum number of devices instances based on the amount of
> + * FID space.
> + *
> + * XARRAY limits are "inclusive", but using this value as a range check
> + * outside of xarray, makes the exclusive upper bound a little easier to
> + * deal with.
> + *
> + * I.e.:
> + * [0 - 256)
> + *
> + * Less than HW supports, but more than will be currently possible.
> + *
> + */
> +#define MAX_DEVICE_COUNT 256
> +
> +/* Fixed Device Physical Address (DPA) size for a device/package (in GB) */
> +#define MAX_DPA_SIZE 128
> +
> +struct xe_device;
> +
> +void xe_xelink_init_early(struct xe_device *xe);
> +void xe_xelink_init_mmio(struct xe_device *xe);
> +void xe_xelink_init(struct xe_device *xe);
> +void xe_xelink_init_aux(struct xe_device *xe);
> +void xe_xelink_remove(struct xe_device *xe);
> +
> +#endif
> diff --git a/include/drm/intel_xelink_platform.h b/include/drm/intel_xelink_platform.h
> new file mode 100644
> index 000000000000..86eeb10fdc1e
> --- /dev/null
> +++ b/include/drm/intel_xelink_platform.h
> @@ -0,0 +1,140 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright(c) 2019 - 2023 Intel Corporation.
> + */
> +
> +#ifndef __INTEL_XELINK_PLATFORM_H
> +#define __INTEL_XELINK_PLATFORM_H
> +
> +#define XELINK_VERSION 1
> +
> +#include <linux/auxiliary_bus.h>
> +#include <linux/types.h>
> +
> +/**
> + * enum product_type - Product type identifying the parent
> + * @XELINK_UNDEFINED: no product type hints
> + * @XELINK_PONTEVECCHIO: parent is a PVC
> + * @XELINK_PRODUCTS: end of the list
> + *
> + */
> +enum product_type {
> +	XELINK_UNDEFINED,
> +	XELINK_PONTEVECCHIO,
> +	XELINK_PRODUCTS
> +};
> +
> +/**
> + * enum xelink_dev_event - events generated to the parent device
> + * @XELINK_DEV_REMOVE: Xelink device was removed
> + * @XELINK_DEV_ERROR: An error occurred
> + * @XELINK_DEV_EVENTS: end of list
> + *
> + * Connectivity events, possible errors, etc.
> + */
> +enum xelink_dev_event {
> +	XELINK_DEV_REMOVE,
> +	XELINK_DEV_EVENTS
> +};
> +
> +/**
> + * enum xelink_parent_event - Events generated by the parent device
> + * @XELINK_PARENT_PCIE_ERR: Parent had a PCI error
> + * @XELINK_PARENT_MAPPING_GET: Notify XeLink of buffer mapping
> + * @XELINK_PARENT_MAPPING_PUT: Notify XeLink of buffer unmapping
> + *
> + * These are examples.
> + */
> +enum xelink_parent_event {
> +	XELINK_PARENT_PCIE_ERR,
> +	XELINK_PARENT_MAPPING_GET,
> +	XELINK_PARENT_MAPPING_PUT,
> +};
> +
> +/**
> + * struct sd2sd_info - Subdevice to subdevice connectivity info
> + * @bandwidth: in Gbps units not factoring in width or quality degredation
> + * @latency: in 1/10 hops units
> + */
> +struct sd2sd_info {
> +	u16 bandwidth;
> +	u16 latency;
> +};
> +
> +/**
> + * struct query_info - connectivity query response information
> + * @src_cnt: Requester subdevice count
> + * @dst_cnt: Destination path count
> + * @sd2sd: array of src/dst bandwidth/latency information
> + *
> + * Query info will be a variably sized data structure allocated by the
> + * XeLink driver.  The access will be indexed by
> + *    (src_index * dst_cnt) + dst_index
> + *
> + * The caller will need to free the buffer when done.
> + */
> +struct query_info {
> +	u8 src_cnt;
> +	u8 dst_cnt;
> +	struct sd2sd_info sd2sd[];
> +};
> +
> +/**
> + * struct xelink_ops - Communication path from parent to XeLink instance
> + * @connectivity_query: Query a device for xelink_id connectivity
> + * @parent_event: Any events needed by the XeLink device
> + *
> + * connectivity_query() returns:
> + *   a populated query_info on success,
> + *   an ERR_PTR() on failure
> + *
> + */
> +struct xelink_ops {
> +	struct query_info *(*connectivity_query)(void *handle, u32 xelink_id);
> +	int (*parent_event)(void *handle, enum xelink_parent_event event);
> +};
> +
> +struct dpa_space {
> +	u32 pkg_offset;
> +	u16 pkg_size;
> +};
> +
> +/**
> + * struct xelink_pdata - Platform specific data that needs to be shared
> + * @version: PSD version information
> + * @parent: Handle to use when calling the parent device
> + * @product: a product hint for any necessary special case requirements
> + * @index: unique device index. This will be part of the device name
> + * @dpa: Device physical address offset and size
> + * @sd_cnt: parent subdevice count
> + * @socket_id: device socket information
> + * @slot: PCI/CXL slot number
> + * @aux_dev: Auxiliary bus device
> + * @resources: Array of resources (Assigned by Xe, the IRQ/MEM for the device)
> + * @num_resources: number of resources in resources array
> + * @register_dev: Register a XeLink instance and ops with the parent device
> + * @unregister_dev: Unregister a XeLink instance from the parent device
> + * @dev_event: Notify parent that an event has occurred
> + */
> +struct xelink_pdata {
> +	u16 version;
> +	void *parent;
> +	enum product_type product;
> +	u16 index;
> +	struct dpa_space dpa;
> +	u8 sd_cnt;
> +	u8 socket_id;
> +	u8 slot;
> +
> +	struct auxiliary_device aux_dev;
> +	struct resource *resources;
> +	u32 num_resources;
> +
> +	int (*register_dev)(void *parent, void *handle, u32 xelink_id,
> +			    const struct xelink_ops *ops);
> +	void (*unregister_dev)(void *parent, const void *handle);
> +	int (*dev_event)(void *parent, void *handle,
> +			 enum xelink_dev_event event, void *event_data);
> +};
> +
> +#endif /* __INTEL_XELINK_PLATFORM_H */
> -- 
> 2.35.1
> 

Everything else looks good to me. It would be good to get a deeper reviewer from
the Xelink team.

Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

