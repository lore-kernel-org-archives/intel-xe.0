Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB9B6C25B78
	for <intel-xe@archiver.kernel.org>; Wed, 22 May 2024 17:01:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1898D10E135;
	Wed, 22 May 2024 17:01:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aLj7rhrb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED8AC10E135
 for <intel-xe@lists.freedesktop.org>; Wed, 22 May 2024 17:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716397294; x=1747933294;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=XkHE8xEDEFuGgEY3z48deD5ZploDWjROxIPr7IciRAc=;
 b=aLj7rhrbeN452mBy2cib31iFpxynrrCxj/IEjii3PKrqonUlYTPSUrPC
 ekVPqK2v1LwskLCJ9QW9vig6AMfAX9q1tKQQ6QlSOyPus65m+XHyn2UlB
 fThczfr7qb/MXVuqGuuDN11l5rMCPIEiFWxFf/FVy82i+gKnWXO+4E0E8
 qPtwLaOpoDKLj4xiiehTm6Rj943PaikwWxa1yhvAut5FV8nlKmlRxVcWv
 DhN5Yqb4IxUDmulPnf/iJbXob/+WEbNaqfN2D1gTh5zCpM7h9bl+B/UwO
 jSkEIXPGn7LalW1O9AlY3YBjWbvfBxuByO5vIRdcW6WZ4VjBZe6pW6eIR w==;
