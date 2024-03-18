Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 229DBC54E58
	for <intel-xe@archiver.kernel.org>; Mon, 18 Mar 2024 19:04:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8E6910F85B;
	Mon, 18 Mar 2024 19:04:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JeRcTM3C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C617710F85B
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Mar 2024 19:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710788657; x=1742324657;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=kl71OR5N9BtYvKa8eqL4WI7sgGybFfd6A9jF95NXiF0=;
 b=JeRcTM3C6QMEupF9K0tTe8V7LGj4Uagj4E9ToN0WeMdTGy+xj2+Bs8eG
 JsZkBhZbwdxGTarG3nstlVmdXvgOjqm0L11gUa3aNzbJuI0SmpnUA/0i8
 7svQw/MHCkUu62qBPyme6UNR0K3vvazGNxh20HZTuo4Ogl38WELq31ZV4
 OGHahGVmT2v0YA/IRMCB5qZqS6FenHmJGjdMMjZ7YXGxRqxhtqbP981qN
 T8kE7rKRsHu0fyXL6/IrmF+VHEs6Mr0R4WHcGqfGwy7dBPxFv7Z7/rUBM
 /MJMeTS2hZskkeYmON8VydZxrzCksKbTNmJ7TdTfidlh6xaQG+I08U2tb A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="5483517"
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000"; 
   d="scan'208";a="5483517"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 12:04:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000"; d="scan'208";a="13456557"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Mar 2024 12:04:16 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 18 Mar 2024 12:04:15 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 18 Mar 2024 12:04:15 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 18 Mar 2024 12:04:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WA3JHH8oxM35I+dBdt1Hon0CKvTqEZDvTRokMXeziAGIU2uYMtyCYpfaZcxMrmfNTDD6UlRzlYgdnVFeb+vwvQ+r1pq0sK1ocytsK1f0fxhCOuzZqsYLi0u+ddSoX5wbS8eaFI25uFcsPzt37un4Qm7YhWUpCSvoZ9uhX8XuwRX2eyJa0Srf/DtM4JeeVIeb3LtZu5cxbBzkpTmOv/kp93vahQZyJSq1gaaZd9bWiezb7fnEJoc8BQ988lNdetXZXoF4WfvzUcJ5ljGNYTY+Mf1FEEEZUPxekP+r29UuzqJHZtPhomROxV22F5yX9FZiRmN0E31Znn/lvsFNv29DQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zBYl7rMZdyyn6fdpgSRChdN5Vyw3dJRLKkyPLvr2W4o=;
 b=Gi33r2LoA8zJ3ro2V//Cmr+9ta75OLQEf8De0dewd5eK0JXXnmMunllJxiTA6cQuc0iiPsIYpXO58rJMz1TMdt8G5ou/IUnon1IQTumacU2pYHDoWMwJR6dDxaBazD9Axzm63/PqdTvV280OOQ1CiWk03NwNUyC08t3LqIyyZym5rwMZBVq8YJU1qC3Am7mY//NhAYe+X/TbgpBOq09wGjbq+KOEtX72gtKrBx8M0oxPxqfgzzy4zThM79bGThcYOCPsFDAROpdIa1PRxQBp40SHAQ1LfFR8eytGUMTbP773PLEioJ8MsAzBocnFRcmjMXUXHaJb6htAErr1tGAoFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by BL3PR11MB6434.namprd11.prod.outlook.com (2603:10b6:208:3ba::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.11; Mon, 18 Mar
 2024 19:04:12 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7409.010; Mon, 18 Mar 2024
 19:04:12 +0000
Date: Mon, 18 Mar 2024 14:04:10 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Anshuman Gupta
 <anshuman.gupta@intel.com>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH 1/6] drm/xe: Introduce a simple busted state
Message-ID: <emxojo4vfvkrcz3pphbeshm25w4nhzxb7n5dlregdw47raj5vj@pstldfn36rya>
References: <20240315140108.217862-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240315140108.217862-1-rodrigo.vivi@intel.com>
X-ClientProxiedBy: BYAPR08CA0068.namprd08.prod.outlook.com
 (2603:10b6:a03:117::45) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|BL3PR11MB6434:EE_
