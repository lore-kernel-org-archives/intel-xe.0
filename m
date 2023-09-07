Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3219AEE14D6
	for <intel-xe@archiver.kernel.org>; Thu,  7 Sep 2023 06:05:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2E0110E760;
	Thu,  7 Sep 2023 06:04:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 273DB10E760
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Sep 2023 06:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694066698; x=1725602698;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=r68lBjcuZAeMBcu6k8+ggoiXko9tt+UgESlXsXYyEZM=;
 b=LOZgNILTrMEJbmNkPHb0hy2vwAfiE/BtuaBiAsY1+OjUYwwMC1RBV7RY
 IkZEOpmMhJz5PNc/tEDoNAMQUI+JWrEj/CwgrtvoXaMHKshCMcAA45goW
 bYb1bAbUVn2li+uqHXZJR6IQKEpLFtn1mk52031ka7LYJzyYEpdB4B/O3
 sU22RfHbAyNvdo54oOjQj1Jh7vh72lwtOjYUhtSzEj2tqHHgBF5L4jNOF
 tgod3yUzKJJwJb/DGVtLR5nuoCpjlIiS/so2H26UfyAygWUPaqbJ0vNyA
 abiG34TEftdQVenuGNY6HyB/Lw6Qy6grd/Kk+PXqAfS4j0G6gxYpX6hor Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="374660330"
X-IronPort-AV: E=Sophos;i="6.02,234,1688454000"; d="scan'208";a="374660330"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2023 23:04:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="741884540"
X-IronPort-AV: E=Sophos;i="6.02,234,1688454000"; d="scan'208";a="741884540"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Sep 2023 23:04:56 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 6 Sep 2023 23:04:56 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 6 Sep 2023 23:04:56 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.176)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 6 Sep 2023 23:04:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=McnNRc9djJfkEieRbZ17EnP5DCJTtIbANYgXfuQENTuZ/93fZxLN7kPVbjEYkNr3fomLOhOTpXLJfh1tx2782gOkBaFcYgLjcrXlrbtEcQ5I7n0Gbm2vQvhbMWtAmsTiYuOArZr0IHGBXz9O4AVlitY2A21dwfAA2B+hmdHrDmOe7AIQjYYxJdU+v/5qEysQavgHG1EX/ZKEkOwCQq/p2OXeQUKuhopRYFeWz7dd7hRDOccZWHDNRmju9C4YxgTHkxr6I/8j5E4KbJEk5rWYR71PmkwYTR3hJOIeEKuGDYIvcJfA9vMmaxbHDPOAokiq8egmaqfinnTJsNduS7KzMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1h2YvrJN2/yqBrNtQz9Viz14EYsum80ZBlQ3y7u/Lxw=;
 b=XS0JkGDq43Mf61ly74NpFJo+CZdr5DXTCU7Ks/N/Y0Nx4ksHtMFKXeXpPlvW6eVIrsNAZH3KPBuyq5J2ygW29cBuzh5hAFQs6FdF9OsqUY5uqq7Tr1IemSjUEOcKgg6pZnYymE2x078myvW99wSDMRt9Hg3BOkwLvPEsSXptZOI/ulziyoI5t5Z8QgO95/zewU8MhDMzJaNK4QT7uANNDfHZAr4nwXxDSfjf1RzfJXtP/Qc8YFN+SRzInVnWRbB0Iw+Kx6CcBfBKYGdb1Bcjp2Hexx8P8Kv1RlTJtjHiD3HAumuLynesFRiSzJQhXkWZQbFxneyil24zfT5gNl6Ghg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB6017.namprd11.prod.outlook.com (2603:10b6:8:5c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.36; Thu, 7 Sep
 2023 06:04:54 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79%5]) with mapi id 15.20.6745.034; Thu, 7 Sep 2023
 06:04:53 +0000
Date: Wed, 6 Sep 2023 23:04:50 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
Message-ID: <reyaspnxulqwrm2cnhezpefw6qgftiyscg6o3yvcib2n2fn47b@6pzvlaetzlxm>
References: <20230906212333.61119-1-gustavo.sousa@intel.com>
 <20230906212333.61119-2-gustavo.sousa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230906212333.61119-2-gustavo.sousa@intel.com>
