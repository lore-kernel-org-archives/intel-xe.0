Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B05A4C27C53
	for <intel-xe@archiver.kernel.org>; Wed, 12 Jun 2024 22:30:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 552B510E93A;
	Wed, 12 Jun 2024 22:30:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iSmjYr8f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89E2D10E93A
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Jun 2024 22:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718231443; x=1749767443;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=oAuMbT8vQWT5RQ+o0V7GEFIdQd4rP9ykVfijmZJKoNU=;
 b=iSmjYr8fXki7YVFJ4f1+uQivIuEed7rFP31814qTY9KysLjTca+DTkkI
 yXal3BVIOuulvzwSv5A6/6EOsNUjpsM0IJmGHQLw8UQqEwCiVFWr1lnjk
 NfW+k1f+QhSVnUL8A0mzDjeR6xtk3KK2ci7eCtvOO8M702pWirsxStwFS
 s/p50KHCISdaH1dyJsNjHhZR8emTE5Ihn5niE99d95r8fzGRIIoz7DpDx
 DsyNRcBFzqXDuROIc3yiOOHX0nACFohVtbAKeqW6D/NBV55LIZrcae3jH
 EoeZHA5QHXQGqJg+d0Xt/fSOM1k7tzUfamb/uPpx0hhyROWv/wQTPhx/b w==;
X-CSE-ConnectionGUID: 7lw714s1Qv230EgTA7gT6Q==
X-CSE-MsgGUID: cUOZefkOT0SyNkyfvhV2ew==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="26135823"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="26135823"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 15:30:42 -0700
X-CSE-ConnectionGUID: ZeduA68IR6if9SjNOv/78g==
X-CSE-MsgGUID: oilUWAK9SV2jJkoQ37cTAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="44379887"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Jun 2024 15:30:41 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 12 Jun 2024 15:30:41 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 12 Jun 2024 15:30:40 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 12 Jun 2024 15:30:40 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 12 Jun 2024 15:30:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gqtg33Kp4du0kSoLodNX3YbKU4jRYZYnKqEtkZRGEaaVU+vP5QskcnkJ4UM+80nRgSJ/mh3c54LTSQoPNHy8uK8aKM7c08RnhXRHIduKpFCFX4wOJvHdN3BhQqGS1X8sgnfdzJJljDxe3QHe1IUvXwFRFji80zDi6/53GudPYVsfNRGK4WrMVwFQW2g4i+ttidWcaQu8UjuLMjGCe21ON1W9XS2uYN+rLr87pzGSN1GBa2iXLAWDeQ8ig1tpUMBeTW8+WPZX6Ah8prEZV4M+OiXP4Ga/66BzEU1Z/0Qv4WyDGwo0M+ZP9MU/Yqla9/gxXmbSDZwIaoM/mPJFCy0Ucw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yXSc4LXj7M9Y5HghyAQ1zvgWOrkLpWFMAyQBHhQTpi0=;
 b=KBx/ffZsOORiq+QM32SY2tGW9N42OqD5NqW+Xx8t8JQwqHaLunlX7Dz00988bnohRrx+0S8L77zO16zPfIBJRFTHyyGbuRMj0YZk1CmeNqSsmYS9hBk62g7p7HHMYrqS87V5j+eWVILpPQ8708p/NoxCIBqr7dC7FtvNEzBjX+4sThSe+lgJAwhSfuKY/1RxvqwR4M9qh4+ga7cbg3UiRkCTWKoa8ZOIvi8pu5ASujRzAxZS830yCsFr1Kowq3kKRD73H2EznqKW3VAzq1kCp39aui217vAMn5u9ahvuWNWo4SAYJemzoqiHwsak95rL7bfHRpCw+DuSG0nDqOSQww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by DS7PR11MB5966.namprd11.prod.outlook.com (2603:10b6:8:71::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.24; Wed, 12 Jun 2024 22:30:38 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.7633.036; Wed, 12 Jun 2024
 22:30:37 +0000
Date: Wed, 12 Jun 2024 22:30:01 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: John Harrison <john.c.harrison@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v6 11/11] drm/xe: Sample ctx timestamp to determine if
 jobs have timed out
Message-ID: <ZmohaZ02aV7tnKbL@DUT025-TGLU.fm.intel.com>
References: <20240611144053.2805091-1-matthew.brost@intel.com>
 <20240611144053.2805091-12-matthew.brost@intel.com>
 <96d30c2b-76b6-4086-aaad-77190c4af586@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <96d30c2b-76b6-4086-aaad-77190c4af586@intel.com>
X-ClientProxiedBy: SJ0PR03CA0173.namprd03.prod.outlook.com
 (2603:10b6:a03:338::28) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|DS7PR11MB5966:EE_
