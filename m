Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60315D262AD
	for <intel-xe@archiver.kernel.org>; Wed, 21 Jan 2026 00:07:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F18110E0CA;
	Wed, 21 Jan 2026 00:07:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gvMIYLsv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4276F10E0CA
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Jan 2026 00:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768954033; x=1800490033;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=QFau4+77en+hwAmrR37r+S1Tvh/h+9qkZ7eDSZ7DyXg=;
 b=gvMIYLsvQi4eo8lJ81laVm/okguIxOgfoFfmx7Ck4wTWaAlgC9luT7Gb
 aEqPfOmrULqOD4rm6hcDJCKCteqtQX6WUz/eBHwhyhdyW9GjDI+ygQCLH
 HBGa0hoHmo1fixfbLtZKtLi90h3BnRRDpax0bHuJxG+ANPcpr2TupgPeZ
 smlH/Zg3FZSAdsWRoTYPqjVtR/XcGDjtaZbLPUaDhz2DLN6lDYv3U5V99
 T+Pb80XfR/IFlNigqZeiJrK/+mEuWYhwLGhggh29TrbTfasYGgBupW0jy
 2WGvutm0gT6nSHHlpRo6q6BWKhQiTAyVIw4AEcfdoluPMhbR1rNJk9T8s Q==;
X-CSE-ConnectionGUID: tmgUiwuCTdOsp2yipcljXQ==
X-CSE-MsgGUID: Irlxu1rhQSqRp56afKs6lw==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="70230092"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="70230092"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 16:07:12 -0800
X-CSE-ConnectionGUID: ccJ1j/yoRNGktqkXvLjMMw==
X-CSE-MsgGUID: Ul7xMqYEQRG1hGDRxndKRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="210766934"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 16:07:13 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 16:07:11 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 20 Jan 2026 16:07:11 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.14) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 16:07:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wVP3vh6ktdiIQJdk0AdGqOz3glnupqkANHPiMtnwDJqg/tPufjyiR+P42xSuFMnENMxccbNB7K8UH1UPu8BuuBfH2GqoEa8loNWNOkEL38pnCVrjvlP53+I/pyC/zjqbajGaCMo6nYqnuSFwR7WtkZdznA6umhGe+yCWNGQzNYZERkUifyOAnoiESoKlmDmlBHG++Wf39dDw/ctLyM7hOwD5oQr+CJCaEEpfv896YTN/sRwFD1SW24M4JcZOkcHyT4dfzj5kRHCXpZMdHssYzm9IGOIdd/UmrQiuMsyXEQIipHyl7U31JIdan+fcMVaWXbpm5lsgj9aUcwsZER7eIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q6d4xdrOsIbLsPhbQfRj8T2Je6cCG4YwA0JXR3Y/IXk=;
 b=smBDxoLUBCdOoZp3qkY/Z3InIAcee4R+fe+3fLVxfAijVuldgFwJ5oys5vfDIriULSLXwstFe9FNnOP05OssfpWnUKAEq+8cUeh4Jg+mw4lCuJYM8aegoe/7bp6IzmRbRqg4Si+YmiDpM6ULrWXWMaALDLRwDHa5t6A+TmwbmQ4JPdL38M5mI2awMk0yZUvyCdAn6D7f4WAdi4bU4Y8rpKM/bEdeNmqKOCvtEfDyWmk/XyeCpMTBEv+tgOPQ7zi+E6QS2b9sm4EEiljeTh0OjCl7oB5229yF4dBHMCaQKAUiKsZQKmjC3gYcvfs8Nr3YiVxipbSESo3F4THvwJeFyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by IA4PR11MB9106.namprd11.prod.outlook.com (2603:10b6:208:55f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Wed, 21 Jan
 2026 00:07:01 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.20.9520.011; Wed, 21 Jan 2026
 00:07:01 +0000
Date: Tue, 20 Jan 2026 16:06:59 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 02/12] drm/xe: Define and use MCR version of
 COMMON_SLICE_CHICKEN1
Message-ID: <20260121000659.GN458797@mdroper-desk1.amr.corp.intel.com>
References: <20260116-rtp-mcr-check-v1-0-d420b9c1a327@intel.com>
 <20260116-rtp-mcr-check-v1-2-d420b9c1a327@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260116-rtp-mcr-check-v1-2-d420b9c1a327@intel.com>
X-ClientProxiedBy: SJ2PR07CA0024.namprd07.prod.outlook.com
 (2603:10b6:a03:505::14) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|IA4PR11MB9106:EE_
