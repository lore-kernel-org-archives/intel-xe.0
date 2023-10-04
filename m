Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BC83E7C4ED
	for <intel-xe@archiver.kernel.org>; Wed,  4 Oct 2023 18:21:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4764410E3B1;
	Wed,  4 Oct 2023 18:21:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5152710E3B1
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Oct 2023 18:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696443709; x=1727979709;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=pd+eIF0K7DU4Hgs/N73PV5hRYaPB5Aj0wobGvR4p/bM=;
 b=dwTzk5t9yh0o3y0xL00uY4cSo8KhmNk2A3OFhIFzaAF8liiPckWDfTsD
 xeHobVm/3VZheIVjarXmqYW7X3XVX1jMAKpvWpeCm7IbuTYPYj3wzIr32
 g2CUzJQi9NJ1pWIFQPGVk4wkB8vNdR1PjnLTaE2kEiPgwFbAQwPPZGLfC
 lB0ZJR9VuAngNclcMj25BCcCwr5hkTiNhW8Ll1mDTPs4zfyEoe60sf/Hg
 JnOQ7x4P5YNgPSSQ45yu7JWtceSVtgFGV1JgSi1oKDSULuYkT1KU5jKaD
 YIo9l+MUVHYFaPgh21ZDeaxus9154n9YywNgmJ4rZ+luPZXQnxgqnjHQv g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="447445662"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; d="scan'208";a="447445662"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 11:21:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="842008353"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; d="scan'208";a="842008353"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Oct 2023 11:21:48 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 4 Oct 2023 11:21:47 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 4 Oct 2023 11:21:47 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 4 Oct 2023 11:21:47 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 4 Oct 2023 11:21:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aw78dyMq8ksnGVD0TpwY5w2KABufSNbUf1A3pjQnerXCVLJ1KBhr/dv8QfeQzwlWTPCtRwrPlJwlMgixiXyee5R3HVIwgZdOqmrvpkImt0Pu6WokBLvX88KqijJrxD0BhjPb/3EzHrdZkeruV/nHkFRIeHHpIWh4jgnlEEhpAboENczWEJP44gvKN6GzWhLP0wxnv5nE3gFeDH0Gn2J62OgSY9MaVdhajW5SqGVDWhtqN2kXPAp7qVxcsUEu/n+2K/UBtZ7f5AmYtfhu6XuiWl/NuXvJE4SHeVKh4Zk60BYkJYSzrG+aP6+n+zLw8LC9PepPMJhKV9hta0ygOTBfug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kPGr2SLw6hLQXTl1Xp9TgFMTiFBT9Stpj1nhZg+1qG4=;
 b=Mz6E+K/crudta9E84lEwWCt5iSdoz/XjynV8XS3O0r4pRQz5q9dzwumcujwkaskJQfIAkpkYWlrnFVBHCe7xclFotXNQYj/sT9rrMO5zi30hjnmQpVFIl6qf0CwGWKARkiCRzpdF48RDslpGnjKbSDBU0/rSAVyFoXyp/+Q0uQwd1OmR5F22qynXjKvhEFbIjJpEiyTGRSg1YmDl7iq1UaK1SIIMfQmgTL/Z539kl3k9Qo94EWtV6/TkAKuDIjFvGOmZDGLIGQpu3pERtK/qmIyMxgLyxEkpe2Q+o3Rd/In3GXtFKvZhUBF7+jiGd2PIg77Dcdw78qAAz29YEBDuLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CH0PR11MB5521.namprd11.prod.outlook.com (2603:10b6:610:d4::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.33; Wed, 4 Oct
 2023 18:21:40 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::f345:2318:9a82:51b5]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::f345:2318:9a82:51b5%7]) with mapi id 15.20.6838.033; Wed, 4 Oct 2023
 18:21:38 +0000
Date: Wed, 4 Oct 2023 13:20:55 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Anusha Srivatsa <anusha.srivatsa@intel.com>
Message-ID: <jvbzlgsyw4hhvp3zclxna4oqdstks4r64jzde5fdcay6llabrc@tonxvxnll7ff>
References: <20231003203716.108979-1-anusha.srivatsa@intel.com>
 <20231003203716.108979-6-anusha.srivatsa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20231003203716.108979-6-anusha.srivatsa@intel.com>
X-ClientProxiedBy: MW4PR03CA0236.namprd03.prod.outlook.com
 (2603:10b6:303:b9::31) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CH0PR11MB5521:EE_
