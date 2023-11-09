Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08113C4332F
	for <intel-xe@archiver.kernel.org>; Thu,  9 Nov 2023 14:59:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A22010E8CA;
	Thu,  9 Nov 2023 14:59:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A02510E8CB
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Nov 2023 14:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699541949; x=1731077949;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=mFK/RXkF6Ds2UGk9kLEIfjMfMS4okD22I71GGW6r7VI=;
 b=c9fx2IuOehrXmgvyRi+3bdTQM1dtI+MYx4QhFaaNAJ7UAp/TafYpNNjB
 H+baRmxCMgCP0rdO89av+YlH4Y9Mwy00eulF8T7CSxDZ3mBx5SKRUYdQl
 glV3NebGn+NvvegOyLS+BAxXAeXLKhhoqjRbhtdur31A3goNiBVNlW+cE
 omUblxTklpwWvDYfBFIQrNN4YbMJVYDtS26Vtv/35tJGFc/M2NE3jyVwg
 0W/HiIySCUYyZIegu9cZLEXd/1dqlhAiwlueRuPnrPDyT5TO2yFnZNRLI
 xu2JoxXSoAAKXOqHbx7DUQjl+vV2SnyZ6qVHVEkbKjY2QuetkDim3e/L3 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="380389698"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; d="scan'208";a="380389698"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 06:54:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="792560929"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; d="scan'208";a="792560929"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Nov 2023 06:54:17 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 9 Nov 2023 06:54:17 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 9 Nov 2023 06:54:16 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 9 Nov 2023 06:54:16 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 9 Nov 2023 06:54:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JxWnLLofWBYfnW/9ljNhpwj85K3tCoByEZbYm0gh5qFb2zCMBhTLkvXTg2ksF0dxjAwFf1ME7FLCi9GbUqObg+hrNaR32X6AmM1uvxGkTABxsvwDie6Um0ed6lhar0Mqjfx1h8lRFmGuNAe59vuOdax+6nDrpKY2LXB9Ww4zVduwYVwtoqbmCKOebmFOsoU1YTm+uoWJI4WlWdMKz1iy5CogAr6xRtL3vBbycZaRhXvYG8I2rZITY6qIQlBGivrgBqXqEA9By1kEYI/h/qbZBQgveHda6WPiB4EVxhOVEC9DMkAgpCgM49eo/1uPTmBTX+ek2Z6XjfA6ehPkNXRjVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K9D/NxcI12qo2KCRgMETEDfb2vWJUHxvUSjpTA/VMzQ=;
 b=Kqu6tsxu2txUUcDLIkUCcZpQ2wmGa05+5Eaj/GdurIR9Ilv3UhXodx0kY3XwZx8H+Uxht1VXMukZLUaajigmqXiN63ak89IxgKpTWRGHi3QzV1st2JD35WEmDRm6CEfMdSFqLhOciciHdIsW707QRYuUQKccVsiqZFvLmlydVVw2Irw6VdVuE0c+pArkgu/+ScgPMwP3+CqiM4LQmsb+/YJwWPu5zTdtAeR3Hvj7Mz2ym9affJAuh/m0iCT8bN73jCNJ7mChToF7TTp0h5eonK+l8upggMZWacHcsylrSCRmv+VOOsqfmQHItgn4vzYR74IuBrFYHqTcbkE3UCQKeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by IA1PR11MB7943.namprd11.prod.outlook.com (2603:10b6:208:3fc::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Thu, 9 Nov
 2023 14:54:15 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.6977.018; Thu, 9 Nov 2023
 14:54:15 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Thu, 9 Nov 2023 09:53:23 -0500
Message-ID: <20231109145347.345120-6-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231109145347.345120-1-rodrigo.vivi@intel.com>
References: <20231109145347.345120-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR03CA0147.namprd03.prod.outlook.com
 (2603:10b6:303:8c::32) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|IA1PR11MB7943:EE_
X-MS-Office365-Filtering-Correlation-Id: 79219093-cd57-4602-eddc-08dbe133bdd5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fdP91Urig6Su7H31zNqsQO5qObTe5yG7G/QmQUnuJ7ktn7av3MefwrLjwZbhGmVSeuVSjBKm8fsiQeUkiwTLGUKkfuYp5/DrJaRiwVfM3RRr7/MBBnPqMBxk8ezfo6IQzTLPYZ9trH5H9qXhNEngK8wehXvEsFVIBCgOMkVsGOTvUJZvXm/iaQ5vWkGiAxHgtpIkubt23ro1mPc7i5sgd2qLvmjLmvY8UhPJMoy7VHJUzjiu8f2C92pOUL29KdSnz1y0QixW+qbKRsRWSEKp8DNMGIfIVoMoBq+aFLkCGD19YyhRHICVZBr0l2OTeOGckoguaaEHWIQ4c1JOhn6WE6hgGfES30z8MYy1AcZWULnra3mqoAwSCwO9u/+e1+zPNKqQuqchYxY2GFqxnzxnLd87rO3JoVJEfOrbxQ1sUs30yjLP/MSUeLu7u84hdL5j3nFv77lXiMNBVrkgzhRZLwRhOXQoNykXpGIex7eAo7VRffPx3psNzIJrGijhNB4NCVjQkw6QjSGzHVd+RfY10PyBOrkaVjz1Ko5bSwtXL3J8mYmcsIxQINPhLi/OITYn
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(39860400002)(346002)(136003)(396003)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(83380400001)(26005)(2906002)(82960400001)(41300700001)(8676002)(8936002)(38100700002)(478600001)(4326008)(6666004)(6486002)(44832011)(86362001)(6506007)(2616005)(66556008)(66946007)(66476007)(316002)(107886003)(6916009)(4744005)(5660300002)(1076003)(6512007)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ioc8izJjER6HzNn9wLIMagT0/dX092pE+uUyJPVWj6pNrtQ3+2RSYx1uvWsZ?=
 =?us-ascii?Q?7SLcT5SYD3Gy6PNo1X9FOPQxNpp6wiRMkJseUiJcl+g/HcgvF9X5rLLig5ep?=
 =?us-ascii?Q?QCZqW65NiwdzIfekU6cG5Cvgb+e5tNA8AhIFD0nr48sXgIkAqtibMRYiJqzU?=
 =?us-ascii?Q?MWqrSx/VxePKIIOYYL4Eszc5x6cag+DJuZCT+JUW0lKeMOO0NloVOEuxFqin?=
 =?us-ascii?Q?VhIr6zBu9MYTxPQ5NuFMRvnUw3k0GfHe6qSgvWItxWwhhVcNLslvHb9Tsdey?=
 =?us-ascii?Q?Oukgidhr1uiRPhTGJEfiGdS6KZ/MeGxIM/moJ6Fn12LM2QWRbYch2ofwFOYX?=
 =?us-ascii?Q?Rm6UssHCmLjrkA++GT/RavVQwSYS8mdiGpqjAX841CA0zO4YJyXjfB8pIRW6?=
 =?us-ascii?Q?JC+OvWeaQAajs/2IzVETdx91u/kA1gG62izwzl/oBjRmm0JAyknGVYnZ6BjW?=
 =?us-ascii?Q?niin6HRiG0lnh/VmGrtGUN0U0YMmitYjDXNRkb02A89yk3oy4jGE8YEXMEiA?=
 =?us-ascii?Q?/8AC0R5dn/pY8NwISuKaAu8cZFXRRWsJuw6whl7WRdQX8HbPoNIIzHdMacbl?=
 =?us-ascii?Q?hM1EtBIFVjib47m2lBO/KXP/Z4vANxZFceEh+b5jIL+gRW8EEHEm0p8k6atV?=
 =?us-ascii?Q?D1Ac8/ewarRqOT1uiKb+LAvyCYQYJmpLGO+Z2OMimwOfiI4GCOO6ss6cTv9J?=
 =?us-ascii?Q?ySx8OLIAahWCImEqZZLiJ0IjySQBGSsGm12FnxMKhe2EEAR2Kuf4F7zqpz5e?=
 =?us-ascii?Q?NUUBLVEvApLqUBEKjagUXRRIn9Wf5MgeXtSAXTYnwK1CqTBjTqi05BNG8vHh?=
 =?us-ascii?Q?zmeh/79LhRYU1BpvKDzc0WRpaanjyDfQxIgd3qd23zvnn828eeSrQ83K97ts?=
 =?us-ascii?Q?tHkwM8cg9wtcGZMG2B5OYEeoUYfi3IBYwY08K+551Rr4QXzUxv2Ui0rv93LP?=
 =?us-ascii?Q?OlJ2hB/PkibBT+80gLynmv40MYpcKgWq7ujjfW46MNNUqvVAAerEtiaTmVnj?=
 =?us-ascii?Q?3P/883BLYpgzvVaaIW+axaxZfl4EquAu/gTgxZTSM4Jq1MTpOuQXphXcYujX?=
 =?us-ascii?Q?cz9/fD5ajWFWCjIX7xpVDwUyGZ8zUyk227Pq2PkRtKG0pB7yOele5AvWj+Ra?=
 =?us-ascii?Q?D2kZ2BxOewQWQveS+duGb9yn7C6DBubzthN9zjcxq/+7AVoQ4ybwpQuEHn3i?=
 =?us-ascii?Q?AZKT4CXGIAvfF+KlNtU8QreDRxHv9oq1mkoKXYYS1xFP32Amxd9od00VF3OM?=
 =?us-ascii?Q?gpdMRhhR/jrkT6zkygtlr+j4RHNrHlFr5NMUqXYm5uYiO//cgue6I/YmFLEC?=
 =?us-ascii?Q?fLNqr2P9/gaDHVJAy4Tx4daoEX0EsBAHGDArdF68v1q6bkqRv7Ka3et8o/SG?=
 =?us-ascii?Q?hCMFwoYzWJhO30L6FAhOMUDRs52u8Zrlqo3rIKaEEAOK+r6+ZtQKUezKSNjn?=
 =?us-ascii?Q?nMTJsPmUEvl1DuHh8s7HBdba+UJmf3/U6KLBzlgF0c1ialKHhG5OuP0ycGwq?=
 =?us-ascii?Q?w4MuPaMAnQafG43kYXAw310ohJnVPQ8kqbp+Nb77kXJPZWr9jznUd+qIJXm+?=
 =?us-ascii?Q?A8WAqxIVebGzxVhtaN1jScgI1zURRMOv5n7n1cu1?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 79219093-cd57-4602-eddc-08dbe133bdd5
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2023 14:54:14.9618 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qzXTcG1MWQL4XgwjH/zxhKAo6XzQqrUH6/MDPV89DaSdAsz625LZXntXAJxA1cLLbjS0GEEMaUVGdd3gSEjp9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7943
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 05/20] Revert "drm/sched: Submit job before
 starting TDR"
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

This reverts commit 06a66bcdeeaedd17092c6c0829eaa71c199e9525.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 3056e0462619..334acea98619 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -1126,10 +1126,10 @@ static void drm_sched_main(struct work_struct *w)
 		s_fence = sched_job->s_fence;
 
 		atomic_inc(&sched->hw_rq_count);
+		drm_sched_job_begin(sched_job);
 
 		trace_drm_run_job(sched_job, entity);
 		fence = sched->ops->run_job(sched_job);
-		drm_sched_job_begin(sched_job);
 		complete_all(&entity->entity_idle);
 		drm_sched_fence_scheduled(s_fence, fence);
 
-- 
2.41.0

