Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 027A5C982CC
	for <intel-xe@archiver.kernel.org>; Wed, 16 Sep 2026 15:44:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC60010EC7D;
	Wed, 16 Sep 2026 15:44:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R9JWG01j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7B9910EC6C
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Sep 2026 15:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789573489; x=1821109489;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=SqMXiLWcwm2Aqvdybq8j1R7xMpOuS75bX6Y98tV6Hh4=;
 b=R9JWG01jHwDNp9v26CImyqRMQBOI+KNSRHvE1f1PFkrqwAOcdEzm187e
 kgXQcr6qgDg67gtVhgx4PF71QTv/sZ2tojpIPKAfiqu5XFm9h8/ojlVxM
 DSuAhaMAe9ssVbR1kACcUFOc2/Wuh1aru4YvFVfYuoc5+R8gD90kwR5ov
 zLTJIjtoMGMUtL61yXlZeBoOftSWKPjhgDqCAO3JJiw6v++2ghpciOZm5
 TqbsfntRrTruNGgD/eo+Zxf3hNBYxXWFrr96OMDWKHaRbvMckv3e9hoHQ
 rA/nK7nRpk7ljqXtg0MhyceZXE+tnrB18BpuyWdHLUSyrFd8DlP+VhGLC g==;
X-CSE-ConnectionGUID: GA+/IRYySBCjjlgrGkUTZw==
X-CSE-MsgGUID: emw8adrjRnqQc9FmdZTaNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="115489833"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="115489833"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 08:44:48 -0700
X-CSE-ConnectionGUID: Ix6jIQo9SBSN61Uix6GiqA==
X-CSE-MsgGUID: WLRcTPkdR1uErKN1Bhu4wA==
X-ExtLoop1: 1
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 08:44:48 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 08:44:47 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 16 Sep 2026 08:44:47 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.27) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 08:44:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KBgPBaEnCtxhgylJeml7vExeeoOhwdx8OuvqZ3Ar0jrO2orPWtDqhkBlj2CgvWL0iK+He5mpm46K7C8h8n6P29OAJskyn+YYfzcl6fw1ifejciQLGwjWlaYPB4pmliN5lbzVdI0KVJQig2bzNBCIvYtoQpnzAAfpDvMUsEjwXQ3XJJP6K81SADDmzobDLc9tgshvH3pp5ZUIl9aIFFVF9rveXXkHDz2YIcZOla8R/jlpAw537xum0dqBUADzc26WgE+y0Q+Wdl6qfuzxBe8rNRPD68HMg7dYo3a6C7wQS1PlXfBY65nwZE+HXqnkbTM9D3NhdaqIUg73VfBDDJZWeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WZ+51t2JSXiH+5AygBeLcoxC26yXF4GoslkypcpWVx0=;
 b=r1kbltw1XCXRjTqdktyIHsPnZAONeXo7WOUM9pvVyZTRuTdMnUrP5xmfuUeH1Es54A3kH4N71dErqioKxabunyk8P0qraR19fBQyIXdfcDjXUMkWfaZz2SuzWFrd+DEeF7TOC3+dPC4rQixQpKGK8nhKRu6HmMsA+rLKKdjqiKVXMYwEnNbYGkEvo5v36XNBmHAFiK5HYOL6G4HuY6bi+gzQZMVo47McKs3Glg/EymtMhjprMq9ztfw0YoMiuosyaqkmQ1rmBqSZG7YPNXThGtfq2c31ynMWOSARvpQhXh4wgCN9b9wVs2ZmfdLwLlIoSparYuEz4QWj4hdM1x9kgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by MW4PR11MB7103.namprd11.prod.outlook.com (2603:10b6:303:225::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.8; Wed, 16 Sep
 2026 15:44:35 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0406.007; Wed, 16 Sep 2026
 15:44:35 +0000
Date: Wed, 16 Sep 2026 11:44:31 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Badal Nilawar <badal.nilawar@intel.com>
Subject: Re: [PATCH v5] drm/xe: Poll GT for C6 before D3
Message-ID: <aqq5X5O_OXqN-TXC@intel.com>
References: <20260915210113.2915363-1-vinay.belgaumkar@intel.com>
 <aqqJXsFuaAo0rGq5@intel.com>
 <b324f768-478e-40dc-b752-e0db1fca2e8b@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <b324f768-478e-40dc-b752-e0db1fca2e8b@intel.com>
X-ClientProxiedBy: SJ0PR03CA0223.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::18) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|MW4PR11MB7103:EE_
X-MS-Office365-Filtering-Correlation-Id: 164b0b06-a98f-4c59-e1fb-08df1409687d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|366016|6133799003|4143699003|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 7k28Qbvi7OM6uYhaKzVj8QIesGdi9i8BrxtrVBVcAZXwMJxZjKToW2pMfJozp3Zai0DaannD7ei4p6IEHDtSLyNirwu7GHpbUT5R1ZM9mFjg3RsjPFWiOdylY7dSZmT7gaYl05kp9HxsRt3f6S9GOZzI4yxBKM1WlfUkZeIN9xvBQy1PpST0wUIu/K1wZixzxvHIo976dMEjLFkMqy+hzmH2YZynlkeLbS5NGrf6sdo4ESK4kpmOVBs9EWbwMi43IENmaZjN+ub2T0UrZCaQ+PXrIxvC9XtKm/Zrmajlkj28rgdzLIjobSJrPYSMpHxepsVyFOCm0zUwk8dqUV0UxBXRyZHqLBpQvm1V4vHTyL1DV9vhH4U2VmMU3KlIz/iZrL9MqkDRFB4yo9D5pKEIjfCE+LiT87NJ0tskIflEQlRcNF0aapxIEbZ43KGVwqqlAT6I0ZhdhJ5E+G0TQsmAL8zpUsoDfWuI6H9e1F/RhgnBw9dpH5vfLhaIDEHglkHnpm4gQDsX2fRvCr8uhzwGmmrRcLqoeuDzqeNGg7cczTWITwwcWrlrPjw/gLoNbt+heiPRBbA1BVCMu3H0MEvOmtazy8o7n6ncBd7KWQtXtnmp/Bq2A/e/71g8n2OXSicRIR1GU8dVckCUSjdu4MRFXOVEJfFaoraJ9+qbIpRb4hg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7187.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(6133799003)(4143699003)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+2bKflNHXBCzfLlAZ6oVHGEetCwrjFL3w5a7gVSvruElF8V7EtkNKRW70E8l?=
 =?us-ascii?Q?+7E7U6PH/ycsv9DS2cn9sZr7yla3QlwoMP0PMco+w/e30dlSjYVLCu/yvFN+?=
 =?us-ascii?Q?E9ppJcv94WgcKMaFl+GliNeGrbXxyAwpbCtfsSl95dmrLs5JF/lgiVGn+D6D?=
 =?us-ascii?Q?aXMtjj+sYaWcUlWR/V7AouZPS3cQBCUn5I4VqjOnlKZ4lva2R2c+rdWJSaAD?=
 =?us-ascii?Q?h5dwLbwy0YpZa0YA71qxB2hxUkJ34VCENgw1oJbhut62o+UzhSk+GnGMDakk?=
 =?us-ascii?Q?eUNBf8MyG7NFdrlBfNWUivX++pZ5gA1b9T68rrGHFfAf96fLsVJv62OUFMoc?=
 =?us-ascii?Q?/okV4MspqTmG8rPqt2SqxgY/UVUyP0tyhJ1eVE+Ui1LS3oNNWonzRm0lvSAU?=
 =?us-ascii?Q?NoMJK5OqLw1j7Lf8LL8gz+7+qUjdQPGCkqwpYpsEx9Wz05RNL5q4q1LCTNq2?=
 =?us-ascii?Q?Y9iq5mLWpwuwYLHZwmxHQwkXEyt3bSg3XVHsRPI4RZDb6IhoCHlAaN9r2N5q?=
 =?us-ascii?Q?uNjd+i7/BeLgbi/9agKSDZPKLhrTAReXB/N5EuSLhPEpf7o+EO+SWDgzYK9g?=
 =?us-ascii?Q?bpJtwEntzQLVbmqAxGeCkr5tqfEmYGkjHdlKax9AD0aCeZXRIjCNEx+LMipA?=
 =?us-ascii?Q?sN2YPxP7nS6NeIo0ImamQBf/AHpXzNZalo6LHqaXNJg3DRu5pYmhGCmIJm5X?=
 =?us-ascii?Q?HN6DU2IZTQkZrR5cjrhyrnmdIDcPbSeUbrT9CiDD38b2NGZhk4ko232Lm3eL?=
 =?us-ascii?Q?gaLVk4jgKyUnYRpIP1YWyLQC6sHGWC7WLE3aedoM8Taoy3t33tFsyye/ERfN?=
 =?us-ascii?Q?hkEO9zcYFymZwz0hQJ4VzyOyJQ36TmaRvxfrAB0yQSn6vpMDqUMvMunghVIz?=
 =?us-ascii?Q?ibv9HXMcac8nuwGXvzcmngZxaI4idA/sTV1zlDCuXTM1Xj8hwyf047UPEbYk?=
 =?us-ascii?Q?iNJmePJ0SfZePYKQRK0DVqFFZvycY5zXhlZPIuqvLhLQ40CQoEkATWslu55S?=
 =?us-ascii?Q?8TmH8YMiEmiNcBCvlhVhPZbED4Phk25/Zs3wMMCCWK7EpVHGUPUTnf6RuRYR?=
 =?us-ascii?Q?p+c+1923pm7C6SFtjioESDWD+25fJDwX70XdPsqzLIlzRiMlKAOodUYKaD6G?=
 =?us-ascii?Q?CFzT5PUmOAAhdi2HtoreoKnxrOMvExLvRumduICgU85JJA5D8bvi63bZVNz9?=
 =?us-ascii?Q?t75vcrMGQO4hAK/GASlJUv4YSi396pRdDH+9/PhQDZyyZxpw+Sl7xvtFxbvX?=
 =?us-ascii?Q?4H4fAiBRaJEEU6WfHkYVbAz0spAaOsQHxWM52So78mWGz6IQp7VrVgBprHKA?=
 =?us-ascii?Q?33Zill71J7uOLzW1N00YRrIS7MLq31ZKrLbPxHvys3l7YdtQyw267X5Z28pw?=
 =?us-ascii?Q?8u3KdiYy++BGXO04tmNwNqmt8HojjrZGjSiITMNPdFiizPX+a6UXTjmdFtR3?=
 =?us-ascii?Q?wZSqRH6/wRx9IenKd7JvgYEIlC+uI8JXfDAe6vIk9x0+zP+fnVkpBwdyILiA?=
 =?us-ascii?Q?cainWputqS7Qr+jwphuKxZ2xtzzcgSp2vi2XH8QP/gRii5wbRKx9y70hLOJI?=
 =?us-ascii?Q?6eUJDIbbQMoqXwEP7GDQv0UBrqfsDCgPGaFbrNKs8ronuM1aDCn4V/8pcNk/?=
 =?us-ascii?Q?G34BU0KhlraGFDj3IqonUrf8NaLpEtXIpo3+7nio4RZGbn9sPtRJ6Jighgme?=
 =?us-ascii?Q?sBD51jBdeOnnoeuaGieMT/9JtIqSOo8S096rFmFMeOJXtKB74wQpAW6G8pRL?=
 =?us-ascii?Q?rBeCZg9kTw=3D=3D?=
