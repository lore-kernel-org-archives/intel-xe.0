Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F1B5C021A4
	for <intel-xe@archiver.kernel.org>; Tue, 25 Feb 2025 03:12:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03A2310E52C;
	Tue, 25 Feb 2025 03:12:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aA9hKaaV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A7A110E52C
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Feb 2025 03:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740453168; x=1771989168;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ZCpOmfdlE/sWL+XqMeTTMLIjDEOkJMIlDaXnztPBbgo=;
 b=aA9hKaaVbuBHt0RD0fjj+nZwH7B0nBvAGakCrQ2KBJufSsFRmTdtZPvn
 7L1kCn5qF0K3fEVqorE7ghqmqwAuDtxubYlMLq/z7tq9gjZj5Vie8rAIy
 2QR4q+gy6pQd7wfFAOk2ZxIhKph6xtd5NGApwF57dPerLY6luivRkMMS7
 gA9PRi9fH0ajhkpIF3G9OReVmEvgn8GeiBlwRWfYZSyMth5Yz1DlKBoKG
 Mc3EIU2o1NAGxEE0kOAm6KuQfof0hl7OrPXu6JgloJYdYIdnC8Z1Vk7WZ
 Jo7CN4pjYXUNG3wns2nvOU4SgGeOfcprsZuovQ7zUQabb60Q6J5kb80JF g==;
X-CSE-ConnectionGUID: c57tjmp7QFerxZtiVX1rpQ==
X-CSE-MsgGUID: Clvs2sdZRGiU7/brsikSWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="44068853"
X-IronPort-AV: E=Sophos;i="6.13,313,1732608000"; d="scan'208";a="44068853"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 19:12:45 -0800
X-CSE-ConnectionGUID: 5naX4xb+Rw+HlrkPkEzw7w==
X-CSE-MsgGUID: 2BKDfffYQ1C3TvidNFb6dQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,313,1732608000"; d="scan'208";a="116888826"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 19:10:12 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 24 Feb 2025 19:10:11 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 24 Feb 2025 19:10:11 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 24 Feb 2025 19:10:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C/t52UITCnbJxZuYnnlCWbwhWpdWe0lOxbJrSBCovZGas2vOmeoaXkGI2VEv5xB1D/djHHwl1dl23v4wbSZHckVNhtFhw+6Im675XYIA8vFOhUtR1Lm4mBrYWesOK0wawt6hnmB7DD9vcoqdOfwVA/VfFfG8t9th6oKZVENq7P2WOxjUyj3n3dej84qhoAX3yfhsEd7zNOU61pNWHyUK3tZ5U8xKYTxHWYklAZP4Rs0CBTJ2XpyPbMr2d+xpd3XAA6nWEQ///Ox2YJ9/a9hoIc8hWaxg/UjGtwPOw7Ynmprg+7kgD2nFs6kOIc/MtFGXiRBjkTEf74S1JWX33D2oKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GCj8kXiqqXd1POVhIeGeJpgX1OeYaNVwHBx6R9cKc+A=;
 b=xDFURUcWMYPXL1kj/FkZ3zmkRKhQB14FtTzMjK5JjrsT1+12Gx4VSOE3izRr2MKgadCm9q7GNK29D5+NDPorPXCH7jUon9AonhHBef644421S3YqU1EP6br9hizc8oRsEpdRiv3hXOiAloon/4nSrGouymbnrDlASNNIC6o4m26vlvhhIbK6K+7iWuQ09BOx3JlLMOw5du5fj7aYE4YZsWzcUp7/2IhF+k8IKRMKuWBgyCB7G2nFP0Quv4ynm2Gknd7XRDySkQq4XY9drRA7oiBNXCwFzcblNxMTXkBqkTdLsYJXb+NDIZyv7rlRkb7MVYNVVyEq5P91kgKbAYXqxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Tue, 25 Feb
 2025 03:10:03 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 03:10:03 +0000
