Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75948C41535
	for <intel-xe@archiver.kernel.org>; Fri, 15 Dec 2023 22:39:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38D7410EAB4;
	Fri, 15 Dec 2023 22:39:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEB4B10EAB4
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Dec 2023 22:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702679976; x=1734215976;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=T5f2CaJn1qVcipPYEQAUlVt7jJJH8mYHmwXaOQFg2k0=;
 b=KJ6SQToXEUSPbXWftQWzPPlDoO8mZro6D3sB5rw/ElKgroHzjpql7mlK
 Nm7qzUL3wedv1/cymC5NB7mEnfE2F89MSNvPUWILj6NWKQv0CEGdhk09F
 VtM6IbTKKRWqJDa3DNRt84i2dCj/9CP6DPkP6UtZ97nJ+TP6sYSJQOsbN
 xZ/k66EfeWJ1iqP6sK2Isin34dY+OmBYLssQZdsVAZ+1qzOegBLWcUKZo
 87mD1dbuKrM6cyyk0cfS4xg6MK//i1mHtgAs3g2cYs8CMWIWyYw7kZAE2
 a/rhxw/96NxnKLz0F4tWPC9sVFrV7rob5UXIHC6pUFWa7zei8NJUQpG8L w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="398124000"
X-IronPort-AV: E=Sophos;i="6.04,280,1695711600"; d="scan'208";a="398124000"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2023 14:39:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="774904909"
X-IronPort-AV: E=Sophos;i="6.04,280,1695711600"; d="scan'208";a="774904909"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Dec 2023 14:39:33 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 15 Dec 2023 14:39:33 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 15 Dec 2023 14:39:32 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 15 Dec 2023 14:39:32 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 15 Dec 2023 14:39:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I+VPNLKz3hrLFcc+DoU3fWjkG5cZBhJz5TozRSAAiyqxDJmvsJWwzySTdPM6cdU0EP1cG6XdRgVcNr4vJIQLRA4jJfd4pSpxTfMIoLWmP7Bodvz2MqttLsReyWtUl+RiBfVujc2JnnFm1qWVAULmeDiJiCqXbBwMqk2OHp8J6q7NBexk8xUWafcS/RW6upYi++0BAUWBJXbVAaIN26m9V7kBqB6QkNsWsZ1gP3Qs5X2H7r0lzVD1fzBcm2Tm/lp5mdxooCA8OVF8U+9xtnKadSs9f1i4E8WXtMSoeCVs7fTETH8BjaKoSzmCIEBn9Pj3jJbDOC0B3IBoBTUAa7gCdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HqMA/D6BcuT6wSVRZ6JC4ydaemb8g4+OUMccyapolt4=;
 b=HS5N2ytjFY4+/kCjcRbRfk3TcJx2dLrA5mXePt6tPjfqTBoCQUWRH3JVdqDpQGBEDuueHmKIehpPKRdRj/QCgGMHGU5aiKQTmmByC+JAI3mVaxwvDdN+JpfhtPJjbRCBNAliWG98YG6iKFQE9dX0oRwvgGMEsKfJnhSAbvPbt4NH9BhfdERjFz8uK9zYQ7Um7ReFtlvP2m0fIt5tf9BdJpGYlmK6Lg3PexnUiAh91kVF+UEf2Xc8LVPnMtXCttfiTRJCEjWgkujPoYeJ/f39ONsSni5Aii3Q5vqcBGbVfdP8XRx72VDfDUdCQ6ydPUso9eQyjOHI/UVXF6wcKofnjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SJ2PR11MB7455.namprd11.prod.outlook.com (2603:10b6:a03:4cd::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.28; Fri, 15 Dec
 2023 22:39:24 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0%7]) with mapi id 15.20.7091.032; Fri, 15 Dec 2023
 22:39:24 +0000
Date: Fri, 15 Dec 2023 14:39:22 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v2 07/10] drm/xe/vf: Introduce Memory Based Interrupts
 Handler
