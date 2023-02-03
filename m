Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A158AC61DA4
	for <intel-xe@archiver.kernel.org>; Fri,  3 Feb 2023 20:24:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8362710E09C;
	Fri,  3 Feb 2023 20:24:42 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F59E10E09C
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Feb 2023 20:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675455881; x=1706991881;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=dDwMorphoOoveURrKI6al4u7NRykHgdUvtoqYMMZFxI=;
 b=lhTttLxjOO1JjJUpzWJZhHgQQWKEo7zmaqaiXXnr0vNL7KtZOyYN86JV
 wUETPnjTbr6FfXISq5dLn9rGxDS68YKeAGoRUDpoEjvvYFrkZ1jWa3sf/
 tkRgvpJbjBPv6byZIdnupSITdkWDRQXiabpdTUigp5C6Sk1JwmTWHaKL+
 SLCq2LfwNQl8HhiRb4JpTMlLM5ilIN9nFJkHvQQ5V132QNDMyGpujfVf5
 XtBu5rHSM0l1HkI9b3F9LQPQBSYtmflGpGYXXqmPSfFdfAIwhwb4btzYi
 tJptRuSd7owIq3xG+lXZ3AhxLYZ3PXBHnQW2Ik8qLwxEWeLrnQyVTdgmX w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="330975760"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; d="scan'208";a="330975760"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2023 12:24:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="729376797"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; d="scan'208";a="729376797"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga008.fm.intel.com with ESMTP; 03 Feb 2023 12:24:40 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 3 Feb 2023 12:24:39 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 3 Feb 2023 12:24:39 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 3 Feb 2023 12:24:39 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.107)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 3 Feb 2023 12:24:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A/cBxiqPNJPXnDZKo4otDkBdlwjZ6c6fE96HiWRaTzOVJV0woln3noe8JSBEdxQKru5olcQo761AewpC+ruDRIMoyRA9qGGXlPFlOblH+Mm+Yf3HjYIbncDIV+8BeUxlisxSwbfmzitn4QNMduVABDNjGvcNE3cLpBqbKBDN2of++ekrxAjk4yq8CBzCO6EJy0fC4U+snvMU6qyDVD26NL02xaznqopoDnzQFDKvMegk581Tb/hWfH7QkshicX8KgjTggseQON7U4Ht3419j4jLO9XBry4WYybA91BkYTSzTFzf4W9RBQ0JNx/JcrWrQoLdbfD5PJkvDwi+aMYkcGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rUIfE4LFExM7BIbRBMq1KB2qwK/3jPobr8mQcwcN79Y=;
 b=a61Cbnec7ZDq1Lga3K2c2mnpj2a0YyEh+3+E3+ZvrelmRuGg8yOwb3+qBzqvRSuZQHel5YMkXh3pnzTyuPJAez/W0v9t0VkEHSurdXXxXeuxjO1qDDfl96jQ4UwRyJIA7UBwAVnhQtPsKBQELbNo1CkTHxbPPqn0K+LEGzQlTkmkjF1KDFvuYaGkevBbdOvQMT5wimlALsFVCVgbxekivucbGSEGBHbFkIl3nMJZgsVRUS+ZxwmKlsfivxwB9kG+uULr4KfTsF/XGBh4Qn5X7H7oYvA4Dwid59NXLC3oX9Ug08Pgv+IUPQVuFQOXV59ZTABMg9Uo1HovJODG+08huw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB5817.namprd11.prod.outlook.com (2603:10b6:510:13a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38; Fri, 3 Feb
 2023 20:24:32 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158%7]) with mapi id 15.20.6064.022; Fri, 3 Feb 2023
 20:24:32 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Fri, 3 Feb 2023 15:23:52 -0500