Date: Mon, 24 Feb 2025 19:10:01 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH v2 4/5] drm/xe/kunit: Update RTP tests with SR-IOV rules
Message-ID: <20250225031001.GH4460@mdroper-desk1.amr.corp.intel.com>
References: <20250224150700.1778-1-michal.wajdeczko@intel.com>
 <20250224150700.1778-5-michal.wajdeczko@intel.com>
 <20250224225528.GD4460@mdroper-desk1.amr.corp.intel.com>
 <b415f920-0766-4a53-b97d-f5579ad3d04b@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <b415f920-0766-4a53-b97d-f5579ad3d04b@intel.com>
X-ClientProxiedBy: BYAPR02CA0021.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::34) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH8PR11MB8287:EE_
X-MS-Office365-Filtering-Correlation-Id: 41cdc8d1-7c88-4c29-d7ad-08dd5549e5cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ASHXJkdrzEEyfSzbDHFDQ2LhoRoPs5kWOSChYGh0pksYQ8M6M24you5nLfGz?=
 =?us-ascii?Q?OvofqgfCqz4kpPHSHOEtW9lNa3oKL0SsFPK6UxCGtEsNUDiXu1Uu9BqdGXkw?=
 =?us-ascii?Q?tZtcEQRnYdO3O/Nb+yX024tMTwosFRejqzJ5T8DAbo0fYJIGBgUdBGELfx0d?=
 =?us-ascii?Q?v+9P2X36Dw3J3FW0ax3iydvmdMR2aaXp/KTNl++dJJrHJkAOuarLUmHP7sh2?=
 =?us-ascii?Q?CR6gdJktQ5Btao+LVc4aCcCWKMZpUl6oRvwt29+CXumKJ1gxv2JtHDXiH8tZ?=
 =?us-ascii?Q?GgkOG8KLcBia/EV2fLpLf+5mnh1z9m8NpvgKkNl1buX96JrMlaGxg0Z+Vc8R?=
 =?us-ascii?Q?sFupjKO1leIVVw1mQKaEYxUfznLGp9m/LzsMrMO/uMnTrb3P6HMsfEvcZk5e?=
 =?us-ascii?Q?KK7uksRBsYSCQBw/tRhqDsRUTwuHNn5qIv7jLgUbEyLoWslvuRn0tGPuXiBw?=
 =?us-ascii?Q?roi3nbS+Ly511Ffb2AF6Zcp7v7T1mW2jlinVU3rc5eIqLTqJhvQ1YJ3rD0Xz?=
 =?us-ascii?Q?jnuev1Sk+xsfOhoHHfcagyvKLd5NnQy0yQcbWxXpPxUUtETTue9e6tGROcqU?=
 =?us-ascii?Q?xqTvtgEMSuF3ELZR01HHlsvwknhptLyYoqUasNGXOGxQqb39O7Riecxc3CAZ?=
 =?us-ascii?Q?+tDhiWGJTBrV41PIWKMhVvo9uIGPswtb2m4iYTcBPgEO8rtrHKPF2M5vm2oz?=
 =?us-ascii?Q?+2gOEzX9tHy05jOt3Sv+fBN/RaMSiNsrd1Uas3Y7vNN4lhSwHqVdPo/Q0oL6?=
 =?us-ascii?Q?8s/2+T7At7vUkK5Sc0nn1QYZn4TQg0ByxnYvegScwzSMLFrrip21n/tzrc4d?=
 =?us-ascii?Q?/BouxFUlkwkCE7LTFxs7s8Qg1+euXcHfz5cIionjNoS3WDhKhkSJClELu+A2?=
 =?us-ascii?Q?ilkQMhvUXdToGiChnu+DK/m8gsxXGd/2dEu2qhIEA2bzIpPfXBIt+ORWLbnT?=
 =?us-ascii?Q?qEyQKUlk+Xk+yv4WsnTJ09FyJVcUI7NUo1T/R8lmunfW51UksnG26DAlOiW4?=
 =?us-ascii?Q?y0RMrt2Ng0Rndq/zHWOAHVlsc89G3JjYHTfdcKcwpmL75hh8QSpc33Q/JblC?=
 =?us-ascii?Q?giXUKa3Rm2Aqj4hlOizXY6cEKlQ3tX2qzAKhgegIbpCgiFiNOupPLl2CApho?=
 =?us-ascii?Q?fMCYOadohyNjXZIw2EhqU3fJf8lFANaL1vO515zPy0ykwkFvP9+v0FxNpmoe?=
 =?us-ascii?Q?TQMqFiUhcQTU7EmIKyadkxw/QmunXN/aIXvkTJLPns8dVAHOLc3HS8tBrFh3?=
 =?us-ascii?Q?L+cHzIlxSR3GlSKp2zR/qoOnQThdiwozR4r1nAP2kVbzv28DD/2XfYy/7a7f?=
 =?us-ascii?Q?x+mW7mbLA7zrrVfn+Kj9PoHv+x7gGAMSBbH7WdILLcspWtsSQv3O5jrgNWpv?=
 =?us-ascii?Q?DeJkdbbQUNaSvlhOB6V50puB6b9O?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vj/gTt4E3Hq1T/aM1Dto4RIi4uXkL/oEwgsZV4gaTw3P0yN+fha399mew7RI?=
 =?us-ascii?Q?yLKSoJ9Xgw82Ja4beE10JPFHpEGrZtlSzqqR/95brP8yJAw4EK1nuGn5kVlg?=
 =?us-ascii?Q?cChNEk4aOmtfPptCZlWKrRhz1jXzT8Ootpkq5m53tc8LgBG9NGF5sjrzKMWN?=
 =?us-ascii?Q?6U6cyh+TwsQEko5mASKyeP/rs6wy8SMMwk9l+bWIW4BmuEjDBjt21wwX6lIU?=
 =?us-ascii?Q?lU4TYww0i+hJ2F6Zim8VSYPuQgqhLgwZ9VcOCinJ/IW/mNU1U9ZzK1LIuKm1?=
 =?us-ascii?Q?iCKtGUd49bpmsH2Vnoxvpo1hzc8N51AopW/BdmWNLdrM2ZCwf+ZIq7U+JmtC?=
 =?us-ascii?Q?6cRd5KDd4oisvLssYhRnEgdVMa8PQzlUye4HfbuiMGSgy252jbuc46Os5znC?=
 =?us-ascii?Q?byksYtRec3AEglKKNWJmhMPO7Jvv8QM4Cawtq2QExM4BWNzBh00AEqaq0Itw?=
 =?us-ascii?Q?A1gj/P5CCoW4HcSLTDpmwiwblrBjEV16sx13a8L/DzDbtD5byaOTYaFOQCmT?=
 =?us-ascii?Q?g+spRQJGzaIpjqu+cJOlIzje9UhuXMGV8HKkKGWsrGJk1NkOZsTlb51gxkDG?=
 =?us-ascii?Q?WMTrkL4x0g2/Lkxmz7dQLCs3nmtuv0kNJ23RgY9hY/ErWALYHY4dlEZQ8ZWw?=
 =?us-ascii?Q?qlk3bdtQzb8AUSw2wt1IlsllEOfwAr8hkh+vRN4f+uocNBtcmW5dlweXgjFV?=
 =?us-ascii?Q?DylueKtu+NnmtF9SgzKk6UoWXotmBJT2++Uk7Qdmqecwod+EndXDcTgGVLL0?=
 =?us-ascii?Q?JTYWNdFHOgXSSn9CvbsMMwUek9Bhgg7+TVEG68fHVJ79QP2jAeYRf70ygkjp?=
 =?us-ascii?Q?LsLM/RJvitm9Ze+F2Ozo16Wsy0gJ4drAfXOuAii2KvwjrBm0B+H99bX6unG+?=
 =?us-ascii?Q?ycU66dUcJrlDN7WaBJHQ5zzDpDCxLPvReQ7Azq/Islj1+GQlv+oLRxH1TgFE?=
 =?us-ascii?Q?/zPIbBlknNCzVjqzHTkBhh+/JXb2NtCXdj/AVwLwhJiz7nyo2yIDQkY5Zk01?=
 =?us-ascii?Q?Ce2mEYhj2mSBWHP00+fHrD9qlo8+ALLgsjDgdhSZMKKPWW3pCku+lB2xZeX2?=
 =?us-ascii?Q?RERxB4n45C3wWFI16FlomNWiARY+xQ3Q6gN3ghFO3ClkxaXK630QxS8shg5+?=
 =?us-ascii?Q?8oWcJ9FRr9ixHvme84VjKeMToWlT47SpAwW0LcDDQPbjx6COv90EIqgek7Xu?=
 =?us-ascii?Q?WrIphQXMR4I1DOx71ZwxMsKaGBkAhAvyLIV5J44nNTE40bPXHlt2u1x9BnFk?=
 =?us-ascii?Q?TQ49IHf83/LAONob7mV7+/D32nsNw8xSfwWQrFq8lSIQxTBR8hfBlJoNnh3H?=
 =?us-ascii?Q?UoxdztUHIXPbV1pIOAsGwt4pQQDF2pQmW6IOOfXpeT5wgLkczYk0pST13QV5?=
 =?us-ascii?Q?xIq5/SiAB8BppxqAyQeqc0i4+xjtnam44/BEp+VQikVfOj+Kklj/+rJ3qiSW?=
 =?us-ascii?Q?+Jpc1rDU71J/B3EbmHh92B8MXA/AKwSmGFhMi0FvbdmnpWf8LGFTD28T2rew?=
 =?us-ascii?Q?e7zPCwnZU4z8+rLMjGIjYtJk/Y/MgzskDrF2oOYStg9q8tT5/RqReA+SzPfm?=
 =?us-ascii?Q?lm4L532LOdQ0SXsc10ts8nE3LPA0/H94WcAlTHBHxUe6YgXqEoTZnLnqwtTF?=
 =?us-ascii?Q?bA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 41cdc8d1-7c88-4c29-d7ad-08dd5549e5cd
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 03:10:03.3989 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jzflwdmvbd3E9XMKU/SqCd9vQ+/aVthMotCTNk3ias8e76lUeHq4z5K+sH6bAX4NSUkCORbjrwNUazl1x83Q3gZxSZefv+X+dveb4k/FIjs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8287
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

