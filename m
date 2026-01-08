Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C60FD1489F
	for <intel-xe@archiver.kernel.org>; Thu,  8 Jan 2026 06:01:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4023510E2F7;
	Thu,  8 Jan 2026 06:01:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="lTqW1GY7";
	dkim-atps=neutral
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012051.outbound.protection.outlook.com [52.101.43.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5288610E2F7
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Jan 2026 06:01:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KDbscZwqoTwib4tsUftCt8FEUAlMbt8Bs6bMagu3nTF+Ma3f04Si6vyEgXhRTVmzaHDGUkgGFYezcLKvDc7ru+QRtVMK2MK89kxRlylrucNxUGe6rZQ1eg4w7so+z2Qq6nfMid2XL2a2kaboeSzP9PR7tEP4cdZ90F49CoWXMeqgqCCAib74LMEaYOGynpghzioykTsyzew0L+3Rcg0y5ymnErTL4LI0MhnZvGrf4rhBvZJEdHFchTNB/5AD0R7xMkpESKB6VIzRnurXmLoOWMwe5Z9Mwau/FzzDfZ88LTEACK9KKAT13d6K6mObDJnIyEGPnQ78xd/aojB8AcJGWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Rtx019vQfO+dmZuIIpK02KrJl2on7MtLdSxMN3YZ9U=;
 b=huepBsSwLRdpkrVKajBcErdbvllhP3H4Y6TYEb6Tx8nirfWtcwJpawRkBI2Qnq3vg0siaPqMc/M4u/9GVMABj6JZ1+gSDPgHMTKBnVJRxDpU1hNeJ/WRSLjrAyKD/yBL378QueWfRRuwdjjnEdueLVozJz7a1clFVH1KQ9/fmItMkYyc6q3wgVqnhBgGyyE+OnFQku69ISsR2e3wraUe7Q+WtrMwSAK8OHdloWvKf5ka4p2H1VPSVCIgEuy/g0410wUiZNZSo86AisQV/zirBLovROOPPbpiYNsr8iAvxUlTsw4d5NK3CAWJX6voLahxSWzij2X+7891+nvw8OuYpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Rtx019vQfO+dmZuIIpK02KrJl2on7MtLdSxMN3YZ9U=;
 b=lTqW1GY7La0AtVtI9mgrBx213j8d2//G0xauYFC1OwHUJTLi9vBZI9zE3nqS2SAAi3unT3eiRW2YDD96Uv9CpqNGwpVNzIH3qxNvdEjlnrLV5jthaQ8q8vufCaFqLlpQSs/80Wj9ehC5/8tqNWDcPV4k5NAg8pSEUGnZomP5ggRtowPRpXgvcmDJAZoguqdnaCZyoL1XynAd2ihNKXCTvx8l+1tUXTei27Wi50K3xN6iMScdwWiwauPKNb/Vshgn6ohuwnaXVvD5LAcLvfForkmaLezIMhy/DZ3nIbYRXJlUChQbstONAn8ElF2hpzwiq87mYjECuRRnU4NZ8+0rVw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB9072.namprd12.prod.outlook.com (2603:10b6:8:be::6) by
 BL3PR12MB6618.namprd12.prod.outlook.com (2603:10b6:208:38d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Thu, 8 Jan
 2026 06:01:28 +0000
Received: from DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1]) by DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1%5]) with mapi id 15.20.9499.002; Thu, 8 Jan 2026
 06:01:28 +0000
From: Jordan Niethe <jniethe@nvidia.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com
Subject: [RESENDv2 v2 06/11] mm: Add helpers to create migration entries from
 struct pages