X-MS-Office365-Filtering-Correlation-Id: 26de8f24-8394-4bef-b52c-08dbc506bff0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Tii9M0NetOQJ0W9cMChQaa2GS9J115OrgfG16Rfc88T498lRLg2/MZU3jEzJcCOx5qw15WGLewye9wOItl8rZnMWNC/oB53/V3sugopC+mYkI+bEykX/PN45Yr/G2biu/HCUU/eSGOSBfgXJtkHfvW9uqKKlgXNadB2Xhf+rPvhc2K/zl03aYhrzNrW//k41KK7rt75fxIcDZO3F4Ufeko2Xomett7qWlEwh0ADt8jbasyS3pDh3CJYNxs56EYnRgf/4P01xbFIvUoLVdfoowhMlgIgr5XaK070iH/oG/QNVik2hxtWD5X/y6jYwb0jbmlTM0qgoeF9aMzrShZ4ybAd0YM68QygYq1l1/q43ch9FzhRDOIhQa3WT/qyqntfal6JOdGBA3IdEILKScnIYa93AUAhV/2fvPll5Or5RUzsc/8EMifYe0eASoG25kCYKpUNsCzpojaSxb7U+2HdwNuwXgDAt2GLwVv3XL9+SCfP2n6Dx4Es9WbejXaeuiz+lJGY2SW0jIE2IbegT2mNj9EW0w43IF+fOXYC7CCdUuFtDqwd1Sd0y3npN0b/Q/y8X
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(376002)(39860400002)(396003)(346002)(366004)(136003)(230922051799003)(1800799009)(451199024)(186009)(64100799003)(41300700001)(6486002)(6506007)(6512007)(316002)(6636002)(66946007)(9686003)(66556008)(66476007)(6862004)(8676002)(4326008)(26005)(478600001)(5660300002)(8936002)(6666004)(2906002)(38100700002)(33716001)(82960400001)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2hiXiwZuW4yxiNgrWQGz3rH7Jb1Rj1t/euc2GooX2H+vO+8Z/50cElCpNd7h?=
 =?us-ascii?Q?ho6UjnYlUNVTcFrMXW8x1OlpQbQt1c2fysaGNuAp2ht9OVOzA6Boe9XxB+VJ?=
 =?us-ascii?Q?OH/vAlDK7iBztW++JHZy/hYRYXjJFc9l0cO44reuGpLNXnI4xmCP5MkXolu6?=
 =?us-ascii?Q?wrkshXgL81fWORHBT/rpt+znFfF/LJcZTReeVGEVo8+oj1W+x6GLoWaHw4em?=
 =?us-ascii?Q?SASQQwgQ1JmXgEAcFfUiIssT/tYJpiQhIqNhjUcYn3Z9unHzTnVw8bW6Wzyu?=
 =?us-ascii?Q?sO48hI0RWtyCUwKZsOKH/HDqBHS5BJWshRqzEq7jfZ9D4fSoop7AxzxUD7ga?=
 =?us-ascii?Q?Vt3Yb6jmhWKTHlFSnhKwPq6a857K353KDt+9BjFNJQdZ18yr7dVm4e0IDa9l?=
 =?us-ascii?Q?wmisZI4/+wCdUSPxDOkUstlWQu1l/YraJ+4d86l6OBcEriEQzwqtPh4rSFZr?=
 =?us-ascii?Q?UR16vEj4oGCau4dlMLXO3Ne5u7JuSxUsamToOT91OCvSW9y/IyblUS9nwwUa?=
 =?us-ascii?Q?TlvVOIbPS61vCgT2ya9PXi4ZLdh6wOXJjuSfwA6F9CrVqdg2kz9KPStF779B?=
 =?us-ascii?Q?NCdxP02GEHmJKkd3cUlqZ+o2WJ5aE46wcXkGl26RQ8YVzVYXfObcGwkV2XfW?=
 =?us-ascii?Q?O1ww0aNY+qzMER3JvUffTPyKu4OelgRlIgmovAEtm8r+eJ4jbyA6ba/vViuc?=
 =?us-ascii?Q?wsawNexSRTp3Z11Z2PVpxf90g1efWBYD+8W5Ka66IkeGSel4u2y1VRSCXmb+?=
 =?us-ascii?Q?M+Xort5w16cMkFx5MZ6rArHY+D+FUqlo81YG8v9NwEKVwyEb5XnTYrc2Yd57?=
 =?us-ascii?Q?yjLfVAPhf2SX7cd0rwR5DJ6iOflCmh5609hehzhgxpH/UoepZ+pYPEawZwbU?=
 =?us-ascii?Q?Zp0IAvIPRCRgoJ01t7o7kc5J3oSQzcb+zOuZGvC9Xi4Bivg0lITEYX89wG+g?=
 =?us-ascii?Q?UCEw+7rfRxDaHoAW16kDdtA3r7Nn3ZRLhLyZnvUiquTRvlrKI/0cqDkxOLVM?=
 =?us-ascii?Q?2sX97pYduyqOGcLuDYnLSH3XhdwCM2ifglxvAH7VJn0SnNMvqF/WLLSQ7K9B?=
 =?us-ascii?Q?ywDIj606wm+ml3uDR0Lp4MtMdrf66kAS7l6q5JxdkNhXNmecVh4tppcYpuhy?=
 =?us-ascii?Q?N/u60S9glVnhPPtkxGvT55UZM7p2NybeFKOGw9GSI9uT0JWZjo71Ie8s5O+h?=
 =?us-ascii?Q?WKiGBRMKRmtgBWXRbx70HZXPJ3YYQfLWnYgsZINlDx9HaiClvW+rDhS2Se9d?=
 =?us-ascii?Q?IoKkZ2jddV8mu4B+94r7HD99f9T1g5ab57y42icshcjXMx+oG29I/Q7A74CQ?=
 =?us-ascii?Q?dg8sfOQocidqH1hJw2Y7EirOppBjxJlwSPlyuEflfmTgDJwbQN0M1fc4XHW/?=
 =?us-ascii?Q?Jujd29ZHXvoS9OIFKxREEyDbaByOJ0gR/gAnQsU3+vHSeaSW79UtXWffc/zJ?=
 =?us-ascii?Q?NrzfaTaRXj4lWMfteuniARm2dgR6ebAkvgJ97f3kCgKAOoZO8Wy4oqbETo3y?=
 =?us-ascii?Q?zG1V5cPG+9OArBBONLIEg0KCSUvpfBoI9Z18O7LJeUESlJROnUGvjTY9VSWH?=
 =?us-ascii?Q?dIdflziID1D/zCFlOAdXgcn9LoIRAbmuv3/pdzmc4dPbYzX8EOEsoUjSmt4H?=
 =?us-ascii?Q?cg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 26de8f24-8394-4bef-b52c-08dbc506bff0
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2023 18:21:38.5258 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x4RtGldh1V594ind3/neZKdswXCEXJk/pVKXgoJQKtuGszszGV85JgwkhFQsoHU+R+gK0dTjJQZY4LXEi6nnS5O2kkLLg8YiH4fAcvVm4r8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5521
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 5/5] drm/xe: Add missing ADL entries to
 xe_test_wa
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

