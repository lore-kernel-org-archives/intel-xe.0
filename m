Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F946C0218F
	for <intel-xe@archiver.kernel.org>; Fri, 31 Jan 2025 23:54:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C5D410E1FF;
	Fri, 31 Jan 2025 23:54:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aC+BtOSp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C050D10E1FF
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Jan 2025 23:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738367640; x=1769903640;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=55vUeIplW/aCYhlvzgvCCN8eq2coaeR+66sZHsmsm4Y=;
 b=aC+BtOSpK+XLzQNp1ia5gJHXXLAwrr8BYkI4vnvKs6oi2z05iRzakIsD
 C+9JS9NcPw9oIxVcyaDR5oW1UE/CA5JYa7hAq1JR47hPJW4laExwY/u8r
 7tjXLbCruBM95eBnUZU/HDAw1hyUYhG0j10DAJaaVjLFldQUgMNyrhYo6
 coPGa49CoNKkqWcIgPiYOEc/5U3kAwHmW+eVG5LnZdFTFaRx7mueSyvaw
 MI6KFbJVHS3J5HSGDa5atnNl1ismb0Vu/FmoWtu4IltzaS+FPIm7VjZGH
 4oWslTIGS2U/ouriigPI7XaDd0ZHxrp/XadjKLzXccAlncvehVsaJPRwl A==;
X-CSE-ConnectionGUID: CckMMBwgTfmj6Uexz2L8Ug==
X-CSE-MsgGUID: 9KphW1rgRbadNZmIkmeYyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="50363800"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="50363800"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2025 15:54:00 -0800
X-CSE-ConnectionGUID: ovxP6L0XQ7Cr4sIYSZQVag==
X-CSE-MsgGUID: hUcQr2FsQe+LlLhqmdJw8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="133017050"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Jan 2025 15:53:59 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 31 Jan 2025 15:53:58 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 31 Jan 2025 15:53:58 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 31 Jan 2025 15:53:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RUz3GJlC/cJrBg5TQLTXgGAWPKmoTnDqKyFGL5BFufJdtbAigzZP2rdZVGFchNBO0RbXEwlb9jSzTW2Olny2tFKbmbK3uPWWlFyk2Czy7VvambpEfsS4UIfK5d5r6652nWYx1m5mkd1oiVIK+SkbSkNKy+xycqjQzhndRTH907VFRhu1MTHeYNL5MtDr1R69BBsvGYboMMDcv1pexten16WXfTlBnWfHi1a3x+0wAm/swuwJQnRddDrYoQaIQp3axFZ2748orkpjAdK0Ryn8ut7iX+4l859Qd1pXRFd6gAK9T7GKWeyabtwB+KYBxLQWmgzxGd/wuRfUOB4dTvQlCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b7dWPo9uahhfyQ1sdo1woWT5Sb6q1P1MSPKLvOUUp/4=;
 b=Ul0hI1ZFcpuoXhl5tMR0rh8KjqgthfSDeeZ/Dpg0uvoz8O+sV8fQzk3NnLOGCJb42xoqKPhisUB00ZQrc7gvXV8e4v4RHGpoc7bCFXUnGstU1r88VULfg57B1XznkNHuCV6Zpdn20WTthjsqIRQszTx4D7R6Joc08oJChtMi2Hf5c5QOAdb3B0xr449SZjUfC214FBkkcvK6vEkpsZ6WivXmWbbAQglBKrj7bGwkBbfpjhOvw5gJ8auhNf2h8Y654earjHLJKl7XZFBgzLNSuvdXMngVvXqd5Tp7a7nzimpe58LhBDB5Kuxa77o/ypzU9WsM9YOfKs5tIQNkzaxOZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by DS7PR11MB8825.namprd11.prod.outlook.com (2603:10b6:8:255::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.22; Fri, 31 Jan
 2025 23:52:24 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%3]) with mapi id 15.20.8398.018; Fri, 31 Jan 2025
 23:52:24 +0000
Date: Fri, 31 Jan 2025 15:52:11 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <lucas.demarchi@intel.com>, <vinay.belgaumkar@intel.com>,
 <soham.purkait@intel.com>
