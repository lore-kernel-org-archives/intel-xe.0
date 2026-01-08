Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FB24D1489F
	for <intel-xe@archiver.kernel.org>; Thu,  8 Jan 2026 05:38:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0018910E691;
	Thu,  8 Jan 2026 05:38:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="kaT8hgYy";
	dkim-atps=neutral
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012026.outbound.protection.outlook.com [52.101.48.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A86F10E691
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Jan 2026 05:38:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SRLJB4TsXNIxs5hb/7H4ZrublsSPIsPAD/BPN7eicUq7CFjcp2uWyrhwc6A1mq9xXA9N8mvoeptqOngssa+Vc+R4d2sHkCGlnfriWZdIE9/C0XOseUK2bXd+1Ji6md+jD91nRi0qEFmnLKt1aKtwq/3iFmZKdXx2oDUXwE2T9E7ZtnOy8w40uYoSET+p0DGoF7BoWU+yDF9MdVZ7KLKDv5cpmnmy37sheWsO+uZ6CjVs/k7KkeDg+NCufKzr8cKre/XVegKOaglWWEs58JFGbWAZy677lIk4kVZMQ3S6RuXYP2R/CcXLmbOavhvJxMaIDAfAbd7IXtXs2SESt66Mxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PL+vyolDq0l2YwEfxUb+13CaI5m2g8j8/p0yz5mRA5g=;
 b=RDPovCruzOLfQ3yGs3OUUTjxSF+OmVJAMbWbc4InBZ9YAdjqL5uy1/+qi69N3xZW+6/t+M8CMKs+nl993D8Ph8YZmRQr0N/gTxr9l9Erx8eJq8Z3iAVmQ/u8uJZSZ87tVM8frl5w/1BG2zIlfA3WzcwMOriG98vNPZTEeACK4jpkOxE0HM5R5Q2PM5vsCkgxjUwVSuzJThNDEATZkLpXTjnDDM+tAC3ZgrFfduXJv+sE+O8D1ZOdTw/TdpH0b79HdhWyHE/j9LcwlPRRWNr3+5kS/RxaO8KUKbobFQ0tcGeA+/ilJgkL+ZaEl5pDV4icqC1w9y8/AxmVGY7HEAv0og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PL+vyolDq0l2YwEfxUb+13CaI5m2g8j8/p0yz5mRA5g=;
 b=kaT8hgYyf/jS5vGhtMI+J2MkAZkXojcP2738s8BuD2VYM3gJXO2aVdRG0iSs0qM8Wm4tj1S2LQmjfYS4VTuxjnUgGrINo9r+aO6ilChrHirUeqQJc+0/jl8EX6gmM9/7iHE7OUEMvFm370lVLeGNNb1g8We979NXsIvFji4rByHEgNiFzDWOsyVR3LXg4P1DTh7angXacXtE4JEgq/2ZsJ2c4Tv+vI6Mh0iWxDYCndM80tssG+/n1+pjzFj09BoJ6eeAS4AVsZWhLaAEiheUeM80xj1/CRVbr7ydGZpa90wF4tG+KgTCa8J5YY9mcLQ08BwLkJvXmKV5yUl5AvbCaA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB9072.namprd12.prod.outlook.com (2603:10b6:8:be::6) by
 LV8PR12MB9451.namprd12.prod.outlook.com (2603:10b6:408:206::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.3; Thu, 8 Jan
 2026 05:38:18 +0000
Received: from DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1]) by DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1%5]) with mapi id 15.20.9499.002; Thu, 8 Jan 2026
 05:38:18 +0000
From: Jordan Niethe <jniethe@nvidia.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com
Subject: [RESEND v2 06/11] mm: Add helpers to create migration entries from
 struct pages
