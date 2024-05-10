Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92F4AC25B10
	for <intel-xe@archiver.kernel.org>; Fri, 10 May 2024 12:12:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CD0810EB23;
	Fri, 10 May 2024 12:12:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d0GP7z0G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B5E710EB2B
 for <intel-xe@lists.freedesktop.org>; Fri, 10 May 2024 12:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715343140; x=1746879140;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=jTWoe+FHA1OgDeCtYpDImYfUP4pghBbMNE6Scdau55U=;
 b=d0GP7z0GfKPVrQXGUlIa0/skYJN39I+LFYC56fw+TcDDBTPiUvzg1bCU
 UqaVaMz7rpT7wrhYmvneiMZN7LpY1oSZN7dSFizT0wbDdRyyWUROc4YBV
 9YtGR3IuiubO/LwewX1T8D41TOu2dMLLKWiK9ptbpQhhVHQMLkQserUbu
 Mg0kKy7IOpf3f+ECLYTgOZPB7qtjjRdHP2iDNG5OmPOEKKJtsMiJ0A5T0
 48adEhIBel2h55QqisiDxWGdnuiRS5PJofdQg6RplAoxdBTSHiXazfQqM
 vrUkbtMDAmP9wFr8dTuAO7rDvEtN3sdSUciNbEypNG/+h3Claz0RGomBt Q==;
X-CSE-ConnectionGUID: J5DzvtGNR5KvuwrIQvnz0g==
X-CSE-MsgGUID: AN2gq2KdStGNu7HVkBhokg==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="22726519"
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="22726519"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 05:12:20 -0700
X-CSE-ConnectionGUID: TOR32lliSSmsZfV6J5pVlg==
X-CSE-MsgGUID: AIe8kzQJTw+tBpyyMbnSUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="67076740"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 May 2024 05:12:18 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 10 May 2024 05:12:17 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 10 May 2024 05:12:17 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 10 May 2024 05:12:17 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 10 May 2024 05:12:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GWYCbjQ4cNi/4U87xV3mnlgKv2EhOxTf6FIjL3Ji/KOZAq6V0C2wR8i8e4R0rIjDKe97suVepU5GTdbeQzy6QoMNeVqC/qMl3uNdful8a/e9lX1xS+LQmww/yyhkisdKIOjZ+4o23TNHPvepS44viT14xFHXGYrAsS7LfV69yg5zQSSsC3eeiNsNXMyN5xX7rq35x6HhipXIU74LaN65EUgC3b9xe93apAg12fMXW46xQAYS/Vmn22IHA/jn4e9T376Z7ARs8vwpOx+mlKR/i0HMdVp/dPUkjBQWT40IncociyXK7ypBE3e0fNNDS9YNCnn8v/sxJTvgWxgQPtOGRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hZWmmeWagT1U2745UBypm5CvhReB9NyHMzQ0wM1DVd0=;
 b=Z04teMli/b0QSdrQsd1Jv/yBgFElQ+w9Zurzpf+avm6oZJXTAb/6KItUNDZFX8UVAc/IMHa/pzbLPe6J79RZIyOqZbEKwsbY409MOmum62VZXYxLv8WJ1uQAhccvYcpCX4OaZYx2hU97XM2NO/6KLF9oG/J8svL59heqs75JxxGiJ5pA9tcsfP+w6rgOn2Wbt3JjcWB20UJDcHZUXgXfwlWGCy1in3y1Tf3SS9KC4I8MB/GFxnG/sNkapvFXjHe5SyttmWVbPyUiA9Xv9nLAAsj5NqvOY7xIEmcEnenOCV+72YgHBdwNq4M2UyS3VBnNzkZ/ng8Tp4eD5PmMbyuD8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by IA1PR11MB6323.namprd11.prod.outlook.com (2603:10b6:208:389::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.46; Fri, 10 May
 2024 12:12:14 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7544.047; Fri, 10 May 2024
 12:12:14 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 3/4] tests/intel/xe_pm: Only check the rpm resume after the
 first mmap operation
Date: Fri, 10 May 2024 08:12:00 -0400
Message-ID: <20240510121201.723602-3-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240510121201.723602-1-rodrigo.vivi@intel.com>
References: <20240510121201.723602-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW3PR06CA0015.namprd06.prod.outlook.com
 (2603:10b6:303:2a::20) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|IA1PR11MB6323:EE_
