Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87D48C3271E
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jul 2024 00:29:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D72A10E211;
	Tue,  9 Jul 2024 00:29:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kdHfPmSA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED7E310E211
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jul 2024 00:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720484980; x=1752020980;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=5N+j3Po94AfQmC7+OvD8p1OmHURi3noMTLFzYIocIBM=;
 b=kdHfPmSA6m7avQhMo8ZNlF4EPXFTihY3YS5Aw+RfU98dE+CL9+fqBmA4
 HBouNN0HQBWmYGDnYEmQhLDSzbfghaLVW/EDTipKCS2LtI4au3YPjN2PI
 p+h0ca6JKslj/5Zhp5sMJ7IgDZElOnTbsmGRhLx9xqbcnj3GDuI1fecQV
 aZTHWdf5jR30WStb9a+0lUHm+MZ8o82NYrdSmY6UmkfgIiXz9SMwPKrS/
 2KVXSD4Jg+84ad1Jz/fQBVpREHmuLSv2VXGFTbxtgju7MEZWU+Fslfgmd
 QkMa2hsnNtr5X340wto877dhxKszL+hcujcV3UO/OOcgrQ5+DcvSf6CqE Q==;
X-CSE-ConnectionGUID: sX/OomFdSYyzBfF1Nhfj6g==
X-CSE-MsgGUID: 53LXNTMIRrmSfr57Q7Eshw==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="17665424"
X-IronPort-AV: E=Sophos;i="6.09,193,1716274800"; d="scan'208";a="17665424"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2024 17:29:39 -0700
X-CSE-ConnectionGUID: ne6pIyWuQSy5exQoR3yevQ==
X-CSE-MsgGUID: 8610J6d4SN24XlakmS42jQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,193,1716274800"; d="scan'208";a="47554651"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Jul 2024 17:29:37 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 8 Jul 2024 17:29:37 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 8 Jul 2024 17:29:36 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 8 Jul 2024 17:29:36 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 8 Jul 2024 17:29:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TzQtNQSkjYvm9uGCLeLu6KwMlKkXlB/l+8dhHFewdVcPnHHxh3f6DOlKd1fT0PomVhnYtZc1eFnMNymfZoyjgfBArATeEnflAsRbY78Jt6D3l7PlZV+2qpRpIYEaVS5y/zppH0Ei4vKXHVOXPkUO14wd5L+aTmXdzSfaMMAdQv4qHmicPDODVw8UxosoU/T5hSwEx3uV3+MQjt1TrqVRqUTuanzfGR8BWFXXgjwpOztbpMNTZZe3lqd/A+YDOzJHtB6zEk6A5KiL3ncWnb0q3NmrtGmO4THDtjohnEz2qut2Z1ZbhEKwsm4rxCo6vjrP23tztBlZQI3ga2is/Fvf3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=11CreHfhUMV2ODauqrpMSAXZKC7mfLKwfJpW6fr+KRU=;
 b=MOx12zC21yIc4vUEYTCor+hdquUXPOUXzO01RDXYEHmanD0H1VZ9G3W6nj/gU0sudwYmNHaR9qRH+ETvx7dW7NDUf6hFLJnK/LDk7kEp2hpKSHZ99dkin4eVGPfz15g5+9HlBm8UMA1qNl7aIvGmyzMrYRsyI6ous79FkacNs0qXScPRkYPnhgiHbJqp4geeWGHPKNZLDwfdoPW21DzPo34dUALEfQbYjqu0El0p7qXKbmOmRh4NwWgixV3j1vYuSxD/5Fhua4Yyjx2MpCHsJc2JqOxzJ09mzdultfcR8TU3xNdUCwmzYd0nNIGEyDAPfSC12x2ZQUvDMtGs3g1jSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6527.namprd11.prod.outlook.com (2603:10b6:8:8e::19) by
 SA1PR11MB6686.namprd11.prod.outlook.com (2603:10b6:806:259::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Tue, 9 Jul
 2024 00:29:28 +0000
Received: from DM4PR11MB6527.namprd11.prod.outlook.com
 ([fe80::5a48:57be:974b:8ee0]) by DM4PR11MB6527.namprd11.prod.outlook.com
 ([fe80::5a48:57be:974b:8ee0%4]) with mapi id 15.20.7741.033; Tue, 9 Jul 2024
 00:29:26 +0000
Date: Tue, 9 Jul 2024 00:28:43 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/5] drm/xe: Add ref counting for xe_file
Message-ID: <ZoyEO5sqdnuWzKH6@DUT025-TGLU.fm.intel.com>
References: <20240708202103.3347869-1-umesh.nerlige.ramappa@intel.com>
 <20240708202103.3347869-3-umesh.nerlige.ramappa@intel.com>
 <5vo72c55ibxeyhyokdmr7ogilf25fo6jk7hht3vkc7ekkixgpl@tmdzibnr3mjz>
 <Zox1iBxWvN7GtG2Z@orsosgc001>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Zox1iBxWvN7GtG2Z@orsosgc001>
