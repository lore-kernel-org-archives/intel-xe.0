Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E937EB64DD
	for <intel-xe@archiver.kernel.org>; Sat,  5 Aug 2023 06:55:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 189FF10E15C;
	Sat,  5 Aug 2023 06:55:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3CDE10E15C
 for <intel-xe@lists.freedesktop.org>; Sat,  5 Aug 2023 06:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691218533; x=1722754533;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=2c72dskIOPDDbxJ83z25F5F+lYg2A8N93oPLLNyg2FU=;
 b=BBRR3dqn+FonPvUG5DLTVnW2NA6dr42CR820De+1Er9OhB1Q03cIIWXb
 VSZFu4fqbfvQF6FwN31Ew4DksF8eFkcRB+4ucYEzPCNL+lpEL9W2Nk68C
 4dkUN4PW8YG5FsauBp50QJFjekHR0GRdcUaZFi7pwD7xAd8/pEH+vwDqp
 QblD4Ikf/WDTKoDvtJBLKMGiMYT5PjFU+t+1xwfJAfHXduIv/po16Ynpe
 GD8HlTxkrKzYfr6LHNGxX2WVjIGzh91/A0SUh6QSAdR0S+7XevnwebZc9
 WQOGogvPEQ2LnMbORRJ9i+/oedi1p2+vsXajNtO7Qj2hL5uDowdrc8Whg Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="456676051"
X-IronPort-AV: E=Sophos;i="6.01,257,1684825200"; d="scan'208";a="456676051"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2023 23:55:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="820397789"
X-IronPort-AV: E=Sophos;i="6.01,257,1684825200"; d="scan'208";a="820397789"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by FMSMGA003.fm.intel.com with ESMTP; 04 Aug 2023 23:55:21 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 4 Aug 2023 23:55:20 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 4 Aug 2023 23:55:20 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 4 Aug 2023 23:54:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KahSI/FiVGaJJw3wA+mAaq5EvWogg6eSuMi5iJysWOhL3XKR4RBtYnUKc/C4fOSSAxjIpAvz5QJKuY3mXKS0AkI1ZoCnwAJvjLQg7t9CMHjpZtQmRsKJSFjd/tS63YwCjI/HLflS3oLe0x2M4fx8E+FligETpHnlRwO5lkZ5mXv84aSbW5uJxX2PqBR6+y7Qkb7RlQrgp/rRr9JADCZMs01sXrsbbpmQLPdWZp8T9jQ8UQle9SOY4p6GAZ19W8Of0XxfYG8E5L4/qLhqfsby7V89iicjvuLhie3XSTrda72ia+mylX6c1cCGv7emS2YO9IRcs447MC6aMxlFOU0pdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xxNt3NBlHraS/XJ56ved5A7Z3lkEJMC1KtDYokiWBJI=;
 b=S0bx/6csHQi2U+3aK3TPuVkG7vlHsmET/hVVdglI5T6vwqNSycXRUzCiO0B+NfZ0s7rR08cJD3j26CoTZPSWaZ9qA5W2BTEDanuSIqOQVwSX15PnoquHGceyE4IvKtEuq+jRYtnkcAfLX2sAB9+CunG14q+IgUsaHjtQKYEa924Dkk1SDhoExBMQaCYhgOwYl6ZGIOguAceaDhEP66MlWGXsV1Tv2CCGEMnvVrFiyRsKrIYF/UIuJsTWUcf6uQ0QIuow2qZoUgZ1zcOSRHVjRyLGe+i2xxKI7z5aefmiwz3wmOBxpJJd8USxwmjBI+AVTkrpTzfFR7BneB03t1gtFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by PH7PR11MB6860.namprd11.prod.outlook.com (2603:10b6:510:200::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.20; Sat, 5 Aug
 2023 06:54:56 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::ee81:9c69:6117:358c]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::ee81:9c69:6117:358c%5]) with mapi id 15.20.6652.021; Sat, 5 Aug 2023
 06:54:56 +0000
Date: Fri, 4 Aug 2023 23:54:53 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Message-ID: <ZM3yPQuRHqWK/fFc@nvishwa1-DESK>
References: <20230804213253.2381705-1-umesh.nerlige.ramappa@intel.com>
 <20230804213253.2381705-3-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230804213253.2381705-3-umesh.nerlige.ramappa@intel.com>
