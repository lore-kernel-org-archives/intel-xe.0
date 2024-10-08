Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68474CEFC34
	for <intel-xe@archiver.kernel.org>; Tue,  8 Oct 2024 17:13:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3271110E1BA;
	Tue,  8 Oct 2024 17:13:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JOZHzlrF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8AD510E1BA
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Oct 2024 17:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728407620; x=1759943620;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=h+ujtsjnI4aWK9oai891T0icYPNoiRuLJY65FUKI2ZQ=;
 b=JOZHzlrFTx3S7mXjNN2lzEfhT8PtgO3t3egiQlsxjSbUKK5TGnyKASQg
 oCEqgGkpLCnGZV0OR9yf2qgo6H0I5icJV3Lcb7M62LU2fbS5r1PAHyw1F
 LUKakDCtoW2psOGVuAXeuL25WMa9l6xLoqbOBwxXdxH9Yttrk6iiLTer/
 Ti52TIgJ8L9nr2/K/++/OOam5xpzc9ETSxak3WmGmUohdHnxDXZ2DGN9c
 vCfr3XuVek3a1iR18Q16C037B6QUjSnvaIKVuPGHITbzKNpWpAoi8kMIB
 P9m5hK6fHJF9EH6lE5Qqwuwma442TcQ0sMAWDBQ+HlRkl2sk6VU0By4JV g==;
