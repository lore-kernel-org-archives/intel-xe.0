Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2AFAE7718B
	for <intel-xe@archiver.kernel.org>; Thu, 19 Dec 2024 23:55:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58BAD10E034;
	Thu, 19 Dec 2024 23:55:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZCOn4q4i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CC0410E034
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Dec 2024 23:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734652545; x=1766188545;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=RH3QRx4q0vKLVnS46DbZtSwS3LC92Xyb5/OzMExXVOw=;
 b=ZCOn4q4iMujf+RYC5eQKpTwtrjee8rpJkkhu4PHP91wrz78tScK7BdjO
 cX6Pln68NUkEiHmazQu0hJ7FdO2sORVJc6VC6IZCvTvtneG+CJ+eW7tjC
 OG5OMF1wCH4Et5veFxvJ4Z4/lgu469A4XPXwwsPhpqmu+OPY2wgr5g3kM
 DTp5ONNeq2XI714q16MuobsP413Nyktbz5dJVGjk2srR/n+uOZWRoF5Yk
 KHAepd//9ZyZPwmZb6NHb89TvWYF0ntdYJJ06JULuErZU0aEmAaylaUIh
 JUgsO/LJmV2u8jNo8q/RpFZfVhhN/BlvZvHgIqQb5bW3WfViJ5Tkti84D Q==;
X-CSE-ConnectionGUID: d7fYv9pIT6GWKhJ5aPyXjg==
X-CSE-MsgGUID: A45YU7dASeyPw3fcTIbwuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="45879551"
X-IronPort-AV: E=Sophos;i="6.12,249,1728975600"; d="scan'208";a="45879551"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2024 15:55:45 -0800
X-CSE-ConnectionGUID: 2jc7LsJxTPG44TNiUZGpEA==
X-CSE-MsgGUID: l0RrzzQoQQeFwZoFVb3AWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="135675338"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Dec 2024 15:55:45 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 19 Dec 2024 15:55:44 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 19 Dec 2024 15:55:44 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 19 Dec 2024 15:55:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lXK28FYe+j7CvcBxsqVV6goUyA5PlMNUJRDqZ/PDgf76Y9Hs6gDbscmpRy/nzGJRy51JQbEm1hcTShBl6fhfD/MiWrV9M14P96hMNLWUAjn+O5y2iQSux/DWSaKqc+P1MAXpXZ5/74Z7P+wuNm914abKKiYMJbixa/q+fkHtXvBxDmaJ88xIlUEdbFlfCTE5NHt2WfBrRzRY50s0/WoMlusqug96HusWAhFMUIDCL+M72ps+GjyPM7gQyT8dvbqyD5+9hzVCQr+4YjF4/3ZLKfz7JhTYPNe0QHmxTyuW3SzSEHO/0wkSpcecnNhCIhZ83Z2jynacPQ6mNwS0b4JPaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G5mGEXB5noYhJ0w0PJkx+1u2UN3ptGYNlQ5en0pID90=;
 b=qbtr4+4hWCY8O9O73ZKLQ6OGcQ9nKFNraLHNf1tD81joEYU+7SwO4qKHmZgVB6mlKdxrFwTK2noIedsVsuhjAc4bvngmDaMQ6LWuCDegwIy6oAjxkRBvAAE7ZpHaeWQd28awoKI/KV/mCNj0O0QWONrF1f/iFvyzbSJTAlJl21TmMjitGfRq2vxa7xgubFen+78W2OlyYQz72sQ1WD2RkiUB8H+RpSZw1GH2jzG3xl72rX3h6ZrFKfXvauV9njyETmumTIwZUwhdQaJiaapSeYwP11XIKL5x+Zw5OTGINyn4OJlHvccv4QXj9RdyIqI91FQSrlA03l2Mol7tbF4cvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8282.namprd11.prod.outlook.com (2603:10b6:806:269::11)
 by DM4PR11MB5261.namprd11.prod.outlook.com (2603:10b6:5:388::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.16; Thu, 19 Dec
 2024 23:55:41 +0000
Received: from SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72]) by SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72%5]) with mapi id 15.20.8272.013; Thu, 19 Dec 2024
 23:55:41 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Vinay Belgaumkar
 <vinay.belgaumkar@intel.com>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>