X-ClientProxiedBy: SJ0PR05CA0064.namprd05.prod.outlook.com
 (2603:10b6:a03:332::9) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|PH7PR11MB6860:EE_
X-MS-Office365-Filtering-Correlation-Id: b828e9bd-66a9-4df6-8802-08db9580e0e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: arRQFTepoYS0RpEzm+PWy2OsJ0laejYHcwHU09InWFoX+CfBExQkH/MTpFTPOWgB0p4z2+EVWgppkOAL9bkxWbH6nX+hbw0hGhX9uBn6U5jTT5+jD6UBjy6aS7x8P1soa4B5vk2OJHBHSNVZaIx+hWX2ARW1bI/k6Q+LWopz/3leDbl9NrODVE5TXWU1cutgyHOLSVV9mzfwggdXcHb7GSwRRK/q/sdt+56dyrHu2GvLkfjfSh1WWk2gZ2TyftXdSEnqLAY4wjHKBW+h7tjr4E0jRgyy0omPA0S69OWzriDTkbcT2xUG+kO2fmlYCOLF8z7U4dG4Br9MlsMzqnjQ+WQxjWYZsDbo7ol3YhxluaufYhU0T6QqqOGzD5d1WUFOq4Xg6PC3UfokN48v25fz6aYrQ6Jbb8q4OrbSVr2uxge4Iig6rTjETjS04vOoRb3ol1am9P5EUNchvVYpou9NoLirUjr9tjDqOPravMK+6g2P6gkrvVzfsDiN6Kdhoa9VkqJj2KbsmKaZuleW6Lp2nvoq26L4KVNg9Rtx7FWgQ/TPtbzhYqWQvba67s3zKIuB
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(396003)(136003)(346002)(39860400002)(376002)(366004)(186006)(1800799003)(451199021)(6666004)(6486002)(6512007)(9686003)(66946007)(4326008)(38100700002)(82960400001)(66476007)(66556008)(5660300002)(41300700001)(316002)(478600001)(83380400001)(6506007)(26005)(33716001)(8936002)(6862004)(2906002)(86362001)(8676002)(44832011)(6636002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DcMzM+fk3IeyGLhXXQU3yw1HS6FbvVru6vuoMur3PuQSBEMMoCUGpzvWoOEi?=
 =?us-ascii?Q?D+Dnh2lKONDfLTafwgdXU4rdpUve9LDNzbuGkmFiKGd0piXduOauKW5hfJli?=
 =?us-ascii?Q?UcvkraXEO03F29eUpFzMhb4MdZUBK2+UkXzLlUKpSoL4AtlabmmKFSWQiSAJ?=
 =?us-ascii?Q?kjiwmHCxRJTmCTSgLre5MTwSkqXnwqhClRhYAdlz/G8XYqClK1NyhVVhHzjP?=
 =?us-ascii?Q?WfuWfBvhq/ZSM77t3aumQDqmdduTzNKAJFIltVffS3+RpVS8RQ4urElC7Ctk?=
 =?us-ascii?Q?ZTvrIWpv/qcRJbWL9iNFgPOpp1m2K0qUiVIOck80YH60bZ9I3BG1YXF4qNA5?=
 =?us-ascii?Q?NYEgjlAkTJNYvJJ55Wj960ZyUee55LuKpQRqRRouzOr/TUFqtDOUTThrCaVU?=
 =?us-ascii?Q?yX8gk3yr6HchSyV1Ei+dPmvrJyFrKLWyFrFrAQNTK+8gcBOqnGNr2bDU1WAp?=
 =?us-ascii?Q?8MEciSscZPC9vVlS76L6IPmgG3gJKZhNwQo/aymNimMxED8csXwrspyqxeEk?=
 =?us-ascii?Q?INleEI/ttZ9KaLwNqA5GJEdjs79coJ0evGwmmkz2y7fSDLHpFH7szoxJaQKn?=
 =?us-ascii?Q?054DSKHUX3ctfbPuICqfa86nRFQ4vNmHqizfnseN4BZX00J6+muWTn1zooBo?=
 =?us-ascii?Q?QC08BUwJmr+aEV9fwcXupAG9CEH5n10rNqdoDeae8zjPrjSTw0k5bnjUQH+G?=
 =?us-ascii?Q?xw9GTByMe/S95vGRZWICFikQ96nktT6dB5xKCI5FwKx5LGG3NP3U3YJvxbvv?=
 =?us-ascii?Q?lqtVdc+ONLJHAisiBIXSea2aUl90hjoMK6cfgQb78iRJNnAOtd2YABeji9Sz?=
 =?us-ascii?Q?i8IcTTIZMYmeRQMu8ORhyFghin3MYyVlMOwDCARp8L1RVTZzevrk45TmStpG?=
 =?us-ascii?Q?n+iZ2lIvH6/YH6EY0ERsuiM5u9bcQUdmNKBRKyT2zPwqyr06RLR6jH+Hm/Hx?=
 =?us-ascii?Q?IgaBnF3VymH7Nzd5U1uZHaInDrb3eOxmueT7h8uqX/AKg7u8Z7acKbjhal+g?=
 =?us-ascii?Q?BWKKNZuYbCUKwyhRauQzjZ2Vml2Ypkize9muOHr6h1jlfxfx3L7gu7I1VlIU?=
 =?us-ascii?Q?gvU73FGAs/igLD/2HrlWs294Iww2H/zfSbRTt8SOByR2begusxJpg98QWys5?=
 =?us-ascii?Q?8/6+FMpnAQbXlYiXYZBJlGzb+tilvh8oASqyo4rCQ+pnzEesY0WzgyuK3PUh?=
 =?us-ascii?Q?7/Hc40ACVLIVzczvt3Bv4EKP78T9syQhJGlWC8jC+Zgv3vYLniAM7WcdbsAE?=
 =?us-ascii?Q?Zpu/BT8hJk0DOEdvkQKPjIMV4N2OR5nT79k/qzBZK5OBm0bDpNHehv/KvxcE?=
 =?us-ascii?Q?4vPjSRe3IiLPkhAbOhqZuG43OywLtp9MB3dfwuj3Cnwk42KDf75faCzglL9K?=
 =?us-ascii?Q?kgDe4dcgLAfMj9y+pOIQXd6TNhl3ENzbWGNGcHdCgYsZ5Nfv6pjcUMd6tDf5?=
 =?us-ascii?Q?ilImcnB2aI7L+6IuQVetRt61qZyr1vbr349eNDFW0i9w7Y7A/Gfeki1d+awA?=
 =?us-ascii?Q?GI7VMNZjHtMgaEAW6bsOIZUloK8hp9AQAYyR1Ed3kYj73h3w5if6eO6SJgPV?=
 =?us-ascii?Q?nNgGIszaGeHmYW40EliM/EWOf8W6dyju3PNk99TRa7lRkfu5mEnFgOJX5WjB?=
 =?us-ascii?Q?eYno3w5kulSdRB5B5E+97No=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b828e9bd-66a9-4df6-8802-08db9580e0e4
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2023 06:54:56.5533 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mh/bKh4HUaeX1pWMvC4WFs0jW42XVv/GopCUvWun68Axj3DMHGAoX7ayzCUrlnoDAw2J3cGOnHJECpaiq4r6Da1TuCFTzI7PsdSREC/EeOmUpRjwk7MEWfjhUCSsoDnC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6860
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/3] drm/xe: Set the correct type for
 xe_to_user_engine_class
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
Cc: Lionel G Landwerlin <lionel.g.landwerlin@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Aug 04, 2023 at 02:32:52PM -0700, Umesh Nerlige Ramappa wrote:
>User engine class is of type u16. Set the same type for the array used to
>map xe engines to user engines.
>
>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

This patch should be merged with original patch.
So, use the below fixup commit header
"fixup! drm/xe: Introduce a new DRM driver for Intel GPUs"

With that,
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

>---
> drivers/gpu/drm/xe/xe_query.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
>index 297e93a0eb8c..99a4800c7c53 100644
>--- a/drivers/gpu/drm/xe/xe_query.c
>+++ b/drivers/gpu/drm/xe/xe_query.c
>@@ -19,7 +19,7 @@
> #include "xe_macros.h"
> #include "xe_ttm_vram_mgr.h"
>
>-static const enum xe_engine_class xe_to_user_engine_class[] = {
>+static const u16 xe_to_user_engine_class[] = {
> 	[XE_ENGINE_CLASS_RENDER] = DRM_XE_ENGINE_CLASS_RENDER,
> 	[XE_ENGINE_CLASS_COPY] = DRM_XE_ENGINE_CLASS_COPY,
> 	[XE_ENGINE_CLASS_VIDEO_DECODE] = DRM_XE_ENGINE_CLASS_VIDEO_DECODE,
>-- 
>2.38.1
>