Date: Thu,  8 Jan 2026 16:37:36 +1100
Message-Id: <20260108053741.38802-7-jniethe@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260108053741.38802-1-jniethe@nvidia.com>
References: <20260108053741.38802-1-jniethe@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR11CA0072.namprd11.prod.outlook.com
 (2603:10b6:a03:80::49) To DM4PR12MB9072.namprd12.prod.outlook.com
 (2603:10b6:8:be::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB9072:EE_|LV8PR12MB9451:EE_
X-MS-Office365-Filtering-Correlation-Id: e82a552b-edcd-4274-faff-08de4e7820ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8EW4gUKfqTTYmjF5LkPzV1TZG0FYRP6tzIkSXA62r6YudQdkiYgGjqzJVz2/?=
 =?us-ascii?Q?nXqhXgk+MAP+8LPMHz1m/KarH5jneh7FGZQYAzZD0AInm7/m0Y90lk9xikfK?=
 =?us-ascii?Q?h/xTs8hbPgDwdOGhJFX7epa/Vw55walXLyASwSW4A0TFRExv3g0dTE3f6rsn?=
 =?us-ascii?Q?8Sm1elGkh2x1PtH+M+7ImlUDg1RFitutfAXaPS1jNHoIW7p29+8U1z2gy3K7?=
 =?us-ascii?Q?BVCaW6mqYcOr3uEsRL2hIzuEl7MVm1fkhm/hhO1SUEyWJYlbj7b3Uwe8saqM?=
 =?us-ascii?Q?pZvMAWwKvOE0eqxWJsPUJcloY7rLArBjOP8AP5NafWON7lFQvqhMpQ81QsS+?=
 =?us-ascii?Q?U/WML++TV0dlxEBAqBK4NCkhPIcRtvtlg3W0tKs0WBqCmG/jIrFAJCg4ooVa?=
 =?us-ascii?Q?s83HEgTkxbR18lLVoc5KfOphLkE1FxX3QyovGi1W6HoC+FDeehTzpLCYNrYf?=
 =?us-ascii?Q?kRrUrD3vw2LRHei/AqS0uEyN4zUmxyKwzZqndqiVRZOUhkb52UpbcpZADGYo?=
 =?us-ascii?Q?XNweU5+OXezdATgAJgTHNDU0E4N8ajW2UbbCyYU0Fk1Ke7dHarvssFNEcMCg?=
 =?us-ascii?Q?7WYQl1RT7p1N9qc9RtYIPmziAKWCwAmDc9JtOtgPMXzGaIALvm8JobdDUOXw?=
 =?us-ascii?Q?uwvd8nfdzyNCSnonQzBi/W5n3DjHEEooB9eomnLXpaqJya19efa28NH4zuCz?=
 =?us-ascii?Q?zHWbLsZXK7FowbMoqEBnadVJeRk+F9/0EmpzdLxZYa2zKR5jkbCjZq9lRZS5?=
 =?us-ascii?Q?lH46TINvHkI9jkku93rIl4784aqxRBbs3D2yAf5X9v9sIA8ttiVJsZsTjdrX?=
 =?us-ascii?Q?AjvH9HjaKV/FS13Wr5CGfZS8DL0CJj3liY98iuU5HrYvyCj+hvF8Fv8k5BFv?=
 =?us-ascii?Q?qb+22OzVXtapvxNbwxqj1PKIwnAMAaCMNkUsu1mVntZqjtLeefKn4F/1TvpA?=
 =?us-ascii?Q?7uDo4zX0jLvUPjB3FAAgRr4RioXawMlu6kOiHnAnP2ESPE2zG1KqVUIi1TGM?=
 =?us-ascii?Q?lXPaik9QDLVsDnUyfOaohapqKUQH+AVKg9AGQG0lhG4LFGlx2gSq5cgIj7nr?=
 =?us-ascii?Q?ywdtemD/ecdapGEXKDL8ugm5dAqTxopbrcgmtIWUdtqcBz7J2nOD+5Gl54LY?=
 =?us-ascii?Q?ExE4ubVWWu4+WqEupYAXQOk6o0qq/umBfBzBk1ue49lQfiUydWNRggYA46sN?=
 =?us-ascii?Q?Tbwg4PxCqYX5CUS3aya590ChNokXSkQsfGDkUeIvRuKAdy6uE4LCZS/ddmik?=
 =?us-ascii?Q?WUlu//4hH3ikD/0dtQYpAsOUNDeCYx3hICeLkQS9BhbGy9/4MeARIfq71apj?=
 =?us-ascii?Q?nEhJSw8leKV+OpGjzzX/TcIJqnnNcTfwqkBl4/aF+oh9WgTVbUPNcDvkZ6/f?=
 =?us-ascii?Q?oyGT6LCCzbvGS+/gN0CfSGLayXMhQhM/la9A2BfGkEirBAsVKxncq2QeWNzC?=
 =?us-ascii?Q?5cpl70de5SNGML0ZxF+TfzW6FXjlKwic?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB9072.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?35VVXRbHthgKKW6peRN5j1Xm81pTNAaPLEGwRhASC42v7RMaY2JquhlLtl+t?=
 =?us-ascii?Q?eCWV3z2ni5VMPvUhDzUbaPOXVAIwb9l7g9ShM1R6y+UDTkuj0fjR3T/4VBUp?=
 =?us-ascii?Q?h9EUQyWhi/+HCCdsjvnHf33gHaV5J5lFWHxn2yOC0ChsV/tcjmbzaJUx2WhF?=
 =?us-ascii?Q?vaqwNemJcKKFg/XDgkZQGzX7nXxn4KwCfX2vgjPytlNxW4YVnXDOLledIFIb?=
 =?us-ascii?Q?laU4wDwsDaqqWLG7u1bZJ9VW+5DjtIBmKv/BIMATnN+ZiVslT1w2XYYQHBqQ?=
 =?us-ascii?Q?8avdzvgfqQ7GKmD5z7qJuweYufGdSF2dt4GSCHF8FUZ9YGqDVEOrC0wHQxWm?=
 =?us-ascii?Q?0Qsp/hsl8+fOV1BW3H3rV9tkzmwTp7b66XA8aOVZun8KUaRBoOxGks7BdIPy?=
 =?us-ascii?Q?uvCbWBBH8ywRZlny1sBfKQ9xDT3qCwQfpvjlvoryqP87b3lbor5AVnED7G8a?=
 =?us-ascii?Q?7YBoUtnNQFQcHRMrdqvXV4dGrrGEzZj4MiSYGlI8u7vBCcoudNRTIUCME5sd?=
 =?us-ascii?Q?z8jC/aUkjXoI1d5Q4IyFtQnqsIko3vmwIFazrwA5IAUu8PCZvfvEIss2dMX7?=
 =?us-ascii?Q?UTjwUJ9HhF1XEJozXSpcYdUlwKs3BT7Mx0j0LWOGs4b+K12BQgT6CVkzqHbc?=
 =?us-ascii?Q?BI2uSnF9BUSYWYO0h2xwyoWqVwrTyLBbpuQr6YjephANN54SRAfZzql6bGU8?=
 =?us-ascii?Q?7m4xskw8WWHy3YLxy9CCHhpmCJy6SrIzRas6QkK7q6I17WLZnTMyyFOHsB2m?=
 =?us-ascii?Q?UwEjCx9TadoHcTnkKSp5OD94t6WO4AFrq/m0AD7PO8gZ2RbX2XfMb62RDAlW?=
 =?us-ascii?Q?9HdUdrTLPFS7K6MRdj4DLDOw9TFQoJFBasH5dfmqoI4MFzUjfk6fLg4o4E0e?=
 =?us-ascii?Q?cEs62MnoFyHM6buMJsoUwfqBmfTL4tVbI7xkq08hpMgqUt5tOaa/l0DTjO19?=
 =?us-ascii?Q?AFtPVFUZ87PxKidHc83HqHw+677nJ6YBn+DBn0GS6jGM7WdW1/MsusdkDSt2?=
 =?us-ascii?Q?e7/3G11mtx5QEtAy64zFEo9FkrS900QQbivrCKtKDM1gfmb+36eJlh3KIWpy?=
 =?us-ascii?Q?+kIHl1cQPqPepYMi00+aSHU6a60kxU4I0Hnn4o0XujTur0QzqaqilUrsi6wY?=
 =?us-ascii?Q?Vn173U5ktjzpAc9Crj0MyV18dhLowuH+gVriVbJVx+29ovJHS9NCvxqHv7b5?=
 =?us-ascii?Q?4QKFDMG5IqJuOTyR8WbjrzSVoF1bqQvpYhTSaoCuShtYEficz26drc8GcGJI?=
 =?us-ascii?Q?nFrqjOOdDWWVk/pQF2bYlgPuutD/u9ZIvajm7UfKvYhzCax9ahD7cXopREmx?=
 =?us-ascii?Q?ZnLJFRWTOwJFOHC1YQEGr8eg1th74I4MzZO0YZOFuF9hkQLv7JhnKJx2DtGb?=
 =?us-ascii?Q?CpEF+bLEpuhfyrxzNikkn6sLJbFsGqTDKbcyJCNWHRAA4pWDJYzxuVvKNIwx?=
 =?us-ascii?Q?DPBGDiU4JPLk+N7pYeLgFuTnQun2sKr/Kx/IQqKuo6hwOhmE2slbmLivvOnV?=
 =?us-ascii?Q?vm5z+E4UCFziI+H4cJK5x0x8LD3q4Ruumwb2tmgNl3RAlXbgeeQZS1ePVhww?=
 =?us-ascii?Q?8lV5DGsc+DqGpMpI8ZhBphmOVct6Jm9xPbi3PetdKIDax15xFCkCjJVWAtmD?=
 =?us-ascii?Q?A39sVR3NwrUJwDcMWavMRzaj7eYMYlWcp3FuaP7rymONd3XxR0AezJMbNewJ?=
 =?us-ascii?Q?5nXO8x9Gyb7G5WjSAH4CjADqPec1XJN6lDXyywlIl9E25id2VHziFfHmvRcB?=
 =?us-ascii?Q?n6sjePrdWw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e82a552b-edcd-4274-faff-08de4e7820ba
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB9072.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 05:38:18.8496 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FSKjygdByvyZldko6Yby8ZlX8BOgfF6Q3u0vExDq6ZFVpQNt6DIx/LElPTbRM0BZ+EgDVKsjbWG0KcAKEK8Q/A==
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
v1:
  - New to series
v2:
  - Add flags param
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

