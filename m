Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 707F7D1A42C
	for <intel-xe@archiver.kernel.org>; Sat, 12 Oct 2024 02:02:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FFFC10E21A;
	Sat, 12 Oct 2024 02:02:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PKZvFfE2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2165710E21A
 for <intel-xe@lists.freedesktop.org>; Sat, 12 Oct 2024 02:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728698554; x=1760234554;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=IBxz1SHoZNOns3I+qGzZI/vvXhYHaIOUq+ONayaL3PE=;
 b=PKZvFfE2FAz300f84fi8I4QW08UxbdLXxGPt+LQh0SoL/YJPTCMw2NEk
 SPAgM5mcd0ogNQ70ywwiHbH9OsHzFYT4iJ9tcZFDR/k8jx3IsxFmrKtYH
 DA+RouuCEXN5zAIcrvmrXyHBXizQ6XcSIVipBroNqgiFWXH8HTETOICgw
 aCu+UfVFxphhQrAzC2/b25FvKGkDWCRMQ/LLROq9R+7tPPcx/JWDfBycR
 XkNTJGxfm8hcGHDQeg7umORLTVmH3Im7/IYmcuUf3+FNILTabhLthCJJp
 ExsEfffl/NVS+vZjGFDW5BXy0elWTprPyZW8ZW/MxmsnfhX8pd2jDgv/x Q==;
