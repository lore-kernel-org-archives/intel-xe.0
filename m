Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 386CFCD4F4A
	for <intel-xe@archiver.kernel.org>; Mon, 18 May 2026 22:14:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 706B010E9CB;
	Mon, 18 May 2026 22:14:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BiUU6u5z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFEF410E37A
 for <intel-xe@lists.freedesktop.org>; Mon, 18 May 2026 22:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779142465; x=1810678465;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=iOwNyfTm3IcflE0FaAVvV9dpQhPvU05FruEO+eLWlqs=;
 b=BiUU6u5zC46YCoV1GGBcTfezhYTX5Cm40qEk+BaHDzCPJ92Rb0TI2xee
 Ocug0FSCMMgYufmaNXWrj9WixkHJAbC3Xy2ifMaph4EDoBUhOH/FDMWqD
 724BkM2VhOjJLvFaiO/eNDfkaEK3o4Rj92eQ9sJsE9PhTlHwsmDtlpPDb
 MGRujReG3q4xLOZA6N4BXP/OCZcE3yznCrGhK3TsQoWrH8G87nGnbAprQ
 HQJhxAuOwT9PCOAZCsGwzEIuEswgAC9Fwtm/gQOlgXklvkGrl75pAXDMN
 MaeqLMyJ3QqKqNlfR8oNXVDjIJQbmY/rwfL+H7C9/vjU3GwCy4z+Rt5Tc w==;
X-CSE-ConnectionGUID: wXSU5pgpTF+jTpFbbQkAOA==
X-CSE-MsgGUID: Zwi3xl2FQIuWFFMexNUc5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="79031889"
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; d="scan'208";a="79031889"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2026 15:14:25 -0700
X-CSE-ConnectionGUID: FtnNFy6JTGOjGZ9GDlSWnA==
X-CSE-MsgGUID: YnFbA+cpTsS7ifWMIRg/6g==
X-ExtLoop1: 1
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2026 15:14:24 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 18 May 2026 15:14:24 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 18 May 2026 15:14:24 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.48) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 18 May 2026 15:14:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SxdTFnXrxKivh37rvzCllUh/OzZJl7kiiW8WYZVhYNLvc3Tfki/WhLRujIpgx5WyUG1n4TBYXrBQwgGnvDeWPrl2B0H/cCLU1Vr81Jgp6SNc/w52U4hKHz658kdhWlNV9R4rscWqCfzI+6/R9QGe91+D8Rs5QLhDgCl5RyifUqUkgh0Du6dwaiMQL78RxUSsH1cYo/l6w+GX0u3yv0Tl8dOL6yKJjiXlKwLjhnL+Iqp0Ct+HaKqREuPsKW75JQSL44BpW099Othp+DbX6tcww2rlMdNxP/fyH7neyIkgmX0ThnnXegc6aBTwbUcKi8amWrSDqDo6AEHMWkGYfmRZUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a44avDMFddRAAlPddxnSZNJxV3LWwaZst7MPJ7tUEDU=;
 b=b2NvLCdfhXUAaOBzrtB8v7i2R6UyqwaHOnvF8JHJ5HwIDPpqT5gqG4V7ceJJ/7W0ITVg1VAYK6L0ZksFzqTVTIfQZhgA1EryZONk3n2gl+Z5JJZi4Mg/mfMEGrqmTFfyDbrIj854PpaHkFyPyrDZnG/95avszBN5HaCJhxnROdF9FqTGBMZ0RBDLozlUO8QcySExToorKSB6EwY60QKtW4Nr8V/N9ve7Jpf2RWmdbKmeARSfatJ63YI05hyw+x0CAhuSQwc1vwxMcbtUDUJMmOIsTTZJmJJ9p0uKtsbacqxYkSbIi2qb9uDsu65ovYDSyzMXzYHxY2e7QwK+pFByKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8284.namprd11.prod.outlook.com (2603:10b6:806:268::21)
 by DS4PPFEC77118F8.namprd11.prod.outlook.com (2603:10b6:f:fc02::5e)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Mon, 18 May
 2026 22:14:21 +0000
