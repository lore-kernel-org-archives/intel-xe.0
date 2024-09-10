Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35A22EDE9AC
	for <intel-xe@archiver.kernel.org>; Tue, 10 Sep 2024 18:41:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB8EE10E8ED;
	Tue, 10 Sep 2024 18:41:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mDh4KUlY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D93910E8ED
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Sep 2024 18:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725993712; x=1757529712;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=e2/IYqbiR2e+5pKlKBDMTg8cxXxH+FM72PDobpABn68=;
 b=mDh4KUlYEtqU1lW9BfNWy8slzxstQYj11Xao6yDqCZ1ltepSGmtcBtzO
 bktLPr3d5C8QndjRj67jOEGj+8iyXUk7HJL75+ksDp9K3slQmjNiW9lMH
 neHXe3OqVHH0oggb2TL5Hw+DFj/whfY9YHRtD+IIhNBfK6y8QRXfljKaw
 UV/FHyRD1ivsvbwIbR72FuF84MeYPTmOmxj8sEnkDcbeKeUI3ApnW0fN5
 G0q9GZDl7EmIrt/f87UaTHyGIpD4+olFqHhi2sn7gnP+cFi77hM6hxWzi
 bs1mGhJhTQC7svBwl/eDDZhrItcAmGuMYRzyRpnFpB/J0JTaDce8EjZQm g==;
X-CSE-ConnectionGUID: LkIe7zLvSvKAi3HaFeq20w==
X-CSE-MsgGUID: mGeoR3KdRAiDB4fnA8D+Jg==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="24907170"
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; d="scan'208";a="24907170"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 11:41:52 -0700
X-CSE-ConnectionGUID: 79GbsfZLRQqSQ00QhtKPVA==
X-CSE-MsgGUID: GsJ1QlQpTCGVOG5epjKUPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; d="scan'208";a="67637966"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Sep 2024 11:41:52 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 11:41:51 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 11:41:51 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 10 Sep 2024 11:41:51 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 10 Sep 2024 11:41:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XgPlQQ56shXskTwy7ZscyIMBpPwn155zVTO/o9tUvTBw4bIBzr2HDJwC7Ag320UIvONjOhxmCi6vT5VqQ2PFRnSlCcjtVhS4bndiIC3k+Q6FcdzfQBWJ4wuN6vQIaEYOXAatiQFMn0Zo9GR3uO1p9O65dCLVifHu/FPKg/0wNunjCbFZU4zclsqwJXWjxo0bSxoCVauAEn73qYJLacDNovX+BDvD6CowolF86+WdBZcGpK6jGkes5u9H78YWjP6RM4F86dJWQ5vKmYOdgdCP0tJpbM8J13cLlOxMUNuGVa9t6CKfN1jlgp9R1FChBAtRluwXaUjZtZq32i0pkxJU6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qDJ8vX4DxWMB2XbsgrRK717TOFLQBN2sH7adAywK9Ao=;
 b=wD9IOn5SYXlJnGRkVMXiyu4p7dj59+/+ycdNaQBODzyEtUBWrOUtalUZVdZwcdCygyN0ConRxQ2EJIZm2nikvXZr7BophHFsXBUI9YHv4gZtzmR23jKGmEVIRTjTZRyII906ck3/NcVcxUk1023uVWD2dxysdf/7mLLZicQSH5ozRUGSXfig+ERah3LdqJPbxJlEEjHypKE3ym6oc88pyRRZ+EmJwHJpKrt8YQbikNErUn4Epmqm0sZF+g2Aup0ZWtpclauSuOrXzC+xED2wjRtPMotNuQmyGPZQ/I2HXwLjb2l25n9RAxMIVsQSde0jhQEpTrECYGQv/GsM+lOH1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by PH7PR11MB6377.namprd11.prod.outlook.com (2603:10b6:510:1fb::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.25; Tue, 10 Sep
 2024 18:41:48 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7918.024; Tue, 10 Sep 2024
 18:41:48 +0000
Date: Tue, 10 Sep 2024 14:41:45 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 26/43] drm/xe/mocs: Convert register access to use
 xe_mmio
Message-ID: <ZuCS6TCOlWo8M8j6@intel.com>
References: <20240907000748.2614020-45-matthew.d.roper@intel.com>
 <20240907000748.2614020-71-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240907000748.2614020-71-matthew.d.roper@intel.com>
