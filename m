Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D523BC0219E
	for <intel-xe@archiver.kernel.org>; Tue, 11 Feb 2025 20:10:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B0A210E17D;
	Tue, 11 Feb 2025 20:10:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YNn5ZRu9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3CD810E74F
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Feb 2025 20:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739304605; x=1770840605;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=Ova00Iq4s6gww+jiXk7XJxTS63NQnusN9ieu/GmegjI=;
 b=YNn5ZRu9jfERs4fnGlBpihPhaiJ/shPwWR2r+frIybKJmn3IB1j3vyPy
 KV6BUu/RUJk/iAVO+VDZNSjMXLOYwqxaZM0NPZxJaPp20zdO3y2Rz05zd
 9bxkIdRgH/qQgUoZAtONztlAq2Rv9/4iSquxXva2x9JtZ3gNTIYEjjI5Y
 9WtxLEU7ezavInawUs8ACk70at5H+eZHyA+d39GSjJyNSIMGBvOUq/nlV
 0pipYKz2MOUr5ls61d+JxwAVEqCzpM19FNp8UWG1+DbwHmasY0mTINSjS
 kRaLosi5A2JwEvzJVU+lnuEjIeGVwvnD4w+hK+vqPba93+zWHrJCgxxsE g==;
X-CSE-ConnectionGUID: uwIJ0a82RaK0y/UYhU6/wA==
X-CSE-MsgGUID: fevTMlDKSMmayn6Xwlw+Pw==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="50927596"
X-IronPort-AV: E=Sophos;i="6.13,278,1732608000"; d="scan'208";a="50927596"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2025 12:10:04 -0800
X-CSE-ConnectionGUID: OEVhewKWStqLm2hZ0iyzVg==
X-CSE-MsgGUID: Uc+OtDIwTDihR1yKEyGMlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="113093043"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Feb 2025 12:10:03 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 11 Feb 2025 12:10:02 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 11 Feb 2025 12:10:02 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 11 Feb 2025 12:10:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dw/lZvOYvwKDsOmtj9us4CgXKuLGd1uSFTjojEg+KlvnSH/g70aEDFKKpuzzbA+ZUy7oTV51+qA4b3H2nxij7JXqUGvByceWanR5/9W0KsO+7OLpJjwuJcwAVxqvKxTP9RPKo67cQBBA+tW7v69h9U3PTPOJme5wI2iWAwH0vPU98UzW2DC8UiVdqdKvx3H0agBkCH5vq32othxEec204RWjziOT8+fRnIZGgy8uSfazqXWsKixw9+vi42m02EZHotFrRFipcnH6SMl/bEYUCZ7HJSkynmGGH8b4updw6P7K86NtHHaoIApxkoxTNdlB+BrfHjytitMUXOWqsKWhlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MjLOACWgmL0dL8rtMxtPZ04fuS7tkcHN7kx6qVoYO0M=;
 b=m9BuiJ57G/yspe6evk9y8OhDSOcYNguoBY2zH1VNdLNj+pzEOLg2naIqmGCdUeO3wPS/AGfWqWWqOlotpR1mLNSM9+horZh2yd6wY2XE638ZclstMRlC1/I/f9+w1nVxizH88vERSetydVOrZ31w0jWOAXAV/FUrhqgKLF6J9U2kZYZ362G3yxeigiE+nWVxJI5oZTDJR649jpPhXrT0uIL54zt4Hsg9VextpQnDAGQHWxbFbCYatsyIDxt2me4TO68ri+YfztTbGzovIbHJu8XcURBTa+7vxE5+MA5JS8Kq4rBBd4BBOwkjgH4LxtzOkIapGZYNPn6DCGtI0BZR5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8282.namprd11.prod.outlook.com (2603:10b6:806:269::11)
 by DS0PR11MB8764.namprd11.prod.outlook.com (2603:10b6:8:192::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.16; Tue, 11 Feb
 2025 20:09:16 +0000
Received: from SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72]) by SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72%5]) with mapi id 15.20.8422.015; Tue, 11 Feb 2025
 20:09:16 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Vinay Belgaumkar
 <vinay.belgaumkar@intel.com>, Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: [PATCH 1/2] drm/xe/guc_pc: Do not stop probe or resume if GuC PC fails
