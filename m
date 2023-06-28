Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04B67EB64DA
	for <intel-xe@archiver.kernel.org>; Wed, 28 Jun 2023 17:52:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A348B10E371;
	Wed, 28 Jun 2023 17:52:12 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1AC910E0BA
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Jun 2023 17:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687974730; x=1719510730;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=K3WyxoWe8Hty2cVnFWjHNKpjsqAO6HPJ7acgaAe7+YY=;
 b=VnvjlTdNJNtYKQNbWvRR6/K/dRprdl1UrZEPeZMYaSi+UFQmtJ13c5pl
 szIcrSvUlunGfaTTJcjxqrsoEwvotYk902Fc+3Dj47X+ULOY18yc2Bq9m
 lT5DCkIOpx1O0awO7LVC6K+XqTRtaP1Zd7sYl24QUwX3ERf169G7Ck2Sk
 t7KkLzG4ijdfWoHWrflU8ErcSh8E9AwZSObEyoNtS09CDR7dYar1azF79
 U+yETNlm3ajFQGog8LVYF/k3Z4HURMZgcAheT2ERuasvN5MBM4qBEPqMB
 oIOfwqFUHdLz3QSdLAo5xY2bx6z8RESDmTkRE8NWoIHLTujVbS3k1VD5P Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="364468580"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; d="scan'208";a="364468580"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2023 10:52:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="694361491"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; d="scan'208";a="694361491"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga006.jf.intel.com with ESMTP; 28 Jun 2023 10:52:06 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 28 Jun 2023 10:52:06 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 28 Jun 2023 10:52:06 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 28 Jun 2023 10:52:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N4yHhaqzJ1W+omtv1zx6r0bwmDYduWJ+XwsfEjvljD1AmFleWMHRVHzbKdNA8stBMyRliMTuBNRzH1rLdveGVLuG7mkSXnavK1recVuhFekqV+eo9xYMS7okOLaPyD9BiQbBEFsA59i7vlD0q5/LGRHpG+Ia523SNDmiJvHFR3YCOGPie9TadmG+b0TkItkpjo9tJfIQTo84OpDpqhveeUB28Yx8rMbDFSGiwyKVSFOusn1bHJQZcbwtZuR//FpZd9U+Dyky8kpT6beyChyadWM7/XD+CEwg7wEQHaHeb6hOA7OX1kY4uWOipDEPYp5kok2ruzpWb1LRN+tv3dB0iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S3hu//58841H7+xH9awHMvGj2WGqSGo8Jh6s87F3SwE=;
 b=D9Gqs5dYTy2uQFNnjqU/9a56WEuyNiyyhRU4tXIteZJmPI09GAgIOUQVJ6DltLee0LhLPXTMdNYqgmIoJNgYhb+UVXBqymXZvQ3cmwj30Fgnp+b9Ldp7i+dRWvYZsTAeIHxZe0fJ6w7I4e8JleSEdFsOBMPJo/t9eCDakmWjyaflYgNPD+Ij8s7yUXtLPpAJFz5b7l65EVy9K5avI7aeqZiAzp9fAYKlkCREZQdCMtr2mP0cZA0bANxDDiurmSt6nUcJOytsMSgYuu2pB6T1NKt+QuiJyUZ42AWBxdahqK3+r3Dm0kD6M2MTVcMp3OKgDcNrK+8+VQ4vIIaHf46GCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB8090.namprd11.prod.outlook.com (2603:10b6:8:188::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Wed, 28 Jun
 2023 17:52:03 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%5]) with mapi id 15.20.6521.023; Wed, 28 Jun 2023
 17:52:03 +0000
