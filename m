Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1316C4345F
	for <intel-xe@archiver.kernel.org>; Thu, 18 Apr 2024 14:58:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6879C113D30;
	Thu, 18 Apr 2024 14:58:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rpcv3oqI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7AA5113D30
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Apr 2024 14:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713452326; x=1744988326;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=HMffubV2KF181JMk9A3TynsBFjuSl2AbrTW07gKldEg=;
 b=Rpcv3oqIlLLP3ihwLiU95LHIxD9UVfuce5FV8Eup5WkxDievE7X9Zh+K
 zj7lYxJpu/Q8o2tRH/sFPMaXG+e20vvvXaGusgyEFCvWPfXFMEbh0ckde
 rSxYLlvXHd71GJfGYpPgpp8P+n4ijhX8uKJwlLqBqKMpIVZlLsbIKShdY
 Fj4UbUuBvc8VxOgknKTd7qguPfZn6/UoTQFhU+/AJfkhVZO8+gObE5wus
 Wrn3fUqu3s6db5dW+5kwzuTgvUwxlVnu0nD8zRXhvjHUheoYhOUFnju3Y
 ocsgs9pnRmwL2MH/662Zf4AMh0mrzYj3vlgpCXvyhvhdp8L2xx5fkt9Qi w==;
X-CSE-ConnectionGUID: JIsZebaiT/eoiRSQH96OpA==
X-CSE-MsgGUID: 5TFuDkoYRfOlNf9jSCWFYg==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="8839083"
X-IronPort-AV: E=Sophos;i="6.07,212,1708416000"; 
   d="scan'208";a="8839083"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 07:58:43 -0700
X-CSE-ConnectionGUID: HXn3aWzBQtKV87hTGtewgA==
X-CSE-MsgGUID: P9TG/ACxQKOZ1JeZ8bpvQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,212,1708416000"; d="scan'208";a="23084046"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Apr 2024 07:58:42 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Apr 2024 07:58:42 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Apr 2024 07:58:41 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 18 Apr 2024 07:58:41 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 18 Apr 2024 07:58:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S8nDgyHfPR+Vk7VPLk2tBBr7t87ob3IZc4Bed7JMku62YT2uCSRa+Z5MagidPu6gd8G8LVPxWgXvqgAO5BjSm5Pe5wEh4GAU66XmlEuCX0cgOgmCF5ApFS3t/Zapn9BekV9SDJX0c6J2fz4K3C71dcxIdg7zOqSM0c/GEHiHmEU0QLKl62GYmdQSm3ZTusb0PKc0ZkCZ+Liq1K/RX1o31ImL6G8laO39ngg+A6qDlnQiva/tFtfOgxfSIU2P5FYsRaRLGMXYVuYEz3cqJbhTRKQlHgsXw3eo5RzkYo2G3JbvLjU+tfO2llbjyPD/x4raFX5vuS9cPyU3Cpp5L3eJng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gvOAlrsz1IRiGGB12n16TTXZUKK8OV4kwNUwNdy6v7A=;
 b=U5r4+v6omFA7jdb2oDr82X4noDzC2s/+eDHe2GBML7EQjaKkRRNgRTUtB33Plx0uIrKrnovo0eRJ5TOxbDIlpNBovLu++JobzgoxAeIx/xsQWOPY7h7q/agikpu+Lh/9OlFPscxVqh0ZZZ6b4JHzww/SQNQ4Wjj/sCVVZ+RKjVzVXb9og/vGIub8HufJb25CcVbVecDlPiExEmBbv4hppC5YayWamRBstPpwOc9d4MrYs7svXa8Udx9KfGTDf+Q6hTiU15spFNbmR8iC1psBrTHJYosbdgPDQrt8hd8J3Xip0YfM8yAUcMCjyuXOGPzfamBIbFw8IvTuODjDAOWsIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CH3PR11MB8313.namprd11.prod.outlook.com (2603:10b6:610:17c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.37; Thu, 18 Apr
 2024 14:58:00 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7519.010; Thu, 18 Apr 2024
 14:58:00 +0000
Date: Thu, 18 Apr 2024 09:57:58 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v4 6/7] drm/xe/tile: Abort driver load for sysfs creation
 failure
Message-ID: <momwzdifdizlcs4njfz3orfsqczukhtvm76hcip6p76tkbg733@mc4czi325hpo>
References: <20240412181211.1155732-1-himal.prasad.ghimiray@intel.com>
 <20240412181211.1155732-7-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240412181211.1155732-7-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: BY3PR03CA0011.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::16) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CH3PR11MB8313:EE_
