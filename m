Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8855AC4345F
	for <intel-xe@archiver.kernel.org>; Tue, 16 Apr 2024 17:20:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CD3B10F242;
	Tue, 16 Apr 2024 17:20:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CzmT5ejS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96BC310F242
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Apr 2024 17:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713287999; x=1744823999;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=MRR6nFKmV3J13tl2A8bnP7VKZlf5CmsiEzfsGSZkJmM=;
 b=CzmT5ejSk1n16ZqV+cx48ZnVCRQshPiGnnd2VILVFw/d2e2RROFYMRdp
 ym868914muDfH3sA4fES09x73H8DBtpFhD5ZQ+XTFqIZLhTyqLqF+YQAK
 Q1mR1w7Ib9yccSfcDar9UyKaL0mDt9OjKMotzy6BYC46cbnAdLqqWkNUS
 8XoyNp67EsiSUvfDZgCXhVXyunBV99izHwI73YTrZM9KpItLDwvhZ45gg
 ncp13B3HE9ZNtu9zfXXiHxWAydlYRwr6nCRiuByZIfldxq4ZKKmpDqBDi
 RW/Y8leY+74lHtuw+QZGb5ikg1bfvQCE0Tabd66G9UrFGZrtvOGldexgX g==;
X-CSE-ConnectionGUID: M3W0hJwtSxeRKGDHbN7E5w==
X-CSE-MsgGUID: xX+4fJQIRMOsWUq7ht8UmA==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="8666930"
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="8666930"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 10:19:58 -0700
X-CSE-ConnectionGUID: Pc75xVwPQFuoYFS4IyaZEA==
X-CSE-MsgGUID: 8J++6vq1T7eRcWPzsHJLPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; d="scan'208";a="27125554"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Apr 2024 10:19:57 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Apr 2024 10:19:56 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 16 Apr 2024 10:19:55 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 16 Apr 2024 10:19:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mHnVrX6pASHqAulJwtrIn2BmNTERnHYUsWRyVfTcOgYV1I5EnEw6/mf1wPXoTmEwioWfWokpZFvWpLZMDdGwP8TcKnJqoZgZ7rFdXirpll16f6smjhpk3J35xvNBe0vH9VL3IGvDHIWkE83z8XtAR1eIUrNR9YeMd17Kbdf+eXdDYfGrfmv/ZJCrUiabYLYHT9q7kBnxLOsP+Q0h6SmXPQ1IfGE6WjHtrbKZ07ETodDjjmGoE5OGdx6mddEs8KBWLRFiaTupigBkz6K+NEuKDL8dE1gYaQegWLcDHBWB1r9V8TvMx41GUpcuhFR3y4aQnXTVHqK2x20CtuHFnBGOSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yBrbvrHXSTVgNy9r0jE4dpKHIKXtPVHIyRBvLo0qUyE=;
 b=D3aFpsNuXmH4zD847z92oK0/gmp7BQgH0A+qW2gpYhd6WKLUnrnQbWchkh3RiKXYeW9XAHOmIwyX8mDiluakJbbh2RPIiNc31IkSukoh+D7gsdWqU7jhOvMP9zmJTvK+2VlZzDqGd22m5XzKTylj/+TV4wnFXHutj1VI53T626l/Q4Z39Ij/ekHvi0NPCztIM7/r/Ubg/NNZnRJflj2zQFYaSotxP2OEnRo3QajfGdgO2yQterP5iuCbJne6HktK4k+6txJYnw7mRo+9v6vlPnX2pApUmpeQ+PvnRuRCDpC36ta9PTcrdjnIhQf8Uh+fqBSKJLEYZinJ8JhCOfrfLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH0PR11MB7522.namprd11.prod.outlook.com (2603:10b6:510:289::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.29; Tue, 16 Apr
 2024 17:19:53 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7472.025; Tue, 16 Apr 2024
 17:19:53 +0000
Date: Tue, 16 Apr 2024 12:19:50 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>, 
 Dafna Hirschfeld <dhirschfeld@habana.ai>, Alan Previn
 <alan.previn.teres.alexis@intel.com>, Himanshu Somaiya
 <himanshu.somaiya@intel.com>
Subject: Re: [PATCH 3/4] drm/xe: Force wedged state and block GT reset upon
 any GPU hang
Message-ID: <y3bo36g6qldbxafa6mbukof2zfq5bnxlcd4xagbwkapowgyjwa@5vbtlvpu4hcg>
References: <20240409221507.1076471-1-rodrigo.vivi@intel.com>
 <20240409221507.1076471-3-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240409221507.1076471-3-rodrigo.vivi@intel.com>
X-ClientProxiedBy: BY3PR03CA0008.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::13) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH0PR11MB7522:EE_
X-MS-Office365-Filtering-Correlation-Id: 0671f27d-a744-4271-2aaa-08dc5e396dd5
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MJqL3Vf7H34+KyHoaHrOl9jFDftlU7a/OTxdIBogOJHmSe3X8G/l/qWP1p+fZi82t/2I6F6vyQekcfxHvHsg/OQuM3YENqa/Qla0UhmyLmHoZuFjpKz2f9CoyB7cwOy41cjmMH4XhzSU02cFM4TJbgCuS0iXACwYbGLSE2Ly5AD85OF2vhivlD938Jcoxd7/7S6NrWDQJJXIxJ76QoCl+YTHAmR1T/3z2OR7agrp+5eNfNAuLGTkXz1R/1dpWhohlQcXV238r4KaBYO/sSDTpvMcMFhEk4a9UHqR84+/OY2rPVwwxXD8sirCNPdXGVxeSMKDUbQv+734SmThUPW+R6OXv9qNzAgXeVWDEN5dMIBNRhgDQzsNgxhJMbQ8aBkgc36U7hAYRroSpHgGsgBSjtUENPCPNrchPkQodRA/uDH0DY1iS+oYQ8lVly0y5U+P3v3rLMFYvpv8Dutwdjg3mIfu4CoDgk7BYYgZ+cdeG+B6nPJrRofyOS6ONZVBz6+itYtEK5iQW16zXbjNAj4HMUlPj46DXyRsNvF+S+EutvAzWOtzlVzoa9lklEDYPb7QekEV8syxhrvW4yuFSyHHSsFVGm6vY/EGMX2BDwKonjA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yYO9dNo2WEziafesIt8+HoqdxWi+EucGMp4kOS+JRbahcW+LGwBhkZnjdexI?=
 =?us-ascii?Q?Q3wrhVso04TuXO34/RouJh+DIpC4Y4mp0cByzCVRGRK4c8owcfPjSGARb8lo?=
 =?us-ascii?Q?mE1h9lS/fHlOUcMT166kXzFlXnNF49NrDxPaJ8eKoSutHpSh4klcnUWUwzVh?=
 =?us-ascii?Q?MOLD65jSBQjwEY7TvtPg4O+jLpvfnjjCYht60IXpTRLlkbyG8/r9ipVNtpkJ?=
 =?us-ascii?Q?9AQBXhhbZqcA0aVJ2U5zsv/aF25zhhtQMaARGW4buPVf+t/zMLgaCdvmFQ77?=
 =?us-ascii?Q?FeUMJzsGTsLdpE/rvzLgl/DTL7RZPCN1Y3SAFnP3OWbj3tvmSiRRJq+bJOuW?=
 =?us-ascii?Q?FbvLM85+AmDp1N/gudgDYCGG0XQMD9prf9yog9ByIjF4swRSnz0Ax94DrKQc?=
 =?us-ascii?Q?Ud5mFg4y/hPciRCohqA/C7SvqGwG6pFinwW6EOnwrM5It+xuQQdfVaeHRJwg?=
 =?us-ascii?Q?kAFJ6QFUxi4iSbVbqFS4yO/4owEOtgV0zNxfY3nulM2Z6OVd+XLLovgzSemD?=
 =?us-ascii?Q?P5Y7UKnOPBcuYEmnXboYJxPnY1otRgEqUIMXWy9GAk+rfk4FOKRHlD4Q7gfS?=
 =?us-ascii?Q?LbhCrx0i8BewhN1dVyrPR2Ks0kWNFBuq9hTMu/th7/VHEzInBEoE0O8LSNTn?=
 =?us-ascii?Q?qIvOdzVXm4bAnp3Ohaw1qaItm/OYPrHIVjuvipVlDMaYdOGk1kKkNm8AmWi0?=
 =?us-ascii?Q?cNlMF+8P3kOnQ8iDMRzTmaGvk2puMSA15zzbW1NB//srd6nxChFFJ0YIG5nf?=
 =?us-ascii?Q?q+yUxnMghtSte/SY1WkVqGEcGVfWUTTcTzc1bsrZ/04DWPiKCFODhULNQNOK?=
 =?us-ascii?Q?USwAZ0aW/XkHVUa8r4l93v2Eq7c3kp+Mg8S3xDhXOZ2m29mdWcXdtIJk2KIt?=
 =?us-ascii?Q?GypgesH1kgFUUvO8NuMiKCZ8kXXu8L3o+okxbBgZWQgL/iYw3O8Y4B9QWCYO?=
 =?us-ascii?Q?2JbcgH6CYHLezffBEu/P3phM86cZ/Tsg9rcOI3Pt0aB7FBHWFAjSFERMio4W?=
 =?us-ascii?Q?cjpywbIsfKyR5zoQtokAmDVxNDrd0o04aelU0w/AlQnnkoWLeUSrkPfZTPDH?=
 =?us-ascii?Q?h2sBDdqAeYC600haCYQTidTsWSGebX+n8Xj0CQZLyym+dMFX//TazeP2Ohos?=
 =?us-ascii?Q?biBgpwTY+bYGw2Skwp/uV25pJ28MXeuE4xu1pR4NUCz3tQUStia8xNG45S4J?=
 =?us-ascii?Q?fwLzSRRIoS0oMWX8ZrF9DFZR3KewTFTkTT19FlorkKOyo7w7Sc511GxAfvsv?=
 =?us-ascii?Q?UHtUCE4hTFJkAyGHsaP+7GXyQaBWLlCchYzrt3OKK4roHueUF9AmGneiZfXf?=
 =?us-ascii?Q?3Vi0iedWQ8Z4r7fhYWJhGOxRcucG6iOlcuaFPHqf2cvSOlQYDnOYup8GPGWP?=
 =?us-ascii?Q?aXcxHFY+W3rSWv6/mh4ubmgqnUoX1BSO/iUr/MoiyuOLpfWdy7/WwhYWEFQi?=
 =?us-ascii?Q?dUQuVNDWqklRrbpGZXiJ9NdcijWG/aT4INyOxxJL54yVYCV8VNVj4uv8rwHf?=
 =?us-ascii?Q?c43NyYG2lyVIHYODeVS/QfoVLilpsStZk/zhOzzpBNMmQmJat/wHQUx6xY7z?=
 =?us-ascii?Q?Q9qcNJMjsriIp4DLbTjpL0zGge+ux0TI917n+tvfQP83kOVFo1cGUdIOLYpd?=
 =?us-ascii?Q?tg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0671f27d-a744-4271-2aaa-08dc5e396dd5
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 17:19:53.0851 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TjlvaUptcTkE1CGSR0EhtMjTWzd5X/bAo4udpVRQuOdy8mu79vLnT9O1AOVLp5kVHqp767/4JalanjdhO9a4MRmOq8V8hQd4/Q+wvDi60DY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7522
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

