Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2127E7717F
	for <intel-xe@archiver.kernel.org>; Tue, 10 Dec 2024 22:32:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C50D10E2D5;
	Tue, 10 Dec 2024 22:32:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d1Nl/Aaa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A751E10E2D5
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Dec 2024 22:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733869919; x=1765405919;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=P+mz+9BNJBkTko9CDucw2IXnKhJVKeckFqiKYk/+RVM=;
 b=d1Nl/AaaAY5t7gwgFn6ZvASP7Qjsz8BGobYOXjedNHVJK2VYYwTq9Ip6
 uETLS3gHxVDEDN7X7t4pg3AqTXNPRjHxnz66f4IXwYG+twnIWCMIuMXHc
 FM0+pFAXYlke+CEA+/2RZDMhs8TBtj6ihETA1mGd1zAIPeqLZhfqqeTtn
 JriSOt6acH5aDLLaw7iOHC4MEb3ecCJTNkLYpFqDwJwnblptLzOLlHqFG
 1FbhNELu6OsWa82DxLsuEysPYMVAKxx/NCU35dyl5+oLgVrPDGeQSjCPh
 LIC4WzP4tm/uSlvg8rhGRUHCBnX6WLNYL1+OgDQcHVejhgGXNjPL81ZZU A==;
X-CSE-ConnectionGUID: WthZt3yIRvKwFY2u+k+BmQ==
X-CSE-MsgGUID: zygxx1ieQnSPGqdRpJZZGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="34375980"
X-IronPort-AV: E=Sophos;i="6.12,223,1728975600"; d="scan'208";a="34375980"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2024 14:31:58 -0800
X-CSE-ConnectionGUID: pQMb+jBTT1iwzk7qrkaRuQ==
X-CSE-MsgGUID: kmmhM9N4Q5mLjUZi/w8n1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,223,1728975600"; d="scan'208";a="100371427"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Dec 2024 14:31:57 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Dec 2024 14:31:57 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 10 Dec 2024 14:31:57 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 10 Dec 2024 14:31:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bUPBCW/2Gh6s46WVfcsheQBo4uv+sXebnm5V/w4rWAbXm7qgrZA91G89pgpAZ5xJJ0hdV8ZuX0KwPz6Y0v6HGqhCP5/ImudQR462e6HdzAm/OitQciWXMBo6+2XXjRXxnTxoGL/toLgmahHslNguTWSoyaja6m66Dc/1iVQ90gm/RYKGmPc9NrKmdDG1vkPiJuZEXCErRSYrOvNUrH5g+5dDhmd7pJyU1AvulH116i2ubU41ub6rjtPqsCx9eCSRbl2OqnUOO/AQmi/VQmqEklmQOt+rmqycTtDzW/KN1XFy6kZ5dEGnuAp2jPJ+mB8eLbRbr+8CT2XPQfB9aTRzlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kwmfiQ0r40svxA68kI3VJVCOZ+kjPKA0HlIyjX73QRA=;
 b=uj9MpmTMB5ygDSTgnf0iFK+dY9HGiZ57LMtvxunNL9SK6MKTsMbktB49lvmkxqkxvphyXyseop9su9Lkag314h8G+b1D1E3nI8jIVfPLVCotZqzs6Zs3gQe4uTyj6PvnX0Y7z47K31aeP5jQWfEjgy7c0Ag5F+rHd4oCQVLSoU9dCl3xCxPFHTj2Kf0/RA2kEALzbpzNar8ufBj+UATIA5+2t0tCIpYFDNgVv60kUWfvaiocgy+aoy3VK+MfXUoSvSh4rZOGakR54w1lB3Z/bdcX3CTThfXfR7kl8qoQ+3XbTygHpEFWA01NbRQDIkHnsZ2zL6/QHIw1fIs8qCf0VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8185.namprd11.prod.outlook.com (2603:10b6:610:159::12)
 by IA0PR11MB7379.namprd11.prod.outlook.com (2603:10b6:208:431::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.20; Tue, 10 Dec
 2024 22:31:53 +0000
Received: from CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::1be5:55ed:3261:fefb]) by CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::1be5:55ed:3261:fefb%4]) with mapi id 15.20.8230.016; Tue, 10 Dec 2024
 22:31:53 +0000
