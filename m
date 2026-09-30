Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37C41CA5FC5
	for <intel-xe@archiver.kernel.org>; Wed, 30 Sep 2026 19:24:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED99110E5E1;
	Wed, 30 Sep 2026 19:24:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YWrHWkeA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36B3010E5E1
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Sep 2026 19:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790796277; x=1822332277;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=DSE9nn1RAHv7b8XzjXHjGb3NDMOzUIaw3xf0gY08ZhE=;
 b=YWrHWkeAUiA99D9D9ivdXmOamWWF9zl7/UwSvIU3cS8ZMTwyBLoCLP9O
 YazySCuVtFo/xxI7cObr1M3GADB+qfNAfS53TFVAaqhNyg36rJxTzXoWP
 DGkx1bXI5n9rQwuOt3rBGXwi4lC1pFipOIBrzvIq80txLIiFFNlxTtw9N
 1dacKHF0/UXq5TGjsiBBbvq1xlUvQl9pmsvbrCf8HNgJAe5YP1JTYmOi/
 POR7kYKEailW3Mgip6votydbOU0oFd30zk5qsE8wnCl6PLm9txBZcpn1d
 DwAFxMU9Pb0THfpebsYTgkK4+A2mjM7X+2I5406dzLZ28sCssHqLttHra g==;
X-CSE-ConnectionGUID: xhsmptwrQ4OG5LufocHWug==
X-CSE-MsgGUID: Qp2aL8Z9RIqfh9PDHFM5PQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="117073326"
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; d="scan'208";a="117073326"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2026 12:24:37 -0700
X-CSE-ConnectionGUID: /EhLlswPQnKTHiAGq3AjWQ==
X-CSE-MsgGUID: Be+VneBWSoq00UmRbtxD3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; d="scan'208";a="279090125"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2026 12:24:37 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 30 Sep 2026 12:24:36 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 30 Sep 2026 12:24:36 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.68) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 30 Sep 2026 12:24:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=em4SQzJIg5ZFyDpDtsjhw32of0fvo/WXAdbi6jhjHjqYPfzCOmd7voC7Wj+bxIxrsA3bvR1j4OjFZEXNad2VD4Bm6RZ3lpxg7l81Qok0fqWBDcp7Q2S891czr7sA1mluzTOxyQkEJTNTUYr+HWFhgKGgw8h/KSBmsAaWYN4h91lqk1Y4XIIhnZThLoI4VzmDsRIVTmpnXKe+0b7kbMe27lYvwBv8/rRwB4N8BiSW4r0NsNUtkIMqtJ76S1lupK+dwQjtjLxjOLaBIDOuTO9VE/HVvEVexWEGwgHk7i508HXkbLEu8wy1cPS6bwoYf0BTFqeb6RuADC8lNaU4ZMpTTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sLgkK3iBv60cfe7mWJqfwSFUozwKXWI3DXr+yQNBjJM=;
 b=yQPfjVpPoYh7TabmuR/LS1CpAi7HopfRnU1ZnBwUGYittVN7FWm4ED9aQefImkYDNfa4WjuLb/Na1svbgEbtl6FBaQGoM6RRcF+Hx4rfQZvNSV0TBkKrogATn1O9v/ebG7PXMHQyyqEBW8GZ/0+mOV3c2B4ZIcuP7Gry14q+MGH49H4k6pov96kFPv1rBIiGaymYzZcJsvwgH22fwk7CAAFBTAf5y4Q9vjC78gpSKkZ0xLWLdF2IoFL+JiPbyA+fBFb14rBq7G5VU5BzQmYB/QF1R9e0bV8D87tD1U5z/R6C6gsOTY9PtK9HpSwuUCWJc9CiMueKZONC6PdpUQNT9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH0PR11MB9728.namprd11.prod.outlook.com (2603:10b6:510:399::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.16; Wed, 30 Sep
 2026 19:24:34 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%6]) with mapi id 15.21.0472.015; Wed, 30 Sep 2026
 19:24:34 +0000
