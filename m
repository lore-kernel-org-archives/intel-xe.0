Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 995B9C3DA7F
	for <intel-xe@archiver.kernel.org>; Wed,  7 Aug 2024 16:58:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 595AD89755;
	Wed,  7 Aug 2024 16:58:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LpqFsil9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 970CF89755
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Aug 2024 16:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723049920; x=1754585920;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=K8/xMNpMV4/ZRCJHxH4KYM9mXFL61LoIMiCIUXTQtEE=;
 b=LpqFsil9+muujzRUiG7U6IhqvE2szPn1DXis1AwFsjOTa+DmgcrykJoK
 ZvyT9e7qGN8WgLTBZ6mgAoeDAzJzFyNOXrEtp2jA36ODF3t04aOcJhFG8
 su5II7PNhrB8EAM9S7qbFEFkKpdytJPGhuWB0j3QbJJHb5KRt0AS9tCiR
 Gyhj6wJ4kk+1aaDEJYylmg6RRr09Es//34HziHQM8/GHwzQ2BDhS7WBq2
 rhW2qnVnJFNm/qrltBtEG4BUzW1vtdRSWfItwDqu0CiirTEkQx5M7TXo4
 l0XIO3X9U3+d6s1BtHR6MbTNt8jdpMra0ccR8Pl8X1gaZ6haPWDL4rHoC g==;
