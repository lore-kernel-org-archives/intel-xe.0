Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7316CA0FF6
	for <intel-xe@archiver.kernel.org>; Thu, 28 Aug 2025 21:19:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F74410EAE1;
	Thu, 28 Aug 2025 21:19:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hcozALHv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D36ED10EADD
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Aug 2025 21:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756415964; x=1787951964;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=LzpD/pVVCYCASbBeu2vVglOcjQo1Qxx0GOkSSjBjaGA=;
 b=hcozALHv23Yr1hQtt78xrB7+Vuqe2nbOtv1cijihhSewa9UgwsZKl0wv
 m+gX7oM3eLEDAag+IbFej7U+W6MvjH1gGfHE5zKX+GR/cnq4kgYlLHWgI
 6YZpnkylr+0e2cJHq5z96TvKVNH7ykvOVHBShpoY91nNEAtyszaAgdUem
 hYJkNkWAsrZykw3bKi0F2p2PMr0wcH6jvcbrq3OFcOLIqb949IisrfYuJ
 1xOTW/usxtQ7R9JRDiZYgEHNFdYVaKRnKQKUqZP41fiLQVc2VKMB1Bdlq
 JSCXpp1OlfTz57dTV7pQakrYZ8zKMMZxn0ziH8hQ0xqeNwWbkMTd1KHBM A==;
X-CSE-ConnectionGUID: imuhcFfxS6qhyP68xuTxtA==
X-CSE-MsgGUID: cWwwFF9pS/OLIRzcjRYHUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="76299048"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="76299048"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 14:19:23 -0700
X-CSE-ConnectionGUID: vuxmNBBsSim5c5aAAwhL2g==
X-CSE-MsgGUID: eZiLH+lxSsqPfIoPh4GVaQ==
X-ExtLoop1: 1
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 14:19:23 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 14:19:22 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 28 Aug 2025 14:19:22 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.44)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 14:19:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T0JRjq7brLnTW/OMVIsOS3k/XmLpXKveM+zrIhsS+hxe5yP+e/nGwsU3ixfAhfSE+3JmL4nC4kmLxccyBkMcxyf+SmhoSiRrQo8k0fosQfH7ITVLfKwuVvDJwYpkLytK2ltVZMZv2cSMiGvnBwmnuc1PgHYrksuhuFD3OC9SeLFoDkxC1yDqk0hH+/BkDWAp3d5ujzqH44bAJIpNwZrvTK/CipS6pn8vtTrio+PmC8s3xubikWp9EoaDjuOZ/yZdq6NyQkkrCwQpsizT3zjfIyVx+dXp4Z1I6EKL4qjqSK+OgitFCjsprqb6jGu5se11qmH7VLMFg5DhXJA7ZI3meA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KW0s9YAxUxxxxP0x+DLMyoIKIlLIQX6jCPSYukgf+CY=;
 b=g3OoolXFxhNNreGuU6pHXjEa432I1NAphEIQz/C5OjlnwW6znqcxw7cPykaASs8Sen1+L22FPcgH3PICNIIKt+ap/27DXsqhFEKm9MTmJd3GIf6sHE4v6CXYI5zhszKXSeSaQVK7NxV/CI2XOMDrm7n9j+buPbCeqgGpYVtaTZtoFton1CoiNGngbBOvnCqIZ7n4wC77hx5Q36NzeDWsBB+AemE5ZwUNZvq4CrQW4lpl5SwUztUdRVOX1lL0CzjQuH3VepB2xNYNFWuM2aAaLGDew3YD5gu98k1ng4wpIUnMMcg5+APjnHAE1iMitvnCyWwO1dCTbff9p2bLc1quIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by BL3PR11MB6481.namprd11.prod.outlook.com (2603:10b6:208:3bc::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Thu, 28 Aug
 2025 21:19:19 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%5]) with mapi id 15.20.9052.019; Thu, 28 Aug 2025
 21:19:19 +0000
Message-ID: <a19ec502-266d-48cf-af9e-c89070799a20@intel.com>
Date: Thu, 28 Aug 2025 23:19:13 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/xe/guc: Add devm release action to safely tear
 down CT
To: Matthew Brost <matthew.brost@intel.com>
CC: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>, Matthew Auld <matthew.auld@intel.com>,
 Summers Stuart <stuart.summers@intel.com>
