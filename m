Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD4F4C87FCB
	for <intel-xe@archiver.kernel.org>; Tue,  5 Aug 2025 12:55:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 643A910E26D;
	Tue,  5 Aug 2025 12:55:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mqk9Mldg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 861CA10E26D
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Aug 2025 12:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754398549; x=1785934549;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Ol/Y7OVzzIAWqHxY696GVMIyZr+A25d37f3VLIwCVdo=;
 b=Mqk9MldgMmhXwczzlLSVgn1Dy0IJf/m8/HxdiTvPuNuzxApCI1+hMiN6
 A+OaWUPW4GKcEYWHx8NCWQx2F0BgJpro3tFLShLtkN/bOBZWbNXy2YoE9
 4VHc2UjEavWXSmaHqBRgo4wtiEOfk3BWpdaS2tUyCfNJGEGlZ43Nxb6oJ
 9+GM/krgqzFDG9ZjFxCa3s35XHuQX1YQzQ94TF08xX6NgVnpSZtwiHOIl
 YZ6WO4grzCAvzUHTXcORsrEtMjfBMauIqKmXCaPQkHW6UcZVIeyrEWonn
 i+yrZO20QJm5ai80mqolA6T09vyeYo0VE9LzVWGdDcBzpp6tTCK2n5Pk0 A==;
X-CSE-ConnectionGUID: 6OAh+T7ASSiwpqLBHm8/YA==
X-CSE-MsgGUID: AX+/D0RqRhyq4kFDEcoVsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11512"; a="55729080"
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; d="scan'208";a="55729080"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 05:55:49 -0700
X-CSE-ConnectionGUID: gie8J6K6TXGzFa5pwnJolQ==
X-CSE-MsgGUID: Xwk2F/zqRIm4Z230qntyOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; d="scan'208";a="169870107"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 05:55:49 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 5 Aug 2025 05:55:48 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 5 Aug 2025 05:55:48 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.77)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 5 Aug 2025 05:55:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uI+jjwDbjaQXoPavpAUGO1GAW0chpF5i3Uu1IfOWMajfl/JX7AwwgBPh3xU2pvU6G/zVBusVyNU7tiJhHoI3XC937I37MzfuPxua9MUsltXYhCxgxZpiFeAIk/vlfTHUmreQoObPquZoSHBEv4eJ88stLXMZfdJjRm8TIkD4mlS1WdCyPciEt7n2zFJOPRvx2MQllG/vVEnUuR2uyt63c5GkLzfgwfslgHQVX9YAnBHZFng1faRApPn8Ns1UFIxuDrDVOK+sMJpZKwyWDgfh25bBz2L0p9Cc+rpuF8Xo/wOXKMcEOowDyNJJg0SulAhk8BDa8yr9HUrVvPNdfw9zlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YOtOGB6E6dmUhf7gm2/7vdTcetYDqApXz//Z7lQo2MI=;
 b=kDzKfTC7dWNwqO+pCkP5OdkecRcluMVaN78A+jiqXNe9SHltoZW+i6kWsjcg7UEXV8NonmRzjAxPGm/Usp1d+8QmXoNmYAjF8uRWH2MiU4ubCA5/sBE8xmwwiZ05wiWtQuyUEGAL+Dfx+h8oWDFk9zJvKgI1MzCLBWlkGBAvdTjOOjoWcSGi0nNAxbCbGrSAprq5VVQFYE66vTstmT77qEao8c23t3OKd8VAH5f7Hg1i0sYLQWNfwqwRflAIjDWTbZBQrcbhijvHfOnZ1CzCkcY2/enaMqSDuFG2nmPh0JwIYaJ3x9Kkh9KwKeeeF4DQXQ08PjO324KIcHVaEofUyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB8157.namprd11.prod.outlook.com (2603:10b6:8:187::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.13; Tue, 5 Aug
 2025 12:55:18 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8989.020; Tue, 5 Aug 2025
 12:55:17 +0000
Date: Tue, 5 Aug 2025 09:55:12 -0300
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v5 04/11] drm/xe/configfs: Drop redundant init() error
 message
