Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F01C1CD4F21
	for <intel-xe@archiver.kernel.org>; Tue, 12 May 2026 19:00:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B078E10E59F;
	Tue, 12 May 2026 19:00:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cB2BZyOQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE3DE10E59F
 for <intel-xe@lists.freedesktop.org>; Tue, 12 May 2026 19:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778612450; x=1810148450;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=KcJMyFTvstKxCdNI37m6z4ZmQW4n3XLhGQxa/niknT4=;
 b=cB2BZyOQ2bPUQrrmWXQp3U7x3srlH1qYC/UoYGgH8Ze/h2UGdgH/6tGG
 pjiHrI6eYYCz1YCpGgwZ2mgopxQOn4bolbWj8OAVy+gpxc9icxKx8j0mu
 jANkYnd+8wPGwaBGXCKCovejt9G0+KjRq56qMu6+qJdQrhqRfwfMU18FB
 DeZCu9zRvIp8jfswueHnCtYPflhCl2GhpjEBa+kTadzVLFiCdtUT3HQkY
 ILWvKAijXDRznW5dQr0FsgLsSRQZqlhl9WAtm5+GnBii4CRk+cCuzFrZc
 PFTliMyOce8mR+7KaX7UgAoOIlDzikvSFEmx+kkUh1WL6vwTDhkOzSfFZ Q==;
X-CSE-ConnectionGUID: OhKyLghHSTulyKbZQnCYCA==
X-CSE-MsgGUID: sB7jXLFDS0eGQNXbu5kwGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="79515177"
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; d="scan'208";a="79515177"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 12:00:50 -0700
X-CSE-ConnectionGUID: EWvNRxwLSPagUtYQM+GUSQ==
X-CSE-MsgGUID: jjyCl++mRfu2r2bRIAbHsQ==
X-ExtLoop1: 1
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 12:00:49 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 12 May 2026 12:00:48 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 12 May 2026 12:00:48 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.3) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 12 May 2026 12:00:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SE/VGFnm2z7SMnl9UzsW1Suq/OswVd+6gZdOMzPpwzVuR0e/OG+z7UsP+PuHeHgDcuiAEgMJf3XFPyueJm5yVVU9bkKGRSOOOAQ/nUBub0EYUuSzaDod/iFnKMRFmqrXxjEFIwaO4aCiXzWgx4KwowyNhTh0BwBO6PDTq2fJe8Hb9MWMxdnehpIW4s3wrawClRWKW+itj9AUOefOu56hyJM4dQjaosV9tEtsf2xMuXLLZ7BS7h1kanQBtLRG+7o+/Ckg3Ge8bruHVmysqgqHbTId3SoX7SZZsPQ8jXEHL67QH0UYoLAiZqYmVepX5VzWQqvYNDlJpYElqsx+zZuP6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lampRCZojlgCg6X8Ls6LuLpK0M1qJ3o08NRZHcoaB+E=;
 b=IoiO1lRoPa8zb7+zs9YO+cfPqQgK9QGbQb8wlcGqyN/vvgNHGJ/C2gJu2668FKtLqMy5dlC6ruCFL892R5HcV1AdLas4DYMDzhDlYspWDdCRyM+AeJeGwe/ye3cNhCednzK8+7QYJwbM0NbRGMh3z1fAJxhAWbXMa2CrqApmfxpI+fAlOO4G6vZze8Vl35BvIeACqovy4WEBj80AxALXSO/zTWi/Ksvi30DALKYWlv7J55xU3e0GVA/zTrZxayAbwPaJl+6G8193HQRwTS+l9q72OKfZmyzchDRXJqZslFLvtipNfWzByUajaTTvmgJT4fiHCgvXjMKh4XCw0iHzxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by LV2PR11MB5997.namprd11.prod.outlook.com (2603:10b6:408:17f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.22; Tue, 12 May
 2026 19:00:45 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 19:00:45 +0000
Date: Tue, 12 May 2026 15:00:41 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: Jani Nikula <jani.nikula@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Matthew Brost <matthew.brost@intel.com>, Thomas
 =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v2 4/8] drm/xe/kunit: Add xe_kunit_helper_is_live_test()
Message-ID: <agN42S9zWhJ9zb6N@intel.com>
References: <20260508-rtp-mcr-check-v2-0-9897b147a5d2@intel.com>
 <20260508-rtp-mcr-check-v2-4-9897b147a5d2@intel.com>
 <c4e5c9ed6e931ef2d5ba5b87b7be549c8615f7c0@intel.com>
 <871pfirwy7.fsf@intel.com>
 <619ba2cfdac33128f92c4f83b8573770146cead8@intel.com>
 <87qzniqgau.fsf@intel.com> <agI9Mejxoj5VBRtR@intel.com>
 <87v7ct64oo.fsf@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <87v7ct64oo.fsf@intel.com>