X-ClientProxiedBy: MW3PR05CA0017.namprd05.prod.outlook.com
 (2603:10b6:303:2b::22) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|PH7PR11MB6377:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ff9f42c-61b4-441c-9352-08dcd1c83a7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xCEgMX0RHgXnT8o6EdioO7mk0NQ4BbOhaoHzBObVNP5aGOpiOlCld23U4Ha3?=
 =?us-ascii?Q?5lG+swMdKC/5bky/FYtiO1D+3jSVCQueCLQcQrq9qiqi5jWyPvZWjyS5t6B+?=
 =?us-ascii?Q?RBRFqB9uwiOB8y0Iv31DBUAZ6tK26pe9YkBmI7N6E09MtqyZxOm0hmWiMKl+?=
 =?us-ascii?Q?Dwh1EnBoWMjOr7Ck1AfDxMiAO9JebOzvDy2x8EnCigFXDEYKvQVRwlhlfaGM?=
 =?us-ascii?Q?TxUrZsT/Hbs95QuJ2HoMyxfxPP1BiozlGfd4OZ3cu26mEmDL3HzgfNiSZjYe?=
 =?us-ascii?Q?bXC3MagQEChQOuGzqQATWMiapUkh97iwdqz1vtNMiFfA3NGeZZgNQXU7MJHL?=
 =?us-ascii?Q?SEdF0W1LIszf5upv+zsDKLsbiWeGx0DdzJ+zrWF9hyhFCXnBti9gkYGkd5KG?=
 =?us-ascii?Q?pbEJ7JQx8HmKfpqmJ/ZLXy4WUtf33LER6ri8qCwG/WTtH99T1s12YgR7Zk4h?=
 =?us-ascii?Q?ttAzRFMvlfPedXUwX8SocZzJHiWLpG6aDHUZ4xi0eMPg3ytxxAo1uiRb20cT?=
 =?us-ascii?Q?DJHkvAqiHvCqATrbD5OiIdo0lfr4imzCDVk+HYdswrleVd701zp1lVCMIohD?=
 =?us-ascii?Q?GTxgtvIp6YPYfK8TDy7PtZqpKgJXwzderK60n6EfC4e2i49UIBGocdtAh2z1?=
 =?us-ascii?Q?HvEYqch03H3pERYRlWiIKmB+dkaWbfx0g1bK91cL1rm4wgNgx91FQ1HDmyyG?=
 =?us-ascii?Q?CdCfDt5YLSgyXTuNQMpjJtd4uGjdTZ4yTPyHAiRHkY4YxPBjTX8yWreLHhLz?=
 =?us-ascii?Q?e03B1EUErjCkj2CTLgjNUUz7a0xVBakre6bQ8TDwjFyN9otF0W64SoZ5mudb?=
 =?us-ascii?Q?oEAvcr1xs5ic0fPnUmDrJ/rcA3fVB9uP7Zzq2MaSUA3WWgSZdLaWsG4sPQr5?=
 =?us-ascii?Q?8Zj4OnI9m4LE3Oc5O2kNKfkuJBQdQEt/O/klGRRlyi23l/oSlo2aY59BLZbL?=
 =?us-ascii?Q?qRtT1ZJejTCAU3jiHqGa2843ru6bvUtSjF8RMCigR+Q7rg5ZdKwuNZ/o6M8o?=
 =?us-ascii?Q?CFDTnP+BE7nkaq95tadiq68iK7UWoFJiDv3fncxtiKQQfgtAxzL8Eo6n4b+0?=
 =?us-ascii?Q?WA4qX+bJ40kfh8Lsg31DbIKDOd8SmxYyDEh1YicKOWLDifgm1HUQBjN2fzP4?=
 =?us-ascii?Q?QBrLK27QSpgbVgSSRKHDNLkrxpWa0ubp9vkmRNmyXPjZUAom5VbMuT5Lg0TN?=
 =?us-ascii?Q?USNF2H1CZciUgLaAiTEhaLgmohuA17aFuYsMPASF+hEN6ZudJH1S8Ou4Tq7G?=
 =?us-ascii?Q?UPEmZDEiQ4urk3heOM8smJitdvGUA48B8mKskwNrfnM9jYVpDt9ZzLj7yBA4?=
 =?us-ascii?Q?gePQOWRu5mbDz0jucQDiqhcWmjeACmkmRHQl3l3goGmM+g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kR13jGeZHUhWCWF7msQ9eHoJahoLq+pqD7cuzBM/0RKRrZvxbXwlTHX9fNyH?=
 =?us-ascii?Q?bLzDV/LtGdVwN603j33ao74Vjx5acM7n08xFkWy8cHEfUhSPToTF8ioWqBfr?=
 =?us-ascii?Q?4eVCz+DuZ/Bptjpwj+04l27HcNuQzDwVJ7WSoylKJnxprANUygpxWkF2MLlB?=
 =?us-ascii?Q?EVsYn8TZ3cMh30fjdpO0+Je8SbjZkYgPwgan65/txoqBNVOioHRsLGsQBrAo?=
 =?us-ascii?Q?rXYlN3+NmDWzLJLGm30+6xmfS3vT3pGIldkqPn1EwA5ekvPPsLD9rBPGfFzp?=
 =?us-ascii?Q?UVBP8rZGXS9Hp6fm795rEdBnizXcSLUr7G+PGuJJq4JMkfJAo+7kHy7w/IlU?=
 =?us-ascii?Q?iEFO5FRNLt5VnygrtHo+0rqOrjEUAPKTN0+zOi7dTV0FES0BT+pYe/Zc+Jav?=
 =?us-ascii?Q?kxn4gL4CHEqhsbJrtmAlRhT0al+nUXIw+8YeQVMjmP+oO4ooBO8EGCCKnfaJ?=
 =?us-ascii?Q?otSNoYaG3CxQlDgB9XpCbxdZ+IonzqoWw/+zXlOFcnJHxlYcc5wVhe27/jk6?=
 =?us-ascii?Q?dRY0CE9F0zP1o2G0AxxbnWVm9qX7S7+fXdcs+1SmciZuYQ3FIk39+7OOdjYb?=
 =?us-ascii?Q?mYCOMewyW7/5l1us7MeJZxy1QagU5/4f5nkvzSj0mnEOCnbX4TeFZAeL6+Q5?=
 =?us-ascii?Q?PZ+K5IFHC83nOfJ2nGAdCTvl8vROzav6mrh1xZk/gynNYKBuQHJxG1erOuyz?=
 =?us-ascii?Q?RZ4NPLpuv4hqA4W+HNFl3NprK/vQ1eT/OR4bTKMVDFj/bqXA2aCbXrEVGnxz?=
 =?us-ascii?Q?okolg+uGFDfqiOWA4UPX3uP0RV6GBq/NtjJHJntYHbe2wohiorxmPXDNZbBS?=
 =?us-ascii?Q?Hwy+xgD5mOjjWGPNsTKXmGsdpS1BWvUlRHmiqV3peAQOgnSlbXijaih1eU5f?=
 =?us-ascii?Q?/AV4cvn+mwX53bUJ4ueLf/qi4yVjbjIMvp04VNKYSPIRS9SRS7dbq+CTKkNL?=
 =?us-ascii?Q?fC1iWNZtbmfrp1OXrl2xQPvKSoi86UBxs1AOqxUELG6iVakrjRCrfuGaLxcb?=
 =?us-ascii?Q?KOZxbms1UcIEmbp92jYrOoKzsfLKsR7kosWFaCpoXZIWJJGCwgxdPvf+67U1?=
 =?us-ascii?Q?aZn9XL6BxH4dNW1G1IbC2KYRGgZ/goMBJhu2nZ6Q3wpxWD+k86nGPz4+SVhz?=
 =?us-ascii?Q?oHBMn6lZbcr1xjiCzEUm0jEi/UgPbZltvr+R8XpSNm6zqav//1WzklpCCAOb?=
 =?us-ascii?Q?VYQ0hbyQN18p+DLO1IwTKHcYmAQCXjDlo3qpnfIKP9z7RV7BD+QuH8zcQ9F9?=
 =?us-ascii?Q?ZCC3jL1DmIp6JnmAxDFEK6oAy54pDU73eXO0FGxPeSZr7H5edUv5VNssla3V?=
 =?us-ascii?Q?VaX+ZI0En+qPmNSIHLWhhWiuxHG4w5CWcY1DFooCC9G51dmD1DVQSwfwjNv2?=
 =?us-ascii?Q?J9n8S2T7F7y3ltrItuAjblH3Y//f/PR4E9cUW/8AM3NAI3ZqV+haW545+8u5?=
 =?us-ascii?Q?dBVU+4Lg6qUGWiEg4GOvPmaXaZEIHqYuixZw/9L31Lmq2K2w4nEHcvqzLbcL?=
 =?us-ascii?Q?On6wZYqHw2dmWwftnqI+rOAPzJ9pfuhQtCWxXkHfrYoQtDDHO+r5Taq8oj6j?=
 =?us-ascii?Q?5wbMIAIgj/u/gHsQQVOk/3WY0Puyv5mj7VFyP32XdYiPIby9AK/yA/Gfggc5?=
 =?us-ascii?Q?zA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ff9f42c-61b4-441c-9352-08dcd1c83a7b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 18:41:48.6903 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E9e+y0RYI33FUGeJE9mxZZx9dAT4P8XJUFiDt/Tx5Lbw1eBOQ93HUoB6g3voo0eDJTK6hAvCmJ027fqZD9+4rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6377
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

