Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B223C4167B
	for <intel-xe@archiver.kernel.org>; Fri,  8 Dec 2023 20:43:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5D4510EB27;
	Fri,  8 Dec 2023 20:43:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5024310EB27
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Dec 2023 20:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702068180; x=1733604180;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=jzaa4qHBNisbbmyRSDfwmK9XPsVWoJrAd/DumDOdq4A=;
 b=TWoSZq4cT5D9XSu1MGtgHZW3bngI+RyUOS14QxnzC9tGCld/rRm4UXsf
 PEtcAXwg2EXLEr8EOKuL+V6eomqXXEtWUmGRVi4YG9VOxzo0/BcvQb/u6
 BGT/99GQaOZ3w5GdtDre/l5scuH0bcXYNyt/fYPdp7S5ACz9pXwxlG7Gv
 iPRA+Gy/mV7nH5WDGnSc/gz6REjL7mnHIuul5GuZvwPapOmOnxWbo3Vul
 cJzql3CZ2vykDjPPt0WBCXK+opg0uBf03sKMeiCXyrIJ81zqaZm1wkgg+
 6q+MWmtIZag5hZafKR5cnZry/aOylerJ7+FnHjhegmYWOTRuvIurqOLSd A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="458778122"
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600"; d="scan'208";a="458778122"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2023 12:42:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="775915069"
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600"; d="scan'208";a="775915069"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Dec 2023 12:42:57 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 8 Dec 2023 12:42:57 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 8 Dec 2023 12:42:57 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 8 Dec 2023 12:42:57 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 8 Dec 2023 12:42:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oUafh1tBIWUf26hJQ+sq3R74Yxjn+lzVJRlLdXCv0jgYFlla+GEMYN0hZ3gLqqm9GBYcJF9CRLi+RY0DZKW3U/+KheTXhRN9Q2bdPm4tTRfTYS0MHxFBMK/KRKLBaxX6FUmswDDIjvAHHc2/1H38ZHxYppdPvyQDPmGoTuHFbFRMHH0cZE80LlREqY4HDpnsSWk5+Xz9iYVZyRZ1vUgUhn8DE0LFuXy0903gFoJakzUx2tamQ6pazUxF+tiDNbkcboqmWBXgjuOeehcMLId96rPG6gg6MSz9OLYxCOsaCgWc6iaTPG1ikwQVVdWGiwexnCA2TIDEgMG46pQB2ycVWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hqqK6LmCYatJWwhpFjm4n/VcAsGgQ7oKlzhVH0K1o9g=;
 b=EKsEQOCqLe+mbJbgbB3WNyq7riyQ2H8zsiN2zyKVc/WtPcQU677mB7NOPgiq6dm14Xm48YYOumdiMuVNhLFTz3PlP6HUVghSZErHpSWrLPjq+iXb+ic4B1dGTn+VN0OeXyJbe87okR7hTH5Ntc/PdYmOIt4Dd7dpwk5qTtqNuw9lU0mywBFB0cDsu/3NwJAjwZpjL9xs1NqG2Kbmt8aOhZ8WJ2yk7yLGAf+QrWfeqrE2RwgKfLolobk4w5HUDK1tQH0aCKTIrHVMfIuqvDw8vn+0smoCPfoWzD5zhDw3FGdaD75cW1Yv91cfE5SFREIpMwoFauVF06SAU5RLAhtAzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM4PR11MB5970.namprd11.prod.outlook.com (2603:10b6:8:5d::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7068.27; Fri, 8 Dec 2023 20:42:52 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7068.027; Fri, 8 Dec 2023
 20:42:52 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH 1/2] drm/i915: move display info related macros to display
Date: Fri, 8 Dec 2023 15:42:45 -0500
Message-ID: <20231208204246.958662-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR21CA0009.namprd21.prod.outlook.com
 (2603:10b6:a03:114::19) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DM4PR11MB5970:EE_
