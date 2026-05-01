Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDA14CCFA13
	for <intel-xe@archiver.kernel.org>; Fri,  1 May 2026 18:08:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A392E10E565;
	Fri,  1 May 2026 18:08:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MnGLnyVm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0646D10E551
 for <intel-xe@lists.freedesktop.org>; Fri,  1 May 2026 18:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777658903; x=1809194903;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=tKLDs0Uw6PyGL0vgJmEoUUedJthdWmdtTh9Ei+rJoxA=;
 b=MnGLnyVmSbwI0O2HYST0upWj6OgySBaCz4T4yN4T60+IuwsdXkOy4gEq
 iFxx/L797kwbkqUGnPjTr3wpxKxme8WXi4y2WP1q3mvwUTWJ7PM6E83q+
 ZckyMARmnCbECQ0hTFdj/Y0XSOtA46xLUCIJV77OpveIHV7SduJh/EzNo
 9hs+tXBO+pn5sHszfDrPvD9peNIs6XCfeH6ryynqWnAmYK8MafQnvoCPG
 /o25FEkSshZ9s+lMofH5+HWtzXTYnP39fSPUjVOp00cnNbqjx3wSJBNby
 rmy9QU9olp5+tbXkXar7sFTDJbsSwdRHbVNN7C2BMtMPpNrowvfs4S+od g==;
X-CSE-ConnectionGUID: V/uO9PqSSwWbbR7iPjdiwQ==
X-CSE-MsgGUID: bYOYLOvETiSOpzqPj4BGvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11773"; a="82491837"
X-IronPort-AV: E=Sophos;i="6.23,210,1770624000"; d="scan'208";a="82491837"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2026 11:08:21 -0700
X-CSE-ConnectionGUID: 8wravAjXQ3GyrNQsC0mxXQ==
X-CSE-MsgGUID: Q9PP03ipQse7BvFycfYeKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,210,1770624000"; d="scan'208";a="239249606"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2026 11:08:22 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 1 May 2026 11:08:21 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 1 May 2026 11:08:21 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.58) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 1 May 2026 11:08:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SxrFDNddyOJEl2N/ustg43BpCYkthRPoYeSlHeLyfqfZrF4AD1KmPRC+J1L7FAtJ4KhS40L3eY9/5cHmctyDIlsmg/aJinrlLVeh76PJiP+GeibSN9RGhOFRF1gOm9F2aGMYZ2+IcBrNxEPU4P94CDRtLj+OHIerWhuJclvfVn5ttcYBdzO0bmoX6uWeYFGc21E0rCyMn7A6enKIyUkTEe9PG9dJdMQBLCwXTqTZnFQrW7bzEJtrJQFatwnvs4j2p/7grjcjs3T4frGtSm6a0+pDdJjaxr5PmKwzB5yHkQzhf58S40dskLu4QVtRuUnB2fMhVCKOOFbLddkbs4l/cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OyB+uyCTawq8hokQXfhCJRd+oYz8izD0MlTKySSk0DQ=;
 b=i5xAxXo/lSrgvbZXlFxTX1tsaNlo+k7bq+mp5cNtrBEXDSR0bou3gJE8N7MiSJ9ZE0hWuFs4nVdtZXlvWXWGz6+MBHY56UzgiHcrdn7M8Iw7Pwjcl0y6pdAFc+cRdi4YREWkCYHK4+wFt+UUK16bM73HBRA5MhQnK5B+5uA4R0ao9ltCEqpkOzQlOG3cnicemNQHi/YAyU3hFnzfhsVzQAgHue78dCWzmDLT8UQ1wQ1crC7lKQ6yNT3qvYnurfosB1PRTEcvJ9fLT09IA3B1CDcECe/Xjg4duOed/rKZ+wCHzCn8iK4hdegW97nujnXEyKy4WAqEvp8Zzp1La42Uaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB5006.namprd11.prod.outlook.com (2603:10b6:a03:2db::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.22; Fri, 1 May
 2026 18:08:13 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%7]) with mapi id 15.20.9870.022; Fri, 1 May 2026
 18:08:13 +0000
Date: Fri, 1 May 2026 11:08:11 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Arvind Yadav <arvind.yadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <tejas.upadhyay@intel.com>
Subject: Re: [PATCH v2] drm/xe/madvise: Track purgeability with BO-local
 counters
Message-ID: <afTsC3ysmXd1FLH5@gsse-cloud1.jf.intel.com>
References: <20260430101130.1365878-1-arvind.yadav@intel.com>
 <afOvSTNaIZk7WKoy@gsse-cloud1.jf.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <afOvSTNaIZk7WKoy@gsse-cloud1.jf.intel.com>
