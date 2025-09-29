Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5263CAC5B0
	for <intel-xe@archiver.kernel.org>; Mon, 29 Sep 2025 23:26:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9597A10E4B1;
	Mon, 29 Sep 2025 23:26:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dHDIBOvR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96B4910E4B1
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Sep 2025 23:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759188405; x=1790724405;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=WzNH7fUiza89dYxU4JdykjhcUz3pdq1OtzOiqinPuaY=;
 b=dHDIBOvRmb9WEk/JKOQ2aWos8Zlpxfem7Xuxmk0COvuEMydXq7zPQmvl
 qdbFrjrGUgm5dsqv8JDelQSeR+jw9xIiGFVCUd/OxqY7oFJOlhda1a+H0
 9wt7P0tXEJayA30UF0OEphe5MCjyYpv9ClM50MLm5Pbbs8QM4LE8RcjN2
 /D/2n6vWzjpqKItPc+fBDOiW6uNbXmqe7juvxOboFXbAQ+oXV+/reA8Cf
 6AmMmG7d9reuScKX+4E5Ps9lferiIxqFtrsQRDusRNxcwfa13gBj29B0H
 RmpFH/u0toHxEB1gGF9uiNDvt7wRPGqbpnUcBLWfHu7QAJpdmuy6mgncj w==;
X-CSE-ConnectionGUID: XZmpC08HRpe9fV4KYXb0ng==
X-CSE-MsgGUID: S8rHvCuWR0eGfTdnvgQUmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="71685780"
X-IronPort-AV: E=Sophos;i="6.18,302,1751266800"; d="scan'208";a="71685780"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 16:26:44 -0700
X-CSE-ConnectionGUID: 8Z55N4qXTwaZQ5pG1h5biA==
X-CSE-MsgGUID: GcqALwUTSw+ZtKZZmt+wWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,302,1751266800"; d="scan'208";a="182769659"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 16:26:43 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 16:26:43 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 29 Sep 2025 16:26:43 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.38) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 16:26:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=erwkppPfkVg+pi7QhOasUtf8sWSEEYm3uWGmTDQIrMOJnAIVfkAnSgCSmvo3DUm2+an/aXvW7E72/TbwJamBItaXpUt3IVME+KGXD2Sl7kGzVbeBfgOOmrBvMxEwQk/LGegPjHRmATP0T0vYAkmLzmc5Moab5Zn5Ks1p1x0giRU7WomhHTUMufz5XyFUavMX5quUqY4VCAi2/9t/+RJ1469v5xlEv66NLbCo6ndeo4Js/1K4nvuzelfsocvGqqgWtNY/ng8FoyJM4XBz2jO9jALyxGpIjrd1L6vFfzbuW5JfPLdZ59kOohkFGsdsrciJGnCXPNIAVMv+wVsuzlY43A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bd/nDJxXtnGq/0UddhdCmY4DbPqaxIBZ9kJzTqmpDr0=;
 b=OS+fL/k4ATM9anVwmkHGfunS35xrHwaLYUui79b0seA5szSITGuI4/JNqdrS2DzjlPmw9w39f1Nx5FOqt71BPC3Bx8xvYxVSoUbnfb4see0kZQc6S/vCVWAXtLGFD/jIL0kgs94opMguDpfoKnL++FWCuGYrQPhZe+v9kNBrm9DnfBEBcAORx8oX/i/clQAhiIJyyTUSdKG09yQRHl7r8Ys55CAoenQQ21uDiZ7w4aMfXKipHvOBKukXhKaA59PtcONKZuxnRDyXE3BXuo3r/5C96anFGBGZeiW4hLQRpzOm+SEXIVf0i43qfjocMTk6Zaka/TdoipfNDfalFfjjwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by MN2PR11MB4664.namprd11.prod.outlook.com (2603:10b6:208:26e::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Mon, 29 Sep
 2025 23:26:41 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9160.015; Mon, 29 Sep 2025
 23:26:41 +0000
Date: Mon, 29 Sep 2025 19:26:38 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 4/5] drm/xe/debugfs: Update xe_mocs_dump signature
Message-ID: <aNsVriSfnFP3jXL9@intel.com>
References: <20250923211613.193347-1-michal.wajdeczko@intel.com>
 <20250923211613.193347-5-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250923211613.193347-5-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR03CA0218.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::13) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|MN2PR11MB4664:EE_
