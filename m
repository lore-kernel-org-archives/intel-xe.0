Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90670EB64D0
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jun 2023 18:02:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 671B710E3CA;
	Tue, 13 Jun 2023 18:02:25 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C4B310E3CA
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jun 2023 18:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686679343; x=1718215343;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Zp0PyJysrk801Eb+YF4UortcQ0VUMgUEveWfJlZKCmk=;
 b=b894JpOfKvKPgPvawHuhJtKe4dMD6/QYQl0FAzkqtE31IKHavimO0Rji
 zk8/XO54FsiOb+JHB4ha2QQH08OSGxcT512mWR0oJvX2YtIhLmT78nCGq
 adL/Q9EqIhb8hdYr2wk8Aeeuc/tkLyz13OKjcsv/N5I5c/I9MSSvzDqfb
 n90mGY5G91oUCHYVxdLNBK4IiRTnU6W7txDArMQqBGYssTx7Hb9TyqO//
 Yp+sBvFFUdBzvRun4KJzMij9zxk85w6JzMcdSeQPmS5RkvkBSA1EiKtMO
 jROHsLBli7n3tfom28OecCIpoE1W933LIIYwOueeICRu6gVXAblfr+ZmY Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="357294560"
X-IronPort-AV: E=Sophos;i="6.00,240,1681196400"; d="scan'208";a="357294560"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2023 11:02:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="705919964"
X-IronPort-AV: E=Sophos;i="6.00,240,1681196400"; d="scan'208";a="705919964"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga007.jf.intel.com with ESMTP; 13 Jun 2023 11:02:22 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 13 Jun 2023 11:02:21 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 13 Jun 2023 11:02:21 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 13 Jun 2023 11:02:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TwkxpEDTO0PR7hHIDLKl+53hAMBqFVTQ/LsfK/DMK7a0sXlV3Dj6uc2RB+BtC44/WQ6Ku81aYHbHiRNtZ0g/+F394YIGz41iELOnTME990mw3Fnk+pSWslyN+7uH7fbO7KVqHEgztHz1frAWvI63hpkGwMrhO1a1aBod2Dj9m+WXKnANA1bIM+gexfou1J+xUUJiIsLJ/C+d8WPJMYx2NNXryZ3M2A6v94DGYL2vgP5qVgMzciDu88hPiYp/FlK8Y3CB/6b6/LsXfs8KKglD0CfI5aQ97LT6PoIUHrFB+U6ed6oxfoF64uS2r9huMAYOzGumYeEQYODmrDaqolSm8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+QxXsJpJbRNC1OLM8EJzNeU/uC5agvxlPAdQ6iZwKRA=;
 b=XietPTYKF7NkstzDdGAifiDRePa9Rwdx0xmx6xDh5obSzW6rBYDM+2epOZrcxjbtOkqZbHHW7xnftySsT3BW+o5u0QDb3rb4bbjAwWp5I05JERLzdAdcUiu1Xn6gBmnlWp/uF1JDEUfhi3UUpqgSNbcHlCdJWrwwpt59QF7qNPkpD8mFuzlaYaMrYgQH3Uc+hcDfRm5bOaTUmBIFyifCskX3XRShDtJXPCbAz/jvygVQXZUvf6wodJEDn6JXqiXbCqXNWNmS9EZoR1Mb/NopkU/ImRfG1m/xVCnq4QhNImDfkIY2wvqoDQTcsexca1RvdXewEmZzSfhbSGHpsaxZFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CO1PR11MB4819.namprd11.prod.outlook.com (2603:10b6:303:91::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.39; Tue, 13 Jun
 2023 18:02:19 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%6]) with mapi id 15.20.6455.037; Tue, 13 Jun 2023
 18:02:19 +0000
Date: Tue, 13 Jun 2023 11:02:16 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Anusha Srivatsa <anusha.srivatsa@intel.com>
Message-ID: <qfu6id7vlnjyvgsnrpywhvydteb7pfpw7j4w3zvf6hus6knd5f@jf3tqcejc4ni>
References: <20230613174740.786041-1-anusha.srivatsa@intel.com>
 <20230613174740.786041-2-anusha.srivatsa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230613174740.786041-2-anusha.srivatsa@intel.com>
