Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08F80C71153
	for <intel-xe@archiver.kernel.org>; Wed, 30 Aug 2023 01:01:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCAC810E32B;
	Wed, 30 Aug 2023 01:01:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32F3410E32B
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Aug 2023 01:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693357272; x=1724893272;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=bPiM2y5OGwk8suQBahVTpQcHMfEaZKhq4In+Gjy2BdY=;
 b=mwLsi/JWTYdY09C+V9nEQsnxnuuakHPiXLllLcbtuWBgDKaC6tusYhd+
 GVg10gzi8e8SP1MFiKaECawV9Ra+vSYUvBamLRHT5dqOY7SEWpPDsB/an
 eWwsgiG7umoJZwBt4qo52NK5yyK5ha3SchGMfATfqJuzTE6Pp39FCTxP1
 LpnGmKeABJQyi92zO+VRBXp3FSOK4Z3Zoh1hiPK29eevhe07+3ezPNq+v
 doqXG+s1iINglvo60cyLcbkzZY2nJzYw4Dh9nz8XFQleKO10bRuVh0ZuK
 BrLq7KGcpuQUMjOMUeZ62aIgrEknaN4JCkURv5qSjl3bOCi9QFRfTmBvn Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="355027681"
X-IronPort-AV: E=Sophos;i="6.02,212,1688454000"; d="scan'208";a="355027681"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 18:01:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="853523127"
X-IronPort-AV: E=Sophos;i="6.02,212,1688454000"; d="scan'208";a="853523127"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga002.fm.intel.com with ESMTP; 29 Aug 2023 18:01:11 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 29 Aug 2023 18:01:10 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 29 Aug 2023 18:01:10 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 29 Aug 2023 18:01:10 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 29 Aug 2023 18:01:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WEMZbFUMZ2qm8nXmGro7mTl9dfIHdI0SagI/8/6IOnmTA8WKmn4sNYB4UqPfh1D+YUjJu3pf1cpt5fsDBeozxJyLW4tX4jh+SJoGTUBdXJ+4jengXeiXFfjxI223BCbjJcCUGFDIeYrd8DwglW5lt+Hvj7hNgvwun3JBoPk2jWhaK1yTdzpuetYxJoFV6/XdRgxGQo1Skz81EBThWi6VSj/tg61TRmqXtjs5ixsOUKjZnZMO1f84sUHDTbSsqNP37Cez0IGJeJBNMX2FKNhRcJevERx0Gh66CiOdE3wu7PX3STEtNnfpod5Ql91wcrE/GEALPewYtK4WdpsmvcoL2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jXijUVRPplp2HV49Gt2LfRB80LXYXxGl6vSCdNfRZbQ=;
 b=V+Z0nbh/Qwt7AR20w6QPoglEDQI1cdq2llX1E/1o5hdZYRAH7e1//Tyoeu7dAjt8gH3k4wh6TrazNGYV39eI7urJP+LgKTXwxJKPaNp+2n0Lf4tomxKWe6poU42GmyIKiNkvSQPJ1wPVFotbqbk6NvTbK2iTVSrbfvEbsRLz7R5HXuI7e+V/dl5UhGstcArqyC1fmvJwxlwNe2p60pFtbPA2rVjLFbA4bHJcoLBFYhCXlkylCBh42zPb6nqBs2WKUiylrMLqgFH16i1U2R5/ABTx/VxuNReREe8VWtErCPyXTEuxyGmR565jmtePMvl2HyLf3Yaa6PWaptQ7chb4Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB6420.namprd11.prod.outlook.com (2603:10b6:208:3a8::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Wed, 30 Aug
 2023 01:01:01 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b%3]) with mapi id 15.20.6699.034; Wed, 30 Aug 2023
 01:01:01 +0000
