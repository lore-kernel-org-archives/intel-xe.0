Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60883C04FEE
	for <intel-xe@archiver.kernel.org>; Wed, 20 Sep 2023 19:29:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3243810E53F;
	Wed, 20 Sep 2023 19:29:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D66FE10E53F
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Sep 2023 19:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695238191; x=1726774191;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=4ccghKVVnTXP4kmhTENHUEdLwU0OOKDu2SCXl+k7AD4=;
 b=K1GOUpDTZa8Ap/W4cBXYOgmGgPXiISElWXQ3bx/1Kt+Hv+Ut8J8REinC
 cTksMsrroSVZoQuW7aiIAHBsfCgHc38QfGbKOrR0QjEhCwqs0rUARDG/q
 mGToS4h3h5x/ua5/0gH3goHaZqulAfEysDzzY6tnHNIGlgwem7aukWKFK
 q0ph/vrxcP7fgL1H6iTXP8de0t2TKIIZ3sHl062+zv2LkvMF6J8LywLzm
 hbZkfXLso2qbmw4lFff15ltpjhkHSZhEZKOeDJS8v0lU5JC2AFCTQIQm6
 6b2w6S8WLRyfzsOrqSq45r7RL/n7/CqhN+63WCboU8c7iPp4f9brot7J9 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="359701100"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="359701100"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 12:29:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="870498326"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="870498326"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Sep 2023 12:29:50 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 20 Sep 2023 12:29:49 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 20 Sep 2023 12:29:49 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 20 Sep 2023 12:29:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hqV/DfXNDwKIqrZGyXrr2fN9xAH3Tnzomw3hv6wHLICoobXfRXUCySW6qkmlZfbzPkP7ku7HB5LPP84hr/JLiCVYg29iuTfhTBv1cnmm6HpremGHpk6MixWOf04ZfbbgQ/RTnGkdFFRU/HwukPKWRwO2Ddvfft0pHSesKdYLGHJvGRzWOV/r9/yZQWls6VHMmOog2dCiBuRe4N9M9RosP0AFlefgio8cw5iczXawWsPsN992r0XSWs7S5J6hfhxHuhMHLNXL4q9WpjATP3Tp8zETsqcLsEtAkUnvbAXHYeqkjMPPokZQTNxUNymHAk0xPAyaMYc/RBXJ7grSb6Nn/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z5iQ8bjSy/ebnQPaeluovFmaMZ/hLxiK764gmzvU6RQ=;
 b=j43lGWIO+X3nE/Xw4pmTNdTHelCN5/3wonDowXl5ohYfL+GPmUzHIgph80v/2C2QDAj5cuQ2N/vbOh1jo8zoPX89qUWv1sFSf+uhLO0q2MTcXg5Ft8lG9h3CG3GpTk67RB0nrfhbEPLO6qur/0cGRiFG6QzZgm7jCH2iinwn6hjGXXAhEgtuOUwCz74KeOugM4JPGkSbZ8iTfHjfCZen5Ixkec3ssWjFKzaw+HjhS/jU0rumGQW4CNa/h2rm98GwVld5aHNhW+nB9FmlVyQLp/bTpyGg1XwJ2GBNBUy1Mu8pA1WpH1Ep6tAhtXby/nQh6KlNTL495Y/TVYtqrN3mcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DS0PR11MB7802.namprd11.prod.outlook.com (2603:10b6:8:de::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Wed, 20 Sep
 2023 19:29:44 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%6]) with mapi id 15.20.6792.022; Wed, 20 Sep 2023
 19:29:44 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 20 Sep 2023 15:29:20 -0400
Message-ID: <20230920192940.135004-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0200.namprd05.prod.outlook.com
 (2603:10b6:a03:330::25) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DS0PR11MB7802:EE_
