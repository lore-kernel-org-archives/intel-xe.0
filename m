Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F973C54E58
	for <intel-xe@archiver.kernel.org>; Mon, 11 Mar 2024 19:30:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E636112C3A;
	Mon, 11 Mar 2024 19:30:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KbQ69UcZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF925112C3A
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Mar 2024 19:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710185420; x=1741721420;
 h=resent-from:resent-date:resent-message-id:resent-to:from:
 to:cc:subject:date:message-id:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=OSVOIspRwAAoSby4X+f5hRmHMoLfirvyM5GkOm5ThMQ=;
 b=KbQ69UcZj8pVbC7aByK8gmFknXifS8nAFbae8hMorM8P/pz5xETJmvyh
 /cb+7zmvuADL6rAv5rAb5pbfSoRtMH1AFeaTR9fR2TAiGsft8CAY31Noi
 xKfOSAUpgDWl5mgM5hDCA2IZmMv5IUYbzlFP66Xe+xSf2LVyGTOn/61+e
 9KlJLkqUx/xkbfnyx38Dhw7w3H47RE/nw+uakOC3scX70WO5rjB48FC36
 9a6gfuGZ0dQmXHeVCc7/pn1nlMyYSASf7DIEKQ4zRnOMDwUbKvLDKKG2i
 /omXpnwC/mTHXvvpdujtQ5KZhlLC5hWT+orwYmVq4AUNcVRBV/2SQ8LYt Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="8628093"
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; 
   d="scan'208";a="8628093"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2024 12:30:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; d="scan'208";a="48717376"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Mar 2024 12:30:19 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Mar 2024 12:30:18 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Mar 2024 12:30:18 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 11 Mar 2024 12:30:18 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 11 Mar 2024 12:30:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bRzqOgUERB44DcsvH3BxEYyh8LJ0JYpbPYfHHT0iSNHGQHs7Kt/Kawt+ffQthR4ICiVQX4jwUxO9OlocN+Xpcj6mSS69SCd1OynGp/KVbenH3dJHk4KpyD6d0ZuMqlMAG3RopQfuwSgnh4kAPBIl0aGPXNzflMyznrUIC/20Z6KqU/dmJM+dfJNMIk0u3eb/fSbWt1wi9FDL8zRcROEJu/kQRceYQ6YbKGWn9kbU1RktnNDF309AupXObhFv+iQfXc1Q/2Mk/qWBdqC1AO8ErXO6tU0mlcNzZZkgyHakiCzShOjfd5fF2PwJVmXmPmsFZWAsug4H+CCJ7kKhaMwVuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9cyTbc4DT+quwAetrqV9hhoVtzQzEtCemiMNpB3dppc=;
 b=RMt9vf0Eh07tjaw7sdOa+oiCWTB1eb4AVYjNogx2N4uksQFaJcczaFTNVMpYzCjhzllFxpDcZStB9kkHAG0zaLoFx+MlIsiTerdMwdjj8zldaKxi9l32uKpJ9iegZkpISfb26THR/yDyUXNU30OtVeF3eNGNsU8eIl2xTG+9vu5A3vYtYkOiXruXl+7AkraaHv2Ucb+OB/kpNW97XrPkUO7QOTiJGBVO7R8l6O2F+RyS4C8tHWFj8aNS1JjhINXncamwPVqKY81UGl9kc8EHvsDp/keTkzcFkQ8LMFD16O8LQHb0+ug2ZD9GnPQ8kXuvxYTxJwaAmk2ecF+X1/SkTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH0PR11MB4822.namprd11.prod.outlook.com (2603:10b6:510:39::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.14; Mon, 11 Mar
 2024 19:30:15 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189%4]) with mapi id 15.20.7386.016; Mon, 11 Mar 2024
 19:30:15 +0000