X-MS-Office365-Filtering-Correlation-Id: 71875cdb-613f-4258-13a0-08dc5fb7f0d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Rs/Y3xIpRkkaVp9ig5Fng3gS6aaYsiYDQEG8Udacsm9FaYEs8LBDTIzfkHJD595LlJb9eorKiEthPByG56tb8KAkWASWXdJrpksal4hlaKJNt9jF9njAJAf1mp73riFP/XR5RPwPc5M+B1CmDfYf88QnbxiEQWNkeHNqh3zfk0UoVrDVdZypnZtKGnAChfgciJ8cwSACoba1Fi9WaZVsMWby9qNL/t0STlss22H4ICBf0nj0tdh5M1nAW4wQdWQfDVijaPognU7OwtNdZGgzwRbQZhyuBY5I2bYLnoBkzNaL1t6XhTxylKnEpwafGOTqoE8ZQNUNfOhYt//7gmZ8a1Qoh30DCJX+v/autl2uUHH8amAEg5PxlciU+hzopAKqIeF+WyAYvtWSJphfojwx9MvH5QaxU93v6fao9IcXaWl1uqOeLX5NoqiOMOZGDNgfuMYy2Y4euQSzkXPOdwevbvmaa938M4bsBD2bTrjvvgNz9npCvi5M64kp18jZmQ0wr1JhwQOSv0k1PebxXUgTkBf4eMr+sdIv1vBk1nyXAJv7Ggr35vxsiELmEm6lS2DL70a1Qg1+AK1S9qO1OoOMiLizCr2om8isdK2th2a86WIim1ZshSUjgz1MN1+VfDOXoV18Ejhpypr+VfzSzALPRPsvmuJAjrXDUuJQWW3J1ms=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ux0+q8kLy5xkMLLn8Ey8h9OEpsYhk4QmdGNPvUhFUn96+vSM2IPTYGH9CTbZ?=
 =?us-ascii?Q?kqtT5SXXNruR99GDvBw9XLyrFm2vqUq+elH1FnGiYAcS5SPasfP05pEMXIKW?=
 =?us-ascii?Q?hEn1RrTQZiyouXXhHqb4gmzz/rUyBdllb/hn2gagDQx36iKJACaEDgrStjPk?=
 =?us-ascii?Q?4BieBVWkkw5mN9N5sj7uUis4+YDh9y3SGBLJtBlHtdkK/Go3cc3jZjvAnYsu?=
 =?us-ascii?Q?rs0egsRs+erIsneRu9/fg5GKvlrCeZY4kzxNcGhVO50npE3SoQY8r49d0v2O?=
 =?us-ascii?Q?6xfp49VjaIKlD/N5zxaJWiI8JHT0/V8KNvuYZkfmBodUaaxqUNGK3Ilqvp7M?=
 =?us-ascii?Q?BLzTciexm46ammCXsYmWICfBbp2JwHl98wTrjojT53e0Pyp6oS7a2sFmrLNG?=
 =?us-ascii?Q?xJax/YQDowKGm7SHAaEYz4aYUHiimhNX50lW3QwVNdKRQLPFqcyweZzFC8U4?=
 =?us-ascii?Q?c2CgulxhEt6nZuLndt/rnpeoAmlYmhKnh9XSQIbqoahheD2oWJTT9e1Szv60?=
 =?us-ascii?Q?huILpebgf05QmnJchxu7WXiIScc3FzO6JKNI5c5aT0swnsSERYt4sRBE36Qd?=
 =?us-ascii?Q?p2dNsK0fu7p2aitif0+i2BjaEo6bRq5/YWTjljt7cW7qfFjcpIIvpdwI7J/q?=
 =?us-ascii?Q?ST6WoW70GELcntcVjeu7dNYqqX+a/4SO79Vgs0eKhWbU/8D12xtthHMSv4b7?=
 =?us-ascii?Q?dKzT0fXVL+EAbQNla3esZk+zIR8wrWeZFoPNBDmjEadXnFis5tUAIKWF6kLu?=
 =?us-ascii?Q?WjMq6vfcUrb25B0H0VmP11sdV31qgvebwwG4IcUT01EWwgSK3gj38WZcZSeL?=
 =?us-ascii?Q?SSSdqLHRZljIBXIuxP7hInvgWw0W0GAx+7d3Jz328A6+bXrHA1Rg4rutDbEO?=
 =?us-ascii?Q?25KhhjFLhuS2GYY79sPybvCOfs7oUXHXu8C5Gs6LXaI6aNSxn1WiS4CMD8yR?=
 =?us-ascii?Q?CPq3w5EQrUdr8iKCEuOTAAP29ciJPrBBUMP62RSb3juaqHGrWfwc3OfIpkFg?=
 =?us-ascii?Q?zAOjEGjwGKZcCj6yecuDn83gvuuWr+in3wc9wG5rDmT0fcbP8KE9sSl9bQx+?=
 =?us-ascii?Q?Fnj27n6tFPDFLLwjDCr53HBTgE0NEcLnlMlIE7gz6Sp5HvHp8DemdkVPe7r8?=
 =?us-ascii?Q?wKRFVqibKCMCuRITUxbx3OAtnPWq6wunrtZJktdi5SVlVEMbpN+sGm+u7zCY?=
 =?us-ascii?Q?Ohc9BVEayWQIlNGIPKn1XPXP9zWjOzJxAWW45IC7JEp7PsuOYjguB5Gni12C?=
 =?us-ascii?Q?ys+GU7Qo+mn0WIjf7CPbcnk8uY/Zj0JuxeiuCneixoYzNKpLDh8eptkhXOaM?=
 =?us-ascii?Q?t9rUmdNfyNXN6tv0T2CN0k8M0wkazxdgdTYAhvpnA22zWHkvL/YQ1LKDBj2i?=
 =?us-ascii?Q?TGlCPajJ/4NB4QhyAyiOBwz65tj1VauYBKI4+nvDa2joFdQUZT0VaKaauxOx?=
 =?us-ascii?Q?vntwrUmrTwJ4RCDnWWST3PwxEu89WkUe2ZO9oDYRquPyc8zry5iL8HxuZeo1?=
 =?us-ascii?Q?OqgvcnbgajGyTq9x+Z5Tnzpvj61AC2A8rOaBKlzsKA9RS4n06pGpoi3NvDC4?=
 =?us-ascii?Q?Q/W6RkIT1B4X/AVNPLdPetIb3902amaBNRYcHnEAAWQlUxLFsNmlOO7z/o31?=
 =?us-ascii?Q?Jw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 71875cdb-613f-4258-13a0-08dc5fb7f0d9
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2024 14:58:00.5646 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GftSOWalnqoqBTdwCemx/jUbrYxD0o0wHUarF2Q/Y5U2fVFm/sRfMPc5bKtAtSbxu475iRQ40ktgSVJT7Nkr58BzaBfjnli5TlisftbiUfI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8313
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

