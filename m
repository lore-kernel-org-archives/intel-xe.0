Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D78FD68BCD
	for <intel-xe@archiver.kernel.org>; Fri, 15 Nov 2024 19:11:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1649610E108;
	Fri, 15 Nov 2024 19:11:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m8eWQ8Zf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7578910E108
 for <Intel-Xe@lists.freedesktop.org>; Fri, 15 Nov 2024 19:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731697876; x=1763233876;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=zQfI9qWl2pFe2kEoh+Xp1533XlB7SwvxCE1PvC26SBU=;
 b=m8eWQ8ZfGn4pK05vCDscP5oQF80GggyZ7fB24m98sRTiyaU2xq3+vhGQ
 /3e9bNMSPCzvUo0wra5AKLKKwdi23+8+VrawCqr9+rX7QjwEZ7JclWlTx
 HWD+H/PQXkphXOUEPtIggKjqjcAoIKRhbw7jeQtrEVNDnk2WNTozzd0Q+
 KwryhJ9BNgo1roOyMprmOU8ApeUEBuqWe5hWqbUiR9NEy6bfCym7Hiu3h
 LSvTHBExvpyU6afbnuw5c4ltxm0ner9XLJ9xaAeBfKJoXcHSkf3boxmpV
 Ki0GCD8LkhJHos6xyEO1yeK1+C910iwjGwPpAMYnYC7ccGSEhU+4Y2tMq g==;
X-CSE-ConnectionGUID: e30nm6kbQbGWtzc7Ei1wmw==
X-CSE-MsgGUID: QIiGN3deTw2BZJdQWIpDeg==
X-IronPort-AV: E=McAfee;i="6700,10204,11257"; a="35479997"
X-IronPort-AV: E=Sophos;i="6.12,157,1728975600"; d="scan'208";a="35479997"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2024 11:10:39 -0800
X-CSE-ConnectionGUID: lSP89vrXRdWdST12aO14WQ==
X-CSE-MsgGUID: 9UYNah1ARbeLq8l1yalXUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,157,1728975600"; d="scan'208";a="93727131"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Nov 2024 11:10:39 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 15 Nov 2024 11:10:38 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 15 Nov 2024 11:10:38 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.49) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 15 Nov 2024 11:10:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AQlp7mUYUoOKXmwO3ftKexiWM7AlokMWSGKIg6N4YZyhipJZ6OZ60uMlzzUFag2jmWMTlKihIo6BVqK+6dpiwpqLpTh5n9dMxhbl4KR9u/k3odH5KHv7TOdPH/QOt/FRc79zeHNgKlG2DcJ2odk9kRevZSHdaZHC9fzzHaMmv8hshHsWYai/3Gq7tcmr7J+kIT4tuKARk/rGvq96i+u5+5dKDsb3nAdjlw+pHG/6phNSCPo17YuPMiNOOWy+bcvj0YLkzc70JhFZWSrcwvW3nzfJZGQy80USnz8FzzGvBOTEcSUsRz4RyMr0Wm70oArUMV0BdidmPGP8cflCWnLZOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t7n4LkUjbTQdUPH90Ilah0YV13xJarEtfBjLTptw4z0=;
 b=G1G4zt624FfskiCA38gJ6UGeqJanSMtiaegom2pW/iKzZlgC2FomXSaF8u2e5aQi0lIxsLQxDu8xxPQk7Khis86HpxU+r2MjaasmQ2WPFk6Mh7BjeF6YNHfNO3ffIhitr3AphiEkP/T8Y5krd3UVbHE8YQlNGkJ2yJixL9rUy+6DJo6Pkj/kd5vtfHXtcGiMXIW3zYmStlw++KwHUuaPrLuHOflhCkB1vEx8JIr0ongP41PonemCYRaZhKXNPgEn1d1MS2ndu+Abb1/3nvQJVPO/H7bBNsLWh8t95cgvuc0STcDq17RV73n1v2D6f7/a+bFiu56rOgtBhZRQXAxFUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by CH0PR11MB8236.namprd11.prod.outlook.com (2603:10b6:610:184::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Fri, 15 Nov
 2024 19:10:35 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%3]) with mapi id 15.20.8158.017; Fri, 15 Nov 2024
 19:10:35 +0000
