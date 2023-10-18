Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A574FC41513
	for <intel-xe@archiver.kernel.org>; Wed, 18 Oct 2023 16:10:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 694C510E16B;
	Wed, 18 Oct 2023 16:10:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E571010E16B
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Oct 2023 16:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697645420; x=1729181420;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=gczb6OyIn9KS5Ml1ogFMFH0XDRfVTCmaTXkzi+ojkzY=;
 b=A4haya0V6kRH9dygrkYI61lsU2rNotSvJ6x559PcjG/UGUoWPQ8cQC6Q
 xKVT8pU1FE1xIWYxdrhSkNn9sMv2FuhsuUCEwWP9zQH3Qvoo6yKVW+iI9
 Wopyg5N/JZ6oPIF1fjqGOo4gsx6ilJhPV7zuEOdWDGt5D+v5G2HciErrb
 qY9Ghu9TljwcHjq29iiq+8BBcwVWSzlM8rJjf5d/5XIth98r5i9YR2Lms
 rzXXWQ4+BuWwuQw+P0SI3KVILIn8To2hE77Q6NNg5Kp4zhUJzgn4MhnJO
 VP6K4Gpr5RIjGYYClx0W/B0CRkAVZ9Wais1PjEFUXLJBUZTt60WB3tBSX g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="366302137"
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200"; d="scan'208";a="366302137"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2023 09:07:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="756639139"
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200"; d="scan'208";a="756639139"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Oct 2023 09:07:44 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 18 Oct 2023 09:07:43 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 18 Oct 2023 09:07:43 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 18 Oct 2023 09:07:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=biC4PdOMsoac1pAaemu6Yim1rA2EsZAltGIZdb+5qcybki2TQS0QvNiZEd+VJrNGnuhJ3QhlFTpWATPlJbUWVeIdETrEfekoSr6ZBldLKqUYiB6VIg6XqFx+MPmrUEC2kdkGmBkKq6Z0oOPw3uefannF2bYRIK5mwmPXP5sCqLDVVJTWe22C2yOhR1EukG2bMQEUrntZ54K6CqPvo3RXljtQGJzNiYZYcOCK59Uab8G3trEFA3NJX3IHrR6qBIz9ATus9gXw2jEifqD7uINLMPiY9OYnR7rlRL9BImqu7qbqxsPdc9ynOdeOwZog+nGobB/NAEPn0vfMbFOUWEhc5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fGnySTp/zrRuMD+ovkuQN5fHWr1Q0LuH0K+T0sAoCPY=;
 b=m3TXxPe3i2HsGPrwpfRNx7bmisVLXderrFpLkSUVci9LHqpAP5nAkfiHbJCm7F1HZsfgMM52SgLGQEHLpKl1YaonrXLYiPluXWiixehW6nkhSBkaA88yT5gXwKjU53/s4RJhn6CSvBmeIp2b8MsWWSQotLIZ7yX2r2Aq0+z27CK2pX3ZzcKQ36UCv4aZIyIoerH51KxovmGaRJsLlfHP11UuT58sF5I9QcLe4fnjIFRi6e2pSpfgAUsJTiX1mG6VWsVWGsNyUdmCSNczRFCqLI2PeIoFDBnPffAb7k7thmikIRqaYVNRZqXCblmXqUZJ/Y5EPh6YPjIWf+bdJpNtug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB5886.namprd11.prod.outlook.com (2603:10b6:510:135::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Wed, 18 Oct
 2023 16:07:26 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::3f66:aa7d:51d5:777]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::3f66:aa7d:51d5:777%6]) with mapi id 15.20.6886.034; Wed, 18 Oct 2023
 16:07:25 +0000
