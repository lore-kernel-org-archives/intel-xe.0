Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACEE3C3DA7F
	for <intel-xe@archiver.kernel.org>; Wed,  7 Aug 2024 17:20:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A62F10E0EE;
	Wed,  7 Aug 2024 17:20:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CWvQZBh/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63E6E10E0EE
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Aug 2024 17:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723051247; x=1754587247;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=c7qcO/ZAIqazgQbBoubeMzMvoBn0cTYyIzVV7ugEhWU=;
 b=CWvQZBh/Jl9N4uV5DyTVlfwfjEfQTOTfHfLmQmgftZwYqook7wb+e6S2
 yCcYwmb7MClgYPct1IlGiDL+gyASQZX4bFexlrxK3NFJsiO0f6BJYtjh4
 URh4/PVqBi4hwL1qh0a5pFWCWzFIOLnQqbUTPBQq1Le2Qi5ZVoHJGdfX3
 6J9hNs1hjX2SEw+004nn/ZzMaCsJKD7SobAfTSCKEzXFqhZnqEkqCOcvq
 LjNVM3RD14R3sBpaT7TSU4lytNT2lvT9UDdIYj+2aU61uAt6Q8UjZRBOh
 vYADN5VN6cSlQ6vi5E4pjQMSJzjI7GmC+9trSSV3ouVbrJsUpaqADrSrt A==;
