Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35E8FC25B5F
	for <intel-xe@archiver.kernel.org>; Fri, 10 May 2024 12:12:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE3ED10EA76;
	Fri, 10 May 2024 12:12:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TN9m2aCe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E4E810E846
 for <intel-xe@lists.freedesktop.org>; Fri, 10 May 2024 12:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715343138; x=1746879138;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=Nf0E2eNEgRxieQV7xqepIa95PmLECYAj9AdvNP5H1MQ=;
 b=TN9m2aCeR5oUkQawPp1bmYqRSkkP5s6m2RDygog7thTV9uyYc0dd7TBT
 jxGAAcg3aPLas/7FCPOzN5YbUldY2JuJL0NZb0iLD7YtYrbMp7NPG2HfN
 MwiwhKhLG/gRqneATEvjseqjFB+b2S+lDi4PGWsmpdj9dZfnA3IjzE/fj
 5IM5U2359y7DCUOCmX1RbYHrqjj0amHd4dKPYZQ0bAWPOMqmOM9ci7TZw
 X+XFvp1MMUiaUTRe81s+oAynx7BOe/EsRveMn8BfKskKEg5hV2w5lnuyh
 /O4Qjfh93mnUUKhjHwd3V2vsxwfuOLn9dqpbfrzxxSnVru4KYJGiFtk9B A==;
X-CSE-ConnectionGUID: S2Trq0iTTjmbVmBc2dYKtw==
X-CSE-MsgGUID: nLE2shJuQiqwNaD2ppS5YA==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="21895590"
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="21895590"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 05:12:17 -0700
X-CSE-ConnectionGUID: 8qyAoXZOTxazG4BWwOrSSw==
X-CSE-MsgGUID: v3fUCJ80TXG72Tm+nzdNfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="34137383"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 May 2024 05:12:16 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 10 May 2024 05:12:15 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 10 May 2024 05:12:15 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 10 May 2024 05:12:15 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 10 May 2024 05:12:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ARopFyhvlgfvKxsLWd44+qeLyGl2+Os2ce7Weg80oJaYQrsQjofzzDy8Wem8RrfZq/j/IJZK2HvTZRpCXVRTiPItJEyRp4vBm1i3r8ZxklNVqPc5oJggw9DpplDVFBYpWnS5tqTXX8+7FHeY8AhyVntEoRVicrZ8S9mol8dh1ZM2V4U6GP/CLa2bZvC90vLDtlazuKLxz4vafw84qpJ3J8AS7Ki/xv+0+17qmj79ZflHkwz8pLTOH01PwZ3lo0DqyVRTc7xNLfbAgIgiojGazXJuh2BQ5i/1eXwvzXVbqevbpQ723pmI35NMr8LIHEDfb/mdvo3JesZE2bUk5rlGEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=02csHniVS/NtOlQeLaSaSQSiiB2ZSrR0YCjWh5ybe18=;
 b=gJgKmaRe79xoq+xJDLnyinijhrsq7jj44H2DkokHHEk4U4OjU06m4V4hBEvsq3u1VPE4Lp76rNwy60xjv+6m7GzAT3kiEQffkiJefrChYtrtS1YYW5mO9IoB1Jb0Uzn1S4LyEdbWIeB1nDiiBcl5NpuKLNnTn3gco88hegu0DAhiQPgsDxGHXumvxatkmY70fY4ytxz9RbkVBOOdeOdQwvB0x/k16IzXEjFa9F+mf080tQQEEemyGe7vUui6BjC8ZVWS2fpcdzaehy6qP+r3EVmDZv3BQ3cL+kKqFu4Jbbpj/Ab5jX1J6fbFSysDkfEVJcdnAu+5rmCPNJfQ3WXr3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by IA1PR11MB6323.namprd11.prod.outlook.com (2603:10b6:208:389::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.46; Fri, 10 May
 2024 12:12:10 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7544.047; Fri, 10 May 2024
 12:12:07 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 1/4] tests/intel/xe_pm: Update runtime pm conditions
Date: Fri, 10 May 2024 08:11:58 -0400
Message-ID: <20240510121201.723602-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR04CA0365.namprd04.prod.outlook.com
 (2603:10b6:303:81::10) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|IA1PR11MB6323:EE_
