Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 982F0C624D3
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 18:09:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EC8710E12D;
	Fri,  4 Sep 2026 18:09:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S1BuK5f+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48BEA10E12D
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Sep 2026 18:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788545367; x=1820081367;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=JqkEPMowt3C3a35XRXjtB6ctH3/fEvGCMGCsd8QxX04=;
 b=S1BuK5f+5bCZY6C956Yctc8Kcc/f8N4iGcGsuXqoGK9/Asq7aN2y5tky
 0azoFoOG4ehe0dgLhvWemwE+RNolBPobPqp8H1ztXfCeSwlS/lua/J0rq
 j97P3Zy5scZGHPRGdOFd1wwm+ZRKexbHo0PGiEznLDIRTREMkPb9bTvu+
 kUho3FZngdsSjYPZ2JDEh3cNnuQMSOdcCBu12XGrr+vCrXh1+cupOXY65
 fScwQvLVqwTPevG+wiZ8YiAf8NRvvAHURrcO13oL+M0kQDLVZCgIxNV5P
 DGRaQ+V1PLBSv39KhH2QFcDaMcv3GbJzFcEKRSp4s/jo8o8kpW1ExrYG0 w==;
X-CSE-ConnectionGUID: XiOi3vGQS9m3WJbg8db0zA==
X-CSE-MsgGUID: zSwYmrmmS4K7fsijY506Rg==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="99649132"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; d="scan'208";a="99649132"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 11:09:27 -0700
X-CSE-ConnectionGUID: Xj9Zzf1QQKuRMKe7cxEvdA==
X-CSE-MsgGUID: DJSjDqTAQS+bFNMtESrreQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; d="scan'208";a="308310413"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 11:09:27 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 4 Sep 2026 11:09:26 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 4 Sep 2026 11:09:26 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.40) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 4 Sep 2026 11:09:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ClGzr4yIVEKd7cxDsFOcf7K+H6YKYqxMAIYN4NZZY3GhMP8NkbwA6h3OJ2qSfK0j/5c1VYHk/daPIOD/W8qwikbJN5qlxNwS3W8nq+qLh2C3BplJzq+7vpfZ/ucuh/cO1tTPOxhE6OI0tnHFyoKVW9DRWIXDGakkyi6m8Le3R25i8qZ7yzjU0Jt10HHBmN12V+EZCWwHlsLT50LRBivkfw5jnLhjgvOPpaVyURYhvgq6BZgDx+jnC3nqDHRKrTKJqxpyOdTfJBZJYSkpOP3TjmmUPfBEtre6edtxoAZPxde9TMENmu4yEJhuqo/VwQeRHP0Bwp4FGABvXVNy7U2a9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zO14lOQA397BB8IF9F6b16Am0xCpgrd9yCsH4cqaEB4=;
 b=sKx5IdpWp8r33VIiDKlTGtH0ma+6MqI1dDjA6kxnkuBUyg67GtICxQab/NIFveSPr4ZAVsHQAasHR51ipcxuLQFiDwhIg1tDzhqOJ7JyVWyVoJ1GApkga/A1NW8eSqeGaWtr/2XjgwvUrQBd5slBL2VFYAoityP4dpWSaFaPdrLY/1VcP32xRgzU1d0hgTnDy5+kN1f0b0ZyEI+6GSN+sC2jJM5uBhjsU8L3PyRpzuLRTYea08V4aftdl/M/y9cEqiWQ7jgv7kPdgb4AdAS9PQM4BHHJETzpJ0WLsZR1uTOh09ex8yE5hqie4B0bvs9kRCrpkcx15XW6cCOgkruncA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by DS7PR11MB8827.namprd11.prod.outlook.com (2603:10b6:8:254::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 18:09:18 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 18:09:18 +0000
Date: Fri, 4 Sep 2026 14:09:14 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Gustavo Sousa <gustavo.sousa@intel.com>
Subject: Re: [PATCH 1/6] drm/xe: Drop unused parameter from xe_info_init
Message-ID: <apsJSrdmaY9l7r1z@intel.com>
References: <20260904170531.516-1-michal.wajdeczko@intel.com>
 <20260904170531.516-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260904170531.516-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BY1P220CA0050.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59e::12) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|DS7PR11MB8827:EE_
