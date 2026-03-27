Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9DF510F2870
	for <intel-xe@archiver.kernel.org>; Fri, 27 Mar 2026 21:01:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78E2D10EF7F;
	Fri, 27 Mar 2026 21:01:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZBSExTXv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B68010EF7F
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Mar 2026 21:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774645264; x=1806181264;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=6pBY5hsfmpzH4eHZ++qqFV6tjlTwAKa13lEVlluFGWE=;
 b=ZBSExTXv2caSB3FJ6CR8VU/78aD1cHmWdUdeiM8w9iKJYF4NtZ0I7dNp
 WrUGD7js2V+8ZZWIuzNI/QYSEG6Ya1hywaHixddg9QrvZCOQIYQQYxj/v
 d8qS9IL2nhYwD9k0Fc1tgxDjWKdI8lTxGKYVgRtROtBvvpC2rSLs+26xF
 gNGQZ6nUH+4FRSozFnYRlogFwy2Nbx9mfwcVFNjlRMoDaV+pcQqDWVzaB
 7BJeGrJlSF1ORKaShlcBl0COK8dBUwM6vaN2Cvu4Bh1f5QLVfX4e5x4K5
 MUr1iwszeaD7NLfZoij9dPXQsenp/QnKf9a/sk3gyXeJH/0ZoNnd+eo7t A==;
X-CSE-ConnectionGUID: 95oJgoHZTM6Bf5x7aNqBoA==
X-CSE-MsgGUID: eE5MMZUtQ5O27snm2c4gZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="86802651"
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; d="scan'208";a="86802651"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2026 14:01:00 -0700
X-CSE-ConnectionGUID: ACi6IO+NRI+NYThHHv4WsA==
X-CSE-MsgGUID: llO68cNbTBO0MjB7k3P9fQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; d="scan'208";a="225439443"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2026 14:00:59 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Mar 2026 14:00:59 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 27 Mar 2026 14:00:59 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.40) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Mar 2026 14:00:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fqkvLHYY+C/KeW7ujlAqiywaRVDC7JWZhlTzQZUiAv8T4Lt4uczQjjxZjPpxKPjRBbQliSIzBUW2kxOrTodqooVskv6lHSSTpaaO+RYoUZSYZCdiifTX7bMYmTuDvWFay/JLUgJea2qdwncZWmpebwk2CTD18gTM/2w+JlO/ghfe1rDZ3ul/tXZ08iYhf+myL0rPKx+7GnIYghKaVQtDxX6UjeHXo5BhqtXtARV6/WWsWKMkz2blGZqkXvOlv8HzOyNwwtR+M9BLWf1RgfVpegVn3JX/CRyF/ojWeDMXF0RXyblVRlRw5IWzvmbjexegRKAl1EFH11BjuTk3ywRIVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ARmzu46DWUW/esha1CJkycXk7EqlJp3sN3uKlremHQA=;
 b=edRf0EDkSFNt7Hh15GnaKLquZVTxVJHe5NJSmXC+3uhjwkCl583janSbU7Gi+6lsGlwO1QNKU8b+KKyxZ47dd/4GE0K71cdveqkSSOi3huGhgWciQ+dj/kAHO3JfoUJXK5ZpZ+SX9ds7e0TfohF6nEW/Oj00TaUFlYDJzuS+E6JFhY/fal3AJOUTxz82gM2Ld2QjQAKfFNWNHJs4CK4kvfuuS7ctA5WeMLs2KB+0lkMOCAl3kMZTlj+zIJvDcNRN0Fi0gkLyvL+6+TS7eStHpiLnVNIP9IMu84KlRwoe2FOvLAs0wC/5Emv6Hk3KyEt/YPghOVLwKN2q2AKZibcr4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by LV0PR11MB9789.namprd11.prod.outlook.com (2603:10b6:408:385::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.10; Fri, 27 Mar
 2026 21:00:57 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%7]) with mapi id 15.20.9769.006; Fri, 27 Mar 2026
 21:00:57 +0000
Date: Fri, 27 Mar 2026 14:00:52 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <riana.tauro@intel.com>,
 <michal.wajdeczko@intel.com>, <matthew.d.roper@intel.com>,
 <michal.winiarski@intel.com>, <matthew.auld@intel.com>,
 <maarten@lankhorst.se>, <jani.nikula@intel.com>, <lukasz.laguna@intel.com>,
 <zhanjun.dong@intel.com>
