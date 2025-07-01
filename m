Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51409C7EE30
	for <intel-xe@archiver.kernel.org>; Tue,  1 Jul 2025 19:49:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2CCE10E60A;
	Tue,  1 Jul 2025 19:49:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G1FkE54L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAB3E10E64A
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Jul 2025 19:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751399342; x=1782935342;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/R2c0LvedcmPgk+PxOYyQDOj59/4xcURjMKcPOMQL3c=;
 b=G1FkE54L/1jYAcn6Tld5fpZq1ObSd0ZVMyp9xHVOpj5RLyRs670TStV9
 YfDXFtAymEsol97Fca/kRd5PygVYjkyDmRs2+W0xrPHO8Fnec4/r09/aK
 VjbKdvX8EKPIOFSfAsk4Se00azMUdCGYO/WVQwbUJiXTE7b1Wyn2/gNTR
 O5xXEY3iEMtNXlw/9LnrNJf5HiRb6sGtGv9vdRoTZaDUB/RkGsmM/Zw0X
 lel/BDQYNKnEx5ZMu9f4xH7nh7/PLdaWz6P4qg+zi8hRGRjDKs4nSXiJo
 RxOuOkDP5MJx3c4pCmoGAVjpezucfz2G9jiy74NCzGIizvNIAB1qRLSfX A==;
X-CSE-ConnectionGUID: CIu+MCCDSam9Q4cAQlVxIA==
X-CSE-MsgGUID: lpzvPu7OS9SvX/azd7eyAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="64730761"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="64730761"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 12:49:01 -0700
X-CSE-ConnectionGUID: MrLSzUlKT4+5+Ln1A3g0Jw==
X-CSE-MsgGUID: HtvAlnMqTdaUEEEgQN0a0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="154183065"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 12:49:02 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 1 Jul 2025 12:49:01 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 1 Jul 2025 12:49:01 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.60)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 1 Jul 2025 12:49:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZVS7s+07QhCQIpa3YwUm6UZ0zaRsWuK+F+J1rbirNFydq9fFFed/02aSol8QGPzAIhGYrm/o1T70p1oofDZHXlFweIc/5+ADvKqvI2bp4hQNFg8dSbz/IPYpKbFeoqDWwOzBNzRihwesao4BhypQa/wHTi09wotxRQSUi3WtuitaFz3qTXl5loarfFL0LVEp0cIXO2VRzl099CsGXIoP4WcCYoV5ZQji46RPtbfHJ2e9HhKNAh/JZskvSAiqbBpIg6xu/tivaquHe3BvDSBcBsdemltX6wZPBF3N/8lQsR2dqgvqJ8mFtsMOKuYbUoUpRzPttoKLTlsw8HIvhm3fQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/R2c0LvedcmPgk+PxOYyQDOj59/4xcURjMKcPOMQL3c=;
 b=bWK8XXCUKVyCiucemen+3tc9TUJLYjW7RMTdYdYKSRVM8a3TM591LbFXgo7r7o+CadOQvfJNaeOM5As3dOSjfEYu5wbfuuxWBnjsaYBEEf/BLZMp8/fyrlxWNueflr5M7LOcpCYnwr1s3M211fKwnwHfvp5xg1q3HZvxFA+LUf/s77zPLUoAIrTYaZZk3AqO7z9dhL+KnJ/p6acGAstuisLwdmKAFOA2mWgzpvN2ih3FeBhVHBgTi+qbZwvtoFNLAcfDQ3RG0nGXkig7EPo1KzI+PU9pGgl1SmrzIPSDq6iXWEvqSZOZBdFVIL/cjBHX4UpOpOB/Gj0256Sfzkk71w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB8033.namprd11.prod.outlook.com (2603:10b6:510:246::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.19; Tue, 1 Jul
 2025 19:48:59 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8857.022; Tue, 1 Jul 2025
 19:48:59 +0000
Date: Tue, 1 Jul 2025 14:48:55 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: <intel-xe@lists.freedesktop.org>, <kernel-dev@igalia.com>, Matthew Brost
 <matthew.brost@intel.com>, Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH v8 01/24] drm/xe: Consolidate LRC offset calculations
Message-ID: <wmuju72nzwucmsryyxaldfbqorjmkdl37ohb7gulqaz5ze34tx@6gcity4astdf>
References: <20250630124711.8209-1-tvrtko.ursulin@igalia.com>
 <20250630124711.8209-2-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250630124711.8209-2-tvrtko.ursulin@igalia.com>
