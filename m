Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23163C25B79
	for <intel-xe@archiver.kernel.org>; Mon, 13 May 2024 18:55:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9410B10E917;
	Mon, 13 May 2024 18:55:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lB3VKop3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D268210E8EC;
 Mon, 13 May 2024 18:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715626557; x=1747162557;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=cSFlrHqgzkTLYNMUub4q6dXdNBusZPNvKGL8aQ8n6z0=;
 b=lB3VKop3Bv3crhw9ypwB8eH3lYjC2qyLEj4GSJy74Cg9GuzycfpIXlNZ
 b75qDfk4W00cJyGq4rLWXVcT4Igte8fQUkXk9wzEAUvNDPMMZifv9UvNR
 +3qq0K9xV2F4jTNKVGCDtmDvziXpKGd9CawVvwwXt4UJv7I2C+J9oc/iI
 JbZlstdRl2YpiL+zXaifxfimM2ZpAEabT5JLDgXxn9oE5D9HMW1uqIF+d
 cGkY7PaEHlWWy2lX5SkEvUn1ssNFLD2XN8Al88FtlSLq+kYqkIeG0WJNQ
 JRwgYA52S/5puJ2g+xxbZ+oTQVjST9U8ZoqTTybXBNZA9FHXnyEr566I2 Q==;
X-CSE-ConnectionGUID: 8rKtm9g/RWeQ1+2gkxCF2Q==
X-CSE-MsgGUID: dl48SgVvSOy1UDERC/fNnw==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="36957231"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="36957231"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 11:55:56 -0700
X-CSE-ConnectionGUID: TOMwlMjtQdiVUNr42mUzJg==
X-CSE-MsgGUID: n9t5c7GbQG61bb59mOLTSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="35311516"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 May 2024 11:55:56 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 13 May 2024 11:55:56 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 13 May 2024 11:55:56 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 13 May 2024 11:55:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LEd34C9gPiAf5nq+BLuYGMeMBISdRDs0px5xsLpZzrIxtDn75MrxJriLIAY+wGTKQHwS/UGFWFBotqaCEgkmUtP/KBy4oQdsZQ669Q9nFvx+h9c3uFB8TpzShPROWFc1OPBZKD/rllh4ACBRgpyDk6hwO836s3wx9yqZgP/CBc+Cv/4yARcgfWHwAvvVD45ZClrbElMwPQRgohtd8YvL5hs4QgWo7Uag00T2XKZuhGjiZceyOhYR9iNW4uP+fjWLlQ5XXR/RgcwAFn/BWQwqIIqeaYnTrh88j6cJJMibOYEdtDkQ4nEyNnrXqgfb96y3M/lWfmRLKOw1+LV6vcrz1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fIzxBGx4XUWVti5LNody/HxJi+8b74iGqfM7YA8mjEk=;
 b=SDWk76KHsFUneYOcdbzhZThyZTt+HFjZY8R1SXAJbszEVd+O+5NMUJof+qZVpMWki3oLLUceJKTOZ0pd8omIpKrDAqQfGErfuAdzBBEgynVdfkVDTjPAitpv1bObVKlydv62gaBNNUAAXiBvWDND/oAfCZ9msWRFs8Md9z4NBqrQH29axaHFytPRuY0ZPUZl+Z9FbHWxPkIQdZK8Joz7U3ksUjceVo709p5B0qVcJaUxuLkijc9KQHrBKDQeTBfB8ym4kSiXbLZOnwBIo0sbDUotF563PxXWYGWrY427bTemcUT9BTBvuNZUMsCwS2Vuds9tb4GrJOO7OsDvFclGvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH8PR11MB6904.namprd11.prod.outlook.com (2603:10b6:510:227::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Mon, 13 May
 2024 18:55:49 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7544.052; Mon, 13 May 2024
 18:55:49 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t 2/5] lib/igt_pm: Fix and standardize IGT PM library
 documentation
Date: Mon, 13 May 2024 14:55:15 -0400
Message-ID: <20240513185518.772398-2-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240513185518.772398-1-rodrigo.vivi@intel.com>
References: <20240513185518.772398-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR04CA0139.namprd04.prod.outlook.com
 (2603:10b6:303:84::24) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH8PR11MB6904:EE_
