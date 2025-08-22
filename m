Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3CCACA0EEB
	for <intel-xe@archiver.kernel.org>; Fri, 22 Aug 2025 20:25:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9393910EBAE;
	Fri, 22 Aug 2025 20:25:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WEU0XM5H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D223310E0B0
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Aug 2025 20:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755894332; x=1787430332;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=F3KkA3QcB7xr39yXE5/iw4wCKrAHOn+WzQSwhxvrwbI=;
 b=WEU0XM5H+Bef3OXa6vNEjrjZ3dM61gpUoXEyZ3Yv7WWMGkgM6Z+h8en4
 foFfqdncKxn6QyLBJN200DIv0qGsNeioQxYh2LtdnzBugjw81c4dHmLZh
 J8sDWURWFtuqh920yL8yO2IS+TgZzCqf1SBqSltLJTpX2YzViCDrgroDb
 TWKs/kUc9hbOGssk0lawpJlHLTOP7MEEf8bDaccBMAeVF4umc2UxcfAhT
 821n42YpjRPAMnRxjJnqDkgpFPr5tdr0fpAKt0JAzH172q1Jt12L1acSa
 7HDISt/y4SKmGjcRit6Bnpd/SpdUxEcIyH9coclu44SHdvYog4wgZHlqo Q==;
X-CSE-ConnectionGUID: whWQ491vTOWxGnOxxiywxg==
X-CSE-MsgGUID: QRNzJenqTMytU0HQM9k/tw==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="58275711"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="58275711"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 13:25:31 -0700
X-CSE-ConnectionGUID: /yGYRkscSKeQEmfm1yIbEQ==
X-CSE-MsgGUID: kpTQV00bSv6jsFiKfzIcFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="168021600"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 13:25:31 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 22 Aug 2025 13:25:30 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 22 Aug 2025 13:25:30 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.48) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 22 Aug 2025 13:25:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZVxKyY/5w79JL/79VQ+A+VAp3K2FHE03vwhxiuTByIp2BqjJPljCOmqU5BknFcisp9tqiaSxpL8wEIQAc9KWr/Dq55eD9MUf9i2AS0H2WXLUIW8Sxf0R+MT6wz+mt58fMG934+7tyaHxZVsFemriWZn94mLWp1bi/J6ux8/wn3JQKJEXay+eWF7hdBBH+S0R+epxCIset3CSLfWhTwEyZh6ddrekTXXoa4VlrE8hHrX4Lii4KFN0sBWCNXrrrzJtiZnhU94+38qCYvtLkC3wkfV4VNC5PPUId87w3FWYrDtqcT98sCV2x8hzXLegGnKT90RsO/r7FHguqTq7XkhM4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nuoGfK1wBQ63WrQlVg/8CcVIN/re0DL8oj4+3/DZPro=;
 b=F/YKyeMitG3h4Tv/V+B51h6g2QebuZ4Cgf3x5yRWxRnxNwAtTG6WqZkcto8c+BiHFnOl8gzO0Ocg+FYb9ueRhFNZgfJ4NnbKr0Zl14jPy/SX9I+rSoptiAlz7bRMIgUUUm7CoUeQLX/HgWOe3enoegnR/swnXmML+iZpmNXTdTIJ4wfgcnuEETpYhYynpcHl+1P1hH5oXNYPzjF+3KI9jdg7mVibH25Xp/DHLKJgEUL3O1EhdQ6ich/MPhTRWxU0RJmd1i89eLltvTTHgxbPAQ/Bft0zHa5wZIXp53stY1TR217zSrRsSoQQsNgNeZ8s4ahdrb2lDmBlLYuR8RopJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by DS0PR11MB7622.namprd11.prod.outlook.com (2603:10b6:8:144::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.16; Fri, 22 Aug
 2025 20:25:28 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9052.013; Fri, 22 Aug 2025
 20:25:28 +0000
Date: Fri, 22 Aug 2025 16:25:25 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>
CC: <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v3 1/6] drm/xe: Only have a single drmm release action.
Message-ID: <aKjSNUnLUTjJO_tK@intel.com>
References: <20250819101119.511705-8-dev@lankhorst.se>
 <20250819101119.511705-9-dev@lankhorst.se>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250819101119.511705-9-dev@lankhorst.se>
