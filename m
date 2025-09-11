Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A0FDCAC587
	for <intel-xe@archiver.kernel.org>; Thu, 11 Sep 2025 21:20:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CB7710E174;
	Thu, 11 Sep 2025 21:20:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y5U/YiK+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 991D110E174
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Sep 2025 21:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757625638; x=1789161638;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=G8rQ8BZZL/uuLRHGa3e+C+cAKiye8x769rZP5C9HKVk=;
 b=Y5U/YiK+pEJS0uuX7MskfnC6twL4QPYeQhV2niZPtvjwy7pm1xX3sD0N
 6LA2DAsrv8BVyUm74wDm69EBned5OKuWxZ3HLI400pxz/fmzUaXDApdtV
 cedu3yXsdKgC85Hsn8Tapy/LdQc0br0DWRysfIC9GCEC3YrPCmmppxGy8
 RJDhrTOyXpBtG9qvjIY1t7fUf+DMGhVB8cY2icVACLNeDECUOUftgGRWw
 9CkPpzFlvUT3XLzgN6nBDx3PokFmLyxp83xvyFBZX34yCs8S7L3Fg1ZHV
 8BCFUjxXlWywX9ryRI+oh9y9aLKCL7VpQYb74xRfouGveKIuMQLMu/9H3 w==;