X-MS-Office365-Filtering-Correlation-Id: c63d8cfe-60f2-4557-cf82-08dc70ea6da6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zLYUq5gUIgLUJudALWbYna6W3jL6iYfvA3mPLhm4GTioYw8Zgtr0S570u8sN?=
 =?us-ascii?Q?SvI0O4yNys1gUVgDeuNPwr4s7tz7vKTJNQfJZ0nk967IgQF1EwV6gvHpBUmC?=
 =?us-ascii?Q?vWzSmCG9nvmbZ2s+CZTk2E/9iNfmLomnoz45B50ALG8LNiSCXV9hpmxLZxBs?=
 =?us-ascii?Q?DevejrXunDmdwb4rF4GlYXlx3OFidBJqPBGcnMulzz0vt2ZO2PgqL6LYc4w3?=
 =?us-ascii?Q?UKgFZzsMGSvDl7xmWZIilQBE6p4x2suk05QFFaGdBnZ3o35A+J++wmgA6fb2?=
 =?us-ascii?Q?AR/9v+xJN2X6EMLItduglySQhnORDT0Ll9VUB0ZK3JhWdE5LbUCy9vaKj0Nr?=
 =?us-ascii?Q?rvPjvGc07T2cjQUUFJ8mSTpM7xHlFYoeUhegxnTPclFIU8UcOrInvIeDsY+S?=
 =?us-ascii?Q?njLTnChAj71l/K8xfgEatOwJxttJb1kTJnBHu5OOa6MkTTih+h03fwqfv9Z9?=
 =?us-ascii?Q?1OtYR34pp8/gklKmfWU7kiMRXgjyliFABqREpqsL5RcrHoSLRB5S1R8tmcXp?=
 =?us-ascii?Q?rVBoDjIqB7Yivh4k4Cm6d2F4MEdFMBH0C5ArqvZjwj3HHnhfKDDyKTbTwGNp?=
 =?us-ascii?Q?MyshjpO7oTAB9eU8NxdHJ/yav0A6uIE2H7jWBS39Xe8z7IrZYNdla5udxUFx?=
 =?us-ascii?Q?21uILuMRaenpirIh9Ot4N095xKcJZ5jG5mk09tyFXXcgulN0hEx7QcgmvMAN?=
 =?us-ascii?Q?h6qPp8C57kvXH2CnPOClUqxFtUb2cf+FNilJIN8LzTabmPzFcwePDhudEAyh?=
 =?us-ascii?Q?HaqXUtq40D5FqtT5m5h8j530iG2rbheIuWjl/Mo/4HizgpVmrOGw8EXVuaII?=
 =?us-ascii?Q?MMIj4b5z6pqncn+v35klgDlaKm2IPWnV2xpO/MuATT8A8GAhoGJiymHJo9Cr?=
 =?us-ascii?Q?RLlRU9kMHYZKrngGKgxG/88sWYGnge9peFENrT/N8K/RqBE+swiv7I2oAT8I?=
 =?us-ascii?Q?+pAd3QAKyUlFDQc3Gr3ttrh35TV4vcU3xxKGNNxapEpza3D4tly/uArldo6C?=
 =?us-ascii?Q?6AU2ZwVnZHffmLUpuahOHpDyO/uMEDr/ZiU97xMRD75jct76A+R3xpC7UsOZ?=
 =?us-ascii?Q?4tOOWCwGZQ9Zv3W2voFXRWFuARN+V18uZj9D2wZEIQaaOzN4mSSBtCk07YES?=
 =?us-ascii?Q?ye822VbU9ozQSrMt6e6T/skgcwzfPnR1HZadLxmsgv9wNRtVXuAN/AlnMvZm?=
 =?us-ascii?Q?FV7m1lJWdOthhkdgEuSAeZymk0y7fe2DKqYmBM9Vbe5ja/PSsNOwsA2EGZP5?=
 =?us-ascii?Q?aL2x5YEPeNzjdh8n+rq5qmQ7eS4vstu8F2c9NI4srg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cQkZgPXZJFlvMW3EUAyQd52RX3j6OJIXPy0UZ4P0BsTuOqCNE3bPnKVufRU6?=
 =?us-ascii?Q?+21CFDuDoFw4ALFVsxnX/WvAvtMfIQdxhUx2YT18GKqqqMWrgmRJrjnUln+G?=
 =?us-ascii?Q?ReG7yxZToLaNZcqmN6TCrUHGMChUfdatWINyUdeuZaiueYzrg6XZRQDpaltU?=
 =?us-ascii?Q?035Oxr7Dg0iWRpRQme5YVsPphZ/e1iiKx0gRkF8p5Zqcrhesa3uWqN8Dacg9?=
 =?us-ascii?Q?wo2JUvyol3Sftb1BiBvk7JYicwWaOXQAetD4MoGHQDitcVLy8B89lnfiX/6f?=
 =?us-ascii?Q?aNPK4PYVrkYjpAFZablYy7g2RPdnGI00elRrtX0wJksMoLF8Fo544+WEdKil?=
 =?us-ascii?Q?Hp4H3RhY5RvW5VvemfvJD2sOY4FzXNbXqf5xDXPZtSLXFRwoyn03v1FahGpY?=
 =?us-ascii?Q?S0W1akzEHEZPBWf+/AKkzZs/L1FtplI0fFAQPuEQTYEOsV9NUtlJW3QJElIk?=
 =?us-ascii?Q?htf63dmA3eiTgNxsC+ROOx7Fhepq4iy01qrp5y08+/0fN1wjQr2cggOl1OeG?=
 =?us-ascii?Q?FP809C2GLVzcJftyY7zIMuTNXejaQPh+Cpw11DWG6xtb1czB4bDMo2muW0/L?=
 =?us-ascii?Q?G4Tb5oM5TB4OwuhNUnea3ROW9RZ3UTJzxQ3uL3vNpGUNZnzD8zwnYjRYII/F?=
 =?us-ascii?Q?qmGiwfDwhb49KDL2GqGSdOKGo34lGmWFHusUu0+ZZ2UbU2DRCzMX9oSAd6h6?=
 =?us-ascii?Q?fvEXQqe6FGFLynZtbG0bS6AhIqwYnE7GhJOyS1zJFV3m5208qZyYVN8eB6uR?=
 =?us-ascii?Q?GWttJUfEk6P/+/g4f3Gja2bnGTeqWIPl9I2/nM0kdFJVHosObMuQsqFFXVKQ?=
 =?us-ascii?Q?PrNN0u12rboybhkf3R+thOcDn8j4iJ5CT/+NnVJon7YBVPHRcAJOg+JMpjht?=
 =?us-ascii?Q?ZYTpo2+yROi8QLHZdj3fnURTgzk0jfepq33NRPOE2/rlUxRcL6dNf2Rib8ek?=
 =?us-ascii?Q?Qm+G4dUp9gKotbd9WFUVxAbCAI9g+65rloMhteeJVKSzbeBO3WCc57OYjOS8?=
 =?us-ascii?Q?bwF/1GuWAy06higvn/ll3r9EU2q3BHGOU3n/m+YqN5grZV2PUgldFd+nCzOI?=
 =?us-ascii?Q?A20+YODmjSiolkWbFfbCAR44+3YM5vUPz1I0qIzVDYAYkhjzHpR4ZHfDl7bP?=
 =?us-ascii?Q?uC6KjBE3F2SWTOAJ7AnHsv6MwWzGUNqIMrqvEvWJNd0XGqcncqmiDdLl+jC1?=
 =?us-ascii?Q?w+/EvZJbP4o3IgA1wCyWCO292jHGsFA8GSRe/FcdKGdvMzzDPwCzXvaNx3BE?=
 =?us-ascii?Q?dM7Avx7LoAz6ozc8Jv/44269UiuDpNz1/Gm2Qf97BuvgpDQt/f+1zLKe3hKb?=
 =?us-ascii?Q?XqxPI99eFsjfVWBBRqXckRBXSWMOvbaZ3llMJkulMAE11J83ra/VptzDXvFJ?=
 =?us-ascii?Q?LLLFtb5i6XtSQuLfH0CnifnMN+jOIooOQ1NzbxKCFLb8drvhDLBclUnn7pm3?=
 =?us-ascii?Q?xtWLBI5g1Wxs/vqLDI3YwIrcchQ6cbbDOa05jPAOs16pWpNFZQ4f3T6HRSTi?=
 =?us-ascii?Q?Krc/KmOeGZLz22IUU0AA03aBT/iwmZuZX6krA0LxZR0IHo3A8TBT3Xte4zKw?=
 =?us-ascii?Q?TMXs/hTaus83h3e5oJhBBB59MgBC80mmd6OaNZBTACFQcJfWbQXoee2Ojcj+?=
 =?us-ascii?Q?BA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c63d8cfe-60f2-4557-cf82-08dc70ea6da6
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2024 12:12:14.6669 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +DdXQJYzghO84zork7bLYDtKTtYJePeHIU0P6dGqFsQb6eLXIPUfnD+8aSjyjRKCPVWPscnhdpIwZWkNAZdkZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6323
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

