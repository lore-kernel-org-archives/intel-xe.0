Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F9F0C3064D
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jun 2024 17:41:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8ADF10E6F5;
	Tue, 25 Jun 2024 17:41:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M4G8/O7m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5567B10E6F5
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Jun 2024 17:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719337305; x=1750873305;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=GoTVXMYVvGgEOQ4BcfECgRRvZ3kWhuoWn11YM0cfADY=;
 b=M4G8/O7me7ze5cD7Q0lCYNvWFrV1HaQXLS0Fz9SlluxjqpEF/7Lcf/TI
 F/WoVJkYp7aSkF5RIS76xu2CvGsxBnuLc3UoeJjUHR0ibmfMvbfHaBUPL
 DsVZWgjE+E4c2R12Dd5uvDU5RF11xeBpaxf/CHHolmmF3TVgmZ8hQBjdA
 pKW9KSDdf7E4QWSEDlsQ8coU2Mys0bYdciHskkfEDR5MwQaOqc8/idbYt
 NFHVKU4np8zd1V7yebyEFtrtMTsTZYBt8W+SzXfUGhUiuZiLPI/woemQP
 gFUb+izg7s1bxZK6RCItfljjSi42XTNN4Hhm1avZeIRuIAoRwKlABbhf8 Q==;
X-CSE-ConnectionGUID: ZLbqGCkjRMuVcFC8oWKI8w==
X-CSE-MsgGUID: 2rrPkMHpT62Pvda3UI7Bhg==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="20255624"
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; d="scan'208";a="20255624"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 10:41:45 -0700
X-CSE-ConnectionGUID: WuUlVJqeR2GE/EHBay3WSA==
X-CSE-MsgGUID: Rw+bcSHiQByrlFH/FIZS4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; d="scan'208";a="48714596"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Jun 2024 10:41:45 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 25 Jun 2024 10:41:44 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 25 Jun 2024 10:41:43 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 25 Jun 2024 10:41:43 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 25 Jun 2024 10:41:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LSk0r96Tbge8VQJVW3SN9WcIiU/jgkBw3Up9i7dBB8wvo6oi/qb6itnn/HD5zc1iuyiiMi4BOWR2769HptvT5t2J/pt7hz2xxgcIAdXq4IXc4qTZl/sHwJlMZxUJEv0h0axpjZgaAVPmPrzvI0B1R/0FZXMjd19R48u2xo6sIBKQUytaBF03BhQyKcMDddjNURU6zj1HdEn7Cqp1zdIK1SbHgaRSBXKjK+lwLPHV2KxO2mX99RQTc3AUvnSlfbtB1KpbCuVL5gDcIpPIIpCTe/1RfHZj0uLJzcf1V1Y6FEHJygKc5Fg3ShGV9H53ixYLBLAQG5UY3holy2VtQ46JKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RKhI2COTbLsBSpAmDKWPaAGQR9muhhLDXMJwDELHeNY=;
 b=cWuS0OzE5wsXFd49Ft03RCtsE5Opop2IUM8FeQyZKn9g4Ky5zCrznwV8F22eUKfOrx27DQ68zHlKNrgvOp1KPnJpXlgY2AymvhVN+HiaOGDYEpG8gOXNRqJheIIN9xx4YHDOsEGRTQQKCioDHCl5PK0Sv/nWpQYamV6xtPB5FodzZHIpSIfUNRn745i1JqfsfDODf3j7sjDVGzQCFeVGXlBkqoRwaasedwxdwx7W5hC23UnpZFXHxdn63oL2uNLSZk3aaaNcZxf0Ny8ehh0MFrjJwYgG4ysF4G8HH8Q6O6aMU8aWIf+wEEAkxzCYeAPb7hHHhFcGIxLSacqbkHmSlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB6568.namprd11.prod.outlook.com (2603:10b6:806:253::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Tue, 25 Jun
 2024 17:41:40 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.7698.025; Tue, 25 Jun 2024
 17:41:40 +0000
Date: Tue, 25 Jun 2024 17:41:01 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <lucas.demarchi@intel.com>
Subject: Re: [PATCH 2/2] drm/xe: Record utilization before destroying the
 exec queue
Message-ID: <ZnsBLb8x/Ma+JIxl@DUT025-TGLU.fm.intel.com>
References: <20240625165812.58411-1-umesh.nerlige.ramappa@intel.com>
 <20240625165812.58411-3-umesh.nerlige.ramappa@intel.com>
 <Znr9Mk8r1e2gvUja@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Znr9Mk8r1e2gvUja@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: BYAPR11CA0039.namprd11.prod.outlook.com
 (2603:10b6:a03:80::16) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB6568:EE_
X-MS-Office365-Filtering-Correlation-Id: 023fb153-5f95-4c2f-61b5-08dc953e1208
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230038|1800799022|366014|376012;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?nSNeYrkv0uBJmY8HawKs9fu/M/KAwy4Mii3yTscNz0F+UzV8Zbgteqojk6M6?=
 =?us-ascii?Q?KSiapLSTXiXJfVK5jz6CetU0XXxFS21ytPzwYUEYywo3dxCG0Qj4VXubyRan?=
 =?us-ascii?Q?7CGVks4g7yAS598I4DVvU5FpDF92HEku0jnrdgxQteeUmJ687nM40szvw4vA?=
 =?us-ascii?Q?lAwmQRsmxzhn2trqUHGtUPbPNq5umvJ9U0ZZaYOPk+zXaAG8xiVpinEIqpXj?=
 =?us-ascii?Q?yrlfTRd1CT73uB5xQhe2dHTR4tBMmnozgY8+Y8p38AagPrpUBQVMU5HVHkdq?=
 =?us-ascii?Q?qQzb7tiQ608p6R4L42DVmyBytDi17j1hUNZyCqR2ZS2yGBgSJ0fG+AUC4Pq5?=
 =?us-ascii?Q?JkmvtJ7Wkh4q0ilN3LWFvphQP2qWyqZzam2UJfyjZBhViIuUbtHQWPPdB2B/?=
 =?us-ascii?Q?l7zRJG/HptMoTWRti3qmQefCYharZN05mWRMh8FjDDfSzU4Npb1OxoqCEPdP?=
 =?us-ascii?Q?fZqsr/7iN2LgAt9GtsAfwRkfhleBw2X44jh0jjt5orTlfrwy3/qTyzNoy/Ny?=
 =?us-ascii?Q?3G3dp4aSIwqE800+l9b3roVpWBM65pvm/GMI9wMcxqtKYg7+v+/nfVqFSpsQ?=
 =?us-ascii?Q?P17pe1cnSPj7MX/vcex9UNBtiTnpgJ5gA0gy7Iu5grMaqrURlHctvzu+WuJD?=
 =?us-ascii?Q?VvLT3vczk1cbtPzvF7tfue+iY6QjG1H++qBe6XT3PTzABCt6ipGYgFmf2cI7?=
 =?us-ascii?Q?j2mYnHFRvC8ZHIk0WInReegjDlvUuVyBbgcjD4U+jCpISSG14VOnJbCTsRDe?=
 =?us-ascii?Q?/G17VOW8kHmrJECDDH0Yj2+rAT7eUtrC7LRsU10bP74o2QeTJBi2aUR5izbH?=
 =?us-ascii?Q?4n58eHLM2LQyZf1/Iuh0C5HWzrQuZT7swW2Zh7VYofMyQ8Hhhf2y/4+6lHMS?=
 =?us-ascii?Q?gBXQ1Ek2QPoOTTdO8en8wb6uTyFjhto/69DPzUF9PXJ33M20sHeUP2Yd+LCs?=
 =?us-ascii?Q?EfV8mM/kXg9X7fGHCxj8uFzEESFsUkw2KXHgwJj9+HADkWttfz3X8vIhQEkt?=
 =?us-ascii?Q?hvr+w0f1WkolZLad9dfTraNKb6lHAlfzZqenZUoyW2pAfyyy0KAf87gniB1d?=
 =?us-ascii?Q?ODIzomzgPo/F3xM8ryu+8KOOvRx9X39aKzSyS1pkEE1HONoJ5P83pyzcsi/p?=
 =?us-ascii?Q?wVtIW4GK/RJiL7i8ukHFrO79cuMCj1P8njH0tB+sC/4XNkXnBHcdX2TGosth?=
 =?us-ascii?Q?m1HOz5ipstDN0ZRT78U5rmnk+TnjmzIicrUfbTSCNeqRrCeiDlcmAW30m3gw?=
 =?us-ascii?Q?SOWjoSELpK8EbA2TUFzg4E1J9ecc3WMav0PnH/FPDzwqsXVfMtapoUQdE+aU?=
 =?us-ascii?Q?1YWEa/CvQ/fpLZoH2HM1w9mc?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230038)(1800799022)(366014)(376012); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Xkz+ZqRn2iJppLnBtzEOYh5p7er/6tZ0zV4m4iC0nn6dEyFOvnwhalsXZjQd?=
 =?us-ascii?Q?oEONsc4H6VRVqUkxdKDNqQhkPoS9x/oqORkp5EM2mcVAjOv/BIWJo+wNrjDd?=
 =?us-ascii?Q?PCkhvSMgGGKO0fgS6kJQe/La9vJqJUWPdEFS5DyA+XuyEfGpolATALYKJi5A?=
 =?us-ascii?Q?rI6prPriaSwcSxqivk3SBNQz3lIoOxltcrS7x5e8tIOWzvT6IQ88PvjEYxlI?=
 =?us-ascii?Q?HH5Ogv4V/eNh9M1gSjs/irQ1y5LZ3hpX+sgX4Cl4tG/x9dKs8QVVTVZVY8e0?=
 =?us-ascii?Q?jMmwvh2OM78SZAwyLXLdkvthuUwdrHMS8J2NITCTQFj5yJOiQ4zEilvCzer1?=
 =?us-ascii?Q?iwtu3eFYxy5JCy9kvSH55N9CEmcAmGOkRnG4Eo56UYtsdp/VHCR+r9oEByoA?=
 =?us-ascii?Q?BHzRWQysh/arpgEG4C9dHb4NsPx7ddgsU/33Jwy4wz0GoMozp2uLQt4YXCTb?=
 =?us-ascii?Q?Y7rAz9hmZSKLkOgW8v3xVNahazOFyAgSzeK9TJXYkgYvkbb5nHdLZx1NJm8b?=
 =?us-ascii?Q?pXOBp+h9ZRjFCx5J6JquVJu32htFSNZLSNG6gDrL8AeKE1Ir4+9/IYO9IQUY?=
 =?us-ascii?Q?Pi3BFfq+RA/MkYJdqsca5p5M0ZyzsNdrB1qDfgtQ+QCJFammldy3KZQ5nrTW?=
 =?us-ascii?Q?elLbuEszd9vw3BMspig/jKEbdGBD1h/eRzIedQUfsDfg4gcIENZuZEwl8dvT?=
 =?us-ascii?Q?UyHu/ixWzV8WniAic4YTDq0DElztbwxbvBmKbHNQRalbRVow63mws2GTtIaX?=
 =?us-ascii?Q?yCKHrYmI7SlB/DAtm/kCPk9ympphC3JFWOHc4wtPYNnPA88lMNC2yFBKdwS0?=
 =?us-ascii?Q?exP9R2fF9k2QafqdSIZwEnInt+u6/7wc7nep4jhkz+PyE3XyUV8xOo/ky4uR?=
 =?us-ascii?Q?ZLGFn2PnsV2SHZETXq4mMVHcTWGbqyV+WJC2R12WG/eEgM/drFKEFsgVnDYg?=
 =?us-ascii?Q?mcC7DBwHcMwXNNJahvuRnWxZWIYlPUwibdhdPtIycuZMbgebf2HCUwDZ/g9P?=
 =?us-ascii?Q?IC8WzjPelJUuCQV65mPsRlAUdCsNR9GfaoJfz5sczppJId0NmlXNbWX0HA1c?=
 =?us-ascii?Q?cwFZ2X2sHS9pnNIRpguJ1WNoPykaAIyVKkL295QEdQM4aaHMfoSa5wXmaksC?=
 =?us-ascii?Q?2AJCnJo45yW5M5RC7VI0u82UCbztSZONLyJoypQ7okk1fqjSyNFLxKqEuydL?=
 =?us-ascii?Q?oLo0mAUgG6EslUBI1VAVvBAWgt1FneC5Jny8d/+ehHnWj68ql3M3xgUjPQi4?=
 =?us-ascii?Q?rXou70dpqavwmxl5OsKRVw3bNS6Ehe0b3qRBzJuFKua/0AjrKD0jNORRbkUR?=
 =?us-ascii?Q?0akn8Ns0ieb41biDLl9/qMsa1AVKnkI9xjOube+mOFkz+G2/YArA8ufbYhx5?=
 =?us-ascii?Q?jp4fkb1q1qK73/LxSpUDZHIqHJk/SyLvrymtz7hxACP27dBuTejiPxgTa3Va?=
 =?us-ascii?Q?lmAXDZiDXSzsuSNnB6xXHylrz8jZullqFlPuXIAOmuFX+f8S4+NsR8BT1oE4?=
 =?us-ascii?Q?5wLQp5KlCnsvguFpuNqF4u5HjKwo7LAhmLiyz6ffGkxZlvzkbplnhetVvzFU?=
 =?us-ascii?Q?S5/witb9n/IQUxi2Zd2Ol7yvhGuoDkN96IRiLDipeLScXdH0TdUaAKLRenep?=
 =?us-ascii?Q?Kw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 023fb153-5f95-4c2f-61b5-08dc953e1208
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2024 17:41:40.4310 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oUi5zMf09d7N1Ij416Fcn5BELTx58gel2/KbocKp7RFZ1QtmLworb5aN/kw6MZA0ck5RestUMc+0efz28hyj7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6568
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

