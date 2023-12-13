Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D62E0C4332F
	for <intel-xe@archiver.kernel.org>; Wed, 13 Dec 2023 00:16:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7A7110E0A3;
	Wed, 13 Dec 2023 00:16:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 339CF10E0A3
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Dec 2023 00:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702426559; x=1733962559;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=WTUt3E7CoAMYUnjGBMvOJ4qQHVRN7MPm9jEAfUx2dtM=;
 b=TeIn+ypK9z1FW1GJm3mynCzvnwEibzAV6SOM+j6OWBT4g3gX6YfS2oe1
 vhziFdJJYYmaGGCpWah9zacvZZaImGXjk5xrBJ95x1XMKABqSu9e4+DvX
 XCMRUkQZpdfB8ZvicT8w1bbxXYc83v2xSRx1RJbc3seou/8eV80xpKNCS
 p+Qx5BS8W9AOCXsSZh/A6dguMHP/M8q1quMjOjTVA9ZQ+ZBQj5RyNwPeZ
 LUTzFs+5khLRYb1/C2YrSVfRiym8DYq2q+K4/keYNMq1AzWz0lyLLIL8u
 ai2d8jVrwahrknWX3OnsNQxYOF3aaVz0TLJplDdk/jTRVeasSicgASuD3 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="2025265"
X-IronPort-AV: E=Sophos;i="6.04,271,1695711600"; 
   d="scan'208";a="2025265"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2023 16:15:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="891815597"
X-IronPort-AV: E=Sophos;i="6.04,271,1695711600"; d="scan'208";a="891815597"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Dec 2023 16:15:57 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 12 Dec 2023 16:15:56 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 12 Dec 2023 16:15:56 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 12 Dec 2023 16:15:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b2wL3/bvxo7qwSiUDSchWYg2Z4jfVk1z7JmNO6y6FPOEmP+yeOjYTwArdCHujpRSSk7KZI2mCDIPNwZZngwIK6C1wQMSkv3uoK+2U0DZnbXH5gDDAOYKnVuLdJd3shxvLOgVaqKZBH0VKGbB8A2Cn6hqqW6NWwTSVdLVl3KsPHyIE0nO58YBvKzmNOp99wCbRA3eHk0ARNZqdwqsy/5b3/vh7qdbaHJVOq83wjH9JNTzZiVgxN6GHrLm09OqMnpXM8aYxOFz8ru+evEHjNzNSGaxpNjL7yZ+SBHQc66TrLJSNXhHM2Mzc8JoCn37v6qEKd1ucwYIVsFabZup1F8uHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dzJ/HEq1z6HZ4JAYV8lLfo1A0Q/o5QZ8AMmoI3wR/D4=;
 b=QQjIZOtV7/rylFcJOFa3OcMvnVSQWHqX6pVeYsz3O2Slhz3Yw1ZN7qoqWG09PSnVXNm8cmetP5C7WWJCD+kHFPv4cZDOukRfnAEa+IMlJTfv/kwMWHgRQhwpN2PK9vH+h9zd98JpCMYlcrJBrlUroUUcqIFJ+3Q0WDHqtqS7+CoK933EIpAtbbIorwRJrS5hk7UAl1+roAx57+hQjrWyV4iAwmgURRe2Cl2eDN3g1ETaovHORp8fWrzC6J9NTGiRuFA5tiMJsTLAUOI4+HKvR/SFxk/1IGUnNDlY8B6jDJuqzHdICUxNLpMN2rq9/WlElDEpv44LT+2D2uqvJiooEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by IA0PR11MB7954.namprd11.prod.outlook.com (2603:10b6:208:40e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.26; Wed, 13 Dec
 2023 00:15:53 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0%7]) with mapi id 15.20.7068.033; Wed, 13 Dec 2023
 00:15:53 +0000
Date: Tue, 12 Dec 2023 16:15:51 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH 07/10] drm/xe/vf: Introduce Memory Based Interrupts Handler
Message-ID: <20231213001551.GN1327160@mdroper-desk1.amr.corp.intel.com>
References: <20231212210054.1747-1-michal.wajdeczko@intel.com>
 <20231212210054.1747-8-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231212210054.1747-8-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BYAPR05CA0013.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::26) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|IA0PR11MB7954:EE_
