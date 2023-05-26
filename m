Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9582C77B7A
	for <intel-xe@archiver.kernel.org>; Fri, 26 May 2023 16:33:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E00910E1D4;
	Fri, 26 May 2023 16:33:54 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7ACE10E1D8
 for <intel-xe@lists.freedesktop.org>; Fri, 26 May 2023 16:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685118832; x=1716654832;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=mYXSHhqpZnh+tXuwY+8MCnsShvzRmpAnWhlHYWGb9Y4=;
 b=JKHI+OfBlTldPM1YFwuOzytmIMEi6WDiNQEDD2aJoRYr9A0fud0pfTdF
 WJ2g/jGNjvXh0HFAXO5i/kaAQJDHeFfosBgr4Wg+3D+D+p7XVAIdEJttQ
 aBWXFAZH75Baw+0omYEC3IrGKh82x2ou9s/YYSjOXYhhP75X2qBYKYs6d
 O9aMm4SOHM5R8B0HIHoCUwKp8nf3HDf8FPI5ncKlQi/AfSdplxI+2sYeR
 O9xduMuZSWJLad6jMQbhxbhN27g08vgncIF5Y6nGliD22hfYoqXFF7VZs
 lJoO+CitNau0qNLL9FJqbBYy+GybnuOGp87RBpR/9ctoquIDDCqdILPfi w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="417729560"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; d="scan'208";a="417729560"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 09:33:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="879587454"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; d="scan'208";a="879587454"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga005.jf.intel.com with ESMTP; 26 May 2023 09:33:51 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 26 May 2023 09:33:51 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 26 May 2023 09:33:50 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 26 May 2023 09:33:50 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 26 May 2023 09:33:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H1UwqRUOsBi5eAgtTcfxWMXaVWRLh+UjKNAwpkTdb0wZZ8I7tVvoq14h/GG2M0YtUfxOJ0ztEnIlf/254T26bTHS1Vve5lxfS0tP8YKh2eWy9xsRpQ8v90P5f+zA8klg4dNA8WnrrvsYIvtx8KNPqyy4FOz7zmG2j8wP6OUwd5fb1nkAYWFdQsIW46YSPsP9NsjP9H22Ss5SDArWKXRFkMD4mHqoiasLcz3emVTHMS3Wddnt7nOs8wHHbfCWgP0alPCyrD6rLJE75ossAvwGMeJ3yv4CFbc9S8Q0Zp1GwbHtxKKP8tkfwV33mFchuCz9gfhtarG3lfYMJorcoPXw4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Av2o6wvWnFtWAIoNqvS/8fsGQ/f08VooeBtDqAEA0ws=;
 b=gwGy1Dka9FJIGL2GrN2xk90HCM3FtsHH26ayBrj49leVCY9ew/3QUpcTplPB0xpbXFejUgVglUocuYjXuBFxFwJA/dNc0TcpNsQrDk32c3KXCQ3kp3Q1XQWGO8vAhAb8ibpxM+d/B8gz/9kVkci4+Ifer3Zg4wL+r17JrNqnEfhpUweZDS5cieaEjoH7lg6rD5bGM5l4RFd59ZTiiOhqUBFIaHzjUfZYl3pGHVkQt1hg1JWlgEFV/xx8hGH0flBuZVbEhKBvPI1PtumNQAuBJHURlWMI5gQMOvr3HkXPUghpl5rOjwlHMGU/ZnH/vAVfvEfLe9sHF+4lxky8ZOxsLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW4PR11MB7054.namprd11.prod.outlook.com (2603:10b6:303:219::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.19; Fri, 26 May
 2023 16:33:43 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6433.017; Fri, 26 May 2023
 16:33:43 +0000
Date: Fri, 26 May 2023 09:33:40 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
Message-ID: <rf5ntetoiotpyto3pc2ebgxpcnobu6hgpyqckippi5hkkwuvby@foh3n2mpsu6n>
References: <20230526004235.745730-1-gustavo.sousa@intel.com>
 <20230526004235.745730-3-gustavo.sousa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230526004235.745730-3-gustavo.sousa@intel.com>
X-ClientProxiedBy: BYAPR06CA0072.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::49) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW4PR11MB7054:EE_
X-MS-Office365-Filtering-Correlation-Id: 26e14b0b-2100-4792-99f8-08db5e06f7f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Rg1fB3QXAjrVzc8004fTsZCChjOCJCpFLgmUXP6Dl5CI8lrev6p2dbryIgKZthEhuocz03w9xVhUL4MwDC8JSPHG6DJEjT7JyDzF6L1JYOZLePCLii3nORTZiZOiCxEXpD4euXC/JoGIU/X0sUD4x59z0nyoSmP/eDxDoqn+BP+F/cdqB8stRnvsH006q87BToD+NZYUp3xhAOCoMdkV3BjNYFkWnc7aTa1zlUpRSGubhopmJbO/V0RIus7hTN/wWaycQfU5n5zLwIgNZ1UajIhbhv9yV7pM8CeMzCXXEY1n/+UQorqKkBXNhdETD8RMltCHwBRF3l4GqOYBlL56Aw0y1Pzquz1b1SQzR7N4oVMH9alz27au5s4OA6niGnNrK57DpJ3glqH7wfYWuFuRBmlKcMbPNbvpadIkNGblYpjqdM0hIxt9FfXOgRXkvk1Ut/YjrqlZy88dknIMY2bfCl+qahVEAzyweYEdm2MWA5N5E03CeCC9phD5KFQjNVoFgV6beF+/Vv+5gNXxVmrGXNv49PCnTJxzrFXX22kV5ZW79ZHOdessGHVwSC5rVk+Q
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(376002)(39860400002)(346002)(396003)(136003)(366004)(451199021)(4326008)(316002)(9686003)(6512007)(6506007)(26005)(6636002)(82960400001)(66476007)(66556008)(38100700002)(66946007)(6486002)(8676002)(8936002)(6862004)(5660300002)(41300700001)(33716001)(83380400001)(86362001)(478600001)(186003)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?C7MSuqz2encgNoNHVyE2tAgeKIi0Vdg6Q2UuZhKufuNS/xbiBA2mLXshsDZp?=
 =?us-ascii?Q?B6Gw4lxjgNBUnIYgHYMYP7ydcvuspOEZ36UFmPXGUjBykV3KIZ8cPQI5XBeI?=
 =?us-ascii?Q?+brhmc7sVW703CHVydtR7urKL4z76bIPHNOlyO9jwi62t3jfUaDS28kK8VL4?=
 =?us-ascii?Q?pACBbI1KFxjGezL61M/2zGUc4+NoRX9hxVZrWlyS1DhSDNtseF78mNjaw6WS?=
 =?us-ascii?Q?MSjfF6Idv7EtFRpmjwr01N4nDNcT/q98qAJjijTOx0ObJ6Gn1LugIjy/wVxV?=
 =?us-ascii?Q?di2LSw6+i5/5TDg91SUPpHMHyzWY0V3lQNkZRNCbgTL2K123hwwjt4xZhti2?=
 =?us-ascii?Q?RDvrAyunoU+7g0xp9KMmjszcZ4CFw1zS0UVM549AVDSPykyOFdTte8pvK3ox?=
 =?us-ascii?Q?L1bqVMxeI+gEybJUL9+Z8ow1KfiuxaPURf9Rc9bPSfxcJ2cDWcf4l3zOecpt?=
 =?us-ascii?Q?MO/Ce7Wx2FEl8EmxIJEnqj4WsZgtHwNjYtgFvS6C9z2tTJxGSH49YbpjohS9?=
 =?us-ascii?Q?lnd756Ec6MQjRQtImby++798R3+TPpfDTSV9E6wEQSpALLuSHyr+SuAJVTZz?=
 =?us-ascii?Q?Frv9SZBtcTfmIj6GAlVpvuCBK7HEOLtIsWyJB4gXGBd7UD75/wAHL3qVyT82?=
 =?us-ascii?Q?kjd5Kc7SWUJVZR6Wq/9TVSrKDUSHSkwvwvWxB5MCSpeZQeaUfjb9Xr33zgIR?=
 =?us-ascii?Q?uXVwMm9/Acg8uCiAtzV8juwf8wdqMRwMk0mc4Qs+7iYgsEUbpcMjDP6uNZ7o?=
 =?us-ascii?Q?1aQhZBfGpPg8ALZHkDatluCrhTxCGdIA3T9rKgR+h3KICx+aSNRxqWf5lUjM?=
 =?us-ascii?Q?WgbRaxrGzxNopPeyCLvmyZZ+x6Za/JHFHo9zK8/tufd4JB5TmyRJue7m89RF?=
 =?us-ascii?Q?h9Hg2QLoG0C+w4g+srASz41VBLv1/g+5nKcIUMs3kxrpqgFTkcZH6zdEm+AD?=
 =?us-ascii?Q?X1rTdoXVb3s9k7T/9C9Xt/+gegm0OmwPF3quEbI7UDvl6z1SfYASYEaOpY9F?=
 =?us-ascii?Q?hbOhBf/XxHR34gGuikXtBpdKz+3RUt+T9v8+7M2+especIdIBmzkEZk8SLLX?=
 =?us-ascii?Q?VF0olkSrzOKftMtCJGjIbkTGleud7nEKlpj+VY9cD9e/SxLDocubMdLG6NyR?=
 =?us-ascii?Q?+KkGS+yWMUoY20Lohl+wFCo75w9xgP768zdl5jcI2DkG7f6IVZELMosGQs0c?=
 =?us-ascii?Q?2tmYyfAJ2/w0Cxp+lXVAOi8P4pb5yfFOZW172IUSmZXKpvPs05TkQ+eDBV6o?=
 =?us-ascii?Q?Aj43ZfkZt89IK1KlMgtlNuhvatdbt7YVQNOwONV7aAbl6Niz1YYG/tkKr79c?=
 =?us-ascii?Q?U+7nf4kPhhrrPTB0s0zZ580CxBYy9JyLr/cuA7fiTLI7S4AGQMrucpAiltOa?=
 =?us-ascii?Q?i8WkLVnWK+GhzKjeFc2AUrwapLpzJMfJDAuwP2zVsxWqR3+RvO4k20N6ksr8?=
 =?us-ascii?Q?aDoQhvr4abFsQLCwWlySfDmpMSvitE9WVl04smaVSDEzqSGvlX08QLY5cVMS?=
 =?us-ascii?Q?rxjTTRilLsvFtb6c1/mF96JCsXhpY7WZVyr0xQQwy4Ac3k7nNSYqzboKD2Wf?=
 =?us-ascii?Q?+uE98CD0FQsTcf44a0HsEfomNrFqRAJJ0xAKVdiaEHpjPzmFseSWF0iuuqOk?=
 =?us-ascii?Q?hw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 26e14b0b-2100-4792-99f8-08db5e06f7f4
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2023 16:33:42.9378 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Njxbi7UfGCxa3gKlhlE3jcWKxunwegz8Moi1D9U+YCFPCVYIYujfMuH60cMnAd/gwHrU1w/Tr41B4RBRl2L1MOv+Xeooz0g3MPEAxaX86a0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7054
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe: Replace DRM_ERROR() with pr_err()
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

