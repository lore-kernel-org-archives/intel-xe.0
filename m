Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 978C5D1489F
	for <intel-xe@archiver.kernel.org>; Thu,  8 Jan 2026 05:38:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4253910E693;
	Thu,  8 Jan 2026 05:38:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="mTlS8oRv";
	dkim-atps=neutral
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012042.outbound.protection.outlook.com [52.101.48.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C12A710E693
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Jan 2026 05:38:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CXCUqDZu04F+f7l1SQWEHK52dWpB7pb3Cten5YfTL/2BlPdqcpbUdgXMVEMAQ3z3yy5ZcTjfgZ14jeLzIiumd8FI6H3ln0Ep2GaMg6v8f23iGBMi7wMR5yaEwfivJnGqGSOpUyBozFpTt/tMSRqu8vif3wt7lUvGfOdLnXgCxh6Ev99EdBf/dKrC0UpAEybKbZd7gHQD0CWlDcdFDg9VLWJ5UY+h6FJu1akz9Oam2h5q6ydnQ5gOCKbXrzQH7ESZsO4WMQQnKlb/AoXJybNy0ZH9UWdzZVk+NJSRiLAqjoUDNO355RsRYeMeGeRgGOfiSP5zYixwik+sfBoyJNEKEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Uvn/lptJvUdWWvliEVZlNbSDVZOaU9dY1IKiq9yPr0=;
 b=WMV19xwm5eYukmF+cqUQSV0Ic0/4qVEniXQlWSHk/h+KErzeVEv5zY4hsJiuwVDj9Llim0pWOvIUQ9pRGd1KBXxQ0eDfGDxFR66cQbmTW0bOmmvRPNmXFAyl0eBOV3vfp+Tdsw6IUdVvHbjFYmm2kelSw4AryvzR54V25chAoGGjyT9TwNfm8XkgSORbdaF7hUFqDELKJt7szUC0N8LkMHh5V6NuOY2wsflF/l4x1sedBHUQmNnNg5Q++zQZG8xQXscKptDogh/Fdw3wclFyYXoaZiEl+dGqJi2QMJNRLkKKv6IX1iLnXYoblMI+Lc7s6nto69T8tMr1AGG1RpI5Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Uvn/lptJvUdWWvliEVZlNbSDVZOaU9dY1IKiq9yPr0=;
 b=mTlS8oRv6JocCPljM6NGY+1etH2uz+oeWK78xZGuDQXOOSzPL349m0fEaSicKdjoZj4ZKED9gf212IdjQ6fIezQ16H+MGAw9kPuKuMTAx0N7rPxgW2601vl5U6+Gd53MHce2hsKuvh6lyfPUIuuHY791dEKSO80hrmEUckiDnpiViR29Cf6xevcMDqIHQTi9CnUCGi536lrnX3+2AHD6ZehDr7okpD21/CB6Vsu13dWOn37wI1avXxWtVzN1oFrAfmX7SDAqzep9Dc/f/CNmdPtzm+6EXyAFxNp5y5wHrcGbhNsWEz3sCbxoaAZz3+F7TPIQzcH7e+Ge+0fJ8wYbEw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB9072.namprd12.prod.outlook.com (2603:10b6:8:be::6) by
 LV8PR12MB9451.namprd12.prod.outlook.com (2603:10b6:408:206::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.3; Thu, 8 Jan
 2026 05:38:22 +0000
Received: from DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1]) by DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1%5]) with mapi id 15.20.9499.002; Thu, 8 Jan 2026
 05:38:22 +0000
From: Jordan Niethe <jniethe@nvidia.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com
Subject: [RESEND v2 07/11] mm: Add a new swap type for migration entries of
 device private pages