On Tue, Oct 03, 2023 at 01:37:16PM -0700, Anusha Srivatsa wrote:
>With all ADl platforms and subplatforms added,

	  ^ ADL


>also add support to xe_wa_test kunit tests for checking
>their WAs.
>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Signed-off-by: Anusha Srivatsa <anusha.srivatsa@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

>---
> drivers/gpu/drm/xe/tests/xe_wa_test.c | 1 +
> 1 file changed, 1 insertion(+)
>
>diff --git a/drivers/gpu/drm/xe/tests/xe_wa_test.c b/drivers/gpu/drm/xe/tests/xe_wa_test.c
>index 69c9ea1fa82b..6e1127b276ea 100644
>--- a/drivers/gpu/drm/xe/tests/xe_wa_test.c
>+++ b/drivers/gpu/drm/xe/tests/xe_wa_test.c
>@@ -50,6 +50,7 @@ static const struct platform_test_case cases[] = {
> 	PLATFORM_CASE(ALDERLAKE_P, B0),
> 	PLATFORM_CASE(ALDERLAKE_P, C0),
> 	SUBPLATFORM_CASE(ALDERLAKE_S, RPLS, D0),
>+	SUBPLATFORM_CASE(ALDERLAKE_P, RPLU, E0),
> 	SUBPLATFORM_CASE(DG2, G10, A0),
> 	SUBPLATFORM_CASE(DG2, G10, A1),
> 	SUBPLATFORM_CASE(DG2, G10, B0),
>-- 
>2.25.1
>
