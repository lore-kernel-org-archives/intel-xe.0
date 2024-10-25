Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98E0BD149CD
	for <intel-xe@archiver.kernel.org>; Fri, 25 Oct 2024 17:03:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B68E10EB23;
	Fri, 25 Oct 2024 17:03:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gj4F2TS0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB0D210EB23
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Oct 2024 17:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729875830; x=1761411830;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=WS0VjZFyAfYUkgI3dEeEAgCv/kIrTpnpXN5xEj6BGN8=;
 b=Gj4F2TS0AUTkU2si24gzpj2QaIPQhAjI9XAT4TymSnbqqSL7Jfb4+0rs
 nMlEjNApnTglYV8cked98NupVc2+YguXAADNHTN15FV9vY+bs6DFVSMM5
 rUEsVeOgLgIK1yf7cdGCvLsovV4turVp/vIaPULrOCKEyCwIyesBVTUkG
 xub9F8nURkotKPsc0ifQWggTxDQC8JoamsOJ16V4LfB5FrmpMvM02FJjr
 hi4OcN7U4qvRI8Ry9gnu4LW2yNgOTaF4CMkO88LOHoxLHDYhpw6RNu6cm
 z92vm0ls9edlOf7lZcNYgPMJggi5TN7a3DOozQ8fcXWUnKt5K/z2IvrDd w==;
X-CSE-ConnectionGUID: KaPLgcW2TDegnRP/nH7tnA==
X-CSE-MsgGUID: r88PqU2zRXKl+mP+4uRchw==
X-IronPort-AV: E=McAfee;i="6700,10204,11236"; a="29003247"
X-IronPort-AV: E=Sophos;i="6.11,232,1725346800"; d="scan'208";a="29003247"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2024 10:03:50 -0700
X-CSE-ConnectionGUID: xB5fya2bTs2xtfqFHD6gyg==
X-CSE-MsgGUID: ssaM0Fx6SqmfwVtxhHkvNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,232,1725346800"; d="scan'208";a="111776073"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Oct 2024 10:03:49 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 25 Oct 2024 10:03:48 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 25 Oct 2024 10:03:48 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 25 Oct 2024 10:03:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=imnDYg+A/i/e+ErS+h9/7O0Ew2UbuLCZRA2P8aRnl3elh81gJjVT24JfaA9VRBaINGcqDcdlR3EJjMZGh1LYtlj2rvA8E69RoWgnPKNZtWAvm5OlYlHBMs3+mQZilUOWO/cT2jx+J/MbDxaFKeLcBvFqV/DlhfXEvdMd9rxwnRm9dxUp3f9udTj62H3dKyx5TGa1Ob9Rcvq3kIEbhSbE5YXEeRJhr3qKGpmIhhlGBMGio+7X2agReqblpuwJ8cW84DEjkWfRwet97xnM0TZrthky3FvXikCXU0WcJ/+H9laxWCivwOZyXlyou9f6keonMt4lXSksLBfOAxqoKJuGoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RZMuzD08qBr2yaUAkyx7tBxUCJWM1DNa6f43ClGziwk=;
 b=m0+MBXcEHn1nXV2WhAJC0SvTMizHEQG5/sWaLOrr8i2RNXnCp17debR32tm8Bt8opm3A7lnPerIFZg+YQaEjZAVq5h5oczbMq9Gc1iBtgQtHAPfj/FrQ+MDB1YFvK5vWGZmgTBuujyYrOOJlNbDzy6NuMNifpl7WVUqlWhS4k1i4rsRpfCzH/fGF+iSEK1bRimy0T+uI58Jnc+C6y4KbiUpx8pAeS0s8RZTdcuWUADgnorMQnGcjfO5eKBJzSw6MUTUm+yLbCt99NOtZTV3NLJilboP7grTZJSTc8Ur9ilJAXBWXW0u//HxJSf8NOTxjJeCvn1eJuqlV//AUs6QnEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SA0PR11MB4655.namprd11.prod.outlook.com (2603:10b6:806:9d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.23; Fri, 25 Oct
 2024 17:03:44 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.8093.018; Fri, 25 Oct 2024
 17:03:44 +0000
Date: Fri, 25 Oct 2024 10:03:41 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <lucas.demarchi@intel.com>, <John.C.Harrison@intel.com>,
 <rodrigo.vivi@intel.com>, <andi.shyti@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <riana.tauro@intel.com>
