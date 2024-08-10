Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AC66C3DA4A
	for <intel-xe@archiver.kernel.org>; Sat, 10 Aug 2024 05:16:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F231D10E083;
	Sat, 10 Aug 2024 05:16:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B2yu5JC+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4492710E083
 for <intel-xe@lists.freedesktop.org>; Sat, 10 Aug 2024 05:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723266998; x=1754802998;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=FjksFCcmPIRZQ6UW37WeITp+SR66fCfeexZPuSfqpl8=;
 b=B2yu5JC+s+YE5N1C36J86xDRicMxru4MGcHPh4ofJg3AmO3BW8NdRoON
 /iHTa2i3OBVR+6dRYFTBj+fkuDEZAneP0B7okj+85iJyKoNKUSan2OyjA
 r1madyN25RGrbzMdFxOfwguQYy9lvV7kC06zdlssUtB7fj/4P980slPLb
 Y3AD2XNNRm56LX8Iraa84hMMi0Nwcbqxw0Yq0TRlTFy8acOSF0Tp8UwVQ
 Pfy+y4zGtYEKjX5+MTJnbjk4NnG7xgF84wqXPpKYY9qvoRyOSv+7Mdaqv
 BSMlkHxPTPdOlgv5CVSVqlSRRNmQm/ISQK/tC5+C5XnWm5sVkDEv9fCHF Q==;
