Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6371FC4345F
	for <intel-xe@archiver.kernel.org>; Tue, 23 Apr 2024 01:24:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2186E112F1E;
	Tue, 23 Apr 2024 01:24:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JA84M1T+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ED32112F1E
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Apr 2024 01:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713835478; x=1745371478;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Cadbn7aTEAoddSCmBFEoRovmKjQbTdBJVNiE0EfpEVo=;
 b=JA84M1T+ic3T+VxmTfLgmSpkr1cfoITFDH6ZXb9HEDEFZcei1BiUpJSA
 IRlKaSlFxezuVOGMgAuJ8d6tTgrl6EKYKEfpK5URTcu619JEmuzCj3SD+
 yO2tXAgFX65YxsNR6Yi23rJovo1FUQTIC7Sgll9yPJsK98Z491VpNIZvz
 yrtsKgeEkoygBlVgYCM7pWmYfGRMleatMwGr7SO4U65T8Cr4Mm2hyMj8l
 H/CLSHTR4tEYma7H4PeprQvlv9FjrLSUVY7VJaU/P5UlBnEz6Y5JpJO+N
 BOtZnaqgr7cQkCzEDDkbrOtUy7tcq5UndGeJEkxPbbEqp6qZAq2SRUtdp w==;
X-CSE-ConnectionGUID: WV42iLJtQ9WPbnvxuwmqnA==
X-CSE-MsgGUID: 94xGjgW0SFeF3nN28RnfDA==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="9525315"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="9525315"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2024 18:24:38 -0700
X-CSE-ConnectionGUID: 2kZWFMChRgeTlr3LPMbYgQ==
X-CSE-MsgGUID: eAqi50PzRhydiIe+98LGzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="24810691"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Apr 2024 18:24:38 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Apr 2024 18:24:37 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Apr 2024 18:24:36 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 22 Apr 2024 18:24:36 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 22 Apr 2024 18:24:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FYBPzyqZNa0Ks83wsBCuykqFD+1w3s2GAiq1zKZ4G5XSIrv7y9z3MCTgfEEBGGGY016/2FAieT96Zp/4+obyrB/nDWvAvNONfF+bXxV0N+fzTBZ0s+OOTzOlpBSNm7YJ3iTDVBJTpteu8nZ69t1P4R2yzXSLAxQOu6W9od4LtX8ubpaYd+Aa43l8X5jApY0ttwwqxSQup9SlEQ+nFVPINKyZXbHnkemjv6IrGuVxXCvU2mPAtUBWtllmoMEbv9gNo4olSGzCnQXLclf+hs/Iqe+u0J+J99hL2liTO5WhgWeUCNdUqTZAxlptRfJZkQpuaMI1/VgqZnWAWySxWeKaWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KUuL2NDwjT2kqyL7bnRG2fArsUha84bHAcQNzLJvRK4=;
 b=YnVNsa3xvDer/j4zYhzzbiGbfqo0dBRBtbY/i1iBgW3NLhuA5XdmWMoroX5V0sinl7Y7h+CVa2qC9VySstVedluXHnu7deWmifokPwI3wKtvEC7PMMZs5xzO9zhnAGtKjl3pxnjwz4IhtA1yzOOUPRWqJa4j0tUlx6m403zaWBuBURkz2q+9ot1vcDnghgkbw9W102+vKU9r110BDKkZ5D3uMH18jI4f52ob0Z20jmCFbEOHYYYac1sYaDMIKZSZRVmce0d9xX5go4lY0kv/uLNWZiIpgGc05wLV2EvHa8Ad2Wn20hC//TnBYnx4No51xEo/voWieaJuisBWgWEPtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM4PR11MB6504.namprd11.prod.outlook.com (2603:10b6:8:8d::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7519.21; Tue, 23 Apr 2024 01:24:29 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7519.018; Tue, 23 Apr 2024
 01:24:29 +0000
Date: Mon, 22 Apr 2024 21:24:25 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matt Roper <matthew.d.roper@intel.com>, 
 Zhanjun Dong <zhanjun.dong@intel.com>
Subject: Re: [PATCH v6 2/3] drm/xe: Add helpers to loop over geometry and
 compute DSS
Message-ID: <ZicNyQegLO2tlhsT@intel.com>
References: <20240405182326.72157-1-jose.souza@intel.com>
 <20240405182326.72157-2-jose.souza@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240405182326.72157-2-jose.souza@intel.com>
