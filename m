Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8B5BC77B61
	for <intel-xe@archiver.kernel.org>; Mon, 10 Apr 2023 15:45:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAFDF10E0A9;
	Mon, 10 Apr 2023 15:45:03 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18ED910E0A9
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Apr 2023 15:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681141501; x=1712677501;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=1p344YCZxsZTEtA/z3KXpyxqeI5PFsxVDxavXFIDlOA=;
 b=QtAfg2hoB2D64gKp5rS0Eik3R3qX2UYB2pEKyFovUlL9/5Ev+VPXfie7
 3WjV2H+3f+5JSUO60aD0sZOuG5cCBhYBBgCVhpuZh6cU0E0j1qvu5DqWW
 8TZk9+YBzqbIP7CDAslpPKKUJQAu+zWmfbDUGj9yt5GKBHtHMrny9JHH8
 32Thgyv0X+/5ZJ9Jfa1GznzVn7ePKPRp1g7Rn+UZgJDFgIuHhUuuR0wr+
 4gUNye7AaMXxRCBQCUusoV6Q8AtU7fuCjGmxfe0SIsK5f6VxNrbHJe8m4
 wHnb4HtIFq2gPdHLdD+GNbnEela1AU0aHZEMQSSTB3SB+PxlarZfr9g4f A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="345166794"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; d="scan'208";a="345166794"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2023 08:45:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="638493232"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; d="scan'208";a="638493232"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga003.jf.intel.com with ESMTP; 10 Apr 2023 08:45:00 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 10 Apr 2023 08:44:59 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 10 Apr 2023 08:44:59 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.102)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Mon, 10 Apr 2023 08:44:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZuQ2Re+3QvKPAmvLUWPnA7safHXtiUE+YSaH+W0jVdZVxqPeOyEk+jI3/DAvHTCTiw6LJJ+U3wqiJi257IMW+XFgAEhhbi8AVwXo7MnZs4K/dL+fcGH28YgHmE6xCDYsF/e03ZKs+aiGtuZiJcdfz8cuqZ4RSr11Dw9KdVumR+VTM5qUdvtpvuB4nKaGs5LFJ6SyOQqwVqmCkbDLS2XeOEDJhFSuJRpJi1KJcyY/DXILB5EfFX1AzgmSkMKtIsBENpwsLkVVqDiT8gDhhiokxtDnLO8ZNaDbta6uf2GzC1xzMDk4nR6OYqXQB9f4n30vQDq4heduC5P3PbwVYWJC9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KElfvsKcy4lrKGxwTHB+HBlaTbElQcaB2wWJac4ARJk=;
 b=hiCx0kbGv2lH8Ez6O503uinsSB+WLZIKuZKhoE/ahCsJD+j+RY3KjcnQgnmAXzNITXN6PiuH8312myBQVi8RWcpjgdNLiE8zWtzvP5ci6OfW4aq7R5ar5ZyJc1dAB4Iw6lwbD01s2ZJMAmRo/ue4iVU/momHG4zapjgtUN0Hf6v5FZAU/nk424V5vmSf5eyfZrDtTMAv9hPIk7bin56Aaa4SsKo1YGd7mfaQg3t594ZDERUXsy0uERrpLWPV3ooAVEBVueBSK1aC3vIOH4kln5MeMb3cEBlctSDtA6Hsz2J4ov9aYy6LZYXtHlLT4z+fLXOW9gOqhWOgXk+LRDEE1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ1PR11MB6131.namprd11.prod.outlook.com (2603:10b6:a03:45e::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Mon, 10 Apr
 2023 15:44:57 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::2b57:646c:1b01:cd18]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::2b57:646c:1b01:cd18%6]) with mapi id 15.20.6277.036; Mon, 10 Apr 2023
 15:44:55 +0000
Date: Mon, 10 Apr 2023 11:44:51 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>
Message-ID: <ZDQu8zpiGSbibMOl@intel.com>
References: <20230406143133.29474-1-jose.souza@intel.com>
 <20230406143133.29474-6-jose.souza@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230406143133.29474-6-jose.souza@intel.com>
