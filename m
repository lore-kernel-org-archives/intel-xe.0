Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2DA0CD342F
	for <intel-xe@archiver.kernel.org>; Mon,  4 May 2026 21:48:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5122A10E887;
	Mon,  4 May 2026 21:48:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SJXgN+c1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7FF610E887
 for <intel-xe@lists.freedesktop.org>; Mon,  4 May 2026 21:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777931310; x=1809467310;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=LEBL6LAnJs4E9wSPOtK3Hm4BnMU42yEebyXzrKbF/wI=;
 b=SJXgN+c1uwSMNeXyj+UI9Qq0QmIGgm9WvDm33YWioWEClchLJxKfo5GF
 YLDDkBTQnKMHcrMw8hKS7GEwvopGO3L++QQG1iuXNiOdoTlXmgmxhkR9f
 99dBJIsbdXPg7woMmldrsXY1gM2vWqykDc5Qp9tA9jbYMe/YrmOEen93Y
 glxqs3odhanBJTIxHi/dCY4sXVNkPLy2LjDVrsPGR4UkIPLGHQb3Y6QNP
 O2MVcUS+V81C7AWTXpOhse1/JfFRP0v/w6Ea3+7gsY/nOtsAf4a7KsZzH
 +3U88fQdlfT9bTGqwO6W+GFbTvVdYeA1gO9DFD2fXMt9sDGzPbg1z95ct w==;
X-CSE-ConnectionGUID: W+EU6OefQAOhPSg2LW89gg==
X-CSE-MsgGUID: HzNq1AksSQKcQP/YnhyqJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="78698743"
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; d="scan'208";a="78698743"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 14:48:30 -0700
X-CSE-ConnectionGUID: 5mEEW6ppStu+Ddyp28FCQA==
X-CSE-MsgGUID: FnNd8g55RDigRtw+wRnY1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; d="scan'208";a="240622142"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 14:48:30 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 4 May 2026 14:48:29 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 4 May 2026 14:48:29 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.2) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 4 May 2026 14:48:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OEuJLcJJvigI6eX4AVz0JRwmlsR6pEvd+zP5C/apzPrBfT9UemxPmZxbH4jzWQChfWtqKUlkzhjwJiKRL0AKw6DhtoWddAq1zskV+OHBcgtNGUxHC8hJ1Ce6mVLyaQ+Cmq83dxs15lEDMBIXmLjKRu38j+6SScRj854e3SgzhZyO0oc+mhVwvylqJ7FmZdfpnn6nZ4VonZBrAnI1IXFgda29P9Kz+mW42i/bbByA3OIC+SLrWySr8UIlPdEmzJDhmtsLhe6c4bANYhH6L6Jcs5H7/6OR0XlZzP2KdTd8QIMl4Zau6SGTky5ys0mHwkXUnp7ebkG57JuAsCa6n+kJFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4+3ujAnBkHs52LjhunSHMvlTkB7Irwt7HH2HWGU+zrw=;
 b=gQ22bCSxf5E6xj6DP84vR6wU62kVoreTmLwV8bdpSTP5A/H5JmG4h6kSZM/REUFVzh3XyN7jq0PYqcF1dvzGwpDVTlN9TjOV+ABkYa0v1alDb02LT15wNxyfT3qQg/1ZBsm8hGgdLaowR1npDDaApFsygDU4AYxmppdYugc1O4Y8CqwCVvH3nZEbqV+0PszQRtzxpagp/wb1DgpqSU+sNdXAmQnqxBbmTWh2nxniV4oTrdMQbAUn3uMmtGlJ72OHsdWUymmfOBYq2He4AmifBiM+GMwQShIuzJd3RkxdCUCqwuQDv33kTmJqgw0bJVhyKM8ZtXSUghuLwBxDvjVI+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB6918.namprd11.prod.outlook.com (2603:10b6:806:2bf::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Mon, 4 May
 2026 21:48:27 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%7]) with mapi id 15.20.9870.023; Mon, 4 May 2026
 21:48:27 +0000
