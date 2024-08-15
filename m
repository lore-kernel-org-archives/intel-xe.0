Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F74FC52D7F
	for <intel-xe@archiver.kernel.org>; Thu, 15 Aug 2024 22:07:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BDD510E471;
	Thu, 15 Aug 2024 22:07:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EQXpDG/l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3EDB10E43B
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Aug 2024 22:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723759668; x=1755295668;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Qw1MIFZmWoDjikNpo3KUjAdOq2Q9mJbzfmw2/m1JkpI=;
 b=EQXpDG/lKW8WY7fdHPxlLehuWtX0BJR/VFxwa0gU/SHotivlhkbqzu54
 cfuh8rbKGB2ww5fKDXoe1Uh70prGQIt/JMyPWnqXGEq3A/wqeabkUoTeS
 8X5YWgKEO+4OiJ88mh87ukON77UK3yh+UkQWc9UuWgerqYxLjhIZulwi/
 Sgm4gGj7SySoTXAesydNv7WU7gjd1waKLAoQxj8OI2ciSjYnWAcvBP3m6
 IHKBgaWDU8+GUES5LkZsZO0WoVKmvhgzjjPIZUF840PB1AEuZfIokbOUw
 HYk/RaCtF97SFEXqOT2L1j8jj+6Bs38lBAHvlfGIOz5V1aj38r+LllgKq Q==;
