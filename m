Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD492CD342F
	for <intel-xe@archiver.kernel.org>; Wed,  6 May 2026 03:16:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8111C10E4D1;
	Wed,  6 May 2026 03:16:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MZHWTHGS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A37A910E4D1
 for <intel-xe@lists.freedesktop.org>; Wed,  6 May 2026 03:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778037405; x=1809573405;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=smLs8z/YEc/Np3ITtUdHhJsDqzYBmxJbEOU+2X9OUV4=;
 b=MZHWTHGSlrAeaHweCUG0pUrXudTNqlrYXtTlzQwowCJ2qp+fobWLAPOc
 +yo8TnQ1qDNVqXq93jkyzO0auOpL0izBD1ImkjVCBYH76lo59m0EHgvPc
 IjkvK3G5EdFhoIt/rVCNvZzAOXcyXJH0N8Zn0zkPeprAB267L74fiY6m0
 iqHFs54hA1pUD43snzb0JCXCDey+LzzKdOip60IdzLM6knvRHNUQSRNTN
 lgV2RkE3gikay6MsEB2Wk8k89wit3CaGPNtX0E+zdzYbZKbPp9dbuhBuj
 Mymd++JiNRzFYfuGtaSjMVzkmfbTE4n3zD+OGTewl7fWnl5OQSCGktPwy A==;
X-CSE-ConnectionGUID: dtOeLMyuShSU4fjtmqfbfA==
X-CSE-MsgGUID: 9ujoRLd5TTSsXgy72qV5+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="96489459"
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; d="scan'208";a="96489459"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 20:16:44 -0700
X-CSE-ConnectionGUID: qhIMQadnQCOZRNlUpxW4vg==
X-CSE-MsgGUID: kEdJo+0IQ0uHKKpQ78HdNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; d="scan'208";a="235002499"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 20:16:44 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 5 May 2026 20:16:43 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 5 May 2026 20:16:43 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.58) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 5 May 2026 20:16:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F4b+TV9mdLrWkFq4xvVfByb+od8TAA4Xe/PiiMDioou8OD6AKDwehUZ6kLU3BoYs+kCCnYJkcQU93fIDFxx9OSwRR0aeayz1dew3XB/vAksoVt1DsvErmLt/FIXf5lASYwAaFCC/IZqjxln/zvOLniSU98NG6Eys/FeS77pMRBa50d469RcoMPWMalJX4DdJ8aGThhsAPsXDuRgGtO/+xseSrNPYdb0wLlxrElEH1Rkiic8Hv9kLHKDjmpf2Wg6KcBuIZ3/MNRNowKYFWLjLJUT7oWi5bwdvrDp42dRfTO7fRNjG1y98vtpZFrDu2x1GRbrb7b1brI+kiABHZyWnIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BE/QlI6C5EQIesZeTrwcOmaq2ZQ9Pfyd8cA5B6YzO9c=;
 b=ZYZVnF9cE7FDHAosdOrATGhkv5VHXkYkCfGa9gKU0ohJYPv4eD28Xs5N99VLIzou7kyfbahSbUrJ4A1k6UUOVXSjiVs/EIaTpgSopVyghXzfUXSLe0loTwGiHS//J+nTVxoP/rp8UG0fjLdIZvqnP/rxKIu+QERWs0OWu8W7RxLFaEvZg1Ua7ik8Uh4Wctyzialx8yalsmL/3glZulLIwx+664351B4y33xnsHznhMlPytBCW5tFFOHrUq1sldpvH5mbfkq68G9d6yyUaoKqKPETKS/AJVDX6GM4NBpDAPy+J+5JDoCoA21zSa/wbRWpQrr7oBHKgvvX1Najqfw+kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by PH8PR11MB6729.namprd11.prod.outlook.com (2603:10b6:510:1c5::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Wed, 6 May
 2026 03:16:40 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%4]) with mapi id 15.20.9891.008; Wed, 6 May 2026
 03:16:40 +0000
Date: Tue, 5 May 2026 20:16:37 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>,
 <stuart.summers@intel.com>
Subject: Re: [PATCH v3 04/11] drm/xe/multi_queue: Refactor check for multi
 queue support for engine class
