Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5564D3B7EA
	for <intel-xe@archiver.kernel.org>; Mon,  8 Dec 2025 21:15:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FB8610E147;
	Mon,  8 Dec 2025 21:15:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fVcaPB9B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ED4110E147
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Dec 2025 21:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765228503; x=1796764503;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=BNOiOWI69bxZNWDnjBD2+QX0LouKV1sLuQrOxttSgDQ=;
 b=fVcaPB9BmoreVk5OSUYLT+Jbn5vHJOi87VlkbL2mvzDkE70ooCV2ksQ5
 eVLaMdJYTEz0zmxkVkPJITB2ijCbDJOM7ohEXH5H3m7RYmiwp3afxRabX
 z7X6YKg2sHuaz3Jg8ESs/viavakWpsVerGBdL60GojAgbOicgEEFeWhAr
 TlD5Jw4d/XqKrxO5Da0wPtl64UWwSzwJdRDLrNDDE/jokoc8a0FSZokl0
 5cN6CnDRJAaFQlQXpAHtE4hK9rDzSwTVZ/J3FW5L8HgPMUKrz+MmVUZLu
 hU5Sda17P76+f4H/XcKA5k0a5VN5lap1kFk1CoXhEqp8sDXAirHU6sidk w==;
X-CSE-ConnectionGUID: x/JZOLPTRYWqu6lw9Kb7jQ==
X-CSE-MsgGUID: XZq+oSRBSGC9mkcvEvnX7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="84586306"
X-IronPort-AV: E=Sophos;i="6.20,259,1758610800"; d="scan'208";a="84586306"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 13:15:03 -0800
X-CSE-ConnectionGUID: OSzLQKaHSwKHrcp10Ss6kw==
X-CSE-MsgGUID: N4y4o1ovTY6h/98lU8OKzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,259,1758610800"; d="scan'208";a="226699610"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 13:15:04 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 8 Dec 2025 13:15:03 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 8 Dec 2025 13:15:03 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.13) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 8 Dec 2025 13:15:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VxEjxTg6mxv4i7C8i/rZEGpN/KLxpxCxH7XmoobCkVVg95Rtis0qp9VFF5uZQs9Kab5dlm22uyuJCO0ty/d2fti7eAPMnMVM1tKLo3hSGHJ56I6MN6x/YU+I2zJUXJWCip5mR2XU4JY2jiyQRsC06nuvjJwU3gnR/hLgGFwShI2+MV8TNJWUL+W6f9fpoxSLoXXBiuSPJUi1hYBbAPgd24VTZkeYSFfhQhRW5VP0ms1M/7vq1RMJ7Pa7kxn6+LFTOGG4kpAsejXtRBg+SWB5FuasFhfVlaqgNbTkUs94XX3c0j7zsTVnRSqI6xjjtPFjLnan1dlHHii7QfydoNrNYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rDUzP6OpZZ4MoVUVdxEHLvTEMS/pwmGNnmLVF7k+RVo=;
 b=OHQKF+hpdya//2J0SNMvGVZDZdSaCNO2gM1u6OLTA+USVQFFbB/8aAk1s9yciwXy1LUPTg/mxlcOXJh0gssnt3I/3A1f9C6hAgN73A6Ve/ihYmMuaDSBlhbu9+cApJI8pfPMvYmKHtIUY8xgYcpNv4L0j0jPJ4xv1tsjWzuv9DuWln50pb2zgpv4+Ar5y51zrrTwyOGb/eBaufHJBHNR7kVIhDvlECzNN2BGwMJ7WWlZ7ClAzPDwjfB+S8idtF9XIidInkfU0oIjBAY0xzKqbcpK+naDWItvsEt7sY6i0lbGwVdQNz9OGxrsvin8/Q87ahIT3CsoYNGMKJxoLSnwSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH3PPF5AF05F6D9.namprd11.prod.outlook.com (2603:10b6:518:1::d24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 21:14:59 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9388.013; Mon, 8 Dec 2025
 21:14:58 +0000
