Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B002C4167B
	for <intel-xe@archiver.kernel.org>; Tue, 12 Dec 2023 00:11:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36E0A10E537;
	Tue, 12 Dec 2023 00:11:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7830C10E538
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Dec 2023 00:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702339880; x=1733875880;
 h=from:to:subject:date:message-id:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=dlw3t5SEeJl0DP17Ejcj41usD7cC5bQGKVqdt77Tk40=;
 b=fqaiHPMIqLDP5D9KBNHc7ZeEK2ecJV3AsYNLgWiHrt9/WeNJu+Zr9O5i
 6UTCUOwoqYYko/r54bRA6/ltCCLJ0wS1/bQoof8PsUNJUSL/pmiOD9cKF
 10VPGrC2mkIv6jKefybwRsfzRIdaY9F8OYYLHnz7TNnOALvxmJKo9HhMN
 gS1Msm8pWKWwUWphl2+kQZwbhvzTbwZjEc423wPevUmXQ8qjD15HXI2wD
 rH1NOxkLYAhHpWrZ8smrfeAEvIbWZyxVII7ysZLlLnDfbkLVvW9nx1Zyd
 SEohX1+OBt3uGzcTTCo24YvcdW5GUhtix/OQ3bG8dWf6yDoIeyn3c2aZ3 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="8092297"
X-IronPort-AV: E=Sophos;i="6.04,269,1695711600"; 
   d="scan'208";a="8092297"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2023 16:11:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,269,1695711600"; d="scan'208";a="14720259"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Dec 2023 16:11:19 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Dec 2023 16:11:18 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 11 Dec 2023 16:11:18 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 11 Dec 2023 16:11:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CVW/Uh26TJXfBWNdlISQ9PrEjbSaCpTfgtN9E+BwqjnSmHNH9TSx0NUIcnBt9rilDcqZVcwBuAj0sSsIilaSSWQxtQ/FSE9LqFJOhKQABT5sGOGkuArMse6ADn+ikJ9D78dX+fIJEsDMPTKPLNOnKIowWdyY32xzFjK3tCEUxlY76XkLRE8K7sPfQG5DbQ5RJbsPivHAEPpkuE6h58IvnBcGTwI5MUc5JhM2LJGudt+HRuVdP0wdi6qCY9YDpjaGyQmczvGkJdF+4Sn6r1UNOtFGye+/h0SdzLe1GUQeX6ZAHn9GJQ/PHGO8NK90VoK/b8/nmBmhS3x8B1HIl/T8FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wXFjbsGmBM6SECCZF2P5bONF4rOV5uefizcbuAs3VHY=;
 b=QxPe7vIVqAZ3xz+gWXcruGe/OWY0/qx0LvqlnAun4nYaBU5kxc8K0ayf7m0t/LjciRQ7PswEcrGwAHmjdmSJarYpXPqbtIsu4jg/oVYLbxLXrAqeZ7vemfSDX0tS3WWnEzDNjcTgGgJrJbomTB+ndorb3OTSyafy/xf1JyKEsNsevdjD38L2En7KnwGb3PUqHp2b3hMARWNnSY4bcQMI6+0rx2D1eycsxalXwSFKUGXjoZJE4nAZYLdZlRw8KLVwXR0aBU4D//gmvLar21ex2YWJBvYWjpbUP5Zdjvw+iV2RpcbYa2SSFtbtVhkTvgQq0cUEwEVGgxbuCfsr2ZrruA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CH3PR11MB8706.namprd11.prod.outlook.com (2603:10b6:610:1d1::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.33; Tue, 12 Dec
 2023 00:11:14 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7068.031; Tue, 12 Dec 2023
 00:11:14 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>
Subject: [PATCH 09/13] drm/sched: Fix bounds limiting when given a malformed
 entity
