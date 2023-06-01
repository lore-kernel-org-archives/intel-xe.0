Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CA38C7EE23
	for <intel-xe@archiver.kernel.org>; Thu,  1 Jun 2023 16:36:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C375B10E585;
	Thu,  1 Jun 2023 16:36:46 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C22DB10E23E
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Jun 2023 16:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685637405; x=1717173405;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=6jmjnzDOuXnS+AkauRkk1wk1IP8fiwk3cMIM8nJc+vI=;
 b=lpckjGnq5fpY6cWnDtItolc/gfw6ZEH2hN77LezCIP/5kSBBZU6u4YAM
 QGzCsVbDcnjL5XmfXrrWlXPNrO4oZp4qNysn4Wch3pGybcuxBQGjg8Br1
 JQGg2mc/HJJ9x2zhnRVUxrO8s6b8cE5A3WzDBvuTP0A53uhEm6sI68GAw
 09fZqSbJiZGr62uaALY3Y2jJHWok4tlBlIeijkYMS9Sx0l0CTiY9tlIe7
 r0gVPGoKQFw4CYpgBRktAn2sGYUcMdjhIM3+FdGbNszQtACwLUvUuKT7A
 tZds4A2O/KW3OBXdqTYtENYRpaTPDHtyaOGZtRQeoiEskACX0YFW9pK/R w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="355628444"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="355628444"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2023 09:35:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="737170676"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="737170676"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga008.jf.intel.com with ESMTP; 01 Jun 2023 09:35:29 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 1 Jun 2023 09:35:29 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 1 Jun 2023 09:35:29 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 1 Jun 2023 09:35:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CcM+6NZ8nD3wGBLX05fA/C289AqzueLrBsWpEys04WX+/NaN/12BnioxqHIa9jRVMQ9yhZhV3foJc/Vd9Nly1eWMPwGbkOfz1pSxLrx35v1FbBaqD7pOommWb9n2iOQeCFsxvDTc6uwb7lTE57CBHNUjasb+rJPdlfEneCv+4Bu9ONMzo4SWLJg+YM3sSsh8jWjvHdLCXAqwlQhfT0wvNqdvOr3VAhDOlHFVEWISvjvngj3E+tEhHTXEPgb3y8a6/YBQOblQB0EkcQs2QngksXNmcQLyBkC7pxzorSw6m1bRHyPWBSCPTMTxUQokcPIVwulhWlTUinmz8ImcR1naWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Puyw0+Wn+wk1lt6O9bx0st6XqSQ5YrHbQwlVFEOURI8=;
 b=Oll/1ZLxe+uHV1CW2FYzHkznJghO/n+MuYmSio5WrClHOgw6k58fPD9/YI/sTFzqP32RnZb3SxkUeeMC4hXwnmgIDA+Zcrz/VUZuRuAZ2U17u+gbGf+MUF0OC/E7RSwzl/XteTF/QdebSPIDAs7ceyXB7/Kijt+zKeXWKGh43Pvq2Lv6XbMZebmKzjIoo88BclWODVlkBItOydo+Gv1H5AZ6Snm5SiBwe7mEbFssuLTgjdq/QrLYHTa5oMso1YTy6Sd/qxE8s4f5Z4Px3JHV34GvXtI/J6De+xJDY3Tvo+QjMnziW4s0PV44nCBMM7YujUgpHR20HIUeUPQo7Jtedw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 CO1PR11MB5058.namprd11.prod.outlook.com (2603:10b6:303:99::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.23; Thu, 1 Jun 2023 16:35:27 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396%3]) with mapi id 15.20.6455.020; Thu, 1 Jun 2023
 16:35:27 +0000
Date: Thu, 1 Jun 2023 09:35:23 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Message-ID: <20230601163523.GI6953@mdroper-desk1.amr.corp.intel.com>
References: <20230531224821.387722-1-matthew.d.roper@intel.com>
 <20230531224821.387722-9-matthew.d.roper@intel.com>
 <87o7lzfscm.fsf@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <87o7lzfscm.fsf@intel.com>
