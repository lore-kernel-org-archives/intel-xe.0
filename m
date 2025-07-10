Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96733C83F1A
	for <intel-xe@archiver.kernel.org>; Thu, 10 Jul 2025 05:28:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4378410E1AE;
	Thu, 10 Jul 2025 05:28:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eU1kCP4I";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61F5610E1AE
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Jul 2025 05:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752125318; x=1783661318;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=AWFle0JmGsbYI16ramiaeuJ3JZ3SuxLDhkD5ULCZlCI=;
 b=eU1kCP4IMeja2P6xCSTm4rQHfuFHSOHDB4K2d8TZO2mS1TQXhQjllo4P
 cDXDREFI3d7BknztGU6NomXJ1Uv/jfTIYygx65omRuTmUmk9AHOwMIcfa
 /ZP0FumBNECCgsXnv9Hn/TzTkbLpba/tpfdEEZn02nivaexOLNLWWR2WN
 x1gOdoXRDuJOsqcjBvrOG4jouZM1YLTx0VszEn8hUksRkyEzd4/hWqOS2
 DnZZ4PDc1ee99+0nbJOzNMxsVmrmGwA57Pw41eLEcR0EJTSvw+rvvNa5S
 1zEJsXQpott9pvQunyYJMtKbuIZ4jafHnQZ7uWNvvk+4MmLq+huLVToSA Q==;
X-CSE-ConnectionGUID: o0n84QRYSj+xYBuinSAbMw==
X-CSE-MsgGUID: 4+xkiirmSaiq2XVzPL5H8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="65095693"
X-IronPort-AV: E=Sophos;i="6.16,299,1744095600"; d="scan'208";a="65095693"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 22:28:35 -0700
X-CSE-ConnectionGUID: aiWADHMqS2yrOFcQOjQv9g==
X-CSE-MsgGUID: XrG+DYZMT2ePwxhOMV2Z6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,299,1744095600"; d="scan'208";a="186955215"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 22:28:35 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 9 Jul 2025 22:28:34 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 9 Jul 2025 22:28:34 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (40.107.101.84)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 9 Jul 2025 22:28:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UU1FjSViA2P4mRWmv45XHGO6BOAjuqDudHREugtRrAUm15ijvOYLy0dNIvx6H8CHJqH8zVJSym4RjW776K++Rws73VnO6vIBOMI+CJpMwL7ChrZdwSI4RRNEjwbsmrVb5arek4P5uGiuAHQ34ZnwhQRv8tCQA6QMWbimweTxjiOx8zMfuu9ELZtBt8QW4xOy48IsCGG9T/ysyX7oS2Rz3sc0li7eSipBqxR+912Ba42g7Tvh42J5o06Ive0VNDjiek0QkhJPhsyMZuVzbhN71FJju/uytbz+RbB0LdSFN/k/KyYb2xqLdTdW/MlyTdfBmx1+RX3GIVNPL/pQYZm2yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZHYh+TCE1k6DhxFhKoQt+GpofA6MPrs6Sr0U612CIG0=;
 b=IvRw5T2BZ4YiQdvYGcDiyqH/41955aUVVCFQfbv69DBxxr+6R4tGf1vF8EePS0KNv8mKmdIDITZatyMYxjHq8o8j36XQhSczdSX5x1gVLFPGVNp4I7hxZhbeChIXVA+ww8zbymVe9i79dP7NQC0qJpblpMwRBZ3bWCO0HdPCdyTL01NAQnLmR+UPxt/5YIBdU3KDJZvFST7JGJpH5Cx/b1HShZ4IUX9HTTYfSyUkoTP9iAQOz6PGK1jqUcncK3Do3/WdX1CLh+AhsW5qkqlnxz2a0L1lgB5N9WPYZKNu8YnFo7nl1wjPEnaEGtxjb5lltwoaaQvplgd/qo5gPlX5rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.21; Thu, 10 Jul
 2025 05:28:03 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%6]) with mapi id 15.20.8901.024; Thu, 10 Jul 2025
 05:28:02 +0000
Message-ID: <de50743e-3d5c-4765-aa1f-4a61329c85a4@intel.com>
Date: Thu, 10 Jul 2025 10:57:54 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/7] drm/xe/xe_survivability: Add support for Runtime
 survivability mode
