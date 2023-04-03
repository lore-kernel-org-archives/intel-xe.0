Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B609C76188
	for <intel-xe@archiver.kernel.org>; Mon,  3 Apr 2023 19:13:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE00D10E03B;
	Mon,  3 Apr 2023 19:13:52 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A16B910E03B
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Apr 2023 19:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680549230; x=1712085230;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=IropcsqKDQHliLynJzJ+IJLqCM5nSoLFJH1a7RrJ0HA=;
 b=URNSdZXsl9LGGHV8Y4XZA3lXgrW2f+MC8JDkaz6O7YJY28VPHXJHJAGW
 UcniFKiKaYQl23KuyB6rqLxgnyY/MjDTuQhsViiH848rrX7JpUrQA99D2
 iEQRarp5xh7hQdqNjGnNLcoQGg0M7IH5cWVukVs6SdCKTpgXMyrKp3LKM
 RXri+VbJ0grqNe583GSEjobTS9Upf5UFMxi9ab1yzB9of2+na1LU00EIy
 A8MIuzEX4ikTcweczLYMecge6BDaPz8x9yxGDjWGNrXCDZJvdk5u3bkVj
 wGzMaRm27QE3VXzRnnp9b2pxL9dBhYv/LO7S4vF2b6RAVt4nRx7ItUE3o w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="340724885"
X-IronPort-AV: E=Sophos;i="5.98,315,1673942400"; d="scan'208";a="340724885"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2023 12:13:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="636218448"
X-IronPort-AV: E=Sophos;i="5.98,315,1673942400"; d="scan'208";a="636218448"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga003.jf.intel.com with ESMTP; 03 Apr 2023 12:13:49 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 3 Apr 2023 12:13:49 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Mon, 3 Apr 2023 12:13:49 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Mon, 3 Apr 2023 12:13:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OAmlPA6PQYuMgocNaw7OWYH/OXN2CrOenrDJE0Fik2fwJzw+yucUZ5Aym/T+MA2YUDJzPlyNj+rjQ+qlvxMH/SLMHPaKXyzalujeJSl0D0cS/0t1u5aNqSmGB9E1DwH3d55+al7eef5Mw3zJYbd76IW1xTqGBCXl9Weblp6SkTAJdaYb8yXyrt9LP//5jqrxbvhgsMV0F4dpSkVjWhBAiero/BwlocyvSUvq2ObbQxs1b9vRHMLhTkkr4GRkRzgTog+JLlQ+9ZKWimVKQYn4KkGJbdNr2c5SB5umB28S3kkRqXsA/T1/jRB1tnNRsWO394aE7NtOuvw5xtPoKVkT3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GqduvEE8oQIOf1JTTi5X0UmBY0ek4XkDrZ+VVPIK8wM=;
 b=k7ZtBI4L/jt4/PPqwW+3F2yxRbOa+Gwswd0TSCVNSVr8MxjtldDzHlvQI3zldN3hBfRH4DK6oCzS99xchIZGQJEIrwFAdAIQR8SihJ2uv7J5Zjjc8rQWlkCpWrfR+HAF0iJaspT7XDcwdKxzTTg0BB4ZHYEaVmv/LLxQeyCywrVImET9ld4Z8FdMcVw2Jzab761iDodFEdm0cJom/vlPYOH+XhKBL+7NAeGBhEf4yynLgQ/KpbfS/aroCGfw823+CE4RfLNnBSEdA68ta8ZWz5Cf6GBCLysVlleDCpZX4Pg9GoA37ImqVcl5397jyngxMa3JBP+k9YMDZF745ZSYcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 MW4PR11MB6737.namprd11.prod.outlook.com (2603:10b6:303:20d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.29; Mon, 3 Apr
 2023 19:13:47 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0%8]) with mapi id 15.20.6254.033; Mon, 3 Apr 2023
 19:13:47 +0000
