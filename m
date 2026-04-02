Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B0D3D39410
	for <intel-xe@archiver.kernel.org>; Thu,  2 Apr 2026 10:56:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C186410F21F;
	Thu,  2 Apr 2026 10:56:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YlB2KXJ1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78E1A10F1C9
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Apr 2026 10:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775127374; x=1806663374;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=jRgnMiDmZapLOEdLMB9pAg/o+VIRDNt3YcUprpkgMI0=;
 b=YlB2KXJ13WOHAEcYP3epCCkKASdzY2mjmDiXVZMXZjlTdYLZGulJyp2i
 ZXPNHDAa7ajfsq6Z/chkyseD1xC1mHHbKbCFncBHgqw4ME5C4iJ3GjQV0
 63erUVQ+JWw98Wejf7FrLsPpA9r2Q2Yg+SXWQ0yQa7vwFAuimUZ6Kh1xt
 pQFgfPmfU1JbOjndi3q5cDVkU0i+kdUjLquBf9QrhUDBtJx+gwnxk09Bs
 6BgwaFBrV0RApKnrn98dcw21xAfDrL0gbH4CCelIX86FuCz0CgT+G5k1N
 GRGKhFPk6cLKg5L+OdkerRom6aMn8Zt0p3l5a9ENgu26Ny1WWZMEWIGT6 w==;
X-CSE-ConnectionGUID: LHu6bz/AQgmtMeDrpGRxeQ==
X-CSE-MsgGUID: wCUF8lCWTYmniwR0KUvRWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="76148303"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208";a="76148303"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 03:56:13 -0700
X-CSE-ConnectionGUID: E5/bR9/LRxulTA47o1jTLA==
X-CSE-MsgGUID: 4ZlyWae/QsWKlsEaRXq2uQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208";a="226816140"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 03:56:13 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 2 Apr 2026 03:56:12 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 2 Apr 2026 03:56:12 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.29) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 2 Apr 2026 03:56:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TMzZ5IopX7iDaGpJILNBJavYlxFWkrmFgojltVl3Be+elWQSbK6lasYs7w0h8TYxevGIPgzIMAG8kSDIksVNF1ibSIXz3/0FknD6pr34cplOXsdrP4qZqKgfEtTeNM6IpgUBPOTx3T5LOF7OujtUUukrO7tXs1/tlhm/MPCgvuYCcmionqUNRCYuwYvzc65fUu+Vz5WWsNFFLgGYI8sAWIfrtSwwCHhcoRrNf0PQ0gNyElU7EMAse9N6WiY40Ju0NCzA1coUSdIlVYXKmvcPxbMZgWptBjZm7xdX8WuAXa3aCzvIKRFENc+BcMVK7qZtUvfHCkkgpPpBfTm4/n7egg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UI4Mvq7lNJ63IO0tLIIHL0hRKJCJBWHWoVk4q2THs6Y=;
 b=iDBaPQgT55IWHJwDp4MoP7zdhRTZtsPCDzR6LzPgGCzhWGhSj7+qZKkYxRKxKxetITjRYSazVSOBJOAIktbHGkcrdE2CGxvBcq7R4ZeIMgwYoQT5WSmsbxlcaEcTBadrjK5G+hnJFkGnfVu0mb114+jAIoBp0NO4urjK801KYvTXMSwVz4oEZUVyDOfiR06YpZBbv4objPh+SBwC1P9+EKvrKfDLPFqNsFz3c1TKZn+HkzD/nXHj2ejBV2YSB20+q+KI1LxPOGCXs1wQnmQbtTL9yI42Cwzj8lMfhPLGYxBmr/uERMNfpTrUj7qeSq2KVaUq2R2VIdIX4DepMMnSIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by BY1PR11MB8029.namprd11.prod.outlook.com (2603:10b6:a03:526::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Thu, 2 Apr
 2026 10:56:10 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%5]) with mapi id 15.20.9769.017; Thu, 2 Apr 2026
 10:56:10 +0000
