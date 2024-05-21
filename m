Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FE98C25B74
	for <intel-xe@archiver.kernel.org>; Tue, 21 May 2024 15:33:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 368C210E4C6;
	Tue, 21 May 2024 15:33:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EpPPsn1w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F003910E4C6
 for <intel-xe@lists.freedesktop.org>; Tue, 21 May 2024 15:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716305589; x=1747841589;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=xER+St7YlEtQNxVRZYgPGyUUgRMD/OWOcqnetdUgngg=;
 b=EpPPsn1wia6i1tYam5EHHT+o7zMbn8vnf76MKaESPk8endWsthxeM1+T
 Nsih27L6VBp8pCDmiFlgTdx89AtMTTrHYFatgus74ibwD3k2AAopf/12y
 9s+59jnT9b+nnh62BFdbkBmeQ0NyL8mq+Al9FoYKLrRNLC0JYWSEEuC5T
 ePKyimmhimLZ6oWPw7mw7ZIgoo+eKKdZgNrHG3yr5s/JiLjEI3xV0JETj
 mf9yj2d8cVZchi8IVR2v01TI1gkbNE2HCZLaE8r8IKgN1QCayxhDLzkxZ
 75T7yN9UV7kRgUeGMVjIWXCK2WT2TV8h7Z/1QZfL1Yga6rZ1Z+9rK+tqB w==;
X-CSE-ConnectionGUID: Ac031UyfSZ2I/6pQa4bpnQ==
X-CSE-MsgGUID: LFkDV5E+Sl2JC6Nt6XEAtw==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="23117017"
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; d="scan'208";a="23117017"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 08:33:08 -0700
X-CSE-ConnectionGUID: idg6uGc2Scuq/C4guxEBfg==
X-CSE-MsgGUID: YiioXjKpR8CEJXZ73eAB4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; d="scan'208";a="32886223"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 May 2024 08:33:08 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 21 May 2024 08:33:07 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 21 May 2024 08:33:07 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 21 May 2024 08:33:07 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 21 May 2024 08:33:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dN1MkchVwf5SKObpzl1sX8LseP6j4+Ux6MdiA8rPEMVIY3dcDI71ucFFbyN7WLT/a0aMMku5/2xyHN/WIGiVHk2cohoUlj96EgM4R55+aWJoK5Qv6doBlLzGKJLUyro3hwTJvbda7MwSSH1B7peBb6KzrHAnVqZckgJaxPLZA8l47eLvFx5hnYtGI/ili5E3jPLNeWu299Qgu3A+ifNPHiqwtF1D4sQk66QPmwDZ3uMZ5/MAB9b7ZgbYRViQi/Wm7MtFItx9F9kg02ODwBeCpjJjRJ8gJQACTiznTV+TgcwQrADy9LEk1f1t2cwenQOsyx1+8EzmY9oe/rcnsgeiFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4SWX4E6RkvIVPEEKytLtz3S+Hiik1QFn74HvJP4qSrY=;
 b=CpK6sX9kONDxpLLKCkWyA5ayMcKBV+abiF7DyVpbBXcPuubyyEp934q3fzOONQrWO9VkAa6Ubts0HNre/OV1YdMuWkd6bnlTmm/RQg/QOFdJxaq5l8KDunaSnqfhYYArzQBDM9p/IkBnQh2hiENlnDyiO/Jpx+sXzmz9y3ItsNk2BWUuIWigpBgHrmwVrcw1kJVf+kh0Sj+7BzVLufX6rdfG2V2ZXCSyaak5xH39hB7WS2S4BiYiwfAOSMNk1wb/MgXRYCDwvw+A6eemyBjKbYai9sz/4rNxZWgdxc7Exm5OCvrn6BFfBCRm0eNOKKrWDs/MtXycfLKyjuQkvOweMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by SA2PR11MB5084.namprd11.prod.outlook.com (2603:10b6:806:116::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Tue, 21 May
 2024 15:33:00 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%3]) with mapi id 15.20.7587.030; Tue, 21 May 2024
 15:32:59 +0000