Message-ID: <20230203202409.577032-6-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230203202409.577032-1-rodrigo.vivi@intel.com>
References: <20230203202409.577032-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0332.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::7) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH7PR11MB5817:EE_
X-MS-Office365-Filtering-Correlation-Id: bdaef0ac-b5a3-4a6e-f603-08db0624a8b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /pGsBlLfeFFpqjaeiAqtGYruJyV2qzPQl8cRTBeqOAwTVwH9hjsgHRewWjKG37+DbYlzJf5k8wDfmhdS5rmVhjj2zzyeE28SphZHxXQIokub1yFPCqrj5SCW53C8TJfeg8PuBX7qTrpTD2DTS4fmkOIwqEu8aAbv8v5gitZr86Ak7nbsPXxDVXxOhJk8GobhuxRYiPh7ZyqV2WArn6d9sDvV5ZEdpeOPOE0rFLUDRo/yPQD7jB8/1qtywg8PZwtqY92+usiLm1LKYU0/TMWKmT7/GZGX1H2SA2KotTENFRtVBYBOti08plYDG1C9ruqO/vO/cNLNtYihJbFNX2d8r3cJZms7XWlzXhbTYa/+OLhytfgGwJV9o4ftDCTwV4jOP3ijSXh7KuA3H4iy1B0qNF7DD2Rrbx3TjqnO2IibMK8BH4LJfsL7lpy3Me6Rv+xd09IlW/fzlKc/9b6MpWGUGOjelJpdD9VG2mgc3H7usVeHi1W6Pa6RCrf0F5mGpPjNtuIyZ2i5Bu3wZvuK4opiAOqAv4oH4e48Ez06+6JsrlE1AR7jGqeJAus2Ezb3Ei5Ki4cd3R7s6Li5ZRQhvTukbZu3Q+vj/P4GTmXBmX4BnaHALwwf0PYZQcQV3nw3y0tjyI0tt8QKt7Mu3Ejiwn05xw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(396003)(39860400002)(346002)(136003)(366004)(451199018)(6666004)(316002)(4326008)(36756003)(6916009)(66556008)(54906003)(8936002)(66476007)(8676002)(5660300002)(82960400001)(66946007)(38100700002)(86362001)(26005)(186003)(1076003)(66574015)(6512007)(41300700001)(6506007)(2906002)(44832011)(478600001)(2616005)(83380400001)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Mmp5akFSSDhjanVJM1NuajFpWHlaRnN0NnZEbG1mbnpRSmJuZUY5clBGZ2xD?=
 =?utf-8?B?VUU5OU5PeGhSSkFRdFNIbmkrZzcrZkllaERYQlVBRTFybUFYSzFLWVk1ZnpQ?=
 =?utf-8?B?c3RFQm9ZM1hTU2QrbzZBOS95cThGSXVnV2hjeXZ6cG1USTdsVmRuNXJXRm9F?=
 =?utf-8?B?OElyamM3VXNiRWZ4L3djcFdNYW5Ndm9IME1lcFZ2SkNvclpFckN1T1NiZDU3?=
 =?utf-8?B?NHh3alhpZDZzbmNLWWJZUUVjblFQK2xUQlF2MkRsOExjaENRbXpmSnNGN3Jv?=
 =?utf-8?B?eVVuM2YwTnovdjBoTTlRckY3WHlaVHRGNUQzT3pFUWt5K3lrN082ZDVIQkNW?=
 =?utf-8?B?dzBTamNLa2lVVWRPcGluMGcveElaSm9WU2Y4T2lrZ0t4dC9ZSXpqZllIOGNw?=
 =?utf-8?B?d00vTDBhdzBvdk5uUHBwQjI4S0pYeEQrQlNHZHhLVWt2d2grZjJoWHJFTXp4?=
 =?utf-8?B?VlE5WUZiZlpQZDVONHBhdHpJdlY4RWo0RmZsVW9SQ1Q5WUE3czdkNE9yUzVC?=
 =?utf-8?B?OEY5d2lpbzZjN2w1K1dkak9oQ29JT1JRTGNsS01yaHE5eHdBblJ5aE9KUUVC?=
 =?utf-8?B?UkF3K042SCt0NVdycE9KamFVeUlvamFhOGQ0NnZRa0tNYXZHM09LTFQreHda?=
 =?utf-8?B?dnlOUUhOYjBqNUM2TUtuZHcxWVhkUW9ML1FrKzR5d245QXR1bmJMTUpoeUMz?=
 =?utf-8?B?dG0yOUZ4MVBjU0V3VXZMbTVxSXNDWWEvSFdubWxOd1pGTklwYzlPK0EzMTc3?=
 =?utf-8?B?aXdqOWpISVpHbW9zTWU1UlN2c0pDQkRac1JJZzRWUVkrcE9NQUUxYy9qZkFS?=
 =?utf-8?B?eE9iaU51czRWYVlncFJuaGxLZEZIZG9YcGJFeUI0bzBiNS8wekl3WVI5VVBr?=
 =?utf-8?B?b3dWM2IrdkNyeGF3RFY1KzYvTkFFRU5keU1nUGVwR1QyUklsUTBpdW9MRk5H?=
 =?utf-8?B?V3RQdGdETkhLZS9VWks0TGNYZWpBN0svdkRRWEgyWDFvd3h1Vi8wSXBCM2sr?=
 =?utf-8?B?RkRMVXhITU1PRExtWnpRcW16VHRPMnd5b3RDcFBhVHJLSEw5cU1RVkV2NFVZ?=
 =?utf-8?B?dzVyRnlyVVVBaURVd0ZUaXlIaVByR0xjdnB4dWxsTVU2cEEzalVxaXh0OE8y?=
 =?utf-8?B?c3E4UkNxbmV2MXRJeTVLaS9LV1diLzdIM2Y0S2JTMjREUVdIMlR3Q1g3VkU5?=
 =?utf-8?B?aWlmS25jeVk3WndkVnpON0xadWYreUhyelRRbmx0dWZ3YmdleHQ1VFF3OXFm?=
 =?utf-8?B?R0hEczNvSUdZdVRxY1NseXJGNjVSM1NEazczSkZsVWVHZkcxWXowejBPN2VR?=
 =?utf-8?B?Rld6K0JBbnp3a1RUQmNmaS9YenlrMzhFR0d2SnJNQWROR0ZDczJmVmp6bUcy?=
 =?utf-8?B?c3laTHdZM2s2bEF0L2k0Q251NStUS2JFWHkvYWFBMENNY1FHTHZWYlhVNWE1?=
 =?utf-8?B?OVZqMnRjS3M1dTUzWWtlYjQrdVVpMmZuTnE0R0RhSFYwbGFKdFU1MGJHSWll?=
 =?utf-8?B?a0RlVDFSVkRtY0Q3blQrL3U5WnRER0U3RTF3T1ZUWGVHMGxpSUhPeThySXBo?=
 =?utf-8?B?QXJINFdwSHdEcGJxRnRYUzY1YlZrZ0RiTFlaU3dqV0w2U2hlUkdQelpLKzFQ?=
 =?utf-8?B?NXhkTVlrUENSMXBOalV3M2htMFYvRUlSSHdpSzRjcDl3L3hKdWgvbGhmVDJv?=
 =?utf-8?B?bHEzbTUzZ2gwMS9RSyt3czdOcHQxNWd6akxiZ0srZ0RlL1VQeDY3VC80MzU5?=
 =?utf-8?B?Yy9qZkZFOU9jaW12ZUtrZnBTbWVicmZsWTFlR2Y2ZEh0QUhsVC9ROUFnUXpp?=
 =?utf-8?B?MkV1dk5XQm5vRWs4SEZJS1Q5UVFsVFo4VnZ2MXJhTzVZT1UrMXRYK1F1ejRL?=
 =?utf-8?B?T2crYXZuRURCeHl1c2V0Q1NLUXcxWjR3cmlwKzM3eU4ydTJ6ZjRhK1krdGkx?=
 =?utf-8?B?ZHRraTlNTmp5QUhTeVhXaHdueU1jNTJoTWtTdm1PQ1FFRHNxYkdENHBtOEFY?=
 =?utf-8?B?eUp0NU5la1RkN1QvdWs0U0V2TlVKRExWbm82UzdnbFJzdFZpV2pTSnMySVRZ?=
 =?utf-8?B?V3ZDM2dya1hIZVphTmxJdHBKUW5INUxrRzMvOUpBV3locFdZZklLR09YejVm?=
 =?utf-8?B?WGpwcVlNQ1JrVUhTOGNrQ3duampMZ2pnS1ZRSDRxZkpuRGx4VTZtWm5zN3dD?=
 =?utf-8?B?WFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bdaef0ac-b5a3-4a6e-f603-08db0624a8b3
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2023 20:24:32.4525 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ollj0kHAMvSAwTtaFz3SbM0EM81iFMDfd5vJe7awGw/FUE7Ow/dH2k+muoM2iqwJfRlc4MLrSrfu1TqH2jtWqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5817
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 05/22] drm/xe: Invalidate TLB after unbind is
 complete
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

