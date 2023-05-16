Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FF38C7EE2A
	for <intel-xe@archiver.kernel.org>; Tue, 16 May 2023 14:54:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63BC210E276;
	Tue, 16 May 2023 14:54:29 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9177D10E248
 for <intel-xe@lists.freedesktop.org>; Tue, 16 May 2023 14:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684248867; x=1715784867;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=TlyRtJHs/YcYhMUIiT8so4RDQ2JDM2BraqDs+RWpD5g=;
 b=BgrosbTNfJWJtmxKtC3SMZpIkXpvzvOBrvLtHi4UFwT7vCXSf623cmnj
 hYMtlS04FKkxhxhQDUREtAbh7081T7WYxINOsJXQ2A0LvH5/gKkHBKxXv
 W/ngLMIVl4GhZoRfb0d7peuQ73beaNgowT+g6QT/oS01c+ac4L4vgT+zf
 Enm9THaI27jeFGEUoOEKraUk8nUvrdKyUx56w39+J4GbpF1NK2LRxUSOz
 t22DBJg1SHQP47+3uO8nxMVTQpNWav/j4WHCSFm7kGdahDZ/7Q00h8c2y
 oHqjGTRqEbYtP0YPTBQEClRimubzpfy10OgsH7s3vP4jNEcztdOSvdXVa g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="379677037"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; d="scan'208";a="379677037"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2023 07:54:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="771094965"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; d="scan'208";a="771094965"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga004.fm.intel.com with ESMTP; 16 May 2023 07:54:26 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 16 May 2023 07:54:25 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 16 May 2023 07:54:25 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 16 May 2023 07:54:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bxC1JOroz2CMG5q2ihL8S6qKXnBXRAvR7sSurlTDFy0lOBG/4WVuZAmjWMY0o0Qz93Tx0Sj5H0XDlO9Yem/6//sjFYfC+GBk2ziLy5scIG+wvb+Ii7f5nUajpX6U0j/kn+vIPgwDHzJQHxjiiDSE01O8iXmngl1/dPUjrB1QkzsngwJTCsLJ+ikH3boWZW2QgQHDs9p1DcdA0AC+rciCv5FZG7BF4PBKgYBJa8E2ODcrKLBO2h89Kh8+IH5Hb3wwZWFuutuT2TUQhA8CCude/Mcj1oYxkeLS40gHeWY7+3s6/DL+b4LWyeozPyfUwbTHC1c/u74rzgp8gU97/VY7Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i0YxILbX67A2LOS55dcPclrkXimI1sHF/fNmj3H6Ask=;
 b=TKD0qwNRGtgKOZFQOJqwImmDnNepvpIAmzHvkSNfB4Xa0pkbl/yw17kSdw6A41/Gv+maK2XOmP2G2G3egkb0QebPDksMzw+MK/v/kK5qs2cIZYUQJ/vxZxzwa5W6RmnUCT4kGVtcXUEDvwhcus+6VvDGhHqeJsW7AO+6+pAN7lypGQogayOlUQAas1AQsbFMD5szsRIA6XVgte3AbLJf3sjOQjwYoNGfGaSbej0KATR8jRlyrCeByBlYvd21RU6lkPNI5v6K8csSI0jh7lvvzDXCPcE3KKOvnT4ouQ1OHNpWBsJLILuIQ0e6RLyGUOchFq+um+4/XQ25lJPFdkTyMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by IA1PR11MB6538.namprd11.prod.outlook.com (2603:10b6:208:3a2::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Tue, 16 May
 2023 14:54:23 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004%6]) with mapi id 15.20.6387.030; Tue, 16 May 2023
 14:54:23 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 16 May 2023 10:54:06 -0400
Message-ID: <20230516145416.1851984-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.39.2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR08CA0067.namprd08.prod.outlook.com
 (2603:10b6:a03:117::44) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|IA1PR11MB6538:EE_
