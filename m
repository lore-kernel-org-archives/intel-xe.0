Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54C51C44525
	for <intel-xe@archiver.kernel.org>; Mon, 20 Jul 2026 09:47:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF07710E14A;
	Mon, 20 Jul 2026 09:47:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ahLkCrJm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 540E410E14A
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Jul 2026 09:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784540876; x=1816076876;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=CVOT6cn8thWRqdy1kAw4sK7Dw8fAJFVegsNCQYeLCgU=;
 b=ahLkCrJmxoKbw9FCnHYvk3GReEX5VrVNPC/pzGbAA3te1LN5xNEabreT
 bIZy0ZnynsyBW1gY9ij+c/rKBnswd04Iq8rN5epE/i8PPFApRHAOmfDhp
 sEjMiDJWPyMQnS8mkXVIjqs+cr5V53mwcG0nQ9bz/2wnkzWfzhMFtYtO6
 kT0LKy0rrSHEkXo0mOmcnGT6Ysdw4tL2hWPCJw6ucnj58ob6Sjso8nIvf
 3M27H/xrJrfJ5j1uAOeEr7o7DE3Cl9aWJkF0i6OB2niMA6plbDgiUr7KU
 N9SQ0FqDyAAeUx0Ro88p7+hCBKONKLbFWWuTskCI/lccMQpIeynkTf8/m Q==;
X-CSE-ConnectionGUID: VQVVUP7tTJSBbYlJl/SKgw==
X-CSE-MsgGUID: xnB6eqN9QDiIRf0YYaO6IA==
X-IronPort-AV: E=McAfee;i="6800,10657,11851"; a="95710442"
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; d="scan'208";a="95710442"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2026 02:47:56 -0700
X-CSE-ConnectionGUID: tsHJ9OFgSRm9OHl/+i/cSQ==
X-CSE-MsgGUID: zEsylWVHREiGXvAqs+hWRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; d="scan'208";a="281875344"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2026 02:47:55 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 20 Jul 2026 02:47:54 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 20 Jul 2026 02:47:54 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.27) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 20 Jul 2026 02:47:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fmXpkETnE5A4D+491kLaG7pSBtpUPyY0+pFcAddIWwqponWBljHgtl6OeYaHkfABYq2sekOpG3f6gBKTRzeruc+NVEJTJASVUNAdL0VUYUBqMSCG6OWicIBo1rtS2dxhGuvMuv6MkrZs+V9IKWoaNggOTRvglGisYre+AHTuF2K90gtM9mNz5aXouDufDBeaQwg52txi7xoWUlMrVZOXlAwvkMsU85h7aVPm72UjHlFbpvwQBJ/A6PqAU714TrAvDfULePAf3dOrOQp91xQH/THGi58Xo72P1tgXrutWO2EnLrhB8PfyHbrL3sjtf1cj8HqVAO2QLRSplbjDcFr5Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g1taXrjlYTKQwWWRkyNbZa8b/nF+MXfscruMaR67al0=;
 b=Q9ytH3vp7kXPrJyQ1HgRjV3jhs0V6LV3Y200laflEMLD7rfJsFXVCW8BraqEOrVYFFV62+SDVYKWpHNVsZRTIBvinqZpLMb+bKh/cd/fkYzOAc6E9qCNxBO4TSQUohOVa08udWX5kTEzr+EgcqZ9jYbN/nQ1UibcxyI7IdkbWWg8fzM/YFCCmSWjNY8DPzjNas0KkwK/ZwH4hsUyNo6jxCmK/25oAg6Hc6aVMpV0oma++xhzu9CIJ/EQfqgXz89IdpkbapjsAbH0mQmNI0fmBb7HWBNx9kncqdoVTFzGzpuMPDlz9XpGoiH3Y5p/L87bNA1uEHCMFgYmOb5nH/tdNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 PH0PR11MB5806.namprd11.prod.outlook.com (2603:10b6:510:14b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 09:47:51 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0223.017; Mon, 20 Jul 2026
 09:47:51 +0000
Message-ID: <17a0b00b-92f9-40de-aef3-86fea7fdab73@intel.com>
Date: Mon, 20 Jul 2026 15:17:40 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] drm/xe/sysctrl: Add helper to query application status
To: "Anoop, Vijay" <anoop.c.vijay@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <umesh.nerlige.ramappa@intel.com>, <badal.nilawar@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@intel.com>,
 <anshuman.gupta@intel.com>, <matthew.d.roper@intel.com>,
 <michael.j.ruhl@intel.com>, <paul.e.luse@intel.com>,
 <mohamed.mansoor.v@intel.com>, <kam.nasim@intel.com>
