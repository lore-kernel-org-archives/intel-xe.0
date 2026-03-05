Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 012FBF33A6B
	for <intel-xe@archiver.kernel.org>; Thu,  5 Mar 2026 14:18:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA49F10EBC2;
	Thu,  5 Mar 2026 14:18:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M8RJwj/s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9E7410EBC2
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Mar 2026 14:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772720284; x=1804256284;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=KrePf2HCNRCByJIT8A93CMRWjpGW07/Mji4n0PEEd1c=;
 b=M8RJwj/s25A+aZSvJJsdVvkfR72qeo9TSlMkjdW8E7REXtYfzaEiZwhH
 aNiHAJ4ag0sFVT/dF9Nihe5RBcegRwawxHwVqcxcP4U2D43LJQ1rpbz1H
 rySIOkzDO+ogs+WmFWplU3+nBHMElOyMbHIbXIRwRV3XzxlBHWRclixoP
 zzny1EBmSiU3wVjXCzUj/kqzMuLbnE/6Rferi9iBqTOknejdxKzmo7kXv
 kZ4DqEeu0XZMYg+xPncSlEo7lhVWF+Cimr3KicfEe79Q9Y8TSJpMu8KIW
 GvFemgzQ25ioq6r01/KoYdUp3hvzXqze4SEialjxqClP/LYMRrc1lWhXL g==;
X-CSE-ConnectionGUID: IZ3X1lnwSbSeU1lYCozV9w==
X-CSE-MsgGUID: kI68R24fS+afQwOycZ/QMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="76408587"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; d="scan'208";a="76408587"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 06:18:03 -0800
X-CSE-ConnectionGUID: /ne8Dyf7ToSeDX02FIyeSw==
X-CSE-MsgGUID: VECgs0STQKmXcyd6qOYFXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; d="scan'208";a="218825746"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 06:18:03 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 5 Mar 2026 06:18:02 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 5 Mar 2026 06:18:02 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.17) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 5 Mar 2026 06:18:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tcsIVAsl2r0hE3UU3f9tqBZyitazKxeayywVtpGfBBfOAiQBnR61vTP3GIMbB0J7sHToiWTyMO9EQrpMh2dha0yx6R9T+95oazdXP/tNzyW3AwQ56kmSG43ttViAEiGBRVUD+V4QUPpztOqNOu3ZpNFzNYayszka/JIxaztnuU/qhHtsNDDEBdB7UsojYKYxxPnnjpcQBzOzgpqrbUtRLWGRPmiSCqLO2irBRewwj6j+8rECj8pU+N3bK7cHizV8/C4svN5KNd81KRoAFtMmH+CwYaX6ir3iTLMS18uk0LzQS59Cuy6mto3obz7BDADdDUTW3oVC4aXipA6tyM1tqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hrectertUJDICuoDvxYQG11/tzJZUf+ZcPaCEj6k3Vk=;
 b=nKlhr6zNDRJavrArLPIFzzf1lCYxjpFvwup+tcnC4gKgIbdLtG1IE6Fe5oHJsYg9guhnHtlfoOjpGKbHly8O4YTRGOQvigk+3EHceguI+6cBOd/SdsBoIllYmEGCluPEvIzuVuX3bNmmqTkHn4XZQ5YKccXW8EQJDg7aQBD8qGstI1+kXvh+QQi22eIU254Al8aVh9zx7A/8Z/RpU5bsZa0iZkVXU+jaTztnUzj3HOj6pwpB5sNv8SmjsJ9RLkpTVGKkJ1/pKV6QddO7A5hx+hl+eX50S0arHD9YyI9WKEwNWRmv195EwpR1IGgY9t5sWuow4ZkswRoQBOfwS/ESZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by IA4PR11MB8913.namprd11.prod.outlook.com (2603:10b6:208:565::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 14:17:59 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1171:db4d:d6ad:3277]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1171:db4d:d6ad:3277%3]) with mapi id 15.20.9678.016; Thu, 5 Mar 2026
 14:17:59 +0000
