Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ADA9CCFA1A
	for <intel-xe@archiver.kernel.org>; Tue, 11 Nov 2025 15:26:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AAFC10E5F3;
	Tue, 11 Nov 2025 15:26:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bzj2IJ5+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BB4D10E5F3
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Nov 2025 15:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762874774; x=1794410774;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=125K3Desd0hGLRs9lGU6PQhWKzujWHZLEiO4unVYKow=;
 b=bzj2IJ5+9TuJHpqAWP9ETVVZuznrHrE6LdEQORVFAck7w5qOgW72csYl
 EGmK2X0uRALGFZV/ohqEy4+6iSfDbz/pphqfgtfgqv2qKJ6pncNGnVSqY
 rbNtBtXaOnaz2A6GMMKUmBtWNlbNMAGFg2frqxvFvkMjBCCHhz2zwUMe6
 8cM8b/DmSPoZJh/akgaonAVi1Bwmj0ea9bPDPDTE37SsREtaq41KurTvB
 DLjDgTPNGVe49StnYOA6HvFbVzyzGDbKlo2eNJG5w63j2wZuaanRz0b6C
 WzZXADtaL1CZxSYRDy4ccAbeFE76nycMm+XeZUG16oJ3H3cXKN8ESlH7O Q==;
X-CSE-ConnectionGUID: I37pw1sySxC8f8+Rm8FwsQ==
X-CSE-MsgGUID: xqwCnmRpTjKMN3BTnDU1cw==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="64142645"
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; d="scan'208";a="64142645"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2025 07:26:14 -0800
X-CSE-ConnectionGUID: ytLSOFlvQ4ioLQkbluzRTg==
X-CSE-MsgGUID: Kvd/LcFJQDKjFdaWNIVLOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; d="scan'208";a="188830617"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2025 07:26:13 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 11 Nov 2025 07:26:13 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 11 Nov 2025 07:26:13 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.36) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 11 Nov 2025 07:26:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FND86ZOuawTp+touNVvh6q3sRb2xgunRQ5mnHIvFbibcfO+heKI/K2KwlZQG2jNSGuVD83w4mCfye1A9/pduunw7NSnAXpkYGFlQBiN65AFzQz0RVWRiNAUgx06TXruiEjFG7tKTqxeKoNJ8nWTNVDBbBRGu69N3fWyAFvrCKo/xbdMXP/rta5gaPf/NDGDmsdxf5dTwrYwFjv2V+cN7OxVKwcjV3neZRss6/BA3YqehUxRovADYnsKMps4KohMF0Ia7hMnVS3JYl6JMo5jCk2jT/ITo3z1C+MoNJCvU29+itK2zPd52DyeD/M5OnaXI3PZrRpwS/98aGADiI/10Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jo0aaXTchA3//EdArY5JASnMNfHJJqA/56S6bnU7jFg=;
 b=tx6Un7HG6eXDhCBmh7CSuG/udRjQUGlZkpsgN6GtVtq6/mJGLp143cJbX5CQNF/jWnfS5zuf7msVCBga32N6QmX0AiX7mXQjDlNmIOTgQ0OvIOg2pOrk26BTEGUqaNst32hEEA4pSMLMDH32teWfLb7qgyXagMD7OWlxOiQRn5LQnI1Bk3fJp8CuMLdvXPH1TfLIEE8uZ5u4jstYdPHL8Sa/q5sGtEgz+A93AZmXpH8zzNE+BNi+v62Fg/uAVG1e/Lx86kg2QrYj9x+GOwlcbYc0D+zDge0ssVJT83EKIz5Od2q9ePzvRJdUcxrjSucYEUcV6hvj2UI89dehsFVUsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SA1PR11MB6757.namprd11.prod.outlook.com (2603:10b6:806:25c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 11 Nov
 2025 15:26:09 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 15:26:09 +0000
Message-ID: <041ce21c-824f-43d4-8993-883ac08b7b0c@intel.com>
Date: Tue, 11 Nov 2025 16:26:06 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] drm/xe/vf: Add debugfs entries to test VF double
 migration
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>, Tomasz Lis <tomasz.lis@intel.com>
References: <20251107141015.29051-4-satyanarayana.k.v.p@intel.com>
 <20251107141015.29051-6-satyanarayana.k.v.p@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251107141015.29051-6-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0022.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::22) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SA1PR11MB6757:EE_
