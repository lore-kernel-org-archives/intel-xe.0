Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9396BCD6E7C
	for <intel-xe@archiver.kernel.org>; Fri,  5 Jun 2026 22:15:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F7A211AB84;
	Fri,  5 Jun 2026 22:15:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DQjKEjxX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C106111AB84
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Jun 2026 22:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780697726; x=1812233726;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=E3D36Ug4Quh7SyKkazjLa9DfLgvoU5AoS1IxLVpYI+8=;
 b=DQjKEjxXvNKmRpnspkTIEmwsxXfo9lRW0RN3DiMkYBj532JOEmcdoj0C
 1J1ZEPLCbCWMOmUK4n6hMwcBQDvJa2KpLJ2hStfltb7pExohOtfcO6G2D
 KfxWo2+o9LZ9N0dMCvAVKDPEZFKbjgNBKo0UHvJSuzgGtoYZ/LBf/PKFq
 GBsF9yQmU7DOQ2T26imb146teHiOB0Q6Q5P6F6bPK3/tB0P9GarRuDnoP
 CCP5EHicNGcaINnTWHUPCEeM0O7hXsCOm7yjf19shmuxDwpK6kmQo+nNe
 /4zqnNT8kw5CdHLxx8dKW6Zbm9BNbqNXmiaYz67xCJj5IDO4xTpGKJp8s Q==;
X-CSE-ConnectionGUID: RDxPKb+xS+mr4cAmLkcpiw==
X-CSE-MsgGUID: JRYVcUZdSKiM1JbGIt7wiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11808"; a="85389804"
X-IronPort-AV: E=Sophos;i="6.24,189,1774335600"; d="scan'208";a="85389804"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2026 15:15:25 -0700
X-CSE-ConnectionGUID: J1DSWsrwTF2q9rbwJ/RFDQ==
X-CSE-MsgGUID: wLMcbS/lRuGuqiYR3U1V9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,189,1774335600"; d="scan'208";a="268641102"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2026 15:15:25 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 5 Jun 2026 15:15:24 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 5 Jun 2026 15:15:24 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.65) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 5 Jun 2026 15:15:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qmWdkiCcuZ07HxMrz0u3jNej3L1SGtohkBFP2Abzo1vovm866VBx+iEf3htx56XmUArEtfYb1T/m6lEXXpnkyw98vH5kwaHkqNCELZfvCIdhXAHmdBf1a23GiUHNQ/F7BbsGwgQCcW3klaiNr4l9q/IRkKwJ/IFFj4MBQgrLYhUxQhTWUvIKrhf8O8YWnte92plNnF3bbAJEACZQ5J/DK8cIBG8DRazGry0nuwkTZkiXyjSuhtvRoawqXboe+j9skzcKIsWCZLZ17JyL87TooTuWZ0FCZ7S8Bzec4fGOcK+5yRT57+FW6X3RMr19Orfa0VNHx+Lfm/Ojm+ardaDA0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YpjMskPlETT2XLNy1Na+RiG+acMfwjGgpd1BBVfeX84=;
 b=HaxSRU7jEJfottLokAVeuwMiDAZJgES6Bsp6i2eKazQXduKgnxmz3te3d78Bm+f7+q/M/X+HafN1yT4Ax0xUBcuCcPX6ExPjBU0Evp1lPj7gyol1ghoLb5rXy+pvcf3W9ftU/PkMiKi5BqOw2/V0VB358l4MToT0GbIz0uCODv+Hsr9rq1PTqVESmZBZYpZNB22reGDd+MiX8QM23eRMyKs1SS4iEtJ4ARJWHVwjx0kGpzQ8viSM69HySN8VMIKwY4d+RywRgULclx1mY2FBvZ3b2qmsc8LbhmZR+oxRp4XtYEE0eZhCElZQ8HfWit/p/M1A2VJDAS+NoAie7MxKFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5073.namprd11.prod.outlook.com (2603:10b6:303:92::23)
 by DM4PR11MB6066.namprd11.prod.outlook.com (2603:10b6:8:62::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.9; Fri, 5 Jun 2026
 22:15:21 +0000
Received: from CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe]) by CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe%4]) with mapi id 15.21.0092.006; Fri, 5 Jun 2026
 22:15:21 +0000
Date: Fri, 5 Jun 2026 18:15:13 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Julia Filipchuk <julia.filipchuk@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Daniele Ceraolo Spurio
 <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH 0/3] [drm-xe:topic/xe-for-CI] Use GuC firmware 70.68.0
 for pre-release platforms.
