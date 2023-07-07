Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62327EB64DA
	for <intel-xe@archiver.kernel.org>; Fri,  7 Jul 2023 19:37:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32F6810E5E2;
	Fri,  7 Jul 2023 19:37:19 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 920CA10E5E0
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Jul 2023 19:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688758636; x=1720294636;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=2t4WUeOlu5Qb7UHBRg/ncwR11kPkbdQHJY0kqhOTv60=;
 b=Wbg6OEKLvBesEr/Lyd6omzG71I+imYAa9hKfwjVHqm0m8YovM0DwhIdk
 kl8+loYws5HDe7wvm0V0qVnV7h7SkR16uajOR2eUojx0ziFxnb6ZwriYH
 HZjBf822hbjrwPp2qpafcIHEizBDPHmGrdmT9/KttbuydZxtarxEjyYDa
 TcZfyQh0mTrlZUh5DHC//GabPFXB2aWbqtS10Fo2OCHl3K9LfPCIM1Yc0
 JV1Siz5IIHd10K9+FIPXcdvvYcselGgv/IL1OfvR9NRaCHOMm/CbBupKS
 eL1JDVxlH05tpZHy7n8h8b2XJWjFejxmKO1YuqEQ2iJljOZHgsFOZsCFM Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="427651878"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200"; d="scan'208";a="427651878"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2023 12:37:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="785463424"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200"; d="scan'208";a="785463424"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga008.fm.intel.com with ESMTP; 07 Jul 2023 12:37:15 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 7 Jul 2023 12:37:15 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 7 Jul 2023 12:37:14 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.105)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 7 Jul 2023 12:37:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dARs9lWJXh9a6ul1kDbivHG1K7YeMABRUYFbMoM+FTnOUKD8/ex84v+z0sbvnwM5ZqAO31ean4bwuI1cRXe1OdUdF2pb2JE49ACMv9YhWcV9leLHUc/yndV/Hb6zPxRoWsKfEuaDNURhRo1r3Cs7jZGzJ6vH/ZpIcptY9jgATyoABgA7mI1p+7I2UM5lF/qtkst/PHPynftCqfRtUhUPkwSRzCjATWZsP0/IVAs50jSUNb6vnhJVxHhUZCYH174FLPCRbrhMOtDNhwIvnOa9V/X27uYCs97WkcpgBQXsSIZijvOv7IEOwed51ClV6g0AJXwh5VVI7XHR0IlSY9NF7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EIiKSBhO2f3s8HUzkGxYQlpBNN79nwn9anBZT2BVZEY=;
 b=X2SUKSUu96H+upu/LyNCg38rdLy9fXEZ57xrZzRGxuWB3/LIWSCRpQUwC5st8ukc8Qqxsj9V6CeRDkvHD7FcDJja+YDusUXUDJlNP9fzLKDoaMt83fmzKqcZbclybX4pzJzDEGmFke5wALUmghgvDNsl/VRIfoJpRH4NjwscFl/qYc3hoUxubjwluNBUP6ZpIX1wcO8jfoUas40wAMuESld06DXIuO/7hnZZBjahOxDBzUaaVE9/K3UcLJqlf1vmumspOZEUn3wUngpahgf4yhDDSmkRBGyvpx/l4FGs6SUhu4nuvNqhzGPImptttnDRhcMneK1drC7y50GK8giwwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CY8PR11MB7747.namprd11.prod.outlook.com (2603:10b6:930:87::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.24; Fri, 7 Jul
 2023 19:37:12 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::2677:dfb9:456f:1227]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::2677:dfb9:456f:1227%5]) with mapi id 15.20.6544.024; Fri, 7 Jul 2023
 19:37:12 +0000
Date: Fri, 7 Jul 2023 15:37:07 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Anshuman Gupta <anshuman.gupta@intel.com>
Message-ID: <ZKhpYyy7kyrJBpYV@intel.com>
References: <20230706120208.2828158-1-anshuman.gupta@intel.com>
 <20230706120208.2828158-5-anshuman.gupta@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230706120208.2828158-5-anshuman.gupta@intel.com>
