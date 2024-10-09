Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 176B5CEE345
	for <intel-xe@archiver.kernel.org>; Wed,  9 Oct 2024 20:24:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D79A110E0CE;
	Wed,  9 Oct 2024 20:24:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dyzGsxV/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47CDA10E0CE
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Oct 2024 20:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728505465; x=1760041465;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Q+wGsuGQEAj8K6kWAawP8UTyYi0MZLj+EbrZclfAWFg=;
 b=dyzGsxV/M4E7kGS+UCpLFYJQHKXQcZ4vLMRp/zch5LMNO7695NuqjjHm
 VNRLZD1LBe8upDhtT/t+EzeEIxNl7I5Ch7fjixLLH25Yjb4PUs6RInxUR
 VETK5mHyDyWQmUfxJdfqC/2JRBqw4ZblEslaHOCOIU5ns6SWxTUsMrJpk
 GCXAn5wzIf+r09gB4W6z6WHQG+lK11SAkizEYQ8o+m0imin/pQiG75IML
 GGa4nuuGjNVO1bi6XWsz/bYoGibpvc3h7+SJFRlenG6lVMgkiffJjd5Ql
 AcQIXl8VgfJmshGEFEAr/CT/A6a9shxg1LLhxehsI82qK2cimVWEhF02L w==;
