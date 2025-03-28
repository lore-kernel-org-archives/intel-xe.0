Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80FCFC28B20
	for <intel-xe@archiver.kernel.org>; Fri, 28 Mar 2025 18:18:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FCCC10EA77;
	Fri, 28 Mar 2025 18:18:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MSC4x8sI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1A9410EA77
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Mar 2025 18:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743185882; x=1774721882;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=BTSpp26tKmDveiO8jo+nKscv71TQ5uBmXsUUsEAes3I=;
 b=MSC4x8sIMprxh3NQQBDSNGH+3qR7OGyCtLffPGH7nAy23b2asFzlwmiy
 V7m/oWYDJuae/AASA4hv231fZ0zj7Oj1QvNPKgC66LzIUGmdAW288YAmU
 sBtWsvLxlfdlX/U6pA68PrwTDu4D6cpLmOEOpFRkf6ypIX5gtn6wBN6aN
 608pzZLOUR/5EEepcNYYNdnsdc+D9R7p00cYJanH51wGCkJ5MDBO/A6hF
 QdHO3hZkz1UC4w11FfIwvWDivDdmZTx15H+1eJUJv2eJ0IJRW8cWry7Ab
 A3vJSBdUGOHDxs/3jGJkqtP82tEdO26KzE+R+SILFVBSfZnVnq/Yn+mtb Q==;
X-CSE-ConnectionGUID: jWSk61qFStaYEKxRd79tig==
X-CSE-MsgGUID: /NHjXIE0SquJ1qtVbiNXyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="55555815"
X-IronPort-AV: E=Sophos;i="6.14,284,1736841600"; d="scan'208";a="55555815"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 11:18:01 -0700
X-CSE-ConnectionGUID: 0TdRBxU/SPija2mZfmcl4g==
X-CSE-MsgGUID: 1B41kR2FRqe7vE+WkdGohQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,284,1736841600"; d="scan'208";a="130553515"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 11:18:01 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 28 Mar 2025 11:18:01 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 28 Mar 2025 11:18:01 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.48) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 28 Mar 2025 11:17:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LGaYThvOJTXv9Cg5QDxG/N3aQ7XV9vTVIt9j3fAtE8oVtv1oGXBy5ThcndWzngIu/0AgXKu/UeFlVishaQIWRbNGOe1oAAWwR4QoyU1R7mQAUmzBHDf+ZLGa+JILImFZLMUpSrKSgle1jHrUZMNDrR5uMQbTqBb6bgvyV8aP1q9A69WVMCxoRtEuoKHV0sP8rbTxi9HVe07JvuSWoQbwkDsCdWBkKoJWU4bk0AQFn78Gg6+4n/EEmZ6yYPcDIm4vFj+D0jXlw3u3PszSHQBgPNK2BWXEqGlDbmV+kVSZ6K0zzc+I5ldFQZxIlXTbE4tvZVc0lDwizYG3kDj5r2yhtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fG6LVWPOt7lorRtwETXiq9KdzeGxh6Cg4xtWwk/SmL0=;
 b=ErUStmEwEe2uqnO5gugG9Apm8RobEPaXmfE9ZrgUAv7Wk/RFpgu9sGN5HFNhPOMLoeFVwKCLRz2lrrhh8Xwq87z6979OTepEsCqjB1lIgGVDcNaLPPt/DRBAy9nFnF0gaGLnq57Czr0OBg7f4qhqOblglI+wuWyood1dbEQnDG/13CETtUpGWYHBIR/ZeioCwf911Ix3cEKjLA0BtMPj6RHQXbF3RPP+si11cjyct2IffkiBfu8SUpxeu5OP1EAkx/M96fHacZGo3WwdAslEmYQuAZFH2aor0TsRCWua+eheMHPKpvvDlvifk39ImBuhYpC+hyU8/AJb4uCdzR/R2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by LV8PR11MB8487.namprd11.prod.outlook.com (2603:10b6:408:1ed::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 18:17:56 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%4]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 18:17:56 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Dan Carpenter
 <dan.carpenter@linaro.org>
Subject: [PATCH] drm/xe: Restore EIO errno return when GuC PC start fails
Date: Fri, 28 Mar 2025 14:17:52 -0400
Message-ID: <20250328181752.26677-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR03CA0139.namprd03.prod.outlook.com
 (2603:10b6:303:8c::24) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|LV8PR11MB8487:EE_
