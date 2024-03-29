Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1455BCD11DD
	for <intel-xe@archiver.kernel.org>; Fri, 29 Mar 2024 16:14:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62E1310E254;
	Fri, 29 Mar 2024 16:14:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g0VMAUKj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F12A10E1D7
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Mar 2024 16:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711728863; x=1743264863;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=SaCj42t/NYtRrNhpt58zxiMixVF69uQY8lnMDTynUFI=;
 b=g0VMAUKjQT/OAWh9EwUYJg1wZ715u5KMUGEcQgZ/fxD+kk4rzrzicfrS
 xpwAmg3kjZcMrdZ0AjZr6Rvjneg+Y03qvb668wUeuZospUZuxAQPij2GK
 d36cX6h3kCXhxO0tUKw9urPj9tVBQdVhQseHMKoDzhFYRCdmyfgAkg2sc
 8G2pjLfRPJMCT5tzcp2ZpTM8LZtCla3Z8cixTB1AxA8SWLJMN276AHCLN
 80zLbqQpPXh5P7mpkEx26zKkF+T7iif2jBEruviTTBdBG40cMsVaumMsC
 nO0x6bF33UzAVFrc5gayY+ojHhBXr80Q7ERku1qjFMCr/wPTRbR5130hj Q==;
X-CSE-ConnectionGUID: KnD4rY3qRgyIUqdJb+nJ2Q==
X-CSE-MsgGUID: 2nxqkUKMSnmNYeP/VguInQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11028"; a="7047496"
X-IronPort-AV: E=Sophos;i="6.07,165,1708416000"; 
   d="scan'208";a="7047496"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2024 09:14:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,165,1708416000"; d="scan'208";a="17104399"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Mar 2024 09:14:17 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 29 Mar 2024 09:14:17 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 29 Mar 2024 09:14:17 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 29 Mar 2024 09:14:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AoBr9SWqubPZ96iMCsGjXefx3MMrxlrzHg9BebkHS/tNLXvA5ODHAxn/085nY3gRUXfWUaTqZNTR0oEuuFKml8LxLvfpuK28hOaKPbfbz43s2ZrGQOJygCQWoI5N1/mWop+hHohOeIp5K6sVQAXDaqWsYYL+FuJrMHNk6gOzrDKeZjo+K4J5RIIuMN8fpG/qRDh97TUZqBFKuXtSd1AtTj4196u/CeKBByN34rAWIGadaJQt1FItbWiizqvf9cagFLi1hSKWlRddSzc74X/tmiD6P4X1oSMtKxgHLtnZOLsVWKIH0vu8I+NTfjvV1lMvxg8HrcLbQz4DZ2m75xV4Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=atsYRpE99jwcxEWJQKNM3yqGGvCSgr61FXzBu0rwoQc=;
 b=XdBsO37qtNgnNs7L/buw4iDXHBeQGeeaErZilZPg/mFNOHfSyb17nN1GSZSLjJH2uA/9US2K6dep2ZFL+VJIPljItTOaDMLZ4b0p9afoyLuKjM6NWmDU9rnR3cr67BnhAwCQN5G89O1szjT69CVHGyOiN4+ELbNszQyO4vq7USFIBjtPD6/97mx1IUFddmEgE7C6XeRGBwiB+DKrpnc8xa0kZYe+sKIJODWI1+caYfWn/4S3GUySM/deJp3uLdKFFvlYoDyFmI5GuGlOoSd1pnF8AMvo68qmU3XELYXr5cJxmFEZhtZOTT1pKfAscATXPtyQI2XigH5AaSxTSjWo7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB7145.namprd11.prod.outlook.com (2603:10b6:510:1ec::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.33; Fri, 29 Mar
 2024 16:14:15 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7409.031; Fri, 29 Mar 2024
 16:14:15 +0000
Date: Fri, 29 Mar 2024 11:14:12 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 0/7] Update GuC ABI definitions
Message-ID: <xxpank76lzfhakpmqa5srfqzq3fnpxlklttseyczfrajemvjzz@iqxhplnfmpcc>
References: <20240328183147.495-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240328183147.495-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BYAPR05CA0100.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::41) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB7145:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: As6t817tTKB7UDneQFCIKXE1dKZibdV7J9b9EDPDxCWeQ3M8u9b3LMj7w1IUfxKuLh5qDNFP40Eu5mlsQB3zLxRWoVGouN3++P7RN5+1FxSGgT8JwxYn1paHfqDPTkZzjfyYkmtYoeXGZNGEvcrNVIzzxp86OJmeSUGMEalsIExqnpRk47h1Es8grUGawxDJnK0XIn5ioSgImk8HgPF9wRqqDGugfu1LsGXsexuiKp09Je7Iiti4skWV0kboLpcYTrmHezhi7/WXmf5+m5pV7OXbdb50T7QSlQqaDZqzFwIB/YlM4LuHcGsUDiYZBRRNyw4ABexpIBPH6mXXF/3DCAGVl0jxSqdL5IDHQEvraGrqTi4Ro0YR0M6fKMdTqJssUhDoR+bOQwp2AsbR7d85vUujihSXWfVJR6UZ0B+GcTLtoXJY2Cc3rBZYJNWBi92uXnoN4mHK8KxEwM/BgqIrfMYkrtXjsA5MKVJCWr5ppIJGT2STpepwtz8d4QXZBqujyNjaSufO7nzzF8b0hrqmGgj53yZeu1KctANibETMvRWz9i471gr2tC1YgXqxvTpDC4gEC2YOdpeaNnRhzxklnlvmPqUjywhsipUX8ArQWuxU+8bCqbjyoqZnnTFMzRVjx6SFwHC/Kayvp8TxE/FW0A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?I+Xrt+wpX2dLBA2f1391kF8kCtIBl3Y7Ys8DDZxpcbFnj7VjJY9joNpjHJ6R?=
 =?us-ascii?Q?AlB4jqjZfUQ+6fPy1nkYD+Mbc3U5ckNNb9kvQXK8uzxFxmXJU2tvi0fkqlpW?=
 =?us-ascii?Q?rtUJbCUKZNjf18AgLxhYlCl8lVKS59EnpOJuzzTLDHk8g6NlHECz1xyz1BoJ?=
 =?us-ascii?Q?tyuyONUN4Evst7Sqn+DiitBQ47x2ZjSlUz7Er8PAWqAZr5zouhbKAgZTCSxO?=
 =?us-ascii?Q?+jOyZyeWfWo/9SPw/n4FxpSdMBFHKscAwzkW32ihzyLF+yMqIYYe4y+fwhRC?=
 =?us-ascii?Q?G8a/OvvcB9qIgN0xJenkD0VB4VU6LZhDuj2qcsxQWyctki6N9OaPHjZWVJpo?=
 =?us-ascii?Q?M72ZSt3M0cq1lN1r4tJzLLENK0uJnoekUEWq+7VPHnTVAFQfIyygBu7+MzjQ?=
 =?us-ascii?Q?E66KmQh2ldpia2Y4PCbrEkDy0PanCsWQTve3KUHIUQ9DMgIXFjrergAhHNFw?=
 =?us-ascii?Q?QhIHouI4BL2nPodn03yLTg6RkfR3gk2ARfXgnXO3xffd0M0hTvZx1SMX1KFD?=
 =?us-ascii?Q?9OYCDDvI7CTrRlYkFkuA+jprDenkCGtqn4lCWVOzZnP/pQa1VtJmdjikRNPU?=
 =?us-ascii?Q?vHti9mkWmd64DVw4mAhh+XLq7EaayzxFOvMpyXSf08XthhF8Dvx4SAd3ao34?=
 =?us-ascii?Q?+euNmLmfGrpN1TDpNczC6EyjKgrJC5mtkEzhTw2qNoABlrLARUoKtQYjUXFQ?=
 =?us-ascii?Q?8gOPQtmEVjbszzFDiVvkGyW+FC1qOUla+sjAmTudow4vZEiG36RKOG4PLP+U?=
 =?us-ascii?Q?SnSvLY5XyvcUcooIKPHAQTM3KRYt6S1IxTIqPgHlSv0Hp7nzdZ6rdOI2Nzrd?=
 =?us-ascii?Q?z4uR9TtGUPDj/i9h9K0mAVibtGMxyo8mFJWGn64+0GdvVHXcPs5VcMITV2kM?=
 =?us-ascii?Q?XRqxQxJJmGa8KxPsuDEbx4iCGMyLB1C5H0UvXOqpKkLbEqcf0cvl8MmYxRG0?=
 =?us-ascii?Q?/pwGJ5p4Yqb1ARLDHJevZHsbnsb7DUxHq/rGkrnyOQUmOd2pHYm5dBfkIoS/?=
 =?us-ascii?Q?ycX3DB3nRQq/aeR6EQe9kojnBsA7t0XvbwnrtLeTCFTMLpFd0gqjIyM8wmkJ?=
 =?us-ascii?Q?uwkEIg38WFvu5yXLvzKosbLGtJLGvVgm8UUxYuBcuZxEw9XpWjUzbtNJNTxY?=
 =?us-ascii?Q?drFxQEGIDm4UQLyABCLuvyZrzUllmDnrxobHsmFEf3q5QwfbJcFLLxnzRnM+?=
 =?us-ascii?Q?5R0TM20dgXOFUgsxJkZ6hQ5hcTOxnVCAVDq26da9b8w1Z7pDuQhI9NNytxJF?=
 =?us-ascii?Q?Zyk2CJTjiJqLg4SJi0N549Z9kRn0uB3a3Lx7aY2c4+QMt14fdk7PITXwoUJR?=
 =?us-ascii?Q?F21Ew2TEa1EYfFCtsJIJT7FrJya1WlIzW8is6y/ksbLuwpQzewlZ4WRqlevA?=
 =?us-ascii?Q?sSl20LhxUXTYG+kPzhVmGaHN+m9td0xrbRF+H2bUKnZG9Vqf4GaJbCLmMhAE?=
 =?us-ascii?Q?sPKA+0KQXvmLmqCdeo7381oYH1Srg1rh7+bF16zsKmzq+VfDECsQyh2ATp9K?=
 =?us-ascii?Q?Eh+KwdQ5f4V17YWmeimRqIJyRQJWBL0Mlo5TwSr/yoUsrczDFyWQ7jvl08Ll?=
 =?us-ascii?Q?YaOrT+erT4Pddozt+FAhNcmkmY4ZTFWnSEv38YYCMiIu/qDSm7Q80YMdptgF?=
 =?us-ascii?Q?mA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 45b3748a-b8c9-44bf-94b0-08dc500b472b
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2024 16:14:15.0034 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9dbRe0NpBJwnRAcdTAFUukdHdQXZD/6gfv39bGTfJAvOT7fla6WiXcPMDQWG6me3cSjKs4Z7r25hpuDh8OmZ5qIIYQhRanE7QWBYbVCeN8Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7145
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

