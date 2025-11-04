Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64FFACCF9E3
	for <intel-xe@archiver.kernel.org>; Tue,  4 Nov 2025 17:41:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14C4F892A1;
	Tue,  4 Nov 2025 17:41:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q5E00PLU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B353B10E29A
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Nov 2025 17:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762278116; x=1793814116;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=VvAoFYhsl+Im27P58Irpp6IaBZUUzprT+SHl0/1eKdI=;
 b=Q5E00PLUa576WXO23PWZr3IxAU69HJUXfAqFIe2vEhKE8mj86eA/+gQQ
 Jesjqe8iTiLXYh3RD0JfH1QsKfgiPMiaxv61l8lMC09TZ/XWE/FC2OS2D
 SUNuML4JzyW1WDgO3TJ8BsLaaRyDH8UN1TdRYv0295jhe1w4Q8QG8ZEKb
 xo0519dw6ugmeelfR3T/uvjV2Tb5Y813l0iTF86U80g3ogzD2txUmShZg
 Vrac6k/D8pro6CmBZo+IY02f3z1qO/K8DQ9csMc/xKOyXkRTrm8GftUmj
 FcQ/VujpAHNsOTmkV3kI1ZVpNDzttroxlqYZD3TdxeucZV1GtTp4wsZaW Q==;
X-CSE-ConnectionGUID: cFGqpzF3TK+bsfCIjfQ7Xw==
X-CSE-MsgGUID: 9pX9ekIfRTuejlJqfNsXoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="68036837"
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="68036837"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 09:41:56 -0800
X-CSE-ConnectionGUID: wnASd78pRA+fxvJ4EgpDww==
X-CSE-MsgGUID: kfxsgDEqTuOcptMPOHYQrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="186460655"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 09:41:56 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 4 Nov 2025 09:41:54 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 4 Nov 2025 09:41:54 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.48) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 4 Nov 2025 09:41:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j8jnRB9ZPSXiCDd2oByqUAS0o1NJNOUvgb5olQxbZv/IIPV48EmAp5zilKogTMtsvzHXeRujSznbxdOjSMgTT0p4YB7kjn4MilO20t1uMpz1GIwqotJF9Pn60ru4HioSPceFNcuGH/8/DE1Xb6rSOmrvtgwDgpi115hX4C2LjgaX/PEjUyRMn5oA2pZx4Hd9zTRMy1VNRPC4lsTNfkeX9PmgR0RF4Xjy6LOZ8q+2vbyX0I6UNs+38qAlK2NN+nVD2ZvYy1pYJJWwv8VSWAftPvYne0qVxTUr90/111CFCLAzn/8zlLWzBSVWRF7G8q6taSwv0E+k/e9XA3CVZf0d6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uN4Lp5fNfRl0Aec9QuTuQkONlWsQbZz/hoPgb4FcW2A=;
 b=jpp8e1M/3FtdSHQqkcthGVP1UBpWGsXx/Sp6GTlSY4pKiLwtjaTl2m2uPRarrGliGjW2io9UKyot7JPViUK46r5Y7x2nMCR5byBRugyloyQr3gDhf+Oir0O3cYswYA8mqmklFA8Rld5xseC3xKZ4aDPSVeQ//IcZ9DFwMzJTnnosoCpxOB4dAekZ1WVI50krMS3HMkZuFyEQItvY/4rrBw4iPgNxmdUeujz2e0XaMjWE70onikW/+12jSn6Ef9MwUGzfAitqnn59o8olCDBjqglwyQUinXimcxwmSnENXilUyDBmVWfLUmwBbt5qysFuvuuUgM+1SStEusfpUwTqEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MN2PR11MB4680.namprd11.prod.outlook.com (2603:10b6:208:26d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Tue, 4 Nov
 2025 17:41:51 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9275.013; Tue, 4 Nov 2025
 17:41:50 +0000
Date: Tue, 4 Nov 2025 09:41:48 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 03/16] drm/xe/multi_queue: Add GuC interface for multi
 queue support
Message-ID: <aQo63JqpgA+ooy4Q@lstrano-desk.jf.intel.com>
References: <20251031182936.1882062-1-niranjana.vishwanathapura@intel.com>
 <20251031182936.1882062-4-niranjana.vishwanathapura@intel.com>
 <aQZMTMd7JftUTcy5@lstrano-desk.jf.intel.com>
 <aQmHhz5htpispAv-@nvishwa1-desk>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aQmHhz5htpispAv-@nvishwa1-desk>
X-ClientProxiedBy: MW4PR04CA0059.namprd04.prod.outlook.com
 (2603:10b6:303:6a::34) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MN2PR11MB4680:EE_
