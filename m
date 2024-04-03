Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F4D1C6FD1F
	for <intel-xe@archiver.kernel.org>; Wed,  3 Apr 2024 03:28:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E67DA10EB68;
	Wed,  3 Apr 2024 03:28:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JFy+vHZV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6EB510E5AE
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Apr 2024 03:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712114899; x=1743650899;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=xrFqKfViScnq/d8JZKawLKI1nEs7FGwGbF2cpldBT6U=;
 b=JFy+vHZVIijBczzPOein8/8VR8nRLMtctHRmlI6izq/wwFmJNEMNiOM2
 IEE3Q4TJXvMh+ssgRnSTp8AlThu7pcl80Gg0fgbf7YqPvXsSDvmvklgFI
 vQ9q/ak4JwCcJEUlBLTfd+CPFR9Q6bvNh/832BGIvoFfg9NEHNBhBp3W9
 gXzNPcpxcD+kUdE2TF5mps6r8oOdIx7HuVmEehXO2rR2umxJ1/DgTRdGT
 +i5PIRHriAyQKxGZp1jIdCjVI9vrFLFRgJ1kE5tzrQ85j1KR6zXwwZqfy
 H0mmuHp3kHKooz/s4kP+uUmau7XeHEE78zR1vdhGsZh/vLqRMsC1oWkJT Q==;
