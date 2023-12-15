Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12D5CC35274
	for <intel-xe@archiver.kernel.org>; Fri, 15 Dec 2023 22:05:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2F2210EAA9;
	Fri, 15 Dec 2023 22:05:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FEEA10EAA9
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Dec 2023 22:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702677928; x=1734213928;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=NvPSbgMz4yjIXnAp/zpIxxPyOfs6IW0j8ia7v9409xg=;
 b=iv7c8JUQXHTBgdc8ycLJTqLjBYBCJpLbWT9t6sAgQRXPZaOSLdxqIwa7
 zCY97KoCsAhlg/SQX5CnEZm/5gd7s+I6YIejxkEaNWcO4i5VDbcbLGHK6
 F3flpK3YqmzDkX5hHAv+AQ9GW+jfqUFmYkVicFDxgs3kvEprmZpbBsxtf
 A/e7916TNX56zU8+pEZIegaYDZ6kdxTo8cPuwM6NRFeugNevP5QBULyy3
 Vjkr2XmOiQN+r/2u1XrDhLaYrkzZBIMzZShvZ+6JGgM3aRSCd6XzMrGTE
 2dCZyGTRZjA63sucJ41SBmWtar4S0MLMCw2TMFx6daukKdZXbXE9N5IGk Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="375484783"
X-IronPort-AV: E=Sophos;i="6.04,280,1695711600"; d="scan'208";a="375484783"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2023 14:05:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="751080777"
X-IronPort-AV: E=Sophos;i="6.04,280,1695711600"; d="scan'208";a="751080777"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Dec 2023 14:05:26 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 15 Dec 2023 14:05:26 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 15 Dec 2023 14:05:26 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 15 Dec 2023 14:05:26 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 15 Dec 2023 14:05:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L37SXmc/VLqof5VcKtV2QI/jCPtjvbIcVRXVnpQvD2lZCivIsAWrg3fWA8Wx7a0YhpuR2TGlbJ5Ko2lJCJkONH+C3HUJHJNXgtl8imcagQNqSk+ftpIDREdO2kJR8Pwt8wR4hwm6uN20zfUut80iYMDm+l1ocTEJhNrGuC1eevy8tXiNaQ2trrTdlXlvrG5p/hc/vXH7bwYQQ/65YcLHkH7NPCYeiORGNxiCT6wQvPOyC1jXGiYOF7AfwLuvGApc2hHI0j+YFiGTENnvtXhRkkJZgJgQf/Ayh9Ui8V3GTNwhK/d4Sw2pNX3RquFn/EdPmyaM1m8UJbwqgN+fay9yWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BeNOPR9MzlbfNRDDaBxLLyn+EFkGOraglg7tnJncr/s=;
 b=a00VtmI/mMPKa2pFOKSRrKAxel2/gaigASVv+j8zkppAVFWhO2+j80vrxnwfJuQnSI3bAtxae5jfMrLOcbMaA02O6Wn9OhmYwBTi4X84Cv0SLE/ZUNyrCgrcR7iUFESJanotpGpN65KSsQ1MaE8SKGJSwh02W6fx2yYzGaaZuMX/pMzj6ckTIf5awv7REAOhpMCDNY3zBXrLyxr0o5Zqpe+TAIpOHP5qTeq2nYhA7DoVYiQTx3NlmimOJZraUINk4drmvlqLRgfWjvJSph6Y57KEnnLFpvzHwYcGyioGujNevRnoB1MmQE5aQci4KtLDkdoYr4m110Nr3xy9yCkjmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA1PR11MB7753.namprd11.prod.outlook.com (2603:10b6:208:421::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.32; Fri, 15 Dec
 2023 22:05:23 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b%4]) with mapi id 15.20.7091.028; Fri, 15 Dec 2023
 22:05:23 +0000
Date: Fri, 15 Dec 2023 16:05:21 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v4 07/10] drm/xe/kunit: Use xe kunit helper in RTP test
Message-ID: <auzinq35xodo3k3lpj3vjqvauk7pbqei25amcgsko32nlynkwq@hq5tnxlfj7ej>
References: <20231215162502.1879-1-michal.wajdeczko@intel.com>
 <20231215162502.1879-8-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20231215162502.1879-8-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BYAPR11CA0096.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::37) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA1PR11MB7753:EE_
