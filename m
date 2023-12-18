Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF445C35274
	for <intel-xe@archiver.kernel.org>; Mon, 18 Dec 2023 22:52:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84C7310E3FB;
	Mon, 18 Dec 2023 22:52:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE61010E3D1
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Dec 2023 22:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702939934; x=1734475934;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=59gUGDH3oCK+xl+iz41PBlHkMLJjkApxfjxSJYkgi6c=;
 b=CFuatjh1loYYP3+wQf/VKxmubGV8yOvj0SMHooizk3JDA4IoRBV/PD5E
 mNW8A5alfBUKdey+hf0lbW1DwIeDXDMdpAmdiRWnn1zmd90cgD5DdYtaq
 kVWZFCbSMyEYRahgnx9xsGuM9X3Hon/4NE0y3zN+otQABi/RsPydyaizF
 faiqkBbnrJJbVov1eMmctqJYRIjSz6WbGdLUR7dRlUruqbgYJRBQb3O7I
 luRcQ9ALim62W+dM7qdUYUdTlsGUvJehD9SHb2U3MG1WUm/GzxOOVlIWO
 rLVGWyxcByqMKg4RV9A9ggm/+39/dM9rjuzouLy3s+92y4U+EwjNyGQ1Y g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="394456062"
X-IronPort-AV: E=Sophos;i="6.04,286,1695711600"; d="scan'208";a="394456062"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2023 14:52:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="948947497"
X-IronPort-AV: E=Sophos;i="6.04,286,1695711600"; d="scan'208";a="948947497"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Dec 2023 14:52:11 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 18 Dec 2023 14:52:10 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 18 Dec 2023 14:52:10 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 18 Dec 2023 14:52:10 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 18 Dec 2023 14:51:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j9FSPYTuPAW6sUb1YvJHDae8QCN9IqA/aDTLfFXLL2F8eaRTWlO4wF1AvNIR1yduK97AzRwEy40a7grnvgd+1f7zRXJ4wdKTBoCqVdEW+S50DJ6dqjNq2ASmHS7k9HAMEDJu+u1JW3yIgJ9xsJZIvHU9s2ofnE37msqvVeYhWAun2WzeXPff+ZrW61qfPw7UutRvljxOsw9g0Ffs7TzcrLW8xSCyeU/7GIuXqy/1KBPtBG10+9claGhVPpYj1sMEYOPL14BmUThW22wk0Nx16YbLk6LBF7k41Lg2C2yov4+7cH6kQkj7vToVb6Idn+tUb/Dgh96s/QQyXqENwhAa9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xLbeBEHMRbxRARcc9E4TLuxZxodXcLhGrx6qUkNyuac=;
 b=W6PuTyuvY7H22PNkJvvJAs4OjO8uo70l+4wl1omogXL2FkJyeOFigK4RrTBMlap2XbD4DU8M+qktNcchNqx/PZL+d1dNkZZlk9+ppZ+W3FvfBjwhGJQlpIkkMqNxYGYAuR1mK/7GktwqWEzdCvgNJjocF3+PpmgXWrHiTbih66/J7zhNyF7ED77qHP8kSbISWdkhuSR/kCKN2RwMenyWwJLF6dWic7qxO579W2mIzB8ZRPjh7fq/eJPaXF1H3KS3vSLy4c6cvDuyQYz6M9AIyD659LY5/HH5D/FGpDYLhMonqGS3li+wt6MoWCe6vJR/sRkxpLs1Aq4mUagpd+zN3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CH0PR11MB5692.namprd11.prod.outlook.com (2603:10b6:610:111::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.37; Mon, 18 Dec
 2023 22:51:42 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b%4]) with mapi id 15.20.7091.034; Mon, 18 Dec 2023
 22:51:42 +0000
Date: Mon, 18 Dec 2023 16:51:40 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v5 06/10] drm/xe/kunit: Restore test->priv when done with
 fake xe device
Message-ID: <zejx7m7t65tbn2wszu3zbuipolg2ya4p4uyxtwqrbc7fv7r4ol@hjrx3x63ay5o>
References: <20231218190629.502-1-michal.wajdeczko@intel.com>
 <20231218190629.502-7-michal.wajdeczko@intel.com>
 <hs2ypa4c7mfl2xg2wji5wob457nxivxp7eidrb7iflnjedhewy@uux6gh7ozhlv>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <hs2ypa4c7mfl2xg2wji5wob457nxivxp7eidrb7iflnjedhewy@uux6gh7ozhlv>
X-ClientProxiedBy: BYAPR05CA0056.namprd05.prod.outlook.com
 (2603:10b6:a03:74::33) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CH0PR11MB5692:EE_
