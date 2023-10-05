Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCB9CE92727
	for <intel-xe@archiver.kernel.org>; Thu,  5 Oct 2023 18:41:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81FB610E480;
	Thu,  5 Oct 2023 18:41:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B25210E480
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Oct 2023 18:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696531282; x=1728067282;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=3UPAVGJ2ogTLJ/Ebo4aOSM+5F4CBVJYOq8pz2oSe0Ek=;
 b=VHmrTc13DBwOgsB6i6OQhjnjUFiWTmFliTmh+NIUBWnEgL1uXLbBBoqN
 elGrCAcrIaJ/2nZoJWF00FWIO0a3auiEQzcM1pfkxzfgeFerj4O4n2cxv
 QiaUaHy9R+jz+3CQ+MGwi66Pm52GuKBHDbohMcJxOIdbF9ecf+Tx5+m13
 UPT0DVVsMgLjBtQipfeybbW2AQzygnQ0Cqo9mspQtSS/Um+G7W024WZQR
 rcM2JXXV0Ba3Ga0VJ/ffDkjZeYv1/ejz7KBMeyqDK3AHr0Q4X97rPWBSM
 SVIzXh3LPZWfkl3et7PbrPB/yGERb0KZuDi6Peo/UAKo/nh+t1ZU/4eIQ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="383480987"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="383480987"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2023 11:41:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="868038357"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="868038357"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Oct 2023 11:41:08 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 5 Oct 2023 11:41:07 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 5 Oct 2023 11:41:07 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 5 Oct 2023 11:41:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TzJAlnwdYWLv4dUGRfMl1CTAgKzq8kP4atUDIjqaRie57Uo2bOYRsPuGOcubw4skb/Q2/teuPD1qG0qzS+ONT7KQ+Cw1xwBUfGppQEXpI1mmZMswKGmoj73TUxap87A3gyoy+Wsta59n0bjWhZHWhV2wAXp7EywhUts4EfLdQKlzEheLLZaR7NqY/MZn9KgSfRAC0HgVaDR9kSC76LIhgJudoMz2urW4Egghl5r0lRjjaFJDcYaXN344LuUlb1nzvex8VeX48qgnQPX8nGe6wyuyh1TZI6uAao/g7U+6Yxpynit+95Vh5mTr6GxHFWIN5kFHLU6Voi6d17vyuj09LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MEgh1F9Yl2avh1y+JCLJdZtk0dbHBIeWMJb/FwHiFe8=;
 b=WaNTxnuOKd3tP+ymickuC2+9e7VZQBawHEr9IXXuDYqJh4IZLER2buZQgYROa3BTMld71yUFCoEm+PXXLdwhxT3eAPvf7T9bfRWpXGX9O5DWlfHWmfgSUH+fBxGfLB3C4lzg7/oxN3c9AwTlOdg362Wkt6vqNf0eilSgMHUw4eRjOJ51y7UvmbaEFvS8mLTP/bBEru1RkZFqctSg/OFUYO3/wHNLk89LYa7PTWkvz9fcc7BApTtoJuReT/GSUnvH7nayJM0rApkJacGbL582v5/0oRzVEujR4V0SzRNSL79IZiR8wDM+PIqxiOscM46quuzvIz0hYhqjJEEFsT8Veg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA2PR11MB4891.namprd11.prod.outlook.com (2603:10b6:806:11e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.38; Thu, 5 Oct
 2023 18:40:58 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b%3]) with mapi id 15.20.6838.033; Thu, 5 Oct 2023
 18:40:58 +0000
Date: Thu, 5 Oct 2023 18:39:46 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: <fei.yang@intel.com>
Message-ID: <ZR8C8tLFOKBihlmr@DUT025-TGLU.fm.intel.com>
References: <20231004234721.2076190-1-fei.yang@intel.com>
 <20231004234721.2076190-2-fei.yang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231004234721.2076190-2-fei.yang@intel.com>
