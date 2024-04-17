Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E4C8C4345F
	for <intel-xe@archiver.kernel.org>; Wed, 17 Apr 2024 18:18:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DF3810E617;
	Wed, 17 Apr 2024 18:18:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kOns54MS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C59F10E617
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Apr 2024 18:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713377909; x=1744913909;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=YUmB4fM23zxp8wUwi3eMZmenyjG2PhZ2Y6dBRS5vx2A=;
 b=kOns54MSzubVOPMUgL6pRuyVrKii9T56Ok3ulxkqoYy53Hdv0uhdzEiE
 4ALTayMDKq0xcpr1hZHhm8LZfN9N4hHrSuJjYqtRQSFbHTzmLLA3yWWI7
 L9pFEPFRzjb2YcMssOP7gTjk74NGnGJwntv6f4HV9326C6kD4ti1mokSa
 yUdBvVvKchAr21POtjZm94G4AgKuumGpw4M9Gt5jbkD1zwVOB3h6urtFs
 AegM/+iz03CY6ug8n6TFpsiI9CCvD7utvFHEA1QyMb/b7LcHQ8e+PilF6
 sV5M5P30Dm/nnAppxXYAqiSQ+Pr2Y9z5z6iU9ZhUVwWwVpRn9bil0WT9c w==;
