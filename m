Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CCE9D711D2
	for <intel-xe@archiver.kernel.org>; Fri, 19 Dec 2025 01:15:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42C0410EC45;
	Fri, 19 Dec 2025 01:15:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ON3LMBPZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8781D10EC40
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Dec 2025 01:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766106947; x=1797642947;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=PalqvPZo8UUKZoIhpH2YFw7JfPvBK9gZJwveQE5yNXM=;
 b=ON3LMBPZSJ+KH0oXxRTPRq+FHpdY3g52qWFmTgNgngmAHT7CHSEhfIR+
 LvxTNjPpTkHgwA/tGN0JgrgllAdxEkKJXIHtKwt4WTjE4AvJdUsxwUsJF
 VI9Fo53KDkWQ8SxWU6fO8IjsciWMpF1EUw9gDHuvR445fdL4KxoD05/S0
 ddnwNJLVqHDq5NOpc0DedGhh2iuD1OYpO4CSqTaYu4cvT9/kU1nmq+0Wa
 h2+NwdGVt54YHCpGScXGyFOwzefExMhUPBDG2wHzYJIeCzBqUY6Rr6k/F
 aKXcVi68Fc1BCSY39e6PzxUwlaPOqNsHNIlOF278RX0XcPGwE4fixB9Wp A==;
X-CSE-ConnectionGUID: ap0C3F3ATQ+xNgR7It8YPw==
X-CSE-MsgGUID: 0CNmly/TSXKuDDjZbbzQ7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="67947135"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="67947135"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 17:15:46 -0800
X-CSE-ConnectionGUID: C6589FCMQCiDGqdEUrJi3g==
X-CSE-MsgGUID: zkznTKQ1Sn6peqLSI/Vwug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="236152696"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 17:15:46 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 18 Dec 2025 17:15:45 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 18 Dec 2025 17:15:45 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.4) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 18 Dec 2025 17:15:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MgqbxchEyi8lfFa9gXJbdZW1qeuIhhs/K5aiqm9DXNEqWmOqlOWPbZHxdeR4zIVdeH+uNS38OH/ybRZDRcqMjFORuODMxxAb0fZrfXE61/cAQ6JzDpLF8Fpubqh9RFm82AvTQxr8/RWGUsgUhOxiADdnOXkrxaBxuBCi6haCfuvyOL7NJ6ntN8cNBmeg3MSriML2dXW4CSV5DSVPN2fIfWmsDITcGe5dRcOXV2mJG/5Boq0A+33sX96ZJtLgd88P27xr08/rYd7mIr1mmF2JNT/F4W7TuYRfKtXDqvfmkpijdCh6QB/QBoDLMb5Vm27/TbWEXgUHuFudormPRg7RuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VsdaEBhQVxp+FGeV4L3r3lLdm13XSWSEkJeIsbjZ0AM=;
 b=UOGRY+tEGbogngvw3CuKqjHUX6nDZnzf35SlvGd0bkTdwDwXf4/H84lg5uYsrbM3xQhjfK/+DLeRzzE8aH7iZ1JcryENendR5Eqj/Tx21HDIIuT/BLpTWOMTOh9ZDi00Kx14FPfQLGfrAjWSwTrdSV/AJKJ/o4Qew7wdxrdX8/wQXVThKcaZCCrTpyerCSnrIEVJ4+6u75hrZxjxUMv1UfKT8OdNyTIsFbRz2DSmKRgcGMgYEFreRomROYjVd+S588RE5GKzUSKdN8fEA4pbhUtGaTq2s/NCAfj8dR4PSL2McBjSGGZA9VDfP/vmJhEo3amQEQtQE5p6Kz3zcudjkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ2PR11MB8300.namprd11.prod.outlook.com (2603:10b6:a03:548::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Fri, 19 Dec
 2025 01:15:42 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9434.001; Fri, 19 Dec 2025
 01:15:39 +0000
Date: Thu, 18 Dec 2025 17:15:37 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 2/3] drm/xe: Forcefully tear down exec queues in GuC
 submit fini
Message-ID: <aUSnOcL+vYicGrhw@lstrano-desk.jf.intel.com>
References: <20251218214418.4037401-1-matthew.brost@intel.com>
 <20251218214418.4037401-3-matthew.brost@intel.com>
 <b7fef20f35249525239dd287b391045f80d046f6.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b7fef20f35249525239dd287b391045f80d046f6.camel@intel.com>
