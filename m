Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE67EE8FDCA
	for <intel-xe@archiver.kernel.org>; Wed,  4 Oct 2023 04:31:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 680D010E0D1;
	Wed,  4 Oct 2023 04:31:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D32410E093;
 Wed,  4 Oct 2023 04:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696393898; x=1727929898;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=w37uPfEOdYl8G8LAyB9WpC86qKhOlJy1+8ay9doRkkk=;
 b=ddU/mPj0nizLMVzzqERy+QFBNTnL1+WICfI7Z5C1VNlm5nJ3stzuKcWJ
 JghYDzlt39YMNIq6FpbxwsXLQHI2Xc3rrx+MfCclE9oBgvptTJIpiXitL
 mizgdS4Pu49EO7eND4x1GMvF5lx+0QsFc5oPr9ia9cgDZ1CEK0G+MoiYB
 cTW0JT98+vdJAoRPEMhWQ7YnMNf40PdaE6NF0cdBfc7Lb72AJ+CYREV4J
 +nGUzQTkVYg6zwpCg7X9ElDntwbMyPVOy+EQcPhnRWIPXuvNXtknG9i0A
 MiBe7DHbAgxWJoVGIqNM3RJOvnaebeDCzWDATDLaQQT6p0mnX0Cm9MeNp g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="385874001"
X-IronPort-AV: E=Sophos;i="6.03,199,1694761200"; d="scan'208";a="385874001"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 21:31:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="754689690"
X-IronPort-AV: E=Sophos;i="6.03,199,1694761200"; d="scan'208";a="754689690"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Oct 2023 21:31:36 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 3 Oct 2023 21:31:36 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 3 Oct 2023 21:31:36 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 3 Oct 2023 21:31:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E12Pa6rQrbrxPkdE6PoWS8u9JQe7viRP9v+6/jHzSStByCXx+j15pfFyasz+nde6LB1bmnqJuAYUrmbgirng8NERCQiAkIMrJlrrmHfK0m4nLBHRQiNAAXAe1fB8U6HUfBUjpjQanRM4Rq4YeJKI7SVw/Jodc8Hp2ulYofTEzBYCUUPX/QJko8A3JKJRMndCP7RuDsazJ5jDeUHIeLZVe5ceKvsK3oZZReD3+F4jcEaNb0LpgQ1EwH2ne4yq2KexhH9rAA48EJSZ/BvBDWQJ1SL8BCo5vJ0THe/yLm+Yufp1Ww8E3Y4Oe522PpMSj99YzCBWj5doGDMVQGvUOvH/fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sOrczd3vaFJWpVdBPdUmS4wv+R51HtNSEiFozqY4OuQ=;
 b=aHVM6pjr9ovVIzJmN8t9au8+DuDYOVKAHnEyrRKVSfni8X+oP60wMFicUQTSQXXJUY8QX+ahjZQ+0hHrNuANv4iu9WTVUVtpkH7u49r46eY6zMTUbTwNV2os5gD2z0290MY2s81CMoFJcc0lTwBBQkc4HIUpLi8yxpDwjEB7/85KvOLAvx1iq4I18Q3+wqcVsa51Q6VOvRm6Id/7OQMr2F3V2B5zWvXWSImrTwZQufr42+O5sGjcCJeJe+YSStAWOwxjy9SqnFxzdZln3Mt2WnQ5iVNaGQF3R5RWWNM9SBtPnPye4kQ8j84fqdU7CTiS2Rfo7lmesmWd7f1rEr4rig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 PH8PR11MB7023.namprd11.prod.outlook.com (2603:10b6:510:221::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.29; Wed, 4 Oct
 2023 04:31:34 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::14ea:3a78:f950:d6d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::14ea:3a78:f950:d6d0%7]) with mapi id 15.20.6838.024; Wed, 4 Oct 2023
 04:31:34 +0000
Date: Tue, 3 Oct 2023 21:31:30 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20231004043130.GA53570@mdroper-desk1.amr.corp.intel.com>
References: <20231004031023.3444455-1-lucas.demarchi@intel.com>
 <20231004031023.3444455-9-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231004031023.3444455-9-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR03CA0215.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::10) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|PH8PR11MB7023:EE_
