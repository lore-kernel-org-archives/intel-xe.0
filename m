Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 718E2C83F26
	for <intel-xe@archiver.kernel.org>; Thu, 24 Jul 2025 16:43:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39F1410E12A;
	Thu, 24 Jul 2025 16:43:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CdGCKyp7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45C0110E12A
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Jul 2025 16:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753375435; x=1784911435;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=lkwJ0eFFEFdbX8Tv2YeX+KF8CEBza5N7AmWb9mhsfZQ=;
 b=CdGCKyp7VJsQ9lv5M36OVbZB5r15p2+V4/NucfznzqPgPhfkC2Vvfnxh
 9GTqXThY06D9YYyoCN8JYWbXWTIV6mpDFaa9tvbHjQsl9oo9kLGN5BfPp
 kFFJ2SKlEu63Bxtaow48XMUSRZQ5rnXH3XNHzhrgzHeMhPm8P+S2klR98
 CEZykPx4z8ZbGNJ61r607G2nK8kwWaQzC6//DzxZuRL1AZCVkwwPCshXv
 XxQV53kL7Q/JAz7s1PumFbCXvyg2Odq9lZ3FAP8pg5PJ5pF05gyNgvUZB
 jiQa5MxzdQwX1cFP4TLkCo+OKiKrO0/VPXLDnYBY3kYKLpLVRrZva3b+3 Q==;
X-CSE-ConnectionGUID: ioAgvWdDSg6XRIv6uUeWHw==
X-CSE-MsgGUID: pi6KIWB5TFSbdOQA6jqHrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="55577326"
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; d="scan'208";a="55577326"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 09:43:54 -0700
X-CSE-ConnectionGUID: fhFdoPJCR0+BuixvDK2Pvw==
X-CSE-MsgGUID: E89XQvFtQaaD1UWpHk9quA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; d="scan'208";a="164609747"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 09:43:53 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 24 Jul 2025 09:43:52 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Thu, 24 Jul 2025 09:43:52 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.83)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 24 Jul 2025 09:43:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WsOEs9PXhJuChTNImhCAWp7zU9TIA9sGREA6Ja9M33ubvzxhDnY9cCGTyPUQnrrU4NwEMmrEQN5NvmSKT9/pQZsXt/H8nPwe94aw0XHUjdxYi++i393bP+uzZDt1AU344FHodc4z4lOlpTVYSmIKizRswRZfMPtbKqnZPfV+OmI4r7ybn4iP2QjM5JMFeQdlNCoEnhb57P0Ev32fPGl9BVq6vjCK0wGs7y13WgVjJhzzVbUSPyI8Yys3kpN9AVN9Kj0nbp1mI/KgPm85CN38ajTI+jSvLYAPOZ59yykaoA3rkgSmfdHgJ8YOebWarXX0iy6lSCpRdoQCSxKE6jRP7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VnlEoW8Wb+bH3P6TjETwZgHUWBSRfXFjklNFae2ZChQ=;
 b=PWMUcRJcXGKqhqnVg6hsv1l5DXoqy//BwRozpdzUcZMCRxfvNfOB9kBknZIwh6cbX5da3iibO9G6R5iMi4vOPo09tCZJl21IMeIgT+T60dfEG/xa+uYPRCT0eDEZan6pWpSOvqgnx72PD1DSotlblnYFt0BqRvMhTpIzkQIE6cv4dVi/tYtHV3XOg4TCv65Hnaqt+83XDV7wc4K0aidMpP7n4ak4RYiWeoEqVdpfbScMy5S5+VOftC5Gpa3ax6SotskPmXWJqWmKoPjg42nRE0YfOFlj5tAlS3ZGXf65u3N+6Sh6G01/psHTDVzwMUpHsUpFySY5lfiycS5Zk2eW2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB6721.namprd11.prod.outlook.com (2603:10b6:510:1ad::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.28; Thu, 24 Jul
 2025 16:43:47 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8964.021; Thu, 24 Jul 2025
 16:43:47 +0000
