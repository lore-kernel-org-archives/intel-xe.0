Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAC51C678D4
	for <intel-xe@archiver.kernel.org>; Fri,  3 Mar 2023 14:50:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8140C10E632;
	Fri,  3 Mar 2023 14:50:31 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F8E510E0FE
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Mar 2023 14:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677855030; x=1709391030; h=from:to:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=YPG7qIl9nARU8jsBEwvvyckLq+GpQQW2L4GDx9EX1Dk=;
 b=ShrvJcBHzGQieiYdPq9xQNr6j1McnQPDt2AMacLba9nJaM6jfqtIwY0w
 qS0NCW4AlX6lZq48NVEsbYpdhhOYmgS2JVe1/RwKeAfu/XmAVtp1+no52
 8xYLPO16blAHUZ2+xWjlqa0kcJjCAhmjBZhQwhmy8++ZlCTUeoPsnt2cw
 eIACNJ9T2QqpmYnNE/fqEYGMjRjOwxjryy/K1Ts4cSMZ6fMRg100XQjYZ
 fLPFX1a18KiZflS8fTzI+cbeO5V0VBPy0JGqxQvFzFBDm47N7O00wte/x
 /BBWoLCrmAgaDgUmmuhf1IkDon0okYbyp7/0gUHZI4wdohe06ze56l6An Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="399866393"
