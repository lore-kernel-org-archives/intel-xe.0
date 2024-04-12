Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2723C4345F
	for <intel-xe@archiver.kernel.org>; Fri, 12 Apr 2024 13:30:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B97410F651;
	Fri, 12 Apr 2024 13:30:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I5WIKDbq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B806310F656
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Apr 2024 13:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712928626; x=1744464626;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=I7FuEmrl4p7NnMTUi5ng7DW+q+JRJEWVi4ymiXCs0wE=;
 b=I5WIKDbq4/KHkLffakMLD+aTzq9l6Xn9DiMjEE75rBNLdDnTlGneCm1K
 VtAxtqQ7gcs+NekEOgwaFSVYaYgSuOWsMvt76b5A9v8goVZEYSsqifo/j
 56RMA/leS4SXCkwSAfu4qEShNS6/LzphJLP5zGfPfqHPqR9FCi8+eZWc9
 3xtuWO//l/i9dG4IVvD5L+WwRumLvavenkpesQjBvvlAGM1YdEr3WBosG
 KrDZEYhkBb3ao6wEcKqTZTLg7e4qrygaj9zyYj3CqVl9QKcxr6uCvaloc
 zW7LpSL+pLtZNkWMRQw4aAmWDjJDRT/FNyHsyyN4I+DH6DgwbbUTNnsAj w==;
X-CSE-ConnectionGUID: coSktETuTqiiSAXacE+FsA==
X-CSE-MsgGUID: kJkRZ5imQY+YKTVIDAkcgg==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="18988257"
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; d="scan'208";a="18988257"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 06:30:19 -0700
X-CSE-ConnectionGUID: sPrwg2CUSRq5N3iqEnhmXA==
X-CSE-MsgGUID: rdC9yRP2QYaCyYcymSugHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; d="scan'208";a="21300653"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Apr 2024 06:30:19 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 12 Apr 2024 06:30:18 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 12 Apr 2024 06:30:18 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 12 Apr 2024 06:30:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iKmrS7xWSNtmS3/wzqjK2q0bBrusAol3sreRFrhOfG2mpZ7fooM8tFgvnn3Rc9uYiHu1aJnL7rMddLU+lXRbYRpTeGRekEuei6BRFnrSysCs/GYrC9gY/Y4n0lsk4l1ck9hvsGKh836o84Dja6xuO1Si+4VcWUfizBV4WblPgaDlYnYVO/Aeq7pZYuMTGjZtQfBEw3X0TRjP6nrrJpVusHbiCwRwNPZyXGoaJrEorZUsN8i+kFxsptz8NIXuyyJy3VqqHwn9hWI0oElzjENma/ZlRBZnq+/gXLnrxFHwmJA2GxJeKgBVU84aBTOYvj7HAlXdcM+SDJLPY9/fiZyR5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k3QTl4dIxzEEQiDgZjVHQZ9NNqTvmxuW0NepeKwVH3M=;
 b=WfYGCB604/pd/WK24QiH6iSGHrK1cs9TRIsAxGHIJxZhJxklmHdSBGy+urxh0MkaC9qI1HbUXM+x3rKxNkEnB9O2PI7cU0WxUKU9GwCR/nU+geclK4tqjvwLq658A5nXMSke4nEjtNpCWnr4FlqLy64qM8IyAtGQnW3Pgzth4rafO3Cm5tloEJgRqAZqmJTqkABfY9AFNWMBfe/QiA2yKPikuUsphVdsmZLIQPnrnbIe4ggiNxfut3WPP3vWZ/KoY/fpMwqX8tHpK5qXqsNJcXjksGd/iNgSyr39i4FjHR7da0AzHv+/TLGTvc+PaCZqCbski+NReNL1oabmbFpT3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CO1PR11MB5153.namprd11.prod.outlook.com (2603:10b6:303:95::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Fri, 12 Apr
 2024 13:30:16 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7452.019; Fri, 12 Apr 2024
 13:30:15 +0000
Date: Fri, 12 Apr 2024 08:30:13 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v3 5/7] drm/xe/gt: Abort driver load for sysfs creation
 failure
Message-ID: <44mscm2sqcsqruroglajhv3xc4yo4xevsta6o3kcz6hogm4mfv@cewqpbneksds>
References: <20240412080245.1044902-1-himal.prasad.ghimiray@intel.com>
 <20240412080245.1044902-6-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240412080245.1044902-6-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: BY5PR20CA0023.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::36) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CO1PR11MB5153:EE_