References: <20250828104432.23695-1-satyanarayana.k.v.p@intel.com>
 <cb231cc7-0173-4b7f-8d1d-b480ac76bb6a@intel.com>
 <aLC0oPvt1ZqgEVat@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <aLC0oPvt1ZqgEVat@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR06CA0125.eurprd06.prod.outlook.com
 (2603:10a6:803:a0::18) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|BL3PR11MB6481:EE_
X-MS-Office365-Filtering-Correlation-Id: 33a86a99-1c4e-4561-553c-08dde6788ca9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UU9aZTh2UTEwS0xMVVNTYkdXQzVmakYyQ3RVbFVORTk1MTQ4NEhCZnBsalJZ?=
 =?utf-8?B?dEJHYiszWnRRMjhZTU04UWUyU0NRMzd4VHlha1BQNDJPZElMNW1odm5WMWl6?=
 =?utf-8?B?NVBRQ2xpRENBaEVMcEhFWXhuQWN4bDg0SWQ4MnVLTjRoWjY5Tmc0emZ5anFV?=
 =?utf-8?B?dWt3eExXOElmYkNiSTZMR0lxUURwUlVReXovQW9RWkF6aVdsSThldmc5WHNu?=
 =?utf-8?B?U29RMzlWZEgycWZucG5mRjZPNFBaTzdrVE1uMzJ0RVhoV0hIMCtLZ1RwWWdt?=
 =?utf-8?B?V1A2MEVsV1pNbzMvcnVDNi8zS3d1eG93STNOUVgwcHJqVDJjSGNBTGVuRnFk?=
 =?utf-8?B?emtyZTZLQUpZMnpuekU1d1VQUC9PNDBIV1JXZTdoUDFncXU5emo0eVU0VVo4?=
 =?utf-8?B?elV0MWFxcWVMV3p0NDcwS0kyWFZ4WlhEU3ZVUUVvZURvbTIwaFh2S1luc1FS?=
 =?utf-8?B?TUx4ZHZWdE5KeXp4OVBlT2pBOCtSSU14Mm5VUGp6aTh0cGoxN0dmbmZja0pk?=
 =?utf-8?B?ZDBjNGZzbk1xei82M0o3U1VYdTkyTVVsUE1zbitkajdXeW9ML0RqbHdWQjJZ?=
 =?utf-8?B?K1lqZjMyVURPU2Rsc2Y5VUo4VE1JcjlDOHBBTUFNSGo2NFdnTHoyaE5UNW4w?=
 =?utf-8?B?VjZnWlYvdzF3TTRxMnBjOHBzMWkrOUQ1K2lRN3I3SU43YWllMkQ0Vkx4SjhJ?=
 =?utf-8?B?TzVUcVZNM2xoNUJ3ZUNiN3BrU0o0bHZlOC85aVlsd2hQVGZUc2hPc1JLRExQ?=
 =?utf-8?B?azA5UGZwc0F5NzdIbWJEaVVrMmtwdHZxbTBLOVVHd1FrWC8xYWtKZncwV2hD?=
 =?utf-8?B?eDhLRlFhcDlQMmFSY1hOQjNVOU1nNXhnUU9JN1lnWnRHQ2hqcmZ0R01rWVpn?=
 =?utf-8?B?ZEdUMmc3eVU1MVovbDBEWmlrQTVyWmpBd3NEZG1LL3ZqSnhDWFREZG5RT2hU?=
 =?utf-8?B?M2RzYnEvbFdoc2ZRamxNT21mcFRRYVFPUERBTys2ZGIrUFdkYkRCRWtNanA5?=
 =?utf-8?B?NWpwT0VjeGZENmtPT0VQVFUrOUQ2TVoyMDNDM2ltQWN1ZG4zYlJ2NHY3VDJo?=
 =?utf-8?B?c21pb1g4bXVvNXRpamk2OXM5Zm9SNHU0bzZsRWMyclFJdUFaZ3ZUVzEyeFBn?=
 =?utf-8?B?WkluOUhTMHpGbGpFdmp3bDVnVjM4V2xXN2lvUldFeCtqRDVnTGZTQjQrYnN6?=
 =?utf-8?B?SzhTZGhjRVlqTU5IVkQ3MWZveFF2bGlvcFhqeXBraE5CaU82VEw2UHlUMlNt?=
 =?utf-8?B?NUpoK0Q5ejlNUFUrS0lyckFEQzhvbTg1WDh1YURFY0hBYjRQUERzZDV0ZTZm?=
 =?utf-8?B?dERycEp1NkRUa3FQMGRpVjNGck84OWs1V1RLNGU2MWtHdlYwK0xmUkRNSUht?=
 =?utf-8?B?ek1Cd2VKcngrQkxkOXdGSFVveFdUb3g0bm9wTEhMcEVmTk1lVklPMEdnaGlP?=
 =?utf-8?B?YThxd3Q1blpOY1praXhQUlp6eUVrSko0aFM3ODB1d080cXZ3S2ZlYnhZWUJZ?=
 =?utf-8?B?TU8vZDdScmwvN045U2FhRTk5UHFLdm1oM0VxYzVSRTAyRGh3OGFrMml4M3NO?=
 =?utf-8?B?OUc4S3RzYlFIcWxrQXZxRWRjK0V2NVJyTFk1TUhCVitjU2xCenp4ZWpHOW54?=
 =?utf-8?B?bDFsMWJ2VElUYmx2R3NpZEJzYlVEaSsya2lDdXptSmdGRVVMK05aV3k3b1VC?=
 =?utf-8?B?MkJzN3ZjTDdDNE83dWFkaUNQNDU1a01VN3ZXcUZwazNQWWJSVHg3UDdKN3pl?=
 =?utf-8?B?S0loTEk1cG1UZGhucENrWGgvRWszK0NTU24xZkF1ZWo0VnZDU3FBa1I3WGU5?=
 =?utf-8?B?Y2FDVzRoL0JxWEdaeU1CaUVMUmkxc1pXcVRpTmtkVENLV1gwS2NzbFJSbHhI?=
 =?utf-8?B?WHpBQngvZFl6RHlUYWFlang5aFllSTlOVVNuQ0xrTFl4d2x3S2xuNjhqZjhl?=
 =?utf-8?Q?deSlGj9mszs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T3Y2U0c1dEVQUkZHUmpZQ1IwWXBDbWcrMXlUakQvMG9uMlQ4ZklCMTBGb3ZC?=
 =?utf-8?B?MmpXVjVVekZyZllRdlhCWmhmU0RaRk8ycHNnNk1zRGRlc3gyT29KVlJxTjBz?=
 =?utf-8?B?QzNJbE9EZFk5cE5QdktiRW5ZQUtXVllQeHZuekppRXlZU3lJWUNSRUJ4RVBH?=
 =?utf-8?B?N1RmSmZJVmprdHROSDVlanNhcXhFTCt3UCt5VDA1THUvdjBKL3ZleGpBSUg1?=
 =?utf-8?B?QTJ5OGhnLzBiQml3b1dhaFlyemFnYnRDMlN3WEY4RGJsRTZDSWJ1bUtIR1Fs?=
 =?utf-8?B?d1BNVHJ4c2szREVmV3lSWUlrWktISGlQQVhUNGFodjRkRHlrNWFXY016TWZn?=
 =?utf-8?B?U3E2SnBXYjNYeFI4OWMyVGhNd0JIOTc2VWJQSW1qeCt6N2p1K0FoSHN4UHBP?=
 =?utf-8?B?dVc1RnlwVU9hRkJaZDdnQTByajg0SVNtUTVSSkZNeFNGN0k5NW56aVJLb0dU?=
 =?utf-8?B?Zk5YVU5ETzR3VFJ4eE9nOHVnWHluaHNRV0RsVElESjhyTFVqTDhKV2g1VzBE?=
 =?utf-8?B?cDArL3ZtT0p1cTNFY3NRS29DRFJWUVRENGxIZllPRzdYdlc3RmwwYnc5TTBy?=
 =?utf-8?B?Y2hKdjRjajVMc0hvZStlQ01SOTRQSVdEWExyOEpNeWxYOWF0bjZZT0tob0lm?=
 =?utf-8?B?RnpmR1ZudGZoMnRLbUMwd2lrMWFjajY2WExKVVd1bjc4NHdCa2R1YmZ2SHNN?=
 =?utf-8?B?SHEwb1hZZWhtS3ZUNnZQODlacjBodXZhVWhGaHRpdGpRSFMySFZEUHF3bWhS?=
 =?utf-8?B?UEg2RUZwT3l1b2lpUzlIRlR0QXlvZmEvdkVuK1ZOc3RHK1ZvYTRVMTZNeDN4?=
 =?utf-8?B?NXlHUUdsa1VtVXVPSlBwTGRoSnZxckgxeXFqMU5FV1BzY3hiUDdNSWJWOEli?=
 =?utf-8?B?dWIra2ZRSzN5aWllQllER2huZHJTdUNTK2dXSUNsYnZ2T3kzbHE1SFdOOVBS?=
 =?utf-8?B?VE5DK01QdGlWMDNCVWV3YW1sNnpTaHJMek9ZRWRZUXE4ZEpPdnR0RmorWjA4?=
 =?utf-8?B?U1JqYi9FbzMrWkFCR2NsWVhzWTFod3JUVk9jUE5FVzdQYytLSjNma0lzOUJ4?=
 =?utf-8?B?YXpSbDdJdTRkNWlWZ2Y5dWVEUUVXdzlJT0dPS0Y1S2Z3NktBWlE3cStlbkJj?=
 =?utf-8?B?RDBQcWdPR2FHWmVFS2U2NHQrSi9MaE5DZU44VEIya0pVUG1rcmkrR1JHaEZt?=
 =?utf-8?B?VkNTeEpabnFyTGVTRVUrM0xmRzcxN3UwZEErV2c5d0FRSmg5dVQ0RHpRQnA3?=
 =?utf-8?B?Z1MrYnpVY1ZOVU1FQ1NVMFJsdkUwZEswS3l5MjUyZnk1R3VCMnZ1NjM3T20y?=
 =?utf-8?B?UG5vNzFSOElDZDBSRFBwN20yakVDTFVrSm83V290R0JzV3ljcTlraG8rQWUz?=
 =?utf-8?B?RE9qYTVtTzBVZ3M4cEt4Y0VTY3FNV3p5MFZucytoem0zWldDVUZybElmWWxm?=
 =?utf-8?B?SWl0QkV0dEQyUkd4TjdhSTU3TVZtSGJoRHFKaWp1eS9kTlNLK0o1Nzl5Njdo?=
 =?utf-8?B?d2d1NTZWV0UzVVMwQ2NLYWdKY1ozeDFia0xzTVJ3bit1TVZpWndCK2lKL3JL?=
 =?utf-8?B?VXgxYnZRd3Z4MEpKc0hheTJVSWtPU1BTalZ4c1F5dUM2RnF5aEcrTE1jVWwv?=
 =?utf-8?B?Uyt6QXU1S2IxUlhQT2ZVVm4vWDUreERjV05BVHhBNWh2K3FOWU5PUHJqZzlm?=
 =?utf-8?B?TzJHZjQza1Y1TUF0eStabmtXbm1SZVBaNFpqTjU0M1o0SVd4bFc0eGIrYXR1?=
 =?utf-8?B?d3JQd1ZHVFVHdm44bWw0WnZSdWphcFU5UHQ2OXlVbXFtcENYcUh0NjBxNEFK?=
 =?utf-8?B?S2xrbGZFb3g4RlNIYklKbVNabXdrSGxYYllRR1VXMEdDaFNMaUNvalBCRTBP?=
 =?utf-8?B?b0Y1ajM4TmZoNUhWckhYV1h3U0w2cHU0ZmlDdHRQeEVQejhGcFE2c1RNbkJz?=
 =?utf-8?B?RzhkTjlieGlCMElKT2owNUNoM1FkYko4RmtyQU1PTDg2NnRJUUx1cUJ5OTk2?=
 =?utf-8?B?MlYvVSthaWZ5ZkVRYXRWcC90YnNTeFFXbG0vbVdSKzM3MTN4aTBPbjB5QU1y?=
 =?utf-8?B?UFM4aWpoNVV5cDdUaVpHb2FBSWNYWkQ3UTNVWXp5NWZGR1d0RjlCMGpIb1p0?=
 =?utf-8?B?V0w2TWVEalZ0UmtMNEJUejBtSzdXWGdmUmxTUkk5cGsyNHMwUnNTeENUa3FD?=
 =?utf-8?B?Z3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 33a86a99-1c4e-4561-553c-08dde6788ca9
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 21:19:19.0105 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fd0/fWoUuzwI4KGEYIP3Gr5mza8eH0sqvdLDqOOBCkVpOrx20zwAI0qemDRQULxjD6IMZut2c5AAg6dqNPdQ3PQHDhDJ6ciL9kBiM3fJj9A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6481
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