X-MS-Office365-Filtering-Correlation-Id: a4947233-a8ff-42bc-f547-08dbba0ff1ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tIaHyFqanpJATG7k44uebRxpfosga/LB8HvZo6x664isq17K/JKPH1mJoQzKge9e7+l1s2fjmwn5et/c+uGmVGzETbYv2TidxlhxFT1+mKVzvlm6vUmuqjO3U6VYsH7Yf6EBS8CXil7aQTy4P9zIZEdRPtqjbofbKCk71z0cEu/+eTaRV6zAqlQzwVTpTaHS/iGVB89+cKpMM32vehtIUOjBjiEQvzdsELoBbanap8A0RAmQ7In92oqxLHwk1US8AtVIeo5fh96q5XdxMH8Kmr9supKTrmn+snIuuOS1cqzm3RIgSUCy5eJvj7Tb03aM+pG5d1NasWxd3y8bFu5AIxMPTjkv17ypiuFOq4aACzAwPQ+U5vcEchmVZ8vpq/pO1Xo6p6SQmdcKq08W2bknAP/qN5fB6zxo8Ff/DMwd4hi+LRSxyLZ7N7hECLHQArJOnXlnfL5cvPck6B1ge8ofvgQM3QVyLz33RcQQXQbAud/+mfq59qFx+n1+8QphrfgjbkAs8Z+v7YrdKl96LrkSrFE8Dh9EebQFaMntVqezlSnzMnybzm9Jq7ZFFMXGd2ueko5WM866kTODLp8C8gPDFw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(39860400002)(346002)(376002)(366004)(451199024)(186009)(1800799009)(83380400001)(6666004)(966005)(478600001)(44832011)(86362001)(107886003)(1076003)(6512007)(26005)(41300700001)(6506007)(6486002)(4326008)(66946007)(66556008)(8936002)(2906002)(36756003)(6916009)(66476007)(8676002)(82960400001)(316002)(2616005)(5660300002)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bVdyeVZuV0J5RmlzNFdCYm5tR2pVYkxlZTdYRUNvT1dzck1OWTVlMVgxbHdp?=
 =?utf-8?B?ZWoxanlVekswMUdIODE4alBKdUxmZE5WWWdDZWxzK2cvQno3SS9SelMzb2Zu?=
 =?utf-8?B?TmVuQVFteTMyM2dnODBMSnkvWDZSa0xWbkRqY0krL2c5azd2ZDNQV2Zhenpn?=
 =?utf-8?B?OStFcDh3MFg0cTVEZnIwYVBtUE5JZ2ljZXJKRi9aT2dTRXpxQ2UzUG1CNG84?=
 =?utf-8?B?dklpY2JWaVk0QWRVaVVzaUlmTit0MU1DUXlFbnZrSkYrWGwwNTNZUmdjS2h5?=
 =?utf-8?B?NVYxc0Y2dHdjMTc0VU9NNnVhVWpuZStZQXI5NFpJeEIwTDRFaGd2UU50Smk3?=
 =?utf-8?B?cE5oZ01GTk15ZXA0cHlPRXlxazV4MkRVZVFwNnp6a2FTSzFtZDZBLyszemJw?=
 =?utf-8?B?R0s3ZUhycDBBbVp4NE9ZVkNBY1ZYNUdzL1hZYTBDaGxBSGdWQXNFUlRJdDd5?=
 =?utf-8?B?TzFVc0YyRk0raGxTRTIvTVNKMGtRVDJjSTZPd2Y3RzNLS0lWaXhJaUdwQjZE?=
 =?utf-8?B?OE9Dc3VjZHZtOXo1bFBpdmNvaXlnT3YrSllGRnlqMWdPYUNZQzhlTDEyWGE4?=
 =?utf-8?B?bi9Kb0dOZWZPQkhoR2VreHlRUDN1T2dxRS9oL0x4cHY1bFZSU2tLNnFIMWdy?=
 =?utf-8?B?cHA2RkxJYTZpZ3NPQ2hRS1B2RHlLMmJMZHNaZ2I0N3BMdENKaTVuMXptNDlq?=
 =?utf-8?B?N2crTndnMS8ybHlteTRyZ2JBK1h3QVpKUkJXbmRiQ0I4R0g4MmMzTWh2L0Zo?=
 =?utf-8?B?V295cWxmOXNhVFVtUkcxZktQY0tUc0xoV3lFSUt0YzF0SUVNc0hJZEx3UXUw?=
 =?utf-8?B?dEw4OUdIRzNQSzV0djZ4Nm41Qkl3ZVRiRGx4RHpJMGxSUENZOWE3ZHBYbWJT?=
 =?utf-8?B?eU9TaXZ3bW03TGhMTGt1UGJsbzlHa3dwdTBTaTh3WHZRa3dtR2EwK1NiaGx4?=
 =?utf-8?B?Q200Vk9kb2JrZzB2dmJBLzBUZ3gvQmNhSy8yOVpnTDlHNzZOclJXZ0RrRmc4?=
 =?utf-8?B?djVKaE1DN0pPdjdXcWdCcG1aNnVzd1k3UHhNaTZmMFJXa1ZNSElnbXB5VmxY?=
 =?utf-8?B?OEIwdHA3bkdNN3pIWDROSFJ4UzlvaWlZSFhvTnp1Z1FKQ2NLZ09wdW14NlRv?=
 =?utf-8?B?SC9ORkdtSmk5TWd3bmlGVGJkYlZ4RVI2dTRkdmZhR3VjL0hFaUd0Ujk2QWxF?=
 =?utf-8?B?aEh3RGR0aE1ZcTNOTTRIZGhOc1hwQXJWaDhuSDhOUlF3OGNtSHd5cVA3UXhJ?=
 =?utf-8?B?a013U09uOXpuMlU4cm1lalo4ejVCMFo0eWtLR3JIeno4bTh1aDRkYmNMTUhy?=
 =?utf-8?B?blFObHRaaHZmVk53eDhmdmloS1lBYkdTQzQ3UmNsZm9TZ2hCcXVObXBMY2xy?=
 =?utf-8?B?bFcrRzFCdWp5WDZUWVZ5aldGa2liRlowb0VoOS91UHNRTWppdDl1K1RzeUk2?=
 =?utf-8?B?RGt0TmlSc3E3ODY2TXhDMlJhVTZtcXhIUDRXYzY0NE1YZEpjNzQ4TFJxV3Zz?=
 =?utf-8?B?b1pTTEpVMnkrYXVZOEFXSnp2TkgwOTQxeVk1QTd0SmZWQ0h3c2VsbU1wRDJY?=
 =?utf-8?B?cjFaSDNHWGc1ZUo3TTZBdkZwYXVNRmlEU2hsdWE4MTRYVXNSbnZuWlZuY0pN?=
 =?utf-8?B?djY3anN2SCtxVGduck0ycmpNTVQyNCsvdUF1Y1Jvcm5ZTjI4cExadG1kb3Yw?=
 =?utf-8?B?MG0xVkl5dTgrNHJFMGkwN0JJN2syTjFoZ1UwSWRrWHFqTEVDSy8xNUtKVlF0?=
 =?utf-8?B?bHpZb2VKWjN0TFNUT2RCam82TkFSVEhCU0o5UFVUMjkrQ0duQzJISDZYMGow?=
 =?utf-8?B?d2tGYWYxUitiTmZXMld6a1BsNGthOXJ4ZXhOMU9VYm0vVThRcGdwdTFmZDBz?=
 =?utf-8?B?cGhEOXNVZXdnMTdtL0pmOW5QRVNBaVFxeUFJcVAwTFNDS1hIQ3NiQXlhaUh3?=
 =?utf-8?B?ZmdUMnNpeWZMK3BUR3dFYTR0QmxjcmdGVnBzQzVMTDVGYTE0YjlpcFZRY2Q1?=
 =?utf-8?B?aWdUMlIwaDE3bEozdzRyU2tuM1J6U1h4ZUlUcSt6dFVpSG1ZSkZyNHdwRUc5?=
 =?utf-8?B?RnVwditwd2VhRXFZR3lRQllXKzFpNkk1eHZENmgxV3ZRTFBQdXVrZkNvZk4x?=
 =?utf-8?B?UHc5eHdSYVFkdlljZmh2eW94bFRJVE5zRmwyTGlNa053aHFIOVNmUWRFeDgy?=
 =?utf-8?B?d3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a4947233-a8ff-42bc-f547-08dbba0ff1ca
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2023 19:29:44.8790 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uwMt+pCeTWG/iXGMGxYuFSc7NB0YIWnLu2pVVKWeJNumlUzB4IxF9eoG06rfomPb4k/4z0vbSGPON2lAo1u9Ug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7802
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v2 00/20] uAPI Alignment - take 1 v2
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

