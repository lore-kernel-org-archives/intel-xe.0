Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B2F0C25B77
	for <intel-xe@archiver.kernel.org>; Fri, 17 May 2024 21:57:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8D7110E29F;
	Fri, 17 May 2024 21:57:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NI+xUsRm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F8AF10E29F
 for <Intel-Xe@lists.freedesktop.org>; Fri, 17 May 2024 21:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715983078; x=1747519078;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=qGEMvnPqIjvup1j9uaNaRB9ysp0L4uaXw0cRVd9myJw=;
 b=NI+xUsRmSg7cywhe5nh+iFbfnIvbMeAPPi956e22IV7Py77acXzUYZnC
 Php0HqFRxJezTT6TY64hp5XQHZ05692JH5hJ4ec3jeOFQce2TnLHVbbyP
 1wAX9NURyMukhui5tgoYK0tjIlHVKx07pYikj7u/6X+38TUh469abAByZ
 s7oLARl9B6fmxA/M2FAOCPbAN3QQ1vB736Y8Jr6HyP6AKVsKeAN5CzWo2
 QAOlv4KmB92zJxe0yPGWTMzzQD14yIkZpqkyu9frxDKNWhnGT2SG9Oe9s
 EimQNYYpcPWGCwQZmNSETS5IxODUcvI8mYACRPtcZ2oUISbN6fudsBT5A w==;
X-CSE-ConnectionGUID: WDm/wHD/R1uji2la8pR13Q==
X-CSE-MsgGUID: 9tvl24bJSYWHAiyCefyfhA==
X-IronPort-AV: E=McAfee;i="6600,9927,11075"; a="16015005"
X-IronPort-AV: E=Sophos;i="6.08,168,1712646000"; d="scan'208";a="16015005"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2024 14:57:57 -0700
X-CSE-ConnectionGUID: Kqb8FutHQhSQyExrHJsCrw==
X-CSE-MsgGUID: 2H+8AibyTXiWwCCKpjEedw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,168,1712646000"; d="scan'208";a="63116501"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 May 2024 14:57:57 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 17 May 2024 14:57:56 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 17 May 2024 14:57:56 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 17 May 2024 14:57:56 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 17 May 2024 14:57:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CjTpM2iP1KLvC5ZJVn+sLSgXuRvrqc36Yvt3VTD/lkoIX0lww0EAXb3zBYjKRI9GEbUaikZkoSifMQXVKn3MWkVb8gSmQb8GX13mkf+4L1Q07zm1g6qOd4hpCh2TqlUqx6LmtFkgbGPmCNh9ZtcfBZsS6N3kMC6BotT2QH8w2VzHmFuI1EapYlGGEqCQSAPShrgm1N3fTGArG7BwAcMpKcpw9LyTQnwkl3gTxoHdL8GlGSyppOcOxYuhXaqHMPo5mJMwmvCgOupw8S/cgn2YKlVMJShNfg4/JI+b5aFcINW7Yeakw+I8Oe43HuPaXhr/aleMG0YQunYrjKAyMbqecg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=STvL81lfl1hEwoVNlp3CxkgbCYS7GGvsejK1dyKu0uk=;
 b=Cy9EWhXwdkX5fpagYP2V48wqAWf+nXnmmIr2vUMzwTZj0D9OWZSAwGoxWzg5Wp5+pFKS4lOKGlOxEGh8wga2S0mEuOEXMJ2hdMOFtEZAQhH5ch4nidCBLqOlPz/+MTPLyZik9qVgeJLVc0sfBr/LA7d4UasMb9pQCHHhlKzCuQoezssQLWb40B+BNgcPjIZLK4DM2aXF6hGAZT+waqMzEUOGIc2GZQ/JQjGK2AgxqsE287cT7X3T6PgSKnNuOJY6p9ekQ8XoXp2faZFSn8m5T2Yym1tJcIBRaUAQnwFWZG3q37vWIRU+6YhE1V1tibtkk3/e1ROUWpPontpW48xDOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.27; Fri, 17 May
 2024 21:57:54 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.7587.028; Fri, 17 May 2024
 21:57:54 +0000
