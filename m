Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E0EDC6FD1F
	for <intel-xe@archiver.kernel.org>; Wed, 22 Mar 2023 20:57:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31AD110E3F2;
	Wed, 22 Mar 2023 20:57:30 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 292A310E3F2
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Mar 2023 20:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679518647; x=1711054647;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=crlqFRllkOenTfWQPjyaM7FTA5yGLnb2sgg1cCi+WPk=;
 b=GAmx3BVB7N+OhNqk1q4tUiwutviEO3BDRhjX0HEaqVOe2r8f4oTFeps8
 s5Pu+IiweKIqVP7wo+leY6fLhUTvQcTmiTvyp0XOItA3/1WxaX2QCZcAf
 z27WfoeA/wPT/cFyy3tNNUypgcDsAbN2bvV6BUxrPCkUpQ4x3IEr9rPQL
 Mh+hZfCtaMRjzs9nkVr4vf4rx9xRxPCe7nrJiajJJH0vQSyIDMWz3xQ8M
 ELGR82kJXmHx4Ns5E9ggTpmHs8QK+lWT55UCB+RXnlYZKGdGwqKM3s8Dw
 +6UiQi7qMWK7xzmrmPluDxDjXnDXAkZlQR8K8k5ZD0RWX2xUTOVACX73f A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="318981914"
X-IronPort-AV: E=Sophos;i="5.98,282,1673942400"; d="scan'208";a="318981914"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 13:57:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="751217291"
X-IronPort-AV: E=Sophos;i="5.98,282,1673942400"; d="scan'208";a="751217291"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga004.fm.intel.com with ESMTP; 22 Mar 2023 13:57:26 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 22 Mar 2023 13:57:26 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 22 Mar 2023 13:57:26 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 22 Mar 2023 13:57:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ol9GxJivvIk6uXVhQf1FzczpTf58zY7fZIFnbSXcevCRw7hOc/5djKkztPYTh2hdYXHDeGVVpHoBtIKzXwdrvnTJsGbyVG2Q0wxTLXzwusrei6RomlgA+3JHN9KsSooM4LTiKbpdgwjhu6wJS2jEtG7TxxsNWRVNSJo2uxjjTJxamoxNG4Q9Wpb2u6crA2l0bUrKCFzjWIXCBHW8tvDljgsm+z1aDv9YIC9dql1nxd+pPj+0I1QQrwSXb7rMb5x+PzTz9sO12k3B5NkfeH4RtJjC5DGYgl/FaJj5CM9Ag3czWkGelrJNHlb+IoOabr3sgk/Cga2OgY2X4sBhzL6lZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MazETDNYuzu95lkWajWZe9sw8OEEbNVThUNwEZKXq30=;
 b=aaHKq2rQ5oyboXc2Kp9Ke1617OKd7LWn4IgJoVTwTyQhbg7IqpYAbcwJxlWVChcIIQrKwfOYVPN+dRixPbYwDh/4rEdEGBnRk5HHLsuhJa3ggtD987OvmHiML1OAoX6YbH9kEY5hDNfO6pIX+3ly833mCv5FGdKb86sCXfbBTLDbxJJRGdXyZZFlY4USOn7cAgddmNxlV7i4sKPFVaqLuxuIYWpJg4wfBCwlf9D/goSSAi3BRVB1TsrB7cHR5ml4ZTNApj9TFd0c9q5/dzmxHB0n95drk5bgs/bJ8EDh+hC3q8j/m0AuDNrnIIseLFMbMQuDewLOfgDKVbLIGz6x1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DS0PR11MB7309.namprd11.prod.outlook.com (2603:10b6:8:13e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 20:57:22 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158%9]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 20:57:22 +0000
Date: Wed, 22 Mar 2023 16:57:17 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Message-ID: <ZBtrrTeswE5eg0DQ@intel.com>
References: <20230321160420.1352889-1-jani.nikula@intel.com>
 <87v8iu6qc1.fsf@intel.com> <87sfdy6q9k.fsf@intel.com>
 <20230321230448.rkgnfemrg4ehwfat@ldmartin-desk2.lan>
 <87pm916tba.fsf@intel.com>
 <20230322132841.o7ptwildnnykj4kr@ldmartin-desk2.lan>
 <87iles7ted.fsf@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87iles7ted.fsf@intel.com>
