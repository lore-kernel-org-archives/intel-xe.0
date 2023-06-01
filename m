Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39578C77B7E
	for <intel-xe@archiver.kernel.org>; Thu,  1 Jun 2023 16:50:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0297410E581;
	Thu,  1 Jun 2023 16:50:27 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C583310E581
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Jun 2023 16:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685638224; x=1717174224;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=3kgqTgJaoRzAANkNICzJiJN+640AIFyaA1kirqQCaME=;
 b=MhGeepy11IG86DXZfs3JeFZsCwdSKTVYuu7IqhVIU36DSYt2mVn88xNF
 W94g5duaQVgQo+AcaRrf3muvBiUmgZYN342vBF4p89hPdSZAvwaWq7yOO
 /37x/yTKZPUhy+exK6+Gr5RCbW+YVIsFi2MnyU9X3aJ091ez7S9CWzEmP
 rOpWd1rGiX9MtW/DSHYH0M6XFcV1vbcEip1JZUdf0k7VlS4Or99uDusR9
 HcXrLDoEHD5qdetT9seHfXb4dB32iiKGpW/TOyHdrqafqPLyMwvpd3Fw7
 FLB6hmbe0CTpw0fl/HotR3BRxlq0oWrbod5cf0CQWKXRBhTDf0sMD3Zh2 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="419138736"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="419138736"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2023 09:50:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="1037575954"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="1037575954"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga005.fm.intel.com with ESMTP; 01 Jun 2023 09:50:23 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 1 Jun 2023 09:50:23 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 1 Jun 2023 09:50:23 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 1 Jun 2023 09:50:22 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 1 Jun 2023 09:50:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q+LIas0P6P4p4js9zhKy40w7r44Bs6pt1J2tVQr28ePIgV9rD2oJuDfphqfza1NNK61/aMtkrphL3uGuSpEvjENfLzMLpk+7MjNMpa0wJI10N80ahGStXijmsX1FJWYpkV7G//MeAcFRVF7beM3yZi9iOnvOmLyhx4KhgbzKOv9OqWcDCmqnUZCINNzD2TD01litMIMdpbt6TrjgB12giofXGzHqhKf3yLT1xuFUiVEsJ6D9xuKOSy/FwnhQ65OCxWqWYQtOzSKO1iYK/qEgCFRHLrPWDuuF/CaBeXtVDjX/NM+gUHeeSAGggfIk8jpvLkaqEcJLn/bAsPPKxziS8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7IaM+s+bXq6jRqKrV+yZZyJOrLwWXhEU7ORK5Tu0fFo=;
 b=nqqXDNOzsSFsYYJ66pIW/isuN5eaoUxKfzs/3U1QGvi+Ow/Pv84ON9V0lF2x8w0tM6YR1ao+DjHCr1K++aRmk0f3qdV+t5xvZwUV64phFeHE2ky2dBqmqsZYFMSa9MsFRth/PsUnqXdbjq2jTLgc99+kkC4dSsFodYFsm9h6UwQni4QUqblHL9pCyCLI/8IyUmyKirbCA0tGxq4Fk0c26NYnqxaQRBbFbuHCgmqKz++HcwurjzZ+n8LLKY22pPmX3KNK5sZ+Zt4R89QQgL0u90FAcsNDcSyVvJFgjg4bO118UB7hf082af3ohIzfJGq0AhUEg0TfgJyV8DlF+/AQWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 CH0PR11MB5265.namprd11.prod.outlook.com (2603:10b6:610:e0::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6455.22; Thu, 1 Jun 2023 16:50:19 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396%3]) with mapi id 15.20.6455.020; Thu, 1 Jun 2023
 16:50:19 +0000
Date: Thu, 1 Jun 2023 09:50:16 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Message-ID: <20230601165016.GK6953@mdroper-desk1.amr.corp.intel.com>
References: <20230529114305.506111-1-balasubramani.vivekanandan@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230529114305.506111-1-balasubramani.vivekanandan@intel.com>
X-ClientProxiedBy: SJ0PR03CA0180.namprd03.prod.outlook.com
 (2603:10b6:a03:338::35) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|CH0PR11MB5265:EE_