Subject: Re: [PATCH v1] drm/xe: Rework throttle ABI
Message-ID: <20241025170341.GQ5725@mdroper-desk1.amr.corp.intel.com>
References: <20241025092238.167042-1-raag.jadav@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241025092238.167042-1-raag.jadav@intel.com>
X-ClientProxiedBy: SJ0PR13CA0220.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::15) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SA0PR11MB4655:EE_
X-MS-Office365-Filtering-Correlation-Id: 611164d5-7a76-468d-a873-08dcf516fc01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uPVv+J/YO81K7bfM11vxNaYZlaMyfYknVMGqewkCR54yhbM7fgIgNAEQqgee?=
 =?us-ascii?Q?wYD/NYgKAl4r6SHajfrIIi04/LHBAKRTe01e4OsDNy/C48qfOryNjk0rjkQE?=
 =?us-ascii?Q?OhHivHTGMDY4RqNOVFtt/N3DwPH6J7AQaM4Jy5b4IyPoBUkXL/hhrgQa3bRs?=
 =?us-ascii?Q?wCVUCeOsT7BDoYCqXxMzvp5rr3XtB27qGt+eArC5W2mRFq64k0q6foodtbH4?=
 =?us-ascii?Q?CCstrkM2IEFN++WyAXPLwIBhz8gnUqKtlkxgA9+v9/8NaHRdwBa9iS8gLXMC?=
 =?us-ascii?Q?kkVmLtXoFZf731A2nlCn/guAkeo8V88Ua9DTovuDPpBEceRhLzBeRFCJbVe4?=
 =?us-ascii?Q?7GHBMi3Lw2dic3ACZp+LJNRaM5uWyP+tFJnzkH2q82zo4LxoE4iXQiQ0ojDV?=
 =?us-ascii?Q?atk5t+UlC/bfi13n021WtZxCWEghtd/kh9CaEXPXbEN90bLKq8+vP10PiVzb?=
 =?us-ascii?Q?/Oos/fRPXB5v7Kf9Qw8xl1bXowlFPyiGU7Z6obbZExWPdaVFbNBQ/CGLY7oa?=
 =?us-ascii?Q?0GJbJvQEguPviTbpaN+Y8e3SdBTr1R8d8r5PDwT6OW2J/xlAB+uCNDxzYu1t?=
 =?us-ascii?Q?1Z3T8IiUZww0c8d3Yng24L2ug3cFq7ru5enkX0qwbWb2Cb3zLZuMc9xIInPT?=
 =?us-ascii?Q?jeUPtiMcyKheeInVmG8A54mdaLkXoVpeBaDZ7pC9Lz70PQX8Bx9ubpLxqkyV?=
 =?us-ascii?Q?xjlttZLnbocGSHQgy1Hw3fUuWtztRos/YXCzAQuehSw/bYsYpDcPWP36fHJQ?=
 =?us-ascii?Q?IrlAicb7fAtD+odzVXrelN1mBqiyWsBOAgQhLnhmkMzt8zqf33gJdkZesqmG?=
 =?us-ascii?Q?RVUny9AbC3bJC2UpuPFygVUpJ0SQgpKpivUf5fI/YpsPah1/8piHVWexwfgn?=
 =?us-ascii?Q?jtZbTbj3l00CB5UQ8P5/K7OX6pWln19NOSr1IHmvr1zOi+sBieQFkg0ifwJE?=
 =?us-ascii?Q?9Euhvlb9syFV+9D+RR58iQM9rmRG8KziNKHiOfVCtJXGNXl+aG4hKTAwkGp/?=
 =?us-ascii?Q?1cV2DyNGoPEPbRuI8BzHEA6VuwPfvOQCGkmzeI8SDA7wPUFU31acAVSPbVAm?=
 =?us-ascii?Q?alXihWSC/EGFN5SwXA9E5HvKDPt2XslttzcMMuRfQ2MnLc0U630Z9q4f+vEw?=
 =?us-ascii?Q?HFlhy8Zw3tDM4lLEwZ3LO3H/iX2V8xOA2gIHVUKAhrxnnXLy9GaPrrLeN0Yt?=
 =?us-ascii?Q?pENrMYzrx8mrFedk2gerW24KkdCcbPiHjFP3egDCFEK9XuD7COB6SBYEyhqN?=
 =?us-ascii?Q?Gsq6dS/Sa8qhpadsMzIH?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kPN2jy5B8L39erzJlUXvYNzgVpBq6mwW/yajw6FhA1aIM8ltlKaPm9BJBhc+?=
 =?us-ascii?Q?t8NopjzFmOY2xmpvfEJyJmgU2A60nfPzB32bf5IE9roA2oDMieAOUnicp+YH?=
 =?us-ascii?Q?BUzC1ycRpMcqgyobQQ4T4XmB3MvI3SIYhYys8ZEykKpd9ipZSjbS22/eCW0K?=
 =?us-ascii?Q?6ckJEF0QCzUHlRZYAqYq0G1OTo3Ilp9LJrg7PtLqD7mNPaN0IOenN75JnRcX?=
 =?us-ascii?Q?Lk4L6Hi/FultTDjgBULS4l1/m3n0vKxtrDgHZp7dlsQwjpN6FdUs1mB5FYYK?=
 =?us-ascii?Q?QYHRXOUcCVwVAagt8VEyeoLSLKxFETnGuXRxzG5+tn/mqBpJ7jKLJ3EQ+7kk?=
 =?us-ascii?Q?pEKhxyTHDbmPy0TBZrYxbnNgT08GFgEImtcXEBIXvwnRSKqebSUD5XimEVMK?=
 =?us-ascii?Q?VHK7QE/G1qbvjv1wJ33PuGArfjx0LIIo8pvKnfxKwru5xkfaD+TjH/cacgQa?=
 =?us-ascii?Q?a/w1r+Ocr6ag7aIthV2Ry6seyDnu/nNYprgfChw/4THNDZib0fs+lnQBMBKM?=
 =?us-ascii?Q?wDfHAisP6HAwTUBfm4A0iGxZXSX7ZbnpSbzXO2EcLt5E72yQqj7pCqtNabcl?=
 =?us-ascii?Q?mU4+/uYtzuSvOiXJqKbSNzxoJicbXisFFhf5MYfqXuQfLFd+R5sGVFKknOYf?=
 =?us-ascii?Q?2EUs0HGSaPkzL4+XhuSj7bWzJ8EHcMQBpijJKNKQvKJlEf0q2cKGeWdY/T+C?=
 =?us-ascii?Q?fYzxxKAu3eLorTZkYIQWobqkLbRRNZ5pbuQYwrzPnhEld7dRjeTOT2mbqWkT?=
 =?us-ascii?Q?avL0lTZsn7GWm8u4b7di8jScIMwDIHrc28+PEPAgo9KKyUAb2FTNMmBDf28G?=
 =?us-ascii?Q?ciZAQw0DipwcUPZJfanFS1rxi1sbEvizzTYst0A8CJd9y5ZmCuzlUTN2xUoW?=
 =?us-ascii?Q?r4A5NmSi5RqA90I5NJbsndGrFIKK7iNZtPABFBB2RvB8LbKzBVoGtRty4L1B?=
 =?us-ascii?Q?Kequ6opSYFacbbqbJoDkoKvMRowFwnkYKwcqCUN+D23tFLFkdRdr7POtLJ8k?=
 =?us-ascii?Q?OuVxaUAf81Aqi6yLmbA0fgWa2/Og7lm8rgSSec8wFqUFAG7tlqIj4pYg6jy1?=
 =?us-ascii?Q?pPMdBotVUTRm9TUwIO84vZiyN4SlMKcm7d/gTIa4PsyXgNnBxEXX2s+zQ3RC?=
 =?us-ascii?Q?tNmz+O7UUYlGmRGHadvGyoQIndmG55xSW7vFsnAH3qMA56dA/IXoB32AXyZr?=
 =?us-ascii?Q?A80gyAsXzaQJtbtfO6LHTdyean4W9CkYTLWf4bwnqri3iA7nSzxth0Lj9kjI?=
 =?us-ascii?Q?RlVp3gNHqLryTe/rHm42HT30SBF1Ec0VoaEFIrc1Vtn6Bp0PwlJKWlEacIxF?=
 =?us-ascii?Q?c9CtKCIHJN78Bc4WaBq/JMU7mMJzwJzvGERjXsdDTfb2MunrKACyQowB6J4n?=
 =?us-ascii?Q?cf9sBWOVuKjjRCtUeEqPtoNUSqHJUWKC/0neRUM+gXKnwi+pfT37zovYZr+I?=
 =?us-ascii?Q?3/DWM7z0wtzee9n4tqm4bzUDcQDZ+a9rzkIiFaG0mPBHlqSHKwyLqCcRxfBz?=
 =?us-ascii?Q?4PIZVdwp2S9v4LcS2UaoP6b9ftcjM398kwCmIKdOKaxAzsZz3zyPcjnddHTZ?=
 =?us-ascii?Q?5VlafxondsnmNkTwNW6X7coly9FMzwxinX2FXFpFI5eS0xGQirprE2JOGrpf?=
 =?us-ascii?Q?/g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 611164d5-7a76-468d-a873-08dcf516fc01
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2024 17:03:44.7680 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MEZ4eNZCRQdbwEeogQl1MFiwNAddkHrXORn81m5XcFjdrldCPjy3o2PFUsczjvmQC+IgFO14CzWsVeuHtUis9MSACS8uA/L3x5s+ohtkmTY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4655
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

