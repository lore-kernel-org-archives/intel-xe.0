Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F777FD45FA
	for <intel-xe@archiver.kernel.org>; Wed, 25 Feb 2026 22:46:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D00010E83C;
	Wed, 25 Feb 2026 22:46:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CFuMRQDs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F6F910E83C
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Feb 2026 22:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772059599; x=1803595599;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Br48RPOvOY00mu/Zzh8wnM8lvyOeGukG1qsh3e0cvWE=;
 b=CFuMRQDssFQaPv67XFDykz2GvHa/nD/L0PW3PbOQICsZDxxugxAoxD5J
 ixTPXvtKSzpc9nkpNZvXKj58knhM/zO3LF1P7CIuxWGqL4TCtPmmaii8L
 dwtq42xI4nzMWtAR0EP1mgSVbnnO10BRwZa8Scah1ufNdhUX8c7u2n5EL
 tvKma5KDayDIBObSDvmugFVs73aiiFUg79F2j9VtUPwHnWM9I7iIsX6yF
 JzGaqPcKljL8m2vvFlKNF2bqXZCD/+7r5vzDp1zuJ6Bpfp2nPg+f4dj7t
 3ugdqsWBYrCwkmrTI6yiItWT5fsbBLOoPJyDBZWfomc5n0TmeKe6jCAYq Q==;
