Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDFDFC369C2
	for <intel-xe@archiver.kernel.org>; Fri, 25 Apr 2025 14:18:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92C9610E2FB;
	Fri, 25 Apr 2025 14:18:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mnAhCErk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0C6C10E2FB
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Apr 2025 14:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745590737; x=1777126737;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=fb6SWWLg21LJE5LulhX55y5BBepwLEhhWRgm8vJYcmk=;
 b=mnAhCErkNPlaOHhc95d1XracTMJwjBMTDmkM+FKoEx17M+rEbYD8qvEt
 VKrB3WLxPrZ+6IDhnWSWaKVW8UP8ANoIbK3C6bMsB90ij4xUwyb7e0nyQ
 bPnRXwxp4UKySdkPu0tPqtcLw1iE+dmm8iRTTHaSi3mVz1RXgXBLkaRNL
 wXUAMROIaKb6edtiXtyxICpnx3h7XO644+wDsYYI1J7lqnCy/Om3+ECjE
 vYdt9iPApUYy7omDwq1J87Slioo9PXTVa65r7q/Dcm08/gTRDG87sGnok
 j8bjL70EAMgrv/shmlHXFJFtUudlVVaYyQtYPy5SQwCobvAwpvoxe80YE g==;
X-CSE-ConnectionGUID: YbWEknBlTA+bhTVrhO3xHA==
X-CSE-MsgGUID: Wf2jlIHCThGg5LMjJ2PcOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11414"; a="51074628"
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; d="scan'208";a="51074628"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2025 07:18:56 -0700
X-CSE-ConnectionGUID: t/HFKzDBTCqbMFi2zYoOWQ==
X-CSE-MsgGUID: ALyaDsY6RnCNNVNFSaCNdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; d="scan'208";a="170131267"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2025 07:18:56 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 25 Apr 2025 07:18:56 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 25 Apr 2025 07:18:56 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 25 Apr 2025 07:18:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rB7rPbDfZgYS/ttXolHNoX3x8kGS4+YehJtvPF1jTia2mbRoIMRu6G3Hc9rHUB3HUkZBbFhJYV/TrDAumndazfo/hU61mkC47N63Ei8ngVytwH1qw6Uz7nsIxSR4NKNBlhllcUUzuE9rP6UMo9EOGMMqppUSOkP/MervHrXkiPTpuM9SXID1XW1ir9bLQSQgWIHu18RwGukYuwSkHOy6Yg38tr3fJdqRRmOFRNlSpV9Whpetn/ad02nkilEIDk33hE2PGVJ/rSzo4Z0KHU2AAKXTzILI+ze5MwLLJN6EWnYSKj4jca5M/YIi3tpU8j3tHOPK5V0zcepaDWXvK5fYLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OcaEvyzniieLqPUGErivydGysneRqw2X6iRvLSriWf8=;
 b=XDy6Ctvt8bnMEvLyBvYNhzQIb2naH5IZ680M2X5xDY88ufDsnwrmPhpRL7aH96tPeFxEx+kquoo/W0XNsoSZbtFVVLznaJfh+woPE3FstFzuKZrGLz14vkQAeZujmsRhxNkTHf4gpvEjvRUM1EXu4wjJKxdxVLWyfzaYaAPpxRZgY2TKb7HuVzoAa4Ag70PMF+V7Lf1wfclbbxl9egqUKhBN757f/P8hyNMp5wZbxaymm4a9d/OftWVbI0un4SN9pjR0nd+mrBo9wcm6DvsC04K4Esu9tzxtVJGiRwIHwTVyJ4UhIjll3LfffH4UtgdnFyv473JKDlZPX6QvFs7s5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by DM6PR11MB4722.namprd11.prod.outlook.com (2603:10b6:5:2a7::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.26; Fri, 25 Apr
 2025 14:18:40 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%4]) with mapi id 15.20.8678.025; Fri, 25 Apr 2025
 14:18:40 +0000
Date: Fri, 25 Apr 2025 10:18:34 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lukasz Laguna <lukasz.laguna@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <michal.wajdeczko@intel.com>
Subject: Re: [PATCH 1/4] drm/xe: Don't update wedged mode in case of an error
Message-ID: <aAuZuuj5wCEQWXEr@intel.com>
References: <20250424143043.937-1-lukasz.laguna@intel.com>
 <20250424143043.937-2-lukasz.laguna@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250424143043.937-2-lukasz.laguna@intel.com>
