Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 857BACCD1BC
	for <intel-xe@archiver.kernel.org>; Thu, 23 Oct 2025 15:11:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3262410E918;
	Thu, 23 Oct 2025 15:11:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MSQwN0a3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78EE810E918
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Oct 2025 15:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761232286; x=1792768286;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=qqItJozakYiUVZ2703zLGxq+cEAZl3e6YesCZxFRm0w=;
 b=MSQwN0a3sQFd69y0jTRuXhCg9vbS/nYkGeiqQrx5V/epb98aj3LyQfGY
 vQl3M6TQcP7XHoGyyUzw7KVTyaFHsm4qxpqt7lxYN4EVY4qLzXo8b/map
 EVfnlPSwsFI4zak7AiKdhQ5yQx9KfbpGVCv8DPMdBDlmxDubJaxYmd9m4
 PjTZCBvHOY/KJdLj5EsPsFG4+qG3ANPnnhquQ8/eYAcEsxxFXUhVP/lPR
 ZeOCjRuN4hS2lKMUmIzpPJqXoFnUIVicbJ5vKXHvAK1tdn1teH/whZOva
 XQd5NXpGOkQUYRMDK8slMfEa47hGnCw0+KoR/mOQ30jWx/dXvbW/PGToh Q==;
X-CSE-ConnectionGUID: uHaawSqMRbCnFNuN+tA8Gg==
X-CSE-MsgGUID: pNlGuY1hR/+5n52Am3WPYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="81030205"
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; d="scan'208";a="81030205"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 08:11:25 -0700
X-CSE-ConnectionGUID: JD9oAiP3QMOMPAmXAb++Ww==
X-CSE-MsgGUID: p7o/7OQPQNSs8NOD/Eyxmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; d="scan'208";a="184108985"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 08:11:25 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 08:11:24 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 23 Oct 2025 08:11:24 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.69)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 08:11:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dg1i97iqrTK3X0SXinM4Zg9mjVfFKv5J6P4hcee88dHqczeZidWWlNQKg+R+LPeXvaJRjfu0gnclkP3eU3UYg7ZBClhH815TD/1KMnwvGeS0343SyxPr0GWfieB63f/cQLd/JK3SpOhkaVOTVeqDlW1Uk6CZYv1yCymXmEsASu0YkBL6BTXVwBuN7SJ/aDL7Xx+V3QAo4Gpsbiuq3quIM9nVz+H3C9s+t1qCGE8EaRR78/1LUdBKg8D/v5rAzeCw7+14ubQYMSD2YG4yodUmO3ByXAV+Rm3HOmzBapeOfbI7OnvY9gVe7M7XNwEZYMdHFe4ee26UFYm3HzKlSdvs4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nheQdEtc6E44ymwg3Yows7PPDf7Dyyf9R+tPuSS6qJw=;
 b=GIBrYRXQ57ZcMpM+opN6lerLDhnWnRkQ9q0oJd8TpWP8wyjstjB4UV1T4e3VrLRCXe6rHYPQWslKu9YqetrB5DBDRkB75cPxsxJDcMrQjvqKmaDj3GsUjPVmii84UGeD9+6ofJDGgUOXr/ZY9X3cC5+VAk5cTeABJQhV3NlQiG16U5cYJNfFa/kuOe2481P/TvluUHiMZTm5Wcw5G4rO0UzD5yRo3BF3iOe2fVghoB7EnIEuAMjblyUv+4lEE45bDULTfomhKzlT3YY9OsNkqs831qwk4Y1o09EbEDjSag60apZB3tu//94+FY+MUejKyrzFoyuQq9AAnlK4Aak6Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CH3PR11MB8659.namprd11.prod.outlook.com (2603:10b6:610:1cf::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 23 Oct
 2025 15:11:22 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 15:11:22 +0000
Date: Thu, 23 Oct 2025 10:11:20 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lukasz Laguna <lukasz.laguna@intel.com>
Subject: Re: [PATCH 11/12] drm/xe/pf: Add TLB invalidation support for MERT
Message-ID: <a3mxo7dyi4lg4hj6looiw6ig7dto75ryjspwfcyonint6kfvcz@mvrk6ypi5vdc>
References: <20251021-cri-v1-0-bf11e61d9f49@intel.com>
 <20251021-cri-v1-11-bf11e61d9f49@intel.com>
 <aPkiQ5qSAQmgjU7L@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <aPkiQ5qSAQmgjU7L@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: SJ0PR03CA0259.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::24) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CH3PR11MB8659:EE_