Date: Thu,  8 Jan 2026 17:00:57 +1100
Message-Id: <20260108060102.41357-7-jniethe@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260108060102.41357-1-jniethe@nvidia.com>
References: <20260108060102.41357-1-jniethe@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR11CA0059.namprd11.prod.outlook.com
 (2603:10b6:a03:80::36) To DM4PR12MB9072.namprd12.prod.outlook.com
 (2603:10b6:8:be::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB9072:EE_|BL3PR12MB6618:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c7f7be7-bfec-4f58-860e-08de4e7b5cec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?g0UI5T+HcNn2sutN8me5GV8chGUdbHuy8ewtFwy18+XpQn4cXJ0+zpefF7Fl?=
 =?us-ascii?Q?jvZ4JTPrsrSm3mWROjwm0JSbSz9OUiCbRBMJ3wGM4XCvxSxlBHUbk1UNPwNt?=
 =?us-ascii?Q?cfXrptKCwT46lFfZcI5hNeAhroAH96BDsZy0nz5srmySoBvzLO0o5ixkkOZv?=
 =?us-ascii?Q?yTyRte2XVZSNL3T4Yo9w0X6nNAfNRgBp6/qPn00mG0ind1B0xAnG0gJeUfoS?=
 =?us-ascii?Q?Txyq/XKPJOuw6v1qkD3cnxsHmLH18I8DaeEj7TsoIcSkCzQ9od3iBc2h4SET?=
 =?us-ascii?Q?DyLdlMRIQIPyHwsly8JEKLl+ngpuA+d6F0rDPGtsHSsLhEHW7J5h74Hwun9b?=
 =?us-ascii?Q?JDiqUgw/sqeYcm3AMc58hSOJci/66aZ897uDLWxtb9US6BoFM8fOZiFRYLui?=
 =?us-ascii?Q?fcq5zc3Kd270uwN7/kctCxZ/2JfdfrxiZJCNZIlxyDj9T23jkHNfmnfs3s7g?=
 =?us-ascii?Q?XvEZZRtvFIT0ly6XRUJ3bfQK3okMw1W+kCSgT7cuKZjIPa1cG6zXNPGeD38A?=
 =?us-ascii?Q?21YH4CA4C8S9235Mk6rIhVCk+SATOwTXYsdrxSzOztuBGKq9b8NszMlTCepY?=
 =?us-ascii?Q?zVpSxz5caVx8G0pgSt3+KK70UGvmqZXbuW5GrRQDlss8r21eS7ifMDZUrMVk?=
 =?us-ascii?Q?WCUt/VhMbg0dMj6qsxv1h5/HigNSVR1whZIls3jf/SmsjDpMXVLCOBuR1IIx?=
 =?us-ascii?Q?zefhe0mBgMUo6DzzVNrn6fMVKPy2/Z2Tt4xkRzuYGZVxwfyjJBp/g3DNc7ku?=
 =?us-ascii?Q?1h7tvHfH5AP1CEvVVgaVpTTb/VkfxsnbB5wIaA2463DhK/any4ZS7FP9e1aL?=
 =?us-ascii?Q?F7HoBsramIrzL35L657IWQ+lrJM9ZgETvCxz88weWIjomOscJCQYCL5GB4d/?=
 =?us-ascii?Q?dXjbie4ncu+E9jVOfhv3gjrwaD4ejXMGsn5hURClzW8kqm1XPrsEpBvmeaG+?=
 =?us-ascii?Q?XnMh0HltiZb9nQI3JVhnu/ltQJpyajNpDS9PFGal4jI2Edzo2JwJLe85SZ0m?=
 =?us-ascii?Q?OPAnQMp8fF06tnZUUnHpjDkKu5a7YKfwm4/U6mFCHWxHGDB8d66xyFIiADMN?=
 =?us-ascii?Q?8irrfu3fDUKLmeGCm1rxaNmxaFbWCbcSvc2EtSoahDsHPvoExsvDWgeyroCQ?=
 =?us-ascii?Q?YVnJGwYsspHyIMBxW5KceA4F3d+p00AiMSV6NrTz2JGDCv++WIuqNVOt6m6z?=
 =?us-ascii?Q?+TILadoJd392obzR8bxGA4+jZKH6/QB0UOxLaw0t0j5Z618pMuQZqCXBamWf?=
 =?us-ascii?Q?pLjaSeZHhStBn6CisApkIKEM1Z7FoEgpEo6cegY5rfJKCr+fmgpPMe9ui3TD?=
 =?us-ascii?Q?61ZkjRKEj3CUpwHyeQao+3/psrWGwhZ+yf3dfuzn4w8CMTiiKQUxNYqyRePi?=
 =?us-ascii?Q?jeTdLD7Rd5eQI++NHFQI9qymyE8YjZ5Rh9mM0sfkmvNfBatjmpuQBTxem8A5?=
 =?us-ascii?Q?fBIeuKZFhuSRpwCjvt1+TE7DJz9WJRfO?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB9072.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ucMX9Uq2df5Px90lxW+Z6FuEYxwvx3SBDJqFJbCJH3AWg9yDvleJPrlZVu/P?=
 =?us-ascii?Q?VbsCKq5QajdTi2u5DnaQS9lNqMoe5fy3ocA+A4IkKTuBo3HaDj9rx02gSlU+?=
 =?us-ascii?Q?5rRaLvtRpqhzsj0SHZgHcOu4QXP5NsySmDQn+aVtySJi6FnS79ur+fpWjGoI?=
 =?us-ascii?Q?RVkKr8dc7jsmUOAlcM42hBaNYjzU/pjeTVMZspKiBmSP3O4lgtVYRgWHYe8F?=
 =?us-ascii?Q?vqL7xrRJnLMO6+f7hNNqZYIcBPXhuAp09mAWhiLL+voEJNMpP1gFVYU86+F5?=
 =?us-ascii?Q?BYICeHdNi590pcJxR18RVM4fGj/UsRPaMq6Zab/BbZHzQOwSu8ldBDVVC1LY?=
 =?us-ascii?Q?NCeSwXIVyxF/fDq9gUN8T84Ji7rVU0T50VqGIUguA9yvmorV5YVz3fzTxHWn?=
 =?us-ascii?Q?QT5HpLWg/m4Kks0oAbH1fpVHVT0JZHnee+puWA9oBWUpbXvqAVsYZPfWZyI+?=
 =?us-ascii?Q?lUnjr3iZ7EyaFZVC6t6Fxu6nCztWoBiGqI9cz86jvkBIWh79HqWWhwXOPyQE?=
 =?us-ascii?Q?FmjHkKUTpvJNw9pZHGGvdTfY+7J29VngbmOmj15c1RR+TPeTCLmLI3WbnA2F?=
 =?us-ascii?Q?cX63jt2U0Wom1vRcB7EvotudyqVTll5dfuxKtDjXrJYi/3ruUnCv5HSHWk/8?=
 =?us-ascii?Q?YVCrLkbTAwLeDwFKR4cr0fj3i0Q5uA7xa0O5D6WJ2/EeVgpGL5tDdQujPH/E?=
 =?us-ascii?Q?Utr6jNSf9SS2aoHKKfSCWUULk+DOQGiL5lX8F3ZRh5KdVDm74PXCdDl79PRN?=
 =?us-ascii?Q?RCWu3aLSE4nPwjfOQCEsiGCvbPaayiEJmYjiZVbb7xaTs6zM9p2DLOLL+qvm?=
 =?us-ascii?Q?LrPvYXTBUPldLvzytwDWKv9Z9C68EFaK1siefmDCKot4dwIxqjF5dVPkht1Z?=
 =?us-ascii?Q?+W5+zDvYIn7QfCDTuovyTr+VLM9ruiKApjiZ7EPXfQ3BVl1XhCY3VVs4C4Cp?=
 =?us-ascii?Q?OMave1aj5EivNaxNWYM8NaUHjzL8Odc5DpFaV6wLlAO2WoCRnNlvju7+/tNe?=
 =?us-ascii?Q?Fax6CiN60gCY8UPsHGsfJhmH6UGEU1HhPvf+P+TI4p3yk5Zc8p9I6c2dYvPD?=
 =?us-ascii?Q?qWcjZCmegTC0DIkWYe6rDNyVnlJLBojBMcw4Da9l5HJ/z/koxWT3tmKlgn/t?=
 =?us-ascii?Q?hvDXwzU3inOdPJ7PxrgYEexAj8aFWlAptqsYuz250Ds66VfOG96TcqPqNj3Y?=
 =?us-ascii?Q?cLYE04BY9EGPuh63QbJRCCohKa2T38clC0XgPfiMEPEtD/zMy8vm/g2zg0Zy?=
 =?us-ascii?Q?5iBNuCaI8zx5gWUm9W+D69e7sgt7cZYnP6QMxjPtoqMUaRFlcNyV/b9V5JK7?=
 =?us-ascii?Q?VBbe9M0D5oOyKH4jJCwEzLV3gxHFRQT/0bBXlu1xmUzmZ1l7H3/pUtqt+gcc?=
 =?us-ascii?Q?EKzC3HTlCXUtX4fnW3YM9iyCxroNR0kCJUo34mAt8JVwRQDUMCQmpwQ9OFvt?=
 =?us-ascii?Q?zJ6OAUMrv+NzbbwnqVMqyGvdQluG5VLDxmg9ds53+Rc1y8Rs7Ci+gV3EK6zm?=
 =?us-ascii?Q?74fCaISackEpWXl2ys4MkVeUNtzr6eFM40c+zJw0hArLfdSkMC8iU2DH4zCY?=
 =?us-ascii?Q?XAsHTtGF3cnZOCEHwgvMq4lLY7RlKlf8xN5/O8nqTdi6uxIhoZhye6K0bap+?=
 =?us-ascii?Q?N3y58aYHtcaz+IT7IwB1BceUMgWNdLPgMT8I1a8rb2aJ1uvZ17PMiQFQOXj0?=
 =?us-ascii?Q?HLxa8ZFrVkgVkgu5J9HEuQW/MgVIKB1i2EHbtBsPZL/w1WOX/ZJ3xQg4YDV7?=
 =?us-ascii?Q?+zkgpt0wrg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c7f7be7-bfec-4f58-860e-08de4e7b5cec
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB9072.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 06:01:28.2223 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bCX5ZQtIQioR8ygd4HaVlkd3j5M5qPMOag09XK9w6I6pyau94egHn8vOF8ezEtjVieYjPFhxRK5n9xtAqRf+wA==
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

To create a new migration entry for a given struct page, that page is
first converted to its pfn, before passing the pfn to
make_readable_migration_entry() (and friends).

A future change will remove device private pages from the physical
address space. This will mean that device private pages no longer have a
pfn and must be handled separately.

Prepare for this with a new set of helpers:

  - make_readable_migration_entry_from_page()
  - make_readable_exclusive_migration_entry_from_page()
  - make_writable_migration_entry_from_page()

These helpers take a struct page as parameter instead of a pfn. This
will allow more flexibility for handling the swap offset field
differently for device private pages.

Signed-off-by: Jordan Niethe <jniethe@nvidia.com>
---
 include/linux/leafops.h | 14 ++++++++++++++
 include/linux/swapops.h | 33 +++++++++++++++++++++++++++++++++
 mm/huge_memory.c        | 29 +++++++++++++++++------------
 mm/hugetlb.c            | 15 +++++++++------
 mm/memory.c             |  5 +++--
 mm/migrate_device.c     | 12 ++++++------
 mm/mprotect.c           | 10 +++++++---
 mm/rmap.c               | 12 ++++++------
 8 files changed, 95 insertions(+), 35 deletions(-)

diff --git a/include/linux/leafops.h b/include/linux/leafops.h
index a9ff94b744f2..52a1af3eb954 100644
--- a/include/linux/leafops.h
+++ b/include/linux/leafops.h
@@ -363,6 +363,20 @@ static inline unsigned long softleaf_to_pfn(softleaf_t entry)
 	return swp_offset(entry) & SWP_PFN_MASK;
 }
 
