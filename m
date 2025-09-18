Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D4D0CAC59A
	for <intel-xe@archiver.kernel.org>; Thu, 18 Sep 2025 14:32:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F0CD10E1D3;
	Thu, 18 Sep 2025 14:32:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jFcLt69N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4A8A10E1D3
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Sep 2025 14:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758205945; x=1789741945;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=wHZxxuWw0o4xFpAeGdhGidcHYjbTAbu0QrpBbrL2+Co=;
 b=jFcLt69NJqo86LtmziHz2bQopbWOBtW8KaoOUX0SYtf8DaphAq9TTKKL
 fNXzWoGOtzyU51VurVdSNcmzCFkRWL2vkrfO9yvFX3rfE9TMZsP8hnITq
 iDuE+SGPtV2IMSe9WTd/pgw+28ovbiNI6KeBtMwoe0ZxRQR1HRoQNoXZj
 7bciFQas7rek2ZGmN+riMtewwPNQ8l/qtUSEq0BjkHdrb23f5rE6nwkWR
 Brak5TJ/0FIZKUaHaS28YRfplmtN/dueUo+R8k4cm4vDH6QL0ceEyYSJK
 ZYQ+V13jNzuyZzQ2HgTBI0nTGkISVW3I/SPcGXB+00qVv6VPYBUVlvQAA Q==;
X-CSE-ConnectionGUID: IK6FS0TlQ82cGdY/CR5V6Q==
X-CSE-MsgGUID: a8ajPBCnTsiT7WmeLl/M/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11557"; a="78138726"
X-IronPort-AV: E=Sophos;i="6.18,275,1751266800"; d="scan'208";a="78138726"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 07:32:24 -0700
X-CSE-ConnectionGUID: 6L0E9arMQwug871Pk42ZmQ==
X-CSE-MsgGUID: ebZjIeh0Te6q8kgtrk6pJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,275,1751266800"; d="scan'208";a="206509722"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 07:32:24 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 18 Sep 2025 07:32:24 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 18 Sep 2025 07:32:24 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.37) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 18 Sep 2025 07:32:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vGVdt7TxYIwargbqWtEB/W1k0bgAWwe3vUtiIh5YsnDUDXzQcJE7G/DmoEZ1v+omenLh8ANaTJM8G8+InSdXyDvUVrH5fJB0RxQtt6xt2+0wf5gGC0iwXEtXl/l/55oz2KcejGPt1diALvx5WCRCC4/zN+OyzVxd036VabCVj4U3Qn3/vhJk09vwgDS3HhRvzZlpbTgR1EMomb1w9DE0ocbKuyTJkuHaSFLeiyPuk5js8CAhoWZB7ghsykMrV4N/YYsDyWIQnzWafq50pLhXFn8NZ+G3t0Vt/KQMdh6j2dN+na49kJY00tP+7vHkgYC41qLOfWTq56XjCkq9E/JGdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=STYmchxFzKv3XTcC2lw1wlAgpQoRcC0GsaXMV7prCWs=;
 b=cKMSPJObAxXf4DCp1w3b0uSAsRdldRqO5oZfLhqFhHCu4CKll+aszy73Z8oKe+16ezcW3N8XAKaqc0POUaTd3Iq+C8T4h5/2zmgR0Pec+cgvw1ZfIFiaMPKCugJmW1QwJ+H35zCVMTXce6TBapq7EdQsvlAxPYdHIlzUj+7ZRG+tslQzn076XY+YCuBpHcVGSHkDgprdI8bgDzXOjdUVouU9Ot+5dsbDaFqkww5szob/weSDZif90asGBmgIedbVauFFjZK7OkRhs6ubknKXaI9FiD9szKr4MyH7Zvx8XBUwfR81UAj24ES40HaXtxXKKR0xfOCE3AzFwzFj4iukdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by IA1PR11MB7917.namprd11.prod.outlook.com (2603:10b6:208:3fe::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Thu, 18 Sep
 2025 14:32:18 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9137.012; Thu, 18 Sep 2025
 14:32:18 +0000
Date: Thu, 18 Sep 2025 10:32:15 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <lucas.demarchi@intel.com>, <intel-xe@lists.freedesktop.org>,
 <riana.tauro@intel.com>, <badal.nilawar@intel.com>,
 <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v1 2/2] drm/xe/sysfs: Drop redundant runtime PM usage