X-MS-Office365-Filtering-Correlation-Id: 17129a2c-fe93-4a7b-2939-08de1bc96f73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?aDeM6eaellLrMHlSMLs6XOJkC3RLSMzjfE1NcG7zNgimDm6GHAi5hLr0ppBY?=
 =?us-ascii?Q?NK7RcR6oVy8O7ZivuF3zQPYzJf817CBP9FgXXJDUnOGwgKQGc45r3N1QGTV8?=
 =?us-ascii?Q?TJVmyqnpUQuPPJi9ZftVsmfiH9lrvNkpZPMYQgas2CA8XGKl8zlMVa9SHkIQ?=
 =?us-ascii?Q?8i+fteI4pqo2rOrUsWlwtgK46wHRQmxO5+ZpN66Qzq/e1oJySRjCA2pA+cs7?=
 =?us-ascii?Q?ddjx8kqevex3xnSHi8vxUwqdUZbkR+GrmuHhMs3PcY+lrckbyQPa01tp2QPT?=
 =?us-ascii?Q?JTkRT9bcng9lMm3bKqLyvLrdIwXJ+eM3wThOoaxlRka0bkLIKHQBH5WzxVO7?=
 =?us-ascii?Q?QhtQ1DOBvb0P1a0Jloj2Gls7uuj1COE88ZjP+BAVsVEnijlNhpa+f9rJzUf5?=
 =?us-ascii?Q?mpYuOjgbgYMwI0p7o0Nxw5zFSdkN+JJgutUgkjOPBIZFKEaHlalKWBYIwyh+?=
 =?us-ascii?Q?+QMAxNoZ1tgr+CC2HHkNTplMZjO3VxqMnu18KZHIxdyTg0jtMa5mA7S2PlIK?=
 =?us-ascii?Q?enZQ7+LfcMmje61UT9yGP35DnAutQ078u8Ef2JhT1q7HR6K6g8j0B7xejXlr?=
 =?us-ascii?Q?bfcl0jTpzVfCbnSV9ViQoq2qD5C7jTDzMa/GLBWsXlL5T/w2dQWP6L0XAIw7?=
 =?us-ascii?Q?yIuEn3iv+s4wTISB5wkuK3hlU3eQ95F8P+xI6NyRzZzout9IC3cziYNQGtYm?=
 =?us-ascii?Q?4GpxcJE7WQ7K3zdS7c9ElERdc1twYfe0jG4FLIj48HtjDNpy3dcMTcWNB5Ds?=
 =?us-ascii?Q?Q0EzZWlIjWE1GVW6VyZm4frVoPq8IhRTrIh643s0JBwUdnQRdOQ5DMqhiONo?=
 =?us-ascii?Q?lumU3jAe9w+t9LBXCi9bBGx5qC2cQgmGvIne22+ExATbMBd5kTJO435dX4Ml?=
 =?us-ascii?Q?h5FTxtOweIuvyqUFKSanebn8KrqQLAG+9I5m/mlIsTilze7N5Z5zJqaGQgkf?=
 =?us-ascii?Q?v7WKiTGiAiRza/BrHhjX17tGIhg6eFLGWCy4qZDHE3zmJPlg9w/LbdYYslOY?=
 =?us-ascii?Q?Wf9xnYLogK7kYH9DnHwX4FspO728o3WpSxXqCtT7UkEfJARohglLAHwNkW3a?=
 =?us-ascii?Q?uqfp9ys2NfvSXr15J9LUw+oJMBEK92Y8/kEQKjQSn/af8aAb69TUN56p4Td0?=
 =?us-ascii?Q?jnaESX3LSCiZ6/l7T6YkLgEFVBVaK6Gf+r0zs+uaI7ZcSvE1b/Ova0Oe2Htm?=
 =?us-ascii?Q?xEhGUk2r7EQysDm/avWwp3IE/F3qZfe0wcuwA1rvpuiNR2ohidiG9dl4KLpJ?=
 =?us-ascii?Q?8SZmnZ4CqU+EWYybS+hIcri2WlIqdq90omQxE4NoHBmgRKZsqsVJtFMblZWi?=
 =?us-ascii?Q?Ydp7itxUnMfJcjcux0VJk1B3u0zKuD4J/tVrcJlsjlKsnQTeBkyYRhzN8fe5?=
 =?us-ascii?Q?4lZeQho4AckZqu4qjQFhz7/psM9R0cpRvI6Sz8GpNkCcQOc2cQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KRlGBk4G5uroQrAGC54q6RatNRYOMGY3UWo6b2GYGKzXOh9aLP26SEQP5x6A?=
 =?us-ascii?Q?wbmNQassFtnYyipFzi6B/MWsQakpzntuPjVxWHVimAKKnneHwsvQQiUOibFI?=
 =?us-ascii?Q?H0K71PyZYOyBLiUvsCXyUXaujffKStVMUrCrPM7QLQDqEd/1gLovzAMqX4HM?=
 =?us-ascii?Q?qoS+hOY8vI4iu1CxaJpLG2DMZbuFSd8C1mqfN5noxDz5MwiqDXba5HETs3Df?=
 =?us-ascii?Q?hVXdn15gfoe+VXXmPelpAtPG6EOfS+GOL2naglNKlP4c6eCydq1wC1NH663K?=
 =?us-ascii?Q?HCzq2n/L+Em5sVt+kS98imbqKmbb1UjgFWgNSTEisSrgFylymtb7MjemaODn?=
 =?us-ascii?Q?RmBNohi5J5HpDC8LDzMDQR4wlo+9/zu4f0aPgFWwj85Rh/+1FHyBkm/I/+CS?=
 =?us-ascii?Q?8uxW7AtyqZaz4NX1QzWah7dMD/Vx60G7zPaQdxLxW/K0AcTFYr1BZ/0nP9PB?=
 =?us-ascii?Q?f2FL3Fl/g+QZsBTm94HcofR0Lm+A/IA5wknIRWHE2QYJuMpXIekKPcPigIDc?=
 =?us-ascii?Q?b8Rt0QAJp9B0trpHza07kyihRpITC+tOKiAs8nqnqFraechbRw2EwRk/FEeQ?=
 =?us-ascii?Q?JctV5d3OJndZYnc9JaCgmqXEkHVPvw5ccoKvsvSj4D0nUynBUKl/h5kDAMUV?=
 =?us-ascii?Q?S7lFwkZ88xIO6fhKZuQm1EZPoD3TnX169Raka8TpUcStE+CNjFs9bjYMKODa?=
 =?us-ascii?Q?WcDhjeIhGIXVsWAL0W2b5hmGu5xBO8n4fMQT2V41vPgxvqwKUjFfQvLUnNj4?=
 =?us-ascii?Q?TILvnw3kxlA9GwOYFBjS8QjJoswFKDtVXohpBiy/kvLXTTLTuTJXpCNg5riW?=
 =?us-ascii?Q?WoHvILvoZqmxGmP16cK7uOEhgJ+jSEuic+3Hvl9NszAoIlmPDKjo0KyiD8/q?=
 =?us-ascii?Q?hC4HPCDZGsd/YEa212kSM5mcyVZEY1DVZD+B/ULOYmMWiF+X73dzDrbF1jpD?=
 =?us-ascii?Q?qXj9oda98UGKRIVanifRe6YT9sFh874ou4zNQvNSWyge4qliDcB9iYtj0A4n?=
 =?us-ascii?Q?U/8XPdfWg12uJozfgy10bXkEalCDDGGHvaKjfdeWc2aMxwL+tByT6twaWO4f?=
 =?us-ascii?Q?5etAasi+swB2c4e2mMd5Hf62KbpfYkPFdkxmuEa6GfJkwO0/hd4nHGB1GQL6?=
 =?us-ascii?Q?VVLTngarJaci/NhYcCH4XGSaWQpJQcaTrIqIsJatW4uC4fb3lS1UQZiYTEGo?=
 =?us-ascii?Q?P0ZfsgnZggWQNbHD+qXfDdH1xMZy55wjbDe+jo/2g/rrgJP+eGiR1YBV6vaP?=
 =?us-ascii?Q?oAZZFcx/q44YWsZHXZFtz8tlBNaIoG/fWHVf8pndILjx3uEp/26IYsVsz/vI?=
 =?us-ascii?Q?recTmeCaBX3gLi9bOXexUcMrjGoAnyMC7Jt6qEJ4QXQAt3oaPXerryK0ygmB?=
 =?us-ascii?Q?6eWLZyyOWJEajtXys3QSkaF7CW6bgL9M4A53IBYeqB4fxJIrqqTuzCA9bTTY?=
 =?us-ascii?Q?HPut8CVcc/H/fkzMgoaSrZUzhpTK9s8q0dhyduXvyo0D8hxrm2kbVJrRTbxx?=
 =?us-ascii?Q?QOIXc7nZePsc/7C7kX/qiiq2ltZQYXJ4EXPzj23emdY+SkEcnkUyxb2v4Wn4?=
 =?us-ascii?Q?UI23e6IiEtJxsDeeAaYwIRB7YyP5/jOKgfwrYVr6SaDbJJQN1+crChQcYVzA?=
 =?us-ascii?Q?LA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 17129a2c-fe93-4a7b-2939-08de1bc96f73
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 17:41:50.8870 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pha4NcWqZ7n1iT2QGcxtWiefa3VuES9MDSEPQE583VpiCxrfJUh7Kjz8pj8rAJzQ5DVaQ+Z+7OoP0CKNVliIhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4680
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

