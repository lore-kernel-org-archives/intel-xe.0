Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE5E6D2CE0D
	for <intel-xe@archiver.kernel.org>; Tue, 22 Oct 2024 17:53:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D27E10E6F7;
	Tue, 22 Oct 2024 17:53:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BrvKYFyM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3E7710E6F7
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Oct 2024 17:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729619628; x=1761155628;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ZoBkKQbkVcyM66aE7nVM/wHJZC7y3pb3X94ij6bBxjE=;
 b=BrvKYFyMIFTsJW5SgjYZ38ZTeR4aQ7/MI/WCOEKqCDLIoLwiv1uPDnmF
 nnufHaPLEE+1GMl/1lLxHW7YxcEW5SvECxk2aWRCCetgIVvySKQle/dob
 N+2up0JPg69tuC1DKMW60Jv/J/IbWZKDBxzLZvhM756N2FO6gc1S5z/SW
 lUqxlIfkvXaXRkPTiipYSI/NGTvBLiBnBO3HuFuK57/kaCzvo8lBxv153
 tcAMFw4fWIu/pVTNSsntp5b4s0aIXI7xGUJnJB9pm/INUSJs1MdGW6vUN
 XmCBtrKjjk1nIsBS5R4r8sMkKUsbwwpFxglz1kyxmI/KQnJtTOvwX6x73 Q==;