X-ClientProxiedBy: SJ0PR05CA0129.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::14) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DM4PR11MB6504:EE_
X-MS-Office365-Filtering-Correlation-Id: 1afbc4d1-50fc-4746-e939-08dc63341f4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?ipvVNgjWs3Y+PC/qEj8HZM0MjSCvEiAXj6LqcUsl4+Xp+GNSggK3dLeqGZ?=
 =?iso-8859-1?Q?KBDEwv99aAvJ+RBpx37h4OauZbZws0BTrFj1+dcw6teUzH+RvGh8WiYoVB?=
 =?iso-8859-1?Q?eCXW+iW3KryVVDgV4Lnt+/1/p06bsVl9oEc+7EVPTGTKDbzNdxtjFUkTAR?=
 =?iso-8859-1?Q?w+xT+461hqN+2GzfXIxcvIl2Z4jPMrp+ZXeOyohXP/688EjRqLfpjBya5K?=
 =?iso-8859-1?Q?rdmSwptCaMs+kqlqNZ7TSaEJD2mXvYy+4xMCRjp43fUG4BPuRYxyq4DKvR?=
 =?iso-8859-1?Q?1e6iu7cAW3EYrSQZdBw6CG437nZ+4RH0SGjnanHlOR5w8jT+0oXRjk7Kda?=
 =?iso-8859-1?Q?yWKxUNCd1L+hGUrZmm1lHXqeBqnQlmmMeJkZYLNPxMo4pcFx0R71mawE7G?=
 =?iso-8859-1?Q?V5FtoTz+lYxd2DjPZUKQZyDHT9wcizDdSKx0wLBJuX71A/Z83qgR3kFfGl?=
 =?iso-8859-1?Q?XewxMLzYAZ43JE2J+znADp/zgAcvfW7Yr0A+fRLHFZRMoPFE4AcISd+rTZ?=
 =?iso-8859-1?Q?0NX7Uv7aae14E1RAvok4+2G8jVkADyUgps12qd2CcMJaT6uUa8VYUBeOjT?=
 =?iso-8859-1?Q?K7GVKFfGgHeXZlQPYIqi3iOYSCDKXqomUGJMxFDdZ+2LSID+YBbX+yf1Ly?=
 =?iso-8859-1?Q?J44BBrepdLwuSU+IXkdMVW8lMfJWsvf/yjYbYrn71o01wX0jVcq413Z/fa?=
 =?iso-8859-1?Q?Bk+jlmNrm2nRFbMWOYYQBv9le4i5E/LDhP7K+94RB7gRM+Ye4fzTwdTOEo?=
 =?iso-8859-1?Q?jxqeYKT2pVxPeTIy+tZcQ4ME9AZwEp0GLna5SgyFA4SlWfCP9vLz+YJvev?=
 =?iso-8859-1?Q?Pe/ebgsD1XtQJ6ZK6PRpEQw/Zx6GhXGBKkeSvtiFGqFmpdeFDWcy3sftBN?=
 =?iso-8859-1?Q?5EWMLEL5mmENTmevGOQ3iego7mfnWe3jgU1Vykx+3LPjKyluIwv//CAMp0?=
 =?iso-8859-1?Q?oXI33TsH4pfS3T3332sJ4MjjA7Pvbg28/pq6X7oIxlic6Abg4o8bTrTXRQ?=
 =?iso-8859-1?Q?5mpyLW20kjJuGGLvjHP8M7eEvqWMZfYQsbFmoUEUkooNhl1KR3YR6HIUUZ?=
 =?iso-8859-1?Q?MuoV9FwgwTgROk0DrSLKw6ewgu4tr9HGNQ9vIt3mIZhCEixQJ0+W+EFPv8?=
 =?iso-8859-1?Q?Ish03GEaCsjrGjAJ6ZqtzIjW59kRLwD/9ygswHYE4JZduVOCN8FPF2huIO?=
 =?iso-8859-1?Q?G4R4D6IBouiH1tVj3B+Pjf8+yNifOG9vTsx3vu/WiQqRLJjMktsrXIwA6l?=
 =?iso-8859-1?Q?edhTBS4gysG3h7+aXotYOT2eHETAHik4H3/q49LTvl5ef7iBvVIpQIFlru?=
 =?iso-8859-1?Q?fzNF7n6T+fqfL/sxZyEvAlMZqg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?vSToENhIdg5kPMhp23BYk8D1Au+i5lXPPez/TnPuZQvHY6BgssNes0QVMa?=
 =?iso-8859-1?Q?bAuECPigCy5FuSldqP6UJsyPvdfA7KXOncENFjrtSL/F0dmqyY52DU0h75?=
 =?iso-8859-1?Q?04Kaxfh2af8gyWU+8GmyOQCD5zOELCUjd7+lH9lnrdpAmL54nuL25W1Zmn?=
 =?iso-8859-1?Q?fT5KDilt0kf4PtvlPAcJ/E83f77xKjgDt0LafSCKzxTL7cOr4x8WOPEHbS?=
 =?iso-8859-1?Q?eoZRkeb6rzUlisyMpjiBwA6Ui0+j0AA962EQsTZuUhYslz4mhsrCpHAbYC?=
 =?iso-8859-1?Q?/TVZFGX4HXap3bw1I5+JYYp3jBMSaHeFky9Lh9Epb+0Y2KeMvyoA85xwjo?=
 =?iso-8859-1?Q?ftMEKfa4ADmDxkCY7MOziWcOJ7A2HM6m81u7wv9yinaj1KA8TqvRfJ04hk?=
 =?iso-8859-1?Q?mlo56h4BlCR1Uop5qbxmeDwtdcgzPZDIsOSLiNTmKbmtb0n6Z9EirA4Wix?=
 =?iso-8859-1?Q?mS5JlSPHNlKcipGzCkrctn/OgILrd3QuG2kYre22+IF5+Zq2tMqawV+SF+?=
 =?iso-8859-1?Q?VNptmLev6mlC+XvE8qXzQj5TmPcftu20XIc1WQTKfhSsDVxL2pVuLbr019?=
 =?iso-8859-1?Q?lsNXCU5QhtSNb3gwATZKddJup1iW06GfAK8HAbMkqvthC+eSEVMZPJzzIV?=
 =?iso-8859-1?Q?zqtwbqwWqBAdzbtkbtXFnhQq0fXZDxaNb6l1Yon3d9shZhBhK3FAigXk71?=
 =?iso-8859-1?Q?SDkp//g3eYd19oeTKmaBdPvmXVwBWEYPuh+88EHKI7qE1b7n/1wekmbvY5?=
 =?iso-8859-1?Q?Aon0LOCUSUYQtphC6vF5D9XFMnEq97TGQWNKzJihCBDAkyauxsdaluP+SX?=
 =?iso-8859-1?Q?aLJrHuzbgk6kWBCtFJ03SmmQTycfvmdFuINw8pHTdAhB6bcRJ795QsKR+x?=
 =?iso-8859-1?Q?jIt9kVXDh7zg+oANWAgckwXTjGunhui6E20tC6x0E+BqzIcoA2H88u9gp/?=
 =?iso-8859-1?Q?JM8qldPuRqVCJcKs8PfX2NJd5+hKCO7TSOgG3YZosqyLv63Sjj9DFLK/CI?=
 =?iso-8859-1?Q?P6ZEJ+XuvyAB5CWF8e2VPD1TicyYn7EcCC/TbIoeWSMpY0ptnvCXynSqNy?=
 =?iso-8859-1?Q?CMFFaIf7Wnd+aAucvDJhdJyNxwFWeoKNGT48/DdcqCdGvnN3qbDSjjUSFF?=
 =?iso-8859-1?Q?EXbqbksVLIuFVdKE1bFb5L8c0sRuJFPHWDCqUWcy88fPSPkhIk320c/1vi?=
 =?iso-8859-1?Q?F9R2hRBYbMAsj8MTkMPB1HrX9ccqI9E46A9lITTzStiUyaWFgOVSoqbHAS?=
 =?iso-8859-1?Q?Xm+pa61nRPyfau5/sgg/26bY3mHSNN3LhFpk9NoTrzsdIn5/dbozJrQ50g?=
 =?iso-8859-1?Q?h5gw0EGG+PB/CR9X5U9jseFPrvMVxFeWmMs1yFnpp181je8bhvycXA44Y2?=
 =?iso-8859-1?Q?RGkxi63vVs8AyLXcTWZVKpw0Iws5Xs3cOuTUgXkYPHDC3cdkUR7eAjgh1b?=
 =?iso-8859-1?Q?6XgqkWjECDnpnapmzJ84ptqfUu5zTiY0qThTxT4MNLvSzLwpZAxgAWURkx?=
 =?iso-8859-1?Q?JajhasdUSJ315WlzWhPzcsI+ON0et6HHrYTAYx7bCN7dMY1hmMvgcbnxWq?=
 =?iso-8859-1?Q?+CPkJWSodl3+/5BP/xa7bwngJB0+mCX4urek4CxCnbppulSJPX1pzwHRAz?=
 =?iso-8859-1?Q?un27qYYI1dWExjVVYaOaLCcm8JtTtHFG1UAfLqq7PnuK3aZjmsJPD9Nw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1afbc4d1-50fc-4746-e939-08dc63341f4d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2024 01:24:29.6021 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uOmCCs2b26v1qcanQKy+LVr8EZ50Qie85RuqELBD1s+k+stAyvR0RuNhCjqkJhGM6sYr1BoS9WSZHMnfVQMMIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6504
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

