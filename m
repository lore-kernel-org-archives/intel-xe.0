Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9866DEDE9AB
	for <intel-xe@archiver.kernel.org>; Tue, 10 Sep 2024 18:34:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BF1710E167;
	Tue, 10 Sep 2024 18:34:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NicA3ecB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56A8F10E167
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Sep 2024 18:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725993275; x=1757529275;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=NN5euiwPMYcnMXTajwLEloJF7nJhgvcJv1XNvR8pzz0=;
 b=NicA3ecBRnxAwfkinPBcqGp+IUdX/yzvltDHc7xUCCne4PA2ou/RU2Wk
 ATbH2bZWsDWRACGFFomBrC5b+mOKUguU0dLPIXq4hOr8SOm+BNF/Sx4ri
 DCZyoIOQMCtKtqRayIoOSeLBqeV9mxW3xPi+o9PDceYZixCkKrvyZvU2H
 yQftSEdqCwD91HXhoCiFUN3ZM5zrKveGiiNw305vfMDT7wXAiSxt5dAvR
 GGwylJNrTHfioSyO3ZP49XUlOODbkBR8uSwH9FPE1swXP6vFnnmuVdpX/
 RQju62lCUd+8edpGU8yyMxPzwEzQfXPj/X+Vgby01pheU/ThdEQheYB7W Q==;
X-CSE-ConnectionGUID: ypdG1LYnSCWecG+izNAvIA==
X-CSE-MsgGUID: Y3phTa0fQXSA6sW0ZtNaBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="24581012"
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; d="scan'208";a="24581012"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 11:34:35 -0700
X-CSE-ConnectionGUID: aETIox8PTr+pGfzxcRWpcA==
X-CSE-MsgGUID: 2nf8cSnzQZOZZqP8FejMdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; d="scan'208";a="67356996"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Sep 2024 11:34:35 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 11:34:34 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 11:34:34 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 10 Sep 2024 11:34:34 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 10 Sep 2024 11:34:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ws98EZDZkxe/H7GEOlS531bFZtADm8NPJJuqG5NlHnSC74It37wUUHHnOVacTxlh14+UfQgh8mCavohII2mBS9RyWzCDFoZo55z17Z5ZD87li3ufTTygeqJxsSCRieVlyvtsFoFeabNfwhkxcjMjRC13NBnWtgtBd/TnmSG3gRmvy0KHHa+yMppsul7P2f3LJ9h+4AWVKOFHwFuuLLIelJd56pEvXh8t3Ar5KjA672OIoMZ0pP3EJe1Bn+mCQUyZfdiLpQoo8n46xWV5w1Wy7XUWZkvVTPJfmiPGc3PTkAj+oPaXWXiiT8zW1Vq99+6EHjB9Hmuq25UDkSo1+7LY6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zdH59q72+/wOpbnbNo+rzVIhgtpytrkv0PE+QezgJTs=;
 b=ROtl5CDpAIs2m/b6SmR4QfOblVefkBiA762XyVwcXB2PM4XbU6uYjSpL04+Gelq1Oj8JFNYyBCJIy1BNuduNKofe/HtBtezmCmCwH1i6bYLfQXy8rXOt5NfXI2EiOpx2FkzIRcaLzrueg1E0VpRBLuQ6oe/JHmgN+tBbNzBYDXCoYSD6a8YDYnwd8Sy+Uudb/AFPUFuuZiPAVNd3EwRnDxcalM67qA4v6ZlMC7iHgACmZzFDYUQb+x3BxKL4VMXJqigwoX5d07fuBT854JGojXH6jCrbxz8uOcpQ2dtqIHgNKftmWa6O3Cr25sZCXZpdDiZ+2gvP5BHrjgOS0GKCJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by DM6PR11MB4692.namprd11.prod.outlook.com (2603:10b6:5:2aa::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.25; Tue, 10 Sep
 2024 18:34:30 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7918.024; Tue, 10 Sep 2024
 18:34:30 +0000
Date: Tue, 10 Sep 2024 14:34:26 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 31/43] drm/xe/oa: Convert register access to use xe_mmio
Message-ID: <ZuCRMun7Thr4UxWr@intel.com>
References: <20240907000748.2614020-45-matthew.d.roper@intel.com>
 <20240907000748.2614020-76-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240907000748.2614020-76-matthew.d.roper@intel.com>