On Tue, Apr 09, 2024 at 06:15:06PM GMT, Rodrigo Vivi wrote:
>In many validation situations when debugging GPU Hangs,
>it is useful to preserve the GT situation from the moment
>that the timeout occurred.
>
>This patch introduces a module parameter that could be used
>on situations like this.
>
>If xe.wedged module parameter is set to 2, Xe will be declared
>wedged on every single execution timeout (a.k.a. GPU hang) right
>after devcoredump snapshot capture and without attempting any
>kind of GT reset and blocking entirely any kind of execution.
>
>v2: Really block gt_reset from guc side. (Lucas)
>    s/wedged/busted (Lucas)
>
>v3: - s/busted/wedged
>    - Really use global_flags (Dafna)
>    - More robust timeout handling when wedging it.
>
>v4: A really robust clean exit done by Matt Brost.
>    No more kernel warns on unbind.
>
>Cc: Matthew Brost <matthew.brost@intel.com>
>Cc: Dafna Hirschfeld <dhirschfeld@habana.ai>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
>Cc: Himanshu Somaiya <himanshu.somaiya@intel.com>
>Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>---
> drivers/gpu/drm/xe/xe_device.c              | 32 ++++++++
> drivers/gpu/drm/xe/xe_device.h              | 15 +---
> drivers/gpu/drm/xe/xe_exec_queue.h          |  9 +++
> drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c |  2 +-
> drivers/gpu/drm/xe/xe_guc_ads.c             |  9 ++-
> drivers/gpu/drm/xe/xe_guc_submit.c          | 90 +++++++++++++++++----
> drivers/gpu/drm/xe/xe_module.c              |  5 ++
> drivers/gpu/drm/xe/xe_module.h              |  1 +
> 8 files changed, 132 insertions(+), 31 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>index 67de795e43b3..7928a5470cee 100644
>--- a/drivers/gpu/drm/xe/xe_device.c
>+++ b/drivers/gpu/drm/xe/xe_device.c
>@@ -785,3 +785,35 @@ u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address)
> {
> 	return address & GENMASK_ULL(xe->info.va_bits - 1, 0);
> }
>+
>+/**
>+ * xe_device_declare_wedged - Declare device wedged
>+ * @xe: xe device instance
>+ *
>+ * This is a final state that can only be cleared with a module
>+ * re-probe (unbind + bind).
>+ * In this state every IOCTL will be blocked so the GT cannot be used.
>+ * In general it will be called upon any critical error such as gt reset
>+ * failure or guc loading failure.
>+ * If xe.wedged module parameter is set to 2, this function will be called
>+ * on every single execution timeout (a.k.a. GPU hang) right after devcoredump
>+ * snapshot capture. In this mode, GT reset won't be attempted so the state of
>+ * the issue is preserved for further debugging.
>+ */
>+void xe_device_declare_wedged(struct xe_device *xe)