Message-ID: <afqylTDZF-Mu8FZU@nvishwa1-desk>
References: <20260505234408.3552147-13-umesh.nerlige.ramappa@intel.com>
 <20260505234408.3552147-17-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260505234408.3552147-17-umesh.nerlige.ramappa@intel.com>
X-ClientProxiedBy: SJ0PR03CA0125.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::10) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|PH8PR11MB6729:EE_
X-MS-Office365-Filtering-Correlation-Id: 94514e52-e323-4ae2-528a-08deab1de408
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: ADMAQ51DkDWzkWQNP/WOG25EBG3lYsKjgvVH0ddlNBqXGMcB3BV4Hxuk3ZSiiZ8jFFpV0a1WAfpJBw2V9GL2Tk8nOvJ+B7j2YW6cilH99KW6yQvmweNk4wduyyqgE0ziB9kfP1kaL2xdg6WJ4aLM/KHXdRq0PIRwlU4EO+dVQVW0O3pGkUuez/3Y8s6943qNHbFDb1jiDWeSOf5hoKYcBOs3k6R5/zqtSGUrWuINK6cc/M6Wy9bRMNbzdhrTqZE/cCtkEvwjUE2BViQLq89v0gtgPcDXKqNi0c6DH/ock/5U8D11ov5o/zI4YOHxrl0udvuz+bk4oXfRRhawyANrdl1XAY/rG4je7N4+N7gLaBKl/1ZqMDut30LzthnAtDSH2hngsQoqlLeXQu92lgNSxPtwodKpBzvH9Kn55ipaaGDzEKjc9IPO1bZ55v4feumUQdW+o4oK4jCdg9OfXOyjDongk5ULSPozCoKQfFfb57a/EGlzLpJ4Ni4zZ7mgJ/rJOjAm8eqTsbU7KzH+eHJWBZZiaCwPbiUAYEl20j9CeAdq007iqxXa7dOf1qGQc1vQ9iYSfsKlWjYNKGnIy0413wMLNkWfeb6ZZUXn0feMstAPM1+mHbG6d0ISOYfHYrubIxEVZgbVXJYoBrkmDgRiZHvYG7spn+51RYqXSo7qgvX6oFZpA2QM1nhkw+MllXl6
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IUu2l8N7F668x6s7wQdPuOJRRG34kV1eAUi2GtSPtF8qnxfPmmpvWAmXxZrM?=
 =?us-ascii?Q?aLeVtjeC9QUC6tIUJ1WIQbjesfyA7uOCib9fsOOczHeM1jbMGhuboh2tbTKc?=
 =?us-ascii?Q?4HjJrdQ6hkDXLKKMyjeAQFiV3oTa+Z0zhw3WHGd6aQADMPctgB50qUI2Xk+z?=
 =?us-ascii?Q?ZHQX0QSGpmoh3xAOWfTbTVr8MUXZSrV+Ydvx69b3MxeA/K5TfHgrk7nnxfRX?=
 =?us-ascii?Q?/6tJeIrYRrK0RMNi0TrwRSkQERYVui4oornQG1Yh+MmuUED/tAuD+koPjOSR?=
 =?us-ascii?Q?D4drlH97j8NhNaVIiui0HZO2UJsDA1L1IyUllzBMxbWyEhVZUUnbA8KXOYvt?=
 =?us-ascii?Q?x352wVavKgjQ79IvU+VuYdp8tYplabMS7YBH/xZ1ojOTlQxXzeMS7O3aTPVM?=
 =?us-ascii?Q?8NjQJrECJfltP4tuakBZTsfskL2aNf+jtpfaxK+QJQNgpzHQgQ3G6TJ9+wCi?=
 =?us-ascii?Q?y2QbBvP308nZMq0L/nFo3fnHa3mebluk8tJK4fGHjOJv1/ZndLbHmZ7xdlsL?=
 =?us-ascii?Q?cTtajh6Ae9gP3UVBvj3CSGRiZAix/UiAaucyQv+JwLQpuhkFggILmo6mTkwV?=
 =?us-ascii?Q?MO33gPnJC4PaZkwUDVr2OftiS1fe7QFXZx0bcMsovD0nH0SUfsMcOEpsrFYI?=
 =?us-ascii?Q?Fxt/iP1clHq4+nALNQcTTJenGgLoZ5o51hvOVT5hGvzkHoNglm7O+zdcn8zB?=
 =?us-ascii?Q?/FfbF7KuOC7NAaUvAAxx6j19L1vfpWvI8vVoI0UESNeTeR5pr7Lv63/7xXL1?=
 =?us-ascii?Q?q04kNcLhH0tm8N8c8fJ2q3ZehLP1ShNDFIJoACtdgj8Rf2u9hXw3vpio2dI+?=
 =?us-ascii?Q?igFQHbG7zB6V3BdWqUBDDQfyxVcsg5N5uo3igm/KdsYLpYM0RXwHmEvf+XNs?=
 =?us-ascii?Q?27aZofnRUlxY9GaQKEsLxjqgOoEmphU9aR0lVACKoajsoyQ2GfvrMZk4QBh4?=
 =?us-ascii?Q?fRJ37HGyWQsYsi4bYfv4GkpQ4LqpfOdmmltIVksn1+5SKItIXWffxhhHV2CZ?=
 =?us-ascii?Q?riapLdpkN1ceJ2Poa9Uax3obLRCoYNwLFpnwnxiKgrFsHW/LJusiXrmWw559?=
 =?us-ascii?Q?JBTNT8URH061RHNrQCulWhyl1YkCen8G63OrHbtiyA+tDJTIhieR1eCUE6UP?=
 =?us-ascii?Q?lSGDj6W4gxkK3jVLIBpeqIAx9Uz22vtv8ZKig5LwVIlRIU/Vszk0Zi1ostOQ?=
 =?us-ascii?Q?BEQ1PwC9OHxr5wnMf/H6zPXFvZth4rJW7d4iZGtMLCT/avbFEHpyRuRxMyln?=
 =?us-ascii?Q?wHQjANlZp0yt3j64l/9Z5TDde1WYZ404ysKjiv3kf/zfABfcTcwYj8Ssy4af?=
 =?us-ascii?Q?u+8GlsgFSf+YWKS7pwN1ELbUp7o9mW3OdgwgXAuHy7Jf/4zYBMFKfmIMoHON?=
 =?us-ascii?Q?PSrUcWgpuhS6bQUk9MKboAFFra8I+YAnoZRicRqXpY5Wz4Yu51TepwmiFjGS?=
 =?us-ascii?Q?9Du1d1Gzg7vQYNxq0gV/LQ6Hi0sHg8XlkRa/wNgnQcO8fAlJFWcRNTbz8fj0?=
 =?us-ascii?Q?C/1z5c7/Kf8rEejg6uZbfNGUctiD5SplkjaTvniF+1AFnS0+bhKX4zLDNhAh?=
 =?us-ascii?Q?L/qPbR/Dfk6PydKxiU4pXKQhi/3fUK0NYGK+6MFT8GlG6g+VLD2d8HdtWX/B?=
 =?us-ascii?Q?mTG/QiA9EgXD0wJevrHDa543GD8c1ZCDxlDisUXHhXsPaSru2BusLJ0rTA1z?=
 =?us-ascii?Q?fO8KKdaaPKb0ouTVANJFMqLBfi53Y6EFAWClnYiGctrMAIXDWwLxmiqJI6gp?=
 =?us-ascii?Q?DUn65+wFfFhtTcDp9clDSIfGhMDvLnpkQilTv3YUtWusdGRzL9BX?=
