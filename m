Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3CA8CA5FA5
	for <intel-xe@archiver.kernel.org>; Mon, 28 Sep 2026 15:37:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9689210E210;
	Mon, 28 Sep 2026 15:37:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pkww/A5G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B3F510E210
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Sep 2026 15:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790609843; x=1822145843;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=cxfW2gkY3JyQSSIO8Q9pEj49lwCG+kOAv9C868lw/30=;
 b=Pkww/A5Gks81q1fjn5G4KVEFtqOx0J10ZP67UrVZ/CvCpc5RLG45DQ6W
 yZn/n0wzXERezA7cBRRvGahEkTnGbR1I5YNavKgJvb1ZwYrVPEajM8KOn
 hZVcf6My2b9+0ahfMRRqAKgz4dJLHLL9ghm585SsiNB1oIOfyJFgjVmQl
 mAXgoZysKVY2DN8+T/zV50DCQh9J0VPqwoPe3uMYcqalQelfENe4k+bIB
 IIHSRjJokCGuu0pr0hEfUeEyNI8Nforqy3J/Q1+GAQaX2ePj3dXSXoV+m
 iudLlw2m58NuX0CXgt/zFIFbAOGZ+CPYO9dle9oh73WPyuD0up3hAsLVA A==;
X-CSE-ConnectionGUID: rNZGcD7kRYigVs/OMrrvrQ==
X-CSE-MsgGUID: XGP+ktmoTCCIvl2KTUyoFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="95126221"
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; d="scan'208";a="95126221"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 08:37:23 -0700
X-CSE-ConnectionGUID: Ziu5lYuKS86H5DlGZf1/rw==
X-CSE-MsgGUID: MwdawdnjTCatjqyIO++V8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; d="scan'208";a="283159937"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 08:37:22 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 28 Sep 2026 08:37:22 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 28 Sep 2026 08:37:22 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.5) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 28 Sep 2026 08:37:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mwzsWEHeIv0DiLYNs2y/QPqASbgW/QuH9FToVl01UGYtGFhkZAFbAPjns+x3RcpTCK0zsBeWzae7FZVCr8jx2Sd36TwPQQKAHwNZ9LOxEZtc6wIM+eDJaCo/Eai9Gzk2Mv9Cxb6MHnJ/FEQOyxbhfmvsmi67a0CtrNkhowHLpGQyhPeJIFbtzjX3qZkzRB/FzSKswBbXAQmo+oGSREwG1POkAYh4Sgw9AC46epgUlUoCff1oIuj3OaggHPVwkqbFJs0MhPuEhBpac1A4XHrP2wPQ0P3fQ2Km08NKA2Ax5M/VWlwmdDnSb4pCKc4zVRdYi6rOW0/tvq2dBKG8sjptAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4qiNHwAppqqAwzK5F5g+tOgULtWfzlXd27MlopF3EPY=;
 b=S59oagMyZr39MxIVyAyzeaZMoikjmxOH5Gx3MqX+f2ZGEBjetn2afg4CAsYiZf1XnEZoxKhRspQZUc6hbm9Azy6CmiljM8G5NfnzJXQpkMI9YAwgWGrrnpIczaWPBoVdt7kXznBRLlOSc/T/nh/zn/csbSVm3OocXjniCW9ZLRNn7nn18/+Ack2mWKZu//pBPmjeKJFdbDTQdly+rrbj4/wM5PD1KXsGnxngf+OTpz8B/Pfnt1wfbdZaOtR1Bh4DhqeQGdvKUN4zLTuIzoNer8mTEIcUmeod/s2b/skKmw0lU29/56cOGUlwPw8dZAt8s3JFeZU6KpS7F4Z7bzG5CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DS4PR11MB298041.namprd11.prod.outlook.com (2603:10b6:8:508::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 15:37:18 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%6]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 15:37:18 +0000
Date: Mon, 28 Sep 2026 08:37:15 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: <tilak.tirumalesh.tangudu@intel.com>
Subject: Re: =?utf-8?B?4pyTIFhlLkNJLkZVTEw6IHN1Y2Nl?= =?utf-8?Q?ss?= for
 drm/xe/xe3p_lpg: Add support for Wa_16030224309 (rev2)
Message-ID: <20260928153715.GL730887@mdroper-desk1.amr.corp.intel.com>
References: <20260925172722.238924-1-tilak.tirumalesh.tangudu@intel.com>
 <179039632257.210543.8444120833742158986@61270ab9df2a>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <179039632257.210543.8444120833742158986@61270ab9df2a>
X-ClientProxiedBy: SJ0PR05CA0128.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::13) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DS4PR11MB298041:EE_
X-MS-Office365-Filtering-Correlation-Id: 295ee2b4-887d-44ca-9c3f-08df1d7660ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|366016|376014|18002099003|22082099003|3023799007|4143699003|10067099003|260925021311599003|260925021911599003|260925022911599003|56012099006|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: MFilefxf2/ATh9pbOSlmkrzdbitQLQcwoANRv2s9ab48bJByXbnw+Ac0K9pVp0rxhjWL8qnyxwht8c1Ix6B1o9ylo7BaHWmhsd9pAMU0O1vuytEZU/YuogAdyyhqnvlqIjipeDeeXUxABLqeyMnyNQ807WVbv/FL/LmTRKphsRxurl+rz66HhcN6WMjL/oJccjWZRlmZsS9iJdxACf3l49/rIJvL0VRra1yW7XXjZ24SN9u6AWBsBzp3mMDr1acRscnkBTRvBNdmkUWosRKsNLHA7WvMziI7lH8JPVcc450d/SIc8G+GNWH4efXXe+lp+j9Kkr28ZfukNTrCJ19qz+//rzb2QEalk6Lxv4vPDUF5FmZvlzExHyH10J+V7zx9PEqeEA8p77foouJaUw1B+DXmzr35CJuBREbMNxhks232d/+7RPOJVBDFGwDjO2MWR39UknJo9u/QBiLWoIbyFL6uHi/dRUhT4LJ1qILqBJyAUQ5lOmZarHlOgvS7sXB7YdcRZyKW57pvyoC/AlnbuBui+sDTNo6aqSP+PaS2HgnxsRAP6sz3ckc/gVeUm5fUt/EHBtYQSiYIYWvPFOd0ONExxWWsnJ6xsuPcxaQ3hsw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(18002099003)(22082099003)(3023799007)(4143699003)(10067099003)(260925021311599003)(260925021911599003)(260925022911599003)(56012099006)(11063799006)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DaF6ScPdHrVmPGyaZFXprZg35Dl0TeD9ARG3qf81WV6lzCm/KJtLDn9aiChv?=
 =?us-ascii?Q?0dgG/s/Lv5tbTWzOAso+M5dqzSRKsrfv644vEIhIGPJNhIJcIuuCdJhIRgKk?=
 =?us-ascii?Q?GAibvmSmenuY3n2Pg/zPBPBwkhASQ0u3/dP0lY/cFr8ZpUdEgGYWmfzhBeSA?=
 =?us-ascii?Q?ANiR2Wq430oOLmE4HQbXcFS0tTvYn+Jx96bPo3Hi3TcGzmD4qCE2PeHEqPPc?=
 =?us-ascii?Q?nH/zuuzpuuWk3y+q2btrEX/PrUI94hYr1iOb6GSWIeOWG/163i+8TwC/ObMl?=
 =?us-ascii?Q?IrWGt7iNy+mMnamK3mr+v1t5u2RF0Q1STLYhzUrSkCQ05ErESz9DxbZDEwPk?=
 =?us-ascii?Q?JRxAvo9wrhzO/pQJ4/XxrinXa1e7HVbtGMFhCc2Dwrxawb/wgYp9G43Fe3mC?=
 =?us-ascii?Q?3Y3ruhZxm5V/81Rvn89WmdeAj2SMJsCoT6YEg6Ch8GPVGMBEd82XM/0roybX?=
 =?us-ascii?Q?moCm4x9THD4QJrBdjYTt2e/v4nzkj+jQPWQoYJxYDb6go5D1/8Wk3tGkcexB?=
 =?us-ascii?Q?nj+j5SACEFvIhpUtMjcV9MyhJQYU19yIMp+WpQhiiFtylvaN5wGKXpSox8J6?=
 =?us-ascii?Q?lCY3PyjAv7TalFbWj2mhZLYCDsi8wZdyRtwvJj7A/KE400mI5nEJISVWvBhy?=
 =?us-ascii?Q?3ocg3I2zMFHXpqmI8LJ/ffxZCA6ukirBSzbf2GuELk+W/ZDo8du8OeNacpTu?=
 =?us-ascii?Q?AWMM8QXnmMSKPH2o98wY7HWLXDPYttdebV59fj3Ha6WYGOMLDewF15m9WXdE?=
 =?us-ascii?Q?K27VbArITsjXOFPwjpodRpOhFTa+qRftquF/LVhqZTiNdq9F4GFht5YmkUza?=
 =?us-ascii?Q?1lW4+iL9UQlgQinCg86RpcTUW4gHZ7iidyvbsgTcZ8hFjnH7My+HJtK8LwPO?=
 =?us-ascii?Q?PmnnCpRsEsysA5LU/CRmEWNjAA4mgFcvBsKywY7kD2/yqsbqjmc56SsHtCuA?=
 =?us-ascii?Q?ckzPUud1Lr6F/HuudYRPSyZuZJk8J+ei8YeoxHKIwW3Zob5w3mzMzPooEErt?=
 =?us-ascii?Q?G59xXKTFKiQthB6T01pyyBgCR7punXTXKDU8cwJaBdX5xSJe9rHk20AfVwnf?=
 =?us-ascii?Q?12IzEEcDmK7T01DcOiRx3vWfFFInbaA6hrPdk6tQSzfBJfCMuQl3L2Ir1GmS?=
 =?us-ascii?Q?IpgbmsOXIyMd5H7L/6epve2y0ORKTsTRCDkO5/DkW9Qwcj49aOl6J3YHjqV9?=
 =?us-ascii?Q?3AYxH97r+U5m/I4VIcizsHk+PCXt9aO1nF7IYDEampwOaHz5gUfer5qOGw+u?=
 =?us-ascii?Q?oy4+c8DNcwNJ1AeiduR7r+toCmJz2nF7u1ufSejtaK1Qn30+mRlLzlbv6Qto?=
 =?us-ascii?Q?GvGB6oQbxp55vUHudrSqMjQeLohYnN0esF3TjwfGQu8GGcrAx/tc6pmuXTkM?=
 =?us-ascii?Q?DyamAFJOcOiXXpLlhkLkexyKOGfPlmBoN2ny0WuetxPqpL+ChA/NkpgxRBRN?=
 =?us-ascii?Q?bOIYVMgjaGBHqJuIyoVE7gd3jpsSalKWwZa1F7ymCaqNCB/wP2dCSoHIlDLN?=
 =?us-ascii?Q?73DatJYRf4H7SQEUpl+OhtNe98iIBdclPy62H/Dn/o3iPstH7xwztgQCO6j9?=
 =?us-ascii?Q?AcKdlpiD2JCq7jJooVwjegt04Q/npomb26VNthpWS6eeOCnWfjFDWw3rokCU?=
 =?us-ascii?Q?7DcKApoC33xy2Pj5eXLEC+lNCxtGUI04W4/ekS/sZIQtV1b+HUBMMYbDjjvt?=
 =?us-ascii?Q?YmJA8j4TcJSEO65UrBIuRLtzam5jvfiIuq+KABNoHCwqHTePJHm9KLlwXCKh?=
 =?us-ascii?Q?GOCTQQuFu+J5P09/8DCV9xeD4JDQPZM=3D?=