X-ClientProxiedBy: SJ0PR03CA0006.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::11) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|LV2PR11MB5997:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a38ccf9-5d2d-4c7b-6075-08deb058c5a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|56012099003|11063799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: NXWbIphX20QSFECQGotP0x+u74Gqyw1NznfP69lWOuR7QJeraK5w0hsCjYA/ngA7a61qknwRTHk4g2tnSXU97LOhHnT0Ft8MCybgEzheW1B86vXNeZXYb4stB3ampMUNjA2xCIqK2WrzuyEvbe2d1+upnzcF/mPdddLQfIykWWyx+WRkjwDijSFmAqAmqNn55qPurOXX8dBX6HZasMwGOjJxBJgftiC/kw6KUJXoaBPEFuImUdCi0K4pidiPaluctXKLZF16J8sU9CQ630K7Whora40JdAskBU56S6Y1KCBMs6wN+/OAxTndRk/rH+JGSl21yif3kd1QOcnJCJzvr2LD2i2wkcb4qLPfDa5mkSlUrYhkf+mqKTUaw5wnmAcQDKbMwkiEKPGHsA9a3r39+5ubu40d8gjKTU2hIH8tOufbV+1ZtHgnINDR6sg1UkXOsyoOsTtcKUDUih6vx3dpKdvcgNL9aSixGgowhzXSFMbq7SGq+y29W3H48B15RhDv59n4WyM8NE191R1alHg/xPtmyf8yo85Y1WmqXyT4xVuyRuL+1VKysUFR3oArH1JTncYAbBXyNkM7QNbcmp6UUY/SVqAzedyzRuTVyT1oh/V8XGb8hDXEuQBVcOyzDn7KutyLSCgt2BeU4XqOUl20azFZWwwR0ScZmsdBio6wHxH7swpa2eIWbGOgw7sBnXUU
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(11063799003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yYk9EwPzUBrt8t2O8pZugv3NbBYz8MbKbIWoEhdJyozf9/0xg6d3fUb+c1Dy?=
 =?us-ascii?Q?8q16aoN9+qaleZQuzHoxjpMKcCCI5kWwX2ymtwdIGIpG06Rn8MjatJXq1g5Z?=
 =?us-ascii?Q?F2SUCY/XfPgDxgQBPOaU+4yiqc09aOeCFOUkBrvEGI5PbLhY8cmYP9G/iHcH?=
 =?us-ascii?Q?xRUdCUOzf3Nym6177Nxe/43wXBmZyj5HLH8SUzQPLlCOiQsgAHbFUzg6aS5D?=
 =?us-ascii?Q?/VjbQM+byH9BhgYMkUQ4+JL9zehw+URnJ0q9onv5mi0lnnX6KE1RLpg3hdfv?=
 =?us-ascii?Q?n/Fca45vetoUOQ3bOm5v9zZ8fCfdQ5qwDfLAe90Jvh7TY98Yk+o/a6KQhYjC?=
 =?us-ascii?Q?f7uymtOrLOZ1vDrxiuJta9sRZrHN9CgjOV7NLoSONOyxtLhZcQPi8GxCld/g?=
 =?us-ascii?Q?0yFqMw2ghBHJJNw8Y5yajluFYHMZscGf/Uouj3no+f/W6HZsATCbfhEDSUlm?=
 =?us-ascii?Q?hCE5CN56rmx2NmjZaX4RP06hW9eealfz+V6Lsd1uzuw8ZQdJLDehirGj9/EN?=
 =?us-ascii?Q?l1QvdvPkKvMo18dXMW/+r8becG4X7rQxR3u7Hg/RtLg+/NJlhZiWZjrSHDSR?=
 =?us-ascii?Q?OBpCX6bEzaqxH6AtqS0ptq3LzYEFUNJpP0WHH8+wSuAAU5rPcH9B1CIygcjz?=
 =?us-ascii?Q?mM+EEdWC45EGRiP8F76OvlojWQbJVUwQnRbBtEExeNDztDuv7MmU26LVifpF?=
 =?us-ascii?Q?+G3wNEGU0p241q32tC/LTh/VEkDs5TFKkFUUv3wTJNDThJM7I0O6TmFtG+3u?=
 =?us-ascii?Q?OX6K2jCiaHBu++YZ3Sgo6XtKHeLYeb6GOvuGWxRQ3cJSB1w3yUPQkeTBAQP7?=
 =?us-ascii?Q?UZUEvImevLs5ueuiVGgvPmtylG//JkDGU2tRgcLhS+relmQDI+cQMFfLaQAV?=
 =?us-ascii?Q?B1GrCgEwzTbVD2dnZRK2YwD5z4whfCLPs1PrDdfze9ITfAJwhrJzCcluqoIR?=
 =?us-ascii?Q?zs1+bm2H6N+jH4+2fJj4/59oCY+vAwQuWytP+Wb5Ev0P7LtB7iXriZUBc/ra?=
 =?us-ascii?Q?72qlFTmPKsh13nE+XhX1BbALdgDMdVuAFRHKyZpB2UegBybDnrM0poLcvE61?=
 =?us-ascii?Q?RCK7z4GBBgoChOyHPhhdRQJAZUYV0ULad+pQUMn0iNDsqR5ur6KzNUFlJFUe?=
 =?us-ascii?Q?+1C1KVxmvgivF8X1d/3vgzZj8Hrqo+LHQExfdBRvlLtgU7V6pvLdKFFcActu?=
 =?us-ascii?Q?+PbuzT67/kYD1RVPweeuthyBZc9j/gZ57CEPK+E0vjCnV21rsjBwP9ebY2p7?=
 =?us-ascii?Q?m9Z6vG/liekXpDJDtbGUbzthY1lC76zL7gcUcBMAk99yd+XYMDmRNAQ4sWEN?=
 =?us-ascii?Q?iSdxxRkqkXEoCSmIP+BomR9Ob+8Lp/ryic9fR7pj/ygKJRdHZkd6zgesZYR+?=
 =?us-ascii?Q?I2i1DjFqSnokGzYCqR1WwnNSuqYTd1l/iNB2P3v+EmDMexWOR/U3vbWE8qJu?=
 =?us-ascii?Q?Q1sVFFEHY1e+fxzrRJSHl5VXIGy4Josx/p24vcGtrYNLDaJxOuGpmjQ18JWh?=
 =?us-ascii?Q?nJjm0jA0+VJD0XaiN+8zb8gzFq1mUDxQwPeXwmvVVh3qwVGK7p1FAUjLUshq?=
 =?us-ascii?Q?7KKO5yrGKbETWyYOeBzZjsphiK2rtKOwzsCbMozi6VIOAfc9Jnn77A6BBEMY?=
 =?us-ascii?Q?t5LNYCawbPqvFS49F3sPQMdJ/jcHgKkCX0RUAhhB7BT3gCbQ+hspnyBCovho?=
 =?us-ascii?Q?umyDnXp2X3SLmw7AN1eHXF00JPQL91e/SuZkq1ta4XijztmVtf1aRgUETIaS?=
 =?us-ascii?Q?zhFNZWIh1w=3D=3D?=
X-Exchange-RoutingPolicyChecked: ABpGClYSOxXdzOPpx/ZvIg6yUg0m8W+qpK+pilrzjo11Mv5NJoHDiCYhpfKXD5crMGM3vqzliTIiQSjhF8/gPpPJ7KFnNifeX+P1I16bfPzJ7aa7FerXXoBQho4Ngv6PLZRTHjF/asaYvy3MJ2jMfhT++dmmIckNJtX6dW0BbsMfI914vMTCcFYT4OIwvTZ0Qx6VXgV42r/JyRKnCebU5Vgw4fmt7pgTdQZ1o+hRpL59j9c8GWyAZxSvl1b6VCpG1XESrXprJIde6gw8dWbjggt5twQ/rxHfnil9RG3teDnrA/0DRMZY/cvVG7z13o7pUbFVfkOTV+sbl6VXOOPNeQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a38ccf9-5d2d-4c7b-6075-08deb058c5a4
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 19:00:45.5919 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vmyMlhNJLgbLh3otiiG8/XqVwOyUjVrkwbMYFLqxZlQj1PolJ0m3ey2reT+AlUlE3u7xiwhk0GKjufSkyz83GA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB5997
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

On Mon, May 11, 2026 at 06:01:59PM -0300, Gustavo Sousa wrote:
> Rodrigo Vivi <rodrigo.vivi@intel.com> writes:
> 
> > On Mon, May 11, 2026 at 09:30:49AM -0300, Gustavo Sousa wrote:
> >> Jani Nikula <jani.nikula@linux.intel.com> writes:
> >> 
> >> > On Mon, 11 May 2026, Gustavo Sousa <gustavo.sousa@intel.com> wrote:
> >> >> Jani Nikula <jani.nikula@linux.intel.com> writes:
> >> >>
> >> >>> On Fri, 08 May 2026, Gustavo Sousa <gustavo.sousa@intel.com> wrote:
> >> >>>> +/**
> >> >>>> + * xe_kunit_helper_is_live_test - Return true if @test is a live test.
> >> >>>> + * @test: the &kunit test
> >> >>>> + *
> >> >>>> + * Return: True for a live test and false otherwise.
> >> >>>> + */
> >> >>>
> >> >>> Pardon me for being blunt, but I think this is the worst kind of
> >> >>> kernel-doc comment.
> >> >>
> >> >> I appreciate the bluntness! :-)
> >> >>
> >> >>>
> >> >>> It doesn't provide any additional information to what the function name
> >> >>> and signature already convey (which is to say excellent job on naming
> >> >>> the function), but it fails to explain what "live test" means.
> >> >>
> >> >> I kind of just added this kernel-doc to fill a hole for "consistency",
> >> >> but, yeah, it does not provide any new info.
> >> >>
> >> >>>
> >> >>> The extra bits of useful information people might need after seeing the
> >> >>> function xe_kunit_helper_is_live_test() in code are: What is a live
> >> >>> test, and what is it if it's not live? Dead?
> >> >>
> >> >> Zombie? ;-)
> >> >>
> >> >> Joking apart, I personally tend to use "regular" to refer to non-live
> >> >> tests. I do agree we are missing some documentation on the subject.  I'm
> >> >> not sure though this function should be the place to do it.  I think we
> >> >> would be better off with a "DOC:" section for that (and also explain
> >> >> other bits in there).  I think it would be sensible to rename
> >> >> xe_kunit_helpers.c to simply xe_kunit.c and add such a section.
> >> >>
> >> >> With that in place, this function would be kind of self-explanatory,
> >> >> right? Is this a case we just drop the kernel-doc?
> >> >>
> >> >> Or should we try to be consistent on "every public function should have
> >> >> a kernel-doc"?  Is that even a rule or am I imagining things? :-)
> >> >
> >> > I believe xe maintainership leans more towards requiring kernel-doc
> >> > comments than we do with i915 or display. I think the hard requirement
> >> > leads to a lot of unnecessary boilerplate, more geared towards filling
> >> > the requirement than being informative and helpful.
> >> >
> >> > Personally, I value overview DOC: comments much more than kernel-doc
> >> > comments. If I were to add any hard requirement for documentation, it
> >> > would be for DOC: comments for each .c file.
> >> >
> >> > Bottom line, for xe, ask for xe maintainer opinion.
> >> 
> >> Cc:Xe maintainers, in case they want to chime in.
> >
> > I'm definitely the one to be blamed by requesting docs to every
> > 'public' function in Xe. :)
> >
> > In my view this forces developer to see the .c,.h pair as a 'component'
> > with specific entry points and a reason to exist, rather than some
> > architecture like i915 where .c/.h pairs were only created when some file
> > was 'too big'. With the component in mind it is easier to identify when
> > something is abusing the interface and accessing specific internal
> > types directly rather than having a function entry point to handle it.
> >
> > But well, the 'Doc: ' is actually part fundamental in this component.
> > We should definitely have a 'Doc: ' as well that justifies and give
> > reasoning to the component.
> >
> > That said, in this patch here specifically I agree with Jani. We are
> > missing the 'Doc: with the reasoning for the component, and the
> > 'public' function documentation could be bringing more useful information
> > like Jani pointed out, instead of just stating twice the return value.
> 
> One relevant point here is that, once we have a "DOC:" section that will
> explain "regular" tests and "live" tests, it will be redundant to add
> that detail to the kernel-doc for xe_kunit_helper_is_live_test(), and,
> IMO, it would be better not to repeat it.
> 
> That brings the question: should "every public function needs a
> kernel-doc" be a hard rule?

I do not like repetitions either. But I like the result of the doc when
we have a doc explain the overall flow and underneath the function inputs
of that component. Gives a good overview.

So, why can't you do in a way that the doc explains most of it and overall
flow and still leaving a room for the function to explain itself?!

But perhaps we can still say that it is case by case and live without the
:internals:... 

> 
> --
> Gustavo Sousa
> 
> >
> > Thanks,
> > Rodrigo.
> >
> >> 
> >> --
> >> Gustavo Sousa
> >> 
> >> >
> >> >
> >> > BR,
> >> > Jani.
> >> >
> >> >>
> >> >> --
> >> >> Gustavo Sousa
> >> >>
> >> >>>
> >> >>>
> >> >>> BR,
> >> >>> Jani.
> >> >>>
> >> >>>> +bool xe_kunit_helper_is_live_test(struct kunit *test)
> >> >>>> +{
> >> >>>> +	KUNIT_STATIC_STUB_REDIRECT(xe_kunit_helper_is_live_test, test);
> >> >>>> +	return false;
> >> >>>> +}
> >> >>>
> >> >>> -- 
> >> >>> Jani Nikula, Intel
> >> >
> >> > -- 
> >> > Jani Nikula, Intel
