Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11128C10F1A
	for <intel-xe@archiver.kernel.org>; Thu,  9 May 2024 21:04:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9E6310EE53;
	Thu,  9 May 2024 21:04:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="USvGDF44";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37E9210EE53
 for <intel-xe@lists.freedesktop.org>; Thu,  9 May 2024 21:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715288656; x=1746824656;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=jTWoe+FHA1OgDeCtYpDImYfUP4pghBbMNE6Scdau55U=;
 b=USvGDF44AB5m/z9F75d2SZABKBKE7pHlTWJUJIDd9VhS8jYOKn+E9tU7
 vqEHPpOy7iHMmBO/XHx9qvQtWXTg+8xMK48vTaioYu7TJD066xAQGm4x4
 qLRCLUqjweHISBrmoGgwwmKPf5HXH8DD27aCk3qicpd1WN9aqHj66ICZh
 nIzse4TksuJoiE4xQ/9uEaTOpAxmqX6flhpRuM0jkEy0qY8P1YkUkUj1i
 cYI1yacXuDH2ZY7vwZHsOMlh8qfHtpKXxsw1P77IMFZhZItk7bpe+E0jk
 t/h9j4ftbtTuxC9/ZWfgbq0wMSLrHkcvWWqyndzo4RcGcopScScp8VPGP A==;
X-CSE-ConnectionGUID: QazAWyR+RxWADBx9sGh8FA==
X-CSE-MsgGUID: CZuOQUh2SIOgHOuzWs8i1A==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="22647791"
X-IronPort-AV: E=Sophos;i="6.08,149,1712646000"; d="scan'208";a="22647791"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2024 14:04:16 -0700
X-CSE-ConnectionGUID: B8hL/0FxSaGA0cIjn0VQKQ==
X-CSE-MsgGUID: P2QNUfm0Sfq5Qe5X++5T/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,149,1712646000"; d="scan'208";a="29763462"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 May 2024 14:04:15 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 9 May 2024 14:04:14 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 9 May 2024 14:04:14 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 9 May 2024 14:04:14 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 9 May 2024 14:04:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EluJHxXXM9K9/DcNDkXDUZ66MbPuEug9AQEDHZbrHKudi2h10KFXiclx8Byd5cuDIgdYwdjm2fxtQbiNU7KvwubZpnCutuPrVNxDHE+DmF1i85Kf9SJmSwznjnsiaAiPJVJ22BWu+lMY4e8e27j+GtXz7K0MDLcuKOcjn8HcirjYJ2ZXJanGUD6vyCAWCVKw/YVKB/+UHG5apNR2Hb3FgF51ZMv5KOXJguwPRDFmN3vPmgAvTJtgurTMauJgbf+pIL2kSraX5ZqWlemvg9gQ2HUrId8B57r0r+ybbfCSZwwp7VfdktPfp2nFS245CQqH6azfzsm6dX5WC5sxY7VKHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hZWmmeWagT1U2745UBypm5CvhReB9NyHMzQ0wM1DVd0=;
 b=hqVj6w8i0sV/19M0gChZkt9VdRHi2ATaW/ZOLB+GE0zR7uDEyHcPOAmKU5xSN4bbShV/SAtpVzls51F9idMBa/28m4T2c6snLywX6eGIXu0y7g+Do4Z/jbLnW//+cQDr9Rp/5Fy2GiHMo+IdUJ1kNZHY3yYAbbQZJYvmB9XMcBfYHVmrFf+F3aHnhtjVYK+6II43U/kc3LSsdNB/9iGl5PBpyu22aPXoUqrpkEYm71rQ9BU9i/Pm3fayEN4+jHQXS+gEknuWylxHQRsNb+ppqbZGI9y8K8hYSQu+GU1Moe96dQDrRtvBUTu8hYeqeNhkG1PXBYufeVylQi4My2Fmjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CH0PR11MB8141.namprd11.prod.outlook.com (2603:10b6:610:18a::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.42; Thu, 9 May
 2024 21:04:12 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7544.047; Thu, 9 May 2024
 21:04:12 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 3/4] tests/intel/xe_pm: Only check the rpm resume after the
 first mmap operation