Date: Mon, 4 May 2026 14:48:24 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Lin,
 Shuicheng" <shuicheng.lin@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "Wajdeczko, Michal" <michal.wajdeczko@intel.com>, "Nerlige Ramappa, Umesh"
 <umesh.nerlige.ramappa@intel.com>, "Ceraolo Spurio, Daniele"
 <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH 3/9] drm/xe: Split out configfs data structures
Message-ID: <afkUKOzpMiDKhILD@gsse-cloud1.jf.intel.com>
References: <20260504044348.209625-1-stuart.summers@intel.com>
 <20260504044348.209625-4-stuart.summers@intel.com>
 <be85da366bbb91d83d66d4e2fccf1679c6c8c96b@intel.com>
 <67d2074cd720da46c40a9f5b38089a7642d1e0fd.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <67d2074cd720da46c40a9f5b38089a7642d1e0fd.camel@intel.com>
X-ClientProxiedBy: SJ0PR03CA0128.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::13) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB6918:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f1153fa-4d4b-4966-c21e-08deaa26df79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: QB4SJhcpoxGzqLvabk5I8ieEe6eLstt+VyiYryOf9GYHSrnQryLm2NJBLu/yuBUw+Yfs/SznosW23HUh6Ai83x/4E0eKgGlfa3ytoR3L/CBlfF9Xn8YATC8Y03fRDhc+Yiia/pSi8f44/ZxsOIu/6dDs3Zs+IM3wJZzCA5OZR4GnQ6ZPUloY06eizMtSYURsmj21rMZPwJwzhLH+Qq4MqcjoLyiy0q6RvXzdWk74FnX+1jwHo8t8osHvCW1hb0VaBVJVQhygk5qFZ0ZGrG1DVirERglbDSVmcA9gEPE3suTJPNhhM/y9/KPAB5N8qssUyV5KHXfLWmUo5EAI/Hq2nmjJcL/HdqjAVvVQnMC0gia6qh3py2hO+BVrIx6V24hbl56JZ2rl9BUuLXPPREsx4Wz/azgPjvKLzek+2njLzZscriSJfuI6FU0h3BjJe5Tqph4Ao0LfWuMh6f/es81mezqjKPUgDgrLu+29WiDMg6tbCEWNrXyPLAkEx1KmWSqkloeQAW/TubSNdakV2ARFuPrVSUa4Qwf0DMhLCHtnjMyIVnKAG/rsICp/I8thLnmuqQRcnfhINXDlWftXSkrNaJgC20xGzxPTn8SKTYhazFfOoeWYevytgEbVeopShFPmcD3G0U7Ov04YyPB28dZdwRfFpkan4pDVP5odZQfByzgNFC1KrrLCLoG9AF6PLuJ6
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?cSoQXVBPCuBdHr+P0XOWjS3NoQJwPphlxyB0n50zLv+KXMpr2fFdDy4750?=
 =?iso-8859-1?Q?xcp1EaD6uEvlKyla6d0h96MnXQEloP133ze7y+axRL053VdBVUCE970Qof?=
 =?iso-8859-1?Q?HhehCsg2MAbMSW2UL+5hHR+RY+WMxHCFdprB16b830v2wDt6cbxS4GQood?=
 =?iso-8859-1?Q?OnrTclZQnulL7T8Idzo8OZGMhSOUDfyxSoUK2BhQHgwMCNB7IWfsi7rQxX?=
 =?iso-8859-1?Q?C3gtchdN5QLz68V8dhL/PKb6860bL8zGyhhzbeUdiPJFet8Zg7urM2KH/+?=
 =?iso-8859-1?Q?kE/BHRSCfO7SPtoL7MOI//jFI1559LFqbAFwyUyKxIUhMUlQXHVfBmIkdF?=
 =?iso-8859-1?Q?fkhueijOPOkH+qPzqZw+JUifrvjPHW226z3RCsSJLucYGzuC+kKvxRoaSJ?=
 =?iso-8859-1?Q?IPfBcu6XXkNW0hDGI5JrCVkGHgnnBaPQtlITXB9V7zdbAL2KDCJnAPVqe5?=
 =?iso-8859-1?Q?HYOilJq9130h0Rq7/SEYyiKnXEby0FK56qftAnVxZxwkaBoaupTA/PIPS8?=
 =?iso-8859-1?Q?r7aKugWXyoPNYCoTrx3KLkmxczF0F8GM57wuNyhkgHYUSh6B2fVWP3hmf5?=
 =?iso-8859-1?Q?dZsmwMF/h2x2783PjrpCBbrVeUoDWlNc4JUxAjEVOBBHD1XEAWKc2uNqS3?=
 =?iso-8859-1?Q?j5PGJOOBkECevUwLH7CnsVxiJ08BXuT8209yrHJuDB0RVnhcjPvLUg1ico?=
 =?iso-8859-1?Q?jmuMbmgsfg7Cl0CINlAITZUvAbzfePe5jmM26DItRcEY+7kNpEFitdqt9w?=
 =?iso-8859-1?Q?jxZtp1jbCu95LCwwLkqNpf3UcTsrBmAZ4xzjXKvF9QynB8tUWyYi07Y7kU?=
 =?iso-8859-1?Q?y7gc2CVBK1XX+BYB+WGC6NjIzS0+/9d/wnd0KyGAihY2fbZAiTaceHnXcN?=
 =?iso-8859-1?Q?bBZduop5HyIkWsRIhcCxILGnfrVx0lmdop8giMXZLehQHRnnXsgjPqKl4i?=
 =?iso-8859-1?Q?1862Shdunlxe4AYckz5y9aHunRlSRHFuV2xw+fbA4GPP49dh0Wet57BC5u?=
 =?iso-8859-1?Q?i+1dKC2zaM1nFpjsDrZ28kA4nqW7AGWaKCHqnV5gZfi0ZQYJurnyuj8Dsr?=
 =?iso-8859-1?Q?yxTkozdekGJKlH4xp1uXYY3WrNk6xUH5BOFjzPp3rnnnvmI0L8qi+bLCwl?=
 =?iso-8859-1?Q?jqQTzxWKVzWeMFu3KDkurhK58ieDRloEsdM+Ph3KOBSJpkXkwR5tvpLXfC?=
 =?iso-8859-1?Q?EJbBskYWKBg7mJ8sCYvl0oznb2DWNMR2f/CnYjcTp4fT+l3Xd+CxCxwdGa?=
 =?iso-8859-1?Q?i/hJNsl9lwq3CneobE8c1G4W4GbwVSA4XMGQoCWeP2iM4Q5NLLNk2fylp0?=
 =?iso-8859-1?Q?gyVFIGJyEKMiz+Lpnw/uuUbB3/EPc44G9nh6eumuWRFhHXwr7qS1UeXCq0?=
 =?iso-8859-1?Q?SvRXAbLHUKZUE9Eq5e8fXr3xlu5u+Wv38gMt5FYjYILdcE4eiuUc1zaTDG?=
 =?iso-8859-1?Q?hUPl/McNjVQfPEInsd+hdXRNwWRy4CHc1dHJzvhcIvWSLtNlW5UzFI21QQ?=
 =?iso-8859-1?Q?EZKXY0PirQvHmdw007ae14H+RezJRz+DsyAAF0YXI83bOTsknrbH/h/96a?=
 =?iso-8859-1?Q?90SQRs6ZTOeQj97GW+zQ75QrzXKDZWTAWOcCXvJWamtM518i30ZD0suKRC?=
 =?iso-8859-1?Q?5+JKKEaLRE6ZXD+sEpt3ISWmJC8xrwzNZdPsT/Cjk986zYKQMUHKQGzTvx?=
 =?iso-8859-1?Q?6xmxOqPXfPzEFfyl7Ck/x3f0ibrHnPSzPxXLEbnjXrTp9j3kC+dmRjCo+A?=
 =?iso-8859-1?Q?UPz0di/MwvRad4DkUcjXTq3dmuiP7arfEQN7CNO6X5gSx3NUbcaRUwupgR?=
 =?iso-8859-1?Q?jQ21BHpzo1d7lyhdg5UylUEbQ3SN59s=3D?=
