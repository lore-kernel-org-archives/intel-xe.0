Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36D1EEB64D7
	for <intel-xe@archiver.kernel.org>; Mon, 26 Jun 2023 08:40:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0939410E0A2;
	Mon, 26 Jun 2023 08:40:18 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B853410E0A2
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Jun 2023 08:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687768815; x=1719304815;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=0l8hUd00SnMU9tFw9r/wvLtvUWOnua04XW15bgtVCGg=;
 b=jiAYdzj3j5sw8XCGbrNn5LZVxMzRao6FHw0hMU6ASZwX2HRzAzf02mru
 tBeXy4cz9M0cufLxfJwEs2QjcD6ymZ+/YLmERrYd3yXurz/GkdMKqRnUi
 aJqUQmm8GxxVEFpl33j9E2gnrVw8n3juez3XZEUfVE7jB3nWf06Gi5nnB
 D0+0rmqwld6AeHXxJXKuFIDA0xqbszKKmb7ijjlgmJvBPEOC154t1uvZU
 J/vwvxyXpW9sLoq5fXlWMPm5hBytNAxYG6vcAUUBTO0ztKd0r9NUjIvn4
 hTG7FcJxk6zgYCk6XtxLdkVYLtopWpLywg6Nsn3r0/YEjS8OlQ/h718cV w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10752"; a="358705865"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; d="scan'208";a="358705865"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2023 01:38:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10752"; a="786066810"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; d="scan'208";a="786066810"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga004.fm.intel.com with ESMTP; 26 Jun 2023 01:38:55 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 26 Jun 2023 01:38:55 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 26 Jun 2023 01:38:55 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.103)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 26 Jun 2023 01:38:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HcpYWqdWnNvZo+paY6g2Y94VvzxuzC30Rd7QhIOf8UakqrbXKTQpi+KkuEubL2wt1XJh+rDPX+ZZ0sEmZJqvlc0K2jbeJ1t8UEIzNlf/kt+CVPfc/aXE8bKslou71rC2C1ZzlxJqT9mu9RuFFko4nB6CfJV+YFryiZJE2X41CMa5YACXg3Jlb4tWXffxzJc5Tv24phpDvnO8dpddY3JmrnD5ADlvkFaYTiie6rX/XUdRkXj/3GXMm25Xl/NZfkEB8LassYPss7hT3RWr2l52anpnfa85eO2+Ui7RNgNGZD8Qj8RLbWqQFOOuEAdPN7x0LaO/N4LIeKtxhgD8Hl71tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=63mrDXhzZvvKigUH32GezX42aCleRZcdV8BBWTzKU+I=;
 b=bOfrQZAWYAghmQTLgIr9LievfoHVIU0gD/d6AtzSAR7Su/vFlJUuHky79kf69pfcAKmvqtfcu7WiWLfXiTJsmg209mcnZcWH021guiWO8U2FGw84YZBzTEKFTNh8B+SieCsHN9vHbRhFyy0rEGRMZYHvz3hIfinuGP2x4EtKsCOZqAyIy+DMKwlm84xbIPR7dTEKIkE9hNW9r28H7xhSzZxfc9IHR413zzVPXTpKK+NXQuZPEb7PZM9dgkVg4F/NX4jpXFMrEv4DvKQGewt96Rgq3x0xd35SUiPjJTpl5audpQTvYyKuFjfA4e4pX5s1Hn1YOSZ0SxFAdjGBwSzBlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by DS0PR11MB8081.namprd11.prod.outlook.com (2603:10b6:8:15c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Mon, 26 Jun
 2023 08:38:52 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1e4e:c49d:445e:cb2d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1e4e:c49d:445e:cb2d%5]) with mapi id 15.20.6521.026; Mon, 26 Jun 2023
 08:38:51 +0000
