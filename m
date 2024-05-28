Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 074DEC25B78
	for <intel-xe@archiver.kernel.org>; Tue, 28 May 2024 05:46:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4434410E495;
	Tue, 28 May 2024 05:46:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BcmfoABv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B24810E495
 for <intel-xe@lists.freedesktop.org>; Tue, 28 May 2024 05:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716875197; x=1748411197;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+1NptecRC6KM/Z9e7dyiUtor6Rcp0deFsw6Bxd5gcYo=;
 b=BcmfoABv/DvyNikb79b+FIvIEInVukLqz+xaBX4k5LNkqF1jON5CVtof
 IliEmuDuIFkftSA104fM3IU+8aP9Ki5Hu9Dgc9/UMtwSthvC5HmDSg2vW
 6tlNN0U7cmX/8OubBb41TdGQ8gLQu1fJ/F5XtWJnUK2MX3fTYPrwzOVAB
 P8u+TliP+G4Rq+A0kt17Odd/Wtm8HjP3/4t1usnlEDnHVCNWGmWk9oBsH
 aB/czn2NNq3E7GpjDkg45rKxjqgx9BD1w11hPhs7CrhwFzhqHwcZZ5SUy
 3PRduI+psrmrNz7d0qtDwViQYAka6TQx/TR7nWklp5dn5mU7Vpm9GbxfW g==;
X-CSE-ConnectionGUID: C7pCoz41T7W0dWP/kdJhww==
X-CSE-MsgGUID: yaku40liTSqu21hp+YE44A==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="23862514"
X-IronPort-AV: E=Sophos;i="6.08,194,1712646000"; d="scan'208";a="23862514"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 22:46:37 -0700
X-CSE-ConnectionGUID: YmDBTKLeQnqq8d5PoGZ0bQ==
X-CSE-MsgGUID: LWSKJXjPTUKteWN6bhTDww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,194,1712646000"; d="scan'208";a="34970463"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 May 2024 22:46:37 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 27 May 2024 22:46:36 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 27 May 2024 22:46:36 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 27 May 2024 22:46:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N9e1rJ4OiULlOxBazWc5pgwos6UvCrwUrxxtc2655/XgegBS6HUveBusNldeLOEphdbWH1eQXsEFe7+PpvPtpHcypL9/qSvj3tkvsu5cbcTZpGRx8b59H6TQ+XHPBvndVHnflznTSxyhn3VNwhcqz+uhFVpV162ihC8CycmuB2Se0eCn7pWMmJ518DFbV7JBC57565qzpWZ4CPGvR3tyaYUoQytv6UWte7vDnIBZzCe5BX6LCANtVMc6/fKPzdrwYGIAwyLug6Q2yf1gm0X7um3knVmK4blPgnW7DEIVHZ+mQL2yLQCZoABRsfTYk13y0YnknQbQc5oNpXt3wABlMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b6RFqomkV1WCnhTKR+3xYTeXhUYhyQqiChj9XHDnxFI=;
 b=Mvj5ntSf9tMd5zGijNXezsDfion69KY/gn68eiPb3jzj1dFMagPTL9LYNOV6jkVywuobE2DGSbrMY4ufsLF8PMOgar7zr/yKibyI1zdvhfRm4GGCHyGpf4wAr4woRXiurG9sLgx+yZkX9R67O1xn65USBT2gEblT80lngyazibrVRZS4yTL4kFEAZVW722WK1Le2/l1IiuoSkVY9R/e4mRhvElK7+C+uR8yGcLGrhV/EkIDBGr6DuI0zs1sTrXLgavF/MF1ZdvGLxJuiAsRTfAgRnFPp2asIT/Cns863Otz90W2Ww7ald6u5nKKyeJ17Y+bmzuyykcODnrXflW7MLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN6PR11MB8146.namprd11.prod.outlook.com (2603:10b6:208:470::9)
 by CY5PR11MB6235.namprd11.prod.outlook.com (2603:10b6:930:24::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30; Tue, 28 May
 2024 05:46:29 +0000
Received: from MN6PR11MB8146.namprd11.prod.outlook.com
 ([fe80::3bc7:767d:bb72:a6d0]) by MN6PR11MB8146.namprd11.prod.outlook.com
 ([fe80::3bc7:767d:bb72:a6d0%4]) with mapi id 15.20.7611.025; Tue, 28 May 2024
 05:46:29 +0000
Message-ID: <e33226a0-f0ef-4dee-9ac1-3778c3a61829@intel.com>
Date: Tue, 28 May 2024 08:47:13 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/17] drm/xe/oa: OA stream initialization (OAG)
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20240527014333.603914-1-ashutosh.dixit@intel.com>
 <20240527014333.603914-8-ashutosh.dixit@intel.com>
 <0cd6f261-2345-4cc5-b95c-b2c28dc79fa5@intel.com>
 <8734q2pkus.wl-ashutosh.dixit@intel.com>