X-Exchange-RoutingPolicyChecked: XeQmrP4IHUPisQfddJrd/AM2AZiRRegICncRBJjcgBKS+k7vP36nTOK02aHCAfDxJn4CUn1kR2CKNVjncUV+GtJ2fwXhzDmcAuMf/975eIemmGqazGOvISkAuhkSO/oHxossyfUG/pUzMAIcfZw0Lwle/0XeM2mOjHVV0JaK44nhp0HrmEZt8EY/nT4fV37WtEoe7vyQfRdEcxmdKvXDidJ2bBpZvfI4pZpJw6o9IHJWnjmu1vRP0bHG4LMZU2KGvmFikOEkLWMb18YU9FdZE6KHYgTaI9R0voWG0hzd/LTrO9boilbQmEVtERglw3q5ygD4fCGtBJMEJ9OjK7zkdg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 164b0b06-a98f-4c59-e1fb-08df1409687d
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 15:44:35.3142 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RsCHSmmJ2ksn73/6/0PqlagWFcRAvqjn2tRjLtm3+kFw/l+Nxn8Xf+FjufX0R9zuGdIfcpxTQBgaSFiwSybaIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7103
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

On Wed, Sep 16, 2026 at 08:05:56AM -0700, Belgaumkar, Vinay wrote:
> 
> On 9/16/2026 5:19 AM, Rodrigo Vivi wrote:
> > On Tue, Sep 15, 2026 at 02:01:13PM -0700, Vinay Belgaumkar wrote:
> > > Ensure GT C6 state before D3 transition in runtime suspend flow.
> > > This avoids the scenario where GT is being accessed after D3 state
> > > is programmed. If the check for C6 fails, resume the device so it is
> > > not stuck in an intermediate state.
> > > 
> > > v2: Force resume when we cancel suspend due to C6 check (Sashiko)
> > > v3: Abort the suspend properly when idle check fails (Sashiko)
> > > v4: Only check for C6 during suspend (Rodrigo). Have check in
> > > xe_pci_runtime_suspend() instead of xe_pci_suspend().
> > > v5: Don't checkfor PVC (Sashiko), rename function from_device_c6
> > > to _device_idle
> > > 
> > > Cc: Badal Nilawar <badal.nilawar@intel.com>
> > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/xe_gt_idle.c | 36 +++++++++++++++++++++++++++++++++
> > >   drivers/gpu/drm/xe/xe_gt_idle.h |  1 +
> > >   drivers/gpu/drm/xe/xe_pci.c     | 13 +++++++++++-
> > >   drivers/gpu/drm/xe/xe_pm.c      | 24 ++++++++++++++++++++++
> > >   drivers/gpu/drm/xe/xe_pm.h      |  1 +
> > >   5 files changed, 74 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
> > > index c208d7563e36..8242feede1dd 100644
> > > --- a/drivers/gpu/drm/xe/xe_gt_idle.c
> > > +++ b/drivers/gpu/drm/xe/xe_gt_idle.c
> > > @@ -8,10 +8,12 @@
> > >   #include <drm/drm_managed.h>
> > >   #include <generated/xe_wa_oob.h>
> > > +#include <linux/iopoll.h>
> > >   #include "xe_force_wake.h"
> > >   #include "xe_device.h"
> > >   #include "xe_gt.h"
> > >   #include "xe_gt_idle.h"
> > > +#include "xe_gt_printk.h"
> > >   #include "xe_gt_sysfs.h"
> > >   #include "xe_guc_pc.h"
> > >   #include "regs/xe_gt_regs.h"
> > > @@ -451,3 +453,37 @@ int xe_gt_idle_disable_c6(struct xe_gt *gt)
> > >   	return 0;
> > >   }
> > > +
> > > +static int wait_for_gt_c6_state(struct xe_gt *gt, u32 timeout_ms)
> > > +{
> > > +	struct xe_guc_pc *pc = &gt->uc.guc.pc;
> > > +	enum xe_gt_idle_state state;
> > > +
> > > +	return poll_timeout_us(state = gt->gtidle.idle_status(pc),
> > > +			       state == GT_IDLE_C6,
> > > +			       20,
> > > +			       timeout_ms * USEC_PER_MSEC,
> > > +			       false);
> > > +}
> > > +
> > > +/**
> > > + * xe_gt_idle_wait_for_c6 - Poll for GT C6
> > > + * @gt: GT object
> > > + * @timeout_ms: wait time in ms
> > > + *
> > > + * This function waits for GT to enter C6.
> > > + *
> > > + * Return: 0 on success, -EAGAIN otherwise
> > > + */
> > > +int xe_gt_idle_wait_for_c6(struct xe_gt *gt, u32 timeout_ms)
> > > +{
> > > +	if (IS_SRIOV_VF(gt_to_xe(gt)))
> > > +		return 0;
> > Why?
> We skip GuC RC init for VFs, so cannot check for it.

Fair enough. To keep consistency.
In my view you wouldn't get here on rpm flow, but you are right,
since it is a different scope on this component itself, let's keep it.

> > 
> > And why not the PVC check right in here?
> > 
> > > +
> > > +	if (wait_for_gt_c6_state(gt, timeout_ms)) {
> > > +		xe_gt_dbg(gt, "GT is not in C6\n");
> > > +		return -EAGAIN;
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > diff --git a/drivers/gpu/drm/xe/xe_gt_idle.h b/drivers/gpu/drm/xe/xe_gt_idle.h
> > > index 9c34a155e102..2c8e9adf4a68 100644
> > > --- a/drivers/gpu/drm/xe/xe_gt_idle.h
> > > +++ b/drivers/gpu/drm/xe/xe_gt_idle.h
> > > @@ -18,5 +18,6 @@ void xe_gt_idle_enable_pg(struct xe_gt *gt);
> > >   void xe_gt_idle_disable_pg(struct xe_gt *gt);
> > >   int xe_gt_idle_pg_print(struct xe_gt *gt, struct drm_printer *p);
> > >   u64 xe_gt_idle_residency_msec(struct xe_gt_idle *gtidle);
> > > +int xe_gt_idle_wait_for_c6(struct xe_gt *gt, u32 timeout_ms);
> > >   #endif /* _XE_GT_IDLE_H_ */
> > > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > > index ab4da1d9a9f1..379795ac5e7b 100644
> > > --- a/drivers/gpu/drm/xe/xe_pci.c
> > > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > > @@ -1381,7 +1381,7 @@ static int xe_pci_runtime_suspend(struct device *dev)
> > >   {
> > >   	struct pci_dev *pdev = to_pci_dev(dev);
> > >   	struct xe_device *xe = pdev_to_xe_device(pdev);
> > > -	int err;
> > > +	int err, ret;
> > >   	/*
> > >   	 * We hold an additional reference to the runtime PM to keep PF in D0
> > > @@ -1396,6 +1396,17 @@ static int xe_pci_runtime_suspend(struct device *dev)
> > >   	if (err)
> > >   		return err;
> > > +	err = xe_pm_check_device_idle(xe);
> > I still don't like _idle prefix in here...
> I initially had it as _check_device_c6, then realized it is a misleading
> term.

I know the pain... I'm bad with naming myself.
But idleness is not what we are actually checking and _idle is already
a rpm sufix that has a different meaning in the flow and might be confusing...

> > 
> > > +	if (err) {
> > > +		drm_dbg(&xe->drm, "Resuming - Device idle check failed!");
> > > +		ret = xe_pm_runtime_resume(xe);
> > > +		if (ret) {
> > > +			drm_err(&xe->drm, "Resume failed after suspend was canceled");
> > > +			return ret;
> > > +		}
> > > +		return err;
> > > +	}
> > > +
> > >   	pci_save_state(pdev);
> > >   	if (xe->d3cold.allowed) {
> > > diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> > > index f517bf453b54..f03a463d2a05 100644
> > > --- a/drivers/gpu/drm/xe/xe_pm.c
> > > +++ b/drivers/gpu/drm/xe/xe_pm.c
> > > @@ -1030,6 +1030,30 @@ void xe_pm_d3cold_allowed_toggle(struct xe_device *xe)
> > >   	mutex_unlock(&xe->d3cold.lock);
> > >   }
> > > +/**
> > > + * xe_pm_check_device_idle() - Check if all GTs are idle.
> > > + * @xe: xe device instance
> > > + *
> > > + * One of the ways to do this is to check for GT C6 state. This check
> > > + * will fail if some component is holding a forcewake, for example.
> > > + *
> > > + * Return: 0 on success, -EAGAIN on failure
> > > + */
> > > +int xe_pm_check_device_idle(struct xe_device *xe)
> > > +{
> > > +	struct xe_gt *gt;
> > > +	u8 id;
> > > +
> > > +	if (xe->info.platform == XE_PVC)
> > > +		return 0;
> > PVC check belongs inside the gt_idle component,
> > where the RC xe decisions are made
> Sure, I added it there since it is a device level flag.
> > 
> > > +
> > > +	for_each_gt(gt, xe, id)
> > > +		if (xe_gt_idle_wait_for_c6(gt, 200))
> > > +			return -EAGAIN;
> > > +
> > > +	return 0;
> > > +}
> > But anyway, why this indirection through xe_pm? Why can't the xe_pci call
> > directly the gt_idle waiting for c6 inside the runtime_suspend function?
> 
> The only reason was that all gt_idle functions take GT as param, not Xe. In
> that case, I would have had the for_all_gts loop in xe_pci, which I was
> trying to avoid.

it makes sense. Just rename to xe_pm_wait_all_c6 or something like that...

> 
> Thanks,
> 
> Vinay.
> 
> > 
> > > +
> > >   /**
> > >    * xe_pm_module_init() - Perform xe_pm specific module initialization.
> > >    *
> > > diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
> > > index 6d5ab09cb769..a4fdc9c5cb10 100644
> > > --- a/drivers/gpu/drm/xe/xe_pm.h
> > > +++ b/drivers/gpu/drm/xe/xe_pm.h
> > > @@ -36,6 +36,7 @@ void xe_pm_d3cold_allowed_toggle(struct xe_device *xe);
> > >   bool xe_rpm_reclaim_safe(const struct xe_device *xe);
> > >   struct task_struct *xe_pm_read_callback_task(struct xe_device *xe);
> > >   int xe_pm_block_on_suspend(struct xe_device *xe);
> > > +int xe_pm_check_device_idle(struct xe_device *xe);
> > >   void xe_pm_might_block_on_suspend(void);
> > >   int xe_pm_module_init(void);
> > > -- 
> > > 2.38.1
> > > 