Message-ID: <4cw3yfahr5hvnkgq6fifn6n2znorpqxyokwmgfaemwnwmwwpwa@a6457cwd6r3v>
References: <20250729114215.177586-1-michal.wajdeczko@intel.com>
 <20250729114215.177586-5-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250729114215.177586-5-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR03CA0007.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::12) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB8157:EE_
X-MS-Office365-Filtering-Correlation-Id: c03fdbe0-0599-4c8c-98b3-08ddd41f53eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tui1tYA+aZboncIMg96p+30FVrgqgHf5wXw8k9KlpJrBdxZgDaaG+1QeLj7g?=
 =?us-ascii?Q?Z00iR1UZjGdbkGd6hFRe+g+TVIsSqmouRFr/QGwrIRBWWADFrvZQqp7g+QIK?=
 =?us-ascii?Q?VzutCIOSv9EcFy3g96fKlAIf5yIMGC0ENcE406g8erlsznV47kDZM5BWhh2A?=
 =?us-ascii?Q?uCGTMh9NEbjk9JBDxnIxyPNKAScBZ8F68FU3iYy5e0SQJpT+YTjh5RWmqYnU?=
 =?us-ascii?Q?BCBe1NZs8YMm5yg29x02iItTfy3X067s8ZlXk4m0LKRFweuonLcPbYopBI5r?=
 =?us-ascii?Q?UZIpwYSUcxXRPw8FwHs6ZvYjUtgUyUZ5D7Poqv6+15y6Z88PtEQYtHwNFvCx?=
 =?us-ascii?Q?8gPvPokI4b25Ifrw6+eI17WgVn5A9ZzehPr4TUBCYKXRaKXGylo56UFOV8pt?=
 =?us-ascii?Q?QiOnHaMkEq8r6BhwNRRZyQzyDEcXi8Z491e1KElCf5VJcF3uAovkb5Wl2hyG?=
 =?us-ascii?Q?vjFyru2hQSv+IoGVKPsgVmTGkE1cSEvOiwdhGxRj7hHYpaYI+/CzNZE5pMjt?=
 =?us-ascii?Q?GzkZE4oVrMsHyvneW9p/JTz7NE/UExUyBdQB7OPQz6vrJkwEJiwDwtH1Wrxu?=
 =?us-ascii?Q?SeP0QyO9jhZKxPR/8RrDbBKOWB6OBvql1YeeFxsNR7ZxVJknuD8D3GNsCIWx?=
 =?us-ascii?Q?CceR2m2mtnN3s9E4DuZ3XiuTPD9F3zFdLguSxh0LpWbp1vnP4M5q3gD2dMO9?=
 =?us-ascii?Q?nCxz2M1ZP+FK4Jg+U7CZZlTExdoVSbPLEDDxZurqVZoEEMMhJB5xpybQHOq/?=
 =?us-ascii?Q?ukBLyo14zFXhW4Tpj+T6e1mDpCg3A2gPIDXXQdLmSfdIjUK1zmmfK/K7JcFf?=
 =?us-ascii?Q?I0l4UK/W2fsOmixOiIKfvSe4XUv+MKwfWNMd7D+7/Z0N9/QXWcHEdwBMLycw?=
 =?us-ascii?Q?KIH/bkl8BrmhDxCxZ6mwJUs4GFNuDAP1zE2XHzRvPrDI+3iHEtFLik/P2MnX?=
 =?us-ascii?Q?KiWC0d/TkiPAAPLX5YFyFT82gBGGps41wwRhnzYbtrkOEqpw7diiCqkJQciX?=
 =?us-ascii?Q?dkOflHwXDn6qN5DfjznV6YdDXWsKvZ6vpNSXj4f7vdKPQbRpRc93EsVzUJul?=
 =?us-ascii?Q?2oiFPCI1xq+7Brj5cbpYNI5HbH7ZhSHi1yXQ+EiIkt8eE0GHP5ynnMQwlXTI?=
 =?us-ascii?Q?9cR1Q9wOdF+jEvgsHCNWWNtcxUVQX8MPqAKroB27oXKEOY1UBrTrhgo+1oWT?=
 =?us-ascii?Q?OoPHxwUT0PLfFKLz3LjPoSN6UtaDbFuOtRV0NYYnMGTma5KVx/XRpCjL6B5x?=
 =?us-ascii?Q?FymRPmB8H2/JTm07VpoDYYZlNSS6E1gHVoMwyoNzIv30uJNWfjGYWtEuA5+w?=
 =?us-ascii?Q?skQod7Vt8H5hvW9OngyYBcwuUUYD2g1s0yWn8jVPvc+NRdKmCdqwPVxke6Qm?=
 =?us-ascii?Q?h3lhstXMWap62bbK1X3oRhQPKGXQ40WSLW/ItgTxrpx+rlVbEKNTtWR9Mmew?=
 =?us-ascii?Q?3MtqT5N0GKg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Cx8553u2MVP08D6W4nDxl2pgNQDY/Z91F+fr3ehK0cBGRtxD+/bJgqFGJxin?=
 =?us-ascii?Q?2ZWXVeZ9ufe0b7i9gxmqu6vg7o1ijav0GvkhNuLWICPh9jm88VVwpu2H5AUU?=
 =?us-ascii?Q?aBsDzbE+vIq9Lx0P1A6PxVnLqlASqOVUQoNw2HMf44OYvbm6P2lQpImQyBsZ?=
 =?us-ascii?Q?sgjCruBt8eM1a/aOflK0nYSH11ba7utc0fAFWsdcNawfWocVXCEDdCshNfBd?=
 =?us-ascii?Q?lBq/HyWxw3cynPPPl0yip1d6rc55F82273MNMeXS1lgU+YtxENuoSPY89kzt?=
 =?us-ascii?Q?He6/2uyLzqo+WkDB1a0vqF1QM58lDXwkQ/iXk3w5GG+r71l5Xh8ZHAh1n22J?=
 =?us-ascii?Q?mkUqW5zUMAsSp74nTulYzuHXSWEWyYt3OtBXa8FZEKYZt+nYZOxJMUIUlJDA?=
 =?us-ascii?Q?jAnrtWJONS2qLypL2768D/JJq6Uuv+UZym8/zrA1KXwi0YGpkx3CDSaqDxZG?=
 =?us-ascii?Q?SUcg5CUHYZ84+00jhBZKkGFn8jILPPrtOz4a3HY9qwlpggGgUECDZ/mn4VrZ?=
 =?us-ascii?Q?dfV6PW5CrsvrhtfxLAfK+hLsNH7XpvfIjUNDE0Ub62xjpZ9oib8l9luwaIa3?=
 =?us-ascii?Q?mWdH9MDuwatzJv7YaD2uIqQxV2hCDb4wPl5cs2sPTLfol5v1Urde1En/55a+?=
 =?us-ascii?Q?7jrRa7Yumo69piLXhZbRpIUk/v2xaytiSQIF+UhWq73jlikluiCQdggJ/5eT?=
 =?us-ascii?Q?lMJi6r+7BpjgwVInmBI4YApPKGXAaAjj2CNkoMKuBBf2TP7RJ0srQBZPv7CG?=
 =?us-ascii?Q?43XtUAc01z12sn2VD6NtqXR12+NXBCi6/Y8oFehSyeOGz/kQzTtdINMTvUli?=
 =?us-ascii?Q?hrP2CTbf7JoaoXbWtLo9vFwGH6NAS2sHF260H2wSyzWcPwmQlzfLOJXsffKV?=
 =?us-ascii?Q?tpE9K0rxjhFLsEjAXY6M0Rvf7YOivcY9UxGSwAs8Ow+nCY7cy03QfbTjJnpA?=
 =?us-ascii?Q?3+TiQ7mo8XRKviNCgb9wdZ5FNyFd4+q81cTfgh/NqmblfsRdyTO3V76Exy18?=
 =?us-ascii?Q?FQSF3jxl8tZeJ63XT9d1f+fcI6UxHnCAghkaEgjcmwHb7QixihogShlv+UgI?=
 =?us-ascii?Q?9+m7jSQfJCNkXHZnb37RJoZxOmXMivFwcDh4Mm408nhSPbHauOY1Z/3C0ibc?=
 =?us-ascii?Q?bZ+I30sBt385zBtDtlK74bLl7RY98Jg+OQQ85N7l/jRJ0WFYYx+lk+WPjA/9?=
 =?us-ascii?Q?Ca64ubRhkIrmWv9W5q/vXeh5pMfPiRK3G4i14e9WUrYeef3Yk/Cw4NThih1x?=
 =?us-ascii?Q?/ra/riU/TBxA8rBKCjXrn7G6XQACJ1R/IxEMFDCOw6K75lLW2KYgqYKVnpBE?=
 =?us-ascii?Q?uRnuw8ijZXYhcsV3qPCKXMxx4Rb0M9ImIpoil5/0g43SS1L+LDRmIbuBtY59?=
 =?us-ascii?Q?hWFCtamhQRn1bzmj7eLWBpOkn+8QWsfftXsvwWxseQJrrl/K5e/REy7xEFSP?=
 =?us-ascii?Q?XSBWv8R4DewvV0RlnZcycLOZaU+jpvaRCcDDh+VHKzREyZabOet63fTPHzfT?=
 =?us-ascii?Q?Sq0rh3V42FFn65IyWIq6Rhjf+j/X9O1mm2p4bLlUsLgrempxDPus7woUYUla?=
 =?us-ascii?Q?DXYPiKVnMgPq0U1TbcTl+CNxIEHqf4eba32a8QmcuxWr3T/QuVgJ6fVvzSE/?=
 =?us-ascii?Q?2A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c03fdbe0-0599-4c8c-98b3-08ddd41f53eb
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 12:55:17.8781 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 09+l+RKR/IGQUuOd4/7x+eOHe4bkk2uMSKzRpS3HSGbnGaMxc+5qAW1aXMkFXBLN/vOfodtAPbtS2kGhwebc6ifyq2jbFGdm1Pq8PXRBWtM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8157
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

On Tue, Jul 29, 2025 at 01:42:08PM +0200, Michal Wajdeczko wrote:
>There is no need to print separate error message since we will
>also print one in xe_init(). Also drop temporary variable, which
>was likely just taken from the example code.
>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_configfs.c | 5 +----
> 1 file changed, 1 insertion(+), 4 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
>index 56fbf4c1c37f..6aa0531bcf76 100644
>--- a/drivers/gpu/drm/xe/xe_configfs.c
>+++ b/drivers/gpu/drm/xe/xe_configfs.c
>@@ -392,15 +392,12 @@ u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev)
>
> int __init xe_configfs_init(void)
> {
>-	struct config_group *root = &xe_configfs.su_group;
> 	int ret;
>
>-	config_group_init(root);
>+	config_group_init(&xe_configfs.su_group);
> 	mutex_init(&xe_configfs.su_mutex);
> 	ret = configfs_register_subsystem(&xe_configfs);
> 	if (ret) {
>-		pr_err("Error %d while registering %s subsystem\n",
>-		       ret, root->cg_item.ci_namebuf);
> 		mutex_destroy(&xe_configfs.su_mutex);
> 		return ret;
> 	}
>-- 
>2.47.1
>
