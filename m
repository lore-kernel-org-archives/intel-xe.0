Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B31A2CD5BC9
	for <intel-xe@archiver.kernel.org>; Tue, 19 Sep 2023 14:24:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EF7810E27A;
	Tue, 19 Sep 2023 14:24:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB22E10E27A;
 Tue, 19 Sep 2023 14:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695133484; x=1726669484;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=/fhY75GCSPYlKbXSj3GUrv1Eob0VxnCW/qOZaz6OQmc=;
 b=YQlHE0Z6Khzxb5YE1BeehgnRqnpgkKMWDoovKhOUwzRGP9hgpWaJ5d/6
 waUcIKu83vtgpKBaPkQMq9g8/b1ivP81LZSl8cC3AAUUmgoCMr7Wlbqkx
 a4/TzELZBuHiDRc1HgGSvl7QtanOWbKwW37Sw8yw6GWqX4iGwr9OIBJZ+
 iOQTnk45h8sCLXzSpyHjIifjNx0fnu9cvW6oyZYutgxN9cuVTja663RyU
 niC3UgR2qt9nnzLLdss4coLw5pNlV2tl6SmlipHMH6A0Qjk8daMf5dmIE
 3chnpbDXgE5ZKw7wNz6zibAAwtOYTDyONoeCgknUevCvoFCqHzm+k5RyZ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="379856125"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="379856125"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 07:24:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="889518902"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="889518902"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Sep 2023 07:23:57 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 19 Sep 2023 07:24:43 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 19 Sep 2023 07:24:43 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 19 Sep 2023 07:24:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KEwSkK2kpePzHzqVS7syWkQhx5oRREmPPFUdTaNEMGtx8UKBSUtuHfUJYXMtuzpvV7X4JEKwywsEjqZObW6X1O0MM8AuZPoDWYmKhn7pzkoB7rea4lJFOlIHUAnqDxDUBRYSbgIjWX1vgrtO2I59fw1SFD2n3k6bfwZpqJIxQw3AvZM4cHn4mvXGAmxcjIph7g+4WAS+Zh1vAxddE7StFNxRU1t5zvCc4QKeYQq9ZyGDKZoPpqI/XX9dM1Mis+LAvjnGSMAEYVrx5mmT87YLuEK35rFwpNbrqBhrP3JnD/bBKqAKLpjxqQVHm78TAwolDTU4jbQq/Y2G7PMHKHknZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ySgTBjbGiGmffdSsiWsvj1FERjbl54I8wPgEN26+Q2I=;
 b=YPtEdTCSH7ahHlkpknOkXAKtcMpINdoBR4WpNUAJfnqyYNlhgIwaSlYPGpxZ9BrZMpSyOl1o0OqcsISAAk/fYMQIfuY8HdL/7NkMk7x3dgKG+PjK84FTulcC8yuyuh/9TDUKZhz3yCfJ6Iv9QMo5/7sZlwXQmGZKlckuWMp819lWAvtRssDeBa56wPzztZz74OtUb1ap6Wpxxi1KIfz++/TpuIqaLPV/96jpR59uJYWsOFkXBemO6SIY/JFJ2VSC19JGM1laaLOH3bBCDjN9rclzaptfCJJntHjriUIHfolqgRBCPSELdJks4nosomFKRji/ZzC9jybomqhWZIMhnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CH3PR11MB7914.namprd11.prod.outlook.com (2603:10b6:610:12c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Tue, 19 Sep
 2023 14:24:41 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%6]) with mapi id 15.20.6792.022; Tue, 19 Sep 2023
 14:24:40 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>, <igt-dev@lists.freedesktop.org>
