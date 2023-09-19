Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89A40CE79A8
	for <intel-xe@archiver.kernel.org>; Tue, 19 Sep 2023 20:53:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54A7D10E0D7;
	Tue, 19 Sep 2023 20:53:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C80C210E0D7
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Sep 2023 20:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695156816; x=1726692816;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Pv3fRmdEMPGu/2wRmVsx3PLIIw0JZcwSnvyavMN3GwI=;
 b=brlZp08LStK3f/8NrXPsfN2910dFSNyPLfSZgZba/tuLXHyDoAjX6pnt
 eKJamd84o6qb/Oe6eVbP6bhxKTtdXhe09SRpZ7sYwQofxWK0nBSVx7rs6
 pY70hd0lFUcCMHFSE+03bZOgR06lkay+cwjPJXIy0NPaO+NY8v2sL9uYz
 RIqBv7q0GoX2PukuFm+XpkKsl4gBC7hov79Bc3RA8G1xNpbvqj5D57w40
 0P7/SjYDwWWLqqeCRM6DGEN115c8javXdJgTRs3RsHVYNH79/RCqFBKcf
 zADd4yG9BQTWlPPQxZoQjgDvqSZ8kn2YrnYQ8bT2hI7U9e66rhQ1na2/Y g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="410981300"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; d="scan'208";a="410981300"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 13:53:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="1077131230"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; d="scan'208";a="1077131230"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Sep 2023 13:53:36 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 19 Sep 2023 13:53:35 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 19 Sep 2023 13:53:35 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 19 Sep 2023 13:53:35 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.176)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 19 Sep 2023 13:53:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zl80zu00d8Lf1EMPxBNKrb6d7aqW2rm1UOivHzDRjndf4a5BgKGFNSMVC2slQ0ov2CB5WgLvo1GU40phJjkn+wq3qLa28+XDdCDvya0iwXvDnlgNSIx5llqHl0FT70bt11v7aUjlA1gCTkzm5xgXhE1zCDLXoRkH5trAvo90tfRL4VZa7QqvyKo8tyfFJaF8hCquC4xRRppcdAXwryb1KksE6NkEyHw2Ft8wCILu2iJ86v5qQZtnltVmmSXo+kDJ1R9KP8NxLFjjJn82gj+2RwUSAjh/HH7Y406fI5zfZ0YlmJOoog/3RzHS1M/MT0XNfEadRszqawHRktS2hDtxlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zyyRsGnzeLo+Z9Oxxp+ywAB+vDVuU1okyok4RG39r8Y=;
 b=Cb4MbWc5ff9BSAMx/YvHefh/p87bNoiDNGEjd7eur2/quyqllJB901ZEP+D+yIkrlCsL9y/6lS2caqUOzx3/LaK6rNkJIvU93LzOkWsDaRFfMgV+GN9MyCxLUv8EeZmSp/68bNA9Gh+x8pGlgx9sEmah0K9BPhGERUK9E3eVldR8vv4RREiDT6rEIi8Sv2klPRxLe8xVMEERZkDahAOqrga4R/N6byo64nbOJ6Tdmrc+XE08QwC0/5A0IuOpX5WpQa8ylfEbD75tD9H3K2ZZlsNABy4S8d0OBgmpGUPCIEFPzzv1sZoZTzRXnkQ7mqeVTMpF8plFEP24VDdVJL2nww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB7829.namprd11.prod.outlook.com (2603:10b6:8:f1::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Tue, 19 Sep
 2023 20:53:33 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b%3]) with mapi id 15.20.6792.026; Tue, 19 Sep 2023
 20:53:33 +0000
Date: Tue, 19 Sep 2023 20:52:25 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <ZQoKCYJnL5nMeL7r@DUT025-TGLU.fm.intel.com>
References: <20230919142504.91652-1-rodrigo.vivi@intel.com>
 <20230919142504.91652-16-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230919142504.91652-16-rodrigo.vivi@intel.com>
X-ClientProxiedBy: SJ0PR03CA0061.namprd03.prod.outlook.com
 (2603:10b6:a03:331::6) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB7829:EE_
