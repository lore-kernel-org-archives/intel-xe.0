Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D94E6C4345F
	for <intel-xe@archiver.kernel.org>; Wed, 17 Apr 2024 22:50:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FFBA113845;
	Wed, 17 Apr 2024 22:50:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tro1MZkw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBBFE113845
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Apr 2024 22:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713394234; x=1744930234;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=8xNKUklGE0dJTiPNOrH/SAdWoN/k6RsX8GznD1iLZcM=;
 b=Tro1MZkwLeI3HSDcVRr4o++6QBqSWdS1XmLxa4zo+r7yGNzNBJNHt5Fl
 g/Tprf7+jEypTX8ki/Xp0Ogc8cvZig4tWEV82UtlRcdpuhIG0CQODlLck
 TTucLiPlNU10YRBCnN3OtRlT0n9MugHAh4dX2iF7tN6CoBzuozK/TYuz6
 TACXQtJFZzLVXgUSfumkyFig8lTdq4LmMlC9BIrKqjo7mHbtDzHO3lTcg
 +26z5Tb4d3WpBuA/TufV+5+tYKPU8aQ7TfSzl5kAUK0Il0mRUM7FWhpGL
 4WZofiU91LvrPrZNA6Yidc2Lw/Wq3GhMIhcvC1WCB2f4Rvtz7z2UoCO86 g==;
