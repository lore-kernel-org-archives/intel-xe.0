Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C09CAC87FCF
	for <intel-xe@archiver.kernel.org>; Thu, 14 Aug 2025 02:53:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 627DF10E0E3;
	Thu, 14 Aug 2025 02:53:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k6B8WQZA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BCA010E0E3
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Aug 2025 02:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755139980; x=1786675980;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=YPz9hNTRYpFFXd1ZVRgc+DougRlFCEx6mLfSNKHraAE=;
 b=k6B8WQZAYTTW8zfuLdAgTT+dy09pau54KiHcF0yP0vDy4KpaBc94RugT
 FABr8Xp6PqrYdLNHBtk4mioae39Dv24xPmjc+F1tpED8p7RLsdt4F7oPW
 AZ+1iCO02nYKUKTnRySPVXgWL3za55L7qk4Pihh4BNjffPTBkT11jNkhf
 138hIpgxqLjIyXrFS1B4sojahvvTWBc+kuBctAGg38NDqTvMoRFqn7/Sp
 zawyH8HC2tdHrYvGwRGDpFBLQZNW32RF7bIvT+fvH7RhDYz0ddGm/gG35
 rtrmBh2QIZ9Bjch232r5sMTQJm8JmSESTJV1QZyYlcI8AfVsZtAN0EWyv g==;
