Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62608C5478C
	for <intel-xe@archiver.kernel.org>; Mon,  4 Mar 2024 18:22:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2527611244E;
	Mon,  4 Mar 2024 18:22:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VSPb7ovV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 537FB11244A
 for <intel-xe@lists.freedesktop.org>; Mon,  4 Mar 2024 18:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709576547; x=1741112547;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=FIE7QeQKhffZ95i8b16LJX9APTu9HuOhIW+TPfRW7Rc=;
 b=VSPb7ovV66VHwJpn1LZzbckBg3M+TrUuLf33f5Qtlh5wZveD/7Rt8SPu
 7IbimpGGvyUbJ/S/zUzR6Xt4CBb7vtITJQWlwO8dkiiUd+TeFQmtRUwQg
 x6SI+RsFLSuo8rRxNJhTFZlgbCVSKtEg2h5xZ09Kf+XkM0nQbAswaT40R
 umFsH8tE+8EBjEWfOhCWj/W6yIm1mLDaOMmWivxpkm0JZt7afyX+CAAR2
 A2/yXfjEZEtxU8MGnBMeCJh92CSJ0r7D9fyHoAGL4CXzVH2Wcy3f7kton
 P6nCZ8KfCFtJRsqYn9PnlhW9fATQA7T+SZg9xjYafab5oay8opFP4DTTc A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="4668141"
X-IronPort-AV: E=Sophos;i="6.06,204,1705392000"; 
   d="scan'208";a="4668141"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 10:22:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,204,1705392000"; d="scan'208";a="40092385"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Mar 2024 10:22:27 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 4 Mar 2024 10:22:26 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 4 Mar 2024 10:22:26 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 4 Mar 2024 10:22:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oSyD/8wfLeqbnRZMpbj/ZnfId3LmcNBEyAbMocDLczKLE/zNki+FywUOpJDZzI1M9X0WdYG4HsvhX5gDTXT9n2y5W5TygsQX0+EZHontF73Cf+r/L08M7k8E39d7+/xQnE8+hF6iYiGO54yuiwVpQcYgFhLBU3Lo6DuniIjUptzRXJXsMJMyZvpJN5EDA9e9aSALFeghyBhw8/Vr+wNCJ/vovX+oj6e4dcpS/mDNn8mEUmFC8gT/z5fXBBBrJObACWtX9Morbmur6+7U/XAabAYB0ysgSSOZB9KVjiEFds9wr7IieuChTQZU7G1uHvFEEUfXcY+ML1+a+EEUERdLQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cpF+dcW3H4Bdv1eoMYlDFFbhfRoontg+f+xN7kaX+p0=;
 b=e1yZ0twZ+C+qOsBDZV4Xldpx+gOwguPm2fXfgHuBmrpB8orpyK+zjXmeYD/o4YNQzK8wPh695Xcij7DYBWHlsECwQJRdLXJdvpIMf7/qbrQFie0vXsH9FKw3DEnqN57MpkFKgKbU3halT4bdEG9dmGBgox/kF0YacVI8FGmpUdDhixYmyaAgYJg4jE8l615f74HqrKBqumoslrwF2zIbG0kgJllvc+oDLff6KIE3ckrVTspml186dz728zmA5iAGE/LK6drQovyIRfHjX3F1f3g+jZF+I+dYhdLavXxYCDaFNxM9Sr2IL35GCFqf0kA2g/L2ARohU4o4XpRLAQ67DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CY5PR11MB6462.namprd11.prod.outlook.com (2603:10b6:930:32::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.22; Mon, 4 Mar
 2024 18:22:23 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7362.019; Mon, 4 Mar 2024
 18:22:23 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: <matthew.auld@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 8/9] drm/xe: Ensure all the inner access are using the
 _noresume variant