X-CSE-ConnectionGUID: T4L8iPThQRyQTy/EihJvtA==
X-CSE-MsgGUID: imXm5Ml6QKuISSQne64J7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11165"; a="21591714"
X-IronPort-AV: E=Sophos;i="6.10,150,1719903600"; d="scan'208";a="21591714"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2024 15:07:48 -0700
X-CSE-ConnectionGUID: rfVjcXtIThaekgq9mM/hfw==
X-CSE-MsgGUID: NxrqmjuaQJa7FSHl/E0ehA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,150,1719903600"; d="scan'208";a="60266685"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Aug 2024 15:07:48 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 15 Aug 2024 15:07:47 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 15 Aug 2024 15:07:46 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 15 Aug 2024 15:07:46 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.45) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 15 Aug 2024 15:07:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m4kwp0nIbEZMb+htY1LkuDB8KSdOT+v9I0xDxMvWQZ49g0Hw91VIPh/IWt7ePVCBjz1G7ZD/tcAarlC/WkOq5nb57WsNgvwZ9rPXMzH0/cVJNWSE1klMb1gjlvlODgtugTJ5h/RcPKSufdljj+OWlzQjGiuk8FQUo/lh04Wd0nRyDUYOG0aLmE3mJgzxZ9HTblfQmIbztanL25S4knh1R9lfBzfnw//9kT5GGqAvyQM5u7u7x28ppxlCgITfVshojDtuuyJ49rYaVtI0RB4rOy6BBL8urUwMNb6KeqVJ9XZUKLm4wAhT8Wb8YRGvmU66YnnXKKdFiWctz6Ytu3V5MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M9n4zj4tm68dbxIoJLq7qX24KVWzpf68sEZxKyeR4vU=;
 b=mRUHzJZG1a70zXex8wkTR/JlLNm/9SapkVhxIjw+DwVHgC8YdJm7x8K5jIL/hJP0rg+ZgmFly0cvqfFWSbqDKVYbSdmK23KEG2JmF8GQvZ9Ek35/XOUUh+U7OGxhBzjtnwx8dWPb/etPMQdY38YLYn2ROYxrxlUPRTgv/2fzVzEd0kUyy9p/57vJOZJ/9pLUzwFl8Qwa3xp3SZnndS0oMusR17Nu42PPn7+VJ8K3djXqOt6brHfaRlKuL4Z1Li94OW4H0n+b8Raat8ZK+A/j+TArc831EimxMu7yy3WskOV3hnFlU98ArUo3BOavi7448y8h+Cbd9ih5ie/IIDtxgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by CY8PR11MB7133.namprd11.prod.outlook.com (2603:10b6:930:63::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19; Thu, 15 Aug
 2024 22:07:43 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7828.023; Thu, 15 Aug 2024
 22:07:43 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: <lucas.demarchi@intel.com>, <jose.souza@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: [PATCH 03/12] drm/xe: Remove unnecessary drm_mm.h includes
Date: Thu, 15 Aug 2024 18:07:23 -0400
Message-ID: <20240815220732.49675-3-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240815220732.49675-1-rodrigo.vivi@intel.com>
References: <20240815220732.49675-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0P220CA0012.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::24) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|CY8PR11MB7133:EE_
X-MS-Office365-Filtering-Correlation-Id: e07a6d29-7bc6-4f48-5e59-08dcbd76b002
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?URejZDGQM0evJ+Oh1o3mJop98BQBNUbuknx7+S6/XPOaPAwomgMj8QH6i3kQ?=
 =?us-ascii?Q?10FoznMJpGAWEXy9MFSCm6wnTgfeetn7iZPR0v90IewqlgpHFdocj2GcZLlS?=
 =?us-ascii?Q?+yPInXYtQj08qoUc8xMhVrdakvABrC0TOYEtuYgn4TXzjIgVMu0q/BVr69dM?=
 =?us-ascii?Q?oSvXWigUSVGEFLx/pBDpL2fwlbkFeY+dgfWcBNcndyFIVvXB7hj7qx7xE5AZ?=
 =?us-ascii?Q?v0Lcr2UzGMFOjjXje6NHU5a2tIipgKKN3qY5tLbGmOvCpJIpciqwpuv+Ihf4?=
 =?us-ascii?Q?bXI+YLoUzqyCBfXfjlWdQL0HqxTFFcY694cn/jAsPjxSIx9kCmp/jSgAlZWv?=
 =?us-ascii?Q?esrLIQ+RxfTP1aIAWSum21a6TFjo1isOe2My3rijBGnU3+kjIh6eVSfdXEJZ?=
 =?us-ascii?Q?SY/Oxfp33t3gvHDUKqMMex84kDiryR7118Q9rPVDlI2bIPqvh5gYFCNDIWEo?=
 =?us-ascii?Q?cmff3G7KSi9smU1LTJmuPR/PMQgHiIq7UV+WN0HYWZTsrpD08snvHL3g+bGQ?=
 =?us-ascii?Q?0KN/FAojtzGfUnucP1vsjl/UCRIpSDyV1y2ARB95L1wrBDZUPbMJpC+tSi49?=
 =?us-ascii?Q?rWP9Jw6bIaglE6xawRhC0y6e5bkizuAmE1imRz+orocr/6GBBYBoWmkG7Rmo?=
 =?us-ascii?Q?8REs4P6ezfQVZldxsnlKbESWeYuiQYgE1FFqPHRg0UpeTvnSB4tLUCcZu+aI?=
 =?us-ascii?Q?afMMClTKYI7m9J3+nYllC4KQv5j4J36qEcoj76tf/6gWEq6NkWpIZDsfd3tP?=
 =?us-ascii?Q?/l8Y39GIlYUlZZnmV2rwxdjfUQ28vHKoS+c4gqWXbf19Q6ti9SW8vBe+m/av?=
 =?us-ascii?Q?cX4c7gqtZu3KWmHGjOsC65nwrhS+dzGFgYpWCTHO6JPFHQffzln0ZSboRE0O?=
 =?us-ascii?Q?8H7JFbMjz4DcUghgqo52M1qnkYhPTJfj6yNBJ38QjoL7tNFaAfF/V9WmHXHk?=
 =?us-ascii?Q?BZRb8sERR8LaOET7goEvbDiRXHeqH263+DElgqNT+tmj8S2igWNIlGxBWP6t?=
 =?us-ascii?Q?dt+tiIAW3v2Y+8RP1zgbCx6r9OrcChI6MSTga7zmtfaw3oJn5eFP8msZVNwP?=
 =?us-ascii?Q?3HG4QNZJS88KUuP/5/BZs3cemmROmRvFWNknV9gErjxMafd26fZzyWSyEotL?=
 =?us-ascii?Q?NPNrcnS3rQDhyInvlWjKI1aLctfnj7Wgq4JYGAIoelTI9makgHJsgF/geCnB?=
 =?us-ascii?Q?xAbPCnvN038j4Ia7pyVvo36238j2eoFlxWRbmEeeqdWDyUK4BYMUe/mhLCNj?=
 =?us-ascii?Q?VuqnfpZa6mUTW+GGne93NJiKQVexALQGr6ZaaA0fN2P8TlzbjjLqpDKUtTSs?=
 =?us-ascii?Q?L7rSRI+USxcNdsgiOV3x1BUfICW432ilWhNdoHNAUfNSHQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?S1nlfUwdAV3qwY4VfV8aEaS0Hc64cBorJVcBhn1pVlNVqwL29M466YlSPzpE?=
 =?us-ascii?Q?UVU6YrCaIK9M0SysWmq9VS9P8XN42/n5xDHsCCewlwVC/hCKivGFsYD5ztin?=
 =?us-ascii?Q?RJhEFLBJdG+Pw7bO7RRlBlzPmKpsP7d4K3tnFRkHyVlHT+qPcyXvUELYcc1l?=
 =?us-ascii?Q?GYRb/2mAuPneM2vYz3PkaYK5lLd82wOUz6tjk7etvmKruXXUtduBarAsfTNp?=
 =?us-ascii?Q?esKHg87a4WMAkvoAeiv3PZH6glVu9yUxCF9ji9OF3ur/83ThhnKiHmxdhGo/?=
 =?us-ascii?Q?AqrS1MYKwStV1s0GaRQ3QpgpCtHhGx/O1VIUGXN37AjxHpy5xM8KwXxYvJYM?=
 =?us-ascii?Q?dHBUoTwKLFgi3vbul+YucKfvMBs+B2GG6VuXHzhvi5W8ZuziJKHFytjM1qzr?=
 =?us-ascii?Q?a1j9OKlCl2E5E4k1cFSv+aqjhg6sKBULAcbDqUgo6cyPXjrRXVC1ALlRwQoS?=
 =?us-ascii?Q?0cL2H3syDEpPbtXOZFmuIoQhlANt6fbh6CD8KW/J3lwHvto1RLSTNLHPAgqA?=
 =?us-ascii?Q?x9zd4KB7dVebFzREOXftjdEJRpVtENvdYcGSGQzxZB35vpTsj9BMtkgXUUoR?=
 =?us-ascii?Q?g9oWIvWFvuvr23E1lcEe8V+BMojYYsOnZGEOrPxGQSoe7eWZH7TkDlTCsKP/?=
 =?us-ascii?Q?bIvOxaLR50WkppmBqEXKTk+1X358e5YkA/Cc3li2lpAo4ygiRhru4aZXsATe?=
 =?us-ascii?Q?yVit+zuvMiyWtBhRlN1pNyKtKM9BQ+DU7FNmX5qTgm7y3vN2DD+4S0Z5ummM?=
 =?us-ascii?Q?gOrq0f0HqxOcq/f4/qrrUISvIuKEBovBwbBvNI9Cukx/8fmbnPUBvVf+D/80?=
 =?us-ascii?Q?lDDzPN+MKIOLax6xB/6Fa4eN3TMIo/0knuA4QgI0tXcY1ARw5hDQbW3JpCFq?=
 =?us-ascii?Q?5jLxR2O3QJofi4QhD/Bq9Iu56QSrJav4tSYa+SHnfAZcRAs/WqERJ9sOBwz2?=
 =?us-ascii?Q?lRZbw57DUr34glvJINCmo/oSFWo2k6hbjKHRf7Aj239PAtGHHH1vAMEh/pr8?=
 =?us-ascii?Q?vTK3gKF20GtGIsQzoyPi9MY38unnGGLh146I9ebJYLGU1oxfDS2iVCKXd4FA?=
 =?us-ascii?Q?vTKmv3p8rWZ+AQvGUJN536R0YTT6tAl6nypyO3VtrREFL2sqfD0CdfVmksMN?=
 =?us-ascii?Q?yFF6dGTuLz/t0ftWAR72xIO92OB5KbOMBxpjc0vUhllm29hGc6LuHWE8ZuYZ?=
 =?us-ascii?Q?29N2w2gNpIhIZkiQLJYbQg4V/MsnmIMuVr1l9+JXnruej6t07tVdDQQ4unlM?=
 =?us-ascii?Q?mVuLEdW5KOWofwflJ6ujIghYfUyKSy3yw42zQnLhvnG49yolaQen9nN4GRF8?=
 =?us-ascii?Q?j/A1us3Zh4vkmy9lVBd3z2KgjRXx2xiQdNlzpMmry8F+UD48x4b0ikqvhSPn?=
 =?us-ascii?Q?vEXi4kI+Gxg4XTwAoE6OyeDdGEQQgKB1o9YpexlyUko7d99rPIICoQvV6OvG?=
 =?us-ascii?Q?4S/FBTzo88csXxsnEMS3maWGimrvPqwP/JTLBShzAgdlqm7MP0SsLGqkBv3M?=
 =?us-ascii?Q?EQWH9w/RSgF57ISsjS3HfgxsvbPU10rb0rMb5aBiAZUb2DT5e+ACGaE1SwG+?=
 =?us-ascii?Q?2IPfqtzliC2+jPQ4kk7m6sTW9+63j0iK6YAbrVyXaIYAAP1atLk+fMWU9MwI?=
 =?us-ascii?Q?xg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e07a6d29-7bc6-4f48-5e59-08dcbd76b002
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2024 22:07:43.9013 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jp2/FslXsh7kNq7VEoEyel+boK48COsEs1QaRnC5/RDcBK6ovQa8ye+SGDWNMz8o9q4E2R/Z+JG1l/Hnd+K5Mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7133
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

