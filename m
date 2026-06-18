Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB6B8CD98ED
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jun 2026 14:01:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6033210E7CC;
	Thu, 18 Jun 2026 14:01:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="naenTD5l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2688210E7CC
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Jun 2026 14:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781791312; x=1813327312;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=5TpMek4/Wsw1L9gdV7OqLtJRPsHnHQnyZmwwUrWfjdA=;
 b=naenTD5lU3ldjwcQ44OunQWmaPQ/zW/1gubvXuzBuypS7pt+3TIlsSJV
 rQHzKESRzYX0vpHRg4Kt2Zk/O+vwDz7NnROcWXPy1pEJ4dv9yHSmPRgPf
 3fgcaDF36ADjob9dOVW+BP8XBr+bZpi8slI8jIsscO+UijNCV+JGXY7+v
 XoL1qgxToh/QYkqC3MeQWUazeaLNHOlPaJtNlpceKzzY9xjvseqO1wyxw
 bB0oRXQqWEYmIjjspAlJbvKRLS2KQ3wZhCnXepAMwJNAhMyDyii8zqFJA
 PR8zFia/camYTvxPvgN9HbggHhCswe5Mb3Ew3Za/A7OL6J9Rj5eumdKV7 w==;
X-CSE-ConnectionGUID: 6K/ifBByQO+i+to7lAjtKA==
X-CSE-MsgGUID: Qa3wIk0NSaSmFN5YkrIPag==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="100037075"
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; d="scan'208";a="100037075"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2026 07:01:51 -0700
X-CSE-ConnectionGUID: x7CeF433TCeDthRi9at5Xw==
X-CSE-MsgGUID: jDuW6BreQMmHNa8M+4g//g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; d="scan'208";a="247496709"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2026 07:01:46 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 18 Jun 2026 07:01:45 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 18 Jun 2026 07:01:45 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.68) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 18 Jun 2026 07:01:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sMJUX2/7lbm8iL51LGDVFH8MxbmO+dHwBTP3rI9k5mgkalg/cGA8BOM9G/SV8Lls2i+Q04Rm/ypMu1yE091whd51AjsnM9Qb7l8tJytZh0sdXhTol7sqEXQP75tcIVh6tbR/6YvH2GcZurLdm9vXByo2Fir4UWHYjKiJlD1a153kKXaQSiNiOp5JsvvRwQaRnqXhQEO24YhvzDbNxy3cRn2FQLe78Bkq4REnTnTjap2+tSyh5v5NrdK5FHRyLN6Yz9cjk5/eIPgfj954jXdJ7Nahp6PhPZtEcK4nU5WboPyXf8WSGMJIHnGhCw8JX407m03tX1tzqFiNgeYk7ZsiAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ILxM+lmGX6CXFkpVkF721MA2VDygOKTRT0eIywZS3yQ=;
 b=VZakg7P1ZE66R8i99vn7zJKH88/hnaMo/+dnA8I7O/0D0YhyaFlIeI9qR9nfxGSk/61i5L102KlPxfS+MQ4QaSxTHpN0zM6GBx+0A9jYCNqPTxoH5t6T32FmrVJHMLR36cKYrIR/ZjAMOXWP90RyG6gfu46XdmT/d6qt93DsIgpIR9qxdJ5SE4JC5mUeWuXsZGiOzU7PkJR60w8f0teHG/F2pkucMsvE1ouOREd0NDld8I8FlBPfppuxFAPjUAvQmU+/pUJJYimU6btPJcCh99WmC+SYqI9A5l/J9vEL3yAlIiRJCGvjHfOrustT6uHZtiyfwuMK3IRBN8ox7pWRiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by PH3PPF5A672BE95.namprd11.prod.outlook.com (2603:10b6:518:1::d22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Thu, 18 Jun
 2026 14:01:41 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%5]) with mapi id 15.21.0113.015; Thu, 18 Jun 2026
 14:01:41 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Varun Gupta <varun.gupta@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <matthew.d.roper@intel.com>, <stuart.summers@intel.com>
