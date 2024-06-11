Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C7FEC27C4F
	for <intel-xe@archiver.kernel.org>; Tue, 11 Jun 2024 01:43:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB0B210E054;
	Tue, 11 Jun 2024 01:43:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ht/ylnqm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5078B10E054
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Jun 2024 01:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718070232; x=1749606232;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=mTBuuW81JX9LxTZaDeLm/+C/vUMI0+j5c6KO3jNfIzI=;
 b=Ht/ylnqmuxXbUTQF5cggXqX9btcAWh9lPfvp/e/c8lWmJnw7Y0u/WW42
 YNYod1OQQk6Ekfm5eEQJ4ui7WZlqr6LGnL4+UmbXg6jP8cWZ3hdF1GzEz
 JCjn3eNu9ii3xDpGu+Ln1x37GO9wS/1L9ug/y0xwEQwHXya0ncxZOAdcO
 u0icG34Ui0V2R3TnA0CRJfYnP/xK+x1uU4PKTZhQbaNt69jOcrvksO+o5
 6v52G6I1Ollz3Qom/JZ4cCAoGEIT5aMVVhinfXU+X6yau1HjorgHD3vvS
 pCFmxY3JLMTnORyQGz9XoM1iCbONaDdqHZfQYwk8nzwQwHBE6VvjBxslX Q==;
X-CSE-ConnectionGUID: gpFfm2hETq67MRDk7tjK+A==
X-CSE-MsgGUID: Kr0dEH26QM+M0KCAfP8Wvg==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="14635812"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="14635812"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 18:43:52 -0700
X-CSE-ConnectionGUID: dfh1eHXoTzyT0w6iBtnQwA==
X-CSE-MsgGUID: touTRfA8Q9uWBEh4sglUJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="43819425"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Jun 2024 18:43:51 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 10 Jun 2024 18:43:51 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 10 Jun 2024 18:43:51 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 10 Jun 2024 18:43:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WcU3lfHDR2ycq+d3KsKcznAk47K3SQWkVVST4QAv9nScw4lywic9A39NJVWLeHNXzOfWMYjiyj63Lp0m0O9rpOZk9mnih2nS8rK0O5Bj03B2UCalR/Iw+YKjer9bZ1wgC3nY09ZpWYnst5mJXFMCEuko9SvvD1uMOmpuBGyRFbbJ2Yl90dXjYFXQLQfN7IzqzhzevyVGKHP2atC6EGZSFBi7ZW4f0q42MR2KtgJn/JlW5O+7MlAUUPsyVO2jPEbxN/Ld1v3vB/fZTkQIS47a3WIaux/rK4R/TddqYZEWZMUwJwM+LjG3197549whiDDxw4AeYpjDUiF/7oCJ+hi4Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6r3V2fCr54/+SbF7jSfZ9GEVUaJDMjewjQ6RJJOHDw8=;
 b=er/rhOA3GkdtGeJWs4X0ny/OnIjMhzR45MgBcpvorQhHUzdeR/d3/6sg0VdO1yKF4eBzqfJZKMTTrvwXtjStV+ZQ3CXz/D9YlLQyxAcvQg2LVSpWTDRqaCeJYIKqS0TRoX0iKo8ete4I9ZHc5yReitzM5y/py5kcdvavuk/eLVPpGtmTXFRFctdeZZ5AoNHyASNGkDP5h+lPaix4tp9DQ32oiLvsz7qHVmz70c7oJgxkwM1ld/QhNKcAoE5CcU+1wfgCrIfUyH/OFGdtCfr8pPsz4VNOnIMSVx9hC3ifrjdamPKHRQXuXrVaHEZooECX8vlekSM5prfKwo7DjEl4RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by SN7PR11MB6773.namprd11.prod.outlook.com (2603:10b6:806:266::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Tue, 11 Jun
 2024 01:43:48 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.7633.036; Tue, 11 Jun 2024
 01:43:48 +0000
Date: Tue, 11 Jun 2024 01:43:18 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: John Harrison <john.c.harrison@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v5 06/10] drm/xe: Improve unexpected state error messages
Message-ID: <ZmertnRU4jSTqhBq@DUT025-TGLU.fm.intel.com>
References: <20240610141823.2605496-1-matthew.brost@intel.com>
 <20240610141823.2605496-7-matthew.brost@intel.com>
 <328a4647-642d-4d39-8d3b-dc69cb7ee4ce@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <328a4647-642d-4d39-8d3b-dc69cb7ee4ce@intel.com>
