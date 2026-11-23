Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F552606A31E
	for <intel-xe@archiver.kernel.org>; Mon, 23 Nov 2026 20:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AINhccPi;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=H6xOkW93
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD9CC10F1BD;
	Mon, 23 Nov 2026 20:20:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7463410F1C3
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Nov 2026 20:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795465236; x=1827001236;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=D+JoK3dNw38+vh8Dj+LZvL9k7sDnRRFcTvkBKXYTMZw=;
 b=AINhccPiuH9NZsBEzzYiD9cfGjkXBjDGD1+aolF10KtRb9pFNtfpYB3Y
 zv+bb+nRyGEYBfoxTzA3F8mkHGCKLQyTTDZpA1vteeuFwZm1E+y6V94Q6
 8NE7o3qsA9c79uYCTWASFQ439OMtwIoAR3TCXh5RgXDWNbp5Z1HnR27Ya
 Hai2AUuq1CbUZ5gy9s9xOk949NiD3InlHjkY/fKrp8JikvH6ht4Hw78nZ
 8Ksguq4VjmTHMIIsIm2E52qtq3Yq3ZLqN3FpRhnkViozMJE4TCzPTIEHz
 tQLUH+h9WwUWGhYUXtXiswZVxN4k7YFZbHum34GKo6VDSqSqxpTmSdTbK Q==;
