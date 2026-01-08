Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B18FED148A0
	for <intel-xe@archiver.kernel.org>; Thu,  8 Jan 2026 06:01:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7488B10E55D;
	Thu,  8 Jan 2026 06:01:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="T/V2mhKy";
	dkim-atps=neutral
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010033.outbound.protection.outlook.com [52.101.85.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 919CE10E68F
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Jan 2026 06:01:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GQlly+DY7J2o4QesaPkj66m/eNQGGrW8ImDP78eDwfYdrKaSx+9uQibx6NrDZeVpmRe/oHp2gN/AII5NdiQxzr9JQUas7z7n4ZJgERW7LZwzRVb/ZGe6TIlulRGIXiCOKkbmyXTvPiCS4nl+b3g1qdTn3gogVBvv125XLQGCHjwVvFtB4DtoLitUgd4/YfmfEpxCWZp7NvfCWN+HPzw8tGBdZpRRvLynjFjCK2Nrrg6yXVyWwECB0Z1pU6BLl3kVq83IAjg0V8M1X9QPyW6qfkCvg9gT18c7hkOB3OnfotMk4DYFRjSuNJVeyx1KcarRw4H/vP6d85vgcRhFvcvYNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CjJTZFfkzYbROOL6ELKZlRF10FdTxBlQae8eYxb+z80=;
 b=Pyz3X6I0otgdk+iHWjexJ1HURxXmyk7NPtvJWnS07F/W4+EbNLdbb/0sRgHbOWUQhyHiJabOFci49x9uQl9lZaUYULt7d5BUXtqXwoLqta8WRYYuDD1vllhYXMWxymfGm6PqfTIMkR6i36EaBfetcySzrMn5GX+y6onbtJyuAsRmeBl5LI6oJgwpwMTFXVJo8u/W+x9sYf1EFGwmfolX1CwHlbZlGjMn6NGQe+0nMko37Z0uAcQlp2D51WM3HbLWlCDj2UB4jVOTMLRO3a9tPuuXw1UvJBHM/W8jgDuZoDyNHRff3Mhp7TCDa9JzZ3WiiLH15zYq109MbL6O+8fcRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CjJTZFfkzYbROOL6ELKZlRF10FdTxBlQae8eYxb+z80=;
 b=T/V2mhKy4bfBKfjtzwGd/OydV7sNw/SJBywhi9u4BtNOfHjjnfI2icFHXXkCggwzczl+SJ4wHcL/rK4iJxQgiZJ9QWduPn29XWzlqxvKOTp5NjqLuopFNf9++bUktMdS9Und2GC0h19M6StujaWCqjz8zfd2iScexRA83NnmmXQ2zR5M4T/CsXjTP9fXTttw2X9L/tdw38QxJ9QzDjbIuNwQm+IrZqxJV3DH43tj3HfLZ6Ib+im9b6pcuFU89+rbdxuPy/IEwu0aXLMLgD+QMDvk+7b8aikfDPjL3rDKDZ27pKDPXTuBw6m7L8KfA+dFXM4Hv84JfVt1XiAs61Rf6Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB9072.namprd12.prod.outlook.com (2603:10b6:8:be::6) by
 BL3PR12MB6618.namprd12.prod.outlook.com (2603:10b6:208:38d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Thu, 8 Jan
 2026 06:01:32 +0000
Received: from DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1]) by DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1%5]) with mapi id 15.20.9499.002; Thu, 8 Jan 2026
 06:01:32 +0000
From: Jordan Niethe <jniethe@nvidia.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com
Subject: [RESENDv2 v2 07/11] mm: Add a new swap type for migration entries of
 device private pages