X-ClientProxiedBy: SJ0PR03CA0195.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::20) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CY8PR11MB7747:EE_
X-MS-Office365-Filtering-Correlation-Id: 5158ac01-924e-49bc-16fa-08db7f218f1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6bjRu2QBSM2pNHM5y/HKyfU6/JqNhuVFRIe0weodK9grWd5Hqa8b2X37JN20Xe5W2sc48Uk1IMN9B0mc4dIt8G3FkU+7Dty9BTJdCX3isldydKWSyzjYx3jvCiXaDmdWZYC4UV+CSEND+y8AtsAJ8Eg/RlVqj2FVOCmWVyszRqkbMLwVC7vQIdW0ndrBntrQzaHyc/Y9n64dkrq1xVUbVcjV9v/d9XiQO4cXz4jRbkTS1sw77Fvq7ZHLt0TaDNzyyNPMqIXNFquS55E+WyODovdoWlVbpAcVibMad42bTBXgJKbgiU2AiFS80fev7DVJBkcysoWNufVxmACp/JLgw4z9hR+6HsVRWh6eFnTcZSibwqiqyovBDUAmK3CJYN/+OpKX4+OX2cSEGncPcugzzkpSvpD18PS7X0NZvZiJbnMulaq9y694XzugrpHJJ7RYpmTJev+dkG167KwMUlN1z3GjjxXOrnw777t1YROZWUIIhrKtiGcndXLaszqHUrZ1Gw3NMamODFByRhPWr0ZzEYCywq3cbbMbwyXajhOOSgq8rLiwFt1d/oZieQM7+aKK
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(366004)(376002)(136003)(346002)(396003)(451199021)(38100700002)(478600001)(6486002)(6666004)(37006003)(107886003)(26005)(6512007)(6506007)(186003)(2906002)(66946007)(6636002)(66476007)(4326008)(41300700001)(66556008)(8676002)(6862004)(44832011)(8936002)(5660300002)(82960400001)(316002)(36756003)(83380400001)(2616005)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1x/pXMKZr+uLm8oHhgM3FWPPBjOjokx/DcgQhN9rLUE/X4zTeWibOQsBB9EH?=
 =?us-ascii?Q?qChrtmqm0jZHQWnDdRdsX4uvoAgyIv1UGCelyp1nKmJJf8YwCautUnkFFnqs?=
 =?us-ascii?Q?cWM7DsXLmaIT7VpAPsIbl5gtf7ja3TZW+u5bSWlmp2BkeTpErJd3XiKium31?=
 =?us-ascii?Q?xMzG66xyfwjKYXb9grAu73O8FwY/Q4+LSIqu38hqHFK9rCJDDSeFutAjtF7n?=
 =?us-ascii?Q?3+YjmObyBOLW5zpKSBqndhnpkgsR7Av/9NS5wcXginWz+rHzOx14f5ZkdXag?=
 =?us-ascii?Q?D5cLQ+2gdM77WqhSLWieJNSWl1ZkoPzShcnMFSNwSNvCNL+mtBVyMGPdrjcE?=
 =?us-ascii?Q?5GDcJZ6TCmLo6SIo/RrRAVl7ObZgl70dd9BPWnZrQy3bmTdeiMccR99mVbR4?=
 =?us-ascii?Q?3LpF1qp1x74JLkSIaiznbGCSIHqYVWkbtqI5CVonwAHhpKtKB0K12gMInl9R?=
 =?us-ascii?Q?zBBUdawhQAYzbquegbPXpz2Fn0mGkWm2VUDvhPpoi6Kaw38BUNvb8s70ob5r?=
 =?us-ascii?Q?Jw9uaom6ldYJbRkbTUYBThogesU+8BuBDeFkXHoJ3AyFbfQRVqsplZno5yfH?=
 =?us-ascii?Q?mdqsANOepjRTXcNk4ev09Oj8fypORlsSu4M6fLriSKc8rSMbMmlHrEX8v2ce?=
 =?us-ascii?Q?Y4z77C2pqNpBI4BNRf/9HpX6HwYsb8GTBBXpskt1lEOQYYVz//c8Irl6rMOv?=
 =?us-ascii?Q?cjwp6HlgROUghBEt06DuhlYVsHdxEEDf0vtu9Owh22FPE1GkdiiGB3L1ICd+?=
 =?us-ascii?Q?Kba0lneSviwxp6ecyCskXxMya4vPiQMY+F0tr+K1XP4yTymwMu1bt9GCN9Ui?=
 =?us-ascii?Q?Z35VCw6K2GBfrTN3AQcKKqScbCUVlvKUC/uvZ2QCNt7fGIE2AbPB9tMutJ9w?=
 =?us-ascii?Q?SK7W+6IKhaIRgKzw1wtMMKD5ka92jv+74cD92nZTZtMGldGclHR4NM+xKkcb?=
 =?us-ascii?Q?2NE5TAFrGLnDeumHDgW+7JYOacYCFNqy0p1BfGVuAJqKvyloH7JytwEv+Jkf?=
 =?us-ascii?Q?xYldyTuCgVf3KxR+AXwiNPmByYj3juWtnrFbeTmgpGtfDWLnDXozGQ90jr4j?=
 =?us-ascii?Q?S/6kT9ktfUQNB59Eh5xQwBfPEVPmry0Eqt7i10xXvN9BNkPYGiHj0CgtfTrO?=
 =?us-ascii?Q?NXf6nCs74Jyh/uc3wvjRSnXIoAjtcnEO/hOpmrQLLPU7ZZyDR76xyu4Cr39w?=
 =?us-ascii?Q?altjRpZIU2TIMGPelnBo4RgTqXzM3zVd60ArAmFVgNekzcJZFptvmlK9nsOK?=
 =?us-ascii?Q?GQbqpUCNlmqyWjkdIfJo4vGJF9sihjmCikpdDiLAUrtWNfcdj3mJKLdY82wc?=
 =?us-ascii?Q?1VJh8po1Zay1Yf9LM3yv2MzkvvRb4vbLTCZh/5b8HJU+w19xUD/4kF8s3A3q?=
 =?us-ascii?Q?26NujgiVnaxrKy2CwZ1KYJxcS7G/VQEoyDzZopFBrMM/EomSRRe57t5zS7kj?=
 =?us-ascii?Q?2c6ccaa1XUHKOacv83LZN669TA7lbCt6qCSyvN+36lI66nlE5T9C1TzGiWy4?=
 =?us-ascii?Q?/NChx7aDvbVE1iQVuvjy02wv8TefNSvlPqm6b1AWukou0R5jpWnEJCYjgVW6?=
 =?us-ascii?Q?XLQYm1B/6dMv6IV4+B64XFZAVT9t64p9CIQ+iR5iDq//dc3iwNOyHHu2DFJE?=
 =?us-ascii?Q?0A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5158ac01-924e-49bc-16fa-08db7f218f1d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2023 19:37:12.0214 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kVgAUJN6lv1C6O+Dg3O6a3sF+Yf8z7VTZhY0KZNcZuo48k1y3OqCSxRPvzE6SB8851rR0lQ3S9FM967vdhEptw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7747
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v4 4/5] xe/drm/pm: Toggle d3cold_allowed
 using vram_usages
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
Cc: sujaritha.sundaresan@intel.com, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Jul 06, 2023 at 05:32:07PM +0530, Anshuman Gupta wrote:
> Adding support to control d3cold by using vram_usages metric from
> ttm resource manager.
> When root port  is capable of d3cold but xe has disallowed d3cold
> due to vrame_usages above vram_d3ccold_threshol. It is required to
                                                 ^ typo

