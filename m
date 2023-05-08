Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DF00C77B7F
	for <intel-xe@archiver.kernel.org>; Mon,  8 May 2023 17:06:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD51810E0CE;
	Mon,  8 May 2023 17:06:52 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BDA710E0CE
 for <intel-xe@lists.freedesktop.org>; Mon,  8 May 2023 17:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683565611; x=1715101611;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Zs3xxUzvm54tgydLFPLp5jojbYoUbSURYJVAbNUcjUw=;
 b=L1NMQcdNDGxc4bRf1kzsAskQZh0SUR6L3eVWDXj0lnMCSu2x9Q8HnIJR
 wU+q/uTe8qjKgxR04qXhsSwL19VHUnrGLaQp5oljmJtOpJFE2ChZoOF/P
 HC4L7kpeVEE1tOnQYYSbtQhu5am++tHOAlNFx14+bGssEb67YsxGbsJNJ
 ekgT13oj4PkhdoBWzGFUOTe/3WuNIskZdjRurgBdDorwiz9GIuajRfafW
 vg+79PQzspP9gXkXQLJIbC+BeG6Mlgkct+kQ7NWeH/rNV1wuPxNMBE/tJ
 28Gz5nJG6Adl+bwMrmWtWYUJw2bm0F+K3C5+Sws+p5k6JmucjVjWU1Vwd w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="412963280"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="412963280"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2023 10:06:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="676122821"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="676122821"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga006.jf.intel.com with ESMTP; 08 May 2023 10:06:35 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 8 May 2023 10:06:35 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 8 May 2023 10:06:35 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.104)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 8 May 2023 10:06:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SWdxa0p4P85Zl/ws99zRA6dJmQ2qZKRQ+3GvMPMsQQeDvREw+/1vLugkE/Be9BxbE79ci8R32xq90O8fxuDhSTr8vVUEOug7eahUfURGvdgNaCDdRJ9e168MK/KXiLal9XJ7gW81186d1QHeKcd9j4g8H+XsHFPaxLbTduRkEdw9ndWMvy6GqOY0AeOIJD/sxPszd3Hjwunv15L0qukdWQGlVaT7jvfwdAqhjMt9/avDYt4AGcjvd3STJfksZO2yhBzxcLqqVN5IobvFFNkw4lfQDMm3h7l2lKTyGLQ1ccjCmZ0+kJdHcHY2TNOU0mesDUTRszM3vejM86KmXn6VRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AomLR5VC/2oGcyzyYS2luM/jiYB1yWsHDzsIwffKg+Y=;
 b=SlbrReEMAURf9mhC2r3RtGLvWFw16mfzcTG02HWp6cWywAQSzdSUe3c7XgIiDF9RAKjdDX2JSygUy/Y0DxN9bzKq7h4HJpAFGQrx6QOmlOyCgSfR9E6g60Dka4xhN5R8aPcLcFvarlu7Q8/BXYNBLGDm82I/HRp0GA2KJjy7665lBRgLa/m20TtIgsUZSfcPzfHJsFBuohJX2tYULFEePHSW0vUW8vmjgChrxwb75hXdVNz6cwnL7eb0awjZUMUY+a00EKUmocCoGmFqsOqGgkyz2+7fH8G6aG5ZcfZ0Ga5djKeTw/lu5JqnFGVqaYHZgfFJXbQFVZm4Ibxz9FBKAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CO1PR11MB4913.namprd11.prod.outlook.com (2603:10b6:303:9f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Mon, 8 May
 2023 17:06:32 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004%6]) with mapi id 15.20.6363.032; Mon, 8 May 2023
 17:06:32 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Mon, 8 May 2023 13:06:06 -0400
Message-ID: <20230508170616.1289914-2-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508170616.1289914-1-rodrigo.vivi@intel.com>
References: <20230508170616.1289914-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR05CA0030.namprd05.prod.outlook.com
 (2603:10b6:a03:254::35) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CO1PR11MB4913:EE_
