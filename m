Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28684C55ABF
	for <intel-xe@archiver.kernel.org>; Thu,  6 Aug 2026 09:40:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5AE410E303;
	Thu,  6 Aug 2026 09:40:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z7DtdXCt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DC3210E303
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Aug 2026 09:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786009227; x=1817545227;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=sveuFSPWvKQ1kMa5ZOzVr8Uv3yc5X8VPcxUFrwKJmfU=;
 b=Z7DtdXCt6ES7V0qD5dezFMyOVOj+XCb3CYVlFqT+vTKSwDh4VWm+sZCy
 6XbA7kB3NdU0cqCtfUjW1MG+YT0rZ2ixunHUtG8wxEX3Evfoq/ORhv2z0
 pfgXG7uc3L8LDaDxHGc1HW1DL22yVOaGXDtSbnyE/Zu1osOV3Qz2yMOPg
 9zDL1/EyGBqDqXfd0+Sk7kX065Qs22Uvq/m0hvYhTuImZOZ/euH2Win2M
 ZNaUfrusIk0FzCVL4KiM2f/Sk8q3tqhjufUt8RVxfESv9vJ2Vc+WmRb2V
 g7s8gEJ8P4EKlaYRFE8JYBWR1rI6rtpV2YHqjo3reyZJMlX70NFg8bdIu g==;
X-CSE-ConnectionGUID: z5WUEUl6QeqM9NOLnL8xWw==
X-CSE-MsgGUID: slZNmZ2VRdqFqhnHK344hg==
X-IronPort-AV: E=McAfee;i="6800,10657,11866"; a="104133395"
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; d="scan'208";a="104133395"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2026 02:38:10 -0700
X-CSE-ConnectionGUID: oLdnA6WqR7+aBmwEr/f11A==
X-CSE-MsgGUID: lC4TWqUxSo6f4hLaxCcOaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; d="scan'208";a="291964409"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2026 02:38:11 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 6 Aug 2026 02:38:09 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 6 Aug 2026 02:38:09 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.64) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 6 Aug 2026 02:38:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BAQzxvJKjsKQif1KSb4wuGkX0NEx40I/DCbEPZpqeWp9B9u0VVin9mzJVYxzTeh+DlvQEZpvEDuXT4f20IbRt4VpkNCulxwLuk5jjXAlSwmO4yq722IoudgPCQ5CSBeLN/tVBCXZUIu2DNE5oIRyR2EM9GZo219lmq1DIVDYA3MMHJF+5eXhkbbgT7aGpeL8yYtOlLn5f/H4bFfHrZXd5X43fHBpK0ZFMGRZaWvvlFjMOehFKS7/9HXPiyouEFJoO7WSznnTquVHmxzRRcY/T0OxXWzlJxL2VHeCPuYjh/SOo4dZKOuwW8QI4BYuVMhmaTLvjO6bkka7F6qjI5VNFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GfgLFcascIwWZIzn0JYGR/jsG3eIOl14SLv6u0ZDEKE=;
 b=i9qz7gtnHGEVq8v6y7OROhIunAzPhwd24SHo5mQhOWnmtMwynxdUti4HIClmNQQ9eE8bmHhSrBA+vOmZmyRhPYZA4E3XQvvobC3A6OBuy5MCw6ArVvYkVd+NnDa6jdIUowEHGd4F43vRLB+G1Pjmmef04ujX8GG9n7nm9y3O/hQJdkGOaoc+K4LKWBf+nLQHaIcsL1M9ZZ6Z+j1kHRaT1Lqy3yN5SrTr0IgTNBQPtP8Yh1y8xUE1Qoc2DQ+PDfGyT1qfCLUKjukequfAMGNtTuB56sqk0ajgMFG6et6MbDf/HjoN3+VbsXEuy9k9zWT1hbXwRfpc3ptbpkbcOw3QoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY2PR11MB387948.namprd11.prod.outlook.com (2603:10b6:930:114::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.20; Thu, 6 Aug
 2026 09:38:06 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0292.018; Thu, 6 Aug 2026
 09:38:06 +0000
Date: Thu, 6 Aug 2026 02:38:03 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: Nitin Gote <nitin.r.gote@intel.com>, <intel-xe@lists.freedesktop.org>,
 Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH] drm/xe/pm: do not warn about missing runtime PM
 protection after hot-unplug