Date: Mon, 8 Dec 2025 13:14:55 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>, Tomasz Lis <tomasz.lis@intel.com>
Subject: Re: [PATCH v2 1/2] drm/xe/vf: Avoid queuing migration recovery if
 queued or teardown is active
Message-ID: <aTc/z+WlyJygGbhZ@lstrano-desk.jf.intel.com>
References: <20251208072739.336647-4-satyanarayana.k.v.p@intel.com>
 <20251208072739.336647-5-satyanarayana.k.v.p@intel.com>
 <2015cc97-e380-4ea7-902a-c674e55a39fc@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <2015cc97-e380-4ea7-902a-c674e55a39fc@intel.com>
X-ClientProxiedBy: MW4PR03CA0201.namprd03.prod.outlook.com
 (2603:10b6:303:b8::26) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH3PPF5AF05F6D9:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f09196c-80d0-4a80-ddc6-08de369ed77f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qCmFuI/n7J8P9KWQlK679ZXDF/BeARK214HwbI7GEV8C2z+pinPxLXBjJ+gL?=
 =?us-ascii?Q?xQEzvZoLUERfxIWA16xE85Rdk7IyX7u1lw9K8ZYltMK6+FpHwxrVEW5z71U8?=
 =?us-ascii?Q?VU/yyufRxSWZ4cyw1raLoTTpHoPJ8dKaBNrwAfzEPOXqoF18yjLt0y3aHXF8?=
 =?us-ascii?Q?eAGvWTkF0jsGr7Dtav4J1xEQPZxZriFUXKYm2KiqoVbAlt3nNGr+vrR0eB1T?=
 =?us-ascii?Q?+YX9afI/njkmstN9JqeSeu8LK3dDFv2Xi2FYTsD/aunbghEP74aQz72NOszE?=
 =?us-ascii?Q?IpbCy2pMgh5YIPGoH3HP59sxXXLm9W/NhE+Cen51ErP3V65oHZOL+APQqdPP?=
 =?us-ascii?Q?wr2vDMX2KSyZy7WFd+tscfs4lAP6y+ebgIET/bw5uavj9Rt3w8QPiUYdhMwd?=
 =?us-ascii?Q?fQJiixSCgZu1dJ+Jp1Fj1nZNfrjCe/Haj/q9bpLBL8RxSz8aRgJ0Vej2ZqoK?=
 =?us-ascii?Q?vkUroVuRZZJMCDVaNr+JCFuEBwbSnt5E6SxrR4fmbv/lo8iKxzJrLvbkNZz8?=
 =?us-ascii?Q?jbpxJ1JHj8nqso/cW+7b3TndR9GoD0p4eahxB0a6WJKV4/gwcCpipejmCeu3?=
 =?us-ascii?Q?CbOljc4t6pfEI2q0vn/7i6873EUHsaC9DPXq4ebQiOFcXkcXKoTgKwF17PNV?=
 =?us-ascii?Q?jw6tKoW7WoX0wOY9CEsjr6MX+WfdMvn21UlrHbOQz7flO/bjt9auZ4Zc+XCo?=
 =?us-ascii?Q?1d7RAQKvvkRWlg7feSflYZ/TNIoOUwSrwOUzrDnzyFNfaiD10rcM1Tut1Apc?=
 =?us-ascii?Q?mNYQfdvVk9WXcyOqHSsZRJaZ41vsoBTZAYFTWlVe3fyYNFuRdGhLiLq59H5o?=
 =?us-ascii?Q?arDK8KxBrYJ4Y0rubcK15uMNvxH3aX46HCy6hSoIFV95xgoeKUE90e1YC5j+?=
 =?us-ascii?Q?dLpCSp06Rh3/HCsCKU6v2ARFzY8GwIUmLDMleP/KAvApDkzq4ls2xWS50zVU?=
 =?us-ascii?Q?bUn/qIroOJiKSyxyexa1QeP2BHYFNb1m9CoS0UJZmePaOd32i0m049ltBDdx?=
 =?us-ascii?Q?ygRVJJxMn2nUldhxjZdpnjY67TPFFInkc7ietjJcM+tXXzpnLjUGc9aa91KY?=
 =?us-ascii?Q?eWgSmLTHDxhggRGFDbUJj7csDyx5dGarV4HA48DZph1T2GwvlyaMimk/AmbJ?=
 =?us-ascii?Q?REtNI/1gE6T93tfEQi1jL7lyn7m8kGBuDVTvKG7YgM784pIWDBMSUyfrnxR1?=
 =?us-ascii?Q?P+dDXov8FiinSdG3OlVImEKTwU7ywzA6X/itkc4GhG0qriuM947XTU7CizBD?=
 =?us-ascii?Q?7GCC+BAFGn7Ta3Ah73BikhmDSMYUF1m+kmg1jntaWMDXa5wcwsJgvJF5tIr/?=
 =?us-ascii?Q?XwMTCZ36XHqic6EQOtMPjnlSPtO2EA2JZ+eVaoWXkHGjqKruGITOuIa6nMOp?=
 =?us-ascii?Q?IGiupX6MfJns3/BAFdGsaZYFC5BIVEwM9TEfwERebPre3vRS7/YvzREnGHbU?=
 =?us-ascii?Q?z6B7bu7PdSz9K0/fgP6mYwmnI3KRV5uY?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UscH9dMOJEhaMdJhOb11xzIbzz9O6nIO9nkNhAKvt1IlFkXPHBY5ubEGdOg4?=
 =?us-ascii?Q?QtyFQ11AvM6tcvCJYfrw5PDK0IUSPVUFB9ksTAS0CuZdnaobiPs6ZFce7F2P?=
 =?us-ascii?Q?klj11Hx2+7UdJwPuuKtfIoDiaPx/7G/UojC5jwLPd/8CO5AnPL7rROYbJtbA?=
 =?us-ascii?Q?zTfEARkLcLRHH6L7+d0dArDGLxMFTvljLJeX7sOEDqpi72+VLMkOehkU24gu?=
 =?us-ascii?Q?Niw9eWayZOAW2WSV+rADsq7ZVpi1JajyBS+hqGIJ9vCUOyKcX3pkNlwB+V4J?=
 =?us-ascii?Q?unjaSstQWQo7NH0X/L9Og96Yyom/LPiXVwWL7yzOYn1ltoghHoNIfpA90WPV?=
 =?us-ascii?Q?v6IFesT6Y/GrE6nVHpWiubgPcXN6NTIM33jLdrFXB7QisL9VDqZTGQq9ggzw?=
 =?us-ascii?Q?I9bxh6Ndq6WsBICJxKnNDNuxq/6K8vG99AwcKBJpfKbpQ3VB81Mzy39UdlBD?=
 =?us-ascii?Q?7ID4FpqTXyY9yUrt7TcXD5mrPWFYU5e7xHRwoDj61vG3IDLcyGafuxNPnprS?=
 =?us-ascii?Q?i2wGDz53mifKT5BDRzrllxLKvdcvYIox+ZQAjProyoHWvemrdchFV2qxrtry?=
 =?us-ascii?Q?nZPE9c0gZeFYHLImlPy/YiUvzi/+uneSYZXol866q2ggizeclBvat8A+L/2a?=
 =?us-ascii?Q?aFR+aUYAoFOUEuuGa3j1DV9Dsgid2u7p+CvZ5rx3/0B3wwYQXLCJv50Vkr7V?=
 =?us-ascii?Q?wkqFRGlAfvSgNZXIEDrVWS0CYIBS5JmutbVzmPSxpH3p7BW/kIz30IdeeCRy?=
 =?us-ascii?Q?4AbpZnQCuVxG8RBXg1R8oIdUmY5kOh4BPV9gLjeyAzB7GHXZY68pccIgJnhW?=
 =?us-ascii?Q?BvmhV9BAu0JGBcQ192ncodXO7GipwxNfhVynbjt2ZUYCDTrbWSUvlyEnNPwR?=
 =?us-ascii?Q?PPgR4sO7kT2CqkY4+6/ArM6JMb/Ik4GMt70YTBJx6Ln4MfaomeyTeJj5N3du?=
 =?us-ascii?Q?nmM4G6DPfxIxbAb7ktQF+KIQ7Z5jS+friz1mku8KHIrvrh6atMOsVu8Cmwq2?=
 =?us-ascii?Q?ciiRuxkq8kbz6JWF7NR2xIqkP/cnoTm7srBFcT8pEBO1uJaV4L9L0hMAvbhx?=
 =?us-ascii?Q?k2HiZr80avmlTI8Egej+tjASy09AxmM8lMfE4HmMtEoywJtCYqX4EN2NdWQJ?=
 =?us-ascii?Q?AcCbuhfDE6QbJUA6LzAkS/vcJEr6LEVwjVtP3858deqnyIBcvz1cJ7ZKauxT?=
 =?us-ascii?Q?9ndhUvUD4llb0aoZbgh4wK40nETEL83eDcbyjz2rdHePsVhuHsFTrax3ikTw?=
 =?us-ascii?Q?Fnoz4OPQ7hgIJ2w/Nay9kXguNPSkvmBYcl7bRhWCMwFATMhLxJ8/rdyqdAs/?=
 =?us-ascii?Q?QGeRuYEDUVBofkt9uyUIZ+PFIaXUslVqrtUd4CIGKb+Dyx251rmWtzZKsnPg?=
 =?us-ascii?Q?5UOgMMGN6TGSwTADuPpu8nGwuMUnys27CleNZV384YMd/TTm4EdxUYxoMh0G?=
 =?us-ascii?Q?CzYkykTJ3+z5O+/3xFoAftbrUT08MiIkL5sKhnkBDcmBbb+bobDlOPeg/N+p?=
 =?us-ascii?Q?PTLmpcc0gJ4TUfpva3TZLXK7yKYULwbkYX4cT52GyMcIXddYKNp5zuWiLqWd?=
 =?us-ascii?Q?dFmZ7SGRP3+1BrsNBeLRDb+5K336JiJhdrUv7uWYxX6xKgi62+snGGmocK/7?=
 =?us-ascii?Q?Qw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f09196c-80d0-4a80-ddc6-08de369ed77f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 21:14:58.2802 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FDLlmJQNhveURm7k0iX+DPX1sJPzfIcAbJ4Yt+kx/+kllMwMH4tsLWYheS/OwgaYQq3bUyeyzkUjG0EeOiRiDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF5AF05F6D9
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