X-ClientProxiedBy: SJ0PR13CA0195.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::20) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ2PR11MB8300:EE_
X-MS-Office365-Filtering-Correlation-Id: fa43aaef-aba2-4cf5-8ff2-08de3e9c1f64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?547gHbDV/LAI3S1by7CfHip/7YePGqHmi7bizitwzFEsETUtxhwvmkG4wG?=
 =?iso-8859-1?Q?6t7tVnqILtLyIXKjLyKoXDLrHuDxNhyQ+eXyo00UVL5aYtrOcfzl4XhgYb?=
 =?iso-8859-1?Q?qRZRwUcLozsB2w11V1roIwJGdM1pPrUkhp5dp1+mjhYuBvXfkeL1C5zC79?=
 =?iso-8859-1?Q?ZetfXdnDa2IvXAJ8T5Pgkfxql8N7p2GRZ8gWrtO7JjOfZ63V6aIC/4FbhP?=
 =?iso-8859-1?Q?Sx7HfaOv2ACCNC0g0n49Rg82K/M6OnVpx0YwEfoJqL05qezbBjV1mPFxHb?=
 =?iso-8859-1?Q?wDcKmZMvhzc38quJdaW2cvOvxli2GiJSXoUjq4uXbJURKRT/WT9Ke5Imrh?=
 =?iso-8859-1?Q?6IVgYpoQxxUzW57G1n7rtHAmvbRNGyp8BXGc9wdI599WCLh2lW/y0UXw1d?=
 =?iso-8859-1?Q?zWmPL9HyFED9l6RmoElBSLAMJuCt+WsvpKUxVvtPEM2b7oI3vLIdArsAli?=
 =?iso-8859-1?Q?sE43fvh6nFS3pXTP1Mvf7wjaLyg6G9Meph5stY13TbsbF+TC4Mkm5aJfbW?=
 =?iso-8859-1?Q?o3SFoHu1ducohSnsqiF7mgOQAwV22APlDMft2nKnH46/ZEBz+mW94QBLWm?=
 =?iso-8859-1?Q?YfdobM6nm6iO3WI5BhYss5ZJQqK+uxrja/T828tySaE+uTN2lS59ktOt09?=
 =?iso-8859-1?Q?3ntURFxwsY1rOIc+1jAykM88yUR2uVkVj0eZwg2LlaP4E8lCeJBKjUdGIk?=
 =?iso-8859-1?Q?hYZR7yjmTADEmfMyg2sAoudlmyBdSYMUgtBCtykLINljp3w2QvSNNjgkWM?=
 =?iso-8859-1?Q?1r+GGvkjZqzFG4YdPdgZ+QA48QXE1Q2YlCjZOpNsb3zRZ9YWHqQHW5+fdL?=
 =?iso-8859-1?Q?b3CDrNdcNNMJGm4Mow8n1gatwz/TpjFxUoRkMnqfqZ7BC92JN7T5Qam9OZ?=
 =?iso-8859-1?Q?r/s1JNIganyvdBZNyc22lM9omTtcRg9ooxc+aL3dGweku/bs0q0nr8dv7o?=
 =?iso-8859-1?Q?E7toUQFQBXECbfWbJIrCQ37CiVyoQTkeQV797L36MF+QPfNvy46Ipg0bx7?=
 =?iso-8859-1?Q?A7Z4BspsfiAABxeTr4j/8AGijztfVefB288qEPQJHEqSkAUlMPhPx64Dki?=
 =?iso-8859-1?Q?SMsaanPhnOMAd4G8NJN7DEfWLLrSSqZWuiqjzgYnn0vc2mKWqS2w4s3N8O?=
 =?iso-8859-1?Q?NBom+GLolapcCLVHKO5sRWglI1YbJKo4HuBdBT+wS+VDrjfKc0JaROvbLq?=
 =?iso-8859-1?Q?0qzzfxzJ2REEjtkyLe5pK7XAOJhtfi+QJhPqOWnHmNdvafQZig3e2DejDF?=
 =?iso-8859-1?Q?kotIuNPBSpI4jLBAtMnWgzdrC3CTle4r/dsY5D34nMKxC/pdq8oA0YM1oc?=
 =?iso-8859-1?Q?3f6CtkRjoA7+Wq1AtWlQJ1OBXCg9AB4R4H8vvTHHyXyDXBywiJkKvRbuwV?=
 =?iso-8859-1?Q?wSMQ4mgletsxjBVl6NDolZvdTSQf0h0bZOKeMTGwhb9fH16RslnrRB9Tn+?=
 =?iso-8859-1?Q?NIldaqlrkMngk1ZUa8taXDERQnX+BqXB/vKjLhfWFSwSbYAIK+M8reIIdd?=
 =?iso-8859-1?Q?iNHltte3VO+cr972Co5GOx?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?C7YwIXkg00bs9qAc1Zp1N0a+TvwAhS/MYMhynn7p+6cbyECQRB6DJ55dUi?=
 =?iso-8859-1?Q?9tOw4wDCupxcmcTjMA2+wyZjkaNh/ngRmY0GSNq6D7NOrf6y5OtHd7C6WP?=
 =?iso-8859-1?Q?zdfdyfkVk4VesU8sD1K4ZY7qORl81bX9jM3v6VX7ZZpAuD1O/vJsAvb/Xz?=
 =?iso-8859-1?Q?aXPUWJ1g1bRaeERgo7VYa2mNr3p5xc0WoohQiT7y2l3SZ7EE7NMZHCYAHE?=
 =?iso-8859-1?Q?5kT3C2pyTKCwo/fWdX2V+TK8faXo4GB6FqdftLyPa50HoYjKfZXggQxSH0?=
 =?iso-8859-1?Q?BxfUmf9LCkpRmFZGNUvXyVYwesEmrSDXURgR1Fom6PVz+Lx/2+aLeKN5Jh?=
 =?iso-8859-1?Q?g6lAL4hNYOjqgbO4qCtXjb1k76iYP3DbwLRLjZwkFHmZccME5Y1kwIL6dS?=
 =?iso-8859-1?Q?fcUdA+Eey8TrRrBOM4v6wA4rdsMgLxvMPE6m8Nizutcx4X5ZBbVZjW90IO?=
 =?iso-8859-1?Q?uN/5VbtTFRw5IboxqAs1HUrrkTjx/Wj+3uSwHqrg/iorTJV4JTZH0a/Jvj?=
 =?iso-8859-1?Q?HjHUlx1tyqubhBPZFrABvW6DyMKIau/TLRZe5w7OiH67vh+Ra/qvvkMD9z?=
 =?iso-8859-1?Q?3yfDA59+cV78mjo5w8xQdHN/F6xEkq0cvy+nnkwHh++iKYgjHJqlqLA6qo?=
 =?iso-8859-1?Q?Js2ITTdf42UHvEkNMj66sU8NK4BHtbNM2wG6MIxgzURS6VNAH5/9WBf103?=
 =?iso-8859-1?Q?KTRtrAVQ6PXkXKbGeQ/tYvLhwzJBqp55LTPRDc+APEfJG4oqp+/xqTwKdX?=
 =?iso-8859-1?Q?jkgtkwyeeD7mcnyOVRRICTt7ZUXi5uuAk0EKezdnGUB0pa57vH2UwQNDzY?=
 =?iso-8859-1?Q?cOIWmnl8YhUDZ440qI5a4uVodfe5OpsxodKOfJvOFqDnHkuhSrEBMPLLCE?=
 =?iso-8859-1?Q?C1/Mb6P7NiCNKv9aHKQthVVOY7QI8tSw4rBADUZKez+AZCMS9HuorwhbB8?=
 =?iso-8859-1?Q?GB6krEQtOcvD9UaxiOz8G6Qz+G8OHYs4NI86Jgdhy6EVop2hS1ZyYi9J5n?=
 =?iso-8859-1?Q?0Gf4SUfKfMjzrsS3N5i5Q4N68aE4Q7wkwTOO054Je/F8ngKbEiFfIIVSnc?=
 =?iso-8859-1?Q?ndgmegliiEIy0VHJPp0vNEufYsosPl3WEp0XXjXStVglaTiC/lDHTiLDPT?=
 =?iso-8859-1?Q?KCuiESv+r/vceFX01ibltzzYjskxjAwaDMcdkcsbubCEbfPFKadJW8iOIx?=
 =?iso-8859-1?Q?uBBQbSUopAJtusfkn0O1PKsUYjPD8MJGZJ5UUl7viGM/B90Y0CEVq6enlG?=
 =?iso-8859-1?Q?E4tZftcBSP2Bnhcrm14pwFg3xkuahAewDPlPuJUDSTiuYPL4hwGkAbrTbA?=
 =?iso-8859-1?Q?3Z8tY0QHczz2z3hDRV0wnyhtQFUoTT2kx+tT/YErXPkgx13PcFkFnaR1fi?=
 =?iso-8859-1?Q?cS9tShtI9/qA6Zzb9nzmx1K4JF0Jbs4okeB6jdxSscsUjmnMBgbQtFP3W8?=
 =?iso-8859-1?Q?XaERsq/lTBrKm1oqm7MvlZuSI72Ds+pwR+GoMjtBuKtcTmUeR5B/IdtG7U?=
 =?iso-8859-1?Q?ktB39Zs/R32GLdjpT5zBXAFzVi2QxGg0mpw7UvNC7cTmZYQevRZTtYDOlO?=
 =?iso-8859-1?Q?MaMTFCJDcayJcii08Z+RTa3vp8nsxFhymJtYzSInJ9GoH5GIfx+TyHkWtR?=
 =?iso-8859-1?Q?wkLBWGCA5BV867sCv7wT09ktI6hhKdoylVLJlDRmLcqR4hVP1Jd79dGQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fa43aaef-aba2-4cf5-8ff2-08de3e9c1f64
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 01:15:39.7326 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MlQinfxXp59GYyuCO/50rHddZzWK++qksC4is3elQdTSEJwoIEumo/Bdc/czW+3fE2DBS6RzVktiKcPRHxGVWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8300
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

