Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AED8C001DC
	for <intel-xe@archiver.kernel.org>; Fri, 14 Jul 2023 14:23:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CB9A10E894;
	Fri, 14 Jul 2023 14:23:41 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E54D210E88E
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Jul 2023 14:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689344620; x=1720880620;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=RChyTP67Cv8gYclSi2B5CWj6R/Pps+r+XmQ4rEUVpPc=;
 b=myq3vSSgxKRTPk07O+HcRtx94cBNaX3xLKwcviUksh7BVWqVDgPeY0bw
 QNL9koAHzqOJKllE638Dh8iT8zt+F3+G33BjBnn6oKyVoRUpbQ+oQjKhx
 Q+4eiY8bO1N8I2WFdQRcDFVRoatdU2MtwAnU1e2imExM1evqWjA4IrQtY
 HiXOjAA82YAasG3bzLWIMm+vbicW3IsLVR+CY4DtmR/a1K9/DRiT+vphd
 IEnCP6HRYcaAzZhebXwrob/fc01Mtf4cSJTqk9P+YkodAhC4zJhzZaWlE
 y4ah9pDBlflXQSrL5PEw1Hw+eYB4Sgo82sshlz8KHR6vGNpSADol+Z9mr w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10771"; a="431657863"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200"; d="scan'208";a="431657863"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2023 07:23:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10771"; a="1053071487"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200"; d="scan'208";a="1053071487"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga005.fm.intel.com with ESMTP; 14 Jul 2023 07:23:05 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 14 Jul 2023 07:23:05 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 14 Jul 2023 07:23:05 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.109)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 14 Jul 2023 07:23:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a5HmegkKdWVRYITChE20hvfYdHEaqqm3PinLaJM8fRbEgAG42dSbrG1L0ugUzxVvzVkTHIr97DjCSyBAUmK00s1XXkaj/Vv2p/qOPvbdzT566irLhM35P2khbVzwiXDBgCfREoq0PPH9ydIj8edQjSNwB8kZbtTxdmUFnVoCf+KRPYwTYmqc7sQAVAfzQafSj1O1O30cw9B5aCaLJXWOhHQsHfiUNtDQJYtLi3ZNFKAUTufSjc5S8oyvW9y1j7/b073t34VD3IK8DTU1axx5HLdUAPPwzDgDm5UV/vlL3Ilf1vw1n7tE+SBRr0rn2T/3Yh8aeaAQcM7OkcXUADPg5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zvn27pRhGC11N7je81tG1J9moZU/RGXC4MMnIsTRmE8=;
 b=IK4jNHXdjgYK12Qa3IPBdQBDIPNjgDPrahDMyRyZQNw/3xGd1rliSaq6BE7jKU/jWqfC8NjdDondUT3xQTWmi1h8mDNeozQSPWZRZ6GxoesOboKtxIvKo2GM4pn3TFSiUMDvK9kFY7OmO2aac2MC1DpfZW2B+kCtwZoWWWiCL8olGLep5UTBxKpOriv5b1pGtYiQKUAjL7f8NXrJmsHuI76pa1q2W6sY4VHADasgodRRfcqBHWwpHtyr6/mmhUE4j0rmwqIBvd23G+ynQdeKs+x/1Bh5o2mLD1VOPu5dIXBSKs9jF8U8k6in6VOkUZJ0BE4s4ml6jRFItV1QP8uMEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB7383.namprd11.prod.outlook.com (2603:10b6:8:134::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.27; Fri, 14 Jul
 2023 14:22:59 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::c65d:c846:f197:3ca5]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::c65d:c846:f197:3ca5%4]) with mapi id 15.20.6565.028; Fri, 14 Jul 2023
 14:22:59 +0000
Date: Fri, 14 Jul 2023 14:22:09 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Message-ID: <ZLFaEYIysplloPdk@DUT025-TGLU>
References: <20230713150611.7-1-francois.dugast@intel.com>
 <20230713150611.7-6-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230713150611.7-6-francois.dugast@intel.com>
