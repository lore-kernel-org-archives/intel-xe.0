Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6054C27C4F
	for <intel-xe@archiver.kernel.org>; Fri, 31 May 2024 16:32:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2620610E0E4;
	Fri, 31 May 2024 16:32:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k45jcRxZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 104B210E0E4
 for <intel-xe@lists.freedesktop.org>; Fri, 31 May 2024 16:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717173124; x=1748709124;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=A80m08I0/hmc73n+xeHT9t4+0E/KJNID44dTfH3o/eg=;
 b=k45jcRxZLMGVrgdqSOTVHUndfu64Clg+C4CWAZe6gvgkZrGm+Q8JVdeQ
 1dzOsICMT5txJVlkb/F3y9r5VvymZWily9S8deDRqDnXiWwYKeHU3hHbz
 bO768xqLWPn5CJL3QyNJxCQ7L4+G/gbzeoB3RdvgPlvyplKPX693LAbvh
 TZqx17LnxI9hysQPTN19DG3OG3UcHCoFmyKJrlIbDIAmiLzvjnwGkFPTL
 vUlP6zMrsPsVRan4c9KB5sWE8aQgsJREgjYD6Kpm7ZE9igFj9pFACCdFa
 E5ujNGNZwaafwednJGTxTgzuI5CUpdo+ehsrlPlJRnOM1HnGaT/xLjKtr g==;
X-CSE-ConnectionGUID: po0HLrTjRF+oviIRYh+T7A==
X-CSE-MsgGUID: KbU3lFWvR2C34X1GuebVTg==
X-IronPort-AV: E=McAfee;i="6600,9927,11089"; a="17571505"
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; d="scan'208";a="17571505"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2024 09:31:42 -0700
X-CSE-ConnectionGUID: hrAzxsZKQd2arQmjsl/ROQ==
X-CSE-MsgGUID: og3DY2ibTUi8y7LJh5biLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; d="scan'208";a="67412646"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 May 2024 09:31:43 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 31 May 2024 09:31:42 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 31 May 2024 09:31:41 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 31 May 2024 09:31:41 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 31 May 2024 09:31:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jY8hljwedWqUNxOqEMXg/ZjSpSHEirQ9gZJ36NRwqw2Qr7DtbBLkbNxktZZu+pu/2bzkOmHRilOH/1zb6QHuXZAOjQiruf/B83aAX68Nf9oZ+gOMCvgNk2OlYEqO5v/TgE9PWHERm5ygDJNwqIxGJzcRSPCqGemxn9VUAf/zF8XSR/lhJPiUeF9+P2UJHRnmjaf57SxO3b1dxpczPfRez4k1hQq8wvTZvq6kAcL7M+WQxLlRa2jhPzqNTPVhYyovqC/gJHA6FbK2oOlD96R06bmzcvcyYlXt5TfGV65IXwhBIMuaxjg6a/IRtswom3BQcuSQLOq53iT3Or6VvZtnlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eUbPMUp085wZLa8j3oTF4jDz4VfkaxTyNUOr2ut42o4=;
 b=CXTmf8oaDzQ0ycHySSB2fgxclEqdTkbeg72VU+ka/QPY+2mTkATf/ugEppoyF7hDfQcfD6feY3Joac/nrew3k5fReXqvjFyJGwI2BcG6xPbWQZtxgDdqx7dPlxXfglKj8AZbPz6fcWshSsp9mg3m6tYZukCH4yOnIkGBiCkPA1g33FOh3qzo6DkK0RdCIimQ9EYMof8xNDYOiu9FbnTuhgS/uBwxHK407IbPxQcWkK7/U5DpqxHstLcifGB5mDKBZrPDPyaS8l2vF44kergAiVkwE7ItvRg0VV+sp1bRImPQoYn8Yv1xIxpnjK2ITgd2y6H9unMA905tN2Sp11kfNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM4PR11MB6285.namprd11.prod.outlook.com (2603:10b6:8:a8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.21; Fri, 31 May
 2024 16:31:39 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%4]) with mapi id 15.20.7633.018; Fri, 31 May 2024
 16:31:38 +0000
