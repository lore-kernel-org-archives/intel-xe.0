Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E57DC10F05
	for <intel-xe@archiver.kernel.org>; Fri,  8 Dec 2023 20:28:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 219E510EB20;
	Fri,  8 Dec 2023 20:28:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBA4A10EB2E
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Dec 2023 20:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702067282; x=1733603282;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=kejvt82+COLiZLr1CWp/z4M1CRmnhan5X75tyox32NM=;
 b=FdOoJuI1cmUTQoJ9cfMRicqR5eLMkKRrQJB1IsT/MlySXCMoXah+9AH5
 WVsu73//Hda5N5Dxr9kyo6lrX12PPq68/YD9/BD2qxWpfcqc57CalvQ57
 wpOa/t81oayRgEugDSXjuMC2sA1vdVlEvFN1R3vI7FkxGHAAPOH7/7TAL
 Pij7g+O2XocxHyvFNpDG5jUgjMU7xkTMCU193xaGCO+VilA4z4I7rx0cO
 PLf1qa3UMY2xP1UnBH8sGdt2iJsvxpbrkklVvqADxW1iwWQkicxHC8pFf
 +wNalh9hEIykt+td3tQYyOjJKJFgdQi6fMxqnrKuG3i17DELPquav2DLf A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="384870161"
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600"; d="scan'208";a="384870161"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2023 12:27:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="1019466193"
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600"; d="scan'208";a="1019466193"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Dec 2023 12:27:58 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 8 Dec 2023 12:27:58 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 8 Dec 2023 12:27:58 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 8 Dec 2023 12:27:58 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 8 Dec 2023 12:27:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gawJ1hZYoJSJTQGUvztmGPBvQvmt3/5gHY0vElVKTxpqfgan5oKlYWkBo7Lv1qAy9jVYDp5M8eb7xrKfCq2fTcQMFGpsqIyQ6XsisAVxjXhD7C9BoWIN2j9T0W580F4SnMQKcaFPvYY7Wd1CH23D3aj03DX1394mEK3gz3yE5UUqx9D29i+tL7TvwHfp1CacR+pKyBP1QuZ1TQljgUmgoECpjNuBfNmUXgseq+W83cBEUW2Zt8CXWlvxEIG3Oxu9Id2YqajkvPfclJjqdaFpK0UlC2sHpgmadotAfKygURenweXZOh4pyK65tJ10j3jybPdcmos45KdkXyfQspMWqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SW0MsESuCDPFD5sF+UnLmZcJj5BrZFMPe1v0aCOz5s4=;
 b=Bxddhb9QQwTZeq+uc/4C1zn+HT7+ZvMkby74poUxvbWR1nzJwd2pApMAi4MKeRkl/zMAbWV3F5wsx3N+L6KJgpCvKLxgtmd5Y5c7Xnimmu4fb80j119fF4HeAZlm802b7GqV8snpNv3QZPBRO0z4paej8WVOSPyoXLn8/0TzSVlHywfQvElFsnCNJFtMJ4Etq/dLO26JZQ93OFXgTodRnt1JoSfzjrWV+HB9FqPcjFCmubo0FYUYTcLDVrWY4own9HssulbtcCdKZZwcUISc7SUQJsRFd6ncv2NVozTY0myOWlGiIR77coGS8HzNk12eCikrt7UDGa2lyNTC7S48yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB8527.namprd11.prod.outlook.com (2603:10b6:510:2ff::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.28; Fri, 8 Dec
 2023 20:27:53 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7068.027; Fri, 8 Dec 2023
 20:27:53 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH 09/13] drm/sched: Fix bounds limiting when given a malformed
 entity