X-MS-Office365-Filtering-Correlation-Id: 47532600-f828-4b57-ce78-08dc70ea6928
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1yNyq96NfsLV94Wl5Xp/lr3JIv/GXEOhRvNr8avG6i6dFTQICdJdI+ITu/Dh?=
 =?us-ascii?Q?VaMzUrZ1NC3MOvcURLEB8uWJWV3bY/P7cf+XWo5Z7TwkPICJCXhrQZDWKMBp?=
 =?us-ascii?Q?MxBJk2mhSmIjL0LhFTwSK+ujkXRzi/956EEZO/m72UrkqBwyClY6FwvWZVxQ?=
 =?us-ascii?Q?TqmyUXlSwYaK4NGFhywZvSuUO1/TUFtHtWqmKbFPWcWOxewH5Ik8+7afDrYf?=
 =?us-ascii?Q?cwN6Ydrs1xoH5zF8Pw/EJcwlYFIQcFf6V25ITkrspPXQLldfyz7HoDou4yEr?=
 =?us-ascii?Q?XG8Ri6L7Z4MCGWLdn854G7UK+Ixa3aZeiyhpYQtNrIAJfn9CMjDpnM+UUYRx?=
 =?us-ascii?Q?FcN6OWeOAyl8gutl/yDH2ucnlHv6YfgNWZyprTAWzqaLNGXimIaVZHyqdAN7?=
 =?us-ascii?Q?nOk7NlnhoPKcEY8nNwit/NxvlJTKuL8+YmXacY15M1eEFgqEEmJiN4sJNul+?=
 =?us-ascii?Q?NioYghHXK25KDjt1gP6hqzEh98CeWvq0InrvFM+Qxkj0e1c/cx/aNrUBxdyd?=
 =?us-ascii?Q?csInwmMVhV0oBMNwx7ghOjF7+zZlSP+PKD5jYMUQFhcKDyrURlHDXajPejl7?=
 =?us-ascii?Q?8vt5LMYlKA7Fu7jgAvcoQ7TfaS299AiqK3dhgdMbbAbjTvBX8hwgIU6CLtmP?=
 =?us-ascii?Q?QtVLTSrjDm4mrs1c2NxGL42FxkPOyBmzcaPbKWBSPbcBVoWL5VbG3hZ0I2i1?=
 =?us-ascii?Q?NNlr7TwQu9BfHHONJy8vVn9i5lCvZ4xs+gT2iKZyNSpngc7Qti+/8kqE01xo?=
 =?us-ascii?Q?fLM2nsEZ/QAk8Ixhw+6VzL+OoUNkXCzdXJjC1cR2/7Wq9g3I9gRqZfskgwrc?=
 =?us-ascii?Q?E+a3+HzqafqGOX/D8XmJqeH1EcXmhudsbM5cGxR9VSnHNbjjj4JOTAeX/e4E?=
 =?us-ascii?Q?1jSsVgvbhtYmLEkNHkaFtt7pi5nllujVjtvmPDujx+NSCmFOYdnEaUZI3Vap?=
 =?us-ascii?Q?8B6vow4+lsiD2RwNgrgNvtm6HpTD6o6SwwGcCj0IUy0sS9N+5RCw1g7UUCne?=
 =?us-ascii?Q?VvnFHK1/rlRonl8eKwrTFGudD3zJKgYvQFATcyDl2rYZtQSaltinHe/bYHpP?=
 =?us-ascii?Q?hZ17KD5k4aIpzhYWyHJY/zr/kVk8PW5gTVm1NoUQCA5AMHC5ekmoHWpcbmIG?=
 =?us-ascii?Q?lp66g5VYAAIJvgNETLcYOCAI/qCnRkhS/ayiU+y2ZI4DfBk2jjVMZKh762CN?=
 =?us-ascii?Q?7fo5Y2qHKoSOTUYzpdT6KXuldgOqCA5LPIaxzGgxoqBdYLUFVVmopCaaa2wl?=
 =?us-ascii?Q?nLeKt5DQxQwyxyhlEzzVBZL5ZG7btuYF1ojPvgNngA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?O49cbUtq+p7qzSz5VC06uDOI3psVWlbEfVoLZACYrEQtEeeFSbl9JUP4vl32?=
 =?us-ascii?Q?WaabrjRI/jlby1xcA+kGAW8utQSh3NtxZDg0dFUbSDVpCCn0grzxcs5FCfeP?=
 =?us-ascii?Q?q+dQN4cj4MTdF57u3sf0mDdIr2uyVL5/hgOmvfeLDjYF/U+S+l43aIsjiDPc?=
 =?us-ascii?Q?wWQwLuFcFJeqoB5pQhk2UPbtd+kD9ywgdekR+HhtLo/h8hr9BfimtLnTzRpq?=
 =?us-ascii?Q?+VzGWBoFDQ62t9HMJw00s9XTcOHX4avaRwms4ijHXUUWd2CwRvUPWB0OamM/?=
 =?us-ascii?Q?beCMgpFLC96lqI3NQgzYfHvgIdy66/WyBh0yQpAAKcuntgyT0tJQk/u0uNcY?=
 =?us-ascii?Q?tAwhX1iU9bWPCWP4TGWUS4iNqDSjEP2n0FdiGMxnpdTNDitMOab4lap74vV7?=
 =?us-ascii?Q?eSAcb/GlbPLgiNTEF0gZVBdhBQW+/dmecQmnddv90siIHNN3Qx1QQO9nbRWF?=
 =?us-ascii?Q?oiWTaKktfCZu6CjWeNsEKK9eYUmvxUZhmcXFI1oLSnPHkf2ZSPMyJMPxRI7s?=
 =?us-ascii?Q?/bNz8GK9WpdljbB9RxihYin8Yni7MUjb8M8gMixNtGkW7Z5sq7i/hg8qS1R0?=
 =?us-ascii?Q?81uc458UD6nHZGsQpQ4dbf0iHzs2kI87vcUmSnLHU6Utcl3RIE1qDbYNaiqU?=
 =?us-ascii?Q?FyJZPjKDGTtDTFSFFPfG9ElhOsu+GRYh3hW7BbSxy5QkXzaMRsMePUajorE1?=
 =?us-ascii?Q?Rlnk7O/alIzlZbmHt59qhB5aunwFzT8BRn4dgWuReTCr8kdVvnTiv3jZ+VAa?=
 =?us-ascii?Q?J80RUdufcVD2gnJyzhzC6DW21biCB0xVLfedVPxD9jdlZWY8pUFidFKR6oFb?=
 =?us-ascii?Q?Nve0DWrDWoyOo2sDDlUuXa6aYs3mSV0wEEzlJ2Kvi/7LYRxTqjMt4RXM/C4C?=
 =?us-ascii?Q?7MF1pKMioirBuAyk2rUfkO8XSsaD3jZMyzAzji7IHJQPAbwh2zMSgiINcaPM?=
 =?us-ascii?Q?0lnP4nNGv3klwa96BbAdJ+11El7iZOQXEdifA0km0L3oI0Lz2nnFYbhcw+h8?=
 =?us-ascii?Q?BOvpk7rx8R4P/oSKOFR50ZwlqAQq1qGHicWwsXrQwtsJGeLejgaTNyzfrtlw?=
 =?us-ascii?Q?0Bbb7VGi/uIy4hANfNGAc/eTnRKUNiiwIthwJ7qGByMz/JuUdyws8MxCHCKc?=
 =?us-ascii?Q?jyDfVQNuyRevt+pizo4Ql5AXyExAxeH6rvMLXQD9NGm6YZhwlgrTW/sW+M8G?=
 =?us-ascii?Q?mVuP5rCmQqjEBW/jD2XjaNqcjWEW97aP89sOHcLoXZr0rkxHO6Hu3OYBhj32?=
 =?us-ascii?Q?UJzPwKr/WG0qLm5Lz239mGQPYLCO2n+yPsI/vdJ99zVbmP6cU49prjNyutXp?=
 =?us-ascii?Q?YiyYki6J/m3MGwqmJPGmtbVdI6eu4ddF+H5kpdxOZc6kRFyPXe3NDrDiH3wI?=
 =?us-ascii?Q?LriBayWbaph8p7ITXvyUtRf4/LMmu7GgBSrIk3sTo6L30BcJAt85+UpFYk7T?=
 =?us-ascii?Q?iSGM+U5KBJF1tx3vPJc6hP144BlzF2CMAh+mvwYovlBwi9bDYsmBxXivefci?=
 =?us-ascii?Q?BYHJbURTppJms6szdb0IoZFDufJ1BVaG+jL6MyuP6A6tzP+A48PNyJGdi7at?=
 =?us-ascii?Q?WHx7ZTsx5mkwxU3/0OuOBfNOt8q1G/dKxdMiPNZge1giZJjoE/MPbyk/frVa?=
 =?us-ascii?Q?/g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 47532600-f828-4b57-ce78-08dc70ea6928
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2024 12:12:07.1353 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1PrkxqD01ge6nc3S/qWcRXeElQykk1cUO7GiLBF/4iN0SlKVcpJ0R3fK4QGRQkao5ZCMelj+BKhJ5hrupkjF3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6323
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

