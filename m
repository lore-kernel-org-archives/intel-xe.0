Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4633ED185FE
	for <intel-xe@archiver.kernel.org>; Thu,  8 Jan 2026 14:36:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A2E910E752;
	Thu,  8 Jan 2026 14:36:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BJLImf08";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C81DE10E752
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Jan 2026 14:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767882964; x=1799418964;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=lICdXhsvi9s6KqZ35xr2rcGtrdyeGGCTfR0OekU9h6U=;
 b=BJLImf08nXRRVAi6am34cAG46reWklXOmgd/EncWH/8Af/03I00tMHv8
 MzpIj1Le/wnYR00h4nwle6QzXCzc00tEtGazq+JhjpvPAsLGn0pwUGUpi
 3K2cLtWYmO89YUU+1SaSBQ5JqX2hygdaiDJq0vsUAhJxRQ/9tNDTWEgS8
 ZAsSyD7N6oHeunbJqEq7NahSPSK7VVq9z+waxxwA9etcH6TgPSLFS3VTX
 ze5Vb9qs5O6YTp/wbbVKtqhgBB6CtFvghzmQJHrVkkc/xtXvYWRUqAe0J
 YjKl6mhS3/qy4zSC++oOtslaLVzadqwwpROsOk/7HeTOq54R/U4mK/OmE A==;
