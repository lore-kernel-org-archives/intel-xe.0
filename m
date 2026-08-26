Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF078C61DBE
	for <intel-xe@archiver.kernel.org>; Wed, 26 Aug 2026 19:48:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E8E410EDD4;
	Wed, 26 Aug 2026 19:48:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KzagNIoK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5572D10EDD4
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Aug 2026 19:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787773695; x=1819309695;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=nVpBFc6fWUCG0wK9IGa81bn5TndiyScDh1a87aUOEjQ=;
 b=KzagNIoK/n0JNgR0t0mKeFiphip84UuEQwHuuG/oN/p6q/2qz+1vEOIx
 qu7ZANJtZNO9EZWLA6F3Os5HV/OI4GCS1X9/Vv41LCQNqRPk8ZsnwyGF8
 oy/T4UQXYAoSDict5//A3yFx5Uik+QGG50VNmtIvlfp6Y5IPY0NdX2sYo
 gOlUmWJodfC9QG3CjpNLYOk3SbyFuLmnwOqoJlt0/48wAT/n2ZFkX+TEM
 RrKzQ7uQQ0kraxhZJ1irs+2lvdrjgkuGeqVlIxRJeHVuIHpHZumxfCDCv
 k8bQCXNHduBxmt6kf9dfZA0oJu3VWAcUGp+K+YYdVHC+jf3XqetcLr1Ph A==;
X-CSE-ConnectionGUID: 8q2HlLFXTziOczRFDcmSxQ==
X-CSE-MsgGUID: TC9xX78KTE2YtApfi9MEhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="98932629"
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; d="scan'208";a="98932629"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 12:48:15 -0700
X-CSE-ConnectionGUID: rOAjHljnQPimmbj25dpGeg==
X-CSE-MsgGUID: fM4NyC/bRQ2rI0ooZffOeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; d="scan'208";a="268243188"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 12:48:15 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 26 Aug 2026 12:48:14 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 26 Aug 2026 12:48:14 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.18) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 26 Aug 2026 12:48:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oAijB9FYtfmNVtoKTh/0vXPJSKaqrhht1cliz+MFus0wsS8rOtJCX+BQasls9yMgW6Mt+f763YMpuERW7AK0l3/bYj6YSjgkwPNUsPPOuo3IFC7LenG9RE1HCJSBFlXAm7iWI56BtJOoRpeuhOW4je3+hmiuuNms0k2+IuzabwM0VHDGtmwFaPhq0fUMF9ZczzPsXg9CEEnoV/y3rieYpidje5tI7RDrwqSHFEQ90Mk87vRvPrDD+vRA7nBQNBZxGOpAaeJEcl4FaAZxZzgE9T87bSUT7f9CwQ0ct9/hOeqFiVF/M8c2y7I2uUYMlDK0W72+InBAu5xFoEdoqzwAaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y1mOURt6rr46FkTmehpufgJ+OgFaiwQTnUWPmPgmgxY=;
 b=OtnDIa+euoDUhSp4cIeil/GAcxvBeNovzrZTRK2nHZetxznBkcKZiRQ/SC8FuSfa4ozLO1+1YDj6+SAhHgQFwCHpDFvEIlV/Ih0h8kMnlUq/kUtMn661H3tdHnWsJ91iQVjF1AmVoQF1OhPpJa4lWh0eQECsjHzqkjkLeontVh0wdhMB9aN2/C0nbFNdr66nB8AxvqqdJXnsaEPmsLOkGn74r3O3Xhes6FX4j/48rJWLZ6vL69rLsi3xTGH0BzfXSkr7TLofh/j0t3h/gcIL7FIZZpdzrjE16mnRqjShdF7/WXPev9L2qP3QtSTwBX3IhpbHFei8LalSV9RjkbON5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA0PR11MB4639.namprd11.prod.outlook.com (2603:10b6:806:70::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Wed, 26 Aug
 2026 19:48:04 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0360.008; Wed, 26 Aug 2026
 19:48:04 +0000
Date: Wed, 26 Aug 2026 12:48:02 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <tilak.tirumalesh.tangudu@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/3] drm/xe/tlb_inval: add xe_tlb_inval_ggtt_full() GGTT
 invalidation helper
