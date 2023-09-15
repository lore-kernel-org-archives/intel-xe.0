Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FDB0EED61E
	for <intel-xe@archiver.kernel.org>; Fri, 15 Sep 2023 17:51:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D733D10E668;
	Fri, 15 Sep 2023 17:51:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 499EF10E668;
 Fri, 15 Sep 2023 17:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694800301; x=1726336301;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=8dBXut/nlimatB1zd8Hqrsq3eUA7K+dOYb/3JPtLRi0=;
 b=UfpjSjavt7sA3ECdWG07hoRdX1aglQUhvF/+0hN5xhitdrvbpZ90Z15q
 z4s75Eeb5rf1a4r1e5j0XWMdGuaqtL+vfzTVNRhYwRoz3baFwJjBvPCJY
 lvhFPN/4cOEi2D64H+pZJoyjHjNhAfzAEj/cGnZmzGqKFYqgXyGB102g3
 Y18yaZe3u4opDzBUlWP1EcPlEBZYSmaDf6JPgCPMXUYFLXephX/tvTtox
 mzhITXFCLFXz/fgUIMhxCekBbTYuknaDZAFeogcxExKQokXJDZkvTLVG/
 tMcZL6WkUgciZ0OJaDgwrPcwb/Zlr+XMv63d00HJnUG4em6ge7RXbbn6E w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="369628940"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; d="scan'208";a="369628940"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 10:51:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="868820225"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; d="scan'208";a="868820225"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Sep 2023 10:51:40 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 15 Sep 2023 10:51:40 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 15 Sep 2023 10:51:40 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 15 Sep 2023 10:51:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lj7QVnhZOc6DzrpWfwXqMrIDtYmYGyA5y9z8o/XTZYC/yguufD3fwJGKGe4laEyyRNEImmbkqDZ9IXvv9jxndjaXWoBdgtxqaC/wz4lQzYsQ8cm1h5sY/idtUVgNiW6Zhi9CSwQRBr3hOoQQeyxDNXYUV4LzoHmijs6xxb+l0vK/4u0nX7oBrb2HOySNM6aIIePW3bpkcEa1I5wgI6dY1M/n2xKyusJGPQ7kXug0pqR1q+jlkfTJNKx1NdDQDM48MVCNae0o3fRR11UTEosBNsSGutH0B6/Zj4f8SXxK/0/UcqI++DG6DTIE45mr+TpJQW5YJwKcMuObd4nU+KlXSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XoArEmwtgJSYVvqXeNJzVoSbZI/pMv58W2afb77Xqbk=;
 b=hsAV7+quKsxnkarFzlmJbIs4sNLFc4HSRDqWsbHG4TxIgkXJDA+v2rmAEEqh+nc3BFxaPMBtssqDKNGJYqLPv2EUhN85qqf4xW+6NFaCepEnxcj2QkYJB0WLesMnlvt+7PkRosvEkyjJJm7Al2YOKL05zBjUvJfiTnl7OMTZ0nuGg0H8HKOZioQPvI2PQRAH2DAMSEpL+ZKimCcoNOORWzLl2QyuH6HQSpYI4lPtbtWWDufEmve1N58KYy5tGDD29x88luzfrHP7lNb4+2Xf2Wma9PGDW2y5Tgbb+/V6xx9IWr5LNePgQydqB8M6UFESnaeY+5BQ2w+cwoPmc0m75Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 SJ0PR11MB4815.namprd11.prod.outlook.com (2603:10b6:a03:2dd::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6792.21; Fri, 15 Sep 2023 17:51:32 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66%4]) with mapi id 15.20.6768.029; Fri, 15 Sep 2023
 17:51:32 +0000
Date: Fri, 15 Sep 2023 10:51:29 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230915175129.GE2706891@mdroper-desk1.amr.corp.intel.com>
References: <20230915132346.1845909-1-lucas.demarchi@intel.com>
 <20230915132346.1845909-4-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230915132346.1845909-4-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0P220CA0021.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::8) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|SJ0PR11MB4815:EE_
