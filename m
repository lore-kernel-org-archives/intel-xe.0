Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C664C624DB
	for <intel-xe@archiver.kernel.org>; Sat,  5 Sep 2026 13:54:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1E3D10E116;
	Sat,  5 Sep 2026 13:54:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XRKBKDni";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F9E510E116
 for <intel-xe@lists.freedesktop.org>; Sat,  5 Sep 2026 13:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788616482; x=1820152482;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=bEt80RsS2kyrZD8W3DG/Fe3jQvAgC9jZ0yRSQkflGkY=;
 b=XRKBKDnisLh2MIT2xtHTvntno8jiR4/zm2uKuHrZC6vgD6no9Xy4XgZt
 F31GUtGfvU56PqGAb34UQAehAh2jwBKAVMWP0qgWBvEbakoVd8SKdmLSF
 CEZUZLSPNW4h51e/Jil+zH0uQ2Qd0RyfMN+9EQX0ZPPS00zgY8AR7eIxt
 Evx9Q94XM+hUBGcFvXn3S0/3oXxKBtKkRJuS1XbKPUcQ+Zn2VKcwzEy8A
 rnlzDkrHB46GtKs6K00Z+NV7n84W11gSiDM+dZWtKcs/JtCbAux7No7dB
 BwrrNrtGWPmCPPHDdUlpwlYR0wjWVJOYBP1DJ7ROxA2oMux+kpaoZTYtJ w==;
X-CSE-ConnectionGUID: D3WWE6/cTWGjIWlssiv7tQ==
X-CSE-MsgGUID: SDik/v1cQwiwr5QajguRDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="100448922"
X-IronPort-AV: E=Sophos;i="6.25,263,1779174000"; d="scan'208";a="100448922"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2026 06:54:42 -0700
X-CSE-ConnectionGUID: udDsHVb3QEKbaQoKWK+ygQ==
X-CSE-MsgGUID: W8YEqNCwT1WYAycFbkSP4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,263,1779174000"; d="scan'208";a="266615436"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2026 06:54:42 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sat, 5 Sep 2026 06:54:41 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Sat, 5 Sep 2026 06:54:41 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.10) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sat, 5 Sep 2026 06:54:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bemwy7Eyo0os5YGy/mzURnjmfKlpIlCHUC1TdfJleRneIR89PrAxMv79qqf1EykK2M6lv5z76SI+Lak/tBJCWhgOTaIWgI9mIDHv7WhtuORbzpRhHzUC/KwuFbKszzOLtHWOlNWIbv0SWgcsRIMqCD2HWSU0EKzxJGjitkXebcXuaSvhLQx+z4EgI+KtCxGuEK2FqWfzVOc0gaPW0oesHVaa+BlRGv7i/CSPOUuuRmLuICStKetZaarBITBLJrkUKIFImuBQxgFxDpoGtxVe2PXV7UJIghMIFZaK1YJA0+4gVPKfvTo7SYWE1JY6urBtKc0go5MRjZ8nQvS3m2gitw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IHB4quFltHn4nfxKFACemaZskDY+aQ0DxdaWKQwzXow=;
 b=tTUfUyzfMyij3BiwfDVkbQbFGD1yNN78g+k5sV59laEKQmlAb8aJWVfGf1GKfDjV2o7V1Z7/nNFNpuxzC6GGg7uXbqmo7LSFnaCkrcdAzYo6b2JjUou93e9HQdd5q4XHqVoGBYaAhN1CzO7Ac1+/rtebjl95QVqsbkeJ4BtG+xiyklUVOElHtl4Kz+goT0VP+pK1z1k4S3mRm8dWGNSuK8+0pLqW9EEhB0W0eqp8Gwv0gTBvHYIRaAwGJ4A2v026M6TmCrU05ubAwgOKyceJ9C3v2n//hZX3CPLUvI+8FOUuSeE6AiqhgOhRKMWFLaGHLIacC9os8UN0GH59f3iZLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by SA2PR11MB5177.namprd11.prod.outlook.com (2603:10b6:806:11c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Sat, 5 Sep
 2026 13:54:34 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%4]) with mapi id 15.21.0360.008; Sat, 5 Sep 2026
 13:54:34 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>, Matt Roper
 <matthew.d.roper@intel.com>
Subject: Re: [PATCH 3/6] drm/xe: Drop redundant parameters from
 xe_info_init_early
In-Reply-To: <20260904170531.516-4-michal.wajdeczko@intel.com>
References: <20260904170531.516-1-michal.wajdeczko@intel.com>
 <20260904170531.516-4-michal.wajdeczko@intel.com>