Date: Mon, 11 Dec 2023 19:10:41 -0500
Message-ID: <20231212001045.1099517-9-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231212001045.1099517-1-rodrigo.vivi@intel.com>
References: <20231212001045.1099517-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR01CA0056.prod.exchangelabs.com (2603:10b6:a03:94::33)
 To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CH3PR11MB8706:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ff47207-1144-44b1-1940-08dbfaa6dac9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KGIrmzNeIN5A7gz7cFK7Z6iUKhNp7gtEVQPLuspXGMUb4Q5GEtGivw/mL3YSt5E46Gshk2SuS7k5uYxT0igKiZONV8FruQ8XKhoBwW41Rd5UgTw+IL38svQ1BBOLkACjbt2oWwlSLFMCU5eHn54yeN7tL0tLQjf8JfvdMRd4wXrU4uiBL9tPlgDHoEdBJpyuCqZ3Da0xPeyB/e0UJXDPmMCdiKcLT7quc4G5nOQkje3nI+im+rQklvAbxw62sMlnnz4543CWjDTtu6clt3t/bEXqeSdo8YvYfi920Fsqu3WLBdMxWIxsy0Bp8ex6Gf7gmnQAzaGkp740pTTJUIEByrVPSAlN/Nrbfe669ommFE4KFBrpPwyrzO5/3f4OdXEYqOO4flav3Rd7nhgKMSfVANqbIX2IwM3HjAq5zevZK9n9dptzV4KfoOErTB4N8ATjtVnFQJAzCFRG9IBfTNvNJ+gajwQP4xobuRCWQXR1GTN3EYX/SwvizTk8fwDRVSPTeJf31tNB2Me53Ed/1cIelFMfd0VPRCd/5MINOk8S+9q7dA98i9REfFUkFybDGm4L8dQqPjmc5/4Vxlv+E620Dw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(366004)(346002)(136003)(396003)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(38100700002)(6636002)(66946007)(66556008)(66476007)(82960400001)(36756003)(86362001)(83380400001)(66574015)(26005)(2616005)(6512007)(6506007)(1076003)(6486002)(966005)(2906002)(316002)(6666004)(478600001)(5660300002)(8676002)(44832011)(8936002)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MEUxMFNNWTRXSEQyNm5iK0xuTlByNW14TDk4Njl0MVFSQ0VrVWxDL3F1ejF0?=
 =?utf-8?B?eVFvQlpIdGRJWHArMWhMYUNFZlBVRmFGZWdxeE4yVyswV1ZGN0ZjbnBOQXQ4?=
 =?utf-8?B?T1NRWmVTYlBibWR5ZTB2Mk9RYWVNRHlqL3dwekpvazR4V2hsUjNKODFCVi9J?=
 =?utf-8?B?ejljRkVhTjJja1BvK2IvWjhsNlhxVnRJdXQwUDhLY0I0bTl0OEdnV2F3YkNB?=
 =?utf-8?B?U1ZGTUI1blJkMkdaSUd0RzdJcm45S255QWlVVmNUYXgwNkgyRndubE90cVBE?=
 =?utf-8?B?RGVvalZPUnNYekNhTW5OYmlQeVh3SWF3Yzd1eVR4WW80Mm5zNGFlQ2g5RjBr?=
 =?utf-8?B?V0FrNlZFYjhsM25pM0REUGdkUUxzeDVVdFlCYkhHUkdOcUpkMGRLcjZ6Z2N0?=
 =?utf-8?B?RjJ4VkxqQTBwdmJXS1ZnRzFUTWx5bDJVVWNXWjg3Q3JSbEYvSDJTS3ZmLzdX?=
 =?utf-8?B?RzFZbzMrZ1lGYnFkRkVlczB3MUdURFpKZlM4YW9UckFhcW1mU1lNeHBDSUc2?=
 =?utf-8?B?S0VtTDBjdTlNQ0NHZWg5MG9rUFlPQkRRK0kwUTljZXAxWlNJNzlPUG13UC84?=
 =?utf-8?B?M1RXTVhkalNzaFNBT2tnc2F2bURmVEErN3VQa2NuZ2ZyYjZpaTA2MDFhNkF2?=
 =?utf-8?B?OStHb2pocHZyYWdneFVjaEJaS1VTcGNCTTFmZ3c3ZXBLdmJ2VHlpRWNyQ01C?=
 =?utf-8?B?MjhnOGdDUXRKR3JOKzFjczRoNTdTKzZqd0crVlFlaXZoUitMNVJNR0d4eUMv?=
 =?utf-8?B?M3EzaStXdUtRYVA2Q2xvbkNIZzVVMmxmVTJQeGNjQmM5SXh4SkhnaTFrNnZO?=
 =?utf-8?B?WjliRGhhZG82RjJxWUJaMHU2ZDR0cWJ6cFYxeUE4eVI5T3RZT2w0STllZnEw?=
 =?utf-8?B?MzNFTTk1UmVxckpYUlBrcGJUTmc0b1NKTk1PWm1BNnM2aWE0elB1dElnSFd0?=
 =?utf-8?B?cTJ4eEt0NjZ0NTU4bEt3N3MzTmdmSEhjcjhDSnN1RWlsWEFWN25na2hpcVFp?=
 =?utf-8?B?ejd4SXVnckY3NUNFaWVFRHo4cFdYWUVQdjZHWnFiNFkxT2dRWkVFdVZtNndT?=
 =?utf-8?B?WXVtcVhsbmEvcWVnUDhJWUdRWDZwbzBzMEFNNzY5OCtmSEpUTzR4T3BCUllu?=
 =?utf-8?B?MmpZTlk0R1ZjNzZmaVUzeFNGTWlsM2FqMjJQZHBVZHNuZlZjMkRqTTA0cG1Z?=
 =?utf-8?B?b3pKd21YMGpUcmxBOWZIU1ZSRWc5QjI5N3l5RmptSVpNTnVzV3ZUb3JPbTU5?=
 =?utf-8?B?MnlkVHYrako3cEtmZUV2RC9sSHZ4ZVdFZ2VJdmdvcm9DQXNzVlczRlNNTlhL?=
 =?utf-8?B?UjRMMk9EZkxGOWR3Mk5FVzIzbjQxVGc4ZkF3bHF0OHVFTVlCMWwvZXdGNmhW?=
 =?utf-8?B?YnpSUUh1VnJidS91bkZjM3lLZUYrZlJEV1hWaTJVaHVyRFRNUnRMcUlQRDhp?=
 =?utf-8?B?Zy9nMWJjSFNwUmNBRFhDSjV0UFhHS0l2bVhlRWV3Yy9GQlBUWFFKOXA5SlVk?=
 =?utf-8?B?b0FUWlVvZVFBT3BqZEk3Q2lXQ0s1TVlXVjMrMUY0bjNoZitob0lwb3JVU3g1?=
 =?utf-8?B?N1R4ME15djRKdGY4M2RPeFByVDJLclhtZlJTenU5a2hRNjBkRVlSQVYzMXRp?=
 =?utf-8?B?Sjc0ZlRSaEh4YjBWajBTWm9zY1RHTEh1RXRyZmRTS1hZWXhoaUhJb0NFS3Zm?=
 =?utf-8?B?SkhYKzBJOWFSQkU3RG5rYlV3TlRtU2JBa3ZwVGxtcTQ5ZWN0WlpvR0xwQWQv?=
 =?utf-8?B?QlZBOExlUlEyWW5ZTlI1WG5SRHNSbnJiakN3OEljUCtOajRmT29uZHhydUc1?=
 =?utf-8?B?S3dLNXlaSFUzMjduYy9KeGFtQ0hPb25Ob1JhR01MYVZEMk9JQ20ra21Oejcr?=
 =?utf-8?B?SWdmRDVwNXBUUFFTSkxNbDMwbWFBbmRpcXZYU1lkT3ZPQVBrMGwva0FsR2RY?=
 =?utf-8?B?RU5tcHMrUDZzS1ZkNitHQ2FuM3lJdDU0MXNydzliWS9OeUpVRGk3cnZWdFgz?=
 =?utf-8?B?bzlXOVc1OXZUd2lkR0JjWE1NQW9KZ09wM1gvSXkxalhCUlR6QXk3UmlrZ2tr?=
 =?utf-8?B?RFVGUnNjM3MweDgydG44dVBuYmsyNUJqYXFHVkxGSVJObUpXWTBCc0lqQ0dw?=
 =?utf-8?B?bEszU0hmRFpCM3VwemlJSGpGQmlBMm1ETHJ2VWw1ZGdHZ0x3Yk1FUDl5Z1po?=
 =?utf-8?B?aGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ff47207-1144-44b1-1940-08dbfaa6dac9
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2023 00:11:14.7051 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +l08bfks9tRzeLG7ZVxfQeEO5FQfi/aiCTLLdBrIOsdHvdTmSnCNa9mjOjsjx3am/rcL+/9EOYaCh5EQIhcVvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8706
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

