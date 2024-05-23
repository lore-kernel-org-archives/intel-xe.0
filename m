Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ECDCC25B75
	for <intel-xe@archiver.kernel.org>; Thu, 23 May 2024 20:50:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBE6410F3AE;
	Thu, 23 May 2024 20:50:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PhdGQ3gn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFA4B10F3AE
 for <intel-xe@lists.freedesktop.org>; Thu, 23 May 2024 20:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716497446; x=1748033446;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=K6u980g+c33yTWnkFLlTYc94H0erx6BvNLMzK6/N0gs=;
 b=PhdGQ3gnF1/8PsAM8IRiP6ODlgNqongCkuYCSVVkLYRpewDdByVB+DI9
 gYBT003+nkZbl2hzugDp4T7Q0BSOk9Fey45spRfdbuStdY9RJvoB+TFPM
 VX648A1aXDb/h8wUImIMPRrfv/90kcZ63GQVkfgl8Z4DinFCFythA8wux
 ktqirOOeUXAqAX7LtVK59OANwXoQYnMr9Y7/YMZs7v7wHqSQjDARcm+sd
 Nb37CTz2pOYZunWY3RSNQVpyGyeBg+c9A3E0aOVluhzswFFMHmR+1IRLC
 FPJjpZNlm4ZCPIJS0wSyK4K6JA9yD8y3aC8I/CK7qQVtWM/rizx663Kmw A==;