Date: Thu, 2 Apr 2026 12:56:05 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 04/13] drm/xe/pf: Print applied policy KLVs
Message-ID: <20260402105605.lkv22hyul4wzq56u@intel.com>
References: <20260330204046.567-1-michal.wajdeczko@intel.com>
 <20260330204046.567-5-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260330204046.567-5-michal.wajdeczko@intel.com>
X-ClientProxiedBy: VI1P194CA0032.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:803:3c::21) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|BY1PR11MB8029:EE_
X-MS-Office365-Filtering-Correlation-Id: d748f56d-5f86-4812-c2cd-08de90a672d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: 8BGJy+gmVXsC5xzcLpBV5xY7slg0JjIBPNOEv/CZJyj5Yu15n6q4T8Bk7K6+hzqmSGHlN1Ig96aHrLrKCBR8IoxFrX3e8KfoHsbR871LQL6TbZhetbl1ikPGrj465Qn16bfatF+JdiHaSl44PK6/l/oGHwmwBF+xX3HPz1+20swM6hafjHS3j2mxTyxSpp9vyzwsM9Bep/0snembOI87DGYpS0QyvPsYXD0De9SiXX+pe8hPpdHTUBQivyPaoO550DjeLsCayMWZV8lQ6oPKjWx1TwhKH8cBihHw9W2GSnhh4bwEBsLlaWgpq2wKVASiz72v7PaBN3Q6XNVDqTvN9sGq/9aN4lAkXX1srATTPYMWiHp3YDmLwpJs0tf/VuBpii1gAoIawHatVMZeER2gFUk/K70JoPTedbUFTCHPpgvyrBwNPh0eHSBpVpWajh2GvfJ7rEwp7/BqUSbYvljXgjJ0tMiaypgWqZkJkRuMyvfTyqucehUnmPogENhO1lgLg11CHqeJAgtE6AGXLnVEMR/rUY89qZb0fvNEeRhzTxmpXKp+6qrapimMpiSopPvVjiZCyAHYbsDkkKJx24veMmMvTwcDKPDgw3VKayHhXt+5bYuHXtETw8Z+tCMAv0RNWBUtbDg9Wv0v8aW4W+hjPp9rujExcmL1ubiugVDJcNcjDNfxIMt96UxcTdoxEqSfQ6aK7o/rcLP4ciG/9lwTaGpxZbUM6DBCJ7r8QFHCtT8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?blFWMlRnbVo4ZGpYV2VRbUpEZWpCaWJUcFNXQUY4Q2lkOG5qcmtaT0Fub0pH?=
 =?utf-8?B?UVJWNXFsb3VVVytrVFkvMWRUYjVyaThBUVNaVkVRMExaa0Q4cE9ZUmEzc3do?=
 =?utf-8?B?OEpERVFmZ1hNek5ubUk4enNSR0YwdU1mYU9lbzNVNzJUS05SYlpvWFVKNXRt?=
 =?utf-8?B?ZDhHYU5QOFVMUm85VDJqb1NPZThVQ3Z4SSt0RWxvRUxCTTExUko2N3k2Y2Zp?=
 =?utf-8?B?d3VyVFE5bFRxY1gwZEVtTlIySDRIN3pYNnpTOWtENDBBNlV1UW9aNVY5aTNo?=
 =?utf-8?B?QmtJYkE1Z3phZlNpbFJSKzN5T3BhbjZiS1lLMzFpNG9nelU2amtTZEE4d1Bk?=
 =?utf-8?B?czArbWRSYVVhekJwaGd4MWx4MnBJbTUxNmk1OVhiYmM1U3gzdERtVEEwZGVk?=
 =?utf-8?B?dHdabitVM2ovNGVmQmxGd3U3cDhMNUljVGx5azJLa0w3aDNUQmZraXdsc3hk?=
 =?utf-8?B?eHc4bmMxL2doSkJ0M2k2enhrWlptd2JVYkg3STcxYVptRUhrNk04TmhIZW9w?=
 =?utf-8?B?aDNJVTBxMk50TW0wRk15aXZLMzdpRU5IZDEvUzVWTEN0a3JqYkFsVWRGOS9R?=
 =?utf-8?B?VCsycjlqTHZjWktwcjZEMFRZWms1cDJma0NkRFVlMFROd3JFbWhHS0ZHRis0?=
 =?utf-8?B?NVg3WlhiZktDRElFdXNtbjBTNis0MFRhZkdNUjZnTWdaajVvNEVEZ1k1cDBM?=
 =?utf-8?B?T2xYdXVVQ3BwMG9yTXNVQyticE5MTmNSUEppSCs1VjhRaUloYnJmNFBZRkFv?=
 =?utf-8?B?Uy9GdnZEU2dNMXh2OVQ3eFZhdWhOQVdBNVVPRk5KVmd1UWVuY2NWM3VLSFJW?=
 =?utf-8?B?VGhndjJVTWpPUkZIUlA1WGVFWktYSnZ3a1NBNmtIZVlBbGVoTS9rc1YxaGor?=
 =?utf-8?B?TDZvdjFYQ3BXSG90NG5XUE52RUtDenVxVjErM3Q2ekFXb3VNVE1YTHhyWDhv?=
 =?utf-8?B?RHlndzl4TGY5SXRubmQ2eVZpV0FYMW41bTdYSDE0TVhQSzY5NlZnMFlHYlpo?=
 =?utf-8?B?N3R2ZDJpcUlIWFRFUnRTUyt3OUNmaXVEcUZyV0xkQVU1cVhIWkNVNktzWHZP?=
 =?utf-8?B?Z0JzcEx1ck9mbkdkR0g5cTFRd05HM0lFZWM5djJNcVdRUEdyOHlka2J0Rmhj?=
 =?utf-8?B?ZkQ1czNvdGpPRWQ2Z3RZU2RUNlR1U0hiYlk2Wlc2Qy80WG16VDBmdGhQbXUw?=
 =?utf-8?B?cU93cVg1S3dwZW12Sm9ReG5XWllLMVlEUTRMSkJCVzh3MnY1NUFTU1FBZUY3?=
 =?utf-8?B?T014M3ZkcVY1VVNWODhrWEMzYWhiTTJvT3BPN0QyT3N1TThOS3pPc0dtZ3FK?=
 =?utf-8?B?WUVmTlVMTFNkS2tSTStZY244aVRLUXFJTytqVmtXZmcwTDRZS09SQTA0RkFn?=
 =?utf-8?B?YTc2enNEMDBuRjB4VU5DM1RLaVJERXhSQVI1SG1qOHU2NzZrdjVnc0E2WkVB?=
 =?utf-8?B?ZDRYVXlEYnRKNmp0QmFVYzNWbWM1Wm5BUkNOa1NWeDkvRkdCc25uYUFraUpo?=
 =?utf-8?B?MXBMYnpXUjJjVnlCTEcyNjB5ZEMyTE5yMHVMZWVrVXRRNmxabmthRnArRnBW?=
 =?utf-8?B?OTZZTnh2Vy9sdEsxamVxbWQ5bHd2ci8xMVN0N2hVaVJkTUJKU3F0bmNFQUpD?=
 =?utf-8?B?U1ZuRlE2ZVpNMkFtVytzQzJXUkY1MTI0OXRIVjgybWt2S2VRNTZsYmsvbi91?=
 =?utf-8?B?SHNmZEV5THJMcHFTeUwzU3JSZzJhOU4zWEhhZEhQNWswMXA4Nk16REFhWW5y?=
 =?utf-8?B?SUpwQnNuZVVocnh5VnBQTHk5ZTNGSWxyeXJmc2VYTExLZHJFSnFiUkJLcXpI?=
 =?utf-8?B?Zll1WTFqUFR0ODZsYU9ITVhidEZaNG1aRGpXMy84c05lMGNPVHR5QklQcVNh?=
 =?utf-8?B?c0ZFT2xtajBwRDNjVjYvSjFqd004WFhueWVsZkVSeFVIYTdMVk0rMDJSTG8z?=
 =?utf-8?B?aURzdXd4ZTBTeGJDd0RHOWVicHVIN3d3TWM4ZU1qMzBKWVZmRHU3K0xsQVl4?=
 =?utf-8?B?TFJRcDlySVRiclErNGhBL2xYbzl6c0w5eHN1ZytNb1hESkFSUEl2OVN1U2hh?=
 =?utf-8?B?S3MwVE04bEVacmY1NWwxa0FDZ2g5c2xsWjZ4bmhibFg5R1V6WEZFWFlqM3Bz?=
 =?utf-8?B?TUQyMm4xMkdVMitvQ2hmQnJkWlNPOTEwUzVkUnVESHFJbDZWQ2tRTHJXSWpm?=
 =?utf-8?B?ekFEek5ydTVlWjBHWVZycEtPdU0zL0szZ21sUkJ6cENWOThmS0ZRdUJxRDlu?=
 =?utf-8?B?MGxkMDFCd29lNnJUMHpQT2l0TWlJeU9yaWZ1QnZkcWZpUTQ3QVJnemFiWm1Z?=
 =?utf-8?B?U1hVY2kwaVRJRUtnZVNoWEhQeVJ3emhNczlHMFJwQVZSZ3NJNTdCRDZzMng0?=
 =?utf-8?Q?iO/uFEZ5ESPGzIPI=3D?=