X-ClientProxiedBy: SJ0PR13CA0111.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::26) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CO1PR11MB4819:EE_
X-MS-Office365-Filtering-Correlation-Id: a1347ddd-a455-487b-68af-08db6c385442
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1bU3/gWOm+42vF63JogtE6lhHuXn6Lr+I6TwoQenIYNZpb0ilyI4iPHRGOfm21qszFvcrf019xoQAvWxbH9TmkNm3NebtOd1f/OSkpG+ig+SYx8Ra0462wukufW7N3hOCnzKCZ1ShUsM49rjj9ViqwkbaTn2kPAZ6jS/w4GXHgP8ACC966lFCuIOFkCYIZOl8jWXTqNSop0P6Hpy9XnK2RrasktmPQDG873dccRWb7OObQ8oqf1TRgFeU6SMXV3Nsdb5AIx9wLCDXN/ydkGmq+1GkCNXYk5aD388Y9FprHi8TSKaneRR4vg7zbtalLoX6ruVfQSADyAiXVf2+9pnusH+f0UKWNlKXZnln8IkT7XslbWJMz/mjjQWl/smPgUYZeauH1gn21Qia+YWf2WiN6mvw/ehoVUvf5J0X8Tw+OLqWzunI65VE9ZcVvYuaQyaiaP1Gpg9D7sPmJOm+MH4V5ikI9KUxEgjyaZwO2/Q2bqRk04I63yAkfw2oSQ/XdxajIajLL1j6JvkC3f2G4m1oXMOdD7Ll/Mro1mnr0fR29SeuNYpoZVE6/qFUc+n+qgE
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(376002)(39860400002)(366004)(346002)(396003)(136003)(451199021)(66476007)(82960400001)(478600001)(66946007)(5660300002)(6862004)(8936002)(4326008)(8676002)(66556008)(38100700002)(6636002)(316002)(41300700001)(6512007)(186003)(6486002)(6666004)(26005)(9686003)(6506007)(86362001)(2906002)(33716001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?653e/ldgx8JOBClNwqaOSNRP215Swgzp83CdrW088iTC+uziY8PoPDPWenwX?=
 =?us-ascii?Q?QKa3Rg17gjIbwBNLK8rH+QWNZNTGlxZKHbPrp7KbJ6wL7nnaZ/6fciczy64l?=
 =?us-ascii?Q?DdW6e7Y16QtpxxosSrXwetr9iGaECI3pNHvELkKobdJ3N6t5a15hOXX8WSt+?=
 =?us-ascii?Q?l5Yilj0sQrkXCcsW/O0/Bgk2/sOI7tHA5RrppbZkZkfbbTP5SObFSusARH6R?=
 =?us-ascii?Q?gGKaxWkgZE2us9UNQSktPwriBxGsO1/SBcMLzUyHKYzX/THtSeqF5XMOiSLq?=
 =?us-ascii?Q?zPrva87ENhcYsTvOZ/2/ZpGRlX6pXtR62AnkHQQaaBdGSqjBqKzrvhCsZrEx?=
 =?us-ascii?Q?GLtY+wtG2F4sopdiRnoQiNBUnFuh1VoC5WGrpu+wLDiNQBHdRkWruICFGcNm?=
 =?us-ascii?Q?GwQOD18LBxOSptNuppYcpVt4e5MNECwEpI0FQOzdSdDCcvdJOGeQi2f1r/lV?=
 =?us-ascii?Q?kPniMTvyS7X5VKUksyDUj90oEQ4nInGNLtsqs5YXcKdv6yTuXU8gXxaBxonn?=
 =?us-ascii?Q?5dfXQfTpO3C+XY+aon3p5IAdiMnGct2ZK0XNBPDyN5k/GyHVBrVEb4d9tKLc?=
 =?us-ascii?Q?eTiGNn5kkh6503tccB603eLCEQOEzCu9GMVxNfwm7KU/SwBfrfIOY2T/a7oR?=
 =?us-ascii?Q?JOUMWohEunV0DTZYUUACcovq6bQX4gYUcvIPG6PJxQaphvZvlg1sFsCiBz59?=
 =?us-ascii?Q?347FmwyqziqNBoE/TPbfRz49vNgY4a8OwXF/tJKFdsQ12xbtLtZNuSaSiQcn?=
 =?us-ascii?Q?+bpm4K4qDF1e7jB7Qzh5RhtmDXXqH06s43yrd76E20/MiaFOkzXxCzrv2rSR?=
 =?us-ascii?Q?0ISKpPPT9bfaKz6vVhaeoBvZLOKMi9FDCQPfiMk8GhqQeweLOy3b4HnldJjD?=
 =?us-ascii?Q?rSl7xB1zoXV3EAZ6QnPSXb2dPlnQ/OVaqdjifXfCc8nGkAoBqxBWYqB6C7M3?=
 =?us-ascii?Q?GJ7pL9LVAFh8AgqC5B1dhs26DTYM6iddqdnBIfsyVW+fEhHNZYTWphSxrOCZ?=
 =?us-ascii?Q?SFAjQRKj9py9eGmU0ExwDlZcka8cdMu6sUeQg+l8WsZet/QEn3JGf+75d6sq?=
 =?us-ascii?Q?I48tTF+SHfNlsqwB7cnuxbfj17M+rGYd7GzDtE59ASDQKVnSslNrvde0z4fO?=
 =?us-ascii?Q?3Wj+UFR80J/iOnC15qRfFQIsH0/fgeEHZNNjuczbr2MPqGXiVV7S04dHU/jm?=
 =?us-ascii?Q?73UqdJnoGdNPp5eF/hFmUMP6Ozd9Ps9ZMoqfD7sVNXDE/WC+1ndPP/Ze4Sse?=
 =?us-ascii?Q?tdYMBkY8lXcatCV8aKYSbiUgsM/rKa53WJotlAxk5Gg/wg8PgVdvO2+6BBoY?=
 =?us-ascii?Q?4D+DeJs/RpaZdIkbh5mQQhgFUw+9cP+d6lllZbh00MSS+Xdb4YikTCBfLTPR?=
 =?us-ascii?Q?OKQT7O69uJcO8GbBvrpJciWG8Gwa3RV5n5raL+bUw/uI30NcQgKI/UoBtBuq?=
 =?us-ascii?Q?eDwNu4LT8qv9cK/vjETuanaa6CuCBIZ7L2Z7FkRr5OPhn09c0jfzWvTKHjYF?=
 =?us-ascii?Q?qAcJFO67HC00DG2clFB0coHzdjOu3oEJpFjAr9TEN/AEjO2vkkgVOTw42TFY?=
 =?us-ascii?Q?GMLw09ofgDMSYMGL4XUjd2m3vPNOwPa/1PqWLPzVUQ5PO1a2q6DO+uP5bGH2?=
 =?us-ascii?Q?Wg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a1347ddd-a455-487b-68af-08db6c385442
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2023 18:02:19.2033 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5qYQXAgVyxvQk9gs7ZfeO2dUpPiiWkr4rDSn4hDizWMoIzsJE09feTp5WpipXWwbphc6ib6LWYQ++wDFNpMdZKheb9M2O3ZZfFE3f8/Ay2c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4819
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe: Add missing ADL entries to
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

On Tue, Jun 13, 2023 at 10:47:40AM -0700, Anusha Srivatsa wrote:
>With the fake device creation fix in the previous patch,
>adding Alderlake P platform in xe_wa_test.
>With this, driver is able to run the kunit test for
>ADLP properly.

nit, small reword:

With the fake device creation fixed, add Alderklake-P platform
in xe_wa_test. With this, driver is able to run the kunit tests
for ADL-P properly.


>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Signed-off-by: Anusha Srivatsa <anusha.srivatsa@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> drivers/gpu/drm/xe/tests/xe_wa_test.c | 3 +++
> 1 file changed, 3 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/tests/xe_wa_test.c b/drivers/gpu/drm/xe/tests/xe_wa_test.c
>index 7a86be830b93..16f7f157c875 100644
>--- a/drivers/gpu/drm/xe/tests/xe_wa_test.c
>+++ b/drivers/gpu/drm/xe/tests/xe_wa_test.c
>@@ -46,6 +46,9 @@ static const struct platform_test_case cases[] = {
> 	PLATFORM_CASE(ALDERLAKE_S, B0),
> 	PLATFORM_CASE(ALDERLAKE_S, C0),
> 	PLATFORM_CASE(ALDERLAKE_S, D0),
>+	PLATFORM_CASE(ALDERLAKE_P, A0),
>+	PLATFORM_CASE(ALDERLAKE_P, B0),
>+	PLATFORM_CASE(ALDERLAKE_P, C0),
> 	SUBPLATFORM_CASE(DG2, G10, A0),
> 	SUBPLATFORM_CASE(DG2, G10, A1),
> 	SUBPLATFORM_CASE(DG2, G10, B0),
>-- 
>2.25.1
>