On Thu, Mar 28, 2024 at 07:31:40PM +0100, Michal Wajdeczko wrote:
>In upcoming patches we will use additional messages in communication
>with the GuC firmware. Add necessary definitions to our ABI header.

but it would be better if these additions were done when they are
needed. We don't want to keep updating this with things that may not be
needed at all (plans always change, ABI may change to fix bugs, etc)

Lucas De Marchi

>
>Michal Wajdeczko (7):
>  drm/xe/guc: Add PF2GUC_UPDATE_VF_CFG to ABI
>  drm/xe/guc: Add PF2GUC_UPDATE_VGT_POLICY to ABI
>  drm/xe/guc: Add GUC2PF_ADVERSE_EVENT to ABI
>  drm/xe/guc: Add VF2GUC_MATCH_VERSION to ABI
>  drm/xe/guc: Add VF2GUC_VF_RESET to ABI
>  drm/xe/guc: Add VF2GUC_QUERY_SINGLE_KLV to ABI
>  drm/xe/guc: Add GLOBAL_CFG_GMD_ID KLV definition
>
> .../gpu/drm/xe/abi/guc_actions_sriov_abi.h    | 289 ++++++++++++++++++
> drivers/gpu/drm/xe/abi/guc_klvs_abi.h         |  13 +
> 2 files changed, 302 insertions(+)
>
>-- 
>2.43.0
>
