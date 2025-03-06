Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99465C282D1
	for <intel-xe@archiver.kernel.org>; Thu,  6 Mar 2025 23:36:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5764F10E033;
	Thu,  6 Mar 2025 23:36:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZHpdI//y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B643310E033
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Mar 2025 23:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741304202; x=1772840202;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=gi5jAmfgAocqyUFLVsTsA5K2lZL1okw0VnldRepv6hM=;
 b=ZHpdI//yfSjapFi6fBIgNbTJXTSPAxeCA/f30745c/cvwD+ME7WpZaZp
 RWiYNWJsRCRJ6gjiWyw6up7PR2NsurBiHaym8TFQ78Dcg3deBHn6OtOli
 ePzm1TSRJHNQ7cgpGmjEdb9w9LZ45sqXV3DycTov1MM/qqCDvpUEr9ajG
 K7RPa+dqEyV1V47mY8JPBQ3hYPtwev4zdtxAKcXBcgNVo7Rngn+NSQAbn
 JS5lV/Bw/Xaxe3XmqRZGXgA+cxeGj/QAo2WybYtcbLri5zZQVJ37cECAG
 ZwAmA+jp6G/i32qLm8JOIUVOg1caWF7sYNkxzBWMkOyLjg/fXKiQnv2DW w==;
X-CSE-ConnectionGUID: bg5jJGA9R8q7KJrzW/wEBA==
X-CSE-MsgGUID: hTKaO0weTKWOOHOgZCwEQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="52981513"
X-IronPort-AV: E=Sophos;i="6.14,227,1736841600"; d="scan'208";a="52981513"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 15:36:42 -0800
X-CSE-ConnectionGUID: D+q8FEbWRDe0MWUyjCbymQ==
X-CSE-MsgGUID: ZAPHsdhxSp6P57TtVsVLng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,227,1736841600"; d="scan'208";a="119169790"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 15:36:43 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 6 Mar 2025 15:36:41 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 6 Mar 2025 15:36:41 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.47) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 6 Mar 2025 15:36:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iSTa3hkbagj+nB4xnNPISC34r8nldnnFeSgmLLPen3V+XnC74nwD260GrK/w1280I3hZTPS+k0u81towQh4sL6Tfndaoaf4HzKtj561kSULBA9WG7dF093NvoB2e5MD1zwEZ2wWxgYug057NogD6YMjvM7dbDPam9Suyx3p5OiDhzaOkcImwrQOWxHJ7u5UKLXpTbbzVrbLAo59+vzhkxuoyuDAUJ1tqS49Gt/ZceHteATCxdWa+JED6EIqo6KVViMiFHYasjLLt8H+lV3nvbJekQxbXp05pXleRwsCjpXH1rpMgHVJaHxC4QwlyXF9a80/w4+jx75hr2yg5iAT0qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9ZayXID1ZodMlfWCcZOkrPiVRwxdjBcQvaOEo+UxlwI=;
 b=P2e03ci/ibYG4F2OsAt0Y1yfUa0e1PJOK2zoDcw+eqGhOCP0YnBQOsS5cQzvp4Ku9HhRoh0G0skQ635n3aOdA+vaJtHjKq42gdYiwV/X3p8xWLS+anbDj5ZOgCsZlKFyOK1d9vUlZTlhHyFlsvHRCmsgchTo6IYNUyapAW5vyZNvEZntVZptcfl9uAOsXJePEDZdW2Y6jYPE1SiAKwYfCGOTiXedCmLSkvF+gG8MuoXAyjYh+bJp98dS0W63q79nI8c6vF9YYuTjXF6F1tEmrl0/pJkgp7H2fDN4YIYwHkLvBPlq3fgFBpWflK2GKAI4qc51HjWmHoGwR5uSGdxlXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by IA1PR11MB7870.namprd11.prod.outlook.com (2603:10b6:208:3f8::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.16; Thu, 6 Mar
 2025 23:36:38 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%4]) with mapi id 15.20.8511.017; Thu, 6 Mar 2025
 23:36:38 +0000
Date: Thu, 6 Mar 2025 18:36:35 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: John Harrison <john.c.harrison@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Vinay Belgaumkar
 <vinay.belgaumkar@intel.com>, Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: Re: [PATCH 1/2] drm/xe/guc_pc: Do not stop probe or resume if GuC PC
 fails