Date: Tue, 10 Dec 2024 14:31:50 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, John Harrison <john.c.harrison@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>, <ashutosh.dixit@intel.com>
Subject: Re: [PATCH v2 4/5] drm/xe/reg_sr: Stop setting all whitelist slots
Message-ID: <20241210223150.GW5725@mdroper-desk1.amr.corp.intel.com>
References: <20241209232739.147417-1-lucas.demarchi@intel.com>
 <20241209232739.147417-5-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241209232739.147417-5-lucas.demarchi@intel.com>
X-ClientProxiedBy: BYAPR21CA0011.namprd21.prod.outlook.com
 (2603:10b6:a03:114::21) To CH3PR11MB8185.namprd11.prod.outlook.com
 (2603:10b6:610:159::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8185:EE_|IA0PR11MB7379:EE_
X-MS-Office365-Filtering-Correlation-Id: 385bcd22-375d-42e0-726f-08dd196a725b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?LHfgmEikYKt1SkKHqYtAdm/53jjYtFkrwcOV3r8GYiBb9zAsZMx0DVVuRlA9?=
 =?us-ascii?Q?oA3buvfCbkL9EPchJ4gSenhfMr62VM3C/4YVJSc+H3edmDKLjm93srnDKdCo?=
 =?us-ascii?Q?sfQuOpJed8C948w9TsYN7pM1eItGEEz8hL9a8OeFZzTd+SxJXze+mgG+jdvs?=
 =?us-ascii?Q?qDHtkuhoweixXk+cee9s4616J0uGjdVeDskqPkTxi/vgkQabl2r1hfJB3R0q?=
 =?us-ascii?Q?VyC2n0D3vBizU+IuKBwBLV3yXYxUL+lDR4WDP3r20/hh9+1YgRMsGGXuEA3T?=
 =?us-ascii?Q?sdh0AlDFqeA/kNyMJnRj7BFpSnNQtMUNs18+D0ALlHFTDy9q+zCMYDBzm0QK?=
 =?us-ascii?Q?fSLFp0Hp1LlUVs5OILWfy9/BhKKK3wbK1/PASwK6gWyWzj2lWfKZf/HngmqQ?=
 =?us-ascii?Q?mWh2ogzAaUr0Jgc2y7IfXcui1kpmmihbZ2IxoZUNxI5j1QqfpQ5EhsQ3HN6p?=
 =?us-ascii?Q?bjOKn3RhHz02ZdUeVcmsiofJEPVA/lDBij1PDcn/VkmkNmIrBhd2PChjd1VA?=
 =?us-ascii?Q?94gM964Gq/UPcGX/ZI9aYUuyiJh2lXpZuEl1RiFr3x+BSN35nhZQyipMZPtx?=
 =?us-ascii?Q?P8nhw7PMGEN33s996lbhZovypJlnrHSN6C536vloIjzywuYrjc+IjD82jFzU?=
 =?us-ascii?Q?AG+4bw2EnG2Rlbmp15seTNfNOhxryDpMXBNK73MaLTtiVQjqXM7b7EDNmVEe?=
 =?us-ascii?Q?wf4bDttXKrOgTmd40EJkZIc+Y4qGUqNHBDuTid2MetbVVVUAedzwl77C2EKD?=
 =?us-ascii?Q?Hp+IICsmmfTh/bpF1qA6bOV/qg7P6Ya3zjN0a8q6R1ky8F1+z88DJJUXtKXS?=
 =?us-ascii?Q?8RYp6d5bsplskkVeteMgNeE3GaIoQRU9Zds8fLEaAbZ5Nr/RvWVFOCcOHLH/?=
 =?us-ascii?Q?VhuGptttVdelz3KANi8xEuE/D9QJWY7jKDABSVfEwOqtKeWYOKnJBJc7pi7y?=
 =?us-ascii?Q?VdEgK8TtXkn7nLPbFcM2v0dmI3gMI5DADFlIeUO4MAfZC4VPq1xB4FBzSExF?=
 =?us-ascii?Q?ugQGkLibZqsGqlRVztS+wni8JGp8roR9Qn99SYTzpfbCeUNmABls/WKqu9v/?=
 =?us-ascii?Q?a0iAFPkEoLRfrvqwYhCretFM/BpHYV41TX2rYa+iZPPchGcmmhGA4YQAQosl?=
 =?us-ascii?Q?yNCospb2OrtfYJ3DDmTdWf85hxfle2FII+b+BgYsww995DZmnVOIqZDDjVk+?=
 =?us-ascii?Q?jL1i3/Oo3l8vZIfX/YsijrmDFxclhsqBBQ/nlSyWSPnAACbOEoUC1Cfjtq2T?=
 =?us-ascii?Q?hVubcy5WeClwX4OoCzfqqgBMMW26wLIDGALgri8d15R+ke1wJkG7iXE8NY87?=
 =?us-ascii?Q?omE89V7fHbyDn8VZF/3HcMwBJ50eltJn73GEQsU9djLV/zgnZaW3mnjJ9pVy?=
 =?us-ascii?Q?HsxzGEE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?o/VZM2Fej6GauZonGLFfQKoTPhwzgc/ECUTJRhftm0BJbfiuQdXpz7bz5diy?=
 =?us-ascii?Q?Bf/FqleQTYLvng/6Oqqj5OfLeHVdqy3OZTKipfTOeEAWflOs5XCBBYmrCJq4?=
 =?us-ascii?Q?tkAwPWemgDEsweGNlC1grmEh6VTuuR/w+57DY8vdMf9a5NvEIF2P58WuDiy3?=
 =?us-ascii?Q?E+FsQ/QdGjuRQ2IvEsN5cAd7LyuOPlO76FwzlkUPmF5XTHHn9Go3/WSqJWic?=
 =?us-ascii?Q?kpaZDysJxoKm58lJ24ZETI7fmCeM2LKIURgaTD96zxYCjaMW6SkBOIZ+cfFS?=
 =?us-ascii?Q?ZFMBdhtZSV90JWEnQAX2PI9IWBG4g99ftTInuILlHWVAJgIuyhY9ap63VWKV?=
 =?us-ascii?Q?7jGN9+pwQ6OB57CoigNSMVqIZeZ9nOzqtuvoq17TwjgvssmoaIC4tA97UEMv?=
 =?us-ascii?Q?yytpZ4mBA1J8vP89lDQZ+IA1zOVWEVu3p8PY7H3tls4dtor9skqSIMtd5B9M?=
 =?us-ascii?Q?eMPtNLMkvQauKOMd+vfBh9+FSQAr33N/pJ7UsyE1AfViasX14dguuOn83zYM?=
 =?us-ascii?Q?lUx6lSiuu4dVK0CFgnll2w/p/F4gqnkm1vSqHG3YG0l2c0aU0p/TuWVqDY6F?=
 =?us-ascii?Q?4+sGSIS69xELT1tYx/fpoADYv6E6s3c5PYSDaM734bK+rLqQ/jk1j3fPpIqT?=
 =?us-ascii?Q?2c3IKMy2UwoJ6tBXyhwMQO2im2rnlpC68I4tqUXm5kyzada5raZROfhQ0l0L?=
 =?us-ascii?Q?7QU8XbHPmuocBZE+XMBSpfZU9PYdqGQo49VFAlYceGG5v4DP5TJCkv8ZEza/?=
 =?us-ascii?Q?F2PK+6Dx4ZQqTKC46sq2DKzC3RnTexa1QfLRDyjon28oUEQKPj9Lf2mTZlog?=
 =?us-ascii?Q?7bWW7DHdXI6lfGCtEKjTKSn7tplruDiohWmoThdLC9TLnae16gz2Hrceslf+?=
 =?us-ascii?Q?p57TPP+f3420pzd8kC/Oiy5MWwV9QrOqRYBRGyh2T+d9wjzq4Za6btPpKpTN?=
 =?us-ascii?Q?BtIoPuHRNXALCP3TRyRfjU/0MsxfPtrXDH+QSFp5Jmt0k8DrvJqwSdPDZ+ks?=
 =?us-ascii?Q?5T4JrDNQ8U5xtlRPK5OKivyIjBea5Tz2x0RwwQZW5LEfpr26SAIETNN5XBDt?=
 =?us-ascii?Q?nXpOl72k2ordqrEvtcqFAsmtVHThyYcX9IzEMx/SEl1yNdadud7A6wnDWvXn?=
 =?us-ascii?Q?0l2vV5xGIaYx+pBMGRW9N7w9/3LCeaPCXWOgpS3GUMwIcq16K9ZL8oIHjLH2?=
 =?us-ascii?Q?mYtmTPKAnJPR1SfgvD/kq37iiS8PT019SC0Lge0dChP87c++MfygUTcerT5e?=
 =?us-ascii?Q?sBfcw5bV36MFb37bjhuv09OkJDkphw84jdOoAhyi7XsQF/HZ2JVH0/DS8AQR?=
 =?us-ascii?Q?RNmPiOgEeGH+iOcWbsoLuIy6Zy6inzVmFyEedh9PQP7IibaTHs/BVxb8DX6K?=
 =?us-ascii?Q?5/Ik7cyStTnFwA46Jiggy5HyZZsR+TyxzOF6gaGGzszizqxEUo5ijwiX8T7Y?=
 =?us-ascii?Q?wxjnzKvKTamCTwtmkF/zTD+VYFefNX9sRwO4JHmLloWRpSoBcFtIJCTH8xJc?=
 =?us-ascii?Q?hcesBGv9Uu4z3GQgEL7VNTezGEvMtSUUCATul0N0vpMBTt+pGFfQi70cfuE6?=
 =?us-ascii?Q?oIDivYFE/ZcHZbwvKYoZTAFdCFwZ4NkJZ3kvl2+9iQTKzzbb+cKiO4YiH+z6?=
 =?us-ascii?Q?FA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 385bcd22-375d-42e0-726f-08dd196a725b
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2024 22:31:53.3741 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vf5TrPbCLWcTd31o9kEV3sNIsabgKpsc5luBworWwrCggDLr+soGLDUON/4sBuulbX+Hz8mDG1nOO9D/6kBunpKr32L9sSXX8yOEaVV+fFM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7379
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

On Mon, Dec 09, 2024 at 03:27:38PM -0800, Lucas De Marchi wrote:
> Currently xe_reg_sr_apply_whitelist() sets the unused values to a known
> used value for no good reason: it could just leave it with the HW
> default. The behavior is slightly different if there are no whitelist
> registers for the engine as the function returns early. This is not
> needed, so just drop the addition writes for the unused slots.
> 
> Later this will allow to reduce the amount of registers passed to GuC
> for save/restore.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_reg_sr.c | 7 -------
>  1 file changed, 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
> index 080229e0fc15a..0a5c0e62d6e88 100644
> --- a/drivers/gpu/drm/xe/xe_reg_sr.c
> +++ b/drivers/gpu/drm/xe/xe_reg_sr.c
> @@ -227,13 +227,6 @@ void xe_reg_sr_apply_whitelist(struct xe_hw_engine *hwe)
>  		slot++;
>  	}
>  
> -	/* And clear the rest just in case of garbage */
> -	for (; slot < RING_MAX_NONPRIV_SLOTS; slot++) {
> -		u32 addr = RING_NOPID(mmio_base).addr;
> -
> -		xe_mmio_write32(&gt->mmio, RING_FORCE_TO_NONPRIV(mmio_base, slot), addr);
> -	}
> -
>  	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>  
>  	return;
> -- 
> 2.47.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
