Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD0FDCA0ED3
	for <intel-xe@archiver.kernel.org>; Tue,  3 Sep 2024 03:01:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 731A010E3BD;
	Tue,  3 Sep 2024 03:01:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mw+DpThq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9B0910E3BD
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Sep 2024 03:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725332477; x=1756868477;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=r2U35Vx8R+GrLO3cd5G6ctVn+CUTZQL897/awaKlDDo=;
 b=Mw+DpThqNl3yf1yPxzov6VeqvdIWaZcBFGKHOfmh8RPelSgwnEX4gAiP
 LOyXMDX7PpJP32+AjaTk1VVJcbaS1Rldqo9aS18KTKjPnAwfuVyD/65Zb
 QCgerNpbspApGWmmLhY3nwjN3mQvpjLOIC0PhEAVuJNe0ZM0AZbMqZMoF
 r86r0ufjMEE+K+zdYEEJ6TZwCKljuuIRNKjRfMQbZLz/9hTeLZwPHbSht
 aayUyOSMJFh+bOzMlon0TgQ9BLo6uX1SeAsZ1/kWTkzG4OYOAw0GkbpKu
 R3lz0cQodUIfSh2hmL2HpKiS09fwCcBhiPR7/jemQretFS9LgYFAH+dWP Q==;
X-CSE-ConnectionGUID: 2JBTGxN3QMy2A8prblSizA==
X-CSE-MsgGUID: P/kL401QQjyRMPPkiJX70Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="35066110"
X-IronPort-AV: E=Sophos;i="6.10,197,1719903600"; d="scan'208";a="35066110"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2024 20:01:17 -0700
X-CSE-ConnectionGUID: KlaSUsAmSN+kPwBBY3kfAg==
X-CSE-MsgGUID: VKaL9WHjRTOniNSWiJjekA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,197,1719903600"; d="scan'208";a="102202297"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Sep 2024 20:01:18 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 2 Sep 2024 20:01:17 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 2 Sep 2024 20:01:16 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 2 Sep 2024 20:01:16 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 2 Sep 2024 20:01:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MF4foOpF1EXDH7ESbSk/vtrtp2H3ZcsZoSgcN/lTWNGhW7tTa2J7WpMhOPAZk4KgiKW+WwKJsxLRguZbUIlLEQOunNJ4ARk8YNb6bkWslPILYcBbrYBg7lreyhj87HGdBH4jfcXv64+zRdWHdRT3k5Cyqnrlc3zLzzoTcncRdfrPzwdwU0pBF6dJKtEtBpfjkejzZLirX4h5dio3584BJa8+XqQqfsfhbkAfFoSnhh9kXA2iyYMKoWi7tElQOjixhVKU5CGPR1cBhma3QtmXwjZqWihbfHFzNkqBZIezRz38Fr2PAeAmnsZnqenqDx9/DxVrFWRVuxBdJbkxxjUObA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/bzxSyDSMqLBfwW26pfMEa0+Tx8jxMjwVQOKoYi/s3U=;
 b=sDqA+IBPS71BXeJ0vhsMXejl70btrJH/A2ePdYEWwfTZzcGwnoHW+3AFaiiSCZQyMwEsji3h7v6ChmPWHrtdiYL7HryJdXAWz0bWRdEMX4q8aO9JDrGYTGRkZu0NPenSXVXI1NKZEDMpcRy/EPtunf70UqK7DMrMDOr6kt9CkIWi3flz5ZeCWid7XZTt0jsRSdzR8PCBAWvsBn3skTO8OYmCdpvo/amGXXcQjXnphNOk9s3L7TnKMm1q98hey87M3Mxm/Jz6MFsr1YGQH6j76BVFWJxgPaQ5oBWxHRu5rQvtaoZ/GiKOxgal8Dm+PbfZLTn/WbiPpkH0ypmGVFoITw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW4PR11MB6619.namprd11.prod.outlook.com (2603:10b6:303:1eb::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Tue, 3 Sep
 2024 03:01:14 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7918.024; Tue, 3 Sep 2024
 03:01:14 +0000
Date: Mon, 2 Sep 2024 22:01:11 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
CC: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>,
 <intel-xe@lists.freedesktop.org>, Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Bommu Krishnaiah <krishnaiah.bommu@intel.com>, Riana Tauro
 <riana.tauro@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH 1/4] drm/xe/pmu: Enable PMU interface
