Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C163C761AF
	for <intel-xe@archiver.kernel.org>; Tue, 28 Mar 2023 16:13:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF53F10E082;
	Tue, 28 Mar 2023 16:13:47 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3962D10E082
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Mar 2023 16:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680020026; x=1711556026;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=xpQSilb3ExEfGBA2HzunHz32CYgpypccHfx7dAmP0MU=;
 b=f58+PJUj/XMQMhZIMC9Lq6eds4jRvznrvCRINBtwYk3+PXgLGMrJJVTL
 shgn6BNl2ZXPvhE00SPeLkOOxVW4p5XGOMqLNOpLKQgjv4rEu5YvbWf+W
 m5deR2PxMItYHPwt3k+c8+k7jgsftLf1/yu8+lY85hEMj9xhFD/dzehAm
 zYi2mHBVntoBGhjobs2ODAmzjco/HmAQWYeVjRRd8SAUaimoWNyG4qRFO
 at0ncJsX+u6KH1SMunazfvKJ6dbMRfYECa9RyPPv1L+4Eg6xtcSU9BwyN
 FY3JRrTg73fo2oHD3hPTWagk17VMcVoJqSM1wKrTMdwIrd9+dfZX9ZPLt w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="368375472"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; d="scan'208";a="368375472"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2023 09:10:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="1013620830"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; d="scan'208";a="1013620830"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga005.fm.intel.com with ESMTP; 28 Mar 2023 09:10:40 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 28 Mar 2023 09:10:39 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 28 Mar 2023 09:10:39 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 28 Mar 2023 09:10:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rny1TjwkVFvdLST300VtxItPDgfjo7N6zy/MZmhY9dQuvu2ZIBZUGuS4eMpZrnijuHaFMLSfM5F/q8wQQWm7mQLEAkEEcM7pCLZ11iikm4ZEkrnzv4MUGynJcAA7IN7syiPbmxb+qoksLd4jtouS0dLspp9Qu9mIde4PnU3KujpsfJaMfrzqEH2h2QzoIl+5IDGj+tNxX8thoSgIergMfsvRU943xBPrOPZl8a++uUq8HBjEMyyjDsQSXvTt75RkNrKcXzppK/dQKRG/WtjNoP1Eml01KqJ//uBz4SRzY0gSBPFMV0y9GB1HCRNDOTY7x+5V+p8uyLeMISsW5whffg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jizGs1z/yIbDeo2piyNTKxE+MG1XVZqCVeUyDYLmfQc=;
 b=EGwzAlNc6wS/fTnusHeZilP3dTzmmXEb9lSNMdvAvS1SEho3ROt4Ww3FfbDInu1Hmrk/G+8wfjOrlDl6gMNRFAkFGzvfv1k9U0rU/84WVC0SWNik2dYsRdcmdO0YBGObKoIPOnD2aijzdLqtjq5I05po0mVS8X5IkKkL4J08s47lO16OJTE6wOqlWw3xROA7XGt9T7DpzOI6AtNs0pk8C6jL6M7VhZ+t4oxFrQLXUUuAfOFwWN/uMN2Rzvs4lwq+Vo7BdodKSgIytM7j+VNmJBVupYNIaoxlwrr4nHRGdMR4atSjeNpxYGPWTLsmqij8Ebpyrem85DwQ4zdU98opsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ1PR11MB6297.namprd11.prod.outlook.com (2603:10b6:a03:458::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.33; Tue, 28 Mar
 2023 16:10:36 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::2b57:646c:1b01:cd18]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::2b57:646c:1b01:cd18%6]) with mapi id 15.20.6222.032; Tue, 28 Mar 2023
 16:10:36 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 28 Mar 2023 12:10:18 -0400
Message-ID: <20230328161021.669017-3-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230328161021.669017-1-rodrigo.vivi@intel.com>
References: <20230328161021.669017-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR08CA0020.namprd08.prod.outlook.com
 (2603:10b6:a03:100::33) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ1PR11MB6297:EE_