X-MS-Office365-Filtering-Correlation-Id: de7ada10-da47-46d3-3bbe-08dbf82e3ef0
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UtTs0BrYIuNqe1Z97BvNZkhllIXlCCQwGVzanDNkgTZMJIUKK29NOPH8fB49jK2jX5s4TwBLePDmlXuVkVDycZtLq6WbtUDEYZuELmzLAcLjTI5Kj8D+z44R78QIyZFAw8a3oCJFNlN13UPMLFyR1XRz50hPRokP67Q9SGHL2fFQ3exLAGmkjYrcWh0IXt7vAvI73wywcKn+t2ak4SE6MkFa+uHbP91LFTyB5ytDzWRPY5w+39oiuMhrD6XMg1nldCeWDfCWPgTIeBGK4hCwjYkPohSVf59tdFqHT1Uow8/SAEsi70DpBmuyX1xne2zxD9MCQdFPZQobLJCVLeCmks3oC+K60M/MhXwnp1m+pXatnrIn9JPSFIee7RpBGwWuMyy/JeW5CvXY6FQQKI3MbSlL+baEE1Gvkak8SbtKEoBRIsav7EDnA6KTegokwBg0nhBv1FXW54YTokdlrQSJsbfdVPcGC3pSuGQ7Z+uDBGjzOGN9Bc2CZUEs0az/y2ke1cW8i7Dx2jgDHlkwzFfbI4yGwtb7XL0+3ku45b5QccM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(39860400002)(346002)(376002)(136003)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(26005)(2616005)(1076003)(6666004)(6512007)(82960400001)(36756003)(38100700002)(6506007)(86362001)(5660300002)(83380400001)(44832011)(8936002)(66946007)(66556008)(66476007)(6916009)(6486002)(966005)(316002)(8676002)(54906003)(4326008)(41300700001)(478600001)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dFRWZGsyR1FZak1rUW14WFE5Z0NJd3BSSmxnc09EZnFiWDNiWlRWbU91ZkRr?=
 =?utf-8?B?NE1mZERweWVadDRkOXZ6REFVYzZNNWZib0w0bGVtMnc3NTNpdDVibGNRTEls?=
 =?utf-8?B?Vms3ZE9uN1FHTkphZGlxeTZYTGZ5MFc3UTNsRmplSFJleThnNUVSem5KSkpB?=
 =?utf-8?B?U3UvRi83MjNsRkZoZGliSmxySTR3YWFjRTF3ZlkyKzdocUQ0SUxmZnpOWCtw?=
 =?utf-8?B?bTEvbWRJb2xrOGxpWGNWVWJ5V3owMlhzQm1kSC92UVFtczc4cllTaEU0Uzl2?=
 =?utf-8?B?YUdvcEVpS0ozYURkTFZ1SCtkcUhnQTNGd041WUhVTXE5UXJCZGpKVnhPNEJn?=
 =?utf-8?B?K0RsNGxSM3pReER5OElzYkxOc0EycWs4aER6clVwUnYzakk4ZDBvSDdkcmpU?=
 =?utf-8?B?K0xOUG5UNmo4VG44dmNhUjhQT2tJMWhHV2RRcm5hSlZBU3dCZ0lBeGZQd1hq?=
 =?utf-8?B?UGJJTmpFcGIvN2NiQ0ZGSFFnSm9kcG14aG93Z2I2Z0pVTUlYV0REQ2RpcXZK?=
 =?utf-8?B?RWYwQnJKVkhJS1ZzSFB6ZzI2ZXFIZ2x1eUwyMktscklLVnBwcXV4bnN6MEVo?=
 =?utf-8?B?UVNOd3E0eXJhcHdRWmlZT3NUZkR0UnYvVENxOEhOQnU3V1NIczd6VjhoVDJj?=
 =?utf-8?B?d1FzRERXNmVFbUsvanE0NnNhdXdqNWFwZjg0amVDdkRYNmFMR0doTVBsbFhn?=
 =?utf-8?B?SUNhUmtmcTZ6OGQyY0NzRVBLSmlYWDkza0tEV3lOZmd4TWc2SzhzZkdBSkNB?=
 =?utf-8?B?aThIRUxGUGZUdTN1dDk1SDJMaHFkZkkxa3pWYUg5cjhDZnhOQ1ZxeWVqVncw?=
 =?utf-8?B?TDN6cXlxZGxFRnNKSzY1V0w0ZWlsU29vcExTMWJTdzBLamQ3KzJTc3J0cjJK?=
 =?utf-8?B?NWlyb2wyZHB4a2xwekVZbFhaUTRoejdaVnhWYTFFS0JUSFdza25wRzBZVlA2?=
 =?utf-8?B?dzBEOUJIT1Z3Q08zNTEvOEJ3ZHRuMlcrdXFPc1p6cTZDOExUNmU0NzJRQXBM?=
 =?utf-8?B?dXBmNXlQcThkaGxkVFhkQkZtWmFVS0orb05SV1BMK2VjVGVaNkJJN1NWdGxE?=
 =?utf-8?B?a2owdm9acUtDak5tTzFYOTBzOVVXbktVQXNISlV5ZXNibkhaVThxNHVnOWpV?=
 =?utf-8?B?ZFRwdnZMZ3M0U096TUxMc21PRUVJOGl0U1pVV2EvUXF3VlloT0JkOHZTMkNn?=
 =?utf-8?B?WURvRnVTbWd1b1BjWFNwQUlhZXI4OTBPam5KelBBeUUwb2hucmNVQlpQRjh0?=
 =?utf-8?B?SWlNNEpKUzVMMjBENTZ5UlVjZlNYUGpxblk2QW4vOVBQYUl1cndVZlB2SnQy?=
 =?utf-8?B?elVEMTlqNmJFUXV1NUFoWWMwMWNwZ2hjY3BvUTlPTEdlM0hzZk92UkwvbnVv?=
 =?utf-8?B?dnFyZVVPV1pBVlpxdXRlZ1JrWWZlZ3ZacVhUTUxHRUdJbzN1U01ZbTlVeVRH?=
 =?utf-8?B?Q0NyTHFCcHpDeUFraHluWHpBSmhmWUdOUGNEYjk2bWhMQnFBOTBxMUorRWdX?=
 =?utf-8?B?L0F0TVVUTzg2U0tBenBFMjlTU0wxS09GQ3lpdWVOa1ZDOStkQWVSOXhmZG0v?=
 =?utf-8?B?OTY1S2xPdjVUYkZaQnprUnN1eVR5VUtySFFzSTRGQ2tWazluSHFibUNkWWk1?=
 =?utf-8?B?VC9weFJmNDZMeGdxS0g2Z0h4TU5Sc2VJNVJzRWwvTy8zYlA2UHk1aW1qYUll?=
 =?utf-8?B?TWVOeFdKeWVqMU1UZHlGMCtWZld3aGhlWFJWbkJseERCcXZYVzNhN1o1T05q?=
 =?utf-8?B?UngzME9HY0lDcTFISU5jUXl1S09wbGJXYXhERzd1ajdsaW4zY0VKL2JySHh6?=
 =?utf-8?B?eERNa3libGYyTG9NWmc4YnRJUG45emJHWkx5bUp4R0ZPaWxwVW9XbGJRQWw2?=
 =?utf-8?B?Uk9aM3hRTEpwVytVeWdxR2FPeXlXdUdRdVVoMzV0WFNyWWtQbiswVzNxQUxI?=
 =?utf-8?B?bzhKeHViSDJJVHl1V2VSMVoyT1BIMGxleXBkOTk2MGJxT04wbXZxK1BPYUI3?=
 =?utf-8?B?UlVVSE82VnF6M0VhbWpKVkdmbThnbmdEeGp2RDFvTUlpNlVtbHFMODRlK1RD?=
 =?utf-8?B?RVAwOWZpcUlJcTNFNzB1QUVjRnhIT3IxeWtMcVhuUHMxMGtrRXNadmZQWW1Q?=
 =?utf-8?B?bk1uUW5QS0ZxNG5rWTZhcUJkTVBBVEZkZlR4WTg1OXlJK1o4TWJRNzZQMzBq?=
 =?utf-8?B?R3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: de7ada10-da47-46d3-3bbe-08dbf82e3ef0
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2023 20:42:51.3057 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sQ19fW876qtYJmJiiFpPfDoTpP3/BLlGJ9n4o9WJsDIdhxEipve12lbq/Ky3w+8agGEzvVTPrL5tkXP6J2/14w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5970
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
Cc: Jani Nikula <jani.nikula@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Jani Nikula <jani.nikula@intel.com>

