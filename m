Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C00A4FD45F9
	for <intel-xe@archiver.kernel.org>; Thu, 26 Feb 2026 01:57:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75FFB10E058;
	Thu, 26 Feb 2026 01:57:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VhLKTOd4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12E8A10E058
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Feb 2026 01:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772071030; x=1803607030;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=0XTFpSXCu7j2R0vVIVtxdi7rBa8kEVbVxtOIqa81QiA=;
 b=VhLKTOd4lSsShlwbSgP+hO/bQNG87NoGJq6xG2SbgKo+/tlxEJDTeE6B
 cTJOSWa3gSSSluLVitgTOA10MhkUavmviVTcrdy+Ser7ekU15M9K08FUe
 1RfjoSUJBZ9xBOkOWecVkZYg1mkQEzENJDlfnW1KwszktbsqLA5YSMx4R
 TLwYHCYovW44p3N471M2Lw6idFbALQlwPIx6I3MCTFFTEMvNImw6AdDMA
 T8/s/WX5YUolH2JGxYGz5cCj24KhGjEq1UtB7yqOtqhkCbsIxuPMbUBNA
 60c4b5RF6abzNILSXCs0o1bgjsqKuPJenBZCcgK2AGV6jSOZ/cDr0FQ49 g==;
X-CSE-ConnectionGUID: EK2HtQUXQyOpettwao8qIA==
X-CSE-MsgGUID: anFhUt4HSxafzJZRZMVNmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="73167396"
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; d="scan'208";a="73167396"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 17:57:10 -0800
X-CSE-ConnectionGUID: /S/RkFSDTrqB5M2xNMSYPg==
X-CSE-MsgGUID: RCsihSJUReu9ivDCZBrJ8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; d="scan'208";a="246960364"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 17:57:09 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 25 Feb 2026 17:57:09 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 25 Feb 2026 17:57:09 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.34) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 25 Feb 2026 17:57:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M9mOEgTFTPifJst1lNwh/h4R/ct3bMMSD0oQiCRZ0P4lSmj+tcTrHM+SjwxGtIeiJtk6htWGkN0LPoTOYFJ8ZXGZ6x8CdqcA75fzimEejpKaOX6L386DmbryuB3tE6A+6vexIHCAMPqTUL9RoZJvPGz/YXuwqo+Wzj+r61lA3qniITfNKPdU1tr+iCf9kkv7X1ELV/AHP6vWMhiwtouncXe36B1u9DeXOZz60JKedBPYFJmdtZeBv5feh5dQk93ufbksfd1wdPztp1fb/Ugm4BHEvWN9JbDL+RPMc9j4hGQQUIMGSyuZH0dZDksD6dd9JLnSk1aflnLD1ecZ0c9Wmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fQGFY1Sf24WPYK5pkm9fqbSQYCsEpcavvs5gl7IFZ6o=;
 b=i/99vwWQu4xBMNMTsHqzfTyViTLuCvN1cZWu0YPWjcYp75WUsY/VfGrnA957I8OxHP7buPgkgRqaEs8eiVfLcbBpk0uQAnTL2Q72OcMvt14QLk+0UsbZsrgu+7dtAE4pUoxLkxt2UMyOI/BzgiAwfb72z/klPd0yUtUHPj6prsCkh5wSw02Ptt6RiEcMWPzJn3IXyoRuMy0d9TyCMRcwRio62NjDsUomdM0SR5BB5d1jGMECK14K+BT/8gcEqGfIJSt8qvQ+X2d6Sq2sLQn4VWLTM6IEp8oUezC6N+XkAn2rHanwMEhnGJz3WRW/emdT+lXbNUEFdC71S2IEK0rfUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB7038.namprd11.prod.outlook.com (2603:10b6:806:2b3::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Thu, 26 Feb
 2026 01:57:07 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9632.017; Thu, 26 Feb 2026
 01:57:07 +0000
Date: Wed, 25 Feb 2026 17:57:04 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Tomasz Lis <tomasz.lis@intel.com>
CC: <intel-xe@lists.freedesktop.org>, =?utf-8?Q?Micha=C5=82?= Winiarski
 <michal.winiarski@intel.com>, =?utf-8?Q?Micha=C5=82?= Wajdeczko
 <michal.wajdeczko@intel.com>, Piotr =?iso-8859-1?Q?Pi=F3rkowski?=
 <piotr.piorkowski@intel.com>
Subject: Re: [PATCH v3 2/4] drm/xe/queue: Wrappers for setting and getting
 LRC references
Message-ID: <aZ+ocKctwftPBcbn@lstrano-desk.jf.intel.com>
References: <20260225235447.2772383-1-tomasz.lis@intel.com>
 <20260225235447.2772383-3-tomasz.lis@intel.com>
 <aZ+k/Fd6wZ48czIy@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aZ+k/Fd6wZ48czIy@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: SJ0PR13CA0228.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::23) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB7038:EE_
