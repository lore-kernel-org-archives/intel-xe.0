Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C461C77B73
	for <intel-xe@archiver.kernel.org>; Mon,  5 Jun 2023 17:10:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 421B910E1CB;
	Mon,  5 Jun 2023 17:10:32 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5570310E1CB
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Jun 2023 17:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685985029; x=1717521029;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=wz834146qCngPVr41ABj+G15CWIRwtLP6uBgyzbjodw=;
 b=PQGlK78/iWNGjMwSZnZOrAfoPjixbnO0iDfchQd5EyYBdRXfJRXIEf51
 +wJ93sT429KMhaRjW/ETUZZn4XVfnvMOHMFQnaBiptWwt8L1QVNqd030q
 cH3uWjfqLAndGd9eHD5w1m+VahOq/a6855ie/+sY5E8C1BNHBmxQD4Oc5
 cT7BZjKhnynefgoEc3JSzzfohs7BwH1hCuF7HovnBYRinfVarqQU3hUFp
 6cA/+hmZfNDVMW8mCsCmA35kuKk8MA4GAyaDVYSDoqun8clZqX/p4XbaN
 R4vKBs9gtkUVtiWvUKa9kAJppca1myiCivLRYdUlgrOfLX//baU+vMVy3 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="336043777"
X-IronPort-AV: E=Sophos;i="6.00,218,1681196400"; d="scan'208";a="336043777"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2023 10:10:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="882998046"
X-IronPort-AV: E=Sophos;i="6.00,218,1681196400"; d="scan'208";a="882998046"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga005.jf.intel.com with ESMTP; 05 Jun 2023 10:10:27 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 5 Jun 2023 10:10:26 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 5 Jun 2023 10:10:25 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 5 Jun 2023 10:10:25 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 5 Jun 2023 10:10:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dqt9a8LJzxQLzDFIPqRpgMU6Dn0rQ48rAuSRDLT7JJpChQek2Jrv/ERrw+lH32jsyfCwUDVjqxyZCvtHUKACj9dCGIHNJ9CRtZN3re/k9dAZW7PW06ixh2XxJ11FqsFQk80Ox9MTVeI0fMumeWBS9Ti+BQAurY1xLcmUOGEH/eO3bAeQDUMEU+ecwouSq3ocbSPAWS/Mq5OYPzFeASRkXIWQSSmdDyV0tseWo5PZbcRtjpvPmvjrYxJiEM7j1g8iTrjZlOe3v9PfZ5m4QZ3AlB1UC5pTbOmtAg4MmYLMRZTf7zpA1RlErZX2dqQJHmFoLZGC6I2ywxPkwV1jSX2daw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KUQktyRx8+3GiQlfZqkrASEOtawkW1pA6YdQg+BtZ6E=;
 b=Alfsau3zo9ovR1aPIqJiGZLPnXzVpNxPm/AgrzjKcjQkx5m4lpVlKk8VO1ou+olvU8esBx7gSxtfmzdAiuaoKU/Q1lAQVgqH+HDy1mJB2TfAZ36RJxE4irV3ufIiS5sjnLrdzDjJpOm1zLrnG+d526Wmgq9sHXBpLbFv/nCMLJKcFYdgyv2yW2p/TmwfSTPJi8Pt7JgDFzmMFDx3HxK27N54uyNvcW1ZA/4ouPeQLeDjWBd3/lljc7IiERSakJYaUzEq+w4JKFqDtcOrIp85P+GdbfytwWiXm4pUsLDgVGWlWEwAIqJQIuPEf+BGNQEGAyelXnD0MAc7bUA4y947tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB7131.namprd11.prod.outlook.com (2603:10b6:806:2b0::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Mon, 5 Jun
 2023 17:10:22 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%5]) with mapi id 15.20.6455.030; Mon, 5 Jun 2023
 17:10:21 +0000
Date: Mon, 5 Jun 2023 17:09:06 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <ZH4Wsug4LyxYbuX+@DUT025-TGLU.fm.intel.com>
References: <20230602235210.1314028-1-matthew.d.roper@intel.com>
 <20230602235210.1314028-2-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230602235210.1314028-2-matthew.d.roper@intel.com>
