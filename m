Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CC06D44162
	for <intel-xe@archiver.kernel.org>; Tue, 19 Nov 2024 14:33:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 277D610E2A1;
	Tue, 19 Nov 2024 14:33:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BAGPQBF7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D21E10E2A1
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Nov 2024 14:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732026817; x=1763562817;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=TXfs+JMSLXQ8Wxxamhn5KS39wAmcxc1NeR03FGRCJcg=;
 b=BAGPQBF7S6bhRQcTDgH76CcomDqla19zJ3E1TPhiUYSE3M/1F4q1OKEv
 7FQxjurt103IVJ5w42SEtKA7BxyyGdELW8lAyihC0yasEdTGVufhk8Y5d
 hHNOKnguijxM7MQKZrcSUDzpB3Lpxt5GRIEd/SCri+ITrsoS/bkgJ/HPm
 9tgHLUkqqYU7/0vy7zqXf/WflJgaGSrV6LSm15R6t9HJeCT7t6j+DlwRi
 EBUssHuYduwIr5i49Ka0/DYVHqWM4ZqEH+4BR1wRjWra3WWPgQJdmK1hN
 qvNJ6pw22QEvLn6Qzy3pMt7tcA/Wg/Je2Y9yJ/9qsccocdChzWqHvFDPN g==;