Date: Fri, 31 May 2024 12:31:34 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Paulo Zanoni <paulo.r.zanoni@intel.com>, 
 Francois Dugast <francois.dugast@intel.com>, Thomas
 =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Fix missing runtime outer protection for
 ggtt_remove_node
Message-ID: <Zln7ZnxjwWjbkABK@intel.com>
References: <20240531160205.206604-1-rodrigo.vivi@intel.com>
 <Zln3o08O5Oz+SwQ3@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zln3o08O5Oz+SwQ3@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: SJ2PR07CA0010.namprd07.prod.outlook.com
 (2603:10b6:a03:505::27) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DM4PR11MB6285:EE_
X-MS-Office365-Filtering-Correlation-Id: cc109c79-79c2-49fb-1527-08dc818f2550
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?k7MvHVb68vPKCZ7TL1Tdj9krz3IGuT/UtQxtAigsGEvfarBdsXRohZ9jBn?=
 =?iso-8859-1?Q?wZpgw3+gg+kwwpMlCXP1QYgexxLyksfRw5ze+Q0sSAE13HyXxZ8Gu4xBdm?=
 =?iso-8859-1?Q?QuVgryvnwSuCK4FdsvG0X4mrDsT3F/Z+nEg23EVJk01kUGYMr2jod3d8KZ?=
 =?iso-8859-1?Q?Ca9dKF8wnE5glyELJC3sb/OlZRU/1cLjCBN39fpcvMWR0zQeEkpbalRyIf?=
 =?iso-8859-1?Q?SQ4YdCCj9MPKG5E34/zDKbLdHissF/nEDxon35NDhaaqfBxcExTfOluHdr?=
 =?iso-8859-1?Q?xud8AC1sVg1PW9m1XeMZXFNHPKOPX6XIcBPaylwbSqxuj1cGBLQmKia3CP?=
 =?iso-8859-1?Q?kxduhv2KD7PtIeJxmkCo0esnCXR3xkzUGgjMrFG07qYvwouwK87SnzvDDg?=
 =?iso-8859-1?Q?bxxHnR+HUZVc7guxO7G6tXWeObJZ+Z+z3ZDFlUIzxQsM1UKBTVjftcnZu6?=
 =?iso-8859-1?Q?k1uK6bfuWqufScsOH7puYccyRsgc2KTm4y70iO1U+8RzStoOffM5GJdNno?=
 =?iso-8859-1?Q?KzxWyLsgyWZAl/cJKE+GPSmucZE7lNep+jo8OuR7DH+i/oBtkMIheokDMd?=
 =?iso-8859-1?Q?VxIGckBmJTXN6nt3RUL78lf2b7JHtKqBCHDmypIVMgFa//iv8lub1t4Zqi?=
 =?iso-8859-1?Q?RAheBXaZLtB1N5cV5DTy2NLI017lwVabEx1WiZU8zDMAPCb8BirZd7XVqy?=
 =?iso-8859-1?Q?X/yFLRLwl8FVYB0vWCYUk+rLMJLKEMTIiNX2KbWK0bcH1CrACw/ks7HoG+?=
 =?iso-8859-1?Q?QuwWB8wAwuKc7osJZJnG2Vo6ksGt2uj9QkYfy6SpYo40EEb5c/mlrg3pwa?=
 =?iso-8859-1?Q?v4irbv+mRCbr/VXQYRieyiADam6ATdUjFJVyMj4FgW0yutae8NXufBiIS2?=
 =?iso-8859-1?Q?Wxk4yXHccheynxT+lrTVxC+AQ1xEEPX1ry20p4s8ZMm+aLobF4kCj5lzmd?=
 =?iso-8859-1?Q?MDLuzqJqjsL9Rzgkf67D/lZzD5JU6N3tCA+aNHI0ZnvxppRrhaYBttUF+2?=
 =?iso-8859-1?Q?1AKwvVzrRsPyj0N3KglDTN7+/1jJj4IVTt0tsa165QY2QfBie37X0ocGKe?=
 =?iso-8859-1?Q?jx9Hk22Lll5rD7q4Rqffq1YXm9Mc+mHpaUaJLGee/vRb42+XglIK3TUVxa?=
 =?iso-8859-1?Q?y0uVAfRPFceMMDmmDGOOdtmntZI6DuDO9xI1W8iOfYrPKbEr+Nc2/MnKRU?=
 =?iso-8859-1?Q?lWoxU7j9ds1Ci50u2IWnkXxG/q/XXoNGvHE58QussSq+DpAIDhIR+qMBB5?=
 =?iso-8859-1?Q?XwgwgYhuAN6t5C//4yqYhMyuBOwFlVN0rhLs7Fcl8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?sRDpuMwTmINOx9kSOYzScUtZQ3NHhJutCdwswwocJINd81r2Rp1yCD9sT9?=
 =?iso-8859-1?Q?LFcI1T9gqhUcRZFRp9Iya9xwUyb0tOIdYAlvOFZVMR/z2BM+cCSFkC2qIj?=
 =?iso-8859-1?Q?p4eWkeYMLeCGr6sFGi3iDaZCAMIUJhWqRrNea+KthWD5MjNpQ+baIj9Rv8?=
 =?iso-8859-1?Q?veP0V7BR2Dr041W1WlyAsOS87VmXB5sFC5YzTLnNKCtZEeDm6EIYc+jshQ?=
 =?iso-8859-1?Q?9wBtDw3WjUU4WXDDxumf3t0U89rnlAmoGS4wdguExEFOV+sV9ISdDvGONy?=
 =?iso-8859-1?Q?x1+I3IYaH4YUhCggNkRvtgaBM+ImdFgXw9Vp3Qfbdxr4+njntEfH1I99sr?=
 =?iso-8859-1?Q?0Q5PBl4221FlWsMINJ4cmy2u1YevwN8Xil8EFFTdbasJuC02J2I10MUJDM?=
 =?iso-8859-1?Q?d5ZtZI6coGo+6Fy1LQRva7e6Nk75Bt0sN+gr/DJUx06mXXXU4ILRjihgkD?=
 =?iso-8859-1?Q?gd9jUp5w6KhKts9VKCQswRMZruDKESObytXxHruISTf+anR2mCcRVLzEFD?=
 =?iso-8859-1?Q?b0MTp7KAABYxgJ5QXrttETaHKDD0RBbtLAeNqYhCmATg3sYbNPA5fzR2qV?=
 =?iso-8859-1?Q?xw+s6FB78lz8/oY3x5+yEVg4TjtA20eqvlVbOrjPxKZ6qu++f120xnTW+H?=
 =?iso-8859-1?Q?su/O4DPX77SqLgXVBDAcrgEuuRmHcAZccR1uHX9KqBYIQuWASGFLuohRnD?=
 =?iso-8859-1?Q?9BDHUGkK1obOdvKyKury4i9+5f4T+OvulfLODLhIwLC1UXNX/FFhUGJT9r?=
 =?iso-8859-1?Q?Im6TVftlJSi12YmBis5BVoW85+yEQwAAzeXP+0eiDK8RfN82R0oivwXP5I?=
 =?iso-8859-1?Q?3AzFEX/rqaNJvTHjcxZtQp4QqdgTRFCBFk/vFiTG5P/WwD0xoyPvVvmDvu?=
 =?iso-8859-1?Q?SmZw/lDovHvJn5qoHnZJKOBpS9vVut/qxDjts/GeSRBebO9V3qT1vkfkF5?=
 =?iso-8859-1?Q?7GXWbcvgt5xttzLzGbllh0o5mcwkLRRMzOylBfk9g51hpvcJzdU/Ixr9sm?=
 =?iso-8859-1?Q?dShrSPNj5aRon+0j8tlcCrRiZc4tfy6DSTmsglDR3yLNR9jkHJD5muwqqk?=
 =?iso-8859-1?Q?+looh3nbl8RfhErCREMaMhkOHhPOxzi+M8qeCZTR6/VbhLk7Wx2foiyoJH?=
 =?iso-8859-1?Q?wriBPR22y51lwZ5tLpXFE6a0Vv67G7NHOOWSiszYplmMr947z6T9ypR7nz?=
 =?iso-8859-1?Q?YAKwVNn7iM6GbT6pENPB7VNBjJqA/YL8uu09Rj1FVeDbrjlEZpBU1kg7ri?=
 =?iso-8859-1?Q?0Zb7+Lg0kMBUVTxjK9qX1JHOiSYxvp3JxMxzE+Ld7zNHODK/7aBaoeO/Q8?=
 =?iso-8859-1?Q?JI36cy83pbP7aakb33IQoOsBLch+uND4Qc0ENm63XKMoahTLa3RHc3rNP8?=
 =?iso-8859-1?Q?8V9Z2pqxxczMq+E1cLeOUGvjOASYJv6xquookQ8jH9sTLjzswaJAl2J1h+?=
 =?iso-8859-1?Q?fulWML4mmlxw8yyMuORyJJSYnCgVW1IwROvJwWlbnBlZEMDxYkk39BTrcd?=
 =?iso-8859-1?Q?IsBVaF1BfZyq0XtGEcFrPo5WqaPAGIsrvGZUY3ePISqsltogkxuAbXBdPs?=
 =?iso-8859-1?Q?++QguQLRTh9c+BlO6tV1DSSuiZ14hS1SPp/zlnZFrI0X32t5OanhXEIVZv?=
 =?iso-8859-1?Q?2Gt0wxtdcrd9piJfv3vsd4xYroz8eHXELE?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cc109c79-79c2-49fb-1527-08dc818f2550
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2024 16:31:38.8874 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0eyiohonGsty0Ys7ItUxCF3IpCSDeyeudLE/Ark/k2ArHRnLA2KX0V+3tcqG402x/Sf8bLbCgkO3JHFsUB0t3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6285
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