X-MS-Office365-Filtering-Correlation-Id: d04e85a1-7c9a-45da-ec4c-08de74da585b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: G7vWMqeIy4JwXIGOcN/ls/MMcxEZBF++k9w1XWzvzR8SylHNAaZyx1VzK2Z8KSeJxF97iJajFop+J5csvqLWFzB99fBgJfXwhk3rXt2Z/G819JE5dhGHwXwGi+OmkAUHYhJV0d/vQK/zV5TQVaDuF46U2SnslIBmxhH9aAeSiPQgWpqhizyiF57GWKF+C1kBmKWFFr6Dpo7BRXHknzKwPdcf4dPYDzWjb7A7aa9ldAtmgjeFLJNn4wqw5W3OoR2XKz8Gu6A3uC4gwWQ0QpK4BhGnD/+j+UTFCF5F6hdMaPQZA8tInVJzBDwa/JtqfDqY2DFp2S+Br9OAIVySJ9k2H4g8ihcPLB2Pz0Pkd/J4MBm4SX5SSMVbdOxDcZ3M0Ow7np1xDNZ/W/G7WybfgM8WZh+cqev3UR3YROQDRqBFCTJ1Ol8mcrWyqjPouCQ1DR0FaWFGd+yMbjjUWlObMUW7A3S2GNDBHR7cANbnWBEpcUcpcsA2vuVnszwxrOKvqsd/DAqikPVm2SShUJxRzsCj2L8GzZ42J1nzjWLtDXgJ79OuNztoO2zz231em0s+Wpa0N0qqxdoskHOAkw+iU9SyyjTZZdDAEOUdA+4OpZhGVyQY+W5m7i38ATayC9G1/PvHEXb01ZtKdCYwatFDKwtpWtiinjL205iW83CDAibkIhErUZTl0gAluBA56lj2F2fDs95p45VZp1/fPNeV2er906/9f/yW6Q/UUVAb21OEPNQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VABFhKIrbz1Q1917WzWtZL6yr7JQtUP9YbvyFuGhUiQHl3wNjF8s1csyIiWJ?=
 =?us-ascii?Q?Wu2z4tx4VaRNXbPQ3c6XlOy31oDaQoF7HSF5VAhMPPjk6+XmGW1j7g/dkgr6?=
 =?us-ascii?Q?YGKZChDZ9lHwQ6o5tboRV5y4tTZltg+fIIWumb49R6+GwKQeuPRNMo/ZHoh+?=
 =?us-ascii?Q?UEZElCzQ97x9C0yvdsxqB15UGIMUudl6bImpzWmjWw/1ItNO2hH7LKulPF3N?=
 =?us-ascii?Q?9auhqPjLKrxfVZpXMgyC3rSfKg+SOv55isA4JvQ/J3KncOZ32IyAAee57OCF?=
 =?us-ascii?Q?mLG+U3cZb20qXLt+f094cs0wWk/fKH+nSoAOHVRleLvC3oxQ9SadpKkBiEVT?=
 =?us-ascii?Q?QO96SLPkuAJoTsNBvyzUo5EV15P9gTES2+SlNhXb3ZJDgXHrZx/cFZfLfn6n?=
 =?us-ascii?Q?IpRNUSODxYwezJ4xf70J3Wpb6EGzKXqb1IFnN3vOV37yJsAbcsf/sk2L3c4p?=
 =?us-ascii?Q?dwZNXy5+qYC6+AaYccVqMyjvAbTUMhKRz2HpUFSXgj+fPbSgp9yvbyX222tr?=
 =?us-ascii?Q?l8AnJakv9WELOO0XVYo6pdZ9/CQxPmLohIuQlBtZ0pqNk+pLWz8Bn/s7GngD?=
 =?us-ascii?Q?O5YY4jmtEqQVWCweVRYwQUOagX6iF7QUllXWUbx2OZeTzScXN46gvCxK2h4h?=
 =?us-ascii?Q?5w0h9QgGuasr+bxTJyNx0QYvz9a1kiyed9gJiPNyXQCqMD41VKmt9ZMj4tOe?=
 =?us-ascii?Q?minH3qnX085fjzjSe3HOW8eJUJmHlNCVGi6IR5ZJzp8mN6GZuqpZkUzm8g4a?=
 =?us-ascii?Q?CXSnJqe/k0SdODehkE5E3sEXPmuLPAkFThpdassfE+/7FFhM44ta7rQZFVRB?=
 =?us-ascii?Q?da4oNI/nRJ6SUPkey+G51gztV39RZhjvw5E4T+pUblDx2wyyrXfJIXL/gzXa?=
 =?us-ascii?Q?UDDPbViKjzRu26LgfBP2WMcwrjYuDW/cXgNXactYk5rYppAY7hSl5yH8lQf0?=
 =?us-ascii?Q?XWddpiiGioHphUmc0keLJ01bzSLI3mp7ZtckaXJUoXiepxHjLdImG3FPGW5n?=
 =?us-ascii?Q?DE48wJeGJ8Mq6M2L5kmuU8Eh1IiBLl918iMAF9Bi/6CaV4CleOMQDVJ39Jkg?=
 =?us-ascii?Q?8mp8w5M+9G1MTKx/UzW0LPMYkCgfu9xqm/o4comvAqZzHP6jDIeHjrOJuSpc?=
 =?us-ascii?Q?tRgJD3Bmgi59Cmrnv02aTTGnQkDeb0gfQWlb0a/IhpR41q9QEl8ynYf9XEgr?=
 =?us-ascii?Q?Gb2vQEdHQuydB2N1hDHR0J8JYlq/go8XooiZohZSvAwWdsVRgMq/0NxUfSFs?=
 =?us-ascii?Q?ijQ1A12wOd4e1MsX53E6V6XU5VeulQGENFYvKcNXyzov8l0VRhFVeIkYH4q1?=
 =?us-ascii?Q?Ulzct7ExM+4aaNYxVxPwdODLsIHj9C+jG87ofclRW93ix6kUJwOJiIFYxLVD?=
 =?us-ascii?Q?8ka9c9zv4ArogRN0loYiN50WkZhGKOzSefE4xtGREfMSHGohxIXJvPIjXYp+?=
 =?us-ascii?Q?hl/vBLZjBt2RsO7uY5kvqLmysCA8EzEKAKGJbdM23qNqCuN/Pc1uinSSjpOU?=
 =?us-ascii?Q?tNY9wV6gfq7PnLlbZFI1LFILTeLEam51TOGHS6AZFF2GuUA1758HuGW+XRCO?=
 =?us-ascii?Q?6vbLJemTRjwJ41G1KCmZAAhm2F8qst/6gzN8fszyYwZlSVme6HZ8Vaj43CuO?=
 =?us-ascii?Q?bbK40YOjE0j9bfOCuT59KdaANISv3a0OPr+wW6mv9ckLfrAn1dh+N/xf9l/M?=
 =?us-ascii?Q?p652q8sIaDhP4ZPeSNf86wtZd9ziDCW3Vz3cLEGyDjcz7hTP+GGGhV1jAGi7?=
 =?us-ascii?Q?j+fgsf7BLUY3edGXKSO994I+PA4Y8y8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d04e85a1-7c9a-45da-ec4c-08de74da585b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 01:57:06.8719 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: agUPXT/Ty7jMnY6rjMNoVxstzPdz6rKO2UdzYy8FtxEx+E2w+w2BbHOZsvCzFEdZD+QB/axo6S+nsfOMZMvRbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7038
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

