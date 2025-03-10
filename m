Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3D40C28B2E
	for <intel-xe@archiver.kernel.org>; Mon, 10 Mar 2025 17:38:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC5B110E4A6;
	Mon, 10 Mar 2025 17:38:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iVzKLORY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5459910E4A3
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Mar 2025 17:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741628289; x=1773164289;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=MShQ74zS8ED3/tGBAsMNrVgJSCQB+n57SuW1l7d2bZ4=;
 b=iVzKLORYbdq8qo6Q4Bog3SJdiPVusEdHxThNkWYJGaQ+XYuiZlbdziV+
 pBXEws2jzgLsp/MePpaK9GekLOr5xGjNUZsskJ2PySJrwPitWA/683ofw
 rQ7yHTG87mEr9CL5FNpS8/bRAGoQ4TjE8/mD30f2eZH2W6R/l9F31NtLI
 6MztoQN/51APM2V6wJ7CCbwWvWhF0KcQxnJFxkNuOt9Lu0vRthSBVA9QX
 cMHPRgS1mQb2ztsjNEPKz0utJ8J8TqXwCyswvZWl2gu0iZkwfb+2NiwIC
 DAS7btaiqNaYJcc31U1Dp5FcTVx94aeE/lJk7VCQB73vpQN58cMekrd5c w==;
