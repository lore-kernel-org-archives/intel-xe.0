Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FF39CD343F
	for <intel-xe@archiver.kernel.org>; Mon, 18 May 2026 22:24:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E368010E9CB;
	Mon, 18 May 2026 22:24:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BLURPtNb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1593F10E9CB
 for <intel-xe@lists.freedesktop.org>; Mon, 18 May 2026 22:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779143074; x=1810679074;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=iUo560rW8amAj+afbUCldTbn86F3zg6+juROEIWyFOE=;
 b=BLURPtNbvk8QZHwNDVVxcHO1D6dG3zn5pzl66LmNTGq8Yuur5839VF1V
 4Lq8EBNLeR1MKsv3xBgIOPYhjprZccP+mrd+TQjEo77OZWTfism3aakCz
 H7xINKzBiYQoq358Mb7+LrQu6C1x/2pJSq83icdtZfyn+hIbm13dL0vkX
 oGB56qhmCiBWvL54jQdBB182gP/DgnKVEm4qu27DubED98vmCdWh+RORN
 kTw8ew4xNJ2l8VYtxeqBwPBZ56glldAul/JhuDCTI7nILFYsLFvxmFfve
 Gg0unkAKF4wAipe9QNsiypSm3hwy0qpdeO8DpWM4RRqaeaAQTNJjdHX6U g==;
X-CSE-ConnectionGUID: j9ktUEeJRKG3iaSH6v4UPQ==
X-CSE-MsgGUID: oqwQoZEGSeqg9wnFVOau1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="80182527"
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; d="scan'208";a="80182527"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2026 15:24:33 -0700
X-CSE-ConnectionGUID: yb84FZrbSHqbu0LWfNYU5g==
X-CSE-MsgGUID: HjqtxU7uQdWYErwUoA5EXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; d="scan'208";a="236567600"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2026 15:24:33 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 18 May 2026 15:24:32 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 18 May 2026 15:24:32 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.37) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 18 May 2026 15:24:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bslj59WX66EalFcWO21z3r4S9wTi7elo3md1h9fdTRWzFbYN+Lr5PCqk3l2tH9Xz+GuUSb2DuAE6noKlHY/6kd82OjVgZdyXIJM6tihIfQof9lJZQYaYEZHZRjrNR1ZImAzBK/mUBACrmvVsIhbGMc+0U1ZuWZTDU0elwtGUuvmsZTUG+jCE+spy7D9f/pCGll7tX3SPf3UmhYxPwtsWNlofsxVjTBFObbM5G3mjZ2y3ARpM6WMyBl85wnMNsanFH1m2M1VA3Rc5LWA7EnJiVcV6FutBOva9GZ14fZvg691SAgzAyExvjh28NO/NbahBgdY4ID8QWLxDAJSRFt9PBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1DtwrE1RnJnRdhpongLtKaAmU5W5qEB5Hrhhd3C+Np4=;
 b=LWLegqUj1JjVQJZuZLrEuxt1NCF27QwxTdrp19pHeUi2Ql6gQ+2DvN1WBf5q7lhqUMZpVYXF/M/6DMO8bhlJsIXXNDj1OIsx/g/F9wLiBRxTAl2M9QnMjdTwOg1U9VSvAGGZW2G+VsVamv0PCDQtBi5gEBft+aHMaeFcTNO6xeeMOOf1Th107R/7IPfkDVV/C/VUF7UdwBHeCG4cziRBw6c5zPofJpEYoSltof2HIHcFhhGAmKRYjqOXJ//PyBJFwx5na+DvAaPKtp6Wod3DQpGHjdSlJ1b+MyCaRlI7Va1hcgJkFbgbWMLh93suHvZPtZRntUcu7RyT67wyjNLZqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8284.namprd11.prod.outlook.com (2603:10b6:806:268::21)
 by SN7PR11MB6774.namprd11.prod.outlook.com (2603:10b6:806:265::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.22; Mon, 18 May
 2026 22:24:30 +0000
Received: from SN7PR11MB8284.namprd11.prod.outlook.com
 ([fe80::65e5:898b:2231:bf65]) by SN7PR11MB8284.namprd11.prod.outlook.com
 ([fe80::65e5:898b:2231:bf65%6]) with mapi id 15.21.0025.023; Mon, 18 May 2026
 22:24:30 +0000
Date: Mon, 18 May 2026 15:24:18 -0700
From: Violet Monti <violet.monti@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 3/4] drm/xe/rtp: Add OOB WAs rule checking
Message-ID: <aguRkp_Rbvvldqvh@vmonti-desk>
References: <20260513212129.691628-6-violet.monti@intel.com>
 <20260513212129.691628-9-violet.monti@intel.com>
 <87zf1wqvzx.fsf@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <87zf1wqvzx.fsf@intel.com>