On Fri, Sep 06, 2024 at 05:08:15PM -0700, Matt Roper wrote:
> Stop using GT pointers for register access.
> 
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/tests/xe_mocs.c |  4 ++--
>  drivers/gpu/drm/xe/xe_mocs.c       | 16 ++++++++--------
>  2 files changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_mocs.c b/drivers/gpu/drm/xe/tests/xe_mocs.c
> index 79be73b4a02b..ea932c051cc7 100644
> --- a/drivers/gpu/drm/xe/tests/xe_mocs.c
> +++ b/drivers/gpu/drm/xe/tests/xe_mocs.c
> @@ -55,7 +55,7 @@ static void read_l3cc_table(struct xe_gt *gt,
>  			if (regs_are_mcr(gt))
>  				reg_val = xe_gt_mcr_unicast_read_any(gt, XEHP_LNCFCMOCS(i >> 1));
>  			else
> -				reg_val = xe_mmio_read32(gt, XELP_LNCFCMOCS(i >> 1));
> +				reg_val = xe_mmio_read32(&gt->mmio, XELP_LNCFCMOCS(i >> 1));
>  
>  			mocs_dbg(gt, "reg_val=0x%x\n", reg_val);
>  		} else {
> @@ -94,7 +94,7 @@ static void read_mocs_table(struct xe_gt *gt,
>  		if (regs_are_mcr(gt))
>  			reg_val = xe_gt_mcr_unicast_read_any(gt, XEHP_GLOBAL_MOCS(i));
>  		else
> -			reg_val = xe_mmio_read32(gt, XELP_GLOBAL_MOCS(i));
> +			reg_val = xe_mmio_read32(&gt->mmio, XELP_GLOBAL_MOCS(i));
>  
>  		mocs_expected = get_entry_control(info, i);
>  		mocs = reg_val;
> diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
> index 7ff0ac5b799a..8df41cd12d51 100644
> --- a/drivers/gpu/drm/xe/xe_mocs.c
> +++ b/drivers/gpu/drm/xe/xe_mocs.c
> @@ -278,7 +278,7 @@ static void xelp_lncf_dump(struct xe_mocs_info *info, struct xe_gt *gt, struct d
>  		if (regs_are_mcr(gt))
>  			reg_val = xe_gt_mcr_unicast_read_any(gt, XEHP_LNCFCMOCS(i));
>  		else
> -			reg_val = xe_mmio_read32(gt, XELP_LNCFCMOCS(i));
> +			reg_val = xe_mmio_read32(&gt->mmio, XELP_LNCFCMOCS(i));
>  
>  		drm_printf(p, "LNCFCMOCS[%2d] = [%u, %u, %u] (%#8x)\n",
>  			   j++,
> @@ -310,7 +310,7 @@ static void xelp_mocs_dump(struct xe_mocs_info *info, unsigned int flags,
>  			if (regs_are_mcr(gt))
>  				reg_val = xe_gt_mcr_unicast_read_any(gt, XEHP_GLOBAL_MOCS(i));
>  			else
> -				reg_val = xe_mmio_read32(gt, XELP_GLOBAL_MOCS(i));
> +				reg_val = xe_mmio_read32(&gt->mmio, XELP_GLOBAL_MOCS(i));
>  
>  			drm_printf(p, "GLOB_MOCS[%2d] = [%u, %u, %u, %u, %u, %u, %u, %u, %u, %u ] (%#8x)\n",
>  				   i,
> @@ -383,7 +383,7 @@ static void xehp_lncf_dump(struct xe_mocs_info *info, unsigned int flags,
>  		if (regs_are_mcr(gt))
>  			reg_val = xe_gt_mcr_unicast_read_any(gt, XEHP_LNCFCMOCS(i));
>  		else
> -			reg_val = xe_mmio_read32(gt, XELP_LNCFCMOCS(i));
> +			reg_val = xe_mmio_read32(&gt->mmio, XELP_LNCFCMOCS(i));
>  
>  		drm_printf(p, "LNCFCMOCS[%2d] = [%u, %u, %u] (%#8x)\n",
>  			   j++,
> @@ -428,7 +428,7 @@ static void pvc_mocs_dump(struct xe_mocs_info *info, unsigned int flags, struct
>  		if (regs_are_mcr(gt))
>  			reg_val = xe_gt_mcr_unicast_read_any(gt, XEHP_LNCFCMOCS(i));
>  		else
> -			reg_val = xe_mmio_read32(gt, XELP_LNCFCMOCS(i));
> +			reg_val = xe_mmio_read32(&gt->mmio, XELP_LNCFCMOCS(i));
>  
>  		drm_printf(p, "LNCFCMOCS[%2d] = [ %u ] (%#8x)\n",
>  			   j++,
> @@ -510,7 +510,7 @@ static void mtl_mocs_dump(struct xe_mocs_info *info, unsigned int flags,
>  		if (regs_are_mcr(gt))
>  			reg_val = xe_gt_mcr_unicast_read_any(gt, XEHP_GLOBAL_MOCS(i));
>  		else
> -			reg_val = xe_mmio_read32(gt, XELP_GLOBAL_MOCS(i));
> +			reg_val = xe_mmio_read32(&gt->mmio, XELP_GLOBAL_MOCS(i));
>  
>  		drm_printf(p, "GLOB_MOCS[%2d] = [%u, %u]  (%#8x)\n",
>  			   i,
> @@ -553,7 +553,7 @@ static void xe2_mocs_dump(struct xe_mocs_info *info, unsigned int flags,
>  		if (regs_are_mcr(gt))
>  			reg_val = xe_gt_mcr_unicast_read_any(gt, XEHP_GLOBAL_MOCS(i));
>  		else
> -			reg_val = xe_mmio_read32(gt, XELP_GLOBAL_MOCS(i));
> +			reg_val = xe_mmio_read32(&gt->mmio, XELP_GLOBAL_MOCS(i));
>  
>  		drm_printf(p, "GLOB_MOCS[%2d] = [%u, %u, %u]  (%#8x)\n",
>  			   i,
> @@ -690,7 +690,7 @@ static void __init_mocs_table(struct xe_gt *gt,
>  		if (regs_are_mcr(gt))
>  			xe_gt_mcr_multicast_write(gt, XEHP_GLOBAL_MOCS(i), mocs);
>  		else
> -			xe_mmio_write32(gt, XELP_GLOBAL_MOCS(i), mocs);
> +			xe_mmio_write32(&gt->mmio, XELP_GLOBAL_MOCS(i), mocs);
>  	}
>  }
>  
> @@ -730,7 +730,7 @@ static void init_l3cc_table(struct xe_gt *gt,
>  		if (regs_are_mcr(gt))
>  			xe_gt_mcr_multicast_write(gt, XEHP_LNCFCMOCS(i), l3cc);
>  		else
> -			xe_mmio_write32(gt, XELP_LNCFCMOCS(i), l3cc);
> +			xe_mmio_write32(&gt->mmio, XELP_LNCFCMOCS(i), l3cc);
>  	}
>  }
>  
> -- 
> 2.45.2
> 
