Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D5DACCD1BB
	for <intel-xe@archiver.kernel.org>; Wed, 22 Oct 2025 18:28:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B937210E82E;
	Wed, 22 Oct 2025 18:28:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kAwEVBMP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 496BF10E82E
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Oct 2025 18:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761157707; x=1792693707;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=CC0fRMesKJvVBO8DbobNHVEnEuwKRxjd3Sy7CnrBIIw=;
 b=kAwEVBMPDQroGETmaA4H6mgCzzvm3Z+e3AROmOtfR27gvMHbDUaudSZo
 CZbaghk/UIAUFy4f2RS+BqrZc9vQ6BWstYSB0fJ0J53RyMvJXmvqpg4iO
 qQVxvvB3w6kkN79Ss9ycpUNjSY4nwkEK3mcwA9eW2O/wfdpmECeims9qC
 3x/JUDg1BDj2PkhkWFYA6E6LmOxOotKur3RW4rI3EhmVbXRsUbsUc/hV/
 YNan4h2pFqochzn3HIBRPhqgzyyndfgI/lTzlaYq+JBanl4X2sSiepAv5
 XbswS1fWv62eDhLAkSGVYNfHkOzz/yVxC+Zjl8aNhBb23UtSFHHli4JtS w==;
X-CSE-ConnectionGUID: 3xlLdSWxTTq0FfohsfoV1w==
X-CSE-MsgGUID: 7BmOL6gsT6u/Xe7Pdangyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="67182700"
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; d="scan'208";a="67182700"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 11:28:27 -0700
X-CSE-ConnectionGUID: DyZoSjM+RmeQPHxfu+45gQ==
X-CSE-MsgGUID: xzHS2GTkQH2EszaXH/A2gg==
X-ExtLoop1: 1
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 11:28:27 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 11:28:26 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 22 Oct 2025 11:28:26 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.49) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 11:28:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YDcKcFp9F0GjD14F6j17nbBeF4KsqIkOjI6Vy2ei/Acu8BOqD3DrqYYuggECWS7hlAtU2fVMDl5M7YwUDRROQ/RU6cS83eeAX91C711iR1EYe7hs1kBpWPgfM6IxKKTTqI3uMMdOl2PD5qlDyNJz0KL81BOtEkPS8RSYCBB+QBsfChreQ/q8vRgCn+Ib8IiREbFWlXK1ZfBkIvR/jmjKYzAVXZwT0l/iitiHiKl2HFrhm1rWPjkplwhHG2CMJPapxqMOHZDnCE+RYRrC/OZ0Z++n7+lPaDxWbiqcnGnltmqu94q/uZFf3GKNPZqsrXUmuEYZG7XdrdnOWWHKsFtiIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EKyuKhmeuhu4kc5MK4eUPODl1JNshMbiwA1+63cwKf8=;
 b=q813gAv1jWsLs5wsSxmPGiynOOGRAX35/D865V56TGxOarorLQs0fHMd3H8JtejNjL2KOLbTamfsHr4y2+SgtAzMPCgiiP11xHpaaJydRvhaBF5i6tKYoPeh4M0qjop7iN50VZThV2bcKTcit6kr9NUNxZBm5TiaruYN37X6Kj+uqH5jgBI0X6f2ZxZdUY9uOfm8z6Mcri/Q1pRN3AI/yhhDhSU506FTjVwXQ9x0RLMV2JpL6Sb/BOGB6rnZrSimYtFq24wfjPS/lyvEAjK8lm57QlDqBuiFn/fPbuOZsgko2rPtti8qa0TOyW8cyskzuBud3QNmqYNOenYBESTtYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB5096.namprd11.prod.outlook.com (2603:10b6:510:3c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Wed, 22 Oct
 2025 18:28:23 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9228.015; Wed, 22 Oct 2025
 18:28:23 +0000
Date: Wed, 22 Oct 2025 11:28:19 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lukasz Laguna <lukasz.laguna@intel.com>
Subject: Re: [PATCH 11/12] drm/xe/pf: Add TLB invalidation support for MERT
Message-ID: <aPkiQ5qSAQmgjU7L@lstrano-desk.jf.intel.com>
References: <20251021-cri-v1-0-bf11e61d9f49@intel.com>
 <20251021-cri-v1-11-bf11e61d9f49@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251021-cri-v1-11-bf11e61d9f49@intel.com>
X-ClientProxiedBy: MW4PR03CA0284.namprd03.prod.outlook.com
 (2603:10b6:303:b5::19) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB5096:EE_
X-MS-Office365-Filtering-Correlation-Id: 9572a805-a4b0-48c2-e19e-08de1198c898
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DS7YFpcXlSdpSF58qSqqslMingQw+7Te5NJGi8HxCUYUf77Jlyu8CHzKcKVU?=
 =?us-ascii?Q?3CQkUBJXDT+K0lT32Y+CACFJuzvd7O7x9RdHW/N231HD9PCa73KMstxaRWUH?=
 =?us-ascii?Q?qm0+Jtb5CAOMBwoBFb3/1/2bUOtR5LKgKRD3jAPGkslGWce5qjgb2cOJHtAH?=
 =?us-ascii?Q?gXB3GSvUoFb/snw3mq0ldH752qj1KvNesaatADVHQh9n21BsSM+7QActTTyV?=
 =?us-ascii?Q?jwdcRJtR1/angvE7dUl3ydgp2k/e+WbWGEilnW7sCQ8uosS59D5yot8PtNOc?=
 =?us-ascii?Q?O5GYV3/g3U/04mtwyMMaOlOSkuXaCgpm8R76b3loxnYHmjO0oCP9JGjuW+zM?=
 =?us-ascii?Q?+L4pVlLyn22Yx4KhXj6Lv1lIOGtW+pxpXuhRSGGN3tWawOLiEAQQdekkfP2J?=
 =?us-ascii?Q?isEqy9P4tHSuCRMaLTEqO2Z2TWUqwoGwpX/M7ZYIazfZ93njY/sOi1cfEd5H?=
 =?us-ascii?Q?GOrrTeYsqMt/Bhgvz2ezfUqoBax+7qKf42wcQAc3RWJGfYqda4J6v6Y/3g4z?=
 =?us-ascii?Q?eFf5h1bd9AQOwRQxws6ZznxpxyATcgIHV0walo2l64YBAAnRlBgcK17a5kmt?=
 =?us-ascii?Q?I5+uPSSWYsu35U5Bk7zPVjPCnDgKj31TUDFZPJJCHYiLKI7nczuJ3At2voc8?=
 =?us-ascii?Q?49HXigy7jeOFjZHPGdIUdmgRNDZCRYmNz3PTX33vfLpoUd3oqWlHWP5co4sj?=
 =?us-ascii?Q?v0+JVCpu0Scm4/3cUxGaFfRjE50G+VFtB+vB4T1u827eZBHqOlvyiXapc2fz?=
 =?us-ascii?Q?vXxP1CnUHqMCUEUcDzMvc74+z+vMc5m4RbNE70m21j86lbfK4p9Qfa/AGkve?=
 =?us-ascii?Q?nxwAeQk4EEFD8ErTwidZtjbvWsFOhBPcGHIuMsE7m7NboLaQXPjzXwaD0npb?=
 =?us-ascii?Q?PhE0Qg6la6LXAgaUEr1IQy6INcUKyPrQx2Nm8Upf+93jZMW5Rt/dl9X3g6lk?=
 =?us-ascii?Q?E8PfvmtPOZM84xZIz5EhG/amq1hB4TGMR1oSuCfKq/+aqgpI/osQKLH82Lnx?=
 =?us-ascii?Q?BbTB4kFdlOaKGFgPNAPlqDOIQrHPoNWnT0NKAU4+W5xx0UJCoNVDXVu3gMxp?=
 =?us-ascii?Q?/9IZpKhbnvdf34iFRp8qUcXBO1Z8TZO83Y68y+AEGRL4gSl9fpjH9YKxQ33G?=
 =?us-ascii?Q?HuE2i1R8fpFfc1BPxBNnrXGcK5zTYCh3+i4NdGXBFkLspoIkrK0rJoUJn7gb?=
 =?us-ascii?Q?ciNagoOPc+o6u6ooUH/mKfxGD6pYxs+KlL1BxjevlR0gK2LhSiLsrzVPoJtp?=
 =?us-ascii?Q?s76w/uYLXXPGQ+xiIF/S3jHsdn8+af+6TziegTg5i+uTy630NIWZT9rHto9C?=
 =?us-ascii?Q?hgvwkzcHMfnVVJdw0zCFlvioyyMVKTN8JU2cRhmEjHo7goyYq0ymWvg6WRFU?=
 =?us-ascii?Q?4xbaUhxNSsALSuQVTPUL2Qygf5JwQ5GlNlEJ1HmppIUpl6LpS3Dmn03gqLGI?=
 =?us-ascii?Q?FFjRDtYTQgN8PuZNjUy8bMA+0mkNZ67T?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WCGgD3KJkdQS0/MCACfta2tTzVUCVPn2jom2rH0YJ6gEmx3bPmVOzxKrf4r+?=
 =?us-ascii?Q?uLj2ESWH9kCm1hgMtS5V9jtRRrPUTl+PsjxUl0Yi+pNo2llqnLNn02g+3LCg?=
 =?us-ascii?Q?z9xV27C1vs0C82F9u26LOjDl3RAVbWgH80TZr/QCN/aufmTEWR4GmJlggDGp?=
 =?us-ascii?Q?yXzkEKOB70efm05n6JXBQrdGHnRcL+9AFyA9SBVVe4yjGDfNFAT8pzcHsye6?=
 =?us-ascii?Q?iTrO0HTmSSqKwtMfoUnfCq07XqY78UxWV7fyHTnvSUC+sRwmR7JweLYCByoo?=
 =?us-ascii?Q?Drhcu9l5Yt919D3l88cZfHqihUvA+Sy5TDLNsqRfbvVpdjeSQnHFf5svQJJW?=
 =?us-ascii?Q?4RK+OZvC+w/oqGmkaxxeT1P5BAoPqFZjGDdHIlC+iNNUO1N6dEXE5cBq/aTl?=
 =?us-ascii?Q?rKLR+X6sIURQAVeISxNnNsuRmPwqwDtOzlNHIc7/LGr1GuR3zW6T+vv9QpaO?=
 =?us-ascii?Q?Oi8/T1z5HlYpFRYx7iyDesSZklwvd6DqneA+m7ENY7/KaQDcPPx8scj+a0v0?=
 =?us-ascii?Q?3bRUuwCrqRyQ9X+g1XqXlk/cQZgCnaUipQTsoPGNNPVXrW0q43B6lyqJmu+Z?=
 =?us-ascii?Q?cyzsiXCtLJTF53pSyY0YinONENpJM78sOOmq45wRPTyg5XDPKivnGB8dQWJW?=
 =?us-ascii?Q?xsQktKnzh+xPQ1Ho0SrmHLm/zqGPodK1/rncG5W16wo8FONoyYycctlXJIxz?=
 =?us-ascii?Q?7k2Yh0orAUux+Up9QaHA8ZwMvzGn/0OJfIbnPWxat9SaKXsaRWHyKyteDUJ+?=
 =?us-ascii?Q?4xbLMZYMvkQVQQzeLzVCvRiLxuc8WBk120zfr0KFw8qzAVGRyeSmgVUYOrLq?=
 =?us-ascii?Q?PAD9Cta4OJrCLLW9HOo1wSScBZUDDuJCme8dERg89+/DmAre/kW8faQWSU0N?=
 =?us-ascii?Q?SPNZpRGmqkWoH9rPFRG4EkDaGj78iMhy/9GLOpwzCf9IQ5tco2h1UvIleGDi?=
 =?us-ascii?Q?agisVqm+TlXB6L+WJbldg/9DjVLgQcvQz3kekRCeIMTkkxiAMWaQ8o8rBECk?=
 =?us-ascii?Q?AYq456BnZa+BQXqB2ahBL+oB8TxSdSE1CNvk9yKMVJdiZU6a3IJOdXB23FJB?=
 =?us-ascii?Q?Y4r3juGi73YCdwblgDubXyB/7rOMy9nBZjuPC0YTsGFh29xvpBJBSo8nx+gg?=
 =?us-ascii?Q?yM2Nu29TpNX+NGBXtFw8WYVYTX400FUdZu0gON/2bwBTRN4xRUgWdQSa1ckp?=
 =?us-ascii?Q?o92HmAxkkVgvsZRhc4Zw2aGSrMiP2ffO7b2OAvnorZ5Dh8zlmY9MP90k59pN?=
 =?us-ascii?Q?ZUzhG7pSkW9zhUA20SKCNaakbWjBAChT//DWIpfY4XYCzq0ws2ZD/0W0Zh4F?=
 =?us-ascii?Q?Q0YsYupCInc0V/ZlQy2UJOoedpwB0EPClfLSbECznxZJ0M6eEyBnyBPc2m+M?=
 =?us-ascii?Q?4XSJ6xp5l94YiUxzKLkQqEnpk5gN2HY6sNVT5HU+07EjIJ0Xhf2q29lcf8Ni?=
 =?us-ascii?Q?tdVW/ahxRNlz6iDBPYzYDKZ3mMxhAe5eVkSymJH+Gfu/v+cKzScq5bJL+4VN?=
 =?us-ascii?Q?qtWkN9473sM6xTU8y+yJVeSt91aKWKm+zOFya7hmGjhAAX7mr2zuBpnpLtE4?=
 =?us-ascii?Q?Q6/RCE1BAudhAtnhUhYKvUj8KqmZVh/U3dt7Pnd0lJHCsOQpyjfMZIQDKjjH?=
 =?us-ascii?Q?hg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9572a805-a4b0-48c2-e19e-08de1198c898
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 18:28:23.3014 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zkwb39MGBHhd89UKK65/QPLKYMKEEOIvqHkqNCtXygaEo3X74kPZQjfTICjLeyLdSykQp0k3O6zWQ+hHcwc4Dg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5096
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

On Tue, Oct 21, 2025 at 10:17:43PM -0700, Lucas De Marchi wrote:
> From: Lukasz Laguna <lukasz.laguna@intel.com>
> 
> Trigger MERT's TLB invalidation after LMTT updates ensuring memory
> translations remain coherent.
> 
> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_mert_regs.h     |  3 +++
>  drivers/gpu/drm/xe/xe_device_types.h       |  6 ++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 19 +++++++++++++++++++
>  drivers/gpu/drm/xe/xe_irq.c                |  8 ++++++++
>  drivers/gpu/drm/xe/xe_sriov_pf.c           |  3 +++
>  5 files changed, 39 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_mert_regs.h b/drivers/gpu/drm/xe/regs/xe_mert_regs.h
> index 5b7c15e08747e..aef66c04901d2 100644
> --- a/drivers/gpu/drm/xe/regs/xe_mert_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_mert_regs.h
> @@ -10,4 +10,7 @@
>  
>  #define MERT_LMEM_CFG				XE_REG(0x1448b0)
>  
> +#define MERT_TLB_INV_DESC_A			XE_REG(0x14cf7c)
> +#define   MERT_TLB_INV_DESC_A_VALID		REG_BIT(0)
> +
>  #endif /* _XE_MERT_REGS_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index fb401809fae5a..6fcd35bee73b5 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -219,6 +219,12 @@ struct xe_tile {
>  
>  	/** @debugfs: debugfs directory associated with this tile */
>  	struct dentry *debugfs;
> +
> +	/** @mert: MERT-related data */
> +	struct {
> +		/** @mert.tlb_inv_done: completion of TLB invalidation */
> +		struct completion tlb_inv_done;
> +	} mert;
>  };
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> index c0c0215c07036..ebe81cb21f5ab 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -10,6 +10,7 @@
>  #include "abi/guc_klvs_abi.h"
>  
>  #include "regs/xe_guc_regs.h"
> +#include "regs/xe_mert_regs.h"
>  
>  #include "xe_bo.h"
>  #include "xe_device.h"
> @@ -31,6 +32,7 @@
>  #include "xe_lmtt.h"
>  #include "xe_map.h"
>  #include "xe_migrate.h"
> +#include "xe_mmio.h"
>  #include "xe_sriov.h"
>  #include "xe_ttm_vram_mgr.h"
>  #include "xe_vram_types.h"
> @@ -1346,6 +1348,20 @@ static int pf_distribute_config_lmem(struct xe_gt *gt, unsigned int vfid, u64 si
>  	return 0;
>  }
>  
> +static void invalidate_mert_lmtt(struct xe_device *xe)
> +{
> +	const long timeout = HZ / 4;
> +	struct xe_tile *tile = xe_device_get_root_tile(xe);
> +
> +	xe_assert(xe, xe_device_has_mert(xe));
> +

It is not obvious how upper layers which call this function get
exclusive access to what appears to be a per device resource.

Is xe_sriov_pf_master_mutex held here? If so, I'd add a lockdep assert
so this is self documenting on how exclusion is achieved and to prevent
misuse. If not, you probably need a lock here.

Matt

> +	reinit_completion(&tile->mert.tlb_inv_done);
> +	xe_mmio_write32(&tile->mmio, MERT_TLB_INV_DESC_A, MERT_TLB_INV_DESC_A_VALID);
> +
> +	if (!wait_for_completion_timeout(&tile->mert.tlb_inv_done, timeout))
> +		drm_err(&xe->drm, "MERT TLB invalidation timeout\n");
> +}
> +
>  static void pf_force_lmtt_invalidate(struct xe_device *xe)
>  {
>  	struct xe_lmtt *lmtt;
> @@ -1359,6 +1375,9 @@ static void pf_force_lmtt_invalidate(struct xe_device *xe)
>  		lmtt = &tile->sriov.pf.lmtt;
>  		xe_lmtt_invalidate_hw(lmtt);
>  	}
> +
> +	if (xe_device_has_mert(xe))
> +		invalidate_mert_lmtt(xe);
>  }
>  
>  static void pf_reset_vf_lmtt(struct xe_device *xe, unsigned int vfid)
> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> index 011b5eb66102f..82bf0d3995dfe 100644
> --- a/drivers/gpu/drm/xe/xe_irq.c
> +++ b/drivers/gpu/drm/xe/xe_irq.c
> @@ -12,6 +12,7 @@
>  #include "display/xe_display.h"
>  #include "regs/xe_guc_regs.h"
>  #include "regs/xe_irq_regs.h"
> +#include "regs/xe_mert_regs.h"
>  #include "xe_device.h"
>  #include "xe_drv.h"
>  #include "xe_gsc_proxy.h"
> @@ -468,8 +469,15 @@ static void dg1_intr_enable(struct xe_device *xe, bool stall)
>  
>  static void mert_irq_handler(struct xe_device *xe, u32 master_ctl)
>  {
> +	struct xe_tile *tile = xe_device_get_root_tile(xe);
> +	u32 reg_val;
> +
>  	if (!(master_ctl & SOC_H2DMEMINT_IRQ))
>  		return;
> +
> +	reg_val = xe_mmio_read32(&tile->mmio, MERT_TLB_INV_DESC_A);
> +	if (!(reg_val & MERT_TLB_INV_DESC_A_VALID))
> +		complete(&tile->mert.tlb_inv_done);
>  }
>  
>  /*
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf.c b/drivers/gpu/drm/xe/xe_sriov_pf.c
> index bc1ab9ee31d92..b40701d75dacb 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf.c
> @@ -88,6 +88,7 @@ bool xe_sriov_pf_readiness(struct xe_device *xe)
>   */
>  int xe_sriov_pf_init_early(struct xe_device *xe)
>  {
> +	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
>  	int err;
>  
>  	xe_assert(xe, IS_SRIOV_PF(xe));
> @@ -103,6 +104,8 @@ int xe_sriov_pf_init_early(struct xe_device *xe)
>  
>  	xe_sriov_pf_service_init(xe);
>  
> +	init_completion(&root_tile->mert.tlb_inv_done);
> +
>  	return 0;
>  }
>  
> 
> -- 
> 2.51.0
> 
