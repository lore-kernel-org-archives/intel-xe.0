Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95C31C77B7A
	for <intel-xe@archiver.kernel.org>; Thu,  1 Jun 2023 15:15:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D46A10E08B;
	Thu,  1 Jun 2023 15:15:42 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6EBC10E08B
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Jun 2023 15:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685632541; x=1717168541;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=OuH2GEQn8aCcArxzNFY5NF0/4JvTRPHwhMpoEEIaSzE=;
 b=RpGojhiAyyWbO//AAbBhraQdQoKkJH8E2WaCt49O911aES5LcDpkgIwx
 uTT8SgXQaT2XlDyYL1dKUHtMKVpN0+kDrN7qGwnmcoCS+Uj6ONFNw5Mj2
 2FVKyw27X1P4rpBDieilhtyJJA7RtsckMvj1Xte9y+lEThVMchyX6T4IG
 FVnCZ6GfSrXyEUXsBn3nVQEs+5XN8iC5QduWLTikBVThYlaUtm/lNpFWk
 rF84Fu3VweYacm+IEZMm1cG4dHBnPLuBUHcvcHHiSs4bWIX4JtHAukWpx
 3NSnPYbW1U9hVQzLPXwnv+S9xcRf6JfOUvKwHwJRLykNgddb5dwpw40Oj Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="419106080"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="419106080"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2023 08:15:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="707404614"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="707404614"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga002.jf.intel.com with ESMTP; 01 Jun 2023 08:15:39 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 1 Jun 2023 08:15:39 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 1 Jun 2023 08:15:39 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 1 Jun 2023 08:15:39 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 1 Jun 2023 08:15:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mGwgU/6Z7Kdwsf1rtNI6NbtbMw7eJ9lcnjbNnJ/alRvBtmA+z7nXetrydzoxU+LAua2qzs+C1rJMbaazzkfy/B2hXeKqO36waK5fm6F1vtqEoHYjnEsaEcc/plwxnUcsrO6tB27bU57TOY2Qhoub5xyqbq62ClPQlviRYuyGQ5wHxWq1Ecf+GFwt32Gxek7Rll4xIAqlfG8N4jbni0gj1iUgAPNjVsxjyQRCF/MOcpGtAsH+WYHY/9ToeoIPplfR/CxZN7CD1Wa9CDJiAznFWuJuQy+n2ftqslyeorFwPcsk3u61c2aHFkvKu1xRdQptSbuaWKosy2fTle+5//FlEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eIk0sB/VKL2+JVCd8FwvsOGCscNr9UgF1iIaIxHZNmY=;
 b=SDSl/LNgGruZeNz0LyTqI414aRMCpaonvZvWNRY19h6qyL+A6jyBBpM4nVhn6CmGZEb52S4K8sNpvU1wg7EfK/cPlAD8lvdNHIOc1BSU6DAjaGMTBYqZ6TQvdhRc/L98Ta4swNJ0u2MrUGjnvQcM3n8mHBfvCGqZILMQsMh3DSkWhv6Bjdw96CyGZkrgXNohHHC3t8+uvo/Od8Z27FXBNQgQFncs7Ub4nSyZjiINLgW+cxjmnRlZYZ3uWz1kXR2vQ6HUq8dUm7jfo5YZXrCKXgRa/WNkrv1GetZY7WjUrs7j+aV5j2UMOT7cIaIsB+50HGgmCshKXMcds+ebY0ppIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN8PR11MB3556.namprd11.prod.outlook.com (2603:10b6:408:8d::31)
 by CH0PR11MB5393.namprd11.prod.outlook.com (2603:10b6:610:b8::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.23; Thu, 1 Jun
 2023 15:15:36 +0000
Received: from BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::7c95:635b:8059:9e68]) by BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::7c95:635b:8059:9e68%4]) with mapi id 15.20.6455.020; Thu, 1 Jun 2023
 15:15:36 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230601000403.432517-29-matthew.d.roper@intel.com>
