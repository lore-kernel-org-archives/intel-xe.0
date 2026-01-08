Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51786D148A0
	for <intel-xe@archiver.kernel.org>; Thu,  8 Jan 2026 05:38:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05E3910E27B;
	Thu,  8 Jan 2026 05:38:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="kY+rDO3c";
	dkim-atps=neutral
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012004.outbound.protection.outlook.com [52.101.48.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6E1F10E694
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Jan 2026 05:38:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IWIr848eS9aELfzHcJHKC0v617738T4mDzo2WTSOEuDHKxeAOfdwocPhPenbWQOjggsvjkaOdzWYsu+y0ANej5rJqaQp2lJO/7Bu5rTrbAH+ECuDive8QzZmol7qRWs2o8Os6G11n/FtMHJWAtwAwzi5+GPNcyJ2qYcwuIwVSDRkDP/ujRLzr+TPa3OHIKMw9IobrtnjMy5xhb7rHy//gFveCIOBFYTPF310jBzpN71swudsU6CvxsLYgDgWhla9a+iQCh/mltPCyI1OSvxgbmj7dqocvt96SmBSuYtsZcN2GJj+zO867K3FuYZsDuHocY+VmlqYQ4dL0lcYnq5yhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yOz521J3yjFKdqj1ccDxEWT7+6idlIuUFWZA9NmhEZE=;
 b=siJzbqSfdrp/QwjyNcyh+lgQPlUh2+2dOiDDh9IJbNebZueEIijSO+1nmakK6fLZY4HqUY/UGT1J69uaxTxq2HKwh+aMfsLdnQ3P7taXyujQyn/H3mzwKYd5xVIFX0TbP05AJlbKY/+maZ+AFT/0+wpcgn97ba0H4yNEfuerORnOxQA6atFaBGZltFGAQpIjD26TaO72rZJZUP1VuHVBGbDFHVeydiClZzR/9Ux6xb5MrW+gn9OjGlrXEV0fa32A2l0UzrdDV/F1kyzltqk+FITitxlkXSxLhjUqRf4EmrshjKaSA64akIQSNllI4dp/eYKJg2i4SVWkrUWt0w7rKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yOz521J3yjFKdqj1ccDxEWT7+6idlIuUFWZA9NmhEZE=;
 b=kY+rDO3c1hzcbDClZ+/p9IPTroFzLPkhqihuPXkvMEAqyCYWpbDgqLL1eJUpDeqawhUWvvYn587JY4kOHPmO1v5uT/K4krSUzjMYM1xLzgUQ0vX1rhOQV8m5HPNt0X1Pyn1YqHRHSOkfuLTEmXtAQQZ8QeGrslcwJTMj6jiaZ/4pzN5ciHCbHOLUEhEIi7vmbPWYA2rpU2l1DsGHw2OnSCTFQHaEGitgGATiFrDV+xzUSVEnOsnpmPg2xlcVUfASfFuyYxrOru4MXeyLW52mT22KDgsFIC0poAyNdht0pG/9fRKBenFIWgDkMGDC9/zwRbio7xxNdNy4VeyRDu1OVw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB9072.namprd12.prod.outlook.com (2603:10b6:8:be::6) by
 LV8PR12MB9451.namprd12.prod.outlook.com (2603:10b6:408:206::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.3; Thu, 8 Jan
 2026 05:38:15 +0000
Received: from DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1]) by DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1%5]) with mapi id 15.20.9499.002; Thu, 8 Jan 2026
 05:38:15 +0000
From: Jordan Niethe <jniethe@nvidia.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com
Subject: [RESEND v2 05/11] mm/page_vma_mapped: Add flags to
 page_vma_mapped_walk::pfn to track device private pages