X-ClientProxiedBy: BY3PR05CA0016.namprd05.prod.outlook.com
 (2603:10b6:a03:254::21) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB5006:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e855277-1b55-4792-425c-08dea7ac9c53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: DHq75ol7AEGDmNyVSqN3lxT94D//KR+0V/FxsGUFM+oxJoC6/i6FpWGCd2P903VSNsYwDQ7BQxLt9ApviajnYVrw/n8mrF7qiA4a490VF66P0G/lcDkjnc8Bewr+K5n05xshmswepL3O/C0+S3BN0EjGOTOBBZql9aEx3A4aiZpYEqaZHBl8wOyNl2dEKuNnPvzB+6/UfSO67IV5/7yz1WEwq+OLIUie69YXSmNxWenpLYsYBGW+XmuJlJNy49yfJMqzw6/TDD/0HiEANW1T/WQqJ/yflm8PfUNhHSjuWqlt6bU1/Q61Sex3M+c/95CUXPQrJT7AgvmiBMIC1KH2tmsWlVmiubj6jfBYehTSPHEINCaq+PPIQa3Qe1NOfjatzZNEYds2pDxTHU3v5+gf+kMrhjp+Lqs7l3lTHpXVFTdtr7FcYxFSuqI9v26I2jGNt9omBbK5PyIRdVARp46dKOwcLcWCpjDjIHrdPE9Gf2wHXLoF6uKywoJKg2GABoQWrEBw0oHxYKjLzTeAjh22WLVjaXFxa4Xd97VLWvV25O6d4E2RugJwthun2EVwAwZtaXsYmIVc8dglt7CCzdZzsp3fnDSO4brmoP5U0/jQIXvXPVYikx+3Lsp2zXr+Oviligg4+tTZTRiZ8uV8sR7qkw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?FtZJeOLsORwjcXbT3+4YgzuQOEa6L/CiFsCR7vQD425B6CotQie/fmsSAk?=
 =?iso-8859-1?Q?6OPVaApxOGhlNQBRXl5oljCmppfNop9f5QZZbaEWURlOi3bHkmSr5mfDBl?=
 =?iso-8859-1?Q?dWv8XJJrC3H2B4b/a/xnuOtk3W7I81YddCKe2rurl3HTL6AA2E+SBJWTBc?=
 =?iso-8859-1?Q?i2ieW/wnml8UE5P+ZmrhG6DhchYllhjDi0Co2rfLNdDZKrxLIWvvTgvF/C?=
 =?iso-8859-1?Q?+bfxH9I1vPgO04Croigl9WokGRaynVKtjY4lCieO8IsX14K69Rx9URQNh2?=
 =?iso-8859-1?Q?66veo5n3erwIF7n1Zuegt/KpgTWY/qBa2BamdiPSDhDLipGN3EqLE4+PUZ?=
 =?iso-8859-1?Q?ZA18pxbHjqnm57xSeI0z0GPJdZdqHtoHw5vOlEgxzmzteOb/W7ytZbcZl9?=
 =?iso-8859-1?Q?3xCOjtkhfuayWszWmttBo8nt+L1y3Gu4WQtwglZIvz2+CEkVo0J5UbKwe2?=
 =?iso-8859-1?Q?nt7PYZo9uZAp+D48bAJ/qHGscZdVuiaqLKwoulU+MeGL6PJBi33uU0ZozV?=
 =?iso-8859-1?Q?/3Xu/3vRlQrnArOztMFeFy0JNDAw8Pu0cHF78HH9oAD49LFRfxYhL/wKrM?=
 =?iso-8859-1?Q?g10+ktZkOd+KdaWNDVo2gJPlvj03vSd4Q0eqzd9p27vgVxZHOkzl0fk3kO?=
 =?iso-8859-1?Q?7anpqS3g0hAdOLJ55Hs918/pOTHJ5uM0YGU1IIobVNbD9StwSzCQj/PQgA?=
 =?iso-8859-1?Q?51EJ+lk9wi0FhWyni8fKSq4J46GLzI8u3WBiUSwLn1dCiXJFDP+tLxvPwL?=
 =?iso-8859-1?Q?bVuG2HlIigAflc/qtuY+Qu7lGMwOYECw/DH154w5l2pwudFsqD5V84Xt33?=
 =?iso-8859-1?Q?dScOCz0GLwuVdnw1L8HItj4YiYe1aCDnmQ4FgJYpvOjVWHgDfIudi4MOt7?=
 =?iso-8859-1?Q?UajiXnSqyX3tYlcFxCjs82UIT3cKGp2Y9WEXq5XxtnTT6784SvZKcia0T1?=
 =?iso-8859-1?Q?JrNsPmuUKJgWNk3aJdbK5O0YAb7kbm+cod9sMtGfWcYBPx8y6vrku7wOMS?=
 =?iso-8859-1?Q?ZIoEFaE/BaKW/pUsiSyKHgxFeXZCu6IffofPeTSeHuR6vUd8U3s5wKQ3rY?=
 =?iso-8859-1?Q?oELeKuspv3o1qpw+tI3HqHh8lC8zDU0zPqw75AAS91srjqkD3sKH521F/z?=
 =?iso-8859-1?Q?wE+Na/SeJ8PKcaACljHwYTAAwE0BRQFjMoBhGa+ihaDKppAYU56gHFFpTD?=
 =?iso-8859-1?Q?AxEfxO0Lqw9etOGGfhY45n5TdK+4khuXitVW9jUwqZDmt0Zw1FUYMp4jzu?=
 =?iso-8859-1?Q?9Ph2SHaDft6MLnpNwvGoHHhV+3oGYXnh72tDvokSuS/Slvk2cGUGBfvrKZ?=
 =?iso-8859-1?Q?qHUQcvm0H4RFtv4shAtDeV02a9Bc3QcrvLEesQOJ+bUmyVxm3So08VxDJT?=
 =?iso-8859-1?Q?EVTMp5vG2eYaT9Ff3WVO87S4TWW9xdNX1OUM9muxgEOTYmZHs5+av2lL4i?=
 =?iso-8859-1?Q?IvlrEJfaj7MEwivZDWsBl9O0nkvqqT3mBZKOGQHoP+2ksuINviqjr6cqlW?=
 =?iso-8859-1?Q?SrjetrjWVXiyWGtfgyCgI4D7dvp+j76wad6PVPZOGgPSYvNkd5O0/RRlB1?=
 =?iso-8859-1?Q?UvjrxKqmjZoc8un0gv0VipQlHd+0LdsgEUazY2W/l3Y0KUe613AVkU3jLY?=
 =?iso-8859-1?Q?EJ6ftypj3+fwHaKwlaRxcbMSjVyfzNLhwSjytPKMfYM/Iq0whF25tBdqQQ?=
 =?iso-8859-1?Q?fAXKXj/u1WvRZnQSVUmVfO93FeICgEGG6Oua1HQ1zjZD5eRsGYhM8VR7bp?=
 =?iso-8859-1?Q?SdGygAc1/M+EmOU0Fk6O4rpjMODazdlIDXKa9RnAYi6ej9aPN6AB/qAp8+?=
 =?iso-8859-1?Q?mDm9v9zp1KO3c/2F47XriNP/s94lFNY=3D?=
