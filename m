Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4104C4332F
	for <intel-xe@archiver.kernel.org>; Wed,  8 Nov 2023 17:59:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 923C610E185;
	Wed,  8 Nov 2023 17:59:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D905B10E185
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Nov 2023 17:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699466381; x=1731002381;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=aNB/bmd5li4CixjZiayZCP7D5MAu4Dr9fD3tb3Z7fMg=;
 b=VO9Wmst9tyKpGwe2uMT7R+MPeClYQRwqNsEu4NFZzhWzN0UOuzfigyZY
 JJrXgTolZc7lEjtNC/Md6OPUX4whjssRLemyfVes/T29R+nND8diKua5c
 3SovW42zr5xibC1n2gNsx0ytXCpzWjnSPbOLEBW8966mm3QSK5zwMDHIY
 z4cRRbOKlimiV2ree78FlYbDT9BC/5b+0e6NBpPR6HX1Qx+QVKp73xbQ9
 CDVQPnooA0JOEXYW0/5ox5aL3CDN/ISPBzuTETMszlgqPWBEpgYDvPZFw
 AklxggKGokmTPULBG9mUc+BTRcmaBK8WUIYDnfLXXky4/qR01FjRhX9yW g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="456318640"
X-IronPort-AV: E=Sophos;i="6.03,286,1694761200"; d="scan'208";a="456318640"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2023 09:59:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="880291990"
X-IronPort-AV: E=Sophos;i="6.03,286,1694761200"; d="scan'208";a="880291990"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Nov 2023 09:59:40 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 8 Nov 2023 09:59:40 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 8 Nov 2023 09:59:40 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 8 Nov 2023 09:59:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EzFPCGHTYrv89eDL52WawEZqpvv06VkJQ9Yr6ELpIvd7u5ObhpcGhc/46bbhu1OqKTLIU9sCU/UG+xKLp/ILYIHxM1/z1QZHUauTrbdr0MysWg9nMDjP8jcyGgeurTaCPOtytVNjOT2yUtDt+mSJhR2/2lfPxV77hXuo/TglidP/m/8akGwn6bFcuO7g6iDMJ22S3L8nU3Gt2RiMd//Yu6OmtR3/V5XP5XqJcZfFy7n3ydGfigzpO5tmaA6IKGBQioV0fQscVrpj5rBZ4y7lL63SLDkq0fXdJ22KZafBKncvsUV70n4c0fu2J81Qi+DPW+UvvLAotYHd5R5Cx/GzQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vNsapQ2GE6u/PUeYgdPTme/TNFA2Pm4YQeSHLdeT2ws=;
 b=QOLaue033G7ZwJ+KLOCntV2XBJt6lZIPJhxWaa+XNLY9l42lJ5vII3ny5jwNILi2Jb9YcnWOs8Jfb2f7wJycHmuZn8+K/h3gHVECUVIarSbB2eRewVo+dcCReCr/0IEMLtYseeZh86Yu4tgleja0sPoDQ8l0PAlG/tBzJYXge2h897YbE+tIbxz4v4kb2QU0f3YY7Ss+llNwzKyHVEU5v+/43fqaOOPuXJxotJu45h9lMnIj9HgPbmknNwxGFJ3qZdECdkbw0/L/31C8V8BdX7PYxElM5aLpp7m7yJMAs8djJwsVbKvCHVGOiHMaB5bi8MoZB+WxGUO7VL8lG0DnDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 SJ2PR11MB8566.namprd11.prod.outlook.com (2603:10b6:a03:56e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Wed, 8 Nov
 2023 17:59:38 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::a247:c62c:764f:85a9]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::a247:c62c:764f:85a9%5]) with mapi id 15.20.6977.018; Wed, 8 Nov 2023
 17:59:38 +0000