Subject: Re: [PATCH] drm/xe: Add debugfs knob to disable Mid-Thread
 Preemption per GT
In-Reply-To: <20260618042421.483657-1-varun.gupta@intel.com>
References: <20260618042421.483657-1-varun.gupta@intel.com>
Date: Thu, 18 Jun 2026 11:01:37 -0300
Message-ID: <87pl1ot0am.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0333.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::8) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|PH3PPF5A672BE95:EE_
X-MS-Office365-Filtering-Correlation-Id: df161c08-70b0-4514-9f80-08decd421f9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|22082099003|18002099003|11063799006|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info: jcMM57yi22EYz8tehcvuuTF6vVxZv49abtaXBqLP+K+FdG0dbaBuTtTjfnsT49NUEa37RAqPMVobZ/gx1rX8blT+tj7zlGruoamf89pmC/fHow46Ufador2VAW4rO1DgRLQpYbJQP7s0YRx5HfukQ2RNzAZQcDHdi283oUNTsyAkuJGCnP2LSNeaSovLKUxUA4Xc5ve2qknVyw84NRVR6sOsi2EdQxjXkCrGHQ37v9E9RbX43FHwHqzqomm8hAenuXmieWpUplJ0xId7UNuPEQhRAzp/h2Gg63xbeDFyBPmmbf6j32nFWU7xxboC0Bw6QQZrxvvtbpOnZCDEtoowQJb8grnL+S0oMqZQrWe5TJrcpYNlmvUYnohMyYDjhRTj294asyZLn5zqYAhwuS3tU4F1XAfvtQQk7/V8Kop3V2WdmugqwfheD2L/wE6H7r1uGZ0RHAK1JNz1b/2ShMZrxXjefEJblN5f9v6lW07fknr4Kv41gxdXMnZbY9kYH6gt4kmnZWqimNC1HT8q1rc+ddER7FbmbVAxPlgiS/RmMAtR+LmG242gjMYFvjs3+sU2ZVtrsqyiWMnBj/EDtYcyyVDE9T0XpKNVVhfIMYBqne6z0i1aT8+PzkppIURVSIm2UtM9ad5st9GXsSQQQ2ox7wLV2+luAxeQAjc6NyZkYxifzjfM3FhQwz5figlBOBU4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(22082099003)(18002099003)(11063799006)(6133799003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6TjvYzGokomcl++7YnaA1U53mv8CxT9MsGZKUnvPjN/dw0P2+RiHDFY2up0u?=
 =?us-ascii?Q?bG4159PtBkC7uT12qaDrbsIhKhroOyYO7M9ztgZSfvhgI70BVlZ8Z4II4ar2?=
 =?us-ascii?Q?QuUnTUcp7knCox93tR0wewByTAxCrK12AW8CfBkuSlcbMYfd/uipGM59gN88?=
 =?us-ascii?Q?PQHYiSE1utXUiq9u17wdmOS4FMGoamUw955xpdE2K7+Vs5n32cZI+zx5GaMx?=
 =?us-ascii?Q?CSnGFxjMApZZk9vHy8tVAeWqLBHJaYoYxV9tlzvNyqz+KU79fkhDCbjWIOij?=
 =?us-ascii?Q?eZ3UmyfyQWeWPRFV1ncpzeMXhG/UZ5hXW1Ff4EQHCQ/nnba9ii7eNRhr65QM?=
 =?us-ascii?Q?8eVHYjzs5gz/5PAesoaVVn9FzzKdiuGNnis9nb2Xjl86zLwS23VB57jCnx11?=
 =?us-ascii?Q?+RCtL7i5yyHyB/zpZed+qbZzibNjXZJDC9gQgGkVilWKiVAAFyyokCC4VzLB?=
 =?us-ascii?Q?UruJFtCOsk6GBBQjr9VKuoC240CGm+OsDRqtspnw32AQFnkd88Ez40q5wB6j?=
 =?us-ascii?Q?MuzrZIwCXA2YpZ9fwS4gSEZGms5R/1uvsD20hAqa2E7/zzEVwee9FUdg7XWR?=
 =?us-ascii?Q?AtzSoNSL6GQxrn36AtPoEtoC4KXfZLiqsp7RISG8Uqnhqy4KsazbmAg6UvmP?=
 =?us-ascii?Q?3iUWNUmQQLROCkIPM/cRrUltcySgzdRftWBbU8yHeswFPu0Kjkuqdm0+Na+O?=
 =?us-ascii?Q?WrHS+q2Qd0a+jFsAAMiOu/dBGOC3C4GZL5y5ZKGKWCMBdAk/Wz9/kQzyBETd?=
 =?us-ascii?Q?LyXnepSkJ09I/YB2Xd/EEpHZBdHWyzA1s5wI5wsS/+N0VLARiLUToC77xtQ8?=
 =?us-ascii?Q?FQnSA0C2nmMTfz5qrwo988DPRKdKNF4u+0/3wKUz2o9e6y6D0KC4/33AupuW?=
 =?us-ascii?Q?1egs4+dQ4pEYIkOHi6zNS80tobQpA+9AMz2tp3z+Nv8qJuJ89pMLLL/lZdAZ?=
 =?us-ascii?Q?wSRQUQ4oAEtEYOO1rhjFXUOQT4nnvhrAFEqTzjoYWj9GzFTqaTE8uo++pnjF?=
 =?us-ascii?Q?Y/jL1DRK1Tl/oSarHAvhBgGJCYettyZ3CSu6Tvn/8lDdCZHs8+Q6meHrZZqh?=
 =?us-ascii?Q?fe9pU3oxfDaBnFIZT4umKALiGoDkdlBSBnVHu5YLTOXik+5zHaS6PCeXgUiq?=
 =?us-ascii?Q?OKbFXF2F66K8zBkjQtqyhuP8gVPSNyN6YIlAOHbGQr9qpf3LZdxmqmefJ0ji?=
 =?us-ascii?Q?yU8InydG00rLlH5SB9ayFE6XM/W49Hrqo7mkcHJDGUn9KuxMYMG7m9u32ClU?=
 =?us-ascii?Q?fBly/ABLaCSeYyNk8wi6cxpyh4R9oRvACKpwUXJ6vqJYgTypAzYXNLLZvE8D?=
 =?us-ascii?Q?pXufkOGG3MHJekMxCb1JE5KGjy8GuxclkgGygOD34A3DRwlM+5ZStHb6Ggb5?=
 =?us-ascii?Q?y6uRKEcgjFaOORAWm3ZKU0bA1FdflSx016VyeMwqUHHCcpqNQBlZZ9FMduCW?=
 =?us-ascii?Q?4x6HcaTZnuhIN0BZiKn8VO/tIFyPscpUakF+47byiC2GP5RNU7HODqQifYiq?=
 =?us-ascii?Q?q9edQJpjgf1oAXZvr6EOcyohJ3+jgfte/iznPZmPfTT95kwZ7JoEkRFlfWmb?=
 =?us-ascii?Q?H635h6eh7g/RnSUgDSQDB3X2eNZcR42VqypAAMWEJRxbWgoKnnW2sjSoK2sa?=
 =?us-ascii?Q?bb4+AXUW+YqbDI0gOujxQvfyrNkUmb0VrZlKMfuWt9/er86okQVDzDdGu59/?=
 =?us-ascii?Q?kfCqIWlguxiWRX/8vZlHEMJVuz9h32W7Ir7kJMyp5TRcdf0US6mi3mQha+Dh?=
 =?us-ascii?Q?59gQ6AWY+A=3D=3D?=
X-Exchange-RoutingPolicyChecked: lBNsWG1VfPYQtcV/rphNK5/NX58pPiQWIC5UVRFj4qVfVCFThGn8UxYaYhJMuhxkgViufpXOd5UjSkTRbW9SF+n2OH3sTZtvll/3n7Dc3nk5l33+U/9MwP72lcnIcLZdRcEtYvyHI9MqVqZYlQ1Zckvc56BCs6BcUqOU6XMddodx4atUDx3X1uEgBbplqkNiNXeXvvE/rpfOf8SqjjXNZhrUtRd8SogFpHgJOcUXaFMqg/otlLnkqBWclRRVne0eVFXZ6nzto0gpd0l0oS1vzxNFgAacbhy2FYwTrF/mS6SW6pKreDzol7zqs/Ep4zPZrekDVLISiJZQ9Kum/wVZbg==
X-MS-Exchange-CrossTenant-Network-Message-Id: df161c08-70b0-4514-9f80-08decd421f9e
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2026 14:01:41.6624 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PkTCtkn9Q+DDJ/NFZsHzQfaA0aDJyTK6B86l/H/9Ysoqqx27osJebGOw4/sOuyJOCWy7JGMi02Jx9b7ym7SvSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF5A672BE95
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

Varun Gupta <varun.gupta@intel.com> writes:

> Add a per-GT debugfs entry 'disable_mtp' that forces thread-group
> preemption granularity on Xe2+ RCS/CCS engines by writing CS_CHICKEN1
> via MI_LRI into the WA BB of each newly created LRC.

Hm.  I think it would probably be better to make this an entry to select
the preemption level instead of simply making it disabled mid-thread
preemption.  So, we could call is "preemption_level" and then allow the
following values:

  - "default": Use the platform's default.
  - "mid-thread": For mid-thread preemption level.
  - "thread-group": For thread group preemption level.
  - "command": For command preemption level.

Furthermore, should we consider tainting the kernel if ever get a write
on that entry for any the last 3 values, since it will deviate from the
default and could be incompatible with some workloads?

>
> Signed-off-by: Varun Gupta <varun.gupta@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_debugfs.c | 32 ++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_types.h   |  8 ++++++++
>  drivers/gpu/drm/xe/xe_lrc.c        | 24 ++++++++++++++++++++++
>  3 files changed, 64 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> index f45306308cd6..e8f7ba6fc3c1 100644
> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> @@ -334,6 +334,37 @@ static int force_reset_sync_show(struct seq_file *s, void *unused)
>  }
>  DEFINE_SHOW_STORE_ATTRIBUTE(force_reset_sync);
>  
> +static int disable_mtp_get(void *data, u64 *val)
> +{
> +	struct xe_gt *gt = data;
> +
> +	*val = gt->disable_mtp;
> +
> +	return 0;
> +}
> +
> +static int disable_mtp_set(void *data, u64 val)
> +{
> +	struct xe_gt *gt = data;
> +	struct xe_device *xe = gt_to_xe(gt);
> +
> +	if (GRAPHICS_VER(xe) < 20)
> +		return -EOPNOTSUPP;
> +
> +	if (!(gt->info.engine_mask & (XE_HW_ENGINE_RCS_MASK | XE_HW_ENGINE_CCS_MASK)))
> +		return -EOPNOTSUPP;
> +
> +	gt->disable_mtp = !!val;
> +	drm_dbg(&gt_to_xe(gt)->drm, "GT%u: disable_mtp=%u: new LRCs will %s MTP\n",
> +		gt->info.id, !!val, !!val ? "disable" : "enable");
> +
> +	return 0;
> +}
> +DEFINE_DEBUGFS_ATTRIBUTE(disable_mtp_fops,
> +			 disable_mtp_get,
> +			 disable_mtp_set,
> +			 "%llu\n");
> +
>  void xe_gt_debugfs_register(struct xe_gt *gt)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
> @@ -366,6 +397,7 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
>  	debugfs_create_file("stats", 0600, root, gt, &stats_fops);
>  	debugfs_create_file("force_reset", 0600, root, gt, &force_reset_fops);
>  	debugfs_create_file("force_reset_sync", 0600, root, gt, &force_reset_sync_fops);
> +	debugfs_create_file("disable_mtp", 0600, root, gt, &disable_mtp_fops);

