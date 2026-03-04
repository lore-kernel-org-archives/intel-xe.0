Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D8E9EF8FE5
	for <intel-xe@archiver.kernel.org>; Wed,  4 Mar 2026 13:51:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FC1010EA1E;
	Wed,  4 Mar 2026 13:51:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WCHyw5dr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 047A910EA1E
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Mar 2026 13:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772632272; x=1804168272;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ZKpCYZ7DAHADQmqDB3zCSoh8jAeOJsBluT/h/Zm1q8U=;
 b=WCHyw5drwKGEt53k8evsPlJBqqR3GtWn+pN023Ekawh1Vido3lmQ9VZF
 ULFfsUq5+eRsWD2sqAjtXxjudn0myCI4P8oOhy8YBrd35FemNPquJAghX
 fSvcuJz+I5epMPF0+vo816MQ/x3Q1jPRwa5OmDI1v8lLlr12Ydp+ZACzz
 NC8uLupwpRKqcCQsRF0jF9/Y1h4/jD0YMBbnNmn0/9P+tPMarH0GGAeUY
 1le/n7finU2Ab6SN5LUtRAHm0gK1PTt7t7eChijh25gn9Yqa4S2Sh7IQJ
 mHTNlC30jN7NvQZBwGcV1N2HuJ175/4jmdLyCXgHGPVLn9dsgsJmrrWh4 A==;
X-CSE-ConnectionGUID: rMDr3VRpQRW8WFfkAEAiRA==
X-CSE-MsgGUID: 08nSfNSsSCmSC2x3swBKQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="73817882"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="73817882"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 05:51:11 -0800
X-CSE-ConnectionGUID: NXuupWVNT/+bs796cLIUig==
X-CSE-MsgGUID: 58+pTxewS7mAjOi7cl8svw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="216655770"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 05:51:10 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 4 Mar 2026 05:51:10 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 4 Mar 2026 05:51:10 -0800
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.61) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 4 Mar 2026 05:51:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YbwY+YPaQw647QNeG8mAZxCisZqWJP7tYcDnhsjik9MFh3vZFPozvpuhqGXTCuUaGQrYbwKrm9Heoj7C1LzKVZ5kXB6jPXajJNOw95Jle2EsqbJchTlci9rneW+uRWhwdjwS263BFHl3VJ+dXqKmqgvLUcFI/53emGtpLhl8iE31ELkv3UqRO1OmScItdArClQDuUKnDc33+MedSTqnr0Jk+xdzxX4raQw2VdqtyqMj0/cwBq7/v6wWA1cylnP7+ItjD8U3P4IJaPDyWtvNoZCreWhLVaClM0JDaVZm8YACgnCFEFemxaNip69GYLxm+N01CA47JZh8rDLfus4Yf/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/p+xwY1opfNBcFEGnd7IlrB6kKISlCiCuvZSU2aMsFQ=;
 b=WmmlEkpJJJ6+nyLC88xPt7v0dFNg0GAbewuqrp7UkDOgi5yWVc/7PopR51jKigSTWrhYDO8KMXSsANaFJwKAFSkDLp9S1Z7zknwker+GCc0oacLmaIho5zamdcguyen1KmsSG6DtwawVIFmVd+09mQYjbMS5TZ8ofeuTphaEli7+Zjuxj8GLBSTqUVb+Af7lcEMsK3cgH4qzP/wjJ3r556Tqu83NDGoyEkgJlt48kO2NJTXSRzTSB4B/D64MI/q5Dns4aJh0bWxEF7AIqo6lh2LOhEQqOu18mloXkDlZ49CApaW3JH4QwosRT9NvoBORr1EZNRHz5UR3KHlodbeHYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by PH0PR11MB5142.namprd11.prod.outlook.com (2603:10b6:510:39::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Wed, 4 Mar
 2026 13:51:08 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 13:51:07 +0000
Date: Wed, 4 Mar 2026 08:51:04 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: <intel-xe@lists.freedesktop.org>, <kernel-dev@igalia.com>, Ville
 =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v18 2/9] drm/xe: Use write-combine mapping when
 populating DPT
Message-ID: <aag4yMcmyUaH8OZ3@intel.com>
References: <20260304130314.6084-1-tvrtko.ursulin@igalia.com>
 <20260304130314.6084-3-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260304130314.6084-3-tvrtko.ursulin@igalia.com>