On Fri, Apr 05, 2024 at 11:23:25AM -0700, José Roberto de Souza wrote:
> Some DSS can only be available for geometry while others can only be
> available for compute.
> So here adding helpers to loop only available DSS for given usage.
> 
> User of this helper will come in the next patch.
> 
> v2:
> - drop has_dss()
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Zhanjun Dong <zhanjun.dong@intel.com>
> Signed-off-by: José Roberto de Souza <jose.souza@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gt_mcr.h      | 24 ++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_topology.c | 10 ++++++++++
>  drivers/gpu/drm/xe/xe_gt_topology.h |  3 +++
>  3 files changed, 37 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.h b/drivers/gpu/drm/xe/xe_gt_mcr.h
> index a7f4ab1aa584b..e7d03e001a49f 100644
> --- a/drivers/gpu/drm/xe/xe_gt_mcr.h
> +++ b/drivers/gpu/drm/xe/xe_gt_mcr.h
> @@ -40,4 +40,28 @@ void xe_gt_mcr_get_dss_steering(struct xe_gt *gt, unsigned int dss, u16 *group,
>  	for_each_dss((dss), (gt)) \
>  		for_each_if((xe_gt_mcr_get_dss_steering((gt), (dss), &(group), &(instance)), true))
>  
> +/*
> + * Loop over each DSS available for geometry and determine the group and
> + * instance IDs that should be used to steer MCR accesses toward this DSS.
> + * @dss: DSS ID to obtain steering for
> + * @gt: GT structure
> + * @group: steering group ID, data type: u16
> + * @instance: steering instance ID, data type: u16
> + */
> +#define for_each_geometry_dss(dss, gt, group, instance) \
> +		for_each_dss_steering(dss, gt, group, instance) \
> +			if (xe_gt_has_geometry_dss(gt, dss))
> +
> +/*
> + * Loop over each DSS available for compute and determine the group and
> + * instance IDs that should be used to steer MCR accesses toward this DSS.
> + * @dss: DSS ID to obtain steering for
> + * @gt: GT structure
> + * @group: steering group ID, data type: u16
> + * @instance: steering instance ID, data type: u16
> + */
> +#define for_each_compute_dss(dss, gt, group, instance) \
> +		for_each_dss_steering(dss, gt, group, instance) \
> +			if (xe_gt_has_compute_dss(gt, dss))
> +
>  #endif /* _XE_GT_MCR_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
> index f5773a14f3c8e..e2eff4f10ad9b 100644
> --- a/drivers/gpu/drm/xe/xe_gt_topology.c
> +++ b/drivers/gpu/drm/xe/xe_gt_topology.c
> @@ -166,3 +166,13 @@ bool xe_gt_topology_has_dss_in_quadrant(struct xe_gt *gt, int quad)
>  
>  	return quad_first < (quad + 1) * dss_per_quad;
>  }
> +
> +bool xe_gt_has_geometry_dss(struct xe_gt *gt, unsigned int dss)
> +{
> +	return test_bit(dss, gt->fuse_topo.g_dss_mask);
> +}
> +
> +bool xe_gt_has_compute_dss(struct xe_gt *gt, unsigned int dss)
> +{
> +	return test_bit(dss, gt->fuse_topo.c_dss_mask);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_gt_topology.h b/drivers/gpu/drm/xe/xe_gt_topology.h
> index b3e357777a6e7..746b325bbf6e4 100644
> --- a/drivers/gpu/drm/xe/xe_gt_topology.h
> +++ b/drivers/gpu/drm/xe/xe_gt_topology.h
> @@ -33,4 +33,7 @@ bool xe_dss_mask_empty(const xe_dss_mask_t mask);
>  bool
>  xe_gt_topology_has_dss_in_quadrant(struct xe_gt *gt, int quad);
>  
> +bool xe_gt_has_geometry_dss(struct xe_gt *gt, unsigned int dss);
> +bool xe_gt_has_compute_dss(struct xe_gt *gt, unsigned int dss);
> +
>  #endif /* _XE_GT_TOPOLOGY_H_ */
> -- 
> 2.44.0
> 