X-MS-Office365-Filtering-Correlation-Id: 0aa300f8-54ad-46df-bd00-08de12466d61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MIXWuH/01m2xa3b3G8qX1RQ+II+omIl6O/BYL8Rqq32rQWAPNT4HG26UxoFI?=
 =?us-ascii?Q?1qCoJoF+ObWoP7zeXUUc1CmMWY/naHzS3jm1jfTjzCsbIpnM2pE1gwgurKfT?=
 =?us-ascii?Q?06+Z1gMjhvglshzqwSY4/L+4s6of6ZU11nekqPMFZfJ45h/D4/Ninb0gl3f5?=
 =?us-ascii?Q?DUABYCPFZouErWinmTc/tfKJgWLcBpxJ50LpORoMifmfoTvK9DKuXKos+c5u?=
 =?us-ascii?Q?b4fldPtmmtmG625gF0QxRyraqP1DJcU2ym0yqls2vSbkgCh2xkJBuhKEoVRj?=
 =?us-ascii?Q?arLcyrR0ZXP1qsAvPR9voSy7eisK6cn1dHBi0l8RtYMgu3w2a3L58V2oifjo?=
 =?us-ascii?Q?sfAJGhAZvspJzBuxVuqRmSZzWCgULDsexp3DPKbJ2+xsaHPajDAn+zy2Cy5B?=
 =?us-ascii?Q?QdKsg9IQl8LcYPLYVpMMKZllD/3x3GABiILsARBVI1mdafhU69Lmm4rrBims?=
 =?us-ascii?Q?qHO1pIWFlyzj5lIQabdhO6VWjvpbVMp7Z5Hl01C8eUw/TmDcMQGGZTrujE5x?=
 =?us-ascii?Q?NVRC2Gx3V3hNbWckvmOPTcZeNdzHrrJiPAih7pRNyXRn50pK1CTT2iSEIgCE?=
 =?us-ascii?Q?Ek+BfjG3NKTFgrXXAWlpOz60lYZEar3RiOt0fjifgkdE66P/Pi1OC1QFIy0N?=
 =?us-ascii?Q?bk4MPKwFKdheMaV1QxtJQNiOWh1/6G+pGUOeKgGnyycatUGzW7tvmAYHx02K?=
 =?us-ascii?Q?n+C8qR6cQgTomzZqkm56iwxkPMUxw1oXi6vvx82WzvbSc8aV49TQNVkpMIrB?=
 =?us-ascii?Q?9IYKZOxxfgXFxZ6jjQBchxRAACblZtZktBzClk2BuTL53gYAEQ9YU+1yg+jN?=
 =?us-ascii?Q?LWbUVqxeV3qwt3sgSkCFTpZBXSkhNzmRYJVoASY7iTb2R+pJZ239T/rejWPq?=
 =?us-ascii?Q?Msm1Cukl+887+zy7K3VKzKQPcTncqu3GwqGormxgL6557HkES2E6HVqbYUFA?=
 =?us-ascii?Q?PbTHw3usAJ8RqxMqRTZ8H/chccHVLISa0mP/fxFLWVo0UqQLDVEvCUY/AxSa?=
 =?us-ascii?Q?MXKp8cPTsIaCR2PlnOVF5/xW+JUBhpKtxH9WiAtbZMjHWzQzMqwIj7B3N3sE?=
 =?us-ascii?Q?pkBclDiRhQI64nN0xR0+j+pmB+LgF9eexA73BLQYGKe1JQNa+gMBeL+UWUtg?=
 =?us-ascii?Q?cndg9/9tPjewvv5zoEk9otiECXzPSZdWFoSUy2KJabozzYLxcylTwjGCxjNq?=
 =?us-ascii?Q?4/wMHj/DBuWk3aRu+ngzQ1ioSCaGUjuHD+XT2d3FISLrbLORJ4RrNuqmbGpr?=
 =?us-ascii?Q?WPGhH/gVEiUJb06uX2MOJeU9hkeOC/y7bumkCHVLCFfYIB7D/EHOJ7nsEadE?=
 =?us-ascii?Q?gnGUgT4OE5lCoLfwAyXuD+BHX9pEJOv3VdMZrgR15NR1/iDVlS6l8neaSzXm?=
 =?us-ascii?Q?+tqmRY7aQDB2xF6QDdfLcRAfj9DDPEHgz9M+X/o68/9xrNbMXFDz3ZsR0cJO?=
 =?us-ascii?Q?Um3ePCzu4WwfASSIuqDn6CU6JKPrqC84?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aDoQUy7D3AR08Tv1xwLDsp2rW8rFkK91W8NsI3+L/gjh8BVUeIZ0ivqtRr+D?=
 =?us-ascii?Q?tjX1SiR8FvNg0Ptg7E45WZCvKPNnaEAvE+tvH3txYC4aPpxhpWa2xMeoUC0l?=
 =?us-ascii?Q?LKnZZuK7XXOOZJ4n2uuCI9/4p8dZFydvPYaTUEyLU9n8urgd9aXTf38VffGW?=
 =?us-ascii?Q?6Vg8mnPL2lYyfY3zYbvVvnoD4pfnHbmS1eXh2d2asURj/JrEDOI6BYKjLnFs?=
 =?us-ascii?Q?ySu2F6NfhiWS5xoNRTqbHzNQswoiiOnvDRUEEkS+Camo64bR1+hEOjpkIKg4?=
 =?us-ascii?Q?PtHi1QZM6h8qOmAR0b5OJfpNfsqScox1iL9ar8QNBQB4ocfMj7GzRS51MQH5?=
 =?us-ascii?Q?rjAkHIY+eO594k1Y2QJ4T62a3hl3SHCHv+oxuBad6L8tkpBJHmO5lmkypl7d?=
 =?us-ascii?Q?kjo7q3l2OADmGtBRdHB2k93gieBt/ew+Qi6rqRY5hDylcJy61VpgvX9tCZ3H?=
 =?us-ascii?Q?lu+Tz56yqeZbHjG2jlvRMj3O+9uVLlpZoMDUwAN0lrybb4XNB26ke9Gi6L51?=
 =?us-ascii?Q?fXts2lZrtggL03XqYswu1IC2lldZNNitxgpobkThhr8+9tlAh3D5mjKhBvw2?=
 =?us-ascii?Q?eo81XsHslLw9Ww68VmP+gFycGOJv6QKDd4ieyhChQvqxX/z5MWAk7oH65nNV?=
 =?us-ascii?Q?G9I35G6b07eGZDPue+vwLvNiONuPlzXSXk/AgWuOI0Md/+PcnQTXNeAalek3?=
 =?us-ascii?Q?U+TPQbuqVdvC8SyEBxrLlCLX02uKieOpQ1Xt1GeueGvs+WSAgs0ja8AQYqV3?=
 =?us-ascii?Q?AvfZg97eL58+fHk58sIPhS7ldY99C5+AFvUTSh2lkMHQkqEXQzzj8LlkIGLt?=
 =?us-ascii?Q?KFvvCd0mGxKdmLv+NG1Kuchg4q5swrvzXrvxeIY5r2DqPGlk/bNX/hS5dNvs?=
 =?us-ascii?Q?C6h2aEf+TyOWksSxOr+olWEoGoD2KP/W9GYx6wOi+/RPWENhFhNJyxahaHuq?=
 =?us-ascii?Q?1UFIpWrwkriuew/rIzHrOeOL79umicrV0Xfw9I6nqRpb5KbHAT4gTlZf36aZ?=
 =?us-ascii?Q?PaUT6MbhrYsPT9DA37w5qdqQb4XfIx5qy8W5WEo0U8uAD21gq+gHlXBwxKn2?=
 =?us-ascii?Q?jJ4lhRnEgUPhT2GKfIIkjkeQv49Rb4lg/OEaVq9ISyDDDc09QpwHg4Bd3jzi?=
 =?us-ascii?Q?16GM1phVNff56plmq1SXS3HtNNpk0WqTLEs68qb8AiS0rxIZ2Gyrg2rr3JzR?=
 =?us-ascii?Q?jGIUbNWLQolrZwyNsrcnjhWwdRrjVP2FtoXO3xEetwpr41bsaENXE3UYJQ0Y?=
 =?us-ascii?Q?IJdMlvXLMalZlU81fldnlLk3dKcdyVN/pXarRo8xVz0DJWh0OnuXbImgxIzD?=
 =?us-ascii?Q?QpL3QCTGWQq1XtlnJFRspBGtHwCSZLZ77lF4Eo2oYsFnJG2xY5GhQN787z3Z?=
 =?us-ascii?Q?oM8U1Z9EXLlIA3vh1bvw1bruw8N5+pqUsLG9htDL/0KBpzfx/u+e9j5sNrTk?=
 =?us-ascii?Q?EvavY13HGmIV7gZOo1EnbscMXXOQb9pLlt8VXHzt4zhOYsUPY+bDOqdHkOcp?=
 =?us-ascii?Q?v8BPevZvCw4WITftC+MMseAa7sB5xlGIphlyaUiFqUdofmULuWC2SCLU0fZ1?=
 =?us-ascii?Q?t7nWn9J9uH3Xwarc37VCMfovfpLy905oOszgrxlbJ636d2XOsznPIuG0aANF?=
 =?us-ascii?Q?MQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0aa300f8-54ad-46df-bd00-08de12466d61
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 15:11:22.8279 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oyNP+A8WpOwOZF9uofFsY5qMAz6DW1wYhjhH2dnzKKGEA1RMDsxquuPl7I3qt3f8q6CPBWAmgmxwqmgNsq0yuq4BdHhXgNM/sD92zdZAY6w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8659
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