Date: Thu, 24 Jul 2025 13:43:42 -0300
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Dong, Zhanjun" <zhanjun.dong@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v1] drm/xe/uc: Add xe_uc_stop on hardware initialization
 error handling
Message-ID: <3msztcp5dz6gloyivoxhi2du5ptbjammov2jfvqvwtnztsmtfv@5nuqwem5uy6b>
References: <20250724152500.110367-1-zhanjun.dong@intel.com>
 <a5a973f0-b7fb-44e6-a745-f62c203fa27f@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <a5a973f0-b7fb-44e6-a745-f62c203fa27f@intel.com>
X-ClientProxiedBy: SJ0PR13CA0067.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::12) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB6721:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ea0b497-2c0a-4e02-8511-08ddcad142b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8llDCssr8QGvWnw3E1xG/n69jFVjy8CdjxAP6hcwFGPOUPTg/CbKTg23OdSD?=
 =?us-ascii?Q?rX5LfO8qdlswtDBS11aZIFKz3hze4mc53704QWiOtZsJu+qT59aDyJlJJO6O?=
 =?us-ascii?Q?fRuD3t6HAMO6BleNULARvaDPtCKTNs2bXEgO3Oyvza9fWA711AO8PXu4NCVF?=
 =?us-ascii?Q?fadty8oMTsInOgNB1AF8KWj1V56SdD/veaN3qEDZyVYKhpWsOIR5dQzi2J/0?=
 =?us-ascii?Q?F5g7qCrl4bZ59UhVOu6pLt5cdWKSUDXbh76xY9TCerFrIZzkzfYKFZwd3go3?=
 =?us-ascii?Q?YNTLP8VH7nTnPv6os40UIwv4F3ZeJU5tpGTxd10vnsQWg21i2aoeZLWDZM52?=
 =?us-ascii?Q?99Z0uM+u4iehx/QkLQxv2K9jz5wNdtc3EdgI8KUR9xaScZLy40hEBQ7h93FQ?=
 =?us-ascii?Q?bnHTPCatIuLjA+vmfe7QAC6cMl9W64GvvKiRDKcmUh+mjtH0y+pk+QDbZMZM?=
 =?us-ascii?Q?q04aQDRFZnmKbi7Dfiosfq6BaxtsqUwk/ZBT8h39IN+0vBmX8vNHaRqgmJEI?=
 =?us-ascii?Q?CL1vEaByaRh1sklWmk79uKAy75Isk87MQ5divJ1ugaTT3S+slT9On29PWUDz?=
 =?us-ascii?Q?P8W2PIASaKZuS60TwG8TlHcF33BAxe4gr6A92aPLky3FmSHzbcz53hIGxKLD?=
 =?us-ascii?Q?b/BzNtkhlWckPScIuoo22a7mbbRUN8O399jkqlCfj3ihqSQLIVcGGx3BAWNp?=
 =?us-ascii?Q?oAkEhvoQIz+IWootK/yy+3G7vT/e2iSBnm5nmhYiW6LHp9vrE5nYVOmVK9yR?=
 =?us-ascii?Q?6gdCv/mCHrPR0FjhiPtSxKYS1b0QBf5F/arrlQynGzUIAv83cCxMvUni6mKg?=
 =?us-ascii?Q?yVkjbu5HozgIRRq5yNox2e70m/NuTJt6eHLw7qooAUzntvuyTQxcWugN1/O1?=
 =?us-ascii?Q?ly2VuHhwrPThSvXjYlEmxSDcR8hZwtWTJKj1Qnf/pyoZJifNdg7EVK1Ml/ST?=
 =?us-ascii?Q?EqxVagadfyPewtnLW/as1NftLEU6sJ1d8JuIwQ78ISfqRJJyGW0e3eafnNJ0?=
 =?us-ascii?Q?gWggZWJtExjqaaGVIWC47K8N2JMAa+G1P6uYMyg5VBjSz+485uI1NIpazrnl?=
 =?us-ascii?Q?DbdwofpY+C0KhhUZl8KvZX9yic/iFZ9DuHPR1Dut4uBnrflETTgXzy3lx5b8?=
 =?us-ascii?Q?KIErcgWOc3/iQMSy+XVcvsFttsJqr1xUtKoAlKJN0fnEiTZmM2Fw6QbIvut1?=
 =?us-ascii?Q?7PnDB8wO7iMTxgaOG1sEYWTjT4DQGIAtEpW/Yt8wICMP1RBV+UZi+xjbly1y?=
 =?us-ascii?Q?2SLAuUN9yL2dSZaMaxGp+0LfIY3tRYsocXy2AIHXWMD/OiquRLa8ed4LhAgT?=
 =?us-ascii?Q?8TRYaGIVdVA0eIxQRpfl8mf3KAYz28U0GWFGAUgmqHma2cM7JL+Ky5nRh2iK?=
 =?us-ascii?Q?h3o4bGY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hr1GDf75qmBB6cEJ+gM7eQwqt9gScTyZaKKzk4dK/zSLLfy13ioqjodxOlIK?=
 =?us-ascii?Q?n8EAcpkViJPJwIZGypTGcmfETJoy2GpTdkQxcC+hRyrJ9WUoFVuDfvc0Atcw?=
 =?us-ascii?Q?uHw/YNT/OJB3FynrflUUaviUZAY0uC4BCm2ZcqbTy8CUuOfM3vWmQTwKgku9?=
 =?us-ascii?Q?IChu7fYadq0wDWm+p+1ig1k0x1cKQSz52SxqbJRbWSvBnGh21Ve6P6v/9eiT?=
 =?us-ascii?Q?ciD1Wpf7iM1tMRXQrDuZXkh8U9ZUaohrUiMoUmZwLSFVkfuwXTxDIla1h8xb?=
 =?us-ascii?Q?URpx6mXn1s+CB6w5o7fC1nE5lH8BBkqJOpuE663Bt6rLiy9P/wBP5t6SFKJ3?=
 =?us-ascii?Q?58h2DoTJnJV5QZ/OtTF/70qpO6o/D6vKkwN/JTOin5IoW1CTiZdWo2ASgel4?=
 =?us-ascii?Q?4fR87bxkEdoKEBawjP3dlWLWS5lhpG28C+RjH2iKEeWDACrIhkDBGjBbVDdu?=
 =?us-ascii?Q?ob3o3jDsCPXU2bzDRFnm6cqZp4tG00F5KxU3mD2qpPoS9rAOS4SrAbCK/FJt?=
 =?us-ascii?Q?bdOQ9ZGlSfn9fwH0LBpc2XXyMMYdLxrcZDGZCEsZZsf4VnKrSaENQMR6Y7mE?=
 =?us-ascii?Q?oTJFmYGH3AtTU+9+qWVJV983ndSoghjRBo/5WzNWYhgXx1Hh6+lozgdbFFk2?=
 =?us-ascii?Q?3m8QBlxC9FoMrOz7sjXaLn9wqB5xYUUO4r1c7yZhxLkD0xSG8zSLlhFHTI4D?=
 =?us-ascii?Q?PPONovLDxlQorGhhpO/ys5shKzFe97eYb2CucgWCzwydBTL04aXmJDDLsGNG?=
 =?us-ascii?Q?Onv6boa2FWfekTL8xoZISVamNty1qS6f2UnIt89dQiTNXk10Q2xgCnuzeQq0?=
 =?us-ascii?Q?s1/KtsG3Fgpnu6Qoi48iBM0p8eCFTRApSuyrwistl0eaxLQ7ckWUsmOlNtJo?=
 =?us-ascii?Q?kddtvdQbfMkP/Bv9T1hDspv7EPaBouD37FlJxBvKOlKeHOYhi2ae+Zjubeto?=
 =?us-ascii?Q?rCbT1KV2rRWThiqHBbA8gy1OdF+VY/Y5tC1ljU1l/N6rBEAUy/yft/f8zhwb?=
 =?us-ascii?Q?gkMwCu9rdyZRVGa/IYE+1hO3iOb7Lez3mON9b76o+33KmT8NDKuqwsdh08Ek?=
 =?us-ascii?Q?LtzaSi3U+PB/2woCSu7K4gNC5IXWRjQ7es+EFffOeEr1h0q0+JZAWezx7+o6?=
 =?us-ascii?Q?hp6l3iHGtJ6bw/ikJXPAR7j6MzGWdmCYTXaUCWrIm7Hd6VXBcCGQZRKADXVt?=
 =?us-ascii?Q?J5VofqXh+kwlBAKPFKeJrkwUuJhxZrQTXbAwmLW7MKarYFOfWsP2PhjGddOb?=
 =?us-ascii?Q?Kdn5Zzm9J6oXcC44DcfdTBvbviMaexKIahHIUWOHV4ScyhxgGeAVyp3XgHys?=
 =?us-ascii?Q?eTCCSJfiyynDE1x6Ff6tThOKPIL8afuVbnZIDG4Pn+wBDdDRpB5Sil9fHdVQ?=
 =?us-ascii?Q?iZQVpRCzMIXunjU6rGCiUkX9JWesVSG/BJtZUb6BuzIcXC4ANQPcZd4vg6ks?=
 =?us-ascii?Q?PjActJlizSQ6XZcgsdwddmN3jVMxByb4FCbkLkT01YoEil7ooN7BTzFFEGK9?=
 =?us-ascii?Q?8P11Wy8zcxuNKUJ+XM1hmKaSmi1HYXNDMPA6LH+U9j4yn2fB8e77nqJpR2dP?=
 =?us-ascii?Q?AobrHtG48OlExzereqSF6qB9bEt66XEFJiJ1MEfbKeGEf18oSxHC9IGmfCEG?=
 =?us-ascii?Q?Cg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ea0b497-2c0a-4e02-8511-08ddcad142b9
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2025 16:43:47.6340 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SWuDEjnj69hhBHF8sWN9NPFN82BGEK92Zf9tCy/9KjJ0sSUsC1WTPlyEvkWOBhbrRhbvtDnRKQVd4YUCqZHGxJVofHkKHU06LvSB9kQQ+1o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6721
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

