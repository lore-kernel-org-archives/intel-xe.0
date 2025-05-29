Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BE8FC5B543
	for <intel-xe@archiver.kernel.org>; Thu, 29 May 2025 22:52:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C531D10E7BB;
	Thu, 29 May 2025 22:52:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XpjyiUJD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C93DA10E7BB
 for <intel-xe@lists.freedesktop.org>; Thu, 29 May 2025 22:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748559151; x=1780095151;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=1iaiDZpeVrG5V/v7RCRwpYPePQmnHzha5vqlUd1I1Us=;
 b=XpjyiUJDdu5WrWYE5XeYNHiMuxFgISEES4XhJEhaYlD7TxSIiRoCTfN2
 QFEyuqM39OBfBe8Nnu+nVs9RJexqSHpkMtj6gJbWE1Q3p14HbFjlAIjNy
 z3aIb7DTrx4tjrcC90JOuKAD9rwm/eYmUpwuukD/frz9ETfpVV2D20BHG
 IHiRYwE9Q7hiL6LVA2qD4UEjH0TmrVq5MFbViRlBvBVnWjTHKzZZRc8OH
 OPgRRJj88eEoO8XYLB/+l/Fi7iOcZ3/MCQvyDW62dpaDWBJgsIYjelEfi
 xO0f5JY61uY1Hf/durPmUbZDYl8z6vpJrRxTZ1K2E/VwIETcWB02t4/uX Q==;
X-CSE-ConnectionGUID: LesPhomTTJeiqI0Uy3h0TA==
X-CSE-MsgGUID: P5YkLaoYS3WtDsLKYkh5zQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="73174209"
X-IronPort-AV: E=Sophos;i="6.16,194,1744095600"; d="scan'208";a="73174209"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 15:52:31 -0700
X-CSE-ConnectionGUID: FTuEkNjYTaSqwjZk5RHWWQ==
X-CSE-MsgGUID: F2kky5JmRTufvNBCPvxBbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,194,1744095600"; d="scan'208";a="143651668"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 15:52:32 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 29 May 2025 15:52:31 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 29 May 2025 15:52:31 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.67)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 29 May 2025 15:52:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mbWuGBAsjCVCE1vWnalQaMSvIlW+OHFa6Ana87QMPWGplHJTJH4Vo78dTDxDBlqg/qH+LZqItR5vvMKLrJ/GnDLYmEdxrHlTD8VQ+xtCUn1o1H+yeHh4rEx9YDDqRtayChNBfvcPOYDWzEez1oaV163yfcoq0co7QynKRaRXW1DjsKmzR449vGt56D/lI+4d42iLKa0uA76OMXG6ClqC6tW6NhGtkBTQKxQ8uzUKaqJqtMs41+xhf3KDJYAiOB6Q2O71lptd4qqpPt1m4DvV0glLDdDD5FWhU9qYN3KAvmNY21D4vHrQjcHWNe0QVZUW5Uo4gGDJ4ao7E1+yfO2QWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V2OSls7VMZsGnEBaW1cc5H+MQywrFnJuU5yjcPhlaJA=;
 b=OPPSbllEw7qzZQ/ZN4X1dPjzZq122Hc97EUUnNtHUGeiKe2EWURBRFBGeN4Epw1hHqKm9uBnGHiT0aur4dW9O5TAkkd9CZ9QlsHSSarSzgqCmCItapd+isJ0g8gi7DfTWMpL9zYr4VuPRuIHDED16itqMbUnnxMNjw1JZ59cxFRLJRtXQZbRIl1oRh7I5ZSbng8BEDlX+vVecyFmdw0eFbHyqSGmX5Ki4N0DSnFjUqRS4oJopGU7gcLRpeg1ByvMgyf/y2Z84g8JmniVXQryPAziUzrh1PQxwsw9R4g67eHHkpYYrxo6vXJV7WU03MnVeTKjfw29XUkyOufjIu4RFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MN6PR11MB8195.namprd11.prod.outlook.com (2603:10b6:208:47f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.29; Thu, 29 May
 2025 22:52:28 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8769.029; Thu, 29 May 2025
 22:52:28 +0000
Date: Thu, 29 May 2025 15:54:00 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 11/19] drm/xe: Allow CPU address mirror VMA unbind
 with gpu bindings for madvise
