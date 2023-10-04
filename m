Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50BAAE7B61E
	for <intel-xe@archiver.kernel.org>; Wed,  4 Oct 2023 14:05:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CDA210E119;
	Wed,  4 Oct 2023 14:05:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C37A410E119
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Oct 2023 14:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696428320; x=1727964320;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Ae3EELTReevCUYppmh2+H6YYspeRCkZbRHtUoE4w5P4=;
 b=G2+l3c13KHRu/l5wkEySIIY91KBsXid4qcxLtsA4UbPYMF4EN80nRn/N
 LJ7QYFHOcBCoabk7d1fWBEMkC+RuGv5FE7Pnw6HtddQ20tpk4IneOA7yQ
 1agXjC9ZsrJCREtHfxqDChGqRSo+I/wwVdOq2S8tc2mJ6JHvC1Z7VKwVy
 u2X+hWwB/+AhneqI9bTnYd3ZheAcX4apHN3f3hPaVXehMAI8YGZo9+itc
 z9KnrqiygqeNq2f0Xwa56JMh3g4DDf9vM7oZ+95fPUVXta6kMCxYUo3BF
 sF4NWQ3PZiC7xkcLvjeHwt28pSHhLEgIuU4XDxauk8ivQE6PcMvA9AgsC A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="363447009"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="363447009"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 07:05:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="701118069"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="701118069"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Oct 2023 07:05:20 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 4 Oct 2023 07:05:19 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 4 Oct 2023 07:05:19 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 4 Oct 2023 07:05:19 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.108)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 4 Oct 2023 07:05:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gpAXCWxzcDqtlTOeHpfnljEeW0xwYZHMogxERS2KsqpNiqp8EyM0+/9V6v1mLT7DwBv+zppfvwcsHVOoNxKe0b6CiKumEBEzrMDLGERK5DbwtG0rggUBXGx443suoXIorBc7ERkGpzMfjG+43gqvjuzqxA/Vgmy9QnLu7N6Qy28tNOIpT9l4tqXM/LYDhMh41+dbPMVBAunlFwjOJutnYPh0hU8gqhRmelCEwOKZnYg5kEi2WrLsHg/ae2tBafigmHRESzhp8IOhq6MVhXGA3SM7ARiqkNWxYTxVfQXhKH5i3hnw2nKcv+mrEUnNnr51rfxJFw+pJB7vKBLlLLm4Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dhNVGqYeGM3lwpidQgT+kDy6achxnC4e50uLFgzXEvQ=;
 b=jc3taVUYLgwfU09DSWtkAguk45C1Zb+TUq3kXgtbEwK53rjSZiGVZJxi0XUdXmVPKsP7hw+Lf4y5gkqbdPmxeTg5FHG+Nk4+YoBCyCXTyPCkRHVCTb5jxznDn5/fddEfsB0/HVN1oS1kqIF7C9B0Xfk/cmjJ2TUEKzhO8SOgUefBcOVrwSNqRUGwcp8oXGyM4bZb6f8Jt1P3yTehU8fSi/5fHpCbSfEW5a7RZcSk54jgJFV5EN9C4df4Zs/Z2dcdDULx7uTc/IFFFgTCHw/4FFksQpq10ucQ/JcGdKdiAKKEcSxbnqZGKboKB8h+T+A80UE3vakM+9p9TNDS4PVCTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CO1PR11MB4900.namprd11.prod.outlook.com (2603:10b6:303:9e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Wed, 4 Oct
 2023 14:05:13 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%7]) with mapi id 15.20.6838.029; Wed, 4 Oct 2023
 14:05:13 +0000
Date: Wed, 4 Oct 2023 10:05:04 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Message-ID: <ZR1xEI1M6ZcTWFF3@intel.com>
References: <cover.1696343521.git.jani.nikula@intel.com>
 <023995e12cd373ba59ca09ff522e67cc87cb9f58.1696343521.git.jani.nikula@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <023995e12cd373ba59ca09ff522e67cc87cb9f58.1696343521.git.jani.nikula@intel.com>
X-ClientProxiedBy: ROAP284CA0005.BRAP284.PROD.OUTLOOK.COM (2603:10d6:10:c::10)
 To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CO1PR11MB4900:EE_