On Tue, Feb 25, 2025 at 12:41:09AM +0100, Michal Wajdeczko wrote:
> 
> 
> On 24.02.2025 23:55, Matt Roper wrote:
> > On Mon, Feb 24, 2025 at 04:06:59PM +0100, Michal Wajdeczko wrote:
> >> Add more test cases that verifies use of RTP SRIOV() rules in
> >> driver running as native, PF and VF mode.
> >>
> >> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> >> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> >> ---
> >>  drivers/gpu/drm/xe/tests/xe_rtp_test.c | 112 ++++++++++++++++++++++++-
> >>  1 file changed, 111 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_test.c b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
> >> index 36a3b5420fef..b21474df933e 100644
> >> --- a/drivers/gpu/drm/xe/tests/xe_rtp_test.c
> >> +++ b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
> >> @@ -45,6 +45,8 @@ struct rtp_to_sr_test_case {
> >>  struct rtp_test_case {
> >>  	const char *name;
> >>  	unsigned long expected_active;
> >> +	unsigned long expected_active_pf;
> >> +	unsigned long expected_active_vf;
> >>  	const struct xe_rtp_entry *entries;
> >>  };
> >>  
> >> @@ -469,6 +471,89 @@ static const struct rtp_test_case rtp_cases[] = {
> >>  	},
> >>  };
> >>  
> >> +static const struct rtp_test_case sriov_cases[] = {
> >> +	{
> >> +		.name = "non_vf",
> >> +		.expected_active = BIT(0) | BIT(1),
> >> +		.expected_active_pf = BIT(0) | BIT(1),
> >> +		.expected_active_vf = 0,
> >> +		.entries = (const struct xe_rtp_entry[]) {
> >> +			{ XE_RTP_NAME("and"),
> >> +			  XE_RTP_RULES(FUNC(match_yes)),
> >> +			},
> >> +			{ XE_RTP_NAME("or"),
> >> +			  XE_RTP_RULES(FUNC(match_no), OR,
> >> +				       FUNC(match_yes)),
> >> +			},
> >> +			{}
> >> +		},
> >> +	},
> >> +	{
> >> +		.name = "vf_ready",
> >> +		.expected_active = BIT(0) | BIT(1),
> >> +		.expected_active_pf = BIT(0) | BIT(1),
> >> +		.expected_active_vf = BIT(0) | BIT(1),
> >> +		.entries = (const struct xe_rtp_entry[]) {
> >> +			{ XE_RTP_NAME("and"),
> >> +			  XE_RTP_RULES(FUNC(match_yes), SRIOV(VF_READY)),
> >> +			},
> >> +			{ XE_RTP_NAME("or"),
> >> +			  XE_RTP_RULES(FUNC(match_no), OR,
> >> +				       FUNC(match_yes), SRIOV(VF_READY)),
> >> +			},
> >> +			{}
> >> +		},
> >> +	},
> >> +	{
> >> +		.name = "vf_only",
> >> +		.expected_active = 0,
> >> +		.expected_active_pf = 0,
> >> +		.expected_active_vf = BIT(0) | BIT(1),
> >> +		.entries = (const struct xe_rtp_entry[]) {
> >> +			{ XE_RTP_NAME("and"),
> >> +			  XE_RTP_RULES(FUNC(match_yes), SRIOV(VF_ONLY)),
> >> +			},
> >> +			{ XE_RTP_NAME("or"),
> >> +			  XE_RTP_RULES(FUNC(match_no), OR,
> >> +				       FUNC(match_yes), SRIOV(VF_ONLY)),
> >> +			},
> >> +			{}
> >> +		},
> >> +	},
> >> +	{
> >> +		.name = "pf_only",
> >> +		.expected_active = 0,
> >> +		.expected_active_pf = BIT(0) | BIT(1),
> >> +		.expected_active_vf = 0,
> >> +		.entries = (const struct xe_rtp_entry[]) {
> >> +			{ XE_RTP_NAME("and"),
> >> +			  XE_RTP_RULES(FUNC(match_yes), SRIOV(PF_ONLY)),
> >> +			},
> >> +			{ XE_RTP_NAME("or"),
> >> +			  XE_RTP_RULES(FUNC(match_no), OR,
> >> +				       FUNC(match_yes), SRIOV(PF_ONLY)),
> >> +			},
> >> +			{}
> >> +		},
> >> +	},
> >> +	{
> >> +		.name = "sriov_only",
> >> +		.expected_active = 0,
> >> +		.expected_active_pf = BIT(0) | BIT(1),
> >> +		.expected_active_vf = BIT(0) | BIT(1),
> >> +		.entries = (const struct xe_rtp_entry[]) {
> >> +			{ XE_RTP_NAME("and"),
> >> +			  XE_RTP_RULES(FUNC(match_yes), SRIOV(ONLY)),
> >> +			},
> >> +			{ XE_RTP_NAME("or"),
> >> +			  XE_RTP_RULES(FUNC(match_no), OR,
> >> +				       FUNC(match_yes), SRIOV(ONLY)),
> >> +			},
> >> +			{}
> >> +		},
> >> +	},
> >> +};
> >> +
> >>  static void xe_rtp_process_tests(struct kunit *test)
> >>  {
> >>  	const struct rtp_test_case *param = test->param_value;
> >> @@ -483,7 +568,28 @@ static void xe_rtp_process_tests(struct kunit *test)
> >>  	xe_rtp_process_ctx_enable_active_tracking(&ctx, &active, count_rtp_entries);
> >>  	xe_rtp_process(&ctx, param->entries);
> >>  
> >> -	KUNIT_EXPECT_EQ(test, active, param->expected_active);
> >> +	if (IS_SRIOV_PF(xe))
> > 
> > The xe here is a mock device (from drm_kunit_helper_alloc_device).
> > Won't these SRIOV tests require something extra in
> > xe_pci_fake_device_init() to ever be SRIOV-enabled?  Or am I overlooking
> > something?
> 
> yes ;)
> 
> see xe_rtp_process_tests_{pf,vf} below, where we convert mock xe to be
> PF or VF by explicitly altering xe->sriov.__mode

