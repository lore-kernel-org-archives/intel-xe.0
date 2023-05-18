Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A5F6C77B7A
	for <intel-xe@archiver.kernel.org>; Thu, 18 May 2023 21:12:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 314F110E557;
	Thu, 18 May 2023 21:12:51 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13D8210E557
 for <intel-xe@lists.freedesktop.org>; Thu, 18 May 2023 21:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684444370; x=1715980370;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=lSYHxuEI4vbj1m3wJw+SXQ03NpUAZbKtIuv6iob40aA=;
 b=jRhfMQ9TSYvRHQhA731G1dRX1K3bhIpJPzPlldudxPIhCcGKZKBzu8iy
 R9Nybz7wWsCnJACYYpaoPA1K1bLiJ093oIhOovL2mO6J5EC3qsQdbIsy3
 V2ygsz6iA4sQWblsFggr9rRexPX0KRTZI/m3SRDPQeYqp2qUD7Xe0FN2A
 OrD9Xt+MTXcPk0KqJwnLInHvHoI3x5U9PbVEKZi0n3ooPKUEYx+Sd/VGG
 UIsHEHU5qXxXREdejYYytNz1NYbSisij/jGezdNgAmebsDDO3ne71IaWh
 aAcKSUzNpFV0SXcV+mj6wOYZHwHlaQXjygvqA+J7KLDBgNiyzeR/JFAOg w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="354541281"
X-IronPort-AV: E=Sophos;i="6.00,175,1681196400"; d="scan'208";a="354541281"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2023 14:12:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="735242327"
X-IronPort-AV: E=Sophos;i="6.00,175,1681196400"; d="scan'208";a="735242327"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga001.jf.intel.com with ESMTP; 18 May 2023 14:12:48 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 18 May 2023 14:12:48 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 18 May 2023 14:12:48 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 18 May 2023 14:12:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZPUtNZ+HKGDsOyRPA+oKuOmLc02zhkAZvXhEFjrtKHhwdb05Paf1SHFJpD0LF4HATrjqYXJoJDkBw6n/cQmjNXbd5B+zUXz8gMG6wo92XVBrw9mg3axeZagw6QjfKexMaIHXL82gXBA5m3dmXM7siMlY5kbu8QxdBNCL8ocrqucMkZ0GLnOidJwveqJ2jSVLl33inZp8abHhn0er/TPqHnVYk/TdqHxyLO+oUT6KUpU0F9nOcCdFlGfl2N2sZ9ghiTtS800ZMgLbG/Oz4SREi/1IWeZmyqfvj8ALbpv59JcPx2elvx3/dKnkY9Rt9PGVlRq8G5AEJ0T2iE/XmdqumQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hnoihjdtPYUk/RCwldWw3OAn0IfUxONvm4kcSM4LVLs=;
 b=XGZcztJ0b+D2Rmfud2IPcJYIYRQWs3ImutKhNXfGHFR+ZAhNuZBWh0FjGJMcpUup6HV8vTkKX1dsHlRaLBCVjIlZZO5ZyR2FfQN5ZxjdJVOM9MhFkuCw7hVOpB1onv3vSLUjNCvOx7sHiUlNDu1wrvB+Qo4sYtpb92nUNnnyw4YUCRcom2mjZBX4Xltw3YmrjwVnYeX9hMY5Fxz9xNT/1ISB6rR8B4nuw3UYA1AvtVJP/N+hH+8dtT+JFS2+I2nIoggLieZB3b0RfPFrnV2uZAH/3jfXVEFvDelupeywgDZ/aPw7HJ6owvDyBQ2NXXPnHu7cCfpzFyThZPyWPfN11Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MN2PR11MB4741.namprd11.prod.outlook.com (2603:10b6:208:26a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.19; Thu, 18 May
 2023 21:12:45 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004%6]) with mapi id 15.20.6411.017; Thu, 18 May 2023
 21:12:45 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Thu, 18 May 2023 17:12:39 -0400
Message-ID: <20230518211239.1993206-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517132115.GA130496@kav-xto-001.ka.intel.com>
References: <20230517132115.GA130496@kav-xto-001.ka.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0173.namprd03.prod.outlook.com
 (2603:10b6:a03:338::28) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MN2PR11MB4741:EE_
