Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE7D2C77B7A
	for <intel-xe@archiver.kernel.org>; Fri, 26 May 2023 17:36:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8068610E1DD;
	Fri, 26 May 2023 17:36:32 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6374710E1DD
 for <intel-xe@lists.freedesktop.org>; Fri, 26 May 2023 17:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685122589; x=1716658589;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=slLh0zmFiiytLPyH3qMmbVxVV6KW52WZsIJJiSs0VwA=;
 b=TVfCI77DMiMvbryHwDQtbc5OAFAXqsz8B3oUpkxVliaKImD8FP3fUYCq
 IPTSFnqJ1DfbI6EJL1u+TRdJEjXv9dHCL0r3SpWjHGvOAMgO0wnnsHrnv
 kSZgy871ZwTL9H04lLyGKcuz+wgNKE3yQ+HeqeQXznHHqfWyAsn/HQ4gk
 ytRAqEpUOtoNUwfhZw3CY/QEMkvS0RYVI61Uo62+i6bNu+BPAoxVoQy4J
 6F5bLrHN8YOXHzVy/pVthSMs4gHARgRsDJl0UoDlQVacWH5rXzqnHl9mf
 7iRMCl3M1ubsphP/Q12iZH/9X2n+jp7apUCsT+C5PNO6FUH8DKfKlfnEL Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="382508098"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; d="scan'208";a="382508098"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 10:36:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="655716139"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; d="scan'208";a="655716139"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga003.jf.intel.com with ESMTP; 26 May 2023 10:36:28 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 26 May 2023 10:36:28 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 26 May 2023 10:36:27 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 26 May 2023 10:36:27 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 26 May 2023 10:36:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ow5SfdvPO8jKTLlYQffjrxjxGbzB4KpnLoO8uWcrllFer95rRy/QlGwzhSLQJ3U5v+k3eES+SXE9K8lno110+8OwKJCyNu8kUwoQ4M3a9E9LZeACj9zBMx5j0VQFiIePxxCCszGFNG04b2Gpo2onrLPjVrB72Eilz/r3Mn7SP8x5tJlV/3BGalSP7XH12PT5uXXbnnTuQ8cuD1zOTWrwpQGQR61Dg2YnOQ1jK9diKxVJTy0W7KCaBhidMUqZLxRt1eUmLXQ7B0X7AgLZfDDbWNRmv/Y+oITFlfZY1z0ctDHfZoH8f+qWdb+xIfaHWYLcTsooKRtJdmFwIYekhhNjYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mD+oQdpUaGyJLfCi9nK4nEMbf6QVCrfzdANFVzWqRfo=;
 b=IBvzxiZWrd9ZA1shN0EGru1yh8Y1qw5oF0OW+qyA4SPR1OOteeZTKvBBFWWiUE1wvt4hcgrXJCy9E3UQEmcwFRwAe1Snp/9uaxqNTngkq1r4vgzIldpptQBuUIZBlL8A2kBxSBa5JAFULaR29HtYRWlqvAjmi9GTSI2ghk+mRCUIEA9zxLUxFZFcIeaDSrRK4XWVZ0kFpH5oMGbebjIcuONzRfh2YNHxdxLddqem2qGfbEZ8RLISm96JGRyoWZoWMamIPjo7MnRcD8XXhNnpwOwlpvQH7xhOVELT78oRub1pdwwZ8OJGJNrdW1qtDbyP4vNwcRqHMjIQ3GHPFZjINw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY8PR11MB6817.namprd11.prod.outlook.com (2603:10b6:930:63::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.18; Fri, 26 May
 2023 17:36:20 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6433.017; Fri, 26 May 2023
 17:36:20 +0000
Date: Fri, 26 May 2023 10:36:18 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Anusha Srivatsa <anusha.srivatsa@intel.com>
Message-ID: <jeslcvopyogxvwlrqj6g7zvl6g2h55umqxfhoz5gzk5r7bd5ko@en35xe3l5a6l>
References: <20230526171204.2754550-1-anusha.srivatsa@intel.com>
 <20230526171204.2754550-7-anusha.srivatsa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230526171204.2754550-7-anusha.srivatsa@intel.com>
X-ClientProxiedBy: BYAPR05CA0044.namprd05.prod.outlook.com
 (2603:10b6:a03:74::21) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CY8PR11MB6817:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a1f2453-2ef5-4c1a-65d5-08db5e0fb74c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l5NY+oPG+i06Y+Ba6CHzcx1P1DBwobCxSuq22uS8XrwVChBd6ydny7vrsjBgbuG5E2X5otZQd1iTLDpYye3zsykqk9kxzKPrt/YgXotPijG0DXKkOznCJjFg4CGxZPseysTmcLIMN/KgWXNJFud117kOlMlvvVVbAJrPu+xEMiPKKpeWIOF5T//q88w3hLtazm6ACyS1mOkbDnDdS1KnGbDfspjbD+Nvfysrz3dGNBY9UzqEVihwooLR9xNDGwpO7lHa5oRYt9r8ZzBFu7rrxXHzMhnQFiiY/VWlK2hJmjqvcbi4zATIY04oNH5eMZmdi4JTS53nD2qGeBy/q1N0rvgAfx/6V7CCOZjo3ImNXZT23mxtQvGCHCqAIkxa9womhBPLTss+P93qAK4Pbth+uNO/O/mVgInK7fncH+kLhZXCRqJ6GXQOPJ+vWIGhuNdBiCXerxYDvd6V1TkeCLjg84mr6RBSua/SW283oaxxddkPz8t8v9M4roF2k8ujsA2RtTRafa8ZTy936G3y8e/o3oVOKaP/bJLC9jf8pixmY9SORwURp6ZcO9FQd9rk+RVk
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(396003)(346002)(376002)(39860400002)(366004)(136003)(451199021)(316002)(6486002)(41300700001)(6862004)(26005)(9686003)(6512007)(6506007)(8676002)(5660300002)(38100700002)(8936002)(83380400001)(2906002)(186003)(86362001)(82960400001)(33716001)(4326008)(6636002)(66946007)(66556008)(66476007)(478600001)(66899021);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ASkgQL/w1Gh7yg5ADZILbO5U/cJCPdQlKG9ijddE3JGiolcl7D8acTXqoZPM?=
 =?us-ascii?Q?DGS7OZGqJktJ6nZ3e35a0uhsBU6QFfdPpZK8q/Nz6jWid2HOukrQcBWRwoDA?=
 =?us-ascii?Q?D30ChU09ZEjtgzhl3F9yHVydTKezqFVTw43qNZPaWju0UkDiTXSUXNCBK8xw?=
 =?us-ascii?Q?zHdLLDZY1nYQhOCCDySwcgC2L2DADD04oIm8dIr6904PxWRbO4e18XnrmDfv?=
 =?us-ascii?Q?Y3MpSTrM4ju/9rgKZjIm1td1ins9K8RCSfk2xvazbWVQ61PI/5AVcjiFH5zx?=
 =?us-ascii?Q?YeCqS1kXU43usP66xzJ5IpC9vLTmHwYTBlHp87ZeoJktlROz7UVFAaQA8xOQ?=
 =?us-ascii?Q?WOmCEd5h0PEOWg+t2ZKPhrkIcOLi48GouSMq0eVkrUP1qYQkLGUGb0ikvZBa?=
 =?us-ascii?Q?kA2NehS0ckbwy7OqIiJNCHm22g2BoXdUbIeHj9MsmemG64WPVwwqitUtXYyu?=
 =?us-ascii?Q?lXKnOsx/2AlgF3l72fnu0Kfn6O2Y+Bi4odnHHFrF9dQGSypYrzNnZlwvijnB?=
 =?us-ascii?Q?lT175ZoEYwmg1KxnIdWBiMTAM3ftYcXrfPbavAh8DoeyzVPjWl3J/n93Bhvq?=
 =?us-ascii?Q?YBWsqHcF/2/GFJ+1zQbOGL7a1PyvCH4R4ef7d3+bZ3Fwm6L19mNn5jwchY8q?=
 =?us-ascii?Q?Vjp9VJwLHiGtiun02c9Gt1Nx9zpk5bNZDWEmCWX4NET4sSRi2aNtfcR6koP3?=
 =?us-ascii?Q?Szt+iq46E3wMnWNKCNIz9Ma/8hYRCPyeOJgomZ7laUmNnsHNKidqDDuxeYRt?=
 =?us-ascii?Q?N0hu5tUDiaGV0ecEU4Kx3lFyjbk2NEn+pwxoPc/zwW5KgDmhVuv0jlXuk8Ym?=
 =?us-ascii?Q?GcGcawX7s5ueEwkYH7Mx2+JQXB4JbUMN/kCcatbCiX/Io3x2G1aesVYAckSF?=
 =?us-ascii?Q?MIT9tOXb385np+J54fVBv3r5cH0KX+7Mlur25soft1yjhPUc7qbzztMhF6IE?=
 =?us-ascii?Q?p28WJwLk9rm/T10epwTJLHBCKRSYZfd6GIgNYqBxcdbkRcNt4x2/y/NJvV8Q?=
 =?us-ascii?Q?bNhTqSJ1q80e2zlIawmxsMhR6x63QfTnSd23jDqyfF2kdXv8Ne6FTB4fK9sU?=
 =?us-ascii?Q?50pvI/bfADqX0X4Izf208L/o7VI66DJhNh6oYJ7r4XWt9AgGHjyJHHFb4rKY?=
 =?us-ascii?Q?DH9q8ML24EICODK6UK3vVlkCNv69srgkDcjCMaQuvHDghtDWY8KUw4KUlZR6?=
 =?us-ascii?Q?UB1a1563So/p8WvMfTy9ssxoU5EDG+cpi8NVjWXMDgie297Z1ie/LUUBcBkn?=
 =?us-ascii?Q?4AxvdLCVvku83YTYRft7pqNK7JE7LJgxkxi8KBwHP0tXxGk8iAW8d3x75hqs?=
 =?us-ascii?Q?LhRNAnNL9fD8yKG8GjD+2xtcvEeKGBiK1uOfAMgQeC8yzmqkHsWBnGrWjJEg?=
 =?us-ascii?Q?9PzCXn5caAbQf9E/xo/JGd+AeuBjgfJgCgPczJ0QUmMumusFl0iSI2cAIm4K?=
 =?us-ascii?Q?dcFEkeRIgoMUkmssPBQbiWcUgwi7u3xkHMXxLd+wi6qpSMspsFESkvRFuhc9?=
 =?us-ascii?Q?lO95QSBUbUPCZTbLRzW+rSbPRdw1Lqj/59SwMgxnUupvBXiT2vCcc58ponBb?=
 =?us-ascii?Q?5XPou+hxqHeNIfFyMtJHCrkkNysTZMvHIJ0V8w7c9Ij2dIFmxSYe4dfHNuZe?=
 =?us-ascii?Q?Tw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a1f2453-2ef5-4c1a-65d5-08db5e0fb74c
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2023 17:36:19.8436 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xy58fRZlrXNv0HJWxTvBJYwPtSIfZknPhdFF92Gm58di0iZeX8A5aOUKm8jfjbwmkk+xXJR493FUY3tQG7pe1vPhFpSKF6zZuJTdII0qg/E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6817
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 6/6] drm/xe/rpl: Add missing RPLP and RPLS
 entry in xe_wa_test
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

