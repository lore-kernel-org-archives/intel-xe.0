Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FC82C6FD19
	for <intel-xe@archiver.kernel.org>; Thu, 16 Mar 2023 13:02:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62D0410E0FA;
	Thu, 16 Mar 2023 13:02:11 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68AF410E0FA
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Mar 2023 13:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678971729; x=1710507729;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=ayFMcsuI4DN+PcDoWMSxaEsuAcN+iV7lkZjCDx3Q440=;
 b=A1v4bqSG8k2naa1paeQV2MEmSZ5Xi6bf4pDxQavRjQ86c5BEnH7qzXzz
 l3oAFw87wF3sKs7U7zK+qQAAWaBfvFZYY1JIM8TdpwIoVnQJmY+sHYvc6
 bnPPYSJ4EF0O2TqOBpQUlvhAuhCuXNC6HWerNFsmU/5X7MKRGIvzu8phJ
 ipcc1yjsor7mX2j0ZuR6OlOVFM1kCUUgq2Htyo4Ouuh6QxHnXK/gfRRxQ
 TKMLyKjvAHr75WSym1C2tMRaPI0IpqoD+CS7qWCa+EAZIhceW69ZevJ70
 XEsXJoKenVMlFedv6HT0WaxQT6dCl6gkEdqP5zPvBe8occkO3Y0HIRtwQ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10650"; a="321816653"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; d="scan'208";a="321816653"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2023 06:01:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10650"; a="768935540"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; d="scan'208";a="768935540"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by FMSMGA003.fm.intel.com with ESMTP; 16 Mar 2023 06:01:44 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 16 Mar 2023 06:01:43 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 16 Mar 2023 06:01:43 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 16 Mar 2023 06:01:43 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Thu, 16 Mar 2023 06:01:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U82sHMC2HqaN++GJF76QC/kMeleGoPGU/zpj78ROXPKYPXtFdtzgsqamfNtvtI2sX1Bn22Xg7y2HW2YpvAD87RgBRMSH//gofaUuVRO5lyS/Op5F9HNrQgWNFo2mn/qaVDErS+hkhu78/d+Jpzh31vJbBcIyum/RNtGxxMo60jhhmENljB3B8uzfTcsjvimDDBMa6DKsPt3lxpHy/mJbhWI4E4DrBv9/jR7E91b6/DC3Tde5Kn5lv521I+fp8FjVYULmGAkmcU36LUytvdwxP9W9PS5rltdCPM9DLuFjaAcgNpSnU4Ne8nHhYI7juuRMCR2Rt9mbpKqsJmiQNZVVGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9EoNi+kJw9JXM74+FFJ4q8gES+sWl3TCm1o3zH4Pgyg=;
 b=fMtjjuyQNWkCtej+3I/bNlfT/HQO/WYOMdiyKtv/kQB0Xjr/3XbWg9fe3l8BFTf+K3osziEYc/PpVzOLLV3J8xon31gNTUDlXYa/E8befo/+CHZT3gU3CjDH690d3GdE97kKTMGOQO1/bMwwap5hhPWTivrOauK9rQLaV6xoDlt0XxabQ9B+IXLo/LLMgTjxI5exwKsChuPZsCIak4meQ9bw+5aA1SfunYAs0bxd4RLHbs9WvTr69W8YlnBwq64Rmf9FS4YVVu5nv72fAn/7SAJGdHzIhKETnmT3pdrBu8xBLhWf6I+iYagOG5YnazXPkHtn9qARbgjYVjp8k8aWQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5389.namprd11.prod.outlook.com (2603:10b6:5:394::17)
 by DM4PR11MB6359.namprd11.prod.outlook.com (2603:10b6:8:b9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.33; Thu, 16 Mar
 2023 13:01:40 +0000
Received: from DM4PR11MB5389.namprd11.prod.outlook.com
 ([fe80::efa4:91b6:58e9:a831]) by DM4PR11MB5389.namprd11.prod.outlook.com
 ([fe80::efa4:91b6:58e9:a831%5]) with mapi id 15.20.6178.033; Thu, 16 Mar 2023
 13:01:40 +0000
From: Francois Dugast <francois.dugast@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Thu, 16 Mar 2023 14:01:22 +0100
Message-ID: <20230316130125.1629081-1-francois.dugast@intel.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO6P265CA0007.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:339::6) To DM4PR11MB5389.namprd11.prod.outlook.com
 (2603:10b6:5:394::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5389:EE_|DM4PR11MB6359:EE_
X-MS-Office365-Filtering-Correlation-Id: ffa3bc77-e06b-420a-d3da-08db261e95a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JXaVq7v2wxb7r87JFcSngtb5tMt15g0X84CoHQFz6GUYpG4Ks4H4WuQJ7cl47aKN2SouYX3CDUhuNflZIlgns/KiV8hm2Kh/hsHRLr1zg5P6nvPLGc5ATYwxrmy9oTDADrsGppSzd5SyBDBPpgwClaCkpkq6C75Z1f8uTzJML+Z24WIW2DsLsjCdnRw7rQIbHuga0rI6+lSfwORdAjq4QgQfnUjv+hfn1/hYIe9EhhrQtqffLvPLKbQrvrLkZg9YB7IOVIQn3AOSnGP8qnMvEmzTpNiJ4dMMWQjK+cav7jDIZGHgt8uwyXxp66Ow2WdQsBoUPgQzsiqaQsL2a0U79EzSUphsJDnWIw5DwLrCy/HDqjFZxSoehVTHg35VPRJwlMr84nj0e7h7Jws7sYE7bFTXQSA92SsT1QpMUOSZonkRTW9UB8cQD0FC7pT2f8ra+QqogjQRex/ILnEXeKw7ftlAiKs1A8e7ufUMWD6cDkb8ANtbYyV5qpRp2Y23Y3jsduZbw1YJeX6d/dHYrozsNmoAdjGJ5wA2bUthCMRlqdmqS7tYGd+B6M7SiKIZbPCsCIP5oyFDsn8oJL5rvF6b2UKXRk71w3nlNDxMB2tgvBiIA+Id1Gm1EdqeR3Vo83ApO4Z31f+F2va33nlvWCGAFw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5389.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(136003)(376002)(39860400002)(366004)(346002)(451199018)(186003)(6486002)(478600001)(44832011)(2616005)(6666004)(107886003)(6506007)(6512007)(316002)(26005)(1076003)(8676002)(4326008)(66476007)(66556008)(6916009)(66946007)(83380400001)(41300700001)(2906002)(8936002)(5660300002)(38100700002)(36756003)(82960400001)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6g7J9kA6QcwBKDw3xW/v5k/msPcACoQzSPz+KcWkShxleXmhvxANu9iFYJen?=
 =?us-ascii?Q?Zo4sVvm98mYNtCvmH6UDx2YI272NemMwtAVMk3YMEUHABeNcmUOFody15NKS?=
 =?us-ascii?Q?nXxo1FK7h680HSdxhnwgNiCMFl0d2qA33N2D7DkFrUQ0m6wTWtQALw5Klaad?=
 =?us-ascii?Q?8W26wUHXXobyKLsL91GEwvUguJGGEnCEZyXox6lLaM5Mi/LAbbAHiBnGJPZN?=
 =?us-ascii?Q?lamUAxz5U3t5tT2CRGVFFx6dxDBF5Jq6nqZkgBrxHqrolsLzrK+JXF4bwALM?=
 =?us-ascii?Q?RXT+Gd70ezdrGkNxmyZEkqYGi5mPc80CPs9R5JQinI1FXYNE9Qvw4OCLBFPX?=
 =?us-ascii?Q?j0aOzQmw/Eco76fy3Ag2QJVJcuHXn00Qm2KKOue8NudxdDGuOBZw2ct6v+B3?=
 =?us-ascii?Q?CvaMVOBFYyoqYMW5m5bLEa/VEv/0rfyAjaZoTHjZe86yE+zFevAaAqwVqdkc?=
 =?us-ascii?Q?GGR66z79BBHfUSr6WyV0vBUSo/BFd3CqJV86FBXew3BhRSpgY0e+P91HFasi?=
 =?us-ascii?Q?T3aIn9LJVSdKhD+Jjm2cx9TzZeGtIcbJrN18Ic0oZZmt1NUsVBLExbYnwqGQ?=
 =?us-ascii?Q?Z50i/oZ5axaqmtpHPt1WtAYp3O1lkfN20Q7cnIIoSUPrb8VKsX/+uCZZJqpx?=
 =?us-ascii?Q?JMHuPn4J1NPOMkjhCltPnhUmA6evkJskBIO1iMyJFm0HC5lpYogCo6znjtST?=
 =?us-ascii?Q?cQZxTt7ewCqTEz/z/I1KBP1jgf93FKs17BV2NM5KvuOAHqy21JeGDoVtdrJ+?=
 =?us-ascii?Q?mDP6EgsO514Z678bfzNNfyk8lIsLRqBdsRLOm+s9v6kDiUj4T73B8TbtVqmq?=
 =?us-ascii?Q?bnhkPGscRsLTTzePzeI8M6Y17zNB9jFa1+If1ub2O5Hng50IO7WViCj2+m2A?=
 =?us-ascii?Q?zGPEEClsX+uX9Gl8AtCldy1mliWdMf13jFvjrmBxMfHcJCBHQ5KB6wnRtTD6?=
 =?us-ascii?Q?VMFI0ilvYZSX8k7DkqRrnm2aytO+o0FAuvSLHep5gmhprvj1jhy3TLKRQ2o9?=
 =?us-ascii?Q?Qb141qjl2HIj1xILoOLIGS2EZQvP7JwH+J+9IiVsdOzj/0luBBqjJKJdUTtE?=
 =?us-ascii?Q?tUzCMTEWGN6BSxuJJxAnJd2snCc+6RQlnpc0vl23rvSnWxnUxFd06cFO6qZK?=
 =?us-ascii?Q?yFn/J1oyZpMgDRuELiZ/0MzN0ONg5QU5hhYCyuA4Mu7wlfm4DVN2tC8Yp0//?=
 =?us-ascii?Q?/lIzcv8AYGSyB8ZwqqiOdVowOmR/Zah6p++nDMbkuXoIy4k1G2bsJPuRBEBn?=
 =?us-ascii?Q?rK7rZzon5SiZ2BjKwtrR6GXuKrUoRd1bE9uyU7IkO4KRm0WQJi9c9TF9Y1aP?=
 =?us-ascii?Q?2iinSMVA1A6Umi6UPaE3jPkPW7faLikQD/By6mHpDE9dDaaBubDCOw5KZHaz?=
 =?us-ascii?Q?96NgwSFHSkpPJ0lZbb/DQu68a43FHYvmGnu1Kvz2zgQCSCBO0AxENoBMN5sy?=
 =?us-ascii?Q?TeQiVMlhCZsZ5hNoGSfqdD3fw6l1yehlOndP468G8P24gXCXNkUZf05km8be?=
 =?us-ascii?Q?Pt0fpkvjTTrU/czba1SEkj18xYP13AI5rpguGx92uARFvjN2tc+n1fUrypIK?=
 =?us-ascii?Q?aSUnk476swWOyr5uWlYLZKbuZVreQBLFNS90tHKeJzBa3QAufAPNJvPNYklb?=
 =?us-ascii?Q?Ww=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ffa3bc77-e06b-420a-d3da-08db261e95a9
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5389.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2023 13:01:40.7522 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: axsAqNtwj6bWbQbiE7DCmY35Ej73NHyMDnqYvsjwZqUIVBcyF1alhYkCriPiTGvvXHBykqQf4MUfQIM1ilvmlbeI6kg9mcbZ2+pfTlHC59U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6359
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [RFC PATCH v3 0/3] Split code between common and
 platform specific
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
platform specific code. The minimal hardware abstraction layer is
implemented with a structure of function pointers, similarly to what
is done in accel/habanalabs and in drm/amd/amdgpu.

The objective is to ease the addition of new platforms by limiting
the need to modify the common code and centralizing specific code in
separate functions, potentially in their own file.

v2:
  - Remove platform files and leave platform specific code along common
    code to ease the use of helpers
  - Break down global function pointer structure into smaller
    structures defined and initialized locally per area / compilation unit
    in order to limit exposure of inner details
  - Refactor functions in xe_guc_pc.c to provide more examples
  - Add fake new platform to show impact on code
v3:
  - Leave wrapper functions
  - Use const pointers
  - Assign const pointers to the struct rather than individual function
    pointers members

Francois Dugast (3):
  drm/xe: Introduce function pointers in xe_gt.c with local structure
  drm/xe: Introduce function pointers in xe_guc_pc.c with local
    structure
  drm/xe: Add platform specific functions for a new platform

 drivers/gpu/drm/xe/Makefile            |  1 +
 drivers/gpu/drm/xe/xe_device_types.h   |  2 ++
 drivers/gpu/drm/xe/xe_gt.c             | 49 +++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_gt.h             |  4 +++
 drivers/gpu/drm/xe/xe_guc_pc.c         | 50 +++++++++++++++++++++-----
 drivers/gpu/drm/xe/xe_guc_pc.h         |  5 +++
 drivers/gpu/drm/xe/xe_newplatform.c    | 34 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_newplatform.h    | 15 ++++++++
 drivers/gpu/drm/xe/xe_platform_types.h |  1 +
 9 files changed, 147 insertions(+), 14 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_newplatform.c
 create mode 100644 drivers/gpu/drm/xe/xe_newplatform.h

-- 
2.25.1

