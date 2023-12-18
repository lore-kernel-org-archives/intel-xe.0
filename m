Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E266C46CA2
	for <intel-xe@archiver.kernel.org>; Mon, 18 Dec 2023 19:01:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D57A10E277;
	Mon, 18 Dec 2023 19:01:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A797B10E39F
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Dec 2023 19:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702926047; x=1734462047;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=AWmwo8So8ZpIHpRcUdA/SZA7GXrQncwIehqjHaIS4do=;
 b=a28AeHLNu/eGYyxakw6/Mc1qFeMyc+fMnSpo6X9wNkZMwep48aC7YIzz
 OQpgtCI8TlrnoJteoIULHzktA9t4JVK/gkShGYZQu2KL1IE9gKV+AblIR
 im024PjdoF1RarRq63ArS2dmC0IPKP3ZpGKs32X3yr47H1xxmMuzRMfhL
 rpb9/Vhz7X/c+f+jIbsW5WyBNDCn29noVgORRQgPMBuzbF6l6UHasDUMH
 8yYed+YvYzstfu8cjOE67iuhHxMMeHhD14kfBWYSnj8R+yZWFipLZ6LRf
 1u8EK4ZZaPqIaGkN/OVw/6wXOMWcoc5hh9R44OIpmXxfqkwp5KhspLVYt A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="461981716"
X-IronPort-AV: E=Sophos;i="6.04,286,1695711600"; d="scan'208";a="461981716"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2023 08:38:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="841544191"
X-IronPort-AV: E=Sophos;i="6.04,286,1695711600"; d="scan'208";a="841544191"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Dec 2023 08:38:29 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 18 Dec 2023 08:38:28 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 18 Dec 2023 08:38:28 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 18 Dec 2023 08:38:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IAVu+CwYpv0FH2xnUXcvJLHzXJ9vhSXE4d2VLdav3jVwZ5AXpnA/du2gaT5/6LjzoVf6F1x9Z55J2jcEzhNErihgBb50PpDUegAQZzqmT6h++HyEN+wNJWjVo5pJJQg3iX2s7UiF6rkdQAXfzl3IrI9RmN5i2g9cSLNVc5W+hI3mRdq5t6H52Wwa5qbxb4tUU+TsreHDtJLBgu7lDipjRzc8Nzmc3Tq9AQICcp2jl0+/KwXTmOJkO8BntcvRtBkULABJd1lIxBOpsnjE4qLKgM3PzJqFyNYZFDWzm4IkGKn/KfThuBinjdE1nLFm6/0zK3Ef+rbOpRqogqMYErr8eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NTDiWbdRnccaf+em3sqpluHDzbsYlFxSWE17yGhifAE=;
 b=B/jn/sF/Hs9d40rDacFa0gkerAnZynKjuIaL6j72OGE9oEeMzPvFIlu/oKZUaS3CEBKu8Ew+OK3NPByYoLzpRqNXK12+/4WT9wnzfynv58tTQ09nqOLngt61B3ZD6TsQWUIxNE/ijNIeDncdWdIcCeUzFYR0jt0cnsSpWbcGDmA3oJMBgI1JvqOSp9GCygqujxNVixkAwTzn5tSUiCblK5fT5qNbGuulR59nHS7blTICITsPmPPSX4kr4cSCSlOSNP8tp8mKf2K9LNU2+2BOgrdf0rM4IrrJg1e5cWBrtPrsLGiBXMFp6zUYDft7Kgv0QUMCi8IBXMjS9qqBnc/9Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB5198.namprd11.prod.outlook.com (2603:10b6:a03:2ad::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.38; Mon, 18 Dec
 2023 16:38:25 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7091.034; Mon, 18 Dec 2023
 16:38:25 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH] drm/xe: Ensure 'passed' variable is always initialized
Date: Mon, 18 Dec 2023 11:38:18 -0500
Message-ID: <20231218163818.1700983-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0028.namprd05.prod.outlook.com
 (2603:10b6:a03:254::33) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ0PR11MB5198:EE_