On Fri, Apr 12, 2024 at 11:42:10PM GMT, Himal Prasad Ghimiray wrote:
>Ensure that the status of all tile associated sysfs entries creation is
>relayed to xe_tile_init_noalloc, leading to a driver load abort if any
>sysfs creation failures occur.
>
>-v2
>Avoid unnecessary warn/error messages. (Lucas)
>
>Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_tile.c       |  2 +-
> drivers/gpu/drm/xe/xe_tile_sysfs.c | 16 +++++++---------
> drivers/gpu/drm/xe/xe_tile_sysfs.h |  2 +-
> drivers/gpu/drm/xe/xe_vram_freq.c  | 20 ++++++++------------
> drivers/gpu/drm/xe/xe_vram_freq.h  |  2 +-
> 5 files changed, 18 insertions(+), 24 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
>index 0650b2fa75ef..409cf55aa8a1 100644
>--- a/drivers/gpu/drm/xe/xe_tile.c
>+++ b/drivers/gpu/drm/xe/xe_tile.c
>@@ -173,7 +173,7 @@ int xe_tile_init_noalloc(struct xe_tile *tile)
> 	}
> 	xe_wa_apply_tile_workarounds(tile);
>
>-	xe_tile_sysfs_init(tile);
>+	err = xe_tile_sysfs_init(tile);
>
> err_mem_access:
> 	xe_device_mem_access_put(tile_to_xe(tile));
>diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs.c b/drivers/gpu/drm/xe/xe_tile_sysfs.c
>index 237a0761d3ad..e1bfe0e4257d 100644
>--- a/drivers/gpu/drm/xe/xe_tile_sysfs.c
>+++ b/drivers/gpu/drm/xe/xe_tile_sysfs.c
>@@ -29,7 +29,7 @@ static void tile_sysfs_fini(struct drm_device *drm, void *arg)
> 	kobject_put(tile->sysfs);
> }
>
>-void xe_tile_sysfs_init(struct xe_tile *tile)
>+int  xe_tile_sysfs_init(struct xe_tile *tile)
> {
> 	struct xe_device *xe = tile_to_xe(tile);
> 	struct device *dev = xe->drm.dev;
>@@ -38,7 +38,7 @@ void xe_tile_sysfs_init(struct xe_tile *tile)
>
> 	kt = kzalloc(sizeof(*kt), GFP_KERNEL);
> 	if (!kt)
>-		return;
>+		return -ENOMEM;
>
> 	kobject_init(&kt->base, &xe_tile_sysfs_kobj_type);
> 	kt->tile = tile;
>@@ -46,16 +46,14 @@ void xe_tile_sysfs_init(struct xe_tile *tile)
> 	err = kobject_add(&kt->base, &dev->kobj, "tile%d", tile->id);
> 	if (err) {
> 		kobject_put(&kt->base);
>-		drm_warn(&xe->drm, "failed to register TILE sysfs directory, err: %d\n", err);
>-		return;
>+		return err;
> 	}
>
> 	tile->sysfs = &kt->base;
>
>-	xe_vram_freq_sysfs_init(tile);
>-
>-	err = drmm_add_action_or_reset(&xe->drm, tile_sysfs_fini, tile);
>+	err = xe_vram_freq_sysfs_init(tile);
> 	if (err)
>-		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, err: %d\n",
>-			 __func__, err);
>+		return err;
>+
>+	return drmm_add_action_or_reset(&xe->drm, tile_sysfs_fini, tile);
> }
>diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs.h b/drivers/gpu/drm/xe/xe_tile_sysfs.h
>index e4f065039eba..54a2ba8ba533 100644
>--- a/drivers/gpu/drm/xe/xe_tile_sysfs.h
>+++ b/drivers/gpu/drm/xe/xe_tile_sysfs.h
>@@ -8,7 +8,7 @@
>
> #include "xe_tile_sysfs_types.h"
>
>-void xe_tile_sysfs_init(struct xe_tile *tile);
>+int xe_tile_sysfs_init(struct xe_tile *tile);
>
> static inline struct xe_tile *
> kobj_to_tile(struct kobject *kobj)
>diff --git a/drivers/gpu/drm/xe/xe_vram_freq.c b/drivers/gpu/drm/xe/xe_vram_freq.c
>index c5f6b5a5d117..3e21ddc6e60c 100644
>--- a/drivers/gpu/drm/xe/xe_vram_freq.c
>+++ b/drivers/gpu/drm/xe/xe_vram_freq.c
>@@ -100,31 +100,27 @@ static void vram_freq_sysfs_fini(struct drm_device *drm, void *arg)
>  * @tile: Xe Tile object
>  *
>  * It needs to be initialized after the main tile component is ready
>+ *
>+ * Returns: 0 on success, negative error code on error.
>  */
>-void xe_vram_freq_sysfs_init(struct xe_tile *tile)
>+int xe_vram_freq_sysfs_init(struct xe_tile *tile)
> {
> 	struct xe_device *xe = tile_to_xe(tile);
> 	struct kobject *kobj;
> 	int err;
>
> 	if (xe->info.platform != XE_PVC)
>-		return;
>+		return 0;
>
> 	kobj = kobject_create_and_add("memory", tile->sysfs);
>-	if (!kobj) {
>-		drm_warn(&xe->drm, "failed to add memory directory, err: %d\n", -ENOMEM);
>-		return;
>-	}
>+	if (!kobj)
>+		return -ENOMEM;
>
> 	err = sysfs_create_group(kobj, &freq_group_attrs);
> 	if (err) {
> 		kobject_put(kobj);
>-		drm_warn(&xe->drm, "failed to register vram freq sysfs, err: %d\n", err);
>-		return;
>+		return err;
> 	}
>
>-	err = drmm_add_action_or_reset(&xe->drm, vram_freq_sysfs_fini, kobj);
>-	if (err)
>-		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, err: %d\n",
>-			 __func__, err);
>+	return drmm_add_action_or_reset(&xe->drm, vram_freq_sysfs_fini, kobj);
> }
>diff --git a/drivers/gpu/drm/xe/xe_vram_freq.h b/drivers/gpu/drm/xe/xe_vram_freq.h
>index cbe8c12fbd64..bf726bc5881f 100644
>--- a/drivers/gpu/drm/xe/xe_vram_freq.h
>+++ b/drivers/gpu/drm/xe/xe_vram_freq.h
>@@ -8,6 +8,6 @@
>
> struct xe_tile;
>
>-void xe_vram_freq_sysfs_init(struct xe_tile *tile);
>+int xe_vram_freq_sysfs_init(struct xe_tile *tile);
>
> #endif /* _XE_VRAM_FREQ_H_ */
>-- 
>2.25.1
>