Date: Thu, 5 Mar 2026 15:17:54 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <stuart.summers@intel.com>,
 <arvind.yadav@intel.com>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v3 01/25] drm/xe: Drop struct xe_migrate_pt_update
 argument from populate/clear vfuns
Message-ID: <aamQkuh4ICWIglYu@fdugast-desk>
References: <20260228013501.106680-1-matthew.brost@intel.com>
 <20260228013501.106680-2-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260228013501.106680-2-matthew.brost@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DUZPR01CA0318.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::7) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|IA4PR11MB8913:EE_
X-MS-Office365-Filtering-Correlation-Id: e5adb98c-f0ff-47d9-424d-08de7ac20105
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: y+ArRbVjFb8zTTDgyxK8ktkWK1gWN9U+2Q8JmNc8sExvH3KkXsaMyZKDXtl4rao5fohbcQILw8f658xTUtDSJS7gyhHiw7ycssWLLCY5WqsDTJRXJjlGhdM2P5erauIiDev+2bMSW/VZw8R/5LDNztTJsx/emHSmlFfNxaRphEW4g8wSBrvUw+rtX5k9Vys9IzFWt2oJADYLOm9dKQEKihUOsS5PClxF3l1bIFGSzB/Cp6nTYhpfy3n4pjH3gkR6LEgATTvmiHiMBulbtXH53tzxWLYVI7YjFjwqCYNoCBJSZ9Ddx7d7OnHBiK2wosTak1yjtTzejtcA60e82Red0/UtV5/aaKeVgLkPUrY9I/apaPbP/JDSBFirJX006MhPtBPizCGv/0++UXvy4lWlrN6FlBxFtF63ud5rnIR3H4Z2DGPJijLGlYDCbwcr6NiAdgyIm17kyRkMSY25kx/S9hhDpSzJEmUFwQBdwczoHnL4gH5oXzFeYN24KL4hx8VAKN0LBVn7kPB2ngjhbNmt16XH3bEdtMcHPI0P9rZxdj15xJ14TrXvHCSpwNstcFh5XrS17HRO0CRfA5c58rhI6Hu9Reb4Ya5qgZy0UhjKEsno3WB9rsypGVXJGjAfIdL0L8Sti14xiCQsXGfLOqP1fusPdciiCrAh80eD6Lkx3GFzkb0HKh0P81gpIBnQ/6SgXspGteSbjpCUpLjKcVkpT9VqNgooz/IKQPHlLd+vR0c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BPiR5DhUHq4/tXFRAVwQ2+XXkucYPtSuruV/97unVme0bWgL/Mqx5gDH3GsG?=
 =?us-ascii?Q?Zxj/R7PsMyQ27Jciqvl5y0rjs3L6kWINh3jXOuBg/eUklkHmIHrPyGvN7E8w?=
 =?us-ascii?Q?W66pHUHVS+B3Qv6DLi9U7988b+4CBV/OYn7kk4np0+53gxjdUosf5Irw/z29?=
 =?us-ascii?Q?2d8KuaKbs75UoARxvr01eW+QrI81VoSNuezLifUUjdLi3PRpOk697isCj+5K?=
 =?us-ascii?Q?Kka/OPEeTgqZtr4nKqRktpuGNRpcAL06XIFlUqnE8botk5ub5k7kdO9ivO2x?=
 =?us-ascii?Q?zPLFoJLT8kegFdztGy9va3fALH/D3mg2xO93Ykrg155NWu+v7gaq1w/8Osz9?=
 =?us-ascii?Q?7T1gp8yTPVEjvfk9r5WY1jMpv4GH7I/BpPluiTCI6v6h62iltUsQINMIB8rW?=
 =?us-ascii?Q?7Qa0zxI+BLZYRO0SovwSrC7C44qq0t6N7NSTHRWl9zthBI/kCXgNWxA2MsCf?=
 =?us-ascii?Q?+BTg3QqyDxAkA+qIOt25qyr0V9HU9j3f6nianQkHMQKLXwj10ai+CaikXwTX?=
 =?us-ascii?Q?fFWjbBYolf27X9GXmcnYTKZ6tLRyrzEiMw9nkE5bdHUpFy6GnsFhgpQcpRLu?=
 =?us-ascii?Q?cV8zlWFldaoBs1IPkmxmplQezwuJGRzHCaQfflpesz0VbXWpqozR0uS4qsko?=
 =?us-ascii?Q?l1F46pEWTi2HLGoC4xIXsWNc3OjCehoOzy4jTG3UFkuM34RuEtEvuvA5noF9?=
 =?us-ascii?Q?sW51cKs5FiFZUnLlOkk1e3kBgPKfFMVV7IxsbCIikiaUUPyqmQ9wQVTvBIuv?=
 =?us-ascii?Q?U3EnZx0wZ5RTeoGE51AsK06QzcLnA32aGxFbsiGvRkdLeCk8XtD8r5kh//BZ?=
 =?us-ascii?Q?OFLl6VchcGRipBz4cLIwbkeliCvdKTGJ3nhtHxA/rn4UJag/YRccyS0JTift?=
 =?us-ascii?Q?hA+MONxi23Xn4QV8GoE+wQZXtFOqHaJ877LH0YqTw5ucEZa99IyjZOaQenya?=
 =?us-ascii?Q?x7s4M4RmdZsmHe6qB5iVFI45ztZ+rKxQRKwHlA0mOHULel14XmQ1wxLyPf0D?=
 =?us-ascii?Q?RTZQRO4uYTGgoL5glv4Iv0Ii7al0UI33nGvVpUiqKJ4LnNeA/clTN2r79Lr0?=
 =?us-ascii?Q?UQSJyAPi4UdEu96EyEZEmqtwvt7S+8cZjs9EcL5m//RIT+TUI5AuNuBX6khR?=
 =?us-ascii?Q?Igp5rZQ8wkstAwmPujQ7P3MnLs8JBFC7kmdU+knO4Nm+eN+MlY1oa93Q1oYR?=
 =?us-ascii?Q?0AMg2bffdOnJHln1k26Yh3wc5nU/YLTAMJcxDIe3H0JuQlzXUsYHNW4zfu01?=
 =?us-ascii?Q?Jawnomt7U3LfUF0EBzmpI6fPe0tg5hUK2ZkLSSVpMzuJSJ+BG+dzbt1Ecvcb?=
 =?us-ascii?Q?xwcsxdB8frN/5vaFoG2AIyNDW/x1bQ/Ld6XSi7sMXjNjhp6nXYryJ7i+0/qN?=
 =?us-ascii?Q?WqpCZw3JTIMdJQYzBvSNRHrtQeimCFSbdZCY3PMnDPDLlZ+nC3ysXKovU8CH?=
 =?us-ascii?Q?i89urTFqUITRwcf5bwhqNbq61cZzaQMAgj1wie00tXSJjssxw9vhDQULPTqh?=
 =?us-ascii?Q?Fv4uKC9cZC+JIbJWQNoiHbKkxhOFu+VwN1LVrz+zBAo5dx6iC+Fz5GDpE6dB?=
 =?us-ascii?Q?x3RlxzzAxm+hzRLRcv4jtE6DBJOOzuy5UDPF92t1gIX8fTxX490gjy0Rw4/m?=
 =?us-ascii?Q?kefFArx7KUmJ1A02yy7EWsfGTSyTBdJ/TI01WAp6T3p9CBU9XeLcjSWxO0Kr?=
 =?us-ascii?Q?KKsG/YBxfgyH9V2oNG3Qizpq271Fgcn2FuSaplsqMigbx5CAcgov7Uy3iG6t?=
 =?us-ascii?Q?wbmUqViWuofyaBnxMRn0flbZOsXgKAg=3D?=