Date: Thu,  8 Jan 2026 17:00:58 +1100
Message-Id: <20260108060102.41357-8-jniethe@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260108060102.41357-1-jniethe@nvidia.com>
References: <20260108060102.41357-1-jniethe@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR02CA0025.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::38) To DM4PR12MB9072.namprd12.prod.outlook.com
 (2603:10b6:8:be::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB9072:EE_|BL3PR12MB6618:EE_
X-MS-Office365-Filtering-Correlation-Id: 81ec15d2-ed66-4778-7627-08de4e7b5f20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9TmChZem18I5FXKnjQKLzeIuKwdo4B9oWY32KidAIPZaLVKQkgRoGyjzHHhN?=
 =?us-ascii?Q?oWPf+ViNuLZioenZdXanlh6ITMjdxTf2FsgAcEmQCGe3l9UM3IGqci+AT8Ln?=
 =?us-ascii?Q?z43aM+EJruW7xNYY7743TcfRJn+DMs3BlVGWFsNDr1TiC7I9yLke40EFqec0?=
 =?us-ascii?Q?ee405RZe+Gqfe7oCmCYImaBllRDMcE4QU1zon5wIOGRhgwg1qj7B/RklNmNg?=
 =?us-ascii?Q?YkiymY+Ea9Lv3yeeRYCk6UwmQzBqiDizXrOGYxLdrb4WheVF/l53ultgsbGD?=
 =?us-ascii?Q?OPcTWWLOfCZWTWWZ8TfU9ne4T7MxwybFzzfQrK4UwYt0WYdqRu0IlW4Rqd3Q?=
 =?us-ascii?Q?PQC4ApXvmYXPALeU5THZ4kIR29HO3Z9cyV61C8OTBrITjV4/t5iIRQdQU7Kh?=
 =?us-ascii?Q?5oyiYEAYzl/9WXJrCknSRt79BSc/dN3+t3cHET4A3AGRGdgbM6+BSkoFmORX?=
 =?us-ascii?Q?j6TIrq/fzL9NlkTy+TQnFHyfQaN2p/8YA2jn5uvB9OpNF4+qFhytyOBVjmmM?=
 =?us-ascii?Q?CQeAtE9e671kSsOn1E4OJM1CBIcpYdMy/LXkyf7WBGVZYvePNPJ91NP3pmUO?=
 =?us-ascii?Q?sr+zBtDCcprlDQpOiBgYZ/i5Ryf9mwV0u0dFUFgVj6cJYRhtGm9IDssfWutz?=
 =?us-ascii?Q?B+7Myu1T8w1T9PtwZIEOgP7ft3Q224/+AjsVOjeIcZFIZF7pAkITkXD+EThn?=
 =?us-ascii?Q?t4riL+s0++27WgoDOU2qdjq10nvP6iVaI/kpYuEyDs1C2nLEkOY9DVnGHxlX?=
 =?us-ascii?Q?zk/c2CaARelNCw8ufcDFhlRaMyyG1d24ECLBUfDeYC+Bwos6fOoR/k2S623t?=
 =?us-ascii?Q?8B4YeEPRztwNpQUqX4mU+o7z480RD3RhHt/8XSFnVYUW169fRiuyS6yy1DqN?=
 =?us-ascii?Q?SmpfNuyMXzQbaaVJOL0MJBpjJlVoBj36SnQkDmEXxcPABfeGzQA/G5pCbas8?=
 =?us-ascii?Q?ApZG2nf1pkU4pKMyH8aFjjCfp3s8mMyWCXRLAsrvRTGJHhgzUqmJDhtyygMN?=
 =?us-ascii?Q?ImfuZoZhIPqGXbXbjgbt6tcQkzKfVp8QSOS8fuNG7yIcb3BU/IpNV8sR1orl?=
 =?us-ascii?Q?dZDCHQONpu5/UJslOH/xXT3uT0bWlCc0/fboqdAtl4nb+eSRK9pOejzBZ6Di?=
 =?us-ascii?Q?kC/+8Q5aRg+blKsxgoGb447jqJL63QQANXBc9QBPgaK2tIfCOjii282DGWWn?=
 =?us-ascii?Q?+qO+VcnWJ3Bj1wI4wXkW6ZjLF6CC7HC030SEpL0va4LRKzRhXMjB6xqKBs9l?=
 =?us-ascii?Q?uB5/zCmEI1sw3HO/KkUn3djQ2q02Y1e4YLrzWTBRYqn8CPl74k4bkuck21MA?=
 =?us-ascii?Q?o8aucnnTBojnxm8i3zUugB49jSjrmjTjB210wQWOeGlHTA1GJjA4yeeLNtyP?=
 =?us-ascii?Q?/ZtHFw5D7kbd9xWI31445M8LxuC8oJazhfhEWoCLEmRRgPKd6bdlNpMQz0d0?=
 =?us-ascii?Q?KpcG/HP+RQEM1W9SPCo5GFOAiy51E+UX?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB9072.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OLFAzyb59y9GqlNrbzv7g38u2EQ6ReaG/j+80FSFUJLQ8+3viPC8XYvBhFbX?=
 =?us-ascii?Q?+Ef0qdRm/2w2OjLB2itDNegsRbwGfrVmHUo5TfTGA1TUfE4z8oXBRk8cuXFi?=
 =?us-ascii?Q?52xJvOHW5snR8UrQgJ4OD/QROJCwKcWbyjTRYloZYumweygif6Lj1/ICqqi+?=
 =?us-ascii?Q?w/lqzK5Vzgbas4yGT+jcyEbEVq7102bQ65WhjXn/x2OE39j5PTiRKmf2+xsO?=
 =?us-ascii?Q?vZWKbtjaBCkLqVuDe8hKkZZCZwKztwmymxIluIBA2AqYvJ4o0fE88rlZpbPd?=
 =?us-ascii?Q?oSx3gKgwWYBvUzYCatDwkWYvsHCLswDbmgZgPnhLXT+gKMYi2RI275PDaylc?=
 =?us-ascii?Q?LZS3+nW0ct7KckC1c3gbgfzF/W4Uvyo2xJXF4pdNOhBp0V+7isZiBXy9cB0e?=
 =?us-ascii?Q?kuWp6ZtTYHYcxPpbzMzF2sTYuWn350Hx909GiJ8RcbLOFJq6H46djwEaaCl1?=
 =?us-ascii?Q?aKFig4tNk53Rk7qOypF4zePlAbW1G874IcnZZEa959IYBnlhEtYkZrBGbzOW?=
 =?us-ascii?Q?cqm712eaiu7tyAXoa7IvFGhESLkc1fMaYmj4nRcsaECCJ7V8BBBx4UQbRY17?=
 =?us-ascii?Q?W/D+OMLhaxqUZ01+yep2D3OXTXYlbFejzeh7CIY/dXiPqO0+y0+/g9fx5zkF?=
 =?us-ascii?Q?7pH3V9aTEf/trULJMvG+ffqltQyIxNGgqETgWPMX0+xE/+UztLUYySVsKNkI?=
 =?us-ascii?Q?JP80U8nbGVLWBStpRp93GOdFCB0uPTOBFMGln/ZUeyC3LNx9z5h18EeJwMy/?=
 =?us-ascii?Q?84MPokjDj1WEHeMzdny7tbBrGzY7YvogB3JgISivGQAV7Axaofm4MI6IpHQ4?=
 =?us-ascii?Q?jNI1UA+/RWNV2MnXoTzAyXOlrUeRnKgKy3I9iJKwG1vCzf3PcVQv+SvaVD0p?=
 =?us-ascii?Q?wP2tuJAEakO7u0dBahuVJvpo2O4MWx6KIvMXotcLDEr3p7zYVqOHSOTWbs2Z?=
 =?us-ascii?Q?NmWyx6I8Vy2bpeYFJOzHXi6xwmXlwzAHkvNIyBqDsT5BeyxXzP/NtzAgP6no?=
 =?us-ascii?Q?/e3eSOcMscsEJaU718HAA2hnVE82IBoPyxjC1vikQqd9obMSs9acOwekm3Az?=
 =?us-ascii?Q?xXyGTA40krKFzX21onIKWQGqoLhG1ZkvxD5uuCoMvLWSpcCo55Cvi98uDSwo?=
 =?us-ascii?Q?1KOtaK3lXzd9ud1JB6fhuKOhZtT2utSTsD3QbyheVQvBDxdokPDHD1AHC9dF?=
 =?us-ascii?Q?6OEBm24EIapHArwTi4sXdIyoblgsUsXgi2wNiFTJEGX3G+GLwzf6kDo113fS?=
 =?us-ascii?Q?DUKNa7U3PKLBG6JGOimZN4/AAIJeJ/o8bgWiczPjeAO/DlkleBHOBjFmG4Sr?=
 =?us-ascii?Q?bheZNDeOwpo8bZz+JQ2fEVbRM28+28C1R481DEKajewmScrm8ai5RhtZkEyp?=
 =?us-ascii?Q?hstQoVFRQXMOwhyfsBHZP2Vt5sKGv9ntr8NbssO3IFCtr0FJj271SfSUVeZp?=
 =?us-ascii?Q?NfiH1njkRzQnUL/NNQM0WNv+gZ4rsmwefflzE/RI/uFAZC8mIG+Qal7uc8eT?=
 =?us-ascii?Q?/RShUZq8oNZ/06eWluneyhDR1tYkytGyfHNuwSxpyBhxIEgeqi4NEkoBA15l?=
 =?us-ascii?Q?XvsjzBY8FIQSnRwRF30UtGAGOvTi8rhSI3X2AcvxyTUiiNMqD4cNI2V61fkj?=
 =?us-ascii?Q?5KDf7sOZtQkfLlxfvzYHRq9M8+/HXxsuh3PgGA2YAORjYVB5f8ijki2XKPpA?=
 =?us-ascii?Q?NyCS/9L0ACRX2uB85EaivVysvIPKJktoFCtQ78UfwqAjgxIWdDcdJOsUADwC?=
 =?us-ascii?Q?O8EeZDH5wA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81ec15d2-ed66-4778-7627-08de4e7b5f20
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB9072.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 06:01:32.0025 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F1oM3a6WG3fRkaYlT5GO9pUDFu7UEvc2Stnq42zoSUL4WR9zb6ERpgF36eMFHHav2sGJQzqPQYnq0SupfPDBcw==
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
pfns and must be handled separately.

When migrating a device private page a migration entry is created for
that page - this includes the pfn for that page. Once device private
pages begin using device memory offsets instead of pfns we will need to
be able to determine which kind of value is in the entry so we can
associate it with the correct page.

Introduce new swap types:

  - SWP_MIGRATION_DEVICE_READ
  - SWP_MIGRATION_DEVICE_WRITE
  - SWP_MIGRATION_DEVICE_READ_EXCLUSIVE

These correspond to

  - SWP_MIGRATION_READ
  - SWP_MIGRATION_WRITE
  - SWP_MIGRATION_READ_EXCLUSIVE

except the swap entry contains a device private offset.

The SWP_MIGRATION_DEVICE swap types are treated as specializations of
the SWP_MIGRATION types. That is, the existing helpers such as
is_writable_migration_entry() will still return true for a
SWP_MIGRATION_DEVICE_WRITE entry. Likewise, the
make_*__migration_entry_from_page() helpers will determine create either
a SWP_MIGRATION_DEVICE or a SWP_MIGRATION type as the page requires.

Introduce new helpers such as
is_writable_device_migration_private_entry() to disambiguate between a
SWP_MIGRATION_WRITE and a SWP_MIGRATION_DEVICE_WRITE entry.

Introduce corresponding softleaf types and helpers.

Signed-off-by: Jordan Niethe <jniethe@nvidia.com>
Signed-off-by: Alistair Popple <apopple@nvidia.com>
---
 include/linux/leafops.h | 86 +++++++++++++++++++++++++++++++++++++----
 include/linux/swap.h    |  8 +++-
 include/linux/swapops.h | 79 +++++++++++++++++++++++++++++++++++++
 3 files changed, 164 insertions(+), 9 deletions(-)

diff --git a/include/linux/leafops.h b/include/linux/leafops.h
index 52a1af3eb954..aa1b465e6556 100644
--- a/include/linux/leafops.h
+++ b/include/linux/leafops.h
@@ -28,6 +28,9 @@ enum softleaf_type {
 	SOFTLEAF_DEVICE_PRIVATE_READ,
 	SOFTLEAF_DEVICE_PRIVATE_WRITE,
 	SOFTLEAF_DEVICE_EXCLUSIVE,
+	SOFTLEAF_MIGRATION_DEVICE_READ,
+	SOFTLEAF_MIGRATION_DEVICE_READ_EXCLUSIVE,
+	SOFTLEAF_MIGRATION_DEVICE_WRITE,
 	/* H/W posion types. */
 	SOFTLEAF_HWPOISON,
 	/* Marker types. */
@@ -165,6 +168,12 @@ static inline enum softleaf_type softleaf_type(softleaf_t entry)
 		return SOFTLEAF_DEVICE_PRIVATE_READ;
 	case SWP_DEVICE_EXCLUSIVE:
 		return SOFTLEAF_DEVICE_EXCLUSIVE;
+	case SWP_MIGRATION_DEVICE_READ:
+		return SOFTLEAF_MIGRATION_DEVICE_READ;
+	case SWP_MIGRATION_DEVICE_WRITE:
+		return SOFTLEAF_MIGRATION_DEVICE_WRITE;
+	case SWP_MIGRATION_DEVICE_READ_EXCLUSIVE:
+		return SOFTLEAF_MIGRATION_DEVICE_READ_EXCLUSIVE;
 #endif
 #ifdef CONFIG_MEMORY_FAILURE
 	case SWP_HWPOISON:
@@ -190,16 +199,75 @@ static inline bool softleaf_is_swap(softleaf_t entry)
 	return softleaf_type(entry) == SOFTLEAF_SWAP;
 }
 
+/**
+ * softleaf_is_migration_device_private() - Is this leaf entry a migration
+ * device private entry?
+ * @entry: Leaf entry.
+ *
+ * Returns: true if the leaf entry is a device private entry, otherwise false.
+ */
+static inline bool softleaf_is_migration_device_private(softleaf_t entry)
+{
+	switch (softleaf_type(entry)) {
+	case SOFTLEAF_MIGRATION_DEVICE_READ:
+	case SOFTLEAF_MIGRATION_DEVICE_WRITE:
+	case SOFTLEAF_MIGRATION_DEVICE_READ_EXCLUSIVE:
+		return true;
+	default:
+		return false;
+	}
+}
+
+/**
+ * softleaf_is_migration_device_private_write() - Is this leaf entry a writable
+ * device private migration entry?
+ * @entry: Leaf entry.
+ *
+ * Returns: true if the leaf entry is a writable device private migration entry,
+ * otherwise false.
+ */
+static inline bool softleaf_is_migration_device_private_write(softleaf_t entry)
+{
+	return softleaf_type(entry) == SOFTLEAF_MIGRATION_DEVICE_WRITE;
+}
+
+/**
+ * softleaf_is_migration_device_private_read() - Is this leaf entry a readable
+ * device private migration entry?
+ * @entry: Leaf entry.
+ *
+ * Returns: true if the leaf entry is an readable device private migration
+ * entry, otherwise false.
+ */
+static inline bool softleaf_is_migration_device_private_read(softleaf_t entry)
+{
+	return softleaf_type(entry) == SOFTLEAF_MIGRATION_DEVICE_READ;
+}
+
+/**
+ * softleaf_is_migration_read_exclusive() - Is this leaf entry an exclusive
+ * readable device private migration entry?
+ * @entry: Leaf entry.
+ *
+ * Returns: true if the leaf entry is an exclusive readable device private
+ * migration entry, otherwise false.
+ */
+static inline bool softleaf_is_migration_device_private_read_exclusive(softleaf_t entry)
+{
+	return softleaf_type(entry) == SOFTLEAF_MIGRATION_DEVICE_READ_EXCLUSIVE;
+}
+
 /**
  * softleaf_is_migration_write() - Is this leaf entry a writable migration entry?
  * @entry: Leaf entry.
  *
- * Returns: true if the leaf entry is a writable migration entry, otherwise
- * false.
+ * Returns: true if the leaf entry is a writable migration entry or a writable
+ * device private migration entry, otherwise false.
  */
 static inline bool softleaf_is_migration_write(softleaf_t entry)
 {
-	return softleaf_type(entry) == SOFTLEAF_MIGRATION_WRITE;
+	return softleaf_type(entry) == SOFTLEAF_MIGRATION_WRITE ||
+	       softleaf_is_migration_device_private_write(entry);
 }
 
 /**
@@ -211,7 +279,8 @@ static inline bool softleaf_is_migration_write(softleaf_t entry)
  */
 static inline bool softleaf_is_migration_read(softleaf_t entry)
 {
-	return softleaf_type(entry) == SOFTLEAF_MIGRATION_READ;
+	return softleaf_type(entry) == SOFTLEAF_MIGRATION_READ ||
+	       softleaf_is_migration_device_private_read(entry);
 }
 
 /**
@@ -219,12 +288,13 @@ static inline bool softleaf_is_migration_read(softleaf_t entry)
  * readable migration entry?
  * @entry: Leaf entry.
  *
- * Returns: true if the leaf entry is an exclusive readable migration entry,
- * otherwise false.
+ * Returns: true if the leaf entry is an exclusive readable migration entry or
+ * exclusive readable device private migration entry, otherwise false.
  */
 static inline bool softleaf_is_migration_read_exclusive(softleaf_t entry)
 {
-	return softleaf_type(entry) == SOFTLEAF_MIGRATION_READ_EXCLUSIVE;
+	return softleaf_type(entry) == SOFTLEAF_MIGRATION_READ_EXCLUSIVE ||
+	       softleaf_is_migration_device_private_read_exclusive(entry);
 }
 
 /**
@@ -241,7 +311,7 @@ static inline bool softleaf_is_migration(softleaf_t entry)
 	case SOFTLEAF_MIGRATION_WRITE:
 		return true;
 	default:
-		return false;
+		return softleaf_is_migration_device_private(entry);
 	}
 }
 
diff --git a/include/linux/swap.h b/include/linux/swap.h
index 38ca3df68716..c15e3b3067cd 100644
--- a/include/linux/swap.h
+++ b/include/linux/swap.h
@@ -74,12 +74,18 @@ static inline int current_is_kswapd(void)
  *
  * When a page is mapped by the device for exclusive access we set the CPU page
  * table entries to a special SWP_DEVICE_EXCLUSIVE entry.
+ *
+ * Because device private pages do not use regular PFNs, special migration
+ * entries are also needed.
  */
 #ifdef CONFIG_DEVICE_PRIVATE
-#define SWP_DEVICE_NUM 3
+#define SWP_DEVICE_NUM 6
 #define SWP_DEVICE_WRITE (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM)
 #define SWP_DEVICE_READ (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+1)
 #define SWP_DEVICE_EXCLUSIVE (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+2)
+#define SWP_MIGRATION_DEVICE_READ (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+3)
+#define SWP_MIGRATION_DEVICE_READ_EXCLUSIVE (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+4)
+#define SWP_MIGRATION_DEVICE_WRITE (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+5)
 #else
 #define SWP_DEVICE_NUM 0
 #endif
diff --git a/include/linux/swapops.h b/include/linux/swapops.h
index a9ad997bd5ec..bae76d3831fb 100644
--- a/include/linux/swapops.h
+++ b/include/linux/swapops.h
@@ -148,6 +148,43 @@ static inline swp_entry_t make_device_exclusive_entry(pgoff_t offset)
 	return swp_entry(SWP_DEVICE_EXCLUSIVE, offset);
 }
 