X-ClientProxiedBy: SJ0PR03CA0300.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::35) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|DS0PR11MB7622:EE_
X-MS-Office365-Filtering-Correlation-Id: 3556933b-32ad-4750-3ad1-08dde1ba08c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+YlACW/xzrNJN4ZlllRZ5GFql9eKJfTFm5Pcbn63EKhKvSiWan85ZuKFi5XP?=
 =?us-ascii?Q?2xymdcq/Zm8VBImX2vJjvJW52dgbv51XxlrHVje5edFqtrF2RlsU4ju5qt9q?=
 =?us-ascii?Q?znxUEf18qqPbXYAEZXMLUpUB8dbCryUSClfnhtLSD6+XmuC/p3tFDiKDQYV9?=
 =?us-ascii?Q?qMtwCDNpG6qclwIVrWtNb7fLBp6wq1P7+qFDZdYKmakKjGFFLkNCLc1XPq/U?=
 =?us-ascii?Q?576J4A58AOj/3vkuPJG5ZpH/xvocqZgAQyhV1aJ+663nWeT/euu6nLhy7YIS?=
 =?us-ascii?Q?gVeiAYMO9D3Rbj/3RLeqMTQ2VLzvNBn7XXK0BzM6IB2PiXg+IlOrNAyNteqv?=
 =?us-ascii?Q?19zVS/j9hQQ9xwPvF2boDCX1p13Rew/zLcrEK1a8rfZpayFGeXbOphahCOi8?=
 =?us-ascii?Q?eD9HDPgmLIgSZoWhov8eiklMpdpNIt/XZHN/LM1K+f1Y63Lm12gQRQ597SCO?=
 =?us-ascii?Q?7gAAfIxAvc0XrUyG3CfJIZniYTnrklXrnPzDciWRNe33RYJDY2wFI5anE58P?=
 =?us-ascii?Q?Si0Rpo0kxwsl0OmvsGujHvJ65U47cM9C5fNXo+Oluoph8Rlk6ctxIg8ySlYp?=
 =?us-ascii?Q?tHR+8aSPjwbkyLRKefDd3TatBUwwXfDnCZEPKN9E46BhSbWAE0QHPofOEsgH?=
 =?us-ascii?Q?eD5x+WkFgZY9p+EVhSvD9qAPU5bJCvB/OVnY7/bRzezUxxJ7cmWedMnbyn2d?=
 =?us-ascii?Q?0Ihb/ziXyIVKT9IGuHY5q1J4/tUQ3ssBsDa0pQRUfMZM7yNiJBXx9aycEhpH?=
 =?us-ascii?Q?czeLEQE+cKibW5lFIM+VITAgoiA/JX60AQiVPkjQ4VGmX96ZG6jOy8BxqjBr?=
 =?us-ascii?Q?657pAIRvJSSwY6tILMMY9cJGRLz2/zev/u/uay7dN/o4vtYkyOISfwHY44Cs?=
 =?us-ascii?Q?apYyHqaoQalghwTH6VJnC8tPbEEhSIELZn6K/p4VbCzB+S38B2fXvJmi8XO/?=
 =?us-ascii?Q?MTeLh6d8m0+lxWDzjtdb4l9Mai7FIiv4Geujnf5M0YSwAutMd5pOFUxaOBCr?=
 =?us-ascii?Q?bixGTB9WUvLSN6H6Fw/37Y104GCGBcxiAniv/MC+cQRcNMUJrMLBy9CpGovX?=
 =?us-ascii?Q?UppQWlWTSlL8dd0CPUqemVn4Oq/Xq/LEodlMXTEmicvMlKh0yiWuyLqeX7Rz?=
 =?us-ascii?Q?JJzru3D8GOyZsT5sU0oJNn1FoIh/KHiprR81UxqBQaQr/vHCqUNKBvDXXnfI?=
 =?us-ascii?Q?S0UikdRp+eDrrSEh4VBhDIvzJh3R9saBsmxJRffBbOzJGKk+2Ks1lEYisCg/?=
 =?us-ascii?Q?o1tYmA5feNm3fyL8HgLaL6O9ZS35TVRwv6yamOi3s/p0u7YVMfnz6z0plnup?=
 =?us-ascii?Q?8zeVig8X5sCi1UuUSa0xxe0MduqRLVVaDCKj/+VOIdDQ3X8pndkKuOxVrW7q?=
 =?us-ascii?Q?QzPPMH3HyqgE0wgnuglcHYi6sTJ/QSw36LYKDDIC1Zq/mn7A/7jGinMFMy8e?=
 =?us-ascii?Q?k1U2IOuXsoI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zmzsXIZqatBNrHz85NYdZSY37ZNIhMlsh8WngjOagy0lUS3EVPhLki0T2cal?=
 =?us-ascii?Q?Jutuods13OPI28Yy/7qXhOIZCdECFLjJqdC2JCKNO0j/IVPE5nJXLv7CBeFP?=
 =?us-ascii?Q?u+busIpWKr0an9yUZfzlrPJW0arc2dVTXET1OHp40JeDdl9hQXw64raDLbG5?=
 =?us-ascii?Q?kSDv9lwWyQhanwFEwGZGnCSZPaEFbDSEjeldACq5fNqOkY7MtmU+25UXGw8q?=
 =?us-ascii?Q?90Zi615NkcaYVjJyEoi0QF48PgpJXTEYPl8LtX5fM9o2eIK6P8WILvIe4LNE?=
 =?us-ascii?Q?F0Qx5IJNkUWqLGxWvWpvpU5X5zntC3TCLEH4Pj7rcSDpkMeODjVkIrhCsNnL?=
 =?us-ascii?Q?MpRjdo3hXBkpqfYEsVDSDyhyRCJ7d7m8o/CxeHiXtMVfrc15fmIq4PN7conM?=
 =?us-ascii?Q?l4BqM6CoTIerCpZSRQRI+/1BjdsgwQ6bmO5Fq7fWL2YCnFvhsiwSd1ZEuZYC?=
 =?us-ascii?Q?ZHq+U43Bz3lQI5sisVsyJfg9VvYmvKKYhnvVM587XWtEHDX7u/sggFqyFB8J?=
 =?us-ascii?Q?k2plOT8vXAFxCol+SKkcQHe+rh5EzFJerZ/ARE41/DpkJj+WKuKm5Mzd75j2?=
 =?us-ascii?Q?sd6t6dDT62gJk2phtYnwBomCvDBBudL9jJjm0+0RGGgSoq7GKyu2Jgz4Tz9Q?=
 =?us-ascii?Q?h9R/77MY+c+10JWuiA/E9dAB0fIwf8/XOs/8ZPtDCBnPnV8p6/HLM3jbpRby?=
 =?us-ascii?Q?8WsSGt778mDEoYabxRZYDaEfUPltDETztwrUSDZ8vmzMhuLs60m6FeKS5bZS?=
 =?us-ascii?Q?k0K+Jl3Oe6UisAafSLaQF5nop9ACYsfjsWZwYyZSbv7WQXs1DXF84dlsRXji?=
 =?us-ascii?Q?UPkXD0bw2ZzGVpCI+hh2n0p47ybFubLSa8vvSfVETKye3WyxlgNqtrJ2Clpw?=
 =?us-ascii?Q?eTbx+/3Iy9brD+hbJEhamVD5hZRTLAEnRcCwQPDA0PI6PyYusDCjFzCsQZqq?=
 =?us-ascii?Q?J/KtC70aUWtglil2C9pZ9mkc8NWGL6n8cIQaKyIz0xeGSmrx+3qDJScb9cI3?=
 =?us-ascii?Q?uNmaCG69BrGtmlJipBiBXN8W7Iwdn711uhHGN/SwSoRtOImRD97yfyH9OQ+C?=
 =?us-ascii?Q?F6ohe250mNSCDeMAPj3jIAIYxkwTdcderjx+LYatQXXL6gLAuuiJH1essEND?=
 =?us-ascii?Q?auWcRoWa1v6U2kvYa3xW+wdO5ySce+sfWD6NhqF4SDKvx6md8tZqH1HNOQWS?=
 =?us-ascii?Q?QXakpjrrUzlYQjIqbXV+ad5nQUaPq1NzZOZaYJs+PHlL0V3P6jbCpS28WSQ5?=
 =?us-ascii?Q?n/IayUlJ8p+eGNfX0BSMBX67oyj+AsALRpAKrODug2U3k/OoH5SCtBnQKfS4?=
 =?us-ascii?Q?o58qmVvz/aZ2z1kMeLdR0z3P0JNLu7N8vQBLP/x4F5t9BWaBMYnQDTLsuu4s?=
 =?us-ascii?Q?Le3sWKX2ABsQv0HonILxKrXAc4tyqYImMBoVjgjE4F89dc0xQ0aoppmWcZva?=
 =?us-ascii?Q?sshXuavncXtX5lksVjGQN6FS5pTPEev7ZPzF0muZ/HUyUxDstwW+xPZ8yz+B?=
 =?us-ascii?Q?paOp+078HIUvwihYFY5xVHz5PNhixiR0Ubt7cfYc0IaLbdeet4U3yG1di1mI?=
 =?us-ascii?Q?e/AovQJ7h35NyT3dqWoGT5NtE/7ffvsYyVdE/c+lBkPd8apZnbcYqPZPFiDI?=
 =?us-ascii?Q?9g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3556933b-32ad-4750-3ad1-08dde1ba08c9
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2025 20:25:28.6525 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1SVRCwv7LanaiUK/WFhd4vf+z9DQBhmk8Ddno8AjmRzg5suIPCkOQGe+MfBUCgoCiMGO5iYPWAzcdNfVjCtxlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7622
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