X-CSE-ConnectionGUID: pC6YpXKvRsWMLtAj4pSAFg==
X-CSE-MsgGUID: T5OJSvlVRwWQvmAb34fLAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11159"; a="21012021"
X-IronPort-AV: E=Sophos;i="6.09,278,1716274800"; d="scan'208";a="21012021"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 22:16:37 -0700
X-CSE-ConnectionGUID: FxJXrYbDSe+L6+ZN5TTrrg==
X-CSE-MsgGUID: diBSv95SRMKXJD0fiwy4zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,278,1716274800"; d="scan'208";a="58324795"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Aug 2024 22:16:37 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 9 Aug 2024 22:16:36 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 9 Aug 2024 22:16:36 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 9 Aug 2024 22:16:36 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.46) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 9 Aug 2024 22:16:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nZwF/Ms9HE6DQv5cLN1T5P4YzBdw3hGbYAf4+aQtVQtG7FvruYvDjvESNifxuA9ETYV/5XU/fY7zEykYQXQqPnSC469UdFWsBBzkF9ARvM2c0/rehMwlQWY5lJXYOmrlAFaAtROsVM3j8gBeVD61wP+r9y6r4nI26O/6oW+Fpf6N5/hrFMP7C1e0MkYNnQO1bV8gJQeNphRc6hZ0sFfdNuYa6JDU+K7iLLAAmfSFiqfZsGDJMGxliwXTkoG2DXn/Tt10Gfv7zVebsKMU5fPOsfKI52j68t+/aY+/WygHzVmTOyYHxMTMbOoEBbCtYW/tnN0/xtPvdJE4F0AUrdA6SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LAsZ/bR35DCLuPzEhZTsP/IUYlFa0Qs2vGeWt1Q4beU=;
 b=YSAokslMU1iX94/9DSVWrv18XQq2okw8q1apjsIVpJr9bhXwImtWw1vojJrc7NrYv2Q100HfrwGX+b24ou0moj4uTZpl6bYCK2ide1Mcw2uMJaxXQzv0/9cIxythNgZa7qi1T/+SqEu0fF6e+GclNfM/q1JM8rHwRImrRAaOfOKa3znAekabk7g+4rKA2av5jzV0q50xcd6Vw/QCxUQVzE11cFQHmObi70sUjgq62lZxGpueWu2qGmduPaQW1aMWWv5D34wZwfM8zV++FC8pjIze/2xmdI0k04JTFPDGApDhTgNVEAoUXpMVZCM3wj6RLapNbiAwV6o2dQxXjLNkKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW4PR11MB6837.namprd11.prod.outlook.com (2603:10b6:303:221::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.23; Sat, 10 Aug
 2024 05:16:33 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7828.023; Sat, 10 Aug 2024
 05:16:32 +0000
Date: Sat, 10 Aug 2024 00:16:32 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [RFC PATCH 1/1] drm/xe: Add driver load error injection
Message-ID: <sm7bvlh4s6djffddiywpjuboui6qdzcww3pjvtybt46c2xbp5f@c3s4vcaqe3ja>
References: <20240809224424.3212551-1-matthew.brost@intel.com>
 <20240809224424.3212551-2-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240809224424.3212551-2-matthew.brost@intel.com>
X-ClientProxiedBy: MW4PR03CA0321.namprd03.prod.outlook.com
 (2603:10b6:303:dd::26) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW4PR11MB6837:EE_
X-MS-Office365-Filtering-Correlation-Id: 223192d4-c56c-4ba0-cdec-08dcb8fb9913
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?a7W4b8qi89pXd4QFoQ73YSR2K4rdClUBVUGSN3SiZVnyvQyNghIVefA6pDUL?=
 =?us-ascii?Q?aJCpTkgevMO3UxQq39XbGbGN7hUx0rrZnChH3zVdkI1on57FJ5ANkASZ2PXT?=
 =?us-ascii?Q?8c1ZWRpZdJc76cxex6YsIky0lJMZSorgPlsY/5ZGeMSLjQSkhoOwYte9JWBW?=
 =?us-ascii?Q?OZ0yw5/MMcA0iYOFCc4cwH6ycycj5gfCzk5wqf/tpQHMK9k+JxSs8NRU+NNP?=
 =?us-ascii?Q?JgrHREe1SpWQiXfvKDmXENXfn2SSnD58vYGQ3W+hsgRfyQhaFfym08FGKhaO?=
 =?us-ascii?Q?ze07wlhki0CmcUhE6NEroU4AOlitlvuQ33LwB1g4mg7vYlWBhDdFUCzUub0T?=
 =?us-ascii?Q?PI9h33Z7STsjxcC0PJ86pKpGTGKGg/v6r3847Mm79n45NpKKSLCXMfbzJ4hk?=
 =?us-ascii?Q?1rgzbL2kYtyp+hZDJPsib8lMXqdGbs4EcsZ5sRyAdL3ndCQ3IBpznM0UULSL?=
 =?us-ascii?Q?P7OEtpqoa1UxxXG1nPucEK29ezIW7Q/K/a0fFsaNoMHlZ+giRYBH00Uo4WW/?=
 =?us-ascii?Q?SjY5MHerz/QfQDJkH6z5bilOHfjwrIq8GxTXTc5ZH8ofaacFaYeHdpMZQ5eu?=
 =?us-ascii?Q?Eg6b5Xcd8kLsQtmQfzZ0IbYxL+i5HBOtwwSPPfLbrmCqWlY/Z0KDAoxb5Jkd?=
 =?us-ascii?Q?9+b+uzHVdXVvV/jNfEzg3j8bwZGofEIqiB+Ir+LKsK4ECuIwWq5nxAUeHyp8?=
 =?us-ascii?Q?FQkzbN1/SrPmYfP+mI/qWt2qg1mrMeit8b6uASN4F1kfaJK0sn8h5rzV42Wt?=
 =?us-ascii?Q?LtUNclxc+XaFFt3Ga7+XKfuB3fG9sbWLeQZ4gSqppQYzhUJofyJXXBh1/fs0?=
 =?us-ascii?Q?Nud3otX0NPDDWrNss5+kKqTKOer5RWdyZMmS+xD3nKMz+6SUp67itMQ3ZNZx?=
 =?us-ascii?Q?GQ49riS+smgjLu5nDAABUg3oU0p4vywSmgWEExvC6dqFhdAlyIZGoFrAk00Q?=
 =?us-ascii?Q?xJ6ZMmWIM8odJ8/vxT1hVMsFqty7w+GB/O97GZJVbck0VbtGzWr9JM8Vsvl7?=
 =?us-ascii?Q?qJec5oHeWQsqEWhogzhx7TNQbdrh9loEF1WsZU21TcO1+Bf81/l/3l/GLZwy?=
 =?us-ascii?Q?IjJRCe5LPVm5cZjwaCi2SxaXoy1tlbLt3711j9hoKDOtZ15lclzGh1avoWxp?=
 =?us-ascii?Q?slc01MW9+r+kMQFNQ0dVGohJd94XrJEIMVVVjPXfuQr8ZU9Ww/PVaRSBB8tR?=
 =?us-ascii?Q?1w79hIEshYQIkiF/N0PcsAMs+b8ZWopxaQOlXqkb8y3gsHR6bXae+SVzpyXh?=
 =?us-ascii?Q?K9MfQRUT0gSmeB3LqDGM8t0dKLP/J0BtLZT+5AdUcXeDybjIqDgIviFiiTJ1?=
 =?us-ascii?Q?mo4bRSwVvEf9PbP05pHjIOfbp0mFTok4Kv8h5l67G5JBbQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2dx1pKcrhuv4Hb0vgnhakhO3gFsRWE5y1tijzUK8N6fGxfzjPO9tU0YFHF0s?=
 =?us-ascii?Q?nCQSsCNVV7Wxv2j21H3unFXWsmNP+ygUtn6DbB7vUllNSRS6i0ZDjphcPAh9?=
 =?us-ascii?Q?dAh63X3ufSbwYgsDgXRNZlhB6b8vLj9+OIlQ6Rwl0n80mFYF4C9eP/6T9Mpv?=
 =?us-ascii?Q?RyYITY2xqLuFHeC7/LJK4TVGk8CFGL6P2Z/hS9ofO8M6femyDAogVqHmIqH0?=
 =?us-ascii?Q?AzXELCsEgQ10UUaOu8Iee6nwZxoqndQxEXsR9zDGA6y3rTp1bcGYB+X88FAE?=
 =?us-ascii?Q?46n0bXqpbd7auWFAjYYOpQVFtNwfRyUyifa+soLWToJG+VhGQCPqC8RBksjp?=
 =?us-ascii?Q?Sn+/PvZmxLYSAgE4uxrOo8jXpPzC/yE6+IgMe3BUfH3sMT/tsrzKkToAzqEj?=
 =?us-ascii?Q?J8FN5uP8p5wZam+0CST8obknaCd2qA1Hrsud4thi71qWGAFJE1J635Xsbja0?=
 =?us-ascii?Q?iWkUS7cQ3eKqSd/ayzLi2aEAUjiC6Jropz2BMZMCgeLZyt340Hy2MB/7EyjD?=
 =?us-ascii?Q?Eta3+6mn/31Gz/YmL2OBED7xHwaT4ogwcFJXNKCtWTrL8k+RxUUfBDL4H8/4?=
 =?us-ascii?Q?9eW2x6TocRcy+gr7JLVUSJ5BPnqQpYb4JRRD4nE2qq1oki48Xrcf6Nj4bURc?=
 =?us-ascii?Q?AjpvBqBEzQIyZ29tjaHFdcvOctWlcxSHqEOvAgk1f3gudugmBIMLvowMxSHH?=
 =?us-ascii?Q?UR3KPxfc3gRymjNXOK3B3x7jHyIsHHjADiF4kug8nAvWpFEAE2F2XuNup81w?=
 =?us-ascii?Q?qVhcqs5/rDEiLlTyvNx1LixY7J0A+nXZlJ854TwoPhngw3DosJgehdiyuRgk?=
 =?us-ascii?Q?vvAQqjMC60uJUwstmyb3UkQZV15fPsGXSl43Ey15+JsZ2+L3EJiAREz/nKID?=
 =?us-ascii?Q?UwNaha11i6vjixKvVDVfc9c4oNJavJ8R2j66ck7FSgi56OI0aZ3SUEP3tT5K?=
 =?us-ascii?Q?EngWRpuIrF8+O3vMcOwWwLDV6FdT4YAbn1UMTfWeyFzAc58rGdywE1fod9VT?=
 =?us-ascii?Q?l75RhsiE75HeKqIwT1F9fICzFk77qzr8HSUz4VbNpnSlGRvrCPkgjoItZxe6?=
 =?us-ascii?Q?arSBcRTjbtlT+yhzzNr9DTamUd84+qv2xc2263NA3Pj6unmgY5QUMei5mG5Q?=
 =?us-ascii?Q?7Lm8KA9MWQCUKHI+qyhm3OE1xspxPlResHiV5+KzWg+vDeN8PMaaCumVjKM5?=
 =?us-ascii?Q?L/obAeErSbC0ttx7/2Pn90P263FdWRUrvnXO5nroumb9fABIsUtOMPy+P/vv?=
 =?us-ascii?Q?XFI2szeI8qIjg5JzZrhV88CSSSQcMYdJpQKIihL8hzd9WjFKftPN+pgcQq3H?=
 =?us-ascii?Q?4g88CDt1nd1uenhkdvaFvKA0A/GEaW57aC+k2n3HnTpFJ8VxRFRnYN5WdAFd?=
 =?us-ascii?Q?t+IRbfDWLoCF1UCf/jcewP8wb3tCK3pSMUrjP2qkGzwC4llCm4cN9SyvtSMM?=
 =?us-ascii?Q?OSVEm0388RNieOK5XNvCG5wM0/JOObrYyjfX5Btun8FZLNGyUW/UOe/QVtRr?=
 =?us-ascii?Q?Zp5nSKNMj8iTrOs5Tbfl66p+TmnDzNCJFJLLbZJmmWL83huNAYTQR/SINi9/?=
 =?us-ascii?Q?6zJq5D1+w70oUiFwsDbJuFCCj4nzLK82xd9VL/6PLLiBdpYMLFbHekY51gBo?=
 =?us-ascii?Q?bg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 223192d4-c56c-4ba0-cdec-08dcb8fb9913
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2024 05:16:32.6083 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JdlKXJDrHcjhwKoaDaCLi9oPtUAzrSLiP/UjxDQwM8HK3hyYZzSgZt7beL/Br6PTMVCRwqu86PG5eOd3GiFZTRCB0TZ3l8xwEgI3Gg97zMs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6837
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

On Fri, Aug 09, 2024 at 03:44:24PM GMT, Matthew Brost wrote:
>Port over i915 driver load error injection.
>

I don't like much the manual approach, but it's better to get the driver
not exploding. Then we can think of replacing this.  Some comments below
as I think some of the checks are not right.


>Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>---
> drivers/gpu/drm/xe/xe_device.c       | 31 ++++++++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_device.h       | 15 ++++++++++++++
> drivers/gpu/drm/xe/xe_device_types.h |  4 ++++
> drivers/gpu/drm/xe/xe_gt.c           |  5 +++++
> drivers/gpu/drm/xe/xe_gt_sriov_pf.c  |  4 ++++
> drivers/gpu/drm/xe/xe_guc.c          |  8 +++++++
> drivers/gpu/drm/xe/xe_guc_ads.c      |  5 +++++
> drivers/gpu/drm/xe/xe_guc_ct.c       |  4 ++++
> drivers/gpu/drm/xe/xe_guc_log.c      |  5 +++++
> drivers/gpu/drm/xe/xe_mmio.c         |  5 +++++
> drivers/gpu/drm/xe/xe_module.c       |  5 +++++
> drivers/gpu/drm/xe/xe_module.h       |  3 +++
> drivers/gpu/drm/xe/xe_pci.c          |  9 ++++++++
> drivers/gpu/drm/xe/xe_pm.c           |  8 +++++++
> drivers/gpu/drm/xe/xe_sriov.c        |  8 ++++++-
> drivers/gpu/drm/xe/xe_tile.c         |  4 ++++
> drivers/gpu/drm/xe/xe_uc.c           |  4 ++++
> drivers/gpu/drm/xe/xe_wa.c           |  5 +++++
> drivers/gpu/drm/xe/xe_wopcm.c        |  4 ++++
> 19 files changed, 135 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>index 1aba6f9eaa19..f6cd13ed6d20 100644
>--- a/drivers/gpu/drm/xe/xe_device.c
>+++ b/drivers/gpu/drm/xe/xe_device.c
>@@ -374,6 +374,10 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
> 	if (WARN_ON(err))
> 		goto err;
>
>+	err = xe_device_inject_driver_load_error(xe);
>+	if (err)
>+		goto err;
>+
> 	return xe;
>
> err:
>@@ -477,6 +481,10 @@ static int xe_set_dma_info(struct xe_device *xe)
> 	if (err)
> 		goto mask_err;
>
>+	err = xe_device_inject_driver_load_error(xe);
>+	if (err)
>+		goto mask_err;
>+
> 	return 0;
>
> mask_err:
>@@ -580,6 +588,10 @@ int xe_device_probe_early(struct xe_device *xe)
> 	if (err)
> 		return err;
>
>+	err = xe_device_inject_driver_load_error(xe);
>+	if (err)
>+		return err;
>+
> 	xe->wedged.mode = xe_modparam.wedged_mode;
>
> 	return 0;
>@@ -995,3 +1007,22 @@ void xe_device_declare_wedged(struct xe_device *xe)
> 	for_each_gt(gt, xe, id)
> 		xe_gt_declare_wedged(gt);
> }
>+
>+#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>+int __xe_device_inject_driver_load_error(struct xe_device *xe, int err,
>+					 const char *func, int line)
>+{
>+        if (xe->inject_driver_load_error >= xe_modparam.inject_driver_load_error)
>+                return 0;
>+
>+        if (++xe->inject_driver_load_error < xe_modparam.inject_driver_load_error)
>+                return 0;
>+
>+        drm_info(&xe->drm, "Injecting failure %d at checkpoint %u [%s:%d]\n",
>+                 err, xe->inject_driver_load_error, func, line);

I wonder if it'd wouldn't be sufficient, for debugging sake to use
"... [%pF]", __builtin_return_address(0)

>+
>+        xe_modparam.inject_driver_load_error = 0;
>+        return err;
>+
>+}
>+#endif
>diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
>index db6cc8d0d6b8..4f7e9cdac9fe 100644
>--- a/drivers/gpu/drm/xe/xe_device.h
>+++ b/drivers/gpu/drm/xe/xe_device.h
>@@ -179,4 +179,19 @@ void xe_device_declare_wedged(struct xe_device *xe);
> struct xe_file *xe_file_get(struct xe_file *xef);
> void xe_file_put(struct xe_file *xef);
>
>+#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>+
>+int __xe_device_inject_driver_load_error(struct xe_device *xe, int err,
>+					 const char *func, int line);
>+
>+#define xe_device_inject_driver_load_error(__xe) \
>+	__xe_device_inject_driver_load_error(__xe, -ENODEV, __func__, __LINE__)

