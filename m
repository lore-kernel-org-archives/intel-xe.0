Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6D17C001DE
	for <intel-xe@archiver.kernel.org>; Fri, 28 Jul 2023 14:25:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B8B310E700;
	Fri, 28 Jul 2023 14:25:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FE0810E700
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Jul 2023 14:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690554310; x=1722090310;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=AsA8wKf/+VlOLYdD/7c9PsiP/qh05QMYTe3eS0U+teU=;
 b=EIbnCEPAw+c+hrGVoBRInQhKKAy8NCQcIyN1jPGEkIBIO6OrybxMKp6w
 9993EAM0RyEqcejS7qBTQ6dIuouqS/xlMuoS6et+6KMs+J02zBXwK7Xza
 QocOcOzy7V5sHAXnUj0jCVa8gBEj5vtvcltAZR6GJiNRNjhkIdrmkv0ys
 J87zI/yvL49jxWhGktWNRuc/60ym3yFEjK7hfZiFCTA2lKBhVJXwy7ZAO
 3kaczkvmlHylCYq+FUtbAzNh+Ogh8/Cat7km7cETGS8wI0B8BVixGNG5P
 gpkk8GZGiPI4j/Fmp0rd1FafKDfZDbN+dyOtrucMhA9VDT2Wq3pB4E/tA Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="371304124"
X-IronPort-AV: E=Sophos;i="6.01,237,1684825200"; d="scan'208";a="371304124"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2023 07:24:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="730774754"
X-IronPort-AV: E=Sophos;i="6.01,237,1684825200"; d="scan'208";a="730774754"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga007.fm.intel.com with ESMTP; 28 Jul 2023 07:24:54 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 28 Jul 2023 07:24:54 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 28 Jul 2023 07:24:54 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 28 Jul 2023 07:24:54 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 28 Jul 2023 07:24:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fgfVuowKBTcIz6guQjCHAo7AFyKTGs0TteXzgRB5jIZGPfC8Oq+1eVukpD8vsjFIyL69zZnAMu3oj9e+BGBl/nVFnvy18q7QBG5OJp3GJc3Qkhdh9uiGeBNRp1K5g4SfcZdnyYu6UFCItb59znqAY5E9zbARBR7wRkq8Yr0IpKdIXJhkNKi3D+XYp/EYJd64oearz8e+moQ69gTj06xGXpclfCYn2zv+nrDixfOY7wAYBnudvpDzffEApJ3IhDrU58g83Zpv7jPotqhWqjUm9775agwRnfT/wVag5xn2OHcgBPmS6W9UvniLqxJ9r6SBCBDJ4QfdEOv4FG0iYV71Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XGtsyUFKKvQAlF2oZE1bjbUX5TXYkTO4KW7LQAbcc+0=;
 b=Fv2GaSTRKg/bJjSj4LtDYYSWngbfWg/LBSpPYJZN5ThOhIxJm4s9d0SbSnCEFSKi5bYA/TlfuemDF/NKf/Mic6BVv2NWC/3kbbr8vifOzvM5nNrULUQqNxSQSkRyQYG9lmUBfVBfnlUb3gE2kqwU3thFeCzGz8n9mlKogug//UBPQMSbBOBbKmIRyPs09+wjbUjLUwjY9+K/c6N+hjr4hUREtHTvQRa/t3CjwLB6Hbf8N1LP4NHuGcZVp42bZOLpkGzIBLL814KkrZlI5SwbZDH6Ln/cxZoM7e4F5SDbDXZ6LvicxZPUxrJNV/frIR76s9CAsIsKx4TqPg80Mk2Jxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB5144.namprd11.prod.outlook.com (2603:10b6:510:3e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Fri, 28 Jul
 2023 14:24:51 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::5645:50f0:9b06:1dd0]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::5645:50f0:9b06:1dd0%3]) with mapi id 15.20.6631.026; Fri, 28 Jul 2023
 14:24:51 +0000
Date: Fri, 28 Jul 2023 14:24:02 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
Message-ID: <ZMPPgsfu+W2HzRcF@DUT025-TGLU.fm.intel.com>
References: <20230727082235.905240-1-tejas.upadhyay@intel.com>
 <20230727082235.905240-7-tejas.upadhyay@intel.com>
 <ZMKMuWeQBXsSo2Sb@DUT025-TGLU.fm.intel.com>
 <ZMNHp1f+wwyd9ZTB@nvishwa1-DESK>
 <ZMNMdIXaJrm4RKGJ@DUT025-TGLU.fm.intel.com>
 <SJ1PR11MB62041E3422EBC2A5D9ABC05C8106A@SJ1PR11MB6204.namprd11.prod.outlook.com>
 <ZMNfY83ZteSxWk3w@nvishwa1-DESK>
 <SJ1PR11MB62044364227D86A702DE966F8106A@SJ1PR11MB6204.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <SJ1PR11MB62044364227D86A702DE966F8106A@SJ1PR11MB6204.namprd11.prod.outlook.com>