v2:
This v2 has 3 extra patches that was missing on yesterday's submission.
But that aligns with the IGT series sent yesterday.

Also I'm glad that Mesa reacted super fast and we already have the MR
ready that aligns with v1 sent yesterday:

https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/25300

Thank you Jose!

v1:
As a result of the uAPI review efforts started by Thomas[1],
we have identified many updates on our uAPI that would lead to
breakage in the compatibility. What it is not acceptable after
we are merged upstream. So, let's break it before it is too late,
and start upstreaming a good, reliable and clean uapi.

Most of this work on putting these patches together for a single
shot was led by Francois.

The IGT counter part of this series is available as well[2].

[1] - https://lore.kernel.org/all/863bebd0c624d6fc2b38c0a06b63e468b4185128.camel@l\
inux.intel.com/
[2] - https://lore.kernel.org/all/20230919142000.91363-1-rodrigo.vivi@intel.com

Ashutosh Dixit (1):
  drm/xe/uapi: Use common drm_xe_ext_set_property extension

Francois Dugast (5):
  drm/xe/uapi: Separate VM_BIND's operation and flag
  drm/xe/vm: Remove VM_BIND_OP macro
  drm/xe/uapi: Remove MMIO ioctl
  drm/xe/uapi: Fix naming of XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY
  drm/xe/uapi: Add documentation for query