This gets tricky as we can't do the TLB invalidation until the unbind
operation is done on the hardware and we can't signal the unbind as
complete until the TLB invalidation is done. To work around this we
create an unbind fence which does a TLB invalidation after unbind is
done on the hardware, signals on TLB invalidation completion, and this
fence is installed in the BO dma-resv slot and installed in out-syncs
for the unbind operation.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Suggested-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com
Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c |  2 +
 drivers/gpu/drm/xe/xe_gt_types.h            |  9 ++
 drivers/gpu/drm/xe/xe_pt.c                  | 96 +++++++++++++++++++++
 3 files changed, 107 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index 0058a155eeb9..23094d364583 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -18,6 +18,8 @@ int xe_gt_tlb_invalidation_init(struct xe_gt *gt)
 {
 	gt->tlb_invalidation.seqno = 1;
 	INIT_LIST_HEAD(&gt->tlb_invalidation.pending_fences);
+	spin_lock_init(&gt->tlb_invalidation.lock);
+	gt->tlb_invalidation.fence_context = dma_fence_context_alloc(1);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index a755e3a86552..3b2d9842add7 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -174,6 +174,15 @@ struct xe_gt {
 		 * invaliations, protected by CT lock
 		 */
 		struct list_head pending_fences;
+		/** @fence_context: context for TLB invalidation fences */
+		u64 fence_context;
+		/**
+		 * @fence_seqno: seqno to TLB invalidation fences, protected by
+		 * tlb_invalidation.lock
+		 */
+		u32 fence_seqno;
+		/** @lock: protects TLB invalidation fences */
+		spinlock_t lock;
 	} tlb_invalidation;
 
 	/** @usm: unified shared memory state */
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 3c0cea02279c..3a1a7145effc 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -8,6 +8,7 @@
 #include "xe_bo.h"
 #include "xe_device.h"
 #include "xe_gt.h"
+#include "xe_gt_tlb_invalidation.h"
 #include "xe_migrate.h"
 #include "xe_pt.h"
 #include "xe_pt_types.h"
@@ -1465,6 +1466,83 @@ static const struct xe_migrate_pt_update_ops userptr_unbind_ops = {
 	.pre_commit = xe_pt_userptr_pre_commit,
 };
 
+struct invalidation_fence {
+	struct xe_gt_tlb_invalidation_fence base;
+	struct xe_gt *gt;
+	struct dma_fence *fence;
+	struct dma_fence_cb cb;
+	struct work_struct work;
+};
+
+static const char *
+invalidation_fence_get_driver_name(struct dma_fence *dma_fence)
+{
+	return "xe";
+}
+
+static const char *
+invalidation_fence_get_timeline_name(struct dma_fence *dma_fence)
+{
+	return "invalidation_fence";
+}
+
+static const struct dma_fence_ops invalidation_fence_ops = {
+	.get_driver_name = invalidation_fence_get_driver_name,
+	.get_timeline_name = invalidation_fence_get_timeline_name,
+};
+
+static void invalidation_fence_cb(struct dma_fence *fence,
+				  struct dma_fence_cb *cb)
+{
+	struct invalidation_fence *ifence =
+		container_of(cb, struct invalidation_fence, cb);
+
+	queue_work(system_wq, &ifence->work);
+	dma_fence_put(ifence->fence);
+}
+
+static void invalidation_fence_work_func(struct work_struct *w)
+{
+	struct invalidation_fence *ifence =
+		container_of(w, struct invalidation_fence, work);
+
+	xe_gt_tlb_invalidation(ifence->gt, &ifence->base);
+}
+
+static int invalidation_fence_init(struct xe_gt *gt,
+				   struct invalidation_fence *ifence,
+				   struct dma_fence *fence)
+{
+	int ret;
+
+	spin_lock_irq(&gt->tlb_invalidation.lock);
+	dma_fence_init(&ifence->base.base, &invalidation_fence_ops,
+		       &gt->tlb_invalidation.lock,
+		       gt->tlb_invalidation.fence_context,
+		       ++gt->tlb_invalidation.fence_seqno);
+	spin_unlock_irq(&gt->tlb_invalidation.lock);
+
+	INIT_LIST_HEAD(&ifence->base.link);
+
+	dma_fence_get(&ifence->base.base);	/* Ref for caller */
+	ifence->fence = fence;
+	ifence->gt = gt;
+
+	INIT_WORK(&ifence->work, invalidation_fence_work_func);
+	ret = dma_fence_add_callback(fence, &ifence->cb, invalidation_fence_cb);
+	if (ret == -ENOENT) {
+		dma_fence_put(ifence->fence);	/* Usually dropped in CB */
+		invalidation_fence_work_func(&ifence->work);
+	} else if (ret) {
+		dma_fence_put(&ifence->base.base);	/* Caller ref */
+		dma_fence_put(&ifence->base.base);	/* Creation ref */
+	}
+
+	XE_WARN_ON(ret && ret != -ENOENT);
+
+	return ret && ret != -ENOENT ? ret : 0;
+}
+
 /**
  * __xe_pt_unbind_vma() - Disconnect and free a page-table tree for the vma
  * address range.
@@ -1500,6 +1578,7 @@ __xe_pt_unbind_vma(struct xe_gt *gt, struct xe_vma *vma, struct xe_engine *e,
 	struct xe_vm *vm = vma->vm;
 	u32 num_entries;
 	struct dma_fence *fence = NULL;
+	struct invalidation_fence *ifence;
 	LLIST_HEAD(deferred);
 
 	xe_bo_assert_held(vma->bo);
@@ -1515,6 +1594,10 @@ __xe_pt_unbind_vma(struct xe_gt *gt, struct xe_vma *vma, struct xe_engine *e,
 
 	xe_vm_dbg_print_entries(gt_to_xe(gt), entries, num_entries);
 
+	ifence = kzalloc(sizeof(*ifence), GFP_KERNEL);
+	if (!ifence)
+		return ERR_PTR(-ENOMEM);
+
 	/*
 	 * Even if we were already evicted and unbind to destroy, we need to
 	 * clear again here. The eviction may have updated pagetables at a
@@ -1527,6 +1610,17 @@ __xe_pt_unbind_vma(struct xe_gt *gt, struct xe_vma *vma, struct xe_engine *e,
 					   syncs, num_syncs,
 					   &unbind_pt_update.base);
 	if (!IS_ERR(fence)) {
+		int err;
+
+		/* TLB invalidation must be done before signaling unbind */
+		err = invalidation_fence_init(gt, ifence, fence);
+		if (err) {
+			dma_fence_put(fence);
+			kfree(ifence);
+			return ERR_PTR(err);
+		}
+		fence = &ifence->base.base;
+
 		/* add shared fence now for pagetable delayed destroy */
 		dma_resv_add_fence(&vm->resv, fence,
 				   DMA_RESV_USAGE_BOOKKEEP);
@@ -1538,6 +1632,8 @@ __xe_pt_unbind_vma(struct xe_gt *gt, struct xe_vma *vma, struct xe_engine *e,
 		xe_pt_commit_unbind(vma, entries, num_entries,
 				    unbind_pt_update.locked ? &deferred : NULL);
 		vma->gt_present &= ~BIT(gt->info.id);
+	} else {
+		kfree(ifence);
 	}
 
 	if (!vma->gt_present)
-- 
2.39.1