On Fri, May 26, 2023 at 10:12:04AM -0700, Anusha Srivatsa wrote:
>Signed-off-by: Anusha Srivatsa <anusha.srivatsa@intel.com>
>---
> drivers/gpu/drm/xe/tests/xe_wa_test.c | 2 ++
> 1 file changed, 2 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/tests/xe_wa_test.c b/drivers/gpu/drm/xe/tests/xe_wa_test.c
>index 16f7f157c875..f86fa0f2ce10 100644
>--- a/drivers/gpu/drm/xe/tests/xe_wa_test.c
>+++ b/drivers/gpu/drm/xe/tests/xe_wa_test.c
>@@ -58,6 +58,8 @@ static const struct platform_test_case cases[] = {
> 	SUBPLATFORM_CASE(DG2, G11, B1),
> 	SUBPLATFORM_CASE(DG2, G12, A0),
> 	SUBPLATFORM_CASE(DG2, G12, A1),
>+	SUBPLATFORM_CASE(ALDERLAKE_P, RPLU, E0),
>+	SUBPLATFORM_CASE(ALDERLAKE_S, RPLS, D0),

is the order correct here? RPL being a subplatform of ADL makes me
think it should rather be grouped with the ADL ones above.

Also, ideally when we add a new platform we already go ahead and add it
in the tests here. I'd either squash this commit with the addition of
RPLS with a note that it's also adding the missing RPLU  or squash this
into "drm/xe/adlp: Add missing ADL-P entry in xw_test_wa" with a
different commit message: "drm/xe: Add ADL entries to xe_wa_test" and
move it to be the last patch. We also can't have commits with empty
commit message body. Something like this would suffice: "Now that all
known Alderlake subplatforms are added, add them to the xe_wa_test kunit
tests for checking their WAs".

Lucas De Marchi

> 	PLATFORM_CASE(PVC, B0),
> 	PLATFORM_CASE(PVC, B1),
> 	PLATFORM_CASE(PVC, C0),
>-- 
>2.25.1
>
