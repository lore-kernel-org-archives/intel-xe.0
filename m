Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8876C61D97
	for <intel-xe@archiver.kernel.org>; Wed, 22 Nov 2023 18:30:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66F3C10E0DB;
	Wed, 22 Nov 2023 18:30:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B54A10E0DB
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Nov 2023 18:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700677848; x=1732213848;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=uYxEgRga3kXNPYC6gQ9gI39jtvf2ZKVM1Dx0hSdiAMs=;
 b=boejB1dqxafEdygPGT6qxx3eqnbvg7jPJYpgwesgU6qhvl8ln1efPbyn
 bVYdIB4spNYwBodtBdw4C7PhIRKz5RiTWfnAyrkb9ec0jz3aQoajBfr7l
 7CsfhfZQSzPoRcTpBSt4ZaRxQGH/22L8zikFNnduiCu1TmFgt2qCTCR47
 ArP1iPZ2E/XfrTzxVuA0QQmODyDnzHf0g012zb0qbVkgxLy32spBWn1ue
 y2eIqnsfbPWAJ4hJYwI2+Uto6+gv5/gFzzitNL0pY2GPWOQQI+DEvo4no
 rpm7xYTU+yyxi2kHCarsQNylMVAGkLpQTwuHrXdVIemdDXvp8WUPcWEE4 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="458619625"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; d="scan'208";a="458619625"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2023 10:30:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="1014380132"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; d="scan'208";a="1014380132"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Nov 2023 10:30:41 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 22 Nov 2023 10:30:41 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 22 Nov 2023 10:30:41 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 22 Nov 2023 10:30:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fEBntpvDvdp/uAOCCfN6mbzy/0Vq08YLQOrSsTffIRRU531HIQEWF7iU/Q0AW4VmWK9yrxaSIf15S9fLSKTnBBWJJzPVrQJbVOqHKoDOiu2m0PAQCu/J1zoehOospYvXRas9aBBFqbAarmkR2hhwELhgj0sfojjdzIhKraAjQF4CVGitL0dXcEHdy9RVV7YIFETMY/36yvjaUKhqvXV+JAvH1/iaAhJ9YingJCEX0RKoeCL2EtjPkk9qcB9TNyeJtBsg7tTr45Q2/FQcF+fQQ3xGSEcVWOLkJkRIcEEUwB1MqDv9iJXBcxBNOyXt9ysJula9fedh52QK4eewgu7Riw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QFpH/FWTFievqMAYYAavV6gbN3EN6vsQKvdPNOXbRZI=;
 b=M2AN6J5ZLeVK6+Q32F9OBjtZ6St+c6xycGuNruB78mcxuB8EAADTriA9GYBabsle7cQcvCju8DDrO/kXTZOIyPPs1bKUvlgBsxlBc/j/uK89z/slU0L1E1jWcXcgCrYF0bvYRbmjvZUAVCJDKjv6JfyVApPcuHSGl89maNWlLefv1b57F4EuHSLdbUquTG7mTNIWR7WiV3ZGYMh7qSWRclWdqLOMZFtxKMEyKEBFgbJIU1UB1dxpoT6rgL21AaXXt6PYMBCd5hWUD1gFEHgW/+aY2AluVkOmGY50mmlrK+aZAbP3eu2coNclVX0JaoC3b/U0pYb7WxHU4+i4rmz3+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SN7PR11MB6900.namprd11.prod.outlook.com (2603:10b6:806:2a8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.26; Wed, 22 Nov
 2023 18:30:38 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0%7]) with mapi id 15.20.7025.017; Wed, 22 Nov 2023
 18:30:37 +0000