X-MS-Office365-Filtering-Correlation-Id: d06f0733-f9bd-4410-f3d7-08dbfb70ab3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: U1RdmOtAt85wyZ10hJPGE/lQ9c4RXRNrFGL69r6oXwzW0dnjCZZaRO2V4lo0AE0yEKAri4x8LclWccDQ7phMK6yH+6oLMAd77WfeHd8O36/K1G2qzn8kdjmA8oSjt0rC7yTKueF1179W1+Gih8aV+6DcHP5VSxrY63wbMoXIG+0z0Sq+2NWxyr5INvAh7OL8EHkl97JOzuwOPtjti5CuBgqFwVpMDvwNjJu8tO2Ep03F4VrLPGIAqlaJv/cwX6D/D0jYFqspYlY5rYJGHjicevRxZla2befYykK8AgOL7iOkag4DI/+FiFsSwd6IABJMpxP5IqTe/GAS1nQVjw21/vsJv+BpNdMgkTIc2THFQCGoQSqkl035jWf37EvL4glygAg+gSyly2Catb9ZiHp1iuiw52Www/z/BGpWhHjiz8gh53zAb7wp+HsKipZWbJJ3qia8doTaoU7Olq2TyIawl76dtoI0EZWAZ7mRBSpMXnTdAoGsqi7wmpu7obL/QcPgkEMrMSPqrRGg86gsPA1BBp77SGwYrVXQq3Zef4wsxsTFqWFk34xvItIs+9ig1ltU8YJPL24UG23DVCwbnWKALZ5cu/mbp82nlqvVOuh+5AE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(396003)(376002)(136003)(39860400002)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(66476007)(66556008)(66946007)(82960400001)(86362001)(33656002)(38100700002)(6512007)(83380400001)(1076003)(6506007)(6486002)(30864003)(2906002)(6636002)(316002)(478600001)(5660300002)(4326008)(8936002)(6862004)(41300700001)(26005)(8676002)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?+HDubMuP1BozsU9Qk89Mf+Y1tnU5DoLZ54zJWZ/u4tixHQD0E5YiDNqPdV?=
 =?iso-8859-1?Q?Isuop/c9DB8ZwbcuxEo+LMyfS93GKFbEYl3KkVaGjBMvC1tKflup/iXDxX?=
 =?iso-8859-1?Q?fEP80NOb0pd3+mnA2CPEQ7qikWPleMKbXw+Bazw+PWf5d0pggygkUo7K/B?=
 =?iso-8859-1?Q?Iy0558uyrC9R0Pe/9vmjIRhBn977A1pBiY9Q6dzdTVOvlwZGahtaiXADuX?=
 =?iso-8859-1?Q?8O7znln78QVTlaNUrbR+hC5DaFFiQ7vnxwPdpFpuhhq1/q0qgAHYFsuusF?=
 =?iso-8859-1?Q?Jqh1wtHWlrdbP3pA2a2rmVVuCUOnt5BoKM7nqZ/WTqHh0XCD1zkIevt4zq?=
 =?iso-8859-1?Q?N0bbE6yt/VmBG6Xs3CFWPeKcbsLGvxZg1fxbWGF5Va2gRy71InpVYEGAH9?=
 =?iso-8859-1?Q?yKLMaNGIZaD/RC0b3cM2gkqP6Ag9oGA2O8R8JqU8qDGJxuMILBSq+6kSKp?=
 =?iso-8859-1?Q?/woitstnzAGgPaLkYKlpfoRq5s1pPApKq9sxYQ1s12GRIgd3/SxDrwLmzh?=
 =?iso-8859-1?Q?hR0NDnCSoeflY8ADF9iRTi9orDgD2k5XgH9C56Iyw16+zaxrhx5Q78Cel/?=
 =?iso-8859-1?Q?ipBMCLIhfp7dhArEcoXvZ7dgu47QLJw6huz7phtae8KYeUztPLc5LWfPz+?=
 =?iso-8859-1?Q?PuC1Ba7j9vOfDLAsshoUCB8W/Uz8V4jbYltYWsJhAs1Jgw0PE1rD59VEoZ?=
 =?iso-8859-1?Q?59zvItmsmdClI+MrI8JvqCSmqhXm9QO6Je7Ae/243VNEZntQFfRU6eFzCX?=
 =?iso-8859-1?Q?z8fsm4E/5GfPgjfCTahYcWlQa6OkrKbI704QYoy7FLXMdqwHeBCBzUsSrM?=
 =?iso-8859-1?Q?aTVvU/sSkInLNHuEpKV+s7Ll/sjOYOBuvaDjrQAIeWU/nlQAkk9gVyklJe?=
 =?iso-8859-1?Q?JoK86gV6rgN/lmcQT2z+E5jbdjmLeYuUNcinbwAw6BF7DzxtAOpAF0NTKv?=
 =?iso-8859-1?Q?CvPVp1eNYPDWe2rbzED2PeaxSurYpe5XqTGRiwSVsUwkSivzhTLleW9G6Z?=
 =?iso-8859-1?Q?/uUKvi9USyqF30nZWshFDHczjDdR+LSRU0t+6FskzJz1D4Eng6hiHFaxQi?=
 =?iso-8859-1?Q?sfKo3Mo7cFgkngrEmAij0XwoP5g6SnrvQGcCjur8Hc2fm4WVs997Q4NIs7?=
 =?iso-8859-1?Q?FrhfRsn72cWwTSvD0UPXGZkAFUo3AnBN/VvEZEc1u/xcUnW4xyhCSNVTwp?=
 =?iso-8859-1?Q?pcs9eDO6tZ1rIeaYoCWfgXFIjKoJME5nhGWXTofqNf0wgHMmA/tw2fHKci?=
 =?iso-8859-1?Q?4VyZQKq0cTfOPmSPNuvpBLXL5xU502LrlGAOBR+al5OvcztLXetE3f+eMT?=
 =?iso-8859-1?Q?LppxqZuh9IReqTxtnXPq+xLdvrmEUwLB2evtDbaScOT9B+Uqhanfsj/VyX?=
 =?iso-8859-1?Q?RfVrgjL/efkLjk52GVqn4g73OZP4N3G3/iXJC41dlKKWO8UBW/ZohGl0CT?=
 =?iso-8859-1?Q?i6ELuBySlZMYTN6c3udvP8iCvbNhnr+Y3qitbdTAcw5OsNJLqRe+Fu1C9G?=
 =?iso-8859-1?Q?6j5WPPvSkjM28J6zuJ98NLMN80oC1J0ABhf1dJclIHeLyC9ySwDfOnKJxB?=
 =?iso-8859-1?Q?kn5xHtA6M7psdpwoE4beNawLwdmyBM1XIqHRmMq6wiE2XiYNKZOwmKa+Ic?=
 =?iso-8859-1?Q?3qXntfDfiirPjih4eCDG3Pb+AR+M+RalTPm+TtcaLe0MoJeJPgSKigqQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d06f0733-f9bd-4410-f3d7-08dbfb70ab3e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2023 00:15:53.7885 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fRSqotjHp3QLKDSM3ZbKJ0v3J6VpOhpXcnYTAiwuzrlAuGEen+HiKfboKSvg31TWSDZk/4SkFbfsvt6JS6dYyB2fQxL15tpCTAcxU5gMxTU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7954
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