X-ClientProxiedBy: MW4PR03CA0044.namprd03.prod.outlook.com
 (2603:10b6:303:8e::19) To SN7PR11MB8284.namprd11.prod.outlook.com
 (2603:10b6:806:268::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8284:EE_|SN7PR11MB6774:EE_
X-MS-Office365-Filtering-Correlation-Id: 41bde000-d4b4-4cec-c5ff-08deb52c3a7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|11063799003|4143699003|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: W9AuNqF0APheRtcweCpFRqw1LjK9R7Oj90iBJ2RGYiypFgBfUtMpU2Dic3sdVgQkkhhmMZWQnoxwfOlNaECECXNt/dIt0GIYyFXLLJIofy2l3GQVyw9AB3Cgy2Ji3OeQKn+6HhRX0CvvVHegOsiB7QLxaEn877094p7Svi+EmwaWi1ljLfLDOXFppIwWuUPm+LqZB4Si8nb4jy0i5Fbl9UwPKdrv9wRGrCywdTOrl2+NBejaJAsct61mI8DdjErfxrJ7YSGd+CzBKLKKWCiTY50we8HTnpnn+qwk1oO6be+2Mxqn+23nl7bWofMIJxZyjzDf9I6sQDrzmprG3xGLpj9Fd1VA676nnoK8R4QkIZ6nzVge2kxkVhqKXOlf3bcF8NTi1LDsKgvFYIW8eqlXuRyjlD4NMHRHOyFdwFHY4u9t88p4uEgHAtSwb/pjF7y8i2RwjYzgcaRODUsX7bDfloqE5GSyVtWbrTl7Y4gL4bvEMfGXXvm79zKm+01X+HCNgPBpI5iiIDQ/MO5pEHXqftCQYrxBukEX52ey91CB128BFnPm6rLPc3S+BQpOl7Q7emzySWQP7fSJnjewnu8bYS+ZK+GVdlc3ODi0WM/zb9QDWtlKmy5ofyuj04YQed3VNlbgNsphDWKnpUG0etcymObxmC93ttekxcJrLn6foJf4RQaUo/xJCTirWNGNiaf7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB8284.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(11063799003)(4143699003)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+umbsM6/p9w6xwBlA2HyMV0bFUp6M6mMOVKI2RTF9fwh3nvLRrUD4YTJUvXG?=
 =?us-ascii?Q?vH/mCDztkA7jM7ZEc1eC2N/K3uDEIU2cWpXk04TJZdsivw2aCAdp/WYpse6y?=
 =?us-ascii?Q?D43waRfBGPdbovzz0v8IonRfeq2sQcDtVNcxy6AzzEipGKzm8ZQ/BzlQx2jb?=
 =?us-ascii?Q?yPZkZAQ7WDIPN4x924ULPRiuRCFSfCHjXKbbOPQLZg8Tu/vP6XIOnSZ9R5fE?=
 =?us-ascii?Q?ykmutZ5qVP6xUPPe48Vu6m3cqt3z5M3mzGwgQc6C1hrKh4nW0irHWZK7yqeg?=
 =?us-ascii?Q?B26ejYaTHBDGT2opNwIfGkSs+JD4+pZaj4ve/ciNbG0v9tQuYAAbs3Sq2hHI?=
 =?us-ascii?Q?dw22dQCXo4kgYSlmkA4l6z/HWNpxQF+WKji+hz0JhLi3lIblOIfpztxga+Bs?=
 =?us-ascii?Q?F/efaf3bK8vn+Z6XvKJCrt58Z/JeaGzHoN22wuQhx/IIukGjdKCy82Ahkr8n?=
 =?us-ascii?Q?+sv0EcSqQt9ODooFGk4BHThqGOsVSXgWDYejzHnSqvoMlvXL8Dee/G+VZ7CY?=
 =?us-ascii?Q?qdVIe9ZQQb+znTwmLlzyR4R/ZsrfJsUd9rk4yMDQYlxPjat5lbewdoejRTwa?=
 =?us-ascii?Q?q8yiM5DzR+nw+7wQ+DcAbMIpbFpHx3emhqab3CEzqnz2mBp5gmQafUmmOhpV?=
 =?us-ascii?Q?TrDrVQg0hPb7xACSylBNPvx3Mj+px/1W+M8Wg+xXxuhoxm9YVGsS5HGM3JCm?=
 =?us-ascii?Q?zKBKfALZ7q76cyOqtMF8rUT+JofTlHKMVzjgDnEZu1rlXK7c49B8FcSXFVzc?=
 =?us-ascii?Q?IMd+g9MOWEArLAHVjXCgvGlUWT4Is9nM1HcRpFkmyr9cdEZ3zvahyRiZkvaZ?=
 =?us-ascii?Q?t8YRS5xp+YVlqHNTQF4Sr3ozE7viHR7B7f/uh4fqfg8buu0H/ZI3s+3RBo4k?=
 =?us-ascii?Q?dKfICVIrrjfBfkLXecwSgKx3cSf5txy+blonjbkBvQN+DsS3cTH8TFyJFMv2?=
 =?us-ascii?Q?7QvNsnGf7rEurxihVdfIzgH687LLas7WA8imEAeY8toktBFq38ZqQkVOxCac?=
 =?us-ascii?Q?UWpKiqWlxdw8XfrMXjoG78ghzTru6zZzGFpf8LcwLdNeqEAENzAyGY5ZiTzH?=
 =?us-ascii?Q?6ZFgmlWI6Mti/zjZODJ+8Cv08pEjxcx4WmIodC5RJAMFXR26inB4eq+JoaH9?=
 =?us-ascii?Q?F/KqveeIKHceUcMENvhCchV80b75zEo32lcqC2td49kmySV+Me6aPRrxA7iG?=
 =?us-ascii?Q?/YZBZi1TPhAS+1oDauxOZzsPVOMnL+EtqgXYlzn01nGML5/uV4MIKiFn98lA?=
 =?us-ascii?Q?nWtXXKaZe9yfE0/oLacsh1Ozef5dyWiFwb0w0WMfd1OlEyejtXHEee2Ywyf9?=
 =?us-ascii?Q?Uo1eHhF8zxXC2oJyToTsmV7xYuSUsCVxX1tRw7vMYGjVRcPFLesuEZmPMWx9?=
 =?us-ascii?Q?D97xcO8LUhpcCqCrHExdVClZVE96nS1QM4bVg+G3D8iFBl2TLOJcPkEYLPLi?=
 =?us-ascii?Q?KkeVZlBJ2yiUilh60aaH4OUV8ZDcjj7h549hX3JNyvb8aUV0b4V/HbA2GVvE?=
 =?us-ascii?Q?W03s2aGKvzIzMdfNyNXCGOC3EFArjheNLWsHmBYKWkZjka3c+S0Qi8VjMJlx?=
 =?us-ascii?Q?KVFqQ2mCEFhH7UppCyoun/g//1TgQXb9YsSH7C89qvti53ctImlkIv23cMfm?=
 =?us-ascii?Q?vUIB+HKKNZYT3ysmi0ou1Bi3cRhjO+JrZwQ+tRmFTt/iwaCyUmHCniy9HeBh?=
 =?us-ascii?Q?nNp7Bv5BaLqlpSSsLAQmVYwhKBeo3e1gMFQY0Bz+PH+JhKMT+LwLgInsZzEf?=
 =?us-ascii?Q?DPsBhr/1Eg=3D=3D?=
X-Exchange-RoutingPolicyChecked: lLwBEouxEIQzM1a5X+7FisV8Njsvx2XITRYexvHHN+UcWA2QqpaQw6hOaE6QsrrdDa/OVALC7tQkY2Dq3gGu/5iv/FncuWUtbkQY+nBdydB38WtAnlpzmWpgIguonHcOhoVLIzq53L40/DM9MEboFyEQ9mLII2lz2gXTqs/Zq2CamcL/XV7ODZFByzTfo+C/kK8H+7tGweBrv/1haL4js4ocObEpHnfzdXTq/hJFbToLxpgttmx5wQUz3Ecwf5vye7c/LB6wpKLuoWc+xU8RclvdNEig11iEaadJlnJPR2HJYC7Tez7/DBckQMuzNXfvkOJHgrpvBNQszMeU+JgCpA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 41bde000-d4b4-4cec-c5ff-08deb52c3a7b
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8284.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 22:24:30.0375 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TSRnupWI5+7F/OJ4BGxm/xsgBMRoFtXhRGUCM5vJHIbduoKjg5poucGQ+MMRIesGUHjt2pyHkBA9akb3BIA9vQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6774
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

On Mon, May 18, 2026 at 05:54:26PM -0300, Gustavo Sousa wrote:
> 
> Same comments from previous patch about commit title and body applies
> here.
>

    drm/xe/rtp: Ensure oob_was doesn't evaluate rules with engine types

> Violet Monti <violet.monti@intel.com> writes:
> 
> > This commit builds on the implementation of the GT WA testing, increasing
> > the scope of testing to include the OOB workaround list. The added test
> > checks for workarounds with an engine_class rule, and raises an expectation
> > failure if any are found. Unlike the GT workarounds, there are no flags
> > within this workaround list, so all engine_class rules will fail.
> >
> > This test prevents future implementation of rules that would apply an
> > engine_class rule without an active engine in context, preventing rule
> > errors or mishaps.
> >
> > Signed-off-by: Violet Monti <violet.monti@intel.com>
> > ---
> >  drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c | 20 +++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_wa.c                    |  2 +-
> >  drivers/gpu/drm/xe/xe_wa.h                    |  1 +
> >  3 files changed, 22 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c b/drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c
> > index 100cac379b08..eae3262775bb 100644
> > --- a/drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c
> > +++ b/drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c
> > @@ -24,6 +24,18 @@ static void xe_rtp_table_gt_test(struct kunit *test)
> >  	}
> >  }
> >  
> > +static void xe_rtp_table_oob_test(struct kunit *test)
> > +{
> > +	const struct xe_rtp_entry *param = test->param_value;
> > +
> > +	for (int i = 0; i < param->n_rules; i++) {
> > +		KUNIT_EXPECT_NE_MSG(test, param->rules[i].match_type,
> > +				    XE_RTP_MATCH_ENGINE_CLASS,
> > +				    "OOB_WA %s has an engine class rule",
> > +				    param->name);
> 
> Like with the previous patch, I think we could simplify by using
> something like
> 
>   KUNIT_EXPECT_NE(test, param->rules[i].match_type,
>                   XE_RTP_MATCH_ENGINE_CLASS)
> 

Agreed. Will add into V2

> > +	}
> > +}
> > +
> >  static int xe_rtp_table_test_init(struct kunit *test)
> >  {
> >  	struct xe_device *xe;
> > @@ -61,8 +73,16 @@ static void rtp_table_gt_test_desc(const struct xe_rtp_entry_sr *t, char *desc)
> >  
> >  RTP_KUNIT_ARRAY_PARAM(rtp_table_gt, gt_was, rtp_table_gt_test_desc);
> >  
> > +static void rtp_table_oob_test_desc(const struct xe_rtp_entry *t, char *desc)
> > +{
> > +	strscpy(desc, t->name, KUNIT_PARAM_DESC_SIZE);
> > +}
> > +
> > +RTP_KUNIT_ARRAY_PARAM(rtp_table_oob, oob_was, rtp_table_oob_test_desc);
> > +
> >  static struct kunit_case xe_rtp_table_tests[] = {
> >  	KUNIT_CASE_PARAM(xe_rtp_table_gt_test, rtp_table_gt_gen_params),
> > +	KUNIT_CASE_PARAM(xe_rtp_table_oob_test, rtp_table_oob_gen_params),
> 
> Yeah.  It is unfortunate that we need 2 different functions here.  I think
> in the future we could try to have a single way of expressing RTP entries
> instead of having two different struct types (xe_rtp_entry vs
> xe_rtp_entry_sr).  That would allow us to unify code specific for
> processing rules in those entries.
>

I definitely agree with unifying the code. This series was difficult to
implement initially due to the separate setups for xe_rtp_entry and
xe_rtp_entry_sr. 

> --
> Gustavo Sousa
> 
> >  	{}
> >  };
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> > index 285072fe0a47..5744bd3f8be9 100644
> > --- a/drivers/gpu/drm/xe/xe_wa.c
> > +++ b/drivers/gpu/drm/xe/xe_wa.c
> > @@ -802,7 +802,7 @@ static const struct xe_rtp_entry oob_was_entries[] = {
> >  
> >  static_assert(ARRAY_SIZE(oob_was_entries)  == _XE_WA_OOB_COUNT);
> >  
> > -static __maybe_unused const struct xe_rtp_table oob_was = {
> > +VISIBLE_IF_KUNIT __maybe_unused const struct xe_rtp_table oob_was = {
> >  	.entries = oob_was_entries,
> >  	.n_entries = ARRAY_SIZE(oob_was_entries),
> >  };
> > diff --git a/drivers/gpu/drm/xe/xe_wa.h b/drivers/gpu/drm/xe/xe_wa.h
> > index 17dff615e507..7ac6d365b65f 100644
> > --- a/drivers/gpu/drm/xe/xe_wa.h
> > +++ b/drivers/gpu/drm/xe/xe_wa.h
> > @@ -27,6 +27,7 @@ int xe_wa_gt_dump(struct xe_gt *gt, struct drm_printer *p);
> >  
> >  #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
> >  extern VISIBLE_IF_KUNIT const struct xe_rtp_table_sr gt_was;
> > +extern VISIBLE_IF_KUNIT __maybe_unused const struct xe_rtp_table oob_was;
> >  #endif
> >  
> >  /**
> > -- 
> > 2.43.0

-- 
--
Violet Monti
