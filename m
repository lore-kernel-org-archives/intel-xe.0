Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8E6FC25B75
	for <intel-xe@archiver.kernel.org>; Tue, 14 May 2024 20:24:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E86810E441;
	Tue, 14 May 2024 20:24:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eJ4Kr4gm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 962E310E441
 for <intel-xe@lists.freedesktop.org>; Tue, 14 May 2024 20:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715718243; x=1747254243;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ZcosG4lnIDj1oCYtCZ4z+wxWTjaZxah47tfFu5RuF8g=;
 b=eJ4Kr4gmUKvpeCfvavl6//L8e8aKIwDEop/gjLXw96awgZEjXjVbBw42
 PYSf5Im+RYsBYvGAdHaPhdTEIRAaDgZgh2UC9K2EOzwZoJaqoP4DJdqGx
 66kX92dj1JEnCQOkQNf0u3FX8kD/Kdiy8HS4Hc+ibamT812eodlwOQkPw
 S0LLBvn/t1eQt1cHAIfWaJPc3n6BbH2upynI7xrVmg2bghIAi+iBkzySj
 fb6ZzqDSCw+rH+Zx7It9RF9gEH9OcQKlYcLAeKsL8nmXKXDh+fs4GQm/V
 jiMfm+wQk61hi0/wy6zuCkYmpBMR55TP0tVp0QmjvFYmjdQrtezkfbrqH g==;
X-CSE-ConnectionGUID: xE69TPwYTNCFdQHRJLClNg==
X-CSE-MsgGUID: E6wrjE5TRbi2/EW5KLGh+A==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="29217184"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="29217184"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 13:24:03 -0700
X-CSE-ConnectionGUID: aRokJkVLSRml09WZR4/gGg==
X-CSE-MsgGUID: WR7ddyFvQDq1PTxDEO75Sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="31368412"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 May 2024 13:24:02 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 14 May 2024 13:24:01 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 14 May 2024 13:24:01 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 14 May 2024 13:24:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kzxLcbUaWjrjFqoCetRTwvZSW9TG9rcraX+Mr1hKaJiGO6Dj1N0WY84+Gara8zz9+YqohAMuJpwrXzyaGqWZWMayCNQ1s9Qc9EmNJVjWATRsbDgidGc+05tLYSCxGVZsnv+preMB22cJ6ueim4dub9OnQkNBszeJSWnnHJDjcqpglK9Q48v5QUc9eu4jE29rvgtltnPBWvllpVQ8ISjyavGK1YIKoM4K/equALjVK3jgg7m5Q1p8v2fmRDoZ0LFfA4X8KiEeFOatkoa6v+thKJy5IY72U41dqHVD20lGa0SwNA0skm6Qs3PlP1EPXtRZAIfAh8+h91uTonDuWbXGyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8gt2o/C7FBQ8Znwzs2FNK1fGlZAwYLlZrVElF6sgsCo=;
 b=gt/nLkS67QWnbJ175tBzErnhOADhSdt/UaYAo1CJFIMAl7MS05TttKEAJQAkt17XnaPBZYVRKLGuZlCwVlpMxC32yUhv1lG3Bi66CFLEqDpitbC7V4NpCuZqbD9c4z5ST9ZoIgvslHvNqouULvwTWDguMggckb3PjoyT09NpcUI7PioOP4MaQAiSAz2axjr1/A9ld9PRE9IhJ4N8UKMKRjkpwt0wkOl578MrAnM6Jxy+nOGCmJB22mYEXwsgUfNjvsgsR7L4n2pbmFMXcUBtppldW+/LvjHkQbZ6CgPLk5yaz+ACnGaRUBqpM9ED3ldWm1ON6v4dzVLhUXFw9i/5Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH0PR11MB5252.namprd11.prod.outlook.com (2603:10b6:610:e3::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.26; Tue, 14 May
 2024 20:23:57 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.7544.052; Tue, 14 May 2024
 20:23:57 +0000
Date: Tue, 14 May 2024 20:23:14 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/xe/uc: Reorder post hwconfig uC initialization
 step
Message-ID: <ZkPIMl6SsjC+WcGM@DUT025-TGLU.fm.intel.com>
References: <20240510203810.1952-1-michal.wajdeczko@intel.com>
 <20240510203810.1952-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240510203810.1952-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BY3PR05CA0048.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::23) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH0PR11MB5252:EE_
