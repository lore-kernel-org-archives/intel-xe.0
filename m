Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 132F5C77B75
	for <intel-xe@archiver.kernel.org>; Fri, 19 May 2023 13:19:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3BDC10E05E;
	Fri, 19 May 2023 13:19:11 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0155110E04F
 for <intel-xe@lists.freedesktop.org>; Fri, 19 May 2023 13:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684502348; x=1716038348;
 h=from:to:subject:date:message-id:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=MR/12FAZLNvWAw2Xx0GH1KcusKaSYUQOZmqzU3TKS78=;
 b=H4peERIi7LwJcmnf7632+dwamNn71j4ly5fCIxhhMWL+xkE2KGj19aiP
 kea/Jezq57CWCPvmR8vtAfeULEckuktbr7xv4Q8O+7FOxyHG5M7saHFxM
 AhY3tFnyLdut2ju+g9leOYzoZFIa/+t9X2dMc1rX+ZVqsLHjEIF3mdCtt
 FqVJ5yXWjTzTmzjGe6crAYlRfM8BnzwPyLHGlezUnrwSTArPJthaNwD10
 rmWMWo4ITnY1c0u0m3TgQ3cb5dLYcpw2Y96VllHG8Jq9/xnNTAeJX5GTi
 8xyuDlqN9K02ABBiThBlqOxw+7UEIstBArPr7TBWLlWYddPwVZgd/T/Tz g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10715"; a="349881947"
X-IronPort-AV: E=Sophos;i="6.00,176,1681196400"; d="scan'208";a="349881947"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2023 06:19:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10715"; a="826782253"
X-IronPort-AV: E=Sophos;i="6.00,176,1681196400"; d="scan'208";a="826782253"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga004.jf.intel.com with ESMTP; 19 May 2023 06:19:08 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 19 May 2023 06:19:08 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 19 May 2023 06:19:08 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.47) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 19 May 2023 06:19:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QU1N0F3pgjkPsHtk76Me5KNPr+vo70TQuclq+2f5YC5xOh8/uCwmy9O69OH/E5vABWwg26AbuLEudxeA3tsVUGhmygjFy1tuAfk+4syJj21jNUDb/B9onjRxYZ0UdvIig2fP+XvzoBnRwFPrsrqjjv83A3J5jEhCNb1oWVEeEa2upZAf0y9Zsqsm5Bp3/xKdfFuGuVpumqK2x6M24rEwZIiC7ySprqqizo0LyEMlSkWL2sfsIfnpwYGEUnpkmNlDjCU3aUHrFmziSXzrqMisDq0kPN6IpqMMFEkvVMjPWrE8h2iYIAjMhznojUkLGJ73MwP1ttAkCmoOqknGggTTNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fkNdKU+Gs7hzAlm1kzrlqRbVqWHTRXiPiaEz7+KUj3U=;
 b=jDfCM+GLK5d41ousxYWRDnYJ9JCFQxIGSPDzC4bjX6mboKHWntahNdEbyFBP28ymUI5gCwbd8+ghUgZeApuYio+lY3tGtuKl95KHk8YXx3y6gIkfSyts+Jvcd4mtnOzL44/T6cB59Qa2IMdVRRt95K9HQUPhK92374V3+nUD7Jy/2cxT7q64wIoG9xs1YlnyEB683DBdRBUF+bKwz2igydvbtqWxgLjwuh4QwW+zuEd2WhKIV+82RT2YIcR+toLPhLgK52uvt+69feqL7UJwuRzQfCkdf7glMMIJtAUik7ai9nfjLsPJhm6ft4CxnKSsDnO94aBHfwFVJN+QjBPfHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH0PR11MB5644.namprd11.prod.outlook.com (2603:10b6:510:ef::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.19; Fri, 19 May
 2023 13:19:04 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004%6]) with mapi id 15.20.6411.021; Fri, 19 May 2023
 13:19:04 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Fri, 19 May 2023 09:18:20 -0400
Message-ID: <20230519131820.2020660-11-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230519131820.2020660-1-rodrigo.vivi@intel.com>
References: <20230519131820.2020660-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR01CA0017.prod.exchangelabs.com (2603:10b6:a02:80::30)
 To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH0PR11MB5644:EE_