Date: Mon, 3 Apr 2023 12:13:44 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230403191344.GW4085390@mdroper-desk1.amr.corp.intel.com>
References: <20230401084214.1784236-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230401084214.1784236-1-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR13CA0104.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::19) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|MW4PR11MB6737:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e8387a1-24f5-4a39-8278-08db34778c9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PqJBBkga7GY+BxXszH9ffDvfll6dGZJNN+LuataSFGahxfrwWvnlzGa8k+N8ZIy4TTFa2BujHuvtNnhyn6V+3y0Opoxm882nzKO1TP1nigvKLw8U6tK+68BqNC5N0ryV0trUgbgV6hMGPn/dPX35upXObMfgQ993uv7njl+8i8e5WEAUKhgFoAVYwFRQpfCMIGigmmRY/HAQTnB7pRNixDqDlQUQVP3CWQWLgB6IJbEy/GCW2UyGM2EkKQerFAxEmWhI+A+ptKlciQ/jaa/XKNb1nkGjAvKbopsf1wuQpDhWYN4ElEiDGCct0CP3OhEta2o0qPPhCWoC6ebq1Mhi4L4pXEBaSg9dBC6USZH18BLOQqAlM1311eED5YHVQ27IWGNQotl98o1vv1xoO4J4WIf8iPFs45ScMjPt3TnFlrnjt2M94crroLhn3HC40vyEDpNaNPrLKhgzVoryvGd6OeNcf9w6ziTvGNMTwr+LO1FtWkYwbfA4PK71n9B8bEAkYCKCDBeHHoPwrOlyxW1J6r/x7nSaBIYoKRYFr+bApgJNk5aP3vVzkku7NwZVPaWc
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(366004)(39860400002)(346002)(136003)(376002)(451199021)(41300700001)(8676002)(478600001)(66556008)(4326008)(66946007)(66476007)(6636002)(316002)(6862004)(8936002)(5660300002)(82960400001)(38100700002)(186003)(6666004)(6512007)(6486002)(1076003)(6506007)(26005)(86362001)(2906002)(33656002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TkIwSTFnQU1YZEJ2a1ZiRnlUSkJldXZlK1RudVJscW1BOGdRMW9GYUp2QS9l?=
 =?utf-8?B?aUk0dHhOY3FsZDd3b3dRS0NST29yNE8weHZ0NDF0Nysrcy9jTllJSjBQQmRU?=
 =?utf-8?B?Q3dyRDM1c2xuZGlCZVd4OEcwNHRGMG5uUWNicEpXd0RTRnNrS2xBN2pWUy9D?=
 =?utf-8?B?WnlrNWZPNmJ4Zm9UZ0hCeDYvRWFUK2V5ZG94c1RHc1kzbkJPYUx3aUh0Nnkx?=
 =?utf-8?B?VzlmSmpvdmw3YlB3UDhaaXROUnFCU0swRnpoeTNueWlSMkZxc2VyNnI2SkFl?=
 =?utf-8?B?UU1KVFhwK1g2Y1BoaWVCRHZiZlVoKzRCYWZmMmJ6YVc0dm15Y0YzTDFzM1NO?=
 =?utf-8?B?cmQ2QjZzZ3lFQjNrQWdMTGxUZTEwdDlYR2ZMWWVDTHd1OHZQMFE2ZURmTXdO?=
 =?utf-8?B?bDFjN0VMdkZHUURFVHlZTUp3QnpEMDZFYVZCWjY2Z1ZsUHhIbjcxRjlpVUtD?=
 =?utf-8?B?bzR5Mm81cnJ0cG1EKy9wU3lWVkNZV1o3QVl2UmR4RGpuelhTQWVxNzlRM1kr?=
 =?utf-8?B?UjhFOHZlMEZ3Z3JUNC8vVVdwakNwRXJySmxNM1g5SWZoelhRK3VWNS9XUHNq?=
 =?utf-8?B?K2lRa2hMSDRXYmgzc0RMeG1LRW9Xc2p0R2tNanBXaDZCUHh4TFlUQzlqcDRm?=
 =?utf-8?B?YjltcXNudkJXQ21jZ29weDUweGZPWHpCbTBzQ0psSGRQbDJpMTg3d1htZzRt?=
 =?utf-8?B?c21Oa1MvN3JQQjdvckNtOEQvRzNGMGU5b0l0MitnRzlJcnV6S1VqaSsyVUZy?=
 =?utf-8?B?a294WnJFaElHMndDVGxhcG9pV1YwNVFFQmtBbkZYYUZEa3hKUkFacm1LL0Vq?=
 =?utf-8?B?WXk4WnhiTE4yS1RTVnIvbnR6dU1Gd2FoMzVUOCtTVWU0djFUbzFMSUJmMXp3?=
 =?utf-8?B?Z29OdEZYWlB6b0MxempuT1J0MzRZZU1sYjlWNXpsMVAvVGxFSnR5eUE5aXFp?=
 =?utf-8?B?WUtSK28wYnNKanYwMXZYY0M1WWpXU1pZbHlsSXhYOE5SMWJwQVdZWGhpTGw2?=
 =?utf-8?B?dGpldHFRL202NHJoU2NpZDRwNUZSYk80MDRuNEsyOTZGUHpwZ3BPR0Jxc3Ru?=
 =?utf-8?B?UHdnZEQ3aWRBTW9aSFpRbkJDRkFsSjVPSm1jZzB0Y2FvVXdtbmdjSGxwaVhD?=
 =?utf-8?B?QkJRYjdnQ005bERlaU42WHR5OTZ1am8vTmxUSHRRQ2hXblUzaTRGeEtma3dC?=
 =?utf-8?B?OEVhWGxEYnhxOGVSS2ZFV0lTOGNNdjVHUmhMNGNMUXB2UWNUU3BNNS9qZ0lo?=
 =?utf-8?B?RFBHUTZ5WHZBUEduZnJKVm1SbzFpVU9ZanloV3VoWUN0N0drbEtlNDY2WkVB?=
 =?utf-8?B?QjdQRGFFVzU4NGp0UnhSSk8wTjhoaU1mYk9Wa0FIYlNPNStWUGRsaytOMXkv?=
 =?utf-8?B?bHplcnhhZG1Ic04xWXRJWXBhdEpkTEw0cTFld09YYURtemZreVVQaFFYVU95?=
 =?utf-8?B?NWNWUWdXZGhqT2ZCZjB5bkQvUExFYytGZ1dOdytOMTQ1Mkx5eStIdU5tM0pR?=
 =?utf-8?B?eU5RbmlIWFJnbGZMMXIwTnJ4RjRtQXZvckJZTUNaOFI4cy9MRFVDZkcrcHZC?=
 =?utf-8?B?RDhzRXZqZWROK0FFNVRXdkQ1SEpseFprWlU5OEl4QlpSeDJWREt5dGV4dlFw?=
 =?utf-8?B?Z2FJZm1jeTMrMkVBNWl3dFJ0SEw0M1EzdDJGWTNkYWlVUnNGYnhjNzM3eUlq?=
 =?utf-8?B?TXRJVENlK0lHSFVhYU1QZW5HREpPekZDQzVNUUhWYWhSOHdKRTBib0hWc1k4?=
 =?utf-8?B?RWFjaGxpcGdYd3RpZG1vMDJyWG1QQnpKK3RwMDdLREdIOFBINVd3L1pBbGJD?=
 =?utf-8?B?Qk55TC9BS1FWL0JBMkYzZW9yd3RKU2NNSUJHcjY1OStVUkdhK0NVdjZzTDZ6?=
 =?utf-8?B?cjJYbWZrNUpBa25sQ21pbnpIb3hEQmx4OHh0eEJ1ZHhxMWowV1ZYaHR0MjBw?=
 =?utf-8?B?WjlPS3dya2kyeFBkZ1pWcEt1NE1PZDNKL09acElBZ3I3dnRtS2YrRGpXWm9l?=
 =?utf-8?B?eEdaOFd4c250dTVDWm9vOXd3cjE0ZkJNVXBPcy9QRGxmUjV2czdpamRoRHFP?=
 =?utf-8?B?VHVLUHAwZEpkNVlSdW1YbysxNGlaUW5lVTRQbGZqak4xTDFWOW4zNmo0bGt1?=
 =?utf-8?B?VmppUFl5Yko3cS9pQkxQWWx6RlpYbTBzZC91N1RDK1YxQ0tBN1pvWXBqdFI4?=
 =?utf-8?B?VEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e8387a1-24f5-4a39-8278-08db34778c9c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2023 19:13:46.9707 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fwj6Bg9SE02WO3toA2vAno+aE/OnLrajyExKd7E8WNHPlWCqaFwVzTlQaU3OCCpvApDFDUNXWLdShosJ1gdSXIqgAEdJfDe5UKPpCKnnyfY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6737
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] fixup! drm/xe/pat: Move PAT setup to a
 dedicated file
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

On Sat, Apr 01, 2023 at 01:42:14AM -0700, Lucas De Marchi wrote:
> drm/xe/pat: Add missing include
> 
> Fix build error with W=1:
> 
> 	../drivers/gpu/drm/xe/xe_pat.c:73:6: error: no previous prototype for ‘xe_pat_init’ [-Werror=missing-prototypes]
> 	   73 | void xe_pat_init(struct xe_gt *gt)
> 	      |      ^~~~~~~~~~~
> 
> Add xe_pat.h includes like commonly done.
> 
> Fixes: d2ceb4f09a00 ("drm/xe/pat: Move PAT setup to a dedicated file")
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_pat.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
> index 266cf6f43a3c..293e4ff16107 100644
> --- a/drivers/gpu/drm/xe/xe_pat.c
> +++ b/drivers/gpu/drm/xe/xe_pat.c
> @@ -3,6 +3,8 @@
>   * Copyright © 2023 Intel Corporation
>   */
>  
> +#include "xe_pat.h"
> +
>  #include "regs/xe_reg_defs.h"
>  #include "xe_gt.h"
>  #include "xe_gt_mcr.h"
> -- 
> 2.39.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
