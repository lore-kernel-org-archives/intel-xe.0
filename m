Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6388EE7C4E5
	for <intel-xe@archiver.kernel.org>; Wed,  4 Oct 2023 16:34:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2685210E38D;
	Wed,  4 Oct 2023 16:34:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D15A10E38D
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Oct 2023 16:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696437264; x=1727973264;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=owTQlen+fHPqQwa+0NE4Yo91Kf5rE8U58fJTZFRc+Zs=;
 b=JA/guIdUI/9K79IN4BE2k0oIX3vbigL7nLLe5PSdbkoJZ4wIT5BQ0KPF
 fmK0m2JYtylcUrullZGVK8YupHUIIiG/cBduaOFlbHu0qSziwxiln/KFH
 dFPyc9vAb50HADyWdhcUIMB0rCaHTquOvA8Swg1iqpTVyVtaIP9Aaz9Fh
 elcZqQt9iXsdi21B1QzHe72eQag+LcE/Iy/482OeFUJ/NrY2DFU9tXQU/
 DIXFs63NU8jSaBomRDUW78AIFFyDXlfStqzcjLBOuYtkhrQsmwVxYt/N4
 hkusNKG3JVXAAAuL/ekMzoShmR0061pOt4Ii/ROvtCbq3icb+lxggjOEX g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="368281675"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="368281675"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 09:30:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="998535815"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="998535815"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Oct 2023 09:29:53 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 4 Oct 2023 09:29:53 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 4 Oct 2023 09:29:53 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 4 Oct 2023 09:29:53 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 4 Oct 2023 09:29:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z+4fcs9HzM1dlz5HY0CwW9x6oTy9ms3JBa9rfh1bOKUFA6idazzNCzGUEtCUlP7Ouql6LHjMP8zu1CXvgyBXwJZcM7L7GorxTrucyz4kFK2AfoOHZo7BZvVFTIPMtiuB+1c6F+KLdaOJWWaVFJlv9MNnK+84umYUFP9qqp9HhfVbigftNae4xT6EuUysO3Gw5XxLePpWlk4TN4TAfVixzX7dP3bXHIr+BIDWO61pU97f1dYWqtY+tbBvsfI+bEqz95ofzktR74WileeTAzrl/loMtOMhfyX7ZPShuH2milnMl+AePoEH1jUUxtIMsek7iK4bPecXMnzniPMA4jcuEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nCfHp5L4rifOxGaPWJK14D0Ma6XzjfWnGZr90XUXCWE=;
 b=nGRZW+XuXAJ2h6oGyjrQVS7KiEzG+FQ0gGtNOn5ulThnV0/EiEzAUMjuCEQu+Q6SqIG+CgM0U7LP0Ohaj2ytEL4/9IGsHHoVMk98AAFagn9YDj9hl5zLCu3Vw6FkGDVy/atUjQWbjtLpwFrgFGgdW2grSlHpSvTsBClbkj6f32rX4fRcxUr6upKgoxPAq/FBIQImqrqCj3d0jPf10pJ7Lj91Q/JC2Q63YqjaTyNcrTgUEpa9WFvbheUi6fX60IW51hEm39+7cMy1aAo7xzl7wPR6c1IVmp4swMFwyHzudmERDT9ghCLooyZZVsDAxLepNu598k+04vuZ6y2i2M/XFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY5PR11MB6437.namprd11.prod.outlook.com (2603:10b6:930:36::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.37; Wed, 4 Oct
 2023 16:29:50 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::f345:2318:9a82:51b5]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::f345:2318:9a82:51b5%7]) with mapi id 15.20.6838.033; Wed, 4 Oct 2023
 16:29:50 +0000
Date: Wed, 4 Oct 2023 11:28:41 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Message-ID: <xqsumuzekbwjzjntiehzb7kcz6jw7wfe7tem6upe2mnmysf2fk@ar7o3jhlgbel>
References: <cover.1696343521.git.jani.nikula@intel.com>
 <696d81bccaca9c3b0a29996ba12afd1f09b69400.1696343521.git.jani.nikula@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <696d81bccaca9c3b0a29996ba12afd1f09b69400.1696343521.git.jani.nikula@intel.com>