Date: Sat, 5 Sep 2026 10:54:29 -0300
Message-ID: <87zexv7qi2.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0158.namprd03.prod.outlook.com
 (2603:10b6:a03:338::13) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|SA2PR11MB5177:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bb4e9e9-51fb-40ac-d2ed-08df0b553754
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|3023799007|11063799006|56012099006|4143699003|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info: 1eMRNLbHCUTwlpmel2Xxze9Rg7hgTnC0gdC0bs8MgmemS9KW11XaJi3F+Rzj/TIoX0OkhMkUn9DC5yEvsohcTZ5beGGSCqN7O3LRP8NbMuSvU8SmxZmCIbxJ+1qP8I5dEciVaz41PLo2LMSS2dtN2YBYemOKpBj6/qusMzVVg352r0x9ucSvoZH65qasqRGW6x6a/Zw8vFf9s6BFfAQG94bhtWKUw5mLZKDsaNoi+fiAnqgzhgUJDLqgIG9MfJr8wreh4g1ACK8ZufEiq6GyJMOsm3lw8e/b8Db2GU42c2LvgIhHyI4/S3+y8E3a4r/uog+aiM8VPWxBNgg1s+PpV3tS17mRYUQSm9orFbZVixbU5p4Llt6eO3aKqCJXF9jtvcJfScKzehbSqhpJ9vlCERN9l3TgXqCsmBjNbyIqu6BHfSgJWe/u/0Ew9Pa0984V+TXrKURXVqWUn0EbnsMBFlNXRwVwKZlGaw+YD+vGrQvxAVLfUDAp667GdvOa66OTxsqqqypglqL/sMPJJr0zFDDNTd9o+y6An8NiIgcLhBEQk0SlSW34nKcZUlDjY5ZU0aF+LZF+dv3kOfRv76Fq9F+Xzeu9BcUTG6VZm+GHGZBoYwBL7APNeQfaR+ij7PpRo8rWHOLKtltS2zTgmkw8U9OrG3O8zufTM6RuyLr2Glw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(3023799007)(11063799006)(56012099006)(4143699003)(18002099003)(22082099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xeGfoJV+aM/lODvP1bDlrHFCzJ8V78gkQe355eC/eEJSUkWgfLYPkaEU1Ll9?=
 =?us-ascii?Q?eJm4R64tHqpyeWEyiOOXkQvBT72yi2Rx/psUBVkY/LiIG+m3IvZX0HrFl/Xx?=
 =?us-ascii?Q?qImgb2549QLeRWh4I2QHh/9yxN1UViSQVymq9arKeHdioZw5XSdfA/8l+Yw8?=
 =?us-ascii?Q?0jEdv8YpSy566NQiPPLVeM07/KNdZV8SJlGlFLB4NZLqjfQ9SR/zUODAX7Y4?=
 =?us-ascii?Q?uNCWMUjT4mA09yOAv3+OIQ8Cocg64vFvNRex5Q69ljOti+O0RyG91Ad7xvdB?=
 =?us-ascii?Q?O9JjSn4VcMacrrrJSLFDRJy+tT9RWsazF05qZNMSRU+3UvfAw/oImoENT46W?=
 =?us-ascii?Q?+vYb5Jk+gfOLNYB2HRNQQ8SGViYr0dOn5aO7fzmQ55hVxn0N3AnLXCdmdF/M?=
 =?us-ascii?Q?nWcCHGQMjHjFFd/FHequILDqs6SP6AIaE4MqebNRoQbA5jrh3oao4h8JW/u8?=
 =?us-ascii?Q?Uq07Z7ev7KGO0e0sVl8XtaNXSasBDwCtY+Sec1oe3SsXYsD1UYtNihJSDPBF?=
 =?us-ascii?Q?4aTgSuQqHU4D7wR48tZdZnSQhVqiOSPjEprG0O8OvxPdM5wW/QTDerDpabTj?=
 =?us-ascii?Q?t3+sKm9t7v0fTfu8HrZefGRsurGkaiO+g++rwjQpzWXKybI0J6BM6/a8nPef?=
 =?us-ascii?Q?zZmVqM36JQrz6y7KW9CGnFd/1y4cQCWkK+/nzr69OjCwexvS4+AsUKp17WgL?=
 =?us-ascii?Q?UiSDCnPRU8ySjY/fT/Fchp5YkUmTXzVWNIgJg8lJDpJoUByJWNufIaejw4Nl?=
 =?us-ascii?Q?E5QUzuTmTj7Blsr/apsl9mcumEKrETeRjtsyyScJT4IDW+fr4yXok/UXpdmV?=
 =?us-ascii?Q?R/Ver3kyRw4wxhNqsiWyswYVNANCYxk4QScw+iCAA/V0UDpFamFm7EwK1zpt?=
 =?us-ascii?Q?xeOq4cVI9kfsS97mzbmfcc1ri+7KvXnKOyLRebodcaYG3fLPwv50R+p66qoV?=
 =?us-ascii?Q?hC/ySkGy8iueLhxZW3Jy2tm7T4fgWP2/wFO9eTRRaS98gCCuLA+rRfNqTopS?=
 =?us-ascii?Q?RiKC6k/ATVJpyu9Vn1zEdKDqBaUkwCBO0tRkyLXcShIAt8IYvV3PccagSylA?=
 =?us-ascii?Q?4qTKpflPKHhkfb98zR2KytsmTgoWpaiGVEQfgekMehVy3vcpOMbOTM9MX8iP?=
 =?us-ascii?Q?pBmPkeDqzr2RSQ0odVitMAXk/KLt8ZttYySz8wWhO1F2/YE2GVRPB6sqF/Gy?=
 =?us-ascii?Q?WglqYkQqr8Pr9rELmtwErF8XK4RRHlGNXO0TYzosIT5Ec/5wdXLdpLscW4M9?=
 =?us-ascii?Q?ytN6cInQFc4rjfhaaHJnntMWZplHQDZKfrPgt4fysTCNzHz4Rit2X5ZGY3TP?=
 =?us-ascii?Q?dtcZ1/p5cEoJhEGv0hD4kC4NLAn13NJU3FKOTdpnZaR8XgDRiMi9Td75wZEm?=
 =?us-ascii?Q?TuomMAFm/i1G3xWOq4vGAQ/lAcNqfxCOQZXdV2y1CiEY5uvbD+VGbBcZAWaB?=
 =?us-ascii?Q?1ONP9/YOngv3AF3END1uIz7ZwJ396KIFE+buWUyOGfdQ3PFvxW8uzupVoARO?=
 =?us-ascii?Q?kYz1v+GUhfMiB37BAeiJmSoMxFxLQmc+7Oibvq1H9awBlOrfaB9d+WkrKIwl?=
 =?us-ascii?Q?w8p1E3gJil90qmZltvsu8z94ye5LAzNhm6SGq2dPQ/FjRnJ8d7a2nHZvGFdW?=
 =?us-ascii?Q?IUOj4N1O7p4sB5sM4s22pCxBFTNVhT19bN2gSHhVqsv6rcnWimMxxXDbU043?=
 =?us-ascii?Q?KxCieQx4fZkZ/pTvMS/8qm4cRkO1cdwZyiJNk14QRrmSyQC+bt/5VPdKBwb/?=
 =?us-ascii?Q?jhiE1M802g=3D=3D?=
X-Exchange-RoutingPolicyChecked: C+N8+e5pvYAs7i7svjnsj+8W8saN19Tito0UWVHFjra0A0sUyeNMY+148lT9jEJxM37h9fjKZtKAj7mAnDlz87fb1iRtxRhQOmwq9IGcd8pgFagQef1uRg0pJ7SdBRFovsq62ao4cJrxVL6rRTFbBbHoLrxBWkIOIH0A9V/KVkC240uvdwvYdC0oZP3HZKFznmaisKU9hHIzHE/zVywPpZy/SwVyC55Scs8r8we4JFpOHcdzYjFQmozGDGa0p4l8tiXnaFyZqJcO+Q7Pnoy9gEfZo6D6AsyrACTtOAbxKsTNssiHmLWGFfnCpi2RoURT2YU39z0nw4gxd6y5tCph7g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bb4e9e9-51fb-40ac-d2ed-08df0b553754
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2026 13:54:33.9517 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9hqIC0ZJQ/BLrxCYfJAlnK7zl0N7WTpOxHBP9ZFceKFtUx/rOZlAm0zI5CL9WODF0wdgVTa/RBUEFL0bzq/R9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5177
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

Michal Wajdeczko <michal.wajdeczko@intel.com> writes:

> We can now obtain the const pointers to struct xe_device_desc and
> xe_subplatform_desc directly from the xe, no need to pass them as
> explicit parameters.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Gustavo Sousa <gustavo.sousa@intel.com>
> ---
>  drivers/gpu/drm/xe/tests/xe_pci.c | 2 +-
>  drivers/gpu/drm/xe/xe_pci.c       | 6 +++---
>  2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
> index 48d5ee478fe6..c817692c0ce3 100644
> --- a/drivers/gpu/drm/xe/tests/xe_pci.c
> +++ b/drivers/gpu/drm/xe/tests/xe_pci.c
> @@ -383,7 +383,7 @@ int xe_pci_fake_device_init(struct xe_device *xe)
>  	if (err)
>  		return err;
>  
> -	xe_info_init_early(xe, desc, subplatform_desc, &probed_info);
> +	xe_info_init_early(xe, &probed_info);
>  	xe_info_init(xe, &probed_info);
>  
>  	return 0;
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 191e69fb0e3d..d19478c9439e 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -771,10 +771,10 @@ static int xe_probe_info_early(struct xe_device *xe,
>   * passed to the driver at probe time from PCI ID table.
>   */
>  static int xe_info_init_early(struct xe_device *xe,
> -			      const struct xe_device_desc *desc,
> -			      const struct xe_subplatform_desc *subplatform_desc,
>  			      struct xe_probed_info *probed_info)
>  {
> +	const struct xe_subplatform_desc *subplatform_desc = xe->subplatform_desc;
> +	const struct xe_device_desc *desc = xe->desc;
>  	int err;
>  
>  	xe->info.devid = probed_info->devid;
> @@ -1222,7 +1222,7 @@ static int __xe_pci_probe(struct pci_dev *pdev, const struct xe_device_desc *des
>  	if (err)
>  		return err;
>  
> -	err = xe_info_init_early(xe, desc, subplatform_desc, &probed_info);
> +	err = xe_info_init_early(xe, &probed_info);
>  	if (err)
>  		return err;
>  
> -- 
> 2.47.1