nit: this function could have been added in this file already in the
previous patches.

>+{
>+	if (xe_modparam.wedged_mode == 0)
>+		return;

^ so this would be the only diff

>+
>+	if (!atomic_xchg(&xe->wedged, 1)) {
>+		xe->needs_flr_on_fini = true;
>+		drm_err(&xe->drm,
>+			"CRITICAL: Xe has declared device %s as wedged.\n"
>+			"IOCTLs and executions are blocked until device is probed again with unbind and bind operations:\n"
>+			"echo '%s' | sudo tee /sys/bus/pci/drivers/xe/unbind\n"
>+			"echo '%s' | sudo tee /sys/bus/pci/drivers/xe/bind\n"

this brings back the old version. Alternatively we may simplify the
error message with:

  		drm_err(&xe->drm,
  			"CRITICAL: Xe has declared device %s as wedged.\n"
  			"IOCTLs and executions are blocked. Only a rebind may clear the failure\n"
  			"Please file a _new_ bug report at https://gitlab.freedesktop.org/drm/xe/kernel/issues/new\n",
  			dev_name(xe->drm.dev));


up to you.

>+			"Please file a _new_ bug report at https://gitlab.freedesktop.org/drm/xe/kernel/issues/new\n",
>+			dev_name(xe->drm.dev), dev_name(xe->drm.dev),
>+			dev_name(xe->drm.dev));
>+	}
>+}
>diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
>index c532209c5bbd..0fea5c18f76d 100644
>--- a/drivers/gpu/drm/xe/xe_device.h
>+++ b/drivers/gpu/drm/xe/xe_device.h
>@@ -181,19 +181,6 @@ static inline bool xe_device_wedged(struct xe_device *xe)
> 	return atomic_read(&xe->wedged);
> }
>
>-static inline void xe_device_declare_wedged(struct xe_device *xe)
>-{
>-	if (!atomic_xchg(&xe->wedged, 1)) {
>-		xe->needs_flr_on_fini = true;
>-		drm_err(&xe->drm,
>-			"CRITICAL: Xe has declared device %s as wedged.\n"
>-			"IOCTLs and executions are blocked until device is probed again with unbind and bind operations:\n"
>-			"echo '%s' > /sys/bus/pci/drivers/xe/unbind\n"
>-			"echo '%s' > /sys/bus/pci/drivers/xe/bind\n"
>-			"Please file a _new_ bug report at https://gitlab.freedesktop.org/drm/xe/kernel/issues/new\n",
>-			dev_name(xe->drm.dev), dev_name(xe->drm.dev),
>-			dev_name(xe->drm.dev));
>-	}
>-}
>+void xe_device_declare_wedged(struct xe_device *xe);
>
> #endif
>diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
>index 02ce8d204622..48f6da53a292 100644
>--- a/drivers/gpu/drm/xe/xe_exec_queue.h
>+++ b/drivers/gpu/drm/xe/xe_exec_queue.h
>@@ -26,6 +26,15 @@ void xe_exec_queue_fini(struct xe_exec_queue *q);
> void xe_exec_queue_destroy(struct kref *ref);
> void xe_exec_queue_assign_name(struct xe_exec_queue *q, u32 instance);
>
>+static inline struct xe_exec_queue *
>+xe_exec_queue_get_unless_zero(struct xe_exec_queue *q)
>+{
>+	if (kref_get_unless_zero(&q->refcount))
>+		return q;
>+
>+	return NULL;
>+}
>+
> struct xe_exec_queue *xe_exec_queue_lookup(struct xe_file *xef, u32 id);
>
> static inline struct xe_exec_queue *xe_exec_queue_get(struct xe_exec_queue *q)
>diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>index 93df2d7969b3..8e9c4b990fbb 100644
>--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>@@ -245,7 +245,7 @@ int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt)
> 			return seqno;
>
> 		xe_gt_tlb_invalidation_wait(gt, seqno);
>-	} else if (xe_device_uc_enabled(xe)) {
>+	} else if (xe_device_uc_enabled(xe) && !xe_device_wedged(xe)) {
> 		xe_gt_WARN_ON(gt, xe_force_wake_get(gt_to_fw(gt), XE_FW_GT));
> 		if (xe->info.platform == XE_PVC || GRAPHICS_VER(xe) >= 20) {
> 			xe_mmio_write32(gt, PVC_GUC_TLB_INV_DESC1,
>diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
>index 757cbbb87869..dbd88ae20aa3 100644
>--- a/drivers/gpu/drm/xe/xe_guc_ads.c
>+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
>@@ -20,6 +20,7 @@
> #include "xe_lrc.h"
> #include "xe_map.h"
> #include "xe_mmio.h"
>+#include "xe_module.h"
> #include "xe_platform_types.h"
> #include "xe_wa.h"
>
>@@ -394,11 +395,17 @@ int xe_guc_ads_init_post_hwconfig(struct xe_guc_ads *ads)
>
> static void guc_policies_init(struct xe_guc_ads *ads)
> {
>+	u32 global_flags = 0;
>+
> 	ads_blob_write(ads, policies.dpc_promote_time,
> 		       GLOBAL_POLICY_DEFAULT_DPC_PROMOTE_TIME_US);
> 	ads_blob_write(ads, policies.max_num_work_items,
> 		       GLOBAL_POLICY_MAX_NUM_WI);
>-	ads_blob_write(ads, policies.global_flags, 0);
>+
>+	if (xe_modparam.wedged_mode == 2)
>+		global_flags |= GLOBAL_POLICY_DISABLE_ENGINE_RESET;
>+
>+	ads_blob_write(ads, policies.global_flags, global_flags);
> 	ads_blob_write(ads, policies.is_valid, 1);
> }
>
>diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>index c7d38469fb46..0bea17536659 100644
>--- a/drivers/gpu/drm/xe/xe_guc_submit.c
>+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>@@ -35,6 +35,7 @@
> #include "xe_macros.h"
> #include "xe_map.h"
> #include "xe_mocs.h"
>+#include "xe_module.h"
> #include "xe_ring_ops_types.h"
> #include "xe_sched_job.h"
> #include "xe_trace.h"
>@@ -59,6 +60,7 @@ exec_queue_to_guc(struct xe_exec_queue *q)
> #define ENGINE_STATE_SUSPENDED		(1 << 5)
> #define EXEC_QUEUE_STATE_RESET		(1 << 6)
> #define ENGINE_STATE_KILLED		(1 << 7)
>+#define EXEC_QUEUE_STATE_WEDGED		(1 << 8)
>
> static bool exec_queue_registered(struct xe_exec_queue *q)
> {
>@@ -175,9 +177,20 @@ static void set_exec_queue_killed(struct xe_exec_queue *q)
> 	atomic_or(ENGINE_STATE_KILLED, &q->guc->state);
> }
>
>-static bool exec_queue_killed_or_banned(struct xe_exec_queue *q)
>+static bool exec_queue_wedged(struct xe_exec_queue *q)
> {
>-	return exec_queue_killed(q) || exec_queue_banned(q);
>+	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_WEDGED;
>+}
>+
>+static void set_exec_queue_wedged(struct xe_exec_queue *q)
>+{
>+	atomic_or(EXEC_QUEUE_STATE_WEDGED, &q->guc->state);
>+}
>+
>+static bool exec_queue_killed_or_banned_or_wedged(struct xe_exec_queue *q)
>+{
>+	return exec_queue_banned(q) || (atomic_read(&q->guc->state) &
>+		(EXEC_QUEUE_STATE_WEDGED | ENGINE_STATE_KILLED));
> }
>
> #ifdef CONFIG_PROVE_LOCKING
>@@ -240,6 +253,17 @@ static void guc_submit_fini(struct drm_device *drm, void *arg)
> 	free_submit_wq(guc);
> }
>
>+static void guc_submit_wedged_fini(struct drm_device *drm, void *arg)
>+{
>+	struct xe_guc *guc = arg;
>+	struct xe_exec_queue *q;
>+	unsigned long index;
>+
>+	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q)
>+		if (exec_queue_wedged(q))
>+			xe_exec_queue_put(q);
>+}
>+
> static const struct xe_exec_queue_ops guc_exec_queue_ops;
>
> static void primelockdep(struct xe_guc *guc)
>@@ -708,7 +732,7 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
>
> 	trace_xe_sched_job_run(job);
>
>-	if (!exec_queue_killed_or_banned(q) && !xe_sched_job_is_error(job)) {
>+	if (!exec_queue_killed_or_banned_or_wedged(q) && !xe_sched_job_is_error(job)) {
> 		if (!exec_queue_registered(q))
> 			register_engine(q);
> 		if (!lr)	/* LR jobs are emitted in the exec IOCTL */
>@@ -844,6 +868,28 @@ static void xe_guc_exec_queue_trigger_cleanup(struct xe_exec_queue *q)
> 		xe_sched_tdr_queue_imm(&q->guc->sched);
> }
>
>+static void guc_submit_wedged(struct xe_guc *guc)
>+{
>+	struct xe_exec_queue *q;
>+	unsigned long index;
>+	int err;
>+
>+	xe_device_declare_wedged(guc_to_xe(guc));
>+	xe_guc_submit_reset_prepare(guc);
>+	xe_guc_ct_stop(&guc->ct);
>+
>+	err = drmm_add_action_or_reset(&guc_to_xe(guc)->drm,
>+				       guc_submit_wedged_fini, guc);
>+	if (err)
>+		return;
>+
>+	mutex_lock(&guc->submission_state.lock);
>+	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q)
>+		if (xe_exec_queue_get_unless_zero(q))
>+			set_exec_queue_wedged(q);
>+	mutex_unlock(&guc->submission_state.lock);
>+}
>+
> static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
> {
> 	struct xe_guc_exec_queue *ge =
>@@ -852,10 +898,16 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
> 	struct xe_guc *guc = exec_queue_to_guc(q);
> 	struct xe_device *xe = guc_to_xe(guc);
> 	struct xe_gpu_scheduler *sched = &ge->sched;
>+	bool wedged = xe_device_wedged(xe);
>
> 	xe_assert(xe, xe_exec_queue_is_lr(q));
> 	trace_xe_exec_queue_lr_cleanup(q);
>
>+	if (!wedged && xe_modparam.wedged_mode == 2) {

I wonder if these checks shouldn't be inside guc_submit_wedged()


anyway,

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