X-CSE-ConnectionGUID: fj/sFYWQSaiMC9qE+cJlFA==
X-CSE-MsgGUID: RfDbv/GmQnC/qRkVp0fKXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="27505990"
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; d="scan'208";a="27505990"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2024 10:13:40 -0700
X-CSE-ConnectionGUID: 4DrFucngStWk2lG0xaR7JQ==
X-CSE-MsgGUID: Fy0IMTRYRMq4ZhHtYe+FCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; d="scan'208";a="76023279"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Oct 2024 10:13:39 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 8 Oct 2024 10:13:38 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 8 Oct 2024 10:13:38 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 8 Oct 2024 10:13:38 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 8 Oct 2024 10:13:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BrsRdvuO1Ct6x71C28KvwVGLx+at+/Rs+ULML79bCeRyu6TGiM9LgdPPzkzmhKgHLQVCLCPAFPPn3yU93/NNnapa4ohbPm2GfAOB+Zk+ntWgiZeUY4VGxwfzp2EDIBaEfzl5SjGYoAdtGhpzfRn1DC522TLGWkAMGsLf6lHxptkiNNEn3Jl+URuswyj2srXI7HNhqIdZzfOKOYaBnOS4ncnOfRGL9UZY33RqZNh+87XndeegTAlo78bm5H/rOTkxfKrU5q8HCqdPJoKUZLV2D3jW3YtNqPAz7LnimY3Ahjo0+1uX/zl8pUzdou0lucEvkXPpKZJTS8LSnMmXXh47Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6PIUXIjPgrNT2hbdTFQs3kbmEG0bybc2vn23fOr07SE=;
 b=XoHHhH0yaFqRAipLk4o53Ty5b+EmB14MUn/ec5FEyUL2xf8M0yH5V8XNuXT5eQ9k6xQTPX+8oN8WhhTKCCwj8PeuSr13BZCRnKrx+VRhiPQgkvDExUjd1A3psXcLk144OgzGpHnITiB8JW1uTgy2uWKaIy42K3MKYRnptM0xfd6LxLclEwR2bYU1Vj6fFMq+EtyjHMLXXbVuAYwNNpf77NFg/z1wRQM2UHv9Bbe2n4aa5QMkRXuaULKF2pLgLlg2rTl/+9QlxuGzDY2cjlSTabw61MhuQlHrB/vFmAlrWbNaeREOGjS0ZUo28EsPnQoBNKWcGAaTGj2s2mKLMXJARA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BL1PR11MB5288.namprd11.prod.outlook.com (2603:10b6:208:316::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16; Tue, 8 Oct
 2024 17:13:35 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8005.024; Tue, 8 Oct 2024
 17:13:35 +0000
Date: Tue, 8 Oct 2024 17:13:24 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Nirmoy Das <nirmoy.das@intel.com>
Subject: Re: [PATCH 1/2] drm/xe: fix unbalanced rpm put() with fence_fini()
Message-ID: <ZwVoNDSywONjEye0@DUT025-TGLU.fm.intel.com>
References: <20241008104723.98300-3-matthew.auld@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241008104723.98300-3-matthew.auld@intel.com>
X-ClientProxiedBy: SJ0PR05CA0182.namprd05.prod.outlook.com
 (2603:10b6:a03:330::7) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BL1PR11MB5288:EE_
X-MS-Office365-Filtering-Correlation-Id: 9afcf2a4-6a83-41a1-e247-08dce7bc8ac4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+s3WoNqpNDqCnrF9OC3wBq0XSPpqPL2AUZdKQ/SZ0nsxlwRXt+gEZvHnCGK7?=
 =?us-ascii?Q?tr6etanf4bU1GP5aJxd4Qi/OPdkbpuXWCQji7FSq+DLMK1+zCXdf8rdNhCcl?=
 =?us-ascii?Q?N7QJqOi9IRjRPTBFt9iiK+W8hteGUtMDHX7eh9RAwtqlfwz0WN31kGctr2FD?=
 =?us-ascii?Q?FKEPWvIOiqh5UKiaIUkdvfyxWcyjqvk9riAZ/XZKWi7XaptFRfoI/K46Jggk?=
 =?us-ascii?Q?SnwNgNkEpTH0a96w7Y/BBifwGQWM6brMwkyRLUUDZIKxGp8By97PAslW79xp?=
 =?us-ascii?Q?gr+N+QtTEZoMBhgLA9x5wEhphYApa9pH0VsHn6421g+jBQhraR4I0Ky9w7n3?=
 =?us-ascii?Q?ej4lVn0djvHPaVqPM+u9hvq9TmL63cQvrVDhMJZ6ER0ypubbAizY1KBFyyHH?=
 =?us-ascii?Q?wAn/oCv4u/x67Skiebe1dlYFrxR1lHgNH+X4Mf/0fjXD6jPDssThD4MO1ay6?=
 =?us-ascii?Q?P7yE0R59NDvyVHuDxvByoCPqbIZVpbJVVYY7/6n+kgYlWGJ0yQSnqPGLfvVv?=
 =?us-ascii?Q?V2FGqW0LIKRol+neFHCisqsxVmg6+m3G/2wK7+ru1ud/YKUNXBBIe6Y5sA6Z?=
 =?us-ascii?Q?REuQ/QTNPCtXJbxmC3Os7+3IFqoXTb0hka4jXMDLiT6kxFa4/2KTgrOO1nia?=
 =?us-ascii?Q?jzzO46HJ1h8kDc/6cLh6HcbZsTI0J4QOiH5BoleavN+hqNHHMZQuayb+XuHs?=
 =?us-ascii?Q?xQ7LY30EYt4cDvvEZNjznOdbB0zl3qpRDa/hWWdr1nhKCemuMwqjfmQxwKcp?=
 =?us-ascii?Q?nAaK6vYA5PXSXKQNEIJCOyEdkk0ENOHMqkOS3GYmhErKFoLp6fHEKwM34nwS?=
 =?us-ascii?Q?/TDRzX6UzZ4j0XS0tC7RvTgGSGJjXh1z5a/eBHcZW2iP0Dz4N2JJ7z0Prx9+?=
 =?us-ascii?Q?jYqYsE4wI8rUYx20xagQy2Gur2RHY5+I+WyxCRFzxPP7tZo2CPX0Vg3slGan?=
 =?us-ascii?Q?MkHSbmGvDfUILVhAWCaGQfSGKicE6sr5CH0q/+rQN5L03q9QpoofL9reavXg?=
 =?us-ascii?Q?cQySWqOP+vsiB0LY3PGah5HfmSqTCEtnce/ToMNF9qjUnxH4TOxXjDMOZAoQ?=
 =?us-ascii?Q?DLEnAuJVaZqORKOUuev8d41WZ9q72OW1g+gQKp4Mis33YtG/UGiybtbKKAo0?=
 =?us-ascii?Q?AO+kFf6+QKZmNGZZeJd3sJ6DN7nPOEdeBaNUI4sHfkD42FynHGeVUw/c/XNK?=
 =?us-ascii?Q?nOGzIPEMESjOg+Z1EZhzF+QxT5Y/cuUy8EhpnupR2HZQaOk+mUkT3t/bwg8T?=
 =?us-ascii?Q?sOdP2fFYsVxtVTVmZqZ9yEmtVfWJ+IqShqE5UkInSg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1JQ9GjI+cWSXkYUdyG0Q+1WUSnvn+4Ug9CklmSw6lqI6khoY0hVw8DrUxSK4?=
 =?us-ascii?Q?9KYimpHjjTjZ1c1R2yQlZZae5RtxcGI5urQYoAEbxMcfJpBjyEWeYpf0zDl1?=
 =?us-ascii?Q?Rv9GCytlPjSHgH5ExnRqB52w/N85aAtqmDKdWiA6gNtt21fcNu9i9g6xD5Bj?=
 =?us-ascii?Q?8cU2mWyake7jDA0qLrGXgzfrdnUG7Pb9VbAbaLBEDxUpZvEOeaoh1yGFG6zJ?=
 =?us-ascii?Q?bZWAS/klEiSeY3cfUF0IEM/rQwR0syZLccjsL/RpcBu0/hgW+naLXEsvM+1o?=
 =?us-ascii?Q?euMg3Pufm01zjl1jM2z0VLVTTIqsRvKVE+/p3EDBg6hh1thw0aljHgtuCkJD?=
 =?us-ascii?Q?ae9CSZD7HWeJnEpdjL0SNDF6jcK9F2VVNdSmyTu6Q9kGT/hHxv24Bs98sBcm?=
 =?us-ascii?Q?+ukR7yBwtk3+l4j6DgsIZXSPH5eXOL/knBQIyVCIrb3MO8popVJSU1t2mRd6?=
 =?us-ascii?Q?w7/iW6XcYS/8VnSD1y5BfSJJabB4ctj4YcUhh/dtsRID8wc53/4X1UYMGv/v?=
 =?us-ascii?Q?492VYuXhNnQhQGsn/rOoMMdWup/vMhC75i0cTXqUNAU09U+W1BOVvuJmWwX4?=
 =?us-ascii?Q?Gj/R58haTQvV0Y/lAUdNKWeMVg+IVPnyn+CArasW0t5f7WhzS7w1BTw8L6xC?=
 =?us-ascii?Q?MZWMmb+RnFxPm34GIsiW1dnce3cNgzid9VmthNn++0W0Yve8Y/teKZHmOBDe?=
 =?us-ascii?Q?+5i+j5LKuO0T+C3vvy95fGaNcatUAFC2qN0J6NH/jrl/DsRKbBwsNSzv/E3f?=
 =?us-ascii?Q?zyS5n1dZv78w8HuKpKTYJAhtWnxT64ts6hhb69GIxkFqtwVIJQUtPnqkLacf?=
 =?us-ascii?Q?7/ZVRcgVSIiKEeXhLNOUAsHKkH4MnN+CtzUwotPmuEh4lfyuYYqsuOjY54SO?=
 =?us-ascii?Q?AoWl/DnM0MQV/UhsHajQca2r2wLyhGj49mhk4u4HsBK/mUizyWImrF9zKXuk?=
 =?us-ascii?Q?c1qPxB/1NzrvAaQaIUVxDEMTMCdCZ1lkSDI3+FfSvgjr7RD8X6xo2f/ikp2n?=
 =?us-ascii?Q?IwqMH8r1gfutAwdvnQ8KsrcIoohRDRSTRKmUfIFj1p4zOxQMhjRWCGwXLEup?=
 =?us-ascii?Q?lwJyPw3s1mVKqzfSzMaWrOYG6vJ8kvjn0Xj4d5YIFa8fWkGsXAtO6fSq/ar1?=
 =?us-ascii?Q?viK3wz0pFo+ltupE1qX/XfmyKhb0uLI7QgqqVrCkxzmsY2/WduMJs5rfvGp2?=
 =?us-ascii?Q?SoIxlpZSweSHToOXUPETbBrKMYTspb++sIhBqNHkxa+Dy4lOiQkwy7/8phAb?=
 =?us-ascii?Q?7+bGGddBfcCbp585YTE+Sy6cUh/rPGkcze9JG0t9kGyCjvJl6okJW0NNhUtn?=
 =?us-ascii?Q?+e9gr5flq27bTjQlmqIDMSWmEJXk6TUg/+vB7gLIUjgX87G4RXiu3ZoSzfi+?=
 =?us-ascii?Q?xFQh1L96mjr2euBNym87IS1jSA6DzN3z98EpLjrwEuIY02hr42j1HOHVwCU/?=
 =?us-ascii?Q?o9zvVrwiN1K74NkgIW1hfc3xkZoPZXAeq/F+Fi3Aa3m46608nRge+ult0Vga?=
 =?us-ascii?Q?Yvj321MKb3ay/npv2A0Zw2T49SCwhYrO4CMtgQr3q+54KAJ97ic3U1jXYDzx?=
 =?us-ascii?Q?Irg6eXXj35jfsb9wUSlsB7g/kfCYuVELges0WhwTVTBhTl6JphkJNaDt2USC?=
 =?us-ascii?Q?cw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9afcf2a4-6a83-41a1-e247-08dce7bc8ac4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 17:13:35.1521 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ebPCTlDEmdYSQri/HGop43l1oVBZ1BhpqlqLjXxfQM+9HQP6hgbc9w2SnaZZZYExFHAEUxgJ9kNNi4y7NhXD/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5288
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

On Tue, Oct 08, 2024 at 11:47:24AM +0100, Matthew Auld wrote:
> Currently we can call fence_fini() twice if something goes wrong when
> sending the GuC CT for the tlb request, since we signal the fence and
> return an error, leading to the caller also calling fini() on the error
> path in the case of stack version of the flow, which leads to an extra
> rpm put() which might later cause device to enter suspend when it
> shouldn't. It looks like we can just drop the fini() call since the
> fence signaller side will already call this for us.
> 
> There are known mysterious splats with device going to sleep even with
> an rpm ref, and this could be one candidate.
> 
> Fixes: 0a382f9bc5dc ("drm/xe: Hold a PM ref when GT TLB invalidations are inflight")
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 26 ++++++++-------------
>  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h |  1 -
>  drivers/gpu/drm/xe/xe_vm.c                  |  8 ++-----
>  3 files changed, 12 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> index 98616de0c5bb..3eca8d680533 100644
> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> @@ -37,6 +37,12 @@ static long tlb_timeout_jiffies(struct xe_gt *gt)
>  	return hw_tlb_timeout + 2 * delay;
>  }
>  
> +static void xe_gt_tlb_invalidation_fence_fini(struct xe_gt_tlb_invalidation_fence *fence)
> +{

To catch a double call of this:

if (WARN_ON_ONCE(!fence->gt))
	return;

Everything else LGTM. With that:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> +	xe_pm_runtime_put(gt_to_xe(fence->gt));
> +	fence->gt = NULL; /* fini() should be called once */
> +}
> +
>  static void
>  __invalidation_fence_signal(struct xe_device *xe, struct xe_gt_tlb_invalidation_fence *fence)
>  {
> @@ -204,7 +210,7 @@ static int send_tlb_invalidation(struct xe_guc *guc,
>  						   tlb_timeout_jiffies(gt));
>  		}
>  		spin_unlock_irq(&gt->tlb_invalidation.pending_lock);
> -	} else if (ret < 0) {
> +	} else {
>  		__invalidation_fence_signal(xe, fence);
>  	}
>  	if (!ret) {
> @@ -267,10 +273,8 @@ int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt)
>  
>  		xe_gt_tlb_invalidation_fence_init(gt, &fence, true);
>  		ret = xe_gt_tlb_invalidation_guc(gt, &fence);
> -		if (ret < 0) {
> -			xe_gt_tlb_invalidation_fence_fini(&fence);
> +		if (ret)
>  			return ret;
> -		}
>  
>  		xe_gt_tlb_invalidation_fence_wait(&fence);
>  	} else if (xe_device_uc_enabled(xe) && !xe_device_wedged(xe)) {
> @@ -498,7 +502,8 @@ static const struct dma_fence_ops invalidation_fence_ops = {
>   * @stack: fence is stack variable
>   *
>   * Initialize TLB invalidation fence for use. xe_gt_tlb_invalidation_fence_fini
> - * must be called if fence is not signaled.
> + * will be automatically called when fence is signalled (all fences must signal),
> + * even on error.
>   */
>  void xe_gt_tlb_invalidation_fence_init(struct xe_gt *gt,
>  				       struct xe_gt_tlb_invalidation_fence *fence,
> @@ -518,14 +523,3 @@ void xe_gt_tlb_invalidation_fence_init(struct xe_gt *gt,
>  		dma_fence_get(&fence->base);
>  	fence->gt = gt;
>  }
> -
> -/**
> - * xe_gt_tlb_invalidation_fence_fini - Finalize TLB invalidation fence
> - * @fence: TLB invalidation fence to finalize
> - *
> - * Drop PM ref which fence took durinig init.
> - */
> -void xe_gt_tlb_invalidation_fence_fini(struct xe_gt_tlb_invalidation_fence *fence)
> -{
> -	xe_pm_runtime_put(gt_to_xe(fence->gt));
> -}
> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
> index a84065fa324c..f430d5797af7 100644
> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
> @@ -28,7 +28,6 @@ int xe_guc_tlb_invalidation_done_handler(struct xe_guc *guc, u32 *msg, u32 len);
>  void xe_gt_tlb_invalidation_fence_init(struct xe_gt *gt,
>  				       struct xe_gt_tlb_invalidation_fence *fence,
>  				       bool stack);
> -void xe_gt_tlb_invalidation_fence_fini(struct xe_gt_tlb_invalidation_fence *fence);
>  
>  static inline void
>  xe_gt_tlb_invalidation_fence_wait(struct xe_gt_tlb_invalidation_fence *fence)
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index ce9dca4d4e87..c99380271de6 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3199,10 +3199,8 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
>  
>  			ret = xe_gt_tlb_invalidation_vma(tile->primary_gt,
>  							 &fence[fence_id], vma);
> -			if (ret < 0) {
> -				xe_gt_tlb_invalidation_fence_fini(&fence[fence_id]);
> +			if (ret)
>  				goto wait;
> -			}
>  			++fence_id;
>  
>  			if (!tile->media_gt)
> @@ -3214,10 +3212,8 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
>  
>  			ret = xe_gt_tlb_invalidation_vma(tile->media_gt,
>  							 &fence[fence_id], vma);
> -			if (ret < 0) {
> -				xe_gt_tlb_invalidation_fence_fini(&fence[fence_id]);
> +			if (ret)
>  				goto wait;
> -			}
>  			++fence_id;
>  		}
>  	}
> -- 
> 2.46.2
> 
