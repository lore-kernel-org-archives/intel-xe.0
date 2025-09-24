Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77207CAC5A5
	for <intel-xe@archiver.kernel.org>; Wed, 24 Sep 2025 20:18:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3730B10E7CC;
	Wed, 24 Sep 2025 20:18:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="StJSrWVH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5252910E7CC
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Sep 2025 20:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758745080; x=1790281080;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=a/X+muFRuAaKNrAZxhULi+w5anBy7WvStn2fKPKaaiE=;
 b=StJSrWVHE7t6K0Y1+PxLJCsxU+V4G6PWCnvi9+ZIz/rdnVG8aJUUghon
 8xZvdXOhzY0zSPw1QAkISHSPMLayhNxwCHv1NBezUGjEIlETPTdhj97A0
 pMS1KgGMY4RrTMunXRM+n3CmByqw/HaW1WSDtm+H4yMNvMIxk//DNfEGX
 9KGRgx64PhGNY4BERgZ939fNef+mUJvdpjiAgqQw/AoMTMYNPNDukHKnb
 6/n19EyKt5rIZZ+dT+O5dJXQqp1Uz/fzVBc5lUpycSEwD5KYzFTKXxcWe
 4h7RjosRlsvVzxAlPiolaFjgcZdxG0Wsf0S3Gosh7/L80e+a7X5h7nI7b A==;
X-CSE-ConnectionGUID: xid4vGkOSFSkGGvvTdLjUQ==
X-CSE-MsgGUID: hmPo0pvTTsuJ9gTpbUtzwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11563"; a="61105548"
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; d="scan'208";a="61105548"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 13:18:00 -0700
X-CSE-ConnectionGUID: 2vsY/71hRpCnkkY2FAHnuw==
X-CSE-MsgGUID: vBuHVNvbRBSt3z9EgJNlYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; d="scan'208";a="181402417"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 13:18:00 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 24 Sep 2025 13:17:59 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 24 Sep 2025 13:17:59 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.9) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 24 Sep 2025 13:17:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mvdmityiguZ9nHWzj4ZcJbSNo6foMyRgfmb9ZUD8zczbEOXo0ekUmnvrkZh3U5BNvorjg53QH7RS2c7eB126VYDPMLY/DbRxWiX5cRbutcQukoUPyWv74YM2QFnZgLOdwl9KBWPs/ydd8cFr+la1usviL+UqYOrFMFWnXzs20rYIOFOPgxOTHDIUYWQOvoFBE9N5Q1A6yx07f7GPQWmGOwtHbqwUkJETmGfOai2DkdfnRKiA1unE80XnL/WaEAYh4DBH5UnD0WdfSrZ0gmYSj0fSAJU4DZ93yZZV/cxfebQU7fo7ADqK8+MddCvhu6qWbqbqdA1+5l7M6No+tY0OeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tjJa75gK4RyZEmhCJ1c+MBxvAVxLCPs6uC3GgbwjiG4=;
 b=Z/LbFeEX1pK9c2spa1fUFlB8WTjeGJo4L1abifsLaVlNK0ssb7p0FgMz91f/5/ONFIwXx+a3UNcWa3VaHSQHDaYs/TewAX/Iq8xPYOHyZUe9kL3A9IidTzWEl/QIP3tXatTCoafMCrUPwX2adS18QYV9C4lu2GlbkY13rXCJ+QGtDy9fPEr3foTjBQ+zbzgcU3TK+fWdfTeGiz/6FLWGjswfq+Js/QMh1VfNnyTgjrKIcb8Ef+OJEdI2BPf+Rdl4GTBeMfC0V5A9b39sHSfyx0S/zuTOWF/duZV2V68Io8qPvQCaGCnf31ixCXGgXZH8f5xI1dbPaUwQYS4jdJZA6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH3PR11MB8093.namprd11.prod.outlook.com (2603:10b6:610:139::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Wed, 24 Sep
 2025 20:17:55 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9137.018; Wed, 24 Sep 2025
 20:17:54 +0000
Date: Wed, 24 Sep 2025 13:17:52 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 02/34] Revert "drm/xe/vf: Rebase exec queue parallel
 commands during migration recovery"
Message-ID: <aNRR8HBPKXniSmBD@lstrano-desk.jf.intel.com>
References: <20250924011601.888293-1-matthew.brost@intel.com>
 <20250924011601.888293-3-matthew.brost@intel.com>
 <f7d9e968-b6cf-460f-bc98-5408dde828cb@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <f7d9e968-b6cf-460f-bc98-5408dde828cb@intel.com>
