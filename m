Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 216B1C072A2
	for <intel-xe@archiver.kernel.org>; Sat, 18 Nov 2023 00:26:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC80310E037;
	Sat, 18 Nov 2023 00:26:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92A4810E037
 for <intel-xe@lists.freedesktop.org>; Sat, 18 Nov 2023 00:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700267182; x=1731803182;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=eeJQM0G3wqfunqXT/ITUvvula5GzYH99n9GVPYINOGs=;
 b=gu1QIApWROzbHzgRYN/Hd5cAGIb5DReTcRkOhj0l7/DX0bf20BxFHvgP
 KSSkpDPAgH42yYA0K/6OUjb5ektY1rKHKrV0qj+SRm7+ZGIcXXcY2DHQx
 tbA04zI5cpj0vnAIwcWKQE8xLNEi9vVR4gdoQeClYbKFQAfMZ3d/xVgNm
 S1HgRCgN0rYivH1I0xQ7hEoSyBN5oQHwglXTnpZfESCBV/6S1WbU0A7Fx
 tB/oDLBWy3YpyV77j/wPtUUwMXg/nySq/5x2ikkgG7DnlAQbNGl7sN4MX
 PEa6he39wcA/5mLv7gEtGXce2LY4BhSVPjAhRVODpwqpRtwtOImCcuhwA Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="455688442"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; d="scan'208";a="455688442"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2023 16:26:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="939302743"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; d="scan'208";a="939302743"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Nov 2023 16:26:22 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 17 Nov 2023 16:26:21 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 17 Nov 2023 16:26:21 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Fri, 17 Nov 2023 16:26:21 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Fri, 17 Nov 2023 16:26:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tu6zOjJmGmtd0ZQbbxTKW27aKby0cTQNFoLmkwHzSUZrmRhE4IKzoBmBvqPojMG8Y4TbcOaUeas8l/V/0vS4sFgeMgxG9NFcmFhu3Q9SaieWi2yh58+PziXYYVWT7nRQbY6Aug2aj15KOddngRMAHf8yLwWnwdo5K26RtPesk67kQbBGLeGDllmycXrAxiv8dT2WZ9rl0ocdPyvMC3AfYem3VX45edDr7qwcrZI7fSh9cOcGtzWSfi7OE03rPgPyN1V0dydeEYCBawOe6eRo8q8IAgGZuMQyias+aw+/taWJNtGrQ7MQ9lAwcSb3eybXFzhXBvc2J3OMtWqmDBH5Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u5J4SHqEQCObbDQKAuQOnKbgdRm6J9n8pjCDMGPOarA=;
 b=asIYyFtGI384Rq9RwCjbwyGIHkKc/Ml5tBuz65utDr6OJ5zyEChf9HwqzudmTpDGLpSmZS2xtICf7IZioQxQ8yPDvUdNMGekmn8DDzqAhZMKJC9hv3H/6HpOc1WPo4mkr6p+ub/qiMIgPdcrP+DIQzfAuDSUoAKOW9T0l0SsqdsUbqpOAm0mFOXV7XTlJ/tteuVGiuF6/nzwYOZ5EZOxupY5QKUecwaLHerHdM+TNtOFV/wB5B76fvWVWEuE6LyZDayY/zhUkL4XauiDUSJfKqqIxeah9Natja2W00gl5nys8aoPm2uiZiIcl09gmm+Kggnj2US7iJZ+Yq3xuFKfNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by MN6PR11MB8219.namprd11.prod.outlook.com (2603:10b6:208:471::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.23; Sat, 18 Nov
 2023 00:26:19 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0%7]) with mapi id 15.20.7002.025; Sat, 18 Nov 2023
 00:26:13 +0000
Date: Fri, 17 Nov 2023 16:26:10 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20231118002610.GE1327160@mdroper-desk1.amr.corp.intel.com>
References: <20231117231411.631895-1-lucas.demarchi@intel.com>
 <20231117231411.631895-3-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231117231411.631895-3-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR03CA0358.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::33) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|MN6PR11MB8219:EE_