Subject: Re: [PATCH v4 9/9] drm/xe/pci: Introduce PCIe FLR
Message-ID: <acbwBKZF9RYxNf9C@gsse-cloud1.jf.intel.com>
References: <20260327203620.809353-1-raag.jadav@intel.com>
 <20260327203620.809353-10-raag.jadav@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260327203620.809353-10-raag.jadav@intel.com>
X-ClientProxiedBy: MW4PR03CA0242.namprd03.prod.outlook.com
 (2603:10b6:303:b4::7) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|LV0PR11MB9789:EE_
X-MS-Office365-Filtering-Correlation-Id: dbdcfa44-5452-4dd4-f06b-08de8c43f102
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: PsdZ9NHaSzPIUz3OiVmaYGu5OY27N3EQ65NFGKJHfJ34Wbl/p6/Zb9uWUaT+jI3o+QcWFfJw8MgRHqmNOyHrJAnm1QRaL/0SMSxBqFGKM3WDGI7XZv7EbelBj4dWZqkbla7BGlx8I437+gIphh6CoJE/ujnci2VJRr4Z18hwbARb0b9jLippFRMNvbxe0eBPgSmymT0+yPrZLep5IfJ0EjMdSIGRiPlZx5kvOPV37ueGn0YmxMdpQW+dakUTKTzKRUWFAHzydAmkg/SgWZPLxCNL//FM7FiZiV1UPWklUiZCgnQyivMky6EBdDHKhP1rOPkz1Ou7VPxi3UK9hehuuahZfWGVqHoTMh+MgGSlUPnvLEDfMUJupSSPG0burjdDUsR1FQyDRLwk1X09r0jk4ivgRRTxVp8e6dQQS0YBaN4Er+u4I34KjP4gPd+vZFq7EGDQwByyI5p87flB0CQ+1zVWlWOQg37ceISrDqYCNwaIBz8BO9gcP4uD9kn/p+5UrWkYNcynYxRbTgTHYJr2OYqAxMwZAH9J/TF9J8a10FNUEcDkVHTAyLIgA4ixYg2Org/6YmvIgoKznLV5IwY56jybC0kh4b83Oe1VjKaZU94mBy46Sa1Db+Grx6GDUF9dkCgM/YG2BB6REagWlpjowoGa8ha8zyMwveXLHlrW+82O0F8eHGrNIMkeWa6jny9C
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?GRnLDhd5rxP3r0lu5Ky4xDc0dYyIozFPNouZLcwKKyT2X14meB4O/CGBGg?=
 =?iso-8859-1?Q?FHh2USJu4IH+aLuXAtRi9ZNArOVKZ8GDlPoaMznmGX+8IPkUhHIfe2Q/rn?=
 =?iso-8859-1?Q?uymeMbHIvqRW9j4qdJu3+abCj87ht397cRLpUNT9x2XOwZQq87xG4GKGrF?=
 =?iso-8859-1?Q?1b+pX866bTXc7DMXcSBJ/VNRG5+6iNclKIP9kOkr0fZumGin3XWgM+42z0?=
 =?iso-8859-1?Q?ocXJNVqKxsv3I2xcljlh76eJ1xygbuhrX9fSEOrrLoC9UENfunn/kIff5v?=
 =?iso-8859-1?Q?xUEVIExl6xmXpX5Fwis4uHkquM83M2urc0KbvCuwV7kC652jwic+7EIAWh?=
 =?iso-8859-1?Q?iIZLikQplAaqW9R8ypLpARp3/IGhHV6hnhspJZD7HcyCQox3DdF/aosOEX?=
 =?iso-8859-1?Q?6DSGQYLZde5RzpPJhWS4Ewg2TM6vaB75ZvaaI3Fvn+qXDtEgGq9lq4tZ2A?=
 =?iso-8859-1?Q?Bgs8U06L/lkNzhKHeg/Yb4iwHDEKlxF1lO76q9QQKt6/ZCWK1dxj+yeS0d?=
 =?iso-8859-1?Q?TuuPZwAdwdsK3CQqLp50XePxC3y294qeOt5svslouYsRA0Diwak1FQ1VkK?=
 =?iso-8859-1?Q?njLOeOAsWZwvq584fijC9x2oR53rpgjWRnSr+3ENHgUE8wyB2Y/RR1xjp6?=
 =?iso-8859-1?Q?mMJrqg/v4Q1TlDcO8A3FpfJFCp61elVE/RLHog3RIVJtIZ6wRFDP8MIfVj?=
 =?iso-8859-1?Q?VEDpy3A4cBHesKacnZOiTdASska+4FSoG7CP3Ow5oxatLvqpHwsZU1aokX?=
 =?iso-8859-1?Q?agstatEtKzrPCGsF2sZOOU7n/8gV7dKe6P+PSEyjeVVIpSYh8aO1HIsD+j?=
 =?iso-8859-1?Q?1vegmQb37GjRRtYuI+MesMvnOaRs4VzvhMUmSwsDrwnr96pSvHjIcndMtN?=
 =?iso-8859-1?Q?viJagvnYndg5E9lqfWAf042O8m27End4pbYvqMGAq2rAIhbE4o48KPMY2U?=
 =?iso-8859-1?Q?SCVDYv6AhIDvdRbcqHuvkBI//JRtx2QcCUlheJmIzK+ccTUsL35nMYL5y+?=
 =?iso-8859-1?Q?9Cgv9De95rL7zsTvu8L+sm2jR8A4ywpvm0x8g8FRb8gwE937DiSQVMm9DF?=
 =?iso-8859-1?Q?DvQz+5tEjfNqC+0+cZHxHYcRuq+uMg3KPxPiq15mkdXDsChoj3zxoxTi6X?=
 =?iso-8859-1?Q?VBobDws73qvgiWfnBA2XSzOrW6J4yg+z7PQEGnUz8bRiWbx2LTqAvG3tBe?=
 =?iso-8859-1?Q?f2z3QJYaT/F0epj/+9dt9qklna0rJ4un6EzRt53fiUaLbgilADaeBWuj2k?=
 =?iso-8859-1?Q?8PahjlOZFopkLzI0sApCkOyIRWhBzKSgVLa+CjqyPQ1cTagUqvWUgwJ64K?=
 =?iso-8859-1?Q?SH+MCWk9wklD7WYAEWtQ8rhy5aZ6SnDGOMyOvwciXmY6wOXcACrTh7g4Hq?=
 =?iso-8859-1?Q?PCJBMngxhfCUACVw43+5A/GDjVgGtDz4kLPsy4jef12aHa/EKT4LmILUib?=
 =?iso-8859-1?Q?Kbzocv3eCjJNtUCBbXvtINs64Q/vcoxQ0DMU8hSJpGEyhAEPWc+GJ5yMs8?=
 =?iso-8859-1?Q?w0yEcmGbjDOH55ZwY/VaV00EtV6PXPyKRGtiPky9JXJLBZep4W8LgH4Uy1?=
 =?iso-8859-1?Q?lgIxVam5ye2f9UruRNByalfsBR7bCDXUHwaEQutwsBN/UunufYp7Q0JG/e?=
 =?iso-8859-1?Q?01P4nCWb0PS34nBelwyfFMk3ITvN8ydtu86fDFTHSR67OEmMq1TbXzn9rU?=
 =?iso-8859-1?Q?kMqL9jIjCPw/7H79vU4lxLw/BCZ0TFxjN3KJC2qvWARkhXGRGK+LDMnDJ5?=
 =?iso-8859-1?Q?dSElUm1Ug8RJwDVKad+zQNfbeSnJ5D5fm/XjQ3k6Oed9YR5rlTwRNdXSq0?=
 =?iso-8859-1?Q?Rm+4LsQQzzWuOj9yeRltmg3voI3UA1w=3D?=