On 8/28/2025 9:57 PM, Matthew Brost wrote:
> On Thu, Aug 28, 2025 at 07:21:02PM +0200, Michal Wajdeczko wrote:
>>
>>
>> On 8/28/2025 12:44 PM, Satyanarayana K V P wrote:
>>> When a buffer object (BO) is allocated with the XE_BO_FLAG_GGTT_INVALIDATE
>>> flag, the driver initiates TLB invalidation requests via the CTB mechanism
>>> while releasing the BO. However a premature release of the CTB BO can lead
>>> to system crashes, as observed in:
>>>
>>> Oops: Oops: 0000 [#1] SMP NOPTI
>>> RIP: 0010:h2g_write+0x2f3/0x7c0 [xe]
>>> Call Trace:
>>>  guc_ct_send_locked+0x8b/0x670 [xe]
>>>  xe_guc_ct_send_locked+0x19/0x60 [xe]
>>>  send_tlb_invalidation+0xb4/0x460 [xe]
>>>  xe_gt_tlb_invalidation_ggtt+0x15e/0x2e0 [xe]
>>>  ggtt_invalidate_gt_tlb.part.0+0x16/0x90 [xe]
>>>  ggtt_node_remove+0x110/0x140 [xe]
>>>  xe_ggtt_node_remove+0x40/0xa0 [xe]
>>>  xe_ggtt_remove_bo+0x87/0x250 [xe]
>>>
>>> Introduce a devm-managed release action during xe_guc_ct_init() and
>>> xe_guc_ct_init_post_hwconfig() to ensure proper CTB disablement before
>>> resource deallocation, preventing the use-after-free scenario.
>>>
>>> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
>>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>> Cc: Matthew Auld <matthew.auld@intel.com>
>>> Cc: Summers Stuart <stuart.summers@intel.com>
>>>
>>> ---
>>> Reviewed-by: Matthew Brost <matthew.brost@intel.com> (with #rev1)
>>>
>>> V2 -> V3:
>>> - Fixed review comments (Michal).
>>>
>>> V1 -> V2:
>>> - Fixed review comments (Michal & Matt B).
>>> ---
>>>  drivers/gpu/drm/xe/xe_guc.c    | 12 +++++-----
>>>  drivers/gpu/drm/xe/xe_guc_ct.c | 40 +++++++++++++++++++++++++++++++++-
>>>  drivers/gpu/drm/xe/xe_guc_ct.h |  2 ++
>>>  3 files changed, 46 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>>> index 37d06c51180c..ed0da4ebd928 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>>> @@ -706,14 +706,8 @@ static int xe_guc_realloc_post_hwconfig(struct xe_guc *guc)
>>>  		return ret;
>>>  
>>>  	ret = xe_managed_bo_reinit_in_vram(xe, tile, &guc->ads.bo);
>>
>> btw, IMO this should be moved (in separate patch) to existing function:
>>
>> 	xe_guc_ads_init_post_hwconfig()
>>
>>> -	if (ret)
>>> -		return ret;
>>> -
>>> -	ret = xe_managed_bo_reinit_in_vram(xe, tile, &guc->ct.bo);
>>> -	if (ret)
>>> -		return ret;
>>>  
>>> -	return 0;
>>> +	return ret;
>>
>> maybe just drop the chunk with reinit(ct.bo) without reformatting rest of the code
>>
>>
>>>  }
>>>  
>>>  static int vf_guc_init_noalloc(struct xe_guc *guc)
>>> @@ -847,6 +841,10 @@ int xe_guc_init_post_hwconfig(struct xe_guc *guc)
>>>  	if (ret)
>>>  		return ret;
>>>  
>>> +	ret = xe_guc_ct_init_post_hwconfig(&guc->ct);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>>  	guc_init_params_post_hwconfig(guc);
>>>  
>>>  	ret = xe_guc_submit_init(guc, ~0);
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
>>> index 848065a25c44..0b88cfb05e7b 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>>> @@ -39,6 +39,8 @@ static void receive_g2h(struct xe_guc_ct *ct);
>>>  static void g2h_worker_func(struct work_struct *w);
>>>  static void safe_mode_worker_func(struct work_struct *w);
>>>  static void ct_exit_safe_mode(struct xe_guc_ct *ct);
>>> +static void guc_ct_change_state(struct xe_guc_ct *ct,
>>> +				enum xe_guc_ct_state state);
>>>  
>>>  #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>>>  enum {
>>> @@ -252,6 +254,13 @@ int xe_guc_ct_init_noalloc(struct xe_guc_ct *ct)
>>>  }
>>>  ALLOW_ERROR_INJECTION(xe_guc_ct_init_noalloc, ERRNO); /* See xe_pci_probe() */
>>>  
>>> +static void guc_action_disable_ct(void *arg)
>>> +{
>>> +	struct xe_guc_ct *ct = arg;
>>> +
>>> +	guc_ct_change_state(ct, XE_GUC_CT_STATE_DISABLED);
>>> +}
>>> +
>>>  int xe_guc_ct_init(struct xe_guc_ct *ct)
>>>  {
>>>  	struct xe_device *xe = ct_to_xe(ct);
>>> @@ -268,10 +277,39 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
>>>  		return PTR_ERR(bo);
>>>  
>>>  	ct->bo = bo;
>>> -	return 0;
>>> +
>>> +	return devm_add_action_or_reset(xe->drm.dev, guc_action_disable_ct, ct);
>>>  }
>>>  ALLOW_ERROR_INJECTION(xe_guc_ct_init, ERRNO); /* See xe_pci_probe() */
>>>  
>>> +/**
>>> + * xe_guc_ct_init_post_hwconfig - Reinitialize the GuC CTB in VRAM
>>> + * @ct: the &xe_guc_ct.
>>
>> remove trailing dot
>>
>>> + *
>>> + * Allocate a new BO in VRAM and free the previous BO that was allocated
>>> + * in system memory (SMEM).
>>
>> make a note that this BO reinit is only for DGFX
>>
>>> + *
>>> + * Return: 0 on success, or a negative errno on failure.
>>> + */
>>> +
>>> +int xe_guc_ct_init_post_hwconfig(struct xe_guc_ct *ct)
>>> +{
>>> +	struct xe_device *xe = ct_to_xe(ct);
>>> +	struct xe_gt *gt = ct_to_gt(ct);
>>> +	struct xe_tile *tile = gt_to_tile(gt);
>>> +	int ret;
>>> +
>>> +	if (!IS_DGFX(xe))
>>> +		return 0;
>>
>> hmm, I'm wondering if this is good that we will have two different
>> unwind points where we will disable CT (one for DGFX other for !DGFX)
>>
>> maybe we should just reinit(bo) for DGFX but replace disable_action
>> unconditionally ?
>>
> 
> You will guc_action_disable_ct regardless if this DGFX or not.

yes, there will be action registered

but will be called completely at different time and this may
(or may not) actually has side effect on other unwind actions
that we registered between ct_init() and ct_init_posthwc()

as a reviewer I feel responsible to ask questions if something
looks suspicious - if author (or someone else) is confident that
there are no issues, we just move on without next rev

so here, if you are ok to accept that dualism - let it be

> 
> Can we really not nit pick this too much, rev1 worked, albiet the

I know as I suggested that change - we just workout the implementation

> layering being slightly incorrect. This is a clear issue and I hit from
> time, customers can potentially hit, it would be nice to agree
> upon something soon.

this should be the last round ;)