X-Exchange-RoutingPolicyChecked: LI1ljI9eqo130vvpGQCUnlsn+2QZhw14cRUXNDXdib1fVniT79L33H6aSpc1qpcd/WXL+AGMCAYFGvYWpZUaDZIl6PIfhFbJOy0B4k9bmdhO6znAYYhLgPdPn9sTu/xv2LVkw5bzeE4j8uE+qPWJr9J9opH1bZgsvDPFksEbwIqCJqDF5QCo+MTQUlrG2prUWwdaq/R0WT2reBWEqUFDKBL/ya4eOc4MYDjwP/STmJ84gR/doLlDbHmKw+t74uIAk40+U9JDL0/tfj7JDmkmOVxZp6iyq9vn7hAp+lG+FiZrlhCqhlU+S+s9mEwmYoWj130+mLyOTWzGryODKEKeOg==
X-MS-Exchange-CrossTenant-Network-Message-Id: e5adb98c-f0ff-47d9-424d-08de7ac20105
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 14:17:59.4932 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1cAkrQkPNAfbpHezXFmNtjdwa1+6kkHw9HygFbomO6zBOI/nurN5Kgu/Xh7rh+FNQOk+Wai+Gp4ZTlj5BJrHZogRT7WmoOfeSVYB1xYOrIo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB8913
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