Xe is no longer holding a runtime pm reference for the life
of a VM or exec_queue.

Also, IGT changes autosuspend time to a minimal time, so we
cannot guarantee that rpm is still suspended after the execution
has finished.

So, the reference usage is not a reliable reference.

Hence, start using runtime_active_time as the indicator
that runtime_pm resumed upon our actions.

v2: Usage of runtime_active_pm and inclusion of mmap tests.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 lib/igt_pm.c        | 18 +++++++++++
 lib/igt_pm.h        |  1 +
 tests/intel/xe_pm.c | 77 +++++++++++++++++----------------------------
 3 files changed, 47 insertions(+), 49 deletions(-)

diff --git a/lib/igt_pm.c b/lib/igt_pm.c
index fe7692960..98cc8d969 100644
--- a/lib/igt_pm.c
+++ b/lib/igt_pm.c
@@ -1412,6 +1412,24 @@ int igt_pm_get_runtime_suspended_time(struct pci_device *pci_dev)
 	return -1;
 }
 
+int igt_pm_get_runtime_active_time(struct pci_device *pci_dev)
+{
+	char time_str[64];
+	int time, time_fd;
+
+	time_fd = igt_pm_get_power_attr_fd_rdonly(pci_dev, "runtime_active_time");
+	if (igt_pm_read_power_attr(time_fd, time_str, 64, false)) {
+		igt_assert(sscanf(time_str, "%d", &time) > 0);
+
+		igt_debug("runtime active time for PCI '%04x:%02x:%02x.%01x' = %d\n",
+			  pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func, time);
+
+		return time;
+	}
+
+	return -1;
+}
+
 /**
  * igt_pm_get_runtime_usage:
  * @pci_dev: pci device
diff --git a/lib/igt_pm.h b/lib/igt_pm.h
index 91ee05cd1..b71f7c440 100644
--- a/lib/igt_pm.h
+++ b/lib/igt_pm.h
@@ -94,6 +94,7 @@ void igt_pm_print_pci_card_runtime_status(void);
 bool i915_is_slpc_enabled_gt(int drm_fd, int gt);
 bool i915_is_slpc_enabled(int drm_fd);
 int igt_pm_get_runtime_suspended_time(struct pci_device *pci_dev);
+int igt_pm_get_runtime_active_time(struct pci_device *pci_dev);
 int igt_pm_get_runtime_usage(struct pci_device *pci_dev);
 void igt_pm_ignore_slpc_efficient_freq(int i915, int gtfd, bool val);
 
diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index e81a75d88..3f963bd9b 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -184,34 +184,6 @@ static bool in_d3(device_t device, enum igt_acpi_d_state state)
 	return true;
 }
 
-static bool out_of_d3(device_t device, enum igt_acpi_d_state state)
-{
-	uint16_t val;
-
-	/* Runtime resume needs to be immediate action without any wait */
-	if (runtime_usage_available(device.pci_xe) &&
-	    igt_pm_get_runtime_usage(device.pci_xe) <= 0)
-		return false;
-
-	if (igt_get_runtime_pm_status() != IGT_RUNTIME_PM_STATUS_ACTIVE)
-		return false;
-
-	switch (state) {
-	case IGT_ACPI_D3Hot:
-		igt_assert_eq(pci_device_cfg_read_u16(device.pci_xe,
-						      &val, 0xd4), 0);
-		return (val & 0x3) == 0;
-	case IGT_ACPI_D3Cold:
-		return igt_pm_get_acpi_real_d_state(device.pci_root) ==
-			IGT_ACPI_D0;
-	default:
-		igt_info("Invalid D3 State\n");
-		igt_assert(0);
-	}
-
-	return true;
-}
-
 static void close_fw_handle(int sig)
 {
 	if (fw_handle < 0)
@@ -326,27 +298,27 @@ test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
 		uint64_t pad;
 		uint32_t data;
 	} *data;
