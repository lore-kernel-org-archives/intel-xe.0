Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 588D8C4707B
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jan 2024 20:43:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 287B010E66A;
	Wed, 10 Jan 2024 20:43:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21FD110E66A
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Jan 2024 20:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704919399; x=1736455399;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=8F9/QTE7CbBudeh7SThFRaDtNuhN+zy89i13aCZS+Jc=;
 b=Vva+EcZ5oCTTHbQUZU2bDCwjZUZpOmpvq1bbMIwtl6NQ592BmdaVu/n7
 UBCVMq0SOCLvNjBhbe5iGQGBJEZ+WN+BUZa8Hks+FF8K9NHTRVNHKCEYZ
 47j3bN3UpW/py1S+a8ss/p22tK5HRLrE7QLd2x+8OIYntYnxvuiqRYAbS
 RjDuUtFL0sO9BuJn/kssREiAJMxviB9a2g2etf1ww+qr2oVFkOh9cjeBT
 Ab/Hkg5CMdHzLrEzxIae3pX/VyqBvRU4rrDM9sN7sZAghgKznn+y9HBWG
 tqtmsQoApd2E/Q6alvfuvc+Zytik6V6UAUm3tEjsa1ClBYENOHQThYXkI A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="20127740"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="20127740"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2024 12:43:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="816474434"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="816474434"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Jan 2024 12:43:17 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 10 Jan 2024 12:43:17 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 10 Jan 2024 12:43:16 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 10 Jan 2024 12:43:16 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 10 Jan 2024 12:43:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gQzX239l0UB49xYOofW3myf+K7oHH7oXqb9gbmTcEkL2bWZmqnP9Ej6jlPZ5Xi+PlFCi8kOZLm2vlAXDwpIO3+tiXhJmOaZDytr/XQ2+wo9t74Cm2aXm2xmouOy8vvINcV5pg90aapqddgt8AS5WzxSLuThK+Gn37uSJ6IBa96l8TFSN8q5f0dflSu5FpZzBQDCy6dD+lCiRtAk7KsUlTVAcd+ZeWFVQqAuW8x/hE5TfLCA1J2LXIjpAS/f3xOdYAKSq5qiZCwkif86w1kjoaNiwZcAVnwXioXZ2fzi3yRiO2UwuDOmhUUfGr6JHE3XFuE9h7b1wSmufWgTAbjV6Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NOhU5jSuD16ajQ5JL0kXnVSW5jK+MHQY/uICcj/Wetw=;
 b=ExX1TU3xZeu7xibwLpOUt+L0luaskWG10IKYRuSouWceelJbSVAayLiEl8V69vIQ6gx4mbX1+a5iJkTHK8Q3PLFAZ9rjWKrrfTonTzkAounxe765j4i7XoD9iQT17Z2L4WtBpnAPVlDmjqEIsd0tI87JFdnjgO3kBBOIJa+6Fn+09MV3ySfuKcNExRZ1zO16eLNdc4Kaqqd0MRhnfoTF/ElaefWLI7Y4IvMnxceNIHkiSeI+5nJYZK/KSkInhkpE68G3Zra64BiIBj5AABaYDGKiI+EEFya86WodXgMUIPV+sJMiPFefwrOMy8xEuSuz9GoJeucVVPIUXowid4XQ6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by LV8PR11MB8582.namprd11.prod.outlook.com (2603:10b6:408:1f7::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Wed, 10 Jan
 2024 20:43:14 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b%4]) with mapi id 15.20.7159.020; Wed, 10 Jan 2024
 20:43:14 +0000
Date: Wed, 10 Jan 2024 14:43:12 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
Subject: Re: [PATCH] drm/xe: Fix typo in vram frequency sysfs documentation
Message-ID: <cyt4suev4duu5vgiwurootcxklz3jdxdtdq552ggkbwqtqdh6i@snb34eaejk7i>
References: <20240110074203.2169233-1-sujaritha.sundaresan@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240110074203.2169233-1-sujaritha.sundaresan@intel.com>
X-ClientProxiedBy: BYAPR04CA0020.namprd04.prod.outlook.com
 (2603:10b6:a03:40::33) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|LV8PR11MB8582:EE_
