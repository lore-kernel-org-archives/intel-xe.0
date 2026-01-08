Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1C93D148A2
	for <intel-xe@archiver.kernel.org>; Thu,  8 Jan 2026 06:01:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1E5E10E68F;
	Thu,  8 Jan 2026 06:01:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="jv3tF68O";
	dkim-atps=neutral
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010005.outbound.protection.outlook.com [52.101.85.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B27F910E68F
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Jan 2026 06:01:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lGSjJ7EUbEceU2n5jWn06sgFQ73gwXdGl1+SaBuGytdg/rJochIHoNLvp3sgAe9A0QSFkOTlsvzPdC5d2h97L7UXhp20SV+Lt2alDFHyOgpIT2XReCKIgViccsySh0iC0VXjqSYD9wQmLf7Z3rYPd1j5GkuacMg1YyJe2WLRQ2a4vKFSo912RQY+CsoaiCrFzktqYESmR6XQFXE2KEkdIvZW6aDrylaO9YUFCqCNlYWVqP9cYcZXkL6AJypcIlKTUu7TykvkqJ+Sa42TONujQ1k4scvZ/DmAWwf/XotOiz/kmhQ+ZIEjXsF+Ko70IFXJT49v4bAjnApuikHNcwfQ9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LPJ8J7qFOShKjih3sSE7+lZkP7BkO1HxyuCCzsZfIE4=;
 b=KpjvQtp6Lo+UZUsuJCHoYUHPnMBn6lZYBe7XiUvrJe+in0xPbjd/RnLG+66Po7j2o/7nAhjP/WaTj7UrZO62LzFB/Y7PCwToKBPspKItzzqDE5Wmzh0ozxHzUGVF7aL20KoZ4+NuRX53bVb6iUdY69NU0MkoNcaXAdu5+XzFvzTR5w/HXAK7P1f5I5/6TbHXAOporHi5f8J/d1aZPiCjA5SdannoXOS0+ors5FPKjoEs3iYV4rEU1rbTRtvmP0FYPInG9H9RgDK/FzxXxPOEpdaYbN5YZdfocjYot8tXZ1SPL6c2Hqp9i+DhqidGeh4kxtce6Dcwcxgdg+QQZRM/Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LPJ8J7qFOShKjih3sSE7+lZkP7BkO1HxyuCCzsZfIE4=;
 b=jv3tF68O6QT0uxX7bW0ET0OK1fBIbCNAd+MkL9y/diQpx6D1ArTfXqMMuylJJP22x01a6Rvzu/qM+RUgOqrhbTG5CVCniP1tgAK57NhatQI11rQ4y49DQO71XUm7wuXebB1WD/luXln+vHvisAWuETwNED6VU+qrqOjpX8ubJmqeJ23AL/Q+4Rtekk36Dzkqi07l2HMedd+lrTfmHetg3jV+S+1wExAA/vi3XsXOaxW+Ka5ELU/jSt+8dsqoXgTO/lbX3ntKDqu+0Elm/ELGO2/umUdYFRPYL6HvgFzG/JuQOQIc3ZEdxOugylDvR8wlLfLW6dMBBV1679UkZVO4dQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB9072.namprd12.prod.outlook.com (2603:10b6:8:be::6) by
 BL3PR12MB6618.namprd12.prod.outlook.com (2603:10b6:208:38d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Thu, 8 Jan
 2026 06:01:38 +0000
Received: from DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1]) by DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1%5]) with mapi id 15.20.9499.002; Thu, 8 Jan 2026
 06:01:38 +0000
From: Jordan Niethe <jniethe@nvidia.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com
Subject: [RESENDv2 v2 09/11] mm/util: Add flag to track device private pages
 in page snapshots