Date: Wed, 28 Jun 2023 17:51:25 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Message-ID: <ZJxzHWRYLBq0+YbN@DUT025-TGLU.fm.intel.com>
References: <20230627222856.3165647-1-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230627222856.3165647-1-daniele.ceraolospurio@intel.com>
X-ClientProxiedBy: SJ0PR05CA0078.namprd05.prod.outlook.com
 (2603:10b6:a03:332::23) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB8090:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f2490e0-0d25-4556-f2c9-08db78006187
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bgudOPYQwbnE3fi1YmIqESLtqhW4Eq2+HWRakvLGICT+0Nn/jpvywxNF1ZwpfY6kSxp/9l/tP831O7HZF25bFYZqsw/k2bYUDrfA6t8qEitmXxMBKq58fv1shZq68gx8/ZJpynUCQHLvcj54altUxvUPUTNRfX2Qd2vO5L++S+8ABfSZpanlsTMnHzZYMQV96nuqXEA7ZpbHvTEdsfIekJkIe8kasXeMbshQJqPl4NuQtB6vCeF82X2BVkK6b99D3k7lc1bbGxD4OqZ7s0QauFwckSkF9AXx2+fL/jxmeW34t/xznzBwNkJv/dId9i04Prf/REpv84P8UcRFRycJbLUWtRgZd8FswIBu9buFQT7FXk3qMw1pbNHmiVFpu8xqY/Xh7dYTUqnyoeAp/nKUMcXlJj+gDSJTwG/TxzFVA5WqBlfU35uIP1r6CeGXc1JR8HESWpdfNxON019r+7EiRNNl0mhGlrOQ9A/g4EidK6rge58BVH9ztiXh93eQSZuzMrid6D45/Nre4VMBOaugjgbPj0JVnmQc4iqxm23qbW4DSNSzWTXVGdVfpLoxyWil9XPLqVMzdzqluD4fF7NS7mkZpL+DYvbjnnkgm3TO/QI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(396003)(376002)(136003)(366004)(39860400002)(451199021)(966005)(2906002)(478600001)(6486002)(6666004)(6506007)(26005)(83380400001)(186003)(6512007)(6862004)(44832011)(5660300002)(66946007)(316002)(38100700002)(4326008)(82960400001)(66556008)(8936002)(6636002)(86362001)(8676002)(66476007)(41300700001)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VvDG4ZETzWse+AAqpjZhAoe2AAQPiknerRlqPXzSdG6nrid4pSaw4cHLyoNl?=
 =?us-ascii?Q?xCArzstQoIGN6T1JnQsXzm63sXI3AHjFhg9ojEQAkigkirRADjfrg49V4esN?=
 =?us-ascii?Q?sfnns1K47HI/O0xRhpcWYO4F25rvccaCLtBd1wauTruZS+R54XOcvZiJ/m0S?=
 =?us-ascii?Q?SpY72ymxa/YJl2AUc7OGXi7+Ey5fdIZMaa9Ov/ixzj2RMs51Fr+tFF0u930P?=
 =?us-ascii?Q?bXe/1v/Prgxr1xO4zzhvpJGJlBQ65tpArYIjz0fJ/N5+4qX3oevBAH8dASXQ?=
 =?us-ascii?Q?SKrxQs21kYY60CAdh07hR22JK0iVaiLLxcYJwH+ljO2lbcuRe8WmDuKlFrnv?=
 =?us-ascii?Q?ZUey+giFW4GsXC/YNCM+RCrgxg8qMrveiLBB5sIe6a0xp11OcFNrVsktQXtj?=
 =?us-ascii?Q?pH3cckxXwumyItsL7JcwOpoh7fJ2IAGemAkOAz/Q0zqRNfQg+7XfowebfkN0?=
 =?us-ascii?Q?sgKhD8S6JRa/AOSMCretGsss7xUtm3F/2Zoj6pHE162zHMzV2STSGEk5pZRi?=
 =?us-ascii?Q?fQJi15Gq5smWe8qEUIHj1ijeQsMIUWFH5l6FFItGbTLs1Gztx771UXwrNFuV?=
 =?us-ascii?Q?JnHYo5Zfi6fslqmjD5MINi8mD+zBe/cv7ubGmku2+aNi0ZXMyegpUQ95dfdw?=
 =?us-ascii?Q?hss9/IYUIgMS0aEvMb1f+wm7d9aMCY+c1rbT3bo4tHjP24Jrks5uvw+upq06?=
 =?us-ascii?Q?7JHs47tdOTQlUGDJ2z3iQXQS03I+ohUwNSPaI3bin4s24cPLfZsiJFLeFDjc?=
 =?us-ascii?Q?O17cMFuN0SfufaZ1CLvLCu1HPHojkOcIYetn+BBkuH4cVmWl1lIezEMDVCBP?=
 =?us-ascii?Q?P/jPbzVow0adcXAOMhpX6JsxCV2GhxUxqAGTIeF54UDj4WQTIPyMgz6xyRlz?=
 =?us-ascii?Q?AYp5ryUI050pcq25zkTeQ58XCe09kqXwkk01qIkjwTpd14++rC3ne7OOn6Or?=
 =?us-ascii?Q?ERdFAqq1fiNUQb9Y4wZ3p3FwCy7/pK7Ksf3i547qmKnhgg2/m8ff0HZrEzX4?=
 =?us-ascii?Q?mVDFg6avMTIs4lvu5c7Uuox5ygruLtOIoYDe3hQFJXojT5Z4fnVSlg5WJ1Uh?=
 =?us-ascii?Q?AiznljVHWHJFODa/BrsLBYAJb3ckc5liJaNg2xGy0JFAG18Ybb06pZeheVHL?=
 =?us-ascii?Q?hDkJ5VgNWtP911OvR8HWb2AkvdIUeuhbg454PNgXzy5AodQ2ZZrG7e3LFQDR?=
 =?us-ascii?Q?T1IBlZS2aSgu+HrHR27kRtpD8AeUutWZl5M4unfNgS9scBTJ8WIpyF0DFzQ5?=
 =?us-ascii?Q?+GnXUUTMSJ9XF+GfAFVcx4IYw6ne9IcWNRpTSY9ErD/aKyO0qEs38jpUM5md?=
 =?us-ascii?Q?zq5rfkiQztEc6HO2ftuxjHfp9Rqf3vAiJwJZicqdNEi7C49bHbk0lrCWmQj6?=
 =?us-ascii?Q?cGXfttQAGGQOVI3t8xTatFJBYbSHvvJ3PHyG7+8Yhx1XP5pZZwHS1HFqzCzI?=
 =?us-ascii?Q?+fkScyrbmTL8tQo1SxnFaR1mIsf41q43b4sosUP2B0AgxP2KnGBvCQd+3jgV?=
 =?us-ascii?Q?Dl7HgfU59FbY9VwaUZU8qDVYv1lFgXDd7KDwcmxtLMvgnqvq6XtZIlcq1eEw?=
 =?us-ascii?Q?MhquvDPyRSiTOoPE0wfvTEXiWMYintZmqLQkQxlKVYOHlSl0f03YxsHliwY3?=
 =?us-ascii?Q?UQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f2490e0-0d25-4556-f2c9-08db78006187
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2023 17:52:03.6647 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f15VWPZ9e5klQAdpfjIChupT1rCM4UPo6LWZ5UtWxmLtu8JXhke64oRJDu0KlXhYjN897fFKLTDuj2XUctCuPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8090
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: fix HuC FW ordering for DG1
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Jun 27, 2023 at 03:28:56PM -0700, Daniele Ceraolo Spurio wrote:
> The firmware definitions must be ordered based on platform, from newer
> to older, which means that the DG1 FW must come before the ADL one.
> 
> References: https://gitlab.freedesktop.org/drm/intel/-/issues/8699
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_uc_fw.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
> index b05038921e02..1aa9a4925574 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> @@ -111,9 +111,9 @@ struct fw_blobs_by_type {
>  	fw_def(TIGERLAKE,	major_ver(i915,	guc,	tgl,	70, 5))
>  
>  #define XE_HUC_FIRMWARE_DEFS(fw_def, mmp_ver, no_ver)				\
> +	fw_def(DG1,		no_ver(i915,	huc,	dg1))			\
>  	fw_def(ALDERLAKE_P,	no_ver(i915,	huc,	tgl))			\
>  	fw_def(ALDERLAKE_S,	no_ver(i915,	huc,	tgl))			\
> -	fw_def(DG1,		no_ver(i915,	huc,	dg1))			\
>  	fw_def(ROCKETLAKE,	no_ver(i915,	huc,	tgl))			\
>  	fw_def(TIGERLAKE,	no_ver(i915,	huc,	tgl))
>  
> -- 
> 2.41.0
> 