X-ClientProxiedBy: BY3PR03CA0007.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::12) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB5144:EE_
X-MS-Office365-Filtering-Correlation-Id: 383aa37e-7865-48d7-3623-08db8f7667ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pRjdtqm7ZlnfvN1YnFZCpEPvozK4CUvJ1cccjAZp9ldsvC7J4aHF01HjsXicTTgUnA5v+mkJdiKMqFlXrj10zYLEEU456QFcvFM5JBOxrSsbmo5xaGAQI5KEMlpwV/3b/19xT8KznHF1yD9u089xkYBwbiE7BEdsBseAzwDRW/F6Pk/MbVb/dfWmE5LMmLhfA33MviRSpmbrRpMSU0MjiAJ/fniX52XQHSQiimf3y0RMnI57jBS3U2P6ZQ9OSevzauz1X1aXulw837ggOU94nur8L40s6+4PukRnSYL3P29ofH4lXMo3ctwrcNHkbWcdAm86LQjwnWApuXcvYw8IpjidXFI769QZ7Uc9snPU78rx1y+7sEdtQ6BYyPeMqT5hnekuEkzLhCbiQPs0fhXUCWdyq+RRneLtu6Z7SHmxz0G9v+sQp1N4EdOqcoBOtmdLY3MlzSJovJ0hbifKNwdgNDTN2j8rTMthrVcFx3dB9zdVhUCyq8m2LH8dolTFdEsIGPuBq3sVjHeOtOCDrBPtGK2vetJZqskoM4kPzyfmJkxiDxLMv+eQZuhgrLB31aR+hr8EEpBsW31SGxB84VhlpKUdUtre5pV1MnqemyM7bOpjbsyMFhDT64E2A8XkopQikHm35evp0GpkXwPMUuJBVQiXDNmMF4T9jfMBc7aFNfU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(136003)(346002)(39860400002)(396003)(376002)(451199021)(6862004)(30864003)(2906002)(6506007)(26005)(186003)(316002)(38100700002)(83380400001)(53546011)(66946007)(66556008)(5660300002)(44832011)(41300700001)(66476007)(8676002)(6636002)(8936002)(54906003)(82960400001)(6486002)(478600001)(6666004)(19627235002)(4326008)(6512007)(86362001)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SzC+KGKofDeRpWcFnVZODZPn08Sn8Cy6VdwxPyo7px9/L1dxAOgPt2IgqF2B?=
 =?us-ascii?Q?XEpR79+oHc04eHapUPCjjyRse5VdYhDHVtoSGSy4mTB6LMNIt5Vn7PhZ4xb1?=
 =?us-ascii?Q?PDyhS4VeAHHfT/1R33LNTRrrYfPt+xLG088cegvg5m2DuHFVtGcdUGqzwJQM?=
 =?us-ascii?Q?j4AyfQQeWGJIBFitC7U1p6tuV65aWEhhOSY6V2OdHHUEJV7CCaFlXQ0o8F0d?=
 =?us-ascii?Q?TUE1NZ9rFOwFyPglyN9FKLAOqjPvUGyihFTU0fR0Lrh0iGk2OnFbK+k1AOob?=
 =?us-ascii?Q?4+/vD17DbBj3jebRSmpfoxoFL1cV996alFY4t+GnwpnQOxDe3lieE0L4xr6+?=
 =?us-ascii?Q?x1Y2bxzD4fND0n08GPrVJRKFO6q6BmiSlOUiO4iih2bmHqwGaWAjwXvZTDhP?=
 =?us-ascii?Q?X32V/J6W3YRwyOUthdxUuaAsiesEvSgpuQHH3P1dlP+EOXMGcKaC4FMWVPRn?=
 =?us-ascii?Q?Nqa3pqWM8HfCaoblsYbf3t411th9gs9hSjy2Gn6Qtgp3dlJPd2Gl3HqHj8AV?=
 =?us-ascii?Q?bLWS9iDQ6GguH9fmoZa5dhuo3Q17gd3HeVVCJklaP6TSxC47dgevPSqEc/fj?=
 =?us-ascii?Q?HLSpWkH49Bmnz/jEjfqnzzcsHqEPhU1KK+NYF4gG0BpeU+6433VrFxXfD7kH?=
 =?us-ascii?Q?n3DDQnGAHicT1XLnFDxM9h39jvkGip2/DZe+MwQfvx8xYK5c26qWNMp8me0b?=
 =?us-ascii?Q?BEA0AgJ272Jp9Hwn91iaEYHL99w1iym2ypb8c8mIWgZBdUPlBet6QPXq90mI?=
 =?us-ascii?Q?o53mcTo6SEIvYtR8/Mf9FJFPLLcTdHE8Jev4uiVD5EigP7AUy2fJycaB/d4v?=
 =?us-ascii?Q?uPQ9ZIlYYc6kj+DZYM+jlk9T62pDyDw7M1F872s+AF6yv7mOj6cj9qN+RyUJ?=
 =?us-ascii?Q?RoJUoYLTrX/dS3Ppvh4ZvHTvIsscEIS80WQWQ54lNirGX6NLtbxSBPBEQQ16?=
 =?us-ascii?Q?vpAj0/JT2Zh7JatdWahIcMXSrmwpg3JH1379l+66N3M7fQzEiCAZjoTzKdJF?=
 =?us-ascii?Q?1nMQVAANJVnSLJCYDm77dUXu9bMdS3kBeIsOXOtPN0D4sWZG3ChI2ChoWzA6?=
 =?us-ascii?Q?GNFdgWp+TNzKI9yctz8GVSK2i5tkwvXjUELvzoupGJQmWQY2AkKdqvUxx1YF?=
 =?us-ascii?Q?lJNDYKurdy6whl3yz32GqHome1KG0H6mAOg9nmHJZaObIw3y3ShFuLujZWgt?=
 =?us-ascii?Q?aWSHLPPygWlkm4jSNi8P1meq0v0eEcRlhk3Gy45q5YkjnufnsgImrjKCFJns?=
 =?us-ascii?Q?8nWHKNI3lrPi0wI+u9C2ExjADkfV3Kdb/oJURtlnYLzMja3ZPGhtMw/gUYpD?=
 =?us-ascii?Q?iKMgMyQXpLmI0UC6uF75mw/J7aE6RlhevYihVZi3VFWpxS2KKxmWGygDEy5V?=
 =?us-ascii?Q?qzpRldHmyTTrOphUv0PLU3+4g5t7ArH403ZOvjjWx7DEn4rrW2hCZXpY/7Df?=
 =?us-ascii?Q?EycbEoRSGiEn+OZ4k989VunHGz1YOYW3Sr1usXumtLxBXHC45rSGyRs9M82c?=
 =?us-ascii?Q?54Ge5ImKj2+C92bLyEo28ryU3t/qYbqJa6Mel+Sq1E3XNnH6m01L+3kWx630?=
 =?us-ascii?Q?U0rdtmt9fNJFQnKIRfrtZjIt6Al8rzxAX/g/jEiozMkNaWz6QQZRfQPgT8Pf?=
 =?us-ascii?Q?Nw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 383aa37e-7865-48d7-3623-08db8f7667ca
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2023 14:24:51.4722 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7CQmQzSh7xvM3Vjga2WzXvhgNsw5o+0ZmeJqz/e2kEx4loEh1FJWhL+IbGc4UIYFxMTkarVl5ubphZgExfS16g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5144
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH V9 6/6] drm/xe: Add min/max cap for engine
 scheduler properties
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Jul 28, 2023 at 01:36:29AM -0600, Upadhyay, Tejas wrote:
> 
> 
> > -----Original Message-----
> > From: Vishwanathapura, Niranjana <niranjana.vishwanathapura@intel.com>
> > Sent: Friday, July 28, 2023 11:56 AM
> > To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> > Cc: Brost, Matthew <matthew.brost@intel.com>; intel-
> > xe@lists.freedesktop.org
> > Subject: Re: [PATCH V9 6/6] drm/xe: Add min/max cap for engine scheduler
> > properties
> > 
> > On Thu, Jul 27, 2023 at 10:54:42PM -0700, Upadhyay, Tejas wrote:
> > >
> > >
> > >> -----Original Message-----
> > >> From: Brost, Matthew <matthew.brost@intel.com>
> > >> Sent: Friday, July 28, 2023 10:35 AM
> > >> To: Vishwanathapura, Niranjana
> > <niranjana.vishwanathapura@intel.com>
> > >> Cc: Upadhyay, Tejas <tejas.upadhyay@intel.com>; intel-
> > >> xe@lists.freedesktop.org
> > >> Subject: Re: [PATCH V9 6/6] drm/xe: Add min/max cap for engine
> > >> scheduler properties
> > >>
> > >> On Thu, Jul 27, 2023 at 09:44:23PM -0700, Niranjana Vishwanathapura
> > >> wrote:
> > >> > On Thu, Jul 27, 2023 at 03:26:49PM +0000, Matthew Brost wrote:
> > >> > > On Thu, Jul 27, 2023 at 01:52:35PM +0530, Tejas Upadhyay wrote:
> > >> > > > Add sysfs entries for the min, max, and defaults for each of
> > >> > > > engine scheduler controls for every hardware engine class.
> > >> > > >
> > >> > > > Non-elevated user IOCTLs to set these controls must be within
> > >> > > > the min-max ranges of the sysfs entries, elevated user can set
> > >> > > > these controls to any value. However, introduced compile time
> > >> > > > CONFIG min-max values which restricts elevated user to be in
> > >> > > > compile time min-max range if at all sysfs min/max are violated.
> > >> > > >
> > >> > > > Sysfs entries examples are,
> > >> > > > DUT# cat
> > /sys/class/drm/cardX/device/tileN/gtN/engines/ccs/.defaults/
> > >> > > > job_timeout_max         job_timeout_ms          preempt_timeout_min
> > >> timeslice_duration_max  timeslice_duration_us
> > >> > > > job_timeout_min         preempt_timeout_max
> > preempt_timeout_us
> > >> timeslice_duration_min
> > >> > > >
> > >> > > > DUT# cat /sys/class/drm/card1/device/tileN/gtN/engines/ccs/
> > >> > > > .defaults/              job_timeout_min         preempt_timeout_max
> > >> preempt_timeout_us      timeslice_duration_min
> > >> > > > job_timeout_max         job_timeout_ms          preempt_timeout_min
> > >> timeslice_duration_max  timeslice_duration_us
> > >> > > >
> > >> > > > V9 :
> > >> > > >    - Rebase to use s/xe_engine/xe_hw_engine/ - Matt
> > >> > > > V8 :
> > >> > > >    - fix enforce_sched_limit and avoid code duplication - Niranjana
> > >> > > >    - Make sure min < max - Niranjana
> > >> > > > V7 :
> > >> > > >    - Rebase to replace hw engine with eclass interface
> > >> > > >    - return EINVAL in place of EPERM
> > >> > > >    - Use some APIs to avoid code duplication
> > >> > > > V6 :
> > >> > > >    - Rebase changes to reflect per engine class props interface - MattB
> > >> > > >    - Use #if ENABLED - MattB
> > >> > > >    - Remove MAX_SCHED_TIMEOUT check as range validation is
> > >> > > > enough
> > >> > > > V5 :
> > >> > > >    - Rebase to resolve conflicts - CI
> > >> > > > V4 :
> > >> > > >    - Rebase
> > >> > > >    - Update commit to reflect tile addition
> > >> > > >    - Use XE_HW macro directly as they are already filtered
> > >> > > >      for CONFIG checks - Niranjana
> > >> > > >    - Add CONFIG for enable/disable min/max limitation
> > >> > > >      on elevated user. Default is enable - Matt/Joonas
> > >> > > > V3 :
> > >> > > >    - Resolve CI hooks warning for kernel-doc
> > >> > > > V2 :
> > >> > > >    - Restric min/max setting to #define default min/max for
> > >> > > >      elevated user - Himal
> > >> > > >    - Remove unrelated changes from patch - Niranjana
> > >> > > >
> > >> > > > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > >> > > > ---
> > >> > > >  drivers/gpu/drm/xe/Kconfig                    |   6 +
> > >> > > >  drivers/gpu/drm/xe/Kconfig.profile            |  46 +++
> > >> > > >  drivers/gpu/drm/xe/xe_engine.c                |  25 +-
> > >> > > >  drivers/gpu/drm/xe/xe_hw_engine.c             |   8 +
> > >> > > >  drivers/gpu/drm/xe/xe_hw_engine.h             |  31 ++
> > >> > > >  drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c | 354
> > >> ++++++++++++++++++
> > >> > > >  drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h |   2 +
> > >> > > >  7 files changed, 466 insertions(+), 6 deletions(-)  create
> > >> > > > mode
> > >> > > > 100644 drivers/gpu/drm/xe/Kconfig.profile
> > >> > > >
> > >> > > > diff --git a/drivers/gpu/drm/xe/Kconfig
> > >> > > > b/drivers/gpu/drm/xe/Kconfig index d44794f99338..0a4ea965645b
> > >> > > > 100644
> > >> > > > --- a/drivers/gpu/drm/xe/Kconfig
> > >> > > > +++ b/drivers/gpu/drm/xe/Kconfig
> > >> > > > @@ -83,3 +83,9 @@ depends on DRM_XE  depends on EXPERT
> > source
> > >> > > > "drivers/gpu/drm/xe/Kconfig.debug"
> > >> > > >  endmenu
> > >> > > > +
> > >> > > > +menu "drm/xe Profile Guided Optimisation"
> > >> > > > +	visible if EXPERT
> > >> > > > +	depends on DRM_XE
> > >> > > > +	source "drivers/gpu/drm/xe/Kconfig.profile"
> > >> > > > +endmenu
> > >> > > > diff --git a/drivers/gpu/drm/xe/Kconfig.profile
> > >> > > > b/drivers/gpu/drm/xe/Kconfig.profile
> > >> > > > new file mode 100644
> > >> > > > index 000000000000..e72f15ec4bf6
> > >> > > > --- /dev/null
> > >> > > > +++ b/drivers/gpu/drm/xe/Kconfig.profile
> > >> > > > @@ -0,0 +1,46 @@
> > >> > > > +config DRM_XE_JOB_TIMEOUT_MAX
> > >> > > > +       int "Default max job timeout (ms)"
> > >> > > > +       default 10000 # milliseconds
> > >> > > > +       help
> > >> > > > +         Configures the default max job timeout after which job will
> > >> > > > +         be forcefully taken away from scheduler.
> > >> > > > +config DRM_XE_JOB_TIMEOUT_MIN
> > >> > > > +       int "Default max job timeout (ms)"
> > >> > > > +       default 1 # milliseconds
> > >> > > > +       help
> > >> > > > +         Configures the default min job timeout after which job will
> > >> > > > +         be forcefully taken away from scheduler.
> > >> > > > +config DRM_XE_TIMESLICE_MAX
> > >> > > > +       int "Default max timeslice duration (us)"
> > >> > > > +       default 10000000 # microseconds
> > >> > > > +       help
> > >> > > > +         Configures the default max timeslice duration between
> > multiple
> > >> > > > +         contexts by guc scheduling.
> > >> > > > +config DRM_XE_TIMESLICE_MIN
> > >> > > > +       int "Default min timeslice duration (us)"
> > >> > > > +       default 1 # microseconds
> > >> > > > +       help
> > >> > > > +         Configures the default min timeslice duration between
> > multiple
> > >> > > > +         contexts by guc scheduling.
> > >> > > > +config DRM_XE_PREEMPT_TIMEOUT_MAX
> > >> > > > +       int "Default max  preempt timeout (us)"
> > >> > > > +       default 10000000 # microseconds
> > >> > > > +       help
> > >> > > > +         Configures the default max preempt timeout after which
> > context
> > >> > > > +         will be forcefully taken away and higher priority context will
> > >> > > > +         run.
> > >> > > > +config DRM_XE_PREEMPT_TIMEOUT_MIN
> > >> > > > +       int "Default min  preempt timeout (us)"
> > >> > > > +       default 1 # microseconds
> > >> > > > +       help
> > >> > > > +         Configures the default min preempt timeout after which
> > context
> > >> > > > +         will be forcefully taken away and higher priority context will
> > >> > > > +         run.
> > >> > > > +config DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT
> > >> > > > +       bool "Default configuration of limitation on scheduler timeout"
> > >> > > > +       default y
> > >> > > > +       help
> > >> > > > +	 Configures the enablement of limitation on scheduler
> > timeout
> > >> > > > +	 to apply to applicable user. For elevated user, all above MIN
> > >> > > > +	 and MAX values will apply when this configuration is enable
> > to
> > >> > > > +	 apply limitation. By default limitation is applied.
> > >> > > > diff --git a/drivers/gpu/drm/xe/xe_engine.c
> > >> > > > b/drivers/gpu/drm/xe/xe_engine.c index
> > >> > > > 9e167b113963..d934196eb79f
> > >> > > > 100644
> > >> > > > --- a/drivers/gpu/drm/xe/xe_engine.c
> > >> > > > +++ b/drivers/gpu/drm/xe/xe_engine.c
> > >> > > > @@ -13,6 +13,7 @@
> > >> > > >
> > >> > > >  #include "xe_device.h"
> > >> > > >  #include "xe_gt.h"
> > >> > > > +#include "xe_hw_engine_class_sysfs.h"
> > >> > > >  #include "xe_hw_fence.h"
> > >> > > >  #include "xe_lrc.h"
> > >> > > >  #include "xe_macros.h"
> > >> > > > @@ -191,8 +192,12 @@ static int engine_set_priority(struct
> > >> > > > xe_device *xe, struct xe_engine *e,  static int
> > >> engine_set_timeslice(struct xe_device *xe, struct xe_engine *e,
> > >> > > >  				u64 value, bool create)
> > >> > > >  {
> > >> > > > -	if (!capable(CAP_SYS_NICE))
> > >> > > > -		return -EPERM;
> > >> > > > +	u32 min = e->hwe->eclass->sched_props.timeslice_min;
> > >> > > > +	u32 max = e->hwe->eclass->sched_props.timeslice_max;
> > >> > >
> > >> > > So I screwed this up in my last comment, sorry.
> > >> > >
> > >> > > min = cap_nice ? KConfig option for min :
> > >> > > e->hwe->eclass->sched_props.timeslice_min;
> > >> > > same logic for max;
> > >> > >
> > >> > > Probably add helper for this.
> > >> > >
> > >> > > > +
> > >> > > > +	if (enforce_schedule_limit() &&
> > >> > > > +	    !engine_timeout_in_range(value, min, max))
> > >> > >
> > >> > > Then I think logic works too...
> > >> > >
> > >> > > if cap nice && !Kconfig option to enfore limits
> > >> > > (enforce_schedule_limit
> > >> returns false):
> > >> > > 	user can do whatever
> > >> > > else if cap nice
> > >> > > 	user within Kconfig range
> > >> > > else
> > >> > > 	user within sysfs range
> > >> > >
> > >> > > This is what we want in the end.
> > >> > >
> > >> >
> > >> > Matt, I think this is exactly what the previous revision of the
> > >> > patch was
> > >> doing.
> > >> >
> > >>
> > >> No... Previous version
> > >>
> > >> min = Kconfig option to enfore limits ? KConfig option for min :
> > >> e->hwe-
> > >> >eclass->sched_props.timeslice_min
> > >> same for max
> > >>
> > >> Results in:
> > >>
> > >> if cap nice && !Kconfig option to enfore limits
> > >> (enforce_schedule_limit returns false):
> > >> 	user can do whatever
> > >> else if cap_nice || Kconfig option to enfore limit
> > >> 	user within Kconfig range
> > >> else
> > >>  	user within sysfs range
> > >>
> > >> !cap_nice && Kconfig option to enfore limits == user within Kconfig
> > >> range
> > >> (previously) !cap_nice && Kconfig option to enfore limits == user
> > >> within sysfs range (my suggestion)
> > >
> > >In previous version we can achieve it by just adding one below check right?
> > >#if IS_ENABLED(CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT) &&
> > cap_nice
> > >+       u32 min = XE_HW_ENGINE_TIMESLICE_MIN;
> > >+       u32 max = XE_HW_ENGINE_TIMESLICE_MAX; #else
> > >+       u32 min = e->hwe->eclass->sched_props.timeslice_min;
> > >+       u32 max = e->hwe->eclass->sched_props.timeslice_max;
> > >+#endif
> > >
> > >Please let me know!
> > >
> > 
> > Ah I see. Yah, it is a limits selection issue.
> > We can do,
> > 
> > u32 min = e->hwe->eclass->sched_props.timeslice_min;
> > u32 max = e->hwe->eclass->sched_props.timeslice_max;
> > 
> > #if IS_ENABLED(CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT)
> >          if (cap_nice) {
> >                  u32 min = XE_HW_ENGINE_TIMESLICE_MIN;
> >                  u32 max = XE_HW_ENGINE_TIMESLICE_MAX;
> >          }
> > #endif
> > 
> > Matt, Tejas
> > Also, looks like you missed my another comment below.
> > 
> > Niranjana
> > 
> > >>
> > >> The logic is different and I believe we want what I'm suggesting.
> > >>
> > >> Matt
> > >>
> > >> > > > +		return -EINVAL;
> > >> > > >
> > >> > > >  	return e->ops->set_timeslice(e, value);  } @@ -201,8 +206,12
> > >> > > > @@ static int engine_set_preemption_timeout(struct xe_device *xe,
> > >> > > >  					 struct xe_engine *e, u64
> > value,
> > >> > > >  					 bool create)
> > >> > > >  {
> > >> > > > -	if (!capable(CAP_SYS_NICE))
> > >> > > > -		return -EPERM;
> > >> > > > +	u32 min = e->hwe->eclass-
> > >sched_props.preempt_timeout_min;
> > >> > > > +	u32 max = e->hwe->eclass-
> > >sched_props.preempt_timeout_max;
> > >> > > > +
> > >> > > > +	if (enforce_schedule_limit() &&
> > >> > > > +	    !engine_timeout_in_range(value, min, max))
> > >> > > > +		return -EINVAL;
> > >> > > >
> > >> > > >  	return e->ops->set_preempt_timeout(e, value);  } @@ -
> > 266,11
> > >> > > > +275,15 @@ static int engine_set_persistence(struct xe_device
> > >> > > > +*xe,
> > >> > > > struct xe_engine *e,  static int engine_set_job_timeout(struct
> > >> > > > xe_device
> > >> *xe, struct xe_engine *e,
> > >> > > >  				  u64 value, bool create)
> > >> > > >  {
> > >> > > > +	u32 min = e->hwe->eclass->sched_props.job_timeout_min;
> > >> > > > +	u32 max = e->hwe->eclass->sched_props.job_timeout_max;
> > >> > > > +
> > >> > > >  	if (XE_IOCTL_DBG(xe, !create))
> > >> > > >  		return -EINVAL;
> > >> > > >
> > >> > > > -	if (!capable(CAP_SYS_NICE))
> > >> > > > -		return -EPERM;
> > >> > > > +	if (enforce_schedule_limit() &&
> > >> > > > +	    !engine_timeout_in_range(value, min, max))
> > >> > > > +		return -EINVAL;
> > >> > > >
> > >> > > >  	return e->ops->set_job_timeout(e, value);  } diff --git
> > >> > > > a/drivers/gpu/drm/xe/xe_hw_engine.c
> > >> > > > b/drivers/gpu/drm/xe/xe_hw_engine.c
> > >> > > > index afa7d25c3852..e601bffe3b13 100644
> > >> > > > --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> > >> > > > +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> > >> > > > @@ -364,8 +364,16 @@ static void hw_engine_init_early(struct
> > >> > > > xe_gt *gt, struct xe_hw_engine *hwe,
> > >> > > >
> > >> > > >  	if (!gt->eclass[hwe->class].sched_props.job_timeout_ms) {
> > >> > > >  		gt->eclass[hwe->class].sched_props.job_timeout_ms
> > = HZ *
> > >> 5;
> > >> > > > +		gt->eclass[hwe-
> > >class].sched_props.job_timeout_min =
> > >> XE_HW_ENGINE_JOB_TIMEOUT_MIN;
> > >> > > > +		gt->eclass[hwe-
> > >class].sched_props.job_timeout_max =
> > >> > > > +XE_HW_ENGINE_JOB_TIMEOUT_MAX;
> > >> > > >  		gt->eclass[hwe->class].sched_props.timeslice_us = 1
> > * 1000;
> > >> > > > +		gt->eclass[hwe->class].sched_props.timeslice_min =
> > >> XE_HW_ENGINE_TIMESLICE_MIN;
> > >> > > > +		gt->eclass[hwe->class].sched_props.timeslice_max =
> > >> > > > +XE_HW_ENGINE_TIMESLICE_MAX;
> > >> > > >  		gt->eclass[hwe-
> > >class].sched_props.preempt_timeout_us =
> > >> 640 *
> > >> > > > 1000;
> > >> > > > +		gt->eclass[hwe-
> > >class].sched_props.preempt_timeout_min =
> > >> > > > +
> > >> 	XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN;
> > >> > > > +		gt->eclass[hwe-
> > >class].sched_props.preempt_timeout_max =
> > >> > > > +
> > >> 	XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX;
> > >> > > >  		/* Record default props */
> > >> > > >  		gt->eclass[hwe->class].defaults = gt->eclass[hwe-
> > >> >class].sched_props;
> > >> > > >  	}
> > >> > > > diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h
> > >> > > > b/drivers/gpu/drm/xe/xe_hw_engine.h
> > >> > > > index 7eca9d53c7b1..3d37d6d44261 100644
> > >> > > > --- a/drivers/gpu/drm/xe/xe_hw_engine.h
> > >> > > > +++ b/drivers/gpu/drm/xe/xe_hw_engine.h
> > >> > > > @@ -10,6 +10,37 @@
> > >> > > >
> > >> > > >  struct drm_printer;
> > >> > > >
> > >> > > > +#ifdef CONFIG_DRM_XE_JOB_TIMEOUT_MIN #define
> > >> > > > +XE_HW_ENGINE_JOB_TIMEOUT_MIN
> > >> CONFIG_DRM_XE_JOB_TIMEOUT_MIN #else
> > >> > > > +#define XE_HW_ENGINE_JOB_TIMEOUT_MIN 1 #endif #ifdef
> > >> > > > +CONFIG_DRM_XE_JOB_TIMEOUT_MAX #define
> > >> > > > +XE_HW_ENGINE_JOB_TIMEOUT_MAX
> > >> CONFIG_DRM_XE_JOB_TIMEOUT_MAX #else
> > >> > > > +#define XE_HW_ENGINE_JOB_TIMEOUT_MAX (10 * 1000) #endif
> > #ifdef
> > >> > > > +CONFIG_DRM_XE_TIMESLICE_MIN #define
> > >> XE_HW_ENGINE_TIMESLICE_MIN
> > >> > > > +CONFIG_DRM_XE_TIMESLICE_MIN #else #define
> > >> > > > +XE_HW_ENGINE_TIMESLICE_MIN 1 #endif #ifdef
> > >> > > > +CONFIG_DRM_XE_TIMESLICE_MAX #define
> > >> XE_HW_ENGINE_TIMESLICE_MAX
> > >> > > > +CONFIG_DRM_XE_TIMESLICE_MAX #else #define
> > >> > > > +XE_HW_ENGINE_TIMESLICE_MAX (10 * 1000 * 1000) #endif #ifdef
> > >> > > > +CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN
> > >> > > > +#define XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN
> > >> > > > +CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN #else #define
> > >> > > > +XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN 1 #endif #ifdef
> > >> > > > +CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX
> > >> > > > +#define XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX
> > >> > > > +CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX #else #define
> > >> > > > +XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX (10 * 1000 * 1000)
> > #endif
> > >> > > > +
> > >> > > >  int xe_hw_engines_init_early(struct xe_gt *gt);  int
> > >> > > > xe_hw_engines_init(struct xe_gt *gt);  void
> > >> > > > xe_hw_engine_handle_irq(struct xe_hw_engine *hwe, u16
> > >> > > > intr_vec); diff --git
> > >> > > > a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> > >> > > > b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> > >> > > > index 990bb675d1e0..2b7ac4e02db6 100644
> > >> > > > --- a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> > >> > > > +++ b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> > >> > > > @@ -11,6 +11,20 @@
> > >> > > >
> > >> > > >  static int xe_add_hw_engine_class_defaults(struct kobject
> > >> > > > *parent);
> > >> > > >
> > >> > > > +bool enforce_schedule_limit(void) { #if
> > >> > > > +IS_ENABLED(CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT)
> > >> > > > +	return true;
> > >> > > > +#else
> > >> > > > +	return !capable(CAP_SYS_NICE); #endif }
> > >> > > > +
> > >> > > > +bool engine_timeout_in_range(u64 timeout, u64 min, u64 max) {
> > >> > > > +	return timeout >= min && timeout <= max; }
> > >> > > > +
> > >> > > >  static void kobj_xe_hw_engine_release(struct kobject *kobj)  {
> > >> > > >  	kfree(kobj);
> > >> > > > @@ -39,11 +53,92 @@ kobj_xe_hw_engine_class(struct kobject
> > >> *parent, char *name)
> > >> > > >  	return keclass;
> > >> > > >  }
> > >> > > >
> > >> > > > +static ssize_t job_timeout_max_store(struct kobject *kobj,
> > >> > > > +				     struct kobj_attribute *attr,
> > >> > > > +				     const char *buf, size_t count) {
> > >> > > > +	struct xe_hw_engine_class_intf *eclass =
> > kobj_to_eclass(kobj);
> > >> > > > +	u32 timeout;
> > >> > > > +	int err;
> > >> > > > +
> > >> > > > +	err = kstrtou32(buf, 0, &timeout);
> > >> > > > +	if (err)
> > >> > > > +		return err;
> > >> > > > +
> > >> > > > +	if (timeout < eclass->sched_props.job_timeout_min)
> > >> > > > +		return -EINVAL;
> > >> > > > +
> > >> > > > +	if (enforce_schedule_limit() &&
> > >> > > > +	    !engine_timeout_in_range(timeout,
> > >> > > > +
> > XE_HW_ENGINE_JOB_TIMEOUT_MIN,
> > >> > > > +
> > XE_HW_ENGINE_JOB_TIMEOUT_MAX))
> > >> > > > +		return -EINVAL;
> > >> > > > +
> > >> > > > +	WRITE_ONCE(eclass->sched_props.job_timeout_max,
> > timeout);
> > >> > > > +
> > >> > > > +	return count;
> > >> > > > +}
> > >> > > > +
> > >> > > > +static ssize_t job_timeout_max_show(struct kobject *kobj,
> > >> > > > +				    struct kobj_attribute *attr, char
> > *buf) {
> > >> > > > +	struct xe_hw_engine_class_intf *eclass =
> > >> > > > +kobj_to_eclass(kobj);
> > >> > > > +
> > >> > > > +	return sprintf(buf, "%u\n",
> > >> > > > +eclass->sched_props.job_timeout_max);
> > >> > > > +}
> > >> > > > +
> > >> > > > +static struct kobj_attribute job_timeout_max_attr =
> > >> > > > +__ATTR(job_timeout_max, 0644, job_timeout_max_show,
> > >> > > > +job_timeout_max_store);
> > >> > > > +
> > >> > > > +static ssize_t job_timeout_min_store(struct kobject *kobj,
> > >> > > > +				     struct kobj_attribute *attr,
> > >> > > > +				     const char *buf, size_t count) {
> > >> > > > +	struct xe_hw_engine_class_intf *eclass =
> > kobj_to_eclass(kobj);
> > >> > > > +	u32 timeout;
> > >> > > > +	int err;
> > >> > > > +
> > >> > > > +	err = kstrtou32(buf, 0, &timeout);
> > >> > > > +	if (err)
> > >> > > > +		return err;
> > >> > > > +
> > >> > > > +	if (timeout > eclass->sched_props.job_timeout_max)
> > >> > > > +		return -EINVAL;
> > >> > > > +
> > >> > > > +	if (enforce_schedule_limit() &&
> > >> > > > +	    !engine_timeout_in_range(timeout,
> > >> > > > +
> > XE_HW_ENGINE_JOB_TIMEOUT_MIN,
> > >> > > > +
> > XE_HW_ENGINE_JOB_TIMEOUT_MAX))
> > >> > > > +		return -EINVAL;
> > >> > > > +
> > >> > > > +	WRITE_ONCE(eclass->sched_props.job_timeout_min,
> > timeout);
> > >> > > > +
> > >> > > > +	return count;
> > >> > > > +}
> > >> > > > +
> > >> > > > +static ssize_t job_timeout_min_show(struct kobject *kobj,
> > >> > > > +				    struct kobj_attribute *attr, char
> > *buf) {
> > >> > > > +	struct xe_hw_engine_class_intf *eclass =
> > >> > > > +kobj_to_eclass(kobj);
> > >> > > > +
> > >> > > > +	return sprintf(buf, "%u\n",
> > >> > > > +eclass->sched_props.job_timeout_min);
> > >> > > > +}
> > >> > > > +
> > >> > > > +static struct kobj_attribute job_timeout_min_attr =
> > >> > > > +__ATTR(job_timeout_min, 0644, job_timeout_min_show,
> > >> > > > +job_timeout_min_store);
> > >> > > > +
> > >> > > >  static ssize_t job_timeout_store(struct kobject *kobj,
> > >> > > >  				 struct kobj_attribute *attr,
> > >> > > >  				 const char *buf, size_t count)  {
> > >> > > >  	struct xe_hw_engine_class_intf *eclass =
> > >> > > > kobj_to_eclass(kobj);
> > >> > > > +#if IS_ENABLED(CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT)
> > >> > > > +	u32 min = XE_HW_ENGINE_JOB_TIMEOUT_MIN;
> > >> > > > +	u32 max = XE_HW_ENGINE_JOB_TIMEOUT_MAX; #else
> > >> > > > +	u32 min = e->hwe->eclass->sched_props.job_timeout_min;
> > >> > > > +	u32 max = e->hwe->eclass->sched_props.job_timeout_max;
> > >> > > > +#endif
> > >> > >
> > >> > > I don't think we need this, just make sure default is within min
> > >> > > / max of the sched_props.
> > >> > >
> > >> >
> > >> > Shouldn't the sched_prop set through sysfs here which applies to
> > >> > all future user engines (xe_engine) has the same requirement as the
> > >> > sched_prop set directly to user engine (xe_engine) through
> > >> > set_properly
> > >> ioctl?
> > >> > ie., shoudln't the requirement be same in job_timeout_store() and
> > >> > engine_set_job_timeout()?
> 
> I also think it should apply same to sysfs calls as well. Unless we think sysfs should limit to compile configs only. Since sysfs min/max cab be changed.
> 

Disagree, the min / max sysfs entries are subject to the Kconfig limits.
So if you check the sysfs entry min / max here, the initial value will
always be within the Kconfig limits plus any additional restrictions a
user has imposed.

Matt

> Thanks,
> Tejas
> 
> > >> >
> > >> > Niranjana
> > >> >
> > >> > > Matt
> > >> > >
> > >> > > >  	u32 timeout;
> > >> > > >  	int err;
> > >> > > >
> > >> > > > @@ -51,6 +146,10 @@ static ssize_t job_timeout_store(struct
> > >> > > > kobject
> > >> *kobj,
> > >> > > >  	if (err)
> > >> > > >  		return err;
> > >> > > >
> > >> > > > +	if (enforce_schedule_limit() &&
> > >> > > > +	    !engine_timeout_in_range(timeout, min, max))
> > >> > > > +		return -EINVAL;
> > >> > > > +
> > >> > > >  	WRITE_ONCE(eclass->sched_props.job_timeout_ms,
> > timeout);
> > >> > > >
> > >> > > >  	return count;
> > >> > > > @@ -78,11 +177,40 @@ static ssize_t job_timeout_default(struct
> > >> > > > kobject *kobj,  static struct kobj_attribute job_timeout_def =
> > >> > > > __ATTR(job_timeout_ms, 0444, job_timeout_default, NULL);
> > >> > > >
> > >> > > > +static ssize_t job_timeout_min_default(struct kobject *kobj,
> > >> > > > +				       struct kobj_attribute *attr, char
> > *buf) {
> > >> > > > +	struct xe_hw_engine_class_intf *eclass =
> > >> > > > +kobj_to_eclass(kobj->parent);
> > >> > > > +
> > >> > > > +	return sprintf(buf, "%u\n",
> > >> > > > +eclass->defaults.job_timeout_min);
> > >> > > > +}
> > >> > > > +
> > >> > > > +static struct kobj_attribute job_timeout_min_def =
> > >> > > > +__ATTR(job_timeout_min, 0444, job_timeout_min_default, NULL);
> > >> > > > +
> > >> > > > +static ssize_t job_timeout_max_default(struct kobject *kobj,
> > >> > > > +				       struct kobj_attribute *attr, char
> > *buf) {
> > >> > > > +	struct xe_hw_engine_class_intf *eclass =
> > >> > > > +kobj_to_eclass(kobj->parent);
> > >> > > > +
> > >> > > > +	return sprintf(buf, "%u\n",
> > >> > > > +eclass->defaults.job_timeout_max);
> > >> > > > +}
> > >> > > > +
> > >> > > > +static struct kobj_attribute job_timeout_max_def =
> > >> > > > +__ATTR(job_timeout_max, 0444, job_timeout_max_default, NULL);
> > >> > > > +
> > >> > > >  static ssize_t timeslice_duration_store(struct kobject *kobj,
> > >> > > >  					struct kobj_attribute *attr,
> > >> > > >  					const char *buf, size_t count)
> > {
> > >> > > >  	struct xe_hw_engine_class_intf *eclass =
> > >> > > > kobj_to_eclass(kobj);
> > >> > > > +#if IS_ENABLED(CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT)
> > >> > > > +	u32 min = XE_HW_ENGINE_TIMESLICE_MIN;
> > >> > > > +	u32 max = XE_HW_ENGINE_TIMESLICE_MAX; #else
> > >> > > > +	u32 min = e->hwe->eclass->sched_props.timeslice_min;
> > >> > > > +	u32 max = e->hwe->eclass->sched_props.timeslice_max;
> > >> > > > +#endif
> > >> > > >  	u32 duration;
> > >> > > >  	int err;
> > >> > > >
> > >> > > > @@ -90,11 +218,92 @@ static ssize_t
> > >> > > > timeslice_duration_store(struct
> > >> kobject *kobj,
> > >> > > >  	if (err)
> > >> > > >  		return err;
> > >> > > >
> > >> > > > +	if (enforce_schedule_limit() &&
> > >> > > > +	    !engine_timeout_in_range(duration, min, max))
> > >> > > > +		return -EINVAL;
> > >> > > > +
> > >> > > >  	WRITE_ONCE(eclass->sched_props.timeslice_us, duration);
> > >> > > >
> > >> > > >  	return count;
> > >> > > >  }
> > >> > > >
> > >> > > > +static ssize_t timeslice_duration_max_store(struct kobject *kobj,
> > >> > > > +					    struct kobj_attribute *attr,
> > >> > > > +					    const char *buf, size_t
> > count) {
> > >> > > > +	struct xe_hw_engine_class_intf *eclass =
> > kobj_to_eclass(kobj);
> > >> > > > +	u32 duration;
> > >> > > > +	int err;
> > >> > > > +
> > >> > > > +	err = kstrtou32(buf, 0, &duration);
> > >> > > > +	if (err)
> > >> > > > +		return err;
> > >> > > > +
> > >> > > > +	if (duration < eclass->sched_props.timeslice_min)
> > >> > > > +		return -EINVAL;
> > >> > > > +
> > >> > > > +	if (enforce_schedule_limit() &&
> > >> > > > +	    !engine_timeout_in_range(duration,
> > >> > > > +				     XE_HW_ENGINE_TIMESLICE_MIN,
> > >> > > > +
> > XE_HW_ENGINE_TIMESLICE_MAX))
> > >> > > > +		return -EINVAL;
> > >> > > > +
> > >> > > > +	WRITE_ONCE(eclass->sched_props.timeslice_max, duration);
> > >> > > > +
> > >> > > > +	return count;
> > >> > > > +}
> > >> > > > +
> > >> > > > +static ssize_t timeslice_duration_max_show(struct kobject *kobj,
> > >> > > > +					   struct kobj_attribute *attr,
> > >> > > > +					   char *buf)
> > >> > > > +{
> > >> > > > +	struct xe_hw_engine_class_intf *eclass =
> > >> > > > +kobj_to_eclass(kobj);
> > >> > > > +
> > >> > > > +	return sprintf(buf, "%u\n",
> > >> > > > +eclass->sched_props.timeslice_max);
> > >> > > > +}
> > >> > > > +
> > >> > > > +static struct kobj_attribute timeslice_duration_max_attr =
> > >> > > > +	__ATTR(timeslice_duration_max, 0644,
> > >> timeslice_duration_max_show,
> > >> > > > +	       timeslice_duration_max_store);
> > >> > > > +
> > >> > > > +static ssize_t timeslice_duration_min_store(struct kobject *kobj,
> > >> > > > +					    struct kobj_attribute *attr,
> > >> > > > +					    const char *buf, size_t
> > count) {
> > >> > > > +	struct xe_hw_engine_class_intf *eclass =
> > kobj_to_eclass(kobj);
> > >> > > > +	u32 duration;
> > >> > > > +	int err;
> > >> > > > +
> > >> > > > +	err = kstrtou32(buf, 0, &duration);
> > >> > > > +	if (err)
> > >> > > > +		return err;
> > >> > > > +
> > >> > > > +	if (duration > eclass->sched_props.timeslice_max)
> > >> > > > +		return -EINVAL;
> > >> > > > +
> > >> > > > +	if (enforce_schedule_limit() &&
> > >> > > > +	    !engine_timeout_in_range(duration,
> > >> > > > +				     XE_HW_ENGINE_TIMESLICE_MIN,
> > >> > > > +
> > XE_HW_ENGINE_TIMESLICE_MAX))
> > >> > > > +		return -EINVAL;
> > >> > > > +
> > >> > > > +	WRITE_ONCE(eclass->sched_props.timeslice_min, duration);
> > >> > > > +
> > >> > > > +	return count;
> > >> > > > +}
> > >> > > > +
> > >> > > > +static ssize_t timeslice_duration_min_show(struct kobject *kobj,
> > >> > > > +					   struct kobj_attribute *attr,
> > char
> > >> *buf) {
> > >> > > > +	struct xe_hw_engine_class_intf *eclass =
> > >> > > > +kobj_to_eclass(kobj);
> > >> > > > +
> > >> > > > +	return sprintf(buf, "%u\n",
> > >> > > > +eclass->sched_props.timeslice_min);
> > >> > > > +}
> > >> > > > +
> > >> > > > +static struct kobj_attribute timeslice_duration_min_attr =
> > >> > > > +	__ATTR(timeslice_duration_min, 0644,
> > >> timeslice_duration_min_show,
> > >> > > > +	       timeslice_duration_min_store);
> > >> > > > +
> > >> > > >  static ssize_t timeslice_duration_show(struct kobject *kobj,
> > >> > > >  		struct kobj_attribute *attr, char *buf)  { @@ -118,11
> > >> > > > +327,40 @@ static ssize_t timeslice_default(struct kobject
> > >> > > > *kobj,  static struct kobj_attribute timeslice_duration_def =
> > >> > > > __ATTR(timeslice_duration_us, 0444, timeslice_default, NULL);
> > >> > > >
> > >> > > > +static ssize_t timeslice_min_default(struct kobject *kobj,
> > >> > > > +				     struct kobj_attribute *attr, char
> > *buf) {
> > >> > > > +	struct xe_hw_engine_class_intf *eclass =
> > >> > > > +kobj_to_eclass(kobj->parent);
> > >> > > > +
> > >> > > > +	return sprintf(buf, "%u\n", eclass->defaults.timeslice_min);
> > >> > > > +}
> > >> > > > +
> > >> > > > +static struct kobj_attribute timeslice_duration_min_def =
> > >> > > > +__ATTR(timeslice_duration_min, 0444, timeslice_min_default,
> > >> > > > +NULL);
> > >> > > > +
> > >> > > > +static ssize_t timeslice_max_default(struct kobject *kobj,
> > >> > > > +				     struct kobj_attribute *attr, char
> > *buf) {
> > >> > > > +	struct xe_hw_engine_class_intf *eclass =
> > >> > > > +kobj_to_eclass(kobj->parent);
> > >> > > > +
> > >> > > > +	return sprintf(buf, "%u\n", eclass->defaults.timeslice_max);
> > >> > > > +}
> > >> > > > +
> > >> > > > +static struct kobj_attribute timeslice_duration_max_def =
> > >> > > > +__ATTR(timeslice_duration_max, 0444, timeslice_max_default,
> > >> > > > +NULL);
> > >> > > > +
> > >> > > >  static ssize_t preempt_timeout_store(struct kobject *kobj,
> > >> > > >  				     struct kobj_attribute *attr,
> > >> > > >  				     const char *buf, size_t count)  {
> > >> > > >  	struct xe_hw_engine_class_intf *eclass =
> > >> > > > kobj_to_eclass(kobj);
> > >> > > > +#if IS_ENABLED(CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT)
> > >> > > > +	u32 min = XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN;
> > >> > > > +	u32 max = XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX; #else
> > >> > > > +	u32 min = e->hwe->eclass-
> > >sched_props.preempt_timeout_min;
> > >> > > > +	u32 max = e->hwe->eclass-
> > >sched_props.preempt_timeout_max;
> > >> > > > +#endif
> > >> > > >  	u32 timeout;
> > >> > > >  	int err;
> > >> > > >
> > >> > > > @@ -130,6 +368,10 @@ static ssize_t
> > >> > > > preempt_timeout_store(struct
> > >> kobject *kobj,
> > >> > > >  	if (err)
> > >> > > >  		return err;
> > >> > > >
> > >> > > > +	if (enforce_schedule_limit() &&
> > >> > > > +	    !engine_timeout_in_range(timeout, min, max))
> > >> > > > +		return -EINVAL;
> > >> > > > +
> > >> > > >  	WRITE_ONCE(eclass->sched_props.preempt_timeout_us,
> > timeout);
> > >> > > >
> > >> > > >  	return count;
> > >> > > > @@ -158,17 +400,129 @@ static ssize_t
> > >> > > > preempt_timeout_default(struct kobject *kobj,  static struct
> > >> > > > kobj_attribute preempt_timeout_def =
> > >> > > > __ATTR(preempt_timeout_us, 0444, preempt_timeout_default,
> > >> > > > NULL);
> > >> > > >
> > >> > > > +static ssize_t preempt_timeout_min_default(struct kobject *kobj,
> > >> > > > +					   struct kobj_attribute *attr,
> > >> > > > +					   char *buf)
> > >> > > > +{
> > >> > > > +	struct xe_hw_engine_class_intf *eclass =
> > >> > > > +kobj_to_eclass(kobj->parent);
> > >> > > > +
> > >> > > > +	return sprintf(buf, "%u\n",
> > >> > > > +eclass->defaults.preempt_timeout_min);
> > >> > > > +}
> > >> > > > +
> > >> > > > +static struct kobj_attribute preempt_timeout_min_def =
> > >> > > > +__ATTR(preempt_timeout_min, 0444,
> > preempt_timeout_min_default,
> > >> > > > +NULL);
> > >> > > > +
> > >> > > > +static ssize_t preempt_timeout_max_default(struct kobject *kobj,
> > >> > > > +					   struct kobj_attribute *attr,
> > >> > > > +					   char *buf)
> > >> > > > +{
> > >> > > > +	struct xe_hw_engine_class_intf *eclass =
> > >> > > > +kobj_to_eclass(kobj->parent);
> > >> > > > +
> > >> > > > +	return sprintf(buf, "%u\n",
> > >> > > > +eclass->defaults.preempt_timeout_max);
> > >> > > > +}
> > >> > > > +
> > >> > > > +static struct kobj_attribute preempt_timeout_max_def =
> > >> > > > +__ATTR(preempt_timeout_max, 0444,
> > >> preempt_timeout_max_default,
> > >> > > > +NULL);
> > >> > > > +
> > >> > > > +static ssize_t preempt_timeout_max_store(struct kobject *kobj,
> > >> > > > +					 struct kobj_attribute *attr,
> > >> > > > +					 const char *buf, size_t count)
> > {
> > >> > > > +	struct xe_hw_engine_class_intf *eclass =
> > kobj_to_eclass(kobj);
> > >> > > > +	u32 timeout;
> > >> > > > +	int err;
> > >> > > > +
> > >> > > > +	err = kstrtou32(buf, 0, &timeout);
> > >> > > > +	if (err)
> > >> > > > +		return err;
> > >> > > > +
> > >> > > > +	if (timeout < eclass->sched_props.preempt_timeout_min)
> > >> > > > +		return -EINVAL;
> > >> > > > +
> > >> > > > +	if (enforce_schedule_limit() &&
> > >> > > > +	    !engine_timeout_in_range(timeout,
> > >> > > > +
> > >> XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN,
> > >> > > > +
> > >> XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX))
> > >> > > > +		return -EINVAL;
> > >> > > > +
> > >> > > > +	WRITE_ONCE(eclass->sched_props.preempt_timeout_max,
> > timeout);
> > >> > > > +
> > >> > > > +	return count;
> > >> > > > +}
> > >> > > > +
> > >> > > > +static ssize_t preempt_timeout_max_show(struct kobject *kobj,
> > >> > > > +					struct kobj_attribute *attr,
> > char *buf)
> > >> {
> > >> > > > +	struct xe_hw_engine_class_intf *eclass =
> > >> > > > +kobj_to_eclass(kobj);
> > >> > > > +
> > >> > > > +	return sprintf(buf, "%u\n",
> > >> > > > +eclass->sched_props.preempt_timeout_max);
> > >> > > > +}
> > >> > > > +
> > >> > > > +static struct kobj_attribute preempt_timeout_max_attr =
> > >> > > > +	__ATTR(preempt_timeout_max, 0644,
> > preempt_timeout_max_show,
> > >> > > > +	       preempt_timeout_max_store);
> > >> > > > +
> > >> > > > +static ssize_t preempt_timeout_min_store(struct kobject *kobj,
> > >> > > > +					 struct kobj_attribute *attr,
> > >> > > > +					 const char *buf, size_t count)
> > {
> > >> > > > +	struct xe_hw_engine_class_intf *eclass =
> > kobj_to_eclass(kobj);
> > >> > > > +	u32 timeout;
> > >> > > > +	int err;
> > >> > > > +
> > >> > > > +	err = kstrtou32(buf, 0, &timeout);
> > >> > > > +	if (err)
> > >> > > > +		return err;
> > >> > > > +
> > >> > > > +	if (timeout > eclass->sched_props.preempt_timeout_max)
> > >> > > > +		return -EINVAL;
> > >> > > > +
> > >> > > > +	if (enforce_schedule_limit() &&
> > >> > > > +	    !engine_timeout_in_range(timeout,
> > >> > > > +
> > >> XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN,
> > >> > > > +
> > >> XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX))
> > >> > > > +		return -EINVAL;
> > >> > > > +
> > >> > > > +	WRITE_ONCE(eclass->sched_props.preempt_timeout_min,
> > timeout);
> > >> > > > +
> > >> > > > +	return count;
> > >> > > > +}
> > >> > > > +
> > >> > > > +static ssize_t preempt_timeout_min_show(struct kobject *kobj,
> > >> > > > +					struct kobj_attribute *attr,
> > char *buf)
> > >> {
> > >> > > > +	struct xe_hw_engine_class_intf *eclass =
> > >> > > > +kobj_to_eclass(kobj);
> > >> > > > +
> > >> > > > +	return sprintf(buf, "%u\n",
> > >> > > > +eclass->sched_props.preempt_timeout_min);
> > >> > > > +}
> > >> > > > +
> > >> > > > +static struct kobj_attribute preempt_timeout_min_attr =
> > >> > > > +	__ATTR(preempt_timeout_min, 0644,
> > preempt_timeout_min_show,
> > >> > > > +	       preempt_timeout_min_store);
> > >> > > > +
> > >> > > >  static const struct attribute *defaults[] = {
> > >> > > >  	&job_timeout_def.attr,
> > >> > > > +	&job_timeout_min_def.attr,
> > >> > > > +	&job_timeout_max_def.attr,
> > >> > > >  	&timeslice_duration_def.attr,
> > >> > > > +	&timeslice_duration_min_def.attr,
> > >> > > > +	&timeslice_duration_max_def.attr,
> > >> > > >  	&preempt_timeout_def.attr,
> > >> > > > +	&preempt_timeout_min_def.attr,
> > >> > > > +	&preempt_timeout_max_def.attr,
> > >> > > >  	NULL
> > >> > > >  };
> > >> > > >
> > >> > > >  static const struct attribute *files[] = {
> > >> > > >  	&job_timeout_attr.attr,
> > >> > > > +	&job_timeout_min_attr.attr,
> > >> > > > +	&job_timeout_max_attr.attr,
> > >> > > >  	&timeslice_duration_attr.attr,
> > >> > > > +	&timeslice_duration_min_attr.attr,
> > >> > > > +	&timeslice_duration_max_attr.attr,
> > >> > > >  	&preempt_timeout_attr.attr,
> > >> > > > +	&preempt_timeout_min_attr.attr,
> > >> > > > +	&preempt_timeout_max_attr.attr,
> > >> > > >  	NULL
> > >> > > >  };
> > >> > > >
> > >> > > > diff --git a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h
> > >> > > > b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h
> > >> > > > index 757136614672..2e2ab351a991 100644
> > >> > > > --- a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h
> > >> > > > +++ b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h
> > >> > > > @@ -10,6 +10,8 @@
> > >> > > >
> > >> > > >  #define MAX_ENGINE_CLASS_NAME_LEN    16
> > >> > > >  int xe_hw_engine_class_sysfs_init(struct xe_gt *gt);
> > >> > > > +bool enforce_schedule_limit(void); bool
> > >> > > > +engine_timeout_in_range(u64 timeout, u64 min, u64 max);
> > >> > > >
> > >> > > >  /**
> > >> > > >   * struct kobj_eclass - A eclass's kobject struct that
> > >> > > > connects the kobject and the
> > >> > > > --
> > >> > > > 2.25.1
> > >> > > >