On Tue, Jun 25, 2024 at 05:24:02PM +0000, Matthew Brost wrote:
> On Wed, Jun 26, 2024 at 12:58:12AM +0800, Umesh Nerlige Ramappa wrote:
> > Current code captures utilization at the exec queue level whenever a job
> > is completed and then accumulates it into the xe file stats whenever the
> > user queries for per client engine utilization. There is a case where
> > utilization may be lost if the exec queue is destroyed before the user
> > queries the utilization. To overcome that, record the utlization when
> > the exec queue is destroyed.
> > 
> > To do so
> > 
> > 1) Wait for release of all other references to the exec queue. The wait
> >    uses the same timeout as the job scheduling timeout. On timeout, only
> >    a debug message is printed out since this is just a best effort to
> >    capture the utilization prior to destroying the queue.
> > 2) Before releasing the last reference in xe_exec_queue_destroy_ioctl(),
> >    record the utilization in the xe file stats.
> > 
> > Fixes: ce62827bc294 ("drm/xe: Do not access xe file when updating exec queue run_ticks")
> > Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_exec_queue.c       | 11 +++++++++++
> >  drivers/gpu/drm/xe/xe_exec_queue_types.h |  2 ++
> >  2 files changed, 13 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> > index 4d90a16745d2..f1028eaf2d7f 100644
> > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> > @@ -69,6 +69,7 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
> >  	q->ops = gt->exec_queue_ops;
> >  	INIT_LIST_HEAD(&q->lr.link);
> >  	INIT_LIST_HEAD(&q->multi_gt_link);
> > +	init_waitqueue_head(&q->wq);
> >  
> >  	q->sched_props.timeslice_us = hwe->eclass->sched_props.timeslice_us;
> >  	q->sched_props.preempt_timeout_us =
> > @@ -825,6 +826,7 @@ int xe_exec_queue_destroy_ioctl(struct drm_device *dev, void *data,
> >  	struct xe_file *xef = to_xe_file(file);
> >  	struct drm_xe_exec_queue_destroy *args = data;
> >  	struct xe_exec_queue *q;
> > +	int ret;
> >  
> >  	if (XE_IOCTL_DBG(xe, args->pad) ||
> >  	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
> > @@ -838,6 +840,15 @@ int xe_exec_queue_destroy_ioctl(struct drm_device *dev, void *data,
> >  
> >  	xe_exec_queue_kill(q);
> >  
> > +	ret = wait_event_timeout(q->wq, kref_read(&q->refcount) == 1,
> > +			(q->sched_props.job_timeout_ms/1000) * HZ);
> > +	if (!ret)
> > +		drm_dbg(&xe->drm, "Timedout waiting for exec queue run ticks update\n");
> > +
> 
> I can't say I love adding a wait to destroy IOCTL just to accurately
> report some stats. If we can't preempt this exec queue, the kill flow
> can take nearly .7s which would be pretty bad to block in the IOCTL.

Opps, my timing calculation is wrong here as I forget that we reduce to
the preemption timeoot to 1ms upon kill. But my point still stands from
an arch perspective blocking in an IOCTL to collect stats doesn't seem
right to me. Maybe others have a different opinion?

> Even the common case isn't great either...
> 
> Beyond that, this code breaks if the assumption of
> kref_read(&q->refcount) == 1 meaning all jobs are done. e.g. The wedging
> code == 2 takes an extra ref to the exec queue, so this IOCTL will hang
> forever even we wedge the device.

s/even we/if we/

Matt

> 
> Could this be added to exec queue backend code which adjusts on the
> final destroy? e.g. Add it to __guc_exec_queue_fini_async via
> xe_exec_queue_fini? Or does that not work because we don't have the xef?
> 
> Regardless if my suggestion works or not, surely we can do something to
> avoid waiting in this IOCTL. I suggest exploring another solution.
> 
> Matt
> 
> > +	mutex_lock(&xef->exec_queue.lock);
> > +	xef->run_ticks[q->class] += xe_exec_queue_delta_run_ticks(q);
> > +	mutex_unlock(&xef->exec_queue.lock);
> > +
> >  	trace_xe_exec_queue_close(q);
> >  	xe_exec_queue_put(q);
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > index 201588ec33c3..2ae4221d2f61 100644
> > --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > @@ -143,6 +143,8 @@ struct xe_exec_queue {
> >  	u64 old_run_ticks;
> >  	/** @run_ticks: hw engine class run time in ticks for this exec queue */
> >  	u64 run_ticks;
> > +	/** @wq: wait queue to wait for cleanup */
> > +	wait_queue_head_t wq;
> >  	/** @lrc: logical ring context for this exec queue */
> >  	struct xe_lrc *lrc[];
> >  };
> > -- 
> > 2.34.1
> > 