+/**
+ * softleaf_to_flags() - Obtain flags encoded within leaf entry.
+ * @entry: Leaf entry, softleaf_has_pfn(@entry) must return true.
+ *
+ * Returns: The flags associated with the leaf entry.
+ */
+static inline unsigned long softleaf_to_flags(softleaf_t entry)
+{
+	VM_WARN_ON_ONCE(!softleaf_has_pfn(entry));
+
+	/* Temporary until swp_entry_t eliminated. */
+	return swp_offset(entry) & (SWP_MIG_YOUNG | SWP_MIG_DIRTY);
+}
+
 /**
  * softleaf_to_page() - Obtains struct page for PFN encoded within leaf entry.
  * @entry: Leaf entry, softleaf_has_pfn(@entry) must return true.
diff --git a/include/linux/swapops.h b/include/linux/swapops.h
index 8cfc966eae48..a9ad997bd5ec 100644
--- a/include/linux/swapops.h
+++ b/include/linux/swapops.h
@@ -173,16 +173,33 @@ static inline swp_entry_t make_readable_migration_entry(pgoff_t offset)
 	return swp_entry(SWP_MIGRATION_READ, offset);
 }
 
+static inline swp_entry_t make_readable_migration_entry_from_page(struct page *page, pgoff_t flags)
+{
+	return swp_entry(SWP_MIGRATION_READ, page_to_pfn(page) | flags);
+}
+
 static inline swp_entry_t make_readable_exclusive_migration_entry(pgoff_t offset)
 {
 	return swp_entry(SWP_MIGRATION_READ_EXCLUSIVE, offset);
 }
 
+static inline swp_entry_t make_readable_exclusive_migration_entry_from_page(struct page *page,
+									    pgoff_t flags)
+{
+	return swp_entry(SWP_MIGRATION_READ_EXCLUSIVE, page_to_pfn(page) | flags);
+}
+
 static inline swp_entry_t make_writable_migration_entry(pgoff_t offset)
 {
 	return swp_entry(SWP_MIGRATION_WRITE, offset);
 }
 
+static inline swp_entry_t make_writable_migration_entry_from_page(struct page *page,
+								  pgoff_t flags)
+{
+	return swp_entry(SWP_MIGRATION_WRITE, page_to_pfn(page) | flags);
+}
+
 /*
  * Returns whether the host has large enough swap offset field to support
  * carrying over pgtable A/D bits for page migrations.  The result is
@@ -222,11 +239,27 @@ static inline swp_entry_t make_readable_migration_entry(pgoff_t offset)
 	return swp_entry(0, 0);
 }
 
+static inline swp_entry_t make_readable_migration_entry_from_page(struct page *page, pgoff_t flags)
+{
+	return swp_entry(0, 0);
+}
+
+static inline swp_entry_t make_writeable_migration_entry_from_page(struct page *page, pgoff_t flags)
+{
+	return swp_entry(0, 0);
+}
+
 static inline swp_entry_t make_readable_exclusive_migration_entry(pgoff_t offset)
 {
 	return swp_entry(0, 0);
 }
 
+static inline swp_entry_t make_readable_exclusive_migration_entry_from_page(struct page *page,
+									    pgoff_t flags)
+{
+	return swp_entry(0, 0);
+}
+
 static inline swp_entry_t make_writable_migration_entry(pgoff_t offset)
 {
 	return swp_entry(0, 0);
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 40cf59301c21..e3a448cdb34d 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -1800,7 +1800,8 @@ static void copy_huge_non_present_pmd(
 
 	if (softleaf_is_migration_write(entry) ||
 	    softleaf_is_migration_read_exclusive(entry)) {
-		entry = make_readable_migration_entry(swp_offset(entry));
+		entry = make_readable_migration_entry_from_page(softleaf_to_page(entry),
+								softleaf_to_flags(entry));
 		pmd = swp_entry_to_pmd(entry);
 		if (pmd_swp_soft_dirty(*src_pmd))
 			pmd = pmd_swp_mksoft_dirty(pmd);
@@ -2524,9 +2525,13 @@ static void change_non_present_huge_pmd(struct mm_struct *mm,
 		 * just be safe and disable write
 		 */
 		if (folio_test_anon(folio))
