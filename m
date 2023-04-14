Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0BBDC77B6E
	for <intel-xe@archiver.kernel.org>; Fri, 14 Apr 2023 10:28:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 899C710ECBC;
	Fri, 14 Apr 2023 10:28:18 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFAF110ECBC
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Apr 2023 10:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681468096; x=1713004096;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=x3rCuqYeaSuMwEnX6NjsE3eoKSqbe8wmpsmHP171eA4=;
 b=VpJqu3+A/DpE883lVCG8ovRH17vFA30HWRtgIZSocKT5L+Fxuo927bv3
 /7dxnMke+V0ZhQCacaFHyuD9/phj6Y1SigBniOUFtGk41aTYTRDMWEQWU
 4pYDtmvotFoarFeOFw6FMz7dQlD1j1026nZVYk/aA2KI6cyYrm/iqF+Cd
 ouNJ3ahP8BXuWUDPUJwfeKYOa23WUnU51/qEjoFc/cII7YlSEcxX9zju4
 XPgYxTLhRzfzOf2gBrq2i4Q66d3Q4+irmBtvA0Mi+yE7MsNuzF8hy8q34
 WF4p3dX7t2XhiluLjxreobjYgA+COp9YT9U3QoinAEc5C9X1K2V4iT4C2 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="333204659"