Subject: Re: [PATCH v4 6/8] drm/xe: Add support for per-function engine
 activity
Message-ID: <Z51iK9NZ6YDi4YTb@orsosgc001>
References: <20250129101653.1976699-1-riana.tauro@intel.com>
 <20250129101653.1976699-7-riana.tauro@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250129101653.1976699-7-riana.tauro@intel.com>
X-ClientProxiedBy: MW4PR04CA0084.namprd04.prod.outlook.com
 (2603:10b6:303:6b::29) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|DS7PR11MB8825:EE_
X-MS-Office365-Filtering-Correlation-Id: 4834886c-b6d4-4473-46d5-08dd42524efd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T1M0WXM1NEdPZkZWS2dnZ3BVQmlYbVRaQkF3MlQ1bTlXOEhZTXdrNnE1TzNR?=
 =?utf-8?B?S1hxUVRuekIxT0hOYjNOS2xsYmFQd3lUSStqS2ltWDFyeTU5eHFZUHNoU1BN?=
 =?utf-8?B?T0NNNE1xZXFPeHpGeml1eHlhTzNYWHhGcFMzV2tVUHJkcmJsZHRLSWlTbTlJ?=
 =?utf-8?B?L3F6Tjl4RVUvV2hlVGRnSVhDRDIwOTlUVmxnWnV0Tjh5N2ZMUUVWTnE1cVlQ?=
 =?utf-8?B?bk02M2R2YjA5RkFzYlZDYUNhMlAzWlJraVNhcXZWRWlqNElBdjR0Y0ZPMmEx?=
 =?utf-8?B?U0FnS1gxNUVqQVhsSU9rUE1yZVI4RkRrNWJwaFhvSWRyU05PVmZnWXJUTnpa?=
 =?utf-8?B?U3h2aDNKTjlCV3dIMTdlZ1Z5aVFKRmxlMXVxL281SkFBVExjUTVZT3ZISGEr?=
 =?utf-8?B?aXJtZ0U4ekx5ZXVvcm42a1ZDNnhnajJpVG1lcFZoaVRCZXhRTk1uUGE2RHRR?=
 =?utf-8?B?WnNWMHdvNGpHT0hHS0tOZllWR3RXMCt0R1VXd1hWZjN5NDBEWE0wbTlrREEw?=
 =?utf-8?B?MnZnOVprMGJLNmM4NW4raS9od1N5VzhQY3h3am8vRStGdkdtTi9Hemt6Sjd0?=
 =?utf-8?B?OGNpQXFnMlhyekVGQlNjeEdTYnJBVjBFRlNoRFBPbDkyVG5DYkdHZTRtK3hI?=
 =?utf-8?B?SHFLMjF1c2xQTU9vcG9mQXNjRG52c3hlaWluVVY3QVp0eEh5eEljMlZlczJi?=
 =?utf-8?B?SmhIVEIyY1NKRFRMYmx4OHRUaGFoRWpRQ1N2bU13OHJRWStvVkxyd1lhQk1S?=
 =?utf-8?B?aGI1MTVDOXVIRk5ucjEwK01uVFRsWW8ra1ZrUFcyTmVtTGREQjZUMVFjZkxQ?=
 =?utf-8?B?a2N5VkIxSC9HTEtmOUo3V3VNenZIaTIrM1J5NVV3V0VtRnY2ZThhSnNPQTdk?=
 =?utf-8?B?RXJkdzJma2xDaE1RNXhqT2xDbERZMWpCeUN4ZjM0UHZ2dUJ6ZVZDUlJSS0h3?=
 =?utf-8?B?WkV5VGNlSnhPMUx2WDA3aHJyL08zZE5tY3VBMnN3bHBjQjNqSklYL240VEdG?=
 =?utf-8?B?MnBDei83bmh3R1RlK1Ixc0J0SUJkNUpwOW1JcFhqOGFUQjlEMXdSNXpiVWxw?=
 =?utf-8?B?Y2tOcEtSOWFrSXFJSVJIanp4Z1NJSVRYRHhYcytvdGI1ZElKUzk5cjRVRGZC?=
 =?utf-8?B?Uk9scWRGOHM3SjVIS2dNSk8vYVJmYUpFbDByZTBuVUJ1SWdwQlZUQUVudTRJ?=
 =?utf-8?B?VkloSjVlVzBReXhsc3Nsbi8vSHBtNlFtLzZlT2M0UkpDMTFuT0NTVjQxeUFl?=
 =?utf-8?B?SjdsL3VLTjNMWEMxRDNBcjBPN3lBbXJVTnh3TVFRR3F3ZUplcmY3TVQ3Q0ZZ?=
 =?utf-8?B?ekxVMkFLVFZGRjJ4N0t5T3A0bTJvTEIxQXlmQkpMMFBQWjZBMjc4RUJMbmFu?=
 =?utf-8?B?M3prd3c5VTZuaEhwamMwbkJCemJqNE0xc1phVVQvUTNMYktKQ2ZJajNlRktr?=
 =?utf-8?B?TWUzeUhrK2xmQkQ1VW1paUFrQVhlcDJwenl4KytLeU95ZGRQWm9Kd1IyVTBN?=
 =?utf-8?B?citqdDFXMXlaZk1RckU5Ri9KcU1QRXVBK0JHcWQ1NUpjblQwQXB1V3MvR3gr?=
 =?utf-8?B?TnZKdGk2bm9TaUdjOU5pcnZpS0xKSE1TTEp4M3BHaC9mZnRhRjNGNUxzNkQ3?=
 =?utf-8?B?b3ZoYndiT3lPanpMditTLzNkTGcvQ25PQVlCNVRWcDdxMFRTekVHOEl2OXhG?=
 =?utf-8?B?eGFpTFJuRW9iWm9TRnNmWnNQSitreHBleUFNeGZBaklZRHlsYWZ2Ky8zUnhY?=
 =?utf-8?B?SmtyQ28yMnZwQjd2UmlLOWRkTjEyeGpNVXBodTIyNE5vbUlWd1lPMlp2bkpn?=
 =?utf-8?B?VkNqREorN1BBY2g3ZnV2RTBqRHFlRC8zWXJtZHNLZURnMEc4emxIYU1QV29D?=
 =?utf-8?Q?DRj21kd+ZFZu4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OTJjZDVPL2FrbDlHc0l6QVBkSisvN0xRRUl2amVGZDNYRkxJRWVZWlJranUw?=
 =?utf-8?B?RHVHQjZqM0NnVUxCVWxXTFdCL1JlM2FIQW9GUWRsNUxxVWt5UlpvcFhYdEZv?=
 =?utf-8?B?M0JMbmNYaldRSnh4b3QyY2l3b09ZM0hya3hzaTZjMlFmL3phVXJKUjZ0R2h5?=
 =?utf-8?B?UXI4Nmx2ZUVac3FOdUVQVUx3TmEwaFFJTVBONDE2bjdhTWYyaVZRVXgvM3Bq?=
 =?utf-8?B?YWFqcXZScElsY0hjMTQ5VkN0NUs2ZlJYVk9nRGkyenRJMVorR3h6eWlzelZH?=
 =?utf-8?B?U3FYUitXUG0rWHlYeDh0Mkp4Znl5amdKa2krTFFncXhTTGFRWituTjlYOU1p?=
 =?utf-8?B?cHFadU5SZ1k2TVR6TnduSWxIWWZ4Q2Y1OVpPSjl2Z0d4bDhheUtGOVdENUJx?=
 =?utf-8?B?d1g3ODZEL1pFTy9rbldvVnVFYk1la0JjMVQ2bld1b3lINkk4NE1vNXAxSStl?=
 =?utf-8?B?UGxIRWpNajkvTUdwZDRnQTQrUDBwWnAycktYZ1dJOFgzc05DV3lkaU5CalNZ?=
 =?utf-8?B?ZVR6UHlqSVE0eG45ZnBLcFltL1FheHA3dnBUdTJLcTB1UFpLS3diZzRSbkoz?=
 =?utf-8?B?Q01lZUQvNnhaVDI0TWpKWm52YWp3MDBmbGYwMEhHYVBhZFBGaUVxNy9td1h4?=
 =?utf-8?B?M2J1c2RjMnJjaldDcUZablBsTXM4NU41STdUeHRGUWRtK1h1bDVrcHQvbmZR?=
 =?utf-8?B?OXBmMnBaVmlFc2xTaStFOHByd3hpeXBqdmxUcVVCNldSakhWUDR2QXB3b0Yv?=
 =?utf-8?B?OVZWM0JONldwVE5YVzMwT3I0RnQ3U3cyZ1FkTGRnU3p6VUhlbjZxOUlWRG1j?=
 =?utf-8?B?WnhLRVZxSHRZaXRkOHV1dVg5bVpkVnBCdExtOTkwUFFLelY1YUczaC82RFEv?=
 =?utf-8?B?TVpDNmRZb1M4VkR1cHlMc3RpeGVJSTB5OU04bU51Y1FIKzhWbTRCcndYdUx3?=
 =?utf-8?B?NGZQNCt3MThkRlJ1Z3g3WlowZUxldkNGYnFGMjdFYms1Z2N2OFhyekZtMGNM?=
 =?utf-8?B?QllDblFHYkNpNGlKZ2d3YWhZaEJaKzJqL1hPNFB2dmZJcW9ENDFDNE83SXZW?=
 =?utf-8?B?V3VYQWtwTjRoMUVXQWNQVHNITWFXamxERWRPS2w1Wmt1M1ZaS0RCOGFBbmNH?=
 =?utf-8?B?RkdGaW1nTG53dTBKeFZlRFVLOFlZVWtETTZMWVFZckYzTklTNEc1SUJDYUJV?=
 =?utf-8?B?K2JHWkt6NVJpSE0zYy9EdnhXMGdjK0ZvVm0xblFPcVFzbUZSTEtLWHdoRHVj?=
 =?utf-8?B?aWJLNFBFckYxQ2xaYmRtV0ZWOTMwUHlCTjN0MDcyeTFUWmpTRlF3V1RSMUZP?=
 =?utf-8?B?dExnNFRpV2dsblVMSEhETHJwNjMwejh2NDVGRnNnTkpUOHhscDk5aUpBZDls?=
 =?utf-8?B?T1d4b1RsRDd6WHJxTnFJdjgwMFoyN0wvNXh1YThHUWFRRDN0ZjQ2K0JvMnE3?=
 =?utf-8?B?eXlLVVc4bGIzRlk1RlkvYWdsOW1GRFlDczBYL0xWYkszcFNPa0liODFIcnN4?=
 =?utf-8?B?cEtlNnY0L3l1NU03Y09VSXN6RWpIcmtCVzJGUzBodmMxVURETDB0b2xtZlk3?=
 =?utf-8?B?L2JXL2pQcWxxeVl2ek5XYmQwZ0FzZGt0RG51MWFxb3g2Sm9rQTBGdCsyanpw?=
 =?utf-8?B?TGpEYmFVNkIzTEV1OElUaUxXbVJCYS9wTWs1YWFhR2pCV01QZWZpeWtuTjhw?=
 =?utf-8?B?TWUydXdFN1NiV1ZnY1N4YVY0dHRvNEhndDhudkFGa0licktIQzFXTTk0dHBW?=
 =?utf-8?B?YTZqV3lPMmV0MFdsUVRRZGMySlZZbDZrV0cyUysvQlE3VlhWelAyK2VFSGRl?=
 =?utf-8?B?R00ya0pra2VpL0tudS81amY5UC81WDE3SUpmUXZiMXRyaTVNRXVzYVpuVmJF?=
 =?utf-8?B?clREOWR4NFdFc0JJZ2RGQmhKUW5SbmtUMlhWSGU0Lyt2cFcwL0gyN3RLcllJ?=
 =?utf-8?B?aVdSSmVpRmlrakEyMjBtYUU0YUNsQ2l6cjFRQVE2Mno2aVVuTlgyVm9WWHFq?=
 =?utf-8?B?Y0RGTHZOWW4zbzR2QmhNeC9XTzVSbzNmMm5Sa3cxdVJqRGRwUU1tSThPZ0dz?=
 =?utf-8?B?aGlOVHltN3liUTlSOWlFbjFXdGF2amJTVGg3ejdxTzJBMEdReFNnd0V5bnlk?=
 =?utf-8?B?bjRvL1BCYUtVcVBRa1Z4S0plSWE2U25OZ0JJd1RoRkcrUXBueFFGRjdJV0VO?=
 =?utf-8?Q?5zNb43jp7gkF3P08lY7eY6Q=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4834886c-b6d4-4473-46d5-08dd42524efd
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 23:52:23.8881 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RJ+jf+/FcWjG14h3eQDC7HZKEnaYYmmR2PwlkSqEAPpv3kqi7lqHLZQvenl1XFYtgEsT6k4y+xExwrBmi9tIw29eRlUqhabgy6YIGUx/1mA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB8825
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