Message-ID: <aDjliFo0mP7h544f@lstrano-desk.jf.intel.com>
References: <20250527164003.1068118-1-himal.prasad.ghimiray@intel.com>
 <20250527164003.1068118-12-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250527164003.1068118-12-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW4PR03CA0315.namprd03.prod.outlook.com
 (2603:10b6:303:dd::20) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MN6PR11MB8195:EE_
X-MS-Office365-Filtering-Correlation-Id: 48a72408-4964-4ca3-0f47-08dd9f037ca7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?G+OSaRiUE3ywgLxFryuYoattL8N7DmCQZOWv4QMm5rv4wsX3AfgL3f3cVWi0?=
 =?us-ascii?Q?eNj1bss0oDlt4cJevYGpNOGrsa+I6nUFW5yFSJ6b4g7VPYXpVYPa0Bzip2cA?=
 =?us-ascii?Q?IhuQQHV2a6ljEvY6AOrciLPg9E+Yx1DeG3X4xHCxrb3TDHbM6ZVCJnwg/R6H?=
 =?us-ascii?Q?C7TEGT17WsY+bk43aG0VYhUmwGZ6xuL9pFxbALwSKwclTy/QVy/XmYqLzElu?=
 =?us-ascii?Q?dDDnucJz7jVmAKEbHaa+OtWoJLI3+QpZHLOQRrBPwP679iZHFyUB3/93MVrA?=
 =?us-ascii?Q?0ek38REJCUnS+TwPixYQJ7DNvcrgwOq/o9PW7xCFjPIHggp99GBPx7IjvrIA?=
 =?us-ascii?Q?v7ImlMwMWQG0Jyhcu6WpZd6FmI62TPMk7V8yiCSVC6HHO9nHnpgcqpGBOri2?=
 =?us-ascii?Q?TWtovfPydZGAQqhsl25hnRaD50+6KEt4ps/sg+FlM6vE7s4BvMRaRiC+9KX1?=
 =?us-ascii?Q?/a5sDQ20vtU9Bh5HTLS+p/qEEE39bWT7KaZ4Wq/JV8sGU9w7RUCP8XMdau+6?=
 =?us-ascii?Q?FewOt9eE5DHs8NSVEjAAToXbCLmeAJZc4uw38baqxpsr5N45zDD/53xIC3b5?=
 =?us-ascii?Q?StRxDMM1fsGh/du9bObsKlKLnlyOCMtqbVFLEMKDGToEeEGAgq3/jva8bpp5?=
 =?us-ascii?Q?8yLjhsjSIDSV4wEZtjeSEk49TaWApVBH/TwXO54Y9gxZyc0FXW8iQ42KkEPA?=
 =?us-ascii?Q?R+4J5Nld8NFQz2LoJaZZJ1bKTbMt9dAgAZbLqDg+olDlI8dynLoujA8ZHvfY?=
 =?us-ascii?Q?KxD9OSSe9g1zL3HtQaW4t9N3hTA94nR1EabXk7YlEmKjDJxn1fL6d4IxLQ0S?=
 =?us-ascii?Q?pNNmgtkjwaCdNIqqPy5NTdFUZoKkQPKzplU7YaA2Jmc1qQomo7OYjWQb8E6F?=
 =?us-ascii?Q?nC/ILlbaPSRngFMbrNM9yMXZLRMtWgGzyZ69useeEwclrQYXFptNBcKUAlOP?=
 =?us-ascii?Q?6jMiq8jgJySGVII9G48MTENzpZAPy1weX4vtJB2yNz9ZuAv0BxQpaXCx3Drq?=
 =?us-ascii?Q?oenrE4RNtepGko4g1f/9ee6hw+GpBXOMxncvM0eW9uL0mtgig9/pj1clx29x?=
 =?us-ascii?Q?dLqc7sfHv6dOT4ZGWzmzhEq97UrWnSXf4J8cP8l4Af0vCZPKOhc8ezulv64L?=
 =?us-ascii?Q?22RJqftgno35wdrUkmAQDSfs32wzvn8GARVT9L9IYJPptX4iFPb6rghuru/0?=
 =?us-ascii?Q?ZfC0c8HPs8gKzBocZzwMpIA8YoN2xPz26VCYqXuMIiBma4Au9ivIydDYndaf?=
 =?us-ascii?Q?JKJ1rpke/6nUqOu67IbDKTei01pv9LMKvY8+XC/Zi0er8VctZbxSVxM6z13Z?=
 =?us-ascii?Q?+9s1NpFsDugDBIkF+3UCYMT54I6g2YVwErBct9U3r0DwvBe8U6b5pZdGsOB9?=
 =?us-ascii?Q?i6iRQg/BwfA2PGQz+PMir/kTzbMKKxRtkjmhuyJW96e1nQGaOmNrZx0kADdK?=
 =?us-ascii?Q?WB/kSPnyTBg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kLezyHJPC/PK0sndfbpo49pRMIro8E2pbTrloohNjkMcEdizxTCUMfYglPku?=
 =?us-ascii?Q?DCy23xGUO6nYZN3Jqaf2KRn50UKGMkJfGFN0fPBqUPoVNjop0+jKeLYCq2uS?=
 =?us-ascii?Q?5mo2taVA7cxlkQNkJFeVVlYX8yw3T6fWHvHMDxNk+Au10k+in2geh7sQQpNH?=
 =?us-ascii?Q?9jQr7aUU+fky2ewlUB90df5DI1HPo6LdvROG0xVxcLIZV2BnUlQ3tOgHYI5S?=
 =?us-ascii?Q?DkAtK5HjaqmJAw+9IGmfjNypDHOuXaiR1ZQ+JGDN5aphktiZIATXbSU10r9K?=
 =?us-ascii?Q?/PZ6tf0JoLKk/RMfFLyzp0MC5Eq9bvT5/wmwhTq6X8kNtFrXqyzXwMABpK5r?=
 =?us-ascii?Q?6SfEENLLU5zlj4GO/GyKXNSjDjkfSr/N/qWw40YRL97VPtxnf/BDXJ2tbaTk?=
 =?us-ascii?Q?cYt4WB8K7Elw/dS5c4UUbVEZYVYbpVsAL3JJI++MfjZOdNHbAIhkrPnnmCBz?=
 =?us-ascii?Q?Fc0f533+FYoUD7g4pKi5D6UyuXhJi+Zf8JsCquReIHxAYkQs3WQ/GjUln70J?=
 =?us-ascii?Q?/du2dxWKMMP9hweerpYiWqRoHhhMl3m1ht+JRLQNbre0TXV1JDclW4THWy6D?=
 =?us-ascii?Q?OBf0r0FRv2AjWPHYAE1dOwgwvqy64pROrtqkspmI7VAHdXSb8DVC9Dai43gN?=
 =?us-ascii?Q?2NKgd2sYMrLGyYtFwigz2Xedn4DKWuWhJN6fa8cJpZmdEdXtvm8DfcF5UbJz?=
 =?us-ascii?Q?urgiyntTc89q9wEunYlOaIVrVCQXwg2uMRU05ZtaPfUNVLcBauX5kkVuikQ1?=
 =?us-ascii?Q?Pd7d+ECgztW85Lrf2Pll4dOXLLncXoOTK8EIBgzebWuxGB4wuKWbtSvel4vj?=
 =?us-ascii?Q?s9t0ogAFDg8xORml9qoiwBpQlIMqgetIWWoFAdKp5JaGfdJEFQ/XwKzKf0a7?=
 =?us-ascii?Q?5K8sAZBGIh0JcxDoQKi1bQnSZ9HDV9kEjB710XcS2eNGh+842tPJjLclT2Sx?=
 =?us-ascii?Q?23sH9191t54zup9kbmQI9B0dF6FU1R4N7n+frRW2+VvShSWQhxjSEsBMkPKd?=
 =?us-ascii?Q?mQls+em+bF2R+KAosnZ1WzUmxp4CnmcjqJHNswYHN1GMzTVZbJMiT1T6y3EL?=
 =?us-ascii?Q?Ah48b86V43MzicAAtLXT1Py8IbCQda3t+7HUvYDtpjsDSZiVBiLY8/gQGKEa?=
 =?us-ascii?Q?Qebl16SsnR0mungsK8ASkkm+PcG+2h5001BpAsW0A8zP7ifSljXBe4dzTMYa?=
 =?us-ascii?Q?0dRu94k3KUt40Asc6KI8zBxxGipJh83JVgek/CmI3NmOI+Fn9tYhORoaAOFU?=
 =?us-ascii?Q?BYujtmHEuw/y0SkaHmwFYaIoqY+3H+cVTUvq2owA4+B7XNNOis0qvQcuTolE?=
 =?us-ascii?Q?NevxpPTtJUFGU6awCHvHNoWV2jR2vf3WJrOH35HgCpxdXiVEkM9paqISFOjU?=
 =?us-ascii?Q?nAqCG7IJDFR08FgDmPA8m7K2FnHSUblDtER7eCCQMfzGgWijMBb5k7IoAdUF?=
 =?us-ascii?Q?U1vyTNgXekbHV5z3irBFZrXB6pu0siJry1uEEnY7nbwUqvqJMH+zQ5SutDhp?=
 =?us-ascii?Q?H4pEk5Glg65gBQ8IU3UQx6ZhwnxrceKffpRy0HXFI23oFFF7s7C9lktaqj41?=
 =?us-ascii?Q?jDemoGw/kt9MBygc+Fz/NNt6c7X2PP95WjXOQ+AIqKkYDfQwHOustRP/0Iwj?=
 =?us-ascii?Q?SQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 48a72408-4964-4ca3-0f47-08dd9f037ca7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2025 22:52:28.3571 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ALyG9oYonrYUTc5A+kHWCheGanwrnNOiANCIEs8DQotX5fc14MOTtPGJs+tuqVeAjRoLJrfpeLSLin7hYXtJjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8195
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

