Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D7D7CCFA04
	for <intel-xe@archiver.kernel.org>; Tue,  4 Nov 2025 22:43:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBB5E10E687;
	Tue,  4 Nov 2025 22:43:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UYONx1Q8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0363E10E687
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Nov 2025 22:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762296184; x=1793832184;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=oLWhwMVb5eLEO7K8ihdlvt0W5PTvQWe3wUTg43ft0UM=;
 b=UYONx1Q8WcrvyGkRZwwz2og9og1d/JvFVX8Z/DQzK0i4mGL42GLLLYJ+
 lpoIgTCq55pwcuZAL3o+CoMDI5trhyqPhKtyh/2XT8g5koNew+F9Q1Pxv
 xj4z1K78pHQquodzjs6f27hIQRFp48dZWszNgyyomsu74PNdEuBIISQac
 iPcPs/EneByTyhaEzDuVI+mI6x+pFbYskolFe7ypE0oI8vvj8C7AubsA9
 JFJxeW97RRYVv4+2l6c+6V7vma5t9X7a70+Boyoku/KmDAYgHXJwX6Ti8
 ynJRsiB2fwo1HUOWCfHagnW4fXa6ZYmkU2Rl0GyudjeY7ouzNE1KQKrmA A==;
X-CSE-ConnectionGUID: 8nZDQnPWRWW4gZ162pDHRg==
X-CSE-MsgGUID: cGGQp7o+SbmjLZQIGHo75A==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="68058296"
X-IronPort-AV: E=Sophos;i="6.19,280,1754982000"; d="scan'208";a="68058296"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 14:43:04 -0800
X-CSE-ConnectionGUID: 9e/+viwuRZ2MKGzI86M6EQ==
X-CSE-MsgGUID: ix+XMqH+RaSL58WooeVRkw==
X-ExtLoop1: 1
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 14:43:03 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 4 Nov 2025 14:43:03 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 4 Nov 2025 14:43:03 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.20) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 4 Nov 2025 14:43:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qj4LxMounil4q5KlAkfcoz8X1ffPw3h/j1rhWZdLVYozHvSgRVlIXOJ6RCD/SOOOWGkNXenPrzB4smReuKFXuwF1UQQ3q8L0/P50Qs2d8cfinng+GWm0d8ZxJmFji6nz8ehQ4o5WrjN0uWFP4pVji96+CpW8QZ20T3K1h4HarQxVvwdgonMXS5MSkABLr04pR1+kFXamsH1LwA9M8EhMjd5TCfWy5ovzVLZudywhfQwpFjSwZfmkpV5Vb0eAazsgjglMuLIYSQtVYTbcEJt3KHirfD6wiqwFySzx7IV0CbGVdYQx79jFBt2T1kHjO2XYcV5AZraOO9dm5+rpPwxeBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6gBq+5wTjeUeBUJnTbHd8lzEJeKQDa3e7gFc8Ts9K8c=;
 b=y+i/yScDfItrdPIhJ+iSK8aQIk8VkD27jBXLcoNMhCoPNRZqYUN25TvD06QAxLWuuIxcMBRBAXY2+67/aYb5yEFZ/PJN1WiYAZhwGqWtuMRrTFpmv8gNPCIU4xpPw/VGHa+HHXXtMafXBRmnTAk2TNOnfIrBvJ5Ogj16rpesbJ0irtlSCisL3AN/svLJq3nj0Bkcd1b+G//SL2J0z7e+i66pO11BNhqnisfr+nBNu2nQFFzaGjdr3iHeWnnVTNDJ/5wiZRgwEA2n6gr1FSjz5tDt1sdJ7VAt1Nx45sRMaTY1GdYn6ntPUc314j3aR5D9nTYaF7lQT/Z5R4v15SCMig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH0PR11MB5217.namprd11.prod.outlook.com (2603:10b6:610:e0::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Tue, 4 Nov
 2025 22:42:55 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9275.013; Tue, 4 Nov 2025
 22:42:55 +0000
Date: Tue, 4 Nov 2025 14:42:53 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 01/16] drm/xe/multi_queue: Add multi_queue_enable_mask
 to gt information
Message-ID: <aQqBbaYax4RcGrBo@lstrano-desk.jf.intel.com>
References: <20251104185150.246345-1-niranjana.vishwanathapura@intel.com>
 <20251104185150.246345-2-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251104185150.246345-2-niranjana.vishwanathapura@intel.com>
