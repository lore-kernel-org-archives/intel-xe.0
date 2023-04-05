Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBB61C7619A
	for <intel-xe@archiver.kernel.org>; Wed,  5 Apr 2023 22:36:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C5CB10E2DC;
	Wed,  5 Apr 2023 22:36:17 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E74C010E2DC
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Apr 2023 22:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680734175; x=1712270175;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=sL25td4em2sKcv6XpX/TcgEh2kgCQ5uqKUHVNOKXGKY=;
 b=H1pVJcTIULz3wUPoTP1Xui84sAtOzdNlqQjXmdE76EpN1qP0zOflJ62u
 00hVGs0hAQoTpfGHrfa0OB4rfFDEGmSw9rQuqTYmVZDrke7qW+D3AJp5G
 uputyPw1vOseFSZStWyo3z2acgjnJdIAWRL+teRrxJtH+RAa3IllP9BM1
 ILV1/b2fbOzxsfh2mL1dcVDgt9TGNYRM72aFdi1XPWlahs39gB0XpnEcr
 ciAL63sBnUZ9ZqJo6OFpT2t7LJK5B2jMszEkaDod7QL+V2B3kve03WyqZ
 1KNS4lvwYVWRW7vIMqKQtQeoL/rVjpp5aKWxlRZsb5TEorQZbN7l1VkIN g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="341312695"
X-IronPort-AV: E=Sophos;i="5.98,322,1673942400"; d="scan'208";a="341312695"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 15:36:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="686891623"
X-IronPort-AV: E=Sophos;i="5.98,322,1673942400"; d="scan'208";a="686891623"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga002.jf.intel.com with ESMTP; 05 Apr 2023 15:36:14 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 5 Apr 2023 15:36:13 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 5 Apr 2023 15:36:08 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 5 Apr 2023 15:36:08 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.103)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 5 Apr 2023 15:36:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IIp38US9w6XrpDnpgQklZVOThlrF4VPfp+eN+EAL2ow0gV77M4gL6YgaLwrVe5wwDMmZjvHmN13YOTqx3mI/3K1rxHeyM8/gLR6I91fW5uPOyQUrwCpngbbAVc0B19BrsUfoIOzvB2sImlf2GcprxpuMuKdCpbw/95CvBjfrZKM8tWQ7hq9AwZTGqkXmFdYckg6DhUdvgsYaqTeXQJVxQUTkTeN0fKR1O7XcLt3bbQPqIxVwBGI1ebN7eLVmBWi71nNDTtqPiJyJMVOuCicHvJ1DQiB0y5PgSnRquOAAaGGpKltlXZsoAJaICwVQmzcCEZvGd4Pj8fV5Igp6lIKDfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GmHPdUFMrbApLzG2kku7sJmXrlfO/E2+TRr9QCcQMwU=;
 b=L9YQ2jj1+9egdAD9u7VjOkDJCyJhbMm8rtK9TLfkWEcRzEgmhc/KW83DlLEWGf9twAOCkMY64XaEzcOzEqqibBy2nlgFlyvmr49vAlWgpa01EtR6I4/JKBszr8ENcZMOoTPJZHILV2XgVRZgWKAPhMa+I6zlYnqhBey1+F3klIT2avphq+AhzYmBU2f1w1199dxkap2L+m29Z1ojABn+lK+1cIutgS5q3KTmf2JcX4ZiCdNDNoGnmFjXQmaD2YjNv+9xWMvW5tIDDK0auW42IEFmpzLkXva/vdiGLalDsQJNFBKRsa2HlX3hfRcwvjsLMPa0aA9QxdxYEcewEg82Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB6331.namprd11.prod.outlook.com (2603:10b6:510:1fd::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.30; Wed, 5 Apr
 2023 22:36:05 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745%6]) with mapi id 15.20.6277.030; Wed, 5 Apr 2023
 22:36:05 +0000
Date: Wed, 5 Apr 2023 15:36:02 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <20230405223602.kxmiilzaabjlmodk@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20230403201702.996400-1-matthew.d.roper@intel.com>
 <20230403201702.996400-7-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230403201702.996400-7-matthew.d.roper@intel.com>
