Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 513B5C47077
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jan 2024 21:48:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16BD510E572;
	Tue, 16 Jan 2024 21:48:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B7D110E572
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Jan 2024 21:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705441712; x=1736977712;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=CUGw5EV3Z7Dv61ePtbUSk/BwjZo+vlyIw1SMfAfWuIQ=;
 b=FcTi5wHfpnf1eVKQboBZa1ikt7x2eCohCtkOmtrte1MjvJMoAsX7Gbmb
 dcGvs/tdt05+hd9SggHS5X7NODUhI1pKhJmi+vivq+YpJe9yBlvg11/x4
 8zRTkjmKnT/AVmmhxnXBRAiaYwkN0R82H5HR+A57ohJ9JBcKTNryr7fzZ
 ODJIIb5CZLuh8fMthbWX2OpJ54qoxmJejq4ysENvCvWzFAmaG5rH24wnq
 poNhF+PnwOXAuHVBIrosp+HXFsGEsayAUaHzrofQKpZQaGgiPQdM0YxPy
 9de7Y8a4F5oD3Z1fsxBuHC9FJwQY5wBHVQJHOzIQaJlxfrchFxIo+Z2FQ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="399664811"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; d="scan'208";a="399664811"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2024 13:48:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="903298414"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; d="scan'208";a="903298414"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Jan 2024 13:48:32 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Jan 2024 13:48:31 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 16 Jan 2024 13:48:31 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 16 Jan 2024 13:48:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gKjsDVP8Gb7N/oT4kWpHKwE+Cfp5VCzI6BON1EddE+YMLH1kBfZjuR2ld4+jKPQiDBbMU/iLfkR5YLg4o88D+vTzPYF0ydFtEiZL6aSppfBiw08+0XY+1OSAMngM8MrgP41Sadoo+dnY4vvmt//60GqWY1JUQlIVP7RoclcXVuT5jFQCodFxqBDLs+jR4026/WC/x18imOgUE3TlfQO+z91G92U+TWHpAccvVgq7ZzIJxxQ16OtGfdzZkjpGqqcM6gz4UroS+OjA1WckRJXKhSlfT6WSFth6xFm1f8wpP34lrs2+lW8Gg3xdr9rgnIKz+Lk+YAOnGK9QLYQLiVAhZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7sZVtVPK2BycMhTBg/ngK4BxyMQaEWG+LMXpS7Q3eaI=;
 b=FuNQy8nHEW8KwaUMT2BbkBA3SILuKsbRTu15NPL312Ka4b8eiI8bUvDp+pqIUBOGFuVxQPIJzlwpKkyJEfLBqOtxqVNuPRqrZyZer2jX3vo3stqJIifQWBmKD4hdgGCTE4IiTsMZYFb4JUOjapuqFOeNLmLq6HlpDcfF0QokRWQapeTdGDXSvRa3hB315Vdr7GOFgpYRJKKKOtqVVD1XSvJOWMJgmv1l4wJHkofMbsAP5oLHIVfXy5EYG77MMPcP9ZQ2KcGwnax4eqemmla1k9b+0nfhgu9LAM2hnzNqgTVWIDffB0IYm6aBqFwivgOopLcRNIcgCrFWdEO8XQF67w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by IA1PR11MB6193.namprd11.prod.outlook.com (2603:10b6:208:3eb::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.23; Tue, 16 Jan
 2024 21:48:29 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::2157:7433:d32c:a8e3]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::2157:7433:d32c:a8e3%4]) with mapi id 15.20.7181.015; Tue, 16 Jan 2024
 21:48:29 +0000
Date: Tue, 16 Jan 2024 13:48:26 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: <fei.yang@intel.com>
Subject: Re: [PATCH v2 1/1] drm/xe: correct the calculation of remaining size
Message-ID: <20240116214826.GG45138@mdroper-desk1.amr.corp.intel.com>
References: <20240116200424.651661-1-fei.yang@intel.com>
 <20240116200424.651661-2-fei.yang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240116200424.651661-2-fei.yang@intel.com>
