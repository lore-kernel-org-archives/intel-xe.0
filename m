Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A094BC2BB3F
	for <intel-xe@archiver.kernel.org>; Mon, 20 Nov 2023 16:22:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5869B10E059;
	Mon, 20 Nov 2023 16:22:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E641210E059
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Nov 2023 16:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700497354; x=1732033354;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ViuqOjiue0KFEWKSAzoq5hdiUdZA62TQWH+ejcOB5Gs=;
 b=lWqhawcWhuhGZs8W5WfBU9G6q15YQxTBisIj13ZOOy/RakrnpddsaXoV
 aANPT++WiZjIjGnHNyHzOmFNG+kCO7coFKQuMRfnW9GjUwidbBzqtx18P
 gYWC/6NEAj25GbkynhymoR24eqRLiAKYKVtU4sQGX6MUAD6gN58mlnugh
 tow3YL689M+GoT5TMO51cgq1IgZ3lhhCWpWR62HCajkngOIHySQYOezMl
 DQ2m5lknsWYwKpTHXb6hmFCKaV8Evd+a1DZrDWl/36L5XjsrtblQxrTK6
 wl4OrqHnrOBrQLW0rYWhmcnYfwlRY5VrQapBRUpiFyYHmr2SpFgxDcOnn Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="477856676"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; d="scan'208";a="477856676"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2023 08:22:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="769950078"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; d="scan'208";a="769950078"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Nov 2023 08:22:34 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 20 Nov 2023 08:22:33 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 20 Nov 2023 08:22:32 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 20 Nov 2023 08:22:32 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 20 Nov 2023 08:22:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oGdVShpLPhlPBKVqnMaJUmT0eVw3rOB8pBW+30v5izLMmKL8FblZp2etXFFSswEekhBNRpbeqIYnH7WLEtrAlqlr9Ri1vj2X0mmEdkLtzOOCdpPR/ctTPGQHr0gdTZfmbKpJpvn+h/xfpKuT6Gjoe+Frp3kFLokX8prF8IN8Tgy2PCCO+THVFYkaBoU54xoNwbBGokx6I7JgK3vjqQSuCsxcLcl84HjeTMRJpgJWcDbTYiD3T4VBRKzNsZH/DTb2Xn/qklegVPIY/MJB/vbinG09aIfp3mUPfqCtNFxIvNg000H6Qn/BhrZwSboyTFt1K4QYLU3XaUuknpjgenWtlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BJxCpB9iFJFI/kYlzPxYihhWZmC9R3kU0iwShJ+hhGk=;
 b=Othtj9v/xa16qYX+h6gBSzaqTOkOO299lGtw2J1nKPNdk4j6TN4HYJ4wNG+TO4yu9+spU9iGfCpfBgER2cjHkzPI9rKg8DzXNQKw0uqvjWAToXJBTHw+g5quwK7GmpRdUgwBQEh/kJYW1UV4HRgqkMPd8OnuGniqJme7IGtk520V20RZ27o15k4YcyoeuvWG7F2qIhJPULlMUHIZ4itSr2XGxftGCCn4s5TXhK1ygNai44Ln74A7MC12zp2hrXyfaOg0xKzms7+NdnlF90Sj7aiBuA+j6jxX2KGkehtjMe4p+LNFFkRJEERBsx82FuvQ3jwkN6KBzzy0ahxxpn/7Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SA3PR11MB8074.namprd11.prod.outlook.com (2603:10b6:806:302::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.26; Mon, 20 Nov
 2023 16:22:31 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0%7]) with mapi id 15.20.7002.027; Mon, 20 Nov 2023
 16:22:31 +0000