X-MS-Office365-Filtering-Correlation-Id: 10334865-88ee-4a0d-8e09-08dc737e4e3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4zr0cxSq01mH2jrUDSfzLx8t9Nqv6Fd3naLaoXxBnu9SJiO8owfc8MeZcGDz?=
 =?us-ascii?Q?x73ipKySYCxPhWr5TgloGoPBJSQv8m0mwTeYhnWDd4fbt3qznwPhSvTMxhLf?=
 =?us-ascii?Q?w/LMGe/0hVTmXWHeZlYDX1GGXSZFfo8uxlhdJAxGqEzd6unYr7UP30TbY3Uq?=
 =?us-ascii?Q?JbJ0GS0h37EzO1lHqH48TK0TRPE0zLUJNaQag/MxBL0H4l0/Cah1JeWysacW?=
 =?us-ascii?Q?rireTrSH4sRVv8pyarKHTOUqZWIp6fasjOq4GM/aLasQ+GjZB6p1VKUP2+To?=
 =?us-ascii?Q?f8o7ufbtOxRipUS7qdAgQeenrT1jZoaWpu8Xr83vEh50moY5FcK4xanwmeJG?=
 =?us-ascii?Q?7dL1TMKtAF41SxwZKoGexWouz/fyf+sFQUXJCM9OfGB0CkAudR4eHPtwuDBx?=
 =?us-ascii?Q?trKZpUzE2ZhqLKPmpPRvG8+zYF7+vIygftmkC2IZytgtx4zxMx8YLzNUR7QN?=
 =?us-ascii?Q?TJ4pIBvHAL45k+GajdLd9bkaoQ+ueJFd+rTW6RLQCXvUWuKPiliE3cPate46?=
 =?us-ascii?Q?ZmnNI8EPdLx4EKqRpLDCUtfn2b3CR63FepHMWRyWc8hZtRbWsi/2CU6diaAd?=
 =?us-ascii?Q?nMWsvg5Sa2WEZvxkGGHqFZONJHBs5YlHTwUUnUJSF0O/Uit7uJSgocu2f8fE?=
 =?us-ascii?Q?gR3Zbayv6EKwmUvOvD8/HpAtf4QDLOOahXXQstMfj+gQW03EveXZLwFMlqIl?=
 =?us-ascii?Q?QxjBvOt00bPfOphg1k5UFJpBHeWlq/hWzXxzZ7zZDqEmYjtxFk7KJd8pbxiF?=
 =?us-ascii?Q?TVov+dAZf4BSrm/S5aps6s+KoCB5I+fYP/cTTaQQD/dOkXNihUNSK/yaVN4s?=
 =?us-ascii?Q?FgT7MT9cFF1FPJDXdzW+VM1l/Ks14IFyPNgNq0ieNbbcVQ8nU/BXXwF+xUY3?=
 =?us-ascii?Q?X/l0BV3fZEupsycVcAimS5Y/h4MsjvuPByhNYGWj+T9KJGsODsnH71XIcyw+?=
 =?us-ascii?Q?PWmJ7EXkwVIOiTHY75bzWQtkSwGpT1/OFstcyNaZRIb8JnJY/c8amFC4VCBl?=
 =?us-ascii?Q?5n2bMHE5uEsLY1Wep/7K5scOGfpL3yHU89IbEnvk5j67ALrThJctd0ZI2g77?=
 =?us-ascii?Q?gc9JHcg0BMK20iqvHDmsXwuL7Agqpuz/nQGqSXzWuxPkh9jVIi5g6KVIcK7z?=
 =?us-ascii?Q?g0NkBAr0iaINOVj6fX0MJbYm8jiQlUSQ+0ceJIHbE5R9Pd+ONVqN0w/3B+x4?=
 =?us-ascii?Q?YCY+xB+CqALCNcVV+csZw9sBqS6PctjZAlyVhl7BC4MXvh/wzRGymW1FFG18?=
 =?us-ascii?Q?EH25QSI/uoTIhWMIGylmvgmV18yldtTSc9CN9+gN1w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?N7oskMSdfXlWbUYbl2gEYu0NfutGvkzpvmC2GNJIwDls5aoQtR90IK6HmspC?=
 =?us-ascii?Q?+Fn8K+vI0JZ1w4VkboyGiVrf584BGAdH5+AjHJiAVJxo1wA2h/f7ijjIlSic?=
 =?us-ascii?Q?P+/b3b4rvKSX0GZh5wvK1e4VhfwrxzdM1DNO6jI6uydn55H19hw3t6qK0WNy?=
 =?us-ascii?Q?D0DfRP2JX4xufUZcRbghZ6qMyOGn0XhfcnKJ7qUj5AWg/0pm7BYX5cfohc21?=
 =?us-ascii?Q?qJKCkcLbGmhoxo9GpdcXraWxnjVOHZ+rkzPRQr6gfosmpfI1tba2icXM6VY/?=
 =?us-ascii?Q?TuklTDTFQCfZBG8f+1vi1EgiqU8xEkvnerweB7GmarpvD83T6Pk27b9UBsf8?=
 =?us-ascii?Q?fUMGoVX6IxhpECI1z8DJZgDyjLSD9ODHc49Hm3ptIGkk3iO2iyyoRPYswUPM?=
 =?us-ascii?Q?QM8w2K/lxux66PVUMdACnXZIi08wYcTTPT+4/Y+VlUwfQBNga8BlXmnZf8ri?=
 =?us-ascii?Q?qV7AMwu3BZN6t/JzE+/FHqRSAdQrUQE9STE22GN+5TZ0m0zDjPyR2QdwvB47?=
 =?us-ascii?Q?mqC+ZfvzVVXSr8tSl8jRFrpxyqVWJc9DgBx3mVXsHVUUXiMJ7rIMgqA+sdmv?=
 =?us-ascii?Q?mmKTqEue/ur1mlmixxfhmi0dC3iW6Qoo8ZG+PFJq3N7HOZu2XyyZ+Se71CYY?=
 =?us-ascii?Q?4ejaUmeFKMqszC0v3lSlO6838BIh+G2YjHOQnpHbBJ/XGhglt+vIWRgKBMN5?=
 =?us-ascii?Q?/GnbZgboX4uafU2snZV18jog1tHdyLv5scH8F7bJEZRLygUCeHHxWY1iziAu?=
 =?us-ascii?Q?rhzU5Ma8+aPlqPhsDg6SbSrMUsJcEoTNo5faCo0DlcnacloG23sD4W2x3yKP?=
 =?us-ascii?Q?yZKph3KiRlfyaRuBwbWd7/iYu7brjBeF6NrafMgIHzGkCPc/gkP6Hf8A3nM7?=
 =?us-ascii?Q?9LyQqjEfxPkSTM9V2P+evhsQOvdSltfCvWji+YxFRMwEyhw7ABcbVYM/r4s+?=
 =?us-ascii?Q?OKtlzW9chfdn3+mNvW9mc1kfzb2m/a6oe0run7NGMDOWpmeFEejEzL9uB9vv?=
 =?us-ascii?Q?PicxDC2P4QZrS1oe2NmYEUVyHfWtk8LEbo07bW0tHKRkci4DOfQrl7UjTBDN?=
 =?us-ascii?Q?eE0fCuMY8ubhKOZoqNs4uSBAqqbnDCHugw+3Sf+6qhWkH08Kr48dsbmEL2rn?=
 =?us-ascii?Q?9W3U4rWIrEgZTr3MwdShxiW6yNiemZOP0aaaXAQ8Mw4QsiPn6H2KhxQDf9uG?=
 =?us-ascii?Q?+jK3pV6l2pZhexOmNGy26WaEZBEm2pfJgvjhjaMJ9gb6OcY56khelZ7KtNY1?=
 =?us-ascii?Q?w2miHFA7nZotT4+xwalqc3Ji5V6iYOsEfeeTnHYlYNdMW+be9RjfzX28amMx?=
 =?us-ascii?Q?tHlf8M20690shvKyVyKdUeyrDekgWCgRzxiTZDFOdH5Sf2iJwsdMihJNevGX?=
 =?us-ascii?Q?3DkZ5IhRLX3e/gaGdDrP3fXIpd6Wj7lKoxSveqL2LyOGxJ9I7QNJZRHPAlCW?=
 =?us-ascii?Q?SEa/EFFC11SCoVJTgQiY7SPVLtMPrvxOl3rvEmjeWQ8DHBSpl54UjPZrmD/e?=
 =?us-ascii?Q?BZkB/nn7EH7RuDpxcvRdIzX5LFU9AEibrJfVmHHMOImK5oLAIKlBk1lafl1c?=
 =?us-ascii?Q?Gl81upW/vLoNzAupaEVPF8VWipYqTtpxqFXhWxUA?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 10334865-88ee-4a0d-8e09-08dc737e4e3e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2024 18:55:49.7761 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qdgTwfGncIOoPN9ndLgNMUZ3VfAeJSzJ6QGhUJFJGmJBhDA02ON4VFDuj2QeLmXkjdyJe2NkLSPsa2S7yB2JbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6904
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