Oops, yeah.  Somehow I completely overlooked that part.

I'm not sure if we'll ever need to add more entries to xe_rtp_tests[],
but should we switch the mode back to native at the end of those
functions to prevent any subsequent tests from inheriting unexpected VF
behavior?


Matt

> 
> > 
> > 
> > Matt
> > 
> > 
> >> +		KUNIT_EXPECT_EQ(test, active, param->expected_active_pf);
> >> +	else if (IS_SRIOV_VF(xe))
> >> +		KUNIT_EXPECT_EQ(test, active, param->expected_active_vf);
> >> +	else
> >> +		KUNIT_EXPECT_EQ(test, active, param->expected_active);
> >> +}
> >> +
> >> +static void xe_rtp_process_tests_pf(struct kunit *test)
> >> +{
> >> +	struct xe_device *xe = test->priv;
> >> +
> >> +	xe->sriov.__mode = XE_SRIOV_MODE_PF;
> >> +	xe_rtp_process_tests(test);
> >> +}
> >> +
> >> +static void xe_rtp_process_tests_vf(struct kunit *test)
> >> +{
> >> +	struct xe_device *xe = test->priv;
> >> +
> >> +	xe->sriov.__mode = XE_SRIOV_MODE_VF;
> >> +	xe_rtp_process_tests(test);
> >>  }
> >>  
> >>  static void rtp_to_sr_desc(const struct rtp_to_sr_test_case *t, char *desc)
> >> @@ -499,6 +605,7 @@ static void rtp_desc(const struct rtp_test_case *t, char *desc)
> >>  }
> >>  
> >>  KUNIT_ARRAY_PARAM(rtp, rtp_cases, rtp_desc);
> >> +KUNIT_ARRAY_PARAM(sriov, sriov_cases, rtp_desc);
> >>  
> >>  static int xe_rtp_test_init(struct kunit *test)
> >>  {
> >> @@ -533,6 +640,9 @@ static void xe_rtp_test_exit(struct kunit *test)
> >>  static struct kunit_case xe_rtp_tests[] = {
> >>  	KUNIT_CASE_PARAM(xe_rtp_process_to_sr_tests, rtp_to_sr_gen_params),
> >>  	KUNIT_CASE_PARAM(xe_rtp_process_tests, rtp_gen_params),
> >> +	KUNIT_CASE_PARAM(xe_rtp_process_tests, sriov_gen_params),
> >> +	KUNIT_CASE_PARAM(xe_rtp_process_tests_pf, sriov_gen_params),
> >> +	KUNIT_CASE_PARAM(xe_rtp_process_tests_vf, sriov_gen_params),
> >>  	{}
> >>  };
> >>  
> >> -- 
> >> 2.47.1
> >>
> > 
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