X-ClientProxiedBy: SJ0PR05CA0133.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::18) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DS0PR11MB7309:EE_
X-MS-Office365-Filtering-Correlation-Id: fd7e77fb-5f70-43e5-deaf-08db2b1807ff
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lr2erygOWdz5Nd+3PUCjS7f+TDH5Kx37tOcWMIItBjFrLLyycQ5RkYO9euvQWcEBFSzAQquRTA7F8egkZGTH/jYSnh0LXsv+e8X/I8rwVggR5Inpz7oBMS8ZXzWSOPgYQL086guO5u7gkzXAuswjK5V4u8Ox7aVgZHl9VCKL3vAaNLfxhMD4mp2x5oBBRbN/I42XK3YK+YjEVJDDmR72Z+h9GMouxs+uB9G8opgrw+ao5MSxHPT6A6sF6kk5Vp3Beh8GNxSMDsNkhLB1raECEOd5ES2X6oK9JVQgaOTK7rJPEPqQB6/uxgJroYfH8av0dKnftpToEH1VVmOP27YCOqW0kSIZx9EI+j7z5aOxSgOrGltG3UukACzjjIfH3Z/RhfiYb/FciquThpjWpWpBpsvP3W7dz6DFVgZkiS+UxApJcXzAxjZqg2uIuIugNrCuWEj3bUQTeHoYQZffxhJ1D9eCMSiFtP0BUvlXVcTks2Cvg70eZc3x3TlhPy/8WbN+Fur+BZeZat6N3h+J4dlxyWip7RNXp7J2UKGpRarMi863TxIPCrHN2wd3Mb4LuUuqn6gK52+1KdazTnz9v6fDmgeEfrtdwpQ8edpAyZt8jf8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(136003)(366004)(396003)(39860400002)(346002)(451199018)(86362001)(6512007)(26005)(2616005)(6506007)(2906002)(966005)(30864003)(6486002)(38100700002)(82960400001)(5660300002)(66574015)(36756003)(6666004)(44832011)(8936002)(6862004)(41300700001)(83380400001)(478600001)(37006003)(186003)(6636002)(54906003)(66476007)(8676002)(316002)(66946007)(66556008)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?jrPbLQMvR3W8HLXfJzsXEX5zrvBCy3tOg2ujPjDGeRTvNWq4aT/4zj4TcI?=
 =?iso-8859-1?Q?t0DQJzpt3JJgLsmnvV79QXCug+d7r5m4lHGUH0LaO8RPmvQL8ZeJ1L9ppx?=
 =?iso-8859-1?Q?oBAuFbA1RXaeM0YPN886jN0SsZNqeAH5+zVVBm+t00GUgLFFW07vfvf4Eq?=
 =?iso-8859-1?Q?t7cyuqYLxuK48WC30IydbbEnlTUGvR0vPSEbszsCTstixJygjL7VLfdwny?=
 =?iso-8859-1?Q?VJq/9M7FDrUKZNm3VBqngyEcug3b7d6ClVpMq9GY0kbqyFvvNqxAThjXuw?=
 =?iso-8859-1?Q?ce2bIKbUJbMw5R2wtCp7XGNS0dCWnJjnfNzz6jw7Hpkt4CLiBaJaVBXwG3?=
 =?iso-8859-1?Q?Xnd0iZDiobGnN2e/VD9u5TzQIrzFgALKK+bQJhAp725fJfkTkDrnoFa/Pa?=
 =?iso-8859-1?Q?vU5/cG/lNZVRaSuY1oqa8gmAAM7EFMBYKObP4SXu0kuES97rka7sEO8X+W?=
 =?iso-8859-1?Q?8LunMHe2j5Gg+I3oP6kcbDFJjcQ2REQfNiGn18NuCQV+U/NCmAUq30k0tW?=
 =?iso-8859-1?Q?V7ZfF56XKvbuceO8BvQyHs4WFEA9HorWx/mOjYyf97SUWSXElmibwYE6KY?=
 =?iso-8859-1?Q?J9YBykC0yFGMdVCQJiyGAsPV7hfK6/iZxrWE/WebCMry01w+SGCHXoAAKh?=
 =?iso-8859-1?Q?lg+5HDRoMZzjuX0TSnOSv5Tf0trQ3pGBLmGDzsrllCAllWlmztN0URGNzo?=
 =?iso-8859-1?Q?a+3lvog8jcrwTNYGMebCTLLZI4g+/WpfgjoWs7WIruElJpZRA0IXY6FT4a?=
 =?iso-8859-1?Q?fYhgCZRPwuZzHcCWcDvCwWQgLQMoKHLjWkqQ8igw/aXyI3/JqIGOk9JFy1?=
 =?iso-8859-1?Q?30iVRGpglFzKcuMbn2umBfoDewlisNTQZfpeMgVN/U86k8ev4oXrJG/kL/?=
 =?iso-8859-1?Q?HZ0OUoQ3ehZzh8BOhA28sB9v3BiRWANRxEC4okMI3pxGdfQSZk1HZhC4Qm?=
 =?iso-8859-1?Q?KlOL0ES07FogRCPearg4DeXPRgZZP7UwQ61zdh1DgeQoCpuzQcdxlOZPNA?=
 =?iso-8859-1?Q?vMTvMPqYR+uPaRsvpKM8mqCXF8Ejoll5qmigaUBoP8JJNetGKe7NdOXbrn?=
 =?iso-8859-1?Q?k6ijMZoMydmXIyvXCsuyVCIH3U+CwTnolMr6sxaeXNsF8T9q5AP7zuDhEI?=
 =?iso-8859-1?Q?auhTHXZlbPCIK0WfkOGybh+2RKCRuGV4SXWC7VuUZtBH3Z+PHfcA6YdZX9?=
 =?iso-8859-1?Q?OKQGnENj3G/x7LPzpB0lJsluD0f6Gu32WXRKfK8gvFrFsFWO14ih5iuvxz?=
 =?iso-8859-1?Q?42fkEywcKVLie2UbosrCACDHxCHYgSLUlmuqxtOkEqSVixFi0OhvdzvaF8?=
 =?iso-8859-1?Q?lY46MHf2MV7XNDK2nHXNSvmNe17/cBi4ngVztwJsboobQCkpt57XjbZc1R?=
 =?iso-8859-1?Q?Mi2NWZfjaqZTXPiGw9+adreFqrrC2D0h2Ow8U4IxDSUv16N+7w7P6Ik+FP?=
 =?iso-8859-1?Q?IuW7vjGvXiOFJBzdo840Q0Mc1aANdXs+9R28R4F+hIW2wj2TrUIL+KuWuh?=
 =?iso-8859-1?Q?5Zl4F6hKHiAfWHWxEjubPPBEpyYszizLsqHLQf61VecpMhg3XIWTAZ3kZA?=
 =?iso-8859-1?Q?xXuPgrLT6pC6wLfiPXXTx/K6xegLJL6+KraZp30aic/xksN+aOIFcUiGGa?=
 =?iso-8859-1?Q?wVqTyW8yT3lSyzAWBGNoceqvUZ9vlBpG3ez+W2pfzTM3P92TOpX5YFqA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fd7e77fb-5f70-43e5-deaf-08db2b1807ff
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 20:57:21.9600 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1HnwPAqBo2jEoNVw7NkkN1TtYpE2PfaiXFBPWNsIWv8sXilDmfIQ1jJJHgHo58dEAc9FD9k+0ffkDzVro3HflQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7309
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/i915/rps: split out display rps parts to
 a separate file
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Mar 22, 2023 at 04:27:54PM +0200, Jani Nikula wrote:
> On Wed, 22 Mar 2023, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> > On Wed, Mar 22, 2023 at 11:15:05AM +0200, Jani Nikula wrote:
> >>On Tue, 21 Mar 2023, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> >>> On Tue, Mar 21, 2023 at 06:08:39PM +0200, Jani Nikula wrote:
> >>>>On Tue, 21 Mar 2023, Jani Nikula <jani.nikula@intel.com> wrote:
> >>>>> On Tue, 21 Mar 2023, Jani Nikula <jani.nikula@intel.com> wrote:
> >>>>>> Split out the RPS parts so they can be conditionally compiled out later.
> >>>>>>
> >>>>>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> >>>>>> Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> >>>>>> Link: https://patchwork.freedesktop.org/patch/msgid/20230302164936.3034161-1-jani.nikula@intel.com
> >>>>>> (cherry picked from commit 6dbbff25b39565c801c87379bc85933fb436518e)
> >>>>>>
> >>>>>> ---
> >>>>>>
> >>>>>> Here's an example of an upstream i915 commit that can help clean up
> >>>>>> cherry-pick as well as cleanup of the #ifdefs in one go, otherwise it
> >>>>>> breaks bisect.
> >>>>>
> >>>>> *sigh* I had something more here, but having #ifdef first on a line
> >>>>> dropped it as comments, and turned it into nonsense.
> >>>>>
> >>>>> It's a backport of upstream i915 commit to help clean up #ifdefs, but
> >>>>> how do we want to handle them?
> >>>>
> >>>>Moreover, even if we're stalling with adding such #ifdefs to upstream
> >>>>i915 now, we can however clean up existing usage in the xe branch to be
> >>>>more suitable for upstream. For example, I'd take the #ifdefs here
> >>>>pretty much without issues.
> >>>
> >>> instead of a cherry-pick + squashed-ifdef-removal I think it's better
> >>> to do:
> >>>
> >>> 1) cherry-pick
> >>> 2) remove ifdefs and commit with
> >>>
> >>> 	git commit -s --fixup=38a139546384
> >>>
> >>>    ... or whatever commit added them (there are a few before that commit
> >>>    above)
> >>
> >>Even if that results in a broken build for a commit?
> >
> > yes, I guess we don't have many options. Better stick to the one that
> > can produce a clean result at the end
> >
> >>I also have i915 patches locally that I think are probably fine upstream
> >>*with* the xe submission, but not standalone. They clean up #ifdefs. The
> >>trouble is, they often break the build on top of drm-xe-next, unless I
> >>also fix the commit adding #ifdefs. And in a rebase, they should go
> >>*before* 38a139546384.
> >>
> >>Here's a good example: https://paste.debian.net/1274882/
> >>
> >>That commit should go before 38a139546384, with -DI915=1 added to i915
> >>build, but it also touches xe to keep building properly.
> >
> > I guess the option is to state that in the commit message.
> > Maybe hacking a git command
> >
> > 	git commit -a --fixup=38a139546384^
> >
> > and then make sure the commit says something about NOFIXUP. So whoever
> > is rebasing knows this is about a commit move only. I can type a script
> > to change the rebase.todo automatically to do that if needed.
> > Maybe git would be open to accept the logic for a `git commit
> > --fixup=[move-after|move-before]:`
> 
> Even that doesn't work nicely, because there's so much cruft already
> that we can't have clean i915 commits on top of drm-xe-next.
> 
> The whole file movement to compat-i915-headers is also still part of the
> history.
> 
> When do we start squashing those away?