Resent-From: Rodrigo Vivi <rodrigo.vivi@intel.com>
Resent-Date: Mon, 11 Mar 2024 15:30:11 -0400
Resent-Message-ID: <Ze9bw5ILWIrjnOk3@intel.com>
Resent-To: <intel-xe@lists.freedesktop.org>
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-gfx@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Subject: [PATCH 11/11] drm/xe: Kill xe_device_mem_access_{get*,put}
Date: Mon, 11 Mar 2024 15:23:03 -0400
Message-ID: <20240311192303.33961-11-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240311192303.33961-1-rodrigo.vivi@intel.com>
References: <20240311192303.33961-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0059.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::34) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA1PR11MB8253:EE_|MN0PR11MB6059:EE_|PH0PR11MB4822:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e2d7b6a-5dcb-4806-1a98-08dc4201ad75
X-Microsoft-Antispam: BCL:0;
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c3a0f7d-8cfd-48ec-7e09-08dc4200c2c4
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2024 19:23:41.7123 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9d484MVeZeIzNfjc5HO+Ay9akZC6CIQHdQCsQsrM6768bJxlhxjS4h5zpe71X+kOSc+nSaQf4M6o3t2ijINd/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8253
X-MS-Exchange-Transport-EndToEndLatency: 00:00:01.6112306
X-MS-Exchange-Processed-By-BccFoldering: 15.20.7386.010
X-Microsoft-Antispam-Mailbox-Delivery: rwl:1; ucf:0; jmr:0; auth:0; dest:I;
 ENG:(910001)(944506478)(944626604)(920097)(815096)(255002)(410001)(930097)(140003);
