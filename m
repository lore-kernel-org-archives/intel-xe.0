Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9001CE6ADD9
	for <intel-xe@archiver.kernel.org>; Sat, 23 Nov 2024 02:49:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05F5710E46E;
	Sat, 23 Nov 2024 02:49:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RZhRBRUG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C910610E46E
 for <intel-xe@lists.freedesktop.org>; Sat, 23 Nov 2024 02:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732330190; x=1763866190;
 h=message-id:date:from:subject:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JlUAtlBHlP6CG5OcYOdpYQ3wcZmPBVQl4Mzf6Fzy5Xs=;
 b=RZhRBRUGAAgFlYavkOBNmo72p/VJOvF33faaJFpHq4O1gh4nAL8PPo7h
 yvAmj+T1HMS+LyBr/DVId0Y5X89knDUKSlCrsnD1Ks6Q5TdCUxvKJO7bG
 KW4fkWZr0VYWK5KCDHGOmPBLqnJkZouDzZTBqkC1fAWMgL5ixPnrtgMNg
 iH1MEsegGPvv4syXMMIPas2DzJ6CR0j/dFrQwVNJpt7S/sClNkfVRA3ph
 BcQc1adaSmFVmdEp99PtEu6SSPON5+jB9uvQFPPXkhnqaWUg/61x5lzSg
 ogCbufI7eKfEmD8fFTkcfK6Q5JOKySMRdrSV0NpC5OMPbJDgp6jwsFh8Z A==;