X-ClientProxiedBy: BYAPR07CA0028.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::41) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|CO1PR11MB5058:EE_
X-MS-Office365-Filtering-Correlation-Id: dde8ffd7-fa94-4e0e-c107-08db62be3459
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V+1JdGEEEfg2qVTKrXrf+eM14RSOVEFgoXNkZeIP7fQLJPiEVvKclfDoxRJcViyW3UDksbg7nUTlvOsaD8kmjhWmwJWhBcmYMkYAOyBJz0FprMr6wktijF+8+OsdWNjD0m4YIbMWf3BWife23Fv2sFCQHK75Ci5JQ4LSBIl6q06lo38viRFaVOCG2zJhZXJKsfv8IDQ5E7S2b2a6pVLm1gx9ysh243b4WB0Qx+Moz9U48/997AI/AkHqdqPhpm1EGO03RDCv1trKN+CYLX6ilSRNIwv0rTkqISG4pzLD/j1yLTqbFAJ3GBJw/1djroLZd4uMomodLA2WRI0xBkiITbLeFFO4u0f7bQoiyKKIkkMrrfw3k6jn3Tb/yHYRXd3zcH8QEhZCHf/del7qbW5sR3mnzu7tM7QonHUiAvyCVQHmhBZR5eTORuRsDdCdOWHHG+qW0l86cgqrBC9cky9FUcp01Rg/Xveqs107udqLWMnsIjdY+zogB53OYlYj3VPPnep8r7ld2NgCDEpWT2BKnoBFbLwES62Wy7HTUlyWOfb7t9DJ+uua5dGcuezA797a
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(396003)(39860400002)(366004)(136003)(346002)(451199021)(478600001)(8936002)(54906003)(8676002)(5660300002)(30864003)(2906002)(33656002)(86362001)(66556008)(82960400001)(4326008)(66946007)(66476007)(316002)(6916009)(38100700002)(41300700001)(1076003)(26005)(6506007)(83380400001)(186003)(6512007)(6486002)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vhHzXqMC1PPydbdi4baQPv7KOncHnBjSkHVheUYjVViFCb+xhabpVrvSJW+I?=
 =?us-ascii?Q?3l/lUxQuxRClmhZxopZO6ycizd519t8h94WCtgIztALqpHfBX9lFAcQaboIm?=
 =?us-ascii?Q?F5tbkcaUu670VFqplhJVETf+RNEvopSlS81oNgqx2JSBnVnsWjAMxsqTZp6M?=
 =?us-ascii?Q?T4ydnF3J0X/0EZnDPbROi/HfQyBG3/dExakXyR2tBPcPNnl8FrVxoPtvnHXe?=
 =?us-ascii?Q?IEsBTlysPU69C7URlXvQ06+hrvuOdjV/AgIuQtuTiT4NvAGHaa9uMrP/OaTN?=
 =?us-ascii?Q?dXdaaUGlPZ/I4n6FejrLwhPO+Olzyg8dFhd+A/EokvT8h2UmdJSoWO6gpcfI?=
 =?us-ascii?Q?r3IyMoitKq/GWOsFMJBxoVaqavt2gdK16bRnasHSU0s0AjOzn3Ytg+t34yvs?=
 =?us-ascii?Q?i/LSuwD2qrKuQWXjdeK/eQZqw5oyou1dodU1c8mzjmQU9rxBz4aTx/mHEO3H?=
 =?us-ascii?Q?IWtQtn7XuvQ+0B/6s8rwhMclrPIKcJ8ry43uyhHqPGwG0VLN/GBaYJQehy3m?=
 =?us-ascii?Q?MVxoogxRGYiiSnoUncPu0TC1KMRKYbWOrvzznPHenbq6AipZaGjIIrZSq2Ry?=
 =?us-ascii?Q?3QWOU4PpMt6QIKHbgAWuUi8iII9FaLYnEFtQpMN0k1B6nRZw4YF59CHyAns0?=
 =?us-ascii?Q?wZfh+cR3ViGFmrF//p195VJjT5J5QsCSjl0+d2u6qUCef7xAnuFOdeczLsmZ?=
 =?us-ascii?Q?0+tfKgrnRi4Eh3BWof/tDBz12ZTWfOHOXoGxkoUdpwUXoOfe4ky9qtCibW+t?=
 =?us-ascii?Q?AQ2DoCIHbJq43DjC1bCl0BjZxeCMz27bOK2uxMlW+lKow5l6jpZyH+gJ2fTe?=
 =?us-ascii?Q?D+dTRUmJCaAs6XJeJVClF+gW3Tr6+a81ws5gzwGbzr/mLXnck7FBEz9HOYT3?=
 =?us-ascii?Q?qQHZf3eqe86QrP+AJcHMlyRIX4jFTLAeV6PHVCTrKhv2UUyVsRc6/cC8vCF2?=
 =?us-ascii?Q?+eLwxpUI1/mbDUuBnbnEt2mmXn+N/pbAYofc83+hSfE8sP0HzBMaLg4+R3Y8?=
 =?us-ascii?Q?q/QBEPOPDfwv+qeklh3LvnwUDpoG+peZh0yRLAsnflNAK1GXrujaXG6RNJHe?=
 =?us-ascii?Q?Dzew9p/ZjL9EBxBo6goLGWsVQKkaq6UfGqHPAHedCucudPyllHkgKwvcpmAH?=
 =?us-ascii?Q?67ipZLtwDi5gw5ysxEhw/ylvO2/wR3YGROaRUDlQpjh3LwaFlGWL/ryXsjvF?=
 =?us-ascii?Q?UA3uiluQ10aDhII+uKv147WclrvZFRl2OiF2jwwiY5X8GCtDST4FFv3fNPBo?=
 =?us-ascii?Q?hES1aU6FGxlo4dDoPD4pPThswZ0LSFB7JRFFZoG8Uj5m1OlaJOxFIFn5dxKq?=
 =?us-ascii?Q?TMAj+zxOpxSKrCFGJInTGpY4Ccqbkoe6uL5U1j/m0ysh7uCfxGXWqmrP8czu?=
 =?us-ascii?Q?b1OS2iTmiVl9l1qfkJ40JN8fJTfDor9f0JdORPQz79yWySWsdOv1XvJIP6+y?=
 =?us-ascii?Q?OQ1QSVgAoqKrKEYDSWQ4cNuGrqN8sLF4zIhRAZA2G6Nu6fMs/azK4BUZwdLR?=
 =?us-ascii?Q?Fq4CsBnq/IGEcPMMVsirNDzF8wQYp8v9bcNaUSew9+bpU7bwEpAlCB3sQQVn?=
 =?us-ascii?Q?/XQqPl9cY6PG4S1y5NYtuzCPQtZJG3QgxWr86shLxTJS3GYi4hoMMuLDYDYn?=
 =?us-ascii?Q?ng=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dde8ffd7-fa94-4e0e-c107-08db62be3459
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2023 16:35:26.7914 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xvgnPxFlsr7Vb6AmJ7JkGrycr5aSkC8wuO2zrNv2qtpVVcm1qVVrlbcD09ZYSqgcHga/d51LGq1XhQZKWsfPD9/DpKrbl+iAw5+7lrSzgk0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5058
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 8/8] drm/xe/display: Call display probe from
 i915 code
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Jun 01, 2023 at 12:24:09PM +0300, Jani Nikula wrote:
> On Wed, 31 May 2023, Matt Roper <matthew.d.roper@intel.com> wrote:
> > FIXME:  These changes should have been a fixup patch against
> > "drm/xe/display: Implement display support" but that commit has itself
> > been mis-squashed somewhere and no longer exists.
> 
> It's been mis-squashed into "drm/i915/irq: split out hotplug irq
> handling" which should only be a cherry-pick from upstream.