I believe the easiest way will be to remove the display portion of the
initial mega-squash and create a display only patch/series and make that
separated.

Also starting to think to leave display out for the initial merge of Xe.
Then add display later.

> 
> BR,
> Jani.
> 
> >>Here, I admit a git-pile setup would help this part of the job.
> >>
> >>> The reason is that I don't think we will be able to avoid 1 more rebase
> >>> before being merged upstream.  We can't do merge-approach neither
> >>> because of these commits we don't really want to ever show up in
> >>> upstream (and because we are on top of drm-tip rather than e.g.
> >>> drm-next). So doing the above at least makes a rebase more bearable:
> >>
> >>I thought the rebase was going to be on v6.2, I argued for basing on
> >>drm-intel-next, but it ended up being on drm-tip after all. I was kind
> >>of surprised.

:) my bad!

> >
> > I still prefer it on <release-tag>  or at the most drm-next.

well, in the end we will need to be on top of the drm-next. But meanwhile
we are flexible. I just wanted us to be on some point of a 6.2 with the
most of the display.

> But does it
> > matter much if we still keep these commits that can't go as-is upstream?
> > If we didn't have them we could simply have a merge approach and be on
> > a <release-tag>, which would be much simpler.
> >
> > Lucas De Marchi
> >
> >>
> >>> Whenever we do a rebase (with --autosquash) the cherry-pick should
> >>> automatically be dropped by git and the fixup should automatically remove
> >>> the addition of the ifdefs in the commit that added them.
> >>
> >>If only there was a way to tell git rebase how to reorder the
> >>patches. That would be needed for the ones that aren't upstream.
> >>
> >>BR,
> >>Jani.
> >>
> >>
> >>>
> >>> Lucas De Marchi
> >>>
> >>>>
> >>>>BR,
> >>>>Jani.
> >>>>
> >>>>
> >>>>>
> >>>>>
> >>>>>> ---
> >>>>>>  drivers/gpu/drm/i915/Makefile                 |  1 +
> >>>>>>  .../gpu/drm/i915/display/intel_atomic_plane.c | 85 ++-----------------
> >>>>>>  .../gpu/drm/i915/display/intel_display_rps.c  | 81 ++++++++++++++++++
> >>>>>>  .../gpu/drm/i915/display/intel_display_rps.h  | 34 ++++++++
> >>>>>>  4 files changed, 123 insertions(+), 78 deletions(-)
> >>>>>>  create mode 100644 drivers/gpu/drm/i915/display/intel_display_rps.c
> >>>>>>  create mode 100644 drivers/gpu/drm/i915/display/intel_display_rps.h
> >>>>>>
> >>>>>> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
> >>>>>> index ae9259ab3261..f689132e1506 100644
> >>>>>> --- a/drivers/gpu/drm/i915/Makefile
> >>>>>> +++ b/drivers/gpu/drm/i915/Makefile
> >>>>>> @@ -239,6 +239,7 @@ i915-y += \
> >>>>>>  	display/intel_display_power.o \
> >>>>>>  	display/intel_display_power_map.o \
> >>>>>>  	display/intel_display_power_well.o \
> >>>>>> +	display/intel_display_rps.o \
> >>>>>>  	display/intel_dmc.o \
> >>>>>>  	display/intel_dpio_phy.o \
> >>>>>>  	display/intel_dpll.o \
> >>>>>> diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> >>>>>> index 3d37f44ec835..e666a5c1fd91 100644
> >>>>>> --- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> >>>>>> +++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> >>>>>> @@ -34,13 +34,10 @@
> >>>>>>  #include <drm/drm_atomic_helper.h>
> >>>>>>  #include <drm/drm_fourcc.h>
> >>>>>>
> >>>>>> -#ifdef I915
> >>>>>> -#include "gt/intel_rps.h"
> >>>>>> -#endif
> >>>>>> -
> >>>>>>  #include "i915_config.h"
> >>>>>>  #include "intel_atomic_plane.h"
> >>>>>>  #include "intel_cdclk.h"
> >>>>>> +#include "intel_display_rps.h"
> >>>>>>  #include "intel_display_trace.h"
> >>>>>>  #include "intel_display_types.h"
> >>>>>>  #include "intel_fb.h"
> >>>>>> @@ -951,66 +948,6 @@ int intel_atomic_plane_check_clipping(struct intel_plane_state *plane_state,
> >>>>>>  	return 0;
> >>>>>>  }
> >>>>>>
> >>>>>> -#ifdef I915
> >>>>>> -struct wait_rps_boost {
> >>>>>> -	struct wait_queue_entry wait;
> >>>>>> -
> >>>>>> -	struct drm_crtc *crtc;
> >>>>>> -	struct i915_request *request;
> >>>>>> -};
> >>>>>> -
> >>>>>> -static int do_rps_boost(struct wait_queue_entry *_wait,
> >>>>>> -			unsigned mode, int sync, void *key)
> >>>>>> -{
> >>>>>> -	struct wait_rps_boost *wait = container_of(_wait, typeof(*wait), wait);
> >>>>>> -	struct i915_request *rq = wait->request;
> >>>>>> -
> >>>>>> -	/*
> >>>>>> -	 * If we missed the vblank, but the request is already running it
> >>>>>> -	 * is reasonable to assume that it will complete before the next
> >>>>>> -	 * vblank without our intervention, so leave RPS alone.
> >>>>>> -	 */
> >>>>>> -	if (!i915_request_started(rq))
> >>>>>> -		intel_rps_boost(rq);
> >>>>>> -	i915_request_put(rq);
> >>>>>> -
> >>>>>> -	drm_crtc_vblank_put(wait->crtc);
> >>>>>> -
> >>>>>> -	list_del(&wait->wait.entry);
> >>>>>> -	kfree(wait);
> >>>>>> -	return 1;
> >>>>>> -}
> >>>>>> -
> >>>>>> -static void add_rps_boost_after_vblank(struct drm_crtc *crtc,
> >>>>>> -				       struct dma_fence *fence)
> >>>>>> -{
> >>>>>> -	struct wait_rps_boost *wait;
> >>>>>> -
> >>>>>> -	if (!dma_fence_is_i915(fence))
> >>>>>> -		return;
> >>>>>> -
> >>>>>> -	if (DISPLAY_VER(to_i915(crtc->dev)) < 6)
> >>>>>> -		return;
> >>>>>> -
> >>>>>> -	if (drm_crtc_vblank_get(crtc))
> >>>>>> -		return;
> >>>>>> -
> >>>>>> -	wait = kmalloc(sizeof(*wait), GFP_KERNEL);
> >>>>>> -	if (!wait) {
> >>>>>> -		drm_crtc_vblank_put(crtc);
> >>>>>> -		return;
> >>>>>> -	}
> >>>>>> -
> >>>>>> -	wait->request = to_request(dma_fence_get(fence));
> >>>>>> -	wait->crtc = crtc;
> >>>>>> -
> >>>>>> -	wait->wait.func = do_rps_boost;
> >>>>>> -	wait->wait.flags = 0;
> >>>>>> -
> >>>>>> -	add_wait_queue(drm_crtc_vblank_waitqueue(crtc), &wait->wait);
> >>>>>> -}
> >>>>>> -#endif
> >>>>>> -
> >>>>>>  /**
> >>>>>>   * intel_prepare_plane_fb - Prepare fb for usage on plane
> >>>>>>   * @_plane: drm plane to prepare for
> >>>>>> @@ -1102,13 +1039,13 @@ intel_prepare_plane_fb(struct drm_plane *_plane,
> >>>>>>  		dma_resv_iter_begin(&cursor, obj->base.resv,
> >>>>>>  				    DMA_RESV_USAGE_WRITE);
> >>>>>>  		dma_resv_for_each_fence_unlocked(&cursor, fence) {
> >>>>>> -			add_rps_boost_after_vblank(new_plane_state->hw.crtc,
> >>>>>> -						   fence);
> >>>>>> +			intel_display_rps_boost_after_vblank(new_plane_state->hw.crtc,
> >>>>>> +							     fence);
> >>>>>>  		}
> >>>>>>  		dma_resv_iter_end(&cursor);
> >>>>>>  	} else {
> >>>>>> -		add_rps_boost_after_vblank(new_plane_state->hw.crtc,
> >>>>>> -					   new_plane_state->uapi.fence);
> >>>>>> +		intel_display_rps_boost_after_vblank(new_plane_state->hw.crtc,
> >>>>>> +						     new_plane_state->uapi.fence);
> >>>>>>  	}
> >>>>>>
> >>>>>>  	/*
> >>>>>> @@ -1119,10 +1056,7 @@ intel_prepare_plane_fb(struct drm_plane *_plane,
> >>>>>>  	 * that are not quite steady state without resorting to forcing
> >>>>>>  	 * maximum clocks following a vblank miss (see do_rps_boost()).
> >>>>>>  	 */
> >>>>>> -	if (!state->rps_interactive) {
> >>>>>> -		intel_rps_mark_interactive(&to_gt(dev_priv)->rps, true);
> >>>>>> -		state->rps_interactive = true;
> >>>>>> -	}
> >>>>>> +	intel_display_rps_mark_interactive(dev_priv, state, true);
> >>>>>>
> >>>>>>  	return 0;
> >>>>>>
> >>>>>> @@ -1159,12 +1093,7 @@ intel_cleanup_plane_fb(struct drm_plane *plane,
> >>>>>>  	if (!obj)
> >>>>>>  		return;
> >>>>>>
> >>>>>> -#ifdef I915
> >>>>>> -	if (state->rps_interactive) {
> >>>>>> -		intel_rps_mark_interactive(&to_gt(dev_priv)->rps, false);
> >>>>>> -		state->rps_interactive = false;
> >>>>>> -	}
> >>>>>> -#endif
> >>>>>> +	intel_display_rps_mark_interactive(dev_priv, state, false);
> >>>>>>
> >>>>>>  	/* Should only be called after a successful intel_prepare_plane_fb()! */
> >>>>>>  	intel_plane_unpin_fb(old_plane_state);
> >>>>>> diff --git a/drivers/gpu/drm/i915/display/intel_display_rps.c b/drivers/gpu/drm/i915/display/intel_display_rps.c
> >>>>>> new file mode 100644
> >>>>>> index 000000000000..918d0327169a
> >>>>>> --- /dev/null
> >>>>>> +++ b/drivers/gpu/drm/i915/display/intel_display_rps.c
> >>>>>> @@ -0,0 +1,81 @@
> >>>>>> +// SPDX-License-Identifier: MIT
> >>>>>> +/*
> >>>>>> + * Copyright © 2023 Intel Corporation
> >>>>>> + */
> >>>>>> +
> >>>>>> +#include <drm/drm_crtc.h>
> >>>>>> +#include <drm/drm_vblank.h>
> >>>>>> +
> >>>>>> +#include "gt/intel_rps.h"
> >>>>>> +#include "i915_drv.h"
> >>>>>> +#include "intel_display_rps.h"
> >>>>>> +#include "intel_display_types.h"
> >>>>>> +
> >>>>>> +struct wait_rps_boost {
> >>>>>> +	struct wait_queue_entry wait;
> >>>>>> +
> >>>>>> +	struct drm_crtc *crtc;
> >>>>>> +	struct i915_request *request;
> >>>>>> +};
> >>>>>> +
> >>>>>> +static int do_rps_boost(struct wait_queue_entry *_wait,
> >>>>>> +			unsigned mode, int sync, void *key)
> >>>>>> +{
> >>>>>> +	struct wait_rps_boost *wait = container_of(_wait, typeof(*wait), wait);
> >>>>>> +	struct i915_request *rq = wait->request;
> >>>>>> +
> >>>>>> +	/*
> >>>>>> +	 * If we missed the vblank, but the request is already running it
> >>>>>> +	 * is reasonable to assume that it will complete before the next
> >>>>>> +	 * vblank without our intervention, so leave RPS alone.
> >>>>>> +	 */
> >>>>>> +	if (!i915_request_started(rq))
> >>>>>> +		intel_rps_boost(rq);
> >>>>>> +	i915_request_put(rq);
> >>>>>> +
> >>>>>> +	drm_crtc_vblank_put(wait->crtc);
> >>>>>> +
> >>>>>> +	list_del(&wait->wait.entry);
> >>>>>> +	kfree(wait);
> >>>>>> +	return 1;
> >>>>>> +}
> >>>>>> +
> >>>>>> +void intel_display_rps_boost_after_vblank(struct drm_crtc *crtc,
> >>>>>> +					  struct dma_fence *fence)
> >>>>>> +{
> >>>>>> +	struct wait_rps_boost *wait;
> >>>>>> +
> >>>>>> +	if (!dma_fence_is_i915(fence))
> >>>>>> +		return;
> >>>>>> +
> >>>>>> +	if (DISPLAY_VER(to_i915(crtc->dev)) < 6)
> >>>>>> +		return;
> >>>>>> +
> >>>>>> +	if (drm_crtc_vblank_get(crtc))
> >>>>>> +		return;
> >>>>>> +
> >>>>>> +	wait = kmalloc(sizeof(*wait), GFP_KERNEL);
> >>>>>> +	if (!wait) {
> >>>>>> +		drm_crtc_vblank_put(crtc);
> >>>>>> +		return;
> >>>>>> +	}
> >>>>>> +
> >>>>>> +	wait->request = to_request(dma_fence_get(fence));
> >>>>>> +	wait->crtc = crtc;
> >>>>>> +
> >>>>>> +	wait->wait.func = do_rps_boost;
> >>>>>> +	wait->wait.flags = 0;
> >>>>>> +
> >>>>>> +	add_wait_queue(drm_crtc_vblank_waitqueue(crtc), &wait->wait);
> >>>>>> +}
> >>>>>> +
> >>>>>> +void intel_display_rps_mark_interactive(struct drm_i915_private *i915,
> >>>>>> +					struct intel_atomic_state *state,
> >>>>>> +					bool interactive)
> >>>>>> +{
> >>>>>> +	if (state->rps_interactive == interactive)
> >>>>>> +		return;
> >>>>>> +
> >>>>>> +	intel_rps_mark_interactive(&to_gt(i915)->rps, interactive);
> >>>>>> +	state->rps_interactive = interactive;
> >>>>>> +}
> >>>>>> diff --git a/drivers/gpu/drm/i915/display/intel_display_rps.h b/drivers/gpu/drm/i915/display/intel_display_rps.h
> >>>>>> new file mode 100644
> >>>>>> index 000000000000..2cfb8a303b77
> >>>>>> --- /dev/null
> >>>>>> +++ b/drivers/gpu/drm/i915/display/intel_display_rps.h
> >>>>>> @@ -0,0 +1,34 @@
> >>>>>> +/* SPDX-License-Identifier: MIT */
> >>>>>> +/*
> >>>>>> + * Copyright © 2023 Intel Corporation
> >>>>>> + */
> >>>>>> +
> >>>>>> +#ifndef __INTEL_DISPLAY_RPS_H__
> >>>>>> +#define __INTEL_DISPLAY_RPS_H__
> >>>>>> +
> >>>>>> +#include <linux/types.h>
> >>>>>> +
> >>>>>> +struct dma_fence;
> >>>>>> +struct drm_crtc;
> >>>>>> +struct drm_i915_private;
> >>>>>> +struct intel_atomic_state;
> >>>>>> +
> >>>>>> +#ifdef I915
> >>>>>> +void intel_display_rps_boost_after_vblank(struct drm_crtc *crtc,
> >>>>>> +					  struct dma_fence *fence);
> >>>>>> +void intel_display_rps_mark_interactive(struct drm_i915_private *i915,
> >>>>>> +					struct intel_atomic_state *state,
> >>>>>> +					bool interactive);
> >>>>>> +#else
> >>>>>> +static inline void intel_display_rps_boost_after_vblank(struct drm_crtc *crtc,
> >>>>>> +							struct dma_fence *fence)
> >>>>>> +{
> >>>>>> +}
> >>>>>> +static inline void intel_display_rps_mark_interactive(struct drm_i915_private *i915,
> >>>>>> +						      struct intel_atomic_state *state,
> >>>>>> +						      bool interactive)
> >>>>>> +{
> >>>>>> +}
> >>>>>> +#endif
> >>>>>> +
> >>>>>> +#endif /* __INTEL_DISPLAY_RPS_H__ */
> >>>>
> >>>>--
> >>>>Jani Nikula, Intel Open Source Graphics Center
> >>
> >>-- 
> >>Jani Nikula, Intel Open Source Graphics Center
> 
> -- 
> Jani Nikula, Intel Open Source Graphics Center
