Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02E90CA1010
	for <intel-xe@archiver.kernel.org>; Wed,  3 Sep 2025 23:26:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD30810E216;
	Wed,  3 Sep 2025 23:26:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d9TwLnbu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8ABC10E216
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Sep 2025 23:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756941999; x=1788477999;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=L3TE0WYeiOU2LAaHNdd7oYLWTC+TZU8G4rRto6goVfE=;
 b=d9TwLnbulw6WKh93A/IDo3Jn26uFFBROKG96QZgVLRgQn8LVhdhFcAzj
 X9SIF5MaY8C1QR1N8ykCqcnhaAMRKrZmH7k3XYbii6MqqDqzZpVwO1vT5
 bo3ZlCzMuFw1H4g7kpNxAaaaj2Br9uwezKdqLD6vkoRqJfN5ETV5QzMVd
 DngoxFVBM+2AUsaTfjjYkvM1CiYZ+VpWOupjjt163rzKyrhbm7kr7qRRu
 iRstF+ZJTzJDsl4ryRirstkP/tZvktGPm9fYayv2sVbOpLbF4F89cvAbQ
 sZbxMY6DvliG8TQXGw5Ncu0Frh8GkspoHN0821+2ws6C5q7N8fYh/8gNS Q==;
X-CSE-ConnectionGUID: +ljwSMlVRRKNmzyb3Xt9kg==
X-CSE-MsgGUID: Eg4ijS78QhG4T4T6hjeYOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59223980"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="59223980"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 16:26:39 -0700
X-CSE-ConnectionGUID: tRK6tYOASs68Eq1TEJgSaQ==
X-CSE-MsgGUID: KCHx2gNyQBqhFTstmTv7Sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; d="scan'208";a="171853086"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 16:26:39 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 3 Sep 2025 16:26:37 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 3 Sep 2025 16:26:37 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.77)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 3 Sep 2025 16:26:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nf+E9B8FLJ9kodLAwPZctDN+hsb2aG3PnXQMu0KF2KlINM6b2cvHSuYGtsvUGYh1WFWEWkKVY6G9ncPYfA66vHJvWtw2pKtm0ZYnJyTEcKursOv11IoAZ/7S2lrv/IDOoTpbPuNe49n+6L9yr2eX751pjM0t+8GsIowp1AMSrTdO3kx9zUpqdB60be0RXANEfYYElMktHaK++rlMSH2fKCxlFVLpF+2wHF/1tYBw6JknOZ8SjCt+/L8MMbDh80kUwsxrPKzzL3RHPUAN76OpgCWHYqhhMQpi2dvW5Y4mDYEU3R2iVgPU7cEA+LEPBtp3YK8vwQQCty5nCDoifo5AJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hg0qqejbdmANtH7Pplt8eCKQZfaK9c/ufEFaswrhNis=;
 b=vMVgbwxLYgkLm7dwt17NPhmPe/tgEdYx00J5/OLBVV9Tm3DwS7TMC0UnC3+52eW9rFrsoWq5SmDlc1XWHJtmhLeqA5KMcCpcyvn9HICHGyTR6MpRGRa/DIF/BgcLZoGgE6Ovkajmy2wRsQe2SBJYQ3BS4nkt5EiatwSYBVnfKNEBhaXK7TWJx/uWW1C8ZmqrbHc3qUL3jJpwDo5oL85dLCnA5dTujHA2j0rpT29nQsyQbUfvWED1suOAHf+alBOMrz0ne2Yp6NtbQw70LTXcIszfo0fbFsj+DN+epvtGOvIh8+dTDoSVoLA/CqJ5su4iunaqdcijJdCxGYTFrlg2ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CO1PR11MB4980.namprd11.prod.outlook.com (2603:10b6:303:98::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Wed, 3 Sep
 2025 23:26:32 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9094.015; Wed, 3 Sep 2025
 23:26:27 +0000
Date: Wed, 3 Sep 2025 16:26:24 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw6IGZhaWx1?= =?utf-8?Q?re?= for Core
 Xe changes preparing for VF migration (rev2)
Message-ID: <aLjOoBB1S4xrB/A3@lstrano-desk.jf.intel.com>
References: <20250827211010.308372-1-matthew.brost@intel.com>
 <175644397318.282463.3869269903188104505@1538d3639d33>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <175644397318.282463.3869269903188104505@1538d3639d33>
X-ClientProxiedBy: MW2PR16CA0039.namprd16.prod.outlook.com
 (2603:10b6:907:1::16) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CO1PR11MB4980:EE_
X-MS-Office365-Filtering-Correlation-Id: b99266e9-5157-4201-6472-08ddeb414e10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|366016|376014|13003099007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hy1RhdAFzNj1Ot+f9tYG5XGGaaAiPCGssRM/iZ4QKJtHX4NQLLEDPctjOi3f?=
 =?us-ascii?Q?cOVT3VqJPtcdNLuG9aZ6p6cYdsKkcImCnIgM7URzwDwT8WQ44y9Op3CkzY0Q?=
 =?us-ascii?Q?HPKlhrHyLfZXN1fFQh7BmGsD23568BVDyX/ICTLiD44jNWiKPfSnS3t1QjaI?=
 =?us-ascii?Q?sU3JPAMEadwBNYXiZQXW5+VaSJxJif5DxGmnw7SXkIsP/qwwXYswBvueVhoe?=
 =?us-ascii?Q?dMNVKKKKYqzW/AXmGcuSE3mjxzTp4eH3QiStxHsaI8iVjf94aATQW5qnCpWJ?=
 =?us-ascii?Q?o5VStRHKaaP+B0I8jvWZwnN6cJw5sUL57GBAeKgQcIBDuQwta4uDAu55diq9?=
 =?us-ascii?Q?zvdWZvNyqZux5Vs+s4h+UWk0IvXAkQwRRn/Waf4JBNVoCRikMLMXzFouWUGn?=
 =?us-ascii?Q?+nIVSy/cEJ1ImwH9Zk5OBHyZMhhG6xInXjQlCqRttjNiGMfVO2j9n3OqEQxs?=
 =?us-ascii?Q?pl5BMgoHKxOLb/TbHD7n8FwqPsxSFRFC0wnvlwjjFWEAb9ynL/BLm4HIxMIU?=
 =?us-ascii?Q?fv+KfBWxx4OhEtnE8A4BPcTZK4ofsxvofAJo4MW2AesOp5l3AsisHrUNKzWE?=
 =?us-ascii?Q?hIkGx6IJsEV0xZIdIOdejMOQg5wjkpVFpzny1MG1GzJjRUMRZs5OS0O9fB4H?=
 =?us-ascii?Q?VuBWVCB1zzOet31MrtDdhGlkP+FNwTPe2BAtjNPV5Sxue2iR3oVgMZAt6NXB?=
 =?us-ascii?Q?DuNDQT752bOid/r6OB1PAQ8gwBbr9v+NNtvQgAiFkVoOadxQzxiKNNWoQvJB?=
 =?us-ascii?Q?vWQTXy1Tb5v1e0Sc0aJXL2tgsr7gM1zZ90fS/nRBOscq0Aqw7LLz2egKAexP?=
 =?us-ascii?Q?b9skzCfmzWkgNLkrL8v+kN3xM9VzfTVkwPMpK13ke1Pkn9iNoKWvnAb9e1B/?=
 =?us-ascii?Q?jUJnWiY+1wyWAvkSwTzPTJO+lJwxKYcJPwL89uY4EUajH5ieouO4Rmnep3fJ?=
 =?us-ascii?Q?iya5l+bemMl4TKVRay8b3ealvk+PvHAcVB2nmBGA0WhOQ2xjAOgasFtGaA8g?=
 =?us-ascii?Q?u4FfWDGHi+drZn2u4kbfBLUigS9kMsHiVQ41KrHG9dX+WHtNynkBik+vuKyG?=
 =?us-ascii?Q?CJno07lmUAPCP4vIC4icDNb27r/RQqRNfyYYYcOR+p50FQ9MlzRzTSfINj/t?=
 =?us-ascii?Q?0cUR6CQfi+Tlv9mYoFbb3nql1uHGCcpsWlGePEdlcR/vbLrprz9myXqrCn6K?=
 =?us-ascii?Q?476nanWkMAlGOjSWsmd6gUGzVxjqd0qLc/A82q13p5tgLV74uETebxU/BpC3?=
 =?us-ascii?Q?olBP0mFdzCEC+rLanmkugMNOPh467RX7/HFEAQNgt7AT033bAWattcaLwduf?=
 =?us-ascii?Q?qxCQQwfbg7/C2VraPxlWnwSidy5r6ra4Goa4wmePGWY6c5sN7ZrX1ujtSed7?=
 =?us-ascii?Q?INRcq1Y=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(13003099007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1uYAdzKs2DCjGJXCNDFau32+Y6Wht41ybmfC8Ldn1EkJBjuqrt8k4wql4vP0?=
 =?us-ascii?Q?BM82PTeWNgwSzGOWrDBxhLBBUgWE4lURwaoJdx2lzsb/4DJEELYgp4m26zzL?=
 =?us-ascii?Q?b7uwP4LsfafkbJyvi46cbCEM8AOWHK4YKLRApCghkM5gPSh5Bvn3Hhy/euTX?=
 =?us-ascii?Q?GlfXr0+htgd8mdjRHmnvoWvXadSFo1cIi7w61MID58b/iXwIuK73nUtjfjd2?=
 =?us-ascii?Q?V5O5v1OxKWDrXIrewZwKPCBkO6dZ4ZXrMTKroW/5OPSphmh6a75gKKom4t6k?=
 =?us-ascii?Q?EbsRWOiW6R0xzoThDyBiSDMDn7yFaRNbZOt5REfUXES7y6odR1buu27edLcU?=
 =?us-ascii?Q?8oMuD2hKBeOGB7WARXJv23z3z9VS1jHQmXr9j/e2/BDKDih0fWJoRlUC7zv3?=
 =?us-ascii?Q?EUp+vUqOC/gtSV9dUYB2da5ViQGfCBeeHX4iIAHIxdeN9ZzKxBTkpZGBnTwP?=
 =?us-ascii?Q?EHcawr6vjYAIFoqHnXuLn3xr3zw7m52E66CuvywSEuQw7H0Cyi4EAJcMzhSJ?=
 =?us-ascii?Q?bA6o7PORxynEW7VEIjKq+SUh6mQRwszqcKs+t+7hVJwWS+pqs+WGg4ZOmT1n?=
 =?us-ascii?Q?/dg2cFdDtimcs/nsfISNOgOt82NMCGtV9trjDrtWhgGa6q1d7hZAaQmixCqh?=
 =?us-ascii?Q?hrSoNOxKBKFS3QiiZiWKKminahuQo4oSK3OG5+WLn7CrkPr0YZVDzz7f/Gh/?=
 =?us-ascii?Q?QRpfWcj3LaeUfCNLAe+/XcGo6luXN+YIRjdJq671fp4b//7TRI0rF8LM1qvZ?=
 =?us-ascii?Q?MPx8MPKYJ6k6Ljlf/7fHWrqammPpyisvu/sB1yJDSD+Ya9tt90HpNNGD04b2?=
 =?us-ascii?Q?Z9CQGXQ+jXyY6MPIY0NIObvmJn2pfW7g1riueHx0CxTxzRF2pUQ7yS2YK+Uo?=
 =?us-ascii?Q?AwAFCYm7fNdHTqYb63Ql0R46zonBocgiWb71HSC2O6++qLDCVl1sK547vcpv?=
 =?us-ascii?Q?t6mMyYMKv9WDlQVcqhYRPQt+oM+JChmHQK2czG5d8YVE3/4LewDAP82yQZ45?=
 =?us-ascii?Q?Z26OcgYz2hzTPbjRB2UZBag61w8SbzI3MN8R4kYxfRzz6SiijzsqKEhEnf/7?=
 =?us-ascii?Q?z54KirDSXxacZuIn5UuyjhZzBjp2sLtW+fw2xCQqJCnGPAfKFieAUuROg4RF?=
 =?us-ascii?Q?ZKvb5mMc8qH8cHw/FTAd/Vp9SX0z6cUNrNtMY1z6JTNwUn0AeZfKKvvWkoFr?=
 =?us-ascii?Q?WpI46GuhTblr4qLkeFPwr9CXCXuodjsYJykndNSIltMYKrf/c2nuanbUuPWb?=
 =?us-ascii?Q?FfiijEx/82SDmtfC8uxnPmFYzSot5pLGQc4fOp3a3zlPCoyTj1o1B05vHJvs?=
 =?us-ascii?Q?ZD6949rAV2hZLx34V+6gu1IDU0mUsZA3RajyOAzSMbtulDAggpDWIxZOcHOW?=
 =?us-ascii?Q?DuMUhNAGqNS8b9g/EMRAVaNQfUZTuCY0S+FLUtZ7c2OhamkHix4yP+9jhXas?=
 =?us-ascii?Q?PF9MqaESG6V/Si0MJ8GhOFuyAJtj0yvSYBtLr3H/8cFRDmdv/n2shyN2oiNE?=
 =?us-ascii?Q?BH7OUpp9Txb3BmYtWZltySPIY9m3MJdqT8UKS5uMNuoTTjBL64LUMyGP09FJ?=
 =?us-ascii?Q?m9lxxUHYtOBHpskLpQeS0F52pbOKYn/QHiGwJABi5HFrRqgjUY88/UW+crth?=
 =?us-ascii?Q?Nw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b99266e9-5157-4201-6472-08ddeb414e10
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 23:26:27.4644 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ov2hI1i9kxS/h+IBL/Q0iOJ5vw/Zqn0glPs26eZtgkJUgFp2AVeWSQdfYcEJdtkmIDvxjxo+uDPbXiesyQYNDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4980
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

On Fri, Aug 29, 2025 at 05:06:13AM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Core Xe changes preparing for VF migration (rev2)
> URL   : https://patchwork.freedesktop.org/series/153589/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97_FULL -> xe-pw-153589v2_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-153589v2_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-153589v2_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (4 -> 4)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in xe-pw-153589v2_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1:
>     - shard-lnl:          NOTRUN -> [FAIL][1] +3 other tests fail
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-lnl-4/igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html
> 
>   * igt@kms_vblank@ts-continuation-dpms-rpm:
>     - shard-lnl:          [PASS][2] -> [SKIP][3] +2 other tests skip
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-lnl-5/igt@kms_vblank@ts-continuation-dpms-rpm.html
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-lnl-7/igt@kms_vblank@ts-continuation-dpms-rpm.html
> 
>   * igt@kms_vblank@ts-continuation-dpms-rpm@pipe-a-hdmi-a-1:
>     - shard-adlp:         [PASS][4] -> [SKIP][5]
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-adlp-3/igt@kms_vblank@ts-continuation-dpms-rpm@pipe-a-hdmi-a-1.html
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-adlp-1/igt@kms_vblank@ts-continuation-dpms-rpm@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_vblank@ts-continuation-dpms-rpm@pipe-d-hdmi-a-3:
>     - shard-bmg:          [PASS][6] -> [SKIP][7] +4 other tests skip
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-5/igt@kms_vblank@ts-continuation-dpms-rpm@pipe-d-hdmi-a-3.html
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-bmg-1/igt@kms_vblank@ts-continuation-dpms-rpm@pipe-d-hdmi-a-3.html
> 
>   * igt@xe_exec_compute_mode@non-blocking:
>     - shard-bmg:          [PASS][8] -> [TIMEOUT][9]
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-8/igt@xe_exec_compute_mode@non-blocking.html
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-bmg-1/igt@xe_exec_compute_mode@non-blocking.html
>     - shard-lnl:          [PASS][10] -> [TIMEOUT][11]
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-lnl-7/igt@xe_exec_compute_mode@non-blocking.html
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-lnl-7/igt@xe_exec_compute_mode@non-blocking.html
>     - shard-adlp:         [PASS][12] -> [FAIL][13]
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-adlp-8/igt@xe_exec_compute_mode@non-blocking.html
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-adlp-1/igt@xe_exec_compute_mode@non-blocking.html
> 
>   * igt@xe_exec_reset@cm-gt-reset:
>     - shard-bmg:          [PASS][14] -> [FAIL][15]
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-4/igt@xe_exec_reset@cm-gt-reset.html
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-bmg-7/igt@xe_exec_reset@cm-gt-reset.html
> 

I was able to recreate the concerning cm-gt-reset failure on a BMG PF.

To me it looks like VLK-74448 as once I (randomly) the get machine into
the state where I get failures, the same signature of VLK-74448 starts
to show up too, a driver unload / reload returns the machine to a
working state. IMO we are good to merge this series and follow up on
fixing VLK-74448.

The xe_exec_compute_mode@non-blocking failures as expected given this
test case is no longer valid after this series and I have IGT series to
remove this test here [1].

Matt

[1] https://patchwork.freedesktop.org/series/153082/

>   
> #### Warnings ####
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1:
>     - shard-lnl:          [FAIL][16] ([Intel XE#911]) -> [FAIL][17] +3 other tests fail
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-lnl-3/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:
>     - shard-bmg:          [SKIP][18] ([Intel XE#2312]) -> [ABORT][19]
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html
> 
>   * igt@xe_oa@buffer-size:
>     - shard-dg2-set2:     [SKIP][20] ([Intel XE#4208]) -> [SKIP][21]
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@xe_oa@buffer-size.html
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-433/igt@xe_oa@buffer-size.html
> 
>   * igt@xe_oa@mmio-triggered-reports-read:
>     - shard-adlp:         [SKIP][22] ([Intel XE#5103]) -> [SKIP][23] +1 other test skip
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-adlp-2/igt@xe_oa@mmio-triggered-reports-read.html
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-adlp-9/igt@xe_oa@mmio-triggered-reports-read.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-153589v2_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@core_setmaster@master-drop-set-root:
>     - shard-dg2-set2:     [PASS][24] -> [FAIL][25] ([Intel XE#4208])
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-435/igt@core_setmaster@master-drop-set-root.html
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-434/igt@core_setmaster@master-drop-set-root.html
> 
>   * igt@fbdev@eof:
>     - shard-dg2-set2:     [PASS][26] -> [SKIP][27] ([Intel XE#2134])
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-436/igt@fbdev@eof.html
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-434/igt@fbdev@eof.html
> 
>   * igt@kms_addfb_basic@unused-pitches:
>     - shard-adlp:         NOTRUN -> [DMESG-WARN][28] ([Intel XE#2953] / [Intel XE#4173])
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-adlp-6/igt@kms_addfb_basic@unused-pitches.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition:
>     - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#3279])
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-lnl-5/igt@kms_atomic_transition@plane-all-modeset-transition.html
> 
>   * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][30] ([Intel XE#316]) +1 other test skip
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-464/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html
> 
>   * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
>     - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#2327]) +4 other tests skip
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-bmg-1/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
>     - shard-adlp:         NOTRUN -> [SKIP][32] ([Intel XE#1124]) +1 other test skip
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-adlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
>     - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#3658])
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_big_fb@y-tiled-16bpp-rotate-90:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][34] ([Intel XE#1124]) +1 other test skip
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-436/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html
>     - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#1124]) +2 other tests skip
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-lnl-3/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html
> 
>   * igt@kms_big_fb@y-tiled-8bpp-rotate-90:
>     - shard-adlp:         NOTRUN -> [SKIP][36] ([Intel XE#316])
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-adlp-3/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html
> 
>   * igt@kms_big_fb@y-tiled-addfb:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][37] ([Intel XE#619])
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-436/igt@kms_big_fb@y-tiled-addfb.html
>     - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#1467])
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-lnl-4/igt@kms_big_fb@y-tiled-addfb.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
>     - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#1124]) +9 other tests skip
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-bmg-5/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb:
>     - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#2328]) +1 other test skip
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-bmg-7/igt@kms_big_fb@yf-tiled-addfb.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
>     - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#607])
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-bmg-3/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
> 
>   * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
>     - shard-adlp:         NOTRUN -> [SKIP][42] ([Intel XE#2191])
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-adlp-4/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html
>     - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#2191])
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-lnl-5/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html
> 
>   * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
>     - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#2314] / [Intel XE#2894]) +1 other test skip
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-bmg-8/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html
> 
>   * igt@kms_bw@linear-tiling-3-displays-3840x2160p:
>     - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#367])
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-bmg-2/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html
> 
>   * igt@kms_ccs@bad-aux-stride-yf-tiled-ccs@pipe-b-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][46] ([Intel XE#787]) +14 other tests skip
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-adlp-8/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][47] ([Intel XE#787]) +195 other tests skip
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-435/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs:
>     - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#2887]) +8 other tests skip
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-lnl-8/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs.html
> 
>   * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][49] ([Intel XE#455] / [Intel XE#787]) +33 other tests skip
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-463/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:
>     - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#2887]) +15 other tests skip
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-bmg-1/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:
>     - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#3432])
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html
>     - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#3432])
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-lnl-8/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
>     - shard-adlp:         NOTRUN -> [SKIP][53] ([Intel XE#2907])
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-adlp-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
>     - shard-bmg:          NOTRUN -> [FAIL][54] ([Intel XE#5376]) +1 other test fail
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-bmg-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][55] ([Intel XE#2907])
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#2669]) +3 other tests skip
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-lnl-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-edp-1.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-b-hdmi-a-3:
>     - shard-bmg:          NOTRUN -> [FAIL][57] ([Intel XE#5941])
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-bmg-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-b-hdmi-a-3.html
> 
>   * igt@kms_ccs@random-ccs-data-y-tiled-ccs:
>     - shard-adlp:         NOTRUN -> [SKIP][58] ([Intel XE#455] / [Intel XE#787]) +9 other tests skip
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-adlp-2/igt@kms_ccs@random-ccs-data-y-tiled-ccs.html
> 
>   * igt@kms_cdclk@mode-transition-all-outputs:
>     - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#2724]) +1 other test skip
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-bmg-5/igt@kms_cdclk@mode-transition-all-outputs.html
> 
>   * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][60] ([Intel XE#4416]) +3 other tests skip
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-466/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html
> 
>   * igt@kms_chamelium_color@ctm-blue-to-red:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][61] ([Intel XE#306])
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-433/igt@kms_chamelium_color@ctm-blue-to-red.html
> 
>   * igt@kms_chamelium_color@ctm-green-to-red:
>     - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#2325]) +1 other test skip
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-bmg-4/igt@kms_chamelium_color@ctm-green-to-red.html
>     - shard-lnl:          NOTRUN -> [SKIP][63] ([Intel XE#306])
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-lnl-3/igt@kms_chamelium_color@ctm-green-to-red.html
> 
>   * igt@kms_chamelium_edid@hdmi-mode-timings:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][64] ([Intel XE#373]) +7 other tests skip
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-436/igt@kms_chamelium_edid@hdmi-mode-timings.html
> 
>   * igt@kms_chamelium_frames@vga-frame-dump:
>     - shard-adlp:         NOTRUN -> [SKIP][65] ([Intel XE#373]) +2 other tests skip
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-adlp-9/igt@kms_chamelium_frames@vga-frame-dump.html
> 
>   * igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
>     - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#2252]) +9 other tests skip
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-bmg-6/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html
> 
>   * igt@kms_chamelium_hpd@dp-hpd-fast:
>     - shard-lnl:          NOTRUN -> [SKIP][67] ([Intel XE#373]) +4 other tests skip
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-lnl-5/igt@kms_chamelium_hpd@dp-hpd-fast.html
> 
>   * igt@kms_content_protection@lic-type-0@pipe-a-dp-2:
>     - shard-bmg:          NOTRUN -> [FAIL][68] ([Intel XE#1178])
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-bmg-3/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html
> 
>   * igt@kms_content_protection@srm@pipe-a-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][69] ([Intel XE#1178]) +2 other tests fail
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-464/igt@kms_content_protection@srm@pipe-a-dp-4.html
> 
>   * igt@kms_content_protection@type1:
>     - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#2341])
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-bmg-2/igt@kms_content_protection@type1.html
> 
>   * igt@kms_content_protection@uevent@pipe-a-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][71] ([Intel XE#1188])
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-464/igt@kms_content_protection@uevent@pipe-a-dp-4.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-32x32:
>     - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#2320]) +2 other tests skip
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-bmg-6/igt@kms_cursor_crc@cursor-offscreen-32x32.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-512x170:
>     - shard-bmg:          NOTRUN -> [SKIP][73] ([Intel XE#2321])
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-bmg-8/igt@kms_cursor_crc@cursor-onscreen-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-32x32:
>     - shard-lnl:          NOTRUN -> [SKIP][74] ([Intel XE#1424])
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-lnl-1/igt@kms_cursor_crc@cursor-sliding-32x32.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-512x170:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][75] ([Intel XE#308])
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-435/igt@kms_cursor_crc@cursor-sliding-512x170.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:
>     - shard-adlp:         NOTRUN -> [SKIP][76] ([Intel XE#309]) +1 other test skip
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-adlp-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
>     - shard-bmg:          [PASS][77] -> [SKIP][78] ([Intel XE#2291]) +2 other tests skip
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
>     - shard-lnl:          NOTRUN -> [SKIP][79] ([Intel XE#309]) +1 other test skip
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-lnl-3/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
>     - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#2291])
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
>     - shard-bmg:          [PASS][81] -> [FAIL][82] ([Intel XE#1475])
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
> 
>   * igt@kms_display_modes@extended-mode-basic:
>     - shard-bmg:          NOTRUN -> [SKIP][83] ([Intel XE#4302])
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html
> 
>   * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:
>     - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#1340])
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-bmg-3/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3.html
> 
>   * igt@kms_dp_link_training@non-uhbr-mst:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][85] ([Intel XE#4354])
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-463/igt@kms_dp_link_training@non-uhbr-mst.html
>     - shard-lnl:          NOTRUN -> [SKIP][86] ([Intel XE#4354])
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-lnl-1/igt@kms_dp_link_training@non-uhbr-mst.html
>     - shard-adlp:         NOTRUN -> [SKIP][87] ([Intel XE#4354])
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-adlp-4/igt@kms_dp_link_training@non-uhbr-mst.html
> 
>   * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
>     - shard-adlp:         NOTRUN -> [SKIP][88] ([Intel XE#310]) +1 other test skip
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-adlp-2/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html
> 
>   * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
>     - shard-lnl:          NOTRUN -> [SKIP][89] ([Intel XE#1421]) +3 other tests skip
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-lnl-1/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html
> 
>   * igt@kms_flip@2x-nonexisting-fb:
>     - shard-bmg:          [PASS][90] -> [SKIP][91] ([Intel XE#2316]) +3 other tests skip
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-3/igt@kms_flip@2x-nonexisting-fb.html
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb.html
> 
>   * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
>     - shard-bmg:          NOTRUN -> [SKIP][92] ([Intel XE#2316]) +3 other tests skip
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-bmg-6/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html
> 
>   * igt@kms_flip@basic-flip-vs-wf_vblank:
>     - shard-adlp:         NOTRUN -> [DMESG-WARN][93] ([Intel XE#4543]) +1 other test dmesg-warn
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-adlp-9/igt@kms_flip@basic-flip-vs-wf_vblank.html
> 
>   * igt@kms_flip@busy-flip:
>     - shard-dg2-set2:     [PASS][94] -> [SKIP][95] ([Intel XE#4208] / [i915#2575]) +76 other tests skip
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-436/igt@kms_flip@busy-flip.html
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-434/igt@kms_flip@busy-flip.html
> 
>   * igt@kms_flip@flip-vs-panning-interruptible:
>     - shard-adlp:         [PASS][96] -> [DMESG-WARN][97] ([Intel XE#4543] / [Intel XE#5208]) +1 other test dmesg-warn
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-adlp-9/igt@kms_flip@flip-vs-panning-interruptible.html
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-adlp-1/igt@kms_flip@flip-vs-panning-interruptible.html
> 
>   * igt@kms_flip@flip-vs-panning-interruptible@b-hdmi-a1:
>     - shard-adlp:         [PASS][98] -> [DMESG-WARN][99] ([Intel XE#4543]) +9 other tests dmesg-warn
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-adlp-9/igt@kms_flip@flip-vs-panning-interruptible@b-hdmi-a1.html
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-adlp-1/igt@kms_flip@flip-vs-panning-interruptible@b-hdmi-a1.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
>     - shard-dg2-set2:     [PASS][100] -> [SKIP][101] ([Intel XE#4208]) +151 other tests skip
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
>     - shard-lnl:          NOTRUN -> [SKIP][102] ([Intel XE#1401] / [Intel XE#1745]) +1 other test skip
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
>     - shard-bmg:          NOTRUN -> [SKIP][103] ([Intel XE#2293] / [Intel XE#2380])
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
>     - shard-lnl:          NOTRUN -> [SKIP][104] ([Intel XE#1401]) +1 other test skip
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
>     - shard-bmg:          NOTRUN -> [SKIP][105] ([Intel XE#2293])
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode:
>     - shard-adlp:         NOTRUN -> [SKIP][106] ([Intel XE#455]) +3 other tests skip
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:
>     - shard-lnl:          NOTRUN -> [SKIP][107] ([Intel XE#1397] / [Intel XE#1745]) +1 other test skip
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode:
>     - shard-lnl:          NOTRUN -> [SKIP][108] ([Intel XE#1397]) +1 other test skip
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode:
>     - shard-adlp:         NOTRUN -> [DMESG-FAIL][109] ([Intel XE#4543] / [Intel XE#4921]) +1 other test dmesg-fail
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-adlp-3/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][110] ([Intel XE#455]) +14 other tests skip
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][111] ([Intel XE#2311]) +27 other tests skip
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:
>     - shard-adlp:         NOTRUN -> [SKIP][112] ([Intel XE#651]) +2 other tests skip
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][113] ([Intel XE#651]) +15 other tests skip
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html
>     - shard-lnl:          NOTRUN -> [SKIP][114] ([Intel XE#651]) +3 other tests skip
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][115] ([Intel XE#5390]) +13 other tests skip
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:
>     - shard-adlp:         NOTRUN -> [DMESG-FAIL][116] ([Intel XE#4543]) +2 other tests dmesg-fail
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
>     - shard-dg2-set2:     [PASS][117] -> [SKIP][118] ([Intel XE#2351] / [Intel XE#4208]) +9 other tests skip
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:
>     - shard-adlp:         [PASS][119] -> [DMESG-FAIL][120] ([Intel XE#4543]) +8 other tests dmesg-fail
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-render:
>     - shard-lnl:          NOTRUN -> [SKIP][121] ([Intel XE#656]) +17 other tests skip
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][122] ([Intel XE#2313]) +33 other tests skip
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:
>     - shard-adlp:         NOTRUN -> [SKIP][123] ([Intel XE#653]) +5 other tests skip
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-adlp-9/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][124] ([Intel XE#2351] / [Intel XE#4208]) +6 other tests skip
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][125] ([Intel XE#653]) +19 other tests skip
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][126] ([Intel XE#2312]) +5 other tests skip
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
>     - shard-adlp:         NOTRUN -> [SKIP][127] ([Intel XE#656]) +9 other tests skip
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
> 
>   * igt@kms_hdr@static-swap:
>     - shard-bmg:          NOTRUN -> [SKIP][128] ([Intel XE#1503])
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-bmg-6/igt@kms_hdr@static-swap.html
> 
>   * igt@kms_hdr@static-toggle-suspend:
>     - shard-bmg:          [PASS][129] -> [SKIP][130] ([Intel XE#1503]) +1 other test skip
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-5/igt@kms_hdr@static-toggle-suspend.html
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-bmg-6/igt@kms_hdr@static-toggle-suspend.html
> 
>   * igt@kms_joiner@basic-ultra-joiner:
>     - shard-bmg:          NOTRUN -> [SKIP][131] ([Intel XE#2927])
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-bmg-3/igt@kms_joiner@basic-ultra-joiner.html
> 
>   * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
>     - shard-bmg:          NOTRUN -> [SKIP][132] ([Intel XE#4329])
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-bmg-7/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html
> 
>   * igt@kms_plane@plane-panning-bottom-right-suspend:
>     - shard-adlp:         [PASS][133] -> [DMESG-WARN][134] ([Intel XE#2953] / [Intel XE#4173]) +5 other tests dmesg-warn
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-adlp-9/igt@kms_plane@plane-panning-bottom-right-suspend.html
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-adlp-3/igt@kms_plane@plane-panning-bottom-right-suspend.html
> 
>   * igt@kms_plane_lowres@tiling-y:
>     - shard-lnl:          NOTRUN -> [SKIP][135] ([Intel XE#599])
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-lnl-7/igt@kms_plane_lowres@tiling-y.html
>     - shard-bmg:          NOTRUN -> [SKIP][136] ([Intel XE#2393])
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-bmg-3/igt@kms_plane_lowres@tiling-y.html
> 
>   * igt@kms_plane_multiple@2x-tiling-none:
>     - shard-lnl:          NOTRUN -> [SKIP][137] ([Intel XE#4596])
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-lnl-3/igt@kms_plane_multiple@2x-tiling-none.html
>     - shard-bmg:          NOTRUN -> [SKIP][138] ([Intel XE#4596])
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-none.html
> 
>   * igt@kms_plane_multiple@tiling-y:
>     - shard-bmg:          NOTRUN -> [SKIP][139] ([Intel XE#5020])
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-bmg-3/igt@kms_plane_multiple@tiling-y.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][140] ([Intel XE#4208] / [i915#2575]) +19 other tests skip
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25:
>     - shard-lnl:          NOTRUN -> [SKIP][141] ([Intel XE#2763]) +3 other tests skip
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-lnl-7/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html
> 
>   * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:
>     - shard-bmg:          NOTRUN -> [SKIP][142] ([Intel XE#2763]) +4 other tests skip
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-bmg-8/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a.html
> 
>   * igt@kms_pm_dc@dc6-dpms:
>     - shard-lnl:          [PASS][143] -> [FAIL][144] ([Intel XE#718]) +1 other test fail
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-lnl-1/igt@kms_pm_dc@dc6-dpms.html
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-lnl-5/igt@kms_pm_dc@dc6-dpms.html
> 
>   * igt@kms_pm_rpm@dpms-lpsp:
>     - shard-bmg:          NOTRUN -> [SKIP][145] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836])
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-bmg-3/igt@kms_pm_rpm@dpms-lpsp.html
> 
>   * igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][146] ([Intel XE#1406] / [Intel XE#1489]) +4 other tests skip
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-435/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html
> 
>   * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:
>     - shard-lnl:          NOTRUN -> [SKIP][147] ([Intel XE#1406] / [Intel XE#2893])
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-lnl-1/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
>     - shard-adlp:         NOTRUN -> [SKIP][148] ([Intel XE#1406] / [Intel XE#1489]) +1 other test skip
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-adlp-3/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html
>     - shard-lnl:          NOTRUN -> [SKIP][149] ([Intel XE#1406] / [Intel XE#2893] / [Intel XE#4608])
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-lnl-3/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][150] ([Intel XE#1406] / [Intel XE#4608]) +2 other tests skip
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-lnl-3/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1.html
> 
>   * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
>     - shard-bmg:          NOTRUN -> [SKIP][151] ([Intel XE#1406] / [Intel XE#1489]) +6 other tests skip
>    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-bmg-5/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html
> 
>   * igt@kms_psr@fbc-psr2-primary-render:
>     - shard-lnl:          NOTRUN -> [SKIP][152] ([Intel XE#1406]) +3 other tests skip
>    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-lnl-4/igt@kms_psr@fbc-psr2-primary-render.html
> 
>   * igt@kms_psr@fbc-psr2-primary-render@edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][153] ([Intel XE#1406] / [Intel XE#4609])
>    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-lnl-4/igt@kms_psr@fbc-psr2-primary-render@edp-1.html
> 
>   * igt@kms_psr@psr-dpms:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][154] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) +10 other tests skip
>    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-464/igt@kms_psr@psr-dpms.html
> 
>   * igt@kms_psr@psr2-dpms:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][155] ([Intel XE#1406] / [Intel XE#4208])
>    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-434/igt@kms_psr@psr2-dpms.html
> 
>   * igt@kms_psr@psr2-suspend:
>     - shard-adlp:         NOTRUN -> [SKIP][156] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) +4 other tests skip
>    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-adlp-6/igt@kms_psr@psr2-suspend.html
>     - shard-bmg:          NOTRUN -> [SKIP][157] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +18 other tests skip
>    [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-bmg-7/igt@kms_psr@psr2-suspend.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
>     - shard-bmg:          NOTRUN -> [SKIP][158] ([Intel XE#3414] / [Intel XE#3904])
>    [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-bmg-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html
> 
>   * igt@kms_scaling_modes@scaling-mode-full-aspect:
>     - shard-bmg:          NOTRUN -> [SKIP][159] ([Intel XE#2413])
>    [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-bmg-3/igt@kms_scaling_modes@scaling-mode-full-aspect.html
> 
>   * igt@kms_setmode@clone-exclusive-crtc:
>     - shard-lnl:          NOTRUN -> [SKIP][160] ([Intel XE#1435])
>    [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-lnl-4/igt@kms_setmode@clone-exclusive-crtc.html
> 
>   * igt@kms_vblank@ts-continuation-dpms-rpm@pipe-d-hdmi-a-1:
>     - shard-adlp:         [PASS][161] -> [SKIP][162] ([Intel XE#455]) +1 other test skip
>    [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-adlp-3/igt@kms_vblank@ts-continuation-dpms-rpm@pipe-d-hdmi-a-1.html
>    [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-adlp-1/igt@kms_vblank@ts-continuation-dpms-rpm@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_vrr@cmrr@pipe-a-edp-1:
>     - shard-lnl:          [PASS][163] -> [FAIL][164] ([Intel XE#4459]) +1 other test fail
>    [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-lnl-8/igt@kms_vrr@cmrr@pipe-a-edp-1.html
>    [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-lnl-3/igt@kms_vrr@cmrr@pipe-a-edp-1.html
> 
>   * igt@kms_vrr@flipline:
>     - shard-lnl:          [PASS][165] -> [FAIL][166] ([Intel XE#4227]) +1 other test fail
>    [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-lnl-8/igt@kms_vrr@flipline.html
>    [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-lnl-7/igt@kms_vrr@flipline.html
> 
>   * igt@kms_vrr@seamless-rr-switch-virtual:
>     - shard-bmg:          NOTRUN -> [SKIP][167] ([Intel XE#1499]) +2 other tests skip
>    [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-bmg-8/igt@kms_vrr@seamless-rr-switch-virtual.html
> 
>   * igt@xe_ccs@ctrl-surf-copy-new-ctx:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][168] ([Intel XE#4208]) +103 other tests skip
>    [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-434/igt@xe_ccs@ctrl-surf-copy-new-ctx.html
>     - shard-adlp:         NOTRUN -> [SKIP][169] ([Intel XE#455] / [Intel XE#488] / [Intel XE#5607])
>    [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-adlp-9/igt@xe_ccs@ctrl-surf-copy-new-ctx.html
> 
>   * igt@xe_compute@ccs-mode-basic:
>     - shard-bmg:          NOTRUN -> [FAIL][170] ([Intel XE#5794])
>    [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-bmg-3/igt@xe_compute@ccs-mode-basic.html
> 
>   * igt@xe_eudebug@basic-vm-access-userptr-faultable:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][171] ([Intel XE#4837]) +4 other tests skip
>    [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-433/igt@xe_eudebug@basic-vm-access-userptr-faultable.html
>     - shard-lnl:          NOTRUN -> [SKIP][172] ([Intel XE#4837]) +4 other tests skip
>    [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-lnl-3/igt@xe_eudebug@basic-vm-access-userptr-faultable.html
> 
>   * igt@xe_eudebug@discovery-empty:
>     - shard-bmg:          NOTRUN -> [SKIP][173] ([Intel XE#4837]) +15 other tests skip
>    [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-bmg-4/igt@xe_eudebug@discovery-empty.html
> 
>   * igt@xe_eudebug@vm-bind-clear:
>     - shard-adlp:         NOTRUN -> [SKIP][174] ([Intel XE#4837] / [Intel XE#5565]) +2 other tests skip
>    [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-adlp-6/igt@xe_eudebug@vm-bind-clear.html
> 
>   * igt@xe_eudebug_sriov@deny-eudebug:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][175] ([Intel XE#4518])
>    [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-435/igt@xe_eudebug_sriov@deny-eudebug.html
>     - shard-lnl:          NOTRUN -> [SKIP][176] ([Intel XE#4518])
>    [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-lnl-2/igt@xe_eudebug_sriov@deny-eudebug.html
>     - shard-bmg:          NOTRUN -> [SKIP][177] ([Intel XE#5793])
>    [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-bmg-4/igt@xe_eudebug_sriov@deny-eudebug.html
> 
>   * igt@xe_evict@evict-small-multi-vm:
>     - shard-lnl:          NOTRUN -> [SKIP][178] ([Intel XE#688])
>    [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-lnl-8/igt@xe_evict@evict-small-multi-vm.html
> 
>   * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate:
>     - shard-bmg:          NOTRUN -> [SKIP][179] ([Intel XE#2322]) +10 other tests skip
>    [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-bmg-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:
>     - shard-lnl:          NOTRUN -> [SKIP][180] ([Intel XE#1392]) +5 other tests skip
>    [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-lnl-3/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:
>     - shard-dg2-set2:     [PASS][181] -> [SKIP][182] ([Intel XE#1392]) +1 other test skip
>    [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-433/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html
>    [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html
> 
>   * igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:
>     - shard-adlp:         NOTRUN -> [SKIP][183] ([Intel XE#1392] / [Intel XE#5575]) +3 other tests skip
>    [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-adlp-3/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html
> 
>   * igt@xe_exec_fault_mode@many-userptr-invalidate-race:
>     - shard-adlp:         NOTRUN -> [SKIP][184] ([Intel XE#288] / [Intel XE#5561]) +3 other tests skip
>    [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-adlp-3/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html
> 
>   * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][185] ([Intel XE#288]) +14 other tests skip
>    [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-432/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html
> 
>   * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][186] ([Intel XE#2360])
>    [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-435/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html
> 
>   * igt@xe_exec_reset@parallel-gt-reset:
>     - shard-adlp:         [PASS][187] -> [DMESG-WARN][188] ([Intel XE#3876])
>    [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-adlp-1/igt@xe_exec_reset@parallel-gt-reset.html
>    [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-adlp-1/igt@xe_exec_reset@parallel-gt-reset.html
> 
>   * igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][189] ([Intel XE#4915]) +134 other tests skip
>    [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-433/igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc.html
> 
>   * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-free-huge:
>     - shard-lnl:          NOTRUN -> [SKIP][190] ([Intel XE#4943]) +9 other tests skip
>    [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-lnl-2/igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-free-huge.html
> 
>   * igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset:
>     - shard-adlp:         NOTRUN -> [SKIP][191] ([Intel XE#4915]) +66 other tests skip
>    [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-adlp-8/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html
> 
>   * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-huge:
>     - shard-bmg:          NOTRUN -> [SKIP][192] ([Intel XE#4943]) +18 other tests skip
>    [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-bmg-3/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-huge.html
> 
>   * igt@xe_module_load@load:
>     - shard-lnl:          ([PASS][193], [PASS][194], [PASS][195], [PASS][196], [PASS][197], [PASS][198], [PASS][199], [PASS][200], [PASS][201], [PASS][202], [PASS][203], [PASS][204], [PASS][205], [PASS][206], [PASS][207], [PASS][208], [PASS][209], [PASS][210], [PASS][211], [PASS][212], [PASS][213], [PASS][214], [PASS][215], [PASS][216], [PASS][217]) -> ([PASS][218], [PASS][219], [PASS][220], [PASS][221], [PASS][222], [PASS][223], [PASS][224], [PASS][225], [PASS][226], [PASS][227], [PASS][228], [PASS][229], [PASS][230], [PASS][231], [PASS][232], [PASS][233], [PASS][234], [PASS][235], [SKIP][236], [PASS][237], [PASS][238], [PASS][239], [PASS][240], [PASS][241], [PASS][242], [PASS][243]) ([Intel XE#378])
>    [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-lnl-1/igt@xe_module_load@load.html
>    [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-lnl-2/igt@xe_module_load@load.html
>    [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-lnl-2/igt@xe_module_load@load.html
>    [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-lnl-1/igt@xe_module_load@load.html
>    [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-lnl-3/igt@xe_module_load@load.html
>    [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-lnl-5/igt@xe_module_load@load.html
>    [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-lnl-5/igt@xe_module_load@load.html
>    [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-lnl-5/igt@xe_module_load@load.html
>    [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-lnl-1/igt@xe_module_load@load.html
>    [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-lnl-7/igt@xe_module_load@load.html
>    [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-lnl-7/igt@xe_module_load@load.html
>    [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-lnl-7/igt@xe_module_load@load.html
>    [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-lnl-8/igt@xe_module_load@load.html
>    [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-lnl-8/igt@xe_module_load@load.html
>    [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-lnl-2/igt@xe_module_load@load.html
>    [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-lnl-3/igt@xe_module_load@load.html
>    [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-lnl-3/igt@xe_module_load@load.html
>    [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-lnl-3/igt@xe_module_load@load.html
>    [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-lnl-5/igt@xe_module_load@load.html
>    [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-lnl-4/igt@xe_module_load@load.html
>    [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-lnl-4/igt@xe_module_load@load.html
>    [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-lnl-4/igt@xe_module_load@load.html
>    [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-lnl-4/igt@xe_module_load@load.html
>    [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-lnl-8/igt@xe_module_load@load.html
>    [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-lnl-8/igt@xe_module_load@load.html
>    [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-lnl-4/igt@xe_module_load@load.html
>    [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-lnl-4/igt@xe_module_load@load.html
>    [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-lnl-4/igt@xe_module_load@load.html
>    [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-lnl-3/igt@xe_module_load@load.html
>    [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-lnl-3/igt@xe_module_load@load.html
>    [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-lnl-5/igt@xe_module_load@load.html
>    [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-lnl-5/igt@xe_module_load@load.html
>    [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-lnl-5/igt@xe_module_load@load.html
>    [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-lnl-3/igt@xe_module_load@load.html
>    [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-lnl-3/igt@xe_module_load@load.html
>    [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-lnl-5/igt@xe_module_load@load.html
>    [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-lnl-1/igt@xe_module_load@load.html
>    [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-lnl-1/igt@xe_module_load@load.html
>    [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-lnl-1/igt@xe_module_load@load.html
>    [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-lnl-7/igt@xe_module_load@load.html
>    [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-lnl-4/igt@xe_module_load@load.html
>    [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-lnl-8/igt@xe_module_load@load.html
>    [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-lnl-8/igt@xe_module_load@load.html
>    [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-lnl-5/igt@xe_module_load@load.html
>    [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-lnl-2/igt@xe_module_load@load.html
>    [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-lnl-2/igt@xe_module_load@load.html
>    [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-lnl-2/igt@xe_module_load@load.html
>    [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-lnl-8/igt@xe_module_load@load.html
>    [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-lnl-7/igt@xe_module_load@load.html
>    [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-lnl-1/igt@xe_module_load@load.html
>    [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-lnl-7/igt@xe_module_load@load.html
>     - shard-bmg:          ([PASS][244], [PASS][245], [PASS][246], [PASS][247], [PASS][248], [PASS][249], [PASS][250], [PASS][251], [PASS][252], [PASS][253], [PASS][254], [PASS][255], [PASS][256], [PASS][257], [PASS][258], [PASS][259], [PASS][260], [PASS][261], [PASS][262], [PASS][263], [PASS][264], [PASS][265]) -> ([SKIP][266], [PASS][267], [PASS][268], [PASS][269], [PASS][270], [PASS][271], [PASS][272], [PASS][273], [PASS][274], [PASS][275], [PASS][276], [PASS][277], [PASS][278], [PASS][279], [PASS][280], [PASS][281], [PASS][282], [PASS][283], [PASS][284], [PASS][285], [PASS][286], [PASS][287], [PASS][288], [PASS][289]) ([Intel XE#2457])
>    [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-3/igt@xe_module_load@load.html
>    [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-3/igt@xe_module_load@load.html
>    [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-1/igt@xe_module_load@load.html
>    [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-6/igt@xe_module_load@load.html
>    [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-8/igt@xe_module_load@load.html
>    [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-5/igt@xe_module_load@load.html
>    [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-6/igt@xe_module_load@load.html
>    [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-3/igt@xe_module_load@load.html
>    [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-6/igt@xe_module_load@load.html
>    [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-6/igt@xe_module_load@load.html
>    [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-2/igt@xe_module_load@load.html
>    [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-2/igt@xe_module_load@load.html
>    [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-4/igt@xe_module_load@load.html
>    [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-4/igt@xe_module_load@load.html
>    [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-7/igt@xe_module_load@load.html
>    [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-7/igt@xe_module_load@load.html
>    [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-2/igt@xe_module_load@load.html
>    [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-5/igt@xe_module_load@load.html
>    [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-5/igt@xe_module_load@load.html
>    [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-8/igt@xe_module_load@load.html
>    [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-8/igt@xe_module_load@load.html
>    [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-8/igt@xe_module_load@load.html
>    [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-bmg-2/igt@xe_module_load@load.html
>    [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-bmg-6/igt@xe_module_load@load.html
>    [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-bmg-6/igt@xe_module_load@load.html
>    [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-bmg-1/igt@xe_module_load@load.html
>    [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-bmg-4/igt@xe_module_load@load.html
>    [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-bmg-7/igt@xe_module_load@load.html
>    [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-bmg-4/igt@xe_module_load@load.html
>    [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-bmg-5/igt@xe_module_load@load.html
>    [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-bmg-2/igt@xe_module_load@load.html
>    [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-bmg-2/igt@xe_module_load@load.html
>    [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-bmg-8/igt@xe_module_load@load.html
>    [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-bmg-8/igt@xe_module_load@load.html
>    [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-bmg-8/igt@xe_module_load@load.html
>    [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-bmg-5/igt@xe_module_load@load.html
>    [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-bmg-1/igt@xe_module_load@load.html
>    [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-bmg-7/igt@xe_module_load@load.html
>    [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-bmg-7/igt@xe_module_load@load.html
>    [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-bmg-6/igt@xe_module_load@load.html
>    [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-bmg-5/igt@xe_module_load@load.html
>    [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-bmg-6/igt@xe_module_load@load.html
>    [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-bmg-3/igt@xe_module_load@load.html
>    [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-bmg-3/igt@xe_module_load@load.html
>    [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-bmg-3/igt@xe_module_load@load.html
>    [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-bmg-1/igt@xe_module_load@load.html
>     - shard-dg2-set2:     ([PASS][290], [PASS][291], [PASS][292], [PASS][293], [PASS][294], [PASS][295], [PASS][296], [PASS][297], [PASS][298], [PASS][299], [PASS][300], [PASS][301], [PASS][302], [PASS][303], [PASS][304], [PASS][305], [PASS][306], [PASS][307], [PASS][308], [PASS][309], [PASS][310], [PASS][311], [PASS][312], [PASS][313], [PASS][314]) -> ([PASS][315], [PASS][316], [PASS][317], [PASS][318], [PASS][319], [PASS][320], [PASS][321], [PASS][322], [PASS][323], [PASS][324], [PASS][325], [PASS][326], [PASS][327], [PASS][328], [PASS][329], [PASS][330], [PASS][331], [SKIP][332], [PASS][333], [PASS][334], [PASS][335], [PASS][336], [PASS][337], [PASS][338], [PASS][339], [PASS][340]) ([Intel XE#378])
>    [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-466/igt@xe_module_load@load.html
>    [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-436/igt@xe_module_load@load.html
>    [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-433/igt@xe_module_load@load.html
>    [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-433/igt@xe_module_load@load.html
>    [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-435/igt@xe_module_load@load.html
>    [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-463/igt@xe_module_load@load.html
>    [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-433/igt@xe_module_load@load.html
>    [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@xe_module_load@load.html
>    [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-436/igt@xe_module_load@load.html
>    [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-464/igt@xe_module_load@load.html
>    [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-435/igt@xe_module_load@load.html
>    [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-435/igt@xe_module_load@load.html
>    [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@xe_module_load@load.html
>    [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-435/igt@xe_module_load@load.html
>    [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@xe_module_load@load.html
>    [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-436/igt@xe_module_load@load.html
>    [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@xe_module_load@load.html
>    [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-464/igt@xe_module_load@load.html
>    [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-464/igt@xe_module_load@load.html
>    [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-432/igt@xe_module_load@load.html
>    [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-432/igt@xe_module_load@load.html
>    [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-432/igt@xe_module_load@load.html
>    [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@xe_module_load@load.html
>    [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@xe_module_load@load.html
>    [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@xe_module_load@load.html
>    [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-432/igt@xe_module_load@load.html
>    [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-466/igt@xe_module_load@load.html
>    [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-432/igt@xe_module_load@load.html
>    [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-466/igt@xe_module_load@load.html
>    [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-434/igt@xe_module_load@load.html
>    [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-434/igt@xe_module_load@load.html
>    [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-434/igt@xe_module_load@load.html
>    [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-434/igt@xe_module_load@load.html
>    [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-433/igt@xe_module_load@load.html
>    [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-464/igt@xe_module_load@load.html
>    [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-435/igt@xe_module_load@load.html
>    [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-435/igt@xe_module_load@load.html
>    [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-433/igt@xe_module_load@load.html
>    [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-464/igt@xe_module_load@load.html
>    [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-434/igt@xe_module_load@load.html
>    [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-463/igt@xe_module_load@load.html
>    [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-436/igt@xe_module_load@load.html
>    [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-466/igt@xe_module_load@load.html
>    [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-466/igt@xe_module_load@load.html
>    [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-436/igt@xe_module_load@load.html
>    [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-434/igt@xe_module_load@load.html
>    [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-432/igt@xe_module_load@load.html
>    [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-463/igt@xe_module_load@load.html
>    [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-433/igt@xe_module_load@load.html
>    [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-463/igt@xe_module_load@load.html
>    [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-436/igt@xe_module_load@load.html
> 
>   * igt@xe_module_load@reload:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][341] ([Intel XE#4208])
>    [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-434/igt@xe_module_load@reload.html
> 
>   * igt@xe_oa@buffer-fill:
>     - shard-adlp:         NOTRUN -> [SKIP][342] ([Intel XE#3573]) +2 other tests skip
>    [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-adlp-1/igt@xe_oa@buffer-fill.html
> 
>   * igt@xe_oa@syncs-ufence-wait-cfg:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][343] ([Intel XE#3573]) +1 other test skip
>    [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-436/igt@xe_oa@syncs-ufence-wait-cfg.html
> 
>   * igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][344] ([Intel XE#1173]) +1 other test fail
>    [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-436/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html
> 
>   * igt@xe_pm@d3cold-basic:
>     - shard-bmg:          NOTRUN -> [SKIP][345] ([Intel XE#2284])
>    [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-bmg-5/igt@xe_pm@d3cold-basic.html
> 
>   * igt@xe_pm@s3-mocs:
>     - shard-lnl:          NOTRUN -> [SKIP][346] ([Intel XE#584])
>    [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-lnl-5/igt@xe_pm@s3-mocs.html
> 
>   * igt@xe_pmu@fn-engine-activity-sched-if-idle:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][347] ([Intel XE#4650])
>    [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-466/igt@xe_pmu@fn-engine-activity-sched-if-idle.html
> 
>   * igt@xe_pxp@display-black-pxp-fb:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][348] ([Intel XE#4733]) +2 other tests skip
>    [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-464/igt@xe_pxp@display-black-pxp-fb.html
> 
>   * igt@xe_pxp@pxp-termination-key-update-post-termination-irq:
>     - shard-bmg:          NOTRUN -> [SKIP][349] ([Intel XE#4733]) +2 other tests skip
>    [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-bmg-8/igt@xe_pxp@pxp-termination-key-update-post-termination-irq.html
> 
>   * igt@xe_query@multigpu-query-invalid-size:
>     - shard-bmg:          NOTRUN -> [SKIP][350] ([Intel XE#944])
>    [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-bmg-7/igt@xe_query@multigpu-query-invalid-size.html
> 
>   * igt@xe_query@multigpu-query-mem-usage:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][351] ([Intel XE#944])
>    [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-432/igt@xe_query@multigpu-query-mem-usage.html
> 
>   * igt@xe_sriov_auto_provisioning@exclusive-ranges:
>     - shard-lnl:          NOTRUN -> [SKIP][352] ([Intel XE#4130])
>    [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-lnl-1/igt@xe_sriov_auto_provisioning@exclusive-ranges.html
> 
>   * igt@xe_sriov_scheduling@equal-throughput:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][353] ([Intel XE#4351])
>    [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-432/igt@xe_sriov_scheduling@equal-throughput.html
>     - shard-lnl:          NOTRUN -> [SKIP][354] ([Intel XE#4351])
>    [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-lnl-5/igt@xe_sriov_scheduling@equal-throughput.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@fbdev@unaligned-write:
>     - shard-dg2-set2:     [SKIP][355] ([Intel XE#2134]) -> [PASS][356] +1 other test pass
>    [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@fbdev@unaligned-write.html
>    [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-466/igt@fbdev@unaligned-write.html
> 
>   * igt@kms_async_flips@async-flip-suspend-resume@pipe-c-hdmi-a-1:
>     - shard-adlp:         [DMESG-WARN][357] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][358] +3 other tests pass
>    [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-adlp-6/igt@kms_async_flips@async-flip-suspend-resume@pipe-c-hdmi-a-1.html
>    [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-adlp-4/igt@kms_async_flips@async-flip-suspend-resume@pipe-c-hdmi-a-1.html
> 
>   * igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1:
>     - shard-adlp:         [FAIL][359] ([Intel XE#3884]) -> [PASS][360] +1 other test pass
>    [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-adlp-6/igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1.html
>    [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-adlp-4/igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_big_fb@y-tiled-8bpp-rotate-180:
>     - shard-adlp:         [DMESG-FAIL][361] ([Intel XE#4543]) -> [PASS][362] +8 other tests pass
>    [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-adlp-3/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html
>    [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-adlp-1/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
>     - shard-bmg:          [INCOMPLETE][363] ([Intel XE#3862]) -> [PASS][364] +1 other test pass
>    [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
>    [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-2:
>     - shard-dg2-set2:     [INCOMPLETE][365] ([Intel XE#3862]) -> [PASS][366] +1 other test pass
>    [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-2.html
>    [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-2.html
> 
>   * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:
>     - shard-dg2-set2:     [SKIP][367] ([Intel XE#4208] / [i915#2575]) -> [PASS][368] +114 other tests pass
>    [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html
>    [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-466/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
>     - shard-bmg:          [DMESG-WARN][369] ([Intel XE#5354]) -> [PASS][370]
>    [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-2/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
>    [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-bmg-7/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:
>     - shard-bmg:          [SKIP][371] ([Intel XE#2291]) -> [PASS][372] +1 other test pass
>    [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html
>    [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html
> 
>   * igt@kms_dp_aux_dev:
>     - shard-bmg:          [SKIP][373] ([Intel XE#3009]) -> [PASS][374]
>    [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-6/igt@kms_dp_aux_dev.html
>    [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-bmg-8/igt@kms_dp_aux_dev.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank:
>     - shard-bmg:          [SKIP][375] ([Intel XE#2316]) -> [PASS][376] +1 other test pass
>    [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank.html
>    [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible:
>     - shard-lnl:          [FAIL][377] ([Intel XE#301]) -> [PASS][378] +1 other test pass
>    [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
>    [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible:
>     - shard-adlp:         [DMESG-WARN][379] ([Intel XE#4543]) -> [PASS][380] +20 other tests pass
>    [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible.html
>    [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-adlp-4/igt@kms_flip@flip-vs-suspend-interruptible.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling:
>     - shard-dg2-set2:     [SKIP][381] ([Intel XE#2351] / [Intel XE#4208]) -> [PASS][382] +13 other tests pass
>    [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html
>    [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html
> 
>   * igt@kms_hdr@invalid-hdr:
>     - shard-bmg:          [SKIP][383] ([Intel XE#1503]) -> [PASS][384] +1 other test pass
>    [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-5/igt@kms_hdr@invalid-hdr.html
>    [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-bmg-6/igt@kms_hdr@invalid-hdr.html
> 
>   * igt@kms_pm_dc@dc6-psr:
>     - shard-lnl:          [FAIL][385] ([Intel XE#718]) -> [PASS][386]
>    [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html
>    [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-lnl-2/igt@kms_pm_dc@dc6-psr.html
> 
>   * igt@kms_setmode@invalid-clone-single-crtc-stealing:
>     - shard-bmg:          [SKIP][387] ([Intel XE#1435]) -> [PASS][388]
>    [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
>    [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-bmg-8/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
> 
>   * igt@xe_exec_basic@many-null-rebind:
>     - shard-dg2-set2:     [SKIP][389] ([Intel XE#4208]) -> [PASS][390] +241 other tests pass
>    [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@xe_exec_basic@many-null-rebind.html
>    [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-466/igt@xe_exec_basic@many-null-rebind.html
> 
>   * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap:
>     - shard-dg2-set2:     [SKIP][391] ([Intel XE#1392]) -> [PASS][392] +2 other tests pass
>    [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap.html
>    [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-433/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap.html
> 
>   * {igt@xe_exec_system_allocator@many-stride-malloc-prefetch}:
>     - shard-bmg:          [WARN][393] ([Intel XE#5786]) -> [PASS][394]
>    [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-5/igt@xe_exec_system_allocator@many-stride-malloc-prefetch.html
>    [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-bmg-6/igt@xe_exec_system_allocator@many-stride-malloc-prefetch.html
> 
>   * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs@vf-random:
>     - shard-bmg:          [FAIL][395] -> [PASS][396] +2 other tests pass
>    [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-2/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs@vf-random.html
>    [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-bmg-5/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs@vf-random.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
>     - shard-dg2-set2:     [SKIP][397] ([Intel XE#623]) -> [SKIP][398] ([Intel XE#4208] / [i915#2575])
>    [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-435/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
>    [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-434/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
> 
>   * igt@kms_big_fb@linear-16bpp-rotate-90:
>     - shard-dg2-set2:     [SKIP][399] ([Intel XE#316]) -> [SKIP][400] ([Intel XE#2351] / [Intel XE#4208]) +1 other test skip
>    [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-433/igt@kms_big_fb@linear-16bpp-rotate-90.html
>    [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-434/igt@kms_big_fb@linear-16bpp-rotate-90.html
> 
>   * igt@kms_big_fb@linear-32bpp-rotate-90:
>     - shard-dg2-set2:     [SKIP][401] ([Intel XE#4208]) -> [SKIP][402] ([Intel XE#316])
>    [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@kms_big_fb@linear-32bpp-rotate-90.html
>    [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-466/igt@kms_big_fb@linear-32bpp-rotate-90.html
> 
>   * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
>     - shard-dg2-set2:     [SKIP][403] ([Intel XE#316]) -> [SKIP][404] ([Intel XE#4208]) +2 other tests skip
>    [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-436/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html
>    [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-434/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html
> 
>   * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
>     - shard-dg2-set2:     [SKIP][405] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][406] ([Intel XE#316])
>    [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html
>    [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-433/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html
> 
>   * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
>     - shard-dg2-set2:     [SKIP][407] ([Intel XE#1124]) -> [SKIP][408] ([Intel XE#2351] / [Intel XE#4208]) +2 other tests skip
>    [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-464/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html
>    [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-434/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html
> 
>   * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
>     - shard-dg2-set2:     [SKIP][409] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][410] ([Intel XE#607])
>    [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
>    [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-435/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
> 
>   * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
>     - shard-dg2-set2:     [SKIP][411] ([Intel XE#4208]) -> [SKIP][412] ([Intel XE#1124]) +9 other tests skip
>    [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
>    [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-433/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
>     - shard-dg2-set2:     [SKIP][413] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][414] ([Intel XE#1124]) +4 other tests skip
>    [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
>    [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>     - shard-dg2-set2:     [SKIP][415] ([Intel XE#1124]) -> [SKIP][416] ([Intel XE#4208]) +4 other tests skip
>    [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
>    [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
>     - shard-dg2-set2:     [SKIP][417] ([Intel XE#2191]) -> [SKIP][418] ([Intel XE#4208] / [i915#2575])
>    [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-463/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html
>    [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-434/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html
> 
>   * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
>     - shard-dg2-set2:     [SKIP][419] ([Intel XE#4208] / [i915#2575]) -> [SKIP][420] ([Intel XE#2191]) +1 other test skip
>    [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html
>    [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-463/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html
> 
>   * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
>     - shard-dg2-set2:     [SKIP][421] ([Intel XE#367]) -> [SKIP][422] ([Intel XE#4208] / [i915#2575]) +2 other tests skip
>    [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-433/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
>    [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-434/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
> 
>   * igt@kms_bw@linear-tiling-3-displays-2560x1440p:
>     - shard-dg2-set2:     [SKIP][423] ([Intel XE#4208] / [i915#2575]) -> [SKIP][424] ([Intel XE#367]) +3 other tests skip
>    [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html
>    [424]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-466/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html
> 
>   * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
>     - shard-dg2-set2:     [SKIP][425] ([Intel XE#4208]) -> [SKIP][426] ([Intel XE#455] / [Intel XE#787]) +11 other tests skip
>    [425]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html
>    [426]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-463/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
>     - shard-dg2-set2:     [SKIP][427] ([Intel XE#2907]) -> [SKIP][428] ([Intel XE#4208])
>    [427]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-432/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html
>    [428]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-434/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
>     - shard-dg2-set2:     [SKIP][429] ([Intel XE#4208]) -> [SKIP][430] ([Intel XE#2907]) +2 other tests skip
>    [429]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html
>    [430]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-435/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs:
>     - shard-dg2-set2:     [SKIP][431] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][432] ([Intel XE#4208]) +11 other tests skip
>    [431]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs.html
>    [432]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:
>     - shard-dg2-set2:     [SKIP][433] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][434] ([Intel XE#455] / [Intel XE#787]) +2 other tests skip
>    [433]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html
>    [434]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-436/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
>     - shard-dg2-set2:     [SKIP][435] ([Intel XE#4208]) -> [SKIP][436] ([Intel XE#3442]) +1 other test skip
>    [435]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
>    [436]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
>     - shard-dg2-set2:     [INCOMPLETE][437] ([Intel XE#1727] / [Intel XE#3113]) -> [SKIP][438] ([Intel XE#2351] / [Intel XE#4208])
>    [437]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
>    [438]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
>     - shard-dg2-set2:     [INCOMPLETE][439] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345]) -> [SKIP][440] ([Intel XE#4208])
>    [439]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
>    [440]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
>     - shard-dg2-set2:     [INCOMPLETE][441] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522]) -> [SKIP][442] ([Intel XE#4208])
>    [441]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
>    [442]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
> 
>   * igt@kms_ccs@random-ccs-data-yf-tiled-ccs:
>     - shard-dg2-set2:     [SKIP][443] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][444] ([Intel XE#2351] / [Intel XE#4208])
>    [443]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-433/igt@kms_ccs@random-ccs-data-yf-tiled-ccs.html
>    [444]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-434/igt@kms_ccs@random-ccs-data-yf-tiled-ccs.html
> 
>   * igt@kms_chamelium_color@ctm-limited-range:
>     - shard-dg2-set2:     [SKIP][445] ([Intel XE#4208] / [i915#2575]) -> [SKIP][446] ([Intel XE#306])
>    [445]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@kms_chamelium_color@ctm-limited-range.html
>    [446]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-432/igt@kms_chamelium_color@ctm-limited-range.html
> 
>   * igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
>     - shard-dg2-set2:     [SKIP][447] ([Intel XE#373]) -> [SKIP][448] ([Intel XE#4208] / [i915#2575]) +8 other tests skip
>    [447]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-435/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html
>    [448]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-434/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html
> 
>   * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
>     - shard-dg2-set2:     [SKIP][449] ([Intel XE#4208] / [i915#2575]) -> [SKIP][450] ([Intel XE#373]) +10 other tests skip
>    [449]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html
>    [450]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-432/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html
> 
>   * igt@kms_content_protection@atomic-dpms:
>     - shard-dg2-set2:     [FAIL][451] ([Intel XE#1178]) -> [SKIP][452] ([Intel XE#4208] / [i915#2575])
>    [451]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-432/igt@kms_content_protection@atomic-dpms.html
>    [452]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-434/igt@kms_content_protection@atomic-dpms.html
> 
>   * igt@kms_content_protection@dp-mst-type-0:
>     - shard-dg2-set2:     [SKIP][453] ([Intel XE#307]) -> [SKIP][454] ([Intel XE#4208] / [i915#2575])
>    [453]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-433/igt@kms_content_protection@dp-mst-type-0.html
>    [454]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-434/igt@kms_content_protection@dp-mst-type-0.html
> 
>   * igt@kms_content_protection@legacy:
>     - shard-bmg:          [FAIL][455] ([Intel XE#1178]) -> [SKIP][456] ([Intel XE#2341])
>    [455]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-5/igt@kms_content_protection@legacy.html
>    [456]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-bmg-6/igt@kms_content_protection@legacy.html
> 
>   * igt@kms_content_protection@lic-type-0:
>     - shard-bmg:          [SKIP][457] ([Intel XE#2341]) -> [FAIL][458] ([Intel XE#1178])
>    [457]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-6/igt@kms_content_protection@lic-type-0.html
>    [458]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-bmg-3/igt@kms_content_protection@lic-type-0.html
> 
>   * igt@kms_content_protection@uevent:
>     - shard-dg2-set2:     [SKIP][459] ([Intel XE#4208] / [i915#2575]) -> [FAIL][460] ([Intel XE#1188])
>    [459]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@kms_content_protection@uevent.html
>    [460]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-464/igt@kms_content_protection@uevent.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-512x170:
>     - shard-dg2-set2:     [SKIP][461] ([Intel XE#308]) -> [SKIP][462] ([Intel XE#4208] / [i915#2575]) +1 other test skip
>    [461]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-432/igt@kms_cursor_crc@cursor-offscreen-512x170.html
>    [462]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-434/igt@kms_cursor_crc@cursor-offscreen-512x170.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
>     - shard-dg2-set2:     [SKIP][463] ([Intel XE#4208] / [i915#2575]) -> [SKIP][464] ([Intel XE#323])
>    [463]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
>    [464]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-464/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
> 
>   * igt@kms_dp_link_training@uhbr-sst:
>     - shard-dg2-set2:     [SKIP][465] ([Intel XE#4208]) -> [SKIP][466] ([Intel XE#4356]) +1 other test skip
>    [465]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@kms_dp_link_training@uhbr-sst.html
>    [466]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-433/igt@kms_dp_link_training@uhbr-sst.html
> 
>   * igt@kms_dp_linktrain_fallback@dsc-fallback:
>     - shard-dg2-set2:     [SKIP][467] ([Intel XE#4331]) -> [SKIP][468] ([Intel XE#4208])
>    [467]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-466/igt@kms_dp_linktrain_fallback@dsc-fallback.html
>    [468]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-434/igt@kms_dp_linktrain_fallback@dsc-fallback.html
> 
>   * igt@kms_dsc@dsc-with-bpc:
>     - shard-dg2-set2:     [SKIP][469] ([Intel XE#455]) -> [SKIP][470] ([Intel XE#4208]) +2 other tests skip
>    [469]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-436/igt@kms_dsc@dsc-with-bpc.html
>    [470]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-434/igt@kms_dsc@dsc-with-bpc.html
> 
>   * igt@kms_fbcon_fbt@psr-suspend:
>     - shard-dg2-set2:     [SKIP][471] ([Intel XE#776]) -> [SKIP][472] ([Intel XE#4208])
>    [471]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-435/igt@kms_fbcon_fbt@psr-suspend.html
>    [472]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-434/igt@kms_fbcon_fbt@psr-suspend.html
> 
>   * igt@kms_feature_discovery@display-3x:
>     - shard-dg2-set2:     [SKIP][473] ([Intel XE#4208] / [i915#2575]) -> [SKIP][474] ([Intel XE#703])
>    [473]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@kms_feature_discovery@display-3x.html
>    [474]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-463/igt@kms_feature_discovery@display-3x.html
> 
>   * igt@kms_feature_discovery@psr1:
>     - shard-dg2-set2:     [SKIP][475] ([Intel XE#4208] / [i915#2575]) -> [SKIP][476] ([Intel XE#1135]) +1 other test skip
>    [475]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@kms_feature_discovery@psr1.html
>    [476]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-433/igt@kms_feature_discovery@psr1.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1:
>     - shard-adlp:         [DMESG-WARN][477] ([Intel XE#4543]) -> [DMESG-FAIL][478] ([Intel XE#4543]) +1 other test dmesg-fail
>    [477]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-adlp-2/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1.html
>    [478]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-adlp-3/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1.html
> 
>   * igt@kms_flip@flip-vs-suspend@d-hdmi-a1:
>     - shard-adlp:         [DMESG-WARN][479] ([Intel XE#2953] / [Intel XE#4173]) -> [DMESG-WARN][480] ([Intel XE#4543]) +1 other test dmesg-warn
>    [479]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-adlp-6/igt@kms_flip@flip-vs-suspend@d-hdmi-a1.html
>    [480]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-adlp-9/igt@kms_flip@flip-vs-suspend@d-hdmi-a1.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:
>     - shard-dg2-set2:     [SKIP][481] ([Intel XE#455]) -> [SKIP][482] ([Intel XE#2351] / [Intel XE#4208]) +2 other tests skip
>    [481]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html
>    [482]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
>     - shard-dg2-set2:     [SKIP][483] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][484] ([Intel XE#455]) +2 other tests skip
>    [483]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
>    [484]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:
>     - shard-dg2-set2:     [SKIP][485] ([Intel XE#4208]) -> [SKIP][486] ([Intel XE#455]) +6 other tests skip
>    [485]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html
>    [486]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-463/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff:
>     - shard-dg2-set2:     [SKIP][487] ([Intel XE#651]) -> [SKIP][488] ([Intel XE#2351] / [Intel XE#4208]) +9 other tests skip
>    [487]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff.html
>    [488]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
>     - shard-bmg:          [SKIP][489] ([Intel XE#2311]) -> [SKIP][490] ([Intel XE#2312]) +11 other tests skip
>    [489]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
>    [490]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:
>     - shard-bmg:          [SKIP][491] ([Intel XE#5390]) -> [SKIP][492] ([Intel XE#2312]) +4 other tests skip
>    [491]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html
>    [492]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:
>     - shard-bmg:          [SKIP][493] ([Intel XE#2312]) -> [SKIP][494] ([Intel XE#5390]) +1 other test skip
>    [493]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html
>    [494]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
>     - shard-dg2-set2:     [SKIP][495] ([Intel XE#4208]) -> [SKIP][496] ([Intel XE#651]) +24 other tests skip
>    [495]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html
>    [496]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:
>     - shard-dg2-set2:     [SKIP][497] ([Intel XE#651]) -> [SKIP][498] ([Intel XE#4208]) +13 other tests skip
>    [497]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
>    [498]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render:
>     - shard-bmg:          [SKIP][499] ([Intel XE#2312]) -> [SKIP][500] ([Intel XE#2311]) +12 other tests skip
>    [499]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html
>    [500]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:
>     - shard-dg2-set2:     [SKIP][501] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][502] ([Intel XE#651]) +10 other tests skip
>    [501]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html
>    [502]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
>     - shard-dg2-set2:     [SKIP][503] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][504] ([Intel XE#658]) +1 other test skip
>    [503]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
>    [504]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt:
>     - shard-bmg:          [SKIP][505] ([Intel XE#2312]) -> [SKIP][506] ([Intel XE#2313]) +8 other tests skip
>    [505]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt.html
>    [506]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
>     - shard-bmg:          [SKIP][507] ([Intel XE#2313]) -> [SKIP][508] ([Intel XE#2312]) +8 other tests skip
>    [507]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html
>    [508]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:
>     - shard-dg2-set2:     [SKIP][509] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][510] ([Intel XE#653]) +8 other tests skip
>    [509]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html
>    [510]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc:
>     - shard-dg2-set2:     [SKIP][511] ([Intel XE#653]) -> [SKIP][512] ([Intel XE#4208]) +19 other tests skip
>    [511]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc.html
>    [512]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt:
>     - shard-dg2-set2:     [SKIP][513] ([Intel XE#4208]) -> [SKIP][514] ([Intel XE#653]) +28 other tests skip
>    [513]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html
>    [514]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
>     - shard-dg2-set2:     [SKIP][515] ([Intel XE#653]) -> [SKIP][516] ([Intel XE#2351] / [Intel XE#4208]) +4 other tests skip
>    [515]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html
>    [516]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html
> 
>   * igt@kms_hdr@brightness-with-hdr:
>     - shard-bmg:          [SKIP][517] ([Intel XE#3544]) -> [SKIP][518] ([Intel XE#3374] / [Intel XE#3544])
>    [517]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html
>    [518]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html
> 
>   * igt@kms_joiner@basic-big-joiner:
>     - shard-dg2-set2:     [SKIP][519] ([Intel XE#346]) -> [SKIP][520] ([Intel XE#4208])
>    [519]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-433/igt@kms_joiner@basic-big-joiner.html
>    [520]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-434/igt@kms_joiner@basic-big-joiner.html
> 
>   * igt@kms_joiner@basic-max-non-joiner:
>     - shard-dg2-set2:     [SKIP][521] ([Intel XE#4298]) -> [SKIP][522] ([Intel XE#4208])
>    [521]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-433/igt@kms_joiner@basic-max-non-joiner.html
>    [522]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-434/igt@kms_joiner@basic-max-non-joiner.html
> 
>   * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
>     - shard-dg2-set2:     [SKIP][523] ([Intel XE#2925]) -> [SKIP][524] ([Intel XE#4208])
>    [523]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-432/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
>    [524]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-434/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
> 
>   * igt@kms_joiner@invalid-modeset-ultra-joiner:
>     - shard-dg2-set2:     [SKIP][525] ([Intel XE#2927]) -> [SKIP][526] ([Intel XE#4208])
>    [525]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-435/igt@kms_joiner@invalid-modeset-ultra-joiner.html
>    [526]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-434/igt@kms_joiner@invalid-modeset-ultra-joiner.html
> 
>   * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
>     - shard-dg2-set2:     [SKIP][527] ([Intel XE#4208]) -> [SKIP][528] ([Intel XE#2925]) +1 other test skip
>    [527]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
>    [528]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-433/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
> 
>   * igt@kms_plane_multiple@2x-tiling-y:
>     - shard-bmg:          [SKIP][529] ([Intel XE#5021]) -> [SKIP][530] ([Intel XE#4596])
>    [529]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-y.html
>    [530]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-y.html
> 
>   * igt@kms_pm_backlight@brightness-with-dpms:
>     - shard-dg2-set2:     [SKIP][531] ([Intel XE#2938]) -> [SKIP][532] ([Intel XE#4208])
>    [531]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-436/igt@kms_pm_backlight@brightness-with-dpms.html
>    [532]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-434/igt@kms_pm_backlight@brightness-with-dpms.html
> 
>   * igt@kms_pm_dc@dc5-psr:
>     - shard-dg2-set2:     [SKIP][533] ([Intel XE#4208]) -> [SKIP][534] ([Intel XE#1129])
>    [533]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@kms_pm_dc@dc5-psr.html
>    [534]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-463/igt@kms_pm_dc@dc5-psr.html
> 
>   * igt@kms_pm_dc@dc5-retention-flops:
>     - shard-dg2-set2:     [SKIP][535] ([Intel XE#3309]) -> [SKIP][536] ([Intel XE#4208])
>    [535]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-435/igt@kms_pm_dc@dc5-retention-flops.html
>    [536]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-434/igt@kms_pm_dc@dc5-retention-flops.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
>     - shard-dg2-set2:     [SKIP][537] ([Intel XE#1406] / [Intel XE#1489]) -> [SKIP][538] ([Intel XE#1406] / [Intel XE#4208]) +9 other tests skip
>    [537]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-435/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html
>    [538]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-434/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html
> 
>   * igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:
>     - shard-dg2-set2:     [SKIP][539] ([Intel XE#1406] / [Intel XE#4208]) -> [SKIP][540] ([Intel XE#1406] / [Intel XE#1489]) +13 other tests skip
>    [539]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html
>    [540]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-433/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html
> 
>   * igt@kms_psr@fbc-pr-sprite-render:
>     - shard-dg2-set2:     [SKIP][541] ([Intel XE#1406] / [Intel XE#2351] / [Intel XE#4208]) -> [SKIP][542] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929])
>    [541]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@kms_psr@fbc-pr-sprite-render.html
>    [542]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-463/igt@kms_psr@fbc-pr-sprite-render.html
> 
>   * igt@kms_psr@fbc-psr-cursor-plane-onoff:
>     - shard-dg2-set2:     [SKIP][543] ([Intel XE#1406] / [Intel XE#4208]) -> [SKIP][544] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) +12 other tests skip
>    [543]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@kms_psr@fbc-psr-cursor-plane-onoff.html
>    [544]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-463/igt@kms_psr@fbc-psr-cursor-plane-onoff.html
> 
>   * igt@kms_psr@fbc-psr2-sprite-plane-onoff:
>     - shard-dg2-set2:     [SKIP][545] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) -> [SKIP][546] ([Intel XE#1406] / [Intel XE#4208]) +7 other tests skip
>    [545]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-435/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html
>    [546]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-434/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html
> 
>   * igt@kms_psr@psr-primary-page-flip:
>     - shard-dg2-set2:     [SKIP][547] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) -> [SKIP][548] ([Intel XE#1406] / [Intel XE#2351] / [Intel XE#4208]) +4 other tests skip
>    [547]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-463/igt@kms_psr@psr-primary-page-flip.html
>    [548]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-434/igt@kms_psr@psr-primary-page-flip.html
> 
>   * igt@kms_rotation_crc@bad-pixel-format:
>     - shard-dg2-set2:     [SKIP][549] ([Intel XE#4208] / [i915#2575]) -> [SKIP][550] ([Intel XE#3414]) +2 other tests skip
>    [549]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@kms_rotation_crc@bad-pixel-format.html
>    [550]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-466/igt@kms_rotation_crc@bad-pixel-format.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
>     - shard-dg2-set2:     [SKIP][551] ([Intel XE#1127]) -> [SKIP][552] ([Intel XE#4208] / [i915#2575]) +1 other test skip
>    [551]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-435/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
>    [552]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
> 
>   * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
>     - shard-dg2-set2:     [SKIP][553] ([Intel XE#3414]) -> [SKIP][554] ([Intel XE#4208] / [i915#2575])
>    [553]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-432/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
>    [554]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-434/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
> 
>   * igt@kms_scaling_modes@scaling-mode-full:
>     - shard-dg2-set2:     [SKIP][555] ([Intel XE#4208] / [i915#2575]) -> [SKIP][556] ([Intel XE#455]) +11 other tests skip
>    [555]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@kms_scaling_modes@scaling-mode-full.html
>    [556]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-436/igt@kms_scaling_modes@scaling-mode-full.html
> 
>   * igt@kms_tiled_display@basic-test-pattern:
>     - shard-dg2-set2:     [SKIP][557] ([Intel XE#4208] / [i915#2575]) -> [FAIL][558] ([Intel XE#1729])
>    [557]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern.html
>    [558]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern.html
> 
>   * igt@kms_tv_load_detect@load-detect:
>     - shard-dg2-set2:     [SKIP][559] ([Intel XE#330]) -> [SKIP][560] ([Intel XE#4208] / [i915#2575])
>    [559]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-433/igt@kms_tv_load_detect@load-detect.html
>    [560]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-434/igt@kms_tv_load_detect@load-detect.html
> 
>   * igt@kms_vrr@cmrr:
>     - shard-dg2-set2:     [SKIP][561] ([Intel XE#4208] / [i915#2575]) -> [SKIP][562] ([Intel XE#2168])
>    [561]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@kms_vrr@cmrr.html
>    [562]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-436/igt@kms_vrr@cmrr.html
> 
>   * igt@kms_vrr@flipline:
>     - shard-dg2-set2:     [SKIP][563] ([Intel XE#455]) -> [SKIP][564] ([Intel XE#4208] / [i915#2575]) +7 other tests skip
>    [563]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-464/igt@kms_vrr@flipline.html
>    [564]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-434/igt@kms_vrr@flipline.html
> 
>   * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
>     - shard-dg2-set2:     [SKIP][565] ([Intel XE#1091] / [Intel XE#2849]) -> [SKIP][566] ([Intel XE#4208] / [i915#2575])
>    [565]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-435/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
>    [566]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-434/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
> 
>   * igt@xe_compute_preempt@compute-preempt:
>     - shard-dg2-set2:     [SKIP][567] ([Intel XE#1280] / [Intel XE#455]) -> [SKIP][568] ([Intel XE#4208])
>    [567]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-463/igt@xe_compute_preempt@compute-preempt.html
>    [568]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-434/igt@xe_compute_preempt@compute-preempt.html
> 
>   * igt@xe_copy_basic@mem-copy-linear-0x369:
>     - shard-dg2-set2:     [SKIP][569] ([Intel XE#4208]) -> [SKIP][570] ([Intel XE#1123])
>    [569]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0x369.html
>    [570]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-463/igt@xe_copy_basic@mem-copy-linear-0x369.html
> 
>   * igt@xe_copy_basic@mem-copy-linear-0xfd:
>     - shard-dg2-set2:     [SKIP][571] ([Intel XE#1123]) -> [SKIP][572] ([Intel XE#4208])
>    [571]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfd.html
>    [572]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0xfd.html
> 
>   * igt@xe_copy_basic@mem-set-linear-0x3fff:
>     - shard-dg2-set2:     [SKIP][573] ([Intel XE#1126]) -> [SKIP][574] ([Intel XE#4208])
>    [573]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-463/igt@xe_copy_basic@mem-set-linear-0x3fff.html
>    [574]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0x3fff.html
> 
>   * igt@xe_copy_basic@mem-set-linear-0xfd:
>     - shard-dg2-set2:     [SKIP][575] ([Intel XE#4208]) -> [SKIP][576] ([Intel XE#1126]) +1 other test skip
>    [575]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0xfd.html
>    [576]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-433/igt@xe_copy_basic@mem-set-linear-0xfd.html
> 
>   * igt@xe_eu_stall@non-blocking-re-enable:
>     - shard-dg2-set2:     [SKIP][577] ([Intel XE#5626]) -> [SKIP][578] ([Intel XE#4208]) +1 other test skip
>    [577]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-436/igt@xe_eu_stall@non-blocking-re-enable.html
>    [578]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-434/igt@xe_eu_stall@non-blocking-re-enable.html
> 
>   * igt@xe_eu_stall@unprivileged-access:
>     - shard-dg2-set2:     [SKIP][579] ([Intel XE#4208]) -> [SKIP][580] ([Intel XE#5626]) +1 other test skip
>    [579]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@xe_eu_stall@unprivileged-access.html
>    [580]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-466/igt@xe_eu_stall@unprivileged-access.html
> 
>   * igt@xe_eudebug_online@interrupt-all-set-breakpoint:
>     - shard-dg2-set2:     [SKIP][581] ([Intel XE#4208]) -> [SKIP][582] ([Intel XE#4837]) +16 other tests skip
>    [581]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@xe_eudebug_online@interrupt-all-set-breakpoint.html
>    [582]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-466/igt@xe_eudebug_online@interrupt-all-set-breakpoint.html
> 
>   * igt@xe_eudebug_online@resume-dss:
>     - shard-dg2-set2:     [SKIP][583] ([Intel XE#4837]) -> [SKIP][584] ([Intel XE#4208]) +10 other tests skip
>    [583]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-432/igt@xe_eudebug_online@resume-dss.html
>    [584]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-434/igt@xe_eudebug_online@resume-dss.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-basic:
>     - shard-dg2-set2:     [SKIP][585] ([Intel XE#4208]) -> [SKIP][586] ([Intel XE#1392]) +1 other test skip
>    [585]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@xe_exec_basic@multigpu-no-exec-basic.html
>    [586]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-basic.html
> 
>   * igt@xe_exec_fault_mode@many-execqueues-basic-imm:
>     - shard-dg2-set2:     [SKIP][587] ([Intel XE#4208]) -> [SKIP][588] ([Intel XE#288]) +28 other tests skip
>    [587]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@xe_exec_fault_mode@many-execqueues-basic-imm.html
>    [588]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-433/igt@xe_exec_fault_mode@many-execqueues-basic-imm.html
> 
>   * igt@xe_exec_fault_mode@once-invalid-userptr-fault:
>     - shard-dg2-set2:     [SKIP][589] ([Intel XE#288]) -> [SKIP][590] ([Intel XE#4208]) +17 other tests skip
>    [589]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-435/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html
>    [590]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-434/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html
> 
>   * igt@xe_exec_reset@cm-cat-error:
>     - shard-adlp:         [DMESG-FAIL][591] ([Intel XE#3868]) -> [DMESG-WARN][592] ([Intel XE#3868])
>    [591]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-adlp-3/igt@xe_exec_reset@cm-cat-error.html
>    [592]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-adlp-6/igt@xe_exec_reset@cm-cat-error.html
> 
>   * igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-multi-fault:
>     - shard-dg2-set2:     [SKIP][593] ([Intel XE#4915]) -> [SKIP][594] ([Intel XE#4208]) +233 other tests skip
>    [593]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-435/igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-multi-fault.html
>    [594]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-434/igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-multi-fault.html
> 
>   * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-remap-eocheck:
>     - shard-dg2-set2:     [SKIP][595] ([Intel XE#4208]) -> [SKIP][596] ([Intel XE#4915]) +334 other tests skip
>    [595]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-remap-eocheck.html
>    [596]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-433/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-remap-eocheck.html
> 
>   * igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:
>     - shard-dg2-set2:     [DMESG-WARN][597] ([Intel XE#5893]) -> [SKIP][598] ([Intel XE#4208])
>    [597]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-464/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html
>    [598]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-434/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html
> 
>   * igt@xe_mmap@small-bar:
>     - shard-dg2-set2:     [SKIP][599] ([Intel XE#4208]) -> [SKIP][600] ([Intel XE#512])
>    [599]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@xe_mmap@small-bar.html
>    [600]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-466/igt@xe_mmap@small-bar.html
> 
>   * igt@xe_oa@closed-fd-and-unmapped-access:
>     - shard-dg2-set2:     [SKIP][601] ([Intel XE#3573]) -> [SKIP][602] ([Intel XE#4208]) +4 other tests skip
>    [601]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-436/igt@xe_oa@closed-fd-and-unmapped-access.html
>    [602]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-434/igt@xe_oa@closed-fd-and-unmapped-access.html
> 
>   * igt@xe_oa@mmio-triggered-reports-read:
>     - shard-dg2-set2:     [SKIP][603] ([Intel XE#5103]) -> [SKIP][604] ([Intel XE#4208])
>    [603]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-436/igt@xe_oa@mmio-triggered-reports-read.html
>    [604]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-434/igt@xe_oa@mmio-triggered-reports-read.html
> 
>   * igt@xe_oa@polling-small-buf:
>     - shard-dg2-set2:     [SKIP][605] ([Intel XE#4208]) -> [SKIP][606] ([Intel XE#3573]) +8 other tests skip
>    [605]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@xe_oa@polling-small-buf.html
>    [606]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-432/igt@xe_oa@polling-small-buf.html
> 
>   * igt@xe_pat@pat-index-xe2:
>     - shard-dg2-set2:     [SKIP][607] ([Intel XE#977]) -> [SKIP][608] ([Intel XE#4208])
>    [607]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-466/igt@xe_pat@pat-index-xe2.html
>    [608]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-434/igt@xe_pat@pat-index-xe2.html
> 
>   * igt@xe_pat@pat-index-xehpc:
>     - shard-dg2-set2:     [SKIP][609] ([Intel XE#2838] / [Intel XE#979]) -> [SKIP][610] ([Intel XE#4208])
>    [609]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-435/igt@xe_pat@pat-index-xehpc.html
>    [610]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-434/igt@xe_pat@pat-index-xehpc.html
> 
>   * igt@xe_pat@pat-index-xelpg:
>     - shard-dg2-set2:     [SKIP][611] ([Intel XE#4208]) -> [SKIP][612] ([Intel XE#979])
>    [611]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@xe_pat@pat-index-xelpg.html
>    [612]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-433/igt@xe_pat@pat-index-xelpg.html
> 
>   * igt@xe_peer2peer@read:
>     - shard-dg2-set2:     [SKIP][613] ([Intel XE#1061] / [Intel XE#4208]) -> [FAIL][614] ([Intel XE#1173]) +1 other test fail
>    [613]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@xe_peer2peer@read.html
>    [614]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-436/igt@xe_peer2peer@read.html
> 
>   * igt@xe_pm@d3cold-mmap-system:
>     - shard-dg2-set2:     [SKIP][615] ([Intel XE#4208]) -> [SKIP][616] ([Intel XE#2284] / [Intel XE#366])
>    [615]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@xe_pm@d3cold-mmap-system.html
>    [616]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-436/igt@xe_pm@d3cold-mmap-system.html
> 
>   * igt@xe_pm@d3hot-i2c:
>     - shard-dg2-set2:     [SKIP][617] ([Intel XE#5742]) -> [SKIP][618] ([Intel XE#4208])
>    [617]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-433/igt@xe_pm@d3hot-i2c.html
>    [618]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-434/igt@xe_pm@d3hot-i2c.html
> 
>   * igt@xe_pmu@all-fn-engine-activity-load:
>     - shard-dg2-set2:     [SKIP][619] ([Intel XE#4208]) -> [SKIP][620] ([Intel XE#4650])
>    [619]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@xe_pmu@all-fn-engine-activity-load.html
>    [620]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-436/igt@xe_pmu@all-fn-engine-activity-load.html
> 
>   * igt@xe_pxp@pxp-stale-queue-post-suspend:
>     - shard-dg2-set2:     [SKIP][621] ([Intel XE#4208]) -> [SKIP][622] ([Intel XE#4733]) +1 other test skip
>    [621]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@xe_pxp@pxp-stale-queue-post-suspend.html
>    [622]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-433/igt@xe_pxp@pxp-stale-queue-post-suspend.html
> 
>   * igt@xe_pxp@pxp-termination-key-update-post-suspend:
>     - shard-dg2-set2:     [SKIP][623] ([Intel XE#4733]) -> [SKIP][624] ([Intel XE#4208]) +1 other test skip
>    [623]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-436/igt@xe_pxp@pxp-termination-key-update-post-suspend.html
>    [624]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-434/igt@xe_pxp@pxp-termination-key-update-post-suspend.html
> 
>   * igt@xe_query@multigpu-query-oa-units:
>     - shard-dg2-set2:     [SKIP][625] ([Intel XE#4208]) -> [SKIP][626] ([Intel XE#944]) +2 other tests skip
>    [625]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@xe_query@multigpu-query-oa-units.html
>    [626]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-432/igt@xe_query@multigpu-query-oa-units.html
> 
>   * igt@xe_query@multigpu-query-uc-fw-version-guc:
>     - shard-dg2-set2:     [SKIP][627] ([Intel XE#944]) -> [SKIP][628] ([Intel XE#4208]) +2 other tests skip
>    [627]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-433/igt@xe_query@multigpu-query-uc-fw-version-guc.html
>    [628]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-434/igt@xe_query@multigpu-query-uc-fw-version-guc.html
> 
>   * igt@xe_render_copy@render-stress-2-copies:
>     - shard-dg2-set2:     [SKIP][629] ([Intel XE#4814]) -> [SKIP][630] ([Intel XE#4208])
>    [629]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-464/igt@xe_render_copy@render-stress-2-copies.html
>    [630]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-434/igt@xe_render_copy@render-stress-2-copies.html
> 
>   * igt@xe_render_copy@render-stress-4-copies:
>     - shard-dg2-set2:     [SKIP][631] ([Intel XE#4208]) -> [SKIP][632] ([Intel XE#4814])
>    [631]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@xe_render_copy@render-stress-4-copies.html
>    [632]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-436/igt@xe_render_copy@render-stress-4-copies.html
> 
>   * igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:
>     - shard-dg2-set2:     [SKIP][633] ([Intel XE#4208]) -> [SKIP][634] ([Intel XE#4130])
>    [633]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html
>    [634]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-466/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html
> 
>   * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs:
>     - shard-dg2-set2:     [SKIP][635] ([Intel XE#4130]) -> [SKIP][636] ([Intel XE#4208])
>    [635]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-435/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html
>    [636]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-434/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html
> 
>   * igt@xe_sriov_flr@flr-vfs-parallel:
>     - shard-dg2-set2:     [SKIP][637] ([Intel XE#4208]) -> [SKIP][638] ([Intel XE#4273])
>    [637]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@xe_sriov_flr@flr-vfs-parallel.html
>    [638]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-463/igt@xe_sriov_flr@flr-vfs-parallel.html
> 
>   * igt@xe_sriov_scheduling@nonpreempt-engine-resets:
>     - shard-dg2-set2:     [SKIP][639] ([Intel XE#4208]) -> [SKIP][640] ([Intel XE#4351])
>    [639]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97/shard-dg2-434/igt@xe_sriov_scheduling@nonpreempt-engine-resets.html
>    [640]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/shard-dg2-466/igt@xe_sriov_scheduling@nonpreempt-engine-resets.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
>   [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
>   [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
>   [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
>   [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
>   [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
>   [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
>   [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>   [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
>   [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
>   [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
>   [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
>   [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
>   [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
>   [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
>   [Intel XE#1467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467
>   [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
>   [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
>   [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
>   [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
>   [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
>   [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
>   [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
>   [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
>   [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>   [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
>   [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
>   [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
>   [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>   [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>   [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
>   [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
>   [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
>   [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
>   [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
>   [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
>   [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
>   [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
>   [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
>   [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
>   [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
>   [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
>   [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
>   [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
>   [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
>   [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
>   [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
>   [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
>   [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
>   [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
>   [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>   [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
>   [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
>   [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
>   [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
>   [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
>   [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
>   [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
>   [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
>   [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>   [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>   [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
>   [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
>   [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>   [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
>   [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
>   [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
>   [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
>   [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>   [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
>   [Intel XE#3279]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3279
>   [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
>   [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
>   [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
>   [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
>   [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
>   [Intel XE#3442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442
>   [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
>   [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
>   [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
>   [Intel XE#3658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658
>   [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
>   [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
>   [Intel XE#3868]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3868
>   [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
>   [Intel XE#3884]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3884
>   [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
>   [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
>   [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
>   [Intel XE#4208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208
>   [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
>   [Intel XE#4227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227
>   [Intel XE#4273]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273
>   [Intel XE#4298]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298
>   [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
>   [Intel XE#4329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4329
>   [Intel XE#4331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
>   [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
>   [Intel XE#4351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351
>   [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
>   [Intel XE#4356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4356
>   [Intel XE#4416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4416
>   [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
>   [Intel XE#4518]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518
>   [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
>   [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
>   [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
>   [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
>   [Intel XE#4650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650
>   [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
>   [Intel XE#4814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814
>   [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
>   [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
>   [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
>   [Intel XE#4921]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4921
>   [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
>   [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
>   [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
>   [Intel XE#5103]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5103
>   [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
>   [Intel XE#5208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208
>   [Intel XE#5300]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5300
>   [Intel XE#5354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354
>   [Intel XE#5376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5376
>   [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
>   [Intel XE#5503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5503
>   [Intel XE#5561]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561
>   [Intel XE#5565]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5565
>   [Intel XE#5575]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
>   [Intel XE#5607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5607
>   [Intel XE#5624]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5624
>   [Intel XE#5626]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5626
>   [Intel XE#5742]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5742
>   [Intel XE#5786]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5786
>   [Intel XE#5793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5793
>   [Intel XE#5794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5794
>   [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
>   [Intel XE#5893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5893
>   [Intel XE#5941]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5941
>   [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
>   [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
>   [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
>   [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
>   [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
>   [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
>   [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>   [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
>   [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
>   [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_8512 -> IGT_8514
>   * Linux: xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97 -> xe-pw-153589v2
> 
>   IGT_8512: 8512
>   IGT_8514: 8514
>   xe-3631-a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97: a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97
>   xe-pw-153589v2: 153589v2
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153589v2/index.html