A revamp to get some kind of standard in the various exported
functions in this library.

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 lib/igt_pm.c | 148 +++++++++++++++++++++++++--------------------------
 1 file changed, 73 insertions(+), 75 deletions(-)

diff --git a/lib/igt_pm.c b/lib/igt_pm.c
index 928b72685..2c91aeb33 100644
--- a/lib/igt_pm.c
+++ b/lib/igt_pm.c
@@ -454,7 +454,7 @@ static void __igt_pm_restore_sata_link_power_management(void)
 /**
  * igt_pm_enable_sata_link_power_management:
  *
- * Enable the min_power policy for SATA link power management.
+ * Enables the min_power policy for SATA link power management.
  * Without this we cannot reach deep runtime power states.
  */
 void igt_pm_enable_sata_link_power_management(void)
@@ -469,7 +469,7 @@ void igt_pm_enable_sata_link_power_management(void)
 /**
  * igt_pm_restore_sata_link_power_management:
  *
- * Restore the link power management policies to the values
+ * Restores the link power management policies to the values
  * prior to enabling min_power.
  *
  * Caveat: If the system supports hotplugging and hotplugging takes
@@ -566,8 +566,7 @@ static void __igt_pm_runtime_exit_handler(int sig)
  * Sets up the runtime PM helper functions and enables runtime PM. To speed up
  * tests the autosuspend delay is set to 0.
  *
- * Returns:
- * True if runtime pm is available, false otherwise.
+ * Return: True if runtime pm is available, false otherwise.
  */
 bool igt_setup_runtime_pm(int device)
 {
@@ -658,7 +657,7 @@ bool igt_setup_runtime_pm(int device)
 /**
  * igt_disable_runtime_pm:
  *
- * Disable the runtime pm for i915 device.
+ * Disables the runtime pm for i915 device.
  * igt_disable_runtime_pm assumes that igt_setup_runtime_pm has already
  * called to save runtime autosuspend and control attributes.
  */
@@ -683,11 +682,6 @@ void igt_disable_runtime_pm(void)
 	close(fd);
 }
 
