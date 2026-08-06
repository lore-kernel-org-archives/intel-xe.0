Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B0A2C56205
	for <intel-xe@archiver.kernel.org>; Thu,  6 Aug 2026 19:02:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40E7D10E3A0;
	Thu,  6 Aug 2026 19:02:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FGq7gfuQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEC5410E384
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Aug 2026 19:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786042924; x=1817578924;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=v6QLR+14fOr1xOHnCosxwya//D0K7NEEMmK/xDF9zRE=;
 b=FGq7gfuQHzdZFrb7VtlB8RPuiiWtJGwr6EAfD3yImIbfiuZwZPTD5Jlc
 4VbxePdj1PzCDpuM3zra0UkZR9HJLQ0Soqf/ebsanoPrxwIRGKhk1X65i
 XTXEma7IpY9dPqOeZOCSgp9cm3+VLXA1wkztsBXY5ZK1Grq51C5VtY5KO
 n5mcLel9RVqN+H1Ld1EnH2LLdwQz798ub7GQhC4gqh8a77chuJEB2o3n1
 CKQgRE+7hclTtzVfEIRzNkjzfzw9SHa9BoLxLlGPdToqwL/bgKBCy4Zq1
 L+/KNHIisYzCuWlRLF3846stpZoI9B+x+8E4nOVMBbfFDztL+w4tH+1lU A==;
X-CSE-ConnectionGUID: 5lZ6p5ZsQOK2+eYcP6ttqA==
X-CSE-MsgGUID: 0QLzj/6HQ4WYrQyg8tIjYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="86678091"
X-IronPort-AV: E=Sophos;i="6.25,209,1779174000"; d="scan'208";a="86678091"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2026 12:02:03 -0700
X-CSE-ConnectionGUID: wmFVCZ+ITtqVm1kz0VrwXw==
X-CSE-MsgGUID: jfv4JWFlRb+/XRcgtAdD2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,209,1779174000"; d="scan'208";a="262254997"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2026 12:02:03 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 6 Aug 2026 12:02:02 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 6 Aug 2026 12:02:02 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.41) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 6 Aug 2026 12:02:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IDxakLN0GqnJJBamEavrusYfnKuSirfLthacWI/4whwKeuB49VH33//ixBoWHBxN/1Bs0AMP2TtH2B2vm5K8Xand2v+UyEI9aOfzgsv4dnoFweCi1EgIhCZA6gtf3lUa9rbaPzAWIBw/Tjxd17dnpEVx4zSScn1BLoyVwkghPvuv2rbq1WHXqgDK8Egb8r/O80HnJjZzkG5hhfpfSmOAQ3VhewIHUfhzD09DMkz9Pynnk5d/14nCIfVwb0Z9R4vWn9CDOuD0dsLyJTZuQMwB1XwCRcEd9vM/j6rLJXZzXgvLewR1c7dLfj1FspehDSBxXKf0BugOgTzdXp3tgXqjKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SD00w0zFUTIu3LymQyHAaQD6lJ51kkUmym/i7O5RcAo=;
 b=kDJQLW/dXT7qpBlhE26m9b+ZgA5riMJ3qg9ZDBKPB2BTZBA1suiST9sJHsT0ZEZ282T6Za9fhsFgUQtPsJVIRqmCti2ZeCqQFokdtEOKXfpEm9X4JobDW5RZPXe/otqrK2M6OTlaiJFncaQYlqVZEIo2SzEUEh0tXZT19Svu0sGvhVlEZ/hU3Q0h4Tz+a/BObpyItTibX9+YVsg7xFaBuQOD3jhfSz5ZnPRVg21iPdEQzZ/PgqwAC0Grgh3AO5Fkj+4Iqxm1Ax62GQwPbfUhxb7cp/qpk26S3wVudIsFc6/xjBGK6o4K5TvopX02KHJxUW9vU8ZfLknILkdOcY3e7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA2PR11MB4873.namprd11.prod.outlook.com (2603:10b6:806:113::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.16; Thu, 6 Aug
 2026 19:02:00 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0292.019; Thu, 6 Aug 2026
 19:02:00 +0000
Date: Thu, 6 Aug 2026 12:01:57 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: Nitin Gote <nitin.r.gote@intel.com>, <intel-xe@lists.freedesktop.org>,
 Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH] drm/xe/pm: do not warn about missing runtime PM
 protection after hot-unplug