Date: Mon, 20 Nov 2023 08:22:29 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Haridhar Kalvala <haridhar.kalvala@intel.com>
Message-ID: <20231120162229.GC5757@mdroper-desk1.amr.corp.intel.com>
References: <20231120065507.1543676-1-haridhar.kalvala@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231120065507.1543676-1-haridhar.kalvala@intel.com>
X-ClientProxiedBy: SJ0PR03CA0001.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::6) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SA3PR11MB8074:EE_
X-MS-Office365-Filtering-Correlation-Id: 906874d9-474b-4c10-7e28-08dbe9e4e55d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: efJmvFTbumNjZQeLq5NwtaYN++lEMosiaVRIJa1p3z0qtjaLpRiBD5etGKyXEoMG+XESN3sBhp3+SK7u0VhHJzKZdPl4fxyCQJzrnTlRc8HzQEyS3yPZmOkmnEtPxuW/OT74C3/a3tgnXXYB6/dv4cu7QCZx8PgiCzMVKUm1b2IirXjRVZ4yXoHgECKZWKxctxlIppkUcLbtkb+8pwy3YK1SrXAE++HJ0hWZKtlNcZwJRL3INL4KY2lKy8Hn4Hx3NxBbgRmk7cSW/UJFhHhk27WyTWsKCyikiRVvz1dLzTtm3rFRjJXjjw2G9pKq414e4eBhBYIJmamvNiVbMUGfir6a2kyQyTTSkZvZ2KP1vLblwX+AU+zi3g1e03UG7ZOtbMNWYpFyRdj4ko37odZl/FKgZPNnTFGulp3bEz0M0FeS/EMjzYl21GvdZQZ5edx3/HexhNMYxrPpMnmVjieGKxuHx5QcToqpDzLBB9FYi5x7QvP2APAF2inkfKFR5HIfMbvON0Rx//rOFmAHMB/KtukMmxTtf3hyEbTWHpoAw//d8OYtT8M2VQOS3KcRTvr5
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(396003)(39860400002)(376002)(366004)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(41300700001)(2906002)(86362001)(33656002)(5660300002)(15650500001)(4744005)(26005)(6506007)(82960400001)(6512007)(6486002)(478600001)(1076003)(83380400001)(66556008)(66476007)(66946007)(6862004)(4326008)(38100700002)(8936002)(316002)(8676002)(6636002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?09us82TAylancL4zizjXeOC4f1SlJg1d73xI4EWmfJp3caqJ6HgOb1oXtxz6?=
 =?us-ascii?Q?NMLtFAD9sqiLkeijWRTXQ5ZRhRBMpuagJpMfrXN9HlZeUOCjn3FrmGBTBaOE?=
 =?us-ascii?Q?78kEDebHaZ0EMmL+bEpIyT83qsse3gSCfZ0h6JfSlUwD9u3wKG0pNHtwkE2m?=
 =?us-ascii?Q?hk271uQnKiFFhnJOU7dw5gUTFMH6YIxYAwt+isXGLWytTxchWbd/hn5k1nkv?=
 =?us-ascii?Q?eU6J+/VmaCkGWVPBF+Gl1ySOZzH4WZNTEH30sfbYxRkAPhizga0RRx8tv9X1?=
 =?us-ascii?Q?NT6zaNdYC8qnGSWGmErHrHu6nrzySny/Pf9oIUw7uTecjbU0QrbLcXpE6HvT?=
 =?us-ascii?Q?fvyAaR0DBsGzc8NTLobz7GCZHVE74BEV10G67D2L5usz6USIQ9SbRGCVZKLM?=
 =?us-ascii?Q?3XFlyeEin5PAHi9LDwkYfLpvePszI1LKKDG9Fiv2RfvMJHofENJWjVI6vOTs?=
 =?us-ascii?Q?+FXty6HO+7IEYrSm5K5gf+c2HByvA6DWmsxlirNUqv+ThNTh0yNGLLCoCwah?=
 =?us-ascii?Q?j7u6cQWsKEEaBnwTKMTtsENkSB4yXhfbO4aIcc0Xq7DnOBPT9m2Yt417EZvG?=
 =?us-ascii?Q?uLmrYa0WWe51UxKNMPX4lu+Ypn6415nDjVnd/IPuOZ5qJP9dP3rQwLC5i2Rm?=
 =?us-ascii?Q?MYmVXLgK92QlrXWu6943Gp19u8S3YYC8cL+TZ0VqaRr5VjfbhZ89iRaT25wO?=
 =?us-ascii?Q?e+WNvB1peiRH8WAvc+AJkN0I+MIWJ7h5PmRXLTqGTDF42qN0sFyZIw3qgo85?=
 =?us-ascii?Q?p+A0SU33f4FJNsm80owKXHBUrybG6/2/BLq29O/BDRmmqgOxSWVIcQMY5wSg?=
 =?us-ascii?Q?zpaO//AjHAois1+Xo44cHJkhZcC+kbvoJ3JWYMt+u0D/+WB1PV9gx4F9PIfg?=
 =?us-ascii?Q?fLSg7axi00JCuLZkBuA9pouLgohum+74h8yzmw4Kkht6Nyn9uWDHxtxkb5Z+?=
 =?us-ascii?Q?u8vyiYTw7gobmB2XE6+zKIoa/DxbrHrywUY4uaFHAsznd3VlJBcuDkfIaXIg?=
 =?us-ascii?Q?4Jw/pM/RxAkGTrjvuepJDmLGeqd67u57qlkbMPMULoueMqBea5nyNj2dnopv?=
 =?us-ascii?Q?2NbGIWxZZw7korXwAK9zrYC/CSLwGiBgmVrlpORkzy7iAeG5j43GVOC3gQzx?=
 =?us-ascii?Q?EwsENaihNrLrtYqEuJGvHaKrE/UtmGFQw2Mz+SL92a4+ewX2qbVUPSLb7O5B?=
 =?us-ascii?Q?RriT1RFc85CTN8DEP5E0rWYg2EkHjJuWqOwXc4DJbFIeZ92GNLIyuTijkhGR?=
 =?us-ascii?Q?SDhJbHVFHAdrTDw1rWJlOy/4eRVxkzib8Bc1cTDmNUjE9wythxcFdOBbG/92?=
 =?us-ascii?Q?L3oijiJGtfyqHSIuVneROUnlCkb3kmzxGYGi57dAx+Bz+HwVjNXsBrKLq9SO?=
 =?us-ascii?Q?Q6aqwXJwfZq7FF0M3C0f82ku2+v/amyFZ35Gry0yGDjJ08c50SW3tfKhfmah?=
 =?us-ascii?Q?LwEupS6hpaUcw9RTG6Sb/5POKq+5Qd9s1Tpt1d6zjdQaDN0JBjydnux2G2Y5?=
 =?us-ascii?Q?v0AyiCx0OjFgFPKxpCWrSfmAU3lJWN4HH315A1i8XDWhom29v/KqR/Ilz37b?=
 =?us-ascii?Q?BoVKdAIyWkR6hMZsn5QE6oL7syhcbhdMR4kOhbDTpYnW+dnSahegD2bkopHO?=
 =?us-ascii?Q?Cg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 906874d9-474b-4c10-7e28-08dbe9e4e55d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2023 16:22:31.4386 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zKUUEN7Q56Ffbk5I89ne5ocVBpRxre9S8fUVXyS33S2k9eyE9+I+tprw0sqwkY0BXFK++tWVKUp+CRMcy18oeZkabJ018p53WlYm/3rpKD4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8074
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: ATS-M device ID update
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

On Mon, Nov 20, 2023 at 12:25:07PM +0530, Haridhar Kalvala wrote:
> ATS-M device ID update.
> 
> BSpec: 44477
> 
> Signed-off-by: Haridhar Kalvala <haridhar.kalvala@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  include/drm/xe_pciids.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/include/drm/xe_pciids.h b/include/drm/xe_pciids.h
> index 68fbab161feb..712eb53f1f83 100644
> --- a/include/drm/xe_pciids.h
> +++ b/include/drm/xe_pciids.h
> @@ -157,7 +157,8 @@
>  	XE_DG2_G12_IDS(MACRO__, ## __VA_ARGS__)
>  
>  #define XE_ATS_M150_IDS(MACRO__, ...)		\
> -	MACRO__(0x56C0, ## __VA_ARGS__)
> +	MACRO__(0x56C0, ## __VA_ARGS__),	\
> +	MACRO__(0x56C2, ## __VA_ARGS__)
>  
>  #define XE_ATS_M75_IDS(MACRO__, ...)		\
>  	MACRO__(0x56C1, ## __VA_ARGS__)
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
