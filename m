Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3877C5DF81
	for <intel-xe@archiver.kernel.org>; Wed, 19 Aug 2026 19:35:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FAC810E02D;
	Wed, 19 Aug 2026 19:35:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZYWJiJUZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8690210E02D
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Aug 2026 19:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787168156; x=1818704156;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=881EoJn/pit+IW1U5ruVGSP62mQ9BLlmk/dAn/kq43U=;
 b=ZYWJiJUZypc63itidle248u7mwbvYdNPirwuTQKslfZye+NsnVzVrqpf
 phbVVIAwsDvSv31llR2N6mNwY7rMLbYxaaUhUPQj8eHabV3VV8DqyZs/K
 69MobqKDHAACKKio+Tcu3PwleM07OM/zfIQv7XnIZ8hfhoUFIogncQl+q
 i6b4U0Xte7DSVnzjv0xq7JiVZIZ5vSG/U2RaOMkXQ3dJyD2MP8X/HzzMM
 DKhRPHDrgmf4ae50mFubtArFaYIVBfIPoR8RncLHkhf0YVhmBc3PaO4y9
 dZMnqB4vQrb+QySLwNCnohYlViwsY1v9p90chQWe4naog4MBD2gecNj0r Q==;
X-CSE-ConnectionGUID: dyb9LpBFQGeNLnRL+uoTZQ==
X-CSE-MsgGUID: Xlo1x9rPQ1yqW9BI5SGDYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="87814493"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="87814493"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2026 12:35:56 -0700
X-CSE-ConnectionGUID: Uk/9V3ToSwOUvwJwxGpfgQ==
X-CSE-MsgGUID: Acf4ENtCQM2RjdAJdMhiFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="269500951"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2026 12:35:56 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 19 Aug 2026 12:35:55 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 19 Aug 2026 12:35:55 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.3) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 19 Aug 2026 12:35:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bWt8Cf/mkCjM50wIRZrCPJ3H+D+UAecHv+N9SBPtCXrtxYhdGvdlAXqniOzkI826PAjPa9Vk+x/UCFCIHKzhgZkwidDD6tapRU2nn5SWtgzifG4b7taI+z9VyC2GjtCBYXby3PGAmOTF7jdKtnjS+RURY33Pr/ztGe8St9hZd5kBPmMzqry77KJH3J8ojN9EkulpnnnaLor9olIfetU/wRpAVaMaaHNSlm0Z5l6wx7nhOGF8WCPgydB4JV9REAWhQR4SUry82SKB1amg1Di6JCQACRzQbR1IHR1v8km9HbBUV0WWl0eQoHMSHc+jMv/ds7gRasoYo9GT1mgYaFXKzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mf4oRCInuUakmD6LZQCejxIDV4uD3qRvzY7w2VYH2Ik=;
 b=eGiUZtv1+57OQca05WrlIKEV/DTYo8L2rl0Wefkip7DY0SaCthLclARsqPQexNyKi9SyV3QuTniwFHXzPtPxcE2wyuyFYMrLneUm5q2LnweNocvK9zQ10Vi7vBoF1JfmnpatopLcewwa0pGhiij3P5TKBX7HivHwuFUa4E9xafiBSjLCNLTkUFbeWHtX44zUWO4yLzmEa62KppYiCW7nQqQmSx3pykkyAgqk4rz/aJW/XpSXIQy+HIlBbTJEDPM5fZwTlyquJF8mSmrYLPJiiYEkO8sHG1hH+zmSgd6VpPxXho8CNNOr9XwWorNZch1mtQe2RJCL8x02B0FnFhBiSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB9849.namprd11.prod.outlook.com (2603:10b6:806:4d7::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 19:35:53 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 19:35:46 +0000
Date: Wed, 19 Aug 2026 12:35:43 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: Jagmeet Randhawa <jagmeet.randhawa@intel.com>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2] drm/xe/guc: Fix race around q->guc->suspend_pending
 access
Message-ID: <aoYFjxHK4fcQ52Xf@gsse-cloud1.jf.intel.com>
References: <20260818183838.273486-2-jagmeet.randhawa@intel.com>
 <aoTJBly70vnRnrwK@gsse-cloud1.jf.intel.com>
 <aoTqUiIq8DMoT1dK@nvishwa1-desk>
 <aoUAYKkua2E065zU@gsse-cloud1.jf.intel.com>
 <aoUoOdNmsUHLt1p9@nvishwa1-desk>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aoUoOdNmsUHLt1p9@nvishwa1-desk>