X-MS-Office365-Filtering-Correlation-Id: 6647ae24-432a-4b36-995b-08db586b9e33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 15WPZ+KtaWB/R38SBCFmkHt+e2+Zg73U/O+Xvo8wXE67NIa1Dl+Orpz4i0RmuLph6lDXrr2wVsxR+GwuhoGdPy85dAogDMALyyUbFJW7NjLxElGNNev1bfZSbQXK5/RLxAVyqlXSrG8RHKXmEWl7NzIy3/hyVagRKNjqPednkQxgc/zsrXzxXpl+JIz71+3XyYojFIGvICfds6yYSCeRgJ6eJJ4DHBbe4h1+C82AHUD4GKq1K8hq3vV6EOYZLL1Td1B3v2u3Iv7FSyPp6N2X1kBRm0kRAiEnksjboYqO6z8Gh6PUX72rUjsF1U6yOTdpavVwQg0RklwyrL1sY6gfvyPHTYOTV9A1jKA+XN+A5knQFuwvjqaWHZ4PfMlG8DisEu5Z5TL48nf0gaDpyJ0UDP8NP1ne/KKsGAWzGHEoFjFHpwWiT3+0o0Q2g+kz7MzjBfyBGJCdmLENT0sTWwNkF7mmbNJKSnkqfIWbrjY8uKPZ2n2SfUezUbw0N0ni0OfCgBf6dzeOcOXHnojU61ogPKTT0BYk4nFXvAwSQmVdUDPtIRf5igTRzxeufcSlu0d2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(346002)(39860400002)(136003)(396003)(376002)(451199021)(5660300002)(478600001)(66476007)(66946007)(66556008)(2906002)(8676002)(8936002)(316002)(6486002)(6916009)(41300700001)(6666004)(44832011)(6512007)(6506007)(26005)(1076003)(186003)(82960400001)(2616005)(36756003)(83380400001)(86362001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?t5m/MsydV6by4NutqkTDUKf0OdHp6WA00GjGboN6uy/WgQ5I8f5Gn+cb3oSV?=
 =?us-ascii?Q?gg/B6gCtAyMe9JH+njTxg7ZpjDg/dk1y2Z7SpPqk32SysakDY8rqaPEC2K2F?=
 =?us-ascii?Q?cvkBo8ADcN3DfHJokwFHk/6wZvQdV01KxLILVXU1HGSJH8wYmkDgx2CwdnEP?=
 =?us-ascii?Q?PbwpwkiuSo/37USZW34GNmFPyBx33bVHQrhM1RzMBeYwfdgf19TKI97PJTN1?=
 =?us-ascii?Q?rmWH4Ijb2lxjHHcygtIqsRf5vam6BsuMpYdRFQMe6LbCYrxvCduHKm3CXQIR?=
 =?us-ascii?Q?mAjrHm2nZbAtAQcIkhRrB7iqngEXyLtYvT5rXYCmcyqBxrdZn39ewgZ1GzHL?=
 =?us-ascii?Q?S6Nkdc3rCY3LqR/vm1Y9T9zRluhZouizjzy7YbKH3YzyiuOxs3WG85NGlo4L?=
 =?us-ascii?Q?nhCHo+rLhq1vL6tbm0hGeSd1NmQO+F6867DkHAuFBFlMeZQ3lrALNGavY83F?=
 =?us-ascii?Q?ZiCNGM67YcpE2UTCrsIxN+81dAZe3EX+TKmnzvFsh5/aQb9dKD0gto+iYZd6?=
 =?us-ascii?Q?vuwpz/fOVY/3GS8YXN3aA745mJ7fM4HvYof3nqks28PTMYpjxBuZSkNxY+/m?=
 =?us-ascii?Q?bte77GNOAHAXLsIPgquf5gKCQVSPZa/MZ5YQzQ/KNsTMROSgA/UJ1cgcIunB?=
 =?us-ascii?Q?FLs8TbUj6ETaPDh0dIARTmOZ/jlJuNqckdDJqJarHmNJnRq0IQNNKoGgHm15?=
 =?us-ascii?Q?EMZo1jDRhBrzHwlsD3fAdOEg+W8Y3BefFookU2szudcESTYAMvsrlWHAeyla?=
 =?us-ascii?Q?Xqstj7O7l+CZpM8GRm4vZbJepeggzcJ/I+Nxn4uevyzDzmEq8R+1ZvDkPwZM?=
 =?us-ascii?Q?LtuDUYHlYpD6imvdXcPFd7XON9cjubgiKtWLq/2odT95Cc2qi1Bedkn8H2LR?=
 =?us-ascii?Q?d9C2JYbcenhyl2VA4cD78+aFkfPK2K5BKytQpZcILt0s18kfOFBD91XyCu+C?=
 =?us-ascii?Q?7ikuj7XfcPF93hfA+h5tAmVh8N8Ah4zq1TFbRuYw77lcJIUDsdbDFZ5hO7pi?=
 =?us-ascii?Q?gjSFJeXfZQ6Et7z40MLPXMO3OlwWPjbwy57PPRAtCGgG958ux8Bz489SChcc?=
 =?us-ascii?Q?ffbn8OizJS343TgwEg54E3UFJSqT3jrWZSTY1slEobmEkQ0f7u7jUPfgiT/K?=
 =?us-ascii?Q?ld4LCD95EMlWV4FWH55gttefannplkVQRCI3RHPOUB7Pdu6O+YoO2BDw4Ltp?=
 =?us-ascii?Q?k5+MAn6LY7iliMRNYkKcTofW8uvxkIZiAdeSPCZwklHHmonXXcddQRxTG7/e?=
 =?us-ascii?Q?NzhoeEKFo21vViVm+agij8iPsfDU/ix1x66zKy+azLuqDo8njUIUjcXTzAZX?=
 =?us-ascii?Q?75GRfKWEyxwDfXk059ZQKizl4M2R0EJ9nWV5JftQ3LOimMdhZKIM3sno6s/l?=
 =?us-ascii?Q?qOCIohc752ZGxz5F6RaRb38oLg1KbuY+u1JnnLk6fVUegOKBBn7LkeLEalGY?=
 =?us-ascii?Q?jxaT9+hX1OodcJJq/h7Tb0gW3nJUMnqzWll2C4P+z7BvzaCiuii9htfLbwh0?=
 =?us-ascii?Q?un2Q+I8b4iTSLFl3SdDslueg0DtNfVnap/GBM21ymS5VXx3VeE1cxf2RajMD?=
 =?us-ascii?Q?ixS5VgjEq3NiwfBl6BrU4dTsz7JEP7LjvK2PIBLI6oeflP3QfzJpLgL4qdmo?=
 =?us-ascii?Q?dA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6647ae24-432a-4b36-995b-08db586b9e33
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2023 13:19:04.4525 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z5URssu2UoPT13FeESPN7ojIVIaoCJ5/dPgmxLJCNybTel4P46FiQT/MA1pzooXHzg44r9/gP0JkxnPMnBTU/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5644
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [CI 11/11] drm/xe: Limit
 CONFIG_DRM_XE_SIMPLE_ERROR_CAPTURE to itself.
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

There are multiple kind of config prints and with the upcoming
devcoredump there will be another layer. Let's limit the config
to the top level functions and leave the clean-up work for the
compilers so we don't create a spider-web of configs.

No functional change. Just a preparation for the devcoredump.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index cc3772a540ea..a0306526b269 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3394,7 +3394,6 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
 	return 0;
 }
 
-#if IS_ENABLED(CONFIG_DRM_XE_SIMPLE_ERROR_CAPTURE)
 int xe_analyze_vm(struct drm_printer *p, struct xe_vm *vm, int gt_id)
 {
 	struct rb_node *node;
@@ -3432,9 +3431,3 @@ int xe_analyze_vm(struct drm_printer *p, struct xe_vm *vm, int gt_id)
 
 	return 0;
 }
-#else
-int xe_analyze_vm(struct drm_printer *p, struct xe_vm *vm, int gt_id)
-{
-	return 0;
-}
-#endif
-- 
2.39.2