X-MS-Office365-Filtering-Correlation-Id: d65aa368-5330-41be-18b9-08df0aafa2ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|366016|376014|10067099003|56012099006|11063799006|22082099003|18002099003|4143699003;
X-Microsoft-Antispam-Message-Info: mkCfC3Zzd4NJ3GnxI4rsl6CcaDhShS01JloGSJjDBx7/Yp7EhlkQEoJ0WeYrAuxPDzYF/nXgEyOZy03PcEWGbPRHuKgLDXDjtijtbKBjVIGxkOLyYeOE75xVLvuK2/pZdM+o+o1BkWgB1J9CYXIt9jC4Qy58ONCNIf1qeSdif4EQ1EHNOZFEdDXoyHXIp0k4YjCT7FPwHI/uEVzncvo91onDyr6GREgTMYAqm5EA+nXifV1Z0Q4KUacKjT0Jct1mwcXRr3kWXeqVUucxUpeZGDSAnbu882esY1OXBCD7wi+xO0TAEe9A6GW4m6EQlmLRvRBA8/8eVzuHEfjxCz4pbRxMtswensmNON6LQ7xJtddD2YVPXODejZDqxxzaUBgjNihBK/Hv3Vz2y91HWdm5H8YIvK31Tb4jIUoNhETVNyCmimEtrVf6gd3Eb/mJEVvmgD7I+sLabPMSyBLP3nkWskVXpNT8gdtzLN94STDfb3YqpGJ5u3Qay5uXy/QgfYGH5Tm9d83SfiuetPzq1pg9uI/PYz9WCIni7xZ89iLOP5Bps/3U9ko9CoulU2Lq7F8MsY+JTglxAUFJHXY3eMhxYbjHL0cewBFaPz7fU426Y0duc5t9lTDE7w2Mu8UVqCRwSl/BC0rGb0QjzktdJZzoqpt2juiSBcEWWVXgLUkmfRc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7187.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?r/x/jqFuPcrAuqXXvtP9tN2GkhCeXUMGKo04svGnzwZt6AOyxaFH0wyhFLtF?=
 =?us-ascii?Q?V9dKfMd8rTVw19yry4GdcKftl2eyIufsiewQL/8WtNnlmHzk6Q0y/IjhfDjl?=
 =?us-ascii?Q?RnDd5USXZX5SVjV2VZfESjVKZxOHCn5Zl98i+M6LhgbYTALMNP70nAltTXgS?=
 =?us-ascii?Q?s4Xm1UtplhEhnaszt68qhrHyKQRc5kGpUvO6q37NbEt1kGHjJrc2ghJvYsi9?=
 =?us-ascii?Q?YleSszTzAt6AphnKPYGkJ/lL/ZsI8UaI/IoDYYlbRfnaDQ28+SNqEecEXPbk?=
 =?us-ascii?Q?XMW6ltQdRw6veQib10i0gmWh9F0e2J2kYiFrjUD9nNPEg4Qh83hKpBVqFYyj?=
 =?us-ascii?Q?hY2lZNgOZriQsynbjDHOZHkVwyPoWD3Xr+MpsGBVE2cz7gc6ALvxnHpIXoVp?=
 =?us-ascii?Q?YOKeK+JOa7br76p4x3V4prTFHfIQahwDgo+QpoCeEe61vIPHgYPfXsDrL6bt?=
 =?us-ascii?Q?bgJXu0bJJNVKQDAGHAUu1JJyO4BbE9Pqw3OzhXQYnwjgVGomGx9PxWqCQFnF?=
 =?us-ascii?Q?lWuB5tC00oBzCiHBJwfKJ18d6AzEI9dO1hH9HUyMoPioQJaqP0PY8f6k84xS?=
 =?us-ascii?Q?720esFtvx4t51s+u1GEwJRusp0l9h5ss47vTlIQ/pqgoegyc9nBs/ug2y3/d?=
 =?us-ascii?Q?FBy7877UfVMH0yaXBpiN8mWxHltpzOilWy1HKyIk9X2RyjrcTaZ+cjcVrCBS?=
 =?us-ascii?Q?UrcxJzk2k7zcLnPbA8VkAhrra+U/J9I7UqUaAzx6Vv9Rep/87DBtQgtRaudW?=
 =?us-ascii?Q?vUpdkQcGRH5Q6CkYG2IKwLpvLuuxSN4L95zaQz53jiuQ0yr6iYmjYXQtmYGn?=
 =?us-ascii?Q?UFuAeMx/o+JKh9YduI+FIKlMM95o99KdpVJQdUnuDCJY+aUosH4gsd1zP0eA?=
 =?us-ascii?Q?0ju/FsLw6AIqy4ZsOfT/Hwd5pLlNmZB0O/tnKnM9s/ksGUq/8eM7mlwYe6qF?=
 =?us-ascii?Q?tCdj0CP/jeB8QRxaXUU/gbcr3iZUN5Ynh9LSoCe0sAue4vzampNlI8hIAhTS?=
 =?us-ascii?Q?RCcKc1aWD584LBal4wKXP18V0Gr8MlSeiQWne9ABlIdrtEHl63gswUUc5DYQ?=
 =?us-ascii?Q?ubOmH5THgLP5uNpuHj4+du2N5Rt6PcD+p7tFeS+pDLDfGIvIDMGKbIuaHZYS?=
 =?us-ascii?Q?22p+rVFihp728qyMwq2qjTQ0xVwfkzXUJM2Gx0JWJrStVnxfL9RBSleY65y9?=
 =?us-ascii?Q?zZiqArUppn3cm8LknbDBi/c7gR6vrRMUC4ryVMH+1iGfPxw7GZ4UNLM66jgF?=
 =?us-ascii?Q?ZqfExag8EqfDAhCLx5OyoCigHM72WJ8a5B2id72oQ5yOYmItj6JghxmcKZo7?=
 =?us-ascii?Q?naGxlAU/vJ3lZlN0+BdzYlrUHV8cUXqGDM3bg1dsD8z1hcdI+lFG3OtuC18s?=
 =?us-ascii?Q?uEriB+KcCi4M7jRXgrM94HirkTpL/G6n8HoBi/u2NfFG1Rwe4JTF+6ljd+2O?=
 =?us-ascii?Q?veUvMuuP3u6CIElYjW1/bE/K3r/SHsfTRIALI6Z/nZQgVdrNzA7VqiPAL78t?=
 =?us-ascii?Q?yZW5jOdqmRutz1kAoi4DQ8YDaPSseQakF0OdtOqB479nFlFDc5ZQAxgZPyOJ?=
 =?us-ascii?Q?K5PQeefnYucBPGwW40zZJ6lFqWH992jZgN4K4uaW2oWUDDc+DtzWMdG4bHQ1?=
 =?us-ascii?Q?plhl3BUdzCvFBdRJb6+boj+DooN8uc7AEFrPTFuWT3ag4hoDDoEv7ZS5++ul?=
 =?us-ascii?Q?xW/mh+E86wVuTwkviE+ioE4RJFPS6EzMWjq534UxCLEDCy7Zy5L5Jtm1Owms?=
 =?us-ascii?Q?jm8MZlj2Ww=3D=3D?=