X-MS-Office365-Filtering-Correlation-Id: 63b8e2e8-b349-4db3-0cc6-08dbe7ccf81d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: o66Ule+jQB7V/XunElbnrm8RAPeQBwXCRuFzfTLdzFU95QP+pe3Obm5q9rcbnSx42ExUnLoqNnDZtkYlTdeXSur+7RuBZx/UVdNFXf8jZzAA+MCuWMjInPvxop1VU8heusCmMDRdjfz33DySvY1cRXke9oc3vFQyx2qCcrNTaXFYZWb57gaVyHPyAFL3cbDmSGbLtN+rkBvUxEM1UgjbWKe+1Sji4asgGmJisioxQWNsIJzTpxTMIh4zds3g+FOuVTo/gdlLDC0iIemAeI0LULSQ6wgNxhJ1XliPQhAS1vrj3Oj+VT4ra5YNFSEor77MvLNQjTgKa0PGp6dmbEgTjFD9ONUI6V2hI3x20tNp57njzi/r5j2Cy1AfYEV7xulp2zWpHx6Pm9DxYdPCLXIlq/+yLXzbirq1UM8MtTVqw91ra+Au7DoaZqIguKneyf++cnGNzZtwBtjh0hoAO9O4J6vl0QUXl5EEEbARkIvLHlDzXH1xR7t4KltPUaWe1JGoTFLLT3zlZpXvZtspDSTwLrRIfty677QWJueLXWvB/Xg4Qf2+koI5VGEkTdCgxhb7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(39860400002)(346002)(366004)(396003)(136003)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(38100700002)(33656002)(41300700001)(86362001)(6512007)(6486002)(66476007)(478600001)(82960400001)(66556008)(66946007)(2906002)(107886003)(1076003)(6506007)(26005)(6636002)(316002)(83380400001)(6862004)(8676002)(5660300002)(8936002)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ofBZSbnbVFWIDUhTOh7rdBqClwkSGegRbFRoj4qIS613Wx3h79lzXOAIyu8y?=
 =?us-ascii?Q?pmPW37YWtJbC9MZSTpm7i5iKDUuc03jG33shJK+mT+4SQHvRjx8HI3uNwUkZ?=
 =?us-ascii?Q?TbW4GH8p/rfEyEJeSh9pFswWJXV55OV6/rnMbjYQsmV86ieTyqqZ1HZFnnvB?=
 =?us-ascii?Q?PaPHRS/7+lVTvV/yF8HpPDahrmPPEDRV69DY5C8653fORKkmdXN7Ph5FSTkT?=
 =?us-ascii?Q?ounKAwlMJNHmkRC8JAJ8Pl5n6kTbgS20eO4lIsWkiDKExGGqWtr2X8EdTu+e?=
 =?us-ascii?Q?UsQko3yxKidAelXuAx2agSSgO9NBOpdZscu03jEH18WV7As0sIL3/gT80Z7m?=
 =?us-ascii?Q?WYIXTuDoA5Q1V9HAjyZqqb77l0mnPamgs+CpBfzC28UuraHs3VmmUMfxKyIb?=
 =?us-ascii?Q?j7/XqltGLLHjFLbys5P9nCBhHzk4Eyrm+7NbPo5Di1VGCN8bx0G1bDm6oaGG?=
 =?us-ascii?Q?qYymOVl9RfgVuXMlnL1CZo8CtFiBBvox8bXSgotJrm+otG9CKPOLw/T3BsW+?=
 =?us-ascii?Q?iWMCKij2R5XQdoezQK405b0QkpufJjyCvezW7NyQSmdxDxup55egQ9eJbIMC?=
 =?us-ascii?Q?P5cPEwphuw6ovptjrtAOd1i+lmLGbX6XyL1Nyl2T9o9gZwBvK01dSaHH2v/7?=
 =?us-ascii?Q?QtBhSkpYAFKK3EVocBSWS36vlwqSwRI3+obvWfcC7/HLEus1Jpds8Cptogyw?=
 =?us-ascii?Q?amOBoo7gnf/Hl3G+FIuFIMnpfb4X+JAaIfOurHSK7Uj88QFzOldJKGOVr6Sx?=
 =?us-ascii?Q?2M8jhmvzeaAeQZWXp0Cyx6psWeQSk+V1+lv1JK45wJx08G/LmvTah8qB6Nz0?=
 =?us-ascii?Q?6RrQmAGkm+bUW6CeZtXoxANOExXIQwVhfgE4AMPG2R3Ads1RhyFYYuL9SCfy?=
 =?us-ascii?Q?ZBmRPVs3oM1bP7xF0j2mIpSOB0zsrQNg+HSKSYkw/GpFl4BPRSeKVncP+gRE?=
 =?us-ascii?Q?MtadesWLlPRAXOsiOJHCdDHD5RD+X6h36jhcIrt4eZ18ZToxWQMUn3SaGtRJ?=
 =?us-ascii?Q?lZctlQBz8ooAR8w+Q6qC+PjuBsL+DhIEN7nPKjcXt7coEVIy/5iarg5SUsEN?=
 =?us-ascii?Q?MacNEXYZiH6lBVuY8+vC50VoADJyw4Iej0PQ9pOoE/vau8KFQedJwD/899Sj?=
 =?us-ascii?Q?JPTyMQY8/9K1WzJFE86/r6UHQKGHJzCKPfqA6Rsu0R4PIm/JBTI66sTp5vQh?=
 =?us-ascii?Q?H6Y3T0pOBy+4AJ+emdMqqDSKs8QQkgBYwMwJZueU90/+smOaCbmDlmi84p2y?=
 =?us-ascii?Q?jQt4kE2VyU/XjYoXuGkRKccueNLDY1n3LraR/uPwJ6xmRZytBqDCVKE7qQYC?=
 =?us-ascii?Q?JWwq/zVsTHqfOdIB3cxx2AhuIFZ3Q216wxOJ/BCTzkgQSZ9+CLQ1sRXaVnhK?=
 =?us-ascii?Q?wMLhhUcQ31Pk/TyiGDTpm5djKfAZcSiOhjrRrZMPGONuaTsI0T62Lkof2XGK?=
 =?us-ascii?Q?5YpmRNBXQ+/rWSxHFuGEBop8Z4EdJcUk+6SyH5oet6DArAt8DIiiNcqv1MNI?=
 =?us-ascii?Q?FcdGHUJEWgwGP/TKGbSAGuSFbuUvmumfzQcGnrY6wpTzquU6ITC3rpTlP/i5?=
 =?us-ascii?Q?CGIqoxidr3YVAoDxV0LuYtDdJDjPdLQDYUUBamL7pZWXOs/6F2RIIxdY17S3?=
 =?us-ascii?Q?Lw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 63b8e2e8-b349-4db3-0cc6-08dbe7ccf81d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2023 00:26:12.6209 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MBxWDLNScsbJr/eDhLXp+OD2s/y3g5i83V6c24KAn0wyzxNVvAj06UdGq/xzOBDl3pWaPN17lc9NSpTfz7sTM0QxG/1EaA0OAlMSslpi33Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8219
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/3] drm/xe/kunit: Add stub to peek_gmdid
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
Cc: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Nov 17, 2023 at 03:14:10PM -0800, Lucas De Marchi wrote:
> Currently it's not possible to test the WAs for platforms using gmdid
> since they don't have the IP information on the descriptor struct. In
> order to allow that, add a stub function for peek_gmdid() that is
> activated when the test executes, replacing the iomap and read of the
> real register.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/tests/xe_pci.c      | 19 +++++++++++++++++++
>  drivers/gpu/drm/xe/tests/xe_pci_test.h |  6 ++++++
>  drivers/gpu/drm/xe/xe_pci.c            |  2 ++
>  drivers/gpu/drm/xe/xe_step.h           |  2 ++
>  4 files changed, 29 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
> index d1bc029f7a13..ef4f2ae140f5 100644
> --- a/drivers/gpu/drm/xe/tests/xe_pci.c
> +++ b/drivers/gpu/drm/xe/tests/xe_pci.c
> @@ -9,6 +9,7 @@
>  
>  #include <kunit/test-bug.h>
>  #include <kunit/test.h>
> +#include <kunit/test-bug.h>
>  #include <kunit/visibility.h>
>  
>  struct kunit_test_data {
> @@ -107,6 +108,22 @@ void xe_call_for_each_media_ip(xe_media_fn xe_fn)
>  }
>  EXPORT_SYMBOL_IF_KUNIT(xe_call_for_each_media_ip);
>  
> +static void fake_peek_gmdid(struct xe_device *xe, u32 gmdid_offset, u32 *ver,
> +			    u32 *revid)
> +{
> +	struct kunit *test = kunit_get_current_test();
> +	struct xe_pci_fake_data *data = test->priv;
> +	const u32 MEDIA_BASE = 0x380000;
> +
> +	if (gmdid_offset & MEDIA_BASE) {

This works for the two offsets we might get today, but seems like a
strange way to write this.  Something like like ">" instead of "&" might
be more intuitive?

> +		*ver = data->media_verx100;
> +		*revid = xe_step_to_gmdid(data->media_step);
> +	} else {
> +		*ver = data->graphics_verx100;
> +		*revid = xe_step_to_gmdid(data->graphics_step);
> +	}
> +}
> +
>  int xe_pci_fake_device_init(struct xe_device *xe)
>  {
>  	struct kunit *test = kunit_get_current_test();
> @@ -145,6 +162,8 @@ int xe_pci_fake_device_init(struct xe_device *xe)
>  		return -ENODEV;
>  
>  done:
> +	kunit_activate_static_stub(test, peek_gmdid, fake_peek_gmdid);
> +
>  	xe_info_init(xe, desc, subplatform_desc);
>  
>  	return 0;
> diff --git a/drivers/gpu/drm/xe/tests/xe_pci_test.h b/drivers/gpu/drm/xe/tests/xe_pci_test.h
> index b4b3fb2df09c..811ffe5bd9fd 100644
> --- a/drivers/gpu/drm/xe/tests/xe_pci_test.h
> +++ b/drivers/gpu/drm/xe/tests/xe_pci_test.h
> @@ -6,6 +6,8 @@
>  #ifndef _XE_PCI_TEST_H_
>  #define _XE_PCI_TEST_H_
>  
> +#include <linux/types.h>
> +
>  #include "xe_platform_types.h"
>  
>  struct xe_device;
> @@ -23,6 +25,10 @@ void xe_call_for_each_media_ip(xe_media_fn xe_fn);
>  struct xe_pci_fake_data {
>  	enum xe_platform platform;
>  	enum xe_subplatform subplatform;
> +	u32 graphics_verx100;
> +	u32 media_verx100;
> +	u32 graphics_step;
> +	u32 media_step;
>  };
>  
>  int xe_pci_fake_device_init(struct xe_device *xe);
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 682ba188e456..7c85e88f707c 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -5,6 +5,7 @@
>  
>  #include "xe_pci.h"
>  
> +#include <kunit/static_stub.h>
>  #include <linux/device/driver.h>
>  #include <linux/module.h>
>  #include <linux/pci.h>
> @@ -442,6 +443,7 @@ find_subplatform(const struct xe_device *xe, const struct xe_device_desc *desc)
>  
>  static void peek_gmdid(struct xe_device *xe, u32 gmdid_offset, u32 *ver, u32 *revid)
>  {
> +	KUNIT_STATIC_STUB_REDIRECT(peek_gmdid, xe, gmdid_offset, ver, revid);

It looks like this expands to a "do {...} while" so does it need to go
after the local variable declarations?


Matt

>  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>  	void __iomem *map = pci_iomap_range(pdev, 0, gmdid_offset, sizeof(u32));
>  	u32 val;
> diff --git a/drivers/gpu/drm/xe/xe_step.h b/drivers/gpu/drm/xe/xe_step.h
> index a384b640f2af..686cb59200c2 100644
> --- a/drivers/gpu/drm/xe/xe_step.h
> +++ b/drivers/gpu/drm/xe/xe_step.h
> @@ -16,6 +16,8 @@ struct xe_step_info xe_step_pre_gmdid_get(struct xe_device *xe);
>  struct xe_step_info xe_step_gmdid_get(struct xe_device *xe,
>  				      u32 graphics_gmdid_revid,
>  				      u32 media_gmdid_revid);
> +static inline u32 xe_step_to_gmdid(enum xe_step step) { return step - STEP_A0; }
> +
>  const char *xe_step_name(enum xe_step step);
>  
>  #endif
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
