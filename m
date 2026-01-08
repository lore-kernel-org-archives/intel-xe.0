Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B50ED148A0
	for <intel-xe@archiver.kernel.org>; Thu,  8 Jan 2026 05:38:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1976C10E69E;
	Thu,  8 Jan 2026 05:38:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="sG5FfreT";
	dkim-atps=neutral
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012044.outbound.protection.outlook.com [52.101.48.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86A2710E27B
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Jan 2026 05:38:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vr8Z9+6fEE336yaleTBUBb/osu1U2N2ZBu7GWb/M/abhkFc6XPxbhJCkBG5bFuS3LpNUAUdpLHvObJXxw1wz/38FFeZNn3zFXjanMmVSF0ekqsELrmiVYhE00jem/ATtBloRmopOY2nqqm5bJQwveHIO8+nbQYuoStHixp/H2sU36wnu0hCiDn3P6MLiEFyIe2UarVHC7vP/Okv35PSJJULlfF0jw933zBQ48KmIelpAbXovP6d8t0lTcpdiybFttNGehJKhi7Mism8eBVN2owIayJHQKrsa/WeHFYYZavNz8XxGrbfXinaFsvb1LgmW7D3YnibmjVm1XV3h2d5qyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uQvaJZqRwOS517xccDBQdJbsBkJGuHz6un51HXQmgM8=;
 b=iR1JozCQHeA1ILXjQhPeqsOUEtDEUJ4BTrZDw7KCON/wTLd7xngTwuKrkbRx9nZR9F7MYNvxJWIfpCBWsL3ZI1KOt9uB0gBB8+Fw7MNrXui5oPCHpVmPNp3s8AVVR3RAU7/ppB5ymMAjKmaxv38R09Ep/AR9y1csz7kFh2pEg5L987NfIO61iiVealaGdyhgKyzXluHOSk8Z3fmj7fvf4S25MUbfWbn1ZbmxW+9vN1fsr26iN5EjYeQPI1K1Bb4or3YZWFaIQdf7cLx5wuoMLMyZV6XfeUVsbtexaRyFWH2ZAh+xjKCqKTa31cebgtJfAWNZ0RajcyoDvvRFuFZrfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uQvaJZqRwOS517xccDBQdJbsBkJGuHz6un51HXQmgM8=;
 b=sG5FfreTDjDNxg/Q0zotmgbuVJk3v0K2frOia+YAc1bHbuM6N96qJCwn6r6B6CvNvbJvlOM5Woz72Vi264VNXjg8FKcA5UUkfgrbotJcIW7tvV81SLYWKoJKYND5ra3qvr8wj1lw34MSPvMMgWRvWFaoegNmWgBkJpXZCgacye0aq5VHZengqf4ub9Lm84YEJz5EPqTdbSNn+pj545LyWHDfTwY08hQZ73sf+s/cwUvk+I7+vqEFBJa1WlleuceR6dULdwboEoipKrFrneB3q9as09Uh2yycN9gRFzumh/MiDeqnj8pnlgzbp0Ao0XEzVsIghwdjY+J/Ule+6qAMtQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB9072.namprd12.prod.outlook.com (2603:10b6:8:be::6) by
 LV8PR12MB9451.namprd12.prod.outlook.com (2603:10b6:408:206::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.3; Thu, 8 Jan
 2026 05:38:29 +0000
Received: from DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1]) by DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1%5]) with mapi id 15.20.9499.002; Thu, 8 Jan 2026
 05:38:29 +0000
From: Jordan Niethe <jniethe@nvidia.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com
Subject: [RESEND v2 09/11] mm/util: Add flag to track device private pages in
 page snapshots