X-MS-Office365-Filtering-Correlation-Id: 66ada3bc-eb1e-4aab-2a51-08dbffe7c162
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: voaSP8iyzydp1j7zGNiFy6pEqrbR2qWC9bIlPk4rx8YAALYMZ45AvuF8I7xrBIfR2kI7NrwHE0r2dsWoalOJIAy6ru8BOhdqZtS20URrAJ09DhMr3rm/piHX5DbIiIhV3cvbcF4NBMwtMKAgVC4UGXCUQkRvLhIj21N3rSiBJaLGInvrUamEeFOcKpzOFnNXXjzrYPf/LHcQtaLAQsmRqQuTDIJDEwWynI5dFIqnDuIHaOPnPofcqR2MmH8Nq7RSUTzijkOw5pM+KQMjif9ADS9mGHsMn+cHJlqkCo8W83KVMfh7qxWrMn0sW3uTaCZw1zZgEEG15dbVhPz/Bxg63042TLYqFpfGENGrR0RyitBu2nY5Uldzxm88P1GzI6rfFCoOzgM5IclHxYBPugs5Eoco2IzWIadZmqhuvnSXDS/Ktzk+ysnkuF7r8GbM0PJZtknK+/IUuD0XQRA1QWRo+XuAW2ET93Go8fRXUVbCpYFhBkImnvo1T9ueNbLHEhpducmPn5RYkBqRvBcYQL2/ibCNG9e1naE+HwCa55nBczoIlaaU/0MMm5GR/c+OX/6mCEOi1kTDlKDH/ZM3yMj3BLXXINFgbjwHk1A0LygafPMRdIgFINA5ynfsf0m8Znud
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(39860400002)(396003)(376002)(136003)(230922051799003)(230273577357003)(230173577357003)(64100799003)(186009)(1800799012)(451199024)(1076003)(107886003)(26005)(2616005)(6666004)(82960400001)(36756003)(86362001)(38100700002)(83380400001)(44832011)(5660300002)(6512007)(6506007)(966005)(8936002)(8676002)(4326008)(66556008)(66946007)(316002)(54906003)(6486002)(6916009)(66476007)(41300700001)(2906002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0NrXPFfsaczhjiEWqGTfWoMSbyzk3VaAJj3hN9Gw6rnI7YFuqnss8a0QVGvu?=
 =?us-ascii?Q?ciw+bhVxJCS9/NBq6rkMGOLDZezmX54iPeyg7+Z++j5WF3KISbeNgv15aXa3?=
 =?us-ascii?Q?mTzxZdWgGmjyGtiQx2rSRSdMfUpyBKnLSLhE2dcOR0nIbsp45f9l2WVH1luI?=
 =?us-ascii?Q?OyZX0++qAqQFjS+gFlM0wwBTDX5c2U//JAfESpqPHpBmH/Lq/2PWRHQFR8e2?=
 =?us-ascii?Q?GKLiusDsAaRbX3hqOuJShtTd/PGwOGTC91+hdek0vESrlgQGLvJqf26cCgId?=
 =?us-ascii?Q?iJ2rc1HV6YJJj1lVsdq17q79LBd170YZyS3a9AUV+wk4suHTBntQkAYO1h03?=
 =?us-ascii?Q?6AfYUIj4r72Lef++GbVwx42Aol/F2mEMyM8JfzuDH54Tlu38uJnkUu8TAo8a?=
 =?us-ascii?Q?aVHIa87uOdC6Qh2Tcyd51GY4Rta8YacnRfY1nR47K2IF4x5ao90YynrAcJPc?=
 =?us-ascii?Q?4qjrAkcu0400ZpGNlsbhGrh0EZJB2XXJB69UGoZUj73qgiQpyVg6zJVsuNkf?=
 =?us-ascii?Q?tDbydlr8ev9VpRyfpwW5veB8zyzukOth1Rp3OnLNUMrtbBC9OuWZ3Ti11XCz?=
 =?us-ascii?Q?Rk5aUPbuizBos069hsNMdK6V43dD5gISECa1rC611pw9ztzYA8XxH8Vb+9yU?=
 =?us-ascii?Q?oNNJ9jD+IWYzGJOeSudXS37BI5IyLZ0TnhYlN5NEepJiSPiZa8l50db/igOx?=
 =?us-ascii?Q?ijqiqfBjc7wvWHagQWpz+lHNl/8Jjg7q1uZbRFEymp5/G+qYYtYAZw1avzx0?=
 =?us-ascii?Q?zfiUk783DTVP4fVj5fMPbR6xUI7YuhlRxBswpA9AZ8bNdTegFxZL9gqmWG1A?=
 =?us-ascii?Q?ao7LaGWxU+C5VdY0LL5KEnaskJjpt2dJqgCZtJuw/2xABFKAVpTtdO6tv3BV?=
 =?us-ascii?Q?t9rAwzp0a+pALhRUmLrhDOEjHjIQbX9e61pNJTo3GgSgGeRY/kNqVfFV1UX1?=
 =?us-ascii?Q?hON3x+VHXXl81KmPQlJL2k4ZCDZwdRI8eUyJbxOaLU0z3GaajHE3XdkNG1/1?=
 =?us-ascii?Q?kRs7kumvZASZgyu8akUemtMpJv2cPZ4fKBdtclezujST8llwK4pohZJaZDLm?=
 =?us-ascii?Q?ucwLsaHL43cH/7+pxDGhZNAbX909HV2zG4vxaSFOijsHkhex8TzrDpJeKhWZ?=
 =?us-ascii?Q?5lR4zg3zS4GmJWm6LzwdgKthb6QcVsozSawTtqlb6iJPyka9rkt22wqqWdx8?=
 =?us-ascii?Q?Ju519EpaFJEzXAEUU/99yiLbYXRuFkwrn89WqHT/Aoz2P47sB/r/4AbntHsP?=
 =?us-ascii?Q?BWr2Jb+93E4TnNPqZ7QQGcBocGgI2idZm/tf7qCtO2AUWfUSAg50oGlUSPAU?=
 =?us-ascii?Q?JIad7fCnxkUEkWQ6fzLdt6q89xy5p7+mMMEGUxDgIbKfkwpI4my+pLy7M554?=
 =?us-ascii?Q?IjApMZCOA5DWgT7y7iakpbNkzcAcvwb4tgcOu+5IAtWMgmY3/Bbp5G1msW3m?=
 =?us-ascii?Q?punHdcnTDYDsusmAEDqlpYg5ruus6pO517KY6rWGWyW3peWc/lK4s3iWzq1t?=
 =?us-ascii?Q?FrwYXYaRoiWCJXCbeMp8ZR1K/v2tN79aaKmgCDMwMsYIX/7F8az5qc8ScXg9?=
 =?us-ascii?Q?fuSsL1ymeSTaDh5jBF5fA0iVKVV6oD/jXjbuel8P?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 66ada3bc-eb1e-4aab-2a51-08dbffe7c162
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2023 16:38:25.2399 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p5H7oXJE1KNiSspi2sjH/iN8pdDaeSVKBxASBBLTZpyH1dPCNtJCzOWXKKkBL+MTzOSVeRFsoB5FvFAw3B1AQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5198
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 kernel test robot <lkp@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Although the path should be impossible, some static analyzers
and compilers might not like the fact that there is a path
where 'passed' variable is not initialized.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202312170357.KPSinwPs-lkp@intel.com/
Fixes: ad7d86415578 ("drm/xe: Enable W=1 warnings by default")
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_wait_user_fence.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_wait_user_fence.c b/drivers/gpu/drm/xe/xe_wait_user_fence.c
index b0a7896f7fcb6..b2e76331bfa73 100644
--- a/drivers/gpu/drm/xe/xe_wait_user_fence.c
+++ b/drivers/gpu/drm/xe/xe_wait_user_fence.c
@@ -19,7 +19,7 @@ static int do_compare(u64 addr, u64 value, u64 mask, u16 op)
 {
 	u64 rvalue;
 	int err;
-	bool passed;
+	bool passed = 0;
 
 	err = copy_from_user(&rvalue, u64_to_user_ptr(addr), sizeof(rvalue));
 	if (err)
-- 
2.43.0

