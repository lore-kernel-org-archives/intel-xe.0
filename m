Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 810DFC54E60
	for <intel-xe@archiver.kernel.org>; Thu, 14 Mar 2024 17:37:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 331C710E106;
	Thu, 14 Mar 2024 17:37:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aHKWrLAv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B46910E106
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Mar 2024 17:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710437863; x=1741973863;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=MKmuu+MSEZi0L5jQbOP0dwv9PedTsq4++8zD6NtWQhw=;
 b=aHKWrLAvIwP5rtKmfKy2hX1oZh4N7+QLgCYcNJjDgPs8yoNZQCFZw3WM
 XKe4Ml7RixBHsSteNvuEfClBzfVaURcRtCUlMv5q/jlN5NZMHF38MfWLD
 YZcZvC82uYvgyZ+MHfyCj51QfEOn2NXKexc6JmtXdN7KX9MLdjrLU4TmN
 2SmAfYWQ3b4GMWceSjXIn998SqlrmRWN+rq4NmT/Uv1p7jk42Uf8Hc6EE
 40rIv/LnpS6A7f+v3JTkDnpLj6eOnukfoHqXf4eJwjmf8GhSFRDaPmdQw
 g7XRm659dg6BXyQq/zdKBYcNqwqOEsgmny1cEOoVS1HNrCkx44ADkNV6O w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="16673926"
X-IronPort-AV: E=Sophos;i="6.07,126,1708416000"; d="scan'208";a="16673926"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 10:34:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,126,1708416000"; d="scan'208";a="35492400"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Mar 2024 10:34:19 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 14 Mar 2024 10:34:18 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 14 Mar 2024 10:34:18 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 14 Mar 2024 10:34:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lHK+jkQVk1dzw22MoHP5/IiLVv0wt43mbt9V8B4EWhGXrxdZBm4FT/YXloc63Rukw1voKQeNZiGlE80ZwRTb9yuDF+U6E/7LQSHFdl/sivD+E8ooXo0heL8xos6c+sjIkm8yJCaFoLA9e3Z/Jrltl+1KkfTW297bS04keexwWXYuTo4g06HWesa/rc72tqtaR1jtxzVLQeOY5ewXyK+Io4lqfQZYbn57lfAF56yHsy4i0G4N/TPdw6Nn0A1LpduuB8Rn2Ki5+jE/JlkW9e8WrnSpcVvaiqrgKL99aiZSUk24ML3v5yY5Fxe99iDh6zlUBeYuA16DDlKaQsRHSxIDhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g0mcJvedyrj8JqPBA4duUq0AUgaZEozNcES5mfDfiHs=;
 b=DMnyqbcxZUB6is8Nw2d3eyiPXt/kGKjKFGNGSloD86HCbL5PpjlAzFbcwhma7kLj+4UHkj2jys9lXEEk5Jk9sDT/MWlMf4AZzxb24z5ridGngzbz0mOmzV+Gpkk8gGf2RgS/X3a6+Dx+0ZnyZeCDh4SPDz/9/QeqkIKjPWRT0DXR5l7xrSb1m8JCkcygs5chuysD3F/JmGg0v2z94DSsPOPGiDztmWJaLCQZddPH9T2l+7ylyZM4ZBEjyAulV2oU0nQhYyADcuC0qewv6SE3932sNMXKGB2MEQCf0yuNV8yvy44fcdSzwncBe18zIrnaxr9rXC1llhdJnUIJ4mX9aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH3PR11MB7673.namprd11.prod.outlook.com (2603:10b6:610:126::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.18; Thu, 14 Mar
 2024 17:34:16 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7386.017; Thu, 14 Mar 2024
 17:34:16 +0000
Date: Thu, 14 Mar 2024 17:33:21 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Oak Zeng <oak.zeng@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@intel.com>,
 <airlied@gmail.com>, <brian.welty@intel.com>,
 <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH 2/5] drm/xe: Helper to get memory region from tile