X-ClientProxiedBy: BYAPR02CA0071.namprd02.prod.outlook.com
 (2603:10b6:a03:54::48) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ1PR11MB6131:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f01cb59-8b1a-4a85-d5a8-08db39da87f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hzhXX+2GN6sAVRy093EH79uGM/43awnIArZZMWm1WNazyPPInZRYpLHVD3N9F7NhMdjn5g4koK3/u+j/afBW/OMqsrlscmPZK+IXO+Go9y+splCEjRJcxsF+vUOZiNJQRH0wrVHa/73EI3Soy8gN5YlrqFcizqQeFuiRWfHwvySns5R+ENeIbNfzTOWkPl3uam90dH/MltSrDa/bAwfCjDBfxwIz8Bu8J0rjZJ7+BjURsyWrXYENb6ohOdQkT1qAy5w1qU0EaMjFUYdBqSUF1kyNcgx60d9062KX3Ga7QJ0Zp8p/GV/KCaCH7TRANO/y4wIo+rJf2sFxfvfZ0Q4i5ripWTfOrgNNLcSRcYoq4+XXlgqe+CHje89aV0qYG+mMCw9CMk14INJUZRBkUS3q9cxedR/pHza+dDXaQ+0mc6pKYRwmSgvpq3BmuTgYPFs+jKjPOUcDP4YpKicF48nQgjuFlODuFE/zywMy9cE6a0l4XqAPFf1gWzIAts9O3G6Tc4rdK/ey6h9mNDblf1BHAT0689/WcLZZqb8cIkJ8q+qiPm6eBe4Z16amc/Ob16ey
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(346002)(376002)(136003)(396003)(39860400002)(451199021)(5660300002)(41300700001)(478600001)(38100700002)(2616005)(6862004)(8936002)(8676002)(82960400001)(44832011)(2906002)(4744005)(186003)(86362001)(4326008)(26005)(66946007)(37006003)(316002)(66556008)(66476007)(6512007)(6506007)(6636002)(36756003)(6666004)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?/pxvXM4wvLjIhs14WsJz4BG43PXrvfjo429EP4waYvDIcYlLdxH+Wj/HBV?=
 =?iso-8859-1?Q?NxEOAPwoamyGD7KlOR8rx7PKV1vw2VzBTnnjGp7lZtJWYhQGNR5ixtfpaI?=
 =?iso-8859-1?Q?9wJ1+Bo4RxNvWoa28qP7E+xUPocMRhMXe2SWl2wbQg+ig0IQMaePF2RWIB?=
 =?iso-8859-1?Q?eljxIMa87ftgR3Yg94Gv/4tZdlni8w51ebxOFkkCZzdVrDIABrWe7LqwdT?=
 =?iso-8859-1?Q?sivN+NVaCtOLZs+1IkYYupx06gY0JxfjSE83w0lhRlvJ4oibMcNuXrLK0c?=
 =?iso-8859-1?Q?32JAw0aC8SHaTFj2V5zW59XdoFAG5bYqESikpK3+MiWEcfWFQUPJzqiMl4?=
 =?iso-8859-1?Q?Dtw+OhcTvrkluy+4VjOQLZqEhbKn228QW7TFhyyR3Go3z05N4mz7DFIJm2?=
 =?iso-8859-1?Q?Nj4UQvfSM4O22D8of4hed1PlN+t1YwlGGQlYEHgL3tm0dO8k/2rz0OV6NJ?=
 =?iso-8859-1?Q?DBd/vB4sr5xyAD/dRFeS/CJUoBr8syqxjWq61baqH8gn/txwS33MuwPots?=
 =?iso-8859-1?Q?1YQ/VIyOSKmk6PmLwj0RT12YVBFJcpay3d7GCGyOURqc+qdFvnmsCnNDYz?=
 =?iso-8859-1?Q?S51vbZ71SDe9LioeKXIXG2QX+kMHw4+Ykxwgfn1zW/nhBwntWXe4309/cG?=
 =?iso-8859-1?Q?URJ+xDe1z78cbICJopmWknLSbap8PbK2+RZfEjodmKwAwm6bLbhR9FADAw?=
 =?iso-8859-1?Q?4f2ldexzDwCTvccN2srDyj6MVBWyPs9jqZQqRh/8dp0HDG5KtRrKE8PExp?=
 =?iso-8859-1?Q?adteyLdTkucuXu3I3mXQEiqgdDrQ5Anw9Kjej3coYxnZGzpR2edDSiawdR?=
 =?iso-8859-1?Q?OTqKGeZXbdY4ycF5B6lYIXouQRcIxJI+qCjYsvNd/UnUyXRtWXxXNi64St?=
 =?iso-8859-1?Q?Y7NmoSYjrpdi1xZ4q41UkwTs1IIn0q/HbQ4lx8EDbNPtMtevrpHD3pFWqM?=
 =?iso-8859-1?Q?+CZmbxhe9y21eQggJnxyM6/86sZeDetNO/b7QI+lO3e5UM3rSa+a8AbHS9?=
 =?iso-8859-1?Q?RiEN2ZqMdt3dhxkGH5dt1+POS2EjmVgY0+3Y7Hyu5l3uAnacSUhIMrzU1I?=
 =?iso-8859-1?Q?FLzqN/Q7vUpNQixuUM5Bl/A7mbCOgReKYJU1L/MOt7tb1YAduS3t2C9vhK?=
 =?iso-8859-1?Q?dp80N840oIfdy9viGp45OYyflSBRg9Q9A9r6BKUllYQf7DfRvO/SrjFNed?=
 =?iso-8859-1?Q?PJFH6sbllIdIw63yO7mu2Ac2QgUPp32Y/ZhIA7WglKpg3MmnSVV/cardfs?=
 =?iso-8859-1?Q?8Fzi5Km0Uqn9b3/k43ZB0IHiZTkSAez48UadWOetUyYR6n8PNXO7+Yi0MK?=
 =?iso-8859-1?Q?NQ5oE/B5zs0uYizqaiLODF6MDsv4YDwsnCsH5G6PD8Jr3xgZmnmRCsCSp6?=
 =?iso-8859-1?Q?pSi5fzUYP/z/H5suUFy2IYLVM8+N3pfA72z8GIs/TEbZGVxmRYDf3lYdze?=
 =?iso-8859-1?Q?YS4nPVTfKEkhRRLkcx9mP7Cq2ajoMHEuEu0pDq6DhTjGbIQFgR8j8FaEVr?=
 =?iso-8859-1?Q?YjiCjCFd0FMhfyf43Zno5F2CmbQosNIMpQ4gV9li+NaoBMZnSZ/rdVf0nX?=
 =?iso-8859-1?Q?XN0GTEYPVepF8i5FXGKvCr7cdp2CTMFPDhc7CoGEO3rTHTJ4OCRnHFqaea?=
 =?iso-8859-1?Q?tTJfuOAS9BEyGKsB4jBHX2m/kucnXAN4sh?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f01cb59-8b1a-4a85-d5a8-08db39da87f1
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2023 15:44:55.1379 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vk26dUtWO+WGul1NLUYJvhlLncKFzwNNym4lG+SUyzV44pRi2CD4xxC2wiySrMgvf4iVMARir1MSNK/FOWgyow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6131
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 rebased 6/6] drm/xe: Enable Raptorlake-P
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Apr 06, 2023 at 07:31:33AM -0700, José Roberto de Souza wrote:
> Raptorlake-P was tested and it is working as the same as Alderlake-P.
> 
> Signed-off-by: José Roberto de Souza <jose.souza@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_pci.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 20be113544fac..d5e1c8f7d02a5 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -288,6 +288,7 @@ static const struct pci_device_id pciidlist[] = {
>  	XE_TGL_IDS(INTEL_VGA_DEVICE, &tgl_desc),
>  	XE_ADLS_IDS(INTEL_VGA_DEVICE, &adl_s_desc),
>  	XE_ADLP_IDS(INTEL_VGA_DEVICE, &adl_p_desc),
> +	XE_RPLP_IDS(INTEL_VGA_DEVICE, &adl_p_desc),
>  	XE_DG1_IDS(INTEL_VGA_DEVICE, &dg1_desc),
>  	XE_ATS_M_IDS(INTEL_VGA_DEVICE, &ats_m_desc),
>  	XE_DG2_IDS(INTEL_VGA_DEVICE, &dg2_desc),
> -- 
> 2.40.0
> 
