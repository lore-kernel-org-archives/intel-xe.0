Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4C39C83F25
	for <intel-xe@archiver.kernel.org>; Mon, 21 Jul 2025 18:17:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66D6510E2B1;
	Mon, 21 Jul 2025 18:17:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ipxfZHZ/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DC6610E2B1
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Jul 2025 18:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753121835; x=1784657835;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=oiYGdU9H1MR3hD8m8XVoQirkpXuEGfF+6s4vU4pqN2c=;
 b=ipxfZHZ/HzMpDw9ZSzx8eNXzzZsfEyyXBPuj4q1wEUPHDxhQCRm3VC3l
 LvzHz7Nps52kno81wcCKCoWedIhJLBxcucEA6E49L73hy26o8XGemP7Q4
 6Gv+MbKogFO2Q4alBAifjYv9eoKaNmWHbOVp8sTfuagfA7Y3Quvt87g83
 u+7kX1IuDJqexXC8x1faNFPzY5YJrCm/nOL3jmEyk1DRlCobd1xaJdDD/
 tETMYkyFXBWzPlxpfh1LjVuFqqkyXeg2tO7CiFY1HDv2QogW2CMqqm9ZO
 ePLAyBkylv8ZGDvPUeT1yYrDzdQJ3htpAhgVzLuxjAESUpPuQ4MTymtGr g==;
