Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2D56C54E5D
	for <intel-xe@archiver.kernel.org>; Mon, 18 Mar 2024 21:25:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E22A112298;
	Mon, 18 Mar 2024 21:25:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HS8LhRgu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2928F112298
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Mar 2024 21:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710797122; x=1742333122;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=sgEYqI4P5aEdSbNkNbCIeqVzwYQF5nNjdtWG+DjOD/w=;
 b=HS8LhRguCF8nQl4lj60qA0tiMV7XwgwzrRmTmME/5c3hdRpWkgYDybzF
 4nLpdSRFyDpAm/TF8qlXt5djdiL5lskqZX5Pu9+age/mPR+vmMpvbr0z8
 lh/zPKjm2EtCXUK2NOnaEDpbfR3oLSVowA1soxaLkywUJNfoF9qEHo4aO
 u2q7TPTD+L/ZOLmqfvIUCPWhp7GVi8AxGGz1rRzJE0MjRwhoDs0wtrkKu
 AsihPStCWHISrUX5nrcdmL7No8gqfC0h0dPCAVvyaUqBvv1kbCk3XRBf0
 JnznNwIAz7XrElIsXUhjFVov62hwirhxY43NPJhU+vk/ojqiQ4jAIDXyh Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="9439177"
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000"; 
   d="scan'208";a="9439177"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 14:25:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000"; d="scan'208";a="18287333"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Mar 2024 14:25:21 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 18 Mar 2024 14:25:20 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 18 Mar 2024 14:25:19 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 18 Mar 2024 14:25:19 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 18 Mar 2024 14:25:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Meepk/O6qQHhUbT5MCpMIGtja4boxRY6CiPRNwrKa/KIJgEWcNEjh4ikRdADP9lwI3YBBak2b06W8n/LVIhEgcr2QsTJqkIABN2OuYvkC07YlxdE468a3vZhZX1N3bjbuQhaVuML6WJ2fPVJLh0ZmEBW5biPxtcf51U/tAZjI7CYVw0HtkWUJYhwhR4uhl/WcPC8/BcWcrqqk4xgtDbvwpdbpG1A3ULz91c4iMTUE6esoPCrzjedhE/97AJt0ANbfaA2qOvji1WYXeqVUmVIvDDat9bb4UMoaPmCMfTCfjvPPD0zKG2bYMy9fVMGT/MgAcjL/IBwjgd9AQHllwza8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BWs/DHFZ68ZbS7XncG60pBNwkqJYjQilcJ/E3VygGEQ=;
 b=dDk8f8nDm7Ux0MgjTpj8bCCJ+GGCGKVw68l6tiBo4ib8ArTxWIp4N7kLPES8zoPiOYzfTT8NHEo5qbj3D8oYUyDUUEH9TI5oBPNjmIyITfJ6G4jh003ib2VXVbK/2zlkBLJnbzEHop0V+Vee6TxiQRuidzYRH9cvDuuBnLkHlfrieLoOy3+z5Sr6KQWP9cO7pehKQq085QaIBJ/3N2cnaX2Mi+4asIF7YAru/deWBYPB/7SpHIAcqvSU81+TD5nA8cQ90gD/DhDLZeGGBYQvNdTM8AFCFkKlgo9BCVDiUZpHrpYyuFHSk+cwDGwKJgd48UaFVydtany3J7OGxZ0gVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by BL3PR11MB6530.namprd11.prod.outlook.com (2603:10b6:208:38d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.20; Mon, 18 Mar
 2024 21:25:17 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189%4]) with mapi id 15.20.7409.010; Mon, 18 Mar 2024
 21:25:17 +0000
Date: Mon, 18 Mar 2024 17:25:14 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dafna Hirschfeld <dhirschfeld@habana.ai>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Alan Previn <alan.previn.teres.alexis@intel.com>
Subject: Re: [PATCH 6/6] drm/xe: Introduce the busted_mode debugfs
Message-ID: <ZfixOn45Wi8Z4xdk@intel.com>
References: <20240315140108.217862-1-rodrigo.vivi@intel.com>
 <20240315140108.217862-6-rodrigo.vivi@intel.com>
 <knthwwkn3a4oucvvprgg56lks5a2zgb3n5wegiisdkmlyp6jdr@yq5j5zggqbgr>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <knthwwkn3a4oucvvprgg56lks5a2zgb3n5wegiisdkmlyp6jdr@yq5j5zggqbgr>