X-MS-Office365-Filtering-Correlation-Id: 44141c97-1c82-4443-8eae-08dc477e32e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TPjuj8g3ewISW7BckgU4qHIooxbkpIuzO0RtCi5Eq/TS7T1WfN2DJiPZyptuzVVN5+ynoTeBfgxxy2ICOYelquVgq/SYxl6hA3o4x1S1Y4Zwd1rCx1vK6n/hsZqD8CQXmmhcJcTTPK76cBjMd9inZHVwwWpZkL63n21TH5R73B81IzTWMRSaDmfxpNrb5ZFO5KjZUXB+UraoYt6gQSw5AgzQXvD5JUmSI8V6INnt76b3s4H+0/GGOUb1XmNWJLYdfW6oN/NRRFcnetyPnvL6OjkY9+KQw9pHDiIdVNdryAVOLRkjZapHnsAsapHMAtyAXM9yTI2uyok2DYVuDfLeiOoqbUFUrB8Jih2FIi7yKnCpnrrGbxvK5MD6b/8p/P/pRTThXJ4LBumL8JJ80/8jQTsnkJ/mQx49FPlGUt0js5TW7ttI0UmRMO6D8ZtyKd74uIfKpG5+hc+yN7aBYpIrTkAqBjpQr92QjpVvOQYOnzcyy6bG4Av+6BdB4mqTwdCs61kBgPg+5S0chDQ62ZLL+gP99BCvQYlV7hq1SLjXGsxKYVK8i8VLnkxDRDjo6qDPrzPrpnM4CrwfU16jky3tSefB83EuZW8j1Hbz17xTK3o=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nhLHqJ+gD6kOp+N8wwIRaZwbfHfxXQYBjOvmr35VpuHoXdKdOle9EhMpJQ8p?=
 =?us-ascii?Q?S14VzafdJv0YOY3x8R09Yn9eElu4fjKuzqL7k9nJmlqOw0Lbn8Lt2KvAts66?=
 =?us-ascii?Q?OTQVKKkOUgonz1J2IGZVOOND70/X6nEXIZxjnAFGlS794Qog3yvGxZ8KO2dI?=
 =?us-ascii?Q?rhNmS1256WWWoVN2OWjE5MkP2e5iVhmV2pzCVsSX4v+TwvNxMkOd+Ml28yXR?=
 =?us-ascii?Q?ZBgWFoWBSEsY1TEBA/KihGbSySZZjgYUoiX4CsUTOsflY19GDSJIbk97iOwR?=
 =?us-ascii?Q?JkOKGVu1aQb5qwhehU4vlVTzN/V7spKmqaDXnrgNuP0JsAE4ct9APTjOUD6b?=
 =?us-ascii?Q?g/VpgCjzcAOyr0OIpmISQYnM868Rt4VGsx2TKXoSrYCzBpbum8H1eJC84mse?=
 =?us-ascii?Q?ShEE3dTm4EOv1l68Zppu+bvTR5f2ejHD4KOkBP/630OrB1AMAdxTuX6aVK9V?=
 =?us-ascii?Q?HFw8mp/1twkVY6fA1X8fo+VyaWOZCyPNAmPZvQHPoQtpOfpca22yMe9+/Fuz?=
 =?us-ascii?Q?Am1Gg+maHKupblAuwAnJuBh+/NNuubZlTwhP/4qFHnkmPIUpBAloL7589Beq?=
 =?us-ascii?Q?qSFhEw1rM55RYk3p67RwPBGahPBMQfopC1idwuTtES9txn/JWHDh/9vRDYYG?=
 =?us-ascii?Q?MnN7EWDWbu6xIC13kBPmbYrmGOeoruLEslS7TkEMzTm8AeVusBr9ilE3MQkN?=
 =?us-ascii?Q?oOZ4aAo4EpQXdp7XEcGZDXOHfCW7VkAywkSMgGPRYxU/VnJkFde5GIcBwJsv?=
 =?us-ascii?Q?863aMX0WSMlIBiDn0TRoE2ZMN28kf7Iu6dT1epecQVwjkACXXWQQOZDRD9gz?=
 =?us-ascii?Q?g+1DCDXjTAQfDa+w5hopQlqEiC6tkmwv8Mj2CNGGdBnbUGuqws7d1en/IZcY?=
 =?us-ascii?Q?8vdq1xySM+OPj1aHxLSvn8YoYbycWPYgRs4qVuUr8nSx7Alw2J7LZOsYkOyK?=
 =?us-ascii?Q?70ILmGK0fEMsI9AXUd46PPFcb3aRueGsdpMFVU6b7/DGXS2aDHe6KVCiKiBm?=
 =?us-ascii?Q?9ELzyhaqyJBcI3iCehVIF/zz0H1//n9QZBp6kKoQKfzzXKy8gawaOdlx0GOs?=
 =?us-ascii?Q?ud7hN4ELKByedE+xWdSl2zYmcQjhgi4T8QgcykovaxeSg6RiSItUOgyADHGz?=
 =?us-ascii?Q?TsH5J+ZpX9Ux7Ox5L7OBG6FeHQ49zyUw7c5mmxuYFLx3pVpTcYjgP+GYeCzY?=
 =?us-ascii?Q?CNCvAsD9xi96aDE0R3j121dNHAR+MRMsJUj9pwvif63u7fiG1u7x1Sk5AsB/?=
 =?us-ascii?Q?Epj2jBDT61bmJS+BFPH7XtyDOg+8Fx3OCT/CgUDFdaDQZORDotq+84LkP60D?=
 =?us-ascii?Q?HSwDUbhCbVT7UGgqEvGc6rVFH3oqqOfyF38MpStPdEt/kBSY0fRzQ0Psju1+?=
 =?us-ascii?Q?qJslykMX0vlgBgrTno+5Gct9Wgd3N+Aq8QbSrdZdnszT3Tz3X1zteU7HkeR9?=
 =?us-ascii?Q?lszyqmZGQnDBwpOjPurhWXeDsom0CNrPrSWA7A6I6BVJn/LyYNUr23LoerNU?=
 =?us-ascii?Q?q42o9ARjSSo40rn2Gryl0k7cdSTvA8eNKPxoZKyMpBdUmLoYOzimRPw2R2Me?=
 =?us-ascii?Q?3y1/9bWxMRUxNMykXuCuDf1o6ZNQ1WB4oyBx9AhaeDtmcz+tj0KYOFBXBqkw?=
 =?us-ascii?Q?Mw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 44141c97-1c82-4443-8eae-08dc477e32e9
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2024 19:04:12.7429 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cZntt5fOOK4icMhi9lyrmhbqgrWH84m/0uzDG4zURyr661fTkq/a1O7iQcrb6iU3FpGQ2spaDGTfqQVLTCqfjjob3YaldNsB8dIWsmLtG1Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6434
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

