Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01B4BCAC592
	for <intel-xe@archiver.kernel.org>; Tue, 16 Sep 2025 20:27:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B54C210E170;
	Tue, 16 Sep 2025 20:27:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BaIhx5H1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ED3310E170
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Sep 2025 20:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758054471; x=1789590471;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=QYVCyrXdQiHCaV8nkIrf0xLqt2NwvCAgv6d4BN/y+Xo=;
 b=BaIhx5H1DPZoktW9CbQGBZRs29yZtJvMD0SwxZuzDcOm3L0kdtjFN9dn
 rvpfroorP9QwefKmhBbCNBx5a3K3+pKsJq6ffYOqGdonKLFDHZheUFFim
 SqGo+ypYMFzyKuI/TBK/qA5JKxA9NUEVU7L1ftjNULRpTMoYVP3S0EB1n
 KKZs4NL3oOeT/6nUzBV0I8mTpvI8YafNu6urdXyPIgmE7H+LTxI3CHREY
 a21r5O3Hx/p/5wvj35GJaY2vgJNlvsjirh9fg1LfhKew7EfB2bTBW3p0J
 Nlsy630CU9++t1frSMjqiAGEOuI2yvAq9S3KwrjtluPlZpeaHyxQFPG70 Q==;
X-CSE-ConnectionGUID: b9z6MwZ4QjmAsF+hpzpDPw==
X-CSE-MsgGUID: Pt8eNUuSRUm3215WxufCAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="64168024"
X-IronPort-AV: E=Sophos;i="6.18,270,1751266800"; d="scan'208";a="64168024"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 13:27:51 -0700
X-CSE-ConnectionGUID: uelI+CybSCyKsH/z64HDZg==
X-CSE-MsgGUID: WjpdZN63SxGr1qXcz81Kdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,270,1751266800"; d="scan'208";a="175824072"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 13:27:51 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 16 Sep 2025 13:27:50 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 16 Sep 2025 13:27:50 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.2) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 16 Sep 2025 13:27:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lGTUA1cqQRmrxa6fe2Vb/SHV7X+yv4NwQZpmql/ca4xX1A0a3/6OR32alz5UCY8k+H5K9FneHz7t7cunEQRTgHQd/Dqzr3ENUEKZmX+IodrjltssniOe2x3YM3w2OxWXZ+9rRfrgL+3EkbNQCISaUshYUHjjjnok5fDItGi6AP9KI1EegkDrTmpoJvS2GxoPZJzR+IcpSEjFTTHdZ6yv5jlF6s1cEFUP5XcW6mt0BH+wTIB53tH17WQVuHmXNG/RhjV3IB62qdL5sv5f7EwtsgSBUL+p4awIelNM+XXF+vFv+QCYwwBYh0UAm3ih58vwb54Wgs67n5If9FV0gRBsYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nbBQLgwC6+SyoAzQk6YOKgwF+0yA2vkx43vr6IYrIn4=;
 b=WVf39Vk7oWLuyxznvdLasHZiZOIx23lAJ8Y6QEmWiChUhkOI1cAMwL31AWmBLkstjhK8VefYoZEWmJU5AwsHErttrcYrg/0hAXwsNSNn/phkkN1UrQ/52Kpwe5JJ8en/G5aj6Y+GLIGHcsKtuNMlRReeInPCtpAXAz9+4tEJAlHYkqwh1clEKVF6YrZ5ey2z/KUwFoPHYYNao6tHMWM30b1siWOSHqBrXvHh1BPQLAPAjBUc5GsMVpwA2JxHIdsiKYoe/EoDB6wE3yZDHFR76v1R8NiY1Ht0Ba3Ijt1kFFYT38fta5E9QNozimoHYgA/RMq4pOIqVppyh9t6uIQRSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by DS0PR11MB9501.namprd11.prod.outlook.com (2603:10b6:8:28e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 16 Sep
 2025 20:27:49 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9115.020; Tue, 16 Sep 2025
 20:27:48 +0000
Date: Tue, 16 Sep 2025 16:27:45 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Stuart Summers
 <stuart.summers@intel.com>, Matt Roper <matthew.d.roper@intel.com>, "Riana
 Tauro" <riana.tauro@intel.com>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Raag Jadav <raag.jadav@intel.com>
Subject: Re: [PATCH v4 5/6] drm/xe/lrc: Allow to add user commands on context
 switch
Message-ID: <aMnIQQWdJvWEA0pK@intel.com>
References: <20250911-wa-bb-cmds-v4-0-c8f7e48f7eae@intel.com>
 <20250911-wa-bb-cmds-v4-5-c8f7e48f7eae@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250911-wa-bb-cmds-v4-5-c8f7e48f7eae@intel.com>
X-ClientProxiedBy: BYAPR08CA0023.namprd08.prod.outlook.com
 (2603:10b6:a03:100::36) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|DS0PR11MB9501:EE_
X-MS-Office365-Filtering-Correlation-Id: 68209bbe-247b-40c3-9288-08ddf55f809e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CTtXY9pg/aTMLJgXPn/Okc/ycZgVt6xCI75FudCSlnLIsJQ4lNphSj8/ey3Z?=
 =?us-ascii?Q?YY3mAfPro6rTXEyTZtDZFBZ4n0s9KTZQvc08TFFPNZuo9P44eQnO4cj60pPh?=
 =?us-ascii?Q?T0RLc6a5T0IoiDrPuthv2WCbUiaKZsA8JtX0Yr76jqNvHMoxGV8Cs8qrCnWa?=
 =?us-ascii?Q?S2bGuJyYcVMbFPE1935aUpBuKs6CKJTjgRXIZ+7ZCIzc30m2a7rA6qfZvjmW?=
 =?us-ascii?Q?xMi5qgW1ZvhzM0ETtF5CcAczzn1wFQ+boLEIrBrB+NTmFwkond4EZvm8YxMV?=
 =?us-ascii?Q?gUY7RHWAKuGfm20WiORfU1py/R/i56cJmhzo/Iz0H7qwzBcgSu+IJxHq8Krb?=
 =?us-ascii?Q?7i+V/5S8KYPFzj0DC60zzS0DxKo9Kl1jg8tFyL/00gsZC+NLbwDRwVPLDPWX?=
 =?us-ascii?Q?52wNNHQ/Uobe1hTz5EU7OhTHCDQyYq2WyLCH3cMvwllKfWcZAWNvNtPWKqm5?=
 =?us-ascii?Q?8b7EUd/vBTdb3vysvWDbkl5DJPJJLyIvepZux6KD9oSZKpwHHXCkdMaZZS3P?=
 =?us-ascii?Q?HFvfT/bTn8gM4KLOuu1AJB7Y494TBGL+olFGBN6Z6mcxP9weLhWXxzynPLsE?=
 =?us-ascii?Q?EBXpcDoYxbGgvpENduGZuvKkDV/c11qZ3QLDycqh/UmVDSMN+FZN3IDha/Rv?=
 =?us-ascii?Q?aBdydSg3xJLAgQGc1/nCyvQVY4XSkV1KeJqsF0fU+V+kzZrLxAYUTTAm5dDw?=
 =?us-ascii?Q?aaa6xisRDwVe8prm6CZxFjvaX53b2Daj8pF7omGHVHGZcA5+zUaJYFr7J2PY?=
 =?us-ascii?Q?gd3s2n96CBBO6sm6PNtH13/racqhCVd0+ztjI7a9GX+q2S4n5XLIaPyJD8kz?=
 =?us-ascii?Q?8+6lsTIErtcucvn2wkFsqwZMnb5SN49j7nlMHExeJRsdcg3zoyaiC3pndVrZ?=
 =?us-ascii?Q?mRBpV0Vi8gyeZTeKVwDFmlot4pMEm86iHktnKxm3N3BsysjPBx/0F4QbaXcC?=
 =?us-ascii?Q?t+Ec/ul54SUNTkcP9q6l/PWj4bKO3L6tsEzTd5ZCyHevI8hRk4o4z/cpJQZU?=
 =?us-ascii?Q?VfBGq2pGyDJFDgwu83ENdZ6928DuWfddS7pj/P6zwe6g3IAOdlGH+FRv+ivA?=
 =?us-ascii?Q?1LCl+s/XvAcFfnFYmDc/5y2Sm08dIMRqQccXz56GrkO54Dpn0FIN7xoE1P7R?=
 =?us-ascii?Q?4QtfMGLRK9JDVzhyu7F3REVTtqNmQWMCo8X3VUurausmXIjb07xqIgiQ2dbA?=
 =?us-ascii?Q?XfjDJahZoLH5haYHzLvc7MJOVbcwHqbToWYbA2KoJz2OMjPaZVjISWN8wvOC?=
 =?us-ascii?Q?80BhF4exKUnwlO58x/oz4QLIEks9Tslq4BUCbk9ERr249E+sLmLceIAaerpp?=
 =?us-ascii?Q?BH+RFKQgwST3Sq7Hdwkdczdt1D1CSEF4+WjRsixHbfFlHuNCRpYCwiT/GM4x?=
 =?us-ascii?Q?qNeX3qzFzUeZIaqZLU86NYdsgQSlbq9y8gpkqp0zbpINqJpe6ThKgvVzDlFA?=
 =?us-ascii?Q?djj1aFXLdRk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EAsRmtaPBr/jN5kQ1UbuWWZDQjW6KDFNhaJaD7jfg86VvD1jMoWniwzV6tzo?=
 =?us-ascii?Q?lvd03ID3QwnZCv/4J4YPSBgfkq0xcuZE3xn0IU1MwXuyDqc2DwDnDpCEExS3?=
 =?us-ascii?Q?6yYC13maI6Oc4jLVenG4qUhEcKQ9k6PPdXmMSvv6ArlA6y7JWWRiZKKTSQOi?=
 =?us-ascii?Q?GYKJtUWApJZiQkiKTwvI4Biy3CX6bnZwCc7nNdJ52ff+tikiXqO4aPwtRatP?=
 =?us-ascii?Q?cxE7ZpFAT2P9AfI73k2dK9EH0ZZp99PPaUnky3tjzP04mUqz+92xo7P249OL?=
 =?us-ascii?Q?vgf1rM5rmTtEh9rZzXEirNuFezDgHud9VUoLBTVyo5vHAiwx0we7SERrrAYi?=
 =?us-ascii?Q?21pmrBMLUA9zw9qGH6XEvfVfbkxYxx9EGh+J7OWyqkl3gWLJ9UucIJQQUK2/?=
 =?us-ascii?Q?mvcmtYRznLoNVyqR+SkkEikq5fBPK9L2WsZy01OZ8GK1jMzl74m3ieG0GUS2?=
 =?us-ascii?Q?ny0xOwln64rPgP8G5kKHQ37pDmbkj9j1p4TI58LeI59Snt6L6pChJvBGvCs1?=
 =?us-ascii?Q?JLH0aM28AsE0uGR2OhquetD5RFBP9HilwvEndN3zKwTxYadxakTm4KGpdK90?=
 =?us-ascii?Q?Cs4Tk0bH77qKOr49PcEY7kgEPDxXZTt6FBE+ucWpTNuUgGnGhDof6nl8CNdb?=
 =?us-ascii?Q?eQOqGTr3m+dZmpNO2dR4tBKw0urSiXU43Pg/7Mw0pr1bhw/yucz2mvrdsaW5?=
 =?us-ascii?Q?WmSxWekAf93F5ncTj0Q/0W/l0YDKUo4muhlkQowcsaGhaOJiaNpw6nCuUTlr?=
 =?us-ascii?Q?6dNCQn3s9fY2tEO8y3YuxhlGO4TQYYO96qlQPtlCMaMq5wEGenrnFrMuj1pA?=
 =?us-ascii?Q?4T/bojeNnyUguW65BBFYQwnvcqYLCYgxQImDiGQqMXbxirBdOE52E9sxzgMj?=
 =?us-ascii?Q?Lty3hTrs5d9fjfJfeUlO0AKbXuItTYLGL1o8Oae58xHQCHkCG/UMqdZMaPV0?=
 =?us-ascii?Q?xATHFHFW/FhAHOXjT8+oyrzeQf1qj4sgm9cFc7rtEHn6F5esfzV/8uw4exmA?=
 =?us-ascii?Q?yk3KOCiW6Wwdmyr9wJpes+gaH9ll2koabaQriodpcxgyYVYMSeugBFfwlW2x?=
 =?us-ascii?Q?rmxfDq/RWFHeOBP+61o8UD9fdZjoCIWgnl+j0quqDA9beDU63Cz+ueCXElWK?=
 =?us-ascii?Q?nv0UBOyTCTXU3RkBLlzsVOLnwdJG1DxwSbn0WFlXzMUeJfErnVMzLc2goVOW?=
 =?us-ascii?Q?kHDyw/l5EG+rR6Ea+VHfETRg9QmXrMhk4gw+xhaJZtb1IilJTFsi5OhE2zIn?=
 =?us-ascii?Q?RGTipBTdBC7U0hg7bY/r9nnJzjdsl1dgKak836Il11pXmKSnHoxvIP9zPr1P?=
 =?us-ascii?Q?tb1mJRuC8fC6aZS/GW1NXHtJSO5p7WLAkY9HEhawlmlhzl9Vrna5X1oEtOMs?=
 =?us-ascii?Q?z+ofuP2ZxFdKlaCqgAo919GV2wwjxYwaRbNdHWU/VVbWeuM5hawGFfrwikgv?=
 =?us-ascii?Q?EfGUz2FCL1JS3CxpjrMFsZept5djfxe/aEZh5uRCt8P/VB2ZrdtpB7dFtABs?=
 =?us-ascii?Q?5ZMjBiHrSkr1jNFn8pD+BeWmKKNITRHro4hy/Haipdeke/Eg12TdhG7PCpYB?=
 =?us-ascii?Q?LiER01tUhyEHkokdW68X0G9TQDDJCvqmbghW1Wu3OujgOG5f21dwHWAuxH7k?=
 =?us-ascii?Q?Ew=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 68209bbe-247b-40c3-9288-08ddf55f809e
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 20:27:48.7413 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ha8j2IXkV+vF+R84S0hWimq+1BN61UbQrqKXkoTshsSvA0kXOW4Q1ZJZV8UxMrBv6aNxhODPqoNko//P4m9Z5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB9501
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

On Thu, Sep 11, 2025 at 12:36:29PM -0700, Lucas De Marchi wrote:
> During validation it's useful to allows additional commands to be
> executed on context switch. Fetch the commands from configfs (to be
> added) and add them to the WA BB.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
> v2: Fix warning when building without configfs
> ---
>  drivers/gpu/drm/xe/xe_configfs.c | 13 +++++++++++++
>  drivers/gpu/drm/xe/xe_configfs.h |  6 ++++++
>  drivers/gpu/drm/xe/xe_lrc.c      | 25 +++++++++++++++++++++++++
>  3 files changed, 44 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
> index 45fdb6cf26b5d..d86c75af03278 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.c
> +++ b/drivers/gpu/drm/xe/xe_configfs.c
> @@ -633,6 +633,19 @@ bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev)
>  	return ret;
>  }
>  
> +/**
> + * xe_configfs_get_ctx_restore_post_bb - get configfs ctx_restore_post_bb setting
> + * @pdev: pci device
> + *
> + * Return: post_ctx_restore setting in configfs
> + */
> +u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev,
> +					enum xe_engine_class class,
> +					const u32 **cs)
> +{
> +	return 0;
> +}
> +
>  int __init xe_configfs_init(void)
>  {
>  	int ret;
> diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
> index 1402e863b71c0..eff2645b5f593 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.h
> +++ b/drivers/gpu/drm/xe/xe_configfs.h
> @@ -8,6 +8,8 @@
>  #include <linux/limits.h>
>  #include <linux/types.h>
>  
> +#include <xe_hw_engine_types.h>
> +
>  struct pci_dev;
>  
>  #if IS_ENABLED(CONFIG_CONFIGFS_FS)
> @@ -17,6 +19,8 @@ void xe_configfs_check_device(struct pci_dev *pdev);
>  bool xe_configfs_get_survivability_mode(struct pci_dev *pdev);
>  u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev);
>  bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev);
> +u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev, enum xe_engine_class,
> +					const u32 **cs);
>  #else
>  static inline int xe_configfs_init(void) { return 0; }
>  static inline void xe_configfs_exit(void) { }
> @@ -24,6 +28,8 @@ static inline void xe_configfs_check_device(struct pci_dev *pdev) { }
>  static inline bool xe_configfs_get_survivability_mode(struct pci_dev *pdev) { return false; }
>  static inline u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev) { return U64_MAX; }
>  static inline bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev) { return false; }
> +static inline u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev, enum xe_engine_class,
> +						      const u32 **cs) { return 0; }
>  #endif
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 6d52e0eb97f54..f337954066f55 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -16,6 +16,7 @@
>  #include "regs/xe_lrc_layout.h"
>  #include "xe_bb.h"
>  #include "xe_bo.h"
> +#include "xe_configfs.h"
>  #include "xe_device.h"
>  #include "xe_drm_client.h"
>  #include "xe_exec_queue_types.h"
> @@ -1102,6 +1103,29 @@ static ssize_t setup_timestamp_wa(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>  	return cmd - batch;
>  }
>  
> +static ssize_t setup_configfs_post_ctx_restore_bb(struct xe_lrc *lrc,
> +						  struct xe_hw_engine *hwe,
> +						  u32 *batch, size_t max_len)
> +{
> +	struct xe_device *xe = gt_to_xe(lrc->gt);
> +	const u32 *user_batch;
> +	u32 *cmd = batch;
> +	u32 count;
> +
> +	count = xe_configfs_get_ctx_restore_post_bb(to_pci_dev(xe->drm.dev),
> +						    hwe->class, &user_batch);
> +	if (!count)
> +		return 0;
> +
> +	if (count > max_len)
> +		return -ENOSPC;
> +
> +	memcpy(cmd, user_batch, count * sizeof(u32));

shouldn't we use copy_from_user here?

> +	cmd += count;
> +
> +	return cmd - batch;
> +}
> +
>  static ssize_t setup_invalidate_state_cache_wa(struct xe_lrc *lrc,
>  					       struct xe_hw_engine *hwe,
>  					       u32 *batch, size_t max_len)
> @@ -1203,6 +1227,7 @@ int xe_lrc_setup_wa_bb_with_scratch(struct xe_lrc *lrc, struct xe_hw_engine *hwe
>  		{ .setup = setup_timestamp_wa },
>  		{ .setup = setup_invalidate_state_cache_wa },
>  		{ .setup = setup_utilization_wa },
> +		{ .setup = setup_configfs_post_ctx_restore_bb },
>  	};
>  	struct bo_setup_state state = {
>  		.lrc = lrc,
> 
> -- 
> 2.50.1
> 
