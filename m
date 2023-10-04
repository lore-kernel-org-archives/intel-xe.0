Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 954BAE7B61B
	for <intel-xe@archiver.kernel.org>; Wed,  4 Oct 2023 14:04:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F21510E382;
	Wed,  4 Oct 2023 14:04:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5641710E382
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Oct 2023 14:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696428287; x=1727964287;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=TCxVFWYGctK7ZX9cJ4OERsVXYeAAcido77bAzYKpFuo=;
 b=bF6ZuQkFgUVuhJ4YVHJ/hTJ22K4KflAPS7Vs/YqCkbzjETApYLt8+HNT
 zd6SAoa5neTelg7Oef88DDFN3PKpGJ7T6iqljGlYBLC4Jy9AwuqV4g76L
 aWNTe5gwqPsXMV0KG68OZuxjUw42OdOcRddhd2mev3p4V+cj/ldXkx5Z+
 feRx/a+GnCVdQxzpDdOlDHlHteC/dOhekAXaeida1YReod5JWGK9gd3Uy
 Pee05BGoMfBsF21E3ZG1h+TbrheWtGXwtvF+XOOMTF46NguY4oYTFQxw2
 LFbigw5XrGNKEDK9l0BiUvKODkZWZwDhWG5JN5YNS7kIh58z9cnwjwswe Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="363446619"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="363446619"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 07:04:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="701117838"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="701117838"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Oct 2023 07:04:40 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 4 Oct 2023 07:04:40 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 4 Oct 2023 07:04:39 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 4 Oct 2023 07:04:39 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.174)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 4 Oct 2023 07:04:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WQdDDvJQkakrqt7ePLGj3T0dEq1xJX12ZFL3I4fw92+sM112Je7m4LtZ10ytRIdnVL5kCMBpXI2+MQXxj0WwkIaJplyLWUP0iQklwnfrLPcYLWjCtivA3cn9MdEYn1f0bMCZerv8CPFqm5zR8/2N/rW1NV6jAGiFezc4EU+Wh/7WfmQxtK4XbOnPnFa73Y6gbZbbucBKQlG6vsM3wBxsMAq7tBgmL3jv4w2ebc+0TWbgSi2zmBHz0mvnbYq0ztzw2Jcnot1rAdOmCTSHG4YFMnv0gzAncBzvcCwLAb0sRDOcL52HPCm9XT8qG584NJoR+5uljE/mvciiw81JT0CjnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LMAfC1Lu0gOqTv+4e3a51Qy0RL7O5gOD2pzNon1OE1c=;
 b=jKRjpY3gP4ZlAKzETE2PFeAJMKRebNA7nrrmV7xSGtq1O69FbwAPFhbhgXX30QDrwSP5h60z1NenEeEBCFOZdunYIw9POS2gXXLdRP+IRxOJYEPlkGSQdwMOgCH+basu6maLB/t9RuYhQ3TsEk0SLX+ksnVGLVHYXu/Q/NP+DuQqetb9t8t8GWSpTicO4gueLYogUqKfDfwEh0nIv5DSeMIBQHsI3w7lSuLD30Tf67QbkH7pDDAAk4FTH6OW2GCvcC9PN69oSDA5uUIfkGXnFwqOUWFgi55yyZQJHnQyj1y7nqL3DnD3/7l1Zsxd4eNFi0nP+XZf462S1G/J1GaJcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CO1PR11MB4900.namprd11.prod.outlook.com (2603:10b6:303:9e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Wed, 4 Oct
 2023 14:04:37 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%7]) with mapi id 15.20.6838.029; Wed, 4 Oct 2023
 14:04:37 +0000
Date: Wed, 4 Oct 2023 10:04:32 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Message-ID: <ZR1w8HsrTCrrfWgk@intel.com>
References: <cover.1696343521.git.jani.nikula@intel.com>
 <1702fbae459c83c9fc483d24957b786332454954.1696343521.git.jani.nikula@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1702fbae459c83c9fc483d24957b786332454954.1696343521.git.jani.nikula@intel.com>
X-ClientProxiedBy: SJ0PR03CA0102.namprd03.prod.outlook.com
 (2603:10b6:a03:333::17) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CO1PR11MB4900:EE_