X-MS-Office365-Filtering-Correlation-Id: 25b41625-85c0-4f0c-cce5-08db561d6fcf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dat9dYsqu4jjjrf2JYoOk6oIxxgpLlBkl8uH13r89jafcqvZWGNONWyGbkc0UujGZy/TCo7R7sqMF2Cp/Yv8DFPl8Pcar8SWodkm9M7dupgYS49unBJs+PnUCCq+YfSs98ZJ5NfEQLnOnOWozZNxrDUtkJ0o0OovO2kzEqjg/vPgaCdVND/NN0aj/Uw0tgJjKODSTQpfZaC0FKQCWdVc3r/RrAN+X8pZL/n/6GgGTkX/fmvqyfcYtK/b9Kmuml/R2gVJvLDThhZgw/mG9mpAcSxe8QYtd86u06BOwfqh0YPN7ldmMvnfY9uCDqUP+IfGapon5Tb3SiebMmZ21L3S8a7vsTdrIN4ViN4JrZmJsJKfrR2hWmO//NE2GwHik6TDl73Q4UdXjLY7t84PZnts7k6f95dT56ZEM1BLW+V60qR/TG6sUaLeuUVpzoT4spZd/HenqcAcea5eba83Zg4NqxpRmhog2NrtlyMX1x4UX1bPugoeK+I3PksC9PEjglE9NIIztPSTc1uxYZiMyRYcVSWXiRPHDKm+Qwz0wR0gEr4nkVaLE+1dGIW73UvITAvH
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(346002)(39860400002)(396003)(366004)(376002)(451199021)(44832011)(478600001)(54906003)(8676002)(86362001)(8936002)(5660300002)(36756003)(2906002)(30864003)(6916009)(66556008)(4326008)(82960400001)(66476007)(66946007)(316002)(41300700001)(38100700002)(186003)(2616005)(1076003)(26005)(6512007)(83380400001)(6506007)(6486002)(6666004)(66574015);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?by85VlpleldSbWNTM1crT2x2c0RHV0V5dEJxZW1sZ28xYkxKV3puMVg4bnBM?=
 =?utf-8?B?SUlmM3FCMXVmRHJqZEZzUktacHFYRDh2KzR0UGhwMWVaOXM1Z2d3Y0JWamdw?=
 =?utf-8?B?M29iK3BBZTdKeEZMWUFISk5wV3YvSmxUb0xQWWxVRUd2Rm9JVnF4YVdpTDBI?=
 =?utf-8?B?THlLRXgrdjh4R3dUU0ZDRWdqQkFsVUI2VExuYnRwaDFmRXByNzhGcWI4S25i?=
 =?utf-8?B?VE1JZVh1M1FUMnk5bjRuUGd1b09IZ2RHRkxhOE5Ua2w2eDdHdU1vOHFDNFhk?=
 =?utf-8?B?dTRxRUZwcjExSVdCNGdFbWVzNlBOR1RjU3p5cXZXanJEOCtNUVJ6dkVoVitJ?=
 =?utf-8?B?SjZSVnpua29kK2hzTmUrSUdVYjJNSW5jSERPcFVsMjlwTUdGc1h0RHMwajJX?=
 =?utf-8?B?K1hNTG9scklQRTFqbG5XdG1ROWV0R0FNQlc5T1ZlOC9HRCsrellWSlpkbmtT?=
 =?utf-8?B?NHRoVmluNjVwTVhkWm42NzF3N3p5OGtZMnVXS0owamczdmNsOURLMFJuZHVp?=
 =?utf-8?B?K3BEK2taak9CMnJxVlhId3ZpaE5BT25sOEw2SkRtcUFVK2ZyMFp3SUdGSnNq?=
 =?utf-8?B?WXUzZVVZRm5jVWpwUG44MHNic0I5NC8rdldVWlZzTDZpSHhFSVNMcEFLbFh3?=
 =?utf-8?B?TjR3Y0tKd05uU2lyM095M3VhVzVyTHdRQVI1d3lBdnhMaExDQXE2MUNDN2Zp?=
 =?utf-8?B?ekNzOVAvMVlhOGt2UFpBYUJxT3VwY1VUeGVKV2FGaUZoSC8rQUNSVlF6cDgv?=
 =?utf-8?B?NUN6OXhPejFCeTlQTkV4UG9xcDAyQmMwenBYVEMwRmowY1pYTmQvL256aHFl?=
 =?utf-8?B?dCtNL1pnSzRuUDdpN0QydW5yOHlWU1ZhUHJxZTB2TXc1WnRLRk5hQktzeVdK?=
 =?utf-8?B?Z0ZvdkprRDlFQkpzUUJ5VFh2K21GRS85T2VOYzRGQWk3Qnp1R3JBSXJuTWND?=
 =?utf-8?B?ZEdRdE1WS1VObmpwRTdKQnp6ZmV6NFZmMDNVMHF1Z0EyZUkydUNHQVBMaElO?=
 =?utf-8?B?Q3NZbERIL1BlNjBqUk5PZEdwa2YwYTlmYlMrQTRPZ1VVOUJNMFduNExCSEN5?=
 =?utf-8?B?U2tZcEZYUFBJLzNFRGc5S3NkVW5IQlRPVDVxeElUZmhYMGhiZEwxc0YvSFFP?=
 =?utf-8?B?dGNvUG8yUjBTZFYzYVVOaHlLcm9keGdzMDlDSDVzMlhmSisraHk5dzJEWlJm?=
 =?utf-8?B?RktUZXJsZXduWTIvNEF2bTBPTEJucVR3M3ZINWM2cUZjZm5zRGpxMGp5eDdB?=
 =?utf-8?B?a0hTdmZrdjVkc0Z3VlFzUWxsbmxENXU3WnNLdVFKcE1IOThlaVAvVFVXd0JB?=
 =?utf-8?B?Tno1eEpsRVdMbDFQTi9SZklRRlMvQ08vRjJmNTJWRDlDL1hJU2lHTVlxNXI3?=
 =?utf-8?B?VEFpbVF6b0NNU05CYnNKZmxNY2VwNXVjQnk3RzV4NHhKSFVxandaVElyNXBG?=
 =?utf-8?B?T1lpUDVpMEdvcUhJcmlKQmFxbHp5U0o2R3VUSFdLMk5kbW1UOTJqM1d3YU1v?=
 =?utf-8?B?RUVJcEUyRWJCd3FpU2tuV0FYcm5kTUp4NmlLMEo3ZnR5Zi8xZGQ5bUp4dWZQ?=
 =?utf-8?B?NWo4U2JFQ0g5TUV4b0ZDN1hmRjMvclZia2F2aVJLWnRreDlkRFB1aVcxcXpy?=
 =?utf-8?B?WTMvWU50MnBBZlozQXJOV3UzSWwzYkNDVHR0Y1EvZXFIQ3lVSGo1KzNCNEpL?=
 =?utf-8?B?SHdLMXd1L0x1Vk8rOUZsckl4di9pRm1Pb0l1VEx2NXVEUUdmeHpjZVBLbGp6?=
 =?utf-8?B?aHA5Ly9VNno2R1JxQzdod1V6SjhnRS9uQzJHZFYzYU5kM2FwZVNzbEFmZElK?=
 =?utf-8?B?Mnl4eERyQVFzTCtObmc5UFAvajUrNis5L1lKR1JaV3ZIdk96WDZ1dHlFUG92?=
 =?utf-8?B?d2d1MEVqSUhJc0FUWGhqZk9CcjZ2VVQwdHM0ZWpnWkt4SGlaMGNXWDFndmJ2?=
 =?utf-8?B?ZXdNMjViZUcwa2pzT0s3MUYvWUgxcTVSRnJSOUgramdUNStEeHU0TEswQXcy?=
 =?utf-8?B?T1hTY3Byb0c4MHZLdk82WUFKZzlXZndTSlVTM3RQTGRRcU5OdW5EZm5BcmZE?=
 =?utf-8?B?Skd2MnVKbzZxTzc5T0RPeVArSnVQeVVvNHRWVGYzaVhOUVZFcElSa1JqeHQ3?=
 =?utf-8?Q?mJ3BV7myX3MpZ6QxvQ4tQXhlg?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 25b41625-85c0-4f0c-cce5-08db561d6fcf
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 14:54:23.5942 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kPFQGsgc4WlxWlM7s3VOiuQg0pJXsgo/KYFmisr37A//BUmgMalHi+ldf2BMjx32Ku2OT9G+l+hmzEz2jKq6Zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6538
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v4 01/11] drm/xe: Introduce the dev_coredump
 infrastructure.
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The goal is to use devcoredump infrastructure to report error states
captured at the crash time.