X-ClientProxiedBy: MW4PR03CA0031.namprd03.prod.outlook.com
 (2603:10b6:303:8e::6) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|DM6PR11MB4692:EE_
X-MS-Office365-Filtering-Correlation-Id: 79e86729-279b-4299-f5ba-08dcd1c73495
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uGaVFZzbP83aH6ItI2kYOoY9P+xZOSIan074vChxIZWciRsP7giPEJlsSVAn?=
 =?us-ascii?Q?fk+7ukDi/2BWgM5yTccwpR0Ce43uonktI+8ENztVDpRWCfQxa9Jh4uqxsi/G?=
 =?us-ascii?Q?YoB9pVQKh+cSDS9iWzs4P9WLt/lzA2ikJ6Zru/bw1JpBS6yS9wV3cJy/yMi5?=
 =?us-ascii?Q?q33Eyup1mAmqdWRT9TI980kCU9EeESOB3TX9AS2sJnkHsldn9bxXYcmq1aej?=
 =?us-ascii?Q?aug8U69ExIvP1DQ69yQXY4yaTnn/JdG9yWVSUWvWaGh6CsLTyHNecMHhdLjr?=
 =?us-ascii?Q?6CgKFJ9G9WXo0l/1Je/TWia9TILKMBb7/rbuvN/0/d+CfklLZ3rPsv+feIXZ?=
 =?us-ascii?Q?A6SRVMJN+T4RtAWcokobmomz6k+QettggV9sVAzisqWOJkSuaOZvI9rpHyBu?=
 =?us-ascii?Q?HGYl+/qrF5qvM2VynJqlIIdbHwe4GR5+rB4RQSMW0Mgsq5My6MVNMAMRqzRG?=
 =?us-ascii?Q?N8DT4VoiRz0n71m2mfPciQK/UPDPML4GYcMrx9JD1nGMhyaDQZACLG1of8ga?=
 =?us-ascii?Q?C6B7GuQG+lnJ3Z01SlHET/5SM+JvYZf9kR761RE2vtCXJpOjtrCP0i1S66Vf?=
 =?us-ascii?Q?BQ5Wwgy3+ngBOQdsjNINz8tm7xH7HoEQOFlaFw2oqzNMFd0ML2dnKjXvdzIZ?=
 =?us-ascii?Q?GNNuu2XVqIWaNrX6Z1JkbVETJoWPkhfDkyGw0eLp+eBnAfz9SiEMYzjZ/FGB?=
 =?us-ascii?Q?tQygcTbyJQ7K1zCUkKnTau9RX/WjM9GlOVygqk4bJvzn+naPsT6m3i6YJMh9?=
 =?us-ascii?Q?YuEOqXEqv+EHNeZv/KppgqkQAzvb4o84ko7K+Ia+LFYAA8g6GhqZH0yvLtCA?=
 =?us-ascii?Q?BqlsfZtwXinTrWS0Cjzi+TUOg27aHh6IblsatcMvck/v33xrn11ORNM1TzrX?=
 =?us-ascii?Q?5YVKUER3km8Rpomff0JQkM5+x+rgR6lTJfLlVFG5vxDNsM6T6IGuom6ktVWE?=
 =?us-ascii?Q?sNIRp5tx5VpB8YnR9RGiwItqIHJXZxR1iq/7aUgAwOBBtvy6t8dy/D5nQ2Er?=
 =?us-ascii?Q?MGhD2WfvPQ2SXjcqPqrTO0Xk7Gpjlat0QoyJ3bqybvC95D3MImN6e69DQ66b?=
 =?us-ascii?Q?xJjnWNqwfkfx3zrxofMl9knRW7Vu/yLLTqxOsjKXpahPyevUzUEmIC4IVk5l?=
 =?us-ascii?Q?oDvsj/6nln1V6NStAYKg8J0X8rMa4NTzIna0h5h7VpeLSYCkAOHjIMElg4j2?=
 =?us-ascii?Q?nPv2ixerzgwNJ2x1QmwJiMijGYe+Tg5HNowFahuakOBsIcWYkOqEU2R1borb?=
 =?us-ascii?Q?Of+Ky9r6Ciklx1B2Dy8WejO6HQ+ePYTJ3zSClKce92nYVpcAmluBFJxXktZ6?=
 =?us-ascii?Q?cZcgTrjzn6KPoAxB1774qJ9Ra8RlgSxxhGBWiOgBBh9s9Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZYHydCpAhJxCfZImtIYH03M4KldLwjL0KJwsTdlbjog4kgsWXnPNAIc6mpir?=
 =?us-ascii?Q?KCaDM0auzoNeGyxyL94zLK8dXS537MSXfkuJvVrBe/olfD2Cuo45zuWt7QiC?=
 =?us-ascii?Q?AmJHTdOzxnz6wtPiqX0n/l1ZFnzYlLEwBsrh/OyvuPbQYpnFGvA3KX8bLXgQ?=
 =?us-ascii?Q?EnbVHAiX/R68mSubOF6q1TPS23t9WhMeDGASDhS4W5ysmYpPzpfoJYmdR3Vx?=
 =?us-ascii?Q?TrOG9D4yKnoLU4PrH+DNu1YUw8zcygPc9+69/xupHMh5gtIEYuWRNQHUrWbK?=
 =?us-ascii?Q?DW+aAkklpCTqCOZBng0HdpC2p3vPbtOC8WeDUnkz8RBW5/jMaYNh3pYaovtr?=
 =?us-ascii?Q?o4ONYKPdX+/Ov2RefLqZoOGiCPrfDfYMq1Tvi42xLjurhDR+VYi6/v8MHBbl?=
 =?us-ascii?Q?lQ6ySdoIYfwxOJPZNClpa208+HtU84rAn1l1YlYMiTAV7oq/Vc6WQtoPXO1L?=
 =?us-ascii?Q?jsmb7JCppTIKaDI2L4h+22K07d4EMQg/+p5iw3waTyeuMVTcL7RT7IlfhoQx?=
 =?us-ascii?Q?wZS/nASlPRAKXv3HnMN1MREysBZygj1wEDrT0UmZdQFBCq9L0b8aEYCXBm0e?=
 =?us-ascii?Q?XEzhV/YHIPHpoAsRMJgwGFeVjSyHAp4at/bgrl/CXpmxN60VAdvdHBayfYsw?=
 =?us-ascii?Q?1brjJoBpEbiTot/Yj0zRoM3/EDSWYIHm5rIsmNwOihVxemhs6HkOjg5dNYX1?=
 =?us-ascii?Q?Dx0uo4X+nWBfo5rG4npalG5d4QcWLhysoPTsXc4s7b690WJqIf6Xx92xmueO?=
 =?us-ascii?Q?5YXULs7qKnYwgWLRnOt063CwpFSeAV2h04z+f08qhP9emfQYh+QgqsYRfcdf?=
 =?us-ascii?Q?/qmdfA1hJPs+nh13af0swUYpB9z+yzT/ymmiiV0nxBGloYBPPwzP5IrmTf2N?=
 =?us-ascii?Q?yK6ZHHysdKwm65g2C5TbpkUwcqggN7hljLVJ8jEZSMybZE0Tb6FRjGCZcqZQ?=
 =?us-ascii?Q?YddMSpKNoWIAKpsHUsK97PJLQGr06UNGJINUXSyRN9Ds+8p7bomWNhj3nEIW?=
 =?us-ascii?Q?HGmfZHzfU5WYXWZ0Slk/q1OKZiBhW32KgtuDT9XO8UOn2BNduLF3wlOUf7nk?=
 =?us-ascii?Q?eflE67Lf4QuN3Zp4TyQt9hy6VpwuZC/jppHY3BdVmTlEFzoovMIkqy6UdsGx?=
 =?us-ascii?Q?5FwO2VPzqyXQS3Usxd4lWIgB9jA65Vrqq9DhWnta5v6fE0zNn4LN9RH3VGUg?=
 =?us-ascii?Q?sjPB7KObIf0aD/qeabjM8bmQuBP9aiXqu7MGFbOiBPh8slZCyAOpjeT50YPO?=
 =?us-ascii?Q?b4ywGEgDADL70XqKNnaZiX99Ds4hkeN5f/wN5huN2VRkD9OK9h7HvRcpqdWU?=
 =?us-ascii?Q?qSKHe17iswS+EWUFNA42xbcXxdgDptB5hDFpKsFWL5eYiM1uLiKJcJ+B+LNT?=
 =?us-ascii?Q?J4p4e+v/gzEuNacvW+I/ogp9V0hBDfApEnMF8SKgC6Yga/QPA0se5obCh2pr?=
 =?us-ascii?Q?i5CKuO1cqYudFpbfUsS6NEP8d9LzmdQxM8cGIxuXtJUay3DCUCB4d7aoE0xv?=
 =?us-ascii?Q?GWFspK8r0xU4RXIrTL6JCpiORKVwnO3w+J1hbuc2CYJ8qddLu3UWThpNIVIp?=
 =?us-ascii?Q?AxyfD+sjnQ1t9WzPsLPhi86fsAsWHieq5Y47Qcn1YzcXt03l8vJEJ+PzWD3c?=
 =?us-ascii?Q?YQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 79e86729-279b-4299-f5ba-08dcd1c73495
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 18:34:29.9613 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HDEOrFHukTA+AMHhCnLqKUGKkSGB00OU6OuahqyiNKN8qqPcv68kWpAdcCmFcjJxJku4jkBcuKxYFNWA0FSWRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4692
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

