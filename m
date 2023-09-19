Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D10ACD5BC9
	for <intel-xe@archiver.kernel.org>; Tue, 19 Sep 2023 14:25:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D0FA10E28E;
	Tue, 19 Sep 2023 14:25:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A12210E292
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Sep 2023 14:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695133512; x=1726669512;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=tJBNHAVyGMEoei+IfsnLp9pzeBbhKftaEtJwG+Pp8jE=;
 b=a7TOU4Cb2gz8L2hdzIEWCJfGTG2lJ8V5Jd7HsyAcmAALb5GDf3PWALKK
 JYyLSFbViXrPQ5ARu6rXKn1vjNN4dBMe9NQHmzicAeUvikdnCYrG/MHH5
 NNgLztJtv2WoG6+39HoDOP/4nAMegtEW5E/0X9Dkp2clyXZVEphi6hqIW
 BKPIOF0AfxxKltXKoovY1PYfWBbyaP8wlvlk9HYvTux8uw5ZFt4u5+TTw
 4Kt4QkPRS22wmVimmPW7TA8pPvOlNP55tBPNWBC7afAflCVnoU0mnUkFn
 oSQi7E0+MSE3PNG1pHA8R5lIuerMnvUyg9ksj+KxKI42LEbFtHD/JblJ6 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="466278459"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="466278459"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 07:25:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="695924267"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="695924267"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Sep 2023 07:25:11 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 19 Sep 2023 07:25:11 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 19 Sep 2023 07:25:11 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 19 Sep 2023 07:25:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y55vsfpTyTN9jTzjcMX6PwgT/HI8G34jH3HbEvrTvlENYU4O7SCEJis39N1A31QoNONO1uVAip39TW/bg3gXIMbGdbMVYV84yy8OOyhAJC7/NYX/o9QHySy5995wWtZ6ZvjJvgpw8kNQRNEX65yse/dIQFeIu5sJulRovW+eS5351wF66iAehgh+nMZMdBAMywJ1L14hsSK+IE4Nm3rjrrwP+qgAsmcEihhLw7DHo1/OeFmeCfsV77yCxvtG34NtW40tWcqjUBpZgyNAX+TwG5PmH4BrpnngriFiyArbhmLj+cNlt9UhKNeQOCHl6IveciSF9jLI48CeccO6lWKAqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XolFd9tah46MTceTU7hBICPpYFDbKABN81eh5LJQNFc=;
 b=f63UnckhntjSpAnjAOvN4noOXkMtYf1yp5h33L+6LvdiZalcsUmWyoj96Z7/j0XM0chrtr/Zk3EooUTI1kjbD4QK0o1qO/dntcNh/P3uYNcb5l562P9ShMPCQE4nKa3QaBJDN9HjThaTVAbLh+jJJlwQahIi3d7HzOXZJlyFepSc7+/6mShHlyJuygruplZvmD8LtJ9wsvmhUPi06ztt+FaOu5KBtcYaAT8+bMq6Xxacjub6pwZYbMsKmvX8iaYoNO+mYCwSWTSMI/GX6aXMD7kjB1Qz1F+Thrl5oY33OkscX6zmgmVIEwvKAxnk2H3wtq0aCCs+a4LT2G85yqGwNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CH3PR11MB7914.namprd11.prod.outlook.com (2603:10b6:610:12c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Tue, 19 Sep
 2023 14:25:08 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%6]) with mapi id 15.20.6792.022; Tue, 19 Sep 2023
 14:25:08 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 19 Sep 2023 10:24:47 -0400