X-ClientProxiedBy: SJ0PR13CA0114.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::29) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA2PR11MB4891:EE_
X-MS-Office365-Filtering-Correlation-Id: e104023f-4895-43bc-20e3-08dbc5d29daa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uaXGDyZmHJJNgOpdUJ3fX1LqTnjvB93/LZjt4ZAhRDiho6aKeENEf91d5VJ1G43VbM8+MVFYbBB7wDxtxHCGoXmA4gQ2xHxDNsksN+Cvr41qtaR4OdQRaIZ8nwCZDIZjzPKB9xZwnw6gAsnjV1InCG1Yt7kdbBcqyoo3Y+Kly2VtrTrXahX5U69iyZLq8wtD5r796fBcA4sNPSOEsXqF+QQlxUQN2uOjh51S/vvT+zL1aQywCDiYi8SxFzKlUM1fXpuXBu1TfbuZOw3oOUUBcC2SwPKnPAMvA4yR2Ar2LSLIIIAqiffI7lIvWRa6qKGRajqZpDwKuUD/fEsoAx6HLCl1SHHlnOS4ml99LUXe6hZK+RQVrtK0hv25rwboQUiCyGoZHr8YRP66pYzUjfP95377NuP0Bfh0CTKuHQ/Chnd8qqoj7zTF7Ebyl9pMPE4oo44B82wIhCnkecdttwhAllXhIDK1VOVaqnfSUgVRUftus5gwUTqvY/7Hi15SJ9Lf4m1gLjZlf0gDgGK44dqJURv85MTsvHWgBL1k04lzL/kpCbIF+9GfAZO/DHW4F4UR
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(136003)(396003)(39860400002)(366004)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(6512007)(6666004)(6486002)(6506007)(478600001)(82960400001)(86362001)(38100700002)(2906002)(6636002)(83380400001)(26005)(66946007)(66556008)(66476007)(8936002)(8676002)(316002)(34206002)(41300700001)(4326008)(44832011)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?U/xMtvsFRqZDsEPblKNAUckVBaPWK+djGgNUJ9lfSf87M4bd+pnrIidnkAJe?=
 =?us-ascii?Q?d+q+hdTwMp3UV+nGQ7EnkmYg9hwSzB2ujMQDzVepT1d0jOFqD8GCWxm1OVCg?=
 =?us-ascii?Q?IPACdi/xC8vh8UteCgp1t/MkLcV04UpqETr/PZSyi21E2urjPzV0WKiBuz4v?=
 =?us-ascii?Q?cvhgmhcg9BCkwnIbkju206QATV5Y9DorUv74Dx3CqCsDaAkjP7Oc61BCDGbF?=
 =?us-ascii?Q?rJ7VItld9s98rLq+/FnY9eEY/IQZzPHCcXlZzD63n5wuaroLfLe7g8IxKq2x?=
 =?us-ascii?Q?gVRi3eAvtCk0ZwomrS/1+iLBOxwu+DnvjS7SC6JoyljRMhgZxsGkNCAzE4Uu?=
 =?us-ascii?Q?kmYBpaeLzqwN7kptJzLsaoAy0gtHmb/QTRGLX0v5ckcbij1MrhEZalkNn5Ls?=
 =?us-ascii?Q?u+7DOqXL0u7IhQ+WT3yGTSRhuVAkMQiYwyHWrU1HvB7z2fx+bC2dMbnqz59D?=
 =?us-ascii?Q?iYPGeYuuZKPW+JfLHIrSZT9ZDEkF62WxA3Z0QkDuyzwqnnhwIpQhMmjbltda?=
 =?us-ascii?Q?u0YYB01grywRblRYkRP2qyvn1ir8aUjR3KawYuWNK3yDhINlQZ8gLaCqHCeX?=
 =?us-ascii?Q?vZpL9a5/jo9LHZZFJyGdeVsSkdy5JaFaKsfUPl7nQ1kBMAEA+8smYfzf1MMJ?=
 =?us-ascii?Q?+rD06OVFO0BWH7FkeMRkiqAW/SDhdJpt1NNcUVNqr+E1sLgs8LrFX30yMcFk?=
 =?us-ascii?Q?RRRykTIRUU0sJnVPIADqdW4rq9Kfds7DwYgXN4DQfIhEFDccnV0Sw9DdcaEu?=
 =?us-ascii?Q?XOVtbjIEODbxVklTJPoX689P5YmjMUcsqF+4Jkva4uoeJk9uq3pc/l0CvvOx?=
 =?us-ascii?Q?t0+BkCcgWVF3mIX744oIv77SV3Zei+0xuIvjqvvoiPZzRVLUQnX2A7HmQYMZ?=
 =?us-ascii?Q?Moa1bEFuH38ZYl9dlTXE60VZFfoTRCU8u8vb3OVVsDlfBpI6Mro84aVHWqOL?=
 =?us-ascii?Q?XAu8jEQ6pzREXQAJdmYQTESZyzeta12mc+y4lq2m6tf8SMzLjlcYCEYGoPN0?=
 =?us-ascii?Q?n/uvIaU4bg8YOkjoGAcRVGgDh+yvtaLroLGwkzLcByv4ytNwjBs+/BHDC6fa?=
 =?us-ascii?Q?eH2baX2o68djTm7hQfubfhFwM29f23V0BT94MQCDV/fGwQ8SwoxGAvakAUd6?=
 =?us-ascii?Q?8K0OvFwrVqICp0qG5XDH8heIFhlKwSu+R5Z2+wiVd34NOzyP/G9z5JSRZptf?=
 =?us-ascii?Q?b5Y8+CfpoCce5H0rMOp6wqNJ8+aQ0FuE0FLFIzEWUL4RgBv0Dv/DOSBdn09H?=
 =?us-ascii?Q?kaf6qA2Fcq8rPwx29H2JZdCO5L0Pg4I0nNdMVhdRZiGYdUqqtAIY1CoEyYsJ?=
 =?us-ascii?Q?FPx3zBZBDbeWDP6cVnvUNVE7qugu5uN9K2gBAUphqa1cxfWo1FUgKDWI181B?=
 =?us-ascii?Q?QPOUk7REhpG/SxUmhg0g+LBolVIL+YwXbfrjryas7pVR/n6pC6A4gy5Br5LK?=
 =?us-ascii?Q?XbUd2xmeuZsDCIa3oTEqeu0Jc3OwrrxlxPKsnjGYXxJmt9EwMHvtJmi7PwtK?=
 =?us-ascii?Q?cBi1DTW/QwRYwFZpiJTMcYC5PM5d0r5roibV4xLYCtWJgLmOgPbSOz5nHhBK?=
 =?us-ascii?Q?mCciI2jrGKZygbwM6TvTVPYskefPOEalai9YGmdYGUIF0eP69h0dkpElY2KR?=
 =?us-ascii?Q?jQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e104023f-4895-43bc-20e3-08dbc5d29daa
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2023 18:40:58.3639 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6C1tONrUBXITBgndJw5Xp8fmzAtQFuLj6b4SCMqu3vSIZMHMMRpdpkJXPfsoWA7puaWlO5rcPlPizJJV7E7ARQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4891
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/1] drm/xe: don't repin a userptr if mm is
 closed
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Oct 04, 2023 at 04:47:21PM -0700, fei.yang@intel.com wrote:
> From: Fei Yang <fei.yang@intel.com>
> 
> Ran into a problem where xe_vma_userptr_pin_pages failed with -EFAULT
> due to the mmu_notifier.mm had been closed. In such case, the userptr
> vma should not had been added to the invalidated list in the first
> place.
> 

A few questions here. First how / where did you hit this problem? i.e.
What IGT test or UMD? What platform? How often can you reproduce this?
Do you have a dmesg or other debug info?

Also by design xe_vma_userptr_pin_pages returns -EFAULT when the mm is
closed from a kthread which seems correct. Is this the case you are
hitting? If so, unsure if this is a problem.

Matt

> Signed-off-by: Fei Yang <fei.yang@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index ea17d026546c..14ba3fb9defd 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -715,11 +715,13 @@ static bool vma_userptr_invalidate(struct mmu_interval_notifier *mni,
>  	 * userptr.
>  	 */
>  	if (!xe_vm_in_fault_mode(vm) &&
> +	    mmget_not_zero(vma->userptr.notifier.mm) &&
>  	    !(vma->gpuva.flags & XE_VMA_DESTROYED) && vma->tile_present) {
>  		spin_lock(&vm->userptr.invalidated_lock);
>  		list_move_tail(&vma->userptr.invalidate_link,
>  			       &vm->userptr.invalidated);
>  		spin_unlock(&vm->userptr.invalidated_lock);
> +		mmput(vma->userptr.notifier.mm);
>  	}
>  
>  	up_write(&vm->userptr.notifier_lock);
> -- 
> 2.25.1
> 