On Wed, Oct 22, 2025 at 11:28:19AM -0700, Matthew Brost wrote:
>On Tue, Oct 21, 2025 at 10:17:43PM -0700, Lucas De Marchi wrote:
>> From: Lukasz Laguna <lukasz.laguna@intel.com>
>>
>> Trigger MERT's TLB invalidation after LMTT updates ensuring memory
>> translations remain coherent.
>>
>> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/regs/xe_mert_regs.h     |  3 +++
>>  drivers/gpu/drm/xe/xe_device_types.h       |  6 ++++++
>>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 19 +++++++++++++++++++
>>  drivers/gpu/drm/xe/xe_irq.c                |  8 ++++++++
>>  drivers/gpu/drm/xe/xe_sriov_pf.c           |  3 +++
>>  5 files changed, 39 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_mert_regs.h b/drivers/gpu/drm/xe/regs/xe_mert_regs.h
>> index 5b7c15e08747e..aef66c04901d2 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_mert_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_mert_regs.h
>> @@ -10,4 +10,7 @@
>>
>>  #define MERT_LMEM_CFG				XE_REG(0x1448b0)
>>
>> +#define MERT_TLB_INV_DESC_A			XE_REG(0x14cf7c)
>> +#define   MERT_TLB_INV_DESC_A_VALID		REG_BIT(0)
>> +
>>  #endif /* _XE_MERT_REGS_H_ */
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>> index fb401809fae5a..6fcd35bee73b5 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -219,6 +219,12 @@ struct xe_tile {
>>
>>  	/** @debugfs: debugfs directory associated with this tile */
>>  	struct dentry *debugfs;
>> +
>> +	/** @mert: MERT-related data */
>> +	struct {
>> +		/** @mert.tlb_inv_done: completion of TLB invalidation */
>> +		struct completion tlb_inv_done;
>> +	} mert;
>>  };
>>
>>  /**
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
>> index c0c0215c07036..ebe81cb21f5ab 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
>> @@ -10,6 +10,7 @@
>>  #include "abi/guc_klvs_abi.h"
>>
>>  #include "regs/xe_guc_regs.h"
>> +#include "regs/xe_mert_regs.h"
>>
>>  #include "xe_bo.h"
>>  #include "xe_device.h"
>> @@ -31,6 +32,7 @@
>>  #include "xe_lmtt.h"
>>  #include "xe_map.h"
>>  #include "xe_migrate.h"
>> +#include "xe_mmio.h"
>>  #include "xe_sriov.h"
>>  #include "xe_ttm_vram_mgr.h"
>>  #include "xe_vram_types.h"
>> @@ -1346,6 +1348,20 @@ static int pf_distribute_config_lmem(struct xe_gt *gt, unsigned int vfid, u64 si
>>  	return 0;
>>  }
>>
>> +static void invalidate_mert_lmtt(struct xe_device *xe)
>> +{
>> +	const long timeout = HZ / 4;
>> +	struct xe_tile *tile = xe_device_get_root_tile(xe);
>> +
>> +	xe_assert(xe, xe_device_has_mert(xe));
>> +
>
>It is not obvious how upper layers which call this function get
>exclusive access to what appears to be a per device resource.

this is a static function that will only be called by the function
below... I think the lockdep should rather be added in that entrypoint?

>
>Is xe_sriov_pf_master_mutex held here? If so, I'd add a lockdep assert
>so this is self documenting on how exclusion is achieved and to prevent
>misuse. If not, you probably need a lock here.

yep, but another question below for Lukasz or you...

>
>Matt
>
>> +	reinit_completion(&tile->mert.tlb_inv_done);

is that the right thing here? Is xe_sriov_pf_master_mutex preventing 2
waiters?

Lucas De Marchi

>> +	xe_mmio_write32(&tile->mmio, MERT_TLB_INV_DESC_A, MERT_TLB_INV_DESC_A_VALID);
>> +
>> +	if (!wait_for_completion_timeout(&tile->mert.tlb_inv_done, timeout))
>> +		drm_err(&xe->drm, "MERT TLB invalidation timeout\n");
>> +}
>> +
>>  static void pf_force_lmtt_invalidate(struct xe_device *xe)
>>  {
>>  	struct xe_lmtt *lmtt;
>> @@ -1359,6 +1375,9 @@ static void pf_force_lmtt_invalidate(struct xe_device *xe)
>>  		lmtt = &tile->sriov.pf.lmtt;
>>  		xe_lmtt_invalidate_hw(lmtt);
>>  	}
>> +
>> +	if (xe_device_has_mert(xe))
>> +		invalidate_mert_lmtt(xe);
>>  }
>>
>>  static void pf_reset_vf_lmtt(struct xe_device *xe, unsigned int vfid)
>> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
>> index 011b5eb66102f..82bf0d3995dfe 100644
>> --- a/drivers/gpu/drm/xe/xe_irq.c
>> +++ b/drivers/gpu/drm/xe/xe_irq.c
>> @@ -12,6 +12,7 @@
>>  #include "display/xe_display.h"
>>  #include "regs/xe_guc_regs.h"
>>  #include "regs/xe_irq_regs.h"
>> +#include "regs/xe_mert_regs.h"
>>  #include "xe_device.h"
>>  #include "xe_drv.h"
>>  #include "xe_gsc_proxy.h"
>> @@ -468,8 +469,15 @@ static void dg1_intr_enable(struct xe_device *xe, bool stall)
>>
>>  static void mert_irq_handler(struct xe_device *xe, u32 master_ctl)
>>  {
>> +	struct xe_tile *tile = xe_device_get_root_tile(xe);
>> +	u32 reg_val;
>> +
>>  	if (!(master_ctl & SOC_H2DMEMINT_IRQ))
>>  		return;
>> +
>> +	reg_val = xe_mmio_read32(&tile->mmio, MERT_TLB_INV_DESC_A);
>> +	if (!(reg_val & MERT_TLB_INV_DESC_A_VALID))
>> +		complete(&tile->mert.tlb_inv_done);
>>  }
>>
>>  /*
>> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf.c b/drivers/gpu/drm/xe/xe_sriov_pf.c
>> index bc1ab9ee31d92..b40701d75dacb 100644
>> --- a/drivers/gpu/drm/xe/xe_sriov_pf.c
>> +++ b/drivers/gpu/drm/xe/xe_sriov_pf.c
>> @@ -88,6 +88,7 @@ bool xe_sriov_pf_readiness(struct xe_device *xe)
>>   */
>>  int xe_sriov_pf_init_early(struct xe_device *xe)
>>  {
>> +	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
>>  	int err;
>>
>>  	xe_assert(xe, IS_SRIOV_PF(xe));
>> @@ -103,6 +104,8 @@ int xe_sriov_pf_init_early(struct xe_device *xe)
>>
>>  	xe_sriov_pf_service_init(xe);
>>
>> +	init_completion(&root_tile->mert.tlb_inv_done);
>> +
>>  	return 0;
>>  }
>>
>>
>> --
>> 2.51.0
>>