On Tue, May 27, 2025 at 10:09:55PM +0530, Himal Prasad Ghimiray wrote:
> In the case of the MADVISE ioctl, if the start or end addresses fall
> within a VMA and existing SVM ranges are present, remove the existing
> SVM mappings. Then, continue with ops_parse to create new VMAs by REMAP
> unmapping of old one.
> 
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_svm.c | 25 +++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_svm.h |  8 ++++++++
>  drivers/gpu/drm/xe/xe_vm.c  | 18 +++++++++++++++++-
>  3 files changed, 50 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index a4d53c24fcbc..5691bb9dbf26 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -942,6 +942,31 @@ bool xe_svm_has_mapping(struct xe_vm *vm, u64 start, u64 end)
>  	return drm_gpusvm_has_mapping(&vm->svm.gpusvm, start, end);
>  }
>  
> +/**
> + * xe_svm_range_clean_if_addr_within - Clean SVM mappings and ranges
> + * @start: start addr
> + * @end: end addr
> + *
> + * This function cleans up svm ranges if start or end address are inside them.
> + */
> +void xe_svm_range_clean_if_addr_within(struct xe_vm *vm, u64 start, u64 end)
> +{
> +	struct drm_gpusvm_notifier *notifier, *next;
> +

lockdep_assert(vm lock in write mode);

> +	drm_gpusvm_for_each_notifier_safe(notifier, next, &vm->svm.gpusvm, start, end) {
> +		struct drm_gpusvm_range *range, *__next;
> +
> +		drm_gpusvm_for_each_range_safe(range, __next, notifier, start, end) {
> +			if (start > drm_gpusvm_range_start(range) ||
> +			    end < drm_gpusvm_range_end(range)) {
> +				if (IS_DGFX(vm->xe) && xe_svm_range_in_vram(to_xe_range(range)))
> +					drm_gpusvm_range_evict(&vm->svm.gpusvm, range);

Why evict here? I don't think that is required.

> +				__xe_svm_garbage_collector(vm, to_xe_range(range));
> +			}
> +		}
> +	}
> +}
> +
>  /**
>   * xe_svm_bo_evict() - SVM evict BO to system memory
>   * @bo: BO to evict
> diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
> index af8f285b6caa..b36f70ab3d03 100644
> --- a/drivers/gpu/drm/xe/xe_svm.h
> +++ b/drivers/gpu/drm/xe/xe_svm.h
> @@ -92,6 +92,9 @@ bool xe_svm_range_validate(struct xe_vm *vm,
>  u64 xe_svm_find_vma_start(struct xe_vm *vm, u64 addr, u64 end,  struct xe_vma *vma);
>  
>  u8 xe_svm_ranges_zap_ptes_in_range(struct xe_vm *vm, u64 start, u64 end);
> +
> +void xe_svm_range_clean_if_addr_within(struct xe_vm *vm, u64 start, u64 end);
> +
>  /**
>   * xe_svm_range_has_dma_mapping() - SVM range has DMA mapping
>   * @range: SVM range
> @@ -312,6 +315,11 @@ u8 xe_svm_ranges_zap_ptes_in_range(struct xe_vm *vm, u64 start, u64 end)
>  	return 0;
>  }
>  
> +static inline
> +void xe_svm_range_clean_if_addr_within(struct xe_vm *vm, u64 start, u64 end)
> +{
> +}

Maybe...

s/xe_svm_range_clean_if_addr_within/s/xe_svm_unmap_address_range

Or if you can think of something better but don't really like
xe_svm_range_clean_if_addr_within.

> +
>  #define xe_svm_assert_in_notifier(...) do {} while (0)
>  #define xe_svm_range_has_dma_mapping(...) false
>  
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index c220bf904ee0..8208409485f6 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2359,6 +2359,22 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
>  			op->map.pat_index = pat_index;
>  			op->map.invalidate_on_bind =
>  				__xe_vm_needs_clear_scratch_pages(vm, flags);
> +		} else if (__op->op == DRM_GPUVA_OP_REMAP) {
> +			struct xe_vma *old =
> +				gpuva_to_vma(op->base.remap.unmap->va);
> +			u64 start = xe_vma_start(old), end = xe_vma_end(old);
> +
> +			if (op->base.remap.prev)
> +				start = op->base.remap.prev->va.addr +
> +					op->base.remap.prev->va.range;
> +			if (op->base.remap.next)
> +				end = op->base.remap.next->va.addr;
> +
> +			if (xe_vma_is_cpu_addr_mirror(old) &&
> +			    xe_svm_has_mapping(vm, start, end)) {
> +				drm_gpuva_ops_free(&vm->gpuvm, ops);
> +				return ERR_PTR(-EBUSY);
> +			}

How about dropping this.

>  		} else if (__op->op == DRM_GPUVA_OP_PREFETCH) {
>  			struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
>  			struct xe_svm_range *svm_range;
> @@ -2662,7 +2678,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
>  
>  			if (xe_vma_is_cpu_addr_mirror(old) &&
>  			    xe_svm_has_mapping(vm, start, end))
> -				return -EBUSY;
> +				xe_svm_range_clean_if_addr_within(vm, start, end);
>

And here add a flag to xe_vma_ops which says we are in madvise.

e.g. XE_VMA_OPS_FLAG_MADVISE

Then...

if (xe_vma_is_cpu_addr_mirror(old) &&
    xe_svm_has_mapping(vm, start, end)) {
	if (vops->flags & XE_VMA_OPS_FLAG_MADVISE)
		xe_svm_range_clean_if_addr_within(vm, start, end);
	else 
		return -EBUSY;
}

Matt
  
>  			op->remap.start = xe_vma_start(old);
>  			op->remap.range = xe_vma_size(old);
> -- 
> 2.34.1
> 