X-ClientProxiedBy: MW4PR02CA0008.namprd02.prod.outlook.com
 (2603:10b6:303:16d::27) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH0PR11MB5217:EE_
X-MS-Office365-Filtering-Correlation-Id: f096578b-ea54-4ae8-bd01-08de1bf37f17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5F4fXUuKKB1n1fbm+fLPGSqFrydQuqufHCJzuGTTKzqYeiWmDd1VW74HAtBt?=
 =?us-ascii?Q?ytl6iA0BLNIfqAES+P1ZIRa+IKtZvFnO7i9KOJWuExcY2ouV4QWCYtijopUH?=
 =?us-ascii?Q?zPQRg/DUs6xe/EX5irHhhUptU+4Mk5JP/Q5dQOftlKAaLPjzK5ugKyzBIQ3c?=
 =?us-ascii?Q?6Iom1rMvgPZRSpJ59BzFU3YsIzyihsHDRGxQK123LD2C7VJTQKJq/dtWW7U0?=
 =?us-ascii?Q?2lEnnXHo390SbxsDFVzdO5m8tj+1XXH6Ntj5Iu9n8XVk1mDtZc9XQl9B+VJs?=
 =?us-ascii?Q?G7WoG7cvjcPmKSzic4xsxPQpsvx7Ah0JdMJBBNKoGfSC42nU4Oho8CQe5Mey?=
 =?us-ascii?Q?/TfIZRQ23eRYD6qbVs5BDBqtRnf9qzWwREBx2r4bbt1LSzg6XV4bRRbvMe3c?=
 =?us-ascii?Q?rzwZH0Lt4T3YMGpZbkxJ330EigTLFygzCmfb9uQ22nLOkgZca2JCZef26d5Z?=
 =?us-ascii?Q?zv1Esm4PZMWPUGxZSfc7oKsJ/dw9RKbkjBR4f2GNSTNkA/aj84J1lZ3Vt8Yl?=
 =?us-ascii?Q?2kgO5GJcDxfYGamVp+MySj/pPibEtXO6aBcwksHi5VPYZE/r25m/bgVMBnj6?=
 =?us-ascii?Q?ygP8MgxBRUdEZzngFnsOQga5lxaB0LsbCiwSoVx6szoYN07jjEraNBKc+muW?=
 =?us-ascii?Q?sTC50syCn1wekCC4DNVwRqERT3D7vAVJ8JAHyqT5QRdSx+Tn43S6EGxfqgce?=
 =?us-ascii?Q?Mf2qKQ8tMsx/AkbkQ859eukXZ/WLmcK3c3VmViGUiBlBx1Q/JHPnTf2VSG6q?=
 =?us-ascii?Q?9Y+MSfpjsv7S5TUPrbzea8TUvJ2/GlPP8Zw3QWpp9MiEqgMA8DfC9Wyd56Tw?=
 =?us-ascii?Q?pnEdE4ChhF7bvG/eUii73hSuAdVPFmnZa3vPHiL/3NWAGPEwLptmCNgWG6qY?=
 =?us-ascii?Q?kMqe5pnCNMUwHRSS1GukLGHhRefcILklb343uwvWOKiReKJjUOoA6z9tYbEW?=
 =?us-ascii?Q?eJmfSzdQfy3IoRbdtVjpyUJ7oZ78GC+SROCkPzJckdR01dWYFcvaVQWamNRS?=
 =?us-ascii?Q?3B4TzGIES8ATFqdWjbPJ7Y87ul9swuiCyqGQ7mokzpwu/e8wSTzX8fmsKxCw?=
 =?us-ascii?Q?c1ug14oamJeI+sb7I/I5CyInaOLrX93yhI8bV8vFUhAp36Ff1GXGd9qlUf4j?=
 =?us-ascii?Q?hrClVOM5oeZGo48myckF2+Dq1XXLrVhf8GPkQtZONDBdqQdo58DyJ5WsHPIU?=
 =?us-ascii?Q?RNRrji/2nXWP7img1/yD5OZpTHkgsfmRIYHKZ+WphgYojcQqEn4w5w+TaTeE?=
 =?us-ascii?Q?DZNWN9DnYZe1OJOjML+XDO/RbxRSUJ4h0eYH/ssNvG2BkOD8kajUzs/ycQzq?=
 =?us-ascii?Q?9x7GW2mPcNJuWCkCuOWAllFAdRvhW/wEdVqFYyUTFAKIJ4VktLQSGVLDRsz/?=
 =?us-ascii?Q?7CPiiSf8QRxrAG9ULGGOcaB1KkgAF+q2TDV7Kh5YwynKfcMWBuuFxVRefGxf?=
 =?us-ascii?Q?48teEHgpRHBZ2Ks4jrdPl1IpzwvH4c+z?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6XbKFnvVfrqYwMwlH+R0q2wXqiTa16OpblGR4ObwcbvSWMW4JeLyVpt7mztt?=
 =?us-ascii?Q?Gp2XoJWFM/vl6QqQ5/UbFm9qbc5P2YgsiLxYR4g0f4sZ/QqFr72cniOax02K?=
 =?us-ascii?Q?8UVLEYk5OsuS9Ju5h2oqFMIwSYivr2+46WXbneHw561ZcKX+57Gfu75ey5cn?=
 =?us-ascii?Q?me7ERrd+6oGMUcUgMtYVDsAprnxNLlJDJBTnxOyTmE01n7cCHiB2intHuCTj?=
 =?us-ascii?Q?VE1wqPghC1ZGxbKPEjVTudkGv3gKMp6rj4UoYZ1uXE3s8xBHJ40ubkBqrptz?=
 =?us-ascii?Q?TuoNTKCQ+SuSXcfI3jVhdgn6sINvF2KNa7EiuFO0ntIRSacniPnN1Fh6EAWG?=
 =?us-ascii?Q?tpVY/3kgp99PQBZO+xvjl+K2FJ+/4ZwoAgre10oB/OEtix5seAK6gFbq07/N?=
 =?us-ascii?Q?3h1qVOFSGdS/JV1jWE18ZkXyx9in5PnslTPPdNYexh7FG/+rbvmGwI9WP/cw?=
 =?us-ascii?Q?e1TY4Q4uF54gdtmFnDZTmpwur8zR6AFRSR1n0tLW9k2p+1cIlAyYy7eAJcMM?=
 =?us-ascii?Q?xIjyITxMjn6BWCy7YfKP36/sC0Fk4YcIqKme/131cl/MVOcUyfyRNrOQmuIz?=
 =?us-ascii?Q?4jEOG2JVQoddU2MoqjOdD0AEXZ3J3SavTFoi5D1klH9Z3Nab0eNNfMrZNHjT?=
 =?us-ascii?Q?Wb2zew0opQidBLrcOok+M23Nx4tT163Y7nACKUICdPbqF+S598bN92w2z0W6?=
 =?us-ascii?Q?Zf1vqcWkZpNEEPhdTRLBUuj5xxT0hHBXf+zFBZjIyxUOtDR8zZ/D0i098u5b?=
 =?us-ascii?Q?q32Kopc1s/TkmJt2K7aIoK1ZP9NFuOTm50ZkxSMMFQCLj+GMlEXUiP0/rp8J?=
 =?us-ascii?Q?l3Ulw7hV2ptn42DAV5ZhD/VpqV/X4ru320x+LFWgMhLdev5yQS1ClF1CbglF?=
 =?us-ascii?Q?krClbEK2jXOqKIqo8PFANH0MUkrV23jRvO9dDra+sWCdzd6VTBDOI4pyFRpT?=
 =?us-ascii?Q?3AzEeF2ItQBamoBI6nzA7dUhaZE2wiFmWEr32ivVUa5vb4aUd+x23/dX3EiZ?=
 =?us-ascii?Q?aw8QAO6WHxatPKe7VIPiaeRQjOGE4npR1ln2gE8zvF/MBVf25Mgdw8pCjgnM?=
 =?us-ascii?Q?nJkDfvb3ACVaXAcRNAsoLPHgMS/ctiVNAEGEM7dsk3pF0UNVc5x78fubvfXw?=
 =?us-ascii?Q?+XC3Gqjpukb6qCG6InYbS9tmj35P9Mswkw1NhPoVNwWiAeBiy/SGNfmeAytK?=
 =?us-ascii?Q?oio9q+QHs3wb9mS6sJ535uhidrrAQIwoLCXNNRK4yLa1pL7HeLewMgG/HiZc?=
 =?us-ascii?Q?LH7NS721ipqs+ergFpkjRbA7L6EKXvtd3cIEH61aGl/OLVdS8D9/+cWldaUS?=
 =?us-ascii?Q?McDOMkWFjziw+BD9YokCyU6vLZukLKB9NP6gScInQOnnvCO6GRxEcqlgy1gS?=
 =?us-ascii?Q?WMAGolLGBdB5fT6Drir5uUid9cJMV0+VbCHA7+fl6L+wPnDa79LTaGRIs9oW?=
 =?us-ascii?Q?NNG49cK6ooyY5SDZM3eV3zrV84j0yVPuoxLqsNqtTII6rZr9YC+aGy7XZNRZ?=
 =?us-ascii?Q?6I0d3p48hVZXT1P+7+h25z7fOJu4wXj13bEP5cwLsL/scIGFjzVHKk6ts7WR?=
 =?us-ascii?Q?qyODWGEWF+nM4N+jw8bJjar24sggB2pUZ0d4Cbo5bpk9vL3yn04hYWwJm3SD?=
 =?us-ascii?Q?jA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f096578b-ea54-4ae8-bd01-08de1bf37f17
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 22:42:55.8122 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H8PPEZmZ3gnfdqsZZH5zAb2Psw3ZjW9SEQ7yM2BfsgrZRFbim8bdFlcUaEE05bnvuTxT9MovV4FFPo4U7jdEYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5217
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