From: Luben Tuikov <ltuikov89@gmail.com>

If we're given a malformed entity in drm_sched_entity_init()--shouldn't
happen, but we verify--with out-of-bounds priority value, we set it to an
allowed value. Fix the expression which sets this limit.

(cherry picked from commit 2bbe6ab2be53858507f11f99f856846d04765ae3)

Signed-off-by: Luben Tuikov <ltuikov89@gmail.com>
Fixes: 56e449603f0ac5 ("drm/sched: Convert the GPU scheduler to variable number of run-queues")
Link: https://patchwork.freedesktop.org/patch/msgid/20231123122422.167832-2-ltuikov89@gmail.com
Reviewed-by: Christian König <christian.koenig@amd.com>
Link: https://lore.kernel.org/r/dbb91dbe-ef77-4d79-aaf9-2adb171c1d7a@amd.com
---
 drivers/gpu/drm/scheduler/sched_entity.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index 4d42b1e4daa6..ee645d38e98d 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -81,12 +81,15 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
 		 */
 		pr_warn("%s: called with uninitialized scheduler\n", __func__);
 	} else if (num_sched_list) {
-		/* The "priority" of an entity cannot exceed the number
-		 * of run-queues of a scheduler.
+		/* The "priority" of an entity cannot exceed the number of run-queues of a
+		 * scheduler. Protect against num_rqs being 0, by converting to signed.
 		 */
-		if (entity->priority >= sched_list[0]->num_rqs)
-			entity->priority = max_t(u32, sched_list[0]->num_rqs,
-						 DRM_SCHED_PRIORITY_MIN);
+		if (entity->priority >= sched_list[0]->num_rqs) {
+			drm_err(sched_list[0], "entity with out-of-bounds priority:%u num_rqs:%u\n",
+				entity->priority, sched_list[0]->num_rqs);
+			entity->priority = max_t(s32, (s32) sched_list[0]->num_rqs - 1,
+						 (s32) DRM_SCHED_PRIORITY_MIN);
+		}
 		entity->rq = sched_list[0]->sched_rq[entity->priority];
 	}
 
-- 
2.43.0