Message-ID: <aMwX73Gce7nqviGl@intel.com>
References: <20250918114804.2957177-1-raag.jadav@intel.com>
 <20250918114804.2957177-3-raag.jadav@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250918114804.2957177-3-raag.jadav@intel.com>
X-ClientProxiedBy: SJ0PR03CA0204.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::29) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|IA1PR11MB7917:EE_
X-MS-Office365-Filtering-Correlation-Id: d875439c-b15c-4c9b-2cc3-08ddf6c02bc6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tcwK3qPdNF3EPe4ZEiGf/KC3E8IJQHsEdd7Kin5Rfv0FxBeegn1hLQ+UPAAY?=
 =?us-ascii?Q?L9hGSOWvQ5y6Xm7LPZlmBhUa9LGQ79qJ5FZqzRfuv0n4BFiXJqSZh0vlTIYQ?=
 =?us-ascii?Q?y5j+jQuNGnyIKy1s76igNbgnkA2bbojlzTZ2dDJ3UIwQfiR2BQJS55gQNIxD?=
 =?us-ascii?Q?zCRtAChePalw2wF8M0QqT5C19NSc6CH7wL7Hb6CaLItLnjxA08Vy/5V2PEJY?=
 =?us-ascii?Q?z4rDVTueSipMHswk4f9WEIPJ7HQY9pR8VBNOAU0Dp8OZDrPyuwa3qHkEXv8Q?=
 =?us-ascii?Q?Cs7yXSbj/WykxXP2er2gDJ7JvqDMd71DVAtrK9VJVK+uc1HdaKZp0GmdS46m?=
 =?us-ascii?Q?8RxQvVAL7ZX0kgzgZBHpwVq57+KrY4Pxbl4f9ZHoW0WWzRmWiGjAZJKHP2Pc?=
 =?us-ascii?Q?T77GU9Six08fDD1969Y4K4onQt+PeR2rubtSx8t8QzKu98+70L1Llz4HQtj4?=
 =?us-ascii?Q?K/TrHPiGU8sJboS/g619oBjqNdpfFcQat8tJWhw+vcWdf+6jEEAuqLq2yksh?=
 =?us-ascii?Q?SwImF9RWPDmr1Ct7lZgkbUS3+D2LPCD1RgbTl9BZ93hj7VSB2PFjtKiXK0vG?=
 =?us-ascii?Q?ozHPI32VOk+VSfgbKhLikMJOquS0UjD0JSqlmcag6HINIahSLDXi6GVLZk6b?=
 =?us-ascii?Q?yjlaHm7LVP4LphfRZltBz2l5GA+H3Jpnmjlw0wzIIH9GsycilSn0+9VXVEVx?=
 =?us-ascii?Q?NwX715hzWf0RghxqZFc9bnC37MSFjizs6Os4o3SciDZmqFTdkLjtyx4SqhIs?=
 =?us-ascii?Q?fgU4NqDmGtKgTMRjSRoCOayEyIvllCAcZDZDMEhwPVvBSmB2fH0CsVUHFasg?=
 =?us-ascii?Q?3rLQ+PuHwKaAoJ0OqOBnuWYA9rOb8cqay0GYcgHcgnW42R4+mN+EFZdFphyc?=
 =?us-ascii?Q?G8H+zz4UNn84OBMFZ4DZq42bNEiGdHDwaLmiT6+iuh+UVDQ1JRHGeSULc1yo?=
 =?us-ascii?Q?QOr6fHR/2RwFGcod6oPI+ruAokVPzZ79eOO+8aZTOgmAmFz49MyucBIwycCh?=
 =?us-ascii?Q?fW3kMmxoIEK7SLKjjU4x7CH65C6MrLbVBax19MRiUlATAmspsiR3rmAlEScT?=
 =?us-ascii?Q?sbsMj9HtF24hGl/UiF9t8Mx2v56FQSUPkzmUgEimmCum+W+eZH0V3b1howya?=
 =?us-ascii?Q?lTUzU+G6vibaQct8SfafqI2EpGwEQy92w6BYPIRJE81WMMY50Dq3vpCCebvW?=
 =?us-ascii?Q?I+vHmfOHLrp5JRng3CcQM8sx1AdgzCsBjAAToDQQQafzmtLFxz5Zf7bIVmgH?=
 =?us-ascii?Q?oGzFmIVFcq5nJy2XzWUC40lB3dm071dzucQh6KsUbxPZIyUevzOC18v/hPIi?=
 =?us-ascii?Q?ruSALIzqdzg8QU6E9jTorwmj7wyDJSqpNhJ5ghSQzNT3YW0Ed31fWS51NLDi?=
 =?us-ascii?Q?4jmqFLNQW9bkKNwvz36w6Csv0g/XnVo7My831v/XquGsalU5U3gNIqMUsFVo?=
 =?us-ascii?Q?SkdzVzUswkE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7AZO5HguV9ICawhUPwfhb4Zf1kE5rstGnkSjhVlKRY+sXXafoGn5nhAoLiiC?=
 =?us-ascii?Q?6ppr3GaPC5UZFTXvrcUtJLhvRuJfaSfiEAX2rsivgtbmdcAOhQipF91/Q8dF?=
 =?us-ascii?Q?37iHc83SejO5kWsMwHP/Wu4t/F5nZrnrkZGaA/Mxw6svpimgH/kyqq8u0gCA?=
 =?us-ascii?Q?aT2p7X18SxN/YZZ5SJ9ediMWx6T4TXxxktx8p+dZ3N0yzFQT5B7BVPR6d87s?=
 =?us-ascii?Q?9Jt3/sXqdKOfQ1kvZKFyU2iKW+ImUGpuyzURWu3w5HtSaku/dQF+oo+GWQUQ?=
 =?us-ascii?Q?voB7/pgPFehOkrvJCwOdi1xn+9DZ/9OMt6Ltc+WLCQV8BFULhehm8HK0UION?=
 =?us-ascii?Q?X7BPaWvC6xN5SXb2YcogGaAxjm6zNGM+W0d6RIqFWAOcZxOCmChMDvDPsRuY?=
 =?us-ascii?Q?/+pHxe68QYceceURePcIqNpFgmBHc2sDU8Lwu5xP3Ti4+lpxYrUcRvw9K8Me?=
 =?us-ascii?Q?Za+HTBQ2lX9uwy/fjgy4xep+B7VyfVvo1Y/kTEG3MJgBNDDo7gzq4YK1oKhp?=
 =?us-ascii?Q?dvBMrWn4CJP3+vXUBzhPakRg5jHlw7KLw6mZKSVmRNFDJDnhfwxRzYNMSOa3?=
 =?us-ascii?Q?VgkcvOFJ0jXYNdwzTjOho5y3V71oiazNRo+3tWNGHDrOTZr2U/7cljV0E98g?=
 =?us-ascii?Q?+MNtiw2v7KL9BpS/i9LLAGyBQmEFedbOJHDSUgyliSd5fPMs9nBhvZ8NPfdd?=
 =?us-ascii?Q?hA3pPWbkK2/UzAwkHc9uhoLx9SxuA+EoYC61bjGQTXaAPh8SWbk1wJ/PwsAy?=
 =?us-ascii?Q?w4D8prlv09l9eqnwidIQS/35q7pZjBTtyAQH6iyCx1w25XqSe+w96OJjTrZg?=
 =?us-ascii?Q?MngWrCV5ip4gwzOQU12ssnU9BUqedtYESmW8IPhswyebxTOBMymddYVUM0FG?=
 =?us-ascii?Q?L02IDDjytxXl1+h8g18QXcSzl9zf8NidUNEnP4q0xJ6nt1zPg2OoJ1V8vVda?=
 =?us-ascii?Q?iXEfugIWexgrYm4XnJjIHVGTXUzOpqMfNcjzmCuj1+gKB7mXcCiroKMnD5pl?=
 =?us-ascii?Q?XeAq5Q+btX+U089Jr6n8F0uIQPQAFehVZ22bEo1BPm2xQsw1uBe/Wuur9D7O?=
 =?us-ascii?Q?NqTbV1KINJMS++3YOfVR4aF3sfANht2CBD47uiYknzzcxOMRiOxwNQFunQjm?=
 =?us-ascii?Q?0dwByCElGww0ZceOUrGbxBpZoGGQCN6BbW+p+Wn81L/3nSBtzhyoqDzcBw9Y?=
 =?us-ascii?Q?vu+tti7GNeP/HJHc4zLagaAYVi3RfC1Bt58jvEyrxinjeoFNQhu4dbZ7KbhM?=
 =?us-ascii?Q?nD8Ss2e80C00jFbwLfYILp9H9Xv27XgdLF0EKawqhhyiRDzWrzchUlQNU917?=
 =?us-ascii?Q?AL3Htop2NniYmBgQq0UMYMv9T8Zo1UVqa8BtdZzA253yNs9VHJVelYTHU7AO?=
 =?us-ascii?Q?Frc8oxEm0dt16wS/4P+KEq3s3hHbrtRDj8WkNBYfJPLWIQQiOzfmyAy0LlR7?=
 =?us-ascii?Q?PGB1nn6P+FzSiGFiEPqVQeFiLEdt6/sDS4fF5LZrE34JYRI2v582EuV194/f?=
 =?us-ascii?Q?YIPS86NWY5SdDD1L1kUI8kwHJxNCe1DftSgA9pzoLNIUI+Jpt6tVBcyesAAv?=
 =?us-ascii?Q?uVv76bcLqiuWNTfasEop6JQ8I3t5abqd3Lzr52pdM6KTA0H8shEZQMAhZqEq?=
 =?us-ascii?Q?+A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d875439c-b15c-4c9b-2cc3-08ddf6c02bc6
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 14:32:18.6899 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: chGd9bQvLBMHTcZ/QvO54tSjhBJcO550xIduyLqPMAmNlbbTQ604AIwDQfuzOTrt0cJt5bmgYgFB2P1WCVA7LA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7917
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

