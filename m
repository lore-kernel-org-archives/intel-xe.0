Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98788C4828F
	for <intel-xe@archiver.kernel.org>; Fri,  2 Feb 2024 16:16:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 668AE10E0D4;
	Fri,  2 Feb 2024 16:16:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cjMIQvSC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57B6F10E0D4
 for <intel-xe@lists.freedesktop.org>; Fri,  2 Feb 2024 16:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706890572; x=1738426572;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=lp2s5wAOgIan+rBo2AAWrQmQ28ysB0eZObDWisrZ9O8=;
 b=cjMIQvSC8fWRj4pO6qmkMK8VSDIdJoXCzH7aMivTYGxnXBiDskUZUc23
 r07kzzSCEX+/jpIR+FyrJmODMJyYHIMHmyv+PogI4mr/amhue5g1bJPIp
 UDH3O9vZGTJomNLB25fG0O/fDNE3PutQkzRsHFfKqmKjFs7KCfWbYTvbx
 s1K6sGQwnLv3wy4e3f53bzT/Rnlvlm2XLrxXRnOVhpl5SO3dNbpND2y68
 D1otILLl9tkGASnsQwGf7WITOJkueTN0UX+QyzuuNIwBxdA+Ny3+zKJSo
 utcg1HTG0I+GV87M/pwEEOTrpUnxgC5k3x1eJMJyyxT8IeOdahdjiLgg4 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="10838401"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; d="scan'208";a="10838401"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2024 08:16:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="4720310"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Feb 2024 08:16:09 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 2 Feb 2024 08:16:09 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 2 Feb 2024 08:16:09 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 2 Feb 2024 08:16:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ToO5q3XK6HsPPsMJ6pAc8q0RCoOxDh55H3L/r8VgEhlLutSZvhK2CSbKfwSUu0siajbnRdZCR+bYcs/QueyKC7Xe+oQI9haC3onXa/slFh+MR3TurMj1tkDDCeo9C+RqLzzivbGGaN1qMUZby/M8CKMCpoN3d1nf7MxCu0hRoO3tnsazul5L1pEr6jCpXKQEaNxLJ5yoIulu8qIlufNfiu8cYCPwuzgLwe6oy50XL0VmcQE+1sJlBx0wdutcBxYTOocWgdnU7iYZPuxeSYCEfFulGyNAtDZd8+7APcMgHEeOo/Zr3DrepsP82Bu4fmy4IgKLZsmnvE5dT6ra303NOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lp2s5wAOgIan+rBo2AAWrQmQ28ysB0eZObDWisrZ9O8=;
 b=V/u03sKrczS1p25Ig1UdNFfWJ44m0QT39YKALqjHIWSJ1AgvJg1xPTzHKqJYzMRmdXbuF+svLykV/2fLdGyHvfbFpjkbqWjxji+SE/bnigW5cUR60MIxhmuxI8nczIWQT4tVvAQqgI9CLGDfzBZeLfZdAcqNwmcqDdfyHC0071LSzfQGIh6Pv2sM+VdCdjwbm9IC03TqNCd8ohLT9I3ICB/VAYSA9ruBMK45NC3v+SU6kFvXuqzKxSWAuJtbxpCcLhYZsdvf5ID3p3OrzpEL+Ydx+jkGIDjwyiQqUH+SzmSNN0X65tX0qT9DadqNVHNJ2Bh7aH2qSOwgh6fa2JsoFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB7606.namprd11.prod.outlook.com (2603:10b6:510:271::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.30; Fri, 2 Feb
 2024 16:16:06 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954%7]) with mapi id 15.20.7249.025; Fri, 2 Feb 2024
 16:16:06 +0000