On Mon, Dec 08, 2025 at 10:11:51PM +0100, Michal Wajdeczko wrote:
> 
> On 12/8/2025 8:27 AM, Satyanarayana K V P wrote:
> > Ensure VF migration recovery work is only queued when no recovery is
> > already queued and teardown is not in progress.
> > 
> > Fixes: b47c0c07c350 ("drm/xe/vf: Teardown VF post migration worker on driver unload")
> > Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> > Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Tomasz Lis <tomasz.lis@intel.com>
> 
> nit: subject is little too long, maybe just:
> 
> 	drm/xe/vf: Fix queuing of recovery work
> 
> but fix is fine, so
> 
> Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Same on the fix - LGTM:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> 
> > 
> > ---
> > V1 -> V2:
> > - New commit (Machal W & Matt B)
> > ---
> >  drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > index 3c806c8e5f3e..47612e67d462 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > @@ -781,7 +781,7 @@ static void vf_start_migration_recovery(struct xe_gt *gt)
> >  
> >  	spin_lock(&gt->sriov.vf.migration.lock);
> >  
> > -	if (!gt->sriov.vf.migration.recovery_queued ||
> > +	if (!gt->sriov.vf.migration.recovery_queued &&
> >  	    !gt->sriov.vf.migration.recovery_teardown) {
> >  		gt->sriov.vf.migration.recovery_queued = true;
> >  		WRITE_ONCE(gt->sriov.vf.migration.recovery_inprogress, true);
> 