References: <20230601000403.432517-1-matthew.d.roper@intel.com>
 <20230601000403.432517-29-matthew.d.roper@intel.com>
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
Date: Thu, 1 Jun 2023 12:15:30 -0300
Message-ID: <168563253057.3435.453618098137129947@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: SJ0PR03CA0181.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::6) To BN8PR11MB3556.namprd11.prod.outlook.com
 (2603:10b6:408:8d::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR11MB3556:EE_|CH0PR11MB5393:EE_
X-MS-Office365-Filtering-Correlation-Id: b0447293-c0c1-4881-c72a-08db62b30cd6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UJyZFf3NaDIpH0qq5M2i59Fnb9FiyoaBrcgfh/RqyaWE+gEvqA93QpphbtF8TTd+NxWycInhnO9SPWx6lQYu5iI/hI2aSXoI7d0L7xGQZpHLlzs02pIkauZqio559WfD2cCMrOE7X17gwl9oZOvP8/tcMAEDp5zELuZNuCBHTRe6YHm3GGo1YzgB4zcb4RSCdoS6z+3aJM/ysBKWYTht+XNAiDK6eoF8Vq4tEq7IvFqYCrX9wq0oVG7SSz6se2x0PFnjIXJ1jMaUu0QeXBNYcB0Ix9LT3eNAdzqifdfCZMUP9vXbOvEY1dWnL8O4vHwB08iEcZK/v1FMHEgdzMqXwTcZdmdKtoXvAVHjfaFay21vVNd+PoXo9CdbGbRlupyvftbRedveUwex4f1A+KGPp9YLrL+bW1pIX4tX7XSYJKGRhHc/Uv1Of2EOqsnCBgYHYg9dkom7gFUqk8leaDlbUKQhr+aUCcZQO2wO4niLuS6RSzdxomuQxmejQr0PRizo0ybb1573vAkJebdnJZqvT3PFxGm2A+PBFI83StHMpRm7tBMmHDAs5oz9Cu8vZ/O0
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR11MB3556.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(136003)(376002)(396003)(346002)(39860400002)(366004)(451199021)(8936002)(83380400001)(2906002)(186003)(4326008)(66556008)(66946007)(6486002)(66476007)(6666004)(316002)(478600001)(54906003)(107886003)(9686003)(6506007)(44832011)(5660300002)(26005)(6512007)(8676002)(41300700001)(38100700002)(82960400001)(86362001)(33716001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L21PelFCek5OZzJEa05QckY2VExldUt4TW9SUm9ySkdUbks5SFg4dE16V0lv?=
 =?utf-8?B?R0pMcVdQKzA2QUFyN0p1MVQ3QTVYTm9nSUQ0OHRsdjgxeit1SGxCVG9hZVlI?=
 =?utf-8?B?WC9tbXhIMisyb1ZHc2RTVjdvOG9OU1FPdExJK1ZqajlETXh3bzFxZXprb3B4?=
 =?utf-8?B?UlhBQ25HaEtWaWFJeDhCYk1aam5RNUZwblgwQnJnY0YxancrN2o4ZXFjZkh6?=
 =?utf-8?B?eS9hQVR6UzE2U1Q2Q0FjcnVyWDdYdXB2N0pNSlp4RHV3WUxyMXdYaTlxS0pu?=
 =?utf-8?B?QnMrTVRZSWVVZkI1UXRvWmJ1RWNkeW9JVWs3NVlBZmlDaHkvT0hxRUw4ZmJm?=
 =?utf-8?B?MHVKWndKb2ZweHNlVEZKSkVObTFIRlJ6THJIZ3phbVM4aW9WUk9TeDJtalda?=
 =?utf-8?B?dG56ZUNlYWJncGtpYnZKNjNEYTk5TFc0aklXU1VGY1pnNk01clZ2TEpBY0Zr?=
 =?utf-8?B?NktyVGJ6MkN6ZTU0QnhaSzVNWnNRaUYzV2MzTGNHWkxxZm53YWF2d3dYaUww?=
 =?utf-8?B?TkNVdS9namh1V1NsZEh0cmNGVCs4U2hqWHYyMWtNbFRUeW5keGY1SzR3WGxl?=
 =?utf-8?B?SHJpdkNwNUg0eDFrWDFLRHY2cWN5R05WS0xnbWErTUdpdmRHUHllVEpJR0dJ?=
 =?utf-8?B?N0kxZk5hSE1XdUZERGRHaEkvUnlFSWc1Z20wR25FWG1COFVZV0c0OVEydEg0?=
 =?utf-8?B?em9ScnA2L3o5bkVNa1VaSEVsNHprZklXcklkbUNZdHVOYnJ0bWljV29qbWhR?=
 =?utf-8?B?NXBZeGwvT3V0ai8xL09DMHFZSTlRWlpSVmlIWWRvRlM2czMzRGE2SjlBeUlG?=
 =?utf-8?B?TXJyVlNBK1VTb1AxbnY4L1k1NmxBWkdUcUxxdjBhNW9iMEJNRE9qRGZvUzRP?=
 =?utf-8?B?MUc1NHBSRHhXem9CTkF2Tk1jWCszNTdzZUprbzlmTEJzaDIyeDRiditsNkdQ?=
 =?utf-8?B?TnRUSWNmY2gxdCtnUnVHcmVtL1IxSldWMWZiTCtoaGFYYmxDVkFBSTVQZkJV?=
 =?utf-8?B?Z2Zsd0ZTK3dMcmR3ZEwydVpwT3JuMGJNd0JRKzhOcDBmQ2VpdDNIemhJcUI5?=
 =?utf-8?B?ckZyUXBpbnJocWhpRHpMN1hybFRpSmZ1b0QxMUs1eFBQaHRBajdSV2FaVEp4?=
 =?utf-8?B?WmVGMXQyeVE2V0ZhUUtVd3hYTXpDMjJ3akpkeEpFdURGdGN3eHhTOGVzb2th?=
 =?utf-8?B?Vm1Cd2k2V2htT2o2aUV2akp6V1pBUXg3UERkRzZPSzR6SHQ5bW9TWXNMNDEx?=
 =?utf-8?B?Rkpmd0tVY1l3RGRwcFdYYjlhUExJVGQ3T0x5OWNKUGlOT2FSRU5peFd2cUIv?=
 =?utf-8?B?aytvWmMrQ3Q5NzdLMzMvVFZEY0JzVnlCYmkzY2c2VUMvVzJyL3hadEdaOTNt?=
 =?utf-8?B?bDN1OG95K1RNZmdxeEVuTjBhRUdQZzZ4RTlwRjZWTWdvcnBPcFFkaXZXK0ZX?=
 =?utf-8?B?WmVMYlhRd1hjQ08rSngwRy9LRlZJMWRDOTZFV216Z29QNkFrdVMvM1ZvNmVx?=
 =?utf-8?B?eFRKdkp6RjNmOG45dkFBRzZYWVJQNjVEVTMwbFZuSUJIZzFyVUpEQllrYWxq?=
 =?utf-8?B?MFFueWxIVTZpTFg5ckw4SFJHeG5wTlZyckE5bkhEZjF0ZjZmZHl4enZZeThN?=
 =?utf-8?B?RFY5ZitaSlNkQnNYRzRic3VlOTZweTF2cFpMcG1oTkZBSm4vWUd4eXpkbENw?=
 =?utf-8?B?cGhtQi9aRDA2R3JBc0FlNzRRNDE1TWsvZVVBcnhaenhoY2FGOXBJdTdWdkVR?=
 =?utf-8?B?clVRKzBtZ2VtTlFEZnFKcS8vR3l6ZFQzUDd6NVZ5NG1UYUI3d3U0b1JJNjhT?=
 =?utf-8?B?UHcrR20xNHhLSnVWSncra0t3SmFEY2h2WjlsdGVsMTJxZTM4M1Z2VDlPbm5C?=
 =?utf-8?B?blVHSUZYSG1HdE9RUitwVllLNHozZjR1TFMzY3hvUlBrOWV5UFVOcHY1dUNz?=
 =?utf-8?B?YjJLdy9udi90UTA0TTg0NURySXp3MSt5RjZKWFJUbndSOTZ0eU91dmRHQVRP?=
 =?utf-8?B?S21pcWpYbTRqVU5Va1BJT0x3TU1Cem0xYmRmbUZYU2lhR1g0R2RCRHBBMmM2?=
 =?utf-8?B?YTB2V3gza0YzdkVzZVg1b3NKaVYranFKN2g2cVpYd0IzVGJjczhrTXh0Z092?=
 =?utf-8?B?Z3Zlbjd3NU1PY1VUY1RneTZhYkw0NEJEQzRNcUtlcnZ5cGtUSUFXQ0dUNVI5?=
 =?utf-8?B?OUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b0447293-c0c1-4881-c72a-08db62b30cd6
X-MS-Exchange-CrossTenant-AuthSource: BN8PR11MB3556.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2023 15:15:36.0150 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dpqOQf+RB8dvTF9NvofxuyjVyEoQXREBAA23pUt+HmbwDDkkU7BOpwAkm2ycycJ9Rdb+2KMIaOUO/T7Kb6ZhTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5393
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v4 28/31] drm/xe: Allow GT looping and lookup
 on standalone media
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Quoting Matt Roper (2023-05-31 21:04:00-03:00)
>Allow xe_device_get_gt() and for_each_gt() to operate as expected on
>platforms with standalone media.
>
>FIXME: We need to figure out a consistent ID scheme for GTs.  This patch
>keeps the pre-existing behavior of 0/1 being the GT IDs for both PVC
>(multi-tile) and MTL (multi-GT), but depending on the direction we
>decide to go with uapi, we may change this in the future (e.g., to
>return 0/1 on PVC and 0/2 on MTL).  Or if we decide we only need to
>expose tiles to userspace and not GTs, we may not even need ID numbers
>for the GTs anymore.
>
>v2:
> - Restructure a bit to make the assertions more clear.
> - Clarify in commit message that the goal here is to preserve existing
>   behavior; UAPI-visible changes may be introduced in the future once
>   we settle on what we really want.
>v3:
> - Store total GT count in xe_device for ease of lookup.  (Brian)
> - s/(id__++)/(id__)++/  (Gustavo)
>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Gustavo Sousa <gustavo.sousa@intel.com>
>Cc: Brian Welty <brian.welty@intel.com>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>


Regarding s/(id__++)/(id__)++/,

Acked-by: Gustavo Sousa <gustavo.sousa@intel.com>

>---
> drivers/gpu/drm/xe/xe_device.h       | 40 +++++++++++++++++++++++-----
> drivers/gpu/drm/xe/xe_device_types.h |  2 ++
> drivers/gpu/drm/xe/xe_pci.c          |  6 ++++-
> 3 files changed, 41 insertions(+), 7 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device=
.h
>index f2d8479f6ff6..779f71d066e6 100644
>--- a/drivers/gpu/drm/xe/xe_device.h
>+++ b/drivers/gpu/drm/xe/xe_device.h
>@@ -53,18 +53,42 @@ static inline struct xe_tile *xe_device_get_root_tile(=
struct xe_device *xe)
>         return &xe->tiles[0];
> }
>=20
>+#define XE_MAX_GT_PER_TILE 2
>+
>+static inline struct xe_gt *xe_tile_get_gt(struct xe_tile *tile, u8 gt_id=
)
>+{
>+        if (drm_WARN_ON(&tile_to_xe(tile)->drm, gt_id > XE_MAX_GT_PER_TIL=
E))
>+                gt_id =3D 0;
>+
>+        return gt_id ? tile->media_gt : tile->primary_gt;
>+}
>+
> static inline struct xe_gt *xe_device_get_gt(struct xe_device *xe, u8 gt_=
id)
> {
>+        struct xe_tile *root_tile =3D xe_device_get_root_tile(xe);
>         struct xe_gt *gt;
>=20
>-        XE_BUG_ON(gt_id > XE_MAX_TILES_PER_DEVICE);
>+        /*
>+         * FIXME: This only works for now because multi-tile and standalo=
ne
>+         * media are mutually exclusive on the platforms we have today.
>+         *
>+         * id =3D> GT mapping may change once we settle on how we want to=
 handle
>+         * our UAPI.
>+         */
>+        if (MEDIA_VER(xe) >=3D 13) {
>+                gt =3D xe_tile_get_gt(root_tile, gt_id);
>+        } else {
>+                if (drm_WARN_ON(&xe->drm, gt_id > XE_MAX_TILES_PER_DEVICE=
))
>+                        gt_id =3D 0;
>=20
>-        gt =3D xe->tiles[gt_id].primary_gt;
>-        if (drm_WARN_ON(&xe->drm, !gt))
>+                gt =3D xe->tiles[gt_id].primary_gt;
>+        }
>+
>+        if (!gt)
>                 return NULL;
>=20
>-        XE_BUG_ON(gt->info.id !=3D gt_id);
>-        XE_BUG_ON(gt->info.type =3D=3D XE_GT_TYPE_UNINITIALIZED);
>+        drm_WARN_ON(&xe->drm, gt->info.id !=3D gt_id);
>+        drm_WARN_ON(&xe->drm, gt->info.type =3D=3D XE_GT_TYPE_UNINITIALIZ=
ED);
>=20
>         return gt;
> }
>@@ -100,8 +124,12 @@ static inline void xe_device_guc_submission_disable(s=
truct xe_device *xe)
>         for ((id__) =3D 0; (id__) < (xe__)->info.tile_count; (id__)++) \
>                 for_each_if ((tile__) =3D &(xe__)->tiles[(id__)])
>=20
>+/*
>+ * FIXME: This only works for now since multi-tile and standalone media
>+ * happen to be mutually exclusive.  Future platforms may change this...
>+ */
> #define for_each_gt(gt__, xe__, id__) \
>-        for ((id__) =3D 0; (id__) < (xe__)->info.tile_count; (id__++)) \
>+        for ((id__) =3D 0; (id__) < (xe__)->info.gt_count; (id__)++) \
>                 for_each_if ((gt__) =3D xe_device_get_gt((xe__), (id__)))
>=20
> static inline struct xe_force_wake * gt_to_fw(struct xe_gt *gt)
>diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_=
device_types.h
>index da553878448d..17b6b1cc5adb 100644
>--- a/drivers/gpu/drm/xe/xe_device_types.h
>+++ b/drivers/gpu/drm/xe/xe_device_types.h
>@@ -190,6 +190,8 @@ struct xe_device {
>                 u8 vram_flags;
>                 /** @tile_count: Number of tiles */
>                 u8 tile_count;
>+                /** @gt_count: Total number of GTs for entire device */
>+                u8 gt_count;
>                 /** @vm_max_level: Max VM level */
>                 u8 vm_max_level;
>=20
>diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>index ddb256a4e39c..51207e94b254 100644
>--- a/drivers/gpu/drm/xe/xe_pci.c
>+++ b/drivers/gpu/drm/xe/xe_pci.c
>@@ -556,7 +556,11 @@ static int xe_info_init(struct xe_device *xe,
>                         return PTR_ERR(tile->primary_gt);
>=20
>                 gt =3D tile->primary_gt;
>-                gt->info.id =3D id;        /* FIXME: Determine sensible n=
umbering */
>+                /*
>+                 * FIXME: GT numbering scheme may change depending on UAP=
I
>+                 * decisions.
>+                 */
>+                gt->info.id =3D xe->info.gt_count++;
>                 gt->info.type =3D XE_GT_TYPE_MAIN;
>                 gt->info.__engine_mask =3D graphics_desc->hw_engine_mask;
>                 if (MEDIA_VER(xe) < 13 && media_desc)
>--=20
>2.40.1
>