X-ClientProxiedBy: BYAPR11CA0086.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::27) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH3PR11MB8093:EE_
X-MS-Office365-Filtering-Correlation-Id: 30675e80-c6ea-4b45-4738-08ddfba7720a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?oT2EFDzewuIe8v4M33i6Ip3dXsMx6JlnF7KvTQKFayDiG4I7ChRMsMCOXXGo?=
 =?us-ascii?Q?JFmzAnkWb/5tCMKLQmPy/ltVfcy8NOlbY8CH8J0kyoVD7qL4ighEkymAUUsE?=
 =?us-ascii?Q?gZsWZ+U4CSeZ0hBca6WdCssLpOJiGZ5qhf/PHOxZGqxhiyuOC38Q08IXUwwg?=
 =?us-ascii?Q?JrBeIkROGJsPqU4UUm2hnTFob74lqAWcWpJ2P5yYDXc9yaIYQPpIvyTtxqNA?=
 =?us-ascii?Q?zVQfk//aEN9GtmwrvxzMbFj51SNDPSKpsF5aSwtSNNlcV/1BQ2GONfLwufJg?=
 =?us-ascii?Q?Gb4PgYHMhCVO0JuFjvk9HGDTnB41bclijKWHpL55SnmDr6qbqOrvW+3xCVQ3?=
 =?us-ascii?Q?TLsW8fYhaVG2oubfu451kHwIv+Lqu0/cjo3j1R+uSpSSstS70RUxrYWDAzIb?=
 =?us-ascii?Q?omM3XvpEoKwsAqf0R8kHk66wRY1tIcsjUHjFexemX1QgPxNWnRDmCr+PPuMO?=
 =?us-ascii?Q?8SfwR/X3WIMVwtus1gLRBAbQbF7rB0hVkmBVVUL92teP7hkvrJeRIQwKAUcx?=
 =?us-ascii?Q?UjosJTJrAT+LmEruC+1+biG6KK/8ORroSQZcVtMkBbSTW0IEvukhCgDn3Wl0?=
 =?us-ascii?Q?OL06Y6zNqIsDozPmct9ipCF3FtPFLVpcuAnl/Q2u6Jgs90fIOJvh7cgjDsrK?=
 =?us-ascii?Q?hZVTYeAmOkMqfLm7oNV286GPOJjh6uuHUHsjk4aXMJNnmvlwpbWaf8W5FSFk?=
 =?us-ascii?Q?7X2pam0irFrjJwIFH+0E/WsFqb+ilh2aojE1XJk46EL9Ubm7TGc2e6jUm413?=
 =?us-ascii?Q?WMhT1rSUDaCdZ0iLdhYUKLNj6iNZtWhNCaYwunkgxEmq3C/ut+WdE3Lrk20f?=
 =?us-ascii?Q?Bg4R1t9vjzbCNXl3nAHqWdKaZHIyCkUWNUvvxg7vfxKesmz+bEsaR5v55BUW?=
 =?us-ascii?Q?QDNA8ujLhZaOUcTygupzhCR01zarsH08wQobqrLRyB98TgLCO9mTKcWdzuTc?=
 =?us-ascii?Q?CDcW4AhDu2z0DwJSGdqy7MvYqXDU257rFH/s7oJtxBgGzD3qBgU9WLRK8V9F?=
 =?us-ascii?Q?uQksrm8tFWWSHibZik7QbIfwUIi6/sJccZxZu7flJy+zmuUFCUUQoczc87BR?=
 =?us-ascii?Q?Z715N20UbNgpu1pyQAjJc5WFhavrPFtRVY580aIi5KwDY1kiqAhLd/52TXLI?=
 =?us-ascii?Q?Ps+pahElN40KLyp88J7zxlBAQAUBwF0AcZwgLF68ExduyBclHFU3CQ/0s2jq?=
 =?us-ascii?Q?6dyPSjoXglrFlU2PBJOYUmV1+nbCjI0aOTLHjSjFSdxXwZDRB/jD5Y/0SQ72?=
 =?us-ascii?Q?hVcfxI0cPmG1348i5B3psWaNmpakQ41uwngwyiW244Pc8FvZm7bjgaTiOcLV?=
 =?us-ascii?Q?/6osYAvLKsktTSSNA0XDWn0dl582Rw+5wDe7qusWNrjeJNybxHYQrEKgLDyM?=
 =?us-ascii?Q?MjiWxmKiUR9aODTIYbcI9MfTf7mKr3Mwdl8emEQPTgvEN6S71XZK+oThYpMj?=
 =?us-ascii?Q?LOnMeMk86rY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?u3zeNVn8lRRxCcOkqueuaxLMKQFN01M/iVT7QcDAXuX0X+cKFa/aYFKDG8RV?=
 =?us-ascii?Q?V28fyX/CJ2ot1kOy+dvS6tiEsSxY6PUJVbsGWlmuTX1ualXMhUh3f9Gv8VwS?=
 =?us-ascii?Q?tQTT+1+hOPrjKiynwqtinA8XCxN7VmfJWrBnLJvpt+lvXhuInE6PiH3vakZl?=
 =?us-ascii?Q?9HZSfHzwy/6BC3WvSrctf7KLzng+iLImilcSNKLna2eC1aySN/kGnD9bya4g?=
 =?us-ascii?Q?bNzJew93c/CdunZZq3/RrL82/VS7X+6NgUUPGgYRzW5dPygp0NLJ9LAhdHUW?=
 =?us-ascii?Q?L+M+kp49/tO3uImgZGbGfiobERskxeMQH9NZfq37JVLHQK+9AmYeOJiftCgs?=
 =?us-ascii?Q?adEZezuzOflxK/sZ2TxxtAvvectgZfg9ykT2tVrd3HaNIRzSC4WELnNcVKn3?=
 =?us-ascii?Q?e/3985euvXNiUM4j2A0LkoDvxanJSCLvFZBltzhGztvC9U5NlJxPVg4HMMSt?=
 =?us-ascii?Q?vTNg+4FScdvAKxWp8KUhSKqAx5ebGR8v2KEtWI7Sp07LCQtiVnT0uLVeqYFK?=
 =?us-ascii?Q?a2RUkdSo+KSYnwzFR70Vq5sR646rZyOEitGmONylDktnDdLswTwPsSyDrk9/?=
 =?us-ascii?Q?hNZbodicPidQl4PK6NycfsePbuoJTh5zguiLnYz5O0S2EEGs51Syg1sTINPn?=
 =?us-ascii?Q?ss4sQApesBaSzIU57wARRjTj0dv2Nxu7nDOEZmTMM/rAnmmOKXXMn3xsJMQn?=
 =?us-ascii?Q?U8aQrM4MTF/6vRvsz9SHbF+T5zLeR5BhRjtzoOeY7xyhWHb1hiqr4/0CyPDp?=
 =?us-ascii?Q?OWvbMrlRaxzjaGixompL3LbosYxepXtdIQ66nrp/GQs/d0/9Bxaui/xZhiY+?=
 =?us-ascii?Q?x+v3TTjYkXzeREmU13ThI7ynvylFK9s5OBC6EMb4ae3EGnduB2duNnlTqcIg?=
 =?us-ascii?Q?JLbvQyVlko0ds61M0voCz/id5XouQIVZpSIIELqKGLjG8v0aiblL9eF6aavz?=
 =?us-ascii?Q?/SD5j3umq/YsKMOZ2UpzmIrv1xR2bz3uBg05lq0/x/ZAbYY4gLndZpdRFSmm?=
 =?us-ascii?Q?V/ROY+xLN5QS63GLvvPx5Ys15GNKfodk3iMimQrfNQ56gJh2idk+s789x/kE?=
 =?us-ascii?Q?IURypp6b6AvVfwS6KPz0UcAjk3poR8kC2FcXP2qyzRBOajP1CQ6RfwJKZcCC?=
 =?us-ascii?Q?/phG17290H/nCO6VTpklGC/m+pJkhQggImYU6i0AzM5h04CAycBXzQOJrQZd?=
 =?us-ascii?Q?jOIdXZ+Kwva+AWg/G8zXjnXYo+INQcdAUc205Gu2qvOatWvY50y6pXWW41Pg?=
 =?us-ascii?Q?zz9/GIvgJmm2SSOmlYhkwx43A3lKuVqVb4KwrmcdGjw2WQqGSbj0f7QnUkn2?=
 =?us-ascii?Q?Bk5+WwU1nOY8dIsCUvAoo6+UfcmCVefQWUHmD+mKcfDGKabh1ylggmbocpxy?=
 =?us-ascii?Q?UGm3wMhRIuBhV3HLg++tUMf0QU2Q9C+3iXaL4GlAtHxJq1dTpz1wQNowI8rN?=
 =?us-ascii?Q?+5vCIgekQgkTPjZt0nolwFXdCf6ki2EHB9SIsVwcOhA9/Nu8W+Xa3D5HQtSX?=
 =?us-ascii?Q?KvS1ZALL+0ls6ZuWD7+lpp5S1jt8AaEhDdTXe6XGPXBXoPsfsHpmUANoiN+a?=
 =?us-ascii?Q?hrjUBnrtUL5XTbeCquuc53o8n3kjkgOrIOcV5efcUh80Om97SycrSqzHVgML?=
 =?us-ascii?Q?9Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 30675e80-c6ea-4b45-4738-08ddfba7720a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 20:17:54.9391 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J4K+Y5IRJzISMoSpwuNl7eEA1K1g4IIMrAR5uxf8Ved5UaSfqbhogVPaFQd8ePAKxh8t+OejIqxDv2+v5wMCHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8093
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

On Wed, Sep 24, 2025 at 11:32:07AM +0200, Michal Wajdeczko wrote:
> 
> 
> On 9/24/2025 3:15 AM, Matthew Brost wrote:
> > This reverts commit ba180a362128cb71d16c3f0ce6645448011d2607.
> 
> we still need the "why" part here, at least something like:
> 
> "Due to change in the VF migration recovery design this code
> is not needed any more."
> 

Lucas also mentioned this me, I'll add explaination in commit messages
for the reverts.

Matt

> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/abi/guc_actions_abi.h |  8 ----
> >  drivers/gpu/drm/xe/xe_guc_submit.c       | 54 ------------------------
> >  2 files changed, 62 deletions(-)