On Wed, Jan 29, 2025 at 03:46:49PM +0530, Riana Tauro wrote:
>Add support for function level per-engine-class activity stats.
>This is enabled when sriov_numvfs is set and disabled when vf's
>are disabled.
>
>Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>---
> drivers/gpu/drm/xe/abi/guc_actions_abi.h      |   1 +
> drivers/gpu/drm/xe/xe_guc_engine_activity.c   | 200 +++++++++++++++---
> drivers/gpu/drm/xe/xe_guc_engine_activity.h   |   5 +-
> .../gpu/drm/xe/xe_guc_engine_activity_types.h |   8 +-
> drivers/gpu/drm/xe/xe_pmu.c                   |   4 +-
> 5 files changed, 186 insertions(+), 32 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>index ec516e838ee8..448afb86e05c 100644
>--- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>+++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>@@ -141,6 +141,7 @@ enum xe_guc_action {
> 	XE_GUC_ACTION_CLIENT_SOFT_RESET = 0x5507,
> 	XE_GUC_ACTION_SET_ENG_UTIL_BUFF = 0x550A,
> 	XE_GUC_ACTION_SET_DEVICE_ENGINE_ACTIVITY_BUFFER = 0x550C,
>+	XE_GUC_ACTION_SET_FUNCTION_ENGINE_ACTIVITY_BUFFER = 0x550D,
> 	XE_GUC_ACTION_NOTIFY_MEMORY_CAT_ERROR = 0x6000,
> 	XE_GUC_ACTION_REPORT_PAGE_FAULT_REQ_DESC = 0x6002,
> 	XE_GUC_ACTION_PAGE_FAULT_RES_DESC = 0x6003,
>diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity.c b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
>index 4d720afd12ac..0ab716a58d5c 100644
>--- a/drivers/gpu/drm/xe/xe_guc_engine_activity.c
>+++ b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
>@@ -15,35 +15,61 @@
> #include "xe_hw_engine.h"
> #include "xe_map.h"
> #include "xe_mmio.h"
>+#include "xe_sriov_pf_helpers.h"
> #include "xe_trace_guc.h"
>
> #define TOTAL_QUANTA 0x8000
>
>-static struct iosys_map engine_activity_map(struct xe_guc *guc, struct xe_hw_engine *hwe)
>+static struct iosys_map engine_activity_map(struct xe_guc *guc, struct xe_hw_engine *hwe,
>+					    unsigned int index)
> {
> 	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
> 	struct engine_activity_buffer *buffer = &engine_activity->device_buffer;
You can drop the initialization here since it is being set below.

> 	u16 guc_class = xe_engine_class_to_guc_class(hwe->class);
> 	size_t offset = 0;
For readability, you could set offset = 0 in the else part instead of 
here.
>
>-	offset = offsetof(struct guc_engine_activity_data,
>+	if (index) {
>+		buffer = &engine_activity->function_buffer;
>+		offset = sizeof(struct guc_engine_activity_data) * (index - 1);
>+	} else {
>+		buffer = &engine_activity->device_buffer;
>+	}
>+
>+	offset += offsetof(struct guc_engine_activity_data,
> 			  engine_activity[guc_class][hwe->logical_instance]);
>
> 	return IOSYS_MAP_INIT_OFFSET(&buffer->activity_bo->vmap, offset);
> }
>
>-static struct iosys_map engine_metadata_map(struct xe_guc *guc)
>+static struct iosys_map engine_metadata_map(struct xe_guc *guc,
>+					    unsigned int index)
> {
> 	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
>-	struct engine_activity_buffer *buffer = &engine_activity->device_buffer;
>+	struct engine_activity_buffer *buffer;
>+	size_t offset = 0;
Same here ^

>+
>+	if (index) {
>+		buffer = &engine_activity->function_buffer;
>+		offset = sizeof(struct guc_engine_activity_metadata) * (index - 1);
>+	} else {
>+		buffer = &engine_activity->device_buffer;
>+	}
>
>-	return buffer->metadata_bo->vmap;
>+	return IOSYS_MAP_INIT_OFFSET(&buffer->metadata_bo->vmap, offset);
> }
>
> static int allocate_engine_activity_group(struct xe_guc *guc)
> {
> 	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
>-	u32 num_activity_group = 1;
>+	struct xe_device *xe = guc_to_xe(guc);
>+	u32 num_activity_group;
>+
>+	/*
>+	 * Two additional activity groups are allocated one for global
>+	 * and one for PF engine activity when SRIOV is enabled
>+	 */
>+	num_activity_group = IS_SRIOV_PF(xe) ? xe_sriov_pf_get_totalvfs(xe) + 2 : 1;
>+
>
> 	engine_activity->eag = kmalloc_array(num_activity_group,
> 					     sizeof(struct engine_activity_group),
>@@ -59,10 +85,11 @@ static int allocate_engine_activity_group(struct xe_guc *guc)
> }
>
> static int allocate_engine_activity_buffers(struct xe_guc *guc,
>-					    struct engine_activity_buffer *buffer)
>+					    struct engine_activity_buffer *buffer,
>+					    int count)
> {
>-	u32 metadata_size = sizeof(struct guc_engine_activity_metadata);
>-	u32 size = sizeof(struct guc_engine_activity_data);
>+	u32 metadata_size = sizeof(struct guc_engine_activity_metadata) * count;
>+	u32 size = sizeof(struct guc_engine_activity_data) * count;
> 	struct xe_gt *gt = guc_to_gt(guc);
> 	struct xe_tile *tile = gt_to_tile(gt);
> 	struct xe_bo *bo, *metadata_bo;
>@@ -89,10 +116,17 @@ static int allocate_engine_activity_buffers(struct xe_guc *guc,
> 	return 0;
> }
>
>-static struct engine_activity *hw_engine_to_engine_activity(struct xe_hw_engine *hwe)
>+static void free_engine_activity_buffers(struct engine_activity_buffer *buffer)
>+{
>+	xe_bo_unpin_map_no_vm(buffer->metadata_bo);
+	xe_bo_unpin_map_no_vm(buffer->activity_bo);
>+}
>+
>+static struct engine_activity *hw_engine_to_engine_activity(struct xe_hw_engine *hwe,
>+							    unsigned int index)
> {
> 	struct xe_guc *guc = &hwe->gt->uc.guc;
>-	struct engine_activity_group *eag = &guc->engine_activity.eag[0];
>+	struct engine_activity_group *eag = &guc->engine_activity.eag[index];
> 	u16 guc_class = xe_engine_class_to_guc_class(hwe->class);
>
> 	return &eag->engine[guc_class][hwe->logical_instance];
>@@ -109,9 +143,10 @@ static u64 cpu_ns_to_guc_tsc_tick(ktime_t ns, u32 freq)
> #define read_metadata_record(xe_, map_, field_) \
> 	xe_map_rd_field(xe_, map_, 0, struct guc_engine_activity_metadata, field_)
>
>-static u64 get_engine_active_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe)
>+static u64 get_engine_active_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe,
>+				   unsigned int index)
> {
>-	struct engine_activity *ea = hw_engine_to_engine_activity(hwe);
>+	struct engine_activity *ea = hw_engine_to_engine_activity(hwe, index);
> 	struct guc_engine_activity *cached_activity = &ea->activity;
> 	struct guc_engine_activity_metadata *cached_metadata = &ea->metadata;
> 	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
>@@ -122,8 +157,8 @@ static u64 get_engine_active_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe)
> 	u64 active_ticks, gpm_ts;
> 	u16 change_num;
>
>-	activity_map = engine_activity_map(guc, hwe);
>-	metadata_map = engine_metadata_map(guc);
>+	activity_map = engine_activity_map(guc, hwe, index);
>+	metadata_map = engine_metadata_map(guc, index);
> 	global_change_num = read_metadata_record(xe, &metadata_map, global_change_num);
>
> 	/* GuC has not initialized activity data yet, return 0 */
>@@ -166,9 +201,9 @@ static u64 get_engine_active_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe)
> 	return ea->total + ea->active;
> }
>
>-static u64 get_engine_total_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe)
>+static u64 get_engine_total_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe, unsigned int index)
> {
>-	struct engine_activity *ea = hw_engine_to_engine_activity(hwe);
>+	struct engine_activity *ea = hw_engine_to_engine_activity(hwe, index);
> 	struct guc_engine_activity_metadata *cached_metadata = &ea->metadata;
> 	struct guc_engine_activity *cached_activity = &ea->activity;
> 	struct iosys_map activity_map, metadata_map;
>@@ -177,8 +212,8 @@ static u64 get_engine_total_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe)
> 	u64 numerator;
> 	u16 quanta_ratio;
>
>-	activity_map = engine_activity_map(guc, hwe);
>-	metadata_map = engine_metadata_map(guc);
>+	activity_map = engine_activity_map(guc, hwe, index);
>+	metadata_map = engine_metadata_map(guc, index);
>
> 	if (!cached_metadata->guc_tsc_frequency_hz)
> 		cached_metadata->guc_tsc_frequency_hz = read_metadata_record(xe, &metadata_map,
>@@ -220,10 +255,35 @@ static int enable_engine_activity_stats(struct xe_guc *guc)
> 	return xe_guc_ct_send_block(&guc->ct, action, ARRAY_SIZE(action));
> }
>
>-static void engine_activity_set_cpu_ts(struct xe_guc *guc)
>+static int enable_function_engine_activity_stats(struct xe_guc *guc, bool enable)
> {
> 	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
>-	struct engine_activity_group *eag = &engine_activity->eag[0];
>+	u32 metadata_ggtt_addr = 0, ggtt_addr = 0, num_functions = 0;
>+	struct engine_activity_buffer *buffer = &engine_activity->function_buffer;
>+	u32 action[6];
>+	int len = 0;
>+
>+	if (enable) {
>+		metadata_ggtt_addr = xe_bo_ggtt_addr(buffer->metadata_bo);
>+		ggtt_addr = xe_bo_ggtt_addr(buffer->activity_bo);
>+		num_functions = engine_activity->num_functions;
>+	}
>+
>+	action[len++] = XE_GUC_ACTION_SET_FUNCTION_ENGINE_ACTIVITY_BUFFER;
>+	action[len++] = num_functions;
>+	action[len++] = metadata_ggtt_addr;
>+	action[len++] = 0;
>+	action[len++] = ggtt_addr;
>+	action[len++] = 0;
>+
>+	/* Blocking here to ensure the buffers are ready before reading them */
>+	return xe_guc_ct_send_block(&guc->ct, action, ARRAY_SIZE(action));
>+}
>+
>+static void engine_activity_set_cpu_ts(struct xe_guc *guc, unsigned int index)
>+{
>+	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
>+	struct engine_activity_group *eag = &engine_activity->eag[index];
> 	int i, j;
>
> 	for (i = 0; i < GUC_MAX_ENGINE_CLASSES; i++)
>@@ -240,36 +300,103 @@ static u32 gpm_timestamp_shift(struct xe_gt *gt)
> 	return 3 - REG_FIELD_GET(RPM_CONFIG0_CTC_SHIFT_PARAMETER_MASK, reg);
> }
>
>+static bool is_function_valid(struct xe_guc *guc, unsigned int fn_id)
>+{
>+	struct xe_device *xe = guc_to_xe(guc);
>+	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
>+
>+	if (!IS_SRIOV(xe) && fn_id)
>+		return false;
>+
>+	if (fn_id > engine_activity->num_functions)

This ^ should be 'else if'. Consider the Native case where fn_id = 0. I 
believe num_functions will be 0 for native, so the check would fail 
always for native. Right?

>+		return false;
>+
>+	return true;
>+}
>+

Thanks,
Umesh