Date: Wed, 30 Sep 2026 12:24:32 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
CC: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/guc: Let xe_guc_ct_send_locked() callers reserve
 G2H credit
Message-ID: <20260930192432.GP730887@mdroper-desk1.amr.corp.intel.com>
References: <20260929050342.221789-1-sujaritha.sundaresan@intel.com>
 <arv/3gSXMjVFC0Fq@gsse-cloud1.jf.intel.com>
 <ae716e09-1329-4f0a-a9df-0226ab7cdfc3@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ae716e09-1329-4f0a-a9df-0226ab7cdfc3@intel.com>
X-ClientProxiedBy: BY3PR03CA0021.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::26) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH0PR11MB9728:EE_
X-MS-Office365-Filtering-Correlation-Id: 50a3394e-85a7-450e-cb59-08df1f287555
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|18002099003|22082099003|4143699003|11063799006|10067099003|56012099006|5023799004|6133799003;
X-Microsoft-Antispam-Message-Info: xHJHXPGVmRYt73AtR4XjDci4mztzSXMVeTVCAzeGUcVIycZq7+Kb0s4joHVHniWb0oqo12wSNJmNDrlFbbk72fUH/CDH8jQjIaJSP8fOoLSXgSOZWAHtUa6Rhrxw/Cjl97wEams75z5PT4ClLIgsdDrRyXM05fSq1KQo31KINuOJDezj6IxD3gXI9M62xqVrKksyUKE0cAsWBUxnJ5ga/Jj+LBWdo1dSrUCTiIZzE2yNHg2Z36aKURIcHre+K2QuRrVgdbzh+TPJujPSSsQl5qTxgiiXS9iZfE7IIPrlZfnmi0xEu2oGS4mZMtY3l6sTgnSJ07zr6sHusgWtY/M56gHEdYicprrvihWltNhcMKkkbyO2A5GTR55IBjr+1C8GF0pzm60P9lPbGsxnJrig/pUUPQBvgkNnhyW8THvY8UhXmHPcGjKhFOHN4no8PpZx+qnt3BLgN41ot4Y4KA4dJyhT5K8SzvU7GP9VaLFVT9p2o7iAX6D/TiFCLI+KTpviDwxcdEVynDdeWwSAN9FPcR2J2nvVq+ZG5FV+iUq9oG+KF45+4VmgaCl4auMObqooPBsJLpvlrU/qf84pw6G1BXTNpQe9/sJyfRnZUDFYtl3ZU8/5zorasVOFXo4XzpsaD+d9YLrEB8Y5l6gEHwG9SH3fHyp4a4D4wkW7/YR6ul8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(18002099003)(22082099003)(4143699003)(11063799006)(10067099003)(56012099006)(5023799004)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ocs/My0ry/IZYgjPal/KbFdZpr/XUUEt60dnU+01TvrNn8+uEQck+mNiD6jv?=
 =?us-ascii?Q?FLuSzr8haaHI/X/6R3IU4pqJzh6lPllAkk+eewhPpBmEI2jcFp1HLI3SVxVd?=
 =?us-ascii?Q?BdFPN+6KMGeA5OI8SrvaB2YFHspAocFRl98JPDVg4+JOtBZ5hpMaEAngziMA?=
 =?us-ascii?Q?n8ypu286WacQ8yw+QkrtsB8ANkP2EtKiWyY3/SSnyH/DxX1tonK9wgzezTRz?=
 =?us-ascii?Q?buJxH0D+WXzRGyZ3x1vo9OE/tqSaBxdmYvan3w9kjmNJVMD3I0yPxO3L3KMP?=
 =?us-ascii?Q?UszUl3QmGiS9APKu/q2ryuX96fKefoS5u1g4+YAAcu+wKsnluOAVy0dXl6WU?=
 =?us-ascii?Q?giNl2I5l9nWUW0Y2SVo96oQQ/4VcnuxGFTZbZfuRk+cK7gzbwD4nCD9HtiJy?=
 =?us-ascii?Q?izfxAtZpwOA4Twbl56AfDwPbMqoBiC+FFN/Chutp1RtpHLbyctnkKIwVK+5h?=
 =?us-ascii?Q?+5Xs+ZNWkStQEjXLNx9OKmjGbdu5dQ5m6ALDg2DPOAPDRcp/inefFkB0G1ZY?=
 =?us-ascii?Q?bIYKdQY1PNxS8bwUBRhwpkkwZhH5q1nYHsyfccllSTZYBtY+FNdDzMBB3J38?=
 =?us-ascii?Q?4KoO96sZG/pXh+83jlNUp/CoQ69Mce7H/7xFvyLmMBf5WiYRiEQ4b9uZ5j9/?=
 =?us-ascii?Q?5MZFY7vc6fQKp5tGi+Idy+aIzF1uDlp9DykVfr4LzoGuQ3qNjOdzKGkxM6D3?=
 =?us-ascii?Q?x0mhC/kZJaCgOI/bH2X+sP7A8cn2zeLuZR44n8lvgGOw8k9fy5snN1nFlTc3?=
 =?us-ascii?Q?VmR3V4JkZdU7Vo1uZT/luwVl3ccvpfjYy/f9XY1e5s2PR21RfFcUU88BDG6K?=
 =?us-ascii?Q?xoz5xB5YKD7MoWu93dnk0VqlbZNjiTaRRuW8QmDpHQnsZBbsD5ZvOcFfXK1t?=
 =?us-ascii?Q?u7Dci5D7HUoF81Usso9X71MPsC/T6jrl2fDmiUFroWN4lu3icXc0zMVbX71D?=
 =?us-ascii?Q?IrmclpYGtM17T0GyazrtI80PK07+l77pCQ8oaUmg0NuajYm9YqHZkd4b2M/r?=
 =?us-ascii?Q?zkpIChDdOXbfSg/87bBG96CubjA0J51dGo6cUK2a4nncgWarnBz2HHoC6qtC?=
 =?us-ascii?Q?XJoIyqLTbA3c9M8obouMOHxj4zzQVPvE2UIReRIR4iyXe6p51hderd5eYtRH?=
 =?us-ascii?Q?XcSOJV7zazgJiL5Sp8PKrtLC4acms0ykXWoKiP0rko8msb7i0bIzNTrbgcNE?=
 =?us-ascii?Q?gU6JDwNoQaWtHPhuR4MyOi3ZJ7IYjgT76nMlyO/o1GWTSrsZipEKn0Y9gSl2?=
 =?us-ascii?Q?+BI2tIKzdV3r62LDHH5Km10D4FeuSdywB9ZHyB/oH9QhXs9Zrdu0+6DipyeJ?=
 =?us-ascii?Q?4ws9+zp36zMmiYyWVGG+sNzRi/TKKpdF/Ow4fT1d8hsCneDpQtyb+Gu8IBZg?=
 =?us-ascii?Q?qlK1df31Fvwsu4aioRxFGTL90cVoLAbwlIM0kb5WssI716FIsLTh4c8c2Vk0?=
 =?us-ascii?Q?Q2MEdZqSpoRjJwpiQvLEPk0ZbjRuTT1QlieAWG4prR5MXg+cgR+E7pljc3sq?=
 =?us-ascii?Q?9rqTD4L3F+yU2OnI4UTbXhVm6/q0XRQLe2LuwdP/OnDOxigC5ZIBwoHl2Oiz?=
 =?us-ascii?Q?Qf3KItb/8SyAggrf2FsZ4URpntZ2Z7DxnukvVAKp8+hhooZ64Rhzt72mwMSt?=
 =?us-ascii?Q?7y+LhR1JeR1bab55h2dtwhEG8S0pfRRRmzyAaaqyBM71VkPxh4fA2qYX/Ytj?=
 =?us-ascii?Q?0aQi7bkpiwCf7idA3qyA8WHCj2C8N7Afkp1FRzP6fcTvLMKLoSTVkBywqJtn?=
 =?us-ascii?Q?KaxE+Dc+AgdZaQTEL/S2QKhRMqYFw5k=3D?=
