Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 128EBC47DDF
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jan 2024 20:32:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C898810E0C5;
	Fri, 26 Jan 2024 20:32:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E19310E2B6
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jan 2024 20:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706301126; x=1737837126;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=oxJuVfYDdSbFxombhKQR/znEy8YgCbZZo0/vzL/gzbo=;
 b=a7Pvbae4WmvY0O+HKJ47QL197NLkqC4pdtkKCmJ7gCwZrVen+8a0OyNZ
 eDZXgIWYL7y+WrNp+2V5I52HS+Up9zrwtoUrr7nROSANpeFeYlxzEPop7
 HIufruEHm32TAv0oad/sMWfz4/0nPPqwNCzs3+lQdsh/laL2K8FrCnLHp
 L4RmCvA4fjIUsrgIWR9ceHr+cCxTOltxlDaG3V/8ZzEJoHIvzrfecXlA8
 MP7F6duSPdAdnmSJ0Ck163MgEf3ta3GUYs51hLisIYViWmWzlHaaNuNZN
 WQMD/ELf75xTj2UeoNAiRT3Czyfa0+HxG+NliIfSB6awcItx3qYMOEljX w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="9948721"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="9948721"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2024 12:32:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="877482263"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="877482263"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jan 2024 12:32:05 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Jan 2024 12:32:05 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Jan 2024 12:32:04 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 26 Jan 2024 12:32:04 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 26 Jan 2024 12:32:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IdhoEiyzRKC561oHotCB3gs1GEZS1X97W4Aby4Ht9a+obM/6UrVPaCP2A0vx6zpkdGoLqNABL5ETB1OkBmsCNzwK5XZVTys0H0oWHqTlGO9uk3IIIUI0mQdDPt0BkbAg+Kg8kxHd0WxBuN9bZqe3p4eo82Svxx6x4ix4n1UYmxAvC40x4bZJyYt6Yb/lYcwzhoFr/dn5blZBse35aIldnw4BFk5ecLbKsW/BRibjHpgsGBbJ40IGOqe+em964bhxb9AAvInv8NllGW/JlktDPOnkwHHQKuTLNqK8RVTILqA6irEYLK4OEkolZ5Cpoctsszj21jPWzXlcMbLFTgURhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EplH7AsT5Dyf4kBvdh9E4Zt/tTtxBcdLLmiaqd6KgOo=;
 b=mgq4O0d+YBjrXkxBOY/vvpm7uMsa95kxxbo+5/B55vA5+xVSMXABZi+s2fP+4zmtrnr8AdBu6bIUL+KjRx4bd0vycW4qAlesDOTgynttI3/mos+03m1IZm2ba4qM/PPvgAzLnZ81UifYnqKG2SBx+e7ZM+pjj87YwrIINYUIcIlmQNF7zzSu+VojD77ZNt88TrRpcQy/kaa7fR9tG41LZZuqR4gUd5n07XqIspFubYpeiRK8VpWH973Ax2LNg70E1/iUHpPvFHtc7l7kYE9Z5kQrHWjP8ynqCVE6Sxw6SLEjUD3N/aGXVOlmkqhim2ANDYkwYJAiiuaii4NP6G7npg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CYYPR11MB8407.namprd11.prod.outlook.com (2603:10b6:930:c1::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22; Fri, 26 Jan
 2024 20:31:57 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7228.027; Fri, 26 Jan 2024
 20:31:57 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [RFC 22/34] drm/xe: Keep D0 for the entire duration of a LR VM
Date: Fri, 26 Jan 2024 15:30:31 -0500
Message-ID: <20240126203044.1104705-23-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240126203044.1104705-1-rodrigo.vivi@intel.com>
References: <20240126203044.1104705-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0132.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::17) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CYYPR11MB8407:EE_
X-MS-Office365-Filtering-Correlation-Id: ac28c8ec-250e-49e2-fe6f-08dc1eadd74b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u/L1KP8Yarc4XQ9zDiSBH17QoCpBVvfqxkZD8VxS9BT/sehM69jVTXvLMegLARS+/rQTUAFBKcxBFj2RZIz/VdXlKJRQ8xzeZxlSEQItoyLSLy716JnecexT6vzSfY9PXtJW0Tm3XIFDL7028Nh3ozlYfg5xOMXU+DH0ey6SX26v8HZMbKeKUT+Ei/Z8P5R4818mDse33dgsq2dtdEpIqQx+RB3I/XXDUoIqhOCBYQEcPadjf+AO0SqzPWoX4d7e7GjeW8hU0P4f2A/WOGp2Tzg52tlwBMwMnq0AyLTnOpeRwp4iNQOiMAWotfh7tpclNgxZp11Ij7Pz8RvJw8SW3deygTPLypNvOW5zR0Duc1pLSKRp7op5SUfv7Mixmz2mZInCBiz0Y8qDYYHKbGHQy3Pn1Tt0IgbRph9DSwt1m0GKKdEsmBiMDtG/E7text43Cp7OFrt1S5AnhzHSQ0FPSM04ZyJCajcRgYVaa3qLSr+WxAvb2xP1dDEViLxWyOktuXSodPth+YV5Wjm/V1hxCdC0vDjZhCrKcFqxMj2JngnXZKd2ZFX7CdYbY/xhvqy8
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(39860400002)(136003)(396003)(366004)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(38100700002)(82960400001)(6666004)(41300700001)(6486002)(478600001)(26005)(44832011)(2616005)(83380400001)(6512007)(6506007)(316002)(54906003)(2906002)(4326008)(36756003)(8676002)(66556008)(5660300002)(6916009)(66946007)(66476007)(8936002)(86362001)(107886003)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GEB+E51U1ldcfE0wagdfwGgDsryLHNADCSZ8r3ggnfO7ObhpNhAekb6TQQBm?=
 =?us-ascii?Q?DXVlNut3/ay94oYth3bPk+EM2PX/y00UK2vYEA6X6dJ7KzjqQuYsv2K5fGNA?=
 =?us-ascii?Q?r7QJytFnmyz/C1fMJSpCL8vzPx2Vls2Lkfmo/VUyCUfo7C10LOJT2jR3hW/I?=
 =?us-ascii?Q?FyR6LFZwKPACzUGsJ+W6w4y3uJhuayYq1W6kRnF2rbSDU9TwdU4tFzHLPg/L?=
 =?us-ascii?Q?HeMpNG4iElVGLfEnhLMD7aMcUms4xnh0XuLak2DwMCxwXNFMCk4w9TLr3djX?=
 =?us-ascii?Q?gE6YytZqOtXJeXUFR7INUP9DZJexhWg2KNaly0neoXMIeEba+/ffX39hJ80x?=
 =?us-ascii?Q?+SSE89cUMiMb5s4xlswTPXGXZrfvgA0rYqRErIll6C8WPf2Gr7HFbAd2WaaH?=
 =?us-ascii?Q?Wmz2rQpwCss4fokX0q3sOJSjGCWqCeGBPKwfSskIhLMNFsDU7hZxpEc5GU7E?=
 =?us-ascii?Q?nyQDiNJJfE6ij1T/eXvP5aWOHSJmIcpuqI9TTTPe6nKev8AuX47f/e+3bOC0?=
 =?us-ascii?Q?o4650+yUYIVGB1kxWlJizw9cY5TsQKCMdq4oW0sDQ0Q6d7AlO3h6PJRoIHmz?=
 =?us-ascii?Q?+NcJJ/O11VgZk9/fzoKyXxkhfn8GCY/byBVK3eTO3kw+Fk553/gF3WBg3TJn?=
 =?us-ascii?Q?kam9p21S7RD16iaxnmnHw5PQBeS6FHK/80uV7xftyt006o5SxNG5ze8bH6lY?=
 =?us-ascii?Q?1mM/UKkUOFpKV9QST2FAjXiObgB0E4jvfyb7cjX7OVb+wh952V9Ibt/Bqqgb?=
 =?us-ascii?Q?p3FuvzdHqMjw7Aaj+DBBUZ2XI8xv1UC40PxmqY6objRdoad8P31J9WaxOQHU?=
 =?us-ascii?Q?fFF6axGXpEDG4Y5USV65/hZM/uZcx8xZz0AEheEAuq619C77B3CUz5jffaoR?=
 =?us-ascii?Q?67MvCHI1ZohyXF088nHa5zTr6/sTQTsmLal2qA6jHwA88Q616a6TLawLEzKu?=
 =?us-ascii?Q?ms7T7jVD2hP0c7NJjkAi4kWMJwwU5E3+z3mCooExEqns2g09eNN4xzIDaRlO?=
 =?us-ascii?Q?2UxMjt6NbNgjQJmfhB4ujbGRyqbZxCX1H7hAzQQcomZII6grsRAJtag+F0PK?=
 =?us-ascii?Q?vTHuxqKuU/jmQ+OUYaPQ5YTkfp2Qr+L0DUTzVy/iqaY2V0+dY+BxiWbGZRMi?=
 =?us-ascii?Q?2vMSVK1AZFzHbm7adI0FTk+neNvs4WnMxc7dQ1Se5DScXIBtbF0qdjyQdudP?=
 =?us-ascii?Q?AlrvfoycY+bjSWWE0EZsj9+eMVYmPRsjnFn1DyCMwtrj1+BQ/GMQEZpBZl3Q?=
 =?us-ascii?Q?zsjzhl0zvMyT4GWbdS+Ci43D9LuFvPQ2LSGWtKOaOpRqOv+qFWQaS0lYpKtT?=
 =?us-ascii?Q?FG1DZOfJUrwpqLFH1oA7RRdi+Xa0FwejPGlb5+5WxymXjHDImbSm/pOWa/u0?=
 =?us-ascii?Q?+P/fnV7ftCTnNo7S0HRbWkQlPyZ7oc7l+6Hj24pI3ceEnvKToHR40kdwAKh+?=
 =?us-ascii?Q?RCtzOHFFsHm+Xh2wgNbw1zjqAP87AHfu8jPvUJQSQCrlj1QGHWw+fWpt4a/4?=
 =?us-ascii?Q?RcyD6dXVIAjsBvZcuSDA3oWoBef1tJrdmWmLqBn/oW4JeeDK48mwkgk/rRpv?=
 =?us-ascii?Q?LGPH8fxup1zE2ZgWQEome0Iz1TukEvmj+a7fpqHENgAoaUy/rS3jBk0W3M28?=
 =?us-ascii?Q?/Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ac28c8ec-250e-49e2-fe6f-08dc1eadd74b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2024 20:31:57.2048 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AkzsHch7SmcvW32fDDLJ8hdCT9RqY8FIMrDQs3COTbkm9PAcaw9DoN2MkVGcw+dNUw1UkK2ViG4Dr2V3SGGa6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8407
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Let's keep this extra protection for Long Running VMs since
LR job's hw fence is signal immediately after scheduling the job to the
hardware. Once the hw fence is signalled, the job can be
typically be freed. So, the exec/sched protection might not
be enough there.

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index d096a8c00bd4..9ad154a01ad7 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1330,6 +1330,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 		INIT_WORK(&vm->preempt.rebind_work, preempt_rebind_work_func);
 		vm->flags |= XE_VM_FLAG_LR_MODE;
 		vm->batch_invalidate_tlb = false;
+		xe_pm_runtime_get(xe);
 	}
 
 	/* Fill pt_root after allocating scratch tables */
@@ -1496,6 +1497,8 @@ void xe_vm_close_and_put(struct xe_vm *vm)
 	for_each_tile(tile, xe, id)
 		xe_range_fence_tree_fini(&vm->rftree[id]);
 
+	if (vm->flags & XE_VM_FLAG_LR_MODE)
+		xe_pm_runtime_put(xe);
 	xe_vm_put(vm);
 }
 
-- 
2.43.0