On Tue, Nov 04, 2025 at 10:51:35AM -0800, Niranjana Vishwanathapura wrote:
> Add multi_queue_enable_mask field to the gt information structure
> which is bitmask of all engine classes with multi queue support
> enabled.
> 
> v2: Rename multi_queue_enable_mask to multi_queue_engine_class_mask
>     (Matt Brost)
> 
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_debugfs.c   | 2 ++
>  drivers/gpu/drm/xe/xe_gt_types.h  | 5 +++++
>  drivers/gpu/drm/xe/xe_pci.c       | 1 +
>  drivers/gpu/drm/xe/xe_pci_types.h | 1 +
>  4 files changed, 9 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> index e91da9589c5f..e1e3f7ddeff7 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -93,6 +93,8 @@ static int info(struct seq_file *m, void *data)
>  			   xe_force_wake_ref(gt_to_fw(gt), XE_FW_GT));
>  		drm_printf(&p, "gt%d engine_mask 0x%llx\n", id,
>  			   gt->info.engine_mask);
> +		drm_printf(&p, "gt%d multi_queue_engine_class_mask 0x%x\n", id,
> +			   gt->info.multi_queue_engine_class_mask);
>  	}
>  
>  	xe_pm_runtime_put(xe);
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index 0a728180b6fe..5318d92fd473 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -140,6 +140,11 @@ struct xe_gt {
>  		u64 engine_mask;
>  		/** @info.gmdid: raw GMD_ID value from hardware */
>  		u32 gmdid;
> +		/**
> +		 * @multi_queue_engine_class_mask: Bitmask of engine classes with
> +		 * multi queue support enabled.
> +		 */
> +		u16 multi_queue_engine_class_mask;
>  		/** @info.id: Unique ID of this GT within the PCI Device */
>  		u8 id;
>  		/** @info.has_indirect_ring_state: GT has indirect ring state support */
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 6e59642e7820..927d3a62c02d 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -754,6 +754,7 @@ static struct xe_gt *alloc_primary_gt(struct xe_tile *tile,
>  	gt->info.type = XE_GT_TYPE_MAIN;
>  	gt->info.id = tile->id * xe->info.max_gt_per_tile;
>  	gt->info.has_indirect_ring_state = graphics_desc->has_indirect_ring_state;
> +	gt->info.multi_queue_engine_class_mask = graphics_desc->multi_queue_engine_class_mask;
>  	gt->info.engine_mask = graphics_desc->hw_engine_mask;
>  
>  	/*
> diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
> index 9892c063a9c5..975e9857f70c 100644
> --- a/drivers/gpu/drm/xe/xe_pci_types.h
> +++ b/drivers/gpu/drm/xe/xe_pci_types.h
> @@ -58,6 +58,7 @@ struct xe_device_desc {
>  
>  struct xe_graphics_desc {
>  	u64 hw_engine_mask;	/* hardware engines provided by graphics IP */
> +	u16 multi_queue_engine_class_mask; /* bitmask of engine classes which support multi queue */
>  
>  	u8 has_asid:1;
>  	u8 has_atomic_enable_pte_bit:1;
> -- 
> 2.43.0
> 
