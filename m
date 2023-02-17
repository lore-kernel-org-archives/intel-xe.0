Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 562CEC64ED6
	for <intel-xe@archiver.kernel.org>; Fri, 17 Feb 2023 16:28:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F6F410E2DC;
	Fri, 17 Feb 2023 16:28:15 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EDE710F075
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Feb 2023 16:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676651293; x=1708187293;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Kw0Fn4Itk8ZbCLeFTIm3Txs7B70fKclEkzeF7X9vhC8=;
 b=gAVXVIwddhBPXkElqHtmi+XdjLChL9+tk47uu4OMkX2ohXJKagLgB6sC
 hYk+azkG6gieCkkKF7kG7F+apaP7M3SLlmXkUfG2jhSon8NJP2AHFWSd2
 GeTW1KCookPzcw0vl/Q0RHj2LIVSDQNkgdp4U3HeyEHKr/i+8MUVzW/XG
 tsmRrx5jEvPGdCChygYa/47u1IjKU/y2qcdovRA3RwOpEfSFFMijB70nu
 TiZyEVJEqgDV0O1OJYRBNfkYWUDl2DZMzLsZs/KKokVpyyVY4Grrpdcyv
 hmfBr9aGxV9puWF1mMSpyyflxlB2JFLVZo0twXIMZFBXR3Tlk8k8dFjgI Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="332028191"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; d="scan'208";a="332028191"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2023 08:28:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="648135894"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; d="scan'208";a="648135894"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga006.jf.intel.com with ESMTP; 17 Feb 2023 08:28:12 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 17 Feb 2023 08:28:11 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 17 Feb 2023 08:28:11 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.104)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 17 Feb 2023 08:28:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hunrkT3WmyiWBEa8TsqJi5/FnNdEo42Ijh0jcJRCsJM4lgAjBYI92rl8xAcUxCft8Hto7WPdrXeoM6G64Mmq8/jzG6wEJ/+q6tlNBXbJ3dq8bzAojV5dyzh+Sp4/91rn2oFM3HXFCbfwaL4oxqyKjx9CRwawwbESJR0Pr9r32m85SqGo5ryFAw5xEvhundU+TRbkPpISPWXZZ41ZqNOjqnBSaAzWU1WDeBL74aPdC51PmvSMDWZzvedhiOD2bXaKnFs1SAN1bdyKKbJv/rH+x5YGNYi0Y5XVi84emkQI1WLxBWqTWmsWv5ENfG9Plk+5GIaGqY8+FphPd9xdTM8/kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vSxto4T4IbDexTdasWYfu/4qbSHnqU7Ayz3CJi2ScPk=;
 b=Ngu19qfg6NdhFwihNjjaUgdOa0OSUzV5RZ4FCeTXF++izV8v9iD6p+gBp8IiClY95dvvZl3K1fYkXIIwBK9E8DRiMRPqRbHg7difBPGhzSF9rvTNiCgBzffTqJK0w5SWux7Elm6jWQQTfm+gJU7hqO9I4jTL1jGKcxSdMCJc0a1ELPveyUTLeZ1321LN9zFc1x8alHNBKXBh35aIx19zYASysmRmOIawhULczRXbuk9KtVfyegq3OmIFRIcXaUJsPZad2NFcH6UbXEB1SRxt/PGblqq3u9Wg4vtfbUEMX8X/Wg/PdPt4+GAKJSKlfQtDOkCP/jbhNksWf2LWFacR9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MW3PR11MB4684.namprd11.prod.outlook.com (2603:10b6:303:5d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.12; Fri, 17 Feb
 2023 16:28:09 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158%9]) with mapi id 15.20.6086.024; Fri, 17 Feb 2023
 16:28:09 +0000
Date: Fri, 17 Feb 2023 11:28:06 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Message-ID: <Y++rFnBkN5PEvE1U@intel.com>
References: <20230203202742.577659-1-rodrigo.vivi@intel.com>
 <20230203202742.577659-3-rodrigo.vivi@intel.com>
 <87cz6921qq.fsf@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87cz6921qq.fsf@intel.com>