X-MS-Office365-Filtering-Correlation-Id: 3acfda38-f39b-4c53-8dde-08dbb6146550
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fyoZGnyhFHxjDAiTMMVLkYxTpXjPWeT2/wM8a1HNbpXJN0GAZVeAGRr7fe4ZTSG9Ufp5iB+i6FSdZmmB+I9gwo/c0y/aRRfx/9Vd1oLDQlc3RPQEW0ye3Vz2KL2GBnsVCQG53ScyaIhTgpGpT+pLPr9OZKIpBwuTKl+9kKRK1cjd96WTEi0n/YyEZwC6UmADx8gljInIo55g5i16+1sNffIWaXC1dYLnxX0l/92eFfbV39pqJEszSJYK8I/vxd5um7JV6GM5z/kXRzAQyBlHoqlU7Bju0Z9R0fyYdK87ajLvnRO2+N1Sa1JJXb50o0d5/k6z+SrtfMZjmlJmulu+dDwu0q4vhlR0BzPuzuKuxDGDc5uRRLhWTijEvwu9HsVT5WYLY3Rcepsq1TV6Rx7yCpAkkVgtBhOfkNOz3G4UvJ+PGxlIxZBKyqFDzwm2Qf65mqbPE0/eenTYHk4ChaeKt8h3XVgo6Ptm7FfNb5G6cMWa89C/Zcm1M5rson0jWW1VDB7Vobrmu9P7ka5nZNBVFSnlNccV7WK1ipbLQ+UhrTFvWHsSAmLI+m7Xp0DhbiD+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(39860400002)(136003)(366004)(396003)(186009)(1800799009)(451199024)(6486002)(6506007)(6666004)(6512007)(478600001)(6862004)(83380400001)(26005)(1076003)(2906002)(4326008)(66946007)(66476007)(66556008)(316002)(6636002)(5660300002)(8676002)(450100002)(41300700001)(8936002)(86362001)(33656002)(82960400001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dc3/LeKRfySkuzGKAaUAcmHOXvsRpYFgK2OuaATSVXqLHc8rUOyA6zoarnoT?=
 =?us-ascii?Q?eaLa192UkYFLkzmeUJi+vtvFP0ChbULpUAC43v2FgvgkfUCIgjx9LqDMebRL?=
 =?us-ascii?Q?4wlvPhDr1SdXRk6sVjl17iOBNcitOMROuMQcUGhdwKT41gRTGXXckDLlCV/x?=
 =?us-ascii?Q?GyApJ3TSMSCUZpOlG7OFpD8yqSiq515yR4RhIg6UnKhSe7Zmu8z6+UXPjPgr?=
 =?us-ascii?Q?emcRkIDNjESNUWo9ywMg4F+g88gNxZk49c2J09eisWZ2d0zvhW+wvggggXzw?=
 =?us-ascii?Q?iypLQNGO6g++8Ozghjjw/SjV11qqzQ6ar/fz7g3aTyYv/mmM+aq7IsQLvs8I?=
 =?us-ascii?Q?QJx3E9k15AuYWkT4jIj6uQvSU82WY5yRQdU7omajxmjDoiwCcbh48ijax5Ch?=
 =?us-ascii?Q?grxA/HWbmd2v+FGgIN5mxSiAUF/JvHYwJ/YRRsmQvUbdx4BkjNtJ9kEcQpys?=
 =?us-ascii?Q?frOAwpmAVPsmC2CFqPK14zNV2pBIUqHb3cBAYXgxgAnLT2lFAiESIfCmjvTI?=
 =?us-ascii?Q?E3m9g1jDO1CNobRR5l+csY3zEizvFP2EQX4yAx68FmJ00CxTAsSL8BHpIX+q?=
 =?us-ascii?Q?U1/rj/8DaRQCQzfe75m9N2tpajYM+CTZVV7YNRF4XU6qJLuTptfaJ/HhadJL?=
 =?us-ascii?Q?LcoNpsaiuFKOD1FjZFg2rU1HIvpHiq9mA2eXri+LlKpABPSa0+CoE5gwPxzX?=
 =?us-ascii?Q?f93Z0cFrgXnDZAG5wiKBFjMpPwTKoDdzIGrqdapswVqsXW1QcWAygrFZmYuE?=
 =?us-ascii?Q?/WYKD2zeLstlYLn8Nw52BY9/2WCptVqUyOwdXEJEyCzKNcE6sOXE3nlGgqYB?=
 =?us-ascii?Q?+0415VYWnB1GEn26T86+BgN8eq3IOpqqynyLDv2lkJs4/q9xIZk+1kPvQvpC?=
 =?us-ascii?Q?mKWVAY16xrVDAgJLylu8E7LdcMpMaJYAh5R5MCtSQqwXhBHF283916cHXE8o?=
 =?us-ascii?Q?yKRY3PhY6TiLwtFWP0WeM5USN6ywn9hyagB9LVfm6wWLBLRP+n1c4LAm4Xmb?=
 =?us-ascii?Q?NWYpl5SM6JQiPk1lzGUU6uAyAm/5ns8z86Lm9NmgRW6w7W5IAud659zdzYNX?=
 =?us-ascii?Q?YYen8RQB69MKtxHqfP3aJL5ckT1LL409D/o6wdnK92gj1Xwpqj8AzCJjWqNK?=
 =?us-ascii?Q?Ww/WYeZwPjh4NoveaWZsaScPO9x013S0lDbBfZHH6x2I4RfphAILG6ok0iGC?=
 =?us-ascii?Q?2aL2EMmgOBet/aA5QCJB1wc98v1sHNJOIyg9Laq+eqJcaWZq//8QtAGmKY8Q?=
 =?us-ascii?Q?srM5+RKLf8HzIMkr/vGNYuqDhWHTz45IJdfRbgGik7YEqhXXz2eR/RizH4ms?=
 =?us-ascii?Q?7Jqgc7pyVD4NUWK45npyhAAGEduirybGlTghzeFV8gpgjRgpwigQjLl1V+PH?=
 =?us-ascii?Q?jQyAsHRy2fzu9k3OpSh7gUtF1hwvKSIJ124LLxUJYOEGDJBJvFrdjzJZnv8W?=
 =?us-ascii?Q?9ZiuyEU/dh+/vpmLRWFKjfCJb8BU8xj2VJP+FL2gUbwrUySMkJa+fc+s6ElW?=
 =?us-ascii?Q?AAmrvUXft4mxCoEqg3nPXRHWlaSlhpIixYIi9KopQXw+UAyh2o0h8Q37hWII?=
 =?us-ascii?Q?GjITCOEQ8GAC/8Aihxu2niMX5QirR9ay72vFralLkMzchMrg2L0hHBEWLjBx?=
 =?us-ascii?Q?ZA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3acfda38-f39b-4c53-8dde-08dbb6146550
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2023 17:51:31.9817 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r1jginZ00NgurfvaEDK6MX4g+TR5rcS7QgICRQ4qQw8Btz6h0YRy6vyKZ+NKXYaXdZTluASUM66eFlZzK5mXMXYgxmoJTkVGUl2fZnVRP0s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4815
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH i-g-t 03/14] lib/gpu_cmds: Reorder if/else
 ladder according to IP version
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
Cc: igt-dev@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Sep 15, 2023 at 06:23:35AM -0700, Lucas De Marchi wrote:
> Make it easier to follow the flow by following the convention of "latest
> platform earlier".
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  lib/gpu_cmds.c | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
> 
> diff --git a/lib/gpu_cmds.c b/lib/gpu_cmds.c
> index 648451f74..0fd8f8213 100644
> --- a/lib/gpu_cmds.c
> +++ b/lib/gpu_cmds.c
> @@ -270,17 +270,15 @@ fill_binding_table(struct intel_bb *ibb, struct intel_buf *buf)
>  	binding_table = intel_bb_ptr(ibb);
>  	intel_bb_ptr_add(ibb, 64);
>  
> -	if (IS_GEN7(devid))
> -		binding_table[0] = gen7_fill_surface_state(ibb, buf,
> -							   SURFACEFORMAT_R8_UNORM, 1);
> -
> -	else if (intel_graphics_ver(devid) >= IP_VER(12, 50))
> +	if (intel_graphics_ver(devid) >= IP_VER(12, 50))
>  		binding_table[0] = xehp_fill_surface_state(ibb, buf,
>  							   SURFACEFORMAT_R8_UNORM, 1);
> -
> -	else
> +	else if (intel_graphics_ver(devid) >= IP_VER(8, 0))
>  		binding_table[0] = gen8_fill_surface_state(ibb, buf,
>  							   SURFACEFORMAT_R8_UNORM, 1);
> +	else
> +		binding_table[0] = gen7_fill_surface_state(ibb, buf,
> +							   SURFACEFORMAT_R8_UNORM, 1);
>  
>  	return binding_table_offset;
>  }
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