X-MS-Office365-Filtering-Correlation-Id: dacb2c75-39d0-4b53-e565-08db57e49fd6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Pp3qSXErcbJAw2KX78nfwN/u5zWBKX81lRFezsA8Tqa6u3eq2DCbYhwCfATn/VHq8I17buMqs1cUrpkVl5lDgWIKsLSwo5gYBH9mRUFtFgTCrbG8EcwMDWfuv6iWOQM+A8XGtyXnRWM+FauX6LqiadMdVDK7YBpNXKIuhLoMZbIhecnsBFLa05PfiiW3pncimm9Zn6ktoWbwjaa99hR0X1mLrFHnK/nTJB9pT/BJEpBB2qQk4+jEfIzidIJ9Ouejq6WXxBhWuQn4XThPUqVKT/hwly+psJHvJ6/3ppM/wgW9GxHIbc2lW8Yqi5pf7e5oDe+K4TbQaKjAyhTmZfZRI8C+RYGpnTNHYNu0D5VDNsIRUt+PX6XRXakuDe9os90dojSJQZWMaenX9gEnne0tsA1vx8bkITm3yjCaNqgqSIEXISUf8qMwdyTiax/7M3wCzWUTEXbK2yqJsGZM2i6Yq4gFb9cwc8plvqF2mM1flnMpRx8XuXt6U16AJKEaNHNLuMWfAAEUS7a678sMCK2P0OrsqNA0uPclZjcJV+s731o3AiW8hNzrQYb6UHlVFfhX
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(376002)(346002)(396003)(39860400002)(366004)(451199021)(2906002)(30864003)(478600001)(41300700001)(4326008)(6916009)(8936002)(8676002)(316002)(54906003)(44832011)(6666004)(6486002)(66556008)(66946007)(66476007)(5660300002)(26005)(1076003)(6512007)(6506007)(82960400001)(38100700002)(186003)(2616005)(83380400001)(66574015)(36756003)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bzE1S0xObk5UV0t4dmRxNWtVemFLL29CVlpUK0J4WGQ4WGt2dWdjbkxaMTgy?=
 =?utf-8?B?ZzRzZU5EaFAwVnI0VXo2WEpWR0xLOU5RR0w2cHVvRm1nM0ErK3g3R1NBOUla?=
 =?utf-8?B?VkEyQU1TVXpiL0JqQWN4OW0rT0hwYTc1dHpKOTBSYjJGenAxMndWeGFzNUNx?=
 =?utf-8?B?aU84Um01TlBoYXQ5VEY1eUJlSE9YVWZDajh1UDJKeStiTW9Xc2gvaHVhN2N4?=
 =?utf-8?B?d3A3RDhwaXZOK2puWnlibFJ3cm9FcHFIYkU2M3BIdXQ4Mkxsd0pFYWl6ZWJT?=
 =?utf-8?B?QVBKNktYM1p6UmFacjNsMndQLzIzdmhvYit2c3A1VjBtNjZlelhCcjNmUHht?=
 =?utf-8?B?QjdpY3BoaXZlZ05OUjJ3Y2E1VURxRms1TkEydUt4SzlNY0ZvWW9vZ25Mczg0?=
 =?utf-8?B?bkFXaHcyUFNucHA4OERPMndOeGVVUDJrWTNkdlJubG9tRDF1N1JicmlHTG81?=
 =?utf-8?B?YzFUWWlENVFpMUVJNTlvYStMS29zNEh4RWpkejFYbUwvUXQzblIzN2xRMmZE?=
 =?utf-8?B?eGZrQUlTUXAvQk9lSHdWMEgvRnRjWVVPTGxoZ01zN2hQeWdhSmFtVXZZMkNv?=
 =?utf-8?B?QkVVRGhYVkN6Y1JjNmZZWVV6ZDVkSzk0ZnlNY0xTZVVMUm9LT1RseXdaZ1lj?=
 =?utf-8?B?b2IyYldaMTBJaDdTS083ZWxIVzBqQVRNUDk1ak1JejhRTHdMQXlUb0NpQmFo?=
 =?utf-8?B?MVdxakNtb0hCNm8wR2tYcHMwMFRFSE1rWXp5NEszUkpHdDIyYTdDaXdsT3hu?=
 =?utf-8?B?bUJEUElZZnA4U0NESWJNSUxvMkZBNW9VYzljakVDZ0FacUkrQ2FJUUxTdTVK?=
 =?utf-8?B?NHFMZ3ZOeDNFaWFVaHFXZUN4WWNZTTRFdndZMjlhMHZmcWI1bmkvWElpcXY4?=
 =?utf-8?B?WmtXalhYZUo5NUlFeXBxY3RSZVkzNm9BRWpzcWI0a2liUTk5NkZSVmp1K29B?=
 =?utf-8?B?LzB6T1VrdzRaTyt3YksyZzRIdExtL01GbDZHMTl6NnRFSDdMVGxUNU1MU1A2?=
 =?utf-8?B?bE96YkVXMG9vRWNhS0NJcmhUWnZwT0Q3UlFlVWY4bDZ5SVJCczFhNnRHRnFF?=
 =?utf-8?B?NjVwQUsycER5Wkl1RVhSNDFqdnR5eGkwT012UWw5N0dMRXgyQ05nUzdDdU5N?=
 =?utf-8?B?OWNEWE5hMlI4djYybE95UlpJTFJha095U1grSHZsbkp5Uzk5R2hPZGNsSGpi?=
 =?utf-8?B?dW1LeU1Ua2FMSXVHdWpWVWdMYWVsUUR6OFNMcmpjSHhNZWNib2ptcUZ6QVVH?=
 =?utf-8?B?RVBjVFg4NWpOM25LOTNlck5SOFpYSHFCWkN4S2FSNTlNK2hCRG14bHpXWUFa?=
 =?utf-8?B?aEVwU3k0RXNCTmJ2bXFRTmZNaUF4ZCtIb0VXQzVXTzVXL25qWlczMko3Ukdv?=
 =?utf-8?B?VHVPUElrR2NEWTl3cFFOY2tpdGNvQW51VFBjTjdTbStqbU1yTnZrK2tjMGxi?=
 =?utf-8?B?YVlKRkxFeWRpem5zOEdwS3ZZTTZaeWpTaWI4b0dzT2R3MFpxbzFrVElIYnZR?=
 =?utf-8?B?SGxoOUZXSktFSS9yRExFTG1xMXUveGhlMUlacmMrU1RXTlBLYm5QNzFPUk1F?=
 =?utf-8?B?ZjcyaVBHYlZ0SW5oYzN1Y1N6MXVyRHlFVHFJbG9PcXNNbVk1dEloM3ZZN2xZ?=
 =?utf-8?B?R3YxN3BHT3VmdXg5dXJBYVF2RFp4b21kNnVrZ1VtOGYxbjE1UHE1TFRmN3N6?=
 =?utf-8?B?V05yRUt3ZjJxeW1YaFBNdEFwMVdaWVJrMUw1MWJqbkZRWEFIZmhGcVlaL3Rn?=
 =?utf-8?B?WFhNK01yQjdReEdrTnRtMjB3N2ZHcUwyNUw2dUI3c1BWQjlpRnBNaTBZYXBo?=
 =?utf-8?B?UnBZSUE1K042MzRkdmZoTFFSSFpLVWZIRnZRaitLVDlXdHA3bmF5b0RGQlJu?=
 =?utf-8?B?YTNQT2M2K3VKS2NnaFlYWU1VeVMzUGViK1hFZHVYM1EvVU5HeFRaYmdZcDE3?=
 =?utf-8?B?eWd2VzI0T0hGcG1qK1AvUzg3Y2szL3l2MXg2aWlHeGhCOXoyYXlkWmhzZStU?=
 =?utf-8?B?L3RncXdsWmZwREFHSUFwaXZHR01xSEtnM2x5L0hVQUo5SUhWOTBtUDRSZytE?=
 =?utf-8?B?L2lSMWhXT3dmc3EyL3pxNXpoNmR6ZmgrU2YwOEVFT1VMNVRrRTNORERVRDZs?=
 =?utf-8?Q?jiP/8U0toAmiqMFMzQIfzXlX/?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dacb2c75-39d0-4b53-e565-08db57e49fd6
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2023 21:12:45.1740 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sSJrAyFVRVEwDy931bcOdHVMFwGjUC6BYZzR9bblYeg7yZvmJ9DfpIDoGEASXak19kLZTkf+Rzoe8rdwh0Gn8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4741
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH] drm/xe: Introduce the dev_coredump
 infrastructure. 65; 7002;
 1c The goal is to use devcoredump infrastructure to report error states
 captured at the crash time.
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