X-MS-Office365-Filtering-Correlation-Id: 5014cf96-04e4-42f5-286f-08db4fe6926d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jWoCAKeka4kBgWbnpmDfNFhy8sHwZ8MZZMeMLZncTA3zq2HhV/dARZSQLPKJJmBiyUiFHZ3yavfmcWKuDuDr5EaPUBv1OmHC0+FSwTsgm2XwGAiyz28ld1/SGngRD60bpFm5t1HP+fiGT8IHsP8lWtuAYnCFZbKr6VMe8S8Qxb0F5GDNz+wWJleM7Ux66eyC2t5slB/G4u+S/PIlrmOW8C5G5bgd0XARK8k/ZIWMSaMkncvhKdmQPDd00ALDFoNjmYb37mOdFOB2/6zgR7zG20xAYoJbRA1Nzi18+YFTf020oUzZWF0sIx1LTpTtlaSK0Ab9q/qi831KbYNOllWMk/ZQ1zBkl12o27ZMd1WSWFV00eYwavnMqfrCpauFuGR6McEza03zVEJ1nfmde/Nb8yshghSwt9EijUgVg0ju1lLPmqAsP1BYVLmaLet1tgK6iUcb7nghf+qw2hb5Za0oKWJZ9viF769xirD2hWpdRe9Q7rKLCqDQbMit9S4k4QdrJhUxslCNsiSzGkZWbI4BArERZM+/lm03Co3dcRF52OH41QZU7OK6+LerFOTyY5Ji
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(376002)(366004)(396003)(39860400002)(346002)(451199021)(30864003)(54906003)(2906002)(8936002)(316002)(478600001)(8676002)(4326008)(66476007)(6916009)(5660300002)(66556008)(41300700001)(6666004)(44832011)(66946007)(6486002)(1076003)(6512007)(26005)(6506007)(186003)(82960400001)(66574015)(2616005)(36756003)(83380400001)(38100700002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?emxac3pXTnRUaWJlOWgyaG9YUjI5eU5KanBhK0VmdHlWNGJmZTVIWDRLNHlx?=
 =?utf-8?B?WnRLdFl3TzVWb1VUd2EzakFwVVFEaE8xT0hxR0ZrakpvY21qeVE0VkJ1RUlG?=
 =?utf-8?B?R3EyVm9YL1F2a1plTlMyNVVrVTNkczMzNGZGVElpZ0hVY1pYUGZmenlLQllY?=
 =?utf-8?B?VjZNZnovYktoZkRlR2RQdUdoVllsZitnZkdkRmVMdmczallYZnZTb0tyVVJF?=
 =?utf-8?B?TGZJYk5CZ0NicVhxUGpLQ1R6enN5UGpwSk15RGk2K0lveTVGNGI1L05pWGVD?=
 =?utf-8?B?dTl1c2NqS0NFSU1jTURhQ1VnODFkWC9KS1EwU1drUHd4TXFvTEMvUDBKS0tp?=
 =?utf-8?B?cFpMOHJWRWorcnZwTnllVUsrdVlGdlF6Q2FoTS94UWRoU014Qit6Vm1KTVVN?=
 =?utf-8?B?L2JZQUoxd1ovcFdZTDRwVHo5OEpVUldETG52L2NJenRZSVZMaGkrMTkxOTFR?=
 =?utf-8?B?d2g1SnlYVHR1RmVKK0kzTFU4cXE4b2lwTVAvU3ora2dtQnh2clRkamZ1MkFx?=
 =?utf-8?B?TmFZMGJ1THM1anpBZmpEcld6QUhvTlNGRVo0SUZYVGtiZ3ZOSktYdURRRUw3?=
 =?utf-8?B?TEh5M3Y3Zkg1bE4rZktCa2xjUUV4a3luZ2hxOTBhVXNlNW5OV1l6c0RVR2ha?=
 =?utf-8?B?NTY3djFwSUE1REw1N2RsQldrYXlITEpQL2NJanRaNGM3ak91VDBLcDdqSXNs?=
 =?utf-8?B?YlJMR29vckhYZEtMMVpVbWN4dmVoSVlwQXhzRytyMmVPcHE1MDdPOFdKdGcw?=
 =?utf-8?B?OXFVTU5CRFp5MWFEb0xOVWltcXVPS0paK3Z1VUhKYjdvbDV4NGRkWVNXNTlU?=
 =?utf-8?B?TEREMzlEU1FaU2pCbWY3RjAwWDlXZHBOSSt6WWpjQVZHdUNxdUhIT0RKN05z?=
 =?utf-8?B?S21TNklscTVwWG1aUmwvYmc0cXNtenJVd2tMOXUwNVIxVGV5R1Z4a2RXR1ZJ?=
 =?utf-8?B?dkpyVkFFNytkRksza1lweW9vcG9PUUthV01aUFh4cjkvazcwV0NHTzJiSkJJ?=
 =?utf-8?B?TGpUd2NRUlpSblpLUjU3eFJ4V2ZYN3RFNk5QYjJDL3ZyTXllUHR0NGw2Vitl?=
 =?utf-8?B?b0ZqR3YyY21iR3V1a3BHSDJVbmc3cG53MGVZNzVLK05jRTRlc0szTnZkRjVE?=
 =?utf-8?B?WjFIMVZOTkxORnVGS0J4Y0JlNFd2WUpWS2VmcHJ3NDdlS2dCQi9lTUZoYU11?=
 =?utf-8?B?cU16TW1vd3gxWmQ1WEhOczdjcEl0T3dwaWJIMjlMQ2paWlY2dDROYWpTdFhI?=
 =?utf-8?B?WVh5T2MrRGQwQ1lsS1lTcVdYd2lKUE9SV3g0cCtyMTRoZC9XSHJEMkV2bFNW?=
 =?utf-8?B?NlB1YS9nQ3VVcUlQNDk3R1dxUTVuVno1V0xhRXdxeFhicEU1Z2NPeXpUM3FD?=
 =?utf-8?B?cmFGQ29wMGZLU2puek5wSG56Zm55eDJLWmNadHAyUGx0NkpIWjhsaWVkUC9L?=
 =?utf-8?B?Qk9uUG9jUlFvN3RHelk3dHIrdWwwbUpwMm9jMVY0ZUlMc2xFSXdOWll6RlRp?=
 =?utf-8?B?ZTN5ckxSOGUraXFDMnNIaU93MVRYZHE3ZnVSQUtwZjFPWEpqRUpFWjIvOE5m?=
 =?utf-8?B?RWl0R1o5eEN5MXhFblp4cnpiV2hNYUd3MXppMHBjeXhLamg3UlRvYkdJL01N?=
 =?utf-8?B?ZWJ6ckdXUHlZSHFjWi8zYS9OUFU5UE5aYUlJY0VJSUJUc1BJbVR2dnF1ZVh4?=
 =?utf-8?B?UzZlLzZhVFM0eGVkQ3JnQTFxWW9WQmFkQ1lXMHkvdU5jbitrNThmUHluMldn?=
 =?utf-8?B?QVVNUG43VTRZanduYUxRVHZPa09SRldiRllVYjFQY3ArZTdEQlNLZnZ1UDNU?=
 =?utf-8?B?UTJUam90SkZTYzZqcjQwQmtFMnZSNGZHODJYOWJxSUhDUkU4a2Q1a2UzQU9p?=
 =?utf-8?B?clQvQjdQWERyb1krYUwxS1djb0VvRVdwdzJNOCtGTWNuQUx0NUEyQVQ3bjNB?=
 =?utf-8?B?SFgrdjdDdG1IeTk1cFp1RDlrUk1DcVJLWENBckUrVGZOTzBZK2YvSFJvaC8v?=
 =?utf-8?B?VjRnRGtBRTBNZUZ1OVhrVk9ndjB1eDJEczJhOUZRbk81L1Y0ZXpSYkFUNzRl?=
 =?utf-8?B?dGdpZzdDcTVPWExiUitlRU0yVEo0Zk9yR0dVOWxVMXpnN1F3NERsVHNreGdp?=
 =?utf-8?Q?kZgFC5TZr2nVnOcScBNlSyfCz?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5014cf96-04e4-42f5-286f-08db4fe6926d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2023 17:06:32.3064 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zs0uoimFv0zfmEtL/2D7QOwXicMNU8cPR7A2bRrFxxGrRNGNUKyU0HYoLgd2EliStCAdHBYquMfKp6PADEyZvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4913
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 01/11] drm/xe: Introduce the dev_coredump
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
work queue where it remove the coredump and free all the data withing a
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

Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/Kconfig                |   1 +
 drivers/gpu/drm/xe/Makefile               |   1 +
 drivers/gpu/drm/xe/xe_devcoredump.c       | 150 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_devcoredump.h       |  22 ++++
 drivers/gpu/drm/xe/xe_devcoredump_types.h |  47 +++++++
 drivers/gpu/drm/xe/xe_device_types.h      |   4 +
 drivers/gpu/drm/xe/xe_guc_submit.c        |   2 +
 drivers/gpu/drm/xe/xe_pci.c               |   2 +
 8 files changed, 229 insertions(+)
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
index 000000000000..132b72be4777
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -0,0 +1,150 @@
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
+ * information. At this time we also clear the faulty_engine and allow the next
+ * hang capture.
+ */
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
+	mutex_lock(&coredump->lock);
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
+	mutex_unlock(&coredump->lock);
+
+	return count - iter.remain;
+}
+
+static void xe_devcoredump_free(void *data)
+{
+	struct xe_devcoredump *coredump = data;
+	struct xe_device *xe = container_of(coredump, struct xe_device,
+					    devcoredump);
+	mutex_lock(&coredump->lock);
+
+	coredump->faulty_engine = NULL;
+	drm_info(&xe->drm, "Xe device coredump has been deleted.\n");
+
+	mutex_unlock(&coredump->lock);
+}
+
+static void devcoredump_snapshot(struct xe_devcoredump *coredump)
+{
+	struct xe_devcoredump_snapshot *ss = &coredump->snapshot;
+
+	lockdep_assert_held(&coredump->lock);
+	ss->snapshot_time = ktime_get_real();
+	ss->boot_time = ktime_get_boottime();
+}
+
+/**
+ * xe_devcoredump - Take the required snapshots and initialize coredump device.
+ * @e: The faulty xe_engine, where the issue was detected.
+ *
+ * This function should be called at the crash time. It is skipped if we still
+ * have the core dump device available with the information of the 'first'
+ * snapshot.
+ */
+void xe_devcoredump(struct xe_engine *e)
+{
+	struct xe_device *xe = gt_to_xe(e->gt);
+	struct xe_devcoredump *coredump = &xe->devcoredump;
+	bool cookie;
+
+	cookie = dma_fence_begin_signalling();
+	mutex_lock(&coredump->lock);
+
+	if (coredump->faulty_engine) {
+		drm_dbg(&xe->drm, "Multiple hangs are occuring, but only the first snapshot was taken\n");
+		mutex_unlock(&coredump->lock);
+		return;
+	}
+	coredump->faulty_engine = e;
+	devcoredump_snapshot(coredump);
+
+	mutex_unlock(&coredump->lock);
+	dma_fence_end_signalling(cookie);
+
+	drm_info(&xe->drm, "Xe device coredump has been created\n");
+	drm_info(&xe->drm, "Check your /sys/class/drm/card%d/device/devcoredump/data\n",
+		 xe->drm.primary->index);
+
+	dev_coredumpm(xe->drm.dev, THIS_MODULE, coredump, 0, GFP_KERNEL,
+		      xe_devcoredump_read, xe_devcoredump_free);
+}
+
+/**
+ * xe_devcoredump_init - Initialize xe_devcoredump.
+ * @xe: Xe device.
+ *
+ * This function should be called at the probe so the mutex lock can be
+ * initialized.
+ */
+void xe_devcoredump_init(struct xe_device *xe)
+{
+	struct xe_devcoredump *coredump = &xe->devcoredump;
+
+	mutex_init(&coredump->lock);
+}
diff --git a/drivers/gpu/drm/xe/xe_devcoredump.h b/drivers/gpu/drm/xe/xe_devcoredump.h
new file mode 100644
index 000000000000..30941d2e554b
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_devcoredump.h
@@ -0,0 +1,22 @@
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
+void xe_devcoredump_init(struct xe_device *xe);
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
index 000000000000..3f395fa9104e
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
@@ -0,0 +1,47 @@
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
+	/** @falty_engine: Engine where the crash/error happened. */
+	struct xe_engine *faulty_engine;
+	/** @lock: Protects data from races between capture and read out. */
+	struct mutex lock;
+	/** @snapshot: Snapshot is captured at time of the first crash */
+	struct xe_devcoredump_snapshot snapshot;
+};
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 3a11caaf874b..c6b7ef9ca2dc 100644
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
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 855cf8557056..dd8bc3490ef8 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -16,6 +16,7 @@
 
 #include "regs/xe_regs.h"
 #include "regs/xe_gt_regs.h"
+#include "xe_devcoredump.h"
 #include "xe_device.h"
 #include "xe_display.h"
 #include "xe_drv.h"
@@ -655,6 +656,7 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 		return err;
 	}
 
+	xe_devcoredump_init(xe);
 	xe_pm_runtime_init(xe);
 
 	return 0;
-- 
2.39.2