X-MS-Office365-Filtering-Correlation-Id: bfbc06af-bc1a-4d3a-7ab8-08de2136a3c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WlZsL1lPUE5hNTk0VVJKQkllck5SV0FZVzJuUmJFRytpNTBrTG1qdzlEZWZq?=
 =?utf-8?B?VHEyQkJxeERPQlJySGFINThCRGx4WHVCT1BaZVM2NlpiN0hhYjZQbG85Y0JR?=
 =?utf-8?B?Tkc5b3hhMVZoSjRKR1ZMUFptTCsxdEhETVJMdzU1eFdjWlovU2FBWE1zR1Zx?=
 =?utf-8?B?d3ZIZDJoZGJjbU85YUlicVd6aVBsY0NRTjFjYWEvb3gwU0g2VVk2TnVzL1Z3?=
 =?utf-8?B?bnFacHZSY2w4T2J0NWdYZWc5Z0pKbVhJT3RPUjJ6UEZhZnk1Z3JUWVBLRnM3?=
 =?utf-8?B?bS9kaEdQRTFNVXowVDRSL2o1VTRMRFpNb3pXL1hSV2x3SVZ3SnFxZVRQdkhH?=
 =?utf-8?B?blcvbmNGSTVuTEhXVjlNK0ozUVRmSjB6SC92aXFrVHl4R1dKa25VNXdMc1h4?=
 =?utf-8?B?R2VURmovSHFmOENzRFpuUHFqTnlzRkxocEROQTVKWlhuWEQzMUpKcmhRUTE5?=
 =?utf-8?B?WTBWcTRYbVdjdzlyWVJxb3lBdGdVcHVKa2pJUXZTbDljUThRcldEbDRIeDQx?=
 =?utf-8?B?Zi9uYzE0VXN2VkFmekFzdFFJUEc0bnpXVXZwRVRFeEpQdGg1U1BWS2dZbWh5?=
 =?utf-8?B?WFl6RTFZUFFUVTlseVd3VU10SzE1TGc2T3JZVFRya01GaDFvbWhReE96MWQ1?=
 =?utf-8?B?aHRva0lBenFRMUl3SExCdkphQ0JHU3JRZmRSOUZkMXJjRURRUWVpaG9iTmlR?=
 =?utf-8?B?aVl1WmJTczBVSnRPU0Evc3VTWE9CRGV6TzZkQnRTL0VGekpEVEVHdDM5ZndY?=
 =?utf-8?B?c2xkeFlOTkIvQUdSTmdsRm1acU9TWGhleGhkMXFwVmx3amNHR0VkcGdlWWx2?=
 =?utf-8?B?dUVSK0hNME85RFFNcWdURUhrZ08vRDl1TW5iZG55Q0gvaTA0aHRVT055UFRX?=
 =?utf-8?B?ZW9zSHZaQ052empnZE43VGtadjZYV1VKSHJQQ01kdi94UjgxbUZwZ1FhOVJp?=
 =?utf-8?B?QkM5Sjg0UXZMNEE2YXRRT2VxSnljZWtPUEVwME8rRm85Ykx4VkhMc1hVSFo5?=
 =?utf-8?B?aXlCaDJZeng5NUZQMGE2UFZNNXI1ckc2cG1YbkxXcWM4aW5OMU9hZzNxSnVX?=
 =?utf-8?B?NHlENEN1Y2RRMjRJRWpRSHZoUmVDeGkwYm1NeUV4d1VUZFFEWnVTK2pDQVYr?=
 =?utf-8?B?Y1ZJcGd2cmRRUUh2MW1scjFqVStFdTBEUEJWa1lHQlF2eVdhOWVqVzJGKzNq?=
 =?utf-8?B?N09LNzJ4aWNEcXR0RW9aZTR6bmppRjVmdXdDNThTa3JrNmYwK2ZxcEZmeVhl?=
 =?utf-8?B?ODNhdEY5WE9uWmRBSW5HZlJ2NlhrellqQnVscXJXVEtkV0w0ZFJYVkc4VHhF?=
 =?utf-8?B?NzNZSEM1cHloQkpTdnVNeGxwYmllbDVGR2pPZTZEdW5DdTBrWXFYM0FTUW95?=
 =?utf-8?B?ZUkybU1zK093ZVh0N0FuSGx0RHY3dElWWUxrOWlzcUpiR0RwVW1wckVOdWgw?=
 =?utf-8?B?cGdzbjgybnFkekNNdGd4Z0QreHNhWmxhMzFGSVdLTHBqRFRrT1VOUTlSZmo3?=
 =?utf-8?B?Ulo2ZGROOEg5QjYrSGV3aXpGNFdLQWdzVU85ZWJQTncxTzBNMHRrdUYrK05J?=
 =?utf-8?B?MXIyREpxcGIrSFFwK3VTWHFTQ2lwVmRLZmlzZisxZE9SQWE1MER1RFoyOVlV?=
 =?utf-8?B?aVN1VUN1VFZVdVJCOFNnQ1BJWG0zN2pzbEhDYXdmUi8rSnU3VkRlN0liZDV1?=
 =?utf-8?B?Uk1vai93QmdBV2RkQnIxdHh0ZHpmcjJ2aGpZaTJOc3ZnR3ZlbVM2QmRvL0lt?=
 =?utf-8?B?MnlEcFYra3FVRU1HZXFnZlBCeW4rVVQ3ZEQvVjYxWmFNY2doOFhTTUc0QzRB?=
 =?utf-8?B?YzdOVmkzeU0xQXRtQnpkclU1emVhb2dqNGo3SVhYNjIrVGJQYVpPYVRudTA0?=
 =?utf-8?B?ejBmaEcyTjhScDJEVEtlZmwwa045T1U1WFNtV1JkbGRIQ2k3V1psMlVFeUxX?=
 =?utf-8?Q?yRt9yuakRe7Ldb4QVULRxRXWNW1wJuuR?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RlVkQzljcVlXZElqbXdxUm5YaVhDY1p5UW91V1BscmNwUzRyZk5vWU9jUk5Q?=
 =?utf-8?B?eVRqbjlob3ZrR2prdVVIbmNBYXByNXRkTXBjT1JOZ2tFTUtlUTlOZzAyNURz?=
 =?utf-8?B?eFlEVmNLZnU4ZXYrcVQ4ZHI1Nk1Nc3VJaEREOE8vZkdveVFwZ3J4bHppS0dF?=
 =?utf-8?B?THhXRnU1QkcwR3Nobzl5dWZQTlFrQW56NXBGQTM4VmdNVTBaNU9rUGNQZk92?=
 =?utf-8?B?c3FJL0F4cGI3ZGV1VVVqOGIvamlnM3QyYWtJcnlLYmFTOTE2TGw4bk8vZy9q?=
 =?utf-8?B?aVBFYnkxaTgvQUMyUDJ0UXJ6aWlUOVhGeE1YMC8wOS9RMFJXZmZSYUZQRlQ5?=
 =?utf-8?B?eUh4cm5vMmpCZklYakQ0UlQwTGZ3UGxPdG9sSUg0alpsVk1PYlF5MXkrNTRQ?=
 =?utf-8?B?TGZJQ1NOWGVraWRJSDR3TVVmeXZwaUsyLyt5eEVyem9ETUsxV21UMm9KeTJa?=
 =?utf-8?B?bEVtWlZVTjYxVThDZEx0eUdWOWxpSUJ2cW5mUjRqc3A2SXh5WnB6bUQrR3hV?=
 =?utf-8?B?V3hGRmVrNldoY0VadlFicncrWGJmUVpIYzFLRFJtZURSMWhYYm81UFU3NGZ5?=
 =?utf-8?B?OUMvWnFLQm43SW03cE5xaFhaNHJ3dkJnM0d0Tk1XZzRDNkcxMndDSXY3OUdv?=
 =?utf-8?B?eC9UVWlnUUVZWnoxTFQ1VVF0TG1tWE5hSmdtNDFNQkwva3E4RUVYMkpCNVcw?=
 =?utf-8?B?MVlXVENEdDJDNEtCTmh1WVZBOXlONm1FVDY4NHhYc1hlWFB6c1NSdkpwVyt3?=
 =?utf-8?B?MEJaM0piUmttSk5XTlpLUUZvdy9LZjVBNHI2VHlvMkhaMENGcUEwNjYwcVpO?=
 =?utf-8?B?TUZlMkJWdGM5MXphNytZbUZiTlVtMDNVSU9yWmRlVzdNdklGZUpsaFN0bmw4?=
 =?utf-8?B?S3hRVjZyN2N5YUtNZENYbFlCNmoyOTRsVG1LL1FVR0lVSDd4Q1p2QXZlVHZr?=
 =?utf-8?B?eGU1MFAzWEdUUm1DeXdjOFRCZ1lZUUlMVXk5amRXeFZ4N0FlRlk5VFdkdHlk?=
 =?utf-8?B?Z3pxZk80Rkdkb2hEKy9YNzEwVW10ZUNjcjh5a2pYSm41eDRsSCtLRUw1bkgw?=
 =?utf-8?B?SXNIVS90TEhMYzRST0pzLzVNZ1UxeDR3Z3VuWHNWOERuR3JrLzBMVndSdEps?=
 =?utf-8?B?WGtudlJMN3FhZ1VUb0N4MUEvN2tJMlJQdlVsZURJWlFROTlQUXFJQ1gxTXEr?=
 =?utf-8?B?MWVldlhTT2szL2J6dDNycjJoMkk0bnVCRk1NODZDWW5Sd0I4QlVMYTJDbkpW?=
 =?utf-8?B?V21kWFlJcGxxZERPTkhJcElteElwSk9nbTlic1NPZXEyOUp2UXd1OWo2V3hP?=
 =?utf-8?B?TzA1WGZ2ZUlmbmh6SHRHTTJxY1cvV3VLd2lVN0FxQW5zK1VYcHJmeEhxN2dG?=
 =?utf-8?B?c2Y1ZTRJdHY0VldsRGhaWUtuY2tJU3BWbDE4VS9sR3kwMlFHdDJuNFI5dWR4?=
 =?utf-8?B?NWZCandOdjJXVDhjaFNLL2I2T1JzSHI3WG5aQkNMdUlPZjlXaWErMXZwUmRh?=
 =?utf-8?B?VWtNNzlpQXdETG5KaUV1M3ozYy9UbS84cEVnWnZ6T010dzdLaXlkUlRYNnR0?=
 =?utf-8?B?SzdzNzl5WkpDOE1NOG10U0ZVRS9UNUxwdXdHdEFtdWZ2UnBJNDBRbi9aWnlP?=
 =?utf-8?B?bmFFdVNyUWNxbzJiYXdzZnJuYkJQRkE2THl0ZGVjb2l5Y1pOTzhwY1RZcE1X?=
 =?utf-8?B?TS90Sk9LR0Z6T0RaMkNaRXBaNFU3TDd2aEVwUmRhVlVMOE9RTGJ5TDFYQ1E4?=
 =?utf-8?B?eWNrZlNpVkxUUnRiN2N3UjdHZk50UEQwQUF2S3pNS3psTTNYenl3OXJKYU85?=
 =?utf-8?B?cDBFV1ZKZ1c3aCtlaktmZStWTmo3VFNyTmlNQjdFaEVKdkNXdy8rL1Z2ZUZJ?=
 =?utf-8?B?R2lCT0h3OFBUQXprb2JGdjNSUGhxUFZSOUVpN3hpUDBWVXNRdzFBU1IyT2NG?=
 =?utf-8?B?aXVRcHlOU2tyaHBVeGpyd0RpaVk5ZFE2SWl3THloUXNFTG12eFNUU0xXeHFh?=
 =?utf-8?B?bHZFVnJpMmxqNTVjV3hZV3dSUDM5TDE2c0h2SzQvNWlQNlFvSFFEK3ZtRnJs?=
 =?utf-8?B?c1RHdi9XaGpTd3BFSnBKaGxvTm13MHRsaFlhUHA0azJ6K1JzcWZYeFFJUWE0?=
 =?utf-8?B?bk9aVkl3RDFoQmlCWmlqYzA2cU15SHVOYnEvVzFyOFA2UGtaYTFDNGtxUGJ6?=
 =?utf-8?B?Mmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bfbc06af-bc1a-4d3a-7ab8-08de2136a3c9
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 15:26:09.6159 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NS5QfmIMDgQCImT8jjVho/hbDO9OzSGLE5c8BhAmYvPOjKg12UzDpStVKVOC4spA8b4dOSHsvEk/4ZrDztQF5fAxhwFQxT8EQwbqLhH9TYI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6757
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