X-Exchange-RoutingPolicyChecked: Qj2CNaaGczfW6g4/X8vj5jdYxfzB3Q1I39S0YtGTdOyngN6YkkOWuvCKk4cG4V/sDLsZZ48/os8LsdCmC13/9ktTubsEv+HqNSCsMe8tA9SD+HIsVJwRm25DtjUQ7G0EW03Q345PAchXL5JZEhYM6j2KSN5EN/i/2zYiZ66ou+vDV4+IQu0CyysyhdPtheceRxHRGLZpQpS47Qc/0c1MEMLGJwtqOEq2mvmameWcyyG7DOMl+BT5+6huAs3xMaw7uJIHQ8uwoiV3jhMCijWajODMgy3FemKdHuAhjUDsTW6jxl5Lows/RdZKjqZK39N5VaBWUapvzuKzbuLbMbHeWw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e855277-1b55-4792-425c-08dea7ac9c53
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2026 18:08:13.4154 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ExQbveGUjdT6kHOwxTauvgPx9ohalPFCwdHuruU2BTOA3Gvo+Q9hqsz+c9Av33RYqHA15gPmyX7jfwt8PZiOpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5006
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

On Thu, Apr 30, 2026 at 12:36:41PM -0700, Matthew Brost wrote:
> On Thu, Apr 30, 2026 at 03:41:30PM +0530, Arvind Yadav wrote:
> > xe_bo_recompute_purgeable_state() walks all VMAs of a BO to determine
> > whether the BO can be made purgeable. This makes VMA create/destroy and
> > madvise updates O(n) in the number of mappings.
> > 
> > Replace the walk with BO-local counters protected by the BO dma-resv
> > lock:
> > 
> >   - vma_count tracks the number of VMAs mapping the BO.
> >   - willneed_count tracks active WILLNEED holders, including WILLNEED
> >     VMAs and active dma-buf exports for non-imported BOs.
> > 
> > A DONTNEED BO is promoted back to WILLNEED on a 0->1 transition of
> > willneed_count. A BO is demoted to DONTNEED on a 1->0 transition only
> > when it still has VMAs, preserving the previous behaviour where a BO
> > with no mappings keeps its current madvise state.
> > 
> > PURGED remains terminal, preserving the existing "once purged, always
> > purged" rule.
> > 
> > v2:
> >   - Use early return for imported BOs in all four helpers to avoid
> >     nesting (Matt B).
> >   - Group purgeability state into a purgeable sub-struct on struct
> >     xe_bo (Matt B).
> >   - Reword xe_bo_willneed_put_locked() kernel-doc to explain that a 1->0
> >     transition means all remaining active VMAs are DONTNEED (Matt B).
> > 
> > Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> 
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> 