-/**
- * igt_get_runtime_pm_status:
- *
- * Returns: The current runtime PM status.
- */
 static enum igt_runtime_pm_status __igt_get_runtime_pm_status(int fd)
 {
 	ssize_t n_read;
@@ -711,6 +705,11 @@ static enum igt_runtime_pm_status __igt_get_runtime_pm_status(int fd)
 	return IGT_RUNTIME_PM_STATUS_UNKNOWN;
 }
 
+/**
+ * igt_get_runtime_pm_status:
+ *
+ * Return: The current runtime PM status.
+ */
 enum igt_runtime_pm_status igt_get_runtime_pm_status(void)
 {
 	enum igt_runtime_pm_status status;
@@ -728,12 +727,6 @@ enum igt_runtime_pm_status igt_get_runtime_pm_status(void)
 	return status;
 }
 
-/**
- * _pm_status_name
- * @status: runtime PM status to stringify
- *
- * Returns: The current runtime PM status as a string
- */
 static const char *_pm_status_name(enum igt_runtime_pm_status status)
 {
 	switch (status) {
@@ -757,9 +750,8 @@ static const char *_pm_status_name(enum igt_runtime_pm_status status)
  * Waits until for the driver to switch to into the desired runtime PM status,
  * with a 10 second timeout.
  *
- * Returns:
- * True if the desired runtime PM status was attained, false if the operation
- * timed out.
+ * Return: True if the desired runtime PM status was attained, false if the
+ *         operation timed out.
  */
 bool igt_wait_for_pm_status(enum igt_runtime_pm_status status)
 {
@@ -791,15 +783,14 @@ static const char *yesno(bool x)
 }
 
 /**
- * dmc_loaded:
- * @debugfs: fd to the debugfs dir.
+ * igt_pm_dmc_loaded:
+ * @debugfs: FD to the debugfs directory
  *
  * Check whether DMC FW is loaded or not. DMC FW is require for few Display C
  * states like DC5 and DC6. FW does the Context Save and Restore during Display
  * C States entry and exit.
  *
- * Returns:
- * True if DMC FW is loaded otherwise false.
+ * Return: True if DMC FW is loaded otherwise false.
  */
 bool igt_pm_dmc_loaded(int debugfs)
 {
@@ -821,11 +812,11 @@ bool igt_pm_dmc_loaded(int debugfs)
 
 /**
  * igt_pm_pc8_plus_residencies_enabled:
- * @msr_fd: fd to /dev/cpu/0/msr
+ * @msr_fd: FD to /dev/cpu/0/msr
+ *
  * Check whether BIOS has disabled the PC8 package deeper state.
  *
- * Returns:
- * True if PC8+ package deeper state enabled on machine otherwise false.
+ * Return: True if PC8+ package deeper state enabled on machine otherwise false.
  */
 bool igt_pm_pc8_plus_residencies_enabled(int msr_fd)
 {
@@ -847,10 +838,10 @@ bool igt_pm_pc8_plus_residencies_enabled(int msr_fd)
  * i915_output_is_lpsp_capable:
  * @drm_fd: fd to drm device
  * @output: igt output for which lpsp capability need to be evaluated
- * Check lpsp capability for a given output.
  *
- * Returns:
- * True if given output is lpsp capable otherwise false.
+ * Checks LPSP capability for a given output.
+ *
+ * Return: True if given output is LPSP  capable otherwise false.
  */
 bool i915_output_is_lpsp_capable(int drm_fd, igt_output_t *output)
 {
@@ -887,14 +878,13 @@ static int igt_pm_open_pci_firmware_node(struct pci_device *pci_dev)
 
 /**
  * igt_pm_get_pcie_acpihp_slot:
- * @pci_dev: pci bridge device.
- * Get pci bridge acpi hotplug slot number, if bridge's ACPI firmware_node
+ * @pci_dev: PCI bridge device struct
+ *
+ * Gets PCI bridge acpi hotplug slot number, if bridge's ACPI firmware_node
  * handle supports _SUN method.
  *
- * Returns:
- * PCIe bridge Slot number.
- * Returns -ENOENT number in case firmware_node/sun is not supported by the
- * bridge.
+ * Return: PCIe bridge Slot number or -ENOENT number in case firmware_node/sun
+ *         is not supported by the bridge.
  */
 int igt_pm_get_pcie_acpihp_slot(struct pci_device *pci_dev)
 {
@@ -928,11 +918,11 @@ int igt_pm_get_pcie_acpihp_slot(struct pci_device *pci_dev)
 
 /**
  * igt_pm_acpi_d3cold_supported:
- * @pci_dev: root port pci_dev.
- * Check ACPI D3Cold support.
+ * @pci_dev: Root port PCI device struct
+ *
+ * Checks ACPI D3Cold support.
  *
- * Returns:
- * True if ACPI D3Cold supported otherwise false.
+ * Return: True if ACPI D3Cold supported otherwise false.
  */
 bool igt_pm_acpi_d3cold_supported(struct pci_device *pci_dev)
 {
@@ -958,11 +948,11 @@ bool igt_pm_acpi_d3cold_supported(struct pci_device *pci_dev)
 
 /**
  * igt_pm_get_acpi_real_d_state:
- * @pci_dev: root port pci_dev.
- * Get ACPI D state for a given root port.
+ * @pci_dev: Root port PCI device struct
  *
- * Returns:
- * igt_acpi_d_state state.
+ * Gets ACPI D state for a given root port.
+ *
+ * Return: igt_acpi_d_state state.
  */
 enum igt_acpi_d_state
 igt_pm_get_acpi_real_d_state(struct pci_device *pci_dev)
@@ -1155,12 +1145,9 @@ igt_pm_setup_pci_card_power_attrs(struct pci_device *pci_dev, bool save_attrs, i
 
 /**
  * igt_pm_get_autosuspend_delay:
- * @pci_dev: pci_dev.
- *
- * Get pci_dev autosuspend delay value from pci sysfs.
+ * @pci_dev: PCI device struct
  *
- * Returns:
- * autosuspend_delay_ms.
+ * Return: The autosuspend delay time in miliseconds.
  */
 int igt_pm_get_autosuspend_delay(struct pci_device *pci_dev)
 {
@@ -1177,10 +1164,10 @@ int igt_pm_get_autosuspend_delay(struct pci_device *pci_dev)
 
 /**
  * igt_pm_set_autosuspend_delay:
- * @pci_dev: pci_dev.
- * @delay_ms: autosuspend delay in ms.
+ * @pci_dev: PCI device struct
+ * @delay_ms: Autosuspend delay in miliseconds.
  *
- * Set pci_dev autosuspend delay value through pci sysfs.
+ * Sets the autosuspend delay value for the PCI device through.
  */
 void igt_pm_set_autosuspend_delay(struct pci_device *pci_dev, int delay_ms)
 {
@@ -1201,26 +1188,28 @@ void igt_pm_set_autosuspend_delay(struct pci_device *pci_dev, int delay_ms)
 
 /**
  * igt_pm_enable_pci_card_runtime_pm:
- * @root: root port pci_dev.
- * @i915: i915 pci_dev.
- * Enable runtime PM for all PCI endpoints devices for a given root port by
+ * @root: Root port PCI device struct
+ * @gfx: PCI device struct of graphics device
+ *
+ * Enables runtime PM for all PCI endpoints devices for a given root port by
  * setting power/control attr to "auto" and setting autosuspend_delay_ms
  * to zero.
  */
 void igt_pm_enable_pci_card_runtime_pm(struct pci_device *root,
-				       struct pci_device *i915)
+				       struct pci_device *gfx)
 {
 	int delay = -1;
 
-	if (i915)
-		delay = igt_pm_get_autosuspend_delay(i915);
+	if (gfx)
+		delay = igt_pm_get_autosuspend_delay(gfx);
 
 	igt_pm_setup_pci_card_power_attrs(root, false, delay);
 }
 
 /**
  * igt_pm_setup_pci_card_runtime_pm:
- * @pci_dev: root port pci_dev.
+ * @pci_dev: Root port PCI device struct
+ *
  * Setup runtime PM for all PCI endpoints devices for a given root port by
  * enabling runtime suspend and setting autosuspend_delay_ms to zero.
  * It also saves and restore power control attribute for all PCI endpoints
@@ -1234,11 +1223,10 @@ void igt_pm_setup_pci_card_runtime_pm(struct pci_device *pci_dev)
 
 /**
  * igt_pm_get_d3cold_allowed:
- * @pci_slot_name: slot name of the pci device
- * @value: value to be read into
+ * @pci_slot_name: Slot name of the PCI device
+ * @value: Value to be read into
  *
- * Reads the value of d3cold_allowed attribute
- * of the pci device
+ * Reads the value of d3cold_allowed attribute of the PCI device.
  */
 void igt_pm_get_d3cold_allowed(const char *pci_slot_name, uint32_t *value)
 {
@@ -1258,10 +1246,10 @@ void igt_pm_get_d3cold_allowed(const char *pci_slot_name, uint32_t *value)
 
 /**
  * igt_pm_set_d3cold_allowed:
- * @pci_slot_name: slot name of pci device
- * @value: value to be written
+ * @pci_slot_name: Slot name of PCI device
+ * @value: Value to be written
  *
- * writes the value to d3cold_allowed attribute of pci device
+ * Writes the value to d3cold_allowed attribute of PCI device.
  */
 void igt_pm_set_d3cold_allowed(const char *pci_slot_name, uint32_t value)
 {
@@ -1294,7 +1282,8 @@ igt_pm_restore_power_attr(struct pci_device *pci_dev, const char *attr, char *va
 
 /**
  * igt_pm_restore_pci_card_runtime_pm:
- * Restore control and autosuspend_delay_ms power attribute for all
+ *
+ * Restores control and autosuspend_delay_ms power attribute for all
  * PCI endpoints devices under gfx root port, which were saved earlier
  * by igt_pm_setup_pci_card_runtime_pm().
  */
@@ -1342,8 +1331,9 @@ static void igt_pm_print_pci_dev_runtime_status(struct pci_device *pci_dev)
 
 /**
  * igt_pm_print_pci_card_runtime_status:
- * @pci_dev: root port pci_dev.
- * Print runtime suspend status for all PCI endpoints devices for a given
+ * @pci_dev: Root port PCI device struct
+ *
+ * Prints runtime suspend status for all PCI endpoints devices for a given
  * root port.
  */
 void igt_pm_print_pci_card_runtime_status(void)
@@ -1361,8 +1351,9 @@ void igt_pm_print_pci_card_runtime_status(void)
 /**
  * i915_is_slpc_enabled_gt:
  * @drm_fd: DRM file descriptor
- * @gt: GT id
- * Check if SLPC is enabled on a GT
+ * @gt: GT ID
+ *
+ * Return: True if SLPC is enabled on a given @gt.
  */
 bool i915_is_slpc_enabled_gt(int drm_fd, int gt)
 {
@@ -1387,13 +1378,20 @@ bool i915_is_slpc_enabled_gt(int drm_fd, int gt)
 /**
  * i915_is_slpc_enabled:
  * @drm_fd: DRM file descriptor
- * Check if SLPC is enabled for the device
+ *
+ * Return: True if SLPC is enabled on the device.
  */
 bool i915_is_slpc_enabled(int drm_fd)
 {
 	return i915_is_slpc_enabled_gt(drm_fd, 0);
 }
 
+/**
+ * igt_pm_get_runtime_suspended_time:
+ * @pci_dev: PCI device struct
+ *
+ * Return: The total time that the device has been suspended.
+ */
 int igt_pm_get_runtime_suspended_time(struct pci_device *pci_dev)
 {
 	char time_str[64];
@@ -1438,9 +1436,9 @@ int igt_pm_get_runtime_active_time(struct pci_device *pci_dev)
 
 /**
  * igt_pm_get_runtime_usage:
- * @pci_dev: pci device
+ * @pci_dev: PCI device struct
  *
- * Reports the runtime PM usage count of a device.
+ * Return: The runtime PM usage count of a device.
  */
 int igt_pm_get_runtime_usage(struct pci_device *pci_dev)
 {
@@ -1455,12 +1453,12 @@ int igt_pm_get_runtime_usage(struct pci_device *pci_dev)
 }
 
 /**
- * igt_pm_ignore_slpc_efficient_freq
+ * igt_pm_ignore_slpc_efficient_freq:
  * @i915: open i915 drm file descriptor
  * @gtfd: open gt sysfs fd
  * @val: value to set
  *
- * Ignores/un-ignores SLPC efficient frequency
+ * Ignores/un-ignores SLPC efficient frequency.
  */
 void igt_pm_ignore_slpc_efficient_freq(int i915, int gtfd, bool val)
 {
-- 
2.44.0