X-IronPort-AV: E=Sophos;i="5.98,230,1673942400"; d="scan'208";a="399866393"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2023 06:50:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="677673158"
X-IronPort-AV: E=Sophos;i="5.98,230,1673942400"; d="scan'208";a="677673158"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga007.fm.intel.com with ESMTP; 03 Mar 2023 06:50:29 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 3 Mar 2023 06:50:28 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 3 Mar 2023 06:50:28 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 3 Mar 2023 06:50:28 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 3 Mar 2023 06:50:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aSRg/mw/GNJm9xd7gpv5cb/z0oYzJJj6NYlvJFQP2YwG76fRPjWIpJS6aA/X088kTUHFa6h+ny03DvjJWA6mzgIsXDZUTgcl1wI8ffaf4F280yLOdgeBhzMtsR9J7Xi1+j3lRbSnSGOTkSYDMHxNXxRo+dHR7ZjsrMayTkcKhfVEVM2fkQl69YFBlavW+uU2aST0vvGZmoPDgXqERc4OhrMc74k2Enz/d0sKZsHWNj7EItS8giOKfrsW2rvTHxes5syQ8HcCjx1LjGw6+OY5c40tmQjy9iZvIwD5NGamYYikFPRFxinep77fP66/OODmAiEvYFg+zIxrhHQLIG0eUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VTYjZQodqvb7Q2ASzCjz4oUbxBQMW8hge87CTLrLwA4=;
 b=iqRUoBFxgISEWaBEIegFXgRvmqc3UmX0dcMt7ftwLOVEWo786hUy+ihDEW/VE/vVhZXtUATuKDpEp/lcoqhWFckRhwJloPHrTsTpjRfXvX7x6YsUt5GbFzLM4+HMt4QFg3Vbwq3Gb51Lf+nvuhC0P+Cu8tPhhrubMUZ/0LY5CaS6nyrPffncylauGsTw56dGKRhUZNY6L6ijVNabIWQ97/Kg9WyKLk2jFccoGY7hI2Kji8p6GlgOdCtvtKSaEy8c9BhDWFLQncbllHxKn8ziBUdLdwiteaIWmbK8mQs4gnn+2SQmYgqELmnO33rixdAvBq0OMtX+MiV61+Jp9IHaFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5389.namprd11.prod.outlook.com (2603:10b6:5:394::17)
 by SN7PR11MB6921.namprd11.prod.outlook.com (2603:10b6:806:2a8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.18; Fri, 3 Mar
 2023 14:50:26 +0000
Received: from DM4PR11MB5389.namprd11.prod.outlook.com
 ([fe80::efa4:91b6:58e9:a831]) by DM4PR11MB5389.namprd11.prod.outlook.com
 ([fe80::efa4:91b6:58e9:a831%5]) with mapi id 15.20.6156.022; Fri, 3 Mar 2023
 14:50:26 +0000
From: Francois Dugast <francois.dugast@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Fri, 3 Mar 2023 15:50:11 +0100
Message-ID: <20230303145015.1018870-1-francois.dugast@intel.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0243.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::14) To DM4PR11MB5389.namprd11.prod.outlook.com
 (2603:10b6:5:394::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5389:EE_|SN7PR11MB6921:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ae5ec93-f746-46aa-00ad-08db1bf69fd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V4ecZO7lu3thvEyM9mS8ZeLggVT2RNFZWWOX27UPqmnQncLEahZEEBX07rl/S2NpuZqpmAdphpr/CGUVoDEBPcshE0rNeoOUmc76CIipOH4Ine0lSgpOXr9gvTSE3hCfNP9gT7XPheCIvjpmE4Qj1oD3yUdOwE/5m9fU0igUoTqgdzlgtNgkhaCy4tpgYdm1PZB6hopub+ZCFKW0T1OINhBgunsyWt4pwYba43VnAj7uXbvnTV4nq8BxUI1Wq9h9iG5/WcNbzyqzij4ZvQEF5tzz7KNXlBL/4oPrWjrcBO7rs/xxLqgHbkJD+jFgHDPdMGQEgQtgpsOhpvHxusdpRiNquig9MC0EOF3oMurentj8XkaXzFRqxf7O00TalX9b/Ab/6MxdIrQWBAG5rhmuTFHA1zvhdjJZYHIryhjnnqHZPEpwjzzHofab7xQSSc5QyMyv3xfsgVKAsbfIIKRNyZ5em/DAXLfk5j2DqTas9UHn7sI/Aq81dxNiYeRjRoaxFiVntDGXixNhPv/ZaOGUXD1BnVDZIQwv03AXuD94MAM3lGuP5FcBEETLMpyc/3FOQCgJ+fnRtQNFukhfZzRhbfFRkHrol46Vieh6NJSEeCEFwgj42+rQKCwRMwRr1SD7asRvfWBGddxhCefFhPz8Zw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5389.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(136003)(346002)(39860400002)(376002)(366004)(451199018)(36756003)(83380400001)(478600001)(316002)(66476007)(82960400001)(8676002)(6916009)(38100700002)(26005)(6666004)(6512007)(1076003)(6486002)(2616005)(66556008)(186003)(44832011)(6506007)(66946007)(5660300002)(8936002)(41300700001)(86362001)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?X0vjnORWhAj31vGqxil/a8Cr4SSVOQqqsrMz//jygUx0qSZ4Vq4maXpOUfXU?=
 =?us-ascii?Q?ZteGocMHRqdZxjA1R9xte2J4WSPbSoOjI9yuQx1rjLHqVAcAxYtoLreBJX2v?=
 =?us-ascii?Q?68kLtB6WSWkbEsuiS2F+FFhp0kAd8os47w9DTLnz1tkehJYJ11D/0UCd8RK8?=
 =?us-ascii?Q?FnRYSFbAB8AASSQi0slhmjDIP/1ht2pXMbMXgAto8tkKynVEtCJZ7NuJGzb5?=
 =?us-ascii?Q?UCbWFJ2SnxhSuSZovfOhgMH87OtBPni7kdm8vReooTG8CE2LdDMdmlTW11AI?=
 =?us-ascii?Q?yxeerhPPEDq4Cv76luFzCHr9q72e4OGIAaYLa0rUcQyUVPEDRFAftFC9KpFR?=
 =?us-ascii?Q?5kZeL4DAVpPdtvfAdUZyFXlkEhErCnZOBQinkz/JV+Lo9+Kkx/5+U3fKkk71?=
 =?us-ascii?Q?4nJhX+ILi4ag8GYHM9KVycewkGUNGl9AfGlDbGGRYKZSuf4H9mMow/KHbAOZ?=
 =?us-ascii?Q?oK439nV9zXhuyxKnt5qvfkBV/UL7zXW02RDrSRw/VunnQ9aadtwpT2i5ukgU?=
 =?us-ascii?Q?iovOvJtj/2SyGUCi4rJn5NWMLbx7QSjhAX0o/RqQDSqnkWzQebLlsPVzUXA8?=
 =?us-ascii?Q?DFi0bsrJL34b2ZsuvkohtV/FQvigUFE3t5jZMPoaCJtKvy1zCMcUA8uhd1wY?=
 =?us-ascii?Q?KENkaGei/mUJh/v2g5xhLsMzMozy+sKFKkX0LdR/zXEb6QtfV16s4horRCKW?=
 =?us-ascii?Q?KsibKwddy8Raffi8+dzM3km17VC23wzuIfDTXOsMNicbCVl0mYv45hbuUGpd?=
 =?us-ascii?Q?QtTxIyO52d7vKuBf5gaPlN5W6yVQ8rIe2YpPryBw5vsueXuvir6RRxu1hL+v?=
 =?us-ascii?Q?TzF78FzGyVfQj8oysOfiEV7H6tal7y1hFeYUOV69f4t0JtK00M+qc2VuFrI3?=
 =?us-ascii?Q?FtiGwTpgpvBSATzZv9Iv532ursEHQNfEzRIf9IoMaH8XHsm+QI7461Nec/sW?=
 =?us-ascii?Q?1f5SsrmVarGugNC7PH8G1JyeKsLGoMVlki4/TUY+Lem/hzlh8BbMZj6qcfpq?=
 =?us-ascii?Q?iFiP9Z+Gq+P1ltGSrLZPVhBkflnDKWGl2J9JDE+t2y75i5jCZKHfh+XXcoFf?=
 =?us-ascii?Q?/RK4yJYvF+bGRVmZvX/9yyvjl+K4Vzrc9H3C9d0kioWs1DSkjZp3NdOL3Fb0?=
 =?us-ascii?Q?phb9O54XrbP0sqdMuy7ms6Gj4+YkkEnR/LDGatrsCmq2PKjp4R+Wgq/t6ofv?=
 =?us-ascii?Q?Xe9UdA4NIzOwQRiCwXkKeb/+GcENU3HJyHo7xWlU0qbgDj0X6uA9fZSZHiOE?=
 =?us-ascii?Q?4aMXI79j1YgJ8ocwQw3kRRAV7GHiF9of5FPTVcKiasUD+xdl2M/3NnaHFQSd?=
 =?us-ascii?Q?H2EbsVGgAMwHbVhaSSqLDtGQxqKLjXm9vGFmMPk6QlCI2oQN4qZWaNfYSBN8?=
 =?us-ascii?Q?pakvMVmIiV/LXAsrk9mHiCC/JivN8kJtASQt+YLWfq4d8/TNMcQTmh3DsklI?=
 =?us-ascii?Q?mbrigIW7U2XpLgVG6OkGZbYFea+9ko+M4h5KmzFzkTTfuEmkQ0YAjcu62nIb?=
 =?us-ascii?Q?NTPtY5oqnoqzERIBz7rSZFG3M7wqGHU2KUzpk3Z6YA5K7rrAynLodJ3oXKxP?=
 =?us-ascii?Q?/U8Dulgp9E2DwqVKcv3ak82UOh5dB4vMluXDgC4MLfBKMyREhMZXoqTFItcX?=
 =?us-ascii?Q?VA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ae5ec93-f746-46aa-00ad-08db1bf69fd0
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5389.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2023 14:50:26.2370 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XSKl8twmp/0N1eh9PXQGZaZEEEAKPzmJM83wS68brpSQWPmC+7bskyAHtfyPE2Qb5tjPumk8ETPDkqj15zHeQXhpWqwk1Mu/LCzsru9ymwU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6921
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [RFC PATCH 0/4] Split code between common and platform
 specific
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

This patch series explores a code split between common code and
platform specific code, which is moved to separate files. The
minimal hardware abstraction layer is implemented with a structure
of function pointers, similarly to what is done in accel/habanalabs
and in drm/amd/amdgpu.

The objective is to ease the addition of new platforms by limiting
the need to modify the common code and centralizing specific code in
a platform file, potentially in its platform directory.

For now only one function has been refactored as an example
(setup_private_ppat) but this shows already how platform specific
code and platform switches can be moved out of xe_gt.c.

Francois Dugast (4):
  drm/xe/gt: Move ppat defines to a common file
  drm/xe: Move setup_private_ppat functions to platform files
  drm/xe: Add function pointers for platform specific code
  drm/xe: Add function pointers for all supported platforms

 drivers/gpu/drm/xe/Makefile           |  8 +++
 drivers/gpu/drm/xe/xe_device.c        | 32 ++++++++++
 drivers/gpu/drm/xe/xe_device_types.h  |  2 +
 drivers/gpu/drm/xe/xe_gt.c            | 87 +++------------------------
 drivers/gpu/drm/xe/xe_gt_ppat.h       | 33 ++++++++++
 drivers/gpu/drm/xe/xe_platform.h      | 31 ++++++++++
 drivers/gpu/drm/xe/xe_platform_adlp.c | 18 ++++++
 drivers/gpu/drm/xe/xe_platform_adls.c | 18 ++++++
 drivers/gpu/drm/xe/xe_platform_dg1.c  | 18 ++++++
 drivers/gpu/drm/xe/xe_platform_dg2.c  | 18 ++++++
 drivers/gpu/drm/xe/xe_platform_mtl.c  | 32 ++++++++++
 drivers/gpu/drm/xe/xe_platform_pvc.c  | 35 +++++++++++
 drivers/gpu/drm/xe/xe_platform_rkl.c  | 18 ++++++
 drivers/gpu/drm/xe/xe_platform_tgl.c  | 32 ++++++++++
 drivers/gpu/drm/xe/xe_platform_tgl.h  | 13 ++++
 15 files changed, 316 insertions(+), 79 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_gt_ppat.h
 create mode 100644 drivers/gpu/drm/xe/xe_platform.h
 create mode 100644 drivers/gpu/drm/xe/xe_platform_adlp.c
 create mode 100644 drivers/gpu/drm/xe/xe_platform_adls.c
 create mode 100644 drivers/gpu/drm/xe/xe_platform_dg1.c
 create mode 100644 drivers/gpu/drm/xe/xe_platform_dg2.c
 create mode 100644 drivers/gpu/drm/xe/xe_platform_mtl.c
 create mode 100644 drivers/gpu/drm/xe/xe_platform_pvc.c
 create mode 100644 drivers/gpu/drm/xe/xe_platform_rkl.c
 create mode 100644 drivers/gpu/drm/xe/xe_platform_tgl.c
 create mode 100644 drivers/gpu/drm/xe/xe_platform_tgl.h

-- 
2.25.1