Message-ID: <anTaJUiijSUN+Dmm@gsse-cloud1.jf.intel.com>
References: <20260806085711.437110-2-nitin.r.gote@intel.com>
 <anRGHJeae97n3ZwU@black.igk.intel.com>
 <anRV+xVRHWpTEiFh@gsse-cloud1.jf.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <anRV+xVRHWpTEiFh@gsse-cloud1.jf.intel.com>
X-ClientProxiedBy: MW4PR03CA0019.namprd03.prod.outlook.com
 (2603:10b6:303:8f::24) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA2PR11MB4873:EE_
X-MS-Office365-Filtering-Correlation-Id: b8cdf6c0-23b2-4ce9-6c0a-08def3ed319d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|6133799003|10067099003|11063799006|4143699003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 4ys80OgogGd8mgAUAvhAmjIOPKEwDvxq2cZkwEf8KiMDExPCxEqr24gwwhdeRk5SBPOygx31gfFPC4BC24z2WoI6ceej25R6RIRFBX4FWvx6LDvG+j0io27rcbUdtcYuHnA9+P2wpd1ltHdmq9TOInBFfAPJL1iwuq1EDFIa7RM8F48ZpJKTgUXXVUScRD7H2QqIa1Rv5DEz+7ei5IR74O3dHsp/L/x4hDj90g6ZW9jmLOcMGBhORep1zfTvkmpqbuQsFuO7e3m/2QVbDmEmM4Vopqtrv1xbUEBV1AvvdNzOjAQxBNEbMbatowVXDnHKrVRdtluWGGFwArBJ85/yc+G7bgl9VU3g60XNUlMZ8YCnWx0OQZdYXuuGoDFRY8tFmrG6Z0ohHK6kSoQB2EO3RVkwgfkIyHEc2jvDj6BQCP0dB257JTXTya9gXSxWSgW1XvImi0/EWCkC0MFnIHkwbqfb8TAZJwawxpC+FlhXidq7uoI9jTK94OKG2vIlzs67oIX7fFV5pAVFmLOyanl+W9v4uIJWcBTBxDRtFRzQP6NCmih9T2oBFr5sHaKn9EZfdiB/Y3EZI40Wy8nT3XaBPMeVJVE+00Sn3swBb8FRkOMuc0VIpIp0DpjQt8qSUeoKruygF9QyY5Xap50S1hKFI/5Zs8Gwafrw9KixotZ4oHE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(6133799003)(10067099003)(11063799006)(4143699003)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GPzfbD3DHavTUAujkr2ePQEugaGI06u4h9HWG7wlAiZfImp1AhVvJNsMPQQC?=
 =?us-ascii?Q?X4pSHMscAdlHhIJPmr0/2d5XkdhSF8tGC9rDYNJwa2spTEs+NK5otfgDo0N8?=
 =?us-ascii?Q?dVM+uO2AsZblU4QAg8WxEdgnUNaIsqKSYM36kZK46vdgra0mpUWepyCV/dd6?=
 =?us-ascii?Q?39KiAAx3oMgDCNpqDBFW4ntApNn3w6OrA+qX36Krl8fQYYPU12Fc/VTa0p9M?=
 =?us-ascii?Q?90eI3VonW3QpXLevPyj/crepvqiXWFIAfn3jnsON3bpFF8O/s4x15uqoXiys?=
 =?us-ascii?Q?jVgAaF4VSuWy347eDeCjybzdKyzvKoyrRZqdBNqqmI09VwYsL3LTXOvM6rkL?=
 =?us-ascii?Q?Cx6B/Ykuid+aBZRMthhUskzWkAVC+6oe1TWy7R9IeC++Gc+ByV/cfQQEVOSg?=
 =?us-ascii?Q?lIr+LK3Fiz45lBuYcm8gB7gNwOgfC6+j3c7MtqwLE7xAXiol+GvbmBrqiQm4?=
 =?us-ascii?Q?4Oy9gY+pXJzQ8jydjdQ7xyObdPG2g5K+VawoO9pmKUIjGGpbRgAJF00kHciE?=
 =?us-ascii?Q?8UWLsJcUmiqX79dvxOejjP2r0syr3BxncLzdNOdyHqGVjcKmdoU3KCz5JaVE?=
 =?us-ascii?Q?J2UdVChSCQ5LvdERDN/0UKJTyTCWhnWugvDssc4Yp3CO/ztzOh6hRjVHp7X5?=
 =?us-ascii?Q?kNcW7LthS/mnDfVOt3ZpaYEEG3i3pRekstdk3+E1FndLEfCtJwssEQdVe7AK?=
 =?us-ascii?Q?/MA43+snQ+kXEOSuCIr5NF7g18zqL+ixsDwnRDvMwsi0MWUOILt1xtamM1+E?=
 =?us-ascii?Q?XA+uPFDPBVFtj6lK2GGcLBc5iMTs71ah7Zswa4JDZ4KUFz/KA8pXdRnxyoDQ?=
 =?us-ascii?Q?GFOrVkukvxpryrg1nKU61YHFLcy6BjU6SJYqsdsV6BQ3+4Dqu/T2kOOVWqcb?=
 =?us-ascii?Q?6KY7NkymHyynNU2dPm78NEG5if78QLL6qqKrlSl6wE6mJf2AFnYzOJI2WZ2a?=
 =?us-ascii?Q?bm+WyEtY5urfM2DWWu87jwBfMdIXy7ou7Ji8wBkSONTaHB62estVoaERC9gW?=
 =?us-ascii?Q?dvyGmnfdtmehMSYDI5l0ECJDMGjNceu/WW5pqsIXI0u8GlbTCEoltqjpmQsk?=
 =?us-ascii?Q?XuWt1oBnew78BHzcSC+VmZCvT7Yl0EIth3RJC+Z7CvBRB/8dM3nm+0LccNzh?=
 =?us-ascii?Q?wLOpcGH8uknl3yN1gncmIyFbNMtxp9c13pS+5yaZ73weOk7r/Z2/yCDXt8MG?=
 =?us-ascii?Q?9CV6RU5BA49XJf1Id3sDS8NFfxadjU34ajgN/i0ArIsYtW0XLsW4IMr0vMyZ?=
 =?us-ascii?Q?qJlcvs4GzBpojhnYtR/Ei3hbH3FQSQMzVwDp3AE2pog176aM6lZ39/eSAaBg?=
 =?us-ascii?Q?nUWsUpYS0SPDKFqTP5th7JdwedPw4NFqUwOAeFIL5S1TWBLIww1RKKs9K9C/?=
 =?us-ascii?Q?X65JgySYZqaNC5tjwsBs1hCnKulCFGkOd3BC4vS9x6pbimFMGM32NWUTCgjw?=
 =?us-ascii?Q?RjzS/hgM4GSCqo4PhdUmrbUcLLBunDDGuWq2IdIxsKAHCDgGbW9aoM7oAJd+?=
 =?us-ascii?Q?scu2+BksPIgxBdDeRPBgAHjZUlm6gOJ81mFEtjNsqJ4mTLmkqkanB+mF4cNW?=
 =?us-ascii?Q?oripiSphTrRF1dWwFNZmCH6g9slRbbXCZNLTpyLj7rd07RzRBNXFpBRBHGIb?=
 =?us-ascii?Q?Sd6apgAI0E7R837XjTS61S560MROcKOmJCjnmwGsWDHUA9tAq1jgozFg7GC3?=
 =?us-ascii?Q?/pJLykAnB3yBrTXWF+9z1OsE7QbkQrlT5xigdMunh5iPCd6jkdIkYCWdKjra?=
 =?us-ascii?Q?+Ryk2h7jfg=3D=3D?=