Matthew Brost (4):
  drm/xe: Fix xe_exec_queue_is_idle for parallel exec queues
  drm/xe: Deprecate XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE
    implementation
  drm/xe: Rename exec_queue_kill_compute to
    xe_vm_remove_compute_exec_queue
  drm/xe: Remove XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE from uAPI

Mika Kuoppala (1):
  drm/xe: Extend drm_xe_vm_bind_op

Rodrigo Vivi (6):
  drm/xe: Kill XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS extension
  drm/xe/uapi: Document drm_xe_query_gt
  drm/xe/uapi: Replace useless 'instance' per unique gt_id
  drm/xe/uapi: Remove unused field of drm_xe_query_gt
  drm/xe/uapi: Rename gts to gt_list
  drm/xe/uapi: Crystal Reference Clock updates

Umesh Nerlige Ramappa (3):
  drm/xe: Fix array bounds check for queries
  drm/xe: Set the correct type for xe_to_user_engine_class
  drm/xe: Correlate engine and cpu timestamps with better accuracy

 drivers/gpu/drm/xe/xe_device.c           |   1 -
 drivers/gpu/drm/xe/xe_exec_queue.c       |  99 ++-----
 drivers/gpu/drm/xe/xe_exec_queue_types.h |   6 +-
 drivers/gpu/drm/xe/xe_gt_types.h         |   2 +-
 drivers/gpu/drm/xe/xe_mmio.c             | 102 -------
 drivers/gpu/drm/xe/xe_pci.c              |   4 -
 drivers/gpu/drm/xe/xe_query.c            | 186 +++++++++++--
 drivers/gpu/drm/xe/xe_vm.c               | 221 +++++-----------
 drivers/gpu/drm/xe/xe_vm.h               |   1 +
 include/uapi/drm/xe_drm.h                | 322 +++++++++++++----------
 10 files changed, 440 insertions(+), 504 deletions(-)

-- 
2.41.0

