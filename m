Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92E80C52D73
	for <intel-xe@archiver.kernel.org>; Wed,  7 Aug 2024 17:46:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 587BF10E193;
	Wed,  7 Aug 2024 17:46:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HG6YwSEW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A77CE10E193
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Aug 2024 17:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723052785; x=1754588785;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=W6XtXCsNySIpR5csUDrtMUHLbdAtv8uEdo/53ERlOAA=;
 b=HG6YwSEW1tMdSDZqTek3o0Qq1eziSIc59lX16fHdXssWYGkTjLbuYOur
 pZPrsEsl5EFErXUrTkY0LnL1ovlrMvs6ifZbEdAHf4WS7ma8YN9idSzFK
 nzmHC1aGt1z33FDtk3SRYanCO5gUb0MRuFn67NqAp3AraNRtPWESD6A17
 CPTnhetR4c1wD+WQUQajmsSCb4Gk5bgLGE2grfn7c16rQ5Sex17KK9Tek
 Z9XTLcoxI8x76LJ7PpGI6/dMRQc2zrniSr78/cPCQE2rDOJwt5kXIvQsA
 bMbeqka87LbVjDkAkHzcyOelUikjz2RlVaEL/7kZdsuVyGyFqHFAcKh8y g==;
X-CSE-ConnectionGUID: JwWXgHvxQna0edZ2H0ZZsQ==
X-CSE-MsgGUID: z1ushJ7ISCaR2wiS0AwAlA==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="24932086"
X-IronPort-AV: E=Sophos;i="6.09,270,1716274800"; d="scan'208";a="24932086"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2024 10:46:24 -0700
X-CSE-ConnectionGUID: lf1VAGfoQoeEwdbwR3qHmg==
X-CSE-MsgGUID: G9TwoM/eSBeVYW17iSbr1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,270,1716274800"; d="scan'208";a="61587139"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Aug 2024 10:46:23 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 7 Aug 2024 10:46:23 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 7 Aug 2024 10:45:59 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 7 Aug 2024 10:45:59 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 7 Aug 2024 10:45:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eA/Y0syuOHfsjNmV/hy5evY3rKQSn+6yR1+D+M4iOhMNZCLoeRhF3ymK7SHK6W9bZTl1lPoaElVJ3hqQzAggD+kBi6muud40v/pDdth/7M/pGUMkwLnu9EOM21mNWKRLwUygElplYGLtqnfGqREDUT6wIN/kh4RjJDdmfcBxQHTD2ZWivPTfi0EB+Nk+KC1S4Te3vdaON5muIsVJvleHgEWW1sdyp3ewozjYLIx99/ZsAdBIU43JOcuRl4bSReQ/iikYYXxcXo6aNNt5d5eCOjJYnk4wuW1updVRmBA4AAeovVPXv4eYd1bPRmge9QQUflkvZhnhUCfjr1Fda16FlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QEVBxZdhfABKwi7y78WqU2BotnwXAxz2ypefG5GNIC4=;
 b=dDSq00JE8VDN7MXuTONa8jzRcjMbXHuD2YiJei6SnBYqEEnYSbCtjILC8BxE7FZFz/M93qNWTHoilNsgzvdxLzN+fB5X9PPqOCC8rWSf70MEnDb8mIHGtFiOT2ibpNS5LmrXxHuW5+RwSAtstcpPuDo2clDH0weygLdQdnYKoiv3Mk2GSQZ+ZszlwbVxAnUhpm7/687hWhISBUG2cH/tUyykTdIoJORuc/mAI8nUyxrhG1ViQ11Fm1jJBo77hugB3Z57NjkD0ukPAfFqCNFqzSAFrtJkDKgAlEB0QaMPZw4ACizsv9w4Eo2tbx7Lo0rD6/J9raNYFDX2brIhka/97A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH8PR11MB6928.namprd11.prod.outlook.com (2603:10b6:510:224::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.24; Wed, 7 Aug
 2024 17:45:56 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7828.023; Wed, 7 Aug 2024
 17:45:56 +0000
Date: Wed, 7 Aug 2024 12:45:50 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: Nirmoy Das <nirmoy.das@intel.com>, <intel-xe@lists.freedesktop.org>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>, Sai Gowtham Ch
 <sai.gowtham.ch@intel.com>
Subject: Re: [PATCH v2 1/2] drm/xe/gt: Add APIs for printing stats over debugfs
Message-ID: <yu3lrzj4k762rwttnhidnooi6nqj665dr3h5vcag3zahol6576@4d7t2j7ivomc>
References: <20240807110802.13385-1-nirmoy.das@intel.com>
 <gos5am5tdkhozpwidgopru33w33hgt5dd4wqcn4xkjkllkl6im@bkldffzsasvv>
 <ZrOnbbp8LQn1ueiF@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZrOnbbp8LQn1ueiF@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: MW4PR04CA0041.namprd04.prod.outlook.com
 (2603:10b6:303:6a::16) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH8PR11MB6928:EE_
X-MS-Office365-Filtering-Correlation-Id: 331273a0-afad-41a4-762f-08dcb708ca14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?etPJvCj7sqXwXtsPTVdHykLQY8KePLqBj35hGhr3q/BHmIGC4iPxJdzuIb?=
 =?iso-8859-1?Q?avblDrUtRVx/uQSs4ZKLAaU5Agv9c1HifB3te2naEk3nWZ5VO+379l9oio?=
 =?iso-8859-1?Q?6XWmkZzb0y0HVzUyxmtqi1eom8irK/T3WhzhBL0M2Kx0cmPSy7kPTVJROf?=
 =?iso-8859-1?Q?hGLojeIsE4h/vTrmqtrldGNWcXjKNnphqZyU5K1/yW0ZxO8tiYOGISRQ2P?=
 =?iso-8859-1?Q?gv84iSfYyVLzkEL9ohDkLPsqsEQksxzuhcUm9s862OsoY54ei3/xVLBX7f?=
 =?iso-8859-1?Q?7W8yqK7trqMBa+KtkqGTBCEeFi9GPPNTuGsr2Y00cwkQkMZRh1nWcE+tXf?=
 =?iso-8859-1?Q?bEG5HaTCTMY+kKV3Syw4vE/Vj08KyxMczX8pGNfdJsumSxGn0zXkNQVYJA?=
 =?iso-8859-1?Q?A3QbAZCh1Wf3jdyjwz7xZm2RSJLvhDWc4HdLwD2XpXFkhY9X4O3D3EXd+1?=
 =?iso-8859-1?Q?PwN54UURfC/obd+2STxhr2e6/hswkKV3WqhrbpvHR1oYNLDVLBoL+msHNe?=
 =?iso-8859-1?Q?BSN9FX9fl/QUJiOkTd0Kf1WH+eFm1B1AhE144aVxj6Vfb5GT+yrSL34Sna?=
 =?iso-8859-1?Q?vY/95UAZs69B59V5ZgGh1tKRBl7wzXJeJmiKp6ygwPvqFukHLqQqxgyddi?=
 =?iso-8859-1?Q?gNSHcRYT/DS6wWt98Os1L3xRL0hNx7XjNHC2rR1v55zf8f/3g+squJpGnN?=
 =?iso-8859-1?Q?SCWHCaurqdmep1+HaKPoXWcYsqrF0EVWayJPionRypyrJMsyLDto/Yv3rE?=
 =?iso-8859-1?Q?9tKRdFzH2ofGvFEXjLTpzLS1FVPlrbsz/x+KzkS3LxzgSEtsihbwcIOb+N?=
 =?iso-8859-1?Q?6ed8VkcWPsLwWi0ysh1brBA644F8fSByunH6hoYzfB1mC2qLN+E8wsk4i0?=
 =?iso-8859-1?Q?GbOZJy6lahXR4TiDWk4cL/EpLlSmlUmhnZ/MWcfGOScPKO2UPSrKiT/WZM?=
 =?iso-8859-1?Q?3O96qyHldffE0XdbOXG5r6PM2H/qOSYDInu3mjdKOGCnNN1vjXFts50Vak?=
 =?iso-8859-1?Q?njW5xXhRuM1jJtQ5/FkOE5QYWPJVrsTVbM1tsIAxUHLg0tzsvToMV7r3SV?=
 =?iso-8859-1?Q?ffR0rcGhx2vx8g9x5xXGbq9G+bEEzb/8V/FmaTqepXVbW3x1ubOXkOHtf9?=
 =?iso-8859-1?Q?cqPPt42c7hZ+mIr9FxmQ178AjvlKp0HqlZtUK9i0kJ8i1TKeVRmLc9iuiJ?=
 =?iso-8859-1?Q?Aqf5xAMXsXPOoIbAGSwiH8Gl6Ibme79U5SvHb3KpGpEbmBMfOipY0M/4Mt?=
 =?iso-8859-1?Q?uguOWmtpCShQsGZOCYI7EcFJU4c1lI6dxxh1TZ2zhUYKd1Xn9NNvcEQvyo?=
 =?iso-8859-1?Q?M3ZJWsnmswCtIXZUUZiqPWYBFeYookSpJUZAtpstScFFne7FXhwKkQegC6?=
 =?iso-8859-1?Q?CMy/s7kVovhdtYT/eEEk6r68V/uzy89A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?an4pGlgeQGbGIs576bYLlEZb4KORMpH4da3dSMOHAFb1ypghwxYBUNRXUJ?=
 =?iso-8859-1?Q?onDL1ke5xT469W67S50XtT/pBmFMd5y3VRg7L1dw9ckk7jdZ+wmIO1foPQ?=
 =?iso-8859-1?Q?r3UZDWaYX600dMs9oGzRSQ9b2pe0q4rDFXZqZVq9R73FzHlqLJG1WPQ1Op?=
 =?iso-8859-1?Q?pIYB0yWRKvsGLUjtiCKaLYd5HAgaCVvK8pGkUK1n5cNxtnAMcwaAmqKOaJ?=
 =?iso-8859-1?Q?bJdZCDB+tTwJD4+fjQdaCKDlRkdoYhgMOEzCa8K8adMmorf74nVPkwFBXZ?=
 =?iso-8859-1?Q?63JEsUBtW4uCMcNHHrsFaGRRhiUEld8LyICB3MWx/Buy0gbHyN39Tvgsax?=
 =?iso-8859-1?Q?9BCafZXDL2cxtMqVN/GJtoFuXRdPHZJ/HkfSTQ4EnypcJGFkJPWBsraluN?=
 =?iso-8859-1?Q?uA9UUVvgzcYpMr2KZ7f1JQwwW5GaZ6+bwr8tXvq5cFEzQAimZrXPast8w8?=
 =?iso-8859-1?Q?AgIywgdpI6lxa20xIjiRj9+Nr97f44p4WrHoIqDTVOljtRpKl2Lpji18ah?=
 =?iso-8859-1?Q?t3aiFQssxDANq4dHcBqxOMTlwdsgKvcVJxzxVvl8wL7+PwRw3xP1N6tIA3?=
 =?iso-8859-1?Q?/yEJrJbdm860L9FaggEDM+iz38pwD2DTfXTk/ANYLP7ylkKrSxNOTiqElM?=
 =?iso-8859-1?Q?yYW9nNBxiwV3tb5Wcw+hml1Yy5bHaMvPuKGr9igUAiszk31cpXmKy9iU89?=
 =?iso-8859-1?Q?aHTAAowCDL3aNG7EYa+DB72kxRoZUzxZnrACYFlDH3zlAfVRQ48zdaZfvn?=
 =?iso-8859-1?Q?YKx/PcADfhvpoXSpkmJiXgooHwt303QQOAQHGtG9c7W3Tr4S4Bo0gqaU+U?=
 =?iso-8859-1?Q?qog9wNyGlSMOOvybidMD5ECyQA22n3YKquz8lwU7srzfD1/ghLvp+NJc4u?=
 =?iso-8859-1?Q?9fi6naA9ajCASDz0MOYnN43UaH1BPCnhgYQl/LdGpHo2d9wuEurwknk+R7?=
 =?iso-8859-1?Q?cEKL2/QsakVqGTP9Cudy3EkoK9cO8FeMYiQFkerA56QLbTkSFoCGmBjLbf?=
 =?iso-8859-1?Q?nLVYFg8f+NskeVzeqPz1fwNnTxOg+tDDhA4MnQ1BiCy9yGwRlMmqotP9dd?=
 =?iso-8859-1?Q?cSx0JmpHO3VbHDwRc/BYp7LS4JORIvHlFbb9ISs7T3wSV7dCbpeDNH/VN+?=
 =?iso-8859-1?Q?N1OhidLgzPtS80ieaCVqK2/fr0TCc9ripAxT6Z7BslcTUYogQZVsMaVQF/?=
 =?iso-8859-1?Q?t3q18ZUT7DCxp0danQXfebpbNTmnbCRxH9KtiEDKx5Bt1Jk/CdNvHSVW+F?=
 =?iso-8859-1?Q?rbxoND2WXPml+TUHKKuOieT0uXAGpicNv9YPwb8fPzs54xVd4cFOW0KPXB?=
 =?iso-8859-1?Q?xRpn03s0bW+5VdpTxPdcdv2CG3DlSJ1LqVAhgXd8IvNdp0TfRs9sCJpcSB?=
 =?iso-8859-1?Q?W2thRZER1Eq6ddzdnadk8J5h8wR+lkrqHye869FNokLfHj1muYs6Aa7d/L?=
 =?iso-8859-1?Q?CfMYeldrMtxHO9TQjAyEasDfrqzf878Nmx5KU/BTctdd9BfduXztZEBwz2?=
 =?iso-8859-1?Q?m2SdLR/tWMMjTfQM7taliFzByCyHLLwRVDkR6RUjUwelcBTOxta4MigKmP?=
 =?iso-8859-1?Q?DeccBd8aYcUVFoJd9PIjkGw0TzA90WRKV7DMUonkolauBrtd1ypXYDLMZS?=
 =?iso-8859-1?Q?Ihl/ALWFK/HWhiEWDV7Tu/YqfzVjPZWU0qsvMUdRHoinTzMV+ASxPh8w?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 331273a0-afad-41a4-762f-08dcb708ca14
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2024 17:45:55.9943 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 50N+lO3Xefe7c65vIMsajWQuNnN1naWEID3pxL+C1WtodPfbJn9gV0m8cgq3B+4RiXfp71BUJvzOnnXool/IwfPN1FPt7QfkBaziBBw1AkE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6928
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

On Wed, Aug 07, 2024 at 04:57:17PM GMT, Matthew Brost wrote:
>On Wed, Aug 07, 2024 at 08:59:34AM -0500, Lucas De Marchi wrote:
>> On Wed, Aug 07, 2024 at 01:07:58PM GMT, Nirmoy Das wrote:
>> > Add skeleton APIs for recording and printing various stats over
>> > debugfs. This currently only added counter types stats which is backed
>> > by atomic_t and wrapped with CONFIG_DRM_XE_STATS so this can be disabled
>> > on production system.
>> >
>> > v2: add missing docs
>> >    Add boundary checks for stats id and other improvements (Michal)
>> >    Fix build when CONFIG_DRM_XE_STATS is disabled(Matt)
>>
>> I don't understand why we are even adding a config here.
>> This should just be compiled out if build is without debugfs.
>>
>
>I don't know enough about how compilers work these days but would the
>atomic increment compile out without debugfs. If the answer is yes, then
>agree we can drop this Kconfig.

either this:


static inline void xe_gt_stats_incr(struct xe_gt *gt, enum xe_gt_stats_id id, ...)
{
#ifdef CONFIG_DEBUG_FS
	atomic_add(...)
#endif
}

or a dummy implementation separately would work.

We can also use

	if (!IS_ENABLED(CONFIG_DEBUG_FS))
		return;

Compiler would still constant fold  and drop it. See
Documentation/process/coding-style.rst - 21) Conditional Compilation

