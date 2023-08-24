Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 738D7C27C40
	for <intel-xe@archiver.kernel.org>; Thu, 24 Aug 2023 14:30:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40D3210E55D;
	Thu, 24 Aug 2023 14:30:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CF4910E55D
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Aug 2023 14:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692887418; x=1724423418;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=9LETstJU5trFXMCy3Qkl0ifbpWblMCCT1gIzmzHiTt0=;
 b=RZ0wClIEnqMLvZSaKWE/+cRe/riNEu0PrjuZTR1PssYCK8V8sKtYWnvM
 hFFyjk7FMFqG/kenBSzWGK7wXyCpS7qm1UModz5VzNsAE51YYkRI5qcHu
 AOT9gAmZUvlqoHfrUUYIPFx4bIyzSyFIQYsGPlZBSOJmNth3fZTmtmscq
 MfnlvlwGXHPRt8yh0HoQvjNIZinsKMlPnWBJmDQ3a5VpRnocnC7yCOqH/
 xLSkEvjzQBdO9R6xkpqAV5+L0BOVDKWDWmK9/9kpcRU+7XCjzXE+CcjyY
 qo2RE+DgOYwZz6Qb1cxmfl2JOJROg1bRT8bYNbN2kw3vHO1NgsPcMoPCX Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="354782326"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="354782326"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2023 07:28:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="766550720"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="766550720"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga008.jf.intel.com with ESMTP; 24 Aug 2023 07:28:12 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 24 Aug 2023 07:28:12 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 24 Aug 2023 07:28:12 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 24 Aug 2023 07:28:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OOtL1Jmr/y8Kc+zInFcq5f9LEF0yfclSuyeyndXuf6zCEGnkIgDCfhzU2+hXtcmXwIz5VfbdL0L9aBv/yrpMwR5cjjTkglGARZLAC1JlBgavt4zqPdfYmW+QaStozj2i6YPbIr8D8Fb5fcq7Ja5Mv/chjDdEo1ddVeBeCZnPzt0KR1MBINpzp1gBnIr0DV6mWhE9JfIUh7oP47Uh74QN/8e2hUAQ16h7cORSQ/sC+wQLBh5u6/IOIZJlx4ARZcKXnRHnVCq7YZl7xRNRs2IVIuIsW6zRDU/2Ozj3RuFezfINacDscUs7nNFMvl9UShu1V2EN082S+jL8teDkXMp8OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PyH0cZ9yOoF7++wOGRkG/XnBQd95jGkLkZ+KXXM0KCY=;
 b=hB1R60OTdK72270bqJQLv9mebsMQDIn0D+jca40P8so6uNmY9jyIFVdAtrEQ860W4ASSFv/qw1Eqy4b6CxTAhmFKxBmMTODlpO8PgxsKQfMFlFUyLHIusGptFs1QOufCnv1OPAacnNPyej49AWbT+d542VGSxj9sn/OrH09b/tz6WcROJdwBZutk6g14vSSFIG6BYLuvNoJS/1ifSsTeZjDSk79DoCgrc83vriZKyogOGZJnDMTB+/AeoKupWfOzS7DFZYaAfy+fjay5NM2ymTRUSfkE2hIo+dnYNZKtAP4XkZlJoxSsIoIkcVvOWhNZXDWZ0Fjwr/8wHdDRhbVMmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB8571.namprd11.prod.outlook.com (2603:10b6:510:2fd::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27; Thu, 24 Aug
 2023 14:28:10 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b429:ee19:a001:eb69]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b429:ee19:a001:eb69%5]) with mapi id 15.20.6699.026; Thu, 24 Aug 2023
 14:28:10 +0000
Date: Thu, 24 Aug 2023 14:26:47 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Message-ID: <ZOdop3raHNPl1O/C@DUT025-TGLU.fm.intel.com>
References: <20230823175551.230686-3-matthew.auld@intel.com>
 <20230823175551.230686-4-matthew.auld@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230823175551.230686-4-matthew.auld@intel.com>