Date: Wed, 22 Nov 2023 10:30:35 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20231122183035.GM1327160@mdroper-desk1.amr.corp.intel.com>
References: <20231121195209.802235-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231121195209.802235-1-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR03CA0132.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::17) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SN7PR11MB6900:EE_
X-MS-Office365-Filtering-Correlation-Id: 03505310-3c1a-4c5e-fa99-08dbeb891f7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Rqj2+Gm5++46urTw2ylrRC0uHVch1KU2CWpwqlaAwe+XHBlqv7ObgFivbrvBE8DUXuCCdLQRb2Gkx+te+WrcmDS7h3b96D/it0XgGwpLw6SJfvB/PBMbUpF0QS02LVvEEsRMPglKOwpEqCCFrOIqVoxEl9WEfSKXuDGIkiQ/C774lSEoUT4exBDN6bHsGoCxUrCjbMPtLQJ6e9CTIasKVobh5AXX/sd4JaDdaP3MbxY8w3/D1fJ5Dt3wOWgHXW7otAsTOOoa85lKHg+iemoKzI3X6jrzTnPBbQsH9EkA/B744uNvvb97zgXPWLVTD6fXfi9MWXRkieraGjAcE+F5Zy/nGbyqBGoZA5J0Ou7MF12nHj71VN9LlGGcTtT91JX/Abzrc1yLtCokT5iJkow9l0JhnemiCtWR6cXoT9N2hNPr67pB8Tg7svVj2wby7kz5E2M8peBZucr0L19Pn7alUX4uNIKG10aAx2QlA94vDf5X/o/Y96TWH7cq2URLjj0PW+TaaP0JfXgY63CPz23x94CAwdhVMFwyzOHHFFs4tc0jwaARamY31mrVhjLrCv+u
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(376002)(396003)(346002)(366004)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(66476007)(66556008)(6636002)(316002)(2906002)(5660300002)(38100700002)(478600001)(8936002)(66946007)(4326008)(6862004)(8676002)(6506007)(26005)(1076003)(41300700001)(6486002)(83380400001)(82960400001)(6512007)(33656002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XiZxE8kMXPwGg8e8KqmFlCu7Dxtyj0oKyZsesWY/u6VEMuTalWRLGtbd8N1w?=
 =?us-ascii?Q?qo5clfEGSFTi4SFOJNE5DA9jx9S7eABvKtx4595HScErI6c5oSaW24ozpMnp?=
 =?us-ascii?Q?d7HbcqQ66gGve80yNvxEdHIlE996WG/5YKW6Whha1nb2/X6X1WQPrRFhqCq4?=
 =?us-ascii?Q?71cpEMSMCOTt3F+hu3j1vOG06NGNgh+HEoy5l2DKQ9VUS17Ox28w7elVznQs?=
 =?us-ascii?Q?s2C1sDixKDi+ans2L88+dlsy1F09vJezzC8TW5s/eCvsmg13MXN1Y+QdRIkx?=
 =?us-ascii?Q?JCg8KB9fyPmmC8xvJbxJNw9mIeKZ8BPvtC4w7KYBBAJ+XbSBcKaUWIkx1el6?=
 =?us-ascii?Q?XOBzdLgBlqjAwLpPRXY8+ZC/5ywEY87glD4ywVkqkCJjWT+UQmermUO2iH7f?=
 =?us-ascii?Q?DOpzaG0n7td5Gnw4HCoOqhTano75ujojZxvLviReJXlc6fLUlQT/XNH4yYs2?=
 =?us-ascii?Q?upNllGj5xrKFihWnZGocm4WI/UAg77ABj4RPHTfE0hcTq61jjewpc1z6KlN9?=
 =?us-ascii?Q?U6Q42SjvBr+tzpRX9uJglLIEU5EAsSe5VFsLFX0lp0KyJNOSIk/KKx6ELJZG?=
 =?us-ascii?Q?M/rsjfhF9/vh12dY2O+5Xa/ThgaB/JjZCyl0cixSSAIASIPlia79P6zk6vXc?=
 =?us-ascii?Q?qC8eGdEzC85RfvPaSAgDCSnpLazxlvSy7aMqYVw4q9fM6t7M4E0Am6NnfLei?=
 =?us-ascii?Q?ofE9QOZ62uqCoJP12UclfN5TQXQlzPk3DOVjwOWBNy2wvNnAOGeCxGXZd4EY?=
 =?us-ascii?Q?Lz2AjYQEiNfoszzfrpaSnOkXjA10QVQxvmi/24fDdFGI0IQIlEfgVLJy6xqI?=
 =?us-ascii?Q?gIDyLh3LUZs294iXapPxyqwecVWM3eawOflDd6LDVOr/W5Pi8RhvobqY1iDY?=
 =?us-ascii?Q?ll5byRLUu80AMrqDmgzeoaDp/fI92sEtp7zzwmUzpxpNNPcQO/EZBgc7B7pz?=
 =?us-ascii?Q?mBN0p0T/zgOHd+Dibtziu5cC2fdia7h3maKRi/wM1tTVcga3blxoFjxlTJni?=
 =?us-ascii?Q?dlh7uYCmvX4oSEjONNdIPiCSRso/S5aUBDacQOvHfnOyF2dv5QVy9qLD3cU0?=
 =?us-ascii?Q?dYd7Phjzt7AkijuClMYhdNk4S6NKnFwf01/m/VOLeBVyPN9A85tFCLQpe06z?=
 =?us-ascii?Q?iNe8lSDQLFq/JqUv5+S2HXImnKU/+dv4ciDcSHweE2GIH/twLdSAtP3rgPhR?=
 =?us-ascii?Q?7OHwoQyNBMz6yP03npiACiVf+nKE4pdqWmBiJK+h22xea0wGuuvJ4vg0U7hv?=
 =?us-ascii?Q?sEBVcJ8JNLsYuzqAyFIlFSt+3cQGNXsIlJbuze+qjPOxZB2x0L75V+8kutto?=
 =?us-ascii?Q?s22Wmaqz/D3SAiOsvrAzlTS0VSSXpsMXHVEAU/uzT+ahwThqB8M2maOif0vT?=
 =?us-ascii?Q?v3pVHz/w7OI5jiRW56z+gdW7Udd6gi+uvXgIa/740y2lIeLJNbNNh/rGW0th?=
 =?us-ascii?Q?uxt7uHGrTPtYoE25fRhp8FJOGS1Ud1MaDG0PrXMUNKT9dWRnLxaVIHWoHtuo?=
 =?us-ascii?Q?bJWoqSvqfSlEdGzVDBNg6TwXPdo+HuiA43KnvKX2GbdBetWbBPo0pZ9zRzRr?=
 =?us-ascii?Q?4CL1giIVukHlR/moow9y3CiKO294fHQqENrBGNaaqDrN+yGZ6xGlL/MCwA+a?=
 =?us-ascii?Q?hg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 03505310-3c1a-4c5e-fa99-08dbeb891f7e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2023 18:30:37.9068 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mC+XEOn8vudheNwBClAv8fUDKH5//B/aBxHFIIhKluYx8OTmlHF5P1a79753ttfynZZYTw6XdcHs1g5i0HaCzopnC2hAyNUV5cUdpuNmhAk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6900
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe: Remove XE_PVC_XT_IDS
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Nov 21, 2023 at 11:52:08AM -0800, Lucas De Marchi wrote:
> No need for the indirection, just use XE_PVC_IDS.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  include/drm/xe_pciids.h | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/include/drm/xe_pciids.h b/include/drm/xe_pciids.h
> index 91b4b570bfbf..c7d73d6476c8 100644
> --- a/include/drm/xe_pciids.h
> +++ b/include/drm/xe_pciids.h
> @@ -174,7 +174,7 @@
>  	XE_ATS_M75_IDS(MACRO__, ## __VA_ARGS__)
>  
>  /* PVC */
> -#define XE_PVC_XT_IDS(MACRO__, ...)		\
> +#define XE_PVC_IDS(MACRO__, ...)		\
>  	MACRO__(0x0B69, ## __VA_ARGS__),	\
>  	MACRO__(0x0B6E, ## __VA_ARGS__),	\
>  	MACRO__(0x0BD5, ## __VA_ARGS__),	\
> @@ -188,9 +188,6 @@
>  	MACRO__(0x0BE1, ## __VA_ARGS__),	\
>  	MACRO__(0x0BE5, ## __VA_ARGS__)
>  
> -#define XE_PVC_IDS(MACRO__, ...)		\
> -	XE_PVC_XT_IDS(MACRO__, ## __VA_ARGS__)
> -
>  /* MTL */
>  #define XE_MTL_M_IDS(MACRO__, ...)		\
>  	MACRO__(0x7D40, ## __VA_ARGS__),	\
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
