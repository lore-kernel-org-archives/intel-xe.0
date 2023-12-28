Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B588C46CD4
	for <intel-xe@archiver.kernel.org>; Thu, 28 Dec 2023 02:13:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54E9010E1EA;
	Thu, 28 Dec 2023 02:13:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2877C10E1D6
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Dec 2023 02:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703729577; x=1735265577;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=v/01swfr9SS5Tb3N0wdHRgXVT6wWLEhOVvTt58nR7LI=;
 b=Cg9xnKLNRYyvDgEq4HUDpZJ/TaxvH9yoSAHlrshaKLJJaSxqHIzw9yI4
 H6XqdjBjmdqj/ioZ6QUD6NKlKnOYBqgbY5uJcE/buInBxbMgDUngW7Bg0
 7uBG7db6bFH0m2c5Uzp47l91SUlhYf+jI82ZqaIPGf36aWtpaS02nKJRH
 H6c7xmCWdrXg5nDi/QNDeXTepJ0obZErzLZnvtIBQEd0RCipUGsX13nRz
 PzDU6Q6kGdO+UOODjDH2zfwnLqz+4yhLqJ4DnsLdWU+vN/dix+mPC/V6s
 LCG3wZxVkVTCaJhvqx5QFhNO5Jh8yNlk6lRcc5Oxs6gtUy7QHE+odXtVr g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="386934784"