On Fri, Mar 15, 2024 at 10:01:03AM -0400, Rodrigo Vivi wrote:
>Introduce a very simple 'busted' state where any attempt
>to access the GPU is entirely blocked.
>
>On some critical cases, like on gt_reset failure, we need to
>block any other attempt to use the GPU. Otherwise we are at
>a risk of reaching cases that would force us to reboot the machine.
>
>So, when this cases are identified we corner and block any GPU
>access. No IOCTL and not even another GT reset should be attempted.
>
>The 'busted' state in Xe is an end state with no way back.
>Only a device "re-probe" (unbind + bind) can restore the GPU access.
>
>v2: - s/wedged/busted (Lucas)
>    - use unbind+bind instead of module reload (Lucas)
>    - added more info on unbind operations and instruction on bug report
>    - only print the message once.
>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Anshuman Gupta <anshuman.gupta@intel.com>
>Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>---
> drivers/gpu/drm/xe/xe_device.c       |  6 ++++++
> drivers/gpu/drm/xe/xe_device.h       | 18 ++++++++++++++++++
> drivers/gpu/drm/xe/xe_device_types.h |  3 +++
> drivers/gpu/drm/xe/xe_gt.c           |  4 ++++
> drivers/gpu/drm/xe/xe_migrate.c      |  6 ++++++
> 5 files changed, 37 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>index b0bfe75eb59f..d02e59fb49eb 100644
>--- a/drivers/gpu/drm/xe/xe_device.c
>+++ b/drivers/gpu/drm/xe/xe_device.c
>@@ -142,6 +142,9 @@ static long xe_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
> 	struct xe_device *xe = to_xe_device(file_priv->minor->dev);
> 	long ret;
>
>+	if (xe_device_busted(xe))
>+		return -ECANCELED;
>+
> 	ret = xe_pm_runtime_get_ioctl(xe);
> 	if (ret >= 0)
> 		ret = drm_ioctl(file, cmd, arg);
>@@ -157,6 +160,9 @@ static long xe_drm_compat_ioctl(struct file *file, unsigned int cmd, unsigned lo
> 	struct xe_device *xe = to_xe_device(file_priv->minor->dev);
> 	long ret;
>
>+	if (xe_device_busted(xe))
>+		return -ECANCELED;
>+
> 	ret = xe_pm_runtime_get_ioctl(xe);
> 	if (ret >= 0)
> 		ret = drm_compat_ioctl(file, cmd, arg);
>diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
>index 14be34d9f543..2c6d9b77821a 100644
>--- a/drivers/gpu/drm/xe/xe_device.h
>+++ b/drivers/gpu/drm/xe/xe_device.h
>@@ -176,4 +176,22 @@ void xe_device_snapshot_print(struct xe_device *xe, struct drm_printer *p);
> u64 xe_device_canonicalize_addr(struct xe_device *xe, u64 address);
> u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address);
>
>+static inline bool xe_device_busted(struct xe_device *xe)
>+{
>+	return atomic_read(&xe->busted);
>+}
>+
>+static inline void xe_device_declare_busted(struct xe_device *xe)
>+{
>+	if (!atomic_xchg(&xe->busted, 1))
>+		drm_err(&xe->drm,
>+			"CRITICAL: Xe has declared device %s as busted.\n"
>+			"IOCTLs and executions are blocked until device is probed again with unbind and bind operations:\n"
>+			"echo '%s' | sudo tee /sys/bus/pci/drivers/xe/unbind\n"
>+			"echo '%s' | sudo tee /sys/bus/pci/drivers/xe/bind\n"

rather than assume people have sudo/tee around, assume it's executed by a
user with proper perm, so just "echo '%s' > /sys/bus/pci/drivers/xe/bind"?

Consider this more a nit than a blocking comment.


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi

>+			"Please file a _new_ bug report at https://gitlab.freedesktop.org/drm/xe/kernel/issues/new\n",
>+			dev_name(xe->drm.dev), dev_name(xe->drm.dev),
>+			dev_name(xe->drm.dev));
>+}
>+
> #endif
>diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>index 9785eef2e5a4..2633fdfc1a38 100644
>--- a/drivers/gpu/drm/xe/xe_device_types.h
>+++ b/drivers/gpu/drm/xe/xe_device_types.h
>@@ -455,6 +455,9 @@ struct xe_device {
> 	/** @needs_flr_on_fini: requests function-reset on fini */
> 	bool needs_flr_on_fini;
>
>+	/** @busted: Xe device faced a critical error and is now blocked. */
>+	atomic_t busted;
>+
> 	/* private: */
>
> #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
>diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>index 85408e7a932b..2f29f7fa682b 100644
>--- a/drivers/gpu/drm/xe/xe_gt.c
>+++ b/drivers/gpu/drm/xe/xe_gt.c
>@@ -633,6 +633,9 @@ static int gt_reset(struct xe_gt *gt)
> {
> 	int err;
>
>+	if (xe_device_busted(gt_to_xe(gt)))
>+		return -ECANCELED;
>+
> 	/* We only support GT resets with GuC submission */
> 	if (!xe_device_uc_enabled(gt_to_xe(gt)))
> 		return -ENODEV;
>@@ -686,6 +689,7 @@ static int gt_reset(struct xe_gt *gt)
> 	xe_gt_err(gt, "reset failed (%pe)\n", ERR_PTR(err));
>
> 	gt_to_xe(gt)->needs_flr_on_fini = true;
>+	xe_device_declare_busted(gt_to_xe(gt));
>
> 	return err;
> }
>diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
>index ee1bb938c493..d7eb409e8415 100644
>--- a/drivers/gpu/drm/xe/xe_migrate.c
>+++ b/drivers/gpu/drm/xe/xe_migrate.c
>@@ -713,6 +713,9 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
> 		xe_bo_needs_ccs_pages(src_bo) && xe_bo_needs_ccs_pages(dst_bo);
> 	bool copy_system_ccs = copy_ccs && (!src_is_vram || !dst_is_vram);
>
>+	if (xe_device_busted(xe))
>+		return ERR_PTR(-ECANCELED);
>+
> 	/* Copying CCS between two different BOs is not supported yet. */
> 	if (XE_WARN_ON(copy_ccs && src_bo != dst_bo))
> 		return ERR_PTR(-EINVAL);
>@@ -986,6 +989,9 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
> 	int err;
> 	int pass = 0;
>
>+	if (xe_device_busted(xe))
>+		return ERR_PTR(-ECANCELED);
>+
> 	if (!clear_vram)
> 		xe_res_first_sg(xe_bo_sg(bo), 0, bo->size, &src_it);
> 	else
>-- 
>2.44.0
>