X-MS-Office365-Filtering-Correlation-Id: 2cfedde9-ba25-425d-3f9b-08dbc4e2edac
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fyT+n3Djzu3oSo+IxzitD1qodG8VVKzj7SwagfIeSZAKJEwk4r4K30G9sfkeF7agTM+Gp/6lsAHYjB0+6cHLPHaNELf0f4vLIqFA0JmoO+IlpAt2DlOZ+eNZRi7Hmr+/bEs1Hu/xYgdBsm43ex6EYogcIIi+K8YC7U2LtzKmL4S0xgRODjGYia91FEDr2cSloXQ3M05GChBRpWFpKhy8TSIczJibVBMjeTT10hFFmtfrg1vtR1XimaeA1F+1+UkqkcpPMx5vCSfiVqL4CdHej2dCAttVXCN3Zkrk7wQ23Mb3uWDLDSCY9jGbUrbVBWw/sVwdwmCJFpOVRRYCIKsA9x2ndLXX56I8xp8lKt/9LpktgZxErqVaGRmYNUYUWnsw3iL0L/3yIM/j7k1WEgEAtKxiWaWvKPJN3Bj4nKYExJCFT8I5t02hrLINUvFuk/yS4FgQW6pohlT72Ul4u+Ia5sUDp/LNu7w4CmGGu/3sr9p8351dtNgWFNbZfYRovcHgdro5qlJAvvzqUpfMHwx9dMikIRI5woov4zlfyRH90wCJyQa+zkS3Tuhs+lIEFbjC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(346002)(376002)(39860400002)(366004)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(8936002)(26005)(2616005)(6506007)(6512007)(38100700002)(82960400001)(86362001)(316002)(83380400001)(36756003)(66476007)(37006003)(8676002)(66946007)(66556008)(6862004)(4326008)(5660300002)(41300700001)(2906002)(478600001)(44832011)(6666004)(6636002)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?u8AH5WcN1xU+PaeOcKQEe5bjISsOz8Zi7/nIenG8SfyiXS2/olnGLCITynR5?=
 =?us-ascii?Q?64Ic27dI5Vs4RdL8nSBhjvr42DHYULufVDmz4xR4gxcO2w32EGLSpNpfcsaV?=
 =?us-ascii?Q?lYgHdQWHiRNSYSexAM9apnFVCHSHKSzU/JUR2tDkf1Kp2k+AwmJsdXa/7G+1?=
 =?us-ascii?Q?DjYt/xJpeBUda6KKOwxkSacRU+KAMCPsPzL7B4j9EeJ+b2UmKFwNoD13Ep0U?=
 =?us-ascii?Q?N6HSfZWgf7+RTkjf0L5tKTJH4js/yZhgforYVAjC52oDopblR7+gXjyQAxSN?=
 =?us-ascii?Q?9/tG5UkjE5D9Gyl/tjQzmTzi43v7acJGAdkx8PHaWFR74uGVx/3s2o/OXzH2?=
 =?us-ascii?Q?dJHOEaoR0qtTRKIrIm3BMsghCc7Lk8QNY0fAoJrQQvoXo8iFzhEW720msa77?=
 =?us-ascii?Q?ZYptVcfs82UHmnycnIEyyCWeba9fOYWapUxdFWzXIvfV1GG7khCRR7ihc8Gp?=
 =?us-ascii?Q?PCHM66k57hBhF4/tMV4pVMjBrYtixNUXH/cBiHzrBeeZ2iLcbKxVrBDpR369?=
 =?us-ascii?Q?KzMLSB0huixKOso2Co4oIxTJco+e+x+GfGphnqBYsbTJZaGMyRmSL+HHS01w?=
 =?us-ascii?Q?2WZsMu43+8K4R5BFR81x6vGZdbKcS31TIYovn5LpvlUdoeB1MqWGtjCWGtyp?=
 =?us-ascii?Q?zVZj7xElD2VMysZK20GRVwhE7iTbV/kr+EpjM1q/CZS3LouQ3cVERisKMHng?=
 =?us-ascii?Q?PN3uUoKfuWjegpIkb37u/pfqqPUbHD9y1IdKnzcWAyxmrfZ0bvLJzklrXzjP?=
 =?us-ascii?Q?QWhlJ9Y0UPW9Q4Pl1kXeea3Q26HL8IMdW6kTf0Q7if3uC7ELDZgXZ6wEq9wn?=
 =?us-ascii?Q?xfLlXWT+jOZUd49UAmHA3G0coQ4jb3VnRHVrTts77RI7Kp7xz4Xz1Gb3oVtY?=
 =?us-ascii?Q?E4vcfur/dA8u+TkCSBYvZ19yPR/V9Pc7nnHhXnukq65IS4kaCecH4D5Nh0IG?=
 =?us-ascii?Q?yQm7q/Hj9wUUbaGbPeNCTv/6l8HV7XiIxvy9nUVdKPrvpzkTEk4n/ksvxTtE?=
 =?us-ascii?Q?S8tmq720JtQcIGGc5YwnMjRGNmwJySFt/akpjRCm3fGYEQx2v7pTxrpN7O5W?=
 =?us-ascii?Q?fSIAviJthns2M0XWIwMCsANkjm7fo/x2ezu+6Lt+AYQbGQIuGhED5sN1qZDN?=
 =?us-ascii?Q?kFIT2GEw84eCVWNC2S6APw1f+DZjEUJuMszcpRWO6FDRaSqDK44Eff0R+lTQ?=
 =?us-ascii?Q?Zeg9lpfvS7gl2o5Y64/eStSGnm7b5DyhjqnohrR1tkkSOqyzZQZYjhdY7NOc?=
 =?us-ascii?Q?yXiRPQ5ACASSRcD/1CUXvul0ZkFAi7J+k4MrnrnRqjU/R3mkseOoo9B5Pmp4?=
 =?us-ascii?Q?O5JLaQ/mODgxPGHIw77uqHmxpHRfqXuUuLEYrEgLiqCFIEF4QhFHme9UtwUp?=
 =?us-ascii?Q?MamfbJ1XYDTLJ82vzIdP+bC17XH8F4mTxcPtta7aSrFLNd+0W7KIvQSFm2/C?=
 =?us-ascii?Q?PAkuDdWOKEdINeMI+mp6DJ/EKfDONyuW56d62NQ8HFo0fVi4s6u8PxIGC8F8?=
 =?us-ascii?Q?URpavY4tbhiZBbA5YN8QyX4sx7ldecoL66evpwhpBbSbb7LnbY+eO0NRf9pS?=
 =?us-ascii?Q?+f/MNY+i8GI4PSlljyOacRdpPsRn38PazkDnXHgb?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cfedde9-ba25-425d-3f9b-08dbc4e2edac
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2023 14:05:13.5692 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DuGrwJRS16/l3fB2nB+vq2Pzg7XOIAgCZbP3r0RGpy2rawTXiTGFJpRKmPQ8dleouHqHkiq0pLTSEdFzd3vQfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4900
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 04/10] fixup! drm/xe: Introduce Xe assert
 macros
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

