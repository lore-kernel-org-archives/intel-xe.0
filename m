Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A478EC7115A
	for <intel-xe@archiver.kernel.org>; Wed, 18 Jun 2025 19:30:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AAD110E8EE;
	Wed, 18 Jun 2025 19:30:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GXH22bO+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F71010E8EE
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Jun 2025 19:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750275021; x=1781811021;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=4vvbHBV/RFHzct7dJiLTE2qxusOtojQXaS9zKuL/myI=;
 b=GXH22bO+UjYOKcpnY1/C/pyBBoXAKYblTO2onsAvrvSBLpWV9jY4ShdY
 qA2FS2IlV/D3UgyWXXHR7JM2MFQjgQn6FhejivsAaUlpqHn9lI9KCXpEB
 o97uQ9QjdQJERhsZtsX+dMM+usYMeuHxDdee9uWWjGkOFptFe4udRcE7F
 eSbANVpZbcduLeH8Wz6nQHHDs/w6xXZrCVGXM2pWqP3l0OZ65oXfm5Pry
 kCW3XfAIroC1F3EbNlsRktIoc6HPojsfwKtSzsh0D8prC1ICB9Vd+tAT2
 osqvzQz4OYdwUPqWB2TYUSAmqxJYYd8HLA8nCyHIisZyeIUYW1Fpx1bMI A==;
X-CSE-ConnectionGUID: br/5unMzTNehmLqbxrrHUQ==
X-CSE-MsgGUID: RGF733coRt+BMWmWHaHHTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="52382441"
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; d="scan'208";a="52382441"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2025 12:30:20 -0700
X-CSE-ConnectionGUID: SgwBbYSbRueoTLT+2YJr0g==
X-CSE-MsgGUID: Lh8uTMlyROuwI2xU4mYJEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; d="scan'208";a="155586637"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2025 12:30:19 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 18 Jun 2025 12:30:19 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 18 Jun 2025 12:30:19 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.74)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 18 Jun 2025 12:30:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=akaPogKr0yxj3wnYBm+PeswB6TMsmblszlGshByY1uozZm5koAB2IrQz8pmDla5Cw5cEtxLPczUGZhNnlYKSw9hPK52eZyvwzmunZ5ivE/FpQPOp9w2PVDiCPXyqH7U3w4A+2jdKBFTCB5A/NxCz5mVsXF2KKTBrui6IrDZ4OMUteogXN9dtGuJap1/6Cu5ut4v6zMOHDCNFKlIDUycTBzPt3e5KkikEmtLXkpCX8CThM9M4VWqvgSE0Aa3HarRLnCRTiTHZZk19FY5J88nAo1by3HzXINH4KnlXKVlfJ6oHLMUX3aZFtyHiRnQIkP36QsS+OLAHhOqp9F+OrIqd5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rImB/YYrbcF4EbjhTp8uRy0K5xnkqEvAKbMSYksoZs0=;
 b=PLySU0W7Rrky2sz/cRxuhuSBjW5x+TE3t5Hy8hE0ha2EOVTMXsd43PzhfgpUvwZc4IeaWnvbMfdgap2qpLQTvs7QShIe3QgCLz5q56o7YNl49v5APKOD5pPb05fWgD0IXaL0xiBX5Io2mNzClpdesYzgqz6E74Q+Bc6c+mOlAMsjiqDrUl29FyVGZ3G3NZ3w4Ga1i5d4MRWguPnEc7y/OeW+e6KCJF/PYgQr2UXxyAPqgwatFZLwFJmU2AZIq/L4pO4o6RqMpE0byXENhuATsQ/8A8EX8TNQFrYudIhioA2ucjsu6xS6CzGy2WPiE12nsMN2P++BpzpFOuqwWl+r2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SN7PR11MB6677.namprd11.prod.outlook.com (2603:10b6:806:26b::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Wed, 18 Jun
 2025 19:30:15 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8857.016; Wed, 18 Jun 2025
 19:30:15 +0000
Date: Wed, 18 Jun 2025 14:30:12 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 5/9] drm/xe: Only dump PAT when
 xe_hw_engines_init_early fails