X-ClientProxiedBy: BY5PR13CA0025.namprd13.prod.outlook.com
 (2603:10b6:a03:180::38) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|SN7PR11MB6773:EE_
X-MS-Office365-Filtering-Correlation-Id: 881d8f2c-2d4e-45fc-6229-08dc89b7ef95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?o8AQ3fKU5IM0emqEP6SvxLdjISpZYjJ+4LMnOGyolItTftNJ+Q7u+vEiozsY?=
 =?us-ascii?Q?orEryDXb1unh++SvBUybS1xOd8m4/nOqkPz+rCbg5w3//JfxYWQ7EPvnLATB?=
 =?us-ascii?Q?P+gTk1e2XZItuH7q5QyiuNKTVRP+uZNc4nyHfgsxm+IsX2+VVnamcRKgIdHr?=
 =?us-ascii?Q?OmaGtyn75SYlNP8qfetCI4ZjPLXMEuN8mwuPurYnoUrlMgt6JVfKO/0Z2gpw?=
 =?us-ascii?Q?w8hn6loTO8PhidzCItTqISbbFTXGywvZACqZ79wooU+EHriBA8LZUJamKxYJ?=
 =?us-ascii?Q?soHufrhFYt/cEf7DueWG/RdgxKs3j+MSaLGXH0UssvR229yodMC64vVq6ylq?=
 =?us-ascii?Q?/mS5oEtO51TIlajybY6oltpwMblQ9mKAUGKKYZAyPfVfvJdCx2NPkscFWSSa?=
 =?us-ascii?Q?pqjNz4tgoM0haBZOiKGtrKgVOxVJ8R+qzWz+M1lpm4u+zT3TdEmOToyytf3u?=
 =?us-ascii?Q?sK/j7RQiVoaZwZTYSEtE0DVN/kLovVAkQk0gcpJXms95p+za3AtkiJjdBUeJ?=
 =?us-ascii?Q?XUtCdPrgU+FJwvNblQjoT5SmKsXqD7m+gI3vXwCDJjaGizk/RIrOqYay87dz?=
 =?us-ascii?Q?lMyWEPrkFbfWq3qdPvyip534gBFivLTKg4kDnsbP5dqeVDQePnCMWqE7TY/q?=
 =?us-ascii?Q?iQiKucgHEaY8JylPE5n8bXJX23eRqMCewdnLXB004EOuRp4lnsaEuS7BU1pI?=
 =?us-ascii?Q?WIXjMJvQAe7zwrP0AYq3/VBlb3j6W2ZW8tf1QnvTiHdAqHj44VFffHaUPHmD?=
 =?us-ascii?Q?nRqbD7unEPBLtM5diUT7H5O/1VmH1EH3fsQLi/y4cz+ibyHA18SkQEQGTIOv?=
 =?us-ascii?Q?OwrFiMinDNLt2TdcOutB16Xt4G062+oSVa1B4bHIl7gVhDVVZ4HVMNTybvOk?=
 =?us-ascii?Q?cn8TSPzFM08beZorwIxHCA370Hg/XYoN9JohMR5FNOtc92/2ssL0izgnr4KU?=
 =?us-ascii?Q?NYKDvRuD9WfSpEhqQcVbZKhVCmnm/v1drpMH0Q6kU5+uVf1AA6+gTd7NIlUh?=
 =?us-ascii?Q?LkQT82VTE0HqIcQcLw04bMAdn1QUVHZBYcZxAkdMb0jxD5ddk0rnk7YRlp8T?=
 =?us-ascii?Q?ttBW/AiHVdlxqfdctGjgooWYE7KeTUQ9H4/7L5CW5Ih/ne1vfSs+wEvCs5LG?=
 =?us-ascii?Q?WA446+EW2LDuGk95i2PkFqSFqgCphqgglvp6mZRmIS7TNN/Ihc/0xAoK9fjQ?=
 =?us-ascii?Q?dXpu4ofYBwCo02aWxU315RLQ6YwSIVUocMXTK2T49wmyKWvnu4HPt2pBMViO?=
 =?us-ascii?Q?X1lOUCP+wcPrIUfQeT7M89UOOrN2mmxtdhsiybM/Kr5wX66KQB2gb9x0xdW4?=
 =?us-ascii?Q?Qd8oWJa/Q0vCVbynhxdRlnIM?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Utas7kYiADRMxn4/JzVuTQlEiMzPAjxWUiMM/bxhjw18uTIk2RacY1TwKSHi?=
 =?us-ascii?Q?5Kj1TCeGVMed7G3n3JDagN7efuV3upcOedtizsodQ2cYJNio3jacFGNhUpAl?=
 =?us-ascii?Q?HhoMu2tlRVzbZ9muJ13wcO/QxgtKJjYJ/XwfLi2onorsY+8Eo2RtyQgBEJVu?=
 =?us-ascii?Q?B/lMc9noD+LaSolyGXKHee3vfFK5Mj5yOoNy6WURJ+LyrWgqEWQWoSVxUqFL?=
 =?us-ascii?Q?YTK9GN7w3GtX5PiF38wO6545s8EjEbU5XvhVlgUeefSgpqg925zil0HprahH?=
 =?us-ascii?Q?HFELikQgW7g6AnDjUrMXgDsyQf2KWMduo6Ug8uIxL5x2kBzSFV0p7VWONFnD?=
 =?us-ascii?Q?9hAIIapakR97lMCxGneYpm7z6pmuod9QAMjyVPqgyJWtiQRrACGoWOfuIWuU?=
 =?us-ascii?Q?qIIFEhftwjAuQuOq4tt1h31ifpeYHn4YdV0C0s7MKse4+jz+NxQIWD1uMS1G?=
 =?us-ascii?Q?dT7bgesXqa3zizWxD3GALedBME50juSKOco1HseQEzCSalsgrUlaKTOvuqf9?=
 =?us-ascii?Q?SaCJDgCi3YTLY7nIpZMMq3dqIJC5DuQFgLD3v2kvQICI7QKxAYoBM4eEBsOL?=
 =?us-ascii?Q?SYq4DDKAftvB6tTtMAjyUf3cIWJGcWOYUpw2JgOR7oYPX7QRAj7NwtKLx5ND?=
 =?us-ascii?Q?izeUWFgXop/816A7SDeVZQ/UYwpA9XwyHBlLJbH3EkWYpXuXkpLFWC+6b3H8?=
 =?us-ascii?Q?AvkaYtojbuUTxNV8gEaVzprgCZYFBAwajfaD1unJHO+4KdugqSQ9MCAYQ1I4?=
 =?us-ascii?Q?RAcpXribvu4C6VKkygd4lnzMmQUldsNRmuVUTJpC29odquBP7mqBZQWFhnwX?=
 =?us-ascii?Q?K/f5jb5zMAm58NW9GIU+gT98gIY+kAmEUImEissIdgJkOagnQLJo89nxzdl6?=
 =?us-ascii?Q?fkiBkOdxEp6E/FE0O74dLZa+rUNaeqiygqchMv483DNY9ckUFrdJ5giPP2R+?=
 =?us-ascii?Q?tsSvHyTi17UQXeIWcQ5QdNk861++cG2oWzl5tRlebU4wvKPBL8DjTmVdD/Ng?=
 =?us-ascii?Q?me7nhaXsJNbN6QtCisfsWVvrnTOp9IWNx9eLk3/OJYc94fzQBO9jQqX7Cm1B?=
 =?us-ascii?Q?RSP2xQUGOSWInvrupYzA5yJB4wuwFlfK8JpPXAiF0VQQ1O+sOitBs61UGsqS?=
 =?us-ascii?Q?voWp8OK8kg/1eu4YN1IysxwojP+Yl8Xe4z0xWqs8rnSG7cMsoViZaD7DgFNQ?=
 =?us-ascii?Q?LNYiptZ6tAHGknCcejoNOqH8IqNyB+EmPkTrebjPhrFqLCU2YMoJKeoqh6R1?=
 =?us-ascii?Q?yMleA6YdctRaNvOaqyWcbv/0GLYIhmaiO8V6sVI24UtklKOOJ849TOXzW2no?=
 =?us-ascii?Q?Hx0tvY7+3wrahaoHxd7HdQjSQLwWujPrupyDyOYn5yOV+4M08l6+R05PEI9O?=
 =?us-ascii?Q?Ff+/ra36gRqjU7CMpNcoYi9xuN5otCRXY2+0uWsVkPSkUpX7BXSeJZ6pbOBV?=
 =?us-ascii?Q?AWC2fkxHxFRnlh3NZ6H1YepRDl18uVxZ/GitlcW1/eRTkwZlpRI/lVJb5lM+?=
 =?us-ascii?Q?Nn21MaqrW3qZCmVdypprPYTf3clq+EOKyBUeQmkpPdXvwoMN0bsDHY4yC5H5?=
 =?us-ascii?Q?uTLEcsRuPjmEDqNItFZkHmbx3K2NX1HFj2L+PxqatfzP/OkWxrohlcG8+VgG?=
 =?us-ascii?Q?NA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 881d8f2c-2d4e-45fc-6229-08dc89b7ef95
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2024 01:43:48.4009 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ep1W9fIrPUM24HDMOcVSiHoP/+nSFXi5z0Sk5aHGXXRCUHPsJQLQcGBlgolGpcoHYoai4AU9fS9NtIaIJld9KQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6773
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