X-ClientProxiedBy: MW4PR04CA0277.namprd04.prod.outlook.com
 (2603:10b6:303:89::12) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|DM6PR11MB4722:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cb52ef0-d2fa-4ac7-ab8c-08dd8404138f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dYJ4+dt4xV6sOJGcpQQTz+Xfgy7F9KdjDirf6qwvPBu+s1hpWYIet+o+57U6?=
 =?us-ascii?Q?0zhi7uTPvRBjStNIQuSyhmLxtn6sxsFiCtHWP+C1nvwU7PwJgANnI2VPFnAj?=
 =?us-ascii?Q?Bp/EY2jxvuHWfvMQB05AH4mVyarMpJXphhqK22vg56xOjx0C5vrc/NE+L+y2?=
 =?us-ascii?Q?begk4ZDct9YyVtDjQ52IxZQm6dX5mtuY5WZ6Bh6xeDrAE2h9jgxXMa6JdHrM?=
 =?us-ascii?Q?ZA2vgzoTpG5SbkIwEqyON7CM/IDtYDz7JWfP1h1eDqtff2KQLmGIC3bqzZ5n?=
 =?us-ascii?Q?fG+tAWCi6WdLtEtvwKEM/JUvS1KouHcPvc5Gt6xyJbOdJS5QKrR9FFgwwuTs?=
 =?us-ascii?Q?T9Ena5/SCFK5qhN3PmO2KsOxSjuSXmVrFkQkiSg8fI/e6sVF1bCzU6cKlIw+?=
 =?us-ascii?Q?AEG0ykd1HlvvpR37BbGKqj93YqeOHold8EkInmo9FYdhSR4hImBDDAM91YhR?=
 =?us-ascii?Q?dAawiRFno53E5jyGPpjIgfOHxz4H9602/vf5RkZmZtnQb6c9eifLNn6yVjMw?=
 =?us-ascii?Q?aDRzEhORhFtBr+VjwbBz+3LLe21D2ZUYT1EZLLyr+6nosq8vSgwFUkvroSOu?=
 =?us-ascii?Q?ntl6DhPRy42wL+QpdhYFwCRjeVo7DgR7ExZFaufU6UVMgyCbTbYVAs94QmDq?=
 =?us-ascii?Q?GyvajpngET29c5RAj70pu+aJYlQodamzK6fhlFvWCCMn+5qzjA8H2WVMAygR?=
 =?us-ascii?Q?+mD9GpRLjdzPjfHL5Jto71LaZIYOIqHcQYKuusM3sE81nu/13vIW76YBt9QK?=
 =?us-ascii?Q?ztocHF1rKTZ8OfWfZOMJPu/0PvPwpRmJIl2XU6WM2WJQfaZSq2RuFDs6wIBC?=
 =?us-ascii?Q?ldEKMNXOoVr/RcinG9aset+4HnQoZiIrkj1W2OB2zBPoZv1D67daNfCxvEgj?=
 =?us-ascii?Q?tKf0Sp3mxEnYnVt7D76iSl0mwUa+y+x0q/VxQ+9MVVDV3exYWPN6cPTsb8kK?=
 =?us-ascii?Q?s2ETdmNugEGLVW1pSL3jpyw5qXiGd/17/SdDfdC6GU5ovJHzjE7VN/71Yoo9?=
 =?us-ascii?Q?Zf9vP3S5JWRBOxidlcqlzw6QfF+nRGg+mSAhNb3PpowlbNa1YQVnh8YjqZsf?=
 =?us-ascii?Q?jLh0htMmtjGd0cIhZfqwrdu3oLjf3B8oz10ExLT8p2eyqhMWPs5muW40YShX?=
 =?us-ascii?Q?he+xkR778lH/6WoChx0I0DZIoxqgP0100AN5kNoWIo11baF2PSLCU94t43DK?=
 =?us-ascii?Q?STwwpPgf/SZfe6GJHQqJbzC3qm7BR6i96DXyv3h5Lh3+Upbk12+/11+n6Bh+?=
 =?us-ascii?Q?aBY5faeeLa3qqi+Q2gl0nKkoVwsNX+Pue5QxOtoGuUBarjar5iPvkhbVRuSo?=
 =?us-ascii?Q?P09+nFbIvo46JB30Bb3mZDHgJME0orPoEp4YABbmQP6xo3hH5r0OQpTRiKrW?=
 =?us-ascii?Q?HC/vq3cPIS+GIDlZhDUjea+mWQCVwpo8f1wnpBf6oE5rLu22W4ILs0N/n5Xf?=
 =?us-ascii?Q?oC8tB4uBetk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+iKPgfD7aciNlrsYJvZJHaGoM1cwLZOmF+qXQu8CsaAdANrj1xS4C++jRQYZ?=
 =?us-ascii?Q?x1aszFwFYZMLgQAZD8w19LKj09r6dZcU7i8qpHhuZvIaQFmDgvTcrLqjGCvM?=
 =?us-ascii?Q?WW0GociblZfQWWo39e17EOHM5ghIuohpr2n3tUPSzDFy62EqXYFM9sjenROG?=
 =?us-ascii?Q?PO1l2fD2aMWo4juq1h//23PnadrHMgBqjOpKbQQ7ZV0W0NkJfyYBlCcybggE?=
 =?us-ascii?Q?0UN7ymqKasmP4Yc5xZInITcyYusO/feJdCj8xD40wQy1F3szc0WK+KzNwv5I?=
 =?us-ascii?Q?xzSTlVY+lCQD60DxLG1OZs54edC0o9HONaieX6W6SMCfH7qBUARaoXQv+AhN?=
 =?us-ascii?Q?bULh9EPZDHoHAz6B81+oM1FnqML8nmxYpi2YwYnVU5e0qt6cuEmyEM0h/8I2?=
 =?us-ascii?Q?mAdRFMHhO88Cik3NSFZZC4QrN6XPUIFkbZdHo6aqarr0h7viAsvwIElTRtbr?=
 =?us-ascii?Q?zOlsBW+tZv1r5E6bm0LAVZUuaNB9PH5ujti0DtGZkc8qq16G76D3Ok9HWWtS?=
 =?us-ascii?Q?S4B3L8pvkvswVV8FeBeaKi2ONrGvHIBrEQ6ic404iXP80T1RshjBCYlkTGVy?=
 =?us-ascii?Q?xc9nvKYUMD3t+NpRGT/+pfRzKMGp5mXNFY2p3yPhi1g8ye4Pg07bGqnBSKlh?=
 =?us-ascii?Q?hQNC84p3iTuLola2E7U8SxQj+/DhPgnspsJ1HoRltixHjvUDIRVmBaL0K+Y2?=
 =?us-ascii?Q?Rm49C8bGkcKgtzZ4vljW0tcdChPWr9vulTRWft//XRp3jnRDMDo+XarQ1SDJ?=
 =?us-ascii?Q?so1G3fC6Hw4vhLgK3H/PSTicuBZrgrky9ykqczmwxaYd8B4/xgSQByLOLIHp?=
 =?us-ascii?Q?AEWwAJBEEIGNhKtcjKtGhYGYaNeiXAW+oSxOzCv3nAjxSkf6C443UUzKhSyn?=
 =?us-ascii?Q?XV5XWw1HiehTkw/Q1MYw1kZOxQYcvLGgLL3K1cWO4foPiIBJsH/rjxbc5zz4?=
 =?us-ascii?Q?2e2iUxySTBoaVu8w+o7bH0p+D8701/CLPYE9u2qQx4jeNEpP0APZxv75EEL1?=
 =?us-ascii?Q?S3y57HcOPjExJhdJnrWpBHEpjqDB7MWRReIIMWsvXZswCIULCjTU5JxemotY?=
 =?us-ascii?Q?D0Gz/5p9zk1TZRoWNHwmTK8Ou5JibnC6gHY48lZT+LJK3XlRB/bfXXFnaVaA?=
 =?us-ascii?Q?v7jopHPMZi8qJHWPNfvd3u0jTdTpv0K4QRmblTTa7K+VdQwbM46GONdGJbt4?=
 =?us-ascii?Q?qZHkQ6U6hBFaYZ21MqkqGZ7Z+l6/dW9a1fynpafcr6AVC95290Rh3WFKs4Hq?=
 =?us-ascii?Q?YF64WRaJA88iew3zf7pDo656JLiu/w8/qb6EX1lALDMFzo3pt2fsf+v4Ql+L?=
 =?us-ascii?Q?gaBB4NUEb+CKT+VhZpRWNFB7oxa2CfgPOl1HC7Mx33ayACJ7ObtT+rY+80ff?=
 =?us-ascii?Q?yFFdVvTPf+cAw/8DsY+LM4CEEcCOUFjXMLAf9xba8TqpOlM4IgvUt2OnCTpD?=
 =?us-ascii?Q?Oe+dPeJ3B6M35c92gSnV5m+rMNv+NO9f0E7wq0XEFx+jEuWbYCfsHXOjHJA0?=
 =?us-ascii?Q?9Cj0gYRWDwAsdBLb+8pyV8USJCRgPu8UC9PdnFWf0vCVQ2o/30PjMySzQyC8?=
 =?us-ascii?Q?TBx79rnKkLR94JlfADYoBVTSiFOX7T9crZh1IlvYqGunYaJlbKyis2WR1j+E?=
 =?us-ascii?Q?dg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cb52ef0-d2fa-4ac7-ab8c-08dd8404138f
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2025 14:18:40.2427 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MiEYTPKB9reH4qrSyiwiaUAWWzcBd2po9S/zvYSkrZDH19z+iarcdF9WsmLhHwKu/3KJ7T0w+PMRnolrta61ug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4722
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

On Thu, Apr 24, 2025 at 04:30:40PM +0200, Lukasz Laguna wrote:
> Update driver's internal wedged.mode state only in case of a success to
> avoid inconsistent state.
> 
> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_debugfs.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> index d0503959a8ed..2e6d8744003b 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -169,8 +169,6 @@ static ssize_t wedged_mode_set(struct file *f, const char __user *ubuf,
>  	if (xe->wedged.mode == wedged_mode)
>  		return size;
>  
> -	xe->wedged.mode = wedged_mode;
> -
>  	xe_pm_runtime_get(xe);
>  	for_each_gt(gt, xe, id) {
>  		ret = xe_guc_ads_scheduler_policy_toggle_reset(&gt->uc.guc.ads);
> @@ -182,6 +180,8 @@ static ssize_t wedged_mode_set(struct file *f, const char __user *ubuf,
>  	}
>  	xe_pm_runtime_put(xe);
>  
> +	xe->wedged.mode = wedged_mode;
> +
>  	return size;
>  }
>  
> -- 
> 2.40.0
> 