X-ClientProxiedBy: BYAPR01CA0069.prod.exchangelabs.com (2603:10b6:a03:94::46)
 To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|PH0PR11MB5142:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a7afaff-a12b-41b3-f866-08de79f51608
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: CHBJGBme46ZZXzypbTRF+nZpCBAIR30YgYaMGIljltLD5oxIfai/VvspExUYTXOSSDFrc1+XACF3Doy3uWg6jabODQGlty5sOR5Cj/zgItGtCNzftg4P1cOggwG8RuZARLYNV34xDmjR6fA1rGxNuMa3/ayfCd++cURd3uBsq1ekGl/jhZ9bbhJ6ZPuUqg5tdzAAQodL/83EypqGiRhDa7Di28qdb+EJf0ImQquPlQZEDaHWKJIhUdqxdHtjQnAUXYNGDe2KIu2RbVtkmYsa9bzAE3wvAEnM2LXjnvwOkNXMWR4WIK4wIHX7XRP9M3Ce6oTqn6G5pIw8/lCGc/2lv4vUYQsEU3RwewX9rFjoXM9HTlLYhGtC7fvy8+oHTbl0idxI6UgjWAAl8zCfanbnt1I2+sIjPU147bSr1d25XqnzGPsTsZkSIVaI+3UkndZ3YThJQvcu4eD7L1RwWAk7fFob4OJsmBQye30xxcRT1nmgN9eOTXiSRNAssgnJN+qnR4e1hzphGKAew712zjs/Ay2xYTFzkaLlIGIIm5ZTKgq02nvgSQSGOkYMVnn7NY5TJZ6hKz4TiWhbLlmc7Tz2K+G6iiGGHAKWfMN2325oPUo8rla2aLLhMdC0XKmjmHMEd65eMIUd4eGVrJ2HKEGL7vFEwqsBmU9SL+gfkwlNwGEBtGfuKvqGolTaD0xPDKCkh2V/qA5+GYfPtD+TFACTxMdzA+j71AtTZasP1KGv1jU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?pONl2w4YbmNnwIKIm7WMsJ/pmk8cqh3RnXELX/jJtwuOio4beL/6I+qYhz?=
 =?iso-8859-1?Q?TCESZDD5N0uiQctsyOoiFaq3J+fKzlEuai2b+4lc7Z7ybIraX6uab0jSmG?=
 =?iso-8859-1?Q?lA/dHay/O4UgyzPypnLZr9UZ/7slHbyfiwwH+e+wsSwHeihlunhq7cHeOO?=
 =?iso-8859-1?Q?GthfvRjHTV27mH/mPhpnh75eUTyHczDZz3cdlcNqQLb9Z4fRDiv8fcgcfU?=
 =?iso-8859-1?Q?0ZTmfutQa7iWqb5wn8ZapnPee7dnhhvnXetiJEo9KM3K/E8WU1Vd/pJkRH?=
 =?iso-8859-1?Q?suTRLiwOc8mKFZ051G+F7vGYYwJYH54J28hvRE4Ep2UqZV78dqPobq5dt6?=
 =?iso-8859-1?Q?V6tihBzonKm0N/gjdyD6dLNhgzdhbzz0Hm33j0W6TUnrwbnd626MO8YazN?=
 =?iso-8859-1?Q?qBIgVFKr3sfOtMdHfF0aioFq5sJKOOQr1Z6WS7nN77t89wah4kWf7p9vfN?=
 =?iso-8859-1?Q?T0o5iimGH1FCSviQD2jCEOF5ymKW1l6jCJCk449jusiebGzVVrJoejk8qI?=
 =?iso-8859-1?Q?yNvf78oiV0YwVh9KJ7GXYjTcj84aMXs17YIyqbIvrwzpeV8iIqA1sgB3dX?=
 =?iso-8859-1?Q?d0DsHSDQEA3lLJAkE8C/jppHE+BhkteGjzmrPOECWSUw0R30tH9w99EYfa?=
 =?iso-8859-1?Q?S9DrxybX10x6n6ErqheZcMSiFkoaQ+C/jXLbuf9H5AcMQxWbwdbCPUC3Gj?=
 =?iso-8859-1?Q?OQA318qzlUBQbDR8eVcKDET1KANI4S7JwwNnNCrdCormRmclh22t8b1izx?=
 =?iso-8859-1?Q?fy+mBXcR3IYJxTuEuwRbdUeGr4UqD0bzwSMZhV2EuaTgYOFhkz4ktxiHIu?=
 =?iso-8859-1?Q?FUZLW5Whj3n0jG/guSq3pZcYXXMaGfpi2zNKPqfILqpHOIlhO6l9KYknAo?=
 =?iso-8859-1?Q?18yz7AqHwekpXnUPrvlftzUslMVQBmF6J/xo135yyxtZFgPcKtnKOWFLav?=
 =?iso-8859-1?Q?5nhbqmhCik7/yYc0DZx7vvv0Wq+Wvp3opN8KPEfDJKCv6mfhORq/+uoG2H?=
 =?iso-8859-1?Q?ftwlTDpfizh/JpTPvVkBgCmRImax95Siii5blWNdtejRnYI185KwkDUOKF?=
 =?iso-8859-1?Q?zyOPP74Vxp3fxwpvb5NJY8VsX+dtO/ra2+7RDTXO9kIU5+V2qBIsDQG72y?=
 =?iso-8859-1?Q?pLZ20sgoqRKa8BKHwZhEOWXLQ6ASQwuWBPXGlBQuzYjDiCacD8TvJLpG8m?=
 =?iso-8859-1?Q?yeW1xP4TOAhTlOzliJBl8hPrckF8i9+fbvqecAQdDDzhKrifXahRGA0poU?=
 =?iso-8859-1?Q?Lk/EprZVpA9emc+e81ylAm2LcQaz738+dmTCvQrjqxHzMo+Kdq8IRywZGk?=
 =?iso-8859-1?Q?ZAgs85/N3cA7l8dazOkwFmhwlbflui/j0YlEkme+VrAwuy/jHdSZ8eFO6p?=
 =?iso-8859-1?Q?CwogUwCxKKL2aL4OEwMojnwIS3awz1DS1ZxbxjWCq/jAaNJULlFaK4NY6S?=
 =?iso-8859-1?Q?OANuBcoOCIeO+wtwKRU0vODQQdqY0uIrSCrr4xo0XeRZU4mRPeBjQ2r2VW?=
 =?iso-8859-1?Q?/SxRvFpmbRpSp50jiLUJgd2xOYyz9AesOs8UjBhb3ScC1j57eYl4NYPHYc?=
 =?iso-8859-1?Q?YWuDpaCmbmKdWKKS47nCuc5DY5YzY8q4AE1MCJQfmYahpetZWW2cRbUAQX?=
 =?iso-8859-1?Q?wgTIWgKWG2hoN85oM/uuVgR/3vAWyoFl7CugQAGwwJl4pgJFjzzqJnVUs4?=
 =?iso-8859-1?Q?MM3QgB832CvMTjL55Q5bwdNBMB7Q6c8mr2IRSryMd3aNusRm9MFkqDbMlV?=
 =?iso-8859-1?Q?6XDNrFcDJ+KZWuG1aL0772AM+SJJ3vG0p+mO+xTqXrkYXFGjPIDRBGx8e7?=
 =?iso-8859-1?Q?eRJgKQ8ZaQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: gCOdim+LwNG3NBKUkAdkThnWAYlOx6IJtxyVuVp2lr3IFaFa21ZgHk2IxFjgw9XSeskP7fuVOFb1qP2qt3nMDFYVV28kKprBP5YoW40STP3FgSD+EkDcUrH/AkWASQ5c0XThJjHSBE+QT0S1BJNZNC0QtO14BgxMiHQIRjZ2vUqN+/tCmeeh4HdBFZXb+Ta/2eCtRa+G2+4QRarDh5HA3/sFYMtKykyjBN1Ih5W/zD3LDM+Jo+pjh19qBS4OBUhD80LDUyyHU+RgIuXzuGOJpf597WF/qfOG32Sm8Eou7lQiGfDM5TD/uea+JjSzEJg2U8T/rCopirXK127YiSH9nw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a7afaff-a12b-41b3-f866-08de79f51608
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 13:51:07.9189 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g8RZp5jBQn0sAXiZwb31hfpNopXx9/1nouZX5ANaMNwJUs87FocIThVNkSO2O1q2Ci+VxRsye83MalUeEuR0cw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5142
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

On Wed, Mar 04, 2026 at 01:03:07PM +0000, Tvrtko Ursulin wrote:
> The fallback case for DPT backing store is a buffer object in system
> memory buffer, which by default use a write-back CPU caching policy.
> 
> If this fallback gets triggered, and since there is currently no flushing,
> the DPT writes made when pinning a buffer to display are not guaranteed to
> be seen by the display engine.
> 
> To fix this, since both the local memory and the stolen memory DPT
> placements already use write-combine, let us make the system memory option
> follow suit by passing down the appropriate flag.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Suggested-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/display/xe_fb_pin.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> index d4a9eb550cae..df7d305c6fcd 100644
> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> @@ -122,7 +122,8 @@ static int __xe_pin_fb_vma_dpt(const struct intel_framebuffer *fb,
>  						   ttm_bo_type_kernel,
>  						   XE_BO_FLAG_SYSTEM |
>  						   XE_BO_FLAG_GGTT |
> -						   XE_BO_FLAG_PAGETABLE,
> +						   XE_BO_FLAG_PAGETABLE |
> +						   XE_BO_FLAG_FORCE_WC,
>  						   alignment, false);
>  	if (IS_ERR(dpt))
>  		return PTR_ERR(dpt);
> -- 
> 2.52.0
> 