X-CSE-ConnectionGUID: Q97Y3pQuQMynRlbZ2oWNCg==
X-CSE-MsgGUID: PvgmWs2+Qea2NpWOUYJ5aA==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="60043602"
X-IronPort-AV: E=Sophos;i="6.14,236,1736841600"; d="scan'208";a="60043602"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 10:38:07 -0700
X-CSE-ConnectionGUID: bIzCxWS+QpWw/rlFfbJS+w==
X-CSE-MsgGUID: LNef8wWfToiJm1Ur5WmUcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,236,1736841600"; d="scan'208";a="150859326"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 10:38:06 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 10 Mar 2025 10:38:06 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 10 Mar 2025 10:38:06 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 10 Mar 2025 10:38:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d80XDkkd45g1kzX+KbRJ+mtMFdthYKIbyPJ+N6JrZuB4bkvcSgW0nLzjvM1t+HQklyY6WjEHUr3XB9hrF4ryTdnJnesQ+Tgw5uIVEwjIw5vwmaz6Is8GLZfuc7GOg70ofcT34taaIfxlah+31J0m6cS0NTpVljKLn1Lp07MuJ0sAb8RSYmlH0gC1p0HlYE97WdqIVLMLCFGROrlHHsQpPxhvPOKt+bn8aTNKziB70vYsFSHtQP6ArbxH1yUx138VeQ15s32jWVDvVjxKZbANEeknCaikxa41aum3FduGklQk/ElyD70/ne4gq+ajPnjpryLoEmvL9x2IrjkkjNkOOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bJRpFuQwNRMiocYc5iUarw7FXAOSk6TcVXCfsMtnNrw=;
 b=g+lDGE9W1t68rRYMoLXiVpG8SbfON40TjLIZI9SCzGI+jvxxygm9G5NWQ3g+3+SlLhn5ZVODI6WRE2nOXhvEoKS+7pJ0tylHptPukNc2XMacm4I+G9vpUBYp5t8Hg5MXMTlRY3Z3Gp8b0A8IL3adJ4qJC5JL/GWZ70PespwR8KeALXxRpSae6D3i7xbN/vXi7rD/R3RcfeMW/EZQANpjBfzH2YgTd0re+4+FkQje2iwUC3b/qAuUuHZzUXGjvMkIloiPSmXhgc9W+f1dvZpU7LBDVF+j9K6Kzyq8uZhy7CR2azFuCD/OxgTo+atBwbTrCy+Z9AK3y02UbG1boKvHHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB8427.namprd11.prod.outlook.com (2603:10b6:806:373::19)
 by SJ0PR11MB5054.namprd11.prod.outlook.com (2603:10b6:a03:2d3::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.26; Mon, 10 Mar
 2025 17:37:34 +0000
Received: from SA1PR11MB8427.namprd11.prod.outlook.com
 ([fe80::b156:b61b:d462:b781]) by SA1PR11MB8427.namprd11.prod.outlook.com
 ([fe80::b156:b61b:d462:b781%4]) with mapi id 15.20.8511.025; Mon, 10 Mar 2025
 17:37:32 +0000
Date: Mon, 10 Mar 2025 13:37:28 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: Ashutosh Dixit <ashutosh.dixit@intel.com>, Karthik Poosa
 <karthik.poosa@intel.com>, <lucas.demarchi@intel.com>,
 <matthew.d.roper@intel.com>, <andi.shyti@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <riana.tauro@intel.com>, <badal.nilawar@intel.com>,
 <aravind.iddamsetty@linux.intel.com>
Subject: Re: [PATCH v2] drm/xe/hwmon: expose fan speed
Message-ID: <Z88jWB49X0JWlA35@intel.com>
References: <20250307125112.575242-1-raag.jadav@intel.com>
 <Z8sDoWxu0dUEpAQ-@intel.com> <Z8xsYAhf96iptwm2@black.fi.intel.com>
 <Z88a17Fr2f-8cuad@intel.com> <Z88gzsRUTJc-gSqc@black.fi.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Z88gzsRUTJc-gSqc@black.fi.intel.com>
X-ClientProxiedBy: MW4PR04CA0191.namprd04.prod.outlook.com
 (2603:10b6:303:86::16) To SA1PR11MB8427.namprd11.prod.outlook.com
 (2603:10b6:806:373::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB8427:EE_|SJ0PR11MB5054:EE_
X-MS-Office365-Filtering-Correlation-Id: 606290f2-5aec-4c4f-4d6f-08dd5ffa3cef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qQPjnJFT9HnmKhEQNoiKR8DGB2r4H3wElK3txTO50Xj+R5BS2ReW4dDYGzoO?=
 =?us-ascii?Q?xbN6ydVPn9aK4tLW+hP2YcU7h8tw4KGAKXNHh8U/ZAvWaLlh/IMk7+EcSXRV?=
 =?us-ascii?Q?GYO4Uk4HS9xTh1MArFs00G/3TbfDYuAu3dSUawAMBdt9E3KP+f8aCKugUQFP?=
 =?us-ascii?Q?n57mS+csTrZrAHSs5wYiS9RInAEVlRf34tdnr1MTKOEhjIgxV1kbndFpKVJ5?=
 =?us-ascii?Q?ziiSwAbl8M2177pJpNqkVjYjOtWNc+rtPzjflDvXD6w2lCAZhaWxUs+UYirT?=
 =?us-ascii?Q?BqG+OLfJrUjRhss+quoHiVqQTIzQN60dLVITQ1BP7od1vl2W4Ljg6HlsSY2o?=
 =?us-ascii?Q?cQqfAAEINd7hHfK9TULJ3qvDmws8glIxKkv7GH4mgdSuAywCJCdKRW3L8qAu?=
 =?us-ascii?Q?sUn6ctmVHNbm89LCfR1lcfHqxTyOL1bmQYoLnN45+1DIw3vGF1Ft03DXhxyX?=
 =?us-ascii?Q?jich1NNG/d2sCxs/OMSChxz/huY1ZcxDwDOKunYRkvjrHwxjqR0iyFgZqbje?=
 =?us-ascii?Q?tAQg3yUYAHsDMA2ptWPvPDgsWNAGoRpAqoM505Uq6MnU4NAfV987iUhukTvV?=
 =?us-ascii?Q?o/YCnmrHTRYQ6/569JNuHo9vDjfM72ApHv31jYlShAqvcF1tU8Fsj0YCLBw8?=
 =?us-ascii?Q?oS5X/RFwBIATCSCOoIW2SJ+XO+/8zKXyCPcO7fFD5bopDJDliaUYmyT7nq4U?=
 =?us-ascii?Q?iSY/hxxMLcs+KXBX+/nVZTsW5444HeZY/Qbo3j7Uz+teE47uyPGqUpE5fTCH?=
 =?us-ascii?Q?AY0cxE+vm5WYffj/pqPupBGdjJ6EjDmVYPCClDiR9BFoeEcrR/dZldLNcwnS?=
 =?us-ascii?Q?5WMFZAMy7RjVnNH4bNX8/L5SLakjoy7pTHVe7Q85UIJT+d/ZPMsjz7mMfnG+?=
 =?us-ascii?Q?DU5vAOH4tBlkxLHL4FP3NJoyqL7y/SI03o2itm9edo8v5I8lR2PPR0O9yWm1?=
 =?us-ascii?Q?teymIwKNIKt7ZRhvQyGBq2UHGJew7yv5RQKP63FpqVzRxjmFFzbEnhQYqiEZ?=
 =?us-ascii?Q?hrW8t4KOl1t6hiXtBcwnqI3tX8tD0y3i+HhnwS1gToed3G2xS30qJaqbUq0+?=
 =?us-ascii?Q?aTupZHOjSjx9fq030V9NNSik67W/9GBpbHGUff5AMRmJzpoxEx7Uo+Aws1Fs?=
 =?us-ascii?Q?F2+pdMC189qhVJbDbvazILZpaYHIhUiu9ZfFQmuxgLjHwP5X78MPAYmXsB8g?=
 =?us-ascii?Q?nebYXJosvQEcvX0sOKfjbUjaXpxx53Dq5d7EGiY9eH8H3HSOzBdcyTPq0SJ4?=
 =?us-ascii?Q?n0s48T2a5uD/4I6eUHwWn1+pob9uSVZ45IVioP29UvXKm+6aKYU8YkggpdOk?=
 =?us-ascii?Q?FDCfQ/hrLIRPCKq28CxkBTuKTK8+6m4ol7aMlWOCka1H1KT7+Lw8tII/yru8?=
 =?us-ascii?Q?yA/M5gt/+Gy0ChYJi22QzhlHo5eV?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB8427.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?S8hrvYGG6CUwo6p7hTwlMGncfUAHsQG9lA16oKt0ruTZ6tvvDp2IRsL4Qdgf?=
 =?us-ascii?Q?dankvRMViG6MsXajOnSZzIvNL1xqdflqWyzgaBc+4KDXFXQ5Kc/dJdG3rJZU?=
 =?us-ascii?Q?24NJP7j/68hVo5vEb+mA8I8SKFwieScYZTRCP/6yTmvvZkd4h2fATCFva0L5?=
 =?us-ascii?Q?Mw8Y8Odpmo5MCy0Gpnfg8OxJCJQdsvtgEfoErB3l8/skr4V+HkG7u+H+0xcK?=
 =?us-ascii?Q?Ylx0EC5s9Nsb0Ns69vt1AVXBt6CdnKsYs8OOxJJO0kJ6A5pmQBQZPRAxEO/E?=
 =?us-ascii?Q?gVy4lGScuSJl3wh6ooZvP/9lWIWdc3LMMTNdLQDqaViVMBcAoIqE6sdNPdb5?=
 =?us-ascii?Q?J2v2P0qC5lzZAcHYWB+lF+YzvURr5s9Vm83zXjVPbDDyXESVTCtFLFlE3F2q?=
 =?us-ascii?Q?/d6skqDnY4ewjHJWrHKGeWNZdF+6fo2/uRdjQFPJHpbOf5G2d8oLwgpIM5FT?=
 =?us-ascii?Q?rW4NZh5E3NHiop3bsSHwF/KwS/0j02EExIqPCUqoiBR6S9uEhBiZS3AxeeAp?=
 =?us-ascii?Q?JfGWmPfbMjz5Egerp97zQJt8XFy4OKMvCrXUytF8EhUGCCiCfOdYOmzkpZYq?=
 =?us-ascii?Q?WobnNE0sPLkNjbNdgwDdgHn1pwUTo40+IYkWG+ZJWZli93umt486J06jC5rK?=
 =?us-ascii?Q?TqVwmXg/HjQoQhy5Etr/rjYbNio+Gq9yLWwXWcGe0QLeMFSUmyEbAncI8+BE?=
 =?us-ascii?Q?GnoMeW6qu9UU4M8StzxG5i3NGwC3mRu4lliRYI+5Qgfi0X3GXeL+d+q0HEzM?=
 =?us-ascii?Q?EYXsMeHq5GeGynqGtzyqa3XYWIC+ACcaQJw0jDlPYqGmfFRuDc31Ebswy7o8?=
 =?us-ascii?Q?SW1tn4JrneyVDUduL3brypsQexnetrVG4gFpULqDVnvUwtbythzuKr2hoc++?=
 =?us-ascii?Q?/b4EPdX9qH0afnm4dde7oO1NT9SBF192XgmpxsxVbDl8i0dYawHPzrzWPffx?=
 =?us-ascii?Q?/btfFuUpLMJ0dGgrC70LgYz1iznNYvruNBIhnWa9DZgF3GDnruyTuyVL2SiX?=
 =?us-ascii?Q?gHZU8w9LB/2q6+yfnYEGAdRfuBsjNNGPwNjXjbW8lvUC7WYucEyoTb7lRer8?=
 =?us-ascii?Q?SejUboDer73PUkF3yo5NmY00/90P76Je8rf/19XflIYFIdQ2VVze9oEoQGSA?=
 =?us-ascii?Q?n2oD+g+rkEzq/S7jDGzutBQpUMf7e2nzqE23JkHludyz6pzWa6TIl6HIulpE?=
 =?us-ascii?Q?BFt1Rg7+NbmHeTDnXTEreHpxIwrorB5hCg7N8txpVQrtA8ekE1Yh0X/DJCSf?=
 =?us-ascii?Q?CPJsu6jD1YwEIBo8linTAL3bckaRkukOMGAOwQMvBD20wOJZ9+vJ1Jl35DzY?=
 =?us-ascii?Q?ReMfMe0vxOtQF2t4M47prU9Mx4hPPl0vcGqzixzeWgcwtT9sCFFkzHbsvtVA?=
 =?us-ascii?Q?kjjVj4OyOr0Tw1UlszpKYMltZ+BLX+0H63D+fS4oXOPpowjol5+OInKiWfPR?=
 =?us-ascii?Q?ATgeFPs0+07VL91M1udqPyZc30cWR2txlvoh72e8wgDTcKXX1sXHPyr5BpnJ?=
 =?us-ascii?Q?40EpBZu5hDamZ5WogdEpllcYxDBg84xOZ09I6M8uOdnW9PBZS0+ARvtBz6h7?=
 =?us-ascii?Q?ge3yERbkXnlUPP8odm9Pro7Tm0xANlfAM+qk4PT6H90KruCRddhOsWeOUNCc?=
 =?us-ascii?Q?Ng=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 606290f2-5aec-4c4f-4d6f-08dd5ffa3cef
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8427.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2025 17:37:32.8184 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NdiGCGbV+cwU0hOshUTFwBcJN/9WCbEbRUVv6AKSy74MFiObXVp7yW6X/sWWUVG3vsV4KRfoyCTKCU5JOUutZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5054
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

On Mon, Mar 10, 2025 at 07:26:38PM +0200, Raag Jadav wrote:
> On Mon, Mar 10, 2025 at 01:01:11PM -0400, Rodrigo Vivi wrote:
> > On Sat, Mar 08, 2025 at 06:12:16PM +0200, Raag Jadav wrote:
> > > On Fri, Mar 07, 2025 at 09:33:05AM -0500, Rodrigo Vivi wrote:
> > > > On Fri, Mar 07, 2025 at 06:21:12PM +0530, Raag Jadav wrote:
> > > 
> > > ...
> > > 
> > > > > @@ -454,6 +485,7 @@ static const struct hwmon_channel_info * const hwmon_info[] = {
> > > > >  	HWMON_CHANNEL_INFO(curr, HWMON_C_LABEL, HWMON_C_CRIT | HWMON_C_LABEL),
> > > > >  	HWMON_CHANNEL_INFO(in, HWMON_I_INPUT | HWMON_I_LABEL, HWMON_I_INPUT | HWMON_I_LABEL),
> > > > >  	HWMON_CHANNEL_INFO(energy, HWMON_E_INPUT | HWMON_E_LABEL, HWMON_E_INPUT | HWMON_E_LABEL),
> > > > > +	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT, HWMON_F_INPUT, HWMON_F_INPUT),
> > > > 
> > > > here as well... I believe we should not expose the fan files if !has_fan_control
> > > 
> > > I'm not sure if I'm following here. We'll still to define channel attributes
> > > to be able to let hwmon expose them at runtime based on has_fan_control flag.
> > > 
> > > One way I could think of is to do a manual sysfs_create_file(), but at that
> > > point it defeats the purpose of having hwmon.
> > 
> > Well, there might be a way. I don't believe we are the only hwmon users with this
> > case.
> > 
> > Ashutosh, Karthik, thoughts on this?
> > 
> > Have you guys seen around hwmon a way to avoid creating an entry based on the
> > platform? Like, in this case, avoid fan interfaces to appear at all on a platform
> > that doesn't support fan control?
> 
> Isn't that the whole point of ->is_visible(), and isn't that what we're already
> doing here?

Doh! right it is.

so, please move this comment to the
xe_hwmon_fan_is_visible() function.

'here as well... I believe we should not expose the fan files if !has_fan_control'

I mean, this check for the !has_fan_control should be the very first check
in that function. Then we don't need to add anywhere else apparently.

> 
> Raag