Message-ID: <Z8oxg8XwZjOpdKV6@intel.com>
References: <20250214172503.502320-1-rodrigo.vivi@intel.com>
 <a11812cc-bf0e-488f-9701-317ee9807699@intel.com>
 <Z8ISULSSQYvaYIjl@intel.com>
 <f9ffb2c6-00a3-43f7-b7c3-68f8de064254@intel.com>
 <Z8Iddm4HB1O1yY0Q@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Z8Iddm4HB1O1yY0Q@intel.com>
X-ClientProxiedBy: MW4PR03CA0041.namprd03.prod.outlook.com
 (2603:10b6:303:8e::16) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|IA1PR11MB7870:EE_
X-MS-Office365-Filtering-Correlation-Id: 43e418c0-342e-4fa4-2fac-08dd5d07bdc0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?iRScKYAKITi2sG3kWyPR7kPPSXeMISOHjYQ4GI5xgHb5dY4AuFylLA9bexss?=
 =?us-ascii?Q?9hwFBrs+RCGSjHb9is7wEznQtAgHZPXg25JOGihmDeVIHF+jGh7429zWxzgm?=
 =?us-ascii?Q?2aY1h758OCREODX8DviwN150PkyFZaCOKR7IyqN4ve6+JH2SHK7pOGX/S2kU?=
 =?us-ascii?Q?dJHwqy+Xp1irkOk0QO6St/s6V60iyg5CSnQzUk3p1odpcRzOxl6Z1/K3wBbO?=
 =?us-ascii?Q?tK6Sq63OHemgIp45C+1lqSSt0aPaXQXd8FI2mH2UxIEeBUguD0/gvqErtEJm?=
 =?us-ascii?Q?7poLg6+QZLUxEIBkGbbU4c2wZZVNUqfAV8yt+jdin/SSMEUtaoaKDIBmLvcR?=
 =?us-ascii?Q?vmsuD/j9f5zp0VudVBertRZulWtaIbgYGtQSpKB+tzpQln2qx1snqb3aOl1R?=
 =?us-ascii?Q?mTTEHuG3GuD+QNHNqxlv9l1kYLmYpmDLzBsnBtsL34h6nMUJrbOI1NdmxBR9?=
 =?us-ascii?Q?GtW8UK7fq+qXpzSFqp3rNtMVq3eitI3kQ3ZJVaCXA2u8PEWEMohqdU+aLWr0?=
 =?us-ascii?Q?MjPJkSHK5upv+kD1u0ZXQdaCF8tet0WTozh6mvnlD7cBsx/Jn+Jph2ZNH4uk?=
 =?us-ascii?Q?CrpxlY68bYtVTlK55BnRu2Chn0XliCGxkdZSluN4UTxQgXq0MLS1ba8X9qms?=
 =?us-ascii?Q?PBmQzPFkWuGqFAhmV396m4Mu6xFa/ZO73+IqeBTU7KoTu4rNFDraVSg9SJhD?=
 =?us-ascii?Q?k/pw60Vw7EVLrFnTwlFpmSAUsechpjT0tzRsSt9jgXIsJI4kG+Qsx0LEsmzX?=
 =?us-ascii?Q?gRtWuY4M3Hl+vBKCtwuExSvRDtYBmKidu9/Tc9tMYkYY/q+b1nIoS/bLqm79?=
 =?us-ascii?Q?2vlBWaOlysPiTYYpgKrkQxGBUZoVLBcTawJ1aWdaLZhAEFbjjmHkLmhQlJk6?=
 =?us-ascii?Q?fg6aqTe40/hBLlh42BfaIiN1zfGgm66orDu/davsOaxU60czB2C1yT6Ple0W?=
 =?us-ascii?Q?h8AkEhhJaYWNzc/FKd5Vw1DQe+/+W8p45CX7a0D6nWAM2FWdXpX3Kqrs4L+W?=
 =?us-ascii?Q?ZwOvZDCXUSfNKcwgYBa9Kc9Q6rfSmDJNsA7NBja26vJSDY2Q2QZ/uGWDL9ni?=
 =?us-ascii?Q?3UEuyyuSLqy/JcyrLkcxSJmYuSGSL+aZGDfFvyE+7h/4Qdht7cKG4x2/nliS?=
 =?us-ascii?Q?so0/GcwIG8VHibLRHDAWIbBD4MvQ/AORwaesjAO1HfQ6T10gSQzdFo7it2aY?=
 =?us-ascii?Q?mVJelQmbOGPh2bgeGB/1xx86LHfX5VKiFPBt/QoJYTY/uTIlug7qBdf95Mei?=
 =?us-ascii?Q?VWoXzo+HB4M0+f189RH/mKe3gjWR80OyXT36N1Qxwn/mufw6QCJSWtJh/fmX?=
 =?us-ascii?Q?r0Z/yOSuQqae4XIuwca8ckJensLu51fO1PRoiihNqDnJ1ocGPYx3pRvTo8RY?=
 =?us-ascii?Q?F+uVVXUgDH6B/mZbZQYNg4wd8qZI?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?saIocntObHTfEcZr1uVZKo9mqvJB659zYCycZfX76bzmbZopbU7MdHJq2tJb?=
 =?us-ascii?Q?iTS97V72knAZwIJqptO5Ru0Zp2f0maYfsYVDdKY57xX2w0tSUEZe0OSFFM0E?=
 =?us-ascii?Q?a4uDJajMBYemhYTcMs1haXjLbu6Kb5WX+OIAv4SBgZTpcrq48XYiWLJQx0Cl?=
 =?us-ascii?Q?cw5M5QjvZCS01IYKRxBK6XLtMCGME8pUT43Fw0zZgt+AJLYskO28YGroUCgn?=
 =?us-ascii?Q?HtRrFV6sQdEefeSZEACe5G87Ps7bVDZhVLJgESFc4nYJ8OpUaR4iQv8sJWjN?=
 =?us-ascii?Q?M/W0KZix+8ylwbl/HYzIa+bR3pprcAGq9eZCPekLrD++trPFU95hWOzk1aer?=
 =?us-ascii?Q?xj4eAPzc7gkL/xh5P3hW5sWmMXCz8dkI3oPCewYIih9X6X8EoR2aES7yHn1u?=
 =?us-ascii?Q?Oqbl31QrEDLL0b+G1Pni7MvIWXGNI2zN+5SsVDDs1+gLOkpLMNmiRxb5abi1?=
 =?us-ascii?Q?BtF44clfNMQLhEyqp21P2thTQhkzQnRRQBD4FKJoeel02aKazxeMaYckJcNF?=
 =?us-ascii?Q?Z/nt7ZEP/N+O/nAyidzwEqft2vN3fieF8sbCz1raE/F+yTtPbaffOiqKlWNF?=
 =?us-ascii?Q?FRMKqjr+BHBVvNIYMO22z+67B7VzsuKgjekyetpurJrqiE367xoxlNG8I9lU?=
 =?us-ascii?Q?krYNNIC38HAP4Usdfp3J7C3HR8aNLL9KNPUlJQT/OPZxUySg7fzv/JYvomgn?=
 =?us-ascii?Q?+lezuXmaL2OOne6VnQ5fyXBNAWeI438YIUwSPLBDA+ZsmYfUY/4/ikCUJpCS?=
 =?us-ascii?Q?DK/Q7+ORqV4UNLQ8rxRkYYMHDcflzLqtcguyjSh3lP7QsZZNFFO0RkXmaPv6?=
 =?us-ascii?Q?1HVTTgbKEmBVkRV4KJPNc0352h/u7eVyFBgc/p+rrlmljbISS9qSuvVjzTvc?=
 =?us-ascii?Q?vSZatI4/PEAyTKB8Kc6ZGVMopQj4vfOg8Hy7VLjb6wWKE3/3I3zCoulksFrX?=
 =?us-ascii?Q?OCbH7dASvOLBh3u2aXolcsIgZnSSrpUpMTJAMI5K7VZnKf8Ey9RkYGoe/6bu?=
 =?us-ascii?Q?2wwgJ+GV5URWL8ZhwLMxGRV+NGLgDZfZcHJKELxunZ4gTCukglNnKs/94H9V?=
 =?us-ascii?Q?/PRlJS68MMt9Kxozz06/ELN/L1CZnNKyMSXGFtAH9feVegvFzOYJ5OhdYqpw?=
 =?us-ascii?Q?3OR6M1RWcNnVtMaXf/bMLRnvMWYcTwWJLc/0xkmEv8c8hA7O2/UwZlSVeY3j?=
 =?us-ascii?Q?ZTen+8KtZITWvfxL8gm9QFoAxA4X4xORsr5eumEMLfQ7t32R5uVJS08sW9Cn?=
 =?us-ascii?Q?bhur2eLdzixB5CNOa7Z7SXaOjkQ7V5xNL59ItukrlidDMi5ggTnjR/rAg5AW?=
 =?us-ascii?Q?mdD10Mx1gGFNEgMZdcz0AFubQ3IYhDm3sHPUUMTxLPJqiNyjjFy6xm+Ux8xm?=
 =?us-ascii?Q?aZhzQ5ffieNhY2VkjDkiiSO3g4Y4n13GU6YqZvu3nHjV3s84OftHECwO+bjD?=
 =?us-ascii?Q?NHzBvVTjZjCop0YXNecQVN5sbGoyAy783YLZU4xykiNXBHM7yfQXGctczPgz?=
 =?us-ascii?Q?ZUwbwhVIxQ7j2lWMTyOUCiQcpD0Swg3HBz3HngEm/A+OZ/CC8YmirBBTdb83?=
 =?us-ascii?Q?kd0oN2FUAPbiGNcKb9kNyUNJeJegXZ8rDg617yswCgd6qxrZUnaLKBasHv5H?=
 =?us-ascii?Q?bg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 43e418c0-342e-4fa4-2fac-08dd5d07bdc0
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 23:36:38.8403 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PHC3WjkDLr0rWQB65MXUyxr4UoNa4FUUOmkoei/a8SMi7+s7QKijhDL2urr9TmPPuxPhQAtgS/47PyaZc4Dyjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7870
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

