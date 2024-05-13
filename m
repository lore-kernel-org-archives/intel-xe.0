Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 762A5C25B74
	for <intel-xe@archiver.kernel.org>; Mon, 13 May 2024 15:44:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3281E10E05D;
	Mon, 13 May 2024 15:44:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bAN4jRR5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 003AE10E05D
 for <intel-xe@lists.freedesktop.org>; Mon, 13 May 2024 15:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715615068; x=1747151068;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=IjQ+KJuzsmAc80n9c0eGEE/MRqU9D8eUaNaK+vwPuLY=;
 b=bAN4jRR5VRYbY+aiKbGboG7+UEUbghlpb6P+xVP7qMYvBwJOSTASNi1Z
 YIl+rDcJlbyQqf1rjOGIpCd7iknUNaZnNeTLzVtKU5azEv8kOalHPbII/
 Gif6/tXyjZse0JbCYjGmXHCXpyalWxpaTgow0M7TKA5T0lW6KUxqwPbhS
 7/IhzbW8rXjSYOZj7DoTRmrCPe5pabb77aEAyqdujOAi5A+4oOeliVOit
 aVE8qc7vNpWPp/0gd7LVLMk14udDQCFtTuSfeWjzuRIf/n8egrpKI9oAb
 AWa4r0HYFei7usuBwo6z5kAc8Y7YXqvDLU0CcsefPTAOVhte8pCqfqiRo A==;
X-CSE-ConnectionGUID: 4f2QL58yQXqCYNAvglBWmQ==
X-CSE-MsgGUID: mZdrZ41OT2ea0o+WMGL4Pg==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="11773495"
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; d="scan'208";a="11773495"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 08:44:27 -0700
X-CSE-ConnectionGUID: TYHuBBGCTLOhfhgiNu2OBQ==
X-CSE-MsgGUID: HCPbPUbJSY6TUzSD8e6KmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; d="scan'208";a="30400871"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 May 2024 08:44:27 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 13 May 2024 08:44:26 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 13 May 2024 08:44:26 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 13 May 2024 08:44:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UtvI6dujQGnEHxP7dRSSq4h0FHRPYo4COmOvpFZIkSBx4fxrzAFkpPUJJLuFKJOnyktWqCfNw8DgBf91DoT/qSpQYShWp0MhYAQazD0vKmDK81wwZIMN7XRDtQFnoyPaCQxUBZlonC7RRYzfiSIRRhiv0XNmA227+Nl11BpLAvMCHxZhWE8ldK1BUxjURnbz+359bZ3JChurwr7/0UeO48gYHZ1IvWHmmXeEZ3SQm4vKEODu8/8DeRmUfjHurnO4garSrwoIdgkun5egYLIoYMCtfJQEDV6YxAU/2A+t0xV3W2RODdhUv9KvAZ1/OX+sryUivLDsjHQQoftNN6iL+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D1g1gJsxmq/p3bn0230hnLSEmVwMI+mapVFHDwdJlF4=;
 b=ADTKVHrX0+VErgs/7vrKc1gM8hwWHRSpHpusj16MYaMKAvWVomByWyCC2RtNDhqH4ef2HjvVsjScrmaw2x5JdvzPSJs2XhcppW1zXP+Ken78nyJ2hD7GfMPqKx+D7u11SFRTamCm2+vJcceBTKFYd2jeNH9KHc0OhcgasuduIhj3fjwK7XEd0fVb0gHugITGZs7ltN+bZJGz5MDGUCO4dusrHKrVAdSyaKE41IFtKcmT6b5REE6WNwcbxrAqLwdyXUXCxtFFUDhLSz9UZ70T/BP2Uz1DOA0GC94KSJxkvyJ4S2HHSCpcodxuY30vL0+LrpewaW6AOtvffBYfDSWQ8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Mon, 13 May
 2024 15:44:24 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7544.052; Mon, 13 May 2024
 15:44:24 +0000
Date: Mon, 13 May 2024 11:44:19 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/4] drm/xe: Fix xe_guc_ads.h
Message-ID: <ZkI1UweLoSA7jN-q@intel.com>
References: <20240513084218.2084-1-michal.wajdeczko@intel.com>
 <20240513084218.2084-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240513084218.2084-3-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MW4PR02CA0015.namprd02.prod.outlook.com
 (2603:10b6:303:16d::6) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH7PR11MB6053:EE_
