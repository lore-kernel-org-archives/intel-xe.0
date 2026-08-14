Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73ACFC5B572
	for <intel-xe@archiver.kernel.org>; Fri, 14 Aug 2026 18:45:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D38310E1A8;
	Fri, 14 Aug 2026 18:45:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jWqvzlhb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A962810E1A8
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Aug 2026 18:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786733155; x=1818269155;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ucrhKhp3QG1oxN+rT+GwTlZo8NgofLwxhkaAzbr6CTY=;
 b=jWqvzlhbeYvShB/sLusrZDQNf2KGANSFk1l8S2/m1p2PvEyjeyBYJ1T7
 RRcjpVraK6VCpjsDO+zIfw7I+fI/ZFp94JsgNs/Tlg/Mz06QAIASq2hhI
 oS/Y93YCn1L947KGhqo12+2sHGh797CRYs3lYMBksrlf+m6143eEj8/8N
 gG5wNm0DuNGoVlK/KbALOlQEsIfSCnWxc8uLsCK90sryKuArtb7TIrttn
 644+SYxkx5XkE8zNpvVz0b5w3EFCC5uDzYvXT2K3eibS8Yb1ikPhFCotI
 MtbLQaI0Lq6sXkfVbKvq6SeSiRWqZ5raxFhg6XP0OQdiE8REWjnJIjbRm Q==;
X-CSE-ConnectionGUID: 2Uf3GOVbSFGAE6dAzt9F0g==
X-CSE-MsgGUID: 2ExL8hfvSvqdhyQsthNrOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11875"; a="87445635"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="87445635"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 11:45:50 -0700
X-CSE-ConnectionGUID: jFUOYqAKTiqDW/bvUb9JUA==
X-CSE-MsgGUID: 2R1ktGZoQ2inS+d5cAjK4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="261653525"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 11:45:50 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 14 Aug 2026 11:45:50 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 14 Aug 2026 11:45:50 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.12) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 14 Aug 2026 11:45:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s539PSqKPZrvLA953MdE6gCiQyHUVc8EO8VCKrAFrqot2ToxM+THugkhk0UPmgwrc903QdaQOJIVLkuyE+JKvWwjPn4I5bwo4cg3pqW/uoCqB8e2IMeqeWmU7UCOBRwslz2zTsvU5fJ4J8Nxz5JuAt7jDK3nWGsqUgiYKL3zlxNKa+xBfyAa/UFt0LmCOldf+P7Y79fGOMYvTISvFce9qvAJ5SEF2bPEXKSXZ40y5OxCoYRWhpzl9BLgfKx6VpvmaX4WpXCZJ4J1cEADoV9y6Uze7UOIqQJpXognERQ6tFi6eJwq9MoeqPYNZ1RGZeCCVSzOb9eePxjZDn02jD1Xpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iR+s26DhG4IcaspYqhImvZqWxYaP/RJCVREXjfLzotw=;
 b=vFsG4sn3FdwPyY4iJKUSdEYEokg1hWLI6HosdGzFxEfSqKcg9CHm7bgG1xbVwKMw4qYotQgJRnWJZxjkGAS+qXmgB+WjVvJc94/+a8n9xFmWHL1uWl5WbwulUSQbvr82Wdq0JAcFU+uzCQyH5esWEX+G9BZHpHN11ofukQV8aKAoWsTl4nF6wfUTudNfcc7OQMVKL79sRcDiL7tHjunIrwHNM4pcxT0WqHME9geBTe6139XOiM/WbMMipFe4F9aQHwkCpgL/HnbHxeyZNqTjrYqk/QEpeMYNYKTJMgjqI/O1m4FmA2afy5z2AqunBLAxG+UQvEX9IFFYYgRqjwsBog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5073.namprd11.prod.outlook.com (2603:10b6:303:92::23)
 by MN2PR11MB4679.namprd11.prod.outlook.com (2603:10b6:208:26b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.14; Fri, 14 Aug
 2026 18:45:48 +0000
Received: from CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe]) by CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe%7]) with mapi id 15.21.0315.014; Fri, 14 Aug 2026
 18:45:48 +0000
Date: Fri, 14 Aug 2026 14:45:44 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Riana Tauro <riana.tauro@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>, Mallesh Koujalagi
 <mallesh.koujalagi@intel.com>
Subject: Re: [PATCH v5 22/33] drm/xe/survivability: Report 'boot status' on
 sysfs failure
