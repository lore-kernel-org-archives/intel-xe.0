Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D13CFC36002
	for <intel-xe@archiver.kernel.org>; Fri, 21 Mar 2025 16:56:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FE9910E177;
	Fri, 21 Mar 2025 16:56:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RhGPfVMj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 495A710E177
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Mar 2025 16:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742576160; x=1774112160;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=XtqBAiG89la24QPTbKWK/wBfWPIT8UicnjrtKEyho1U=;
 b=RhGPfVMj8V6jXH/m0CcJMgrGbB9tG18bAyKAMxDnewMtktQRfT6z0ldy
 tdFppe2JC+LocIr/r+mPVd5xWcJRPuwMI0cpmYd9WOrch33OefIC0Km/m
 6PtrmMtiqAaRwGEbCK6cnsBuHKlDAEKDbyJx1fxOyR6iYadFGzB6gGPHA
 VLmojZ7hlEJlExLxH8BVrUTm9o4EU7Dr2sYXFBYk4pN+aP8vgHPStTLs+
 Q4qaoVMXqbw9EiyoMOjChRMYDhxHsxhpVpZAnq7ImnVUY+NIHQOT5q3Ww
 zmzJlM+2D3fTy6IiJ6VLUAYO1t6lO5mSp8zogGYzR0RVt26UJe8G7OyW2 Q==;
X-CSE-ConnectionGUID: cZQjfltaR5eYNYPkTT4gMA==
X-CSE-MsgGUID: Qqhn/QAFS4ejvpVR0lfYWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11380"; a="43973907"
X-IronPort-AV: E=Sophos;i="6.14,265,1736841600"; d="scan'208";a="43973907"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2025 09:55:59 -0700
X-CSE-ConnectionGUID: 5rVmJHw/RA+Lm8R56uiRYg==
X-CSE-MsgGUID: bBEvTPItSdS04ufv1m2O+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,265,1736841600"; d="scan'208";a="128281366"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Mar 2025 09:55:59 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 21 Mar 2025 09:55:58 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 21 Mar 2025 09:55:58 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 21 Mar 2025 09:55:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ciaxjzdQUgKTXfhB992gNpI7G2FKDtqwZ9LxLKlW6oPMbFzPO2I++pMJdp13NVp+iZ8g/76WKfz0jcoqKVS9h836gG7B2RyewUPr3pIrB3q8yqepzlf2WZuEe1cF+nRDgVjjvNQrZYa3ZZMnPBSjAwp31j79cI9gdtowKcDSUvtk2UVT/VmgqlcPkpbB0ToVTtf3p4t3uFMCxtu+JtsvKhvbr/0jdJ146BIVTE52vEncYnR1CpQsmsdrFzETc4Q69ccRbOuu4iHRoJsH91T4vO00SjthdTWk9VzXBjZv07z7TNpPSp4vzzI9dVNDr/X66rpRGkaN6ExNtfG2a4tSyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PRuwNf2chJP6qBId2DcKb+aenBd/tkMNxTH89BCY+EM=;
 b=CA5hJbLScesSEv6V8gJn96Xe7mJnsuKB+rldzTnxNPcHFfhhPVHYAXGCiX0CRdYXmmb3aXUcvV7xbucu+ug36psTXohY+TUuD88TxE4rNG1EPkL4gaSRLnGQvRk6Wre3fh9nV62q8N0lC0gu53lhhrzuC3wiQFseRBchAhlpOJ5Z+lVYRMTz+OBWU/Vqgy1p5bRgJER5S7hkOiP066HMbedJs3oWb0VOgcHAtlGW8QFfATp6GUyJNkRPcNvYxW4LHPa3UDyjSu7NCxGZDZ9gEK/igF1ifyNhtat10EoTvBtgXsME41aAmUuHtq/hMt1Io90AqnCJvws5en470VEJjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by SA1PR11MB7040.namprd11.prod.outlook.com (2603:10b6:806:2b7::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Fri, 21 Mar
 2025 16:55:27 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%7]) with mapi id 15.20.8534.036; Fri, 21 Mar 2025
 16:55:27 +0000
Date: Fri, 21 Mar 2025 11:55:24 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Marcin Bernatowicz
 <marcin.bernatowicz@linux.intel.com>
Subject: Re: [PATCH 3/3] drm/xe/vf: Don't expose privileged GT debugfs files
 if VF
Message-ID: <fvnsx2rcjljjlwdb2sjxqo3otzpffnfs666ueldgojsb5o5gqd@xxpmrvvmnisi>
References: <20250320210738.1733-1-michal.wajdeczko@intel.com>
 <20250320210738.1733-4-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250320210738.1733-4-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MW4PR03CA0109.namprd03.prod.outlook.com
 (2603:10b6:303:b7::24) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|SA1PR11MB7040:EE_