is -ENODEV the only error we may want to inject?

>+
>+#else
>+
>+#define xe_device_inject_driver_load_error(__xe) \
>+	({ BUILD_BUG_ON_INVALID(__xe); 0; })

if the suggestion above is not feasible, then maybe better to leave
this outside the ifdef and provide a dummy
__xe_device_inject_driver_load_error() so we type-check?  Or we can
type check manually too.

>+
>+#endif
>+
> #endif
>diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>index 5b7292a9a66d..3e620314eec2 100644
>--- a/drivers/gpu/drm/xe/xe_device_types.h
>+++ b/drivers/gpu/drm/xe/xe_device_types.h
>@@ -484,6 +484,10 @@ struct xe_device {
> 		int mode;
> 	} wedged;
>
>+#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>+	int inject_driver_load_error;
>+#endif
>+
> #ifdef TEST_VM_OPS_ERROR
> 	/**
> 	 * @vm_inject_error_position: inject errors at different places in VM
>diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>index 58895ed22f6e..8209079c0334 100644
>--- a/drivers/gpu/drm/xe/xe_gt.c
>+++ b/drivers/gpu/drm/xe/xe_gt.c
>@@ -389,6 +389,10 @@ int xe_gt_init_early(struct xe_gt *gt)
> 	xe_pcode_init(gt);
> 	spin_lock_init(&gt->global_invl_lock);
>
>+	err = xe_device_inject_driver_load_error(gt_to_xe(gt));

for the ones I check before this, things are ok. For this and some
below, I believe they are misplaced because this currently is not a
failure point. Adding a return error here is wrong IMO because it
changes the expectation: the function was expecting that after
xe_wa_init() there are no more failure points so nothing to unwind. If
you inject an error here, you may be then trying to fix a non-existent
bug.

 From what I can see, the a valid point to inject an error is always when
we are already checking for an error (and if we aren't then we should).
So they should be always in the pattern as the ones above...

	err = foo();
	if (err)
		return err;

	err = xe_device_inject_driver_load_error(xe);
	if (err)
		return err;

I think that also means we can do better:

	err = foo();
	err = xe_device_inject_driver_load_error(xe, err);
	if (err)
		return err;

And in xe_device_inject_driver_load_error() we implement it
to first check `err` and return it if != 0. This way we only even try to
inject errors in valid points, and don't risk getting problems if a
later patch mistakenly update the `return err;` with `goto fail;` in
one place and forgets the other.



>+	if (err)
>+		return err;
>+
> 	return 0;
> }
>
>@@ -570,6 +574,7 @@ int xe_gt_init_hwconfig(struct xe_gt *gt)
> 	xe_gt_topology_init(gt);
> 	xe_gt_mcr_init(gt);
>
>+	err = xe_device_inject_driver_load_error(gt_to_xe(gt));
> out_fw:
> 	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> out:
>diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
>index ef239440963c..897815ddf954 100644
>--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
>+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
>@@ -57,6 +57,10 @@ int xe_gt_sriov_pf_init_early(struct xe_gt *gt)
> 	if (err)
> 		return err;
>
>+	err = xe_device_inject_driver_load_error(gt_to_xe(gt));
>+	if (err)
>+		return err;
>+
> 	return 0;
> }
>
>diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>index de0fe9e65746..980691c178c4 100644
>--- a/drivers/gpu/drm/xe/xe_guc.c
>+++ b/drivers/gpu/drm/xe/xe_guc.c
>@@ -354,6 +354,10 @@ int xe_guc_init(struct xe_guc *guc)
> 	if (ret)
> 		goto out;
>
>+	ret = xe_device_inject_driver_load_error(guc_to_xe(guc));
>+	if (ret)
>+		goto out;
>+
> 	guc_init_params(guc);
>
> 	xe_guc_comm_init_early(guc);
>@@ -411,6 +415,10 @@ int xe_guc_init_post_hwconfig(struct xe_guc *guc)
> 	if (ret)
> 		return ret;
>
>+	ret = xe_device_inject_driver_load_error(guc_to_xe(guc));
>+	if (ret)
>+		return ret;
>+
> 	return xe_guc_ads_init_post_hwconfig(&guc->ads);
> }
>
>diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
>index d1902a8581ca..1944912ef9b8 100644
>--- a/drivers/gpu/drm/xe/xe_guc_ads.c
>+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
>@@ -402,6 +402,7 @@ int xe_guc_ads_init(struct xe_guc_ads *ads)
> 	struct xe_gt *gt = ads_to_gt(ads);
> 	struct xe_tile *tile = gt_to_tile(gt);
> 	struct xe_bo *bo;
>+	int err;
>
> 	ads->golden_lrc_size = calculate_golden_lrc_size(ads);
> 	ads->regset_size = calculate_regset_size(gt);
>@@ -416,6 +417,10 @@ int xe_guc_ads_init(struct xe_guc_ads *ads)
>
> 	ads->bo = bo;
>
>+	err = xe_device_inject_driver_load_error(xe);
>+	if (err)
>+		return err;
>+
> 	return 0;
> }
>
>diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
>index beeeb120d1fc..76a26aaabb13 100644
>--- a/drivers/gpu/drm/xe/xe_guc_ct.c
>+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>@@ -197,6 +197,10 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
> 	if (err)
> 		return err;
>
>+	err = xe_device_inject_driver_load_error(xe);
>+	if (err)
>+		return err;
>+
> 	xe_gt_assert(gt, ct->state == XE_GUC_CT_STATE_NOT_INITIALIZED);
> 	ct->state = XE_GUC_CT_STATE_DISABLED;
> 	return 0;
>diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
>index a37ee3419428..f26c37e3ee3a 100644
>--- a/drivers/gpu/drm/xe/xe_guc_log.c
>+++ b/drivers/gpu/drm/xe/xe_guc_log.c
>@@ -82,6 +82,7 @@ int xe_guc_log_init(struct xe_guc_log *log)
> 	struct xe_device *xe = log_to_xe(log);
> 	struct xe_tile *tile = gt_to_tile(log_to_gt(log));
> 	struct xe_bo *bo;
>+	int err;
>
> 	bo = xe_managed_bo_create_pin_map(xe, tile, guc_log_size(),
> 					  XE_BO_FLAG_SYSTEM |
>@@ -94,5 +95,9 @@ int xe_guc_log_init(struct xe_guc_log *log)
> 	log->bo = bo;
> 	log->level = xe_modparam.guc_log_level;
>
>+	err = xe_device_inject_driver_load_error(log_to_xe(log));
>+	if (err)
>+		return err;
>+
> 	return 0;
> }
>diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
>index bdcc7282385c..1d52b1f57f4c 100644
>--- a/drivers/gpu/drm/xe/xe_mmio.c
>+++ b/drivers/gpu/drm/xe/xe_mmio.c
>@@ -136,6 +136,11 @@ int xe_mmio_probe_tiles(struct xe_device *xe)
> {
> 	size_t tile_mmio_size = SZ_16M;
> 	size_t tile_mmio_ext_size = xe->info.tile_mmio_ext_size;
>+	int err;
>+
>+	err = xe_device_inject_driver_load_error(xe);
>+	if (err)
>+		return err;

yeah... I think this is a valid one, because it means
"handle errors from this function". As long as it's the very first thing
in a function, not leaving side effects, it should be fine, And in this
case I'd do:

	err = xe_device_inject_driver_load_error(xe, 0);

to follow the logic I mentioned previously.

>
> 	mmio_multi_tile_setup(xe, tile_mmio_size);
> 	mmio_extension_setup(xe, tile_mmio_size, tile_mmio_ext_size);
>diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
>index 7bb99e451fcc..972b64a9f514 100644
>--- a/drivers/gpu/drm/xe/xe_module.c
>+++ b/drivers/gpu/drm/xe/xe_module.c
>@@ -53,6 +53,11 @@ module_param_named_unsafe(force_probe, xe_modparam.force_probe, charp, 0400);
> MODULE_PARM_DESC(force_probe,
> 		 "Force probe options for specified devices. See CONFIG_DRM_XE_FORCE_PROBE for details.");
>
>+#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>+module_param_named_unsafe(inject_driver_load_error, xe_modparam.inject_driver_load_error, int, 0600);
>+MODULE_PARM_DESC(inject_driver_load_error, "Inject driver load error");

hum... are we doing this when loading the module?  I guess
inject_driver_probe_error would be better as those tests are not per
module but per device (and instead of modprobe, we could test by
doing bind/unbind).

thanks
Lucas De Marchi

>+#endif
>+
> #ifdef CONFIG_PCI_IOV
> module_param_named(max_vfs, xe_modparam.max_vfs, uint, 0400);
> MODULE_PARM_DESC(max_vfs,
>diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
>index 61a0d28a28c8..409ea10be942 100644
>--- a/drivers/gpu/drm/xe/xe_module.h
>+++ b/drivers/gpu/drm/xe/xe_module.h
>@@ -20,6 +20,9 @@ struct xe_modparam {
> 	char *force_probe;
> #ifdef CONFIG_PCI_IOV
> 	unsigned int max_vfs;
>+#endif
>+#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>+	int inject_driver_load_error;
> #endif
> 	int wedged_mode;
> };
>diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>index f818aa69f3ca..8b278c83128a 100644
>--- a/drivers/gpu/drm/xe/xe_pci.c
>+++ b/drivers/gpu/drm/xe/xe_pci.c
>@@ -629,6 +629,10 @@ static int xe_info_init_early(struct xe_device *xe,
> 	if (err)
> 		return err;
>
>+	err = xe_device_inject_driver_load_error(xe);
>+	if (err)
>+		return err;
>+
> 	return 0;
> }
>
>@@ -645,6 +649,7 @@ static int xe_info_init(struct xe_device *xe,
> 	u32 graphics_gmdid_revid = 0, media_gmdid_revid = 0;
> 	struct xe_tile *tile;
> 	struct xe_gt *gt;
>+	int err;
> 	u8 id;
>
> 	/*
>@@ -745,6 +750,10 @@ static int xe_info_init(struct xe_device *xe,
> 		gt->info.id = xe->info.gt_count++;
> 	}
>
>+	err = xe_device_inject_driver_load_error(xe);
>+	if (err)
>+		return err;
>+
> 	return 0;
> }
>
>diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
>index 9f3c14fd9f33..64d992c12364 100644
>--- a/drivers/gpu/drm/xe/xe_pm.c
>+++ b/drivers/gpu/drm/xe/xe_pm.c
>@@ -231,6 +231,10 @@ int xe_pm_init_early(struct xe_device *xe)
> 	if (err)
> 		return err;
>
>+	err = xe_device_inject_driver_load_error(xe);
>+	if (err)
>+		return err;
>+
> 	return 0;
> }
>
>@@ -264,6 +268,10 @@ int xe_pm_init(struct xe_device *xe)
>
> 	xe_pm_runtime_init(xe);
>
>+	err = xe_device_inject_driver_load_error(xe);
>+	if (err)
>+		return err;
>+
> 	return 0;
> }
>
>diff --git a/drivers/gpu/drm/xe/xe_sriov.c b/drivers/gpu/drm/xe/xe_sriov.c
>index 5a1d65e4f19f..1e738f1d80df 100644
>--- a/drivers/gpu/drm/xe/xe_sriov.c
>+++ b/drivers/gpu/drm/xe/xe_sriov.c
>@@ -102,11 +102,17 @@ static void fini_sriov(struct drm_device *drm, void *arg)
>  */
> int xe_sriov_init(struct xe_device *xe)
> {
>+	int err;
>+
> 	if (!IS_SRIOV(xe))
> 		return 0;
>
>+	err = xe_device_inject_driver_load_error(xe);
>+	if (err)
>+		return err;
>+
> 	if (IS_SRIOV_PF(xe)) {
>-		int err = xe_sriov_pf_init_early(xe);
>+		err = xe_sriov_pf_init_early(xe);
>
> 		if (err)
> 			return err;
>diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
>index 15ea0a942f67..2d25c7b59b0d 100644
>--- a/drivers/gpu/drm/xe/xe_tile.c
>+++ b/drivers/gpu/drm/xe/xe_tile.c
>@@ -124,6 +124,10 @@ int xe_tile_init_early(struct xe_tile *tile, struct xe_device *xe, u8 id)
> 	if (IS_ERR(tile->primary_gt))
> 		return PTR_ERR(tile->primary_gt);
>
>+	err = xe_device_inject_driver_load_error(xe);
>+	if (err)
>+		return err;
>+
> 	return 0;
> }
>
>diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
>index 0d073a9987c2..a3786020838b 100644
>--- a/drivers/gpu/drm/xe/xe_uc.c
>+++ b/drivers/gpu/drm/xe/xe_uc.c
>@@ -62,6 +62,10 @@ int xe_uc_init(struct xe_uc *uc)
> 	if (ret)
> 		goto err;
>
>+	ret = xe_device_inject_driver_load_error(uc_to_xe(uc));
>+	if (ret)
>+		goto err;
>+
> 	return 0;
>
> err:
>diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
>index 564e32e44e3b..e558715d8027 100644
>--- a/drivers/gpu/drm/xe/xe_wa.c
>+++ b/drivers/gpu/drm/xe/xe_wa.c
>@@ -821,6 +821,7 @@ int xe_wa_init(struct xe_gt *gt)
> 	struct xe_device *xe = gt_to_xe(gt);
> 	size_t n_oob, n_lrc, n_engine, n_gt, total;
> 	unsigned long *p;
>+	int err;
>
> 	n_gt = BITS_TO_LONGS(ARRAY_SIZE(gt_was));
> 	n_engine = BITS_TO_LONGS(ARRAY_SIZE(engine_was));
>@@ -840,6 +841,10 @@ int xe_wa_init(struct xe_gt *gt)
> 	p += n_lrc;
> 	gt->wa_active.oob = p;
>
>+	err = xe_device_inject_driver_load_error(xe);
>+	if (err)
>+		return err;
>+
> 	return 0;
> }
>
>diff --git a/drivers/gpu/drm/xe/xe_wopcm.c b/drivers/gpu/drm/xe/xe_wopcm.c
>index d3a99157e523..edaad1c93e58 100644
>--- a/drivers/gpu/drm/xe/xe_wopcm.c
>+++ b/drivers/gpu/drm/xe/xe_wopcm.c
>@@ -263,6 +263,10 @@ int xe_wopcm_init(struct xe_wopcm *wopcm)
> 		return -E2BIG;
> 	}
>
>+	ret = xe_device_inject_driver_load_error(xe);
>+	if (ret)
>+		return ret;
>+
> 	if (!locked)
> 		ret = __wopcm_init_regs(xe, gt, wopcm);
>
>-- 
>2.34.1
>