X-CSE-ConnectionGUID: Jfr3lL+BRpSw8DoKnWmp2Q==
X-CSE-MsgGUID: XAhsqOZ0SdalKtM1f+2veQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="83739291"
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; d="scan'208";a="83739291"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 14:46:38 -0800
X-CSE-ConnectionGUID: N+KSazFoRpiSL6olJ9MAAQ==
X-CSE-MsgGUID: s3h7my7KRkuNNlj5U/Hx5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; d="scan'208";a="220873116"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 14:46:39 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 25 Feb 2026 14:46:38 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 25 Feb 2026 14:46:38 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.69)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 25 Feb 2026 14:46:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hYZDlvHx+Y0bIlI+E70oXFoT1OEin/Eh+VLYD1jaH+73YuHsUGcC0joRP8rqVyLZi03lEe/QTZFA2wakH+FmHVNIUC3lC26tCV9igoPeizHfxtRDHoSqNuth4WyoaBqMZbfuqFIALB5A7NsLLdsoygPUhLptq+hlC4GvVBKXJqZjgs67n9/I4LjBVY08+IxH7JU5fwI4FcNMXxac3d5jpf80LEkN5SjreVV2vtv96XMy2KLnPabg1ofg3xPF8/cP5h3wsorBlZJRBdT1j76Q/gwBLhptbhR4EsNlJEBryWCV3MW6JaexZcvz9Wtrp+M8VJArenM3WZ8Q6u8mZD+C0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PsZw46+uF6ZKMc7BDOTNa8TYAdrfdmBMGh6YlDA3l9I=;
 b=kreTVWY9xlfe6618OVsRGqczrmKdEjm34HzX0ZSyJcdDCyCMi0+vU8ssB7zNC9NUGOCJKYe07rS0w03t64+guWRNEXVMWPY/QGyjxucapYwGGaKBnGe69jVk3X47/crSGVby2H8oeO9gRdl2OKUXC1pW2yO4KP83H7kG2nJz0rpkWxjg4wFjffpPWAkO3y/uXrYNIyulAWhh0C46izmVXDaXSZeFyKH9a/ESHk3DwFJjI2IUp8OigKdv5RGZosxPHeqfja6x2w0ar11M2k56Z5HWjaLJLRQsswNf/USbAoxrTJX2uq1NDRE8Baq4ARFYgoL7ohjoK0N3+sJthNodIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CH3PR11MB7819.namprd11.prod.outlook.com (2603:10b6:610:125::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.23; Wed, 25 Feb
 2026 22:46:35 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9654.007; Wed, 25 Feb 2026
 22:46:35 +0000
Date: Wed, 25 Feb 2026 14:46:32 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Lin,
 Shuicheng" <shuicheng.lin@intel.com>
Subject: Re: [PATCH] drm/xe/guc: Add support for NPK as a GuC log target
Message-ID: <20260225224632.GP52346@mdroper-desk1.amr.corp.intel.com>
References: <20260224203616.365912-1-stuart.summers@intel.com>
 <20260225002417.GO4694@mdroper-desk1.amr.corp.intel.com>
 <0e02e8acf4391d49c0a6d6d7a9aa0ef747033338.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0e02e8acf4391d49c0a6d6d7a9aa0ef747033338.camel@intel.com>
X-ClientProxiedBy: SJ0PR05CA0088.namprd05.prod.outlook.com
 (2603:10b6:a03:332::33) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CH3PR11MB7819:EE_
X-MS-Office365-Filtering-Correlation-Id: 9090ceef-86b1-4008-fea8-08de74bfba9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: pYDlgst7hFAkh8RK/BTb/8/16yIAIFwU4yLpyGbnuAQEw5Jbn5Ew9BVY4sH1BpsMIC5eX+LwTMvZ/TvfQ60vkzP9y+Kgp8kbTkjioNLODi7nlyI4EWx+f8i1Bap0nVYymM81mQKw9s1Ai0kVEU+XXbJIobm1Fn5W/W09Ilf4p3x3qm6k5vZefmBAk21B5aa+rTPDT46tsNTLOKxwWGYQ+r0eTNRjvGSEMrJHwqFNfHt8n2XhvLtMXGwa3t5k1l/dYbunHoV9CJWbliHEY9GhnNA0Q7Cf7W/piiUp9vH61qvVwdghuOGg97d4cnt6EJa9t6gl2wKticH6WWs4oqr4WHIl0uB2a4tToT5mj7j9xF6T97DJT0qHYg4oIDnomL1YH2rC3RVRrzZ/RbDmm6PPR/YJx5JV0Ammm+0XMKESsJrPsYafhS5uvSd98gjBcD5yWiqg+Ys1wBwBUNBpjxh2z/DwWjBZi4D2GkHxBOtKonUqyIp6E8V/ZOBwH1SUVXs4tQ1aalB9kn8QqqxoaykumPzHr3A6nU9DxC+CK627EdCtNr5CC6r4DgthvxAznYoSWdZC0ZORFO0EAX98PAJrmchxtKol/w4RZIdpga9lHbDNzqhmek4665CD7JRsCMJEJ7S+qyo3XqigfhgG1vJTqasOXH+YVWOPSPBWr9VI8AfJwrt2MWiuccWkgLbHeg2pYNR3dz4NfVrbGFTGAw07BocS9etSGNK2VXa4To9Kfaw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?3t5Hex4VqsapL/vucvNKclWvowjk6umc1CQOUhHYkZWQyIQHNcThA1htfw?=
 =?iso-8859-1?Q?q3ptIra4XdhXtAWN58Cm0Gkt/5/VtfbZ/9E5htzVsu5cif8SGOp83Z2Lic?=
 =?iso-8859-1?Q?fVjmr9tMhKytz4o6BwnMP3Qftk8AMH2wpgBt6isDkEy8KmGwVIoN6NZmJh?=
 =?iso-8859-1?Q?x3hy6Zu5iUW6Vdsv+oe+9ir2zt33WVZqreIycDIQfkhdhnHWziZZ6/N4Wt?=
 =?iso-8859-1?Q?Jd1JuYwTztvm0G6AunByv36GPLiKU8kuR8LGG0IQ6nuWCXCbqrfjyEVuQr?=
 =?iso-8859-1?Q?UZHNT8MJHE44KrJKU/EKlhYjhmveSGcvSvNh6uvJlMP0JtE29l0jEL0r/k?=
 =?iso-8859-1?Q?JTSLIIgWoio6BHOPJqpIek7K3lJVrU8Fpnw+b4WwLYVgREF/YmBABlFM/I?=
 =?iso-8859-1?Q?0lZwdVcrXnN0fqDrxthyj0uDeLjKWibopoVvVgJFkNq12zKUZWF4NK5+mm?=
 =?iso-8859-1?Q?cq9TvwfAjFh7INJMcnefXCplra6PaJynTYduCoXgHgPr9uIukIP5eApG5E?=
 =?iso-8859-1?Q?tOUO0h/LPeMcUq7e638Dor2t4Qzb4gdj21c0Se9gSc1B/3QUz8XpkIP3ME?=
 =?iso-8859-1?Q?bH/44MepKcKep8ZsuNuz3LvlJw1988BWj8vIDnCKNycnUM0uiarhG/lBJ/?=
 =?iso-8859-1?Q?83xPDkppDSQNXA0ilV50edaf6COJ5fSc0EEq6XYwZThqzE1gCpIjVqPX9i?=
 =?iso-8859-1?Q?tfu9fG3RQoxNrw1xFf5MtzjRTYHhzEDDVcpAtM0WP32ksGOXXUAwux058c?=
 =?iso-8859-1?Q?eSrDidnJwJoztBcCPgjlPAdNXkrP/Dh8TcxcVsUZgGUYohKzML0CFILNN4?=
 =?iso-8859-1?Q?fyENqtryHUQhPlhb8Dtmot4zWFG9QZ2gR5eqcykjszbztRhC3mNRnuGUtt?=
 =?iso-8859-1?Q?+TJt/wOYEWpxYuAGf9aT+ZrMcQhh7efwSR3+vJpxzlmmTpdhU45xs8FMX4?=
 =?iso-8859-1?Q?wq1TAYanLORabCbfbTjw3oBejUaVaUNRYiKMJoCSULqwIOcQgijX3VE6Jh?=
 =?iso-8859-1?Q?28eMrP6Jb2CHqziVmNEYgymxxI1EUR7ORNIwX7DiCcVyrCb2yHQt0MR3+l?=
 =?iso-8859-1?Q?YFnptuScvOavldkiIrUNjcfGvgMs0O6n+eiQM9dzNrC0xOaSXXs64ZVw69?=
 =?iso-8859-1?Q?kg8toLBuKAlc9b2nrT1MVkQCY9VG8iHDb8US2hc8UNjrP0E4HgEx04x55r?=
 =?iso-8859-1?Q?EbKyoIqUy29zzZdZbNJReIbQTtJfgjlJBelO7VLio6PfBerenZma6E+xU2?=
 =?iso-8859-1?Q?Yf9rDBVBqFuFR4yysTGbv+3OfzDD5bwZ348GIvWmfrB4/GCI5A0rG4yd0f?=
 =?iso-8859-1?Q?cw9t3fh45hf8wHEfVQGZhWAiY4BazuWKsZuGoqjD3crZUKIbNCxDYSVmPF?=
 =?iso-8859-1?Q?KdCKNfr5RUOVljE8HgtwODRTdAp3HFe6BQu7fZsD1C1CCnYXwFxmRkv9sQ?=
 =?iso-8859-1?Q?TQ+wuKnLwQ4zO//tDRbXi5r01ObMaaC51EBh171tCPUe1ipTadJ44NNHOU?=
 =?iso-8859-1?Q?Gpog3XEl8/WKomZDejDJxlrWRgYW1oEDATg6OmrFgGdvdBZxuzBPjqdyhT?=
 =?iso-8859-1?Q?SxYj9cAULrzDmTqzIaLKKEqeX4ghqHMg7wMM/LJC+YQy9wQmvKzvdl8XtE?=
 =?iso-8859-1?Q?ZFfsadlkM8E6VlPp4B7a6x6iBSJSr6Vd6VimwZ9gU0mAnjeOnIG0E2bEC/?=
 =?iso-8859-1?Q?g3nlUxU7J+sjoGThsR4Wnu0ohEOTKFfSQ0sXWLq472/VHxeQH5Hry0Twr5?=
 =?iso-8859-1?Q?18P8Kqr9L2Lyfaqhm+nhNqR3i0OTcsd29DHdPAiIedNgaNxCa55/0YVImk?=
 =?iso-8859-1?Q?1Ia2L1a1ieHi1LpH0BjJWFYtmQ7qCcE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9090ceef-86b1-4008-fea8-08de74bfba9c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 22:46:35.3533 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: frGdVmHUMM/iVOD8a2SPIPkMr70v4JehXI9o9p+2M1EwNGFz2LSJRnyiV8YlNzdvtkz9YF0xCmxKtVJReuCqn3ICZSF7qdAK2n2bKJjhFQI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7819
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

On Wed, Feb 25, 2026 at 01:52:11PM -0800, Summers, Stuart wrote:
> On Tue, 2026-02-24 at 16:24 -0800, Matt Roper wrote:
> > On Tue, Feb 24, 2026 at 08:36:16PM +0000, Stuart Summers wrote:
> > > From: John Harrison <John.C.Harrison@Intel.com>
> > > 
> > > GuC provides the ability to gather logs through a hardware
> > > interface
> > > called NPK. For certain debugging scenarios this can be
> > > advantageous
> > > over getting logs from memory (or in addition to).
> > > 
> > > Add a hook for this alternate debugging mode via a modparam similar
> > > to what is used for GuC log level. This translates into a parameter
> > > passed to GuC during load time.
> > 
> > In general we're not really supposed to be adding new module
> > parameters
> > to the driver.  Some existing parameters are grandfathered-in because
> > they were added during early driver development before we really had
> > better ways of configuring things.  But when possible we should
> > probably
> > be looking more at per-device solutions like configfs these days. 
> > It's
> > a bit more involved to use, but that's especially okay (maybe even
> > desirable) for something like this that is only useful for low-level
> > debugging and isn't actually usable or useful for end users on
> > production hardware.
> 
> Very good point and you're right. I guess I'm a little hessitant to do
> the same for the guc_log_level given we have a lot of tools using that
> today in CI, etc, and converting all of those to configfs will take
> some time. And I like the idea of keeping all of the GuC configuration
> stuff in the same place. Let me know what you think there.