To: "Summers, Stuart" <stuart.summers@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Jadav, Raag" <raag.jadav@intel.com>, "Anirban, Sk"
 <sk.anirban@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "Scarbrough, Frank" <frank.scarbrough@intel.com>,
 "aravind.iddamsetty@linux.intel.com" <aravind.iddamsetty@linux.intel.com>,
 "Gupta, Anshuman" <anshuman.gupta@intel.com>, "Nerlige Ramappa, Umesh"
 <umesh.nerlige.ramappa@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>
References: <20250702141118.3564242-1-riana.tauro@intel.com>
 <20250702141118.3564242-4-riana.tauro@intel.com>
 <0d56280d48bc707917bd1e11e3d93683a9de98f1.camel@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <0d56280d48bc707917bd1e11e3d93683a9de98f1.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1P287CA0024.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::25) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SJ1PR11MB6129:EE_
X-MS-Office365-Filtering-Correlation-Id: d0c218ee-e16f-4294-414d-08ddbf728a69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dXhmYWRyUnEvRnJqeFNhNGxSYjNqYlU0SmRRNG8zUTdYSkhjTDRzVjUzcnJy?=
 =?utf-8?B?K1NjZWlUMlNIZlpYWXFyZjdoejBxTmpvMHM3RmlUbm0xb3pLTGlwM3pQSWNE?=
 =?utf-8?B?RHVXYlkwZldGYm4xZmczVlVvYTNiT2ZWTnAxTnNmN1IwWG9UT0kzd0RNODVn?=
 =?utf-8?B?S25NZW5qckJwWmpYNnUxeHh1TFFrdzJoeE5VMEVZeEMzNjk3c3hwblZ5RjRP?=
 =?utf-8?B?SktUcmY1TVp2SytxWUhyWGU3ZDQyRTFMUVRhR3FkQ2F2ejgxR1NsakVaQ3ZE?=
 =?utf-8?B?SEtYV0xBaU1sQmVrTEdYRFZlcGswSDhDQXRRVDZ2MHhUdEVXbjN2dENsVHJk?=
 =?utf-8?B?bWxhY3NncmNHWkZqclUwd2NvVjFObWsvUHcvQ2tNa0VxYmJoTkg1bUN5aEt3?=
 =?utf-8?B?WWljekwveitzZmtqRE95b0JZRGIra0pLdWt6ckR5dzVpckx0ZE5yMUJFVWlM?=
 =?utf-8?B?WDJrU3czMTN0SFBVcC9kTWlQcnNKNnB6WWxHNnFId25SaUNqVTc1cVU3ZlIw?=
 =?utf-8?B?ZVR3NHNhMzgxRFArQ2MycjRoWWp0SmY5WktGbE42eXZCOUVJT2NjSXBKbm1F?=
 =?utf-8?B?OUdhV2JNeHJoQng3bWhKQjVXaEpwMkdmVDZCYytyZ010ajhpcDhIS1NMbS82?=
 =?utf-8?B?S2NueTdqMWkzRGpQL0ZTTWdaSjJzbHV6OFo0Vkcreit1dGlQWm9FckYwZUN3?=
 =?utf-8?B?RUFKUG9GMmpYRTdYZjlQZENDdzNkemJhZnBnL2hrUDFodVVmZHdhUEd1NEwz?=
 =?utf-8?B?dHpGNzVFSEFuRDQ1cWVYWDlpTm5pODZ1eDhPUTd2YXlOdFZRbUw3ZUJ2aDBu?=
 =?utf-8?B?YXRsQUtwdWRaUUhwVjhSd2IwaWZZOUxOOHZEQ21PR3ZNVlhmMWZxSTlvekpL?=
 =?utf-8?B?c1FPcXY0Q252ZElDbWVKNGdyUzJUWVRKVlEweWN4S1k2bXRFVjBOazJXZE41?=
 =?utf-8?B?NHhpaEF5NGFYd2h5S2czY2syU2t4b3FJS0lyalVFYVFWWFAwYzhRcXdvWmxM?=
 =?utf-8?B?SXVWM3BxUUlNWmw1ZjdOakxHZTAxZCszclNmSERMa0Jub1Q3amZzT2tUc0pH?=
 =?utf-8?B?ZjFqd1pSY24rNTdkL2hWM0c3ZEkrZmpSSFR5VlAvejJWaEJrR1J4WFZwdkp2?=
 =?utf-8?B?d1lFYzNsUzQvUitPbFVPd3Z0bUViZ1JMZDdkNzg0dGlnck1XVzZYTDZKem4w?=
 =?utf-8?B?a1Y2YUhYSmpoeHYrZ0w4ZllueEh5cjVyZzc5bUxSMEhpWUVqMGxnTVl1bzdv?=
 =?utf-8?B?QjlRbHp6NmIxNDNnMmJDQXFRQks3STdzQVJSRVpxNWVRTjVwY1pzTnNxSW9L?=
 =?utf-8?B?bjR2Z1B0VFplVXhXUlNqNUFSeFZhaStkYy9hSEs2S1R4eEtTUDlUKzJXK25i?=
 =?utf-8?B?b0FjYzZtSFVPSW15cEJjREwvdE4wMWY4MEJ3YmJoQlRWamdUVUZ5NjJNRWI3?=
 =?utf-8?B?RDdnNXlOTnhQUGxGT0lxKytuUnpscUc4d1VSZ3o3dUczN2NyMSt2RFpJYjhu?=
 =?utf-8?B?M0xEY05yZTNXQmFpM2tIUDdyVWNVWnp6d1BRd3o1YzJ4L1cyN0ErK0lXbDZZ?=
 =?utf-8?B?NTkrakptd0t2K1pGZmhmcXNHdHFSNXE2alN6QUxqSWNSMGUvN3pWYjB0UzBH?=
 =?utf-8?B?djJhcVBiU1JqalVFVUdUZmlIRWVuZDVmcmxnOUdvSWh1bVhlSlYxL3U2TCsx?=
 =?utf-8?B?QUp3TDdxOFVZak1JdHpOeWVWM1dVVFVidXA5ank4U1Z0UmltQUNBaGM2eHJx?=
 =?utf-8?B?dW5kTHRoc2daeGJrcEFsMTR3bGpEdC9rQSs0LzZmNzhuTjhrRDdUcWdGWnlJ?=
 =?utf-8?B?ZnUydmluaHpHSU42UFo0WE1VZS94RC9QVXY0aXJDNjdwUTRsdVg3SXpGVFRT?=
 =?utf-8?B?SWdDQmFscVpnd0xlTkNvR3Rjek1xbTRZZ2t1clFySWNCZEtubXlsSkdIRzF0?=
 =?utf-8?Q?1kvxJqfp27I=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZlBrN0g0VVM3ZU1xeTlQWUZ3SkJGT2h5Zk1KYVZSQm1ndUUxY2NLbjR5UW1s?=
 =?utf-8?B?dFZ1Z0JWUkVKT2ltdWxBTllaQTVOTVd6cjk2bjB6eUdGODduNUloMHdDdVdQ?=
 =?utf-8?B?VnYvTkk3dm9wQ1ZVVGZsWFlqSUtmckVtcFhwTHJaWGVDcG5JWi9xaDRLdjhu?=
 =?utf-8?B?QytyNUVlQmUzYjhFLzJXVWNRZUVZRHNsakVzVEpJdTN2ZG9iTi9wS3NycWUy?=
 =?utf-8?B?d21zcytwUVBXelFHMmN6MU5sYld6NlVLdW4wZWViZ1M3SThNbFQ2UUtLZ2px?=
 =?utf-8?B?blNOdHBETXhQemROUXhqeitNVHc2d1pZT2xqeDFwVWVCU0wrLzJQUjE3S2Fv?=
 =?utf-8?B?ck9GNW5UczRxSWhsdzNLcGthM2NSMURvN1ZLTDhFZUswM0FLU1h3Mkx5N3Bw?=
 =?utf-8?B?TWJHekdaYnJEZUcxdzQ2RUJaQUc5b1hLYUpNM0hqcHdEcnloUW1VWmFUa1hv?=
 =?utf-8?B?UDN6REFtcXgxbmdBK0VhNU1WSzA2WVBDeTJaZUM2S2hWNk5BcmtRZnp5SU9R?=
 =?utf-8?B?ODVYa2tZWTkxK3BrUDI0cWVNeG5HQ0lTV2hrdWVQc2luU2hyaU1raTliOUN6?=
 =?utf-8?B?MjRSaFVGeWIvTHpvdGNmcmtsbWU2UnJaK3ZzNkgxNVlCYTU2aGRUZi9EbnE2?=
 =?utf-8?B?eENLRW1KbGxzeWhFUk1xZ2tvSzFaRjE1QkUrNld4VjZTczhHRFlYUXpDbkk0?=
 =?utf-8?B?QVkycEZiaW5EVGdTR2l4UGxaNVJQWGJuUk1IeU1hcmpQTFdMNUJTNlYvWHVY?=
 =?utf-8?B?RHhqOWNqYStOeldZY3B1ZDN4SGhITThMRzdUUG5xNWFOeGhTdWZwMEZwN2tG?=
 =?utf-8?B?a3hobGJ4MVF4YUJzUGZKSjQvUnJhSjJyY1F5RDhqU1FoVWd0RDhxYTMxT2dK?=
 =?utf-8?B?UWNabnhvZjNVNWdkdHJVOGx5T1ozZ21ueWc1TFQrMlhpRmpRT2FlOHFOQ1ZG?=
 =?utf-8?B?UlV5TWdFOThYdVJPeW40MVQ1V0psNUdhWFJrNmVXQXR0eEhrWFUwdmhkSlNT?=
 =?utf-8?B?MkVZZ3VpcnBQTU44dFpVcGh5b2tEZXVHYm1NbTg5c3o3TnViekZWbXhwNStj?=
 =?utf-8?B?MDBBZjFvaGkrMTd1OWVidG55a01TNXBFbE11VFFIMXBqbFpGZE51cnZ4K1ZP?=
 =?utf-8?B?NjZoU3lyVDZTek03eWNYaUkvcy9DQzFpVjd0eUx6a3h6YnIwRzFxZ0hZWnpa?=
 =?utf-8?B?clVIR1QyRFYxSU5oaDd0TW82WW1VSTBmc05VTHhndkF0cHBjUWhKT3N3Zno2?=
 =?utf-8?B?RnpmeEFZSXU1YkhMSkFRN2laSGxhTlVXcThyUmc0NVR1M2FRKzQ4UmNrYjl6?=
 =?utf-8?B?REczUEs0YUVRYlV4SHVpcVN0Y2QzQmFSWjNHamxwSnUzdEtTYzVqOHZGeFJr?=
 =?utf-8?B?Rlk4Y2s5Rk5uNTlVREk0MDdHT3lwZVN4blI5ZURmV1U3ek04QjI2R1N3Lytk?=
 =?utf-8?B?dWM4RWo0dVhoMnVmY29pTW1icGlsOWVhNDFWOEpOUFEyUlBsQXFIWWh3emhS?=
 =?utf-8?B?RS94a05ETWVPVDNnNGdxY2xIcS9lSGpTNkFVekdMUlVWeFMzK3JoL2c3dFJs?=
 =?utf-8?B?dzlFaFpPNU15SWtZekk4bEJvNU92OHRXU1FKZng4WHNRcVdrOUFSUjZVSFFQ?=
 =?utf-8?B?UWNOYjhhS05jSFMycklyeFh3b0Q1b0dtT09IRndxQXNmb0N4RGU5YWJwWUVZ?=
 =?utf-8?B?dnFmQXE2c1pWaUFMOWdrblFKUmFueS8rUDdER1ErZWxaSmFQbG9ka0YxYjZR?=
 =?utf-8?B?ZjhKNENJWHBhQmRwdGgxbEdwNHdNL2ZCRW9YTGVja1NKR0tvVHFNenl3Vnll?=
 =?utf-8?B?KzcwdWJrbnVQYnEvM1p1UitvTUFYTGttZWFNQVVKdldkdU5BYmlDSHFuRkJQ?=
 =?utf-8?B?OFVOTk5lZ3J6Q0Z4NzBmMVRxcVBlTDg1OVdrU2VrN2ZmTkhpWVZRcmVpSkFN?=
 =?utf-8?B?QTNReHVpei9sN0RkSFY5UEZxYUFEeG1RMThkWjh6ZW1NYU8xOXl1TWlKcVVq?=
 =?utf-8?B?TGliUHZkTDRhM0Qvem9pUmlCWFZ2ZlA5VFBzUVJWbmY3WnF4bGNDZnZsbHFm?=
 =?utf-8?B?L1dtZnJFRkpIa3Z5UGdWVXkvV0J0STU4a3k5R2l4SFZZVlZndmtCNTd5dmxh?=
 =?utf-8?Q?VOCP00+jmkfvOb7oiuYaDinK+?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d0c218ee-e16f-4294-414d-08ddbf728a69
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 05:28:02.7440 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VPADg5NwK55AYAAq/A6fNVDjOL0id8i310vlbsV02crjrS8A/z6dWFw76uVDlOZzBh5yUtKfvZCq3eCBzYx6pQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6129
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