X-MS-Office365-Filtering-Correlation-Id: 874f7dfd-dba0-494b-5fdc-08dbc492c9d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eNHvfMBIaFBALZzdwRPuZ7cbC+l0sDpkVPJT6xdSkGT5Eutq0oTHlW+rzZF2ARxth9x+fIpgh6bjBdNB6c2Z8jp+uoJxtGcbF1+VGcr4YKbZuBetxAyOvcztJLYeG/BUCK51+d4gj6muE4RlBqmp4JmJHW+601ab0Y2vG5PCc6QB6qBjThcgB1uzQbW3/j4p7n0SETYvwtDFD01HuJ2toU19oBZUxAMLuxy0nt9n+BtcyH8YL1Ovsc+IKbofYOKQyA9OfO8ZYV5FWwMbykc1fJYRCsvPlMXD/Hum94mWRt8TR1UdQJB01juV2XhqzX8Q5aNUQbsLM/BTaiFBuqBg1ds8snifQi0fG07XDb8ee7Fa+j/0ASEutRqiKfpeTf34K/2mhnLHzDuTzbGTo+jN8sMXONo3dJZR1DD1Y+iBqOM1UkWj8r9NDUMJ1frjq06fhH0sIb6rR1JdRL4SMe1oqEBD0nQF1lm/9itwJnKAo0ktC/+fnEuBFZJlYvS3tzO7PSOfHjG7WLeOM7XJDdwWJci6tOAmp+njNX1mERhK7sOcFlm541qF2yT1zK7bnWH0
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(39860400002)(376002)(396003)(346002)(366004)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(478600001)(6666004)(41300700001)(38100700002)(86362001)(66476007)(6636002)(66556008)(6506007)(66946007)(450100002)(6862004)(4326008)(8676002)(5660300002)(6512007)(2906002)(6486002)(316002)(33656002)(8936002)(26005)(83380400001)(1076003)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AFCltNURQqFNR1deDKi8bO9h+5J8NxwUFfbYCVp9WVNVJZuJWVC2e0p0jb6X?=
 =?us-ascii?Q?8ptyqZcvhwX/3caJ+qdb5vbyFC02DRhUuFV7aFKlFQyMru1yvGcN3xPlL6pM?=
 =?us-ascii?Q?YNihbUjeYATwgegqLnJl26nL8AGU3tk1Ah4OZIqIu3sJgEXrO/TU7stTS50B?=
 =?us-ascii?Q?4gclU8Nd6K6aAXfLa/FOGuOMM4n+uN6FG3eTxUokp0Y8ASWek9ARV0hWBfGx?=
 =?us-ascii?Q?ITeFzDcappvwLGJTKKSXBZieJbu2Ea+1JzsxQw0J2eblbz/zMbY0zgHf9D9R?=
 =?us-ascii?Q?ezBjGp5MQ0gDnSxbONZ+1fIZHQZOMPF7OFr5EAS6NBBoUJYcwrfVTEHpp90V?=
 =?us-ascii?Q?HKSSODxrYHmyhrwO2qQMGC6aKrvSoQ2c6sqG74eDaONaUBKonMJOsZfhTQLa?=
 =?us-ascii?Q?m1BeZCzigTYcLItucraq7aRd2NeYvbLWp3wQuMyC4j1OM/tS33VxlNp8jS1m?=
 =?us-ascii?Q?HfwBr1w+nGDtfQLRJqDFIPOBu8Smdak/fdypuNFEuF+uMkMHfRp68QHDuIZ6?=
 =?us-ascii?Q?ja+MEw5iCv3nwPuf5YA/+EZBdnGR9bxHXtrTaPuWHX5fGIp8DNDnGRUJt4KG?=
 =?us-ascii?Q?tBEc1Ai4Z2AmxLsMMjG6g0awV6JOT1AHqv2pB4Y474Q2Ghl9ngJJ+urWsPKq?=
 =?us-ascii?Q?XQgtLfyhWxzCR3j+Kf91ypjua3zriA55DhFdliL0LnzV275aXm4tSlepE1dB?=
 =?us-ascii?Q?ANK74WWzn5puc11zoArJA0vRJFwl2A2SHCzQdAACLsUGYskMfutRg0mDCn63?=
 =?us-ascii?Q?eXV4DCUrJMC9dV65b1FNegY0nKZglrLMbRE5i7t4w9j7yBvdUfbQfk2PI4Zf?=
 =?us-ascii?Q?2VQIS6p0PxCZpKW0M4tfM4QOGXrdCqtifua55u0tZtIT+EhEaiZ/+y6cJtjW?=
 =?us-ascii?Q?HoZW/iNkWk2p29iSLHpofD8XMysAzao39VfYq0JBMXfiRgIM9VoJOsI2BWg0?=
 =?us-ascii?Q?BYJs1AfZbVbbxQyNX2prmKKNIqxdMgX+X/pFFPMz1hPhGkK5wVszbGzn3bsw?=
 =?us-ascii?Q?+ZRV/omTbjRoWrinbMfkxFsNsO8s7RYEnF+ETFEYOpnZNTXfuTzemjIYAwiU?=
 =?us-ascii?Q?jSp2g+fYokRm4Ftzr8xJIbwyPt/dIyi6sDhRdZGL8exTGcsjP6+Ez8nXavon?=
 =?us-ascii?Q?Jx1LE41vte0/3pSFCf7kUovu6JJwJN5Behq/SbKd1LOsW43Qy8KqQk7rUkAQ?=
 =?us-ascii?Q?+8A3tON52TK00o2soyyDLLfMPkQO6F1kHtLwVrSbROAqMmLxo48IJtgqO5/H?=
 =?us-ascii?Q?BR1Z9j2V1ClyMwaWckBRulXLUVf4IJ1HJBC/Y3IG5oiFD8DtDao+nvNvJ39Z?=
 =?us-ascii?Q?P65nGTB0j6qWk7Zw1xW3GRluFaymChSSjH4Se1SqFxGfiQXK9oGwLBa2Uq/9?=
 =?us-ascii?Q?H/ce6eF2q+DvhJwmEkeVGX13IaW8ZScAgLBE6yCDepLzciP66ABRghQNoVpR?=
 =?us-ascii?Q?XnoOxk1ccl8g0tNv2KK43dnElVUOSizsVLspCZZaZJH4vdyxvrvtwqFSak0h?=
 =?us-ascii?Q?9czV9TrxSGCimZw3JzOfCQmnA0mUitrKdga2jTaEsy61Ryf7y4KaUVZNiOrv?=
 =?us-ascii?Q?7Tsn2l601I2NvcxNOypICHa2xHfPFnzOP7vQ9nxsx/cuYF+zWdmDxQOywc0s?=
 =?us-ascii?Q?eA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 874f7dfd-dba0-494b-5fdc-08dbc492c9d7
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2023 04:31:33.4829 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nv31QnZidhcrNt2Z9eQyC4tyc4jcoY/glG/FNW0wjw5g5ZZtEZxzDyVWhdzGkfXTrYpCXoF6/l9gVSmGddocsS6AHKJ3r5xonYNU8HX610M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7023
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH i-g-t v2 08/13] lib/intel_mocs: Add Xe2 mocs
 indexes
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