Date: Tue, 19 Sep 2023 10:19:43 -0400
Message-ID: <20230919142000.91363-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR07CA0107.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::48) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CH3PR11MB7914:EE_
X-MS-Office365-Filtering-Correlation-Id: 53415941-d701-46ba-858f-08dbb91c28f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2d2EGECdv8SxpoTSbVQbJICTm6SvPvXR7nLX18Z/jxoDCu3O1WXnDX0xvkR4T6zkqvTY6HxQs0Jf2eZLIqi0pE4RFN5iXrmSxs/J+alJ72tkC8dNWEp1iiC3dUvpC+OO8hEEg4W5xWxO1Lf87sATGVVrcbPFWPXvMPx2aZwuG0wLeF9qg6BZGThslBvDqvfiQRS43zXVVK8W8tZZFSPoaVENpbRymFrRwuVhZkVof6nJy0Et9ldb5ZKXQm2h3zpCQA93QPz/4mgKHz6j5hoMM32+E9X6X9to3Viizt16tA39rZxEpEz7ivXPCnouJ2lWMhDdRqcPJJ6e9+X4C3ogCjVOQHwHh3XlnthjJJ/WHlScxEP7wqLtU2qWJNIHVLbCAQGqgD+sq5jOaaJex5dDMrSk5m66RdSgOeMTBRU1tm/prQFpK3mQhKJKqqe2BlHEcsu9mjAgAqqqPrDpz69Pq0S3ZTmq3EQXxZV8D2/XkmKp2MIGqmBOgnByBnWyRipqVmlzI5C8ENZSBTST8iOFEWwy6Za+QoxvG1L1qntSjhs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(39860400002)(366004)(136003)(346002)(451199024)(186009)(1800799009)(478600001)(966005)(41300700001)(450100002)(83380400001)(44832011)(5660300002)(2906002)(316002)(66946007)(66556008)(66476007)(8676002)(4326008)(8936002)(6506007)(6486002)(6512007)(1076003)(26005)(2616005)(107886003)(36756003)(82960400001)(86362001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lrVzHtKYZ21wbr3lwSKc+XU8ZSr8wHLvolEtse9phDeZ3YVRjluPwUFptW8U?=
 =?us-ascii?Q?Hd89le3RwwgkSE62Ycag4n3R9TS1ZpmONT+J84sDnedW1vpET3Jrevphis2b?=
 =?us-ascii?Q?ed4AKU9vrY/olM4htjyg7d/1uFRLapiHYsqE7AWFOCyD10WCjcoEWYK/SpSV?=
 =?us-ascii?Q?fn3iOQ42lKlt7/UZjeGgRwAGtjwY96JqL0G2YlWQpY68lsPN5ZdOmz9poNgb?=
 =?us-ascii?Q?YM1PQ7StklABQLuai0VMnOcqyAQIEON5rnigTNGZC1fCDkBCVOmQZhclFDcn?=
 =?us-ascii?Q?VkpXJo65ddtdJsmOihYfwsxMOcICpx+jOmqNTRgqHx+nW6OdpbdMb7VM28Ch?=
 =?us-ascii?Q?WLceV4HLgT69NlMdY4QPXdeVK3TgLU5/v91LRTMRIjBdfCR0hoTZ+HT68rkd?=
 =?us-ascii?Q?ViNTdVj84AWoCGFPMDisUTZqdR0ZlqxjJbNp6JppYmzg/ZV9La6hymQ8m/QG?=
 =?us-ascii?Q?PWpSXfYROt9qtJgO+URYt3I2sSV0BchYsqDQtW54v5s5Qh7x7iX055CmUDlj?=
 =?us-ascii?Q?QByRs4sZ4CDtdYWUiB1BuACdePKRVjit15LX++eJfQ8TrYE6uRXX8FnN/T2w?=
 =?us-ascii?Q?GuNAT2wP7sp5s1CPkI1UJ7c0UgFMfcaYX7A2A2QxBrfV4yTTKu+vsnYRSGro?=
 =?us-ascii?Q?WksTHlPg8tIyeAhNhsdx0+mLCJBPW/Ch89vX/VcbqwyUQf4wypF8xxRlVEjO?=
 =?us-ascii?Q?5KNUnIgR8MQ7yU6D+MXcn862t957R09vIMTUKj0t79pj04/yzDMATIylwaGL?=
 =?us-ascii?Q?hhEhPtlygcZdtrZB9wJzCrqXdq+f9hyyCqce+27AoDRFXdMMTPB5A2y84ucQ?=
 =?us-ascii?Q?O43RzUCFoD7TFN/kALvvmWs7hj0ba2BE8yKpFkZT2jiBCI3WT0P80L07s9hd?=
 =?us-ascii?Q?I2ss3C1uTnEykWsFF05R/u59dDWPkl8cAQLwOTCwrHCTcsxUEYBoSXPayv7m?=
 =?us-ascii?Q?3gUkgmRHfLBWDLC4GtyMgb/b4dukibxoFdBJJTCQWZRhZUbP07LclwvxFPKq?=
 =?us-ascii?Q?ki20A0Ejx56asiuez97murKXnMT4cI1UMrs830AF+1SNBpBHORBYmXnnJvrQ?=
 =?us-ascii?Q?UZAK+bBH0fyB8P17p4AVo9sjJ17DZgUM7lakM+kjzZYHiGScSPxQrNFg3rx4?=
 =?us-ascii?Q?iQ+pgv9ATKRQ0nml6V90bOQ86iD17kHFOlUYRNKKxXpOLazOyctccSeKZqzM?=
 =?us-ascii?Q?iLYfvgrCj8Q31q6V5daafgdsq/HxqRfE4nEIv8igSfA5RLkPgskicT4B4mBv?=
 =?us-ascii?Q?F46OhSPiJJ49leLdMW4J+LCoQTK5IVa+L0ZOgHY0RxxGyXqcLkmbdwWoceP+?=
 =?us-ascii?Q?QDdHzmQ+b51EtcejOhGNGZwRS9D4Vnev/iWoANghMaPF8ljB/OmnDRja/cPB?=
 =?us-ascii?Q?x2gf9DGNfHbSZNwe/my2Fq7QLsFEubgEtwXAl6RBbqW3TpLDceaWnZknnEZd?=
 =?us-ascii?Q?LcfcB1VH0MANo8gkf0Ra5uaaNRRHGjlkVWzPUCTcoo+fbcLCnl+yEF+bf/SY?=
 =?us-ascii?Q?z9gE5Y1S2JSb6hpDfMJngjeLXRF/RY4XZLLb8m0Yk018d81xvLLnk/5nCbF8?=
 =?us-ascii?Q?mRX1B4fU41OetdyG9HeQjRfWHBeqOVnjgRvdvdmh?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 53415941-d701-46ba-858f-08dbb91c28f6
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2023 14:24:40.2724 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O/OzAI20T7vEdkPIxtV3JQXc5TwqiOruCEcHzkt9A2EgZ7uYy2sKxmPo4+aG4uysuTNILBMbfTZai5ljvxZBdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7914
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH i-g-t 00/16] uAPI Alignment - take 1
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