Date: Fri, 15 Nov 2024 11:11:09 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <John.C.Harrison@intel.com>
CC: <Intel-Xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/xe/guc: Add support for G2G communications
Message-ID: <ZzeczRm2B3ekqb4Y@lstrano-desk.jf.intel.com>
References: <20241108202216.2020164-1-John.C.Harrison@Intel.com>
 <20241108202216.2020164-3-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241108202216.2020164-3-John.C.Harrison@Intel.com>
X-ClientProxiedBy: MW4P223CA0029.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::34) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|CH0PR11MB8236:EE_
X-MS-Office365-Filtering-Correlation-Id: a9027458-1210-4d7e-4a90-08dd05a92f30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XIArQ0RW0GxNar7gHyzdKYVvtAuf23+vNy8UKcvs6JWE30jm2IM3Zn+i3CN6?=
 =?us-ascii?Q?8FS+ur2I74lK0JrPPBRxlljGKLNu1F1CuiVi4Z9jWZdhCheKuhpm2RUy4+J1?=
 =?us-ascii?Q?DOPi9SYYrKprGhg/bzGgKmW3wM/4pTRxPLmdJgx0/LLM1Kkrsz3CjF9ZDzpD?=
 =?us-ascii?Q?Yq3ZQ4rXVAUV6DwfmwyZhmu+0lJT5cA0tsP3sqcqnjl2Qcrc0nQh4Y12VSFA?=
 =?us-ascii?Q?qnoEbqUmmAwms/kCKrlGa/24ZRG9SjxtdDIs2usiEWrR/5cDVf5iJxoVFO+v?=
 =?us-ascii?Q?bgBvheJhACxWUdfJFXNkzks/NN6JMS9GHhGf9U8rpyXmsMlKfR5HuT8yxrM6?=
 =?us-ascii?Q?Q053pq9NPBp9nGXrirGp9RoCcRBPUUP1nOXAwWfnHBZGNr4/gdiQnKkvIOei?=
 =?us-ascii?Q?zThWOd/jSp6Ev5JWSeY8N6H/ek9AMTGZ4LK5EPTzX4MH3RCXuEg4XNTFFqVx?=
 =?us-ascii?Q?sTkuVevTrLWJD9xwA+QJttE5T61JqkuTe7UuTCahCA/QRsK5rbouHZKD3C+4?=
 =?us-ascii?Q?elEgJCnajA0etwVIY7/TwUtwdLXIeRGgVjZvLSPS5i4CHWdjm7adSpTe9rUl?=
 =?us-ascii?Q?HcPBYeZhvqssWK+u8tX+y1gYWxvCjwvclb8fDv0FTuJYRTkHgThpeEsLM8E3?=
 =?us-ascii?Q?PZ4CkxKSvLOztWUMq0eM658tm4bLa+NLslAmMKlUWHu3+YQxgTK5VuMULgrH?=
 =?us-ascii?Q?dJjdeXYirBPQVelrmrbNEKpPS65fcOsL/+qoJ+r9YqeblUthsMbwvLzcHSlw?=
 =?us-ascii?Q?EiQgQD/rgeRq/wTY01R1FVglxq8LVtIQ8QC6asuvnxIjLwSofcV9wQwm2MtD?=
 =?us-ascii?Q?3bK1ZC8NE9t0cPTqU8IMpetuHfiG4GivsP6RGogRzPaihxiI/9Uom/xemfOH?=
 =?us-ascii?Q?+tPH/X83X9ORobeoNGt6eAiq2/EljFT7JEWEEFaEmYS3RerJSpk21CwFG4ii?=
 =?us-ascii?Q?M7DW4ouzOy1k3ArIYCZbaHUQXunuzE6mgshobp2jQ5XeKwtpjWz3RS7I2EOL?=
 =?us-ascii?Q?kANXo5WnmoLqqaaO5BGfvl+Bif3ZDKYXH0o6FWuPJHsZG2n3X1fcFg7twLST?=
 =?us-ascii?Q?35+PD3y/CnQd/aEEhdRQDWdTh+1tvzAMIEWhHZzk57A62MvHrIZRZbcl6xPr?=
 =?us-ascii?Q?B/rtaGSTVAS2IX4LFgKRtg/6UhLABhy+UJUjx+ERcdCBfCe+vgGqQYKoRvct?=
 =?us-ascii?Q?BZfQwQwW2G0FNVFWR5YozN/GFSFf1z9FU/ECg0Ra6Wxc5c370io/S4T8aml+?=
 =?us-ascii?Q?GeJFZEA1agtAb6U5RT/nJ+G8xqMX5asyDM2cr0lpgh2q0SbgwsGtyToFWPVJ?=
 =?us-ascii?Q?NZBW0HBg6RHLoczUkdY3q6Ij?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UwrRgIyM3Mf6gk8K/GLEuko/q1KDGaHC/1rkM+LLs0rhpgKbineM4GWSMIej?=
 =?us-ascii?Q?4tQUlVce64Wplkrcg6JfrzCTu0rBnTe3lN27+eb0uTPxf/wFai7Si2+EVG4I?=
 =?us-ascii?Q?hL9dH1vp5zxyZ1Ath3RgXkz43F8ycD+ybfxV47cSTsvGxe+XA9sEC1flAKI1?=
 =?us-ascii?Q?Dlck2Vlr1qd1Zos7xFPNHexyRQYCUHQp4CnlUZu7atTFWH4NIoogEGOj8f7A?=
 =?us-ascii?Q?LMZ1nOnjjWp87ypZmwUTn+4gElIZ1xXeYb5DWZDBM86h+9jVPxis9nLc41oH?=
 =?us-ascii?Q?EDqmsqbrqZfU327Nu7IIa5m+2pWSazZkq9J3S/iZM/ESWWvaj+WRGKjaPA4q?=
 =?us-ascii?Q?bDFX6nDCQQS7f7Ub7y9A7RTy30CIL740Z5ZAhTAX7ETtxnDzVKnHQBTDIDYP?=
 =?us-ascii?Q?vuLIUjRQwHPAb3IHjwyBs9jiUJpN6fcTHm2tJAnZH/VtZE17uRoWT05aO2bc?=
 =?us-ascii?Q?mqulXJLRolWt5K+JdFFMh29aCyMAuzOzsInUtILwi5PAUB0olIRf1R0MY0WR?=
 =?us-ascii?Q?G+3jc4E/k8eKgQ6jeCfUJoLkLptale35xMl6FByvVUCsefLQp/ID7VoGPGvA?=
 =?us-ascii?Q?2CNwU10Bn+qB3o5bXDBed1pHUiRvyr6ZUk4Mb3UG0+S0jZ5pfj5C8yFesBHw?=
 =?us-ascii?Q?3Ij+aqrTl0uSkfodOhCDH5mahxOidgRwC0hOlcV9nGpLWeSAkr9QVXGZUNbJ?=
 =?us-ascii?Q?LMO+NsDI02mwWI2q4ygo2QTGy/e6rUBm6KRcDtQQ2Yw8XbbviLuFIYxUNi0K?=
 =?us-ascii?Q?c4J8eQsKfMz+UZSDihbJB/m25bsEKqdrlwg4GDRixpgirM+pCvaednB1voMF?=
 =?us-ascii?Q?0upXLN4k/oUVR3nQ2IJMjzMDmQNEAFCIBmcR82ni/+F1p1nhy5rcxC7jensZ?=
 =?us-ascii?Q?2h9xMRtRjtkqlg81QH/bVqHu91mvhwj+e1xf90WBp2b6xCmcoBjS4ZDKxdTO?=
 =?us-ascii?Q?vYgXAVFwCMl47xCWaOcmZRgXVxEduQackjX15C/Rhq7ADJIvbO+85ZZ4ytdA?=
 =?us-ascii?Q?lCNSHb+Fa3D/PAPRvutLdbhUDqLmXT6jZjYCP8Jpk8A3rsDAdrwGpYhCDlIO?=
 =?us-ascii?Q?J56fnLoRB45jVIngu4zRFYBWLAuxm8d0Ftiq+RSDgA/nRWU0NdLqpajdhVWQ?=
 =?us-ascii?Q?EDGA/Kh2ghjeHKlAloJ1TqRv6qopoMeTLMsYnufkAQ6+y7gMr9Q/M3T2r2tD?=
 =?us-ascii?Q?lsWoSzYRvoXw6WGfjVHLfzmmnF4lCIA+B08aglPgWupfoowRFMwtrdaBD0hX?=
 =?us-ascii?Q?jQA6aYHqgHJsQcSdRALDF5H9YmqZMtW61LYHopqb4AJGQzbZcUZNpHLzMoDx?=
 =?us-ascii?Q?BWoXqpcOH8nipTQA/OA1LQh1A8DzXxobEXLIoecXahZXx5YDbbQr9PSHqmkx?=
 =?us-ascii?Q?4NZ6Vhu0CPiuK7h+DB81/QpuJBInKHN6PRNLo2XkcQSDVlpCMGFx5HYEEpVY?=
 =?us-ascii?Q?/JZtwy8k0P+tmmuHxKw9NiW4qaah32gl+9h0mCjIX+h2I1V0IVriObJSsMTp?=
 =?us-ascii?Q?QoNWYVMs8My6TI4SoUa4vYiXUOn7hxgMhYsG+9X+b2sE2om386ZtpWDJJ99t?=
 =?us-ascii?Q?2Fse+jcPnQWQ2PbB7EUAcOPSs5WV6S62cVFKHNbYrS8N8cT1gSKFKKCFxhib?=
 =?us-ascii?Q?TA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a9027458-1210-4d7e-4a90-08dd05a92f30
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2024 19:10:35.6955 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UkPe9beRBsFmrmfQmYobU7N9nPsuT+7TAnxsYoJqPA4MZ21+oZbBMh4L+AMzoPU92LNWbI7MsKCbkpRdjDQpTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8236
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