X-MS-Office365-Filtering-Correlation-Id: f8e9674c-48e2-4130-03d8-08ddffafa4fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fMARDUO/xCHqpsYSiXs40XSZ+dM2rL6XKB0J0KvMKXbHSrML8Zqa0gWCvjTo?=
 =?us-ascii?Q?QBxCtGNtnXnHPd6ALUhVEcytYdeZRerRfYHWm1Y5L2TIRlpbBvZ/CtMxmnJB?=
 =?us-ascii?Q?7opbxRZKie+z+aclwwWiQIDxttfcWniMN5EABgeCKnT/y6ZzXDaL7jQbASFk?=
 =?us-ascii?Q?AI1OeJzSfwTnG94ok3DcQdcpWF3it2Jr11AXL0/qiMpsngrumlNbQYGlqWlv?=
 =?us-ascii?Q?EkRBe0OE8mSExNQSdH+6ziU1ZpkOAXVurStFOm3ovGAwfn+PPoEXDCGua1An?=
 =?us-ascii?Q?NRorrY0eDokrh5rRQJrVOfKebikJgdskgXQFKq/RufAxYfg3zCzuFaSdzfg6?=
 =?us-ascii?Q?wdi9e5n9sGKQpQXCOqkjavFdS8wfit/NX/0grWPiErnY4n9Lo49Vli9Wr6Yi?=
 =?us-ascii?Q?L6MGqCVkZ3eW5n67pfcxHVaN0Fwjzl2nOK454nKNhhxd5TivxduZG/EfqBmp?=
 =?us-ascii?Q?slS99gRvxKh8/ZIa0NpklLUO1jLAnirMoMDDblbSJizl7UJNxfpeKJNyM5vH?=
 =?us-ascii?Q?/50pLNksExeo8ic3f9Rz613FTLlO3PUCxk4NM+0wzi2XJrq08STY85DeUf5q?=
 =?us-ascii?Q?rg/MhP0d9qmLxXx0fg+20fWgXLpOqMOMGEa+v3KnFc3b2W1kANquFmOg6dk9?=
 =?us-ascii?Q?JRVtG1yE7cQtqCH1VVNChpmhTW4uyRr+sbiCv0TUIWjhbgrs2kwq0Cq6XbRx?=
 =?us-ascii?Q?rQFwUsGa29+KE1I3gz7pJ1HE5h6o2k5bE39bETXnu5IlZk7zqC5cjjbaUC1L?=
 =?us-ascii?Q?KjKOfJOJZjucH8N4BdA1KrvAShxefGeRjQS6udo4VJYzkaHomAoHmded8CSl?=
 =?us-ascii?Q?AybRExx3MLbYn4dJGQuHxfp5nyQLLpmrD4ZHjMV9lsAf97IIY2FHUaw5XdN2?=
 =?us-ascii?Q?uioZubbkU9JrUAiVUIkDHmT2mTHXyaf7c1ny7dojJsIJe64BMSiNACixenZD?=
 =?us-ascii?Q?B3GIhvYL2qFu/L+5eAvdfEgnIkMNn2bbnHOgNzRaO639gG0FyGFWs9uLifNn?=
 =?us-ascii?Q?eH+SnMgWWENo0pkLM8GV22EVEP40aj/lbRER3X+RFCyF3+qOuwZm22ccnJb7?=
 =?us-ascii?Q?cC7kKBpU7XxaZdVnQH6ttKpMnqTl2gA/hfXp8QBaICpxORVHg9lCB/KCPooi?=
 =?us-ascii?Q?9QlBZQ3B9k2EUHkM5QQ36r4tCPGRyNEMsZQNvbgiB85kysq5Q/UCNLokBeOC?=
 =?us-ascii?Q?lgTbsH3n0OSfAAXwFkZGzTgYVkMxkyvZ2gYY8nNfwwlP6ImpnX899TG0hI+a?=
 =?us-ascii?Q?HwDhvrZHI4QV/mh+LOgdZEuQUyodR+9mlRR6Ar9J39rBZEybo+NHb7c02vSg?=
 =?us-ascii?Q?hyj0Vic+f1UTpDtRwiHGivMSOu68JFVheDt0eN5xv9yp6ZHcrNKJ9wNJHSw9?=
 =?us-ascii?Q?8GQCDi+weCJCCaf8+esrcAE9OMH2ZNpf2+uGV0fqg8p/uVEz9W5cPQpCTJCX?=
 =?us-ascii?Q?6YyN8hGF8pwnwLnHIx2yeMz4QiPMGmeL?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Os5+khFd4DBoHs1FXSxIOoHILl9LDMAKst76aXFh2cDXNtzO6a90rOM4qn4I?=
 =?us-ascii?Q?ZHgE22l9lJY7vOMx7RDr++bTZLj3F6sdXLng5YUm7O2brAKQ6UrLGy/uG/EA?=
 =?us-ascii?Q?JjrsSA/qf7qT9BrXNFLmNouMNN2O/CSMiqblG3JMdNf3NcAIqjuBfx/BzTQh?=
 =?us-ascii?Q?e6hNPa59Hnqsyj+O69pyCOqbAyOYBWcZpt6iNt6xyAK4sm/ASeSBiZEvQJZq?=
 =?us-ascii?Q?sVB3ergOI5u7nGb6NpOak4EfrnXuQpVEPWlcEhg3drtln19dSdbBtGL0kG+2?=
 =?us-ascii?Q?S4Vd9D6shqzNeD56V+k409zhJiwcvSfCweL6i/rqwKx5WTLEj1G6L7MeLHUw?=
 =?us-ascii?Q?+wmBEQtnj3HtiDKF4jhNNLev6fO6a8W8BYCRdAe75CVm77Zxrpz7lFInVcd6?=
 =?us-ascii?Q?GY2aOjwnkY7fK3IjQa8NaXirXFAcNivs9xWZ49XBgJt1TS3mBzV4fqtx98iD?=
 =?us-ascii?Q?yBqjRmslBnu26AkppB6mrkPqhxvJwNHyqx8c9W+wBKoI0gB5ZFpJG5V/oXHe?=
 =?us-ascii?Q?p1zCJAnq1O3hrP6IbsmAPwZRVvdmiVHiIsITeU3rxLuG/7yDacTJJTob9Zfq?=
 =?us-ascii?Q?5rntRW/SD5JBk2pdzAle6EU9VrHM5XTlNoaywFfzK4JQYO5S6b0/eTyDJz5T?=
 =?us-ascii?Q?sRQH75giC/joBabxmmPRBy44k36RUeh1L5kE/ryxc8gvogCH4j+LTSkP+38X?=
 =?us-ascii?Q?HWe8pD6vMEwYI6yQBVUqLzhqA3NnzdtiEMVsxVJnaiCm9XI13mYz+PTgY0mv?=
 =?us-ascii?Q?zKjmNBQAPQvjM8IlQ4Sz+kOm+wu91e85+tjHRkuzr+20ETyc7F3mI2Fc8yFW?=
 =?us-ascii?Q?xB6/GLTg3/ReA1JCIU+7+qisYcAlTEeX6nyAFNriMo40Nh48Qgt3xdQZ0IIn?=
 =?us-ascii?Q?fE0EG7IyjuWPQ93BgvW34dKLPsZjoGEYgNJEnRBYzk/raq/UZPw5aPk8hsSD?=
 =?us-ascii?Q?Zv8E4OCJceZBqlQFw/Tqw/88vNI++kHcgIP7yas+2MFaiwO6E9P+FIcs96co?=
 =?us-ascii?Q?GSD81njBJ0WecQ1XY3FWrnahvGiWHcYg4fAJWy5LiAHHmarsyxvNngskHLZi?=
 =?us-ascii?Q?Ng/Gdv3v7CFV4deS0I+Hzm98o2FIStNM+hlgjMYsqE183ko7fh9W3m+eVJOL?=
 =?us-ascii?Q?VdoL/tlP1EJdn7E60/c085TiBjBFawKyXtrfhjlsecJKC5SvkwMWbCwOnmoA?=
 =?us-ascii?Q?P/noCOpHBY9pasA9TdmXtSWAuemKXBcH8w+wud2+IQk1Ar9P5mYtneeuz1m1?=
 =?us-ascii?Q?P7C9M8qvvCdyLnOoioVB5DSBgNQ0ycA+YwVlR6mMV+0WVpVqvjLpGNdSfw44?=
 =?us-ascii?Q?LoXnIUXrCwBsfS18Ilt8VuDaFd3BMZ+2GHdAcXe2qoWjgcn72QQM8xs7C7S3?=
 =?us-ascii?Q?nFlFGwMXzgFiIrSU7oANZmh9gp1dTkEKtmhmauauvTP9iY6SyJTMqZ0UEsxn?=
 =?us-ascii?Q?zVix+ySLPrUvTcQQJqa1tIxbVEEDf/6QOEbS0k9yGuMx5lkKvLuhoyNA+696?=
 =?us-ascii?Q?xIiYdLO0lJMXmaMfIaIkqeHjr8ReGCj9KgbewmnY29pHUBnFTupRBajfm3zo?=
 =?us-ascii?Q?LLAh+3NMgTHwU2RdFDZ5a5LQoD9BYS/9UPMFeSrKq5J6Lc/8+NSZcEDzu4Rv?=
 =?us-ascii?Q?Ew=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f8e9674c-48e2-4130-03d8-08ddffafa4fe
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 23:26:41.0780 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MWH8aBnjRyHdZtUbFlhGS0MpeSLOUohLeI/mWIXeb3WktHVFWhtjTGEcsEO8otWCHoU1GBdjjRn+S75ys2UILA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4664
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Sep 23, 2025 at 11:16:12PM +0200, Michal Wajdeczko wrote:
> Our debugfs helper xe_gt_debugfs_show_with_rpm() expects print()
> functions to return int. New signature allows us to drop wrapper.
> 
> While around, move kernel-doc closer to the function definition,
> as suggested in the doc-guide.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gt_debugfs.c |  8 +-------
>  drivers/gpu/drm/xe/xe_mocs.c       | 15 +++++++++++++--
>  drivers/gpu/drm/xe/xe_mocs.h       |  8 +-------
>  3 files changed, 15 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> index bcf234e74471..b0e6dafeeacc 100644
> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> @@ -173,12 +173,6 @@ static int pat(struct xe_gt *gt, struct drm_printer *p)
>  	return 0;
>  }
>  
> -static int mocs(struct xe_gt *gt, struct drm_printer *p)
> -{
> -	xe_mocs_dump(gt, p);
> -	return 0;
> -}
> -
>  static int rcs_default_lrc(struct xe_gt *gt, struct drm_printer *p)
>  {
>  	xe_lrc_dump_default(p, gt, XE_ENGINE_CLASS_RENDER);
> @@ -237,7 +231,7 @@ static const struct drm_info_list vf_safe_debugfs_list[] = {
>  /* everything else should be added here */
>  static const struct drm_info_list pf_only_debugfs_list[] = {
>  	{ "hw_engines", .show = xe_gt_debugfs_show_with_rpm, .data = hw_engines },
> -	{ "mocs", .show = xe_gt_debugfs_show_with_rpm, .data = mocs },
> +	{ "mocs", .show = xe_gt_debugfs_show_with_rpm, .data = xe_mocs_dump },
>  	{ "pat", .show = xe_gt_debugfs_show_with_rpm, .data = pat },
>  	{ "powergate_info", .show = xe_gt_debugfs_show_with_rpm, .data = xe_gt_idle_pg_print },
>  	{ "steering", .show = xe_gt_debugfs_show_with_rpm, .data = steering },
> diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
> index 0c737413fcb6..7b68c22ff7bb 100644
> --- a/drivers/gpu/drm/xe/xe_mocs.c
> +++ b/drivers/gpu/drm/xe/xe_mocs.c
> @@ -772,12 +772,20 @@ void xe_mocs_init(struct xe_gt *gt)
>  		init_l3cc_table(gt, &table);
>  }
>  
> -void xe_mocs_dump(struct xe_gt *gt, struct drm_printer *p)
> +/**
> + * xe_mocs_dump() - Dump MOCS table.
> + * @gt: the &xe_gt with MOCS table
> + * @p: the &drm_printer to dump info to
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_mocs_dump(struct xe_gt *gt, struct drm_printer *p)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
>  	enum xe_force_wake_domains domain;
>  	struct xe_mocs_info table;
>  	unsigned int fw_ref, flags;
> +	int err = 0;
>  
>  	flags = get_mocs_settings(xe, &table);
>  
> @@ -785,14 +793,17 @@ void xe_mocs_dump(struct xe_gt *gt, struct drm_printer *p)
>  	xe_pm_runtime_get_noresume(xe);
>  	fw_ref = xe_force_wake_get(gt_to_fw(gt), domain);
>  
> -	if (!xe_force_wake_ref_has_domain(fw_ref, domain))
> +	if (!xe_force_wake_ref_has_domain(fw_ref, domain)) {
> +		err = -ETIMEDOUT;
>  		goto err_fw;
> +	}
>  
>  	table.ops->dump(&table, flags, gt, p);
>  
>  err_fw:
>  	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>  	xe_pm_runtime_put(xe);
> +	return err;
>  }
>  
>  #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
> diff --git a/drivers/gpu/drm/xe/xe_mocs.h b/drivers/gpu/drm/xe/xe_mocs.h
> index dc972ffd4d07..f00bbb269829 100644
> --- a/drivers/gpu/drm/xe/xe_mocs.h
> +++ b/drivers/gpu/drm/xe/xe_mocs.h
> @@ -11,12 +11,6 @@ struct xe_gt;
>  
>  void xe_mocs_init_early(struct xe_gt *gt);
>  void xe_mocs_init(struct xe_gt *gt);
> -
> -/**
> - * xe_mocs_dump - Dump mocs table
> - * @gt: GT structure
> - * @p: Printer to dump info to
> - */
> -void xe_mocs_dump(struct xe_gt *gt, struct drm_printer *p);
> +int xe_mocs_dump(struct xe_gt *gt, struct drm_printer *p);
>  
>  #endif
> -- 
> 2.47.1
> 