On Mon, Jun 10, 2024 at 05:09:01PM -0700, John Harrison wrote:
> On 6/10/2024 07:18, Matthew Brost wrote:
> > Include G2H handler name when an unexpected error state messages.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_guc_submit.c | 8 ++++----
> >   1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index 4464ba337d12..766ff8e48dde 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -1632,8 +1632,8 @@ int xe_guc_sched_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
> >   	if (unlikely(!exec_queue_pending_enable(q) &&
> >   		     !exec_queue_pending_disable(q))) {
> > -		drm_err(&xe->drm, "Unexpected engine state 0x%04x",
> > -			atomic_read(&q->guc->state));
> > +		drm_err(&xe->drm, "SCHED_DONE: Unexpected engine state 0x%04x, guc_id=%d",
> > +			atomic_read(&q->guc->state), q->guc->id);
> >   		return -EPROTO;
> >   	}
> My earlier point was that this G2H notification provides two words of data -
> the context id and the runnable state. The code is currently not looking at

I was unaware, msg[1] contained runnable state. Will include in message
plus add a patch to assert this in the handle_sched_done.

> that second word. It is only looking at the internal KMD state and assuming
> that the notification will match. Instead, the code should read out the
> state from msg[1] and pass that in to handle_sched_done(). Which should
> complain if the notification is for an enable but only a disable is pending
> and vice versa. And by extension, should not do the disable processing if
> the notification was actually for an enable, and vice versa.
> 
> And as per Michal's comment, any update to a drm_err|warn|info|dbg|etc.
> should take the opportunity to convert it to an xe_gt_ equivalent.
>

Already done.

Matt
 
> John.
> 
> > @@ -1671,8 +1671,8 @@ int xe_guc_deregister_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
> >   	if (!exec_queue_destroyed(q) || exec_queue_pending_disable(q) ||
> >   	    exec_queue_pending_enable(q) || exec_queue_enabled(q)) {
> > -		drm_err(&xe->drm, "Unexpected engine state 0x%04x",
> > -			atomic_read(&q->guc->state));
> > +		drm_err(&xe->drm, "DEREGISTER_DONE: Unexpected engine state 0x%04x, guc_id=%d",
> > +			atomic_read(&q->guc->state), q->guc->id);
> >   		return -EPROTO;
> >   	}
> 