X-MS-Office365-Filtering-Correlation-Id: 60f11b55-9fa5-46b7-d6fc-08dc121cc42a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /xdIuZejLXcjlOxlCyhxCSjU1jRV5oXoa8eVADTcFkrCR5qX8bTyMyWv31gijuenRxcpmmt8gNd3BgHyAB55YCNnfesYa56ZZw1OdZkeXym6twlb/CoY/X3MRv+R5mASuBb/vt730EUSWkJsUWOKY3ip14veqjkPmeU0gj+iNzxWlRkLYLMYEVaFxhCpTdCQMDugAJbFGu1DnYn4fFAmB95FhOtvdI148bEDCZR2xIWeTLrRYIHejwU9atWkmShfw/mM9knDfYb4GxZbOCIdTsjNDUBLg9hjbPRd3hIWu5uG7DFAo7HDbehjsEEp0eT4/5wulemJ9HBgF4bqV6DUtBQWjZFlqjwjF8Y3LtX+aUXHWubyib3xA9UUpYuPlSSt2J4VT9LfpejJEF2y1qj7snD1cORfae+/NmBCAse/WuIMd3PSrAkJ5n19KwNutN59j5Kvn5Lkx9/1q3GocBmZYx+A0TiR/wJxSF7Vhl+O//vs6fBGUa5NNljLjl4PSSgZqx+gvOr1rqR6IQahr8FXbZwf8P4UZOVsR1HYhpobifKuNJWM83m+iLtssWmXCCeP
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(376002)(346002)(136003)(366004)(396003)(39860400002)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(66476007)(66556008)(478600001)(6486002)(6636002)(5660300002)(2906002)(316002)(66946007)(6862004)(4326008)(8936002)(8676002)(83380400001)(9686003)(6506007)(6512007)(26005)(33716001)(41300700001)(82960400001)(38100700002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rR95v95XJ0LZa3TkmHGt0lP+vhSP2XtcrdOLi6xpU/zvUsJ3unFvvSmcPTqp?=
 =?us-ascii?Q?lZUmb+6/wACVi97ULSGIQWJTyDoxJNTkZgGUUKSf0qXFGVBZUD1er0pIaSVK?=
 =?us-ascii?Q?eg54ZhgrOoUjx7nXt9SruW0TCl8R3RyU3HOQ8gx5aDDhS/kZyTNYceto/yAw?=
 =?us-ascii?Q?vsBW1PryIDgYKkLnTA3oC+BYqfZmJitBAHORmEaRhoUV9M3xDVKdkD0+kd6v?=
 =?us-ascii?Q?1Ub5Tf7zssuwZTOHs9hrEm7ZUAbkhEf6G7gGtsqrG/aOOL3j/q63J8u7axj5?=
 =?us-ascii?Q?SBnLLdAt3ACsUlI2y3LlSlaKQWnCki/ZeR+Z5JX3hPp0hAAE2DRDB+Zea3H6?=
 =?us-ascii?Q?ROz5SRZX8wLa17r241TpU4u1l4v5pbK8CaUwlwW/Rf+CkoZMJtYFVL6AfQcy?=
 =?us-ascii?Q?yK9H4aJHW91KDaGEXzbu4wQ/ZiIhay/pday85h9i+KgGLfTuA9ZLBOqdbk4/?=
 =?us-ascii?Q?0OBCxx0zySP7j5CG0jXoLbeJxO6O1mMqIoaUTNV+xFDDXNNaMiUAuMf7fz63?=
 =?us-ascii?Q?un3wuLmnYjARerThL3ZL9/fhCRLJRQ5iyEvmvmlnky3/X5EOVE64SCmLBtyx?=
 =?us-ascii?Q?3D04kNyz0pT6FNOH92CAEQEynWNB4cAMa/geXMr5rS+SVjCMfOlMs9TmpEIx?=
 =?us-ascii?Q?xHFq8yhAIrPSdEZjH03lf3WphYtLaUrX85Vty/ACOceakGOk7hulgN7Anl1I?=
 =?us-ascii?Q?sBcejijG3Y+OjY9wXYG/LP2r/pAcU3ulPIph1HEfZO6DQbf4yQGSeV7DDk8h?=
 =?us-ascii?Q?rjeoRiT4WHPQOEWxMIeDw6CUmd+hNwnOsLL58uhfZeYh+wSj8dkco40b5ssb?=
 =?us-ascii?Q?3QRmLbUW9YWykd7hJyjp+3e6EBLyJQrykf+COfzqVfJCXWY9Oz8oO0SO0qrp?=
 =?us-ascii?Q?A2jXdiHOVT8145gBdpnvBwFX6yElEwgH9Uscw3IJqDcQ9jYR+5kyynP8mij4?=
 =?us-ascii?Q?SwWGpSbORkOI8k6gRn+kc4iZhk4OVOZ/00VgvwpZ9weZc1+9yqd7JNzHg/E2?=
 =?us-ascii?Q?M6IkfgJz0dYU1WaKFO7JkLQ7qXJpTjXIZoTiIAeZ9pVfGl87ccoI0HYF1siu?=
 =?us-ascii?Q?OXY2lZ1+DfqOAj3V0DfAk5dMgqyHU6ZGPukULAot1Lsc3cIg3VwKBo/KJTSa?=
 =?us-ascii?Q?VEMnUYCg5P5/3FJMYKcPwQLHWmjrxbmjOo0EY7+wRKstu1VV422TU8p3eP0/?=
 =?us-ascii?Q?Ta5opLu+DNRu1Aw0sHkFu61SSOyyyyIvZMdUblAD8lrq5D2T7pvCqVXuoovG?=
 =?us-ascii?Q?8jTtIlkbqa6LuXfZ1RK0OwqXpiL9zj95CWGQXbZQmd6lOmQQX+yNEcDgEFBv?=
 =?us-ascii?Q?KVpAURsr+kmfg8pO3qLsiKoK5GNhbRUjMbE0XwE+ssOih9PiFW/24mIl/r0M?=
 =?us-ascii?Q?tyY0TQ0NflnkKBnD3srjG4c0nZC4ZOOyCjHArWQJY4UltWNfeoXsRYOYhgkM?=
 =?us-ascii?Q?Nc/UrzjA+eI2MZx6gQDipbiNOOb47B2MFUBFSv3Gz43j1jOCMDH56G9112Ke?=
 =?us-ascii?Q?5ZWqQEs42olQdhb7rqAvMLQ5La+dV2f9iB3jGFlExb7V/pDIyVm+uan0bTlU?=
 =?us-ascii?Q?qaTAnTW/TV0d3Meyzw59wd95JISxiv/vaTP+x85C+BHGc9aazBJ9Rk+7xxj7?=
 =?us-ascii?Q?rA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 60f11b55-9fa5-46b7-d6fc-08dc121cc42a
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2024 20:43:14.2597 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MMxakL49PFv/G6iCIJf7CFwgOGALGMlwIMKYsWewb3DBiqp8d2pNO5caioh8YgLVvnmCrHZElSecAThyxClNqZQZhkdifuGsDBnEec9KKNQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8582
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Jan 10, 2024 at 01:12:03PM +0530, Sujaritha Sundaresan wrote:
>Fix function naming and description for xe_vram_freq_sysfs_init
>function.
>
>Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
>---
> drivers/gpu/drm/xe/xe_vram_freq.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_vram_freq.c b/drivers/gpu/drm/xe/xe_vram_freq.c
>index 733146293307..838f582e5632 100644
>--- a/drivers/gpu/drm/xe/xe_vram_freq.c
>+++ b/drivers/gpu/drm/xe/xe_vram_freq.c
>@@ -96,7 +96,7 @@ static void vram_freq_sysfs_fini(struct drm_device *drm, void *arg)
> }
>
> /*

should be /** to make this kernel-doc, too?

>- * xe_vram_freq_init - Initialize vram frequency component
>+ * xe_vram_freq_sysfs_init - Initialize vram frequency sysfs component
>  * @tile: Xe Tile object
>  *
>  * It needs to be initialized after the main tile component is ready

there's a trailing list after this comment that should be removed too.

thanks

Lucas De Marchi
>-- 
>2.25.1
>