X-Exchange-RoutingPolicyChecked: pwdbYhqoqxU5qwXcV9zQ/NYSEJbqtM5tuzmx6ZUu03akXh+7TkrR3NEV/MPZPXZI2COPVSycvQ6yqnccCQO+ZGwxbrEx087vwy3OvcYideR/MctlbsqrQhBqCBYaS0JuCf2GR7XFYMc02xChODxAuCI3fnsrJQvl+CYMFYqP+ztXXCkkBXztWDDEDEzBw84Yka5pTgqkq0wjEnrhW5moBjwwr/jT6jKHG5l/cpuc62ne10ortJGMklPCcgl5lRADetPQz+QNtdlSkqIeUaDaCXd/EHEJqsSBATRjMzXWWsNHMBbEu+GZlXCh9MP8JIoyaWwxFWhBdQiWLMn0pKDlzA==
X-MS-Exchange-CrossTenant-Network-Message-Id: b8cdf6c0-23b2-4ce9-6c0a-08def3ed319d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 19:02:00.0173 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gaVTgEBpSZ4JXtc+uaQeTgPI/ZlbI13SQEfMiT8kDb45ilBUw1eoV+m+O8mEZi9eT/HRO5u3EXoR7dMBLKfvFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4873
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

On Thu, Aug 06, 2026 at 02:38:03AM -0700, Matthew Brost wrote:
> On Thu, Aug 06, 2026 at 10:30:20AM +0200, Raag Jadav wrote:
> > On Thu, Aug 06, 2026 at 02:27:12PM +0530, Nitin Gote wrote:
> > > Exec queues are owned by user fds and are destroyed when the fd is closed.
> > > After hot-unplug this can happen from a deferred close during process
> > > exit, after the device has been removed and runtime PM has been disabled.
> > > The queue destroy path can call xe_pm_runtime_get_noresume(), and since
> > > runtime PM is disabled pm_runtime_get_if_in_use() returns no reference,
> > > so it warns about "Missing outer runtime PM protection".
> > > 
> > > This is a false positive for the hot-unplug teardown case. The device is
> > > already unplugged, and the queue destroy path that triggered this warning
> > > was checked and does not touch hardware state after unplug. GuC has already
> > > been sanitized by guc_fini_hw(), so no H2G is sent and the hardware
> > > teardown path is no longer reachable.
> > > 
> > > Skip the warning when the DRM device is already unplugged.
> > > 
> > > Observed with new IGT core_hotunplug subtests:
> > >   igt@core_hotunplug@hotreplug-with-load
> > >   igt@core_hotunplug@hotunplug-rescan-with-load
> > > 
> > > v2:
> > >  - Drop the drm_dev_is_unplugged() bypass from guc_exec_queue_destroy()
> > >    and instead exclude hot-unplug from the WARN in
> > >    xe_pm_runtime_get_noresume(). (Matthew Brost)
> > > 
> 
> I don't think this was suggestion but also I believe I misunderstood the
> problem, but maybe this works.
> 
> > > v3:
> > >  - Clarify that the queue destroy path was checked and does not touch
> > >    hardware state after unplug. (Matthew Auld)
> > > 
> > > Link: https://patchwork.freedesktop.org/patch/725773/?series=166744&rev=4
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > Cc: Matthew Auld <matthew.auld@intel.com>
> > > Assisted-by: GitHub-Copilot:claude-opus-4.8
> > > Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_pm.c | 5 ++++-
> > >  1 file changed, 4 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> > > index a5289a9df8d2..a038687d5b2c 100644
> > > --- a/drivers/gpu/drm/xe/xe_pm.c
> > > +++ b/drivers/gpu/drm/xe/xe_pm.c
> > > @@ -10,6 +10,7 @@
> > >  #include <linux/suspend.h>
> > >  #include <linux/dmi.h>
> > >  
> > > +#include <drm/drm_drv.h>
> > >  #include <drm/drm_managed.h>
> > >  #include <drm/ttm/ttm_placement.h>
> > >  
> > > @@ -914,7 +915,9 @@ void xe_pm_runtime_get_noresume(struct xe_device *xe)
> > 
> > From the documentation
> > 
> >  * This function should be used in inner places where it is surely already
> >  * protected by outer-bound callers of `xe_pm_runtime_get`.
> >
> 
> We should have those.
> 
> > >  	if (!ref) {
> > >  		pm_runtime_get_noresume(xe->drm.dev);
> > > -		drm_WARN(&xe->drm, !xe_pm_suspending_or_resuming(xe),
> > > +		drm_WARN(&xe->drm,
> > > +			 !drm_dev_is_unplugged(&xe->drm) &&
> > > +			 !xe_pm_suspending_or_resuming(xe),
> > 
> > So IMO this is more of a band-aid.
> > 
> 
> So if I'm understanding the problem correctly,
> pm_runtime_get_if_in_use() (via guc_exec_queue_add_msg()) fails when the
> device is unplugged? I don't see how the PM reference count could be
> zero, regardless of whether the device is plugged in or unplugged.
> 
> My suggestion was (and still is) that guc_exec_queue_destroy() should
> always add a message and determine whether the device/firmware is still
> alive while processing that message, then either kick the destory or
> issue H2G. Other messages likely are also missing proper device alive
> checks too.
> 
> If, for some reason, obtaining a PM reference via
> xe_pm_runtime_get_noresume() doesn't work when the device is unplugged,
> then that logic should be handled in the message submission layer. For
> example, use drm_dev_enter()/drm_dev_exit() for hot-unplug protection,
> only take a PM reference if the device is still bound, encode that
> information into the message, and then determine the appropriate next
> steps when the message is processed.
> 

Below is rough sketch of what I was thinking. We can also probably rip
out EXEC_QUEUE_FLAG_PERMANENT then too. We'd also need solid
explaination how why xe_pm_runtime_get_noresume doesn't work if device
is unplugged, as that part it unclear to me too.

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 9036f89dff7d..08000f8db28a 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1812,32 +1812,15 @@ static void __guc_exec_queue_destroy_async(struct work_struct *w)
 static void guc_exec_queue_destroy_async(struct xe_exec_queue *q)
 {
        INIT_WORK(&q->guc->destroy_async, __guc_exec_queue_destroy_async);
-
-       /* We must block on kernel engines so slabs are empty on driver unload */
-       if (q->flags & EXEC_QUEUE_FLAG_PERMANENT || exec_queue_wedged(q))
-               guc_exec_queue_do_destroy(q);
-       else
-               xe_destroy_wq_queue(&q->guc->destroy_async);
+       xe_destroy_wq_queue(&q->guc->destroy_async);
 }

-static void __guc_exec_queue_destroy(struct xe_guc *guc, struct xe_exec_queue *q)
-{
-       /*
-        * Might be done from within the GPU scheduler, need to do async as we
-        * fini the scheduler when the engine is fini'd, the scheduler can't
-        * complete fini within itself (circular dependency). Async resolves
-        * this we and don't really care when everything is fini'd, just that it
-        * is.
-        */
-       guc_exec_queue_destroy_async(q);
-}
-
-static void __guc_exec_queue_process_msg_cleanup(struct xe_sched_msg *msg)
+static void __guc_exec_queue_process_msg_cleanup(struct xe_sched_msg *msg,
+                                                bool bound)
 {
        struct xe_exec_queue *q = msg->private_data;
        struct xe_guc *guc = exec_queue_to_guc(q);

-       xe_gt_assert(guc_to_gt(guc), !(q->flags & EXEC_QUEUE_FLAG_PERMANENT));
        trace_xe_exec_queue_cleanup_entity(q);

        /*
@@ -1850,10 +1833,10 @@ static void __guc_exec_queue_process_msg_cleanup(struct xe_sched_msg *msg)
         *   it is safe to directly destroy the exec queue on driver side, as the GuC
         *   will not process further requests and all resources must be cleaned up locally.
         */
-       if (exec_queue_registered(q) && xe_uc_fw_is_running(&guc->fw))
+       if (bound && exec_queue_registered(q) && xe_uc_fw_is_running(&guc->fw))
                disable_scheduling_deregister(guc, q);
        else
-               __guc_exec_queue_destroy(guc, q);
+               guc_exec_queue_destroy_async(q);
 }

 static bool guc_exec_queue_allowed_to_change_state(struct xe_exec_queue *q)
@@ -1861,12 +1844,13 @@ static bool guc_exec_queue_allowed_to_change_state(struct xe_exec_queue *q)
        return !exec_queue_killed_or_banned_or_wedged(q) && exec_queue_registered(q);
 }

-static void __guc_exec_queue_process_msg_set_sched_props(struct xe_sched_msg *msg)
+static void __guc_exec_queue_process_msg_set_sched_props(struct xe_sched_msg *msg,
+                                                        bool bound)
 {
        struct xe_exec_queue *q = msg->private_data;
        struct xe_guc *guc = exec_queue_to_guc(q);

-       if (guc_exec_queue_allowed_to_change_state(q))
+       if (guc_exec_queue_allowed_to_change_state(q) && bound)
                init_policies(guc, q);
        kfree(msg);
 }
@@ -1904,13 +1888,14 @@ static void suspend_fence_signal(struct xe_exec_queue *q)
        __suspend_fence_signal(q);
 }

-static void __guc_exec_queue_process_msg_suspend(struct xe_sched_msg *msg)
+static void __guc_exec_queue_process_msg_suspend(struct xe_sched_msg *msg,
+                                                bool bound)
 {
        struct xe_exec_queue *q = msg->private_data;
        struct xe_guc *guc = exec_queue_to_guc(q);

        if (guc_exec_queue_allowed_to_change_state(q) && !exec_queue_suspended(q) &&
-           exec_queue_enabled(q)) {
+           exec_queue_enabled(q) && bound) {
                wait_event(guc->ct.wq, vf_recovery(guc) ||
                           ((q->guc->resume_time != RESUME_PENDING ||
                           xe_guc_read_stopped(guc)) && !exec_queue_pending_disable(q)));
@@ -1934,11 +1919,12 @@ static void __guc_exec_queue_process_msg_suspend(struct xe_sched_msg *msg)
        }
 }

-static void __guc_exec_queue_process_msg_resume(struct xe_sched_msg *msg)
+static void __guc_exec_queue_process_msg_resume(struct xe_sched_msg *msg,
+                                               bool bound)
 {
        struct xe_exec_queue *q = msg->private_data;

-       if (guc_exec_queue_allowed_to_change_state(q)) {
+       if (guc_exec_queue_allowed_to_change_state(q) && bound) {
                clear_exec_queue_suspended(q);
                if (!exec_queue_enabled(q)) {
                        q->guc->resume_time = RESUME_PENDING;
@@ -1950,17 +1936,20 @@ static void __guc_exec_queue_process_msg_resume(struct xe_sched_msg *msg)
        }
 }

-static void __guc_exec_queue_process_msg_set_multi_queue_priority(struct xe_sched_msg *msg)
+static void
+__guc_exec_queue_process_msg_set_multi_queue_priority(struct xe_sched_msg *msg,
+                                                     bool bound)
 {
        struct xe_exec_queue *q = msg->private_data;

-       if (guc_exec_queue_allowed_to_change_state(q))
+       if (guc_exec_queue_allowed_to_change_state(q) && bound)
                guc_exec_queue_send_cgp_sync(q, 0);

        kfree(msg);
 }

-static void __guc_exec_queue_process_msg_cgp_sync(struct xe_sched_msg *msg)
+static void __guc_exec_queue_process_msg_cgp_sync(struct xe_sched_msg *msg,
+                                                 bool bound)
 {
        struct xe_exec_queue *q = msg->private_data;

@@ -1969,7 +1958,7 @@ static void __guc_exec_queue_process_msg_cgp_sync(struct xe_sched_msg *msg)
         * CGP update + CGP_SYNC (re-applies the current priority from
         * q->multi_queue.priority).
         */
-       if (guc_exec_queue_allowed_to_change_state(q))
+       if (guc_exec_queue_allowed_to_change_state(q) && bound)
                guc_exec_queue_send_cgp_sync(q, 0);
 }

@@ -1982,37 +1971,46 @@ static void __guc_exec_queue_process_msg_cgp_sync(struct xe_sched_msg *msg)
 #define OPCODE_MASK    0xf
 #define MSG_LOCKED     BIT(8)
 #define MSG_HEAD       BIT(9)
+#define MSG_PM_REF     BIT(10)

 static void guc_exec_queue_process_msg(struct xe_sched_msg *msg)
 {
        struct xe_device *xe = guc_to_xe(exec_queue_to_guc(msg->private_data));
+       int idx;
+       bool pm_ref = !!(msg->opcode & MSG_PM_REF),
+            bound = drm_dev_enter(&xe->drm, &idx);

        trace_xe_sched_msg_recv(msg);

-       switch (msg->opcode) {
+       switch (msg->opcode & OPCODE_MASK) {
        case CLEANUP:
-               __guc_exec_queue_process_msg_cleanup(msg);
+               __guc_exec_queue_process_msg_cleanup(msg, bound);
                break;
        case SET_SCHED_PROPS:
-               __guc_exec_queue_process_msg_set_sched_props(msg);
+               __guc_exec_queue_process_msg_set_sched_props(msg, bound);
                break;
        case SUSPEND:
-               __guc_exec_queue_process_msg_suspend(msg);
+               __guc_exec_queue_process_msg_suspend(msg, bound);
                break;
        case RESUME:
-               __guc_exec_queue_process_msg_resume(msg);
+               __guc_exec_queue_process_msg_resume(msg, bound);
                break;
        case SET_MULTI_QUEUE_PRIORITY:
-               __guc_exec_queue_process_msg_set_multi_queue_priority(msg);
+               __guc_exec_queue_process_msg_set_multi_queue_priority(msg,
+                                                                     bound);
                break;
        case CGP_SYNC_MSG:
-               __guc_exec_queue_process_msg_cgp_sync(msg);
+               __guc_exec_queue_process_msg_cgp_sync(msg, bound);
                break;
        default:
                XE_WARN_ON("Unknown message type");
        }

-       xe_pm_runtime_put(xe);
+       if (pm_ref)
+               xe_pm_runtime_put(xe);
+
+       if (bound)
+               drm_dev_exit(idx);
 }

 static const struct drm_sched_backend_ops drm_sched_ops = {
@@ -2137,10 +2135,17 @@ static void guc_exec_queue_kill(struct xe_exec_queue *q)
 static void guc_exec_queue_add_msg(struct xe_exec_queue *q, struct xe_sched_msg *msg,
                                   u32 opcode)
 {
-       xe_pm_runtime_get_noresume(guc_to_xe(exec_queue_to_guc(q)));
+       struct xe_guc *guc = exec_queue_to_guc(q);
+       struct xe_device *xe = guc_to_xe(guc);
+       int idx;
+       bool bound = drm_dev_enter(&xe->drm, &idx);

        INIT_LIST_HEAD(&msg->link);
        msg->opcode = opcode & OPCODE_MASK;
+       if (bound) {
+               xe_pm_runtime_get_noresume(guc_to_xe(exec_queue_to_guc(q)));
+               msg->opcode |= MSG_PM_REF;
+       }
        msg->private_data = q;

        trace_xe_sched_msg_add(msg);
@@ -2150,6 +2155,9 @@ static void guc_exec_queue_add_msg(struct xe_exec_queue *q, struct xe_sched_msg
                xe_sched_add_msg_locked(&q->guc->sched, msg);
        else
                xe_sched_add_msg(&q->guc->sched, msg);
+
+       if (bound)
+               drm_dev_exit(idx);
 }

 static void guc_exec_queue_try_add_msg_head(struct xe_exec_queue *q,
@@ -2182,10 +2190,7 @@ static void guc_exec_queue_destroy(struct xe_exec_queue *q)
 {
        struct xe_sched_msg *msg = q->guc->static_msgs + STATIC_MSG_CLEANUP;

-       if (!(q->flags & EXEC_QUEUE_FLAG_PERMANENT) && !exec_queue_wedged(q))
-               guc_exec_queue_add_msg(q, msg, CLEANUP);
-       else
-               __guc_exec_queue_destroy(exec_queue_to_guc(q), q);
+       guc_exec_queue_add_msg(q, msg, CLEANUP);
 }

 static int guc_exec_queue_set_priority(struct xe_exec_queue *q,
@@ -2650,7 +2655,7 @@ static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
        }

        if (do_destroy)
-               __guc_exec_queue_destroy(guc, q);
+               guc_exec_queue_destroy_async(q);
 }

 static int guc_submit_reset_prepare(struct xe_guc *guc)
@@ -3296,7 +3301,7 @@ static void handle_deregister_done(struct xe_guc *guc, struct xe_exec_queue *q)
        trace_xe_exec_queue_deregister_done(q);

        clear_exec_queue_registered(q);
-       __guc_exec_queue_destroy(guc, q);
+       guc_exec_queue_destroy_async(q);
 }

> Sorry a lot of this stuff in xe_guc_submit.c around corner cases /
> teardwons is a mess from early Xe work I did, we should aim to clean
> this up with clear semantics.
> 
> Matt
> 
> > Raag
> > 
> > >  			 "Missing outer runtime PM protection\n");
> > >  	}
> > >  }
> > > -- 
> > > 2.50.1
> > > 