X-ClientProxiedBy: BY5PR17CA0065.namprd17.prod.outlook.com
 (2603:10b6:a03:167::42) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MW3PR11MB4684:EE_
X-MS-Office365-Filtering-Correlation-Id: c842efa2-cf6c-46a4-fa2b-08db1103f4f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BrB+9+yJgfYcMA5nwFxSzhEuOTyDwvI/xAKaRAS3EfBA0de46B10+9GcD6E7802sDJ6n/+VtXmFTSAoPPmXQIlTjU7Na6pERGChJJPLs/6JEDn6yQp1DTNUsK9J34lc9boPOPjzMZRJTOdpkVwx52Mi4d583AbJOuxiQG32oSJpO/4NiEl45yhDhUV512MXB6enA8J2xkIEorgRg0FddjQd2cXmvGOzVvl9YFLrRs94CZ//xeTPfUSvIKsnvEWm1uHPHXIHlOa4oPlzLLAnG5URuvUblvarW7Yd1tX11sbI5hSYBJ4Jr8gVH4S1LuoTVGZwLAhBrLeTam8+G+Ns8CPRKggqld5xnhb4hQYmehTtER9sA2YnmFMuKTImqEHt2twd3SvBFH2Gq7Aas0Luz/ClY22WZSlsulghEMpxGJZsKsdvqMQkNG3jVpdXHpS3BmoEcgh1pCqI2MQSTFcs8nKPlON9eEdt/avkZb2+jay+shk9aJR28ZAzXRWoV5qaZULulBwA0AWIKMNowRYBAQwQAlD2j6aDJ3qAFany4baMjcVFVm7mp0nm2h9MK1MZgKBG/vrME43Z3efJImyFg4xv4zdzWVcCZd16+eUKF/8codgsM07xtmo8gBz9BY60KdqF7PPYPuTj1Dv6L+2Q1WQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(346002)(376002)(39860400002)(136003)(366004)(451199018)(36756003)(4326008)(8676002)(41300700001)(316002)(66946007)(66476007)(6916009)(82960400001)(86362001)(38100700002)(66556008)(6666004)(186003)(26005)(6512007)(6506007)(2906002)(8936002)(44832011)(5660300002)(478600001)(6486002)(2616005)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?IDeEntVLI1PD9lrePlTWGLZCGVSojxBI58zUrIxRgUd6m8HtXLEt62y1F/?=
 =?iso-8859-1?Q?Lwi6gIZLHL6gVIRs9a0SOU1msw/lhm+8z9hVraUvl/0rZni1C9CsTpaMYB?=
 =?iso-8859-1?Q?eQQIFHPsVD5qy06I5gJzaF0URHPtyXmAkY7LDwz/mOZPaUsTUIipDAx1o5?=
 =?iso-8859-1?Q?9ysknI2XBHe8V9G1S6Ex/C6YQZ0hjpZWUskZoiTtLp4GiuOs5nb4t70wmG?=
 =?iso-8859-1?Q?+O3DxJo7eP/AsDHcf0AnuTJPp9f2NMibd+5B/qJsFvaipd1UyHgDpY87ac?=
 =?iso-8859-1?Q?l/nRV3Fx9/5ZQb0VTBa4UhY/awQ/3o5CjiX94hTnuowf5JzRjeeqVFrZr3?=
 =?iso-8859-1?Q?LjAJ0OPgOTHFOgoeuw9yQcN/WRHx/W1GCo3RTeLHzwBHR2WEShbkR0ELO9?=
 =?iso-8859-1?Q?VZpsSiRKFrNU/iDsBI10rMnkXbgayq2yxKpeZ9bhyER92XFcmqFKWsQbW3?=
 =?iso-8859-1?Q?hKrU8MLLE7N0TM8zxfOIkvwmxBV2e9XLRUs97y02tQJKH/IwcMKn6q4JXo?=
 =?iso-8859-1?Q?IzS9BiTNeK0NEasf0urU4m9WdZe9ofOczBdMXh82+uzWT2wUPDNZ4fZkdh?=
 =?iso-8859-1?Q?XX/hlTTup/1eWIYh0HUpe69dTExy2nx+hB6jyiNvby3MI53KLsmkautvYN?=
 =?iso-8859-1?Q?0Cg5KZVQbjWMP+9beKG5Tz5dm0tuo1otePQuYqOKEvWDMePjdZTXAGeLoc?=
 =?iso-8859-1?Q?RSTQsG1socAaCpX24L1ynAEhXS3EcEtJqJnUhoUiE+nzpl72yTZ9IdDIX8?=
 =?iso-8859-1?Q?AHs5Kx+YgMJB4WuBSmqK2xIwBPFYeuCBCqe7DTkKEVv9UdH8oo4wZ8u4gE?=
 =?iso-8859-1?Q?Xz3qq6QMgjp4fEs7dzK2xTCxpgUir9OS7ExhrcsMu1/ViMtR0sNA1jmBee?=
 =?iso-8859-1?Q?j2KdszfqGic9FnlWDb+BiWnYBF1kcGq/kyBljSUocXrBSj8hFD6q+BU0U0?=
 =?iso-8859-1?Q?VUASGzdqyS8xtvSi/FutWwe1EzoprA6+8KRRsJ1AGY2uPzzv76AVVwChbv?=
 =?iso-8859-1?Q?AIOX1nsvjPxRon9+0xZyj+XsdwhyFRxkfWHM6Gg295epEktcNxTojBGW2D?=
 =?iso-8859-1?Q?mkmnQn2ijfo3w7exSumzh0aQ4rz7w6wfk3bpEGj26YcX4G5A1wGYkck04w?=
 =?iso-8859-1?Q?aFLv8OiIkY9zDr2PQZXAJdRgAmYcNJF1f5dL72bEeCS1k6cOjXgTD7OgJ9?=
 =?iso-8859-1?Q?hs2jrDmdgAN+s33na8azB0ijj97diryWyL56KWH8r0yS51yY/lwM1bZZTf?=
 =?iso-8859-1?Q?3Mw/sOyE8y1DVYxmWG36+hKyxOCHExH9J4joNCIZU6+BkEHc5d5pSENMX0?=
 =?iso-8859-1?Q?FoKzjP0Sfpzep56ZfHqFwJVtV7SIeexjIaLX163frvi05y/NdpGKcIirVn?=
 =?iso-8859-1?Q?8lW5bU5A06OcuGyoPbDzIi6FYiuEeP7Gw/uRRNgSY6k+p/5/LxEK78sGh6?=
 =?iso-8859-1?Q?T74D6gsnjEayhhgP7GBwfz/Fsq1UBYmLLpkSz17TRV+A2lilJQe4S1jiEO?=
 =?iso-8859-1?Q?6jguYk0Z2uBIk76dqAQn4W7ldS0G4RYMET3MaaxfyceGb7rS2QDM7Zlsj2?=
 =?iso-8859-1?Q?owN7fDU70rbyqO4bfzG8nRt6VDh3UshtdDCqdePueSZlmmgBs6nIXwjrM/?=
 =?iso-8859-1?Q?/PP5hGOdl2sORZFkcxDO0gQGOZDHBihP/yzdkhjQn7CpJb3xDCbjejXg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c842efa2-cf6c-46a4-fa2b-08db1103f4f2
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2023 16:28:09.7852 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GgYMI+HrektUalvRTh+eOaHaPrg7PS08T96L/HgC7JKcre0/HxADRzNSSlB5YPCAbcVkQ1QAoNsKC1A4Ka4p1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4684
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/6] drm/xe: place all modprobe parameters at
 the same place
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