X-ClientProxiedBy: MW3PR06CA0016.namprd06.prod.outlook.com
 (2603:10b6:303:2a::21) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB9849:EE_
X-MS-Office365-Filtering-Correlation-Id: ef766e75-99b9-4eea-5b65-08defe2910f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|18002099003|22082099003|6133799003|10067099003|56012099006|4143699003|5023799004|11063799006;
X-Microsoft-Antispam-Message-Info: nHQ1w231qSQg74Zq3vCvIMZyDgDu7qtYzNtPS4zhWTi0djox1KZuZMzx16+aAv9Tp3PAKQzPyUG9HCHIcGz5YNRCKBLPe63OSjuThudPE8yTL58Q3vTXUo3xFTxXLoUyxlmEdh7U6lyXwRc4aP9uE+40oDvlLgUoqJ3nCYLUsAzmEv8xVvHkLLglfio1GrtKH+H1Yl9CSFu5C6Tg4V1beUKSxY0FcJJVdq9hXI70rmuRiAzz+bGmCJ2+bumSvvs40FnEhbWGVqWa/oSj1wjYZTVU8gMuZdZu4wnY+5MWE3WNGPNa+Kd9WeRCtwxWpLeuo1rEle4boldqBPJVZv2URVrF1OY7WjAvKKtO1eGgDIPWuWbUFv/xnLRVWBqB5SQSupvz4mbqd1frf1J62gFn4C8LTanv5wAhTaeROMXDfulWyNWEATDYcqufg1HOwqzITJ/WEHJw6qdXgo1kKvPlhgh18Mq6Ovz0Z5NC7Jq8UYkD+nUp59Y+5ozgaEix/9sqa1/wI1D+8Yata2n2Qu3sqP+JHI0CIXApq7pnAW4FxaymwJzswmqM0OYz7qdjcgR58ftjNiqtdDc1UAZ/bfBzH9+RpnEiuZKMiKvXtZbEBBk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(18002099003)(22082099003)(6133799003)(10067099003)(56012099006)(4143699003)(5023799004)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Q//2zKcA+49ynYsXBGOm8xf6tBZwqncSf0j7DJ0O+8VWZoMvWuqinqsXrpWu?=
 =?us-ascii?Q?2WWJ+0MKHf6jofbvhRPRyYDH/Noq8M6/ZCtztQO4OZuTYEo1AVURCIGV2cug?=
 =?us-ascii?Q?C3MpbpHv2/M4PsJ2mYncaJsGLDj2/H3t8T+eNYAXtmbAghHNjrxkVhb9GIQo?=
 =?us-ascii?Q?I3mYzqIAjj6tl/bO3bvA/e3Pu1I2pffQUuyGeFdS011CehOuGk13qx1ZGSRj?=
 =?us-ascii?Q?P8Un8yn8KWoUzB4XmSdegDMnJuUntqODkOGYC8aoBmanX4b0vKU5gNpQb9sa?=
 =?us-ascii?Q?hJ3UJ+wmKmLVrZjdS7Q4poGrO/GiGWXd9exJr0xewRnXAtysfcQ1yDZ1I2yR?=
 =?us-ascii?Q?LrrDD7nOb59aeQJHxKnABACBTqr0iZUkBKcviH5279CA1eV9Ey+NxS//l9i2?=
 =?us-ascii?Q?82fLvIgj5IwOEFohN8qZGr6NRimFhEkuCGwB+MdAZgzvJxfm4dD8uI1aWZjn?=
 =?us-ascii?Q?sHr+ZrDMj9K2JZiyY0xFAvPIydvw2YNZaUAiS5LbVXFQ2wU7/aAosKLIbYhe?=
 =?us-ascii?Q?ovgz6BFvSWCQ8jdyhvAPGvcUPj0AWtsX2fmjxP01qXyynvh7a6CfPAgAkraq?=
 =?us-ascii?Q?pekfSIE3LfRCOxbpPhVguAQ+gtLSXzbdaFQ8eIX6h7Aw6hFdZnF0mWU8U9y1?=
 =?us-ascii?Q?owe/QRSBqCYWzsjDvU8RD5LwMrNB0qO84mLILSk6kSVCze8WrqAEybP7nzCk?=
 =?us-ascii?Q?nzhtGNXN58QyvwXSFXnnTEx6JlxaIfrfVM1cc2gqSuNQEfLyuDaJAkKIlYMJ?=
 =?us-ascii?Q?a3elqapw4QhZn/WGLPD9n3UEiJ61ooMLxqaOL2Pk7SlCqsQ4Vh7HA2Y4OjeE?=
 =?us-ascii?Q?gd17/RAV9/EtVRYV4TD/t55I0RcbZSY2KdB7NBAP1xFrSEQNxFZqe1k2GZQg?=
 =?us-ascii?Q?mUII4bOupLMBSgAfwjFjNg0xcRscoqAUKW6T0pFsSO8tABsN7XkfDi9Mx36w?=
 =?us-ascii?Q?uWSA0GcFOQ2M3eM5Pf2/Ti2I4/LcKnS+nOm33HBj7h1qVoSjrdRZRJGJDvSM?=
 =?us-ascii?Q?8ga57a+GGH7Z/J7dTY+VQMTLsppjMqcBV6qcFBr27b49y78nH3nyLIdw9Uyn?=
 =?us-ascii?Q?DzQ5FwnCyCgCRTXA/oAkrwJZofH3TqLWREedHMSck8YN2iIi/PwXj9ySNkoH?=
 =?us-ascii?Q?ekr8IBVHEKmgSnzcjvCLjyZFiMTbx0Esasff4ZkI/MClulRcuSBAIlJQ09y7?=
 =?us-ascii?Q?EbrQL6lQx8gbPuvZ0PyUpTxUC9RnkHj8OW4VW8vvJughsZdEl3CQyvCcHXar?=
 =?us-ascii?Q?sTHrTd0votyS0RKzVfnQETrLNudfcJrLpxGC61QCG1dCcX6+oGQq0wAyFdac?=
 =?us-ascii?Q?MRCH5yHUl68t/z1h9NVtl4j1mBEl0SOVu6ujnavR98SkEEh1hVqCRfwQ8Nwt?=
 =?us-ascii?Q?Ge5JFh0oGltxjhP32VH9SEWlL9oWhApRlSKQ93E2yg+OfYjKvesQoH+nuWPV?=
 =?us-ascii?Q?hBxiUDEwlte74b8S+H7hcX71n4hE9nKBy0Rt+I7AjZsxiY2heZ1OFr6fk5s9?=
 =?us-ascii?Q?w5DdhUOiEyjFprtSfV76BSAwOAyHsMTvHeXwkx2GmjkqGeIBn4hd6rB92C9A?=
 =?us-ascii?Q?3Kg4KKHMvmTCZhOYVSp5wqu/eITmQ0j5gJxQBDQeQX/hVYAc5lMdefAgwIzM?=
 =?us-ascii?Q?kQ5L3uW6PABnEr3m5O2fhs+zOdfrBcUrEJLzwWPjh7YTRjVg3+oHd7ybXnB5?=
 =?us-ascii?Q?T7a7Bt7yLVsxqAHH4F39N4kmNt39pvJzyL5VtsQT5fPVGjHX8GhREU9wBEX4?=
 =?us-ascii?Q?Khz73xaKhLTM5Z5w+vGOYmRY+vU07Ik=3D?=