Message-ID: <an9iWBlYRPbDaqOK@intel.com>
References: <20260814171801.13347-1-michal.wajdeczko@intel.com>
 <20260814171801.13347-23-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260814171801.13347-23-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BY3PR05CA0052.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::27) To CO1PR11MB5073.namprd11.prod.outlook.com
 (2603:10b6:303:92::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5073:EE_|MN2PR11MB4679:EE_
X-MS-Office365-Filtering-Correlation-Id: a9440c1d-bf1f-48a8-273c-08defa34418d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|6133799003|4143699003|10067099003|11063799006|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info: 0pNgrblGd61+qaKTU3F8CDUH4VkTI0PEyhpAFt+AoXICTb4Zz0S4m5NDOjXG5W7f9FSyp4dnf2G4NOvMpi1eqz9n7XFfKIQpUeVlK8Zr4uMiKN3v7ztl0kaWTkUsWxxV1YP2gMsHAaLiItqQj2wey+MZLZFr0rSevaM1nM0bBzXYpkrhFcjvjLAQRPORoExM75CqDrTo+6Z292zgGOq4UonniMf+r5jT54L8587AXSj92am/SQoP5R4JgB16hOGnxnQooZETJe0izqNQym3f2jr2OwZjtw7vv9d567qATJJmf8EXa9/CtEKnESAMCRHqqn0U8rj66djDOG7vhgGn1BiFqUhzV8aALYJhyx4EF/iV6MngJzcCb0djMB3AGOpNcRu4wpu4cvR6LpJ771dDeXq1LI7IwJuvQbNw8TJ3rGMAhDqfCxqy/mIS7NKoEe8KyHumv00cDARmftS2/3VrhJ42boJOQV0sVo5vf5x4YPFo5XvgV91k2T93NMfOB+Oi6KV8LMbudoekYR7XQZ43tmT3eX2fM0LkxoaR/6Gs8C7Z7efTmBQyNFazauSYtOQQZpWcEUu/GPD5COFsAjh8IxCuZxtVSqnYS9FguxcKzDED3E20dMPbbBoBH+sz6kYxi8+Qy7n8tfwZYdHKrJb7npdRnW96k2gQJckiYxeXwVI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5073.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(6133799003)(4143699003)(10067099003)(11063799006)(18002099003)(22082099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?k51UptsHHDPrE7CoLWLlbFQa4xxlhVEnOqsEN8yfpYslJO44K+25Lk0fC2pG?=
 =?us-ascii?Q?zuYT5yuRE6ZCTvA3jKfE1j4sRoSvYMzLLoV4fSAY/z7pcrcFVLegCGedX+kb?=
 =?us-ascii?Q?Vh5b8GVRcQyhvfEtpYqKy9glG/0iD8rtcKO/mhg2s7b9BXZQp5fu79Lf4VcA?=
 =?us-ascii?Q?HnVfefAkChqF1dEsmWz3RO0biBN9BXR/wuQrtjR5NDtlKgd4pZj69W9By5aC?=
 =?us-ascii?Q?D0Xsfmj6/586bJMkTFPH9RlU0jMlQjiAlmt4SZx86kgMyq+AfgTD3amNgmfz?=
 =?us-ascii?Q?+UFVDtkokc96Db1dyt8vV36JBeM9euNiNw2Fkd4OLfZ8NivSdqXvSgQBkUdT?=
 =?us-ascii?Q?xRnOn5keMA23gyivEgj5Ers5DxWLvMIhAkH00cMwkMz0t9zEygV2lHE9XUhn?=
 =?us-ascii?Q?OrzUT9AKr1t8bvvGrP1LUrWoPUGTUNrtZwj/9z0bKrXmUHizCeK0qJfOf9DR?=
 =?us-ascii?Q?KHLaMNROOjnqb7sf2zYHG7UAiUwR8GjCjyh9qMpD2mG5oN8MJXRVYIc+GhfW?=
 =?us-ascii?Q?kwnZnGPQowJozjdmIpMvrvcudA8p6vkRkXF+kM46+14KR8KtF2ad3fxJJN6H?=
 =?us-ascii?Q?ezHWOnhXV0UKLaQBVtHxtfxlTZua4xyAxglL3lWMq64LbSqu+FcWwh0z1Chu?=
 =?us-ascii?Q?e3AX7ScY6+dAJilBdO6TCpX+4jUOHfcDbNFAv5sxdMdOJVNg3xE4FAcxHXll?=
 =?us-ascii?Q?TtJ2tHKsOZjGOG7AU3Vd430NWNI/6fyuU/8WN3+NvG0SSnJStVdCyTgOUpay?=
 =?us-ascii?Q?MGrLZ0jnDHOdZQgdOLeWlDJZvxeRgSDvPmRIm7tns2ckwwL+U03uzWUXiQty?=
 =?us-ascii?Q?x3mrnNpdzE3Mu+DjnVpHLm7aiDu9Zz2SldzO/NNH/OpAxFlxOoNoWUTDkeA1?=
 =?us-ascii?Q?up6LppkrsC2ArCvBOGJP/2gkpYW2cVCzF/Q3n6+9hQYj0DBu0chFrKDqin6s?=
 =?us-ascii?Q?HQaDZvt3lvMM9f6j9X9hlWP5zfGlM3OlRC09Bs9+MMgk0GNxUj8ILAuQ1NFx?=
 =?us-ascii?Q?5wngvEWn4r25tZlyvnsnvxdJ6+4UwLS0TcS0x5VZUF91wXt0Q/NiBWfgec6z?=
 =?us-ascii?Q?l5/H3BdmosrKe02JICGjuJdwbGg97bRNSi9CcKX9aG28I290ZpzGv1YDy1HW?=
 =?us-ascii?Q?tb3OA6u0b48ga7muACwubpNFDrpgiv4FTzAHRFwnKSQizzBSvfhyMsMzF4g0?=
 =?us-ascii?Q?6t6zT/p+Wj+cJw2yXdkIrtTXjuuv1KjutMss98txE+CUf7mHC6VDkRcplwEc?=
 =?us-ascii?Q?qWU7IEvK1e/sQ1atRjW//yzC+AORk2rSTutqyRA7t2YMqfXJBc0ENsVSaYz3?=
 =?us-ascii?Q?ifiLmnfzBv6l+0p9Kcnqf5l8ryJfbPAk+rHQaGA2dHghS6TZ1YhAilW3CJv2?=
 =?us-ascii?Q?Tp2kwos9aKsMTQGKJkdLCniu6QCdY03QvCOsBmI5Zx1rDEUP3jSEW9NNFWWu?=
 =?us-ascii?Q?EG860aFTpyyOoJ+zdLrqh9azrmGTqoaHtTBEqRvuI2ozu//3kb/aMS+D/NmF?=
 =?us-ascii?Q?eGajousFaX2Zk4YYV11zwWuoP1PL0DWbr13zalJG1f1+wKR+Cwc46v3DDP4M?=
 =?us-ascii?Q?k1HlAJ3tuqsIlFxQCC4yq3lLZbuPPseQnRcFpQ50QbCyb1f3xUrbb1t1TeWW?=
 =?us-ascii?Q?CrRghwQkHG07RfO+gsXQFXX5SOu0k/NG/QTz0WTPO3uNDyAjI5iAayfSSl36?=
 =?us-ascii?Q?olfbk2qytmTsxPsBmJpkw6TE+zV/wbbkYsb8Roa1GxKk0AyIeRVyneta44I9?=
 =?us-ascii?Q?Kic4xzYwdw=3D=3D?=
X-Exchange-RoutingPolicyChecked: jiUxbWjGfbaiDvYANC0rcndqNq8V83lIvKF/khvZnamiNy2I04iNuVapc0SZxJpMDx3Hj662M9uyws5KKdTjEEvLeRGrY5ArV2aaOvhAh2LS0fZWE/A6Oag7H0lt0ebWPaPXz9W9jmfrwqgk9X5yyVN471KzuDxovsWY5SuToX4xvVKV9NbGQZSRt9RZooPQCZl7AXHQRP0qoJ2ho4wXGktoMnLNxn3zf2CFfkn4CyUHXQJ4CjaNy0aVltf1FnJM7vuQtia+1Gsa7ZKSM0A+aVTmp28xVaAWPGOwY6NhWoS5m7hwnLM+0qyJ9n1O/uYcPwNHqPPmucXhf6yKiKBl0A==
X-MS-Exchange-CrossTenant-Network-Message-Id: a9440c1d-bf1f-48a8-273c-08defa34418d
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5073.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 18:45:47.9761 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: klXv3E3gFDvx4zvc85Z7sJE0+flFC64nDMNSSBm9huCbTQG2fGnPF+2M815cUAEGD9AUd9FnWeb5RuFS4ENA9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4679
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

On Fri, Aug 14, 2026 at 07:17:48PM +0200, Michal Wajdeczko wrote:
> If we fail to create any of the survivability sysfs files, the user
> can't view boot status registers any more. Report them into dmesg
> instead using our existing SIGID helper.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Riana Tauro <riana.tauro@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_survivability_mode.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
> index 8b74bbc96390..e14553295171 100644
> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
> @@ -305,8 +305,10 @@ static const struct attribute_group survivability_info_group = {
>  
>  static int create_survivability_sysfs(struct pci_dev *pdev)
>  {
> -	struct device *dev = &pdev->dev;
> +	/* Survivability info is required if not enabled via configfs */
> +	bool needs_info = !xe_configfs_get_survivability_mode(pdev);
>  	struct xe_device *xe = pdev_to_xe_device(pdev);
> +	struct device *dev = &pdev->dev;
>  	int ret;
>  
>  	ret = device_create_file(dev, &dev_attr_survivability_mode);
> @@ -318,8 +320,7 @@ static int create_survivability_sysfs(struct pci_dev *pdev)
>  	if (ret)
>  		goto failed;
>  
> -	/* Survivability info is not required if enabled via configfs */
> -	if (!xe_configfs_get_survivability_mode(pdev)) {
> +	if (needs_info) {
>  		ret = devm_device_add_group(dev, &survivability_info_group);
>  		if (ret)
>  			goto failed;
> @@ -329,6 +330,9 @@ static int create_survivability_sysfs(struct pci_dev *pdev)
>  
>  failed:
>  	xe_err(xe, "Failed to create survivability sysfs files: %pe\n", ERR_PTR(ret));
> +	/* no sysfs, dump Survivability info to dmesg instead */
> +	if (needs_info)
> +		log_survivability_info(xe);

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

>  	return ret;
>  }
>  
> -- 
> 2.47.1
> 