Message-ID: <shrwluh7x22szbsntnu7chuxr4i4q2uvrmfy6bxeru4ue6vemd@moyhm6rfrw3f>
References: <20240827164107.47034-1-vinay.belgaumkar@intel.com>
 <20240827164107.47034-2-vinay.belgaumkar@intel.com>
 <o42m66pseq7yxitt27whcwjntvtuoxndlxcvld2vak5i6ejhtv@ny3ilfuxvwyz>
 <602bffcd-d66f-4b49-b3b4-abb934b00f3a@intel.com>
 <3de57ee4-d8a6-4b39-bd17-0fd2f00adc2b@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3de57ee4-d8a6-4b39-bd17-0fd2f00adc2b@linux.intel.com>
X-ClientProxiedBy: MW4PR03CA0315.namprd03.prod.outlook.com
 (2603:10b6:303:dd::20) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW4PR11MB6619:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c8297f3-b591-4d52-0d1e-08dccbc4ac2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?ZTLyi3RdkJchzsvS/G55iI5fkxlHerKzAweh/KJK8BbVlZomHqEE/SF/J9?=
 =?iso-8859-1?Q?Zs30y8gO9D24HjjQoKy5wX3aAWr9uAvyH6cqTN8mgHqbq7+RfGRsItz/US?=
 =?iso-8859-1?Q?SWRtcPs2A6Q8eNSb3ayj0bVSIUtVseTlwYYA8qgH4DSjhP096BDYxqoIFU?=
 =?iso-8859-1?Q?itGvhmmJLfKFgI5Ksva9xCOM57NcCyFUkpsxdhYvBZvwHCDXoigqcei2Ko?=
 =?iso-8859-1?Q?+V1mvfBXM63fXajerPTPkSemrgOczlL04fiFP0IehxV98n9ySD1i3pIsDx?=
 =?iso-8859-1?Q?cIPMHe4WPfB3zZL5w+qhY9UnpdvcRpoX+Qi+oVZff9qMceVSovROfD2anW?=
 =?iso-8859-1?Q?fdeUZbkKkrG0MJ9lelMCVLCWA7JRzZbPDB0iGrUWsH/E1zslMSWldN2pYJ?=
 =?iso-8859-1?Q?QsqGmdYaDnXmREYDYmpzTpXrf18Asp/CMdI1N8ywYVB1Iu1nvgIiAPIkoC?=
 =?iso-8859-1?Q?F8GcRUtpnpx1GMNUgfo2EzMUbJRQJxtTrkt9KJBo33cf3UPQjVtMbMCClw?=
 =?iso-8859-1?Q?F5Li4wEEDNnb2e+f/pgzCCJ1FkFCxTpryrj77D3ZIYLWntH16/GOniga8U?=
 =?iso-8859-1?Q?H7eYCMMUCr2b5ZvxDwO40IFXuqkMvE+a6Q/IDqZzwBxR8Mty+sSShwjieX?=
 =?iso-8859-1?Q?7hAsCB5MmD8z16aCejvUJghIvN9rsuFip8zOCfBqb3CL2GvzBHo7iE7bcs?=
 =?iso-8859-1?Q?t6lEm9pFrcOSf+qn4w5I1II9Vx+mHPRjtvulG8O81uC2xhygdgZB2fT0VS?=
 =?iso-8859-1?Q?zBtC+SfU9RDS41ezfkDz24Cqg5/ZrRkH3rtUbTuzMufP+nEeE+++X7H5Pj?=
 =?iso-8859-1?Q?vtG570A9Q5My0mKWLohzNw36MEouFvp/iQqpx1rKIE+e4kSEsJdRD3NAmJ?=
 =?iso-8859-1?Q?Qh6ZaMnAFyr5QO5BQgKnJy3ojijAdDQ8h6HN3Ve46TiZYtKRytQUdHKrzs?=
 =?iso-8859-1?Q?Fekcxi1oeiOGQfKnFsfKLyq62zk8QW3SUkrqm11Mgl938UShVMaub0XYSs?=
 =?iso-8859-1?Q?u8INuBiOLlrI1B9n+kt+G8wZTwlnW1obcDj2TdvwffIk5/xDqSI+4W4PD1?=
 =?iso-8859-1?Q?9ogWAZRi60AGuEQpcZd/CKjO/7j0vnL81hw0SbtFdSev6JEXLoiHR9Z/U0?=
 =?iso-8859-1?Q?rHDhjCPt6UiullNMcV/GJ+XBskrhmpMrLvvizvO3T3O54P/3oTeWI2QLjf?=
 =?iso-8859-1?Q?oNrVKP7GwpvBW7sNK5rM919Q6fWcnE8xTaKGp3xxeIkyze4UWhY1kZXf1W?=
 =?iso-8859-1?Q?z5vd3LuVCsgCfsuofaxvqtSEwVWbfsdTtNZuo4OLVIQ7OBBWwOgdYP3Ilg?=
 =?iso-8859-1?Q?iZzrn4kRjwwKgbTb8jGxSpXCdlKV3NNECuxLvJI77alQpSQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?9IOUMBwBhTnPyVWO/9kkbgjlbD1gauiRyuBcOKPKS/w71hgtGGZxy4QLYC?=
 =?iso-8859-1?Q?D6CMmAPwceU2fwNTlg8gJbiOguiHjez8QTeVPmZTndoE9IJXOdtAWU1Dku?=
 =?iso-8859-1?Q?oEcsHawE88C4dgTME8IVyJc4OfZK1J/aGQGQjdcrwAH80LrMYhsaZ/Fucw?=
 =?iso-8859-1?Q?oA+wi97fWhOgKWwf9KsZ4A69VnaRdeAjZ9cN8tvs7fP56be9ITFPagYZIb?=
 =?iso-8859-1?Q?0NS+iKOS8Ak7tGWMqfmTAmc+mudlaeVR3a+IXL78P+j5LeiY8/nyXaG16A?=
 =?iso-8859-1?Q?A8R2ejeWCQPYTrjs7m/pN0HJry6+9Bcw8ysSr7z4uqvznghIrdHoObiW4V?=
 =?iso-8859-1?Q?rmQsrJgL2rDR87ec4wUhrgHZ6RkW+PgN65wmxefwtaVdi+Y5VSaYGyr6V0?=
 =?iso-8859-1?Q?CqVKC/+KGqZ4NFgSuxq2gTb1xpzhCebP3Ltx1Tiu4lnXhm9X8tRm0NTmq3?=
 =?iso-8859-1?Q?sALyHEdr2VaARlPbJCsdOWw4coXplhY/8XzY0JTwFtwl8FM1hVIFT0Dk1a?=
 =?iso-8859-1?Q?gjdgqcqSh6IS2qppo7IfrQDDIMD8bQpF0hiMgPdkgC7ftmSnVy2H/qBrPZ?=
 =?iso-8859-1?Q?G0eqBs4FzJtmASwgsmiFgydVCUZ+qk2k8vAKmwG5AeVO07us8qc76asnvj?=
 =?iso-8859-1?Q?VJpDe8ozqt35qHHyq+YSA3JK/Sf8Ii1EZb4MUImLi6MiF3aabaO+LlI7ZV?=
 =?iso-8859-1?Q?RrAj8lFGRAByIflNS41cLzZjKeSGEQjM7LqjtEuhOeHxsYI4N7xmO4ceGh?=
 =?iso-8859-1?Q?nTeEUUk283gBuYXSvpBJH73AGLyVOreXVIapAVVezgTgfreyxiK0PYF5eF?=
 =?iso-8859-1?Q?1Pfw9EHnC4Gv6kyHcW6arwipuKW2g5ev+ItA+fsq8M4rZduCKjOM32ccf3?=
 =?iso-8859-1?Q?e1cM5dWH0ymNG1/jJ0Wply/KzUbAYq8kdFVqoL+PDCZGtnmvWiUGEhgRW1?=
 =?iso-8859-1?Q?VoYURWjY10eSxjscWwP641bhHFRBYsuqGaOU5g2Q2jnFGcGR9Z0QbcyUfm?=
 =?iso-8859-1?Q?4zu/QmkPa3Y7zWscIgHCKwOy4CEpCES3PqgLHjV9CjfkLOnxrPbWgEpiHK?=
 =?iso-8859-1?Q?kgEv91rTZR1LJrQZQL7HnRezY0REeRr/hakeUaeHfwt3nJd7aEpH/wumZr?=
 =?iso-8859-1?Q?92j1MseknyTi64cXyjFxtd2y02Op4Q++gNv2I3ULaHV2U5SHhIqTmTZJbf?=
 =?iso-8859-1?Q?ssFflfWTv+ZpKlyfrlEKj5zyCMNT2Ox7YUjIzaa51AtjFpu8sY0e5SCv7S?=
 =?iso-8859-1?Q?Aq9a50Slr/USAVmXyUUSBO2/SgZxENpXaLnLEBcP0a0wNAiMMIezN0OiUi?=
 =?iso-8859-1?Q?3Zz8/eLsAdmxeZfQEQEX4uGLlxXSdbd6Mu060a/gvVGzQIs1WTcLeTHa4Y?=
 =?iso-8859-1?Q?sHpOjBbKKpeZWoi/9kKzeKbjEaAhQuUUuDwh4AqEKKcyj1sJhNp076Yd4E?=
 =?iso-8859-1?Q?uXc8ynXw+6VuZTxnmm5F3B5UPNvEu5Lck1SEQyMYsi/YmHVRhW34rSTfTG?=
 =?iso-8859-1?Q?XcVHdmRfOWrhZV4Ex7Q8BEqkNxwXBsm0dZGm1DLxWx9VchMYP0HW8W0+iH?=
 =?iso-8859-1?Q?4Vk6h1YTArFA8cndOqpdbwJXcnSM0yX3cQPEDALEuKcPt1Lwztjihayobm?=
 =?iso-8859-1?Q?2eZ9BjAUuD5hcxT+gCM4Kh1DUpQ1pHOOoDL+wALZSUqvfJEF3ivAhoDg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c8297f3-b591-4d52-0d1e-08dccbc4ac2d
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2024 03:01:14.4160 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LYEyA3bKrfi4fAajFpHau3LNfLZ90abnz0zSVzKpfkVJSc2DwyXtseOY9gW+nL/7qhpilNDA69LQPRma/vkEs41xAwwbjuuLAnR4toRWEEo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6619
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