Received: from SN7PR11MB8284.namprd11.prod.outlook.com
 ([fe80::65e5:898b:2231:bf65]) by SN7PR11MB8284.namprd11.prod.outlook.com
 ([fe80::65e5:898b:2231:bf65%6]) with mapi id 15.21.0025.023; Mon, 18 May 2026
 22:14:20 +0000
Date: Mon, 18 May 2026 15:14:08 -0700
From: Violet Monti <violet.monti@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/4] drm/xe/rtp: Add GT WAs rule checking
Message-ID: <aguPMDnTGhmD7V4_@vmonti-desk>
References: <20260513212129.691628-6-violet.monti@intel.com>
 <20260513212129.691628-8-violet.monti@intel.com>
 <8733zoh3lh.fsf@intel.com> <8733zosb0x.fsf@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8733zosb0x.fsf@intel.com>
X-ClientProxiedBy: MW4P220CA0001.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::6) To SN7PR11MB8284.namprd11.prod.outlook.com
 (2603:10b6:806:268::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8284:EE_|DS4PPFEC77118F8:EE_
X-MS-Office365-Filtering-Correlation-Id: fd5fc20b-07d6-44f2-7f9d-08deb52acf16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|22082099003|18002099003|56012099003|3023799003|4143699003|11063799003;
X-Microsoft-Antispam-Message-Info: RS5IPrDATZQ5NUHQzkOnMKreCp3SaBwuSP/HNT1CFm0i+yGc2JEiZ3oMTtE8ooZpdBXm2J7tdbrA9ct6i+t2jfY1qHQngQYn3GDl5jmvp/9KdVJTdssX5hh5aqifUf30w+vr4BTGVsxixnfDO+3jAP8iNFZ8p6v6B593iHpSiHLtABoS3W+ieYwVe4VxLRSG33bE1pYHdwCSu08/Mcr3qrvNd2rX6kwFYBnCgM7sJ55I0OKnlCCcHfqHIQjlwejJhw9FbbH3OSdXCeY0JUYIF69kdliJoGCIr60SdxzmxoN3/ZHBOAjutTJJkLx7TM/QLkhFujsKefwduczAumE1iBw3XLR5EQBgwmu5OU6aljuNc0VE0uwsZjkbzPwxa38IufYffdYtBZICRqC0FTJBzASEuGuG504PU9MCXuUfT1LQOTtO+1cIhlktjyajUZ6GTrIg1F/EXs1srdhelIkkNop2KkDepCfiKaLDZWJipSoA9+F4qgGsyfHv4FnO/QtRokeE2+xXhvFCqBKrf0IQA36sYcdzWjUAzW/OpyLLvsCL1/5+qwqJ15tJfcZpg8wjrum5/r9khA17ORtx+Putro1LznOlxkzjDdMPqvycF4zFei+JyT/Yg1IIn0DVqTQvgv+OzFAOH6xnrdwTemFaSO7NSvJ4jCuxDmjMHoMel05YMmjX9UBLS/b/xFHwNoL5
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB8284.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(22082099003)(18002099003)(56012099003)(3023799003)(4143699003)(11063799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?J+hqQrdNXFE542IQ13hMYME0lhYeZTgsrAPjDrK9CODPhQtay/D3ctiMC3?=
 =?iso-8859-1?Q?M1rVW3gY4axflCj9A+kRunfnZR9xURPe8P3Z9ezxk5ifCgYO4IYMP15qWE?=
 =?iso-8859-1?Q?dQTsGKguYEDd+ScQmnWJjm10sPt2VNS5opcRvD2q7q0Mgbhap+ofktMUYV?=
 =?iso-8859-1?Q?kZzhH2RyBjMC7Rd+dbavkhMG+RCYnhuXeM8HXklbFPw9pNQzrB0ue4P50o?=
 =?iso-8859-1?Q?Asdf64SSWJvDhDonTKr61FtPCxX5ioeWVlilJWYTocEOtrL8ml7TeTzQFy?=
 =?iso-8859-1?Q?hD8GaTeDhjbKOrz4aW4At/9WNcPkJ775ObuJ2mubIXSrRmzaqCqLcnhQg2?=
 =?iso-8859-1?Q?CV/cdqMztvr0ziwFqnQTSOuIdtp6VABoUemwjx17QDG1gRyYz55hD3mxkS?=
 =?iso-8859-1?Q?aIw07zRDjPjTYprw1RJJGc3lwAHz3yyeh8FrK8O9yj1ySXgit5tHDm6NJE?=
 =?iso-8859-1?Q?2JQAkHRXDsoydhsc0lN0EStQNiuPKjw8acXsu+/bMCvwMcjRZwpBN5YYww?=
 =?iso-8859-1?Q?6KVzsik3VnsD2Cjr+mj5CjaVksqulVPtN4UPrc2otZqE4bdAv7VBqLGXbg?=
 =?iso-8859-1?Q?YstOZLiQ3x/oKvDROex3iZL+ONy5fNCRjXJzPGI8xBYnWElLqKFcpwDsiG?=
 =?iso-8859-1?Q?gFGbXBgJQXhtsQ46/YBF5l5VwH7rh4e/nvrpSGYMqXFJCD/p30xxT5lr2S?=
 =?iso-8859-1?Q?ShVaKWhLdL5ziPShYpibExJTSuH2Z1dLoO0le/473VcD01XfU8mNLP1CAO?=
 =?iso-8859-1?Q?Q5GrpcPvph+3kS6WSWrCmpEX9rPTtFWy6afrbxGyPDLAjaOFI+XF+ltMs/?=
 =?iso-8859-1?Q?nJZMmm6SKPv6IDDCJhxCcsWTXHc93mBikwegmAk9kbUKBfHMbm/t9K/Oj3?=
 =?iso-8859-1?Q?K5J/yCEqkTByVwxGdQzN9MnIjNZCwrAkSjmVvnu27MNqcCGsSHJL9DTvbb?=
 =?iso-8859-1?Q?HLzdETs0A07VwLgFhVCEA8yuH1NOdfddlAz3sYz4+/+4At/DlpnSa8Tre8?=
 =?iso-8859-1?Q?FGfWFeQOdhNYjv8NE1B/AkBEKWohNAZI/NvqlzxF6Za8eGaZRgaJmReZ+k?=
 =?iso-8859-1?Q?rYGxP/y7QWMRMk7rhg+qBVbaDIXxpPbCsysaPiW8e/1x+4UAgay83KqaXo?=
 =?iso-8859-1?Q?DZEeR6IVvuevkEyyvfDEt/NA4JDLjpmvCyOOTgiFhDV6hGWsm+5Eqm7w1W?=
 =?iso-8859-1?Q?9EJxAycQg+t+wK96CyhUngvsiy76/QLGU5yW2iK62D5Hlq5oQlaujOs/uD?=
 =?iso-8859-1?Q?RYw9zAEZtyMYpqavIP6yzZusoxggSmT9COlGaAcgmT7UNSwI3juGcOPO/s?=
 =?iso-8859-1?Q?G0rKIZQTke6LXGcfw2GRIou+vUMiaid3QyH+CSINHp9iqMAaMMuAgiubHY?=
 =?iso-8859-1?Q?kjylAO6JH6mfLjZDpoMMazdsystLG7gTUEOTFeh8+4Vh6eNRm11rb7FtG2?=
 =?iso-8859-1?Q?HtMJK7InZosoRAgyXUPPmWC8ew5reCyhq2MZ0yM9xqFHdDywjaLzvL9xhc?=
 =?iso-8859-1?Q?BYysHU2cqC5HBholiYtKDJec0ju8OXnhnZ3GkKacwlJNKxLnYlZ1N7RVuj?=
 =?iso-8859-1?Q?JE5Mx5aUqVEoCVvBNf+KKzHp64J8hSDW4Ke6rW8wcox7yeF14x7myAUgcL?=
 =?iso-8859-1?Q?OwzkonxkP5hAYQY2Oidk29gAah2VgAb0OkRs1IMnjuFKpoKOS0skDUGtvN?=
 =?iso-8859-1?Q?U40WYzQL60MpwNlTKX54SkSyP3o4rnNrQEIiQOFbcOYhtjTLY8/8wiSzF4?=
 =?iso-8859-1?Q?6f5LV2EAZPW11w3bZL2Pg9GsHza5vyVkfZDtWDJ2ElgJHQwyArBBYiYXJM?=
 =?iso-8859-1?Q?SWvyZjhXNg=3D=3D?=
X-Exchange-RoutingPolicyChecked: iwDvwAkTpRYmbR/3O/KV67fb1zEPXaq+Ik1XzYJzDlx55TNWOeFa3/ixChiMTer9wUuKvw6AxcJpaQmdvN2BUaG74EEBYjNg6f9qJYEXsKbPhAqAISYHhaJGclZS1vXEdtpR1J6H9LP8vEQOu0O4UTZIoEkTLOCg4exlBpAKEYFv2iplY19lr2fFXLEkLWH1LitzBGQeZGTAqElq/gRr4GlzMshOc824CQ+oKwkLb1iC6Zd6f+zATOEmycj5QKHAmEiJdLNPgm8gR1UnKBrk5p5CKXJCn78S9+C/ngE7vg8A8c/IJTRZJrSJbQEzC6EowHDKDai1PjN2PH3Ni9+RZQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: fd5fc20b-07d6-44f2-7f9d-08deb52acf16
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8284.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 22:14:20.5700 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9D6Aic899JgFUbgd2y7zPm1x3BZouupvNquzdawWUQgU2FVb8n67C8+ddfMc7ywnGP5tWNizOB1pO15gu/M4lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFEC77118F8
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

On Mon, May 18, 2026 at 05:44:30PM -0300, Gustavo Sousa wrote:
> 
> Adding some things I forgot in my previous reply...
> 
> Gustavo Sousa <gustavo.sousa@intel.com> writes:
> 
> > Violet Monti <violet.monti@intel.com> writes:
> >
> 
> I think the commit subject is a bit vague. We could try to be more
> specific with something like:
> 
>   drm/xe/rtp: Ensure gt_was doesn't check for engine types
> 

Agreed. Thoughts on:
    
    drm/xe/rtp: Ensure gt_was doesn't evaluate rules with engine types

My understanding is that the gt_was takes the RTP rule list and
evaluates the rules so the workarounds can be applied.

> >> It is currently possible for a RTP rule, and subsequently a workaround,
> >> to expect contexts that may not be present when the workaround is
> >> applied. For example, the workarounds in the engine_was[] in drm/xe/xe_wa.c
> >> expect an engine entity to be active. Conversely, the gt_was[] is not
> >> depending on an engine entity to implement its workarounds. This kunit
> >> test addition checks the gt_was[] workaround list for any workarounds
> >> with specifically an engine_class rule. If a workaround does have an
> >
> > I think "an engine_class rule" can be a bit vague. I would spell out
> > ENGINE_CLASS() or XE_RTP_ENGINE_CLASS().
> >

Alright. For specificity, I will update this to XE_RTP_ENGINE_CLASS() in
V2

> >> engine_class rule, the workaround is then checked for the
> >> "FOREACH_ENGINE" flag, which ensures the workaround is not implemented
> >> in an improper context.
> >>
> >> The result of this test is an expectation failure if a workaround has an
> >> improper engine_class rule, and aims to prevent future issues of
> >> gt_was being applied without proper contexts.
> >>
> >> Signed-off-by: Violet Monti <violet.monti@intel.com>
> >> ---
> >>  drivers/gpu/drm/xe/tests/Makefile             |  1 +
> >>  drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c | 76 +++++++++++++++++++
> >>  drivers/gpu/drm/xe/tests/xe_rtp_tables_test.h | 24 ++++++
> >>  drivers/gpu/drm/xe/xe_wa.c                    |  2 +-
> >>  drivers/gpu/drm/xe/xe_wa.h                    |  5 ++
> >>  5 files changed, 107 insertions(+), 1 deletion(-)
> >>  create mode 100644 drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c
> >>  create mode 100644 drivers/gpu/drm/xe/tests/xe_rtp_tables_test.h
> >>
> >> diff --git a/drivers/gpu/drm/xe/tests/Makefile b/drivers/gpu/drm/xe/tests/Makefile
> >> index 0e3408f4952c..f7aa47f11a36 100644
> >> --- a/drivers/gpu/drm/xe/tests/Makefile
> >> +++ b/drivers/gpu/drm/xe/tests/Makefile
> >> @@ -9,5 +9,6 @@ obj-$(CONFIG_DRM_XE_KUNIT_TEST) += xe_test.o
> >>  xe_test-y = xe_test_mod.o \
> >>  	xe_args_test.o \
> >>  	xe_pci_test.o \
> >> +	xe_rtp_tables_test.o \
> >>  	xe_rtp_test.o \
> >>  	xe_wa_test.o
> >> diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c b/drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c
> >> new file mode 100644
> >> index 000000000000..100cac379b08
> >> --- /dev/null
> >> +++ b/drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c
> >> @@ -0,0 +1,76 @@
> >> +// SPDX-License-Identifier: GPL-2.0
> >> +/*
> >> + * Copyright © 2026 Intel Corporation
> >> + */
> >> +
> >> +#include <drm/drm_kunit_helpers.h>
> >> +
> >> +#include "xe_kunit_helpers.h"
> >> +#include "xe_pci_test.h"
> >> +#include "xe_rtp.h"
> >> +#include "xe_rtp_tables_test.h"
> >> +#include "xe_wa.h"
> >> +
> >> +static void xe_rtp_table_gt_test(struct kunit *test)
> >> +{
> >> +	const struct xe_rtp_entry_sr *param = test->param_value;
> >
> > I think it makes sense to call the variable "entry" here, like done in
> > other places for instances of xe_rtp_entry_sr.
> >

Will add in V2.

> >> +
> >> +	for (int i = 0; i < param->n_rules; i++) {
> >> +		if (param->rules[i].match_type == XE_RTP_MATCH_ENGINE_CLASS)
> >
> > We would need to check XE_RTP_MATCH_NOT_ENGINE_CLASS as well.
> >

Thank you for confirming that, will add as well.

> >> +			KUNIT_EXPECT_EQ_MSG(test, param->flags,
> >> +					    XE_RTP_ENTRY_FLAG_FOREACH_ENGINE,
> >
> > If the entry has other flags set along with
> > XE_RTP_ENTRY_FLAG_FOREACH_ENGINE, this check would fail.
> >
> >> +					    "GT WA %s has an invalid engine class rule setup",
> >> +					    param->name);
> >
> > I think it would be simpler to replace this with something like
> >
> >   KUNIT_EXPECT_TRUE(param->rules[i].match_type != XE_RTP_MATCH_ENGINE_CLASS ||
> >                     param->flags & XE_RTP_ENTRY_FLAG_FOREACH_ENGINE)
> >
> > And another one like that for XE_RTP_MATCH_NOT_ENGINE_CLASS.
> >
> > Since we are using entries as parameters of the test, the RTP entry name
> > will be displayed in the kunit output, so I think we can skip the
> > explanatory string.
> >

Should there be an explanation somewhere within the file as a comment?
Such as a comment above this test explaining that MATCH_ENGINE_CLASS and
MATCH_NOT_ENGINE_CLASS are not allowed in this context?

> >> +	}
> >> +}
> >> +
> >> +static int xe_rtp_table_test_init(struct kunit *test)
> >> +{
> >> +	struct xe_device *xe;
> >> +	struct device *dev;
> >> +	int ret;
> >> +
> >> +	dev = drm_kunit_helper_alloc_device(test);
> >> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev);
> >> +
> >> +	xe = xe_kunit_helper_alloc_xe_device(test, dev);
> >> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xe);
> >> +
> >> +	/* Initialize an empty device */
> >> +	test->priv = NULL;
> >> +
> >> +	ret = xe_pci_fake_device_init(xe);
> >> +	KUNIT_ASSERT_EQ(test, ret, 0);
> >> +	xe->drm.dev = dev;
> >> +	test->priv = xe;
> >> +
> >> +	return 0;
> >> +}
> >> +
> >> +static void xe_rtp_table_test_exit(struct kunit *test)
> >> +{
> >> +	struct xe_device *xe = test->priv;
> >> +
> >> +	drm_kunit_helper_free_device(test, xe->drm.dev);
> >> +}
> >> +
> >> +static void rtp_table_gt_test_desc(const struct xe_rtp_entry_sr *t, char *desc)
> >> +{
> >> +	strscpy(desc, t->name, KUNIT_PARAM_DESC_SIZE);
> >> +}
> >> +
> >> +RTP_KUNIT_ARRAY_PARAM(rtp_table_gt, gt_was, rtp_table_gt_test_desc);
> >> +
> >> +static struct kunit_case xe_rtp_table_tests[] = {
> >> +	KUNIT_CASE_PARAM(xe_rtp_table_gt_test, rtp_table_gt_gen_params),
> >> +	{}
> >> +};
> >> +
> >> +static struct kunit_suite xe_rtp_tables_test_suite = {
> >> +	.name = "xe_rtp_tables_test",
> >> +	.init = xe_rtp_table_test_init,
> >> +	.exit = xe_rtp_table_test_exit,
> >
> > We do not need fake device initialization for the current test being
> > done here.  We can simply drop those functions and the .init and .exit
> > initializations here.
> >

Gotcha. That is a remnant from my initial testing. Will remove in V2

> >> +	.test_cases = xe_rtp_table_tests,
> >> +};
> >> +
> >> +kunit_test_suite(xe_rtp_tables_test_suite);
> >> diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_tables_test.h b/drivers/gpu/drm/xe/tests/xe_rtp_tables_test.h
> >> new file mode 100644
> >> index 000000000000..3e91dd08f854
> >> --- /dev/null
> >> +++ b/drivers/gpu/drm/xe/tests/xe_rtp_tables_test.h
> >> @@ -0,0 +1,24 @@
> >> +/* SPDX-License-Identifier: GPL-2.0 AND MIT */
> >> +/*
> >> + * Copyright © 2026 Intel Corporation
> >> + */
> >> +
> >> +// The "gen_params" function functionality does not work to dynamically collect the size
> >> +// of the WA array, even with the new n_entries pointer. This addition builds on that framework
> >> +// to allow dynamic sizing
> >> +#define RTP_KUNIT_ARRAY_PARAM(name, array, get_desc)						\
> >
> > The only user of this macro is xe_rtp_tables_test.c, I don't think we
> > need to expose it via a header.
> >
> > I also think RTP_TABLE_PARAM() would be a good name for the macro.
> >
> >> +	static const void *name##_gen_params(struct kunit *test,				\
> >> +					     const void *prev, char *desc)			\
> >> +	{											\
> >> +		typeof((array.entries)[0]) *__next = prev ?					\
> >> +			((typeof(__next))prev) + 1 : (array.entries);				\
> >> +		if (!prev)									\
> >> +			kunit_register_params_array(test, array.entries, array.n_entries, NULL);\
> >
> > Do we really need to call kunit_register_params_array()?  Looking at the
> > implementation of kunit, it appears kunit_register_params_array() is
> > meant to be used together with kunit_array_gen_params() as the parameter
> > generator.  Here we are using our own custom generator.
> >
> > By the way, I wonder why kunit itself is doing that for
> > KUNIT_ARRAY_PARAM() and KUNIT_ARRAY_PARAM_DESC().  Commit b820b9077b7f
> > ("kunit: Enable direct registration of parameter arrays to a KUnit
> > test") is the one that added kunit_register_params_array() and says the
> > following:
> >
> >     "The arrays passed to KUNIT_ARRAY_PARAM(,DESC) will also be registered to
> >     the parameterized test context for consistency as well as for higher
> >     availability of the parameter count that will be used for outputting a KTAP
> >     test plan for a parameterized test."
> >
> > , however, the registered data is only used if the generator is
> > kunit_array_gen_params() anyway, so the registration in those macros
> > seems useless.
> >
> > Bottom line: I think we can simply drop this call.
> >
> >> +		if (__next - array.entries < array.n_entries) {					\
> >> +			void (*__get_desc)(typeof(__next), char *) = get_desc;			\
> >> +			if (__get_desc)								\
> >> +				__get_desc(__next, desc);					\
> >
> > Since we are writing this macro specifically for RTP entries, I don't
> > think we need a "get description" function: we can use __next->name
> > directly here.
> >
> > Also, for the description, I think we could also include the name of the
> > variable, for completeness.  Today we are only adding gt_was, but in the
> > future we could add others.  Using the variable name in the parameter
> > name here should make it easy to correctly spot the offending RTP entry
> > in a expectation failure.
> >
> > Hence, here is what I would suggest for such a macro (tested locally):
> >
> >     #define RTP_TABLE_PARAM(array)								\
> 
> Maybe we should use "table" for the parameter here, since we are
> expecting xe_rtp_table or xe_rtp_table_sr instances?
> 
> --
> Gustavo Sousa
> 
> >     	static const void *array##_gen_params(struct kunit *test,				\
> >     					     const void *prev, char *desc)			\
> >     	{											\
> >     		typeof((array.entries)[0]) *__next = prev ?					\
> >     			((typeof(__next))prev) + 1 : (array.entries);				\
> >     		if (__next - array.entries < array.n_entries) {					\
> >     			scnprintf(desc, KUNIT_PARAM_DESC_SIZE, #array "/%s", __next->name);	\
> >     			return __next;								\
> >     		}										\
> >     		return NULL;									\
> >     	}
> >     

I will work on implementing this. I used the existing macro to match the
style of the KUNIT_ARRAY_PARAM() macro used in other test files, but
those did not work with the ARRAY_SIZE() macro due to context issues. 

I do like a lot of these changes, though, so I will work on adding this
into V2.

> >
> >
> > --
> > Gustavo Sousa
> >
> >> +			return __next;								\
> >> +		}										\
> >> +		return NULL;									\
> >> +	}
> >> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> >> index 39c507edb8ce..285072fe0a47 100644
> >> --- a/drivers/gpu/drm/xe/xe_wa.c
> >> +++ b/drivers/gpu/drm/xe/xe_wa.c
> >> @@ -130,7 +130,7 @@
> >>  __diag_push();
> >>  __diag_ignore_all("-Woverride-init", "Allow field overrides in table");
> >>  
> >> -static const struct xe_rtp_table_sr gt_was = XE_RTP_TABLE_SR(
> >> +VISIBLE_IF_KUNIT const struct xe_rtp_table_sr gt_was = XE_RTP_TABLE_SR(
> >>  	/* Workarounds applying over a range of IPs */
> >>  
> >>  	{ XE_RTP_NAME("14011060649"),
> >> diff --git a/drivers/gpu/drm/xe/xe_wa.h b/drivers/gpu/drm/xe/xe_wa.h
> >> index a5f7d33c1b32..17dff615e507 100644
> >> --- a/drivers/gpu/drm/xe/xe_wa.h
> >> +++ b/drivers/gpu/drm/xe/xe_wa.h
> >> @@ -6,6 +6,7 @@
> >>  #ifndef _XE_WA_H_
> >>  #define _XE_WA_H_
> >>  
> >> +#include <kunit/visibility.h>
> >>  #include "xe_assert.h"
> >>  
> >>  struct drm_printer;
> >> @@ -24,6 +25,10 @@ void xe_wa_apply_tile_workarounds(struct xe_tile *tile);
> >>  void xe_wa_device_dump(struct xe_device *xe, struct drm_printer *p);
> >>  int xe_wa_gt_dump(struct xe_gt *gt, struct drm_printer *p);
> >>  
> >> +#if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
> >> +extern VISIBLE_IF_KUNIT const struct xe_rtp_table_sr gt_was;
> >> +#endif
> >> +
> >>  /**
> >>   * XE_GT_WA - Out-of-band GT workarounds, to be queried and called as needed.
> >>   * @gt__: gt instance
> >> -- 
> >> 2.43.0

-- 
--
Violet Monti
