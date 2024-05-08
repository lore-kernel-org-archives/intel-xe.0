Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A819C04FFE
	for <intel-xe@archiver.kernel.org>; Wed,  8 May 2024 03:34:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D99B41130A3;
	Wed,  8 May 2024 03:34:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LHWA34AD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A39E1130A3
 for <intel-xe@lists.freedesktop.org>; Wed,  8 May 2024 03:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715139252; x=1746675252;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=5rT0bdScNljFRwhcS5cPcbmeIbukx2YNkYq10taKavg=;
 b=LHWA34AD8tccj4uqW4C8kyhtna52ehdLOUsA0Gz4tFTbPeCIgQLXY+3A
 mrEhTLi98+t+3wWbNWinjxzh5ZSDLgsXtdtupyZDMeCWC33Nr9LZf1uM2
 IeVzaldFNWIRWxZ9OAVWFIjdnjDGuNTAvTuCB8ZJabGvOhnGnuvGFqfwO
 BAZ/lYjRInUXvR3M3I81lmwp3LefTVt3IcOgt8BfnIsF+INDEQPvZqkAl
 nAYCBHqNFKVf3bVJz/KGs9ObMKT7Yp1wNL43RdbKxxHVsmNikIi3cRwAV
 GvqiOzKwBaGfZe+pAj5bQjXzmB2GofkDBiK84+3Qe8S77xNoFE673JUHI A==;