X-CSE-ConnectionGUID: fM2t3F/FRWScMS138a6k7A==
X-CSE-MsgGUID: Gy5NCD5rQNKX3PDLuscQ3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="31963717"
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; d="scan'208";a="31963717"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 06:33:37 -0800
X-CSE-ConnectionGUID: 97rv2D+lSwiwpNslSQwunw==
X-CSE-MsgGUID: yNJc8m8RTMe44zgN+9uPhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; d="scan'208";a="93650607"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Nov 2024 06:33:37 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 19 Nov 2024 06:33:36 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 19 Nov 2024 06:33:36 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 19 Nov 2024 06:33:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CPX3/BK3eIx9SLtmpm4Jt0cEuAwUpaW08lk/9mmqzds8/kyBHSyALXj8P4G1aunxR/RWvTTgd0NxhdK6OJFzuk/Gdb3FEQyAXvi2M4lRhezZ9RovXkd81CZ+X4QWRXfL0Iof+zfcucHyznRr2UHQqbnw+OtTBS1ulsGcG054RTGXm9B2h9ugBMuKu63Ikv2HCKOcfSxRbUkwohv4N7thczOisqSKCXDlrjUvZ9ldwulGniCn+uSLiGudJV+UHVYyOzNqYYWI5PY6MFqNH7GFi+jpSbXxyC+3Ty9z/wNG0WZv8qOoWjpNi/wUGThDGGQrVHZFv1cxSOcyNs5biSX1Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qoq3VoG2PbStqI2WEShAblVz7FhGImE+etoVBh6pCRI=;
 b=UuQ2OR/dvLQwwdXglfQvkud7Vjf5R32ECCr1jPmJbAh9ex4a8EBHOyzQL4RjSTwdwnrpo5xxjK5PvepzTCWTsZHHui10c7zkMNC9ILAVD2vcJtgiEzfr2KppV4o/SPOJbteBck5GCm9HmIXOYy3UCjXcIriJDD574hyNXttcUCdb5Th/FPamRVZZOtZUF1v8pjho5xkdAz/LVEqoedgag+attbaXZtI924E4clNqgev9cEbRqWCjt3HD/kDjdR909Nt9Eli9slSbi9x7fyZx3Ppho3hVCuopFPyBPW56APAv4VCSWBvplDmzXz8aGPiRzN57xNGuQd4kgrv2pIVX/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB8787.namprd11.prod.outlook.com (2603:10b6:208:598::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Tue, 19 Nov
 2024 14:33:27 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8158.023; Tue, 19 Nov 2024
 14:33:27 +0000
Date: Tue, 19 Nov 2024 06:34:02 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Piotr =?iso-8859-1?Q?Pi=F3rkowski?=
 <piotr.piorkowski@intel.com>
Subject: Re: [PATCH] drm/xe/vram: fix lpfn check
Message-ID: <Zzyh2rctVYKG2u1n@lstrano-desk.jf.intel.com>
References: <20241119101926.190203-2-matthew.auld@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241119101926.190203-2-matthew.auld@intel.com>
X-ClientProxiedBy: MW4P221CA0006.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::11) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB8787:EE_
X-MS-Office365-Filtering-Correlation-Id: a146e1ab-5db5-4498-3a6f-08dd08a721bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?4I5Sb/A6KAkvvMlZ95NZQGE2XTgYhbIXJFB/k04p9MzD1aGj3EWUfrHyex?=
 =?iso-8859-1?Q?LsHnDSXTJczdVo5rKmowEWVv3p1D2/BuATR2g2DzJ/OaNMfji7eXHPWZw1?=
 =?iso-8859-1?Q?Vz5fwtWOBG9rnRLMILIhocCHRMUD5ZZ5CohJCmXPB9j6NXZuIgClnSalGw?=
 =?iso-8859-1?Q?7OkFac0wTiLUxLHC0lRLOTgpCoeV2icgt6F/x/bILmGThgW6itq2qu8YPR?=
 =?iso-8859-1?Q?mr07ak/kL9YYJDT79C9UsqQj+6n9SOKFRWJmQi8Y9QU7jRk1nYEXam0xH4?=
 =?iso-8859-1?Q?xDG3TVWFhha/taXmN17KNGfAr7t/yVu/kGOznqTYlMZm7fl/U/OF0vDdEa?=
 =?iso-8859-1?Q?K05E8auRlKWc7+1Ne8qlqhEpkK2+rIeS7kEALse0vnhjaBcHhIuAvlFlnQ?=
 =?iso-8859-1?Q?W/kcPcW/xBIy4l29MuC7ulvUq27KtlPSUOleob/HT0LQt8T9E6qyPi5sLV?=
 =?iso-8859-1?Q?NSNZNbnvwxS0apPe4vcj/mkBvtBHNmGJRwZKlyhsTMWIyWML0vfWVpibQ/?=
 =?iso-8859-1?Q?8dRVkSG9LTxHkK6nGMiQqOIFiKtVKhKRs82c++LThDK5J6IlTc4QRXyKUj?=
 =?iso-8859-1?Q?nACiA4eoqFCn8/zvHwgfmJZEwKVRCXoz6XaSbbZvZd8l0pNsJ6bNMTWvFT?=
 =?iso-8859-1?Q?NuyaKkE8oy+jRfsm1oWeEI0WaCbk3/Nd7BE9RjPmmqn7sedsiDJ4CUXk/E?=
 =?iso-8859-1?Q?bnB7mNd/hlaSmRbvfUi257m0kg9ybTge1b5yq+nf2DeNz9bvF1n7s1yPFz?=
 =?iso-8859-1?Q?JwBCKP5MOCQV9F0oxaV1opmkPNpLU26WNLjY2dl2GnB/G67z2G04kCN/Mw?=
 =?iso-8859-1?Q?nqeL5yUvE/tGdYY6KnLUzTdiiYx+4GOMxUhKMY2QCvMVN/nBqL5gcuTyGU?=
 =?iso-8859-1?Q?jNRU7dmHjZQgJbdoAAumYC+E6aemCLLXV02CHm0DlkTy7iNGAZXk9CdnJJ?=
 =?iso-8859-1?Q?PoJgXPkDjuyjxkculL5vVkUpD1LSgriQaFzcC37j30gBMTTXDGMTqdh2tO?=
 =?iso-8859-1?Q?yEzzzib+OyBbf+k6YB96j7QXm2WX6zyv51Vji3uZgmPRR0jt1/qhLsel7K?=
 =?iso-8859-1?Q?oTOcJvAjOsEMOZk7TI2ibc4fTwoX4h7qrL3kbP+c6VAH4iu2PnQcsvs5Ex?=
 =?iso-8859-1?Q?REtr8LWXzsqlWgjZTC3IWqNEXUpZ1oKXlX7o/8xDcoTDGTpYBoYMc7JzHw?=
 =?iso-8859-1?Q?t54psZoyZkAu4ATLzsawVfKOziJInr7mpbePzMgkMVryRFplyBnjp9Dqdr?=
 =?iso-8859-1?Q?HcMuuxMxJFZDaJ9/d5NSFHECr5NqbfU3iaVBQwqLYAOOYRe9CLe6zk/ald?=
 =?iso-8859-1?Q?4BAwdoC3/e8nzhyVYg39PFSqBlZy8ZtrG1fdIfPZwjdkM4FpFr76opQ9X6?=
 =?iso-8859-1?Q?ycl7VQXKyk?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?7EHTZAGj3LhEqubIFprghV4vUtYWquXwPKQ29s6ZZJCVWWs9XEbZVdaxhD?=
 =?iso-8859-1?Q?6Jwu87meLoNs9RVoJVr264Pfco+XLHDGHtwHsueS0z6gAwYeoj52ESBAr/?=
 =?iso-8859-1?Q?hdRFQPnNPDw8LtDvkDPEcmPH2JTQCXZZUBNGZhIHOrkajMtzO2z85Gufep?=
 =?iso-8859-1?Q?8GE04q6TTqZ0ti81qKjPJXxKsam/+HILRjwgQS7ewPjU/z2YF1QdsINfmL?=
 =?iso-8859-1?Q?OhCqADVcdQqsDdj59J/3DQZ/FwiD7ZP6chmJKHtNWhVit+wBosmVmSqyrf?=
 =?iso-8859-1?Q?F0qKbJwBeVYZBLkrsNdfkpcNp6hz+vGFX2TTLV+i05x28MV69O+Ql6EpG7?=
 =?iso-8859-1?Q?J1ZJqhb1qr7xEMfB4So321gXmkeXuodRUJ6EDmjXI7CU47PRc75L8ikAQs?=
 =?iso-8859-1?Q?XdxPPO/JRJzJpx3prWFYSPMWsM1OOZN0ajKlhMlo0lGaMFxza890hzHeKR?=
 =?iso-8859-1?Q?001zTZtjSsUVFVcGKqJxmb+ESXlI0SfCQOQruaxEHKCxmU53Io+Rakps5O?=
 =?iso-8859-1?Q?LmQWqrCJRFg/hXXmZKX6uc9/II7OinyOWHhqf6z3N/SnO8cCRKIiPUYC3y?=
 =?iso-8859-1?Q?XHcV0WgrVDqsi0KREsOoY4Ck57cxqQ00DVDDdQidgeh3YlqFC9g3oP6QuP?=
 =?iso-8859-1?Q?2hR7huQmCUjqKJJjOqjvQodumL8ZZ0CHve0YBGr7wUY8N22t9IGxpK/bsl?=
 =?iso-8859-1?Q?QG5zEIwp8X+xGSxtmH0w/GCgU4LnVYLoSu9OJi37xX3ZRXsxgEhZMX4/Fk?=
 =?iso-8859-1?Q?l8beSeFRJdeNfPpojk4Ei7bRbmiyv0Xx8yGd56w7Y37lyuHryPmnATqQQa?=
 =?iso-8859-1?Q?FqFVzoiMM7apEewf1szc2e8uxDM25h9fF+aL+++5ocRXeFq9/heIcYf1km?=
 =?iso-8859-1?Q?dzABsQrBeNRaQSeoohz51Mji/SeM4745kyY9NxHMGI5wg71xSUwTQ8QNAb?=
 =?iso-8859-1?Q?hV3aUrrjVzNq2lgcIJ50XelBLbRNDvW4DXeedXDKw3u9ZbZDOLzH+5094U?=
 =?iso-8859-1?Q?4xvgjNqL3ipn/HVWldoQcRlkEvmv7Ch4xZSDCTlMS0D1VMXDM5F7pzdNYl?=
 =?iso-8859-1?Q?etkMOtxc6MoXtOfZVOOcHWd5+hr5DwXTnHbMCBsjAw0x6rJ8FDhZI7i4Sn?=
 =?iso-8859-1?Q?IGZ6R/ZvEhJghL2gyKE+Bwa2fJjV2A/xRXHMnSfseISAK8FFwmUx00C//p?=
 =?iso-8859-1?Q?+DsA9HQ+NsrgOJLc7ToGdhepBE0/KEfyvt5pJOxHD2y/jTAfB+MQZuGRbG?=
 =?iso-8859-1?Q?pDhZQ+IIkyjEhcdUDo0MubTctsTpili51Gdm0phmHKlUIdxtF3YjgE1cY+?=
 =?iso-8859-1?Q?UES7Z39ZfToZUeHk/4svZlpFnMAnxSDEsSE+EhSPNksP8lgblWkEl07cXu?=
 =?iso-8859-1?Q?Dgx1jLiy6M4FfhXg3oVCWbCOFlZvb5oDZMkzA+NPp5V0beA05AVgRNe1zO?=
 =?iso-8859-1?Q?X4oay32TLYKbw07QpiFLzgKak9RsxSRBvqV7uh04i1TRW9icKy2IH//7+o?=
 =?iso-8859-1?Q?EAxuigJTurhNePvxBjXqbG6jWr3GC1UgUwnqCzzcRclgR+ZJG9Yqzgde2o?=
 =?iso-8859-1?Q?SZJ53Ryxg7MRuk5e1ou+VmHvhg9naqMGb+9SnhQ81l7UrdF8/VTOBysyBY?=
 =?iso-8859-1?Q?lzYyVa10WAr5tlq4SEE/dlHH7+qDMxM9I7DngdJlikBhqD+WcGOQgAkg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a146e1ab-5db5-4498-3a6f-08dd08a721bf
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2024 14:33:27.6907 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nkZsT6eT5FOn5S93vrzmZCHx/Y8iKheVzHjouVxcJxh9xUjmVsBiOgUQb08MKGvmCB0lVXVwOprw00l2Xz/76g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8787
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

On Tue, Nov 19, 2024 at 10:19:27AM +0000, Matthew Auld wrote:
> Technically we should check the lfpn value and not the place->lpfn, for
> the case where the allocation itself could be as large as the entire
> region and not be range based, which might result in incorrectly doing a
> power-of-two roundup. The allocator itself will already ensure it's
> contiguous underneath for such an allocation. This shouldn't fix any
> current usecase, but never the less came up from some internal testing.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_ttm_vram_mgr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> index 1d39a8c53b3a..c95728c45ea4 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> @@ -109,7 +109,7 @@ static int xe_ttm_vram_mgr_new(struct ttm_resource_manager *man,
>  		goto error_unlock;
>  	}
>  
> -	if (place->fpfn + (size >> PAGE_SHIFT) != place->lpfn &&
> +	if (place->fpfn + (size >> PAGE_SHIFT) != lpfn &&
>  	    place->flags & TTM_PL_FLAG_CONTIGUOUS) {
>  		size = roundup_pow_of_two(size);
>  		min_page_size = size;
> -- 
> 2.47.0
> 