Date: Wed, 18 Oct 2023 16:05:53 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Message-ID: <ZTACYUD3Ix+lWOQ/@DUT025-TGLU.fm.intel.com>
References: <20231018123423.427552-2-matthew.auld@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231018123423.427552-2-matthew.auld@intel.com>
X-ClientProxiedBy: SJ0PR05CA0094.namprd05.prod.outlook.com
 (2603:10b6:a03:334::9) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB5886:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ca81237-48cc-4e5e-7811-08dbcff451f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Lxr4WLQuVAgwRZYtB4NQ51KtJ33GIWN0cTYj7O348jEftDYk4JFeNFfpU8HPoSqSeZrwJ+g+Wfk3v+ghndZpDmoNCfhp8F3ZDlDA0/+ma+7IIHfsMc9/4CAMh4Rp+66hhokiCboKB5++RB6qV3zP9JhnviQ7QmSLgDoUyAI68kLnpEDO3/aVxCeFEDvCNMhoBtVU7vRRSvspo9MprcElUHN3DGtu68LOs4s8tj0Mj3pC9OIhFSby6xj5kpwSG+Mp52zoCmx/idrV6XOwJphGxOEltB/vdcs+BdCQaeDcBZnexX35vhPfRudrnNOgMiPYBBE+In6NrJs/X5iWBeS9IhKDsXMoLlv1d/ZnDkhPrRXWjGxIPfwAkaO33HAZx3td8iRKvx9bZwg8CS5KL5peg7N7QBuF922WwCv550xiXu7Yr2O5n7ZKz+WWShWBuTX6ww3N+SIbHzV9CVlpoOeol89R1IVCudhWONkkomYj/kAjw4MLLvmWvZGBckwyPzBFEh0PouQKHOWL9QCmVZIGiepzG1YkvRAHF3Dz7oSOAGBoeDoDZh48WJ+nit/ggPEQ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(346002)(366004)(396003)(376002)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(66556008)(54906003)(66476007)(6636002)(6486002)(66946007)(478600001)(6666004)(26005)(6506007)(6512007)(107886003)(5660300002)(6862004)(2906002)(4326008)(8676002)(8936002)(41300700001)(44832011)(316002)(86362001)(82960400001)(83380400001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lJXLVM+q3nTJw5EMIR5K/L1bCh95Lgz1Xgw3AU0GBzKJCT3eJnozAJFsOZHh?=
 =?us-ascii?Q?GmyT6k0YvNjWm6thFVBGty1XAhAYs5t+CdXTnS6F5s1FKRYI71HVVM9W454h?=
 =?us-ascii?Q?zCPb4zz/ufwYR67PnWEa10yq4vkGYDsYThes94q4lrnswRjGx+oeh3Owr67y?=
 =?us-ascii?Q?sktUZNvtVdgGkIR+xNGD5vC27EfAVwL0JlWa8m5644j5iHg3hX37+NIWK9Mp?=
 =?us-ascii?Q?sUNJ3RFmmNsuC/qFqmxrhgNMGR6DFeuhXXebhd169ScUNBZoTQdFjFYwnXxM?=
 =?us-ascii?Q?1dyz5+pa9dSYeB8rEGnco5BTFj5NdjzhavEMg+GpADGcCOCuPGV09lYE9NmF?=
 =?us-ascii?Q?0/ffx0oIlmmQs6ze9RWzv8eJIy1IorUsxP4wQlDKZpSya/MctMiG78Wuz5Nt?=
 =?us-ascii?Q?lEq5AgQWyuMAdHdSNpsn2nV0PP+Z2hEcyP3os4yvQxrU8PUoSzFbXAVvBsYL?=
 =?us-ascii?Q?87nf2Q+5UhNRW0zQJ8ilhlcjefkQJG4Y7cmRPn5bl4ADSlL6I987RP71Mvsd?=
 =?us-ascii?Q?65zV5ooqf3ePGQQABpgmfIRjiWCCOEI/aJWFYatHjKk9NYeyMj736grNONNI?=
 =?us-ascii?Q?Nb5yKA0/KlADN/l3O1N4UU7OkN4rUA57n7rxz5xos494vGrO5nIi433WEARE?=
 =?us-ascii?Q?p2PaS8GFtChTSSkn5X9r6/DV4dloVBtI6lYVmauttXw26SQja3dZ6sQ+SIVG?=
 =?us-ascii?Q?rKM7D6OXBxl0IQ+Lsh5jI35Zv3iRNvsU0/FCnoQBBjsQnTfcIDBZd2UCZuRd?=
 =?us-ascii?Q?g21SGsB9uS67aFJO8VhFjbEqCghsUYiNUDVzOQm8GQYVMnxwIIysGmZKUIoz?=
 =?us-ascii?Q?LENba+PnDO/PWMSljPqBjsiC+/TPp+fIoOhRfkMPuEfEUPLtzaJdRGm/fbQm?=
 =?us-ascii?Q?/NbZ3ET2aFDjU/BWhadrNEHb7VCc+wmtTTVBe4oMJzlbOGX96w6W2kWfulMu?=
 =?us-ascii?Q?K47exz3yv2qslE2Khw4KbwqrMozNhNy+YW4mxGIQbN6VcJJJ0fEj3PELjzWY?=
 =?us-ascii?Q?lPolBC3jwxDCWO1B6D8eoeY0HKiK5a2+WCrTqojOfisU9bqzKpbTSanUY5Hq?=
 =?us-ascii?Q?BtG4OxyUxJ1meNylmnc92glhnV3u+ku6jCb/mNKiKCx8rQ0fPPl9Z/kPXTm2?=
 =?us-ascii?Q?G37lo673YfRqD398mwbNOJWjgftymmHds/YjQxSMmusAhMiq9s+zrsQT6Ldb?=
 =?us-ascii?Q?CzYp21aHEkMMa0QZJEp/+iOuBqQTrBq49BtJnGbyRI5BKfuG7mIR3fRVTII1?=
 =?us-ascii?Q?yhYl/+l2DmKVjWGDoiaQ9DIHTOtrU+S6v3rPn+siXdjQwR2OR5RRbRwnw0ae?=
 =?us-ascii?Q?e76RbAf9ps4HQaxh/Trn4pPBv6s5v2kn3nrUdHOMvpusO1DzmMPN+M9QmVsT?=
 =?us-ascii?Q?JHk6O6PgL+S2dF8Prva1odQ1hoA1VYNW3pAO4DKtw6VUmJkbGC3GDlMB18HQ?=
 =?us-ascii?Q?LBXkAxawOYelo257x/C+fOSy+4gyy59SAJL0qdlxPUXxVfIbPwZ1+LgyDnBi?=
 =?us-ascii?Q?KdnZQsozgd4uC0OhbRhkMg8nMCM3veKCoGVYWBQtOJp6Mb7zj6gEGaRtzDtp?=
 =?us-ascii?Q?jqqhu0wLRkwHyMrvBjwRmWSr0NHNchmpw47AthVpHrtX3AKJKyzqeUFijMMH?=
 =?us-ascii?Q?gQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ca81237-48cc-4e5e-7811-08dbcff451f4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2023 16:07:25.8685 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iWv01DNDGFIPAGb+xMsF7hOe9etaMT4DL635rtR4YfYOCx3yR7tgiF/eh4mXQ1rpeRWWdNx95JmnrsHMecZADw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5886
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: fix pat[2] programming with 2M/1G
 pages
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Oct 18, 2023 at 01:34:24PM +0100, Matthew Auld wrote:
> Bit 7 in the leaf node is normally programmed with pat[2], however with
> 2M/1G pages that same bit in the PDE/PDPE also toggles 2M/1G pages. For
> 2M/1G entries the pat[2] is rather moved to bit 12, which is now free
> given that the address must be aligned to 2M or 1G, leaving bit 7 for
> toggling 2M/1G pages.
> 
> Bspec: 59510, 45038
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo.h |  1 +
>  drivers/gpu/drm/xe/xe_vm.c | 17 +++++++++++------
>  2 files changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index 78da28f4ea13..4e74201cc986 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -41,6 +41,7 @@
>  
>  #define XELPG_PPGTT_PTE_PAT3		BIT_ULL(62)
>  #define XE2_PPGTT_PTE_PAT4		BIT_ULL(61)
> +#define XE_PPGTT_PDE_PDPE_PAT2		BIT_ULL(12)

This patch looks good, but I don't think xe_bo.h is the correct place
for the page table defines. I think these were definied here in original
PoC of Xe and we never moved these to a more logical header file. I'll
probably post patch to find a home for these once this patch is merged.

Anyways:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

>  #define XE_PPGTT_PTE_PAT2		BIT_ULL(7)
>  #define XE_PPGTT_PTE_PAT1		BIT_ULL(4)
>  #define XE_PPGTT_PTE_PAT0		BIT_ULL(3)
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index fa6fa34a0663..498c0b3e1d73 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1210,7 +1210,8 @@ static u64 pde_encode_pat_index(struct xe_device *xe, u16 pat_index)
>  	return pte;
>  }
>  
> -static u64 pte_encode_pat_index(struct xe_device *xe, u16 pat_index)
> +static u64 pte_encode_pat_index(struct xe_device *xe, u16 pat_index,
> +				u32 pt_level)
>  {
>  	u64 pte = 0;
>  
> @@ -1220,8 +1221,12 @@ static u64 pte_encode_pat_index(struct xe_device *xe, u16 pat_index)
>  	if (pat_index & BIT(1))
>  		pte |= XE_PPGTT_PTE_PAT1;
>  
> -	if (pat_index & BIT(2))
> -		pte |= XE_PPGTT_PTE_PAT2;
> +	if (pat_index & BIT(2)) {
> +		if (pt_level)
> +			pte |= XE_PPGTT_PDE_PDPE_PAT2;
> +		else
> +			pte |= XE_PPGTT_PTE_PAT2;
> +	}
>  
>  	if (pat_index & BIT(3))
>  		pte |= XELPG_PPGTT_PTE_PAT3;
> @@ -1265,7 +1270,7 @@ static u64 xelp_pte_encode_bo(struct xe_bo *bo, u64 bo_offset,
>  
>  	pte = xe_bo_addr(bo, bo_offset, XE_PAGE_SIZE);
>  	pte |= XE_PAGE_PRESENT | XE_PAGE_RW;
> -	pte |= pte_encode_pat_index(xe, pat_index);
> +	pte |= pte_encode_pat_index(xe, pat_index, pt_level);
>  	pte |= pte_encode_ps(pt_level);
>  
>  	if (xe_bo_is_vram(bo) || xe_bo_is_stolen_devmem(bo))
> @@ -1284,7 +1289,7 @@ static u64 xelp_pte_encode_vma(u64 pte, struct xe_vma *vma,
>  	if (likely(!xe_vma_read_only(vma)))
>  		pte |= XE_PAGE_RW;
>  
> -	pte |= pte_encode_pat_index(xe, pat_index);
> +	pte |= pte_encode_pat_index(xe, pat_index, pt_level);
>  	pte |= pte_encode_ps(pt_level);
>  
>  	if (unlikely(xe_vma_is_null(vma)))
> @@ -1304,7 +1309,7 @@ static u64 xelp_pte_encode_addr(struct xe_device *xe, u64 addr,
>  
>  	pte = addr;
>  	pte |= XE_PAGE_PRESENT | XE_PAGE_RW;
> -	pte |= pte_encode_pat_index(xe, pat_index);
> +	pte |= pte_encode_pat_index(xe, pat_index, pt_level);
>  	pte |= pte_encode_ps(pt_level);
>  
>  	if (devmem)
> -- 
> 2.41.0
> 