On Fri, May 31, 2024 at 04:15:31PM +0000, Matthew Brost wrote:
> On Fri, May 31, 2024 at 12:02:05PM -0400, Rodrigo Vivi wrote:
> > Defer the ggtt node removal to a thread if runtime_pm is not active.
> > 
> > The ggtt node removal can be called from multiple places, including
> > places where we cannot protect with outer callers and places we are
> > within other locks. So, try to grab the runtime reference if the
> > device is already active, otherwise defer the removal to a separate
> > thread from where we are sure we can wake the device up.
> > 
> > Cc: Paulo Zanoni <paulo.r.zanoni@intel.com>
> > Cc: Francois Dugast <francois.dugast@intel.com>
> > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_ggtt.c | 56 ++++++++++++++++++++++++++++++++----
> >  1 file changed, 51 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> > index b01a670fecb8..d63bf1a744b5 100644
> > --- a/drivers/gpu/drm/xe/xe_ggtt.c
> > +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> > @@ -443,16 +443,14 @@ int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
> >  	return __xe_ggtt_insert_bo_at(ggtt, bo, 0, U64_MAX);
> >  }
> >  
> > -void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
> > -			 bool invalidate)
> > +static void ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
> > +			     bool invalidate)
> >  {
> >  	struct xe_device *xe = tile_to_xe(ggtt->tile);
> >  	bool bound;
> >  	int idx;
> >  
> >  	bound = drm_dev_enter(&xe->drm, &idx);
> > -	if (bound)
> > -		xe_pm_runtime_get_noresume(xe);
> >  
> >  	mutex_lock(&ggtt->lock);
> >  	if (bound)
> > @@ -467,10 +465,58 @@ void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
> >  	if (invalidate)
> >  		xe_ggtt_invalidate(ggtt);
> >  
> > -	xe_pm_runtime_put(xe);
> >  	drm_dev_exit(idx);
> >  }
> >  
> > +struct remove_node_work {
> > +	struct work_struct work;
> > +	struct xe_ggtt *ggtt;
> > +	struct drm_mm_node *node;
> > +	bool invalidate;
> > +};
> > +
> > +static void ggtt_remove_node_work_func(struct work_struct *work)
> > +{
> > +	struct remove_node_work *remove_node = container_of(work, struct remove_node_work, work);
> > +	struct xe_device *xe = tile_to_xe(remove_node->ggtt->tile);
> > +
> > +	xe_pm_runtime_get(xe);
> > +	ggtt_remove_node(remove_node->ggtt, remove_node->node, remove_node->invalidate);
> > +	xe_pm_runtime_put(xe);
> > +
> > +	kfree(remove_node);
> > +}
> > +
> > +static void ggtt_queue_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
> > +				   bool invalidate)
> > +{
> > +	struct remove_node_work *remove_node;
> > +
> > +	remove_node = kmalloc(sizeof(*remove_node), GFP_KERNEL);
> 
> Are we sure this code cannot be in an atomic context or in the path of a
> dma-fence? If either of the former is true, then we cannot allocate
> memory here. 

not sure tbh

> Alternatively, we could use GFP_ATOMIC or preallocate
> 'remove_node_work' as part of the initial GGTT node allocation. The
> latter requires a bit more memory, but GGTT allocations are heavyweight
> objects, and using a bit more memory seems fine to me.

I had thought about simply going with GFP_ATOMIC.

The pre-allocation doesn't work. Unless we encapsulate the drm_mm_node
into a xe_mm_node with the removal info in it.

> Also if we do the
> later, maybe just add the node to a list and kick a dedicated work item
> which process all nodes on the list.

The list with the single worker also sounds elegant solution here,
to process all the removals in the same way. But for simplicity,
if GFP_ATOMIC works I would prefer to go with this that minimizes
the thread and it has 1:1 work:item.

> 
> > +	if (!remove_node)
> > +		return;
> > +
> > +	INIT_WORK(&remove_node->work, ggtt_remove_node_work_func);
> > +	remove_node->ggtt = ggtt;
> > +	remove_node->node = node;
> > +	remove_node->invalidate = invalidate;
> > +
> > +	queue_work(system_unbound_wq, &remove_node->work);
> 
> I think we need to be careful with system wq usage. Recently we have had
> two bugs [1][2] exposed in 6.9 in which we deadlocked by using system
> wqs. I think it is likely safer to use a driver dedicated queue here.

ouch! probably good to create a dedicated wq for xe_ggtt so we don't
interfeer with anything else.

> 
> Other than these questions, design of patch (try grabbing a PM, if we
> can't defer to worker) LGTM.
> 
> Matt
> 
> [1] https://patchwork.freedesktop.org/series/133210/
> [2] https://patchwork.freedesktop.org/patch/586095/?series=131904&rev=1
> 
> > +}
> > +
> > +void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
> > +			 bool invalidate)
> > +{
> > +	struct xe_device *xe = tile_to_xe(ggtt->tile);
> > +
> > +	if (xe_pm_runtime_get_if_active(xe)) {
> > +		ggtt_remove_node(ggtt, node, invalidate);
> > +		xe_pm_runtime_put(xe);
> > +	} else {
> > +		ggtt_queue_remove_node(ggtt, node, invalidate);
> > +	}
> > +}
> > +
> >  void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
> >  {
> >  	if (XE_WARN_ON(!bo->ggtt_node.size))
> > -- 
> > 2.45.1
> > 