-	int i, b, rpm_usage;
+	int i, b, active_time;
 	bool check_rpm = (d_state == IGT_ACPI_D3Hot ||
 			  d_state == IGT_ACPI_D3Cold);
 
 	igt_assert(n_exec_queues <= MAX_N_EXEC_QUEUES);
 	igt_assert(n_execs > 0);
 
-	if (check_rpm)
+	if (check_rpm) {
 		igt_assert(in_d3(device, d_state));
+		active_time = igt_pm_get_runtime_active_time(device.pci_xe);
+	}
 
 	vm = xe_vm_create(device.fd_xe, 0, 0);
 
 	if (check_rpm)
-		igt_assert(out_of_d3(device, d_state));
+		igt_assert(igt_pm_get_runtime_active_time(device.pci_xe) >
+			   active_time);
 
 	bo_size = sizeof(*data) * n_execs;
 	bo_size = xe_bb_size(device.fd_xe, bo_size);
 
-	if (check_rpm && runtime_usage_available(device.pci_xe))
-		rpm_usage = igt_pm_get_runtime_usage(device.pci_xe);
-
 	if (flags & USERPTR) {
 		data = aligned_alloc(xe_get_default_alignment(device.fd_xe), bo_size);
 		memset(data, 0, bo_size);
@@ -384,8 +356,10 @@ test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
 		xe_vm_prefetch_async(device.fd_xe, vm, bind_exec_queues[0], 0, addr,
 				     bo_size, sync, 1, 0);
 
-	if (check_rpm && runtime_usage_available(device.pci_xe))
-		igt_assert(igt_pm_get_runtime_usage(device.pci_xe) > rpm_usage);
+	if (check_rpm) {
+		igt_assert(in_d3(device, d_state));
+		active_time = igt_pm_get_runtime_active_time(device.pci_xe);
+	}
 
 	for (i = 0; i < n_execs; i++) {
 		uint64_t batch_offset = (char *)&data[i].batch - (char *)data;
@@ -429,9 +403,6 @@ test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
 	igt_assert(syncobj_wait(device.fd_xe, &sync[0].handle, 1, INT64_MAX, 0,
 				NULL));
 
-	if (check_rpm && runtime_usage_available(device.pci_xe))
-		rpm_usage = igt_pm_get_runtime_usage(device.pci_xe);
-
 	sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
 	if (n_vmas > 1)
 		xe_vm_unbind_all_async(device.fd_xe, vm, 0, bo, sync, 1);
@@ -459,15 +430,13 @@ NULL));
 		free(data);
 	}
 