Message-ID: <20231215223922.GA1327160@mdroper-desk1.amr.corp.intel.com>
References: <20231214185955.1791-1-michal.wajdeczko@intel.com>
 <20231214185955.1791-8-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231214185955.1791-8-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BYAPR07CA0031.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::44) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SJ2PR11MB7455:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d8d854c-0787-4d52-0b98-08dbfdbeb01d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MRpQhxTCeJVGaEQCmsmHgCcHcBpbBCWJaFA4MLph0y9C24UhkF+UrEIMoGrv8Jjfu5bgBMOz85UFPhlEBDL8BeK7xoa6I98CCMVGUk4ueqwF0yrp4u9ZdptdRaPFs5oIpH0wj4aX+Ezwmt69K9jeUvXNel3oyb0ScvVTkJsk0ga2CgY/FUysAY9co7b1iD9nYkQ8nnM/+8/ub+muAoH+btRzdEmJAsZT6lZ5eo/HHPleyXmET8wUXPVQarmtQZiaLJ1OPoDTfT5Dq3h7tHr6Y6Wmc7zdOxGfqAR/kX/NNDJSbbqq0silKSNOKGmVIYVk8o+ggqKbQUe7B4Nc+JdJILM53Ic3zyCHgJY16v0BE3gD+/kDAqzfuKGebi4urE0A0Gn9MATmQxh4F0wZ7BGM2obQjv87karAvIk6cmF2cjD77NjtuSgIDuOzsylIn/JlUhuE5kmYPgawywZuLv/3c4xlDKy6fVdVGfWsmLNvOIavlSGgvELEwnU99qyoyjPcw2oa9NQhuGVPkn2iODl/thmbQoHcl2GFjZgjJWUIiNYZR3VRgQSJ0V43QuZtbbVDVANc3/TmeEyLPj+20lrYH6+YCxPcav2H/FR37Howkyo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(346002)(39860400002)(136003)(376002)(366004)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(26005)(1076003)(6512007)(316002)(83380400001)(5660300002)(4326008)(478600001)(8676002)(30864003)(2906002)(41300700001)(6862004)(6506007)(8936002)(6486002)(6636002)(66556008)(66946007)(66476007)(33656002)(82960400001)(86362001)(38100700002)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?WLbhVYDqRhAIdvuYDMz26/mMWF+AZ0U7GFAopo90oCqy/i2QzPevzIPLC8?=
 =?iso-8859-1?Q?pyBl+joE2Ivqt54J/SX//9U51cL+N11nwNowmf/fM3v7lkAesyS1mLbQWC?=
 =?iso-8859-1?Q?e5ufqPejocFIpA+jIWZsy8+M85nSk5MHqQzJz5/BpkitW12fjqW6BhpBA3?=
 =?iso-8859-1?Q?X1ZvTaIl/5y0dmMdm/pzVOQlKNGRl8xazEVKBMO4ZMUc/XSsXCfhWiu5aw?=
 =?iso-8859-1?Q?Fcc9i0GA1PoIIZEqysBOgE7bgfvRRxxTEG0TYvGEeGCVdFgyzW6aIXlkJ+?=
 =?iso-8859-1?Q?9Dt6F6WGyZL88duCRvjtL03FYyKXYnY7a/KUe1X8iyYFheVcHg0+ZOEUQL?=
 =?iso-8859-1?Q?SfODHllZJ36p8Zci3o7V32NMRfwHAvOyN49u9yVv3UONOwhAKv5hIga6qh?=
 =?iso-8859-1?Q?Btt0uRMVy1dkx42dssd7mL684at8JVEaZ04NWoRduhvzUEuCaUs1WJrZIY?=
 =?iso-8859-1?Q?SqYLhR1eWECr7Ic7TheSyxSCUrEj6kcdmmccRmlhuj9LZAPBZmgOxy6l/x?=
 =?iso-8859-1?Q?USkL1jOQuzO+1BxORJBXXzwpa3TMqT3LWsK0vPNbcEstqFuSBlIzivRJ8v?=
 =?iso-8859-1?Q?p7PMr77AYRK9UHzVC8xpH8eEDmtynRWiUc4KaDt+rM/gL+05009XVZuIun?=
 =?iso-8859-1?Q?vEa+aicFlOIFDjozfrKXAlM91wBsLxEAdWbiYQ3vjAfov2ud8gMAVAEvln?=
 =?iso-8859-1?Q?PHErXSOQddMdO6A+nX3vSallBxybg07Hbjk39Jxwee/yTVZ2k9Dv9bZLlE?=
 =?iso-8859-1?Q?2WiRKG/Fjq5x7LlRq8ETCJeYUGk2uu1MILIY2qqTbX4yz1DqKhfBLJZ0eM?=
 =?iso-8859-1?Q?Q8mt/8Ubc9Dec94w6zVDrvSkQ5yZRqwLj9SAAOd80iyTz/gzKzkpF5oLkE?=
 =?iso-8859-1?Q?mpt03sMMII8Qjxr0Jm7SUOfV61i4pChG+/L/gsb7og0esJKa1Fia2FM3V4?=
 =?iso-8859-1?Q?s565NiOTc89y8jqzipe6O1jci/En6UIa+IFNZIBbZ9cg3GDe9gfxto27j3?=
 =?iso-8859-1?Q?v2qd/kUg3mkQEmRhnKFgjNH7lpIg1ctDPy1a6mpxlyLuwl2j2AJONx118n?=
 =?iso-8859-1?Q?5C8LV+I47q5iCGN7X7qUe5BpllCi2mOSfM4LtZKP1O4aA88aQJSXIDQ7PC?=
 =?iso-8859-1?Q?J7Sr0SPnORfdJnnMBmNBBBxCFP/ll9DozoEMi8xDPlleTm+JyJG4oRK1/r?=
 =?iso-8859-1?Q?GwGu6ojhY9NPA32KDAGEzNv5aBfV+2pzkK6Lj7ukmMWVqIjQH58dfv5oBo?=
 =?iso-8859-1?Q?sUrIsMqhiKLpE5WW9BnvkTCC5/h6TEChXv52/otp/cSwLqg5WnNMj9h3RF?=
 =?iso-8859-1?Q?mCMjoQQx3sFDSZXZW0bUMRrAwQYzYDZIwBtmYyM2bX/FmGj9E1CgY8olRb?=
 =?iso-8859-1?Q?KyJ4MUgmpD61iFq/0yRD6kcGtvJEHOvjbAO/mwpQjsTKCqIKdiDnvcXCri?=
 =?iso-8859-1?Q?OjVPL/VlKtGDZe+TZxF/cVKDTbZd2ry3SRB79wxhzkj6E1lhZl4AYLGXlX?=
 =?iso-8859-1?Q?VNt+gU6oDrn/TRDNBZklSO/WmnasPoapy3B1868dCucagCzCmGuz3wUDP2?=
 =?iso-8859-1?Q?hSQRZFnI53hCHHe3TkbFyJdl/OzC0QXWzKlLC8TUvvIHKqhPqq+W2WtNAM?=
 =?iso-8859-1?Q?sPDha20QQheFSSbpcFkY5D8buabzVfrrf7HcnQaGqdirRrHdhmtxTa4g?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d8d854c-0787-4d52-0b98-08dbfdbeb01d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2023 22:39:24.4769 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Cy9A27YCbaXp+lCjnTeBf2iQOFILcgLzoLzzYnEuK53pdtM21imhKXiuPZNOT9gBuLv8c342SJkCLbQZU+VdjpdW2KhgOGkg3eB9DjxAgc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7455
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Dec 14, 2023 at 07:59:52PM +0100, Michal Wajdeczko wrote:
> The register based interrupts infrastructure does not scale
> efficiently to allow delivering interrupts to a large number
> of virtual machines. Memory based interrupt reporting provides
> an efficient and scalable infrastructure.
> 
> Define handler to read and dispatch memory based interrupts.
> We will use this handler in upcoming patch.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
> v2: force UC, use GRAPHICS_VERx100 instead flag (Matt)
> ---
>  drivers/gpu/drm/xe/Makefile          |   4 +-
>  drivers/gpu/drm/xe/xe_device.c       |   7 +
>  drivers/gpu/drm/xe/xe_device.h       |   5 +
>  drivers/gpu/drm/xe/xe_device_types.h |   5 +
>  drivers/gpu/drm/xe/xe_memirq.c       | 430 +++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_memirq.h       |  26 ++
>  drivers/gpu/drm/xe/xe_memirq_types.h |  37 +++
>  7 files changed, 513 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_memirq.c
>  create mode 100644 drivers/gpu/drm/xe/xe_memirq.h
>  create mode 100644 drivers/gpu/drm/xe/xe_memirq_types.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index f4ae063a7005..3be7ed101d7b 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -137,7 +137,9 @@ xe-y += xe_bb.o \
>  xe-$(CONFIG_HWMON) += xe_hwmon.o
>  
>  # graphics virtualization (SR-IOV) support
> -xe-y += xe_sriov.o
> +xe-y += \
> +	xe_memirq.o \
> +	xe_sriov.o
>  
>  xe-$(CONFIG_PCI_IOV) += \
>  	xe_lmtt.o \
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 221e87584352..746074066e08 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -29,12 +29,14 @@
>  #include "xe_gt.h"
>  #include "xe_gt_mcr.h"
>  #include "xe_irq.h"
> +#include "xe_memirq.h"
>  #include "xe_mmio.h"
>  #include "xe_module.h"
>  #include "xe_pat.h"
>  #include "xe_pcode.h"
>  #include "xe_pm.h"
>  #include "xe_query.h"
> +#include "xe_sriov.h"
>  #include "xe_tile.h"
>  #include "xe_ttm_stolen_mgr.h"
>  #include "xe_ttm_sys_mgr.h"
> @@ -456,6 +458,11 @@ int xe_device_probe(struct xe_device *xe)
>  		err = xe_ggtt_init_early(tile->mem.ggtt);
>  		if (err)
>  			return err;
> +		if (IS_SRIOV_VF(xe)) {
> +			err = xe_memirq_init(&tile->sriov.vf.memirq);
> +			if (err)
> +				return err;
> +		}
>  	}
>  
>  	err = drmm_add_action_or_reset(&xe->drm, xe_driver_flr_fini, xe);
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index 3da83b233206..af8ac2e9e270 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -168,6 +168,11 @@ static inline bool xe_device_has_sriov(struct xe_device *xe)
>  	return xe->info.has_sriov;
>  }
>  
> +static inline bool xe_device_has_memirq(struct xe_device *xe)
> +{
> +	return GRAPHICS_VERx100(xe) >= 1250;
> +}
> +
>  u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size);
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index d1a48456e9a3..404999eac4f6 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -16,6 +16,7 @@
>  #include "xe_heci_gsc.h"
>  #include "xe_gt_types.h"
>  #include "xe_lmtt_types.h"
> +#include "xe_memirq_types.h"
>  #include "xe_platform_types.h"
>  #include "xe_pt_types.h"
>  #include "xe_pmu.h"
> @@ -193,6 +194,10 @@ struct xe_tile {
>  			/** @sriov.pf.lmtt: Local Memory Translation Table. */
>  			struct xe_lmtt lmtt;
>  		} pf;
> +		struct {
> +			/** @sriov.vf.memirq: Memory Based Interrupts. */
> +			struct xe_memirq memirq;
> +		} vf;
>  	} sriov;
>  
>  	/** @migrate: Migration helper for vram blits and clearing */
> diff --git a/drivers/gpu/drm/xe/xe_memirq.c b/drivers/gpu/drm/xe/xe_memirq.c
> new file mode 100644
> index 000000000000..76e95535d7f6
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_memirq.c
> @@ -0,0 +1,430 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#include <drm/drm_managed.h>
> +
> +#include "regs/xe_gt_regs.h"
> +#include "regs/xe_guc_regs.h"
> +#include "regs/xe_regs.h"
> +
> +#include "xe_assert.h"
> +#include "xe_bo.h"
> +#include "xe_device.h"
> +#include "xe_device_types.h"
> +#include "xe_gt.h"
> +#include "xe_gt_printk.h"
> +#include "xe_guc.h"
> +#include "xe_hw_engine.h"
> +#include "xe_map.h"
> +#include "xe_memirq.h"
> +#include "xe_sriov.h"
> +#include "xe_sriov_printk.h"
> +
> +#define memirq_assert(m, condition)	xe_tile_assert(memirq_to_tile(m), condition)
> +#define memirq_debug(m, msg...)		xe_sriov_dbg_verbose(memirq_to_xe(m), "MEMIRQ: " msg)
> +
> +static struct xe_tile *memirq_to_tile(struct xe_memirq *memirq)
> +{
> +	return container_of(memirq, struct xe_tile, sriov.vf.memirq);
> +}
> +
> +static struct xe_device *memirq_to_xe(struct xe_memirq *memirq)
> +{
> +	return tile_to_xe(memirq_to_tile(memirq));
> +}
> +
> +static const char *guc_name(struct xe_guc *guc)
> +{
> +	return xe_gt_is_media_type(guc_to_gt(guc)) ? "media GuC" : "GuC";
> +}
> +
> +/**
> + * DOC: Memory Based Interrupts
> + *
> + * MMIO register based interrupts infrastructure used for non-virtualized mode
> + * or SRIOV-8 (which supports 8 Virtual Functions) does not scale efficiently
> + * to allow delivering interrupts to a large number of Virtual machines or
> + * containers. Memory based interrupt status reporting provides an efficient
> + * and scalable infrastructure.
> + *
> + * For memory based interrupt status reporting hardware sequence is:
> + *  * Engine writes the interrupt event to memory
> + *    (Pointer to memory location is provided by SW. This memory surface must
> + *    be mapped to system memory and must be marked as un-cacheable (UC) on
> + *    Graphics IP Caches)
> + *  * Engine triggers an interrupt to host.
> + */
> +
> +/**
> + * DOC: Memory Based Interrupts Page Layout
> + *
> + * `Memory Based Interrupts`_ requires three different objects, which are
> + * called "page" in the specs, even if they aren't page-sized or aligned.
> + *
> + * To simplify the code we allocate a single page size object and then use
> + * offsets to embedded "pages". The address of those "pages" are then
> + * programmed in the HW via LRI and LRM in the context image.
> + *
> + * - _`Interrupt Status Report Page`: this page contains the interrupt
> + *   status vectors for each unit. Each bit in the interrupt vectors is
> + *   converted to a byte, with the byte being set to 0xFF when an
> + *   interrupt is triggered; interrupt vectors are 16b big so each unit
> + *   gets 16B. One space is reserved for each bit in one of the
> + *   GT_INTR_DWx registers, so this object needs a total of 1024B.
> + *   This object needs to be 4KiB aligned.
> + *
> + * - _`Interrupt Source Report Page`: this is the equivalent of the
> + *   GEN11_GT_INTR_DWx registers, with each bit in those registers being
> + *   mapped to a byte here. The offsets are the same, just bytes instead
> + *   of bits. This object needs to be cacheline aligned.
> + *
> + * - Interrupt Mask: the HW needs a location to fetch the interrupt
> + *   mask vector to be used by the LRM in the context, so we just use
> + *   the next available space in the interrupt page.
> + *
> + * ::
> + *
> + *   0x0000   +===========+  <== Interrupt Status Report Page
> + *            |           |
> + *            |           |     ____ +----+----------------+
> + *            |           |    /     |  0 | USER INTERRUPT |
> + *            +-----------+ __/      |  1 |                |
> + *            |  HWE(n)   | __       |    | CTX SWITCH     |
> + *            +-----------+   \      |    | WAIT SEMAPHORE |
> + *            |           |    \____ | 15 |                |
> + *            |           |          +----+----------------+
> + *            |           |
> + *   0x0400   +===========+  <== Interrupt Source Report Page
> + *            |  HWE(0)   |
> + *            |  HWE(1)   |
> + *            |           |
> + *            |  HWE(x)   |
> + *   0x0440   +===========+  <== Interrupt Enable Mask
> + *            |           |
> + *            |           |
> + *            +-----------+
> + */
> +
> +static void __release_xe_bo(struct drm_device *drm, void *arg)
> +{
> +	struct xe_bo *bo = arg;
> +
> +	xe_bo_unpin_map_no_vm(bo);
> +}
> +
> +static int memirq_alloc_pages(struct xe_memirq *memirq)
> +{
> +	struct xe_device *xe = memirq_to_xe(memirq);
> +	struct xe_tile *tile = memirq_to_tile(memirq);
> +	struct xe_bo *bo;
> +	int err;
> +
> +	BUILD_BUG_ON(!IS_ALIGNED(XE_MEMIRQ_SOURCE_OFFSET, SZ_64));
> +	BUILD_BUG_ON(!IS_ALIGNED(XE_MEMIRQ_STATUS_OFFSET, SZ_4K));
> +
> +	/* XXX: convert to managed bo */
> +	bo = xe_bo_create_pin_map(xe, tile, NULL, SZ_4K,
> +				  ttm_bo_type_kernel,
> +				  XE_BO_CREATE_SYSTEM_BIT |
> +				  XE_BO_CREATE_GGTT_BIT |
> +				  XE_BO_NEEDS_UC |
> +				  XE_BO_NEEDS_CPU_ACCESS);
> +	if (IS_ERR(bo)) {
> +		err = PTR_ERR(bo);
> +		goto out;
> +	}
> +
> +	memirq_assert(memirq, !xe_bo_is_vram(bo));
> +	memirq_assert(memirq, !memirq->bo);
> +
> +	iosys_map_memset(&bo->vmap, 0, 0, SZ_4K);
> +
> +	memirq->bo = bo;
> +	memirq->source = IOSYS_MAP_INIT_OFFSET(&bo->vmap, XE_MEMIRQ_SOURCE_OFFSET);
> +	memirq->status = IOSYS_MAP_INIT_OFFSET(&bo->vmap, XE_MEMIRQ_STATUS_OFFSET);
> +	memirq->mask = IOSYS_MAP_INIT_OFFSET(&bo->vmap, XE_MEMIRQ_ENABLE_OFFSET);
> +
> +	memirq_assert(memirq, !memirq->source.is_iomem);
> +	memirq_assert(memirq, !memirq->status.is_iomem);
> +	memirq_assert(memirq, !memirq->mask.is_iomem);
> +
> +	memirq_debug(memirq, "page offsets: source %#x status %#x\n",
> +		     xe_memirq_source_ptr(memirq), xe_memirq_status_ptr(memirq));
> +
> +	return drmm_add_action_or_reset(&xe->drm, __release_xe_bo, memirq->bo);
> +
> +out:
> +	xe_sriov_err(memirq_to_xe(memirq),
> +		     "Failed to allocate memirq page (%pe)\n", ERR_PTR(err));
> +	return err;
> +}
> +
> +static void memirq_set_enable(struct xe_memirq *memirq, bool enable)
> +{
> +	iosys_map_wr(&memirq->mask, 0, u32, enable ? GENMASK(15, 0) : 0);
> +
> +	memirq->enabled = enable;
> +}
> +
> +/**
> + * xe_memirq_init - Initialize data used by `Memory Based Interrupts`_.
> + * @memirq: the &xe_memirq to initialize
> + *
> + * Allocate `Interrupt Source Report Page`_ and `Interrupt Status Report Page`_
> + * used by `Memory Based Interrupts`_.
> + *
> + * These allocations are managed and will be implicitly released on unload.
> + *
> + * Note: This function shall be called only by the VF driver.
> + *
> + * If this function fails then VF driver won't be able to operate correctly.
> + * If `Memory Based Interrupts`_ are not used this function will return 0.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_memirq_init(struct xe_memirq *memirq)
> +{
> +	struct xe_device *xe = memirq_to_xe(memirq);
> +	int err;
> +
> +	memirq_assert(memirq, IS_SRIOV_VF(xe));
> +
> +	if (!xe_device_has_memirq(xe))
> +		return 0;
> +
> +	err = memirq_alloc_pages(memirq);
> +	if (unlikely(err))
> +		return err;
> +
> +	/* we need to start with all irqs enabled */
> +	memirq_set_enable(memirq, true);
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_memirq_source_ptr - Get GGTT's offset of the `Interrupt Source Report Page`_.
> + * @memirq: the &xe_memirq to query
> + *
> + * Shall be called only on VF driver when `Memory Based Interrupts`_ are used
> + * and xe_memirq_init() didn't fail.
> + *
> + * Return: GGTT's offset of the `Interrupt Source Report Page`_.
> + */
> +u32 xe_memirq_source_ptr(struct xe_memirq *memirq)
> +{
> +	memirq_assert(memirq, IS_SRIOV_VF(memirq_to_xe(memirq)));
> +	memirq_assert(memirq, xe_device_has_memirq(memirq_to_xe(memirq)));
> +	memirq_assert(memirq, memirq->bo);
> +
> +	return xe_bo_ggtt_addr(memirq->bo) + XE_MEMIRQ_SOURCE_OFFSET;
> +}
> +
> +/**
> + * xe_memirq_status_ptr - Get GGTT's offset of the `Interrupt Status Report Page`_.
> + * @memirq: the &xe_memirq to query
> + *
> + * Shall be called only on VF driver when `Memory Based Interrupts`_ are used
> + * and xe_memirq_init() didn't fail.
> + *
> + * Return: GGTT's offset of the `Interrupt Status Report Page`_.
> + */
> +u32 xe_memirq_status_ptr(struct xe_memirq *memirq)
> +{
> +	memirq_assert(memirq, IS_SRIOV_VF(memirq_to_xe(memirq)));
> +	memirq_assert(memirq, xe_device_has_memirq(memirq_to_xe(memirq)));
> +	memirq_assert(memirq, memirq->bo);
> +
> +	return xe_bo_ggtt_addr(memirq->bo) + XE_MEMIRQ_STATUS_OFFSET;
> +}
> +
> +/**
> + * xe_memirq_enable_ptr - Get GGTT's offset of the Interrupt Enable Mask.
> + * @memirq: the &xe_memirq to query
> + *
> + * Shall be called only on VF driver when `Memory Based Interrupts`_ are used
> + * and xe_memirq_init() didn't fail.
> + *
> + * Return: GGTT's offset of the Interrupt Enable Mask.
> + */
> +u32 xe_memirq_enable_ptr(struct xe_memirq *memirq)
> +{
> +	memirq_assert(memirq, IS_SRIOV_VF(memirq_to_xe(memirq)));
> +	memirq_assert(memirq, xe_device_has_memirq(memirq_to_xe(memirq)));
> +	memirq_assert(memirq, memirq->bo);
> +
> +	return xe_bo_ggtt_addr(memirq->bo) + XE_MEMIRQ_ENABLE_OFFSET;
> +}
> +
> +/**
> + * xe_memirq_init_guc - Prepare GuC for `Memory Based Interrupts`_.
> + * @memirq: the &xe_memirq
> + * @guc: the &xe_guc to setup
> + *
> + * Register `Interrupt Source Report Page`_ and `Interrupt Status Report Page`_
> + * to be used by the GuC when `Memory Based Interrupts`_ are required.
> + *
> + * Shall be called only on VF driver when `Memory Based Interrupts`_ are used
> + * and xe_memirq_init() didn't fail.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_memirq_init_guc(struct xe_memirq *memirq, struct xe_guc *guc)
> +{
> +	bool is_media = xe_gt_is_media_type(guc_to_gt(guc));
> +	u32 offset = is_media ? ilog2(INTR_MGUC) : ilog2(INTR_GUC);
> +	u32 source, status;
> +	int err;
> +
> +	memirq_assert(memirq, IS_SRIOV_VF(memirq_to_xe(memirq)));
> +	memirq_assert(memirq, xe_device_has_memirq(memirq_to_xe(memirq)));
> +	memirq_assert(memirq, memirq->bo);
> +
> +	source = xe_memirq_source_ptr(memirq) + offset;
> +	status = xe_memirq_status_ptr(memirq) + offset * SZ_16;
> +
> +	err = xe_guc_self_cfg64(guc, GUC_KLV_SELF_CFG_MEMIRQ_SOURCE_ADDR_KEY,
> +				source);
> +	if (unlikely(err))
> +		goto failed;
> +
> +	err = xe_guc_self_cfg64(guc, GUC_KLV_SELF_CFG_MEMIRQ_STATUS_ADDR_KEY,
> +				status);
> +	if (unlikely(err))
> +		goto failed;
> +
> +	return 0;
> +
> +failed:
> +	xe_sriov_err(memirq_to_xe(memirq),
> +		     "Failed to setup report pages in %s (%pe)\n",
> +		     guc_name(guc), ERR_PTR(err));
> +	return err;
> +}
> +
> +/**
> + * xe_memirq_reset - Disable processing of `Memory Based Interrupts`_.
> + * @memirq: struct xe_memirq
> + *
> + * This is part of the driver IRQ setup flow.
> + *
> + * This function shall only be used by the VF driver on platforms that use
> + * `Memory Based Interrupts`_.
> + */
> +void xe_memirq_reset(struct xe_memirq *memirq)
> +{
> +	memirq_assert(memirq, IS_SRIOV_VF(memirq_to_xe(memirq)));
> +	memirq_assert(memirq, xe_device_has_memirq(memirq_to_xe(memirq)));
> +
> +	if (memirq->bo)
> +		memirq_set_enable(memirq, false);
> +}
> +
> +/**
> + * xe_memirq_postinstall - Enable processing of `Memory Based Interrupts`_.
> + * @memirq: the &xe_memirq
> + *
> + * This is part of the driver IRQ setup flow.
> + *
> + * This function shall only be used by the VF driver on platforms that use
> + * `Memory Based Interrupts`_.
> + */
> +void xe_memirq_postinstall(struct xe_memirq *memirq)
> +{
> +	memirq_assert(memirq, IS_SRIOV_VF(memirq_to_xe(memirq)));
> +	memirq_assert(memirq, xe_device_has_memirq(memirq_to_xe(memirq)));
> +
> +	if (memirq->bo)
> +		memirq_set_enable(memirq, true);
> +}
> +
> +static bool memirq_received(struct xe_memirq *memirq, struct iosys_map *vector,
> +			    u16 offset, const char *name)
> +{
> +	u8 value;
> +
> +	value = iosys_map_rd(vector, offset, u8);
> +	if (value) {
> +		if (value != 0xff)
> +			xe_sriov_err_ratelimited(memirq_to_xe(memirq),
> +						 "Unexpected memirq value %#x from %s at %u\n",
> +						 value, name, offset);
> +		iosys_map_wr(vector, offset, u8, 0x00);
> +	}
> +
> +	return value;
> +}
> +
> +static void memirq_dispatch_engine(struct xe_memirq *memirq, struct iosys_map *status,
> +				   struct xe_hw_engine *hwe)
> +{
> +	memirq_debug(memirq, "STATUS %s %*ph\n", hwe->name, 16, status->vaddr);
> +
> +	if (memirq_received(memirq, status, ilog2(GT_RENDER_USER_INTERRUPT), hwe->name))
> +		xe_hw_engine_handle_irq(hwe, GT_RENDER_USER_INTERRUPT);
> +}
> +
> +static void memirq_dispatch_guc(struct xe_memirq *memirq, struct iosys_map *status,
> +				struct xe_guc *guc)
> +{
> +	const char *name = guc_name(guc);
> +
> +	memirq_debug(memirq, "STATUS %s %*ph\n", name, 16, status->vaddr);
> +
> +	if (memirq_received(memirq, status, ilog2(GUC_INTR_GUC2HOST), name))
> +		xe_guc_irq_handler(guc, GUC_INTR_GUC2HOST);
> +}
> +
> +/**
> + * xe_memirq_handler - The `Memory Based Interrupts`_ Handler.
> + * @memirq: the &xe_memirq
> + *
> + * This function reads and dispatches `Memory Based Interrupts`.
> + */
> +void xe_memirq_handler(struct xe_memirq *memirq)
> +{
> +	struct xe_device *xe = memirq_to_xe(memirq);
> +	struct xe_tile *tile = memirq_to_tile(memirq);
> +	struct xe_hw_engine *hwe;
> +	enum xe_hw_engine_id id;
> +	struct iosys_map map;
> +	unsigned int gtid;
> +	struct xe_gt *gt;
> +
> +	if (!memirq->bo)
> +		return;
> +
> +	memirq_assert(memirq, !memirq->source.is_iomem);
> +	memirq_debug(memirq, "SOURCE %*ph\n", 32, memirq->source.vaddr);
> +	memirq_debug(memirq, "SOURCE %*ph\n", 32, memirq->source.vaddr + 32);
> +
> +	for_each_gt(gt, xe, gtid) {
> +		if (gt->tile != tile)
> +			continue;
> +
> +		for_each_hw_engine(hwe, gt, id) {
> +			if (memirq_received(memirq, &memirq->source, hwe->irq_offset, "SRC")) {
> +				map = IOSYS_MAP_INIT_OFFSET(&memirq->status,
> +							    hwe->irq_offset * SZ_16);
> +				memirq_dispatch_engine(memirq, &map, hwe);
> +			}
> +		}
> +	}
> +
> +	/* GuC and media GuC (if present) must be checked separately */
> +
> +	if (memirq_received(memirq, &memirq->source, ilog2(INTR_GUC), "SRC")) {
> +		map = IOSYS_MAP_INIT_OFFSET(&memirq->status, ilog2(INTR_GUC) * SZ_16);
> +		memirq_dispatch_guc(memirq, &map, &tile->primary_gt->uc.guc);
> +	}
> +
> +	if (!tile->media_gt)
> +		return;
> +
> +	if (memirq_received(memirq, &memirq->source, ilog2(INTR_MGUC), "SRC")) {
> +		map = IOSYS_MAP_INIT_OFFSET(&memirq->status, ilog2(INTR_MGUC) * SZ_16);
> +		memirq_dispatch_guc(memirq, &map, &tile->media_gt->uc.guc);
> +	}
> +}
> diff --git a/drivers/gpu/drm/xe/xe_memirq.h b/drivers/gpu/drm/xe/xe_memirq.h
> new file mode 100644
> index 000000000000..2d40d03c3095
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_memirq.h
> @@ -0,0 +1,26 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef _XE_MEMIRQ_H_
> +#define _XE_MEMIRQ_H_
> +
> +#include <linux/types.h>
> +
> +struct xe_guc;
> +struct xe_memirq;
> +
> +int xe_memirq_init(struct xe_memirq *memirq);
> +
> +u32 xe_memirq_source_ptr(struct xe_memirq *memirq);
> +u32 xe_memirq_status_ptr(struct xe_memirq *memirq);
> +u32 xe_memirq_enable_ptr(struct xe_memirq *memirq);
> +
> +void xe_memirq_reset(struct xe_memirq *memirq);
> +void xe_memirq_postinstall(struct xe_memirq *memirq);
> +void xe_memirq_handler(struct xe_memirq *memirq);
> +
> +int xe_memirq_init_guc(struct xe_memirq *memirq, struct xe_guc *guc);
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_memirq_types.h b/drivers/gpu/drm/xe/xe_memirq_types.h
> new file mode 100644
> index 000000000000..625b6b8736cc
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_memirq_types.h
> @@ -0,0 +1,37 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef _XE_MEMIRQ_TYPES_H_
> +#define _XE_MEMIRQ_TYPES_H_
> +
> +#include <linux/iosys-map.h>
> +
> +struct xe_bo;
> +
> +/* ISR */
> +#define XE_MEMIRQ_STATUS_OFFSET		0x0
> +/* IIR */
> +#define XE_MEMIRQ_SOURCE_OFFSET		0x400
> +/* IMR */
> +#define XE_MEMIRQ_ENABLE_OFFSET		0x440
> +
> +/**
> + * struct xe_memirq - Data used by the `Memory Based Interrupts`_.
> + *
> + * @bo: buffer object with `Memory Based Interrupts Page Layout`_.
> + * @source: iosys pointer to `Interrupt Source Report Page`_.
> + * @status: iosys pointer to `Interrupt Status Report Page`_.
> + * @mask: iosys pointer to Interrupt Enable Mask.
> + * @enabled: internal flag used to control processing of the interrupts.
> + */
> +struct xe_memirq {
> +	struct xe_bo *bo;
> +	struct iosys_map source;
> +	struct iosys_map status;
> +	struct iosys_map mask;
> +	bool enabled;
> +};
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