On Thu, Feb 16, 2023 at 03:12:13PM +0200, Jani Nikula wrote:
> On Fri, 03 Feb 2023, Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
> > From: Mauro Carvalho Chehab <mchehab@kernel.org>
> >
> > It makes easier to identify the module parameters if they're
> > placed it at the same place.
> >
> > Place them together with the module author/description/license.
> >
> > While here, fix a checkpatch.pl warning on force_probe description:
> > 	WARNING: quoted string split across lines
> >
> > Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> > Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> I don't really see why this needs to reinvent the wheel when we could
> use the same model as i915. Separate file, all params in a struct that
> provides a namespace for the params. It's hideous to have them all in
> the driver local namespace.

I was willing to avoid any special infra in order to discourage the
addition of many parameters.

But if we start growing we can definitely have the split and all.

Also, I'd like to avoid i915isms. if we need those macros and all like
we have in i915 we should probably get that into a common kernel
infra for debugfs because they would likely benefit other drivers as
well.

> 
> > ---
> >  drivers/gpu/drm/xe/xe_device.c  | 10 +---------
> >  drivers/gpu/drm/xe/xe_guc_log.c |  5 +----
> >  drivers/gpu/drm/xe/xe_mmio.c    |  5 +----
> >  drivers/gpu/drm/xe/xe_module.c  | 22 ++++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_module.h  | 13 +++++++++++++
> >  drivers/gpu/drm/xe/xe_pci.c     |  7 +------
> >  6 files changed, 39 insertions(+), 23 deletions(-)
> >  create mode 100644 drivers/gpu/drm/xe/xe_module.h
> >
> > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > index 2e1f4beba9b0..60938c2deee2 100644
> > --- a/drivers/gpu/drm/xe/xe_device.c
> > +++ b/drivers/gpu/drm/xe/xe_device.c
> > @@ -20,6 +20,7 @@
> >  #include "xe_exec.h"
> >  #include "xe_gt.h"
> >  #include "xe_irq.h"
> > +#include "xe_module.h"
> >  #include "xe_mmio.h"
> >  #include "xe_pcode.h"
> >  #include "xe_pm.h"
> > @@ -42,15 +43,6 @@
> >  #include "display/ext/intel_pm.h"
> >  #endif
> >  
> > -/* FIXME: Move to common param infrastructure */
> > -static bool enable_guc = true;
> > -module_param_named_unsafe(enable_guc, enable_guc, bool, 0444);
> > -MODULE_PARM_DESC(enable_guc, "Enable GuC submission");
> > -
> > -static bool enable_display = true;
> > -module_param_named(enable_display, enable_display, bool, 0444);
> > -MODULE_PARM_DESC(enable_display, "Enable display");
> > -
> >  static int xe_file_open(struct drm_device *dev, struct drm_file *file)
> >  {
> >  	struct xe_file *xef;
> > diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
> > index 3f19fbf243d1..7ec1b2bb1f8e 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_log.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_log.c
> > @@ -9,10 +9,7 @@
> >  #include "xe_gt.h"
> >  #include "xe_guc_log.h"
> >  #include "xe_map.h"
> > -
> > -static int xe_guc_log_level = 5;
> > -module_param_named(guc_log_level, xe_guc_log_level, int, 0600);
> > -MODULE_PARM_DESC(guc_log_level, "GuC firmware logging level (0=disable, 1..5=enable with verbosity min..max)");
> > +#include "xe_module.h"
> >  
> >  static struct xe_gt *
> >  log_to_gt(struct xe_guc_log *log)
> > diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> > index f20734cf15ba..8a953df2b468 100644
> > --- a/drivers/gpu/drm/xe/xe_mmio.c
> > +++ b/drivers/gpu/drm/xe/xe_mmio.c
> > @@ -12,6 +12,7 @@
> >  #include "xe_gt.h"
> >  #include "xe_gt_mcr.h"
> >  #include "xe_macros.h"
> > +#include "xe_module.h"
> >  
> >  #include "i915_reg.h"
> >  #include "gt/intel_engine_regs.h"
> > @@ -21,10 +22,6 @@
> >  #define TILE_COUNT		REG_GENMASK(15, 8)
> >  #define GEN12_LMEM_BAR		2
> >  
> > -static u32 xe_force_lmem_bar_size;
> > -module_param_named(lmem_bar_size, xe_force_lmem_bar_size, uint, 0600);
> > -MODULE_PARM_DESC(lmem_bar_size, "Set the lmem bar size(in MiB)");
> > -
> >  static int xe_set_dma_info(struct xe_device *xe)
> >  {
> >  	unsigned int mask_size = xe->info.dma_mask_size;
> > diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
> > index d6b50f1c2a05..9cd1663f83f6 100644
> > --- a/drivers/gpu/drm/xe/xe_module.c
> > +++ b/drivers/gpu/drm/xe/xe_module.c
> > @@ -8,9 +8,31 @@
> >  
> >  #include "xe_drv.h"
> >  #include "xe_hw_fence.h"
> > +#include "xe_module.h"
> >  #include "xe_pci.h"
> >  #include "xe_sched_job.h"
> >  
> > +bool enable_guc = true;
> > +module_param_named_unsafe(enable_guc, enable_guc, bool, 0444);
> > +MODULE_PARM_DESC(enable_guc, "Enable GuC submission");
> > +
> > +bool enable_display = true;
> > +module_param_named(enable_display, enable_display, bool, 0444);
> > +MODULE_PARM_DESC(enable_display, "Enable display");
> > +
> > +u32 xe_force_lmem_bar_size;
> > +module_param_named(lmem_bar_size, xe_force_lmem_bar_size, uint, 0600);
> > +MODULE_PARM_DESC(lmem_bar_size, "Set the lmem bar size(in MiB)");
> > +
> > +int xe_guc_log_level = 5;
> > +module_param_named(guc_log_level, xe_guc_log_level, int, 0600);
> > +MODULE_PARM_DESC(guc_log_level, "GuC firmware logging level (0=disable, 1..5=enable with verbosity min..max)");
> > +
> > +char *xe_param_force_probe = CONFIG_DRM_XE_FORCE_PROBE;
> > +module_param_named_unsafe(force_probe, xe_param_force_probe, charp, 0400);
> > +MODULE_PARM_DESC(force_probe,
> > +		 "Force probe options for specified devices. See CONFIG_DRM_XE_FORCE_PROBE for details.");
> > +
> >  struct init_funcs {
> >  	int (*init)(void);
> >  	void (*exit)(void);
> > diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
> > new file mode 100644
> > index 000000000000..2c6ee46f5595
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_module.h
> > @@ -0,0 +1,13 @@
> > +/* SPDX-License-Identifier: MIT */
> > +/*
> > + * Copyright © 2023 Intel Corporation
> > + */
> > +
> > +#include <linux/init.h>
> > +
> > +/* Module modprobe variables */
> > +extern bool enable_guc;
> > +extern bool enable_display;
> > +extern u32 xe_force_lmem_bar_size;
> > +extern int xe_guc_log_level;
> > +extern char *xe_param_force_probe;
> > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > index 1d5b6afed2c3..20aa2b5ca9ac 100644
> > --- a/drivers/gpu/drm/xe/xe_pci.c
> > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > @@ -17,17 +17,12 @@
> >  #include "xe_drv.h"
> >  #include "xe_device.h"
> >  #include "xe_macros.h"
> > +#include "xe_module.h"
> >  #include "xe_pm.h"
> >  #include "xe_step.h"
> >  
> >  #include "i915_reg.h"
> >  
> > -static char *xe_param_force_probe = CONFIG_DRM_XE_FORCE_PROBE;
> > -module_param_named_unsafe(force_probe, xe_param_force_probe, charp, 0400);
> > -MODULE_PARM_DESC(force_probe,
> > -		 "Force probe options for specified devices. "
> > -		 "See CONFIG_DRM_XE_FORCE_PROBE for details.");
> > -
> >  #define DEV_INFO_FOR_EACH_FLAG(func) \
> >  	func(require_force_probe); \
> >  	func(is_dgfx); \
> 
> -- 
> Jani Nikula, Intel Open Source Graphics Center