X-MS-Office365-Filtering-Correlation-Id: cbf9e5b6-4ddf-4de6-13b7-08dbc4e2d7fa
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3m92/9NcsbqzkNIxFYtbb2wjRjDh+ENy/HV9ubSNLsENVAv6d2Tc2IbPxiwY0vJlNk9HZ0qg7GpQ5dHddnUz2LGJ8cMJRVWMuXazyJVupgFEzgs80PzuuJSB4+gTUk8faeZ1XjSExRfAR5K3qz3eTap+1TOI8jZ2mGpgJks3muy8Jn8IA5xXJeW+UBmvSZsUfj6i+V7tRySq5ECUUPhjZteXXMHXudWj8jbIey+JSpJ3G8bhH1QGldgPlNyFDEmq/6SCbCBBET0VMtnpY1nlAcNyYV3+NJyyyxzi3cCOHUwtKz6zzRCI3iX9dkOM6fAUojRUHikcSJy2DWMXg481PHOVUEBnN0IHjYIRzJxTL5hY5dXYJn7Iq14K84oWiNPAoTwgzoPWPuL8f5l8Gm+GD5fe7kGyxjU3Aaeks/3+X+LYsrcP6KujxMj06BEyU3duKYy0N/i7+ko+YOHL8+alkl3O1xCx4aKEDapfOZcUyErEIWG9LQ2ATvLYp0d8/bncV6+t5pzUMepD3VX5zD24u+2lUV9u1igjoSK8KdOZUTZ1NkSXG8G7uf2I/wfskztN
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(346002)(376002)(39860400002)(366004)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(8936002)(26005)(2616005)(6506007)(6512007)(38100700002)(82960400001)(86362001)(316002)(83380400001)(36756003)(66476007)(37006003)(8676002)(66946007)(66556008)(6862004)(4326008)(5660300002)(41300700001)(2906002)(478600001)(44832011)(6666004)(6636002)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wdspxVi6MIrmAPa0uIcbf6TCUc1nJBCQ+6FljroEOzsffD10x30il13ags+M?=
 =?us-ascii?Q?rj2pDFt7cYt89ufhF7KcyXNehquce8T34e3Y2dQlwqts8eFxYPEIKM/tUBLD?=
 =?us-ascii?Q?uuFEqzOm7b6VX4PY6mazYM7PEs+oWTmsBgMuzZTjFAMvkCdCgsd5ZRrA7mCd?=
 =?us-ascii?Q?5Krjthtc1+8DsQe4G/tskybDaN6jlLN3MGivKaHvv3YQ60wFgF3X5C5cWFgt?=
 =?us-ascii?Q?elj3NtX7EqgyGWd09yF3Ilq26MUTqnC+3yLFCao5PQ5iT5a2UN2OWBF1Ld/A?=
 =?us-ascii?Q?VMojU8FT6pJJ6ESW5mxUTxmGhLPi1O1PTrYGJlXZ+NolxN3rtj4nd2Ph1Qvw?=
 =?us-ascii?Q?rPvKNqJTfbC5aSYlEiRcYkh7DN3N1SuWBT6/LEK2wADaziATl3AcFv5f8bVO?=
 =?us-ascii?Q?oMKk5jHhZwE+SRy85AkNvFjylBpYYnkrrOwqT6f6OqRc0o4PIkf3ryg+H6FV?=
 =?us-ascii?Q?Qkarfd4A5dFD79FSjfoaJtCr3vyELLGBztbvUotKRt1kgBVWS5rnkVMo4Rcd?=
 =?us-ascii?Q?uElYXGCyLfEIxdFDOkWSwrLsbDEl9YUE7ykFDo/C5iUoXqOFXgYrhKXX31+B?=
 =?us-ascii?Q?iESLKVbwB5WQoI2IftKlo3OD2z4+lCFnoooS1ypVvRNZIyiXyOVWUOiK0+NH?=
 =?us-ascii?Q?lIw/12eSBsAlEXSXgX3XctMW9k/vSBPJkLoytceNKxYRtVRGTb8/raC0rcj+?=
 =?us-ascii?Q?RWwI2IvF2FPObF9EJuxXnGgk25xqkheCLrA7yM/65n6hc2GEiKLJghZTi9/t?=
 =?us-ascii?Q?HW34NLIZ5wYfRooimlTcp9vdBFrZv5n2AeduZTK/sNQsWR7KeQ3LJZNBy3xw?=
 =?us-ascii?Q?IOvHx/aPP5nEBkTqqLelaQrJcm9N8EUDYuewxkTxgBiNp0a5lxISPIqHnVeE?=
 =?us-ascii?Q?zX7eIuJAo451Y6Bs+DXRX29CSYmcF9/BIBolRljQ4bnuugnxwaizyVgSUQzI?=
 =?us-ascii?Q?UMK+Geb7Vber5lP4dc+2uks1EDWJug19oWHtDr7grycB/lPSQZw9AHjozxe/?=
 =?us-ascii?Q?p4jTO8K2RbbxuhNWb3UDb4Q8qtC1q5TNHhFsoTzs1o+EUOL5LIMg8G6AVcay?=
 =?us-ascii?Q?7JkIFscm9MdEzU1dMwSD1mI3hPG6k0N1ZV3sYFxWrFt86bex/6xX8z4Vpog9?=
 =?us-ascii?Q?WjLjRP8D7CcH/DBqmOh7PMQQYcc6XOc26RHBC06KyiGKfWk6X/bzspXyWSEv?=
 =?us-ascii?Q?QuorqCmkDpwm7z1G+FC5a4uujTSMi0Zfaz3Naa9Q/5Szg+J35YTxrDBuDZAs?=
 =?us-ascii?Q?H9UDVd8Po/hS5v2DlHOKYhk7IUPNFcTZo+PDtWX/nwiIswCLlb0tNtZ9pDwz?=
 =?us-ascii?Q?VBT+D8m9cWjx2WAs5Qb6CRoPkLEg1B/Ec0tQiApZIrgfGf2U9pGKQ9K09LUG?=
 =?us-ascii?Q?LXye8Sml+QoFF+Rii2jTHAGEPxe2apB2wv2T1msI7ztReg83Lxx1OQmsK4Kd?=
 =?us-ascii?Q?IQRNdtLWE6JZDwIcgiRDRG5yiPFmqpRL3VV3wnOYi15+0vLDNNkqOJ48qIWw?=
 =?us-ascii?Q?ZkvtxjvVHF5MqGF+uS1lPB4yyIx7wy7lnJc4gNxQ3TL0Kw/kU+hk7a9GevSL?=
 =?us-ascii?Q?tMQ0mGTCr2EDgKp18KRGE+zqFxWpAY4faQCmrX54?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cbf9e5b6-4ddf-4de6-13b7-08dbc4e2d7fa
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2023 14:04:37.1135 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W7fnt/goU2hIwCcfHE9gxHiddAV3ZUVlP/2ca0E5sBJ8I16+gmQNRvNSQyb1qtiuEkHYRkPInALwNccDBbjKeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4900
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 02/10] fixup! drm/xe/display: Implement
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