Date: Thu, 9 May 2024 17:04:00 -0400
Message-ID: <20240509210401.519062-3-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240509210401.519062-1-rodrigo.vivi@intel.com>
References: <20240509210401.519062-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0015.namprd05.prod.outlook.com
 (2603:10b6:a03:254::20) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CH0PR11MB8141:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f0549e9-feee-4b54-8e56-08dc706b93a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4Tv4CTtICqplL1IgDWwpUTw32Nn1g/1IOG8i+kxl57BvfO5SQ+ip6Cv1W8jZ?=
 =?us-ascii?Q?1Lt12OrQBcjjgqiouP4sWhcJQo6YLM8sPJG7ZTtABU+Ooe7abupBarlTdhcV?=
 =?us-ascii?Q?3YYmuPwX1Q1r9J6DEncH47nbqv7gEzObGh0ewB5ej5G6/5PwZBtbD3mz0TXE?=
 =?us-ascii?Q?IC/6716Q3TPdJFHQmdju9LZbmKJhC9dz79tacqNCDKmH0H2uZz3rSn0LEhTF?=
 =?us-ascii?Q?RUkW/UoFpXX18yimmJ6DbCDdPp4sVIoQgSf4E1eAMVWX2uvK/a9RoKRALBeD?=
 =?us-ascii?Q?VVD1j5EiDQv++Xik9/BJhYEUX66rP68VOky8rJpfZLz8J0tNU5z+If7NwcCh?=
 =?us-ascii?Q?im07IWEERN9PtY55HolUoUJFUOwhRcw8wKKeuFsrJKC9bhyqUHzfOJ7RDaJl?=
 =?us-ascii?Q?CDLPyBuGq4oT1vQQdNeOH/361c0/KMCmYmuxDpg71iKHEpE23zfajPJAs9Aj?=
 =?us-ascii?Q?XeSCxzkVIspbboWJKSBFeKR0thVdMtTOhwN9n1pL2N+kxqV7U+I3cCNNjFTu?=
 =?us-ascii?Q?Kp9L8oQ8pKvJov7OB61YjapbfJdMYxwu52sHfRFf7uCCovf8x1mgBmykk5C8?=
 =?us-ascii?Q?yZjHvPA0by3C+AazTe7sndxcuR1lP7pO/YYp5h5v0calkiRZiETqwDJDHwGF?=
 =?us-ascii?Q?AGWR5O0D+b0doyWu/OKckjS/q+1sCXY3Jsqjld4Di/JEZ7Qwo5vV9XflgQ9R?=
 =?us-ascii?Q?Qb3+CDj5kUl5v4/RIjlo1pTSwGDM9xcuQIstMOiQW3icfaS2Oo2NclKM24zU?=
 =?us-ascii?Q?FFDkMZ/Cq3/U3oGx7H8Qe1MSHJUEhwIif0jjtJ6tL26j5LNo9wZQ/kLrm/f1?=
 =?us-ascii?Q?M66cGFMhoQY8uILKFYgIa4cwH71fbFZMlueMR1rWNz1fBwuoTIvrjGentsPq?=
 =?us-ascii?Q?6etPpzSMC2rsmM1PIJX0LUuyeJkIQsNjWp9j2g3faptPlXtrmThl7xJqqWw1?=
 =?us-ascii?Q?q5D6Et7JGi2O4jLSR0/0EQwx53AxU4131ilwkpaQN65cAqCB+fIFOTeYJL8I?=
 =?us-ascii?Q?3G5bWgEKzj+gNbRBeJbK0qYCc2fkPGNDyOwiIKyTwqFkr4p1DfVpNuYzGipl?=
 =?us-ascii?Q?+1zQ/FitierEsfQYCQxQMSmnZoRvytpsT3BF9tgh3nGU/4W/A4S7jLCBbba1?=
 =?us-ascii?Q?Oe552QXaMXeDupgc+CDiGOuIR/trsrDLeBs/A9ZH7gUSdHCmg345aAPVhBzZ?=
 =?us-ascii?Q?T7cFfg0U8oM+gJ51u+vZ9QA9o8Xvw7jI3lN/PAuITw5x6W1zkJ0gUlJQKjNE?=
 =?us-ascii?Q?8dgnu5tE9xxMqc0oIHR4wc+IZBvCCPG5VyEWtROuMA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CrC7+FhSM4U+D2EIdM1+OC4B5Fpfn4/ck2HkddSQxQQMn2GvUAyrBC1kce9X?=
 =?us-ascii?Q?yCq6nMIidaq41WFFjy8B5w0m619X4ZDMXJu+sg2KRLTmD7EBeL5Bk5u29d9u?=
 =?us-ascii?Q?6PpHue1NqwCvI05y3NivlYKpb4bgSwZ63HMTKfk3oBtcpnlfMgZaHvXo9BVc?=
 =?us-ascii?Q?Pg7OnIqpIgjSqxTarMDMqLRiIhBQqtYjZGfAwzcoYiuqpQJ3Q+FDVioUPqpj?=
 =?us-ascii?Q?4Z0EahlP9xMGOErYWpgRv23A4TuZLZ98OTDWmzlwX4STj4YvH15Rtt7OhMCH?=
 =?us-ascii?Q?KgUrqee6Q4tgLFDSfLaR122ESdmJyALTlkD77wLc4M4hmiOjI0LQaBx9oyDj?=
 =?us-ascii?Q?xUgco0UVT2dwg+RkcYxsXa7MUY0aKNOrr3V1XB5w1AnxDUZG4B08id81G/Tg?=
 =?us-ascii?Q?082bwI0qXL3GdUJQHJECM+RJAhONJG/MtrizPr52Hbhh2BDncuO/wYxSDgZ6?=
 =?us-ascii?Q?3/0tGnud7ExbhRR6Z67cjCL4CCXHukwncScGRcolshqU86QZOF19rW7HsyqM?=
 =?us-ascii?Q?2hUef3pH9jQ1tOSiSpW0QWnjJRYvSfbXevPI69x+rK5jjPkftW+BT52GOMCr?=
 =?us-ascii?Q?XJZcLjaLDS4NU+0ZwY+JPe+MIBrguZgQORagKDnsKOyohBoqqHFChOo256QF?=
 =?us-ascii?Q?9l5BjusTKkSoX/Ibm7fQuRWSm1Wk7XIjIfZP69QuZ1/VEH8BB9MXRiukaHy/?=
 =?us-ascii?Q?1J/Ok4XReTrtCVU54hNdA/GTkrYIxWniaWO167oWe7MOo6Wp4AeNP8IE3GQM?=
 =?us-ascii?Q?8mYu+BQIBpx9Uo0yKeNZhgCDsUZdIbvRZmlJZ78lvHR5mvQSEEOFrUcTjbDF?=
 =?us-ascii?Q?fEJpNTwG6cCemv/gzJVi+q8DGe9M3fsO57ZgQtaOMhKRqk7etQlqk2bT+8F6?=
 =?us-ascii?Q?LAHM0vCIWImhDUWcnboe5zVqyxu0T3ecN4KgUMeB3VO1x7XPnyFYH+eii8pl?=
 =?us-ascii?Q?zA5zFQesXZO3VP3V73SkhziHo8IH0ZCwGrqvPKDrvaO/UqHURqLKyPOt6QKM?=
 =?us-ascii?Q?emyz0x68KUSt0EFPOnkWtbENG2ENW5zqW/dz02RlBc9RnLhlc6rdXzTtdn5s?=
 =?us-ascii?Q?JjmuEp8RAoT7jqSYaoLk12C3ma6j9V0RnRVZctYX7exbIR4V8sZgwXhmCBxf?=
 =?us-ascii?Q?LMp62Z2ITYlW+Z33+sQ18mJ/vcUwN4FQ8WfwdCuU/NQ205IT1OZAaCAp07/l?=
 =?us-ascii?Q?dOht+0l7CL5tlkIpgHkhIwsKgT94e7qr85NyH2qH0eHeIX/0C7PBPhqUpDWT?=
 =?us-ascii?Q?2TADJSsYfWpKsBhqG0srYbnk3z1pYxtUb+viTtiOml2g1bSvJ3Sf2bOA39cq?=
 =?us-ascii?Q?UPwzIwkOn9V9KPY19+v1Ueh5RvdhqBfChTncljKBgHaf/nWvLZ+tvlDZZK9J?=
 =?us-ascii?Q?xr8z/vmO3pZqWJz/cB8xzKSHUoGWhH6zT2BgDSejCyH1GGE7+9dlBSvYS9oO?=
 =?us-ascii?Q?abtDFk9hIP5Vje0YVT7A8iP4D6t/eQgEi59+2nBC5f1qgKRsEk/FnKdB10kq?=
 =?us-ascii?Q?Mcoxq+D2q7k/ZvO8gXA87NjVVXqUMC0eov1ZV1qXTx6LWelFXfm5DKmAZceb?=
 =?us-ascii?Q?7bElCDQu3K1bI0yUcL3LzIHL3tzbWCrK1m03IYt3SVseezTlWk8f0CfwN7Xk?=
 =?us-ascii?Q?gw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f0549e9-feee-4b54-8e56-08dc706b93a1
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2024 21:04:12.4455 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zIY2zKeRbpz9HPg/tPP9xNOEq4p603iluMr7qatJwFc7DrNpPvw1SXJSvf6e7SKnxj5V6NZZB9McCQEjB4uQLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8141
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

