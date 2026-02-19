Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 604B8E9A02C
	for <intel-xe@archiver.kernel.org>; Thu, 19 Feb 2026 03:01:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1048010E19D;
	Thu, 19 Feb 2026 03:01:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L2NQbvBx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7883D10E19D
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Feb 2026 03:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771470058; x=1803006058;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=8LyIXdx8tSnRemAZJyhQ0Jp5RQ2NsOWadrOKOyCD4CI=;
 b=L2NQbvBxVw6AAyycibBDrlZh3dzyw95YqLIBuJYzASzZRXtIvu/33AvY
 ujp4TowlKNbS2+amoXRK8CeaYlICIquDAQ7ohiN6kJPjZ55XfYG2rLZcS
 bpqAyDPYYHInsxMjhK+5X15R70qhwbxnDSIuAnFOKZlwfN9qE3bXQiepn
 Qdi3urts9k/FrYZNMo1WpXvol/9HVGuhjMO1hNC2iWDdSA/Phacb2bz7v
 5+gFCm64tpvvBhxQRM2QRY6/GL02Alq4YgTehmcx9neuQgBy5msgoSz1w
 RtB0nUIdFWrWiF53q8+nq6mJ69bed1LrHYXgMQNLlNdJiF/J6is3eggCc Q==;
X-CSE-ConnectionGUID: soNb35Z1Q5CWMaEl4P0Scw==
X-CSE-MsgGUID: kI60m+TrRNC6AUSaxfpcSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="72732362"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="72732362"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 19:00:58 -0800
X-CSE-ConnectionGUID: D4CcGDgaRdmPfXdAJIe/dw==
X-CSE-MsgGUID: HJ4UjWj/Qg+gE8AU7TjmTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="213026222"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 19:00:58 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 18 Feb 2026 19:00:57 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 18 Feb 2026 19:00:57 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.36) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 18 Feb 2026 19:00:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f05iY45JZa28B8in5zjFwS5LPPB625XKFJhYwR5p98RQ+I5+jDPK4U0N4GZ/UyahSWG9gukTIb1uF217FtdaenFZID4oX42ev2Yw++lZ/Ph6/sIzVTQ201wpvrkoDjjmmCwDgXor+aSgchCmSg/WDVCvAfvSfouBqB6e/5CihHsQxVrmEDEbp/EmLTIVyZ+Vk8OxK0eG105eA73Z2w5HitzMofww0P7gsobjW27tepkUT5GjbuzVTqT8yA53f/2SDsNLJk+RMKsgNwOyAChKW9dSc8smKaOtrGCbcgsA4kWHHy8dttTGKlAuenhwyfGalsMyZczwLAqeGCWY+28y4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cBJzEdGmzcZA2rnSq6Wu1XPWP6uUKiPffNT2HEamq2U=;
 b=an/ENVhwRM0qPO6K7F4ZLTmB4FlTvUx1inzs7dC7FG8ZBIfUfozraAZVL6BzgiXONNnvD1J0TwvH+AqjzDXKbfWofaw+9jzezC/E0RdpLhZy3VQLw9pneWZJcooGP7z/kzuCmKeJ5bYTBTcRg0pIzD/HqNVrM6j5MSOV1iTv9L2obFuhfo3rdJ09lLQi9BQ5NvoRD3eNIt+xToiNYQU5iobpXoTu1ntgbwMUdSArlW+nhKED+EbD8ZL7N44eMOYGg00JjUeu2fhqQVXbOuwmf7wyWgD9wiDR6xVVfjQd+nzzIMysvhFooF0E8RWnfHdJGuU5fwt6z0HfA6DZROMRnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA4PR11MB8963.namprd11.prod.outlook.com (2603:10b6:208:55c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Thu, 19 Feb
 2026 03:00:53 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 03:00:53 +0000
Date: Wed, 18 Feb 2026 19:00:50 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Shuicheng Lin <shuicheng.lin@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/sync: Fix user fence leak on alloc failure
Message-ID: <aZZ84pd1PREju2n5@lstrano-desk.jf.intel.com>
References: <20260219014216.2893391-2-shuicheng.lin@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260219014216.2893391-2-shuicheng.lin@intel.com>
X-ClientProxiedBy: MW4PR03CA0097.namprd03.prod.outlook.com
 (2603:10b6:303:b7::12) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA4PR11MB8963:EE_
X-MS-Office365-Filtering-Correlation-Id: a6697de6-0a84-468a-ff8d-08de6f631807
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MtJypfoCFkCHg7x+vDVfjGcexZAOOW/DeBOSkIPPCXptlod3N3FrBfMny7O8?=
 =?us-ascii?Q?j1f6bA8DvT5mLGAjvppXzi1CxvLPLHPPpfAtgFcl4qdhE5Nma4qVVGhFUm2A?=
 =?us-ascii?Q?5wmHRzIy+CjaI59RH9x5KvjbLb8PvMpkA80nIfzSnWrlemkQ3vc74m1Opy4U?=
 =?us-ascii?Q?JJC/AIOVw5ovh2CgyYhTrkBwj5ATE7Z/7KO9jYyn0ly0SkxM8oK93/z9c7FW?=
 =?us-ascii?Q?j38BiwSxnqcJ7aFrsGWQmJRp0pMLCq560yaAF2YLW+fRjNnfrrf10bsU/uaL?=
 =?us-ascii?Q?sq2+Vhebz5k3uY80V6bT6XaEof2X6e+ut1xAFCcrrlRcOsHfrUv4pv2AuVfY?=
 =?us-ascii?Q?Vpm7AyUJ7R1WOSEpLrdxCLbY/MieCJmk2M4DMJKyRySsdt+GfsIWPKtUNFzJ?=
 =?us-ascii?Q?OxTc/eLraf1Rs1ZQgrcHcK4/XB/9g53tdU7rRgtedn1LTmzY9U+7wZydGNWx?=
 =?us-ascii?Q?gZ3UFV+t3+gJoyvBYerUTY0IyFi3HkH00s44FBwvaQHms5JdoInMUPm+hOIa?=
 =?us-ascii?Q?IXJkDPNySflsvHi1eR7Hb8mCjp+Gw4YARlAQniLYYGqmzo9+lVqEfaYI9ZhJ?=
 =?us-ascii?Q?OoItOag9ueOQbph3Nu7UWAJZURXZf/fSHyM9bUSGCQrM9OecLlPA7wb+QwDK?=
 =?us-ascii?Q?S74ul3DWlBsdyQ43yPfmtEaKjBGNSUpu2WdEogcMUuI3C9AurK/Vtx5JsoOc?=
 =?us-ascii?Q?bJTrblikJy/MEgVbXEvAMGzph8jrP2NPtC2lJfQ3KWLgfKJA+5VA1bcPVyjk?=
 =?us-ascii?Q?fHobr+FjsJgREXhYwZ+uSI1zUlhMjPlWCd5mxnO/KNrH86xhPJ09LDce8QwD?=
 =?us-ascii?Q?43aWC0H/8Qac5y3wjwLaE0nhC3tawO7Y1a0evdiFHFkmyaH5DMWSUZc2XWgG?=
 =?us-ascii?Q?WHb/FkRCETux+EfjM9/VQXACMnjnJe9WflOFmw0G9ZpGiWwbn4Qd0gaoT3Re?=
 =?us-ascii?Q?mO89aajkH9NBnm7vALfaa2socV02Ge6hyB44TrYCN3JHJJSNveuzDUCw2D/4?=
 =?us-ascii?Q?fUQJ8fFMdW4X1+I0YbhxKbdbN5H4/v846B/5lGNpeLOQiXMe0qmzcqaoGkFa?=
 =?us-ascii?Q?Ye3T0LVRO/5Ut5EgX2/7/boePwtk97s180iSCSbs6Elf54T3Gm3cTF+7mrn9?=
 =?us-ascii?Q?+TbZDN8xRmlE+3ZF6SfDWb6or7ut6Ik1nllfXPKKuWWUy4jJDQ2pV80bUWed?=
 =?us-ascii?Q?eWaHzxAT54hnWYLF0WfTrXE4ittunmMhsQ9KW+6lEEQTtcEdkqQzhupuuvZw?=
 =?us-ascii?Q?l4Cf7JUPgJljzvKFDWBPKwHx+doyTs2cfp8f/6O/Qw0OI7Qa4OL8I6DRHH+F?=
 =?us-ascii?Q?19Su2ofKfgNMAdWiuyEZ3PjSTnrKfYQQ3mJS9LdrDAt72+DTrfi6H+NrWmBn?=
 =?us-ascii?Q?TYd6yV1mjOXfCXH24LI8Ghq1daKUbRVESd25okAzGDo7e/biD7zmnjrq3LMP?=
 =?us-ascii?Q?sx1Azse+254ONbW4+lf7TL5J+MP07dsHu18GjdN/3KxU6rmwFC2q2lQX3a2C?=
 =?us-ascii?Q?6ZkcPJ8229XR25C4GIkeht1fCKvMfXmQO3rDZxxTxTY33xo/QXkBsj1pGrJk?=
 =?us-ascii?Q?cARFDjVxqC0jsBbsxVQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?89x0fc+AdgR/20y9s+nXQArRKZjUKjkQGqJMp+nYBdrA7TVhKZJQ0DqKuMiJ?=
 =?us-ascii?Q?T5EWPFFYLmVdbfKYRUMCiRSU/NIRslgJcG2HjiVt4+4Doe+GuMgu3noN06IA?=
 =?us-ascii?Q?bmUEXdoEBVP2N9OOjJZCK6fD0YcJuznMaEKXsxpHL4AyGFNrRYmm51SvcA6n?=
 =?us-ascii?Q?rE04/h6pTHesitlc8thzpDjYLj9xuCipJEum1js1ufivR4uzQ1kcLoDs91f+?=
 =?us-ascii?Q?HLSZ5Rv6rBZ0j+8pZFbgm7dgRACExQVrwEnyXqdBXtvDk20v/arrsiAk2k21?=
 =?us-ascii?Q?WQ7WcyizVoD9Oev17poG0yxOMvEMnZxduFlMbr8cRK9q7U2y7YrwnXA/Cjc3?=
 =?us-ascii?Q?jouu4Z0DXDUWHoIKiAGyXSb7K841No24tmXh5GuPi+7b6duhe/RVk4FYNzBX?=
 =?us-ascii?Q?VXvCxxAoxIJuMnCRVX+XbEqRMte4OXEMGbaIsvgezAYr/Vozmv9Y7W0eXku/?=
 =?us-ascii?Q?WvJuimns2H1eP8OqaqS6iSgsVgqE0nkNjxO7Ki6B7mVsXnfiOzBY1gMyjFrj?=
 =?us-ascii?Q?Oo2TFomshi7Jc+vPnc9KY3kENko2dyffMvqDDs8lH2ryUeHDS5UqVMmcJeQZ?=
 =?us-ascii?Q?i10yMdFF+KVgUi6gy2fPrlQJHTfro0SzeB2nnN0fsY3SU1fHuPc2YihVdYod?=
 =?us-ascii?Q?OhIqonjxIBRRb8Et75L6naPMvbFaxNcoI2CfhHuRuTUpWQw2UpsfOJkOonCO?=
 =?us-ascii?Q?kGD4+L6awPIc3F+oRxfxrBwF8N7ug07tHZoeAAk58nxHCArdQuouu/EAgvBj?=
 =?us-ascii?Q?hQLOUyky6MdTCC5HL41DiNG1sxMJJS72gBcvtyZ40POyHD1hJJLAppFDJ15a?=
 =?us-ascii?Q?/W2sL3zR5K28Loig+KCHFGVa9LIvMbuj8aqPjR1Xuzj5kipjK03lCzDONwL1?=
 =?us-ascii?Q?A5sxGyFZeFiQAMxoQMJbXMBwNzRuSDtEBqhOwDXpccoeBmDJ56w1/KIOjoYF?=
 =?us-ascii?Q?9ZJFa2cGvlJIL5bgpaCR+oK3l+f+U89clJzwV6HZGs9QuF7Xtm7InEPk8ybK?=
 =?us-ascii?Q?xpHtzyAAcjxXUCJzSQy1Jri7KPjUobAUaZDlVif671rVZnk9scfI6UAdH4YV?=
 =?us-ascii?Q?ddIHJI924rnIFSt/mmucI+Au0vD+fW8joBUDa/oNpJi4rw97uBmpH1cV1TsT?=
 =?us-ascii?Q?7E9CqLt0ZRyGFga+XPqmazgC7DrW/5sfEzLiPlfoyhnXusbghI8lGtv23axS?=
 =?us-ascii?Q?LYqbLcEiICFTXk7viZIir9IlCtH9V1CSlG8v7rXaKmxjn/dnQxq2wfh5n3Ys?=
 =?us-ascii?Q?b6YG2YZyNHxBcg11UyOml0I+hYUHN/kjP3QrnfhFRd+RO0rX2CmTct6XQO02?=
 =?us-ascii?Q?ATjVrFOWxyMCDxi4yjmB/Byg+S3vKiT1raQGX+RPR38iWoI7L6gz+fVypvQk?=
 =?us-ascii?Q?tq+G78uAdrC3zzMkXYUsGYacABq9/NljXgiLukyrZpknLph3BiOJGBnpJAP5?=
 =?us-ascii?Q?TlbnlV/QQOf/zOLeF5bdgU1cohxVRTIYNLYFBfLm1ugG3jIguARzXY8ECAFp?=
 =?us-ascii?Q?jsKVKB3jyhM8MjGUkovgHNywWA5kAkdaYbGPnYdVOWxSxHpatSy+q9PFtrHi?=
 =?us-ascii?Q?cIIEg/eC3+vvUa4B116lW3IIu6KmmFz9dkCbJfwv94sJfPYvxZg1oYVKLO0G?=
 =?us-ascii?Q?x4zzsvy5OKQtCqD6bx46vr1/hd7a2i9yI3+kXIqvHuy2I28viu7OPuYPr4cn?=
 =?us-ascii?Q?quQx+MSnLkSQrNq+we1oqkA3hwtlssxer92wvbESIWOaq10q4xiNnwlZj9B/?=
 =?us-ascii?Q?gDSslB1/Kg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a6697de6-0a84-468a-ff8d-08de6f631807
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 03:00:53.0119 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JzJNAvohGYqNi4wHWzUzsRFIyLoIT+3FsSd19/qN+xvGXteD5tgw6mT7dcHrpBzAcG8Mrn462x4lHAG3TVyETA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB8963
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

On Thu, Feb 19, 2026 at 01:42:17AM +0000, Shuicheng Lin wrote:
> When dma_fence_chain_alloc() fails, properly release the user fence
> reference to prevent a memory leak.
> 
> The error cleanup path in callers (xe_exec.c, xe_oa.c, xe_vm.c) uses a
> while loop that cleans up syncs from index 0 to num_syncs-1. The failed
> sync at the current index num_syncs is not covered by this loop, so the
> local user_fence_put() is necessary to prevent a leak.
> Set sync->ufence = NULL after the user_fence_put() call to avoid if the
> caller later calls xe_sync_entry_cleanup() on the failed sync, it will
> trigger another user_fence_put() on the already-freed memory, causing
> a use-after-free bug.
> 
> Also remove extra whitespace in function call and comment.
> 
> Fixes: adda4e855ab6 ("drm/xe: Enforce correct user fence signaling order using")
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_sync.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
> index c8fdcdbd6ae7..c5f71067fcd2 100644
> --- a/drivers/gpu/drm/xe/xe_sync.c
> +++ b/drivers/gpu/drm/xe/xe_sync.c
> @@ -200,8 +200,11 @@ int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
>  			if (XE_IOCTL_DBG(xe, IS_ERR(sync->ufence)))
>  				return PTR_ERR(sync->ufence);
>  			sync->ufence_chain_fence = dma_fence_chain_alloc();
> -			if (!sync->ufence_chain_fence)
> +			if (!sync->ufence_chain_fence) {
> +				user_fence_put(sync->ufence);
> +				sync->ufence = NULL;
>  				return -ENOMEM;

So there are multiple problems in DRM_XE_SYNC_TYPE_SYNCOBJ,
DRM_XE_SYNC_TYPE_TIMELINE_SYNCOBJ case statements too. e.g., after
drm_syncobj_find is called, we can fail but the reference isn't dropped
to the syncobj.

With above, would it be better if the callers called
xe_sync_entry_cleanup on the current sync even if xe_sync_entry_parse
fails? Or another option is change xe_sync_entry_parse to call
xe_sync_entry_cleanup internally on failure points after any internl
state is setup?

> +			}
>  			sync->ufence_syncobj = ufence_syncobj;
>  		}
>  
> @@ -222,7 +225,7 @@ ALLOW_ERROR_INJECTION(xe_sync_entry_parse, ERRNO);
>  int xe_sync_entry_add_deps(struct xe_sync_entry *sync, struct xe_sched_job *job)
>  {
>  	if (sync->fence)
> -		return  drm_sched_job_add_dependency(&job->drm,
> +		return drm_sched_job_add_dependency(&job->drm,
>  						     dma_fence_get(sync->fence));
>  
>  	return 0;
> @@ -311,7 +314,7 @@ void xe_sync_entry_cleanup(struct xe_sync_entry *sync)
>   *
>   * Get a fence from syncs, exec queue, and VM. If syncs contain in-fences create
>   * and return a composite fence of all in-fences + last fence. If no in-fences
> - * return last fence on  input exec queue. Caller must drop reference to
> + * return last fence on input exec queue. Caller must drop reference to

Keep whitespace changes in a seperate patch please.

Matt

>   * returned fence.
>   *
>   * Return: fence on success, ERR_PTR(-ENOMEM) on failure
> -- 
> 2.50.1
> 
