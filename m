Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32E24CDB479
	for <intel-xe@archiver.kernel.org>; Wed, 24 Jun 2026 11:18:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7DDF10EEAF;
	Wed, 24 Jun 2026 11:18:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ayPc0L2/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97ED710EEAF
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Jun 2026 11:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782299893; x=1813835893;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=Cfvqp5loiezi2RwOo4BQ8z5aAV7w+QpXC+76kiHyBG0=;
 b=ayPc0L2/9skivs/oCV1ac4uctdsy5yHehlverGcIhKA9riYohpKhV3Bk
 p5deMs4H39p0qBZ8M4HptfO9RSYZjiYISTfbKPXRwb1SH7X1KgZHAc1yU
 QD1YKMBcuA4882xvP1qPsKsKD7ojD2DwnJbQMLxy437qpyp1AAA9DRiKh
 yUAIW5IuxOdGSKMt6PSzpbRucZWXgWESTI1Pw8bwLiXrMH0BaqSusDyGZ
 DjzEbtfnASIV7QojihHEAIDDhYdjdU2VWcYL3fP1hm02cJvfnUDIHDmrd
 uCqD/8h3DGi2+ktq6DnjZLwRSS2xmFqscGcz0thaZtjRPwC28kuZsyO3R A==;
X-CSE-ConnectionGUID: zSmBK16HRpme40EKcgayIw==
X-CSE-MsgGUID: 91aIMdxOSJWT6urR134AQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="86901335"
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="86901335"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 04:18:13 -0700
X-CSE-ConnectionGUID: PAuMwfAlSCqHtZ7TKNPHRw==
X-CSE-MsgGUID: c0On14JxS1SdZYHSIt19EQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="246907561"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 04:18:13 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 24 Jun 2026 04:18:12 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 24 Jun 2026 04:18:12 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.1) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 24 Jun 2026 04:18:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wzJ9/VSUsHg9dddly5FibSs+cR4ljbQTKGwoM4rSRW6WqZbSaPNxWI/wSBuFaWUxd04bri8uRMeUMw2ib5XLDeCGvC1oU4iTFYwdXJM50nwbdZ2JQd3DKHNUkq+c4uuvr+O6Ad8Trys28ybDYGR/PPTrv6kdlg/o7muP/fOeU6hVWclyJwKkSTb4maRzQxifh8lqDCxrYWT6oUePH8mai+lpYowgmNsaZjFXMdPKu29VkIGVLvJk2M+ZoxmGeIgzwKDSOYP8+SS4sC6DjWysjdub40WvGPzVgpuEJvbkaO37s8csens6W9ggKk04yH+++76PW69fies1zb/p7QEmEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VnZ0WGgmA5DaqZ50AmftAqhgnLdHtTy9aLMjJ0fyOeQ=;
 b=tODo6UPfz+yH+EAEb2WH7kDgT4SwIVbSMoEh41phEo5q7+7XCQq11ijpiGAg+FEV9KUxpWTGxz2nyNCPLKxGERUK63YXKU3MdmKRaAzFH/iKQID/gj/GFr1pBU8eHKqqiyuP8DlAk2r4GPbXXxpflq3Hck+rvurQf8NE+jX+C75mQsXeAJiN7FbXxvNUVKZ+T8INKGae6XRiNo3IybSwR24XK+yDAvaLJCwR03K7GeaQSmvImu9k8AdGS9Y0OBeq0oLIfK2EyO3wza97JammZLTIXWhZumZruaf2z6g12KYV8JJfv1bvKSLotgLru6+5af1cZDxwoZw3MAq1VThomg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB8132.namprd11.prod.outlook.com (2603:10b6:8:17e::13)
 by SA1PR11MB6806.namprd11.prod.outlook.com (2603:10b6:806:24d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.14; Wed, 24 Jun
 2026 11:18:10 +0000
Received: from DM4PR11MB8132.namprd11.prod.outlook.com
 ([fe80::22f3:a01e:fb45:57ac]) by DM4PR11MB8132.namprd11.prod.outlook.com
 ([fe80::22f3:a01e:fb45:57ac%3]) with mapi id 15.21.0159.015; Wed, 24 Jun 2026
 11:18:10 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>, Martin Hodo
 <martin.hodo@intel.com>
Subject: [PATCH 1/2] drm/xe: Fix memory leak in
 exec_queue_set_hang_replay_state()
Date: Wed, 24 Jun 2026 13:14:20 +0200
Message-ID: <20260624111421.1258364-1-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.54.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VIUP296CA0062.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:337::11) To DM4PR11MB8132.namprd11.prod.outlook.com
 (2603:10b6:8:17e::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB8132:EE_|SA1PR11MB6806:EE_
X-MS-Office365-Filtering-Correlation-Id: cc3a63cb-37b8-4839-8be1-08ded1e245ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: Q6OBPPFgRvrQJzhewCCt+g83GZDHCjXC2FdmjKni4FuLA1LRNiCKtOw81hD1FSTtfLbUPt7J8agvgKRjTLXm+TVnQWgJSiS4CsJWNLZStQ3dvD6jowz6sm+Ac8F/XbmMlxdo+4LkAj+78/KA1Y3RAOtnwhzkqEUOulIHw/xMcCWs2yAU6d4aKXo7smrtMmyylLwUNJZxInpA6hULdwLEpmbhcVXFAF/OQFEfAA4VfHlYGo89maphCZSw9TRVcNP1ZZaTZ7scaN1oHwtVithtoJPpr7A65sTnsDt7UST5+4mXcQhzYZUHGJjq8X6jPuu143vSEwmPnuz+NJMKlmq2rgr0eR2EqtGvVvflhvM7AgREO1UiQJezKVzB/RW1DVm5DOQDmMLoW3XKytdY0xJ3aVkyzgfn7PYXXA+x/uLK685SVUJcuOFuBPAvKCW1mOTE/ktxj2joB/7QsGkZ5ktwLp5auXn9HMBYM7N0CRBJKXmzIUWiCx+1yk1oIeu2rcycEdMEN5MZuVhZCiPeR6BTtSq2ycXbVb1Tqj5vX257I3ocJ5duCs8YJXjbOgdiG9gyrQGuj3UFiLZ41vJ3qQOfTQe3azVtQ//nhWabQ5edapCd/Q9VmQGOq8BHJz8FymsxTyKvFuiaBf/935ZkaZtURgTHTcm0t9lh0sgPFEtpVQg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8132.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(56012099006)(11063799006)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aVFJM1Q0Z2dnd1l1RUhZS2ttZlppcStUWTVtcE5LRE5GbXNkczBuMVNxTHhu?=
 =?utf-8?B?NVFwT0NJMXo3Q3Foa2VRalF1eXdYdk9uSU1oSmNQaUVuR09mNThTcmdpZUNV?=
 =?utf-8?B?Y0g1bFY1Mzh0S0VOZTZHankwWVY2TXhJQzRNeitRQytEd1FUTktyRUIxVXpm?=
 =?utf-8?B?c3JxcXhNRUlKMVhEeDRsWGN5ZmxhR01FMjJGUG9hd3VablFMS1BnMkx3MWtG?=
 =?utf-8?B?ZDl1cUtOOGRHN0hnWHhCb1dOU2NDa3BCZ0ZTejl4RUN6aVFwYU92ZkUvNDlG?=
 =?utf-8?B?QWc1YUZYN3l6MFozQXZ2a2hMMkhVZnRsY0FmWEMvRmxma3o3QVVmMy9MZUxZ?=
 =?utf-8?B?SXNpcHhtdWh5czQwSDBaWFp1U0JKY2R4TXdycDQyWUlKT2dLalFINFNhUUQ1?=
 =?utf-8?B?K3ZaRXd0b1BaTTVJMllrckVoRGxMMXNjM2tOdGkvb3NXOWpyaGFoYmk2aENW?=
 =?utf-8?B?dVFKY2hUMmx1dnptaE40bEtGaTNBbWVNUWk1M3M2YUhEdmJQaHBBTG8zdy9w?=
 =?utf-8?B?N2tUcWFsMTRMeEVVdVhiZG5NOGxRcGp3dnM4Z0QwdXNwQnBka3Q0dy95VlNY?=
 =?utf-8?B?VldRc3A1Q2tCUkQ4SnVQaHJUV29pUU16b09pQTRDVUZ0Z1Y0QWwwL3N5SFpa?=
 =?utf-8?B?YmFrZ0RiYjhuOVo0ZHJXNTM3NmRkQk51OElQQlppNkZ0ODdkQzJjS2NXalIz?=
 =?utf-8?B?ZVpnUkMySm9RODFkUG81Wnd0VzhjdVF0NHNxZkduMXlIdVU5engxZUN2c0JL?=
 =?utf-8?B?cmh5b0JKZUdJN3FhWnQxUVptTFF5OFU1UWJFMy9uTFJTNUVMMkpyQ0Fld1A0?=
 =?utf-8?B?WTV5QjhoSllnMnlaTXZ0Wm1ITmltVmpPb0dhWmJ4dnJzbnMyb3FFYWdnRzhv?=
 =?utf-8?B?T3hPT3hKRUsrTHZUQmErb1AySkVvODJiWDkrNlJ5NVBqajZ1V3VTWVRxYXlj?=
 =?utf-8?B?Vlltem8xYWsyUUdZUVIrMWlpRlpibnEwOFMzbHpZWmJnWnFYeHRTbElXdVo3?=
 =?utf-8?B?Y3JpSkV6TWY0M1Q1Q09wbDBJRkJmcUI2NlNPR3B1VmovREpvRTdLQlpjTk80?=
 =?utf-8?B?dE53TXpMNXJ6K3NFSGxLY3FtalNrL0lNNy9zUmxIQzMzaExYV1l2VVhGTXB3?=
 =?utf-8?B?L1Y2aUxYMnVEMjIra01kaFZYVi9BOE4zNXlOM1ljZk5BZ1JMYk5NM1IxclVJ?=
 =?utf-8?B?WUxxZ09NZTRuNlZFaTRkcEE1bXE5Z0pGV2VNbFc5ZTQvOVZSclBYWG9wVGVh?=
 =?utf-8?B?VVVrOVZhdThoSGFVV1IxYnBLc1FMTmdRQkRhQUJCa1EwZk14RElIeWZyYWpT?=
 =?utf-8?B?UzBscDJWTWVIVjF1SWVmMlNBMko5ZmVLclBPanNPelJ0K0NnajY5R3NyUWtX?=
 =?utf-8?B?U1ROVTZNYnpXUFdtUVBYWE4ydXlES2wza3BTSXUrenFDd3l3djY1REZIaGRJ?=
 =?utf-8?B?YmJuUTZ6QW5IcHVieGtGSVJoQzh2eVNyLzlld3dyWHJqT05hRDBtSkFXbGww?=
 =?utf-8?B?eUg5UnFvaEJ2bzBYNjNhSCs0NjdaZFpEbDd2T1hQL3UxWFlJQ25iL04zYlpZ?=
 =?utf-8?B?VEJva0tVL0NXWEN5RDlhTlVBTnBTVnhKK0hSOXpIL0RRa0tnOU9xNUUwQnBD?=
 =?utf-8?B?RXhISnAxbUk0WXc5V1ZiNXp2bkFXYXhZQUhkaUtZdFBQUUt1bWZyYkZGT3RX?=
 =?utf-8?B?YmxWSklUYzhOMzQzUGp5dHpWYnh1QmpCUSthOUxLY3ZOUTZjenpGRWRXTUx6?=
 =?utf-8?B?QVUvOXZTRzlRNmZnK2l6OHA4WGpYZWEwZGpRYVdZZXkvUFBXeGFuWW1Gd3Rx?=
 =?utf-8?B?TzZYS3hKREJEYTlKMmlvSXRVelNVQ29KT2ZidmkxZ3dyOC9nbHJ1V2RoM0Ns?=
 =?utf-8?B?SERSWGxRY21XS2pkOEZRTzhsOWhaM1NzaEhBcm85UGVBb1VtdzZkVHNrb1Ay?=
 =?utf-8?B?eG9FRE15b3VBcXhYeXBUWGhscy9DajlpalNyRmc2K0dJS0xENjRtY1ZJNU1F?=
 =?utf-8?B?NmlCNWVKOUlRMDJMRGwwNllkK1ByTXN2R0tJWTBkcXlwWlNUYUE3UFJzdThJ?=
 =?utf-8?B?OHd2Z3g3NkdHdURmbFR5Y1ZIa1NwY2pHR0kzYU9TM3lvdkJObnJHY2Q2RHV4?=
 =?utf-8?B?TmdKZWVtblFjQ0U1RjloTjRBYTI3cjQwYnVsQWNweHcrZllnME5JbnBUVHA1?=
 =?utf-8?B?RmRDbEYyeGpseGU5QWhRQTIzU2RMYXh0eCt1MkFOODRhUXhhS0lmNGlCbnhY?=
 =?utf-8?B?UHZtTi9nTXJUd3BOd1dEOTFWeTd0QU9Gb2MybENGR2hpV0FFdm1Ed3Z6NlNj?=
 =?utf-8?B?YVpILzlZSlA3U2NRMFl4THlVdk9HdjZvSUNMODNqVUxPc0tXY0h1RklDV1Va?=
 =?utf-8?Q?IayFYgf2dlju1x+g=3D?=
X-Exchange-RoutingPolicyChecked: eD/ZBG23lm3TO9d9smAHyuzYjIgxAajaCKSEbnBwTG98NU2QXeinc12X+jhb33rGUXpR55vIbIqOfdc42FjC1Sg2ABg7Xsk4L0dUuDQr4vwLHLad78c3TlZyLJ+tTu/OmnIrL49V96brDl7oIWdwakAXtM1L1rgezFgDwodkExjTkyv27L4WHaEjjAnBUHvRVbihiz1yIwSzVA+9LItsVEeUeBq3q4DebuPuPPd6uprZjR8L/PXN6BYTE6Im0XEpXWs9XyirU9P1jSFfZgPRklfnJh6WQohtCtiKmS5V07+TAI8C9u9YLaDcLXTT8Ia+sdEKmTTjZXm9sKUt/4cSJA==
X-MS-Exchange-CrossTenant-Network-Message-Id: cc3a63cb-37b8-4839-8be1-08ded1e245ff
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8132.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 11:18:10.1733 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l2IXsA8NwHT6q1ZiF0VV/9h0OwhVHGZ0mTETF+zRLFpLZfXqWLXhYTmhuWrprUaYus2CNy7HwcVaRChCniNIEzNiaMLxxaz5ip61X0uIqBY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6806
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

The q->replay_state is blindly overwritten, which can potentially leak
memory that was previously allocated by vmemdup_user().
Return an error if q->replay_state is not empty.

Discovered using AI-assisted static analysis confirmed by Intel Product
Security.

Reported-by: Martin Hodo <martin.hodo@intel.com>
Fixes: 1026c1a73a96 ("drm/xe: Implement DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE")
Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 1b5ca3ce578a4..663decb19304d 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -805,6 +805,9 @@ static int exec_queue_set_hang_replay_state(struct xe_device *xe,
 	u64 __user *address = u64_to_user_ptr(value);
 	void *ptr;
 
+	if (q->replay_state)
+		return -EINVAL;
+
 	ptr = vmemdup_user(address, size);
 	if (XE_IOCTL_DBG(xe, IS_ERR(ptr)))
 		return PTR_ERR(ptr);
-- 
2.54.0