On Tue, Oct 03, 2023 at 08:10:18PM -0700, Lucas De Marchi wrote:
> Add WB and UC mocs indexes for Xe2 architecture and later.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  lib/intel_mocs.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/intel_mocs.c b/lib/intel_mocs.c
> index 6a4ec25e4..d9de16932 100644
> --- a/lib/intel_mocs.c
> +++ b/lib/intel_mocs.c
> @@ -14,6 +14,8 @@
>  #define MTL_MOCS_WB_IDX				10
>  #define GEN12_MOCS_UC_IDX			3
>  #define GEN12_MOCS_WB_IDX			2
> +#define XE2_MOCS_UC_IDX				3
> +#define XE2_MOCS_WB_IDX				1

Wouldn't we want index 4 here (WB in both L3 and L4) rather than just
L3?


Matt

>  #define XY_BLOCK_COPY_BLT_MOCS_SHIFT		21
>  #define XY_CTRL_SURF_COPY_BLT_MOCS_SHIFT	25
>  
> @@ -33,7 +35,10 @@ static void get_mocs_index(int fd, struct drm_intel_mocs_index *mocs)
>  	 * This helper function is providing current UC as well
>  	 * as WB MOCS index based on platform.
>  	 */
> -	if (IS_METEORLAKE(devid)) {
> +	if (intel_graphics_ver(devid) >= IP_VER(20, 0)) {
> +		mocs->uc_index = XE2_MOCS_UC_IDX;
> +		mocs->wb_index = XE2_MOCS_WB_IDX;
> +	} else if (IS_METEORLAKE(devid)) {
>  		mocs->uc_index = MTL_MOCS_UC_IDX;
>  		mocs->wb_index = MTL_MOCS_WB_IDX;
>  	} else if (IS_DG2(devid)) {
> -- 
> 2.40.1
> 
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