On 11/7/2025 3:10 PM, Satyanarayana K V P wrote:
> VF migration sends a marker to the GUC before resource fixups begin,
> and repeats the marker with the RESFIX_DONE notification. This prevents
> the GUC from submitting jobs during double migration events.
> 
> To reliably test double migration, a second migration must be triggered
> while fixups from the first migration are still in progress. Since fixups
> complete quickly, reproducing this scenario is difficult. Introduce
> debugfs controls to add delays in the post-fixup phase, creating a
> deterministic window for subsequent migrations.
> 
> New debugfs entries:
>   /sys/kernel/debug/dri/<card>/
>   ├── gt0
>   │   ├── vf
>   │   │   ├── resfix_start_delay_ms
> 
> - resfix_start_delay_ms: delay after sending RESFIX_START marker
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Tomasz Lis <tomasz.lis@intel.com>
> 
> ---
> V2 -> V3:
> - New commit
> 
> V1 -> V2:
> - None.
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c         | 13 +++++++++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.c |  5 +++++
>  drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h   |  8 ++++++++
>  3 files changed, 26 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index 17f06cd63527..6443997a1408 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -5,6 +5,7 @@
>  
>  #include <linux/bitfield.h>
>  #include <linux/bsearch.h>
> +#include <linux/delay.h>
>  
>  #include <drm/drm_managed.h>
>  #include <drm/drm_print.h>
> @@ -1278,6 +1279,16 @@ static u16 vf_post_migration_resfix_start_marker(struct xe_gt *gt)
>  	return ++gt->sriov.vf.migration.resfix_marker;
>  }
>  
> +static inline void vf_post_migration_inject_delay(struct xe_gt *gt)
> +{
> +	ulong delay_ms = gt->sriov.vf.migration.debug.resfix_start_delay_ms;
> +
> +	if (delay_ms && vf_resfix_start_marker_supported(gt)) {

drop vf_resfix_start_marker_supported(), it should be always true

> +		xe_gt_sriov_dbg(gt, "Post migration delayed %lu msec", delay_ms);

	"*TESTING* injecting %lu ms delay ...\n"
or
	"*TESTING* sleeping for %lu ms ...\n"


> +		msleep(delay_ms);
> +	}
> +}
> +
>  static void vf_post_migration_recovery(struct xe_gt *gt)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
> @@ -1315,6 +1326,8 @@ static void vf_post_migration_recovery(struct xe_gt *gt)
>  	if (err)
>  		goto fail;
>  
> +	vf_post_migration_inject_delay(gt);

