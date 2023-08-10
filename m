Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47CE9C001B0
	for <intel-xe@archiver.kernel.org>; Thu, 10 Aug 2023 22:17:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05D5B10E073;
	Thu, 10 Aug 2023 22:17:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0586510E073
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Aug 2023 22:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691705859; x=1723241859;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ROYrziYmrz6KwS+FQQGJcZemQeSAbKw+PIDMfFcSoUU=;
 b=Asiw4qz0Z2m+XAUKKLoc2n5//dJb7IzgEl3bWMRQqshsBUMS6mNYOUDK
 r44iO3o4QlFkvZMZddndymqbDZxcMACUeN9xdh+0lntMWNe7i6dUZSZwx
 PFKRepSx8RhGFacqxn2rQ9iYrexxb1/oGH5nmlTQLC5fX3AQ8SAw/pXqj
 UCNd4k17jrmst8QofssAK2AkQ3pP3Jf3rt/GUre4S2cSupsPxXAAJcJ0+
 2p0eCmjKZIlEIurGaPDgh9x1ehdShsuSvU0b9KOFC1XnrWI/8HTsp1f3m
 QlFLqnOkBAvvVD8crVyiljNS1RofYedP0jCW1fpnerQTXjjfxgH6pib88 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="374303260"
X-IronPort-AV: E=Sophos;i="6.01,163,1684825200"; d="scan'208";a="374303260"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2023 15:17:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="767428571"
X-IronPort-AV: E=Sophos;i="6.01,163,1684825200"; d="scan'208";a="767428571"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga001.jf.intel.com with ESMTP; 10 Aug 2023 15:17:35 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 10 Aug 2023 15:17:35 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 10 Aug 2023 15:17:35 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 10 Aug 2023 15:17:35 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.104)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 10 Aug 2023 15:17:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Irsee3qcIiykvepBQp8hqSTtytgBvhuRa4KrYue0tUSxxVrCL07RD5o6gTLUjfvckVKWxzoz/Frvgy6bqtEqN2PZRoH5JNICxhbnyn56Hh2dOYDsV04cY62wG04luGYiPSZIpm3ixf7W/oirDgK05gvHdlLbmx2t8gkfeNEM9GSe8EV/WHzcj3Ets9aov4mdEC0jkHUUsaJKW8Hm/h8lfOX6v5Nbd0h3gxbP/ZtZ4IF9DgYEPPiwFcQzrQixAvd1qA6JAI70uwtI6dsvdqVYwla26sKNxPtpZada4HxhYq5jMDRBVstRi2bMX/TLVfIY9yXYINyC7nAIiV6O8jBgWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mnZ5usFruCxMYXN2NlFdbjxOK4VStkVSa+p9JhuEKK4=;
 b=K5VybgJDneeB53HHUPa51M5G9aPi04IGuhpAU4laEQXMT7PPUY5A6gZ8/oQZGUsZU0fZbxpwvx3kHFoWNxdIr4s80aXB3jQslFZf434zm+PcXhJVvrWchz6JlixlguO7+jIW6kT/ZqiFDE0ChsrspycCBUo9SwRVMdUVyh8GmZq1wD0KHFaXLVneyhz16l63k9f3J+rRbSPhQmZFJcCswLsC8mrRnS2aacm3SMDTD/1Zrp8k1AZNjfF6hYQDXASkZh735grnOFZfKq6ZvOTX4gAOTmZkUjqFzCTTr6xB2QfJc7NdzGHjrF38aTbGhO4pGrXjdvHIC9AEIo14yTcqNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CH3PR11MB7723.namprd11.prod.outlook.com (2603:10b6:610:127::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30; Thu, 10 Aug
 2023 22:17:33 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6652.029; Thu, 10 Aug 2023
 22:17:33 +0000
Date: Thu, 10 Aug 2023 18:17:28 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Message-ID: <ZNVh+Ph/kaOQm8ex@intel.com>
References: <20230808164534.1027552-1-david.kershner@intel.com>
 <20230808164534.1027552-2-david.kershner@intel.com>
 <ZNKM0WeE1vbZ1Yqz@intel.com> <87edkcse9d.fsf@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87edkcse9d.fsf@intel.com>
X-ClientProxiedBy: BY3PR03CA0016.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::21) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CH3PR11MB7723:EE_
X-MS-Office365-Filtering-Correlation-Id: fb473685-7b1f-4da6-6d37-08db99ef97d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iu//jDOdegnWmvhteceK+WaKpw2NzOTY8+8q5u3dFuum9mDkY5LJUahpB1RHkOQe76FM8IPNuUW7glpVXgdFOtaaJCB8XdLO5PVox66mNF+oLhPzyHuMv/JirqyhUTUFJZcR5wUhxE69ke67fHzqsr/dH4bnt3GD+HZ9a4VsEBd+Q5nI+e9y4PghdMB9KlF2vFQnOxQ5KVviEuAe51IBbb7Xh5Zy42rodwjT4rMcqG3bWgMEGHT127ZKRv+AK+RjhuZ0gcfXfY1conhKv/6QnF5EfFEiy/WZmtkgCfOpfi3u4zUJU/BoPChlbMYlRzv52fhyYhYJZ7nZG5nX37MrQ4wt8G8lw93u8Fz4vvD5Ckut80IK+c/QyxQZHi7eo9q+w6G8lR4udg34LJo0zBLeMJ93aIko53FiA/Zbuu0WE/HjYWF53hne5Nm83srXW4jCdLuEIIeFGIzf8D1XAiUpb+yKc05js1OzQ7yRmuBMov8UAOuzAPg+9FYE7miSMA64pYkrm4BCVfDwGnZxQawqa4m2CIwnMSAOzCAWsT51dTiCakJiwBhYSWuMsuxu8hj+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(6029001)(396003)(376002)(136003)(366004)(346002)(39860400002)(186006)(1800799006)(451199021)(2616005)(6486002)(6666004)(36756003)(6506007)(26005)(82960400001)(6512007)(5660300002)(38100700002)(4326008)(66476007)(6916009)(66556008)(44832011)(66946007)(316002)(2906002)(83380400001)(8936002)(478600001)(41300700001)(8676002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?ab6eAUmpNXTKwDAFEXF5MIg0DgzTtyDSxzEPPC04chr4mrkqL+3oQUUZB/?=
 =?iso-8859-1?Q?pjV/K1pGx6QO8SnF3j3VU2illlLoKfOlBHvSjYEse8ULQm0QLmgc5xT2L4?=
 =?iso-8859-1?Q?oLigX9Tr/LwUHL2oHb+JIrMoP2UKtjs7wFqiMjmANJ/VwNSXKk1zLCsV4H?=
 =?iso-8859-1?Q?1URbtpp0bwmlBaCSmDfmN7EWyTujl3//tZDJu3naov8G17o5LQL627ts0C?=
 =?iso-8859-1?Q?N9fpfZOSWxGBIuOvRlWrrFyvdd3qR6i9H1letYvyn9lLZrnfS4q9WkwDNu?=
 =?iso-8859-1?Q?JHPxZoKzRmUHsZqVK7rU4syp++iAiWlgds5JIMpWbXycEXSCoVqJVldXNv?=
 =?iso-8859-1?Q?fR7MTxNB/61ICFYt5PakV9T1Zfh4DxClYXBOCybY3czzhCshFYrSDEYteE?=
 =?iso-8859-1?Q?896k3LaBJvh2swynqdX4oto0SqrXt175gcjbNOIQ2YZIEjxP6xh3rC4I0w?=
 =?iso-8859-1?Q?E7CJ1Jb43j+Unzi89Gt+QaHq+E4P+OVDkMxHMOfraWqUKAuVS03XPXg53w?=
 =?iso-8859-1?Q?/bmmXTrwvxFznmYXvltM4vGywBzK9Ik3hRqhHTfBztQ3pLYQk1DQqSL4z8?=
 =?iso-8859-1?Q?j5WSwXRi21Re67VTZOoJWqNyQUw6iXfGYfSje0W4ZWHkSmyQ6w4k/pzOu9?=
 =?iso-8859-1?Q?vD5iUHjk4+H7KWmKGxTDz3acfTFXj901moqAhQHuAHG0UakWEWDCpbH//G?=
 =?iso-8859-1?Q?XWRLmrPyO9GNe077ICKhw0dSWJl1Lz5k50z7IuQxHgW/uSnMe0pGnTqOtp?=
 =?iso-8859-1?Q?UudqmU/T66et74Fg49t/nID0gl8u1Wk9wVKSQWJT/YhADa4jF00b+CYreO?=
 =?iso-8859-1?Q?ZuojUCTPlIHJHP0uDsm0LFUv4NmxCWS1Nm53w9jzbVxq77V+j1IOIEddy9?=
 =?iso-8859-1?Q?uI4w8tu11Vkob324RC1BUyFvbueD0wisA7phd83rut7aAlEvw5KzEDK/lh?=
 =?iso-8859-1?Q?O3jArz0gfNt+aIPMSajFMWurCNqF/W5lBwfpjgRKZgztGbew7smH8KqkaM?=
 =?iso-8859-1?Q?8m3gF27cOBAPtdBHLO66cDF5dzsnBCsm9UWORIBxVA7N72LoCFNvIYwKJk?=
 =?iso-8859-1?Q?2OjDp7oSWltDCTovmdrE+/tYxTRncFywAFeIgzu+oR5+kH1osrwUZfspug?=
 =?iso-8859-1?Q?7CjWncli4bAzq7QL28dLKKHn4HJNyneU73PeEyVsV3MTBVoeaT927yWlu7?=
 =?iso-8859-1?Q?1y8ukf96BVlJ8es08eEA6nwOF4DLJ4ZelWRVrJ4HC/4MwRLIbNIgAea5iv?=
 =?iso-8859-1?Q?8wgQqnYxa9GKuXofmrl+FEsF/B8rRpVO+JEUxJ20pGojio6TOCAAYWSXiU?=
 =?iso-8859-1?Q?rhhHB2KNxopXERH2lz7grawrc86N4G7rgMdjcZaEenYvDxby5m+aLU9f89?=
 =?iso-8859-1?Q?Kd7xk8qNBEwU0xNwo6BeoVXEAdKqGxdyZIhzEywIq8cSsgS7EGTrXD38Lx?=
 =?iso-8859-1?Q?GF42smIhXzdVPtjEf9lRHatP6UhXId4pusKjnEq41U15e6LuPETH+q3Idd?=
 =?iso-8859-1?Q?nBQFbV2aXFaEaPH/SAZZIjZSAn4j5PY1y59uc2q0zBP3kQ7Slb50gSl3mn?=
 =?iso-8859-1?Q?1QU7c8RIDBxBIASRz4nP1O9cbszCdmLOj9+uYEDJlaFHIOzogQVcw32q+b?=
 =?iso-8859-1?Q?XXTR+XdDoSIivVTSFtqrn2/+kgcJZ9ZYE1wByHeiTJoFV0lbsedtaUGw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fb473685-7b1f-4da6-6d37-08db99ef97d4
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2023 22:17:33.0346 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yx9P1bhT53aUutPv6JTkcHwsp3dsvq4HU3ahAjvWCPkFk7xmg4FLptyohF32TLvvA3cB+QgFpknHazCuBO+dgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7723
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/3] drm/xe: Introduce a module parameter to
 control XeLink
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
Cc: lucas.demarchi@intel.com, matthew.d.roper@intel.com, john.fleck@intel.com,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Aug 09, 2023 at 01:26:22PM +0300, Jani Nikula wrote:
> On Tue, 08 Aug 2023, Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
> > On Tue, Aug 08, 2023 at 12:45:32PM -0400, David Kershner wrote:
> >> Add a new module parameter to control enable/disable of the XeLink
> >> feature.
> >> 
> >> Signed-off-by: David Kershner <david.kershner@intel.com>
> >
> > Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> Basically the direction from upstream is crystal clear, and has been for
> years: never ask users to modify module parameters for normal operation.
> 
> Also, it's not possible to adjust this per-device.
> 
> Why are we still doing this?

