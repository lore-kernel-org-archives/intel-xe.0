Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABEE2C4332F
	for <intel-xe@archiver.kernel.org>; Fri,  3 Nov 2023 03:48:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6457410E385;
	Fri,  3 Nov 2023 03:48:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2498110E385
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Nov 2023 03:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698983324; x=1730519324;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=NxqengtaNBqitdpIBxhxKkOtFEXiTgfxBfFcDTORht0=;
 b=BUbx5nW0vVHT9purHeBteEYtqjMYtBGLA2n58awEYHHp9zt2ZIx5Qebs
 Aezd5PqDC67JpSq4z9b1kud8u+x9PZl1qMqKxxgDoBPDemv+bFrLyORh2
 dVGho7loxnQ303xbxryvbxqrti7o4mqi+Gsdgo9w4V1qJvgFHXyq4bAL8
 rJtSU5BoxUTQDdrXNWCIMmxZ4ev3UDJpw5XsArFyWDSh4XNsPm82ZYyL0
 I3+DGqnK0KldEHbuL8vlUCvosuVJ+lO+U31XOXFMUx1e2gtZsmdPf7Rnz
 z7KBX55lhdP97W5eXxN3eZ8+uAKaKxBMe9XuFsuCnAqqYFPAAR9RubqG1 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="379273307"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="379273307"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2023 20:48:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="827360003"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="827360003"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Nov 2023 20:48:43 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 2 Nov 2023 20:48:42 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 2 Nov 2023 20:48:42 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 2 Nov 2023 20:48:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b65P5hh+dRIoAp35Y/l65YpyDHVpx7oL8otNtlfMvz+o3e0uCgszjyFRb/8JVIp/Brf5Moo88TA84CMC8IosrmUPFUeZg/DG0ryZHEa7l0E8wpecJnVRZb7JFeF4D6maStv0XbrPfVvlevlsMQY6tAVmwyhy1xyUkxuXWAxdzyJmHGVxwGj4e+ZYcK9QXHc+k/NvMzYd+ukcttKUvKtTNQz13oq3XndNZjjGT+Yk3w4LM//zPRBrYMESmiEVsmbhXYbgGuhL7FRGk3zJSETVrkgnQadbi3yS3tp2MGHoeATdUkcnLnSo/z0gMjH2TZnNOg0oGIdqFo2oegtDSX9joA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EpXXzhE1+vbDFVv+tPbXtRHsjmNi5Ik6VIsgtn3fE5c=;
 b=cWq8lmQv3FzmKUolj7Esq8qaE5B5GkBjptlhYLtniT1VTim5+OkIcLbI1obU4rEMGD1ytS7AYrVpw2gZgrXVVGLUKWeW62HiopGK67/pCUmjF3zu6V80OnRLpyGRRzAINvTDSpKj1r+qJsxjB87ydNPkaBJrlSITerMzySSTOfetxWc2ktca8uj9Z1JnFoL1AEJ1dvne37fkJl73HQ6vgb9tHbqkKcq7jO8XILR1IFnKBMD+oht5zlJFiqeL5wWHOwlN+LURKLnecIkxRKZpP9afF8p0kb3QbnWva1pQUOQQQAhGCcA8mzyOllkEewgd4U2QSGnVAqFKQCu1UQ4wfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH8PR11MB6802.namprd11.prod.outlook.com (2603:10b6:510:1ca::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.21; Fri, 3 Nov
 2023 03:48:38 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::fab8:8ece:c8fe:fc7c]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::fab8:8ece:c8fe:fc7c%4]) with mapi id 15.20.6954.019; Fri, 3 Nov 2023
 03:48:38 +0000