X-CSE-ConnectionGUID: IDgFOJmKSuiOwXcWJ6jxDw==
X-CSE-MsgGUID: H8GG163tR7aFnQaBzY9fng==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="24257259"
X-IronPort-AV: E=Sophos;i="6.08,183,1712646000"; d="scan'208";a="24257259"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 13:50:45 -0700
X-CSE-ConnectionGUID: wMsaybDiQFqzz96EvScJVw==
X-CSE-MsgGUID: cXEE95kPTxmqPBCHKHbVZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,183,1712646000"; d="scan'208";a="38595580"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 May 2024 13:50:45 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 23 May 2024 13:50:44 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 23 May 2024 13:50:44 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 23 May 2024 13:50:44 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 23 May 2024 13:50:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=In4x4i4rEzYXWea9dpQa8qzGFv2G5PcM2vBDiCb8RIHYWjd+AHSrQmJ03OfujoWt5bUxnqrbv8q3otlVuDL6FX7h/kz0wqepP6b1PNrUTLbgycwaHl8emzvJLb9pInenE6t7lRgy/X0s9CeGhNM3cvCks1+hrsO5Bstnt9ANrNimbRjCMQSwxnEW6/gzc2jwWumoeAaZyL5g5ixTFN8fo5ku6agVmI3wTYQBD9rSwT4KoBusogCOi2aqSUwLp8bgn6lx2QjlFynBmaIT5axt5fdmAjBEhZxmq0ErGenKYZ3OY4JEn+dLOnMfQ28K6/F7M/+XUvgl9znenot0I2wB6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+aCM1fEBL4lkskB3IeCnD+aXVX9rHoEp04jgIAkDbSQ=;
 b=kHID9sBq/VTFLb/gFB5jk24zKh4JL8hSeOGvMu8a6isf3wMZJHECm672tkAlQItw6wTeDqSQQ10GL+pdujUx7oP8S+1vdvQ5GE/2Z4J5Y4EZ7J0n50oGVu3N+N/RWPG22psM+RTwyJrKGchUh6ErUYAu2fGiy9wyQZmUuTaquAjo9TsKMf+b2inVUREBqE4+RjqGicDRVQHizvGN7eo0nilmKX3mtFWGAk/6FecNp8Bjht1NPPbH7SO4aKlgBFYJnjxHNMLS+f6IiaJ7FOo/T3XFJyZtWRLiSxMzfCpUDYy7L2kQZQOJxJhqsHhuWsYDpIGYX7mqDnhYYhbmLNgTUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by BL1PR11MB5240.namprd11.prod.outlook.com (2603:10b6:208:30a::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.22; Thu, 23 May
 2024 20:50:42 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.7587.028; Thu, 23 May 2024
 20:50:42 +0000
Date: Thu, 23 May 2024 13:50:39 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/6] drm/xe/guc: Add GLOBAL_CFG_GMD_ID KLV definition
Message-ID: <20240523205039.GA4990@mdroper-desk1.amr.corp.intel.com>
References: <20240523192240.844-1-michal.wajdeczko@intel.com>
 <20240523192240.844-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240523192240.844-3-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR05CA0168.namprd05.prod.outlook.com
 (2603:10b6:a03:339::23) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|BL1PR11MB5240:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cb33704-4324-40d2-ef5a-08dc7b6a0295
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NAMgtP3m6VOYlYPgacd2zO7B63ApQAqFhsBqGIrQsRmsLrwyfpEW6TRM7Kix?=
 =?us-ascii?Q?GUrsXgLggQfT90h3+XbK82YR8mSzPBPnNfEJPU6bnvpVGGtnZnoCTfS5SBh8?=
 =?us-ascii?Q?21vTLNBipGKheRLs2hdvViil5ggtN4paHCSVecXxF4SgzKjEtm9L2oXoljti?=
 =?us-ascii?Q?McFeN40nfYEy2LKiwLNneLG3jVX1eb5ZKN++dUaige0YBq+pPCyid6vR9uDQ?=
 =?us-ascii?Q?w3Yj0U2fMC1/6fh8ty6JIsGwTNQGuaFaBKGz3Od92kqEkKwAWLtR7tdHJgXX?=
 =?us-ascii?Q?1kRGbTo3Lm31gY/zhFzG7stPkMLdU78+8clxNzFvyOIcTfI1KSYQOoRXmq48?=
 =?us-ascii?Q?QPlfN+fwa26MW/kk5TgZ3UsjXyh7ncX//Tq8AM3qBMFfy5AomsbWu36aPLaM?=
 =?us-ascii?Q?2vgybxXDIHcZLRbLutHjmXN271XTY1symwkPZEKRUIIJ7E0Ge5NORZ1LVPOa?=
 =?us-ascii?Q?zNJAPP/pMJEHOpBhyZH++KSP5A+tv2lj8XlQLkRK9P87I4G4Kr2RBm7Jsefl?=
 =?us-ascii?Q?RKQiJ+rBUSy7ETEAm3vqxuK4wjlfsM2NybuAfEZEE0PsI1/Nz5qj5Y45ngTV?=
 =?us-ascii?Q?r1/LgLfrAqO5GWY25EtZP3vz6ssVMAwaoNGsf4QLAFL2Qy5+mJt+AfqQj4sl?=
 =?us-ascii?Q?WjOEBvwuAADGZFKsMNnltwqxQMa0wjE0NEQm3C7sJgvW6bmNGIir9QfdZJAj?=
 =?us-ascii?Q?4Y3aRwV8LPXeuC5n9crq4dQVIk5TY6KGVkRcn/UKA1WIJCygjfhjxYzpCQre?=
 =?us-ascii?Q?j6/WWYl5uwNfJNN/6dFlNE85MRg08uLvXZv0GmECxsWt4A4Dr9xb55uq5pmc?=
 =?us-ascii?Q?RY2B0Z6Z9BMWCHEENpIH8P9BNjQRPjnvTRqhPVNEHdOdrkqgX29ZZdbjZ5+h?=
 =?us-ascii?Q?nZ3lyTzn2uJJpfeRuF0OEWNqvZwigOppt75KcxQKF9wTU3aMvQxoChoUSyGp?=
 =?us-ascii?Q?4/Ntsw2v7H60Whg9ZCOnAikORH4LaVBLbnkABYgB/pR0dmGVsnSOfafpxzbo?=
 =?us-ascii?Q?GrTamX6FcN/RzSLUwHHMGWbEwz6wkYeYBUgclQYo4li5dChgjFAOpwi44mbH?=
 =?us-ascii?Q?zquhQPriDW/FvASKHonQL/irPURRqzl+OyeFqrVCkA5fK53bNt4QJyiCfaGB?=
 =?us-ascii?Q?qC1VcYUWALMiLs8z8j5itoi98mKmG+wFSveiKLjV4Y+oRw625T0aor1Ox7ec?=
 =?us-ascii?Q?Wzc/se6PZmjwUBS8/rR0ZUSioys9cm2BKgyw6KkBSujLrEihHq9o70HXiOLb?=
 =?us-ascii?Q?l+yLA6HBNGeYJZ4shnXxkmRFRQ6FMKCoFmf/3ApPrg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Br7yxQTtnyo5vkC64w5Pr06u/pOPyWjEviTgI5mjvFttE8zNCXoMzvC09gnM?=
 =?us-ascii?Q?YcXlhqMNmWBcIUCxJP3qp1VWxlnj6ck7EW/LvEuiK0u0sbePWei5I33fy32k?=
 =?us-ascii?Q?vV8X9j0V8vFCtc4Q2H22oSbjTuVOshpWS5dXXRrRSxyRUwNEEXSlFIAI8lve?=
 =?us-ascii?Q?hUMbmwHttO3A4d4r5/YdzZCgMy9KT2glAt96ABvqOIAoeUcVXbqDouYCBvF2?=
 =?us-ascii?Q?9ToXYC8w3IaQhU3bZX+ICVvnjZFg2srmDJ+cziRW8pGsKwU8BPJ9PFqVNZei?=
 =?us-ascii?Q?wHCuhhqZDvzyZO8fNfJPGgKcB04rCR8YVe2YJq3o9ONZv/PBduo+M1j4Zyxf?=
 =?us-ascii?Q?0UlswFiDgIYnqj8J5uIaPNSX5x46tb/33p3X6IRlueDhFiBLfZdBTrF9kgsQ?=
 =?us-ascii?Q?Y5l72lDXtT084hYuc6+ldrXF1hcLGTvnOch5AIGWS0vBOhqNLeFHd9WODclZ?=
 =?us-ascii?Q?m68aOVn8j8shD6oMsg3uF19VepiZKW+kx1Sw7d4/DyhkKIDBVbNl8d5gQlsM?=
 =?us-ascii?Q?58ONWxMse/50zVAfaFa6pYd3qGgT+Ggi4y0Fplynzw2OqngVghgLQjRRkl3T?=
 =?us-ascii?Q?N+RFDZULmEJYdlYxnqPcuEEXQrr66z8k/UP3ZlxxkTZ5Li+XGWqKq0Pi93VN?=
 =?us-ascii?Q?d6LLtiEwHCGLDoVaK+gaeTUSpi2TWIo757aqtLM5BlzwKN1a3AVoB2/FxNOq?=
 =?us-ascii?Q?ZDqC4hNjfCbXdNZNO7n0cMOc9xSfnKWa/VVKAi3/HGHHcydgrIyfR6DcrXQj?=
 =?us-ascii?Q?dPdSDJRftInuGMbH56nEWDUqmKN7cLfeRt1rMzeOpmYdcv3KsD6zrIlnpR6/?=
 =?us-ascii?Q?lIkbq+o9oVpujdqYCKiUhp3/leIZ/veAw42vjRT736cFvPTgj/aqdkh+/oNN?=
 =?us-ascii?Q?OqxZhHUcO0vF90Cos4cYAwI5JIEjiPfgrVJ1AXwkkpeedXPlvKd1je5zF6q2?=
 =?us-ascii?Q?aPf1Cza//v6j0PkZu9eIPvRjOv8LuB57dbyEiLAzSK+fIoQFkPxWh1D2wBLH?=
 =?us-ascii?Q?XpEVGv+55ZWWZsilpR7Aec2qt3jSaDVtE81zlRaN+8PnVOsfEnAM7gSyISfk?=
 =?us-ascii?Q?AUnzoiIlQ+VtGoEgnaqkKyo0g7Oh0QPX1a6oFT2h8Z9hIw4QA9cePlo63ffk?=
 =?us-ascii?Q?YZ8kSLYgfu38mTW1X67njRYBzaGOWvyQiv1oPpTtDouvzOOuLfI41Pd5Wv7+?=
 =?us-ascii?Q?mgKteKwvSXMxSYlWw55QKpRUeLTmErinRDGsBZTzpurLXcnPr98dK9U0Z2JY?=
 =?us-ascii?Q?CKMHnj10I23q4ejp+ish8ZxjEENWmVIvy5Q0jC+MsoTtgvu3n443ITSP1SII?=
 =?us-ascii?Q?dXJZRMSsumFaDW4PYMSh5AHWe2wkoXsB4UpUP8Xw3LTnPgLk4HBwaOt9UeB3?=
 =?us-ascii?Q?Ud2IJNNfrZ6XN7RWu9xT/7SWhSOy4MSxKLdIu/KYaThXv2Hu/qXaR1hs225P?=
 =?us-ascii?Q?tIq0yC5poNAPRtT1bMiCRZCBxlMjbFN++o9at9pg2mQ0ES2mK2vQKo7YMnhT?=
 =?us-ascii?Q?Hmkjg4ypz5gIkQQxbKPNuQWjzElh+3/mbeBmytAJlf6xIhOjSLIR0t9dytdW?=
 =?us-ascii?Q?BFQOX6OF7sjkDOUNyHAwF7dLW2OopPu5JbiWcVCkBV3aeQvksCXzdaFnvnye?=
 =?us-ascii?Q?Dg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cb33704-4324-40d2-ef5a-08dc7b6a0295
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2024 20:50:42.1565 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z9PlZg3cG+MS+wIxSxh24EohBov+RKAM1s1ZCVGgCiEEQl3BG+IWsMve1U+DhWeo+o5ATnFr/yKF7OxzvqYzK3+4YWOHDXoMCTqB4r3yK7o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5240
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

