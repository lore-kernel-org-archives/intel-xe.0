Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FD45C4332F
	for <intel-xe@archiver.kernel.org>; Tue, 14 Nov 2023 21:12:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23E7A10E4DD;
	Tue, 14 Nov 2023 21:12:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A47910E4DC
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Nov 2023 21:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699996373; x=1731532373;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=q81F3sOLsAhgF+A+K40SrHKFWjE7+BbL9XUk4UIuek4=;
 b=VHvAkV/EsU0PTqCmofvEqKnrXbhoq+ipvcJFY/PkBKpkj37WAXRAa5/F
 SF1rWEl8fsNIKRDMtBMx009yuRNjOD3FmIIN0SZLl/VUy2EltfOArhDiJ
 u/ltYrENu40OAu/93qPPDxwx51/mOD7G4vIpGw6PDAj8a4FtVsC6qSnWW
 KUUoidEGLvlFzY+ad9uz64zBt3rWSkyoBmxOJcATzaVnsvgh/rR4/n4iY
 7HOhRF5RP+HasNXebPGKOWiznz8gcov7hhzkCBZwf5q5npdnQQRj6bsft
 olwYqyRbmH+jXLqlorX+vTOn9BDLnTAk4GIaBDn+TRC3Ktbg3Pg7+At/Z w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="394664647"