X-ClientProxiedBy: SJ0PR03CA0247.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::12) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|IA1PR11MB6193:EE_
X-MS-Office365-Filtering-Correlation-Id: 1edd6aac-4487-4a35-106a-08dc16dce04b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: w24M3CevPgey95eL3UixpuXnhRuqwXww0dRnmdvLe9yXvtP87Tqdb01zc0vv6Ew5tjCDlZOr1XWVGxtudQa5GGtfVbNnPbr04KYtO24N4LNawARCMIeypD7SkSAb0wVxRTMhEZlWlGvhmaso+0th4ankyo+06qa606dlAorssjp6IpkLUcHGBaWHU2PhRUHRw2rpvhKh1zu+1q2nuvqVzW2FeRv0YNolNUFvidezjGbA2b+lZpIh9ZemDKD09g6rmRc+HmA4fEExSIAH7us+M2szy6jqDGOZQgo4UxdBHEACEQhgSC84YKudl/Rgf2KRup9Uj0OC0VfWlN1d3zuAmtUT485PdaqcJNDMOfrR7UbUKSqVPOA8VBMHz4T94oL82r9mtnSc30k5pfSqB4P+9oZl5Rzxxi/tIbSfyE6jMIjC5J2eRdOjVdm7BxAZyFz0BLPHeQlUW9UfnsU9xCeZV+7Aei3YIli0cYhK6SjOC+vOTvaULnX5Gp0ls1llRbggKSH++YHE5AO9W9jPEVPND3l82zcl2AhseL4uF5Anw1QIjfhd00hLlgGKMwR41SG4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(376002)(366004)(39860400002)(346002)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(4326008)(8936002)(8676002)(5660300002)(6636002)(66946007)(66556008)(66476007)(316002)(2906002)(33656002)(1076003)(26005)(86362001)(34206002)(6486002)(82960400001)(478600001)(6506007)(6512007)(6666004)(41300700001)(38100700002)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+XUc2j58q5NBEtxqVhrQPi/KCUyiUYLG4BZBqTwKqZh+skueCvjcVxoOMLyf?=
 =?us-ascii?Q?qUJYg2BKqlXmjm5B5jD0D8GZ/6JJS4uF5hF6H7bZfkuRkp782FxwY5SQQA+H?=
 =?us-ascii?Q?aiFX7Zy3qCAWj4FIb/mthsbFdVBM1tfmjPEQgvu7ik8dbgWhTSzAEfO/G3VR?=
 =?us-ascii?Q?o+oEWDf7xJe7rEdRLike49BfSOVz0rfrE1yBlrCtxEEfIYKEsTOl//1CxjwY?=
 =?us-ascii?Q?aQeoIdSy21fBw1snk/dxXf1rjHjpoauJdTdm/GPRjLzMFfYemyAG6HBdOcIB?=
 =?us-ascii?Q?3B02d377c3tU3mtV6DXKKmuQtHccZSZmLoeUQcDc4cxuaO0c64QLnXAPm1RP?=
 =?us-ascii?Q?MIlgAK9oTPndNwbCAgXu52zchYRV9/8t+fqAChEZjzsatbczDOJNWgXasTHX?=
 =?us-ascii?Q?aktNaeTQDsz8o53jSNIQuI98M951Dgi60Zrkujp1sfnoYCk10f7Vn9fpoUwU?=
 =?us-ascii?Q?BLb/0EN2/8DAC22iATV/r0/mRzGfdVgkl8qZNIt58kMscdj828TXPTNmlxiL?=
 =?us-ascii?Q?i1Kt9tCfshKEofIg0sKXVFXcryJZMEzWgFovwGGuhftHaWU36UWpjKLdiRwm?=
 =?us-ascii?Q?IE8vyQhbAV2K5ebhsdRUZVtvZzo7RYGx/RCtN+umjsEelOCtk5RBjHNTcC4t?=
 =?us-ascii?Q?n9QQ5kxfgiis1DDKZUsW7CZwK45Q1pOykk6C9PVpmr4YvpXQ98N9nRGit7nR?=
 =?us-ascii?Q?hB3hQh6gTPrVwB+kCdS3tdQjHraX9NoT1vRDfHCBosHpNuxp1SImD65RhZkO?=
 =?us-ascii?Q?yr8pIFs4tVBJPgzb6SbP6qcZ2/VUYzKt5I2cLRe9j4XT2U62gm82NMgJhVLu?=
 =?us-ascii?Q?R+8nML2FIFFRuy+G5ztZhpfwNdwBO4RAYJcSPFEiCR6hhCalHJe+DqlpmAb1?=
 =?us-ascii?Q?0piK6fmH0OpaYLf2sQqA2jUglxRYA1pU32yu4Jt23bUKuf7CVUThgIwV4OfH?=
 =?us-ascii?Q?AD0QUskrRq0nnj17zbLi5arXIhwRzN1e2q+QBzgYIBtW4Vhx6D/MO6LMDydS?=
 =?us-ascii?Q?vR8XdaezdAH6ZS+CJx4Ypv2b6K63MkkHesp3wWTrz+8FIIvW+tXxIQ9PogDV?=
 =?us-ascii?Q?HXbVQ3vjp+zguwVEDqsDtvAzWpbn01oB4a0qZOzTmCHvduw5NhXVxkQa+Mkl?=
 =?us-ascii?Q?M10G3Cazr7X1asidJZeY24mYptHOXyKqBvm2V4FZRE3itt6nYBoXXA/V6m2P?=
 =?us-ascii?Q?P9OcQMtz4DSAJ3KwazYMtNs5vbqZnZ2P8s+TD/pl9mwgS1Qm8G863aAUcO6a?=
 =?us-ascii?Q?OfTPqJaDFyRaWN40OloYyiau+QyG6rhDC8ctMMFkzeM671qEFfMY2E/hYjx6?=
 =?us-ascii?Q?BYcWlJPlAPEoQYQ3lOBnKF+zBYXqSSleeVCmbmTIih0LQej5NPFm02ZUB8ph?=
 =?us-ascii?Q?msJqw99RZDRyM9BWgnUY9qKOiiOlEIc4G8YACAVg/tcKyLrHhHzwickhPZJD?=
 =?us-ascii?Q?g4h0xr6EQ+/hucY2PNzezGKsmDgOnplFGWGRuhHuKy5EGValCdNarYvUkCBm?=
 =?us-ascii?Q?1/HrtdbOmZ2zxHmdwpQ0kih00nq2CtkYG4gdJcxv6TZfTYBC3FqUILZ07gvd?=
 =?us-ascii?Q?EsJqwHwqVLJ74Z2aP9NhpFdtjCgelBIhJGc6NxUP4SAlBQ/eYdyd1IxdE9J9?=
 =?us-ascii?Q?yQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1edd6aac-4487-4a35-106a-08dc16dce04b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2024 21:48:29.3145 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B0vWZZpRBIKZqq2KdkOMMNXz2pnfSruWrbbCtlJ12kZZj13A7yrIENgZUtp5BIfF+WCFnWBGTgkh6kc+qVP3nWCIuw8ke+im/008rAsM3FA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6193