Well, the last time that I looked to it was many years ago. So, someone
from the XeLink team can correct me if I am wrong or add more info.

From what I can remember, the DPA configuration needs to be set at
probe and after set I'm not confident that we have a way out of it.
And if that was set, the SRIOV cannot be used.

But right, it should be better if we could rewind the DPA settings,
and unload xelink when SRIOV starts?
Or do we have a way to block the 'child-modules'? Maybe that would
be better than the modparam itself in case we cannot rewind DPA
settings.

> 
> 
> BR,
> Jani.
> 
> 
> >
> >> ---
> >>  drivers/gpu/drm/xe/Makefile    |  3 ++-
> >>  drivers/gpu/drm/xe/xe_xelink.c | 17 +++++++++++++++++
> >>  2 files changed, 19 insertions(+), 1 deletion(-)
> >>  create mode 100644 drivers/gpu/drm/xe/xe_xelink.c
> >> 
> >> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> >> index 1b59702cd9f9..d46558cf12a9 100644
> >> --- a/drivers/gpu/drm/xe/Makefile
> >> +++ b/drivers/gpu/drm/xe/Makefile
> >> @@ -115,7 +115,8 @@ xe-y += xe_bb.o \
> >>  	xe_vm_madvise.o \
> >>  	xe_wait_user_fence.o \
> >>  	xe_wa.o \
> >> -	xe_wopcm.o
> >> +	xe_wopcm.o \
> >> +	xe_xelink.o
> >>  
> >>  # i915 Display compat #defines and #includes
> >>  subdir-ccflags-$(CONFIG_DRM_XE_DISPLAY) += \
> >> diff --git a/drivers/gpu/drm/xe/xe_xelink.c b/drivers/gpu/drm/xe/xe_xelink.c
> >> new file mode 100644
> >> index 000000000000..51a31f6a4740
> >> --- /dev/null
> >> +++ b/drivers/gpu/drm/xe/xe_xelink.c
> >> @@ -0,0 +1,17 @@
> >> +// SPDX-License-Identifier: MIT
> >> +/*
> >> + * Copyright © 2023 Intel Corporation
> >> + */
> >> +
> >> +#include <linux/moduleparam.h>
> >> +
> >> +/*
> >> + * This module parameter is needed because SRIOV PF and XeLink are mutually
> >> + * exclusive. The driver needs to be able to enable/disable the XeLink
> >> + * infrastructure (specifically Device Physical Addressing).  Since there
> >> + * will be no enable/disable for the SRIOV PF path, this parameter is
> >> + * needed to explicitly disable XeLink when SRIOV PF is required.
> >> + */
> >> +static bool xe_enable_xelink = true;
> >> +module_param_named(enable_xelink, xe_enable_xelink, bool, 0400);
> >> +MODULE_PARM_DESC(enable_xelink, "Enable XeLink feature (default: true)");
> >> -- 
> >> 2.35.1
> >> 
> 
> -- 
> Jani Nikula, Intel Open Source Graphics Center