On Fri, Feb 28, 2025 at 03:32:54PM -0500, Rodrigo Vivi wrote:
> On Fri, Feb 28, 2025 at 12:13:24PM -0800, John Harrison wrote:
> > On 2/28/2025 11:45, Rodrigo Vivi wrote:
> > > On Fri, Feb 28, 2025 at 11:22:02AM -0800, John Harrison wrote:
> > > > On 2/14/2025 09:25, Rodrigo Vivi wrote:
> > > > > In a rare situation of thermal limit during resume, GuC can
> > > > > be slow and run into delays like this:
> > > > > 
> > > > > xe 0000:00:02.0: [drm] GT1: excessive init time: 667ms! \
> > > > >      		 [status = 0x8002F034, timeouts = 0]
> > > > > xe 0000:00:02.0: [drm] GT1: excessive init time: \
> > > > >      		 [freq = 100MHz (req = 800MHz), before = 100MHz, \
> > > > >      		 perf_limit_reasons = 0x1C001000]
> > > > > xe 0000:00:02.0: [drm] *ERROR* GT1: GuC PC Start failed
> > > > > ------------[ cut here ]------------
> > > > > xe 0000:00:02.0: [drm] GT1: Failed to start GuC PC: -EIO
> > > > > 
> > > > > If this happens, this can block entirely the GPU to be used.
> > > > > However, GPU can still be used, although the GT frequencies might be
> > > > > messed up.
> > > > > 
> > > > > Let's report the error, but not block the flow.
> > > > > But, instead of just giving up and moving on, let's re-attempt a wait
> > > > > with a very long second timeout.
> > > > > 
> > > > > v2: Keep the precision comment (Jonathan)
> > > > >       Use a define for the regular SLPC reset timeout.
> > > > > v3: Improve messages (Vinay)
> > > > >       Only skip initialization if the second full-second wait failed.
> > > > > 
> > > > > Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> > > > > Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com> #v2
> > > > > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > > > ---
> > > > >    drivers/gpu/drm/xe/xe_guc_pc.c | 46 ++++++++++++++++++++++++----------
> > > > >    1 file changed, 33 insertions(+), 13 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> > > > > index 02409eedb914..74cc13012532 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> > > > > @@ -20,6 +20,7 @@
> > > > >    #include "xe_gt.h"
> > > > >    #include "xe_gt_idle.h"
> > > > >    #include "xe_gt_printk.h"
> > > > > +#include "xe_gt_throttle.h"
> > > > >    #include "xe_gt_types.h"
> > > > >    #include "xe_guc.h"
> > > > >    #include "xe_guc_ct.h"
> > > > > @@ -50,6 +51,8 @@
> > > > >    #define LNL_MERT_FREQ_CAP	800
> > > > >    #define BMG_MERT_FREQ_CAP	2133
> > > > > +#define SLPC_RESET_TIMEOUT_MS 5 /* rought 5ms, but no need for precision */
> > > > > +
> > > > >    /**
> > > > >     * DOC: GuC Power Conservation (PC)
> > > > >     *
> > > > > @@ -114,9 +117,10 @@ static struct iosys_map *pc_to_maps(struct xe_guc_pc *pc)
> > > > >    	 FIELD_PREP(HOST2GUC_PC_SLPC_REQUEST_MSG_1_EVENT_ARGC, count))
> > > > >    static int wait_for_pc_state(struct xe_guc_pc *pc,
> > > > > -			     enum slpc_global_state state)
> > > > > +			     enum slpc_global_state state,
> > > > > +			     int timeout_ms)
> > > > >    {
> > > > > -	int timeout_us = 5000; /* rought 5ms, but no need for precision */
> > > > > +	int timeout_us = 1000 * timeout_ms;
> > > > >    	int slept, wait = 10;
> > > > >    	xe_device_assert_mem_access(pc_to_xe(pc));
> > > > > @@ -165,7 +169,8 @@ static int pc_action_query_task_state(struct xe_guc_pc *pc)
> > > > >    	};
> > > > >    	int ret;
> > > > > -	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING))
> > > > > +	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING,
> > > > > +			      SLPC_RESET_TIMEOUT_MS))
> > > > >    		return -EAGAIN;
> > > > >    	/* Blocking here to ensure the results are ready before reading them */
> > > > > @@ -188,7 +193,8 @@ static int pc_action_set_param(struct xe_guc_pc *pc, u8 id, u32 value)
> > > > >    	};
> > > > >    	int ret;
> > > > > -	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING))
> > > > > +	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING,
> > > > > +			      SLPC_RESET_TIMEOUT_MS))
> > > > >    		return -EAGAIN;
> > > > >    	ret = xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
> > > > > @@ -209,7 +215,8 @@ static int pc_action_unset_param(struct xe_guc_pc *pc, u8 id)
> > > > >    	struct xe_guc_ct *ct = &pc_to_guc(pc)->ct;
> > > > >    	int ret;
> > > > > -	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING))
> > > > > +	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING,
> > > > > +			      SLPC_RESET_TIMEOUT_MS))
> > > > >    		return -EAGAIN;
> > > > >    	ret = xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
> > > > > @@ -443,6 +450,15 @@ u32 xe_guc_pc_get_act_freq(struct xe_guc_pc *pc)
> > > > >    	return freq;
> > > > >    }
> > > > > +static u32 get_cur_freq(struct xe_gt *gt)
> > > > > +{
> > > > > +	u32 freq;
> > > > > +
> > > > > +	freq = xe_mmio_read32(&gt->mmio, RPNSWREQ);
> > > > > +	freq = REG_FIELD_GET(REQ_RATIO_MASK, freq);
> > > > > +	return decode_freq(freq);
> > > > > +}
> > > > > +
> > > > >    /**
> > > > >     * xe_guc_pc_get_cur_freq - Get Current requested frequency
> > > > >     * @pc: The GuC PC
> > > > > @@ -466,10 +482,7 @@ int xe_guc_pc_get_cur_freq(struct xe_guc_pc *pc, u32 *freq)
> > > > >    		return -ETIMEDOUT;
> > > > >    	}
> > > > > -	*freq = xe_mmio_read32(&gt->mmio, RPNSWREQ);
> > > > > -
> > > > > -	*freq = REG_FIELD_GET(REQ_RATIO_MASK, *freq);
> > > > > -	*freq = decode_freq(*freq);
> > > > > +	*freq = get_cur_freq(gt);
> > > > >    	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> > > > >    	return 0;
> > > > > @@ -1033,10 +1046,17 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
> > > > >    	if (ret)
> > > > >    		goto out;
> > > > > -	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING)) {
> > > > > -		xe_gt_err(gt, "GuC PC Start failed\n");
> > > > > -		ret = -EIO;
> > > > > -		goto out;
> > > > > +	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING,
> > > > > +			      SLPC_RESET_TIMEOUT_MS)) {
> > > > > +		xe_gt_warn(gt, "GuC PC excessive start time: [freq = %dMHz (req = %dMHz), perf_limit_reasons = 0x%08X]\n",
> > > > > +			   xe_guc_pc_get_act_freq(pc), get_cur_freq(gt),
> > > > > +			   xe_gt_throttle_get_limit_reasons(gt));
> > > > > +		if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING, 1000)) {
> > > > Shouldn't this be a define as well - SLPC_RESET_EXTENDED_TIMEOUT_MS or
> > > > something?
> > > good idea! will do.

done

> > > 
> > > > More importantly, Is 1ms enough of an extra wait?
> > > The new timeout argument is in ms, so it is 1 second.
> > Doh! Yes, I saw that but then completely spaced it out again!
> > 
> > > 
> > > > If the GT freq is 100MHz
> > > > instead of 2GHz or some such then the expected max of 5ms could now be more
> > > > like 100ms if not even longer (the slow down does not seem linear). As an
> > > > example, the GuC load itself should be <10ms but with clamped frequencies we
> > > > generally see over 500ms, sometimes over 1s.
> > > hmm... over 1s possible? so, perhaps 1250 to be on the safe side?
> > > other suggestions?
> > I think a second should be good but I don't what is involved in the SLPC
> > start up? The long delay loading the GuC is due to doing decryption which is
> > a hugely CPU intensive task and the GuC is not a huge CPU! If SLPC is more
> > about waiting for hardware to respond then maybe the slow down won't be as
> > severe? Plus the GuC load is inherently slower in the first place - our
> > original timeout was 200ms with expected values in the 5-15ms range. If SLPC
> > is starting from a 5ms timeout then presumably the expected time is actually
> > more like 1ms or less?
> 
> Yeap, I randomly put a big wait because I wasn't sure why/what.
> 
> > 
> > You could try running with the frequency manually set to 300MHz and see how
> > long it takes. I think that is the lowest we can explicitly request from the
> > KMD?
> 
> Great idea! Although it can change a lot by platform and SKUs, but we could
> have at least a rough idea instead of a blind big guess.

Well, it looks like when everything is normal, we shouldn't take
longer than 300 *us* even with lower frequencies. So I could not quite
reproduce a case like that.

But well, let's try with this big hammer second wait here and warn on how
long it takes, so we can tune it down later.

> 
> > 
> > > 
> > > > > +			xe_gt_err(gt, "GuC PC Start failed: Dynamic GT frequency control and GT sleep states are now disabled.\n");
> > > > > +			/* Although GuC PC failed, do not block the usage of GPU */
> > > > > +			ret = 0;
> > > > I thought the new policy was that any subsystem failure should now be
> > > > considered fatal and abort driver load? I recall a PXP start failure was
> > > > recently upgrading to being fatal even though PXP is almost never used by
> > > > any actual users. SLPC seems much more vital to the system than PXP!
> > > Hmm... good point! I have to get back to the board then and have
> > > this logic only for the resume?!
> > > 
> > > If this happens during the probe yeap, let's block because subsystems
> > > are buggy. But the case I'm hunting here is a resume from S2idle that
> > > is entirely hanging the platform when this happens under thermal constrains.
> > Hmm. What platform is the problem showing up on? There are a couple of other
> > bug reports about systems coming up in an odd state after suspend - e.g. GuC
> > image not loading due to memory corruption. I wonder if it is not actually a
> > thermal problem but just something confused due to uninitialised state
> > somewhere? Plus, how can you be in thermal meltdown on a resume? If the
> > power was lost then the device should be cold!
> 
> Indeed. It was a LNL case in a very specific kernel version. Issue is not
> reproducible anymore. But with that bug I realized we were actually entirely
> hanging the platform on resume and this is not a good approach, even though
> the original issue was not ours.