X-CSE-ConnectionGUID: QTqGXL0yQR2Zk2kpkyP+oQ==
X-CSE-MsgGUID: coa5w+GCRwyqmfeFPgGFFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="67718235"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="67718235"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 19:52:59 -0700
X-CSE-ConnectionGUID: ypDuQM/jTpKArTzGWPfq+Q==
X-CSE-MsgGUID: GSh+UnPyRtqVK7zxdmDTmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="190348288"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 19:52:58 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 13 Aug 2025 19:52:58 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 13 Aug 2025 19:52:58 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.56) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 13 Aug 2025 19:52:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ppBCz05Zgty3uxinQFAWKGBG2XXy19aHLF1OqYsVguLtQwwvkf9t86SYLLUo1IlRIjNEYQf8zmy6NMAixb02aY98SN4zGPD1XekJQ2lK2RCX7TyLu8NyXGd4hvKVpK5leA0eRhGsixR17hwj4rfOZQSCyafQV5O5bFjDTuCwzWnqpnscJq7dZssoWEtA4haZXM9XTU9MzYH+1cRXeGbqGZpByM+Ho4gLTnE7Rak47PjikPPjm6SOX19tSCx9ky9Lebd3iKQadfRtVx1qT8qd7Tl56ngoser7yj70JMKUPeaAfxvxihU+R/agTB48M/0qjPIMM30lH9XpSqBFUnhzNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rsdT2e2DW5YU3dzBcPIjN+mvrV532yl3JhGA4gnjz80=;
 b=EJQTPywi5c+0J1vuiWb/tAzOv9140fkrAwA4Tk2KExN/B4gbOcLXZvT5JCtFsBHv0Tkp06ndcNYsdL+IjkRC/em5pPjsydx9gmD4GNcyd8k4VpwV4o10ACJATevu7aRMQAF8moMm9Ow1D/St98Ea5dN3MGlofCfchvwJG2jVDW2WSW8Ha46I+oH/W+mSgfSfmAIP50p6EJGVSt8u+w3kdpewCjLeF8tnYuCvlwO8u3wrZB31IDX8Zz72W7npuJXAoKPWtrG+mpMCksS/yd27HqnV1Ly2uBv3q+QK0h+BuYx8B6yuFJ5p4e28mEx8OAruhe6k0cJ9wizRUZGG5lrCmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS7PR11MB7931.namprd11.prod.outlook.com (2603:10b6:8:e5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.15; Thu, 14 Aug
 2025 02:52:55 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9031.014; Thu, 14 Aug 2025
 02:52:54 +0000
Date: Wed, 13 Aug 2025 19:52:51 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Jani Nikula <jani.nikula@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Subject: Re: [PATCH 02/15] drm/xe/tests/xe_dma_buf: Set the
 drm_object::dma_buf member
Message-ID: <aJ1PgzGSTOUd+rGA@lstrano-desk.jf.intel.com>
References: <20250813105121.5945-1-thomas.hellstrom@linux.intel.com>
 <20250813105121.5945-3-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250813105121.5945-3-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: BYAPR05CA0057.namprd05.prod.outlook.com
 (2603:10b6:a03:74::34) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS7PR11MB7931:EE_
X-MS-Office365-Filtering-Correlation-Id: f6049420-3a99-4590-dd2b-08dddaddaa6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?gpGiqpELtvNpDCGAuBKCUm20kMx9YnIsY5uFxvemsoI+fKx+J+TkGj4i3r?=
 =?iso-8859-1?Q?0pD7xdqCWXCh6Wcomc3g3DnSCl65dhvXUz9tUeh2SCcK+p5udDTluq62qH?=
 =?iso-8859-1?Q?ZcwGIqYn0LZloiIKZ80j8rpTy7NZVDwcspLqkx7WGRomyTlVXEw1rdtEty?=
 =?iso-8859-1?Q?/gqwuhWNkgFIbLuvfNxB+AGu6Oz7trIIKtIPGh0g6IQAkFonHeWNo3Ij0B?=
 =?iso-8859-1?Q?I2K3dF4eQuEkknH1EsINW4Vq1aQkNjhY6j8e8ILrtgTrejngyfLAqyaPG0?=
 =?iso-8859-1?Q?PCumuAYM1Vs74AClG3bug/bulHbk3nMCtIKkaNFUJxOHJtcGsLg3v7CbBe?=
 =?iso-8859-1?Q?A3b6DMQNdrLamoFlGUYo/C9T+m/29b89HSIKCO1xwff48vaTBoP+U4zlmR?=
 =?iso-8859-1?Q?4Ph/O+bX2UI8tsuctWGzx066QZfPieOWQiZ+TxQFRKqWVbF1lD8+YbmpbX?=
 =?iso-8859-1?Q?bPrO19vXn+riRTzH/l3ZijbVTu+hH+E9tVrLnAcHuZ9vphtO10zTOT3PFG?=
 =?iso-8859-1?Q?OXyXFEkdd8/Q2NjWxtxh7m0fnEMXPKLYe0jKF6yHiGcN9vSbW6PwoUSGnD?=
 =?iso-8859-1?Q?mj74bvUelJ4cML5MEEMeS1/+bKspB7xcFBcWhzb3d2DIUNoQMDAzwudeSx?=
 =?iso-8859-1?Q?61cWTTNsdQdzYFcFkdv+nsbnCOYMqENNGSN3GjfnCULYZ9QDUzV3rSPAjf?=
 =?iso-8859-1?Q?MjLHBVGoo6L+TM++0BXXTRXnOEtb/e14qvkrBO7AZihVcs6NwaFf5yrV3o?=
 =?iso-8859-1?Q?vvjsoqWaERX7iEwx4pzrB8z+K2knyQyfD8B3PPh/JdZ01Nyac6mSCLO0VI?=
 =?iso-8859-1?Q?PMMRcgH0cSjc4qxHC3Ne6ihclZdFDHi3XkoUpY5vtREf3KZoQteLVGxBb2?=
 =?iso-8859-1?Q?NlTiiKE1WfxWpmVR0bCI+jNcEtdBDK0ZsybDiCWFbT/Gv4DVlClMZkrl9K?=
 =?iso-8859-1?Q?e6L4xfvqyatyLxnP8plpQdTilxsPfKHTd2ltj3kwrRR1wmhh7BCvQS3u6a?=
 =?iso-8859-1?Q?Q/RAhqv3JZUtfWMxNjxcveS77/6gsAe7MMfCc1HboTLKOnJ8pEuipYlVeG?=
 =?iso-8859-1?Q?x9CEzcMCHx1wmEiTYbv2yhN4948Sm+V4puRebU+0wkcUNFvh8L52+5/Y8m?=
 =?iso-8859-1?Q?d+2Kz9XKB2xgFcf0YIL8hs5v65FZls/gRHF9xleUTzSZxb28YWO4g8iIfu?=
 =?iso-8859-1?Q?/rZvUIMvbfyYQSRg7I1Sn6SEZHSLU7OS4Fz0ifM7UitbsQPTYoxUfWHCBC?=
 =?iso-8859-1?Q?EHmorY8VyRDQ3KvvMrI8cxeKaUroASSr4ATlRY4NER/oc2e0XRInHiLX51?=
 =?iso-8859-1?Q?bnK0lERuzuerYVU9kTPU2PVgcjmxX9+vFPM3reXTPVLp11q9lG9ZTfNvL4?=
 =?iso-8859-1?Q?lDlFIr0fGcVVI0sW2hdvBdAbCqZ7A7fgQNgrvqCxcBI25090nXMvxQpx+/?=
 =?iso-8859-1?Q?HlGOG2kncBA54FziH0ABFfdBOpr8P8GqLLXPJ97APLgNYptKDAUUHpfU4U?=
 =?iso-8859-1?Q?g=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?w+dPADfgaNb6wsCz1QB6X9ahBia1Gy/G9GEury6jgiPtuxGwMT6ke1sQ1f?=
 =?iso-8859-1?Q?TXu8xby0qHkNowdecAyWf7GIcAM5o1ak8v8hH2c2nPWfioVrb5x4HY5tYL?=
 =?iso-8859-1?Q?Q2jNTDP5uVpdzRYgsQTSf2T6aRTivJ9gB1kiBWK6K98M22veXQPAeW/5NV?=
 =?iso-8859-1?Q?q3bPJ7+zxjDpiOxu9V5L7Y1AZ2gll2wVHX6TTOX25VvDwNS/gWZfezGPZ5?=
 =?iso-8859-1?Q?iZIsGvsz5LPG58XzYzdJzqaIaXOJpvlDvzeXDGEFvgcYhQhkJWAxQAYgxW?=
 =?iso-8859-1?Q?D23vAGUhsa6H8On69oYboTkO3shKqwovgw5zZFUyFAPz3gfo07FnQZqAer?=
 =?iso-8859-1?Q?/8nBjM9oL2SdCJL93Pe50ZIufjqyIwdoSWJk1UqnitfkRcsw/0wx+qvNa2?=
 =?iso-8859-1?Q?nvJT4wlNS8OtQzV/A+km3MWNkWrGrZM1W3flJ+GWaDqTATxq9zB4o7sOCt?=
 =?iso-8859-1?Q?WeK3805rvTQGIgQrfOkmcNMSkf1C8qtuOTcEJWhFkuUpK2HvIgVoF0ecCD?=
 =?iso-8859-1?Q?mI05ZR1gD1KIsIZPnhVfLlMyeqdJoC7ugKcYiCAGW9pwItmJiqGRxn7rDQ?=
 =?iso-8859-1?Q?PGa55GPecCHhcLHyfSPaUq7wZ0o+N20II4tActG3eacsSeZgBqdJoF7THf?=
 =?iso-8859-1?Q?rVGNCPmG7+c5wnB2N1ajiYpXAZmyflekqKO6PDkbVRe6MvLf6nOfAetZXN?=
 =?iso-8859-1?Q?0Pl+Kqk46t0gvCxVV3bZKcKp5eRh+lJIjEKS1lcLdsiaCh3cwSNEs68l8T?=
 =?iso-8859-1?Q?Z5HWShYPAxk5whD5dCRfxAZtMB4sA9LBVBdxD2NV92a69sE8Xf4qxe9SX9?=
 =?iso-8859-1?Q?kFQS+9Qe19X2TDQ2tdo4BeWM1FoJmGedlWFVKv5rLP9etPPrvEm34wixil?=
 =?iso-8859-1?Q?ndYPtVCWZPgP/jS0iCVWNQAhjLjXQl9IxzxT69jz+6e90IFt6SvzPNPnTw?=
 =?iso-8859-1?Q?Z+DmQ0zYUjr+uDum2Rn6XEpWDagc59cGhmI7B10LQHdIOWHW7f6kKKklFD?=
 =?iso-8859-1?Q?twRGx/ZblX6NBqkwIg+vvjkOVCGCJAmlNBKWiF8bN7IM4TzI4ctVqPzpMx?=
 =?iso-8859-1?Q?WN5APCbDi5Q7oZ/N6zWDzRUKhcDFzmRrz/WdtIV0rgwtlAyCbb+u0Q8t2z?=
 =?iso-8859-1?Q?ph7Le6Wo3Bx6KkUy5TrkCR6O6ixdkUqzkzPmcIZVSNGLrZYxJOletQg3y/?=
 =?iso-8859-1?Q?/JqdUAhSQpd+KI2i2dMeSXMRiLpK8HOqgRoZkzXACFS/GAZOL9XCyqWzOz?=
 =?iso-8859-1?Q?qXCZ0Tw2kbg76EKjeiNLNXEmm5IwNEGYOYJ/Pi1cZNKZaktbeNoBpDypFx?=
 =?iso-8859-1?Q?Shs+cPQS3Ax7uQhogY6a4kNB7Y9poYovtR8M+NUKf5r/ZkDRIxy+UUMIXC?=
 =?iso-8859-1?Q?E33xOBMJAbivimTwmZK8u69cfZDzClHuAdSJNZByQ62zOTkk0rMfxfut3x?=
 =?iso-8859-1?Q?1g2dquRpM4eGlzQk9GYGF7gUm59bOpozmH+Uj4jtN3n77vao9ey58vVd/0?=
 =?iso-8859-1?Q?ysOLl2kaEg2jfX6OEQ2/XlOr0zR8XACwDSggacmWpuwdps0xd8Kj2rxjFd?=
 =?iso-8859-1?Q?NCJXgxpgI+mT7EaZu57x61hY1J3C9e9W8urvCIIll3AQbgOrfxtQBlklA9?=
 =?iso-8859-1?Q?8lKSP5fSRkuPPNccUXV64Tt+d37eBhns1rLolcZ7CV887tolpolg4w3g?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f6049420-3a99-4590-dd2b-08dddaddaa6a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2025 02:52:54.1254 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b2PPUIOwbUgb19lGAtJVXhRYy+fSdqS/uKMw5K7/e5mt0HNR+zVh04CbDBSCT6M582sgoPeLX3w6yWK2bfn1ug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7931
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

On Wed, Aug 13, 2025 at 12:51:08PM +0200, Thomas Hellström wrote:
> This member is set when exporting using prime. However
> the xe_gem_prime_export() alone doesn't set it, since it's done
> later in the prime export flow.
> For the test, set it manually and remove the hack that set it
> temporarily when it was really needed.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/tests/xe_dma_buf.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_dma_buf.c b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
> index c53f67ce4b0a..cde9530bef8c 100644
> --- a/drivers/gpu/drm/xe/tests/xe_dma_buf.c
> +++ b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
> @@ -57,16 +57,12 @@ static void check_residency(struct kunit *test, struct xe_bo *exported,
>  		return;
>  
>  	/*
> -	 * Evict exporter. Note that the gem object dma_buf member isn't
> -	 * set from xe_gem_prime_export(), and it's needed for the move_notify()
> -	 * functionality, so hack that up here. Evicting the exported bo will
> +	 * Evict exporter. Evicting the exported bo will
>  	 * evict also the imported bo through the move_notify() functionality if
>  	 * importer is on a different device. If they're on the same device,
>  	 * the exporter and the importer should be the same bo.
>  	 */
> -	swap(exported->ttm.base.dma_buf, dmabuf);
>  	ret = xe_bo_evict(exported);
> -	swap(exported->ttm.base.dma_buf, dmabuf);
>  	if (ret) {
>  		if (ret != -EINTR && ret != -ERESTARTSYS)
>  			KUNIT_FAIL(test, "Evicting exporter failed with err=%d.\n",
> @@ -139,6 +135,7 @@ static void xe_test_dmabuf_import_same_driver(struct xe_device *xe)
>  			   PTR_ERR(dmabuf));
>  		goto out;
>  	}
> +	bo->ttm.base.dma_buf = dmabuf;
>  
>  	import = xe_gem_prime_import(&xe->drm, dmabuf);
>  	if (!IS_ERR(import)) {
> @@ -186,6 +183,7 @@ static void xe_test_dmabuf_import_same_driver(struct xe_device *xe)
>  		KUNIT_FAIL(test, "dynamic p2p attachment failed with err=%ld\n",
>  			   PTR_ERR(import));
>  	}
> +	bo->ttm.base.dma_buf = NULL;
>  	dma_buf_put(dmabuf);
>  out:
>  	drm_gem_object_put(&bo->ttm.base);
> -- 
> 2.50.1
> 
