Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09339E77179
	for <intel-xe@archiver.kernel.org>; Fri,  6 Dec 2024 14:46:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C501310E1BB;
	Fri,  6 Dec 2024 14:46:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DVPawou2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B07110E1BB
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Dec 2024 14:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733496360; x=1765032360;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Fc0x2cCDbmfxZZaK+xjq5lj5LdES/1OKQ52SfT/tgZI=;
 b=DVPawou2MjdbF/PSRpyO0/z2emJha4ke6v5W/TliFS7w5YdmlqH7uPyl
 k8gQTlbNpLrAtuRweI7SW7EPED6jD9UL3H5XHUzs9PfHwWqYw4u96E3GH
 JVBze+V+8Fhk4bBA/YnkYHhuCV4s3DdhX8TNsn/oLDVOzcqoWDKQxAjwh
 Z+gktPOjayQZaY9pmuVQ59l6UBVPAD3mJJxvuajkDLJreBIUWBTNG7Ezv
 FTk3cN7jrc5mqTE1Quy/+R5LwKK3OSlQnp6X/dV+l0fjgmLjYNJWakyuv
 5PqHhSiTfhXX7ybOP8wVojl+u+IwwUFjlDdAC/+xQqEZdtXVBekyIKPaQ A==;
X-CSE-ConnectionGUID: FY6Z2M+DRH6qZTvFTWqXCQ==
X-CSE-MsgGUID: eGgxHRurTWGDiRnR7BQ0XA==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="33731094"
X-IronPort-AV: E=Sophos;i="6.12,213,1728975600"; d="scan'208";a="33731094"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2024 06:46:00 -0800
X-CSE-ConnectionGUID: p2gmc/UhSPeZzNO/COsT1w==
X-CSE-MsgGUID: hKPZ2BtJTPqpiX7IlR/RGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,213,1728975600"; d="scan'208";a="94879589"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Dec 2024 06:46:00 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 6 Dec 2024 06:45:59 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 6 Dec 2024 06:45:59 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.176)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 6 Dec 2024 06:45:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pPhEJPLnOZ0Oh5f7FHHhE3VBo8Zo95aXtJgpXl9ThlXkfduzAe60NOUDKDIe1YoysEatfEErehwmKLjmGaicF/W7BGezPK5LO/5/GfsWJAvGc5kCTqHuWIYmm+qFQ3Z3OB4v0VGV7PaRbxzqGSorVVBxIn7jSKpL/fyiVa0j9tEVBClwgL1+qR3/Z9WDGqnUkJC2t+ABQz/r+3jmo8wpShqoiH4pjYQn2Mur/y5N9Xe3m0Hf8i+ecrFs64TtXkqJhczieN4Gwt5gAzniMf4hnvUVn4jUw/fqicOntIZPTDsQs3Bv6HSJgXzQEaLo7QU+r4qnfqO+71ntR3gh8uysfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=im8dX5NnK4WELfSe3eBDurDrkNxW4wyEwNqdQ09Layo=;
 b=QUcGr4v5j6GQUQNyD2l3q5ZFBdoJO3ChtQ7xsB2yw1zMJR9mEjy/hcZ1bFo+bXSStUgRbiFGhs6xwbXfatEQluivJQPSsk+yaFcDMkcpMutL+6JbGJM/roqQ6l133ue8qwiJZVfJ/s6S2G3Fj8Z4cE0Y9VPw5vGXCULXWPpoTkBLHSVZWZjGm/xuOz53QwzQWYP8TEQ0XaOC4PObtd8pVowdwjk5MkzTLGbW8Iml3FZ6Zi4rJO9VywrYEmAhQAkzhf5Ojx3GFa7ujSJI9RuaoBqiy+nGKVbkNEEdjLEq/pkm2kPhlSl44kvPKLbM3G9sJMqeo9XXJUXJ6L/I8KyYqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by DS0PR11MB8020.namprd11.prod.outlook.com (2603:10b6:8:114::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.11; Fri, 6 Dec
 2024 14:45:57 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.8207.014; Fri, 6 Dec 2024
 14:45:56 +0000
Date: Fri, 6 Dec 2024 09:45:52 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Oak Zeng <oak.zeng@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <Thomas.Hellstrom@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Avoid evicting object of the same vm in none
 fault mode
Message-ID: <Z1MOINf2yX2x6jli@intel.com>
References: <20241203021929.1919730-1-oak.zeng@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241203021929.1919730-1-oak.zeng@intel.com>
X-ClientProxiedBy: MW4PR04CA0149.namprd04.prod.outlook.com
 (2603:10b6:303:84::34) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|DS0PR11MB8020:EE_
X-MS-Office365-Filtering-Correlation-Id: c71039a4-db08-43f7-e264-08dd1604b0fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?rhKEDyMwvB68MdA0UU1wWqaLfmVLC8QEnWResxlnqJMnxO/rfgTuZGvwA8?=
 =?iso-8859-1?Q?MUVNeAYP/KXjEHt8BJGz5HWJZfjhtazbaexBQ7MZ04fHRzAId4HQZuiBIi?=
 =?iso-8859-1?Q?PqaFFC7R93DFqPBUQsmG69EATxfjM+Z+lu43/u5XkcYfDPbSd6fBCxTqDe?=
 =?iso-8859-1?Q?WOOb+eTcVn1VE3CSURM1N0nLaPECljqAWnu7FLR9TJeyVHc6qKzaGeehIK?=
 =?iso-8859-1?Q?UBmv/qmMOoxXeM5TWu0JfHdvpLBNAk30WIg1TKhoOTrYajgupDACrifSz7?=
 =?iso-8859-1?Q?vMUkRof5RbRpu90Oh/tlpq+bAXu074+xTB1wRVRIyF8TtOf0Z0b6JwaLmg?=
 =?iso-8859-1?Q?7TB1QPphqvS+ZQdA1t5XcW9/pafD+vkLUtrV7HdTFM16ZCFefbSIhl1FPS?=
 =?iso-8859-1?Q?THvGQg9Qjp/Lxs+DzapzR8jc5gzMcO5BK8LGZJicQeHbz9mWNLqf1LCC1r?=
 =?iso-8859-1?Q?knk3bjgagCEe8uvL3y3eB8axPj97pEHxjt4/IAyBhPkZrhy+90FHwGNnpT?=
 =?iso-8859-1?Q?WJqj1bAIYv3mZ9ztp39WXCx9O2ltZA/UVNPAdhJN1sWj70SZ/Cn5BX1Jhp?=
 =?iso-8859-1?Q?+OewW7XvfLuuwY+mBDY+sNu+w7I8UCwlhR8cyyrtLOWHaNANG55Xp4EDcP?=
 =?iso-8859-1?Q?9Y/08ye3SMXgcJgGmLjwlZI1lgSsSpSooqSc12xb2LNUnJwLAD2lZm8kLr?=
 =?iso-8859-1?Q?N5Qaxb0aJ1RP7vB2PV7aQm+Q+nJfcbMVEZuwu2BjEd7bhnXGSHA89EI/Z2?=
 =?iso-8859-1?Q?4cRC1zidgpRzvC41VfgNgPeH/wqb5VZ4g74ac1m7fRP/X6wdu4Ht+1JjiM?=
 =?iso-8859-1?Q?Y7IB898fENzvKsVuoa378ltrGV0QdglZ6Pm61vxxU4GJELg8A+Af7psXQZ?=
 =?iso-8859-1?Q?baPiCSarJWc5uOlRX3nsNVJj0pD7uXdZom/bc4ogVeuilepqKgqzn+H9nW?=
 =?iso-8859-1?Q?ur7OGqugulWM3rjO90XQYvo2XDybjT+LjG8LZevrK12LEq0y/pkreENVxW?=
 =?iso-8859-1?Q?iSQifRmCouhZ85U58BRAEY1E0oh2Rub/RwQF/JfWuxk1U5bCK+A2GoZpmF?=
 =?iso-8859-1?Q?j/nwm/82LnsXqeFPG60Bx3t+8B54i09012rO+12oPEv9uMJFF5N2+1DGP0?=
 =?iso-8859-1?Q?OKzTffAioEzw9Mle2pwGtLl/wUaq2sUlabxw7G5WuocIqTzhu9Kc5E70Yd?=
 =?iso-8859-1?Q?Iof9VwOgy+4KNQk+/hY85tEpIqrDl5ytHIi34nSho4IocrCRGA92Jeo24+?=
 =?iso-8859-1?Q?Rr/73h8vBExEPiHYHfnZ3oRkZd3p27kquOhBfFB1GKUEKkFsfGz7UDw+VE?=
 =?iso-8859-1?Q?gd+biwX03Tlhe/bOSsQEXyf13hnx+MOBsINo2sbmMOWE/o9XtzLsPh1s8r?=
 =?iso-8859-1?Q?j/wa5XZLiuJbw1K/GSsLZR6HR7uYMyMA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?0sazbRi2yjf33O1dtOoBI1FReo4AzP+UWfpa/68DzmEqVOebP8fkUtojaK?=
 =?iso-8859-1?Q?YJ6KDVO7tqysMd8lAWuFl19S7FUyJX7Ua88PTXsZ+LUKahiL2IEta7vugh?=
 =?iso-8859-1?Q?nl0zJNwdeP9tSwSgdfJc/enutz+KlGQEDzgnFGbNynsh7fHfSj9BooFpIc?=
 =?iso-8859-1?Q?M2K13MScyqIIzn8uUsf4uZMGyCuO9hBGA62/zeK6MFltM0cr7sp2ANBpj5?=
 =?iso-8859-1?Q?yaUhvRz4XvUh9LEseXJjfu4s8SHg8ejd8Q+PVyBIU7LK13dMkl/d/s8lH5?=
 =?iso-8859-1?Q?3VkdoTOxpdU7iraYS3/4TF8FRAQOkhJTMNLyJAzPE0RHk12CxXdw3IQvrO?=
 =?iso-8859-1?Q?9Zdx9mFUBB8Xzuw6D5Qb2V4UDLWuJUUuQZGOauOULhlZVtGwVaktgc8ZR4?=
 =?iso-8859-1?Q?1+MtrXTzoJeA5G4FaA1jUY1qbaoHk+KA6BHLdnPb4heWhBG0FBcqQbKcgH?=
 =?iso-8859-1?Q?GZBYef3F/MNYAroV1tj2Zz6Z0UCy7qFAWGg2XiFA+sq6VyPce4h9BpSeph?=
 =?iso-8859-1?Q?1/fMEofnNuTGSHG6hbrw9ihPTPDa3wytViCtGzOF9PNSDa10m5o+DURhcq?=
 =?iso-8859-1?Q?4hAVPgpRksIvKuq+nKl59Vr1qI169Kywj/PNfBwqMOVRQox0F3k7BIN6LJ?=
 =?iso-8859-1?Q?dTb1Nd67iNbqKqQ9uUXoYk9akp8QoHIIjRrc3tOaFrLsaa0KWt1sZtp4X5?=
 =?iso-8859-1?Q?qCVGu5NhVdDo7CDCf+3+x3Dv+edqQPlb43ZtxxokdNpuDzeEYJyrgD4hkl?=
 =?iso-8859-1?Q?ZR20SeILoWDOllKXP0OS1yF6VUiceEWnk/45g82podlSwiNlOWA3Bp8nGH?=
 =?iso-8859-1?Q?MA9H27K3vbuaEvBW9QsymVVubKRV0IGLp2LmPIA0MlFVM+MwKdA9cobj9p?=
 =?iso-8859-1?Q?egDNOqNnmh/EWdXbXs5Ayy/XHHalTT0MJSEFWCxeQXNXa0h2/XGS0I0mKG?=
 =?iso-8859-1?Q?eljfPCp09jhUmMwZOUKeyjb8nV/OG813qgvrmW3HgZT4e5AAEa6V98Rkwg?=
 =?iso-8859-1?Q?WvOJ6xmvpud+wKVMs9fZ4T9zcAEPbkYnA7y7BaeqOIe/+lrNJfbFjZwo9f?=
 =?iso-8859-1?Q?5rtK3hA6T2ni/HaIiODNAtkNkjQuh+FwhPpfMiMutEqUBESTL1lyQNoE6F?=
 =?iso-8859-1?Q?bGTi1Wr7zfeXQBwiw3Q+jeM9GZJKaBzQkq60A/1MnXkf+YxQzqbm8z7dpL?=
 =?iso-8859-1?Q?HEzgDPUN7cgsfpi4fpgNYEiVZxrnhDl9Qh06L2ADWYThrrVpYjLTSQ4ukW?=
 =?iso-8859-1?Q?0/5qu5jhybY+bZg5uSHIlX37eXc9jQ4JaSll4Vg4okQVTmT9I3bGQIcV1t?=
 =?iso-8859-1?Q?FvtXBQBHOFKkjQAed2XXJqG4Sn7BTac0uRpJq/pK131vq5o2yYOZVI5GhC?=
 =?iso-8859-1?Q?lyyNv+4KB4g1qHp2Xo9WXuFweUGbDtMjfllryiM9vKhqJfbPDzkKQCtxXA?=
 =?iso-8859-1?Q?YHqL1onJ2klVPMww6Bju8NVX62E/BoH+sxQSn85MX4W490HBkAST2VbhVk?=
 =?iso-8859-1?Q?zC/0Btp23QUbFuToifw3DvUK9P3oRCt9QH459qnQijBrHmpqi6Vc5GIsEP?=
 =?iso-8859-1?Q?iVISpY/YnHy6ad3BllY0lKi9Eph1leNuQhas4TsXdRx024XpjqBrypRPFV?=
 =?iso-8859-1?Q?0lVdB8g12oeI7xznovaxVA8X8G/MMAu4Hto4nzWBqenSWTTiWzeAwFHg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c71039a4-db08-43f7-e264-08dd1604b0fd
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2024 14:45:56.4567 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ee8qMI06lpf4FG9y5TWqisdtZNWXUtfobGHpqUgIx6WJBxc3U+qL7n5YPLnnHeBCDFkxWhhu5S9aJXPrgkErGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8020
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

On Mon, Dec 02, 2024 at 09:19:29PM -0500, Oak Zeng wrote:
> BO validation during vm_bind could trigger memory eviction when
> system runs under memory pressure. Right now we blindly evict
> BOs of all VMs. This scheme has a problem when system runs in
> none recoverable page fault mode: even though the vm_bind could
> be successful by evicting BOs, the later the rebinding of the
> evicted BOs would fail. So it is better to report an out-of-
> memory failure at vm_bind time than at time of rebinding where
> xekmd currently doesn't have a good mechanism to report error
> to user space.
> 
> This patch implemented a scheme to only evict objects of other
> VMs during vm_bind time. Object of the same VM will skip eviction.
> If we failed to find enough memory for vm_bind, we report error
> to user space at vm_bind time.
> 
> This scheme is not needed for recoverable page fault mode under
> what we can dynamically fault-in pages on demand.
> 
> v1: Use xe_vm_in_preempt_fence_mode instead of stack variable (Thomas)
> 
> Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 2492750505d69..016fedae5d554 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2359,13 +2359,15 @@ static int vma_lock_and_validate(struct drm_exec *exec, struct xe_vma *vma,
>  				 bool validate)
>  {
>  	struct xe_bo *bo = xe_vma_bo(vma);
> +	struct xe_vm *vm = xe_vma_vm(vma);

for single usage like below we should avoid variable declaration, specially in
this case where you do have line space left there... then it gets even clear
that the only change in the patch is

- true
+ !xe_vm_in_preempt_fence_mode(vm)

>  	int err = 0;
>  
>  	if (bo) {
>  		if (!bo->vm)
>  			err = drm_exec_lock_obj(exec, &bo->ttm.base);
>  		if (!err && validate)
> -			err = xe_bo_validate(bo, xe_vma_vm(vma), true);
> +			err = xe_bo_validate(bo, vm,
> +					     !xe_vm_in_preempt_fence_mode(vm));
>  	}
>  
>  	return err;
> -- 
> 2.26.3
> 