X-CSE-ConnectionGUID: YXcQA4SBQAKPTAoYSrKTUQ==
X-CSE-MsgGUID: D9magYbPT2Gsidx+txnpxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="21281636"
X-IronPort-AV: E=Sophos;i="6.09,270,1716274800"; d="scan'208";a="21281636"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2024 09:58:40 -0700
X-CSE-ConnectionGUID: f4e7PS3cS52ARAqdLZZJBg==
X-CSE-MsgGUID: 2mh6E70MSkiGomZp9vaDdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,270,1716274800"; d="scan'208";a="61748783"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Aug 2024 09:58:39 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 7 Aug 2024 09:58:38 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 7 Aug 2024 09:58:38 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.42) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 7 Aug 2024 09:58:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FXrErdcJmKpyNJXEFoBuCwd15jsZuZ8iRCi4Xb9ex36UAGVf6zVO1a8EUThtBOayAWCkj6TWRBOun56k0nCqodNrWE5ux0ktIJJk/hjLzteGLxpbF070u+zBB4dlhb8vXrhTQtltb6PIQUgzbCcIZJUHmw4iedGI7TqDMkLIlw9R6+/UFvz3diu2hEBh4xNOHc2eOoOR2fG2K11dHjDgmZWv8ZZbjrU1XF41iB1LhduYJCXuKLjMhokiz01r4h/dmwx8ml6F+UIP7gjzMs9iHaGsuoP8cQSddZrKWzoFqxn1erV1Uk67iUwRor8MIoAIFMUS7dpqq8kbIlXuV3zgZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EKoJK3XlkhyCor8PsMwgl/e27bFu7eBlxxNsefV9K+I=;
 b=eoKmfkOmDCUcGBG+x+C7HGq6lXu7hBhDm1GZYfAHSK1kTOdcg1N8x4yguX53mq1NGkYv/LhGbrCHqHU0LSUHlTo0ajCw1K6p784KFQzbT40kLy5D9eEMqq/TMYAgiiNIu5V2k7zuTz/pJIAwh68aNEPfdxKcMxRfGszzIvNjC/Z/NUg5Y+At98zGyZdggYorg73K3yc5gm8SzAQqQvdD9hhlavz9gwRWXxaCrwqfZVS8sJJxD1FHgKdGmkdn8B7OCUbBkfyqEVrWXArscteMsW9F7te3TJxIpYQ4NW3XHbxTl1K6PXAdz2mDXRIZzhloqd1E0+jQWJTnNNNb/rY6Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SN7PR11MB7115.namprd11.prod.outlook.com (2603:10b6:806:29a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22; Wed, 7 Aug
 2024 16:58:34 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7828.023; Wed, 7 Aug 2024
 16:58:34 +0000
Date: Wed, 7 Aug 2024 16:57:17 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: Nirmoy Das <nirmoy.das@intel.com>, <intel-xe@lists.freedesktop.org>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>, Sai Gowtham Ch
 <sai.gowtham.ch@intel.com>
Subject: Re: [PATCH v2 1/2] drm/xe/gt: Add APIs for printing stats over debugfs
Message-ID: <ZrOnbbp8LQn1ueiF@DUT025-TGLU.fm.intel.com>
References: <20240807110802.13385-1-nirmoy.das@intel.com>
 <gos5am5tdkhozpwidgopru33w33hgt5dd4wqcn4xkjkllkl6im@bkldffzsasvv>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <gos5am5tdkhozpwidgopru33w33hgt5dd4wqcn4xkjkllkl6im@bkldffzsasvv>
X-ClientProxiedBy: SJ0PR03CA0066.namprd03.prod.outlook.com
 (2603:10b6:a03:331::11) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SN7PR11MB7115:EE_
X-MS-Office365-Filtering-Correlation-Id: f42b943c-27f6-46d5-a9a3-08dcb7022c91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?RxAJFIUFWTHho1l7gZFz8X6z7eNOzCg2tSBF/iJec7amp9OJZZVYghOLVt?=
 =?iso-8859-1?Q?qJ/jzCX5/9h6xlD1MUkXDNqCGp0Ekmlx2YbRMuZJ0UNhxKzxLDlhRtpuLD?=
 =?iso-8859-1?Q?9ENrgVX0iGPmycNcx4JblL4N/GQaBPFGZoIqLH4mQtxU5tjgVt+NCHFD7v?=
 =?iso-8859-1?Q?JEHvpi5jaf6HgESQ78kvEHX6WtFkvKDWTnjv1zBXWvvl0fgMai9fEhCL1H?=
 =?iso-8859-1?Q?Jm8xV15pkppRFFPClMmuK3VdFYi/pGiYSnzEyncsglHa2Rnf/65W4an0qO?=
 =?iso-8859-1?Q?qsS2i+C/Ag2Z89/lKNvodftsog2Bvsn7BHFUNQ9H+RFPhKBQZdMwBj6e0c?=
 =?iso-8859-1?Q?adabAI/ihuzefwuZf5hbVb2fjYfy8pjb+uslBEh+y2QaJXdZpSSoJATGYA?=
 =?iso-8859-1?Q?co3iW47n3V5O2DJlTpTmoSULqD+6S0ytIqVeVlvKo3l2liTutIdCv2lhmg?=
 =?iso-8859-1?Q?0fFR3zDjQQBvQ9kEjZq9su9jcsCT3sUspu/0GwU6TETMUnE+7lXsz8FcNJ?=
 =?iso-8859-1?Q?B68Lp2vHrLUawzqrVO5I2j98rhnokL52eUi3eg0CfLxXlGOHq8XHuaBbU3?=
 =?iso-8859-1?Q?T7w/Be8QmNIRMkTK1bNqCOfAyAcTSTl98Ivw34KVknVEJKBCc+PxUjrUPb?=
 =?iso-8859-1?Q?sB21SvdnghrbVCyzd6aiAu7OIQqmeA8jh4UT6yVcmZFYdc2iYXEzhXODZo?=
 =?iso-8859-1?Q?8/6KjOQxBVD3elpwJqZXDORJHXLEPyQtU+DesBuR0BCwrUvZ4DlhaYbk4+?=
 =?iso-8859-1?Q?7U4v6+3r6P1y/kbMAlw/Mnwhme2YdcHBpP+pyS2WuPQR1vSkBc88yArbun?=
 =?iso-8859-1?Q?JmMcmDdCSXyhKOw8O+OBNGifOrDHGEqH3Q1UMtE1YsxTYbqbuG3LcAcS/b?=
 =?iso-8859-1?Q?mMmFX2e/VacwWroTi9uKju65DAZ+1jtI/jE3x7NEE8sc/39Jc43P84/RLL?=
 =?iso-8859-1?Q?5PrneqWdbpH0c0hIz850Yfu3vbXKHYWe5EgdxECTurTOq/vawpo4inSE0I?=
 =?iso-8859-1?Q?XNfXzi3QUIvWJaUtFWIOt7RZKl255WPGkKsIUpIjbB+TEJaMXk9tEnOtVk?=
 =?iso-8859-1?Q?bErMDFfjA4uvQRqKY5YZGqTXwb9PJfcjebYVLVuggw1X5kc+Dx4GeZAoe6?=
 =?iso-8859-1?Q?9ay/1PAm3xTclv1EHDBnUfxoAW/VuRnbUUpxEsIuwbs1cLwEI8HBXkXeyE?=
 =?iso-8859-1?Q?TI7835m38kBGC1m6f3NHxvCSrTG/9xbQwm+VjCCnlYVm7dtY7gRkEiiAg2?=
 =?iso-8859-1?Q?KSCpLVQ8tDLRWtz4Xc4SGzkKoKIPYjWpMra8nP13OwCeytxOGSfDvtUCNF?=
 =?iso-8859-1?Q?G7I4qFxSRcp1sMoTbrR6WiPU3iu41NQe07IzGJjp3ccJwTFUdcv7WiG85H?=
 =?iso-8859-1?Q?waCYRp2D9rNaI+ehFxd/9WYtgb9H72DQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?KyVQUMFhmHqKekDKtWKVxSYDA8zIpOniuABOBQC27j64vMlwkVzAjwTopX?=
 =?iso-8859-1?Q?3UKTmFvqFEPly0mgXbwPplm1/vRhnykSIYldK7T4j3/7YjBldqT9jTY3Kp?=
 =?iso-8859-1?Q?vhXqkISA9KFu9mxiXcLf+9/UkDGHiuzPZuun4oc1dYnQ68HINwriN3WbAJ?=
 =?iso-8859-1?Q?9IZjLvR8KC33Z+1xZq+aGDeeas4wEqwZ+g1bTXVEemSnjx3gfzC7+U91JO?=
 =?iso-8859-1?Q?N7i15o2JIOlOWoj/HefcGVUlRBW2Dpa/Luma1RXHBkFB2ZCslG01wNX80s?=
 =?iso-8859-1?Q?2KAV1gAOuZxf6+geHhgKt0nKA40ZtI1wxqQgdMg7Do/j6yRUqwvRs0jT5R?=
 =?iso-8859-1?Q?UTH4hNQOYHi4VQ2Lefk7FZo5bjGtR0gyRbPMcCEiZ1QfpPxm6Od5/blV5o?=
 =?iso-8859-1?Q?6HKVXyAArYyRhoSprOSiksX2qfFMA1w4pXyJjiQwF2C5y1MfWaQHS/Lvv+?=
 =?iso-8859-1?Q?vLB/5v3x4vFkcrTZoloaz6iomZDQCfdpnhSP1SVKDzgrEBU6JyNtgIVwTp?=
 =?iso-8859-1?Q?7d4LqSeewgn4FH8vrmCA2qyOULNcUd0EBldFbh3WQZCY0gjGkPi1MnlEAe?=
 =?iso-8859-1?Q?PZvbYfcwERn8hdjiw/9g3qf2qpTfsqir2L06iWSBIekY4fmPkXKEdsyiHY?=
 =?iso-8859-1?Q?HxS8VVxerJ2GInJXydFsGPhY3krGSmSF0qMIrfaY47sdRXlpkUYfFid/VT?=
 =?iso-8859-1?Q?RZeYXtgwlU2ryLxoDzC+Oei4b79JBHTHwzaK07geD33yl9JufSHML+rdI0?=
 =?iso-8859-1?Q?nbD7N6ef9rQUaMnt09+YY3Tz3bYPCQZVifRsUGrtEsPCgNGws1a0Pp6WJn?=
 =?iso-8859-1?Q?46zAsmAGuDFj5mGG/9HFMRynwA5mPij9srztnktKVzM5Y318QyEVlIwEc1?=
 =?iso-8859-1?Q?pLKLoyZQcNjSPhZvjbiYSS+Ijl62I1bB7EgdlnelhZ57wAXTbiL88J+4mW?=
 =?iso-8859-1?Q?Pi2GuH3RBiJOYKk7QwiMytYaRN+G1HE7gw4J1c8SQ4w16u2jLNRchbg7+N?=
 =?iso-8859-1?Q?8tHvS84lfht7LD2/Hi5HYbAmQsYBX3FxnxQyTQIME3YHjdzRD/qmWecIRj?=
 =?iso-8859-1?Q?doHzaDqJfFIp36nILvRHKnOPVoBpuMThsvq4kMo5iazhyJ1mca+MkBpjPI?=
 =?iso-8859-1?Q?YUV9RoMY/roz2r8pT3PaoSlOPWvtewN3fBmfSt3GXI6CX/a+IxQ3t0o+Yq?=
 =?iso-8859-1?Q?rC7AzYfNyRYhpw6LPNEy/A4WH74CEGxGLUs/52QdkE/5VQbjGPc22G0Tin?=
 =?iso-8859-1?Q?v6Z84Z9eCEAuVGwifJ+Ha6uVJWYf+1n3PW6SHU6CNLP8ks6KUBHwPK8a5p?=
 =?iso-8859-1?Q?6CBX6qEnC8SNaq3zR5V+F3LvvaBVLGpk+3x//9VudwgSKqqsuIz5UO4BJB?=
 =?iso-8859-1?Q?OuVL2i2v7jCsfTd0SQX19FaclXd+2c6+goauM+i0uwiPXYgvJ7PVc012Dg?=
 =?iso-8859-1?Q?kEzT/V5Fpg+xH6yxHc0niuIX72pGzNueXXH2VOK6sWw8sdII0XJ2dHl5ml?=
 =?iso-8859-1?Q?LeApU0vVlbBsWFAgTo0+c8tt1+K8v2OFpKJz2Mt+O+SANK+hScEdoia+1T?=
 =?iso-8859-1?Q?5hkdby6YOJFO6BNaGLgSfiMJOHch3qwg2z0XmjtOiccgtuIyrjKLWu4ab9?=
 =?iso-8859-1?Q?ZCgz11jeyCLRP4k22XECHZZ2qYMq1UE22lUkKf66yDjupUku6d+hcMDg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f42b943c-27f6-46d5-a9a3-08dcb7022c91
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2024 16:58:34.6648 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q0MhWne4sCpbl1r2VAYfADj1xHha4Kp6fWyVe7aINUWwoM4VdDbjPgEfk4BckGfPyAdOhz3YLakigyuwpiaCCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7115
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

On Wed, Aug 07, 2024 at 08:59:34AM -0500, Lucas De Marchi wrote:
> On Wed, Aug 07, 2024 at 01:07:58PM GMT, Nirmoy Das wrote:
> > Add skeleton APIs for recording and printing various stats over
> > debugfs. This currently only added counter types stats which is backed
> > by atomic_t and wrapped with CONFIG_DRM_XE_STATS so this can be disabled
> > on production system.
> > 
> > v2: add missing docs
> >    Add boundary checks for stats id and other improvements (Michal)
> >    Fix build when CONFIG_DRM_XE_STATS is disabled(Matt)
> 
> I don't understand why we are even adding a config here.
> This should just be compiled out if build is without debugfs.
> 

I don't know enough about how compilers work these days but would the
atomic increment compile out without debugfs. If the answer is yes, then
agree we can drop this Kconfig.

Also does debugfs havea Kconfig, did a quick search and not seeing one.

Matt

> 
> > 
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > Cc: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> > Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> > ---
> > drivers/gpu/drm/xe/Kconfig.debug   | 11 +++++++
> > drivers/gpu/drm/xe/Makefile        |  2 ++
> > drivers/gpu/drm/xe/xe_gt_debugfs.c |  4 +++
> > drivers/gpu/drm/xe/xe_gt_stats.c   | 51 ++++++++++++++++++++++++++++++
> > drivers/gpu/drm/xe/xe_gt_stats.h   | 32 +++++++++++++++++++
> > drivers/gpu/drm/xe/xe_gt_types.h   |  9 ++++++
> > 6 files changed, 109 insertions(+)
> > create mode 100644 drivers/gpu/drm/xe/xe_gt_stats.c
> > create mode 100644 drivers/gpu/drm/xe/xe_gt_stats.h
> > 
> > diff --git a/drivers/gpu/drm/xe/Kconfig.debug b/drivers/gpu/drm/xe/Kconfig.debug
> > index bc177368af6c..4db6d707c1af 100644
> > --- a/drivers/gpu/drm/xe/Kconfig.debug
> > +++ b/drivers/gpu/drm/xe/Kconfig.debug
> > @@ -94,3 +94,14 @@ config DRM_XE_USERPTR_INVAL_INJECT
> > 
> > 	 Recomended for driver developers only.
> > 	 If in doubt, say "N".
> > +
> > +config DRM_XE_STATS
> > +	bool "Enable XE statistics"
> > +	default n
> > +	help
> > +	  Choose this option to enable support for collecting and
> > +	  displaying XE statistics as debugfs.
> > +
> > +	  Recommended for driver developers only.
> > +
> > +	  If in doubt, say "N".
> > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> > index 1ff9602a52f6..b0bbb248f644 100644
> > --- a/drivers/gpu/drm/xe/Makefile
> > +++ b/drivers/gpu/drm/xe/Makefile
> > @@ -143,6 +143,8 @@ xe-$(CONFIG_PCI_IOV) += \
> > 	xe_pci_sriov.o \
> > 	xe_sriov_pf.o
> > 
> > +xe-$(CONFIG_DRM_XE_STATS) += xe_gt_stats.o
> > +
> > # include helpers for tests even when XE is built-in
> > ifdef CONFIG_DRM_XE_KUNIT_TEST
> > xe-y += tests/xe_kunit_helpers.o
> > diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > index 5e7fd937917a..3765c04919dc 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > @@ -17,6 +17,7 @@
> > #include "xe_gt_mcr.h"
> > #include "xe_gt_sriov_pf_debugfs.h"
> > #include "xe_gt_sriov_vf_debugfs.h"
> > +#include "xe_gt_stats.h"
> > #include "xe_gt_topology.h"
> > #include "xe_hw_engine.h"
> > #include "xe_lrc.h"
> > @@ -286,6 +287,9 @@ static const struct drm_info_list debugfs_list[] = {
> > 	{"default_lrc_bcs", .show = xe_gt_debugfs_simple_show, .data = bcs_default_lrc},
> > 	{"default_lrc_vcs", .show = xe_gt_debugfs_simple_show, .data = vcs_default_lrc},
> > 	{"default_lrc_vecs", .show = xe_gt_debugfs_simple_show, .data = vecs_default_lrc},
> > +#if IS_ENABLED(CONFIG_DRM_XE_STATS)
> > +	{"stats", .show = xe_gt_debugfs_simple_show, .data = xe_gt_stats_print_info},
> > +#endif
> > };
> > 
> > void xe_gt_debugfs_register(struct xe_gt *gt)
> > diff --git a/drivers/gpu/drm/xe/xe_gt_stats.c b/drivers/gpu/drm/xe/xe_gt_stats.c
> > new file mode 100644
> > index 000000000000..b13aee5488d5
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_gt_stats.c
> > @@ -0,0 +1,51 @@
> > +// SPDX-License-Identifier: MIT
> > +/*
> > + * Copyright © 2024 Intel Corporation
> > + */
> > +
> > +#include <linux/atomic.h>
> > +
> > +#include <drm/drm_print.h>
> > +
> > +#include "xe_gt.h"
> > +#include "xe_gt_stats.h"
> > +
> > +#ifdef CONFIG_DRM_XE_STATS
> > +
> > +/**
> > + * xe_gt_stats_incr - Increments the specified stats counter
> > + * @gt: graphics tile
> > + * @id: xe_gt_stats_id type id that needs to be incremented
> > + * @incr: value to be incremented with
> > + *
> > + * Increments the specified stats counter if that is within expected range.
> > + */
> > +void xe_gt_stats_incr(struct xe_gt *gt, enum xe_gt_stats_id id, int incr)
> > +{
> > +	if (id >= __XE_GT_STATS_NUM_IDS)
> > +		return;
> > +
> > +	atomic_add(incr, &gt->stats.counters[id]);
> > +}
> > +
> > +static const char *const stat_description[__XE_GT_STATS_NUM_IDS] = {
> > +};
> > +
> > +/**
> > + * xe_gt_stats_print_info - Print the GT stats
> > + * @gt: graphics tile
> > + * @p: drm_printer where it will be printed out.
> > + *
> > + * This prints out all the available GT stats.
> > + */
> > +int xe_gt_stats_print_info(struct xe_gt *gt, struct drm_printer *p)
> > +{
> > +	enum xe_gt_stats_id id;
> > +
> > +	for (id = 0; id < __XE_GT_STATS_NUM_IDS; ++id)
> > +		drm_printf(p, "%s: %d\n", stat_description[id],
> > +			   atomic_read(&gt->stats.counters[id]));
> > +
> > +	return 0;
> > +}
> > +#endif
> > diff --git a/drivers/gpu/drm/xe/xe_gt_stats.h b/drivers/gpu/drm/xe/xe_gt_stats.h
> > new file mode 100644
> > index 000000000000..04a1d61ce1fb
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_gt_stats.h
> > @@ -0,0 +1,32 @@
> > +/* SPDX-License-Identifier: MIT */
> > +/*
> > + * Copyright © 2024 Intel Corporation
> > + */
> > +
> > +#ifndef _XE_GT_STATS_H_
> > +#define _XE_GT_STATS_H_
> > +
> > +struct xe_gt;
> > +struct drm_printer;
> > +
> > +enum xe_gt_stats_id {
> > +	/* must be the last entry */
> > +	__XE_GT_STATS_NUM_IDS,
> > +};
> > +
> > +#ifdef CONFIG_DRM_XE_STATS
> > +int xe_gt_stats_print_info(struct xe_gt *gt, struct drm_printer *p);
> > +void xe_gt_stats_incr(struct xe_gt *gt, enum xe_gt_stats_id id, int incr);
> > +#else
> > +static inline int xe_gt_stats_print_info(struct xe_gt *gt, struct drm_printer *p)
> > +{
> > +	return 0;
> > +}
> > +
> > +static inline void xe_gt_stats_incr(struct xe_gt *gt, enum xe_gt_stats_id id,
> > +				    int incr)
> > +{
> > +}
> 
> Is there a reason not to force id to always be a compile-time constant?
> The only use case added in patch 2 pass it as a constant.
> This way the id is checked at build time, the penalty with debugfs is
> just an atomic_add() and the penalty without debugfs is none.
> 
> I think this is largely different from e.g. CONFIG_SCHEDSTATS and may
> not deserve a separate kernel config: just handle the no-debugfs case,
> which is mostly implemented already by not building
> drivers/gpu/drm/xe/xe_gt_debugfs.c, with the remaining part being only
> the dummy implementations in the header.
> 
> 
> Lucas De Marchi
> 
> > +
> > +#endif
> > +#endif
> > diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> > index 631928258d71..4955612fb01d 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_types.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> > @@ -10,6 +10,7 @@
> > #include "xe_gt_idle_types.h"
> > #include "xe_gt_sriov_pf_types.h"
> > #include "xe_gt_sriov_vf_types.h"
> > +#include "xe_gt_stats.h"
> > #include "xe_hw_engine_types.h"
> > #include "xe_hw_fence_types.h"
> > #include "xe_oa.h"
> > @@ -133,6 +134,14 @@ struct xe_gt {
> > 		u8 has_indirect_ring_state:1;
> > 	} info;
> > 
> > +#if IS_ENABLED(CONFIG_DRM_XE_STATS)
> > +	/** @stats: GT stats */
> > +	struct {
> > +		/** @stats.counters: counters for various GT stats */
> > +		atomic_t counters[__XE_GT_STATS_NUM_IDS];
> > +	} stats;
> > +#endif
> > +
> > 	/**
> > 	 * @mmio: mmio info for GT.  All GTs within a tile share the same
> > 	 * register space, but have their own copy of GSI registers at a
> > -- 
> > 2.42.0
> > 