X-Exchange-RoutingPolicyChecked: szt45AA6+dJdyfn2BA9THuAKG6LWX95PWZe+AJrHtaHcgmbSXPhxZBa+vsOFaDDb/PhQjlPKFmOyN6upT9GVGGiy4VrWhv1W0nVzU0vbW0pBFwU77Xu9RekuxyfWXswx+stoYhyaIogzR+jaUAt0uOeeRp8PLoyEobF8/GVfdKyLCkR5iPausjVp85A/BUB/JQh7NUK622whI3o6JzUHNM7ZkJUDle2UTd9gSI5LOfTUnnw/YHBii1MW+3K5Pj5Rws83AUwfuvod6Pq3PxJA/l41FX0wTletHEWJOEdVXeB87Wz4RxQ3qy05A0sf+RaF5xk6xlXWk9Iy3XOKuYHE2w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 94514e52-e323-4ae2-528a-08deab1de408
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 03:16:40.3094 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AJqCpFSs0H84urMhIX4+n3RixenGx4oer2Ge7f4d8IPdGgzlKmHPDR7v2XBr1IDwwY2THU3OGwbfqxKTmEONHjU+J3hZvFjvqIvK4ig7exEBoa3PZJSDCbigzWtVlVXJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6729
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

On Tue, May 05, 2026 at 04:44:13PM -0700, Umesh Nerlige Ramappa wrote:
>xe exec queue code is using a check to see if a class of engines support
>multi queue. This check is also needed by other code, so move it to
>xe_gt and export it for others.
>
>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>---
> drivers/gpu/drm/xe/xe_exec_queue.c |  7 +------
> drivers/gpu/drm/xe/xe_gt.c         | 14 ++++++++++++++
> drivers/gpu/drm/xe/xe_gt.h         |  3 +++
> 3 files changed, 18 insertions(+), 6 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>index 071b8c41df43..9b36ff5b09a6 100644
>--- a/drivers/gpu/drm/xe/xe_exec_queue.c
>+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>@@ -852,11 +852,6 @@ static int xe_exec_queue_group_init(struct xe_device *xe, struct xe_exec_queue *
> 	return 0;
> }
>
>-static inline bool xe_exec_queue_supports_multi_queue(struct xe_exec_queue *q)
>-{
>-	return q->gt->info.multi_queue_engine_class_mask & BIT(q->class);
>-}
>-
> static int xe_exec_queue_group_validate(struct xe_device *xe, struct xe_exec_queue *q,
> 					u32 primary_id)
> {
>@@ -931,7 +926,7 @@ static void xe_exec_queue_group_delete(struct xe_device *xe, struct xe_exec_queu
> static int exec_queue_set_multi_group(struct xe_device *xe, struct xe_exec_queue *q,
> 				      u64 value)
> {
>-	if (XE_IOCTL_DBG(xe, !xe_exec_queue_supports_multi_queue(q)))
>+	if (XE_IOCTL_DBG(xe, !xe_gt_hwe_class_supports_multi_queue(q->gt, q->class)))
> 		return -ENODEV;
>
> 	if (XE_IOCTL_DBG(xe, !xe_device_uc_enabled(xe)))
>diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>index cdc678d1ae1f..0b49252e2001 100644
>--- a/drivers/gpu/drm/xe/xe_gt.c
>+++ b/drivers/gpu/drm/xe/xe_gt.c
>@@ -1170,6 +1170,20 @@ struct xe_hw_engine *xe_gt_any_hw_engine(struct xe_gt *gt)
> 	return NULL;
> }
>
>+/**
>+ * xe_gt_hwe_class_supports_multi_queue() - Check hwe class supports multi queue.

"Check if gt supports multi queue for the specified engine class"

>+ *
>+ * @gt: the GT object
>+ * @class: hwe class type
>+ *
>+ * Return: true if the hw engine class supports multi queue, else false
>+ */
>+bool xe_gt_hwe_class_supports_multi_queue(const struct xe_gt *gt,
>+					  enum xe_engine_class class)
>+{
>+	return gt->info.multi_queue_engine_class_mask & BIT(class);
>+}

We can make it 'static inline' and move it to xe_gt.h (no need to be here).
Also, may be xe_gt_supports_multi_queue(gt, class) would be a good simple
name (don't need hwe_class in the name).

Niranjana

>+
> /**
>  * xe_gt_declare_wedged() - Declare GT wedged
>  * @gt: the GT object
>diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
>index de7e47763411..1972ab01e716 100644
>--- a/drivers/gpu/drm/xe/xe_gt.h
>+++ b/drivers/gpu/drm/xe/xe_gt.h
>@@ -155,4 +155,7 @@ static inline bool xe_gt_recovery_pending(struct xe_gt *gt)
> 		xe_gt_sriov_vf_recovery_pending(gt);
> }
>
>+bool xe_gt_hwe_class_supports_multi_queue(const struct xe_gt *gt,
>+					  enum xe_engine_class class);
>+
> #endif
>-- 
>2.51.0
>