X-Exchange-RoutingPolicyChecked: TmuYL7g0OA5zD/B1Jea/vP4f7eRjXr4c0/eSTU+zCv/GB9PEPE0HV22Q8rMwpkK0jTIUsLYjRPnQbqZMauLnuThyOvMlB1VjZRqpSbLHsykJDbcpdSQZKnh2SWuU6SjnpcB/L9Fva03bkIP3qhoqyZ6RQdV43CKY3QLFRLiyHjSQIGTfic+aQGeH9o3+6dgGPHGSnsEvCWwQ6blYfprn4DaJLpMhL6xaFSQh/ArojNoArN1F8aHZr2SNK+lRVb9ZVOBjkKkEPRzMMa3szeeq/qEuJ5IObWWwozchiLy3j4wVWzjU3vjxtT/kFKt3alkJGMPQLULrnqC3t6CEvcoUtw==
X-MS-Exchange-CrossTenant-Network-Message-Id: d65aa368-5330-41be-18b9-08df0aafa2ec
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 18:09:18.0970 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p4TxSLs+J11NKdR+TqRVksHlaTgj5zEAeT7L3OYmZVNNlOdWtr+t9KzR98Nf/TvN7SyzMaWzTcjI+OnyhGaWMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB8827
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

On Fri, Sep 04, 2026 at 07:05:25PM +0200, Michal Wajdeczko wrote:
> We don't need anything from struct xe_device_desc in xe_info_init()
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---

I know that this patch doesn't qualify for -fixes material,
but just for the record it was a left over of the commit 13bebc7171e6
("drm/xe: Add graphics/media IPs and their step info to xe_probed_info")

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> Cc: Gustavo Sousa <gustavo.sousa@intel.com>
> ---
>  drivers/gpu/drm/xe/tests/xe_pci.c | 2 +-
>  drivers/gpu/drm/xe/xe_pci.c       | 3 +--
>  2 files changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
> index bb0393475524..4965a01f6ba5 100644
> --- a/drivers/gpu/drm/xe/tests/xe_pci.c
> +++ b/drivers/gpu/drm/xe/tests/xe_pci.c
> @@ -382,7 +382,7 @@ int xe_pci_fake_device_init(struct xe_device *xe)
>  		return err;
>  
>  	xe_info_init_early(xe, desc, subplatform_desc, &probed_info);
> -	xe_info_init(xe, desc, &probed_info);
> +	xe_info_init(xe, &probed_info);
>  
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index ab4da1d9a9f1..47fad696545c 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -1011,7 +1011,6 @@ static int xe_probe_info(struct xe_device *xe,
>   * present in device info.
>   */
>  static int xe_info_init(struct xe_device *xe,
> -			const struct xe_device_desc *desc,
>  			struct xe_probed_info *probed_info)
>  {
>  	const struct xe_ip *graphics_ip;
> @@ -1244,7 +1243,7 @@ static int __xe_pci_probe(struct pci_dev *pdev, const struct xe_device_desc *des
>  	if (err)
>  		return err;
>  
> -	err = xe_info_init(xe, desc, &probed_info);
> +	err = xe_info_init(xe, &probed_info);
>  	if (err)
>  		return err;
>  
> -- 
> 2.47.1
> 
