Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63F1ED1489F
	for <intel-xe@archiver.kernel.org>; Thu,  8 Jan 2026 05:38:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FF1E10E68F;
	Thu,  8 Jan 2026 05:38:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="RefM680s";
	dkim-atps=neutral
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012069.outbound.protection.outlook.com [52.101.48.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F26C010E68F
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Jan 2026 05:38:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XSO3VDBUnGKcwzUUMISDUCu3vUrIpmewL9l4ohOS+2bSprr962/hNneQta9Lv2YSHHOqyKd7B7s+eUvtHdn13D7hf+IpZizD0aKvqnMiX+v+zAt60YPb/biEFKdTtPl9UpIv+pQamZZzeHZ6jtZYx+DBmgho6+ynvaLlN+QERQJ16o6kMIXIhFsRZOpC/RN3GJrsuG+DK2bEuiFEAlP+DyBRXzRlsJPN1h0s5m32VJlxBzuOp2VxrdqpyLi3+QBc/ylrSNYu90dYnVhA9r7wv2xiHGGaH2rABh7p7I7K+WNig8A3HcX4WkiCtVnDXn22s8zzy+sbaDRpJhjaXkwGIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EijhbkwoWflkBd1JtjlUZeAmfp2Jg31nhxyHaejtBe0=;
 b=Or56ktcjKHOc9hNj2oB1idsMcE4DXi/IgnzmsI2wk0/jVyiznjP0xu+EWyXc7GIe5Hy8JBz+ioRKsSsYauqQwVI0SVdgq6b+DXuMR6PMeqCfxxFA7sHHOm+dS1zOJoUplRruQeoDKjKl8YOADdxT6Mq6AMrPW0WVtYWf2K4wJh0YMnpwwhyKSPFRiIahQsKIh7ngi7cah/DcRxAwGW6J9pCTVvebh6ZZ0bUSMEH1mQ6pKuZ27w6aoKqC2/5pC2rHcDJzN7Lhygu13d7wb2OsFIcH9AnM9x+DrWf/4++QkEDF+/P2bR9C9MSirUWqwMEKXpVnjnI02QQfs2I72Oa5/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EijhbkwoWflkBd1JtjlUZeAmfp2Jg31nhxyHaejtBe0=;
 b=RefM680sS5AE5DXW0FbhPQJNKHDo08u1kp0AEJ0Ab5yjqYbUF9ZWxNgrkj+N91Hbr40z7gG1Lyl1H7/RdN96hCdtIRPN4BbDmNxXUVPjMm6iI6hqeJfh3RzBhS1lQ0npYp7Ht4vnjiYhIs3f2Z2gLemZgAmyNQH3aZuGQZ8N+lw7+gQx+4BwAl6mcRNzPk36AR3K051Urzsja2ZoytQHiTyoBKB6okw8j96sx15yDcjLsERpLwDAF/estfQGE35owWCNBIcSosk5sSJTHATHeodN/61DCq77qJDooB6UAIiPEHyYykMlultUgd+YFb7RXXsWWH+rMkX7IVZRV7ldIQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB9072.namprd12.prod.outlook.com (2603:10b6:8:be::6) by
 LV8PR12MB9451.namprd12.prod.outlook.com (2603:10b6:408:206::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.3; Thu, 8 Jan
 2026 05:38:26 +0000
Received: from DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1]) by DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1%5]) with mapi id 15.20.9499.002; Thu, 8 Jan 2026
 05:38:26 +0000
From: Jordan Niethe <jniethe@nvidia.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com
Subject: [RESEND v2 08/11] mm: Add helpers to create device private entries
 from struct pages