X-MS-Office365-Filtering-Correlation-Id: 33ff120a-253f-4011-4d25-08dc7363902b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fApgotMZvDoO49VMhh0JUZ55MiHlnwkIcK2Jo3T+Bo1bdOknmi6Mahd4u5Uk?=
 =?us-ascii?Q?HUTcvaMAxOq60wbSJk0YdI68gPVrU47G3nkJ+/PS07IqsLmVILtK4ONDl7vQ?=
 =?us-ascii?Q?u5ZtORSuMFDJzDijzENuz5Ym1B3KdFpMFEDRz/Vi2Z7B6LW5zt2NDdwrt876?=
 =?us-ascii?Q?OpCEea44i5l4hjSgObNB8Jmk7gKT0ONYv0jCzW+Zzpa1Yc70KUyWCXtq8r1N?=
 =?us-ascii?Q?Bkh0sd0zXMC2P8+ABZfqZMwC6T2/DSmSSZ8Z4/mvYQa3fPTeb96yO88ExsLy?=
 =?us-ascii?Q?Nx2/OYUlqUZpQ4ZrMLmWkbmNv19bOMlhWgzoiezkx2GPXQso8Cg5SICfbloR?=
 =?us-ascii?Q?ePrr3ewmPqnc5o1NvtARkiX5/+YKG7tzPBnUeKxXYRUluHt8iLf26/qFXhNs?=
 =?us-ascii?Q?UuYeKa1dKp0/2ppWR9nbCFIdSyBEuZI9OfORL1XSuO4LkHiibA1uJ7vuxu7G?=
 =?us-ascii?Q?BdCuDscYXhg6XZ/pqGagSZ81xinlsVDvnfRzPJAmoh+UY8ycJ1/aB5SGqJCN?=
 =?us-ascii?Q?vYYs/XmrO9JX6FR0uTbUdKUt02y50Jr0O+OLq1fgbJze1g2MevC2CqJPSQ3r?=
 =?us-ascii?Q?OLRGfGygLWpfu2cnugCOhKtHFcjha3z4+UhBMGUKJiK4UGEqE0PwPqlwC4A9?=
 =?us-ascii?Q?BTP3T/GvKOarYGFEqNbgLPMuBgF+tnG++s86znZPm2A7iltIDa8W2wBm97Hz?=
 =?us-ascii?Q?EYo1FzYVuAGWP1ytfXkH5rmULQm9+y0t0g2hq7Fv1oNf+WyySqTjieDyfopE?=
 =?us-ascii?Q?dx23JugJpp6Qdi/FgQnTp6tF3FKrmFFfEgytii0EQ0jakJWNotkO+LBu8im0?=
 =?us-ascii?Q?aRNDHKHJjSl0O4yXpuucPKxf0X7AlSzaOdBG3mY/w4XM+bVd6n6JPGKV4oB4?=
 =?us-ascii?Q?lWFthuIPHCI4zDU6otA+J0zxdApS3Jt8xErCrNioUAuAvnntlu2KP6fAOpSM?=
 =?us-ascii?Q?/Kpr9mMt3cLHs7SYkKbSJfPBR00Nt6SRmcqQy1KPLaF8eO34JAySQKjfxzYk?=
 =?us-ascii?Q?cZDySLVuEBz9eg9mfcMsUfmaLClsEwatl9SzKWrDYLuLPfGMcyx6dPSFPOce?=
 =?us-ascii?Q?U/8z6mh/Hsc9eibimEsKe6J14bsy1jkifWnks3hHLBCVy6j1t4RZQ1HN7jiv?=
 =?us-ascii?Q?FUodiRP1dIPB1i4ugugMmvFMHxhjm1RoN6kvoj4N2Ii3iszl5KPL0hapDaXK?=
 =?us-ascii?Q?8vv6gTSZ+cF4qJ+rG1S4RyvKIN6qBuZoAs5hy20mXbof5pEPTP30QrdaONa1?=
 =?us-ascii?Q?L3V4dKlUHPgJOxaFnsjMgFhEbK7N4GpnGjLLu/E+vA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FgbYa51A7DgZ4FF3/hfaAPTpKs/M61H6E/Al2GdeH2QfsCy5IN8iuRQkQcNr?=
 =?us-ascii?Q?t+FoCZqNBOCeDctNjFVPBWRhHn6RkLUFkIuY1a/MUluR4FqNtIrwrVJX5SfW?=
 =?us-ascii?Q?MnaGaMclMm247ydTmZGBWf51YnW0YojfGFJmLWXc7V8ib1k2PpZRwdZ7nVPe?=
 =?us-ascii?Q?w58FcGyrPtPkdFmTC+KQrPNHGp19xtBNE46eyrZfFBS/SrSjx0H5gM3kQ4nQ?=
 =?us-ascii?Q?b/Zgtih5RGybKlH3Kz/j260GjvTLu0W/Bil6id+UX2Fc4/dGy/qK5NlG3npN?=
 =?us-ascii?Q?nEc417t6PJLmz+sL3oiebndgGkCqa7uL8I2sy1mKnZ7qyiFgNbV6y0Fhz6zj?=
 =?us-ascii?Q?Gj9LQPwadeafjfgN38+SrGLrtduUKLUcuen4MKSeP05TTDae3qxwqXfRZ2Fb?=
 =?us-ascii?Q?6HT40EkPRb1m70/NZTqP/CB+5fy4obOmJ0geOPEg9LGctRsr6odkEE69ZL53?=
 =?us-ascii?Q?EzHmA/X30kNKJLzOygbbuc5+3hz6N2a9N4hlBxJoEUG4xftkBsQMU7DUHVTJ?=
 =?us-ascii?Q?uR4zK1kiq8ufvmYd/VtfopcFo6kXq3bqUM3crsicOgAnPT459BSxIYP8X8T6?=
 =?us-ascii?Q?nALicd9vunzdd6sETRrkzQYw9gd1eIxKzZjRDPkItPdQQGxsVV7RhWbLM1UQ?=
 =?us-ascii?Q?tXLddE4RkZPaVZTin1MGfmOHkKzH9VkedQyap/O4qtEkaIbe+QHijQUnXYfJ?=
 =?us-ascii?Q?ubRhWB/aofZ4yav5Th/pMXJ66yl2TREXjqmratQbCWsp393OsAle3N4Z0Th2?=
 =?us-ascii?Q?NxdCdfbbPJLQfMIA9/B9IzKAO3z98hAar/LU56lZFpsETokXzDybDDrDb9Gq?=
 =?us-ascii?Q?/wb3xdHoiZPqjRlID0oiAw98cS1kDxH54Y2+5eZu4nJTDk1eLPzKdDsM2346?=
 =?us-ascii?Q?5ZhQBPXNz9aSZZJjkulL098pTeOpBS3Pw3lYHcarXTLUdFOKAzeF12TgAyvQ?=
 =?us-ascii?Q?oPmtEB2J1dDWUs1FcyEV8FxynqEVOSUMLApmZpA/XIhLAUXJ3smfVt2nNdZM?=
 =?us-ascii?Q?uKQqn+xyKIbsLSR7yr8QtCXTiIBjWPQvHCTqCtbUR3n2LxST1AqiEOtSA0j1?=
 =?us-ascii?Q?1lIPK3IHjC5LQquelWYFhHvCIrGRlHcvwtwmN2lE7djv4thMPjy27qQf9nml?=
 =?us-ascii?Q?mKwOhcuu2pZDikNd+6IL74vteaDioSGhvdGBBeR6+NErzooM9NVroS2gV0Ca?=
 =?us-ascii?Q?p102bWm9hmKH3Ci231dXxIwJoHrUDeSChuODXgAFMqqGfK7fY60UaiD22IM9?=
 =?us-ascii?Q?6oXctcrwsQ0vyd7zJiaTFzE98tjKXnIdi/U0TnOeMX8aSvPID7aCuvG3neqe?=
 =?us-ascii?Q?VC8QIYADf5kGxRYd7M5FCKrSOrt9R2nw1BmHirwxWLJQbf6UYeEUpnRkvsv1?=
 =?us-ascii?Q?n92tkwsrHGp/qqmYAh5plTpcbsDwVhBH5MWtBZEJxt753VFFXYiNZ8lUGRP2?=
 =?us-ascii?Q?Jjnqk5X3hzzhGBc4B2VHYUCKPBdhB1Ux/i49xi0/dbMbuYZ4R+J80lKVNRQO?=
 =?us-ascii?Q?ZFQQWXcNQtAh/Lrlp2O5GZSWVm4lrJNqoWTRHrWYt2qUDEPK82v8zv1sZLG/?=
 =?us-ascii?Q?bhzgIGxra8UKW8o4CU/XlKQUfuWHddDEfD8ckyJS?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 33ff120a-253f-4011-4d25-08dc7363902b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2024 15:44:24.0240 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j9BEAGOLJB0VyEDmAwH/Xid+JfvayhtRm2cgvk0Kd6OB+MpDyTCVqTcU1zUGoFojpLUbyZeX2c5s+2zv7Py5+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6053
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

On Mon, May 13, 2024 at 10:42:16AM +0200, Michal Wajdeczko wrote:
> We don't need to include xe_guc_ads_types.h here.
> Use forward declaration instead.
> 

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_ads.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.h b/drivers/gpu/drm/xe/xe_guc_ads.h
> index 2e2531779122..2e6674c760ff 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.h
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.h
> @@ -6,7 +6,7 @@
>  #ifndef _XE_GUC_ADS_H_
>  #define _XE_GUC_ADS_H_
>  
> -#include "xe_guc_ads_types.h"
> +struct xe_guc_ads;
>  
>  int xe_guc_ads_init(struct xe_guc_ads *ads);
>  int xe_guc_ads_init_post_hwconfig(struct xe_guc_ads *ads);
> -- 
> 2.43.0
> 