Date: Thu,  8 Jan 2026 17:01:00 +1100
Message-Id: <20260108060102.41357-10-jniethe@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260108060102.41357-1-jniethe@nvidia.com>
References: <20260108060102.41357-1-jniethe@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0094.namprd05.prod.outlook.com
 (2603:10b6:a03:334::9) To DM4PR12MB9072.namprd12.prod.outlook.com
 (2603:10b6:8:be::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB9072:EE_|BL3PR12MB6618:EE_
X-MS-Office365-Filtering-Correlation-Id: c7f7ce63-971e-4ed6-356f-08de4e7b6328
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3SN4gLkHxgdZoAps4Bvqgghwq+RgPexb9cPPm7gMupfBKFHW5kmM1n1FZMrT?=
 =?us-ascii?Q?VjGSBUq7ykrMRDeUpMrtuA6rwmmYXZ6DgaWy2o11rc1g0Vv5vbZJlgbx7zyR?=
 =?us-ascii?Q?C7gW328CV27P6cvuBXhIueuy3UXGDy40BLxM+2648HegY2/0hCpcWY3VrbZP?=
 =?us-ascii?Q?SkD0U3qBleT3unATEStjgULGmHNFJIiQD58IVeqZFGpOqeuf8Khoh+McxOx2?=
 =?us-ascii?Q?EfSUl/eruzstLYY5dW8Z8hLUp401kH3B7bho7ITaKdURNJucAhtX94dZhxQs?=
 =?us-ascii?Q?dm/mIW/Ofp4Z0WROo33rctyv7kdIuGk3nitbhAZyp+7BGmmCpNVBT2zAgsK6?=
 =?us-ascii?Q?JrEqFl4ZpWQDl+YqTRmVtQ+M0K2gun/kdmoP5ThJQggiXdG3XcnGk/3lO0ow?=
 =?us-ascii?Q?rB7E388/VQyNyX81llxAykecqthyrw+UJf4jURZxbh6pFryewgCi8lso7pAT?=
 =?us-ascii?Q?JLpeiARFCIg7bA0kWOwEAkEWOibIdvh2ERnuCUlnsEHrC8QBqWMdPSPCVH9d?=
 =?us-ascii?Q?rl1zMvoY3gUD4G/9Ic5u76fzJbnntqEeZJd4grXbT8aMmsCOarb4Xsm6PFfh?=
 =?us-ascii?Q?PoGiCYIBa0Ws9+h4hPjX1W394NQfBwotclunROK9k+mBLe1INljiJtLRaJSe?=
 =?us-ascii?Q?AB/iebqsb0jMJE3PIu4I9o2IuDomquHdoVeqc+LiV9rkjcc8EP3dnhmWeHFt?=
 =?us-ascii?Q?ALaSOVuHTd7edQOmwc7pP8E7I9nMkstYSrlGwa/3uSS+yY6W7rTm1aQK7d2e?=
 =?us-ascii?Q?PqtUv3PyncVjZrIkj+X6yeYk0klNRSMQs7v9BzsH9otJZJpOQ16q1vVTucNk?=
 =?us-ascii?Q?0zPzhO1hrrKQG/XQaqs3866hnh8S215MjhqACxYWSwLKfSPvWF/7BY5uA9yM?=
 =?us-ascii?Q?onToIB3Kz5H2RlzKDiGqFzCinHeDeWNV6U5Sj5piDktJf2n0tXMGPjHW/dZI?=
 =?us-ascii?Q?CF1UbwNvp3yJx9nDngkx2AIJAti2Q3PAlxJQBF23ZwS72BD++1ne3zP721ir?=
 =?us-ascii?Q?bZ2l2rxwAQDRMFZ1z0onZ1m3uvYOuEVJwv/2S/d65OSBML5fmRcoVArCvXKs?=
 =?us-ascii?Q?G8IlA9ZipZpoRsuXvLopoz8L1U3WWDRFEpLCHthoHbOVAfFEkZRFRJj9cAQm?=
 =?us-ascii?Q?7QfxG0KJAE11k0YdJqU+CxqbD1+NBidt/e0mDBhRNdZWzChtdGVrj7pMRw6c?=
 =?us-ascii?Q?aLdYyEb7ecPJ6sDYDdIVvi2b1EpwZfzCgVcxJB697jl7jEQIAV7QwVuPyRNY?=
 =?us-ascii?Q?Or2UTTXKtywzuuWHye9N4UYdFL5CkE5Zn8mFx0jk9jHu+mYyXjcjJBCDNWyb?=
 =?us-ascii?Q?+x8hMCN/43Rtu9GWYOLLlwSaiW1pQbExNgk3RyOYX0xv7nGbGsY/ac3nNCuD?=
 =?us-ascii?Q?4gea0AOGHymhFGsFLyL8/N2/YpyWQPjaCun5Eym9ENyf3rNi93Z+jGTn0pft?=
 =?us-ascii?Q?YizvFSzYsWmOqkR6h72ey7iaHMSddydU?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB9072.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ogUFSTlrchydgY/uVdW+wqQIW4uLY0W46m9CwfKWgVI22LuLornwBKRlH920?=
 =?us-ascii?Q?4utQkm9YQPZ4g2EyvriwZ++jY0nsKgCtPphvU9KtiF2MqnVohShytqcCbNxY?=
 =?us-ascii?Q?OgBK/IjYE+ehPCFZPGy6MVHU6kbFERy0CUMAkRTyXMOjXrBaGkFNiRGs1Ps+?=
 =?us-ascii?Q?GXnWGPPM7FHJcyysyPNho60hYfmtAG6y8Wz0as6+umPZprl0HSDbPImnn6T/?=
 =?us-ascii?Q?cGCBzUDRxf5Ogke4UBqw3XBpg8L82dgW9JfB+IMo5kIPOMM5R6UElhlRR1Vh?=
 =?us-ascii?Q?CYOEIOSUCjcFjpg+ly+X+gV+chtZxmdSTF1zZsHnMhMHz/cEGXM+IgzThIln?=
 =?us-ascii?Q?g35/mznuYjobYZ7qgc8onpuJzxar5mm45EhRyHFiddY1vdFoHlCAu+pWLXxm?=
 =?us-ascii?Q?Of9S1M94EWQ7+soELaGmdacHjDqM6fX9avxxMgaPRrFrLIuwnDJgnSEEuxpc?=
 =?us-ascii?Q?zEnbdqX0lQTDpsCM+gTfQNRU4YWE1qIdLYOD6MbO4+E3m0FIdg1utzn94rLi?=
 =?us-ascii?Q?EUOaXUChQXqSlxlR+atUf4gsbCyqZPuWeP9vlGQhjXNgyUGCZxw/psPiru3L?=
 =?us-ascii?Q?zMYfRtSnYwcavQaQs1wZjfeDyu44XJ45TgPM0gisnaPw1+eFKSEkvEaq2ObV?=
 =?us-ascii?Q?XdMd8+J4UwR0zHyMkpnOKqb2sz2yo3oI8n+eSjRKUgkvcs5tQomZMachOYHh?=
 =?us-ascii?Q?e596yVTqWlHGxUqM6A7RN+Ajt5dHl4u74mf7GjbcK9S1EY5RFF95sBQMJt7T?=
 =?us-ascii?Q?hi0BlHpOREqJEsERFPcmSYqW3wBrdklb3MwvGYUcvzpIXKV7ZBVgBOCsQRJf?=
 =?us-ascii?Q?6Lh7gqwoUJ92O8CNTKmbhvk/fPXAltFK0q6NpsTtl7jhkftVfC8WeEBsWZPd?=
 =?us-ascii?Q?emVWB9dsf3xdGzgFsKmM9LulM70aBJLfEIc+uQEjcIdAxcuhJVxQYYz3+WHS?=
 =?us-ascii?Q?phfibduqYqlH9+fm3K5n7/2lCMSKm/L2G2jRzn18dQ9/DfQFWzwL0tJMFomZ?=
 =?us-ascii?Q?LjNSd9O/p/4mirJklhaEp8zUtoM1MzPlN/Ll+sboi4HiV5xm/mUK3YOBsn/1?=
 =?us-ascii?Q?IF19sPR9carKYUQkRw5ckjVXp/+2H21/GWyQ8D84Z0DnUn9V40Dwp8Tz5GZv?=
 =?us-ascii?Q?jyLxvJ/QURx03CUSH3bUQhwgXb+ZfPyyNGp9ygBdtQbPd3mZF+aibsKm+zdy?=
 =?us-ascii?Q?umfim/vywwMm0CUj1iFqxeyWVaqLfCPgIEngNjqIzqtrirYlsBcO+SBMX7jS?=
 =?us-ascii?Q?7411kXRByfJMykbMoUL5FzoEQNEm8rMY3uToWXBHI+NwXibcYOozf7UW1DB9?=
 =?us-ascii?Q?Q178AvvmLOMzz+/lde7KpGF8x8pqtT5qa+n0Yr9C1zdHPR1uM7B+iv6qfAfO?=
 =?us-ascii?Q?Hgh15ACxCrXVzf3Rx7Ousg5wHDqHamkui7xwymTbCc05h0Ne4Cl7jtt3nUbj?=
 =?us-ascii?Q?mFQKTberDMeQFDMV+PKmLqzSG8YJjythPxgbkcMCNySBYGjIho+mJ3GJxnNU?=
 =?us-ascii?Q?yAYiJu4BXjonGXUq11ixn71X5LMpuL0Cz5jc4fRA+pMnR1+0SsnZdFJCRtgt?=
 =?us-ascii?Q?ODnNOObC5PSlPLtJIHKfAiLxSg+iyVtG+fDmP/oiJSnXFQstH68B7I0XRNzH?=
 =?us-ascii?Q?WuIFL0aw98NtxkLcScbfdJT/bE+bgdK1uqbPP+1VPvOHN4Bx8jh37805f8Xl?=
 =?us-ascii?Q?d8OoSM9dE40F1WWybyPBu/C6XV7Sen72013ZT44KZxO1DvDTte5WVMHgu+3s?=
 =?us-ascii?Q?c4Z4W+8rAg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7f7ce63-971e-4ed6-356f-08de4e7b6328
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB9072.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 06:01:38.7351 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8e+J5UvrzG4rSm5U5fJEe1KQPl6cr6WYuzR+7YPhqkKIq1RcduQfeMIIVyiAwUWDQMdf36ls5LB3Vd5G7fy7iA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6618
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

A future change will remove device private pages from the physical
address space. This will mean that device private pages no longer have
normal pfns and must be handled separately.

Add a new flag PAGE_SNAPSHOT_DEVICE_PRIVATE to track when the pfn of a
page snapshot is a device private page.

Signed-off-by: Jordan Niethe <jniethe@nvidia.com>
Signed-off-by: Alistair Popple <apopple@nvidia.com>
---
 fs/proc/page.c     | 6 ++++--
 include/linux/mm.h | 7 ++++---
 mm/util.c          | 3 +++
 3 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/fs/proc/page.c b/fs/proc/page.c
index f9b2c2c906cd..adca0e681442 100644
--- a/fs/proc/page.c
+++ b/fs/proc/page.c
@@ -191,10 +191,12 @@ u64 stable_page_flags(const struct page *page)
 	         folio_test_large_rmappable(folio)) {
 		/* Note: we indicate any THPs here, not just PMD-sized ones */
 		u |= 1 << KPF_THP;
-	} else if (is_huge_zero_pfn(ps.pfn)) {
+	} else if (!(ps.flags & PAGE_SNAPSHOT_DEVICE_PRIVATE) &&
+		   is_huge_zero_pfn(ps.pfn)) {
 		u |= 1 << KPF_ZERO_PAGE;
 		u |= 1 << KPF_THP;
-	} else if (is_zero_pfn(ps.pfn)) {
+	} else if (!(ps.flags & PAGE_SNAPSHOT_DEVICE_PRIVATE)
+		   && is_zero_pfn(ps.pfn)) {
 		u |= 1 << KPF_ZERO_PAGE;
 	}
 
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 6f959d8ca4b4..9fe63fc38155 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -4623,9 +4623,10 @@ static inline bool page_pool_page_is_pp(const struct page *page)
 }
 #endif
 
-#define PAGE_SNAPSHOT_FAITHFUL (1 << 0)
-#define PAGE_SNAPSHOT_PG_BUDDY (1 << 1)
-#define PAGE_SNAPSHOT_PG_IDLE  (1 << 2)
+#define PAGE_SNAPSHOT_FAITHFUL		(1 << 0)
+#define PAGE_SNAPSHOT_PG_BUDDY		(1 << 1)
+#define PAGE_SNAPSHOT_PG_IDLE		(1 << 2)
+#define PAGE_SNAPSHOT_DEVICE_PRIVATE	(1 << 3)
 
 struct page_snapshot {
 	struct folio folio_snapshot;
diff --git a/mm/util.c b/mm/util.c
index 97cae40c0209..65e3f1a97d76 100644
--- a/mm/util.c
+++ b/mm/util.c
@@ -1218,6 +1218,9 @@ static void set_ps_flags(struct page_snapshot *ps, const struct folio *folio,
 
 	if (folio_test_idle(folio))
 		ps->flags |= PAGE_SNAPSHOT_PG_IDLE;
+
+	if (is_device_private_page(page))
+		ps->flags |= PAGE_SNAPSHOT_DEVICE_PRIVATE;
 }
 
 /**
-- 
2.34.1