X-MS-Office365-Filtering-Correlation-Id: e283b0a5-6428-4ab2-0856-08db62c04860
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ECO8VDqr+rcEDj3FmMjP0FZxPFWlV6Jw6xmDTpdqfAFAhdhEAosPaXX3zmhSePJs77cq9rAWBytKK8ZRoOSn4W1sF8uEl/rAWl8YaK/P0FvtmT/vIs//YweY3GadBQoOC9d7FjHsiWobCMMiF4QH20ujut1/eUqzai52+BX6c8T0O3t4KcfjA2C7psthY8g/LU45uG12mPuYwXClSWlxcHZCViTBfS4Cn+T6pPCvv4uHHhYM+bWL9z/zSh2vm1sP+tv1osboEuwW/vTL3ITK/ZxSa06/NMp2RJaO9ZGxfqTNYLAqQNDnWjfYE5/YOTGN/qfapH9EX9N1XK3zIvSk8V3e6lYBYcCP2IJ12DKRVP6T4M6s1fV3LzGJXnRJ/2bH1H0n1fMQZyv4GQPyhhTWGtJ+1T8fG8DWogeADHtmmRRWIkJfitPvnRLt2s66axILVYXt8IRZbukG9YBe296I7xqHbn3jLB6UHGOCmP9hcju80ki849W0ANJrSu1GsIwvJF/VNKiHIH41REGAK5dcOhqo7mNrU9NIFotOjqGtYR+WxETPuHfxtU77BgnXZYVP
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(366004)(396003)(376002)(136003)(39860400002)(451199021)(4326008)(6636002)(66946007)(66556008)(66476007)(8676002)(316002)(41300700001)(8936002)(6862004)(2906002)(5660300002)(6486002)(82960400001)(6666004)(478600001)(107886003)(1076003)(186003)(6506007)(83380400001)(33656002)(6512007)(26005)(38100700002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hIEKV5yPPBACono86q9cTfzAPdpODsuP6PDWcg21Gvq5C8mMP4WWcLjeb1RW?=
 =?us-ascii?Q?EVs0rrtDNiHrvHuztdAWZwOcSdYpaiQFL7TMmLCGZ8FOZFIicFJnYPjqjWVy?=
 =?us-ascii?Q?4EnytgX+lR6bL1qa7QrS8T5yzV2mnWg8+NYeYh2+SVubvEmxd3lo2pgDJntc?=
 =?us-ascii?Q?a2tQhJbjLANdS58uw419LmbvwUEKumAxha/D8voNCHo2OpwpmeqLuFESRAn2?=
 =?us-ascii?Q?Bv91Zd0x3HQwCLhLlliZN7gHVyuunO+WrxHcod2hJtwF7jIooikiCBrQwMUX?=
 =?us-ascii?Q?6dY9KS7/IZdesKlAjgmUm6xX9e4TjErO8joMLfYzEIuRvZVwOg74ciw/nkmH?=
 =?us-ascii?Q?QvhOlJwFtchgAJzXfs8uzGpqT4aVepkxqLtMhjyXYMQ/lzNx3X4LVzlc3xgS?=
 =?us-ascii?Q?PuE/wzHZxKiylRqdl+FYp9AwTyuR1BLaMT6hLzTi2AtxZ4i5F0maVdSWuxaR?=
 =?us-ascii?Q?51rCbG2s6MGmCHhaEsmOJBjYmZ12QOUflgHu2grDxVDVHoi8E/nNUTjVgJGF?=
 =?us-ascii?Q?jbuQQ4NW4NOlNPBL7Qra+8N6+2uqXTLRB2Ghhf3VZhlkckaaDesg8rfXqRCy?=
 =?us-ascii?Q?OSHplnv+7EOuG7jNNI8MG/FyremtXPFhh+ni0mIdw3eE+ngu5kW+MYIh4VXg?=
 =?us-ascii?Q?gsTFKAJXhORRNeT3Mx0imJISVKJ7S4mOr31T+1XbTQ+LTOk1Q4uAaHN3AR9i?=
 =?us-ascii?Q?FSgl0ZEFw2QpYkiwdIEUAFXGF/FYIZe+XBgxOJXZ5Y9dgd5j2P6/9+C8YffC?=
 =?us-ascii?Q?ndAqkGQoLhkbduLvxgf6ckIMIKufWnlQuReic5tSjeKNxXU/izb4r9101cj6?=
 =?us-ascii?Q?V3xjQghdbXMbz6FtA1tRpf7i4dYjjvLKHlr/mIZcLHdF/0GLvUCccWuN8Hfs?=
 =?us-ascii?Q?r4dEn792+XCn0bKb7l7yazHfu8dHvFIBMsxUbggp5z2X8dY2UytaIHBz4x5M?=
 =?us-ascii?Q?VcmUBIYZ00/FLTSBS4kF/6vtRjcnuBHqejl+gws8j/ii3H3VPNLpZyvUkz3N?=
 =?us-ascii?Q?l55xL4AKtE00Yl4GXKuxZ+/Ok9CMj2v0pUSc0e1kmlZxkKAu9W8dIUxBB6GO?=
 =?us-ascii?Q?jkGT2asr7S8MUVwxW8rwDzEfqMTsNYdx8rmKxAuCg0spp9ak/b7hMmWiljlf?=
 =?us-ascii?Q?xN/GpibltppwGoFcFa0NP0ZZoXPEvf0sEO7bDidxxHDkPGO7r5sift4Pg4G6?=
 =?us-ascii?Q?JDhOkdvWM4p0mk+bPkkCuNtN0urrC/MOJo+aPBc1V5jCYmGL9p8SS3iC6iLX?=
 =?us-ascii?Q?EUkkaZdBtCWHJLVOpNs2ranr7YDadF2LGqnZkDUSoGzMeEcYvsvvZEVJOX8G?=
 =?us-ascii?Q?BhlsEwlF0NnCe3Ea+bVJftRM124g6cFgE8Uo56N0AgdlcCzcGS8Zq9qZ1bsr?=
 =?us-ascii?Q?PhTmo99/0kPAYSQNjheHQlyiW9iqeD3eJ1GTPCaX85BM4Tn0SjgBPAvdAtn7?=
 =?us-ascii?Q?94iHD3j6olh8HvF/eew7LlMdUzihps3J9mjG3k3fnTqVGfX3LvJ5rAU208J4?=
 =?us-ascii?Q?ilmNxBnXlhKPRVzAAdUHv3hunKQBqe5GuOvmm5fEw9zWdutlZGffXa7NRR87?=
 =?us-ascii?Q?26n1cTmAMfAzUQQ+ahDwSRyoMpYLPBF8rWP4y88U29KmeW/zYdxKMYfV/PEM?=
 =?us-ascii?Q?Yg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e283b0a5-6428-4ab2-0856-08db62c04860
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2023 16:50:19.2890 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VR3G9uSM9X6MKQzl+xUhF6yV84H5jjB09RiJkagrLhSVbavbmQpOfg9r+vVr9qO7nymo7h8xZM351NK0LhTWPe3JLjT25iQGaYQ+Pvq6MPs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5265
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] fixup! drm/xe/display: Implement display
 support
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
Cc: intel-xe@lists.freedesktop.org,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, May 29, 2023 at 05:13:05PM +0530, Balasubramani Vivekanandan wrote:
> Printing HDCP feature missing log at KERN_ERR log level upsets CI.
> Reduce it to KERN_INFO log level.
> Also correct a typo in the log.
> 
> Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/display/xe_hdcp_gsc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
> index 43d3ad50dc54..5c02675bbb09 100644
> --- a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
> +++ b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
> @@ -7,7 +7,7 @@
>  
>  int intel_hdcp_gsc_init(struct drm_i915_private *i915)
>  {
> -	drm_err(&i915->drm, "HCDP support not yet implemented\n");
> +	drm_info(&i915->drm, "HDCP support not yet implemented\n");
>  	return -ENODEV;
>  }
>  
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