X-Exchange-RoutingPolicyChecked: AZCDG1TgYtoCZBiIggHdIcj3voOoJlkJ5Uv+rv1gGXpwhW1ZmlD9RndjaA1AHZEKyCHMoe9DoKSPKyPcXq9Mu0NUdhrLMOXE/a8zMIgsVi3N6DzauiBU0Yi38xCiXEXz7QtCGNLp6AIVkc5QvHka3GZolYQYirdnJXiL2FjrMjpsWrpDOISfQG6rbYkMwqwxQEBrDZoLzVj9xbpz9hLakyPC4la+k97oXAypaajfsRoi8QTZV8eYF43Y0GnSUxu3CJRTClL2ntUJ1gKxcj3x47AnUEvUPXQYzHzm+fOyJs680R7LvapHO7CvVnDGShZ1jbt0EAxsaVGM+M/3EJ9OBw==
X-MS-Exchange-CrossTenant-Network-Message-Id: ef766e75-99b9-4eea-5b65-08defe2910f4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 19:35:46.6244 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +BfyW90jcgE3C8R8r7790XLP7ZbbbEBXy5YZZXE8Gw9TYOXzbLbYRdpnO4SQKiiAJVqvY/zci1RZIkt30P3Q9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB9849
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

On Tue, Aug 18, 2026 at 08:51:21PM -0700, Niranjana Vishwanathapura wrote:
> On Tue, Aug 18, 2026 at 06:01:20PM -0700, Matthew Brost wrote:
> > On Tue, Aug 18, 2026 at 04:27:14PM -0700, Niranjana Vishwanathapura wrote:
> > > On Tue, Aug 18, 2026 at 02:05:10PM -0700, Matthew Brost wrote:
> > > > On Wed, Aug 19, 2026 at 02:38:39AM +0800, Jagmeet Randhawa wrote:
> > > >
> > > > This is designed to be lockless.
> > > >
> > > > > q->guc->suspend_pending is accessed without any common lock.
> > > > > __suspend_fence_signal(), called from guc_exec_queue_kill() and the
> > > >
> > > > This is actually the problem. __suspend_fence_signal shouldn't be called
> > > > from guc_exec_queue_kill(). This can prematurely signal a suspend fence
> > > > while the hardware is still executing.
> > > >
> > > > __suspend_fence_signal should be called in two possible places:
> > > >
> > > > - Naturally in G2H handler (handle_sched_done)
> > > > - Or in global event that takes down the GuC firmware
> > > >  (guc_exec_queue_stop)
> > > >
> > > > With that, a lock isn't need because the state machine / firmware
> > > > interaction ensures everything is race free.
> > > >
> > > > So I think the solution is ensure __suspend_fence_signal is called in
> > > > the correct places rather than adding protection via a lock.
> > > >
> > > 
> > > Matt,
> > > 
> > > I think it is probably not as trivial as dropping __suspend_fence_signal()
> > > from guc_exec_queue_kill() for following reasons.
> > 
> > Let's take a step back, has existing code been linked to any bugs?
> > 
> 
> Below Sashiko report brought it up as a pre-existing issue.
> https://sashiko.dev/#/patchset/20260713202317.2187787-8-niranjana.vishwanathapura%40intel.com
> 

