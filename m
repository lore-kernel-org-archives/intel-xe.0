Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA0A9CCF2C3
	for <intel-xe@archiver.kernel.org>; Fri, 16 Oct 2026 19:29:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7938710E2FD;
	Fri, 16 Oct 2026 19:29:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F08B310E2FD
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Oct 2026 19:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792178987; x=1823714987;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=M8qcSXl7rBNjmg8HiEijUwzGZGtbzMZEANDFhXr63zk=;
 b=DUSsQstcheSvQrQygFEVA20I9Jw1kuriFPd1jmxXvfIrevUhZ767cCqt
 cIJsPBOjqazpIxoWS43NILlbl6T4nDJwLRkin0t3r4dzx4f+HtCM3kHhv
 LpQpC83kFy22BCDSFPg4GC0wldQ4AUCnphCYyyvlAzDp7LCntJmAN/sjn
 1P1zNmML/T4SN+6ad4d9psgPWOWoLuSRomq77m6UG0UjHhWG9M7uOFt1/
 F7GVAOKW8TSzfawOXX2705Uze1TD8MrY0scsIZZ8Hmiru5q5RAIqCxT+z
 NxbXwiJ29yDuOzStkxnlBDcxfHi+bLYqlf1nf+S9TSM70KXj241EbwQ6I g==;
X-CSE-ConnectionGUID: A9eOp9FuSwyhR34nI1J9Jw==
X-CSE-MsgGUID: FhL+Ku/dSwOYJfRblpznAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11937"; a="967253"
X-IronPort-AV: E=Sophos;i="6.27,162,1787036400"; 
   d="scan'208";a="967253"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 12:29:06 -0700
X-CSE-ConnectionGUID: Y5QWxnaVTtmMHUowN8DlQA==
X-CSE-MsgGUID: DlxFPH5jReO6I+gpkLMUqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,162,1787036400"; 
   d="scan'208";a="2082607"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 12:29:05 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 16 Oct 2026 12:29:04 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Fri, 16 Oct 2026 12:29:04 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.56) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 16 Oct 2026 12:29:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j+g67znt4zSwqSduPJaor01jdpG8LJ9Us9alLZt900NjzSB2NsX7qx8DOVvSAVEKlTremjbglV4bG8Tu1q1i4js4nPWYZQIblL2ecN8k5KcjrR8F9/2KTkeH2Mf5kkoQkYlTKQpCqeBWqnt7PS1wL/88rqWneKJXAUMBYaVzwjLMkSFB97dBL+jBX6cgY5PVhB6VxVjitT6RJTpZOmhTm1h1TpjOd6VbFrEnIb1oHiNZwvdP3L6HvM+FCZXZB24bRt0dPwC/7ONgAVS8k32iIzNbl8mlo8NojzJeg/lPUPb3NKJSlWKAUzOIpVlQ8wmqSXq4GLyTEaApfSlStnh9hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZocgQg0wl9SWJcRQhh1zt55iYemk7nfysVAVRcrOVGE=;
 b=pRF9x2HzuX89B/8p7e9mVTpRKDB5Y39V9bKI5TBb4GiD1AK4vQyuPbPirUvUJsIxGjzl1xHILKn7c5zOWmXbvdnv6zVle4fTVriUWlwXSJO2Af+n16/SkB3PaCh0kkoFLOi09YL/JylJr1wlrPD/Xj1qJBxtYwvs+nlaeD++D7Y+CH3UWqOKI0kB/WZUNYbeh0Q4dKNMFsVJ/GNgXCTdIh1vFKzZxmy62vX92ocooYEz44wcnPeRqWo1ZBACiyx1w+VV5wLh2EMPqRA+dLgMtkptD4eBMLn87/V6RX7gOVTxoFlrFEPXd0wW3JreTQRTahsdAgP4cvsNNXDyo9bI2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7181.namprd11.prod.outlook.com (2603:10b6:8:113::13)
 by BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.15; Fri, 16 Oct
 2026 19:29:01 +0000