On Tue, Oct 03, 2023 at 05:34:49PM +0300, Jani Nikula wrote:
> We have an abstraction for "display runtime info", and it's
> DISPLAY_RUNTIME_INFO(). Use it.
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
> index 7c825f129166..f739858d17e2 100644
> --- a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
> +++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
> @@ -90,9 +90,9 @@ static inline struct drm_i915_private *kdev_to_i915(struct device *kdev)
>  #define IP_VER(ver, rel)                ((ver) << 8 | (rel))
>  
>  #define INTEL_DISPLAY_ENABLED(xe) (HAS_DISPLAY((xe)) && !intel_opregion_headless_sku((xe)))
> -#define DISPLAY_VER(xe) ((xe)->info.display_runtime.ip.ver)
> -#define DISPLAY_VER_FULL(xe) IP_VER((xe)->info.display_runtime.ip.ver, \
> -				    (xe)->info.display_runtime.ip.rel)
> +#define DISPLAY_VER(i915)	(DISPLAY_RUNTIME_INFO(i915)->ip.ver)
> +#define DISPLAY_VER_FULL(i915)	IP_VER(DISPLAY_RUNTIME_INFO(i915)->ip.ver, \
> +				       DISPLAY_RUNTIME_INFO(i915)->ip.rel)
>  
>  #define IS_DISPLAY_VER(xe, first, last) ((DISPLAY_VER(xe) >= first && DISPLAY_VER(xe) <= last))
>  #define IS_GRAPHICS_VER(xe, first, last) \
> -- 
> 2.39.2
> 
