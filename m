Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76CDDC04FF1
	for <intel-xe@archiver.kernel.org>; Wed, 20 Sep 2023 19:30:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 363F210E542;
	Wed, 20 Sep 2023 19:30:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6DC410E543
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Sep 2023 19:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695238196; x=1726774196;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=lxpAcTFocvZvRBV+BbRImJeIOms+uGP99X/4j0Jy4Ec=;
 b=apznxI52rGT8PrzU2ESG+hsjAMjyUGAN8MmKVRQij1HB/6tJlvVeKY/s
 38NG+s3MNMf3agDOE1AeAEZ5nX0fatljEOUV1384v/UhOOhd5AV8JEtOG
 iNANjNlI26t/RBmTlnu9y/HP2eeB1CuKdjbf4WtFa4E7qnNEejSrSmGkR
 M70goHql8NA6YvPjneinllEkHPb5nJgkkH+WbN0m3VfcSs7fOsskIBXlq
 bwEGWBKeFLBhyZVuN71U92PEuFgxjyxyfhEJFUMyKnVmZfwR+xKbKZalA
 xsBwIdve9iYC9bLBhkblgrvTassx2DnSUzMxok4Zep4Ckqe098eY7bgd9 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="359701113"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="359701113"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 12:29:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="870498368"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="870498368"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Sep 2023 12:29:56 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 20 Sep 2023 12:29:55 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 20 Sep 2023 12:29:55 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 20 Sep 2023 12:29:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PgFLyJy94yi429YUfvSV2ZubO9Mt9PDmLHeF1WbV58m2BBwvSTprpHOffb1T+fFhqWHyKcvCE3foB/pfmV0FhSa/bHobdcM2u6Y5eMM0Sxcx6fPz9srdgFr+mz40m9stivDCSOzLcE9JjCcjg7Q31JS9pHKeAuPoGyusLZ7eNJ+3QUDtKinAhVaX/kHetkRejuamAVL9UP+1YEe0I6pQZ6D+bZpdIAhJrpGhTzZZudLRutnL9uJ6lBSWHB7t4JO663CbEVYcAkMayKLbjaWv4a5Z+DeTia7Ma/e+Uacl3XzXGgavp28Of0dSl7rydAjYM58V/Tqp39IgRvkdwzhj/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qmJXDWlSyevxnhaqXkHMak2xMkDoJvQiVBjgSlhGq28=;
 b=kgxZcpbulXV6juINoyYifwQP7j0gikZfdPsBFUMuOZizoKgJm4fPTK20qU3PWztH48gr2sWdSinVZEc97CEhllUU/dPr5vl924NXJn1KRvMJg69+juI8FwAt2MAJhElkp0wpEA+iRb9E6+jJ2gUx+dwZVT3+zYGQkhikSl0AJWmcdRCWlzdLFb1XG6AkDAp/FeVDpfnSJMl35j75EoGqPwc52ShN1s0ekbixy2kpgjaKtGy/g0cbhsKpDp3gRtAFvIrwCFl7GRoT2GUvSR6ndWc1bBLC6mpbiDhcaazrX+tSUZ32/pPR9jyC/b0FpFUJpfUOHJIZbHl+Yl2h3do6DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DS0PR11MB7802.namprd11.prod.outlook.com (2603:10b6:8:de::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Wed, 20 Sep
 2023 19:29:53 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%6]) with mapi id 15.20.6792.022; Wed, 20 Sep 2023
 19:29:52 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 20 Sep 2023 15:29:22 -0400
Message-ID: <20230920192940.135004-3-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230920192940.135004-1-rodrigo.vivi@intel.com>
References: <20230920192940.135004-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0168.namprd03.prod.outlook.com
 (2603:10b6:a03:338::23) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DS0PR11MB7802:EE_