X-Exchange-RoutingPolicyChecked: WYjyl2NiQwxzeOde9Z0jt6TU5/jPJNGq6WQuekipcIdnnz+QTNEYdQy9erpAov1r4Ne+w7CPdW+Lap7Xty6E1h4bEcwvtX+6xJg9finA1EYqWzd/4S+n2BV13cd5GRBnmYPCh3nYCvTj2/u4i3OWwDR7D6qXZgmgRyoCb0zNZtY0644VU1oNRzmhbLuGcPWUnbLo/njXsyFMT0cQ843gzr5f4jM0VKeJMzYjQg8U/W8mlkVLgLPjzsXqITzNaCp9v8HQT5z2Wt6vIrk6UTwPsiQhc8lHTK14xtGZDVF34ynHB73NtgbYvkHEv+yMGyfpHavqWmHAIvtWN41GHX8rJw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 295ee2b4-887d-44ca-9c3f-08df1d7660ca
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 15:37:18.0355 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3sxiSMcjHdG5/IiWPclPs6KcsjyiQFS7cZ01pdPfGyQ2hb3GbXBY42J635dlJ5FE/VBkVUJ9kA5GTFsLEeBZ/8G1GZXMEMtDp4soWRDDXmo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR11MB298041
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

On Sat, Sep 26, 2026 at 04:18:42AM -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe/xe3p_lpg: Add support for Wa_16030224309 (rev2)
> URL   : https://patchwork.freedesktop.org/series/174684/
> State : success
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74_FULL -> xe-pw-174684v2_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **SUCCESS**
> 
>   No regressions found.

Applied to drm-xe-next.  Thanks for the patch and reviews.


Matt