Since Rodrigo is out at the moment, who's handling the periodic rebase
of drm-xe-next until he gets back?  We should make sure unsquashing this
is on their radar for whenever the next rebase happens.


Matt

> 
> BR,
> Jani.
> 
> 
> >
> > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> > ---
> >  drivers/gpu/drm/xe/Makefile                   |   2 +
> >  .../gpu/drm/xe/compat-i915-headers/i915_drv.h |  40 +----
> >  .../drm/xe/display/ext/intel_device_info.c    |  60 ++++---
> >  drivers/gpu/drm/xe/xe_device_types.h          |  56 +-----
> >  drivers/gpu/drm/xe/xe_display.c               | 164 +++---------------
> >  5 files changed, 75 insertions(+), 247 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> > index da1e447c08c7..ebab5385f636 100644
> > --- a/drivers/gpu/drm/xe/Makefile
> > +++ b/drivers/gpu/drm/xe/Makefile
> > @@ -121,6 +121,7 @@ subdir-ccflags-$(CONFIG_DRM_XE_DISPLAY) += \
> >  	-Ddrm_i915_private=xe_device
> >  
> >  CFLAGS_i915-display/intel_fbdev.o = $(call cc-disable-warning, override-init)
> > +CFLAGS_i915-display/intel_display_device.o = $(call cc-disable-warning, override-init)
> >  
> >  # Rule to build display code shared with i915
> >  $(obj)/i915-display/%.o: $(srctree)/drivers/gpu/drm/i915/display/%.c FORCE
> > @@ -160,6 +161,7 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
> >  	i915-display/intel_ddi.o \
> >  	i915-display/intel_ddi_buf_trans.o \
> >  	i915-display/intel_display.o \
> > +	i915-display/intel_display_device.o \
> >  	i915-display/intel_display_driver.o \
> >  	i915-display/intel_display_debugfs.o \
> >  	i915-display/intel_display_power.o \
> > diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
> > index 74e6f063f741..949b40afbd57 100644
> > --- a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
> > +++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
> > @@ -84,44 +84,14 @@ static inline struct drm_i915_private *kdev_to_i915(struct device *kdev)
> >  #define IS_BDW_ULT(dev_priv) (dev_priv && 0)
> >  #define IS_BDW_ULX(dev_priv) (dev_priv && 0)
> >  
> > -#define INTEL_NUM_PIPES(xe) (hweight8((xe)->info.display.pipe_mask))
> > -#define HAS_DISPLAY(xe) ((xe)->info.display.pipe_mask != 0)
> >  #define INTEL_DISPLAY_ENABLED(xe) (HAS_DISPLAY((xe)) && !intel_opregion_headless_sku((xe)))
> > -#define HAS_CDCLK_CRAWL(xe) ((xe)->info.display.has_cdclk_crawl)
> > -#define HAS_CDCLK_SQUASH(xe) ((xe)->info.display.has_cdclk_squash)
> > -#define HAS_PSR(xe) ((xe)->info.display.has_psr)
> > -#define HAS_PSR2_SEL_FETCH(xe) (xe || 1)
> > -#define HAS_PSR_HW_TRACKING(xe) ((xe)->info.display.has_psr_hw_tracking)
> > -#define HAS_IPC(xe) ((xe)->info.display.has_ipc)
> > -#define HAS_IPS(xe) (xe && false)
> > -#define HAS_SAGV(xe) (xe || 1)
> > -#define HAS_DP_MST(xe) ((xe)->info.display.has_dp_mst)
> > -#define HAS_DMC(xe) ((xe)->info.display.has_dmc)
> > -#define HAS_DSB(xe) ((xe)->info.display.has_dsb)
> > -#define HAS_DSC(xe) ((xe)->info.display.has_dsc)
> > -#define HAS_CUR_FBC(xe) (xe || 1)
> > -#define HAS_DOUBLE_BUFFERED_M_N(xe) ((xe) || 1)
> > -#define I915_HAS_HOTPLUG(xe) (true)
> > -#define HAS_D12_PLANE_MINIMIZATION(dev_priv) (IS_ROCKETLAKE(dev_priv) || \
> > -					      IS_ALDERLAKE_S(dev_priv))
> > -#define DISPLAY_VER(xe) ((xe)->info.display.ver)
> > +#define DISPLAY_VER(xe) ((xe)->info.display_runtime.ip.ver)
> >  #define IS_DISPLAY_VER(xe, first, last) ((DISPLAY_VER(xe) >= first && DISPLAY_VER(xe) <= last))
> >  #define IS_GRAPHICS_VER(xe, first, last) \
> >  	((xe)->info.graphics_verx100 >= first * 100 && \
> >  	 (xe)->info.graphics_verx100 <= (last*100 + 99))
> >  #define IS_MOBILE(xe) (xe && 0)
> > -#define HAS_GMCH(xe) (xe && 0)
> > -#define HAS_DDI(xe) (xe || 1)
> >  #define HAS_LLC(xe) (!IS_DGFX((xe)))
> > -#define HAS_GMBUS_IRQ(xe) (xe || 1)
> > -#define HAS_GMBUS_BURST_READ(xe) (xe || 1)
> > -#define HAS_VRR(xe) (xe || 1)
> > -#define HAS_ASYNC_FLIPS(xe) (xe || 1)
> > -#define HAS_FBC(xe) ((xe)->info.display.fbc_mask)
> > -#define SUPPORTS_TV(xe) (xe && 0)
> > -#define HAS_MBUS_JOINING(xe) (xe && 0)
> > -#define HAS_HW_SAGV_WM(xe) (DISPLAY_VER(xe) >= 13 && !IS_DGFX(xe))
> > -#define HAS_DPT(xe) (DISPLAY_VER(xe) >= 13)
> >  
> >  /* Workarounds not handled yet */
> >  #define IS_DISPLAY_STEP(xe, first, last) ({u8 __step = (xe)->info.step.display; first <= __step && __step <= last;})
> > @@ -162,15 +132,11 @@ static inline struct drm_i915_private *kdev_to_i915(struct device *kdev)
> >  #define IS_DG2_G12(xe) ((xe)->info.subplatform == XE_SUBPLATFORM_DG2_G12)
> >  #define IS_ADLP_RPLU(xe) ((xe)->info.subplatform == XE_SUBPLATFORM_ADLP_RPLU)
> >  #define IS_ICL_WITH_PORT_F(xe) (xe && 0)
> > -#define HAS_LSPCON(xe) (xe && 0)
> > -#define HAS_MSO(xe) (xe || 1)
> > -#define HAS_DP20(xe) (IS_DG2(xe))
> >  #define HAS_FLAT_CCS(xe) (xe_device_has_flat_ccs(xe))
> >  #define HAS_4TILE(xe) ((xe)->info.has_4tile)
> >  #define to_intel_bo(x) gem_to_xe_bo((x))
> >  #define mkwrite_device_info(xe) (INTEL_INFO(xe))
> >  
> > -#define HAS_TRANSCODER(dev_priv, trans)  ((INTEL_INFO(dev_priv)->display.cpu_transcoder_mask & BIT(trans)) != 0)
> >  #define HAS_128_BYTE_Y_TILING(xe) (xe || 1)
> >  
> >  #define intel_has_gpu_reset(a) (a && 0)
> > @@ -225,7 +191,9 @@ static inline void intel_runtime_pm_put(struct xe_runtime_pm *pm, bool wakeref)
> >  
> >  #define intel_step_name xe_step_name
> >  #define pdev_to_i915 pdev_to_xe_device
> > -#define RUNTIME_INFO(xe) (&(xe)->info.display)
> > +#define DISPLAY_INFO(xe)		((xe)->info.display)
> > +#define RUNTIME_INFO(xe)		(&(xe)->info.i915_runtime)
> > +#define DISPLAY_RUNTIME_INFO(xe)	(&(xe)->info.display_runtime)
> >  
> >  #define FORCEWAKE_ALL XE_FORCEWAKE_ALL
> >  #define HPD_STORM_DEFAULT_THRESHOLD 50
> > diff --git a/drivers/gpu/drm/xe/display/ext/intel_device_info.c b/drivers/gpu/drm/xe/display/ext/intel_device_info.c
> > index 9a54611037b5..4e304961d45f 100644
> > --- a/drivers/gpu/drm/xe/display/ext/intel_device_info.c
> > +++ b/drivers/gpu/drm/xe/display/ext/intel_device_info.c
> > @@ -48,69 +48,70 @@
> >   */
> >  void intel_device_info_runtime_init(struct drm_i915_private *dev_priv)
> >  {
> > -	struct intel_runtime_info *runtime = RUNTIME_INFO(dev_priv);
> > +	struct intel_display_runtime_info *display_runtime =
> > +		DISPLAY_RUNTIME_INFO(dev_priv);
> >  	enum pipe pipe;
> >  
> >  	/* Wa_14011765242: adl-s A0,A1 */
> >  	if (IS_ADLS_DISPLAY_STEP(dev_priv, STEP_A0, STEP_A2)) {
> >  		for_each_pipe(dev_priv, pipe)
> > -			runtime->num_scalers[pipe] = 0;
> > +			display_runtime->num_scalers[pipe] = 0;
> >  	} else if (DISPLAY_VER(dev_priv) >= 11) {
> >  		for_each_pipe(dev_priv, pipe)
> > -			runtime->num_scalers[pipe] = 2;
> > +			display_runtime->num_scalers[pipe] = 2;
> >  	} else if (DISPLAY_VER(dev_priv) >= 9) {
> > -		runtime->num_scalers[PIPE_A] = 2;
> > -		runtime->num_scalers[PIPE_B] = 2;
> > -		runtime->num_scalers[PIPE_C] = 1;
> > +		display_runtime->num_scalers[PIPE_A] = 2;
> > +		display_runtime->num_scalers[PIPE_B] = 2;
> > +		display_runtime->num_scalers[PIPE_C] = 1;
> >  	}
> >  
> >  	if (DISPLAY_VER(dev_priv) >= 13 || HAS_D12_PLANE_MINIMIZATION(dev_priv)) {
> >  		for_each_pipe(dev_priv, pipe)
> > -			runtime->num_sprites[pipe] = 4;
> > +			display_runtime->num_sprites[pipe] = 4;
> >  	} else if (DISPLAY_VER(dev_priv) >= 11) {
> >  		for_each_pipe(dev_priv, pipe)
> > -			runtime->num_sprites[pipe] = 6;
> > +			display_runtime->num_sprites[pipe] = 6;
> >  	}
> >  
> >  	if (HAS_DISPLAY(dev_priv) && DISPLAY_VER(dev_priv) >= 9) {
> >  		u32 dfsm = intel_de_read(dev_priv, SKL_DFSM);
> >  
> >  		if (dfsm & SKL_DFSM_PIPE_A_DISABLE) {
> > -			runtime->pipe_mask &= ~BIT(PIPE_A);
> > -			runtime->cpu_transcoder_mask &= ~BIT(TRANSCODER_A);
> > -			runtime->fbc_mask &= ~BIT(INTEL_FBC_A);
> > +			display_runtime->pipe_mask &= ~BIT(PIPE_A);
> > +			display_runtime->cpu_transcoder_mask &= ~BIT(TRANSCODER_A);
> > +			display_runtime->fbc_mask &= ~BIT(INTEL_FBC_A);
> >  		}
> >  		if (dfsm & SKL_DFSM_PIPE_B_DISABLE) {
> > -			runtime->pipe_mask &= ~BIT(PIPE_B);
> > -			runtime->cpu_transcoder_mask &= ~BIT(TRANSCODER_B);
> > +			display_runtime->pipe_mask &= ~BIT(PIPE_B);
> > +			display_runtime->cpu_transcoder_mask &= ~BIT(TRANSCODER_B);
> >  		}
> >  		if (dfsm & SKL_DFSM_PIPE_C_DISABLE) {
> > -			runtime->pipe_mask &= ~BIT(PIPE_C);
> > -			runtime->cpu_transcoder_mask &= ~BIT(TRANSCODER_C);
> > +			display_runtime->pipe_mask &= ~BIT(PIPE_C);
> > +			display_runtime->cpu_transcoder_mask &= ~BIT(TRANSCODER_C);
> >  		}
> >  
> >  		if (DISPLAY_VER(dev_priv) >= 12 &&
> >  		    (dfsm & TGL_DFSM_PIPE_D_DISABLE)) {
> > -			runtime->pipe_mask &= ~BIT(PIPE_D);
> > -			runtime->cpu_transcoder_mask &= ~BIT(TRANSCODER_D);
> > +			display_runtime->pipe_mask &= ~BIT(PIPE_D);
> > +			display_runtime->cpu_transcoder_mask &= ~BIT(TRANSCODER_D);
> >  		}
> >  
> >  		if (dfsm & SKL_DFSM_DISPLAY_HDCP_DISABLE)
> > -			runtime->has_hdcp = 0;
> > +			display_runtime->has_hdcp = 0;
> >  
> >  		if (dfsm & SKL_DFSM_DISPLAY_PM_DISABLE)
> > -			runtime->fbc_mask = 0;
> > +			display_runtime->fbc_mask = 0;
> >  
> >  		if (DISPLAY_VER(dev_priv) >= 11 && (dfsm & ICL_DFSM_DMC_DISABLE))
> > -			runtime->has_dmc = 0;
> > +			display_runtime->has_dmc = 0;
> >  
> > -		if (DISPLAY_VER(dev_priv) >= 10 &&
> > +		if (IS_DISPLAY_VER(dev_priv, 10, 12) &&
> >  		    (dfsm & GLK_DFSM_DISPLAY_DSC_DISABLE))
> > -			runtime->has_dsc = 0;
> > +			display_runtime->has_dsc = 0;
> >  	}
> >  
> > -	runtime->rawclk_freq = intel_read_rawclk(dev_priv);
> > -	drm_dbg(&dev_priv->drm, "rawclk rate: %d kHz\n", runtime->rawclk_freq);
> > +	RUNTIME_INFO(dev_priv)->rawclk_freq = intel_read_rawclk(dev_priv);
> > +	drm_dbg(&dev_priv->drm, "rawclk rate: %d kHz\n", RUNTIME_INFO(dev_priv)->rawclk_freq);
> >  }
> >  
> >  bool i915_vtd_active(struct drm_i915_private *i915)
> > @@ -128,3 +129,14 @@ int __i915_inject_probe_error(struct drm_i915_private *i915, int err,
> >  {
> >  	return 0;
> >  }
> > +int i8xx_enable_vblank(struct drm_crtc *crtc) { return 0; }
> > +void intel_dvo_init(struct drm_i915_private *i915) {}
> > +int i965_enable_vblank(struct drm_crtc *crtc) { return 0; }
> > +int intel_tv_init(struct drm_i915_private *i915) { return 0; }
> > +int assert_dsi_pll_enabled(struct drm_i915_private *i915) { return 0; }
> > +bool intel_sdvo_init(struct drm_i915_private *dev_priv,
> > +		     i915_reg_t sdvo_reg, enum port port) { return false; }
> > +void i965_disable_vblank(struct drm_crtc *crtc) {}
> > +void i8xx_disable_vblank(struct drm_crtc *crtc) {}
> > +void g4x_hdmi_init(struct drm_i915_private *dev_priv,
> > +		   i915_reg_t hdmi_reg, enum port port) {}
> > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> > index 51c16d207780..27a312bb7a63 100644
> > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > @@ -21,6 +21,7 @@
> >  #include "ext/intel_device_info.h"
> >  #include "ext/intel_pch.h"
> >  #include "intel_display_core.h"
> > +#include "intel_display_device.h"
> >  #endif
> >  
> >  #define XE_BO_INVALID_OFFSET	LONG_MAX
> > @@ -112,58 +113,11 @@ struct xe_device {
> >  		u8 enable_display:1;
> >  
> >  #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
> > -		struct xe_device_display_info {
> > -			u8 ver;
> > -
> > -			u8 pipe_mask;
> > -			u8 cpu_transcoder_mask;
> > -			u8 fbc_mask;
> > -			u8 abox_mask;
> > -
> > -			struct {
> > -				u16 size; /* in blocks */
> > -				u8 slice_mask;
> > -			} dbuf;
> > -
> > -#define DEV_INFO_DISPLAY_FOR_EACH_FLAG(func) \
> > -			/* Keep in alphabetical order */ \
> > -			func(has_cdclk_crawl); \
> > -			func(has_cdclk_squash); \
> > -			func(has_dmc); \
> > -			func(has_dp_mst); \
> > -			func(has_dsb); \
> > -			func(has_dsc); \
> > -			func(has_fpga_dbg); \
> > -			func(has_hdcp); \
> > -			func(has_hti); \
> > -			func(has_ipc); \
> > -			func(has_psr); \
> > -			func(has_psr_hw_tracking);
> > -
> > -#define DEFINE_FLAG(name) u8 name:1
> > -			DEV_INFO_DISPLAY_FOR_EACH_FLAG(DEFINE_FLAG);
> > -#undef DEFINE_FLAG
> > -
> > -			/* Register offsets for the various display pipes and transcoders */
> > -			u32 pipe_offsets[I915_MAX_TRANSCODERS];
> > -			u32 trans_offsets[I915_MAX_TRANSCODERS];
> > -			u32 cursor_offsets[I915_MAX_PIPES];
> > -
> > -			struct {
> > -				u32 degamma_lut_size;
> > -				u32 gamma_lut_size;
> > -				u32 degamma_lut_tests;
> > -				u32 gamma_lut_tests;
> > -			} color;
> > -
> > -			/* Populated by intel_device_runtime_init() */
> > -			u8 num_sprites[I915_MAX_PIPES];
> > -			u8 num_scalers[I915_MAX_PIPES];
> > +		const struct intel_display_device_info *display;
> > +		struct intel_display_runtime_info display_runtime;
> > +		struct {
> >  			u32 rawclk_freq;
> > -
> > -			/* Unused by xe, but for compat */
> > -			u32 mmio_offset;
> > -		} display;
> > +		} i915_runtime;
> >  #endif
> >  	} info;
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
> > index 1a9e9c78966d..17dacd06954d 100644
> > --- a/drivers/gpu/drm/xe/xe_display.c
> > +++ b/drivers/gpu/drm/xe/xe_display.c
> > @@ -320,7 +320,7 @@ static void intel_suspend_encoders(struct xe_device *xe)
> >  	struct drm_device *dev = &xe->drm;
> >  	struct intel_encoder *encoder;
> >  
> > -	if (!xe->info.display.pipe_mask)
> > +	if (xe->info.display_runtime.pipe_mask)
> >  		return;
> >  
> >  	drm_modeset_lock_all(dev);
> > @@ -340,7 +340,7 @@ void xe_display_pm_suspend(struct xe_device *xe)
> >  	 * properly.
> >  	 */
> >  	intel_power_domains_disable(xe);
> > -	if (xe->info.display.pipe_mask)
> > +	if (xe->info.display_runtime.pipe_mask)
> >  		drm_kms_helper_poll_disable(&xe->drm);
> >  
> >  	intel_display_driver_suspend(xe);
> > @@ -385,7 +385,7 @@ void xe_display_pm_resume(struct xe_device *xe)
> >  
> >  	intel_dmc_resume(xe);
> >  
> > -	if (xe->info.display.pipe_mask)
> > +	if (xe->info.display_runtime.pipe_mask)
> >  		drm_mode_config_reset(&xe->drm);
> >  
> >  	intel_display_driver_init_hw(xe);
> > @@ -397,7 +397,7 @@ void xe_display_pm_resume(struct xe_device *xe)
> >  	intel_display_driver_resume(xe);
> >  
> >  	intel_hpd_poll_disable(xe);
> > -	if (xe->info.display.pipe_mask)
> > +	if (xe->info.display_runtime.pipe_mask)
> >  		drm_kms_helper_poll_enable(&xe->drm);
> >  
> >  	intel_opregion_resume(xe);
> > @@ -411,142 +411,34 @@ void xe_display_pm_resume(struct xe_device *xe)
> >  __diag_push();
> >  __diag_ignore_all("-Woverride-init", "Allow field overrides in table");
> >  
> > -#define __DISPLAY_DEFAULTS \
> > -	.pipe_mask = BIT(PIPE_A) | BIT(PIPE_B) |			\
> > -		     BIT(PIPE_C) | BIT(PIPE_D),				\
> > -	.cpu_transcoder_mask =						\
> > -	BIT(TRANSCODER_A) | BIT(TRANSCODER_B) |				\
> > -	BIT(TRANSCODER_C) | BIT(TRANSCODER_D) |				\
> > -	BIT(TRANSCODER_DSI_0) | BIT(TRANSCODER_DSI_1),			\
> > -	.pipe_offsets = {						\
> > -		[TRANSCODER_A] = PIPE_A_OFFSET,				\
> > -		[TRANSCODER_B] = PIPE_B_OFFSET,				\
> > -		[TRANSCODER_C] = PIPE_C_OFFSET,				\
> > -		[TRANSCODER_D] = PIPE_D_OFFSET,				\
> > -		[TRANSCODER_DSI_0] = PIPE_DSI0_OFFSET,			\
> > -		[TRANSCODER_DSI_1] = PIPE_DSI1_OFFSET,			\
> > -	},								\
> > -	.cursor_offsets = { \
> > -		[PIPE_A] = CURSOR_A_OFFSET, \
> > -		[PIPE_B] = CURSOR_B_OFFSET, \
> > -		[PIPE_C] = CURSOR_C_OFFSET, \
> > -		[PIPE_D] = CURSOR_D_OFFSET, \
> > -	}, \
> > -	.trans_offsets = {						\
> > -		[TRANSCODER_A] = TRANSCODER_A_OFFSET,			\
> > -		[TRANSCODER_B] = TRANSCODER_B_OFFSET,			\
> > -		[TRANSCODER_C] = TRANSCODER_C_OFFSET,			\
> > -		[TRANSCODER_D] = TRANSCODER_D_OFFSET,			\
> > -		[TRANSCODER_DSI_0] = TRANSCODER_DSI0_OFFSET,		\
> > -		[TRANSCODER_DSI_1] = TRANSCODER_DSI1_OFFSET,		\
> > -	}
> > -
> > -#define GEN12_DISPLAY \
> > -	__DISPLAY_DEFAULTS,						\
> > -	.ver = 12,							\
> > -	.abox_mask = GENMASK(2, 1),					\
> > -	.has_dmc = 1,							\
> > -	.has_dp_mst = 1,						\
> > -	.has_dsb = 0, /* FIXME: LUT load is broken with huge DSB */	\
> > -	.dbuf.size = 2048,						\
> > -	.dbuf.slice_mask = BIT(DBUF_S1) | BIT(DBUF_S2),			\
> > -	.has_dsc = 1,							\
> > -	.fbc_mask = BIT(INTEL_FBC_A),					\
> > -	.has_fpga_dbg = 1,						\
> > -	.has_hdcp = 1,							\
> > -	.has_ipc = 1,							\
> > -	.has_psr = 1,							\
> > -	.has_psr_hw_tracking = 0,					\
> > -	.color = { .degamma_lut_size = 33, .gamma_lut_size = 262145 }
> > -
> > -#define XE_LPD								\
> > -	__DISPLAY_DEFAULTS,						\
> > -	.ver = 13,							\
> > -	.abox_mask = GENMASK(1, 0),					\
> > -	.color = {							\
> > -		.degamma_lut_size = 128, .gamma_lut_size = 1024,	\
> > -		.degamma_lut_tests = DRM_COLOR_LUT_NON_DECREASING |	\
> > -		DRM_COLOR_LUT_EQUAL_CHANNELS,				\
> > -	},								\
> > -	.dbuf.size = 4096,						\
> > -	.dbuf.slice_mask = BIT(DBUF_S1) | BIT(DBUF_S2) | BIT(DBUF_S3) |	\
> > -	BIT(DBUF_S4),							\
> > -	.has_dmc = 1,							\
> > -	.has_dp_mst = 1,						\
> > -	.has_dsb = 1,							\
> > -	.has_dsc = 1,							\
> > -	.fbc_mask = BIT(INTEL_FBC_A),					\
> > -	.has_fpga_dbg = 1,						\
> > -	.has_hdcp = 1,							\
> > -	.has_ipc = 1,							\
> > -	.has_psr = 1,							\
> > -	.has_psr_hw_tracking = 0
> > -
> > -#define XE_LPDP								\
> > -	XE_LPD,								\
> > -	.ver = 14,							\
> > -	.has_cdclk_crawl = 1,						\
> > -	.has_cdclk_squash = 1
> > -
> > -
> >  void xe_display_info_init(struct xe_device *xe)
> >  {
> > -	if (!xe->info.enable_display) {
> > -		unset_display_features(xe);
> > -		return;
> > -	}
> > +	u16 gmdid_ver, gmdid_rel, gmdid_step;
> > +	bool has_gmdid = GRAPHICS_VERx100(xe) >= 1270;
> > +
> > +	if (!xe->info.enable_display)
> > +		goto no_display;
> > +
> > +	xe->info.display = intel_display_device_probe(xe, has_gmdid, &gmdid_ver,
> > +						      &gmdid_rel, &gmdid_step);
> > +	memcpy(&xe->info.display_runtime,
> > +	       &xe->info.display->__runtime_defaults,
> > +	       sizeof(xe->info.display->__runtime_defaults));
> >  
> > -	switch (xe->info.platform) {
> > -	case XE_TIGERLAKE:
> > -	case XE_DG1:
> > -		xe->info.display = (struct xe_device_display_info) {
> > -			GEN12_DISPLAY,
> > -			.has_psr_hw_tracking = 1,
> > -		};
> > -		break;
> > -	case XE_ROCKETLAKE:
> > -		xe->info.display = (struct xe_device_display_info) {
> > -			GEN12_DISPLAY,
> > -			.abox_mask = BIT(0),
> > -			.has_hti = 1,
> > -			.cpu_transcoder_mask =
> > -				BIT(TRANSCODER_A) | BIT(TRANSCODER_B) |
> > -				BIT(TRANSCODER_C),
> > -			.pipe_mask =
> > -				BIT(PIPE_A) | BIT(PIPE_B) | BIT(PIPE_C),
> > -		};
> > -		break;
> > -	case XE_ALDERLAKE_S:
> > -		xe->info.display = (struct xe_device_display_info) {
> > -			GEN12_DISPLAY,
> > -			.has_hti = 1,
> > -		};
> > -		break;
> > -	case XE_ALDERLAKE_P:
> > -	case XE_ALDERLAKE_N:
> > -		xe->info.display = (struct xe_device_display_info) {
> > -			XE_LPD,
> > -			.has_cdclk_crawl = 1,
> > -		};
> > -		break;
> > -	case XE_DG2:
> > -		xe->info.display = (struct xe_device_display_info) {
> > -			XE_LPD,
> > -			.cpu_transcoder_mask =
> > -				BIT(TRANSCODER_A) | BIT(TRANSCODER_B) |
> > -				BIT(TRANSCODER_C) | BIT(TRANSCODER_D),
> > -			.has_cdclk_squash = 1,
> > -		};
> > -		break;
> > -	case XE_METEORLAKE:
> > -		xe->info.display = (struct xe_device_display_info) { XE_LPDP };
> > -		break;
> > -	default:
> > -		drm_warn(&xe->drm, "Unknown display IP\n");
> > -		xe->info.enable_display = false;
> > -		unset_display_features(xe);
> > -		return;
> > +	if (!xe->info.display_runtime.pipe_mask)
> > +		goto no_display;
> > +
> > +	if (has_gmdid) {
> > +		xe->info.display_runtime.ip.ver = gmdid_ver;
> > +		xe->info.display_runtime.ip.rel = gmdid_rel;
> > +		xe->info.display_runtime.ip.step = gmdid_step;
> >  	}
> > +
> > +	return;
> > +
> > +no_display:
> > +	xe->info.enable_display = false;
> > +	unset_display_features(xe);
> >  }
> >  
> >  __diag_pop();
> 
> -- 
> Jani Nikula, Intel Open Source Graphics Center

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
