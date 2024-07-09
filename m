Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5539C3271E
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jul 2024 00:38:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D4F810E211;
	Tue,  9 Jul 2024 00:38:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DveeA2G1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1D3D10E211
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jul 2024 00:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720485493; x=1752021493;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=IrqomPVZ910UwO6gMW0k3jtSWxcYjONFmXZQ9BIZv7w=;
 b=DveeA2G1GVB1dUVGWJrgjVE17XIDgdhY/gjThrtuR3tVvFTeA9V5ArRZ
 /KL0MnXIJLjts8KZqXtK2o5M7AuvfnA2MJ3Yna5bgrjZdQY85dw/xzHPZ
 4b9+c1u+i9K+/uuBlw0QisWZ133Hs1Fgyit9EHSNiO9Kooyy5f5SEC6+S
 /HSUX7WQS3nVYTNuHA9O65ytzSQy1BoWlqJrisB9FsNxflMfsLvwBaJsM
 r5NEaedNSgVysWBsoRY6jcN/X2pC2reucpRKwb7Zl7kvBEU2yWOalaAnM
 /OlXWGsVqIaSB59CMArfeQl9UczIJQRKjfRBmMxn8qIzega8ivwoMzzXt A==;
X-CSE-ConnectionGUID: VuDzR4McTN2VCgCgXb0OkQ==
X-CSE-MsgGUID: 3KuLTMrtSLaD+6/2NA44YA==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="43136017"
X-IronPort-AV: E=Sophos;i="6.09,193,1716274800"; d="scan'208";a="43136017"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2024 17:38:09 -0700
X-CSE-ConnectionGUID: YVKKq8uZQzGeO3/qjCkMqg==
X-CSE-MsgGUID: ndiRXWJwT6WM3vDTDChLtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,193,1716274800"; d="scan'208";a="52004677"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Jul 2024 17:38:08 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 8 Jul 2024 17:38:08 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 8 Jul 2024 17:38:08 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 8 Jul 2024 17:38:08 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.47) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 8 Jul 2024 17:38:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bBJTewuZnie3TnLUKViaDJJOUIH29Q7+ZnWheZvHduU8WRfP1Q01Jfm+9ziZiDehA39wG4E0sK/nSITrRnBloiqjxTxtPiqsMKFFpUwB9NCN/P+WIaJG1HfiC0n2vD+McuaGdyNOcGVomvDhCr7a6Shja/Pz3E3+weOurpCDChRBhwC6X6/bI8mKK8bWyZkZqnh3sMi3lawz0dEHKY5dEAcf3h3BqO+jxGz4qsCQjHzbRktlCQ7dZJRrv7LqF5pTR335qXhPQJ2zKSckQxaKL6E7CnO6+AOJ5+3mokI1m3Vodef/nCq6HmUoZkaEO/sIGZf9aQZKzcYH6cyFz2Dsgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+/2HQSw8WF5gGzzsUtksSIYTgk4JGpHCyz4Vk1T8z4M=;
 b=jtlBZYj8dMisuicniU3x5oGrSDs6dlIzUxJvVSOSncbhjqTsKqhZD0AebTBaVeEqxNC4gfMQ8iGZjN577QjKure5lgFX0wvNGl7iseqFYhb8ixYxiZQ16v8QDiLiiaMVbr8CX/iAgVe7G3kFF13gSgx0SWd1VKUyTxQwFpzGcobIzPLWmpwEmD3ymHXew0v63FEKoR7hdpWAu6YwXZ0ACgYPWRo5qb5qWOD0baIOusoBZdzSJ7+517qnytpv0694ZIMAkzY7jgsZ4QF9Vfe/mJ3poZLM7jCad/AEhDAtbfqD8IiDWJP4opNhfPuRkcnchnUSS4/iFv7CXXkYYKfJRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6527.namprd11.prod.outlook.com (2603:10b6:8:8e::19) by
 CH3PR11MB7913.namprd11.prod.outlook.com (2603:10b6:610:12e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Tue, 9 Jul
 2024 00:38:04 +0000
Received: from DM4PR11MB6527.namprd11.prod.outlook.com
 ([fe80::5a48:57be:974b:8ee0]) by DM4PR11MB6527.namprd11.prod.outlook.com
 ([fe80::5a48:57be:974b:8ee0%4]) with mapi id 15.20.7741.033; Tue, 9 Jul 2024
 00:38:04 +0000
Date: Tue, 9 Jul 2024 00:37:22 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <lucas.demarchi@intel.com>
Subject: Re: [PATCH v2 1/4] drm/xe: Move part of xe_file cleanup to a helper
Message-ID: <ZoyGQvUmk4dyk5xx@DUT025-TGLU.fm.intel.com>
References: <20240709002835.3372618-1-umesh.nerlige.ramappa@intel.com>
 <20240709002835.3372618-2-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240709002835.3372618-2-umesh.nerlige.ramappa@intel.com>
X-ClientProxiedBy: BYAPR11CA0108.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::49) To DM4PR11MB6527.namprd11.prod.outlook.com
 (2603:10b6:8:8e::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6527:EE_|CH3PR11MB7913:EE_
X-MS-Office365-Filtering-Correlation-Id: 74a9710e-02a8-4225-9b41-08dc9faf650c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8hZTTv2LlxmHYUb1+JGOJN0sMPhXD14w1njTdE/8v7Ma72x2kfaljq/G/V1T?=
 =?us-ascii?Q?ndqkd7JwVHojsDtggif5ObqE90XLUT/R4L324hCcQUpoGmxUMhytW+vN/ukT?=
 =?us-ascii?Q?vFb0zfKe0ypTv09lt4Bnebstsr+apGqB2+8jwjyuLkcUpRiIbU5dlMuM6zFA?=
 =?us-ascii?Q?jJ/AtQKhWtFj9tuP0hfJi8xIqT+R2lEteus0dfjTLauFBhwZ1h2vxSNfPnrX?=
 =?us-ascii?Q?Zq+xFKtxwKPgyrt95yRb1dQ+e+v0LpgWQ/09DdEhFMLxTUO3kZsaoJHHolv/?=
 =?us-ascii?Q?y8tOH9ZDX7N9t4a4DmnhObM082llaNnc+Fs/PkgvsJDZtn5wn1OsCbmPr/nx?=
 =?us-ascii?Q?S5bi8RtEsYCafxrF5DJ5Mfg0z/K5vPPcszIXkfDP8JjjEn8BykDjYLOPtyAj?=
 =?us-ascii?Q?yngvmcaxJihADrwrYtwCS3aqnjMPja+1b9TKnG0am9NzE58uq4KAibqGProZ?=
 =?us-ascii?Q?CG0dYdWq2Qs21kRpjDYv1XUkP23LTtxPWo2dQvyqSmAoPaGHFpQv2c49js9C?=
 =?us-ascii?Q?skb9xxh9GgdlyPsTxRkadmsBklN1Z/iHtct66V2XUdAJSYWIK/nbwRmFrM9J?=
 =?us-ascii?Q?AO5Zc3MzkG4aFrPM9IsBCyCyFlNNPx/G3/B2/zNCqSAWiHY2FNvEivIxHHVO?=
 =?us-ascii?Q?Hoqxj/ApewBUFnROttvzGtc+6eAGVInZ5ud/oVKAgw/uyr/CGtsL2D27k0gv?=
 =?us-ascii?Q?cjx6voBoFU6g9g9bBo/qXqY3hLoW9anM4qEMXCFDUNLlu1OETBAr7EF7HznC?=
 =?us-ascii?Q?rbxMoDXjxsUQqIPXSdQyUVg4on1NNrfeV82gUWmd4X5DrnSgvYXsuRH2MrfL?=
 =?us-ascii?Q?xF22SZjXzIGgUsil89pC6YGkTPuWue3B+wvH8hY7X2MhnDKTdoQEfJH9rVFT?=
 =?us-ascii?Q?chNOWRDR1X8voxdYjFVV53f81zNMktj/myPKnvdt9B+uKG5lB9uzg1sC9EFy?=
 =?us-ascii?Q?hbxJLC9Ci5cXzgYNbto2XUL071Qd1s87sX5XKxdPjP6baB9erMB1L1OhHTU8?=
 =?us-ascii?Q?v4X/XGsbKgEDD1rcdsmy1P3+as8pnK62T2TUmnvM7JUG5Hef+yeJpfaMiw0J?=
 =?us-ascii?Q?CcpGbRBdVELEuSF8yo+nBILxh/ACu/9Sxi7YgVQHp6Zi2yQNpumZdM14qDBL?=
 =?us-ascii?Q?+pivOypROPY5JLySVs5N1mZoIskqxhyA2J3LUFt/vz/ayLbUoRWW0sx00uJe?=
 =?us-ascii?Q?O/lLgKPti1JZYZT9uTB2tMakpEA096P9LlMZ3jd2JyxPtv5BW01D+MYiUuMe?=
 =?us-ascii?Q?JPopNgAmpYs43vpgvjxdZB0vJkgiW7/CfW+rm+QC/baZopktOtlTzm09SSFv?=
 =?us-ascii?Q?wQC+PvJOoRKRDCQ3mf9V1VIeERHsAXlNUNB09k049Mibvw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6527.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fLzGa2EjcH3ia5H8BJopUYs38/TIPs5S94bAz4MKNSA14UROYw6y6BtVJRrl?=
 =?us-ascii?Q?7A6u4rmi7QvmrHw38OkarnenYnd+7JgcbXroiEczFYRUniTFjHo8X4Ck1/Gs?=
 =?us-ascii?Q?VFIbqrmGFKMABtQCI62oSciqSUnxZ8TuquByHleMzVHlfEpaEABiMHloBX2T?=
 =?us-ascii?Q?oYQAWzU/S41IDMlKj9Ji5dH5hCSHZ5AVL8ftOKl1nggfp/5V0NjGrG8YBeJc?=
 =?us-ascii?Q?tFvsgVTSyME5OKKn5XpcVfnT4n7++k7fDmAjBdhEUSeA9RBYCvB5E4pgXw99?=
 =?us-ascii?Q?L8jnJsqdSe8WkTC4OtZ6+SSIzmAEuLUHHv+mpOCsxfDX0RtmVUojZHpjkXGg?=
 =?us-ascii?Q?tWrv9OxRedOCNuhara6gPltl1yMhSuW6YOC9h5oJP4I6D0dLxHqTYB0Ds0fM?=
 =?us-ascii?Q?CP3579/+rqrwpiOalbhYq3RXJ7XGfgUVV53bBuc6XFdEfZ93yjP7Km9sPU5A?=
 =?us-ascii?Q?ZQv1q5+rqz1dkGnx/Ris5oCckaB96BrNECpPSOs+gLNPaxnXr0JCFq+7g2t+?=
 =?us-ascii?Q?P6bcC/qqazWPEvpp1bz9Wn3ALO4Hpo/5rX6gjxvzCrrknPgFnuG3fp+rDX5F?=
 =?us-ascii?Q?ZYiPScpIp96Ob0/zE0qcGQYVjIV3IC/EbIkmrPmqKz4uqoqLYu8RQkn+0Tti?=
 =?us-ascii?Q?ftTS35NJi0r9n/sm/9EvzNk+K7TZZ1oKrmxxnD7doyAXFEvWqxjdX7oqASL4?=
 =?us-ascii?Q?xnQVr2xjrQeb9t+V9WplzSjedUkVbTyUdUuerwf35PC5UOK9OtIHzpL+YoKf?=
 =?us-ascii?Q?3/R6ikCwakPxWmBR3dHbt8RI1ohf9JdHNuDOuAiOlbDKF6W89SrS7al/q3MW?=
 =?us-ascii?Q?uLm/t+7mNjqd76pY2GLWyfDvo98AMu3aSyDdrV61RY51GKUcaxN9GcKnZGCs?=
 =?us-ascii?Q?TalaGO2wFXU5RTdogW7hiCrYOIG6v23BxXRfXAyzTjKHM89D6EBtIlWojvrq?=
 =?us-ascii?Q?vhJjNi6f/G5cSdlyt0f34MTXuKT5zXrHeUvHpO6cZkTjRX9i7WSiBh3wtyT6?=
 =?us-ascii?Q?SCUTg/nRDoY27UCHiIcsmWkIwCDc+Pm4+JVi7ytbIfGteTWDMXrXwVFfmimg?=
 =?us-ascii?Q?j+QJbmrn2383+FPLH08wFSqyryrZrSGwCJo5ka6jrrP2W2MbnEwHwy+0Jd36?=
 =?us-ascii?Q?rlMXfoIaJSMGUEHEV8I5XU1DJn/zia3GDacRm4wfUxqybOv/lpGovZXfUEpk?=
 =?us-ascii?Q?drHXTGN0Vm79/99UbnOmYbP8+rVq5z/AgcAKhO6foHnT5cl7EcR7wSSXGvfV?=
 =?us-ascii?Q?JGxAIGDFRFOtzr2+5B3KIpvR089l/ga4OfadMXPrjdoHLdJeiK1ChuQGNXFN?=
 =?us-ascii?Q?kUAryA4uJmvJUNK6ZgRH/h3qKuvFpkF6i2BG+ygB7DWpM2nw+lc/PMEZ9f0Q?=
 =?us-ascii?Q?9lHrIQX5XGnN+KseM2B0qMhYy7LJF5GRp0jEC7w+ghMn0lWetyEVh1aCuB1+?=
 =?us-ascii?Q?1VgQZECeyhsknPmI2bUPuilHq0eeiU5SXwbm607ZD5C8xjHglVyzoU/ymp4P?=
 =?us-ascii?Q?2YQo4f9WB3uGfjnTE6lShFEWh5g4+PobIvQ2MV/hSBZhwt+jn+k/U4zEK+de?=
 =?us-ascii?Q?GzI2+2q7bicZ3TtoVVlH8Zz9eeVbIM7GuJ29YYi7I2LPi4TUG76DtrPbWR9D?=
 =?us-ascii?Q?pg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 74a9710e-02a8-4225-9b41-08dc9faf650c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6527.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2024 00:38:04.3940 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x7NPHi0RjAElPfaWgdowwjK9ikFx+T0c25YurNcoF89L1c40gD6rSZOeIs0aH77AuVYtNXt05V/nUrvDKQxolw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7913
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

On Mon, Jul 08, 2024 at 05:28:32PM -0700, Umesh Nerlige Ramappa wrote:
> In order to make xe_file ref counted, move destruction of xe_file
> members to a helper.
> 
> v2: Move xe_vm_close_and_put back into xe_file_close (Matt)
> 
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_device.c | 29 ++++++++++++++++++-----------
>  1 file changed, 18 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 64aea962afd5..c5464ad5d908 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -93,9 +93,25 @@ static int xe_file_open(struct drm_device *dev, struct drm_file *file)
>  	return 0;
>  }
>  
> +static void xe_file_destroy(struct xe_file *xef)
> +{
> +	struct xe_device *xe = xef->xe;
> +
> +	xa_destroy(&xef->exec_queue.xa);
> +	mutex_destroy(&xef->exec_queue.lock);
> +	xa_destroy(&xef->vm.xa);
> +	mutex_destroy(&xef->vm.lock);
> +
> +	spin_lock(&xe->clients.lock);
> +	xe->clients.count--;
> +	spin_unlock(&xe->clients.lock);
> +
> +	xe_drm_client_put(xef->client);
> +	kfree(xef);
> +}
> +
>  static void xe_file_close(struct drm_device *dev, struct drm_file *file)
>  {
> -	struct xe_device *xe = to_xe_device(dev);
>  	struct xe_file *xef = file->driver_priv;
>  	struct xe_vm *vm;
>  	struct xe_exec_queue *q;
> @@ -111,21 +127,12 @@ static void xe_file_close(struct drm_device *dev, struct drm_file *file)
>  		xe_exec_queue_kill(q);
>  		xe_exec_queue_put(q);
>  	}
> -	xa_destroy(&xef->exec_queue.xa);
> -	mutex_destroy(&xef->exec_queue.lock);
>  	mutex_lock(&xef->vm.lock);
>  	xa_for_each(&xef->vm.xa, idx, vm)
>  		xe_vm_close_and_put(vm);
>  	mutex_unlock(&xef->vm.lock);
> -	xa_destroy(&xef->vm.xa);
> -	mutex_destroy(&xef->vm.lock);
>  
> -	spin_lock(&xe->clients.lock);
> -	xe->clients.count--;
> -	spin_unlock(&xe->clients.lock);
> -
> -	xe_drm_client_put(xef->client);
> -	kfree(xef);
> +	xe_file_destroy(xef);
>  }
>  
>  static const struct drm_ioctl_desc xe_ioctls[] = {
> -- 
> 2.38.1
> 