X-Microsoft-Antispam-Message-Info: ZTGwvvIbLQkxvVDXNKM2rhJglhBp9gpNgzpvbZFVlpQ54LU7gh+61wfep3sAXJhO+Bh9LEQ8nC3h4/Wst4wCS2yFndwmS1nRwlE9F6Kd9p2M8x/AXprhVh4xdf4reR6H0rtmwvVoHB1TULFm1ogQyAe2fZXu1RAeSA9Hage56cx6G0q+aUSUwpdfoLDJ8pPpvhuZ3AJP0Z3b37tr6pwzWHBG15v5IdFlLf9zbpjHUkOhrAexNc2RDTWhQjabnt+2Tayp4Hk4ed360sDariRhlBSwgHk6xmYHjiudFClqSeSPTtx4ijylY0wOC61uWh54SbNWiUmpLnSaQouR0y/wZl4gXw6Y0b50IE/SCuWCa7X/6Lu+2+LcBEL1iriOHyCD1QwT6vrufgxxNBxhU1X5Gx0DKkaicIDlre8PlU6INKd1t7sNKlSO6EWhIeZh3uP+d8hKdvMwNsWDO7SlLtAkOrwQYB5MUd57TjPkQob753zebSdt4MzQ3wVikCqieMhOzG3cMt1tkDHRszyMP5bzt2dL8nOcah1Akyf4/+/NEYNztAfZolhzSpKw1c3cE6uanyfN5bbURAN89CFCJl8FgTKBdxpmkbYtvlpnhlwFFVF7yIA2Qhcx7CM7V9pK7S9HdmY7qLXbMllvNMG0WoQGFddqHFoCaFT9WMGV/dfYpoY=
X-TUID: 64ZgZXkI/bDc
X-ClientProxiedBy: SJ0PR03CA0264.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::29) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 3c3a0f7d-8cfd-48ec-7e09-08dc4200c2c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WgVGe9JhBtZ5HcnS8V9vYieF0w5nRQ37kRvALkBJ8FhttZsOFUQ7s1ocIwkd?=
 =?us-ascii?Q?l9/PA9hAXWWhIbgxz6nUbktxNr7Uv/hTMg/yHigL/mODqHCrgExBr5G41CC1?=
 =?us-ascii?Q?CcAJFJ9O1SwwP8KDzGrWHepVYIojY9Duv0PbqOdvJvMEhAVT65fVe60p9NrY?=
 =?us-ascii?Q?fycommmMdFZru5h0WI0Y8EtAamyYvsZ4AbXzrAw3m5P0SvUoTlkXOAHOKPLI?=
 =?us-ascii?Q?Ss9eWFPVlY88Y7aU3Ma93tt6zjEvX+bD21BkBYZCgAc6xkGj0f19OLzmBipf?=
 =?us-ascii?Q?Qo92WguELB2Ln2HKn6r747uBeLbbvl/+TR17IAbfiubtKsRknQGJOPYfi6l3?=
 =?us-ascii?Q?cO6nYXVe4xEM/pFZtvMTeFOpg725NVvDFHztuaUlkDRY9Mb14Dn5lJ44WJX/?=
 =?us-ascii?Q?XBrjFkF+c7OO4W4qOWV9wjbIAuJXX6LN0Meeeu20dXR62T9H7Cs1xJrbBUeK?=
 =?us-ascii?Q?QrbKv7H1SBMtJwLKf1XU+7f6UKi41ie9oZStwyXC7g/ze1Zr7Eavp7rmDd1m?=
 =?us-ascii?Q?8aeangBkHpvSCy8rG7EJlpYtlLjLif/9Qol3y55dmPTpoh4bQ8dqOAtTHJKj?=
 =?us-ascii?Q?XULluAuB3DpsTNpjHy26OxaMijyA1cdme0PNYEz/a0eMqqVaBCqGd8ADzJPk?=
 =?us-ascii?Q?4XtnOpVSJhEIkLCe6Ts38BLhLQjEHEBjnwUaT+F28OwjEqze25Oh6oLKbIrv?=
 =?us-ascii?Q?aeRO4YkuFAw7ffmtwFfcXeiHfCzwPE5TnKDfvE3ygqsnkAaxTahWa8xbdf8d?=
 =?us-ascii?Q?j8q4OBgrXALNX9M3K8TQSqpOYyaOrGF8KY3l74ZabX/6af8vVc506vHvHAh4?=
 =?us-ascii?Q?KQSb4q1vqleSz9yQba6jPnU+KbpdFEtZH2XyTKPe3AmAAT6ldfAT6+lOo4HX?=
 =?us-ascii?Q?SPrWsEL9NRMRByiCP5ZD3sJa0pHO5xFXw6kFQcxfTzEwAECRqzzdHAqfxbc2?=
 =?us-ascii?Q?joCweyR3ko3E+iwSnC2A3I7W+C1ZEbBm+w9Z5sMt7VTM0GSWKNdCoSaQNm2e?=
 =?us-ascii?Q?sD+jWbUHr8siPVOApUnbBIWtdf7bqTR9u/G9zpdqFVqbdwsUc8/7GS1NNGFK?=
 =?us-ascii?Q?RWkULbEizuzspTC9qNiAl8DqdRK2XZ4rVTOSc0TElO5Zr7hlZCBkbdnDdZfm?=
 =?us-ascii?Q?r+CBdfjqmf2pIjjCkW0BAg17VFXb2P6SRUjTy955/7THV6w5iBZ9b/D88nxt?=
 =?us-ascii?Q?j6DMiVDlOcyqKiVFyM4NbjxtEYdtDFLueh51cYOJEVJxho+XH5aJ1SkieIoX?=
 =?us-ascii?Q?ZiQstIM8X4TudcNlSKRwwXyOsYvEK/BGMjCaf6f7R804aTEKjdeVxkC2rMlA?=
 =?us-ascii?Q?2pjICoFUQ0TH/LFErKsauCp0mzCAvf2ZVSBG0E5y/TFrum4AM07N2W0NfWQl?=
 =?us-ascii?Q?J1nnO+0OFCQ55gqYK1nQb7u9VqAdUxUxawrBOEUlfFXLr501IicxMaC6xeDX?=
 =?us-ascii?Q?EaN5jvR5BunjF6/9gBPCs5wqcwBVD8XTgi6a5hLt6hsx0dHKrlpq5DgECWMW?=
 =?us-ascii?Q?TXEDC+2xhI/7fXW7Zy+JlyLxCsx6dqyMNN3lSu0MLNw+4P6ZhqJDPW9f1Ay9?=
 =?us-ascii?Q?02FpET5qWGCqX69T/n0WsyDDOG7+9cfQdwk7xFrfqKYhXbMJWbxc75do+1nH?=
 =?us-ascii?Q?Yw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e2d7b6a-5dcb-4806-1a98-08dc4201ad75
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2024 19:30:15.5345 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JsBqfxtPIAVGnMfCmWYh0CTCDhc7tPJH007xi7GLSamzrsHIP9CHUkZl+LS6G/FBNF5E78GhhmxoURXcSOAPwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4822
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