Date: Thu, 2 Nov 2023 22:48:36 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Bommithi Sakeena <bommithi.sakeena@intel.com>
Message-ID: <nstvbxhvjgq5jubaxkjwg7tg6munpiy73g72j3opnsfrsfu7ew@crbvetzythzm>
References: <20231102195102.4144-1-bommithi.sakeena@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231102195102.4144-1-bommithi.sakeena@intel.com>
X-ClientProxiedBy: BY5PR04CA0007.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::17) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH8PR11MB6802:EE_
X-MS-Office365-Filtering-Correlation-Id: 12bcbc43-9474-4711-5e05-08dbdc1fc369
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S36AXkEd2rAcDaPhKEIZBiPl37wCAhchribPwXK6e1iQO8QyOGUY6nEuLC5JVxxipzJ3wLYvDxPz+04u8mJ/RnzSDEepIC5uUreqd1U2mTw9wU/Spvs0LfKwD0eFv6YfWWJMCw7myiMbiGy7vbrPlxIur9edDDRw9rOq7peb9wdd7dNjJbmC7Vc05CbTNUVY6lSNIrC77SZNaf3Y9gscGqTlPMO+5OefKuq4hRQrCe0LqCCsBTqZ8Kg96HRug/YjUbhjgH2Rnvdfmaok3pPYhGBzyp49nTMjQBHWwgMmY8qQFCHA/Yg653tZAfSDmdEOyVSTw77/JItbQgRj6nkS7qfK03VuWjlL+0Exln9a4gKfuONzN7AVfzhX88GwN3LmwIZS4XW8fCnxl/4/9s681KWK62hPewPfb1/VmmYI79u/Zz8WvoZGKZFjNePYNP2SckPQcDbfcvG73r1nmhEsDV+tCnDN4E11XTbNIGtanH08QgeEW4y0n3490cEAbZlX+OdbXJdUarKH71Zp5OVCpSjKL3NbZvIIB4YQKxbIdjKp7DCw9CnAAXm2BD0qSLfLlaEVSunqWfbYj1QOK6nA3cX9Uj4kX3VZsNBTPog0jhNmJw1hhc7zWzCtkP1FKNlV
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(366004)(346002)(136003)(39860400002)(376002)(396003)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(6862004)(8676002)(4326008)(8936002)(66946007)(66476007)(316002)(66556008)(6636002)(41300700001)(5660300002)(6486002)(478600001)(2906002)(6512007)(9686003)(6506007)(26005)(83380400001)(82960400001)(33716001)(86362001)(38100700002)(27256005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?wPmnzoM05WsmPVtjbLV4QfGwpNfs0mmcUiCrCJ5/X8zV5bfYFOCdN4fG8h?=
 =?iso-8859-1?Q?0RbccJ0zgnZDZoIGTR1VTEe455CZeYWVDTY6vhyHYd7JtGWH+y4i7O4sVF?=
 =?iso-8859-1?Q?sQcb0moGn1mKVqrtuzLBKEVgqaJCRopXuKXd1CeihUkdMhwr01Bth2cUaI?=
 =?iso-8859-1?Q?Uynkw1x0AstJLH/mYNMlGWyJRYgwWe7/wlUNubiX1Rc8kTfPZBLxotpXeD?=
 =?iso-8859-1?Q?ajg5ds98xmZbbTJPRcJSPlKRfx57e61uOA3G90yDss6ikCX815MSDyVP0A?=
 =?iso-8859-1?Q?jh/zL5BzM8xNO/SrZVPAwB7KPqWA4d0A9qwCQUGsYxyB7M5gPP2xYcfxpD?=
 =?iso-8859-1?Q?vMD3Kye0keerir8Qbk13s+qitq0UZRmYpG8iTbLbrPrzcMkjNyKj/AF3W7?=
 =?iso-8859-1?Q?jM6/6/o4dbLWf9XfDE9lbgB6vvqyDoDfBkAFpWdZz06n9vXmssDHuFTzV4?=
 =?iso-8859-1?Q?zAbwzVlYhKMqnKKAZcchqY6rMdzLajPlpvbdoFPJn4L2Bzlg/8VMkyoaoI?=
 =?iso-8859-1?Q?881lbejsU+EueL0NAPkWvD6TUDz9YOG72simnRCYjD+f5PtwhKRUyC3pgm?=
 =?iso-8859-1?Q?qu5AR2Oo4UHibryvsfdhaYfzMdEuSEAeTqg63mBdYFkJO11pzOzQ+1rwhY?=
 =?iso-8859-1?Q?jDga38ZCAQgLCF8IeSDb9H5GPg5nlG3vwF4NDqirkWvkYBCJnL1/Et+JRs?=
 =?iso-8859-1?Q?XSE4X0i/JlU/Q6sqqIBsxGO/k9uLBrJ4cBPu+WIKB6hUidjgUa1dwCaYPY?=
 =?iso-8859-1?Q?eGcKw5dzfRWpIK+61yqPYo0bwrLYUN//Acojw/X8nkUSdOAjwr9/PUhrnz?=
 =?iso-8859-1?Q?vOWuRBL9AMx3xp44pM+uEYnUKRA3BNKiKN+0NQuZHqDZ9n5SMFBJ1Z0o1n?=
 =?iso-8859-1?Q?dDxms4ngFzMQNl3Q7K2mF+cRFU6ZKGHg8ZWRCf9oXQULOkxwaUgsUPlKiK?=
 =?iso-8859-1?Q?Uv9EvP8imxJ9JklQzHAJKe7CQFUMewL4PAhvJ+jxVEneTdg256TvbgpWM8?=
 =?iso-8859-1?Q?re9LE3zxYpiH8KNlRE5p4QCr8Ps8vEVujxsEQeDxZn8lpqeludqENk/B6s?=
 =?iso-8859-1?Q?W0abnBaJYkOFgM8QEW6NoOKkKDB3VLzZjYIGBY3waRWX3Vnx5icjMmyNxc?=
 =?iso-8859-1?Q?pz0N7sSY0K9uxppiHJifNVIitGH4H450YwNE0p8DOaRTyNjAbI3x+e/8pB?=
 =?iso-8859-1?Q?NxBszLAnYOpNH2j4dvvZIFSIfJWxHlOrevUrG76k3u4RYk7XCz9s9CD7XD?=
 =?iso-8859-1?Q?SZNxfxkpQ//WfciI8GrlxWekI65Q0qZ+3fllwliJ+jFuKVNnGYtUh7QlUX?=
 =?iso-8859-1?Q?Ufb0vzb5xeM0rPp89te4NaKmdbOcjVoACpWEsqv27AWy64PiyJAtb5dQkk?=
 =?iso-8859-1?Q?3JWUt9AlJVSJLC8SR8wyanGxKOyBZ+oXBkav78gKGycuSRWsX94dPJYNPQ?=
 =?iso-8859-1?Q?jh1z8BH8rdraVYcx3Q3bLVZGXE6I9MhfbRx7JJy345UvG7Q5zt7YZKQKPF?=
 =?iso-8859-1?Q?4rDfX6xgIotIZNuMZTVT48GfnEqR3b3Gd/6lZ9uNi4laIOm6Izw4TFODnA?=
 =?iso-8859-1?Q?GmCLNXKxNxd/0z+fJA8SuvT3bGM9iuTacfXwh/twbZVSruNC18OPMF7/v4?=
 =?iso-8859-1?Q?jhMHVM3EuGSZ5wZlzBht7TTXfyi6LFSrycmBH8xCf1r6M04EgXrJRwQw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 12bcbc43-9474-4711-5e05-08dbdc1fc369
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2023 03:48:38.5509 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1zXlm5RTDHOb38yriaTvRawDPuuumxAmhJOpSPLexie29AMu5oBGlRbvg6dR3+Tck+E3hb812BdC80f3UYgoija8Yrax5FofzpAa3aXoBxU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6802
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Encapsulate all the module parameters
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Nov 02, 2023 at 07:51:02PM +0000, Bommithi Sakeena wrote:
>Encapsulate all the module paramters in one single global struct
>variable. This also removes the extra xe_module.h from includes.
>
>v2: naming consistency as suggested by Jani and Lucas
>
>Cc: Jani Nikula <jani.nikula@linux.intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Signed-off-by: Bommithi Sakeena <bommithi.sakeena@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_device.c  |  2 +-
> drivers/gpu/drm/xe/xe_display.c |  4 ++--
> drivers/gpu/drm/xe/xe_guc_log.c |  2 +-
> drivers/gpu/drm/xe/xe_mmio.c    |  2 +-
> drivers/gpu/drm/xe/xe_module.c  | 29 ++++++++++++++---------------
> drivers/gpu/drm/xe/xe_module.h  | 23 ++++++++++++++++-------
> drivers/gpu/drm/xe/xe_pci.c     |  6 +++---
> drivers/gpu/drm/xe/xe_uc_fw.c   |  6 +++---
> 8 files changed, 41 insertions(+), 33 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>index 8341acf66e5f..5e682ba68ec4 100644
>--- a/drivers/gpu/drm/xe/xe_device.c
>+++ b/drivers/gpu/drm/xe/xe_device.c
>@@ -223,7 +223,7 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
>
> 	xe->info.devid = pdev->device;
> 	xe->info.revid = pdev->revision;
>-	xe->info.force_execlist = force_execlist;
>+	xe->info.force_execlist = xe_modparam.force_execlist;
>
> 	spin_lock_init(&xe->irq.lock);
>
>diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
>index da10f16e1c12..74391d9b11ae 100644
>--- a/drivers/gpu/drm/xe/xe_display.c
>+++ b/drivers/gpu/drm/xe/xe_display.c
>@@ -45,7 +45,7 @@ static bool has_display(struct xe_device *xe)
>  */
> bool xe_display_driver_probe_defer(struct pci_dev *pdev)
> {
>-	if (!enable_display)
>+	if (!xe_modparam.enable_display)
> 		return 0;
>
> 	return intel_display_driver_probe_defer(pdev);
>@@ -69,7 +69,7 @@ static void xe_display_last_close(struct drm_device *dev)
>  */
> void xe_display_driver_set_hooks(struct drm_driver *driver)
> {
>-	if (!enable_display)
>+	if (!xe_modparam.enable_display)
> 		return;
>
> 	driver->driver_features |= DRIVER_MODESET | DRIVER_ATOMIC;
>diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
>index 45c60a9c631c..27c3827bfd05 100644
>--- a/drivers/gpu/drm/xe/xe_guc_log.c
>+++ b/drivers/gpu/drm/xe/xe_guc_log.c
>@@ -100,7 +100,7 @@ int xe_guc_log_init(struct xe_guc_log *log)
>
> 	xe_map_memset(xe, &bo->vmap, 0, 0, guc_log_size());
> 	log->bo = bo;
>-	log->level = xe_guc_log_level;
>+	log->level = xe_modparam.guc_log_level;
>
> 	err = drmm_add_action_or_reset(&xe->drm, guc_log_fini, log);
> 	if (err)
>diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
>index 0da4f75c07bf..9f5a7e1bd695 100644
>--- a/drivers/gpu/drm/xe/xe_mmio.c
>+++ b/drivers/gpu/drm/xe/xe_mmio.c
>@@ -73,7 +73,7 @@ _resize_bar(struct xe_device *xe, int resno, resource_size_t size)
>  */
> static void xe_resize_vram_bar(struct xe_device *xe)
> {
>-	u64 force_vram_bar_size = xe_force_vram_bar_size;
>+	u64 force_vram_bar_size = xe_modparam.force_vram_bar_size;
> 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> 	struct pci_bus *root = pdev->bus;
> 	resource_size_t current_size;
>diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
>index 7194595e7f31..1ea883f48c63 100644
>--- a/drivers/gpu/drm/xe/xe_module.c
>+++ b/drivers/gpu/drm/xe/xe_module.c
>@@ -10,39 +10,38 @@
>
> #include "xe_drv.h"
> #include "xe_hw_fence.h"
>-#include "xe_module.h"
> #include "xe_pci.h"
> #include "xe_pmu.h"
> #include "xe_sched_job.h"
>
>-bool force_execlist = false;
>-module_param_named_unsafe(force_execlist, force_execlist, bool, 0444);
>+struct xe_modparam xe_modparam = {
>+	.enable_display = true,
>+	.guc_log_level = 5,
>+	.force_probe = CONFIG_DRM_XE_FORCE_PROBE,
>+	/* the rest are 0 by default */
>+};
>+
>+module_param_named_unsafe(force_execlist, xe_modparam.force_execlist, bool, 0444);
> MODULE_PARM_DESC(force_execlist, "Force Execlist submission");
>
>-bool enable_display = true;
>-module_param_named(enable_display, enable_display, bool, 0444);
>+module_param_named(enable_display, xe_modparam.enable_display, bool, 0444);
> MODULE_PARM_DESC(enable_display, "Enable display");
>
>-u32 xe_force_vram_bar_size;
>-module_param_named(vram_bar_size, xe_force_vram_bar_size, uint, 0600);
>+module_param_named(vram_bar_size, xe_modparam.force_vram_bar_size, uint, 0600);
> MODULE_PARM_DESC(vram_bar_size, "Set the vram bar size(in MiB)");
>
>-int xe_guc_log_level = 5;
>-module_param_named(guc_log_level, xe_guc_log_level, int, 0600);
>+module_param_named(guc_log_level, xe_modparam.guc_log_level, int, 0600);
> MODULE_PARM_DESC(guc_log_level, "GuC firmware logging level (0=disable, 1..5=enable with verbosity min..max)");
>
>-char *xe_guc_firmware_path;
>-module_param_named_unsafe(guc_firmware_path, xe_guc_firmware_path, charp, 0400);
>+module_param_named_unsafe(guc_firmware_path, xe_modparam.guc_firmware_path, charp, 0400);
> MODULE_PARM_DESC(guc_firmware_path,
> 		 "GuC firmware path to use instead of the default one");
>
>-char *xe_huc_firmware_path;
>-module_param_named_unsafe(huc_firmware_path, xe_huc_firmware_path, charp, 0400);
>+module_param_named_unsafe(huc_firmware_path, xe_modparam.huc_firmware_path, charp, 0400);
> MODULE_PARM_DESC(huc_firmware_path,
> 		 "HuC firmware path to use instead of the default one - empty string disables");
>
>-char *xe_param_force_probe = CONFIG_DRM_XE_FORCE_PROBE;
>-module_param_named_unsafe(force_probe, xe_param_force_probe, charp, 0400);
>+module_param_named_unsafe(force_probe, xe_modparam.force_probe, charp, 0400);
> MODULE_PARM_DESC(force_probe,
> 		 "Force probe options for specified devices. See CONFIG_DRM_XE_FORCE_PROBE for details.");
>
>diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
>index e1da1e9ca5cb..def912235007 100644
>--- a/drivers/gpu/drm/xe/xe_module.h
>+++ b/drivers/gpu/drm/xe/xe_module.h
>@@ -3,13 +3,22 @@
>  * Copyright © 2023 Intel Corporation
>  */
>
>+#ifndef _XE_MODULE_H_
>+#define _XE_MODULE_H_
>+
> #include <linux/types.h>
>
> /* Module modprobe variables */
>-extern bool force_execlist;
>-extern bool enable_display;
>-extern u32 xe_force_vram_bar_size;
>-extern int xe_guc_log_level;
>-extern char *xe_guc_firmware_path;
>-extern char *xe_huc_firmware_path;
>-extern char *xe_param_force_probe;
>+struct xe_modparam {
>+        bool force_execlist;
>+        bool enable_display;
>+        u32 force_vram_bar_size;
>+        int guc_log_level;
>+        char *guc_firmware_path;
>+        char *huc_firmware_path;
>+        char *force_probe;
>+};
>+extern struct xe_modparam xe_modparam;
>+
>+#endif
>+
>diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>index 2fae45b9d88e..9de5bac4a5f3 100644
>--- a/drivers/gpu/drm/xe/xe_pci.c
>+++ b/drivers/gpu/drm/xe/xe_pci.c
>@@ -417,12 +417,12 @@ static bool device_id_in_list(u16 device_id, const char *devices, bool negative)
>
> static bool id_forced(u16 device_id)
> {
>-	return device_id_in_list(device_id, xe_param_force_probe, false);
>+	return device_id_in_list(device_id, xe_modparam.force_probe, false);
> }
>
> static bool id_blocked(u16 device_id)
> {
>-	return device_id_in_list(device_id, xe_param_force_probe, true);
>+	return device_id_in_list(device_id, xe_modparam.force_probe, true);
> }
>
> static const struct xe_subplatform_desc *
>@@ -591,7 +591,7 @@ static int xe_info_init(struct xe_device *xe,
> 	xe->info.has_range_tlb_invalidation = graphics_desc->has_range_tlb_invalidation;
>
> 	xe->info.enable_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
>-				  enable_display &&
>+				  xe_modparam.enable_display &&
> 				  desc->has_display;
> 	/*
> 	 * All platforms have at least one primary GT.  Any platform with media
>diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
>index 3032c4f148d4..25778887d846 100644
>--- a/drivers/gpu/drm/xe/xe_uc_fw.c
>+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
>@@ -220,11 +220,11 @@ uc_fw_override(struct xe_uc_fw *uc_fw)
> 	/* empty string disables, but it's not allowed for GuC */
> 	switch (uc_fw->type) {
> 	case XE_UC_FW_TYPE_GUC:
>-		if (xe_guc_firmware_path && *xe_guc_firmware_path)
>-			path_override = xe_guc_firmware_path;
>+		if (xe_modparam.guc_firmware_path && *xe_modparam.guc_firmware_path)
>+			path_override = xe_modparam.guc_firmware_path;
> 		break;
> 	case XE_UC_FW_TYPE_HUC:
>-		path_override = xe_huc_firmware_path;
>+		path_override = xe_modparam.huc_firmware_path;
> 		break;
> 	default:
> 		break;
>-- 
>2.34.1
>