X-OriginatorOrg: intel.com
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

On Tue, Jan 16, 2024 at 12:04:24PM -0800, fei.yang@intel.com wrote:
> From: Fei Yang <fei.yang@intel.com>
> 
> In function write_pgtable, the calculation of chunk in the do-while
> loop is wrong, we should always compare against remaining size instead
> of the total size update->qwords.
> Also, when performing dword writes, dword length can be any value
> from 2 to 3fe, always adding 1 is wrong.

Always adding 1 should be correct.  This field holds the number of
dwords for the instruction as a whole (encoded in n-2 format as it is
for all GPU instructions), not the number of dwords being stored by the
command.  The instruction always includes three initial dwords (1 for
the instruction header, 2 for the target address).  So if you want to
store n dwords, the total instruction length is n+3 which means the
encoded field contents are n+1.


Matt

> 
> Signed-off-by: Fei Yang <fei.yang@intel.com>
> ---
>  drivers/gpu/drm/xe/instructions/xe_mi_commands.h | 2 +-
>  drivers/gpu/drm/xe/xe_migrate.c                  | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
> index c74ceb550dce..415609b070fb 100644
> --- a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
> +++ b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
> @@ -36,7 +36,7 @@
>  #define MI_STORE_DATA_IMM		__MI_INSTR(0x20)
>  #define   MI_SDI_GGTT			REG_BIT(22)
>  #define   MI_SDI_LEN_DW			GENMASK(9, 0)
> -#define   MI_SDI_NUM_DW(x)		REG_FIELD_PREP(MI_SDI_LEN_DW, (x) + 3 - 2)
> +#define   MI_SDI_NUM_DW(x)		REG_FIELD_PREP(MI_SDI_LEN_DW, ((x) > 1) ? (x) : 2)
>  #define   MI_SDI_NUM_QW(x)		(REG_FIELD_PREP(MI_SDI_LEN_DW, 2 * (x) + 3 - 2) | \
>  					 REG_BIT(21))
>  
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 44725f978f3e..d5392cbbdb49 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -1116,7 +1116,7 @@ static void write_pgtable(struct xe_tile *tile, struct xe_bb *bb, u64 ppgtt_ofs,
>  	do {
>  		u64 addr = ppgtt_ofs + ofs * 8;
>  
> -		chunk = min(update->qwords, MAX_PTE_PER_SDI);
> +		chunk = min(size, MAX_PTE_PER_SDI);
>  
>  		/* Ensure populatefn can do memset64 by aligning bb->cs */
>  		if (!(bb->len & 1))
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