Message-ID: <anRV+xVRHWpTEiFh@gsse-cloud1.jf.intel.com>
References: <20260806085711.437110-2-nitin.r.gote@intel.com>
 <anRGHJeae97n3ZwU@black.igk.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <anRGHJeae97n3ZwU@black.igk.intel.com>
X-ClientProxiedBy: MW4P223CA0017.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::22) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY2PR11MB387948:EE_
X-MS-Office365-Filtering-Correlation-Id: ddd20357-4e92-448e-6983-08def39e6b1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|18002099003|22082099003|6133799003|11063799006|56012099006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info: Gjxu+vmSo6ZZOfqLGfKvAhogKplHGREgMPSUjq7TMKdeYlYW3nR1Z1qN0ZbUImsUATD9V7YLZLB3ox3pjya9BUt0M1HmqnemFtTktGZVSruzoXafqakuwRZuXvWomwX7VAAXj2PioeZwWJ5x/3etpOGjadPqDhU2Y/7uDdfp0yW2dp+5bhf7nPdgf0A24Kqi5zMPzoFeFsvA8OG/0TlINBr2xznKUl9mMiCJ+atOjXBGIIwvFv8zsDi8EC6zrxWP733AhOzkYmCcdsS04nF+hjDJSzTcFK6NsWJqWoVJrwvIY/XIn4RD8ixqYaCmirf/Z7ZryMOliZqTT1dUaw7hMJnG/H46tFKVNRxV5rfovobmDkf0olZ/JcypYCUQ/9ei8MGQbfMciW2nfgsVshclUElPC+54bSLRlhpskeugCissytVb3nTsvE6YqUjBtQ/vQ+EX1BvPUz/xTEpvbABM/bC3O5OLZcWCu90O8Qfv++OHAlMtTfpqINpZuu0OpnNQPT84ZwZPxqcGr9svm0ghS92+3rLTNboLdOMV788fV9PWV8db/OARVPhayFHQZGS9Uk46CUX7gfjeL/nckVqsHWbHR5Ek8NeJw+ZMT2BY5TRb+F7GJzmXpmcsn0ka+YXbFvNFasMTs0KhucBtQ8QudlXC7b/evhuHhgU96kEbHjI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(18002099003)(22082099003)(6133799003)(11063799006)(56012099006)(4143699003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QSDJ1UwcEIDvTnYxckPCqFUVvOlrw8zsUF1KvOVsUbwnKMsHsYg3+AQJlJZm?=
 =?us-ascii?Q?hPsSN85hUeKndf+Ayz0S4CDHy17OOz1zFyj1BKD4Afki67Zy1H66RnLyQS7+?=
 =?us-ascii?Q?kMgapmAxABbMEe0bxttCbgbk8hn8DmhDdwcigr//w+g+LcFZwP+pPAZsHr1I?=
 =?us-ascii?Q?LTIm1fg3xASXgyCiLAJTscfQ5/2sypkjfF8Oul7GEuuKBQUEFSqjmtnzJF0f?=
 =?us-ascii?Q?4GmIgxBnXh/Va8S9vHfVu3pge+3te14x6AY77CwiOdhLmyq4EJGcwYOJCv+Q?=
 =?us-ascii?Q?T1CPig+hDJ/fR8bNlaYhByzx8kCW7vauILKbKlZvsCCF5oj375T6BYIH+Q3j?=
 =?us-ascii?Q?9ceM+hl4gY6JmtMX1vpoWPhNcyBJh5f6j7YEhFMPdZyRywH5H9raxXyHcXtc?=
 =?us-ascii?Q?VhMjnYtPDa7um45zMFyozZI4LqekuPd+dCW8FCOKll3pyfoAcZQdcqe3hto1?=
 =?us-ascii?Q?KE5WEkCnfd2qz4OBVaslZ1cIKminz8YyrNHgQaADne9xgVkrwF4o83c+c3qt?=
 =?us-ascii?Q?3yo1Fn83c4o20gfa03qfvErRu8zCaoTiL2Gnt2joZ5fKsSvCRePYUQbK7SiA?=
 =?us-ascii?Q?buGyooapttX0MBUovxWQuqF+QUb98y7zuiTE1lCPdUF8Y2hx172lvsZlGyMY?=
 =?us-ascii?Q?Z4Rh/tF6bQiZdWF/8J2w1wBPnjhhineEDcJUm5645FUoOTF2fGIJhIaumaMG?=
 =?us-ascii?Q?2blSRuMDKB+FlImElgPqwZZqRWTw3G1Sjpj9lkxct8VgU5UA39EguvI/bRn8?=
 =?us-ascii?Q?CV1/7m6kp9jlugW5CKHqGz1HZ9KSWRhMO2T5dGK+Q2Mx2ebfd2jphafX8tYE?=
 =?us-ascii?Q?lV948KzF1Miib8WAl7rA38wjmjq+Bh0OgeJiQvoAIMrUAARZwWy0bSnDI7oQ?=
 =?us-ascii?Q?MUCakrJBwrQeV/kcyRmrCsjOGxCC5P+jDOaaJmi6zKuX2+x/0quOg92iFoHh?=
 =?us-ascii?Q?lGkonH1xBURuUrc6rVIpsf/wJVUW3fR4anTd6PXEwQpmb1SbrX9tN0bhYlo8?=
 =?us-ascii?Q?/hcjsuY8y4yXxW7T6EGCHSsh7SvViOJ9ZtcikndqX8ue6W1HL3LlZc8Q0pxw?=
 =?us-ascii?Q?CV/odU53O//OY430kZ7e/pkhqx/XHC5d9VyDH3mpAKOIsULvBaxm4uc7NAVW?=
 =?us-ascii?Q?pzAsTPXGYl2lri8SRIBBGbCJgwezlS0lgxKgGH3ViEGl6Tzu0jcUEPsjNGGz?=
 =?us-ascii?Q?oLy9XrjvOUoLYOF2q/RZOREJFLVrv2+faczyYwRZREQgm4psTpvXxIfl5D+R?=
 =?us-ascii?Q?3yiOLpkfIXOg4PQxyLFQhOTwpotKiBMgFBHZLX4TIe/bj6nbDOt549aeQaKc?=
 =?us-ascii?Q?G7JuumN+aYG9mWpd9+5E8y35A3NmQw7COp7Z51OiA1FhCO2PKHzwdAzlNX8m?=
 =?us-ascii?Q?0MSvSEKuGQkvwV8o7kP0hf7dPsLTxI3zfGXUKE1Xb7LD0PLGe6sNjVU+BYhK?=
 =?us-ascii?Q?sj054c+qhKNB+E02uBikeQ1dNHBglrTVez5vyR1RN+m99PYxBoSK4BQ9j+bF?=
 =?us-ascii?Q?sNk8CWZ+Z2AOd9QW/d/2BlTNtPkBM2kGJnNT4erLeN/g+kZfQ37XGQlqdPuc?=
 =?us-ascii?Q?qRRq1eVlzCwZ3FnXshsF+2Aav8hNItmQThK3PMke21JeLhRuIQ899Y6805Dy?=
 =?us-ascii?Q?YCz/X5iSpwByZhrqriwOmKESa/ZLEjkKM0FMWNgg7U9hTwHCTL+6Dftnln4L?=
 =?us-ascii?Q?numsygl1vo9neTJclmCdHM1UZA5dKv3+MMxqkQ2fj+Wena2e/b5rl4xe+UGr?=
 =?us-ascii?Q?lRyYtAY+og=3D=3D?=
X-Exchange-RoutingPolicyChecked: efgdOJv2IjgBNZYMkD79uObxjdfIwu+EJqy63nUZjcf3+7PkQQzb+6ETx/1xP5qashJBjmdLbdF0goJEC7Z0wlAsf4ya24IKlltJNy6Qrixp9jVcsUSRgR4oUb1o1pF1iIKK8ysUSZYHhJWmiOoP60aB+5Mw3HLtwUTfVD9vwF8jDFCQveSNq4oxNnjhttlND+aj/hfqEX17ntT1bxQW24G/tH8syTRuzA0Uehfc7q+zQvmfs4idyjpEW3pzV6lbULAcl52nbkR7hlUmMxMCcVnv4xKFL8axnWLNvccW1R6yToVIbM6xNt+iGCKn2sWUvxTsD1bw53tEqiPkViyWxA==
X-MS-Exchange-CrossTenant-Network-Message-Id: ddd20357-4e92-448e-6983-08def39e6b1e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 09:38:06.2267 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0c+71lMDaWvgoP5whAdlIKY/cLZo6lt806uRJpsypse4tM2i7GuTb+KlyJs9rn8MYfQq8pzozeBpnzCsxq690A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY2PR11MB387948
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

On Thu, Aug 06, 2026 at 10:30:20AM +0200, Raag Jadav wrote:
> On Thu, Aug 06, 2026 at 02:27:12PM +0530, Nitin Gote wrote:
> > Exec queues are owned by user fds and are destroyed when the fd is closed.
> > After hot-unplug this can happen from a deferred close during process
> > exit, after the device has been removed and runtime PM has been disabled.
> > The queue destroy path can call xe_pm_runtime_get_noresume(), and since
> > runtime PM is disabled pm_runtime_get_if_in_use() returns no reference,
> > so it warns about "Missing outer runtime PM protection".
> > 
> > This is a false positive for the hot-unplug teardown case. The device is
> > already unplugged, and the queue destroy path that triggered this warning
> > was checked and does not touch hardware state after unplug. GuC has already
> > been sanitized by guc_fini_hw(), so no H2G is sent and the hardware
> > teardown path is no longer reachable.
> > 
> > Skip the warning when the DRM device is already unplugged.
> > 
> > Observed with new IGT core_hotunplug subtests:
> >   igt@core_hotunplug@hotreplug-with-load
> >   igt@core_hotunplug@hotunplug-rescan-with-load
> > 
> > v2:
> >  - Drop the drm_dev_is_unplugged() bypass from guc_exec_queue_destroy()
> >    and instead exclude hot-unplug from the WARN in
> >    xe_pm_runtime_get_noresume(). (Matthew Brost)
> > 

I don't think this was suggestion but also I believe I misunderstood the
problem, but maybe this works.

> > v3:
> >  - Clarify that the queue destroy path was checked and does not touch
> >    hardware state after unplug. (Matthew Auld)
> > 
> > Link: https://patchwork.freedesktop.org/patch/725773/?series=166744&rev=4
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Matthew Auld <matthew.auld@intel.com>
> > Assisted-by: GitHub-Copilot:claude-opus-4.8
> > Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_pm.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> > index a5289a9df8d2..a038687d5b2c 100644
> > --- a/drivers/gpu/drm/xe/xe_pm.c
> > +++ b/drivers/gpu/drm/xe/xe_pm.c
> > @@ -10,6 +10,7 @@
> >  #include <linux/suspend.h>
> >  #include <linux/dmi.h>
> >  
> > +#include <drm/drm_drv.h>
> >  #include <drm/drm_managed.h>
> >  #include <drm/ttm/ttm_placement.h>
> >  
> > @@ -914,7 +915,9 @@ void xe_pm_runtime_get_noresume(struct xe_device *xe)
> 
> From the documentation
> 
>  * This function should be used in inner places where it is surely already
>  * protected by outer-bound callers of `xe_pm_runtime_get`.
>

We should have those.

> >  	if (!ref) {
> >  		pm_runtime_get_noresume(xe->drm.dev);
> > -		drm_WARN(&xe->drm, !xe_pm_suspending_or_resuming(xe),
> > +		drm_WARN(&xe->drm,
> > +			 !drm_dev_is_unplugged(&xe->drm) &&
> > +			 !xe_pm_suspending_or_resuming(xe),
> 
> So IMO this is more of a band-aid.
> 

So if I'm understanding the problem correctly,
pm_runtime_get_if_in_use() (via guc_exec_queue_add_msg()) fails when the
device is unplugged? I don't see how the PM reference count could be
zero, regardless of whether the device is plugged in or unplugged.

My suggestion was (and still is) that guc_exec_queue_destroy() should
always add a message and determine whether the device/firmware is still
alive while processing that message, then either kick the destory or
issue H2G. Other messages likely are also missing proper device alive
checks too.

If, for some reason, obtaining a PM reference via
xe_pm_runtime_get_noresume() doesn't work when the device is unplugged,
then that logic should be handled in the message submission layer. For
example, use drm_dev_enter()/drm_dev_exit() for hot-unplug protection,
only take a PM reference if the device is still bound, encode that
information into the message, and then determine the appropriate next
steps when the message is processed.

Sorry a lot of this stuff in xe_guc_submit.c around corner cases /
teardwons is a mess from early Xe work I did, we should aim to clean
this up with clear semantics.

Matt

> Raag
> 
> >  			 "Missing outer runtime PM protection\n");
> >  	}
> >  }
> > -- 
> > 2.50.1
> > 
