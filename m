Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C12501099B2D
	for <intel-xe@archiver.kernel.org>; Fri, 20 Mar 2026 17:56:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E3F910EA74;
	Fri, 20 Mar 2026 17:56:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R4ZIXSJd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BB3510EA21
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Mar 2026 17:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774029393; x=1805565393;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=kUARNtQ9xpWQqbhTqDHGTDhIE7zf+gC6e6vSIVOs898=;
 b=R4ZIXSJdJCDRBcLRShdUUpJN9Nw+Za5w8GTRtuaYafBXEo/rwM4f/wtb
 nlPHcRmGn0u3McGtFxOiXEIAFNuc0KQrKaTP+fEgofFr9yqTKILZ7NymH
 52eGrObb4tCiATT1gCK9hqY462m9QLI9R7QOIFybfxQiAZ2aR6YD4wHei
 HKcG7WC/IyWXHnVdgUgYsYkNTpeDF+kye/TRrAJedYW+MGYiS71ZI8iry
 Eah6zCfZPF5fbAUpFYEfQQ934zeSqZO06ukTd0znz4aFNzeYo9Qyiz2dX
 NWQ3+ra14831JLT5F8uwaSD5T0dEk2DLcnlxQd4cEpJvsEQmGoxdYjDBm w==;
X-CSE-ConnectionGUID: qws0mgamT8KMa5A+hOceig==
X-CSE-MsgGUID: 3uMWv8G5Q72VJtx2Wtw2mQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11735"; a="79026470"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="79026470"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 10:56:33 -0700
X-CSE-ConnectionGUID: zJmVb015Qu6B3DeRaATS5w==
X-CSE-MsgGUID: pTMaFDqEQMCe2y+ufKSIzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="223384653"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 10:56:33 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 20 Mar 2026 10:56:32 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 20 Mar 2026 10:56:32 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.21) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 20 Mar 2026 10:56:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K3nTqxGDDx6YlcfwWdwiNJwr3gj95Mtj81fEmGWIh94o//PsThTG50dnjp1v3nhnUdaGBknSy753kCK7IYV8G6asmxm9Uulcv03VgCbVS9XPMhgj8wozG9mxsnMn/o5tD0g58aiA3UuWKKf1ZSt2awVZQN3grZmUPloH/0WQNenbTSuQktqV0/0nedEu7FXF7o0oxWnZay3YFhGcvX3GyWqa/UkjUYS+KdHyc617JzW++Hh/XFnmoVxNFrqxn5nyBSr0Sd8aMd34VOkOjM02yu1i5c448Fm6Kz/0ErKBXFppgQFyoKwnbVh/FlBoI1l8KVURevuqijfFU8I7W2Qyhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w6u6+DnLeCOMilVeC9k3kLisgLuuHbCknuwK4MVWAok=;
 b=Fs78iB28ZW9je4qcQ8wiLomHQyygiPYc3daXc+usS2W790CBdYRm4KGUgU5lC0lhO0R9psgDPIBzmAP/WhIxkL9ToPhFg/eyDiFIch2mtQHIG9ERsHNq0MX/Z4i4WazyOjPQEOyauJLV/vPQ1VImU3NmtMgj57Ij0ccqY962hVI3yXcgGHUH1a7Il6oJPtNaICBEIRULSFHJFUkUc3Xcx2w4xIQ19Utf27tC9+cYffB4kOwTTLizQjsL1KAXFbLyVJGdqpBDMM3dF3fOHIWJI9xkfU0uxUjUEehnxSzrw0FP1lScJKCFu2R214yFNL7vsRXIPeueH6Nq1EwGJIzNXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by IA3PR11MB9205.namprd11.prod.outlook.com (2603:10b6:208:573::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.9; Fri, 20 Mar
 2026 17:56:29 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9745.007; Fri, 20 Mar 2026
 17:56:29 +0000
Date: Fri, 20 Mar 2026 10:56:26 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Nathan Chancellor <nathan@kernel.org>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZVTEw6IGZhaWx1?= =?utf-8?Q?re_fo?=
 =?utf-8?Q?r?= drm/xe: Fix format specifier for printing pointer differences
Message-ID: <20260320175626.GJ2729713@mdroper-desk1.amr.corp.intel.com>
References: <20260316-drm-xe-fix-32-bit-wformat-ptrdiff-v1-1-0108b10b2b6b@kernel.org>
 <177380064519.369304.2880527381409370279@a3b018990fe9>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <177380064519.369304.2880527381409370279@a3b018990fe9>
X-ClientProxiedBy: SJ0PR03CA0196.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::21) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|IA3PR11MB9205:EE_
X-MS-Office365-Filtering-Correlation-Id: c0d08040-045f-409e-7173-08de86aa0333
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: 1cMWRd1phJWd+/4g0WAAKqaKnLFmYft1Hra2pz76uDyRMI7Z/WHohBV16TmNOYxLcqizXX8eTqgS4aOs+tLYKCLeLoR+PvPUyMLCLofpZGcLziOWm6+Qt6sR709Isow7xybt/f5PqpyVnSPezLdXB7QcDqoqtbVBlB5NLiflSaNYlRvePsftUbtuRaP8850yCFsbGOZN7zuwQ4fHtxzR/eSfdUxdm80qtixwp6XNuQLPhei/06dIcwKPQCvyM7Dtd3k9s+JqwTwwixCimVNl6/InTjJX4eESRJtbaqplVY3AlAcJwr7BDEzBO+ZcDLCbcHkzdnlL0AH+WUwqSc8G7jqLDtUhHfsSoeUasU6U4XeEZcmHijCA0eJl4J6JBPFo6lBq6966uh2D4Vn+o3ZUg1Uw6UNBjIEr9o/q8tNbudl5JvNcnij8hZIRcqxVVHIJJhBqBfi0dxOnrEbbmaooMo1NoagHkdU+tGwBLDF/rBnOTzJqw6j4pghtHKZ4/5dSMbWVxTCKEw+h01rfqQyUEezcwUgUUyOji4Tj+G2XHAhskyFFEYmx7KCftvO3PSSNb0zvLQGte1f0vnv+oXeHe9FPF7+8/5Tp1h5pjZ1E/8JVtgQu5WRpUbGL/94+Z07X2SvhllMq52E6RLNVnaP8xWbRx+G9m7d1mLf7K+jQpiM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Hf9i836jSp1t3kCrb3dMFi91if63BZlHU8FHbqeJuWl2nbnV3PaZTTukkE3m?=
 =?us-ascii?Q?p3ri8HTWQZ+yMB6jk8BLGk1EzikWgP/II187C+iNet28IAT45OeeRT4U+Cb7?=
 =?us-ascii?Q?l3qluFnEnMsOM3rDvdws5hNBZh+c9elFBjUSN513W0iqdEPJetsisGtEXBEb?=
 =?us-ascii?Q?2ipDcyI/Tm49DNeL9KMoAuLFdQsMJTyGJ7LKzTCCV7VIqUmr8M2SVTyBaPw0?=
 =?us-ascii?Q?7EzaaTdO3ROxOAaUzGJ18kdvFuHyUOh/nlnl7vFOwR801eD/UbIIy11WMlW3?=
 =?us-ascii?Q?TaIOdNsREUw34WgiO8L9Hvc+3e2KFuSBFyuKcgi94vTha81foraItttIfNiH?=
 =?us-ascii?Q?ErFrPF47Qy9OFdY0U9Qav8S8f08rsMnBq1xYt6Scux0ZOLqE75RGOVm9BpVD?=
 =?us-ascii?Q?CItdgXUkI1M7SlXEb6Txmo3qlGAev0E1h4LZOMImH774vaFZw4sni0JY7gMy?=
 =?us-ascii?Q?mMvpdCO2Lcnv8I3pe/gC6EElIw4piISfW3U4KF4W8A6d82WoyWSiodxhBsJg?=
 =?us-ascii?Q?zkOTU6X/cayDJvYG4MuujtvH0GSfaXoHyVuwO8hoj/VhigfH7ehv7jHGeAKm?=
 =?us-ascii?Q?96gGG5kQcyg2DY8tV7pQQnd3yc8yjRDqv1MSmhXa0tZ8ZApuvfxOYt0dMbdK?=
 =?us-ascii?Q?igeiTqrqwBjt3eifmz5yvsOzrD5NibydJZ/DDnjNUeXIS9Y94mHysuJsEbSs?=
 =?us-ascii?Q?IW67X9xdn+I0iqNEKTZdNtw2QXKVYkTlSywqbkibmsFEToAieT67JdwFbebz?=
 =?us-ascii?Q?icPz+ZJWL0Ds7o2qiyLjvGOlL+kY2BS32CXBbfW1rmPhHCGCrruKZ1TdpJNY?=
 =?us-ascii?Q?qNSaIoThAvHftGZzpS7I7ExijLGcoEfj7/LV3nr8Oe1LY7zxZ4m87w6hBk08?=
 =?us-ascii?Q?8w4yAHEIwsZQioEO85m9sQ8LcjSNYF+/x7YxEHlQ3CZ9zhOfKjVj8+/PxvI5?=
 =?us-ascii?Q?urNpb4vsr7z/AaQLcDqZAzTOcMcCuHXf57pOnXqtfm8tHJ/ilL0we3Ahpp0F?=
 =?us-ascii?Q?5ceRy7Bjr60Nj9wsEEIS93nwutLivbbQBfDzH77Ep9ZrS2ulLHdx6s1Psjo4?=
 =?us-ascii?Q?5ZbQsRLll2/h/I6PFDk3MgvBUKPcx4OBMHIQJ0sBtlBKM6y/TW6udeAJy2H8?=
 =?us-ascii?Q?DVDukJos89RHGYTcy55xfuDotviroF/WDq7wUOBueOmyVT+mwdWH0Lj9L7XG?=
 =?us-ascii?Q?TlViW+yxWGFiBOGij6ZPQaDKjgoYZr7oYhWE77L6KAFS4ciYOjynggIiUxZA?=
 =?us-ascii?Q?S34EDdK6wDqlnVJgWVjX0sLDlkt2bgPVRGNIFaGSlFmbgx97lruc2f4n69Es?=
 =?us-ascii?Q?mRr1XHLuDz+X2bDNkj66UidDO4iTihrbORMyxG8G7JVOAGTgAAEFvDRSNpkW?=
 =?us-ascii?Q?34U4Q5QrLtm/LBmKKP9Wr8KIa4l3Gx3mHkSEVoKq06yv3r3/lSMz44xSkWjj?=
 =?us-ascii?Q?OuIMHwGX7GA2QxYLlkdiTh67VmWqLgIxAzCzv9RjlDFLeufAA3C+YmvTIW/G?=
 =?us-ascii?Q?ICjVLnhzzTRwdVAYR5+tWmXxWYnAl1BprSmGtCrpKhwJw9w3suFXQY9bXEe/?=
 =?us-ascii?Q?QA/e/WxiFg8CLSoNE1vy6AGqgVtrRiQ3gN9hQs5CAIGgYgdLG4lU9nfTGmhZ?=
 =?us-ascii?Q?ZkVunQDg6EvR2esl4zcd6bYK3Fe4hDiWrBJcX9JUo80/0ZMPwJByPMrDiia9?=
 =?us-ascii?Q?XgsT7gS4M+gRlcQfZ8SfLRfO9tOqNj0x5w6IqFedCgv33rOlgkEye3AOukl7?=
 =?us-ascii?Q?6RaQu2wAg40Tl1zHE1dvt/lERZ6rfV4=3D?=
