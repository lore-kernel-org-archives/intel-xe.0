Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B347C77B7A
	for <intel-xe@archiver.kernel.org>; Tue, 23 May 2023 06:51:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D787010E3D9;
	Tue, 23 May 2023 06:51:26 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0024510E3D9
 for <intel-xe@lists.freedesktop.org>; Tue, 23 May 2023 06:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684824684; x=1716360684;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=quxZc9ASX4NjE6Ww6dOo0X4B23YrZHQsX139txpHA2A=;
 b=DDX/ZL/eBEKwZJWPI7dDQe1VutgczuEJWo0e7yhfcEpJ9/r0gqTnIgCr
 Dj6EMVfQZaIXlb9ME9IFKNtosE0Mfs6mG3C/3RieWJdvTVPQcZT/wFBNR
 2A7m9mpDN0sTxNe6MKf86KQjIBgI2g/aA7DaqIE/kiTGeIm3zPeClCB2L
 v9g+2+aiICBAvKZHloqe+7Qw97Ib9dGCUDDo1vkSR/JmBB2f+wvdmUZ1i
 rBleTVL3TBpbpr28bSykzpFllslsbnnQtRe3hBYWpZ1KFKhxIr1Ttg9Xd
 B0ssoZ9nO9utYdrQGt7dJsEe7KFHuv7nUBQGgLZMeUu+Uhl2+W8HgBvVk g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="342611416"