On Fri, Sep 06, 2024 at 05:08:20PM -0700, Matt Roper wrote:
> Stop using GT pointers for register access.
> 

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_oa.c | 48 +++++++++++++++++++++-----------------
>  1 file changed, 27 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> index 63286ed8457f..75c3b587954f 100644
> --- a/drivers/gpu/drm/xe/xe_oa.c
> +++ b/drivers/gpu/drm/xe/xe_oa.c
> @@ -176,7 +176,7 @@ static const struct xe_oa_regs *__oa_regs(struct xe_oa_stream *stream)
>  
>  static u32 xe_oa_hw_tail_read(struct xe_oa_stream *stream)
>  {
> -	return xe_mmio_read32(stream->gt, __oa_regs(stream)->oa_tail_ptr) &
> +	return xe_mmio_read32(&stream->gt->mmio, __oa_regs(stream)->oa_tail_ptr) &
>  		OAG_OATAILPTR_MASK;
>  }
>  
> @@ -366,7 +366,7 @@ static int xe_oa_append_reports(struct xe_oa_stream *stream, char __user *buf,
>  		struct xe_reg oaheadptr = __oa_regs(stream)->oa_head_ptr;
>  
>  		spin_lock_irqsave(&stream->oa_buffer.ptr_lock, flags);
> -		xe_mmio_write32(stream->gt, oaheadptr,
> +		xe_mmio_write32(&stream->gt->mmio, oaheadptr,
>  				(head + gtt_offset) & OAG_OAHEADPTR_MASK);
>  		stream->oa_buffer.head = head;
>  		spin_unlock_irqrestore(&stream->oa_buffer.ptr_lock, flags);
> @@ -377,22 +377,23 @@ static int xe_oa_append_reports(struct xe_oa_stream *stream, char __user *buf,
>  
>  static void xe_oa_init_oa_buffer(struct xe_oa_stream *stream)
>  {
> +	struct xe_mmio *mmio = &stream->gt->mmio;
>  	u32 gtt_offset = xe_bo_ggtt_addr(stream->oa_buffer.bo);
>  	u32 oa_buf = gtt_offset | OABUFFER_SIZE_16M | OAG_OABUFFER_MEMORY_SELECT;
>  	unsigned long flags;
>  
>  	spin_lock_irqsave(&stream->oa_buffer.ptr_lock, flags);
>  
> -	xe_mmio_write32(stream->gt, __oa_regs(stream)->oa_status, 0);
> -	xe_mmio_write32(stream->gt, __oa_regs(stream)->oa_head_ptr,
> +	xe_mmio_write32(mmio, __oa_regs(stream)->oa_status, 0);
> +	xe_mmio_write32(mmio, __oa_regs(stream)->oa_head_ptr,
>  			gtt_offset & OAG_OAHEADPTR_MASK);
>  	stream->oa_buffer.head = 0;
>  	/*
>  	 * PRM says: "This MMIO must be set before the OATAILPTR register and after the
>  	 * OAHEADPTR register. This is to enable proper functionality of the overflow bit".
>  	 */
> -	xe_mmio_write32(stream->gt, __oa_regs(stream)->oa_buffer, oa_buf);
> -	xe_mmio_write32(stream->gt, __oa_regs(stream)->oa_tail_ptr,
> +	xe_mmio_write32(mmio, __oa_regs(stream)->oa_buffer, oa_buf);
> +	xe_mmio_write32(mmio, __oa_regs(stream)->oa_tail_ptr,
>  			gtt_offset & OAG_OATAILPTR_MASK);
>  
>  	/* Mark that we need updated tail pointer to read from */
> @@ -440,21 +441,23 @@ static void xe_oa_enable(struct xe_oa_stream *stream)
>  	val = __format_to_oactrl(format, regs->oa_ctrl_counter_select_mask) |
>  		__oa_ccs_select(stream) | OAG_OACONTROL_OA_COUNTER_ENABLE;
>  
> -	xe_mmio_write32(stream->gt, regs->oa_ctrl, val);
> +	xe_mmio_write32(&stream->gt->mmio, regs->oa_ctrl, val);
>  }
>  
>  static void xe_oa_disable(struct xe_oa_stream *stream)
>  {
> -	xe_mmio_write32(stream->gt, __oa_regs(stream)->oa_ctrl, 0);
> -	if (xe_mmio_wait32(stream->gt, __oa_regs(stream)->oa_ctrl,
> +	struct xe_mmio *mmio = &stream->gt->mmio;
> +
> +	xe_mmio_write32(mmio, __oa_regs(stream)->oa_ctrl, 0);
> +	if (xe_mmio_wait32(mmio, __oa_regs(stream)->oa_ctrl,
>  			   OAG_OACONTROL_OA_COUNTER_ENABLE, 0, 50000, NULL, false))
>  		drm_err(&stream->oa->xe->drm,
>  			"wait for OA to be disabled timed out\n");
>  
>  	if (GRAPHICS_VERx100(stream->oa->xe) <= 1270 && GRAPHICS_VERx100(stream->oa->xe) != 1260) {
>  		/* <= XE_METEORLAKE except XE_PVC */
> -		xe_mmio_write32(stream->gt, OA_TLB_INV_CR, 1);
> -		if (xe_mmio_wait32(stream->gt, OA_TLB_INV_CR, 1, 0, 50000, NULL, false))
> +		xe_mmio_write32(mmio, OA_TLB_INV_CR, 1);
> +		if (xe_mmio_wait32(mmio, OA_TLB_INV_CR, 1, 0, 50000, NULL, false))
>  			drm_err(&stream->oa->xe->drm,
>  				"wait for OA tlb invalidate timed out\n");
>  	}
> @@ -477,7 +480,7 @@ static int __xe_oa_read(struct xe_oa_stream *stream, char __user *buf,
>  			size_t count, size_t *offset)
>  {
>  	/* Only clear our bits to avoid side-effects */
> -	stream->oa_status = xe_mmio_rmw32(stream->gt, __oa_regs(stream)->oa_status,
> +	stream->oa_status = xe_mmio_rmw32(&stream->gt->mmio, __oa_regs(stream)->oa_status,
>  					  OASTATUS_RELEVANT_BITS, 0);
>  	/*
>  	 * Signal to userspace that there is non-zero OA status to read via
> @@ -748,7 +751,8 @@ static int xe_oa_configure_oac_context(struct xe_oa_stream *stream, bool enable)
>  	int err;
>  
>  	/* Set ccs select to enable programming of OAC_OACONTROL */
> -	xe_mmio_write32(stream->gt, __oa_regs(stream)->oa_ctrl, __oa_ccs_select(stream));
> +	xe_mmio_write32(&stream->gt->mmio, __oa_regs(stream)->oa_ctrl,
> +			__oa_ccs_select(stream));
>  
>  	/* Modify stream hwe context image with regs_context */
>  	err = xe_oa_modify_ctx_image(stream, stream->exec_q->lrc[0],
> @@ -784,6 +788,7 @@ static u32 oag_configure_mmio_trigger(const struct xe_oa_stream *stream, bool en
>  
>  static void xe_oa_disable_metric_set(struct xe_oa_stream *stream)
>  {
> +	struct xe_mmio *mmio = &stream->gt->mmio;
>  	u32 sqcnt1;
>  
>  	/*
> @@ -797,7 +802,7 @@ static void xe_oa_disable_metric_set(struct xe_oa_stream *stream)
>  					  _MASKED_BIT_DISABLE(DISABLE_DOP_GATING));
>  	}
>  
> -	xe_mmio_write32(stream->gt, __oa_regs(stream)->oa_debug,
> +	xe_mmio_write32(mmio, __oa_regs(stream)->oa_debug,
>  			oag_configure_mmio_trigger(stream, false));
>  
>  	/* disable the context save/restore or OAR counters */
> @@ -805,13 +810,13 @@ static void xe_oa_disable_metric_set(struct xe_oa_stream *stream)
>  		xe_oa_configure_oa_context(stream, false);
>  
>  	/* Make sure we disable noa to save power. */
> -	xe_mmio_rmw32(stream->gt, RPM_CONFIG1, GT_NOA_ENABLE, 0);
> +	xe_mmio_rmw32(mmio, RPM_CONFIG1, GT_NOA_ENABLE, 0);
>  
>  	sqcnt1 = SQCNT1_PMON_ENABLE |
>  		 (HAS_OA_BPC_REPORTING(stream->oa->xe) ? SQCNT1_OABPC : 0);
>  
>  	/* Reset PMON Enable to save power. */
> -	xe_mmio_rmw32(stream->gt, XELPMP_SQCNT1, sqcnt1, 0);
> +	xe_mmio_rmw32(mmio, XELPMP_SQCNT1, sqcnt1, 0);
>  }
>  
>  static void xe_oa_stream_destroy(struct xe_oa_stream *stream)
> @@ -939,6 +944,7 @@ static u32 oag_report_ctx_switches(const struct xe_oa_stream *stream)
>  
>  static int xe_oa_enable_metric_set(struct xe_oa_stream *stream)
>  {
> +	struct xe_mmio *mmio = &stream->gt->mmio;
>  	u32 oa_debug, sqcnt1;
>  	int ret;
>  
> @@ -965,12 +971,12 @@ static int xe_oa_enable_metric_set(struct xe_oa_stream *stream)
>  			OAG_OA_DEBUG_DISABLE_START_TRG_2_COUNT_QUAL |
>  			OAG_OA_DEBUG_DISABLE_START_TRG_1_COUNT_QUAL;
>  
> -	xe_mmio_write32(stream->gt, __oa_regs(stream)->oa_debug,
> +	xe_mmio_write32(mmio, __oa_regs(stream)->oa_debug,
>  			_MASKED_BIT_ENABLE(oa_debug) |
>  			oag_report_ctx_switches(stream) |
>  			oag_configure_mmio_trigger(stream, true));
>  
> -	xe_mmio_write32(stream->gt, __oa_regs(stream)->oa_ctx_ctrl, stream->periodic ?
> +	xe_mmio_write32(mmio, __oa_regs(stream)->oa_ctx_ctrl, stream->periodic ?
>  			(OAG_OAGLBCTXCTRL_COUNTER_RESUME |
>  			 OAG_OAGLBCTXCTRL_TIMER_ENABLE |
>  			 REG_FIELD_PREP(OAG_OAGLBCTXCTRL_TIMER_PERIOD_MASK,
> @@ -984,7 +990,7 @@ static int xe_oa_enable_metric_set(struct xe_oa_stream *stream)
>  	sqcnt1 = SQCNT1_PMON_ENABLE |
>  		 (HAS_OA_BPC_REPORTING(stream->oa->xe) ? SQCNT1_OABPC : 0);
>  
> -	xe_mmio_rmw32(stream->gt, XELPMP_SQCNT1, 0, sqcnt1);
> +	xe_mmio_rmw32(mmio, XELPMP_SQCNT1, 0, sqcnt1);
>  
>  	/* Configure OAR/OAC */
>  	if (stream->exec_q) {
> @@ -1533,7 +1539,7 @@ u32 xe_oa_timestamp_frequency(struct xe_gt *gt)
>  	case XE_PVC:
>  	case XE_METEORLAKE:
>  		xe_pm_runtime_get(gt_to_xe(gt));
> -		reg = xe_mmio_read32(gt, RPM_CONFIG0);
> +		reg = xe_mmio_read32(&gt->mmio, RPM_CONFIG0);
>  		xe_pm_runtime_put(gt_to_xe(gt));
>  
>  		shift = REG_FIELD_GET(RPM_CONFIG0_CTC_SHIFT_PARAMETER_MASK, reg);
> @@ -2349,7 +2355,7 @@ static void __xe_oa_init_oa_units(struct xe_gt *gt)
>  		}
>  
>  		/* Ensure MMIO trigger remains disabled till there is a stream */
> -		xe_mmio_write32(gt, u->regs.oa_debug,
> +		xe_mmio_write32(&gt->mmio, u->regs.oa_debug,
>  				oag_configure_mmio_trigger(NULL, false));
>  
>  		/* Set oa_unit_ids now to ensure ids remain contiguous */
> -- 
> 2.45.2
> 