On Wed, Feb 25, 2026 at 05:42:20PM -0800, Matthew Brost wrote:

Opps, one mistake in my review, corrected below.

> On Thu, Feb 26, 2026 at 12:54:45AM +0100, Tomasz Lis wrote:
> 
> s/'drm/xe/queue'/'drm/xe' in the patch prefix I think.
> 
> > There is a small but non-zero chance that VF post migration fixups
> > are running on an exec queue during teardown. The chances are
> > decreased by starting the teardown by releasing guc_id, but remain
> > non-zero. On the other hand the sync between fixups and EQ creation
> > (wait_valid_ggtt) drastically increases the chance for such parallel
> > teardown if queue creation error path is entered (err_lrc label).
> > 
> > The exec queue itself is not going to cause an issue, but LRCs have
> > a small chance of getting freed during the fixups.
> > 
> > Creating a setter and a getter makes it easier to protect the fixup
> > operations with a lock. For other driver activities, the original
> > access method (without any protection) can still be used.
> > 
> > Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_exec_queue.c | 71 +++++++++++++++++++++---------
> >  drivers/gpu/drm/xe/xe_exec_queue.h |  1 +
> >  2 files changed, 52 insertions(+), 20 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> > index b4ef725a682d..2cb37af42021 100644
> > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> > @@ -270,6 +270,54 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
> >  	return q;
> >  }
> >  
> > +static void xe_exec_queue_set_lrc(struct xe_exec_queue *q, struct xe_lrc *lrc, u16 idx)
> > +{
> > +	xe_assert(gt_to_xe(q->gt), idx < q->width);
> > +
> > +	scoped_guard(spinlock, &q->multi_queue.lock)
> > +		q->lrc[idx] = lrc;
> > +}
> > +
> > +/**
> > + * xe_exec_queue_get_lrc() - Get the LRC from exec queue.
> > + * @q: The exec_queue.
> > + * @idx: Index within multi-LRC array.
> > + *
> > + * Retrieves LRC of given index for the exec queue
> 
> under lock and takes reference.
> 
> 
> > + *
> > + * Return: Pointer to LRC on success, error on failure
> 
> NULL on lookup failure.
> 
> > + */
> > +struct xe_lrc *xe_exec_queue_get_lrc(struct xe_exec_queue *q, u16 idx)
> > +{
> > +	struct xe_lrc *lrc;
> 
> struct xe_lrc *lrc = NULL;
> 

Actually not needed as lrc is always assigned and will either be present
and valid or NULL.

Matt

> > +
> > +	xe_assert(gt_to_xe(q->gt), idx < q->width);
> > +
> > +	scoped_guard(spinlock, &q->multi_queue.lock) {
> 
> Hmm, this isn't what 'q->multi_queue.lock' was designed for.
> 
> Can we get a dedicated spinlock? Maybe 'q->lrc_lookup_lock'?
> 
> Open to better naming.
> 
> > +		lrc = q->lrc[idx];
> > +		if (lrc)
> > +			xe_lrc_get(lrc);
> > +	}
> > +
> > +	return lrc;
> > +}
> > +
> > +/**
> > + * xe_exec_queue_lrc() - Get the LRC from exec queue.
> > + * @q: The exec_queue.
> > + *
> > + * Retrieves the primary LRC for the exec queue. Note that this function
> > + * returns only the first LRC instance, even when multiple parallel LRCs
> > + * are configured. This function does not increment reference count,
> > + * so the reference can be just forgotten after use.
> > + *
> > + * Return: Pointer to LRC on success, error on failure
> > + */
> > +struct xe_lrc *xe_exec_queue_lrc(struct xe_exec_queue *q)
> > +{
> > +	return q->lrc[0];
> > +}
> 
> Why move this code?
> 
> > +
> >  static void __xe_exec_queue_fini(struct xe_exec_queue *q)
> >  {
> >  	int i;
> > @@ -327,8 +375,7 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q, u32 exec_queue_flags)
> >  			goto err_lrc;
> >  		}
> >  
> > -		/* Pairs with READ_ONCE to xe_exec_queue_contexts_hwsp_rebase */
> > -		WRITE_ONCE(q->lrc[i], lrc);
> > +		xe_exec_queue_set_lrc(q, lrc, i);
> >  	}
> >  
> >  	return 0;
> > @@ -1288,21 +1335,6 @@ int xe_exec_queue_get_property_ioctl(struct drm_device *dev, void *data,
> >  	return ret;
> >  }
> >  
> > -/**
> > - * xe_exec_queue_lrc() - Get the LRC from exec queue.
> > - * @q: The exec_queue.
> > - *
> > - * Retrieves the primary LRC for the exec queue. Note that this function
> > - * returns only the first LRC instance, even when multiple parallel LRCs
> > - * are configured.
> > - *
> > - * Return: Pointer to LRC on success, error on failure
> > - */
> > -struct xe_lrc *xe_exec_queue_lrc(struct xe_exec_queue *q)
> > -{
> > -	return q->lrc[0];
> > -}
> > -
> >  /**
> >   * xe_exec_queue_is_lr() - Whether an exec_queue is long-running
> >   * @q: The exec_queue
> > @@ -1662,14 +1694,13 @@ int xe_exec_queue_contexts_hwsp_rebase(struct xe_exec_queue *q, void *scratch)
> >  	for (i = 0; i < q->width; ++i) {
> >  		struct xe_lrc *lrc;
> >  
> > -		/* Pairs with WRITE_ONCE in __xe_exec_queue_init  */
> > -		lrc = READ_ONCE(q->lrc[i]);
> > +		lrc = xe_exec_queue_get_lrc(q, i);
> >  		if (!lrc)
> >  			continue;
> > -
> 
> Unrelated.
> 
> Matt
> 
> >  		xe_lrc_update_memirq_regs_with_address(lrc, q->hwe, scratch);
> >  		xe_lrc_update_hwctx_regs_with_address(lrc);
> >  		err = xe_lrc_setup_wa_bb_with_scratch(lrc, q->hwe, scratch);
> > +		xe_lrc_put(lrc);
> >  		if (err)
> >  			break;
> >  	}
> > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
> > index c9e3a7c2d249..a82d99bd77bc 100644
> > --- a/drivers/gpu/drm/xe/xe_exec_queue.h
> > +++ b/drivers/gpu/drm/xe/xe_exec_queue.h
> > @@ -160,6 +160,7 @@ void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q);
> >  int xe_exec_queue_contexts_hwsp_rebase(struct xe_exec_queue *q, void *scratch);
> >  
> >  struct xe_lrc *xe_exec_queue_lrc(struct xe_exec_queue *q);
> > +struct xe_lrc *xe_exec_queue_get_lrc(struct xe_exec_queue *q, u16 idx);
> >  
> >  /**
> >   * xe_exec_queue_idle_skip_suspend() - Can exec queue skip suspend
> > -- 
> > 2.25.1
> > 