Date: Fri, 2 Feb 2024 10:16:05 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Group live kunit tests
Message-ID: <2n7w3odbffihosbib4jhh4lb6ltdxhrgqt7avszkhrdvg3bvcv@vw45dv2qiguw>
References: <20240202003047.552529-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240202003047.552529-1-lucas.demarchi@intel.com>
X-ClientProxiedBy: BYAPR06CA0013.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::26) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB7606:EE_
X-MS-Office365-Filtering-Correlation-Id: 80c6a3cb-ec5d-46df-9655-08dc240a42a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s9fb1Y6hC3IDclqx3wrVXJZORcxZcFxTjrUL0CHiavj3rZjsV3T8jIDo6iNqgn6gqoHPtK89ZaxQLGHctARaY0oWkozA9wHSizQmmXX5oMpZGowC2rm+EkchvxcFP0FpabukedjoRyC+wwREXhutaI+b+Eq9BcPNYl78KWNCXd74EgagRsDHWJLXyRgNiLpiMDSM+hL9TXrnzo8V8CV3f5PHm5oTUAUKiMwEryq2tBch9/6S2C9+D0sEkqXwscI3NujHwBuXDPqjeoep4NRuOT8fyl7DRvVy9v2/JlvSMD/1kHJyaDx/CFBkmBJKeFX9Ltq8GZE34DM2hs/kpPzCaWUCPBYDX8Xf3HlMD4PIwD41TUu8owkz65fZyz8hWCfsBBxAaoCz8kbuRiq492SNl/zBMGQc0MJUZ0XL3XXxKj6tVHFdNI7sttKcE79pErFx+lz2mraXRTZXMcWbofM/87vdivUqLwfwOq0Y//yrPVZRGMJWI3sjjkqJtnR1cGmRIysCzBSBX2YqGM9lqgvMNcTWg81NsucYDsks+OHBnpI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(346002)(39860400002)(376002)(366004)(396003)(136003)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(2906002)(4744005)(33716001)(41300700001)(5660300002)(6916009)(316002)(66946007)(66556008)(66476007)(82960400001)(6506007)(26005)(9686003)(6486002)(966005)(6512007)(478600001)(86362001)(8936002)(38100700002)(8676002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bT3I5CpGk3iBpHHQObu4KiD4I8tXMQ+o7l8WnteCL6+Hiinq0IYUIfe4G0M9?=
 =?us-ascii?Q?dePOLWPYBqGn+MHrEpVWpA/scEhg+BaOVDxttWZohjyST5kZ6CCO+o4i0uqq?=
 =?us-ascii?Q?6+0hV+lqt8QK8l97asWrC/gBCtF3+byLwKPaOPBgv+AhE59GF6ciY6G3+4nT?=
 =?us-ascii?Q?5iHiTeA27/rEvSl3AZEYNa8dwzUn1s+cJr2B4Y/O8MYp2xnEwOt49I7W9/Ak?=
 =?us-ascii?Q?aZZvdW4rg5NhLmeAiVeKW91U5kMtY8ekyJm05XbDIwjALwSNteklzu4WE9ZY?=
 =?us-ascii?Q?PynHWUQogaL8pe56IK65avJnojcejQ2ikfyfRSy+rIko8fpuup2AC8inO/C+?=
 =?us-ascii?Q?9v300b6oqKdvY4EDI2rYQJLl+tXfQj409FQ5EEtmzJLFb33Y1vXcy6vvLfQG?=
 =?us-ascii?Q?ecTaC2DUgdqMxvVIRPYROZg53GM5cMLu+TLBGvo/6UmmbvRnMP8UswIfWN+P?=
 =?us-ascii?Q?kpcpSbpkg1qjmoT0PAMiczSZO2w0FMV8/JQP9WtFOJZPMhn9ak1sQbTKjpEl?=
 =?us-ascii?Q?m4u9wQTg4djHB6WEO4MHpIAQAOwkB5epynBBulpPk3oBPlil9sPrOAX7ImKD?=
 =?us-ascii?Q?4Ay3lTdizN02YBTTyzkLi4kZxPosEIvCRn8N9hK0kbFEz1cGEKMrY2t2cNdO?=
 =?us-ascii?Q?n23uz5ovkMkVn7Gf8U9C94AJ+vS6Oh0bR9WyFxhoAArNgAG62x6lhqpNT/FB?=
 =?us-ascii?Q?r/CaSi3jvqfYGtXCtUScBZRzippnp4AC4WrzsplngS1yyO2h3dGyC53yxOoW?=
 =?us-ascii?Q?naq2HRl/NxU2U9poALLbArS9OYln6Q6NyI78tEaCnIkqmMLImuTZcVMfqprL?=
 =?us-ascii?Q?gGjUx1wY2msVjcsMmWQt8vGTHFQc+sI1Ra3ZjBXWmnkHDBcoEJ7tmOnWBNZ7?=
 =?us-ascii?Q?iohWzXa5vCSdcGdtpyTZlKoHzOqzkT04PDj6xfAlW6pNL7r8FmLgTBC6RfsQ?=
 =?us-ascii?Q?A7Wsf7vnyC1EblQLptb4KfA84M6SYQ07AQ/91RLdl2QISglgSnoulVarcIsk?=
 =?us-ascii?Q?AFhdBEHhcvYIp0dF+lsvUX4VaC7vlKKhbtFCrSbswhEcm9/D6GA39gMvjsRD?=
 =?us-ascii?Q?9ja0XC7QXvIGefdU61fDaBPu60wov2xR2wQ9mU1QKLTeR5XeyrlZXM5HWPqH?=
 =?us-ascii?Q?FNBogv6LL93d0cu8Rx+dPbhXl5yH8kNG+rLaAk0PPpXdb+ohR66SSd56h0HM?=
 =?us-ascii?Q?aWA/4urZ6x5tAWOKgNiR7id9OJTlP4V3CCoIr8oPWLzRV/Y1/oUXJaQH6Yan?=
 =?us-ascii?Q?5SIwxrNRH4xO4OaryHqrIHe1IHYD3MbAcUAF5RhCFUER1/ADHXzHP/JI2FD3?=
 =?us-ascii?Q?3PS39jNL+w1dUf7m8Y73itVT2tubshG58WQTsaAHlv7D996rIkYf9mxhxFFp?=
 =?us-ascii?Q?dYVdlHlhg0qdxwAwj9fG70y0K8l/Axy+JlHeuE5KfLDJbzf2jZaq6F/ijtxf?=
 =?us-ascii?Q?eBy+LkphDFx2QipKtFGvnQtSLt5hsdznN1RtpKF3rw2+wl4znMxRaqDZ34xD?=
 =?us-ascii?Q?ISQ9Sq4VVy8LbhE2DqM7yXxWZJd4/3nuSkxpK7tg0/5CmHjT7jr8QRcVM6QG?=
 =?us-ascii?Q?rmX/qbXyQFCtkKCfNR3f5hRI0aBlFLWGwLecRYndKrutB5D6J3pQlWlC3vJ8?=
 =?us-ascii?Q?Zg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 80c6a3cb-ec5d-46df-9655-08dc240a42a6
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2024 16:16:06.8107 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TkRtk+zygahPJJVP36hNuaFtDyOuNngdDbNMy2bZ8JCoO9ciUvKfAS2f7fAQjM/b2QdqDlgzWjGUct3obSCV8tcwK4Ht4yHqEQQxngyHDXA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7606
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

On Thu, Feb 01, 2024 at 04:30:06PM -0800, Lucas De Marchi wrote:
>As was done for the normal kunit tests, group the live tests into a
>single module, xe_live_tests.ko.
>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>---
>
>Sending this again as previous version doesn't apply anymore.
>The IGT side is still being worked on.

wishful thinking:

Test-with: https://lore.kernel.org/igt-dev/20240202004529.552806-1-lucas.demarchi@intel.com/

Lucas De Marchi