X-MS-Office365-Filtering-Correlation-Id: d79172d0-3dca-431e-2974-08dd6e24dce5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?b5b0RxNeUgJUbXIMX3rXaHmAceGiFCoPCWCgwXlO0Vq0qzWvrmXGipAuLQwm?=
 =?us-ascii?Q?b1zs6n2ue0oBiYW7GjKgLmO2Q5OP2s/0L6NB579fsb1IECTDbhzUHwaqu2fQ?=
 =?us-ascii?Q?UUBlk/bZMfw/7Ow1IbsL48Zs1jIcEKtLjFCe6PZDP6wHXIkPst4NnwH0wpUc?=
 =?us-ascii?Q?CkSQY3WwTP4FyP+XUl22/aIaOo6hxJW35U7ub5mb78qnvdB4+d5FoA/Qnuvq?=
 =?us-ascii?Q?A0v2uMqQ2mN+UN5KYfUtlvkVOR1S9aDbWjHDXcTfW4CzVDOhqasWTwB6kw3u?=
 =?us-ascii?Q?ePH13uOekmhLrG5+ZUDTNcvIUPfYyjkcU5siqAdp+7Lb6eGBX4RNJ3W9qq5A?=
 =?us-ascii?Q?YqO1mH20ak9Rd4a6/0UyD7asivhLJnU1iYVMhFWGPU8624CXpBBTGD0SAsVN?=
 =?us-ascii?Q?nfZvPFU/Ch3S9d6il8sY+u++s2yso98TVSW5ogyQ8w5gcRyUJbymSqOEp4XC?=
 =?us-ascii?Q?gl3oAyUUJgdDVwlSPilH6sC4JG2GP+XX0Hqt2gM33d7fADRq5weHe+ff0zoq?=
 =?us-ascii?Q?3Rhudi7IkSecWIupAfHE0q89Ci2J06k6m7BTx2AW7T/HbsObiaBXtd5u23qD?=
 =?us-ascii?Q?46Z9rYChMwBob25NJk16UaWgpbQxVSi+OjVpRxPmSIX3lwdh7ar81+Vdyud8?=
 =?us-ascii?Q?EG6z90D6xQ3cSLwXbPcmtxPjs418IUaSTqXkUPtpIV0mzE/kYiS1sq3Q2gac?=
 =?us-ascii?Q?EQ4TzsjK2VfmLkCpNI9ytXCumhOt+Gy14lygqmiy4CFdzrRVyyYlSmtRvz7Z?=
 =?us-ascii?Q?OM46qVVUo+cGTAz1a3QErke1jGYXf5v96a8q5JtJgn4bVXP0EdBdzHqbX07A?=
 =?us-ascii?Q?6fb3DEPL3XVV4r5fHEz0GPMi0migcb/XMUsHIa8bDrrqpwzDHfqpJVVHXxuh?=
 =?us-ascii?Q?GiOR7DLHogZGJg4kxw0ArlihVd7Q69uPFLvMABIRq0Ki/o3ij1SMSxllO5z0?=
 =?us-ascii?Q?wIbhR/bTfoiD9zvMrOjuYKcExcMuJvDQVjBCjfKPqAjqX4WjMD9dA++xlssk?=
 =?us-ascii?Q?+93+RK2BHD5gZQH+oqpwOX0xkKL5Dn17sol3gKdGc4FrXwm1u56KhzqfrNkT?=
 =?us-ascii?Q?gsMZXIEw8een0Nqqd7jd4fsHKkT7gAFnl84i+0BLaWKNxOwyumzoc5kBFBMJ?=
 =?us-ascii?Q?MK8/JXoZ7RMZN9nmHsED/1DVNDQmXNn7nIiO4FKDm8oo8yBDXgCMqNr/YQoP?=
 =?us-ascii?Q?97aO3iaz2MeoxXiMU8YMwkAVGJcNs1ur2fE1IHfKIg1+b1gzeDn5b6byYb1T?=
 =?us-ascii?Q?zEiYTG8qzLGLJZCO6M0hVwn7v6RZW+4FwCK/uBNne4GvEMLRpF8FTxzgmqCZ?=
 =?us-ascii?Q?Dg4RGSIAvNpwLOIm6ZJO+aKQwiX16Cd+DJxHHPW8cE0KtWiufaJ5JaeEw8pU?=
 =?us-ascii?Q?mOTDK7lAeml2P7gOoT+sUDtLg8Pm?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rdTGbRO035rcPvcWZNGU+pAXMbVOBwu/Z/lAngGy26xtYk2gEN4+yqaFPZoh?=
 =?us-ascii?Q?YL2M+RnHmGnKSLbN/0qrThPCl96cun2eioXPY/BFL/8l3LihnlQwV6I1TEy1?=
 =?us-ascii?Q?h2b6dgJ2Io+LDSMli2USKzADIW55PxaciTVt19lHtzJkW0IvXH3j9TEsJsfO?=
 =?us-ascii?Q?74XPZqCaH93cV44M6Uw/EiidmPfDjDqLusOwY22Q+JjjNqmE8R/sRY3f8tRm?=
 =?us-ascii?Q?UCtulj6fuVX5KDnWFodHAvXpHxAJmmVEBVN2VR7UPCaXLbAODcPSSJB02mfe?=
 =?us-ascii?Q?MgCRzNBCM+6FT7p1oa+xjMgo02S4N8gGfHywOHOBOi36FmgZZtoHtnC+T2wc?=
 =?us-ascii?Q?MV2CVgDtB+YQfYZlNT0LQY3n1YQgEJn0DoxFoBhHtD3PdO29CsLuIz8wmBYs?=
 =?us-ascii?Q?3fKtiIPF8IOhqSWGt9j2NqRZ9MppeCCj1923zVCtx/Cv3o5aov43QpfI/+Ra?=
 =?us-ascii?Q?fQzx1Isk2e+STqmqbbM+qPqDDgBGdMlNo0SeK7nTXgR7jewSoR83oyb/6Z14?=
 =?us-ascii?Q?WszVWtHKVvw6c9n0j7E1WmLenrBYd+tCR+M06x1AdSZtRZsQq+S4QF6TnoNC?=
 =?us-ascii?Q?YToRFXBGBuTYp0lH8HSFpwkiKiHhXSSDx0bYNM5NEkkN/+esXBm+bw7rUC5Z?=
 =?us-ascii?Q?/UnuXMHPeWWQpYa51QRj2a14F/jiCWf24pniyJLumU2CiLzV9xqxePwp0xLw?=
 =?us-ascii?Q?KTvP99EVmYiy32nKraTDh0jWlqcupFrXPW8nqzw4SheXhHo9S88IUUh29kwq?=
 =?us-ascii?Q?+xMyn61rww9r24uaEr7r/Xwoo5EM/NHxyTEF9ShtGGGLB20bU1/83iDY6xwo?=
 =?us-ascii?Q?6JbsU4rgrN9LwXMApwub1SVkm2Vbu+D2vWcCCbMVuYiF7U0BmadQpPkt+EZW?=
 =?us-ascii?Q?KUasR9uMQQOUPEK7dmWsGlzvdajkDArEEsWlmkpIW6Pi6wvdMBIo8MyT4ZiY?=
 =?us-ascii?Q?O6k/FULSJy8OPkFL5uni8C1FWyLi61X93bdQdgwQojTosSjtCheLPlivsP7P?=
 =?us-ascii?Q?AEm3h3em5q6ljI2TSXHS1eD+aq8BEPJMaxFv3y4U+ZbPB4zpxPP+L2/38Tnb?=
 =?us-ascii?Q?3UBUeP4ILSo8WclnkNGcVrJ1A4C0xC8TUNxiu88lWYsouQ4+weBbBpKWNZ6J?=
 =?us-ascii?Q?R4NlPS50zEtHGMEjL1wF615nSIF/19cgv3WQZN1Rxp/ixI/etkw4uL32CFHv?=
 =?us-ascii?Q?+4Q95YOKQuL8fTfyt+JM6HsEWLzyZJvf+rDNxfeXvfaCaNRGNYkUl4KZ54Hn?=
 =?us-ascii?Q?Iu0mgpU9K+QNzR85jVMP5LSUPyizUhf7qMfacw+K1KfPyX6NRAAIILpdIlrE?=
 =?us-ascii?Q?TkdBe/khre+eqwn5ZdkI9hQsgOQPKU2iTPMxp7cN/s3/rnt8HNvCcMhYhzLQ?=
 =?us-ascii?Q?ZYuWGG2y9hY8XCWmnuwaFCJjUb3sQoHT8ADr1y3NFMbWB9+X2BG6CFHUHt/c?=
 =?us-ascii?Q?euUY6WlCPpwyFLeWELrFFVd6T/eSL64gupv/Tf8mbe5KD8puCZDl5C5n90da?=
 =?us-ascii?Q?37xhoim++iXJh948ITbI9yoqwAIUaLt5bTPmfznCauMLRhhpZQBOhKxnp8x6?=
 =?us-ascii?Q?0KF38gMKomrCV4MgGGVCXTC7UR7Nqs6SGFgtc9Zy55Y+9xP9VCzs/Yp7qyyz?=
 =?us-ascii?Q?tQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d79172d0-3dca-431e-2974-08dd6e24dce5
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 18:17:56.2047 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ljvd6hwr2iyCcFEDkfJd4ULZQnaZw9jZRyoowAjDGc4aDBe5V3dySAnHVOuHerOpLzfUZY/gyy/0yn3Q0KPLhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8487
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Commit b4b05e53b550 ("drm/xe/guc_pc: Retry and wait longer for GuC PC
start") from Mar 7, 2025 (linux-next), leads to the following Smatch
static checker warning:

        drivers/gpu/drm/xe/xe_guc_pc.c:1073 xe_guc_pc_start()
        warn: missing error code here? '_dev_err()' failed. 'ret' = '0'

Fixes: b4b05e53b550 ("drm/xe/guc_pc: Retry and wait longer for GuC PC start")
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/intel-xe/1454a5f1-ee18-4df1-a6b2-a4a3dddcd1cb@stanley.mountain/
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_pc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 85215313976c..43b1192ba61c 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -1070,6 +1070,7 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
 		if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING,
 				      SLPC_RESET_EXTENDED_TIMEOUT_MS)) {
 			xe_gt_err(gt, "GuC PC Start failed: Dynamic GT frequency control and GT sleep states are now disabled.\n");
+			ret = -EIO;
 			goto out;
 		}
 
-- 
2.49.0