On Tue, Dec 12, 2023 at 10:00:51PM +0100, Michal Wajdeczko wrote:
> The register based interrupts infrastructure does not scale
> efficiently to allow delivering interrupts to a large number
> of virtual machines. Memory based interrupt reporting provides
> an efficient and scalable infrastructure.
> 
> Define handler to read and dispatch memory based interrupts.
> We will use this handler in upcoming patch.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile          |   4 +-
>  drivers/gpu/drm/xe/xe_device.c       |   7 +
>  drivers/gpu/drm/xe/xe_device_types.h |   5 +
>  drivers/gpu/drm/xe/xe_memirq.c       | 429 +++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_memirq.h       |  26 ++
>  drivers/gpu/drm/xe/xe_memirq_types.h |  37 +++
>  6 files changed, 507 insertions(+), 1 deletion(-)
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
> index 2e0b2e40d8f3..a66a7640279d 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -27,12 +27,14 @@
>  #include "xe_ggtt.h"
>  #include "xe_gt.h"
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
> @@ -430,6 +432,11 @@ int xe_device_probe(struct xe_device *xe)
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
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 0c48e3686837..9cb86b5c9187 100644
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
> index 000000000000..cdc63dd29dd1
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_memirq.c
> @@ -0,0 +1,429 @@
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
> +				  XE_BO_NEEDS_CPU_ACCESS);

One other thing I see mentioned on bspec 50829 is that the memory must
be marked un-cacheable on the graphics caches.  As far as I can see, we
always map stuff into the GGTT with a GPU:WB PAT index in
xe_ggtt_map_bo().  Unless I'm forgetting something we might need to pass
down a new flag that will give us an uncached mapping?

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
> + * If this function fails then VF driver will be able to operate correctly.

Will?  Or won't?

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

We don't actually use this function yet in this patch; maybe it would
fit better in the later patch where we call this during GuC IRQ
initialization?

> +{
> +	bool is_media = xe_gt_is_media_type(guc_to_gt(guc));
> +	u32 offset = is_media ? ilog2(MTL_INTR_MGUC) : ilog2(INTR_GUC);
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

At first I thought it might be a mistake that we're using 64-bits for a
GGTT address, but after checking the GuC interface spec, this does
indeed seem to be correct, even though source/status will only ever be
32-bit offsets.


Matt

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
> +	if (memirq_received(memirq, &memirq->source, ilog2(MTL_INTR_MGUC), "SRC")) {
> +		map = IOSYS_MAP_INIT_OFFSET(&memirq->status, ilog2(MTL_INTR_MGUC) * SZ_16);
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