X-Exchange-RoutingPolicyChecked: rAlrNrb/hPieHhSJ/B3aL9Q0MhtsQRK9UoNi7UuF1E6P6uH6hBubbiMEGcUICAzl3/9QUe8c9eZLNqJ77AaS7aAYv8dw2eFL0UANyAJ80Od9rMjlr9P+JRlSCZb0Efdx4HWLfOT7PNf06T3hBOE48cJzCyx6xUIMIQEp30N3QEuTqMR4Zbs9bVU64fkukVNq1L5QkHl5DjNiWRoH8FoUS0S+eeXAgvaBYh+JRaoZs2l2MoRSEKNy2z0ZS3jKZVFNuScnTmPXr3G1Kx/PWomwW3VSQCmD+RZSHl+G11oSFXiHr9xXxsKnCFbFiQLMFx5iRNfkD4oAYbrKD8DiIaIg3A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f1153fa-4d4b-4966-c21e-08deaa26df79
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2026 21:48:26.9784 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IYjj0X2+P1A0QbbG2nhBQw1bp5ydphuvz/cNb2C9zOVKiiEA2JYZLVUcpX9S8OgJKNlp+xesvZeTFFw5eIxNpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6918
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

On Mon, May 04, 2026 at 08:24:14AM -0600, Summers, Stuart wrote:
> On Mon, 2026-05-04 at 11:47 +0300, Jani Nikula wrote:
> > On Mon, 04 May 2026, Stuart Summers <stuart.summers@intel.com> wrote:
> > > Split the configfs data structures into their own _types.h file.
> > 
> > Why? The commit message must always answer the question, "why".
> > 