On Tue, Aug 19, 2025 at 12:11:19PM +0200, Maarten Lankhorst wrote:
> The broken action happened after ggtt_early_fini, so
> it's safe to put the drain_workqueue in there instead of
> creating a new place.
> 
> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> Fixes: 89d2835c3680 ("drm/xe: Process deferred GGTT node removals on device unwind")
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_ggtt.c | 12 +-----------
>  1 file changed, 1 insertion(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index e03222f5ac5a1..0c6aa3126b43a 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -178,6 +178,7 @@ static void ggtt_fini_early(struct drm_device *drm, void *arg)
>  {
>  	struct xe_ggtt *ggtt = arg;
>  
> +	drain_workqueue(ggtt->wq);
>  	destroy_workqueue(ggtt->wq);
>  	mutex_destroy(&ggtt->lock);
>  	drm_mm_takedown(&ggtt->mm);
> @@ -238,13 +239,6 @@ int xe_ggtt_init_kunit(struct xe_ggtt *ggtt, u32 reserved, u32 size)
>  }
>  EXPORT_SYMBOL_IF_KUNIT(xe_ggtt_init_kunit);
>  
> -static void dev_fini_ggtt(void *arg)
> -{
> -	struct xe_ggtt *ggtt = arg;
> -
> -	drain_workqueue(ggtt->wq);
> -}
> -
>  /**
>   * xe_ggtt_init_early - Early GGTT initialization
>   * @ggtt: the &xe_ggtt to be initialized
> @@ -297,10 +291,6 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
>  	if (err)
>  		return err;
>  
> -	err = devm_add_action_or_reset(xe->drm.dev, dev_fini_ggtt, ggtt);
> -	if (err)
> -		return err;
> -
>  	if (IS_SRIOV_VF(xe)) {
>  		err = xe_tile_sriov_vf_prepare_ggtt(ggtt->tile);
>  		if (err)
> -- 
> 2.50.0
> 