As a result of the uAPI review efforts started by Thomas[1],
we have identified many updates on our uAPI that would lead to
breakage in the compatibility. What it is not acceptable after
we are merged upstream. So, let's break it before it is too late,
and start upstreaming a good, reliable and clean uapi.

Most of this work on putting these patches together for a single
shot was led by Francois.

[1] - https://lore.kernel.org/all/863bebd0c624d6fc2b38c0a06b63e468b4185128.camel@linux.intel.com/

Francois Dugast (2):
  drm-uapi/xe_drm: Separate VM_BIND's operation and flag, align with
    latest uapi
  drm-uapi/xe_drm: Remove MMIO ioctl and align with latest uapi

Matthew Brost (3):
  xe_exec_balancer: Enable parallel submission and compute mode
  xe_exec_threads: Use DRM_XE_VM_CREATE_COMPUTE_MODE when creating a
    compute VM
  xe: Update uAPI and remove XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE

Rodrigo Vivi (10):
  drm-uapi/xe_drm: Align with new PMU interface
  drm-uapi/xe: Use common drm_xe_ext_set_property extension
  drm-uapi: Kill XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS extension
  drm-uapi/xe: Replace useless 'instance' per unique gt_id
  drm-uapi/xe: Remove unused field of drm_xe_query_gt
  drm-uapi/xe: Rename gts to gt_list
  drm-uapi/xe: Fix naming of XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY
  drm-uapi/xe: Align with documentation updates
  drm-uapi/xe: Align with Crystal Reference Clock updates
  drm-uapi/xe: Align with extension of drm_xe_vm_bind_op

Umesh Nerlige Ramappa (1):
  tests/intel/xe_query: Add a test for querying cs cycles

 include/drm-uapi/xe_drm.h                | 360 +++++++++++++---------
 lib/intel_batchbuffer.c                  |  11 +-
 lib/xe/xe_ioctl.c                        |  31 +-
 lib/xe/xe_ioctl.h                        |   6 +-
 lib/xe/xe_query.c                        |  73 +++--
 lib/xe/xe_query.h                        |  11 +-
 lib/xe/xe_spin.c                         |  11 +-
 lib/xe/xe_util.c                         |   9 +-
 tests/intel-ci/xe-fast-feedback.testlist |   4 +-
 tests/intel/xe_evict.c                   |  14 +-
 tests/intel/xe_exec_balancer.c           |  29 +-
 tests/intel/xe_exec_basic.c              |   2 +-
 tests/intel/xe_exec_compute_mode.c       |  20 +-
 tests/intel/xe_exec_reset.c              |  18 +-
 tests/intel/xe_exec_threads.c            |  35 +--
 tests/intel/xe_mmio.c                    |  91 ------
 tests/intel/xe_noexec_ping_pong.c        |  10 +-
 tests/intel/xe_query.c                   | 226 ++++++++++++--
 tests/intel/xe_vm.c                      |  29 +-
 tests/meson.build                        |   1 -
 tools/meson.build                        |   1 -
 tools/xe_reg.c                           | 366 -----------------------
 22 files changed, 566 insertions(+), 792 deletions(-)
 delete mode 100644 tests/intel/xe_mmio.c
 delete mode 100644 tools/xe_reg.c

-- 
2.41.0