On Fri, Nov 08, 2024 at 12:22:16PM -0800, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> Some features require inter-GuC communication channels on multi-tile
> devices. So allocate and enable such.
> 
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>  drivers/gpu/drm/xe/abi/guc_actions_abi.h |  20 ++
>  drivers/gpu/drm/xe/xe_guc.c              | 276 ++++++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_guc_types.h        |  10 +
>  3 files changed, 305 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> index b54fe40fc5a9..fee385532fb0 100644
> --- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> @@ -134,6 +134,8 @@ enum xe_guc_action {
>  	XE_GUC_ACTION_DEREGISTER_CONTEXT = 0x4503,
>  	XE_GUC_ACTION_REGISTER_COMMAND_TRANSPORT_BUFFER = 0x4505,
>  	XE_GUC_ACTION_DEREGISTER_COMMAND_TRANSPORT_BUFFER = 0x4506,
> +	XE_GUC_ACTION_REGISTER_G2G = 0x4507,
> +	XE_GUC_ACTION_DEREGISTER_G2G = 0x4508,
>  	XE_GUC_ACTION_DEREGISTER_CONTEXT_DONE = 0x4600,
>  	XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_LRC = 0x4601,
>  	XE_GUC_ACTION_CLIENT_SOFT_RESET = 0x5507,
> @@ -218,4 +220,22 @@ enum xe_guc_tlb_inval_mode {
>  	XE_GUC_TLB_INVAL_MODE_LITE = 0x1,
>  };
>  
> +/*
> + * GuC to GuC communication (de-)registration fields:
> + */
> +enum xe_guc_g2g_type {
> +	XE_G2G_TYPE_IN = 0x0,
> +	XE_G2G_TYPE_OUT,
> +	XE_G2G_TYPE_LIMIT,
> +};
> +
> +#define XE_G2G_REGISTER_DEVICE	REG_GENMASK(16, 16)
> +#define XE_G2G_REGISTER_TILE	REG_GENMASK(15, 12)
> +#define XE_G2G_REGISTER_TYPE	REG_GENMASK(11, 8)
> +#define XE_G2G_REGISTER_SIZE	REG_GENMASK(7, 0)
> +
> +#define XE_G2G_DEREGISTER_DEVICE	REG_GENMASK(16, 16)
> +#define XE_G2G_DEREGISTER_TILE	REG_GENMASK(15, 12)
> +#define XE_G2G_DEREGISTER_TYPE	REG_GENMASK(11, 8)
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 1cbad8a91798..899094423291 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -44,7 +44,15 @@ static u32 guc_bo_ggtt_addr(struct xe_guc *guc,
>  			    struct xe_bo *bo)
>  {
>  	struct xe_device *xe = guc_to_xe(guc);
> -	u32 addr = xe_bo_ggtt_addr(bo);
> +	u32 addr;
> +
> +	/*
> +	 * For most BOs, the address on the allocating tile is fine. However for
> +	 * some, e.g. G2G CTB, the address on a specific tile is required as it
> +	 * might be different for each tile. So, just always ask for the address
> +	 * on the target GuC.
> +	 */
> +	addr = __xe_bo_ggtt_addr(bo, gt_to_tile(guc_to_gt(guc))->id);
>  
>  	/* GuC addresses above GUC_GGTT_TOP don't map through the GTT */
>  	xe_assert(xe, addr >= xe_wopcm_size(guc_to_xe(guc)));
> @@ -244,6 +252,263 @@ static void guc_write_params(struct xe_guc *guc)
>  		xe_mmio_write32(&gt->mmio, SOFT_SCRATCH(1 + i), guc->params[i]);
>  }
>  
> +static int guc_action_register_g2g_buffer(struct xe_guc *guc, u32 type, u32 dst_tile, u32 dst_dev,
> +					  u32 desc_addr, u32 buff_addr, u32 size)
> +{
> +	struct xe_gt *gt = guc_to_gt(guc);
> +	struct xe_device *xe = gt_to_xe(gt);
> +	u32 action[] = {
> +		XE_GUC_ACTION_REGISTER_G2G,
> +		FIELD_PREP(XE_G2G_REGISTER_SIZE, size / SZ_4K - 1) |
> +		FIELD_PREP(XE_G2G_REGISTER_TYPE, type) |
> +		FIELD_PREP(XE_G2G_REGISTER_TILE, dst_tile) |
> +		FIELD_PREP(XE_G2G_REGISTER_DEVICE, dst_dev),
> +		desc_addr,
> +		buff_addr,
> +	};
> +
> +	xe_assert(xe, (type == XE_G2G_TYPE_IN) || (type == XE_G2G_TYPE_OUT));
> +	xe_assert(xe, !(size % SZ_4K));
> +
> +	return xe_guc_ct_send_block(&guc->ct, action, ARRAY_SIZE(action));
> +}
> +
> +static int guc_action_deregister_g2g_buffer(struct xe_guc *guc, u32 type, u32 dst_tile, u32 dst_dev)
> +{
> +	struct xe_gt *gt = guc_to_gt(guc);
> +	struct xe_device *xe = gt_to_xe(gt);
> +	u32 action[] = {
> +		XE_GUC_ACTION_DEREGISTER_G2G,
> +		FIELD_PREP(XE_G2G_DEREGISTER_TYPE, type) |
> +		FIELD_PREP(XE_G2G_DEREGISTER_TILE, dst_tile) |
> +		FIELD_PREP(XE_G2G_DEREGISTER_DEVICE, dst_dev),
> +	};
> +
> +	xe_assert(xe, (type == XE_G2G_TYPE_IN) || (type == XE_G2G_TYPE_OUT));
> +
> +	return xe_guc_ct_send_block(&guc->ct, action, ARRAY_SIZE(action));
> +}
> +
> +#define G2G_DEV(gt)	(((gt)->info.type == XE_GT_TYPE_MAIN) ? 0 : 1)
> +
> +#define G2G_BUFFER_SIZE (SZ_4K)
> +#define G2G_DESC_SIZE (64)
> +#define G2G_DESC_AREA_SIZE (SZ_4K)
> +
> +/*
> + * Generate a unique id for each bi-directional CTB for each pair of
> + * near and far tiles/devices. The id can then be used as an index into
> + * a single allocation that is sub-divided into multiple CTBs.
> + *
> + * For example, with two devices per tile and two tiles, the table should
> + * look like:
> + *           Far <tile>.<dev>
> + *         0.0   0.1   1.0   1.1
> + * N 0.0  --/-- 00/01 02/03 04/05
> + * e 0.1  01/00 --/-- 06/07 08/09
> + * a 1.0  03/02 07/06 --/-- 10/11
> + * r 1.1  05/04 09/08 11/10 --/--
> + *
> + * Where each entry is Rx/Tx channel id.
> + *
> + * So GuC #3 (tile 1, dev 1) talking to GuC #2 (tile 1, dev 0) would
> + * be reading from channel #11 and writing to channel #10. Whereas,
> + * GuC #2 talking to GuC #3 would be read on #10 and write to #11.
> + */
> +static unsigned int g2g_slot(u32 near_tile, u32 near_dev, u32 far_tile, u32 far_dev,
> +			     u32 type, u32 max_inst, bool have_dev)
> +{

This function makes my head hurt but I don't have any other suggestions.

> +	u32 near = near_tile, far = far_tile;
> +	u32 idx = 0;
> +	int i;
> +
> +	if (have_dev) {
> +		near = (near << 1) | near_dev;
> +		far = (far << 1) | far_dev;
> +	}
> +
> +	if (far > near) {
> +		for (i = near; i > 0; i--)
> +			idx += max_inst - i;
> +		idx += (far - 1 - near);
> +		idx *= 2;
> +		idx += type;
> +		return idx;
> +	}
> +
> +	if (far < near) {
> +		for (i = far; i > 0; i--)
> +			idx += max_inst - i;
> +		idx += (near - 1 - far);
> +		idx *= 2;
> +		idx += (1 - type);
> +		return idx;
> +	}
> +
> +	return -1;
> +}
> +
> +static int guc_g2g_register(struct xe_guc *near_guc, struct xe_gt *far_gt, u32 type, bool have_dev)
> +{
> +	struct xe_gt *near_gt = guc_to_gt(near_guc);
> +	struct xe_device *xe = gt_to_xe(near_gt);
> +	struct xe_bo *g2g_bo;
> +	u32 near_tile = gt_to_tile(near_gt)->id;
> +	u32 near_dev = G2G_DEV(near_gt);
> +	u32 far_tile = gt_to_tile(far_gt)->id;
> +	u32 far_dev = G2G_DEV(far_gt);
> +	u32 max = xe->info.gt_count;
> +	u32 base, desc, buf;
> +	int slot;
> +
> +	xe_assert(xe, xe == gt_to_xe(far_gt));
> +
> +	g2g_bo = near_guc->g2g.bo;
> +	xe_assert(xe, g2g_bo);
> +
> +	slot = g2g_slot(near_tile, near_dev, far_tile, far_dev, type, max, have_dev);
> +	xe_assert(xe, slot >= 0);
> +
> +	base = guc_bo_ggtt_addr(near_guc, g2g_bo);
> +	desc = base + slot * G2G_DESC_SIZE;
> +	buf = base + slot * G2G_BUFFER_SIZE + G2G_DESC_AREA_SIZE;
> +
> +	xe_assert(xe, (desc - base + G2G_DESC_SIZE) <= G2G_DESC_AREA_SIZE);
> +	xe_assert(xe, (buf - base + G2G_BUFFER_SIZE) <= g2g_bo->size);
> +
> +	return guc_action_register_g2g_buffer(near_guc, type, far_tile, far_dev,
> +					      desc, buf, G2G_BUFFER_SIZE);
> +}
> +
> +static void guc_g2g_deregister(struct xe_guc *guc, u32 far_tile, u32 far_dev, u32 type)
> +{
> +	guc_action_deregister_g2g_buffer(guc, type, far_tile, far_dev);
> +}
> +
> +static u32 guc_g2g_size(struct xe_guc *guc)
> +{
> +	struct xe_gt *gt = guc_to_gt(guc);
> +	struct xe_device *xe = gt_to_xe(gt);
> +	unsigned int count = xe->info.gt_count;
> +	u32 num_channels = (count * (count - 1)) / 2;
> +
> +	return num_channels * XE_G2G_TYPE_LIMIT * G2G_BUFFER_SIZE + G2G_DESC_AREA_SIZE;
> +}
> +
> +static bool xe_guc_g2g_wanted(struct xe_device *xe)
> +{
> +	/* Can't do GuC to GuC communication if there is only one GuC */
> +	if (xe->info.gt_count <= 1)
> +		return false;
> +
> +	/* No current user */
> +	return false;
> +}
> +
> +static int guc_g2g_alloc(struct xe_guc *guc)
> +{
> +	struct xe_gt *gt = guc_to_gt(guc);
> +	struct xe_device *xe = gt_to_xe(gt);
> +	struct xe_tile *tile = gt_to_tile(gt);
> +	struct xe_bo *bo;
> +	u32 g2g_size;
> +
> +	if (guc->g2g.bo)
> +		return 0;
> +
> +	if (gt->info.id != 0) {
> +		struct xe_gt *root_gt = xe_device_get_gt(xe, 0);
> +		struct xe_guc *root_guc = &root_gt->uc.guc;
> +		struct xe_bo *bo;
> +
> +		bo = xe_bo_get(root_guc->g2g.bo);
> +		if (IS_ERR(bo))
> +			return PTR_ERR(bo);

A few things.

- xe_bo_get returns BO or NULL.
- Checking the return seems overkill
- I don't see an associated xe_bo_put
- Do we even need a reference? i.e. The clean up is handled by DRM managed on driver unload.

> +
> +		guc->g2g.bo = bo;
> +		guc->g2g.owned = false;
> +		return 0;
> +	}
> +
> +	g2g_size = guc_g2g_size(guc);
> +	bo = xe_managed_bo_create_pin_map(xe, tile, g2g_size,
> +					  XE_BO_FLAG_VRAM_IF_DGFX(tile) |
> +					  XE_BO_FLAG_GGTT |
> +					  XE_BO_FLAG_GGTT_ALL |
> +					  XE_BO_FLAG_GGTT_INVALIDATE);
> +	if (IS_ERR(bo))
> +		return PTR_ERR(bo);
> +
> +	xe_map_memset(xe, &bo->vmap, 0, 0, g2g_size);
> +	guc->g2g.bo = bo;
> +	guc->g2g.owned = true;
> +
> +	return 0;
> +}
> +
> +static int guc_g2g_start(struct xe_guc *guc)
> +{
> +	struct xe_gt *far_gt, *gt = guc_to_gt(guc);
> +	struct xe_device *xe = gt_to_xe(gt);
> +	unsigned int i, j;
> +	int t, err;
> +	bool have_dev;
> +
> +	if (!guc->g2g.bo) {
> +		int ret;
> +
> +		ret = guc_g2g_alloc(guc);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	/* GuC interface will need extending if more GT device types are ever created. */
> +	xe_gt_assert(gt, (gt->info.type == XE_GT_TYPE_MAIN) || (gt->info.type == XE_GT_TYPE_MEDIA));
> +
> +	/* Channel numbering depends on whether there are multiple GTs per tile */
> +	have_dev = xe->info.gt_count > xe->info.tile_count;
> +
> +	for_each_gt(far_gt, xe, i) {
> +		u32 far_tile, far_dev;
> +
> +		if (far_gt->info.id == gt->info.id)
> +			continue;
> +
> +		far_tile = gt_to_tile(far_gt)->id;
> +		far_dev = G2G_DEV(far_gt);
> +
> +		for (t = 0; t < XE_G2G_TYPE_LIMIT; t++) {
> +			err = guc_g2g_register(guc, far_gt, t, have_dev);
> +			if (err) {
> +				while (--t >= 0)
> +					guc_g2g_deregister(guc, far_tile, far_dev, t);
> +				goto err_deregister;
> +			}
> +		}
> +	}
> +
> +	return 0;
> +
> +err_deregister:
> +	for_each_gt(far_gt, xe, j) {
> +		u32 tile, dev;
> +
> +		if (far_gt->info.id == gt->info.id)
> +			continue;
> +
> +		if (j >= i)
> +			break;
> +
> +		tile = gt_to_tile(far_gt)->id;
> +		dev = G2G_DEV(far_gt);
> +
> +		for (t = 0; t < XE_G2G_TYPE_LIMIT; t++)
> +			guc_g2g_deregister(guc, tile, dev, t);
> +	}
> +
> +	return err;
> +}
> +
>  static void guc_fini_hw(void *arg)
>  {
>  	struct xe_guc *guc = arg;
> @@ -423,7 +688,16 @@ int xe_guc_init_post_hwconfig(struct xe_guc *guc)
>  
>  int xe_guc_post_load_init(struct xe_guc *guc)
>  {
> +	int ret;
> +
>  	xe_guc_ads_populate_post_load(&guc->ads);
> +
> +	if (xe_guc_g2g_wanted(guc_to_xe(guc))) {
> +		ret = guc_g2g_start(guc);
> +		if (ret)
> +			return ret;
> +	}
> +
>  	guc->submission_state.enabled = true;
>  
>  	return 0;
> diff --git a/drivers/gpu/drm/xe/xe_guc_types.h b/drivers/gpu/drm/xe/xe_guc_types.h
> index fa75f57bf5da..83a41ebcdc91 100644
> --- a/drivers/gpu/drm/xe/xe_guc_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_types.h
> @@ -64,6 +64,15 @@ struct xe_guc {
>  	struct xe_guc_pc pc;
>  	/** @dbm: GuC Doorbell Manager */
>  	struct xe_guc_db_mgr dbm;
> +
> +	/** @g2g: GuC to GuC communication state */
> +	struct {
> +		/** @g2g.bo: Storage for GuC to GuC communication channels */
> +		struct xe_bo *bo;
> +		/** @g2g.owned: Is the BO owned by this GT or just mapped in */
> +		bool owned;
> +	} g2g;
> +
>  	/** @submission_state: GuC submission state */
>  	struct {
>  		/** @submission_state.idm: GuC context ID Manager */
> @@ -79,6 +88,7 @@ struct xe_guc {
>  		/** @submission_state.fini_wq: submit fini wait queue */
>  		wait_queue_head_t fini_wq;
>  	} submission_state;
> +

Unrelated.

Matt

>  	/** @hwconfig: Hardware config state */
>  	struct {
>  		/** @hwconfig.bo: buffer object of the hardware config */
> -- 
> 2.47.0
> 