On Fri, Oct 25, 2024 at 02:52:38PM +0530, Raag Jadav wrote:
> Current implementation adds multiple sysfs entries for getting GT
> throttle status and its reasons, which forces the user to read multiple
> entries for evaluating the result. Since output of each entry is based
> on the same underlying hardware register and considering the access type
> of this register is RO/v, the value of this register can change at any
> given point, even between subsequent sysfs reads. This makes current
> implementation fundamentally flawed which can produce inconsistent results.
> 
> Rework throttle ABI and introduce throttle_status attribute which will
> provide throttle status through a oneshot register read, making it
> relatively less error prone. The new ABI will provide throttle reasons
> in a string based list based on the respective bits which are set in the
> hardware. Empty output means no bits are set and hence no throttling.

But the old ABI is already released, and we have platforms with
force_probe lifted already.  Presumably userspace software is already
using the existing interface (otherwise it never would have been allowed
to land upstream), so that means we can't change it in incompatible ways
anymore; we're locked into supporting the current interface forever on
these platforms.

We can change the ABI for _future_ platforms if it makes sense, but it's
too late to make compatibility-breaking changes for LNL and BMG.

> 
> $ cat /sys/devices/.../tile0/gt0/freq0/throttle_status
> prochot
> thermal
> ratl
> thermalert
> tdc
> pl4
> pl1
> pl2
> 
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2810