X-CSE-ConnectionGUID: FBBZltyTSB+C/ZwzpfMwCw==
X-CSE-MsgGUID: qEAtovYGRfCmjioWqPc7Cw==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="10912908"
X-IronPort-AV: E=Sophos;i="6.08,144,1712646000"; d="scan'208";a="10912908"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2024 20:34:11 -0700
X-CSE-ConnectionGUID: qtnrq1wfSIeeq65JRaPUlg==
X-CSE-MsgGUID: 5zmICocdSH+whWmeEeFVTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,144,1712646000"; d="scan'208";a="33570287"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 May 2024 20:34:10 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 7 May 2024 20:34:09 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 7 May 2024 20:34:08 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 7 May 2024 20:34:08 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 7 May 2024 20:34:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OlXnqRDMctRN+QdDE/LdpjYwxEjF/t1Qi4m/u0kvkrqIM5p/OcOnUez/3pUvQYVlhhf3ZX5M1NcKuYnQstIxHF++OLHRme0Wu3l/eFXEvkifQCUqhFJQPTn8O2OTj+yaBd1ju7AfTStVxq+VIkHdLlVJlmWaaiYNhmfRaCz2+SnihiE27ufBFcXAi9qgP1Qqdvc+EK+Vso9iLOb/HnHJHmUTMrWbscd2yQZZ9K2m98F1UzH9jtcNZU9bJ8U5Dwpd5u4jnF538MFvIAncIL+C53lM9bQ5zC7jG1DYJbsVMQ2eLAD6i6X/yU+b0EpryDrY1ena7vchXLuz80f4LoaCxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hyHbV5Q64mJOq4T6TaGaIOvzBLOTJz21B1QfRz+10Cg=;
 b=a5TKnVFlfzSWipnGdvTkOcqSSt9C0UWp1Y59FMnb+W9uCMs30aTPvwQjAnc7UWMUevxow804cymRBFeOqabUmDCVvsWccJ87gDw4UISNuv6FdbfzVs5ghvYBYnqUgNhLQXchM991+FuYPyQtdRMMfB2h2vDZIu+nAgB3W2+o3RNJhU4yKAJ+CSeR2zd/ZL8l3ZmfSOKqoN+to98IPoRtmhb92gjwyWA0jj2wqEGmQ5+05GDaP0f6VsMi9UHou3480JLTJn5oo9X6f98HnqZ6La+d6eQ5be5wAas0O5P21Lch6mxmcaFEd+aJuNL9pV42iEnhbDhI8kAcLRMcjVTRlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB5246.namprd11.prod.outlook.com (2603:10b6:5:389::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.43; Wed, 8 May
 2024 03:34:01 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.7544.041; Wed, 8 May 2024
 03:34:01 +0000
Date: Tue, 7 May 2024 22:33:58 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2] drm/xe: Rename few xe_args.h macros
Message-ID: <fxdlgaucjd6kx4neblyphiz5bnxyzmxkd2flcnoajr36ltwuvn@hmiv55qd4syh>
References: <20240507152246.2791-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240507152246.2791-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MW4P220CA0003.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::8) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB5246:EE_
X-MS-Office365-Filtering-Correlation-Id: 3237f0aa-7a88-4e6f-523e-08dc6f0fb3b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tjvoHZRAU2WXzXO/L1xGFovMJEg5YLYKyiDie2DsXEFPJ+r9mZjQqCqbZuQK?=
 =?us-ascii?Q?udYXCnoJ/WveI7g1+FFLAvMr55elNK2lsHuwXVsEXAUeHIfAyJttVbfH7nOB?=
 =?us-ascii?Q?FVkaYAH5oVpGojbrZUNSPNUqmFUvlZjQZQZVuFa2dRT+FIe/MvzUeYHM+T30?=
 =?us-ascii?Q?PCcA1KakOY2KHYDE3McEm5Du4U6+HDeh+xRIP1+mHzRa4Y+DbQ7MxcIhMbq8?=
 =?us-ascii?Q?cHmO1xElS9gtPS5CCUjnE7Yqc3IchBSFxtLsYdi2IjPxP3ZfZkeUEywHVK2u?=
 =?us-ascii?Q?Q7LfkvRJ+KW5OPXkLrcYsZ8hih/AgR79Wx+9AoigiXmHi0vbtd8rUPtSmShN?=
 =?us-ascii?Q?vlb1YmxAA8K4Vho/tmkuzydIzft7m6VgnO5AL62yywFmjib7n+Vw+wIewN9I?=
 =?us-ascii?Q?VgwDp6WY3Tv2VX2t8XLU5cZG6WIQ6QAogcRHDn6zIpTb48vRL3S9plMhmQSW?=
 =?us-ascii?Q?kcOFsht/+A+r4Gl0rKLcGZYG5wVi3deBRl2FY8lWrrzbzenmLF6r4/+t4e+6?=
 =?us-ascii?Q?E5om+IYcedJpShESb2NgGb3XhmnUaprfj20myzcwIlOOafzPe3TQKcK2W67i?=
 =?us-ascii?Q?14hQ4Ra/TDeCvUGQ8fc9CjZfie7HnJYXLjw0t/hwNcAyLmxxPsd1y4PwiMSo?=
 =?us-ascii?Q?w3hdEsWQRullHAoLER/FzlhxOCuegYGY1IKtFbw0BsRGJzMnJ7gFwpG1W/bg?=
 =?us-ascii?Q?uxpRcf9JhZeyubGYlFcV+UAbpzoYZvDb1QdlTmN8N7OOeSX9upMGs+GQN19G?=
 =?us-ascii?Q?A7TXPFQaBgehSDjIYSej0xZzCSNTxPRF8bkscmiJqF2FsgXFbQ0/g18z2S/D?=
 =?us-ascii?Q?bAr5hp+TuSLbuHwQzhcjTI2AeoOYfYsH1WBc6Tj9uZzu+ZtQ6nHwtp8yCX4g?=
 =?us-ascii?Q?O/1zdcd3qGdeOgq0fQleG13Z5OkcbM5xgJ36t/BMI894gGYDAHabhME7hiAP?=
 =?us-ascii?Q?FhwsNLu5ZhV/2GW4tm4ToWGW8+OrSaa45AoRDDUM5GDsI3v0sTgseNgFpeqc?=
 =?us-ascii?Q?jqQMvv2EiUT3DTktQsZVkdNNfQC26AMDSIljxvrkp16cOqqBACcvQH8zC1pl?=
 =?us-ascii?Q?w5t10bw7/kQKvZ5o4UuIkapFmrqu+N3XbhDE/ZqQZ2i6WtIMHbtt1QJmSKQN?=
 =?us-ascii?Q?DIqbOUK7yTyJO92aE6jTalvcEBLZgvLJRiBc5eUshxU54e3X9VCAVYh0e9CB?=
 =?us-ascii?Q?X9QUfiQtbtTdjuUXjd+MKIQ6Ob8+BqxhhpbK3RdM0nHM5ZvIRCNGxqA/KsBW?=
 =?us-ascii?Q?xXa8K6Em75802dahT20ZlRwr6NOkzAMuGa+qwhukvg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rflZk0X7eWj2uo/NUNh73nUvzaq7z9Nd3u6ccKFC8/5jVlj0Bdnp6ucYXhO9?=
 =?us-ascii?Q?B3TybYZ8HGPMMUj75JbvAC/waHJTWDh9QpRWF1DF8pLpW+dUa3USweyPg0bA?=
 =?us-ascii?Q?C8V3ZPzJY2QdHaO0qC+rDWeLIr1lzpiRzT5YQULubGf/vJoIoXn8PhU/iZTc?=
 =?us-ascii?Q?ExCe6orle0rkZheZAidtUWhwiJwwm0St1xcVz+dpsJgPffiBauR4Ji5ux8jX?=
 =?us-ascii?Q?J9M9wVhM5EO+v22buc+Ung9M2MVtILhxaKtsXYVm3zmiygSz61GROx9q0nJF?=
 =?us-ascii?Q?oWdIlw36xY9V/6m4UEuOZZqrU5IgOAL/Ibz0q/RDQ0JGqQijiefXlS7H9t4a?=
 =?us-ascii?Q?/0nxcAmHSFfNicJZOfoOm4I71BMZ+Sg/eE5gAYs0mZdZSIXvak1Jd4O+8QVT?=
 =?us-ascii?Q?DwEjhxE9lRo9adH7eSkJvx2rxqthDKYnFC30kPcfU0n6F8UmLJt0gci2tz5Z?=
 =?us-ascii?Q?PcI1XU3afaK/Q3ORjGFMZ7Pgn/uxQn5G8f6Rpo70EAs+3ueSX5vcdBVdXpIy?=
 =?us-ascii?Q?tcOoB1VvJIjzmIayhhieSxQu8KoHDBxJXLsvvacy6WVqJ6KmpNBVzhJdyeCt?=
 =?us-ascii?Q?aKjF2TYgiNjXnj1T6Hwhw4IwnXl2WX7c4I/c4wT0SY7WZKUBgj1WItJZQSZH?=
 =?us-ascii?Q?Ix3UNEf5X0an/S+ou+MPBagRWoZtbvJ9n1TJWH7ejpzHNFNsNKoO3veIqSzT?=
 =?us-ascii?Q?a+o7mgXUNbkZQEKlgfEMBxAUve3hhqIfTwSSn66PaDhRsqOvE3eC7MuHYjf0?=
 =?us-ascii?Q?r6SKJUegJuuNac5bdbfDtxfi13aSxsZsMIuUJx0TBAwKrHsNTsQc13Y4FgzC?=
 =?us-ascii?Q?3xQQRZsrJNMi9m6lhVqqzr/otSkaXsXJZ3JfH46jkQGHkGZgdqpuBVAiIAc4?=
 =?us-ascii?Q?anBgJ57vPELgL48TqSpoZ/3y6EX8KsweH3pZUYCvewAjjXV9dKZZ5vhDfEFI?=
 =?us-ascii?Q?FOjDffnlXBI/rcACBf9MnuGPXIkFRs8DlWaKIya6sq6Q8ylTr0OKA8UW2gHW?=
 =?us-ascii?Q?1dkzeORT1s5Ctaw3H6FGj1GzB2YXrOmihnBp2YjGsRolvfygDUa8fiTcaqiN?=
 =?us-ascii?Q?W5SCa9e3EhgiX7SoQCxodYooS4xjg3nqxBKn/JO/BdydxJ0aoBklZDvFVcgX?=
 =?us-ascii?Q?CMXgcsZqiOXbG+zyuieLqBm2vNYuG08C34QFwP6+BY+DfHdQRbcXjBWsGkEC?=
 =?us-ascii?Q?93QPyFszvIS6rUE49UGUqJ6htBac+hxIeo/SxKbsSJ9P2dXH598rqb6SFrNX?=
 =?us-ascii?Q?ZWMpNkvQ0hjJ1RT2gRSIZa6ea76JI02S8Oz6uH9HLPly8e8NxHiliK2C49Em?=
 =?us-ascii?Q?WgdQs3dL3h5G+GkxrbdC94D5vRq8mHbV0EU5no/Vg6WGyktGwrf3ig65B2jt?=
 =?us-ascii?Q?ybbFAbF0T73HvuNSpLxXDkP2Ph8cdy/oDTkJoiQ2VRUY3hOthWpaKjd3yRWa?=
 =?us-ascii?Q?WC//q2hSKYkAP9xhnjE4KkeYN3rc31pQyxq7PdbidxvEQjH+KOthyQDUKTbF?=
 =?us-ascii?Q?wnfD1TRU/UfZrrFCNRB0JcOZnQLOHxKWLbe6V5DUmltUgHdZHhNaZExfyI/o?=
 =?us-ascii?Q?QGj57n89Z59Q2CRAcBIYHizT4geGoAcAVdFLr/dtyy6lGlVSZEaiArHGlmWB?=
 =?us-ascii?Q?AQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3237f0aa-7a88-4e6f-523e-08dc6f0fb3b2
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2024 03:34:01.1595 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jIetbBZePtfsgOwIs840m4IOiKPqsnlnSuLTA5CRinHCn3A7paQJkXEDR3ITmm2qaKtnw+KTqELgh9bbvxdQdvXt6TKET+ShKMaxfeozAPo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5246
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