The very first memory operation on a mmaped region after runtime suspend,
the device will be resumed if the memory used is vram.
However, after this first operation with page fault, the memory
can be migrated to the system memory.

During this migration, Xe kernel will get a notification at
xe_bo_move_notify, and the bo will be removed from the
vram_userfault list. Then, on the next suspend, we won't mark
bo for page fault and resume won't happen and the active count
won't increase. This is okay, since the bo is now in the system
memory we don't need to wake up the device. But the current
test is wrong, because it assumes that the bo keeps forever
in vram, what is the issue here.

Only checking the resume after the first operation is the
enough. But also, ensure that both read and write operations
are actually validated.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 tests/intel/xe_pm.c | 36 +++++++++++++++++++++++++-----------
 1 file changed, 25 insertions(+), 11 deletions(-)

diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index 72d484163..81226a910 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -37,6 +37,11 @@
 #define PREFETCH (0x1 << 1)
 #define UNBIND_ALL (0x1 << 2)
 
+enum mem_op {
+	READ,
+	WRITE,
+};
+
 typedef struct {
 	int fd_xe;
 	struct pci_device *pci_xe;
@@ -525,7 +530,8 @@ static void test_vram_d3cold_threshold(device_t device, int sysfs_fd)
  *
  * Functionality: pm-d3
  */
-static void test_mmap(device_t device, uint32_t placement, uint32_t flags)
+static void test_mmap(device_t device, uint32_t placement, uint32_t flags,
+		      enum mem_op first_op)
 {
 	size_t bo_size = 8192;
 	uint32_t *map = NULL;
@@ -563,8 +569,12 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags)
 	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
 	active_time = igt_pm_get_runtime_active_time(device.pci_xe);
 
-	for (i = 0; i < bo_size / sizeof(*map); i++)
-		igt_assert(map[i] == MAGIC_1);
+	for (i = 0; i < bo_size / sizeof(*map); i++) {
+		if (first_op == READ)
+			igt_assert(map[i] == MAGIC_1);
+		else
+			map[i] = MAGIC_2;
+	}
 
 	/* dgfx page-fault on mmaping should wake the gpu */
 	if (xe_has_vram(device.fd_xe) && flags & DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM)
@@ -574,12 +584,12 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags)
 	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
 	active_time = igt_pm_get_runtime_active_time(device.pci_xe);
 