X-MS-Office365-Filtering-Correlation-Id: 5494f1fd-1ed0-4df7-e38f-08dc001be71d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /ntaot+Cg66wjEk7Gc/ck0YrwqGfvpjMA19H7StKozeXUaoWnSL5H8/MzW3bBCUFVQEbxjjb/pfWqpRbr31tjf4Mn7SLk/VwFrHzqGBVa6ypHw3Vo+ZHBVOjww5dW3S06A9hI0HcUOTTu/YQtzjoeuf53moCCsg/auFZkS6D6ErTxoP6AAp5LciPiKW9xaptFc3CY9CVQpsmO4s/q0Hd2VdKn/bQJoi6XMiewD0u+J0D5ipZmowz1/Rrq/5aPywds3Bu05qcawZmUhJ0AvIvVfyCSDoy6uhIoaj/uTS1a/RPfdnybTgxCADUI+8yAhEROENQti2u6gvS6GSCmh6fGWtxxOUb5zJhK56zcjt8gInJHHy0Xc3U6DQvzJ05rrPm2XN0sHmoHFW+3sw1cPtQJDx2IGTnbmotm3dQeWaa2tJFvvcUVC6BcI6zSXQf8vcb33uJ92n+MbCCvyNOhV5Dvln1DvgJKK29O3KBdwq+J+2+pwSmtxnZpJTl9NE8Cq4OAKm7gQjWcHHc/dtbGotVJ27+7ZCT2mFyBzeKfjJs846DgFiVtBl9iaD3yac6CXDPc57hkoefJ1kN5v64VM8+Og==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(376002)(136003)(366004)(39860400002)(346002)(396003)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(4326008)(5660300002)(2906002)(8936002)(8676002)(9686003)(6512007)(6636002)(83380400001)(316002)(6862004)(66946007)(66476007)(66556008)(82960400001)(41300700001)(6506007)(6486002)(966005)(38100700002)(26005)(86362001)(478600001)(33716001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Tc8+3Vax2oVauRUlComQGERFBK1TKkVedgvqnJV+INqOHN5SKkdpziWwuaxH?=
 =?us-ascii?Q?C2g18e9pqNEHyMrLa5qh/Z4g7KPxnNCl889bhsMVhNSiFIafOjtSw3OF3+Gt?=
 =?us-ascii?Q?oUsagHs6yjyzXIQ4EwKPo+ue6qVWNQBe0AiBc9VYXqlgXSOZAh2FmVgnsIr9?=
 =?us-ascii?Q?lRZEF9WMywjxAfudLRnBk5fl9VZYzK2Wpk/EM3QaC1jLXLgcRpGeDT4WQOSq?=
 =?us-ascii?Q?AJ3fbVjhaatp1cr+PceKAQDKVigLDIUJj4IRMmtQoQgER+Sjd+jMILYVIiIk?=
 =?us-ascii?Q?gjchHcqXpKGhCbMH+ztEwlXQTPSpY9JZXhZjAaW+yxhq1WU56Gl/kIDh1wVc?=
 =?us-ascii?Q?MuegGH75Sh1Mh3ETp4agjZBsatBQ8jblP/J2i8s1qJHRcbuajRJsVAN2zSAB?=
 =?us-ascii?Q?huTJRjK7PCy1WWaOOOmR8cDLjXctizekd/GnRTfV70jWGzG+AhGvSWs+XyNT?=
 =?us-ascii?Q?wY2R0xoPdiiYbRq4mvRWsaa6eQm5Iqqf1bepC33+i16OV90ctMzM8YrFaea3?=
 =?us-ascii?Q?Of5OZfOqzH+IcL8KpiODdZ4w9TJtLKZZgKirqcLtD0RFT01Bolsvv7beNVXH?=
 =?us-ascii?Q?pjswA7IjrmPYA6j5sF5Nh5X/1avUhMXBJWhqTJL67e4MCUzu755m+/Xva+WB?=
 =?us-ascii?Q?B+Gmg0UYyLwfJ9/VBMf2cRgv8h2J2T0P0ytSnsgikFOG3kxpK/SJPU92FQ1m?=
 =?us-ascii?Q?nLasw6dTLQown7Nb3XyetxM22/TcZH5C1YMzKp8cI9gZuuVVY/SUaHfJ6jt5?=
 =?us-ascii?Q?icN8z6mTj5GEGAwPcru5UWccb7IsL7/+a/rzgW4vaeurlChTDqwGqoBJG1Mj?=
 =?us-ascii?Q?+xwNZjAtiLkgV9R30InzSymOvTPb0/FSQcc4IQSm2PPXKuJTo65k7KCpU40O?=
 =?us-ascii?Q?RtnKMMA+qZUCXz4Q8wfXfxmz9COuKL7YBWNWT7OAmOeKq31dPWieXudXLRRd?=
 =?us-ascii?Q?1cVoID8ewPopJF2rXJnCx6KmGxczhvuXkfy9/BdNpnGOsL3NhQse1t8F2tCg?=
 =?us-ascii?Q?qQTRss4Y/iq04GsLNmIid7vLPNDKM5httDxEAb8jvdaAzmHMsBTS9cS0WR7X?=
 =?us-ascii?Q?O20hrD3d8xz8CZLVAXRo57FpN9nNm37rQfDu8jhc/joTFU8OSQwRU5+YrLgz?=
 =?us-ascii?Q?BWd0riXikN6VJTlQnb8cqQCGLdGJ55WI8VQHlOU8Hp5Xy6S7bviq6X8Cnmbb?=
 =?us-ascii?Q?UCRRN2Mfo7/QdGiHHT2d6DH1LiJxRtTS0RJAkWTABKuKfKyDaQ3t1UtmStmV?=
 =?us-ascii?Q?WEEJSBQC+PcSHlnSQLvzjxqOBx1/qEp/+MeuNsXpUn0vj0qnqhHD2dyPG7LL?=
 =?us-ascii?Q?2E9cJ22/GkwmDq7xCkC7ypWmym+Dn6WOqqsWh8pqDmZobwnZSuuHV9v2V2w5?=
 =?us-ascii?Q?Bf7lt/WI5to1rbjmHCi6fKbG1o6pJoljnG/w00+YhFLusWrb1K6xt35QoCSG?=
 =?us-ascii?Q?GagLRBp8cdumLyw13R85vQvFzm8M3kR0Zrpui5LlNhuUPi6EkamUskI28wNE?=
 =?us-ascii?Q?G1nkDfe0FtSJE8y4LD95wFElIxVcOmNN49axem4pRXAC38gkqhtjyylAdjTZ?=
 =?us-ascii?Q?Xw5TqyGSDAPBwY8mzre9BkuGkDop1E37ZPPD7K37bTX0dXVNP+xZqWeIV9vB?=
 =?us-ascii?Q?3A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5494f1fd-1ed0-4df7-e38f-08dc001be71d
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2023 22:51:42.2966 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HXZ0hX+aYocqalVUdJyu864b7RuRV8iWQXtoFiTAS1fNaF2n/JOc24Nb7xi0GQqcMMe+3muoGBmIzxtZC7Q7dvM4HYJiRN5ixuR2M3stbGE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5692
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

On Mon, Dec 18, 2023 at 04:45:35PM -0600, Lucas De Marchi wrote:
>On Mon, Dec 18, 2023 at 08:06:25PM +0100, Michal Wajdeczko wrote:
>>Current KUnit implementation does not reset test->priv in case of
>
>I don't like much having a workaround to this kunit issue on our side,
>but you also did got the kunit patch reviewed at
>https://lore.kernel.org/linux-kselftest/CABVgOS=imuVpgwwhSb8AQ_=YG2bfK8T5DE9yYr_XUb1CPDzxgA@mail.gmail.com/
>
>Hopefully that will be applied soon and we can revert this.

just refreshed their repo and noticed it's actually already applied:
https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git/commit/?h=kunit&id=342fb9789267ee3908959bfa136b82e88e2ce918

Lucas De Marchi

>
>Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>
>
>Lucas De Marchi
>
>>parametrized tests and that may lead to wrongly treat our output
>>pointer to fake xe_device from first call as input pointer with
>>xe_pci_fake_data on subsequent calls.  Restore test->priv to
>>original value to avoid invalid access.
>>
>>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>---
>>drivers/gpu/drm/xe/tests/xe_kunit_helpers.c | 10 ++++++++++
>>1 file changed, 10 insertions(+)
>>
>>diff --git a/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c b/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c
>>index 6d72dbf06139..fefe79b3b75a 100644
>>--- a/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c
>>+++ b/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c
>>@@ -41,6 +41,13 @@ struct xe_device *xe_kunit_helper_alloc_xe_device(struct kunit *test,
>>}
>>EXPORT_SYMBOL_IF_KUNIT(xe_kunit_helper_alloc_xe_device);
>>
>>+static void kunit_action_restore_priv(void *priv)
>>+{
>>+	struct kunit *test = kunit_get_current_test();
>>+
>>+	test->priv = priv;
>>+}
>>+
>>/**
>> * xe_kunit_helper_xe_device_test_init - Prepare a &xe_device for a KUnit test.
>> * @test: the &kunit where this fake &xe_device will be used
>>@@ -74,6 +81,9 @@ int xe_kunit_helper_xe_device_test_init(struct kunit *test)
>>	err = xe_pci_fake_device_init(xe);
>>	KUNIT_ASSERT_EQ(test, err, 0);
>>
>>+	err = kunit_add_action_or_reset(test, kunit_action_restore_priv, test->priv);
>>+	KUNIT_ASSERT_EQ(test, err, 0);
>>+
>>	test->priv = xe;
>>	return 0;
>>}
>>-- 
>>2.25.1
>>