X-CSE-ConnectionGUID: cy1D82nQRf6Mx906U9fKrQ==
X-CSE-MsgGUID: jGqwErh8QEqrGJwX2tuQZA==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="29799870"
X-IronPort-AV: E=Sophos;i="6.07,176,1708416000"; d="scan'208";a="29799870"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 20:28:19 -0700
X-CSE-ConnectionGUID: pqKDqpw9Tp6saRpE6I1AMQ==
X-CSE-MsgGUID: 3AndXu38QQaDLKu+oToAvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,176,1708416000"; d="scan'208";a="41430555"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Apr 2024 20:28:18 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 2 Apr 2024 20:28:17 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 2 Apr 2024 20:28:17 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 2 Apr 2024 20:28:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VAPqggR+vCMt0hGK53l/SO+5I+FgTAG/Ms49BlyYzZGGQZ5IkFsM3MqK3xGVv+ePawtDRzyJu5BYKaUQMxYD7ig66U20XCWezjmTA0OXX7xOV7hBS0DPMiE3ubD+Zp0UPO8L0YWTk9K1mcU1nTF53HA23z7j7XFl3CUQaUOGNvWo+5H1wvWV+IKgnADe33hmVJk3AlFcD7KAxxj3EzPJq0027AQrKicFWzfcbHXRYtva/5YrgVgwdrSY610sw7m9yz5P80dqF8gHZutxRxZKJccectFi/89G4hqZcOW2eELAYj/qTDvdjPdMCTCm2WHw/am9G8SeoaPi4gpR1aLOCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3YuGaMD8qoTBesWIUU5eKkTSXtL4YhrK9usjVizjvOo=;
 b=A5w73SwpC3Ny/XjERBAyhoGh2rohv32R4zv57qbWqO27cqPIzf0Wth4PgSDOW8Ena8HqkTgxV8GIPed2PNMN4AspOs5XZZAaTJhBMGU1ZNEdyx2BdnrCSAimrcQSNCsbQCIXUMxllShY3YT2VsCbb5cmM6rNcHmSX8VqzjXOvMOEdx1T3LDJoxIYBXcuSNZZo+EARE2tYQ6tLZOPaivb5IxAzRs8L2l+B/BqQxV4523I5DEW7ZTFKV0+G+6jOy/hIRGug3vGwLJ8vPqfBqokAaG7hLf1/3Oq9UKhRxyDhDoNj8iywTE6LhJfghbynlaQ+K1u1iLuP4KaB6Dq6s0UBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB7660.namprd11.prod.outlook.com (2603:10b6:510:26f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.25; Wed, 3 Apr
 2024 03:28:16 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7452.019; Wed, 3 Apr 2024
 03:28:16 +0000
Date: Wed, 3 Apr 2024 03:28:50 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <saurabhg.gupta@intel.com>,
 <lucas.demarchi@intel.com>, <john.c.harrison@intel.com>
Subject: Re: [PATCH 3/3] drm/xe/xe_guc_submit: Declare reset if banned or
 killed
Message-ID: <ZgzM8kiMoKMtMvmo@DUT025-TGLU.fm.intel.com>
References: <20240329184929.3675256-1-jonathan.cavitt@intel.com>
 <20240329184929.3675256-3-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240329184929.3675256-3-jonathan.cavitt@intel.com>
X-ClientProxiedBy: SJ0PR03CA0361.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::6) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB7660:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MdK4IxqdixKZtf0DvVSvMcHv/mifa+yfBxuQGoNb3tR3DN+Zde2wbTbewXE2kul9LrM5xAy2vkTY597ZTv98Pz4SJpKOipW/30Mjmo3PQJTTdogIjtkJzedCP7F/RKyzd3pH+f0ZRT3ISfPqQkTMq83PVAr2n2Y0ZyhdaqKQphMXkIFXotlDVbZZJ+THCHZw65DSYfkCdBdC6faLcrLMk+NgHq8WJisSpMQylSAblWGZ14qUd+LRQQ+cpG3hbeO7a2cpxX6Y9P7lLkAfecx4KkSrgyWozhGimk81xzcc0WDONzB6TrqYDYF2A63ZYs/BsHB7IrNQ+BSs5APPCgJauh5oq3gp3pvC9oeF1x8WhfT0+3k5Dk+LTYJ3pztx5WlrLggnrkS648mwQYe9e5rvmmRzG8dV9Tb4FMzVucjM5gGmRgIpmKy1R5A9R5RGa164EvfIQXG9hYk6IQXOm15eCCZR3lY13aUnjbTUk70GMZURc4Yf/TA+/zUIEVbIrD1Qluy2CYq8sN+B9FQiUtTBkS4N3Ujsk45oyoYQXhlkDEr95L10wzKZK3rlnZloJbk7vb7jc5BRcN6mlhXIl90jknqbKU4jssHv1rvJar1cdILYS2J5AdM7aYySC3uInWfFkqahnyyRjiHVD7jJE+doF1VO1Wde0Fh0DepNT3g92e0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tlWZnea8RYx/cp/bQo4O6NSrWxONLbbSK8NxU8QAi2nNSiHDmM6wJWrBA0xu?=
 =?us-ascii?Q?X8gp0M5gw0g+lagExkXf/HvlVP7c0n4JFsLYdD6i8cL3tnCM+s8ge2NoXOaf?=
 =?us-ascii?Q?Ctrvb5ppGUtgEBSYVPj74Yd+Os6A0Pd0JT6XcDGfj+NOLVhKv2s6eh2JNBwz?=
 =?us-ascii?Q?x/AnIM67+u94K1GzYoAC/SaMvDW1e1o4RxttR0AHwjw0QETdx1oxdDhv6WFz?=
 =?us-ascii?Q?xgaz183kzgO6C+vRAaBfA/zBG9BKIKFLyhMrtMuVPCACQ9LBqgRzgnTZjmZ0?=
 =?us-ascii?Q?g7FetK4M1k456rCQEDrskUmX/HNnw40i50ff1Bmgct24qWSZ59fvR3E/Ie5o?=
 =?us-ascii?Q?JGaCnM2nicFdvaHgoEJIG61qKqgkEF5EIfzVqhXcS4zZOgdfZ0YnHEAMQKVr?=
 =?us-ascii?Q?9y6MZE6jAKf5K5eWeYDXOz/gW62GZsq9sgnqXea129dXp8+B81+dYFwx1b1I?=
 =?us-ascii?Q?LeMbGSv6KM9WsfPrkWhPl7Yrr1qsqod5ORPeJ6ZUxAYK5P0/iFGYKiZDYDv/?=
 =?us-ascii?Q?/4GK7wKCWqZ28fiihxpD18+bhrsOf4eQBJHt7/yL/Z0I+SUPJlVH4OsR6Djx?=
 =?us-ascii?Q?f1vKgInt1KXSRl5ti8RqlnRb3n4nsZXRBJ+lqSxFUPFxvmvkbLevDnUHsokE?=
 =?us-ascii?Q?26o/nnZf6fyQOYFTJswVygmazxJW4xZ8MPILeMje9T1TtOvH0OdTRQiEQicD?=
 =?us-ascii?Q?4gpcwtde9jJtY388sWOrtcmiqaImpIkRCz95yFWjE9jOrskFa9dh/Rm+76/E?=
 =?us-ascii?Q?OeeHzTtJkjh19YsL6X9Z0pov3DzezFNNY2RYgAxcPLiOsi82XgTZhWPmAQBs?=
 =?us-ascii?Q?1SeyyeM35CeLAm3g589FgoGHPINqN7ksvq/h851B2WGLihLcRj4zkx5xwrFv?=
 =?us-ascii?Q?0gAnY1zcLvPHiuVpKSWbsq0g31v6MWfZot95OYcnFj7itS+wzrI/BRAJpABu?=
 =?us-ascii?Q?ZhVikXZ0L9/SNa2X0HnXhlmdOXlbTkAP7YVEmpJWUXK8lePScBE+cCqWJC16?=
 =?us-ascii?Q?27hbF8u8u34UcEgbll9wTm4EzCy734pwSc8eprBPEqp3tx7tKZTxRD5roI0Q?=
 =?us-ascii?Q?GkepH77k3OnftGL7anjpyRc/N0/4NUW6tKj+1JJq0pyzNfjYDm7ji1XN1iV3?=
 =?us-ascii?Q?yUtvIEPgapcC9Qq3Y2lk53FQIAPEkWGCnqmW77PF+t1Onkg6yI/o3p/PVwxu?=
 =?us-ascii?Q?SCRU51wnYcxQMKyDzfB51DPBGAGdMMVGCZIrpgA61i9TGNVqSCxikEI/EMYC?=
 =?us-ascii?Q?qfbUZJg6omi/uoOh4Om2rrGz925+HRfweJaypg0tSMxpdS7OFVGRgZsIUVF6?=
 =?us-ascii?Q?6nQN4wqmRntj5bttMtVMwghC01fw04i7VQQgcr3TAXGPTYIw3Mg4RMcHfEQQ?=
 =?us-ascii?Q?kXxvaEAXDQVnnt2ra/tZXvW8boMReCo+QvOoalqEu4Wq6DG90+bK/0ctwCpV?=
 =?us-ascii?Q?K79gFuzm2eHTN9S8isRdsLVvEb11qMOgE8i1CFXVFAm+HbnUcefjFyA47nkx?=
 =?us-ascii?Q?qFiurDRlRMCp01/DU6AqOFu7BCTZ9hfgwC3bdmDYZibv2WiFTsyR15D6tEdB?=
 =?us-ascii?Q?2gYxztr4539R0ei8ONoWkvGyRpm0XL35lMUlfCfhSLCbwd79x+LJTJtKTds5?=
 =?us-ascii?Q?Xg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b2bb7a4-6ffb-411e-217f-08dc538e1983
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2024 03:28:15.9460 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R3aXKy5D6UoGy/NuAtIw8LXqM+q7EpMrd/SI3Ytql+ExbMIw6ZnsSSVzuVXCy6GbH+I6BCRUDo0GNeGHFYoK2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7660
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

On Fri, Mar 29, 2024 at 11:49:29AM -0700, Jonathan Cavitt wrote:
> Add an additional condition to the reset_status guc_exec_queue_op that
> returns true if the exec queue has been banned or killed.  The
> reset_status op is only used for exiting any xe_wait_user_fence_ioctl
> that waits on an exec queue without timing out, so doing this will exit
> the ioctl early in cases where the exec queue can no longer function,
> such as after a GuC stop during a reset.
> 
> Suggested-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index bc0b5ec0b2ebd..ac3958c56943a 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1371,7 +1371,7 @@ static void guc_exec_queue_resume(struct xe_exec_queue *q)
>  
>  static bool guc_exec_queue_reset_status(struct xe_exec_queue *q)
>  {
> -	return exec_queue_reset(q);
> +	return exec_queue_reset(q) || exec_queue_killed_or_banned(q);
>  }
>  
>  /*
> -- 
> 2.25.1
> 
