Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09D61C77B75
	for <intel-xe@archiver.kernel.org>; Mon,  8 May 2023 13:35:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6B4E10E2A4;
	Mon,  8 May 2023 13:35:31 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8ED310E2A4
 for <intel-xe@lists.freedesktop.org>; Mon,  8 May 2023 13:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683552930; x=1715088930;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=p73cbfSirVHAkGtYneSia+Lejat5bCpY3afYEqZtiJc=;
 b=AT6u9URVa1urUMhqQLSNlgRXo2wn3O0cR6oiCETCtmZ7jxI6Hr5C7JVO
 If+QuPfc8nBf9UtpKfCdXi4GwOtvXPiEtb/YWEfITVsih5zFfifAkZD8P
 X5iZKhVgTw6cPvnTQt/Qxg/gYomkQdRZUX5gJ3fWmzKjkWBfco16NVWEa
 r9ZbSoJWVapsZ0wYbG+HbLL7R9oKrJGf4BH7apFx9/OB+RbGVVLGF6KmV
 ekUq49uTO0quB9FH/9k8xuk3ZmF1B9GlEFb4qCx3/mLRJ5jYsVQA+NpZD
 ahrQTlS+H/tuHGOoBeB9wtr4EhsiDrFtJxd5+4Vjs4VxkpvslLzvrZVkr Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="349677789"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="349677789"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2023 06:35:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="648876344"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="648876344"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga003.jf.intel.com with ESMTP; 08 May 2023 06:35:25 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 8 May 2023 06:35:25 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 8 May 2023 06:35:24 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 8 May 2023 06:35:24 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 8 May 2023 06:35:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WkxrIYq3Xk+IPToURQ4KrPkexhJIg8u36EgchIh+aMJLtqNTgfktv2va6eEwm+RyrTyzFa9fNaDwyKsib8Z+qLMZoBJ1LlFDY3nLUyd2lDyWUVpg7MPjBp6mkulx1mgdx24S07q8j4GnjY7mz5TNISW4MimQzKQq8sAWy326O0SZEdSh1FDHhoUzOwW98m+YLr3/HXp/cvrqDEv8m2uyoFj0S8NyodbEEu4xFmUKpgTHQXJj7a1YjzKtkARueL80CTIQsYri8paB4EuM5ktTL16WEzK0voNtYXNh24a6Kz60BdI6VXbbPbGP4tKi4bWNdcBiPm+ZSFIKm/xBjjB06Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PtwW1ohl2XR8Ap0ey0fxyF3I7QMnOd+UgSN2K2AIIr4=;
 b=fAT/AyRy5XgfyneoMYwr/4WfDZnYGMsU4WYi8WFfit0c4cSO9MyPNMfAYoVvPYTsx/Gki1VAtFritj7oXar7yUCYpWoKor+YRAJVPzohVC7vm+VgK7H6iq2nFbs8jinog2/xWww9e0pPKSmPToz6yeIGcQxrwQ/BNOcinARjWxwevcpRYBJgWsJ+GFhYUycsGtjI4H5cpbsw9XtUUGdA5axT4o1fCVU7Savqit0R63Yq6L8EsqeQUNFVCkd1ngkoe0yC2Dy46o5oRN8+UB3MGt7yTgQkJtkJrJ9YtS7V3vV/4gzZOhJrRnDmTiXxgfqBEpTozNvgkCubk+YqLFRw7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SN7PR11MB8026.namprd11.prod.outlook.com (2603:10b6:806:2dd::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Mon, 8 May
 2023 13:35:21 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004%6]) with mapi id 15.20.6363.032; Mon, 8 May 2023
 13:35:20 +0000
Date: Mon, 8 May 2023 09:35:16 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Hogander, Jouni" <jouni.hogander@intel.com>
Message-ID: <ZFj6lOUI6J0jv46K@intel.com>
References: <20230505082956.2247875-1-jouni.hogander@intel.com>
 <20230505082956.2247875-5-jouni.hogander@intel.com>
 <ZFUWaYXt4guHj2F/@rdvivi-mobl4>
 <2fd68f32e780c1c1436a45b410dfb4e903bdf0b2.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2fd68f32e780c1c1436a45b410dfb4e903bdf0b2.camel@intel.com>