Message-ID: <20230919142504.91652-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0083.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::28) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CH3PR11MB7914:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f457061-66fa-461f-9293-08dbb91c3a05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: T8s1eBpQLzHw5HILX3STkIraGyNPcDqDIKPcyc2uoE2AL9ihBUcarmpiyZ59FS36SPLj/uqPQx5UJgcva5A0qw+lcT2OavrVsGzMrb+KomMYtsb86r95TyewRaM2MWkktzRUxcIO5k6ZM+s7ZTM4ZTfcu96PRGjNVpuhE3pY9TYTq1EwmVqXccYolqbG5/KRzCcz5FgKk5pMQj49CdNI+57HmsDL3nWkf4U7jYuN1a06a1gOQG54k5C7SWgOnyz1FRkjSBvtCNZbHlI8iCBO6mcFIT0tdxD0KscynCTn6TPATAYv5aeUaAFdT+ofCP3Mcg7bxWOYQ049bBfvrJHMJFIVKSQe1cqmE0ONyZ7wwzwguGMXYeNwacwAAyjXEzf7SP1b/pGTLdxPtoTp5+CdOHMDNbSlGupvkN8covWs/PLssgKt0JEbJZmI5huk3TRm18jmhJW4DIA7hbdWSyUtFm2qNpNYJ7K68VN0r4b3qCgTMSt73Xliu484U9QvgwkVR13z5gvzY6cPJ9bmvYGe5fNvxvhYVU8+vAvpxcXtr3W6oiq24EeQ3wuHDHYsX/Mf0dg3KJIiA1BUttiUf2zObA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(39860400002)(366004)(136003)(346002)(451199024)(186009)(1800799009)(478600001)(966005)(41300700001)(83380400001)(44832011)(5660300002)(6666004)(2906002)(316002)(66946007)(6916009)(66556008)(66476007)(8676002)(4326008)(8936002)(6506007)(6486002)(6512007)(1076003)(26005)(2616005)(107886003)(36756003)(82960400001)(86362001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RW1oM0M5M1dDWGQvSHNUU3ZycHZwZXM0WllYamJuYm5DUmUra3dMNmgyNEdZ?=
 =?utf-8?B?UXZ0TUtNcjJ5WkFVWlJlNEdYVjdzaXVleW85MjVMdWVyNWxacTc4bExVaGRZ?=
 =?utf-8?B?Q2czclRFd083bllKYkhIZzlkN203cG9uSVBXZVVoZGxEVFhSWkVLSW9VOUxw?=
 =?utf-8?B?U3VlcW8vb1dMSTVkM3gyM25keFNDZHM3cXVQN0NrSmtDc05kTjVYeUQ5SU9v?=
 =?utf-8?B?U21odkVaR0Z0Tnh2MUhBZm9TdWdvR21za2Z1NDhtTmlJeTB0U0cxNFNLVXVP?=
 =?utf-8?B?d0pFZmFLZTUxWUpQM21McW9ja2duVnRJMklRcExUTnRBQUlONGJ4cHk2Y1h2?=
 =?utf-8?B?SU9URTNhTy9OcWdBL0VFVUFxcFVjTVNZVnhVRUhSNWtLK2IyR1ZpNHNFWUJI?=
 =?utf-8?B?ZU5VNTJUNDVHYVE0RkZmRnJWeHcwbXE3bEo1ZnNSaUFURDJuLzFCRFFEVEtT?=
 =?utf-8?B?aWd0WFBiRWxjd1ZWY1Y5QVJhY3RMdHBTYzJMNmw2ZWdYa2M4T1V0ejBSOW1X?=
 =?utf-8?B?K2pCcTlPQnlacTBURCtwdWQxdlFBYzFQSXBnb2tqeTZFM3EzT1U0cllwdEpJ?=
 =?utf-8?B?bldoZndjcmd0b043QVdIdS82NnRtdDhuNTBVSDRCdE9ISjlzK0FTSDF3cjNM?=
 =?utf-8?B?NGVHUExlWjBCV3RSMjNuNjhFWVl3TnJCUWtxTUMyTGlKTlJiWEpDRHd4V1A5?=
 =?utf-8?B?SXZHYTVzSU5hR0xqS0EvdGM3YWsyYzBMY3FCdis0NE5Kb3RZcUVVblFucXR5?=
 =?utf-8?B?c0p1NVFnR0E5QnpOMFkrRjBhTXI3NUhsb2tNL21tK1dDREtBdGtjbXZXL2VY?=
 =?utf-8?B?RzZ0aGNRYkIwTmlnSERTK29wSFJ2dHNNUVFZZVdBWGtSOTJidmxYSlNLWkJo?=
 =?utf-8?B?N3JZcnp5dkFDUWcxTTdZeGVTMFdnS2JJQ1lxZDByZ09wZkZUdGZzdytaeUlB?=
 =?utf-8?B?OHV0YzNsU3h1a0xId3AxeEo4Y2VCa2piUVZwSkhaZXJRZHdkak9Ja3NybFhh?=
 =?utf-8?B?dGJLY0FkNGlrR09zOTZwdE92dkRTc1c0WktCODZ4RHNCZ1lNZ1JnUVFqUm14?=
 =?utf-8?B?Z2JoSzdjaUVEdFl2aEZMcEFKbXNvOGNCOElVUWJWdkNoTHFYT1crOHFEVG1K?=
 =?utf-8?B?YUFMRVlJdEhVdmtqQVUvbFBDdFk1Szg4S3Y2YU5ValpzdGNWT3dRN25yMk1v?=
 =?utf-8?B?V3JJRWxWenJsenNyMzJGNTFsVVZsWXlVY21PTWh4ZkhjWjFMQTV5L09KZ0I0?=
 =?utf-8?B?WUl6TE9TMnpBeFlpMHd4Uks5dXcvQWxhdWpnYWc4Zmd0MUxxclZZa1c0VVlB?=
 =?utf-8?B?eG9aY2szT0lER1BvNGhvamNqQUJ4QVU1OUoydWdEMVF5SzhHcDdpMmdlY2Er?=
 =?utf-8?B?ZmlFck14TXlicG93ZncyREpQUVJWVTRyVml5Y2xpK1YycklEWENsYVJtSndC?=
 =?utf-8?B?di9tUEpTQXpyT0NPdHpObGJVZ0NqNGg3Mmt1TXM1MUE0aW1HeWNiV1B3djBj?=
 =?utf-8?B?VkwwLzdMZkVTcm1kdSt1Mk44ZTF0bnAxbFZDKzRYcUpNR3VNekJWcXlGRkl3?=
 =?utf-8?B?K2dPa1Z5allDdEp2ZEpITXN3cC9UTENrWUtzb2RIU2RNclhFZm9hRmJ6T0M2?=
 =?utf-8?B?Y2JYYXhWTkZ5c2h3dW9IN1ZBSWtiUUJsR25ZL0VPeUQ5QUI5VUJpWnBEZ1FU?=
 =?utf-8?B?bjFhRm90ZkRKbTAya3E0eWlqZ3dSd01oWjNKcDZzUXdlcVdnNVBuaXFXZFdQ?=
 =?utf-8?B?K2VJbUtCNkRzeTBuMHdzODg4bmlTOE0yRVF4THFveUVDWUh0ZTRCOHVkd0p6?=
 =?utf-8?B?SDBOZU9JMHVDa3Jwd1pyYXcrb3dxWE5SdXdZcmJSMGRoYTNXeEU5Y3BrV3E5?=
 =?utf-8?B?cXd4R1VGNVVlREdYWExqUTN5SEtNQ1BzZ3Z2UGVUMWR3N3A3akh2cFRBOWdi?=
 =?utf-8?B?WFQ1WHVRV28xM2o2ZHc3aXZuMVJmSkpzOW01Uk5wbktOeFBWVmV3V3E4LzZT?=
 =?utf-8?B?MW1XWE0vSTFqK2ZpN2NaR0VnSGM5RHZHcnVZNzNVdXp0a0xQMDRwSDhHR2Jq?=
 =?utf-8?B?UjY0U3VicldrRmpqblc1ejVVS25YdHR1Um1JM09EZkF6UDhZaWlvNWhNOWpF?=
 =?utf-8?B?QmJ5T2NYMnAxKy9zSzUrQlJxQ0FWcTZHcEl0V0l4dzFCWXNidnVxdjhkcUNa?=
 =?utf-8?B?bmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f457061-66fa-461f-9293-08dbb91c3a05
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2023 14:25:08.8594 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M9xQQQp2hufhaf8b3kySajhFgbKuqt/TqSUqiVRw/oFpgIb5/27JTo/53i4XVyALyQHXO/xCNkgaCyGSakfNUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7914
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 00/17] uAPI Alignment - take 1
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
Cc: kamil.kopryk@intel.com, filip.hazubski@intel.com, jakub.chaberek@intel.com,
 effie.yu@intel.com, bartosz.dunajski@intel.com,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, carl.zhang@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

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