References: <20260720091410.4153002-2-anoop.c.vijay@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <20260720091410.4153002-2-anoop.c.vijay@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0252.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ae::8) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|PH0PR11MB5806:EE_
X-MS-Office365-Filtering-Correlation-Id: a7a0985c-1543-4e7a-7540-08dee643f69f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|366016|22082099003|18002099003|3023799007|56012099006|11063799006|10067099003|6133799003;
X-Microsoft-Antispam-Message-Info: hFEOZPWq7Njwi6MGy5fdg99kG9R0+SJptqjNbU177qTo74LHuYm+QraK6muP7GZzAWVBfTh0x6dJrMAKlZoU1CqUMkp9MJMHsjNwP5pV3qgJAE8GMAFoZvNoARePt0bJJfOeCAKqhtuhRNhiI/Y8njACbF+ON/TOXw45og7F15aJ75UIBqLNJkgxy2h3nLgreDhknsXHMZb/pz7p03fjB6aFSlSmtnpXx+zX80DUCLVcqzDyaLqtYWzFUfxTts8966Zmp9SiOP6SK8f9GWd81gi45Gy8X5NARhiT30CIZi1AUAVK/A3IZvxzPhIBdGY8c1kCAHe1fX6wleJeitPFFwZn5ZC6RcPDgvpuod+eaVnSh4WJn5TZU+MMQzi2jS7y0GXZIMgow8+d/hqjAAnEZfGGgxaP7OD6TG5Ef9RueKUwy9q/53smHI4cHyFrK3Ie/2obiBHLK8aQMpq2IpI+PIbqn9zczNd/kl8pvK9r0Ol4q21kap0rI7e+vCsDO3p/7Wzpj1BePoNwOwVixRe6t19isQLuuwgVgSSgV584ILPkM1dlZo3RMLwy8aPaKPEfuWy/7b1IAiHRSzcm8e5rj73GnsG/Pw1V3RRsOq8olBXgzvBnt2gH3czZwKGORk7fy0I2K19aQ1PoGVSbFjE2jbNvFx1I2Dey/WsaasVeLIk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(22082099003)(18002099003)(3023799007)(56012099006)(11063799006)(10067099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VXRRczdUakp3YWF5dTdLNGNsYzFuekh0SlFqUHRoNERSdHZtVjFkYnU4UHkz?=
 =?utf-8?B?djFMZkdWVERlOVpQNHBjblpRWTBDVUhYTG1GZWFUd3czcGZHeVBXMnJpYjJi?=
 =?utf-8?B?aTJEejNKaEFnN0ViV2RzbU9QdEFZUGRJemNZaW9meHU4Yk1vNkdGWUYwZjVJ?=
 =?utf-8?B?NFZzdjN2dno4KzJMN3o3eDRnNzUxMHY2ZHJiOERCaFp2eHlESUJFQmd0Q2h1?=
 =?utf-8?B?dnh3RGxZa0txRzhWS3pnYjg4NWU3K2NycWFQWEJUaER1cUdYZklNSG5qZm94?=
 =?utf-8?B?cEJ0WGpMTDliK05TTEozN0lQVVN3clhJWnlScURjTDRta0xzdzMxQzZ5VTNh?=
 =?utf-8?B?L0pDRkZKelBsVUFNbU5pcXFEUExxWHo4dHBSUXFMeGdDeThPNU9nSmJRNzNx?=
 =?utf-8?B?LzlkOEtZTlZNSjJIU0xxSGhKUlhjZDhsSmhKYnlSd3NkellZRTB6Q1RnUzNn?=
 =?utf-8?B?K2hMK0R5TzNrUC85d2tSMFcwcFlNTU1tUGg4U3Jkc0xib2JkR0VDWHZlbmt3?=
 =?utf-8?B?ZjREWlJLR09lRFlNSG9RV1Z0Wno5bWQ4TU5YMlNCMnR5Y2ZWd1o2azZITzlD?=
 =?utf-8?B?ZDd3ejJmWUEzSE41SFhLdzdoVEdSTmRjeHlCWUNxV3cydDNJT1hxR1ZHaW1F?=
 =?utf-8?B?cTZZbU8rMkZoYUxHcWt2SndEQXg5Vmd6RUZ2bTc5TWpiV0x2VXQ0Q3B5MFFn?=
 =?utf-8?B?d3dNcXcrTDNFeG10TlV5eUpPRW5qb2FuOSs0NlliY1NoZzlVMlZJbmcvekRB?=
 =?utf-8?B?RVJlQUN0QW1tLzRVZ2VvYk4zalZIRFRiNUVvNm84MDVYUU9oMmZSSVhDR21x?=
 =?utf-8?B?YmJzaHFIU3RSV2Y1ZENQNmRsZWVNcmFnYjNIWkVBbGJEc3RhR0ZHK0FwMXVv?=
 =?utf-8?B?UHpJTkJiK1h3TjlqcEx4eVVRenMxVFd0amVUaVpzMHZ5SGU1bDFLdjg0UjBr?=
 =?utf-8?B?d0Z1VmcxclZHZUhoRkd1ZkxOaDBRZkxuME5zRnl5VlFxQmx3NzZLMXFHaUxw?=
 =?utf-8?B?NzltS3pJWGt6YngvaTV2aHV1Z1hWS1R0aDRUWTQ3cVZIZlZyOWNObGJoNm0v?=
 =?utf-8?B?SUFFQ0NjUkNFZDQzd05vT1RSNFF3L3hjditvVHcwYk43REQzWnFCVlphc1p2?=
 =?utf-8?B?cDZ3RnRjYVdBMDVkamlxUlhuQWVrMUdvWEJlSyt3QzZuQW1tTWxvUkxWNXRU?=
 =?utf-8?B?SW90R0VISGpXOXVSYmdlVVl3K1psdm5aTFFEcHVBc0E2WUV6cUdTR0JKZjI4?=
 =?utf-8?B?YnpVY3BRVlF0M1hSWjJRQWRST2pWWnRnM1FDY3lpeVBYTjd2ZUlLT0tUa0x2?=
 =?utf-8?B?L0djNFpjTDFYOExYeWl0c0dYY3lWNEk5V3JCWWlUTEVnMjJYTVpGb3RVOEpw?=
 =?utf-8?B?M2ovWVBmNzhCM3RUbWZsa2FJcGpqUjhSaEhncmNJMGx3R3FacXcxSnpqR0xu?=
 =?utf-8?B?TVNPbDZSUWhmdXlMK3NRNVM5VXBSRHQwSW1DVFJNVkpkOC9GekpIdG1iUk5u?=
 =?utf-8?B?MGV3Yk04MHNzQXlPOWNHRktpQjI5WDBrYktXUVN4M2dEMWIwY3VaZWZ4YS9v?=
 =?utf-8?B?T1RxQk5XQWRVYUZyU1dFbGIyZmxXOFpMd2lGajFrS1VkQlpOdmh2Z01tZksz?=
 =?utf-8?B?d2UxbGJmMHI4Ry9ZZ0ExeTF5djBwZ1FOUDM4WGtSWTdqOXpqZVhQRnAyNTZ4?=
 =?utf-8?B?T25vYnJGOTF2TjNuWElNTjRnQkttK3pjeHA4Z01HZGc3eFd6aS80ZWF2aUhL?=
 =?utf-8?B?ZjhJUWVtS2hRN3AxZWhVajRmVU5FSkVXU3ZoeGRrQUZEZFZObXZNR01hcEpk?=
 =?utf-8?B?WnNYR1V3QVpQUTRKN0IrZmh6anJhMGVjYmVuK01IOVJiMithMEdsUDByNGND?=
 =?utf-8?B?Q1RGRDRyVlUyN0pMRjA4YlJxd2xOa1p2cHB5eEdjUTYwUlVUVGprODRxemJP?=
 =?utf-8?B?YmxVQ3pGcEV6SWtjUSs3Tkx3NVZOQzdNTFBSMzBXLzRFMW04b2VUZ2xFanFp?=
 =?utf-8?B?YVlXK05kK1J0eHdWTWxSSFlaUkorMDFhVndWbDArajFoeDZDL0V0OUo1NjYx?=
 =?utf-8?B?bTBJYzNBM0p2NUVzVkpOV0pJdUNEMWtYQ0FKZXNmeXFJQ1EzSXg4ekRwb1F6?=
 =?utf-8?B?ZmJ4bVdNdWRXL2VuV3NGTjg1QXZMakNFSFF5MjVuaFJXL0Z2cEh6dTZoWWtO?=
 =?utf-8?B?VHk0em5VamlKR3YySER0ekVpUEpRNXZsb0lhZDhadVQxTEtlUEVhK0RabDFx?=
 =?utf-8?B?N0luaDY2KzJReDN3TitoQk0zUjJtTDRyNDAvS21KNmwxTW1ZczIrQmZQSTJh?=
 =?utf-8?B?anB4UjVUdzBKelBrbmhKUjFITlBhTitRYm1zZjFVZHgrNjg3L0NQQT09?=
X-Exchange-RoutingPolicyChecked: M1MHWsQEdCSxps+dzoAjqKSBDmA0iYvziKgF++S0M+sviIIV9lEUP6zLI0deYk0s14KJbM3+2s5txkVctaQOjnJCWncBPt5MkZEAYCekJCZ29z3Q12Far3YzG9oD9KsV78gZKAg5gqviSCm0E/mxNViryMrR8um5SABRDw4MeQrBcb1OFCJbYST60BMh9AMnEVpGLclKyTbvDOjOYZKeR0PidMVjC9sYhKJEKOuVGi1AMXv5Syl9Y3+SahrZ0r0swaXBctFKUjIiw8BSR1LJsQ5i8CdcjkJZ9zkdyw8Oz+CH0R/K8R1u4QYxkkwz1EWpW3pThZ83QdFvpTOfcUanaA==
X-MS-Exchange-CrossTenant-Network-Message-Id: a7a0985c-1543-4e7a-7540-08dee643f69f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 09:47:51.2140 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XR6bmBdtVX1eWTFElB/vi08ihNfIkiI8yXZrl1zfDmpv3jeEkByJ6mG5fJn7bVOzdC+SfQZPsI94h4+vy7+WLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5806
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


On 20-07-2026 14:44, Anoop, Vijay wrote:
> From: Anoop Vijay <anoop.c.vijay@intel.com>
>
> Add xe_sysctrl_check_app_status() to query the state of a System
> Controller application using get_app_status_by_id mailbox command.
>
> The helper maps xe_sysctrl_app_id values to firmware application
> IDs and returns the reported application state. Add a convenience
> wrapper to check OOBMSM application readiness.
>
> Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
> ---
> v5: (Anshuman)
> - Rename OOBMSM status helper to use xe_sysctrl_* prefix
> - Remove xe_is_diag_fw_ready() helper
>
> v4: (Anshuman)
> - Make xe_sysctrl_check_app_status() internal
> - Remove unused app identifier
>
> v3: (Riana, Badal)
> - Replace string-based app identifiers with enum xe_sysctrl_app_id
> - Use get_app_status_by_id (opcode 0x05)
> - Move mailbox definitions to xe_sysctrl_mailbox_types.h
> - Return enum xe_sysctrl_fw_status consistently
> - Map communication failures to COMM_FAILURE
> - Add INITIALIZED state and status helpers
> - Fix Diagnostics typo
>
> v2: (Badal)
> - Return SysCtrl firmware application states instead of errno for application lifecycle conditions
> ---
>   drivers/gpu/drm/xe/xe_sysctrl.c               | 70 +++++++++++++++++++
>   drivers/gpu/drm/xe/xe_sysctrl.h               |  1 +
>   drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h | 63 +++++++++++++++++
>   3 files changed, 134 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl.c b/drivers/gpu/drm/xe/xe_sysctrl.c
> index 1db20be8158b..9406df029322 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl.c
> +++ b/drivers/gpu/drm/xe/xe_sysctrl.c
> @@ -13,9 +13,11 @@
>   #include "xe_device.h"
>   #include "xe_mmio.h"
>   #include "xe_pm.h"
> +#include "xe_printk.h"
>   #include "xe_soc_remapper.h"
>   #include "xe_sysctrl.h"
>   #include "xe_sysctrl_mailbox.h"
> +#include "xe_sysctrl_mailbox_types.h"
>   #include "xe_sysctrl_types.h"
>   
>   /**
> @@ -130,3 +132,71 @@ void xe_sysctrl_pm_resume(struct xe_device *xe)
>   
>   	xe_sysctrl_mailbox_init(sc);
>   }
> +
> +static enum xe_sysctrl_fw_status
> +xe_sysctrl_check_app_status(struct xe_device *xe, enum xe_sysctrl_app_id app_id)
> +{
> +	struct xe_sysctrl_get_app_status_by_id_req req = {};
> +	struct xe_sysctrl_get_app_status_by_id_resp resp = {};
> +	struct xe_sysctrl_mailbox_command cmd = {};
> +	size_t out_len = 0;
> +	u32 flags;
> +	int ret;
> +
> +	if (!xe->info.has_sysctrl)
> +		return XE_SYSCTRL_FIRMWARE_APP_NOTSUPP;
> +
> +	req.app_id = (u8)app_id;
> +
> +	cmd.header.data =
> +		FIELD_PREP(APP_HDR_GROUP_ID_MASK, XE_SYSCTRL_GROUP_CORE) |
> +		FIELD_PREP(APP_HDR_COMMAND_MASK, XE_SYSCTRL_CMD_GET_APP_STATUS_BY_ID) |
> +		FIELD_PREP(APP_HDR_VERSION_MASK, 0);
> +
> +	cmd.data_in = &req;
> +	cmd.data_in_len = sizeof(req);
> +	cmd.data_out = &resp;
> +	cmd.data_out_len = sizeof(resp);

We have added a helper as part of RAS. Please use the same

void xe_sysctrl_create_command(struct xe_sysctrl_mailbox_command 
*command, u8 group_id, u8 cmd_id,

void *request, size_t request_len, void *response,

size_t response_len);


> +
> +	ret = xe_sysctrl_send_command(&xe->sc, &cmd, &out_len);
> +	if (ret)
> +		return XE_SYSCTRL_FIRMWARE_COMM_FAILURE;
> +
> +	if (out_len != sizeof(resp)) {
> +		xe_err(xe, "sysctrl: unexpected get app status response length %zu (expected %zu)\n",
> +		       out_len, sizeof(resp));
> +		return XE_SYSCTRL_FIRMWARE_COMM_FAILURE;
> +	}
> +
> +	flags = resp.flags;
> +
> +	if (!(flags & XE_SYSCTRL_APP_RESP_VALID))
> +		return XE_SYSCTRL_FIRMWARE_APP_INVALID;
> +
> +	if (!(flags & XE_SYSCTRL_APP_RESP_BOOTED))
> +		return XE_SYSCTRL_FIRMWARE_APP_NOT_LOADED;
> +
> +	if (!(flags & XE_SYSCTRL_APP_RESP_INITIALIZED))
> +		return XE_SYSCTRL_FIRMWARE_APP_BOOTED;
> +
> +	return XE_SYSCTRL_FIRMWARE_APP_INITIALIZED;
> +}
> +
> +/**
> + * xe_sysctrl_is_oobmsm_fw_ready() - Check if oCode firmware is fully initialized
> + * @xe: xe device instance
> + *
> + * Returns true if oCode firmware has reached the initialized state, indicating
> + * it is ready to handle requests. Returns true also on platforms without System
> + * Controller support, as there is no firmware gate to wait on.
> + *
> + * Return: true if oCode is initialized or sysctrl is not present, false otherwise
> + */
> +bool xe_sysctrl_is_oobmsm_fw_ready(struct xe_device *xe)

This was mentioned earlier. why is a unused function added?

> +{
> +	enum xe_sysctrl_fw_status status =
> +		xe_sysctrl_check_app_status(xe, XE_SYSCTRL_APP_OCODE);
> +
> +	return status == XE_SYSCTRL_FIRMWARE_APP_INITIALIZED ||
> +	       status == XE_SYSCTRL_FIRMWARE_APP_NOTSUPP;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl.h b/drivers/gpu/drm/xe/xe_sysctrl.h
> index 090dffb6d55f..325334509a03 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl.h
> +++ b/drivers/gpu/drm/xe/xe_sysctrl.h
> @@ -20,5 +20,6 @@ void xe_sysctrl_event(struct xe_sysctrl *sc);
>   int xe_sysctrl_init(struct xe_device *xe);
>   void xe_sysctrl_irq_handler(struct xe_device *xe, u32 master_ctl);
>   void xe_sysctrl_pm_resume(struct xe_device *xe);
> +bool xe_sysctrl_is_oobmsm_fw_ready(struct xe_device *xe);
>   
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> index d0341538ad05..c7ba6d69f4a7 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> @@ -14,9 +14,11 @@
>    * enum xe_sysctrl_group - System Controller command groups
>    *
>    * @XE_SYSCTRL_GROUP_GFSP: GFSP group
> + * @XE_SYSCTRL_GROUP_CORE: Core group
>    */
>   enum xe_sysctrl_group {
>   	XE_SYSCTRL_GROUP_GFSP			= 0x01,
> +	XE_SYSCTRL_GROUP_CORE			= 0xFF,
>   };
>   
>   /**
> @@ -38,6 +40,67 @@ enum xe_sysctrl_gfsp_cmd {
>   	XE_SYSCTRL_CMD_SET_HEALTH		= 0x0C,
>   };
>   
> +/**
> + * enum xe_sysctrl_core_cmd - Commands supported by Core group
> + *
> + * @XE_SYSCTRL_CMD_GET_APP_STATUS_BY_ID: Retrieve application status by ID
> + */
> +enum xe_sysctrl_core_cmd {
> +	XE_SYSCTRL_CMD_GET_APP_STATUS_BY_ID		= 0x05,
> +};
> +
> +/**
> + * struct xe_sysctrl_get_app_status_by_id_req - Get application status request
> + *
> + * @app_id: Application ID for which to retrieve status
> + */
> +struct xe_sysctrl_get_app_status_by_id_req {
use a shorter name
> +	u8 app_id;
> +} __packed;
> +
> +/**
> + * struct xe_sysctrl_get_app_status_by_id_resp - Get application status response
> + * @flags: Application status flags (see XE_SYSCTRL_APP_RESP_* definitions)
> + */
> +struct xe_sysctrl_get_app_status_by_id_resp {

same

> +	u32 flags;
> +} __packed;
> +
> +/** XE_SYSCTRL_APP_RESP_VALID - app_id is recognized by System Controller firmware */
> +#define XE_SYSCTRL_APP_RESP_VALID		BIT(0)
> +/** XE_SYSCTRL_APP_RESP_BOOTED - application has completed its boot sequence */
> +#define XE_SYSCTRL_APP_RESP_BOOTED		BIT(1)
> +/** XE_SYSCTRL_APP_RESP_INITIALIZED - application has completed all post-boot initialization */
> +#define XE_SYSCTRL_APP_RESP_INITIALIZED		BIT(2)
> +
> +/**
> + * enum xe_sysctrl_fw_status - System Controller firmware application lifecycle states
> + *
> + * @XE_SYSCTRL_FIRMWARE_APP_INVALID: app_id is not recognized by firmware
> + * @XE_SYSCTRL_FIRMWARE_APP_NOT_LOADED: application is known but has not yet booted
> + * @XE_SYSCTRL_FIRMWARE_APP_BOOTED: boot sequence completed, post-boot init pending
> + * @XE_SYSCTRL_FIRMWARE_APP_INITIALIZED: application fully operational
> + * @XE_SYSCTRL_FIRMWARE_APP_NOTSUPP: System Controller not available on this device
> + * @XE_SYSCTRL_FIRMWARE_COMM_FAILURE: communication with System Controller firmware failed
> + */
> +enum xe_sysctrl_fw_status {
> +	XE_SYSCTRL_FIRMWARE_APP_INVALID,
> +	XE_SYSCTRL_FIRMWARE_APP_NOT_LOADED,
> +	XE_SYSCTRL_FIRMWARE_APP_BOOTED,
> +	XE_SYSCTRL_FIRMWARE_APP_INITIALIZED,
> +	XE_SYSCTRL_FIRMWARE_APP_NOTSUPP,
> +	XE_SYSCTRL_FIRMWARE_COMM_FAILURE,
> +};
> +
> +/**
> + * enum xe_sysctrl_app_id - Known System Controller application identifiers
> + *
> + * @XE_SYSCTRL_APP_OCODE: oCode application (firmware ID 12)
> + */
> +enum xe_sysctrl_app_id {
> +	XE_SYSCTRL_APP_OCODE	= 12,

use hex

Thanks
Riana


> +};
> +
>   /**
>    * struct xe_sysctrl_mailbox_command - System Controller mailbox command
>    */