Message-ID: <ao9C8umPyn2ANiIg@gsse-cloud1.jf.intel.com>
References: <20260826112533.3289978-1-tilak.tirumalesh.tangudu@intel.com>
 <20260826112533.3289978-3-tilak.tirumalesh.tangudu@intel.com>
 <ao8-8NPZpFCiBSQB@nvishwa1-desk>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ao8-8NPZpFCiBSQB@nvishwa1-desk>
X-ClientProxiedBy: MW4PR04CA0302.namprd04.prod.outlook.com
 (2603:10b6:303:82::7) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA0PR11MB4639:EE_
X-MS-Office365-Filtering-Correlation-Id: 943f150d-e2ca-4021-4a24-08df03aaf196
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|10067099003|6133799003|18002099003|22082099003|5023799004|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: MWmkonEexIjv1Sg2XcvSE+wveigyN914XBwXwkmAO8tg4AS2oUzHLtAMvtFpVbxq6jiIycEF327EBzPSihjUsqW1FGaLqh4pdxZOLu9QQvUo+cKLicDTpzxiwJGWgoSvt8ZVJP6j4Ad7rMHrYU2MUtT0Z20FJJQ5Q0AFZ94zzPCveYXJTRQHC8hFu9niBeD1jFNBC/+Ta2YQxX2FY4oqIh3aS76HB2jNLgy/fRsoZXXPbZkLjsCwiYtnck73p3h4sSX63fRoxwRWzLd9Mkhx3g37zSYLbsV2GDVRbfb3ANmrzguq7wBn1LScvlYXoeOi7Dn1slv20akmniw8S7O+aP/s3yjBGLnPEDNIsXBlgMMZ3kGZnJSVRqTQVwytssQ+PYi7DFLZFo3RYsuMUqA4n0x6465tm/KXbMlPw91uycnfThx4A1b4ljt9xoPmbJoN/XKQpVAKZzAHRg5pSBVBy9qT8zQECyhliduN3vBR5502hgAhL7FrRz7p3pic7uu9XOYH+T9Qi89DWFcCTLS9tCjxv6rPMFm5zvg8LWwI1m3GX1wwXVzFooBj5KR8g4cYZCgSb+6ZJ/+qabL0OehMovzSdC5hCuK+OBpXsmt6oq+VabJFEzNCoA0FLWpm6LFtLSODvw/wMogxdF3JGjK7Yw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(10067099003)(6133799003)(18002099003)(22082099003)(5023799004)(11063799006)(4143699003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Diyc+oA+eS38EMopn1y/9uzeyybQNnG32hCHJ5ZGg2yvQ/QJ679fKnh8ChB4?=
 =?us-ascii?Q?9Gava0MWEZYb437p3/pygXG7eLjf424JE/FPXqIUJcUsumqXqO9qGgmV7C61?=
 =?us-ascii?Q?p+Cri9cniSnmJ9AnIbme03GWeyFOa0ySkmLxMapixr+s4RgmaURVzWsQDh1s?=
 =?us-ascii?Q?Qdh5xSdO1BOAi1XdYmh/vNrlwgQ9qO/JDQtX8GIKcMcvCvn528uNtG2Kscqw?=
 =?us-ascii?Q?SSzId3uZUCa5LAJGPRaDDV9nujNeoMRVCM8FyN1UgBo/CRUROEIt0bKhOTCi?=
 =?us-ascii?Q?zcRkRJOxM/9J4enA+KRqAtB6VCO5xhn/Cm25wkHkPrqjjaosFsKJc+gBd295?=
 =?us-ascii?Q?46XUK7N7DfmqJ0zezwOb1T6XFXjH9fDiMwecs25alt+lFAzFDCjYa/PAWZd5?=
 =?us-ascii?Q?dzkzPViAdVXwO/BRJrjDJ0DkgXvIusVM1ce7ydDbxLDlB5QpVKdMQ6c5Bayb?=
 =?us-ascii?Q?qPhdelpm2EbSOCQMt405DJ6OhxnqpVCyIIeOME//jlvvg4UY++asBkGp+xam?=
 =?us-ascii?Q?HhCsxvbkQostVSev+bObFVoilF7KLNEAxWyiNf62T/vJKj9xMcNbL0H+x1QE?=
 =?us-ascii?Q?n3E+qkqSso1zBa42Ji+/Lq24TOWSivlosm7ATmWlMG5aQQjjxADqAxNpiqzv?=
 =?us-ascii?Q?ixd4/wbzLDCKJPbH/NzG6b2Id6/CXVX97lxUp3RL4MPGkP4yEcepW631hq3r?=
 =?us-ascii?Q?WTmIAapFeiUjNp3j4tbgSxnR7gUGMPT9nF5I2JMYObwlcNJm7gq2ZKAsK66v?=
 =?us-ascii?Q?QvyWWyJUG+r/dNjHd9FsqKEx0GOWlTZaWNaXtTHob36czxOQJKHDePckxR+a?=
 =?us-ascii?Q?H5gs08/5D8QzWHIjX2hzp3K40wqiZbm7eU+0ZGDCS6Ydjk7sPERm/5NsaUz0?=
 =?us-ascii?Q?RyqEQWEfBiqBSoFDEBtR+oy8hktZ0WIw1Si+8S86zx1AGisoV4bPTeomI1Zr?=
 =?us-ascii?Q?UbCb9nQ5dMP5ri7ZMszLQrR+DRrgubNNjwb4FjtkQ4m83dy0iyFjm/ODSCzv?=
 =?us-ascii?Q?zh4pGmZOvki4XyuHmQxj8qZ8jJe17LQLyWvtUmGVHdOh+F041srt4zdkwTnY?=
 =?us-ascii?Q?SyCpWv9MZnWtoPeaohLf+ey7tZD6/HgF7BAzztOuLWV7SFS2Qb4A6P7Rouab?=
 =?us-ascii?Q?Ch0AYtTmbHlqtNahc+jXWO+6LBgkn8hjED+vrYxBmzOaOcavU69mKT04dPiP?=
 =?us-ascii?Q?t5c3B0XiAm1LKEQ/1yReEfTosUzwmY6WmDeDK/trSoYh3DqPBoMwDeom0gUI?=
 =?us-ascii?Q?U1R3Dg37fwqU1LXOaGd9Aqcb0z9B78GucUqb+omTpwO4fVM11YpPELYitQ1e?=
 =?us-ascii?Q?yywBE1b6pgPiYmtAIbQFKFZcagq3HGhfPGSvNsxK6UbRmwek3v7ocwIfelr/?=
 =?us-ascii?Q?3KuFpKMaR0Xf7OMSC3Orl7CiBKhE3YmHHgULhyjZMXgDP7K0rlLI7f//OhZc?=
 =?us-ascii?Q?zjk1QvWcPRByUAfGw7c5iQLKFU2gNb/jGHGIXN4z5+O7EfCCAEZ7RYgE73IK?=
 =?us-ascii?Q?XLZOS4LVhguutZdE5s7TEr2jaRO6Wb0wgR6fOwRQd89yv+j3Ubw0wFX9VLSy?=
 =?us-ascii?Q?UWNxRpjIWrZgO7Fvc4rFEUlRsDxDHnul7gJ/s7VEFat3WICDTUjpbTclBjBy?=
 =?us-ascii?Q?tl5kplS7Pamapoa17PJSlD9eQ7PKavRieu1hyYJIEDNCpKQcrMXHsXHH/g+f?=
 =?us-ascii?Q?bBU/55tShJw5WJUlgtEFOQoXdKNLh0TWazlBno7i2z43Mv5qTJRgvnQrkh9N?=
 =?us-ascii?Q?XYT4KDmUKn/82Ea3eAjfFi6YJ5ortVU=3D?=
X-Exchange-RoutingPolicyChecked: 49imzd4tHgSY7QHJPz8DlHVKHWKGfrTuJ1TANZ5wPPqJXKaBh0mbsjAYcOJMU+lexrnFpNZ2p+/tqC3RtYi4GDC7sfdfvcC2bi4nqfTVF2m9DCJC4HrfniR+NtR6yQld3AXo/rUMymvn4unil/phJNVxlVDzEIyMWqfcGZCY7oskDpIXRmE/i9g0xS+dhudJxCklq6Od0mRS8aijPRQWat4+Kj7cPJ0O6HqRfrwbdC3mg0oPyqBaPDSjmnAcdJYs/OurQ4fNQb1tLshObrH/Zad+i67rFzz9Vo5iCMQVH+z0hGjQqZZcwrn9870xGtxTiU19MDmCrw7AjQrpJTI8JA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 943f150d-e2ca-4021-4a24-08df03aaf196
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 19:48:04.4119 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1p0iVOUi6V0d1wHlps7DNOI1/tFd0wwZwIDUoltRvNLJ7k1Fxw1ivMm5wEuBm+hs/dX30Vf2nh2y7YDPm3D7Yg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4639
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

On Wed, Aug 26, 2026 at 12:30:56PM -0700, Niranjana Vishwanathapura wrote:
> On Wed, Aug 26, 2026 at 04:55:32PM +0530, tilak.tirumalesh.tangudu@intel.com wrote:
> > From: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
> > 
> > Add xe_tlb_inval_ggtt_full() and its GuC backend
> > send_tlb_inval_ggtt_full() for full engine TLB invalidation
> > within the requesting VF across all engines.
> > 
> > v2:
> > - Refactor with new helper xe_tlb_inval_issue_op_wait() and address
> >  nits (Niranjana)
> > v3:
> > - Avoid TOCTOU issue around CT state (Matt Brost)
> > v4:
> > - Propagate real send errors instead of masking as -ECANCELED (Sashiko)
> > 
> > Assisted-by: Claude:claude-opus-4-8
> > Signed-off-by: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
> > ---
> > drivers/gpu/drm/xe/xe_guc_tlb_inval.c   | 25 +++++++++++++++
> > drivers/gpu/drm/xe/xe_tlb_inval.c       | 42 +++++++++++++++++++++----
> > drivers/gpu/drm/xe/xe_tlb_inval.h       |  1 +
> > drivers/gpu/drm/xe/xe_tlb_inval_types.h | 10 ++++++
> > 4 files changed, 72 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > index 046d0655122f..665483bf2e67 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > @@ -98,6 +98,29 @@ static int send_tlb_inval_ggtt(struct xe_tlb_inval *tlb_inval, u32 seqno)
> > 	return -ECANCELED;
> > }
> > 
> > +/*
> > + * Emit INVAL_FULL (intra vf) to invalidate engine TLBs across all engines
> > + * within the VF.
> > + */
> > +static int send_tlb_inval_ggtt_full(struct xe_tlb_inval *tlb_inval, u32 seqno)
> > +{
> > +	struct xe_guc *guc = tlb_inval->private;
> > +	u32 action[] = {
> > +		XE_GUC_ACTION_TLB_INVALIDATION,
> > +		seqno,
> > +		MAKE_INVAL_OP(XE_GUC_TLB_INVAL_FULL),
> > +	};
> > +	int ret;
> > +
> > +	ret = send_tlb_inval(guc, action, ARRAY_SIZE(action));
> > +
> > +	/* CT unavailable means nothing runs on the engines; treat as cancelled. */
> > +	if (ret == -ENODEV || ret == -ECANCELED)
> > +		return -ECANCELED;
> 
> Looks like we don't need the check 'ret == -ECANCELED' here (redundent).
> Basically, we only need,
> if (ret == -ENODEV)
>      ret = -ECANCELED;

I think actually -ENODEV is needed because it is odd corner that only
GGTT invalidations can legitimently hit with a blind CT send which was
my suggestion.

-ENODEV is the return if the CT is disabled (cold boot start)
-ECANCELED is return if the CT is stopped (runtime toggle)

GGTT invalidations can be issued during cold boots as these are kernel
objects, PPGTT cannot because these are user objects.

Thus, I think this actually correct in the current code.

Matt

> 
> Also, It seems bit odd that other functions like send_tlb_inval_all(),
> send_tlb_inval_lmmtt() etc, has similar structure and similar documentation in
> xe_tlb_inval_types.h (regarding -ECANCELED), but doesn't do this conversion.
> So, they are not treating XE_GUC_CT_STATE_DISABLED (where guc_ct_send returns
> ENODEV) as a 'cancelled' state. May be here also we should do that for now,
> if we need fix, then it will be a fix for all of these callback functions later.
> 
> Niranjana
> 
> > +
> > +	return ret;
> > +}
> > +
> > static int send_page_reclaim(struct xe_guc *guc, u32 seqno,
> > 			     u64 gpu_addr)
> > {
> > @@ -346,6 +369,7 @@ static long tlb_inval_timeout_delay(struct xe_tlb_inval *tlb_inval)
> > static const struct xe_tlb_inval_ops guc_tlb_inval_asid_ops = {
> > 	.all = send_tlb_inval_all,
> > 	.ggtt = send_tlb_inval_ggtt,
> > +	.ggtt_full = send_tlb_inval_ggtt_full,
> > 	.ppgtt = send_tlb_inval_asid_ppgtt,
> > 	.initialized = tlb_inval_initialized,
> > 	.flush = tlb_inval_flush,
> > @@ -354,6 +378,7 @@ static const struct xe_tlb_inval_ops guc_tlb_inval_asid_ops = {
> > 
> > static const struct xe_tlb_inval_ops guc_tlb_inval_ctx_ops = {
> > 	.ggtt = send_tlb_inval_ggtt,
> > +	.ggtt_full = send_tlb_inval_ggtt_full,
> > 	.all = send_tlb_inval_all,
> > 	.ppgtt = send_tlb_inval_ctx_ppgtt,
> > 	.initialized = tlb_inval_initialized,
> > diff --git a/drivers/gpu/drm/xe/xe_tlb_inval.c b/drivers/gpu/drm/xe/xe_tlb_inval.c
> > index bbd21d393062..7c3bf32d9258 100644
> > --- a/drivers/gpu/drm/xe/xe_tlb_inval.c
> > +++ b/drivers/gpu/drm/xe/xe_tlb_inval.c
> > @@ -301,26 +301,56 @@ int xe_tlb_inval_all(struct xe_tlb_inval *tlb_inval,
> > }
> > 
> > /**
> > - * xe_tlb_inval_ggtt() - Issue a TLB invalidation for the GGTT
> > + * xe_tlb_inval_issue_op_wait() - Issue a TLB invalidation and wait
> >  * @tlb_inval: TLB invalidation client
> > - *
> > - * Issue a TLB invalidation for the GGTT. Completion of TLB is asynchronous and
> > - * caller can use the invalidation fence to wait for completion.
> > + * @op: backend invalidation hook to issue
> >  *
> >  * Return: 0 on success, negative error code on error
> >  */
> > -int xe_tlb_inval_ggtt(struct xe_tlb_inval *tlb_inval)
> > +static int xe_tlb_inval_issue_op_wait(struct xe_tlb_inval *tlb_inval,
> > +				      int (*op)(struct xe_tlb_inval *tlb_inval, u32 seqno))
> > {
> > 	struct xe_tlb_inval_fence fence, *fence_ptr = &fence;
> > 	int ret;
> > 
> > 	xe_tlb_inval_fence_init(tlb_inval, fence_ptr, true);
> > -	ret = xe_tlb_inval_issue(tlb_inval, fence_ptr, tlb_inval->ops->ggtt);
> > +	ret = xe_tlb_inval_issue(tlb_inval, fence_ptr, op);
> > 	xe_tlb_inval_fence_wait(fence_ptr);
> > 
> > 	return ret;
> > }
> > 
> > +/**
> > + * xe_tlb_inval_ggtt() - Issue a TLB invalidation for the GGTT
> > + * @tlb_inval: TLB invalidation client
> > + *
> > + * Issue a TLB invalidation for the GGTT. Completion of TLB is asynchronous and
> > + * caller can use the invalidation fence to wait for completion.
> > + *
> > + * Return: 0 on success, negative error code on error
> > + */
> > +int xe_tlb_inval_ggtt(struct xe_tlb_inval *tlb_inval)
> > +{
> > +	return xe_tlb_inval_issue_op_wait(tlb_inval, tlb_inval->ops->ggtt);
> > +}
> > +
> > +/**
> > + * xe_tlb_inval_ggtt_full() - Full engine TLB invalidation within a VF
> > + * @tlb_inval: TLB invalidation client
> > + *
> > + * Issue INVAL_FULL (intra vf) to flush engine TLBs across all engines
> > + * within the requesting VF.
> > + *
> > + * Return: 0 on success, negative error code on error
> > + */
> > +int xe_tlb_inval_ggtt_full(struct xe_tlb_inval *tlb_inval)
> > +{
> > +	if (!tlb_inval->ops->ggtt_full)
> > +		return -EOPNOTSUPP;
> > +
> > +	return xe_tlb_inval_issue_op_wait(tlb_inval, tlb_inval->ops->ggtt_full);
> > +}
> > +
> > /**
> >  * xe_tlb_inval_range() - Issue a TLB invalidation for an address range
> >  * @tlb_inval: TLB invalidation client
> > diff --git a/drivers/gpu/drm/xe/xe_tlb_inval.h b/drivers/gpu/drm/xe/xe_tlb_inval.h
> > index a76b7823a5f2..665072b4b81d 100644
> > --- a/drivers/gpu/drm/xe/xe_tlb_inval.h
> > +++ b/drivers/gpu/drm/xe/xe_tlb_inval.h
> > @@ -20,6 +20,7 @@ void xe_tlb_inval_reset(struct xe_tlb_inval *tlb_inval);
> > int xe_tlb_inval_all(struct xe_tlb_inval *tlb_inval,
> > 		     struct xe_tlb_inval_fence *fence);
> > int xe_tlb_inval_ggtt(struct xe_tlb_inval *tlb_inval);
> > +int xe_tlb_inval_ggtt_full(struct xe_tlb_inval *tlb_inval);
> > void xe_tlb_inval_vm(struct xe_tlb_inval *tlb_inval, struct xe_vm *vm);
> > int xe_tlb_inval_range(struct xe_tlb_inval *tlb_inval,
> > 		       struct xe_tlb_inval_fence *fence,
> > diff --git a/drivers/gpu/drm/xe/xe_tlb_inval_types.h b/drivers/gpu/drm/xe/xe_tlb_inval_types.h
> > index 3d1797d186fd..d77be1aedc91 100644
> > --- a/drivers/gpu/drm/xe/xe_tlb_inval_types.h
> > +++ b/drivers/gpu/drm/xe/xe_tlb_inval_types.h
> > @@ -36,6 +36,16 @@ struct xe_tlb_inval_ops {
> > 	 */
> > 	int (*ggtt)(struct xe_tlb_inval *tlb_inval, u32 seqno);
> > 
> > +	/**
> > +	 * @ggtt_full: Full engine TLB invalidation within a VF
> > +	 * @tlb_inval: TLB invalidation client
> > +	 * @seqno: Seqno of TLB invalidation
> > +	 *
> > +	 * Return 0 on success, -ECANCELED if backend is mid-reset, error on
> > +	 * failure
> > +	 */
> > +	int (*ggtt_full)(struct xe_tlb_inval *tlb_inval, u32 seqno);
> > +
> > 	/**
> > 	 * @ppgtt: Invalidate per-process translation TLBs
> > 	 * @tlb_inval: TLB invalidation client
> > -- 
> > 2.46.0
> > 