Well, I don't think I'm the one to make the call here; ultimately the
decision really lies with the maintainers since they'll be the ones on
the hook to justify upward why we're still breaking the rules.  People
in the upstream Linux community like Greg KH have been pretty vocal
about how drivers should not be adding new module parameters for
drivers. E.g., https://lkml.org/lkml/2023/5/4/260 ("no, please do not
add new module parameters for drivers, this is not the 1990s").

Aside from possibly community pushback, there's also the general problem
that module parameters don't actually match what we're really trying to
do in a lot of cases these days.  Most of the things we're configuring
with module parameters today should really be a per-device setting
rather than a global value that applies to all devices.  Back in the
early days of i915 it didn't really matter because we didn't have dgpu's
yet so the driver would only ever be supporting a single igpu device.
But those days are far behind us and multi-GPU systems are quite common
now.


Matt

> 
> Thanks,
> Stuart
> 
> > 
> > 
> > Matt
> > 
> > > 
> > > Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> > > Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_defaults.h | 1 +
> > >  drivers/gpu/drm/xe/xe_guc.c      | 7 ++++++-
> > >  drivers/gpu/drm/xe/xe_module.c   | 4 ++++
> > >  drivers/gpu/drm/xe/xe_module.h   | 1 +
> > >  4 files changed, 12 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_defaults.h
> > > b/drivers/gpu/drm/xe/xe_defaults.h
> > > index 5d5d41d067c5..194500fb0ab2 100644
> > > --- a/drivers/gpu/drm/xe/xe_defaults.h
> > > +++ b/drivers/gpu/drm/xe/xe_defaults.h
> > > @@ -12,6 +12,7 @@
> > >  #else
> > >  #define XE_DEFAULT_GUC_LOG_LEVEL               1
> > >  #endif
> > > +#define XE_DEFAULT_GUC_LOG_TARGET              0
> > >  
> > >  #define XE_DEFAULT_PROBE_DISPLAY               true
> > >  #define XE_DEFAULT_VRAM_BAR_SIZE               0
> > > diff --git a/drivers/gpu/drm/xe/xe_guc.c
> > > b/drivers/gpu/drm/xe/xe_guc.c
> > > index 54d2fc780127..10bf63c20a14 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc.c
> > > @@ -79,7 +79,12 @@ static u32 guc_ctl_debug_flags(struct xe_guc
> > > *guc)
> > >         if (!GUC_LOG_LEVEL_IS_VERBOSE(level))
> > >                 flags |= GUC_LOG_DISABLED;
> > >         else
> > > -               flags |= FIELD_PREP(GUC_LOG_VERBOSITY,
> > > GUC_LOG_LEVEL_TO_VERBOSITY(level));
> > > +               flags |= FIELD_PREP(GUC_LOG_VERBOSITY,
> > > +                                  
> > > GUC_LOG_LEVEL_TO_VERBOSITY(level));
> > > +
> > > +       if (xe_modparam.guc_log_target)
> > > +               flags |= FIELD_PREP(GUC_LOG_DESTINATION,
> > > +                                   xe_modparam.guc_log_target);
> > >  
> > >         return flags;
> > >  }
> > > diff --git a/drivers/gpu/drm/xe/xe_module.c
> > > b/drivers/gpu/drm/xe/xe_module.c
> > > index 903d3b433421..1a8127e508e4 100644
> > > --- a/drivers/gpu/drm/xe/xe_module.c
> > > +++ b/drivers/gpu/drm/xe/xe_module.c
> > > @@ -23,6 +23,7 @@
> > >  struct xe_modparam xe_modparam = {
> > >         .probe_display =        XE_DEFAULT_PROBE_DISPLAY,
> > >         .guc_log_level =        XE_DEFAULT_GUC_LOG_LEVEL,
> > > +       .guc_log_target =       XE_DEFAULT_GUC_LOG_TARGET,
> > >         .force_probe =          XE_DEFAULT_FORCE_PROBE,
> > >  #ifdef CONFIG_PCI_IOV
> > >         .max_vfs =              XE_DEFAULT_MAX_VFS,
> > > @@ -51,6 +52,9 @@ module_param_named(guc_log_level,
> > > xe_modparam.guc_log_level, int, 0600);
> > >  MODULE_PARM_DESC(guc_log_level, "GuC firmware logging level
> > > (0=disable, 1=normal, 2..5=verbose-levels "
> > >                  "[default=" __stringify(XE_DEFAULT_GUC_LOG_LEVEL)
> > > "])");
> > >  
> > > +module_param_named(guc_log_target, xe_modparam.guc_log_target,
> > > int, 0600);
> > > +MODULE_PARM_DESC(guc_log_target, "GuC firmware logging target
> > > (0=memory [default], 1 = NPK, 2 = memory + NPK)");
> > > +
> > >  module_param_named_unsafe(guc_firmware_path,
> > > xe_modparam.guc_firmware_path, charp, 0400);
> > >  MODULE_PARM_DESC(guc_firmware_path,
> > >                  "GuC firmware path to use instead of the default
> > > one");
> > > diff --git a/drivers/gpu/drm/xe/xe_module.h
> > > b/drivers/gpu/drm/xe/xe_module.h
> > > index 79cb9639c0f3..bab43dbacaa0 100644
> > > --- a/drivers/gpu/drm/xe/xe_module.h
> > > +++ b/drivers/gpu/drm/xe/xe_module.h
> > > @@ -14,6 +14,7 @@ struct xe_modparam {
> > >         bool probe_display;
> > >         int force_vram_bar_size;
> > >         int guc_log_level;
> > > +       int guc_log_target;
> > >         char *guc_firmware_path;
> > >         char *huc_firmware_path;
> > >         char *gsc_firmware_path;
> > > -- 
> > > 2.34.1
> > > 
> > 
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