> disable d3cold to avoid any resume failure because root port can
> still transition to d3cold when all of pcie endpoints and
> {upstream, virtual} switch ports will transition to d3hot.
> Also cleaning up the TODO code comment.
> 
> v2:
> - Modify d3cold.allowed in xe_pm_d3cold_allowed_toggle. [Riana]
> - Cond changed (total_vram_used_mb < xe->d3cold.vram_threshold)
>   according to doc comment.
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pci.c | 27 ++++++++++++++++++++++++---
>  drivers/gpu/drm/xe/xe_pm.c  | 26 ++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_pm.h  |  1 +
>  3 files changed, 51 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index ce4bdfcbc46d..8585b090ff0e 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -754,6 +754,24 @@ static int xe_pci_resume(struct device *dev)
>  	return 0;
>  }
>  
> +static void d3cold_toggle(struct pci_dev *pdev, bool enable)
> +{
> +	struct xe_device *xe = pdev_to_xe_device(pdev);
> +	struct pci_dev *root_pdev;
> +
> +	if (!xe->d3cold.capable)
> +		return;
> +
> +	root_pdev = pcie_find_root_port(pdev);
> +	if (!root_pdev)
> +		return;
> +
> +	if (enable)
> +		pci_d3cold_enable(root_pdev);
> +	else
> +		pci_d3cold_disable(root_pdev);
> +}
> +
>  static int xe_pci_runtime_suspend(struct device *dev)
>  {
>  	struct pci_dev *pdev = to_pci_dev(dev);
> @@ -771,6 +789,7 @@ static int xe_pci_runtime_suspend(struct device *dev)
>  		pci_ignore_hotplug(pdev);
>  		pci_set_power_state(pdev, PCI_D3cold);
>  	} else {
> +		d3cold_toggle(pdev, false);
>  		pci_set_power_state(pdev, PCI_D3hot);
>  	}
>  
> @@ -795,6 +814,8 @@ static int xe_pci_runtime_resume(struct device *dev)
>  			return err;
>  
>  		pci_set_master(pdev);
> +	} else {
> +		d3cold_toggle(pdev, true);
>  	}
>  
>  	return xe_pm_runtime_resume(xe);
> @@ -808,15 +829,15 @@ static int xe_pci_runtime_idle(struct device *dev)
>  	if (!xe->d3cold.capable) {
>  		xe->d3cold.allowed = false;
>  	} else {
> +		xe_pm_d3cold_allowed_toggle(xe);
> +
>  		/*
>  		 * TODO: d3cold should be allowed (true) if
>  		 * (IS_DGFX(xe) && !xe_device_mem_access_ongoing(xe))
>  		 * but maybe include some other conditions. So, before
>  		 * we can re-enable the D3cold, we need to:
>  		 * 1. rewrite the VRAM save / restore to avoid buffer object locks
> -		 * 2. block D3cold if we have a big amount of device memory in use
> -		 *    in order to reduce the latency.
> -		 * 3. at resume, detect if we really lost power and avoid memory
> +		 * 2. at resume, detect if we really lost power and avoid memory
>  		 *    restoration if we were only up to d3cold
>  		 */
>  		xe->d3cold.allowed = false;
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index 07e204990aa9..74a9bccb78c7 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -292,3 +292,29 @@ int xe_pm_set_vram_threshold(struct xe_device *xe, u32 threshold)
>  
>  	return 0;
>  }
> +
> +void xe_pm_d3cold_allowed_toggle(struct xe_device *xe)
> +{
> +	struct ttm_resource_manager *man;
> +	u32 total_vram_used_mb = 0;
> +	u64 vram_used;
> +	int i;
> +
> +	/* TODO: Extend the logic to beyond XE_PL_VRAM1 */

why? this looks the max we have there.
or should we change that enum to have the XE_PL_MAX?
anyway, it doesn't look here is the best place for this todo.

anyway:
Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> +	for (i = XE_PL_VRAM0; i <= XE_PL_VRAM1; ++i) {
> +		man = ttm_manager_type(&xe->ttm, i);
> +		if (man) {
> +			vram_used = ttm_resource_manager_usage(man);
> +			total_vram_used_mb += DIV_ROUND_UP_ULL(vram_used, 1024 * 1024);
> +		}
> +	}
> +
> +	mutex_lock(&xe->d3cold.lock);
> +
> +	if (total_vram_used_mb < xe->d3cold.vram_threshold)
> +		xe->d3cold.allowed = true;
> +	else
> +		xe->d3cold.allowed = false;
> +
> +	mutex_unlock(&xe->d3cold.lock);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
> index bbd91a5855cd..ee30cf025f64 100644
> --- a/drivers/gpu/drm/xe/xe_pm.h
> +++ b/drivers/gpu/drm/xe/xe_pm.h
> @@ -25,5 +25,6 @@ bool xe_pm_runtime_resume_if_suspended(struct xe_device *xe);
>  int xe_pm_runtime_get_if_active(struct xe_device *xe);
>  void xe_pm_assert_unbounded_bridge(struct xe_device *xe);
>  int xe_pm_set_vram_threshold(struct xe_device *xe, u32 threshold);
> +void xe_pm_d3cold_allowed_toggle(struct xe_device *xe);
>  
>  #endif
> -- 
> 2.38.0
> 