Let's simply convert all the current callers towards direct
xe_pm_runtime access and remove this extra layer of indirection.

v2: Convert all the current callers instead of a big refactor
at once.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c |  7 ++---
 drivers/gpu/drm/xe/xe_bo.c             |  8 +++---
 drivers/gpu/drm/xe/xe_device.c         | 36 --------------------------
 drivers/gpu/drm/xe/xe_device.h         |  3 ---
 drivers/gpu/drm/xe/xe_device_types.h   |  3 ---
 drivers/gpu/drm/xe/xe_exec_queue.c     |  6 ++---
 drivers/gpu/drm/xe/xe_ggtt.c           |  9 ++++---
 drivers/gpu/drm/xe/xe_sched_job.c      |  5 ++--
 drivers/gpu/drm/xe/xe_vm.c             |  6 ++---
 9 files changed, 22 insertions(+), 61 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index 722c84a56607..403ed2d42f6b 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -10,6 +10,7 @@
 #include "intel_fb_pin.h"
 #include "xe_ggtt.h"
 #include "xe_gt.h"
+#include "xe_pm.h"
 
 #include <drm/ttm/ttm_bo.h>
 
@@ -190,7 +191,7 @@ static int __xe_pin_fb_vma_ggtt(struct intel_framebuffer *fb,
 	/* TODO: Consider sharing framebuffer mapping?
 	 * embed i915_vma inside intel_framebuffer
 	 */
-	xe_device_mem_access_get(tile_to_xe(ggtt->tile));
+	xe_pm_runtime_get_noresume(tile_to_xe(ggtt->tile));
 	ret = mutex_lock_interruptible(&ggtt->lock);
 	if (ret)
 		goto out;
@@ -242,7 +243,7 @@ static int __xe_pin_fb_vma_ggtt(struct intel_framebuffer *fb,
 out_unlock:
 	mutex_unlock(&ggtt->lock);
 out:
-	xe_device_mem_access_put(tile_to_xe(ggtt->tile));
+	xe_pm_runtime_put(tile_to_xe(ggtt->tile));
 	return ret;
 }
 
@@ -381,4 +382,4 @@ struct i915_address_space *intel_dpt_create(struct intel_framebuffer *fb)
 void intel_dpt_destroy(struct i915_address_space *vm)
 {
 	return;
-}
\ No newline at end of file
+}
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index bc0cc5edc533..531c67083e2c 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -738,7 +738,7 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 
 	xe_assert(xe, migrate);
 	trace_xe_bo_move(bo, new_mem->mem_type, old_mem_type, move_lacks_source);