X-ClientProxiedBy: SJ0PR05CA0114.namprd05.prod.outlook.com
 (2603:10b6:a03:334::29) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB6331:EE_
X-MS-Office365-Filtering-Correlation-Id: 761818e9-464a-452d-0b12-08db36262441
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: A87u+wcYUiWc9YEHHrCaxNbt50xfXa275aaFqXydYdhes8tNIGdyO9JNDr7DvIq+sCOC0NoE4wHXGtg83Kkl/AkjaPeXbR29IIhX6gGrcH7vEWV7YEY3AjdW3+5lld1I2P53SUgzJdcD83Il66j0fxBfsqEeyqx8WzkVDZ6c9VUpMmVh+CY5kqqibP+9cov4zGsoUaLKeW/Ae8qxlHohJ+d7DMwcCzSNbTrjvQ0c1pCDlXLy0rYa9bV9MHBaSNPG/oDcXH4OWnWPI+4wsri7fySdq3sUHStrdFf0jvsnm49+fVr6QquaqCFldYVCn671OLZCWg11mJqsaZ/o0YzXONTyQLV0M2VmAR9FGlS6hZfPmH+bI+aNmwF0d9rBBOMwo+qnkHoNI7TKu0gah+Pdt32Vw52s+l7G1upVXvtxL9ftPk0eMXh4qVztN3XMrpAGXNiNuPIOMMBvzyvqYsMIEikPGscmNkTDkQi2CCBfzMWPYpTTpJHlZg6GUMCtcKp+0wbV/xPn5n1PeuZL/JAssgbC6DceS/Cvmz0v3cic664gACI6o43Yoqt/BjsBerra
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(136003)(366004)(376002)(396003)(39860400002)(451199021)(30864003)(186003)(2906002)(6506007)(36756003)(1076003)(6512007)(26005)(8676002)(9686003)(6862004)(3716004)(6486002)(5660300002)(8936002)(478600001)(66476007)(66946007)(66556008)(4326008)(38100700002)(316002)(82960400001)(6636002)(86362001)(6666004)(41300700001)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rDo3OcIBCb5FIeqf2xTzRiJQilZn9k31kMcDi/WeOqM9R2hL+c79yAiK1QOs?=
 =?us-ascii?Q?Qju+LL1yGRrz9QjUgG3hTGHyUGNwa/QtIGfQThEdfbY9zmoifWYDVgxZlvEU?=
 =?us-ascii?Q?1Z4mvKyItVTtGSKvdMBVNouvhTPu51mwwTo4N0pUZDSU3bffZpuv8Qu0HxV9?=
 =?us-ascii?Q?Wuo4S5A1GtRtZltAb39161+GXw5NMf5tua9Wc1IXnVGeNl83/lwGWu9qd4j1?=
 =?us-ascii?Q?BN5zmRsq79tGNpJgp7zhj3ZN1P0967DbnnR75id9IpjMl1OqbHvv/MAlSVre?=
 =?us-ascii?Q?PK94+TuJVfLm09cPWkoLwbTg1XHnSbydkjtPEY2CGKDg1zv/sun/Bxtl7tUO?=
 =?us-ascii?Q?tsRPIMgEEEIW72ptlHu5SplkFvSTg7IknRNmMpjhrSY8wsSmzJ/YJVbzgl2M?=
 =?us-ascii?Q?TR04J0knVRpStbaF8HiKsY+fqvY0Inmm7e04NWFwSjaU1WsoQJjah7WF+30r?=
 =?us-ascii?Q?ZC7vRH1Vdcrf41EM5vweHPKYlOsVybE47/P7qto5iTOkhrTgWNXy1CyG4GWo?=
 =?us-ascii?Q?aAp03ImwAy6dXpsgcTQB6Dr9o2BU4wULojtiETYIeaBfsTmLr6QuTFMBb2/6?=
 =?us-ascii?Q?cQ2ogGdbHgE0D8Pg9C1u1UZ7bCnQtNyWwgJ9YGcBr+29WhcvWz7kyJhvkPMH?=
 =?us-ascii?Q?WxCmoVg3zVQbuZMZ47c0Y6pp/OenMbEGxVT5vgRNbBhmKwABmj8sr04oedNs?=
 =?us-ascii?Q?pxMs5tE7EZeRkPYY9wnGuoZnO1Up1PfJTEt7EzcLA+KyTW5qFSJjhJI2bPw2?=
 =?us-ascii?Q?EsybGgNgVRf7EZaR6jeUL3NhkOOSdWDvmsI6NtcpcCTbJvUUmS+G1jXbDRGA?=
 =?us-ascii?Q?Z9wZyms+1/vrCw6W8xXzja1i0WhA3nzxOdwGcYQTD3Gz9vcpFN6bLo2DxsvO?=
 =?us-ascii?Q?Ves+1y6lLyzqJl2g7PCHd1JlCBOuFKR1W4M+giEJ6QiK1ifMX3xssKUCaH2k?=
 =?us-ascii?Q?/Oh/Ah2ZlgQUbAQNiCbbxuXgUz4KK5S3rHf5DrMupUMghXYfJ2PS2ZmllK+Y?=
 =?us-ascii?Q?O9kZMTZxmWzslVtnOG52I5EbmaXWmi4bV9tikoUikA+ovxDzAny2TCgUd5bh?=
 =?us-ascii?Q?/RcOIBNFQxqYXBN2VfpM93eaHmacvvoRhKZwaNxvJNLvztfMfnhdqZPz7lxV?=
 =?us-ascii?Q?y2Ktrr3zXkzJChB7BLjR5VlsZy+gnuFPQyf/iQfZvwZzUgEoMKoc17HgOz6q?=
 =?us-ascii?Q?wjSzPWkdetyeG8Qe7qqWihe5v8jtSV/O6b26rVqNxsTsXOlmZhqlM00nYUIf?=
 =?us-ascii?Q?F6MUxVYNR8aQ62y2ZJjD9ThqEDWUdyhuq2LeF0cNfqtDeQDK3rGvBNXuEZyt?=
 =?us-ascii?Q?sVu+qQHtFVN+Rm74LQ8wSlPcRwVOU/9ogPk/FjjFfCyaipwuLhm/XrgXH3NX?=
 =?us-ascii?Q?LNATDBh4NQzGRLnHAApBVVb1Be19+nO+5bTPrpbNTEl5g/ieo+OzpfPG+KHE?=
 =?us-ascii?Q?QIUETXRRLma5idRmhgVId23kunlghIS6YtQ50rR2HIjZUo7jrz6maLTvYlDB?=
 =?us-ascii?Q?i0M6v0bqugPtsik2Tt1HnKRFauZqeOs/2+PLeV6c2WxSx0BZGdzqlK/OuikR?=
 =?us-ascii?Q?0ssHIX9IFITW7e7R3KBeIxIqRHYFDeYW2fJuiolJnQMNSsrzLd9/VWRXCC/S?=
 =?us-ascii?Q?JQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 761818e9-464a-452d-0b12-08db36262441
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2023 22:36:05.0582 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c0LS33K4DMETi+CUFNHskPWDe60JxdAsSSrBncgvTsUviKmD01LhzTYaaURePdWJ344O1j4WBKOXji6vXTOmouFwA1eJnZ8paMLYjVtA8rI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6331
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 6/6] drm/xe: Select graphics/media
 descriptors from GMD_ID
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