Date: Tue, 21 May 2024 15:32:34 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: Nirmoy Das <nirmoy.das@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Add warn when level can not be zero.
Message-ID: <Zky+kn5n2a1f31pT@DUT025-TGLU.fm.intel.com>
References: <20240521103623.11645-1-nirmoy.das@intel.com>
 <Zkyq4Tzh73D9yeXD@DUT025-TGLU.fm.intel.com>
 <552219db-7505-4dff-851c-71ed534f884e@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <552219db-7505-4dff-851c-71ed534f884e@intel.com>
X-ClientProxiedBy: BYAPR08CA0059.namprd08.prod.outlook.com
 (2603:10b6:a03:117::36) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|SA2PR11MB5084:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fa7f0d7-1880-4540-a376-08dc79ab4b82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?GaeqNQ1r2pATYmep4zMleuc+9wWq8hfG2vQUmwReFqFfa9lVBdWrnwUrP6lt?=
 =?us-ascii?Q?45XtqvHUPqj/Q2M69QEuFatqpIkG05GoJNRVfEVgJYs3mEtnDmWoxMPuigPw?=
 =?us-ascii?Q?ek4POvrZEdsO7ztDFIrrGoJquUNYJpnTFM356269tSsznWv6XjVADjnE0+/1?=
 =?us-ascii?Q?o6GaJPaZdNgGRnxc1haEQ6H1X4b/en2Q47fzZ3hPHNOTdnkNgr/EBR57M24b?=
 =?us-ascii?Q?9DFrW85HVY2dDhF2vb5fu8PWhQWu7vcukng08OSK9WTmJI/tC2ZfZ7EKVxWB?=
 =?us-ascii?Q?07NX03oeZaianhXTLE1eqBq5t6+hAcTUSGmwJF2Fge3cx32VUN0tM35rxymE?=
 =?us-ascii?Q?z+7zzCQKAecvIDSo+AESEv8qogGTF8twmMpdLm+7BUWoupWny++KmvoNB/Hk?=
 =?us-ascii?Q?aF+OJ0M5g1dF2BexwQsMYDH/CT+QVUJqwnUj5LHLJIFggoP0pGKkXmGSBcNA?=
 =?us-ascii?Q?txDFdq0k3yoX7AcMI5mCYpXZI+OTiJesa7pUGxQy00uamABZ6bfwZb+Cxdrv?=
 =?us-ascii?Q?OtBS/QAPkM3Y6e/1z+j1yO9TjGR0DXPg9jhn46PyjGPJdPX1BxuOw1+ay5fJ?=
 =?us-ascii?Q?eRB2wuXIGhgbBmRxRGrmFLDMTeD6s3g7nEceaOtApSpHFBwIh/zLmwgbeuKy?=
 =?us-ascii?Q?kMQPCs4BzpfaXHTrxFgIS3TX1emt5j7PIqkbkMLv5ZHODns3oqqMP4PuoEaS?=
 =?us-ascii?Q?uCM+zsR/7sS9JrCKJnvke4XE6UDSlCYzWuZzwTAdfLBuT519ChDD0jdE1Cm4?=
 =?us-ascii?Q?uM8+xy21Znk2O2WF5PfdDvAuwDHem/qg4pVR/9pviCjX+IjoangMCR7BZb0m?=
 =?us-ascii?Q?C5pXvVN6R6QOGM/9fJpK8uACZ4pyCxEvMeiEU+W2Br5Z8YFoUtEIzbZLPkRy?=
 =?us-ascii?Q?bZrcpFvp26/JGsY2l2EdRjc0K58zzKZ/NG2E7udFPdHCx/Kp52itw1wdZmbH?=
 =?us-ascii?Q?26+bXxgnWxr6i3bozpwICqX1DYQXKICMPJ0axSao6dnkyzKpYSszYARNVT7u?=
 =?us-ascii?Q?XbM0fONqIHsxthjhaF10KvkfiUy9yyV5LisujTtIPwzH2unOn4wtsvpGSlKw?=
 =?us-ascii?Q?f36CRrpfztvJybf59njRpHCeGsX6tJcTAwiOns6t2w9/X6VkWYNP1gIYC3JM?=
 =?us-ascii?Q?Wtohi13fDyBVU8OYYhgoyct+CRSDk7bwPMN9LDi0qItY1y3GNL87SMS1O4L/?=
 =?us-ascii?Q?0XCiuv1AbUBCxj3wBYGQxMAQMTK29QavwLThnWf8My+VdKocyi/rMiVHaOqv?=
 =?us-ascii?Q?HKiRZW30fp0enrUPDGlBuFCW7Y0sKb5puCIjUP3bcA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0pdAjfPIAAcbfvqGld2YcyZS1ZtqTsvsQZsWKD6Nqx9TPidHuuxUr6PlfZ+I?=
 =?us-ascii?Q?fqLN6Wck0wM67TwNaKfwebd92rbhSpfqwIr3nnqDmldtq/aszw0qyJbKStbh?=
 =?us-ascii?Q?sKwEiD/1eUsxFizy7zGzoLk36qVerk3pwPncPLmsXvst+yPLNb/qfSlo4NkI?=
 =?us-ascii?Q?5LWi6I/Dd6DnZ70M2Le7lwb8fhUUfuaNKF0tV8Ck0PcYqHQ3eXX+Tjji9GRb?=
 =?us-ascii?Q?ljWzr76hVWMeKv1b8vdc0mtEui2Ef6ZTcwaMLkJcyrpYJbL4lwyIvHA2hapZ?=
 =?us-ascii?Q?c3KuExmN461DlaZyWryK13zw+x3RyoxDJivV+YL4sy+FoSjx9F8g3U+Lgs64?=
 =?us-ascii?Q?BEvQN+PuYF/9REyrL5AaeVmOkE+xIabRmUe6ur1IA9OQbJ+TA7GJ+2M62eg/?=
 =?us-ascii?Q?ieLQGpbl6xOV8tb60jktIMyQUx2LBuUacLffHIS1HZAvYfX6uBQr7+36zM7V?=
 =?us-ascii?Q?yf2hsj+AQPc6NbnidngHejOFxaXF4jLIZWm2v+luiHJGCvYIhNzyQ0qhY02D?=
 =?us-ascii?Q?AdANggKR4O407WbxBnf/CPrWtJ9ubcY9zwAdcVu5ZMruIF3X9lVIBNcxtOn9?=
 =?us-ascii?Q?9K56UikehgdfaGvFREAXshpNyDO7VL4T2Iy9ZZ+Q2d8hpsYLrjNzPr+xzlEP?=
 =?us-ascii?Q?Mdl7ZgSG5qWR3RYQlUOUmkELGlgXYPTAuu1VeXARUofIi1RQUtUNjr6rAEQg?=
 =?us-ascii?Q?Goxnagm8Eni5uPOSYT4bWg8KiMbLc9j9aktzHpI6BLltDzRXK+f5XZYV7xMQ?=
 =?us-ascii?Q?qNqnH6vaqg4brOhHoyxKNWghJBAz1OOmZg4IVctGS6/uqOmLqv1nhKx8fy2g?=
 =?us-ascii?Q?U22/LMTgHpC7WgYJcFdaTFbqsmM2/jIuH2wtJk/+vLJDl60+cr/tgabfdMGb?=
 =?us-ascii?Q?paBS+KiLqJCsE6urbksxexcjLN+oSCZ4cbvr8/9IJLQFvsnDbYRVmw+cmBRR?=
 =?us-ascii?Q?pXaGHtiQJ8NKqVHCGB6dG61vwOOUy6Shv2JPrP0MCETwg9MPJQZAeNUHGoKm?=
 =?us-ascii?Q?d8s7fn+E7J+hcbqcaq5uHoMMtj6xsaTBnpR9bw+1BXIRbBOhgwFH/8zr2HU6?=
 =?us-ascii?Q?0OWCArbSTu+FohcemYdHoe1oN4AeDN4K0JAEMMoGgI8OCbrmPi3iNtFGLS9k?=
 =?us-ascii?Q?y4nvekmjZmudYolLPp/YSpuc1vSa3cD+a9gql1/KruJ5O7+G99VDbiEXM8pQ?=
 =?us-ascii?Q?CdFdbBD6Htx3H6uRS8sEbuhVAwHfhwhKRFCg+RgIlOR8MVPveTTaUe5rxjpo?=
 =?us-ascii?Q?qH+ywdVgRASTggVkmrhK+e/rvl4RgpyAYws6z8euLpecJeKI9alBPphfUxc1?=
 =?us-ascii?Q?g6uZdN/igN42R2/HNQXsWi8SpTou18rHcWIE/IEoh1PvA5zZciMJZP4y7y6Y?=
 =?us-ascii?Q?Ad0jbZ7sII89H+bOwmA5qzjTJZlKVycdXPmuqM3/VN7OaUxwXZarij/u3z+T?=
 =?us-ascii?Q?9WPyOY3wYnLDqHBJCsr38h+cfvVBOHWTwXUVZUoEHu9glVeiEIPbi/rR/V8v?=
 =?us-ascii?Q?8Mb3+hCskUTrzEHdRQ9p4oUyUuNcVGc+ySVND2/wpWStpkbqhmUHOOTtYg4k?=
 =?us-ascii?Q?4iJbF8gog8ucZUhaIwAjcrN6AW6suSk6efAfCNdzWOO4fnkR93x8bXO9Z7R/?=
 =?us-ascii?Q?7w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fa7f0d7-1880-4540-a376-08dc79ab4b82
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2024 15:32:59.4477 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WDYd5M7AfcOSLZvQhq7pwgmbprLMhPmqQztIt3k4hAluLfHgG04XcJxQfElwDloNuzNgQ46f3hD47CT3IN62Vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5084
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