X-CSE-ConnectionGUID: /sbLxNCuRMGKNTfK4YpOUA==
X-CSE-MsgGUID: kzr3kzN3SPK0GslDuiOODw==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="15453287"
X-IronPort-AV: E=Sophos;i="6.11,190,1725346800"; d="scan'208";a="15453287"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 13:24:24 -0700
X-CSE-ConnectionGUID: m0bBPDc4TIipmH9oeaNyIg==
X-CSE-MsgGUID: cOM51SAzRBa76r/wdMz4zA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,190,1725346800"; d="scan'208";a="76575900"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Oct 2024 13:24:24 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 9 Oct 2024 13:24:23 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 9 Oct 2024 13:24:23 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 9 Oct 2024 13:24:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iTcJOvvlxU/6bFJ2ZdMprms1aawRtoVZZ1Fh5+YRPZABNNgcOtGZTePyvyQTBFrxfWkuOlIXC3VkOxBefYBm4PuTKFFcOtuT7cTupF/b0dtzVE9mf8Rq1K8nLKaX6d9+7pmR6vlLIXwmcMquWFsWtCqsd+FsoLzFZKCVPACaJ4soYSLtrFL5hq/LGXHKOG9+Qfu5YBgk74Ko3Rkj6lxERr8AXWMD9f02pUyjGyiLWI740KjBhtY4rCRxVsKfBunnRJmdzekD7m4XXhqy4VodiYP/dyIVahUQer3MxV2UqGOaQnEkFgHwmkTzptC09Bja8V7gxYEmCXHSGipopN60EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wAwtHNChSzf5Qf1DlZXdzI174isvDTAEVINtUlyySE0=;
 b=ikqGhu78aAR6qEGrJHGq9wlj3sLhxh5aSAl4Xv7SHPbR27breHiMMoBf2WrRQMur41SxSI7QCb4QzEymGQa/bZtOQygcYTcbsW1JYJNzc+VpkxvlZzYYoB32JjPOPXsKM3B8X+mDJU/nIVpjmo0wb0C6JLy2qddPNbnq1/IEyD4b9NVylUSDvUIvyU3Dabh60HNmq4qKpTepwWSpoZqqYyeXt/AhdEyYZzM1GimG4SCM6J4SScWqSeTV+gOI8z6HrdKgsi9FmA+TJNsf3Qbq2HNnKmyLWBgJw+gtEf7ScLLMvnljU9SHu4QZdDxOg4C41bURz97TQO4XE3WYMOuggQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by CH3PR11MB7940.namprd11.prod.outlook.com (2603:10b6:610:130::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Wed, 9 Oct
 2024 20:24:20 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.8048.013; Wed, 9 Oct 2024
 20:24:19 +0000
Date: Wed, 9 Oct 2024 16:24:15 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>
CC: "Poosa, Karthik" <karthik.poosa@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Nilawar,
 Badal" <badal.nilawar@intel.com>, "Zhang, Rui" <rui.zhang@intel.com>, "Gupta, 
 Anshuman" <anshuman.gupta@intel.com>, "Saarinen, Jani"
 <jani.saarinen@intel.com>
Subject: Re: [PATCH] [core-for-CI PATCH] x86/apic: Stop the TSC Deadline
 timer during lapic timer shutdown
Message-ID: <Zwbmb45Rm5jOblTX@intel.com>
References: <20241007135242.3028131-1-karthik.poosa@intel.com>
 <ZwVtFJzWMUrTwg5C@intel.com>
 <db359db0916475865e2c2a615a7dfb92eeb65c6b.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <db359db0916475865e2c2a615a7dfb92eeb65c6b.camel@intel.com>
X-ClientProxiedBy: MW4PR03CA0261.namprd03.prod.outlook.com
 (2603:10b6:303:b4::26) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|CH3PR11MB7940:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a7bd689-46e6-40b0-2680-08dce8a05a86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?ijSdYhaih/496RWqRz8x+yb49/msyRuJCi7xlzCesmZ6QWyIcjt9ysqZXy?=
 =?iso-8859-1?Q?bn2uT7La1wJ/qZJ9T4RO7bPwdl6MzIBseI4DaaS0Vv+yhKJp4oNU5u6pZt?=
 =?iso-8859-1?Q?iikTp8W1Gmwk4gO/w0UB7FCF5yL9syf8HwZHjcdUT8SO8vQu6i1ClmspiW?=
 =?iso-8859-1?Q?HJT5iMwUYv5S6YU5KaIGGoFnR1QkPvsu17ikRsSl1SWQ1en+VYFsMmrbri?=
 =?iso-8859-1?Q?wU5reoL7VuHUIGHWhKOQ73Ss5ov43BrZw90yHgqQU8NlRDdsOyVrzS7qfo?=
 =?iso-8859-1?Q?C9mkVWq/fzdaWvfRaOeUaSbSDUVKV3wcK8+LGsN81NSiEeQry//a51SErT?=
 =?iso-8859-1?Q?ewaSRddqpatD3ueoZZ5+aGXQwBJw1SDGI0FHQM3TuJtBrYBKotuZKNdRh+?=
 =?iso-8859-1?Q?xbUqQEE+FOGuh8JWydJX9ryJ3amyq617p1SwboWcUiDsu8uew9GMczkDuB?=
 =?iso-8859-1?Q?sDkksgqKFp9UWia7OKtFxUfD05XgmJlSDSDVPsX5+0X8Q/zMIorW3Hr661?=
 =?iso-8859-1?Q?LYI/Eq2QkYs/9AmPPs5JjHggi6yNisd3vxrEH5gldV4UoqBCGfBb05RHuJ?=
 =?iso-8859-1?Q?7wDEKvCLNzoWOZpTm1/OQMYQHywADRJqRHRQNG+sUdC8AdtAPRA3SMEaBp?=
 =?iso-8859-1?Q?O2u3ev54lKR/QxE5fQqBg/HPv8uy324BnA8zSGpdJsxPhm0yhOmcGdF+xw?=
 =?iso-8859-1?Q?NFqw+dbgqemVml6P2csGEzTaYw8ZRk6o/lpBk2Y/yMTyCDnXooB819x6Uv?=
 =?iso-8859-1?Q?ikBNUPJk/HOrV2Z/0pGEz7D7PgFfQCCZa9sW8jFGftUaazPMjkzD40vhL+?=
 =?iso-8859-1?Q?6hHeNcvbM+ntUxvMMm+epcvgRuDTUHnEWVJzHlxnK2ZS9wP5OJVLEOREAg?=
 =?iso-8859-1?Q?45BGpmbdelf6/6TmwoZUHeaAVUJ59rIYwWM5/Jt4vfC8YYIbSPB3aiTN7O?=
 =?iso-8859-1?Q?R1BqD3c42OqY6XvY3b0laXOA6QO6Mp+tgxhA6wQOSCVijEV1altSDJ93Ow?=
 =?iso-8859-1?Q?86g9qRkljSoklHLAvo0rhTk0ypcmusvFDwjOtNkrQYcVd0QSVv78RZPRaL?=
 =?iso-8859-1?Q?LMuQIFAkj83pNADcKrRuit8sZBMeFkOPYLFAyHsLjHEZvSKOTKsS4KHtbP?=
 =?iso-8859-1?Q?NxwTOX0bhkglVoKxOIoC0OwvTvDOBOlRjqZkP8jeXOLMTjEHE7lfUjEXSt?=
 =?iso-8859-1?Q?23AqCLnEalXff1bz2Y/sNbHFQwjQv+FF2srPkJwO5mEYU1kGT8IbyvZHdD?=
 =?iso-8859-1?Q?HJSY8pAVl6xSUhBXY/w7Zt8sFFQthqwIjGc9BeE1Y=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?tA7+9n7LsFprfSoEGHhFcTdXWH/BIOooYNB9jU/s5KjaKY0V42tmEOimLa?=
 =?iso-8859-1?Q?7G8EuV8Y5rPqg4uEua6d8GRHK/SmAmJ69SGlBSKWY+Y+6awdZ7wItuCzWj?=
 =?iso-8859-1?Q?Ljey+oMtcs3NyJmBOArJB0dq5kP2rR3PpO8M2LdAyhUtZ1FHzLyDcg/1Re?=
 =?iso-8859-1?Q?NZ2lmJ3ErY8KtHBKMD4xLoDLr0ySMWMn4RYOhZnpc1r6q7RrpKZaLaHM6m?=
 =?iso-8859-1?Q?woIhs+gL+Td8JXdOS7mY7xFpp2esaan6F+Q+vwqSORFvgOdRvJU3L19qEq?=
 =?iso-8859-1?Q?pnuypLbQ/n7Fcd6HopEUC1tQ6HB9oSwMQvQiSH7f7+ZU7sYRt29zongIoM?=
 =?iso-8859-1?Q?cggD9/Ozy5Qr2QTwY41yGUzfXT4thUNDzIK0pJ5QbElC1lNo+5vJV+9X+U?=
 =?iso-8859-1?Q?uKkyYPkVwWnzl4E5esmHI4WoW5663YSAaal160IyMy7fMb0SOz+EsQvgNH?=
 =?iso-8859-1?Q?OxMfPfNrdFIzJbPX++yGaLq38uq7Q0YQ5sUJkl74O/BJDIQA+z7+EBDPZD?=
 =?iso-8859-1?Q?7E6bTjEOjNSdhde7N5LvW3Bc3uhdo4XBrB9KVTAbCbFVBYr2+p2dohdWlg?=
 =?iso-8859-1?Q?bhU1jnXAHudndryhtNZKv56W+MOF9aP/ZXfCf2Y51jwVpyCp+/27tpW1hk?=
 =?iso-8859-1?Q?b+Kc7e68O2FNN+c/44kHqdTE6R+X0Oz45+/JvS7mMTvw2ZDNTG/IoTNJA9?=
 =?iso-8859-1?Q?9FBWd1doXGkDvc3kQE29PgSG6Gz1l/ysiXBRmqEtPTURM6Xyon3xxHP9fZ?=
 =?iso-8859-1?Q?zCbx9OeMHpOyOOdwxdmD63+RVtHApoJvuvQXB+GVnkw+KW42PXzUBgJ1Zw?=
 =?iso-8859-1?Q?of/MQqDTfDoylG9t8G9NN7JvPBlsmW9EVmlWaNi1xbFlVUukVdKRr4dxeO?=
 =?iso-8859-1?Q?SGzSFFHafstwzygTl1hUy/pL8pqB4RB80XYqNkut0Yqnfoxdpy1D8NiLOh?=
 =?iso-8859-1?Q?gdp0CjS2w6VwzVKE3NVYUghjk1MFo0pDMzIqstQPvomNjjqp7gfr/CbpHx?=
 =?iso-8859-1?Q?6vQlVd64+TSa/POwIRWswNy/aG2puzvjAoyofTmAfv6b57vJCNje7sFYFT?=
 =?iso-8859-1?Q?/+q9QsOC/UuywFryP6ZDOfHR4OTGP3SPM9fgTto88nnCcczuZLsv0kBYK/?=
 =?iso-8859-1?Q?XFB6H/rtMjNOpiCxI5ZhtulfqzxKvGhPyVinJG2ZUeJYQN9mJhBBG6kF67?=
 =?iso-8859-1?Q?U/Pw2s7YIivY8qarezIvQow3z9viVgvIboIMNbOsL73uocdWKfl1OxfQav?=
 =?iso-8859-1?Q?iF4VpALxrB4Rkei5KRWSSUd2Ydb24R5+phewaZwrvevZAullnZvESpYFyP?=
 =?iso-8859-1?Q?5vVOv/GtYQDdA0SmHu+gKmaDFXyhimT65OiJeyhrQFubvtoYbjA+K3m8bO?=
 =?iso-8859-1?Q?zq6P7nNm8j1BumceCdFtK4p0INKey90FMygYVRUeMfxXkkmnExcbVt5mal?=
 =?iso-8859-1?Q?MZhQa1c4ab8K/Le7XZMCXCUjB+erPdD6/klbckFxsB3/U6hiQylc8qpkPV?=
 =?iso-8859-1?Q?Lu330/6pZ0TT3RHqVRpfxYFaeoNeovUH2GOSb2eDalBvU+hmoLYGc3B17A?=
 =?iso-8859-1?Q?EXdIthwisCulLD79ZBejtoY9mtqgkD7322HCOn6mTV2m3u4ejkXtDxkgxD?=
 =?iso-8859-1?Q?9FLSmAAtGWljUF0Szl6pRxq/aHy2dm+iJ/qCQdntB/N7RNl4YGTAPsNQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a7bd689-46e6-40b0-2680-08dce8a05a86
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2024 20:24:19.7730 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qbrH+9gpjs43YfNnMpHejSxyUFfnUzRVXlgEOu6eHPjW4Q8gJf/y3oS/8zfv+o8tg1vGfXZ00GEPYyM1ECb24w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7940
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

On Tue, Oct 08, 2024 at 01:37:39PM -0400, Pandruvada, Srinivas wrote:
> On Tue, 2024-10-08 at 13:34 -0400, Rodrigo Vivi wrote:
> > On Mon, Oct 07, 2024 at 07:22:42PM +0530, Karthik Poosa wrote:
> > > From: Zhang Rui <rui.zhang@intel.com>
> > > 
> > > This is a core-for-CI patch for
> > > https://lore.kernel.org/all/20240929063521.17284-1-rui.zhang@intel.com/
> > > 
> > > According to Intel SDM, for the local APIC timer,
> > > 1. "The initial-count register is a read-write register. A write of
> > > 0 to
> > >    the initial-count register effectively stops the local APIC
> > > timer, in
> > >    both one-shot and periodic mode."
> > > 2. "In TSC deadline mode, writes to the initial-count register are
> > >    ignored; and current-count register always reads 0. Instead,
> > > timer
> > >    behavior is controlled using the IA32_TSC_DEADLINE MSR."
> > >    "In TSC-deadline mode, writing 0 to the IA32_TSC_DEADLINE MSR
> > > disarms
> > >    the local-APIC timer."
> > > 
> > > Current code in lapic_timer_shutdown() writes 0 to the initial-
> > > count
> > > register. This stops the local APIC timer for one-shot and periodic
> > > mode
> > > only. In TSC deadline mode, the timer is not properly stopped.
> > > 
> > > Some CPUs are affected by this and they are woke up by the armed
> > > timer
> > > in s2idle in TSC deadline mode.
> > > 
> > > Stop the TSC deadline timer in lapic_timer_shutdown() by writing 0
> > > to
> > > MSR_IA32_TSC_DEADLINE.
> > > 
> > > Fixes: 279f1461432c ("x86: apic: Use tsc deadline for oneshot when
> > > available")
> > > Link:
> > > https://lore.kernel.org/all/20240929063521.17284-1-rui.zhang@intel.com/
> > 
> > The problem I see here is that this seems stalled. No review there.
> > Is that merged
> > in some branch and moving upstream and to stable?
> Not yet. arch/x86 patches are very slow to get merged.
> We can't ping unless no response for 2 weeks.

okay, thanks for the confirmation.

I just pushed to our topic/core-for-CI branch.

Karthik, please check the CI results and let me know if this needs to be changed later.

> 
> Thanks,
> Srinivas
> 
> > 
> > Cc: Zhang Rui <rui.zhang@intel.com>
> > 
> > > References:
> > > https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12344
> > 
> > The right reference link we should have in this topic/core-for-CI
> > patch
> > is: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2766
> > showing the why we need the patch.
> > 
> > https://drm.pages.freedesktop.org/maintainer-tools/committer/core-for-CI.html
> > 
> > But was this really confirmed?
> > 
> > Anyway, I'm hesitant here mostly because I don't believe we should
> > add this patch
> > if that is not getting propagated to Linus and/or stable trees.
> > 
> > > Signed-off-by: Zhang Rui <rui.zhang@intel.com>
> > > Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> > > 
> > > ---
> > >  arch/x86/kernel/apic/apic.c | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > > 
> > > diff --git a/arch/x86/kernel/apic/apic.c
> > > b/arch/x86/kernel/apic/apic.c
> > > index 6513c53c9459..d1006531729a 100644
> > > --- a/arch/x86/kernel/apic/apic.c
> > > +++ b/arch/x86/kernel/apic/apic.c
> > > @@ -441,6 +441,10 @@ static int lapic_timer_shutdown(struct
> > > clock_event_device *evt)
> > >  	v |= (APIC_LVT_MASKED | LOCAL_TIMER_VECTOR);
> > >  	apic_write(APIC_LVTT, v);
> > >  	apic_write(APIC_TMICT, 0);
> > > +
> > > +	if (boot_cpu_has(X86_FEATURE_TSC_DEADLINE_TIMER))
> > > +		wrmsrl(MSR_IA32_TSC_DEADLINE, 0);
> > > +
> > >  	return 0;
> > >  }
> > >  
> > > -- 
> > > 2.25.1
> > > 
> 