-	for (i = 0; i < bo_size / sizeof(*map); i++)
-		map[i] = MAGIC_2;
-
-	if (xe_has_vram(device.fd_xe) && flags & DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM)
-		igt_assert(igt_pm_get_runtime_active_time(device.pci_xe) >
-			   active_time);
+	for (i = 0; i < bo_size / sizeof(*map); i++) {
+		if (first_op == READ)
+			map[i] = MAGIC_2;
+		else
+			igt_assert(map[i] == MAGIC_2);
+	}
 
 	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
 
@@ -781,7 +791,8 @@ igt_main
 			     "when device along with parent bridge in d3");
 		igt_subtest("d3-mmap-system") {
 			dpms_on_off(device, DRM_MODE_DPMS_OFF);
-			test_mmap(device, system_memory(device.fd_xe), 0);
+			test_mmap(device, system_memory(device.fd_xe), 0, READ);
+			test_mmap(device, system_memory(device.fd_xe), 0, WRITE);
 			dpms_on_off(device, DRM_MODE_DPMS_ON);
 		}
 
@@ -800,7 +811,10 @@ igt_main
 			/* Give some auto suspend delay to validate rpm active during page fault */
 			igt_pm_set_autosuspend_delay(device.pci_xe, 1000);
 			dpms_on_off(device, DRM_MODE_DPMS_OFF);
-			test_mmap(device, vram_memory(device.fd_xe, 0), DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+			test_mmap(device, vram_memory(device.fd_xe, 0),
+				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM, READ);
+			test_mmap(device, vram_memory(device.fd_xe, 0),
+				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM, WRITE);
 			dpms_on_off(device, DRM_MODE_DPMS_ON);
 			igt_pm_set_autosuspend_delay(device.pci_xe, delay_ms);
 		}
-- 
2.44.0