X-Exchange-RoutingPolicyChecked: AX09zFbgNQtdS81oHF5TcMsqroyxExIJfNxVvPEv2ZbOf8IAjHCAQT2eBEUuIVfhZbqgB+knqbRcZ5N0rRn/0I+Z4G57W8yCKOoE8W0ZH1hybJzp75AonOLirS5e6gQOQpfXFpAF1kdc3UlcLrZwtkhy01rSo4bPsqH1kMrsvXCPV7w6FlU6wbsgOgz3wX8rkImSyEivIOlG/oJ7ktQf80MxozsEKsD8LTcd1WV4pfu8JisDvrH+rFmLDIxKZYQNm47ElAg8KaemYd6vqQSSwPIkwTPaN1fCB98GOsn+MlsxaQbF4zqFeYZ2Q8OHR8y4yIazcNZnJTSIoNSw+gB9mg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 50a3394e-85a7-450e-cb59-08df1f287555
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 19:24:34.0433 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eSrrCMhBmPNaziyeNJ6b8smSc3cX9hmPKmdOM4/qtUpMYHh/o+lwldGjG0LVQWh4KnTpUFbdqzhPMEQ+mYBsujrxJprBpkmwP6Oh68judzA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB9728
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

On Wed, Sep 30, 2026 at 11:56:39AM +0530, Sundaresan, Sujaritha wrote:
> 
> On 9/29/2026 11:43 PM, Matthew Brost wrote:
> > On Tue, Sep 29, 2026 at 10:33:42AM +0530, Sujaritha Sundaresan wrote:
> > > Commit d4a7e1611716 ("drm/xe: batch CT pagefault acks with periodic
> > > flush") added a defer_flush argument to xe_guc_ct_send_locked(). At the
> > > same time it dropped the g2h_len and num_g2h arguments, which had no
> > > in-tree users, and hardcoded a zero G2H reservation.
> > > 
> > > That leaves no way to send an H2G that expects a G2H reply while
> > > already holding ct->lock. The G2H receive path (parse_g2h_event() and
> > > g2h_fast_path()) releases credit unconditionally for replies such as
> > > DEREGISTER_CONTEXT_DONE, SCHED_CONTEXT_MODE_DONE and
> > > TLB_INVALIDATION_DONE. If the credit was never reserved,
> > > __g2h_release_space() reports an "Invalid G2H release" and marks the CT
> > > dead with CT_DEAD_G2H_RELEASE.
> > > 
> > > Replacing two u32 arguments with a bool also means a caller written
> > > against the old signature can silently change meaning when the two
> > > reservation arguments get merged into one: the call still compiles,
> > > still sends the H2G, and loses only the reservation.
> > > 
> > > Add g2h_len and num_g2h back, ahead of defer_flush, so that the
> > > function matches xe_guc_ct_send() and forwards both values to
> > > guc_ct_send_locked(). The kernel-doc now says when a reservation is
> > > required and that a non-zero reservation must not be made from a G2H
> > > handler, because waiting for credit can dequeue G2H inline.
> > > 
> > > The only existing caller, the pagefault ack path, does not expect a
> > > reply. It passes 0, 0 and behaves exactly as before.
> > > 
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> 
> Thanks for the review. The CI failures are unrelated to the changes here.

Applied to drm-xe-next.  Thanks for the patch and review.


Matt

> 
> - Sujaritha Sundaresan
> 
> > 
> > > Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/xe_guc_ct.c        | 17 +++++++++++++++--
> > >   drivers/gpu/drm/xe/xe_guc_ct.h        |  2 +-
> > >   drivers/gpu/drm/xe/xe_guc_pagefault.c |  3 ++-
> > >   3 files changed, 18 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> > > index 5c393aa29de3..da5ce97484b8 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> > > @@ -1290,11 +1290,23 @@ int xe_guc_ct_send(struct xe_guc_ct *ct, const u32 *action, u32 len,
> > >    * @ct: GuC CT object
> > >    * @action: payload dwords (HxG header dword is expected at @action[-1])
> > >    * @len: number of payload dwords in @action
> > > + * @g2h_len: G2H response space to reserve in dwords, or 0
> > > + * @num_g2h: number of G2H messages expected, or 0
> > >    * @defer_flush: defer publishing/doorbell for batching
> > >    *
> > >    * Sends a single H2G message to the GuC CT buffer while the caller already
> > >    * holds @ct->lock.
> > >    *
> > > + * Callers that expect the GuC to reply with a G2H message must reserve the
> > > + * matching credit via @g2h_len / @num_g2h. The G2H receive path releases that
> > > + * credit unconditionally when the reply arrives, so failing to reserve it here
> > > + * corrupts the G2H accounting and kills the CT channel.
> > > + *
> > > + * Reserving G2H credit may wait for, and process, outstanding G2H messages, so
> > > + * this must not be called with a non-zero @g2h_len from a G2H handler. Handlers
> > > + * should use xe_guc_ct_send_g2h_handler(), with any reply credit reserved up
> > > + * front by the H2G that triggered the handler.
> > > + *
> > >    * If @defer_flush is false, the function completes the submission immediately:
> > >    * it makes the payload visible to the device, updates the H2G descriptor and
> > >    * rings the GuC doorbell.
> > > @@ -1312,11 +1324,12 @@ int xe_guc_ct_send(struct xe_guc_ct *ct, const u32 *action, u32 len,
> > >    *   Must be called with @ct->lock held.
> > >    */
> > >   int xe_guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
> > > -			  bool defer_flush)
> > > +			  u32 g2h_len, u32 num_g2h, bool defer_flush)
> > >   {
> > >   	int ret;
> > > -	ret = guc_ct_send_locked(ct, action, len, 0, 0, NULL, defer_flush);
> > > +	ret = guc_ct_send_locked(ct, action, len, g2h_len, num_g2h, NULL,
> > > +				 defer_flush);
> > >   	if (ret == -EDEADLK)
> > >   		kick_reset(ct);
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
> > > index 3ddc665ab84a..e2a33249d65d 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_ct.h
> > > +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
> > > @@ -56,7 +56,7 @@ static inline void xe_guc_ct_irq_handler(struct xe_guc_ct *ct)
> > >   int xe_guc_ct_send(struct xe_guc_ct *ct, const u32 *action, u32 len,
> > >   		   u32 g2h_len, u32 num_g2h);
> > >   int xe_guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
> > > -			  bool defer_flush);
> > > +			  u32 g2h_len, u32 num_g2h, bool defer_flush);
> > >   int xe_guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
> > >   			u32 *response_buffer);
> > >   static inline int
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_pagefault.c b/drivers/gpu/drm/xe/xe_guc_pagefault.c
> > > index df237fd40551..6b48550e7579 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_pagefault.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc_pagefault.c
> > > @@ -55,7 +55,8 @@ static void guc_ack_fault(struct xe_pagefault *pf, int err)
> > >   	bool write_only = guc->pagefault_ack_counter++ &
> > >   		(XE_GUC_PAGEFAULT_FLUSH_PERIOD - 1);
> > > -	xe_guc_ct_send_locked(&guc->ct, action, ARRAY_SIZE(action),
> > > +	/* Pagefault acks are fire-and-forget, no G2H reply expected. */
> > > +	xe_guc_ct_send_locked(&guc->ct, action, ARRAY_SIZE(action), 0, 0,
> > >   			      write_only);
> > >   }
> > > -- 
> > > 2.34.1
> > > 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