X-IronPort-AV: E=Sophos;i="6.00,185,1681196400"; d="scan'208";a="342611416"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2023 23:50:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="950437540"
X-IronPort-AV: E=Sophos;i="6.00,185,1681196400"; d="scan'208";a="950437540"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga006.fm.intel.com with ESMTP; 22 May 2023 23:49:50 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 22 May 2023 23:49:41 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 22 May 2023 23:49:36 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 22 May 2023 23:49:36 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 22 May 2023 23:49:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T2km19Eas4uzCcgI7d8BtAu0MqH3kl9kVELr0/TjbUIZXHMOZn1qhZaeYoSXxx8WO/N8yN7d5WLJTbW5fwQu7Fcb2Kw3fnw8cioWQxPIzjT4w5eE9Q1BrsX3Hn5VYHwMSluZX69KSkp7du5UE+dkjjtmXDN4Run2EhwH9XB5zQyYatMHYLOiPHa1ckJ7+fZXeZF0Ef8I7l/iH5he9qPCh+OJNQNp6wTCt3wysMW1AnInvlJAtfZiM77/q6/L3/d5ixxIxUPt6nf26M6AkW/v8oKX20ttTPXJIE7m509HlaGodkHL2ZtN14BVy5ivZe9g+Xuy91TvwbLyU8zlzTuj+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Rl+c66DLwjti/NPOii/83yIO92fEjhGfIAR/HndqqA=;
 b=MF0BEAvnwOBEKP0kiOM8jawr6wnm1O8Tw0l8XPekjUndVND75tGT2F2Z47xqZuAxYbvS01Rv3QC845jMSG9tQeALAvNVjBSGzj7VrPbLQ9gY40j2qUDk2pSigCS+sbFOnPZ8T/pWD39RK0ER3XvPziEXobTOynvXBeyIoZDzra1mzRBijHN/NGrbHbzHtkN/NKzvDtz7Bypf+kOYzpQIM6KNNhvcvaVfBefO2cQ/hdKZEmNwifEF5x75+klwDjHoTItlgGbCjanjEUtnpyeODtmH2zJ+o7Cj9B12yb2REghSRm5GLzrbKAsr8gOGPy4g5OcTwzoq0fjAuo+YzawHcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA1PR11MB6417.namprd11.prod.outlook.com (2603:10b6:208:3ab::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Tue, 23 May
 2023 06:49:06 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6411.028; Tue, 23 May 2023
 06:49:06 +0000
Date: Mon, 22 May 2023 23:49:04 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
Message-ID: <kpjxmnghgy74jhjgmjyb7wlcaxwqy5scpqvtibjgw5mhfkmsi2@25qiavmpij37>
References: <20230522125529.52695-1-gustavo.sousa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230522125529.52695-1-gustavo.sousa@intel.com>
X-ClientProxiedBy: BY3PR05CA0056.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::31) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA1PR11MB6417:EE_
X-MS-Office365-Filtering-Correlation-Id: 17f53c9f-ee6b-45ba-520e-08db5b59cd60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4FNudS5muEUNFrp9+gz9i37GMsLS7OBURZDahYFgddQLOdLF/k9SkPpY0SmSQr5QWJOFiY8gj6ddYPb6aNZZj7+zzDTucPiTJOcVoXrDl36FnTNAYTNYfb6WDpZxZx8RecZgyDGxO37aSb8NOCzJTwqJDWp95BKcdBCmkTaZP/BcH2RrrPb+E9blrd64VK3PWtvxXJPQ1qdiriW4bHOsfdvlrOA6WZl6aoynWFGfvEIpkqFi/A15FuxYZbuACEkWto8XPAHt2OqzgUihLkU8MXCjjClONnL8Bo4M3DljbbmJuwl/pQ04j3jCjCi5akjyogQcGarLVXEf8HixXUun57m1weGTQbED11AkEPybV60mpw2eLoCwy+ZVw0Y64mocqXoyqkXk555A1CaOS2ncewNzp+StC+/jNsOOwK/ptcoTH8YMAYNkVznxQx+ReMRA4Pj/tqqKQg/k8P41r9TK4pSB/yvca5kgNRAh7v9m3DqedBJHzMCImScTZsSZgIk2hdhR6YENhC1DK//qN0a0bPmdMkcuuxr3c+X2SG1iLuZWch9dgt9ALjkbSGPt+KXQ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(366004)(136003)(346002)(376002)(396003)(39860400002)(451199021)(33716001)(66476007)(66556008)(66946007)(41300700001)(86362001)(5660300002)(4326008)(6636002)(316002)(8676002)(8936002)(6862004)(83380400001)(2906002)(478600001)(82960400001)(26005)(6512007)(186003)(6506007)(6486002)(38100700002)(9686003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iFqIQ0HoOUw5sXKheEeu2lHgorFdFOvvk4mW3PGZXrFVAoh1bMeNKvBx0xLK?=
 =?us-ascii?Q?whgXeY0lt34Aosr/Awg3atJ4khPDvPM07DXBA9KtZJxPJwMEDXGDz8p0DZxQ?=
 =?us-ascii?Q?NiqxSRr9slxkoLoF6bbGM/2BnFuEhlpI+in4XML7Vf+on0vd00NS8WES0Kvk?=
 =?us-ascii?Q?ucDDHzughpfBU1y8M00Dzpjl+3uKWdAO2l4CVt4s9hpIuaSradfAw+GOR2Yf?=
 =?us-ascii?Q?O/ESusyV12bmhGzcnWK1dtmwELdEZnHC4EUhtxE3IB0roG5tfOOrGFSyYTJA?=
 =?us-ascii?Q?bZzvZ1iMFYoeDz8R7vqQiAuIua8CWMKyL0S5KIYF+9UMNoQd7+vOA+iPwfik?=
 =?us-ascii?Q?3raVUSOa941Hk1brxLidB7qxcBBBUm0oQLpQryRIecMK8d5N5U3CvIAZL4Ag?=
 =?us-ascii?Q?dT+fJ6QkwyKnbK2u1Vo/XPttXA8w+WOm8sTgd+JK7MkAa48AGTtPSAKBRP9/?=
 =?us-ascii?Q?bG0TPZApcc+1dmqp82Hiq0qXHbmnQ7VNdtO8Vb40qvkuXG42BkAuM23iCoLr?=
 =?us-ascii?Q?3izq3CTpjaczBMmL4pX3FyN/zIAzwawxapMFAdBeuvg9EFbWJQuCxMXEB0GM?=
 =?us-ascii?Q?qTum6H2qcTFj8uehfkeE+mCkixz5VoqjVWsr7Jju2a9AMGxcimJZ2VQ/8qvh?=
 =?us-ascii?Q?+KEvWLmHfCFG7Bd90IhDErZOHSQSuyG8MDzBX/aQ7xGnJWA0fRawtihCRVUf?=
 =?us-ascii?Q?7j2Dxt78i5WICmoqVcKQ6Cfyy2noINwBjRDZ7Z2THJq8sKhvusaDfJAY5OAb?=
 =?us-ascii?Q?L1ihjHxS3yYBXZQjMYOmw8VkxYA3YuVFO3vw2CChlY5j8NwgHyJn8bCiYrO5?=
 =?us-ascii?Q?29YJHCToUDUfmLHOTet2O1bp0pyzHZlq3dOk4uKzjxymBVyTnuMWQB+tDuIP?=
 =?us-ascii?Q?OVHki6E+qrwNanaKW4xzcnXFyknqIwxSSe80VE4aLzUm27M55WnWwXwKaZdo?=
 =?us-ascii?Q?lfWM3DlSF3DVIKA18oV79OqJ0hRuBpwXu122h9YIMl7pEOOefQ1OP+M42v5e?=
 =?us-ascii?Q?0WC2nNZ/4Bf53rJd/UkNJzt3TYa5nyiVj8/zWvO8iJGMf162Yxmi7lI20cUj?=
 =?us-ascii?Q?3MlyimUiikeRsYG/ZtbaiKE4irnVOmU0sd7RlUP8dzhlpg1dx8lG1jFv6+TI?=
 =?us-ascii?Q?qxkdfc26hwJzqIa+wb9iJBgsghwYiS1jHyeqUvjjFcEPY6onVYdJEyd34k9y?=
 =?us-ascii?Q?4yajgHvEVthtiwcYmXor4alklSg7ejgitsXZTllAQsMHk090yKPKahF8VsWN?=
 =?us-ascii?Q?wPvKY4gTt5MTt8/utHIVSR2c+2ipMunjB89qqFdRi5WvYwWe9+jBqWRp4Tnm?=
 =?us-ascii?Q?oIQBdYksK9+/Z5tZjsMlG+15FqTrMnK2IdhLs1g3ZnX0org5oNMt9bKG+svK?=
 =?us-ascii?Q?ogGJTc+RPXiNFCefuolRj0gu5qUBa7RhIAhUPJ70H+oPhAdtUG4aO86avdgR?=
 =?us-ascii?Q?D/4yC6xAUh8w8yLjTmhxwaTrBzWXj1vU+NKm8LxwyXkGdhMW0iqOYeUys1+K?=
 =?us-ascii?Q?qddYyeUsFWTV/EUKQWihZUxXCd6W0A8esm+jBsvtM3MyK8oL0RU/g7oA8wh2?=
 =?us-ascii?Q?1YcBgcPQk9RuAFFSKabT6jKa+qT/pPuWNhRtcsZtYdo4n/W06C6sLWSbf1H3?=
 =?us-ascii?Q?+g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 17f53c9f-ee6b-45ba-520e-08db5b59cd60
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2023 06:49:06.2675 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rg2sGesiOA65zFUfv/voM/6rsXFENdfAz1Blkg2dGSBvBCFjH3zwaWUaiShZk5m/lqPGi+IZMiULJHifulzycsYla+C3MFDtgBo2J7z8nxs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6417
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] fixup! drm/xe/display: Implement display
 support
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

On Mon, May 22, 2023 at 09:55:29AM -0300, Gustavo Sousa wrote:
>Remove the call to drm_aperture_remove_conflicting_pci_framebuffers(),
>which is already being done by xe_device_create().
>
>Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_display.c | 6 ------
> 1 file changed, 6 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
>index c122cc4b27c9..1a9e9c78966d 100644
>--- a/drivers/gpu/drm/xe/xe_display.c
>+++ b/drivers/gpu/drm/xe/xe_display.c
>@@ -10,7 +10,6 @@
>
> #include <linux/fb.h>
>
>-#include <drm/drm_aperture.h>
> #include <drm/drm_drv.h>
> #include <drm/drm_managed.h>
> #include <drm/xe_drm.h>
>@@ -199,11 +198,6 @@ int xe_display_init_noirq(struct xe_device *xe)
>
> 	intel_device_info_runtime_init(xe);
>
>-	err = drm_aperture_remove_conflicting_pci_framebuffers(to_pci_dev(xe->drm.dev),
>-							       xe->drm.driver);
>-	if (err)
>-		return err;
>-
> 	err = intel_display_driver_probe_noirq(xe);
> 	if (err)
> 		return err;
>-- 
>2.40.1
>