Date: Thu,  8 Jan 2026 16:37:38 +1100
Message-Id: <20260108053741.38802-9-jniethe@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260108053741.38802-1-jniethe@nvidia.com>
References: <20260108053741.38802-1-jniethe@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ2PR07CA0012.namprd07.prod.outlook.com
 (2603:10b6:a03:505::13) To DM4PR12MB9072.namprd12.prod.outlook.com
 (2603:10b6:8:be::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB9072:EE_|LV8PR12MB9451:EE_
X-MS-Office365-Filtering-Correlation-Id: 82d7fc8c-f4a5-4707-d27c-08de4e782527
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?f3zcP9ckIQ5WN9Dq0TwoBwoBLGwKUGCjO2bZY9EOVMVUN7Re3SULjQaGco6y?=
 =?us-ascii?Q?0IDeBIVkFiirrLjzuDYxuCsxDSZNtsFV6jmfdJOXkld2I74sLKG2VzPJYhc1?=
 =?us-ascii?Q?dyF/7lkDdPghY47jlLftBPizKvRjkW9h6BTag5Dw33Xh0WFEKdw6F2f0vd0k?=
 =?us-ascii?Q?Xh+uBABq672D4DtLXVykZUm1hYmiw/Oq/caBD/fMqHjlj1SFLcjGLZOMU9EO?=
 =?us-ascii?Q?i/l8iokhfXGPrP8Y1d1qmbxG6Cr99nWH4OaqFRDn66rj4QusO00yL1o71r3g?=
 =?us-ascii?Q?0vmoGMrRaqWQBDHzAqhb2C2tK28Oxj31FLziFdS07Zdc19/feY/8ldVtb469?=
 =?us-ascii?Q?4ovfYZFVn13zOjYWW3Pfd3M1gutlAzFLnSSx1pPK65eCkXnuwR2AKMmyZtjH?=
 =?us-ascii?Q?enxQ7FV2y/nfbTPIRnKxL5LiyJIdNd9MXvC2/I8M5a1oUOs7S5SUJb8NP/i0?=
 =?us-ascii?Q?ga4feM2eHgVI9inhebKlbAZlN47Wyu8vzTBIlEDfS1w5sxSQ34kYIjwt96uG?=
 =?us-ascii?Q?e1+LqtuKgyP0ompz8KDCa45je4mjTxMy2C13FgPQ3jCM0GsQFGnx+fUCkSnb?=
 =?us-ascii?Q?2p9COBNWBYrkFBrK+Zx8B4gMTAIjsU8MkpxVG7wJYUjZRmCVzlAWM9CgFW+W?=
 =?us-ascii?Q?9W99IPJFW2iD8N5wKu5eiCWTV9lcuOffsr1v9We1aLpWs4xiVrvcyeiSt2tI?=
 =?us-ascii?Q?zGsvIQsKWEWBYeo3HQiFAZS9HipBv0iX53qA8OogUPCTplK/qj7zjA+75ejA?=
 =?us-ascii?Q?EsdVu3JvXtYFzamu3z+jCvvAZcNA8lyCUhYb0SyyTcmjsQo6KGVe0HrujNPu?=
 =?us-ascii?Q?iDVZi5zNJ4fg4uYR0oD8je8U/HDi5H91CsDu3VerIr+v1BnvZAw0drC0bt+j?=
 =?us-ascii?Q?qBA7RxJ3J7tLX1quXmVv2pRZ9Qp8+PPH4h6HSC6rYP+cTJefa1YtL4+Ey400?=
 =?us-ascii?Q?TKz3JnXOHCwQ11H3ON/m+Yl2msB71g09NUJlyZrGhsdS4g+Jk2pTfArI3yuA?=
 =?us-ascii?Q?oVacsCvrgRP/qk8mBRG4bNCP+2eFxm44L3qskCKeCMdabRKr2K1LBqZ2TRBz?=
 =?us-ascii?Q?0vmipudt3qDOoVP/dgUhDGaRHttNLj86QwFf0m+F+oIKWGgztfeLNdLYfkwR?=
 =?us-ascii?Q?VX7r0TVUjx7Fhk8in3lLoWVSPmUHeFuyTic9SYSIaBS7ntjAERtk1zl3wOAP?=
 =?us-ascii?Q?0hsSVTDiXXEhQd2QHF3QiAru+LDJ/wXwqKKmtZ2Kx5g9GZ9U3hk0SLwR/IVM?=
 =?us-ascii?Q?hnPNF//9hD+LE6dhbMflRCfizGXikC1CSZn85bu1XYf4SqcaXxqkrM1qK/2J?=
 =?us-ascii?Q?Q7Hd6FpZapyB0j7MRx7zVPo7Pk11lHk+nqCARh3iotQWyD5yPec3F1s1+fBy?=
 =?us-ascii?Q?6N16TMOhq2M9BZr0G5fKBpZ5hZmkbM/6Tq5q7Jmz8X+gRCaXJXHo9/4AaGim?=
 =?us-ascii?Q?hE6SpXMoEyqkYH3Lh16LNXcfGM/h1vW9?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB9072.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HQtI05I73N5vqi3cOS56xP2EQXsbn4UHeJZsSL7XvXhqEThI9C5kWOTdNcS8?=
 =?us-ascii?Q?7blGV2naFAShQFBSz9t+97xS6e5YIOf4FNYbJwwDdTiaDFxQxZrkSqvlgMgX?=
 =?us-ascii?Q?dWg5C0kZbRBO9UBlITCg9nYlMdUd/RdRCPSLa7oDGTFxpYCwDH0AjajYBKfJ?=
 =?us-ascii?Q?rfXKR+R4Lowu3Jj7ufUgu431tD8oSIa/kL40yE1MyPKul0rCHj6pCL23qo+d?=
 =?us-ascii?Q?yUw1Y9fzC/l4jKJVzB3yAfVxhPtrNO5pyih8Du8l7MsFnBvgcDKOh2Sulgnz?=
 =?us-ascii?Q?tR8QRLN9Pn2Q134+UHq90L9OCxuNEgmetMiPk2B2PsB3ynSV68hRJxA1PnVu?=
 =?us-ascii?Q?aLUHmIGKN9HQ43ByO6LoH/mnHezQT98wLHttANoKXe/kNPZbYJtG+18FCskf?=
 =?us-ascii?Q?zhKTJBLXw5kGY5metITWSMgySafr585zzZS2TIwXEHZeeEnvtp0ed3S0Im/J?=
 =?us-ascii?Q?HSLqNew1U+5AnU+ZtMRonAgxmoBhRh9+wy1amQ4EISbij8j8uOSISgVCJe1M?=
 =?us-ascii?Q?9Ysqrrvlcf4MAaxGnJmNX1MScn4Jh2CxRbxO77BURA/f4ja2gCCRfnPPQld9?=
 =?us-ascii?Q?hn/LEtFm5flG+qRw3D4sIk5QyA9XPl1E1TyWEXjdsMkouyHU8TqciN8S4/1a?=
 =?us-ascii?Q?wmylAc3wRr2gICjgR8LYGn7eY1J+Z89TkBxGZ88nCrmEu3pd4qedfyJQLot7?=
 =?us-ascii?Q?vgMXFvkxYIjRx/pYBsXnKYx+w01HkA1kHQYjiq1OCUQYmTSCwgjZQGrkKTnh?=
 =?us-ascii?Q?/TMMNBahZk/j7QDAG6l6T3hFxpYYFukz653ckhxlm4bDfiKnG6F+lB3pgcF8?=
 =?us-ascii?Q?FFtVZyfBDX6OjP3DYGRmFN+leCD5edTgK8nWtO9blnZs0AHk4RIJp9VnGTG/?=
 =?us-ascii?Q?/xZ7PDtjguSYgqaKo5mcL01tT8P26dGH3rrIc9LOG8PuoXVlLmTrKsOUzemF?=
 =?us-ascii?Q?R2dXC/RrhmA6meurJWwfHcUfTkOTbs+jxujSkGI3r4Dm+hSKOxfGLJalBXvh?=
 =?us-ascii?Q?QjcV/8R8WbutTG1/NNvzMjVxjJyIf8TlHwnrNBmbrujFByk+X3URtp6pcx9l?=
 =?us-ascii?Q?keOe5qyRopo+KW4//hUSRLf4z91RmwkncSRYwm+laZa21caNW/+ZRo6HPnF7?=
 =?us-ascii?Q?R3EzTOKGIrJqgYlFQIiREtIS4TEEmKzcdSYLZSfHORQ+4r8pfFyqMbZHcwS+?=
 =?us-ascii?Q?CjQJqsQW1i1QbICpgNL3aJmm4GB6meLMfWPEmhCHRHThOiU1DO3ArqRJhKCB?=
 =?us-ascii?Q?Z5A+jCDMgE6IKZbIz2huDC3fFOdI61SewTD4TnFdt4Z5GBpzxzM3cT8LPthz?=
 =?us-ascii?Q?7v+lYfNps/FxeSlLttNen4nhcXM+txrcqpVNgDdJDHvm+0E6SqUdYByQLnSZ?=
 =?us-ascii?Q?9CWK5YrnFyP9PGxQ/lH/DwcFNYY3j9VveWZIPcFf6eynpS6B3lhMcVU9Pqgc?=
 =?us-ascii?Q?kz0lPwf555OG7fmIYVpp9xelmrFhgr3vN7OpRO2BVIZdGlb2kGFbtMRie8xf?=
 =?us-ascii?Q?Wf6veWooG1e7bH364vfhUDzT2bPfWROkpyggg1FtfHJHhspjZ1wasc8zUi7f?=
 =?us-ascii?Q?p4ii7albFOIvMxp6hC3fHQFz9hmry+u6w3l/qohdg3xMTW+3H/tbxd8x3aAW?=
 =?us-ascii?Q?aY7IorbRuMDYHCAk4DwYty2c5IUbcPtbikmckg+AwP06U/FHDEvu+MRRV1gt?=
 =?us-ascii?Q?RcufW0Csf+apOtpXLELI/B6ot/+QnIiR+9R0iqny4oAquGCokZydLfoMMQfW?=
 =?us-ascii?Q?h0bQXLWbww=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82d7fc8c-f4a5-4707-d27c-08de4e782527
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB9072.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 05:38:26.0423 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JssYXnEHa0yfyhi7k+TI7uqnYD4ehas3cI1f1gi0PS89dAVl/oRC2SJxVMefVMD7/651lKM4jhnhUTHub3Um1g==
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

To create a new device private entry for a given struct page, that page
is first converted to its pfn, before passing the pfn to
make_writable_device_private_entry() (and friends).

A future change will remove device private pages from the physical
address space. This will mean that device private pages no longer have a
pfn and must be handled separately.

Prepare for this with a new set of helpers:

- make_readable_device_private_entry_from_page()
- make_writable_device_private_entry_from_page()

These helpers take a struct page as parameter instead of a pfn. This
will allow more flexibility for handling the swap offset field
differently for device private pages.

Signed-off-by: Jordan Niethe <jniethe@nvidia.com>
---
v1:
  - New to series
v2:
  - Add flag param
---
 include/linux/swapops.h | 24 ++++++++++++++++++++++++
 mm/huge_memory.c        | 14 ++++++--------
 mm/migrate.c            |  6 ++----
 mm/migrate_device.c     | 12 ++++--------
 4 files changed, 36 insertions(+), 20 deletions(-)

diff --git a/include/linux/swapops.h b/include/linux/swapops.h
index bae76d3831fb..f7d85a451a2b 100644
--- a/include/linux/swapops.h
+++ b/include/linux/swapops.h
@@ -138,11 +138,23 @@ static inline swp_entry_t make_readable_device_private_entry(pgoff_t offset)
 	return swp_entry(SWP_DEVICE_READ, offset);
 }
 
