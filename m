Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C61E4E7B61B
	for <intel-xe@archiver.kernel.org>; Wed,  4 Oct 2023 14:05:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 965AA10E382;
	Wed,  4 Oct 2023 14:05:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F408310E382
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Oct 2023 14:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696428346; x=1727964346;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=oO+Qyt031F+DVYl9vClnC2CKpP3FLx/L6frb/GGJUGM=;
 b=EKXOQAvUUl3sFNrlvbkrus7facl2POi0cDgO2MpoSNj9NsI9wyd1dOhe
 /GwQFfbjYOWSD/fsfH+vS+elCAeTya+g4aPw5+qjym6l7P/qEg8Uz+xBt
 eqdX+sG23y2cz2vj8Tfb3o8KnP6GSboseaq7N2oLFCDKjld7YkFfWJ/jF
 jUIGEleJ+mb3HFY0mEJ/HLMuLaMIMSJYsvGV9+JCVXhDyCXd1q8J0Rwk2
 S6ny4wFeusH124Vj4aHd5H4XHWXQTYPZOa1B+AlrYXQo4J52HB1Sn3J7R
 G8RMk+JXRg4jQML7IItcslPxSg78hKTIJ5edpSx6qZ59197QiZ01POqlW g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="363447263"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="363447263"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 07:05:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="751295825"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="751295825"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Oct 2023 07:05:43 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 4 Oct 2023 07:05:43 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 4 Oct 2023 07:05:43 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 4 Oct 2023 07:05:43 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 4 Oct 2023 07:05:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UUhK+/DaOENO5Z6XyqPpWod3Y+lU8y/WtBsth4VGuWJYpqHgr9vwjHV/97lOcTnJSASjOUEuXU3GYBXh5vYZwndJuENCmh9y81Pyxz0M8O+SrEiwL07/t/wRooSB8mJhb8rWHrPAF7ShL8sPtW0MgBApNlri+UqBqh5CD9dHb9EilJJPyTg+zS6q45ikFaLn2O8khHCKKs0vngTtOaHB/zVl9OUat47ba6xAqK+XQpLgOe++eKugrLIITT4rALNN5PcM6DQsgzYXdFDPEmefsqjjdTyvIMYInf8jdi5A7iHMNhEddeqE48aP79o4573rtU7be9bcT0WKOnsysU4zBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XliKqJn4nVYFiPBkwpd+1zIqjZ2S9EyGwRoF49Qcckk=;
 b=Bz7FPTp0Do2skejAVNTXxpiHgEj9O0EGN3bpFLaMDtY/DuG6uVQ4oigAtDF56t69fIf0RvA2NPhuyQy+wD3Pm/NudqnyEjfRikti0+iBCaDRnqqjAzR0vYqL5bf/NGLQkD7mS1uiBUOg4qjpvq/Gi9fU6dMnlO2eGSpy0XgbJYhd7Y7Vqmtdize6lxQZyqWYhvpZzv1D2UfjyaWakXXdi2klppRi2/vN3I7mok/E8QoScot1BajPTO2+QMwVSug0WzpWhskrIuemMlFqIu1CoYo9UQU5yNeZtzwAIB5Xo1GgA+FpScqCvv2KFlldONahPySDUf8YFDxar4Eawyrrrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CO1PR11MB4900.namprd11.prod.outlook.com (2603:10b6:303:9e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Wed, 4 Oct
 2023 14:05:41 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%7]) with mapi id 15.20.6838.029; Wed, 4 Oct 2023
 14:05:41 +0000
Date: Wed, 4 Oct 2023 10:05:34 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Message-ID: <ZR1xLrGkTRDlkOlH@intel.com>
References: <cover.1696343521.git.jani.nikula@intel.com>
 <224dfa5edfae9bf0867f8372059acf5eef9dbdbf.1696343521.git.jani.nikula@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <224dfa5edfae9bf0867f8372059acf5eef9dbdbf.1696343521.git.jani.nikula@intel.com>
X-ClientProxiedBy: BYAPR08CA0013.namprd08.prod.outlook.com
 (2603:10b6:a03:100::26) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CO1PR11MB4900:EE_