X-CSE-ConnectionGUID: kTxnlVSESK2pGhQsxTIMiA==
X-CSE-MsgGUID: 2XCYcyKjSPKDVJ5ZPJLVOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="50654844"
X-IronPort-AV: E=Sophos;i="6.11,197,1725346800"; d="scan'208";a="50654844"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2024 19:02:34 -0700
X-CSE-ConnectionGUID: pVDc1IpwSvGllqCJtlRk0A==
X-CSE-MsgGUID: mNaDT8nYTkG7P/DTbG2trg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,197,1725346800"; d="scan'208";a="81627053"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Oct 2024 19:02:33 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 11 Oct 2024 19:02:32 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 11 Oct 2024 19:02:32 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 11 Oct 2024 19:02:32 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.46) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 11 Oct 2024 19:02:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ndYQtCgKvpY9IKELIsCHxv6Vvk/zXGNfxkz3v1i1VhFQ7KsRLpjd4u61D9fdKT/5AMd/nMwPIy6KuVRyOEVKauh2nCYEhtW6+Dbr4VdoSGEfCb+8g+s3HXxXk7q2rsSqK/i+kbTwZwQnnr7kAnZ//cOyJauK79zr4zp8nNMXqEnx4SUNZv7+rMiC/GuZFuEUHSwRZwsxSPKwv1zah6tBU2H1uyQ1iDPBG7O7MrQnYAKys8+3ZX1EcF5M4JeNWZBD29UrRUrvjhmAvY/D5Tv08PYHRnh4fDZzE0VXUTgaayuUlIhCBOqj3TnzBgpVimp8fMwsUGLlHs5NUmPzuePoJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t+1U6b3opldY9014p06BmPuFePMn1rkdnUwif256GF4=;
 b=yjYY9ELd1QJOYz9zSLPuGW3mPiF4vDOAHZnc1QIgRNTQ1u58S2QRds58jAl5nPU/Vazsb0ao+JXlJ14T5lHuclTl6OhxHyHQ/XHRbmZFUouW4G8h7pyVnBJwoCGPInFUyRWLQCZLKIGxGDIQr18+LnPUhYM/OrjlqIJP3yHBW0otA+hR/wgXkMvNTrvGIzB1RUaP+xG+hittPEDIKuX7EpRlAgBObRKLwNCWcNB9YLuvgBPs+NPtchsrYR3BV5cJvyzY9z9YNKMUE0aJgHi/NDWMG3jaGaIw0LWZPCFh/v8/nHoIAsMaMyMHkKl0+UuJ1Qwa7nUCbbziWoMaxBrTAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB8152.namprd11.prod.outlook.com (2603:10b6:208:446::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Sat, 12 Oct
 2024 02:02:30 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8048.017; Sat, 12 Oct 2024
 02:02:29 +0000
Date: Sat, 12 Oct 2024 02:02:05 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 0/5] GuC Buffer Cache
Message-ID: <ZwnYnZQQZm5jtpWL@DUT025-TGLU.fm.intel.com>
References: <20241009172125.1539-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241009172125.1539-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR13CA0126.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::11) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB8152:EE_
X-MS-Office365-Filtering-Correlation-Id: ef951e98-5260-4f99-b32f-08dcea61ed43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lmc+epLJY5HjgXzPchojsikOqnIDo11nHheuXD1pvWVvb4cjkv1xx6/59dSn?=
 =?us-ascii?Q?3lUjg6JHp+qRQTvjIL23UQhh78DK3/tuOwVORd11owS5/WwGPQekGYWmhPz9?=
 =?us-ascii?Q?aVd49BUbfE4k/9VdTpVVJvDoJzpiREXMdJHVI5bB8gB6zHmn64N7AEj+jXTI?=
 =?us-ascii?Q?I5+6CaCNVITJsS3lzVgkCjxAHBTWodyQ6heCIyUETnkPmHSbZz9y1Rkd22S5?=
 =?us-ascii?Q?1vbfvHhjDyN8xqSmWshH0Jfn5M5puY5k5uQZIcGpR6OX2Fhnhgqk8nwE9TqT?=
 =?us-ascii?Q?70Q7/YCs6LcoygX+ZFe9I5pbIPSHmuguGHCTCKWkYLICcXJaVZMHLkoE9N0i?=
 =?us-ascii?Q?tWiSMUAHGb0ppaJX7erFIolrrWs0D/UWcseVcp8fxIMT2TFx0oP0zxE6WLvk?=
 =?us-ascii?Q?LykmnmbCVAhfGiBfKbBKKPwmkj+2CQepJAruFwdeGBi7CL7CXvMJBYHVnj6l?=
 =?us-ascii?Q?yplV+TgXGGookiygPA9VGp/WKR1rQkbEWrBpvXJiuam0QkF21JgzvjvsDV08?=
 =?us-ascii?Q?3k5gQ5LUxy+SGd+5O/PIJC3PfuZONbPBWWkcQJfjTZTe61nK+XaSPrvWHZV5?=
 =?us-ascii?Q?IyInx/n7e3HOtdwWqsI8zD9lupdK42ugDQ7sGEn+pSjakR2FuoOZPAg8Ivy9?=
 =?us-ascii?Q?FXHX/PfFSqLiulhCXzjsDgbqBUUQHiPgi+5sBnND8xCMQugrSfIlBMk+EYU8?=
 =?us-ascii?Q?EAmRbE/iHr24crREieYM74wkhshYXqstM/NGSdPUpPMlA8AMaKXg9kSmZdht?=
 =?us-ascii?Q?/iYIwdteoRbi9Imz4Y6qtwwAqSBXMojf6JVPN86PHSmNoe7RRV/r4Y60anKf?=
 =?us-ascii?Q?XlxF1FNL8MebCVyxI82Fc6fmJF5AqzjINx5X3/FCbk+SB4pO+zsTbSQSnTFH?=
 =?us-ascii?Q?fPAs79lAriYnj51Lcm42xDgH8GbrZHf5T6Ne9RL2BuHSTI4mZceR2YVs0evI?=
 =?us-ascii?Q?30fhi4xofgwZ6KVKvsq50dg6BWtf0H6He8rzJavdbK2a2PZn2YU6+SMzuR2K?=
 =?us-ascii?Q?L8w8na6nKzhSTyobGAotRLfstioD5MP9penm2LBUzVNUZoWWtjC23iyzNQFr?=
 =?us-ascii?Q?9ly+YrlHKFqJslY4u6NOtzHIWA9v+hEbt3Tc6kfheGFo6rYI9KB0943kZLo6?=
 =?us-ascii?Q?0GKqKDM9wl2+kPw5jOq00gSW7b57VDXBjgeOfkMJ7e8wL26nX4Io616NX3yR?=
 =?us-ascii?Q?SATm1Cv05ByNFveAldVUYBuwEoCTk5vh+bAH6A4T5cEnoW2WUnOdQjEvg0mT?=
 =?us-ascii?Q?YDjhBA3kjhaHXW3vJ4W8LYMjevSZlJf19wzcw2jyag=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Sfw1ZgIByCHq3flu9dPlQ+6nr6YtNIJm2+7SHXbeUodRLVe7ODgnSvmoewLw?=
 =?us-ascii?Q?Lur6dx/lyVBkw6578Y6VJm7r0wA+iipSxugNmZDgp87oufJJlgHXvPRywhI+?=
 =?us-ascii?Q?ONfQQgbSRsdso3OHxBxeY/ERVUvKQ8N2tyFHGdROlWtddr2jtqMvrlBGwZjq?=
 =?us-ascii?Q?xLpmXnlg8PSoWXRTWbGXxqwrX7d3OOFSWII5DpxgDr6ZEU9K63wdsWqJrcI4?=
 =?us-ascii?Q?QFTZdBmPuOqUjpUDcYM772zbFiQQFrhkwWpIUDUNR8ztIQMcIqlo9ppbbFZu?=
 =?us-ascii?Q?1EK+1hOTPyXIqQ6ZL7bA6zsUth/Smv6z29iguEHq6tpwhW5g6JTR850ptzq7?=
 =?us-ascii?Q?9T6IEqL/yBm/91JEJ8KRBMvCp/dFtkdGwJbmoeyH+bVlZe5+W0IB5yt9RpGA?=
 =?us-ascii?Q?cp2A2mg+k7uVQ/F/sZp8UTxxankgFQ0Sz0OHMr3Jhb8MLOjtIEpyAD4+OIJj?=
 =?us-ascii?Q?f2y4XUNctgJHCisZGgDO+ph1+6NSP9tHSbfynrfKkUXXoIP2RO8acbkEUofQ?=
 =?us-ascii?Q?9b9p8gcpiHcH6aBhVd7ts6AFaZWFYUhDEotEcqm9mYJ4zWcdMG9wuSI76qGr?=
 =?us-ascii?Q?BfTwntHQYtvGcutIJ9O2c2JwAhT27Zc9fu0whNAgUD/ZDwrbaBb1OnbhCBi6?=
 =?us-ascii?Q?SBcEDmTPspOhFZzvdGITKUzJ8Mk0niGgNABTUr9+OIyTEBZAf1whzrPqXRkq?=
 =?us-ascii?Q?8szKz7INP5GOs/X8/2GSwFDg6l1JOW8Mkl0PsMiIt4syOSfFuPx4+Rcuvevx?=
 =?us-ascii?Q?bbtjBuYBmNoBeYFZ47UWRpQH/5IHfMFXgiXB6k73HiSiS48qnpL7v10XhqE1?=
 =?us-ascii?Q?caaQyHXp3WKcDaPZt7+3c9yco6Pz3Gn3DxOZ/YKHoWJjohgH6IKBKPE6OMdf?=
 =?us-ascii?Q?mievk1L/K/3KYxUqrw8kuZbrEnQXiRiM4zk3mBfqENzX92A5DxQI5wlvFs+z?=
 =?us-ascii?Q?gppWyAZ1goT25GLjSVtCr38fRdPL/G2JwKGfrHM4Fwl+LT2ancZxxqHLk4Ax?=
 =?us-ascii?Q?3EOAj/8oTsFNE95W+byR4HJsxl02KRsmrS9O3eesAL9vwsyjI1D9ZGQqSiyy?=
 =?us-ascii?Q?sz5mo70vVgf/7Q22Upd1hnEMi0pgutG/z+lzvX1ExODEZp1gA9VibXrc1K48?=
 =?us-ascii?Q?fxpIGQmPN4tefTk7qzt0zq2D8mEcVbM8dckwIGyynckKtOtOYxCKpD1uvk/+?=
 =?us-ascii?Q?IlS3djSly2GD/RKz3vBJ8ZfGtieLRCKBMWAB41QbfZn7/y8IS5uvqNotv5yM?=
 =?us-ascii?Q?pwSYVzkJS7OHzg4/uPjcYeERwhJTbDDGLNMVYrKMAR97EaO4IeSFW8b4zwM8?=
 =?us-ascii?Q?3+GjTOor/P/hYGvcXyLBiK6USlVRRO9tKdi6rcasUuGhqLZyGbVuovRUXRg5?=
 =?us-ascii?Q?yO6BXnxfWroRg7VKuVS7D/NRQeng6M/itautOxotctkZZ7y0pPzqbzqouZEH?=
 =?us-ascii?Q?gH2ANDDHpgISgaUdVTthF83EhD+3H0Q/CM5O6iuDGgOsuFJhwRk5nNbKQduy?=
 =?us-ascii?Q?TKYnZM2E/PjCaCZ4EBTdDmJd0rJGp63SuhEWj7gyPj74C/rBZWlxU6PAZ9Il?=
 =?us-ascii?Q?bbnhhYDLWmmpXvWinUQICg/czUOxlnBhf3iM/2nTZtNPoKynj7OXjd7UYtmU?=
 =?us-ascii?Q?3A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ef951e98-5260-4f99-b32f-08dcea61ed43
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2024 02:02:29.4091 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7mA8St0lfK/WF5DipqgoY0pMwY2NAe/j23WN7nlcmOa8YUNgQB1xsCKUpSGVsMKiX19pf/wZ4XNAldDP8oiDjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8152
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

