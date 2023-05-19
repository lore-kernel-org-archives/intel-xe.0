Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BD6BC77B75
	for <intel-xe@archiver.kernel.org>; Fri, 19 May 2023 13:18:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AD3110E05E;
	Fri, 19 May 2023 13:18:37 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0766C10E0C8
 for <intel-xe@lists.freedesktop.org>; Fri, 19 May 2023 13:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684502313; x=1716038313; h=from:to:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=ZChyEBGVkU00UG8MSQZg3x9yckS8RlMe3bmJHuch1mI=;
 b=b19+3bS6bfzR+mwbET6EqTfBki5NHtfT57FwLRndi1S8XI8cy0Jq6Wfh
 LUVswjrGaiiEyz1pIyumIsubX+EGGAnlqFUL3XexvtqfpQDyrRAkkzb9W
 u8PEkI2x3oc+qdeR8FGCF174azDYdSmo+s+h2rN0kprrpT1OCqWF65AWX
 o/MscKx3iANPH4VanH0OdKf8g3E9IQSEmkI3hzkaxk2wupf/6eLLY+dj7
 lZtscdaI3KB9mkoGoyjQy4hLLvwUcjgZvLpw9UCXzIW7s7xCaeCtXaKgM
 4ZgZEMtUNxZYb2yRYyCQxYV6wHER3G3osvg/ZtA1LsDYIQQNzwuAHlHsW w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10715"; a="332733922"
X-IronPort-AV: E=Sophos;i="6.00,176,1681196400"; d="scan'208";a="332733922"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2023 06:18:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10715"; a="705615758"
X-IronPort-AV: E=Sophos;i="6.00,176,1681196400"; d="scan'208";a="705615758"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga007.fm.intel.com with ESMTP; 19 May 2023 06:18:32 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 19 May 2023 06:18:31 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 19 May 2023 06:18:31 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 19 May 2023 06:18:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J7StzrnT4skMOvdcr1G+W8m54bkyzPxCqlC263s4sHqVs/BHPwMMOJzeimYY29F7GXGE5SnBO1LFyMSD0Xh9UpU/vafap+uLEPq+olE4tginmoGqzHubI1wzH72HXlb9aKDxgSli9rl3BDOPDYQWcuwFthOHZ5M0csIQXpXGOLjjzXg+P32zOeOOeGnrML/t6H3xB0+Lc/OtbLtTWRy5Hi8apoMFFC1UCpj22UpE7p1RE5+uy5Sguk4PKRmdH+sqFw4Y5rNoEKZGJMv9G2xe1YJ+J6DjzfDq7NBuj7kQyOJU47hiPoISq5w7YADFvy4ZJvjeOHrmoRyITwKUTCSxeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y+wE6zXH+Kg1J5XpjOEybKbkFQQi0Gfp0pjUyP5nkG8=;
 b=czUjM1j97NK0dlBXQXsdlDIUa/Sgem9CoZhgXdq01+FXJI96uXrE2RzeLLIMq7/m92ajHdqObCCbvXNTjfciqvSdTaQm3Ygpy3OYJsDUZgWsgxej0tSGVpptv/Qcz6hTyq48nCgFowPyiXOJPkz2HGpYEYUQCdfPkqAgWq3PIxA2PXWtb0KsrGwbiybFlZfAurxfuBG+X293NdbE1z/De2cKw7w1n0rEfAV11+nKmhpSH5Lf7JzxAeq90+Nhw1VeHoDXWNgtdh3ySn2A5EUS0uC9/eyRIIVlDPudEx66T+d8ukWZPyHOGQRlzRf5P7OBwDNEpxYE4DvRH1wAis2qrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH0PR11MB4790.namprd11.prod.outlook.com (2603:10b6:510:40::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.21; Fri, 19 May
 2023 13:18:24 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004%6]) with mapi id 15.20.6411.021; Fri, 19 May 2023
 13:18:24 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Fri, 19 May 2023 09:18:10 -0400
Message-ID: <20230519131820.2020660-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.39.2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR01CA0060.prod.exchangelabs.com (2603:10b6:a03:94::37)
 To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH0PR11MB4790:EE_