Subject: [PATCH] drm/xe/dg1: Fix power gate sequence.
Date: Thu, 19 Dec 2024 18:55:36 -0500
Message-ID: <20241219235536.454270-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.47.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR03CA0134.namprd03.prod.outlook.com
 (2603:10b6:303:8c::19) To SN7PR11MB8282.namprd11.prod.outlook.com
 (2603:10b6:806:269::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8282:EE_|DM4PR11MB5261:EE_
X-MS-Office365-Filtering-Correlation-Id: 2acc7cec-7c7f-456d-b904-08dd2088a4a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BCyIarJEn66DA3HV/OvDf7C2KeqWmnmqq7WvnGo3/zk07FESMY0JEY2RvYMM?=
 =?us-ascii?Q?Eq597LQGCrSzJkvjowkeOsm6Dr3mQpsMdMYbH8WTszD55dN0tLZNHjClTZzQ?=
 =?us-ascii?Q?8vveneOwE3PQFFg1qnu7wkk3lke7qocLJLnCjjfFsCyCpTWubxs2BE7BuirZ?=
 =?us-ascii?Q?Nf9P2xPb+Aox8WMyEsts5ORB4MtwLFeu+vu1ZfKzQ3+plZinD0TlICVboNPQ?=
 =?us-ascii?Q?L5UFTk3m/K4GxkiSO/RJVhpwugNAS+0LMF7cUldiz/MdXw0/lhpHzrsfiL8j?=
 =?us-ascii?Q?EI7sHkxBj+B4KpdsmICvgigO2g8LRvG0JV8OK1QZ/yiDnqDGnertAGgMaz0c?=
 =?us-ascii?Q?Lk5d2n29xZORvkDLHo9GmWvFN1unRvJRgcrrcHL/K/sFKu1ixXr/XuOtTdtq?=
 =?us-ascii?Q?CXViK/MfP0KYZPAMu5v/YXN1mceij1+bWJGSPTw374hcZMFcgUG9ZW+0qvG9?=
 =?us-ascii?Q?tuxvnJSDjRAfZ8fCNJ4jR0D97FG3ZTTj18eMArJypxPuuN1NsRsaw03+dcEE?=
 =?us-ascii?Q?UNuHP657O7kZzt6j11KsqqZ/O1EjDddUcAyhvbGSaJxHoxBsoV566gqvxqi0?=
 =?us-ascii?Q?DuFHr9/yB6GUPgFiEiGjO3+KSC0/hr1sSxareidLSOuPmI0hM2vavKQsASYf?=
 =?us-ascii?Q?ffLSCzzIDkfqqrE5TVfTRr2hUTDefNHVcpnbkyF9nYkVOeLUUMF5MPJbbYJx?=
 =?us-ascii?Q?CCSe0kY1Npam1SuQmgFUR+r/aUL56jTWrOsW+6H06th6qrrEWtJ0xnY31HXK?=
 =?us-ascii?Q?AvdTHj6dkbb1s6VEvlBc/pANMxZ6kbuYHKEnuMAhLOLNgTOTKE8Xc8iwmye4?=
 =?us-ascii?Q?wV79uOIGbtGfzgxR2J1gL/NoJuBFADPUUWgqksSP4t/j6zB2shEN7V1BeXGh?=
 =?us-ascii?Q?tUlIAhzG76JaHtB/OZ9FekUPLNbWe1O0sTrVikFy1FxC3xp2CyTVezH6tBON?=
 =?us-ascii?Q?/jXmNgJhmok+zqmTAGCY0TKRG4WhC1xRDUAufu1Ss2l590g1+4FX+PQGsJfK?=
 =?us-ascii?Q?AjwCqVj0EKIGnxZ26U3ngqtxr0Y5cUK4fGmgtAVm+LFZuhggkwRyP6tXm4XH?=
 =?us-ascii?Q?FVdHsptE/1BQBUXh/fFIIXLDs1XkNm5+Tf94jdLujnrlt4ah6s6rpXt0sAgC?=
 =?us-ascii?Q?jmIaigZBLEiPJhyqLUePUPpTnM7/xnDbFi7ZWOz5G3WwfmP0x88oEYZPGWyY?=
 =?us-ascii?Q?xl3B2o6WtKv5FFTKcBsVSBdJatkQYSV+5FHrCXziQXWnKULiX2mOlW5t3Z0X?=
 =?us-ascii?Q?hakDPqBuX54E4Lb3xlQbKj2k3u9ZgNJDlL7+QbAzUjXFKaDASHzVdmOJlKWm?=
 =?us-ascii?Q?uN/Z4x6a/hR5PFIM4meedfQ4LZRa9THMvWK7EBsyV9MK3Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB8282.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?C3m8Zvid4vMI5FWz8D/fHFNAJNq+APMqrTKe2ZUYz8Ji8DG5l28IprGm+GrH?=
 =?us-ascii?Q?Fj0mhUlBycKpmzG5jC9tpEUJP72G6WUQvjPd9H1EIKbpWDEjd4kItUY6aBNv?=
 =?us-ascii?Q?vndQOahac63lrH+Iq/vv0qWNBWNLytVb9UcXsHQIkVBS0O4yRDNUNDJw4Nws?=
 =?us-ascii?Q?m+ILguMtkYcEB1rFKwqHcAXAEm4Seo9k4QC5amlAVO2GUUzSd7qTnsLds/wI?=
 =?us-ascii?Q?YlwtI/SnoEJ7uOm0jQ7aIZjtKo499Bk/KgVkONXGW6hB9nrIlw647BPp29ij?=
 =?us-ascii?Q?B+YWwE1mGIgFOf/Gfj2eP9NHfodKLkqAcrs4dAYlRlTB5uzovaUwuXnmSPx/?=
 =?us-ascii?Q?3rYgQa/GYtv4jpFwdeFJm+PiqcZyEJYBbxo2F1ryR/OBic+V+Bn+ke27BC2H?=
 =?us-ascii?Q?EoutmfYe2z+cmZTdSljzS3miSbaTIoTTNHVWwK3ORp5NagfR8+4mcFdCjGFA?=
 =?us-ascii?Q?bfF+FP39sO4JvO5gwva9Vh0Fhdu9kmbAsTF8uIqv3e0A9hSHAJPhsHC+vqAg?=
 =?us-ascii?Q?rXvYkMQ7iIIyoCMXEu7MOfM6KuZ6nd3DfZ6bWToZoeId8AQ1DiGpBRI3nExt?=
 =?us-ascii?Q?sna/T7dBlkJJ71Vk1e/AVe/PO7W568PHzyWa1e+2PFsTnVwDBlvFGEHdzkMm?=
 =?us-ascii?Q?4PT9IQTuJbIOvbucG9Wzv7a7PVi5c7DDLQp506AeMyYobrJPrkDGjx2+kEvK?=
 =?us-ascii?Q?UTDr1cebPNcBrnZ2XjHPttn5+t1lbP3D8IgkMuVPdaRETPwzPzdntQAtFXzc?=
 =?us-ascii?Q?GjyPEvmNCHsgdiT4lJT0HFi/l+Vbkwm0FVcBX/7nPGrsV16u+gxPgqzGUHo8?=
 =?us-ascii?Q?8j3qrmKnQyfby1ZMzCuwMe06/ZR25ySS9CL5icoBnubJ7ORR8a7aXNM4pvdz?=
 =?us-ascii?Q?kb71tsaERy/zrn0J0GBik4d2To49oD1lLNkh7gcwmDsDUFUOL9koOA+UeYWy?=
 =?us-ascii?Q?cW6rYlRfmd9Jta1Kbl3CZdqojH/WvxmtnTRxdV7UEnRxO/y2BlPdFyHGzRL5?=
 =?us-ascii?Q?KU3Us7R8koI9qJEx6/fpiy+3o8ub6NcMFV1+kDe7HiPS/Q2p8XU64A6SeoNj?=
 =?us-ascii?Q?rkRA+XehJ65OoMe1V1tdlJ7bgQRZZRvRt0Etus77K95GYTJWE14jiOiVkwPp?=
 =?us-ascii?Q?tJWvXX3QupMXM4q2Dhx6nuOLf325+JqrlJ47U0/XBH0ajes5oJTY+9VYwBMO?=
 =?us-ascii?Q?lkxyYc2anK3WcGM5DrX+Resfe4CYUypX/7s4kUh9OZtGRVU698RS8uuYUM+8?=
 =?us-ascii?Q?IDCYP/ka3fOKsyFPnVfM76hEj8ENDhZhCZSez2I5GKjqouJYmC1S8LpswOCQ?=
 =?us-ascii?Q?SCvShXZ5PhD3HjG3rNI27qaUXJkamuehoZYIlWyyKPZiPxDPq0ag3rle/GTo?=
 =?us-ascii?Q?y94xF3iWhhf2szo+gKruWowrPcLgS47xd2gnnH9nySXquFky44kN47Rg14zd?=
 =?us-ascii?Q?j73XEPgC1avcEmNMDxyUsLuqVNlLppTgleQD6IkFMMzwBu1yDnsaYgfn/ho7?=
 =?us-ascii?Q?Oi0u2VrnNS2GNN+H2GQBd1qhJgbIXENc1lJ3Geufx3r/ifHIsqmKjw1kE1yX?=
 =?us-ascii?Q?0HDlHOltrjOICKi9/GvCEIZBk2KlwJ39wQd9V5gHdsgHQW2us0+ydJ1WlXJn?=
 =?us-ascii?Q?iQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2acc7cec-7c7f-456d-b904-08dd2088a4a7
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 23:55:40.9732 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kLHruV8KOiUWGghnpLqiA/wEvBjIMSPwV/+I8PiOr3KIRVVj9PDzglLD/jB2Tf8XEwqv4XGxQAvPOrfPtOC/5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5261
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

sub-pipe PG is not present on DG1. Setting these bits can disable
other power gates and cause GPU hangs on video playbacks.

VLK: 16314, 4304

Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13381
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_idle.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
index fd80afeef56a..ffd3ba7f6656 100644
--- a/drivers/gpu/drm/xe/xe_gt_idle.c
+++ b/drivers/gpu/drm/xe/xe_gt_idle.c
@@ -122,10 +122,12 @@ void xe_gt_idle_enable_pg(struct xe_gt *gt)
 	if (!xe_gt_is_media_type(gt))
 		gtidle->powergate_enable |= RENDER_POWERGATE_ENABLE;
 
-	for (i = XE_HW_ENGINE_VCS0, j = 0; i <= XE_HW_ENGINE_VCS7; ++i, ++j) {
-		if ((gt->info.engine_mask & BIT(i)))
-			gtidle->powergate_enable |= (VDN_HCP_POWERGATE_ENABLE(j) |
-						     VDN_MFXVDENC_POWERGATE_ENABLE(j));
+	if (xe->info.platform != XE_DG1) {
+		for (i = XE_HW_ENGINE_VCS0, j = 0; i <= XE_HW_ENGINE_VCS7; ++i, ++j) {
+			if ((gt->info.engine_mask & BIT(i)))
+				gtidle->powergate_enable |= (VDN_HCP_POWERGATE_ENABLE(j) |
+							     VDN_MFXVDENC_POWERGATE_ENABLE(j));
+		}
 	}
 
 	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
-- 
2.47.1

