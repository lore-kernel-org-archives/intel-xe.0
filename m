Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF8F7C3064D
	for <intel-xe@archiver.kernel.org>; Thu, 27 Jun 2024 11:54:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AFC610E0C1;
	Thu, 27 Jun 2024 11:54:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AXe2vaYt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA2EF10E0C1
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Jun 2024 11:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719489277; x=1751025277;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=aD+yteKP29CAWx4EsjwFfpAv5j3/FKoPYi+nTjWYCbk=;
 b=AXe2vaYtkTAQK88FZx8+Ly3t+S1WI7iXQ/Z8+SNxvrY4FhMAbldMrgjC
 cwCn2b3F7+zrqBDZ4ii0a594CcY/M6Xd6bkPAzI3Cn5ftcURwZhsZQrX3
 HeJj9zvmxsoGIgPPE5EG38RkzF/a/PZHhSCnK+BFiJqlR/k9wYFbGzh8L
 t+bZLxjPzmznL4+E9YtF6OBKpmFiu9yPG1s3vmjIH9m9Z7HWAUQnA8A/D
 /UuclB/hDC+hEcbSGVliYTMBf2HFKOe85S/WS76UHajT4x8h5n71aaEbQ
 l2AZp/ZNRZsRgBgNo6KpFuuU59/g+7T8rZhG54GdF+DenFQhkHsckpK6o g==;
X-CSE-ConnectionGUID: VKdUcgSuRQ6wjxcZUZhGiQ==
X-CSE-MsgGUID: 7zYYCzxnS0GpUB9A2kw0sA==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="27748666"
X-IronPort-AV: E=Sophos;i="6.09,270,1716274800"; d="scan'208";a="27748666"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2024 04:54:37 -0700
X-CSE-ConnectionGUID: Ng+JjEGbTjWJC6sg5ITIOg==
X-CSE-MsgGUID: 0Qbor02EQmGb4DntG7s0Cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,270,1716274800"; d="scan'208";a="44415786"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Jun 2024 04:54:36 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 27 Jun 2024 04:54:35 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 27 Jun 2024 04:54:35 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 27 Jun 2024 04:54:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vf30K6ha1rV0M9kk7mZSYoagG09a2jEr80KL9jL2jcbQkHWPJWWNTFPQ72jxYdFLkAYaJ7swnGVYEHI0ekmGV3jJXLBd0MEAbZsERZAA68gdwCsb9ZczLc/daLYd7v4hBsUqoFu9/G8ixQ2RQjkDX7cL3dQFYeguzqWUqks55Tv/3xQ+Np4ccZNvjAEHUq4x6cxq8InUrbbRMCpfYWaWmfoWVsr7SiSSZqqbiwqjvxWTkh0XNK0ngyQ87nWfVs2S38gwmqTxmEmC3epnZWWPmpdlFoS1CEgXuv8O4POoHxyzC0dHCqcz2yIQV7d2CZxgNLXjSWbyTZgZ0WCh64E5uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M1CdK6YBf54EC/zMttvmPVdrUTjSN+tHOaBRN4uFtTI=;
 b=SH+A9XuI91k+S5ZTNH375/pETEU9IXChH0b3uhSQa7eZ0ulWx6UgWMhuVf3XLHt3sVRyGhHK285NJsMxNvpb9gQ/weDQS3dqVp/fNfh61gLcXG4KSDFEvpcgRT43Q++40IBmGqcq3x7aguaRGfzoNKjLqZkF5758XJ1B9XLo9l+w2DGOZ32XCaJvH9gdHKFanITbT6iUUXKUIESgCH6j5/uabKVC20TR4ApB//cPHHEEiD8zgU94VmqgrmrU5Tz5k6EbyGxPoWzQ30NACE4RKtVEjaQbgtVwFspKbsrNgMCXsSHbcaEb1x5P9/6B02offkRGnni9SXJe4ar0A6rD/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by PH0PR11MB5190.namprd11.prod.outlook.com (2603:10b6:510:3c::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.26; Thu, 27 Jun
 2024 11:54:23 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%4]) with mapi id 15.20.7698.025; Thu, 27 Jun 2024
 11:54:23 +0000
