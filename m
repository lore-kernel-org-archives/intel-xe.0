Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C200C7618E
	for <intel-xe@archiver.kernel.org>; Mon, 24 Apr 2023 21:35:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF26F10E1EA;
	Mon, 24 Apr 2023 21:35:56 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14F7B10E1EA
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Apr 2023 21:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682372154; x=1713908154;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=PHaOxY2aRlqb553NayAeQ9KRRl53O3gzR29twaM2gYs=;
 b=Qykg7KHVD7SeGAQxkIZzHTjt0RVzfsxy7qJddYI0CcW7h+tZPc/f09Ao
 DH6AgODjBP15oiI4Ngy6TLZ86X0V44cDtat0ndCdPWUiJgC8d5Q7OOLFs
 4xVvJdTlqQvfTxx31wjf7S9sJcZ0gDkrZadoOvxrvmeDaDoB1T3JfbAW0
 IBtQqPpIrGYWn3WC2HlrdaRMEIpsmHn17p2n2fL2BFCqhLrsfbSiwC5C7
 6j5VW8jHGjPdfUI2vv58QlRiKkEEhXBt2D2nDtwTEH3jDjnlxBgaNU3sw
 wmoQXWVtMoaczn/+et28h+piqBaT5vV/TljhgRt5eVYR9UDuSh7PriU2w Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="411853040"
X-IronPort-AV: E=Sophos;i="5.99,223,1677571200"; d="scan'208";a="411853040"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2023 14:27:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="643524102"
X-IronPort-AV: E=Sophos;i="5.99,223,1677571200"; d="scan'208";a="643524102"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga003.jf.intel.com with ESMTP; 24 Apr 2023 14:27:56 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 24 Apr 2023 14:27:55 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 24 Apr 2023 14:27:55 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.175)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 24 Apr 2023 14:27:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=accFiUMWTYrG1csmmkxI5BXIPPhNH6bZr5XjhkaO88PLHJNYgAbqtOSB6KeLsxxwJ8HfI1LoOM6vkfDK9SDblp2qyZux9jc8TrFTljGllL0InhvFB+8S5ifnBYSWF4YlwId7NUPjAipaeiA3xBUhXyvsfFeitAt/9cjn4QtZjdylRo550mes7REyBHPbYqIgKNbIUlz0vfM4biyGU5PDUmx0lXHx4CR6L1TGzvhQ5zWKptkZ9DdHBRs4Xep4mO8qQfbtnHTRrB4uSYoHBKNUXHzAuCOnvlPhTTSsRGjiPM+fXscTel+B5YWvt+SBGwXEXKwDPe1YnvbxUnPDEXOe8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bkfrJXwAQPx7JOfcFI+diM0Rc9PE7RC9ZMfEtf1YYec=;
 b=TkoOG5hQvLVTCCwzaQxvNK4bpwiTcfmA3uTtSNZ8iCoztuK71AWSLOsVWg/5f2bkMNhUibidmiT5H74NUG670B7u0biom21g40WeTpxBRLMCl5cnU3KfbL5KropYvbnqdgYdtWL+X+STGP2WypQ6QyuQ8MYQg1VNT0GRvlwpOvCaacP64Grs5h3TG+pJN50xHar2a6CuBt3MHz8mfkML6s4BTJIfHYi90BJRW4kvRDLmLt0wE4+GcVa4t/jr7Tsqi+rfySRHKxMZP0rlEMxCrUXPFfpBXvDC8ssnEDdmaccsLrEdP1XX+DdE+7cPxnrIx8Pi1gVhsXyUoZt/lRdaxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 SA0PR11MB4639.namprd11.prod.outlook.com (2603:10b6:806:70::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6319.33; Mon, 24 Apr 2023 21:27:54 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396%6]) with mapi id 15.20.6319.033; Mon, 24 Apr 2023
 21:27:54 +0000
Date: Mon, 24 Apr 2023 14:27:50 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230424212750.GF10045@mdroper-desk1.amr.corp.intel.com>
References: <20230421223258.128781-1-lucas.demarchi@intel.com>
 <20230421223258.128781-18-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230421223258.128781-18-lucas.demarchi@intel.com>