Date: Thu,  8 Jan 2026 16:37:37 +1100
Message-Id: <20260108053741.38802-8-jniethe@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260108053741.38802-1-jniethe@nvidia.com>
References: <20260108053741.38802-1-jniethe@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR16CA0003.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::16) To DM4PR12MB9072.namprd12.prod.outlook.com
 (2603:10b6:8:be::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB9072:EE_|LV8PR12MB9451:EE_
X-MS-Office365-Filtering-Correlation-Id: a8c4653b-03ff-4723-6316-08de4e7822fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?eXEUoQixoshZCa9ZB8gGBgiI0KX5nI9Fvdeh+aOOVcd6MQRqvEz0KkM4VIQz?=
 =?us-ascii?Q?jm0+FpDXeRSyUBS0Y6P4/nsu3DtE/yV0vm1+AcKjo/l2pdUxwAorHitJ99J4?=
 =?us-ascii?Q?gSo0fyPQDvcxRNEzQh1wZRAPSk2TUQfM2HF7euHuUxGfVgfPf7RQKlPQJ/bT?=
 =?us-ascii?Q?tRB5ouTlvjuFSm+rir6ZxpzVSdEPVewDfV05Vl9/gqSlUTBPq5gGZJH+Rkme?=
 =?us-ascii?Q?Cnoh/KrEqTUf67hbvRNNgUMJk9LC9XIf9wMKfGhjvIijf5gfRXEL/yU53x1X?=
 =?us-ascii?Q?CZxmSsMBcKLNdkAABTQ5DMHmGP/OiGEGpAZKXoiKUG9XCkW/u2QibfKgbB+B?=
 =?us-ascii?Q?5JO4I3qmDCJQL7wJ5XM3ZAjGA55QqZakJvc3LjmEG7D0aDXhezNjWtf90c9L?=
 =?us-ascii?Q?xvktV0WPR94GNqJHVWpk02AdjSahNGYDimkAJYCb7EOYtCzUdjn2ish8UE+r?=
 =?us-ascii?Q?+D1dzzUgNksOfvHPWFvkOEiyEhXYlE4Z8oqLkG+7UviTXqqibId2tU2djPcF?=
 =?us-ascii?Q?yOQ8IRfNmbr8NJ0A6IbpM9BMQ4KlKj/DjiB7wrMTKB+n8XQx/C9WFSq1bd5b?=
 =?us-ascii?Q?zGtyN6BYn/WxtLQsidCDoD4wcM62+FZya1k3ntfYoX2q/ngFgOl8nWZ4CxQ8?=
 =?us-ascii?Q?iqNQE8c51ZngpY9DM974vMxYRtAYixgpKIl19aTwlsqid+TkNg7CiqjVWAh2?=
 =?us-ascii?Q?PZoLPPR2FkdbdGUuw9apr4M3dEKGJ4w0GpXzzM5ZlDfJ3DscN/yyRualJ3Mu?=
 =?us-ascii?Q?2lFHwzSIhiMXTN1Y69mW9URq3c1iFrW+DrF0SZsLtfWGqFs7tczYieKZemjr?=
 =?us-ascii?Q?9d0Y09gb4oYTRgMVEYUJtBZSfUBx7cfqJ/stAsFCriAHh8FBCAfPfiI5C7LM?=
 =?us-ascii?Q?a9ZJ6/rTPNaP2qSjyi5YA8D5hy3cpQ1P0Oy8CG+IKCJtdmtZeVjRuQcn6im1?=
 =?us-ascii?Q?IYvF5EwE0XNRBIAnWkEBoX0PIN5vVNOug45yx+1uX+XZorUcZ8yUT1wYCM9e?=
 =?us-ascii?Q?fZqdo/l7jdt3sOihs0BfI2DqJA+6162LdnVP/8Llwnh5Dp19BUBYbdLYf4F4?=
 =?us-ascii?Q?1HerMv2MfNI0rr/gPRPxWFDsfQfxk5DqYp/IgF5+/yJmX6omSxrkcfeOIsUL?=
 =?us-ascii?Q?IS+bUVBnzKhShXUMBjnZzL/Qhz6uRlvGAxQk5viPofBZ+AFrIUO4kKfQ5Vt1?=
 =?us-ascii?Q?q3pDjGs/NJ1ZqZuJcu2Kd4kEsLEYp+5/CY/JovfiilwZWlcD0gIPFOI8OPvP?=
 =?us-ascii?Q?VaUdtIeTKswvx1xOxdaJ2wnNisTb5UMQM9ywSQIG/5o51CDezB8d7ImwX42A?=
 =?us-ascii?Q?gaSxYgVelqn9vL2+Kc2qeratqXq3TMKS9UGL3mJqrtXxRltq0uE/v24wsb4T?=
 =?us-ascii?Q?kr0EaSMfw3RiwDFIM9jVO1Y+Q64FQ+q05Hw03ooh/Zf9vIUWqmeJUy6SYw/v?=
 =?us-ascii?Q?wLZcHiiMZ+n3eom5OXhyyTur51TSEkke?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB9072.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bOcthBUDaWrKEJQzqrQqVo5tJnDKfEVAzTrYk/qwidQJZbu7owoEfIjiakz6?=
 =?us-ascii?Q?IXiO6CNRH98gj1Mx73EA1zKoVL+rmbcIg/3DsgQlS1ouXvZCbdDVT3v2Q17e?=
 =?us-ascii?Q?X1VuYz2vYk/CQTou2iz+C4RZK+PslqXXGWZwhA2/oJ98PsU4FDYvJCPwlX6O?=
 =?us-ascii?Q?eUm4rDna9TF6Cjpfe0HZlpKbEU7cuTh4nGQGO/azsW0zc3VJi7TOB67DsdnY?=
 =?us-ascii?Q?dsCZbMCVnBqr6Ie9CWC5keUoZVYLIaluDHjecyzmwjwSpCQcTqlOUcWvttwO?=
 =?us-ascii?Q?+NGz9yExMYdRB/yA8o6PjCkm3YwPKoZgmiXw6D4enIOFNDjQ1ZqDWp8MMVor?=
 =?us-ascii?Q?69U46dXDITQwLQSvlX4KN9Ea/8tMLb2cQQLoroI1axRJWl3u5t/UJCa8yIvP?=
 =?us-ascii?Q?2UpKHf4/WD2J/bDvP/YikCIY/iyHJ1pdpf+Me0MBCymAUk2nLR+5rXnIQ+ji?=
 =?us-ascii?Q?W4yD8U7u0lojgQATaX2Vk4VdV/R7E4JX+7v5iFosafDKiJ0ocNqx85Z8X9f0?=
 =?us-ascii?Q?d6uImMRjWHuSsPcj8WVRx7St/a3VgGqGjyr0Fsmegbxe+hxCsZX4HZtpkoTq?=
 =?us-ascii?Q?wWxPnFsbgdN5xQiHRwkVUl/Z1fy9OVceWh+r+FI7fA4BzoFCyPCYrVey6Axn?=
 =?us-ascii?Q?5NzcgnXCG25FlCwVcg0AjiSoRw0e3NLq+jbzduK8fKfj3UywiJ+UJ1lVdk0T?=
 =?us-ascii?Q?Pcvl1Lby/3BWr4vUc0hmz+6JNtR4L357qQQIb0tN7PDlkXOsAu6YVLB/3YJi?=
 =?us-ascii?Q?vaK/G1Duxy5sFDyQ3hHheAeau/mic/OhIAnNpwGIklzYQ6fpCaU54MhVOqyX?=
 =?us-ascii?Q?QXTE2CJcvyFAmep+hkHZI4knKeyWNwN3K2FH6fEebvvY1IZXg08ys1QXHheT?=
 =?us-ascii?Q?wZv/B9lDCOaDOU30K+Z/Z7bxJ8VoZvvITA2587JFcUAUK6uWgoasqQfIvcYO?=
 =?us-ascii?Q?4+iaxk/PkZiCfRkOzsIRpfMyxMkrafUByz7Vky/H+d6Ft61RKxaG4vSSnSIp?=
 =?us-ascii?Q?8rh3fc9MV3GhqdbOiN7YKc0qNWwI9qhiSx+gFGrL+h4YS4XbCPn5Eg2nxis9?=
 =?us-ascii?Q?LFkgK8dLXVYI9mz4ZG/YNceq9qalJ3jNEe7pxcvceSgLnwwxAkzrsLarFOgn?=
 =?us-ascii?Q?U2HvW5LFuNd9LG8D0ol0IhMZckpVCDRha9RyOZumJUFB8nba1O1yapl2kfJr?=
 =?us-ascii?Q?dcvANthpGny8GAORBNpSutxXfkLX2OjjRh6kriIGmnTk9yXjtMa5LVR0BE5t?=
 =?us-ascii?Q?L28xZ0UVajan/t3+WuccSmyLJ8NhnKEB9E7swfWyo1eDW4sk8j2qLNqMIs2K?=
 =?us-ascii?Q?nQxDI3oNDm4lnVav4fhsW5DF36DmCUJh8N5OitBAg0xabnp37Hl6QOTd2Nv6?=
 =?us-ascii?Q?K3F50bEZ9/18XkfsS5bY1fiMuiflkdEDI8ru6iDBAS5RrYHwP9BbEkeIAlwV?=
 =?us-ascii?Q?w8d3ZJXWybWkH05JlKtNvyLIhCCuuJ1RUSNAfkkLxoUhxI3os6V6vGGhx1In?=
 =?us-ascii?Q?1iJ75cDrT5bpJLPIJWIwkLtckt99agdPT8B6HH4MTbC4vdv6f4S0cPkdzlcz?=
 =?us-ascii?Q?L76hHUJQzEbTM4VAHwSBPuWeaAOMJUZf4j/HSnAc3bGG4Sz5k9R5JYEbnZGc?=
 =?us-ascii?Q?faTugE1z2+LgFgZ5/qAa2kh87z2MsefBzEzue9E8Iz08NEEF6YJEhv+szKcp?=
 =?us-ascii?Q?OcFhvlR/29gF2+qY+SEhSCBNM85QK64VE6dIisQ1TjWfemYlcsOW6gFtoikN?=
 =?us-ascii?Q?QkkjhpQnQQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8c4653b-03ff-4723-6316-08de4e7822fc
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB9072.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 05:38:22.6346 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KsXhnW2RMtND6So3iTIbpL9HEpBFKFMqznuzgz/rD+IjDzEaw53meUi9dPtiEIZVEtPPAAV51Rx44F+vDkv96g==
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
v1:
  - Update for softleaf infrastructure
  - Handle make_readable_migration_entry_from_page() and friends
  - s/make_device_migration_readable_exclusive_migration_entry/make_readable_exclusive_migration_device_private_entry
  - s/is_device_migration_readable_exclusive_entry/is_readable_exclusive_device_private_migration_entry/
v2:
  - Add softleaf_is_migration_device_private_read()
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