X-CSE-ConnectionGUID: TuFTBmRVRC2U8qrni51dIg==
X-CSE-MsgGUID: oCx+VHy3T3q0TASOUQ4qdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4301125"
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="4301125"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 12:20:35 -0800
X-CSE-ConnectionGUID: erbYO4FjRFiwHNYGDy+JmA==
X-CSE-MsgGUID: +vsc29EgQ/Se0zPPo9CNSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; d="scan'208";a="11588106"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 12:20:36 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Mon, 23 Nov 2026 12:20:03 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Mon, 23 Nov 2026 12:20:03 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.17) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 23 Nov 2026 12:19:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f+jmtEwlweCd0fKLmn72IESqRy76zHl9PfRTkfMZUVesohxKg3ydHvbadEZzDOTFwv0aDGVYd/qspr7eEbmQKxr1CEXewDQ+YGysxWY5KYGsghxatU6vVflz1GqzBb8OrqeFpGKXau9g4jWmcDnL+k7vylnUDO6X2kirQG/9yDXYlaQ5pBsAm5cJbMqHV4RlSpLc3UaU1IKty0MEN7shBOZyKaExna9ueaT+jsJGDHl0xUQqhepNtvNksku4xbyY8K3YI7YurR7n47acdU9JszpsG0FRscu3Zy4/uR0815nJ3wlnBLkmUNilkfHAlf4ePXjE+dEIlsT1ihnrBNRk/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=biLhxSYVSCHXlgk+ssxArfqkfPQwb0rVx7NrkjjZYxE=;
 b=VZWbXO4EjkEOZJTk0sgyZnOhl/Gkc9TE4Wjei6ucKm0N8u9gHyH3YeGR4QPwx6rRaZN2bcvrCAaKo499Od4zzANvby5V2blvZ1Bpi/DAnierlCevnfhGl1dty6io1FiReLL2+PwBbeE7+lBCcEnnwdOQNF58cLmVQQ7DmnbgnDryanG4ArrDRg1bRJH4kOHFioY/WRfIc3zAc0MGN33ZLwTIXQEhfwkFbjfY7pTMQ/GS2kq6UVUxKU8YOy32Kyov+MDN88v4FYNrn4CJhxunCXkUZvRGr1mTgf1CaO85cr7Ou9YG1N/FIAawpZdro+7JT0gkAdy1mR3ajVPXT+3w9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=biLhxSYVSCHXlgk+ssxArfqkfPQwb0rVx7NrkjjZYxE=;
 b=H6xOkW931kpgqlMsnzth37ff6nzSKC02Ib9amcL7MGVDj3wECKvP2qyqCWHyIJQ9jMaIOh1wIjGRRwvJjclRy8QPFVK/8nquF74l6Xi7Z90NFpuv6WmCA5DNrqAnXGY7h3JxXrX3xL31L/ar4s5a6LKy5ff9asbAoeCDtKLnqDs=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB5990.namprd11.prod.outlook.com (2603:10b6:8:71::5) by
 BY1PR11MB8056.namprd11.prod.outlook.com (2603:10b6:a03:533::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.13; Mon, 23 Nov 2026 20:19:51 +0000
Received: from DS7PR11MB5990.namprd11.prod.outlook.com
 ([fe80::133c:5eed:3aec:b899]) by DS7PR11MB5990.namprd11.prod.outlook.com
 ([fe80::133c:5eed:3aec:b899%3]) with mapi id 15.21.0639.011; Mon, 23 Nov 2026
 20:19:51 +0000
Date: Mon, 23 Nov 2026 15:19:47 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Sk Anirban <sk.anirban@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <riana.tauro@intel.com>,
 <karthik.poosa@intel.com>, <raag.jadav@intel.com>, <soham.purkait@intel.com>, 
 <mallesh.koujalagi@intel.com>
Subject: Re: [PATCH 2/2] drm/xe: Add debug configfs option to force OCODE load
Message-ID: <awSf42ue559qzavc@intel.com>
References: <20261123183740.4002390-4-sk.anirban@intel.com>
 <20261123183740.4002390-6-sk.anirban@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261123183740.4002390-6-sk.anirban@intel.com>
X-ClientProxiedBy: SJ0PR13CA0228.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::23) To DS7PR11MB5990.namprd11.prod.outlook.com
 (2603:10b6:8:71::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB5990:EE_|BY1PR11MB8056:EE_
X-MS-Office365-Filtering-Correlation-Id: d4733f42-efd6-4ff3-2c2b-08df499f20a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|261102123227099003|261026121527099003|261026140227099003|261022115727099003|261022075727099003|261022105027099003|261028144727099003|261021121427099003|261021123027099003|4143699003|11063799006|56012099006|10067099003|261009223027099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: n8EIJOY6Vpk16SPWnkk621s7Tj6Kaep1XtjKDSPtNN23fwblwgAg1ynOEje/dZzFm2zX4pAI7loDGXJFJvQtAX6UE0ikQi4X/5ZmghfvBCSmWS1J0FxLjzKfIGksmBJR0CX/kM6K9B5ofO8CE+cQoTX8GUR251Ku/kE9NCMwlsKnpfCR8Rw8lGh6MTa8IQKyBt03cxTm3INRgPXUV2iGto7zgUYcjo0j7bmsfhnRdzJWAkJRFbeyNwC+9Zi+4OFyVbhUtYV0GKC/B+d7mWDymEIMCN4alf4Zau9/YX6OMNxYHAk/k1Chrnt+JtVlNgf8HaDppNPm5EgrDhyQdehrPl7/EwJlGcyej1GwBbxdThtdJSoyAwyEFuEfqwt7d4rtaSl+KDuIevYdhSXIvInP0EhUc9U5QFk3yke7Z6ChLWAHHsZ8KlArd5tUvGm/fGl69PhfqCJvCykrbTJVmUdSZwxvW0xf6YKebisDBUYSq3R5JanJFQap6F0Je+VMPKjhm9AYhG1DjxUOVAWe5NrNhUSwePPKrkF97AD0h9P0ILDwiNYIxHdgHMAyo+rHVxvYqlLbJ6Km06d5IIXXVRwnw5reAJb/gxu7EAi31muZgwgk37hWwUU6FiHKjZ2fCaoYB3i14I7ndew6br7ypMB+T3PTsZuSSMUhAVyOBqnbIU8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB5990.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(261102123227099003)(261026121527099003)(261026140227099003)(261022115727099003)(261022075727099003)(261022105027099003)(261028144727099003)(261021121427099003)(261021123027099003)(4143699003)(11063799006)(56012099006)(10067099003)(261009223027099003)(18002099003)(22082099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WtaHSkczpHJ4zBNZpl9XUED/kE6RQ/0ebV8GKkdNnaphFVhbfPKsFi9HVNq8?=
 =?us-ascii?Q?poA/6J7yDNSRCJNhMsFWGAdAYxSkf6A7O7sI4LFkrVxHjPYRJxocf1mpCznl?=
 =?us-ascii?Q?flHusmCVmGMRcAWiMnI3n27Qd1wBG2UUMtjf1kHIsPrD5bEmWzy9dlTx5Z3T?=
 =?us-ascii?Q?2beQzbeT3ZVSd5C7Bu5/Fdk4oOgfYJaGR4htVs/yjLY78x6qMk8XcIw1fTX7?=
 =?us-ascii?Q?3aTGjaB6+EGpck6pqGj9J8vFq7ZKJ7Jc8AnEaXIR8OYXErmZp8BdlPG+K5T0?=
 =?us-ascii?Q?fa5e38DAY7FPgAlr5iw3DYluSPcg8Ifc7/y/13h7Nw5O1mbi6N33IzM00Rd3?=
 =?us-ascii?Q?qHEX5lcnYoq1Re5e9ONwFetGQSqq2vp6JdN0/gAX+ZZSn5sdgXx+w2UYffHC?=
 =?us-ascii?Q?ArYjmw8+1ILytaR7MDUNLM/4WwXy/f4pybfa7+udZqYRFjHGn/YimB6bUqJF?=
 =?us-ascii?Q?Nc+JmjZ8bxv+kMvs41mOsLpGqeH7mqHkHKqZBC53UCQUACW7SBGWi34Iy0iI?=
 =?us-ascii?Q?26TPowSl76uTaRl5Z0p9kpPwa9LahCrzB2msvqqPMz7krZOyk+fO7Mvvqao0?=
 =?us-ascii?Q?Yoy2zipU5KdzSb5mDUys8DkeBI00BDHuHV+OkQSR0+FHZN12ELfNrPNMb7vC?=
 =?us-ascii?Q?IGhT5tAX4p4+8UZbvRf3bBYhpEzjqWeO3/tFlP4FmiPRdoyNZUgIggTeYNXG?=
 =?us-ascii?Q?1OVsexJ1ZHQAkw50OtUntz9wQhDmhcgPd9QLhTVLRIoU2eDchSzOWquErSye?=
 =?us-ascii?Q?4gweLBheWAafwGg+qsaw7m2Pi61Q410qRbgs0S1Bc2CLck4rqJikhwRGdKQL?=
 =?us-ascii?Q?HCwjMTC4b9Cx0Aw8+7cGEhtJZkcTUHOv9cWjnAIgTd1RZL7hqCoQkbijkkSu?=
 =?us-ascii?Q?1kl/sPW9rRlmGeP9yzS5HnNvaeDRLppkPdM5BCRlgpGk09pb7cXLkgykBE/L?=
 =?us-ascii?Q?jDmFrIzU+X8uMqH8fmPp/LFtinvdHm3gxAfvudpXXd8zQDwNINpxdQfImFij?=
 =?us-ascii?Q?0zwGI9JKUaIn7pGqpygc7M2jab7xnLEeNyjGTW2CwJy0IClfkh1pNmPCuaY0?=
 =?us-ascii?Q?BP+1iAuzBW++x+TefZ2L+AD/aMiH8VaBFlpUXH3KMr+TCSD2BwDM7zDeYXXW?=
 =?us-ascii?Q?x1RnhpfAFIVTeFzg78i8lReTUbdBT6A1fElqVYE16FTDcQNeygqhUX6+YhW2?=
 =?us-ascii?Q?GLtwq9tHen9iBm3mZbT3snkv0lDcP1uOwAps4W79tU7YGxge4IYy/577vTJL?=
 =?us-ascii?Q?SwOLYTCwEoxH3MhNAmGJ7vryWxXOrD/BNYVVbLLdFXZsan9pG3/k3GwcL7sa?=
 =?us-ascii?Q?ynsfiErvY+eReoJ1ylAKtJeQAslcsM/izMWsg+T3kkVhSrklJ/61MMB/5Lky?=
 =?us-ascii?Q?wo9Lw87v3ADm5KLSp8avA4ioozg/XHZZUpMChPAr6bq/8NH9FVOdGbHNWXl+?=
 =?us-ascii?Q?tSmRQhpv1RZdxxuWRMLIPcU1kZThTqhnPQaoBHtbfYeh/FYIhhV2r1T+s+Oq?=
 =?us-ascii?Q?0Fb9PGmvltIDKI6LCtfV6PtwY5Uj8iKHJpTnXWectKFiLm4ROElzi9x6WjJx?=
 =?us-ascii?Q?4wkcQ5IihetxFIICR2JrNFIVqC7fO0MMAuRGxAYLr6JXHAJZ9CVhuhUh1dmi?=
 =?us-ascii?Q?vSmCwwnfjXuRmEFobRpb2K4XnasSW0rvIS/YbTKOysFPgH04UUjQC2RK2L3t?=
 =?us-ascii?Q?hsWb2171Gw/xyECkoUPCrTs5P5jV92yaZxiTjy5cy5zNuJZ0lqA5EBGoQ3Ib?=
 =?us-ascii?Q?OPAwI+VVJg=3D=3D?=
X-Exchange-RoutingPolicyChecked: HDNLo2qsw2a5byuCPXdKsFb6chfI/l1IYL3hdRp8FZEi8YaCS9gOMbDQ8FZPeS8CCCIU0+ReyavCqnVfmcWNTF7GB4bkI3dAo/FN2HzTRpjVjcAqkgxnzJ2G3TMGrBzHdvb/mz5FiUtef5ang/PENqd0RAf+YIbKOb6HynmE392C3DJIA3/DuLXYTAFQwFDDGZFCM5y2hDbscs1zPI1G/vxh0t6//ntPwtdDAiCZh0eBcJ5uIowhxNYOemPu4XO715tdntd0kywBqwHMqfQ1PN1HwpfWKYJOld5yS3cqd34U5NlvdOiUvpEG6wO6fk2EuyyTLx6DD7R92VV39I3oWg==
X-MS-Exchange-CrossTenant-Network-Message-Id: d4733f42-efd6-4ff3-2c2b-08df499f20a7
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB5990.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 20:19:50.9586 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tPIuu+guMHyxeObeWy727XcTFYkaFEAKlI4lMY1e+W892z+8L2RAKfoc3vYV+DcxmVZSRPFx/K8jSH6nMJnupA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8056
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 24, 2026 at 12:07:43AM +0530, Sk Anirban wrote:
> The late-bind worker skips uploading OCODE when SysCtrl reports it is
> already running.
> Add a debug-only configfs attribute, ocode_force_load, under the
> per-device xe configfs directory. When set, the late-bind worker skips
> the "OCODE already running" check at probe and uploads the cached
> OCODE payload.
> 
> The attribute must be set before binding the device:
> 
> 	echo 1 > /sys/kernel/config/xe/0000:03:00.0/ocode_force_load
> 
> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_configfs.c           | 57 ++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_configfs.h           |  1 +
>  drivers/gpu/drm/xe/xe_late_bind_fw.c       | 14 ++++--
>  drivers/gpu/drm/xe/xe_late_bind_fw_types.h |  4 ++
>  4 files changed, 72 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
> index 2ddd707a6dbd..34bf8d61dacd 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.c
> +++ b/drivers/gpu/drm/xe/xe_configfs.c
> @@ -85,6 +85,12 @@
>   *
>   * This attribute can only be set before binding to the device.
>   *
> + * Force OCODE load:
> + * -----------------
> + *
> + * With CONFIG_DRM_XE_DEBUG enabled, force an OCODE load at probe even if
> + * OCODE is already running. This attribute can only be set before binding.
> + *
>   * Allowed GT types:
>   * -----------------
>   *
> @@ -302,6 +308,7 @@ struct xe_config_group_device {
>  		struct wa_bb ctx_restore_post_bb[XE_ENGINE_CLASS_MAX];
>  		struct wa_bb ctx_restore_mid_bb[XE_ENGINE_CLASS_MAX];
>  		bool survivability_mode;
> +		bool ocode_force_load;

force_ocode_load  goes better with the doc and with the other existing
entries.

>  		bool enable_psmi;
>  		bool enable_multi_queue;
>  		bool disable_vram_page_offline;
> @@ -324,6 +331,7 @@ static const struct xe_config_device device_defaults = {
>  	.engines_allowed = U64_MAX,
>  	.migrate_ulls_period_ms = 5,
>  	.survivability_mode = false,
> +	.ocode_force_load = false,
>  	.enable_psmi = false,
>  	.enable_multi_queue = true,
>  	.disable_vram_page_offline = false,
> @@ -429,6 +437,32 @@ static ssize_t survivability_mode_store(struct config_item *item, const char *pa
>  	return len;
>  }
>  
> +static ssize_t ocode_force_load_show(struct config_item *item, char *page)
> +{
> +	struct xe_config_device *dev = to_xe_config_device(item);
> +
> +	return sprintf(page, "%d\n", dev->ocode_force_load);
> +}
> +
> +static ssize_t ocode_force_load_store(struct config_item *item, const char *page, size_t len)
> +{
> +	struct xe_config_group_device *dev = to_xe_config_group_device(item);
> +	bool force_load;
> +	int ret;
> +
> +	ret = kstrtobool(page, &force_load);
> +	if (ret)
> +		return ret;
> +
> +	guard(mutex)(&dev->lock);
> +	if (is_bound(dev))
> +		return -EBUSY;
> +
> +	dev->config.ocode_force_load = force_load;
> +
> +	return len;
> +}
> +
>  static ssize_t gt_types_allowed_show(struct config_item *item, char *page)
>  {
>  	struct xe_config_device *dev = to_xe_config_device(item);
> @@ -946,6 +980,7 @@ CONFIGFS_ATTR(, disable_vram_page_offline);
>  CONFIGFS_ATTR(, engines_allowed);
>  CONFIGFS_ATTR(, gt_types_allowed);
>  CONFIGFS_ATTR(, survivability_mode);
> +CONFIGFS_ATTR(, ocode_force_load);
>  
>  static struct configfs_attribute *xe_config_device_attrs[] = {
>  	&attr_ctx_restore_mid_bb,
> @@ -957,6 +992,7 @@ static struct configfs_attribute *xe_config_device_attrs[] = {
>  	&attr_engines_allowed,
>  	&attr_gt_types_allowed,
>  	&attr_survivability_mode,
> +	&attr_ocode_force_load,
>  	NULL,
>  };
>  
> @@ -980,6 +1016,9 @@ static bool xe_config_device_is_visible(struct config_item *item,
>  {
>  	struct xe_config_group_device *dev = to_xe_config_group_device(item);
>  
> +	if (attr == &attr_ocode_force_load && !IS_ENABLED(CONFIG_DRM_XE_DEBUG))
> +		return false;
> +
>  	if (attr == &attr_survivability_mode) {
>  		if (!dev->desc->is_dgfx || dev->desc->platform < XE_BATTLEMAGE)
>  			return false;
> @@ -1240,6 +1279,7 @@ static void dump_custom_dev_config(struct pci_dev *pdev,
>  	PRI_CUSTOM_ATTR("%d", enable_psmi);
>  	PRI_CUSTOM_ATTR("%d", disable_vram_page_offline);
>  	PRI_CUSTOM_ATTR("%d", survivability_mode);
> +	PRI_CUSTOM_ATTR("%d", ocode_force_load);
>  	PRI_CUSTOM_ATTR("%u", sriov.admin_only_pf);
>  
>  #undef PRI_CUSTOM_ATTR
> @@ -1288,6 +1328,23 @@ bool xe_configfs_get_survivability_mode(struct pci_dev *pdev)
>  	return mode;
>  }
>  
> +bool xe_configfs_get_ocode_force_load(struct pci_dev *pdev)
> +{
> +	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
> +	bool force_load;
> +
> +	if (!dev || !IS_ENABLED(CONFIG_DRM_XE_DEBUG)) {
> +		if (dev)
> +			config_group_put(&dev->group);
> +		return false;
> +	}
> +
> +	force_load = dev->config.ocode_force_load;
> +	config_group_put(&dev->group);
> +
> +	return force_load;
> +}
> +
>  static u64 get_gt_types_allowed(struct pci_dev *pdev)
>  {
>  	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
> diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
> index d726800de26a..0e7efdfaca23 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.h
> +++ b/drivers/gpu/drm/xe/xe_configfs.h
> @@ -18,6 +18,7 @@ int xe_configfs_init(void);
>  void xe_configfs_exit(void);
>  void xe_configfs_check_device(struct pci_dev *pdev);
>  bool xe_configfs_get_survivability_mode(struct pci_dev *pdev);
> +bool xe_configfs_get_ocode_force_load(struct pci_dev *pdev);
>  bool xe_configfs_primary_gt_allowed(struct pci_dev *pdev);
>  bool xe_configfs_media_gt_allowed(struct pci_dev *pdev);
>  u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev);
> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe_late_bind_fw.c
> index dfff1693bf1f..91d3d33be6e8 100644
> --- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
> @@ -12,6 +12,7 @@
>  #include <drm/intel/intel_lb_mei_interface.h>
>  #include <drm/drm_print.h>
>  
> +#include "xe_configfs.h"
>  #include "xe_device.h"
>  #include "xe_late_bind_fw.h"
>  #include "xe_pcode.h"
> @@ -259,7 +260,9 @@ static void xe_late_bind_work(struct work_struct *work)
>  	xe_device_assert_mem_access(xe);
>  
>  	/* TODO: Compare the running OCODE version at probe when available. */
> -	if (lbfw->type == INTEL_LB_TYPE_OCODE && xe_sysctrl_is_oobmsm_fw_ready(xe)) {
> +	if (lbfw->type == INTEL_LB_TYPE_OCODE &&
> +	    (!READ_ONCE(lbfw->probe) || !late_bind->force_ocode_load) &&

let's not complicate and remove this 'probe' check.
It is a debug only case, let's allow even on resume and move with it.

The rest looks fine.

> +	    xe_sysctrl_is_oobmsm_fw_ready(xe)) {
>  		drm_dbg(&xe->drm, "%s firmware already loaded, skipping\n",
>  			fw_id_to_name[lbfw->id]);
>  		goto out;
> @@ -313,7 +316,7 @@ static void xe_late_bind_work(struct work_struct *work)
>  	xe_pm_runtime_put(xe);
>  }
>  
> -static void xe_late_bind_fw_load(struct xe_late_bind *late_bind)
> +static void xe_late_bind_fw_load(struct xe_late_bind *late_bind, bool probe)
>  {
>  	struct xe_device *xe = late_bind_to_xe(late_bind);
>  	struct xe_late_bind_fw *lbfw;
> @@ -323,6 +326,7 @@ static void xe_late_bind_fw_load(struct xe_late_bind *late_bind)
>  		lbfw = &late_bind->late_bind_fw[fw_id];
>  		if (lbfw->payload) {
>  			xe_pm_runtime_get_noresume(xe);
> +			WRITE_ONCE(lbfw->probe, probe);
>  			queue_work(late_bind->wq, &lbfw->work);
>  		}
>  	}
> @@ -518,7 +522,7 @@ void xe_late_bind_pm_resume(struct xe_late_bind *late_bind)
>  	if (!late_bind->component_added || late_bind->disable)
>  		return;
>  
> -	xe_late_bind_fw_load(late_bind);
> +	xe_late_bind_fw_load(late_bind, false);
>  }
>  
>  /**
> @@ -557,7 +561,9 @@ int xe_late_bind_init(struct xe_late_bind *late_bind)
>  	if (err)
>  		return err;
>  
> -	xe_late_bind_fw_load(late_bind);
> +	late_bind->force_ocode_load = xe_configfs_get_ocode_force_load(to_pci_dev(xe->drm.dev));
> +
> +	xe_late_bind_fw_load(late_bind, true);
>  
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
> index c7b3ffc743cf..3a9a631f20fa 100644
> --- a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
> @@ -43,6 +43,8 @@ struct xe_late_bind_fw {
>  	size_t payload_size;
>  	/** @work: worker to upload latebind blob */
>  	struct work_struct work;
> +	/** @probe: whether the work was queued at probe */
> +	bool probe;
>  	/** @version: late binding blob manifest version */
>  	struct gsc_version version;
>  	/** @sdk_api_version: late binding blob manifest SDK API version */
> @@ -75,6 +77,8 @@ struct xe_late_bind {
>  	bool component_added;
>  	/** @disable: to block late binding reload during pm resume flow*/
>  	bool disable;
> +	/** @force_ocode_load: force OCODE loading at probe */
> +	bool force_ocode_load;
>  };
>  
>  #endif
> -- 
> 2.43.0
> 
