Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31EADC77B61
	for <intel-xe@archiver.kernel.org>; Mon, 24 Apr 2023 19:21:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0D3E10E5DC;
	Mon, 24 Apr 2023 19:21:40 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B29CE10E5DC
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Apr 2023 19:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682364097; x=1713900097;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7V8dfdP/eGwTCsfkXyq3VIItFjgm2DFKpKUQI+/ubAA=;
 b=ZhUzi8/zkmEJOrAByZWEJlsq5gmU02JvGnBUiwm+zOdDOxxdLls3o3Ok
 TfDF3ULkR18beF/DifX6YKn/V4qG0QiQO8kxSd833S409HVAioLaSs7s8
 UyDeX23sYj6G3v1SFTghjSce2Gj0LJCVjZpIXPdl7Xmogmuj/YV+86uo9
 Kn4pVLEPL/T3+Of9k+lBEfHHNmVFEOzlDDymlzshSC8DIpwN1zunWWFmr
 zth8w120Jm6ORf1pInqZxy8SZVdEup1+2iErrxUbLHJM1CLvVLu7Q3BOb
 VdB0s2faKebk3qYeDfoCTe77wmULai11SBCE+e4QJvpaLMp/KcuJGVv54 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="409477896"
X-IronPort-AV: E=Sophos;i="5.99,223,1677571200"; d="scan'208";a="409477896"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2023 12:21:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="837105992"
X-IronPort-AV: E=Sophos;i="5.99,223,1677571200"; d="scan'208";a="837105992"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga001.fm.intel.com with ESMTP; 24 Apr 2023 12:21:36 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 24 Apr 2023 12:21:35 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 24 Apr 2023 12:21:35 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 24 Apr 2023 12:21:35 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 24 Apr 2023 12:21:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dMIMp/FkRYkiHvRq7Ibur+JXO9y15mKPDCkomLvMeCU3I8xs6a33bqzKKipiqpxvGfWL5225AY+oHwFgoymN7wZPPys2aQBCAwYRRywCSUHhhO2Zi5q+Pa991mouLARk7/Pp93dNv6G5bgrQzoCFX5rrc3iOmBW/Tb1JGDYvw7m0V5hacaYWERHqPPHSVY18VxGepwI0OkdkkYLamUjNVOyI0Ng70PERexepeZKYQTXLrJJoN4+Dk3rtJHlZh1HYWPqR0ODTIzT6Wu3v/FT1De1v2r3LBdElhnM3eyF7LAHehU4v7At8Gqvcx3XAJTZk5xL9cyDCwtrX2gA42EUdTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eZCkydDor/bMlTkejJdygwlGLI3FZg3GO2Dw/aUqMys=;
 b=jbGyC+H+ymHtsyh8YcRAKZ8WR+V0s+o2MQra1GECyCL0HLY40H5ijWbOcMpQMrLf4fwGKZj9zeRCDvO12BkQWu2k5z5FPnxz3QRdHUZ3+Rholdkh94W+lWBL0e4rcCOGIPPkAWomfSXrlxfWmXr85jsi0P10tD8UULi8Gs39piM06d1Bw5ZLcUxjZZjrrATra7KEAxcR47Gb3csULByUEeMN81pnxgOmIrSfTUmoC2UU+FuhKZHY+SqJuCeja6wyk9dC4Iy3QPY+ilmc/hFolq/7ifETJIWxx3QcO6OjPNqauo938Cz0P0PsBzcuAs3dmT/t5lCFzbSZSfiTsS8Z/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 CH0PR11MB5300.namprd11.prod.outlook.com (2603:10b6:610:bf::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6319.33; Mon, 24 Apr 2023 19:21:31 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396%6]) with mapi id 15.20.6319.033; Mon, 24 Apr 2023
 19:21:31 +0000
Date: Mon, 24 Apr 2023 12:21:28 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230424192128.GA10045@mdroper-desk1.amr.corp.intel.com>
References: <20230421223258.128781-1-lucas.demarchi@intel.com>
 <20230421223258.128781-13-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230421223258.128781-13-lucas.demarchi@intel.com>