Date: Thu, 27 Jun 2024 13:54:15 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH] drm/xe/pf: Remove inlined #ifdef CONFIG_PCI_IOV
Message-ID: <Zn1S50McuqBNSfsi@fdugast-desk>
References: <20240627104305.1477-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240627104305.1477-1-michal.wajdeczko@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: MI1P293CA0025.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:3::11) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|PH0PR11MB5190:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d0406b0-03b8-45d6-c3f3-08dc969fe2ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?yS3azJPppqKHdMqeeJYck6IbNYgqTtucyo2E+BT4FGBANAJlcNBlYz2H78r6?=
 =?us-ascii?Q?50p++5fYaDgHAjCvr6Lps2ABGDVmfRyICsV5J++IKjnQEghe3O3Sq3cn9jz+?=
 =?us-ascii?Q?3wzJ1Aaklc3NDxuFFAuN7oS4HnNM9TDBDXAM3T0/75honSte653jgmBV8gty?=
 =?us-ascii?Q?N5JQJEzAeR6iyL6Kc/Sobjjpx9101jW9PBBN1KCdGsQHfLtgf/pq5Bako4oD?=
 =?us-ascii?Q?MJeOP2UQAzdrLtfgnHaQBPj0dlNQ+AWiiWCyqD3oY/SJUyFqhblhMUwWVTTn?=
 =?us-ascii?Q?uhsxE97RM1ftHhZeH61VDWYf+IRrq28lLZWPWSXxQ10naTEodkJaUDRgnguv?=
 =?us-ascii?Q?zO4SzFAbzxkZ2MCE53jbw1zt5WJ1+pdQ/bZMBChQha2KMrS30zG730Fh60x/?=
 =?us-ascii?Q?MCtMenAK9mynJjjyIf8FhmsdcCc4LY3XBZT6AlBjDQgbpgLxZPtq2hnd7Kmv?=
 =?us-ascii?Q?y1zL5dcVL2DSVEUnARWMmo72nPSF5vy69D/mjSjFJfQax+fY69hrmnavSS6m?=
 =?us-ascii?Q?rRz+YPAMmtZPPDSN7hf4turljlAdUXxf/xy9YlbbDfNvWgus5i9Owq8z2BjD?=
 =?us-ascii?Q?oz08MDynehHXXeP7LB7EF9XoBZoXcag22axC8TZAPX8gmpiW/NA16KKs1FmG?=
 =?us-ascii?Q?5Sb2+Pef674wKPlUeWNgzDSWlWX8eSrQh6z7sUEICApbWBCRUGKIo4adJ96b?=
 =?us-ascii?Q?KpM4edcTjW6964WvGmdTUPY9wVw/VYi9vBokiPLksvPrDxBVsDiZl3v6ottR?=
 =?us-ascii?Q?ZtmC31EkyY9EHaOo01bq5a+taF7hOSSKMIumKsufeSqyPvYcqU5cCCzvaIgC?=
 =?us-ascii?Q?xVgUEQHark1TqZWLTB1k26x3cQ51H4HklbmXnwDH/iDFf81Vi3FTjJyOR7E4?=
 =?us-ascii?Q?wpvHSzIsm7QqbO/HOOhMsK40SpczJLUQjIPMojpkFAdZrAHunLOiFVAIrldJ?=
 =?us-ascii?Q?LHnMv+PqU0+VcVUQB8Q6iS6LtbArT0wnI0alUDYNeYH6biEiyRtqz1XPDS8B?=
 =?us-ascii?Q?p/9C1AUKmjAK0Q+5tGEGZvEsio0FpnK6YG2qHVFkivjIk2Dt8Cj8bHLd4cwo?=
 =?us-ascii?Q?1poxJLIbhP13ZcHhqn8pFReXmktvX+PLYhjAX0PqVy6XpX4R6iB1kU9dNtYn?=
 =?us-ascii?Q?AqHmcEOKiunCOzafI2ffTWtNHrXczyRG5l0yjmU1fW+nJpGH69TZkboET8Ve?=
 =?us-ascii?Q?FhcAvtY8CnYnwQhk3KqmRRr63bguqfEEvrFGphldPH/7+vzak3DiHJ0xxvFx?=
 =?us-ascii?Q?YpUW8pupCRKWGmT+CkcJqjZeK+OCT0Z6haUXmh5UhjwKfCUUZN6n8LnZitmq?=
 =?us-ascii?Q?4yjoGExklnDJ3/HFLk9ITVhnENA6vxnXGJbtcAaedjkUaQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2sP2Nf2XsBQg/JTKHRpwnoTtI0dYyW2SpYRMaXt9l4fzFHiPn0MpI7E2D31w?=
 =?us-ascii?Q?6QnV82P+wefjXKIYzZ4nbnG9XvokX6FckN1b3db0r1xwsG7CZrzLo880N5gO?=
 =?us-ascii?Q?ZbvMDfmOJcT5kVSITtjEtWN6QozJyWdmrwOeINkLPsx5I128JL3af4hHqzRx?=
 =?us-ascii?Q?7K7bOalitnwxxtHVIRIK7Zx+0l+w2DZLSIC0mC39oP4kJ79DrsZiAyAOZiWR?=
 =?us-ascii?Q?GWa9LcMK0/oVJ9tZGbUjLvUkCGVlNiV8fRg8ApGc24m/fT/ihzlTjvipv3JN?=
 =?us-ascii?Q?p8N61jKGMbuOq1Vkd6vmjjuiNCgdDp8oq9Llucnr9nwxHHrByftaV7VjXHiX?=
 =?us-ascii?Q?GxF9WJ9yoO38zh36GbwsQmt5WOvS+Fj095f9NS9EhqZJXyASxXu59eMzmNY1?=
 =?us-ascii?Q?afDmjzyDeQKPfqkXl8X4kSzvTyE4NG3zYyYWNwrE+QoYinGLbIF5Or4NmLhr?=
 =?us-ascii?Q?mdV+TkukDVcq/gN4Uqem7rdgQgpJYh1YLJ4u90wRcnsQqwHX2S2EwtDG2GHS?=
 =?us-ascii?Q?oSz7dT0wVVVF0LG9fChPGNFlRhCrDXNLapXCttCzuJhHSTBPzpmoSsmTaqDG?=
 =?us-ascii?Q?4XHYtTBn/rRTCnng7V/SK8OuQScNINFxTZYdRzNcA+rn/kHZRi1CfOrhiXiV?=
 =?us-ascii?Q?IdPshZ2VIeGYCM7+g7NFWhsv+b5owFJmMrekb7Vy+A+ABJNzkXzf+vVPbIeT?=
 =?us-ascii?Q?F8b2hhFIYlq2SjkqRDKUvc+TAFJSVYXk/S+ARdGFWPSap21AY1BykwXXV2/S?=
 =?us-ascii?Q?b2qoc6t1VeXcbeGrjfC9cPbmInZJEq8t7TNa04Wuypv4WbTQVgqK+RzrxEBB?=
 =?us-ascii?Q?EdSYt4N7r9fBVjJq7k8x5zIoi/MhfgQE2NBkQqds3gRVmfWDGpE/d4xlob3T?=
 =?us-ascii?Q?G8IPugzddVCBeNA48yO+rPEhwOFNgU09OiA2POWk46b9KX5+YS0kon8Ax5AM?=
 =?us-ascii?Q?cs4+Shz3m23PCxDEoym5CgnIMepYSGVx/AArobG3hMQPKBzaQ+cZN03BZSg/?=
 =?us-ascii?Q?WliOjzjWs6f7SgH4tYQ4AqQcqG1ouwR5cf/Kbvem4PUwjHjBA6JdHN72zadC?=
 =?us-ascii?Q?YCS9jJ/sNbue6eZP4H3sA19bQ7FdVH3TFwCav+jqNx0oJMNzyw/CEDBc63M6?=
 =?us-ascii?Q?ozymHXm8hAWspLYTKxDp+Aklg1VM+81l28kNoRXFMdA56zozC3a2ON4Lfqh9?=
 =?us-ascii?Q?P9seHtWZXugXd9Gvq/ME9JYcqGyDt8qf1TVdyuHUFEebAxX5byrldZKRZVLs?=
 =?us-ascii?Q?VJ4XHaQBp4f79YrmYvEly/9cH0wxmyMPSKHuW7rO3Xy29sM1hRZXbKdtaHep?=
 =?us-ascii?Q?79SvQNhf1Osd4r4g5feEzdDzjpFJ6jFNa8p8nN1DvLf7odyH/DLDNXUusAHG?=
 =?us-ascii?Q?KKoH1AhcOAukTD3R7M01oL11nFUXqZGEdV0EFV4tyF9lP0ZLlcxIk134LZP4?=
 =?us-ascii?Q?PAQJTTI1kH1DQzqYNp/zpFjroZB75eA/YV5OMhgakmJFza6cTkbfDUYmpBwn?=
 =?us-ascii?Q?a0flbq2+3C/Ond0KesKpC73OxEyqiwaK/JMje4ErcsKJv5pjwIPRe/C3nTJh?=
 =?us-ascii?Q?z1K5k4ptihUENKsWLqQnibVPlb2erWklzv1mIe7cWC4dqFcc0WX5clBdXZw1?=
 =?us-ascii?Q?Uw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d0406b0-03b8-45d6-c3f3-08dc969fe2ef
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 11:54:23.1981 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 20pK+GCz1ij7lhzmEOIya+f/2Fc8l2a4QN7GXWGEkoeangaDfQZKAgnvuwSVxdwV7bxGzLZV43izK4NAbTA7raQOQfO9gqiNEn1UO1PHGlQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5190
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