Date: Fri, 8 Dec 2023 15:27:19 -0500
Message-ID: <20231208202723.918082-9-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231208202723.918082-1-rodrigo.vivi@intel.com>
References: <20231208202723.918082-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0060.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::35) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH7PR11MB8527:EE_
X-MS-Office365-Filtering-Correlation-Id: bc65b0ea-0b86-4f59-83b2-08dbf82c27c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gFmGziEpdV4+iOXgy4SQ6OeWF6xhDE04SrGYzvdRABqZoxo8er0i9LNCGqGVlcI9fEeHZAMRkD0bd/kAO8YyQxbJ/h5qoSkcg9oh0SvbpoP4ZuSJJLPd45Uo1t0lqqQXHHTIvKBkmHOKwAAP5E5idBLxh9Tu/l7rwHVhjiHlk5BL0v9zLMVmkuWlubMbXzZhbR3WjVIYgIkY393138xYlKBV6n8spx6lMmj//19aDOjQHc6T7TzIN1sdOzHMu3eCGqhPlwcKCIMTbtpd6QzEDsTpSgbZ2BwPTofCkKEtbiRhysSbzxMvBkRnmmnX6uQIxKMQAWYhG6jRe5nnyhwuHFyzD3q8um/0PAzqEIWLetzRf2i4TBn2cPGQYtq/vrDg9FGAWhiPQeH2LtaN3urfKhTasJd3SPB1brjzZkuj2lRzkcMUKSrbIvAiuLzusPe++9lLxSiVsITr6yg0e8ejyRJX5FiZ83RB5XoJqPammefgIahRPH72G9OQZ7Efx5nbC6URRxvs7ya30vJTah9Ns5rHIOb9HdvSX171bpneLkzUXyDurTRgIDUQLcnezhUxEm8SGLlvKojMwY5h3YSDEw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(376002)(346002)(136003)(39860400002)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(6506007)(26005)(66574015)(6512007)(2616005)(1076003)(83380400001)(41300700001)(4326008)(8676002)(8936002)(2906002)(44832011)(5660300002)(478600001)(6666004)(66946007)(66556008)(316002)(54906003)(66476007)(6916009)(6486002)(966005)(82960400001)(38100700002)(86362001)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QSt3UGFJelZ1V1Fad2FGODhEbGkxQ2xTNEFHU3R0VnZJdTd2M1FWWURMQUU0?=
 =?utf-8?B?c3hEZzdHbklZa2I0LzlENzhHdnlINHF5OEFWRnlSSDFLYXBPUGZQYkRRdnNp?=
 =?utf-8?B?aVJBSk4rR002TnJFUkovUUNOaTRQRXlaRTRwTVpDUGFzUmY0b0lPTFZtQ2gz?=
 =?utf-8?B?R0FOUFp0bEIrTWZEQ0tGeGpUbUlBNTR3SHRsRGN2bm9BTS9xbjlUZk5hb0Jv?=
 =?utf-8?B?cGxtVkJSKytkbWkrYU9XM1ppU0JnRWIrV1dWRGFxSHV6dW1iVzRtVlc0Z05U?=
 =?utf-8?B?WXAwODlIbUNucC8rNk1Pc3A1ZkpCZmczNlcrbkkxT2RRUFRrTzZqRzlTVDdM?=
 =?utf-8?B?Q3o4TWdJRTl1RFdObkJadXl2dlhPdHFheTZ6dWU0SExUZjVVdGZrSldpS3pG?=
 =?utf-8?B?SlBlNWNHdUFHRzZ1NkVJUzI4Q3AvbEUwclc2MUROTDh2ODVHTGFRbnRITTlS?=
 =?utf-8?B?Tk9meUZTTDJtRGd3ZDAydHVTQ3FXZHp1ZWc4NEMwOXlDYU1EdGlIRkZ0cHpK?=
 =?utf-8?B?VllpQlZpNzd6WlBBZHYybzBjNWI1T0xBVXdCeC91QlIyMUJ5aUtLdzRkNFZO?=
 =?utf-8?B?SzZzbkhRSGlaVURBSjVrQmQrcVFnbkRWdWFpRjV1MDlMRzdMZnBzZVhVMHZH?=
 =?utf-8?B?bGtwVllJRkJDWDk2Tk1jMUJlZUFFWDNBZVQ2clNoVlFrdVlGM1hoTkt2MVRL?=
 =?utf-8?B?WXdXdlN0bkNYeUpBVWpCK1BoR3d5eTJjbXE4VmdTN012eUF4dVRReFhxWDh3?=
 =?utf-8?B?Z1VtYm95OHl0THR0Z29xQ0EzWDNhQ0hxcjhNOHNtUGxJQkZKZDZ5akZCQjlz?=
 =?utf-8?B?N3MrbnA2TXNmZnMwSW1iWmFHWVNvVnRPYnJ1dmlDenJoUEloenI3TGdDNFJy?=
 =?utf-8?B?N001dkQ4TWRtOUJ4blE1bDQzcEdzVGVLVndHa1FxZmJnOFhOY3dIZGkrbWI1?=
 =?utf-8?B?VWVKd1lYRWkrTFJoNTJpL1BzL2VWME5uS1dXbDNyN1IwUVJ4c2lMbVVEQ2V1?=
 =?utf-8?B?S3BTN0UyaHhwMDZURHdmVHAxWVRUMnRSYXlaNkE1c2ppVGF2VW5nZzVKOXlN?=
 =?utf-8?B?V3NaMjhGWUxvZC9WWElhTDRLeVplbHpDZXIxNU9zT2x4U0F4YlNrLzlPM3Zh?=
 =?utf-8?B?SE1HVVR0M0JHcWg0WFBCeDV1aUI0VkYxSkZ2aitDekhnOE5DdHJMbWVzYjNW?=
 =?utf-8?B?djQ3UVlPR0dVS0RNU3h4MnRnUnh6OHcwOHpqWXh5TGt1ZHdZbVE0eWNYOG9F?=
 =?utf-8?B?THMzTWhHamNPL2xPSWZvUzE5cSt6bndHdkdXYWUzam9oKzJDZDd2UVhiQlZJ?=
 =?utf-8?B?M1ZKM053RHF1blFDZVBNWlh0dElaSnNuSzF1VGcvNVdjaXY2RS9Ca2pvSzhn?=
 =?utf-8?B?MTgrVTFVNUNvUjhZWHYwcnhQZDkzdi9IUW1FbTJMU21XQ29CSDhTQ0J3UkhO?=
 =?utf-8?B?YXdXdnowaEFYcTdzT1Fqb1ZVN2pLQVZiaDJLWHlucG8yb3hETVJNVUVzZWR1?=
 =?utf-8?B?ZXF2aWF0eVhqQ3FjRlFLKzlwUysvamdDU1hMYjVlb0hZUFRXR3JUYmM1RkVJ?=
 =?utf-8?B?c2NraFJjc1ZubFRrLzVjSVdDRWpTMXdIUzdjcENOc0Q0OEc1Rk5sYlVFUDdX?=
 =?utf-8?B?bWlxRW5PUElnUDZ4Q3gwN2tkNVZaeWR2bTRQa081ZFhNWFhvbm5jbHB2azBj?=
 =?utf-8?B?Sk9mS3gyRG1FVW9OMFdIbnY2SDBtd3lCb2N6Ym5xYUYxS2VZR0J5Vkk5Nnlx?=
 =?utf-8?B?Y0gyOXRGNCtoUndlY3o1Q3lubjc3bWgvNVV2cnYvUktVY29IY2pVS3gwRnJo?=
 =?utf-8?B?dlZtMWZ3TUwvVnFBUmp4SWxLRVMvNCtHRFJ2NHE3RnMxMElGdnBTUkI0WjhG?=
 =?utf-8?B?bzNkVFJnSFcxQXJacXJheXptWjllNnF4R1F4U25rUVp2N2VMNm8vQStVbzIx?=
 =?utf-8?B?aTZDQWV5YUROL2tFUy9VZ3FxWVIrZW9IR1hSdUsyeG1iK0JaYnE2K0NGMGJj?=
 =?utf-8?B?L1U5b2YyUDZhMUpKcHNSQmFFM3MrVGczVzMzVEtZWXd6amhmUGFpQnZKN1ky?=
 =?utf-8?B?MllCOWIvOE9xamtlbmx3cWxXTmNlR1lZTXRWNjEybUwzT01oRjB6b0dWTVRX?=
 =?utf-8?B?OHBGd3pkckRhWjdHc04rdWlRY3NDMXR0cWpZVVJka2gvdVJpQ0NRUEpLd0JT?=
 =?utf-8?B?MlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bc65b0ea-0b86-4f59-83b2-08dbf82c27c7
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2023 20:27:53.4344 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T3P4B45nOSIoQwdAnvv5vlWi1na77I5oQdiTpahOV6xcUStbgRua8tQruQ4s5yRuZKzyxGZClXpJVHzdHqVsNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8527
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
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Luben Tuikov <ltuikov89@gmail.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Luben Tuikov <ltuikov89@gmail.com>

If we're given a malformed entity in drm_sched_entity_init()--shouldn't
happen, but we verify--with out-of-bounds priority value, we set it to an
allowed value. Fix the expression which sets this limit.

Signed-off-by: Luben Tuikov <ltuikov89@gmail.com>
Fixes: 56e449603f0ac5 ("drm/sched: Convert the GPU scheduler to variable number of run-queues")
Link: https://patchwork.freedesktop.org/patch/msgid/20231123122422.167832-2-ltuikov89@gmail.com
Reviewed-by: Christian König <christian.koenig@amd.com>
Link: https://lore.kernel.org/r/dbb91dbe-ef77-4d79-aaf9-2adb171c1d7a@amd.com
(cherry picked from commit 2bbe6ab2be53858507f11f99f856846d04765ae3)
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