Date: Tue, 11 Feb 2025 15:09:10 -0500
Message-ID: <20250211200911.199213-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.48.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR02CA0027.namprd02.prod.outlook.com
 (2603:10b6:303:16d::32) To SN7PR11MB8282.namprd11.prod.outlook.com
 (2603:10b6:806:269::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8282:EE_|DS0PR11MB8764:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d4f2316-ea60-4996-96ee-08dd4ad7f5f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ItBEdjOdDgSadcpfXaePROONnZs7RoQLVjfFUFJukXHzq6EjhBqPvDAnuPdu?=
 =?us-ascii?Q?EfNMxezFZ87UtgWMOhLRlveCcHr5eLI0rCprOzqOxWyjbLjICvT04ljvk5Kk?=
 =?us-ascii?Q?ZQOEkUsMuW7v0V2xWtU8JTSUUJ5YB9wGKzXhGzBwgztBZqk1K2uewJMYs5fe?=
 =?us-ascii?Q?47qpARDZ+mNHoXFSUP24nkwoXJUAEE3DV6Hq+7FMf6r4McbPQJxFDzw0TWB8?=
 =?us-ascii?Q?QCvMzgiBYayBUwSeAK9j1B4BAK1USsGJEk2yb+PXbPeLnCnwl7DkLGVMNxeg?=
 =?us-ascii?Q?lYjMQH6rvYhV+nRSM+uahUAqEq0NPkpKN/ieSXvuXwQLJ60cIBcE56onsUG6?=
 =?us-ascii?Q?RobUo8kEBMR7O1E1Pbntx1FNiwnLTn2aWAXA9CkSwhFV7ZqK+wlgi6R9/RDN?=
 =?us-ascii?Q?oP84zA7pX/VYs1mlGP4vtv3riXarHlbC4KIefovPIGyjonAsLv6POuvPADkA?=
 =?us-ascii?Q?BY18sccP+3IEAZJoQ0z5K3ECI5dZeMkwFHQJ0M5Lsw3TV8G4+LJYxlUh57DI?=
 =?us-ascii?Q?smQ1bcvDrqFYucUzoTeqM6pmN2Ituk0fxJ+rFDG48usciUtlv40gOlQnfZcQ?=
 =?us-ascii?Q?LN3fHYi7geHVOpdQoyGEcqdDs8nopTTKFbCCuHaL5GYJzBCS+dUxihez92Sf?=
 =?us-ascii?Q?p9wn/fuucXmNwh3WhFp4xLskFwujlCCZ34+awNw7FwD0b8WAX/TTXT6i1P9T?=
 =?us-ascii?Q?EeGyl7xggAyr530rQcyPYaRal1hIp1AXYCE0X20zdgkK30XiY6AbQF8TS8dY?=
 =?us-ascii?Q?Dst9Rn2SYBEEwrpqNmoQ/QEhT1CLazQrQNvAALHLoZoNV1OlJIUsU31I++5m?=
 =?us-ascii?Q?qQKM8Jx6j/noo1+Va0H0+AsUYaMDz4bMW+V3oGeYhtLRzgyv7/Fo3AIl4zIc?=
 =?us-ascii?Q?EqTVHqpDzcDVWc+o+f0fgmYRONjaWhEwa5facI+oIurml9tuuqZ0wAwi/teD?=
 =?us-ascii?Q?69v24NZF5keLvuxqhyNjhj7NrJExm2eg7Vhb+TQ2R3VFQDdWc02tnQFcoyA5?=
 =?us-ascii?Q?qJ610Jg5pWX+FSsVQn7WsCjoqyHeOR1kgD/k+dHonGsXmQE4Rd78v+Obe9n7?=
 =?us-ascii?Q?LkEnjAiy4+sULPMoXSYYFGZaT+9wl/1NQqZ4KxKkC3kwMaMmqEzSqYe5pzJB?=
 =?us-ascii?Q?pK5eU8VuUbgU7ge4mqY7r/mI5o8oa6hOfP161IFL9yYkNKQor0Bz5uGZoZlG?=
 =?us-ascii?Q?kRI1fO3nVC4mUvEOL4x+9/0LlGYPqWVB6Ov4Zs1dt/u7PtrfIeU/LT4m0i28?=
 =?us-ascii?Q?gcnQQLAQQ4yG1ntt0WQ47T8tvhcUNa3A6GyBQW7xgJtnNmyjmb8iirKr6eSe?=
 =?us-ascii?Q?NEGT6jCC2Izm5ztSJNRDjil2iWfVYi9m3SOXGtrBG+tQNOOYHk/N0d++jLCf?=
 =?us-ascii?Q?OxSZEhLR3ATOiRpkuOvd8jKgNIwS?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB8282.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YSJAxXnpdDaYAlrIQIXh7uAWPfatkJ/ipqNfXX8jQgKjNZt9oSmaqhawcvbc?=
 =?us-ascii?Q?88QSmMSPsbjqleYoWGyed0xJgoIcxeHmPHep1k/NVNML1JRagAR7NEVi5HUD?=
 =?us-ascii?Q?g0oG9WVEO6gHWDiPc8cJ/Qy/npHGu3jPy/RexAllm3HjqTYKyF7ABq6QPuGi?=
 =?us-ascii?Q?j5LEmZI9w3PNJqWN29sKpgkFgJED2PUcOfkQKkuNua/9LPWTFxNwT4c5Ea4v?=
 =?us-ascii?Q?cgLnHkltpJO/xJDQNBY7NPBWsguMsHcKkxBwGM0m6rEFJC8rss2OdiCqvmaS?=
 =?us-ascii?Q?pBU9CaQoq6pmnS7PdLx48UnaTZIK4VkgiSrWQ0WNnTvbTvIer2hRDa7lJlg4?=
 =?us-ascii?Q?lYDAJIXLieN5eRyQEc53ubI9UcVj3u7rpTPL7k2ahtXi2HJMmIxTr2M74AIx?=
 =?us-ascii?Q?RAQSkrfzLmwkms01JRrRP10JPsjXtt/NM/B8x7uwTmCzU7d7LW2vgKF9Klk/?=
 =?us-ascii?Q?i+kPj0vHIPepaJBh6P4Emu4UzAQuNvc6UHcVducdoy6OT0z6WwZNZHkmAVpP?=
 =?us-ascii?Q?dnQYmdHgsnaa5GM6d9nsctyykgFNsqdneBwrQI48It8Ek3Pt+Be5FdgWpkL2?=
 =?us-ascii?Q?ETeRnaLPHe3dNz7PRg+uygGxeu8LeltrWmcNChti08OnlEn2GC9QP2KJcSB8?=
 =?us-ascii?Q?2OS2VPg9EfegDRkyTzBAnq73t3hBuW92iymnTYBrJuYTxIQe4pJKZqoQLt8c?=
 =?us-ascii?Q?RyosdOQJ2+jFdb6SAhd0fEf5P1Izdt08L0B6RyoQZKh+k6nRXobsRCwE8itZ?=
 =?us-ascii?Q?1LbFwnIQnjfArCwozQLvC8Z3oq0dZWlIawoziTcxpPj64nCziJUqdcMgnEd/?=
 =?us-ascii?Q?mGHw3YGQjPSQ6UgWSx9pUs00rtT8ZBoaZTS4d/enYrn8eDkJjzq+gU0BBujn?=
 =?us-ascii?Q?omC0vDejLZ6yN0BVpP27CMF1pp47OmZx4syVFr3U7+BsDs8VzOLtw/wfr+8e?=
 =?us-ascii?Q?3CcRtsiW0hC/Kp6KTI+Aq1ZDMULnZ+nUQbKqGAB2BIaaip0JnoPOjF1kGWBb?=
 =?us-ascii?Q?MlVDMrb977Z2QuuTTgWo6dKY9XkD6SYLCu/XmXU35dBkAfce9LrJ4ZdmeXVK?=
 =?us-ascii?Q?nyl330mZVqG3S0dXDAmpYWViIO5Lrx5tjxLtuOej90IQTZ6x2oi0A/SH0/YT?=
 =?us-ascii?Q?xFHW73dj1wWbmWcszlW+nhMqYucetS5o/x/hs8HYThhaa4Z8gX9LBKLnC2f5?=
 =?us-ascii?Q?SFr/OLH99sSVs6KfFCbLGwPFiicDub6OAtDldnPunZJtl52u+/5A6QUUlOEw?=
 =?us-ascii?Q?OpCNEnkbDl2W+UKSY8EZIFvmYRaXXhkWz39+/8HPVrnSEEn4lriUhh0xEz5J?=
 =?us-ascii?Q?2S7KsN+EGW4L/BbADDEtkN6zKohIDJkdyRLuSMLwk1ZSMhVdYLde4hJoKUCN?=
 =?us-ascii?Q?w/7alKyH7z6UXlyLuomzAfyQs4ypb7piBRC3NO7ZY/3Q8pU9m71P6opUHUH0?=
 =?us-ascii?Q?biV9XGAVef0a1jxZIaXYjACyIw11M2H3VbMgH+cVSI1F3gTBiFCWapL5FQBJ?=
 =?us-ascii?Q?ffNG0WbB4pgdZ7Xf4R44yFtzOIJAh4A8JIqkDurGJBwbwTdexd2dAqVjlWVt?=
 =?us-ascii?Q?WEzrjkYNihr9bMymjaUCTK+wvE0KEX5p1ROF2zbRulHjnsLs+EAaYkkyFAs7?=
 =?us-ascii?Q?ww=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d4f2316-ea60-4996-96ee-08dd4ad7f5f5
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2025 20:09:16.3900 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7ba4zsiUR3D/U2wAoE6bb4OA77nvIogMqt+o1S/Ni0rIoT975SDLr5Z9UUzTCjBmrVakrdrXbfN0nlbUSvLmjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8764
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

In a rare situation of thermal limit during resume, GuC can
be slow and run into delays like this:

xe 0000:00:02.0: [drm] GT1: excessive init time: 667ms! \
   		 [status = 0x8002F034, timeouts = 0]
xe 0000:00:02.0: [drm] GT1: excessive init time: \
   		 [freq = 100MHz (req = 800MHz), before = 100MHz, \
   		 perf_limit_reasons = 0x1C001000]
xe 0000:00:02.0: [drm] *ERROR* GT1: GuC PC Start failed
------------[ cut here ]------------
xe 0000:00:02.0: [drm] GT1: Failed to start GuC PC: -EIO

If this happens, this can block entirely the GPU to be used.
However, GPU can still be used, although the GT frequencies might be
messed up.

Let's report the error, but not block the flow.
But, instead of just giving up and moving on, let's re-attempt a wait
with a very long second timeout.

v2: Keep the precision comment (Jonathan)
    Use a define for the regular SLPC reset timeout.

Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_pc.c | 26 ++++++++++++++++++--------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 02409eedb914..3b04b62937eb 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -50,6 +50,8 @@
 #define LNL_MERT_FREQ_CAP	800
 #define BMG_MERT_FREQ_CAP	2133
 
+#define SLPC_RESET_TIMEOUT_MS 5 /* rought 5ms, but no need for precision */
+
 /**
  * DOC: GuC Power Conservation (PC)
  *
@@ -114,9 +116,10 @@ static struct iosys_map *pc_to_maps(struct xe_guc_pc *pc)
 	 FIELD_PREP(HOST2GUC_PC_SLPC_REQUEST_MSG_1_EVENT_ARGC, count))
 
 static int wait_for_pc_state(struct xe_guc_pc *pc,
-			     enum slpc_global_state state)
+			     enum slpc_global_state state,
+			     int timeout_ms)
 {
-	int timeout_us = 5000; /* rought 5ms, but no need for precision */
+	int timeout_us = 1000 * timeout_ms;
 	int slept, wait = 10;
 
 	xe_device_assert_mem_access(pc_to_xe(pc));
@@ -165,7 +168,8 @@ static int pc_action_query_task_state(struct xe_guc_pc *pc)
 	};
 	int ret;
 