> 
>   
> 
> Participating hosts (3 -> 3)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-174684v2_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@intel_hwmon@hwmon-read:
>     - shard-lnl:          NOTRUN -> [SKIP][1] ([Intel XE#1125] / [Intel XE#7312])
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-lnl-5/igt@intel_hwmon@hwmon-read.html
>     - shard-ptl:          NOTRUN -> [SKIP][2] ([Intel XE#7225])
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-ptl-2/igt@intel_hwmon@hwmon-read.html
> 
>   * igt@kms_async_flips@async-flip-suspend-resume@pipe-c-hdmi-a-3:
>     - shard-bmg:          NOTRUN -> [ABORT][3] ([Intel XE#9399] / [Intel XE#9405]) +1 other test abort
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-bmg-3/igt@kms_async_flips@async-flip-suspend-resume@pipe-c-hdmi-a-3.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
>     - shard-ptl:          NOTRUN -> [SKIP][4] ([Intel XE#5947])
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-ptl-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
> 
>   * igt@kms_big_fb@4-tiled-16bpp-rotate-270:
>     - shard-ptl:          NOTRUN -> [SKIP][5] ([Intel XE#5901]) +1 other test skip
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-ptl-6/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
>     - shard-lnl:          NOTRUN -> [SKIP][6] ([Intel XE#3658] / [Intel XE#7360])
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
>     - shard-lnl:          NOTRUN -> [SKIP][7] ([Intel XE#1407]) +1 other test skip
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
> 
>   * igt@kms_big_fb@linear-64bpp-rotate-90:
>     - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#2327]) +3 other tests skip
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-bmg-3/igt@kms_big_fb@linear-64bpp-rotate-90.html
> 
>   * igt@kms_big_fb@y-tiled-16bpp-rotate-180:
>     - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#1124]) +6 other tests skip
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-bmg-9/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb:
>     - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#2328] / [Intel XE#7367])
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-bmg-2/igt@kms_big_fb@yf-tiled-addfb.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:
>     - shard-lnl:          NOTRUN -> [SKIP][11] ([Intel XE#1124]) +3 other tests skip
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-lnl-2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>     - shard-ptl:          NOTRUN -> [SKIP][12] ([Intel XE#5808]) +5 other tests skip
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-ptl-6/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_bw@connected-linear-tiling-3-displays-target-2160x1440p:
>     - shard-lnl:          NOTRUN -> [SKIP][13] ([Intel XE#7679]) +1 other test skip
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-lnl-3/igt@kms_bw@connected-linear-tiling-3-displays-target-2160x1440p.html
> 
>   * igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p:
>     - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#7679]) +1 other test skip
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-bmg-3/igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p.html
> 
>   * igt@kms_bw@linear-tiling-1-displays-target-1920x1080p:
>     - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#367]) +1 other test skip
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-bmg-9/igt@kms_bw@linear-tiling-1-displays-target-1920x1080p.html
> 
>   * igt@kms_bw@linear-tiling-2-displays-target-3840x2160p:
>     - shard-lnl:          NOTRUN -> [SKIP][16] ([Intel XE#367])
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-lnl-5/igt@kms_bw@linear-tiling-2-displays-target-3840x2160p.html
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:
>     - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#2887]) +3 other tests skip
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-lnl-5/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html
> 
>   * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:
>     - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#2887]) +12 other tests skip
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-bmg-9/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#2669] / [Intel XE#7389]) +3 other tests skip
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-lnl-2/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-b-dp-2:
>     - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#2652]) +7 other tests skip
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-bmg-1/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-b-dp-2.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:
>     - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#3432])
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html
> 
>   * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:
>     - shard-ptl:          NOTRUN -> [SKIP][22] ([Intel XE#5822]) +3 other tests skip
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-ptl-6/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html
> 
>   * igt@kms_chamelium_color@ctm-red-to-blue:
>     - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#2325] / [Intel XE#7358]) +1 other test skip
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-bmg-4/igt@kms_chamelium_color@ctm-red-to-blue.html
> 
>   * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d:
>     - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#7358])
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-lnl-2/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d.html
> 
>   * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim:
>     - shard-ptl:          NOTRUN -> [SKIP][25] ([Intel XE#8391]) +1 other test skip
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-ptl-6/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim.html
> 
>   * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d:
>     - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#7358]) +2 other tests skip
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-bmg-3/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d.html
> 
>   * igt@kms_chamelium_edid@dp-edid-change-during-suspend:
>     - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#373]) +4 other tests skip
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-lnl-2/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html
> 
>   * igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate:
>     - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#2252]) +4 other tests skip
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-bmg-1/igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html
> 
>   * igt@kms_chamelium_edid@hdmi-mode-timings:
>     - shard-ptl:          NOTRUN -> [SKIP][29] ([Intel XE#2252]) +2 other tests skip
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-ptl-2/igt@kms_chamelium_edid@hdmi-mode-timings.html
> 
>   * igt@kms_color_pipeline@plane-ctm3x4@pipe-a-plane-3:
>     - shard-ptl:          NOTRUN -> [SKIP][30] ([Intel XE#6969]) +15 other tests skip
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-ptl-6/igt@kms_color_pipeline@plane-ctm3x4@pipe-a-plane-3.html
> 
>   * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d@pipe-d-plane-1:
>     - shard-bmg:          NOTRUN -> [FAIL][31] ([Intel XE#9333]) +24 other tests fail
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-bmg-3/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d@pipe-d-plane-1.html
> 
>   * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim@pipe-c-plane-2:
>     - shard-lnl:          NOTRUN -> [FAIL][32] ([Intel XE#9333]) +9 other tests fail
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-lnl-2/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim@pipe-c-plane-2.html
> 
>   * igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-a-plane-4:
>     - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#6969]) +11 other tests skip
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-lnl-3/igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-a-plane-4.html
> 
>   * igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-b-plane-4:
>     - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#6969]) +15 other tests skip
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-bmg-2/igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-b-plane-4.html
> 
>   * igt@kms_content_protection@dp-mst-type-0:
>     - shard-ptl:          NOTRUN -> [SKIP][35] ([Intel XE#5832] / [Intel XE#6974])
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-ptl-6/igt@kms_content_protection@dp-mst-type-0.html
> 
>   * igt@kms_content_protection@dp-mst-type-0-suspend-resume:
>     - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#6974]) +1 other test skip
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-bmg-3/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html
> 
>   * igt@kms_content_protection@dp-mst-type-1:
>     - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#307] / [Intel XE#6974])
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-lnl-2/igt@kms_content_protection@dp-mst-type-1.html
> 
>   * igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2:
>     - shard-bmg:          NOTRUN -> [FAIL][38] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +1 other test fail
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-bmg-9/igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-max-size:
>     - shard-ptl:          NOTRUN -> [SKIP][39] ([Intel XE#5900])
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-ptl-6/igt@kms_cursor_crc@cursor-offscreen-max-size.html
> 
>   * igt@kms_cursor_crc@cursor-random-512x512:
>     - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#2321] / [Intel XE#7355]) +1 other test skip
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-bmg-9/igt@kms_cursor_crc@cursor-random-512x512.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-256x85:
>     - shard-lnl:          NOTRUN -> [SKIP][41] ([Intel XE#1424])
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-lnl-2/igt@kms_cursor_crc@cursor-sliding-256x85.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-32x32:
>     - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#2320])
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-bmg-2/igt@kms_cursor_crc@cursor-sliding-32x32.html
> 
>   * igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1:
>     - shard-ptl:          [PASS][43] -> [ABORT][44] ([Intel XE#9362]) +5 other tests abort
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-ptl-3/igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1.html
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-ptl-8/igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1.html
> 
>   * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
>     - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#309] / [Intel XE#7343]) +2 other tests skip
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-lnl-2/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
>     - shard-ptl:          NOTRUN -> [SKIP][46] ([Intel XE#5962] / [Intel XE#7343]) +1 other test skip
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-ptl-6/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
>     - shard-ptl:          NOTRUN -> [SKIP][47] ([Intel XE#6035])
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-ptl-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
>     - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#2286] / [Intel XE#6035])
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-bmg-9/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
> 
>   * igt@kms_dsc@dsc-fractional-bpp-ultrajoiner:
>     - shard-lnl:          NOTRUN -> [SKIP][49] ([Intel XE#8265]) +1 other test skip
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-lnl-5/igt@kms_dsc@dsc-fractional-bpp-ultrajoiner.html
> 
>   * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
>     - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#8265]) +2 other tests skip
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-bmg-3/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
> 
>   * igt@kms_dsc@dsc-fractional-bpp-with-bpc-bigjoiner:
>     - shard-ptl:          NOTRUN -> [SKIP][51] ([Intel XE#5907])
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-ptl-6/igt@kms_dsc@dsc-fractional-bpp-with-bpc-bigjoiner.html
> 
>   * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:
>     - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#4422] / [Intel XE#7442])
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-bmg-3/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html
> 
>   * igt@kms_feature_discovery@display-4x:
>     - shard-ptl:          NOTRUN -> [SKIP][53] ([Intel XE#7344])
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-ptl-6/igt@kms_feature_discovery@display-4x.html
> 
>   * igt@kms_feature_discovery@dp-mst:
>     - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#2375])
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-bmg-2/igt@kms_feature_discovery@dp-mst.html
> 
>   * igt@kms_feature_discovery@dsc:
>     - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#8586])
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-bmg-9/igt@kms_feature_discovery@dsc.html
> 
>   * igt@kms_feature_discovery@hdr:
>     - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#8586])
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-lnl-2/igt@kms_feature_discovery@hdr.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
>     - shard-ptl:          NOTRUN -> [SKIP][57] ([Intel XE#2316])
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-ptl-6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
>     - shard-lnl:          [PASS][58] -> [FAIL][59] ([Intel XE#301])
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-32bpp-linear-reflect-x:
>     - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#7179])
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-32bpp-linear-reflect-x.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:
>     - shard-lnl:          NOTRUN -> [SKIP][61] ([Intel XE#7178] / [Intel XE#7351])
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-lnl-2/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
>     - shard-ptl:          NOTRUN -> [SKIP][62] ([Intel XE#7178]) +1 other test skip
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-ptl-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling:
>     - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#7178] / [Intel XE#7351])
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-bmg-9/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling.html
> 
>   * igt@kms_frontbuffer_tracking@drrshdr-1p-offscreen-pri-shrfb-draw-render:
>     - shard-ptl:          NOTRUN -> [SKIP][64] ([Intel XE#6312]) +2 other tests skip
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-ptl-2/igt@kms_frontbuffer_tracking@drrshdr-1p-offscreen-pri-shrfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-spr-indfb-onoff:
>     - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#6312]) +3 other tests skip
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-lnl-2/igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-spr-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
>     - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#4141]) +8 other tests skip
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-render:
>     - shard-lnl:          NOTRUN -> [SKIP][67] ([Intel XE#7061] / [Intel XE#7356]) +2 other tests skip
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-lnl-2/igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-render:
>     - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#2311]) +41 other tests skip
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
>     - shard-lnl:          NOTRUN -> [SKIP][69] ([Intel XE#6312] / [Intel XE#651]) +6 other tests skip
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-pgflip-blt:
>     - shard-ptl:          NOTRUN -> [SKIP][70] ([Intel XE#5800] / [Intel XE#6312]) +3 other tests skip
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-ptl-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-render:
>     - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#7061] / [Intel XE#7356]) +3 other tests skip
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
>     - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#2352] / [Intel XE#7399])
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
> 
>   * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-blt:
>     - shard-lnl:          NOTRUN -> [SKIP][73] ([Intel XE#7865]) +8 other tests skip
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-lnl-2/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-render:
>     - shard-lnl:          NOTRUN -> [SKIP][74] ([Intel XE#7905]) +17 other tests skip
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-lnl-3/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbchdr-abgr161616f-draw-render:
>     - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#7061]) +2 other tests skip
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbchdr-abgr161616f-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4:
>     - shard-ptl:          NOTRUN -> [SKIP][76] ([Intel XE#7865]) +5 other tests skip
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-ptl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4.html
> 
>   * igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-blt:
>     - shard-ptl:          NOTRUN -> [SKIP][77] ([Intel XE#7061])
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-ptl-6/igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@plane-fbc-rte:
>     - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#2350] / [Intel XE#7503])
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-bmg-2/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:
>     - shard-ptl:          NOTRUN -> [SKIP][79] ([Intel XE#5812]) +28 other tests skip
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-ptl-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-fullscreen:
>     - shard-lnl:          NOTRUN -> [SKIP][80] ([Intel XE#656] / [Intel XE#7905]) +11 other tests skip
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-lnl-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-fullscreen.html
> 
>   * igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-move:
>     - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#2313]) +39 other tests skip
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-bmg-9/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-move.html
> 
>   * igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-render:
>     - shard-lnl:          NOTRUN -> [SKIP][82] ([Intel XE#7061]) +2 other tests skip
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-lnl-3/igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-render.html
> 
>   * igt@kms_hdmi_audio_bw@dpms-audio-recovery:
>     - shard-lnl:          NOTRUN -> [SKIP][83] ([Intel XE#9312])
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-lnl-2/igt@kms_hdmi_audio_bw@dpms-audio-recovery.html
> 
>   * igt@kms_joiner@basic-big-joiner:
>     - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#6901])
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-bmg-9/igt@kms_joiner@basic-big-joiner.html
> 
>   * igt@kms_joiner@invalid-modeset-force-big-joiner:
>     - shard-lnl:          NOTRUN -> [SKIP][85] ([Intel XE#7086] / [Intel XE#7390])
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-lnl-2/igt@kms_joiner@invalid-modeset-force-big-joiner.html
> 
>   * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
>     - shard-ptl:          NOTRUN -> [SKIP][86] ([Intel XE#7591])
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-ptl-6/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
> 
>   * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier:
>     - shard-lnl:          NOTRUN -> [SKIP][87] ([Intel XE#7283]) +1 other test skip
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-lnl-2/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier.html
> 
>   * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier:
>     - shard-ptl:          NOTRUN -> [SKIP][88] ([Intel XE#7283])
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-ptl-6/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier.html
> 
>   * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping:
>     - shard-bmg:          NOTRUN -> [SKIP][89] ([Intel XE#7283]) +2 other tests skip
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-bmg-9/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping.html
> 
>   * igt@kms_plane_multiple@2x-tiling-yf:
>     - shard-ptl:          NOTRUN -> [SKIP][90] ([Intel XE#4596] / [Intel XE#5854])
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-ptl-6/igt@kms_plane_multiple@2x-tiling-yf.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size:
>     - shard-ptl:          NOTRUN -> [SKIP][91] ([Intel XE#5959])
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-ptl-6/igt@kms_plane_scaling@intel-max-src-size.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c:
>     - shard-bmg:          NOTRUN -> [SKIP][92] ([Intel XE#2763] / [Intel XE#6886]) +4 other tests skip
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-bmg-9/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c.html
> 
>   * igt@kms_pm_backlight@bad-brightness:
>     - shard-bmg:          NOTRUN -> [SKIP][93] ([Intel XE#7376] / [Intel XE#7760] / [Intel XE#870])
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-bmg-2/igt@kms_pm_backlight@bad-brightness.html
> 
>   * igt@kms_pm_dc@dc3co-after-dc6@pr-xrgb8888:
>     - shard-ptl:          NOTRUN -> [SKIP][94] ([Intel XE#8395] / [Intel XE#8396]) +1 other test skip
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-ptl-6/igt@kms_pm_dc@dc3co-after-dc6@pr-xrgb8888.html
> 
>   * igt@kms_pm_dc@dc3co-after-dc6@psr2-yuv420:
>     - shard-ptl:          NOTRUN -> [SKIP][95] ([Intel XE#8396]) +1 other test skip
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-ptl-6/igt@kms_pm_dc@dc3co-after-dc6@psr2-yuv420.html
> 
>   * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
>     - shard-lnl:          NOTRUN -> [SKIP][96] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383])
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-lnl-5/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
> 
>   * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:
>     - shard-lnl:          NOTRUN -> [SKIP][97] ([Intel XE#2893] / [Intel XE#7304])
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-lnl-5/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
>     - shard-lnl:          NOTRUN -> [SKIP][98] ([Intel XE#2893] / [Intel XE#4608] / [Intel XE#7304]) +1 other test skip
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][99] ([Intel XE#4608]) +1 other test skip
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1:
>     - shard-ptl:          NOTRUN -> [SKIP][100] ([Intel XE#5858])
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-ptl-6/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-b-edp-1:
>     - shard-ptl:          NOTRUN -> [SKIP][101] ([Intel XE#5858] / [Intel XE#7304]) +1 other test skip
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-ptl-6/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-b-edp-1.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
>     - shard-bmg:          NOTRUN -> [SKIP][102] ([Intel XE#1489]) +7 other tests skip
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-bmg-9/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area@pipe-b-edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][103] ([Intel XE#4608] / [Intel XE#7304]) +1 other test skip
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-lnl-3/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area@pipe-b-edp-1.html
> 
>   * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:
>     - shard-ptl:          NOTRUN -> [SKIP][104] ([Intel XE#7304])
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-ptl-6/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html
> 
>   * igt@kms_psr2_su@page_flip-nv12:
>     - shard-bmg:          NOTRUN -> [SKIP][105] ([Intel XE#2387] / [Intel XE#7429])
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-bmg-2/igt@kms_psr2_su@page_flip-nv12.html
> 
>   * igt@kms_psr@pr-primary-blt:
>     - shard-lnl:          NOTRUN -> [SKIP][106] ([Intel XE#1406]) +1 other test skip
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-lnl-5/igt@kms_psr@pr-primary-blt.html
> 
>   * igt@kms_psr@pr-sprite-plane-onoff:
>     - shard-ptl:          NOTRUN -> [SKIP][107] ([Intel XE#1406]) +1 other test skip
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-ptl-6/igt@kms_psr@pr-sprite-plane-onoff.html
> 
>   * igt@kms_psr@pr-suspend:
>     - shard-bmg:          NOTRUN -> [SKIP][108] ([Intel XE#2234] / [Intel XE#2850]) +11 other tests skip
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-bmg-3/igt@kms_psr@pr-suspend.html
> 
>   * igt@kms_rotation_crc@bad-tiling:
>     - shard-lnl:          NOTRUN -> [SKIP][109] ([Intel XE#3414] / [Intel XE#3904] / [Intel XE#7342]) +1 other test skip
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-lnl-2/igt@kms_rotation_crc@bad-tiling.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
>     - shard-lnl:          NOTRUN -> [SKIP][110] ([Intel XE#1127] / [Intel XE#5813])
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-lnl-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
> 
>   * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
>     - shard-bmg:          NOTRUN -> [SKIP][111] ([Intel XE#3904] / [Intel XE#7342]) +1 other test skip
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-bmg-4/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
> 
>   * igt@kms_sharpness_filter@filter-toggle:
>     - shard-bmg:          NOTRUN -> [SKIP][112] ([Intel XE#6503]) +1 other test skip
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-bmg-1/igt@kms_sharpness_filter@filter-toggle.html
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-ptl:          NOTRUN -> [SKIP][113] ([Intel XE#5848])
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-ptl-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   * igt@kms_vrr@flip-suspend:
>     - shard-bmg:          NOTRUN -> [SKIP][114] ([Intel XE#1499] / [Intel XE#9271])
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-bmg-4/igt@kms_vrr@flip-suspend.html
> 
>   * igt@kms_vrr@flipline@pipe-a-edp-1:
>     - shard-ptl:          [PASS][115] -> [FAIL][116] ([Intel XE#4227] / [Intel XE#7397]) +3 other tests fail
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-ptl-2/igt@kms_vrr@flipline@pipe-a-edp-1.html
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-ptl-3/igt@kms_vrr@flipline@pipe-a-edp-1.html
> 
>   * igt@kms_vrr@lobf:
>     - shard-bmg:          NOTRUN -> [SKIP][117] ([Intel XE#2168] / [Intel XE#7444])
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-bmg-9/igt@kms_vrr@lobf.html
> 
>   * igt@kms_vrr@negative-basic:
>     - shard-lnl:          NOTRUN -> [SKIP][118] ([Intel XE#1499] / [Intel XE#9271])
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-lnl-2/igt@kms_vrr@negative-basic.html
> 
>   * igt@xe_ccs@suspend-resume:
>     - shard-bmg:          [PASS][119] -> [ABORT][120] ([Intel XE#9362]) +3 other tests abort
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-10/igt@xe_ccs@suspend-resume.html
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-bmg-10/igt@xe_ccs@suspend-resume.html
> 
>   * igt@xe_ccs@vm-bind-fault-mode-decompress:
>     - shard-lnl:          NOTRUN -> [SKIP][121] ([Intel XE#7644])
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-lnl-5/igt@xe_ccs@vm-bind-fault-mode-decompress.html
> 
>   * igt@xe_evict@evict-beng-small:
>     - shard-ptl:          NOTRUN -> [SKIP][122] ([Intel XE#5764]) +2 other tests skip
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-ptl-6/igt@xe_evict@evict-beng-small.html
> 
>   * igt@xe_evict@evict-beng-threads-large-multi-vm:
>     - shard-lnl:          NOTRUN -> [SKIP][123] ([Intel XE#6540] / [Intel XE#688]) +3 other tests skip
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-lnl-3/igt@xe_evict@evict-beng-threads-large-multi-vm.html
> 
>   * igt@xe_exec_balancer@twice-cm-virtual-userptr-rebind:
>     - shard-lnl:          NOTRUN -> [SKIP][124] ([Intel XE#7482]) +4 other tests skip
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-lnl-2/igt@xe_exec_balancer@twice-cm-virtual-userptr-rebind.html
> 
>   * igt@xe_exec_balancer@twice-virtual-rebind:
>     - shard-ptl:          NOTRUN -> [SKIP][125] ([Intel XE#7482]) +5 other tests skip
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-ptl-6/igt@xe_exec_balancer@twice-virtual-rebind.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:
>     - shard-ptl:          NOTRUN -> [SKIP][126] ([Intel XE#5575] / [Intel XE#7484]) +1 other test skip
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-ptl-6/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind:
>     - shard-lnl:          NOTRUN -> [SKIP][127] ([Intel XE#1392]) +2 other tests skip
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-lnl-2/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind.html
> 
>   * igt@xe_exec_basic@multigpu-once-null-rebind:
>     - shard-bmg:          NOTRUN -> [SKIP][128] ([Intel XE#2322] / [Intel XE#7372]) +5 other tests skip
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-bmg-9/igt@xe_exec_basic@multigpu-once-null-rebind.html
> 
>   * igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr:
>     - shard-ptl:          NOTRUN -> [SKIP][129] ([Intel XE#8374]) +2 other tests skip
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-ptl-6/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr.html
> 
>   * igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-rebind-prefetch:
>     - shard-lnl:          NOTRUN -> [SKIP][130] ([Intel XE#8374]) +4 other tests skip
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-lnl-2/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-rebind-prefetch.html
> 
>   * igt@xe_exec_fault_mode@many-multi-queue-rebind:
>     - shard-bmg:          NOTRUN -> [SKIP][131] ([Intel XE#8374]) +4 other tests skip
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-bmg-3/igt@xe_exec_fault_mode@many-multi-queue-rebind.html
> 
>   * igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-close-fd-smem:
>     - shard-ptl:          NOTRUN -> [SKIP][132] ([Intel XE#8364]) +7 other tests skip
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-ptl-6/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-close-fd-smem.html
> 
>   * igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-dyn-priority-smem:
>     - shard-bmg:          NOTRUN -> [SKIP][133] ([Intel XE#8364]) +17 other tests skip
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-bmg-4/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-dyn-priority-smem.html
> 
>   * igt@xe_exec_multi_queue@two-queues-preempt-mode-userptr-invalidate:
>     - shard-lnl:          NOTRUN -> [SKIP][134] ([Intel XE#8364]) +9 other tests skip
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-lnl-2/igt@xe_exec_multi_queue@two-queues-preempt-mode-userptr-invalidate.html
> 
>   * igt@xe_exec_reset@cm-multi-queue-cat-error-on-secondary:
>     - shard-bmg:          NOTRUN -> [SKIP][135] ([Intel XE#8369]) +1 other test skip
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-bmg-3/igt@xe_exec_reset@cm-multi-queue-cat-error-on-secondary.html
> 
>   * igt@xe_exec_reset@cm-multi-queue-close-fd:
>     - shard-ptl:          NOTRUN -> [SKIP][136] ([Intel XE#8369]) +1 other test skip
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-ptl-6/igt@xe_exec_reset@cm-multi-queue-close-fd.html
> 
>   * igt@xe_exec_reset@gt-reset-fault-injection:
>     - shard-bmg:          NOTRUN -> [DMESG-WARN][137] ([Intel XE#9130])
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-bmg-1/igt@xe_exec_reset@gt-reset-fault-injection.html
>     - shard-ptl:          NOTRUN -> [DMESG-WARN][138] ([Intel XE#9130])
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-ptl-2/igt@xe_exec_reset@gt-reset-fault-injection.html
>     - shard-lnl:          NOTRUN -> [DMESG-WARN][139] ([Intel XE#9130])
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-lnl-5/igt@xe_exec_reset@gt-reset-fault-injection.html
> 
>   * igt@xe_exec_system_allocator@many-stride-new-prefetch:
>     - shard-bmg:          NOTRUN -> [INCOMPLETE][140] ([Intel XE#7098] / [Intel XE#8159])
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-bmg-1/igt@xe_exec_system_allocator@many-stride-new-prefetch.html
> 
>   * igt@xe_exec_threads@threads-hang-userptr-invalidate-race:
>     - shard-ptl:          [PASS][141] -> [FAIL][142] ([Intel XE#9096])
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-ptl-8/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-ptl-4/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html
> 
>   * igt@xe_exec_threads@threads-multi-queue-cm-fd-basic:
>     - shard-ptl:          NOTRUN -> [SKIP][143] ([Intel XE#8378]) +2 other tests skip
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-ptl-6/igt@xe_exec_threads@threads-multi-queue-cm-fd-basic.html
> 
>   * igt@xe_exec_threads@threads-multi-queue-mixed-fd-basic:
>     - shard-lnl:          NOTRUN -> [SKIP][144] ([Intel XE#8378])
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-lnl-3/igt@xe_exec_threads@threads-multi-queue-mixed-fd-basic.html
> 
>   * igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate:
>     - shard-bmg:          NOTRUN -> [SKIP][145] ([Intel XE#8378]) +3 other tests skip
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-bmg-9/igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate.html
> 
>   * igt@xe_live_ktest@xe_eudebug:
>     - shard-bmg:          NOTRUN -> [SKIP][146] ([Intel XE#2833])
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-bmg-3/igt@xe_live_ktest@xe_eudebug.html
> 
>   * igt@xe_media_fill@media-fill:
>     - shard-bmg:          NOTRUN -> [SKIP][147] ([Intel XE#2459] / [Intel XE#2596] / [Intel XE#7321] / [Intel XE#7453])
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-bmg-9/igt@xe_media_fill@media-fill.html
> 
>   * igt@xe_mempage_offline@inject-duplicate-page:
>     - shard-lnl:          NOTRUN -> [SKIP][148] ([Intel XE#9203])
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-lnl-2/igt@xe_mempage_offline@inject-duplicate-page.html
> 
>   * igt@xe_multigpu_svm@mgpu-coherency-fail-basic:
>     - shard-bmg:          NOTRUN -> [SKIP][149] ([Intel XE#6964]) +1 other test skip
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-bmg-9/igt@xe_multigpu_svm@mgpu-coherency-fail-basic.html
> 
>   * igt@xe_multigpu_svm@mgpu-latency-basic:
>     - shard-ptl:          NOTRUN -> [SKIP][150] ([Intel XE#6964]) +1 other test skip
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-ptl-6/igt@xe_multigpu_svm@mgpu-latency-basic.html
> 
>   * igt@xe_multigpu_svm@mgpu-pagefault-basic:
>     - shard-lnl:          NOTRUN -> [SKIP][151] ([Intel XE#6964]) +1 other test skip
>    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-lnl-3/igt@xe_multigpu_svm@mgpu-pagefault-basic.html
> 
>   * igt@xe_page_reclaim@binds-1g-partial:
>     - shard-bmg:          NOTRUN -> [SKIP][152] ([Intel XE#7793])
>    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-bmg-3/igt@xe_page_reclaim@binds-1g-partial.html
> 
>   * igt@xe_page_reclaim@invalid-1g:
>     - shard-lnl:          NOTRUN -> [SKIP][153] ([Intel XE#7793])
>    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-lnl-2/igt@xe_page_reclaim@invalid-1g.html
> 
>   * igt@xe_pat@pat-index-xelp:
>     - shard-bmg:          NOTRUN -> [SKIP][154] ([Intel XE#2245] / [Intel XE#7590])
>    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-bmg-9/igt@xe_pat@pat-index-xelp.html
> 
>   * igt@xe_pat@xa-app-transient-media-off:
>     - shard-bmg:          NOTRUN -> [SKIP][155] ([Intel XE#7590])
>    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-bmg-9/igt@xe_pat@xa-app-transient-media-off.html
> 
>   * igt@xe_pm@d3cold-mmap-system:
>     - shard-ptl:          NOTRUN -> [SKIP][156] ([Intel XE#5741])
>    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-ptl-6/igt@xe_pm@d3cold-mmap-system.html
> 
>   * igt@xe_pm@d3hot-mmap-vram:
>     - shard-lnl:          NOTRUN -> [SKIP][157] ([Intel XE#1948])
>    [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-lnl-3/igt@xe_pm@d3hot-mmap-vram.html
> 
>   * igt@xe_pm@s3-vm-bind-prefetch:
>     - shard-ptl:          NOTRUN -> [SKIP][158] ([Intel XE#6867])
>    [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-ptl-6/igt@xe_pm@s3-vm-bind-prefetch.html
> 
>   * igt@xe_pm@s3-vm-bind-userptr:
>     - shard-lnl:          NOTRUN -> [SKIP][159] ([Intel XE#584] / [Intel XE#7369])
>    [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-lnl-2/igt@xe_pm@s3-vm-bind-userptr.html
> 
>   * igt@xe_pm@s4-mocs:
>     - shard-ptl:          [PASS][160] -> [DMESG-WARN][161] ([Intel XE#7727])
>    [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-ptl-6/igt@xe_pm@s4-mocs.html
>    [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-ptl-5/igt@xe_pm@s4-mocs.html
> 
>   * igt@xe_pxp@display-pxp-fb:
>     - shard-bmg:          NOTRUN -> [SKIP][162] ([Intel XE#4733] / [Intel XE#7417]) +2 other tests skip
>    [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-bmg-2/igt@xe_pxp@display-pxp-fb.html
> 
>   * igt@xe_query@multigpu-query-cs-cycles:
>     - shard-lnl:          NOTRUN -> [SKIP][163] ([Intel XE#944])
>    [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-lnl-3/igt@xe_query@multigpu-query-cs-cycles.html
> 
>   * igt@xe_query@multigpu-query-invalid-query:
>     - shard-bmg:          NOTRUN -> [SKIP][164] ([Intel XE#944])
>    [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-bmg-3/igt@xe_query@multigpu-query-invalid-query.html
> 
>   * igt@xe_sriov_auto_provisioning@exclusive-ranges:
>     - shard-lnl:          NOTRUN -> [SKIP][165] ([Intel XE#4130] / [Intel XE#7366])
>    [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-lnl-2/igt@xe_sriov_auto_provisioning@exclusive-ranges.html
> 
>   * igt@xe_sriov_flr@flr-basic:
>     - shard-lnl:          NOTRUN -> [SKIP][166] ([Intel XE#7569])
>    [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-lnl-5/igt@xe_sriov_flr@flr-basic.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@core_getversion@all-cards:
>     - shard-bmg:          [FAIL][167] -> [PASS][168]
>    [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-5/igt@core_getversion@all-cards.html
>    [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-bmg-1/igt@core_getversion@all-cards.html
> 
>   * igt@device_reset@unbind-reset-rebind:
>     - shard-bmg:          [SKIP][169] -> [PASS][170]
>    [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-5/igt@device_reset@unbind-reset-rebind.html
>    [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-bmg-1/igt@device_reset@unbind-reset-rebind.html
> 
>   * igt@kms_async_flips@alternate-sync-async-flip-atomic:
>     - shard-bmg:          [FAIL][171] ([Intel XE#3718] / [Intel XE#6078]) -> [PASS][172]
>    [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
>    [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
> 
>   * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2:
>     - shard-bmg:          [FAIL][173] ([Intel XE#6078]) -> [PASS][174]
>    [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2.html
>    [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
>     - shard-bmg:          [INCOMPLETE][175] ([Intel XE#7084] / [Intel XE#8150]) -> [PASS][176] +1 other test pass
>    [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
>    [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-b-dp-2:
>     - shard-bmg:          [DMESG-WARN][177] ([Intel XE#9390]) -> [PASS][178]
>    [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-b-dp-2.html
>    [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-b-dp-2.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
>     - shard-lnl:          [FAIL][179] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][180]
>    [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
>    [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
>     - shard-lnl:          [FAIL][181] ([Intel XE#301]) -> [PASS][182]
>    [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
>    [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible:
>     - shard-bmg:          [DMESG-WARN][183] ([Intel XE#9365]) -> [PASS][184] +1 other test pass
>    [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-1/igt@kms_flip@flip-vs-suspend-interruptible.html
>    [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-bmg-6/igt@kms_flip@flip-vs-suspend-interruptible.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc:
>     - shard-bmg:          [ABORT][185] ([Intel XE#9093]) -> [PASS][186] +2 other tests pass
>    [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-6/igt@kms_pipe_crc_basic@suspend-read-crc.html
>    [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-bmg-9/igt@kms_pipe_crc_basic@suspend-read-crc.html
> 
>   * igt@kms_properties@connector-properties-legacy:
>     - shard-bmg:          [SKIP][187] ([Intel XE#8589]) -> [PASS][188] +145 other tests pass
>    [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-5/igt@kms_properties@connector-properties-legacy.html
>    [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-bmg-1/igt@kms_properties@connector-properties-legacy.html
> 
>   * igt@kms_psr@psr-suspend@edp-1:
>     - shard-ptl:          [ABORT][189] ([Intel XE#9362]) -> [PASS][190] +1 other test pass
>    [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-ptl-7/igt@kms_psr@psr-suspend@edp-1.html
>    [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-ptl-2/igt@kms_psr@psr-suspend@edp-1.html
> 
>   * igt@kms_vrr@flip-basic-fastset:
>     - shard-ptl:          [FAIL][191] ([Intel XE#4227] / [Intel XE#7397]) -> [PASS][192]
>    [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-ptl-2/igt@kms_vrr@flip-basic-fastset.html
>    [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-ptl-7/igt@kms_vrr@flip-basic-fastset.html
> 
>   * igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1:
>     - shard-ptl:          [FAIL][193] ([Intel XE#6293] / [Intel XE#7397]) -> [PASS][194]
>    [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-ptl-2/igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1.html
>    [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-ptl-7/igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1.html
> 
>   * igt@xe_compute_preempt@compute-preempt-many-vram:
>     - shard-bmg:          [ABORT][195] ([Intel XE#7893] / [Intel XE#9250] / [Intel XE#9279]) -> [PASS][196] +1 other test pass
>    [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-3/igt@xe_compute_preempt@compute-preempt-many-vram.html
>    [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-bmg-3/igt@xe_compute_preempt@compute-preempt-many-vram.html
> 
>   * igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute:
>     - shard-bmg:          [DMESG-WARN][197] ([Intel XE#7774]) -> [PASS][198] +1 other test pass
>    [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-5/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html
>    [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-bmg-1/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html
> 
>   * igt@xe_exec_fault_mode@atomic-many:
>     - shard-bmg:          [FAIL][199] ([Intel XE#8578]) -> [PASS][200]
>    [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-6/igt@xe_exec_fault_mode@atomic-many.html
>    [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-bmg-7/igt@xe_exec_fault_mode@atomic-many.html
> 
>   * igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-prefetch-race:
>     - shard-bmg:          [ABORT][201] ([Intel XE#6652]) -> [PASS][202]
>    [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-5/igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-prefetch-race.html
>    [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-bmg-2/igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-prefetch-race.html
> 
>   * igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race:
>     - shard-lnl:          [FAIL][203] ([Intel XE#9096] / [Intel XE#9297]) -> [PASS][204]
>    [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-lnl-6/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html
>    [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-lnl-4/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html
> 
>   * igt@xe_exec_threads@threads-hang-userptr-invalidate-race:
>     - shard-lnl:          [FAIL][205] ([Intel XE#9096]) -> [PASS][206]
>    [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-lnl-1/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html
>    [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-lnl-2/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html
> 
>   * igt@xe_pm@s4-basic:
>     - shard-lnl:          [ABORT][207] ([Intel XE#9362]) -> [PASS][208] +2 other tests pass
>    [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-lnl-8/igt@xe_pm@s4-basic.html
>    [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-lnl-5/igt@xe_pm@s4-basic.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
>     - shard-bmg:          [SKIP][209] ([Intel XE#8589]) -> [SKIP][210] ([Intel XE#2327]) +1 other test skip
>    [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-5/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html
>    [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-bmg-1/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:
>     - shard-bmg:          [SKIP][211] ([Intel XE#8589]) -> [SKIP][212] ([Intel XE#1124])
>    [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html
>    [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-bmg-1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
>     - shard-bmg:          [SKIP][213] ([Intel XE#8589]) -> [SKIP][214] ([Intel XE#2652])
>    [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-5/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html
>    [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-bmg-1/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs:
>     - shard-bmg:          [SKIP][215] ([Intel XE#8589]) -> [SKIP][216] ([Intel XE#2887]) +3 other tests skip
>    [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html
>    [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-bmg-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html
> 
>   * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lut1d:
>     - shard-bmg:          [SKIP][217] ([Intel XE#8589]) -> [SKIP][218] ([Intel XE#7358])
>    [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-5/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lut1d.html
>    [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-bmg-1/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lut1d.html
> 
>   * igt@kms_chamelium_hpd@dp-hpd:
>     - shard-bmg:          [SKIP][219] ([Intel XE#8589]) -> [SKIP][220] ([Intel XE#2252]) +1 other test skip
>    [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-5/igt@kms_chamelium_hpd@dp-hpd.html
>    [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-bmg-1/igt@kms_chamelium_hpd@dp-hpd.html
> 
>   * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601:
>     - shard-bmg:          [SKIP][221] ([Intel XE#8589]) -> [FAIL][222] ([Intel XE#9333])
>    [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-5/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601.html
>    [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-bmg-1/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601.html
> 
>   * igt@kms_content_protection@dp-mst-type-0-hdcp14:
>     - shard-bmg:          [SKIP][223] ([Intel XE#8589]) -> [SKIP][224] ([Intel XE#6974])
>    [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-5/igt@kms_content_protection@dp-mst-type-0-hdcp14.html
>    [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-bmg-1/igt@kms_content_protection@dp-mst-type-0-hdcp14.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-32x32:
>     - shard-bmg:          [SKIP][225] ([Intel XE#8589]) -> [SKIP][226] ([Intel XE#2320]) +1 other test skip
>    [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-5/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html
>    [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-bmg-1/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-512x512:
>     - shard-bmg:          [SKIP][227] ([Intel XE#8589]) -> [SKIP][228] ([Intel XE#2321] / [Intel XE#7355])
>    [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-5/igt@kms_cursor_crc@cursor-sliding-512x512.html
>    [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-bmg-1/igt@kms_cursor_crc@cursor-sliding-512x512.html
> 
>   * igt@kms_dp_linktrain_fallback@dsc-fallback:
>     - shard-bmg:          [SKIP][229] ([Intel XE#8589]) -> [SKIP][230] ([Intel XE#4331] / [Intel XE#7227])
>    [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-5/igt@kms_dp_linktrain_fallback@dsc-fallback.html
>    [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-bmg-1/igt@kms_dp_linktrain_fallback@dsc-fallback.html
> 
>   * igt@kms_dsc@dsc-with-output-formats-with-bpc:
>     - shard-bmg:          [SKIP][231] ([Intel XE#8589]) -> [SKIP][232] ([Intel XE#8265])
>    [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-5/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
>    [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-bmg-1/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible:
>     - shard-lnl:          [FAIL][233] ([Intel XE#301] / [Intel XE#3149]) -> [FAIL][234] ([Intel XE#301])
>    [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
>    [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt:
>     - shard-bmg:          [FAIL][235] -> [SKIP][236] ([Intel XE#2311])
>    [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt.html
>    [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-blt:
>     - shard-bmg:          [SKIP][237] ([Intel XE#8589]) -> [SKIP][238] ([Intel XE#7061]) +2 other tests skip
>    [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-5/igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-blt.html
>    [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-bmg-1/igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
>     - shard-bmg:          [SKIP][239] ([Intel XE#8589]) -> [SKIP][240] ([Intel XE#4141]) +2 other tests skip
>    [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
>    [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-mmap-wc:
>     - shard-bmg:          [SKIP][241] ([Intel XE#8589]) -> [SKIP][242] ([Intel XE#7061] / [Intel XE#7356])
>    [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-mmap-wc.html
>    [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-pri-indfb-draw-render:
>     - shard-bmg:          [SKIP][243] ([Intel XE#8589]) -> [SKIP][244] ([Intel XE#2311]) +10 other tests skip
>    [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-pri-indfb-draw-render.html
>    [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-pri-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:
>     - shard-bmg:          [SKIP][245] ([Intel XE#8589]) -> [SKIP][246] ([Intel XE#2313]) +13 other tests skip
>    [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html
>    [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html
> 
>   * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
>     - shard-bmg:          [SKIP][247] ([Intel XE#8589]) -> [SKIP][248] ([Intel XE#4329] / [Intel XE#6912] / [Intel XE#7375])
>    [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-5/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html
>    [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-bmg-1/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html
> 
>   * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping:
>     - shard-bmg:          [SKIP][249] ([Intel XE#8589]) -> [SKIP][250] ([Intel XE#7283])
>    [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-5/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping.html
>    [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-bmg-1/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping.html
> 
>   * igt@kms_plane_multiple@2x-tiling-y:
>     - shard-bmg:          [SKIP][251] ([Intel XE#8589]) -> [SKIP][252] ([Intel XE#5021] / [Intel XE#7377])
>    [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-y.html
>    [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-bmg-1/igt@kms_plane_multiple@2x-tiling-y.html
> 
>   * igt@kms_pm_backlight@basic-brightness:
>     - shard-bmg:          [SKIP][253] ([Intel XE#8589]) -> [SKIP][254] ([Intel XE#7376] / [Intel XE#7760] / [Intel XE#870]) +1 other test skip
>    [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-5/igt@kms_pm_backlight@basic-brightness.html
>    [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-bmg-1/igt@kms_pm_backlight@basic-brightness.html
> 
>   * igt@kms_psr2_su@page_flip-p010:
>     - shard-bmg:          [SKIP][255] ([Intel XE#8589]) -> [SKIP][256] ([Intel XE#2387] / [Intel XE#7429])
>    [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-5/igt@kms_psr2_su@page_flip-p010.html
>    [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-bmg-1/igt@kms_psr2_su@page_flip-p010.html
> 
>   * igt@kms_psr@psr2-cursor-plane-move:
>     - shard-bmg:          [SKIP][257] ([Intel XE#8589]) -> [SKIP][258] ([Intel XE#2234] / [Intel XE#2850]) +1 other test skip
>    [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-5/igt@kms_psr@psr2-cursor-plane-move.html
>    [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-bmg-1/igt@kms_psr@psr2-cursor-plane-move.html
> 
>   * igt@kms_sharpness_filter@invalid-plane-with-filter:
>     - shard-bmg:          [SKIP][259] ([Intel XE#8589]) -> [SKIP][260] ([Intel XE#6503])
>    [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-5/igt@kms_sharpness_filter@invalid-plane-with-filter.html
>    [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-bmg-1/igt@kms_sharpness_filter@invalid-plane-with-filter.html
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-bmg:          [SKIP][261] ([Intel XE#2426] / [Intel XE#5848]) -> [SKIP][262] ([Intel XE#2509] / [Intel XE#7437])
>    [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
>    [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   * igt@xe_evict@evict-small-multi-queue-priority-cm:
>     - shard-bmg:          [SKIP][263] ([Intel XE#8589]) -> [SKIP][264] ([Intel XE#8370])
>    [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-5/igt@xe_evict@evict-small-multi-queue-priority-cm.html
>    [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-bmg-1/igt@xe_evict@evict-small-multi-queue-priority-cm.html
> 
>   * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap:
>     - shard-bmg:          [SKIP][265] ([Intel XE#8589]) -> [SKIP][266] ([Intel XE#2322] / [Intel XE#7372]) +2 other tests skip
>    [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap.html
>    [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-bmg-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap.html
> 
>   * igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-race-prefetch:
>     - shard-bmg:          [SKIP][267] ([Intel XE#8589]) -> [SKIP][268] ([Intel XE#8374]) +2 other tests skip
>    [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-5/igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-race-prefetch.html
>    [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-bmg-1/igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-race-prefetch.html
> 
>   * igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-userptr-invalidate:
>     - shard-bmg:          [SKIP][269] ([Intel XE#8589]) -> [SKIP][270] ([Intel XE#8364]) +6 other tests skip
>    [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-5/igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-userptr-invalidate.html
>    [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-bmg-1/igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-userptr-invalidate.html
> 
>   * igt@xe_exec_threads@threads-multi-queue-cm-userptr:
>     - shard-bmg:          [SKIP][271] ([Intel XE#8589]) -> [SKIP][272] ([Intel XE#8378])
>    [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-5/igt@xe_exec_threads@threads-multi-queue-cm-userptr.html
>    [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-bmg-1/igt@xe_exec_threads@threads-multi-queue-cm-userptr.html
> 
>   * igt@xe_pat@l2-flush-opt-svm-pat-restrict:
>     - shard-bmg:          [SKIP][273] ([Intel XE#8589]) -> [SKIP][274] ([Intel XE#7590])
>    [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-5/igt@xe_pat@l2-flush-opt-svm-pat-restrict.html
>    [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-bmg-1/igt@xe_pat@l2-flush-opt-svm-pat-restrict.html
> 
>   * igt@xe_pm@d3cold-mocs:
>     - shard-bmg:          [SKIP][275] ([Intel XE#8589]) -> [SKIP][276] ([Intel XE#2284] / [Intel XE#7370])
>    [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-5/igt@xe_pm@d3cold-mocs.html
>    [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-bmg-1/igt@xe_pm@d3cold-mocs.html
> 
>   * igt@xe_query@multigpu-query-uc-fw-version-huc:
>     - shard-bmg:          [SKIP][277] ([Intel XE#8589]) -> [SKIP][278] ([Intel XE#944])
>    [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-5/igt@xe_query@multigpu-query-uc-fw-version-huc.html
>    [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/shard-bmg-1/igt@xe_query@multigpu-query-uc-fw-version-huc.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125
>   [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
>   [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
>   [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
>   [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
>   [Intel XE#1948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1948
>   [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
>   [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>   [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
>   [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
>   [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
>   [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>   [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
>   [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
>   [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
>   [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
>   [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
>   [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
>   [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
>   [Intel XE#2350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350
>   [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
>   [Intel XE#2375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375
>   [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
>   [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
>   [Intel XE#2459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2459
>   [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
>   [Intel XE#2596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2596
>   [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
>   [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
>   [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
>   [Intel XE#2833]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833
>   [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>   [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
>   [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>   [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
>   [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>   [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
>   [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
>   [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
>   [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
>   [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
>   [Intel XE#3658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
>   [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
>   [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
>   [Intel XE#4227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227
>   [Intel XE#4329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4329
>   [Intel XE#4331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
>   [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
>   [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
>   [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
>   [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
>   [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
>   [Intel XE#5575]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
>   [Intel XE#5741]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5741
>   [Intel XE#5764]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764
>   [Intel XE#5800]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5800
>   [Intel XE#5808]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5808
>   [Intel XE#5812]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5812
>   [Intel XE#5813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813
>   [Intel XE#5822]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5822
>   [Intel XE#5832]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5832
>   [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
>   [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
>   [Intel XE#5854]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5854
>   [Intel XE#5858]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5858
>   [Intel XE#5900]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5900
>   [Intel XE#5901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5901
>   [Intel XE#5907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5907
>   [Intel XE#5947]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5947
>   [Intel XE#5959]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5959
>   [Intel XE#5962]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5962
>   [Intel XE#6035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035
>   [Intel XE#6078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078
>   [Intel XE#6293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6293
>   [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
>   [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#6652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652
>   [Intel XE#6867]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6867
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
>   [Intel XE#6901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901
>   [Intel XE#6912]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6912
>   [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
>   [Intel XE#6969]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969
>   [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
>   [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
>   [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
>   [Intel XE#7086]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7086
>   [Intel XE#7098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7098
>   [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
>   [Intel XE#7179]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179
>   [Intel XE#7225]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7225
>   [Intel XE#7227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7227
>   [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
>   [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
>   [Intel XE#7312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7312
>   [Intel XE#7321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7321
>   [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
>   [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
>   [Intel XE#7344]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7344
>   [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
>   [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
>   [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
>   [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
>   [Intel XE#7360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7360
>   [Intel XE#7366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7366
>   [Intel XE#7367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7367
>   [Intel XE#7369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7369
>   [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
>   [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
>   [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
>   [Intel XE#7375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7375
>   [Intel XE#7376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376
>   [Intel XE#7377]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7377
>   [Intel XE#7383]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383
>   [Intel XE#7389]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7389
>   [Intel XE#7390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7390
>   [Intel XE#7397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397
>   [Intel XE#7399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399
>   [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
>   [Intel XE#7429]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429
>   [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
>   [Intel XE#7442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7442
>   [Intel XE#7444]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7444
>   [Intel XE#7453]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7453
>   [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
>   [Intel XE#7484]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7484
>   [Intel XE#7503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7503
>   [Intel XE#7569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7569
>   [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
>   [Intel XE#7591]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7591
>   [Intel XE#7644]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7644
>   [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
>   [Intel XE#7727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7727
>   [Intel XE#7760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760
>   [Intel XE#7774]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7774
>   [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
>   [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
>   [Intel XE#7893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7893
>   [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
>   [Intel XE#8150]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150
>   [Intel XE#8159]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8159
>   [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
>   [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
>   [Intel XE#8369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369
>   [Intel XE#8370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8370
>   [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
>   [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
>   [Intel XE#8391]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8391
>   [Intel XE#8395]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8395
>   [Intel XE#8396]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396
>   [Intel XE#8578]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8578
>   [Intel XE#8586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8586
>   [Intel XE#8589]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589
>   [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
>   [Intel XE#9093]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9093
>   [Intel XE#9096]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9096
>   [Intel XE#9130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9130
>   [Intel XE#9203]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9203
>   [Intel XE#9250]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9250
>   [Intel XE#9271]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9271
>   [Intel XE#9279]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9279
>   [Intel XE#9297]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9297
>   [Intel XE#9312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9312
>   [Intel XE#9333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9333
>   [Intel XE#9362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362
>   [Intel XE#9365]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9365
>   [Intel XE#9390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9390
>   [Intel XE#9399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9399
>   [Intel XE#9405]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9405
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74 -> xe-pw-174684v2
> 
>   IGT_9113: 691cc6fd50d5a3f6f2b5805c9698af1df28f6830 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74: d3e3b787ba0daa01200907e0efeaa3f7da201a74
>   xe-pw-174684v2: 174684v2
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174684v2/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