X-MS-Office365-Filtering-Correlation-Id: e5b0a6e7-49f7-41db-73e9-08de58810063
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?IrbJ5F7dsDIYEfoTXJ0BuAlESZuaJt5eg3RrhXrVb07+kO6QtDTKsTmE+zPu?=
 =?us-ascii?Q?VwjNc5RVqtioDh9ULEd2mpVea4AtltR5U4dweYlC7GVwpYxprtq1otV9g4PE?=
 =?us-ascii?Q?QtxhyWtbT4GBeBIZVgrQ1C6qHzY6ntweGpC/JcMbnBaLChgW7pVP/z9KgVjc?=
 =?us-ascii?Q?A7uejrmHApydgcfPyHYwNIgdDcMRBeKfIFyjgzUnHoyS6kpE30sns/clCC4/?=
 =?us-ascii?Q?1io06LYjYWaFO2fglykrYOdb4vVug62yFr+icCOL0sUI5LdrTtj5GeUHZmxM?=
 =?us-ascii?Q?VFGOxeNCihMc6YdIR2myoO4DnDBheZEynH79pRkFqX0Gnq/jSejgXypiZOFz?=
 =?us-ascii?Q?/ojLMLyOzvUHxqmQz3behqz9xJET24mnY+KKYCxu2Jz1DAqee3rsHLG5Z6p2?=
 =?us-ascii?Q?jAOjmS1SZgRVOLi8ohilWEaZo9XukUQm6+/ks588H138poAuLuHROkJBq6yl?=
 =?us-ascii?Q?9rjnnu2m0Z84gc/tAmeqECt6pK2+U4s1EhLDMWUbZlJ2bGreEmiiH41/B1Eb?=
 =?us-ascii?Q?YtfHO3+OwpLMd7/g/LVavFic206izTPNorLeMoIsTPBkV42PeZ7XeDtbXgik?=
 =?us-ascii?Q?rM5SNi9QwBk4h+hz3Qn0BPirHNNjVxr1LToyS9xTr1JZgAqsfGcompr661jl?=
 =?us-ascii?Q?nWilq677rjZkO6dh7I00HiizQyDF84VMG+6TIG1nyi4FIW4iR7leNkoRoVBN?=
 =?us-ascii?Q?MtArQOhMMdJ2q5t6j8W2IUgNpOzJX4Kbc5JJ6oF/ufjpMxOXeln6b3s/pCX/?=
 =?us-ascii?Q?QLnpev0tjKOToYGz4W7CrRkaUFlLo/23vGSgXlw9teS389LH8vDDbxuH6ig8?=
 =?us-ascii?Q?oq3cPaB5gHHtrzNXWWKX0M0oQ16bQUgbwlyXBSlSL/OG9K7fwjcSpBsfGFr7?=
 =?us-ascii?Q?zP1tZZu2tXgMMhITNMh6VkmBSALVzNQUxY5Tr+dVbQlvulDbz+QhTJ+IL1Z3?=
 =?us-ascii?Q?b1CktM2E8apkqUV2XoWOlwDLxgFBfocNXIL7ikkODdzarEw0egsdkSeN//JA?=
 =?us-ascii?Q?rk077My/0LCudCDwucRUMH1okImshnObhuzpunAxJngv20ei6qLQAf6DkcGs?=
 =?us-ascii?Q?gZ8jT1X29A4yV1pvGSLxjjoeH6AIaU874lUrxD6a4oYHspY3WOVwMUXYfXpN?=
 =?us-ascii?Q?rEVO5Vtj6fiZWAqllIaTvtu/myc8n0gGY95eDKJuevO3GBaY6547rFLJ8IN1?=
 =?us-ascii?Q?EVDCPNw9OLgclZQESw/Nn64td2OIci7RUtVxQLpNgEzuRL0nm3slf+5wvyzc?=
 =?us-ascii?Q?0bixHnR7dF3xMgL124iM75/jDxzO6lZRxxz7+4wVyvH3POY67QtmKAGbj++j?=
 =?us-ascii?Q?F0vGPFBf+efbT0f5N+nDKwffAByWhH0vzf0In+S9mjP2s/enybb+hLIh1EDa?=
 =?us-ascii?Q?eJt0XmCUqGj/2Ls4RqnhFU8h4etLlAeNQS6lcNHa6IRV2Kp3wzWGfUNr7X3d?=
 =?us-ascii?Q?+O00xPJnKKtQnGc2pibUgT5CfihZMX0T1vszAt/6lU1FP0OhSAc01bYLi13y?=
 =?us-ascii?Q?vfVunYaHgP+W6dC14PTly5r5toyI/75TQhf/vCVFOhLqq1vDfEK8QEw6aBci?=
 =?us-ascii?Q?NPILWL0BJw/zMQyHzaA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GvtoMKa5lh035PKem2K7QMjkitbzGliWWASH2caqLVE/jOBGiiPKaYqjhmP/?=
 =?us-ascii?Q?NLf1tapgBuy63iMF8f2rZS74WJlr6oITqOkSjrMHFTB433EtXrwxRhZAzCKV?=
 =?us-ascii?Q?079WBNylDaR1B4xOTfj2WKox8f3XgGLE/3sm3jLmv/hr2T49GaAllOebIr0G?=
 =?us-ascii?Q?ISFkLxnm1Zjqvb6VNGs7hhYWWXCbDpFhjCMgLBG+8nRy4m66Qkdr/aUDVrAq?=
 =?us-ascii?Q?5t8RF/qKBerQe7hh9gqemOnB4m7uiruhFMOO4mNjmrx1Si1348Xpl/KXGVRX?=
 =?us-ascii?Q?ivweOxlinYhUo0D6JMxyuBwi3DqtmCEiYsWWHS4hnqEuL86lDK8he9+GJj7y?=
 =?us-ascii?Q?gWflEIfln5Ir5jHNe/MqnkN4NVApq7QVaKo+TXGjJy4rZ1ffVN48wwBabd1n?=
 =?us-ascii?Q?R9/oKwundv+Lwl1LaxyStiO79B9rMPti29RSUUXfgF/GVntVSha6lvM4cFKu?=
 =?us-ascii?Q?uIY/6040XrZ6f2DOeSueghemcea9xbklmIqmdvjm3iV17CRQhE1Bij7FClzV?=
 =?us-ascii?Q?xfi6aatP6F7QoVYRKEjnJjvpFPEBBhCOEGTUNSbFJxsHBwYmn7sV9YHChm3p?=
 =?us-ascii?Q?bgQPn8UT9w2Foco8+P0PuFwXIlYTUYb1rjys7IJvPORTBJS+nNCjw/SyLRPk?=
 =?us-ascii?Q?aOqqxGMCOSSioMP1UfvikDCoxygldKPRU5V9HP4YUnr1WsZruJkB1J2P+SsP?=
 =?us-ascii?Q?CwyGo4Elk8FehUFJXdr+QmOUaFxOMuFjiuHne3Jd5SHE5MgciyukwtYgB1DH?=
 =?us-ascii?Q?nE+w7GMCUn9skcwE6SxUED2PPnIeBVSdTmX8sVRuDkMtKGtmLZNroZ1GY4rY?=
 =?us-ascii?Q?GIP/4sHW75Lm0Lhbs9kiDZNLpt+uFKd5xDkkX9929VQavGW6uEJ2w75MOYoO?=
 =?us-ascii?Q?wa9cw5imW4u5jOJsRRuz7+n3q6R3q8cz+oQbshKdmuNmNC1RuIHXN9x8xvHM?=
 =?us-ascii?Q?8QWdlNQErrtuDXJ5APlTu7fUVKUbs+88Meu3noUutr8lQfwL6ctUamp6Y0pp?=
 =?us-ascii?Q?RRhtFr3UXTBxZfCE+oKMQStTC3qctq3XJggKY+LTEgKUeNXIEUznKBq1Bf0A?=
 =?us-ascii?Q?4tEOKXiCpcXKEAKXd/aUMYYSXjZf+7xK/PCxwRE430LuUuwkqM3UjA/LEvqM?=
 =?us-ascii?Q?O+xYGcbCsbeLyFPZIEK93VjuCJKO4sdLeecwTTH7idxJppldZq18xEv95ees?=
 =?us-ascii?Q?o9ZCCWCl0/jNx5Mq9eLYBYEE6OMnIyt4/Drzqn83FeVSu+yhmZI2VHxbEl6X?=
 =?us-ascii?Q?nsHNa7+IPzl7GTzKBP4ZKK0sLRsyNibPdD632DBeB6nP/aHJnU6XMqfTElB4?=
 =?us-ascii?Q?UnBHWWlvUz3ymbBhwnWipoa0NolsKy6PiXqA/4bvIlkHF50AVdrjrMhDEauK?=
 =?us-ascii?Q?lzU5CPygj4ayTqBz4nkRatBIFlZ6M5E01yJHENNFrwnd7WnxXkWORC/KwT3k?=
 =?us-ascii?Q?ZN46Fo9yikk8ZBi8mYATSLeAAzKVU16fxL/0F7iy2FH7k/ZZRjTridIqtX5C?=
 =?us-ascii?Q?yU8V6n/EZBeUzvQ7a//IYm6xgeaFc/lPW9JXFCm5QtHc72NmYBTHHikHLSe+?=
 =?us-ascii?Q?jq6crDVxC3QSw43yq+XlDR7SDi8rghWID6UiFn36C+4Uc/Zxey9DHASKxWuV?=
 =?us-ascii?Q?IiCR7WHRoPDy5+dN+zaY+FgOZT+H9QW2pG4O7QgAloIZymQ2q9EkHEGKhrq5?=
 =?us-ascii?Q?QdZkk9fsrDedrjkIG4LLl9eMHz1QDeoDwRh/WkrsL7k8M3pkY59y/7gur7fi?=
 =?us-ascii?Q?H+RcFsDrRgm7KmVAQI95P+ukOccOTnA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e5b0a6e7-49f7-41db-73e9-08de58810063
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 00:07:01.5730 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5IrdoGWYwA8SekKbtevcoyEhQsWC4yCmwurPY5f/7TujwvEfpl9BNWf5JY89aHk1kMSLstlV4MQCO2JE1hVVLeQbKJ0jcdvaon8Kp7NM158=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9106
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