X-MS-Office365-Filtering-Correlation-Id: b52a9ec7-09c2-4677-abde-08dbba0ff68a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OzbDPuHakyTpPF2RAJb4KJqb+6t2i7Emdjao7Hyl7DcWA2tQI/vp04vZdS6GvH/9EjdIGViVfFKwq6dA4BgmVqHXzs21dMO/Yi531WvnaJs+O2MklYZ0gzFHM1UidmaLFsqyrTjeMsl3OzUyyq49yvtkU390xhUbPoAO6LXtKKA3cIEL+V9UUM30r/vRlj5t/uzDYaeZ6F5bKfi+sMPwcBtuOj67Lo85BKL7MLRgBe4gcw0IPsOp2iPfTXIRCw7gy6L8E5AAKujtKOeVVKSYESaFCkB/mbpfCvrooBjLKZxg+mO8/eoCTqIXIqebnUl5RnCgyQHIO6+9wnvpNMK1sp9h/V5p0MJ/TNx5m/EZ2EvhPK0dbUBzZssMrVuMbKInkhCT4fZTk6s+BPrMW+UXxTOD0Dkya2A9Y5Dzw1Qa8v1kGZ0Qc3qOUs+BT0C0/NfP3yvyQFVgbPm80aFArocUFsgHVRvRaWcIRt+BS6HnKigc5wsxdHmnt49peAOvvbgnsPxpSPJqBoT5NQbXF3jG1psA8GQKK0SS71vUJmnZOAIPJxh3AJuElOVNnJMz4mKM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(39860400002)(346002)(376002)(366004)(451199024)(186009)(1800799009)(83380400001)(6666004)(478600001)(44832011)(86362001)(107886003)(1076003)(6512007)(26005)(41300700001)(6506007)(6486002)(4326008)(66946007)(66556008)(8936002)(54906003)(2906002)(36756003)(6916009)(66476007)(8676002)(82960400001)(316002)(2616005)(5660300002)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2OYG/gi+ezNyS43H+9dSa5bBx8bZV67ETGzeADmmF9EJj0OssuEQrACZp4LH?=
 =?us-ascii?Q?ghaa1+v9M6ZzBaEQpFk2kbRZ70ChKYQ7ba5M05svxxZhraPhgWVxdEYJ4Y9y?=
 =?us-ascii?Q?+DU0UU4p4JHP6mMFgxC7HIFtht8+MYbDPckL8kcnRAnspItC9OwwWMeqoJAD?=
 =?us-ascii?Q?xe6y+ZxnMjSkev1CmYvcIdlE19e9KYTF8IE8B/nyawkbkRe+XD5I90zScWZG?=
 =?us-ascii?Q?jC9HuhA2l21mFx6VtAwojC+qqG9P9rAfu4x70bwpLazKGVPn/rLXqQHqRx/C?=
 =?us-ascii?Q?77BSVL0KI1mIrmvLZolxfnwdQDEIhcuvktvIFPtzjMnYh7Ljr5UpaSxgz8A1?=
 =?us-ascii?Q?nPVM2UxopSp/UIWtCXPIDIxGPhlE2vOEqs7B7x3B79zLoyqhImgpkva8PRwm?=
 =?us-ascii?Q?y1iT5tut6AWevFMjUq7v4y+MgZ+Lk2SGoeHmYG2XEpjstOgE9PpELndO+/nZ?=
 =?us-ascii?Q?/LviMf7vUlESpd4qHU00oGhAxSbrALPrCJ+sp/18MqyqkoYJIjcteSYiQqj7?=
 =?us-ascii?Q?Xa6SHMTq54VzQSKCU1aNayT8+QfStU8EvzbkSQkFbSq8LNk9itonzE/pMwfD?=
 =?us-ascii?Q?IjVkusRFbmC0nZXfmxZq9ILTk6qFL/jFA4QS8tNfej/OibVQY4i3NctxSLDa?=
 =?us-ascii?Q?bZh/+w58XzaMSeH2ZEFZCvmqWYolkswrhZ+wk//xG5E/4qNv2GuG/GB42SVw?=
 =?us-ascii?Q?mzunahFMtt8ZqaU5GIMePCJ5cLEbqMR4LT0dQA957YPU91lx/ZhWqaRGm0h8?=
 =?us-ascii?Q?W80rsSVSwHSv/BqpZhbMWHMkV4y8pXskNRNon8Ik8RlKUSM4gUqhR1wFzLyL?=
 =?us-ascii?Q?37arAmgLJr0lb3a4nr9fviB3WS7x3+Nuz24Jvzskcy5LfPVdE2oQBTW56Rbc?=
 =?us-ascii?Q?SDuL1ZPwLc+l5Fy7vZ2f6AEQKib3BwgblUnV0ZSPdQ/Wl2728szSr4hzX9bU?=
 =?us-ascii?Q?FSvUWwEJNxk2gvY88L2tBmzrjhqs41NEko7xXk5WyjcZpUMonrdcQM/4xahj?=
 =?us-ascii?Q?9REOqnfXFIm2u11CBIV1eMaVMv1/RtMNRP3VImLGAdur1HhY/GndklQbW22g?=
 =?us-ascii?Q?4AFmJY82jQBh+E4gvcdxA8I3Y27GNln7weAr7pnEx7l3HVrtIRKyXNLs1HXd?=
 =?us-ascii?Q?8vnu2uIlsE0dOu47KMy/BFo8uGH6xbNY3TbiHT6bGfkWokIm3659ByImZ9JJ?=
 =?us-ascii?Q?XRRKDvZx4Pye/DHuRxGH3PQBNgsryXleufafIAoIyB7qqpw7XRwDRwAS3miQ?=
 =?us-ascii?Q?Ej9w8w+tVLtd6mVxXl/Zp1/kprkdt3C/4NP7orZDXAArpyCw7d7pNH7E3iuo?=
 =?us-ascii?Q?7v8KB6sK3YEvSJ2mLU7qNSDmxg3KnIrietK4JLTFv4hd8JMUit7vBzmAh8w/?=
 =?us-ascii?Q?mp/rz1I2OYy3KOBsUAapYxMwFpA8RIsk0y3gGaIYjEmO7S6GaJxyoVtNFTp4?=
 =?us-ascii?Q?BBtMsZaM0ZfYZWuEAGppyuBICm9OFFJPUfOj9H6DRLlA6H89yffFikGhsloV?=
 =?us-ascii?Q?RoGX8M+hcfPry/4JCB0EF7ppa2ElZwhfcQKk3v6iuRMgd+Ezkn4VECjV7a5X?=
 =?us-ascii?Q?Hr9ni6oSB39HX0Lm3LgNIl//qsTGVduVfe95HMCEXyXEcSIUGn2solyAAgkt?=
 =?us-ascii?Q?pQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b52a9ec7-09c2-4677-abde-08dbba0ff68a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2023 19:29:52.8870 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3Ef2QI8P0oMp81//YbcKNSnYsLIofHSoXSOVvM0QPFIdgHomXq5xHF59RjsW5xNZXPWutn/uH0TdwJLMtA4Hfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7802
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v2 02/20] drm/xe: Set the correct type for
 xe_to_user_engine_class
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
Cc: Francois Dugast <francois.dugast@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

User engine class is of type u16. Set the same type for the array used to
map xe engines to user engines.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_query.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index e0c2203e428e..cbccd5c3dbc8 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -19,7 +19,7 @@
 #include "xe_macros.h"
 #include "xe_ttm_vram_mgr.h"
 
-static const enum xe_engine_class xe_to_user_engine_class[] = {
+static const u16 xe_to_user_engine_class[] = {
 	[XE_ENGINE_CLASS_RENDER] = DRM_XE_ENGINE_CLASS_RENDER,
 	[XE_ENGINE_CLASS_COPY] = DRM_XE_ENGINE_CLASS_COPY,
 	[XE_ENGINE_CLASS_VIDEO_DECODE] = DRM_XE_ENGINE_CLASS_VIDEO_DECODE,
-- 
2.41.0