X-ClientProxiedBy: BYAPR04CA0008.namprd04.prod.outlook.com
 (2603:10b6:a03:40::21) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CY5PR11MB6437:EE_
X-MS-Office365-Filtering-Correlation-Id: 2eefed1c-936f-497c-4cc0-08dbc4f72171
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UEdkpLAUwfZ5cMD0nJ+wFiamkpKir/YsuQoLTtjfCl9ntzPcChXK7cVmSdxeBNgoi1bX04bjKRsQwv2lTLCBdnxPZXFKIVRLfTzabqmhNo+NdapsEJm5VzVs96ACM+U+L5+t0TefutLMP5BKjlIrlOb1p8DlPQjTPTKaXWij1KRRh4NgQJZn7j2SOgL63BPKQ9LUg2Nm1WpuUrw9M2uIqw731zwDcITIMsfpfYZN7cprGCMYhpnaWBQl7ofUispQVeZE1+b9SEn8G61TnnWFJJCCPbNV/jT3uxZbQ0GGvIqBtjQZT52IHUiXaJu2zi0CJ9tdsiuzFeRoUKpb8qJGv4cZXeyNk5zX/V8u6iSAjz6zlA0n0PscrTQTwdZlfxiktBoFh8kyEhOx69iu89Wpzlnoeug+g3mVHMU0wsTKN1Z4aLL4INw5g4VWaytK6TimKObiC2/I2zSE6yjdIfFzF4ver/We9V5kH/LXYiL79v4ylNs61MLASsR6bvZ9EognlsLxtLlwYsT8y817dGAJd4IX42lQ2n1bsQHIRafm18YzkGDTceK6a2nm/s/hRXTm
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(396003)(39860400002)(346002)(376002)(136003)(366004)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(6512007)(6486002)(6506007)(6666004)(9686003)(478600001)(83380400001)(107886003)(26005)(2906002)(30864003)(33716001)(6636002)(316002)(66476007)(66556008)(66946007)(8676002)(8936002)(4326008)(6862004)(5660300002)(41300700001)(38100700002)(82960400001)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?09dgB2H8ExfDR4O/Y0Qv/O41EGUX4DAINuZ1j1ad7tXaeiy6tnbVvS5SF2RU?=
 =?us-ascii?Q?66yozOj4tTqE0y/vcByVpuSZgreey9UTwIYg2HPncmFBqHnU//IjJEUp42dU?=
 =?us-ascii?Q?cVNYeSUWL0VYGJ8rjA+x36pR9L4ZQEjHf5/5EF7l1JrOZMUbSesmC8ZmaUHe?=
 =?us-ascii?Q?fzc/YEC3J2j1Z82JsCTLg8sNpc4Y33TY9YRCs8Rd5n1FQV/IxGAV+1zw0mFA?=
 =?us-ascii?Q?7ZsdBnROjMi9pjHpWmMDx7Id6021BuHqGArVd5OWcTocneLYGqlF0281eAkS?=
 =?us-ascii?Q?tbZr063Ic3CC7IhoaaT9gy/VAZMzdjFQEfdSPz9FOf1w9I1KOErhgVnXt7j4?=
 =?us-ascii?Q?NgyBTyWOxCVGUnAudUo0M60uefOLLWuBHxmbd8Xdl67+QY6J2L+nKcX/EV69?=
 =?us-ascii?Q?2M0gM0iiUVJIXjn7DSN0eegWNfQfsQ+z1u9GJFO1n3xKfPNxaSbK7eAEmPuC?=
 =?us-ascii?Q?H0YsLTlZaLPJHe1+xth8c3habg+gcfDLLL7e2qUauzNHGL1+tORbTiD6QgLR?=
 =?us-ascii?Q?Qyv+uOf0SXg+OYnRXXLAG+N0aeEySiJWk07+vQXl3RbyQAf7juWAG8n6C0gx?=
 =?us-ascii?Q?CUVWTSuw4+smratVvf7xp4PWmrnhJbTgb2BrXZGUkS69r04h1HwmA/V9lAWF?=
 =?us-ascii?Q?vt3RFm6L6xLbYbtKKadEMvuWu2ennpW5Wb1xGS6DgNE5DD4r1IVHbzTuDmRb?=
 =?us-ascii?Q?244Q4Rf3zBfqxFA4HW+09HYbTxB8djOVvxWCLSqE1MrSd4Y5ghrZql2ItEMM?=
 =?us-ascii?Q?W/4WRqy31WBf0UMbXdjddcECAfFCrhnik1QFV9/dasrhgNcqjXeQZLTjAuRb?=
 =?us-ascii?Q?T8CcLTsOy4rfe79svrxItLHGleg+CzhEzhl4ZGS1P2IvUWHOI93iFWxIKJwn?=
 =?us-ascii?Q?Xllh/lvfQqDlgweJyOIL/N2Blb30N+pVbCTqI1zJN26spetKFtVE9OHP7b9e?=
 =?us-ascii?Q?N+T7yMOUfaPqa0kOpTjljPLOFjO1Y7iIb5EFU/SfYgegkDqQqXlpZATbkWUa?=
 =?us-ascii?Q?6sYCb2DmCfDW7/NrF9uZKAsOIA/m7NcSaS5RQZ6QfiVFHLTPhl7TqgPSkFbx?=
 =?us-ascii?Q?YTPfevvjh9ixe/gUzD5uqaL9oRDocsV7hCaBZhOY3hqoJB3gewawzQhAjSi3?=
 =?us-ascii?Q?7VwGY3J43MBGTFJeilEjEyCvZpRz91JWtJ6jfUyf0RYWoqmLzexD57x77VkQ?=
 =?us-ascii?Q?i2uJmLiL/hkG+qeTHNx/q9TVxMzwtQ1MRE1+3uaWPqxPv58HufCFt0KsMwuY?=
 =?us-ascii?Q?wItaQTWhQMBfrJIY5mHxFmcV2NRVlltTCod+FX9xJC6CYy3/nj7Rwdy7PRa/?=
 =?us-ascii?Q?5GTABF1aolTCKH13gzXydomgWr3Eoi9d/GQXYQQ7ENQEMtpJBwqTYX/owGuQ?=
 =?us-ascii?Q?0sATJ3qoM6PCdo5qmnawX/vEfMn1eFODLpLrHNZ0AcXxgmXrojobHKwzzgL9?=
 =?us-ascii?Q?69EjIlXH6FlJQg9oqWffIUKsG2JhTk8GoxFSYnqvR9rwV/cR+OUcic4ZHjND?=
 =?us-ascii?Q?Lm/9xn6Hfr4bh8Qixpp+oPrZgfJglb7gxaA/oaK4EofQg4vwB5RceX5hsP0H?=
 =?us-ascii?Q?IsqH12w7C6yLIqawQpsNsV1Wp7WqMjak1W6sTb3lgdzG/kc1zObcQWjzUA3h?=
 =?us-ascii?Q?+w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2eefed1c-936f-497c-4cc0-08dbc4f72171
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2023 16:29:50.1970 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hxU+wxOl/zETpiYQfm+Eh9Ea5/rAeA8hK1728n7ROmitfWYF+WehSBPdWkjsrcx3kUltDQxVUKcmKLeILWI3iSLyqQAWZGq6vrogsikt4fE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6437
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 09/10] fixup! drm/xe/display: Implement
 display support
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
Cc: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Oct 03, 2023 at 05:34:56PM +0300, Jani Nikula wrote:
>Let the display code decide whether display hardware is there or
>not. Remove has_display member from struct xe_device_desc, and
>enable_display from struct xe_device.