This is a good point. In general, we should be moving public structs
that have no business being in public headers (we do quite a bit of this
in Xe) into private structs in C files. This patch does the opposite, so
unless there is a very good reason to make this public (e.g, a struct
is intended to embedded), my initial reaction is not to do this.

Private structures enforce good layering and component isolation, and
prevent vectors for abuse (i.e., another layer messing with a struct
owned by a different layer).

Matt

> > The obvious downside here is that you expose the types that were
> > previously hidden in xe_configfs.c to anyone who includes
> > xe_configfs_types.h. And that header depends on a ton of other
> > headers,
> > making the header interdepencies worse overall.
> > 
> > Maybe you need that header later for something, but please spell that
> > out here.
> 
> Yeah this is exactly true.. I'll do a better job with the commit
> messages here going forward. Really appreciate the feedback Jani!
> 
> -Stuart
> 
> > 
> > 
> > BR,
> > Jani.
> > 
> > > 
> > > Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> > > Assisted-by: Copilot:claude-opus-4.7
> > > ---
> > >  drivers/gpu/drm/xe/xe_configfs.c       | 85 +++++++---------------
> > > ----
> > >  drivers/gpu/drm/xe/xe_configfs_types.h | 59 ++++++++++++++++++
> > >  2 files changed, 80 insertions(+), 64 deletions(-)
> > >  create mode 100644 drivers/gpu/drm/xe/xe_configfs_types.h
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_configfs.c
> > > b/drivers/gpu/drm/xe/xe_configfs.c
> > > index 1e134057fae8..12b7fe65446d 100644
> > > --- a/drivers/gpu/drm/xe/xe_configfs.c
> > > +++ b/drivers/gpu/drm/xe/xe_configfs.c
> > > @@ -4,7 +4,6 @@
> > >   */
> > >  
> > >  #include <linux/bitops.h>
> > > -#include <linux/ctype.h>
> > >  #include <linux/configfs.h>
> > >  #include <linux/cleanup.h>
> > >  #include <linux/find.h>
> > > @@ -15,12 +14,10 @@
> > >  
> > >  #include "instructions/xe_mi_commands.h"
> > >  #include "xe_configfs.h"
> > > +#include "xe_configfs_types.h"
> > >  #include "xe_defaults.h"
> > >  #include "xe_gt_types.h"
> > > -#include "xe_hw_engine_types.h"
> > >  #include "xe_module.h"
> > > -#include "xe_pci_types.h"
> > > -#include "xe_sriov_types.h"
> > >  
> > >  /**
> > >   * DOC: Xe Configfs
> > > @@ -245,36 +242,6 @@
> > >   *     # rmdir /sys/kernel/config/xe/0000:03:00.0/
> > >   */
> > >  
> > > -/* Similar to struct xe_bb, but not tied to HW (yet) */
> > > -struct wa_bb {
> > > -       u32 *cs;
> > > -       u32 len; /* in dwords */
> > > -};
> > > -
> > > -struct xe_config_group_device {
> > > -       struct config_group group;
> > > -       struct config_group sriov;
> > > -
> > > -       struct xe_config_device {
> > > -               struct wa_bb
> > > ctx_restore_mid_bb[XE_ENGINE_CLASS_MAX];
> > > -               struct wa_bb
> > > ctx_restore_post_bb[XE_ENGINE_CLASS_MAX];
> > > -               bool enable_psmi;
> > > -               bool enable_survivability_mode;
> > > -               u64 engines_allowed;
> > > -               u64 gt_types_allowed;
> > > -               struct {
> > > -                       bool admin_only_pf;
> > > -                       unsigned int max_vfs;
> > > -               } sriov;
> > > -       } config;
> > > -
> > > -       /* protects attributes */
> > > -       struct mutex lock;
> > > -       /* matching descriptor */
> > > -       const struct xe_device_desc *desc;
> > > -       /* tentative SR-IOV mode */
> > > -       enum xe_sriov_mode mode;
> > > -};
> > >  
> > >  static const struct xe_config_device device_defaults = {
> > >         .enable_psmi = false,
> > > @@ -322,16 +289,6 @@ static const struct {
> > >         { .name = "media", .type = XE_GT_TYPE_MEDIA },
> > >  };
> > >  
> > > -static struct xe_config_group_device
> > > *to_xe_config_group_device(struct config_item *item)
> > > -{
> > > -       return container_of(to_config_group(item), struct
> > > xe_config_group_device, group);
> > > -}
> > > -
> > > -static struct xe_config_device *to_xe_config_device(struct
> > > config_item *item)
> > > -{
> > > -       return &to_xe_config_group_device(item)->config;
> > > -}
> > > -
> > >  static bool is_bound(struct xe_config_group_device *dev)
> > >  {
> > >         unsigned int domain, bus, slot, function;
> > > @@ -359,7 +316,7 @@ static bool is_bound(struct
> > > xe_config_group_device *dev)
> > >  
> > >  static ssize_t enable_survivability_mode_show(struct config_item
> > > *item, char *page)
> > >  {
> > > -       struct xe_config_device *dev = to_xe_config_device(item);
> > > +       struct xe_config_device *dev = xe_configfs_to_device(item);
> > >  
> > >         return sprintf(page, "%d\n", dev-
> > > >enable_survivability_mode);
> > >  }
> > > @@ -367,7 +324,7 @@ static ssize_t
> > > enable_survivability_mode_show(struct config_item *item, char *pa
> > >  static ssize_t enable_survivability_mode_store(struct config_item
> > > *item, const char *page,
> > >                                                size_t len)
> > >  {
> > > -       struct xe_config_group_device *dev =
> > > to_xe_config_group_device(item);
> > > +       struct xe_config_group_device *dev =
> > > xe_configfs_to_group_device(item);
> > >         bool enable_survivability_mode;
> > >         int ret;
> > >  
> > > @@ -386,7 +343,7 @@ static ssize_t
> > > enable_survivability_mode_store(struct config_item *item, const c
> > >  
> > >  static ssize_t gt_types_allowed_show(struct config_item *item,
> > > char *page)
> > >  {
> > > -       struct xe_config_device *dev = to_xe_config_device(item);
> > > +       struct xe_config_device *dev = xe_configfs_to_device(item);
> > >         char *p = page;
> > >  
> > >         for (size_t i = 0; i < ARRAY_SIZE(gt_types); i++)
> > > @@ -399,7 +356,7 @@ static ssize_t gt_types_allowed_show(struct
> > > config_item *item, char *page)
> > >  static ssize_t gt_types_allowed_store(struct config_item *item,
> > > const char *page,
> > >                                       size_t len)
> > >  {
> > > -       struct xe_config_group_device *dev =
> > > to_xe_config_group_device(item);
> > > +       struct xe_config_group_device *dev =
> > > xe_configfs_to_group_device(item);
> > >         char *buf __free(kfree) = kstrdup(page, GFP_KERNEL);
> > >         char *p = buf;
> > >         u64 typemask = 0;
> > > @@ -437,7 +394,7 @@ static ssize_t gt_types_allowed_store(struct
> > > config_item *item, const char *page
> > >  
> > >  static ssize_t engines_allowed_show(struct config_item *item, char
> > > *page)
> > >  {
> > > -       struct xe_config_device *dev = to_xe_config_device(item);
> > > +       struct xe_config_device *dev = xe_configfs_to_device(item);
> > >         char *p = page;
> > >  
> > >         for (size_t i = 0; i < ARRAY_SIZE(engine_info); i++) {
> > > @@ -529,7 +486,7 @@ static int parse_engine(const char *s, const
> > > char *end_chars, u64 *mask,
> > >  static ssize_t engines_allowed_store(struct config_item *item,
> > > const char *page,
> > >                                      size_t len)
> > >  {
> > > -       struct xe_config_group_device *dev =
> > > to_xe_config_group_device(item);
> > > +       struct xe_config_group_device *dev =
> > > xe_configfs_to_group_device(item);
> > >         ssize_t patternlen, p;
> > >         u64 mask, val = 0;
> > >  
> > > @@ -552,14 +509,14 @@ static ssize_t engines_allowed_store(struct
> > > config_item *item, const char *page,
> > >  
> > >  static ssize_t enable_psmi_show(struct config_item *item, char
> > > *page)
> > >  {
> > > -       struct xe_config_device *dev = to_xe_config_device(item);
> > > +       struct xe_config_device *dev = xe_configfs_to_device(item);
> > >  
> > >         return sprintf(page, "%d\n", dev->enable_psmi);
> > >  }
> > >  
> > >  static ssize_t enable_psmi_store(struct config_item *item, const
> > > char *page, size_t len)
> > >  {
> > > -       struct xe_config_group_device *dev =
> > > to_xe_config_group_device(item);
> > > +       struct xe_config_group_device *dev =
> > > xe_configfs_to_group_device(item);
> > >         bool val;
> > >         int ret;
> > >  
> > > @@ -634,14 +591,14 @@ static ssize_t wa_bb_show(struct
> > > xe_config_group_device *dev,
> > >  
> > >  static ssize_t ctx_restore_mid_bb_show(struct config_item *item,
> > > char *page)
> > >  {
> > > -       struct xe_config_group_device *dev =
> > > to_xe_config_group_device(item);
> > > +       struct xe_config_group_device *dev =
> > > xe_configfs_to_group_device(item);
> > >  
> > >         return wa_bb_show(dev, dev->config.ctx_restore_mid_bb,
> > > page, SZ_4K);
> > >  }
> > >  
> > >  static ssize_t ctx_restore_post_bb_show(struct config_item *item,
> > > char *page)
> > >  {
> > > -       struct xe_config_group_device *dev =
> > > to_xe_config_group_device(item);
> > > +       struct xe_config_group_device *dev =
> > > xe_configfs_to_group_device(item);
> > >  
> > >         return wa_bb_show(dev, dev->config.ctx_restore_post_bb,
> > > page, SZ_4K);
> > >  }
> > > @@ -798,7 +755,7 @@ static ssize_t wa_bb_store(struct wa_bb
> > > wa_bb[static XE_ENGINE_CLASS_MAX],
> > >  static ssize_t ctx_restore_mid_bb_store(struct config_item *item,
> > >                                         const char *data, size_t
> > > sz)
> > >  {
> > > -       struct xe_config_group_device *dev =
> > > to_xe_config_group_device(item);
> > > +       struct xe_config_group_device *dev =
> > > xe_configfs_to_group_device(item);
> > >  
> > >         return wa_bb_store(dev->config.ctx_restore_mid_bb, dev,
> > > data, sz);
> > >  }
> > > @@ -806,7 +763,7 @@ static ssize_t ctx_restore_mid_bb_store(struct
> > > config_item *item,
> > >  static ssize_t ctx_restore_post_bb_store(struct config_item *item,
> > >                                          const char *data, size_t
> > > sz)
> > >  {
> > > -       struct xe_config_group_device *dev =
> > > to_xe_config_group_device(item);
> > > +       struct xe_config_group_device *dev =
> > > xe_configfs_to_group_device(item);
> > >  
> > >         return wa_bb_store(dev->config.ctx_restore_post_bb, dev,
> > > data, sz);
> > >  }
> > > @@ -830,7 +787,7 @@ static struct configfs_attribute
> > > *xe_config_device_attrs[] = {
> > >  
> > >  static void xe_config_device_release(struct config_item *item)
> > >  {
> > > -       struct xe_config_group_device *dev =
> > > to_xe_config_group_device(item);
> > > +       struct xe_config_group_device *dev =
> > > xe_configfs_to_group_device(item);
> > >  
> > >         mutex_destroy(&dev->lock);
> > >  
> > > @@ -846,7 +803,7 @@ static struct configfs_item_operations
> > > xe_config_device_ops = {
> > >  static bool xe_config_device_is_visible(struct config_item *item,
> > >                                         struct configfs_attribute
> > > *attr, int n)
> > >  {
> > > -       struct xe_config_group_device *dev =
> > > to_xe_config_group_device(item);
> > > +       struct xe_config_group_device *dev =
> > > xe_configfs_to_group_device(item);
> > >  
> > >         if (attr == &attr_enable_survivability_mode) {
> > >                 if (!dev->desc->is_dgfx || dev->desc->platform <
> > > XE_BATTLEMAGE)
> > > @@ -869,7 +826,7 @@ static const struct config_item_type
> > > xe_config_device_type = {
> > >  
> > >  static ssize_t sriov_max_vfs_show(struct config_item *item, char
> > > *page)
> > >  {
> > > -       struct xe_config_group_device *dev =
> > > to_xe_config_group_device(item->ci_parent);
> > > +       struct xe_config_group_device *dev =
> > > xe_configfs_to_group_device(item->ci_parent);
> > >  
> > >         guard(mutex)(&dev->lock);
> > >  
> > > @@ -881,7 +838,7 @@ static ssize_t sriov_max_vfs_show(struct
> > > config_item *item, char *page)
> > >  
> > >  static ssize_t sriov_max_vfs_store(struct config_item *item, const
> > > char *page, size_t len)
> > >  {
> > > -       struct xe_config_group_device *dev =
> > > to_xe_config_group_device(item->ci_parent);
> > > +       struct xe_config_group_device *dev =
> > > xe_configfs_to_group_device(item->ci_parent);
> > >         unsigned int max_vfs;
> > >         int ret;
> > >  
> > > @@ -903,7 +860,7 @@ static ssize_t sriov_max_vfs_store(struct
> > > config_item *item, const char *page, s
> > >  
> > >  static ssize_t sriov_admin_only_pf_show(struct config_item *item,
> > > char *page)
> > >  {
> > > -       struct xe_config_group_device *dev =
> > > to_xe_config_group_device(item->ci_parent);
> > > +       struct xe_config_group_device *dev =
> > > xe_configfs_to_group_device(item->ci_parent);
> > >  
> > >         guard(mutex)(&dev->lock);
> > >  
> > > @@ -912,7 +869,7 @@ static ssize_t sriov_admin_only_pf_show(struct
> > > config_item *item, char *page)
> > >  
> > >  static ssize_t sriov_admin_only_pf_store(struct config_item *item,
> > > const char *page, size_t len)
> > >  {
> > > -       struct xe_config_group_device *dev =
> > > to_xe_config_group_device(item->ci_parent);
> > > +       struct xe_config_group_device *dev =
> > > xe_configfs_to_group_device(item->ci_parent);
> > >         bool admin_only_pf;
> > >         int ret;
> > >  
> > > @@ -941,7 +898,7 @@ static struct configfs_attribute
> > > *xe_config_sriov_attrs[] = {
> > >  static bool xe_config_sriov_is_visible(struct config_item *item,
> > >                                        struct configfs_attribute
> > > *attr, int n)
> > >  {
> > > -       struct xe_config_group_device *dev =
> > > to_xe_config_group_device(item->ci_parent);
> > > +       struct xe_config_group_device *dev =
> > > xe_configfs_to_group_device(item->ci_parent);
> > >  
> > >         if (attr == &sriov_attr_max_vfs && dev->mode !=
> > > XE_SRIOV_MODE_PF)
> > >                 return false;
> > > @@ -1084,7 +1041,7 @@ static struct xe_config_group_device
> > > *find_xe_config_group_device(struct pci_dev
> > >         if (!item)
> > >                 return NULL;
> > >  
> > > -       return to_xe_config_group_device(item);
> > > +       return xe_configfs_to_group_device(item);
> > >  }
> > >  
> > >  static void dump_custom_dev_config(struct pci_dev *pdev,
> > > diff --git a/drivers/gpu/drm/xe/xe_configfs_types.h
> > > b/drivers/gpu/drm/xe/xe_configfs_types.h
> > > new file mode 100644
> > > index 000000000000..935097aafa96
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/xe/xe_configfs_types.h
> > > @@ -0,0 +1,59 @@
> > > +/* SPDX-License-Identifier: MIT */
> > > +/*
> > > + * Copyright © 2026 Intel Corporation
> > > + */
> > > +#ifndef _XE_CONFIGFS_TYPES_H_
> > > +#define _XE_CONFIGFS_TYPES_H_
> > > +
> > > +#include <linux/configfs.h>
> > > +#include <linux/mutex.h>
> > > +#include <linux/types.h>
> > > +
> > > +#include "xe_hw_engine_types.h"
> > > +#include "xe_pci_types.h"
> > > +#include "xe_sriov_types.h"
> > > +
> > > +struct config_item;
> > > +
> > > +/* Similar to struct xe_bb, but not tied to HW (yet) */
> > > +struct wa_bb {
> > > +       u32 *cs;
> > > +       u32 len; /* in dwords */
> > > +};
> > > +
> > > +struct xe_config_group_device {
> > > +       struct config_group group;
> > > +       struct config_group sriov;
> > > +
> > > +       struct xe_config_device {
> > > +               struct wa_bb
> > > ctx_restore_mid_bb[XE_ENGINE_CLASS_MAX];
> > > +               struct wa_bb
> > > ctx_restore_post_bb[XE_ENGINE_CLASS_MAX];
> > > +               bool enable_psmi;
> > > +               bool enable_survivability_mode;
> > > +               u64 engines_allowed;
> > > +               u64 gt_types_allowed;
> > > +               struct {
> > > +                       bool admin_only_pf;
> > > +                       unsigned int max_vfs;
> > > +               } sriov;
> > > +       } config;
> > > +
> > > +       /* protects attributes */
> > > +       struct mutex lock;
> > > +       /* matching descriptor */
> > > +       const struct xe_device_desc *desc;
> > > +       /* tentative SR-IOV mode */
> > > +       enum xe_sriov_mode mode;
> > > +};
> > > +
> > > +static inline struct xe_config_group_device
> > > *xe_configfs_to_group_device(struct config_item *item)
> > > +{
> > > +       return container_of(to_config_group(item), struct
> > > xe_config_group_device, group);
> > > +}
> > > +
> > > +static inline struct xe_config_device
> > > *xe_configfs_to_device(struct config_item *item)
> > > +{
> > > +       return &xe_configfs_to_group_device(item)->config;
> > > +}
> > > +
> > > +#endif /* _XE_CONFIGFS_TYPES_H_ */
> > 
> 