X-MS-Office365-Filtering-Correlation-Id: a20baffc-5c6e-4927-d8a6-08dc5af4b03c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 99iroBBqRltsb5C30tyn/yu2mT6sAnjfEtns2rZlQ1+4wRWxQ2frIfp3HwUdxrhYvpgFTNReAXkDeBPKJCbIcrTbjx5sIHHaCjTemxe7shMWGl1P2Ql536XwhZQIer4pGAwL9CjXXAwtsep2VI/dhy6NwObi6q/AzMa4e8exMFNDyKmkne2+UCWhcIWcYThl61/a5igZMlYgAx3YjXCdbjQgsCF7BnA5c+NYrbWOL1MbhRKWIqeWYBFrVkKROY+wj8Vzp3pNHEfZESSiup3+tzhBXw2g8OzxRxg1l0I/QlWkVSOhUhLPba7RiN33daWPdQZHW3ctqoD3IK+Yee7ckdZ7cuHydjmy8VC+jlcx05nS6xKTRi2optdZRCx2319Lp/+K7EkKe59pUnM6WodHoPrQW/8f8R1/a3fm24hbO5EEC4cSd3vEI47/80fwBcdGcgPoaoB/p1/3kHgH4GZYCZ4D98OJHxogaFT9njTqviTOoP4QmGsgshUXwZ4jiqdGm/xGXdXDE3Vp71HoxPS1S2h47Stl3DfurHQRQSIA4J0KudLzQICnEJvN/dpgBGuDUmBin0yMtLYFgoJly+9tQkMrIyTkpByvcaJId+HAW7MyLaJebut/sllx0yvpb7BkMgRN5iQIacDwKqsyICGSkNiX7Kj/6pZt3FGBY5MOaBI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hGM1hZnLK2CXB38+py3yTK8bZdxMaaucUzTk7DXdQ1VQl8VccQUSz5WHpOTN?=
 =?us-ascii?Q?9eAa6mWG9uNI8rdBc/cQI3Z0JO9khmmWIUZ5hBM7rixHQlKDoFrMzQJyxWLe?=
 =?us-ascii?Q?CDDGNFczyocphLQq+OZYFsNAn2fVv+zSFNZyUI7tttQ6i4K+tFKO+B7MGZv1?=
 =?us-ascii?Q?pivDdrHksAHC1+klblMLhRUL0CcU7O8ju1+9ecoDN8UKzC46jdu7ablyxPHM?=
 =?us-ascii?Q?S3EfGpyadeuG/Ex84CLi0Oj35lRtq40o5b2r+TLBAQdvs+pv0W6aXUBPmmIX?=
 =?us-ascii?Q?NYBDLxMkKaqRSoE5QBOu2AUekmAZHxE0XcEpZmVTinbtTOv+GnCQgHGE8ZTP?=
 =?us-ascii?Q?CDvVhkgmB12uqz+eJLSqCsolz8Xf6cfXxR1lPUpPtDdQZEbw7kbVapsakdKM?=
 =?us-ascii?Q?KeSi3wAJfTWiZR/yQDqf+t0Oxmi/+jy4/xZvCSgfid6/Rbtj5n3vsux3agLr?=
 =?us-ascii?Q?qY+shXb5i0W9okrdwHVwt1YmY0bRVabloQk52EoTY4TUa7A+jRrnqPxQvV+8?=
 =?us-ascii?Q?Qhb+RcSc4lZwr+bCL2/b9cAKk+M22ULgfXl3W3UDJdoo9olYQjp71hBWoIUc?=
 =?us-ascii?Q?fTAOXCAhlozQeplVoqer54jRTtopsEKnLUn1BFaA0dUerJsrNmJGj0j08ju9?=
 =?us-ascii?Q?J5qdBo1128sGfJRo/YtMaA8fSEs+8r4Y3ZbSGDUkzb0fFi/Odih28UbTueYq?=
 =?us-ascii?Q?yOwcyhAFshHQ4J6ui0vb43oIDJJ6FQDnJ+mAwQ79UJNQYW1Z4uShrFLUvecp?=
 =?us-ascii?Q?z+YsqKaLOYzAdqyrOUuBpeD6Trx4psliVrSTE6xa7J8d1EvM36Rpx5HOjsuI?=
 =?us-ascii?Q?3xPZzZrsHm2FC/Dc/22fbjUJM/ZMq83q4KdO5qEkft6IdwXbu9o8LkrX1GoZ?=
 =?us-ascii?Q?0TfKu72S7IJIKM3/9r2zfxr4IAQXgIEbjx/ulkKhyV846aC6gvQ7uB+fCGv9?=
 =?us-ascii?Q?AGyCOp7e3uZPpOnyMBxUJHIfN45XGAXB6kqAg/KRP694JvJRt5GqCpMrM5gf?=
 =?us-ascii?Q?VM3LW+rgTkdOheBJM3tL0YdxZ/iSe/dOopOWG2Va6xACAD4CCYVg8GkXFpGN?=
 =?us-ascii?Q?5F+kGsVLRmBWRrFcpna821DPk9CWEDNnfs7JBMq0q3lFC1Vgc9PTovuSSLc1?=
 =?us-ascii?Q?fJC0W7YMj4sI8opyHgVK0NGAUym8Gj1sgejTj9XqPNrprpufV3FN3gSKFLwe?=
 =?us-ascii?Q?MzIfPK5fYydjb0hf7QCMUH6GsnIqHjya7scg0JHdBltv6+LrFZVb06I/EdjL?=
 =?us-ascii?Q?BNebBgYZZSEJwR8ZyqIgSSOlo68uacHFs4a9DZcRDyrA4hn63W+gnhXG3P96?=
 =?us-ascii?Q?0k+5Y/aDXahtQDDKm8QNsGwYJx5XoY5kewyQBzfmDhei0nG79BQ5PC9Y0rLG?=
 =?us-ascii?Q?GOMvEQ8zVn/BWeOV+mXPnIkbox//TMt7Hv2P6JIVJ30eT/TH7fm2ARVK4phQ?=
 =?us-ascii?Q?a2NL56bj/JQIFH0SnTuEZ+wSMJLkU9Goyn//UN96/YMaeM9VzBn1RBSX/8Gi?=
 =?us-ascii?Q?zwVlg++Hix0TeuhhrByaYRlFLwMhCehNdoBOawuzutIv8IHBlbZCyH3W4uAC?=
 =?us-ascii?Q?dbO9c/KveB//SlYjSvOM+X7ZbRJOjPxOa6F7NcrGjBKiSOOf56ORPC7L/Jor?=
 =?us-ascii?Q?6g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a20baffc-5c6e-4927-d8a6-08dc5af4b03c
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2024 13:30:15.8092 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UMSXQWTEuBFofB7/CTk21eu5i7jsvVeeh8Gmq38EZx67ezQJxdffWNAM7E1wMJJnsPJeCje/IFE+5DLFjlBhxpticD9oYmU9Dg8ENdfoBtA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5153
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