On Tue, May 07, 2024 at 05:22:46PM GMT, Michal Wajdeczko wrote:
>To minimize the risk of future name collisions, rename macros to
>always include the ARG or ARGS tag:
>
>  DROP_FIRST to DROP_FIRST_ARG
>  PICK_FIRST to FIRST_ARG
>  PICK_LAST to LAST_ARG
>
>Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>---
>v2: s/ARGS_TAIL/DROP_FIRST_ARG (Lucas)
>---
> drivers/gpu/drm/xe/tests/xe_args_test.c | 82 ++++++++++++++-----------
> drivers/gpu/drm/xe/xe_args.h            | 50 +++++++--------
> drivers/gpu/drm/xe/xe_rtp_helpers.h     | 12 ++--
> 3 files changed, 78 insertions(+), 66 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/tests/xe_args_test.c b/drivers/gpu/drm/xe/tests/xe_args_test.c
>index 9b44c1ab6364..a30d439713b7 100644
>--- a/drivers/gpu/drm/xe/tests/xe_args_test.c
>+++ b/drivers/gpu/drm/xe/tests/xe_args_test.c
>@@ -21,10 +21,10 @@ static void call_args_example(struct kunit *test)
> #undef buz
> }
>
>-static void drop_first_example(struct kunit *test)
>+static void drop_first_arg_example(struct kunit *test)
> {
> #define foo	X, Y, Z, Q
>-#define bar	CALL_ARGS(COUNT_ARGS, DROP_FIRST(foo))
>+#define bar	CALL_ARGS(COUNT_ARGS, DROP_FIRST_ARG(foo))
>
> 	KUNIT_EXPECT_EQ(test, bar, 3);
>
>@@ -32,12 +32,12 @@ static void drop_first_example(struct kunit *test)
> #undef bar
> }
>
>-static void pick_first_example(struct kunit *test)
>+static void first_arg_example(struct kunit *test)
> {
> 	int X = 1;
>
> #define foo	X, Y, Z, Q
>-#define bar	PICK_FIRST(foo)
>+#define bar	FIRST_ARG(foo)
>
> 	KUNIT_EXPECT_EQ(test, bar, X);
> 	KUNIT_EXPECT_STREQ(test, __stringify(bar), "X");
>@@ -46,12 +46,12 @@ static void pick_first_example(struct kunit *test)
> #undef bar
> }
>
>-static void pick_last_example(struct kunit *test)
>+static void last_arg_example(struct kunit *test)
> {
> 	int Q = 1;
>
> #define foo	X, Y, Z, Q
>-#define bar	PICK_LAST(foo)
>+#define bar	LAST_ARG(foo)
>
> 	KUNIT_EXPECT_EQ(test, bar, Q);
> 	KUNIT_EXPECT_STREQ(test, __stringify(bar), "Q");
>@@ -63,8 +63,8 @@ static void pick_last_example(struct kunit *test)
> static void sep_comma_example(struct kunit *test)
> {
> #define foo(f)	f(X) f(Y) f(Z) f(Q)
>-#define bar	DROP_FIRST(foo(ARGS_SEP_COMMA __stringify))
>-#define buz	CALL_ARGS(COUNT_ARGS, DROP_FIRST(foo(ARGS_SEP_COMMA)))
>+#define bar	DROP_FIRST_ARG(foo(ARGS_SEP_COMMA __stringify))
>+#define buz	CALL_ARGS(COUNT_ARGS, DROP_FIRST_ARG(foo(ARGS_SEP_COMMA)))
>
> 	static const char * const a[] = { bar };
>
>@@ -123,61 +123,73 @@ static void call_args_test(struct kunit *test)
> 	KUNIT_EXPECT_EQ(test, CALL_ARGS(COUNT_ARGS, MAX_ARGS), 12);
> }
>
>-static void drop_first_test(struct kunit *test)
>+static void drop_first_arg_test(struct kunit *test)
> {
> 	int Y = -2, Z = -3, Q = -4;
>-	int a[] = { DROP_FIRST(FOO_ARGS) };
>+	int a[] = { DROP_FIRST_ARG(FOO_ARGS) };
>
>-	KUNIT_EXPECT_EQ(test, DROP_FIRST(0, -1), -1);
>-	KUNIT_EXPECT_EQ(test, DROP_FIRST(DROP_FIRST(0, -1, -2)), -2);
>+	KUNIT_EXPECT_EQ(test, DROP_FIRST_ARG(0, -1), -1);
>+	KUNIT_EXPECT_EQ(test, DROP_FIRST_ARG(DROP_FIRST_ARG(0, -1, -2)), -2);
>
>-	KUNIT_EXPECT_EQ(test, CALL_ARGS(COUNT_ARGS, DROP_FIRST(FOO_ARGS)), 3);
>-	KUNIT_EXPECT_EQ(test, DROP_FIRST(DROP_FIRST(DROP_FIRST(FOO_ARGS))), -4);
>+	KUNIT_EXPECT_EQ(test, CALL_ARGS(COUNT_ARGS, DROP_FIRST_ARG(FOO_ARGS)), 3);
>+	KUNIT_EXPECT_EQ(test, DROP_FIRST_ARG(DROP_FIRST_ARG(DROP_FIRST_ARG(FOO_ARGS))), -4);
> 	KUNIT_EXPECT_EQ(test, a[0], -2);
> 	KUNIT_EXPECT_EQ(test, a[1], -3);
> 	KUNIT_EXPECT_EQ(test, a[2], -4);
>-	KUNIT_EXPECT_STREQ(test, __stringify(DROP_FIRST(DROP_FIRST(DROP_FIRST(FOO_ARGS)))), "Q");
>+
>+#define foo	DROP_FIRST_ARG(FOO_ARGS)
>+#define bar	DROP_FIRST_ARG(DROP_FIRST_ARG(FOO_ARGS))
>+#define buz	DROP_FIRST_ARG(DROP_FIRST_ARG(DROP_FIRST_ARG(FOO_ARGS)))
>+
>+	KUNIT_EXPECT_EQ(test, CALL_ARGS(COUNT_ARGS, foo), 3);
>+	KUNIT_EXPECT_EQ(test, CALL_ARGS(COUNT_ARGS, bar), 2);
>+	KUNIT_EXPECT_EQ(test, CALL_ARGS(COUNT_ARGS, buz), 1);
>+	KUNIT_EXPECT_STREQ(test, __stringify(buz), "Q");
>+
>+#undef foo
>+#undef bar
>+#undef buz
> }
>
>-static void pick_first_test(struct kunit *test)
>+static void first_arg_test(struct kunit *test)
> {
> 	int X = -1;
>-	int a[] = { PICK_FIRST(FOO_ARGS) };
>+	int a[] = { FIRST_ARG(FOO_ARGS) };
>
>-	KUNIT_EXPECT_EQ(test, PICK_FIRST(-1, -2), -1);
>+	KUNIT_EXPECT_EQ(test, FIRST_ARG(-1, -2), -1);
>
>-	KUNIT_EXPECT_EQ(test, CALL_ARGS(COUNT_ARGS, PICK_FIRST(FOO_ARGS)), 1);
>-	KUNIT_EXPECT_EQ(test, PICK_FIRST(FOO_ARGS), -1);
>+	KUNIT_EXPECT_EQ(test, CALL_ARGS(COUNT_ARGS, FIRST_ARG(FOO_ARGS)), 1);
>+	KUNIT_EXPECT_EQ(test, FIRST_ARG(FOO_ARGS), -1);
> 	KUNIT_EXPECT_EQ(test, a[0], -1);
>-	KUNIT_EXPECT_STREQ(test, __stringify(PICK_FIRST(FOO_ARGS)), "X");
>+	KUNIT_EXPECT_STREQ(test, __stringify(FIRST_ARG(FOO_ARGS)), "X");
> }
>
>-static void pick_last_test(struct kunit *test)
>+static void last_arg_test(struct kunit *test)
> {
> 	int Q = -4;
>-	int a[] = { PICK_LAST(FOO_ARGS) };
>+	int a[] = { LAST_ARG(FOO_ARGS) };
>
>-	KUNIT_EXPECT_EQ(test, PICK_LAST(-1, -2), -2);
>+	KUNIT_EXPECT_EQ(test, LAST_ARG(-1, -2), -2);
>
>-	KUNIT_EXPECT_EQ(test, CALL_ARGS(COUNT_ARGS, PICK_LAST(FOO_ARGS)), 1);
>-	KUNIT_EXPECT_EQ(test, PICK_LAST(FOO_ARGS), -4);
>+	KUNIT_EXPECT_EQ(test, CALL_ARGS(COUNT_ARGS, LAST_ARG(FOO_ARGS)), 1);
>+	KUNIT_EXPECT_EQ(test, LAST_ARG(FOO_ARGS), -4);
> 	KUNIT_EXPECT_EQ(test, a[0], -4);
>-	KUNIT_EXPECT_STREQ(test, __stringify(PICK_LAST(FOO_ARGS)), "Q");
>+	KUNIT_EXPECT_STREQ(test, __stringify(LAST_ARG(FOO_ARGS)), "Q");
>
>-	KUNIT_EXPECT_EQ(test, PICK_LAST(MAX_ARGS), -12);
>-	KUNIT_EXPECT_STREQ(test, __stringify(PICK_LAST(MAX_ARGS)), "-12");
>+	KUNIT_EXPECT_EQ(test, LAST_ARG(MAX_ARGS), -12);
>+	KUNIT_EXPECT_STREQ(test, __stringify(LAST_ARG(MAX_ARGS)), "-12");
> }
>
> static struct kunit_case args_tests[] = {
> 	KUNIT_CASE(count_args_test),
> 	KUNIT_CASE(call_args_example),
> 	KUNIT_CASE(call_args_test),
>-	KUNIT_CASE(drop_first_example),
>-	KUNIT_CASE(drop_first_test),
>-	KUNIT_CASE(pick_first_example),
>-	KUNIT_CASE(pick_first_test),
>-	KUNIT_CASE(pick_last_example),
>-	KUNIT_CASE(pick_last_test),
>+	KUNIT_CASE(drop_first_arg_example),
>+	KUNIT_CASE(drop_first_arg_test),
>+	KUNIT_CASE(first_arg_example),
>+	KUNIT_CASE(first_arg_test),
>+	KUNIT_CASE(last_arg_example),
>+	KUNIT_CASE(last_arg_test),
> 	KUNIT_CASE(sep_comma_example),
> 	{}
> };
>diff --git a/drivers/gpu/drm/xe/xe_args.h b/drivers/gpu/drm/xe/xe_args.h
>index 40b9eb4151d8..5efd3f9ea669 100644
>--- a/drivers/gpu/drm/xe/xe_args.h
>+++ b/drivers/gpu/drm/xe/xe_args.h
>@@ -35,7 +35,7 @@
> #define __CALL_ARGS(f, args...)		f(args)
>
> /**
>- * DROP_FIRST - Returns all arguments except the first one.
>+ * DROP_FIRST_ARG - Returns all arguments except the first one.
>  * @args: arguments
>  *
>  * This helper macro allows manipulation the argument list before passing it
>@@ -44,15 +44,15 @@
>  * Example:
>  *
>  *	#define foo	X,Y,Z,Q
>- *	#define bar	CALL_ARGS(COUNT_ARGS, DROP_FIRST(foo))
>+ *	#define bar	CALL_ARGS(COUNT_ARGS, DROP_FIRST_ARG(foo))
>  *
>  *	With above definitions bar expands to 3.
>  */
>-#define DROP_FIRST(args...)		__DROP_FIRST(args)
>-#define __DROP_FIRST(a, b...)		b
>+#define DROP_FIRST_ARG(args...)		__DROP_FIRST_ARG(args)
>+#define __DROP_FIRST_ARG(a, b...)	b
>
> /**
>- * PICK_FIRST - Returns the first argument.
>+ * FIRST_ARG - Returns the first argument.
>  * @args: arguments
>  *
>  * This helper macro allows manipulation the argument list before passing it
>@@ -61,15 +61,15 @@
>  * Example:
>  *
>  *	#define foo	X,Y,Z,Q
>- *	#define bar	PICK_FIRST(foo)
>+ *	#define bar	FIRST_ARG(foo)
>  *
>  *	With above definitions bar expands to X.
>  */
>-#define PICK_FIRST(args...)		__PICK_FIRST(args)
>-#define __PICK_FIRST(a, b...)		a
>+#define FIRST_ARG(args...)		__FIRST_ARG(args)
>+#define __FIRST_ARG(a, b...)		a
>
> /**
>- * PICK_LAST - Returns the last argument.
>+ * LAST_ARG - Returns the last argument.
>  * @args: arguments
>  *
>  * This helper macro allows manipulation the argument list before passing it
>@@ -80,24 +80,24 @@
>  * Example:
>  *
>  *	#define foo	X,Y,Z,Q
>- *	#define bar	PICK_LAST(foo)
>+ *	#define bar	LAST_ARG(foo)
>  *
>  *	With above definitions bar expands to Q.
>  */
>-#define PICK_LAST(args...)		__PICK_ARG(COUNT_ARGS(args), args)
>+#define LAST_ARG(args...)		__PICK_ARG(COUNT_ARGS(args), args)

					^

I think you forgot to rename this (and others below), like you did with
FIRST_ARG()/__FIRST_ARG()


with that, lgtm


	Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi

> #define __PICK_ARG(n, args...)		CALL_ARGS(CONCATENATE(PICK_ARG, n), args)
>-#define PICK_ARG1(args...)		PICK_FIRST(args)
>-#define PICK_ARG2(args...)		PICK_ARG1(DROP_FIRST(args))
>-#define PICK_ARG3(args...)		PICK_ARG2(DROP_FIRST(args))
>-#define PICK_ARG4(args...)		PICK_ARG3(DROP_FIRST(args))
>-#define PICK_ARG5(args...)		PICK_ARG4(DROP_FIRST(args))
>-#define PICK_ARG6(args...)		PICK_ARG5(DROP_FIRST(args))
>-#define PICK_ARG7(args...)		PICK_ARG6(DROP_FIRST(args))
>-#define PICK_ARG8(args...)		PICK_ARG7(DROP_FIRST(args))
>-#define PICK_ARG9(args...)		PICK_ARG8(DROP_FIRST(args))
>-#define PICK_ARG10(args...)		PICK_ARG9(DROP_FIRST(args))
>-#define PICK_ARG11(args...)		PICK_ARG10(DROP_FIRST(args))
>-#define PICK_ARG12(args...)		PICK_ARG11(DROP_FIRST(args))
>+#define PICK_ARG1(args...)		FIRST_ARG(args)
>+#define PICK_ARG2(args...)		PICK_ARG1(DROP_FIRST_ARG(args))
>+#define PICK_ARG3(args...)		PICK_ARG2(DROP_FIRST_ARG(args))
>+#define PICK_ARG4(args...)		PICK_ARG3(DROP_FIRST_ARG(args))
>+#define PICK_ARG5(args...)		PICK_ARG4(DROP_FIRST_ARG(args))
>+#define PICK_ARG6(args...)		PICK_ARG5(DROP_FIRST_ARG(args))
>+#define PICK_ARG7(args...)		PICK_ARG6(DROP_FIRST_ARG(args))
>+#define PICK_ARG8(args...)		PICK_ARG7(DROP_FIRST_ARG(args))
>+#define PICK_ARG9(args...)		PICK_ARG8(DROP_FIRST_ARG(args))
>+#define PICK_ARG10(args...)		PICK_ARG9(DROP_FIRST_ARG(args))
>+#define PICK_ARG11(args...)		PICK_ARG10(DROP_FIRST_ARG(args))
>+#define PICK_ARG12(args...)		PICK_ARG11(DROP_FIRST_ARG(args))
>
> /**
>  * ARGS_SEP_COMMA - Definition of a comma character.
>@@ -109,8 +109,8 @@
>  * Example:
>  *
>  *	#define foo(f)	f(X) f(Y) f(Z) f(Q)
>- *	#define bar	DROP_FIRST(foo(ARGS_SEP_COMMA __stringify))
>- *	#define buz	CALL_ARGS(COUNT_ARGS, DROP_FIRST(foo(ARGS_SEP_COMMA)))
>+ *	#define bar	DROP_FIRST_ARG(foo(ARGS_SEP_COMMA __stringify))
>+ *	#define buz	CALL_ARGS(COUNT_ARGS, DROP_FIRST_ARG(foo(ARGS_SEP_COMMA)))
>  *
>  *	With above definitions bar expands to
>  *		"X", "Y", "Z", "Q"
>diff --git a/drivers/gpu/drm/xe/xe_rtp_helpers.h b/drivers/gpu/drm/xe/xe_rtp_helpers.h
>index 8129d6d9ef37..7735f217ba71 100644
>--- a/drivers/gpu/drm/xe/xe_rtp_helpers.h
>+++ b/drivers/gpu/drm/xe/xe_rtp_helpers.h
>@@ -17,7 +17,7 @@
>  */
> #define _XE_ESC(...) __VA_ARGS__
>
>-#define _XE_TUPLE_TAIL(...) (DROP_FIRST(__VA_ARGS__))
>+#define _XE_TUPLE_TAIL(...) (DROP_FIRST_ARG(__VA_ARGS__))
>
> #define _XE_RTP_CONCAT(a, b) CONCATENATE(XE_RTP_, CONCATENATE(a, b))
>
>@@ -54,10 +54,10 @@
>  *	XE_RTP_TEST_FOO BANANA XE_RTP_TEST_BAR
>  */
> #define XE_RTP_PASTE_FOREACH(prefix_, sep_, args_) _XE_RTP_CONCAT(PASTE_, COUNT_ARGS args_)(prefix_, sep_, args_)
>-#define XE_RTP_PASTE_1(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, PICK_FIRST args_)
>-#define XE_RTP_PASTE_2(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, PICK_FIRST args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_1(prefix_, sep_, _XE_TUPLE_TAIL args_)
>-#define XE_RTP_PASTE_3(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, PICK_FIRST args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_2(prefix_, sep_, _XE_TUPLE_TAIL args_)
>-#define XE_RTP_PASTE_4(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, PICK_FIRST args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_3(prefix_, sep_, _XE_TUPLE_TAIL args_)
>+#define XE_RTP_PASTE_1(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_)
>+#define XE_RTP_PASTE_2(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_1(prefix_, sep_, _XE_TUPLE_TAIL args_)
>+#define XE_RTP_PASTE_3(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_2(prefix_, sep_, _XE_TUPLE_TAIL args_)
>+#define XE_RTP_PASTE_4(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_3(prefix_, sep_, _XE_TUPLE_TAIL args_)
>
> /*
>  * XE_RTP_DROP_CAST - Drop cast to convert a compound statement to a initializer
>@@ -70,6 +70,6 @@
>  *
>  *	{ .a = 10 }
>  */
>-#define XE_RTP_DROP_CAST(...) _XE_ESC(DROP_FIRST _XE_ESC __VA_ARGS__)
>+#define XE_RTP_DROP_CAST(...) _XE_ESC(DROP_FIRST_ARG _XE_ESC __VA_ARGS__)
>
> #endif
>-- 
>2.43.0
>