X-CSE-ConnectionGUID: GBXZSFVrTNuTJWFkDyl9Zw==
X-CSE-MsgGUID: zQVACPHjTwOcjIzjEazL/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11550"; a="63603965"
X-IronPort-AV: E=Sophos;i="6.18,258,1751266800"; d="scan'208";a="63603965"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 14:20:36 -0700
X-CSE-ConnectionGUID: s81lwVdQQX6Qs4K1JlDdEA==
X-CSE-MsgGUID: mVWvdBSvRmiEqRPetlkTZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,258,1751266800"; d="scan'208";a="174179337"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 14:20:35 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 11 Sep 2025 14:20:34 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 11 Sep 2025 14:20:34 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.86)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 11 Sep 2025 14:20:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A4TYzBobARDkswHbaywMt+R0tLb2tWEeCX+aTDt31NElArPD4w+wioT4w9Z2FbXbUiIaspBARU/jw5gbE6F/H1wVSeFSXxwAJXg74NratbWwBhgXvmlPkGnLbgIZ2C1x8eVTO1A1wmXRpV322z4VxvikqJfKzTSDklwhpBlIQXavjAJ+IQ5o9EzJm5obt/7wrrKjuYPprRFyaaUrKvCVo7RbrP4otwCJ8GfX66J34/UnjQJRMNAu0IJx6gMDh1HNSDmm1K+lqVD5ZFMZnKU662VHc5kosy7L4RfmKd4QiKb1z442/V2xLDESstQjMVMi7ZSNjDSHot02z70dih6KRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o5q+B3plsS9Iyd7At6TVdCMMee/mpUvfY82TUZkb0Xk=;
 b=CpEiy/gcT6m6Qr9LxeTJVgxkc56f39DDmw4RCPUuazPasr/ZPB4cHqHxjE3oMSD4LEYmvs3AI4RdqMBRtGAtoQxe7rsk3ol1wKZNX3dJh1tK+AquRsrsV8+4ocyPif+w+goSHmxO4NvFQ+cBBuBi7NfxykJ91unqp3W79Va/ZiLyZCQ1dnrw6kP4cX27Aov8SjrOtV6pMUDEc0reNFg9hzcYHBIdQ80IBxIISJmZwR72eMmceG1ytLXKH7S7c3aukPxZz+FZAWP4aAwEq47WoAnAMT1QdHvu6uW0j5/vsule+iC2vp0ItCrna/Upz/6bx5Lo2/f74hfWHq3a7PYGWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by DS0PR11MB7735.namprd11.prod.outlook.com (2603:10b6:8:dd::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9094.22; Thu, 11 Sep 2025 21:20:31 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9094.021; Thu, 11 Sep 2025
 21:20:31 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: [PATCH] drm/xe: Fix circular locking dependency
Date: Thu, 11 Sep 2025 17:20:25 -0400
Message-ID: <20250911212024.966757-2-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.51.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0016.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::21) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|DS0PR11MB7735:EE_
X-MS-Office365-Filtering-Correlation-Id: f306d2f6-f5d3-4a43-9ee5-08ddf17909f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mHuzT8Gqipygwg+MFgbRTWkcvkoSPqqWFvBydq+oNeT3GA/Tg89JA2/Fa/M3?=
 =?us-ascii?Q?KVbAhE6OAsfb2yVJYMFTQbX16lfXtBI/Q0zr5SYsEA8PJCCjYIZat8YhqX/N?=
 =?us-ascii?Q?XLATM9FfpOhhHpREiTVNjLUPIREU7dFMmDaFH1/YsmpNTR0LD2oQ9GFy1FV6?=
 =?us-ascii?Q?O+d8OE4ip8dlPGxGDyPihIFHO1n3/AJZd9Nb3kGzWAsXyut4zLJp8WLZXoHw?=
 =?us-ascii?Q?Y5tLUatUFCK2TuAPs4iiDKzwAVatFKWQ5OK3yqSLfvyHm3J5h8oPVTJ7lojM?=
 =?us-ascii?Q?tRTOhlWxTW4meNyu/N1xn0anzRYqpB81ByQ/jIinw5Qk0onQXau7FFjjQz/+?=
 =?us-ascii?Q?HkUkWoPjWk7YqLj4CUw74SBSICu3skxyf7eGD4gFhpzBBmltZhc2BUmUMfLr?=
 =?us-ascii?Q?3DtCW/2VHzzD8CJFXp0svwip/5FnrF3dJCUnKVWrxKlJjWLTR4c0uMDVa83A?=
 =?us-ascii?Q?PLuQ2PAhRB6Iz2qb0OULLLTvcVaqMWs8s/begppsz+gqFhTX81ih77GbiFac?=
 =?us-ascii?Q?DFdqxYycfM45+CPeRuNHZbExQm1vMgXXs3T5qodk11mVRqgFUQmSJYZKdtJC?=
 =?us-ascii?Q?bzJWe2Km5GlmEpT/1BiXp72srF82EW87dd+1DDjXEE1wEJ+3rl7YaMSlnR6K?=
 =?us-ascii?Q?qpqKsTUw91xyMfd3Jm5sju1alIMskxggK2LmQyo6NwRYfV+sewq1/M7pZ8t+?=
 =?us-ascii?Q?ZY0o/WmGhwkOzjexHgW4tMA5/sKoNWXZ7I2DyKCzOFOmGTXK2+nTjZ4wtLll?=
 =?us-ascii?Q?WvaIuj3U80BEBLs0f7lRrW+J9IbHHP7d8/oOFTUlfifdckg4BV/rZwBl8uBc?=
 =?us-ascii?Q?opS7/XyQMOH7xzyeVPpBnPDcP5l5k7LJ/5PXvmh6JuzesJYkqMmqA01bnlMt?=
 =?us-ascii?Q?UAr//MviPYbL+Ivho3xlPmm2Ia6Z51SlKxXEVbMYvvXc4tedC4H16J2CiIDy?=
 =?us-ascii?Q?7GXhVFQSTyO4avzq9MmnHhiXQ/AHB8cqVm3lxibjBuKmmixPV25IboswwdPi?=
 =?us-ascii?Q?5M0WzGYZWTz2pR5/CGnQjtyRS0CFPlcz3GjwEIEhzMajvXTomR1CKfa2Wbs6?=
 =?us-ascii?Q?62Dlf/7xLFgGux+Z3D3sD9VxIv96kj3dGvdG3QupQuP15Xu3769edgz+wXip?=
 =?us-ascii?Q?j9bPCFfCx8g131hSagoPNQU/EDRiDneLi+kgoDrPvNkaLhiORe/Hpn2sNt89?=
 =?us-ascii?Q?t9xi/b2HCyJQdt94F+62ivBX55qfmTCXMT1N7VlLRgk/8IfYH5ITFNvzPTNg?=
 =?us-ascii?Q?Zx/A4YMCfjQ7tYyoDbgQG737U78Js72jIAIWcOZaKbOABDmLu2ZqrMPYB9mz?=
 =?us-ascii?Q?bhSQaJ2A+5jHkYO5Z3iK0ClwH4SvK7qmkzMp94r6qiEl5wRi0l0h7oFu3+mR?=
 =?us-ascii?Q?m+UZ4APPT/y36mkrIv2sVSiY9hD3?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PM8dnlYox1C43Qa+ETZPCdMHbmXdygGo0r/Z9y8/Gk9LqYbPSyLeXCCfb+p8?=
 =?us-ascii?Q?US5WhkCPwiqBUdUzyawxsoSwg15X2vigPaxu3rnV4ojulAb8YwTflndfw6lN?=
 =?us-ascii?Q?XldffByRLDwCCLV07HCp+3JU45M1DjLSLcDDjx/kX4g2OjBpQDWd0bHh2Wqu?=
 =?us-ascii?Q?rnqEVno4BINk9yMQwOxrcKDwxFzCuU2KljhktdKjiwUbi27/YsIzjUmy/MB5?=
 =?us-ascii?Q?hZeYg0WrqYvXXLhKTxZlgM3Qr0NaziACKv/1a5vbuyfU0kithQECGVo4Dv1e?=
 =?us-ascii?Q?+SqEu8VI0hiRJkK7UNoxB3+u99rJz1ujvlnIDiZBZ4xkYYTSo6krRztCiR3b?=
 =?us-ascii?Q?QVREZptjeryQ17d91ljwcF6rfn7hcqAtk5Nb+ecT2WLCykB8ieW841FrwWwf?=
 =?us-ascii?Q?qtMTPBGf+qDzJgT7JclhrIbuWhWCKHntRuhYc9QBkOZzQHoPVa7M48rUAng1?=
 =?us-ascii?Q?9NgshFcxm652S4LKYA+zhkL+VUK6+WlkhN+hUO0rxtS0ymT23fL0WtylW5vv?=
 =?us-ascii?Q?N87IUP16cRuaJjzohrrKFY9SuPpkJuo6EfTwlHg8VaXsETveegLvNb1azACG?=
 =?us-ascii?Q?HSIHBo/mUL3IeFtf2hWKKtDbHHLosicsMIOZdl618auSdPP25zRXsgzmQwpJ?=
 =?us-ascii?Q?EaqT0NHFaYjX5yBbldwLtP/YUxEwrDMommNXuYRQ7Lfs2OrSUYwbRIBvUh9d?=
 =?us-ascii?Q?7g4Y/bRKMXITSiZGwfwNAvO3GgiBsxh5quV/ayhE2fTYUtPHPJlzUSSa0Bhf?=
 =?us-ascii?Q?bQ/LMD6sRXUSUb/d2PKjEh5de4RvGHz9CklhmwXZwtQd2PPhgOP2pytmV9jW?=
 =?us-ascii?Q?zoZCj4UqLbT3jtN/RIDIJb1MTsUmjcH1U9uyav5KMBpOkd7W/rIwh9fX5N9h?=
 =?us-ascii?Q?dwCuBP/Brj/a1Whks3vh2Kw99RMACfS60clE2Y3d0RsA9j7j2GjqAMz+uZgt?=
 =?us-ascii?Q?LhA1hxkALHxanZikJyq/adtulXJXfoSf4mAezhPSybLNsEEmsN4hJ9GMYzxl?=
 =?us-ascii?Q?uV5lyxH8xzmIAjcqDIDzhOdGZgbFD+y1lSoaPZ+jvrBH1U3nwldfYbonEUFe?=
 =?us-ascii?Q?e20ffrwpuuBFA3ujSJh3soR8q0HEKQwHU/19J4AkpaZnKdf+R+4//L0idyFZ?=
 =?us-ascii?Q?3P2i/V7JmZhYzVmr/hllWu9Re31kdwayAukdg6gd3HINx1RBSIPvdCsK0Kso?=
 =?us-ascii?Q?554nyyY1Ry90Hym3qJCsRORlUWlNK+Uu2V0vrARHGvuMejn7fgcLmdP77W7f?=
 =?us-ascii?Q?hhCFzDTNJN5RkF3h6q57UpCxtoaYKzwczBpCYpwaWOFQ4uAXEdwHwBjK2Us7?=
 =?us-ascii?Q?xwOG2GPDRaTOGDxz61lLQ2yV/opw/E1zgkaaYj0eDfj0sScB/pf5xVZYOdqz?=
 =?us-ascii?Q?uhYgmm1E1k5Qu/ShVA9+7df2YxyraZIJS3FD6jQLGiWpPSKVUBlbnLFle57J?=
 =?us-ascii?Q?S8G4hFVHTsrxx+ygf5fbPrYuadhR9PgLoA2o+/+tZrFjzl9ZSvii7JBi32mK?=
 =?us-ascii?Q?u/6sNKqM0EI7JP+I+dYORnh/0/9qv0rn7zBHW+cR/YVbNL3tGDERumI0HRKY?=
 =?us-ascii?Q?ps4PdQbo+Y3yCCSPtA6jfw2XxxdQdfxcKtmhlc2AoODgdDzzCSE7uqWWF+nn?=
 =?us-ascii?Q?Cw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f306d2f6-f5d3-4a43-9ee5-08ddf17909f2
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2025 21:20:31.9044 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Iknot2orN4QlI0sOBG6xuc6dkXtv4g8bGkjA81n4EfBck43FMkpIARnagew9VmQKtTgoMGHKNjlMRsAuEyuKuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7735
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