The error state will contain useful information for GPU hang debug, such
as INSTDONE registers and the current buffers getting executed, as well
as any other information that helps user space and allow later replays of
the error.

The proposal here is to avoid a Xe only error_state like i915 and use
a standard dev_coredump infrastructure to expose the error state.

For our own case, the data is only useful if it is a snapshot of the
time when the GPU crash has happened, since we reset the GPU immediately
after and the registers might have changed. So the proposal here is to
have an internal snapshot to be printed out later.

Also, usually a subsequent GPU hang can be only a cause of the initial
one. So we only save the 'first' hang. The dev_coredump has a delayed
work queue where it remove the coredump and free all the data within a
few moments of the error. When that happens we also reset our capture
state and allow further snapshots.

Right now this infra only print out the time of the hang. More information
will be migrated here on subsequent work. Also, in order to organize the
dump better, the goal is to propose dev_coredump changes itself to allow
multiple files and different controls. But for now we start Xe usage of
it without any dependency on dev_coredump core changes.

v2: Add dma_fence annotation for capture that might happen during long
    running. (Thomas and Matt)
    Use xe->drm.primary->index on drm_info msg. (Jani)
v3: checkpatch fixes
v4: Fix building and locking issues found by Francois.
    Actually let's kill all of the locking in here. gt_reset serialization
    already guarantee that there will be only one capture at the same time.
    Also, the devcoredump has its own locking to protect the free and reads
    and drivers don't need to duplicate it.
    Besides this, the dma_fence locking was pushed to a following patch
    since it is not needed in this one.
    Fix a use after free identified by KASAN: Do not stash the faulty_engine
    since that will be freed somewhere else.

Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Francois Dugast <francois.dugast@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com> #v3
---
 drivers/gpu/drm/xe/Kconfig                |   1 +
 drivers/gpu/drm/xe/Makefile               |   1 +
 drivers/gpu/drm/xe/xe_devcoredump.c       | 128 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_devcoredump.h       |  20 ++++
 drivers/gpu/drm/xe/xe_devcoredump_types.h |  45 ++++++++
 drivers/gpu/drm/xe/xe_device_types.h      |   4 +
 drivers/gpu/drm/xe/xe_guc_submit.c        |   2 +
 7 files changed, 201 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_devcoredump.c
 create mode 100644 drivers/gpu/drm/xe/xe_devcoredump.h
 create mode 100644 drivers/gpu/drm/xe/xe_devcoredump_types.h

diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
index f6f3b491d162..d44794f99338 100644
--- a/drivers/gpu/drm/xe/Kconfig
+++ b/drivers/gpu/drm/xe/Kconfig
@@ -35,6 +35,7 @@ config DRM_XE
 	select DRM_TTM_HELPER
 	select DRM_SCHED
 	select MMU_NOTIFIER
+	select WANT_DEV_COREDUMP
 	help
 	  Experimental driver for Intel Xe series GPUs
 
diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index b6c41cd7dbe3..678c9d84e50e 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -34,6 +34,7 @@ xe-y += xe_bb.o \
 	xe_bo.o \
 	xe_bo_evict.o \
 	xe_debugfs.o \
+	xe_devcoredump.o \
 	xe_device.o \
 	xe_dma_buf.o \
 	xe_engine.o \
diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
new file mode 100644
index 000000000000..56cda4bf35d8
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -0,0 +1,128 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include "xe_devcoredump.h"
+#include "xe_devcoredump_types.h"
+
+#include <linux/devcoredump.h>
+#include <generated/utsrelease.h>
+
+#include "xe_engine.h"
+#include "xe_gt.h"
+
+/**
+ * DOC: Xe device coredump
+ *
+ * Devices overview:
+ * Xe uses dev_coredump infrastructure for exposing the crash errors in a
+ * standardized way.
+ * devcoredump exposes a temporary device under /sys/class/devcoredump/
+ * which is linked with our card device directly.
+ * The core dump can be accessed either from
+ * /sys/class/drm/card<n>/device/devcoredump/ or from
+ * /sys/class/devcoredump/devcd<m> where
+ * /sys/class/devcoredump/devcd<m>/failing_device is a link to
+ * /sys/class/drm/card<n>/device/.
+ *
+ * Snapshot at hang:
+ * The 'data' file is printed with a drm_printer pointer at devcoredump read
+ * time. For this reason, we need to take snapshots from when the hang has
+ * happened, and not only when the user is reading the file. Otherwise the
+ * information is outdated since the resets might have happened in between.
+ *
+ * 'First' failure snapshot:
+ * In general, the first hang is the most critical one since the following hangs
+ * can be a consequence of the initial hang. For this reason we only take the
+ * snapshot of the 'first' failure and ignore subsequent calls of this function,
+ * at least while the coredump device is alive. Dev_coredump has a delayed work
+ * queue that will eventually delete the device and free all the dump
+ * information.
+ */
+
+#ifdef CONFIG_DEV_COREDUMP
+
+static struct xe_device *coredump_to_xe(const struct xe_devcoredump *coredump)
+{
+	return container_of(coredump, struct xe_device, devcoredump);
+}
+
+static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
+				   size_t count, void *data, size_t datalen)
+{
+	struct xe_devcoredump *coredump = data;
+	struct xe_devcoredump_snapshot *ss;
+	struct drm_printer p;
+	struct drm_print_iterator iter;
+	struct timespec64 ts;
+
+	iter.data = buffer;
+	iter.offset = 0;
+	iter.start = offset;
+	iter.remain = count;
+
+	ss = &coredump->snapshot;
+	p = drm_coredump_printer(&iter);
+
+	drm_printf(&p, "**** Xe Device Coredump ****\n");
+	drm_printf(&p, "kernel: " UTS_RELEASE "\n");
+	drm_printf(&p, "module: " KBUILD_MODNAME "\n");
+
+	ts = ktime_to_timespec64(ss->snapshot_time);
+	drm_printf(&p, "Snapshot time: %lld.%09ld\n", ts.tv_sec, ts.tv_nsec);
+	ts = ktime_to_timespec64(ss->boot_time);
+	drm_printf(&p, "Boot time: %lld.%09ld\n", ts.tv_sec, ts.tv_nsec);
+	ts = ktime_to_timespec64(ktime_sub(ss->snapshot_time, ss->boot_time));
+	drm_printf(&p, "Uptime: %lld.%09ld\n", ts.tv_sec, ts.tv_nsec);
+
+	return count - iter.remain;
+}
+
+static void xe_devcoredump_free(void *data)
+{
+	struct xe_devcoredump *coredump = data;
+
+	coredump->captured = false;
+	drm_info(&coredump_to_xe(coredump)->drm,
+		 "Xe device coredump has been deleted.\n");
+}
+
+static void devcoredump_snapshot(struct xe_devcoredump *coredump,
+				 struct xe_engine *e)
+{
+	struct xe_devcoredump_snapshot *ss = &coredump->snapshot;
+
+	ss->snapshot_time = ktime_get_real();
+	ss->boot_time = ktime_get_boottime();
+}
+
+/**
+ * xe_devcoredump - Take the required snapshots and initialize coredump device.
+ * @e: The faulty xe_engine, where the issue was detected.
+ *
+ * This function should be called at the crash time within the serialized
+ * gt_reset. It is skipped if we still have the core dump device available
+ * with the information of the 'first' snapshot.
+ */
+void xe_devcoredump(struct xe_engine *e)
+{
+	struct xe_device *xe = gt_to_xe(e->gt);
+	struct xe_devcoredump *coredump = &xe->devcoredump;
+
+	if (coredump->captured) {
+		drm_dbg(&xe->drm, "Multiple hangs are occurring, but only the first snapshot was taken\n");
+		return;
+	}
+
+	coredump->captured = true;
+	devcoredump_snapshot(coredump, e);
+
+	drm_info(&xe->drm, "Xe device coredump has been created\n");
+	drm_info(&xe->drm, "Check your /sys/class/drm/card%d/device/devcoredump/data\n",
+		 xe->drm.primary->index);
+
+	dev_coredumpm(xe->drm.dev, THIS_MODULE, coredump, 0, GFP_KERNEL,
+		      xe_devcoredump_read, xe_devcoredump_free);
+}
+#endif
diff --git a/drivers/gpu/drm/xe/xe_devcoredump.h b/drivers/gpu/drm/xe/xe_devcoredump.h
new file mode 100644
index 000000000000..854882129227
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_devcoredump.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _XE_DEVCOREDUMP_H_
+#define _XE_DEVCOREDUMP_H_
+
+struct xe_device;
+struct xe_engine;
+
+#ifdef CONFIG_DEV_COREDUMP
+void xe_devcoredump(struct xe_engine *e);
+#else
+static inline void xe_devcoredump(struct xe_engine *e)
+{
+}
+#endif
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/xe/xe_devcoredump_types.h
new file mode 100644
index 000000000000..52bd27ca1036
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
@@ -0,0 +1,45 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _XE_DEVCOREDUMP_TYPES_H_
+#define _XE_DEVCOREDUMP_TYPES_H_
+
+#include <linux/ktime.h>
+#include <linux/mutex.h>
+
+struct xe_device;
+
+/**
+ * struct xe_devcoredump_snapshot - Crash snapshot
+ *
+ * This struct contains all the useful information quickly captured at the time
+ * of the crash. So, any subsequent reads of the coredump points to a data that
+ * shows the state of the GPU of when the issue has happened.
+ */
+struct xe_devcoredump_snapshot {
+	/** @snapshot_time:  Time of this capture. */
+	ktime_t snapshot_time;
+	/** @boot_time:  Relative boot time so the uptime can be calculated. */
+	ktime_t boot_time;
+};
+
+/**
+ * struct xe_devcoredump - Xe devcoredump main structure
+ *
+ * This struct represents the live and active dev_coredump node.
+ * It is created/populated at the time of a crash/error. Then it
+ * is read later when user access the device coredump data file
+ * for reading the information.
+ */
+struct xe_devcoredump {
+	/** @xe: Xe device. */
+	struct xe_device *xe;
+	/** @captured: The snapshot of the first hang has already been taken. */
+	bool captured;
+	/** @snapshot: Snapshot is captured at time of the first crash */
+	struct xe_devcoredump_snapshot snapshot;
+};
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 6490a04614ce..197ee4090fed 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -12,6 +12,7 @@
 #include <drm/drm_file.h>
 #include <drm/ttm/ttm_device.h>
 