X-MS-Office365-Filtering-Correlation-Id: c71861e4-afdc-4635-7abe-08dc8b2f4879
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230034|366010|376008|1800799018;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kYp1r1KMZ8CyCc4+xITq0N5bXD7z7hIKIMR+OQZcjdNKVshVlopjK650GYzp?=
 =?us-ascii?Q?FMJn2lpMQevTvH1wwHMQvcZrshvFLOSrNq3svAhr4v3FMcZO7m7Y/PkWhB+b?=
 =?us-ascii?Q?BiCQzgHCrs5qH5TULkd5uHDmVIplaxfRL+VmbQlV3u7+M/tgzX+6cMxD7h3U?=
 =?us-ascii?Q?l2xudSTPG/QzxAMKrvow23kryYriAolcO11VpbUGD9VmLH5dxFE+Bh31pwbl?=
 =?us-ascii?Q?BHXiO59Jr2iEecP62tz2LvayGRqZNbQZSOGWajTcKu92MtuZpHrV0XyKFdfB?=
 =?us-ascii?Q?oddC3OJQw8kaTHkV7H4Zg5e3zAVcG1t5nXOTXvffQV+AUSmW8UfPfRCClk/X?=
 =?us-ascii?Q?mJtrtMFBkndJvm3230Gbj3TbiEDXFHGcJX4CPQi0+9EQkjDP3CsOh5cX77nf?=
 =?us-ascii?Q?z3xMwGycE/mxbHJKjrc28PRHcCXMHEU4EQ34QMfoXStEsRo6Khhebejku+dl?=
 =?us-ascii?Q?1YK+qJBelGi+VwJd+DNhNyK7wexRQHmg5h/sgJmeia0YsGunuv+zKZ21DcEe?=
 =?us-ascii?Q?Q01ox2gYj+zuecIy8AJSo17kTDyflzEP8f5j3x2QtdEw1jrWzkAGAL6v5j11?=
 =?us-ascii?Q?BaIj9BBjgbFqCc/t9YSbRrYmXZKUoIf9/Umte9GzlkvPmxlKvpKDmOfyC0J6?=
 =?us-ascii?Q?876nYGa0V3LD6Ca2/KpfBCXD2UFdmjzu9wxCcvaswqNblQEnOUL2NqjW7ERZ?=
 =?us-ascii?Q?n/P4Y2hkX84fOKaRAFSNAlwPB5teR5+Uqq5sf/yNBDPQfPefIaD/CCfzs5wm?=
 =?us-ascii?Q?YXRX+eSyJwYnEW24vT3YbIRpfbbqjUrdzovlBaJIVdfRv31EuSmguYS4tg/i?=
 =?us-ascii?Q?cU+Ho2E+yD6BnZHZdqyRiGvCXIPWhXJ/o1nqKKa/iwAKH4lR3EkOK52mARTo?=
 =?us-ascii?Q?p+S5KZi1XlNw9vrNpe4deYaJMw0jL5DRh1z/pJuQrQLVTjoruov9M2s4we/e?=
 =?us-ascii?Q?fLQILcEPmQoRm+bFN0xnF/6QyF/yukIuyYBJPnuezxWaxOASR433YsgD8V3y?=
 =?us-ascii?Q?hBFnQk5CVkhT19WC50MHd+5Z+4vp02b1K82E15TvGDGW8U32fgIyYZ2hL77k?=
 =?us-ascii?Q?+Q+EqQ5eaWCAsJh7WELyxWGp4Te0/bQkwY/ZTfI27wPDuUkDx1fz6NQeQZ+I?=
 =?us-ascii?Q?YSUpuX0hOK057jIuMrevfbek/r0aCY8Oyy/ysOMYN324Y30X/RW1JzYsNEav?=
 =?us-ascii?Q?P0UdI7I4z3GdcF191nCdSaH16OTGKfqQ1RK2+9zOrq9cKrC4Y5k2tdVWF9vc?=
 =?us-ascii?Q?oRchbegYA5cIqafMQiboFGnZBwKomB62BXnB2fwulr+Xzu6QLqOtusXGEZmG?=
 =?us-ascii?Q?vodsjDPDGmSnAlPQTeybupEq?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230034)(366010)(376008)(1800799018); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Jl4Rx6mtEK8nvdUA3ak0gTZOefLkMIDVhB1eVS3DDBu1LD6Z3UAqDDX6J51q?=
 =?us-ascii?Q?Y0lHBJQhdqEUkPXMTahaPi5masPZVaB7/7K0zWTLGVTjVmfbTJd+p+PcEzdw?=
 =?us-ascii?Q?3OAjVQqFI+8RhZiFpupe81qZ88cvGsrBDbXY8nN4RZrojpsT4asQsf1BVC8B?=
 =?us-ascii?Q?wG18PmUmkrxMiI+wxYw7bKktiye2ngux+KGDwCS8zA1r4MFJ1eRbcu/ab3Uw?=
 =?us-ascii?Q?hiqHx8kCiyed0n5soz8VguIrqmmAv2cz1nVB4A+dU3M4xIHbaXj0jWiVZauj?=
 =?us-ascii?Q?tvZwJhXaAk8kS/7Atcf7LKKQmPJWwn7IQEJmlyaps/yZ6A+5D9Lu2fMVfZCg?=
 =?us-ascii?Q?pJyFZ8OyGAqD6YQAPJaWb4ENuOTa+AKaUGswqSm70Zm2s7/8hJphESuN1e8z?=
 =?us-ascii?Q?1Pp2KxqaPDndM8BqMSbKyVbY5i2gLwk2RCTDrYTjZPcnjU17DXph3TyjmMvm?=
 =?us-ascii?Q?eFkgiTq8GM7JMAtvOGVYTttzi9GLWJ9weY0JfwBVSq3XyQaqXcF2zvlQRDki?=
 =?us-ascii?Q?piPurByepa2k7UNjD7wtV2lvRo9RCWGvypfLPhuQsJVJAgLYnk5zJupDPcrA?=
 =?us-ascii?Q?XPCoYBtuemyDylWhdbEXFIGxn8FfZus1fTUlQU1021DZG+lLbjNjB3n93oJ7?=
 =?us-ascii?Q?0y/g4Mw0R9aN+h+bZfydD6qsbKzEYtG0IQy345/4i6Jdl18IuyWMh6P3XuDA?=
 =?us-ascii?Q?EUoj3bliZygUCg7ZZ8Mwwx5LsGQoRjAigiCzLOlOK6a+ih5aJyzWligW3G15?=
 =?us-ascii?Q?vee254LnWXcgU4Pd6gdIdBSFihldzfncFUBt2i+520LpS1BjT6CQ0YUChpjM?=
 =?us-ascii?Q?3/8TzoPPQwslLIyUNgdAhsjxA5wxtdSU4IuidEbJ+fWuQX6dIAaBu1k/kqqf?=
 =?us-ascii?Q?ywAYxUN+gCxV18a7iGhLwrOf6rfTjDE29xoOM2DdV3R5oDrI41ym5uwkORcO?=
 =?us-ascii?Q?YKdq75oZ1fPi+ngCnoR+rx1zmHlhsb6wFvPV4X5zeIRxAcsD9obIB6dCu5dF?=
 =?us-ascii?Q?jjWIQy06/r4GLJBfRlCfUgEcvsPScX7avT9ILh5Waxjl4+v9fT0P2pQGwzBO?=
 =?us-ascii?Q?TLMXLBr9xJ0wAAQaiZhUAADK4XE50OIz7wNkLeiMGM9LMgX2Jl3NGHga+buZ?=
 =?us-ascii?Q?xEmb4tTEMMprVmMpgQ+W7Ynf7bym+tndYY5TzhGGGBsrv2OVWiTQPpy+Szpy?=
 =?us-ascii?Q?ZNORLG7/ABkjxeyEdH52lyGuJs4ZcnACCMl8ERr8HeFGSk71NkipFaDRtzpM?=
 =?us-ascii?Q?KwI1vSvkcdptFVttkstOtv3Jff/1vLhcK5Sm3/PfSDK5tqP7U5Inn9kqSwZ/?=
 =?us-ascii?Q?KqHRpb14C68TXUhPq3QO0GNNlt1G+vTh8G1BnfFtFdjXJaqKguzOW3esUFSI?=
 =?us-ascii?Q?dEh4v7RxGk56oYz3sIzcTs5cqD2Wg4cH+TDCCcmaWLLOER/JR4HeJH+Y+P7s?=
 =?us-ascii?Q?rPvvzho2cZfkFPaktFI0p5Y9B/nue4pbkjft3YRrqdBcJXcX6RvK0fXRJ6DL?=
 =?us-ascii?Q?C0xFIvKQWZC56oPKubz/CjXi7StSp1f6fyY7IgeNqiJb9HDbopQV1wqCJ5YE?=
 =?us-ascii?Q?tpp4suradOKCiv+UtvAwCl+wuDLuzYRRvac3f1UsS07It54QrCumNDLAx0Sm?=
 =?us-ascii?Q?Uw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c71861e4-afdc-4635-7abe-08dc8b2f4879
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2024 22:30:37.6302 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wiTDDLtHmWcuxzbJRVNuqdfNthB6gD1YGDoOu94Lanv+qfK/AD32t2jc8G+/60t6/yTfAj/2P/uhhwqBVsx51g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB5966
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