X-MS-Office365-Filtering-Correlation-Id: 52a97eb4-c9d5-486c-f5c1-08db586b8604
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eSGfvBfxk08vukU7bW62fShBWPzy0b3rH4xGGRdEjEAsoIaoO8U4QYYatAyFZGy29tuYAXhfwzpfES0KLqI7bsYMkbGl5qSq4T6bBx6cTETBxgyzweqd1OFS2Uk81OYk3ntioKvrNgklyZe25euFYtX1SkWA94Aj1dXRWOifpUlQ+M95PpAsY9W2+TZf3ixHhuOOImNAH9XfWgMkFVCw5SJlhLZn2hiMoQ2iba2KmwMl6dMdj9bLP9zihcqErsKt33hn8ZOFI9RSu06ge3yHzjmjFA9Ej/ztmjLEJUBR3STI+eeqpDl7aDvMwI6cv6BxcWmMXoHBYjVKOZK/FxJEipUFna2m5peEMPTIhrxIor6WJutwLKjOXn0azQVIjff5BAVxx2ehw7STGw7HdMDof8a124HrTIrBereMUmZNVeStiIzZXJ2vjTRx3hYhFW6sO7+iYOnACGEJZcZqzMpt9HsmlXH3IZaotak/PZmeSLH4jk0vMX0V7lUqA1gsH2l7JboG6qSBgqkF8u2+gzNRY6790um0a52a6h16a+YeFXXPvtUk0PIfhd7ZZl9WYywT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(396003)(136003)(39860400002)(366004)(376002)(451199021)(82960400001)(38100700002)(36756003)(86362001)(44832011)(8936002)(5660300002)(8676002)(2616005)(6506007)(1076003)(26005)(6512007)(2906002)(30864003)(478600001)(66556008)(316002)(66946007)(6666004)(6916009)(66476007)(186003)(6486002)(41300700001)(66574015)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N0xUT2hzWGpVUjRQcGd0REh1ZGZCckFwUEFvVTVpVlRGWG9WNGVmQmpSdmln?=
 =?utf-8?B?ZU56U2pYZG5TUUVCTVBUdHdCMFZwSHI2UytKSFRYRnpqOFl5YmRHZjlNSFdh?=
 =?utf-8?B?L0YrQjh3Sjh3QmN3SElUdktWQXhRdEJkVEpUODR5b2xwdnJQOXozWmlMQmQ3?=
 =?utf-8?B?emVuZGFQNTJIcStoWG9valU0VWQxNlUyd1ZvdmpTNGpDaHB2SDNycjNrTXI0?=
 =?utf-8?B?UGZZa0U1WTFUYmZHYktTT0FPcDlNTGt6MnI4RnVwemdCV1VLREFMeEpHcC9r?=
 =?utf-8?B?eWsxMFNnbzBhNThTVnlsa2p6MkpJaEROaFdMaTRvZ0xrTUNBMk5iL2haR0Nl?=
 =?utf-8?B?clRjTzZiaTd3QitYTW5CV0VERjdQUmxWTkl4eDZTWUdLczI4ZUdiMW1Camxa?=
 =?utf-8?B?WG10Z2Mxcm43ZSszU0VqWlVIajdCT2Vpb3hCMU9kN3hOQjlhUDc4a0x0ckNl?=
 =?utf-8?B?YlBaSGxkdDdVcUpuWEFZK044U2ZYcGlKUWx1R3FnandZUXUwOEU2eDViT0Rv?=
 =?utf-8?B?L3hkRVk4S0RCMmJ0Q3BYZlBIaGJOcm9kQVMwMWlaaUhoR3NydnpFdVRMb28v?=
 =?utf-8?B?YUFZS3pyUElSYnpGYUMzN1NRYmowVDFRUitRSDhFVmU3Y0tNUm1EVjVyeWpm?=
 =?utf-8?B?TVFHNVVwUmFtVkZURVJRTnVwN0tJZURwbEsvNkdiNy9qb1ZLd1luaVI4Zis0?=
 =?utf-8?B?K29xRmllcVRQdjBHNGw0bFBRWFFFZHNZNjJXT0hteG5TSXJuVUpTTHdadzJt?=
 =?utf-8?B?MlZ0WDVZcE1XZVlSbDljN0dSdTJrQXUrak9qTkNqaHVZU1dxbmV1QmJ2ZTc5?=
 =?utf-8?B?Y1g5S0ZRVTA4Y3F6MUIzTVVobVkvNFFRWG9Jd014dEp0cVdjQkwwNzA3cVBC?=
 =?utf-8?B?M2NxYWhOTVZZVzRkQkkydFdWZG0zeTl1UVJ3WmVUQURwbG42M0RGRldJKzBG?=
 =?utf-8?B?UU0xRjdsZ2lCaW9DZ3BvZXV4d1diWlZDTkFzSmhxamhqOGZxeXNHMkIzVzdS?=
 =?utf-8?B?bzFRaDZ3bHZybUdKQmkvRE9qQTdJaE9YQXEzVUdpdThXaWFwN1J1TWdjSUpN?=
 =?utf-8?B?VzdnaFowbmJLUDBIUWNlYzlmQ2lzL0hUcFhFcHp2ZmVldEsvMlovR2xMY2R0?=
 =?utf-8?B?YndpaDVJTFRwUWVucmhvVHRidFJ6SU1ONDFVRTZrZGdTVjZZOEJMYkNPYzF6?=
 =?utf-8?B?VnpKTHUwamJCU3JQNzhwam04SnIyeFRUTDJKK3JLdDd2QXo3ZVhvVWdmd1Mr?=
 =?utf-8?B?SnhDb1dZNFNNbFR6U2haOGwzQTUzSnV0QmJyN3Y0am1acVdaR3luejMzVUdv?=
 =?utf-8?B?TVlVZFQvMG9ZUTZCTDF2VVpVQmt3MEhkREo1bzlPbE5VUXhXN0Y4MGlXcXpG?=
 =?utf-8?B?WmJHbnpCSE5yT0ZsUTlMV2JFelpKNkl2UFNSZm1kYjY1Y0FwbWpFRWdoMTVF?=
 =?utf-8?B?SUlHRUpwa21hWGJYMnpwVnY1NWVsdEVuYmRWcmxkNHgyZHZiWi8zL0d1L0l5?=
 =?utf-8?B?U0IwemZqc1VMakRSWGhReG9VZmozWW5RcC9uWGQ2YUFqNmJCbHZRM3lXcmlV?=
 =?utf-8?B?c1MrZnd6by8zTmJpWkQ4LzJpSTMzODFYT1BsVkZGWHovQVp3TUpTc1Z3dFgy?=
 =?utf-8?B?UGdjRHhlNUtiWTNBSWpxbUtLcXpHVTJ3aDlXYklIdi9rbHZQeVhZZ0VJRGds?=
 =?utf-8?B?SVlzMDhjalpmTHJET0NCUGUzM3ZoWmY5L3RXTkcyeCtrU1JOYXg1SlU4UklV?=
 =?utf-8?B?MTBvRW9jNzk1Q0pTcm8wbWlYSzBCUTk5UXRIck5qUmZlMGtHbGorUW9wR2pu?=
 =?utf-8?B?SGszMDJaUmpuRjd2ckxCNjhaSWtGMm9LbVRYM0U4UUNtTEtlZ1pBTlI4c0Jo?=
 =?utf-8?B?M2VrV0JHT3AxZjd4cmlMNE81ZWo2NDVia2JkeERKd2VWUDgxenB1REJ1Q1JL?=
 =?utf-8?B?c1pQZ3lYZTlYWG1oQmFqRUxBajlIREMva2NUV2V6M0hXWFJsU1AwQzBmSjZt?=
 =?utf-8?B?Sk0rbjNMLzhJZlBJcGFCVUNUakEzRHZMTnBvSU1VZkR2R1kxektTK1lRcjN6?=
 =?utf-8?B?bkhiSFozQ1IwL3dwT0s1Ymo5azZPaWViSDJpaExaVGNhVUVseHg3T3hneDN4?=
 =?utf-8?Q?Cu5O5pfQRjASYbCwaRdRZ5Sse?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 52a97eb4-c9d5-486c-f5c1-08db586b8604
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2023 13:18:23.8977 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c4rCxSqvWhOERxIi19dtdSDNNr78fNragHlaH2IuTi4BDv/uqK3bLyd3dMGKZ72rggPdUgGITN2yzMuMu9r+XA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4790
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [CI 01/11] drm/xe: Introduce the dev_coredump
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
v5: Fix Uptime - ktime_get_boottime actually returns the Uptime. (Francois)

Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Francois Dugast <francois.dugast@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/Kconfig                |   1 +
 drivers/gpu/drm/xe/Makefile               |   1 +
 drivers/gpu/drm/xe/xe_devcoredump.c       | 126 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_devcoredump.h       |  20 ++++
 drivers/gpu/drm/xe/xe_devcoredump_types.h |  45 ++++++++
 drivers/gpu/drm/xe/xe_device_types.h      |   4 +
 drivers/gpu/drm/xe/xe_guc_submit.c        |   2 +
 7 files changed, 199 insertions(+)
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
index 5418281b4f89..cd1614b68734 100644
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
index 000000000000..561db73a3c8c
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -0,0 +1,126 @@
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
index cbd18b839236..77d1cc6514c4 100644
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