X-CSE-ConnectionGUID: En+dFH5ES6+nait5x9O2XA==
X-CSE-MsgGUID: Gb4e5CClQGuhCTXbCDKR9w==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="12667848"
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; d="scan'208";a="12667848"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 11:18:28 -0700
X-CSE-ConnectionGUID: wkBp07v8QyS11I0dDg8j/w==
X-CSE-MsgGUID: Nr//LpkPRau5o2r8RnyCsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; d="scan'208";a="23203268"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Apr 2024 11:18:28 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 17 Apr 2024 11:18:27 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 17 Apr 2024 11:18:27 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 17 Apr 2024 11:18:27 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 17 Apr 2024 11:18:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YCgpZpuVPz3TOpizlzCB4gF8RvkIRc8+Kpz2buAcpBjUayEyDcQ2Ciq00XA4V/6zkVDgVHONWWIOhdRKgPPFvD7Dv6f4387DB6BvPvn140B07Mb/JkEIzC0dxL5GAbWmSWF7vZx+4Up2NvpuyPacskOIUNQAF9v6LNLkhJ+B0R3BoAfiEMreBzYAfuAt/ZglH40r9855yfvH7WlX4LADobCfECxDo1/C6pTsK6Nks0+vSASZRV2uhI7DpbAn8047BsrfJ47bB8czbunWSJyMkX54TBCyKqvZbrrXwJhJJP6mnZDNVMXlDJX9Z3XLORlXUf5upiSAnPZVbnBu/41w/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zkd3zJA6Sy1gHPlKsimCOWt4t3/BGOAinKet++J9/H8=;
 b=NH6qsBSq7o2wAjFcWF8tQXKa8a8aXo5JDwijalxCLi3aViGipX8feKJcsULvp+RNNyfGG2gWQiO/EcBKTm77xL+4rQ7h9McUIw1Tjsvyy+It2CdNJfMQ1VNGVMXzoADuEaReUBn8PxVid58StENAV1UQNsfyyb9RGk+0LiqnyPA1N4Gp6EGmCK/2NKjJw0pcltwHde7r6rOPqJNOcOkiPa3f5p3zVCmXdElCaVrAGwrI7L/ENA+kBtCWVNeXQXmYdPSGFkBZ2g9RK2736csdW7eV+LDxWrDG1JF3h5oplK0QW9AkWB8Ikij5iECFTL6V4Yq8uixnLfiAYoJ/E6JF2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY5PR11MB6368.namprd11.prod.outlook.com (2603:10b6:930:38::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.39; Wed, 17 Apr
 2024 18:18:22 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7472.025; Wed, 17 Apr 2024
 18:18:22 +0000
Date: Wed, 17 Apr 2024 13:18:20 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Define all possible engines in media IP
 descriptors
Message-ID: <vwpy2sr62wcnwkjslreseee37kpi47msw5l4mbvos7dxuavnqa@cohkzrvkkddv>
References: <20240417152621.3357990-2-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240417152621.3357990-2-matthew.d.roper@intel.com>
X-ClientProxiedBy: SJ0PR03CA0229.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::24) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CY5PR11MB6368:EE_
X-MS-Office365-Filtering-Correlation-Id: 96d7fa11-9bf3-4c88-3bf4-08dc5f0ac3f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sGNh0g4VYw404laKk4K7yRoZCPYl9kOSPbRRupxUeDQKrUNLHJhVb1Y14h/I7NpXm6ufZ5Qe976IaYihIegGMVbndi//KiOPNVoNsDmG3s8ppfbr6awWjFuZYch9mdoROqNNP1BR+C4pYKroC5Ui8EeOnN3UDxNdSFMqty4WE5ESVMo8ughea1peToKC/AUGt3VYzEt92BjbbpBxq0gjjnaR/Q5s6xVMTRDQGa1zQfzitGGt1gV6csZUdB7jRfhu1XIoCrWl3rBWy1zffbUX3zwMkVvfSE6Ue3nRDB9tAO7YmyJIlHFYTJbXtdka2UWUmU9Y2mNx9xnFNR+KXfAKpm+4VMqTDJv4BDhnnP0GvOuwl4erpCfxWDGyst8pXuUHxttygu5TFLwxJHAhy7u5SB91PGEGjeHZ2vnlufx6BCKTum53TyKaf5EAtzH19Ol0PvJKxElwaY11RraWD9S3ihcGn90xcViR8uXTKJrmro8ahFThjKZwWYNEPfSQNesXnXsyWv/V09KxcO5b0Enl8ZbLaR5ZJ1j/n80wXMIlgET5gjUs9jNsZNb03AQ+d+yKKiBE4YIo3b0F3wiNx4D8Y1WeYp2Wl5wq9J8NVRt+DrSbQVGKnxljkVFgewmocear3FlaslF+xSntC0pE0qeXmrFfCSvtj+rJx+wJNNmsp0Nw/Qww3jgyblNJP5223yy9+5ADVe1VS14yUHYi2Zld0Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007)(27256008); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FZ0KHEAfDlfHzDxMq3IS8a9n/zTvYZ41/VW977vsLg67GHQYyTtK7eOVtopc?=
 =?us-ascii?Q?wuhzrivM9gzFnIa2FBFhQes1KsASdq965ow6uz6FT8Chn4a5XiZLZheThBhi?=
 =?us-ascii?Q?1EOPuAVv95kSR+oi5CW6dQCTwbVHnyec6IDwDvT44uZs2HTG4G6mdzUZ/tfh?=
 =?us-ascii?Q?G4hYIGPTzNZTF6ULzbMiwx/N2b40QzdObFnZff+FS8PRwiTQOJRyLnt6wucc?=
 =?us-ascii?Q?v5Cx22zTrzPb7y3jkO5BbTNNfiAJ2cT+ArBBnCoSOdE0R9q8NHyiIQJZ49TZ?=
 =?us-ascii?Q?3rmkNnS8weVOq2JcDIfsFUmHR4XLCi66rwyVqk4li/oCcKDr2nVX1oJNoRwI?=
 =?us-ascii?Q?1wT6xEqd1RYrsUwOx8RJr1HYNTSNAGDYbZxyyyzdQRL9DQ6kqXsqv8rDAeMa?=
 =?us-ascii?Q?EnGUBiQ6HyE2IuIYXghE3pqGvW67Z5mR/eE2zYLqiDaCnBiuoHSzNQqt9YAb?=
 =?us-ascii?Q?K/IAmt0vwv0WbOf991hQsTAjnZmadeGrAOiheYj9nXHCRCFX7O2k81geAJnQ?=
 =?us-ascii?Q?7OxuCtZakApwDgeTw78+WV0RIZrMM80dJRixK9Ck4rzSVxeg0PxaTnlvlHYZ?=
 =?us-ascii?Q?Ue2KYQHn3ZI5MpxVu3UtKWLexPFoSn2fQwGByTk510S44z6VrhL6JmZjrbwh?=
 =?us-ascii?Q?WZXLy4+rKHO5ziBJJ+KN6hzeC8o5GR1/jJtZ0wikOHHOqwg+gE6rPpOYVi3O?=
 =?us-ascii?Q?hN/MzdPZHDGKcyd1PYQUrR3orBcgHpukzyrCbYuvtHDD7/s6rWEWT4IDX17l?=
 =?us-ascii?Q?G+35F8fy87vNPqU5/E3KiOpPGs/AFmCrMLto1kBU85pjjRCC4kxexnxEEv7z?=
 =?us-ascii?Q?R+HyFUc51VKWHbVN68+PAUoZp1RpC1kYyK4xk2oyWOjJAuCkLmUwcB8LDWE4?=
 =?us-ascii?Q?wM9AFOuhonTGliMxm9l2cGAdlXMWlnaslUr4DYKC/6PTJtYIkD92cQ+8hIYn?=
 =?us-ascii?Q?cUfMYJ2V++ZNMlQieeN7IfvYbzPHYpWbGCMM+ZMHqQ+EmDU5UOkRJRyKLlij?=
 =?us-ascii?Q?nNcK7KfmyIrltu1oqTtKvwkbP4vwZDX3ONcpnJWSNVFgO338Ome5dBT4eUBH?=
 =?us-ascii?Q?3Sp6awzwFsFY5b6aVOV+jZoAaCnawssfh/90avPaS0zHVUOu/mZHqK+/XYaO?=
 =?us-ascii?Q?3QR6YMVCR8v1z5YGctdYfw59fwVqfFqqAo8oMN3nBMrpGftm7N+LDSbKAUl6?=
 =?us-ascii?Q?F9R7GhduW2ktTG+X3TZKtnop2i01G8oDtLZj9n6OSiZ4TbFlUeefwU19hIIR?=
 =?us-ascii?Q?GJINFaNynKo8V5cfGtG/Tv1Ks/wRMilFQY71vyRVq4eqvBPf4J6TyqpRRrsV?=
 =?us-ascii?Q?OBp3DOrPNK3l7AcQibGL8vCVWaJYA5zTMMVaAFpAex/ix6+pPCT+tvOZvK0f?=
 =?us-ascii?Q?aQXiEgLAm5KPR5VVJYeT32Zcge/zw+Kg3qhJOxA0YgcvXWPzSGK8XXNyt2PT?=
 =?us-ascii?Q?JoB/tnD1LfL6d27IdE8Rqpq8o28URwTlf0fKM6y4lq/gXnEALn3QgJAQJaKY?=
 =?us-ascii?Q?6gd0taNokXJck8Yk+d5F5pj6oq6S+SUoqJBx7onQWhkiuGl6HIjHn7csvQXr?=
 =?us-ascii?Q?Qz3l/wusEX+gvhiyVS0VfMfJuN8S61pPhD4kL8mblt5oOspLqIKJl3usTOt4?=
 =?us-ascii?Q?Tw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 96d7fa11-9bf3-4c88-3bf4-08dc5f0ac3f6
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2024 18:18:22.3560 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cSDpMGPXDyS1PcIPeWFnPXH0xFtaEQ2odfiLzNX7r5HZgUfja1jJLNR2EXhL2Owc0b7kDPFG3bjBSBLAfJPePaV4EXWIwxx/pF5seIgTfBA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6368
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