X-Exchange-RoutingPolicyChecked: wKftr0fqwv9o0eCSqlNE8UX7OBYCFeKZ68kqgUKFCkpK6a/wVY+WbGsnU33vit7/pG7lum8TYrYgXhsVxZRCnITEzzJR4HHeH85CdAPmGfhiEux/n+F+JXyQ1bywir2yVRZtxkT8yMP+Pnw/1sXaGLRZDQNTKP3IWRN+epuQILia2THe/Q92UXQADyjxGjnZRSmbzqo7tWVDgro5BeGSMLmJJDwCngIzjNXG7+fI8cFE7Py+tZkE74DLV96h3cHkqQiyaNqwS1fO0jPVoPOFNwLRbR6tCYELJbQ1YgyThS9r7Q4VcjqSx1DqbE7OmG4pug6ywYm87sSWNkSoemfJXw==
X-MS-Exchange-CrossTenant-Network-Message-Id: c0d08040-045f-409e-7173-08de86aa0333
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2026 17:56:29.2603 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /f6bLANo+/IdzZP3UjWgW2lGSRaT411wEJ1mF5uS8W+K5Zl0EhJsJURrwNkxU8wMjLfqEk8/YnWMOjECWqV+fUSzCMMKwjPOmF+8WuS5TgY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9205
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