X-ClientProxiedBy: SJ0PR03CA0112.namprd03.prod.outlook.com
 (2603:10b6:a03:333::27) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|BL3PR11MB6530:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pprTZfkjk7dYqIoLJRr8KswK4XA35Q7DeLV556xPsSMS/ojgvUzd0qjIWcMtwJUIUSWsli5GadeCT591VwSJ+maPDVrwq3uaz+TXTFmt9t2ZolGd/Q+Sodl7eR/Ppy55CeuneFB2P24ugseE1OP45ylddt9dTr2ZVp8va0UJUP82pYvabcUBrUQWGPGSqVSTz5dOb/mAsK5oU2QF7618tPb8hygmkEazxejweEjjMkVixdTXGEPRvegP6NW3dMDmcbEPfHiXyHQ1qGiZRG3atWHkVRsCqTM3bbZp6yF9kwqc/G3Kn2PXAZeESAz3xczTI45QfOgmm7ow8IbJJGoKFpf4qaMK5PEZtdK3ZkyaWSwS3sb8I8rqRlicO0dyEjQ2b0cNYNjuf9GnIYwMNVeDm+XVyjCye5VTHO+kN0zcQhEuHn3X1tehKRdkYSlaUIA9sq6WbqHc+WvUzXUI69KdoCQimTGyIE2HGOPwcHL9jPbRqd51UtvWyYVxnXeXQiM0aAvpsnX5Ed4AJnpW62uR9hs+qnPuKP6A/4WZSRRAmXCTSS5iuv9i6xPQpXQ4OiPZBC23cpQ5yiUtIcgp5G7pR595mqAJJ3fVcqAXBqwZrI9gcn5wpAh013JdcQ2mIhg+SpkGLGrrWeqxuLYnrK2HzsVwgERq5zZBK0ho5W0REvM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ru9mV28NFwY/Nvt/2Sr6luzdQ3OrLRUNLTFcIHHfUxUzkDRPDT8RmclK09xv?=
 =?us-ascii?Q?LN6XcPGlifIUF4iT0tNv9tI4LahwQDPmickMN1QloPFkUAjckJLa9iEsgJus?=
 =?us-ascii?Q?lN8Lgqzyxsq8zFAxXBRBjDq0f3HLXW28/g5w4igZtSWTgTyF3Ea2Zj1u8uO2?=
 =?us-ascii?Q?z5bmTXC/lQrD1xc5BBj4FZk1Ce6GnbWlqGg29wIAflIZEYgc6bzJ6ngC3evA?=
 =?us-ascii?Q?FYI1ASaDOKMoeIK0KMH+kyho++Nfl8hF0OXkXCWQ+NFtd008Br1VDJuk2/CA?=
 =?us-ascii?Q?pNi3g7tpL324aHGNF/JOwAUYe84fP0qYF8QckavRPDt7Zg3MUc1/2S8vhoML?=
 =?us-ascii?Q?B9L9znMjrA4usS4c+XDBFBWi+LTkDdsTmCk1wb7PDr/gAB9DvPVcWLSeP9Wf?=
 =?us-ascii?Q?w8k5KT/xap4EVZt1oRXfq7WxK0ScQ47GTHRzhbGeYJCuI8ffX+UXk1u/G3uC?=
 =?us-ascii?Q?f8wK9whkDdmxkeWIsAa+1IdqNwOeLXXrEs9qUb3MTYCx2okyj0MpdYpVN+lo?=
 =?us-ascii?Q?Qw2qPThZjA7blBveIO/aIMu/4w7hyjUOt0wzZmq6znj4p24pxvBgP4fAgc8b?=
 =?us-ascii?Q?rw1O9yp1RIlKuYCCwWWNe8qNASFRhbP4ZCK28XOcNE+6JOT2biNav53PeGpT?=
 =?us-ascii?Q?XNREAMltN6i60RNA1rEgwGVYYX24vmjsXDFJ3ljoBsmGrszncWz5P6crug5u?=
 =?us-ascii?Q?ml/hgnxk8cRy+GllezGHIBEHOadXdMd3tIaZPSTXkUQl1EUQ3cHhRqKygbGb?=
 =?us-ascii?Q?70PwklgdS9egpMuAJxERlPd+i1J8V7pwDWwsACynvX+KPuqdj3bJQL5lAE5h?=
 =?us-ascii?Q?me+6DjEJzmHd9ys/OXoKKLOVZuvAZLvHR+zBqESoW049kMVbLPeYvppPD8q1?=
 =?us-ascii?Q?z1wBVy1euj6NW9WxKHIPLPR7FqIEv4uY7ZVJiTCGXxvla5h7RiOUpPQ7FTKc?=
 =?us-ascii?Q?KJfxLqSz0UBEQx+mgp/3VR20QTelRC7Iutsw9Og6LbKns99bO9ex2WCT92L1?=
 =?us-ascii?Q?kylwGabRO6i43etOKvwimwcjkktaCMZ4HekoKLl5a/OeZkXSYaZKVH1Yb7cQ?=
 =?us-ascii?Q?jyPghsJHVM/DoL6C4u3hvkaDoSMmrYfj1X4boJSrBtXxyaBWHdvilK0CQ7S7?=
 =?us-ascii?Q?T7vU5Oh5DTnecQJkmUFfaVbCTgTmInzwOsPaQmlhbbXY+xTbr6b8aDK/0XsG?=
 =?us-ascii?Q?qJEtKMxZgVHbuw1amBrOPX8XtKxhKNGD8n4PEkKTroUcnHoR3X1eyNDRtE09?=
 =?us-ascii?Q?V1IUDnl/2fbd94T1/TnfVep+zB+YjrdALMvCBTKvZbfjbQ1fpvkapOepM2lW?=
 =?us-ascii?Q?eF8x6Y4KQU66i4PbDbfqAry0y9YLUO8ULRnnX/2xCX83Hl0FrYWS84wGwI6w?=
 =?us-ascii?Q?gA1VWgSZ/XMMDsx4nUfXZV7Bus+DPozD9EaTJAUO41dZrLeFAANtUEbYawGc?=
 =?us-ascii?Q?IB6vYJY7Najm47Me+jhlnEPqgIcVqkXVtrIPTY9+vq+/6xRK3U/JRoB+jVM+?=
 =?us-ascii?Q?5HlNResIUdj6V6D92r4mndFPppYWLqJW2Hk46T3zkwZAye1yAnYfhWPc/IVJ?=
 =?us-ascii?Q?CrfAH/ohyeNZY+9FzMHr5dshSRXM5+nbzWR9G2EQeHxv7DjPH2HQONwEGxvf?=
 =?us-ascii?Q?/w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f93ea42e-023d-4ede-e608-08dc4791e861
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2024 21:25:17.6190 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /wXUVaEoW68qaWgsB6iGuu8TDkLReNURt/4LopQzn0tAZ8dfeYuaWg9khw3HZUYdEAKjGCVUfGmj3ARszsOjvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6530
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Mar 18, 2024 at 11:12:10PM +0200, Dafna Hirschfeld wrote:
> On 15.03.2024 10:01, Rodrigo Vivi wrote:
> > So, the busted mode can be selected at runtime with the device
> > granularity, rather then a module policy.
> > 
> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > ---
> > drivers/gpu/drm/xe/xe_debugfs.c | 12 +++++++++
> > drivers/gpu/drm/xe/xe_guc_ads.c | 46 +++++++++++++++++++++++++++++++++
> > drivers/gpu/drm/xe/xe_guc_ads.h |  1 +
> > 3 files changed, 59 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> > index 175ba306c3eb..0cd20862d32e 100644
> > --- a/drivers/gpu/drm/xe/xe_debugfs.c
> > +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> > @@ -12,6 +12,7 @@
> > #include "xe_bo.h"
> > #include "xe_device.h"
> > #include "xe_gt_debugfs.h"
> > +#include "xe_guc_ads.h"
> > #include "xe_pm.h"
> > #include "xe_step.h"
> > 
> > @@ -124,8 +125,10 @@ static ssize_t busted_mode_set(struct file *f, const char __user *ubuf,
> > 			       size_t size, loff_t *pos)
> > {
> > 	struct xe_device *xe = file_inode(f)->i_private;
> > +	struct xe_gt *gt;
> > 	u32 busted_mode;
> > 	ssize_t ret;
> > +	u8 id;
> > 
> > 	ret = kstrtouint_from_user(ubuf, size, 0, &busted_mode);
> > 	if (ret)
> > @@ -136,6 +139,15 @@ static ssize_t busted_mode_set(struct file *f, const char __user *ubuf,
> > 
> > 	mutex_lock(&xe->busted.lock);
> > 	xe->busted.mode = busted_mode;
> > +	if (busted_mode == 2) {
> > +		for_each_gt(gt, xe, id) {
> > +			ret = xe_guc_ads_scheduler_policy_disable_reset(&gt->uc.guc.ads);
> > +			if (ret) {
> > +				drm_err(&xe->drm, "Failed to update GuC ADS scheduler policy. GPU might still reset even on the busted_mode=2\n");
> > +				break;
> > +			}
> > +		}
> > +	}
> > 	mutex_unlock(&xe->busted.lock);
> > 
> > 	return size;
> > diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> > index 43f0a88bbe8a..5dccdbe595bf 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> > @@ -7,6 +7,7 @@
> > 
> > #include <drm/drm_managed.h>
> > 
> > +#include "abi/guc_actions_abi.h"
> > #include "regs/xe_engine_regs.h"
> > #include "regs/xe_gt_regs.h"
> > #include "regs/xe_guc_regs.h"
> > @@ -14,6 +15,7 @@
> > #include "xe_gt.h"
> > #include "xe_gt_ccs_mode.h"
> > #include "xe_guc.h"
> > +#include "xe_guc_ct.h"
> > #include "xe_hw_engine.h"
> > #include "xe_lrc.h"
> > #include "xe_map.h"
> > @@ -679,3 +681,47 @@ void xe_guc_ads_populate_post_load(struct xe_guc_ads *ads)
> > {
> > 	guc_populate_golden_lrc(ads);
> > }
> > +
> > +static int guc_ads_action_update_policies(struct xe_guc_ads *ads, u32 policy_offset)
> > +{
> > +	struct  xe_guc_ct *ct = &ads_to_guc(ads)->ct;
> > +	u32 action[] = {
> > +		XE_GUC_ACTION_GLOBAL_SCHED_POLICY_CHANGE,
> > +		policy_offset
> > +	};
> > +
> > +	return xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
> > +}
> > +
> > +int xe_guc_ads_scheduler_policy_disable_reset(struct xe_guc_ads *ads)
> > +{
> > +	struct xe_device *xe = ads_to_xe(ads);
> > +	struct xe_gt *gt = ads_to_gt(ads);
> > +	struct xe_tile *tile = gt_to_tile(gt);
> > +	struct guc_policies *policies;
> > +	struct xe_bo *bo;
> > +	int ret = 0;
> > +
> > +	policies = kmalloc(sizeof(*policies), GFP_KERNEL);
> > +	if (!policies)
> > +		return -ENOMEM;
> > +
> > +	policies->dpc_promote_time = ads_blob_read(ads, policies.dpc_promote_time);
> > +	policies->max_num_work_items = ads_blob_read(ads, policies.max_num_work_items);
> > +	policies->is_valid = 1;
> > +	if (xe->busted.mode == 2)
> > +		policies->global_flags |= GLOBAL_POLICY_DISABLE_ENGINE_RESET;
> > +
> > +	bo = xe_managed_bo_create_from_data(xe, tile, policies, sizeof(struct guc_policies),
> > +					    XE_BO_CREATE_VRAM_IF_DGFX(tile) |
> > +					    XE_BO_CREATE_GGTT_BIT);
> 
> Hi,
> This commit title is identical to the previous commit in this patchset. I think better
> to change it to avoid confusion.

it should be squashed... it should all be in a single patch.
I will change before resending.

> Also, the 'bo' created here is only released upon device release right? It can be releasejhlhhhhajhhhaas
> immediately.

Well, I could not see in GuC documentation any instruction saying it would copy
the value and then the buffer could be deleted.
I just saw that we have to allocate a GGTT buffer and send the offset.
So I handled like every other guc command that tells that... that is to keep
the memory pinned to the end.

I will try to run some experiments later trying to set this config, and then
move to a suspend state and see how it behaves after the resume...

well, with that in mind I also want to play around on letting all the guc
buffers to go on the resumes where we must lose power and reallocate
everything back upon resume. Then, this will be just an extra case to take
care later.

> 
> Thank,
> Dafna
> 
> > +	if (IS_ERR(bo)) {
> > +		ret = PTR_ERR(bo);
> > +		goto out;
> > +	}
> > +
> > +	ret = guc_ads_action_update_policies(ads, xe_bo_ggtt_addr(bo));
> > +out:
> > +	kfree(policies);
> > +	return ret;
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_guc_ads.h b/drivers/gpu/drm/xe/xe_guc_ads.h
> > index 138ef6267671..7c45c40fab34 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ads.h
> > +++ b/drivers/gpu/drm/xe/xe_guc_ads.h
> > @@ -13,5 +13,6 @@ int xe_guc_ads_init_post_hwconfig(struct xe_guc_ads *ads);
> > void xe_guc_ads_populate(struct xe_guc_ads *ads);
> > void xe_guc_ads_populate_minimal(struct xe_guc_ads *ads);
> > void xe_guc_ads_populate_post_load(struct xe_guc_ads *ads);
> > +int xe_guc_ads_scheduler_policy_disable_reset(struct xe_guc_ads *ads);
> > 
> > #endif
> > -- 
> > 2.44.0
> > 