On Thu, Jun 27, 2024 at 12:43:05PM +0200, Michal Wajdeczko wrote:
> We can remove #ifdef CONFIG_PCI_IOV in .c files if we provide
> dummy replacement of the xe_pci_sriov_configure() function.
> 
> Suggested-by: Jani Nikula <jani.nikula@linux.intel.com>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_pci.c       | 4 ----
>  drivers/gpu/drm/xe/xe_pci_sriov.h | 7 +++++++
>  2 files changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 4b91a9878f41..53b67f39c7d5 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -749,10 +749,8 @@ static void xe_pci_remove(struct pci_dev *pdev)
>  	if (!xe) /* driver load aborted, nothing to cleanup */
>  		return;
>  
> -#ifdef CONFIG_PCI_IOV
>  	if (IS_SRIOV_PF(xe))
>  		xe_pci_sriov_configure(pdev, 0);
> -#endif
>  
>  	xe_device_remove(xe);
>  	xe_pm_runtime_fini(xe);
> @@ -1010,9 +1008,7 @@ static struct pci_driver xe_pci_driver = {
>  	.probe = xe_pci_probe,
>  	.remove = xe_pci_remove,
>  	.shutdown = xe_pci_shutdown,
> -#ifdef CONFIG_PCI_IOV
>  	.sriov_configure = xe_pci_sriov_configure,
> -#endif
>  #ifdef CONFIG_PM_SLEEP
>  	.driver.pm = &xe_pm_ops,
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.h b/drivers/gpu/drm/xe/xe_pci_sriov.h
> index 3b8bfbf7e1d9..c76dd0d90495 100644
> --- a/drivers/gpu/drm/xe/xe_pci_sriov.h
> +++ b/drivers/gpu/drm/xe/xe_pci_sriov.h
> @@ -8,6 +8,13 @@
>  
>  struct pci_dev;
>  
> +#ifdef CONFIG_PCI_IOV
>  int xe_pci_sriov_configure(struct pci_dev *pdev, int num_vfs);
> +#else
> +static inline int xe_pci_sriov_configure(struct pci_dev *pdev, int num_vfs)
> +{
> +	return 0;
> +}
> +#endif
>  
>  #endif
> -- 
> 2.43.0
> 