On Wed, Oct 09, 2024 at 07:21:20PM +0200, Michal Wajdeczko wrote:
> Michal Wajdeczko (5):
>   drm/xe/guc: Introduce the GuC Buffer Cache
>   drm/xe/kunit: Allow to replace xe_managed_bo_create_pin_map()
>   drm/xe/kunit: Add KUnit tests for GuC Buffer Cache
>   drm/xe/pf: Prepare GuC Buffer Cache for PF-only actions
>   drm/xe/pf: Use GuC Buffer Cache during VFs provisioning
> 
>  drivers/gpu/drm/xe/Makefile                 |   1 +
>  drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c | 450 ++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_bo.c                  |   4 +
>  drivers/gpu/drm/xe/xe_gt.c                  |   6 +
>  drivers/gpu/drm/xe/xe_gt_sriov_pf.c         |  32 ++
>  drivers/gpu/drm/xe/xe_gt_sriov_pf.h         |   6 +
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c  |  67 +--
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h   |   4 +
>  drivers/gpu/drm/xe/xe_guc_buf.c             | 391 +++++++++++++++++
>  drivers/gpu/drm/xe/xe_guc_buf.h             |  48 +++
>  drivers/gpu/drm/xe/xe_guc_buf_types.h       |  40 ++
>  11 files changed, 1017 insertions(+), 32 deletions(-)

See my comment in patch #1, please explore if that suggestion works.
Nearly 1000+ new lines code needs to be carefully considered if this is
required. IMO we really want avoid bloating Xe unless this has strong
justification.

Matt

>  create mode 100644 drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c
>  create mode 100644 drivers/gpu/drm/xe/xe_guc_buf.c
>  create mode 100644 drivers/gpu/drm/xe/xe_guc_buf.h
>  create mode 100644 drivers/gpu/drm/xe/xe_guc_buf_types.h
> 
> -- 
> 2.43.0
> 
