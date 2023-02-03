Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EDA1C05027
	for <intel-xe@archiver.kernel.org>; Fri,  3 Feb 2023 20:25:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7199E10E0A4;
	Fri,  3 Feb 2023 20:25:41 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC3DB10E09C
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Feb 2023 20:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675455938; x=1706991938;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=3W2+WB4ttWrGBjGN0eBWGvJMRATOcNTeUCihDOW1A7A=;
 b=KsXXvv9kYboPpiZaWLpjgkK4IL+3eobhoCTqm7hgpcA4Afw3OswXguA6
 DFzTXxfWVlpZiE6Nfu9R26Ng9i7AthhNj1+81lnH1wdKlhGFaiAC2H55+
 sg5CnRkatpG750MqakuvTZO8ldlF86u28YbyB6DBzZpFZp3YJxA47XlKR
 /Fon30IVEL8adnYTVL2X7uqQA77cf98UCC5E+Bzzlv4n0IlX4yBIWzwhf
 y6f9qoBBPmwLoYeyvaHmxavpLumo8rvyWXjmDavDNqOfOs/PtWNM+5M13
 SoZgIY7AM3myIEiRPtYKjf/fR95OSfx19JTSA48H1PZWuI21pdeSxGHtP Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="415059328"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; d="scan'208";a="415059328"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2023 12:25:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="659206863"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; d="scan'208";a="659206863"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga007.jf.intel.com with ESMTP; 03 Feb 2023 12:25:32 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 3 Feb 2023 12:25:22 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 3 Feb 2023 12:25:22 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.106)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 3 Feb 2023 12:25:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GZ8drC3UWHIcxZJ4rG5UvityW9wZTtV3eTgLpeQrnOVW4XXImiaq8opqwgxIUrBoYv0E4lFCwaZIdobuV4+2ripFabqI5cI8pzQD0/6OArfXRVY18CGyRiHfyw7OrT3bDuZ9ImntsLfgfcUKMj/Ru9t340GZpxFVRB/4ujR23Z/JkZqZUzjxKDSvYIyc9nQYz4oUQ8KL5tD1UR/yRbUj8IkKQeedj2xUSzRemrCQbWcKBf7lbCWdbuj0P7DQRXEW2L1gph1y+gV0cMiea9i3K6Pfn25rWSfMVFKx5qSZwrSNvXeB8wUlWTsj+5zdKY3YYS1EuM/cFNIPULlfuAZXoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i/6V4edoGGCQoQV+hw34j093+Qlek7ZyeB3DSgTOVzA=;
 b=WAUwZRvaJjGCWkodG18tyrbS9UktdiRwSRAT1f6qnC+IHkHUS0XgAv1CGWwkd0peDtodq9qPfqMRyEDBcuISvZ7oCf5Ouu3ymtVdQS5fiK+1OYuGd26f7JFcILoJGYt9H9VGt3NVw5jV5iDok2KeEwFQnMD8wWaj/mnlIPwsF8EXjUjlaI7wnb7ptlka3rcF4BrQMaFG4DuKpybNEOr0H0jvDbsMpbT+/PBq2ECRnYZ18TC0LbTiMNj+sbpJHR+XHLUCfHumDUcinrWK4aPHl3vcFb5i43EssHIVFP7W3OGzQhFxTsJnhJvxuaFFNgtolRD0HXennbo41T95GifFLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB5817.namprd11.prod.outlook.com (2603:10b6:510:13a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38; Fri, 3 Feb
 2023 20:25:20 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158%7]) with mapi id 15.20.6064.022; Fri, 3 Feb 2023
 20:25:20 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Fri, 3 Feb 2023 15:24:04 -0500