-			entry = make_readable_exclusive_migration_entry(swp_offset(entry));
+			entry = make_readable_exclusive_migration_entry_from_page(
+						softleaf_to_page(entry),
+						softleaf_to_flags(entry));
 		else
-			entry = make_readable_migration_entry(swp_offset(entry));
+			entry = make_readable_migration_entry_from_page(
+						softleaf_to_page(entry),
+						softleaf_to_flags(entry));
 		newpmd = swp_entry_to_pmd(entry);
 		if (pmd_swp_soft_dirty(*pmd))
 			newpmd = pmd_swp_mksoft_dirty(newpmd);
@@ -3183,14 +3188,14 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 
 		for (i = 0, addr = haddr; i < HPAGE_PMD_NR; i++, addr += PAGE_SIZE) {
 			if (write)
-				swp_entry = make_writable_migration_entry(
-							page_to_pfn(page + i));
+				swp_entry = make_writable_migration_entry_from_page(
+							page + i, 0);
 			else if (anon_exclusive)
-				swp_entry = make_readable_exclusive_migration_entry(
-							page_to_pfn(page + i));
+				swp_entry = make_readable_exclusive_migration_entry_from_page(
+							page + i, 0);
 			else
-				swp_entry = make_readable_migration_entry(
-							page_to_pfn(page + i));
+				swp_entry = make_readable_migration_entry_from_page(
+							page + i, 0);
 			if (young)
 				swp_entry = make_migration_entry_young(swp_entry);
 			if (dirty)
@@ -4890,11 +4895,11 @@ int set_pmd_migration_entry(struct page_vma_mapped_walk *pvmw,
 	if (pmd_dirty(pmdval))
 		folio_mark_dirty(folio);
 	if (pmd_write(pmdval))
-		entry = make_writable_migration_entry(page_to_pfn(page));
+		entry = make_writable_migration_entry_from_page(page, 0);
 	else if (anon_exclusive)
-		entry = make_readable_exclusive_migration_entry(page_to_pfn(page));
+		entry = make_readable_exclusive_migration_entry_from_page(page, 0);
 	else
-		entry = make_readable_migration_entry(page_to_pfn(page));
+		entry = make_readable_migration_entry_from_page(page, 0);
 	if (pmd_young(pmdval))
 		entry = make_migration_entry_young(entry);
 	if (pmd_dirty(pmdval))
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 51273baec9e5..6a5e40d4cfc2 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -4939,8 +4939,9 @@ int copy_hugetlb_page_range(struct mm_struct *dst, struct mm_struct *src,
 				 * COW mappings require pages in both
 				 * parent and child to be set to read.
 				 */
-				softleaf = make_readable_migration_entry(
-							swp_offset(softleaf));
+				softleaf = make_readable_migration_entry_from_page(
+							softleaf_to_page(softleaf),
+							softleaf_to_flags(softleaf));
 				entry = swp_entry_to_pte(softleaf);
 				if (userfaultfd_wp(src_vma) && uffd_wp)
 					entry = pte_swp_mkuffd_wp(entry);
@@ -6491,11 +6492,13 @@ long hugetlb_change_protection(struct vm_area_struct *vma,
 
 			if (softleaf_is_migration_write(entry)) {
 				if (folio_test_anon(folio))
-					entry = make_readable_exclusive_migration_entry(
-								swp_offset(entry));
+					entry = make_readable_exclusive_migration_entry_from_page(
+								softleaf_to_page(entry),
+								softleaf_to_flags(entry));
 				else
-					entry = make_readable_migration_entry(
-								swp_offset(entry));
+					entry = make_readable_migration_entry_from_page(
+								softleaf_to_page(entry),
+								softleaf_to_flags(entry));
 				newpte = swp_entry_to_pte(entry);
 				pages++;
 			}
diff --git a/mm/memory.c b/mm/memory.c
index 2a55edc48a65..16493fbb3adb 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -963,8 +963,9 @@ copy_nonpresent_pte(struct mm_struct *dst_mm, struct mm_struct *src_mm,
 			 * to be set to read. A previously exclusive entry is
 			 * now shared.
 			 */
-			entry = make_readable_migration_entry(
-							swp_offset(entry));
+			entry = make_readable_migration_entry_from_page(
+							softleaf_to_page(entry),
+							softleaf_to_flags(entry));
 			pte = softleaf_to_pte(entry);
 			if (pte_swp_soft_dirty(orig_pte))
 				pte = pte_swp_mksoft_dirty(pte);
diff --git a/mm/migrate_device.c b/mm/migrate_device.c
index a2baaa2a81f9..c876526ac6a3 100644
--- a/mm/migrate_device.c
+++ b/mm/migrate_device.c
@@ -432,14 +432,14 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
 
 			/* Setup special migration page table entry */
 			if (mpfn & MIGRATE_PFN_WRITE)
-				entry = make_writable_migration_entry(
-							page_to_pfn(page));
+				entry = make_writable_migration_entry_from_page(
+							page, 0);
 			else if (anon_exclusive)
-				entry = make_readable_exclusive_migration_entry(
-							page_to_pfn(page));
+				entry = make_readable_exclusive_migration_entry_from_page(
+							page, 0);
 			else
-				entry = make_readable_migration_entry(
-							page_to_pfn(page));
+				entry = make_readable_migration_entry_from_page(
+							page, 0);
 			if (pte_present(pte)) {
 				if (pte_young(pte))
 					entry = make_migration_entry_young(entry);
diff --git a/mm/mprotect.c b/mm/mprotect.c
index 283889e4f1ce..adfe1b7a4a19 100644
--- a/mm/mprotect.c
+++ b/mm/mprotect.c
@@ -328,10 +328,14 @@ static long change_pte_range(struct mmu_gather *tlb,
 				 * just be safe and disable write
 				 */
 				if (folio_test_anon(folio))
-					entry = make_readable_exclusive_migration_entry(
-							     swp_offset(entry));
+					entry = make_readable_exclusive_migration_entry_from_page(
+							softleaf_to_page(entry),
+							softleaf_to_flags(entry));
 				else
-					entry = make_readable_migration_entry(swp_offset(entry));
+					entry = make_readable_migration_entry_from_page(
+							softleaf_to_page(entry),
+							softleaf_to_flags(entry));
+
 				newpte = swp_entry_to_pte(entry);
 				if (pte_swp_soft_dirty(oldpte))
 					newpte = pte_swp_mksoft_dirty(newpte);
diff --git a/mm/rmap.c b/mm/rmap.c
index 79a2478b4aa9..6a63333f8722 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -2539,14 +2539,14 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
 			 * pte is removed and then restart fault handling.
 			 */
 			if (writable)
-				entry = make_writable_migration_entry(
-							page_to_pfn(subpage));
+				entry = make_writable_migration_entry_from_page(
+							subpage, 0);
 			else if (anon_exclusive)
-				entry = make_readable_exclusive_migration_entry(
-							page_to_pfn(subpage));
+				entry = make_readable_exclusive_migration_entry_from_page(
+							subpage, 0);
 			else
-				entry = make_readable_migration_entry(
-							page_to_pfn(subpage));
+				entry = make_readable_migration_entry_from_page(
+							subpage, 0);
 			if (likely(pte_present(pteval))) {
 				if (pte_young(pteval))
 					entry = make_migration_entry_young(entry);
-- 
2.34.1