On Tue, Oct 03, 2023 at 05:34:51PM +0300, Jani Nikula wrote:
> Do not log or reference display details in xe_assert(). xe_assert() is
> not used in display code, and referencing display details in xe core
> just makes the code juggling with display integration more difficult.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_assert.h | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_assert.h b/drivers/gpu/drm/xe/xe_assert.h
> index 035e6a44afe6..34c142e6cfb0 100644
> --- a/drivers/gpu/drm/xe/xe_assert.h
> +++ b/drivers/gpu/drm/xe/xe_assert.h
> @@ -112,7 +112,6 @@
>  			"platform: %d subplatform: %d\n"					\
>  			"graphics: %s %u.%02u step %s\n"					\
>  			"media: %s %u.%02u step %s\n"						\
> -			"display: %s step %s\n"							\
>  			msg,									\
>  			__xe->info.platform, __xe->info.subplatform,				\
>  			__xe->info.graphics_name,						\
> @@ -123,8 +122,6 @@
>  			__xe->info.media_verx100 / 100,						\
>  			__xe->info.media_verx100 % 100,						\
>  			xe_step_name(__xe->info.step.media),					\
> -			str_enabled_disabled(__xe->info.enable_display),			\
> -			xe_step_name(__xe->info.step.display),					\
>  			## arg);								\
>  })
>  
> -- 
> 2.39.2
> 