+static inline swp_entry_t make_readable_device_private_entry_from_page(struct page *page,
+								       pgoff_t flags)
+{
+	return swp_entry(SWP_DEVICE_READ, page_to_pfn(page) | flags);
+}
+
 static inline swp_entry_t make_writable_device_private_entry(pgoff_t offset)
 {
 	return swp_entry(SWP_DEVICE_WRITE, offset);
 }
 
+static inline swp_entry_t make_writable_device_private_entry_from_page(struct page *page,
+								       pgoff_t flags)
+{
+	return swp_entry(SWP_DEVICE_WRITE, page_to_pfn(page) | flags);
+}
+
 static inline swp_entry_t make_device_exclusive_entry(pgoff_t offset)
 {
 	return swp_entry(SWP_DEVICE_EXCLUSIVE, offset);
@@ -191,11 +203,23 @@ static inline swp_entry_t make_readable_device_private_entry(pgoff_t offset)
 	return swp_entry(0, 0);
 }
 
+static inline swp_entry_t make_readable_device_private_entry_from_page(struct page *page,
+								       pgoff_t flags)
+{
+	return swp_entry(0, 0);
+}
+
 static inline swp_entry_t make_writable_device_private_entry(pgoff_t offset)
 {
 	return swp_entry(0, 0);
 }
 