X-ClientProxiedBy: SJ0PR03CA0365.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::10) To DM4PR11MB6527.namprd11.prod.outlook.com
 (2603:10b6:8:8e::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6527:EE_|SA1PR11MB6686:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ae07bc9-1369-4a9d-d7f1-08dc9fae3040
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9k+Z25AI3AkAZCJJsjeARkqW4wxYLMiZYptCIUA0lRWxluXfjR66gTS3XXJy?=
 =?us-ascii?Q?BihiRftlArp2IW6AojGuJTZlsNZeS8egYuZScfswH9wCad2/vV+ngsl2n1iy?=
 =?us-ascii?Q?DpdNQ+hU9rPYYG7k2GZC2jFMFg6K1LCFMUICG+USlDXUI4tT7JVvf/OeSZIR?=
 =?us-ascii?Q?kedVW0061NP2fUqqRqpR0RxvpsNE0PTGRd0O23d97uNA+A3CzUauUXXTqaZS?=
 =?us-ascii?Q?sL+8nSMtaiKBfe7uTquTrzagpKzpkE8m3Dyq1neJf5TYVitz18SjgF9p3izx?=
 =?us-ascii?Q?lZolADz4Zjzw+owRMpzy0XHkrNt99YRgr/r7ldmuWIACylasBZQvxXXnWaTz?=
 =?us-ascii?Q?r8j72LjGRSAdNDorumpmeUx4rs9qsngZR4Xptl2XrKSrEMryNszP2L8y3nYZ?=
 =?us-ascii?Q?W7UIsWM4v3voB8zFiK34YV7eUjIQt6hfA81HRslgaMR3Z7rKz8pFM6ZX0vOR?=
 =?us-ascii?Q?axQUzBuLSt8b5bGhkvmCiiO0JJ1FP0zMTt2HDe/PwoDytfS8DNPy/03y8cnK?=
 =?us-ascii?Q?Tt1WHdnkVXRackArfWfiCzi8bfQtE1v7TN8jBj6hNkCnmoq5tZ60WUy0shXz?=
 =?us-ascii?Q?KOunQHvMXZ4NEjXNzhNW7dJDkbDxQhpxahGuPG+cQ1TdUE1XqNAkV1A8uuUh?=
 =?us-ascii?Q?egTOn3IX3KbW08DAl9PrOg4Jm5LVXqxfmUAf9bkBq7ePsdAhTvQJsVcZTDWD?=
 =?us-ascii?Q?ba8DbtZ2ADIO9N8yVEnpiHa5DS1/VfZ6iKxkNLCZNXsj7znp88bhr+llE8jZ?=
 =?us-ascii?Q?HG6nBvbRMmHetxp7Q1tBIxp1Cl3lrop8CUNnCFEzXTflKnfEioUEK1lv1S7a?=
 =?us-ascii?Q?ZAVydXeaYuJLUd6jv0MSeTMWBJ2Tes9FYHi/PUHeskkwYsO52arccPnAwUg6?=
 =?us-ascii?Q?GwBtj/qRwWdvKt4Addo0/HCzljJ/96bI7RZNq+aWR4iygiMlgTlVag811uwL?=
 =?us-ascii?Q?eds3a7ejEAu7x2pROJzoVuzIxNg35bwnF/PHizBDd6+hPyCsQWwXvlvq5prv?=
 =?us-ascii?Q?bT+hJU8CUdOSrwJyTKhbJBdIDgBmeq7KvqdrO/yTweMUgzRRpxRug491WzH9?=
 =?us-ascii?Q?6rym1jEEhU2n0kHweaqhiMkqmBMn2kQnYHO7WtcRSmue/fTyAOmQA3aDKAzZ?=
 =?us-ascii?Q?KSpwVqN9MthaG9Fhbg/YRamu7oom0nX75yLIY8hLZ3SkZFC3CQqfXQYmJpqW?=
 =?us-ascii?Q?z6NGi0fqYcHOE8vd4JanBmNBRmrO0HhIRKXMN6FZTed73HYE8znEyZV/vzZp?=
 =?us-ascii?Q?gKrpe9IAovbgndLvNTpf0MV7QW+rfEGjEoqxvF3yGnFgS82tbAkQffIiydEy?=
 =?us-ascii?Q?YtAvji7RXhDnVZC+5q4X+cAgccSQM9Ty8uf7GtKeS7P6nQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6527.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?o2okD3e+HNCU05+mAtKmP+rfk7fcIgbXh6Oz0AfWHMUbWlv+MoLATSAQiIQU?=
 =?us-ascii?Q?Y1NJj4f+X6RO0Yk0fIXFy56t0f6DRXEvKYShikYkYIfH1+dltVEg9fq2RV8h?=
 =?us-ascii?Q?BnC6n0qR+gf10TADO0JF2XOFNU+KN5gXLk0FAs+QYXkogtWj+aRO5sZjlMe5?=
 =?us-ascii?Q?taJ5ui6mwgKKoCHqsPk1sG089kYetoWoFIwYjfWRk7zzVWrGYPpV/F9FlsUn?=
 =?us-ascii?Q?vqKfQ7e7V0Uh7G4M24POobPQckHKv4xY2cucmZ38gM6Ac4qk0m4oOMcTbDcH?=
 =?us-ascii?Q?+cmevbS3g1iJsXNVI3hGC4RE/phThIX4RB5WNoyQjc2SLJqMbpCeSIXcnMsT?=
 =?us-ascii?Q?3i4hEpUIWgQO9+7Tsge++0NIN8lkZQDF1H+43DihXN8TJddpPE1v1w6Nqxcn?=
 =?us-ascii?Q?87Vh+IUn+NtkLOhkcXF1LyNYRF35cNSd3LwXQGNaCnbQmaQQY64mnDJJZp06?=
 =?us-ascii?Q?RP7fqppnrZcGa/oWUIpkgJJLExU/iUBQPxB4Sxv4F+AV4bQ4axEcdNiNYOfc?=
 =?us-ascii?Q?cw9Nw8Do8rs4qDCA8A4YSPVWmDwHJNQGe2rE2ErkcATdLJ8ubTKGq6c7Uvys?=
 =?us-ascii?Q?LRDMpzNTtNDVckWnhnN9PKe7nZcuv1sXfX1VqI4+l81pxVOHXfsQPiQLzaZ4?=
 =?us-ascii?Q?//GHDXPElFe1JlrB4tpbLIT/TMJ+ht9uMyeI2WnAbq50FZfRX4z41vRco/Bb?=
 =?us-ascii?Q?/rdoFqNA4QQ3bSeW+4B3LnL7cNkHkx7+jk+iCpMcNMbFp2dIYKRcrm1YaYo6?=
 =?us-ascii?Q?3BFpTPYu1XNx5AxcnTEeXcmVnDC3+sqWraxR1/oLOA3kyd7WVTLYGnJ60i5F?=
 =?us-ascii?Q?MOz8kAt/jTA/jAUa6xnfSaRNiTanNZ+yty1Kah4GQ4rFjULUx1XlpojjZrHX?=
 =?us-ascii?Q?JqHJqdhUotRyEciJZ2Dzh5fLiquCNPyloyaMXi3pi1BGeHbir8AYACsmvDpF?=
 =?us-ascii?Q?rLsRu5kR+X41lFhB18mqO3vOzdzT+Qs16YXkNjEV0OTq5D17WkMaCxBQPgjP?=
 =?us-ascii?Q?GtOKjDGPVviALeRuUAP5pFL97wvmeylnuQqSTeMcMHsm2HGms6SN94U7y38R?=
 =?us-ascii?Q?3sMLHimZZiFA30Fgox3Qgs9oFDnILZum29T03qXUrQvqi3xjdl5VOygOztFh?=
 =?us-ascii?Q?1ZdsOaHFaQkY2uzOTa72ORy6E1ch3exqGppAXZ86BE7qzl55i53kF3xAKAnj?=
 =?us-ascii?Q?+Je5prsIzG3RtZBQMFEsYkM5YocOjUUUjTFklvDyyRNK0BBJrjUk9MTKLjCq?=
 =?us-ascii?Q?//CN3Iks0m9mYka8KmTofZzhiH+N0KmQyRz0+kwlkbZWBGu9An+/r4ukDeH/?=
 =?us-ascii?Q?f2Dx8ZWc06I0uNagHeCoub6jZRfpkUILdECx/ioibY8qbmJbUErk4borP1QD?=
 =?us-ascii?Q?SvPJnE7wsMmGQnb1+gDiVm6nAznsSwt5fvfIQAsThzbFzEYfu7rhIdXO4i5F?=
 =?us-ascii?Q?hJpqaOPW+QfH6pxS+dxgUtldF3MAEXMNdufcvlR4BPF76m1Zrd+nEBC2zZA8?=
 =?us-ascii?Q?D5W2aIzl4y3DM4141b5WnetMh8GVpb69OcV7H5EM2Vkz0yv5jqfb8HfnVV6m?=
 =?us-ascii?Q?yHDV/ZSH/AypnfWrXkb99ElFj1mTl8Q7DUrAH9roFXSoVD5v/Myz17pCy/3e?=
 =?us-ascii?Q?HQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ae07bc9-1369-4a9d-d7f1-08dc9fae3040
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6527.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2024 00:29:26.3456 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: js6fb9lR3HEBsT/3EuD4ARa3k0kWRbG37tcpHXiTFfXyRZAGeEaDmqdlpTCD1sKngPEuGIlKayMDgHqGBwYskQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6686
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

On Mon, Jul 08, 2024 at 04:26:00PM -0700, Umesh Nerlige Ramappa wrote:
> On Mon, Jul 08, 2024 at 05:52:00PM -0500, Lucas De Marchi wrote:
> > On Mon, Jul 08, 2024 at 01:21:00PM GMT, Umesh Nerlige Ramappa wrote:
> > > Add ref counting for xe_file.
> > > 
> > > Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> > > ---
> > > drivers/gpu/drm/xe/xe_device.c       |  7 +++++--
> > > drivers/gpu/drm/xe/xe_device.h       | 12 ++++++++++++
> > > drivers/gpu/drm/xe/xe_device_types.h |  3 +++
> > > 3 files changed, 20 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > > index babb697652d5..e6eacf1bcce0 100644
> > > --- a/drivers/gpu/drm/xe/xe_device.c
> > > +++ b/drivers/gpu/drm/xe/xe_device.c
> > > @@ -87,11 +87,14 @@ static int xe_file_open(struct drm_device *dev, struct drm_file *file)
> > > 	spin_unlock(&xe->clients.lock);
> > > 
> > > 	file->driver_priv = xef;
> > > +	kref_init(&xef->refcount);
> > > +
> > > 	return 0;
> > > }
> > > 
> > > -static void xe_file_destroy(struct xe_file *xef)
> > > +void xe_file_destroy(struct kref *ref)
> > 
> > why do you export this?  I don't think anybody should be calling
> > xe_file_destroy() directly and this function being executed should only
> > be the outcome of kref being 0. Also, if it's exported, it shouldn't
> > really have struct kref as argument, but rather a struct xe_file
> > 
> > 
> > > {
> > > +	struct xe_file *xef = container_of(ref, struct xe_file, refcount);
> > > 	struct xe_device *xe = xef->xe;
> > > 	struct xe_vm *vm;
> > > 	unsigned long idx;
> > > @@ -130,7 +133,7 @@ static void xe_file_close(struct drm_device *dev, struct drm_file *file)
> > > 		xe_exec_queue_put(q);
> > > 	}
> > > 
> > > -	xe_file_destroy(xef);
> > > +	xe_file_put(xef);
> > > }
> > > 
> > > static const struct drm_ioctl_desc xe_ioctls[] = {
> > > diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> > > index bb07f5669dbb..2a8b370b1fda 100644
> > > --- a/drivers/gpu/drm/xe/xe_device.h
> > > +++ b/drivers/gpu/drm/xe/xe_device.h
> > > @@ -169,5 +169,17 @@ static inline bool xe_device_wedged(struct xe_device *xe)
> > > }
> > > 
> > > void xe_device_declare_wedged(struct xe_device *xe);
> > > +void xe_file_destroy(struct kref *ref);
> > > +
> > > +static inline struct xe_file *xe_file_get(struct xe_file *xef)
> > > +{
> > > +	kref_get(&xef->refcount);
> > > +	return xef;
> > > +}
> > > +
> > > +static inline void xe_file_put(struct xe_file *xef)
> > 
> > I think if you just make this non-inline, passing file_destroy and
> > leave it in the same place, it should work.
> 
> the put is called from xe_exec_queue.c and xe_vm.c also, so passing the
> destroy may not work.
> 
> Based on the patterns below, xe_file_put/xe_file_get will need to be moved
> to xe_device.c and then exported. It looks cleaner, hoping that'w what you
> mean.
> 
> In xe_device.h:
> 
> void xe_file_put(struct xe_file *xef);
> struct xe_file *xe_file_get(struct xe_file *xef);
> 