Okay, In the new version we are still going to block the probe. If it is
less than the extended timeout it prints out how long it took, otherwise
we continue with the -ETIMEDOUT return and block the probe/resume.

> 
> > 
> > > 
> > > Thoughts? I'm open to suggestions here.
> > My main thought is that if the frequency is clamped (by the hardware itself)
> > at absolute minimum then the system is not going to be very usable anyway.
> > So is continuing to run by using huge timeouts actually beneficial? But not
> > sure what else we can do at this point? Maybe try an FLR? But yeah, it is
> > probably good to try harder to keep going on a resume than on first driver
> > load.
> 
> Well, with the resume happening, the FLR could be a bad hammer. But well,
> worth considering indeed. I will do some more experiments around and see
> our options. But the hang as currently is is the worst scenario.

I couldn't get anything like that to work reliably. If we are in that
thermal bad resume condition, the flr can cause other side effects.
Let's just wait a bit longer and log (warn) the case and move on.

Sending the new version soon...

Thank you!

> 
> Thanks a lot again,
> Rodrigo.
> 
> > 
> > John.
> > 
> > > 
> > > Thanks a lot for raising these so far,
> > > Rodrigo.
> > > 
> > > > John.
> > > > 
> > > > > +			goto out;
> > > > > +		}
> > > > >    	}
> > > > >    	ret = pc_init_freqs(pc);
> > 