Message-ID: <20230203202409.577032-18-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230203202409.577032-1-rodrigo.vivi@intel.com>
References: <20230203202409.577032-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR20CA0006.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::19) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH7PR11MB5817:EE_
X-MS-Office365-Filtering-Correlation-Id: 41d70458-4230-41a9-1fe7-08db0624c586
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: smoT7nmc9MYwYD6zlob7fLWCYRbdpREuYZ7AEDazpb5tpnCnBNkhJ77gTFPydvX53sraXdQOUojLuxk1/WJQ927ewYKU+Nkn5x6tPcPPOcoQRxX7J2VcDAKwJ5cWvBNnOXLyu6bmaliJrSQTPIFTuMRXLLiA9FmZJMN7+ZlvUCPGm1u/wqsv/wKMa/ZdSUIUHCgIOsucRkxxwuqJehDH9/x+FRu2yAJbiHVr4HjPZ9To4cO1fy4sznBqMvvDplP1HV/2fkjwfULBca//baaBxQhSqZYAv4kOq+D1z5Sau1QQKPZzbFvBThTXAJgLxwvcaBYU/FRl0dA/4GUGWvJ3kmMkHu9n1msw0lNryzi5kwtUiRY4D/s7rxJDFPxN2i+YGiCtPxbr8ke7+Yw18uucrU5iacU3G/Z81bU01+5v4UmryZ7PL8V1e6NCJAMgYIgdBCoUP+aHr28AcLN1wZRYDY4hnpbwZBDQYRQD0txO59Jw9D4ydQtZrVwVuOFGhnntaTXLbbKGQAoaU83nGnguzQibdvlITIJ6wDlq4XOrDatpCrgIhrcnKsTYztLQsXsy27K2LPT6czQ+vd8VCdbOfCXPoI2dUPqZy7omLT8IBX9OfwLPV1fcwYeMrIN09wqMKGa5hhL0cWaG60DjeSFzfA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(396003)(39860400002)(346002)(136003)(366004)(451199018)(6666004)(316002)(4326008)(36756003)(6916009)(66556008)(54906003)(8936002)(66476007)(8676002)(5660300002)(82960400001)(66946007)(38100700002)(86362001)(107886003)(26005)(186003)(1076003)(6512007)(41300700001)(6506007)(4744005)(2906002)(44832011)(478600001)(2616005)(83380400001)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Wxh7mpiRVe0TglV/uYhR5FSiAw1uST7Skbz1IMxVXhjSW0khEtWolUPHbHRe?=
 =?us-ascii?Q?WNsOBQXbnfRKc23F4qUtGC/8rowznSFOJs4EEacWVxpyk6VTB5xGDBKEmKTO?=
 =?us-ascii?Q?4/jGygCFWoA0EusD2c7uxkPtusoSVOc62RxFWHYSosIP31oGqmhOxxKqGEIj?=
 =?us-ascii?Q?RP0LlOsquzKPWeuP5I+IYQjXOxoOTM93FzZT/B1rfqySB1Unw835mi4BKxnQ?=
 =?us-ascii?Q?1+6aBCn2kuWZIjYjwlhwUYVk8wVGG0QQ+7YBPcX/wWvY9p8iMbDHCLdxfSL6?=
 =?us-ascii?Q?X7uQ7hVXsWMzOz91fyQWIczAkSX4lVvV2rOWHmCusVQpQbJXi0KVXe/lm+S8?=
 =?us-ascii?Q?qqWds8YOyM1QaT1lO/oaLoxovtsXPJ+BWI4EAoKt8b+QICbFvC6PKtUUxo6n?=
 =?us-ascii?Q?0bgRSg/JuI2Rdo3NfH38Pdd5gm7cIgQHotUXoB3ghr5+BFhBNyjNj0Wo4SOy?=
 =?us-ascii?Q?suJOfWPnxg0kMK4uIChp8uorHclqqf+QIyD/ZaxliVCBIjQJGAj2BJbQGxIR?=
 =?us-ascii?Q?EPOWFeDQBHtT78lpAclOXQlvDFelXRyf8s442iO5e1OSVrHpgqArPFKpVHez?=
 =?us-ascii?Q?ZDiIKSug2QYAFoQszNeNJeFZpKTsBT02O1/HXlJbubTftMxbJvqQCCkkcQ7U?=
 =?us-ascii?Q?PKsOyjzyF0aEHGXahbhIg7sIMQO7scbjrK8dLll9FZtPjpXKS1KmLO3xXNYc?=
 =?us-ascii?Q?ucOYO5qlIDqRSGe5xxbMp7JEiyGjrFI6BFFTZeUDawKzN81k/96WasAHEuz0?=
 =?us-ascii?Q?mcrUWbjz+Z9WuwPU4kcZ8Vt6aovT+MP6JQ3QjuqhIo3aoeR/cFNXNoVNZVTC?=
 =?us-ascii?Q?xAQnTqzV1h5uxdbBZ4A3584VREa4jtsOw1v5jHn9KtJWquiONor50f7SWF0G?=
 =?us-ascii?Q?wSxbHvQaM92KHnh71oNDyi0uvCXvHiGwlOIRJ8Edj3Zhh2IzKhgL4wCksT1M?=
 =?us-ascii?Q?Z7DqEqV6WvTxfoMHnqTlxzyGWINLPJ0T0SSg1f9H6TRhJARBh71ZqUPJVOaK?=
 =?us-ascii?Q?vi6k+hykNc7vDtCPez3RcX6X/cA1OlmTAyGQYB7yy0LK2wEHjUYlH1aBDkZC?=
 =?us-ascii?Q?G8zfFNFgPNSbGwPJq7rEUf9QXEokaDy55zD80eR8kN6vnCCtB50ROvNZNxzS?=
 =?us-ascii?Q?fKypqRg281fATwyBHPfcZOUoLmrOk0jMf8/GhueVST7OFvTj9WxamIJ0Av9c?=
 =?us-ascii?Q?r5oXqWSr6NOSoTHfdHQl3wmqho7DP1l3fluNSsBJ4zQfdT4qSDrSUXSvBWqq?=
 =?us-ascii?Q?eoPPU4Lk4lno8Eg/Us+e5l341xyhapxSszKiN/mXxKFcWR/baWoRF8p4ocE5?=
 =?us-ascii?Q?ABfdGLaoCNx16+8K+RZWlVdCR6AxPoSwKvH1vI6S+t9UL+Naf/JItIZ0x43W?=
 =?us-ascii?Q?roKlfYx4qQXX/0js2fwrCvBgjPwEBZYQw1JePUazekOU0Ai962ZbTbZM1eBZ?=
 =?us-ascii?Q?TxBKi16yBO+mrMtLTV9COG7WItZkNIWMOd/Zy5dCxgK2FTSQ5sSS6IFnDpE2?=
 =?us-ascii?Q?nnxMhWmJQEHSFQYZ7NQvv/3s0UIw7ROBj+yJbDkqcOkK/NxO7n9jymQYmc77?=
 =?us-ascii?Q?iNRB5tOcgagtBoQenY2/GaMXFBOUf8z01G5ULygmr/uBjfx4D7XP+9xrhDA9?=
 =?us-ascii?Q?lw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 41d70458-4230-41a9-1fe7-08db0624c586
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2023 20:25:20.7891 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hxGQru1mehyysYWA/PTiIborjVGOic2ewYNtZ4ox8rVZAGr6FKIpIAv8YIxkbN2YKbRWlUixYsFbKuo6+yOMgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5817
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 17/22] drm/xe: Lock GGTT on when restoring kernel
 BOs
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
Cc: niranjana.vishwanathapura@intel.com, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Matthew Brost <matthew.brost@intel.com>

Make lockdep happy as we required to hold the GGTT when calling
xe_ggtt_map_bo.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_bo_evict.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_bo_evict.c b/drivers/gpu/drm/xe/xe_bo_evict.c
index 7046dc203138..3fb3c8c77efa 100644
--- a/drivers/gpu/drm/xe/xe_bo_evict.c
+++ b/drivers/gpu/drm/xe/xe_bo_evict.c
@@ -147,8 +147,11 @@ int xe_bo_restore_kernel(struct xe_device *xe)
 			return ret;
 		}
 
-		if (bo->flags & XE_BO_CREATE_GGTT_BIT)
+		if (bo->flags & XE_BO_CREATE_GGTT_BIT) {
+			mutex_lock(&bo->gt->mem.ggtt->lock);
 			xe_ggtt_map_bo(bo->gt->mem.ggtt, bo);
+			mutex_unlock(&bo->gt->mem.ggtt->lock);
+		}
 
 		/*
 		 * We expect validate to trigger a move VRAM and our move code
-- 
2.39.1