Content-Language: en-US
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
In-Reply-To: <8734q2pkus.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GVX0EPF0000FA8D.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:4:0:b) To MN6PR11MB8146.namprd11.prod.outlook.com
 (2603:10b6:208:470::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN6PR11MB8146:EE_|CY5PR11MB6235:EE_
X-MS-Office365-Filtering-Correlation-Id: 45e7d1e3-b010-4662-aa7b-08dc7ed9859e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TjZVNCt2N25uaWdvSVA2T2ZGN2tQOXZDbjdMUXAwd3NXekJjMDEzMFl4YWpJ?=
 =?utf-8?B?NFNQejBRZmYxNFR0ZmpTYTZZWUJLb1FhOUJNMjdCbTk4N0JDSjV1S1dpVVdV?=
 =?utf-8?B?KzFFbUU5RnhRWFFnMzNRKzg0cytwUlRJaisySFZjQjRkd3ptU2M0OWEyRFlV?=
 =?utf-8?B?cWhxZDUyb3c2TXhBaWZQMzNrUVNsQjFRNEpDYkI4YmtUNHF3bnBjSW9ma3dM?=
 =?utf-8?B?OFRGQStNMVE1VjJlaWhYNGRrdUROOVlhcHcyMktJZEdiM0FucVAxOU55bE5U?=
 =?utf-8?B?MnI5czhNaTFMcm4rWkx3Yjh2WUdEMXExNmpGcGY5aFJIeVN4b0VIcEJKY3ox?=
 =?utf-8?B?SmxCMEFaZUUwa0ZVZVNrOHQ4WVBiWnJvYnppdnc5ZkRPYXJuR1NSekJiQ2JS?=
 =?utf-8?B?MjBBdkowU0dBK1k4R0FkbEwxbEdhSWgvZ0RaWm85TUh2ZmZXZ0pTbVp2UFRG?=
 =?utf-8?B?bDNlUmpkdEdhRm1IcmEvTlhhUTBGd0JIdHJIdTIzcG12UVhmNXpMS2daU0VG?=
 =?utf-8?B?REc3MXVqTW8zeEJaZ1ZvTS9hTyt6OEtrcS94MFRxUGJDVTN1c1NPUWkxVGRL?=
 =?utf-8?B?YW5mVmJ0VDI0YjhQdEw0MkF4MkRzY1lzTWY1WkxGNmhZVFFQQ1hvZlQ4V1ps?=
 =?utf-8?B?eHAzN2psUjBWd1lBNlk5UEt3NmpOZTBhYmhZaE5hZHdrMUVDSk9sSEswdTFs?=
 =?utf-8?B?dUQvV3d0NkRzUWxXUmNyY1g4eDZCeEduWmVDeHdta3RZT25mUXJxeko1N20z?=
 =?utf-8?B?OVR0SXIyTGYrMS9vL0Y3VDFEMEJ3U1VvUW5BOHgzTUlDYnIwcncrWjNQSzU5?=
 =?utf-8?B?NWlIOCsrTUdaZ0pEcjVtYVo5b2VDbktQRFNha3gzVTJZZHdpTUxJY3E4bXI1?=
 =?utf-8?B?b0dCNWVTZndGVXpETUdCMlhSSGdhWVBvQlZTYmMyUTV5bTZQMVYza0I3aVNM?=
 =?utf-8?B?U2JkZ3ZhNzVCVS92K0Y3M2xTQnI0NjRRc0haM3pEOWpBdCs0bmlzUFdWcUtU?=
 =?utf-8?B?Z2hTMTJmYm1MMFFvR2hMcWJ2clZCendFNU5LY0hGTHlRY1l3UldETFVVOVg4?=
 =?utf-8?B?TjZhKzkvK3B0c1hEc1FHWUFBc0Fnb3NtdzlIR2x6WWZSSUxLazJONjA2SHRY?=
 =?utf-8?B?TnFxSGhzNXRKbnRBODVrU2xHLzNWcHI3Z3dlWGcyakkwSGpESzY2ZmhNMWVp?=
 =?utf-8?B?SlVwZTkvL1loK1B0dzNNUTVXV0I2YVIva3lWaTVNaXZ2ZHpPaGZKbzA0dTE5?=
 =?utf-8?B?a05uZ0w5Z3pLQ29qWTB0dmxhYWdNOGRwWnhXdlZDKzl5ZUdvcERJdUladHVJ?=
 =?utf-8?B?SGJ6TTBJMStiRVA4NllsV3cwVzNmT080MWVTM3NORlhZQklUMEVBbnlRa0x1?=
 =?utf-8?B?dFhrbHltM0JiSVFWaTNFWHpXNnZtaUZlekpzRkU4QjNYRjJxaFBwTGI3RHkr?=
 =?utf-8?B?TEFyZ3p5N1ovU2w1OG04bUh5WXl6UE5SV1B4UE5RRGF0bkxVUDZkMEdJSHBC?=
 =?utf-8?B?RVNxczZvTW1MZm5Vck84emhVTlliM2lEd3haSzFqUWp1YUVEL1U2RnI4U3VU?=
 =?utf-8?B?Wmt4UXh6YWg1MjhzYk1teEhhT2NqWlMyWmg0Uy9vUnpjUG9iODV6OFJRRWxE?=
 =?utf-8?B?eE9oVmpaVGtCbDlYQ2lyVmR5YUNPVlhHS3liQTZiZXdPNFZlWDBYelNNZ2NE?=
 =?utf-8?B?U3Z1UVpTS1JpRWlLUE84WHRYbFZiYlBHK0xwVjVoSzc2alIxbWU3UkhBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN6PR11MB8146.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WGRpUE1qY0NJZDJMVU1SYjd1ZzZ4R2VDS1VwQkRrcVUrS2VsejI1NUdYSi9M?=
 =?utf-8?B?YnY5K0dFUDNnL3VhUUtsMDdZTlVqdEVMMmU0bnZQTjRhblVJZ1pjdVcvTkxv?=
 =?utf-8?B?RGs3VkdxWldtbTF3THpjcnQvNFI2T0VyZ2tLQWlqSXBGMUxERnUvL05YYy8w?=
 =?utf-8?B?YVpiTDRVU2wvN0NHdU1lM01HbnpyVWFzOGdjYXQ2OGJWcVcydVM3c2V6TDNr?=
 =?utf-8?B?UVBwTzhxMFhGZnZvazJSYVVSb2t3UzI3aWVlS3BLQ21RNjFxeEhjbHVtcGFu?=
 =?utf-8?B?SCs2a2E1blNGaDRwUndNbSs0ZFdyT3J4K2cxejV1WDhKRjQ0djQrNG5UOURD?=
 =?utf-8?B?cDBwWjlBbXlTb0JlSTlIclJQL1Z1OVN5YlZsTXBLSXFBdllWODBtQzZZOW9j?=
 =?utf-8?B?cHUzMFJzVktoeFZxWU96WjlXRXFITDVUeHNrY0tkUVVXU2Z1S1ZWdHRJNjEx?=
 =?utf-8?B?RXNLbUtHbE9XWVV2cUhWdTBVU29yc0EvOFlBYjZkM1Q4am45cHlIVHBJMXl2?=
 =?utf-8?B?eHZRN2lWTmdBenFTYlU0TUNGQy9JVHgramZxUmNNNmQwWnRDVFlNWnpjTWNH?=
 =?utf-8?B?akpxRkw0RmdZa0pWcGdCSGxzeWpuWi9jeEVnVEdLQXZ2cjFUOGkydy82dTNP?=
 =?utf-8?B?WFVBYmFGakVtdE5vWUYrbDJHdnlsbE56M2ZkWVNhWnlTZTJ2TDF0MGxSMmFz?=
 =?utf-8?B?K0EyZXY2Wk1rc0IwWCtqL3dVVURob0xHa2JFS0x3OVZmd0VLd1RQQmlzM2hF?=
 =?utf-8?B?RVY4RGZmeE5PZDNrT2d3aEtyNk8rWHpHWVhEY0NpVWdUY1ArQzFITzN3STRO?=
 =?utf-8?B?YzVKRHd2MWNkTUdkUFJkZmZ4dkRkeEcvQW9hUUlxS0UyU256OVFGdnA4VWpw?=
 =?utf-8?B?ZTk5N1M2OWFKbEI0ZEFPaGt6dWtvV2c2eDZiM2VCTTZHeFgzOWFSMlJJUUtP?=
 =?utf-8?B?VDB1Z1JaZ2JFZExqRUpJN3pUVU1WSmcvL0ZiOGx1ai9UckFtV1QrNTljZlM1?=
 =?utf-8?B?WDF0SWxEbWt5YlJOQlNxcTgyQUpmZzVvTHIyWE12Vjhhc2hGWUFlS1J0bHhv?=
 =?utf-8?B?MG80b2tJWTA5TzBlSUVRY1Fna25Wa3d0OXdwbnZkbFdVRTZheGpxY2pTWkl3?=
 =?utf-8?B?SDF5Z3Y1Q1RYdTZpVkI5ZHNvQnF5NTlyN2RVMGRzL3d2YURVOFRvd2VXLy93?=
 =?utf-8?B?V29Xa0NYWElId0p3d3VVUGkrUFdFalhMZWl4MTY2dEhWakhFQjBIN3dMOFFq?=
 =?utf-8?B?RDQvbjB1NFRUdi9KRFRkSlhJUElXZjJvZk4wWUs2NFhQYzd1U0RZN1JvNUxR?=
 =?utf-8?B?YnBNdTB0V0EyR1F1OHdJUytzeUUxZGpYbWgxZ1R1NHJOcE8wQ05mdkpWSjVw?=
 =?utf-8?B?cVduME1vYzVlSlFZczh5YVl6UzhaaXFxZ3lheGZjTkYzcUlDY2tXdTFnakxx?=
 =?utf-8?B?cTZyM09DNHRPQTdGSUZWWEF1TXczL3pwdDhsN3YzYWJLazBlRGY5emkwSEcx?=
 =?utf-8?B?TE56R1hoVVJvbHR0dEVDc294YjkzSlRkNktOQWR3UVN1a2V3YWJlVG1KaXZI?=
 =?utf-8?B?SW5odC9UWUZFWkxvUmc0V2FSVVBCSTdTRnR2QUhFbnNVRmFmbUpmczZoVDFq?=
 =?utf-8?B?QU51WHFsY0thbDhmM1B2bmJ2Nk91RjNRWWxvWGN3Q0huNHd4Y1lqOXJyZWk3?=
 =?utf-8?B?MHJGMXZhblRneFZmV1JBWWhaVEU5T3E4ZUtMSnI5WGVrZnU4YlIybVRDQ2xu?=
 =?utf-8?B?Tk9XamNzRjMzYnBlS0VETGJpVHdQVTZ6dkhQNEJOM09hTXF4WjAwdnZFZnp6?=
 =?utf-8?B?NE5hMFpIRFA5OE40eGc0cldxSDhTTzBFUDZJY2JVRTF1eU1KQzlhV3V6KzVI?=
 =?utf-8?B?R1N5ejJDMkdGK2xuVVM2Mk9yN3JkMmQrV0V2L0swWWNGZXQ1aFlMUVFKNFAy?=
 =?utf-8?B?U21BcjNGUlRFMCt3b1BIRHB3RXNGdG8zMVNRc2dCTnNFZ0dzSVBRNlBwYmdX?=
 =?utf-8?B?QUlIUUdNd1pGRXNQcXJIMXpKNUdYUGRkeXhzSnR0d1U5dmp0VStKWHdVWDNB?=
 =?utf-8?B?SnAyVHRQZzlLYWYxTFQ2c2FiQVdyc0RJZEtTNFF1YkNIeVJwMlVNZnVaUmlC?=
 =?utf-8?B?R1pSZDY4ZytWWmZhTzMreWJpaCtiWW40QXd4dyszcVplTEd1cXRUeUFUdFB5?=
 =?utf-8?Q?4GLfSHamORDqLyLUdxXqf1k=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 45e7d1e3-b010-4662-aa7b-08dc7ed9859e
X-MS-Exchange-CrossTenant-AuthSource: MN6PR11MB8146.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2024 05:46:29.6422 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H7rmrdv0exqIEUO3qolVrI3ahpqtdNaEF+viJ3PHkdX0GdB+Ayqf64kmOv2rlB74ZRbT4hd/1DnDo2CJtsXjDHyteSVS/O6lMTZAHQsCnJ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6235
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

On 28/05/2024 08:27, Dixit, Ashutosh wrote:
> On Mon, 27 May 2024 00:04:21 -0700, Lionel Landwerlin wrote:
> Hi Lionel,
>
>>> +static int xe_oa_stream_init(struct xe_oa_stream *stream,
>>> +			     struct xe_oa_open_param *param)
>>> +{
> /snip/
>
>>> +	stream->k_exec_q = xe_exec_queue_create(stream->oa->xe, NULL,
>>> +						BIT(stream->hwe->logical_instance), 1,
>>> +						stream->hwe, EXEC_QUEUE_FLAG_KERNEL, 0);
>>
>> Hi Ashutosh,
>>
>> On i915 the changes of configuration were pipelined in the application's
>> execution just like any other submission.
>>
>> Creating another queue completely unsynchronized from the application's
>> submissions makes this non usable in my opinion.
> As we discussed previously, the plan here is to provide a drm_xe_sync array,
> through stream properties, which can use to synchronize OA programming with
> workload submisson.
>
> Would that not work? If not, we can do what was done in i915. But note that
> i915 still has unresolved hangs, which I believe are due to the spinner
> running on the application engine (iirc repeatedly opening/closing an OA
> stream will hang in i915, though it could be due to other i915
> complexity). That is why thought using drm_xe_sync array is both safer and
> more standard way of doing what we want to achieve.
>
> Basically the output sync object will be signalled after registers are
> programmed and also any additional OA programming delay (which is
> implemented in i915 using the spinner).
>
> This would be done both for OA stream open and changing OA stream
> configuration.


Thanks for the details.

But it's not what is implemented here.

Just letting you know, because we cannot use the current ioctl because 
it doesn't behave as we expect


-Lionel


>
> Thanks.
> --
> Ashutosh