On Wed, Jun 12, 2024 at 02:56:42PM -0700, John Harrison wrote:
> On 6/11/2024 07:40, Matthew Brost wrote:
> > In GuC TDR sample ctx timestamp to determine if jobs have timed out. The
> > scheduling enable needs to be toggled to properly sample the timestamp.
> > If a job has not been running for longer than the timeout period,
> > re-enable scheduling and restart the TDR.
> > 
> > v2:
> >   - Use GT clock to msec helper (Umesh, off list)
> >   - s/ctx_timestamp_job/ctx_job_timestamp
> > v3:
> >   - Fix state machine for TDR, mainly decouple sched disable and
> >     deregister (testing)
> >   - Rebase (CI)
> > v4:
> >   - Fix checkpatch && newline issue (CI)
> >   - Do not deregister on wedged or unregistered (CI)
> >   - Fix refcounting bugs (CI)
> >   - Move devcoredump above VM / kernel job check (John H)
> >   - Add comment for check_timeout state usage (John H)
> >   - Assert pending disable not inflight when enabling scheduling (John H)
> >   - Use enable_scheduling in other scheduling enable code (John H)
> >   - Add comments on a few steps in TDR (John H)
> >   - Add assert for timestamp overflow protection (John H)
> > v6:
> >   - Use mul_u64_u32_div (CI, checkpath)
> >   - Change check time to dbg level (Paulo)
> >   - Add immediate mode to sched disable (inspection)
> >   - Use xe_gt_* messages (John H)
> >   - Fix typo in comment (John H)
> >   - Check timeout before clearing pending disable (Paulo)
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_guc_submit.c | 303 +++++++++++++++++++++++------
> >   1 file changed, 242 insertions(+), 61 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index 671c72caf0ff..cddb391888b6 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -10,6 +10,7 @@
> >   #include <linux/circ_buf.h>
> >   #include <linux/delay.h>
> >   #include <linux/dma-fence-array.h>
> > +#include <linux/math64.h>
> >   #include <drm/drm_managed.h>
> > @@ -23,6 +24,7 @@
> >   #include "xe_force_wake.h"
> >   #include "xe_gpu_scheduler.h"
> >   #include "xe_gt.h"
> > +#include "xe_gt_clock.h"
> >   #include "xe_gt_printk.h"
> >   #include "xe_guc.h"
> >   #include "xe_guc_ct.h"
> > @@ -62,6 +64,8 @@ exec_queue_to_guc(struct xe_exec_queue *q)
> >   #define EXEC_QUEUE_STATE_KILLED			(1 << 7)
> >   #define EXEC_QUEUE_STATE_WEDGED			(1 << 8)
> >   #define EXEC_QUEUE_STATE_BANNED			(1 << 9)
> > +#define EXEC_QUEUE_STATE_CHECK_TIMEOUT		(1 << 10)
> > +#define EXEC_QUEUE_STATE_EXTRA_REF		(1 << 11)
> >   static bool exec_queue_registered(struct xe_exec_queue *q)
> >   {
> > @@ -188,6 +192,31 @@ static void set_exec_queue_wedged(struct xe_exec_queue *q)
> >   	atomic_or(EXEC_QUEUE_STATE_WEDGED, &q->guc->state);
> >   }
> > +static bool exec_queue_check_timeout(struct xe_exec_queue *q)
> > +{
> > +	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_CHECK_TIMEOUT;
> > +}
> > +
> > +static void set_exec_queue_check_timeout(struct xe_exec_queue *q)
> > +{
> > +	atomic_or(EXEC_QUEUE_STATE_CHECK_TIMEOUT, &q->guc->state);
> > +}
> > +
> > +static void clear_exec_queue_check_timeout(struct xe_exec_queue *q)
> > +{
> > +	atomic_and(~EXEC_QUEUE_STATE_CHECK_TIMEOUT, &q->guc->state);
> > +}
> > +
> > +static bool exec_queue_extra_ref(struct xe_exec_queue *q)
> > +{
> > +	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_EXTRA_REF;
> > +}
> > +
> > +static void set_exec_queue_extra_ref(struct xe_exec_queue *q)
> > +{
> > +	atomic_or(EXEC_QUEUE_STATE_EXTRA_REF, &q->guc->state);
> > +}
> > +
> >   static bool exec_queue_killed_or_banned_or_wedged(struct xe_exec_queue *q)
> >   {
> >   	return (atomic_read(&q->guc->state) &
> > @@ -920,6 +949,109 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
> >   	xe_sched_submission_start(sched);
> >   }
> > +#define ADJUST_FIVE_PERCENT(__t)	mul_u64_u32_div((__t), 105, 100)
> > +
> > +static bool check_timeout(struct xe_exec_queue *q, struct xe_sched_job *job)
> > +{
> > +	struct xe_gt *gt = guc_to_gt(exec_queue_to_guc(q));
> > +	u32 ctx_timestamp = xe_lrc_ctx_timestamp(q->lrc[0]);
> > +	u32 ctx_job_timestamp = xe_lrc_ctx_job_timestamp(q->lrc[0]);
> > +	u32 timeout_ms = q->sched_props.job_timeout_ms;
> > +	u32 diff;
> > +	u64 running_time_ms;
> > +
> > +	/*
> > +	 * Counter wraps at ~223s at the usual 19.2MHz, be paranoid catch
> > +	 * possible overflows with a high timeout.
> > +	 */
> > +	xe_gt_assert(gt, timeout_ms < 100 * MSEC_PER_SEC);
> > +
> > +	if (ctx_timestamp < ctx_job_timestamp)
> > +		diff = ctx_timestamp + U32_MAX - ctx_job_timestamp;
> > +	else
> > +		diff = ctx_timestamp - ctx_job_timestamp;
> > +
> > +	/*
> > +	 * Ensure timeout is within 5% to account for an GuC scheduling latency
> > +	 */
> > +	running_time_ms =
> > +		ADJUST_FIVE_PERCENT(xe_gt_clock_interval_to_ms(gt, diff));
> > +
> > +	xe_gt_dbg(gt,
> > +		  "Check job timeout: seqno=%u, lrc_seqno=%u, guc_id=%d, running_time_ms=%llu, timeout_ms=%u, diff=0x%08x",
> > +		  xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
> > +		  q->guc->id, running_time_ms, timeout_ms, diff);
> > +
> > +	return running_time_ms >= timeout_ms;
> > +}
> > +
> > +static void enable_scheduling(struct xe_exec_queue *q)
> > +{
> > +	MAKE_SCHED_CONTEXT_ACTION(q, ENABLE);
> > +	struct xe_guc *guc = exec_queue_to_guc(q);
> > +	int ret;
> > +
> > +	xe_gt_assert(guc_to_gt(guc), !exec_queue_destroyed(q));
> > +	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q));
> > +	xe_gt_assert(guc_to_gt(guc), !exec_queue_pending_disable(q));
> > +	xe_gt_assert(guc_to_gt(guc), !exec_queue_pending_enable(q));
> > +
> > +	set_exec_queue_pending_enable(q);
> > +	set_exec_queue_enabled(q);
> > +	trace_xe_exec_queue_scheduling_enable(q);
> > +
> > +	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
> > +		       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, 1);
> > +
> > +	ret = wait_event_timeout(guc->ct.wq,
> > +				 !exec_queue_pending_enable(q) ||
> > +				 guc_read_stopped(guc), HZ * 5);
> > +	if (!ret || guc_read_stopped(guc)) {
> > +		xe_gt_warn(guc_to_gt(guc), "Schedule enable failed to respond");
> > +		set_exec_queue_banned(q);
> > +		xe_gt_reset_async(q->gt);
> > +		xe_sched_tdr_queue_imm(&q->guc->sched);
> > +	}
> > +}
> > +
> > +static void disable_scheduling(struct xe_exec_queue *q, bool immediate)
> > +{
> > +	MAKE_SCHED_CONTEXT_ACTION(q, DISABLE);
> > +	struct xe_guc *guc = exec_queue_to_guc(q);
> > +
> > +	xe_gt_assert(guc_to_gt(guc), !exec_queue_destroyed(q));
> > +	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q));
> > +	xe_gt_assert(guc_to_gt(guc), !exec_queue_pending_disable(q));
> > +
> > +	if (immediate)
> > +		set_min_preemption_timeout(guc, q);
> > +	clear_exec_queue_enabled(q);
> > +	set_exec_queue_pending_disable(q);
> > +	trace_xe_exec_queue_scheduling_disable(q);
> > +
> > +	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
> > +		       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, 1);
> > +}
> > +
> > +static void __deregister_exec_queue(struct xe_guc *guc, struct xe_exec_queue *q)
> > +{
> > +	u32 action[] = {
> > +		XE_GUC_ACTION_DEREGISTER_CONTEXT,
> > +		q->guc->id,
> > +	};
> > +
> > +	xe_gt_assert(guc_to_gt(guc), !exec_queue_destroyed(q));
> > +	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q));
> > +	xe_gt_assert(guc_to_gt(guc), !exec_queue_pending_enable(q));
> > +	xe_gt_assert(guc_to_gt(guc), !exec_queue_pending_disable(q));
> > +
> > +	set_exec_queue_destroyed(q);
> > +	trace_xe_exec_queue_deregister(q);
> > +
> > +	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
> > +		       G2H_LEN_DW_DEREGISTER_CONTEXT, 1);
> > +}
> > +
> >   static enum drm_gpu_sched_stat
> >   guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> >   {
> > @@ -927,10 +1059,10 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> >   	struct xe_sched_job *tmp_job;
> >   	struct xe_exec_queue *q = job->q;
> >   	struct xe_gpu_scheduler *sched = &q->guc->sched;
> > -	struct xe_device *xe = guc_to_xe(exec_queue_to_guc(q));
> > +	struct xe_guc *guc = exec_queue_to_guc(q);
> >   	int err = -ETIME;
> >   	int i = 0;
> > -	bool wedged;
> > +	bool wedged, skip_timeout_check;
> >   	/*
> >   	 * TDR has fired before free job worker. Common if exec queue
> > @@ -942,49 +1074,53 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> >   		return DRM_GPU_SCHED_STAT_NOMINAL;
> >   	}
> > -	drm_notice(&xe->drm, "Timedout job: seqno=%u, lrc_seqno=%u, guc_id=%d, flags=0x%lx",
> > -		   xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
> > -		   q->guc->id, q->flags);
> > -	xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_KERNEL,
> > -		   "Kernel-submitted job timed out\n");
> > -	xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q),
> > -		   "VM job timed out on non-killed execqueue\n");
> > -
> > -	if (!exec_queue_killed(q))
> > -		xe_devcoredump(job);
> > -
> > -	trace_xe_sched_job_timedout(job);
> > -
> > -	wedged = guc_submit_hint_wedged(exec_queue_to_guc(q));
> > -
> >   	/* Kill the run_job entry point */
> >   	xe_sched_submission_stop(sched);
> > +	/* Must check all state after stopping scheduler */
> > +	skip_timeout_check = exec_queue_reset(q) ||
> > +		exec_queue_killed_or_banned_or_wedged(q) ||
> > +		exec_queue_destroyed(q);
> > +
> > +	/* Job hasn't started, can't be timed out */
> > +	if (!skip_timeout_check && !xe_sched_job_started(job))
> > +		goto rearm;
> > +
> >   	/*
> > -	 * Kernel jobs should never fail, nor should VM jobs if they do
> > -	 * somethings has gone wrong and the GT needs a reset
> > +	 * XXX: Sampling timeout doesn't work in wedged mode as we have to
> > +	 * modify scheduling state to read timestamp. We could read the
> > +	 * timestamp from a register to accumulate current running time but this
> > +	 * doesn't work for SRIOV. For now assuming timeouts in wedged mode are
> > +	 * genuine timeouts.
> >   	 */
> > -	if (!wedged && (q->flags & EXEC_QUEUE_FLAG_KERNEL ||
> > -			(q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q)))) {
> > -		if (!xe_sched_invalidate_job(job, 2)) {
> > -			xe_sched_add_pending_job(sched, job);
> > -			xe_sched_submission_start(sched);
> > -			xe_gt_reset_async(q->gt);
> > -			goto out;
> > -		}
> > -	}
> > +	wedged = guc_submit_hint_wedged(exec_queue_to_guc(q));
> > -	/* Engine state now stable, disable scheduling if needed */
> > +	/* Engine state now stable, disable scheduling to check timestamp */
> >   	if (!wedged && exec_queue_registered(q)) {
> > -		struct xe_guc *guc = exec_queue_to_guc(q);
> >   		int ret;
> >   		if (exec_queue_reset(q))
> >   			err = -EIO;
> > -		set_exec_queue_banned(q);
> > +
> >   		if (!exec_queue_destroyed(q)) {
> > -			xe_exec_queue_get(q);
> > -			disable_scheduling_deregister(guc, q);
> > +			/*
> > +			 * Wait for any pending G2H to flush out before
> > +			 * modifying state
> > +			 */
> > +			ret = wait_event_timeout(guc->ct.wq,
> > +						 !exec_queue_pending_enable(q) ||
> > +						 guc_read_stopped(guc), HZ * 5);
> > +			if (!ret || guc_read_stopped(guc))
> > +				goto trigger_reset;
> > +
> > +			/*
> > +			 * Flag communicates to G2H handler that schedule
> > +			 * disable originated from a timeout check. The G2H then
> > +			 * avoid triggering cleanup or deregistering the exec
> > +			 * queue.
> > +			 */
> > +			set_exec_queue_check_timeout(q);
> > +			disable_scheduling(q, skip_timeout_check);
> >   		}
> >   		/*
> > @@ -1000,15 +1136,60 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> >   					 !exec_queue_pending_disable(q) ||
> >   					 guc_read_stopped(guc), HZ * 5);
> >   		if (!ret || guc_read_stopped(guc)) {
> > -			drm_warn(&xe->drm, "Schedule disable failed to respond");
> > -			xe_sched_add_pending_job(sched, job);
> > -			xe_sched_submission_start(sched);
> > +trigger_reset:
> > +			xe_gt_warn(guc_to_gt(guc), "Schedule disable failed to respond");
> Not a problem introduced in this patch set so maybe not necessary to fix
> here either. But we have seen what look like false hits on this warning in
> some of the reset tests. The code gets here if the schedule disable
> genuinely times out which is what the warning is saying. But it also gets
> here if guc_read_stopped() is true and that happens if a reset occurs
> asynchronously to this timeout check. In that situation, there is no need to
> fire a warning - the abort is intentional and expected. It is also not
> necessary to queue up another reset just below. It seems like the warning
> and the reset should be inside a further 'if(!ret)' check.
> 

Agree. It should be:

if (!ret)
	xe_gt_warn(guc_to_gt(guc), "Schedule disable failed to respond");


Will fix in next rev or before merging.

> > +			set_exec_queue_extra_ref(q);
> > +			xe_exec_queue_get(q);	/* GT reset owns this */
> > +			set_exec_queue_banned(q);
> >   			xe_gt_reset_async(q->gt);
> >   			xe_sched_tdr_queue_imm(sched);
> > -			goto out;
> > +			goto rearm;
> > +		}
> > +	}
> > +
> > +	/*
> > +	 * Check if job is actually timed out, if so restart job execution and TDR
> > +	 */
> > +	if (!wedged && !skip_timeout_check && !check_timeout(q, job) &&
> > +	    !exec_queue_reset(q) && exec_queue_registered(q)) {
> > +		clear_exec_queue_check_timeout(q);
> > +		goto sched_enable;
> > +	}
> > +
> > +	xe_gt_notice(guc_to_gt(guc), "Timedout job: seqno=%u, lrc_seqno=%u, guc_id=%d, flags=0x%lx",
> > +		     xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
> > +		     q->guc->id, q->flags);
> > +	xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_KERNEL,
> > +		   "Kernel-submitted job timed out\n");
> > +	xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q),
> > +		   "VM job timed out on non-killed execqueue\n");
> I still think it makes more sense to have these two warnings next to the
> comment that says why these are unexpected errors...
> 
> > +
> > +	trace_xe_sched_job_timedout(job);
> > +
> > +	if (!exec_queue_killed(q))
> > +		xe_devcoredump(job);
> > +
> > +	/*
> > +	 * Kernel jobs should never fail, nor should VM jobs if they do
> > +	 * somethings has gone wrong and the GT needs a reset
> > +	 */
> ... i.e. the warning about kernel jobs and VM jobs not failing should be
> here.
>