On Thu, May 25, 2023 at 09:42:35PM -0300, Gustavo Sousa wrote:
>The former has been deprecated in favor of the latter.
>
>Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_reg_sr.c | 11 ++++++-----
> drivers/gpu/drm/xe/xe_vm.c     |  3 ++-
> 2 files changed, 8 insertions(+), 6 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
>index 24d9c73ef279..4266999cdeb6 100644
>--- a/drivers/gpu/drm/xe/xe_reg_sr.c
>+++ b/drivers/gpu/drm/xe/xe_reg_sr.c
>@@ -7,6 +7,7 @@
>
> #include <kunit/visibility.h>
> #include <linux/align.h>
>+#include <linux/printk.h>
> #include <linux/string_helpers.h>
> #include <linux/xarray.h>
>
>@@ -123,11 +124,11 @@ int xe_reg_sr_add(struct xe_reg_sr *sr,
> 	return 0;
>
> fail:
>-	DRM_ERROR("Discarding save-restore reg %04lx (clear: %08x, set: %08x, masked: %s, mcr: %s): ret=%d\n",
>-		  idx, e->clr_bits, e->set_bits,
>-		  str_yes_no(e->reg.masked),
>-		  str_yes_no(e->reg.mcr),
>-		  ret);
>+	pr_err("Discarding save-restore reg %04lx (clear: %08x, set: %08x, masked: %s, mcr: %s): ret=%d\n",
>+	       idx, e->clr_bits, e->set_bits,
>+	       str_yes_no(e->reg.masked),
>+	       str_yes_no(e->reg.mcr),
>+	       ret);
> 	reg_sr_inc_error(sr);
>
> 	return ret;
>diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>index 4d9c8de8b348..89d8240ea6aa 100644
>--- a/drivers/gpu/drm/xe/xe_vm.c
>+++ b/drivers/gpu/drm/xe/xe_vm.c
>@@ -13,6 +13,7 @@
> #include <linux/delay.h>
> #include <linux/kthread.h>
> #include <linux/mm.h>
>+#include <linux/printk.h>
> #include <linux/swap.h>
>
> #include "xe_bo.h"
>@@ -3019,7 +3020,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> 	}
>
> 	if (XE_IOCTL_ERR(xe, xe_vm_is_closed(vm))) {
>-		DRM_ERROR("VM closed while we began looking up?\n");
>+		pr_err("VM closed while we began looking up?\n");
> 		err = -ENOENT;
> 		goto put_vm;
> 	}
>-- 
>2.40.1
>