On Fri, Feb 27, 2026 at 05:34:37PM -0800, Matthew Brost wrote:
> Remove the xe_migrate_pt_update argument from the populate and clear
> vfuns. This structure will not be available in run_job, where CPU binds
> will be implemented. The populate path no longer needs it, and the clear
> path already uses the VM field instead.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_migrate.c |  9 +++++----
>  drivers/gpu/drm/xe/xe_migrate.h | 12 +++++-------
>  drivers/gpu/drm/xe/xe_pt.c      | 12 +++++-------
>  3 files changed, 15 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 8af6c347bea8..f7e3a044bd78 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -1656,6 +1656,7 @@ static void write_pgtable(struct xe_tile *tile, struct xe_bb *bb, u64 ppgtt_ofs,
>  			  struct xe_migrate_pt_update *pt_update)
>  {
>  	const struct xe_migrate_pt_update_ops *ops = pt_update->ops;
> +	struct xe_vm *vm = pt_update->vops->vm;
>  	u32 chunk;
>  	u32 ofs = update->ofs, size = update->qwords;
>  
> @@ -1687,10 +1688,10 @@ static void write_pgtable(struct xe_tile *tile, struct xe_bb *bb, u64 ppgtt_ofs,
>  		bb->cs[bb->len++] = lower_32_bits(addr);
>  		bb->cs[bb->len++] = upper_32_bits(addr);
>  		if (pt_op->bind)
> -			ops->populate(pt_update, tile, NULL, bb->cs + bb->len,
> +			ops->populate(tile, NULL, bb->cs + bb->len,
>  				      ofs, chunk, update);
>  		else
> -			ops->clear(pt_update, tile, NULL, bb->cs + bb->len,
> +			ops->clear(vm, tile, NULL, bb->cs + bb->len,
>  				   ofs, chunk, update);
>  
>  		bb->len += chunk * 2;
> @@ -1747,12 +1748,12 @@ xe_migrate_update_pgtables_cpu(struct xe_migrate *m,
>  				&pt_op->entries[j];
>  
>  			if (pt_op->bind)
> -				ops->populate(pt_update, m->tile,
> +				ops->populate(m->tile,
>  					      &update->pt_bo->vmap, NULL,
>  					      update->ofs, update->qwords,
>  					      update);
>  			else
> -				ops->clear(pt_update, m->tile,
> +				ops->clear(vm, m->tile,
>  					   &update->pt_bo->vmap, NULL,
>  					   update->ofs, update->qwords, update);
>  		}
> diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
> index 1522afb37dcf..c3c0740f908d 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.h
> +++ b/drivers/gpu/drm/xe/xe_migrate.h
> @@ -40,7 +40,6 @@ enum xe_migrate_copy_dir {
>  struct xe_migrate_pt_update_ops {
>  	/**
>  	 * @populate: Populate a command buffer or page-table with ptes.
> -	 * @pt_update: Embeddable callback argument.
>  	 * @tile: The tile for the current operation.
>  	 * @map: struct iosys_map into the memory to be populated.
>  	 * @pos: If @map is NULL, map into the memory to be populated.
> @@ -52,13 +51,12 @@ struct xe_migrate_pt_update_ops {
>  	 * page-table system to populate command buffers or shared
>  	 * page-tables with PTEs.
>  	 */
> -	void (*populate)(struct xe_migrate_pt_update *pt_update,
> -			 struct xe_tile *tile, struct iosys_map *map,
> +	void (*populate)(struct xe_tile *tile, struct iosys_map *map,
>  			 void *pos, u32 ofs, u32 num_qwords,
>  			 const struct xe_vm_pgtable_update *update);
>  	/**
>  	 * @clear: Clear a command buffer or page-table with ptes.
> -	 * @pt_update: Embeddable callback argument.
> +	 * @vm: VM being updated
>  	 * @tile: The tile for the current operation.
>  	 * @map: struct iosys_map into the memory to be populated.
>  	 * @pos: If @map is NULL, map into the memory to be populated.
> @@ -70,9 +68,9 @@ struct xe_migrate_pt_update_ops {
>  	 * page-table system to populate command buffers or shared
>  	 * page-tables with PTEs.
>  	 */
> -	void (*clear)(struct xe_migrate_pt_update *pt_update,
> -		      struct xe_tile *tile, struct iosys_map *map,
> -		      void *pos, u32 ofs, u32 num_qwords,
> +	void (*clear)(struct xe_vm *vm, struct xe_tile *tile,
> +		      struct iosys_map *map, void *pos, u32 ofs,
> +		      u32 num_qwords,
>  		      const struct xe_vm_pgtable_update *update);
>  
>  	/**
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 13b355fadd58..99b15d37267f 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -980,9 +980,8 @@ bool xe_pt_zap_ptes_range(struct xe_tile *tile, struct xe_vm *vm,
>  }
>  
>  static void
> -xe_vm_populate_pgtable(struct xe_migrate_pt_update *pt_update, struct xe_tile *tile,
> -		       struct iosys_map *map, void *data,
> -		       u32 qword_ofs, u32 num_qwords,
> +xe_vm_populate_pgtable(struct xe_tile *tile, struct iosys_map *map,
> +		       void *data, u32 qword_ofs, u32 num_qwords,
>  		       const struct xe_vm_pgtable_update *update)
>  {
>  	struct xe_pt_entry *ptes = update->pt_entries;
> @@ -1811,12 +1810,11 @@ static unsigned int xe_pt_stage_unbind(struct xe_tile *tile,
>  }
>  
>  static void
> -xe_migrate_clear_pgtable_callback(struct xe_migrate_pt_update *pt_update,
> -				  struct xe_tile *tile, struct iosys_map *map,
> -				  void *ptr, u32 qword_ofs, u32 num_qwords,
> +xe_migrate_clear_pgtable_callback(struct xe_vm *vm, struct xe_tile *tile,
> +				  struct iosys_map *map, void *ptr,
> +				  u32 qword_ofs, u32 num_qwords,
>  				  const struct xe_vm_pgtable_update *update)
>  {
> -	struct xe_vm *vm = pt_update->vops->vm;
>  	u64 empty = __xe_pt_empty_pte(tile, vm, update->pt->level);
>  	int i;
>  
> -- 
> 2.34.1
> 