X-CSE-ConnectionGUID: GlU/P8c5Q6urm97THmGHOQ==
X-CSE-MsgGUID: MPe2kJvFQxiHycViIu11Ow==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="68455612"
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; d="scan'208";a="68455612"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2026 06:36:04 -0800
X-CSE-ConnectionGUID: 6NlOhhwxTwqSKA880aWtKg==
X-CSE-MsgGUID: pCJX0zGdTMGR/w4ADeCmxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; d="scan'208";a="208059572"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2026 06:36:04 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 8 Jan 2026 06:36:04 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 8 Jan 2026 06:36:04 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.26) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 8 Jan 2026 06:36:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=orwJQYropDl5NC48Unv5d2skK2EK+rIKQu83d+eg17hOM7En44uy3ermC6VRP6byP89ZwC/EyLqKyExGD0HBtzlwn35jcpZRKPaBlrxPEQR04GNagkyz8It0lr8wWQq3obyrMyTLVZAuL953XDaB1UvVY8kdJfZZOj+mMaLf7QOV4VN97vQIszFnbyhYSw7gLBItkqlAeXh0GA9ink0xy23b2zSCaOynbkxzN9RvdjJSH0xSBjsidWSn2uVYVh2E5eMwbNeV1t67k33OZk+fIOZ8w17yF8r8BC5bcVsZEVbzGEnzTtoqk3YM0bnHSKwIl459z7a+8LxFg/x87jm9lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lhUSHf7wTvQlMiPE0XAKWcOG0z1Aepsz7LCB3RAiUwc=;
 b=LzLADxYQO5O2BUSVfZz575tLA7NbKrrk+6fquVC9Y/EFnfD/K6cCGVMBTHYMQPQwf7VlFAnHL7mSwr74Qp+S2V3dH7Jyvku3G5NeYPZGMnIOcI+KhyjV6m2R8aJrW7/lh4KbvBsCM+bT3RANuw+vNXD1bENqnEFv4uvMkv1mldY6u1s61hiPO5NKxUv1C842iW2OZOBshYuJVlkHh+Ab+BYTlFT66Q90seVwxwrQ7yhU9p9LwnT7vCh81HTi6+/K/IqEcZoFeN+FbGJ3ekSEsUf9r7uCLI3p1yVCPZyn48Xz0hGqsctRuV74KzXdA/YNkLg8PR6jR+GDSonlFIlywg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by IA3PR11MB8920.namprd11.prod.outlook.com (2603:10b6:208:578::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Thu, 8 Jan
 2026 14:36:02 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9499.003; Thu, 8 Jan 2026
 14:36:02 +0000
Date: Thu, 8 Jan 2026 09:35:58 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Julia Filipchuk
 <julia.filipchuk@intel.com>
Subject: Re: [PATCH 3/3] drm/xe/ptl: Enable PXP for PTL
Message-ID: <aV_AznHw9Ro92Xh9@intel.com>
References: <20260108011340.2562349-5-daniele.ceraolospurio@intel.com>
 <20260108011340.2562349-8-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260108011340.2562349-8-daniele.ceraolospurio@intel.com>
X-ClientProxiedBy: SJ0PR05CA0154.namprd05.prod.outlook.com
 (2603:10b6:a03:339::9) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|IA3PR11MB8920:EE_
X-MS-Office365-Filtering-Correlation-Id: ea93760d-860b-40da-601d-08de4ec33f2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vyvHonx7HeUqn+Wt7lt8bmjaqiFa/HxxPRyJ7MViOwvYOoV+uz8UTht5HyfE?=
 =?us-ascii?Q?0hbbvzInI51PPD5UlyQ1YwiumYGFgFusEIp4Vc1pQaL/llCJEz08M6MBjBbl?=
 =?us-ascii?Q?GujLdEimIvEKshelwyBwo5Lt5ti7WJBkXiOgo+ufBp+0Eqj4axVgd/HnPSBL?=
 =?us-ascii?Q?wP4BDCXf2MouJYHv4UMxed4U2e94wQyWmQ4sR5aknn4QiqhopWFsI5ScKMfG?=
 =?us-ascii?Q?DO0TXjdjco1c/sVyEbxTsFLNspRNpRpZm0fKFLOjcaofFcz0w0HO8t8tY3JD?=
 =?us-ascii?Q?BUCL4xF6kEcJN6HRX+klXIXuoC5CGfYOWGuJc/q7oADTcUi8rApXDD3S6S1g?=
 =?us-ascii?Q?cplLiPxMCy7e6bIQuiy38y0qxc8QMhSKZFhSZXjBVvJ7AZ3oUA4y1Ar2IYFh?=
 =?us-ascii?Q?0hcCBSClDH/pD3W2vBTlRlvuU+2JlX1XxyVNiZgAH+E+wrnT353eR9/r9tW/?=
 =?us-ascii?Q?fop9AWPOr2/EwML/M0uwhJtkEWssoiwDUfJDX9QzCf984Es4L1/3ytO6hqQ/?=
 =?us-ascii?Q?q+EpmnsaUxM4I/zVqZPI5nHA9XU4Q7PMCQL0De6C6JQzlYBJ+YpKyQZd0dx+?=
 =?us-ascii?Q?G0c4NxZ4V8aQ+0fv6b7XiA3ecyVKkRnVw41/TUEgij7NfR+pWcCzMTvnftLh?=
 =?us-ascii?Q?QEpnc5vzTKarmqD9g6WZf8Lmp6U2glrZZOoaLINUZQUS9nlXfPF7inY0J4V3?=
 =?us-ascii?Q?fA3KW8+wi9UC/zFuAhM9hJ8P36GGpe82rr9KIzHJGu0Z+sXTm1YG/Df7KH8z?=
 =?us-ascii?Q?WnsFeWePLw12xqHoSsWzU+XKABxmBkSWyG6q8elnZ4yHvkOhnnfAeJIHLuED?=
 =?us-ascii?Q?N6Mg/qFvCIdgHzDoprpsrLcK66vYqaaNiIJoOKjnQ0x7GK//z7j86zonZDKd?=
 =?us-ascii?Q?cbBYYt8MKHHKDytcwjUq2VNcrxvg4GrnlPMD3zKEz92gUl46fUvE5u39GL0X?=
 =?us-ascii?Q?S2/IrvnH5l8+TzSdovKrRgh2Qb/LimExblGMe2xhdVAt/Gv5bTdwr8lP9Gbf?=
 =?us-ascii?Q?DRPk9Aaxevbx0WUHLneKrdhxDCk3fTTxYlS7vxOqrMdi1yS84/g641iDzAap?=
 =?us-ascii?Q?aUpx6dysjmCESxvaC50dGTFVj+PRMK8LbmclowhyjWCwjn22XU0lSjxXuhqc?=
 =?us-ascii?Q?fRR5dkwbpqGJ2mYsO4SOx/mX4xkQshyha2G5kmJMiSmjONuB5VyqABP9M+/b?=
 =?us-ascii?Q?jNfRU+AWrU7U9yc3trkxMzxp83z10kTXzrm6laDpjMGwGTKaJV7/smiitw/I?=
 =?us-ascii?Q?LN7BnNuSO1XdbotNSJeT0Qq4oje7nm5rBMSBwQA0DzKEmH5dJvwSbqjCvz4Q?=
 =?us-ascii?Q?+9VshYGFpdnjYQ+CpI/nIwB57k7DpR7sqkDTL8LgEd1r2LIb8R6fq160MavP?=
 =?us-ascii?Q?WHWhikkA9lWQcGDoVM9VAxJH2OKjqO6R1GBId3PVp6/2Thzam0dEVYGR+MLh?=
 =?us-ascii?Q?Jc0xn3mZLKi/oCZPVDatoHfcGdeV+JCd?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FhlpoB1KPEijr9b4FLaD8cnk45PjzwMcMDAciLbJWt7Dy65hZp0bOjiy97i6?=
 =?us-ascii?Q?pyTldQrl73qRTTRfXA7EqJt7n049LpdbWqPgymX8PE+f8/tJEifY6QaYWqTB?=
 =?us-ascii?Q?3QWnXOkSwFy9Evz8RrdAKcm3p9S5+BucoSROe5wgLJ8R4KeJV0dj3ZFFn6Gc?=
 =?us-ascii?Q?81+OqomdvWhwyHJwRYWdtaFVeZrhLm4R6hNYRiF+unUJ+6fA8HPl1oVYcXfU?=
 =?us-ascii?Q?1uv53LbT1Fm8Gord7tC9eaC7scI/pmPhmdJwX0Rwtcp13FUrvwxr00bKzY7y?=
 =?us-ascii?Q?lOK+5l6MegMupjNIBHKE5IfpXCSWeqk6rd/aRTXdRUi8nfg6dGZPLE4otgLZ?=
 =?us-ascii?Q?hHxWlVTdFOZzJpA7K2ssiKZVxrq8ym+WfbLGkaj+IMydpEY6yeWkOBHPGKGb?=
 =?us-ascii?Q?tBOBIfxqcpiEtUZ7RaWpmhAWcamwV1j+Ok69u/AQ7tfHUCOwelOm3VrwlvzN?=
 =?us-ascii?Q?u97F+fwOoYhhcm0Zgj3bQy/yveSZbGsPwlbd3FRRBuORBJymcmfzI6TJ32jR?=
 =?us-ascii?Q?u9Yzq1ZSSrZRbcneInh26KnJrChPzSd7ZxWbfCY18Nb+dyau4KZgfyaZMJRQ?=
 =?us-ascii?Q?QZhddwsghFFgFQ0gzguTzqvjKuMH55Vov3bPufNFNncSF0G5TxTgNEjL5mZk?=
 =?us-ascii?Q?olmPsVsNa0wf9NNrc9NWrIy8H4y+rQ+MWZnCKnnm6Ik2Xnpc1eM/D75LMBRd?=
 =?us-ascii?Q?toh2cIJTUPPts3UK79GKdSMMWQhUpTzE6AvcSVFVhfFaN4TRl7KTqrYgplxu?=
 =?us-ascii?Q?QSBNcPZ6OQU5jek0MVs3/+Rve3YFS17lrQN6ZLIGraAOayboQY2EF2Rx6jp6?=
 =?us-ascii?Q?9L/5tfjJ5fgOFNsLP9UD6tC84PzKF920HXsy1tRt/OSxRbZhFNMPXzr0YScp?=
 =?us-ascii?Q?JG0EJH1HaX6EIbAChno73fD64xaMd9XCchgzgEcfUTY77Y8iYrzRpa1wXZcJ?=
 =?us-ascii?Q?9luWjX1gN+DtQczlI8PXZFKEqW/nDSE5JobfPla+fgAnzaAuUl12thAOqLwV?=
 =?us-ascii?Q?Z7y2TGkFJgnKMs8mVHk1uqgVy4iG53/LxxJu9I8+TtfNyaPe845ScFWlqzEN?=
 =?us-ascii?Q?ah9Gs8Q41EUtp+N9zErfB/As5HZWDdBkTQJ9lphcK0HLLwzawMJEeXjT/8MB?=
 =?us-ascii?Q?TOlscsBnxttt0FXxOB+r43qwHsbGbtlV+NnwV5DwuqlbuiA1EnpT/k/onc12?=
 =?us-ascii?Q?qBC7wIwUbUmGSFQt4kfyWNaa+SQeZ3ne7oo/aV9t1S5aAmLdqq6ph6oMryOS?=
 =?us-ascii?Q?G09ae29uOXl0HH5ztsdORrrNXGsAdZuTRv2REcDLqk5rR7l+oqcR1xffE2pq?=
 =?us-ascii?Q?jjAnK9FSo8jBn1G1naK3rVgg6fr8A9guCGVS3N6mDOiT+u4+Q5NVueYV6mPe?=
 =?us-ascii?Q?Yers3GfbEaEpftvsCoJ9aa3BDXIAauLhFMtZSM9TR2I9OQMKdEnNnlcQAPl7?=
 =?us-ascii?Q?xVsLy7vfDb9d6zaw3Nu94CEeZV1opXe6loYJCul/mK7up9NJOF9erfH7BG+p?=
 =?us-ascii?Q?37Iwid9AZeE6j9Fq9Ii44KFEBpUqcJchWOAEzRyN3HPErfsxqbvmKov0nKOm?=
 =?us-ascii?Q?heqIBmv2tHj8UvUpeOs5P04F7N6l7deDUlAMOx5DQnsPO6vODFeMrRBdT2Gf?=
 =?us-ascii?Q?nss0Q+ecanbc3KxD5BBTkSVLud/jCkPn3kOmtB1HEFf4xjHB37I2iRXaKhn8?=
 =?us-ascii?Q?A2IFeK/rZ/4vyTMed5aZ5xghabbA0RZm/wy61kP5wxFKmpnTtpG8jac+DcaS?=
 =?us-ascii?Q?CatHU8RTAw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ea93760d-860b-40da-601d-08de4ec33f2a
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 14:36:02.0469 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ER+7oHUUphGRjdTZkfG0gMr9iJRjapNbObeec1krD78TXiOnhgeTm1zY6r19giUNpPrHod09OgAtB5PAl5E3+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB8920
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

On Wed, Jan 07, 2026 at 05:13:44PM -0800, Daniele Ceraolo Spurio wrote:
> Now that the GSC FW is defined, we can enable PXP for PTL. The feature
> will only be turned on if the binary is found on disk.
> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Julia Filipchuk <julia.filipchuk@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pci.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 91e0553a8163..38dd6ee9db12 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -392,6 +392,7 @@ static const struct xe_device_desc ptl_desc = {
>  	.has_sriov = true,
>  	.has_mem_copy_instr = true,
>  	.has_pre_prod_wa = 1,
> +	.has_pxp = true,

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

>  	.max_gt_per_tile = 2,
>  	.needs_scratch = true,
>  	.needs_shared_vf_gt_wq = true,
> -- 
> 2.43.0
> 