X-Exchange-RoutingPolicyChecked: Xy20wu/QILyDtyKs8c0ENLZ05M6pEVIdM19pI5FhhV13w0qtqppg5hawZLYGXftzDJ11kZFYUkue4xBte5KDX4CyESIk9ZuJABWIsdfxFjoxJO6fzYN32rNpThJ14WZipi3ZD7Lr+aUY/agKq7b6sWa2+rsdDInyoYVORLg1yjv+XUscXgLlE+eoa04PO8bjRQGFiF8OzXzMZmAa1uIJQQ9Ux2+C9weHtmJKit6UWDSlE5pqoaIiRU544IoWdG4qwPQRzb9oZ+ckDgeMoj+obgdbUmz9+VEEJTShC7fZQNYaZQJw88ybHm35JPYzgL0l9Hw7PeUs0W7N3nNLpRgAVg==
X-MS-Exchange-CrossTenant-Network-Message-Id: d748f56d-5f86-4812-c2cd-08de90a672d1
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 10:56:10.0441 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IDU1aj0SJJfxwmAnTvgzjPUOxxtYx9ph8jQP/xZdf7BGl1fs86/PHWl0QnYbYx5CiFY3Q7T6TIHXoAFWsvitNWN0krIDAeaV/JoLvJhhPZ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8029
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on pon [2026-mar-30 22:40:35 +0200]:
> Under CONFIG_DRM_XE_DEBUG_SRIOV print all policy KLVs sent to the
> GuC for better diagnostics.  This is similar what we are already
> doing with VF configuration KLVs.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
> index 6ab02e96e46c..c88c4e6a9b61 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
> @@ -68,6 +68,15 @@ static int pf_push_policy_buf_klvs(struct xe_gt *gt, u32 num_klvs,
>  		return err;
>  	}
>  
> +	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG_SRIOV)) {
> +		struct drm_printer p = xe_gt_dbg_printer(gt);
> +		void *klvs = xe_guc_buf_cpu_ptr(buf);
> +
> +		xe_gt_sriov_dbg(gt, "pushed policy update with %u KLV%s:\n",
> +				num_klvs, str_plural(num_klvs));
> +		xe_guc_klv_print(klvs, num_dwords, &p);
> +	}
> +
>  	return 0;


LGTM:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

>  }
>  
> -- 
> 2.47.1
> 

-- 