X-CSE-ConnectionGUID: /5gm6ByNTa6qw50fKMRXsQ==
X-CSE-MsgGUID: lD5Yk51MRZ+kc4Kz0f/3yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="55461829"
X-IronPort-AV: E=Sophos;i="6.16,329,1744095600"; d="scan'208";a="55461829"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2025 11:17:12 -0700
X-CSE-ConnectionGUID: Tvk4qBEfTjeAgz/1mocWhg==
X-CSE-MsgGUID: 0BgZwktmSP62H1zDpQuNOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,329,1744095600"; d="scan'208";a="164398999"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2025 11:17:11 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 21 Jul 2025 11:17:08 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 21 Jul 2025 11:17:08 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.42)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 21 Jul 2025 11:17:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rVUCin5S9OogMU4kRDSW3hLl0Jqkg/BJqres/CoayO66YDPbaYGMkjzFTXWFJA5TfDwVMkqLuIHTFbU2sxYuuubZOdWWO+6tcyd0/I/XAc4crZw7xIfZDExC6JS8ug5PmfvvfiDP+/EPYzbzHC2VK/CdQylGS2m/VoqhmO2IL0b5yFjJaaMtY+IzWc0+DoXSGpJxenYbDL5k3ihBjQV0TWHyXrZuAURENXxQK9NXx3A0/6yCOWPk6Mv6uKP7oYgF8vM6Mvv1X9V6HN9k3f98Op5iLyQujr1Y0yEG3UXxiENJ2KBO/ZS4a6Ih0S9sYilow71m/b0ctsieNpUpSYOyoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YdcYGriWkw9VdBpnDztste0EqZrIYR7Z7jCpECpv1Y0=;
 b=yoD+X9CylNC+hE5GxQA5gSBm+XTUZykZBdOdQwMfRmTuSERzb0KS1pa22DTnhuKdwgYhDWtcwcXzvjOIWgcs3YJYMzSGVsi9J/oxuL6R2C9b31PmEeNvTKiuw84uwm2fImLtqDepCk4UfTbRhgglooxNKCuLzlquIdlK1Y1g1lIy2vJSOTpTeZhiWjB6IzR6Dmvpz3W3iRxm7onCn7FRiHQ/ESfpwMpqr7IzNJ2KqTu25NZcnD/Sf9zG0qb2OmBfGYS+bQ48+nzV/2p/WfVNsPye85wU7dF/GQ8zmgivC/fBY2itX7kaTXJwr6lm0SSUeZVH1tRm7y35LJGQ4JS4ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6527.namprd11.prod.outlook.com (2603:10b6:8:8e::19) by
 PH7PR11MB7123.namprd11.prod.outlook.com (2603:10b6:510:20e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Mon, 21 Jul
 2025 18:16:39 +0000
Received: from DM4PR11MB6527.namprd11.prod.outlook.com
 ([fe80::5a48:57be:974b:8ee0]) by DM4PR11MB6527.namprd11.prod.outlook.com
 ([fe80::5a48:57be:974b:8ee0%7]) with mapi id 15.20.8922.037; Mon, 21 Jul 2025
 18:16:39 +0000
Date: Mon, 21 Jul 2025 11:18:25 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Ilia Levi <ilia.levi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <koby.elbaz@intel.com>,
 <konstantin.sinyuk@intel.com>, <yaron.avizrat@intel.com>,
 <moti.haimovski@intel.com>, <didi.freiman@intel.com>,
 <tejas.upadhyay@intel.com>, <matthew.auld@intel.com>,
 <matthew.d.roper@intel.com>
Subject: Re: [PATCH v4] drm/xe: Support for mmap-ing mmio regions
Message-ID: <aH6EcRKdhdgmKRkl@lstrano-desk.jf.intel.com>
References: <20250714122658.1803-1-ilia.levi@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250714122658.1803-1-ilia.levi@intel.com>
X-ClientProxiedBy: SJ0PR03CA0341.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::16) To DM4PR11MB6527.namprd11.prod.outlook.com
 (2603:10b6:8:8e::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6527:EE_|PH7PR11MB7123:EE_
X-MS-Office365-Filtering-Correlation-Id: e1f39a38-e911-4b30-4c27-08ddc882bc72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?fXsmMiaZaRc9bsI06K0oWkm0kWRpWOUTjYEafZt4xbhDLm7zK4YxrBn1G1?=
 =?iso-8859-1?Q?ddvIG65dKc9Sh2ZZV+rBPYibtQ5Syhl09kX12LdeXRH5G55AyYmB4zmdzs?=
 =?iso-8859-1?Q?HJ1GUhJl/7QfuFxDiFfYS6b00zyM1OtzYsPDX1Fgrr3SEGgOHeXc2z1q41?=
 =?iso-8859-1?Q?MNriQ0GhM2cBUdDVg6A6AfCEeBbauhC6D+762Sq9PGCkbYTAr4m6I+Yk66?=
 =?iso-8859-1?Q?aRHYK+0wbYtsNLLIR1IlkNFm435BqDvsdpWTYuyQiz4kYPjx10KCJEYvnO?=
 =?iso-8859-1?Q?eZcUQQg0QuwpKlQeu+LO4L83kLc9HlUlJoe8rAFchRBkxxlpc/9gDz4f7s?=
 =?iso-8859-1?Q?ell2L3JTF0RRx7nmqJH9jds89XVUK6w1xt9VD3o9XG/MhUI4arz2wuxg8e?=
 =?iso-8859-1?Q?rnDPZWw2aZbKkLK+MmAyl5+3b0to4wXVfAH40H1yjuwEyrb1fClvZPgko5?=
 =?iso-8859-1?Q?G+qt2zhrrYUCXdnTH9kkm2J8gYSdAVdkRTE2DuV/aRw+d1RF77li610v7U?=
 =?iso-8859-1?Q?6ca3dZdyiw4iOT+AktjEoqv59YWPI27hVJRZd0IcHhRpk7EqEPWmI5XY8E?=
 =?iso-8859-1?Q?cZhNEPL5rQmUsDdBdT+6RmR/JgruFSw+PUpJO0Q1fNeXAiEmUw4j75fJHe?=
 =?iso-8859-1?Q?PnxcdebyrTzmisZ/xUY9aZltyRsyr1wdNez50AXX/cO+DLmLmcHtD5wBsz?=
 =?iso-8859-1?Q?WtK15qtS1aaoePHZ6cBbXzXhi+ERSFNPpSO2hm9jsgLlWp+sbijoY4LEqh?=
 =?iso-8859-1?Q?4sgxa8GriwdyngvoxY2e2ds6R2QRlr/JNUxtvOFnH9hY/1+n6gAtDTMVDy?=
 =?iso-8859-1?Q?IBxE6eUoXS3qwLonOj9ydAWPODt788mC/e0mqlfVIe8bLtdKSlrnMf51QU?=
 =?iso-8859-1?Q?l0dANEjKCg41chRcZz85DNDiy8KJ6BdvC9qHRFJMjOhBl6jUKue9p60cmm?=
 =?iso-8859-1?Q?lnxikjG8YYbQWkvYqzf264S8rSmOzW+jgh0uJX0sKeNUXJDYIUbDcGnva0?=
 =?iso-8859-1?Q?YtKMyTmP8EQ6NJ1VqaxdewFunnUBhXRBSt4j8I1W7uqqYwGok3TTddCcf0?=
 =?iso-8859-1?Q?9CzBNxN1/d3bWNB5HineCkkN32chz+Hf7g5Ca/3LcZLlYqUjmwCmaBoMkO?=
 =?iso-8859-1?Q?JKg+aCEj/+QMsQmMrHO8kTaBSuM6aDwtFw+XL4fpJtd760jeNmmj8gFriS?=
 =?iso-8859-1?Q?ELgX08AIW4rGTH+7oRKDtmV1CSstXL3zb1kiZwOxkSSWHhVXw7n3qa7IAE?=
 =?iso-8859-1?Q?urP4T7nEeWsmQaVnEFdFl2iB0PaKKWvjdSPsujU4bex14ZlD+SLOF31cLE?=
 =?iso-8859-1?Q?W/Hp4z/hM/83FDtXkJ2KOzs5oXfgvGMFFjWFzQhsMIltrnp552UqsJo1Aa?=
 =?iso-8859-1?Q?CjDa12ct42nSBb582vBTnIdrnsluaC2gAqXFQxxejbiNdefwmH0ZsD8iNq?=
 =?iso-8859-1?Q?j8hg9mu05yWFo37+70yPzyelDJhf7UO//2gqxybCRgAlA1BYLW0p8eq8Bk?=
 =?iso-8859-1?Q?M=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6527.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?HyNntzAlGNEET06jVBSrqir/91ASsE6GKFz1/XcXbLgQC3Nl1JX4+R73AG?=
 =?iso-8859-1?Q?eGKr6D5voE3+dhevPUz8EXK1krrNpd18k9HW+FekgrMOZ5+u96qGmH+dQa?=
 =?iso-8859-1?Q?D6d6cuoB4XJRBaI3/AKZnvh4Hdx2TJTQD39B6dbf+FERJFhrWtH2LaGK6H?=
 =?iso-8859-1?Q?hfJDkCbIOBzNtAof50sQvFP4ywm5cwGnpi5YSD3NDPyek4RjS1eFy6KqWC?=
 =?iso-8859-1?Q?BQoaS5CX3LLhjnA+40/gWYN82NpqLlJiZPdX/2YpkmI4nZIsQhIqTGeKD4?=
 =?iso-8859-1?Q?T8NmPyYbId4g8hWkqJ7pXewsUjXDeaN5dANCS8T0wOUltJxMNC40JTFURn?=
 =?iso-8859-1?Q?NfZ7sz6MhlSmc43+JrtaJSaDbB1L05UwXWN5DtvXRd2wrRT3+ym2tym5b6?=
 =?iso-8859-1?Q?qIDmn/SL2fArGvtC2v/8GFot2Fp/S5JR6SDrSRhCA4DY+7De9gsNWKJ1r1?=
 =?iso-8859-1?Q?YV7xhcMEb33Qe2WAxUFsiZOqJ7ZqHuL4vc6wr+7dPhpETzQNKqYFmD3rgG?=
 =?iso-8859-1?Q?Q/BO3bMdNBYxTMKV0zcXNlrkMYklPUSJASLpzQW+VriFPBy/4bmlChaxRN?=
 =?iso-8859-1?Q?KND/k8gIGu0XVMyhu+uJkN9At+H1tUcanTtpMs6R3dXonghgoE37L93h8c?=
 =?iso-8859-1?Q?Jzi6IP+EMxr+uAOXCf2aDVu2rM0dfOZZmr9c6Febe3rf3CZBAmrOOavqKE?=
 =?iso-8859-1?Q?9ghYpVvQg4sHMNNO852r4DgwNhuwTZvvgpB2feUpt7H3c96NlwyqrDLVHi?=
 =?iso-8859-1?Q?dl1FYx112IdFEBhc7FY3n6pV1Q17aBotxzUEfxe7B0GxYsx9EDpQdMJ4m0?=
 =?iso-8859-1?Q?SKYXEh9XYWRs8hM3QWTkl/wXxlYDLXyZhjAOxpBF0/GRCP5Js46za9IgY8?=
 =?iso-8859-1?Q?zYcHiVg1ebAYAqsJkUbMckqO1dKNpf7Q97gggwYp8o1grxdHVr0w0HDyIY?=
 =?iso-8859-1?Q?cDDcBui5W3PuB/dAVrqjJT5ZOLLZeZy82TrCmfneHe3MyaDSF0yxnWUIxS?=
 =?iso-8859-1?Q?t3WKaPICR1nvOokxhESSX08uc0XxFZZNdFVroxTQuwVxtFEW+kgK8YhBqx?=
 =?iso-8859-1?Q?neRpZ7/C4jShetd7SOS5Tl0OejP69PRgaDauQpsPvBebBEZJpcWnFDMlMu?=
 =?iso-8859-1?Q?izMMY92H+PDXFgXv5Xg/t7gFRe0mA4a+ba6WLj6yy24312GY+pn05pQI/L?=
 =?iso-8859-1?Q?yWYqiwMiKdWdI3F4wgDXDDqoY4rIqzFI2eZqJWstaljdzdeE96XGiPRaIW?=
 =?iso-8859-1?Q?cc+OuOVkXla9ql8hzaoSNFXSUB3sPVg7IFnLLtPseOMkGIpCLxFeXePBru?=
 =?iso-8859-1?Q?ObqHsLhvJK8dBUUtX51Mxf8Dv+eUe0etHu0WHdnskbLa1UYp3HXIW1f6cV?=
 =?iso-8859-1?Q?c+95gUfzeNkiqZpZHyCG67nUwp6eivS957BHwrSW3coFhfUkQv7JeO9OPj?=
 =?iso-8859-1?Q?bIFShEm/LRQqOmTSL/RLXb3MzQTlQHEenrfnqykcxlh9jhXnc9N1LaS8h4?=
 =?iso-8859-1?Q?IgiUSXAVvYcNxEty8RByhSQEU2TqDXvywlotGksjORIxi3xoTRosygjMcM?=
 =?iso-8859-1?Q?ltwckErG39SYBgksoHljPX9g4pcCawa+kakwt6zLs7jQY/WTmzM9MhwF1l?=
 =?iso-8859-1?Q?tke2OZRf2UdbYvPSQM/bBusPMZvcDvP/VEqg8Y8051d3uzzlgGgtqAIQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e1f39a38-e911-4b30-4c27-08ddc882bc72
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6527.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2025 18:16:39.1149 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yxthMVsKw9s7MWIqLC1pejRpZ2GkISbizgis6hYs+Gy+EduVoe/TApRGkBuqprmglKEHHJwe+hvp5bhIoxx4/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7123
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

On Mon, Jul 14, 2025 at 03:26:58PM +0300, Ilia Levi wrote:
> Allow the driver to expose hardware register spaces to userspace
> through GEM objects with fake mmap offsets. This can be useful
> for userspace-firmware communication, debugging, etc.
> 
> v2: Minor doc fix (CI)
> v3: Enforce MAP_SHARED (Tejas)
>     Add fault handler with dummy page (Tejas, Matt Auld)
>     Store physical address instead of xe_mmio in the GEM object (MattB)
> v4: Separate xe_mmio_gem from xe_mmio and make it private (MattB)
> 
> Signed-off-by: Ilia Levi <ilia.levi@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/Makefile      |   1 +
>  drivers/gpu/drm/xe/xe_mmio_gem.c | 226 +++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_mmio_gem.h |  20 +++
>  3 files changed, 247 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_mmio_gem.c
>  create mode 100644 drivers/gpu/drm/xe/xe_mmio_gem.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 4bda20f586ed..382aadd4e816 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -85,6 +85,7 @@ xe-y += xe_bb.o \
>  	xe_lrc.o \
>  	xe_migrate.o \
>  	xe_mmio.o \
> +	xe_mmio_gem.o \
>  	xe_mocs.o \
>  	xe_module.o \
>  	xe_nvm.o \
> diff --git a/drivers/gpu/drm/xe/xe_mmio_gem.c b/drivers/gpu/drm/xe/xe_mmio_gem.c
> new file mode 100644
> index 000000000000..9a97c4387e4f
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_mmio_gem.c
> @@ -0,0 +1,226 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#include "xe_mmio_gem.h"
> +
> +#include <drm/drm_drv.h>
> +#include <drm/drm_gem.h>
> +#include <drm/drm_managed.h>
> +
> +#include "xe_device_types.h"
> +
> +/**
> + * DOC: Exposing MMIO regions to userspace
> + *
> + * In certain cases, the driver may allow userspace to mmap a portion of the hardware registers.
> + *
> + * This can be done as follows:
> + * 1. Call xe_mmio_gem_create() to create a GEM object with an mmap-able fake offset.
> + * 2. Use xe_mmio_gem_mmap_offset() on the created GEM object to retrieve the fake offset.
> + * 3. Provide the fake offset to userspace.
> + * 4. Userspace can call mmap with the fake offset. The length provided to mmap
> + *    must match the size of the GEM object.
> + * 5. When the region is no longer needed, call xe_mmio_gem_destroy() to release the GEM object.
> + *
> + * NOTE: The exposed MMIO region must be page-aligned with regards to its BAR offset and size.
> + *
> + * WARNING: Exposing MMIO regions to userspace can have security and stability implications.
> + * Make sure not to expose any sensitive registers.
> + */
> +
> +static void xe_mmio_gem_free(struct drm_gem_object *);
> +static int xe_mmio_gem_mmap(struct drm_gem_object *, struct vm_area_struct *);
> +static vm_fault_t xe_mmio_gem_vm_fault(struct vm_fault *);
> +
> +struct xe_mmio_gem {
> +	struct drm_gem_object base;
> +	phys_addr_t phys_addr;
> +};
> +
> +static const struct vm_operations_struct vm_ops = {
> +	.open = drm_gem_vm_open,
> +	.close = drm_gem_vm_close,
> +	.fault = xe_mmio_gem_vm_fault,
> +};
> +
> +static const struct drm_gem_object_funcs xe_mmio_gem_funcs = {
> +	.free = xe_mmio_gem_free,
> +	.mmap = xe_mmio_gem_mmap,
> +	.vm_ops = &vm_ops,
> +};
> +
> +static inline struct xe_mmio_gem *to_xe_mmio_gem(struct drm_gem_object *obj)
> +{
> +	return container_of(obj, struct xe_mmio_gem, base);
> +}
> +
> +/**
> + * xe_mmio_gem_create - Expose an MMIO region to userspace
> + * @xe: The xe device
> + * @file: DRM file descriptor
> + * @phys_addr: Start of the exposed MMIO region
> + * @size: The size of the exposed MMIO region
> + *
> + * This function creates a GEM object that exposes an MMIO region with an mmap-able
> + * fake offset.
> + *
> + * See: "Exposing MMIO regions to userspace"
> + */
> +struct xe_mmio_gem *xe_mmio_gem_create(struct xe_device *xe, struct drm_file *file,
> +				       phys_addr_t phys_addr, size_t size)
> +{
> +	struct xe_mmio_gem *obj;
> +	struct drm_gem_object *base;
> +	int err;
> +
> +	if ((phys_addr % PAGE_SIZE != 0) || (size % PAGE_SIZE != 0))
> +		return ERR_PTR(-EINVAL);
> +
> +	obj = kzalloc(sizeof(*obj), GFP_KERNEL);
> +	if (!obj)
> +		return ERR_PTR(-ENOMEM);
> +
> +	base = &obj->base;
> +	base->funcs = &xe_mmio_gem_funcs;
> +	obj->phys_addr = phys_addr;
> +
> +	drm_gem_private_object_init(&xe->drm, base, size);
> +
> +	err = drm_gem_create_mmap_offset(base);
> +	if (err)
> +		goto free_gem;
> +
> +	err = drm_vma_node_allow(&base->vma_node, file);
> +	if (err)
> +		goto free_gem;
> +
> +	return obj;
> +
> +free_gem:
> +	xe_mmio_gem_free(base);
> +	return ERR_PTR(err);
> +}
> +
> +/**
> + * xe_mmio_gem_mmap_offset - Return the mmap-able fake offset
> + * @gem: the GEM object created with xe_mmio_gem_create()
> + *
> + * This function returns the mmap-able fake offset allocated during
> + * xe_mmio_gem_create().
> + *
> + * See: "Exposing MMIO regions to userspace"
> + */
> +u64 xe_mmio_gem_mmap_offset(struct xe_mmio_gem *gem)
> +{
> +	return drm_vma_node_offset_addr(&gem->base.vma_node);
> +}
> +
> +static void xe_mmio_gem_free(struct drm_gem_object *base)
> +{
> +	struct xe_mmio_gem *obj = to_xe_mmio_gem(base);
> +
> +	drm_gem_object_release(base);
> +	kfree(obj);
> +}
> +
> +/**
> + * xe_mmio_gem_destroy - Destroy the GEM object that exposes an MMIO region
> + * @gem: the GEM object to destroy
> + *
> + * This function releases resources associated with the GEM object created by
> + * xe_mmio_gem_create().
> + *
> + * See: "Exposing MMIO regions to userspace"
> + */
> +void xe_mmio_gem_destroy(struct xe_mmio_gem *gem)
> +{
> +	xe_mmio_gem_free(&gem->base);
> +}
> +
> +static int xe_mmio_gem_mmap(struct drm_gem_object *base, struct vm_area_struct *vma)
> +{
> +	if (vma->vm_end - vma->vm_start != base->size)
> +		return -EINVAL;
> +
> +	if ((vma->vm_flags & VM_SHARED) == 0)
> +		return -EINVAL;
> +
> +	/* Set vm_pgoff (used as a fake buffer offset by DRM) to 0 */
> +	vma->vm_pgoff = 0;
> +	vma->vm_page_prot = pgprot_noncached(vm_get_page_prot(vma->vm_flags));
> +	vm_flags_set(vma, VM_IO | VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP |
> +		     VM_DONTCOPY | VM_NORESERVE);
> +
> +	/* Defer actual mapping to the fault handler. */
> +	return 0;
> +}
> +
> +static void xe_mmio_gem_release_dummy_page(struct drm_device *dev, void *res)
> +{
> +	__free_page((struct page *)res);
> +}
> +
> +static vm_fault_t xe_mmio_gem_vm_fault_dummy_page(struct vm_area_struct *vma)
> +{
> +	struct drm_gem_object *base = vma->vm_private_data;
> +	struct drm_device *dev = base->dev;
> +	vm_fault_t ret = VM_FAULT_NOPAGE;
> +	struct page *page;
> +	unsigned long pfn;
> +	unsigned long i;
> +
> +	page = alloc_page(GFP_KERNEL | __GFP_ZERO);
> +	if (!page)
> +		return VM_FAULT_OOM;
> +
> +	if (drmm_add_action_or_reset(dev, xe_mmio_gem_release_dummy_page, page))
> +		return VM_FAULT_OOM;
> +
> +	pfn = page_to_pfn(page);
> +
> +	/* Map the entire VMA to the same dummy page */
> +	for (i = 0; i < base->size; i += PAGE_SIZE) {
> +		unsigned long addr = vma->vm_start + i;
> +
> +		ret = vmf_insert_pfn(vma, addr, pfn);
> +		if (ret & VM_FAULT_ERROR)
> +			break;
> +	}
> +
> +	return ret;
> +}
> +
> +static vm_fault_t xe_mmio_gem_vm_fault(struct vm_fault *vmf)
> +{
> +	struct vm_area_struct *vma = vmf->vma;
> +	struct drm_gem_object *base = vma->vm_private_data;
> +	struct xe_mmio_gem *obj = to_xe_mmio_gem(base);
> +	struct drm_device *dev = base->dev;
> +	vm_fault_t ret = VM_FAULT_NOPAGE;
> +	unsigned long i;
> +	int idx;
> +
> +	if (!drm_dev_enter(dev, &idx)) {
> +		/*
> +		 * Provide a dummy page to avoid SIGBUS for events such as hot-unplug.
> +		 * This gives the userspace the option to recover instead of crashing.
> +		 * It is assumed the userspace will receive the notification via some
> +		 * other channel (e.g. drm uevent).
> +		 */
> +		return xe_mmio_gem_vm_fault_dummy_page(vma);
> +	}
> +
> +	for (i = 0; i < base->size; i += PAGE_SIZE) {
> +		unsigned long addr = vma->vm_start + i;
> +		unsigned long phys_addr = obj->phys_addr + i;
> +
> +		ret = vmf_insert_pfn(vma, addr, PHYS_PFN(phys_addr));
> +		if (ret & VM_FAULT_ERROR)
> +			break;
> +	}
> +
> +	drm_dev_exit(idx);
> +	return ret;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_mmio_gem.h b/drivers/gpu/drm/xe/xe_mmio_gem.h
> new file mode 100644
> index 000000000000..4b76d5586ebb
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_mmio_gem.h
> @@ -0,0 +1,20 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef _XE_MMIO_GEM_H_
> +#define _XE_MMIO_GEM_H_
> +
> +#include <linux/types.h>
> +
> +struct drm_file;
> +struct xe_device;
> +struct xe_mmio_gem;
> +
> +struct xe_mmio_gem *xe_mmio_gem_create(struct xe_device *xe, struct drm_file *file,
> +				       phys_addr_t phys_addr, size_t size);
> +u64 xe_mmio_gem_mmap_offset(struct xe_mmio_gem *gem);
> +void xe_mmio_gem_destroy(struct xe_mmio_gem *gem);
> +
> +#endif /* _XE_MMIO_GEM_H_ */
> -- 
> 2.43.0
> 