On Thu, Sep 18, 2025 at 05:18:04PM +0530, Raag Jadav wrote:
> The device is expected to be in D0 state during driver probe. No need to
> resume it in ->is_visible() callbacks or non I/O operations.
> 
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_device_sysfs.c | 10 +---------
>  1 file changed, 1 insertion(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_device_sysfs.c
> index c5151c86a98a..ec9c06b06fb5 100644
> --- a/drivers/gpu/drm/xe/xe_device_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
> @@ -38,13 +38,8 @@ vram_d3cold_threshold_show(struct device *dev,
>  {
>  	struct pci_dev *pdev = to_pci_dev(dev);
>  	struct xe_device *xe = pdev_to_xe_device(pdev);
> -	int ret;
>  
> -	xe_pm_runtime_get(xe);
> -	ret = sysfs_emit(buf, "%d\n", xe->d3cold.vram_threshold);
> -	xe_pm_runtime_put(xe);
> -
> -	return ret;
> +	return sysfs_emit(buf, "%d\n", xe->d3cold.vram_threshold);
>  }
>  
>  static ssize_t
> @@ -173,11 +168,8 @@ static umode_t late_bind_attr_is_visible(struct kobject *kobj,
>  	u32 cap = 0;
>  	int ret;
>  
> -	xe_pm_runtime_get(xe);
> -
>  	ret = xe_pcode_read(root, PCODE_MBOX(PCODE_LATE_BINDING, GET_CAPABILITY_STATUS, 0),
>  			    &cap, NULL);
> -	xe_pm_runtime_put(xe);
>  	if (ret)
>  		return 0;
>  
> -- 
> 2.34.1
> 