X-ClientProxiedBy: SJ0PR13CA0096.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::11) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB7131:EE_
X-MS-Office365-Filtering-Correlation-Id: c4d02b9b-e02e-4f3f-351f-08db65e7be9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wTHyGRVO9SV4XNREbVFxqZkJ0D9LXqav6z5P29iIJt2+mn7V+NgZbnobPdcSSXcF2k3WB3iFEw+X43B4K4VezqSUNt4165Rf7OOw6nuyYXwhBlMq536KtM3u6lN+WV7m/fZaTwyKkt6n5w50xRwILOidFoxOw6kJ4h+fTfVyHBJC0E0rk5D2wEb0bHxaaUx/ZJhNz6H7O8M9qVdkMsWVLTC27lRinSmiFSbIkqqtw4QPEVhhsqXcgWaMH1SWdybns5+At1+HrKXxq0JLtPYd2ONZ2iKszUjnsWsHeYkwFghFOmlgN7uUpKCQI8t6DUNWF6ELh4xOCuvPYAfsIL6SwNpSvOhOyJL8gOZd1K95DssLpS9oDVS+ONlLjhYYpDX7u8MB/9yVhc4qph2Cl4R++KbqL+0WdAtCzMpNcwultD4KeCCH8t2qXthGPuWzYWwgIG6nNVJzqOVSyMbxP0MGopY+AJFLC46kQtfqIxkqy3ZlyFzvTj3ZuHsYtGzALv0ZzBmWiE4OuMoEran0ercwE1xWAonIbbudL89Ag5xuKN0+vaaNYRRIPG7wL5oKIYBJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(39860400002)(366004)(136003)(396003)(376002)(451199021)(478600001)(82960400001)(8936002)(6862004)(8676002)(6636002)(4326008)(66556008)(316002)(38100700002)(66476007)(66946007)(41300700001)(186003)(83380400001)(6666004)(6486002)(6512007)(26005)(6506007)(44832011)(86362001)(5660300002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?x+sjlYgQTeBtxzuK9UNkmFYQP2gM/qtWTTJTsWlPO0PRZoGjMAZ4rFZfAOr8?=
 =?us-ascii?Q?YI7gEbFtz0niW4rzhGSb0aVX0rzPOYxG5JEEFPqpgH5q/EoEk8V9X3LnNz2U?=
 =?us-ascii?Q?Ls43FTyDAzwRbkuswGrVPYqrnS9Nze0GEKpTniGntxG3nOPZ/O/Z8FbVf/wr?=
 =?us-ascii?Q?pcq5FJ0r38jjidCp16JtHUPjbuZQnHOwZuhR1lrK7SVDKFojKRNVUBTm7lfo?=
 =?us-ascii?Q?dSq4exy+oKjWZMiJGE8RNcgwDh+2GHBECYcPQR/yFJ4m2saVFA+wq2QJ4Yfy?=
 =?us-ascii?Q?7l+lG46uIe6qNRJMrhIsDn2SNF+1TAfgVL1+7X+qWJjx4Fu34c6REWzqQMVM?=
 =?us-ascii?Q?rJRQX0d4Tmjt3dLXCJ/9ExN/CKV5DArlmWx6R/r0pZ10BmhSexaqo4QQ9Uq+?=
 =?us-ascii?Q?bWukn27EqWni9Mhbjf7Z8DksKlHKQJPGIfaIMn1Uh00D3WeHqNpF1RkpD/rx?=
 =?us-ascii?Q?icUg7B/w+Bwdlpv8RU9RVNSbTLbtWdHX085WTnkAmwi86T2rruxxCtPAG2SI?=
 =?us-ascii?Q?rc3mXcVqUzDH/+g4Sui2C3oiS2pYWX8ekNId3uOwx/eYu/yiTJEFIU7Uxyot?=
 =?us-ascii?Q?EBOyMdZA1TlrlIDORR6Eu99odWcN5iVpYXa1NGZzgxVbhRXhdAklfviRLod8?=
 =?us-ascii?Q?F95gFizwR8cbuWW+ozeiBFKcEfScoih1Hi3XfroZtqOwhlb1IlhbOWjLHPVB?=
 =?us-ascii?Q?WZGlSMR822FIzaBd8B+MCtATkmEepKpUVUgzfXDzLhbi+xKMfU0ceGW549Ei?=
 =?us-ascii?Q?Fwog4dS9R7H4oGHR9FLoozhpfZ8+DYBBkDdI8+7HZvrI0viFsFsavOHIslQu?=
 =?us-ascii?Q?UNcAi/zUZCL6EWdhTMAn5+mz/9GTQnCmRDjJrt/c3ZnfR4e2P5M5uCOau3qY?=
 =?us-ascii?Q?3ffmpUbX20gu3Iqjs5XbW0mOxuVEp/GZe85RvZkLMcWwsNYmoEvy/T07NT8A?=
 =?us-ascii?Q?qWSIDNuq9B5kxihKEJ4OIgFxqbASISzhBuNIw54sHRMiro5ji4m5quBL9Ej3?=
 =?us-ascii?Q?WgG9vMK0109effdEoK2Lu/jdeGrgfJkTXGaFFdGy+fG6v0Z1cUjOQnCt5wn2?=
 =?us-ascii?Q?FofF/g26yF4N8QjCfToKAsFnirb8jiSVOOUA2z0IE2WlEkauPTCyX/PvnKNE?=
 =?us-ascii?Q?Vj1r5r+ZzysbQItUPtcK2k0M5O5960W7l9OW2vFTtlal6i/CP5Z1f7EA150I?=
 =?us-ascii?Q?33ip/OzIlUKYU3YTiTp0Z9hZrE+xTczR9/oy6lQXcGo/jpLO8dERcmP7v0aS?=
 =?us-ascii?Q?mfLPBo0duYLYNzfJpmCSUw8MpzXI4A204+QA2pznCbhSVuBVG7WdAzf4qzCB?=
 =?us-ascii?Q?VnkdIOTOYBDcrPCnrap9SR44+pYGG3xD6sISSgak3tKFNhm186X1X5mipJNa?=
 =?us-ascii?Q?PcJ+/ecZXwHgqX24A2Ydvg9av7kChJfuUlC7BvkzcmfVm87Vf4OKGAASbGMW?=
 =?us-ascii?Q?q0a8sdftyhYRRQ+SuBTBHog9AwWkaCmMrt2MOAnspThm7/bOgDh97TwzJqvn?=
 =?us-ascii?Q?bUVNcdf585o54VAakbXhX7wY/b9PaLaDAZJh0azqHCS15mLwT3m07PVgjIOD?=
 =?us-ascii?Q?hSBtWTbp/VbmW4IDR9cggaUXzwnghesNLk3sU/hfywDGtRwy4tg7zEGLns4V?=
 =?us-ascii?Q?nA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c4d02b9b-e02e-4f3f-351f-08db65e7be9f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2023 17:10:21.4965 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y4fhXOYK0BdOKRDXWq4v16kkW5ES5DyBLm4qOjPfT98VpbBfgX4smBu3LruOIj1p3gXpBDamifKZcdmQVGfslw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7131
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/3] drm/xe: Initialize MOCS earlier
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

On Fri, Jun 02, 2023 at 04:52:09PM -0700, Matt Roper wrote:
> xe_mocs_init_early doesn't touch the hardware, it just sets up internal
> software state.  There's no need to perform this step in the "forcewake
> held" region.  Moving the init earlier will also make the uc_index
> values available earlier which will be important for an upcoming GuC
> init patch.
> 
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gt.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 335148f1cd39..3799e663bad3 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -315,8 +315,6 @@ static int gt_fw_domain_init(struct xe_gt *gt)
>  	/* Rerun MCR init as we now have hw engine list */
>  	xe_gt_mcr_init(gt);
>  
> -	xe_mocs_init_early(gt);
> -
>  	err = xe_hw_engines_init_early(gt);
>  	if (err)
>  		goto err_force_wake;
> @@ -429,6 +427,8 @@ int xe_gt_init(struct xe_gt *gt)
>  	if (err)
>  		return err;
>  
> +	xe_mocs_init_early(gt);
> +
>  	xe_gt_sysfs_init(gt);
>  
>  	err = gt_fw_domain_init(gt);
> -- 
> 2.40.1
> 