Fix this:

 ======================================================
 WARNING: possible circular locking dependency detected
 6.17.0-rc4-lgci-xe-xe-pw-153723v2+ #1 Tainted: G S   U
 ------------------------------------------------------
 xe_pm/11324 is trying to acquire lock:
 ffff8881085f22a0 (&pc->freq_lock){+.+.}-{3:3}, at:
 		  xe_guc_pc_start+0x39f/0xf70 [xe]

but task is already holding lock:

 ffffffffa1020420 (xe_rpm_nod3cold_map){+.+.}-{0:0}, at:
 		  xe_rpm_lockmap_acquire+0x1a/0x70 [xe]

which lock already depends on the new lock.

Possible unsafe locking scenario:
      CPU0                    CPU1
      ----                    ----
 lock(xe_rpm_nod3cold_map);
                              lock(&pc->freq_lock);
                              lock(xe_rpm_nod3cold_map);
 lock(&pc->freq_lock);

Reported-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Closes: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-bmg-8/igt@xe_pm@s2idle-d3hot-basic-exec.html#dmesg-warnings335
Fixes: 60d2b7899142 ("drm/xe/guc: Add SLPC power profile interface")
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_freq.c | 2 ++
 drivers/gpu/drm/xe/xe_guc_pc.c  | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_freq.c b/drivers/gpu/drm/xe/xe_gt_freq.c
index 781e4890fb26..4ff1b6b58d6b 100644
--- a/drivers/gpu/drm/xe/xe_gt_freq.c
+++ b/drivers/gpu/drm/xe/xe_gt_freq.c
@@ -246,7 +246,9 @@ static ssize_t power_profile_store(struct kobject *kobj,
 	struct xe_guc_pc *pc = dev_to_pc(dev);
 	int err;
 
+	xe_pm_runtime_get(dev_to_xe(dev));
 	err = xe_guc_pc_set_power_profile(pc, buff);
+	xe_pm_runtime_put(dev_to_xe(dev));
 
 	return err ?: count;
 }
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 68a5bf8e3946..53fdf59524c4 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -1215,7 +1215,7 @@ int xe_guc_pc_set_power_profile(struct xe_guc_pc *pc, const char *buf)
 		return -EINVAL;
 
 	guard(mutex)(&pc->freq_lock);
-	xe_pm_runtime_get(pc_to_xe(pc));
+	xe_pm_runtime_get_noresume(pc_to_xe(pc));
 
 	ret = pc_action_set_param(pc,
 				  SLPC_PARAM_POWER_PROFILE,
-- 
2.51.0