On Thu, Dec 18, 2025 at 04:36:32PM -0700, Summers, Stuart wrote:
> On Thu, 2025-12-18 at 13:44 -0800, Matthew Brost wrote:
> > In GuC submit fini, forcefully tear down any exec queues by disabling
> > CTs, stopping the scheduler (which cleans up lost G2H), killing all
> > remaining queues, and resuming scheduling to allow any remaining
> > cleanup
> > actions to complete and signal any remaining fences.
> > 
> > v2:
> >  - Fix VF failure (CI)
> > 
> > Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel
> > GPUs")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > 
> > ---
> > 
> > This fix will not apply outright to any stable kernel as it depeneds
> > on
> > functions which have added in the KMD since the original commit.
> > Likely
> > will have to manually send out patches to stable for kernel which
> > we'd
> > like to fix.
> > ---
> >  drivers/gpu/drm/xe/xe_guc_submit.c | 27 ++++++++++++++++++++-------
> >  1 file changed, 20 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c
> > b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index 071cbfec2401..58ec94439df1 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -289,6 +289,8 @@ static bool
> > exec_queue_killed_or_banned_or_wedged(struct xe_exec_queue *q)
> >                  EXEC_QUEUE_STATE_BANNED));
> >  }
> >  
> > +static int __xe_guc_submit_reset_prepare(struct xe_guc *guc);
> > +
> >  static void guc_submit_fini(struct drm_device *drm, void *arg)
> >  {
> >         struct xe_guc *guc = arg;
> > @@ -296,6 +298,12 @@ static void guc_submit_fini(struct drm_device
> > *drm, void *arg)
> >         struct xe_gt *gt = guc_to_gt(guc);
> >         int ret;
> >  
> > +       /* Forcefully kill any remaining exec queues */
> > +       xe_guc_ct_stop(&guc->ct);
> > +       __xe_guc_submit_reset_prepare(guc);
> 
> In xe_guc_declare_wedged() we have the opposite sequence -
> reset_prepare and ct_stop after. Can we adjust to the same here? Or is
> there a reason to swap that?
> 

The ordering here doesn't matter. Can swap it here.

Matt

> Thanks,
> Stuart
> 
> > +       xe_guc_submit_stop(guc);
> > +       xe_guc_submit_pause_abort(guc);
> > +
> >         ret = wait_event_timeout(guc->submission_state.fini_wq,
> >                                  xa_empty(&guc-
> > >submission_state.exec_queue_lookup),
> >                                  HZ * 5);
> > @@ -2459,16 +2467,10 @@ static void guc_exec_queue_stop(struct xe_guc
> > *guc, struct xe_exec_queue *q)
> >         }
> >  }
> >  
> > -int xe_guc_submit_reset_prepare(struct xe_guc *guc)
> > +static int __xe_guc_submit_reset_prepare(struct xe_guc *guc)
> >  {
> >         int ret;
> >  
> > -       if (xe_gt_WARN_ON(guc_to_gt(guc), vf_recovery(guc)))
> > -               return 0;
> > -
> > -       if (!guc->submission_state.initialized)
> > -               return 0;
> > -
> >         /*
> >          * Using an atomic here rather than submission_state.lock as
> > this
> >          * function can be called while holding the CT lock (engine
> > reset
> > @@ -2483,6 +2485,17 @@ int xe_guc_submit_reset_prepare(struct xe_guc
> > *guc)
> >         return ret;
> >  }
> >  
> > +int xe_guc_submit_reset_prepare(struct xe_guc *guc)
> > +{
> > +       if (xe_gt_WARN_ON(guc_to_gt(guc), vf_recovery(guc)))
> > +               return 0;
> > +
> > +       if (!guc->submission_state.initialized)
> > +               return 0;
> > +
> > +       return __xe_guc_submit_reset_prepare(guc);
> > +}
> > +
> >  void xe_guc_submit_reset_wait(struct xe_guc *guc)
> >  {
> >         wait_event(guc->ct.wq, xe_device_wedged(guc_to_xe(guc)) ||
> 