X-Exchange-RoutingPolicyChecked: XjRgvNJe3S/PLvsEEf64FTjBoFfm0CtRv6ox6Q2VCrvRCKZyZV2g/YzobsFxMDcxuEBcpNNMkjBMSDadHfv8DCVwwbnw9szNH8PwsxZQwLaaYKLDVC+TgXXuGqhJ1Kw+dneNBMnB0lwhS5za6g3wRfiusJcgHtPRnF0Ghf52YaWf2IVqc82cwvG14D14qi1w1kx9Egs8TaGeXbc+KcNvsO93s80a6Sp8INpCDCrQYHnDeEqQ9Rt/3NnUQji8LMC4REI1DFV3L3XiNBCd6EjeD1oEnnBING+wQjiszDDSMB6TTFkoY6ZyUR5ktFJRXaffzWsAIQp/0vZopr8E1IHFHg==
X-MS-Exchange-CrossTenant-Network-Message-Id: dbdcfa44-5452-4dd4-f06b-08de8c43f102
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 21:00:56.9591 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J8INILJMIc1CyxKR6WPMh6nPpfT/Qo8osh2MUqs0s25CPXFWH+YdfWrf0hsyHco1BTuvz82umfq6pqQjMkfmrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR11MB9789
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

On Sat, Mar 28, 2026 at 02:06:20AM +0530, Raag Jadav wrote:
> With bare minimum pieces in place, we can finally introduce PCIe Function
> Level Reset (FLR) handling which re-initializes hardware state without the
> need for reloading the driver from userspace. All VRAM contents are lost
> along with hardware state and driver takes care of recreating the required
> kernel bos as part of re-initialization, but user still needs to recreate
> user bos and reload context after PCIe FLR.
> 
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
> v2: Spell out Function Level Reset (Jani)
> ---
>  drivers/gpu/drm/xe/Makefile     |   1 +
>  drivers/gpu/drm/xe/xe_pci.c     |   1 +
>  drivers/gpu/drm/xe/xe_pci.h     |   2 +
>  drivers/gpu/drm/xe/xe_pci_err.c | 151 ++++++++++++++++++++++++++++++++
>  4 files changed, 155 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_pci_err.c
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index dab979287a96..996b43680f84 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -100,6 +100,7 @@ xe-y += xe_bb.o \
>  	xe_page_reclaim.o \
>  	xe_pat.o \
>  	xe_pci.o \
> +	xe_pci_err.o \
>  	xe_pci_rebar.o \
>  	xe_pcode.o \
>  	xe_pm.o \
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 01673d2b2464..f252ac3ea82c 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -1324,6 +1324,7 @@ static struct pci_driver xe_pci_driver = {
>  #ifdef CONFIG_PM_SLEEP
>  	.driver.pm = &xe_pm_ops,
>  #endif
> +	.err_handler = &xe_pci_err_handlers,
>  };
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_pci.h b/drivers/gpu/drm/xe/xe_pci.h
> index 11bcc5fe2c5b..85e85e8508c3 100644
> --- a/drivers/gpu/drm/xe/xe_pci.h
> +++ b/drivers/gpu/drm/xe/xe_pci.h
> @@ -8,6 +8,8 @@
>  
>  struct pci_dev;
>  
> +extern const struct pci_error_handlers xe_pci_err_handlers;
> +
>  int xe_register_pci_driver(void);
>  void xe_unregister_pci_driver(void);
>  struct xe_device *xe_pci_to_pf_device(struct pci_dev *pdev);
> diff --git a/drivers/gpu/drm/xe/xe_pci_err.c b/drivers/gpu/drm/xe/xe_pci_err.c
> new file mode 100644
> index 000000000000..b6ae1d6d85f6
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_pci_err.c
> @@ -0,0 +1,151 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#include "xe_bo_evict.h"
> +#include "xe_device.h"
> +#include "xe_gt.h"
> +#include "xe_gt_idle.h"
> +#include "xe_i2c.h"
> +#include "xe_irq.h"
> +#include "xe_late_bind_fw.h"
> +#include "xe_pci.h"
> +#include "xe_pcode.h"
> +#include "xe_printk.h"
> +#include "xe_pxp.h"
> +#include "xe_wa.h"
> +
> +static int xe_flr_prepare(struct xe_device *xe)
> +{
> +	struct xe_gt *gt;
> +	int err;
> +	u8 id;
> +
> +	err = xe_pxp_pm_suspend(xe->pxp);
> +	if (err)
> +		return err;
> +
> +	xe_late_bind_wait_for_worker_completion(&xe->late_bind);
> +
> +	xe_irq_disable(xe);
> +
> +	for_each_gt(gt, xe, id)
> +		xe_gt_flr_prepare(gt);
> +
> +	// TODO: Drop all user bos
> +	unmap_mapping_range(xe->drm.anon_inode->i_mapping, 0, 0, 1);
> +	xe_bo_pci_dev_remove_pinned(xe);
> +
> +	return 0;
> +}
> +
> +static int xe_flr_done(struct xe_device *xe)
> +{
> +	struct xe_tile *tile;
> +	struct xe_gt *gt;
> +	int err;
> +	u8 id;
> +
> +	for_each_gt(gt, xe, id)
> +		xe_gt_idle_disable_c6(gt);
> +
> +	for_each_tile(tile, xe, id)
> +		xe_wa_apply_tile_workarounds(tile);
> +
> +	err = xe_pcode_ready(xe, true);
> +	if (err)
> +		return err;
> +
> +	xe_device_assert_lmem_ready(xe);
> +
> +	err = xe_bo_restore_map(xe);
> +	if (err)
> +		return err;
> +
> +	for_each_gt(gt, xe, id) {
> +		err = xe_gt_flr_done(gt);
> +		if (err)
> +			return err;
> +	}
> +
> +	xe_i2c_pm_resume(xe, true);
> +
> +	xe_irq_resume(xe);
> +
> +	for_each_gt(gt, xe, id) {
> +		err = xe_gt_resume(gt);
> +		if (err)
> +			return err;
> +	}
> +
> +	xe_pxp_pm_resume(xe->pxp);
> +
> +	xe_late_bind_fw_load(&xe->late_bind);
> +
> +	return 0;
> +}
> +
> +static void xe_pci_reset_prepare(struct pci_dev *pdev)
> +{
> +	struct xe_device *xe = pdev_to_xe_device(pdev);
> +
> +	/* TODO: Extend support as a follow-up */
> +	if (!IS_DGFX(xe) || IS_SRIOV_VF(xe) || pci_num_vf(pdev) || xe->info.probe_display) {
> +		xe_err(xe, "PCIe FLR not supported\n");
> +		return;
> +	}
> +
> +	/* Wedge the device to prevent userspace access but don't send the event yet */
> +	atomic_set(&xe->wedged.flag, 1);
> +
> +	/*
> +	 * The hardware could be in corrupted state and access unreliable, but we try to
> +	 * update data structures and cleanup any pending work to avoid side effects during
> +	 * PCIe FLR. This will be similar to xe_pm_suspend() flow but without migration.
> +	 */
> +	if (xe_flr_prepare(xe)) {
> +		xe_err(xe, "Failed to prepare for PCIe FLR\n");
> +		return;
> +	}
> +
> +	xe_info(xe, "Prepared for PCIe FLR\n");
> +}
> +
> +static void xe_pci_reset_done(struct pci_dev *pdev)
> +{
> +	struct xe_device *xe = pdev_to_xe_device(pdev);
> +
> +	/* TODO: Extend support as a follow-up */
> +	if (!IS_DGFX(xe) || IS_SRIOV_VF(xe) || pci_num_vf(pdev) || xe->info.probe_display)
> +		return;
> +
> +	if (!xe_device_wedged(xe)) {
> +		xe_err(xe, "Device in unexpected state, re-initialization aborted\n");
> +		return;
> +	}
> +
> +	/*
> +	 * We already have the data structures intact, so try to re-initialize the device.
> +	 * This will be similar to xe_pm_resume() flow, except we'll also need to recreate
> +	 * all VRAM contents.
> +	 */
> +	if (xe_flr_done(xe)) {
> +		xe_err(xe, "Re-initialization failed\n");
> +		return;
> +	}
> +
> +	/* Unwedge to allow userspace access */
> +	atomic_set(&xe->wedged.flag, 0);

I think this will leak a PM ref which we take wedge the device. I just
fixed a recalim bug here related to this [1], so this is fresh in my
mind.

What I think you want do this is in xe_pci_reset_prepare()...

xe->wedged.pm_ref = !!atomic_xchg(&xe->wedged.flag, 1);

Then in xe_pci_reset_done()...

if (xe->wedged.pm_ref) {
	xe_pm_runtime_put(xe);
	xe->wedged.pm_ref = false;
}

Or you change the structure in [1] mess with 'xe->wedged.pm_ref',
multiple ways to do this.

Matt

[1] https://patchwork.freedesktop.org/patch/714622/?series=163948&rev=1

> +
> +	xe_info(xe, "Re-initialization success\n");
> +}
> +
> +/*
> + * PCIe Function Level Reset (FLR) support only.
> + * TODO: Add PCIe error handlers using similar flow.
> + */
> +const struct pci_error_handlers xe_pci_err_handlers = {
> +	.reset_prepare = xe_pci_reset_prepare,
> +	.reset_done = xe_pci_reset_done,
> +};
> -- 
> 2.43.0
> 