Message-ID: <ZfM04Taiqaz3MQbp@DUT025-TGLU.fm.intel.com>
References: <20240314033553.1379444-1-oak.zeng@intel.com>
 <20240314033553.1379444-3-oak.zeng@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240314033553.1379444-3-oak.zeng@intel.com>
X-ClientProxiedBy: SJ0PR13CA0174.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::29) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH3PR11MB7673:EE_
X-MS-Office365-Filtering-Correlation-Id: a4292910-ba5e-4664-9764-08dc444cf8b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EGr8YK9GLv5XulbINofNd+En0N4fGZiku9sItgKRO6ZcWOVyJibfaFr+6uFqAhxrIa2pVe1DbUVXnCE3n7e7f7hSBln4E8a+P0Tx1jifdF3Md9TftY5E7UHA/PnSO37jmuWw41dFbbryH2F/CcPkYJ1J+sRGL1vK7IVB4Iwtu/CXY7FNns4O2qjxj3UWUoYTieJGaOF5k8tpP5QeFCzotxhxmffljLRiW4xQxgnZa++PhdASMeZbeK1B6ydxvL7VH/XiIHw+SUUys+kcvDWpo+bsqy4mdQsGIURWrldR+5WpbEXcg7I01ffZpx92h05hc3mvkypCeG2vsChvVW87buTZVd1PEarwboUaZwX2xfmfaIqHkU5riE0mOv8rL2J93C42RW3qyrDerITAys6MSlPuqQcW8VHQy9aMVjRQdnbE1KXj1NO2xqJLveNAMoIyHyZACOq3FNOB2TjrahWkn/E9M2EQ81yDUEGofyDmVVEsYImG7vNslYhbvGahOLposVuHhrW6PbHx0Em8oJy8tbWRrPLmTe6GY2uxmG9j4Wq4SQMW6fZ7Mwfm8+JXMg+RDYHrU+be3FtPBWStkfnDopAtzBHDGhvKMohriKS6veU/VTZJ/26+t8rkV78gUnpGXIKVNPcmSHvcKEuKgewTxcQt3E71p65MxGoL4JPlJhM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tDpkSQZUD5EoTiTVSAGsro5Q8U4BOevjOBjoucOBxZYx9amCk8SMBGY9JLWh?=
 =?us-ascii?Q?wl9B510G6nNuiBt4lGQOD/9LFAKWmsWbaDo0QXM7wETOiYR7cGhmNF8JJmZl?=
 =?us-ascii?Q?sa+IqAzZ58xsveTNjw2WfWgjSzfdD8mqprWfiqABvO6LVClvm5vW6Mn9WIhZ?=
 =?us-ascii?Q?eFjXRKlw9m5WbG4m+Dabo3w+NhKpBe/bwSA58Ny204O+3phPt1wEbvswtfUn?=
 =?us-ascii?Q?Bo5C4Z+3gNQXYLjuuqonOk7WnllN7Gtlwk67/O3KTYMFsl3oUYC8YrF4vngu?=
 =?us-ascii?Q?sD4H1mZj2E/GKv3m/vSfATwCW4MvKO0Et/brFhm1rVKqQceHbqWuqGwhzVFJ?=
 =?us-ascii?Q?uYzXk/rwnis5HqeAzqchT4TFKtCs9j9+TEcsKo6wE7BKhd8UcpzD/iEeIztQ?=
 =?us-ascii?Q?lBvXyH17cGvf3tsCx/jGP6sDOZUk1XavNuwFJL5wqe9nwxWITCVOCf/kTm+v?=
 =?us-ascii?Q?VHLyTvFdMqq4PgMOU/TV1L3+99T8XTuRHOQv7VOakyNe1MUYDNiztgfq2PMk?=
 =?us-ascii?Q?0iA/c+mA38A1yursBY4IMK5Qf+MKDqh0sYdIaIXrMu8D3zN07PVKcktu0Tlq?=
 =?us-ascii?Q?iBifyCAFRDsQmN2mbRx+w9De6rzJvkfgzUhZC0csvVM2hdKVMOBcomTXB4pf?=
 =?us-ascii?Q?jevCUVEZPzqvHdA/PK4TEXJyPG3jvGM1Hq5NqH9GhdPrPN9CeK0VFalhYlVO?=
 =?us-ascii?Q?/x6efZWr1hF50j7m5G7As+ndddAhi3aiJXGjJkxzO3cbQQxVCpfKG0tAIeKL?=
 =?us-ascii?Q?gEGyNd34z/BQg+AK8a2PrdIYzN+3iz0CeNq+xQVgeGYQwFvO6ap5kHnAzNnX?=
 =?us-ascii?Q?+AHh3S1CmqkU8m6d4i862KktCVHInWh5FT8aWhUBzPNsWqQwArImR4J44Fxm?=
 =?us-ascii?Q?f9qFc/I+rH5bUCOLpskVwaaBObD0Z+0AwPnwcrApVJcHdmTyiNjs6Z252P6o?=
 =?us-ascii?Q?wirHUGq/Ie6VIkOTw0vguAVgjMTIklrofxf+TAxSygxKNIUf3Hu+QptK4fxA?=
 =?us-ascii?Q?U5HZtgnmHQfZBQAWUNiVnt/znAamta5whVUayX2fyfLdAS75mQMfaxp6ccUU?=
 =?us-ascii?Q?DEToXoveIGEFPnI8Nd8UWZ0aCa+xtNmhvF83IuBq5kr4Vy9BOyO0GbY+xXbr?=
 =?us-ascii?Q?4B/W5Qd5Efx83vWKuL5Q8ZrBEJub9OCxzB3GBjl2Q9gX3VSdIoEd1DpQQevW?=
 =?us-ascii?Q?Ky2x4CXHmqZaJBzbBJ1QSAs2xVs+GVwZcHGHSurSldORz+rx8WpQPvVrpHPt?=
 =?us-ascii?Q?QQUxgZaPsEQMH3TVGIQ++zsoU0nUoVhv28r5VSjxUnsNgYKn0yV44UId67xb?=
 =?us-ascii?Q?oBoZYXJLA7V34uLg0MA2tPDcC+497G0L1Wc1R68F311PLiFQzBjiNBWIjVHF?=
 =?us-ascii?Q?X+92/60b3YC5A2hiD8ts2w3mVbCBQZIxJssnZedDYerB8hFF2IZQG17bSMDd?=
 =?us-ascii?Q?ylov61XJ5Vb+YfEGH1RIjT2XW78QCYoZRPeE6e+d1Fp5SLSybBiMg7dNlnYq?=
 =?us-ascii?Q?4uAWpuS1+EAV4c3CtNYg6k9CLzEZsBbdbUTLaFWQxRgQ+/fFXpMMG7X5bswM?=
 =?us-ascii?Q?3ZKWT5iWwO1SQ3YRQAPP5unM0NW9naRcAnkZWKIWDRyVx/46uVxgqAkjHFkM?=
 =?us-ascii?Q?JQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a4292910-ba5e-4664-9764-08dc444cf8b0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2024 17:34:16.1477 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HTEc+SpOAMCIl1IqdY736HaSmRa+bIkAKzspfhIebyirymOmcZpx3KOdpmuDHlkoZkYmZE+BBjLHB0BsSVJ/fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7673
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

On Wed, Mar 13, 2024 at 11:35:50PM -0400, Oak Zeng wrote:
> Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device_types.h | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index f27c3bee8ce7..bbea40b57e84 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -571,4 +571,9 @@ struct xe_file {
>  	struct xe_drm_client *client;
>  };
>  
> +static inline struct xe_tile *mem_region_to_tile(struct xe_mem_region *mr)
> +{
> +	return container_of(mr, struct xe_tile, mem.vram);
> +}

Helper shouldn't be in *_types.h files, only struct def should be.

Also s/mem_region_to_tile/xe_mem_region_to_tile/

Matt

> +
>  #endif
> -- 
> 2.26.3
> 