-	xe_device_mem_access_get(xe);
+	xe_pm_runtime_get_noresume(xe);
 
 	if (xe_bo_is_pinned(bo) && !xe_bo_is_user(bo)) {
 		/*
@@ -762,7 +762,7 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 
 				if (XE_WARN_ON(new_mem->start == XE_BO_INVALID_OFFSET)) {
 					ret = -EINVAL;
-					xe_device_mem_access_put(xe);
+					xe_pm_runtime_put(xe);
 					goto out;
 				}
 
@@ -780,7 +780,7 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 						new_mem, handle_system_ccs);
 		if (IS_ERR(fence)) {
 			ret = PTR_ERR(fence);
-			xe_device_mem_access_put(xe);
+			xe_pm_runtime_put(xe);
 			goto out;
 		}
 		if (!move_lacks_source) {
@@ -805,7 +805,7 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 		dma_fence_put(fence);
 	}
 
-	xe_device_mem_access_put(xe);
+	xe_pm_runtime_put(xe);
 
 out:
 	return ret;
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 58815e9bf242..e2e6b6dc8534 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -655,42 +655,6 @@ void xe_device_assert_mem_access(struct xe_device *xe)
 	XE_WARN_ON(xe_pm_runtime_suspended(xe));
 }
 
-void xe_device_mem_access_get(struct xe_device *xe)
-{
-	int ref;
-
-	/*
-	 * This looks racy, but should be fine since the pm_callback_task only
-	 * transitions from NULL -> current (and back to NULL again), during the
-	 * runtime_resume() or runtime_suspend() callbacks, for which there can
-	 * only be a single one running for our device. We only need to prevent
-	 * recursively calling the runtime_get or runtime_put from those
-	 * callbacks, as well as preventing triggering any access_ongoing
-	 * asserts.
-	 */
-	if (xe_pm_read_callback_task(xe) == current)
-		return;
-
-	xe_pm_runtime_get_noresume(xe);
-	ref = atomic_inc_return(&xe->mem_access.ref);
-
-	xe_assert(xe, ref != S32_MAX);
-
-}
-
-void xe_device_mem_access_put(struct xe_device *xe)
-{
-	int ref;
-
-	if (xe_pm_read_callback_task(xe) == current)
-		return;
-
-	ref = atomic_dec_return(&xe->mem_access.ref);
-	xe_pm_runtime_put(xe);
-
-	xe_assert(xe, ref >= 0);
-}
-
 void xe_device_snapshot_print(struct xe_device *xe, struct drm_printer *p)
 {
 	struct xe_gt *gt;
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index b45592b0bf19..355bddfc8274 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -133,9 +133,6 @@ static inline struct xe_force_wake *gt_to_fw(struct xe_gt *gt)
 	return &gt->mmio.fw;
 }
 
-void xe_device_mem_access_get(struct xe_device *xe);
-void xe_device_mem_access_put(struct xe_device *xe);
-
 void xe_device_assert_mem_access(struct xe_device *xe);
 
 static inline bool xe_device_in_fault_mode(struct xe_device *xe)
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 9785eef2e5a4..4bec8b90a37c 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -377,9 +377,6 @@ struct xe_device {
 	 * triggering additional actions when they occur.
 	 */
 	struct {
-		/** @mem_access.ref: ref count of memory accesses */
-		atomic_t ref;
-
 		/**
 		 * @mem_access.vram_userfault: Encapsulate vram_userfault
 		 * related stuff
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index f69a9c99329c..42ddf857e9e8 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -217,7 +217,7 @@ void xe_exec_queue_fini(struct xe_exec_queue *q)
 	for (i = 0; i < q->width; ++i)
 		xe_lrc_finish(q->lrc + i);
 	if (!(q->flags & EXEC_QUEUE_FLAG_PERMANENT) && (q->flags & EXEC_QUEUE_FLAG_VM || !q->vm))
-		xe_device_mem_access_put(gt_to_xe(q->gt));
+		xe_pm_runtime_put(gt_to_xe(q->gt));
 	__xe_exec_queue_free(q);
 }
 
@@ -589,7 +589,7 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 				return -EINVAL;
 
 			/* The migration vm doesn't hold rpm ref */
-			xe_device_mem_access_get(xe);
+			xe_pm_runtime_get_noresume(xe);
 
 			flags = EXEC_QUEUE_FLAG_VM | (id ? EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD : 0);
 
@@ -598,7 +598,7 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 						   args->width, hwe, flags,
 						   args->extensions);
 
-			xe_device_mem_access_put(xe); /* now held by engine */
+			xe_pm_runtime_put(xe); /* now held by engine */
 
 			xe_vm_put(migrate_vm);
 			if (IS_ERR(new)) {
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 0f96b7db6dcc..d73056aa2362 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -20,6 +20,7 @@
 #include "xe_gt_printk.h"
 #include "xe_gt_tlb_invalidation.h"
 #include "xe_map.h"
+#include "xe_pm.h"
 #include "xe_sriov.h"
 #include "xe_wopcm.h"
 
@@ -408,14 +409,14 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
 	if (err)
 		return err;
 
-	xe_device_mem_access_get(tile_to_xe(ggtt->tile));
+	xe_pm_runtime_get_noresume(tile_to_xe(ggtt->tile));
 	mutex_lock(&ggtt->lock);
 	err = drm_mm_insert_node_in_range(&ggtt->mm, &bo->ggtt_node, bo->size,
 					  alignment, 0, start, end, 0);
 	if (!err)
 		xe_ggtt_map_bo(ggtt, bo);
 	mutex_unlock(&ggtt->lock);
-	xe_device_mem_access_put(tile_to_xe(ggtt->tile));
+	xe_pm_runtime_put(tile_to_xe(ggtt->tile));
 
 	return err;
 }
@@ -433,7 +434,7 @@ int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
 
 void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node)
 {
-	xe_device_mem_access_get(tile_to_xe(ggtt->tile));
+	xe_pm_runtime_get_noresume(tile_to_xe(ggtt->tile));
 	mutex_lock(&ggtt->lock);
 
 	xe_ggtt_clear(ggtt, node->start, node->size);
@@ -443,7 +444,7 @@ void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node)
 	xe_ggtt_invalidate(ggtt);
 
 	mutex_unlock(&ggtt->lock);