On Thu, Jul 24, 2025 at 12:09:38PM -0400, Dong, Zhanjun wrote:
>Please stop review this patch, issue found and new rev is in progress.

ok, just on the commit message below...

>
>Regards,
>Zhanjun Dong
>
>On 2025-07-24 11:25 a.m., Zhanjun Dong wrote:
>>During hardware initialization, GuC communication is expected, which
>>will increase the outstanding counter. Non-zero counter will cause
>>assertion failed during shutdown process.
>>Add xe_uc_stop call to clear the counter.
>>
>>Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5466
>>Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5530
>>

Please drop this newline. "Closes:" should be part of the git trailer.

Lucas De Marchi

>>Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>>---
>>  drivers/gpu/drm/xe/xe_uc.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>>diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
>>index 465bda355443..6c72ce305d6c 100644
>>--- a/drivers/gpu/drm/xe/xe_uc.c
>>+++ b/drivers/gpu/drm/xe/xe_uc.c
>>@@ -173,6 +173,7 @@ static int vf_uc_load_hw(struct xe_uc *uc)
>>  	return 0;
>>  err_out:
>>+	xe_uc_stop(uc);
>>  	xe_guc_sanitize(&uc->guc);
>>  	return err;
>>  }
>>@@ -228,6 +229,7 @@ int xe_uc_load_hw(struct xe_uc *uc)
>>  	return 0;
>>  err_out:
>>+	xe_uc_stop(uc);
>>  	xe_guc_sanitize(&uc->guc);
>>  	return ret;
>>  }
>
