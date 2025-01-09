Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 383C2E7719A
	for <intel-xe@archiver.kernel.org>; Thu,  9 Jan 2025 22:58:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3D7B10E4A3;
	Thu,  9 Jan 2025 22:58:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MoLpQHdh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84E0A10E4A1
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Jan 2025 22:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736463482; x=1767999482;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=iVaffRIXNlRVIpceF+PCwjZuGL8OB75209/KVEs6r4o=;
 b=MoLpQHdhFSoA97tZKNW2/K6jVF45vwBySkliP+G7RIcm5umUJM5Rys96
 hzeT/VX1cyCi2mIHsA0GmoPoG4rZplzqnDhDuQ1PxRSDU8aQz20sECDIH
 GSuUJNYYfjGe2D+eF5ysivNkbUqlM0C+92Zuf8y9Er4p3s1rB2WXDpBmG
 1wcxl17ElDF+RC6l4Xmk3wHaNVUfZ5Vgtt9guu7HeMua1EEdbgY1KR5es
 LwvdHofThgalp5mivEbHuOl0yx+YLkVbLKOmNkw0xsB7GtS6ya8KBaZ5P
 psijP/QDod6RPnWeztqxQzTpbEWSRw5hhh8I4WijXDynz7OB457gO0TZk A==;
X-CSE-ConnectionGUID: bdNVicXfRIW1Du4WCQtWUw==
X-CSE-MsgGUID: q7Fs3FDjS6+ChelgPmVeQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="47241205"
X-IronPort-AV: E=Sophos;i="6.12,302,1728975600"; d="scan'208";a="47241205"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2025 14:58:02 -0800
X-CSE-ConnectionGUID: GbKrb8XCSC2Wvkm9FLWBig==
X-CSE-MsgGUID: jyG/xns1SlWOP8KG+En5uA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,302,1728975600"; d="scan'208";a="108543147"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Jan 2025 14:58:02 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 9 Jan 2025 14:58:01 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 9 Jan 2025 14:58:01 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 9 Jan 2025 14:58:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YUp5uV6GQl6ngPcYfARSeTmSE7B8rB8LS4PGcjWjSkVX3WgKSB4SsxDjG/VNAY2msntlUUa6LjmyyRD1CHCY10b5E3i86kl3Qz0+lJMSrkRk2O1sK61VhNmqzZivPvR69DyXTJVF4wbTYKNDGDauGbt4d8h3UtItzJtMRsmN46NBEROthtc2Be7MSaH9MS+F8Z5C+Ftoz1ZGxVfItZ0OZ82xukiS8X9NtyOaO7p52z9IbNnrTcJUyyRJUKURRfjr6FqP9dDMX5qZp8iuB5SM+FtgBeto1N66cJcZQsH7dUytJWFLi6sWvZUpcQ1nHpodt6plh+P1egc24lHDZNNxwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6vOHlAc6Gc6u+3zFRiCdnz3WK+b+TvALerFCSQjS3KQ=;
 b=KH0D+PtZcP6X+NC6VnNZB31bA54xm+cOmfGMl9ByjrS0lirF7yDWUYED8vUFZNNOedKGJ1xhauZhywLkpF8S5XYWGXlIPY7c3wbMx6AUg/2r4tHkVGblN2p4z8uFEbLyQOcrFrdsAk/CgPbryBzNDf9HOSM4Lyk1LvhHnjnSU1L8UGqU6CUoFFI+/i1wknS/xnq0GJGA7s/iOIMUfTeEBoEFH2jUs7nRgp9egzfvIHZOSQ9Viq/1AgpJJsxNxeN1oSOLEIhXRZ1D40SKmfgd7+c0lNoMlfWRhv2JbfvNfNl5yvUGlvI8RyRnR1V0dJuSeAPOZ6NzBRnw31NXIb6i6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB8290.namprd11.prod.outlook.com (2603:10b6:303:20f::21)
 by DS0PR11MB7506.namprd11.prod.outlook.com (2603:10b6:8:151::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.10; Thu, 9 Jan
 2025 22:57:59 +0000
Received: from MW4PR11MB8290.namprd11.prod.outlook.com
 ([fe80::4a98:509:3b05:29b4]) by MW4PR11MB8290.namprd11.prod.outlook.com
 ([fe80::4a98:509:3b05:29b4%5]) with mapi id 15.20.8335.011; Thu, 9 Jan 2025
 22:57:59 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Vinay Belgaumkar
 <vinay.belgaumkar@intel.com>
Subject: [PATCH 1/2] drm/i915/guc/slpc: Allow GuC SLPC default strategies on
 MTL+
Date: Thu, 9 Jan 2025 17:57:54 -0500
Message-ID: <20250109225755.992867-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.47.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR03CA0291.namprd03.prod.outlook.com
 (2603:10b6:303:b5::26) To MW4PR11MB8290.namprd11.prod.outlook.com
 (2603:10b6:303:20f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB8290:EE_|DS0PR11MB7506:EE_
X-MS-Office365-Filtering-Correlation-Id: 538a9e89-d635-4d28-ec1d-08dd31010fe3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?GRu+9B+gMzHzoWk1/gW8l7S+arjEpSXawnlqJ2QjKw/ID6oSOTDW6wNRI78Y?=
 =?us-ascii?Q?TxIUNPObo95Gu3Sgn57LNklO33GGpLEwNB95F+71H6A+lh6jI7Pb2m+hGI6e?=
 =?us-ascii?Q?a25BkD/iI7HPie6sPG0xgtLikCLR3LzD/P/MRb8EBcVCEjkwSuImgcZyO2q/?=
 =?us-ascii?Q?l9znOXoX5kF70nDgyah+3zQXDzunOfQ9Bu2/QzCjmcwv9OtIwxSA2+IKnI/q?=
 =?us-ascii?Q?JE21+7vox/A0uNTHY3iatKhxDZuysUynZ/dC1ykZivblsgUex0yIzxrmO3LN?=
 =?us-ascii?Q?YciqoUgyAfNlzxhn2a9vTC+hrSJKhGj1Jzs/lvx01rEq+X/uPmfdKyp63zOa?=
 =?us-ascii?Q?kSbh7wqjSNPv76C+xa/k10K4sAvSjk8nDVqfVDYyBMW3Ovq49fQxhL6A/INz?=
 =?us-ascii?Q?xnfPhJvVuMqqDzWUolfWuGl0ty0Ztw67szhi5FvL7fn1fuef6lGe1hkL9Yjx?=
 =?us-ascii?Q?F5fldTYODBCI5EGOV3sIbnC7CtF7D8kdxA5qfs71PsoKjcIJ/h5Dj0X2PNxJ?=
 =?us-ascii?Q?a3oAaIeLZ+cY5aT5qzpvB6a6ocUSFQgyiM4xN/swi5osj29K5pAYprC1bbGV?=
 =?us-ascii?Q?y1ygN3vHqCd3dmKwmbPEGgkanxqNQeJPbSQ/3Etd9qg2opyVhsQw/MObGBud?=
 =?us-ascii?Q?cnz2BSGyt6xDNePBfGDxyey7N3NdYFkvyzU1X3HzryrQ45UDN2Ia6HisWdLy?=
 =?us-ascii?Q?WDwLWlnE7kHxEcIW8zf1oVFUBFD8/cOuUQlUyYpRE6BHG/jmZQgQgRj81mjs?=
 =?us-ascii?Q?ClIZxBqL387UiuSJWEZ7jTpnh+Z6LlY9LGjEBzVWrTVJNLzcSTZ2Ihven2l6?=
 =?us-ascii?Q?ArW9NWocY1tO27Sk54k4TpA15xf0Xn8xNDWClSmmZQbZ+l08E+aMtFObYk1b?=
 =?us-ascii?Q?BTlvsh/ZoIDOcP0QS+1v73Bsw2bx+AyFNEHt00spr/U9vqSNq0vM2oNcJQnU?=
 =?us-ascii?Q?QnzWBx+4lX+bOX+wavZfkfg5be2kbgpTPjc5HX0AFsdEr/T//XtXBmpi8Kd4?=
 =?us-ascii?Q?500JdW44JuIscuPutzVSGUBtGh2ll2OhIPhDxsTO1tZ5x3KS6uenMsE7tpRr?=
 =?us-ascii?Q?fHNlei26BvTAgsvnmGihz1u1gQV7DGhLhn7/JKM77ydlFZnIkt6Ad018GnND?=
 =?us-ascii?Q?nLs+k/mcBM+Em5PfVnHD/iG9VhMvroGNbCAzJlJ4zeRspuZhK3ZAygn7zopY?=
 =?us-ascii?Q?62fGj1I07D7I4DV+7omwKdepgFRXWrkd3aRlC7Yi4W4YAq/rW+w9IgESrVTE?=
 =?us-ascii?Q?HAK/49BpckXLLF+XbSJv8BaQ+aCZfl1xhEP8Wu3XBVvA1UQ1lbn7y/pcuuqA?=
 =?us-ascii?Q?r6bg/SzMAqmdjuIeVyZiKFZpNNdQdwmyIZrZ1Px2cQq6fDw9foR35XhpjAtH?=
 =?us-ascii?Q?BI7rk51KbPmLBenmhxCBVS3gfUce?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB8290.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XKUrGSdZUM1GW4cGw7X9IBFfXg58cTmM1NqOf+cRWco3a2xdIlW0JJewJLa3?=
 =?us-ascii?Q?WvXF03IU0viwYhy4sEGROWBxBO1MAluwykLwlKmgZWY5obOiTClnihlNZKFY?=
 =?us-ascii?Q?JaZA1QueT8oMf6GOJkiKs3QD9LV4AiakSKaE/fCL2a1zFCnUgi7SQOLFyNEg?=
 =?us-ascii?Q?zNhw6HKawUjEV4zgJKU7zU4xg+wFZI12dBlpZJirCwerTiDQpZ3ipEZXekdp?=
 =?us-ascii?Q?f4ztNIbdJmEwgqYrFG08je6wov3y2Y7vRH6ltESGU6Zips9VJw9Rs7WaByYx?=
 =?us-ascii?Q?ESKLZCtc1Wbsh1ru1wFYNvCXhqPY/w5TZGurmFo/c8Cb6r3JxNq21IwgpccK?=
 =?us-ascii?Q?asi0D5ecj2ICmdAu42U49pOsv1oslexZPsYG/ei64V947W+HzM1+rSnmmTcU?=
 =?us-ascii?Q?gi+jiAvawa96WCIK2A5sJOoa7wgn6H2UYTgv4nyP2434CZM/uZ47K86xfACX?=
 =?us-ascii?Q?pyim77sOkv9jGLu/YJw7IOBvo8wScIHXhbO8VjtvtVVNz+6JwLOVPidvArPA?=
 =?us-ascii?Q?PWcVbGMA13VwvqLkxy24Jckou6s8VnSGtHejVvQmIAPvfRC40zqDP5hPV5eU?=
 =?us-ascii?Q?vtkTz5i4qVenXRKwHlahQ6qTcNSd4YtitsssVsep+Ik3I9K59NvbEk0kZHUJ?=
 =?us-ascii?Q?Tkfzj1Yap24h1Uqh0IwpSlgf0BJZbD7QC59e/CDri3oUBycERvQBHEOZ26SX?=
 =?us-ascii?Q?MIhdBdgYmSlRlitgFo2rn66wiVa+uDN0EljnBwkjd8qDzjca7gaktcX1fBpN?=
 =?us-ascii?Q?lfhlapvIpevWVu2Qmu40DLyZsmQJdGZRrc/UT6TOaySpuxbnfEnp8VCanHnA?=
 =?us-ascii?Q?hk6iSVfJ+PEbXQ+77fUXL/bfrYMEuCrfH2ubxBf3Uw6EGriZqzotxbj08pDr?=
 =?us-ascii?Q?Oj2EFgJm4XheHgSUJ1EOvnLvsJQkjKKMnmjNxXc4nK6Pc2vDCXTUcJIYkim3?=
 =?us-ascii?Q?tX333+u9heQxFFPlYcxjUoKASsWqm5oCzuRmzOYQJfYlyIXg1PQJ3HTOTq4b?=
 =?us-ascii?Q?Kb15HnNCGIPPWQbyekENHfmlnhi1ydVvHNpvwu1/grysAvB8D/xAVBkMuatn?=
 =?us-ascii?Q?kwb2AotPdSGEbir8aOsg1A266Q9QJhOKdluM3NPfHKKvkkHsTRbgLlX0/AGF?=
 =?us-ascii?Q?L0i7UCnFJRp71brCQjdWDKiOR3fCHHy8SiEHV1N8JZ85UVeZUxc3EINhofJC?=
 =?us-ascii?Q?pU9LOvHvxSPYailnT5A1v8MVwWXaEFi+5URgbJ2zNZTc3c5L0fo5EwtoSaad?=
 =?us-ascii?Q?uhPpPq44qibrTlz9tmIsCPUqYAPSPR+0Qn5lHYMz/ezXI+/udDCJf8qE5Kmo?=
 =?us-ascii?Q?AUPynUlTueFRZ837M++RoPBOA/DozeliHSPzBnr9bNjyXFQMBVkqQWOUIio6?=
 =?us-ascii?Q?C5O5akos+ofZlYjNBbAWTuWso5d906A8bmZRQ94yWSUXoa/l9EG/LPRgf2Yg?=
 =?us-ascii?Q?6x20vxZZ1qoN0cRYlnD7TJgIISCyk36Gg3oNdmTMxKZq5+f4itObEXgjcg9k?=
 =?us-ascii?Q?XApR/ldq4ruagmUX0kBisP7VyL0K/8qCT6pM938FuoVXbQ0gcvKRUmTNNVxU?=
 =?us-ascii?Q?ba22MY3IjVhlzedbxieEmT1A9ucLAc/VYnvpd5moEY3lx7L3Qu0Qlw0Vu3rX?=
 =?us-ascii?Q?xQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 538a9e89-d635-4d28-ec1d-08dd31010fe3
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB8290.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2025 22:57:58.9648 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ibXfp4IYl0ehTa5PdUjfUUuHi+0s7qgOHQpwFY9EZ6AYkLvmXbn/asMXcTbvBY1ZDsmwAuewVnXJ3KwQ9UKz7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7506
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

The Balancer and DCC strategies were left off on a fear that
these strategies would conflict with the i915's waitboost.

However, on MTL and Beyond these strategies are only active in
certain conditions where the system is TDP limited.
So, they don't conflict, but help the
waitboost by guaranteeing a bit more of GT frequency.

Without these strategies we were likely leaving some performance
behind on some scenarios.

With this change in place, the enabling/disabling of DCC and Balancer
will now be chosen by GuC, on a platform/GT basis.

v2: - Fix typos and be clear on GuC decision on platform basis (Vinay)
    - Limit change to MTL and beyond, where GuC started to take
      TDP limit into consideration.

Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com> #v1
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
index 706fffca698b..f05c92e08d9b 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
@@ -367,11 +367,17 @@ static void slpc_shared_data_reset(struct slpc_shared_data *data)
 	slpc_mem_set_enabled(data, SLPC_PARAM_TASK_ENABLE_GTPERF,
 			     SLPC_PARAM_TASK_DISABLE_GTPERF);
 
-	slpc_mem_set_disabled(data, SLPC_PARAM_TASK_ENABLE_BALANCER,
-			      SLPC_PARAM_TASK_DISABLE_BALANCER);
+	/*
+	 * Don't allow balancer related algorithms on platforms before
+	 * Xe_LPG, where GuC started to restrict it to TDP limited scenarios.
+	 */
+	if (GRAPHICS_VER_FULL(gt->i915) < IP_VER(12, 70)) {
+		slpc_mem_set_disabled(data, SLPC_PARAM_TASK_ENABLE_BALANCER,
+				      SLPC_PARAM_TASK_DISABLE_BALANCER);
 
-	slpc_mem_set_disabled(data, SLPC_PARAM_TASK_ENABLE_DCC,
-			      SLPC_PARAM_TASK_DISABLE_DCC);
+		slpc_mem_set_disabled(data, SLPC_PARAM_TASK_ENABLE_DCC,
+				      SLPC_PARAM_TASK_DISABLE_DCC);
+	}
 }
 
 /**
-- 
2.47.1