-	xe_device_mem_access_put(tile_to_xe(ggtt->tile));
+	xe_pm_runtime_put(tile_to_xe(ggtt->tile));
 }
 
 void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
index 8151ddafb940..8ba35b1698ed 100644
--- a/drivers/gpu/drm/xe/xe_sched_job.c
+++ b/drivers/gpu/drm/xe/xe_sched_job.c
@@ -15,6 +15,7 @@
 #include "xe_hw_fence.h"
 #include "xe_lrc.h"
 #include "xe_macros.h"
+#include "xe_pm.h"
 #include "xe_trace.h"
 #include "xe_vm.h"
 
@@ -157,7 +158,7 @@ struct xe_sched_job *xe_sched_job_create(struct xe_exec_queue *q,
 
 	/* All other jobs require a VM to be open which has a ref */
 	if (unlikely(q->flags & EXEC_QUEUE_FLAG_KERNEL))
-		xe_device_mem_access_get(job_to_xe(job));
+		xe_pm_runtime_get_noresume(job_to_xe(job));
 	xe_device_assert_mem_access(job_to_xe(job));
 
 	trace_xe_sched_job_create(job);
@@ -190,7 +191,7 @@ void xe_sched_job_destroy(struct kref *ref)
 		container_of(ref, struct xe_sched_job, refcount);
 
 	if (unlikely(job->q->flags & EXEC_QUEUE_FLAG_KERNEL))
-		xe_device_mem_access_put(job_to_xe(job));
+		xe_pm_runtime_put(job_to_xe(job));
 	xe_exec_queue_put(job->q);
 	dma_fence_put(job->fence);
 	drm_sched_job_cleanup(&job->drm);
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 643b3701a738..84360f4a1b60 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1324,7 +1324,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 	vm->pt_ops = &xelp_pt_ops;
 
 	if (!(flags & XE_VM_FLAG_MIGRATION))
-		xe_device_mem_access_get(xe);
+		xe_pm_runtime_get_noresume(xe);
 
 	vm_resv_obj = drm_gpuvm_resv_object_alloc(&xe->drm);
 	if (!vm_resv_obj) {
@@ -1435,7 +1435,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 		xe_range_fence_tree_fini(&vm->rftree[id]);
 	kfree(vm);
 	if (!(flags & XE_VM_FLAG_MIGRATION))
-		xe_device_mem_access_put(xe);
+		xe_pm_runtime_put(xe);
 	return ERR_PTR(err);
 }
 
@@ -1558,7 +1558,7 @@ static void vm_destroy_work_func(struct work_struct *w)
 	mutex_destroy(&vm->snap_mutex);
 
 	if (!(vm->flags & XE_VM_FLAG_MIGRATION)) {
-		xe_device_mem_access_put(xe);
+		xe_pm_runtime_put(xe);
 
 		if (xe->info.has_asid && vm->usm.asid) {
 			mutex_lock(&xe->usm.lock);
-- 
2.44.0