Hi Stuart

On 7/9/2025 11:34 PM, Summers, Stuart wrote:
> On Wed, 2025-07-02 at 19:41 +0530, Riana Tauro wrote:
>> Certain runtime firmware errors can cause the device to be wedged
>> requiring a firmware flash to restore normal operation.
>> Runtime Survivability Mode indicates that a firmware flash is
>> necessary to
>> recover the device.
> 
> I'm not understanding why we need to overload survivability mode here
> in the case of a CSC (or other hardware error) failure. I see there is
> some vesc initialization that happens there and GSC initialization
> (need to look further, but presumably this puts GSC in a survivability
> state also?). But we already have the vendor specific wedge. Do we
> really need the extra hook to survivability mode which was really built
> as a boot time config.

vendor-specific without a reason is vague and could be reused for a 
different action in the future. There needs to be a indication that this 
wedged uevent indicates firmware flash. So the survivability mode sysfs

This patch will further be extended to handle d3cold resume pcode 
failures which will send a similar wedged event and survivability mode

Thanks
Riana>
> Thanks,
> Stuart
> 
>>
>> The below sysfs is an indication that device is in survivability mode
>>
>> /sys/bus/pci/devices/<device>/surivability_mode
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_device.c                |  2 +-
>>   drivers/gpu/drm/xe/xe_survivability_mode.c    | 26 ++++++++++++++++-
>> --
>>   drivers/gpu/drm/xe/xe_survivability_mode.h    |  4 ++-
>>   .../gpu/drm/xe/xe_survivability_mode_types.h  |  8 ++++++
>>   4 files changed, 35 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device.c
>> b/drivers/gpu/drm/xe/xe_device.c
>> index 4a38486dccc8..5defa54ccd26 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -716,7 +716,7 @@ int xe_device_probe_early(struct xe_device *xe)
>>                   * possible, but still return the previous error for
>> error
>>                   * propagation
>>                   */
>> -               err = xe_survivability_mode_enable(xe);
>> +               err = xe_survivability_mode_enable(xe,
>> XE_SURVIVABILITY_TYPE_BOOT);
>>                  if (err)
>>                          return err;
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c
>> b/drivers/gpu/drm/xe/xe_survivability_mode.c
>> index 1f710b3fc599..e1adcb33c9b0 100644
>> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
>> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
>> @@ -129,7 +129,10 @@ static ssize_t survivability_mode_show(struct
>> device *dev,
>>          struct xe_survivability_info *info = survivability->info;
>>          int index = 0, count = 0;
>>   
>> -       for (index = 0; index < MAX_SCRATCH_MMIO; index++) {
>> +       count += sysfs_emit_at(buff, count, "Survivability mode:
>> %s\n",
>> +                              survivability->type ? "Runtime" :
>> "Boot");
>> +
>> +       for (index = 0; survivability->boot_status && index <
>> MAX_SCRATCH_MMIO; index++) {
>>                  if (info[index].reg)
>>                          count += sysfs_emit_at(buff, count, "%s: 0x%x
>> - 0x%x\n", info[index].name,
>>                                                 info[index].reg,
>> info[index].value);
>> @@ -169,6 +172,10 @@ static int enable_survivability_mode(struct
>> pci_dev *pdev)
>>          if (ret)
>>                  return ret;
>>   
>> +       /* Only create sysfs for runtime survivability mode */
>> +       if (xe_survivability_mode_is_runtime(xe))
>> +               return 0;
>> +
>>          /* Make sure xe_heci_gsc_init() knows about survivability
>> mode */
>>          survivability->mode = true;
>>   
>> @@ -189,6 +196,17 @@ static int enable_survivability_mode(struct
>> pci_dev *pdev)
>>          return 0;
>>   }
>>   
>> +/**
>> + * xe_survivability_mode_is_runtime - check if survivability mode is
>> runtime
>> + * @xe: xe device instance
>> + *
>> + * Returns true if in runtime survivability mode, false otherwise
>> + */
>> +bool xe_survivability_mode_is_runtime(struct xe_device *xe)
>> +{
>> +       return xe->survivability.type ==
>> XE_SURVIVABILITY_TYPE_RUNTIME;
>> +}
>> +
>>   /**
>>    * xe_survivability_mode_is_enabled - check if survivability mode is
>> enabled
>>    * @xe: xe device instance
>> @@ -251,16 +269,18 @@ bool xe_survivability_mode_is_requested(struct
>> xe_device *xe)
>>    * Return: 0 if survivability mode is enabled or not requested;
>> negative error
>>    * code otherwise.
>>    */
>> -int xe_survivability_mode_enable(struct xe_device *xe)
>> +int xe_survivability_mode_enable(struct xe_device *xe, const enum
>> xe_survivability_type type)
>>   {
>>          struct xe_survivability *survivability = &xe->survivability;
>>          struct xe_survivability_info *info;
>>          struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>>   
>> -       if (!xe_survivability_mode_is_requested(xe))
>> +       if (!xe_survivability_mode_is_requested(xe) &&
>> +           type != XE_SURVIVABILITY_TYPE_RUNTIME)
>>                  return 0;
>>   
>>          survivability->size = MAX_SCRATCH_MMIO;
>> +       survivability->type = type;
>>   
>>          info = devm_kcalloc(xe->drm.dev, survivability->size,
>> sizeof(*info),
>>                              GFP_KERNEL);
>> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.h
>> b/drivers/gpu/drm/xe/xe_survivability_mode.h
>> index 02231c2bf008..559d1e99b03a 100644
>> --- a/drivers/gpu/drm/xe/xe_survivability_mode.h
>> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.h
>> @@ -9,9 +9,11 @@
>>   #include <linux/types.h>
>>   
>>   struct xe_device;
>> +enum xe_survivability_type;
>>   
>> -int xe_survivability_mode_enable(struct xe_device *xe);
>> +int xe_survivability_mode_enable(struct xe_device *xe, const enum
>> xe_survivability_type);
>>   bool xe_survivability_mode_is_enabled(struct xe_device *xe);
>> +bool xe_survivability_mode_is_runtime(struct xe_device *xe);
>>   bool xe_survivability_mode_is_requested(struct xe_device *xe);
>>   
>>   #endif /* _XE_SURVIVABILITY_MODE_H_ */
>> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode_types.h
>> b/drivers/gpu/drm/xe/xe_survivability_mode_types.h
>> index 19d433e253df..01f07d9c4124 100644
>> --- a/drivers/gpu/drm/xe/xe_survivability_mode_types.h
>> +++ b/drivers/gpu/drm/xe/xe_survivability_mode_types.h
>> @@ -9,6 +9,11 @@
>>   #include <linux/limits.h>
>>   #include <linux/types.h>
>>   
>> +enum xe_survivability_type {
>> +       XE_SURVIVABILITY_TYPE_BOOT,
>> +       XE_SURVIVABILITY_TYPE_RUNTIME,
>> +};
>> +
>>   struct xe_survivability_info {
>>          char name[NAME_MAX];
>>          u32 reg;
>> @@ -30,6 +35,9 @@ struct xe_survivability {
>>   
>>          /** @mode: boolean to indicate survivability mode */
>>          bool mode;
>> +
>> +       /** @type: survivability mode type (boot or runtime) */
>> +       enum xe_survivability_type type;
>>   };
>>   
>>   #endif /* _XE_SURVIVABILITY_MODE_TYPES_H_ */
> 