Anything looking at display (runtime) info should be under display.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/41b53870ffa7bd41ccc337616c756c69326f05cf.1696336887.git.jani.nikula@intel.com
(cherry picked from commit 5e72e75d30fcff599e306fc9987eed8639c4a84a)
---
 drivers/gpu/drm/i915/display/intel_display_device.h | 9 +++++++++
 drivers/gpu/drm/i915/i915_drv.h                     | 8 --------
 2 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_device.h b/drivers/gpu/drm/i915/display/intel_display_device.h
index 62939d298f94..4299cc452e05 100644
--- a/drivers/gpu/drm/i915/display/intel_display_device.h
+++ b/drivers/gpu/drm/i915/display/intel_display_device.h
@@ -98,6 +98,15 @@ struct drm_printer;
 	(IS_DISPLAY_IP_RANGE((__i915), (ipver), (ipver)) && \
 	 IS_DISPLAY_STEP((__i915), (from), (until)))
 
+#define DISPLAY_INFO(i915)		((i915)->display.info.__device_info)
+#define DISPLAY_RUNTIME_INFO(i915)	(&(i915)->display.info.__runtime_info)
+
+#define DISPLAY_VER(i915)	(DISPLAY_RUNTIME_INFO(i915)->ip.ver)
+#define DISPLAY_VER_FULL(i915)	IP_VER(DISPLAY_RUNTIME_INFO(i915)->ip.ver, \
+				       DISPLAY_RUNTIME_INFO(i915)->ip.rel)
+#define IS_DISPLAY_VER(i915, from, until) \
+	(DISPLAY_VER(i915) >= (from) && DISPLAY_VER(i915) <= (until))
+
 struct intel_display_runtime_info {
 	struct {
 		u16 ver;
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 98fb68944064..92cc50ecab00 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -416,8 +416,6 @@ static inline struct intel_gt *to_gt(struct drm_i915_private *i915)
 
 #define INTEL_INFO(i915)	((i915)->__info)
 #define RUNTIME_INFO(i915)	(&(i915)->__runtime)
-#define DISPLAY_INFO(i915)	((i915)->display.info.__device_info)
-#define DISPLAY_RUNTIME_INFO(i915)	(&(i915)->display.info.__runtime_info)
 #define DRIVER_CAPS(i915)	(&(i915)->caps)
 
 #define INTEL_DEVID(i915)	(RUNTIME_INFO(i915)->device_id)
@@ -436,12 +434,6 @@ static inline struct intel_gt *to_gt(struct drm_i915_private *i915)
 #define IS_MEDIA_VER(i915, from, until) \
 	(MEDIA_VER(i915) >= (from) && MEDIA_VER(i915) <= (until))
 
-#define DISPLAY_VER(i915)	(DISPLAY_RUNTIME_INFO(i915)->ip.ver)
-#define DISPLAY_VER_FULL(i915)	IP_VER(DISPLAY_RUNTIME_INFO(i915)->ip.ver, \
-				       DISPLAY_RUNTIME_INFO(i915)->ip.rel)
-#define IS_DISPLAY_VER(i915, from, until) \
-	(DISPLAY_VER(i915) >= (from) && DISPLAY_VER(i915) <= (until))
-
 #define INTEL_REVID(i915)	(to_pci_dev((i915)->drm.dev)->revision)
 
 #define INTEL_DISPLAY_STEP(__i915) (RUNTIME_INFO(__i915)->step.display_step)
-- 
2.43.0