Date: Fri, 17 May 2024 16:57:51 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <John.C.Harrison@intel.com>
CC: <Intel-Xe@lists.freedesktop.org>
Subject: Re: [PATCH v5 2/2] drm/xe/guc: Port over the slow GuC loading
 support from i915
Message-ID: <bkdt7nxfzgapofla5is2bwabdzqhocedwackbp4caj2v3go6fe@5lcjkpawbie3>
References: <20240409190516.2884064-1-John.C.Harrison@Intel.com>
 <20240409190516.2884064-3-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240409190516.2884064-3-John.C.Harrison@Intel.com>
X-ClientProxiedBy: MW4PR02CA0022.namprd02.prod.outlook.com
 (2603:10b6:303:16d::15) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CH0PR11MB5249:EE_
X-MS-Office365-Filtering-Correlation-Id: b317f3b4-2a43-4052-9a4f-08dc76bc675c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZzVygyjxdDyczus0BEN9Q18VE5t4YTNnJaWdCdlvHQvDLkPDNAc4ho4cKCMU?=
 =?us-ascii?Q?Gg9juu5SZN7z4F9edFUPdVFghFJSxHgvbh8ftTbSmGNLKUduGM9NL1RskFCv?=
 =?us-ascii?Q?rKw9B8cyM5xbU3iUnkqe0xQSEufnBks7FrozTfAjwCIlrbYizZJbK+2/3tsm?=
 =?us-ascii?Q?j5mVs9g/B/d48LbRzFaaTnwvdVnUa1XFPekTvC5cv7vfvQUmFBToMhFH6vRx?=
 =?us-ascii?Q?O7PAmYBUhchT/J1ooAwgH470sPXf/aK/Zl+DT0s92px5ExInZmr0Yaq5cXzn?=
 =?us-ascii?Q?Wj7ieBnuHWPgk5VL0r3eaKo1h63LV6G+zWEZAuFthy+pS86cjprreGONvsqx?=
 =?us-ascii?Q?i9vjEbaY1IZbV9y39i1+6lEc6YbWUD52mrugaoitGd03JBQBStmGjcVMni8E?=
 =?us-ascii?Q?5SL+A16HpXUV8W0/bW4NVviR4CQKgVYpUTQ/Z92omPGz9aJrEIy6NocbkdD3?=
 =?us-ascii?Q?mXYYjYPDSSdMW10mGNgwY6Xh6+l6Bz8++j05W/CYJefGEjMxjZubMUpxd6cz?=
 =?us-ascii?Q?MrTc1xzHghXL+PuVuflYrsDdU1wrCRGJRcaBzmKD2hImbie6PwL/v5m/b8OB?=
 =?us-ascii?Q?cXrfuF7eEezX2W1ItUiXe1KzHhgjS2xwySqARiz2lxjr/GSES7zVzK1oWL5L?=
 =?us-ascii?Q?zCNz4k9zqypd3vsvP/ey2ouOw4nR1nK1BEtNDK637VTJUT0hdgtgDXjZNvfx?=
 =?us-ascii?Q?lsEnT4z2+bSgMr0Qw9BFlbTjgq2/vOr9V/FZSSHYUO8Ik06SXy4r3RtjQKuI?=
 =?us-ascii?Q?mEtKPDk9idrqMF06efE5pN6CSohTibznwlRIhdfm6n9vXoOACKmgyj7tKUSa?=
 =?us-ascii?Q?oE3O+B4iIVhbj3qYx+Sdnx9A/vcjaGpTRynvWppIFAuOxUpvvjYk9cHouQxe?=
 =?us-ascii?Q?jAr/IV23lv1gXxhAgrNhrvsEof1FgSU/KCWd5tggQZfY5PKsNHHgOCtiHuqX?=
 =?us-ascii?Q?dwQeW1oo6bmoeaXT2FRRjiq2i28dqvRlnFSGIu3x1yT05eLZKGtLMcGcsbJa?=
 =?us-ascii?Q?Mj5Wb87zOzzAc9nEfgw4uY1XeQIUZDWwqqRDecTIZOWxfO7Bn1OBKUpMgILs?=
 =?us-ascii?Q?lE44LwLrvf0nLtDEagz5POPBdRjBhWlNUMlxB4FBOmw+9Q8uEW+vyzQ+xW1A?=
 =?us-ascii?Q?v3i5WHVF1UO6dBAhfcUobFspXIUSV908vuMVKamMTdIoZ6wp6jCVQtX2Gfdu?=
 =?us-ascii?Q?CyULbzbYyxGNGPi43viTSLmjw5dpc+gwtqKYcY2GBr+f9zmQ76Ctk+Zml4pQ?=
 =?us-ascii?Q?k6jOHOOkt0KaI7fECoWr1hJg7kMDPmOP90Zon1ByWA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gImXhaF6OxPKaVImc3Ob3axhBP0pFrFpCQ+JvzRO62Q1zLoq2JqrKxH6NwMi?=
 =?us-ascii?Q?HYn9kt6QTp4SkAB1Nx+t4smFxnqxyyUnWfBzKYkg/DvSqaPQpflnGwBerqnx?=
 =?us-ascii?Q?p6ikIW1+1xb2OXdc7tzbfOkQDNKMLWdUr77pKhd80e5h8ltpuPJGjvEONFTU?=
 =?us-ascii?Q?wuYgT9HPMpn6CNzxuWNrOm658ZoSIcmo9YM1Gc08Mol6fiE0k+vTRqGKJSkm?=
 =?us-ascii?Q?Pk/KpFhcDjKbO38BFxa/ULsOy6PP/jDtDkqUPAu92ymKxq+TIem9xGsAfcpz?=
 =?us-ascii?Q?QMdp63aC6u8MrYFGR5wbKvS9ssT08FqNgr4ZSwjkOQawcsnRBf3ev/gfWx0S?=
 =?us-ascii?Q?7zsHlIQUcZ4P/kr7sPVXzs6Nn+YYBUzQlYuTlGuce0RbU/mZox/fOXHBweYT?=
 =?us-ascii?Q?yX5yMhJpcAqYGlSNEk0nsAZZGEizpMA5hGOIyE3e/MBF/phG1nb+z63/MK41?=
 =?us-ascii?Q?sqwqXzSW4ItN/4Y0Fr1VGnMceF9IWduFKn7LKo5/dCAr2IMhuyW6HNpJNNLF?=
 =?us-ascii?Q?1wC15zv0NZbtK3yCNKjfKgmqueSfDFXO8HN+Y0BbLZfYAIMcRDbUMZgPeKS6?=
 =?us-ascii?Q?DwVPL8IlzKLxeumqoy+JhsnWKWvdinqnELAEK+mAJ9IGpvSK/3WBcYxozGLS?=
 =?us-ascii?Q?qCVcf3GySkRjvdJs5SRX/GsQItoFpQhE77SZu5FaaQoK2sfy+aWF3P6uJFS9?=
 =?us-ascii?Q?399fNjO3KLUWe2GGrJS8zVxZkjIq4/yUijR7Lt5nGmftcWDT70rSjhaOmJsg?=
 =?us-ascii?Q?X0dtrxQqBlHJTyOO/p1cXByO7tRWKsgAET/yytLnTfJQlqsadU0aImKq9iJJ?=
 =?us-ascii?Q?kFEqzKbbSIsDvp9whyCLsLsTI1lXc/B6Rj2u+8nAjRNr8YriftzpbyUJcyUu?=
 =?us-ascii?Q?Wyw4//U9z2FILwfPUKxSLfDsRLRxuMspG16JMQ2lkcb+dVT32VNUDzQ2p5SG?=
 =?us-ascii?Q?brZg+X9TIOz2Dp7KG4atSt+KemRTTYet3mYUqDKmvjgQPIhlncbQOeKynpGn?=
 =?us-ascii?Q?glnftFprqppIY3B0oCfKZc0OEoU4gcoRuJ11dCMGtVC3V0a9InQM6KHWbbxB?=
 =?us-ascii?Q?7SA5RDjgSx48qnw5HT4JpnR51usWrQ3uyRBK6XZkHkR6i73cS93ZYsgc2xON?=
 =?us-ascii?Q?jFVaHDNiGXRI6OGHHoKzRuzl9LnU7L18CijkOfLtT1QS8B1a+Bj93/k8rm2Y?=
 =?us-ascii?Q?SqV62OxvxEF4I6Ya73ctkYJJzYlFpBHcnKStlNMlro3xUG2RZQhRZpaW8YRf?=
 =?us-ascii?Q?gY6cycjwvvoUWCAK/lznDixIOYeTQVS+DMEi3dV+0ID+4K73PY8IBxi+MobW?=
 =?us-ascii?Q?FMcUGNteI8KKnKZDlXiOjacV0lJjzIKfsU5Ulmul1dZCbnv/4tqmsuE4wo0o?=
 =?us-ascii?Q?uJ4ChV/ySFCAnyarLUvPrejxtSkoHjR29E8Yy5FGy/NY0aTWhBtkQ+mw0hUt?=
 =?us-ascii?Q?DYPDAQiWDibhLZX/UOsPpAMOdSVZ1kCRxAgvwpPtYE3aCIkIypYrSSLxe0Hm?=
 =?us-ascii?Q?roVXRvsXpkl7Up/XL0i7RnScjaKtZAa8UKiTS4h9667BOKxMbfUX3gR5oKao?=
 =?us-ascii?Q?fEWoeQW8IfgOgq+RK1lVQ7535xWtB2IWD+4BCZi8NDXr/G8SgnLCAHaj/edN?=
 =?us-ascii?Q?/Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b317f3b4-2a43-4052-9a4f-08dc76bc675c
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2024 21:57:54.3996 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aep+jkOfKkAE64r/J+u4j3EhUQ2C8pI3rZHNVx6AI4Upynj+Xw7t2vUdlxRnUvC96g+SDvmVD9OPKtpV793YjqMCBc+3/IR3TC59vjGH7pM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5249
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