Ok.

> > > 
> > > 1. __suspend_fence_signal() is also called from
> > >    guc_exec_queue_suspend_timeout_ban() if suspend_wait times out.
> > > 
> > 
> > Yes, this is another example of where this should not be called.
> > 
> 
> If we do not call it, then it will leave queue as suspended forever, which
> can result in some other asserts down the line. Clearing it is part of the
> error handling recovery it looks like. As I mentioned, it will likely hit
> the !suspend_pending assert in guc_exec_queue_resume() under current code.
>

But the upper layers shouldn't call resume if suspend_wait fails, hence
we shouldn't hit that assert.

> > > 2. Calling __suspend_fence_signal() wakes up any suspend_wait(),
> > >    which otherwise will have to wait 5 seconds before timing out.
> > >    If in guc_exec_queue_kill(), if we just try to wake up suspend_wait,
> > >    without clearing suspend_pending, then a resume() might run before
> > >    TDR kicks in and hits the !suspend_pending assert.
> > > 
> > 
> > Don't do a wake here.
> > 
> 
> If we do not wake here, then every kill happended during a suspend can
> leave the suspend_wait() wait for 5 seconds to see the queue has been killed.
> 

The suspend message should either issue a H2G that will result the
suspend fence signaling in the G2H or signal it directly *after* the
queue is off the hardware.

But I do see a potenial race. The kill really needs to be ordered behind
any suspends too.

We probably want a version of this patch which only sets the kill bit
inside the KILL message:

https://patchwork.freedesktop.org/patch/732703/?series=168398&rev=4

> > > 3. Even if we drop __suspend_pending_signal() from guc_exec_queue_kill()
> > >    and guc_exec_queue_suspend_timeout_ban(), we still have
> > >    handle_sched_done() and guc_exec_queue_stop() which can race against
> > >    each other in accessing suspend_pending and clearing it.
> > 
> > I don't think this part can race.
> > 
> > - __guc_exec_queue_process_msg_suspend, this is only there for GT
> >   resets racing (I think). This should be executed before or after
> >   guc_exec_queue_stop() but not in parallel.
> > - guc_exec_queue_wait_suspend_done(), this on wait queue and we don't
> >   have lock upon reading, at least in this patch. So if justification
> >   is all readers need a lock, then this is missing in this patch.
> 
> The locking in this patch is more of a write side serialization lock
> (where supend_pending is written and where test-and-clear cases). So,
> I don't think we need locking here for reading suspend_pending.
> 
> > - guc_exec_queue_stop() touch this but this code is only reachable
> >   when GuC exec queue is stopped and CTs are down. I guess a new
> >   suspend could come in and race, so maybe in a lock is needed here.
> > 
> > > 
> > > So, probably this locking extention patch here might be simpler and
> > > effective.
> > 
> > I'm thinking this need a bit more rework and would like to get this
> > right in single patch. I'm fine with a lock, but let's at least make
> > guc_exec_queue_wait_suspend_done() consistent in using a lock and remove
> > the two places we should not be calling __suspend_pending_signal().
> > 
> 
> Dropping __suspend_fence_signal() in those places will lead to above
> mentioned issues with current state of the driver. I am worried that
> fixing those might be beyond the scope of this patch. What do you suggest?
> 