Date: Mon, 26 Jun 2023 10:38:44 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Message-ID: <ZJlOlHcjz7cSgO4V@fdugast-desk.home>
References: <20230626082506.12638-3-matthew.auld@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230626082506.12638-3-matthew.auld@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: FR3P281CA0178.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::19) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|DS0PR11MB8081:EE_
X-MS-Office365-Filtering-Correlation-Id: ce3c82bf-4580-45d1-9a7d-08db7620c49e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bvay4BCHR0HqTKmUdaalpn3eDdLPd1D/9N8KDfrCwq3gqVW9umjh/Y29ZjuhEWUrMK7mPBsPFYdhL2E/JCUWnKy/hHKlrBLi61W/QAlxw12MdGJxVWLgV4mFT4rA1fFj0i02xKtpzLbRu7KDop1mh/+fqr2cqz5pQCe35LQdAnkpEg0VCJaJKwUDzbWNl24rE6S028EIPvEhWSacREzyXl9+HtCPKQwgAaJkZu07lgldKGq9ggHNJdAaYYBiBlQaCFASVSmAIreu5gCQfqAIMJbxqE9qaFyNdwar+3QNwsDZT2SW7OWp/KgMU9fGLTlLHV4dhej29j+PaBTdjlS5eGl+ibfNBjBb3csu8aMHDarXuNO09YmtAK6xuvetWxwJ7PoMu20qCfX5q/OX0hzIrtAYuynbTb799uiZ3r2Z+MNmIyASbPWK3qCnE53C2g/Mt6qonIBg/H+qxVWPErQzoYjV7K1aIQOYp3sxnkfL8Pxk9pgYyEzqDvICW6rTTSKfAB/H6eRvnvks/hmu+JzPS456lzg49K5QoHeuMS90hR0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(376002)(346002)(136003)(396003)(39860400002)(451199021)(2906002)(6486002)(36916002)(6666004)(107886003)(38100700002)(82960400001)(83380400001)(6512007)(6506007)(26005)(9686003)(186003)(966005)(41300700001)(86362001)(478600001)(316002)(36756003)(66556008)(4326008)(6636002)(66946007)(66476007)(44832011)(5660300002)(8676002)(8936002)(6862004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ol70ko6y9n7DeCh4iLEZQjaw6N47sxDZq8ffiWqrADYiWiUl5XSXdN0YKOfc?=
 =?us-ascii?Q?RHVZR3vlLDCdham34l9feyZVvYdV1qfcm5hIoW8ruBC5RCEnA5DtMnhWpDaZ?=
 =?us-ascii?Q?SWH3YTX1jrVkQDpBoBv2QTX1QavYt1T4QVsGNlQUY7dR9Pw7apFsBE1KKUBn?=
 =?us-ascii?Q?6/VfitgQqvm0R/selajoBW4FXS63THlm+/HeHnZk7I9Kejh2ycSesJGLjgiR?=
 =?us-ascii?Q?SmQwNyPxL1tlAzSRCFaH2qUbFNaq3zbK2k452SGq4kAcHnbzW53l8GdsgwcH?=
 =?us-ascii?Q?Afk+EkoLe+z6qCHgk3Ggfael7s/mAgCK8LgwP9sBuT0MtjCtzx4u13Zs7ftl?=
 =?us-ascii?Q?oxgzHQvzs2mdsmZD/2/DVQ9DAZYmTyBFwYP8d+mkC4NP6bfN2djoG5thL4G2?=
 =?us-ascii?Q?7ZLL8m34cKGjLL1y08eN8zb/9cns6GIazjpMOYrkSADN3lYuBj8Aukz/tK5O?=
 =?us-ascii?Q?Tam4yIdFXGJOHkogwU3whz6oRwkkDRZWHuGBaDcpAfAtp44+bbd2BJT2Fpk0?=
 =?us-ascii?Q?fNB179reGVV6OTvm3jquTodXFdbNroxd/jzDWfUn5HNpYXaTsVeEAHRTdWmy?=
 =?us-ascii?Q?U9O7Vx/f1pTzREBne4HOddG+kT6FalOFz265svIOXvBEOILEV1kfjhCl4IHH?=
 =?us-ascii?Q?HMrQ3EnxV/DlrH6h47f0+gcT0W9t0e/r8YlsZkqR7J+1hQcK9DFq8BZ+Kwxd?=
 =?us-ascii?Q?aNtyHO5WS8GKAaHJSCPpT+hHYph9FvSitncmXB42OZFfqZW3xbNWqdrM5I19?=
 =?us-ascii?Q?zhJhfg9PA3z/PvaYTKpCwh7QiOA4fbNb47CXFP8Bo5prGEl/WFdIzrEdDSvX?=
 =?us-ascii?Q?eRSnXNbgQMw6ZsuBvcykjyYymzaKqn0WAbPdRIZPLbegeDvkI+yF63HztLvZ?=
 =?us-ascii?Q?l5+yndjEREhsdxDnti+FYDlYU0GXnWzUk7p49+hKIhyrU5vzOG/eMV7BaOnk?=
 =?us-ascii?Q?vSuQ+g5My6Y8nPAlKC5+t8FGgbOIgzxCyhWjmxxLeqXzq6Zzdvl3+mzs1f4s?=
 =?us-ascii?Q?Ktf5bY8HE3w6NYzuqF0AUdzcyLxNCstSEIW9NbXwVf21L/zSFuYhtaBp/GQI?=
 =?us-ascii?Q?lsqY18r/DqS+8t1w7Sab3a/mCCqfr3kXDGdhAR15idfO4MoJh/HQmDbSQe4a?=
 =?us-ascii?Q?Lzu5TdXb/8+Wfq1hLyhZa3DkN1p82gA4uRDxFnrh5WR8kwLZRJcLtLsIK92i?=
 =?us-ascii?Q?MY+MQYmRr0R1UM8ukdSgsWmqms4vcDi/BERx3SlZV9MY9INkVFSA5AemYv9f?=
 =?us-ascii?Q?SEe7seIYhJA2i/GF0lS3EKAMyHyNNxm210HDdyw2x3K1JNmvG+a5AcJkP4ta?=
 =?us-ascii?Q?pYJl9NA8e7PFHj1FKVh3B5K/EH1TjAwfA6eDuW3yEvqfKgbzOU032sNO3/N7?=
 =?us-ascii?Q?TAi2AWIRdtrglBL+1KfghUzFdCs4d8hlvxEzI5R/xe6f9j10WKncfOUW8xom?=
 =?us-ascii?Q?rVG8diI8+JxrST41Rkpqb6YrdSIYLCu8pGIgPmO44QWAmlc6r6h5uA4LDbQs?=
 =?us-ascii?Q?2DX9UvSnNl0ofoCiMJEPPLBVJxDgttGGle3jyl5p5TVAD//dvBwdYEPmD/1C?=
 =?us-ascii?Q?iWJoW95i0ByAh/02DXMfFGji6PP2ZImZLOzmSw4nCoIvC9qZXr5Gkvm5YF4y?=
 =?us-ascii?Q?DQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ce3c82bf-4580-45d1-9a7d-08db7620c49e
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2023 08:38:51.4222 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o4zS/T3CWPn+R8bbxMhzVmyml8j6qf0pgqa3tOlYwahlA0FGGDrwpE+V7CReg36qtMMXiUhbfT4qAnyav+4nM7lqWQBkhR+FieDCupTUqLg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8081
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 1/2] drm/xe/uapi: silence kernel-doc errors
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Jun 26, 2023 at 09:25:07AM +0100, Matthew Auld wrote:
> ./include/uapi/drm/xe_drm.h:263: warning: Function parameter or member
> 'gts' not described in 'drm_xe_query_gts'
> 
> ./include/uapi/drm/xe_drm.h:854: WARNING: Inline emphasis start-string
> without end-string.
> 
> With the idea to also include the uapi file in the pre-merge CI hooks
> when building the kernel-doc, so first make sure it's clean:
> 
> https://gitlab.freedesktop.org/drm/xe/ci/-/merge_requests/16
> 
> v2: (Francois)
>   - It makes more sense to just fix the kernel-doc for 'gts'
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> ---
>  include/uapi/drm/xe_drm.h | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 432bd87ca401..965cd9527ff1 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -242,11 +242,13 @@ struct drm_xe_query_gts {
>  	/** @pad: MBZ */
>  	__u32 pad;
>  
> -	/*
> +	/**
> +	 * @gts: The GTs returned for this device
> +	 *
> +	 * TODO: convert drm_xe_query_gt to proper kernel-doc.
>  	 * TODO: Perhaps info about every mem region relative to this GT? e.g.
>  	 * bandwidth between this GT and remote region?
>  	 */
> -
>  	struct drm_xe_query_gt {
>  #define XE_QUERY_GT_TYPE_MAIN		0
>  #define XE_QUERY_GT_TYPE_REMOTE		1
> @@ -852,8 +854,9 @@ struct drm_xe_mmio {
>   * struct drm_xe_wait_user_fence - wait user fence
>   *
>   * Wait on user fence, XE will wakeup on every HW engine interrupt in the
> - * instances list and check if user fence is complete:
> - * (*addr & MASK) OP (VALUE & MASK)
> + * instances list and check if user fence is complete::
> + *
> + *	(*addr & MASK) OP (VALUE & MASK)
>   *
>   * Returns to user on user fence completion or timeout.
>   */
> -- 
> 2.41.0
> 
