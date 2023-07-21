Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB6C0C001DE
	for <intel-xe@archiver.kernel.org>; Fri, 21 Jul 2023 20:22:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FC4B10E6FD;
	Fri, 21 Jul 2023 20:22:02 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7577B10E6F4
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Jul 2023 20:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689970919; x=1721506919;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=DnSlsiz2Ur0hHyOEYfqdn63H8V6DzrCQAsUFSII9YmM=;
 b=AAEMyaxzsn3/ixAIlp5sL3/cAQ96k0UlmzsKkuWMQ13YToF5kFVT2Dzh
 4wGrWTLd24AXvSFQiW0m+c2D4NCuMvHBSwcrvHfY2AA5GeHTnzt01SMaf
 MxO2DabNjHjbzh08Qku4U2sNyAXlLuYk3X1J2CXCi++utpSmZAKBd55i8
 rkMWSWOMRGqp0MxNRLc8K3yjZ7TKkysQmpg5tIPxsrV6Ipn8MNNo2Nl2y
 HjW+Ek6FYy56b/x5BuAgdt21dIDiaEYYicQKPLlJ786pR7S+KPpw/dOtd
 GH6x8sQ+aMItdwA4VUwjXnLmKq+H0zE8iZ+EYVdfqy6AM2NemCcBjj4dk g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="347403389"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; d="scan'208";a="347403389"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2023 13:21:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="795074620"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; d="scan'208";a="795074620"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga004.fm.intel.com with ESMTP; 21 Jul 2023 13:21:58 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 21 Jul 2023 13:21:58 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 21 Jul 2023 13:21:58 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 21 Jul 2023 13:21:58 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 21 Jul 2023 13:21:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jShl1D0cQE+Qmeq3vbsxZkwz4FaiQ8d3B8YFDSjhSM+VgliqMZoR6sxY3jQdrGJNEFgfony6YlLi9LR7On+hBWSLbs0LcX8WAeXfWpUsriqBAYWM1h7I2aUvdn5HflT0TZn3XssYoQChBtfEufFP0Hqwo4pDr6mbgpp0+Tv/krWI0WesSPz8I2/9Ij8SyUOQMmaTphvvCI34JOC9rDpvKZ8hnZQIHoTIsIExugfSbOiz42fpxfny0H57Dsp6+xLlVVowY2leQy4UZMZXCjqvCh/STmABe4SXmI8YrASq1qkI54oY1i6VIEjKkhDLd/VJWrWtxGLEqPsAx3lSYepLmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H9qeD9WDXSJpYXGM+NN8obgNWDs0OLSAmUMtyTv3cbI=;
 b=Rf3gCwMUGwZdISOtUnAOW8hrzkbEw54yW6+mDfTZB6cQChl0evxbURX3DQNA1WuJGpVnL4k8pMKdqdFkvKV8HsrDzDvAMoFNte2RF1Xp6Zz4ydUuo9YCxy1fxS2mVVsAWSaoclmg1Tx6h6uCkW+yNEVTC4FKo0l1bMP0LmImvzvOday4c9xMRTMeawVxSyoEK6n3RTDc/mERmFjMiiQZBhzs0DckkvRXmT5iqboqkltTUtQVtJT447C36SRKmbGX+3oCsbTX8pCoqY8Plq3/VMINKa/5E4wMAY9SZNKcTQGujNCsi3ahp7I3MbSlA5o59Ax2JQU02VIAVRPYIkZ9sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA1PR11MB6661.namprd11.prod.outlook.com (2603:10b6:806:255::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.24; Fri, 21 Jul
 2023 20:21:50 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6609.024; Fri, 21 Jul 2023
 20:21:50 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Fri, 21 Jul 2023 16:19:11 -0400
Message-ID: <20230721202144.269837-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0171.namprd03.prod.outlook.com
 (2603:10b6:a03:338::26) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA1PR11MB6661:EE_
X-MS-Office365-Filtering-Correlation-Id: feb247ad-50d2-42d2-86b2-08db8a281dbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sGAeeqvZYcLlIiqz1PaKWXMhodgUzro23kVoKWLQVr/IdWCt2FEwI8XVEZPrF98DgDNg8SYaQcSlMNCosYuuH+e+kJVKYYOk77nPrNbKm6z4kTvW6xS6zyvB0IYd3JUvT6d4f3QtTqRIkjLr+9Ff6cSrDfSP5Rt3YclxIVb/2+ivHiMEb/JPWkpQdyFCKVdd4+kRtKxFcAhxGK1otz4MDuENnxZNodY/BIQ4UlQsfD9pePZxkLGp4PNEzbPdT0Tc5vWl3sWe75Aa+lt6DB8s697O5FkGdiwtzZGfU9KQBkiG0s6Sxd0mP6Ixu8bGEFU/eki2jaztH13ZvLvH0bH3m4CFsEzkelZakPi4DeNfsCIhRcdvZB7xf4T51SFxoQ/LscGB2XfituFrT+GehR14uEX1HtKJw9UJMJ1iqhuFlJMgaEf+/Kfyye1ZHlPEurnO2dtnF+OXzo3eS/GPAHz8KoGjx7NEORrvfmYSKzo4UjEHhTvWunVMAqdzXRFKiT86kKXUI2k4p5+V2QDeP6OWAStMurFqZFRyZW+mQmtXXohLL172GBKpmjrNx4ohFKJ6
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(39860400002)(376002)(396003)(136003)(366004)(451199021)(6512007)(6486002)(478600001)(6666004)(6506007)(186003)(2616005)(66946007)(1076003)(66476007)(107886003)(4326008)(2906002)(66556008)(44832011)(8936002)(41300700001)(5660300002)(8676002)(38100700002)(6916009)(82960400001)(26005)(316002)(36756003)(86362001)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rctxyRl8j2f7IhmLdwJT8R4GXHeqI2KuhYRGvZn+Kdn932YbE+gtXDGZ3+O3?=
 =?us-ascii?Q?/QaKOTpeu555PzvBecNxpRxqhlKboVAM0xSc956KHCFqC7f63rAM+p0gML1e?=
 =?us-ascii?Q?oRvCJ/eUGv5OYYUeFVONfxaTRVbsaHgjfKdMinJ1XZy+6mNMXX6S/f8nZzxp?=
 =?us-ascii?Q?x5CfPTWkSvHxgnBiaTIyI90KY6oZndT6uzOsOpz5SrQMCBtgyK2//SIj2PdT?=
 =?us-ascii?Q?Htw8RpY3C7uFWzN5TEabd5WVwPVgGTwyKmbjcSyOE/fTdoB+/CVcXh+vlTjE?=
 =?us-ascii?Q?irsP0qOZHa7VkAVWMITU2RYlJHDyRj/T0m3Todc7WQWTT+a4EAXqmCKIgwxQ?=
 =?us-ascii?Q?tuthXA0jt3ykfVe5F7QTnjYGQ4ArmXcTYQYeEQGvi+Z2tZiHJo5T655o4sac?=
 =?us-ascii?Q?2fhGWpx3PkqhUBAgmmjFNZNusHt9EPkpWUUXS7Y+mYBLOExD/aLnWXlqyVrg?=
 =?us-ascii?Q?RLcYBxCyVWq/W5Jk65jZ9lQ3yXfD7NaMXxdI2sKdwMMbIVx2yJJa7KdyzCVF?=
 =?us-ascii?Q?qUgB06VrDRev6L9/hVtZqP+ybEJs7R2hQrqOG8gCbDEigS7zCl/88SQftlbI?=
 =?us-ascii?Q?WNIuvjWRJmhJhCzU/02xQ1kAxmYf0qvyI+e5zKAEOIfjXvKj+G/mEkX3gdb0?=
 =?us-ascii?Q?JLI/XwP44DFZife2exPwQVudMUYazNTUIVkfiY9P7eVNCgRxdU9DwpCKlly8?=
 =?us-ascii?Q?iC4itAA5w59KuP0hVh2L9QQm/SLHJr9aRwljYKVWjIKOwS1IohiO26KnVVnX?=
 =?us-ascii?Q?dpvchW9uhseg7rS6Ml+VCR6gCbMYI6lEkAy9pgDND3CuobjO31UnXoCqg1WR?=
 =?us-ascii?Q?GhagdsGj6TdZ+sN34GLCFAvjXw9T2PFb/16ppVK92db7W4Ll0IjRvEmewloC?=
 =?us-ascii?Q?8FqCXXFtXtpYlmgq8d82dQGKkB+2Vrir+QVg0ipo5RaXcE69Kn7BI2BqfY6P?=
 =?us-ascii?Q?ahhxK40nxdQsOrf2uLvHzOjQsVmFFqbT5nq73PPeedGGXqKpUIerkkXEm7F4?=
 =?us-ascii?Q?BEv9Ob5O21+NwH/AAQ5jOYy+Q5uzhzVLok7jJSI1Dh2RdKKZDKGdHHg/SBoz?=
 =?us-ascii?Q?X2ThWHQEESzRMQnxQlY5d9fUsAksy+80piFZSWhnvGU9IjiC454fwD27C6k2?=
 =?us-ascii?Q?0za3EomRB1ehPGRgkhRl7bP/OCJ3nGhAf9iPFFeEftecpXjv73ETLr7ApImg?=
 =?us-ascii?Q?4sDkD199oe5VXiUTb2xl1Bq/iIUtCo+cqm68bEhF/MXLXvXZRenGrPu8TFpa?=
 =?us-ascii?Q?0nKWOxtAMWBb8gMXVEfOw4qq/QinbpohDp12s2irz4tyxuyL2/L+gdDtKqgM?=
 =?us-ascii?Q?M1hUUVv0yRekwJEKNym50Ksf8X9gjj8dF56XduZwGuYOf9DsV3+A8ksKaNLn?=
 =?us-ascii?Q?4aNQ6p55ln+aMDq/TFxNb+kUdVyj9wgKUn4iaXUfDRvixInAtz2y3kaPdyOP?=
 =?us-ascii?Q?JFKpMZ3AEdY9PlhjjlMs01Ho1/3lP42PuArznMTXlwbRBlAsdvL0oJL68z+z?=
 =?us-ascii?Q?ue7P4WcJKtQQmYFrg5kmD1LlsEfnzWrBD4SdpceIQDH69dOSV8qg46Z1FrbI?=
 =?us-ascii?Q?2ADU8mA6XN3J0Hzbwu+u5QOqA/GsJrzcwZvRKoIJHOfIMPi/AUnt1T1m8WAP?=
 =?us-ascii?Q?CQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: feb247ad-50d2-42d2-86b2-08db8a281dbb
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2023 20:21:50.7249 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BUZsexGkwc6S7mDbifaGTym587jFjoYRWird0LlqnclZcPZsAdIzFrntqhRE4Gdkh76vsoDkX8xcFdoYMNDIQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6661
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 0/3] GuC vs Execlist
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