X-MS-Office365-Filtering-Correlation-Id: ec627ea3-4945-4d56-154c-08dbb9527c6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N9gpyWWATH7MDkNoqiPRPbBBv4dmOHSV7lVVcRm7dC2n0//m9KhOqx+OxoUwgbtxL4JoULCfysRJsK76OrF9uCecVSyEx4DXrh/ztYKCmjLhcmOLdVF5x6gPfVM1yULY0PD4RMOlsvLOOEb+XrWiPoKKcXIhuqQcneqZpGoWlO2e3O61NJZtpIyNZQOSlXyh8t/iBbJPRDRErIK/MngYbc+XkKLQUIDzdPGTK/5TuXobrrLGg2dc04foKnV/dah74rOVZTfNkR+pMTQu4tLs6CVZJO5XQlhZHJ7tjy1zdizJUpHAjZ4Qlqdp5rUcUTtj6TOfqhtyJmwXBJjjbOGXQbxYGzCSQYDkPk0Gyti0WQWqRdb3hUIKTLlJgnorCWt12I5DN+QNsZAzyEEN6xwNwThATnpqEIpOL6RPpdZCK4hw3P8H8AgaLGuMhWeMknTLqB7VgDlGCQgsCRnNxN5xAEW1GvohhxbPCLIiBPQwxh1lHKZK7PEuZ85Ij0flVuiI9lGCrFsBKmjYn1p0RzSAxba5bV8aelZgGWquaFPSyp8A8ItPaZluCc0+uwfv/lB8
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(366004)(396003)(136003)(376002)(451199024)(1800799009)(186009)(6512007)(4326008)(6486002)(6506007)(26005)(8936002)(107886003)(83380400001)(6862004)(8676002)(82960400001)(2906002)(38100700002)(41300700001)(66476007)(86362001)(66946007)(66556008)(316002)(6636002)(44832011)(4744005)(6666004)(5660300002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZS7l2mphm0Wg4haHH0x240o1pajMsMjHdkd2KU2txQLhN4TNEpoEsHQmXAfj?=
 =?us-ascii?Q?SC45ebqIojubvPR6UCqFX0EP0tuRQZIXjeZtt+NLPEOz91zBCQD3uHfLMbhp?=
 =?us-ascii?Q?cltu5h3LNzw3U7vaclV0ApRrArZXzj6dv95yO+3sNSE/deTnYfFTO6pJw8Rc?=
 =?us-ascii?Q?/9hODcieSAU3zTBf7II60t0mcnNTN6DYwkMNbyretdsUOGTy2399IECFQDsm?=
 =?us-ascii?Q?aXcfxFe1k6HoJ/d6mux2x/Wb+MBGo14nJbCtUxVmUW7/ZM3intyOYm9a++u8?=
 =?us-ascii?Q?/XdsbNozKJ4hJQKlon88+M3H1jI/4p+XMHdPLPHNA0Ci/83M5FO1Hzkf4hwW?=
 =?us-ascii?Q?6qgJcs60En18bpI6QZ8YH8AWCEYnnT04NsdsZUIea/vHTZqpK3rO9wxKjV9H?=
 =?us-ascii?Q?um8AE6DYD7SJDpT/VlgN4iwQ/2nQ4iPlSYD8tK/JS1UvbQLqM4RA8gfAyXwj?=
 =?us-ascii?Q?cJFxKhvwHeBwKtAObux4IvBgsOVBc6Q05A2MeiS/lV5ilUTzHzoDUGv1yv13?=
 =?us-ascii?Q?Kmn6CAFVbpRu61uxhhnYZ2zhYS+CQIHdVMXZACmeDMAC+Dh9FBic/MwdNbDy?=
 =?us-ascii?Q?ONbSQB05pqWCPRYej+O/7jITe/G97bZtz6urb1FAUzfMxxUnoBDnO2Hunk/D?=
 =?us-ascii?Q?az6Pqc5etEmHyf933cH9L0KoiSQICrp2jN+TTnNw3olFRS11ydTGW+wFti2M?=
 =?us-ascii?Q?eKKR0/10bCOlG+GAaX6FwhkRL1ScNecolTiM70PkskSk4sZSodJ51n2IVGfl?=
 =?us-ascii?Q?b0VtFVoC2nZOxkCLOkiPUULpKz4+YHUzBMFtQR6m6YV4ZAbnBBaOOVqVzvER?=
 =?us-ascii?Q?Z4xeNIqujvVb7SyNsA34mvBU7HfINNr+W8PprtTewoVi3gUhmkaNu6Do8miJ?=
 =?us-ascii?Q?kOhir7weuOv+CYGIocKxuoMoE6CBrSTYddsoCNzAyF0r2trqNWCBearwa6oM?=
 =?us-ascii?Q?WYqwYhj+GzRZw8WgGZcL2W1G0GUBNGBgtqkQs5cioYVE4bBQqWjbF1mO2O8g?=
 =?us-ascii?Q?D78GgbUcRHpM6s61NvmB9GBs1g9BXpoogahKsfdI5aFBX2Z5f+Elfylyqf1Y?=
 =?us-ascii?Q?eBei3fqmSVv+1tG/G7zFFHO9FCcjSz+tYXYp/ps1RG8bBth56vPdchX1QaTo?=
 =?us-ascii?Q?+EATMAOosJBv9AIAxq7t+3cdZDIFW1YrIWVVfISYqRXgc5QKthSbOnIvRDEs?=
 =?us-ascii?Q?Ukz+SvRDTDlI/Cy9zONBoV6ghmmGr3djj7pf32QhqW7b651B9LHhCem1r4w1?=
 =?us-ascii?Q?/H59ztkfBw8eaqyCq1fN5E99CKCIZf49uvsD6eGO8K8P+TmUgcMTQGySXSIo?=
 =?us-ascii?Q?UGbgKeiWs1LN5NV+OoMbpfUmo6LbGy+PRhyutQn8va9VpMs47mznJdAwlaab?=
 =?us-ascii?Q?5gOs190uPyH5N3h492xVys++3mhT1GFrbOF6QgBjG6TvJztttggiJ73yoibl?=
 =?us-ascii?Q?H9f2GygXsixaotFiDCB9hAkK/Ak8sEZ5ztU2ASGct4y1HpwyLrgl52hExCbz?=
 =?us-ascii?Q?PTwh9bUeE64ATpxOZJcsYptvEPuzSlrId+IvpnZZ7NCTTLUnxkjfirrmVu9x?=
 =?us-ascii?Q?Zzl9LDfC2pcQqk//N1lMTiM21LmPYcbAIuQYis/vYssv+phYRSjPKs4GTz3z?=
 =?us-ascii?Q?Cw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ec627ea3-4945-4d56-154c-08dbb9527c6a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2023 20:53:33.0053 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XuDUON+NJGy1/NJkXG0hdbSTqeMS50BqhChafc1gVNUQywnKvCyGH5Eg3BHd0E2RGF7bDY70fmDGkwu7Y5ljDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7829
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 15/17] drm/xe/uapi: Remove unused field of
 drm_xe_query_gt
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
Cc: kamil.kopryk@intel.com, filip.hazubski@intel.com,
 Francois Dugast <francois.dugast@intel.com>, jakub.chaberek@intel.com,
 effie.yu@intel.com, bartosz.dunajski@intel.com, carl.zhang@intel.com,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Sep 19, 2023 at 10:25:02AM -0400, Rodrigo Vivi wrote:
> We already have many bits reserved at the end already.
> Let's kill the unused ones.
> 
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  include/uapi/drm/xe_drm.h | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index ca93b43fe3c9..7db4cafd4651 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -354,8 +354,6 @@ struct drm_xe_query_gt {
>  	__u16 gt_id;
>  	/** @clock_freq: A clock frequency for timestamp */
>  	__u32 clock_freq;
> -	/** @features: Reserved for future information about GT features */
> -	__u64 features;
>  	/**
>  	 * @native_mem_regions: Bit mask of instances from
>  	 * drm_xe_query_mem_usage that lives on the same GPU/Tile and have
> -- 
> 2.41.0
> 
