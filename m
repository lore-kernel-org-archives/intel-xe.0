Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDC23C5475B
	for <intel-xe@archiver.kernel.org>; Mon, 11 Mar 2024 19:30:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A92C4112C39;
	Mon, 11 Mar 2024 19:30:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VHXsEb01";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35873112C39
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Mar 2024 19:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710185410; x=1741721410;
 h=resent-from:resent-date:resent-message-id:resent-to:from:
 to:cc:subject:date:message-id:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=vv30FoXXjVLOHbZ8hKYLNKiV/gUMxgvqznVoHaPWC2E=;
 b=VHXsEb01ilxDIN3Spyyusa3lbXb7u+rJt8YyLoLpJXhKuuMHQ6d3uDJG
 G/dixutYBtE6cTmlDVuC65ZqXjV8dNeKkOcvqX76nAkQYlzsOyYGIYNRI
 LdwBfQP3FR1GZcMELmJJwYkicrF3W3UIYtygnIT2PpQzno1dfpUu5SWEW
 ObG+gYAIHWo8X2x75AnBssqAEKUz1Bs4DPCmqd9o22tZWRl+KwnwaBnc7
 atG1DYb7AtwlG4593WcQCBQJb9NysUgCfjFgSEbZe0LNTA1ngrsoErnMv
 BEc5AS83RIWnRm4Cqxyqg0wLj1vUlWRDWQBNVQWRtrYU0tb1YLy0UW5YQ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="8628024"
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; 
   d="scan'208";a="8628024"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2024 12:30:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; d="scan'208";a="48717311"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Mar 2024 12:30:10 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Mar 2024 12:30:09 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Mar 2024 12:30:08 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 11 Mar 2024 12:30:08 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 11 Mar 2024 12:30:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T84BIh95ia5yNnVJY5HdgC9jZDDdA+caQAZAGqa1Yj4SvqfcpUKDXZ9BFCH3HUTXgZESqpqVkN9WeQsN2YuXh+t8TjMDSsfeBt1fxPV8XCaY7s+W6C1lxMXKSxNzkoZxRtb4W/i8Az6HOFY4boJnXtGIzZvEuTDWPGMsEZNLoREsYXZCk7CZF7VzIpxr0DCALtvB9f3URnJ1FvHSsXaj+qEnY80HUtTaipfvBJJR/fWV3E8k8vPrm48UBGjv+k7P0s6YwGRhAh2AFzX69tg+wsRYa7IhQRGV7kwpvXmcnuJfHnJKDUBsgMydVgcWVz0ZlMAJ958uE/OTIai4ppo1wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jkzYfd0BbikAreL81H4WV+Fi2c8UMbZFY1NYMAvyzEE=;
 b=Zn5J4McVpHVp8d8p9k8Bhyd6uIJkQZDakPZA33db9VnOFYPX5npKKbGH+WtKQBvDaHPloh+tSTj0k0tg5xBtGc72x1hGoDe9kkZxeguc/pJec8yDe/nb6MumYVsYevVUBuDPToNM7q/atlN5NRWnZLmFYUObXZTE+sxgUdxSPVR9BubOpO81xgxr+xmzXwZByLiTAfiL+P/Tn0zhaedRKdrK0+G8z1KKKqdfnWIJk6SsuSjU4BDrFdA+rClPPC0W1IF3KLr/iIBD37P1wiUWrWDSyt7v3b95wzmkjuTmqQp73eQqpGTXt3VGHDsYOJsAuQfu1ukg7yV0rGWvfWFKtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH0PR11MB4822.namprd11.prod.outlook.com (2603:10b6:510:39::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.14; Mon, 11 Mar
 2024 19:30:06 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189%4]) with mapi id 15.20.7386.016; Mon, 11 Mar 2024
 19:30:06 +0000
Resent-From: Rodrigo Vivi <rodrigo.vivi@intel.com>
Resent-Date: Mon, 11 Mar 2024 15:30:03 -0400
Resent-Message-ID: <Ze9buxlgnDeyF2Am@intel.com>
Resent-To: <intel-xe@lists.freedesktop.org>
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-gfx@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Subject: [PATCH 10/11] drm/xe: Ensure all the inner access are using the
 _noresume variant