On Fri, Apr 12, 2024 at 01:32:43PM +0530, Himal Prasad Ghimiray wrote:
>Instead of allowing the driver to load with incomplete sysfs entries in
>case of sysfs creation failure, we should terminate the driver loading.
>This change ensures that the status of all gt associated sysfs entries
>creation is relayed to xe_gt_init, leading to a driver load abort if any
>sysfs creation failures occur.
>
>Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>---
> drivers/gpu/drm/xe/xe_gt.c                    | 16 ++++++----
> drivers/gpu/drm/xe/xe_gt_freq.c               | 29 ++++++++++---------
> drivers/gpu/drm/xe/xe_gt_freq.h               |  2 +-
> drivers/gpu/drm/xe/xe_gt_idle.c               | 17 ++++-------
> drivers/gpu/drm/xe/xe_gt_idle.h               |  2 +-
> drivers/gpu/drm/xe/xe_gt_sysfs.c              | 15 ++++------
> drivers/gpu/drm/xe/xe_gt_sysfs.h              |  2 +-
> drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c     | 11 +++----
> drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h     |  2 +-
> drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c |  6 ++--
> 10 files changed, 47 insertions(+), 55 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>index dca0e9fb3315..089e4513c7e3 100644
>--- a/drivers/gpu/drm/xe/xe_gt.c
>+++ b/drivers/gpu/drm/xe/xe_gt.c
>@@ -360,7 +360,9 @@ static int gt_fw_domain_init(struct xe_gt *gt)
> 			xe_lmtt_init(&gt_to_tile(gt)->sriov.pf.lmtt);
> 	}
>
>-	xe_gt_idle_sysfs_init(&gt->gtidle);
>+	err = xe_gt_idle_sysfs_init(&gt->gtidle);
>+	if (err)
>+		goto err_gt_sysfs_create;