On Thu, May 23, 2024 at 09:22:36PM +0200, Michal Wajdeczko wrote:
> VF drivers can't access GMD_ID register over MMIO.
> The value of the GMD_ID register must be queried from GuC.
> It is available as GLOBAL_CFG_GMD_ID KLV.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Matches what I see documented in the GuC interface spec.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/abi/guc_klvs_abi.h | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> index 5c1d40432ca0..8f9f60b28306 100644
> --- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> @@ -35,6 +35,20 @@
>  #define GUC_KLV_0_LEN				(0xffffu << 0)
>  #define GUC_KLV_n_VALUE				(0xffffffffu << 0)
>  
> +/**
> + * DOC: GuC Global Config KLVs
> + *
> + * `GuC KLV`_ keys available for use with HOST2GUC_SELF_CFG_.
> + *
> + * _`GUC_KLV_GLOBAL_CFG_GMD_ID` : 0x3000
> + *      Refers to 32 bit architecture version as reported by the HW IP.
> + *      This key is supported on MTL+ platforms only.
> + *      Requires GuC ABI 1.2+.
> + */
> +
> +#define GUC_KLV_GLOBAL_CFG_GMD_ID_KEY			0x3000u
> +#define GUC_KLV_GLOBAL_CFG_GMD_ID_LEN			1u
> +
>  /**
>   * DOC: GuC Self Config KLVs
>   *
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