X-MS-Office365-Filtering-Correlation-Id: b4de566f-e19e-4c9b-9f95-08db2fa6f6f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZQ5YY+ENHCk/9gwHSyZTo2QCZyTQ5jLPxGioV1GpmhQ2Cg/fC0mXddgDvz5tsbX51Hu3qdO8x0Nuj75mp0h36ujAnr0j9CJRhek2NNnyFAHU4QlYE2secMTnhhZCF9ywN6HjgGl1GWMvXhkXnbOwHzzPgBWDUQ+M0xzLE6bb3UtIL7TudV/Dcp+3OMTG3uP9u9qEEXjg9pld8yf0vcyYqbX7kxQtMyZT4QmchJKz1XnSNtpNop+0eYP/wp/bSf/S82DngNHNC58Za9+M3mUj/D06gqpFdmtg67yMGzqWrbPlqkTvHjRK+QqwmG1AmcpuczbCjNQsqWNHRFd00m3ayPVU+SjLMGWvHunSVSXG4PHeE7ECW7besmzq+hQhnoykxdC//NJn7LixfvqaUORprK852rBXOrAne5X1kSh/kpHfMjiu8LUsS2GrH6CehBcELxQ9BZ6bfdQm5Cx3fUqktjuL7Hl1HJ0DxyvCya068rv28Wd+3G4aW+txNZ5yqQkkox+0qJ4BVW2zE6WfKsNH5lV6ss2ffL3f6VgMBQyxaoErdoOyw/lYAYWERKkDITxX
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(346002)(396003)(136003)(366004)(39860400002)(451199021)(107886003)(6666004)(6512007)(6506007)(26005)(36756003)(5660300002)(478600001)(8936002)(6486002)(4744005)(41300700001)(66476007)(66556008)(66946007)(6916009)(86362001)(4326008)(8676002)(82960400001)(316002)(38100700002)(1076003)(44832011)(83380400001)(2906002)(2616005)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xyInpszha2uxrg8MBoWZwynTk5ZFGCDDCgmcBewDlmV6t0u7tFBk2kv5Gvo2?=
 =?us-ascii?Q?7t/iYfnhneWNnMIFMn4TXkFLxbk32iCq6D11VwHaB3dXwufYfEfQ/UGVECY3?=
 =?us-ascii?Q?xU7uo+CtZcSdwnlY1J+kMH5Jb4M0vdGjW2GhwAHuKNc3U3szv9TGJLwL0zKg?=
 =?us-ascii?Q?fV7qkxEaZNWDOLB3YFIMtujP6R1rpTzjtOwhLp521Hf3MgQJQkszG+Nda2k9?=
 =?us-ascii?Q?ni9AwEryb4123EZbuFRVKp5mJETSwzc/TLHU0jI/rY42h3CVBbNpla90WEya?=
 =?us-ascii?Q?O5SrDYlvhONIY5i26zb2DMSVRn3oHKEdSB+N7iThKfnP8VbMlhZ9e70QagG9?=
 =?us-ascii?Q?s1ZkjA1jESY2W1HxR/09TF5/792yQKwPLVfxn8oQ3x3xLc7uhJS8iWDjbzEX?=
 =?us-ascii?Q?XCjvMgdc76Kepb8ktNv/B0qnHlyW7gecrqZ3x2W0BJO5l1KvfJ/PmkP7TiXS?=
 =?us-ascii?Q?a+zr/CvNCfdYHXJyxoSfRouH66mWTuhpZKihXgO9pYmpDB5Q1AX3tv6duwY9?=
 =?us-ascii?Q?0LppFTip2yrW5czIGErs0megcaN3DLfnYeMXkoXldsozLxw215m0vtOgcNe1?=
 =?us-ascii?Q?z/2EfaVHMnsRSlJoUpWglYxwVZQkLqZinpbIzOGvz4lPvahP3iFOwSgEPmyw?=
 =?us-ascii?Q?McTxIGABUM1pirKkMAgdiN40MK1dQoFwoycJR2e/IzBAjD4cfgDyBwLeO/i+?=
 =?us-ascii?Q?syUcZE7FE3V6+PqJlZwmQrZteBhL5WdwV2bkUDFNcM/C8fDeSWic3A7EwxYc?=
 =?us-ascii?Q?2Ln8br+1zRGgm/IWHB4duSDbTrTB3GOczLWnVbBiRk7a2is3svgHCwH2BtJy?=
 =?us-ascii?Q?h94yYIAKas3YhNAZo3Wp9bTJXSsGwTvmHaiFQ9ZZI1VQxEcmMYyD3XP8HkIo?=
 =?us-ascii?Q?muWxbR9gPkq39DZlTb6bsqycN5PK5w2xGEy6l+1mfoJ9grbsoYsT9nvyN49X?=
 =?us-ascii?Q?3f58Xek36mT42xIID1Vn4eNI5IJu+Ya4vdcyalpmvHJdGg8IbIWnaygLo2Ic?=
 =?us-ascii?Q?owD6UChetW2jrwCybt2gF8JJQ8KOULvxikmdAU96SFzJx27TEAJiL51JTZ1F?=
 =?us-ascii?Q?RKFNxcbX5dF/PMvf/A3s25iFM1vDjBNNucNZXEXRF2QKJ5HufjQ+w4cQ1x7N?=
 =?us-ascii?Q?Y2TWkkO1VdfmfoDAa4EMh5p4DrMGjeld6ZV4kPS1md+LOJ7l5fHf8vgVYBo7?=
 =?us-ascii?Q?kyWpqx++APeu+c2yPErnmpPej4y0Y/HW58NuuGnM50H+SVyN64wPjGOE42k4?=
 =?us-ascii?Q?sVWF6W4a24nvBQ9lbYYr6fH8LKMiZH3pyPAv1Vy7ZE2BBHcPAzCpA44Qa7xi?=
 =?us-ascii?Q?8uGJQ+FGSCOQ0JQ0O7qhrU+mxPXtXbA2Qj2YMRXiNlx9u7kvbRY3fafPePWy?=
 =?us-ascii?Q?yWoKemd6QaKYzQepPjrSgiZs47h4MHWP8IzGDv0FvRnCOC2YYOaJL1eyKTf4?=
 =?us-ascii?Q?LqF43Y3+oZ3ASi6uHQDQWCuQhOdgHIkyEU98efJol2NjVRy95qy2xq70HQLl?=
 =?us-ascii?Q?JsuAcfW1XoK2uY/+6kxyiZrtXWLpf3Y+Uf8GMTHUe/y2ez00ZEjtUMk9Domo?=
 =?us-ascii?Q?tvUIZeSANOquwvMV45t4QD9Ok6gDkEzAdztfsE7W?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b4de566f-e19e-4c9b-9f95-08db2fa6f6f5
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2023 16:10:36.1118 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tDod8puldEtfxcdsdvZFhxei6zJSYze+1Japj06gcyrNFBW/93XW8Sd8yk6qpFy0FBBSa8/lzXkYwKV79BkQeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6297
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [RFC 2/5] !fixup: drm/xe: Allow fbdev to allocate stolen
 memory
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

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/i915/display/intel_fbdev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
index ce7abffaf456..b435f69decd2 100644
--- a/drivers/gpu/drm/i915/display/intel_fbdev.c
+++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
@@ -340,7 +340,7 @@ static int intelfb_create(struct drm_fb_helper *helper,
 		info->fix.smem_len = obj->ttm.base.size;
 	}
 
-	XE_WARN_ON(iosys_map_is_null(&obj->vmap));
+	WARN_ON(iosys_map_is_null(&obj->vmap));
 	vaddr = obj->vmap.vaddr_iomem;
 #endif
 
-- 
2.39.2

