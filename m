Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC31ED149F7
	for <intel-xe@archiver.kernel.org>; Fri, 25 Oct 2024 23:31:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB9ED10EBA5;
	Fri, 25 Oct 2024 23:31:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G1UaPKd0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7289210EBA5
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Oct 2024 23:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729899082; x=1761435082;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=02j5xDuYM6WBXtHwcq4jH83C3pD4KZXAue+zF/qPzJQ=;
 b=G1UaPKd0TawFQHgI5c0vjOJcySvVOM1JtRg/utiUtG4HTiCDOv7akkOY
 0KprCAqdSBlnlje7G15CV4IAonHx3lDMZamBiWCC/jKyq8PeQC97C5fhI
 jrCEcE2na1yOi3+D4Xkdqu1Auh27+rAKPNvqF2PNqhUAkeZlEdv/3SUGh
 FYvBffzS8vnx8kedGxOUYt1y8hI9j/BDtBCwC80nXXsBD1K26Brq4pWmB
 xHWoCxhziMu1I5m74xk5pfFNp8zfL/VlX12+AUaVOr2+WuXet/uVbGM3C
 jcopVgt+t1JXmdvoVInAOXzGZRPsojMjKd6DFMkK/xONInoosMvYePsb5 w==;
X-CSE-ConnectionGUID: CkdxK/F3RbWkc1xPkP/ymQ==
X-CSE-MsgGUID: kTCKfLb1TlmDmrV237Lqbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29710724"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="29710724"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2024 16:31:22 -0700
X-CSE-ConnectionGUID: 4zgVB7FgTlyVjhyiG1oGlQ==
X-CSE-MsgGUID: yL8xsZMHQv+W30PBIgLByQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="85833268"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Oct 2024 16:31:22 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 25 Oct 2024 16:31:21 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 25 Oct 2024 16:31:21 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 25 Oct 2024 16:31:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nscQx0yAJa0IWqYW9HyefoaRntWvwi6ed6kgMdICitx/LVDrpw4mIvLalAZtDuPxeBCzLg3PTZ2cBhRikAEs1Jxlnjq+zgoV/hJMXkK/yHzoVdUUIVRzvfGokzqc7p6CWplXxiAN4JPQCx/02OGdPrJtVyYneEjx3WUujkqPNLcjaThMEpFiOlrjMQulbn9Z9sOoR9KHRB2lfaFc3K5Jy3GKK0RJxd+Mwr778cmnj1dpfVqzkjpTvRRJEgEKN4XEAk7EOuAstgJY9GzzUGDlvJYOpE9ztzrvCq6ryHJU8ZL1DBlfvGARv+i4EyP9oCTQgc9y0gcruISqDbz5donVwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fOR0EFXsKw42XUADsGV848/tjwsV7mqdW9evaU+RBrM=;
 b=WLJMtiVilaY9bSJXADPC7PVkWqyvTSbL8I2Ill8lON+e3oe8/HYEpZ5jVXYP6I69NpQ/fPDq7bqCZ1iDHaV14EBjj48P+/wqxb1rdzL4e42XwAF2QngzzspeD9bGuZpziwU3QcK0ocmHuaJYYfoJ6Z9w6rpyhMJDO4c9N+YNLHk9Q4HxBUjvxpQAPhL+uPFA2lE8nVW1yndZ2QBn9cp48n9AqWm1TrNs7/YoOYoAwvF8y+1KpUEEOE0fg9yQz7ztZQUsKGz/RppaLdxtqTCSNysjjEMeimbxW1aRcfbqY61BWcuHubxdbxsTsLThTiBmDKz+2Io1vYla4fBuvVziQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by LV8PR11MB8722.namprd11.prod.outlook.com (2603:10b6:408:207::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.20; Fri, 25 Oct
 2024 23:31:13 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.8093.018; Fri, 25 Oct 2024
 23:31:13 +0000
Date: Fri, 25 Oct 2024 16:31:09 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: Raag Jadav <raag.jadav@intel.com>, <John.C.Harrison@intel.com>,
 <rodrigo.vivi@intel.com>, <andi.shyti@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <riana.tauro@intel.com>, Sujaritha Sundaresan
 <sujaritha.sundaresan@intel.com>
Subject: Re: [PATCH v1] drm/xe: Rework throttle ABI
Message-ID: <20241025233109.GW5725@mdroper-desk1.amr.corp.intel.com>
References: <20241025092238.167042-1-raag.jadav@intel.com>
 <20241025170341.GQ5725@mdroper-desk1.amr.corp.intel.com>
 <Zxvrri2LSkodxC-g@black.fi.intel.com>
 <20241025204534.GS5725@mdroper-desk1.amr.corp.intel.com>
 <xzllrcfttsfafxxgdn7ov6rmckhlwj43i6phbnabxnjbj474mo@ml43i733c5bn>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <xzllrcfttsfafxxgdn7ov6rmckhlwj43i6phbnabxnjbj474mo@ml43i733c5bn>
X-ClientProxiedBy: SJ0PR03CA0091.namprd03.prod.outlook.com
 (2603:10b6:a03:333::6) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|LV8PR11MB8722:EE_
X-MS-Office365-Filtering-Correlation-Id: b94c422c-b653-4176-0fae-08dcf54d1d02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?OxRiL+R/MdfC1+KqEATDsk6SfkG+MyRuXhFyzcN5RN6VCT5uIIk4mnOToyAL?=
 =?us-ascii?Q?+9nRJ7M31Lt/oj9vJ7eaRtS76kHGybEz6gw3rEiKM8RkqD8PRyDzHNm9KDne?=
 =?us-ascii?Q?ZA+Shoma8wnFb/jaEZkUbVwqNd1GCf7YPfobzD04SCaAWcWPhfJEAzLbU11k?=
 =?us-ascii?Q?PiLsGYATxUGGiTUZ2MC1FhpP06qrDSNp5dqxauyU/2fV7UdaowIlCkVQ4sjJ?=
 =?us-ascii?Q?v/QEBR5d76nUvPxxsmh9sn1x9TU/3Ojw3gedWn+0chjYXwDfGQ9cT/VRhPIO?=
 =?us-ascii?Q?YyW9gRh7hwhCNp4gbZw6sdF8QSu/qEEVe2VFqX9f9kg+lBIZra5bTjK+nWXL?=
 =?us-ascii?Q?x1GRcbEuXrM+3xX2CNAPDKDkZVeLd6rfUDef+kPDqzN2llOGF37bIQVExKX0?=
 =?us-ascii?Q?W0bMV7LyIRtK18nEYIQlyoPtJ/HlQaLcq7M9YMsU6FGGK9Zmgeh2dnJuNYDU?=
 =?us-ascii?Q?brciH1NKBHmxwax7xLco8vAG/2qHsTf9flaqqO752xgFBk5dyV7KJ3dTeIQJ?=
 =?us-ascii?Q?IWw69Wmyp/+0E3sXqRjmmJf/Wej8sWbLhNZMI77v4SOLdBHfTMC5mV5uQdn3?=
 =?us-ascii?Q?+NYnJXzcfiydT5PcOf3J6QJh9bPNWhe77opLG13fpYQI3r7XmTts6FCoYktM?=
 =?us-ascii?Q?rKSSL5UAnmNGOQNxDMLC+GEdgic2WdsI7kSRFqvFAuN2gYMNH4u3W02fzIv3?=
 =?us-ascii?Q?CJGio3Kmw4WOzcetH71gRFPjImmhjiSu7u+XDTu4JhiheSd0C/WBftnXmgSS?=
 =?us-ascii?Q?YaCHvpM0Q4iazN3oXVQbhpWKNAn2L2JQD3EM69y/iUwNK9EOKgT4ESEA2dyw?=
 =?us-ascii?Q?n3x3zxBAU8UW+iuG4btT/jFxuENidtH91kCgTBBN3qs8x/ObD2VkS3jGO+pg?=
 =?us-ascii?Q?7h4cC7vSezSm6mQdY/yVbclaHK8j+f35aPU1WPXGJIpmOBaoO82c75VF2xR6?=
 =?us-ascii?Q?s7b0WYEKnnaxskylzLabS4/A/0huRayTDBW8V2umOvKTGbWq0P2eycBh2juZ?=
 =?us-ascii?Q?wx/5OqMEK35wTvQvdd5g9JHwtpoafNo6JZqxEuTFE5D2pqOM8IsbjF898BXE?=
 =?us-ascii?Q?uGLDFuXMLhlx7FEu7VUq2h8M+LGIbYsMYI3BYyZX8g0JW2RFj4gOH26YOAql?=
 =?us-ascii?Q?YbwWWxGYXJJ9e2X7kxwmxcCY7eaDv49aqJEkmXeXbLAc0OVOoSJlh5KmtM7o?=
 =?us-ascii?Q?jmBGvCHG9Bz1xWCVLEpwfRXH0JZDLfRD1PBZ9awh3jyn4cpY4Sw0UFfFcHPY?=
 =?us-ascii?Q?va77H2svjmpnHJnuRepg90/SMxVjo5juHXlu0VRW7A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FLSofYpDhXK90UXund3QSHY8CtKcxdsNiejvdBZuac/XVVJ4yZLDKKKf1BjU?=
 =?us-ascii?Q?9GJ21cMkdxsnSjoQBSUc8s9WjKV+NG2gmRtrpQ2nRZO04XvH87unHrWY47an?=
 =?us-ascii?Q?hh/TmJM858PtCHQRGN7TdWtF1An7tGXo0b15XLYMtqcknH5HRCtsVIaMg1Mh?=
 =?us-ascii?Q?T/7Ep+XREQ5oDrdo1QUFAFL8+XOjUYPJTpm923naIZ0ul/lyv0N5CnJWgwp3?=
 =?us-ascii?Q?qrfslRK3KLnMNafd+74UFE/agA9EeM9ao0uITIcUcg5YiBRgOBCVBkhl+GRu?=
 =?us-ascii?Q?ga5cQiTs7Ex1nmBSI/gNF2yy3qCTFLGNDvrQT3gTwByBGMb2V5MvVFRTymGO?=
 =?us-ascii?Q?xOO1T2U0foqCQPpnYqtFeA20WYglfu3qGWq+6Pg2SJZxGUKvvuETJPlf91V3?=
 =?us-ascii?Q?EDwNLc6TaNO18ZKj5aCr/9Ekvs7sF9/4F26hHqqK+f2FK++xoFFc5j0+cGFR?=
 =?us-ascii?Q?luSvAVh2CRaRuxJ2uWw+EBpijRHrXwhROaXgWxy3XLK76wcLLg0i0dNgb9cz?=
 =?us-ascii?Q?TYuZT2KqLbV8P762iZHG1fZEtHHm2Vjxzptx/W1mlq6eJgmmgwmf6GXENVR9?=
 =?us-ascii?Q?f6qnQez2gi5Fn0MoMWP6qGFqRj9ts5hODDhWDY2RuooO9OlNyDfnPrwyF3mV?=
 =?us-ascii?Q?WDeW3Bz4Q9H9Y/5k/9B08wiy15x4dNy1mtz5FO5wmOTEKJFMLaqjb3cjpmMs?=
 =?us-ascii?Q?y6u1QqAmemsyp4/myJHnEO4ngtbexD2DeYrnzchi9VZDVLn9WbbyzJkKSEKy?=
 =?us-ascii?Q?VURrUldpm+i9GF+SovRGWc/pAV2MUofhzQ031obFlpGeJwby1UfGlVlm0Cih?=
 =?us-ascii?Q?Mrq71vPBclKQiCzFEGutzD6d38J29OEm15b0B8VvwoLDRojhCIfglOlP9VUB?=
 =?us-ascii?Q?RmDSx/rpjMqYIljuv1xyKeL+nCR4STvaMfnH8CetkyGwZZfWnVqy8FatD/B5?=
 =?us-ascii?Q?iugU4v3E2uoBmyjJWx58n5RYH8f8Y4B+7dhcYFCix1D1sfvzC/wvDQAcVqCc?=
 =?us-ascii?Q?qnNf6+POtdG9l0Jo/5PTbRoMVtos3pnbG+QKQdv4NL1YLIf0djVeBKSp38Ub?=
 =?us-ascii?Q?GNEuvQBJdGpPrf+krYfjvRPLD7i22/iGUapvhs7ov3UNZWx935fl/9NwjDtf?=
 =?us-ascii?Q?xe5ZblA6QJR7GTxShHbqEdn9rs4oW5inVzAr2HvG/ujNciw2IUoMYU2+D8Hj?=
 =?us-ascii?Q?P0puNaqzuWgc4uMXtZ/2GPqLlCbiEt9p4nAB4FEx3g6A1ZjivTV5rTeQcmfW?=
 =?us-ascii?Q?9nWcz/NP0rsJVkz0CQRmqAA68BWo+UsV3D615Mb+XbAbK2/a4gq0+ABZk745?=
 =?us-ascii?Q?u6amoU1zxmPqj4g/nYx//7ucP0HLizp/gF0w45Zp1TV4WYPVzHVwHnt6h+lf?=
 =?us-ascii?Q?j6BHvDVf9GSxdquAjReme6RoscoEOahlHx+2ECc8kvVP677qC1bKzZEcd+6f?=
 =?us-ascii?Q?GhYyJKQFCG1SbGfPXEG1ET98lNxmel39YMKWr7rCHmyJfawWFfE/wOIh/yBx?=
 =?us-ascii?Q?bx99QASAOOdqWwIDmVRh2S7fuRXD9SM9P3iEbMc3iLvs6S/TYiuSEmOBQSUa?=
 =?us-ascii?Q?Nz9PGcgs7piMpsWdpy9Xl82v9RCmOtos0gEa4XpEvj5zHGsuWyVOHDnKhtBb?=
 =?us-ascii?Q?Cg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b94c422c-b653-4176-0fae-08dcf54d1d02
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2024 23:31:12.8961 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9/+AheK5VksR/mkwQUhboDqTVLN8sHNr5fJbH/qLqqLwONwy4Mp1tTepfxxjXg0bCbCaLwNLOIHS3QEHEIP/v8TJpFgBMyAh0LxcY3cjlqw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8722
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

On Fri, Oct 25, 2024 at 06:07:40PM -0500, Lucas De Marchi wrote:
> +Sujaritha
> 
> Rodrigo was already Cc'ed, but please take a look below.
> 
> On Fri, Oct 25, 2024 at 01:45:34PM -0700, Matt Roper wrote:
> > On Fri, Oct 25, 2024 at 10:04:14PM +0300, Raag Jadav wrote:
> > > On Fri, Oct 25, 2024 at 10:03:41AM -0700, Matt Roper wrote:
> > > > On Fri, Oct 25, 2024 at 02:52:38PM +0530, Raag Jadav wrote:
> > > > > Current implementation adds multiple sysfs entries for getting GT
> > > > > throttle status and its reasons, which forces the user to read multiple
> > > > > entries for evaluating the result. Since output of each entry is based
> > > > > on the same underlying hardware register and considering the access type
> > > > > of this register is RO/v, the value of this register can change at any
> > > > > given point, even between subsequent sysfs reads. This makes current
> > > > > implementation fundamentally flawed which can produce inconsistent results.
> > > > >
> > > > > Rework throttle ABI and introduce throttle_status attribute which will
> > > > > provide throttle status through a oneshot register read, making it
> > > > > relatively less error prone. The new ABI will provide throttle reasons
> > > > > in a string based list based on the respective bits which are set in the
> > > > > hardware. Empty output means no bits are set and hence no throttling.
> > > >
> > > > But the old ABI is already released, and we have platforms with
> > > > force_probe lifted already.  Presumably userspace software is already
> > > > using the existing interface (otherwise it never would have been allowed
> > > > to land upstream), so that means we can't change it in incompatible ways
> > > > anymore; we're locked into supporting the current interface forever on
> > > > these platforms.
> > > >
> > > > We can change the ABI for _future_ platforms if it makes sense, but it's
> > > > too late to make compatibility-breaking changes for LNL and BMG.
> > > 
> > > It landed upstream pretty recently AFAICT, atleast in xe.
> > 
> > It landed upstream about 10 months ago:
> > 
> >        commit 1c8e9019033728093c04608f44c6e87fec6822e1
> >        Author:     Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
> >        AuthorDate: Fri Dec 8 00:11:52 2023 -0500
> >        Commit:     Rodrigo Vivi <rodrigo.vivi@intel.com>
> >        CommitDate: Thu Dec 21 11:45:28 2023 -0500
> > 
> >            drm/xe: Add frequency throttle reasons sysfs attributes
> > 
> > and has been part of the 6.8 kernel onward.  So this isn't a case where
> > something just recently landed in drm-tip and hasn't made its way into a
> > formal kernel.org release yet.
> > 
> > > So maybe worth reconsidering.
> > 
> > It's not really a decision that we get to make.  One of the absolute
> > rules of Linux kernel development is that we cannot break
> > kernel<->userspace ABI that's being used.  A user must always be able to
> > safely upgrade their kernel without updating any other software on the
> > system without suffering breakage/regressions (with slight exceptions
> > for special security-related cases).  In this case, if you remove the
> > existing sysfs APIs and try to replace them with something different,
> > then it will immediately break existing tools that were using the old
> > interface.  That's simply not allowed by Linux kernel rules.
> > 
> > > 
> > > > >
> > > > > $ cat /sys/devices/.../tile0/gt0/freq0/throttle_status
> > > > > prochot
> > > > > thermal
> > > > > ratl
> > > > > thermalert
> > > > > tdc
> > > > > pl4
> > > > > pl1
> > > > > pl2
> > > > >
> > > > > Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2810
> > > >
> > > > I'm not sure what this ticket is about, but it was already closed
> > > > several weeks ago due to no longer reproducing.
> > > 
> > > I'm sure we all have our "it works on my machine" moment :D
> > 
> > The point is that we can't point at a non-active issue as justification
> > here.  If the failure reported in that issue is still relevant, the
> > ticket should be re-opened and a proper analysis should be posted there.
> > But changing the ABI like this wouldn't help anyway since it would just
> > guarantee that the test breaks (because none of the interfaces it tries
> > to check would exist anymore).  This patch wouldn't actually fix or
> > close that ticket.
> > 
> > Besides, the failure in that ticket likely isn't a KMD issue at all,
> > just a bug in the test.  By design, these sysfs interfaces represent the
> > "right now" status of the hardware.  If you read several sysfs entries
> > then the status could change as that's happening.  It's just a flaw in
> > the test that it overlooked this and incorrectly assumed the status
> > would never change while the test is running.
> > 
> > > 
> > > > The ABI change here doesn't seem to be directly related to this ticket.
> > > 
> > > We can always create new tickets, and that's not the point.
> > > The point is we're stuck with unreliable ABI.
> > 
> > Unreliable how?  We don't let new userspace interfaces into the kernel
> > unless there's real (not IGT) userspace software lined up to use them,
> > and the userspace developers have already signed off on the design and
> > semantics of the interfaces.  Presumably the current users are happy
> > with the current semantics and understand that the status provided is
> > live rather than sticky.
> 
> I was looking at that commit and noticed that it actually doesn't point
> to any real userspace user though. Ugh. Kernel doesn't break userspace
> interface. That's true, but it's not the same as "the ABI never
> changes". It's always risky and a decision not taken lightly because
> there's a *potential* for breakage.  However you are not breaking
> userspace if the usersapce doesn't exist.  It seems the uapi was mainly
> a copy & paste from i915.
> 
> So, a couple questions here:
> 
> 1) are there userspace tools consuming this UAPI?