X-CSE-ConnectionGUID: upTGOxPJTgqeoFPbkpFtZQ==
X-CSE-MsgGUID: 89DLRNLrSkG0wIoh0GoZQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="43661976"
X-IronPort-AV: E=Sophos;i="6.09,270,1716274800"; d="scan'208";a="43661976"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2024 10:17:55 -0700
X-CSE-ConnectionGUID: rTNW3yW2Sl+eGg9x+ZwNMw==
X-CSE-MsgGUID: 1m/ZMMN5QDuQGQS9Lm2aqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,270,1716274800"; d="scan'208";a="61578408"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Aug 2024 10:17:55 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 7 Aug 2024 10:17:54 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 7 Aug 2024 10:17:53 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 7 Aug 2024 10:17:53 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 7 Aug 2024 10:17:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Syn5cw5IK8APkg8OEsblE11pe36TyRJRcuqG+smQoqJKj15jWrGp8x2Vck5hAKupMvFdoBMSlvkgpa9JNBgCNY/nKT5/j1YhQNbUPSea/tZilWRQ3UupJT+L+aSk4quSNM68DThH1WHRy7r9+6jLNX11Wd45L0OEjYB5hpTaqHNEvoyXETs/FF6DlhXgDjrh7FmpUMrK7A5ihCNx//6eQ6o6iEfZiem6LROPxY8JLCgLr8wd6nOIuj9/apKxaaW0I3bbHCWcplRnEj4hFd3t7dWQPSr1QcwUWf9t964GTzRmTU/w4F7Zkt2oIhbofrXy3eFgMxmgjBF5aUXLfbMB6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=167XRorJSoHnam5oNpEBPg0MYntvrWkZq/+Hm3SpCZM=;
 b=KFzCwlB+TDpdHanFkL3KRGMUVAlCEgG2HjKbjMCFYD50RLIW6Z6mBFx1uxT7RCTR7YBWGS5mh7t/ZXTxWOsXCkXAKLSjHSzLd37Wb2IbasgjSxYRHFaAJB3qNz8Pg5HqEMMD35LQL6RuTyR6KgNLAvFR39k1JFct71tbEDeeqPzfP48LuLin+3QptBtD1T1V4dbfQZ6r7lxDB0jsYm95oweqfLeVi0BdgOOjxagCpS18CbIexgOqHV2KmzMwnCn4T4Ie57aoH37Q1QFk1m1+CUCuBUhq0gAavbJ6v0ApW99o8e8njdY8S95/fWFT0meHDzgw+1tejTZBkJ4A0wW2EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW6PR11MB8409.namprd11.prod.outlook.com (2603:10b6:303:24c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.28; Wed, 7 Aug
 2024 17:17:51 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7828.023; Wed, 7 Aug 2024
 17:17:51 +0000
Date: Wed, 7 Aug 2024 17:16:31 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: Nirmoy Das <nirmoy.das@intel.com>, <intel-xe@lists.freedesktop.org>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>, Sai Gowtham Ch
 <sai.gowtham.ch@intel.com>
Subject: Re: [PATCH v2 1/2] drm/xe/gt: Add APIs for printing stats over debugfs
Message-ID: <ZrOr76e1O2ad6mlS@DUT025-TGLU.fm.intel.com>
References: <20240807110802.13385-1-nirmoy.das@intel.com>
 <gos5am5tdkhozpwidgopru33w33hgt5dd4wqcn4xkjkllkl6im@bkldffzsasvv>
 <ZrOnbbp8LQn1ueiF@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZrOnbbp8LQn1ueiF@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: BL0PR05CA0027.namprd05.prod.outlook.com
 (2603:10b6:208:91::37) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW6PR11MB8409:EE_
X-MS-Office365-Filtering-Correlation-Id: f1a7463a-f086-4554-8dbe-08dcb704ddc4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?PrxLUIIlMGqBiY1TTIsxVpoI2eHxZ4NGB9aN1IOIlDm5444Fiw2ybdXCsb?=
 =?iso-8859-1?Q?WakSQO/M/WJnc43dW9tmmUe1h0Xn84qFfodoKQPJjsNZkNSwUnvaqI306I?=
 =?iso-8859-1?Q?wIvimrkmbAYkd98nL3/jl00FzG8qk3687bog4tjYZS/Msm+De0Kim1xn9/?=
 =?iso-8859-1?Q?hq6Nta8QixN15qe14WXPOIldHd/7S0ET0bd7dC6BeU9wjoPHdr+5WEWk0f?=
 =?iso-8859-1?Q?qtn5rNqMSxpgCVen+f7fsC7Pww2Av7n6pTsLZgdQav2eemtY26gTPkIAq7?=
 =?iso-8859-1?Q?jH7Sj4dON9BopRXXl56r5iJOBvZCNbJUiPNinJQqMse2FgDHxnc2hY2FSW?=
 =?iso-8859-1?Q?g8lQtdu4I5IrGiMNiS05Y33STka+B2Zr1YD0FfbZxViVqyCi87Scpml15R?=
 =?iso-8859-1?Q?eGHXBo35GxqLksgoS3CRpPcSsC0VdDKvFlK8VjWYCYAYafBfBwM2RGirpn?=
 =?iso-8859-1?Q?buqjT8btr9BgcohtLfSZzJIkKejwolA+jcWEpG5AnhL+iyKO2tiMi9etSX?=
 =?iso-8859-1?Q?9BHlIVt9NxpubuaGmhdHqa9hAf+o4O55z9DoRvJcxXNtF74MyAJD8o1M2r?=
 =?iso-8859-1?Q?6/rzYvq70aCDw7Wn9hG/iWo/knSkuOJ3uIOKU9/jhQJvhbU5fXJe63MqPJ?=
 =?iso-8859-1?Q?k8yy2Vwh7bsLcMwT3LEh8jPcJH70rk3S8aNyh6/mUfp1t27EvKDksS/3ZB?=
 =?iso-8859-1?Q?UQwlXJTQkaI5/5p/cCVS3Qxuqh06p0WLaJQPnFzvQgNnmwhp5NF0XEI1xF?=
 =?iso-8859-1?Q?zoc21qjANhnEUSCHnOwleESy0gdAKhQIdEFwMKBNc3w6kcYfGpLqwN9/W2?=
 =?iso-8859-1?Q?Ge4p6SBkxZMUnpqFYO1rw69AE13bzR3JhIi++CCs//bhsCJc0mm2+W60Gk?=
 =?iso-8859-1?Q?QSmGOFRWYw1T8bP7Ah8Ct4bR3EJpbWRrhnRGS5TMdmuJJTRjWganlxlPlm?=
 =?iso-8859-1?Q?RLNlXlNQ5ycTWb+7zrQ4i7QYX6T+74wIEZgGKWWz8AisYdJmprXk4g+6vj?=
 =?iso-8859-1?Q?aWX4QKJrgxxk7kAA9ZfPb+KgOXNhR7twON/XKMUTx0UvTkXVJZ+FoTc1W/?=
 =?iso-8859-1?Q?Fdc75fy4ubKDOqGqiasyQ1KIrqUiWLH++AOoidEfuHX3tNechoOfD/88bn?=
 =?iso-8859-1?Q?J2b92qbNrTyaE/j3UzfHeMWXcUdP9AYNkFZPtg7l/aPZxI9Utjfstk6CUj?=
 =?iso-8859-1?Q?bybEr/FzrKAEGnrCDpk44goZrRY953wtnnqe8TY0mwu4HZp8cNKewA3rQ4?=
 =?iso-8859-1?Q?kLcWQY0MjTv4SP3Vylv9kemynM+bvpoBKoMRlngRNcSJ/XuWxZbflT4lwR?=
 =?iso-8859-1?Q?BxjdonVp4/3WwlGSKoxeDf+IMo5yuwpHzSlFf57wIJmqrcB0BUtpiwCaL6?=
 =?iso-8859-1?Q?vSFhgUTnM3Ps5/Zc0Ztz+V7tvS7dY/dQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?threg7S5TMFdiTrpQz2clu3oZj7gqXBxHWzAgrULk2eP1DclsHVLJZActE?=
 =?iso-8859-1?Q?Bqu5IF1Flo6dN/PQd6JR45WeYEXde6QNiRthl5pdzGakQNnTFbcubZjQor?=
 =?iso-8859-1?Q?EXCXHY6OjMpDNDjHt5S83On4sM+u5XyhZD/2JOknmf8rpqI+Xoe3CiMMG0?=
 =?iso-8859-1?Q?+yd9AL3WmvNHdYmQ6o5H4y6sAROsTI7t28k8E4rMAOHEyJpqQNJqZIvSlR?=
 =?iso-8859-1?Q?nleXDBzyg1X3b5QvsjOZHF+/2RBc1YwjiHqVQOyEkkSSCDl5P1aHhkwvvl?=
 =?iso-8859-1?Q?CoOLW4mKoqhL4TX49xRR6CV7qevJNnZvL8ZKy6PWF9fqFkDoxEr6msdffN?=
 =?iso-8859-1?Q?7eeIVww09AbAClYWeMElnk3LIEDn1B8cmh7Brz69q8Z/ZW2JXr7YurpZOv?=
 =?iso-8859-1?Q?TRoE6uVgrjo1+U+2HkDnjx4OIA6Ci3/Yl0RoaJdzRwqz43Uox9ABvfA7eB?=
 =?iso-8859-1?Q?gI9XvR2azCvUBwYdaR2uo8LqXaR78cTavIoqFk9KPTFBTwc6c67GsCPLeX?=
 =?iso-8859-1?Q?G11v1mdyBXKft2U3/nH6ACFXY/4m2zPqAPWKvd5fDfPGIVyKOmyfUJO5wj?=
 =?iso-8859-1?Q?HtEj8FQYPdaLJIXTEJ0qvlvl673pNisJgkG7292Kwt7c57w23jb29Mf2Mf?=
 =?iso-8859-1?Q?h7ax8wclrQyifFKsxHonBXk4Gf1iGu3m9kzrXRh9E637TzxU1kFs0JDmks?=
 =?iso-8859-1?Q?a7XL67zgsBkcIdU+VSK5dXVBo9itx98iQXIbNf65p6/Q2HksCQNFfJjttx?=
 =?iso-8859-1?Q?4wl0wwN0FvBj2jAmfSXOkUFYQx9Dao54H/wCqSnZ1kYIeWJ19VOayAnucR?=
 =?iso-8859-1?Q?KETY7GtxCyrJgB/homZNms+m0RL+2R27c+w3p0MeA1pods7pplgZiztWPx?=
 =?iso-8859-1?Q?FoK7uCnk0UqhKt3sFVbf67eoMI/HbZQlDveOO/9tBcfc8YsPGL/J+h0V8T?=
 =?iso-8859-1?Q?4qgtrjIv+pZLQmIqv92+3zzTUfr3a5aVl/W5P4MQNBojMEYu9kKZrDVueh?=
 =?iso-8859-1?Q?tgsIOy8m775b+VG/u8Cyxl+RkTSINxqyvAHVSPJE15x7CEfujfNNbOZRKk?=
 =?iso-8859-1?Q?UqBLXAWHrs1BC4rZmmeW3m2h5m3zCUVNg+N39V0fK3QFN1UbbyZeUHdtnz?=
 =?iso-8859-1?Q?HgvoL4wq5u+dQW/MtSxYG8J+MJvozxxKatkUzeJjHjnRy9gn7ioI9dUfi0?=
 =?iso-8859-1?Q?B+z0U2RCPXkgupxxAZwLSp1k/gFyHbc+sCJSeLP4sIdzxTevFsQJEiUItJ?=
 =?iso-8859-1?Q?I/+OB2QlhSCUSgZKbKRKFbddeFb0F1gmCmzFffGUhfeforUVtnQK1G345x?=
 =?iso-8859-1?Q?idRdHYW5sO/s2lm5fzwClR+wooiDQA/U49WqldSuD+DX39JVlLHkplpSjB?=
 =?iso-8859-1?Q?VX3SoVrluFZGo9Qn0koNLRWMCLfFzYrVD0s9NEzyU/jIYY9B2DXf/1dqxo?=
 =?iso-8859-1?Q?QbHOfNJVCB0xWckMWdbG66eVdMKulRlUsRPVGeSyCuGC6zRcuZmADNJsmT?=
 =?iso-8859-1?Q?Di2slAvJXZcyw7w4l2/y1ocCrXTJrUQoM/yrjOArnFLc7kiSpVsGjSVod6?=
 =?iso-8859-1?Q?NUmQTsk0msREHoMc4x7UWA+Y3ZlWgdE3G7CH2E8dzUsD+ra1+WK/+FttAJ?=
 =?iso-8859-1?Q?73TtMaZ5GQKGBxNQdco4jT/OExi398zb4Xy6cPPymiKVbG1aavsGTddA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f1a7463a-f086-4554-8dbe-08dcb704ddc4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2024 17:17:50.9349 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SXhJyMnJLwAzL1QZP2Ww01uHTYeKlfUvd7JK6DWCP/HrLFcmkoVYrd0sHKCLeuRWKg2MmiAFMYHfXrbu0oM3nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8409
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

On Wed, Aug 07, 2024 at 04:57:17PM +0000, Matthew Brost wrote:
> On Wed, Aug 07, 2024 at 08:59:34AM -0500, Lucas De Marchi wrote:
> > On Wed, Aug 07, 2024 at 01:07:58PM GMT, Nirmoy Das wrote:
> > > Add skeleton APIs for recording and printing various stats over
> > > debugfs. This currently only added counter types stats which is backed
> > > by atomic_t and wrapped with CONFIG_DRM_XE_STATS so this can be disabled
> > > on production system.
> > > 
> > > v2: add missing docs
> > >    Add boundary checks for stats id and other improvements (Michal)
> > >    Fix build when CONFIG_DRM_XE_STATS is disabled(Matt)
> > 
> > I don't understand why we are even adding a config here.
> > This should just be compiled out if build is without debugfs.
> > 
> 
> I don't know enough about how compilers work these days but would the
> atomic increment compile out without debugfs. If the answer is yes, then
> agree we can drop this Kconfig.
> 
> Also does debugfs havea Kconfig, did a quick search and not seeing one.
> 

Oh, found it... CONFIG_DEBUG_FS

So do you mean protect the atomic inc by CONFIG_DEBUG_FS too? That could work.

Matt

> Matt
> 
> > 
> > > 
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > > Cc: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> > > Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> > > ---
> > > drivers/gpu/drm/xe/Kconfig.debug   | 11 +++++++
> > > drivers/gpu/drm/xe/Makefile        |  2 ++
> > > drivers/gpu/drm/xe/xe_gt_debugfs.c |  4 +++
> > > drivers/gpu/drm/xe/xe_gt_stats.c   | 51 ++++++++++++++++++++++++++++++
> > > drivers/gpu/drm/xe/xe_gt_stats.h   | 32 +++++++++++++++++++
> > > drivers/gpu/drm/xe/xe_gt_types.h   |  9 ++++++
> > > 6 files changed, 109 insertions(+)
> > > create mode 100644 drivers/gpu/drm/xe/xe_gt_stats.c
> > > create mode 100644 drivers/gpu/drm/xe/xe_gt_stats.h
> > > 
> > > diff --git a/drivers/gpu/drm/xe/Kconfig.debug b/drivers/gpu/drm/xe/Kconfig.debug
> > > index bc177368af6c..4db6d707c1af 100644
> > > --- a/drivers/gpu/drm/xe/Kconfig.debug
> > > +++ b/drivers/gpu/drm/xe/Kconfig.debug
> > > @@ -94,3 +94,14 @@ config DRM_XE_USERPTR_INVAL_INJECT
> > > 
> > > 	 Recomended for driver developers only.
> > > 	 If in doubt, say "N".
> > > +
> > > +config DRM_XE_STATS
> > > +	bool "Enable XE statistics"
> > > +	default n
> > > +	help
> > > +	  Choose this option to enable support for collecting and
> > > +	  displaying XE statistics as debugfs.
> > > +
> > > +	  Recommended for driver developers only.
> > > +
> > > +	  If in doubt, say "N".
> > > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> > > index 1ff9602a52f6..b0bbb248f644 100644
> > > --- a/drivers/gpu/drm/xe/Makefile
> > > +++ b/drivers/gpu/drm/xe/Makefile
> > > @@ -143,6 +143,8 @@ xe-$(CONFIG_PCI_IOV) += \
> > > 	xe_pci_sriov.o \
> > > 	xe_sriov_pf.o
> > > 
> > > +xe-$(CONFIG_DRM_XE_STATS) += xe_gt_stats.o
> > > +
> > > # include helpers for tests even when XE is built-in
> > > ifdef CONFIG_DRM_XE_KUNIT_TEST
> > > xe-y += tests/xe_kunit_helpers.o
> > > diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > > index 5e7fd937917a..3765c04919dc 100644
> > > --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > > +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > > @@ -17,6 +17,7 @@
> > > #include "xe_gt_mcr.h"
> > > #include "xe_gt_sriov_pf_debugfs.h"
> > > #include "xe_gt_sriov_vf_debugfs.h"
> > > +#include "xe_gt_stats.h"
> > > #include "xe_gt_topology.h"
> > > #include "xe_hw_engine.h"
> > > #include "xe_lrc.h"
> > > @@ -286,6 +287,9 @@ static const struct drm_info_list debugfs_list[] = {
> > > 	{"default_lrc_bcs", .show = xe_gt_debugfs_simple_show, .data = bcs_default_lrc},
> > > 	{"default_lrc_vcs", .show = xe_gt_debugfs_simple_show, .data = vcs_default_lrc},
> > > 	{"default_lrc_vecs", .show = xe_gt_debugfs_simple_show, .data = vecs_default_lrc},
> > > +#if IS_ENABLED(CONFIG_DRM_XE_STATS)
> > > +	{"stats", .show = xe_gt_debugfs_simple_show, .data = xe_gt_stats_print_info},
> > > +#endif
> > > };
> > > 
> > > void xe_gt_debugfs_register(struct xe_gt *gt)
> > > diff --git a/drivers/gpu/drm/xe/xe_gt_stats.c b/drivers/gpu/drm/xe/xe_gt_stats.c
> > > new file mode 100644
> > > index 000000000000..b13aee5488d5
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/xe/xe_gt_stats.c
> > > @@ -0,0 +1,51 @@
> > > +// SPDX-License-Identifier: MIT
> > > +/*
> > > + * Copyright © 2024 Intel Corporation
> > > + */
> > > +
> > > +#include <linux/atomic.h>
> > > +
> > > +#include <drm/drm_print.h>
> > > +
> > > +#include "xe_gt.h"
> > > +#include "xe_gt_stats.h"
> > > +
> > > +#ifdef CONFIG_DRM_XE_STATS
> > > +
> > > +/**
> > > + * xe_gt_stats_incr - Increments the specified stats counter
> > > + * @gt: graphics tile
> > > + * @id: xe_gt_stats_id type id that needs to be incremented
> > > + * @incr: value to be incremented with
> > > + *
> > > + * Increments the specified stats counter if that is within expected range.
> > > + */
> > > +void xe_gt_stats_incr(struct xe_gt *gt, enum xe_gt_stats_id id, int incr)
> > > +{
> > > +	if (id >= __XE_GT_STATS_NUM_IDS)
> > > +		return;
> > > +
> > > +	atomic_add(incr, &gt->stats.counters[id]);
> > > +}
> > > +
> > > +static const char *const stat_description[__XE_GT_STATS_NUM_IDS] = {
> > > +};
> > > +
> > > +/**
> > > + * xe_gt_stats_print_info - Print the GT stats
> > > + * @gt: graphics tile
> > > + * @p: drm_printer where it will be printed out.
> > > + *
> > > + * This prints out all the available GT stats.
> > > + */
> > > +int xe_gt_stats_print_info(struct xe_gt *gt, struct drm_printer *p)
> > > +{
> > > +	enum xe_gt_stats_id id;
> > > +
> > > +	for (id = 0; id < __XE_GT_STATS_NUM_IDS; ++id)
> > > +		drm_printf(p, "%s: %d\n", stat_description[id],
> > > +			   atomic_read(&gt->stats.counters[id]));
> > > +
> > > +	return 0;
> > > +}
> > > +#endif
> > > diff --git a/drivers/gpu/drm/xe/xe_gt_stats.h b/drivers/gpu/drm/xe/xe_gt_stats.h
> > > new file mode 100644
> > > index 000000000000..04a1d61ce1fb
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/xe/xe_gt_stats.h
> > > @@ -0,0 +1,32 @@
> > > +/* SPDX-License-Identifier: MIT */
> > > +/*
> > > + * Copyright © 2024 Intel Corporation
> > > + */
> > > +
> > > +#ifndef _XE_GT_STATS_H_
> > > +#define _XE_GT_STATS_H_
> > > +
> > > +struct xe_gt;
> > > +struct drm_printer;
> > > +
> > > +enum xe_gt_stats_id {
> > > +	/* must be the last entry */
> > > +	__XE_GT_STATS_NUM_IDS,
> > > +};
> > > +
> > > +#ifdef CONFIG_DRM_XE_STATS
> > > +int xe_gt_stats_print_info(struct xe_gt *gt, struct drm_printer *p);
> > > +void xe_gt_stats_incr(struct xe_gt *gt, enum xe_gt_stats_id id, int incr);
> > > +#else
> > > +static inline int xe_gt_stats_print_info(struct xe_gt *gt, struct drm_printer *p)
> > > +{
> > > +	return 0;
> > > +}
> > > +
> > > +static inline void xe_gt_stats_incr(struct xe_gt *gt, enum xe_gt_stats_id id,
> > > +				    int incr)
> > > +{
> > > +}
> > 
> > Is there a reason not to force id to always be a compile-time constant?
> > The only use case added in patch 2 pass it as a constant.
> > This way the id is checked at build time, the penalty with debugfs is
> > just an atomic_add() and the penalty without debugfs is none.
> > 
> > I think this is largely different from e.g. CONFIG_SCHEDSTATS and may
> > not deserve a separate kernel config: just handle the no-debugfs case,
> > which is mostly implemented already by not building
> > drivers/gpu/drm/xe/xe_gt_debugfs.c, with the remaining part being only
> > the dummy implementations in the header.
> > 
> > 
> > Lucas De Marchi
> > 
> > > +
> > > +#endif
> > > +#endif
> > > diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> > > index 631928258d71..4955612fb01d 100644
> > > --- a/drivers/gpu/drm/xe/xe_gt_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> > > @@ -10,6 +10,7 @@
> > > #include "xe_gt_idle_types.h"
> > > #include "xe_gt_sriov_pf_types.h"
> > > #include "xe_gt_sriov_vf_types.h"
> > > +#include "xe_gt_stats.h"
> > > #include "xe_hw_engine_types.h"
> > > #include "xe_hw_fence_types.h"
> > > #include "xe_oa.h"
> > > @@ -133,6 +134,14 @@ struct xe_gt {
> > > 		u8 has_indirect_ring_state:1;
> > > 	} info;
> > > 
> > > +#if IS_ENABLED(CONFIG_DRM_XE_STATS)
> > > +	/** @stats: GT stats */
> > > +	struct {
> > > +		/** @stats.counters: counters for various GT stats */
> > > +		atomic_t counters[__XE_GT_STATS_NUM_IDS];
> > > +	} stats;
> > > +#endif
> > > +
> > > 	/**
> > > 	 * @mmio: mmio info for GT.  All GTs within a tile share the same
> > > 	 * register space, but have their own copy of GSI registers at a
> > > -- 
> > > 2.42.0
> > > 