X-CSE-ConnectionGUID: YK8ayICiQfWnfuBmRBZTnQ==
X-CSE-MsgGUID: 4sUKYuYJTw+YgtIBulyarw==
X-IronPort-AV: E=McAfee;i="6600,9927,11080"; a="23239478"
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; d="scan'208";a="23239478"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 10:01:30 -0700
X-CSE-ConnectionGUID: g/KejX3/QJe5gyHgmWM4JA==
X-CSE-MsgGUID: 9PwK49nlQ+22fQUPQFcWjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; d="scan'208";a="33218509"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 May 2024 10:01:30 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 22 May 2024 10:01:29 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 22 May 2024 10:01:29 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 22 May 2024 10:01:29 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 22 May 2024 10:01:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bl1C7LfTQPI6i570Ov2b8DcoRr1LERE8pZWw0h4aEeLN/+8yNP6ECPajoJWUangHh6bMA9/h2LIYjtv7RaZKD+txV/tHfZweDGRAIPp32xja/rYmiIJK/i+wcQWtxbFWFEX2QiGMBBYqJnt+VzbAQueZ8vUfOE8hNA5dcLTshh/pDWv4wm7Fn/iZLw2p4/KzIv7bZvfymEJYbLigRXIE+IERMYwCRpWaRqAvK/jBctLN4CZfMZLadQR7qSFgS5fR4/TJvXiaQeN5MCNRVYfSS5/OMmA8XJmq/uacqtXq9JIIMH9WImqnGYINFgZQFlGRXAPgbfbV+O4W1U/wvLu75g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xFK4RHnLAjQHVWUvHqkFu2vS7CIXRhd0H5rnvdsXyEM=;
 b=ENw4OAG0Fa+eIyCyOIpi8hEGyRQWcnsC6svhfDXBWJgoHFTrziPkqgsqEsEU03XsSNyDBQGI9ZLepZogk2AdVpsFw3gX74ZxcPNoHL11KeIGyWioXRxXLvIaZUSGH2n/w6P3bR21FJgVG1ZoEOM5nHO7i6MD+QV1QYy5BlVLMIUfzOkSsM9ljhLwzAGwQ1h0fb1ZpPseQtVaEhVJvGnXcJlMj602BBeDZW4/fI2PCDBTLv/zopDskmZlpIJk9nigNUQe7x+qNOTLS+Yi+0ZewMAbMjQWgBjT5XB35DNnNZNUZy4FM3PCjNj847lO9r/SLSkIofdyxrqdK2lTd+pFSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM4PR11MB7253.namprd11.prod.outlook.com (2603:10b6:8:10f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.19; Wed, 22 May
 2024 17:01:26 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7587.035; Wed, 22 May 2024
 17:01:26 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Anshuman Gupta
 <anshuman.gupta@intel.com>, Badal Nilawar <badal.nilawar@intel.com>
Subject: [CI 6/7] drm/xe: Stop checking for power_lost on D3Cold
Date: Wed, 22 May 2024 13:01:04 -0400
Message-ID: <20240522170105.327472-6-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240522170105.327472-1-rodrigo.vivi@intel.com>
References: <20240522170105.327472-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR11CA0037.namprd11.prod.outlook.com
 (2603:10b6:a03:80::14) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DM4PR11MB7253:EE_
X-MS-Office365-Filtering-Correlation-Id: f6676cbe-05e1-4ff7-5fa9-08dc7a80d142
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+Mssx2PJNV1dpsfsA/+pOiNpqI+Qz0Bma9CyFfNiUDloyeyU3evVIUUqbB6D?=
 =?us-ascii?Q?RpHljTWS9wSvQUvylZjZFLc3cwTLRbsefmw1OJM1jwJCh2wxIaH50jo5pHA9?=
 =?us-ascii?Q?kvQ7IBDIqFiChdVUC/UX22Mzpdhqh+KcqkPt1qluX2FfvitIMLsAYWKPv91T?=
 =?us-ascii?Q?+vLhYjraH5HQYWBfzWlNaRpQ6Fg/QEdKMtxonXEr6mi6eXwZrcaPV4Dx9X3F?=
 =?us-ascii?Q?45tmztLGaBOaTNuVhl3r+NanFVC5CgP5uDno1c1nhBa81W6pNcUTxHIFHtBq?=
 =?us-ascii?Q?PTSy/1FD9hdPEPme0bmLPoD+XgCh2u9QteRkrmTodFkXPzrlxXAJm0lVPAeP?=
 =?us-ascii?Q?LWAP3+7z52RS/QYE1R0Fr0JXBPeZi+plulnwcxn5Dg/x8LHsplYBLrjQTAsQ?=
 =?us-ascii?Q?1CIFDkuau2PzvL/OgPOqmBxEjjHgn1ZTR3aOMQwp/anjsNi7MGCbiBmXKO5f?=
 =?us-ascii?Q?89fqZK8NArrfs4mxFSCvnj6ZQAHzLUu3BG79WvOEzFvsjWt+NJt3Hr2Yuq8/?=
 =?us-ascii?Q?j8gxlMkEGaGnSsIbkKCD1d0/xMmAPeK/0jFUvpwO7vQQtg9Cj5r7E7BbH4w9?=
 =?us-ascii?Q?XBtYzuwFE+fASPqdRADMmuVTnxTVFQqm9XziKudeAZEvim+XZhT8lxvjt5Au?=
 =?us-ascii?Q?xJzLBfr8oVf4nWKmsxCXIwllW2XmmoW6zsHbKiYGQ/inAuFGj2soEW1OIfkm?=
 =?us-ascii?Q?2Pp+2Nu8Pntsc4j/YNjUNXktYtBh+3+7v7tc7Wy/0q7/QRwMmIugHjCrwlTo?=
 =?us-ascii?Q?sUWz6NJVaXH4cbaSXe7fnuQ3SG9tJY/mruMxXA5SOcPzoKRftcfOJrEIqv8Z?=
 =?us-ascii?Q?1e6aD9owEfC+OmdZg3TTLJtEOyek5hn2PSN+BlWohBC4vZ9/pFIWGL/ep/uw?=
 =?us-ascii?Q?89Y5+DZBwVQSkbs0uwOxb23mwWFnYdHivLF5G0lSbsDjTn4IhGZIjz18DRRB?=
 =?us-ascii?Q?/M/u5ZSv3qx5TFp7slKTWuMspbMBw+8voF2S9iaMxaBE4hcmAK8ZTq/P5TJc?=
 =?us-ascii?Q?v5R15PpXsyZnBr+MenZUsMRHjAeH9wpOg22CBZn5IFBSAU0/WS6xDq0pWSfU?=
 =?us-ascii?Q?U6DZHjcUzgxdF40/n/DMaeTWz1jb82NHm9PD+kfyNdYH7ESWxpY+rCENnipk?=
 =?us-ascii?Q?IckmclpGwDburGXmUPkbNfH2ptkCtn9vAEBF7YelceAoFdc1nXzM4nYrlaI6?=
 =?us-ascii?Q?kLBqjaESA/qBf+Fd2+ujUgT582E4cXMXtv31XrZcXOAaIqgqsAGsSQeX3nXU?=
 =?us-ascii?Q?OJk9OBf09EA0kMhwfHihGTrq5EcG7zu8MIvfAnn09w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nt7jt6Qu6EL8vGm6HxFewI/4k5QI8BRUPw/64HdIlhjCX8ZE517YJNfL51Be?=
 =?us-ascii?Q?7PSMMjHb16Fmuro4scCnzPpz5IOdVi46vOW9NbidCrCCtlxNg2ywzLo3y54Y?=
 =?us-ascii?Q?8JtBf1l01JP6yeRt64GbNqJoU+3423yszIbCRdn/G4oNT6FdQh8f82EJQFyS?=
 =?us-ascii?Q?vr07FFGaIleze4GljdRjsDZ7SCwdG7qUu/O3TAzSnNUMJsHO21dVcAuBjEmz?=
 =?us-ascii?Q?oMfVOqQbC3gmVMyTJ/mqC+z1Oa4VteRSFFF2P9GRo0OCLsHt/ZGErReBd0Nb?=
 =?us-ascii?Q?+96Q1xMEKx9LHahryCfdYvWU2IaKuRuJ2Fb0osLhx9v+SnHekmCjEN/9Gfz2?=
 =?us-ascii?Q?5tCLY5uHRMlZd0WnByGnPW2S+PmmhTP9nZ4kZELTSXhRQxxmH/O5bSHu37Ct?=
 =?us-ascii?Q?k97d3gUX/sMgQUc/b6qXjJY5gMydvOA3/b+t/xXvG4SMdTppfPPI0m2m3SQv?=
 =?us-ascii?Q?tDflvUeZrl3Unaoj/7kP5q3OIWFKKDrfkhLA+9IuLxLkkLJ9V3Vak2JvMiI4?=
 =?us-ascii?Q?0pNS/UBISb2qIIfX2To4LdmjgRH03O/psKhy1DMqKk+dPf+8mlj+riYZ1Lzx?=
 =?us-ascii?Q?Hg560lswif2rMtyBwULBJ+ZCoeex+BWNxG8GS6sO98BLmGxViCWq8eiSkLgR?=
 =?us-ascii?Q?e9DiqpgkaXjJzaFmFeMACWkYJLtY1FQDxEr0JV3kai6K0SoFFEvZRUuh7UyF?=
 =?us-ascii?Q?AFELqXa0b/dT26cUj309SA1uQvjKQcya033UB1KP7rXUJ0aa4x9tNFsxI63M?=
 =?us-ascii?Q?bqbDqdTHRhvGH0e4uY2ZzkZUOwMMud013I69Ih60vTidu4pCFGAfXdTi3GjX?=
 =?us-ascii?Q?feywqxDL7Zy6e39t4KWTVBnJEBY7a1y7BkrQOGec6xoXDRwpHASEczWo8Lxz?=
 =?us-ascii?Q?iOYbYv+Y7rJdNtlRlnYuGy91gU1SH/Jc5Ubss1Goj69KsQ+TmaZSLsLtM/jl?=
 =?us-ascii?Q?T5Duov6ZIRWBR5CUHnrcC50sW7Soum+F5V8DF40KBtG0M4TGj3yYl/Vv8xiG?=
 =?us-ascii?Q?E6vdZJZ2XmY79nAy2fidSv2W82oJf/hWHKWqLoXDm2cOwGaaettWulNB2CYR?=
 =?us-ascii?Q?ngwEepiJ+EsrhtJtUvl0QnrGKwDylaCR0JfkuXDOE/5SHRp+OuhpxPutjHzO?=
 =?us-ascii?Q?FS6813lI2LJOWFpIpXYdp9FURB2BEXKhL+Cr3Cjy4CobKiAxzx7D/81fyUyj?=
 =?us-ascii?Q?GapqN8gbZeADil0K8iIekTCLSZCLmOr4u6t1o0BFBDX3CcRvKY9AGHloWSNw?=
 =?us-ascii?Q?Zu5eFLJm9TgHfQbWO52Ric1tDUABFIQ6NERlYMqLC0N7vzD6vNoGqSit9wWr?=
 =?us-ascii?Q?E/Nu6IHzsJEBBejnq7+vvdZOvCz53AhXV9mHPYpc9/d6LlWqfjerCDstlu3R?=
 =?us-ascii?Q?qZb9lKzf2dH5jUW0efnOEt+QUHZNHnf+UsCKtmYumaIPh6/Qdh6LT/tElN5D?=
 =?us-ascii?Q?LaMKljzMMdQUVYqyPtqB4OEOzlOa28Gqro3DIfDNouOd8YvL3jdn+vtmxLtC?=
 =?us-ascii?Q?HEk9d6EhCmOWyukQi2WXXxYt3fvyKZCWojKiZ71/LjH3bgaSFpSokjO15mn8?=
 =?us-ascii?Q?IqVxo+Co5FzVn7P005eW40ZmvficBn2phbfHWWi6dr25w6N/Z5TMf35DwTw3?=
 =?us-ascii?Q?mA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f6676cbe-05e1-4ff7-5fa9-08dc7a80d142
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2024 17:01:26.6996 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JMYvY1hpwUtOQ3fXEPQ9u4R44mzfzUCsQAZ/th4Vw/b9blhjo+6bb0rO2PFBBGR66PjHWnKh/N57LAVQJC7eew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7253
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

GuC reset status is not reliable for this purpose and it is
once in a while ending up in a situation of D3Cold, where
power_reset is false and without the proper memory restoration
the GuC reload and Display will fail to come back from D3Cold.

So, let's do a full restoration of everything if we have a risk
of losing power, without further optimizations.

v2: also remove the gut_in_reset function (Anshuman)

Cc: Anshuman Gupta <anshuman.gupta@intel.com>
Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h |  3 ---
 drivers/gpu/drm/xe/xe_guc.c          | 27 ---------------------------
 drivers/gpu/drm/xe/xe_guc.h          |  1 -
 drivers/gpu/drm/xe/xe_pm.c           | 12 ++----------
 4 files changed, 2 insertions(+), 41 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index bc97990fd032..8e7048ff3ee5 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -431,9 +431,6 @@ struct xe_device {
 		/** @d3cold.allowed: Indicates if d3cold is a valid device state */
 		bool allowed;
 
-		/** @d3cold.power_lost: Indicates if card has really lost power. */
-		bool power_lost;
-
 		/**
 		 * @d3cold.vram_threshold:
 		 *
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 90ecd7073d3d..8c01f3eddd5a 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -1023,30 +1023,3 @@ void xe_guc_print_info(struct xe_guc *guc, struct drm_printer *p)
 	xe_guc_ct_print(&guc->ct, p, false);
 	xe_guc_submit_print(guc, p);
 }
-
-/**
- * xe_guc_in_reset() - Detect if GuC MIA is in reset.
- * @guc: The GuC object
- *
- * This function detects runtime resume from d3cold by leveraging
- * GUC_STATUS, GUC doesn't get reset during d3hot,
- * it strictly to be called from RPM resume handler.
- *
- * Return: true if failed to get forcewake or GuC MIA is in Reset,
- * otherwise false.
- */
-bool xe_guc_in_reset(struct xe_guc *guc)
-{
-	struct xe_gt *gt = guc_to_gt(guc);
-	u32 status;
-	int err;
-
-	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
-	if (err)
-		return true;
-
-	status = xe_mmio_read32(gt, GUC_STATUS);
-	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
-
-	return  status & GS_MIA_IN_RESET;
-}
diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
index a3c92b74a3d5..af59c9545753 100644
--- a/drivers/gpu/drm/xe/xe_guc.h
+++ b/drivers/gpu/drm/xe/xe_guc.h
@@ -37,7 +37,6 @@ void xe_guc_reset_wait(struct xe_guc *guc);
 void xe_guc_stop_prepare(struct xe_guc *guc);
 void xe_guc_stop(struct xe_guc *guc);
 int xe_guc_start(struct xe_guc *guc);
-bool xe_guc_in_reset(struct xe_guc *guc);
 
 static inline u16 xe_engine_class_to_guc_class(enum xe_engine_class class)
 {
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index a2f5a1b11cbf..de3b5df65e48 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -404,15 +404,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 
 	lock_map_acquire(&xe_pm_runtime_lockdep_map);
 
-	/*
-	 * It can be possible that xe has allowed d3cold but other pcie devices
-	 * in gfx card soc would have blocked d3cold, therefore card has not
-	 * really lost power. Detecting primary Gt power is sufficient.
-	 */
-	gt = xe_device_get_gt(xe, 0);
-	xe->d3cold.power_lost = xe_guc_in_reset(&gt->uc.guc);
-
-	if (xe->d3cold.allowed && xe->d3cold.power_lost) {
+	if (xe->d3cold.allowed) {
 		err = xe_pcode_ready(xe, true);
 		if (err)
 			goto out;
@@ -433,7 +425,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 	for_each_gt(gt, xe, id)
 		xe_gt_resume(gt);
 
-	if (xe->d3cold.allowed && xe->d3cold.power_lost) {
+	if (xe->d3cold.allowed) {
 		xe_display_pm_resume(xe, true);
 		err = xe_bo_restore_user(xe);
 		if (err)
-- 
2.44.0