X-MS-Office365-Filtering-Correlation-Id: 4dc4f1bc-2855-40a8-7e8e-08dc7453c86d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CSnlZMF9s0ql6fXRvzzG0KES8k2ceC+gyDvIaoaFCJsyH2kfht4+hdAffpvi?=
 =?us-ascii?Q?VTj6d/Mxd55xONOVMVo5umAYhpIg8fY+Bp8zkZb10CMpn+KKsSgxXpVbn1g+?=
 =?us-ascii?Q?VaVzcB0P0jt6rSI59Agm19rv66pnHrss0LrXt/cdk5R2HVkcbhlL0Ni36Q5Z?=
 =?us-ascii?Q?Y6JIAdhRTFToap9mjf5tWRSo5o75Re0kTnIwQQ3CyXNc/WdDx8K45eEP6YzX?=
 =?us-ascii?Q?d8Uk1+XaJjVUNGTI4W/D7qwUifuk712QdMMMRQFxAW58QWcN8YiK4Lp8RSok?=
 =?us-ascii?Q?fWEFtuAGp5cgsLO1D/3v8H9Jv+PnJZMoeJz+7/vHzI8mWoZXa/gqsZ2iCCDa?=
 =?us-ascii?Q?gcHy9TrG5bnMxusyNnbGqwGDpmuYAZL8+ZP+VDZEgn8oC+2CRwg95sztYhxT?=
 =?us-ascii?Q?4Xz56Uo3G7r5rAhzfZw8Iehv9aFZTY3OsvOXIqTKskYTPEROg5kvy+WqEonC?=
 =?us-ascii?Q?VITbp/U6XizystEIL0J4MSb52pxSYg2e58r1ZbjApJ8WB+o017j4zcNBhgD9?=
 =?us-ascii?Q?AoSH/qYWNv5jOzNtpuRe1G9oIZY/LIONjdrOC0ZvILGh5+NUnqA49oF3UABW?=
 =?us-ascii?Q?7eaglXcNRiYYUgKdU3t5zUtEdffusNgBg7AzI8CVVAHhcJaVWX3rZVNVIeRe?=
 =?us-ascii?Q?YL+wd17a+sN/eVndj7W2rA2Gg8wcJHBQ1Qz1aFo+s3lgywZW7J5RhQTIhCg0?=
 =?us-ascii?Q?Oph0EbLTTaNsTF1pgkc+LX0HqgJpMkMi+YVK2Fuf1czGf7vpgRyEkQYDgO37?=
 =?us-ascii?Q?ueVtX5ElChwA7K9UtC3jUt0gLEm2C40UPD+itbP4lYhfP7UXDykicZxxKxuk?=
 =?us-ascii?Q?mxjzBbrLV/AksWbsedVcnto4Wx/zNaocuRFCWwsaY5LfxdeUCuedoYo1bgsH?=
 =?us-ascii?Q?G3VZPQBwpk/c8gM998ZYy/NS0QJrH8p6BmN7UOSUTiMqEjeNQuxrzHE+MNfN?=
 =?us-ascii?Q?qPVVogxVOzV7FJLIMdGQxpEGSdf0sqd4Y2XS6Gre1QmbT2dkLHwhIUn00yOx?=
 =?us-ascii?Q?LZgZwmd95hoQASpXvEGQQo7NmC/pJ9L6FlKCxl/C307O+ZBD3e9jg2dxazaA?=
 =?us-ascii?Q?I49kyp/KqWZCUXbL+qcqfa6wBDKwj+nGIFuEEQYAq96qtL7hycSYYuxdZd4n?=
 =?us-ascii?Q?BYtmEbsofipfVAVI082q09GEvn+Rax8FXdBhdekIFF7mnrcAXAew4C9IlMWQ?=
 =?us-ascii?Q?gX19kJwckYPodaiYzbXKSiZRMJHZ/Nil7Yn/NlAPjIWIevFA52Byc9TOrYbF?=
 =?us-ascii?Q?H8DMJvdEBvryLEU9otXmEEDBDf4q76hi5FCdqvU0Ig=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?27+Gok7Q/F+MCmQ0J1lXMHIeB77CJleXfIRgED52/N7lSphWYIccBZaj7QlQ?=
 =?us-ascii?Q?rkQkRbdq1+K5hnaRVFjnYNRsHNoVB7roIA9xrkGdmd42Qu7JEfXe8h9p2Xrz?=
 =?us-ascii?Q?d+TuZ7F0HCThXuie4zgSuIA5PtDaytfvsligkVuUJPC8lKtFmXQar6qmgvYM?=
 =?us-ascii?Q?AFmBiGo7TErDDQs/bjrTZNRAUcUP3s7Phph/Zpe/JdSdJ4aEXhitSKvgejBC?=
 =?us-ascii?Q?sVh8BJYNJUJuts3ORNhUeWXuDI81Z7/Pd+/8ObrJX5mx37uOm28TASzrmiPQ?=
 =?us-ascii?Q?9yvYs3bEC0wYLRDFZthj3whhOBwdhfDsLVG/8LFyjEPrsW0C62Ja8yxNJjUl?=
 =?us-ascii?Q?tSgeXvQX+ITlBSm+KDXkW6Cl/bG9e6ZyT94W1ILQNw3K8c/RWbCpWe6VM91r?=
 =?us-ascii?Q?opsvelA5X6p2/ww+MHfdfFCpyZSY5IXOuPQLUKeSfw0bFsrkRmDTX0gZEOCd?=
 =?us-ascii?Q?keM9WrvSPfl4Ay8NvvlnZMxd701ueIgTLZynlceCqYyNl6gduZ2vqB7FQ23o?=
 =?us-ascii?Q?tvDro8b8IApjWFBfl6zDvYc/lpw2CFPhWf5W4HUhea4OKmn68VelsfgAse+E?=
 =?us-ascii?Q?waAEoxNZYJbHqjPAnvU3nD/MyyU/Cqc9aZ8h67YWHFMWEv2l0v0QyjG2b7GH?=
 =?us-ascii?Q?pWnvlTSoTZStg+rryxAbz6iSrp7N2VElJ8Or7dybee1TfocjQzCRLEbU1Oaw?=
 =?us-ascii?Q?F70oqHnO5fNfAKsVjLMrDbKLjBoRAf3d0x+LVM9vQQd0ZXXFqD/Bo0JO6T2q?=
 =?us-ascii?Q?8p+I/uo6seYBL/dDklrcI+rMEeKAa7DUjmXJRNpPtZfjqOfJgJO1VQyZzRZ4?=
 =?us-ascii?Q?MYCAoILUkM1UJw45yMs5uvvC/ps8bmZPMPwoNp0cGXUfizsWh1/D7f9LaTNH?=
 =?us-ascii?Q?UjPfceLpnO8VeQemZUHb8XdLJzuMQ8NHfj9LpW7h54iR/bButl9pPr1QRrP8?=
 =?us-ascii?Q?YbB1aQXkPwIYhhn7tAMFAlI1BmqXA2l0h/FQhjU/v/vv99lAyN0TO2YDEtcx?=
 =?us-ascii?Q?ImCAvURiymZHp9+PA8paelRfo6BCXNjv623dKT4peWYXc7AHoTlpMXsHKEW3?=
 =?us-ascii?Q?FONxfF13oP6N9nJ+L0FHmJQUgaIE5vFnXmZPN0twCfY8XhBqyHgzg296mvsH?=
 =?us-ascii?Q?xHaTrKzhjMycY9RSAOks+Sat5JQAG38oXrfRhFN99LJ7TAo2oUaYk4XzHKL7?=
 =?us-ascii?Q?nw/dFR7K/wcAoL1Flcd1xM1+ytDpvPWh4KMIPPPKfY15mI5mvFyrB3RoIVOx?=
 =?us-ascii?Q?oNPjosgPB2Y/AM0ukOSQ8dvU/KN2/ximBjrB2t60EimlarYKSaxN6lRUfG4Z?=
 =?us-ascii?Q?VunKCIc9k2hPb7YKkWSlSohx+6zjFWh08ooe1iWRfOIo/eU/fExYIQs9Q24X?=
 =?us-ascii?Q?9wniP2JafZYoofZEVIXfaPGScvS76XM/YApN4CSTQIoI4QVnvItDuoXTgf75?=
 =?us-ascii?Q?6tVNl1YillyWW9t54M9bV7N5U2u5IKG4bPJHc0ha3HNAFzIutWmSCaV+cXBw?=
 =?us-ascii?Q?CKz9ftQTVhlxpWl50lHz/SUPbQe2YP9cIFertPwJAGA1ICY57bJaaNgIklMH?=
 =?us-ascii?Q?W2Ql7b6KzTdZZOaTfU2SaFdWoPCMy0kxehMekOeP/tMEPhwZTnQFWvBW/Qup?=
 =?us-ascii?Q?+w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dc4f1bc-2855-40a8-7e8e-08dc7453c86d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2024 20:23:57.4660 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U8dqtW30W2onkHbIVnZvwP7OAXJFH47ZPEaSSVoain7eO8mdR2IE+B87YBS7iLk0TzlaZe9DBHpmwHkYmTR6bQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5252
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

On Fri, May 10, 2024 at 10:38:09PM +0200, Michal Wajdeczko wrote:
> We want to move the GuC submission initialization to the post
> hwconfig step, but now this step is done too late as migration
> initialization uses exec_queue that would crash due to a unset
> exec_queue_ops. We can easily fix that by small function reorder.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gt.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 36c7b1631fa6..644bccc9bf4e 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -434,6 +434,10 @@ static int all_fw_domain_init(struct xe_gt *gt)
>  	if (err)
>  		goto err_force_wake;
>  
> +	err = xe_uc_init_post_hwconfig(&gt->uc);
> +	if (err)
> +		goto err_force_wake;
> +
>  	if (!xe_gt_is_media_type(gt)) {
>  		/*
>  		 * USM has its only SA pool to non-block behind user operations
> @@ -460,10 +464,6 @@ static int all_fw_domain_init(struct xe_gt *gt)
>  		}
>  	}
>  
> -	err = xe_uc_init_post_hwconfig(&gt->uc);
> -	if (err)
> -		goto err_force_wake;
> -
>  	err = xe_uc_init_hw(&gt->uc);
>  	if (err)
>  		goto err_force_wake;
> -- 
> 2.43.0
> 