X-ClientProxiedBy: BY5PR20CA0033.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::46) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB8033:EE_
X-MS-Office365-Filtering-Correlation-Id: a89550cf-737b-4b2b-469a-08ddb8d8527c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?TlALB9eGX2AE5By/DcNSeBFkg39OJwF0PxA7RHbBAuVNV0b9EvQeL4lJEX2Y?=
 =?us-ascii?Q?a9QaKwKwlwhOb/7HP1zzrhS0kup9M+9udtxBTMDgWpV9hpRpiS2saOHzPxzs?=
 =?us-ascii?Q?MwlJlfJ3aJgNXIbZHzngJhTiT6qQ7x/TsGCsun/KZcBLJJ746sAzq/mY6AVC?=
 =?us-ascii?Q?gKnyixtsQ2HWPua7QjBZnrOh8JmwQZXrVy1X10/LnIKVa9L54YAVt1TZV1Ju?=
 =?us-ascii?Q?qjqk5hnOZfSuyuHB5tVxyVAGHw6Mmp94qJk/Efm030IeUgTbGEYl35xMpyHg?=
 =?us-ascii?Q?kxReLax5uZoqk/UEYRgs+3g81IiMFWUTxIdsUuZZ+dY6UUXnxi6axvIlDG4e?=
 =?us-ascii?Q?220N/EPh7FpMI5Ul4v8bgshqoKmajcSppuPYEdqmJ9MCQZ6MoEEw9TCi2F58?=
 =?us-ascii?Q?LgCG+uBRYDyIM4cllQLL/wURVuwo+YooUh3CKgftsS4Y+cV1HzvXBAfSuJTY?=
 =?us-ascii?Q?N3RDH3Gp9J754qxb+26I1oDYf29dKrsK3BL9DKJMcmml8xCZO+Am/qhki0Tq?=
 =?us-ascii?Q?NpPWkKn/avPTOpq/4OHzO8p+M+dutepkli84DNCNkPXGuvJNyu2vFUjLiLZa?=
 =?us-ascii?Q?zhdirW5tEemYSbd7C2AZCw8lGxOP+4CHcOn6hZcbO1mloZ98pudIM57jIvae?=
 =?us-ascii?Q?yvOb6EnKCYzKbvjRjShkNyugmiS7qgm0U39EzB7+c1bfCnXdB86bPaDNTXpN?=
 =?us-ascii?Q?bVPqcKIb0Gq3bYKtvEU3RCwvIoBHDKCfu97cFM5vA2pZKEUZnW0JmZpkHGhx?=
 =?us-ascii?Q?SpwUmuwW8qTdS0HSpb/PcYfWaAZzk4hdu6E8GFrdG0Bz+oAVGKUyi8inPw51?=
 =?us-ascii?Q?llVXADRU0cmDYOapvYpKdQ03KcxXcTqniuqvskzux8if570Y9++Kwj92IrOc?=
 =?us-ascii?Q?1Pd5u4CZPoYuXa33PB2qgJsfCSIhkzcXIy7Vpe5Oh5hVl9l/7L5KxVgxvFHm?=
 =?us-ascii?Q?UMfSmhIwj1Spfptzy0a+FJivhvbL6yM89en37cfFlaW1YqBK1hF9BWKq6zIB?=
 =?us-ascii?Q?Ssw8Snh70CGq0hbnoUqf/EfytmXqG5Iey2WkX5ir3omWY3Z32laJhzl8fahZ?=
 =?us-ascii?Q?F8Y04WE5GJVGcW38YLiZoc/WlCIBa+FxQtp7zKqW+z656YQhX3KaLEUS9tYJ?=
 =?us-ascii?Q?niiyHqLdPe034yoW3IsxXWBt3lhhajaNNgUVHD3Q+X9CyohSe+w4TZDsBb96?=
 =?us-ascii?Q?3Kt97ZwaeT3co+yR+Vl/VKi8FXAbBq5WEtr0DaO+xrEAjQBGFZ74E/7U2pnz?=
 =?us-ascii?Q?nSSeutueHdTwKsi9jM2/jcUHB5MS1/oalvyYODItDqWB+BlSZ8b0AeRCULsF?=
 =?us-ascii?Q?JAskf5+lfjsmjyNY8A4l4IN6JL9N8APy+zTx/geraNdhHAKIStPfGnyMmwsy?=
 =?us-ascii?Q?JpIhqF3OAS1LsjsRnReop7NNQOy4rKerFRY28owHhrIaqiWmFTwxoUMsSH+W?=
 =?us-ascii?Q?VAZreIQ2S5c=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ClBI1UAx8D7GDk5MSCpPWoc0nA/nlLWKFe9mMeqrmaH5TMiEI3N/b50f+Aen?=
 =?us-ascii?Q?vMMky+sAYOuCKJQMj/f6vhbCpltDdrhbDJw/zkh0w7QE6t9uSpc0O9JFtml3?=
 =?us-ascii?Q?MBpqqm3GSEJBvRZGoDzvtwinlq/Tu1aGL6Nns5iE+shQ7j3hXlS4T04r8d0+?=
 =?us-ascii?Q?cz7Fwa3q2fwND7VLzzJLRnkWvXkE2TOHxNR6Hi/0BlnFa+Z0hUyY+mfbkVHd?=
 =?us-ascii?Q?0UJq/IMBpZaEIXH2OFNJnEqjLq7cLgAC8rrAIQ3gfC6JjeV3CRyXEEUzbjIu?=
 =?us-ascii?Q?Y/dlo3JpgTyqR/aVKnWKkYxUZ/MDeMqAncNhBLM99VR5s0Ya0LMV2I9QGf6q?=
 =?us-ascii?Q?AlOApBg7lAmup0lGmkGt49cm+4LFeEypPpm87gg4nO4pd+3FHWWE6mlKPxdA?=
 =?us-ascii?Q?XdI7nDU7Rpk8wuU5JPj3XLjO3Ijy8b2yE1Kv3rD7ssxP5xRYiNf2fvun5eIv?=
 =?us-ascii?Q?lKuxuycluw9OqjWl+sRolmS1qjcmI4xumXzdAnx4IEjgxi3ONvj7zJp+LeTr?=
 =?us-ascii?Q?DnVOfGBb8j7Gj0MWS6mta6yZzG3gb/arIq1tQkn8savOUA8S0U9E5qjcv7od?=
 =?us-ascii?Q?cOXWh6PVGAukW/1tUcU+ZhtVt24LhJtZtvs53cgsvvvK9z1k0L392dyuj7v+?=
 =?us-ascii?Q?4M6HVME/VcWDP0Hc2kdMVky7XbC/2GUMdjIBFHqcJVcC6YZUF9AOkPEp3zMx?=
 =?us-ascii?Q?yuoNAi4GPem9aCyvFPd0HB2HsHm66+hcBHbGpuP/BsQS1p0yuSzxYtg+4D/d?=
 =?us-ascii?Q?eXjcti5xtJm7yJVMsJPLEbl63oy9ORj9xMjCy/nhnzEdPxc7abe7V9vfkU65?=
 =?us-ascii?Q?InPvGaKrhkcFh8eGDnzx1pzH6x7pn5xexkDS1LcK2EbUB0kxeQMFGQMoiysz?=
 =?us-ascii?Q?jjxRgi57oomugoJJojkhswjd2fAKrwsVhRkCWU523LHACuDsZu2/DAn8eqzW?=
 =?us-ascii?Q?XYjGdPNer2c/lf7hyy1oUJ2Xx1gkE7aprYNZLAsCdSHwamH+jhySN/ggq8Mb?=
 =?us-ascii?Q?C2GXPPvmI7NS8AhlRuVZzcz4+rsdQ2Ydsan7u6vIigeNSJrJjaXqkYlSrBdp?=
 =?us-ascii?Q?ARw+ZFcOari4VWN7SQ9IZlPYqM4Wgg/Q2YopYs8mgloqXGqxLaSiTGzkqNRa?=
 =?us-ascii?Q?xalaUbIADI2UNN3cIcUQQXyno2oQiYqT6wtCnid1N6RpJ20hmpsaARNjPlbg?=
 =?us-ascii?Q?x32K2iuodSZzPgak07NyCrrepkz28ioCn8mVstNPFuQ1B6+riAhU0Ndfnkab?=
 =?us-ascii?Q?QcsP1l2z8bbkIGhqtzAdfWAPkYu9GgDcefshvUxGTNEoC1averdcIMPaDQrO?=
 =?us-ascii?Q?RdaKHJQhi2GwmVA9GbjDI9YfA6Z02M9VeKFV3owdtRrT0oXVn7UDyldDxV3G?=
 =?us-ascii?Q?KoStb0eexOE17/R52I2nDrmDdnqO7jpPyv0tAisJx/OU/O52L4CpWZ3O5KKh?=
 =?us-ascii?Q?e3rI18dy+98IYApsJP2qWkO4pvRaowgjYQfaXqVeb3MHLuWzR6DI0UQSvc9G?=
 =?us-ascii?Q?IYw8mX6/Sensf7HVEG8m3ywmfTEEsMFObgXfyfFiBnZtFKuJHSSFGDEBg0Ib?=
 =?us-ascii?Q?Me3xyaVHFzf9Bv+WawgPwFIfLct0btdoQW2GaGykLdO3/asbSMv6mf0/RpRs?=
 =?us-ascii?Q?lA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a89550cf-737b-4b2b-469a-08ddb8d8527c
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 19:48:59.5101 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y/sU50aVZtLv3Lf1/dvtPHgLXrLOcvutE45PQoFlSxnNCZGM2D7Qr5Wb9uGCezRLS/tD6MG214USLRUpykzaEJnNOpQMAQLIExlHcUFkm9g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8033
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

On Mon, Jun 30, 2025 at 01:46:47PM +0100, Tvrtko Ursulin wrote:
>Attempt to consolidate the LRC offsets calculations by alignning the
>recently added wa_bb_offset with the naming scheme in the file and
>also change the size stored in struct xe_lrc to not include the ring
>buffer.
>
>The former makes it somewhat visually easier to follow the layout of the
>various logical blocks stored in the LRC bo, while the latter reduces the
>number of sprinkled around calculations.
>
>Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>Cc: Matthew Brost <matthew.brost@intel.com>
>Cc: Matt Roper <matthew.d.roper@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Applied this patch (and only this, for now) to drm-xe-next.

thanks
Lucas De Marchi