Since Patch 3 may be controversial, I split the work in 3 patches.

1. Mandatory. We are not carrying an uapi to state the obvious.
2. Mandatory. We need to limit parameters to the non-default stuff.
3. Please, let's not take dead (untested, unvalidated, un-ci, unsupported)
   with us... Fingers crossed.

Rodrigo Vivi (3):
  drm/xe/uapi: Remove XE_QUERY_CONFIG_FLAGS_USE_GUC
  drm/xe: Invert guc vs execlists parameters and info.
  drm/xe: Kill execlist support.

 drivers/gpu/drm/xe/Makefile             |   1 -
 drivers/gpu/drm/xe/xe_debugfs.c         |   1 -
 drivers/gpu/drm/xe/xe_device.c          |   1 -
 drivers/gpu/drm/xe/xe_device.h          |  10 -
 drivers/gpu/drm/xe/xe_device_types.h    |   2 -
 drivers/gpu/drm/xe/xe_engine.c          |   5 -
 drivers/gpu/drm/xe/xe_engine_types.h    |   9 +-
 drivers/gpu/drm/xe/xe_execlist.c        | 485 ------------------------
 drivers/gpu/drm/xe/xe_execlist.h        |  21 -
 drivers/gpu/drm/xe/xe_execlist_types.h  |  49 ---
 drivers/gpu/drm/xe/xe_ggtt.c            |   2 +-
 drivers/gpu/drm/xe/xe_gt.c              |  12 -
 drivers/gpu/drm/xe/xe_guc_pc.c          |   2 -
 drivers/gpu/drm/xe/xe_guc_submit.c      |   5 -
 drivers/gpu/drm/xe/xe_hw_engine.c       |  16 +-
 drivers/gpu/drm/xe/xe_hw_engine_types.h |   2 -
 drivers/gpu/drm/xe/xe_irq.c             |  11 +-
 drivers/gpu/drm/xe/xe_module.c          |   4 -
 drivers/gpu/drm/xe/xe_module.h          |   1 -
 drivers/gpu/drm/xe/xe_query.c           |   3 -
 drivers/gpu/drm/xe/xe_uc.c              |  32 --
 include/uapi/drm/xe_drm.h               |   1 -
 22 files changed, 6 insertions(+), 669 deletions(-)
 delete mode 100644 drivers/gpu/drm/xe/xe_execlist.c
 delete mode 100644 drivers/gpu/drm/xe/xe_execlist.h
 delete mode 100644 drivers/gpu/drm/xe/xe_execlist_types.h

-- 
2.41.0