X-IronPort-AV: E=Sophos;i="6.04,310,1695711600"; d="scan'208";a="386934784"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Dec 2023 18:12:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="901843305"
X-IronPort-AV: E=Sophos;i="6.04,310,1695711600"; d="scan'208";a="901843305"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Dec 2023 18:12:48 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 27 Dec 2023 18:12:47 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 27 Dec 2023 18:12:47 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 27 Dec 2023 18:12:47 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 27 Dec 2023 18:12:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lXV1CX2DFBUkbe1+TGu77e5aw60J3hpFSiIiZ8WNNSALhCtDwy0GbFdSW5Bthw0mGvKDut/nDt190mSRe1ueCEL72NbNaDpn2QE+854a9pdmW++DqII8HsdxdgHL2Nx0NWFoHJbnBKLzJ8AenS2S74Fy3h55Zi9NVC6fLVFuIaKfbkq1c4DdH5QInTU0//ku3dDan7mGGf8kvb4M1SquhqM32t3WXybZ1NV16TjhGJGijJN/sMjDkJF+RPs51tlmHzv4kd9zeb2/ktnO7aNH3seisG/EzQlOaCUIn3onvABZYtlm6QAsUGFd/GuFttKN/c6fuHEgPG6Yz7xNpwECPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F476DvhOkH6KhERCO6LWxbZ4Ci3Ud0vYL/bezyht4lc=;
 b=VQuOP300UWPbWchOvHms7pJh/8jhVA78pfYW4o5zgmpyICRQSWFcRsFYVnsavWVeNlMzewcXHiHmoT2jQ8vFMieqRsQSt7CLdp93f0lb0e2Ks3yS9uFbtgNEDuhhYGIQW08YQAge/K3iCLQB4HC/tIfnfcRMX02SiDGauMV3hJGXSCoG5s8gcPZFv3NQXUH+lw+JvLdKWMp4TB/zmo2IMM/oE2l/440f4019ZUkkK4wjQwmEkxpDy/MfGBcWRS5T4t/iHKagHpuQK9JVy6k3uCwVQXIAgXtVUiB9zSBzQEwUL+1QNYrM0oJvkRfyPccz8S7fZJc8yrFHmcLz5AaXKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CO1PR11MB4833.namprd11.prod.outlook.com (2603:10b6:303:99::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.18; Thu, 28 Dec
 2023 02:12:40 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7113.027; Thu, 28 Dec 2023
 02:12:40 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [RFC 00/20] First attempt to kill mem_access
Date: Wed, 27 Dec 2023 21:12:12 -0500
Message-ID: <20231228021232.2366249-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR06CA0001.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::14) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CO1PR11MB4833:EE_
X-MS-Office365-Filtering-Correlation-Id: e1a00b3a-aedd-4ae1-4d00-08dc074a77c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: w++PX9u/XzUkGuS6OpOQv51pxUi63pJV1rfsBYulLOwo7cRYoFmaV87D9kLCAlLmYgClVGeweKSJ0b8jSQJJowNZ67oWpa8dNkSrOJYM4ziclAzpdicgN+f9x/U1+5v2QMSlyDREUjzFzlQoZWAAqXrmcoCKRGnn5FezMc9/goNNJqaS+FpOU/cSam2Kzn09K3eH29CzIaTWB3iJ8OGiDZb1Nr5HpPd71a/QjCdQvgQwPGc6W8iHwd3oj8k1oxDLUp0Cm35Is8ZgVnfQidYhFAddg/m0S2IiRMoNy/lJ1Sl0kQNwLagKAF+Stae1me1GXlKf466xf4/Gy56W6GUv5P3NcFVFrCx7i93oQPVOQ47Uh1sxD9GdHHLmFNlXAsq4EiwdoBo3ZPhQPuPEHiMkBKTaaY4mGm2A1I/qN90DNAyl4zh8RY7l0z0kEXYZvjh+4zbT6y3Y44sNbiTc9Yi+5oiD6ZCl097K6LUYac7Uz+qTCXbyoRCIu5yYr6lyvB+6mwhL6GsEhJ+8aFB4MmLv8yJHy95lQAkiLErWCKNEm5aHSjRj8PD5hG4ZcL6lQhZO
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(136003)(396003)(346002)(366004)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(107886003)(2616005)(26005)(1076003)(6666004)(6512007)(6506007)(83380400001)(6916009)(478600001)(4326008)(5660300002)(8936002)(8676002)(44832011)(6486002)(66556008)(66946007)(316002)(66476007)(38100700002)(82960400001)(86362001)(41300700001)(2906002)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YDM+Euhhwt/t07DynT+vkiGWHWoaVF25gM4GmFMjApVgVwm0dq8K8zisyOJX?=
 =?us-ascii?Q?PycTWUScaaVGt7fBdxVLIgIACJUXHMuOl+o72TWWS5mt/csk7AT2g8mFpYBR?=
 =?us-ascii?Q?DWLVX/xN+P9Kja06MpOGrT5+iESrzNc8XZe0DL2VaZz+hGeVb3tf2oCiuxCR?=
 =?us-ascii?Q?aVge0wqWCcj/PneOgh3wdPn0EM+D7mehflvxiZgS0Ok/7ocr3UutRjLwebLp?=
 =?us-ascii?Q?LXdjFHZad/8O8HI5qKF+2iO80bYCuA+C3nQoNtd61sx3WKfpS7z9T5VuXo4S?=
 =?us-ascii?Q?316jTGiqWdJnL/gIU+LflkVPVkhT8mlDeiHavml4Fz2ie9Kfw3X24sRAGCvK?=
 =?us-ascii?Q?0VL1S4vw45cWWskQEwieoZ6ZLodnzeYAlCGe21IDkUm4oglgevu6h9vGuGZt?=
 =?us-ascii?Q?q0u1eolbIEoGCy/xaQIY9k1U0DryOIz7wKIW7LDftU5Sr0Q9uk8N+5u/f+sw?=
 =?us-ascii?Q?dfUGNPWy2224iOPOLZSHh47TYWTC6SmY+jQ/FJ7fTmGK/BIOctayuyS/bEZW?=
 =?us-ascii?Q?jAuZG8MYZc2RUtG6ViMHmmWK1fRsIWtyGFyAAV8H9LKOMLnHJAsB0ySGJ81Y?=
 =?us-ascii?Q?fMUPk+gJw5kayMDYxaIC19ahX4uWEYy/y0p5JEyQFrK/CcSqqoyJ6xF8OxXM?=
 =?us-ascii?Q?rrJfblxWOU+bJq7UQHEubHdaWfnRdlbmckNQdOo2LDWLzYWaSdd05NlNyTyq?=
 =?us-ascii?Q?AHQyJDoce9rljcMDPgnUk/uKfnt1fTvQJEIw8nxZZXMAsfwzOYwl0Z26yucC?=
 =?us-ascii?Q?FfA/rL267l/jE4bH0LprGb5W3fxv4IokoMJpjF8Pz9hVje0v6gN+uMjYwTs2?=
 =?us-ascii?Q?soXM/OWoFGcFr8u7AdmBSBToZQFvUFTRYfDyN3fT5itutNNZJ/ZXFaJRnlRM?=
 =?us-ascii?Q?RPG/4aATII35jXKI9jPcA6ifocYxUgN7Y2hvP62nVFKYoO71ibi8nI8EnIQ4?=
 =?us-ascii?Q?0micFTNDmz6GL06JDTN6pzTMdKKaP1EtswqiDoomjreZfXS8wrF51oojbROd?=
 =?us-ascii?Q?h9IBUhpwHLkasjtpHvTqbowCjW+IzEYdTypGvTHk2rEjyeOPyWJJK64mTXLM?=
 =?us-ascii?Q?RX10BeOhf51hIjFQilcRSKeDh09G3RjRShErlOOanlxi8njRKKmVIbrMqRbO?=
 =?us-ascii?Q?+fr1Ts3wfwE0v9riRQhqLyYy7vsvUrHxrMWVEflO3i0qE9iiEiSrpAaHRi8Q?=
 =?us-ascii?Q?BIHCe9hFFkn0UIROtbRrw9ZavYh5FUwdqDPRsxodvgE+5vco0sKTFiDnxFNZ?=
 =?us-ascii?Q?ILjX1p7jmrcboWBTa3xJopKckvMByR6zY58D8v++Jz55MDMhv2gK9H9zDVNI?=
 =?us-ascii?Q?Y68oM2JOJMpFFFlTANu8ZV6J2GK710Ymy/oC3h20oC/jn5afJNGXLVeXPZQv?=
 =?us-ascii?Q?W8k+XwodBR+JgXb59eKSncsu2Jz2cYfaB5kwdiU+/YHHXgcoumurtvpZlDAA?=
 =?us-ascii?Q?etRo8fcrMgD3B28cWZaunJF/+PX5KUA7Pqb+twSebiaK9H1VE+vvLjuKFEeE?=
 =?us-ascii?Q?fqSQFSo9jE/U6heoowTz0OnLaXhF97oFOsO1nvm4LpQmpp0OwmtG/60ODG+H?=
 =?us-ascii?Q?C0k0/mbXvEQnc9NfNazDSdq7VIKpDHuGOMbfzjB/?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e1a00b3a-aedd-4ae1-4d00-08dc074a77c3
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Dec 2023 02:12:40.0597 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OFkKEg/49KuO7+I5W/ira8BIoT3ZCyeNA5b9BZ72qHJ/30dXHbU1TB//APgk5D5QUQjDV19KdLuAqCeqmKDZHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4833
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