> 
> Matt
> 
>>> +
>>> +	ret = xe_managed_bo_reinit_in_vram(xe, tile, &ct->bo);
>>
>> hmm, maybe we should assert that CT is still/already disabled when
>> we do this re-initialization? near the start of the function
>>
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	devm_release_action(xe->drm.dev, guc_action_disable_ct, ct);
>>> +	return devm_add_action_or_reset(xe->drm.dev, guc_action_disable_ct, ct);
>>> +}
>>> +
>>>  #define desc_read(xe_, guc_ctb__, field_)			\
>>>  	xe_map_rd_field(xe_, &guc_ctb__->desc, 0,		\
>>>  			struct guc_ct_buffer_desc, field_)
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
>>> index 18d4225e6502..16d82c0e6cde 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_ct.h
>>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
>>> @@ -73,4 +73,6 @@ xe_guc_ct_send_block_no_fail(struct xe_guc_ct *ct, const u32 *action, u32 len)
>>>  
>>>  long xe_guc_ct_queue_proc_time_jiffies(struct xe_guc_ct *ct);
>>>  
>>> +int xe_guc_ct_init_post_hwconfig(struct xe_guc_ct *ct);
>>
>> put it closer to the existing ct_init() declaration
>>
>>> +
>>>  #endif
>>