X-CSE-ConnectionGUID: R2ZidpMgQTmPQo93J/E+RQ==
X-CSE-MsgGUID: LJcuBeqiShSk4sGQpVQdMA==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="19473236"
X-IronPort-AV: E=Sophos;i="6.07,210,1708416000"; d="scan'208";a="19473236"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 15:50:33 -0700
X-CSE-ConnectionGUID: QQBZ4cZsSO2wCrF2Xuplzw==
X-CSE-MsgGUID: bN/NP+7KQge+Zt+K5FFoWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,210,1708416000"; d="scan'208";a="60205405"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Apr 2024 15:50:34 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 17 Apr 2024 15:50:32 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 17 Apr 2024 15:50:32 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 17 Apr 2024 15:50:32 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 17 Apr 2024 15:50:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j59R2qxh2632suBN42OU1b+KIgzjNL0vytmK1WR3Joc7AfUzkPwRxt3Hlkk1avbJJDzVQd68gIWIGzOhwQdp7tdpIisDkN1Nj9b5cJ1Qi4HcFvtVi2LdAzk7Ti+7bOJt1EElO3bWHVTbLsJ6lR7EGnU1bDEuVUi8fLwhlRT8siejmiAxWnemmxFKo5BsDpDfdBY9TAK410sPf5kAtn1TgfHXqPKChxCL1/otg7/4t9lRfooo9y+oc3n0VesA/QzlPSRcn1vJfvLStG32taX1MxLv9UIOjykK5iSwJHdYbwmOY/p6IltCtG56cmz7lV6wkSWx9SPjMjH+x96efuf0OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4mtjowFAOnqK/Z4o/O3pIkpQM6rsTwW2CS9d0Uyk7dg=;
 b=ljh+L6isnXCG4ILSxEBwNAib3zxRqPQzwahvMtdFPoC72yEQumbNC/tXffMh1WHfmLGZ+HeYqwEKvfxOlrUYKVdYRGmky71h8YOK1zctExJbJSiW9JKl4uFV2hHeYTfjmbI15FsKQ8eDfrnQv/2KUrsuJD6UbJQEXham7yYXYKQbbeWdIsrSHJyy6fgNcpkUfGXCIC9RcMjNncGEDY8b1aTw7/ZhYxKLYK0uNhau2T+DybSXTJuYpdVpbAJTL6WrdLvekFp3xeH/kdVUYu/qPBK86TK/rRbHcIJxT5Cb9HlwyEIxNIdKKK1WMtIQGsHaiF7oKMyFk40IuMilYZpFLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY8PR11MB7195.namprd11.prod.outlook.com (2603:10b6:930:93::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7430.46; Wed, 17 Apr
 2024 22:50:28 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7472.025; Wed, 17 Apr 2024
 22:50:28 +0000
Date: Wed, 17 Apr 2024 17:50:26 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Alan Previn
 <alan.previn.teres.alexis@intel.com>
Subject: Re: [PATCH 4/4] drm/xe: Introduce the wedged_mode debugfs
Message-ID: <fu2263dgx2zmdpk37hpwko7bozpgjvffh3phegidlcqwh4fwf6@qi6rtqod6syp>
References: <20240409221507.1076471-1-rodrigo.vivi@intel.com>
 <20240409221507.1076471-4-rodrigo.vivi@intel.com>
 <z2auuvqeokuzcif6k3w6tmoxfb7umragq6dva4hbh4v432vejz@di3tnyyhnvg6>
 <ZiAxJgWAxbkFX4SG@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZiAxJgWAxbkFX4SG@intel.com>
X-ClientProxiedBy: SJ0PR05CA0102.namprd05.prod.outlook.com
 (2603:10b6:a03:334::17) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CY8PR11MB7195:EE_
X-MS-Office365-Filtering-Correlation-Id: aefce2ee-ae2f-4768-8028-08dc5f30c723
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FbJHo9bpGc2upDX3LnScuHqjASFBwgrOZ113H5Zw9iNf4N6yjuQsKBCjIeJe6hvyg+xDvkE4b5IlTjxJZqaTQ3ZJm/mgGRnGho/fuSpoR38MoR7flq+Znzw/dk3OlCCpv0PHNVD9cT5mPcZTmlEIJYj9FoOJkF+DVX2rb3D+AKKC+JOu08PeLhfE7T2GLfbBmo8iI0yKo4nyD6n1S3Nk7oMyxLlkotGkL763A+DoV3H+v38HqaDtq/05ui0fwYPrnCM06Me6H8RJ9utQjWjm6qP1lJEGJ7Hb02Mj6rGML+RaNFp1kYVL0Xvr7nyKJb9NWa010AcjVkgeRIgw1CNLYpanS3cDjk2j2thzd78fMoKH6DiDasvGCNvGZ+v1wbG2jtjTk/DoRDAV5Wf4j3NTlMabbM5+K/hrUufABJK2IYq6NWw3rRBETMus/OYNkxrEsXO8mNN8GpQMVW7Cj+49Fbg++HoQU6PJIDj5qkuDqKEgOAfB4Gs2D9FeY6L8sMXPTDjbuGOrYZ6tw+S0bIe1ithXNIIqgYDVRlDjyzz43bTrRnDGG+K2JOP5LgNlq0QtDEjKCMnaNGzxyAnqoDZN28Z2DMOvSxHcg/7qm1vsfagVn51HgEe0qzUC8xY9dcCFJAQ8/r3c/SWaPDcwXARxj81CFr5P13Kyq6AIRNVRTyc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eNjAZd+LI9NNzhuS1A30TJOn1TthfJLs4M1ABAk0XUjmEcBiEkcxobOxOoe1?=
 =?us-ascii?Q?H85/rHgnONTsUPm97Vww/ZUA0fEujHaG+SwCQL54MUvl3MjFbREvd9RFRYT+?=
 =?us-ascii?Q?j4rCqsK2/GZofRMABdCSkTG8mNv6j/s+BCGxE9u7FhkZ/Z0HZrPP9HfnqNO7?=
 =?us-ascii?Q?TIB77YNbmQikLNj7pBXRJMGKJD6h3aC+qTkPrzc55FsVq+HHRy0xOlEjzH45?=
 =?us-ascii?Q?IdfiJMj5QBrrqliRNo+5pzspDFmBmV6/wqq6KdvGihiJSjvw9PsSoghFmZ6c?=
 =?us-ascii?Q?jFvUYOuf4T3XCbLLmUwmnKRlhO4Ah2AL+vlMct6KNqd432asTa3/5bz3wDK+?=
 =?us-ascii?Q?w0naihNmseWqy3IHxCWAt9zm3t7wTOFHhaA35tRF58KUIxw1hZaWDAPNJLcS?=
 =?us-ascii?Q?1XwXq9bxIJYnFHtWjVCve35oFAa9ceJCnZjXQlGMjcXTlDbDyLSQiw/hDFQn?=
 =?us-ascii?Q?byn4KybfM01NoOW7xr2GycfHF5cvu8Y0F+ULl3ZxHWyk0SC/RyqIaQ5N6XuX?=
 =?us-ascii?Q?hEXpBdsz6K2030hFazh265Wd/xozTYt3oczfvy0x6fGGb2oaSoXcBCTjIxGK?=
 =?us-ascii?Q?N+5cqTBRDn9ed/LaUwucrMcoqji0ZbaM5aGmSiCob/GySWSqBsy/FvRWCcVe?=
 =?us-ascii?Q?/dI2ZWxLk5JCi8LmW8lQH75X+1zwXtGJfuigGpxOP1pX3cm9FICuqjw3UxZB?=
 =?us-ascii?Q?p/2lEM/13GDwT2XzDnx2uRRRfFZbFcWJGCKR4YvZZw36R/NMPufde/jO5ZHf?=
 =?us-ascii?Q?4iQspktne2KzBCtMn3BRGBU6EIK/fwxfdQ5dct+sL6uRu746KoU1h4+j7Zho?=
 =?us-ascii?Q?5Us5rXnuov2Uz37cBKNyc9cy/VZWW29MvNUUK2rlkiY5X+8k5W2wDgmxgAjd?=
 =?us-ascii?Q?JSCfc7LUr90gevOuT8wK1fiiSUywKisHsPHbYoyQgY42uK59XqxU0TTgUlyk?=
 =?us-ascii?Q?gCckVrBZprjllfio1T50sNwInFaCf7yCQFk+26auBzFLYcETze9TOb2Vzvxk?=
 =?us-ascii?Q?SxyCuofBy6sHwz7oqpSdxoXoKHne3fHiR1DPE5WtRHLrKuVbKSFA4dTo77H+?=
 =?us-ascii?Q?pJ79r4iESDj0o8yqcK5I1hr5wuNPpK8df6UBMiZ2o3TqQNduvAUjD+WGJvBY?=
 =?us-ascii?Q?qq26ZnV/rLALybVhlJJPA6JA/n88Jb1dDQRmrWT9k7/gOeyFjvnuNm/GBWU1?=
 =?us-ascii?Q?n4bvcIXKcgmwfDsCT2Vuw0cAOjO2a9t/36PEBf9Cc2/dNFAA1/C2XNtGBKuf?=
 =?us-ascii?Q?UgHelw9MXBkc08pJgkF7pGFRUMSy6fbpPQjALK+yTRIVsjAhoSlnWvmOcj1Q?=
 =?us-ascii?Q?nbGtOwtxv3BsMEAFDHDSxvY0p4oCV59iMuboOpuNTpb6OW95JFNH/yfe3UM8?=
 =?us-ascii?Q?3VxI7aLgBPxRW2fIMnnybkGCLqESwzV9ZCvj4Sckg4VOvMB9XUVnQtlHq0nW?=
 =?us-ascii?Q?w3413drXhI8givTzUdWHNX/WjaOTCAoX+nWGYVVDPgQleBJ/esq6pEosXURZ?=
 =?us-ascii?Q?YvI22Snc2WBao5eYutIUr+Seecjrr3CtFAIXrxviM/9vAbtL3tqhaKjZlDZS?=
 =?us-ascii?Q?S9KcldMGh2IomPuYmzhugZeWsanRBvEr/QYCJShfPEVC922uvoov95mPwkse?=
 =?us-ascii?Q?xw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aefce2ee-ae2f-4768-8028-08dc5f30c723
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2024 22:50:28.5326 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WKd5wqw/UessL8sqAcHSDxcqW61Iqe0ijPBcluq4/QMjoDnb3pXrJTJ54eAXSt60kNOCmkVMLoHZ+L4Tr5Ko87QfcLrqo4tgrFCaxMVm4cg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7195
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

On Wed, Apr 17, 2024 at 04:29:26PM GMT, Rodrigo Vivi wrote:
>On Wed, Apr 17, 2024 at 02:51:05PM -0500, Lucas De Marchi wrote:
>> On Tue, Apr 09, 2024 at 06:15:07PM GMT, Rodrigo Vivi wrote:
>> > So, the wedged mode can be selected per device at runtime,
>> > before the tests or before reproducing the issue.
>> >
>> > v2: - s/busted/wedged
>> >    - some locking consistency
>> >
>> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> > Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
>> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> > ---
>> > drivers/gpu/drm/xe/xe_debugfs.c      | 56 ++++++++++++++++++++++++++++
>> > drivers/gpu/drm/xe/xe_device.c       | 41 ++++++++++++++------
>> > drivers/gpu/drm/xe/xe_device.h       |  4 +-
>> > drivers/gpu/drm/xe/xe_device_types.h | 11 +++++-
>> > drivers/gpu/drm/xe/xe_gt.c           |  2 +-
>> > drivers/gpu/drm/xe/xe_guc.c          |  2 +-
>> > drivers/gpu/drm/xe/xe_guc_ads.c      | 52 +++++++++++++++++++++++++-
>> > drivers/gpu/drm/xe/xe_guc_ads.h      |  1 +
>> > drivers/gpu/drm/xe/xe_guc_submit.c   | 28 +++++++-------
>> > 9 files changed, 163 insertions(+), 34 deletions(-)
>> >
>> > diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
>> > index 86150cafe0ff..6ff067ea5a8f 100644
>> > --- a/drivers/gpu/drm/xe/xe_debugfs.c
>> > +++ b/drivers/gpu/drm/xe/xe_debugfs.c
>> > @@ -12,6 +12,7 @@
>> > #include "xe_bo.h"
>> > #include "xe_device.h"
>> > #include "xe_gt_debugfs.h"
>> > +#include "xe_guc_ads.h"
>> > #include "xe_pm.h"
>> > #include "xe_step.h"
>> >
>> > @@ -106,6 +107,58 @@ static const struct file_operations forcewake_all_fops = {
>> > 	.release = forcewake_release,
>> > };
>> >
>> > +static ssize_t wedged_mode_show(struct file *f, char __user *ubuf,
>> > +				size_t size, loff_t *pos)
>> > +{
>> > +	struct xe_device *xe = file_inode(f)->i_private;
>> > +	char buf[32];
>> > +	int len = 0;
>> > +
>> > +	mutex_lock(&xe->wedged.lock);
>>
>> what are we trying to synchronize here? multiple threads writing to
>> debugfs to change the wedged mode?
>
>well, since it is a debugfs set manually (or in the igt we control) and
>that should be set in advance of the exec/hang test, I believe we could
>live without any lock indeed.
>
>>
>> > +	len = scnprintf(buf, sizeof(buf), "%d\n", xe->wedged.mode);
>> > +	mutex_unlock(&xe->wedged.lock);
>> > +
>> > +	return simple_read_from_buffer(ubuf, size, pos, buf, len);
>> > +}
>> > +
>> > +static ssize_t wedged_mode_set(struct file *f, const char __user *ubuf,
>> > +			       size_t size, loff_t *pos)
>> > +{
>> > +	struct xe_device *xe = file_inode(f)->i_private;
>> > +	struct xe_gt *gt;
>> > +	u32 wedged_mode;
>> > +	ssize_t ret;
>> > +	u8 id;
>> > +
>> > +	ret = kstrtouint_from_user(ubuf, size, 0, &wedged_mode);
>> > +	if (ret)
>> > +		return ret;
>> > +
>> > +	if (wedged_mode > 2)
>> > +		return -EINVAL;
>> > +
>> > +	mutex_lock(&xe->wedged.lock);
>> > +	xe->wedged.mode = wedged_mode;
>>
>> should we return if xe->wedged.mode == wedged_mode already?
>
>indeed. will change.
>
>>
>> > +	if (wedged_mode == 2) {
>>
>> this doesn't seem correct.
>>
>> echo 2 > wedged_mode
>> echo 1 > wedged_mode
>>
>> Second call doesn't fail, driver starts handling it as wedged_mode == 1,
>> guc still has the policy to disable reset. Or am I missing anything?
>>
>> If we are not handling going back to 1, then we should just error
>> out above.
>
>indeed. I forgot about that case...
>will change.
>
>>
>> > +		for_each_gt(gt, xe, id) {
>> > +			ret = xe_guc_ads_scheduler_policy_disable_reset(&gt->uc.guc.ads);
>> > +			if (ret) {
>> > +				drm_err(&xe->drm, "Failed to update GuC ADS scheduler policy. GPU might still reset even on the wedged_mode=2\n");
>>
>> humn... wouldn't it be better to keep xe->wedged.mode as is and error
>> out like:
>>
>> 	drm_err(&xe->drm, "Failed to update GuC ADS scheduler policy, can't change wedged_mode\n");
>>
>> also, we should return error here. dunno which one is appropriate, but
>> maybe -ECOMM. Also, maybe unwind the first GTs on error? May not be
>> needed and just make matters worse,
>
>yeap, I didn't want to rewind exactly because of the multigt.
>what happens if it sets gt0, then fails in gt1, then fails in rewind of gt0?
>
>> but may deserve a comment about that
>> conscious decision here.
>
>exactly what I tried to do with:
>"Failed to update GuC ADS scheduler policy. GPU might still reset even on the wedged_mode=2\n"
>
>:)
>
>you respect the decision on stopping and wedging on any timeout, but warning
>that guc might not respect that selection.


ok, now I understand it.

>
>should I put this above sentence as a comment in the code?

no, maybe just change it to be xe_gt_err() so we know which gt and then
reword as:

	"Failed to update GuC ADS scheduler policy. GuC may still cause engine reset even with wedged_mode=2\n"

but still worth to return an error code so the caller knows it's
not supposed to work, even without looking at the kernel log.

Thanks for the clarification.

Lucas De Marchi

>
>>
>> Lucas De Marchi
>>
>> > +				break;
>> > +			}
>> > +		}
>> > +	}
>> > +	mutex_unlock(&xe->wedged.lock);
>> > +
>> > +	return size;
>> > +}
>> > +
>> > +static const struct file_operations wedged_mode_fops = {
>> > +	.owner = THIS_MODULE,
>> > +	.read = wedged_mode_show,
>> > +	.write = wedged_mode_set,
>> > +};
>> > +
>> > void xe_debugfs_register(struct xe_device *xe)
>> > {
>> > 	struct ttm_device *bdev = &xe->ttm;
>> > @@ -123,6 +176,9 @@ void xe_debugfs_register(struct xe_device *xe)
>> > 	debugfs_create_file("forcewake_all", 0400, root, xe,
>> > 			    &forcewake_all_fops);
>> >
>> > +	debugfs_create_file("wedged_mode", 0400, root, xe,
>> > +			    &wedged_mode_fops);
>> > +
>> > 	for (mem_type = XE_PL_VRAM0; mem_type <= XE_PL_VRAM1; ++mem_type) {
>> > 		man = ttm_manager_type(bdev, mem_type);
>> >
>> > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> > index 7928a5470cee..949fca2f0400 100644
>> > --- a/drivers/gpu/drm/xe/xe_device.c
>> > +++ b/drivers/gpu/drm/xe/xe_device.c
>> > @@ -445,6 +445,9 @@ int xe_device_probe_early(struct xe_device *xe)
>> > 	if (err)
>> > 		return err;
>> >
>> > +	mutex_init(&xe->wedged.lock);
>> > +	xe->wedged.mode = xe_modparam.wedged_mode;
>> > +
>> > 	return 0;
>> > }
>> >
>> > @@ -787,26 +790,37 @@ u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address)
>> > }
>> >
>> > /**
>> > - * xe_device_declare_wedged - Declare device wedged
>> > + * xe_device_hint_wedged - Get a hint and possibly declare device as wedged
>> >  * @xe: xe device instance
>> > + * @in_timeout_path: hint coming from a timeout path
>> >  *
>> > - * This is a final state that can only be cleared with a module
>> > + * The wedged state is a final on that can only be cleared with a module
>> >  * re-probe (unbind + bind).
>> >  * In this state every IOCTL will be blocked so the GT cannot be used.
>> > - * In general it will be called upon any critical error such as gt reset
>> > - * failure or guc loading failure.
>> > - * If xe.wedged module parameter is set to 2, this function will be called
>> > - * on every single execution timeout (a.k.a. GPU hang) right after devcoredump
>> > - * snapshot capture. In this mode, GT reset won't be attempted so the state of
>> > - * the issue is preserved for further debugging.
>> > + * In general device will be declared wedged only at critical
>> > + * error paths such as gt reset failure or guc loading failure.
>> > + * Hints are also expected from every single execution timeout (a.k.a. GPU hang)
>> > + * right after devcoredump snapshot capture. Then, device can be declared wedged
>> > + * if wedged_mode is set to 2. In this mode, GT reset won't be attempted so the
>> > + * state of the issue is preserved for further debugging.
>> > + *
>> > + * Return: True if device has been just declared wedged. False otherwise.
>> >  */
>> > -void xe_device_declare_wedged(struct xe_device *xe)
>> > +bool xe_device_hint_wedged(struct xe_device *xe, bool in_timeout_path)
>> > {
>> > -	if (xe_modparam.wedged_mode == 0)
>> > -		return;
>> > +	bool ret = false;
>> > +
>> > +	mutex_lock(&xe->wedged.lock);
>> >
>> > -	if (!atomic_xchg(&xe->wedged, 1)) {
>> > +	if (xe->wedged.mode == 0)
>> > +		goto out;
>> > +
>> > +	if (in_timeout_path && xe->wedged.mode != 2)
>> > +		goto out;
>> > +
>> > +	if (!atomic_xchg(&xe->wedged.flag, 1)) {
>> > 		xe->needs_flr_on_fini = true;
>> > +		ret = true;
>> > 		drm_err(&xe->drm,
>> > 			"CRITICAL: Xe has declared device %s as wedged.\n"
>> > 			"IOCTLs and executions are blocked until device is probed again with unbind and bind operations:\n"
>> > @@ -816,4 +830,7 @@ void xe_device_declare_wedged(struct xe_device *xe)
>> > 			dev_name(xe->drm.dev), dev_name(xe->drm.dev),
>> > 			dev_name(xe->drm.dev));
>> > 	}
>> > +out:
>> > +	mutex_unlock(&xe->wedged.lock);
>> > +	return ret;
>> > }
>> > diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
>> > index 0fea5c18f76d..e3ea8a43e7f9 100644
>> > --- a/drivers/gpu/drm/xe/xe_device.h
>> > +++ b/drivers/gpu/drm/xe/xe_device.h
>> > @@ -178,9 +178,9 @@ u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address);
>> >
>> > static inline bool xe_device_wedged(struct xe_device *xe)
>> > {
>> > -	return atomic_read(&xe->wedged);
>> > +	return atomic_read(&xe->wedged.flag);
>> > }
>> >
>> > -void xe_device_declare_wedged(struct xe_device *xe);
>> > +bool xe_device_hint_wedged(struct xe_device *xe, bool in_timeout_path);
>> >
>> > #endif
>> > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>> > index b9ef60f21750..0da4787f1087 100644
>> > --- a/drivers/gpu/drm/xe/xe_device_types.h
>> > +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> > @@ -458,8 +458,15 @@ struct xe_device {
>> > 	/** @needs_flr_on_fini: requests function-reset on fini */
>> > 	bool needs_flr_on_fini;
>> >
>> > -	/** @wedged: Xe device faced a critical error and is now blocked. */
>> > -	atomic_t wedged;
>> > +	/** @wedged: Struct to control Wedged States and mode */
>> > +	struct {
>> > +		/** @wedged.flag: Xe device faced a critical error and is now blocked. */
>> > +		atomic_t flag;
>> > +		/** @wedged.mode: Mode controlled by kernel parameter and debugfs */
>> > +		int mode;
>> > +		/** @wedged.lock: To protect @wedged.mode */
>> > +		struct mutex lock;
>> > +	} wedged;
>> >
>> > 	/* private: */
>> >
>> > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>> > index 0844081b88ef..da16f4273877 100644
>> > --- a/drivers/gpu/drm/xe/xe_gt.c
>> > +++ b/drivers/gpu/drm/xe/xe_gt.c
>> > @@ -688,7 +688,7 @@ static int gt_reset(struct xe_gt *gt)
>> > err_fail:
>> > 	xe_gt_err(gt, "reset failed (%pe)\n", ERR_PTR(err));
>> >
>> > -	xe_device_declare_wedged(gt_to_xe(gt));
>> > +	xe_device_hint_wedged(gt_to_xe(gt), false);
>> >
>> > 	return err;
>> > }
>> > diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>> > index f1c3e338301d..ee7e0fa4815d 100644
>> > --- a/drivers/gpu/drm/xe/xe_guc.c
>> > +++ b/drivers/gpu/drm/xe/xe_guc.c
>> > @@ -495,7 +495,7 @@ static void guc_wait_ucode(struct xe_guc *guc)
>> > 			xe_gt_err(gt, "GuC firmware exception. EIP: %#x\n",
>> > 				  xe_mmio_read32(gt, SOFT_SCRATCH(13)));
>> >
>> > -		xe_device_declare_wedged(gt_to_xe(gt));
>> > +		xe_device_hint_wedged(gt_to_xe(gt), false);
>> > 	} else {
>> > 		xe_gt_dbg(gt, "GuC successfully loaded\n");
>> > 	}
>> > diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
>> > index dbd88ae20aa3..ad64d5a31239 100644
>> > --- a/drivers/gpu/drm/xe/xe_guc_ads.c
>> > +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
>> > @@ -9,6 +9,7 @@
>> >
>> > #include <generated/xe_wa_oob.h>
>> >
>> > +#include "abi/guc_actions_abi.h"
>> > #include "regs/xe_engine_regs.h"
>> > #include "regs/xe_gt_regs.h"
>> > #include "regs/xe_guc_regs.h"
>> > @@ -16,11 +17,11 @@
>> > #include "xe_gt.h"
>> > #include "xe_gt_ccs_mode.h"
>> > #include "xe_guc.h"
>> > +#include "xe_guc_ct.h"
>> > #include "xe_hw_engine.h"
>> > #include "xe_lrc.h"
>> > #include "xe_map.h"
>> > #include "xe_mmio.h"
>> > -#include "xe_module.h"
>> > #include "xe_platform_types.h"
>> > #include "xe_wa.h"
>> >
>> > @@ -395,6 +396,7 @@ int xe_guc_ads_init_post_hwconfig(struct xe_guc_ads *ads)
>> >
>> > static void guc_policies_init(struct xe_guc_ads *ads)
>> > {
>> > +	struct xe_device *xe = ads_to_xe(ads);
>> > 	u32 global_flags = 0;
>> >
>> > 	ads_blob_write(ads, policies.dpc_promote_time,
>> > @@ -402,8 +404,10 @@ static void guc_policies_init(struct xe_guc_ads *ads)
>> > 	ads_blob_write(ads, policies.max_num_work_items,
>> > 		       GLOBAL_POLICY_MAX_NUM_WI);
>> >
>> > -	if (xe_modparam.wedged_mode == 2)
>> > +	mutex_lock(&xe->wedged.lock);
>> > +	if (xe->wedged.mode == 2)
>> > 		global_flags |= GLOBAL_POLICY_DISABLE_ENGINE_RESET;
>> > +	mutex_unlock(&xe->wedged.lock);
>> >
>> > 	ads_blob_write(ads, policies.global_flags, global_flags);
>> > 	ads_blob_write(ads, policies.is_valid, 1);
>> > @@ -760,3 +764,47 @@ void xe_guc_ads_populate_post_load(struct xe_guc_ads *ads)
>> > {
>> > 	guc_populate_golden_lrc(ads);
>> > }
>> > +
>> > +static int guc_ads_action_update_policies(struct xe_guc_ads *ads, u32 policy_offset)
>> > +{
>> > +	struct  xe_guc_ct *ct = &ads_to_guc(ads)->ct;
>> > +	u32 action[] = {
>> > +		XE_GUC_ACTION_GLOBAL_SCHED_POLICY_CHANGE,
>> > +		policy_offset
>> > +	};
>> > +
>> > +	return xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
>> > +}
>> > +
>> > +int xe_guc_ads_scheduler_policy_disable_reset(struct xe_guc_ads *ads)
>> > +{
>> > +	struct xe_device *xe = ads_to_xe(ads);
>> > +	struct xe_gt *gt = ads_to_gt(ads);
>> > +	struct xe_tile *tile = gt_to_tile(gt);
>> > +	struct guc_policies *policies;
>> > +	struct xe_bo *bo;
>> > +	int ret = 0;
>> > +
>> > +	policies = kmalloc(sizeof(*policies), GFP_KERNEL);
>> > +	if (!policies)
>> > +		return -ENOMEM;
>> > +
>> > +	policies->dpc_promote_time = ads_blob_read(ads, policies.dpc_promote_time);
>> > +	policies->max_num_work_items = ads_blob_read(ads, policies.max_num_work_items);
>> > +	policies->is_valid = 1;
>> > +	if (xe->wedged.mode == 2)
>> > +		policies->global_flags |= GLOBAL_POLICY_DISABLE_ENGINE_RESET;
>> > +
>> > +	bo = xe_managed_bo_create_from_data(xe, tile, policies, sizeof(struct guc_policies),
>> > +					    XE_BO_FLAG_VRAM_IF_DGFX(tile) |
>> > +					    XE_BO_FLAG_GGTT);
>> > +	if (IS_ERR(bo)) {
>> > +		ret = PTR_ERR(bo);
>> > +		goto out;
>> > +	}
>> > +
>> > +	ret = guc_ads_action_update_policies(ads, xe_bo_ggtt_addr(bo));
>> > +out:
>> > +	kfree(policies);
>> > +	return ret;
>> > +}
>> > diff --git a/drivers/gpu/drm/xe/xe_guc_ads.h b/drivers/gpu/drm/xe/xe_guc_ads.h
>> > index 138ef6267671..7c45c40fab34 100644
>> > --- a/drivers/gpu/drm/xe/xe_guc_ads.h
>> > +++ b/drivers/gpu/drm/xe/xe_guc_ads.h
>> > @@ -13,5 +13,6 @@ int xe_guc_ads_init_post_hwconfig(struct xe_guc_ads *ads);
>> > void xe_guc_ads_populate(struct xe_guc_ads *ads);
>> > void xe_guc_ads_populate_minimal(struct xe_guc_ads *ads);
>> > void xe_guc_ads_populate_post_load(struct xe_guc_ads *ads);
>> > +int xe_guc_ads_scheduler_policy_disable_reset(struct xe_guc_ads *ads);
>> >
>> > #endif
>> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>> > index 0bea17536659..7de97b90ad00 100644
>> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>> > @@ -35,7 +35,6 @@
>> > #include "xe_macros.h"
>> > #include "xe_map.h"
>> > #include "xe_mocs.h"
>> > -#include "xe_module.h"
>> > #include "xe_ring_ops_types.h"
>> > #include "xe_sched_job.h"
>> > #include "xe_trace.h"
>> > @@ -868,26 +867,33 @@ static void xe_guc_exec_queue_trigger_cleanup(struct xe_exec_queue *q)
>> > 		xe_sched_tdr_queue_imm(&q->guc->sched);
>> > }
>> >
>> > -static void guc_submit_wedged(struct xe_guc *guc)
>> > +static bool guc_submit_hint_wedged(struct xe_guc *guc)
>> > {
>> > 	struct xe_exec_queue *q;
>> > 	unsigned long index;
>> > 	int err;
>> >
>> > -	xe_device_declare_wedged(guc_to_xe(guc));
>> > +	if (xe_device_wedged(guc_to_xe(guc)))
>> > +		return true;
>> > +
>> > +	if (!xe_device_hint_wedged(guc_to_xe(guc), true))
>> > +		return false;
>> > +
>> > 	xe_guc_submit_reset_prepare(guc);
>> > 	xe_guc_ct_stop(&guc->ct);
>> >
>> > 	err = drmm_add_action_or_reset(&guc_to_xe(guc)->drm,
>> > 				       guc_submit_wedged_fini, guc);
>> > 	if (err)
>> > -		return;
>> > +		return true; /* Device is wedged anyway */
>> >
>> > 	mutex_lock(&guc->submission_state.lock);
>> > 	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q)
>> > 		if (xe_exec_queue_get_unless_zero(q))
>> > 			set_exec_queue_wedged(q);
>> > 	mutex_unlock(&guc->submission_state.lock);
>> > +
>> > +	return true;
>> > }
>> >
>> > static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
>> > @@ -898,15 +904,12 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
>> > 	struct xe_guc *guc = exec_queue_to_guc(q);
>> > 	struct xe_device *xe = guc_to_xe(guc);
>> > 	struct xe_gpu_scheduler *sched = &ge->sched;
>> > -	bool wedged = xe_device_wedged(xe);
>> > +	bool wedged;
>> >
>> > 	xe_assert(xe, xe_exec_queue_is_lr(q));
>> > 	trace_xe_exec_queue_lr_cleanup(q);
>> >
>> > -	if (!wedged && xe_modparam.wedged_mode == 2) {
>> > -		guc_submit_wedged(exec_queue_to_guc(q));
>> > -		wedged = true;
>> > -	}
>> > +	wedged = guc_submit_hint_wedged(exec_queue_to_guc(q));
>> >
>> > 	/* Kill the run_job / process_msg entry points */
>> > 	xe_sched_submission_stop(sched);
>> > @@ -957,7 +960,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>> > 	struct xe_device *xe = guc_to_xe(exec_queue_to_guc(q));
>> > 	int err = -ETIME;
>> > 	int i = 0;
>> > -	bool wedged = xe_device_wedged(xe);
>> > +	bool wedged;
>> >
>> > 	/*
>> > 	 * TDR has fired before free job worker. Common if exec queue
>> > @@ -981,10 +984,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>> >
>> > 	trace_xe_sched_job_timedout(job);
>> >
>> > -	if (!wedged && xe_modparam.wedged_mode == 2) {
>> > -		guc_submit_wedged(exec_queue_to_guc(q));
>> > -		wedged = true;
>> > -	}
>> > +	wedged = guc_submit_hint_wedged(exec_queue_to_guc(q));
>> >
>> > 	/* Kill the run_job entry point */
>> > 	xe_sched_submission_stop(sched);
>> > --
>> > 2.44.0
>> >