Wouldn't it be better if we added the entry as part of either
vf_safe_debugfs_list or pf_only_debugfs_list?

I'm just not sure about which of the two it should belong to.

>  
>  	drm_debugfs_create_files(vf_safe_debugfs_list,
>  				 ARRAY_SIZE(vf_safe_debugfs_list),
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index e5588c88800a..4f6d63b614f9 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -219,6 +219,14 @@ struct xe_gt {
>  	 */
>  	u32 ccs_mode;
>  
> +	/**
> +	 * @disable_mtp: Force thread-group preemption granularity by disabling
> +	 * Mid-Thread Preemption on newly created LRCs.
> +	 *
> +	 * Xe2+ RCS/CCS only, controlled via debugfs.
> +	 */
> +	bool disable_mtp;
> +
>  	/** @usm: unified shared memory state */
>  	struct {
>  		/**
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 3e7c995085d0..893456dad6a5 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -1262,6 +1262,29 @@ static ssize_t setup_invalidate_auxccs_wa(struct xe_lrc *lrc,
>  	return emit(gt, batch) - batch;
>  }
>  
> +static ssize_t setup_disable_mtp_wa(struct xe_lrc *lrc,
> +				    struct xe_hw_engine *hwe,
> +				    u32 *batch, size_t max_len)
> +{
> +	struct xe_gt *gt = lrc->gt;
> +	struct xe_device *xe = gt_to_xe(gt);
> +	u32 *cmd = batch;
> +
> +	if (!gt->disable_mtp || GRAPHICS_VER(xe) < 20 ||
> +	    (hwe->class != XE_ENGINE_CLASS_RENDER &&
> +	     hwe->class != XE_ENGINE_CLASS_COMPUTE))
> +		return 0;
> +
> +	if (xe_gt_WARN_ON(gt, max_len < 3))
> +		return -ENOSPC;
> +
> +	*cmd++ = MI_LOAD_REGISTER_IMM | MI_LRI_LRM_CS_MMIO | MI_LRI_NUM_REGS(1);
> +	*cmd++ = CS_CHICKEN1(0).addr;
> +	*cmd++ = REG_MASKED_FIELD(PREEMPT_GPGPU_LEVEL_MASK, PREEMPT_GPGPU_THREAD_GROUP_LEVEL);

Is this enough?  Reading the Bspec page for CS_CHICKEN1, it appears that
the settings for PREEMPT_GPGPU_LEVEL_MASK depend on the value of
FF_SLICE_CS_CHICKEN1's field "Per Context Preemption Granularity
Control".

> +
> +	return cmd - batch;
> +}
> +
>  struct bo_setup {
>  	ssize_t (*setup)(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>  			 u32 *batch, size_t max_size);
> @@ -1342,6 +1365,7 @@ int xe_lrc_setup_wa_bb_with_scratch(struct xe_lrc *lrc, struct xe_hw_engine *hwe
>  		{ .setup = setup_timestamp_wa },
>  		{ .setup = setup_invalidate_state_cache_wa },
>  		{ .setup = setup_utilization_wa },
> +		{ .setup = setup_disable_mtp_wa },

This is not really a workaround in the official sense of the term. I
would drop the "_wa" from the function name.

--
Gustavo Sousa

>  		{ .setup = setup_configfs_post_ctx_restore_bb },
>  	};
>  	struct bo_setup_state state = {
> -- 
> 2.43.0