On Tue, May 21, 2024 at 03:52:45PM +0100, Matthew Auld wrote:
> On 21/05/2024 15:08, Matthew Brost wrote:
> > On Tue, May 21, 2024 at 12:36:23PM +0200, Nirmoy Das wrote:
> > > At xe_pt_zap_ptes_entry() and xe_pt_stage_unbind_entry, the level cannot
> > > be 0. Therefore, add an independent check for the level. Since the level
> > > cannot be zero at this point, there is no need to check for `is_compact`,
> > > so remove that instead.
> > > 
> > 
> > This doesn't look right. Both xe_pt_zap_ptes_entry &
> > xe_pt_stage_unbind_entry can be at level 0 is 4K page entries are used,
> > right? CI looks good though so confused by that. I think maybe 2
> > independent VMAs would have to mapped within a 2M range for these paths
> > to decend to level 0. Maybe we don't have tests in place that do this.
> 
> Not too sure, but in both cases this is followed by doing a level-1 which is
> then used as the index into some array AFAICT. So if level can indeed by
> zero here then that would be a serious bug. Improving the assert here to
> catch that looked reasonable to me.
> 

Ah, yes. The comment below explains this. The this function is called on
the parent while operating on the child. So to write 4k page entries the
level would be 1.

This LGTM.