that doesn't seem good and the best example would be the current
situation for LNL where you go from working to crashing.

>
>Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>---
> drivers/gpu/drm/xe/xe_device_types.h |  2 --
> drivers/gpu/drm/xe/xe_display.c      | 51 ++++++++++++----------------
> drivers/gpu/drm/xe/xe_pci.c          | 13 -------
> 3 files changed, 22 insertions(+), 44 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>index 62e1a875980b..01ab0b3d1954 100644
>--- a/drivers/gpu/drm/xe/xe_device_types.h
>+++ b/drivers/gpu/drm/xe/xe_device_types.h
>@@ -236,8 +236,6 @@ struct xe_device {
> 		u8 has_llc:1;
> 		/** @has_range_tlb_invalidation: Has range based TLB invalidations */
> 		u8 has_range_tlb_invalidation:1;
>-		/** @enable_display: display enabled */
>-		u8 enable_display:1;
>
> #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
> 		struct {
>diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
>index 75054f78d7ae..70e7afc0a890 100644
>--- a/drivers/gpu/drm/xe/xe_display.c
>+++ b/drivers/gpu/drm/xe/xe_display.c
>@@ -57,7 +57,7 @@ static void xe_display_last_close(struct drm_device *dev)
> {
> 	struct xe_device *xe = to_xe_device(dev);
>
>-	if (xe->info.enable_display)
>+	if (has_display(xe))

these are not the same thing. enable_display here is "do I even want to
touch display?". It's not about having it or not.

If you can have the i915-semantics and retain what we can do in xe that
we can't in i915, then I'm ok with it, otherwise nak:

	1) have a platform flag that tells me "do I want to enable it?"
	so we can decide on bring up if the platform is ready to have
	that enabled or not. This is the info.enable_display

	2) have a module param (current solution, per module) or something
	else (future solution?, per device) that allows me to override the
	enable_display 	in runtime

Note that pipe_mask being 0 still enables a bunch of things on the
display side, still touches somes registers and is controlled on the
i915-display side, not in xe. That was the case last time I checked a
few months ago, please correct me if it's not anymore.

Lucas De Marchi

> 		intel_fbdev_restore_mode(to_xe_device(dev));
> }
>
>@@ -138,7 +138,7 @@ static void xe_display_fini_nommio(struct drm_device *dev, void *dummy)
> {
> 	struct xe_device *xe = to_xe_device(dev);
>
>-	if (!xe->info.enable_display)
>+	if (!has_display(xe))
> 		return;
>
> 	intel_power_domains_cleanup(xe);
>@@ -148,7 +148,7 @@ int xe_display_init_nommio(struct xe_device *xe)
> {
> 	int err;
>
>-	if (!xe->info.enable_display)
>+	if (!has_display(xe))
> 		return 0;
>
> 	/* Fake uncore lock */
>@@ -168,7 +168,7 @@ static void xe_display_fini_noirq(struct drm_device *dev, void *dummy)
> {
> 	struct xe_device *xe = to_xe_device(dev);
>
>-	if (!xe->info.enable_display)
>+	if (!has_display(xe))
> 		return;
>
> 	intel_display_driver_remove_noirq(xe);
>@@ -179,7 +179,7 @@ int xe_display_init_noirq(struct xe_device *xe)
> {
> 	int err;
>
>-	if (!xe->info.enable_display)
>+	if (!has_display(xe))
> 		return 0;
>
> 	intel_display_driver_early_probe(xe);
>@@ -208,7 +208,7 @@ static void xe_display_fini_noaccel(struct drm_device *dev, void *dummy)
> {
> 	struct xe_device *xe = to_xe_device(dev);
>
>-	if (!xe->info.enable_display)
>+	if (!has_display(xe))
> 		return;
>
> 	intel_display_driver_remove_nogem(xe);
>@@ -218,7 +218,7 @@ int xe_display_init_noaccel(struct xe_device *xe)
> {
> 	int err;
>
>-	if (!xe->info.enable_display)
>+	if (!has_display(xe))
> 		return 0;
>
> 	err = intel_display_driver_probe_nogem(xe);
>@@ -230,7 +230,7 @@ int xe_display_init_noaccel(struct xe_device *xe)
>
> int xe_display_init(struct xe_device *xe)
> {
>-	if (!xe->info.enable_display)
>+	if (!has_display(xe))
> 		return 0;
>
> 	return intel_display_driver_probe(xe);
>@@ -238,7 +238,7 @@ int xe_display_init(struct xe_device *xe)
>
> void xe_display_fini(struct xe_device *xe)
> {
>-	if (!xe->info.enable_display)
>+	if (!has_display(xe))
> 		return;
>
> 	/* poll work can call into fbdev, hence clean that up afterwards */
>@@ -251,7 +251,7 @@ void xe_display_fini(struct xe_device *xe)
>
> void xe_display_register(struct xe_device *xe)
> {
>-	if (!xe->info.enable_display)
>+	if (!has_display(xe))
> 		return;
>
> 	intel_display_driver_register(xe);
>@@ -261,7 +261,7 @@ void xe_display_register(struct xe_device *xe)
>
> void xe_display_unregister(struct xe_device *xe)
> {
>-	if (!xe->info.enable_display)
>+	if (!has_display(xe))
> 		return;
>
> 	intel_unregister_dsm_handler();
>@@ -271,7 +271,7 @@ void xe_display_unregister(struct xe_device *xe)
>
> void xe_display_driver_remove(struct xe_device *xe)
> {
>-	if (!xe->info.enable_display)
>+	if (!has_display(xe))
> 		return;
>
> 	intel_display_driver_remove(xe);
>@@ -281,7 +281,7 @@ void xe_display_driver_remove(struct xe_device *xe)
>
> void xe_display_irq_handler(struct xe_device *xe, u32 master_ctl)
> {
>-	if (!xe->info.enable_display)
>+	if (!has_display(xe))
> 		return;
>
> 	if (master_ctl & DISPLAY_IRQ)
>@@ -290,7 +290,7 @@ void xe_display_irq_handler(struct xe_device *xe, u32 master_ctl)
>
> void xe_display_irq_enable(struct xe_device *xe, u32 gu_misc_iir)
> {
>-	if (!xe->info.enable_display)
>+	if (!has_display(xe))
> 		return;
>
> 	if (gu_misc_iir & GU_MISC_GSE)
>@@ -299,7 +299,7 @@ void xe_display_irq_enable(struct xe_device *xe, u32 gu_misc_iir)
>
> void xe_display_irq_reset(struct xe_device *xe)
> {
>-	if (!xe->info.enable_display)
>+	if (!has_display(xe))
> 		return;
>
> 	gen11_display_irq_reset(xe);
>@@ -307,7 +307,7 @@ void xe_display_irq_reset(struct xe_device *xe)
>
> void xe_display_irq_postinstall(struct xe_device *xe, struct xe_gt *gt)
> {
>-	if (!xe->info.enable_display)
>+	if (!has_display(xe))
> 		return;
>
> 	if (gt->info.id == XE_GT0)
>@@ -341,7 +341,7 @@ static bool suspend_to_idle(void)
> void xe_display_pm_suspend(struct xe_device *xe)
> {
> 	bool s2idle = suspend_to_idle();
>-	if (!xe->info.enable_display)
>+	if (!has_display(xe))
> 		return;
>
> 	/*
>@@ -370,7 +370,7 @@ void xe_display_pm_suspend(struct xe_device *xe)
> void xe_display_pm_suspend_late(struct xe_device *xe)
> {
> 	bool s2idle = suspend_to_idle();
>-	if (!xe->info.enable_display)
>+	if (!has_display(xe))
> 		return;
>
> 	intel_power_domains_suspend(xe, s2idle);
>@@ -380,7 +380,7 @@ void xe_display_pm_suspend_late(struct xe_device *xe)
>
> void xe_display_pm_resume_early(struct xe_device *xe)
> {
>-	if (!xe->info.enable_display)
>+	if (!has_display(xe))
> 		return;
>
> 	intel_display_power_resume_early(xe);
>@@ -390,7 +390,7 @@ void xe_display_pm_resume_early(struct xe_device *xe)
>
> void xe_display_pm_resume(struct xe_device *xe)
> {
>-	if (!xe->info.enable_display)
>+	if (!has_display(xe))
> 		return;
>
> 	intel_dmc_resume(xe);
>@@ -418,15 +418,8 @@ void xe_display_pm_resume(struct xe_device *xe)
>
> void xe_display_probe(struct xe_device *xe)
> {
>-	if (!xe->info.enable_display)
>-		goto no_display;
>-
> 	intel_display_device_probe(xe);
>
>-	if (has_display(xe))
>-		return;
>-
>-no_display:
>-	xe->info.enable_display = false;
>-	unset_display_features(xe);
>+	if (!has_display(xe))
>+		unset_display_features(xe);
> }
>diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>index 8ee430c6f8b1..cbbfe75eb2d2 100644
>--- a/drivers/gpu/drm/xe/xe_pci.c
>+++ b/drivers/gpu/drm/xe/xe_pci.c
>@@ -56,7 +56,6 @@ struct xe_device_desc {
>
> 	u8 require_force_probe:1;
> 	u8 is_dgfx:1;
>-	u8 has_display:1;
>
> 	u8 has_llc:1;
> };
>@@ -207,7 +206,6 @@ static const struct xe_device_desc tgl_desc = {
> 	.graphics = &graphics_xelp,
> 	.media = &media_xem,
> 	PLATFORM(XE_TIGERLAKE),
>-	.has_display = true,
> 	.has_llc = true,
> 	.require_force_probe = true,
> };
>@@ -216,7 +214,6 @@ static const struct xe_device_desc rkl_desc = {
> 	.graphics = &graphics_xelp,
> 	.media = &media_xem,
> 	PLATFORM(XE_ROCKETLAKE),
>-	.has_display = true,
> 	.has_llc = true,
> 	.require_force_probe = true,
> };
>@@ -225,7 +222,6 @@ static const struct xe_device_desc adl_s_desc = {
> 	.graphics = &graphics_xelp,
> 	.media = &media_xem,
> 	PLATFORM(XE_ALDERLAKE_S),
>-	.has_display = true,
> 	.has_llc = true,
> 	.require_force_probe = true,
> };
>@@ -236,7 +232,6 @@ static const struct xe_device_desc adl_p_desc = {
> 	.graphics = &graphics_xelp,
> 	.media = &media_xem,
> 	PLATFORM(XE_ALDERLAKE_P),
>-	.has_display = true,
> 	.has_llc = true,
> 	.require_force_probe = true,
> 	.subplatforms = (const struct xe_subplatform_desc[]) {
>@@ -249,7 +244,6 @@ static const struct xe_device_desc adl_n_desc = {
> 	.graphics = &graphics_xelp,
> 	.media = &media_xem,
> 	PLATFORM(XE_ALDERLAKE_N),
>-	.has_display = true,
> 	.has_llc = true,
> 	.require_force_probe = true,
> };
>@@ -262,7 +256,6 @@ static const struct xe_device_desc dg1_desc = {
> 	.media = &media_xem,
> 	DGFX_FEATURES,
> 	PLATFORM(XE_DG1),
>-	.has_display = true,
> 	.require_force_probe = true,
> };
>
>@@ -286,7 +279,6 @@ static const struct xe_device_desc ats_m_desc = {
> 	.require_force_probe = true,
>
> 	DG2_FEATURES,
>-	.has_display = false,
> };
>
> static const struct xe_device_desc dg2_desc = {
>@@ -295,14 +287,12 @@ static const struct xe_device_desc dg2_desc = {
> 	.require_force_probe = true,
>
> 	DG2_FEATURES,
>-	.has_display = true,
> };
>
> static const struct xe_device_desc pvc_desc = {
> 	.graphics = &graphics_xehpc,
> 	DGFX_FEATURES,
> 	PLATFORM(XE_PVC),
>-	.has_display = false,
> 	.require_force_probe = true,
> };
>
>@@ -310,7 +300,6 @@ static const struct xe_device_desc mtl_desc = {
> 	/* .graphics and .media determined via GMD_ID */
> 	.require_force_probe = true,
> 	PLATFORM(XE_METEORLAKE),
>-	.has_display = true,
> };
>
> static const struct xe_device_desc lnl_desc = {
>@@ -574,8 +563,6 @@ static int xe_info_init(struct xe_device *xe,
> 	xe->info.has_flat_ccs = graphics_desc->has_flat_ccs;
> 	xe->info.has_range_tlb_invalidation = graphics_desc->has_range_tlb_invalidation;
>
>-	xe->info.enable_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
>-				  desc->has_display;
> 	/*
> 	 * All platforms have at least one primary GT.  Any platform with media
> 	 * version 13 or higher has an additional dedicated media GT.  And
>-- 
>2.39.2
>