X-CSE-ConnectionGUID: ww8JYD6ySaeTyoG/e0efcw==
X-CSE-MsgGUID: wm6GzGoDSJGYrGRTeafEBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11233"; a="40567236"
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; d="scan'208";a="40567236"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2024 10:53:47 -0700
X-CSE-ConnectionGUID: ZcBV4ZW0T2SgpWSG7/qQrg==
X-CSE-MsgGUID: 4FcwNzfpTv2Yq5cR1CypWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="84764081"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Oct 2024 10:53:48 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 22 Oct 2024 10:53:47 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 22 Oct 2024 10:53:46 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 22 Oct 2024 10:53:46 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 22 Oct 2024 10:53:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jw2BJ9FMBTRwvF+dHXrXWkU6uLtJ0oFWhDIJoSHBkG/P6pUBUvKYoIg+RP7LJCUWSgG8uy3N+U65TmHriUmGvv4NYtTd2IW8FfjIyEkumFhHzeW6A2Sbh8iMMYFzk5P4PJRs+3Fjn4eNeJMY4cFBzt+EkyQqoGmqCgDeysTdEuZ/iavtUV3UeqjGjQywPdxTL8qVR3rr9WVdJggSHrkXOMGZUT/ebxQYzvmOdZFS36utprPBkxafbqi8c3hRrxP57J6nQb5W8fCEcr7ODnsN8Ln9YO1ao/OH7jVujGIPHmHUsmqwlkOXCabI7OVOLGKfqdSYbZIftFM18tm/1WJHlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YU+7D9AfkfWPrWQ+flw/xjA1LucuwxTKrMebr79a3Ac=;
 b=ueqKN0PCIjiNHsOtygudlpwl0qjt4NuywV+YaW81zIjtRr/nQR/T9m9mHcaO/jYmsQ5nZh50bGEKDND76hPA8/9Mg643rLd9zK0p8AZmtb5xpppM8eLsaklPIsgIaa8EGpkfMrNdX1jrnwKAeFlMamlpNWil9WOMGDozasFYRIeb/rrYCUWzJ52C9JLZFwXB/d4jyn49PndpV9jGfKZIiuhj+U9Xp3yyu1fN6HAgNEa1Qd/Q7k9FUgz8Qj/i0Kja+xc3ElK5v/vAs+fdGMMzU8wMhPgha6DhqYlIdk7L254UIAzJr2KRH4uFQn4hQ2pItXoIYx/jKdsXggx1YZnizQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW4PR11MB6960.namprd11.prod.outlook.com (2603:10b6:303:226::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.17; Tue, 22 Oct
 2024 17:53:44 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8069.027; Tue, 22 Oct 2024
 17:53:44 +0000
Date: Tue, 22 Oct 2024 17:52:36 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Jonathan Cavitt
 <jonathan.cavitt@intel.com>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>, Matthew Auld <matthew.auld@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: Re: [PATCH v2] drm/xe: Don't restart parallel queues multiple times
 on GT reset
Message-ID: <ZxfmZFL7JsFPm70x@DUT025-TGLU.fm.intel.com>
References: <20241022103555.731557-1-nirmoy.das@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241022103555.731557-1-nirmoy.das@intel.com>
X-ClientProxiedBy: SJ0PR05CA0108.namprd05.prod.outlook.com
 (2603:10b6:a03:334::23) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW4PR11MB6960:EE_
X-MS-Office365-Filtering-Correlation-Id: 45f4649f-4676-4737-6afc-08dcf2c27866
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?c2hBPFcFdKXlR8ibh7pjXtxeCbR/Hl/PQ/Lnq1EA+S6Oi4aOpQuttgc6050W?=
 =?us-ascii?Q?8cBdog55S3a9ynEj6ir8rBbD1VVtRyfxourUFPxqUYeUAh1RXxX1N9yXCOAc?=
 =?us-ascii?Q?XEm8aOO1pKvFs+kuSBMMCgU1kZfzq355WB2Uqw+ZSCI91NXxFHbh1zMjJRap?=
 =?us-ascii?Q?tl9ZAfNY0pGoJmMDWC54pTVVbDZclsdx3yRlQPU1iNQHQQpHcbCmMYcZrcPd?=
 =?us-ascii?Q?aFSg9t4nQXT0Qz4op4RRRdpEG2Hd6/5knYrKqZYLUIge1SeoOonSli4vB4o7?=
 =?us-ascii?Q?A5HGg8ZplB6wyNSvU8z2YaF1FbUkS0nJHX34b6nkTC0UpkYVPH2s20R33w+Z?=
 =?us-ascii?Q?0hBsH5CpbHfZ++3+l+pNW9KDM9SCM4QiBz7kCDfn5yCcSGKVL1rXkC5z5hhw?=
 =?us-ascii?Q?KtAb/YFh8uGjGnCARGyAvV7v8pUmvPDBGCJW8ZtESydFEEfX3/ZiaLyCNsU5?=
 =?us-ascii?Q?r1ogG07+jgRof/q4hm5qsmBEuD0ew9gneQp8nAU0/UEj6Fqrw/VpMN6uC/ZC?=
 =?us-ascii?Q?34713TpOsUu1qbBy40iXjawQCllatmz9cqSax/PHXWqxlHGBOn8fRTUJ0SbO?=
 =?us-ascii?Q?Kx0cXY/EvHl11PMk50z8P56/dUR216rHNqXpExHcg+9lv0CzUC1L5+/BYIsc?=
 =?us-ascii?Q?lZ7NH8tAH/DIG81O+A35qrtZipDyE0wfdZ127l7pDNMYXT6QimMbJVt16/Or?=
 =?us-ascii?Q?N/8yCyDcrEEuWZ+zif0J6lxbPzH55WduNrGV5K8SqNg9lgL73I+VPnQHVzl0?=
 =?us-ascii?Q?gonvsbFGhM0BOQ04XrjFKYIPA9mnORtQsI7yrDUDI5uI7F3zMN4wHIvAQbKU?=
 =?us-ascii?Q?L4QBL/WHIs8ZQK0/25M1n7N2O/r/exWtSS/2ZSNBW169k5i8Ml5cEZUxmxJy?=
 =?us-ascii?Q?9Q2vo9b34m5NOuzPA47oFP2wZlyRYnTj20cLN+gjKMC+gQzvQMWLVn4PuJbm?=
 =?us-ascii?Q?jKomh/Paq9n1cDgVChYVZBWZyxlv0lrGxb8sPK1diozxQ0Qk3DijlSwnjDoH?=
 =?us-ascii?Q?NnNRX6iOcKDYXAMSm8xpY1u7ddz531pt/nHQuHZNwz2bFttDJu+mfL/wYVHM?=
 =?us-ascii?Q?al5YzNkXZhKmgVW2lvJEdOrMHCb4iGdpOVtcZm2CyOLlrWWkCB+mK9au9YsV?=
 =?us-ascii?Q?8YYRZI4ptolvxqvlVeu6AkBYP5zem3kulUX7MW+piN8l4GugmKHA0Aaiixei?=
 =?us-ascii?Q?j7anBjXOjQTgCZswLyz6wKa2UiUHhkFLNw86xH9ExQZWThUTYtJCfR3jufMi?=
 =?us-ascii?Q?KHGyJwTFzXUVc5NbLvVf?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?U3aHUrBpslWlztlKAE+AnspIbKqwl87gGHNBi2AQug+mIUsP96gt8VX1exjm?=
 =?us-ascii?Q?F05WRMOiGP2V9JqssgzR5LTjIOm78S0zQYMuW4xOHDlWfVNXkNUormvLO5v3?=
 =?us-ascii?Q?FX+EtoU50qyhxMQmHVJZYlYOnr6dm7RPusZOROPtTsKaKRfZsjwAR7K2JQC4?=
 =?us-ascii?Q?gz78tbfZ97fbaz8kRo1bXmO2kQTAA8EQXPBfHITRZIoJlP5p0DHXYimP2Gdp?=
 =?us-ascii?Q?jGtfpopITn0osjCMZIqMUyod//rpPgXzmSrKLV6WDpyWT/sbB89rK1hzXtNZ?=
 =?us-ascii?Q?IaJClGpAf093WD1cxe2lo+WEemwE3lBhHLKiPmEPO/DmGtFJeMNL/4BbFEJT?=
 =?us-ascii?Q?ANftwJ5zcNvMkubakpak0Rf5vI9uqVuqKclWpkWzN1l/BA2XOt1WYKWFTsZ3?=
 =?us-ascii?Q?+fvt8LYUmBVJKwOUsm5Wab3Vzk7O9ypEd5vvpRXDvjDrTPck3RkoIfwi1ab0?=
 =?us-ascii?Q?zHg6BvIK/iXlf8QMs8PRLh04Uk5DPh4+K8QuMq83V+7PIymZacaAfZJ9mo71?=
 =?us-ascii?Q?7+dWv+/4gWfY6oPUkrAq3AfyUvtf4exFNLrsaOsVu9NojTgNNo1m4ZuZ0jaP?=
 =?us-ascii?Q?ae2K5Ldju7V3Dw/8cUt8Om4rVWivbnMNHIkQ0yLLrDFcQBc/6pGzMfmQDIzg?=
 =?us-ascii?Q?pXt8qXnoSOk+p6j09Z6SB2DiLtLkCmnyvwgnISeeg/KV0JuP/ppQR4OWLtaD?=
 =?us-ascii?Q?kquZJGKFZUMfKTF+8iUr7eHUx/08I9FUKoaGcOwTJVvl69EUPXXLFXCoHBeo?=
 =?us-ascii?Q?yYQqTThE11RYzDbNjKWFMbLqsRCuysqDoqbaD4COahg/uaI+swkQfeenJb23?=
 =?us-ascii?Q?z/1FjPX38cFvUf4/e9osECWEvKbrSF4yz/Gt/3e6FeKzybQ6q0bS6IDigh+y?=
 =?us-ascii?Q?UGpgyYe/9OvVcuNHluSVTH0I+sYT1/xJqIuZ3jIkrj5H4SkCg1PAnIQCCr6/?=
 =?us-ascii?Q?yAqR1APdt+6yowvynE4y3sA8XH4/XanJPH+jM1YI1pwpD0rUHPr7cX7gmaAV?=
 =?us-ascii?Q?bCFFiEr3XTx2Dk+gyXMglHEAL4ZPzjIyVNsLz33ZYo/hxlq+fLSH5L/iMj6S?=
 =?us-ascii?Q?U4dvSZqbKjgOo7zlb/sDcNCuEmAbVdpWBtXKKFUPd41S7g0xX0xqwZMXa18i?=
 =?us-ascii?Q?dtRoceNfID8lU6ZJNdHu3HimD16OYEJnwdJaHW4tGfSR6rPkdlEHu7MP1yNx?=
 =?us-ascii?Q?7wjph9FAPHpWbYSBNvK/gpVMrpWp9DuTNRmIv/EuxB1K5RrUQmKj0ZQ5K+iA?=
 =?us-ascii?Q?dXE2BqwxA4Y1UUk75pcyM4XQNG8mip5p67xu0/RLGsCnGWwvwCbKzl49mFkK?=
 =?us-ascii?Q?/BRNbWwg4WGgzACkGDjn/5fi/+90ZiYIK2AJKN+F9LtaobdCCJm44jTVSUrW?=
 =?us-ascii?Q?mAj+WYqBdtiwOyIMyuykxr90ZFl0SIbPU+iQCHcwSBVKamZdsv9HnTT1vvNE?=
 =?us-ascii?Q?uINorSMu3k5L5BYLXvr0dgW16QoZPGODId/EvG2sXW3DFWr9tPhnjYzggbsp?=
 =?us-ascii?Q?XDuqTB7kiNc+YQpJ95AV1D/O8HSuCo6zaVJbYi5Qy8nMDCktJWO8zslluVf3?=
 =?us-ascii?Q?prx3O+2JN1z7aZg7230yrozDfllD4ng4QLvsF7bFxsQhiTHOrFyDPVL/uhcH?=
 =?us-ascii?Q?jw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 45f4649f-4676-4737-6afc-08dcf2c27866
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2024 17:53:43.8896 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k6pi5XiLPQiyUkCxO8uwD8Fdmo+rGvwUnlJzNY/AvjHVz+GeP0vTEMB0T4/5Y0CjDPoHmeii8XgaaZMci/nh7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6960
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

On Tue, Oct 22, 2024 at 12:35:55PM +0200, Nirmoy Das wrote:
> In case of parallel submissions multiple GuC id will point to the
> same exec queue and on GT reset such exec queues will get restarted
> multiple times which is not desirable.
> 
> v2: don't use exec_queue_enabled() which could race,
>     do the same for xe_guc_submit_stop (Matt B)
> 
> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2295
> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 0b81972ff651..0a7c4cb9272d 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1745,8 +1745,13 @@ void xe_guc_submit_stop(struct xe_guc *guc)
>  
>  	mutex_lock(&guc->submission_state.lock);
>  
> -	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q)
> +	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q) {
> +		/* Prevent redundant attempts to stop parallel queues */
> +		if (q->guc->id != index)
> +			continue;
> +
>  		guc_exec_queue_stop(guc, q);
> +	}
>  
>  	mutex_unlock(&guc->submission_state.lock);
>  
> @@ -1784,8 +1789,13 @@ int xe_guc_submit_start(struct xe_guc *guc)
>  
>  	mutex_lock(&guc->submission_state.lock);
>  	atomic_dec(&guc->submission_state.stopped);
> -	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q)
> +	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q) {
> +		/* Prevent redundant attempts to start parallel queues */
> +		if (q->guc->id != index)
> +			continue;
> +
>  		guc_exec_queue_start(q);
> +	}
>  	mutex_unlock(&guc->submission_state.lock);
>  
>  	wake_up_all(&guc->ct.wq);
> -- 
> 2.46.0
> 