My opinion is that this patch is trying to work around broken code in
the state machine, which we have to fix anyway. I'd rather audit
everything related to kill and suspend fences and get it right, rather
than adding locking on top that we'd have to unwind later anyway. If
this were a band-aid for a reported crash, then maybe. However, this is
a Sashiko report suggesting a fix for what I see as already broken code.

Matt

> Niranjana
> 
> > Matt
> > 
> > > 
> > > Niranjana
> > > 
> > > > Matt
> > > >
> > > > > suspend-timeout ban path, clears the flag asynchronously. Meanwhile
> > > > > handle_sched_done(), guc_exec_queue_stop() and
> > > > > __guc_exec_queue_process_msg_suspend() check the flag and then call
> > > > > suspend_fence_signal(), which asserts that it is still set.
> > > > >
> > > > > As the check and suspend_fence_signal() are not atomic, the clear can
> > > > > land in between and trip the xe_gt_assert(q->guc->suspend_pending).
> > > > >
> > > > > The flag is already set and read under the per-queue msg_lock
> > > > > (xe_sched_msg_lock()) on the suspend and resume paths. Extend that same
> > > > > lock to the clear paths (kill and ban) and to the three check-then-act
> > > > > sites so the check and the signal are atomic with respect to the clear.
> > > > > In __guc_exec_queue_process_msg_suspend() only the non-sleeping branch is
> > > > > wrapped, since the other branch waits. In handle_sched_done() the flag is
> > > > > snapshotted under the lock and deregister_exec_queue() is kept outside it.
> > > > >
> > > > > v2: Document that sched->msg_lock also protects
> > > > >     guc->suspend_pending, which indicates a suspend message is in
> > > > >     flight, in addition to the sched->msgs list (Niranjana)
> > > > >
> > > > > Signed-off-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
> > > > > ---
> > > > >  drivers/gpu/drm/xe/xe_gpu_scheduler_types.h  |  5 +++-
> > > > >  drivers/gpu/drm/xe/xe_guc_exec_queue_types.h |  5 +++-
> > > > >  drivers/gpu/drm/xe/xe_guc_submit.c           | 29 ++++++++++++++++----
> > > > >  3 files changed, 32 insertions(+), 7 deletions(-)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h b/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h
> > > > > index 63d9bf92583c..78ef2e8ded4f 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h
> > > > > +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h
> > > > > @@ -47,7 +47,10 @@ struct xe_gpu_scheduler {
> > > > >  	const struct xe_sched_backend_ops	*ops;
> > > > >  	/** @msgs: list of messages to be processed in @work_process_msg */
> > > > >  	struct list_head			msgs;
> > > > > -	/** @msg_lock: Message lock */
> > > > > +	/**
> > > > > +	 * @msg_lock: Protects @msgs and guc->suspend_pending (indicates a
> > > > > +	 * suspend message is in flight) of exec queues on this scheduler.
> > > > > +	 */
> > > > >  	spinlock_t				msg_lock;
> > > > >  	/** @work_process_msg: processes messages */
> > > > >  	struct work_struct		work_process_msg;
> > > > > diff --git a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
> > > > > index d27826b36649..74b711abe257 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
> > > > > +++ b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
> > > > > @@ -52,7 +52,10 @@ struct xe_guc_exec_queue {
> > > > >  	u16 id;
> > > > >  	/** @suspend_wait: wait queue used to wait on pending suspends */
> > > > >  	wait_queue_head_t suspend_wait;
> > > > > -	/** @suspend_pending: a suspend of the exec_queue is pending */
> > > > > +	/**
> > > > > +	 * @suspend_pending: a suspend of the exec_queue is pending.
> > > > > +	 * Protected by @sched.msg_lock.
> > > > > +	 */
> > > > >  	bool suspend_pending;
> > > > >  	/**
> > > > >  	 * @suspend_count: Reference count of active suspend requests. The
> > > > > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > > index 9036f89dff7d..c565c1d32d3a 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > > @@ -1928,9 +1928,13 @@ static void __guc_exec_queue_process_msg_suspend(struct xe_sched_msg *msg)
> > > > >  			set_exec_queue_suspended(q);
> > > > >  			disable_scheduling(q, false);
> > > > >  		}
> > > > > -	} else if (q->guc->suspend_pending) {
> > > > > -		set_exec_queue_suspended(q);
> > > > > -		suspend_fence_signal(q);
> > > > > +	} else {
> > > > > +		xe_sched_msg_lock(&q->guc->sched);
> > > > > +		if (q->guc->suspend_pending) {
> > > > > +			set_exec_queue_suspended(q);
> > > > > +			suspend_fence_signal(q);
> > > > > +		}
> > > > > +		xe_sched_msg_unlock(&q->guc->sched);
> > > > >  	}
> > > > >  }
> > > > >
> > > > > @@ -2130,7 +2134,9 @@ static void guc_exec_queue_kill(struct xe_exec_queue *q)
> > > > >  {
> > > > >  	trace_xe_exec_queue_kill(q);
> > > > >  	set_exec_queue_killed(q);
> > > > > +	xe_sched_msg_lock(&q->guc->sched);
> > > > >  	__suspend_fence_signal(q);
> > > > > +	xe_sched_msg_unlock(&q->guc->sched);
> > > > >  	xe_guc_exec_queue_trigger_cleanup(q);
> > > > >  }
> > > > >
> > > > > @@ -2392,11 +2398,15 @@ static void guc_exec_queue_suspend_timeout_ban(struct xe_exec_queue *q)
> > > > >  	 */
> > > > >  	if (xe_exec_queue_is_multi_queue(q)) {
> > > > >  		set_exec_queue_group_banned(q);
> > > > > +		xe_sched_msg_lock(&q->guc->sched);
> > > > >  		__suspend_fence_signal(q);
> > > > > +		xe_sched_msg_unlock(&q->guc->sched);
> > > > >  		xe_guc_exec_queue_group_trigger_cleanup(q);
> > > > >  	} else {
> > > > >  		set_exec_queue_banned(q);
> > > > > +		xe_sched_msg_lock(&q->guc->sched);
> > > > >  		__suspend_fence_signal(q);
> > > > > +		xe_sched_msg_unlock(&q->guc->sched);
> > > > >  		xe_guc_exec_queue_trigger_cleanup(q);
> > > > >  	}
> > > > >  }
> > > > > @@ -2614,10 +2624,12 @@ static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
> > > > >  		if (exec_queue_destroyed(q))
> > > > >  			do_destroy = true;
> > > > >  	}
> > > > > +	xe_sched_msg_lock(sched);
> > > > >  	if (q->guc->suspend_pending) {
> > > > >  		set_exec_queue_suspended(q);
> > > > >  		suspend_fence_signal(q);
> > > > >  	}
> > > > > +	xe_sched_msg_unlock(sched);
> > > > >  	atomic_and(EXEC_QUEUE_STATE_WEDGED | EXEC_QUEUE_STATE_BANNED |
> > > > >  		   EXEC_QUEUE_STATE_KILLED | EXEC_QUEUE_STATE_DESTROYED |
> > > > >  		   EXEC_QUEUE_STATE_SUSPENDED,
> > > > > @@ -3222,13 +3234,20 @@ static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q,
> > > > >  		smp_wmb();
> > > > >  		wake_up_all(&guc->ct.wq);
> > > > >  	} else {
> > > > > +		bool was_pending;
> > > > > +
> > > > >  		xe_gt_assert(guc_to_gt(guc), runnable_state == 0);
> > > > >  		xe_gt_assert(guc_to_gt(guc), exec_queue_pending_disable(q));
> > > > >
> > > > > -		if (q->guc->suspend_pending) {
> > > > > +		xe_sched_msg_lock(&q->guc->sched);
> > > > > +		was_pending = q->guc->suspend_pending;
> > > > > +		if (was_pending) {
> > > > >  			clear_exec_queue_pending_disable(q);
> > > > >  			suspend_fence_signal(q);
> > > > > -		} else {
> > > > > +		}
> > > > > +		xe_sched_msg_unlock(&q->guc->sched);
> > > > > +
> > > > > +		if (!was_pending) {
> > > > >  			if (exec_queue_banned(q)) {
> > > > >  				smp_wmb();
> > > > >  				wake_up_all(&guc->ct.wq);
> > > > > --
> > > > > 2.53.0
> > > > >