X-ClientProxiedBy: BYAPR05CA0089.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::30) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB6017:EE_
X-MS-Office365-Filtering-Correlation-Id: 92c1e6ff-a3b7-4ac0-b3a8-08dbaf685ac7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: D9gVhO1368Ab/On/21bFela0oj3fGkw9ehBW9C7TjM/a3GaYY2iwemOMPRV8gbtP7Ym/XoLtIC6gtheTrqcPjv5rLfTIqOsvfULSvjU0KFasyYM13n7vI/6ykecDHk0qE9hGlDjs4vfP27rlc1rQNqwpOHwBNdeXwhy1B7eU6AotAtNJTtYt34jpIpoj4bjMBGt7t4K/UHRs5Tnm2RsObBxaulgnU16VUyoouhUKA1/b6wmxah4pgqmqTNeob27mGePBjDTuv6WTgkXGQhAHkgpfNH1ok4NQICrYA3BZ83WthvTls9ZwMaCoB1VD+qjcTCRq4iFiohMdKSTosH15areD4Ea1TCrctdnX3CzFC4TlU4xI84Y7T3kFew5w2Hgaaui3HclZcLiocoRneSij8p5utxER/KyULoRF9Q0GX29LkeaiFbcR6e6po0diJ7CkJaqADBhGQRSMlO+l3k8zRvISxEuKSa/ZlTB9PGuR/LBPNypSP1jMeFqguUoMaM08UW2xF1wcXM68u6tPhtqyUDs13tnIP9S0SPnwJWUn90oFDkZXjVy0BSP2rvd8OG8L
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(346002)(366004)(376002)(136003)(396003)(39860400002)(451199024)(1800799009)(186009)(38100700002)(82960400001)(33716001)(9686003)(86362001)(6512007)(26005)(6486002)(4326008)(6506007)(41300700001)(6862004)(5660300002)(8936002)(316002)(66556008)(6636002)(66476007)(66946007)(478600001)(8676002)(83380400001)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?t2h4k1WwCx4FlYjakxZc1crMOziP66QKxtaYloj+Ay54ftL4TuHtf/FDwwIz?=
 =?us-ascii?Q?Uh3NJvAK93XRnTF9s3pQq+AM04OSfhyJOHy6VpYzKJ0uC9SNXPSe/44OGTOD?=
 =?us-ascii?Q?fhPArO04Mh9CAp8xfudvou6yuxgLneZWEHQBUn9yk9rP888BmAWVXyiAW5y7?=
 =?us-ascii?Q?qJ5Xeg/lRi33GDEwGTleBMHb8ret8ASa94fGFZYXMCXAt+bXdorqzrPQ4Q07?=
 =?us-ascii?Q?MsuLPU/tgRmtYJ1QGzIqWFnurrANvU/Cjf6R1aqGC5g1In3+GLl8sA9XoNKG?=
 =?us-ascii?Q?8xN8hIc1pd9ZvFnqBrM+5fBRnPxkdIAS5NaB/XGUiQFHCB7dWHZoMUXrq6m+?=
 =?us-ascii?Q?qsdpOjlmz/g/zaIKoowRoX3P0leXeNR+5101dGYpqDMS0OBaYZM8O1wYdfoq?=
 =?us-ascii?Q?h7etQxfomhAqWE71BoIMbYsFCp+ANAvy9+Wxq7OlPIrIJWj/5Iko3WRsiTbn?=
 =?us-ascii?Q?4S3II9jJJoQhk9MXQpDvvMwXwsmNiZQjKU23tagQoqTmakH/10GjdoV18Ubo?=
 =?us-ascii?Q?RuVPkVZ+n3S2BrH00f1MGtRw4SZ1LMyQhSIOSLpikSFS8Hu/wq5s888pg0ru?=
 =?us-ascii?Q?4ZD1pvq0RxI6AN/u0hJF8M7qg37ImmgA9um4ZsrQUKuXuVMXJWQnscJXlBP/?=
 =?us-ascii?Q?RWd5KjJQ0c/h7gdsjqAdxV+856MdoqAiaQq74EkK6yxaqbz+ljXXdGGiSjZb?=
 =?us-ascii?Q?ziaY3lin9SmACXI7YXbvxaYljZGJEO2dOoVmRoe3UCJMf+Xd74IgJvL1izXT?=
 =?us-ascii?Q?uDKRbbwASrXxowquGi0JV/tiogN6yoZnAnOlxZCc2ujiZXmG69pYW3i1HJl2?=
 =?us-ascii?Q?raIMDnKnUvf2vJgG4/SdCTx21N5jB65E1+Lxb5ih+jYIbYVKaQzjsFzie/57?=
 =?us-ascii?Q?gExCKBYGLwg0stD8elU+bZteZ2iUCGNcbw71gEEejXoA0J3kdZxwbdCvWogJ?=
 =?us-ascii?Q?PgdTiRUfV//+vBtEJSZBpKCwRbOc13rNOT1wMCSr/EFTcdyPbUbEjeqVM8GM?=
 =?us-ascii?Q?NRagAWcfqwYvFFe3PK7xmyM8i73NrnBrD0ChtCVZdOWPpFgOII5Y7Rfoe0Ht?=
 =?us-ascii?Q?7hSF8wH30eKU4oqO38wH5LAjSBlI8dFzjj4yHHbnxuTzd+R3MiUVyi57noMB?=
 =?us-ascii?Q?0XsroT6DJieWaDAsh/DHQ+XGuLVaQe+/hi9Al7qLi8FjA83ttJB2bVL8Za7/?=
 =?us-ascii?Q?PioFH0DCUDjY4rTpJYoaKuZcCBfq6UVTojTaM9i9HyWouNQM5OANBaBwq0bC?=
 =?us-ascii?Q?5akFtHViwhguRf7PFhtwaL6KDT0BHxdKltFkYROgwIqvlZwzSxeK5Uk2hA7e?=
 =?us-ascii?Q?2iKpai3gFRBlYxNqDqcPe8w/QZHNJNghwt8EB95X4pq7ZpVMa1x+48JqxSM4?=
 =?us-ascii?Q?8VBQ7qbgcJvqa3uorGD4yFGsU13GEBybInbyNgyzVSr4VM4wDRdtf/mau7+e?=
 =?us-ascii?Q?9y9yMY8/6+nukc8i6JWwNHHC/8l7d6CV2IGeuTPA/A37b5AwpPRPu3URgEvP?=
 =?us-ascii?Q?hbFFymQTHFLoRc60OjK66Tqv60xglJw7S/bIaVyNk2RnO8nWo/bcTcdKqUzm?=
 =?us-ascii?Q?8m3jac3kdUpsGUa57ZJvLUaKKrHD+zCxatReSJVsVnWuxAo5kHwEJ45LwshU?=
 =?us-ascii?Q?Hw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 92c1e6ff-a3b7-4ac0-b3a8-08dbaf685ac7
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2023 06:04:53.9288 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GaRkriBvR0SlkZ+KCM/miVEzm8aQwDnVbEa6B3AUJp37x3SjVa4yn6CNfY3ZwZnRyjQ/oySU1WRcVFnHGW1eVXTizsrHH9BmtcEUkLr+APo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6017
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 1/1] fixup! drm/xe/display: Implement
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Sep 06, 2023 at 06:23:33PM -0300, Gustavo Sousa wrote:
>The function xe_display_driver_probe_defer() was supposed to return
>-EPROBE_DEFER when not yet ready to continue the probing, but the
>current implementation is actually returning 1 instead of the proper
>value, which would probably keep the probe operation to be attempted
>again.
>
>Fix that by making xe_display_driver_probe_defer() return a boolean just
>like intel_display_driver_probe_defer() and return -EPROBE_DEFER on the
>caller if necessary.
>
>v2:
>  - Make xe_display_driver_probe_defer() return a boolean and return
>    -EPROBE_DEFER on the caller. (Lucas)
>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_display.c | 4 ++--
> drivers/gpu/drm/xe/xe_display.h | 2 +-
> drivers/gpu/drm/xe/xe_pci.c     | 5 ++---
> 3 files changed, 5 insertions(+), 6 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
>index a453946ad108..35a4b4cd179a 100644
>--- a/drivers/gpu/drm/xe/xe_display.c
>+++ b/drivers/gpu/drm/xe/xe_display.c
>@@ -38,9 +38,9 @@
>  *				   early on
>  * @pdev: PCI device
>  *
>- * Returns: 0 if probe can continue, -EPROBE_DEFER otherwise
>+ * Returns: true if probe needs to be deferred, false otherwise
>  */
>-int xe_display_driver_probe_defer(struct pci_dev *pdev)
>+bool xe_display_driver_probe_defer(struct pci_dev *pdev)
> {
> 	if (!enable_display)
> 		return 0;
>diff --git a/drivers/gpu/drm/xe/xe_display.h b/drivers/gpu/drm/xe/xe_display.h
>index 9e29de012df7..2fa5b239d076 100644
>--- a/drivers/gpu/drm/xe/xe_display.h
>+++ b/drivers/gpu/drm/xe/xe_display.h
>@@ -12,7 +12,7 @@ struct drm_driver;
>
> #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
>
>-int xe_display_driver_probe_defer(struct pci_dev *pdev);
>+bool xe_display_driver_probe_defer(struct pci_dev *pdev);
> void xe_display_driver_set_hooks(struct drm_driver *driver);
>
> int xe_display_create(struct xe_device *xe);
>diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>index 24b16863bf3d..dc233a1226bd 100644
>--- a/drivers/gpu/drm/xe/xe_pci.c
>+++ b/drivers/gpu/drm/xe/xe_pci.c
>@@ -677,9 +677,8 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
> 		return -ENODEV;
> 	}
>
>-	err = xe_display_driver_probe_defer(pdev);
>-	if (err)
>-		return err;
>+	if (xe_display_driver_probe_defer(pdev))
>+		return -EPROBE_DEFER;
>
> 	xe = xe_device_create(pdev, ent);
> 	if (IS_ERR(xe))
>-- 
>2.41.0
>