see comment on previous patch about just re-using the current label.

>
> 	/* Enable per hw engine IRQs */
> 	xe_irq_enable_hwe(gt);
>@@ -374,9 +376,7 @@ static int gt_fw_domain_init(struct xe_gt *gt)
>
> 	err = xe_hw_engine_class_sysfs_init(gt);
> 	if (err)
>-		drm_warn(&gt_to_xe(gt)->drm,
>-			 "failed to register engines sysfs directory, err: %d\n",
>-			 err);
>+		goto err_gt_sysfs_create;
>
> 	/* Initialize CCS mode sysfs after early initialization of HW engines */
> 	err = xe_gt_ccs_mode_sysfs_init(gt);
>@@ -549,13 +549,17 @@ int xe_gt_init(struct xe_gt *gt)
>
> 	xe_mocs_init_early(gt);
>
>-	xe_gt_sysfs_init(gt);
>+	err = xe_gt_sysfs_init(gt);
>+	if (err)
>+		return err;
>
> 	err = gt_fw_domain_init(gt);
> 	if (err)
> 		return err;
>
>-	xe_gt_freq_init(gt);
>+	err = xe_gt_freq_init(gt);
>+	if (err)
>+		return err;
>
> 	xe_force_wake_init_engines(gt, gt_to_fw(gt));
>
>diff --git a/drivers/gpu/drm/xe/xe_gt_freq.c b/drivers/gpu/drm/xe/xe_gt_freq.c
>index 32b9a743629c..a0c57332d362 100644
>--- a/drivers/gpu/drm/xe/xe_gt_freq.c
>+++ b/drivers/gpu/drm/xe/xe_gt_freq.c
>@@ -222,33 +222,34 @@ static void freq_fini(struct drm_device *drm, void *arg)
>  * @gt: Xe GT object
>  *
>  * It needs to be initialized after GT Sysfs and GuC PC components are ready.
>+ *
>+ * Returns: Returns error value for failure and 0 for success.
>  */
>-void xe_gt_freq_init(struct xe_gt *gt)
>+int xe_gt_freq_init(struct xe_gt *gt)
> {
> 	struct xe_device *xe = gt_to_xe(gt);
> 	int err;
>
> 	if (xe->info.skip_guc_pc)
>-		return;
>+		return 0;
>
> 	gt->freq = kobject_create_and_add("freq0", gt->sysfs);
> 	if (!gt->freq) {
>-		drm_warn(&xe->drm, "failed to add freq0 directory to %s\n",
>-			 kobject_name(gt->sysfs));
>-		return;
>+		drm_err(&xe->drm, "failed to add freq0 directory to %s\n",
>+			kobject_name(gt->sysfs));

lib/kobject.c:kobject_create_and_add()

         retval = kobject_add(kobj, parent, "%s", name);                      
         if (retval) {                                                        
                 pr_warn("%s: kobject_add error: %d\n", __func__, retval);    

and the other case return without log message is about memory allocation
fail. It's kernel policy not to log on that. So just remove the message
here rather than s/warn/err/.

>+		return -ENOMEM;
> 	}
>
> 	err = drmm_add_action_or_reset(&xe->drm, freq_fini, gt->freq);
>-	if (err) {
>-		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, err: %d\n",
>-			 __func__, err);
>-		return;
>-	}
>+	if (err)
>+		return err;
>
> 	err = sysfs_create_files(gt->freq, freq_attrs);
>-	if (err)
>-		drm_warn(&xe->drm,  "failed to add freq attrs to %s, err: %d\n",
>-			 kobject_name(gt->freq), err);
>+	if (err) {
>+		drm_err(&xe->drm,  "failed to add freq attrs to %s, err: %d\n",
>+			kobject_name(gt->freq), err);
>+		return err;

same as above:

fs/sysfs/file.c:sysfs_create_file_ns()

         if (WARN_ON(!kobj || !kobj->sd || !attr))
                 return -EINVAL;

>+	}
>
>-	xe_gt_throttle_sysfs_init(gt);
>+	return xe_gt_throttle_sysfs_init(gt);
> }
>diff --git a/drivers/gpu/drm/xe/xe_gt_freq.h b/drivers/gpu/drm/xe/xe_gt_freq.h
>index f3fe3c90491a..b7fddbe7b9b6 100644
>--- a/drivers/gpu/drm/xe/xe_gt_freq.h
>+++ b/drivers/gpu/drm/xe/xe_gt_freq.h
>@@ -8,6 +8,6 @@
>
> struct xe_gt;
>
>-void xe_gt_freq_init(struct xe_gt *gt);
>+int xe_gt_freq_init(struct xe_gt *gt);
>
> #endif
>diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
>index bc1426f8d731..581c8ce75858 100644
>--- a/drivers/gpu/drm/xe/xe_gt_idle.c
>+++ b/drivers/gpu/drm/xe/xe_gt_idle.c
>@@ -152,7 +152,7 @@ static void gt_idle_sysfs_fini(struct drm_device *drm, void *arg)
> 	kobject_put(kobj);
> }
>
>-void xe_gt_idle_sysfs_init(struct xe_gt_idle *gtidle)
>+int xe_gt_idle_sysfs_init(struct xe_gt_idle *gtidle)
> {
> 	struct xe_gt *gt = gtidle_to_gt(gtidle);
> 	struct xe_device *xe = gt_to_xe(gt);
>@@ -160,10 +160,8 @@ void xe_gt_idle_sysfs_init(struct xe_gt_idle *gtidle)
> 	int err;
>
> 	kobj = kobject_create_and_add("gtidle", gt->sysfs);
>-	if (!kobj) {
>-		drm_warn(&xe->drm, "%s failed, err: %d\n", __func__, -ENOMEM);
>-		return;
>-	}
>+	if (!kobj)
>+		return -ENOMEM;
>
> 	if (xe_gt_is_media_type(gt)) {
> 		snprintf(gtidle->name, sizeof(gtidle->name), "gt%d-mc", gt->info.id);
>@@ -180,14 +178,11 @@ void xe_gt_idle_sysfs_init(struct xe_gt_idle *gtidle)
> 	err = sysfs_create_files(kobj, gt_idle_attrs);
> 	if (err) {
> 		kobject_put(kobj);
>-		drm_warn(&xe->drm, "failed to register gtidle sysfs, err: %d\n", err);
>-		return;
>+		drm_err(&xe->drm, "failed to register gtidle sysfs, err: %d\n", err);

ditto

>+		return err;
> 	}
>
>-	err = drmm_add_action_or_reset(&xe->drm, gt_idle_sysfs_fini, kobj);
>-	if (err)
>-		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, err: %d\n",
>-			 __func__, err);
>+	return drmm_add_action_or_reset(&xe->drm, gt_idle_sysfs_fini, kobj);
> }
>
> void xe_gt_idle_enable_c6(struct xe_gt *gt)
>diff --git a/drivers/gpu/drm/xe/xe_gt_idle.h b/drivers/gpu/drm/xe/xe_gt_idle.h
>index 69280fd16b03..75bd99659b1b 100644
>--- a/drivers/gpu/drm/xe/xe_gt_idle.h
>+++ b/drivers/gpu/drm/xe/xe_gt_idle.h
>@@ -10,7 +10,7 @@
>
> struct xe_gt;
>
>-void xe_gt_idle_sysfs_init(struct xe_gt_idle *gtidle);
>+int xe_gt_idle_sysfs_init(struct xe_gt_idle *gtidle);
> void xe_gt_idle_enable_c6(struct xe_gt *gt);
> void xe_gt_idle_disable_c6(struct xe_gt *gt);
>
>diff --git a/drivers/gpu/drm/xe/xe_gt_sysfs.c b/drivers/gpu/drm/xe/xe_gt_sysfs.c
>index c69d2e8a0fe1..21ed87715da7 100644
>--- a/drivers/gpu/drm/xe/xe_gt_sysfs.c
>+++ b/drivers/gpu/drm/xe/xe_gt_sysfs.c
>@@ -29,7 +29,7 @@ static void gt_sysfs_fini(struct drm_device *drm, void *arg)
> 	kobject_put(gt->sysfs);
> }
>
>-void xe_gt_sysfs_init(struct xe_gt *gt)
>+int xe_gt_sysfs_init(struct xe_gt *gt)
> {
> 	struct xe_tile *tile = gt_to_tile(gt);
> 	struct xe_device *xe = gt_to_xe(gt);
>@@ -38,24 +38,19 @@ void xe_gt_sysfs_init(struct xe_gt *gt)
>
> 	kg = kzalloc(sizeof(*kg), GFP_KERNEL);
> 	if (!kg)
>-		return;
>+		return -ENOMEM;
>
> 	kobject_init(&kg->base, &xe_gt_sysfs_kobj_type);
> 	kg->gt = gt;
>
> 	err = kobject_add(&kg->base, tile->sysfs, "gt%d", gt->info.id);
> 	if (err) {
>-		drm_warn(&xe->drm, "failed to add GT sysfs directory, err: %d\n", err);
>+		drm_err(&xe->drm, "failed to add GT sysfs directory, err: %d\n", err);

looking at lib/kobject.c, we can apply the same reasoning as above.
We even dump the stack in this one.

> 		kobject_put(&kg->base);
>-		return;
>+		return err;
> 	}
>
> 	gt->sysfs = &kg->base;
>
>-	err = drmm_add_action_or_reset(&xe->drm, gt_sysfs_fini, gt);
>-	if (err) {
>-		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, err: %d\n",
>-			 __func__, err);
>-		return;
>-	}
>+	return drmm_add_action_or_reset(&xe->drm, gt_sysfs_fini, gt);
> }
>diff --git a/drivers/gpu/drm/xe/xe_gt_sysfs.h b/drivers/gpu/drm/xe/xe_gt_sysfs.h
>index e3ec278ca0be..ecbfcc5c7d42 100644
>--- a/drivers/gpu/drm/xe/xe_gt_sysfs.h
>+++ b/drivers/gpu/drm/xe/xe_gt_sysfs.h
>@@ -8,7 +8,7 @@
>
> #include "xe_gt_sysfs_types.h"
>
>-void xe_gt_sysfs_init(struct xe_gt *gt);
>+int xe_gt_sysfs_init(struct xe_gt *gt);
>
> static inline struct xe_gt *
> kobj_to_gt(struct kobject *kobj)
>diff --git a/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
>index 9c33045ff1ef..93d08d682dd8 100644
>--- a/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
>+++ b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
>@@ -236,19 +236,16 @@ static void gt_throttle_sysfs_fini(struct drm_device *drm, void *arg)
> 	sysfs_remove_group(gt->freq, &throttle_group_attrs);
> }
>
>-void xe_gt_throttle_sysfs_init(struct xe_gt *gt)
>+int xe_gt_throttle_sysfs_init(struct xe_gt *gt)
> {
> 	struct xe_device *xe = gt_to_xe(gt);
> 	int err;
>
> 	err = sysfs_create_group(gt->freq, &throttle_group_attrs);
> 	if (err) {
>-		drm_warn(&xe->drm, "failed to register throttle sysfs, err: %d\n", err);
>-		return;
>+		drm_err(&xe->drm, "failed to register throttle sysfs, err: %d\n", err);

ditto

Lucas De Marchi

>+		return err;
> 	}
>
>-	err = drmm_add_action_or_reset(&xe->drm, gt_throttle_sysfs_fini, gt);
>-	if (err)
>-		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, err: %d\n",
>-			 __func__, err);
>+	return drmm_add_action_or_reset(&xe->drm, gt_throttle_sysfs_fini, gt);
> }
>diff --git a/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h
>index 3ecfd4beffe1..6c61e6f228a8 100644
>--- a/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h
>+++ b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h
>@@ -10,7 +10,7 @@
>
> struct xe_gt;
>
>-void xe_gt_throttle_sysfs_init(struct xe_gt *gt);
>+int xe_gt_throttle_sysfs_init(struct xe_gt *gt);
>
> #endif /* _XE_GT_THROTTLE_SYSFS_H_ */
>
>diff --git a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
>index daab970f8be8..62ce4fd1775d 100644
>--- a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
>+++ b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
>@@ -691,9 +691,9 @@ int xe_hw_engine_class_sysfs_init(struct xe_gt *gt)
> 		keclass->eclass = hwe->eclass;
> 		err = xe_add_hw_engine_class_defaults(xe, &keclass->base);
> 		if (err) {
>-			drm_warn(&xe->drm,
>-				 "Add .defaults to engines failed!, err: %d\n",
>-				 err);
>+			drm_err(&xe->drm,
>+				"Add .defaults to engines failed!, err: %d\n",
>+				err);
> 			goto err_object;
> 		}
>
>-- 
>2.25.1
>