At first the mem_access seemed a good idea since it would ensure
we could map every memory access and apply some workarounds and
then use that to ensure that the device is awake.

However it has become a nightmare in locking conflicts with memory
locking. The only sane way to go is to move the runtime_pm protection
to the outer bounds and ensure that the device is resumed way
before memory locking.

So, this RFC here is the first attempt to kill the mem access and
have a clean rpm handling on the outer bounds.

Well, at this time we already know that we need to solve some TLB
invalidation issues and the last patch in this series needs to
be split in smaller pieces. But I'd like to at lest get
the discussion started.

Happy New Year,
Rodrigo.

Rodrigo Vivi (20):
  drm/xe: Document Xe PM component
  drm/xe: Fix display runtime_pm handling
  drm/xe: Create a xe_pm_runtime_resume_and_get variant for display
  drm/xe: Convert xe_pm_runtime_{get,put} to void and protect from
    recursion
  drm/xe: Prepare display for D3Cold
  drm/xe: Convert mem_access assertion towards the runtime_pm state
  drm/xe: Runtime PM wake on every IOCTL
  drm/xe: Runtime PM wake on every exec
  drm/xe: Runtime PM wake on every sysfs call
  drm/xe: Sort some xe_pm_runtime related functions
  drm/xe: Ensure device is awake before removing it
  drm/xe: Remove mem_access from guc_pc calls
  drm/xe: Runtime PM wake on every debugfs call
  drm/xe: Replace dma_buf mem_access per direct xe_pm_runtime calls
  drm/xe: Allow GuC CT fast path and worker regardless of runtime_pm
  drm/xe: Remove mem_access calls from migration
  drm/xe: Removing extra mem_access protection from runtime pm
  drm/xe: Convert hwmon from mem_access to xe_pm_runtime calls
  drm/xe: Remove unused runtime pm helper
  drm/xe: Mega Kill of mem_access

 .../gpu/drm/xe/compat-i915-headers/i915_drv.h |   8 +-
 drivers/gpu/drm/xe/display/xe_fb_pin.c        |   7 +-
 drivers/gpu/drm/xe/tests/xe_bo.c              |   8 -
 drivers/gpu/drm/xe/tests/xe_migrate.c         |   2 -
 drivers/gpu/drm/xe/tests/xe_mocs.c            |   4 -
 drivers/gpu/drm/xe/xe_bo.c                    |   5 -
 drivers/gpu/drm/xe/xe_debugfs.c               |  10 +-
 drivers/gpu/drm/xe/xe_device.c                | 129 ++++-------
 drivers/gpu/drm/xe/xe_device.h                |   9 -
 drivers/gpu/drm/xe/xe_device_sysfs.c          |   4 +
 drivers/gpu/drm/xe/xe_device_types.h          |   9 -
 drivers/gpu/drm/xe/xe_dma_buf.c               |   5 +-
 drivers/gpu/drm/xe/xe_exec_queue.c            |  18 --
 drivers/gpu/drm/xe/xe_ggtt.c                  |   6 -
 drivers/gpu/drm/xe/xe_gsc.c                   |   3 -
 drivers/gpu/drm/xe/xe_gt.c                    |  17 --
 drivers/gpu/drm/xe/xe_gt_debugfs.c            |  53 ++++-
 drivers/gpu/drm/xe/xe_gt_freq.c               |  38 +++-
 drivers/gpu/drm/xe/xe_gt_idle.c               |  23 +-
 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c     |   3 +
 drivers/gpu/drm/xe/xe_guc_ct.c                |  40 ----
 drivers/gpu/drm/xe/xe_guc_debugfs.c           |   9 +-
 drivers/gpu/drm/xe/xe_guc_pc.c                |  62 +----
 drivers/gpu/drm/xe/xe_huc_debugfs.c           |   5 +-
 drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c |  58 ++++-
 drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h |   7 +
 drivers/gpu/drm/xe/xe_hwmon.c                 |  25 ++-
 drivers/gpu/drm/xe/xe_pat.c                   |  10 -
 drivers/gpu/drm/xe/xe_pci.c                   |   2 +-
 drivers/gpu/drm/xe/xe_pm.c                    | 211 ++++++++++++++----
 drivers/gpu/drm/xe/xe_pm.h                    |   9 +-
 drivers/gpu/drm/xe/xe_query.c                 |   4 -
 drivers/gpu/drm/xe/xe_sched_job.c             |  10 +-
 drivers/gpu/drm/xe/xe_tile.c                  |  10 +-
 drivers/gpu/drm/xe/xe_tile_sysfs.c            |   1 +
 drivers/gpu/drm/xe/xe_ttm_sys_mgr.c           |   5 +-
 drivers/gpu/drm/xe/xe_vm.c                    |   7 -
 37 files changed, 445 insertions(+), 391 deletions(-)

-- 
2.43.0