X-CSE-ConnectionGUID: p/zUkhO7SEWVEKrSPs45Vw==
X-CSE-MsgGUID: y5avv3cvTxOEcLrVOeMUoQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11264"; a="32427738"
X-IronPort-AV: E=Sophos;i="6.12,177,1728975600"; d="scan'208";a="32427738"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2024 18:49:50 -0800
X-CSE-ConnectionGUID: bnuvyzpASZCg6nQAnIjGXw==
X-CSE-MsgGUID: +rj4OacGRxyIhGmbmmkTkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,177,1728975600"; d="scan'208";a="121694424"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Nov 2024 18:49:49 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 22 Nov 2024 18:49:49 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 22 Nov 2024 18:49:49 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 22 Nov 2024 18:49:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xw7TQLAzK/MUtpmp2RDvcoAxhkGwZ0qB7lI2qx6nIYqnbfyf42fYg+v5a2buWLG+d5ag10KpuMhCo16h6BAELNxTkjKcO5M9NJrjl/4uwJJR6X9jSa5Qq9uHJBGiXKBEe4GWTZ+xWmDF+31PqHyt8iIh7VfBhtWvkk9xi60Uvn6OacN5FE8Zw+PCWDZWAmRgg6b1heERYB5g7N21R9TJZK+ND1zkw9wQQLeo90q6GONypYEfhtXTqt4czyBU0WU59gkWAuX4Yx1HrxH8vajNDRyvUW0JCs4SMaeEytt9lW9t6GRFT9dZD1rL4GrvDjB82MfEBOE0eP2rXzfvZmRW2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eZXRbalZGbnYaU03MV0jmzUmtyKzenHrDvosArzOXLc=;
 b=f8kIw1BzDuklwtK6Vod1yzk/nX5RF5u7vaYZEbA4tPU74Ms4Lxq8a7RPCGDbhKQNy0pgw2+7/oEl6d/ZSOFccJvJcA2/zxR76lWlFqOZfchoSRMCkuzbWVzUqdYmSVOTHyd8lntBAMbo2sn7sdXRX/w53eBf9DDW3ZroMj0T9oVtzvy99TvlTr5E1cOB7Oiirrk4PlpWqzPS/G5Lc1Fve0S3wlIm2LZZdKol2ZtMkSV7MIK/kGgDVFJyCAUA3SiC5tL0oZslfGz0BRjGcLhpNyHp8IJttsxbS9YCzQ8+dDg0KHE/fyaQ0afQ0n2q7PIE+5ss71f9ELAeyqjJJNUR1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6714.namprd11.prod.outlook.com (2603:10b6:303:20f::20)
 by PH0PR11MB4824.namprd11.prod.outlook.com (2603:10b6:510:38::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.18; Sat, 23 Nov
 2024 02:49:45 +0000
Received: from MW4PR11MB6714.namprd11.prod.outlook.com
 ([fe80::e8c7:f61:d9d6:32a2]) by MW4PR11MB6714.namprd11.prod.outlook.com
 ([fe80::e8c7:f61:d9d6:32a2%6]) with mapi id 15.20.8158.021; Sat, 23 Nov 2024
 02:49:45 +0000
Message-ID: <2b9054d9-3937-49a0-a8b2-1e2443961764@intel.com>
Date: Sat, 23 Nov 2024 03:49:41 +0100
User-Agent: Mozilla Thunderbird
From: "Lis, Tomasz" <tomasz.lis@intel.com>
Subject: Re: [PATCH v2 3/3] drm/xe/vf: Fixup CTB send buffer messages after
 migration
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
References: <20241116021238.2486287-1-tomasz.lis@intel.com>
 <20241116021238.2486287-4-tomasz.lis@intel.com>
 <25aad7d7-39c2-4e5e-b504-8ef6d59b8439@intel.com>
Content-Language: en-US
In-Reply-To: <25aad7d7-39c2-4e5e-b504-8ef6d59b8439@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0007.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::11) To MW4PR11MB6714.namprd11.prod.outlook.com
 (2603:10b6:303:20f::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6714:EE_|PH0PR11MB4824:EE_
X-MS-Office365-Filtering-Correlation-Id: 250f10cb-c467-4c5f-3b9a-08dd0b697d0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UURuRVVETzVJeVdBcFZkYlpUZnhzOHIrVE8rMzZNYXVaYVlBVDhudENGQlI3?=
 =?utf-8?B?dFVCMTNEUDBjanRsb3NNQ0RlZHFGWTBUUmFIZ2hxRUJQd3RRaFJpWTJxajZ0?=
 =?utf-8?B?ZGFUeXZDY3J0dXpYdlFjVlRTT3NJcGZrRGJKRnNvZGlRZVhodW50cWZtelRr?=
 =?utf-8?B?c0hGWXRWck82M0VwSzJhSEszb1NlVk1INGRJVGd4clgxSmJQeVpsSEVSaUJh?=
 =?utf-8?B?RnNmbjZnOE5kdWtheWxvOVp5R1pNRTFHY0psM3hqOVhMUmtCOVVvTWozRTRN?=
 =?utf-8?B?MU9NeXVqWk9VeXhmUnVTc25pYUtvOCtteG1SZ2JGc3hCdDdpOVZvSTlrSmI4?=
 =?utf-8?B?VFJid25uWXBxNFB2OE1pdktEc0VWZGFKMFluNUtrWnhHUVNGNHR2d1hGdXRE?=
 =?utf-8?B?Szh0d0p0UU05amlvc1h1Z24yZWY4U1d4a3lYSVEwWkJleXY5T3lKRGVzZ1hz?=
 =?utf-8?B?MHY5aGZIYlJWa1ZpRW4yNVVhTy9Wa3JDTzFacXRnR2FsQTh5UXVvMzBxeVdD?=
 =?utf-8?B?YVlDY3lvMVEyeVhLbHhKMjJ2dmVjTjBxVVpuUk9hSlJPZEo1TGhtdEVjemY0?=
 =?utf-8?B?Ym54ZVVqeVVKYkhUMDZ3MGtpM3VuZ2J2OHRVZXJZTzVtMlRYTUdYdWU1SmlL?=
 =?utf-8?B?QnNCUERFUFRWaCt2N2ZlNW91dUhXNGRUVXNLU2o3Yk14YWZ5N3RVaUR5ZlJy?=
 =?utf-8?B?OStJV1dBSFZZMkRiS0o1U09BRGlwMzE3eGxQcFJxNzA3dlBvcTJGWVlXYTVK?=
 =?utf-8?B?b0o0Qk9yMUptcWY5YzhSZVcxZERYTi90MTNudjgvcWVlQjVEejdSMVBtUnZw?=
 =?utf-8?B?d2x5Z1BzSjNSVnMzam9DVkFEbkVpM2xrWGNVUG40QU9ZQmZmWHZ2MllXT2s5?=
 =?utf-8?B?aGVJR1NlVmhQRStCMWdUNCtBSS9jSDFNZXdPdmFlVWFNSkFlMlBLTEJDNFR6?=
 =?utf-8?B?RUx5NkpieXRCTFhEeVRrV2d5M3R1UVp3WitzbUExVmZmVXZTQjFhTkozYjVk?=
 =?utf-8?B?bmlySUxTMFVHcmdjengwbkttbERWNDMybWlLSWpBaXl0ZkdWSFFTWk1ndjRG?=
 =?utf-8?B?cFpUc0NDTHlJMEFPRDdBSzRrZk9Oc2R5K0lQbkZLQmd4M3BpWmxlanpiSmJq?=
 =?utf-8?B?RmdqM0wyRklrNkg2UDErc2oxdGNmY0VFTTRNZGtFWC9lTlBJNGg4M05meWUw?=
 =?utf-8?B?RG82Q0x3M1lsZEhsVmkzK2FtWHViUXRoWndyeUhoOXRnRWhQY1piTENMdzhr?=
 =?utf-8?B?T0pmU1pOanJWajYzcEpXMmpPY1hlK0lyejZrWjRrN3FkKzFHWG9Sd0ZNUmd5?=
 =?utf-8?B?OFBjL05yT3B4dnp2ekRUSGdCNUtsWldrTWZJeWRSK3dLcjJSaTJodmQ1WnNK?=
 =?utf-8?B?ajZ4TDZKS2l2RkhNMXlSV0pIZmpsZmxqSDNHVzk1TFNKNS9KZUNGNHZSRElw?=
 =?utf-8?B?Wk9OeVBFdGIxcW1DWUNGVkRKbVhHeU1mc2t2MWdvZUdvWmxNUVFnOEZDTURl?=
 =?utf-8?B?REkybFI0RXBlY0V1T0JmRFZFeWN4Qlhrb2R6bjV0M2V3R0phanlxZ1dsdE94?=
 =?utf-8?B?MHg0UkI5NXVFTVZCazhVdUFBcFd2R08razRFa2NuWEVFVGMwb3JPMENqQTRm?=
 =?utf-8?B?R0VFM1dyV3dzNU1idkZjbUNac3I0dTllSk5xelZuS003Wng3akkxQUNxZmMz?=
 =?utf-8?B?QUlyWTFDcDVCTkViL1h4ZHB1bUV1RGs5Z1pMTDQ4S25FUTRMa3JnMW1OVndu?=
 =?utf-8?B?a3FHT2VCaWNPRHI0UWNYblh4WjZSNDR2dkxvT3lzMEJlTXZQZkpHTUdzSkI5?=
 =?utf-8?B?K2kvemVJL2ZJOFJhNlljZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6714.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eG5TVE9vWVdDM3poTmhpdE5nK3Z3U2ZGNkJBN3huY3NZVW5xYzE2dmY4TnJK?=
 =?utf-8?B?SWR1aFpKNEF3V3E2eVhqNHRFSSsyUnRUY1NoeC9jWVVDN05UTDJtamdvRVZ4?=
 =?utf-8?B?VDN3bUpLOFA1bEJwN0IyNnhmZlZiM0tiR2VvZ2hyamJkNGhGZ1MyT1hrYmVn?=
 =?utf-8?B?UUl5LzNGeHdub0d5WnIzR3pVZk9NZjl6NzFaOVNuWUNyOG9wVGJiZHpJZUVP?=
 =?utf-8?B?NS9GbC93TVdQRDZscldtdkZSZVpqaVRqaHY4SDRJbG9vN29DK3Nid1FzRVpF?=
 =?utf-8?B?T21MTnNZZzEzYndiNXFHVURoQzk5emlsSVFpMUxSTnpEam1qQm1yRmFJOEpu?=
 =?utf-8?B?T0svMXJjMjRoalFzYmtQZHIvdjhGcCtYTU9tSTBQL0phY1B0K0FrWTBUTThh?=
 =?utf-8?B?WURteHZEZGYrUE00dDhUN2Z4ZXF3OVZ0VFZXdHREcVRFUzJDMzdYVFVZSlBo?=
 =?utf-8?B?QTNORkxUbG9aWDN4OUZoWCtZU3gwMFNTUG1sdHN3cWQyeDRnTE5FRnRJZTJC?=
 =?utf-8?B?U0E3dUFTVUl0bHFncW9PcGdBaHpybWZEWFowUUlQaTZtb0dEdmx0aVNocDlx?=
 =?utf-8?B?OUk0T3h5SUJ2WDVSK0JleUU3VERUWFA0QmJRdFhoMzdRSnFsSXphR1JwMU5s?=
 =?utf-8?B?cGU0K1o5YmdWVXJ5ZkwxZThPOFFpMkZVYjJEUVloeHdCSDJBVnhhaWpvY3ho?=
 =?utf-8?B?aXNKdlZEemlkZkxPdzBrUzV2NGl3bDBnZ2R6N0Y0OGJERC9La2FNaFVDSlR1?=
 =?utf-8?B?SzkvL3hCNUhNWkQxeWh1MWNJUGNJblRFbmJ1a2xJODlQVWtUSWd2UFkyMkZN?=
 =?utf-8?B?Sjg2SVIxQ0MrdmkyK0NzNlB5ZFIvWCs1OEQ0Y1pNdmtodTlTZjE2blNJQUww?=
 =?utf-8?B?eFBOZWNIaEdCM0RRbTlXa24rVU1JMjQ3Q2c4U2hFMXFLd1B4emFobkJKOGlG?=
 =?utf-8?B?WWEvWWovRFk4SUhkUHVSem9oTUJQeEQzK2VSV3pWYzFVU0VGZ011dlBnWEtt?=
 =?utf-8?B?c0RURHQ2TDdhdEQzaTA4ZVdoeGhlcmV3cnBtUXdydHZWZTNtT2ZqR2EzUVVB?=
 =?utf-8?B?MzdNRWtod3ozWFdDdGR4bFFMMWtnUW1WckhiSVRES1R0T051cVRkNEE0RzJP?=
 =?utf-8?B?NmpkdGRqT05DdHBjV282bWVNZll0MUxPZWJNd2t2N1RsYmkzZ2xtK1lPbEpW?=
 =?utf-8?B?N3FQWENzWUM2Y0pOZWU3Zy9MZlRERUtzeFByWlk4RUhUQmNTRVhiVUNNZ0cr?=
 =?utf-8?B?cHEzUnhiQmJSUG15b0lEZDZ0STZaR0VHVWlEdDhNMVIvcHpsRzlBd3JhdmU2?=
 =?utf-8?B?VXd0ZkdSYXZYNVIxU2FqWjBFb1pUOXoxa3U4aDhIOXVhRHcrM1Z5UGpLdVh2?=
 =?utf-8?B?dHJCSFI2MWcwZ2FGUTFLeUs5T0hPVmZ2MlpXQWlDdENrY3lHUDJjbjRvTFNu?=
 =?utf-8?B?V2tSem9lRDRFM2wyaThNVE81VWhVeWlHajhKNWVvRDhvQ1o1NnRGREcrMWpW?=
 =?utf-8?B?MlFKcGdCWU84dm91d1M4YVBrYXdnSURtbmliOVRheTEyYm1lTHVvVjVDM2hR?=
 =?utf-8?B?VWFiaTc0TnptdXBpcEpOTVFxQm14ZkFYZzlsSGE0VzBGOXIzSk9qTStWT0lZ?=
 =?utf-8?B?eTBpUlZYbi9ZZnR2T1hVOEc0eS95SCtWWmNJTEhOVFJST0t1MnBCZUFpU3hX?=
 =?utf-8?B?SVRDZHJtRTFjU01rVlhkb2RJOXk5OGxhaFRONmxKY0dMMGJqbE5TRm4zMmh1?=
 =?utf-8?B?TDYzcTQ5NG5UTFROalVxaVZzdzRZb1RqQit5ZnNLMFlSY2tqdzRZV2dnYTh1?=
 =?utf-8?B?UndxbG1wSHJlSlc4R3p3ejM4VjB3SjFyenRqTzhWTGNMaklBRjVlSk1tS1lX?=
 =?utf-8?B?b3daZGJ0dURxRGdCTW5sV3NOYWVyZXZGNGFiYkNOampYQnp0dzJTVU4valRw?=
 =?utf-8?B?MmZ6QWdDMUxWZ0JvdFhCUUY5T2d4VW90M2Vob3NGcDEzdW1keTlkek1JRjJV?=
 =?utf-8?B?QTkvQlpFNlNFNjRnQlF5aVl1VnJvOUovY1RZdzZrTzNrTmhiMGdaNUsvMFln?=
 =?utf-8?B?eUlnbG9LYTNxdTFkTmcwSWgwMDI2YjAvN3pmdUJHSVBUcC9KM2U1UVBJbzhl?=
 =?utf-8?Q?DtTAQ0oTM19HC+l32k9NpQqKa?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 250f10cb-c467-4c5f-3b9a-08dd0b697d0d
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6714.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2024 02:49:45.6831 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xh8iUBW0DqipcP1VREBFSiB3gSi/6FEn2b7HHJrkPokOduueRMwokcc6kV9NHtBowOPfqfr9yiM+d2xdvGYb2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4824
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


On 16.11.2024 21:01, Michal Wajdeczko wrote:
> On 16.11.2024 03:12, Tomasz Lis wrote:
>> During post-migration recovery of a VF, it in necessary to update
>> GGTT references included in messages which are going to be sent
>> to GuC. GuC will start consuming messages after VF KMD will inform
>> it about fixups being done; before that, the VF KMD is expected
>> to update any H2G messages which are already in send buffer but
>> were not consumed by GuC.
>>
>> Only a small subset of messages allowed for VFs have GGTT references
>> in them. This patch adds the functionality to parse the CTB send
>> ring buffer and shift addresses contained within.
>>
>> While fixing the CTB content, ct->lock is not taken. This means
>> the only barier taken remains GGTT address lock - which is ok,
> typo barrier
ack
>> because only requests with GGTT addresses matter, but it also means
>> tail changes can happen during the CTB fixups execution (which may
>> be ignored as any new messages will not have anything to fix).
>>
>> The GGTT address locking will be introduced in a future series.
>>
>> Signed-off-by: Tomasz Lis<tomasz.lis@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_gt_sriov_vf.c       |   2 +
>>   drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h |   2 +
>>   drivers/gpu/drm/xe/xe_guc_ct.c            | 146 ++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_guc_ct.h            |   2 +
>>   drivers/gpu/drm/xe/xe_sriov_vf.c          |  12 ++
>>   5 files changed, 164 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>> index ae24c47ed8f8..604cbbf55d4f 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>> @@ -920,12 +920,14 @@ static u64 drm_mm_node_end(struct drm_mm_node *node)
>>   static s64 vf_get_post_migration_ggtt_shift(struct xe_gt *gt)
>>   {
>>   	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
>> +	struct xe_gt_sriov_vf_runtime *runtime = &gt->sriov.vf.runtime;
>>   	struct xe_tile *tile = gt_to_tile(gt);
>>   	u64 old_base;
>>   	s64 ggtt_shift;
>>   
>>   	old_base = drm_mm_node_end(&tile->sriov.vf.ggtt_balloon[0]->base);
>>   	ggtt_shift = config->ggtt_base - (s64)old_base;
>> +	runtime->ggtt_shift = ggtt_shift;
> can't we store that when reading new config?
will do.
>
>>   
>>   	xe_gt_sriov_info(gt, "GGTT base shifted from %#llx to %#llx\n",
>>   		  old_base, old_base + ggtt_shift);
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
>> index a57f13b5afcd..6af219b0eb1e 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
>> @@ -65,6 +65,8 @@ struct xe_gt_sriov_vf_runtime {
>>   		/** @regs.value: register value. */
>>   		u32 value;
>>   	} *regs;
>> +	/** @ggtt_shift: difference in ggtt_base on last migration */
>> +	s64 ggtt_shift;
> by 'VF runtime data' we meant here the missing HW data obtained at
> _runtime_ from the GuC/PF (see "runtime-regs")
>
> this 'shift' is more like a migration specific data and doesn't really
> fit here, so better define a separate struct for it
since it's now part of getting config, will add it there.
>
>>   };
>>   
>>   /**
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
>> index 7eb175a0b874..119f4627a6d5 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>> @@ -84,6 +84,8 @@ struct g2h_fence {
>>   	bool done;
>>   };
>>   
>> +#define make_u64(hi, lo) ((u64)((u64)(u32)(hi) << 32 | (u32)(lo)))
>> +
>>   static void g2h_fence_init(struct g2h_fence *g2h_fence, u32 *response_buffer)
>>   {
>>   	g2h_fence->response_buffer = response_buffer;
>> @@ -1620,6 +1622,150 @@ static void g2h_worker_func(struct work_struct *w)
>>   	receive_g2h(ct);
>>   }
>>   
>> +/*
>> + * ct_update_addresses_in_message - Shift any GGTT addresses within
>> + * a single message left within CTB from before post-migration recovery.
>> + * @ct: pointer to CT struct of the target GuC
>> + * @cmds: iomap buffer containing CT messages
>> + * @head: start of the target message within the buffer
>> + * @len: length of the target message
>> + * @size: size of the commands buffer
>> + * @shift: the address shift to be added to each GGTT reference
>> + */
>> +static void ct_update_addresses_in_message(struct xe_guc_ct *ct,
>> +					    struct iosys_map *cmds, u32 head,
>> +					    u32 len, u32 size, s64 shift)
>> +{
>> +	struct xe_device *xe = ct_to_xe(ct);
>> +	u32 action, i, n;
>> +	u32 msg[2];
>> +	u64 offset;
>> +
>> +#define read32(o, p)							\
>> +do {									\
>> +	xe_map_memcpy_from(xe, msg, cmds, (head + p) * sizeof(u32),	\
>> +			   1 * sizeof(u32));				\
>> +	o = msg[0];							\
>> +} while (0)
>> +#define fixup64(p)							\
>> +do {									\
>> +	xe_map_memcpy_from(xe, msg, cmds, (head + p) * sizeof(u32),	\
>> +			   2 * sizeof(u32));				\
> what about buffer wrap?

I don't see any implementation of ability to wrap with cutting a message 
in half. Rather, h2g_write() fills remaining area with null messages.

No special support is needed.

>
>> +	offset = make_u64(msg[1], msg[0]);				\
>> +	offset += shift;						\
>> +	msg[0] = lower_32_bits(offset);					\
>> +	msg[1] = upper_32_bits(offset);					\
>> +	xe_map_memcpy_to(xe, cmds, (head + p) * sizeof(u32), msg, 2 * sizeof(u32)); \
>> +} while (0)
> those macros are quite ugly and violating many rules
> maybe they should be converted into inlines?
will do.
>
>> +
>> +	xe_map_memcpy_from(xe, msg, cmds, head * sizeof(u32),
>> +			   1 * sizeof(u32));
>> +	action = FIELD_GET(GUC_HXG_REQUEST_MSG_0_ACTION, msg[0]);
>> +	switch (action) {
>> +	case XE_GUC_ACTION_REGISTER_CONTEXT:
>> +	case XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_LRC:
>> +		/* field wq_desc */
>> +		fixup64(5);
>> +		/* field wq_base */
>> +		fixup64(7);
>> +		if (action == XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_LRC) {
>> +			/* field number_children */
>> +			read32(n, 10);
>> +			/* field hwlrca and child lrcas */
>> +			for (i = 0; i < n; i++)
>> +				fixup64(11 + 2 * i);
>> +		} else {
>> +			/* field hwlrca */
>> +			fixup64(10);
>> +		}
>> +		break;
>> +	default:
>> +		break;
>> +	}
>> +#undef fixup64
>> +#undef read32
>> +}
>> +
>> +static int ct_update_addresses_in_buffer(struct xe_guc_ct *ct,
>> +					 struct guc_ctb *h2g,
>> +					 s64 shift, u32 *mhead, s32 avail)
>> +{
>> +	struct xe_device *xe = ct_to_xe(ct);
>> +	u32 head = *mhead;
>> +	u32 size = h2g->info.size;
>> +	u32 msg[1];
>> +	u32 len;
>> +
>> +	/* Read header */
>> +	xe_map_memcpy_from(xe, msg, &h2g->cmds, sizeof(u32) * head,
>> +			   sizeof(u32));
>> +	len = FIELD_GET(GUC_CTB_MSG_0_NUM_DWORDS, msg[0]) + GUC_CTB_MSG_MIN_LEN;
> is it ok to access here all this CTB data without any lock?
Yes, it is ok. The lack of lock is  explained in patch comment.
>> +
>> +	if (unlikely(len > (u32)avail)) {
>> +		struct xe_gt *gt = ct_to_gt(ct);
>> +
>> +		xe_gt_err(gt, "H2G channel broken on read, avail=%d, len=%d, fixups skipped\n",
>> +			  avail, len);
>> +		return 0;
> shouldn't we return some -errno to correctly report failure to the caller?

Why would we do this? What error handling would we do?

We are within a delicate, unusual situation during the recovery. The 
goal of migration recovery is clearly stated, and it is not verification 
of the state of buffers.

If that condition was reached, then:

* Maybe we've got double migration at a very specific time and we're 
operating on a living GuC. In that case, we should just back off and not 
touch it. (low probability of hitting that precise timings)

* Maybe the CTB was broken before migration, or got broken while 
restoring - the post-migration recovery is not a place to react on that. 
(low probability, as we check the head and tail before)

* Maybe our CTB parser is imperfect, or our locking will be imperfect 
(or more likely, it will regress due to unrelated changes) - in that 
case we also should back off.

In general, if we've failed with CTB fixups, it doesn't mean the GFX is 
unusable. There is actually much greater chance that no outgoing message 
required fixups - most workloads are not registering contexts every 
second. There is no point in propagating errors which do not break the 
recovery. And if something is broken, then we should have mechanisms 
within driver to deal with that. Post-migration recovery is not for that.

>
>> +	}
>> +
>> +	head = (head + 1) % size;
>> +	ct_update_addresses_in_message(ct, &h2g->cmds, head, len - 1, size, shift);
>> +	*mhead = (head + len - 1) % size;
>> +
>> +	return avail - len;
>> +}
>> +
>> +/**
>> + * xe_guc_ct_update_addresses - Shifts any GGTT addresses left
>> + * within CTB from before post-migration recovery.
> "Fixup any pending H2G CTB messages by updating GGTT offsets in their
> payloads" ?
ok, will switch to this.
>
>> + * @ct: pointer to CT struct of the target GuC
>> + */
>> +int xe_guc_ct_update_addresses(struct xe_guc_ct *ct)
>> +{
>> +	struct xe_guc *guc = ct_to_guc(ct);
>> +	struct xe_gt *gt = guc_to_gt(guc);
>> +	struct xe_gt_sriov_vf_runtime *runtime = &gt->sriov.vf.runtime;
> please provide ggtt-shift explicitly to avoid direct access to the VF
> data from the CT code
will do.
>
>> +	struct guc_ctb *h2g = &ct->ctbs.h2g;
>> +	u32 head = h2g->info.head;
>> +	u32 tail = READ_ONCE(h2g->info.tail);
>> +	u32 size = h2g->info.size;
>> +	s32 avail;
>> +	s64 ggtt_shift;
>> +
>> +	if (unlikely(h2g->info.broken))
>> +		return -EPIPE;
>> +
>> +	XE_WARN_ON(head > size);
> use xe_gt_WARN() or xe_gt_assert() instead - depends on what exactly do
> you want to check here
ack
>
>> +
>> +	if (unlikely(tail >= size)) {
>> +		xe_gt_err(gt, "H2G channel has Invalid tail offset (%u >= %u)\n",
> s/Invalid/invalid
ok
>> +			 tail, size);
>> +		goto corrupted;
>> +	}
>> +
>> +	avail = tail - head;
>> +
>> +	/* beware of buffer wrap case */
>> +	if (unlikely(avail < 0))
>> +		avail += size;
>> +	xe_gt_dbg(gt, "available %d (%u:%u:%u)\n", avail, head, tail, size);
>> +	XE_WARN_ON(avail < 0);
>> +
>> +	ggtt_shift = runtime->ggtt_shift;
>> +
>> +	while (avail > 0)
>> +		avail = ct_update_addresses_in_buffer(ct, h2g, ggtt_shift, &head, avail);
>> +
>> +	return 0;
>> +
>> +corrupted:
>> +	xe_gt_err(gt, "Corrupted descriptor head=%u tail=%u\n",
>> +		 head, tail);
>> +	h2g->info.broken = true;
>> +	return -EPIPE;
>> +}
>> +
>>   static struct xe_guc_ct_snapshot *guc_ct_snapshot_alloc(struct xe_guc_ct *ct, bool atomic,
>>   							bool want_ctb)
>>   {
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
>> index 82c4ae458dda..6b04fd4b1e03 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ct.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
>> @@ -22,6 +22,8 @@ void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot, struct drm_pr
>>   void xe_guc_ct_snapshot_free(struct xe_guc_ct_snapshot *snapshot);
>>   void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p, bool want_ctb);
>>   
>> +int xe_guc_ct_update_addresses(struct xe_guc_ct *ct);
>> +
>>   static inline bool xe_guc_ct_enabled(struct xe_guc_ct *ct)
>>   {
>>   	return ct->state == XE_GUC_CT_STATE_ENABLED;
>> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
>> index 5bcd55999e0e..08c789ebfa18 100644
>> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
>> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
>> @@ -10,6 +10,7 @@
>>   #include "xe_gt.h"
>>   #include "xe_gt_sriov_printk.h"
>>   #include "xe_gt_sriov_vf.h"
>> +#include "xe_guc_ct.h"
>>   #include "xe_pm.h"
>>   #include "xe_sriov.h"
>>   #include "xe_sriov_printk.h"
>> @@ -158,6 +159,15 @@ static int vf_post_migration_requery_guc(struct xe_device *xe)
>>   	return ret;
>>   }
>>   
>> +static void vf_post_migration_fixup_ctb(struct xe_device *xe)
>> +{
>> +	struct xe_gt *gt;
>> +	unsigned int id;
>> +
>> +	for_each_gt(gt, xe, id)
>> +		xe_guc_ct_update_addresses(&gt->uc.guc.ct);
>> +}
>> +
>>   /*
>>    * vf_post_migration_imminent - Check if post-restore recovery is coming.
>>    * @xe: the &xe_device struct instance
>> @@ -217,6 +227,8 @@ static void vf_post_migration_recovery(struct xe_device *xe)
>>   
>>   	vf_post_migration_fixup_ggtt_nodes(xe);
>>   	/* FIXME: add the recovery steps */
>> +	vf_post_migration_fixup_ctb(xe);
>> +
> why this extra separation line?

it separates fixups from finalization. Similarly, there's a line at 
start of fixups.

-Tomasz

>>   	vf_post_migration_notify_resfix_done(xe);
>>   	xe_pm_runtime_put(xe);
>>   	drm_notice(&xe->drm, "migration recovery ended\n");