My bad - sashiko flagged a valid issue here [1].

So I xe_vma_create need to flags.check_purged check that is currently in
vma_lock_and_validate(). We the dma-resv locks in xe_vma_create so
moving the check to xe_vma_create should be safe. 

More below.

[1] https://sashiko.dev/#/patchset/20260430101130.1365878-1-arvind.yadav%40intel.com

> > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_bo.c         |   6 +-
> >  drivers/gpu/drm/xe/xe_bo.h         |  88 +++++++++++++++-
> >  drivers/gpu/drm/xe/xe_bo_types.h   |  27 ++++-
> >  drivers/gpu/drm/xe/xe_dma_buf.c    |  28 ++++-
> >  drivers/gpu/drm/xe/xe_vm.c         |   9 +-
> >  drivers/gpu/drm/xe/xe_vm_madvise.c | 162 ++---------------------------
> >  drivers/gpu/drm/xe/xe_vm_madvise.h |   2 -
> >  7 files changed, 155 insertions(+), 167 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > index 5ce60d161e09..eaa3a4ee9111 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > @@ -884,10 +884,10 @@ void xe_bo_set_purgeable_state(struct xe_bo *bo,
> >  		  new_state == XE_MADV_PURGEABLE_PURGED);
> >  
> >  	/* Once purged, always purged - cannot transition out */
> > -	xe_assert(xe, !(bo->madv_purgeable == XE_MADV_PURGEABLE_PURGED &&
> > +	xe_assert(xe, !(bo->purgeable.state == XE_MADV_PURGEABLE_PURGED &&
> >  			new_state != XE_MADV_PURGEABLE_PURGED));
> >  
> > -	bo->madv_purgeable = new_state;
> > +	bo->purgeable.state = new_state;
> >  	xe_bo_set_purgeable_shrinker(bo, new_state);
> >  }
> >  
> > @@ -2355,7 +2355,7 @@ struct xe_bo *xe_bo_init_locked(struct xe_device *xe, struct xe_bo *bo,
> >  	INIT_LIST_HEAD(&bo->vram_userfault_link);
> >  
> >  	/* Initialize purge advisory state */
> > -	bo->madv_purgeable = XE_MADV_PURGEABLE_WILLNEED;
> > +	bo->purgeable.state = XE_MADV_PURGEABLE_WILLNEED;
> >  
> >  	drm_gem_private_object_init(&xe->drm, &bo->ttm.base, size);
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> > index 68dea7d25a6b..6340317f7d2e 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.h
> > +++ b/drivers/gpu/drm/xe/xe_bo.h
> > @@ -251,7 +251,7 @@ static inline bool xe_bo_is_protected(const struct xe_bo *bo)
> >  static inline bool xe_bo_is_purged(struct xe_bo *bo)
> >  {
> >  	xe_bo_assert_held(bo);
> > -	return bo->madv_purgeable == XE_MADV_PURGEABLE_PURGED;
> > +	return bo->purgeable.state == XE_MADV_PURGEABLE_PURGED;
> >  }
> >  
> >  /**
> > @@ -268,11 +268,95 @@ static inline bool xe_bo_is_purged(struct xe_bo *bo)
> >  static inline bool xe_bo_madv_is_dontneed(struct xe_bo *bo)
> >  {
> >  	xe_bo_assert_held(bo);
> > -	return bo->madv_purgeable == XE_MADV_PURGEABLE_DONTNEED;
> > +	return bo->purgeable.state == XE_MADV_PURGEABLE_DONTNEED;
> >  }
> >  
> >  void xe_bo_set_purgeable_state(struct xe_bo *bo, enum xe_madv_purgeable_state new_state);
> >  
> > +/**
> > + * xe_bo_willneed_get_locked() - Acquire a WILLNEED holder on a BO
> > + * @bo: Buffer object
> > + *
> > + * Increments willneed_count and, on a 0->1 transition, promotes the BO
> > + * from DONTNEED to WILLNEED. PURGED is terminal and is never modified.
> > + *
> > + * Caller must hold the BO's dma-resv lock.
> > + */
> > +static inline void xe_bo_willneed_get_locked(struct xe_bo *bo)
> > +{
> > +	xe_bo_assert_held(bo);
> > +
> > +	/* Imported BOs are owned externally; do not track purgeability. */
> > +	if (drm_gem_is_imported(&bo->ttm.base))
> > +		return;
> > +
> > +	if (bo->purgeable.willneed_count++ == 0 && xe_bo_madv_is_dontneed(bo))
> > +		xe_bo_set_purgeable_state(bo, XE_MADV_PURGEABLE_WILLNEED);
> > +}
> > +
> > +/**
> > + * xe_bo_willneed_put_locked() - Release a WILLNEED holder on a BO
> > + * @bo: Buffer object
> > + *
> > + * Decrements willneed_count and, on a 1->0 transition, marks the BO
> > + * DONTNEED only if it still has VMAs (implying all active VMAs are
> > + * DONTNEED). If the last VMA is being removed, preserve the current BO
> > + * state to match the previous VMA-walk semantics.
> > + *
> > + * PURGED is terminal and the BO state is never modified.
> > + *
> > + * Caller must hold the BO's dma-resv lock.
> > + */
> > +static inline void xe_bo_willneed_put_locked(struct xe_bo *bo)
> > +{
> > +	xe_bo_assert_held(bo);
> > +
> > +	if (drm_gem_is_imported(&bo->ttm.base))
> > +		return;
> > +
> > +	xe_assert(xe_bo_device(bo), bo->purgeable.willneed_count > 0);
> > +	if (--bo->purgeable.willneed_count == 0 && bo->purgeable.vma_count > 0 &&
> > +	    !xe_bo_is_purged(bo))
> > +		xe_bo_set_purgeable_state(bo, XE_MADV_PURGEABLE_DONTNEED);
> > +}
> > +
> > +/**
> > + * xe_bo_vma_count_inc_locked() - Account a new VMA on a BO
> > + * @bo: Buffer object
> > + *
> > + * Increments vma_count.
> > + *
> > + * Caller must hold the BO's dma-resv lock.
> > + */
> > +static inline void xe_bo_vma_count_inc_locked(struct xe_bo *bo)
> > +{
> > +	xe_bo_assert_held(bo);
> > +
> > +	if (drm_gem_is_imported(&bo->ttm.base))
> > +		return;
> > +
> > +	bo->purgeable.vma_count++;
> > +}
> > +
> > +/**
> > + * xe_bo_vma_count_dec_locked() - Account a VMA removal on a BO
> > + * @bo: Buffer object
> > + *
> > + * Decrements vma_count.
> > + *
> > + * Caller must hold the BO's dma-resv lock.
> > + */
> > +static inline void xe_bo_vma_count_dec_locked(struct xe_bo *bo)
> > +{
> > +	xe_bo_assert_held(bo);
> > +
> > +	if (drm_gem_is_imported(&bo->ttm.base))
> > +		return;
> > +
> > +	xe_assert(xe_bo_device(bo), bo->purgeable.vma_count > 0);
> > +	bo->purgeable.vma_count--;
> > +}
> > +
> >  static inline void xe_bo_unpin_map_no_vm(struct xe_bo *bo)
> >  {
> >  	if (likely(bo)) {
> > diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
> > index 9c199badd9b2..6756d7820aca 100644
> > --- a/drivers/gpu/drm/xe/xe_bo_types.h
> > +++ b/drivers/gpu/drm/xe/xe_bo_types.h
> > @@ -111,10 +111,31 @@ struct xe_bo {
> >  	u64 min_align;
> >  
> >  	/**
> > -	 * @madv_purgeable: user space advise on BO purgeability, protected
> > -	 * by BO's dma-resv lock.
> > +	 * @purgeable: Purgeability state and accounting.
> > +	 *
> > +	 * All fields are protected by the BO's dma-resv lock.
> >  	 */
> > -	u32 madv_purgeable;
> > +	struct {
> > +		/**
> > +		 * @purgeable.state: BO purgeability state (WILLNEED/DONTNEED/PURGED).
> > +		 */
> > +		u32 state;
> > +
> > +		/**
> > +		 * @purgeable.vma_count: Number of VMAs currently mapping this BO.
> > +		 */
> > +		u32 vma_count;
> > +
> > +		/**
> > +		 * @purgeable.willneed_count: Number of active WILLNEED holders.
> > +		 *
> > +		 * Counts WILLNEED VMAs plus active dma-buf exports for
> > +		 * non-imported BOs. The BO flips to DONTNEED on a 1->0
> > +		 * transition only when VMAs still exist; if the last VMA is
> > +		 * removed, the previous BO state is preserved.
> > +		 */
> > +		u32 willneed_count;
> > +	} purgeable;
> >  };
> >  
> >  #endif
> > diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
> > index b9828da15897..855d32ba314d 100644
> > --- a/drivers/gpu/drm/xe/xe_dma_buf.c
> > +++ b/drivers/gpu/drm/xe/xe_dma_buf.c
> > @@ -193,6 +193,18 @@ static int xe_dma_buf_begin_cpu_access(struct dma_buf *dma_buf,
> >  	return 0;
> >  }
> >  
> > +static void xe_dma_buf_release(struct dma_buf *dmabuf)
> > +{
> > +	struct drm_gem_object *obj = dmabuf->priv;
> > +	struct xe_bo *bo = gem_to_xe_bo(obj);
> > +
> > +	xe_bo_lock(bo, false);
> > +	xe_bo_willneed_put_locked(bo);
> > +	xe_bo_unlock(bo);
> > +
> > +	drm_gem_dmabuf_release(dmabuf);
> > +}
> > +
> >  static const struct dma_buf_ops xe_dmabuf_ops = {
> >  	.attach = xe_dma_buf_attach,
> >  	.detach = xe_dma_buf_detach,
> > @@ -200,7 +212,7 @@ static const struct dma_buf_ops xe_dmabuf_ops = {
> >  	.unpin = xe_dma_buf_unpin,
> >  	.map_dma_buf = xe_dma_buf_map,
> >  	.unmap_dma_buf = xe_dma_buf_unmap,
> > -	.release = drm_gem_dmabuf_release,
> > +	.release = xe_dma_buf_release,
> >  	.begin_cpu_access = xe_dma_buf_begin_cpu_access,
> >  	.mmap = drm_gem_dmabuf_mmap,
> >  	.vmap = drm_gem_dmabuf_vmap,
> > @@ -241,18 +253,26 @@ struct dma_buf *xe_gem_prime_export(struct drm_gem_object *obj, int flags)
> >  		ret = -EINVAL;
> >  		goto out_unlock;
> >  	}
> > +
> > +	xe_bo_willneed_get_locked(bo);
> >  	xe_bo_unlock(bo);
> >  
> >  	ret = ttm_bo_setup_export(&bo->ttm, &ctx);
> >  	if (ret)
> > -		return ERR_PTR(ret);
> > +		goto out_put;
> >  
> >  	buf = drm_gem_prime_export(obj, flags);
> > -	if (!IS_ERR(buf))
> > -		buf->ops = &xe_dmabuf_ops;
> > +	if (IS_ERR(buf)) {
> > +		ret = PTR_ERR(buf);
> > +		goto out_put;
> > +	}
> >  
> > +	buf->ops = &xe_dmabuf_ops;
> >  	return buf;
> >  
> > +out_put:
> > +	xe_bo_lock(bo, false);
> > +	xe_bo_willneed_put_locked(bo);
> >  out_unlock:
> >  	xe_bo_unlock(bo);
> >  	return ERR_PTR(ret);
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index c3836f6eab35..12457173ba85 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -1131,6 +1131,10 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
> >  		vma->gpuva.gem.offset = bo_offset_or_userptr;
> >  		drm_gpuva_link(&vma->gpuva, vm_bo);
> >  		drm_gpuvm_bo_put(vm_bo);
> > +
> > +		xe_bo_vma_count_inc_locked(bo);
> > +		if (vma->attr.purgeable_state == XE_MADV_PURGEABLE_WILLNEED)
> > +			xe_bo_willneed_get_locked(bo);

So at very top of this function I think:

if (bo && attr->purgeable_state == XE_MADV_PURGEABLE_WILLNEED) {
	if (xe_bo_madv_is_dontneed(bo))
		return ERR_PTR(-EBUSY);  /* BO marked purgeable */
	else if (xe_bo_is_purged(bo))
		return ERR_PTR(-EINVAL); /* BO already purged */
}

Then delete the check in vma_lock_and_validate. I think check in
vma_lock_and_validate is actually wrong for rebinds too - e.g., it is
prefectly to do a partial unbind a dontneed or purged BO and the
existing check I believe would reject this.

We should put together a test for for this too.

addr = bind(2M);
madvise(addr, DONTNEED);
unbind(addr, 1M);

Assuming the current code fails in this test case and new code works,
I'd suggest making this patch a fixes too.

Matt

> >  	} else /* userptr or null */ {
> >  		if (!is_null && !is_cpu_addr_mirror) {
> >  			struct xe_userptr_vma *uvma = to_userptr_vma(vma);
> > @@ -1208,7 +1212,10 @@ static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence)
> >  		xe_bo_assert_held(bo);
> >  
> >  		drm_gpuva_unlink(&vma->gpuva);
> > -		xe_bo_recompute_purgeable_state(bo);
> > +
> > +		xe_bo_vma_count_dec_locked(bo);
> > +		if (vma->attr.purgeable_state == XE_MADV_PURGEABLE_WILLNEED)
> > +			xe_bo_willneed_put_locked(bo);
> >  	}
> >  
> >  	xe_vm_assert_held(vm);
> > diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
> > index c78906dea82b..c4fb29004195 100644
> > --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
> > +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> > @@ -185,147 +185,6 @@ static void madvise_pat_index(struct xe_device *xe, struct xe_vm *vm,
> >  	}
> >  }
> >  
> > -/**
> > - * xe_bo_is_dmabuf_shared() - Check if BO is shared via dma-buf
> > - * @bo: Buffer object
> > - *
> > - * Prevent marking imported or exported dma-bufs as purgeable.
> > - * For imported BOs, Xe doesn't own the backing store and cannot
> > - * safely reclaim pages (exporter or other devices may still be
> > - * using them). For exported BOs, external devices may have active
> > - * mappings we cannot track.
> > - *
> > - * Return: true if BO is imported or exported, false otherwise
> > - */
> > -static bool xe_bo_is_dmabuf_shared(struct xe_bo *bo)
> > -{
> > -	struct drm_gem_object *obj = &bo->ttm.base;
> > -
> > -	/* Imported: exporter owns backing store */
> > -	if (drm_gem_is_imported(obj))
> > -		return true;
> > -
> > -	/* Exported: external devices may be accessing */
> > -	if (obj->dma_buf)
> > -		return true;
> > -
> > -	return false;
> > -}
> > -
> > -/**
> > - * enum xe_bo_vmas_purge_state - VMA purgeable state aggregation
> > - *
> > - * Distinguishes whether a BO's VMAs are all DONTNEED, have at least
> > - * one WILLNEED, or have no VMAs at all.
> > - *
> > - * Enum values align with XE_MADV_PURGEABLE_* states for consistency.
> > - */
> > -enum xe_bo_vmas_purge_state {
> > -	/** @XE_BO_VMAS_STATE_WILLNEED: At least one VMA is WILLNEED */
> > -	XE_BO_VMAS_STATE_WILLNEED = 0,
> > -	/** @XE_BO_VMAS_STATE_DONTNEED: All VMAs are DONTNEED */
> > -	XE_BO_VMAS_STATE_DONTNEED = 1,
> > -	/** @XE_BO_VMAS_STATE_NO_VMAS: BO has no VMAs */
> > -	XE_BO_VMAS_STATE_NO_VMAS = 2,
> > -};
> > -
> > -/*
> > - * xe_bo_recompute_purgeable_state() casts between xe_bo_vmas_purge_state and
> > - * xe_madv_purgeable_state. Enforce that WILLNEED=0 and DONTNEED=1 match across
> > - * both enums so the single-line cast is always valid.
> > - */
> > -static_assert(XE_BO_VMAS_STATE_WILLNEED == (int)XE_MADV_PURGEABLE_WILLNEED,
> > -	      "VMA purge state WILLNEED must equal madv purgeable WILLNEED");
> > -static_assert(XE_BO_VMAS_STATE_DONTNEED == (int)XE_MADV_PURGEABLE_DONTNEED,
> > -	      "VMA purge state DONTNEED must equal madv purgeable DONTNEED");
> > -
> > -/**
> > - * xe_bo_all_vmas_dontneed() - Determine BO VMA purgeable state
> > - * @bo: Buffer object
> > - *
> > - * Check all VMAs across all VMs to determine aggregate purgeable state.
> > - * Shared BOs require unanimous DONTNEED state from all mappings.
> > - *
> > - * Caller must hold BO dma-resv lock.
> > - *
> > - * Return: XE_BO_VMAS_STATE_DONTNEED if all VMAs are DONTNEED,
> > - *         XE_BO_VMAS_STATE_WILLNEED if at least one VMA is not DONTNEED,
> > - *         XE_BO_VMAS_STATE_NO_VMAS if BO has no VMAs
> > - */
> > -static enum xe_bo_vmas_purge_state xe_bo_all_vmas_dontneed(struct xe_bo *bo)
> > -{
> > -	struct drm_gpuvm_bo *vm_bo;
> > -	struct drm_gpuva *gpuva;
> > -	struct drm_gem_object *obj = &bo->ttm.base;
> > -	bool has_vmas = false;
> > -
> > -	xe_bo_assert_held(bo);
> > -
> > -	/* Shared dma-bufs cannot be purgeable */
> > -	if (xe_bo_is_dmabuf_shared(bo))
> > -		return XE_BO_VMAS_STATE_WILLNEED;
> > -
> > -	drm_gem_for_each_gpuvm_bo(vm_bo, obj) {
> > -		drm_gpuvm_bo_for_each_va(gpuva, vm_bo) {
> > -			struct xe_vma *vma = gpuva_to_vma(gpuva);
> > -
> > -			has_vmas = true;
> > -
> > -			/* Any non-DONTNEED VMA prevents purging */
> > -			if (vma->attr.purgeable_state != XE_MADV_PURGEABLE_DONTNEED)
> > -				return XE_BO_VMAS_STATE_WILLNEED;
> > -		}
> > -	}
> > -
> > -	/*
> > -	 * No VMAs => preserve existing BO purgeable state.
> > -	 * Avoids incorrectly flipping DONTNEED -> WILLNEED when last VMA unmapped.
> > -	 */
> > -	if (!has_vmas)
> > -		return XE_BO_VMAS_STATE_NO_VMAS;
> > -
> > -	return XE_BO_VMAS_STATE_DONTNEED;
> > -}
> > -
> > -/**
> > - * xe_bo_recompute_purgeable_state() - Recompute BO purgeable state from VMAs
> > - * @bo: Buffer object
> > - *
> > - * Walk all VMAs to determine if BO should be purgeable or not.
> > - * Shared BOs require unanimous DONTNEED state from all mappings.
> > - * If the BO has no VMAs the existing state is preserved.
> > - *
> > - * Locking: Caller must hold BO dma-resv lock. When iterating GPUVM lists,
> > - * VM lock must also be held (write) to prevent concurrent VMA modifications.
> > - * This is satisfied at both call sites:
> > - * - xe_vma_destroy(): holds vm->lock write
> > - * - madvise_purgeable(): holds vm->lock write (from madvise ioctl path)
> > - *
> > - * Return: nothing
> > - */
> > -void xe_bo_recompute_purgeable_state(struct xe_bo *bo)
> > -{
> > -	enum xe_bo_vmas_purge_state vma_state;
> > -
> > -	if (!bo)
> > -		return;
> > -
> > -	xe_bo_assert_held(bo);
> > -
> > -	/*
> > -	 * Once purged, always purged. Cannot transition back to WILLNEED.
> > -	 * This matches i915 semantics where purged BOs are permanently invalid.
> > -	 */
> > -	if (bo->madv_purgeable == XE_MADV_PURGEABLE_PURGED)
> > -		return;
> > -
> > -	vma_state = xe_bo_all_vmas_dontneed(bo);
> > -
> > -	if (vma_state != (enum xe_bo_vmas_purge_state)bo->madv_purgeable &&
> > -	    vma_state != XE_BO_VMAS_STATE_NO_VMAS)
> > -		xe_bo_set_purgeable_state(bo, (enum xe_madv_purgeable_state)vma_state);
> > -}
> > -
> >  /**
> >   * madvise_purgeable - Handle purgeable buffer object advice
> >   * @xe: XE device
> > @@ -359,12 +218,6 @@ static void madvise_purgeable(struct xe_device *xe, struct xe_vm *vm,
> >  		/* BO must be locked before modifying madv state */
> >  		xe_bo_assert_held(bo);
> >  
> > -		/* Skip shared dma-bufs - no PTEs to zap */
> > -		if (xe_bo_is_dmabuf_shared(bo)) {
> > -			vmas[i]->skip_invalidation = true;
> > -			continue;
> > -		}
> > -
> >  		/*
> >  		 * Once purged, always purged. Cannot transition back to WILLNEED.
> >  		 * This matches i915 semantics where purged BOs are permanently invalid.
> > @@ -377,13 +230,14 @@ static void madvise_purgeable(struct xe_device *xe, struct xe_vm *vm,
> >  
> >  		switch (op->purge_state_val.val) {
> >  		case DRM_XE_VMA_PURGEABLE_STATE_WILLNEED:
> > -			vmas[i]->attr.purgeable_state = XE_MADV_PURGEABLE_WILLNEED;
> >  			vmas[i]->skip_invalidation = true;
> > -
> > -			xe_bo_recompute_purgeable_state(bo);
> > +			/* Only act on a real DONTNEED -> WILLNEED transition. */
> > +			if (vmas[i]->attr.purgeable_state == XE_MADV_PURGEABLE_DONTNEED) {
> > +				vmas[i]->attr.purgeable_state = XE_MADV_PURGEABLE_WILLNEED;
> > +				xe_bo_willneed_get_locked(bo);
> > +			}
> >  			break;
> >  		case DRM_XE_VMA_PURGEABLE_STATE_DONTNEED:
> > -			vmas[i]->attr.purgeable_state = XE_MADV_PURGEABLE_DONTNEED;
> >  			/*
> >  			 * Don't zap PTEs at DONTNEED time -- pages are still
> >  			 * alive. The zap happens in xe_bo_move_notify() right
> > @@ -391,7 +245,11 @@ static void madvise_purgeable(struct xe_device *xe, struct xe_vm *vm,
> >  			 */
> >  			vmas[i]->skip_invalidation = true;
> >  
> > -			xe_bo_recompute_purgeable_state(bo);
> > +			/* Only act on a real WILLNEED -> DONTNEED transition. */
> > +			if (vmas[i]->attr.purgeable_state == XE_MADV_PURGEABLE_WILLNEED) {
> > +				vmas[i]->attr.purgeable_state = XE_MADV_PURGEABLE_DONTNEED;
> > +				xe_bo_willneed_put_locked(bo);
> > +			}
> >  			break;
> >  		default:
> >  			/* Should never hit - values validated in madvise_args_are_sane() */
> > diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.h b/drivers/gpu/drm/xe/xe_vm_madvise.h
> > index 39acd2689ca0..a3078f634c7e 100644
> > --- a/drivers/gpu/drm/xe/xe_vm_madvise.h
> > +++ b/drivers/gpu/drm/xe/xe_vm_madvise.h
> > @@ -13,6 +13,4 @@ struct xe_bo;
> >  int xe_vm_madvise_ioctl(struct drm_device *dev, void *data,
> >  			struct drm_file *file);
> >  
> > -void xe_bo_recompute_purgeable_state(struct xe_bo *bo);
> > -
> >  #endif
> > -- 
> > 2.43.0
> > 