Matt

> > 
> > Regardless please don't merge this until my concerns are addresesed.
> > 
> > Matt
> > 
> > > Cc: Matthew Auld <matthew.auld@intel.com>
> > > Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/xe_pt.c | 4 ++--
> > >   1 file changed, 2 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> > > index 11dd0988ffda..cd60c009b679 100644
> > > --- a/drivers/gpu/drm/xe/xe_pt.c
> > > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > > @@ -763,7 +763,7 @@ static int xe_pt_zap_ptes_entry(struct xe_ptw *parent, pgoff_t offset,
> > >   	pgoff_t end_offset;
> > >   	XE_WARN_ON(!*child);
> > > -	XE_WARN_ON(!level && xe_child->is_compact);
> > > +	XE_WARN_ON(!level);
> > >   	/*
> > >   	 * Note that we're called from an entry callback, and we're dealing
> > > @@ -1445,7 +1445,7 @@ static int xe_pt_stage_unbind_entry(struct xe_ptw *parent, pgoff_t offset,
> > >   	struct xe_pt *xe_child = container_of(*child, typeof(*xe_child), base);
> > >   	XE_WARN_ON(!*child);
> > > -	XE_WARN_ON(!level && xe_child->is_compact);
> > > +	XE_WARN_ON(!level);
> > >   	xe_pt_check_kill(addr, next, level - 1, xe_child, action, walk);
> > > -- 
> > > 2.42.0
> > > 