Received: from DM4PR11MB7181.namprd11.prod.outlook.com
 ([fe80::89ec:90c8:3170:5f0a]) by DM4PR11MB7181.namprd11.prod.outlook.com
 ([fe80::89ec:90c8:3170:5f0a%4]) with mapi id 15.21.0496.021; Fri, 16 Oct 2026
 19:29:01 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH] drm/xe: Don't ask for bug reports on force probed platforms
Date: Fri, 16 Oct 2026 15:28:50 -0400
Message-ID: <20261016192849.3027182-2-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.55.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0112.namprd03.prod.outlook.com
 (2603:10b6:a03:333::27) To DM4PR11MB7181.namprd11.prod.outlook.com
 (2603:10b6:8:113::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7181:EE_|BN9PR11MB5276:EE_
X-MS-Office365-Filtering-Correlation-Id: 73daaeed-d391-4d2d-b478-08df2bbbbb35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|56012099006|11063799006|261009223027099003|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info: RhHs6KpZooIspmQOn2/9QpOUyTTFVWP2S0XmpLOVbMaEH3hx9Kalw7TIamI9WYmKpLUXmUlnysnOJ89ZgPdqa3ck1DZi3zka9wuD8ipGBbuylnNaeZXhSeXdjKDls074GZFUbaIlww9xaByUXv0R9MiUgN7FYiXbIdxjErtat/NV0fWLEbNcmlIjsO8K9iKYCwcIrbGzv93pMyelQ6fphEOnlixGCwNW7qJLxRHRozLzJJnC9bvwKq3qqTbf8+BIANFLmZ9oAcitHoBOxRGfWutRLBEHx901HZXkKCB9kjRYPrDymoD46WojYkG1YQIGWxcQv6dpN8eEYi/qDlHegvPlfH9aSXr00mTtl7sh904OLeVIBKSyNC7WYFoXnkkaMyyv5t0a37rsgSWgQLSf0JK2pfQHWks5YG8UoHdbTZ8UsSu1RTOVhpm10lPqt/Ww4pqnlEJgNEsNKoms6d/YRI2J9DmHrAurXXq1iYxnQRXydPB+H001rdyBVj2EsLPS4/7Jw1DbZM8R32OvqDoH+EA9kIhAwEu/6MTeCE5AOo1tdwVu6xdwW4RBKi+0piV6p0uK1nOCIADAA2094yOo2FDZXRznj4YJ6VZ6GW5h77fO9/eFynlZwp8GTnaBmuibFwkspKKeD7MIBlWDp5RMHPdUNeDY1P0lXHJWyrQrAEY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7181.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(56012099006)(11063799006)(261009223027099003)(10067099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?biUyBRFpwhdOE4jFZTRw9oxiiWkRYlR101t5VtprLhACIvbtnirUfFwgZRfV?=
 =?us-ascii?Q?8EZGM5MTGPieMcloKGDQIn3GJ/lqSU7ReuRvibHdQ0FFrt2pr1pJYCWjPvg3?=
 =?us-ascii?Q?vtX0ViyOYSbXuN7BqZPPxBzlcMLmepKp1OQvTkwMRk1FjQjODV8XwxnpQ1mh?=
 =?us-ascii?Q?HWwUjl/fdi0qFOsgfL9q1D4z5qUPajGAVujrXDiZ9npE7JMlQTJB3GTQQ7zz?=
 =?us-ascii?Q?Diqpc5L9pRmrcrrNqbAtMNoIrUQv7kSbAc5t/7BA3bJPnQ3jq9zkXT4j9jh4?=
 =?us-ascii?Q?rCccCsGYEoux2yoyJ0yfX2XhOp6ZDgh6A2IgLRZGjBhMiAW1pvhTqUZNq2//?=
 =?us-ascii?Q?91nOSTKCYIBmG9pBfNvax0i6VsBWV0y10q9wQFYRx0U1D0s+oWG3S/xBVM/r?=
 =?us-ascii?Q?czUruNerbwGmjhdREVywWJ3epODQm+lyMEraLMtSFtsVI3hlRakbdyPpv0Wx?=
 =?us-ascii?Q?5wksjEsQ9Mi+aB4oP9wiuDzS3JUlH13uYCqrBqU8HWCyOShtvhm7h+Y4stjC?=
 =?us-ascii?Q?jkEQw3p/5H3cARfkuhabEMl1x06VAXVGbsavKGe1Wq+mMjlrJ/gxtIuG8i6x?=
 =?us-ascii?Q?ntiZ3cMpn9i2l1J/S7DbMoxZ9sq8Fp6O2p012MQCZsL8Zh4o5cBPbutcXOks?=
 =?us-ascii?Q?B7oZ3/CA8CYijS6CZW1B1VCkZKXKpHllIbKszHmErQyRy0Klg3Zq6EI3GvAG?=
 =?us-ascii?Q?wp6clN8prht6+4qAoS9aS/2jYYc92zRH2YQ4g9Wyp46fwEFHEcqwwb8QSiSV?=
 =?us-ascii?Q?2CeNugQGtO1FobGzw1ZV5TbTNJffo9cnBQa/9Dww7cUkcP4MguPEiIKhVEI0?=
 =?us-ascii?Q?QlJQhJ3HMV9YmLVfOqej32BAx5NJ9jl+PwNi6T9dXgPcRuC0HLqoDbPB0AeJ?=
 =?us-ascii?Q?+6QbghfJ0I+Les9AyuHYBA0fdJcwQ3+lRszrrg4nuotbqaaZHfAFlkV4K62I?=
 =?us-ascii?Q?4nymHdAmBO9v0eEfqYmmKuL4kWhaBDUaBTobP+2gZZqzOEcgeYxCSR1VYapF?=
 =?us-ascii?Q?lU2LyqTXo5UN13nE4CW+N4B9dXmhuNRb8lwT5bOhYL2ZkkLA9QDHIcmgDBHk?=
 =?us-ascii?Q?sA01ktaEOxde3XsWaX4ququpKpwp1cizl9Vqt5gFYifJ1la4jgyTHxFqyi7x?=
 =?us-ascii?Q?LCk2sLFa14MYYKiNgDjX6L3xdqpHnj8wXSmRRawHl9U8bIMO0+vlUiuMc4NV?=
 =?us-ascii?Q?ga9JBRC14uEeYRucf/cjkVWeSpP97b5/qC7bn20rdP/nyhEdBHRGAUDeDGN7?=
 =?us-ascii?Q?e2CDXdUfPoI59YFTd4ole+QBa4FQzrhwvCBeYywQtYll0dPZaXcTLUwXcANh?=
 =?us-ascii?Q?imOT69m155LN8N66n3eTOp43L7ajwjvQNhspl8WgQLD7eB/U+MgXxVF5nox6?=
 =?us-ascii?Q?EoBo0BTyk/FlysvSxpGVqEqdjGzRgTWdga/vsv6r/HZ0G5Mm/RTlsjbwCLup?=
 =?us-ascii?Q?NAGsQLPZzqIC7HOY6RQcC/dwCJ8/MIfy/4JoevEA1ipttTFfrelPdBUkd0RO?=
 =?us-ascii?Q?a7sGeB75Tm09+2Lk4n4FL1oUco/O5bQf2UEO/YEjtWB87bxQEGhRZpQQ9ywH?=
 =?us-ascii?Q?2wElRSdNEUArDXsnwS0aUFbWeVh3XQ+NCZPNaiTmhS5GUdT8AumoiNOJkRdl?=
 =?us-ascii?Q?ICZ/2g9NZuKcC95Mu7kYKaW6E7toNU8KwVnR9iGPpRXd7qEC7fgMoTP8lpAq?=
 =?us-ascii?Q?6MJwtQN2aUaDuLlRLY2ePCajv0Tkp+uqtlcaNx8WnUTIw+MIrKaxHCkd0QPi?=
 =?us-ascii?Q?uXmUqaXHqw=3D=3D?=
X-Exchange-RoutingPolicyChecked: Ol0zJVkBpFCfGfJeciZE35fE/pmjuR6UKg0k7zr3JCTsHP0Gw0oCQesPe8atwD5wKZx5aNTBJ19E8CIzwr5dtFbSM2mWbiEG0pYtpukcEHJpVDWR6rLwvu33r1Drdbn+AbijGNpV/+CSAZ+fV3KDm0Bolsfp3bJJa9iDvlVl+suDX8TAhELkQOIKJXBct9EgQBem8RrVrGfGbIMu4vgfRUWu+X0Xq83hKlGS99P5vgGJ9zU8EuQC63m+1i7fd3UGon3mvMCeVPvAV/lkH4wO00BC+qRigtf/xaWR6D2kTbXyfboZ92FOEY5WM3Oi1DHg7/gDpG0QkfrBN2btCpLqQg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 73daaeed-d391-4d2d-b478-08df2bbbbb35
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7181.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 19:29:01.2354 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d90QZWnFMCxRK8eTQg3OKKjVG4sotRJodXSoqspH8kzvSb5pB2i/mSg7HHY6nDYpVfxGla2WMbGZnRSWgqboJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5276
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

Platforms that require force_probe are not yet officially supported,
and users enabling them do so at their own risk. Only point to the
issue tracker when a device gets wedged on supported platforms.

Suggested-by: Jani Nikula <jani.nikula@intel.com>
Assisted-by: LLM
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c       | 8 +++++---
 drivers/gpu/drm/xe/xe_device_types.h | 2 ++
 drivers/gpu/drm/xe/xe_pci.c          | 1 +
 3 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 6c214799b65b..836e37d9fb2a 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -1429,9 +1429,11 @@ void xe_device_declare_wedged(struct xe_device *xe)
 
 		xe_log_err_fatal(xe, WEDGED, -EIO, "Device declared wedged!\n");
 		xe_err_once(xe, "IOCTLs and executions are now blocked!\n"
-			    "For recovery procedure, refer to %s\n"
-			    "Please file a _new_ bug report at %s\n",
-			    WEDGED_URL, XE_BUG_URL);
+			    "For recovery procedure, refer to %s\n",
+			    WEDGED_URL);
+		if (!xe->info.require_force_probe)
+			xe_err_once(xe, "Please file a _new_ bug report at %s\n",
+				    XE_BUG_URL);
 	}
 
 	for_each_gt(gt, xe, id)
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 41f703a87916..3554a25898a2 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -246,6 +246,8 @@ struct xe_device {
 		 * state the firmware or bootloader left it in.
 		 */
 		u8 probe_display:1;
+		/** @info.require_force_probe: platform requires force_probe */
+		u8 require_force_probe:1;
 		/** @info.skip_guc_pc: Skip GuC based PM feature init */
 		u8 skip_guc_pc:1;
 		/** @info.skip_pcode: skip access to PCODE uC */
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index bc24897ba453..d3e1c9c00832 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -820,6 +820,7 @@ static int xe_info_init_early(struct xe_device *xe,
 	xe->info.has_sriov = xe_configfs_primary_gt_allowed(to_pci_dev(xe->drm.dev)) &&
 		desc->has_sriov;
 	xe->info.has_sysctrl = desc->has_sysctrl;
+	xe->info.require_force_probe = desc->require_force_probe;
 	xe->info.skip_guc_pc = desc->skip_guc_pc;
 	xe->info.skip_pcode = desc->skip_pcode;
 	xe->info.needs_scratch = desc->needs_scratch;
-- 
2.55.0