I'm not sure what this ticket is about, but it was already closed
several weeks ago due to no longer reproducing.  The ABI change here
doesn't seem to be directly related to this ticket.


Matt

> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_throttle.c | 219 ++++------------------------
>  1 file changed, 31 insertions(+), 188 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_throttle.c b/drivers/gpu/drm/xe/xe_gt_throttle.c
> index 03b225364101..ba8bba7721ef 100644
> --- a/drivers/gpu/drm/xe/xe_gt_throttle.c
> +++ b/drivers/gpu/drm/xe/xe_gt_throttle.c
> @@ -16,24 +16,23 @@
>  /**
>   * DOC: Xe GT Throttle
>   *
> - * Provides sysfs entries and other helpers for frequency throttle reasons in GT
> + * Provides sysfs entry for frequency throttle status and its reasons in GT
>   *
> - * device/gt#/freq0/throttle/status - Overall status
> - * device/gt#/freq0/throttle/reason_pl1 - Frequency throttle due to PL1
> - * device/gt#/freq0/throttle/reason_pl2 - Frequency throttle due to PL2
> - * device/gt#/freq0/throttle/reason_pl4 - Frequency throttle due to PL4, Iccmax etc.
> - * device/gt#/freq0/throttle/reason_thermal - Frequency throttle due to thermal
> - * device/gt#/freq0/throttle/reason_prochot - Frequency throttle due to prochot
> - * device/gt#/freq0/throttle/reason_ratl - Frequency throttle due to RATL
> - * device/gt#/freq0/throttle/reason_vr_thermalert - Frequency throttle due to VR THERMALERT
> - * device/gt#/freq0/throttle/reason_vr_tdc -  Frequency throttle due to VR TDC
> + * device/tile#/gt#/freq0/throttle_status - Throttle status and its reasons
>   */
>  
> -static struct xe_gt *
> -dev_to_gt(struct device *dev)
> -{
> -	return kobj_to_gt(dev->kobj.parent);
> -}
> +/* Available GT throttle reasons */
> +static const char *const throttle_reasons[] = {
> +	[ffs(PROCHOT_MASK) - 1]		= "prochot",
> +	[ffs(THERMAL_LIMIT_MASK) - 1]	= "thermal",
> +	[ffs(RATL_MASK) - 1]		= "ratl",
> +	[ffs(VR_THERMALERT_MASK) - 1]	= "thermalert",
> +	[ffs(VR_TDC_MASK) - 1]		= "tdc",
> +	[ffs(POWER_LIMIT_4_MASK) - 1]	= "pl4",
> +	[ffs(POWER_LIMIT_1_MASK) - 1]	= "pl1",
> +	[ffs(POWER_LIMIT_2_MASK) - 1]	= "pl2",
> +};
> +static_assert(ARRAY_SIZE(throttle_reasons) == ffs(POWER_LIMIT_2_MASK));
>  
>  u32 xe_gt_throttle_get_limit_reasons(struct xe_gt *gt)
>  {
> @@ -49,191 +48,35 @@ u32 xe_gt_throttle_get_limit_reasons(struct xe_gt *gt)
>  	return reg;
>  }
>  
> -static u32 read_status(struct xe_gt *gt)
> +static ssize_t throttle_status_show(struct device *dev, struct device_attribute *attr, char *buf)
>  {
> -	u32 status = xe_gt_throttle_get_limit_reasons(gt) & GT0_PERF_LIMIT_REASONS_MASK;
> +	struct xe_gt *gt = kobj_to_gt(dev->kobj.parent);
> +	unsigned long status;
> +	const char *reason;
> +	u32 index, count = 0;
>  
> -	return status;
> -}
> -
> -static u32 read_reason_pl1(struct xe_gt *gt)
> -{
> -	u32 pl1 = xe_gt_throttle_get_limit_reasons(gt) & POWER_LIMIT_1_MASK;
> -
> -	return pl1;
> -}
> -
> -static u32 read_reason_pl2(struct xe_gt *gt)
> -{
> -	u32 pl2 = xe_gt_throttle_get_limit_reasons(gt) & POWER_LIMIT_2_MASK;
> -
> -	return pl2;
> -}
> -
> -static u32 read_reason_pl4(struct xe_gt *gt)
> -{
> -	u32 pl4 = xe_gt_throttle_get_limit_reasons(gt) & POWER_LIMIT_4_MASK;
> -
> -	return pl4;
> -}
> -
> -static u32 read_reason_thermal(struct xe_gt *gt)
> -{
> -	u32 thermal = xe_gt_throttle_get_limit_reasons(gt) & THERMAL_LIMIT_MASK;
> -
> -	return thermal;
> -}
> -
> -static u32 read_reason_prochot(struct xe_gt *gt)
> -{
> -	u32 prochot = xe_gt_throttle_get_limit_reasons(gt) & PROCHOT_MASK;
> -
> -	return prochot;
> -}
> -
> -static u32 read_reason_ratl(struct xe_gt *gt)
> -{
> -	u32 ratl = xe_gt_throttle_get_limit_reasons(gt) & RATL_MASK;
> -
> -	return ratl;
> -}
> -
> -static u32 read_reason_vr_thermalert(struct xe_gt *gt)
> -{
> -	u32 thermalert = xe_gt_throttle_get_limit_reasons(gt) & VR_THERMALERT_MASK;
> -
> -	return thermalert;
> -}
> -
> -static u32 read_reason_vr_tdc(struct xe_gt *gt)
> -{
> -	u32 tdc = xe_gt_throttle_get_limit_reasons(gt) & VR_TDC_MASK;
> -
> -	return tdc;
> -}
> +	status = xe_gt_throttle_get_limit_reasons(gt) & GT0_PERF_LIMIT_REASONS_MASK;
>  
> -static ssize_t status_show(struct device *dev,
> -			   struct device_attribute *attr,
> -			   char *buff)
> -{
> -	struct xe_gt *gt = dev_to_gt(dev);
> -	bool status = !!read_status(gt);
> -
> -	return sysfs_emit(buff, "%u\n", status);
> -}
> -static DEVICE_ATTR_RO(status);
> -
> -static ssize_t reason_pl1_show(struct device *dev,
> -			       struct device_attribute *attr,
> -			       char *buff)
> -{
> -	struct xe_gt *gt = dev_to_gt(dev);
> -	bool pl1 = !!read_reason_pl1(gt);
> -
> -	return sysfs_emit(buff, "%u\n", pl1);
> -}
> -static DEVICE_ATTR_RO(reason_pl1);
> -
> -static ssize_t reason_pl2_show(struct device *dev,
> -			       struct device_attribute *attr,
> -			       char *buff)
> -{
> -	struct xe_gt *gt = dev_to_gt(dev);
> -	bool pl2 = !!read_reason_pl2(gt);
> -
> -	return sysfs_emit(buff, "%u\n", pl2);
> -}
> -static DEVICE_ATTR_RO(reason_pl2);
> -
> -static ssize_t reason_pl4_show(struct device *dev,
> -			       struct device_attribute *attr,
> -			       char *buff)
> -{
> -	struct xe_gt *gt = dev_to_gt(dev);
> -	bool pl4 = !!read_reason_pl4(gt);
> -
> -	return sysfs_emit(buff, "%u\n", pl4);
> -}
> -static DEVICE_ATTR_RO(reason_pl4);
> -
> -static ssize_t reason_thermal_show(struct device *dev,
> -				   struct device_attribute *attr,
> -				   char *buff)
> -{
> -	struct xe_gt *gt = dev_to_gt(dev);
> -	bool thermal = !!read_reason_thermal(gt);
> -
> -	return sysfs_emit(buff, "%u\n", thermal);
> -}
> -static DEVICE_ATTR_RO(reason_thermal);
> -
> -static ssize_t reason_prochot_show(struct device *dev,
> -				   struct device_attribute *attr,
> -				   char *buff)
> -{
> -	struct xe_gt *gt = dev_to_gt(dev);
> -	bool prochot = !!read_reason_prochot(gt);
> -
> -	return sysfs_emit(buff, "%u\n", prochot);
> -}
> -static DEVICE_ATTR_RO(reason_prochot);
> -
> -static ssize_t reason_ratl_show(struct device *dev,
> -				struct device_attribute *attr,
> -				char *buff)
> -{
> -	struct xe_gt *gt = dev_to_gt(dev);
> -	bool ratl = !!read_reason_ratl(gt);
> -
> -	return sysfs_emit(buff, "%u\n", ratl);
> -}
> -static DEVICE_ATTR_RO(reason_ratl);
> -
> -static ssize_t reason_vr_thermalert_show(struct device *dev,
> -					 struct device_attribute *attr,
> -					 char *buff)
> -{
> -	struct xe_gt *gt = dev_to_gt(dev);
> -	bool thermalert = !!read_reason_vr_thermalert(gt);
> -
> -	return sysfs_emit(buff, "%u\n", thermalert);
> -}
> -static DEVICE_ATTR_RO(reason_vr_thermalert);
> -
> -static ssize_t reason_vr_tdc_show(struct device *dev,
> -				  struct device_attribute *attr,
> -				  char *buff)
> -{
> -	struct xe_gt *gt = dev_to_gt(dev);
> -	bool tdc = !!read_reason_vr_tdc(gt);
> +	for_each_set_bit(index, &status, ffs(POWER_LIMIT_2_MASK)) {
> +		reason = throttle_reasons[index];
> +		if (reason)
> +			count += sysfs_emit_at(buf, count, "%s\n", reason);
> +	}
>  
> -	return sysfs_emit(buff, "%u\n", tdc);
> +	return count;
>  }
> -static DEVICE_ATTR_RO(reason_vr_tdc);
> +static DEVICE_ATTR_RO(throttle_status);
>  
> -static struct attribute *throttle_attrs[] = {
> -	&dev_attr_status.attr,
> -	&dev_attr_reason_pl1.attr,
> -	&dev_attr_reason_pl2.attr,
> -	&dev_attr_reason_pl4.attr,
> -	&dev_attr_reason_thermal.attr,
> -	&dev_attr_reason_prochot.attr,
> -	&dev_attr_reason_ratl.attr,
> -	&dev_attr_reason_vr_thermalert.attr,
> -	&dev_attr_reason_vr_tdc.attr,
> +static const struct attribute *throttle_attrs[] = {
> +	&dev_attr_throttle_status.attr,
>  	NULL
>  };
>  
> -static const struct attribute_group throttle_group_attrs = {
> -	.name = "throttle",
> -	.attrs = throttle_attrs,
> -};
> -
>  static void gt_throttle_sysfs_fini(void *arg)
>  {
>  	struct xe_gt *gt = arg;
>  
> -	sysfs_remove_group(gt->freq, &throttle_group_attrs);
> +	sysfs_remove_files(gt->freq, throttle_attrs);
>  }
>  
>  int xe_gt_throttle_init(struct xe_gt *gt)
> @@ -241,7 +84,7 @@ int xe_gt_throttle_init(struct xe_gt *gt)
>  	struct xe_device *xe = gt_to_xe(gt);
>  	int err;
>  
> -	err = sysfs_create_group(gt->freq, &throttle_group_attrs);
> +	err = sysfs_create_files(gt->freq, throttle_attrs);
>  	if (err)
>  		return err;
>  
> -- 
> 2.34.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