On Wed, Mar 18, 2026 at 02:24:05AM -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe: Fix format specifier for printing pointer differences
> URL   : https://patchwork.freedesktop.org/series/163323/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-4731-a25d8c583e1e52bde77d371081a7c3fcd0a2e820_FULL -> xe-pw-163323v1_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **WARNING**
> 
>   Minor unknown changes coming with xe-pw-163323v1_FULL need to be verified
>   manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-163323v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (2 -> 2)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in xe-pw-163323v1_FULL:
> 
> ### IGT changes ###
> 
> #### Warnings ####
> 
>   * igt@kms_vrr@lobf@pipe-a-edp-1:
>     - shard-lnl:          [FAIL][1] ([Intel XE#6390] / [Intel XE#7461]) -> [SKIP][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4731-a25d8c583e1e52bde77d371081a7c3fcd0a2e820/shard-lnl-3/igt@kms_vrr@lobf@pipe-a-edp-1.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-lnl-4/igt@kms_vrr@lobf@pipe-a-edp-1.html
> 
>   * igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add:
>     - shard-bmg:          [SKIP][3] ([Intel XE#6281] / [Intel XE#7426]) -> [ABORT][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4731-a25d8c583e1e52bde77d371081a7c3fcd0a2e820/shard-bmg-10/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-bmg-2/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html

Neither of these are related to the patch here.  Applied to drm-xe-next.
Thanks for the patch.


Matt

> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-163323v1_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
>     - shard-bmg:          [PASS][5] -> [ABORT][6] ([Intel XE#1727] / [Intel XE#6652])
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4731-a25d8c583e1e52bde77d371081a7c3fcd0a2e820/shard-bmg-8/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-bmg-3/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html
> 
>   * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@1x-outputs:
>     - shard-bmg:          [PASS][7] -> [ABORT][8] ([Intel XE#1727])
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4731-a25d8c583e1e52bde77d371081a7c3fcd0a2e820/shard-bmg-8/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@1x-outputs.html
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-bmg-3/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@1x-outputs.html
> 
>   * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@2x-outputs:
>     - shard-bmg:          [PASS][9] -> [INCOMPLETE][10] ([Intel XE#6652])
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4731-a25d8c583e1e52bde77d371081a7c3fcd0a2e820/shard-bmg-8/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@2x-outputs.html
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-bmg-3/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@2x-outputs.html
> 
>   * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:
>     - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#7059] / [Intel XE#7085])
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-bmg-4/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180:
>     - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#1124]) +3 other tests skip
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-bmg-7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html
>     - shard-lnl:          NOTRUN -> [SKIP][13] ([Intel XE#1124])
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-lnl-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
>     - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#607] / [Intel XE#7361])
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-bmg-4/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
> 
>   * igt@kms_bw@linear-tiling-1-displays-3840x2160p:
>     - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#367] / [Intel XE#7354])
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-bmg-9/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
>     - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#2887]) +4 other tests skip
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-bmg-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html
>     - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#2887])
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-lnl-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-a-hdmi-a-3:
>     - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#2652]) +15 other tests skip
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-bmg-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-a-hdmi-a-3.html
> 
>   * igt@kms_cdclk@mode-transition-all-outputs:
>     - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#2724] / [Intel XE#7449])
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-bmg-8/igt@kms_cdclk@mode-transition-all-outputs.html
> 
>   * igt@kms_chamelium_color@ctm-0-25:
>     - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#2325] / [Intel XE#7358])
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-bmg-6/igt@kms_chamelium_color@ctm-0-25.html
>     - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#306] / [Intel XE#7358])
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-lnl-6/igt@kms_chamelium_color@ctm-0-25.html
> 
>   * igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
>     - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#2252]) +2 other tests skip
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-bmg-10/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd:
>     - shard-lnl:          NOTRUN -> [SKIP][23] ([Intel XE#373]) +1 other test skip
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-lnl-8/igt@kms_chamelium_hpd@hdmi-hpd.html
> 
>   * igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2:
>     - shard-bmg:          NOTRUN -> [FAIL][24] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +2 other tests fail
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-bmg-2/igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-64x21:
>     - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#2320])
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-bmg-9/igt@kms_cursor_crc@cursor-onscreen-64x21.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions:
>     - shard-bmg:          [PASS][26] -> [SKIP][27] ([Intel XE#2291]) +2 other tests skip
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4731-a25d8c583e1e52bde77d371081a7c3fcd0a2e820/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.html
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-bmg-5/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
>     - shard-bmg:          [PASS][28] -> [SKIP][29] ([Intel XE#2291] / [Intel XE#7343]) +1 other test skip
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4731-a25d8c583e1e52bde77d371081a7c3fcd0a2e820/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
>     - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#2286] / [Intel XE#6035])
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-bmg-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
> 
>   * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
>     - shard-bmg:          [PASS][31] -> [SKIP][32] ([Intel XE#2316]) +7 other tests skip
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4731-a25d8c583e1e52bde77d371081a7c3fcd0a2e820/shard-bmg-8/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html
> 
>   * igt@kms_flip@2x-flip-vs-panning-vs-hang:
>     - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#2316])
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-panning-vs-hang.html
> 
>   * igt@kms_flip@2x-plain-flip-ts-check:
>     - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#1421])
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-lnl-8/igt@kms_flip@2x-plain-flip-ts-check.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
>     - shard-lnl:          [PASS][35] -> [FAIL][36] ([Intel XE#301] / [Intel XE#3149]) +1 other test fail
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4731-a25d8c583e1e52bde77d371081a7c3fcd0a2e820/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling:
>     - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#1397] / [Intel XE#1745] / [Intel XE#7385])
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pipe-a-default-mode:
>     - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#1397] / [Intel XE#7385])
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pipe-a-default-mode.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#2312]) +3 other tests skip
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
>     - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#2311]) +9 other tests skip
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#4141]) +3 other tests skip
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:
>     - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#656]) +2 other tests skip
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-plflip-blt:
>     - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#6312] / [Intel XE#651]) +1 other test skip
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc:
>     - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#2313]) +10 other tests skip
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
>     - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#2352] / [Intel XE#7399])
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
> 
>   * igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc:
>     - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#7061] / [Intel XE#7356])
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc.html
>     - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#7061] / [Intel XE#7356])
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-lnl-8/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc.html
> 
>   * igt@kms_hdr@invalid-hdr:
>     - shard-bmg:          [PASS][48] -> [SKIP][49] ([Intel XE#1503]) +1 other test skip
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4731-a25d8c583e1e52bde77d371081a7c3fcd0a2e820/shard-bmg-7/igt@kms_hdr@invalid-hdr.html
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-bmg-10/igt@kms_hdr@invalid-hdr.html
> 
>   * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier:
>     - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#7283]) +2 other tests skip
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-bmg-7/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier.html
> 
>   * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier:
>     - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#7283])
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-lnl-8/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c:
>     - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#2763] / [Intel XE#6886]) +4 other tests skip
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-bmg-2/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c.html
> 
>   * igt@kms_pm_dc@dc5-psr:
>     - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#2392] / [Intel XE#6927])
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-bmg-4/igt@kms_pm_dc@dc5-psr.html
> 
>   * igt@kms_pm_rpm@dpms-lpsp:
>     - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383] / [Intel XE#836])
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-bmg-10/igt@kms_pm_rpm@dpms-lpsp.html
> 
>   * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:
>     - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#1489]) +1 other test skip
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-bmg-4/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html
> 
>   * igt@kms_psr2_su@page_flip-nv12:
>     - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#1128] / [Intel XE#7413])
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-lnl-4/igt@kms_psr2_su@page_flip-nv12.html
>     - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#2387] / [Intel XE#7429])
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-bmg-4/igt@kms_psr2_su@page_flip-nv12.html
> 
>   * igt@kms_psr@psr2-basic:
>     - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#2234] / [Intel XE#2850]) +2 other tests skip
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-bmg-8/igt@kms_psr@psr2-basic.html
> 
>   * igt@kms_setmode@basic:
>     - shard-bmg:          [PASS][59] -> [FAIL][60] ([Intel XE#6361]) +2 other tests fail
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4731-a25d8c583e1e52bde77d371081a7c3fcd0a2e820/shard-bmg-7/igt@kms_setmode@basic.html
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-bmg-8/igt@kms_setmode@basic.html
> 
>   * igt@kms_setmode@basic@pipe-a-edp-1:
>     - shard-lnl:          [PASS][61] -> [FAIL][62] ([Intel XE#6361]) +1 other test fail
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4731-a25d8c583e1e52bde77d371081a7c3fcd0a2e820/shard-lnl-4/igt@kms_setmode@basic@pipe-a-edp-1.html
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-lnl-6/igt@kms_setmode@basic@pipe-a-edp-1.html
> 
>   * igt@kms_sharpness_filter@filter-basic:
>     - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#6503]) +1 other test skip
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-bmg-9/igt@kms_sharpness_filter@filter-basic.html
> 
>   * igt@kms_vrr@cmrr@pipe-a-edp-1:
>     - shard-lnl:          [PASS][64] -> [FAIL][65] ([Intel XE#4459]) +1 other test fail
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4731-a25d8c583e1e52bde77d371081a7c3fcd0a2e820/shard-lnl-2/igt@kms_vrr@cmrr@pipe-a-edp-1.html
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-lnl-1/igt@kms_vrr@cmrr@pipe-a-edp-1.html
> 
>   * igt@kms_vrr@flipline:
>     - shard-lnl:          [PASS][66] -> [FAIL][67] ([Intel XE#4227] / [Intel XE#7397]) +1 other test fail
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4731-a25d8c583e1e52bde77d371081a7c3fcd0a2e820/shard-lnl-4/igt@kms_vrr@flipline.html
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-lnl-8/igt@kms_vrr@flipline.html
> 
>   * igt@kms_vrr@negative-basic:
>     - shard-bmg:          [PASS][68] -> [SKIP][69] ([Intel XE#1499])
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4731-a25d8c583e1e52bde77d371081a7c3fcd0a2e820/shard-bmg-2/igt@kms_vrr@negative-basic.html
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-bmg-5/igt@kms_vrr@negative-basic.html
> 
>   * igt@xe_eudebug@basic-vm-access-parameters:
>     - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#4837]) +2 other tests skip
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-bmg-5/igt@xe_eudebug@basic-vm-access-parameters.html
> 
>   * igt@xe_eudebug@multiple-sessions:
>     - shard-lnl:          NOTRUN -> [SKIP][71] ([Intel XE#4837])
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-lnl-3/igt@xe_eudebug@multiple-sessions.html
> 
>   * igt@xe_eudebug_online@set-breakpoint-faultable:
>     - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#4837] / [Intel XE#6665]) +1 other test skip
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-bmg-10/igt@xe_eudebug_online@set-breakpoint-faultable.html
> 
>   * igt@xe_evict@evict-beng-cm-threads-small-multi-vm:
>     - shard-lnl:          NOTRUN -> [SKIP][73] ([Intel XE#6540] / [Intel XE#688]) +1 other test skip
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-lnl-7/igt@xe_evict@evict-beng-cm-threads-small-multi-vm.html
> 
>   * igt@xe_evict@evict-cm-threads-small-multi-queue:
>     - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#7140])
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-bmg-2/igt@xe_evict@evict-cm-threads-small-multi-queue.html
> 
>   * igt@xe_exec_balancer@once-cm-parallel-userptr-rebind:
>     - shard-lnl:          NOTRUN -> [SKIP][75] ([Intel XE#7482])
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-lnl-1/igt@xe_exec_balancer@once-cm-parallel-userptr-rebind.html
> 
>   * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:
>     - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#2322] / [Intel XE#7372]) +2 other tests skip
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-bmg-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html
> 
>   * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race:
>     - shard-lnl:          NOTRUN -> [SKIP][77] ([Intel XE#1392])
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-lnl-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html
> 
>   * igt@xe_exec_fault_mode@once-multi-queue-userptr-rebind-prefetch:
>     - shard-lnl:          NOTRUN -> [SKIP][78] ([Intel XE#7136]) +1 other test skip
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-lnl-3/igt@xe_exec_fault_mode@once-multi-queue-userptr-rebind-prefetch.html
> 
>   * igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind-prefetch:
>     - shard-bmg:          NOTRUN -> [SKIP][79] ([Intel XE#7136]) +4 other tests skip
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-bmg-5/igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind-prefetch.html
> 
>   * igt@xe_exec_multi_queue@exec-sanity:
>     - shard-lnl:          NOTRUN -> [SKIP][80] ([Intel XE#6874]) +3 other tests skip
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-lnl-7/igt@xe_exec_multi_queue@exec-sanity.html
> 
>   * igt@xe_exec_multi_queue@two-queues-priority:
>     - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#6874]) +15 other tests skip
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-bmg-6/igt@xe_exec_multi_queue@two-queues-priority.html
> 
>   * igt@xe_exec_threads@threads-multi-queue-fd-userptr-invalidate-race:
>     - shard-bmg:          NOTRUN -> [SKIP][82] ([Intel XE#7138]) +3 other tests skip
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-bmg-6/igt@xe_exec_threads@threads-multi-queue-fd-userptr-invalidate-race.html
> 
>   * igt@xe_exec_threads@threads-multi-queue-shared-vm-userptr-rebind:
>     - shard-lnl:          NOTRUN -> [SKIP][83] ([Intel XE#7138])
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-lnl-8/igt@xe_exec_threads@threads-multi-queue-shared-vm-userptr-rebind.html
> 
>   * igt@xe_multigpu_svm@mgpu-atomic-op-prefetch:
>     - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#6964])
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-bmg-9/igt@xe_multigpu_svm@mgpu-atomic-op-prefetch.html
>     - shard-lnl:          NOTRUN -> [SKIP][85] ([Intel XE#6964])
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-lnl-7/igt@xe_multigpu_svm@mgpu-atomic-op-prefetch.html
> 
>   * igt@xe_prefetch_fault@prefetch-fault:
>     - shard-bmg:          NOTRUN -> [SKIP][86] ([Intel XE#7596])
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-bmg-7/igt@xe_prefetch_fault@prefetch-fault.html
> 
>   * igt@xe_query@multigpu-query-engines:
>     - shard-bmg:          NOTRUN -> [SKIP][87] ([Intel XE#944])
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-bmg-8/igt@xe_query@multigpu-query-engines.html
> 
>   * igt@xe_sriov_admin@bulk-preempt-timeout-vfs-disabled:
>     - shard-lnl:          NOTRUN -> [SKIP][88] ([Intel XE#7174])
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-lnl-1/igt@xe_sriov_admin@bulk-preempt-timeout-vfs-disabled.html
> 
>   * igt@xe_sriov_flr@flr-each-isolation:
>     - shard-bmg:          [PASS][89] -> [FAIL][90] ([Intel XE#6569])
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4731-a25d8c583e1e52bde77d371081a7c3fcd0a2e820/shard-bmg-5/igt@xe_sriov_flr@flr-each-isolation.html
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-bmg-7/igt@xe_sriov_flr@flr-each-isolation.html
> 
>   * igt@xe_survivability@i2c-functionality:
>     - shard-lnl:          NOTRUN -> [SKIP][91] ([Intel XE#6529] / [Intel XE#7331] / [Intel XE#7388])
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-lnl-1/igt@xe_survivability@i2c-functionality.html
> 
>   * igt@xe_vm@out-of-memory:
>     - shard-lnl:          NOTRUN -> [SKIP][92] ([Intel XE#5745])
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-lnl-6/igt@xe_vm@out-of-memory.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@core_setmaster@master-drop-set-root:
>     - shard-bmg:          [FAIL][93] -> [PASS][94]
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4731-a25d8c583e1e52bde77d371081a7c3fcd0a2e820/shard-bmg-2/igt@core_setmaster@master-drop-set-root.html
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-bmg-4/igt@core_setmaster@master-drop-set-root.html
> 
>   * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
>     - shard-bmg:          [SKIP][95] ([Intel XE#2314] / [Intel XE#2894] / [Intel XE#7373]) -> [PASS][96]
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4731-a25d8c583e1e52bde77d371081a7c3fcd0a2e820/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
> 
>   * igt@kms_cursor_crc@cursor-suspend:
>     - shard-bmg:          [INCOMPLETE][97] -> [PASS][98]
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4731-a25d8c583e1e52bde77d371081a7c3fcd0a2e820/shard-bmg-5/igt@kms_cursor_crc@cursor-suspend.html
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-bmg-8/igt@kms_cursor_crc@cursor-suspend.html
> 
>   * igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
>     - shard-bmg:          [SKIP][99] ([Intel XE#2291]) -> [PASS][100] +2 other tests pass
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4731-a25d8c583e1e52bde77d371081a7c3fcd0a2e820/shard-bmg-5/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-bmg-3/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
>     - shard-bmg:          [SKIP][101] ([Intel XE#2291] / [Intel XE#7343]) -> [PASS][102]
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4731-a25d8c583e1e52bde77d371081a7c3fcd0a2e820/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-bmg-10/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
> 
>   * igt@kms_flip@2x-flip-vs-panning:
>     - shard-bmg:          [SKIP][103] ([Intel XE#2316]) -> [PASS][104] +2 other tests pass
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4731-a25d8c583e1e52bde77d371081a7c3fcd0a2e820/shard-bmg-5/igt@kms_flip@2x-flip-vs-panning.html
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-bmg-4/igt@kms_flip@2x-flip-vs-panning.html
> 
>   * igt@kms_flip@2x-flip-vs-suspend:
>     - shard-bmg:          [INCOMPLETE][105] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][106] +1 other test pass
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4731-a25d8c583e1e52bde77d371081a7c3fcd0a2e820/shard-bmg-6/igt@kms_flip@2x-flip-vs-suspend.html
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-bmg-8/igt@kms_flip@2x-flip-vs-suspend.html
> 
>   * igt@kms_flip@2x-flip-vs-wf_vblank:
>     - shard-bmg:          [SKIP][107] ([Intel XE#6557] / [Intel XE#6703]) -> [PASS][108] +2 other tests pass
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4731-a25d8c583e1e52bde77d371081a7c3fcd0a2e820/shard-bmg-2/igt@kms_flip@2x-flip-vs-wf_vblank.html
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-bmg-7/igt@kms_flip@2x-flip-vs-wf_vblank.html
> 
>   * igt@kms_flip@flip-vs-absolute-wf_vblank@a-dp2:
>     - shard-bmg:          [FAIL][109] ([Intel XE#3098]) -> [PASS][110] +1 other test pass
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4731-a25d8c583e1e52bde77d371081a7c3fcd0a2e820/shard-bmg-10/igt@kms_flip@flip-vs-absolute-wf_vblank@a-dp2.html
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-bmg-4/igt@kms_flip@flip-vs-absolute-wf_vblank@a-dp2.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible:
>     - shard-lnl:          [FAIL][111] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][112] +1 other test pass
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4731-a25d8c583e1e52bde77d371081a7c3fcd0a2e820/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
> 
>   * igt@kms_setmode@invalid-clone-single-crtc-stealing:
>     - shard-bmg:          [SKIP][113] ([Intel XE#1435]) -> [PASS][114] +1 other test pass
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4731-a25d8c583e1e52bde77d371081a7c3fcd0a2e820/shard-bmg-5/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-bmg-2/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
> 
>   * igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:
>     - shard-lnl:          [FAIL][115] ([Intel XE#2142]) -> [PASS][116] +1 other test pass
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4731-a25d8c583e1e52bde77d371081a7c3fcd0a2e820/shard-lnl-7/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-lnl-3/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
> 
>   * igt@xe_evict@evict-beng-mixed-many-threads-small:
>     - shard-bmg:          [INCOMPLETE][117] ([Intel XE#6321]) -> [PASS][118]
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4731-a25d8c583e1e52bde77d371081a7c3fcd0a2e820/shard-bmg-8/igt@xe_evict@evict-beng-mixed-many-threads-small.html
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-bmg-4/igt@xe_evict@evict-beng-mixed-many-threads-small.html
> 
>   * igt@xe_evict@evict-cm-threads-small:
>     - shard-bmg:          [INCOMPLETE][119] ([Intel XE#2594]) -> [PASS][120]
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4731-a25d8c583e1e52bde77d371081a7c3fcd0a2e820/shard-bmg-4/igt@xe_evict@evict-cm-threads-small.html
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-bmg-8/igt@xe_evict@evict-cm-threads-small.html
> 
>   * igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-rebind:
>     - shard-bmg:          [SKIP][121] ([Intel XE#6703]) -> [PASS][122] +122 other tests pass
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4731-a25d8c583e1e52bde77d371081a7c3fcd0a2e820/shard-bmg-2/igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-rebind.html
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-bmg-6/igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-rebind.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_big_fb@linear-8bpp-rotate-90:
>     - shard-bmg:          [SKIP][123] ([Intel XE#6703]) -> [SKIP][124] ([Intel XE#2327]) +1 other test skip
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4731-a25d8c583e1e52bde77d371081a7c3fcd0a2e820/shard-bmg-2/igt@kms_big_fb@linear-8bpp-rotate-90.html
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-bmg-10/igt@kms_big_fb@linear-8bpp-rotate-90.html
> 
>   * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
>     - shard-bmg:          [SKIP][125] ([Intel XE#6703]) -> [SKIP][126] ([Intel XE#1124]) +1 other test skip
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4731-a25d8c583e1e52bde77d371081a7c3fcd0a2e820/shard-bmg-2/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-bmg-5/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
> 
>   * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
>     - shard-bmg:          [SKIP][127] ([Intel XE#6703]) -> [SKIP][128] ([Intel XE#367] / [Intel XE#7354])
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4731-a25d8c583e1e52bde77d371081a7c3fcd0a2e820/shard-bmg-2/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-bmg-8/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html
> 
>   * igt@kms_ccs@bad-pixel-format-y-tiled-ccs:
>     - shard-bmg:          [SKIP][129] ([Intel XE#6703]) -> [SKIP][130] ([Intel XE#2887])
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4731-a25d8c583e1e52bde77d371081a7c3fcd0a2e820/shard-bmg-2/igt@kms_ccs@bad-pixel-format-y-tiled-ccs.html
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-bmg-7/igt@kms_ccs@bad-pixel-format-y-tiled-ccs.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
>     - shard-bmg:          [SKIP][131] ([Intel XE#6703]) -> [SKIP][132] ([Intel XE#2652]) +1 other test skip
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4731-a25d8c583e1e52bde77d371081a7c3fcd0a2e820/shard-bmg-2/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-bmg-3/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
> 
>   * igt@kms_chamelium_color@ctm-limited-range:
>     - shard-bmg:          [SKIP][133] ([Intel XE#6703]) -> [SKIP][134] ([Intel XE#2325] / [Intel XE#7358])
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4731-a25d8c583e1e52bde77d371081a7c3fcd0a2e820/shard-bmg-2/igt@kms_chamelium_color@ctm-limited-range.html
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-bmg-8/igt@kms_chamelium_color@ctm-limited-range.html
> 
>   * igt@kms_chamelium_frames@hdmi-crc-fast:
>     - shard-bmg:          [SKIP][135] ([Intel XE#6703]) -> [SKIP][136] ([Intel XE#2252])
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4731-a25d8c583e1e52bde77d371081a7c3fcd0a2e820/shard-bmg-2/igt@kms_chamelium_frames@hdmi-crc-fast.html
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-bmg-2/igt@kms_chamelium_frames@hdmi-crc-fast.html
> 
>   * igt@kms_content_protection@atomic-dpms:
>     - shard-bmg:          [FAIL][137] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) -> [SKIP][138] ([Intel XE#2341])
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4731-a25d8c583e1e52bde77d371081a7c3fcd0a2e820/shard-bmg-9/igt@kms_content_protection@atomic-dpms.html
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-bmg-5/igt@kms_content_protection@atomic-dpms.html
> 
>   * igt@kms_content_protection@lic-type-0-hdcp14:
>     - shard-bmg:          [SKIP][139] ([Intel XE#7194]) -> [FAIL][140] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374])
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4731-a25d8c583e1e52bde77d371081a7c3fcd0a2e820/shard-bmg-5/igt@kms_content_protection@lic-type-0-hdcp14.html
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-bmg-2/igt@kms_content_protection@lic-type-0-hdcp14.html
> 
>   * igt@kms_content_protection@suspend-resume:
>     - shard-bmg:          [FAIL][141] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) -> [SKIP][142] ([Intel XE#6705])
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4731-a25d8c583e1e52bde77d371081a7c3fcd0a2e820/shard-bmg-9/igt@kms_content_protection@suspend-resume.html
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-bmg-5/igt@kms_content_protection@suspend-resume.html
> 
>   * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
>     - shard-bmg:          [SKIP][143] ([Intel XE#6703]) -> [SKIP][144] ([Intel XE#2316])
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4731-a25d8c583e1e52bde77d371081a7c3fcd0a2e820/shard-bmg-2/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-bmg-5/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
>     - shard-bmg:          [SKIP][145] ([Intel XE#6703]) -> [SKIP][146] ([Intel XE#7178] / [Intel XE#7351])
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4731-a25d8c583e1e52bde77d371081a7c3fcd0a2e820/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x:
>     - shard-bmg:          [SKIP][147] ([Intel XE#6703]) -> [SKIP][148] ([Intel XE#7179])
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4731-a25d8c583e1e52bde77d371081a7c3fcd0a2e820/shard-bmg-2/igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x.html
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-bmg-10/igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:
>     - shard-bmg:          [SKIP][149] ([Intel XE#6703]) -> [SKIP][150] ([Intel XE#2311]) +1 other test skip
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4731-a25d8c583e1e52bde77d371081a7c3fcd0a2e820/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-bmg-10/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:
>     - shard-bmg:          [SKIP][151] ([Intel XE#6703]) -> [SKIP][152] ([Intel XE#4141]) +1 other test skip
>    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4731-a25d8c583e1e52bde77d371081a7c3fcd0a2e820/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html
>    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:
>     - shard-bmg:          [SKIP][153] ([Intel XE#6703]) -> [SKIP][154] ([Intel XE#2312]) +2 other tests skip
>    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4731-a25d8c583e1e52bde77d371081a7c3fcd0a2e820/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html
>    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:
>     - shard-bmg:          [SKIP][155] ([Intel XE#2312]) -> [SKIP][156] ([Intel XE#4141]) +1 other test skip
>    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4731-a25d8c583e1e52bde77d371081a7c3fcd0a2e820/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html
>    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
>     - shard-bmg:          [SKIP][157] ([Intel XE#4141]) -> [SKIP][158] ([Intel XE#2312]) +6 other tests skip
>    [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4731-a25d8c583e1e52bde77d371081a7c3fcd0a2e820/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
>    [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
>     - shard-bmg:          [SKIP][159] ([Intel XE#2311]) -> [SKIP][160] ([Intel XE#2312]) +12 other tests skip
>    [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4731-a25d8c583e1e52bde77d371081a7c3fcd0a2e820/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
>    [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt:
>     - shard-bmg:          [SKIP][161] ([Intel XE#2312]) -> [SKIP][162] ([Intel XE#2311]) +7 other tests skip
>    [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4731-a25d8c583e1e52bde77d371081a7c3fcd0a2e820/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt.html
>    [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-wc:
>     - shard-bmg:          [SKIP][163] ([Intel XE#6703]) -> [SKIP][164] ([Intel XE#2313]) +6 other tests skip
>    [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4731-a25d8c583e1e52bde77d371081a7c3fcd0a2e820/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
>    [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc:
>     - shard-bmg:          [SKIP][165] ([Intel XE#2313]) -> [SKIP][166] ([Intel XE#2312]) +13 other tests skip
>    [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4731-a25d8c583e1e52bde77d371081a7c3fcd0a2e820/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc.html
>    [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt:
>     - shard-bmg:          [SKIP][167] ([Intel XE#2312]) -> [SKIP][168] ([Intel XE#2313]) +6 other tests skip
>    [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4731-a25d8c583e1e52bde77d371081a7c3fcd0a2e820/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt.html
>    [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-mmap-wc:
>     - shard-bmg:          [SKIP][169] ([Intel XE#6703]) -> [SKIP][170] ([Intel XE#7061] / [Intel XE#7356])
>    [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4731-a25d8c583e1e52bde77d371081a7c3fcd0a2e820/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-mmap-wc.html
>    [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-mmap-wc.html
> 
>   * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping:
>     - shard-bmg:          [SKIP][171] ([Intel XE#6703]) -> [SKIP][172] ([Intel XE#7283])
>    [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4731-a25d8c583e1e52bde77d371081a7c3fcd0a2e820/shard-bmg-2/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping.html
>    [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-bmg-5/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping.html
> 
>   * igt@kms_pm_dc@dc6-psr:
>     - shard-bmg:          [SKIP][173] ([Intel XE#6703]) -> [SKIP][174] ([Intel XE#2392] / [Intel XE#6927])
>    [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4731-a25d8c583e1e52bde77d371081a7c3fcd0a2e820/shard-bmg-2/igt@kms_pm_dc@dc6-psr.html
>    [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-bmg-10/igt@kms_pm_dc@dc6-psr.html
> 
>   * igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
>     - shard-bmg:          [SKIP][175] ([Intel XE#6703]) -> [SKIP][176] ([Intel XE#1489])
>    [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4731-a25d8c583e1e52bde77d371081a7c3fcd0a2e820/shard-bmg-2/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html
>    [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-bmg-5/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html
> 
>   * igt@kms_psr@pr-cursor-plane-onoff:
>     - shard-bmg:          [SKIP][177] ([Intel XE#6703]) -> [SKIP][178] ([Intel XE#2234] / [Intel XE#2850])
>    [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4731-a25d8c583e1e52bde77d371081a7c3fcd0a2e820/shard-bmg-2/igt@kms_psr@pr-cursor-plane-onoff.html
>    [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-bmg-7/igt@kms_psr@pr-cursor-plane-onoff.html
> 
>   * igt@kms_psr@psr2-primary-render:
>     - shard-bmg:          [SKIP][179] ([Intel XE#6703]) -> [SKIP][180] ([Intel XE#2234])
>    [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4731-a25d8c583e1e52bde77d371081a7c3fcd0a2e820/shard-bmg-2/igt@kms_psr@psr2-primary-render.html
>    [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-bmg-4/igt@kms_psr@psr2-primary-render.html
> 
>   * igt@kms_rotation_crc@bad-pixel-format:
>     - shard-bmg:          [SKIP][181] ([Intel XE#6703]) -> [SKIP][182] ([Intel XE#3414] / [Intel XE#3904] / [Intel XE#7342])
>    [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4731-a25d8c583e1e52bde77d371081a7c3fcd0a2e820/shard-bmg-2/igt@kms_rotation_crc@bad-pixel-format.html
>    [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-bmg-7/igt@kms_rotation_crc@bad-pixel-format.html
> 
>   * igt@kms_sharpness_filter@filter-toggle:
>     - shard-bmg:          [SKIP][183] ([Intel XE#6703]) -> [SKIP][184] ([Intel XE#6503])
>    [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4731-a25d8c583e1e52bde77d371081a7c3fcd0a2e820/shard-bmg-2/igt@kms_sharpness_filter@filter-toggle.html
>    [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-bmg-10/igt@kms_sharpness_filter@filter-toggle.html
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-bmg:          [SKIP][185] ([Intel XE#2426] / [Intel XE#5848]) -> [SKIP][186] ([Intel XE#2509] / [Intel XE#7437])
>    [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4731-a25d8c583e1e52bde77d371081a7c3fcd0a2e820/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
>    [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   * igt@kms_tv_load_detect@load-detect:
>     - shard-bmg:          [SKIP][187] ([Intel XE#6557] / [Intel XE#6703]) -> [SKIP][188] ([Intel XE#2450] / [Intel XE#5857])
>    [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4731-a25d8c583e1e52bde77d371081a7c3fcd0a2e820/shard-bmg-2/igt@kms_tv_load_detect@load-detect.html
>    [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-bmg-5/igt@kms_tv_load_detect@load-detect.html
> 
>   * igt@kms_vrr@lobf:
>     - shard-lnl:          [FAIL][189] ([Intel XE#6390] / [Intel XE#7461]) -> [SKIP][190] ([Intel XE#1499])
>    [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4731-a25d8c583e1e52bde77d371081a7c3fcd0a2e820/shard-lnl-3/igt@kms_vrr@lobf.html
>    [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-lnl-4/igt@kms_vrr@lobf.html
> 
>   * igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:
>     - shard-bmg:          [SKIP][191] ([Intel XE#6703]) -> [SKIP][192] ([Intel XE#4837]) +1 other test skip
>    [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4731-a25d8c583e1e52bde77d371081a7c3fcd0a2e820/shard-bmg-2/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html
>    [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-bmg-9/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html
> 
>   * igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram:
>     - shard-bmg:          [SKIP][193] ([Intel XE#6703]) -> [SKIP][194] ([Intel XE#4837] / [Intel XE#6665]) +1 other test skip
>    [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4731-a25d8c583e1e52bde77d371081a7c3fcd0a2e820/shard-bmg-2/igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram.html
>    [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-bmg-2/igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram.html
> 
>   * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate:
>     - shard-bmg:          [SKIP][195] ([Intel XE#6703]) -> [SKIP][196] ([Intel XE#2322] / [Intel XE#7372]) +2 other tests skip
>    [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4731-a25d8c583e1e52bde77d371081a7c3fcd0a2e820/shard-bmg-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html
>    [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-bmg-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html
> 
>   * igt@xe_exec_fault_mode@many-execqueues-multi-queue-rebind:
>     - shard-bmg:          [SKIP][197] ([Intel XE#6703]) -> [SKIP][198] ([Intel XE#7136]) +1 other test skip
>    [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4731-a25d8c583e1e52bde77d371081a7c3fcd0a2e820/shard-bmg-2/igt@xe_exec_fault_mode@many-execqueues-multi-queue-rebind.html
>    [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-bmg-3/igt@xe_exec_fault_mode@many-execqueues-multi-queue-rebind.html
> 
>   * igt@xe_exec_multi_queue@two-queues-basic-smem:
>     - shard-bmg:          [SKIP][199] ([Intel XE#6703]) -> [SKIP][200] ([Intel XE#6874]) +4 other tests skip
>    [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4731-a25d8c583e1e52bde77d371081a7c3fcd0a2e820/shard-bmg-2/igt@xe_exec_multi_queue@two-queues-basic-smem.html
>    [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-bmg-7/igt@xe_exec_multi_queue@two-queues-basic-smem.html
> 
>   * igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr:
>     - shard-bmg:          [SKIP][201] ([Intel XE#6703]) -> [SKIP][202] ([Intel XE#7138]) +2 other tests skip
>    [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4731-a25d8c583e1e52bde77d371081a7c3fcd0a2e820/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr.html
>    [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-bmg-10/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr.html
> 
>   * igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq:
>     - shard-bmg:          [SKIP][203] ([Intel XE#6703]) -> [SKIP][204] ([Intel XE#4733] / [Intel XE#7417])
>    [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4731-a25d8c583e1e52bde77d371081a7c3fcd0a2e820/shard-bmg-2/igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.html
>    [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/shard-bmg-10/igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.html
> 
>   
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
>   [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
>   [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
>   [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
>   [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
>   [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
>   [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
>   [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
>   [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
>   [Intel XE#2142]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142
>   [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>   [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
>   [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
>   [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>   [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>   [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
>   [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
>   [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
>   [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
>   [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
>   [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
>   [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
>   [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
>   [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
>   [Intel XE#2392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392
>   [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
>   [Intel XE#2450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450
>   [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
>   [Intel XE#2594]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594
>   [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
>   [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
>   [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
>   [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
>   [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>   [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
>   [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>   [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>   [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
>   [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
>   [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
>   [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
>   [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
>   [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
>   [Intel XE#4227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227
>   [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
>   [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
>   [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
>   [Intel XE#5745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5745
>   [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
>   [Intel XE#5857]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5857
>   [Intel XE#6035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035
>   [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
>   [Intel XE#6281]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6281
>   [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
>   [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
>   [Intel XE#6361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6361
>   [Intel XE#6390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6390
>   [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#6529]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6529
>   [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
>   [Intel XE#6557]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#6569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569
>   [Intel XE#6652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652
>   [Intel XE#6665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665
>   [Intel XE#6703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703
>   [Intel XE#6705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6705
>   [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
>   [Intel XE#6927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6927
>   [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
>   [Intel XE#7059]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059
>   [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
>   [Intel XE#7085]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085
>   [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
>   [Intel XE#7138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138
>   [Intel XE#7140]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7140
>   [Intel XE#7174]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7174
>   [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
>   [Intel XE#7179]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179
>   [Intel XE#7194]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7194
>   [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
>   [Intel XE#7331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7331
>   [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
>   [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
>   [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
>   [Intel XE#7354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7354
>   [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
>   [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
>   [Intel XE#7361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7361
>   [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
>   [Intel XE#7373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7373
>   [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
>   [Intel XE#7383]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383
>   [Intel XE#7385]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7385
>   [Intel XE#7388]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7388
>   [Intel XE#7397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397
>   [Intel XE#7399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399
>   [Intel XE#7413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7413
>   [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
>   [Intel XE#7426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7426
>   [Intel XE#7429]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429
>   [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
>   [Intel XE#7449]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7449
>   [Intel XE#7461]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7461
>   [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
>   [Intel XE#7596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7596
>   [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_8805 -> IGT_8806
>   * Linux: xe-4731-a25d8c583e1e52bde77d371081a7c3fcd0a2e820 -> xe-pw-163323v1
> 
>   IGT_8805: 8805
>   IGT_8806: 8806
>   xe-4731-a25d8c583e1e52bde77d371081a7c3fcd0a2e820: a25d8c583e1e52bde77d371081a7c3fcd0a2e820
>   xe-pw-163323v1: 163323v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163323v1/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