X-ClientProxiedBy: BYAPR02CA0049.namprd02.prod.outlook.com
 (2603:10b6:a03:54::26) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB7383:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e1ad953-718f-474b-91af-08db8475d351
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C+kuRjHTTjL+L0u/pWzeH1IyXIAfuH8N3FT7SSgbJkNujPFAX4dIf6E1+vcivuJ/L6kQXqf5o7IbDADX/WnXStd/GhqdRHwSMZYl3+HtI3mexsEOCvGqGPeIe6oBp0FAoAHayAhRtHweDdwFKua4Z7LEyRN2nHD2s89igEajfjjUUdN+6DLkkoUtfC109B/DpXgJ/g7GRtOCFFaM/oUpSL+j+UA0KnbsySjQKX2Eh1bn3WECFYPyCwdqnsyENVIoSV0Nt/h9sj0CMwmUF7NSxBDHNgyH/7HfAoCGvZYooKKoFXbqcDaHiro+TL4U34u856UPiCkjxGKNr1uO3ckge1R7kRBdwF893h1dtgicm8WJKtmTvEEP6GNgNuYYAMqGc6uRygjwfkjKbk9usvNQb8wzEN9xUXBOMqxnaWZ2fFkSq4BWPxPDFH4nqYXZmja4cmqzkj0x1/3O3+nZ0ptwQ48MhC9O0ekePhqwQsCs/DDNTaXKmqAmBOWZh7yonJPBc3QRwxYSbDDHCU52otmYYJUgx7yEr37ewTW6Ig79zD85Xvflj4ioubXRKBiSULOz
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(376002)(136003)(366004)(39860400002)(346002)(396003)(451199021)(82960400001)(478600001)(9686003)(6512007)(26005)(6506007)(6666004)(6486002)(8676002)(8936002)(44832011)(83380400001)(6862004)(5660300002)(316002)(41300700001)(33716001)(86362001)(2906002)(186003)(4326008)(38100700002)(66556008)(66476007)(6636002)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iYDPw2tyyocJPZ96+tIoOxlZ5BywRYymgvccG6T1h8r8K70MssjG9fQH5HrQ?=
 =?us-ascii?Q?OSc9MaKPJWpfwf7/uC7K7QBMIjNtTFrkkgtB+A9nNxYC6lzHQelHyQL7lXh9?=
 =?us-ascii?Q?KRJg15JOr9d9l2MfclZfI7x1VxlFZBhwyOhu1ShnI2/x94c90ipO7jBMegMF?=
 =?us-ascii?Q?UeDpaPdLqGja7ZtYfy2Ut0j4pjSG8GjRmMuNnoPgdZwpHB8Z1ELtvCXShaQs?=
 =?us-ascii?Q?2KQ1AhoUFRCakcIo2nLJD+W/uPkbKK+qzXacT/PuZEmaItYBW1trKC9ZSAzJ?=
 =?us-ascii?Q?ZySrzsXONNPnWPvEUkRMI3V+e4zdjltLc/oXhVin8dU6pfKmFX+i8kXHG+n9?=
 =?us-ascii?Q?zggYElBJ/fe8k2NvMUQnq3dp21IJyBq6tO33Jj2tRhKm/HIQv9mp6Lfg+NX0?=
 =?us-ascii?Q?PkXxNKCkC3K4dnFfGRWw8iE/TVIgexq9tvm3n4c8jNzSsnWxjF8INGBJa2Ql?=
 =?us-ascii?Q?kAmSIIJyQFNQgG6HOLcICc99Xir55eAdS/KEk+vceydOVXMSh+xV4U+aGhNh?=
 =?us-ascii?Q?w9t3b9k6s3ysIDNTje0Bau2YqIbUOINcino4hYlEPrJMqdJPuwMRCHnBB6Z+?=
 =?us-ascii?Q?upcgeGk+aNsAmW0P5bmx8epVh3WFQtsK/HYhJoGcy08WVW7Fg/UeLrANyrif?=
 =?us-ascii?Q?rAfXt5m60JaS41KAiDR0HhpYzXpfpmfoxyr2pF0lRbI412YAyNBOttvMknqL?=
 =?us-ascii?Q?zG+jMQkb5rFYTI75XXDxX9nQkNKrwcbEexSh6s1MtEJRPzuXgQSfHCaQAb3n?=
 =?us-ascii?Q?JgCrRsXU1npqcb+uxN5HkwPsWE5OcWd7k9wEm2xRuqUfEXd2ALRkJZ3FNlkD?=
 =?us-ascii?Q?WEHPgfm0lkW7gIpfcGMl65VqJa10cAwgJCnxCB4ExAOb4vwXNxprjwZSRZDw?=
 =?us-ascii?Q?oQYuVdv3vP2WIQxbQiQ40IzY00gE0aaXRhm+0s04cVAtN2E3PHf+2AfGVsFW?=
 =?us-ascii?Q?KAb07MN09jqnZVYBmxCfxVknLD7XQN3H72T/EoeCeq+k/QvZtOeXl3An487O?=
 =?us-ascii?Q?md4GoOsul3uLs1Dpr/QOhKyTxQG+xc4SKiDYGX/Jh/AV6bvGUgLq5gq6w9SC?=
 =?us-ascii?Q?JI52xFe4DG8htTut0LTl+bBmWXTwh4LNlEHU4WEEp6EvMMo/7APjD3Gqc9LF?=
 =?us-ascii?Q?xf7EH7fVzgsf+HVtfcMsNihu5IiP5GTjlDVw/byH7k7rLX75uVM4nY2oAI8Z?=
 =?us-ascii?Q?/6BrLeAxQIGceXQj+BfkHlDBeUnZ1djDdu8w7iu5nAzkXWwRvv7q0ZbYOUI5?=
 =?us-ascii?Q?DWGeJih9WEEA5Ymf/Dav00PIHAxdJUflmr9KW7IDHJG8VrHBG75sRMJXZbLS?=
 =?us-ascii?Q?XHsRKj8vX1kBprGX2tQkkulNNlJOTtejmUPDTL8RVjdT6EpF12lj15C17UEM?=
 =?us-ascii?Q?Y26tbxtvOGCJJ+LAUbKROZhyuhjiu6zyT/XCi2GbxdHDnTIaXD8Qgl1IVjLD?=
 =?us-ascii?Q?lciKv5qCn/GilaGixae0e/+6EOdwPWz+InUjaR9W493Jt8sCnBMK3UpukgWJ?=
 =?us-ascii?Q?JH5u3dLjFq/9adB6/oYZFzvZtzQTgXeCnHkkt9Z/NLJwv9qI9WTz0K2H99QR?=
 =?us-ascii?Q?on7NNwOGXuIbrQAIB/xvnuuwtn0kN2Q6JeY5adyXgTzckIOLgi/4qCKdMbJj?=
 =?us-ascii?Q?Hg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e1ad953-718f-474b-91af-08db8475d351
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2023 14:22:59.5803 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VYklnE6J2zDtN6qgKsnQFmCqLVAGeaNLRUvO+LHJqw8niGBCMNhx1Aojm+BERbrrlecMRPGYVJzSvphvwLwIaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7383
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 5/7] drm/xe: Cleanup TRAILING_WHITESPACE
 style issues
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

On Thu, Jul 13, 2023 at 03:06:09PM +0000, Francois Dugast wrote:
> Remove all existing style issues of type TRAILING_WHITESPACE reported
> by checkpatch.
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_wa.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 5eaa9bed9d12..21087f7a4609 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -482,7 +482,7 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>  		       ENGINE_CLASS(RENDER)),
>  	  XE_RTP_ACTIONS(SET(CACHE_MODE_SS,
>  			     ENABLE_EU_COUNT_FOR_TDL_FLUSH,
> -			     /* 
> +			     /*
>  			      * Wa_14012342262 write-only reg, so skip
>  			      * verification
>  			      */
> @@ -492,7 +492,7 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>  	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), ENGINE_CLASS(RENDER)),
>  	  XE_RTP_ACTIONS(SET(CACHE_MODE_SS,
>  			     ENABLE_EU_COUNT_FOR_TDL_FLUSH,
> -			     /* 
> +			     /*
>  			      * Wa_14012342262 write-only reg, so skip
>  			      * verification
>  			      */
> -- 
> 2.34.1
> 