On Wed, Apr 17, 2024 at 08:26:22AM GMT, Matt Roper wrote:
>Rather than trying to identify exactly which engines are available on
>each platform in the IP descriptor, just include the list of all media
>engines that the IP could theoretically support (i.e., 8 VCS + 4 VECS).
>We still rely on the media fuse registers to tell us which specific
>engine instances are actually present on a given platform, so there
>shouldn't be any functional change.  This will help prevent mistakes
>with engine numbering (for example ambiguity about whether the 2nd VCS
>engine on a platform with exactly two engines is numbered "VCS1" or
>"VCS2") and will also future-proof the code a bit more in case new SKUs
>or platform refreshes extend the engine list in the future.
>
>Note that the media fuse register technically has an 8-bit field for
>VECS engine presence starting on Xe2.  However there's still no MMIO
>register range reserved for VE engines above VECS3, so VE0-VE3 is still
>consider the "maximum" VE engine mask that the driver can support for
>now.
>
>Bspec: 52614, 52615, 62567
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

I remember we tried something similar for BCS and had to revert. However
for media it seems we have fuses available on all platforms, so should
be better handled by the current code.

Assuming CI is happy,

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_pci.c | 16 +++++++++-------
> 1 file changed, 9 insertions(+), 7 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>index 3b30353dbc09..0d21306f8995 100644
>--- a/drivers/gpu/drm/xe/xe_pci.c
>+++ b/drivers/gpu/drm/xe/xe_pci.c
>@@ -185,8 +185,8 @@ static const struct xe_media_desc media_xem = {
> 	.rel = 0,
>
> 	.hw_engine_mask =
>-		BIT(XE_HW_ENGINE_VCS0) | BIT(XE_HW_ENGINE_VCS2) |
>-		BIT(XE_HW_ENGINE_VECS0),
>+		GENMASK(XE_HW_ENGINE_VCS7, XE_HW_ENGINE_VCS0) |
>+		GENMASK(XE_HW_ENGINE_VECS3, XE_HW_ENGINE_VECS0),
> };
>
> static const struct xe_media_desc media_xehpm = {
>@@ -195,21 +195,23 @@ static const struct xe_media_desc media_xehpm = {
> 	.rel = 55,
>
> 	.hw_engine_mask =
>-		BIT(XE_HW_ENGINE_VCS0) | BIT(XE_HW_ENGINE_VCS2) |
>-		BIT(XE_HW_ENGINE_VECS0) | BIT(XE_HW_ENGINE_VECS1),
>+		GENMASK(XE_HW_ENGINE_VCS7, XE_HW_ENGINE_VCS0) |
>+		GENMASK(XE_HW_ENGINE_VECS3, XE_HW_ENGINE_VECS0),
> };
>
> static const struct xe_media_desc media_xelpmp = {
> 	.name = "Xe_LPM+",
> 	.hw_engine_mask =
>-		BIT(XE_HW_ENGINE_VCS0) | BIT(XE_HW_ENGINE_VCS2) |
>-		BIT(XE_HW_ENGINE_VECS0) | BIT(XE_HW_ENGINE_GSCCS0)
>+		GENMASK(XE_HW_ENGINE_VCS7, XE_HW_ENGINE_VCS0) |
>+		GENMASK(XE_HW_ENGINE_VECS3, XE_HW_ENGINE_VECS0) |
>+		BIT(XE_HW_ENGINE_GSCCS0)
> };
>
> static const struct xe_media_desc media_xe2 = {
> 	.name = "Xe2_LPM / Xe2_HPM",
> 	.hw_engine_mask =
>-		BIT(XE_HW_ENGINE_VCS0) | BIT(XE_HW_ENGINE_VECS0), /* TODO: GSC0 */
>+		GENMASK(XE_HW_ENGINE_VCS7, XE_HW_ENGINE_VCS0) |
>+		GENMASK(XE_HW_ENGINE_VECS3, XE_HW_ENGINE_VECS0), /* TODO: GSC0 */
> };
>
> static const struct xe_device_desc tgl_desc = {
>-- 
>2.44.0
>