+static inline swp_entry_t make_readable_migration_device_private_entry(pgoff_t offset)
+{
+	return swp_entry(SWP_MIGRATION_DEVICE_READ, offset);
+}
+
+static inline swp_entry_t make_writable_migration_device_private_entry(pgoff_t offset)
+{
+	return swp_entry(SWP_MIGRATION_DEVICE_WRITE, offset);
+}
+
+static inline bool is_device_private_migration_entry(swp_entry_t entry)
+{
+	return unlikely(swp_type(entry) == SWP_MIGRATION_DEVICE_READ ||
+			swp_type(entry) == SWP_MIGRATION_DEVICE_READ_EXCLUSIVE ||
+			swp_type(entry) == SWP_MIGRATION_DEVICE_WRITE);
+}
+
+static inline bool is_readable_device_migration_private_entry(swp_entry_t entry)
+{
+	return unlikely(swp_type(entry) == SWP_MIGRATION_DEVICE_READ);
+}
+
+static inline bool is_writable_device_migration_private_entry(swp_entry_t entry)
+{
+	return unlikely(swp_type(entry) == SWP_MIGRATION_DEVICE_WRITE);
+}
+
+static inline swp_entry_t make_readable_exclusive_migration_device_private_entry(pgoff_t offset)
+{
+	return swp_entry(SWP_MIGRATION_DEVICE_READ_EXCLUSIVE, offset);
+}
+
+static inline bool is_readable_exclusive_device_private_migration_entry(swp_entry_t entry)
+{
+	return swp_type(entry) == SWP_MIGRATION_DEVICE_READ_EXCLUSIVE;
+}
+
 #else /* CONFIG_DEVICE_PRIVATE */
 static inline swp_entry_t make_readable_device_private_entry(pgoff_t offset)
 {
@@ -164,6 +201,36 @@ static inline swp_entry_t make_device_exclusive_entry(pgoff_t offset)
 	return swp_entry(0, 0);
 }
 