X-IronPort-AV: E=Sophos;i="6.03,303,1694761200"; d="scan'208";a="394664647"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 13:12:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,303,1694761200"; d="scan'208";a="12921972"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2023 13:12:52 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 14 Nov 2023 13:12:51 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 14 Nov 2023 13:12:51 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 14 Nov 2023 13:12:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YVWFU/W9MkCfItBpRu9iXo9AU/XEy+dCFJ/DAMkxTV5kFIX/lii7g03fsZMd1Z81WgkQyfjNkZv78g/dg6ft02AbZhOF8Yc1MmyQj4xe8SDEaliY4FZU7L4RRPt0D4SOHXqIVHaxmokfYnDvOxc7VJOpGnHYF3X7/k8sk4IygCNbiAIB5koGjNzirTdswrpUxB9Q+K4oJlUlUm1FAzztUYZcMYTzMLIooEWsizx09rlLAlD7odVtJGAh5IwULGkFPe2G+UevmtuXZtOgHCtngCuuPGZMlbIzHozovoWLPWsT5BpTd4MsD7UHq+OaLAi4iIYVaWe1D61h5M2txavc2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NTs/lQ5t+QqEN6AhgYzmuAqoA3RLdzSc1ng6mSi+IEA=;
 b=Ndwq8iDgJpISffUHkEVJoHuGqTXtTu+A1vPaiot0eRaCcOwkXnNKIJJSnFzXmSwrUoRg+7MCgm21VFNqTtfaHO1+mrSWxfCjCw6GOOag5hqxEZwEjLqr6jv9bL31uXJrOn0Z8Wdf67BKE0M1zMbQLjHjX/1LMlMU8fUmN5l3KELcxUOQqhpt6Et2Flh0aitSrZeuR5cr+1q/TLSfU3epw79TjxYS/LdG3XMmsnswbdTaenYMyOyWlE8FoIk9zOW6EIJ1aZMvI6ZW29Z4z3WL8PjhUrJ9TKedr9VxkFkN4gnghvuzW3I37isuOSqi6wMgD6mS74kER002UiqddkdXhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by BL3PR11MB6531.namprd11.prod.outlook.com (2603:10b6:208:38e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Tue, 14 Nov
 2023 21:12:49 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7002.015; Tue, 14 Nov 2023
 21:12:49 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 14 Nov 2023 16:12:33 -0500
Message-ID: <20231114211233.498338-4-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231114211233.498338-1-rodrigo.vivi@intel.com>
References: <20231114211233.498338-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR03CA0003.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::8) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|BL3PR11MB6531:EE_
X-MS-Office365-Filtering-Correlation-Id: eb320281-6a4d-4e5a-550c-08dbe55674da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GPYZnhcFcsPz6RDhwQQgyqTks/S+HDBFOmS6MAhM2lCBjeJdIkcAnYZQIQXMwvsD7E5Ku9m16yJhjkYDxw4uMN43HEuyOd40sJlW53KXMNCV/AxUKhLCVtyPWoWV+y/b7nTzMKY/ShzIEGpEn78tXlZfoSuWN7Fljm7+HqaIqGS5Ron0O4aAP+7diR6FI5djPr+jEUoKDVFIk+2TCbWczNbYXvzdl6DGrYoEkMXwbVtASSerkcP+q89HpaxuA+j7v8twgujA+cxj1woZinjqrrdLGqHg4v5Nwi0yU5BHL6NJAvjJnW2vPQT3gW1+V6uY2XdsrGwweSqpg1a7btlxCK0J1wmkJmIW/4XU2YkuVnTQA+yAXZWszRwQl8K3B+WkcZMTAMW9b7E6B2zitg2nPw0Q7lMIk3l/cMHk/HsZ+1s55xpvTHyXuWzX6SGZ45NrJKl5mkc4ac8/VgWXWvTU4OejVKfeXq2yRgbZmfx239xUvFZhiBUpF5x94yzoTcG7RaWLk5aecd4X/SMsboUt6Az6wWgEh0QaaNEz1zNN5y2Bcc3kcmr0giq7/dTkoPeyoKWvloDQQc240YUCPn918pZdCMgM+GIKDC0GO/cZC5o=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(396003)(366004)(39860400002)(136003)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(2616005)(6512007)(82960400001)(1076003)(107886003)(26005)(6486002)(478600001)(36756003)(44832011)(86362001)(8936002)(4326008)(8676002)(5660300002)(41300700001)(2906002)(6916009)(66476007)(66556008)(66946007)(316002)(6506007)(6666004)(38100700002)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?24oO3LVx1gqbBbtL0mAq9BZJ/gFHa9OXqYRq8uvkqtVtDtx4wlwatcipnj1Y?=
 =?us-ascii?Q?+NogN7U57YQXYYPaiO7lN+Co9xv9WcHlkuTVe3LJtDaD1NEX69rA/pPwO0EB?=
 =?us-ascii?Q?KvtIKv/AFsBiuOUpvs22OElvfqtTOZBvII90haZ3VBAnr+2sB/Gf/dORATur?=
 =?us-ascii?Q?zcssDb1p0UQL1sQduSs2JK8Qk6RMojkEapWWb9zVktwYtvJAKc+BeyvCDur9?=
 =?us-ascii?Q?GXerqKlJ1u+PBYtxVRWhuQO6My/31X1SF059oO8GbJjetNfdMQOeJW5AS4dz?=
 =?us-ascii?Q?A47lX8AB6Rnq/MKAiZRTQGz0wVAgK6JKbJN4T6VEeZizqqlcQkWkIdcWfp9B?=
 =?us-ascii?Q?UIN0rtmrrKhWJnj+C+gr2HlzXC4vCwzmSVotX0HWC/XGrOFpymPp/th4MqOA?=
 =?us-ascii?Q?Nmolup4AXtdZdL5aGmHopg8i4g75pZ16q4/7DemlKoHsH6hIHlVs/BCnert9?=
 =?us-ascii?Q?ESmzYPN+DM5LtJ/oC9ibSORbJ5qgZkHhJxYHHM2gjOIgdMEq44/mMZb1DHL7?=
 =?us-ascii?Q?JnVpMtR0ZwDswjWJeZUDYDJh7h41zd4JgnYuAx1LxQGyw7yasv6Qt/tnRov0?=
 =?us-ascii?Q?NsKATa2kV6z3/HvipjKQD9BZPnv5rtl/Vr8CFA2QTKsBMW+1spqsdyF1ds2X?=
 =?us-ascii?Q?Gh3j2Jo9gKdzxoSAn5CoSydFldFdm3ufYF97Oau9RvyDuf+2kuvhqDbouob6?=
 =?us-ascii?Q?wCrhHcM/kHdmrHIxOKKqaEsdNdo8I6vjTt21Yp2bvfFmtZUwJ+PsaoEz2QWL?=
 =?us-ascii?Q?uNLZZUJXxh1y9IYNmAVnAYrTSP6qm5ty7lgL21IJzo6Q3ZgTMNYtFxuD2HhK?=
 =?us-ascii?Q?BWY6Wg4HjsF+kpAIEUf1QiJSseFMsBGRf5ZzzdyVNB7gOryokhMZdwOVKFqn?=
 =?us-ascii?Q?4QOe+iC3hcREMmTTVgxr4FMFI3U0+CbT2oLrr7F7PwoFqQbpyLYgZKJTrUGw?=
 =?us-ascii?Q?j5gErgagGz4pqvoaRfRJMrOs9nZ9mCqo4eP6+La0MREw9qOKMan7rt7cBx7w?=
 =?us-ascii?Q?m511pF468acISqTUJhmrdwW971cc/r74VmB7XLZZoHhZ1rOiCy2vWCYbo6fE?=
 =?us-ascii?Q?eLz6B0Iw9/ZOUvM32utUJrZ+PIdxofQZ/ufuXHacVTfvKjJRrKWv8vPclmBC?=
 =?us-ascii?Q?ZJJnbtAaC11dR+NJdXDFYUnhHEMm4kEt1PMUG5mjqcD2R1h+b7oHBNreAHfk?=
 =?us-ascii?Q?y3MYq0qRNFZgAVQIO7dSV4G36bFz5uVNRBlwgnUweqIzP77zR1h2peF0MjFG?=
 =?us-ascii?Q?0R6X6ElNDYY4pbXZF4OyplqPgPaLRanqFxJyRHr3triM2I+cXJvZ9TjXTHHQ?=
 =?us-ascii?Q?vasaKBudwqKREr+1WvDETNUZlNI5i7DAs6thYJTqKoPy6ISoKCzKMoSFq2DJ?=
 =?us-ascii?Q?Neauy+hY9O4yBu1ktLxapsruZxBk8onz8rkYKaiyair8bCPBJdauW8okwVuA?=
 =?us-ascii?Q?tCL21THAqkAzIKWHlkOzfj8esW0GkpMCaw9clHa7/5fMOVWc9EDDmzMf1GbA?=
 =?us-ascii?Q?Ic+Bv4UpcAJte62O/fI38mQZUsHkliBaw8RoRH+2rm/ZwydSUBqWo0iJZ+DU?=
 =?us-ascii?Q?moSBm7SwshzxfAZjOHivizTSo0D8/c84eWOsnzAD6Arh2CvdR6QsnKW6LBVr?=
 =?us-ascii?Q?xw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eb320281-6a4d-4e5a-550c-08dbe55674da
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2023 21:12:49.4557 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qEN8uASL/En4lGvaNSUBKf4TwwVVPfC53HOh6Yv56PiB+OfznfTmSwOGl9vKW2kG5AbO6gT7OcNTarGdvJhdLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6531
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 3/3] fixup! drm/xe/display: Implement display
 support
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

---
 drivers/gpu/drm/xe/display/xe_fb_pin.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index 602d35fc62eb..ffd35a59f405 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -249,6 +249,8 @@ static int __xe_pin_fb_vma_ggtt(struct intel_framebuffer *fb,
 static struct i915_vma *__xe_pin_fb_vma(struct intel_framebuffer *fb,
 					const struct i915_gtt_view *view)
 {
+	struct drm_device *dev = fb->base.dev;
+	struct xe_device *xe = to_xe_device(dev);
 	struct i915_vma *vma = kzalloc(sizeof(*vma), GFP_KERNEL);
 	struct xe_bo *bo = intel_fb_obj(&fb->base);
 	int ret;
@@ -281,7 +283,10 @@ static struct i915_vma *__xe_pin_fb_vma(struct intel_framebuffer *fb,
 	if (ret)
 		goto err;
 
-	ret = xe_bo_validate(bo, NULL, true);
+	if (IS_DGFX(xe))
+		ret = xe_bo_migrate(bo, XE_PL_VRAM0);
+	else
+		ret = xe_bo_validate(bo, NULL, true);
 	if (!ret)
 		ttm_bo_pin(&bo->ttm);
 	ttm_bo_unreserve(&bo->ttm);
-- 
2.41.0