If it turns out that there's nothing actually using this uapi today (and
we can come up with solid evidence for that fact), then the proper
action would probably be to directly revert the existing uapi without
replacement.  Then down the road if/when a real userspace consumer shows
up we can re-add the API (possibly with changes if necessary), following
all the regular rules.

BTW it's a lot harder to guarantee "nothing is using this" today than it
used to be back in the days when all KMD communication typically
funneled through a small number of specific projects like Xorg, mesa,
and libva.  We can figure out if those well-known projects are using an
interface pretty easily, and to some extent we can google through
hosting sites like github looking for lesser-known projects that might
be using an interface, but there's always the chance that
KMD<->userspace interfaces are being used inside proprietary and/or
home-grown, organization-internal tools.  We have requirements for
having an open source consumer to upstream new interfaces, but that rule
doesn't mean that we're allowed to introduce ABI breakage for
non-opensource software.


Matt

> 
> Rodrigo, I've heard you were integrating it in a top-like app. Would
> that be the first user? grepping around I couldn't find anything
> actually using these sysfs files with xe. The only references I found
> were in
> 
> a) https://github.com/intel/compute-runtime
> 
> but that is not in the interface with xe AFAICS... it's in the
> os_frequency_imp_prelim.cpp
> 
> b) https://github.com/geopm/geopm
> 
> not very familiar with that, but it's possible it's actually used,
> although I don't know if it's just an i915 interface or not.
> 
> 
> 2) Unreliable how?  Just as Matt asked, if it's unreliable you need to
> provide a proper justification for it. From the commit message:
> 
> 	Current implementation adds multiple sysfs entries for getting GT
> 	throttle status and its reasons, which forces the user to read multiple
> 	entries for evaluating the result. Since output of each entry is based
> 	on the same underlying hardware register and considering the access type
> 	of this register is RO/v, the value of this register can change at any
> 	given point, even between subsequent sysfs reads. This makes current
> 	implementation fundamentally flawed which can produce inconsistent results.
> 
> so what? the error would be in the user thinking that he could read
> multiple sysfs files atomically. What if user is interested in just 1
> of them?
> 
> It seems like adding a new file that guarantees this atomicity, is
> documented as such and *points to an actual userspace consumer*
> would be much better, with no potential for breakage. If then we find
> out there are no users of the old interface, we may think about
> deprecating/removing it.
> 
> Lucas De Marchi
> 
> > 
> > Sometimes we realize down the road that we did overlook something
> > important in an interface.  It's unfortunate when that happens, but the
> > path forward then is that we create a new, alternate API on the side and
> > let existing userspace migrate over or not as it sees fit (e.g., stuff
> > like the DRM "addfb2" ioctl being added as a more expressive alternative
> > to "addfb" usage).  We still need to support the old interface though;
> > we can generally only sunset it for future platforms where there's no
> > pre-existing software already using the old interface.
> > 
> > 
> > Matt
> > 
> > > 
> > > Side note: The logs in the ticket may help connect the dots with commit message.
> > > 
> > > Raag
> > 
> > -- 
> > Matt Roper
> > Graphics Software Engineer
> > Linux GPU Platform Enablement
> > Intel Corporation

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