-	if (check_rpm && runtime_usage_available(device.pci_xe))
-		igt_assert(igt_pm_get_runtime_usage(device.pci_xe) < rpm_usage);
-	if (check_rpm)
-		igt_assert(out_of_d3(device, d_state));
-
 	xe_vm_destroy(device.fd_xe, vm);
 
-	if (check_rpm)
+	if (check_rpm) {
+		igt_assert(igt_pm_get_runtime_active_time(device.pci_xe) >
+			   active_time);
 		igt_assert(in_d3(device, d_state));
+	}
 }
 
 /**
@@ -561,10 +530,13 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags)
 	size_t bo_size = 8192;
 	uint32_t *map = NULL;
 	uint32_t bo;
-	int i;
+	int i, active_time;
 
 	igt_require_f(placement, "Device doesn't support such memory region\n");
 
+	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
+	active_time = igt_pm_get_runtime_active_time(device.pci_xe);
+
 	bo_size = ALIGN(bo_size, xe_get_default_alignment(device.fd_xe));
 
 	bo = xe_bo_create(device.fd_xe, 0, bo_size, placement, flags);
@@ -575,7 +547,8 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags)
 	fw_handle = igt_debugfs_open(device.fd_xe, "forcewake_all", O_RDONLY);
 
 	igt_assert(fw_handle >= 0);
-	igt_assert(igt_get_runtime_pm_status() == IGT_RUNTIME_PM_STATUS_ACTIVE);
+	igt_assert(igt_pm_get_runtime_active_time(device.pci_xe) >
+		   active_time);
 
 	for (i = 0; i < bo_size / sizeof(*map); i++)
 		map[i] = MAGIC_1;
@@ -585,22 +558,28 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags)
 
 	/* Runtime suspend and validate the pattern and changed the pattern */
 	close(fw_handle);
+	sleep(1);
+
 	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
+	active_time = igt_pm_get_runtime_active_time(device.pci_xe);
 
 	for (i = 0; i < bo_size / sizeof(*map); i++)
 		igt_assert(map[i] == MAGIC_1);
 
 	/* dgfx page-fault on mmaping should wake the gpu */
 	if (xe_has_vram(device.fd_xe) && flags & DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM)
-		igt_assert(igt_get_runtime_pm_status() == IGT_RUNTIME_PM_STATUS_ACTIVE);
+		igt_assert(igt_pm_get_runtime_active_time(device.pci_xe) >
+			   active_time);
 
 	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
+	active_time = igt_pm_get_runtime_active_time(device.pci_xe);
 
 	for (i = 0; i < bo_size / sizeof(*map); i++)
 		map[i] = MAGIC_2;
 
 	if (xe_has_vram(device.fd_xe) && flags & DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM)
-		igt_assert(igt_get_runtime_pm_status() == IGT_RUNTIME_PM_STATUS_ACTIVE);
+		igt_assert(igt_pm_get_runtime_active_time(device.pci_xe) >
+			   active_time);
 
 	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
 
-- 
2.44.0

