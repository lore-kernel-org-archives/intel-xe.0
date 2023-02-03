Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7A81C61DA4
	for <intel-xe@archiver.kernel.org>; Fri,  3 Feb 2023 20:18:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8043510E189;
	Fri,  3 Feb 2023 20:18:21 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D5CB10E189
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Feb 2023 20:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675455499; x=1706991499;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=FgEre8GcnLS8EjO9k2IRu31xA0X2LR9M5Uh8OXB/cGI=;
 b=KyP59parTX9Q9Hoq0MJlD9wAzd5Ddjo5q79VfiCzDL6cuACdWnA/wPLi
 6sonbZDhx2eBpdGQjSHXpsUFjEDoiKCaPZd5wAwCms/pXOw0fppkSGawI
 YpCCd8BSYefrO1K5zyYjFNJ3JE3p7gQdIuwj0tYw+MV8mkYURfDdH7ZHI
 SRKxv9dDZECAp0g9G+CoG3zdNqkgqzjqL9i9C7xpqWfG4Cdy82sB9EM2a
 mktHgrJeaI1HlW41zytt8c2NO5wPzBMNALLXAWHgRqX4KjEWNne81j0YZ
 XYhDeHQ2QwgUSDJXihUm2Zs9ngJVgYHpRjBCVyLinmpjMACam2Oo2hsKj g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="312501745"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; d="scan'208";a="312501745"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2023 12:18:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="734481021"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; d="scan'208";a="734481021"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga004.fm.intel.com with ESMTP; 03 Feb 2023 12:18:12 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 3 Feb 2023 12:18:11 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 3 Feb 2023 12:18:11 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 3 Feb 2023 12:18:11 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 3 Feb 2023 12:18:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uby1EwXN1EW2PyTPK8US1BdqnWnZErJeO/harTgcy5sETv8pPdMJ90QMv+CZdWJWDOc/BHQuTp6bn3UlUTZct9Ai7tkeQJ/2epxGskm4CZUY/IvRPL3UgM5jwFu3ExNsQcNHgq809xbt78LTJBt3wzoD8Ei+4UuDkXbzGvrho2sfZaAttrZDBwQNdulzj9dax4WCehi4m8sGGSWGmA0XFt+REwJG/OAExuLv64tMjSj2np2cytpiwmOO/mrb3EN4mv9pIvCFZ17U17yAGPNOn8OU9bPh/2tdcPvxtOBFCXsiCpc7PwCd9XLCO8tL+idjvCUCRU6cnJgIwt9kl+jWXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O4LV1BM8z2T2B2vsQ2ALH8oKjKXmLfMTVwg86DVhGnI=;
 b=oC68xOwgxYj1quc/QK8mT4HyZJZUM00pjZ+Kbch9kmbNgrLu3F71kGrL7o39R/+t3CfPyybgEmdoU0+etOwPcqlCVZ8DL0i50qtV59HAMbc1im4qG+uPzYGbKqyrfxuYHrWpur56L7GAYyAfA/VqqcubFg4RdMjfCRW+XWtSRv1MNTKWuyIASuW4tpCU5/cMThyPfH2TU+42fQhpke0JNf+UhxRXzdp1qngOpDeZJpi/9YYBPXPvyATP17b96HFhzTNwhf1wfpCXBPSioR5KfWkL3KMrvW0nCnawbtov7bi/u1vkgqr0UwioEQsgMBcYiIaR/h/l58WBRVHpQNPRCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CH0PR11MB5706.namprd11.prod.outlook.com (2603:10b6:610:ed::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.29; Fri, 3 Feb
 2023 20:18:09 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158%7]) with mapi id 15.20.6064.022; Fri, 3 Feb 2023
 20:18:09 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Fri, 3 Feb 2023 15:17:55 -0500