X-MS-Office365-Filtering-Correlation-Id: 0878d1ae-a1f7-434b-4923-08dd68992e28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|27256017;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rrslIZ3e3bl5043pt4hNeQe0IiZr0iaj7jFkW8rSvrEcA5tAU+YFzAGuT6XR?=
 =?us-ascii?Q?EOrrYwST8RmMZwhJIAWCh3fCsMg+KODYQQDChOUgFFjKjSK4a61Vua1W+EB9?=
 =?us-ascii?Q?otiIbxGW39ym7PUENWz/TKj+luIg4RUrpuHkAPZEFLSWnOgo2+ardEl/tpaI?=
 =?us-ascii?Q?XE+LA3iTPuNGWs4pPn2E9dtpaDsnYiw1BxTItmrCmxYXMn1HvKtdT9rtJeT8?=
 =?us-ascii?Q?G0Ya6X13m/udT0AZ69e4fTk/OIaa3kPGTfhH+fnp0M5pfteYMbOX+zXlM9h2?=
 =?us-ascii?Q?rr+Jpzj9LodgxEM4tyV4pLuRuuqBAdfwS7Ikcj5891H3FI6Y8Wt1UHEnLwqW?=
 =?us-ascii?Q?CJOs3gA2QwGqmZ7smZ3RHP0e2SLmTNYFw9dIT2eBizJ/SNlB8eCyVpTZjgbc?=
 =?us-ascii?Q?cmhSjbqFufPPL5MfCKWc6jMPW4ms1GyL/BE6chH7uf9N40mslbmIMERAuGJT?=
 =?us-ascii?Q?nGDB1fiAI3XYmqMyOiFk5BZodT2wvj8vjXCJiiIKoI9pqqI8H6lYIRqUM1le?=
 =?us-ascii?Q?NzpoLDzyWCp+MhZkz95iMRqIcl7LH3XSxRTZKgHOhKyrJPBC8ugs8UYpNHJ2?=
 =?us-ascii?Q?aLs4Idv9vyJ4u7h35bX9khEgyScVWRDEXjoniqHDK0RslEMQec0NE95bg2YZ?=
 =?us-ascii?Q?BLLNmuvF/u/FmS41qQDTggLp7fREOWADSP+k75dg8wDi8vb12K5MWjRjXz4L?=
 =?us-ascii?Q?53cwTzGW71OmfXaN9soiXvy6hPTphMQSJXhZ5itgx/63R/xLLZY0BSUOU1O0?=
 =?us-ascii?Q?Evk52p3K9jIJICj2lDuaDlmFnH63/QZiZ1tWUvP7DPt7in4fdD8OhqTzHabq?=
 =?us-ascii?Q?+HWPafepOF+qtzFlm5ApDpVArTMlvO6AIu33uSSdrl2oe8f58wy35haLEsd5?=
 =?us-ascii?Q?A35JjS0Aj8dMjDXHTrjHVhAjUQC7okOPYNgtCbGFVZKU91rwlrS8c+4ZYNfm?=
 =?us-ascii?Q?bL0/DeqvEkx6koj51k+KKJzC4pfuwTIY/5DYYc3ZPeCxGzpuPfWS7a3KP8Um?=
 =?us-ascii?Q?3e2C3DTvI8tFOo8fT7l76BOdgt/iLUaaLpUthfSsFYn/n5DGULT0AClCHGlc?=
 =?us-ascii?Q?fY+CzM18npvYjHMDfTIK65NwM4l/xs3MXt+JCB3OzFr8ZIyGJ9H+7hcA5EkP?=
 =?us-ascii?Q?l49/hPdDIZpuMENgYimh380H0hzP+GOlMzB67ECAFAx8bSp1SRJQxFZ5UbYm?=
 =?us-ascii?Q?r4+iqmnq/sSPEA8wYv/DyGkV13nGfeY/hIvye3Mxjsl400N4MJBqoAV1lllR?=
 =?us-ascii?Q?9lVY8emxnx4upmnEvMEbvDEoXCNcIz80KG5CSeiGaHyOS9TFABuUTpHaej/M?=
 =?us-ascii?Q?kU0Kx51SFyZWvpFeAWEdL0fEsZS0dMabZ4VIMTGGTExRmEOYfTX6N+dGW/hT?=
 =?us-ascii?Q?7vGc+EAwSMFC2S0IG85pi2B7jg9GjHoiJ8/gUiqjh604C4Mac0CLf1qlEq3b?=
 =?us-ascii?Q?SRiSqtw7EWCmjUOwGITJb1kBcS5VNGES?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(27256017); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?U1gQyjH1cRqE9e7FJobPKyNM7YTfsUZErLByxjG0MdaEXRiQxy2r510g2gEY?=
 =?us-ascii?Q?VgvhOChI8T/4CKat8TqgJCtLPy4ggGack6bSAd6P8HqIfnAS/i39TxzsyPL3?=
 =?us-ascii?Q?SDROpnO/vsCGdjMHs5jaibjy2MOonlpzIzTBza/61ZFuPVPn0OPieC/gWIMP?=
 =?us-ascii?Q?1vJjipqcqeShzsYQOYLh+p2f85mj5yLDIhZNVZbSWR/1/+TJTFv8tSb1Uu0n?=
 =?us-ascii?Q?lgGY5EEdNp86/uDVrRRZ0bv8RXcxMy+X0Zy5x6hjdRpcEE2SljYgj/bS35Dj?=
 =?us-ascii?Q?ISwKDslb1i1VojA7yJqF/GMkZ6Ot+QuwfDQU3kjnsqV3snAnruhegZV85XHH?=
 =?us-ascii?Q?zHV/lzWBgmjpjwEzImWFuJ9aM93Na3yV90gozSVCspV8YkqCbXUznJs0dfeb?=
 =?us-ascii?Q?6RF8mCcS6eq5bKqGtmUCYyM3MTHqhhDDhVU/WyiP8aksCK2ZSMEw3ciE5DeJ?=
 =?us-ascii?Q?ScorhPR8IKySRcwBx/MgZbaG3UFsLMQVB3QEBfzCpiWT+Uvuec5ijdWUivQ5?=
 =?us-ascii?Q?XemKrsHanF5Zfy5Gjs7xU+qEhUZG/iK7Vpr7eTBps6RMDbT7lNs7C2B87fnD?=
 =?us-ascii?Q?60+zDzR9G463N2v1mqtJJ+bJl+v4LGR8WaeoY5NHN1ZokveXGtxlZJfmXAp2?=
 =?us-ascii?Q?nQWv2NF5qtRpF7++w2lxC35SeAxJkHUBg9QzIuJLDTfU03IiDNqTcN0VaI6n?=
 =?us-ascii?Q?IJTPEh1Dcjvz+rERaNH18N+Leh8Rg3VhGi/Qr9CD8295nj4FE/27lKhbbJjf?=
 =?us-ascii?Q?O6kM/6cixD6s+RK2EgdPUFUeyZvz5KP50YfXTwnDgE2p43RwYqrSbY128dLh?=
 =?us-ascii?Q?MVJ5Jzv8zkDAzJyCPi69Cdv33Zb8oIiWkrTRvtYVyXI5OFNLZoTkX4AxrJbl?=
 =?us-ascii?Q?HzVCwz5X6S3a9LtZ1rIl1SzA5JFO2ne32Vfikpc4fqEzAwJ6wV2+p3CK0yGq?=
 =?us-ascii?Q?4/CerdE9rVFkaJhD1wYR42/4b/RyTcQYOvtQMtEsHxcvfjjSxXZjmEZ1vy/Y?=
 =?us-ascii?Q?9+x1enqEJVNfAfo1PxaQqfZ0wjay4DpfIZ2EZD8Nuc0gubHumzDosh0zK5X/?=
 =?us-ascii?Q?2OadO41+uyYGwCEloKbMzy7fuMCSdL5XWdOd4X1UqRv4cY9iFh1WOxn5Z3Mz?=
 =?us-ascii?Q?cqq0KW1dLKwJeh8+PLFsJebbUVtONRPUAx2k+ITYaIMBlcQJG6qIDOR1mTtk?=
 =?us-ascii?Q?ndcr0Mp3CN5XW/mmQscGk4I3qr5g+bNIraJpzB0uIl/5/e9vhM+LljKhVLxL?=
 =?us-ascii?Q?91N3ItN2uCha/26x5TOih8jm0TIDZzpN3POfwBOY7eAeo4HIqQVX7JUI29Aa?=
 =?us-ascii?Q?hZX67UxnNSzL+zSiBpQAKRPL36IelripedKxBv85/6hxybLJhDy8UuuBcprf?=
 =?us-ascii?Q?XHo3PWwY3hOcotsMgUIL8TzZNEzLyNZxgnSyw5kuq3/0t+T6IHfmbHKYQr6f?=
 =?us-ascii?Q?Ubxh6qGTjreCGeLG6niYU70ORT9oJ2Q/uW/IHNQlTW9eogjMA6eBsFvf4/DL?=
 =?us-ascii?Q?CjWwFoOoh2RvLTTVvlfXolBQuI61a12I31bjYXAUFgGrpvVOtRbCYNIQeV/j?=
 =?us-ascii?Q?fPvqWaGAuMGn33Sbn51cVvjqaOvHD7HX7UZT8EyBltKuaWUngxkwq/qIqeeU?=
 =?us-ascii?Q?aw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0878d1ae-a1f7-434b-4923-08dd68992e28
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2025 16:55:27.3413 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aENBqwepcVHHzmmtx3/IyBhpm4YN4r4J/bf5SSn44i3yGGiaBHITpfNbIghM5Fo/vZ4uXHZZU2thF/IeNAJrpKG7HyI7xqQD/FmUBxOTG0g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7040
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