maybe we should inject delays also at other points:

* before sending a START
* before calling vf_post_migration_fixups
* before calling vf_post_migration_rearm (this patch)
* just before sending DONE

> +
>  	vf_post_migration_rearm(gt);
>  
>  	err = vf_post_migration_notify_resfix_done(gt, marker);
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.c
> index 2ed5b6780d30..2928c65afd15 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.c
> @@ -69,4 +69,9 @@ void xe_gt_sriov_vf_debugfs_register(struct xe_gt *gt, struct dentry *root)
>  	vfdentry->d_inode->i_private = gt;
>  
>  	drm_debugfs_create_files(vf_info, ARRAY_SIZE(vf_info), vfdentry, minor);
> +
> +	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG)) {

do we plan to have double-migration tests in official CI?

if this is only for internal testing, then maybe CONFIG_DRM_XE_DEBUG_SRIOV is more appropriate?

> +		debugfs_create_ulong("resfix_start_delay_ms", 0600, root,

"resfix_delay_ms" ?


> +				     &gt->sriov.vf.migration.debug.resfix_start_delay_ms);
> +	}
>  }
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> index 5707bb808d80..9f4a51cbe38e 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> @@ -52,6 +52,14 @@ struct xe_gt_sriov_vf_migration {
>  	wait_queue_head_t wq;
>  	/** @scratch: Scratch memory for VF recovery */
>  	void *scratch;
> +	/** @debug: Debug hooks for delaying migration */
> +	struct {
> +		/**
> +		 * @debug.resfix_start_delay_ms: Delay in msec
> +		 * after RESFIX_START marker is sent to GUC.

as this is sent _after_ the START, having "start" in the name/comment is questionable 

> +		 */
> +		ulong resfix_start_delay_ms;
> +	} debug;
>  	/**
>  	 * @resfix_marker: Marker sent to Guc prior to starting the
>  	 * post‑migration.