X-MS-Office365-Filtering-Correlation-Id: 36e8f7a8-32c8-4966-7e5d-08dbc4e2fcac
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IX0Ev7EKyqDxxPS2pu5Rnn+64wO1MGp+OUG+GhJ57nbsCmYvf9A203aGpPN5bY2fAKcTjoz10v3XGTQ4HWA8mxZrYzmTANHo24VYU9305/2w7Vib/1PAuw8GQj9ByFJ8HUgQIgmsO8ePIIlnQ7D+F7QdhfYQnPtfZDglNcz3nwAPcgGy2H2tXxe8Q/OCXpbQ/3Mu8J9U72yq6k7Q7ca1Z/Ecj27MZ6rxkjPcMTUerUapi1pFEoNBSrpEyhjbc1HGw/R485gXu7lO5+26U3ToGaJONSZ84m3wir7paxiR/4+DFlh4NuSdh+EkSuXtDoBFi9L5rq1UVgyY44h21K050yS3m2scGTQqDL0SDSkzHo3Q28J9gXZngwzSWuH4/5WWT/WJRDR6yapABNTH030YtceDsac1D/5BYEqlpAIttrakwWkidT2yjodhpLBjPkPxdXrjZbdjfus14rKZGauih7n4fiBX9scpUfDfu9r9xAoIiW39rg9E07mh6VVfmTS+ZDsZMVbu5X/eiJnpw2cevPAJKFFrvY9HlPJAsnyKUPGziZWlqkbBE0B+C3DW7Yiv
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(346002)(376002)(39860400002)(366004)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(8936002)(26005)(2616005)(6506007)(6512007)(38100700002)(82960400001)(86362001)(316002)(83380400001)(36756003)(66476007)(37006003)(8676002)(66946007)(66556008)(6862004)(4326008)(5660300002)(41300700001)(2906002)(478600001)(4744005)(44832011)(6666004)(6636002)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?dJtkDVyhm/2AgN4WFOCrQyIq15Ize4Aa2om24DUE6rOeOECqdeKFWKoOT8?=
 =?iso-8859-1?Q?5HvUGJReAmocdFF/uqgmjjkLfH/sCy1klHEura8d5pR0IcPXiNoPNEtO67?=
 =?iso-8859-1?Q?IIdeHh4VGuvw4r9HHlEM5gzme+okRkCyA8GBTPB2ZOD/XXE7K7Xokk293m?=
 =?iso-8859-1?Q?GrfMo7kx+ZivG0ulv7RqlQy2wpe9748GpJhtGmqaK20AE45Ffs32Tmc/T3?=
 =?iso-8859-1?Q?L3XleYegfvrVjqbB5t8k4NVq8iOsrYggKwRaYHNqzUeeIb6Iv8malvhrh4?=
 =?iso-8859-1?Q?Gplh7FgSD1xmLSmsbOWQigBy/SqsQbLOQzyd4TKlZs4wLqjVk2AzcKngcW?=
 =?iso-8859-1?Q?bD52uKlBmAgN/h4vLjdfZkUCrZ4ynDqtVpJPlpfpVmKrDNXQeCAP5f4nW0?=
 =?iso-8859-1?Q?ZHdAuCBYh9kFXkjT7qWtcFl68LMR7xT4tScHgvUFMtM9Cue94LQOgpSKSA?=
 =?iso-8859-1?Q?QzLxc+0b4w6pB9LlLNvKLvf1oEjDMoHrad31Rg8qAuI44cmvRwxEwDoQFi?=
 =?iso-8859-1?Q?Bi7bq882eBltz9QdH2KGxcjlQTIWqJaPQvGFVQW6VRPKqjhQCEg/NKGDMF?=
 =?iso-8859-1?Q?qSSwufAmuN2N8cuiTNqYRzsLlEiciCuB+q4EQTnCj8sBJLNKRwQIHSF3Yq?=
 =?iso-8859-1?Q?ORrGqYt8KT8i6XG3jzrObgekunt58Lxk9jHES4Fo0fnDbd60cWOEJ+AALJ?=
 =?iso-8859-1?Q?eMbx7QRIuEfqX2xN4rIyeBXseMXmAxS2SSD7bIIWwE/Rc4q861203iH9Of?=
 =?iso-8859-1?Q?KnsKHYHLxTd5x8+BsCYZyDCxnn6emdmX43wg4sTBxbjeMgBiC0/siOrXpa?=
 =?iso-8859-1?Q?fYBmoMTKl+OwlZdqO5WDi7gRxaoqJBAngl9lhSPV4jPXv867k9ICs1Notw?=
 =?iso-8859-1?Q?gCy9Mn0mcJACgI+Efvk6gavhuSfWogJdEXzyzaJAhHZ/Mdy1kLFbi7I0gw?=
 =?iso-8859-1?Q?AAPJHMW1pSgLBueOxZV0xDdInP9nmPnuuzw0v3a241t5IBGBvV2l9li/Y3?=
 =?iso-8859-1?Q?XHiM5W0DcCvN5SnD+11LzsB5iue8b/UbNiZgzRBOymWCbj8Kzq5JwmtzHP?=
 =?iso-8859-1?Q?4ZnEWZHnZf1dxZbMqznK3ADXSdDuet0loHWkM6JdR2YGS4CeK++/I8mPAf?=
 =?iso-8859-1?Q?xm0WuodxBjTomHTWXkDv9FtVuU6ZnUoXL1KdXIpq2PZ5GNFGlzK0i3qe7k?=
 =?iso-8859-1?Q?/Vq5EuauL+X5Ewsg9xbkhKsZi4yxU4RlMzsH6859OT3aR5bBhYNywdaiER?=
 =?iso-8859-1?Q?o9z6Y6kd68zscoTybPCZ7li27/XxfbCf9fpAoTcSSO47dR5+AAAd6B+Cqt?=
 =?iso-8859-1?Q?t26g/Sl8iyj3JfgcDEIjqJvzPcjCPHagXb9APEBa0dVvcm2GE1/mk0xhuk?=
 =?iso-8859-1?Q?wJbFKAtUVaeS2QOcCRxJpsd2k6e49yOaTWH2i+a4xAmGhBex+tasz7CgJd?=
 =?iso-8859-1?Q?c2cTc3wGokxFyLSnwKivkPGEu2linQw4tdPm9UQsE+eX5TKSyW68FEFtUU?=
 =?iso-8859-1?Q?rjNQDaqagsC1aD4Iiy5fWs6NY+03UONJa3AtFHyupK+rhlEn7aaJ+2tPQn?=
 =?iso-8859-1?Q?oCFfxD0ofZNNto6H/TczE3MtiSIW43j3aBE+sZedRVP0tsQAzSy/CfZcNk?=
 =?iso-8859-1?Q?/KCEYUkRbY+quagA5ZnOQh79Yyra9Y7ZX1?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 36e8f7a8-32c8-4966-7e5d-08dbc4e2fcac
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2023 14:05:41.1069 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mn26/gw4ybfnPXoxqWHadNTQsrtgPHr27em7OhHaByAtdTmZqFJLqeMWp8fGVdOsHuMwIBxSlZN8dY1i8JA+uQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4900
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 05/10] fixup! drm/xe/display: Implement
 display support
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
Cc: lucas.demarchi@intel.com, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Oct 03, 2023 at 05:34:52PM +0300, Jani Nikula wrote:
> Checks for CONFIG_DRM_XE_DISPLAY are useless in xe_display.c, because
> it's not built when CONFIG_DRM_XE_DISPLAY=n.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>


Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_display.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
> index 68729997e1fe..82d2c42629ce 100644
> --- a/drivers/gpu/drm/xe/xe_display.c
> +++ b/drivers/gpu/drm/xe/xe_display.c
> @@ -3,8 +3,6 @@
>   * Copyright © 2023 Intel Corporation
>   */
>  
> -#if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
> -
>  #include "xe_display.h"
>  #include "regs/xe_regs.h"
>  
> @@ -438,5 +436,3 @@ void xe_display_probe(struct xe_device *xe)
>  	unset_display_features(xe);
>  }
>  __diag_pop();
> -
> -#endif
> -- 
> 2.39.2
> 