X-ClientProxiedBy: BY5PR03CA0023.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::33) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SN7PR11MB8026:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b6bffe9-9fe1-4ebf-07e1-08db4fc911a2
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 54wdWmPiP/K87w6DjXxE9RJtE+gkIkINcIN+KRKTIIwN+lNE+1Das7FBLeNiHcu3i62ZaMkfLNZzNuw72X8WMEYedKCI3kerAbaBZPx3+MIDsdmQ+ctXKfEZKodWO4hKCu0+76yEJoj44+bA2urfmzalKDwkrzuuFvTu8Xf30Qxj+zVaAWuK4PKqhEM2Wm2enwOltxnDIHy1sIKOmCHLDIGO8c9CjU9+xoRcr4MJkLuy8qeJ4rKBGdRoQykB7qyslPQKMXWyj5p+6lxssJDu6PsIVlOO9uDUisG2jwDbkqpVzP2h+dMx3H7z9CAuYuGSg6Vr8Qz+ewZ6ngfsUdMlN1MUvZenXPHiQQTRxb+hAWnGr02v6WT4fCV9rxPmlAUDVDAJPv67VgPRXRN2WGlAqgpq19ou34W771rlD2SX/KgHZIj4D14Lb3hRxBjOQ8kvl1J21GcDNudQ2ra6Rb4xYonAz/8gRrJGNHKU0asxF29BHom+YEC9l8A7H6Wdte70u2YOXP/omXR/EE1mZIldvNjXf2ZyBWHb8jLEVkFbcWk/UbAu5wtxkWTqHD2TAHtY
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(39860400002)(396003)(366004)(376002)(136003)(451199021)(66946007)(66556008)(66476007)(6636002)(4326008)(478600001)(6666004)(6486002)(316002)(37006003)(54906003)(36756003)(86362001)(83380400001)(66574015)(26005)(6512007)(6506007)(2616005)(8936002)(5660300002)(8676002)(6862004)(44832011)(41300700001)(2906002)(82960400001)(186003)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?3LDmWSLKWuW9gRseH1A08tY05uS0b5rCGbtBxCmAGcBpQPlD0OOHU+QBVU?=
 =?iso-8859-1?Q?v1g7aGWzlXU5uPgCVUl9vlp2pJjv5p29peZqbnMoVIc9pgKbDaGNfonA0W?=
 =?iso-8859-1?Q?55NTn5kLZO1ill5EijZYalLZPt+fu/jztXknUQgZJvX1sOKF0hj6LaWJtI?=
 =?iso-8859-1?Q?3ZWk9DLd+3kgU2C7WexOfuWDaQtXjsfdBXJJdte87K874Axy0pr21BKybn?=
 =?iso-8859-1?Q?ioiswWrsq1BJyomVU3+C6hVPjnhkTWtubXbUs1YifVmhInc6pWLBFUn7mp?=
 =?iso-8859-1?Q?5iWW9tPQ1c53cWM99VE9f4QGvCZCV44BzU7v4uVKuVZUSfk6kA1oSMgIa3?=
 =?iso-8859-1?Q?eaamBjrEtwq0KuA0mzm1RtmnBM63jHRlWdZmL1zvriTkh7wCf2Oj0Cj36G?=
 =?iso-8859-1?Q?vf5YS+muv+TH6mwf7rNZWhzVitUEa9idpVhIPpbe38GQkX94NppYZS5Sil?=
 =?iso-8859-1?Q?Xy281yhGQwFnuY8aV7uwR/Mg9qYmcleZjC+LdCxHK8R4hmqbBziqalExN7?=
 =?iso-8859-1?Q?rswJeCN7fzjX6XK3pOvxET6mHOak13XaCL71Npa7VHpSQsTSGjNGYwuY8O?=
 =?iso-8859-1?Q?X7GZ+juDwIAx25YcZnPuJHBgz6W7eFxFTP7OMpABXAtBPljXvO6pZfpYXj?=
 =?iso-8859-1?Q?sL2CSJPjmqtYuOqAfj+u5aXSMGlinynZUCX77kjBeRTMPfM6Iw2b6QT2ti?=
 =?iso-8859-1?Q?bJa4Osa6FVDslXTNmo1twFZObsDbKRBEgXe4Rb4YaD6hBfCEAQiyw18QRd?=
 =?iso-8859-1?Q?qz+HjlrqjJ/Sv0F4Nq3str/o6kmNUxKTKf/Y9t6/YF6T+TacI4QgNQ2Pc+?=
 =?iso-8859-1?Q?FsjX2pfhd2oNc9UIvcNj1qR5tGCLRWl/SHTNn1/ZRXj6sZOyT2WsrsPy9U?=
 =?iso-8859-1?Q?7jGiz6hJR04uyuRJeByXMA02VCly/8/6ZXOu7FO+Ruc0hF5wv49JbzfUKD?=
 =?iso-8859-1?Q?cGLfqKDxgde3PN3MlQXNzFESu7XW5pl7Sl1vYncS5MOkv55iezIVOPxJ/3?=
 =?iso-8859-1?Q?njdKXHDelUdvZyS2qTvjL/SR/cioGgJFJEHHXi7QqAeoK0SbwM+1f0EMpd?=
 =?iso-8859-1?Q?Ss19o6IwZW8QitgeybUCbdRYpOHS86F+jchZWd08uvWcPYkGU+g7jSFdYI?=
 =?iso-8859-1?Q?Ov7CIc6lcfKWcovWBY7X+cKHwgA5RzCoL0F69ueT9aCikiDnao0miiK18U?=
 =?iso-8859-1?Q?wV0X/TuhFKqilv6qRi1X0ryczTJjNINDp8abmUkK/F1Oz5fW0IyA4VLA9E?=
 =?iso-8859-1?Q?K5D2YfgFFXY+riOf72jpAU2leZGowjyuJZKo4NFcJn8+vZZuPh8A09VDxl?=
 =?iso-8859-1?Q?OTAEeC3OHRMePeWlabU+RyrR1HfiTrP3KsbsRBC2DXmVVaWHTYCjjhkdAW?=
 =?iso-8859-1?Q?88Hh7aXkn+MVFBGstlE5U1fVgwTg22opfjuZu4S9qh1U2tSvcWd3Pml9/t?=
 =?iso-8859-1?Q?b6IO21HNwXGO8YGBXOXx/tX0Fd1C7xrq96JhFgntumCcEHcx1IQfMS8kpQ?=
 =?iso-8859-1?Q?/5zm0RXmmj5y6/b0i4PGBD1858HxVWF17JPK1eVWVwvMuQ5YrBeki4Kqs8?=
 =?iso-8859-1?Q?ewX41OVEYg2UrAyU+BA7PL9iALzgZ3IRSZp1mEROWFNokSA8Gd+9Kj65rY?=
 =?iso-8859-1?Q?kY0/ficCiB61OyPKa96HGNOEZckB3HcQXP?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b6bffe9-9fe1-4ebf-07e1-08db4fc911a2
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2023 13:35:20.8819 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NP/m6dghIMnMTHaN9P2yLns3GoMEaemmLIisC7VUcSqcZkpDLEFEmYUFoHsOTI9sGcxhoi/30pfktsiwo+Af1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8026
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC PATCH 04/20] fixup! drm/xe/display: Implement
 display support
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
Cc: "rodrigo.vivi@kernel.org" <rodrigo.vivi@kernel.org>, "Nikula,
 Jani" <jani.nikula@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, May 08, 2023 at 09:19:48AM +0000, Hogander, Jouni wrote:
> On Fri, 2023-05-05 at 10:44 -0400, Rodrigo Vivi wrote:
> > 
> > I believe we could already start merging patches 1-4, no?!
> 
> Patches 1-4 alone are currently breaking build. I can fix that. 

That shouldn't ever happen anyway.

Every single patch needs to build and be self-sufficient, otherwise
we break bisects and auto-bisects.

> 
> Generally: in current form GPU frontbuffer rendering + PSR,FBC doesn't
> work with Xe driver in drm-xe-next branch. Additionally it is breaking
> it for i915 as well. If patches 1-4 are applied i915 GPU frontbuffer
> rendering + PSR,FBC is not broken anymore. Drawback is that neither CPU
> or GPU fronbuffer rendering + PSR,FBC is working anymore with Xe
> driver. Subsequent patches are fixing that.
> > 
> > Maarten?
> > 
> > On Fri, May 05, 2023 at 11:29:40AM +0300, Jouni Högander wrote:
> > > Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/display/xe_plane_initial.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/display/xe_plane_initial.c
> > > b/drivers/gpu/drm/xe/display/xe_plane_initial.c
> > > index d0f91f37b6d8..34ae461865a7 100644
> > > --- a/drivers/gpu/drm/xe/display/xe_plane_initial.c
> > > +++ b/drivers/gpu/drm/xe/display/xe_plane_initial.c
> > > @@ -228,7 +228,7 @@ intel_find_initial_plane_obj(struct intel_crtc
> > > *crtc,
> > >         plane_state->uapi.crtc = &crtc->base;
> > >         intel_plane_copy_uapi_to_hw_state(plane_state, plane_state,
> > > crtc);
> > >  
> > > -       atomic_or(plane->frontbuffer_bit,
> > > &to_intel_framebuffer(fb)->bits);
> > > +       atomic_or(plane->frontbuffer_bit,
> > > &to_intel_frontbuffer(fb)->bits);
> > >  
> > >         plane_config->vma = vma;
> > >  
> > > -- 
> > > 2.34.1
> > > 
> 