X-ClientProxiedBy: BYAPR07CA0030.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::43) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|SA0PR11MB4639:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ff2200e-dd0d-4d60-14d9-08db450ac3a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DAR35n+zZmhDBEj1Gc56yjQlaT+CKJwpRItXPe1Y+vGiP8bhaDaqSeaxVeBwj8zpv0JdmOJSfC1Czqmt2JPtN/sVo/ofbKgaowHIVl/fOXV3wA86WMWObL99T6VM2ehRpWeONWevGJRdoyknJw8h2FOIopGe0YfGMNX3D0dCXYAkolS1npDeANJGs3vglrQnq4i2kt62fTvyaR23mNlXfEwXSbZUAchE2nI5xS6fzW7SCTTL8H1onJu5S4Ccd9XDm63vQs4AdvTuajFAvF6TYEB8vvf0sTBM9Kt+mIp1eaJWB9l65XTmllzY0//Nx7ZY8cBJkhcSvTdOKA2KRc0kC37WpsAUppxKJVxxh6rLANZQr7gM7iKgdnC+RIDqhsgsSziPX/80U/CzQhS/Qm/7bpYgrcB8J3MqI+VVh74+tFSHXL0JW3KQp1y/ywvvDO9d5ue/m2lCZmsOXVEKFUAKxHELv29CBVMDV/Cr5NN9rynGiN6imzvWLGFFWtrbbEDJMbl8Hlu1fX269vT5jHYoyqRqXfHuVl2Q0ucD0cCKLNyt1mez+QOqUuG8Qd1vYjIY
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(396003)(366004)(136003)(346002)(39860400002)(451199021)(2906002)(6486002)(6512007)(6506007)(6666004)(186003)(26005)(1076003)(66946007)(66556008)(66476007)(8676002)(8936002)(6862004)(41300700001)(4326008)(316002)(478600001)(6636002)(5660300002)(54906003)(82960400001)(38100700002)(86362001)(33656002)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?8p1sdeR16HDqexDlSpzE4EbT7i0b/w5vr7ndmDynnnj6XpFa3txYwf77gc?=
 =?iso-8859-1?Q?U/ChAi+1O1yPiK4qp/Vm7YIl1xNoDY850WhhHSMtG2JYmA03Llg9vPJy6t?=
 =?iso-8859-1?Q?bH/frNSN5uDXnpH0rmmowJUEsSf8VxTAeQeJzPpcHi8j73b4jR5rOK1DY4?=
 =?iso-8859-1?Q?H42sCD/HYh4beb1xZd/cVy0ta7eJhHhInLF2hcOhGONSGSmzvOrxCb7SkC?=
 =?iso-8859-1?Q?HLMIvoq8Sus3NLoqJ324klXuECN6LuxdXaR69cfQQjsAalnfJzZoU8dWt4?=
 =?iso-8859-1?Q?OOE+gfQuck5k33+G0Spsh+tMyTfovGCa+Ck+uIv7karJVz3GzCcyMeEFUT?=
 =?iso-8859-1?Q?ipMsIgffwl95dvaivAIwJFffWqxCZLo6F/KFSqoxhQrEUR8fTVRziN7prh?=
 =?iso-8859-1?Q?BFGMJdkCNwvQA0T9tP1LBrC7La2HhCl9V/k+tG/ABVFRDld5c0rCCw4si/?=
 =?iso-8859-1?Q?i8kDW1/AJhfvHomNrlpUSoZb8mNuLnaV/5g06UHz7oZ4fo8aUYpzRA6WG1?=
 =?iso-8859-1?Q?/b6ZqA8KD8pC747ivSw9X8m3pG7lGFiLcSpsSeLbOmF36RfWWAFJt33Of9?=
 =?iso-8859-1?Q?p+JxftF9oFj5HUKXCP2kHHc1fzz4mcKDNzj8qK0nIcMXtZwqzRe1YKVwy5?=
 =?iso-8859-1?Q?2lRIRCHHJWLnl2gljCrL+F3SlUH9h4/XVnfRzlzo7b3J0FXfiL/CUh633h?=
 =?iso-8859-1?Q?irvJ+eczF4chSTD2EocOAzDaP2zcptEoRlVttKblseoQ1sqV+IqcfhEGPk?=
 =?iso-8859-1?Q?bqgVR0cKZ/gHserZQJ8i7AbJrUpmBLTQztSceAip8Og6K+wCqAXItesAAk?=
 =?iso-8859-1?Q?2hBRSpXUyPTLM6vk8oEqdYoGLzdZuNVavuRKsGGvl8rONqWcnX2J0aXu/T?=
 =?iso-8859-1?Q?HNGSt5uJTjJ2icS8XunFVn90ygk0shtUAA9TXpCMOL2NhKDSXgA7YcYiD6?=
 =?iso-8859-1?Q?8YZAup/bZqbvDdkddmj3j0T2dP5MX0FnXNsGX1HA1dVcX+Y0UGmx8lbu/E?=
 =?iso-8859-1?Q?JPTspvUl4f4R3NlyBAPMauNzyhF4kverUVzbBKPtJEJo7a4C8rGMSf+PvR?=
 =?iso-8859-1?Q?KwTn0PrMI6fQQEYOQi7DYrFnl+YtOFC9PodLEfvOnIbebWVP+hVYMRE995?=
 =?iso-8859-1?Q?3UabsE2YxpD2SYjj9JrAA2iMw6HmBiR4XC133izKfS8kmpx1qLJbS4Kfud?=
 =?iso-8859-1?Q?/FhGRzbfX3DlgVGg/SMLRGuhF3NIkrcZcO+G565T0LgWx37AsScr1RZ6BX?=
 =?iso-8859-1?Q?wtnq36W8+nNSpizZPv+u0HbxC6wOw7Z2fu/D5YSFaA+gW8+RWaVvegdAKa?=
 =?iso-8859-1?Q?SlcihPD1FrwnxB+oeDwZFcAXAv0vYmluDR8q2v8h93xLfNuDPibMaJW4Zp?=
 =?iso-8859-1?Q?HujMdl+5P/9UlCJ9fCIo9Ga/DPdZej+Ks2f+VHFrmU0cXWhw+PWZ/bL6tH?=
 =?iso-8859-1?Q?0+o52NkZyrASBgH8pW4JJs0EiF1n5Jbxe5CRm9GEwrfz2llvvVYvgO2ZaM?=
 =?iso-8859-1?Q?WiDGsmNa0AVi3+4vki4vQ/ItbAWHgzAOZBKQLOYpWcjEiTyg3VgyouHQ7i?=
 =?iso-8859-1?Q?nBPp5gjKLQEMxyaZMqf0Uga/Ya+D+0iU69pIG3SpAE92sIlHwY20j8lEtR?=
 =?iso-8859-1?Q?Rx20pTrX2+WY0XjPST2ov0V+rUtv+5e42/AzsWkJtHrjYiza2BHRSmoQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ff2200e-dd0d-4d60-14d9-08db450ac3a4
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 21:27:53.8600 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: au1Af77r2uCbwjdTY1KYW0EjAYU0OQpq9BMJF1rRsifdvfa2D33G4JkNXsLcsjoNXAzob0Oy4cwTmSITsxkHP6RRfagoGBLubxILEcFQ07U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4639
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 17/17] drm/xe: Move helper macros to
 separate header
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Apr 21, 2023 at 03:32:58PM -0700, Lucas De Marchi wrote:
> The macros to handle the RTP tables are very scary, but shouldn't be
> used outside of the header adding the infra. Move it to a separate
> header and make sure it's only included when it can be.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/Makefile         |  2 +-
>  drivers/gpu/drm/xe/xe_rtp.h         | 40 +++--------------------
>  drivers/gpu/drm/xe/xe_rtp_helpers.h | 49 +++++++++++++++++++++++++++++
>  3 files changed, 55 insertions(+), 36 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_rtp_helpers.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index ee4a95beec20..24c8232fd0be 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -215,7 +215,7 @@ endif
>  
>  # header test
>  always-$(CONFIG_DRM_XE_WERROR) += \
> -	$(patsubst %.h,%.hdrtest, $(shell cd $(srctree)/$(src) && find * -name '*.h' $(skipdisplay)))
> +	$(patsubst %.h,%.hdrtest, $(shell cd $(srctree)/$(src) && find * -name '*.h' -not -path xe_rtp_helpers.h $(skipdisplay)))
>  
>  quiet_cmd_hdrtest = HDRTEST $(patsubst %.hdrtest,%.h,$@)
>        cmd_hdrtest = $(CC) -DHDRTEST $(filter-out $(CFLAGS_GCOV), $(c_flags)) $(cflags-display) -S -o /dev/null -x c /dev/null -include $<; touch $@
> diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
> index 85b107967eeb..11545bed13ee 100644
> --- a/drivers/gpu/drm/xe/xe_rtp.h
> +++ b/drivers/gpu/drm/xe/xe_rtp.h
> @@ -9,8 +9,13 @@
>  #include <linux/types.h>
>  #include <linux/xarray.h>
>  
> +#define _XE_RTP_INCLUDE_PRIVATE_HELPERS
> +
> +#include "xe_rtp_helpers.h"
>  #include "xe_rtp_types.h"
>  
> +#undef _XE_RTP_INCLUDE_PRIVATE_HELPERS
> +
>  /*
>   * Register table poke infrastructure
>   */
> @@ -19,41 +24,6 @@ struct xe_hw_engine;
>  struct xe_gt;
>  struct xe_reg_sr;
>  
> -/*
> - * Helper macros - not to be used outside this header.
> - */
> -#define _XE_ESC(...) __VA_ARGS__
> -#define _XE_COUNT_ARGS(...) _XE_ESC(__XE_COUNT_ARGS(__VA_ARGS__,5,4,3,2,1,))
> -#define __XE_COUNT_ARGS(_,_5,_4,_3,_2,X_,...) X_
> -
> -#define _XE_CONCAT(a, b) __XE_CONCAT(a, b)
> -#define __XE_CONCAT(a, b) a ## b
> -
> -#define _XE_FIRST(...) _XE_ESC(__XE_FIRST(__VA_ARGS__,))
> -#define __XE_FIRST(x_,...) x_
> -#define _XE_TUPLE_TAIL(...) _XE_ESC(__XE_TUPLE_TAIL(__VA_ARGS__))
> -#define __XE_TUPLE_TAIL(x_,...) (__VA_ARGS__)
> -
> -#define __XE_PASTE_SEP_COMMA		,
> -#define __XE_PASTE_SEP_BITWISE_OR		|
> -#define __XE_PASTE(prefix_, sep_, args_) _XE_ESC(_XE_CONCAT(__XE_PASTE_,_XE_COUNT_ARGS args_)(prefix_, sep_, args_))
> -#define __XE_PASTE_1(prefix_, sep_, args_) prefix_ args_
> -#define __XE_PASTE_2(prefix_, sep_, args_) prefix_(_XE_FIRST args_) __XE_PASTE_SEP_ ## sep_ __XE_PASTE_1(prefix_, sep_, _XE_TUPLE_TAIL args_)
> -#define __XE_PASTE_3(prefix_, sep_, args_) prefix_(_XE_FIRST args_) __XE_PASTE_SEP_ ## sep_ __XE_PASTE_2(prefix_, sep_, _XE_TUPLE_TAIL args_)
> -#define __XE_PASTE_4(prefix_, sep_, args_) prefix_(_XE_FIRST args_) __XE_PASTE_SEP_ ## sep_ __XE_PASTE_3(prefix_, sep_, _XE_TUPLE_TAIL args_)
> -
> -#define _XE_DROP_FIRST(x_, ...) __VA_ARGS__
> -#define _XE_DROP_CAST(...) _XE_ESC(_XE_DROP_FIRST _XE_ESC __VA_ARGS__)
> -
> -/*
> - * Helper macros for concatenating prefix - do not use them directly outside
> - * this header
> - */
> -#define __XE_PASTE_XE_RTP_ENTRY_FLAG_(x_)	_XE_CONCAT(XE_RTP_ENTRY_FLAG_, x_)
> -#define __XE_PASTE_XE_RTP_ACTION_FLAG_(x_)	_XE_CONCAT(XE_RTP_ACTION_FLAG_, x_)
> -#define __XE_PASTE_XE_RTP_ACTION_(x_)	_XE_CONCAT(XE_RTP_ACTION_, x_)
> -#define __XE_PASTE_XE_RTP_RULE_(x_)	_XE_CONCAT(XE_RTP_RULE_, x_)
> -
>  /*
>   * Macros to encode rules to match against platform, IP version, stepping, etc.
>   * Shouldn't be used directly - see XE_RTP_RULES()
> diff --git a/drivers/gpu/drm/xe/xe_rtp_helpers.h b/drivers/gpu/drm/xe/xe_rtp_helpers.h
> new file mode 100644
> index 000000000000..eb9c9538d78c
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_rtp_helpers.h
> @@ -0,0 +1,49 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef _XE_RTP_HELPERS_
> +#define _XE_RTP_HELPERS_
> +
> +#ifndef _XE_RTP_INCLUDE_PRIVATE_HELPERS
> +#error "This header is supposed to be included by xe_rtp.h only"
> +#endif
> +
> +/*
> + * Helper macros for concatenating prefix - do not use them directly outside
> + * this header
> + */
> +#define _XE_ESC(...) __VA_ARGS__
> +#define _XE_COUNT_ARGS(...) _XE_ESC(__XE_COUNT_ARGS(__VA_ARGS__,5,4,3,2,1,))
> +#define __XE_COUNT_ARGS(_,_5,_4,_3,_2,X_,...) X_
> +
> +#define _XE_CONCAT(a, b) __XE_CONCAT(a, b)
> +#define __XE_CONCAT(a, b) a ## b
> +
> +#define _XE_FIRST(...) _XE_ESC(__XE_FIRST(__VA_ARGS__,))
> +#define __XE_FIRST(x_,...) x_
> +#define _XE_TUPLE_TAIL(...) _XE_ESC(__XE_TUPLE_TAIL(__VA_ARGS__))
> +#define __XE_TUPLE_TAIL(x_,...) (__VA_ARGS__)
> +
> +#define __XE_PASTE_SEP_COMMA		,
> +#define __XE_PASTE_SEP_BITWISE_OR		|
> +#define __XE_PASTE(prefix_, sep_, args_) _XE_ESC(_XE_CONCAT(__XE_PASTE_,_XE_COUNT_ARGS args_)(prefix_, sep_, args_))
> +#define __XE_PASTE_1(prefix_, sep_, args_) prefix_ args_
> +#define __XE_PASTE_2(prefix_, sep_, args_) prefix_(_XE_FIRST args_) __XE_PASTE_SEP_ ## sep_ __XE_PASTE_1(prefix_, sep_, _XE_TUPLE_TAIL args_)
> +#define __XE_PASTE_3(prefix_, sep_, args_) prefix_(_XE_FIRST args_) __XE_PASTE_SEP_ ## sep_ __XE_PASTE_2(prefix_, sep_, _XE_TUPLE_TAIL args_)
> +#define __XE_PASTE_4(prefix_, sep_, args_) prefix_(_XE_FIRST args_) __XE_PASTE_SEP_ ## sep_ __XE_PASTE_3(prefix_, sep_, _XE_TUPLE_TAIL args_)
> +
> +#define _XE_DROP_FIRST(x_, ...) __VA_ARGS__
> +#define _XE_DROP_CAST(...) _XE_ESC(_XE_DROP_FIRST _XE_ESC __VA_ARGS__)
> +
> +/*
> + * Helper macros for concatenating prefix - do not use them directly outside
> + * this header
> + */
> +#define __XE_PASTE_XE_RTP_ENTRY_FLAG_(x_)	_XE_CONCAT(XE_RTP_ENTRY_FLAG_, x_)
> +#define __XE_PASTE_XE_RTP_ACTION_FLAG_(x_)	_XE_CONCAT(XE_RTP_ACTION_FLAG_, x_)
> +#define __XE_PASTE_XE_RTP_ACTION_(x_)	_XE_CONCAT(XE_RTP_ACTION_, x_)
> +#define __XE_PASTE_XE_RTP_RULE_(x_)	_XE_CONCAT(XE_RTP_RULE_, x_)
> +
> +#endif
> -- 
> 2.39.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