+#include "xe_devcoredump_types.h"
 #include "xe_gt_types.h"
 #include "xe_platform_types.h"
 #include "xe_step_types.h"
@@ -55,6 +56,9 @@ struct xe_device {
 	/** @drm: drm device */
 	struct drm_device drm;
 
+	/** @devcoredump: device coredump */
+	struct xe_devcoredump devcoredump;
+
 	/** @info: device info */
 	struct intel_device_info {
 		/** @graphics_name: graphics IP name */
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index e857013070b9..231fb4145297 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -14,6 +14,7 @@
 #include <drm/drm_managed.h>
 
 #include "regs/xe_lrc_layout.h"
+#include "xe_devcoredump.h"
 #include "xe_device.h"
 #include "xe_engine.h"
 #include "xe_force_wake.h"
@@ -800,6 +801,7 @@ guc_engine_timedout_job(struct drm_sched_job *drm_job)
 		drm_warn(&xe->drm, "Timedout job: seqno=%u, guc_id=%d, flags=0x%lx",
 			 xe_sched_job_seqno(job), e->guc->id, e->flags);
 		simple_error_capture(e);
+		xe_devcoredump(e);
 	} else {
 		drm_dbg(&xe->drm, "Timedout signaled job: seqno=%u, guc_id=%d, flags=0x%lx",
 			 xe_sched_job_seqno(job), e->guc->id, e->flags);
-- 
2.39.2