X-ClientProxiedBy: BY5PR03CA0017.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::27) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|CH0PR11MB5300:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e885384-f33f-4c00-abdf-08db44f91c2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PNW1L5ZP8uczSywnKcBv9lfhOc76FXH4PN5tPGSVmy98dL1v8GgEqbMTjMN647+YwLrDJcdDZqTfZm7X2E4f9kz8XXFoaHUaS7fuIcoPCgPEtfMSOZhyeLiFXqDcc6kJa/GTbKjOd/8mNYOSOHO6RzXm0EJ6VINoXxnhfJyeQ7z8JT+0chwtZzIzvAQfQEqFHoNinX5Lr4Rd8Q05F5kp5rqLlwWyvHk9327CWN1hf8vQj7ntDJBquk+bdVPZKSNm3i1EFv3GhZLPkIfXaWx9hv9fLdJID58R5Mdy+cdovXNDU8o49JNI0yTOXkKrZ2ghsBmUJgmG6P6KixoQmckerhmg6FD5xnVaSOR8NXVK/FhcEOKV/B7b4OSF6oNAiox5+tjQI/+Nd8UEOXtXuL67ZQe0T/Vw813fj4/FO9rizUNz15J/jP4Ri3svrprMZ/heliQgBqXT+oQ+RV6wHcelzOpbgfzssmKrhEQYg8gnywUdN4+eEmXfdy+3zurM64expnlwGHrxcXAUKJcw+UEy2NpkwBSX1f6ov9CpMJisL+POUVjsFweaxqa7y/0x2GoY
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(376002)(136003)(39860400002)(396003)(346002)(451199021)(2906002)(66476007)(66556008)(66946007)(316002)(4326008)(6862004)(8676002)(8936002)(5660300002)(41300700001)(33656002)(86362001)(6512007)(26005)(186003)(1076003)(38100700002)(478600001)(6486002)(6666004)(83380400001)(6506007)(82960400001)(6636002)(54906003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FwkNgYKFq/URct/EMe5ceBbczuyOpRvpTr0lJ7DGgl5+DYE7ZrTZkkIyH/i4?=
 =?us-ascii?Q?kryZqcXE5xOmaz2CS8UN/wdzwzKmosMSFFwS9wzc3MAlYXTuWhMJ8+wntebN?=
 =?us-ascii?Q?Xni5RFwlxtljto+kulYBdrrihM9Lmj0ewY+k/T5g8LU68IQYw9GhqIHfNHV7?=
 =?us-ascii?Q?ELn4BGu99uBYVOlnN0VIW7TZm5OHMEex8kL/hCp9HBHo+of6DsRbBMVk/Em1?=
 =?us-ascii?Q?aPerBerqA3I8EtQn9CaAqF5cvL+saa24Ja6E+VM7+P7+wLs4s4kyD5W0JN79?=
 =?us-ascii?Q?k4uW2iRobytxT8PoRmytHl+3p1q7O3cKXIvm3MFDdLBT0uNSCn8FQzxs5D1r?=
 =?us-ascii?Q?pCIlJo1ouHP/NybABRgvIO/cM3P7k/QdQ6sYeV48SsA8HvmewAvnWFT9ILlx?=
 =?us-ascii?Q?j7FtX6Vi9JofY0SEsJmd04oXSzrWtfTE2mx6byCurc0Qqx+P1ugotftpEjyg?=
 =?us-ascii?Q?Au29Vr2A5horfwFQppAgzjKUvT0jkT9hIasLt0u3XiUuBQpuIZEonadGSTi0?=
 =?us-ascii?Q?YGq9sSBJYBe2YfIk+7jMcyS/lSgkPVxbwaqV4mrt8ujFoJk+TzWdeI6kwheU?=
 =?us-ascii?Q?l3YrB22etOIFJGs2paPeXOo46yFCV8CTW+TexYyONIs3MyQefiyKVlqCvATy?=
 =?us-ascii?Q?xigLIx+grNkLIg3nR5d68xQ19LSluVwRlZXEfY/OLdcCJjGKtVnXV8mi+dMS?=
 =?us-ascii?Q?sW7IQiSjROUY8aWlP/Mb0H0i808EOTvsZPtEAL1MZFTQKpmzoEwGXpHbAsqe?=
 =?us-ascii?Q?lqRcclSST3RaOHJoC0hiowvpBqxltHDd1dnlS8nivO7UiBDi36tUj5pktqJ4?=
 =?us-ascii?Q?NYs79mvCWw4K2hsRXu49q/973leeB9zWIO3lGy1KApdQAJlq2dX9fNrvsGAK?=
 =?us-ascii?Q?EdNnJ2NdPHPPRHN0meB3ozxaRbsZq3B7j+wl1U/N+2HGPhBADNT+GC/uU0lK?=
 =?us-ascii?Q?iax1p1PKuUg5CfnR0FFuNAJ7V7hmeMRFtmAOCn8+bAGplOtS4hs7hfA7RWC1?=
 =?us-ascii?Q?jIHqtA3mVUcsj/+RmZTZzW8ADq3bdOQpctMW0KCTDO6KJwEqKFjDprW3OIX/?=
 =?us-ascii?Q?fT7g9ydCI66E3QvLvQfHxtfdZly/QJqN5BEdwwOah5cmy7o05S9/7LIheVBr?=
 =?us-ascii?Q?y8NW2livJ0bRuJ0MQ+k5iQ4Q6gj41bsaz0Pojdm8mwDxvalo7E+50kHwsHw5?=
 =?us-ascii?Q?l/52waY0JLEZZ+ehnZv5EJ+N/eIBwFCX2MbEyNwzB1aPs4yplDGmQQAGUgmF?=
 =?us-ascii?Q?tGcqrcJbtx4YtLSDqQ0QLEZ3mt3783HE38TTOXt1MkovZyZwZ8uZQBOyj6kh?=
 =?us-ascii?Q?c8UHHTYydwO5Aw5SUJQHckq1y3VX8jvW/tujtJQ8QzLQ9Q3gr2GDApglPJZJ?=
 =?us-ascii?Q?jt0yThY1I+qNBe5tpK6PdMehB0YHFU+cO76xc1JxLPujaHV5ejuZRGPHSLMB?=
 =?us-ascii?Q?5dhvqoS63DASicspzEWu/87slYBdIJwo3UuVRSeAEBAYvHWj1rWvIO3hdT5i?=
 =?us-ascii?Q?X3QaVHGdNQZO802mPbtopLdGRIjM2PPQM+98wEiB9UOHhOljGrVa7ovwFtmS?=
 =?us-ascii?Q?04Sgo85XDWrE8R/D7SjedUs/ootJKUuLd/yb3qTj2ds+7oUKgXGd/8JKQiuU?=
 =?us-ascii?Q?hg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e885384-f33f-4c00-abdf-08db44f91c2c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 19:21:31.5735 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2TJ2AF5GkilsUXsh/ZEmKaPCw8QeGMQ/VS+3zBGQmKhfwefTsBCI7vVGgK2afUqZeBXEvrtGWKaac5DtuLPMI46KLfyidmhPUyHeXNbtMt0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5300
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 12/17] drm/xe/rtp: Improve magic macros
 for RTP tables
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Apr 21, 2023 at 03:32:53PM -0700, Lucas De Marchi wrote:
> The macros for writing the rtp tables have some downsides:
> 
> 	1) They are fragile, and when making a typo it's hard to know
> 	   where it's failing for someone not used to them
> 	2) They polute the global scope. The CONCAT/COUNT_ARGS/etc only
> 	   work because they are defined exactly the same as the ones in
> 	   kernel.h.
> 	3) They are not compatible with rules/actions with registers
> 	   passing additional options
> 
> This new implementation fixes (2) and (3).
> 
> For (2), prefix everything with "_XE", so there is less chance of
> clashes. Also, the maximum number of rules and actions is 4, so there is
> no need to make the helper macros go until 12: reduce that to 5, so if
> more arguments is passed, the compiler gives an error that there is not
> definition with _5 suffix.
> 
> For (3), change the implementation to concentrate on "pasting a prefix
> to each argument" rather than the more general "call any macro for each
> argument". Hopefully this will avoid trying to extending this infra and
> making it more complex. The new changes to how the arguments are
> constructed using tuples will allow extending the interface where it's
> needed: passing additional register fields to allow creating our own
> xe_reg_t.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Sill complicated, but looks correct to me.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_rtp.h | 68 ++++++++++++++++++-------------------
>  1 file changed, 33 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
> index a3be7c77753a..53650f09efe9 100644
> --- a/drivers/gpu/drm/xe/xe_rtp.h
> +++ b/drivers/gpu/drm/xe/xe_rtp.h
> @@ -22,43 +22,42 @@ struct xe_reg_sr;
>  /*
>   * Helper macros - not to be used outside this header.
>   */
> -/* This counts to 12. Any more, it will return 13th argument. */
> -#define __COUNT_ARGS(_0, _1, _2, _3, _4, _5, _6, _7, _8, _9, _10, _11, _12, _n, X...) _n
> -#define COUNT_ARGS(X...) __COUNT_ARGS(, ##X, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0)
> +#define _XE_ESC(...) __VA_ARGS__
> +#define _XE_COUNT_ARGS(...) _XE_ESC(__XE_COUNT_ARGS(__VA_ARGS__,5,4,3,2,1,))
> +#define __XE_COUNT_ARGS(_,_5,_4,_3,_2,X_,...) X_
>  
> -#define __CONCAT(a, b) a ## b
> -#define CONCATENATE(a, b) __CONCAT(a, b)
> +#define _XE_CONCAT(a, b) __XE_CONCAT(a, b)
> +#define __XE_CONCAT(a, b) a ## b
>  
> -#define __CALL_FOR_EACH_1(MACRO_, x, ...) MACRO_(x)
> -#define __CALL_FOR_EACH_2(MACRO_, x, ...)					\
> -	MACRO_(x) __CALL_FOR_EACH_1(MACRO_, ##__VA_ARGS__)
> -#define __CALL_FOR_EACH_3(MACRO_, x, ...)					\
> -	MACRO_(x) __CALL_FOR_EACH_2(MACRO_, ##__VA_ARGS__)
> -#define __CALL_FOR_EACH_4(MACRO_, x, ...)					\
> -	MACRO_(x) __CALL_FOR_EACH_3(MACRO_, ##__VA_ARGS__)
> +#define _XE_FIRST(...) _XE_ESC(__XE_FIRST(__VA_ARGS__,))
> +#define __XE_FIRST(x_,...) x_
> +#define _XE_TUPLE_TAIL(...) _XE_ESC(__XE_TUPLE_TAIL(__VA_ARGS__))
> +#define __XE_TUPLE_TAIL(x_,...) (__VA_ARGS__)
>  
> -#define _CALL_FOR_EACH(NARGS_, MACRO_, x, ...)					\
> -	CONCATENATE(__CALL_FOR_EACH_, NARGS_)(MACRO_, x, ##__VA_ARGS__)
> -#define CALL_FOR_EACH(MACRO_, x, ...)						\
> -	_CALL_FOR_EACH(COUNT_ARGS(x, ##__VA_ARGS__), MACRO_, x, ##__VA_ARGS__)
> +#define __XE_PASTE_SEP_COMMA		,
> +#define __XE_PASTE_SEP_BITWISE_OR		|
> +#define __XE_PASTE(prefix_, sep_, args_) _XE_ESC(_XE_CONCAT(__XE_PASTE_,_XE_COUNT_ARGS args_)(prefix_, sep_, args_))
> +#define __XE_PASTE_1(prefix_, sep_, args_) prefix_ args_
> +#define __XE_PASTE_2(prefix_, sep_, args_) prefix_(_XE_FIRST args_) __XE_PASTE_SEP_ ## sep_ __XE_PASTE_1(prefix_, sep_, _XE_TUPLE_TAIL args_)
> +#define __XE_PASTE_3(prefix_, sep_, args_) prefix_(_XE_FIRST args_) __XE_PASTE_SEP_ ## sep_ __XE_PASTE_2(prefix_, sep_, _XE_TUPLE_TAIL args_)
> +#define __XE_PASTE_4(prefix_, sep_, args_) prefix_(_XE_FIRST args_) __XE_PASTE_SEP_ ## sep_ __XE_PASTE_3(prefix_, sep_, _XE_TUPLE_TAIL args_)
>  
> -#define _XE_RTP_REG(x_)	(x_), XE_RTP_REG_REGULAR
> -#define _XE_RTP_MCR_REG(x_) (x_), XE_RTP_REG_MCR
> +#define _XE_RTP_REG(x_)		(x_), XE_RTP_REG_REGULAR
> +#define _XE_RTP_MCR_REG(x_)	(x_), XE_RTP_REG_MCR
>  
>  /*
>   * Helper macros for concatenating prefix - do not use them directly outside
>   * this header
>   */
> -#define __ADD_XE_RTP_ENTRY_FLAG_PREFIX(x) CONCATENATE(XE_RTP_ENTRY_FLAG_, x) |
> -#define __ADD_XE_RTP_ACTION_FLAG_PREFIX(x) CONCATENATE(XE_RTP_ACTION_FLAG_, x) |
> -#define __ADD_XE_RTP_RULE_PREFIX(x) CONCATENATE(XE_RTP_RULE_, x) ,
> -#define __ADD_XE_RTP_ACTION_PREFIX(x) CONCATENATE(XE_RTP_ACTION_, x) ,
> +#define __XE_PASTE_XE_RTP_ENTRY_FLAG_(x_)	_XE_CONCAT(XE_RTP_ENTRY_FLAG_, x_)
> +#define __XE_PASTE_XE_RTP_ACTION_FLAG_(x_)	_XE_CONCAT(XE_RTP_ACTION_FLAG_, x_)
> +#define __XE_PASTE_XE_RTP_ACTION_(x_)	_XE_CONCAT(XE_RTP_ACTION_, x_)
> +#define __XE_PASTE_XE_RTP_RULE_(x_)	_XE_CONCAT(XE_RTP_RULE_, x_)
>  
>  /*
>   * Macros to encode rules to match against platform, IP version, stepping, etc.
>   * Shouldn't be used directly - see XE_RTP_RULES()
>   */
> -
>  #define _XE_RTP_RULE_PLATFORM(plat__)						\
>  	{ .match_type = XE_RTP_MATCH_PLATFORM, .platform = plat__ }
>  
> @@ -315,8 +314,8 @@ struct xe_reg_sr;
>   *		...
>   *	};
>   */
> -#define XE_RTP_ENTRY_FLAG(f1_, ...)						\
> -	.flags = (CALL_FOR_EACH(__ADD_XE_RTP_ENTRY_FLAG_PREFIX, f1_, ##__VA_ARGS__) 0)
> +#define XE_RTP_ENTRY_FLAG(...)							\
> +	.flags = (__XE_PASTE(__XE_PASTE_XE_RTP_ENTRY_FLAG_, BITWISE_OR, (__VA_ARGS__)))
>  
>  /**
>   * XE_RTP_ACTION_FLAG - Helper to add multiple flags to a struct xe_rtp_action
> @@ -338,8 +337,8 @@ struct xe_reg_sr;
>   *		...
>   *	};
>   */
> -#define XE_RTP_ACTION_FLAG(f1_, ...)						\
> -	.flags = (CALL_FOR_EACH(__ADD_XE_RTP_ACTION_FLAG_PREFIX, f1_, ##__VA_ARGS__) 0)
> +#define XE_RTP_ACTION_FLAG(...)							\
> +	.flags = (__XE_PASTE(__XE_PASTE_XE_RTP_ACTION_FLAG_, BITWISE_OR, (__VA_ARGS__)))
>  
>  /**
>   * XE_RTP_RULES - Helper to set multiple rules to a struct xe_rtp_entry entry
> @@ -361,16 +360,15 @@ struct xe_reg_sr;
>   *		...
>   *	};
>   */
> -#define XE_RTP_RULES(r1, ...)							\
> -	.n_rules = COUNT_ARGS(r1, ##__VA_ARGS__),				\
> +#define XE_RTP_RULES(...)							\
> +	.n_rules = _XE_COUNT_ARGS(__VA_ARGS__),					\
>  	.rules = (const struct xe_rtp_rule[]) {					\
> -		CALL_FOR_EACH(__ADD_XE_RTP_RULE_PREFIX, r1, ##__VA_ARGS__)	\
> +		__XE_PASTE(__XE_PASTE_XE_RTP_RULE_, COMMA, (__VA_ARGS__))	\
>  	}
>  
>  /**
>   * XE_RTP_ACTIONS - Helper to set multiple actions to a struct xe_rtp_entry
> - * @a1: Action to take. Last part of XE_RTP_ACTION_*
> - * @...: Additional rules, defined like @r1
> + * @...: Actions to be taken
>   *
>   * At least one rule is needed and up to 4 are supported. Multiple rules are
>   * AND'ed together, i.e. all the rules must evaluate to true for the entry to
> @@ -388,10 +386,10 @@ struct xe_reg_sr;
>   *		...
>   *	};
>   */
> -#define XE_RTP_ACTIONS(a1, ...)							\
> -	.n_actions = COUNT_ARGS(a1, ##__VA_ARGS__),				\
> +#define XE_RTP_ACTIONS(...)							\
> +	.n_actions = _XE_COUNT_ARGS(__VA_ARGS__),				\
>  	.actions = (const struct xe_rtp_action[]) {				\
> -		CALL_FOR_EACH(__ADD_XE_RTP_ACTION_PREFIX, a1, ##__VA_ARGS__)	\
> +		__XE_PASTE(__XE_PASTE_XE_RTP_ACTION_, COMMA, (__VA_ARGS__))	\
>  	}
>  
>  void xe_rtp_process(const struct xe_rtp_entry *entries, struct xe_reg_sr *sr,
> -- 
> 2.39.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