Message-ID: <20230203201758.573775-2-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230203201758.573775-1-rodrigo.vivi@intel.com>
References: <20230203201758.573775-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR20CA0010.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::23) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CH0PR11MB5706:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fa8ee70-3c21-4e7b-9cdb-08db0623c420
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r6OSR57EeW9ial30DWXBajq9kLr4NQVQlbrbZW9a2WQKcSQW8d7a8YZcpop/Y8S4afAyNwpu0dOtHzuzaoT3L2rlt/Lg9lWW1fvIS0EwFB25nqoIpdKYTJ5/7A12cKZz2VRUhsJG7lvAvHuZQGljNaQgIPbrM40jXNGvup7eCZ2FuYtlwtAfK9JlNtTosPgKRhCNXA4k0cwY5RJ69ziZE80xMq3iN6kTCKFJMkwhMfIqKN12hP+94L/kIklPMWbqtRXPhctUQQeKj3lWBFG3Ya3C7BjQlPhYu6UwwjO6bp0T4ZB1w/+tU8umFODkV94ruohurBWnJYg+euZ8ifuTzYi1bKLyO15H8IJHnFNOV5XGvnA0q7nhIbMc+EH335ZQK4TigZ/hZQlGFlSlQn3mTJW80q7zl1+mPO955NYz6lmG9FlfsHAAGTvmN0Hn91SrbIBA1StZwhVpurj2rJ+jduhM1H1NWiZLwD8UDFDE3aIdWMsHvTWsS0ciJg2ZzW4Twd69QOUtDkYy0C4l7T7TuyzOvj6N5wG8kPYyfIEJf8yqSQIZet7qZKQJwI99mQEFdtiKjT4bFMYr2VoaY+c30SPK122zXrHZ0dNgBxOLjrpli4UFq8OHlhu4o5uh7zuAu6Ry5rLXXT6K5IB1Cpxv9Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(376002)(136003)(346002)(366004)(39860400002)(451199018)(6486002)(6666004)(66946007)(66476007)(2616005)(8676002)(8936002)(6916009)(4326008)(66556008)(6506007)(5660300002)(41300700001)(1076003)(44832011)(36756003)(2906002)(26005)(83380400001)(186003)(478600001)(6512007)(86362001)(54906003)(316002)(82960400001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Zd2VoQAyKSQnz9NQTYoMffpJxfkLka6eh2SglN0PcS6kIvayTn50QFMFEVMo?=
 =?us-ascii?Q?ell0spAA2ssBIWMR2PoUKLSuAHd/aF4DvJ+tdOFeRoonsdvspOsxBlcq9mMj?=
 =?us-ascii?Q?1LI6/lr+7lRKFugw+B6bC/8yaTwfSH6hKn15GzxEzeGwYQoWQbrIN3e+nGLo?=
 =?us-ascii?Q?eHrDzlDD4mQzCX209Xyra1+wR3pHSQYnFvQgFMFkRhBJ7Cap+ihzdhE9xxp+?=
 =?us-ascii?Q?UIujsq0fkH3WSsUAjraTLaV3KQssE5z1Dql5EEvJRKkwEjNVaQAokSMCvt2e?=
 =?us-ascii?Q?MkrJQIZ180NsKEvLM1iyBfMEfCyUU3AleXnEZosFA0mD3vN5u9hMlEOprkk5?=
 =?us-ascii?Q?77Sxlo4/C9DKTaoMW5tQLIsQS2gB05I1sHi/X/gugz0lUiBkktnvTiYHN0Us?=
 =?us-ascii?Q?oPFiHxPlAQGcL1FcfgXPYZwXqboC//hqFMBkWHnJtSiB/2e8eNPtCY1TwHTV?=
 =?us-ascii?Q?oF12YMpJZ0VquPlvotgM04OQmotgVR93i9L1qoX04WpOQpMlPBZIcgv7YbPw?=
 =?us-ascii?Q?GqtKxqTqr0Hc/E+kzA4PQgfh9g1WI6+jouUkUM6ZuRdReB48S/iwgTTpkA6T?=
 =?us-ascii?Q?DxMzHk3yyr65RjsWcF/iRlHvE0CAK4Yiqyyjag8iFJOXGq7FaG9+7RJqs3rE?=
 =?us-ascii?Q?myyPjjt4jNWCv8V8N6HruffVSSTPvVj65uysLfikG2K4z21ZcpGYDFfyLvBi?=
 =?us-ascii?Q?S5BQikQr766VCFjTywfFk2mZzc5PVudH0EjhOHWbtbtji+xOzoAZROt9DMQe?=
 =?us-ascii?Q?5ow5MJxzWmYecOroL6GaV+hQRNB1jMNWEB6fYJjyfcs37qYCtshUKnZtlFwI?=
 =?us-ascii?Q?SFzBwtaL3A2AQqW8EpBTDzYqrm/AWGD4DgAiMZABio/iN4D5y0oX4MxDUD8M?=
 =?us-ascii?Q?lm+vLfhHD4FNK2Prud0wnfsiJB9NVdfr4HCN0mwqIvWFRNur5wYc0sLLxmSM?=
 =?us-ascii?Q?DPgvdqyE3MLPH9olni06gmFIxGiQNOfBByY8Qkp/bLlx2o41th9hihpqzazm?=
 =?us-ascii?Q?5D8a/fOf3p9QQcezHJZpH6iqJBMeDTA8gCzmfdYRrdsxU3g7RM78oafXH1zU?=
 =?us-ascii?Q?yIiZRxgI//w/lh/LOklVKx8ynhbNjxJdbF2iuK8f97ImmjcjxxhFL4tL5YrI?=
 =?us-ascii?Q?HKURNoz/d3tQxoStdbto0b05BykrFT4NknXAhlRtx+Vw8iF003FaB/J/aPss?=
 =?us-ascii?Q?Yc/RyAusXx/e2KiQC3NB7yZ8jh88WgVZVxiwfevnW6aLV5uXvVVSumFvUl7V?=
 =?us-ascii?Q?V4jY54et5AmRVipGeFXuT0PlhlqhjO1fYFo+peyQabNlPOQYoZtuvbW3BjEX?=
 =?us-ascii?Q?/h4l3J8SXRSgatZkNDg+0HCn/VnVEJ4RVVrPEquZAwrjC6qXdVRDo6mRBBsx?=
 =?us-ascii?Q?LT9JazhOk5FDaIYWMplTbnRBO56xzvkpEJdwBtL5hMWjVVe2uG9rn1eDJ+gk?=
 =?us-ascii?Q?LO7u8rzGy29osNvFqPXSej2zgGiSVKgXvbFocKqqy2c2Q80UvHUvLRBKsHx+?=
 =?us-ascii?Q?3r/MYPX/975crhRPZhbmBWjraB7hZr3TbPgHJfMAEdN8r2KfYJ3Ar6KY/F1b?=
 =?us-ascii?Q?GOdKbtQX/2jVRJ/es5vpP8831u3l+xfdm8rAfGLovKf2Res0qbhS6nfJI2c/?=
 =?us-ascii?Q?tA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fa8ee70-3c21-4e7b-9cdb-08db0623c420
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2023 20:18:08.9962 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u2/9rQfGzMNwjOsD1VEv2CxT16Rcc5J3WTQS/molfh8innX2LXnoVdhVdBEZid7pf1OSE58xZmWVYMmOeZ/ABQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5706
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 1/4] drm/xe/fbc: set compressed_fb to NULL on
 error
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
Cc: Maarten Lankhort <maarten.lankhorst@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Matthew Auld <matthew.auld@intel.com>

On DG2 we get a massive flood of the following:

[ 1068.790446] xe 0000:03:00.0: drm_WARN_ON((!!(fbc->compressed_fb)))
[ 1068.790465] WARNING: CPU: 9 PID: 637 at drivers/gpu/drm/xe/display/intel_fbc.c:843 intel_fbc_update+0x605/0x670 [xe]

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Maarten Lankhort <maarten.lankhorst@linux.intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/i915/display/intel_fbc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i915/display/intel_fbc.c
index 82bc21b09332..13f03c6ea818 100644
--- a/drivers/gpu/drm/i915/display/intel_fbc.c
+++ b/drivers/gpu/drm/i915/display/intel_fbc.c
@@ -75,7 +75,7 @@ static int i915_gem_stolen_insert_node_in_range(struct xe_device *xe, struct xe_
 					ttm_bo_type_kernel, flags);
 	if (IS_ERR(*bo)) {
 		err = PTR_ERR(*bo);
-		bo = NULL;
+		*bo = NULL;
 		return err;
 	}
 	err = xe_bo_pin(*bo);
-- 
2.39.1