X-ClientProxiedBy: SJ0PR03CA0297.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::32) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB8571:EE_
X-MS-Office365-Filtering-Correlation-Id: 05dbd7bf-6979-4cca-4a8d-08dba4ae56f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5sVLqAXDmcfJbe0N8fRy/vo3by0L2R2d7mq/o5+rKBUxJcYM7OLP7yHIhcmqlnH5Uk61FsAg1ESwKT0oIJ/7AUnJ8mAp+He/NPXBUd6rPvOSQRZtGDmHASa5bvAMiVEnQ+E3Uh19M0Vb/BQFIPaCXdMMUyAHtR6PbNsLuVhr4HR56l3Yeu9hJ7MhKBdZC17jwL0Xo99GSUO+i6Bvjz2UzIdqE9f1SGaeyL8AfmszvE+jAAHeyWS4niealW2jMJn77kDxnhdkUOA9eJm9ja9e2ELpCYLBkcbYOefE83bBoYyoR8eQsoLqLpKHUQcAbr7rQ4KAvlb/VFdnyUZI/+0Wq2xoPG2sjMAQJfAvd9tiF+7+U6k+96ncxqOot+UTGiN+/IzJpDqYfXo4JGXPN7XbyFbYcNXvQTWGRdItfAqOpTPLgUE9/9kbQPfJ08HsDbrDZ/MfQQCQvy8Q5qB5Nqm+Es9dFTcVeWmno3k1ttRNo3SRwgyjPio8pugYZIpkqOEoFVM3/qS0HO9YfPN9/Q/blQVqbDalpF1+IpTW4bCEfi0k6zYoMAQPcpKY24XXd+v0d3t0mJTTxr61nNH3gu5WMQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(366004)(396003)(136003)(346002)(451199024)(1800799009)(186009)(82960400001)(38100700002)(8676002)(4326008)(6862004)(8936002)(41300700001)(6486002)(6506007)(316002)(6666004)(6636002)(66476007)(66556008)(66946007)(86362001)(6512007)(26005)(478600001)(44832011)(966005)(2906002)(107886003)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YkprBbW9iGytvxSv/AX/tS1UW1FTU4jAQx4VvaebKucXp/7zTIb/5/kkv4Kj?=
 =?us-ascii?Q?MWJm7VK3ZxqO6428tspjlU5hMQuAA+4luvopLGLKooL9+7AJEZDp5sECMn8a?=
 =?us-ascii?Q?RsplnxtDN/AE/yLKjByV0RrUir8gYeX9J4/YlU4Q1T8JI5TkiarPucrpoGrQ?=
 =?us-ascii?Q?eCRiiHNH/4C23EYh8msMQvQMp4n0sG+h49JlMxJlJz+UiJr0F1N3q2j4Y5cd?=
 =?us-ascii?Q?2NIyQ6KssbWMCWSk6mUxqYSpGvm5ioMzP2Q0D9SBeZ5z9WZVwbqp38+mqtKZ?=
 =?us-ascii?Q?kKOl82iyf2I0zWLCLQLDUw+HsO5TBr58szVMxwW3TIbH05pQOO0Dv7ldzKQo?=
 =?us-ascii?Q?ne+gq7QPcx/81gN6dKPddvUIosl4m1it9m/hg98EZ+jCE4Z1kbt5FHMHgdSF?=
 =?us-ascii?Q?kM9AjT7bWpwhvVI1vv+K2+XrG1cP8vP823DYC6a+loINfZov2Jq8EO2WicHN?=
 =?us-ascii?Q?iynYTdKUmJ6a0pADTzEQJZ7JpixpPvIxSJ9Sjni0fVXrgUP/wBZJCoDXziIn?=
 =?us-ascii?Q?YMU4sJA44xRMkhV6LIbAD0P5AO4+kd5hjGR9TqjPDQxLL0ofFCZ97PDvfLHe?=
 =?us-ascii?Q?5D2UfD2MJoIEub+addal/A3CNDz1E9XzJayedM8yw3Atmcre5uQ86gkHt2Tx?=
 =?us-ascii?Q?dLAoxzfDI0TChcYYiigs1pmn9kWurI1khHnhz0sEh51e6+WmWksSIsA/WVfu?=
 =?us-ascii?Q?YhOHiGSl7MauLadhVUfXYlt6nLA4fT9+xHVXyCXRE0wPxgTianhiarp2gYY5?=
 =?us-ascii?Q?2feIeA09gVhp7TlCgZGklEMUJ0bFZBBE/ukF9d6k4h5j0BlHWOUYQKz6x8pX?=
 =?us-ascii?Q?/zdaEAMsiAKoomtlo7rDsRk4v48oyZYDRI/WRfmtIHztIy/HpOeNF88Y75UK?=
 =?us-ascii?Q?cl3WO6aA8LgTw28+bi/incYG7BvcOJ9x0XvNqpt310x4gF0xuDz31zYRS/5h?=
 =?us-ascii?Q?5e3q1nhi0VVTfjwEUv8vk43hZrD3lVKGUYVKuNRXHrWxSMAVxLeZSG2rPq0u?=
 =?us-ascii?Q?sYl/4VmAYqg9JLqgoPLOrLhaxGr5uTDKO/VE/KyFgtmC/KtsUqwjN8PCSCHQ?=
 =?us-ascii?Q?Onhk8Iw5CwakzrOmb3o8WjJSEhi3EyiwFopd1rDaVb346LDRodvGkgZAzJ3e?=
 =?us-ascii?Q?CzsqyrbV/Yeic7pfs41dH96ZZc37yVlUhJMMl5I+uoWtk+YpQa5XldSsZUoH?=
 =?us-ascii?Q?r210jaRhon7YgVyzFyBKgR2PcVLBu6B++Ncd3RkcFY4x5TabCjbXFkUsiC2w?=
 =?us-ascii?Q?sdcFJmq62LKEgMTRk3zXsamo1HqJp+6NyDbznAJ8GZi6xpFNef3crDA9VLwJ?=
 =?us-ascii?Q?y9okgMyaGmX+kf9kBgOi3CALOR4hvHumqFOrQHSev4aVOmFLUGQwcyYpdd+g?=
 =?us-ascii?Q?Uer6Zf+Mf1OinPVOIYlOykp7YMYQLyop+9qr5WmvK1NTOKjigsXyJvtUGtIz?=
 =?us-ascii?Q?J2doCyZZVJOPLabJOr+D/HKlRQuwFRzaRlICQPtOxFhlz8N6EiWA+C7ISmgZ?=
 =?us-ascii?Q?31xHv32SUM1eL31u2ACkwZFd7CsCyHMI8K0tJIjo1GEfoRcFKoPPLRuxfv7o?=
 =?us-ascii?Q?24X6KPHy9X5AiccxaaPPI/S0irXlyzGRboz8BKC8u54M5UwwwR+oJSk6Tn5N?=
 =?us-ascii?Q?Nw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 05dbd7bf-6979-4cca-4a8d-08dba4ae56f7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2023 14:28:09.4607 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G2NphXX6pVfbHHZ45YVoehQIpNj6WqS5lUUuXOY8gOlFGJz4Gi5q4HxycvzJwj4dO3gw+7Tt4NbPGECtFMShyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8571
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe: nuke GuC on unload
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