My opinion is the way you have it is correct.

Most of Xe is coded this way...

mbrost@lstrano-desk:xe$ grep _get\( *.h | grep inline
xe_bo.h:static inline struct xe_bo *xe_bo_get(struct xe_bo *bo)
xe_device.h:static inline struct xe_file *xe_file_get(struct xe_file *xef)
xe_exec_queue.h:static inline struct xe_exec_queue *xe_exec_queue_get(struct xe_exec_queue *q)
xe_lrc.h:static inline struct xe_lrc *xe_lrc_get(struct xe_lrc *lrc)
xe_sched_job.h:static inline struct xe_sched_job *xe_sched_job_get(struct xe_sched_job *job)
xe_vm.h:static inline struct xe_vm *xe_vm_get(struct xe_vm *vm)

I'm kinda confused by what Lucas is suggesting.

Matt

> Thanks,
> Umesh
> 
> > 
> > Looking for patterns in the kernel for example, see pinctrl_get(),
> > pinctrl_put() and pinctrl_release().... or clk_get(), clk_put(),
> > __clk_release()
> > 
> > Lucas De Marchi
> > 
> > > +{
> > > +	kref_put(&xef->refcount, xe_file_destroy);
> > > +}
> > > 
> > > #endif
> > > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> > > index c37be471d11c..ec2b0fb6afe1 100644
> > > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > > @@ -566,6 +566,9 @@ struct xe_file {
> > > 
> > > 	/** @client: drm client */
> > > 	struct xe_drm_client *client;
> > > +
> > > +	/** @refcount: ref count of this xe file */
> > > +	struct kref refcount;
> > > };
> > > 
> > > #endif
> > > -- 
> > > 2.38.1
> > > 