These includes are no longer necessary, and where appropriate
are replaced by the linux/types.h one.

Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.h        | 2 +-
 drivers/gpu/drm/xe/xe_res_cursor.h     | 1 -
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c | 1 -
 3 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
index 7929cc2425e8..0109866e398a 100644
--- a/drivers/gpu/drm/xe/xe_migrate.h
+++ b/drivers/gpu/drm/xe/xe_migrate.h
@@ -6,7 +6,7 @@
 #ifndef _XE_MIGRATE_
 #define _XE_MIGRATE_
 
-#include <drm/drm_mm.h>
+#include <linux/types.h>
 
 struct dma_fence;
 struct iosys_map;
diff --git a/drivers/gpu/drm/xe/xe_res_cursor.h b/drivers/gpu/drm/xe/xe_res_cursor.h
index 655af89b31a9..dca374b6521c 100644
--- a/drivers/gpu/drm/xe/xe_res_cursor.h
+++ b/drivers/gpu/drm/xe/xe_res_cursor.h
@@ -26,7 +26,6 @@
 
 #include <linux/scatterlist.h>
 
-#include <drm/drm_mm.h>
 #include <drm/ttm/ttm_placement.h>
 #include <drm/ttm/ttm_range_manager.h>
 #include <drm/ttm/ttm_resource.h>
diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
index f46fd2df84de..f7113cf6109d 100644
--- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
@@ -5,7 +5,6 @@
  */
 
 #include <drm/drm_managed.h>
-#include <drm/drm_mm.h>
 
 #include <drm/ttm/ttm_device.h>
 #include <drm/ttm/ttm_placement.h>
-- 
2.46.0