Date: Wed, 8 Nov 2023 09:59:35 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Haridhar Kalvala <haridhar.kalvala@intel.com>
Message-ID: <20231108175935.GT5757@mdroper-desk1.amr.corp.intel.com>
References: <20231108073351.3998413-1-haridhar.kalvala@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231108073351.3998413-1-haridhar.kalvala@intel.com>
X-ClientProxiedBy: BY3PR05CA0054.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::29) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|SJ2PR11MB8566:EE_
X-MS-Office365-Filtering-Correlation-Id: 41bfad69-ffc9-4e02-cb60-08dbe084794b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uwHJq9wTC7ZeJmj9o+I051fdJlTa3RtWHxexPzzyuAfqWRNypgJdfu2CKBtcGplU0NIwV5Z2pD6g2rqbr6JJcJCkkL1jIS5st6f/HoyNGkU6by89v9AqUdKkkbQQLuKFlMTx7JTC86/ShN1czl9TuZAnmUUOhnQluurCuUrkgUc9BI6XpMU1me5sp6VlyhGBLwOazSA8qvwaxCTO2TCOt/MiDq2OIa9K5spwXLcibAVSAe/zthbOMhaqnPGjrmuX7GwbGSKAX5muXwT8z8vi5YLPZxW+qtsRzSDdtS6u1LAYdCWFw7AqciVR1esCQJyUDouprxh/Xao8fcVQEbMWD9At18J0YPEcE62h8HE+6j+YWXMb1eA35ju/7a6F7i0MLhnJQ8NwnzfqGAIP5X0C1ijsNBdCFt6x5I8hm5FE07yUrm2d6Ux/9jV477iPRosRgPCQbuyU65i87eX0HpIowNZF5zRdTtPDvSOYQqU9NMSrhtjnQlRQrnnWrdxqJ14cbiepBwmYPoZsQ5xyaVk5NquMB0QG/UpIF5Um1RCuTvXA2il+fmnkJv/ZdjPm51Cp
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(396003)(376002)(366004)(39860400002)(136003)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(6506007)(86362001)(8676002)(478600001)(8936002)(6486002)(4326008)(6862004)(6666004)(1076003)(5660300002)(4744005)(6512007)(38100700002)(66476007)(33656002)(66946007)(66556008)(316002)(6636002)(2906002)(26005)(41300700001)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DnZiJe4WngvKQ5Ww+z9q221RgXpXXBkWqtj3hG/iifawFFZkyyaKLZiQztZm?=
 =?us-ascii?Q?J6J0TNI5PLbzhFZnT3pHlrpEkf1ZA0229feU/XkFcWcD6BMFP1P5/iceWQ0a?=
 =?us-ascii?Q?TIHYCpbQMv/vtx38QH721Yg01zGZ929VrLWL1FcJaGNlhsdxjZfuFD16oWn+?=
 =?us-ascii?Q?/mpPpjOltZCSO9SioKSyu6cxwBUarGtgTJ5wt/iVnsW202JPg9yszrNBSnCm?=
 =?us-ascii?Q?arnom2TrrWB3Lrn0ZhNTI9v+EzE/ZiTAlbN/9EMRngNuxfSTXHCyA2gTosMi?=
 =?us-ascii?Q?xsvzouqgNM5nU3tg56bJhR6yHlm88gPyyc8Q8rnjiOyGo8SVEOWbE7w+p/bd?=
 =?us-ascii?Q?Ko6qHFNVUHa/+yhyl/3w1CV6x+o6HniTN/U3YpPQk9vO+SF7zZdgSzKl97B8?=
 =?us-ascii?Q?v90nx37GzPBRhc9C+iIYnF7zSId25hxbq9u+BXgb9FDuK8dHbwQ9/g+hD4Re?=
 =?us-ascii?Q?oaNk1w4eUxjm5ct+ng2bpZR7GCMN0w9Y8WtqfQsR6B78Jx/hYfP4uWzAseV/?=
 =?us-ascii?Q?NUDYg7u7pPiHcBcd0smtwfJNTG7WoJTGNb7ppv4TT4oF0zK4FWSjNC3FNHjt?=
 =?us-ascii?Q?vRbbw35kX/8358xd+dZhjXKpOr0cu2lVEjh/1vF6AzOTnSLHy2Ka1xwBRBag?=
 =?us-ascii?Q?Nxfv0djbahU4OXcDUgUPE5hc2FxPpAxsUXsRbQsKCchZj+RVpGYnHd9nceRL?=
 =?us-ascii?Q?U76Kg/4f5cAndG+EGukl+8mPbjZSlLN9+w3NfjDQUxDTR38bW3C5+qCGPe0Y?=
 =?us-ascii?Q?LvQdaUkpJ1VxHh72Jm8qKKhDNzScoXGgdp1pUVt1ps6STYUcUp5wz6uf0OXA?=
 =?us-ascii?Q?CO+b0X6zqMjtGZeNQqetfhvSZAJcla6HynVTLWwBani6P1eoRixDLDKpDmdk?=
 =?us-ascii?Q?cGuChy+NG2l1uWzLuBzr6Qm5Hsv+A6JNKcPRLfY0xZVP57hFGXlORA9oF4Rg?=
 =?us-ascii?Q?r9zgYq/0+Wia4m4kNklGa46XZWEr2Z7QhhQI91inyw8hjLm23ToM6fB6+a1Q?=
 =?us-ascii?Q?PQOQrkaBTIJAR5bh4nU1egXncEVykzLrs/frUIGfHxwQIisQBudKs82VCjw6?=
 =?us-ascii?Q?2cY4oejCsLb2WBNJTxKveRHJ9l8y6w5Bw5yD1w/8bxTM9fHQqJODnNNawfIm?=
 =?us-ascii?Q?I0C+4hWNxfT4+l1zMw7BXq+0ZqCNJ/2BbEFwSuDguJsZn48viWsiIi/EO0Yu?=
 =?us-ascii?Q?lZTuAfdKrMHryz/2JL2RjwRdRoSns3bWufnBz/mbbpENU9SOtgRVHDkuaGr7?=
 =?us-ascii?Q?wZObCBOtYl4j7Jj7L42PGNIWlohfunrKEovKNybtftQXGG9GAk9WYe16lR/H?=
 =?us-ascii?Q?wV4+2YkhzQYzNO766hTcFAK98NFLAAh4dAhtWIZJaYNFJQHbTBvtrOEihJCm?=
 =?us-ascii?Q?Xj7dvhYVHuyh7ya6xnwexn5yPRvHObeehgM9g/zXkqRw3TqwO7GAXIwQ8pRB?=
 =?us-ascii?Q?gsHvCmFf6lPQx17qpAlFhdLRPkTt4OHhkD6R79Z+W/TcKLevnJPkAVwLEAC8?=
 =?us-ascii?Q?ERSbZdBUPQdgWlRSthZXuUYnCh5NBCwjgORhGBfWc+BvtcmQ+O21tfaEW8+m?=
 =?us-ascii?Q?Emx+lnZKIC6ulmu3jj8Ko7a2xIlr7LWkhfkrQmf0wqHW0x9wJQUbSexqEyt+?=
 =?us-ascii?Q?fg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 41bfad69-ffc9-4e02-cb60-08dbe084794b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2023 17:59:37.9577 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8pP0EAD05+Ch5CPx2cFSg4hiZ6hHwbpWW20KRQ66zKAhWSwkALinMWrEwnVbFZ+NLZAHQkPISj1hbuVBtBfrUizdIAbCVokxRve1LE2488Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8566
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v1] drm/xe: Add Wa_14019877138
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

On Wed, Nov 08, 2023 at 01:03:51PM +0530, Haridhar Kalvala wrote:
> Enable Force Dispatch Ends Collection for DG2.
> 
> BSpec: 46001
> 
> Signed-off-by: Haridhar Kalvala <haridhar.kalvala@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

and applied to drm-xe-next.  Thanks for the patch.


Matt

> ---
>  drivers/gpu/drm/xe/xe_wa.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 614e114a5342..d03e6674519f 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -677,6 +677,10 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
>  	  XE_RTP_RULES(PLATFORM(DG2)),
>  	  XE_RTP_ACTIONS(SET(CACHE_MODE_1, MSAA_OPTIMIZATION_REDUC_DISABLE))
>  	},
> +	{ XE_RTP_NAME("14019877138"),
> +	  XE_RTP_RULES(PLATFORM(DG2)),
> +	  XE_RTP_ACTIONS(SET(XEHP_PSS_CHICKEN, FD_END_COLLECT))
> +	},
>  
>  	/* PVC */
>  
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