Date: Thu,  8 Jan 2026 16:37:35 +1100
Message-Id: <20260108053741.38802-6-jniethe@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260108053741.38802-1-jniethe@nvidia.com>
References: <20260108053741.38802-1-jniethe@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0146.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::31) To DM4PR12MB9072.namprd12.prod.outlook.com
 (2603:10b6:8:be::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB9072:EE_|LV8PR12MB9451:EE_
X-MS-Office365-Filtering-Correlation-Id: affe21b0-6443-40ac-2203-08de4e781e80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bBvbGUa5E18nVv4PVqOBwXX7aa09q69+AB0HDsNwYgOGqp2wEN1oUWrT/6VI?=
 =?us-ascii?Q?lrSD/dcdkR/FVvE65ZuyTRY7MClZQFNL0ZdbqxTQOgemv+o60RC0uzn4UNug?=
 =?us-ascii?Q?Bd1vLDNtf1mIhIj6rg/GhRP3Passeb9UsiU3i2fF5qPFoACta2vaJPvs3reB?=
 =?us-ascii?Q?LXveNIEaHYWjUWTnL0klcjBSvHZKj8y9hMrK7T44MxUTgHg2A7VZR2uBe8K2?=
 =?us-ascii?Q?snVjixddaAbqCV+zKGbTg++Y8DsNpGBBnQUp02a0YdVdATrPz6WsvsfARMcN?=
 =?us-ascii?Q?Y/gJiOOEVt9HXnq45p1gMXx4IBiLSZKfiI5K4JsngaTPeYmxadDHZvinVBs9?=
 =?us-ascii?Q?TCI3QpbSOpl+pCQWvP30j90BSCx54k3SR2/Eofweg/e6k/sS4lg1dah3V64z?=
 =?us-ascii?Q?S1qsDTUG9Zw4IUqDX4+bOZxbs34KroKpvW3+xmB5GMCMIjSjRN1Uc18Otz43?=
 =?us-ascii?Q?5ELGpC9vZQxSxjiBaRdINa+UWmCaahu9dTC8jYJ3A88UOSpGaVVPnj0WckQb?=
 =?us-ascii?Q?o8ZxKRauvBbBMYCM4NGWnPeyu7v66T7YIjaKq13+eIVqRg57sOg7EMWfA0Ge?=
 =?us-ascii?Q?u/l++VGHlDum5DcnM65ncHdCVnOXdHCSGkM+LxCZ6AXzdXE/xpEfTmNgoXcb?=
 =?us-ascii?Q?ouylInaRA3mQO04uZU29EGxGcBTC+smrwu9b2wO/jbAwADKHV6ma83PkKvcg?=
 =?us-ascii?Q?AKl1qXcyBpUYsr5qNk304g8iAulniQdmno0pyvAh299QowzRQwlrXfpe8AYw?=
 =?us-ascii?Q?oFHW64uRoz3uAGgaSt4XmrCgdbTXRrw5/444pPA+FWnLNe+greY3O0ruNnv+?=
 =?us-ascii?Q?eXYpzXd9DwbwBPBD3d47FE0Zhf0KIBpZQQKy5iq6CxjmVXP8DN+tKb+pfdW3?=
 =?us-ascii?Q?4L79dF3cTyLQEeZg9Hqi8j9hFJdCD4V/aXBjeZSMRnEkUbt/aJ5sdkeXSObO?=
 =?us-ascii?Q?YlCr+ZDHFQBg2r/u/1YAcAIQYe0kNMYaoDuCCE+FL9+ka+k6KwmbsBcGitfe?=
 =?us-ascii?Q?Ckep00v32mPhS68U5AKyjMMCxUnT34k3TBgyWTcE15kyq0JH9ly/lFQztx5v?=
 =?us-ascii?Q?7ToEOyybVf+uIV6wKNc2byGj2u68251fmwXI3j3M7RsHt8jqyjYX7OnxL3S1?=
 =?us-ascii?Q?TLY5ENV1SceWQoLXmf4pKCX5zpXgZHpKLFGDKdgxL5Liqaa2ESIm2MYZfsjc?=
 =?us-ascii?Q?bi+L5id4Kl28q0ERT7n/AxSqSCuYcj3TO2ysI+tVipdm/xa4cbMGCmfTY7jS?=
 =?us-ascii?Q?fx+0jkL7BJeQr9vD31ARFl6kV7BiLSguOR7PGnYh/YaVzWRLdrt0XWLANAV1?=
 =?us-ascii?Q?13sKNI4j05BgfhSmPUocnIotILM5BVfByIpN1H28QRORxDgxZtQBYEtn0jqr?=
 =?us-ascii?Q?o70cpuXu4xPNWKwDE64nuucfvJdE9b8QHlTCoshi2CsjmGCzI1zYvb2X8ZN7?=
 =?us-ascii?Q?GvYOpJPDG3AYk40ZcDSGZiTM8FmE/h0o?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB9072.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?g5UYGFE4CtnWyO1S1j5elwaodijorAiGyiodUJLwn8PXT+wdjMbNKWyWtK+d?=
 =?us-ascii?Q?2uKaNNanoLP8FmdjQPz0lSOp5cNNa1H6+ab7QP+legBOwfWDIWiVcMNSlEB7?=
 =?us-ascii?Q?TelHQ15zGZ+RjvPhwX8X3Dc077f5sfkd02M1+b31lu2bx39H84UX+Zgj82A4?=
 =?us-ascii?Q?Bg9EouxStoVZOhu0dNYx8lDxuHGfRypju/eKePUZpKx53U9obDYi5bU6aBjC?=
 =?us-ascii?Q?IFTWG/m25i76aveoewJWmJF4hNhZg2Ad0o5o09hNyOIgRInyGG9wmkM9jtGV?=
 =?us-ascii?Q?l0ymjPF10wHJJ0B5xxhJCN7DlD2mIJt/qaus/HUyWBPlUWBjj59vjWA2yiUp?=
 =?us-ascii?Q?bNl0FQF9ytn5khOvJDP5/pVEi+/OSIoAUKWYJUzeGxkQj8LS+4weShiY8Lok?=
 =?us-ascii?Q?dxgjLL8evBIHQEwdlzZ6G0fYA9yKF3F3vY9noxdbxhM4a5uxQVyFM2VEfe1R?=
 =?us-ascii?Q?F6HKOdPcrXBe9Jn8v9genya6XhuUm9EKTPA7BXYgjjK568AOCxDMg7jiXPqn?=
 =?us-ascii?Q?QD1C5ldQ4H2qcbecWku0oQzm0x+tR8m9mrVfD8IpY9XMpClxTYdcVqHhxShX?=
 =?us-ascii?Q?+c5T7M5+X7Npj1UXRNKqpzCvZcNHIvATd13/+ZBgC5nrFxd1nQ28BsSgvJ/Z?=
 =?us-ascii?Q?Fsk8Xz9fIaSx2Luz7IUrziM2QmChdmnuz4GQIfYvn73LaSgMVgPzPCWVh8uK?=
 =?us-ascii?Q?jtAsWOtaDFcidkynIcFLsVgbVsJeP10IHdzJVEFn1I1yl8liuRVHY5yaJXyU?=
 =?us-ascii?Q?8jToqHYwj1XBuSQqx4Eb8c8k6twWjev7i2ffgQdp2V44F5kcKeoVu2XkYM4d?=
 =?us-ascii?Q?u5pFAUdSnit3NRRWcwGnEWJARo1T/NocpeIwh8AaTzyjdRP7BkVoFsFoKLbe?=
 =?us-ascii?Q?DVzNjOUDBCmRhkIqd5ja9Q8EXi906fV28YUVSM63YBPAWISXCKecsj5XAKEu?=
 =?us-ascii?Q?4f7gJPMwWASUQRSxvoK8wHTDW8z8gz3zmU6ARXVQby2/Ed10ru2fvcQ0EQOv?=
 =?us-ascii?Q?E4xD3aO1fhbxdKpyUczs07MGeFmg8Go2TT01PdRILTrJlXIq5PwwfusRiEYQ?=
 =?us-ascii?Q?pnUnGv+Yk8vHNR/lowU8bpLYEA/p6XUQ7Dry47YHlCAMdColf7SrwtEDoRaR?=
 =?us-ascii?Q?ELdzSPSCr/7Q0wcKP76JdmaSznPtQRJPronmhMBiQVA8ffUsEPfRQGZNoM7i?=
 =?us-ascii?Q?MKzencPiHrehQdFA3eo8dyV2SjF+v6uBpfC1ghG9BxbDphD4lDMDbpqCqGPC?=
 =?us-ascii?Q?b6oFcjJbjgg8+CZBdUGW/hi/4Qx4G2ybqifYlJESNkP4bNpWbHK1QxYoHFa3?=
 =?us-ascii?Q?htDPqAAUMgUkR7oCZARyTyL5qZVWtztw+5OOjS+5nUspRSm3WKK0OmsIErNS?=
 =?us-ascii?Q?pqVLw2nKHUDDdXFttFrPkN89JgD6TXdCZ67KEzWeuwVm40aHw5hLDKTT0FOS?=
 =?us-ascii?Q?QkA6URVhUHVJUa5DppJFCBAe0MeqRUpyT10Wkd1Vg+RMI5On3ejjdUxiUm5F?=
 =?us-ascii?Q?mL2mNFf3Vw6MeulrXggyKgpebZJ6sUZ0z1IgzDLuJEB/r0RrOEqnYxxHx3mD?=
 =?us-ascii?Q?H7GzRsUzhLXnH9gGLtmkFG7qVVavN9YDZmhQS+E32LrroD3GUJ2pXlGGNOmE?=
 =?us-ascii?Q?oXSFWtVUUShQOI0lan/fo2v4dBEgDqyrFiyfIQfA7O8LuyBY2jjrfxl2iZdY?=
 =?us-ascii?Q?TLvkOxrRAUgkbsQjRM4Uunb2Dy7YYM+W0qMGQZkvQFtxFNnNuQHzkYRfGRGt?=
 =?us-ascii?Q?tIlM2YlTOA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: affe21b0-6443-40ac-2203-08de4e781e80
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB9072.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 05:38:15.0528 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m8y1FPDLIb9aY+1WsEa0ZGuueO3x8h4wyXNXhpArdUQtV8RBgH14JTenQb6qp5TmCFPlcn11SFnAnLSNe1vv0w==
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
normal PFN and must be handled separately.

Prepare for this by modifying page_vma_mapped_walk::pfn to contain flags
as well as a PFN. Introduce a PVMW_PFN_DEVICE_PRIVATE flag to indicate
that a page_vma_mapped_walk::pfn contains a PFN for a device private
page.

Signed-off-by: Jordan Niethe <jniethe@nvidia.com>
Signed-off-by: Alistair Popple <apopple@nvidia.com>
---
v1:
  - Update for HMM huge page support
v2:
  - Move adding device_private param to check_pmd() until final patch
---
 include/linux/rmap.h | 30 +++++++++++++++++++++++++++++-
 mm/page_vma_mapped.c | 13 +++++++------
 mm/rmap.c            |  4 ++--
 mm/vmscan.c          |  2 +-
 4 files changed, 39 insertions(+), 10 deletions(-)

diff --git a/include/linux/rmap.h b/include/linux/rmap.h
index daa92a58585d..57c63b6a8f65 100644
--- a/include/linux/rmap.h
+++ b/include/linux/rmap.h
@@ -939,9 +939,37 @@ struct page_vma_mapped_walk {
 	unsigned int flags;
 };
 
+/* pfn is a device private offset */
+#define PVMW_PFN_DEVICE_PRIVATE	(1UL << 0)
+#define PVMW_PFN_SHIFT		1
+
+static inline unsigned long page_vma_walk_pfn(unsigned long pfn)
+{
+	return (pfn << PVMW_PFN_SHIFT);
+}
+
+static inline unsigned long folio_page_vma_walk_pfn(const struct folio *folio)
+{
+	if (folio_is_device_private(folio))
+		return page_vma_walk_pfn(folio_pfn(folio)) |
+		       PVMW_PFN_DEVICE_PRIVATE;
+
+	return page_vma_walk_pfn(folio_pfn(folio));
+}
+
+static inline struct page *page_vma_walk_pfn_to_page(unsigned long pvmw_pfn)
+{
+	return pfn_to_page(pvmw_pfn >> PVMW_PFN_SHIFT);
+}
+
+static inline struct folio *page_vma_walk_pfn_to_folio(unsigned long pvmw_pfn)
+{
+	return page_folio(page_vma_walk_pfn_to_page(pvmw_pfn));
+}
+
 #define DEFINE_FOLIO_VMA_WALK(name, _folio, _vma, _address, _flags)	\
 	struct page_vma_mapped_walk name = {				\
-		.pfn = folio_pfn(_folio),				\
+		.pfn = folio_page_vma_walk_pfn(_folio),			\
 		.nr_pages = folio_nr_pages(_folio),			\
 		.pgoff = folio_pgoff(_folio),				\
 		.vma = _vma,						\
diff --git a/mm/page_vma_mapped.c b/mm/page_vma_mapped.c
index b38a1d00c971..96c525785d78 100644
--- a/mm/page_vma_mapped.c
+++ b/mm/page_vma_mapped.c
@@ -129,9 +129,9 @@ static bool check_pte(struct page_vma_mapped_walk *pvmw, unsigned long pte_nr)
 		pfn = softleaf_to_pfn(entry);
 	}
 
-	if ((pfn + pte_nr - 1) < pvmw->pfn)
+	if ((pfn + pte_nr - 1) < (pvmw->pfn >> PVMW_PFN_SHIFT))
 		return false;
-	if (pfn > (pvmw->pfn + pvmw->nr_pages - 1))
+	if (pfn > ((pvmw->pfn >> PVMW_PFN_SHIFT) + pvmw->nr_pages - 1))
 		return false;
 	return true;
 }