Sure, can move these warn below this comment. Do you mind if I just fix
this at merge time?

Matt

> John.
> 
> > +	if (!wedged && (q->flags & EXEC_QUEUE_FLAG_KERNEL ||
> > +			(q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q)))) {
> > +		if (!xe_sched_invalidate_job(job, 2)) {
> > +			clear_exec_queue_check_timeout(q);
> > +			xe_gt_reset_async(q->gt);
> > +			goto rearm;
> >   		}
> >   	}
> > +	/* Finish cleaning up exec queue via deregister */
> > +	set_exec_queue_banned(q);
> > +	if (!wedged && exec_queue_registered(q) && !exec_queue_destroyed(q)) {
> > +		set_exec_queue_extra_ref(q);
> > +		xe_exec_queue_get(q);
> > +		__deregister_exec_queue(guc, q);
> > +	}
> > +
> >   	/* Stop fence signaling */
> >   	xe_hw_fence_irq_stop(q->fence_irq);
> > @@ -1030,7 +1211,19 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> >   	/* Start fence signaling */
> >   	xe_hw_fence_irq_start(q->fence_irq);
> > -out:
> > +	return DRM_GPU_SCHED_STAT_NOMINAL;
> > +
> > +sched_enable:
> > +	enable_scheduling(q);
> > +rearm:
> > +	/*
> > +	 * XXX: Ideally want to adjust timeout based on current exection time
> > +	 * but there is not currently an easy way to do in DRM scheduler. With
> > +	 * some thought, do this in a follow up.
> > +	 */
> > +	xe_sched_add_pending_job(sched, job);
> > +	xe_sched_submission_start(sched);
> > +
> >   	return DRM_GPU_SCHED_STAT_NOMINAL;
> >   }
> > @@ -1133,7 +1326,6 @@ static void __guc_exec_queue_process_msg_suspend(struct xe_sched_msg *msg)
> >   			   guc_read_stopped(guc));
> >   		if (!guc_read_stopped(guc)) {
> > -			MAKE_SCHED_CONTEXT_ACTION(q, DISABLE);
> >   			s64 since_resume_ms =
> >   				ktime_ms_delta(ktime_get(),
> >   					       q->guc->resume_time);
> > @@ -1144,12 +1336,7 @@ static void __guc_exec_queue_process_msg_suspend(struct xe_sched_msg *msg)
> >   				msleep(wait_ms);
> >   			set_exec_queue_suspended(q);
> > -			clear_exec_queue_enabled(q);
> > -			set_exec_queue_pending_disable(q);
> > -			trace_xe_exec_queue_scheduling_disable(q);
> > -
> > -			xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
> > -				       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, 1);
> > +			disable_scheduling(q, false);
> >   		}
> >   	} else if (q->guc->suspend_pending) {
> >   		set_exec_queue_suspended(q);
> > @@ -1160,19 +1347,11 @@ static void __guc_exec_queue_process_msg_suspend(struct xe_sched_msg *msg)
> >   static void __guc_exec_queue_process_msg_resume(struct xe_sched_msg *msg)
> >   {
> >   	struct xe_exec_queue *q = msg->private_data;
> > -	struct xe_guc *guc = exec_queue_to_guc(q);
> >   	if (guc_exec_queue_allowed_to_change_state(q)) {
> > -		MAKE_SCHED_CONTEXT_ACTION(q, ENABLE);
> > -
> >   		q->guc->resume_time = RESUME_PENDING;
> >   		clear_exec_queue_suspended(q);
> > -		set_exec_queue_pending_enable(q);
> > -		set_exec_queue_enabled(q);
> > -		trace_xe_exec_queue_scheduling_enable(q);
> > -
> > -		xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
> > -			       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, 1);
> > +		enable_scheduling(q);
> >   	} else {
> >   		clear_exec_queue_suspended(q);
> >   	}
> > @@ -1434,8 +1613,7 @@ static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
> >   	/* Clean up lost G2H + reset engine state */
> >   	if (exec_queue_registered(q)) {
> > -		if ((exec_queue_banned(q) && exec_queue_destroyed(q)) ||
> > -		    xe_exec_queue_is_lr(q))
> > +		if (exec_queue_extra_ref(q) || xe_exec_queue_is_lr(q))
> >   			xe_exec_queue_put(q);
> >   		else if (exec_queue_destroyed(q))
> >   			__guc_exec_queue_fini(guc, q);
> > @@ -1612,6 +1790,8 @@ static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q,
> >   		smp_wmb();
> >   		wake_up_all(&guc->ct.wq);
> >   	} else {
> > +		bool check_timeout = exec_queue_check_timeout(q);
> > +
> >   		xe_gt_assert(guc_to_gt(guc), runnable_state == 0);
> >   		xe_gt_assert(guc_to_gt(guc), exec_queue_pending_disable(q));
> > @@ -1619,11 +1799,12 @@ static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q,
> >   		if (q->guc->suspend_pending) {
> >   			suspend_fence_signal(q);
> >   		} else {
> > -			if (exec_queue_banned(q)) {
> > +			if (exec_queue_banned(q) || check_timeout) {
> >   				smp_wmb();
> >   				wake_up_all(&guc->ct.wq);
> >   			}
> > -			deregister_exec_queue(guc, q);
> > +			if (!check_timeout)
> > +				deregister_exec_queue(guc, q);
> >   		}
> >   	}
> >   }
> > @@ -1664,7 +1845,7 @@ static void handle_deregister_done(struct xe_guc *guc, struct xe_exec_queue *q)
> >   	clear_exec_queue_registered(q);
> > -	if (exec_queue_banned(q) || xe_exec_queue_is_lr(q))
> > +	if (exec_queue_extra_ref(q) || xe_exec_queue_is_lr(q))
> >   		xe_exec_queue_put(q);
> >   	else
> >   		__guc_exec_queue_fini(guc, q);
> > @@ -1728,7 +1909,7 @@ int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
> >   	 * guc_exec_queue_timedout_job.
> >   	 */
> >   	set_exec_queue_reset(q);
> > -	if (!exec_queue_banned(q))
> > +	if (!exec_queue_banned(q) && !exec_queue_check_timeout(q))
> >   		xe_guc_exec_queue_trigger_cleanup(q);
> >   	return 0;
> > @@ -1758,7 +1939,7 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
> >   	/* Treat the same as engine reset */
> >   	set_exec_queue_reset(q);
> > -	if (!exec_queue_banned(q))
> > +	if (!exec_queue_banned(q) && !exec_queue_check_timeout(q))
> >   		xe_guc_exec_queue_trigger_cleanup(q);
> >   	return 0;
> 