But in this last case we wouldn't be able to remove the symbol from the
gt struct, which may or may not be relevant since it's just a few bytes.

>
>Also does debugfs havea Kconfig, did a quick search and not seeing one.
>

see above. And we already check it in drivers/gpu/drm/xe/Makefile:

ifeq ($(CONFIG_DEBUG_FS),y)                                                      
         xe-$(CONFIG_DRM_XE_DISPLAY) += \                                         
                 i915-display/intel_display_debugfs.o \                           
                 i915-display/intel_display_debugfs_params.o \                    
                 i915-display/intel_pipe_crc.o                                    
endif  

oddly we are not compiling out xe_gt_debugfs, which we probably should
since otherwise we will just see a warning "Create GT directory failed"

Lucas De Marchi

>Matt
>
>>
>> >
>> > Cc: Matthew Brost <matthew.brost@intel.com>
>> > Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> > Cc: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
>> > Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> > ---
>> > drivers/gpu/drm/xe/Kconfig.debug   | 11 +++++++
>> > drivers/gpu/drm/xe/Makefile        |  2 ++
>> > drivers/gpu/drm/xe/xe_gt_debugfs.c |  4 +++
>> > drivers/gpu/drm/xe/xe_gt_stats.c   | 51 ++++++++++++++++++++++++++++++
>> > drivers/gpu/drm/xe/xe_gt_stats.h   | 32 +++++++++++++++++++
>> > drivers/gpu/drm/xe/xe_gt_types.h   |  9 ++++++
>> > 6 files changed, 109 insertions(+)
>> > create mode 100644 drivers/gpu/drm/xe/xe_gt_stats.c
>> > create mode 100644 drivers/gpu/drm/xe/xe_gt_stats.h
>> >
>> > diff --git a/drivers/gpu/drm/xe/Kconfig.debug b/drivers/gpu/drm/xe/Kconfig.debug
>> > index bc177368af6c..4db6d707c1af 100644
>> > --- a/drivers/gpu/drm/xe/Kconfig.debug
>> > +++ b/drivers/gpu/drm/xe/Kconfig.debug
>> > @@ -94,3 +94,14 @@ config DRM_XE_USERPTR_INVAL_INJECT
>> >
>> > 	 Recomended for driver developers only.
>> > 	 If in doubt, say "N".
>> > +
>> > +config DRM_XE_STATS
>> > +	bool "Enable XE statistics"
>> > +	default n
>> > +	help
>> > +	  Choose this option to enable support for collecting and
>> > +	  displaying XE statistics as debugfs.
>> > +
>> > +	  Recommended for driver developers only.
>> > +
>> > +	  If in doubt, say "N".
>> > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> > index 1ff9602a52f6..b0bbb248f644 100644
>> > --- a/drivers/gpu/drm/xe/Makefile
>> > +++ b/drivers/gpu/drm/xe/Makefile
>> > @@ -143,6 +143,8 @@ xe-$(CONFIG_PCI_IOV) += \
>> > 	xe_pci_sriov.o \
>> > 	xe_sriov_pf.o
>> >
>> > +xe-$(CONFIG_DRM_XE_STATS) += xe_gt_stats.o
>> > +
>> > # include helpers for tests even when XE is built-in
>> > ifdef CONFIG_DRM_XE_KUNIT_TEST
>> > xe-y += tests/xe_kunit_helpers.o
>> > diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
>> > index 5e7fd937917a..3765c04919dc 100644
>> > --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
>> > +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
>> > @@ -17,6 +17,7 @@
>> > #include "xe_gt_mcr.h"
>> > #include "xe_gt_sriov_pf_debugfs.h"
>> > #include "xe_gt_sriov_vf_debugfs.h"
>> > +#include "xe_gt_stats.h"
>> > #include "xe_gt_topology.h"
>> > #include "xe_hw_engine.h"
>> > #include "xe_lrc.h"
>> > @@ -286,6 +287,9 @@ static const struct drm_info_list debugfs_list[] = {
>> > 	{"default_lrc_bcs", .show = xe_gt_debugfs_simple_show, .data = bcs_default_lrc},
>> > 	{"default_lrc_vcs", .show = xe_gt_debugfs_simple_show, .data = vcs_default_lrc},
>> > 	{"default_lrc_vecs", .show = xe_gt_debugfs_simple_show, .data = vecs_default_lrc},
>> > +#if IS_ENABLED(CONFIG_DRM_XE_STATS)
>> > +	{"stats", .show = xe_gt_debugfs_simple_show, .data = xe_gt_stats_print_info},
>> > +#endif
>> > };
>> >
>> > void xe_gt_debugfs_register(struct xe_gt *gt)
>> > diff --git a/drivers/gpu/drm/xe/xe_gt_stats.c b/drivers/gpu/drm/xe/xe_gt_stats.c
>> > new file mode 100644
>> > index 000000000000..b13aee5488d5
>> > --- /dev/null
>> > +++ b/drivers/gpu/drm/xe/xe_gt_stats.c
>> > @@ -0,0 +1,51 @@
>> > +// SPDX-License-Identifier: MIT
>> > +/*
>> > + * Copyright © 2024 Intel Corporation
>> > + */
>> > +
>> > +#include <linux/atomic.h>
>> > +
>> > +#include <drm/drm_print.h>
>> > +
>> > +#include "xe_gt.h"
>> > +#include "xe_gt_stats.h"
>> > +
>> > +#ifdef CONFIG_DRM_XE_STATS
>> > +
>> > +/**
>> > + * xe_gt_stats_incr - Increments the specified stats counter
>> > + * @gt: graphics tile
>> > + * @id: xe_gt_stats_id type id that needs to be incremented
>> > + * @incr: value to be incremented with
>> > + *
>> > + * Increments the specified stats counter if that is within expected range.
>> > + */
>> > +void xe_gt_stats_incr(struct xe_gt *gt, enum xe_gt_stats_id id, int incr)
>> > +{
>> > +	if (id >= __XE_GT_STATS_NUM_IDS)
>> > +		return;
>> > +
>> > +	atomic_add(incr, &gt->stats.counters[id]);
>> > +}
>> > +
>> > +static const char *const stat_description[__XE_GT_STATS_NUM_IDS] = {
>> > +};
>> > +
>> > +/**
>> > + * xe_gt_stats_print_info - Print the GT stats
>> > + * @gt: graphics tile
>> > + * @p: drm_printer where it will be printed out.
>> > + *
>> > + * This prints out all the available GT stats.
>> > + */
>> > +int xe_gt_stats_print_info(struct xe_gt *gt, struct drm_printer *p)
>> > +{
>> > +	enum xe_gt_stats_id id;
>> > +
>> > +	for (id = 0; id < __XE_GT_STATS_NUM_IDS; ++id)
>> > +		drm_printf(p, "%s: %d\n", stat_description[id],
>> > +			   atomic_read(&gt->stats.counters[id]));
>> > +
>> > +	return 0;
>> > +}
>> > +#endif
>> > diff --git a/drivers/gpu/drm/xe/xe_gt_stats.h b/drivers/gpu/drm/xe/xe_gt_stats.h
>> > new file mode 100644
>> > index 000000000000..04a1d61ce1fb
>> > --- /dev/null
>> > +++ b/drivers/gpu/drm/xe/xe_gt_stats.h
>> > @@ -0,0 +1,32 @@
>> > +/* SPDX-License-Identifier: MIT */
>> > +/*
>> > + * Copyright © 2024 Intel Corporation
>> > + */
>> > +
>> > +#ifndef _XE_GT_STATS_H_
>> > +#define _XE_GT_STATS_H_
>> > +
>> > +struct xe_gt;
>> > +struct drm_printer;
>> > +
>> > +enum xe_gt_stats_id {
>> > +	/* must be the last entry */
>> > +	__XE_GT_STATS_NUM_IDS,
>> > +};
>> > +
>> > +#ifdef CONFIG_DRM_XE_STATS
>> > +int xe_gt_stats_print_info(struct xe_gt *gt, struct drm_printer *p);
>> > +void xe_gt_stats_incr(struct xe_gt *gt, enum xe_gt_stats_id id, int incr);
>> > +#else
>> > +static inline int xe_gt_stats_print_info(struct xe_gt *gt, struct drm_printer *p)
>> > +{
>> > +	return 0;
>> > +}
>> > +
>> > +static inline void xe_gt_stats_incr(struct xe_gt *gt, enum xe_gt_stats_id id,
>> > +				    int incr)
>> > +{
>> > +}
>>
>> Is there a reason not to force id to always be a compile-time constant?
>> The only use case added in patch 2 pass it as a constant.
>> This way the id is checked at build time, the penalty with debugfs is
>> just an atomic_add() and the penalty without debugfs is none.
>>
>> I think this is largely different from e.g. CONFIG_SCHEDSTATS and may
>> not deserve a separate kernel config: just handle the no-debugfs case,
>> which is mostly implemented already by not building
>> drivers/gpu/drm/xe/xe_gt_debugfs.c, with the remaining part being only
>> the dummy implementations in the header.
>>
>>
>> Lucas De Marchi
>>
>> > +
>> > +#endif
>> > +#endif
>> > diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
>> > index 631928258d71..4955612fb01d 100644
>> > --- a/drivers/gpu/drm/xe/xe_gt_types.h
>> > +++ b/drivers/gpu/drm/xe/xe_gt_types.h
>> > @@ -10,6 +10,7 @@
>> > #include "xe_gt_idle_types.h"
>> > #include "xe_gt_sriov_pf_types.h"
>> > #include "xe_gt_sriov_vf_types.h"
>> > +#include "xe_gt_stats.h"
>> > #include "xe_hw_engine_types.h"
>> > #include "xe_hw_fence_types.h"
>> > #include "xe_oa.h"
>> > @@ -133,6 +134,14 @@ struct xe_gt {
>> > 		u8 has_indirect_ring_state:1;
>> > 	} info;
>> >
>> > +#if IS_ENABLED(CONFIG_DRM_XE_STATS)
>> > +	/** @stats: GT stats */
>> > +	struct {
>> > +		/** @stats.counters: counters for various GT stats */
>> > +		atomic_t counters[__XE_GT_STATS_NUM_IDS];
>> > +	} stats;
>> > +#endif
>> > +
>> > 	/**
>> > 	 * @mmio: mmio info for GT.  All GTs within a tile share the same
>> > 	 * register space, but have their own copy of GSI registers at a
>> > --
>> > 2.42.0
>> >