Date: Mon, 11 Mar 2024 15:23:02 -0400
Message-ID: <20240311192303.33961-10-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240311192303.33961-1-rodrigo.vivi@intel.com>
References: <20240311192303.33961-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR06CA0033.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::46) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA1PR11MB8253:EE_|MN0PR11MB6059:EE_|PH0PR11MB4822:EE_
X-MS-Office365-Filtering-Correlation-Id: bee62a1f-bc6c-41ef-e78d-08dc4201a830
X-Microsoft-Antispam: BCL:0;
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d47df6f-cb14-4e48-c88e-08dc4200c0ee
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2024 19:23:38.5964 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mydLxSYQ0egya2Epc7D6RGYion9x5uf78T1gbl8/jAAHY/U5pjVrxXX6NPVZYRDxhzAKtckpp380kRn6w08z6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8253
X-MS-Exchange-Transport-EndToEndLatency: 00:00:01.5953371
X-MS-Exchange-Processed-By-BccFoldering: 15.20.7386.010
X-Microsoft-Antispam-Mailbox-Delivery: rwl:1; ucf:0; jmr:0; auth:0; dest:I;
 ENG:(910001)(944506478)(944626604)(920097)(815096)(255002)(410001)(930097)(140003);
X-Microsoft-Antispam-Message-Info: 1phGoZ+lC7JxKGJellseQ1NhbpqU+cu4Y5aS1yJEmR9tQ0Zw3gOnSmgcdD0GB7rlnZx9aGdmsVzn73iaVqgzqgMv5d7Q1L6NBhvQTYrR3Hi7YDn5MHrc3/KeNqcqkMp5PiyYdqOX8TKchFuLX2uWwucTJ39XP4PEPhXVsW0qTT/xppAjDBbUigsAo6xP6+cFSjF4n6Tm+Sqa8mRsXTvZlJh/E1Nc50cD4TvVjkvRCHvoPi603ycGIxMX1LnwsOnIrxm3HaOehiHfpGQHfDG9dm/JAmVQ9Biybd9JQorcJ0ZpQJiVqRH1tcDeSAvyu35lsuuAsEXUuyOf5bkpJz/D9SvcYvpiRMgaShQWlOJdZU7Lkaqjy87kHIHFs5Q0Xc1OcsWIyzs/u9IDjPsKFiyIQIELWIbBeWTiCy1u1JXNICwx9AErfQk34gHemi5F8BExVS0rRDo2kM3OR5lw09DTXK0/he/LQJkd2FVRUooCU/yGatHQkiY5bAX7e2bxXrC8V+GFRmSvKm1v0aHjk5kcXEBxrRV/4mJ21zLrzUHqVaN/JM02cT5dBh0GUtHABpicLld2XtyYky58bFA3wAoHotzA3BzQHAVaXe7zhyuI6beS1ryU3tp55HF478lQ2Qh6js84gDCK3imB8GBP2q7WAg==
X-TUID: bxBs7BiPwzm8
X-ClientProxiedBy: SJ0PR03CA0245.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::10) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 6d47df6f-cb14-4e48-c88e-08dc4200c0ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qLOvOeNhnYgGglERrdHd1Fxu2tMwTFl6Sm91ftxobVvla1Pbd5VtOWVTYRSg?=
 =?us-ascii?Q?aHDZ6WTr9wAkxRVw/SR1PwkaFSsrm4yYIZkB8bznBd1siDtJaba2r9GnHTIV?=
 =?us-ascii?Q?djT4XSYHLR9SJtSRX9IHqah20ZR7zCgEDN+Rksc89MbZ8tYmp72Wonapi85D?=
 =?us-ascii?Q?L2ltx734mszNvt7UihTr8bRukLPatYwmx8P8aQFKtrh3/DC/17rPfGZcYPMx?=
 =?us-ascii?Q?/NfUlKJzlB2QQ0b5BOkiGk5Zvd1/S2DHSeuetK+BNELGID+U6LQXfjQhD9Of?=
 =?us-ascii?Q?Tb3mD8LDqqf7gx6yVPW5Xq1CQnju3sX0OuXDeKr3RVzhluttLVqSX+Ft+mXi?=
 =?us-ascii?Q?jlgdZrY2Md2cR98wcVjlnijKmCdu8/mTX2WBLWZ5BeKXbPMCJgE1yeSV8oXX?=
 =?us-ascii?Q?dXL17145GearAix1XwwBwM05LlNeIcdWDJmkx5iIBDcQyB5YXJSjPcpWLJGc?=
 =?us-ascii?Q?8qWp5HyumYHVotp1W2x3l8JNV8JfNYsm3BurA2bojfmhpibC0N6jpXeWcoYQ?=
 =?us-ascii?Q?4gb2iXtWrx7WEI4Y5l2WG3pdEZabI94Ojw0t4V2ZW6AaG6Pcz2nudZjoBcRs?=
 =?us-ascii?Q?5RtLESv+yP6mxnxxOobks76/Jc/AKZ9j034g+/UYDLvoVbwvZPSKM9Vy6fjp?=
 =?us-ascii?Q?tsqRQ/zB0G8efaiZDjxVMg6FXz3Ci2Bv0l2unW5GGWgMFnMLwiBOWM47bP6L?=
 =?us-ascii?Q?1WhiFNnkk7uP5+GN7VJzKzgnAxVP6gLhEV8fG9PDBpkQ6gjQT1z3DSQvP0sM?=
 =?us-ascii?Q?6Uirji2+8aPHx1jUV696aJmNUfXuHDmL8NAx7li3ggUw2WnigYTG5o/nRWOV?=
 =?us-ascii?Q?GnZbRiZB1UOMhXn2U07zp/4ZgrsBgk1kMEqSP1l75YKdLmb6FrbpRw3wmKLh?=
 =?us-ascii?Q?uEwJ4Zs+cUCW60o3UlO3jMB7wWEDXc8Xj1MxPjZnRIqL5VMk+CzuzE88GeQd?=
 =?us-ascii?Q?j25qa/L1kKPGPxagI+QN4iLCEI2cKwEzJXtuL0Dx6DhHk8DcanVL0sQ5avn3?=
 =?us-ascii?Q?4dPbVBVCXwiivcyr2tqetVCjIx0EW5OitCN803TBSystu7MlLV0bK2nX0Wa2?=
 =?us-ascii?Q?RHLvZNQf8ecspQP6Ss3+K1R/WT0aSASACyQuFTpmvtnrtfx3v2QX2s+m0PrT?=
 =?us-ascii?Q?YulkyIRqYPh1rh+0gF3pmyg5LB1dwkexuikFxJFVlG+mSOP3ddkeZXmU1IuD?=
 =?us-ascii?Q?Q3PQmiVkKynso42LNbbjAFFjOMHfkMNaSwCmkr7/+hceQHKAVMFRYtRRC90G?=
 =?us-ascii?Q?ywNQxgCQwOyQm3JC/pk7+gFQ1r5Q2MM9LgGX30zrOofIjjbLTYyURQUq1upn?=
 =?us-ascii?Q?ae2QGfJDEdmDUqKs2Z/9ZVWtsiNtuLoGZleOeh347603DNLfcmsKb8z48AyH?=
 =?us-ascii?Q?V8ex5PJZCFJ7NC08Qd2VZTOLFYSGgGnk4qTTZjmnu6wU7QKPPOFnGOtTsdFj?=
 =?us-ascii?Q?rBaZpCvjfhSE67+aSz/bbdSdn0jE0Z0AoSkEyF0laTgdibhphinN0faI+Qwd?=
 =?us-ascii?Q?FWbpiZfqQZwgA+2XUjSOo+4aDOOepwVUIiCLuDsiRLfSKskBNfE9zTaOLADs?=
 =?us-ascii?Q?el352G3GzGb2aJ+XtiX/n87hjUv7xz1MHC0xFdia1EqgQAmwh+BBZQE8NRzv?=
 =?us-ascii?Q?jQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bee62a1f-bc6c-41ef-e78d-08dc4201a830
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2024 19:30:06.5897 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gAD2aZmv6wrtusJnyDAphROiYcryUdHW97kQhDnw86eTSmx9QwOPW7y9Xa3S4F6XlQo/n2V0pbt0+dIEfi771A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4822
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
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
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
2.44.0