On Fri, Jan 16, 2026 at 07:12:10PM -0300, Gustavo Sousa wrote:
> The register COMMON_SLICE_CHICKEN1 is a MCR register on Xe2.
> Let's make sure to define a MCR version of it and use it for the
> relevant IP versions.
> 
> Use XEHP_ as prefix for the register name, since it is MCR as of Xe_HP.
> 
> Fixes: a5d221924e13 ("drm/xe/xe2_hpg: Add set of workarounds")
> Fixes: 9f18b55b6d3f ("drm/xe/xe2: Add workaround 18033852989")
> Bspec: 66534, 71185
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 1 +
>  drivers/gpu/drm/xe/xe_wa.c           | 4 ++--
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index bc984dde2773..d4a1bb1edc9c 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -145,6 +145,7 @@
>  #define   MSAA_OPTIMIZATION_REDUC_DISABLE	REG_BIT(11)
>  
>  #define COMMON_SLICE_CHICKEN1			XE_REG(0x7010, XE_REG_OPTION_MASKED)
> +#define XEHP_COMMON_SLICE_CHICKEN1		XE_REG_MCR(0x7010, XE_REG_OPTION_MASKED)
>  #define   DISABLE_BOTTOM_CLIP_RECTANGLE_TEST	REG_BIT(14)
>  
>  #define HIZ_CHICKEN					XE_REG(0x7018, XE_REG_OPTION_MASKED)
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index a991ee2b8781..a91db59a3d0a 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -794,7 +794,7 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
>  	},
>  	{ XE_RTP_NAME("18033852989"),
>  	  XE_RTP_RULES(GRAPHICS_VERSION(2004), ENGINE_CLASS(RENDER)),
> -	  XE_RTP_ACTIONS(SET(COMMON_SLICE_CHICKEN1, DISABLE_BOTTOM_CLIP_RECTANGLE_TEST))
> +	  XE_RTP_ACTIONS(SET(XEHP_COMMON_SLICE_CHICKEN1, DISABLE_BOTTOM_CLIP_RECTANGLE_TEST))
>  	},
>  	{ XE_RTP_NAME("14021567978"),
>  	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, XE_RTP_END_VERSION_UNDEFINED),
> @@ -852,7 +852,7 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
>  	},
>  	{ XE_RTP_NAME("18033852989"),
>  	  XE_RTP_RULES(GRAPHICS_VERSION(2001), ENGINE_CLASS(RENDER)),
> -	  XE_RTP_ACTIONS(SET(COMMON_SLICE_CHICKEN1, DISABLE_BOTTOM_CLIP_RECTANGLE_TEST))
> +	  XE_RTP_ACTIONS(SET(XEHP_COMMON_SLICE_CHICKEN1, DISABLE_BOTTOM_CLIP_RECTANGLE_TEST))
>  	},
>  
>  	/* Xe3_LPG */
> 
> -- 
> 2.52.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