Date: Mon, 4 Mar 2024 13:21:53 -0500
Message-ID: <20240304182154.42611-8-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240304182154.42611-1-rodrigo.vivi@intel.com>
References: <20240304182154.42611-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR04CA0024.namprd04.prod.outlook.com
 (2603:10b6:a03:40::37) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CY5PR11MB6462:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d30b3cc-bc0d-405a-0719-08dc3c7808d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EO4IQCmtgWhoI/9UHCCfWQR1aQ6Z0QKFuHC7J5B8zmfqDyXIexOASWjIAzeJfk+XeH9+IkPcuf5clZaEGLxci/d7tSNnq6HB0xJIB6pDAB9FlBIcFk47r8hOnEMdBm/I609nhCUWqXT+wRMmYdBOnfZ5ssrg4KWOSTZkQ4D7RCFa65vatrUnwaZ8mNW48XRkh3Xp8DLRq2uQh69N4QpTA5YiSeRssmFhQM1GHB+IPsa8r7sJ+0D9jd9sf2mxNh4sCbqTt4M67ehFmFdrm4qz2fjj9uRFZJ9JrDFh1zHr+6HZuPzlk6nly1GD4Cs1sqE0GO5gVl1joQ00g9kgj/PQyFrCGXcKivMykUT/ZpS/oihyYEhvYi4R/5ejQ6CNGMiylJJwDqL1bvZ83btbGG1GhLwLF0tTUz4jeQG0VuELamdOlonv1NcXB1OXNyFvLktCgcnRNgoL6cZyMxYG4e/Om5R7Is/9ytCP1eAD4xH2zVMs/BcAMFeffPbypxGdTXISMPJKwOj0xy9X+RfUhm3w8hf6hWUKwbRC8vGK+bnO0vDJCsO8u5q2ZWYnhj+uP15VGATZbifpvBRg9Z9G+4SqZh8xH3g/m7y9uvBw4WLh0iVUG1VqKG+rsguFxn5cGd5xmilcLRoeQOBwsuvFEdrlBA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rsLw3Kw9S3PllzKSUZJXIYEejgFjyZt4MdzpO6AqOBJMNTWzVOMrKB0Q9L0i?=
 =?us-ascii?Q?PMtDaWbzOeW7oiSJOQcW9ksfaKSognqMckCwY2qcoWx9e+lhWXm+yOQJ9rsw?=
 =?us-ascii?Q?3OuRcq9tpiOqIkwl6sIYb4W/wg6Ti+s3TLY524rLmsH9XUBYij7P8QJZHK84?=
 =?us-ascii?Q?5nPmXQ4eLAzMzP/AHnlSlMiZgIUARqUAhq5IJhrWuBkRyZ5y5ceMnK5ABHl6?=
 =?us-ascii?Q?9PYe3ngmUN/yIPeLnppHBrMzm/hIwp5+8Nle/Irsw38v4C/hdMrsRlo1JDX8?=
 =?us-ascii?Q?lAMITfLTy0UxK5mA/Q6bLygEZyX0xSmVd8x4wkT1CBcdR6bl8J+KigUWcHqJ?=
 =?us-ascii?Q?FG1it9/AFhVKzTGR4H4LSZCnuhnSfovzrHnB/B6gVvb6owlrHXMnKWCn3rz7?=
 =?us-ascii?Q?9pXV+L3BnTJ3BC2S+Yh82lx+l1AUCEJF4qFl+wnE5tjpuFnCwE7I7P0aVqRK?=
 =?us-ascii?Q?qKO223nCix5vZ71q3sxVDDU8SV0u4smtlLE2r6YujC+NKSUxIJiSY7OsGDrW?=
 =?us-ascii?Q?CEt6NgYSs1lnzRtNDoaNYAMGHdiAzcOu+/iFx/zef0nmLPvlgOprkEMzjdoD?=
 =?us-ascii?Q?9SGH4K2hG9sxKiCeH0vErT6UBuLuefU3gFc+gWAVVqLi9hum2ZikXYeD9xTu?=
 =?us-ascii?Q?RDl/PYRtWDT2P60tKzxfn1vs4/jfcbzfDfK/0Et+z6/oj7OoW1AY1pfeWPIQ?=
 =?us-ascii?Q?+YWkFO2K9+vbX90QtxV/RXrGuZK6D/aNcnlIzIYpGzo345JqLyO4M5D7Rx9t?=
 =?us-ascii?Q?oVWpixxulGFKLkw1vAZV/PCz4312NtIaxsZeEqDqbWIQ78uUgKFBvvJdESf4?=
 =?us-ascii?Q?HUnVMBAioPxGViFE65SyHyf4fNevLg4kIQCNxF5LIVSV2h4oaMvGESx+SuHY?=
 =?us-ascii?Q?O0k5diFSK1vg0HvRt7Y4auhvCJHHyUlNENHUYy94rHLUgCXYE8WUtiWyB9wa?=
 =?us-ascii?Q?CPiD3+c7IOKEzimi/bX2MqeIFwzZt83uMFS2wxpfPyeuKrJFuX6X1LacSUJq?=
 =?us-ascii?Q?HeCE46Nw+JSvbDeYF4Wbr2/KHQvxVHfWwYFy4IDNBXrj0cp4PlqUQJNKq6VF?=
 =?us-ascii?Q?zdsRHJWSEZxQouwlvND8O5AjOK6Y3ehZuHICQX/kM3FrTyPvwJnGaH4knaf5?=
 =?us-ascii?Q?q98odgLyniv22IVO9jEK3OOY/dezUhyTF4KIv9OnMoiRViSk1gplWV/pCmqG?=
 =?us-ascii?Q?kmsVF2PCRebL8Ie70jkQPyOGOHR/AMYpvL9Y/y3dJh8CwqpN4dDjD9toBz5A?=
 =?us-ascii?Q?U7uGHaI7da9mLXZ0TdidMSZTVXzAaqSHRGghIyYw526FXycQVvy3IixSVFmI?=
 =?us-ascii?Q?8MpJGonMXx48xMWEkI06lus2xSdUY4nTIPHnfgueNKQf8bAo3iSjLZhQsU7o?=
 =?us-ascii?Q?X98WAI7jS2c10FoitOYmxrXFVovk3IGP58FQw139DXG5kO86q9Fg8GM7500A?=
 =?us-ascii?Q?drNK73mqe28mC4Cj1U4USuFYC+NdNtR7QcbK4CRXGOZyVUaqK7efKJQEfNqe?=
 =?us-ascii?Q?jJwzNtlHTIzCYXIM0yOf9q8ipBZSJ5y6XCMtiQHanxrD5+FGwHTOKn9A9P3Q?=
 =?us-ascii?Q?/YY3EeXC9q3tATcQgtBl7ykBozoe52yarrW9JjtulANkuAOiLQJH5bRB10X5?=
 =?us-ascii?Q?JQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d30b3cc-bc0d-405a-0719-08dc3c7808d5
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2024 18:22:22.2940 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6eTrAukRXuEo/bJwMLA4oQDkF6DXlUjxmn7KzZjuak8EfhyBjyTc9d5rl9wnen+ISwXBwZ7zmtqriThUgVgQ4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6462
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

At this point mem_access references should be only used as inner
points of the execution and a get with synchronous resume previously
called at an outer point.

So, before killing mem_acces in favor of direct accsess, let's
ensure that we first convert them towards the new _noresume
variant that will WARN us if no inner caller happened.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 6c7850dd70b5..58815e9bf242 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -671,7 +671,7 @@ void xe_device_mem_access_get(struct xe_device *xe)
 	if (xe_pm_read_callback_task(xe) == current)
 		return;
 
-	xe_pm_runtime_get(xe);
+	xe_pm_runtime_get_noresume(xe);
 	ref = atomic_inc_return(&xe->mem_access.ref);
 
 	xe_assert(xe, ref != S32_MAX);
-- 
2.43.2