Message-ID: <aiNKcXnMTfOJvrbc@intel.com>
References: <20260604205325.1977872-5-julia.filipchuk@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260604205325.1977872-5-julia.filipchuk@intel.com>
X-ClientProxiedBy: BN9PR03CA0561.namprd03.prod.outlook.com
 (2603:10b6:408:138::26) To CO1PR11MB5073.namprd11.prod.outlook.com
 (2603:10b6:303:92::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5073:EE_|DM4PR11MB6066:EE_
X-MS-Office365-Filtering-Correlation-Id: dc64b2f7-8849-44f2-7d51-08dec34fef04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: ircv2K+a+S+v1RkIKlHyVLg8x/p1RZotxcdJzNpRMa2iMhP0qflPX3RDNp/9BhU5KxGphp6bSX7SxjH8zuA0ObxWciBJlletx8RAlDsp3hQZeAfeZrUlt7EPzisqyvD/LBGDOTFS+ROvR+cjUAxy4wFPgJFloIvP6huJIdbVefd4K6lYABY6IJ/1tgkeV6qm/z8crL3wGM/UGxeJX1Xlz8CqaWznH825KSM0X7KBsgFbjMbgCOh4JOLSaSS5RotNlAxyS/SchgwI+BYbBncya1X4NhCUTIZh3Smf7umGZ70e1yzqCcspwBj1EUh7ADX4xrbE8+wxG6w5979T7NxVEkGGFFBOah2OTDjSc/xSJOKz6OanZx5IBqyhZuJmw/cp3D+U2QWx0x6aspb+fhjW05+e8z9qhFIsARNyaec6PnAM/v61jzDQ52Ko8hlZYghMvZLZK/mvxRYgsq+7t5McUCazHZKlSH8OjVbpPLAZ/6dvWpUKe6UEVHwRF/dd7D5r9fVbpbRyRmy0sfYaovlxM5ID+coef2veLarGHMGm8+CTT/BAS3rtms3X76R9+eJlaV0Z9gAbMWZFQCi77RZVOzy0Q8NSVEYF6+oNXR1rrxaMvnPG7waObFxULsdUbHyl/XCX//HeRyniM8RHYhsQ5LuupEwYB+tderduKp16izupflwQTGQVY+Umspdw6yQ7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5073.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(18002099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YOEShKTZh83yGaihiXKowPbNhfU4KPwrvP5g97MqY2kg6naQ01wTKm7yrmfZ?=
 =?us-ascii?Q?lUx2HkuV42kn5iJVYcyV+VWaaGhJtTFrYDx2iDJjEaiNXl8SEmbTuE5jyoQF?=
 =?us-ascii?Q?sXVE5EypwdGRJk6fcfay95vu+g/+7yFas5YhOjtiN/xshG0kyP5KndrQubjW?=
 =?us-ascii?Q?OZbvF2+b+SRS/YC0YblYEfJVtLfE6YDtAOcoZFigyF+HUyZhAoFknrrkLtWe?=
 =?us-ascii?Q?PzjW3Aa1F6wwyOem2TZ86xYMgeXdzD3A3q4NI8ApsP+XZ+nMfNuYXMPnTwff?=
 =?us-ascii?Q?2cU4N6jch0fGv2cmGOW/sFFbJnwxLGlW9kHfHlSe+kArU59YvVbQkqFzW6nY?=
 =?us-ascii?Q?biyBYoDjy5cxnfO/YNkaanJOZ7mCpIwaw/fWNTP9TtP+PJMKNhNAB/5DvdVp?=
 =?us-ascii?Q?woe0vnTJLpS6GPvu+4VFDyKX1Xfc2aYxL4+Pu2CMQynt9gQ0W8FG3d6OOc0v?=
 =?us-ascii?Q?dQMiybVRQsFfP6Tsjm58gkQNjDMUfNmmM8xLbTJp7rcKijqneeu2EV6UbZID?=
 =?us-ascii?Q?WLLT0Q2x/G597YL5MdkkIIKH1PdrK2imOh3Na6AW1Y+0kRE0m00395G9LHEJ?=
 =?us-ascii?Q?V4s3AjdDRFS0sJdVu98m20AijB+l5rf6V2bm0GUQFBrXL3sS5ymak3himevp?=
 =?us-ascii?Q?c6U58RwgLIoak7nQ+aKlNRPqMtn8XlJM/inlafOLJ73/rjcWPpQePoVK8Sf0?=
 =?us-ascii?Q?FeHmlm5fkjwwzYZRbvVxHlmw2USTW3yepgC1JG1O0rCQdnwNbZON6Z2mn/ii?=
 =?us-ascii?Q?vHhW3QvToQ6i1sYDVRNxBpVw8AtQ7I9irG6J2RHAeRHonbjTpFr4S1DrJ4RX?=
 =?us-ascii?Q?nJHV0apqC4RT/k43M/k+Mb8xq48XNAasn4KkLT1o5U+TYaQmECFMgDLGTakg?=
 =?us-ascii?Q?lIe0DXY5Bf8SN9xD8GHrujRdA6Csy1Kste0WL+x1Oc5l7JfZan5l6stMmKEx?=
 =?us-ascii?Q?KkkW+mD9XB66zg3M7B03s1tcXOfY5yAZgRw+0KUcAkxkC200//GIx1A+AouV?=
 =?us-ascii?Q?SPM5uW0pxpC6mDnltd3+maZwgR09k9M42ulYKU/8tZfZKChdGET0n1U0u8Jn?=
 =?us-ascii?Q?/wO4Ot27EofaCUOv77WkGf2VbKw/OwxQlIaR0zlSeoEidlsGd2GGAzl/N7xe?=
 =?us-ascii?Q?gZzAzWOzvSfH/uh95CBTArmyOJ3WA77IsqRdE6jUN/RFcTeKcNGpugQNtdYR?=
 =?us-ascii?Q?xJ5k+0OLvuq6ub1lVrHToGSEhmBxaWwp92xHDGCgGK80IBOa9R+WyuT4oTzj?=
 =?us-ascii?Q?q94U6oikDhkHnyVmVHH0h2LYFjhdjtpC1K5J4bo5hXtRtr/KnBs1P0Hx1IFB?=
 =?us-ascii?Q?/jCg0Zj0EIhIUj2pSrQuDrA/D92LnK4Kl7MeXsn2v/x+y2WGgggmPX9UXrbj?=
 =?us-ascii?Q?4PkaAv9cTyrWfvwe17jLx25rDySbZOBw88p9cEBX68V9kAOwi9jVOTfkW5rN?=
 =?us-ascii?Q?E3NU3cX137xSoGiG8W1LssAwSCn8bPUUIwuaHbg6qtq2lr2wAjjDlWTVxoT8?=
 =?us-ascii?Q?j4Wl8yS3J6efzRqDTe7vTRJcO1G//PrvdgavIL0pSBEZUNX9llVd0lmJ/rbi?=
 =?us-ascii?Q?PZiorsaqCtLmCJjEmZJWgsjKKxBWtopmnlSSAYCmLqtDMrbYr0IJOyZ+6Oz2?=
 =?us-ascii?Q?X7WSXiQOvlFZ3OQA8MH9eQZVqeWcIE3uAVfxhSqgcCZTN9oFEUZXqUb8hl4F?=
 =?us-ascii?Q?4nuqqcsLPqR7pRZaJtY7M0PWOkm7A2meBgcBUrdCLlhqql0SN0R0RhqOD7Su?=
 =?us-ascii?Q?3IHxN+JlU6f0SkPy3Jz6ENUy3TvBtrE=3D?=
X-Exchange-RoutingPolicyChecked: Im1yitjNCJWMIT9aKPYUf39CAEnDUDFL7xJRhIumGVJ3ksNksXEVPXt9B6sZLq3W5rP6MmujaaPU5IDXUB/dyfziVYPMmKOxxVIiQoxTzTu+uwOeFDvVlRbYbYvHJLILx0o/bWGUuqUoHvwwubCGcBTjB2KNYPbpS2qD/DTqZM9GGiBuc4+tH7nkRNtpi3cuMoyLT0oAahLLXDy9Kamk5AJVdkQ+pjbcO/TbLJV+vMpOc3MDbmeMEDSbnpEmIwTpgq6P6XLIH9YLqThBkBOkaA282s722QQrWgc7RE8XMoKWTt/sxT3KpjCf7M1yrTJg5ZDKKxxvoI9YE2ygPdpkHQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: dc64b2f7-8849-44f2-7d51-08dec34fef04
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5073.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 22:15:21.7534 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GBuv4d6IZS7ltKdL6QfmVLE064r3n5NiaSONvYKw1FzHvzlK0UrvNUO07qrNaTWSwl8DHXjMuN6mW3M9rskLOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6066
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

On Thu, Jun 04, 2026 at 01:51:35PM -0700, Julia Filipchuk wrote:
> Use GuC version 70.68.0 for NVL-S, CRI, NVL-P.
> 
> Patches are intended to be merged into drm-xe:/topic/xe-for-CI branch.

Pushed, thanks for the updates.

for the record, the other approach with the revert + new patch is easier.

So the maintainer can just:

$ b4 <header>
$ git rebase -i <somehash>
# Remove original patches and revert
$ dim push -f

The fixup flow is something like:

$ b4 <header>
$ git rebase -i --autosquash <somehash>
# Fix each patch conflict;

# For each patch:
$ git rebase --continue

$ dim push

For me it was simple because I use a git-truce wiggle based script to deal
with conflicts and easy obvious conflicts like that it is just to

$ b4 <header>
$ git rebase -i --autosquash <somehash>

# For each patch:
$ git-truce
$ git rebase --continue

$ dim push

But as I told, just for the record. It was easy to me.
Thanks for doing the hardest part and the diligence with the validation and all!

Thanks,
Rodrigo.

> 
> Platforms NVL-S, CRI, NVL-P are not merged to upstream at present. The
> GuC definitions for those only exist in the for-ci topic branch
> drm-xe:topic/xe-for-ci. This patch set provides fixup commits to bump
> the versions.
> 
> Julia INTEL (3):
>   fixup! topic/xe-for-CI: Define GuC firmware for NVL-S
>   fixup! topic/for-xe-CI: drm/xe/cri: Define GuC firmware for CRI
>   fixup! topic/xe-for-CI: Define GuC firmware for NVL-P
> 
>  drivers/gpu/drm/xe/xe_uc_fw.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> -- 
> 2.51.0
> 