+static inline swp_entry_t make_writable_device_private_entry_from_page(struct page *page,
+								       pgoff_t flags)
+{
+	return swp_entry(0, 0);
+}
+
 static inline swp_entry_t make_device_exclusive_entry(pgoff_t offset)
 {
 	return swp_entry(0, 0);
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index e3a448cdb34d..03f1f13bb24c 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -3219,11 +3219,11 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 			 * is false.
 			 */
 			if (write)
-				swp_entry = make_writable_device_private_entry(
-							page_to_pfn(page + i));
+				swp_entry = make_writable_device_private_entry_from_page(
+							page + i, 0);
 			else
-				swp_entry = make_readable_device_private_entry(
-							page_to_pfn(page + i));
+				swp_entry = make_readable_device_private_entry_from_page(
+							page + i, 0);
 			/*
 			 * Young and dirty bits are not progated via swp_entry
 			 */
@@ -4950,11 +4950,9 @@ void remove_migration_pmd(struct page_vma_mapped_walk *pvmw, struct page *new)
 		swp_entry_t entry;
 
 		if (pmd_write(pmde))
-			entry = make_writable_device_private_entry(
-							page_to_pfn(new));
+			entry = make_writable_device_private_entry_from_page(new, 0);
 		else
-			entry = make_readable_device_private_entry(
-							page_to_pfn(new));
+			entry = make_readable_device_private_entry_from_page(new, 0);
 		pmde = swp_entry_to_pmd(entry);
 
 		if (pmd_swp_soft_dirty(*pvmw->pmd))
diff --git a/mm/migrate.c b/mm/migrate.c
index 5169f9717f60..6cc6c989ab6b 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -399,11 +399,9 @@ static bool remove_migration_pte(struct folio *folio,
 
 		if (unlikely(is_device_private_page(new))) {
 			if (pte_write(pte))
-				entry = make_writable_device_private_entry(
-							page_to_pfn(new));
+				entry = make_writable_device_private_entry_from_page(new, 0);
 			else
-				entry = make_readable_device_private_entry(
-							page_to_pfn(new));
+				entry = make_readable_device_private_entry_from_page(new, 0);
 			pte = softleaf_to_pte(entry);
 			if (pte_swp_soft_dirty(old_pte))
 				pte = pte_swp_mksoft_dirty(pte);
diff --git a/mm/migrate_device.c b/mm/migrate_device.c
index c876526ac6a3..0ca6f78df0e2 100644
--- a/mm/migrate_device.c
+++ b/mm/migrate_device.c
@@ -836,11 +836,9 @@ static int migrate_vma_insert_huge_pmd_page(struct migrate_vma *migrate,
 		swp_entry_t swp_entry;
 
 		if (vma->vm_flags & VM_WRITE)
-			swp_entry = make_writable_device_private_entry(
-						page_to_pfn(page));
+			swp_entry = make_writable_device_private_entry_from_page(page, 0);
 		else
-			swp_entry = make_readable_device_private_entry(
-						page_to_pfn(page));
+			swp_entry = make_readable_device_private_entry_from_page(page, 0);
 		entry = swp_entry_to_pmd(swp_entry);
 	} else {
 		if (folio_is_zone_device(folio) &&
@@ -1033,11 +1031,9 @@ static void migrate_vma_insert_page(struct migrate_vma *migrate,
 		swp_entry_t swp_entry;
 
 		if (vma->vm_flags & VM_WRITE)
-			swp_entry = make_writable_device_private_entry(
-						page_to_pfn(page));
+			swp_entry = make_writable_device_private_entry_from_page(page, 0);
 		else
-			swp_entry = make_readable_device_private_entry(
-						page_to_pfn(page));
+			swp_entry = make_readable_device_private_entry_from_page(page, 0);
 		entry = swp_entry_to_pte(swp_entry);
 	} else {
 		if (folio_is_zone_device(folio) &&
-- 
2.34.1