X-IronPort-AV: E=Sophos;i="5.99,195,1677571200"; d="scan'208";a="333204659"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2023 03:28:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="720238988"
X-IronPort-AV: E=Sophos;i="5.99,195,1677571200"; d="scan'208";a="720238988"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga008.jf.intel.com with ESMTP; 14 Apr 2023 03:28:15 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 14 Apr 2023 03:28:15 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 14 Apr 2023 03:28:14 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 14 Apr 2023 03:28:14 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 14 Apr 2023 03:28:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JaeIs0nOyWhuf2CqouGV5zRoQCQDpVwUANe6zpVgKqPvekP3yYOJKNHuSunHvZA2UZS0jCDbbtIwVPleWiZJrypSnfV5aDGjQUsRuLYrxcm4EolDeSp64xjMVdzkfJUlDVI91NxPNTfJyMrjwveVhuJbZ6a73AbILJykQbbLB2UDzaFvm8cmftEBM+btBSSdC1hgPJ2F0unDrmQDy0WoyQcxHHc0+20frtCUd7HX/3m6KgvfmCLlRa7R7ssb8K6GPt/zXrmzBt6Tg3zJlvYFQia5AIAC8zRM6LzOOAU5QHRluTGXzpy0juGS4PYvJporalGmZyp7Eas63+QtXiPBwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LKnNf3OIUuszEn7+oR4x0Qq8PJxVZNnYPgZjAmGCCdQ=;
 b=Wnn+Szw5mGGNk8uJxl4t8mdFDZr/819yu62WFg+muaxbNbta/jCyfmX4I0pl7xS+spjpFnvIXiwBEUYYDieHeemxEzuFhbTJacfRvGq1C2rm5yNCMGzzakRz5wDkFWTu3gpveB0avHEzhE/xOmqpObDICzLT/6Kz/GHloWAhgsiClSJsMcL0kR0Tc/zgLLcEsAqbI1Lz32PyKJyn8nOT9ZYO5Dip5dVkKPDjfCNId53pfnjynGoiRapyRJooLMY7bbefFtEy2F0AftwX0AA7yNB8GVVhzus2bHBIq7X53Zz1Di19maKGubE/fV7oQBVEj3TxuG+D+KXiwuwEe19PvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5389.namprd11.prod.outlook.com (2603:10b6:5:394::17)
 by CO6PR11MB5601.namprd11.prod.outlook.com (2603:10b6:303:13d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Fri, 14 Apr
 2023 10:28:11 +0000
Received: from DM4PR11MB5389.namprd11.prod.outlook.com
 ([fe80::23f4:7c29:30d8:f534]) by DM4PR11MB5389.namprd11.prod.outlook.com
 ([fe80::23f4:7c29:30d8:f534%4]) with mapi id 15.20.6298.030; Fri, 14 Apr 2023
 10:28:11 +0000
From: Francois Dugast <francois.dugast@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Fri, 14 Apr 2023 12:27:44 +0200
Message-ID: <20230414102745.2848028-1-francois.dugast@intel.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LNXP123CA0013.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::25) To DM4PR11MB5389.namprd11.prod.outlook.com
 (2603:10b6:5:394::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5389:EE_|CO6PR11MB5601:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bba1890-63d2-4aff-162f-08db3cd2f1ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LpDVHi47wZPylt3GxarAad6gty3EmASrYpngQQutxXfGWxak6N130IodOR/K+EtKTNoH74Hcjq1TkXwFjMVON99FyfIor7PcJvmh6b8lZMKthT8vBkDJG7/5qeV4hpdPo5FZfgXqiIsXYaWnJU7PzWEET3HTL0LO4x8wrSNTyyGUoDxWmV2k+nBVRoi3Bkwqmbv2ta5QSKXgZGIXnqqbFnKV2YFjF67hlYBZcEdw0Y/Y8x/0qeVzni8LXiUqCazLnctyA2lT8h5ZONYkXp6j+mir/NqMKeAx1NRgEhVFanLKwDXYn8PevoWLpaOa4vitY6fc0gehB/X36U5NnNvO0XJdIDS68JH2mY0PDeBVXr3+2wexOFmLXUKs4KcdPSv4hhp3O8vtn/5qeiHza/n2ZN3lf+PV8ODGCY8r60lxto11SOPFm8hce5xJ+COL8hK7F9vJ27azh4BwAv0qk3OnJT+dU4vW4jnXgyDp9CAypIjOPgsIeOFU5f8vuEtcJ2CNJNYFlBMRJGeoF76i3mh/gg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5389.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(376002)(346002)(39860400002)(396003)(136003)(451199021)(83380400001)(36756003)(2616005)(86362001)(6512007)(6506007)(1076003)(26005)(107886003)(966005)(6486002)(6666004)(478600001)(66476007)(66946007)(44832011)(66556008)(6916009)(4326008)(316002)(41300700001)(82960400001)(38100700002)(186003)(8936002)(8676002)(5660300002)(2906002)(4744005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?icztzusle5UTDrAH+pTZDCWdxm9Vel6md2/uDlxKg7QP7aCUnnJplsOhNwPV?=
 =?us-ascii?Q?G6jHqgPTiXMK1xYG78dmQs1xnxNrwD4QseWRH3If6Yam+YxdXj9YZPyr0CW3?=
 =?us-ascii?Q?6hwKr3LyboGgFLiO85WhDFbsBKfADQ80Rd4plZh7IvEOu1O7AhB0tPFeGmC7?=
 =?us-ascii?Q?bvG2pOF5odk+nF9eFeBDcfb3y0qhnPHP9jueodKPDyIfDk9n1OOtKocpkhih?=
 =?us-ascii?Q?4iJS5mmwYE4vb/lp6I7IffEIzT9LIi+415cxuPQjZF1ytJCxgMuUDgLYLm3k?=
 =?us-ascii?Q?1yZ9Wvhwqz4CxBGuCjw+TOkGGq6GWKwPLjLNM7iVyPk4arQ2a6YzxYIwSQru?=
 =?us-ascii?Q?Xu5/i13W5wMvE7rYPKiLJq8ixGU5IVW55/CJFljWn2LGgdC1TyPu0sx5Eqt/?=
 =?us-ascii?Q?RSs6UTwyDhuKat0dRnS6Q5z0etGYHFsnc0YUF10ofYqMnhx5Zlpi4Uyja6C+?=
 =?us-ascii?Q?oMrRHDL1ZU8O8fhgY91ZWQgie/1jCrW1BHxPj/1JSg7w9vvhwdgIoo5jsPuS?=
 =?us-ascii?Q?DcO8pFdkrGJ2qrgWhwYGYBB4EOTeS1k4f+jX66Cx0PY53WFLDlsYySvl4zv2?=
 =?us-ascii?Q?BgVKsj7gZ7sfYzqRLNKftkXXiTiHYqKAnsSNiML0uVodt/ioy4uVVglVuRpR?=
 =?us-ascii?Q?QbbFxYZhyi3VnVbIbyol1RYqq/UG9o9jjY6q8nxn7/aMOjqiX73A/z3+jIxQ?=
 =?us-ascii?Q?X1VBuxmlJp9n8VpZFZ3B5FCW1hGQOiBSJaUREW7W0v52DQy6NzQR1uy8EtCe?=
 =?us-ascii?Q?VVvw4lKeRqZMrBGPXqR2CDwi3xKD3qXnn1VGkX4Wyr9sJUdG/LWaU4O7epwt?=
 =?us-ascii?Q?ICHv4OSrRNAzxACNJwsru9emmG3GDKwxthQ8c0IFLzWt4jC+PC1GLetCKnxY?=
 =?us-ascii?Q?wfxVrsweK20BsaVNBDM3T9k9ucPFtZdaNtAGfmdyWsz8uQH9fV+xnQSH6WnG?=
 =?us-ascii?Q?REJF9Bkv0ZNKs6oBxSelfpqf54+/WZaY2z7CaN5IbZcdINeimKkr+S8fCC6e?=
 =?us-ascii?Q?msFdrQHghLVen3sDeUxWkgz72HKjTuje7CcE+R+GHkuSU9qVboeyqwr0A3Fn?=
 =?us-ascii?Q?FHo3xdCYzS1rTNmt9xukoQfEiLMC6BHCmGSCss7u2lg8xiYXrKhU+Qrxowhh?=
 =?us-ascii?Q?mvyQ3BYtfHM5DmLHyeqIg3gg7Pr7yzpSJdWfVnAAnvjINU0e3Lh11aJKRt0p?=
 =?us-ascii?Q?+vknUZz3dvvUr3JYAVdKzfyQKwpceluMX8S06xvyBp0UW4j5db0f2TJeEnd9?=
 =?us-ascii?Q?fqB6Co0MWoLeAmALjobz3fGYJvtoOqpKd3jhZT6xF8OsjkTtmFvHf3zRvOAU?=
 =?us-ascii?Q?edrt1YRUwauEznbLbW+W/nYn/5E3SIFIWmm/+mELnwevjjNwSXnk38whcZud?=
 =?us-ascii?Q?Ywx/M7CUb2agvU2k//MK9jKneQi3p6z0zwxq13UP4JaZnkRJL55pcNRHlYRI?=
 =?us-ascii?Q?GqSb4QBfv2dDRXCif5iKDxx8C6HMe6X9WavzayRIa9syg0xJycebcksM/RWQ?=
 =?us-ascii?Q?eiE4HlCaJggudaHPVkgHF4WtoYMgoeDGMT0socmFhoDAnQ2QjWf7jE5ElFPF?=
 =?us-ascii?Q?TFR+veV9mTol1UXTjiEieaLZ4jdT9JVNrN6ZTi75RKuiwDl6TCk1Z0uD7dQv?=
 =?us-ascii?Q?3A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bba1890-63d2-4aff-162f-08db3cd2f1ce
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5389.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2023 10:28:10.4228 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qBMZXJrviq6qxMKS7AuQysC7Qy2eBpYb70A2Jny/8IK4CZFj7n36JTutDfe7zTp2ESuh6j0yvNSKMcS9UB8l13XRO/Yb/Bb09SdND9brqFg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5601
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [RFC PATCH 0/1] drm/xe: switch to using drm_exec
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

This makes Xe use the new drm_exec helpers provided by this series:
https://patchwork.freedesktop.org/series/114464/

Tested after also applying this patch:
https://patchwork.freedesktop.org/patch/530670/?series=112994&rev=4

Results look good in IGT tests.

Francois Dugast (1):
  drm/xe: switch to using drm_exec

 drivers/gpu/drm/xe/xe_bo.c           |  22 ++-
 drivers/gpu/drm/xe/xe_bo_types.h     |   1 -
 drivers/gpu/drm/xe/xe_exec.c         |  32 ++--
 drivers/gpu/drm/xe/xe_gt_pagefault.c |  67 +++++----
 drivers/gpu/drm/xe/xe_vm.c           | 217 +++++++++++----------------
 drivers/gpu/drm/xe/xe_vm.h           |  19 +--
 6 files changed, 159 insertions(+), 199 deletions(-)

-- 
2.25.1