Message-ID: <a4ww2zfhykv5zrqjmfbfy53i5edn3e2zdpbjyipcq667beiqj3@zllywwugf3j3>
References: <20250617180132.7059-11-dev@lankhorst.se>
 <20250617180132.7059-16-dev@lankhorst.se>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250617180132.7059-16-dev@lankhorst.se>
X-ClientProxiedBy: BYAPR01CA0060.prod.exchangelabs.com (2603:10b6:a03:94::37)
 To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SN7PR11MB6677:EE_
X-MS-Office365-Filtering-Correlation-Id: e23b1cf1-5398-45f3-3293-08ddae9e8d69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bxwW8g/3u3OlpImA5TtI3P8JnNY1o0MyFdZ6MZhLrn/xbBrAOjpepmgy/i9P?=
 =?us-ascii?Q?8bzl3YCys42uvQSUmcCx8Z1pLgEL1TkFgq+ZsH253pFLxj+MCIoDop2fuY6F?=
 =?us-ascii?Q?f3K4l6NhfcKQk7kPslEgFy3tv5GYWyb1xBZVxL3e5YUmdjjKuoBfgEQHs0fm?=
 =?us-ascii?Q?cg+omAHFBquzUY1Eysf+VDHcEPZzYSb0vyaS034LWsJfEobJxcw1Tz1uFG1R?=
 =?us-ascii?Q?jF8v6H52SqeXxApfFGK7zvrWwhMTldyuMGhXWyelxoVCQJwmJYB62a84ca6G?=
 =?us-ascii?Q?KB32YSYXHqcYsI1G7CpsxmDGMPBhE/q3arB4xUA0o5Wf0QjiVYTshER5x/Q+?=
 =?us-ascii?Q?iHrUYsNozWS89ueuZYy8QWMn/5OeW69k5QbiDma7WZ17PzskA/Lx8DGjJ91x?=
 =?us-ascii?Q?T56OrJA+eAYZyTFgEhmVChGCAIkM19nU9j+130W8acMHcIvBbznqyic7xaG/?=
 =?us-ascii?Q?iubFXGu3tbIS16hqeJpTqNs7CKb7e+yO9wkGIcjEWGwo+WPyeXTXaQfeBK3O?=
 =?us-ascii?Q?NCF0W8kmxR43g2ewVAdxelFFUgTCadMX0/w8FeWWyDWXrsn5Sed0TdBFPL6J?=
 =?us-ascii?Q?z7lCrkALKUgQXVJx2otJsNGHiVU7/D9tYr1xXNw4CVoICRKJdwlbYm9ljp29?=
 =?us-ascii?Q?t/4ozd6ZNPqSEVih37v/7ohTeiPs3EIMbkF7jHY80W9+LnVjsqmjjPHSQs4F?=
 =?us-ascii?Q?QvjXVwBZap2O+2ELU6j3kJTqA875xMQ7k9bVh+vQBxBG2udBy/B8WyWPVwZw?=
 =?us-ascii?Q?rF/XhGoqtIIaXJhVnp2fMEeU9d04wnRV18BHNBKFMjibgPp5m5FvuQMNpydU?=
 =?us-ascii?Q?Ywb+dmP0ZKAFJm5S4ugvJaI5Ii8G/PRT62iM/5Tk4vTxmpKhaxeKftuGiWj1?=
 =?us-ascii?Q?1FiDo1p/QMNFcWZfkfbuZwpBcvv3D6c12pnv3/q+NgNoRGdgJCLuDuSZo/nE?=
 =?us-ascii?Q?akxbm6KNbu1z2t1zBqRNh2wWMS7SD4rhLaEDVZIaQl1iV9q68Lv2Vt635GhW?=
 =?us-ascii?Q?WOCc1N5zcvo7Sk4GCLqjFzWaGedsX7Cu4heuQMMWfHfbJTCpr8u7M2uYwHaG?=
 =?us-ascii?Q?85lbzYiZzyPcMcpmlw1I3qSL9GNPe8dAD4/u0TJSgYmr0ZAfHTp0kBljfPdz?=
 =?us-ascii?Q?xvLx1BzkLk1t+/95rZ/azSMWslOtk5GdfAoiNlh7y5iWWmODfeVv4xwOYD0b?=
 =?us-ascii?Q?D/gVsr6esuFF1RN+c2hrFEjaDFncGXqJCzycy9aOpI5Cp1wT8AD5D3cPc5X2?=
 =?us-ascii?Q?iWwM8fdnjdezf0YTkan8ucFtcPelf2tiXh2wMFt948eyPWdtXN+dC5GdMxN+?=
 =?us-ascii?Q?blshOWtETZkLXOeWspVpdCrfDMOycrqoNvxOZVkdu/FZ7rTGhkNyM4CBRmtx?=
 =?us-ascii?Q?lsBl4EjcwjrkB6s3x4UJMUSCIIBhMnDRIsQXrnz/gpnpQub2BTUKdpLdAsEt?=
 =?us-ascii?Q?FDcOjikKmlg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?X+shQB2TbkjnQ5ZMQl8xWKxFSnIYaqXcbDVC4Y9nJyl9TsbXEzIGC0eFq8FO?=
 =?us-ascii?Q?C+RJYxqdTc6/vu/ICCONbtLlLhvGhMeMxL2oqujMMizwTcy0ZoPTgpQjzU65?=
 =?us-ascii?Q?eDKwjX5l6n6k8FWhj3mGFZhZC/SOoFSSJnNtDOebmPyvMx7TBZ2oFAoeokZd?=
 =?us-ascii?Q?0RyAMVTBxCS31Cqv6v5qvZ0afSbALscwUKpOl0dgVIROwmKYMFyf4XsZbVvk?=
 =?us-ascii?Q?PDzIkjGA8aJspQGuSYMQq1H6pqNyGgLUpuKIy6P9SqUIAQD+S64avJHBtak4?=
 =?us-ascii?Q?mqzHGlsWVu096Ou+l2T+W6XRLUnT/+GxjQ2OZ0/ajx6h3lA+Pp3doZteS/W7?=
 =?us-ascii?Q?wAHQlG85OCS3yYaQA/xKSbyx48y38eEn1fG3ptQDRSVcsHpJOjiyMDyIFzsG?=
 =?us-ascii?Q?3c0i/NuT6aSKd6X+mVU7ZLyIhqM8eyGHdCsnAC8ms9FJZzGTndtqNRIvL5pl?=
 =?us-ascii?Q?jEDH0rAj2kqbGucjPuTuFw2WLZ8hRWeoujh5zMvxWNg+zO6gCbaWi15vJN7t?=
 =?us-ascii?Q?VBMK5g2D9CqBVOLERKOFLhpBMonWcy65VY1OXX++1XGUWUs5bdHxBNNzLY0f?=
 =?us-ascii?Q?oktvA4wrr+evNKjr8MqA9l8kSHrFU/Vj3oLKbiuM5Yy2aMX0w27UpRPf7RQr?=
 =?us-ascii?Q?ev7xXMOnJ47jmTdniSLQz8PgbUMHYFUA1tCmR4aMkCY5XWh5FFJFFHcfLw8v?=
 =?us-ascii?Q?RmX6hSkYvhZ9N3Ypm+s0i5fAybLHOaFYKNhe8V8Y5r6LWwze8i7Qpz6DmQUl?=
 =?us-ascii?Q?wT0T2OHOuX/nW4Q5x3/FkHbJBJxZzFY0pa8FA5Q6F0Z6J2I92mwTsxiZGCFO?=
 =?us-ascii?Q?Uas+f4tU8yPNd7oKfBAUctmFna7Lj4HONPL7+3m+jzxFEg7msAR5OvoUcFKr?=
 =?us-ascii?Q?mR0we2jPF5RBF+W7VgSWzvVBVtMyGgBvdf5tavKhZLIyPgOXtqbLrqG/3lA4?=
 =?us-ascii?Q?cgcBLbp6Lk6OMSGe2VcRXBEGlNWRG+cLl5FubUvysMylU6Qrtr68oPCyHP6I?=
 =?us-ascii?Q?wIekITW4IfwTW04LqiJ1axcJk0t6qIFRNy4jYg+fpWBsyQg37VCsToe1WaI+?=
 =?us-ascii?Q?zi+5zlm2B05YWqhZ06eBXOxLRvEzHfiQI7htmzwAon67EvxYOYw6Lpt/fdq/?=
 =?us-ascii?Q?Gji0LK4AQUxVGFGRfbmXzMwD80YlEVybch8Z1jReDmxN9G/bfb0VEMwMtJhW?=
 =?us-ascii?Q?jtP94ITMdNf45ia1CUCl0MeEPTiEfK/MInuc2E6a8l4dp07R3K2WRFtLeyws?=
 =?us-ascii?Q?H2gzQCC+fDuOk0V96ySrrcLP8JTlX+yBKMnfXj1BkNm4FqAwqev0KQus7yGJ?=
 =?us-ascii?Q?DZ4V5Do7KTCIlGs8Zr5ookXFluu6bcG4tIaruojY/mV6J3Jrqmjjuoq6U589?=
 =?us-ascii?Q?nwwj49sHPNPWJcjJ7Y32GDxDycD18EfYFOp3QZx/S3cysJs7KV2l33y9O23n?=
 =?us-ascii?Q?YbRaI3PGTZ4NXT2NkxYr6d6ctp5QI198WueutvsNEHGd4ieVtkLXu1SvCl9a?=
 =?us-ascii?Q?N4l0YTADNjBgSUY0No1Qc51Flx/sY9j+xwQ2hXTxu4ySxpqvHQtld7zWkefB?=
 =?us-ascii?Q?faEbP6KCltV7vgLbXXrmwZbbTi5oLVl42yRcMVlcfXI30tbJuVqyMI8wne+X?=
 =?us-ascii?Q?cA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e23b1cf1-5398-45f3-3293-08ddae9e8d69
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 19:30:15.8438 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w8Xp9LStFZNLN3P0qUEZ70eOHrqEtB5ahoLZbnPYbUT6HRPnAP5dw/Y+8dCSVLvWODP5TQs57lUUrR+FswzqV+q8IH4zVFD/tvIsDvVUCU0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6677
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

On Tue, Jun 17, 2025 at 08:01:38PM +0200, Maarten Lankhorst wrote:
>After discussion with Lucas De Marchi, it turns out that is the
>specific caller requiring a dump. This allows us to cleanup
>gt_init in a bit.
>
>Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_gt.c | 5 +++--
> 1 file changed, 3 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>index 6bc793043b400..98360986df7db 100644
>--- a/drivers/gpu/drm/xe/xe_gt.c
>+++ b/drivers/gpu/drm/xe/xe_gt.c
>@@ -464,8 +464,10 @@ static int gt_fw_domain_init(struct xe_gt *gt)
> 	xe_gt_mcr_init(gt);
>
> 	err = xe_hw_engines_init_early(gt);
>-	if (err)
>+	if (err) {
>+		dump_pat_on_error(gt);
> 		goto err_force_wake;
>+	}
>
> 	err = xe_hw_engine_class_sysfs_init(gt);
> 	if (err)
>@@ -486,7 +488,6 @@ static int gt_fw_domain_init(struct xe_gt *gt)
> 	return 0;
>
> err_force_wake:
>-	dump_pat_on_error(gt);
> 	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>
> 	return err;
>-- 
>2.45.2
>