On Thu, Mar 20, 2025 at 10:07:38PM +0100, Michal Wajdeczko wrote:
>Some of the debugfs files require access to the registers that are
>not accessible to the VFs. Don't expose those files on VF drivers.
>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
>---
> drivers/gpu/drm/xe/xe_gt_debugfs.c | 18 +++++++++++++-----
> 1 file changed, 13 insertions(+), 5 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
>index 2d63a69cbfa3..789d463fe395 100644
>--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
>+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
>@@ -300,19 +300,14 @@ static int hwconfig(struct xe_gt *gt, struct drm_printer *p)
> }
>
> static const struct drm_info_list debugfs_list[] = {
>-	{"hw_engines", .show = xe_gt_debugfs_simple_show, .data = hw_engines},
> 	{"force_reset", .show = xe_gt_debugfs_simple_show, .data = force_reset},
> 	{"force_reset_sync", .show = xe_gt_debugfs_simple_show, .data = force_reset_sync},
> 	{"sa_info", .show = xe_gt_debugfs_simple_show, .data = sa_info},
> 	{"topology", .show = xe_gt_debugfs_simple_show, .data = topology},
>-	{"steering", .show = xe_gt_debugfs_simple_show, .data = steering},
> 	{"ggtt", .show = xe_gt_debugfs_simple_show, .data = ggtt},
>-	{"powergate_info", .show = xe_gt_debugfs_simple_show, .data = powergate_info},
> 	{"register-save-restore", .show = xe_gt_debugfs_simple_show, .data = register_save_restore},
> 	{"workarounds", .show = xe_gt_debugfs_simple_show, .data = workarounds},
> 	{"tunings", .show = xe_gt_debugfs_simple_show, .data = tunings},
>-	{"pat", .show = xe_gt_debugfs_simple_show, .data = pat},
>-	{"mocs", .show = xe_gt_debugfs_simple_show, .data = mocs},
> 	{"default_lrc_rcs", .show = xe_gt_debugfs_simple_show, .data = rcs_default_lrc},
> 	{"default_lrc_ccs", .show = xe_gt_debugfs_simple_show, .data = ccs_default_lrc},
> 	{"default_lrc_bcs", .show = xe_gt_debugfs_simple_show, .data = bcs_default_lrc},
>@@ -322,6 +317,14 @@ static const struct drm_info_list debugfs_list[] = {
> 	{"hwconfig", .show = xe_gt_debugfs_simple_show, .data = hwconfig},
> };
>
>+static const struct drm_info_list privileged_list[] = {

"privileged" may not be a good word? How are devs supposed to know
what is or is not available on VF and that "privileged" here has nothing
to do with userspace access but rahter it's about pf/native only things.

/*
  * <document here something to hint developers where to add new files>
  */
static const struct drm_info_list vf_safe_debugfs_list[] = {
};

static const struct drm_info_list pf_only_debugfs_list[] = {
};

Another possible idea: would it make sense to add a flag in
drm.driver_features to note if the driver if pf/vf? That way we may
simplify other places and then here we could just do:

	{ {"steering", .show = xe_gt_debugfs_simple_show, .data = steering,
	   .driver_features = DRIVER_SRIOV_PF },
	   ...
	}

instead of splitting the array.

pass by comment since I was involved in other threads related to default
context in PTL... Are these default_lrc_* accurate from the VF point of
view? Are they different from the ones for PF?

Lucas De Marchi

>+	{"hw_engines", .show = xe_gt_debugfs_simple_show, .data = hw_engines},
>+	{"mocs", .show = xe_gt_debugfs_simple_show, .data = mocs},
>+	{"pat", .show = xe_gt_debugfs_simple_show, .data = pat},
>+	{"powergate_info", .show = xe_gt_debugfs_simple_show, .data = powergate_info},
>+	{"steering", .show = xe_gt_debugfs_simple_show, .data = steering},
>+};
>+
> void xe_gt_debugfs_register(struct xe_gt *gt)
> {
> 	struct xe_device *xe = gt_to_xe(gt);
>@@ -349,6 +352,11 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
> 				 ARRAY_SIZE(debugfs_list),
> 				 root, minor);
>
>+	if (!IS_SRIOV_VF(xe))
>+		drm_debugfs_create_files(privileged_list,
>+					 ARRAY_SIZE(privileged_list),
>+					 root, minor);
>+
> 	xe_uc_debugfs_register(&gt->uc, root);
>
> 	if (IS_SRIOV_PF(xe))
>-- 
>2.47.1
>