On Wed, Aug 23, 2023 at 06:55:53PM +0100, Matthew Auld wrote:
> On PVC unloading followed by reloading the module often results in a
> completely dead machine (seems to be plaguing CI). Resetting the GuC
> like we do at load seems to cure it at least when locally testing this.
> 
> References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/542
> References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/597
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>

Seems reasonible to reset the GuC on driver unload, one question below.

> ---
>  drivers/gpu/drm/xe/xe_guc.c | 16 ++++++++++++++++
>  drivers/gpu/drm/xe/xe_uc.c  |  5 +++++
>  drivers/gpu/drm/xe/xe_uc.h  |  1 +
>  3 files changed, 22 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index e102637c0695..bbe06686a706 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -5,6 +5,8 @@
>  
>  #include "xe_guc.h"
>  
> +#include <drm/drm_managed.h>
> +
>  #include "generated/xe_wa_oob.h"
>  #include "regs/xe_gt_regs.h"
>  #include "regs/xe_guc_regs.h"
> @@ -20,6 +22,7 @@
>  #include "xe_guc_submit.h"
>  #include "xe_mmio.h"
>  #include "xe_platform_types.h"
> +#include "xe_uc.h"
>  #include "xe_uc_fw.h"
>  #include "xe_wa.h"
>  #include "xe_wopcm.h"
> @@ -217,6 +220,15 @@ static void guc_write_params(struct xe_guc *guc)
>  		xe_mmio_write32(gt, SOFT_SCRATCH(1 + i), guc->params[i]);
>  }
>  
> +static void guc_fini(struct drm_device *drm, void *arg)
> +{
> +	struct xe_guc *guc = arg;
> +
> +	xe_force_wake_get(gt_to_fw(guc_to_gt(guc)), XE_FORCEWAKE_ALL);
> +	xe_uc_fini_hw(&guc_to_gt(guc)->uc);
> +	xe_force_wake_put(gt_to_fw(guc_to_gt(guc)), XE_FORCEWAKE_ALL);
> +}
> +
>  int xe_guc_init(struct xe_guc *guc)
>  {
>  	struct xe_device *xe = guc_to_xe(guc);
> @@ -240,6 +252,10 @@ int xe_guc_init(struct xe_guc *guc)
>  	if (ret)
>  		goto out;
>  
> +	ret = drmm_add_action_or_reset(&gt_to_xe(gt)->drm, guc_fini, guc);
> +	if (ret)
> +		goto out;
> +

Any reason this is after xe_guc_ct_init but before xe_guc_pc_init? Seems
like odd placement.

Matt

>  	ret = xe_guc_pc_init(&guc->pc);
>  	if (ret)
>  		goto out;
> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> index addd6f2681b9..9c8ce504f4da 100644
> --- a/drivers/gpu/drm/xe/xe_uc.c
> +++ b/drivers/gpu/drm/xe/xe_uc.c
> @@ -167,6 +167,11 @@ int xe_uc_init_hw(struct xe_uc *uc)
>  	return 0;
>  }
>  
> +int xe_uc_fini_hw(struct xe_uc *uc)
> +{
> +	return xe_uc_sanitize_reset(uc);
> +}
> +
>  int xe_uc_reset_prepare(struct xe_uc *uc)
>  {
>  	/* GuC submission not enabled, nothing to do */
> diff --git a/drivers/gpu/drm/xe/xe_uc.h b/drivers/gpu/drm/xe/xe_uc.h
> index 42219b361df5..4109ae7028af 100644
> --- a/drivers/gpu/drm/xe/xe_uc.h
> +++ b/drivers/gpu/drm/xe/xe_uc.h
> @@ -12,6 +12,7 @@ int xe_uc_init(struct xe_uc *uc);
>  int xe_uc_init_hwconfig(struct xe_uc *uc);
>  int xe_uc_init_post_hwconfig(struct xe_uc *uc);
>  int xe_uc_init_hw(struct xe_uc *uc);
> +int xe_uc_fini_hw(struct xe_uc *uc);
>  void xe_uc_gucrc_disable(struct xe_uc *uc);
>  int xe_uc_reset_prepare(struct xe_uc *uc);
>  void xe_uc_stop_prepare(struct xe_uc *uc);
> -- 
> 2.41.0
> 