X-MS-Office365-Filtering-Correlation-Id: de6259a0-3ae8-473a-d588-08dbfdb9ef58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PvSsFfeSKmqLuHevYHd3Pt5kG1ufZ2iamhoN8UHvB3ZhKqOBCc3/FoZGnw4LOYn6FTbTE6TUoOTbkue+WmnPyFBxoZw+oluyDLtZs0oy8jGYkQl4w5a4Ui8MJXY9B031CxATn4AqLgmCNNasX7FhOWRfHS6R9NFq84XdMDY74nwF27mbgvj4fznIvNDkEuMNBIj19H+J36CJ4bdQYYccYtxWmYW85PUXHncK8KN4JGvxUnyfTMxisq1iqzD1o7O/YfmD1xx3K0HNfT7OLWt6M3d08gQ+UgY0cajLQnXEylIEAufYpiOIgw4sWpw/1U+bzofu3oELPHbpqMreDlgPkf6wS/sEOo/vHv3HJ/mkE1rTaiz6E4SRb7RYVbNQeoDVgGv5rtjkZznDyXQlHGAAhLR96C04N1TokSX0FCxGIJ6dDijKUKZfn0SJ+qh2zA5oZbbFNLBggm+t1EVBPpKaztCqrJCIlX6NG4LWBG3KNixOA0l26gcGFBsxz2xYKiX1vIXXh7IbpVydrWlvP8qXKvUcIbMp4Hw3IDCOiz5oJx7fJrRZHoXz76TqQBficVlX
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(39860400002)(376002)(396003)(136003)(366004)(346002)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(26005)(2906002)(478600001)(6506007)(66946007)(6862004)(8676002)(8936002)(6486002)(4326008)(66556008)(6636002)(316002)(9686003)(66476007)(6512007)(38100700002)(5660300002)(83380400001)(41300700001)(86362001)(33716001)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lk5+JM/lFTUbW9WjpPYoN//ZyuH2JWi3rT/ahy+VviJqBndkTJd/W5yDCd0v?=
 =?us-ascii?Q?bJFIbilw4wDEJuZVg0oMTa9dSwzntVmkyeqOdnhLBc9SLTi3UClbg75U/SDM?=
 =?us-ascii?Q?LdYD9cK/4ehrHo5ajDnBH5edBL+cnUWTf7tjchkM5VSLPMECd/oTxZKPMcmY?=
 =?us-ascii?Q?wSBnEgy2ePVPx7p8g1up3mLVdLI4wZqHO5TgUkQ9wYH9mIJTZIic3H4pcksE?=
 =?us-ascii?Q?z8EQzQeNhMFY2FiEwF01PD8aT3RFhUksQEmeFd1If3ESZwDSV+XQTkqWOu0U?=
 =?us-ascii?Q?OW3BTrvSbVKU6fABlr/WDMHHTzU9GByLOKZxk5gzmI/ijpWLI8BJsgquHatT?=
 =?us-ascii?Q?UAVt1nlOiEXZZX6+OU0Rp8s2zfz0HuR87lnRsJWnrDbSaVEBvPJM559OCW42?=
 =?us-ascii?Q?foKmf15wRhAcAEdFqrGnbS9UxkcO4dTpoH8Ik8KrGTNehtRXWiKfF4eEBv3g?=
 =?us-ascii?Q?67KdHzE8udgP8qPFzt5ozLpU6WB+okNUKDiJz+7Hh9jsodRnNveCSsJ6BjD3?=
 =?us-ascii?Q?hKQggn8lYcgHUB70f3wSo7isje4GCYyLYZDv/BE3V6+ap4qMGOcuisn2Cs2I?=
 =?us-ascii?Q?HpQ5pXW4rcjFdbXfOE5B/cRH3T7yVZs3ow4DN7fsFZZ6o3IlUB31wVHD/L0N?=
 =?us-ascii?Q?BAKmQQHWMFjbYFl/vHM8DqOlW/aVDfZciFLxwqh8JNaHm8HXGfK29mySUPfn?=
 =?us-ascii?Q?taNSAQcVErcTWzEhttZMvWeCZOLGHOCMXyVvRR7vjOkBIOTEjijLrMtuAlta?=
 =?us-ascii?Q?0tHQaHOM6Bkl+3UtkJ+657Se03aKu6kgOyTeNXI43agmEdssDDltYrNGjU2J?=
 =?us-ascii?Q?scvxFY6/0kRAYcxY5UNxNd4LHxQI5viBH4uiX7xd8FRMhM8s6I1J9yQbTsgB?=
 =?us-ascii?Q?LPgMuJgjbUK629dksIfe97+tPQ3U0zI7rA226PscGudT9TlMQ+EGqw4jwaLP?=
 =?us-ascii?Q?agBVSDh3V30ZmtCtNr4+lk27PLu8tkTk/wIZL5N5hkL6i+syP3RcZjwTMxW2?=
 =?us-ascii?Q?t9l+Pgcvjj6EwJWucc4q/muInKTPgVzBubgEmRMH6rrDZB56v8QwaRdDm73J?=
 =?us-ascii?Q?oYznfGOw7FWu72x16i/QhO4CWnf47chNta1qVSFGT6Zlenv3XgD5uoUTQ4UH?=
 =?us-ascii?Q?EvUm1rdTwmpSdGTh1aoDpL7wzuaEl3a7SbeELq941Dl0gfTvsv0nXY96ksIn?=
 =?us-ascii?Q?mWz48N+HDL+yHe+1Lvf9+xn0oC9q+zWJoiyJOr/+RtLrNJb3VOZ9RFnhkq//?=
 =?us-ascii?Q?2i7DqMi476XZgLa/pBcs3d1zQi4VCUEGrt9G6KAALBjDZvtoDYAsr5a8+Mio?=
 =?us-ascii?Q?2P3CZRM5l7SYbmjoh7izcqIAeHIeb4SVw33mdczY9U17uXvxizltkdLSjzVw?=
 =?us-ascii?Q?qgOK5tgGultwvycdUYWSgGtDoT01lvR8quWRa4PNhfrFMinmoQTYrTJ+QfLT?=
 =?us-ascii?Q?+Hp4mF22TUeR6kCYqwS8yF2EDP7libPxAoR8dR8lImJgTzf2EhvLHwnAiqb7?=
 =?us-ascii?Q?x22xEE5AAGc5Cjs7rmHda+2o8Ivs7j6A0ux0kvvu7okQeKxKiMPqqKroajuy?=
 =?us-ascii?Q?9YWLZPTuv4e8O5gVdIxG9+gnkB3t4UM7pWI6GoiP0wxfaiNaQYFxHBdLb9PZ?=
 =?us-ascii?Q?Uw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: de6259a0-3ae8-473a-d588-08dbfdb9ef58
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2023 22:05:23.1734 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RwhB4VjRA56/cFmco0XLwpIc+fBZrJ4FIhh7hcfaJnNWppzddfF3aLo0Vq6DiDMNIhqOpZqbO8CcCFHGotP6aWrsdt/0nGRd4IMhillzK2g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7753
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Dec 15, 2023 at 05:24:59PM +0100, Michal Wajdeczko wrote:
>Replace drm_kunit_helper_alloc_drm_device with xe helper.
>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
>v2: keep compose paradigm (Lucas)
>---
> drivers/gpu/drm/xe/tests/xe_rtp_test.c | 5 ++---
> 1 file changed, 2 insertions(+), 3 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_test.c b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
>index 4a6972897675..21e77026518b 100644
>--- a/drivers/gpu/drm/xe/tests/xe_rtp_test.c
>+++ b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
>@@ -15,6 +15,7 @@
> #include "regs/xe_reg_defs.h"
> #include "xe_device.h"
> #include "xe_device_types.h"
>+#include "xe_kunit_helpers.h"
> #include "xe_pci_test.h"
> #include "xe_reg_sr.h"
> #include "xe_rtp.h"
>@@ -276,9 +277,7 @@ static int xe_rtp_test_init(struct kunit *test)
> 	dev = drm_kunit_helper_alloc_device(test);
> 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev);
>
>-	xe = drm_kunit_helper_alloc_drm_device(test, dev,
>-					       struct xe_device,
>-					       drm, DRIVER_GEM);
>+	xe = xe_kunit_helper_alloc_xe_device(test, dev);
> 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xe);
>
> 	/* Initialize an empty device */
>-- 
>2.25.1
>