-	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING))
+	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING,
+			      SLPC_RESET_TIMEOUT_MS))
 		return -EAGAIN;
 
 	/* Blocking here to ensure the results are ready before reading them */
@@ -188,7 +192,8 @@ static int pc_action_set_param(struct xe_guc_pc *pc, u8 id, u32 value)
 	};
 	int ret;
 
-	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING))
+	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING,
+			      SLPC_RESET_TIMEOUT_MS))
 		return -EAGAIN;
 
 	ret = xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
@@ -209,7 +214,8 @@ static int pc_action_unset_param(struct xe_guc_pc *pc, u8 id)
 	struct xe_guc_ct *ct = &pc_to_guc(pc)->ct;
 	int ret;
 
-	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING))
+	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING,
+			      SLPC_RESET_TIMEOUT_MS))
 		return -EAGAIN;
 
 	ret = xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
@@ -1033,9 +1039,13 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
 	if (ret)
 		goto out;
 
-	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING)) {
-		xe_gt_err(gt, "GuC PC Start failed\n");
-		ret = -EIO;
+	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING,
+			      SLPC_RESET_TIMEOUT_MS)) {
+		xe_gt_warn(gt, "GuC PC Start taking longer than expected\n");
+		if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING, 1000))
+			xe_gt_err(gt, "GuC PC Start failed\n");
+		/* Although GuC PC failed, do not block the usage of GPU */
+		ret = 0;
 		goto out;
 	}
 
-- 
2.48.1