On Tue, Apr 09, 2024 at 12:05:14PM GMT, John.C.Harrison@Intel.com wrote:
>From: John Harrison <John.C.Harrison@Intel.com>
>
>GuC loading can take longer than it is supposed to for various
>reasons. So add in the code to cope with that and to report it when it
>happens. There are also many different reasons why GuC loading can
>fail, so add in the code for checking for those and for reporting
>issues in a meaningful manner rather than just hitting a timeout and
>saying 'fail: status = %x'.
>
>Also, remove the 'FIXME' comment about an i915 bug that has never been
>applicable to Xe!
>
>v2: Actually report the requested and granted frequencies rather than
>showing granted twice (review feedback from Badal).
>v3: Locally code all the timeout and end condition handling because a
>helper function is not allowed (review feedback from Lucas/Rodrigo).
>v4: Add more documentation comments and rename a define to add units
>(review feedback from Lucas).
>
>Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>---

...

> static int guc_wait_ucode(struct xe_guc *guc)
> {
> 	struct xe_gt *gt = guc_to_gt(guc);
>-	u32 status;
>-	int ret;
>-
>+	struct xe_guc_pc *guc_pc = &gt->uc.guc.pc;
>+	ktime_t before, after, delta;
>+	int load_done;
>+	u32 status = 0;
>+	int ret, count;
>+	u64 delta_ms;
>+	u32 before_freq;
>+
>+	before_freq = xe_guc_pc_get_act_freq(guc_pc);
>+	before = ktime_get();
> 	/*
>-	 * Wait for the GuC to start up.
>-	 * NB: Docs recommend not using the interrupt for completion.
>-	 * Measurements indicate this should take no more than 20ms
>-	 * (assuming the GT clock is at maximum frequency). So, a
>-	 * timeout here indicates that the GuC has failed and is unusable.
>-	 * (Higher levels of the driver may decide to reset the GuC and
>-	 * attempt the ucode load again if this happens.)
>-	 *
>-	 * FIXME: There is a known (but exceedingly unlikely) race condition
>-	 * where the asynchronous frequency management code could reduce
>-	 * the GT clock while a GuC reload is in progress (during a full
>-	 * GT reset). A fix is in progress but there are complex locking
>-	 * issues to be resolved. In the meantime bump the timeout to
>-	 * 200ms. Even at slowest clock, this should be sufficient. And
>-	 * in the working case, a larger timeout makes no difference.
>+	 * Note, can't use any kind of timing information from the call to xe_mmio_wait.
>+	 * It could return a thousand intermediate stages at random times. Instead, must
>+	 * manually track the total time taken and locally implement the timeout.

I went to see the v4 because after reading this I had the impression we
had already talked about how to improve it. Honestly reading the
changelog in the cover letter ("helper functions are not allowed") and
the replies to v4 it doesn't seem there's a willingness to improve our
abstraction. Instead it seems we are shoving more code and "let
maintainers rewrite the damn thing later".  This is not a recipe to get
code accepted.

Sometimes horrible code that works is better than one that doesn't. Sometimes.
But it's also good when we try our best to improve the abstractions.

...

>+/**
>+ * xe_mmio_wait32_not() - Wait for a register to return anything other than the given masked value
>+ * @gt: MMIO target GT
>+ * @reg: register to read value from
>+ * @mask: mask to be applied to the value read from the register
>+ * @val: value to match after applying the mask
>+ * @timeout_us: time out after this period of time. Wait logic tries to be
>+ * smart, applying an exponential backoff until @timeout_us is reached.
>+ * @out_val: if not NULL, points where to store the last unmasked value
>+ * @atomic: needs to be true if calling from an atomic context
>+ *
>+ * This function polls for a masked value to change from a given value and
>+ * returns zero on success or -ETIMEDOUT if timed out.
>+ *
>+ * Note that @timeout_us represents the minimum amount of time to wait before
>+ * giving up. The actual time taken by this function can be a little more than
>+ * @timeout_us for different reasons, specially in non-atomic contexts. Thus,
>+ * it is possible that this function succeeds even after @timeout_us has passed.
>+ */
>+int xe_mmio_wait32_not(struct xe_gt *gt, struct xe_reg reg, u32 mask, u32 val, u32 timeout_us,
>+		       u32 *out_val, bool atomic)
>+{
>+	ktime_t cur = ktime_get_raw();
>+	const ktime_t end = ktime_add_us(cur, timeout_us);
>+	int ret = -ETIMEDOUT;
>+	s64 wait = 10;
>+	u32 read;
>+
>+	for (;;) {
>+		read = xe_mmio_read32(gt, reg);
>+		if ((read & mask) != val) {
>+			ret = 0;
>+			break;
>+		}
>+
>+		cur = ktime_get_raw();
>+		if (!ktime_before(cur, end))
>+			break;
>+
>+		if (ktime_after(ktime_add_us(cur, wait), end))
>+			wait = ktime_us_delta(end, cur);
>+
>+		if (atomic)
>+			udelay(wait);
>+		else
>+			usleep_range(wait, wait << 1);
>+		wait <<= 1;
>+	}
>+
>+	if (ret != 0) {
>+		read = xe_mmio_read32(gt, reg);
>+		if ((read & mask) == val)

did you mean != here?		  ^

with that fixed,

|	Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