On Mon, Nov 03, 2025 at 08:56:39PM -0800, Niranjana Vishwanathapura wrote:
> On Sat, Nov 01, 2025 at 11:07:08AM -0700, Matthew Brost wrote:
> > On Fri, Oct 31, 2025 at 11:29:23AM -0700, Niranjana Vishwanathapura wrote:
> > > Implement GuC commands and response along with the Context
> > > Group Page (CGP) interface for multi queue support.
> > > 
> > > Ensure that only primary queue (q0) of a multi queue group
> > > communicate with GuC. The secondary queues of the group only
> > > need to maintain LRCA and interface with drm scheduler.
> > > 
> > > Use primary queue's submit_wq for all secondary queues of a multi
> > > queue group. This serialization avoids any locking around CGP
> > > synchronization with GuC.
> > > 
> > 
> > Not a complete review, but a few comments.
> > 
> > > Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> > > Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/abi/guc_actions_abi.h |   3 +
> > >  drivers/gpu/drm/xe/xe_exec_queue_types.h |   2 +
> > >  drivers/gpu/drm/xe/xe_guc_ct.c           |   4 +
> > >  drivers/gpu/drm/xe/xe_guc_fwif.h         |   3 +
> > >  drivers/gpu/drm/xe/xe_guc_submit.c       | 302 +++++++++++++++++++----
> > >  drivers/gpu/drm/xe/xe_guc_submit.h       |   1 +
> > >  6 files changed, 270 insertions(+), 45 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> > > index 47756e4674a1..3e9fbed9cda6 100644
> > > --- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> > > +++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> > > @@ -139,6 +139,9 @@ enum xe_guc_action {
> > >  	XE_GUC_ACTION_DEREGISTER_G2G = 0x4508,
> > >  	XE_GUC_ACTION_DEREGISTER_CONTEXT_DONE = 0x4600,
> > >  	XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_LRC = 0x4601,
> > > +	XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_QUEUE = 0x4602,
> > > +	XE_GUC_ACTION_MULTI_QUEUE_CONTEXT_CGP_SYNC = 0x4603,
> > > +	XE_GUC_ACTION_NOTIFY_MULTI_QUEUE_CONTEXT_CGP_SYNC_DONE = 0x4604,
> > >  	XE_GUC_ACTION_CLIENT_SOFT_RESET = 0x5507,
> > >  	XE_GUC_ACTION_SET_ENG_UTIL_BUFF = 0x550A,
> > >  	XE_GUC_ACTION_SET_DEVICE_ENGINE_ACTIVITY_BUFFER = 0x550C,
> > > diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > > index 3856776df5c4..38e47b003259 100644
> > > --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > > @@ -47,6 +47,8 @@ struct xe_exec_queue_group {
> > >  	struct xarray xa;
> > >  	/** @list_lock: Secondary queue list lock */
> > >  	struct mutex list_lock;
> > > +	/** @sync_pending: CGP_SYNC_DONE g2h response pending */
> > > +	bool sync_pending;
> > >  };
> > > 
> > >  /**
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> > > index e68953ef3a00..48b5006eb080 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> > > @@ -1304,6 +1304,7 @@ static int parse_g2h_event(struct xe_guc_ct *ct, u32 *msg, u32 len)
> > >  	lockdep_assert_held(&ct->lock);
> > > 
> > >  	switch (action) {
> > > +	case XE_GUC_ACTION_NOTIFY_MULTI_QUEUE_CONTEXT_CGP_SYNC_DONE:
> > >  	case XE_GUC_ACTION_SCHED_CONTEXT_MODE_DONE:
> > >  	case XE_GUC_ACTION_DEREGISTER_CONTEXT_DONE:
> > >  	case XE_GUC_ACTION_SCHED_ENGINE_MODE_DONE:
> > > @@ -1570,6 +1571,9 @@ static int process_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
> > >  		ret = xe_guc_g2g_test_notification(guc, payload, adj_len);
> > >  		break;
> > >  #endif
> > > +	case XE_GUC_ACTION_NOTIFY_MULTI_QUEUE_CONTEXT_CGP_SYNC_DONE:
> > > +		ret = xe_guc_exec_queue_cgp_sync_done_handler(guc, payload, adj_len);
> > > +		break;
> > >  	default:
> > >  		xe_gt_err(gt, "unexpected G2H action 0x%04x\n", action);
> > >  	}
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
> > > index c90dd266e9cf..610dfb2f1cb5 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_fwif.h
> > > +++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
> > > @@ -16,6 +16,7 @@
> > >  #define G2H_LEN_DW_DEREGISTER_CONTEXT		3
> > >  #define G2H_LEN_DW_TLB_INVALIDATE		3
> > >  #define G2H_LEN_DW_G2G_NOTIFY_MIN		3
> > > +#define G2H_LEN_DW_MULTI_QUEUE_CONTEXT		4
> > 
> > This value doesn't look right. I'm not sure where 4 is coming from.
> > 
> > The length of XE_GUC_ACTION_NOTIFY_MULTI_QUEUE_CONTEXT_CGP_SYNC_DONE
> > appears to be 2. So with a value of 4, I believe the G2H credits will
> > leak.
> > 
> > You can run a multi-q test, then check the following debugfs:
> > 
> > cat /sys/kernel/debug/dri/0/gt0/uc/guc_info
> > 
> > In particular, these are the interesting fields:
> > 
> > G2H CTB (all sizes in DW):
> >        ...
> > 	resv_space: 16384
> >        ...
> > 	g2h outstanding: 0
> > 
> > ^^^ This is what an idle G2H should look like. I suspect both G2H
> > outstanding values will be non-zero, and resv_space will continuously
> > decrease when running a multi-queue test.
> > 
> 
> Looks like G2H_LEN_DW_MULTI_QUEUE_CONTEXT should be 3.
> 2 dwords header (HXG event) and 1 dword payload. Will change.
> 
> However, I always saw 'g2h outsanding' being 0 and resv_space being 16384,
> after running the multi-queue tests, irrespective of whether I set
> G2H_LEN_DW_MULTI_QUEUE_CONTEXT to 3 or 4.
> 

That is really odd the credits didn't get out screwed up. I'd double
check on this as that doesn't seem right. Perhaps the runtime PM refs
drop to zero and the GuC gets reloaded? We are removing that though here
[1]. Maybe try with this series.

[1] https://patchwork.freedesktop.org/series/154017/

I still think the value should be 2 here as this like deregister_done
which delivers a guc_id in msg[0].

> > > 
> > >  #define GUC_ID_MAX			65535
> > >  #define GUC_ID_UNKNOWN			0xffffffff
> > > @@ -62,6 +63,8 @@ struct guc_ctxt_registration_info {
> > >  	u32 wq_base_lo;
> > >  	u32 wq_base_hi;
> > >  	u32 wq_size;
> > > +	u32 cgp_lo;
> > > +	u32 cgp_hi;
> > >  	u32 hwlrca_lo;
> > >  	u32 hwlrca_hi;
> > >  };
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > index d4ffdb71ef3d..d2aa9a2524e7 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > @@ -46,6 +46,7 @@
> > >  #include "xe_trace.h"
> > >  #include "xe_uc_fw.h"
> > >  #include "xe_vm.h"
> > > +#include "xe_bo.h"
> > > 
> > >  static struct xe_guc *
> > >  exec_queue_to_guc(struct xe_exec_queue *q)
> > > @@ -541,7 +542,8 @@ static void init_policies(struct xe_guc *guc, struct xe_exec_queue *q)
> > >  	u32 slpc_exec_queue_freq_req = 0;
> > >  	u32 preempt_timeout_us = q->sched_props.preempt_timeout_us;
> > > 
> > > -	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q));
> > > +	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q) &&
> > > +		     !xe_exec_queue_is_multi_queue_secondary(q));
> > > 
> > >  	if (q->flags & EXEC_QUEUE_FLAG_LOW_LATENCY)
> > >  		slpc_exec_queue_freq_req |= SLPC_CTX_FREQ_REQ_IS_COMPUTE;
> > > @@ -561,6 +563,8 @@ static void set_min_preemption_timeout(struct xe_guc *guc, struct xe_exec_queue
> > >  {
> > >  	struct exec_queue_policy policy;
> > > 
> > > +	xe_assert(guc_to_xe(guc), !xe_exec_queue_is_multi_queue_secondary(q));
> > > +
> > >  	__guc_exec_queue_policy_start_klv(&policy, q->guc->id);
> > >  	__guc_exec_queue_policy_add_preemption_timeout(&policy, 1);
> > > 
> > > @@ -575,6 +579,130 @@ static void set_min_preemption_timeout(struct xe_guc *guc, struct xe_exec_queue
> > >  	xe_map_wr_field(xe_, &map_, 0, struct guc_submit_parallel_scratch, \
> > >  			field_, val_)
> > > 
> > > +#define CGP_VERSION_MAJOR_SHIFT	8
> > > +
> > > +static void xe_guc_exec_queue_group_cgp_update(struct xe_device *xe,
> > > +					       struct xe_exec_queue *q)
> > > +{
> > > +	struct xe_exec_queue_group *group = q->multi_queue.group;
> > > +	u32 guc_id = group->primary->guc->id;
> > > +
> > > +	/* Currently implementing CGP version 1.0 */
> > > +	xe_map_wr(xe, &group->cgp_bo->vmap, 0, u32,
> > > +		  1 << CGP_VERSION_MAJOR_SHIFT);
> > > +
> > > +	xe_map_wr(xe, &group->cgp_bo->vmap,
> > > +		  (32 + q->multi_queue.pos * 2) * sizeof(u32),
> > > +		  u32, lower_32_bits(xe_lrc_descriptor(q->lrc[0])));
> > > +
> > > +	xe_map_wr(xe, &group->cgp_bo->vmap,
> > > +		  (33 + q->multi_queue.pos * 2) * sizeof(u32),
> > > +		  u32, guc_id);
> > > +
> > > +	if (q->multi_queue.pos / 32) {
> > > +		xe_map_wr(xe, &group->cgp_bo->vmap, 17 * sizeof(u32),
> > > +			  u32, BIT(q->multi_queue.pos % 32));
> > > +		xe_map_wr(xe, &group->cgp_bo->vmap, 16 * sizeof(u32), u32, 0);
> > > +	} else {
> > > +		xe_map_wr(xe, &group->cgp_bo->vmap, 16 * sizeof(u32),
> > > +			  u32, BIT(q->multi_queue.pos));
> > > +		xe_map_wr(xe, &group->cgp_bo->vmap, 17 * sizeof(u32), u32, 0);
> > > +	}
> > > +}
> > > +
> > > +static void xe_guc_exec_queue_group_cgp_sync(struct xe_guc *guc,
> > > +					     struct xe_exec_queue *q,
> > > +					     const u32 *action, u32 len)
> > > +{
> > > +	struct xe_exec_queue_group *group = q->multi_queue.group;
> > > +	struct xe_device *xe = guc_to_xe(guc);
> > > +	long ret;
> > > +
> > > +	/*
> > > +	 * As all queues of a multi queue group use single drm scheduler
> > > +	 * submit workqueue, CGP synchronization with GuC are serialized.
> > > +	 * Hence, no locking is required here.
> > > +	 * Wait for any pending CGP_SYNC_DONE response before updating the
> > > +	 * CGP page and sending CGP_SYNC message.
> > > +	 */
> > > +	ret = wait_event_timeout(guc->ct.wq,
> > > +				 !READ_ONCE(group->sync_pending) ||
> > > +				 xe_guc_read_stopped(guc), HZ);
> > > +	if (!ret || xe_guc_read_stopped(guc)) {
> > > +		drm_err(&xe->drm, "Wait for CGP_SYNC_DONE response failed!\n");
> > 
> > If this occurs you need a GT reset which should detect
> > group->sync_pending in guc_exec_queue_stop and clean it up.
> > 
> 
> hmm...ok, let me give that a try. Not sure how urgent is this as ideally
> it should never occur.
> 

It shouldn't occur, but for correctness best to at least attempt to get
this right upfront.

> > Also here is where VF migration needs to be considered. The
> > wait_event_timeout should pop out on vf_recovery being set, but not
> > trigger a GT reset. In this case we need likely need some per secondary
> > queue tracking state to figure out which secondary queues lost the CPG
> > syncs so that flow can recover. We can figure out part out a bit later
> > though.
> 
> Hmm...ok.
> 
> > 
> > > +		/* Something wrong with the CTB or GuC, no need to proceed */
> > > +		return;
> > > +	}
> > > +
> > > +	xe_guc_exec_queue_group_cgp_update(xe, q);
> > > +
> > > +	WRITE_ONCE(group->sync_pending, true);
> > > +	xe_guc_ct_send(&guc->ct, action, len, G2H_LEN_DW_MULTI_QUEUE_CONTEXT, 1);
> > 
> > The problem here appears to be two fold:
> > 
> > - The value of G2H_LEN_DW_MULTI_QUEUE_CONTEXT looks incorrect
> > - On multi-q registration both G2H credits and count are set but multi-q
> >  register doesn't produce a G2H response. See my comment above thinga
> >  getting leaked, that can't happen as PM will be off and eventually G2H
> >  credits will run out and deadlock the CT channel leading to a GT reset.
> > 
> 
> Responded above.
> 
> > > +}
> > > +
> > > +static void __register_exec_queue(struct xe_guc *guc,
> > > +				  struct guc_ctxt_registration_info *info)
> > > +{
> > > +	u32 action[] = {
> > > +		XE_GUC_ACTION_REGISTER_CONTEXT,
> > > +		info->flags,
> > > +		info->context_idx,
> > > +		info->engine_class,
> > > +		info->engine_submit_mask,
> > > +		info->wq_desc_lo,
> > > +		info->wq_desc_hi,
> > > +		info->wq_base_lo,
> > > +		info->wq_base_hi,
> > > +		info->wq_size,
> > > +		info->hwlrca_lo,
> > > +		info->hwlrca_hi,
> > > +	};
> > > +
> > > +	/* explicitly checks some fields that we might fixup later */
> > > +	xe_gt_assert(guc_to_gt(guc), info->wq_desc_lo ==
> > > +		     action[XE_GUC_REGISTER_CONTEXT_DATA_5_WQ_DESC_ADDR_LOWER]);
> > > +	xe_gt_assert(guc_to_gt(guc), info->wq_base_lo ==
> > > +		     action[XE_GUC_REGISTER_CONTEXT_DATA_7_WQ_BUF_BASE_LOWER]);
> > > +	xe_gt_assert(guc_to_gt(guc), info->hwlrca_lo ==
> > > +		     action[XE_GUC_REGISTER_CONTEXT_DATA_10_HW_LRC_ADDR]);
> > > +
> > > +	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action), 0, 0);
> > > +}
> > > +
> > > +static void __register_exec_queue_group(struct xe_guc *guc,
> > > +					struct xe_exec_queue *q,
> > > +					struct guc_ctxt_registration_info *info)
> > > +{
> > > +#define MAX_MULTI_QUEUE_REG_SIZE	(8)
> > > +	struct xe_device *xe = guc_to_xe(guc);
> > > +	u32 action[MAX_MULTI_QUEUE_REG_SIZE];
> > > +	int len = 0;
> > > +
> > > +	if (xe_exec_queue_is_multi_queue_primary(q)) {
> > > +		action[len++] = XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_QUEUE;
> > 
> > Again as mentioned above, this command doesn't require G2H credits
> > unless this produces a XE_GUC_ACTION_NOTIFY_MULTI_QUEUE_CONTEXT_CGP_SYNC_DONE
> > response.
> > 
> 
> Yes, XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_QUEUE will have a
> XE_GUC_ACTION_NOTIFY_MULTI_QUEUE_CONTEXT_CGP_SYNC_DONE response from GuC.
> 

Ah, ok. That at least explains why g2h outstanding is the correct value,
doesn't explain the credits though. Can you add a comment indicating
XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_QUEUE results in
XE_GUC_ACTION_NOTIFY_MULTI_QUEUE_CONTEXT_CGP_SYNC_DONE?

> > > +		action[len++] = info->flags;
> > > +		action[len++] = info->context_idx;
> > > +		action[len++] = info->engine_class;
> > > +		action[len++] = info->engine_submit_mask;
> > > +		action[len++] = 0; /* Reserved */
> > > +		action[len++] = info->cgp_lo;
> > > +		action[len++] = info->cgp_hi;
> > > +	} else {
> > > +		/*
> > > +		 * No need to wait before CGP sync since CT descriptors
> > > +		 * should be ordered.
> > > +		 */
> > > +
> > > +		action[len++] = XE_GUC_ACTION_MULTI_QUEUE_CONTEXT_CGP_SYNC;
> > > +		action[len++] = q->multi_queue.group->primary->guc->id;
> > > +	}
> > > +
> > > +	xe_assert(xe, len <= MAX_MULTI_QUEUE_REG_SIZE);
> > > +#undef MAX_MULTI_QUEUE_REG_SIZE
> > > +
> > > +	xe_guc_exec_queue_group_cgp_sync(guc, q, action, len);
> > > +}
> > > +
> > >  static void __register_mlrc_exec_queue(struct xe_guc *guc,
> > >  				       struct xe_exec_queue *q,
> > >  				       struct guc_ctxt_registration_info *info)
> > > @@ -622,35 +750,6 @@ static void __register_mlrc_exec_queue(struct xe_guc *guc,
> > >  	xe_guc_ct_send(&guc->ct, action, len, 0, 0);
> > >  }
> > > 
> > > -static void __register_exec_queue(struct xe_guc *guc,
> > > -				  struct guc_ctxt_registration_info *info)
> > > -{
> > > -	u32 action[] = {
> > > -		XE_GUC_ACTION_REGISTER_CONTEXT,
> > > -		info->flags,
> > > -		info->context_idx,
> > > -		info->engine_class,
> > > -		info->engine_submit_mask,
> > > -		info->wq_desc_lo,
> > > -		info->wq_desc_hi,
> > > -		info->wq_base_lo,
> > > -		info->wq_base_hi,
> > > -		info->wq_size,
> > > -		info->hwlrca_lo,
> > > -		info->hwlrca_hi,
> > > -	};
> > > -
> > > -	/* explicitly checks some fields that we might fixup later */
> > > -	xe_gt_assert(guc_to_gt(guc), info->wq_desc_lo ==
> > > -		     action[XE_GUC_REGISTER_CONTEXT_DATA_5_WQ_DESC_ADDR_LOWER]);
> > > -	xe_gt_assert(guc_to_gt(guc), info->wq_base_lo ==
> > > -		     action[XE_GUC_REGISTER_CONTEXT_DATA_7_WQ_BUF_BASE_LOWER]);
> > > -	xe_gt_assert(guc_to_gt(guc), info->hwlrca_lo ==
> > > -		     action[XE_GUC_REGISTER_CONTEXT_DATA_10_HW_LRC_ADDR]);
> > > -
> > > -	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action), 0, 0);
> > > -}
> > > -
> > >  static void register_exec_queue(struct xe_exec_queue *q, int ctx_type)
> > >  {
> > >  	struct xe_guc *guc = exec_queue_to_guc(q);
> > > @@ -670,6 +769,13 @@ static void register_exec_queue(struct xe_exec_queue *q, int ctx_type)
> > >  	info.flags = CONTEXT_REGISTRATION_FLAG_KMD |
> > >  		FIELD_PREP(CONTEXT_REGISTRATION_FLAG_TYPE, ctx_type);
> > > 
> > > +	if (xe_exec_queue_is_multi_queue(q)) {
> > > +		struct xe_exec_queue_group *group = q->multi_queue.group;
> > > +
> > > +		info.cgp_lo = xe_bo_ggtt_addr(group->cgp_bo);
> > > +		info.cgp_hi = 0;
> > > +	}
> > > +
> > >  	if (xe_exec_queue_is_parallel(q)) {
> > >  		u64 ggtt_addr = xe_lrc_parallel_ggtt_addr(lrc);
> > >  		struct iosys_map map = xe_lrc_parallel_map(lrc);
> > > @@ -700,11 +806,15 @@ static void register_exec_queue(struct xe_exec_queue *q, int ctx_type)
> > > 
> > >  	set_exec_queue_registered(q);
> > >  	trace_xe_exec_queue_register(q);
> > > -	if (xe_exec_queue_is_parallel(q))
> > > +	if (xe_exec_queue_is_multi_queue(q))
> > > +		__register_exec_queue_group(guc, q, &info);
> > > +	else if (xe_exec_queue_is_parallel(q))
> > >  		__register_mlrc_exec_queue(guc, q, &info);
> > >  	else
> > >  		__register_exec_queue(guc, &info);
> > > -	init_policies(guc, q);
> > > +
> > > +	if (!xe_exec_queue_is_multi_queue_secondary(q))
> > > +		init_policies(guc, q);
> > >  }
> > > 
> > >  static u32 wq_space_until_wrap(struct xe_exec_queue *q)
> > > @@ -833,6 +943,12 @@ static void submit_exec_queue(struct xe_exec_queue *q, struct xe_sched_job *job)
> > >  	if (exec_queue_suspended(q) && !xe_exec_queue_is_parallel(q))
> > >  		return;
> > > 
> > > +	/*
> > > +	 * All queues in a multi-queue group will use the primary queue
> > > +	 * of the group to interface with GuC.
> > > +	 */
> > > +	q = xe_exec_queue_multi_queue_primary(q);
> > > +
> > >  	if (!exec_queue_enabled(q) && !exec_queue_suspended(q)) {
> > >  		action[len++] = XE_GUC_ACTION_SCHED_CONTEXT_MODE_SET;
> > >  		action[len++] = q->guc->id;
> > > @@ -879,6 +995,18 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
> > >  	trace_xe_sched_job_run(job);
> > > 
> > >  	if (!killed_or_banned_or_wedged && !xe_sched_job_is_error(job)) {
> > > +		if (xe_exec_queue_is_multi_queue_secondary(q)) {
> > > +			struct xe_exec_queue *primary = xe_exec_queue_multi_queue_primary(q);
> > > +
> > > +			if (exec_queue_killed_or_banned_or_wedged(primary)) {
> > > +				killed_or_banned_or_wedged = true;
> > > +				goto run_job_out;
> > > +			}
> > > +
> > > +			if (!exec_queue_registered(primary))
> > > +				register_exec_queue(primary, GUC_CONTEXT_NORMAL);
> > > +		}
> > > +
> > >  		if (!exec_queue_registered(q))
> > >  			register_exec_queue(q, GUC_CONTEXT_NORMAL);
> > >  		if (!job->skip_emit)
> > > @@ -887,6 +1015,7 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
> > >  		job->skip_emit = false;
> > >  	}
> > > 
> > > +run_job_out:
> > >  	/*
> > >  	 * We don't care about job-fence ordering in LR VMs because these fences
> > >  	 * are never exported; they are used solely to keep jobs on the pending
> > > @@ -912,6 +1041,11 @@ int xe_guc_read_stopped(struct xe_guc *guc)
> > >  	return atomic_read(&guc->submission_state.stopped);
> > >  }
> > > 
> > > +static void handle_multi_queue_secondary_sched_done(struct xe_guc *guc,
> > > +						    struct xe_exec_queue *q,
> > > +						    u32 runnable_state);
> > > +static void handle_deregister_done(struct xe_guc *guc, struct xe_exec_queue *q);
> > > +
> > >  #define MAKE_SCHED_CONTEXT_ACTION(q, enable_disable)			\
> > >  	u32 action[] = {						\
> > >  		XE_GUC_ACTION_SCHED_CONTEXT_MODE_SET,			\
> > > @@ -925,7 +1059,9 @@ static void disable_scheduling_deregister(struct xe_guc *guc,
> > >  	MAKE_SCHED_CONTEXT_ACTION(q, DISABLE);
> > >  	int ret;
> > > 
> > > -	set_min_preemption_timeout(guc, q);
> > > +	if (!xe_exec_queue_is_multi_queue_secondary(q))
> > > +		set_min_preemption_timeout(guc, q);
> > > +
> > >  	smp_rmb();
> > >  	ret = wait_event_timeout(guc->ct.wq,
> > >  				 (!exec_queue_pending_enable(q) &&
> > > @@ -953,9 +1089,12 @@ static void disable_scheduling_deregister(struct xe_guc *guc,
> > >  	 * Reserve space for both G2H here as the 2nd G2H is sent from a G2H
> > >  	 * handler and we are not allowed to reserved G2H space in handlers.
> > >  	 */
> > > -	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
> > > -		       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET +
> > > -		       G2H_LEN_DW_DEREGISTER_CONTEXT, 2);
> > > +	if (xe_exec_queue_is_multi_queue_secondary(q))
> > > +		handle_multi_queue_secondary_sched_done(guc, q, 0);
> > > +	else
> > > +		xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
> > > +			       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET +
> > > +			       G2H_LEN_DW_DEREGISTER_CONTEXT, 2);
> > >  }
> > > 
> > >  static void xe_guc_exec_queue_trigger_cleanup(struct xe_exec_queue *q)
> > > @@ -1161,8 +1300,11 @@ static void enable_scheduling(struct xe_exec_queue *q)
> > >  	set_exec_queue_enabled(q);
> > >  	trace_xe_exec_queue_scheduling_enable(q);
> > > 
> > > -	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
> > > -		       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, 1);
> > > +	if (xe_exec_queue_is_multi_queue_secondary(q))
> > > +		handle_multi_queue_secondary_sched_done(guc, q, 1);
> > > +	else
> > > +		xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
> > > +			       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, 1);
> > > 
> > >  	ret = wait_event_timeout(guc->ct.wq,
> > >  				 !exec_queue_pending_enable(q) ||
> > > @@ -1186,14 +1328,17 @@ static void disable_scheduling(struct xe_exec_queue *q, bool immediate)
> > >  	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q));
> > >  	xe_gt_assert(guc_to_gt(guc), !exec_queue_pending_disable(q));
> > > 
> > > -	if (immediate)
> > > +	if (immediate && !xe_exec_queue_is_multi_queue_secondary(q))
> > >  		set_min_preemption_timeout(guc, q);
> > >  	clear_exec_queue_enabled(q);
> > >  	set_exec_queue_pending_disable(q);
> > >  	trace_xe_exec_queue_scheduling_disable(q);
> > > 
> > > -	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
> > > -		       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, 1);
> > > +	if (xe_exec_queue_is_multi_queue_secondary(q))
> > > +		handle_multi_queue_secondary_sched_done(guc, q, 0);
> > > +	else
> > > +		xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
> > > +			       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, 1);
> > >  }
> > > 
> > >  static void __deregister_exec_queue(struct xe_guc *guc, struct xe_exec_queue *q)
> > > @@ -1211,8 +1356,11 @@ static void __deregister_exec_queue(struct xe_guc *guc, struct xe_exec_queue *q)
> > >  	set_exec_queue_destroyed(q);
> > >  	trace_xe_exec_queue_deregister(q);
> > > 
> > > -	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
> > > -		       G2H_LEN_DW_DEREGISTER_CONTEXT, 1);
> > > +	if (xe_exec_queue_is_multi_queue_secondary(q))
> > > +		handle_deregister_done(guc, q);
> > > +	else
> > > +		xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
> > > +			       G2H_LEN_DW_DEREGISTER_CONTEXT, 1);
> > >  }
> > > 
> > >  static enum drm_gpu_sched_stat
> > > @@ -1660,6 +1808,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
> > >  {
> > >  	struct xe_gpu_scheduler *sched;
> > >  	struct xe_guc *guc = exec_queue_to_guc(q);
> > > +	struct workqueue_struct *submit_wq = NULL;
> > >  	struct xe_guc_exec_queue *ge;
> > >  	long timeout;
> > >  	int err, i;
> > > @@ -1680,8 +1829,20 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
> > > 
> > >  	timeout = (q->vm && xe_vm_in_lr_mode(q->vm)) ? MAX_SCHEDULE_TIMEOUT :
> > >  		  msecs_to_jiffies(q->sched_props.job_timeout_ms);
> > > +
> > > +	/*
> > > +	 * Use primary queue's submit_wq for all secondary queues of a
> > > +	 * multi queue group. This serialization avoids any locking around
> > > +	 * CGP synchronization with GuC.
> > > +	 */
> > > +	if (xe_exec_queue_is_multi_queue_secondary(q)) {
> > > +		struct xe_exec_queue *primary = xe_exec_queue_multi_queue_primary(q);
> > > +
> > > +		submit_wq = primary->guc->sched.base.submit_wq;
> > > +	}
> > > +
> > >  	err = xe_sched_init(&ge->sched, &drm_sched_ops, &xe_sched_ops,
> > > -			    NULL, xe_lrc_ring_size() / MAX_JOB_SIZE_BYTES, 64,
> > > +			    submit_wq, xe_lrc_ring_size() / MAX_JOB_SIZE_BYTES, 64,
> > >  			    timeout, guc_to_gt(guc)->ordered_wq, NULL,
> > >  			    q->name, gt_to_xe(q->gt)->drm.dev);
> > >  	if (err)
> > > @@ -2418,7 +2579,11 @@ static void deregister_exec_queue(struct xe_guc *guc, struct xe_exec_queue *q)
> > > 
> > >  	trace_xe_exec_queue_deregister(q);
> > > 
> > > -	xe_guc_ct_send_g2h_handler(&guc->ct, action, ARRAY_SIZE(action));
> > > +	if (xe_exec_queue_is_multi_queue_secondary(q))
> > > +		handle_deregister_done(guc, q);
> > > +	else
> > > +		xe_guc_ct_send_g2h_handler(&guc->ct, action,
> > > +					   ARRAY_SIZE(action));
> > >  }
> > > 
> > >  static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q,
> > > @@ -2468,6 +2633,15 @@ static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q,
> > >  	}
> > >  }
> > > 
> > > +static void handle_multi_queue_secondary_sched_done(struct xe_guc *guc,
> > > +						    struct xe_exec_queue *q,
> > > +						    u32 runnable_state)
> > > +{
> > > +	mutex_lock(&guc->ct.lock);
> > 
> > I don't think you need the CT lock here. This per-queue state which
> > should be safe to modify without the any lock. The CT lock never
> > protects queue state, we just happen to have it in G2H responses because
> > of how the CT layer works.
> > 
> 
> Without the CT lock here, I get lockdep warning from _guc_ct_send_locked(),
> h2g_has_room() etc. So, I guess we need to keep it.
> 

Ah, yes. I missed that part. If you send another H2G you will indeed
need the CT lock. Can you add a comment around that? Easy to forget
this.

Matt

> > > +	handle_sched_done(guc, q, runnable_state);
> > > +	mutex_unlock(&guc->ct.lock);
> > > +}
> > > +
> > >  int xe_guc_sched_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
> > >  {
> > >  	struct xe_exec_queue *q;
> > > @@ -2672,6 +2846,44 @@ int xe_guc_exec_queue_reset_failure_handler(struct xe_guc *guc, u32 *msg, u32 le
> > >  	return 0;
> > >  }
> > > 
> > > +/**
> > > + * xe_guc_exec_queue_cgp_sync_done_handler - CGP synchronization done handler
> > > + * @guc: guc
> > > + * @msg: message indicating CGP sync done
> > > + * @len: length of message
> > > + *
> > > + * Set multi queue group's sync_pending flag to false and wakeup anyone waiting
> > > + * for CGP synchronization to complete.
> > > + *
> > > + * Return: 0 on success, -EPROTO for malformed messages.
> > > + */
> > > +int xe_guc_exec_queue_cgp_sync_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
> > > +{
> > > +	struct xe_device *xe = guc_to_xe(guc);
> > > +	struct xe_exec_queue *q;
> > > +	u32 guc_id = msg[0];
> > > +
> > > +	if (unlikely(len < 1)) {
> > > +		drm_err(&xe->drm, "Invalid CGP_SYNC_DONE length %u", len);
> > > +		return -EPROTO;
> > > +	}
> > > +
> > > +	q = g2h_exec_queue_lookup(guc, guc_id);
> > > +	if (unlikely(!q))
> > > +		return -EPROTO;
> > > +
> > > +	if (!xe_exec_queue_is_multi_queue_primary(q)) {
> > > +		drm_err(&xe->drm, "Unexpected CGP_SYNC_DONE response");
> > > +		return -EPROTO;
> > > +	}
> > > +
> > > +	/* Wakeup the serialized cgp update wait */
> > > +	WRITE_ONCE(q->multi_queue.group->sync_pending, false);
> > 
> > So here - I suspect we need to associate the CGP_SYNC_DONE with a
> > secondary queue state tracking in order to get VF migration to work.
> > Again we can figure his part of a bit later but should be considered.
> > 
> 
> Hmm..ok.
> 
> > Matt
> > 
> > > +	wake_up_all(&guc->ct.wq);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > >  static void
> > >  guc_exec_queue_wq_snapshot_capture(struct xe_exec_queue *q,
> > >  				   struct xe_guc_submit_exec_queue_snapshot *snapshot)
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
> > > index b49a2748ec46..abfa94bce391 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_submit.h
> > > +++ b/drivers/gpu/drm/xe/xe_guc_submit.h
> > > @@ -34,6 +34,7 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
> > >  					       u32 len);
> > >  int xe_guc_exec_queue_reset_failure_handler(struct xe_guc *guc, u32 *msg, u32 len);
> > >  int xe_guc_error_capture_handler(struct xe_guc *guc, u32 *msg, u32 len);
> > > +int xe_guc_exec_queue_cgp_sync_done_handler(struct xe_guc *guc, u32 *msg, u32 len);
> > > 
> > >  struct xe_guc_submit_exec_queue_snapshot *
> > >  xe_guc_exec_queue_snapshot_capture(struct xe_exec_queue *q);
> > > --
> > > 2.43.0
> > > 