Francois Dugast (4):
  drm/xe/uapi: Separate VM_BIND's operation and flag
  drm/xe/vm: Remove VM_BIND_OP macro
  drm/xe/uapi: Remove MMIO ioctl
  drm/xe/uapi: Fix naming of XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY

Matthew Brost (4):
  drm/xe: Fix xe_exec_queue_is_idle for parallel exec queues
  drm/xe: Deprecate XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE
    implementation
  drm/xe: Rename exec_queue_kill_compute to
    xe_vm_remove_compute_exec_queue
  drm/xe: Remove XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE from uAPI

Rodrigo Vivi (5):
  drm/xe: Kill XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS extension
  drm/xe/uapi: Document drm_xe_query_gt
  drm/xe/uapi: Replace useless 'instance' per unique gt_id
  drm/xe/uapi: Remove unused field of drm_xe_query_gt
  drm/xe/uapi: Rename gts to gt_list

Umesh Nerlige Ramappa (3):
  drm/xe: Fix array bounds check for queries
  drm/xe: Set the correct type for xe_to_user_engine_class
  drm/xe: Correlate engine and cpu timestamps with better accuracy

 drivers/gpu/drm/xe/xe_device.c           |   1 -
 drivers/gpu/drm/xe/xe_exec_queue.c       |  99 +++-----
 drivers/gpu/drm/xe/xe_exec_queue_types.h |   6 +-
 drivers/gpu/drm/xe/xe_gt_types.h         |   2 +-
 drivers/gpu/drm/xe/xe_mmio.c             | 102 ---------
 drivers/gpu/drm/xe/xe_pci.c              |   4 -
 drivers/gpu/drm/xe/xe_query.c            | 187 +++++++++++++--
 drivers/gpu/drm/xe/xe_vm.c               | 221 +++++-------------
 drivers/gpu/drm/xe/xe_vm.h               |   1 +
 include/uapi/drm/xe_drm.h                | 280 ++++++++++++-----------
 10 files changed, 402 insertions(+), 501 deletions(-)

--
2.41.0