+static inline swp_entry_t make_readable_migration_device_private_entry(pgoff_t offset)
+{
+	return swp_entry(0, 0);
+}
+
+static inline swp_entry_t make_writable_migration_device_private_entry(pgoff_t offset)
+{
+	return swp_entry(0, 0);
+}
+
+static inline bool is_device_private_migration_entry(swp_entry_t entry)
+{
+	return false;
+}
+
+static inline bool is_writable_device_migration_private_entry(swp_entry_t entry)
+{
+	return false;
+}
+
+static inline swp_entry_t make_readable_exclusive_migration_device_private_entry(pgoff_t offset)
+{
+	return swp_entry(0, 0);
+}
+
+static inline bool is_readable_exclusive_device_private_migration_entry(swp_entry_t entry)
+{
+	return false;
+}
+
 #endif /* CONFIG_DEVICE_PRIVATE */
 
 #ifdef CONFIG_MIGRATION
@@ -175,6 +242,10 @@ static inline swp_entry_t make_readable_migration_entry(pgoff_t offset)
 
 static inline swp_entry_t make_readable_migration_entry_from_page(struct page *page, pgoff_t flags)
 {
+	if (is_device_private_page(page))
+		return make_readable_migration_device_private_entry(
+				page_to_pfn(page) | flags);
+
 	return swp_entry(SWP_MIGRATION_READ, page_to_pfn(page) | flags);
 }
 
@@ -186,6 +257,10 @@ static inline swp_entry_t make_readable_exclusive_migration_entry(pgoff_t offset
 static inline swp_entry_t make_readable_exclusive_migration_entry_from_page(struct page *page,
 									    pgoff_t flags)
 {
+	if (is_device_private_page(page))
+		return make_readable_exclusive_migration_device_private_entry(
+				page_to_pfn(page) | flags);
+
 	return swp_entry(SWP_MIGRATION_READ_EXCLUSIVE, page_to_pfn(page) | flags);
 }
 
@@ -197,6 +272,10 @@ static inline swp_entry_t make_writable_migration_entry(pgoff_t offset)
 static inline swp_entry_t make_writable_migration_entry_from_page(struct page *page,
 								  pgoff_t flags)
 {
+	if (is_device_private_page(page))
+		return make_writable_migration_device_private_entry(
+				page_to_pfn(page) | flags);
+
 	return swp_entry(SWP_MIGRATION_WRITE, page_to_pfn(page) | flags);
 }
 
-- 
2.34.1