Date: Thu,  8 Jan 2026 16:37:39 +1100
Message-Id: <20260108053741.38802-10-jniethe@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260108053741.38802-1-jniethe@nvidia.com>
References: <20260108053741.38802-1-jniethe@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR11CA0048.namprd11.prod.outlook.com
 (2603:10b6:a03:80::25) To DM4PR12MB9072.namprd12.prod.outlook.com
 (2603:10b6:8:be::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB9072:EE_|LV8PR12MB9451:EE_
X-MS-Office365-Filtering-Correlation-Id: eedef4d7-f99e-4e7c-8771-08de4e78272f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3ZGdaymKgxtpizvkcZtG4UGlCOy/SSxv+i15bs82flSnMRgaMTYyl6JareP5?=
 =?us-ascii?Q?fLox7klvO/esch3rXwk9FCaYaZv7/5qP+RW82R7er+f8fIlaWI1WwmChNMWF?=
 =?us-ascii?Q?0t31AHjYduX1R88dPTbQDk9ahoM/SR9l8vWoGxWshpQOV+Hz2/wFhBBK8TaG?=
 =?us-ascii?Q?sS21tSmBHbWlIMm/gLHfHXAOFbWOLcVe5HOGtbVi0mgxHPWN2UlukpN7Q8N0?=
 =?us-ascii?Q?mPR3e0YeTYUhHYnnQhhIvVNZhvD1JpcRQZdmFj+d4sicWG+LipMkWKkRfDWE?=
 =?us-ascii?Q?fOT3ZUVFOpQCwAOoiXIIqHAFx8eiy1pvBFlT3fiWp9G0vtBOnUVRM5Xp0szv?=
 =?us-ascii?Q?rXYyw7hOVQavy17IHmFzt2J7W3OUaOW8+9ZLspgm+ynhRje6M4EvjghJobeR?=
 =?us-ascii?Q?x5n71leEOHQqui+6iqv4u6hulG3y0irc5AcRU3XdHuGqhp0FaXt1X1ePf5f0?=
 =?us-ascii?Q?GdWU4a4e/BpF8a3D6aojBKB4Uz8Ur4+4oemea6C8/q66tYWCZxZa+RAT9uJF?=
 =?us-ascii?Q?o79E0lp3LkM0+9mey0Yrmkm0TLbdxCqwy4MW4U7U/UKNkvlz3Kj3192QySw2?=
 =?us-ascii?Q?4GNDvBJq6lesW2WoMEX/g3yj9axbbLr020/zzAdkacf71Q1r3uqjOkK2k1hk?=
 =?us-ascii?Q?osPctKqV+2MXx3Y42uoqmOXcg+RP9+62OThx37rZnselmGMTf3/B18RgS533?=
 =?us-ascii?Q?7pJWP4EoIwTe/bkH8lCIS2KdJ3kn4de/aHudJnQ2yhfq6g8kTdPaimIlqHnN?=
 =?us-ascii?Q?Nustm+CmE0z+KotnS5dnX8GznRlvpHyw17o617czQnFe2wt13vFcjXpjTcrs?=
 =?us-ascii?Q?8jlH40SdaXgMbonScRAgMDgPsviUY8oMVGhXgtETTxVUqBk5bykdw4HY/fww?=
 =?us-ascii?Q?+SmNU7RaViCzaWZOmQHXSFAfwKuddLWmCDCiwLSgMa5FfOpbTPr7d1l+MT8b?=
 =?us-ascii?Q?WARLTAGgNyJFMuSgyZPllLrF1w3JEtZB7kTQp4P/oA3LVtdhcv23t+jYWOfc?=
 =?us-ascii?Q?vWi6EY9Gdz0ysT4E9abYgZXME8WFwzQwt1Hkv5SvBZ4i/8rZZ59MvwQ6Wi1I?=
 =?us-ascii?Q?fsnm7jGwk5Sd25AsnSzSOeM9xW+mMheifM2BS+HxU7FfZuLylAbp5JSJZRa7?=
 =?us-ascii?Q?hTx1BURA4D48zSIIOBF5FLNsEI5QgKlORdwE6jw0VoSb1dMz3cltPmB7g5c1?=
 =?us-ascii?Q?OoXtk0Q12kFogstgY46DUvdybefqINZsfVUigk1f59xfGuOa/T9t4QEQPXrj?=
 =?us-ascii?Q?YFWNSqwJJ2VcEDKIzKLX1I4gNDZNpkcGd+O386Ltzh0eCGDvOiCQ/STZury/?=
 =?us-ascii?Q?7SxszRgnGXwp6GcvuKjMPHfYmRyN3Db8Iy6vhhhGicr4r9g6Mzr/4o75wAUh?=
 =?us-ascii?Q?0YkX4/pe0dOERsa6YMypRL4mbYsEpzxUYUTognUHNiDXlJotScyWUfYaPH+Y?=
 =?us-ascii?Q?4ZqUKOgwBKbnxZgos7qeSV7HL4XvC7PP?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB9072.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xhWOZikx/cFbt9TvAysMBMb9dfsf9kHJpuJSDcaR4xthTDOU/KDBolW/rrVU?=
 =?us-ascii?Q?JVPDIF4pqLS7GTAqIIUUImFulrZG0H6H/1Pik5eZY5apshqdj4BACoo8UGef?=
 =?us-ascii?Q?Jb5PqMoqMNBoAHvven99Ovhz3wpBse9rMpnfQtdVpWpMR4XXGY2b9y6bFr9E?=
 =?us-ascii?Q?eQJ1cm/xMF3AvUrmOoj+eAMVY0c4Vj5lhEW3A0m46Oq/r+FbQlAoab3KmnOE?=
 =?us-ascii?Q?ql6xh6IoyhcdVDFoJWeHqfyGyy1h38BzJZCDCq+zyvNZD4WhQWmH20xQpzqL?=
 =?us-ascii?Q?//EeAy+jc5atTReUogzWn5rv1K3mOBiPk9dERjz96evK2ots4fHYLg38ufqO?=
 =?us-ascii?Q?HxUsa89eFg5aD/nYuFG8NY5nqA3T4fg5NTVM+lTt0fkfK+J/Ti5gaywSjtoN?=
 =?us-ascii?Q?Ei/sDV8+it1JpdV5u4GKxC3y+fubWeYslXdR+HOl6d8xub9XmlsV2da2+Ptf?=
 =?us-ascii?Q?PeOgfbEOB7AwrKUrkWLZqcTbbdui8ul6imWvknto14rr9lkOA1rekPEKXqDW?=
 =?us-ascii?Q?43vg31hVHhJI5/ipiXwVMR4PVnfMOdIvgP0WyTADCSCQyDCxo24cP3f+wMuA?=
 =?us-ascii?Q?dQ570ybxHJLB8ozwGMtszerdNC0NucJttywbuL178WhGYeCt+0iIu0ZWvUo5?=
 =?us-ascii?Q?TI9jBpmSgHPYfN5t6fXFJJZnFsB61udrS3abRBDAZHcMdI97BVvy7arVKEJF?=
 =?us-ascii?Q?JWwnUWOQ/F4E677Uyur+Vq3FADknZjF6HUEqOYMxBw26NI6fJvfd3K+RwAG3?=
 =?us-ascii?Q?BDePQD7NB4bahhG6k6qXnXkfiobQnGGft5/YlBq+kftHgjmXX08Z9+HlAYQ5?=
 =?us-ascii?Q?IWBhFndrBgPgjQ+uLLrHPHIm27kdYTfeuJg2HM5phjDwNZPPSD+LrEsxZh49?=
 =?us-ascii?Q?xDFkR4z1D63CIVj95MWbcUK3RBYRHEyVV09nheKA+DonrcmgWQHF8bQ2jWXj?=
 =?us-ascii?Q?F9OL974vmdfwxOiU5WAggooaCPFOeYmf66EYRJPGqVZIH+4NW93ctukdOrTH?=
 =?us-ascii?Q?Wv1aJph4yH4y3CBll8rPly9K+3mMSOvHbBPyeRfmeXP5wkUzjID3P5alLsou?=
 =?us-ascii?Q?Al2n9jgEUJAT7L19gQ8OXHQzcFP+c89iPwBJlgXRaA9xB/kDITzNbPCb+/eQ?=
 =?us-ascii?Q?m5Wvk3xCOPxaRhGlGwehPYyvq2u4WDH8ATTqBX8dOLmH1N3HdOamF7TCmH6f?=
 =?us-ascii?Q?4EQCwGEl185GcglE4Y9JyAhJ36gBo0eODd4J1jJdR4CrPqi/4DM31WoKs3fk?=
 =?us-ascii?Q?1/cxCxCqDmYadfsE7mnhheP+KtJrdaars8xb49lkcV4fytR6gvOLCHgo0pko?=
 =?us-ascii?Q?XNF9zQAmaBGxb4IA84aOaDEvtia5eAi45r5NW7Nun2GdozhlA2Tw26Cu/r5N?=
 =?us-ascii?Q?NfuKt1ENHNx6X8sBFciAjnhUi6N+nkCisXGrmTfz8CMxpzMpDtgf760Ra0dd?=
 =?us-ascii?Q?/h0vVfkggKU+A46Jpk76zz52w1hECLEquBFhLPGW2R5XUezJggN706jWR+P6?=
 =?us-ascii?Q?93R2/OZJifE2+ns7YlZcCWG5rRf+2MzLBGbFO8JRXf/tKYkbuAGU+1RcT4a3?=
 =?us-ascii?Q?KzYcdOtxbEC72Lcso2hu3b1KRjsFQ6A16MzPOuUhx5mJ2ba6ragfUNutHLgA?=
 =?us-ascii?Q?70h4rlIlMpsCS6PGjTSeWxPCeh05pLKm93spDCHgWzz2e22R7r3dlykSKOC2?=
 =?us-ascii?Q?q26tMLSrmbW5x3uswFK3DZrlHwAKCkA88FyzSuwjOjBGlMOpRY09lzWtp3Vp?=
 =?us-ascii?Q?I+pO72qxQA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eedef4d7-f99e-4e7c-8771-08de4e78272f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB9072.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 05:38:29.5518 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B+dLP0QxRQaPzhxD9wpphOv7OGNPvYf3Wly15DkRErOH+BHWccIAAa+MdjZDmfR9dfl9Erfc5TynszWMLNDTGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9451
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
v1:
  - No change
v2:
  - No change
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