@@ -139,9 +139,9 @@ static bool check_pte(struct page_vma_mapped_walk *pvmw, unsigned long pte_nr)
 /* Returns true if the two ranges overlap.  Careful to not overflow. */
 static bool check_pmd(unsigned long pfn, struct page_vma_mapped_walk *pvmw)
 {
-	if ((pfn + HPAGE_PMD_NR - 1) < pvmw->pfn)
+	if ((pfn + HPAGE_PMD_NR - 1) < (pvmw->pfn >> PVMW_PFN_SHIFT))
 		return false;
-	if (pfn > pvmw->pfn + pvmw->nr_pages - 1)
+	if (pfn > (pvmw->pfn >> PVMW_PFN_SHIFT) + pvmw->nr_pages - 1)
 		return false;
 	return true;
 }
@@ -254,7 +254,8 @@ bool page_vma_mapped_walk(struct page_vma_mapped_walk *pvmw)
 				entry = softleaf_from_pmd(pmde);
 
 				if (!softleaf_is_migration(entry) ||
-				    !check_pmd(softleaf_to_pfn(entry), pvmw))
+				    !check_pmd(softleaf_to_pfn(entry),
+					       pvmw))
 					return not_found(pvmw);
 				return true;
 			}
@@ -350,7 +351,7 @@ unsigned long page_mapped_in_vma(const struct page *page,
 {
 	const struct folio *folio = page_folio(page);
 	struct page_vma_mapped_walk pvmw = {
-		.pfn = page_to_pfn(page),
+		.pfn = folio_page_vma_walk_pfn(folio),
 		.nr_pages = 1,
 		.vma = vma,
 		.flags = PVMW_SYNC,
diff --git a/mm/rmap.c b/mm/rmap.c
index f955f02d570e..79a2478b4aa9 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -1112,7 +1112,7 @@ static bool mapping_wrprotect_range_one(struct folio *folio,
 {
 	struct wrprotect_file_state *state = (struct wrprotect_file_state *)arg;
 	struct page_vma_mapped_walk pvmw = {
-		.pfn		= state->pfn,
+		.pfn		= page_vma_walk_pfn(state->pfn),
 		.nr_pages	= state->nr_pages,
 		.pgoff		= state->pgoff,
 		.vma		= vma,
@@ -1190,7 +1190,7 @@ int pfn_mkclean_range(unsigned long pfn, unsigned long nr_pages, pgoff_t pgoff,
 		      struct vm_area_struct *vma)
 {
 	struct page_vma_mapped_walk pvmw = {
-		.pfn		= pfn,
+		.pfn		= page_vma_walk_pfn(pfn),
 		.nr_pages	= nr_pages,
 		.pgoff		= pgoff,
 		.vma		= vma,
diff --git a/mm/vmscan.c b/mm/vmscan.c
index 670fe9fae5ba..be5682d345b5 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -4203,7 +4203,7 @@ bool lru_gen_look_around(struct page_vma_mapped_walk *pvmw)
 	pte_t *pte = pvmw->pte;
 	unsigned long addr = pvmw->address;
 	struct vm_area_struct *vma = pvmw->vma;
-	struct folio *folio = pfn_folio(pvmw->pfn);
+	struct folio *folio = page_vma_walk_pfn_to_folio(pvmw->pfn);
 	struct mem_cgroup *memcg = folio_memcg(folio);
 	struct pglist_data *pgdat = folio_pgdat(folio);
 	struct lruvec *lruvec = mem_cgroup_lruvec(memcg, pgdat);
-- 
2.34.1