Date: Wed, 30 Aug 2023 01:00:04 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Message-ID: <ZO6UlFl0GjHnEPky@DUT025-TGLU.fm.intel.com>
References: <20230829233053.2264563-1-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230829233053.2264563-1-daniele.ceraolospurio@intel.com>
X-ClientProxiedBy: SJ0PR03CA0165.namprd03.prod.outlook.com
 (2603:10b6:a03:338::20) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB6420:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c6304a3-964a-4888-58e9-08dba8f493d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fFL6HVaZBTTCRbLlaDtxWt4wA65r9dz+3AFnEpQGv9/TfJrn57iRNb3i9vpF1eeZIpX4i+jrv0Yru3x9Gpp7yzMOHiVviH2XDxYrqpVg287VjMY39P9mm4a2m1KQedTxeOmr6/a5PlSGtzZOjERRnzzDsv5p/LFEfujVFNtu28WQ+EQeWLG+pzsEHbXYXSg9L+qd248ZZ+yIKah4OY4RP+1sKpGKVykBsrs5bBKgfzb7KJa1rUkmT6dE86cLXGnfmhEc8sqiT2YBmaveDPULWQnNsbg9humfOYrX1dBIZmx5mqSBlvrNx01JLnE8UPBDIP4BGrpcQNkk0bF6Nf+KTQEM+MtWtwnqmSH5J5SigPBLWwpHP0s4jzmhaT5s1mdE5D6wblAXfZ7yR+RV/slCeoqO4Uio41xKOpmvOuqwGZG2HGJ/DtJONYaTtm6m1owxVtCbLpYgMD2UsoG+q61PhlBuS6Sw80G0c/Vw3bE16IOrqydlTlLM3i0igpsoZ+zOSwAovmcHxhmV5BkdJa3MfpvLM1Q/jYuYlhqMfkIxcJnzGDtwWXsyELbsaxORVHnE
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(346002)(366004)(136003)(376002)(186009)(451199024)(1800799009)(2906002)(66476007)(66556008)(316002)(66946007)(6636002)(41300700001)(6862004)(4326008)(8936002)(8676002)(5660300002)(44832011)(6506007)(6486002)(6512007)(38100700002)(86362001)(82960400001)(107886003)(26005)(478600001)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rOC33xnA1cyksIB5kkTdgRhboznr4R1xs37W5tYO2abqqQWHLUe4RxcWK2d5?=
 =?us-ascii?Q?XYNTSxy1lMsRhkaXLr0oOmeYKJadGErsxadMRZstuD+Tf22nMg5gxeIHBukp?=
 =?us-ascii?Q?EnyMQ6ZYC5bYVAmDWFpWSthKetgVEjw7lcIiYKJ80gQglmUVP7QJTsjCk6p4?=
 =?us-ascii?Q?kEgHIOOlQ5uZ5SB+eaJGoCkq1Xt/nWejKfSLSjZMwnB7gDy8XvyfQ+eJgE/s?=
 =?us-ascii?Q?wwivGUl9xOrUX0dRw6V9WCGC/hDH7ZRhgIt5Lu7AM6mvdBb7syy8XNePvVPQ?=
 =?us-ascii?Q?7zAf5iu6Lbe7s9zBTYj28qywNJNOk56kOsXmktHtfbrRvUdCYd6u54Szc0ue?=
 =?us-ascii?Q?PPwphoEinFtIVav40KAkMiAAvZ4yycUTZAUTnUOF4ER3pkWweMQciKphXe36?=
 =?us-ascii?Q?RRQhz/aEInJW1hPdxi+yggTut40eA39e6PBIk9qxYC5Jft5RYZHnSOOQZgeL?=
 =?us-ascii?Q?MZlgjrCMTi7g7S37HZq07/SZ1IOt3t608W0KAYp/VjZ5+HEmwJHmlK4Ohl7P?=
 =?us-ascii?Q?iejrWrYlOUjuVCPfuzye6M0RMZHlEl8EwRrsC1hGnGMF+ZyZb0DUpYBI5p8X?=
 =?us-ascii?Q?t/giYQfFyO+lH4oyWZTRaNj0T4OJHReXwqzjTHfbnCtr+dIBZm8eERb9aHAB?=
 =?us-ascii?Q?0+FKAZlhKVj1AbKXbnsO5WV2tmQPk1wtsZMyHnKUH9/2YFk/9Yh1ys0Pl7it?=
 =?us-ascii?Q?Qvs4i4Kz1dSsnfA1VFcf+WqPIRVnDgyhhqwxDE0ZSE/ukB2VDtqYiPdXe5O1?=
 =?us-ascii?Q?RugTB7GhNUjU9E/jfp8yJa7Ohvw9Asr7kDcYDeQbMPBqdedS80aymHw7T9VX?=
 =?us-ascii?Q?dkbuz783YSpQ6Z2M41rGWcTbs7nnQk1n/tgiCoYM+HCRvFFXcqpiwUea9eMG?=
 =?us-ascii?Q?zg4R/w/B6KEtAiNqBFl5IuP3QpdikoAyWiIpERs2vmhhCLjek1R9PaPQoWGL?=
 =?us-ascii?Q?vMipWEq2ciJdgOiY9gEvWZcHgVZDVe0M+Kr9RBujg2YKy0BudtMwyn7FZfmt?=
 =?us-ascii?Q?mpRfKXXoAnJoWSPb6onRAgOqFSQ0gDCYkN9/BbHIsFSAVcPlXKzz9LR0bX4g?=
 =?us-ascii?Q?Bakr5vRapiGhgojoeEGB2kc7RZ7NFf+vdw1Q8vFBkGnzGozPxabo6/GRxkge?=
 =?us-ascii?Q?6K7c1rVj41+clUwTWqHyMPVMMM6ii7rnDlkAzhLr6LzFBwmhV6QNtNpDlj7E?=
 =?us-ascii?Q?x3eXVxJyOvHj7iyk4SnFst2jJdPnQobw2DorSi/TPFF1JuTLdBOL3KGUBBNe?=
 =?us-ascii?Q?EThkD0wuQawAfDffDjlJKn0t3XE7UwDTtyI9Eye49jw4FwZz+Lg1lzvI3dS7?=
 =?us-ascii?Q?0Uirbg//hGjYGj41mJBYSqa06+PkO3IbZ5q8MvU6cssFEo0kbA+GQWwaqtSt?=
 =?us-ascii?Q?4WTzGDAuokEWOrQfqhO7FWmqyDpD+8yVF8WdTblOyB/l37YCEEq+Hgw9LnVW?=
 =?us-ascii?Q?LcT0HgehIi1gCm7dkRxXeFr2c7zzqLf4Sv38n40X5Sg5WTaZbmGt9JfIkUj9?=
 =?us-ascii?Q?WYe6h4u9r87HixfVmFMEMxQX6ulV3qhcZevWCcGEwXHEpUkpSR32T8i/y6CJ?=
 =?us-ascii?Q?T3C23Srfn0ork7PJ9uSo8AwmI8On15e+x5snjoLStUGlfYJB4LY7jp4F8si/?=
 =?us-ascii?Q?DA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c6304a3-964a-4888-58e9-08dba8f493d5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2023 01:01:01.0386 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lpy/tlmKnNLaSlHEwIlVh5nmx2jHbnvOUzKjsqNApuNFSTFHUj8lkUEa/rAQydGl+CGG5m/J59vQ3L5aqz13+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6420
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] fixup! drm/xe/guc: Report submission version
 of GuC firmware
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

On Tue, Aug 29, 2023 at 04:30:53PM -0700, Daniele Ceraolo Spurio wrote:
> Major GuC versions greater than 70 will have the submission version in
> the herader irrespective of their minor version number.
> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: John Harrison <John.C.Harrison@Intel.com>
> ---
>  drivers/gpu/drm/xe/xe_uc_fw.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
> index e2f42f1bc89a..37ad238148b0 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> @@ -252,7 +252,7 @@ static void guc_read_css_info(struct xe_uc_fw *uc_fw, struct uc_css_header *css)
>  	XE_WARN_ON(uc_fw->type != XE_UC_FW_TYPE_GUC);
>  	XE_WARN_ON(uc_fw->major_ver_found < 70);
>  
> -	if (uc_fw->minor_ver_found >= 6) {
> +	if (uc_fw->major_ver_found > 70 || uc_fw->minor_ver_found >= 6) {
>  		/* v70.6.0 adds CSS header support */
>  		guc->submission_state.version.major =
>  			FIELD_GET(CSS_SW_VERSION_UC_MAJOR,
> -- 
> 2.41.0
> 