On Mon, Apr 03, 2023 at 01:17:02PM -0700, Matt Roper wrote:
>Hook up dummy graphics_desc and media_desc structures on platforms that
>use GMD_ID.  When such a platform is probed, the IP version will be read
>from the hardware's GMD_ID registers and that version number will be
>used to select a graphics/media descriptor with the appropriate settings
>for the detected IP.
>
>If a GMD_ID platform reports a graphics version the driver does not
>recognize and support, device probe will be aborted.  If an unrecognized
>media version is reported the device probe will leave media
>uninitialized and continue.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>---
> drivers/gpu/drm/xe/regs/xe_gt_regs.h |   6 +
> drivers/gpu/drm/xe/xe_pci.c          | 161 +++++++++++++++++++++------
> 2 files changed, 136 insertions(+), 31 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>index f45251df5715..2d265dbb7651 100644
>--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>@@ -22,6 +22,12 @@
> #define FORCEWAKE_ACK_MEDIA_VDBOX_GEN11(n)	_MMIO(0xd50 + (n) * 4)
> #define FORCEWAKE_ACK_MEDIA_VEBOX_GEN11(n)	_MMIO(0xd70 + (n) * 4)
> #define FORCEWAKE_ACK_RENDER_GEN9		_MMIO(0xd84)
>+
>+#define GMD_ID					_MMIO(0xd8c)
>+#define   GMD_ID_ARCH_MASK			REG_GENMASK(31, 22)
>+#define   GMD_ID_RELEASE_MASK			REG_GENMASK(21, 14)
>+#define   GMD_ID_STEP				REG_GENMASK(5, 0)
>+
> #define FORCEWAKE_ACK_GT_MTL			_MMIO(0xdfc)
>
> #define GEN9_LNCFCMOCS(i)			_MMIO(0xb020 + (i) * 4)	/* L3 Cache Control */
>diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>index d634e781858a..62685b14257b 100644
>--- a/drivers/gpu/drm/xe/xe_pci.c
>+++ b/drivers/gpu/drm/xe/xe_pci.c
>@@ -15,6 +15,7 @@
> #include <drm/xe_pciids.h>
>
> #include "regs/xe_regs.h"
>+#include "regs/xe_gt_regs.h"
> #include "xe_device.h"
> #include "xe_display.h"
> #include "xe_drv.h"
>@@ -99,6 +100,14 @@ __diag_ignore_all("-Woverride-init", "Allow field overrides in table");
>
> #define NOP(x)	x
>
>+static const struct xe_graphics_desc graphics_gmdid = {
>+	/*
>+	 * Unset graphics version implies GMD_ID support; driver will read
>+	 * the IP version from hardware and then select a more appropriate
>+	 * graphics descriptor.
>+	 */
>+};
>+
> static const struct xe_graphics_desc graphics_xelp = {
> 	.ver = 12,
> 	.rel = 0,
>@@ -164,9 +173,6 @@ static const struct xe_graphics_desc graphics_xehpc = {
> };
>
> static const struct xe_graphics_desc graphics_xelpg = {
>-	.ver = 12,
>-	.rel = 70,
>-

can we change the logic so we leave the version here?  While reading the
rest of the driver it will be horrible not to have in the source code
the reference about the IP version.


> 	.hw_engine_mask =
> 		BIT(XE_HW_ENGINE_RCS0) | BIT(XE_HW_ENGINE_BCS0) |
> 		BIT(XE_HW_ENGINE_CCS0),
>@@ -175,6 +181,14 @@ static const struct xe_graphics_desc graphics_xelpg = {
> 	.has_flat_ccs = 0,
> };
>
>+static const struct xe_media_desc media_gmdid = {
>+	/*
>+	 * Unset graphics version implies GMD_ID support; driver will read
>+	 * the IP version from hardware and then select a more appropriate
>+	 * media descriptor.
>+	 */
>+};
>+
> static const struct xe_media_desc media_xelp = {
> 	.ver = 12,
> 	.rel = 0,
>@@ -194,9 +208,6 @@ static const struct xe_media_desc media_xehpm = {
> };
>
> static const struct xe_media_desc media_xelpmp = {
>-	.ver = 13,
>-	.rel = 0,
>-
> 	.hw_engine_mask =
> 		BIT(XE_HW_ENGINE_VCS0) | BIT(XE_HW_ENGINE_VCS2) |
> 		BIT(XE_HW_ENGINE_VECS0),	/* TODO: add GSC0 */
>@@ -298,12 +309,8 @@ static const struct xe_gt_desc xelpmp_gts[] = {
> };
>
> static const struct xe_device_desc mtl_desc = {
>-	/*
>-	 * FIXME:  Real graphics/media IP will be mapped from hardware
>-	 * GMD_ID register.  Hardcoded assignments here will go away soon.
>-	 */
>-	.graphics = &graphics_xelpg,
>-	.media = &media_xelpmp,
>+	.graphics = &graphics_gmdid,
>+	.media = &media_gmdid,
> 	.require_force_probe = true,
> 	PLATFORM(XE_METEORLAKE),
> 	.extra_gts = xelpmp_gts,
>@@ -414,9 +421,91 @@ static void xe_pci_remove(struct pci_dev *pdev)
> 	pci_set_drvdata(pdev, NULL);
> }
>
>+static u32 peek_gmdid(struct xe_device *xe, u32 gmdid_offset)
>+{
>+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>+	void __iomem *map = pci_iomap_range(pdev, 0, gmdid_offset, sizeof(u32));
>+	u32 ver;
>+
>+	if (!map) {
>+		drm_err(&xe->drm, "Failed to read GMD_ID (%#x) from PCI BAR.\n",
>+			gmdid_offset);
>+		return 0;
>+	}
>+
>+	ver = ioread32(map);
>+	pci_iounmap(pdev, map);
>+
>+	return REG_FIELD_GET(GMD_ID_ARCH_MASK, ver) * 100 +
>+		REG_FIELD_GET(GMD_ID_RELEASE_MASK, ver);
>+}
>+
>+static void handle_gmdid(struct xe_device *xe,
>+			 const struct xe_device_desc *desc,
>+			 const struct xe_graphics_desc **graphics,
>+			 const struct xe_media_desc **media)
>+{
>+	u32 ver;
>+
>+	if (desc->graphics->ver) {
>+		/*
>+		 * Pre-GMD_ID platform; device descriptor already points to
>+		 * the appropriate graphics descriptor.
>+		 */
>+		*graphics = desc->graphics;
>+		xe->info.graphics_verx100 = (*graphics)->ver * 100 + (*graphics)->rel;
>+	} else {
>+		/*
>+		 * GMD_ID platform; read IP version from hardware and select
>+		 * graphics descriptor based on the result.
>+		 */
>+		ver = peek_gmdid(xe, GMD_ID.reg);
>+		switch (ver) {
>+		case 1270:
>+		case 1271:

`case 1270 ... 1271` seems slightly better as then we can easily extend
the range.

>+			*graphics = &graphics_xelpg;
>+			xe->info.graphics_verx100 = ver;
>+			break;
>+		default:
>+			drm_err(&xe->drm, "Hardware reports unknown graphics version %u.%02u\n",
>+				ver / 100, ver % 100);
>+		}
>+	}
>+
>+	if (!desc->media)
>+		/* No media support at all */
>+		return;
>+
>+	if (desc->media && desc->media->ver) {

no need to check desc->media as the condition above just returned.


... some nits above, otherwise


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

This series needs a rebase as it doesn't apply anymore.

Lucas De Marchi


>+		/*
>+		 * Pre-GMD_ID platform; device descriptor already points to
>+		 * the appropriate media descriptor.
>+		 */
>+		*media = desc->media;
>+		xe->info.media_verx100 = (*media)->ver * 100 + (*media)->rel;
>+	} else {
>+		/*
>+		 * GMD_ID platform; read IP version from hardware and select
>+		 * media descriptor based on the result.
>+		 */
>+		ver = peek_gmdid(xe, GMD_ID.reg + 0x380000);
>+		switch (ver) {
>+		case 1300:
>+			*media = &media_xelpmp;
>+			xe->info.media_verx100 = ver;
>+			break;
>+		default:
>+			drm_err(&xe->drm, "Hardware reports unknown media version %u.%02u\n",
>+				ver / 100, ver % 100);
>+		}
>+	}
>+}
>+
> static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
> {
> 	const struct xe_device_desc *desc = (void *)ent->driver_data;
>+	const struct xe_graphics_desc *graphics_desc = NULL;
>+	const struct xe_media_desc *media_desc = NULL;
> 	const struct xe_subplatform_desc *spd;
> 	struct xe_device *xe;
> 	struct xe_gt *gt;
>@@ -445,22 +534,32 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
> 	if (IS_ERR(xe))
> 		return PTR_ERR(xe);
>
>-	xe->info.graphics_verx100 = desc->graphics->ver * 100 +
>-				    desc->graphics->rel;
>-	if (desc->media)
>-		xe->info.media_verx100 = desc->media->ver * 100 +
>-					 desc->media->rel;
>+	/*
>+	 * If this platform supports GMD_ID, we'll detect the proper IP
>+	 * descriptor to use from hardware registers.
>+	 */
>+	handle_gmdid(xe, desc, &graphics_desc, &media_desc);
>+
>+	/*
>+	 * If we couldn't detect the graphics IP, that's considered a fatal
>+	 * error and we should abort driver load.  Failing to detect media
>+	 * IP is non-fatal; we'll just proceed without enabling media support.
>+	 */
>+	if (!graphics_desc)
>+		return -ENODEV;
>+
> 	xe->info.is_dgfx = desc->is_dgfx;
> 	xe->info.platform = desc->platform;
>-	xe->info.dma_mask_size = desc->graphics->dma_mask_size;
>-	xe->info.vram_flags = desc->graphics->vram_flags;
>-	xe->info.vm_max_level = desc->graphics->vm_max_level;
>-	xe->info.supports_usm = desc->graphics->supports_usm;
>-	xe->info.has_asid = desc->graphics->has_asid;
>-	xe->info.has_flat_ccs = desc->graphics->has_flat_ccs;
> 	xe->info.has_4tile = desc->has_4tile;
>-	xe->info.has_range_tlb_invalidation = desc->graphics->has_range_tlb_invalidation;
>-	xe->info.has_link_copy_engine = desc->graphics->has_link_copy_engine;
>+
>+	xe->info.dma_mask_size = graphics_desc->dma_mask_size;
>+	xe->info.vram_flags = graphics_desc->vram_flags;
>+	xe->info.vm_max_level = graphics_desc->vm_max_level;
>+	xe->info.supports_usm = graphics_desc->supports_usm;
>+	xe->info.has_asid = graphics_desc->has_asid;
>+	xe->info.has_flat_ccs = graphics_desc->has_flat_ccs;
>+	xe->info.has_range_tlb_invalidation = graphics_desc->has_range_tlb_invalidation;
>+	xe->info.has_link_copy_engine = graphics_desc->has_link_copy_engine;
>
> 	/*
> 	 * All platforms have at least one primary GT.  Any platform with media
>@@ -471,7 +570,7 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
> 	 * FIXME: 'tile_count' here is misnamed since the rest of the driver
> 	 * treats it as the number of GTs rather than just the number of tiles.
> 	 */
>-	xe->info.tile_count = 1 + desc->graphics->max_remote_tiles;
>+	xe->info.tile_count = 1 + graphics_desc->max_remote_tiles;
> 	if (MEDIA_VER(xe) >= 13)
> 		xe->info.tile_count++;
>
>@@ -488,9 +587,9 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
> 			gt->info.type = XE_GT_TYPE_MAIN;
> 			gt->info.vram_id = id;
>
>-			gt->info.__engine_mask = desc->graphics->hw_engine_mask;
>-			if (MEDIA_VER(xe) < 13 && desc->media)
>-				gt->info.__engine_mask |= desc->media->hw_engine_mask;
>+			gt->info.__engine_mask = graphics_desc->hw_engine_mask;
>+			if (MEDIA_VER(xe) < 13 && media_desc)
>+				gt->info.__engine_mask |= media_desc->hw_engine_mask;
>
> 			gt->mmio.adj_limit = 0;
> 			gt->mmio.adj_offset = 0;
>@@ -498,8 +597,8 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
> 			gt->info.type = desc->extra_gts[id - 1].type;
> 			gt->info.vram_id = desc->extra_gts[id - 1].vram_id;
> 			gt->info.__engine_mask = (gt->info.type == XE_GT_TYPE_MEDIA) ?
>-				desc->media->hw_engine_mask :
>-				desc->graphics->hw_engine_mask;
>+				media_desc->hw_engine_mask :
>+				graphics_desc->hw_engine_mask;
> 			gt->mmio.adj_limit =
> 				desc->extra_gts[id - 1].mmio_adj_limit;
> 			gt->mmio.adj_offset =
>-- 
>2.39.2
>