On Mon, Sep 02, 2024 at 11:29:05AM GMT, Aravind Iddamsetty wrote:
>
>On 30/08/24 03:40, Belgaumkar, Vinay wrote:
>>
>> On 8/28/2024 12:33 PM, Lucas De Marchi wrote:
>>> On Tue, Aug 27, 2024 at 09:41:04AM GMT, Vinay Belgaumkar wrote:
>>>> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>>>> index b6fbe4988f2e..de6f39db618c 100644
>>>> --- a/include/uapi/drm/xe_drm.h
>>>> +++ b/include/uapi/drm/xe_drm.h
>>>> @@ -1389,6 +1389,40 @@ struct drm_xe_wait_user_fence {
>>>>     __u64 reserved[2];
>>>> };
>>>>
>>>> +/**
>>>> + * DOC: XE PMU event config IDs
>>>> + *
>>>> + * Check 'man perf_event_open' to use the ID's XE_PMU_XXXX listed in xe_drm.h
>>>> + * in 'struct perf_event_attr' as part of perf_event_open syscall to read a
>>>> + * particular event.
>>>> + *
>>>> + * For example to open the XE_PMU_RENDER_GROUP_BUSY(0):
>>>> + *
>>>> + * .. code-block:: C
>>>> + *
>>>> + *    struct perf_event_attr attr;
>>>> + *    long long count;
>>>> + *    int cpu = 0;
>>>> + *    int fd;
>>>> + *
>>>> + *    memset(&attr, 0, sizeof(struct perf_event_attr));
>>>> + *    attr.type = type; // eg: /sys/bus/event_source/devices/xe_0000_56_00.0/type
>>>> + *    attr.read_format = PERF_FORMAT_TOTAL_TIME_ENABLED;
>>>> + *    attr.use_clockid = 1;
>>>> + *    attr.clockid = CLOCK_MONOTONIC;
>>>> + *    attr.config = XE_PMU_RENDER_GROUP_BUSY(0);
>>>> + *
>>>> + *    fd = syscall(__NR_perf_event_open, &attr, -1, cpu, -1, 0);
>>>> + */
>>>> +
>>>> +/*
>>>> + * Top bits of every counter are GT id.
>>>> + */
>>>> +#define __XE_PMU_GT_SHIFT (56)
>>>> +
>>>> +#define ___XE_PMU_OTHER(gt, x) \
>>>> +    (((__u64)(x)) | ((__u64)(gt) << __XE_PMU_GT_SHIFT))
>>>> +
>>>
>>> The perf uapi is self-describing and users should look up on sysfs what
>>> to use. Example for i915 since it's what I'm currently working on:
>>>
>>>     $ cat /sys/bus/event_source/devices/i915/events/actual-frequency
>>>     config=0x100000
>>>     $ cat /sys/bus/event_source/devices/i915/events/actual-frequency.unit
>>>     M
>>>
>>> `perf list` works fine and doesn't know anything about this xe-only
>>> header. Why would we add anything here rather than encourage other users
>>> to read from the generic interface?
>>
>> Agree. perf list | grep rc6 is sufficient.
>
>This was previously asked by Rodrigo https://patchwork.freedesktop.org/patch/555013/?series=119504&rev=5
>
>so what changed from then to now.

2 different things. That rev you are pointing out had:

  include/uapi/drm/xe_drm.h            |  16 +

so the uapi was being changed without proper doc. Rodrigo asked for the
documentation to be added, because that is the proper way to add things
to the uapi header.

In this review what I noticed though is that the change shouldn't be
there in the first place. We shouldn't change anything in the drm/xe
UAPI header because this is actually an UAPI (via sysfs) coming from
perf.

Lucas De Marchi


>
>Thanks,
>Aravind.
>
>>
>> Thanks,
>>
>> Vinay.
>>
>>>
>>> Lucas De Marchi
