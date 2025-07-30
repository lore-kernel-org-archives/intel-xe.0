Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1782BC87FCB
	for <intel-xe@archiver.kernel.org>; Wed, 30 Jul 2025 04:59:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8431010E063;
	Wed, 30 Jul 2025 04:59:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nkmhROAp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FD1610E063
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Jul 2025 04:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753851577; x=1785387577;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2+HtqKItq/x0uigcOlDUQGj3cFvynesbAh2ULhg2uo0=;
 b=nkmhROAp1GYhpR/NftHgXeOcOJAuf9l8xXEoE4vOCiqWEATtYUDbJaOP
 7w9LblVvN9Wa1y24dBpg7I0FrsY84rrhwejX3R9Yjw4tCIjYJJsCmfArO
 pM6GAYczC9OjwIxxcizjW/0tnmkcPj42TEYgtRSzbq1mFeqbb7bfOMps3
 AhrxhTZM8xiYp76qfGCTPVc1+KklJ4tb+vysMSsSDTzdnQMN5UPjm4Czg
 labs1iX1m9QTy0IcAyx8Or45+SdOJjW/ccOsjObAXgEE3wdWof/6qfx0A
 Zvct+ar0DDRW2+qf8g4uZI0nH6wOupRFfmLb5n9qzC+WdcR8sgmS9a77o A==;
X-CSE-ConnectionGUID: i9t+LXsCTRa6XMgjsCIoUQ==
X-CSE-MsgGUID: vRMKx0dHRtSFp5TYxxdBsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="56009770"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="56009770"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2025 21:59:36 -0700
X-CSE-ConnectionGUID: y/I3FcDFRUiSjRX+uuErHw==
X-CSE-MsgGUID: YHxjv3KETAS+BPC177YFTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="163230640"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2025 21:59:36 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 29 Jul 2025 21:59:35 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 29 Jul 2025 21:59:35 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.57)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 29 Jul 2025 21:59:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c/4zzRh9k4xmJ25whtaz5rh1RM+85WwkZhBMhVuFr7VyAnSkwr1BFBsr0GL34XfvmX21eARCVv8BYi5CffTFUXdCOWbWlZ0NKhiVkiemndOdJVhRe/C7ud6On1UwRkVm5qwqNXIHVzrf70ZT1jzO2MoSPS9y8Yt5YrGSqqJuHd4jUPjGWWN6Nt99EpWvmM6XgI5SlNNiVImDvPB5equ4nrWpv1W/AHk2FZiq4NkkFs15RwbGzfCG2dQejRxSSXKt1m3EG0qiP5BaChJtuFlQDLCVHrBFnFe4F9w4XZE6u/0b4o1PbZsnTU1ITR926uub/xeX3F2joFPO6ZiX+65G3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y/iAB83J8PBVDgFSKt5iovFhTzXLGRpQkdDF/c8WkAg=;
 b=Woo7YYUUWd/4FIifOCe0XqAN3ZcwZb35GKy5VM9jX6gif3WhDRJFvvfGUpwnRWYbmNMdSjGP0Cu6cXwxGl1DoCyfV0jIAga8/I4OmXF8ycJUXjg040eY5bafCmyuYXhM5UjuEqgfWJVXdGlH/PyywstUg3aYkgRMEEUlNFwIxSpY+84PQb7+sq8VOz1nO/v/CUhwOq0y6+xu1R18KmNyhtZlwWzLtY3oeTTCN7G/Uec9w5nt8yeTuB6+DndwK4Tbj9blnBsGxEf11lT4Yx77mtTus7vJvGqdoqokSsOibXwkt8O06UxCy8mKaXj0o6FavKj0vrGs2gPQNeIn97AUXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by DS0PR11MB8717.namprd11.prod.outlook.com
 (2603:10b6:8:1ab::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Wed, 30 Jul
 2025 04:59:18 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::6acb:cbaa:6326:112e]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::6acb:cbaa:6326:112e%8]) with mapi id 15.20.8964.021; Wed, 30 Jul 2025
 04:59:18 +0000
Message-ID: <94b1cca7-56ab-417f-a8bc-d31b7f9b3122@intel.com>
Date: Wed, 30 Jul 2025 10:29:11 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 11/23] drm/xe/svm : Add svm ranges migration policy on
 atomic access
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>
References: <20250722133526.3550547-1-himal.prasad.ghimiray@intel.com>
 <20250722133526.3550547-12-himal.prasad.ghimiray@intel.com>
 <aIhINCpc7TIC/sSQ@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <aIhINCpc7TIC/sSQ@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0179.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::22) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|DS0PR11MB8717:EE_
X-MS-Office365-Filtering-Correlation-Id: 975fd269-42f6-4560-2177-08ddcf25d67a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MDZjMXdmTXg5Y1hMdE01MG5qcTU5bG1pckcrN1NSNThCNmx0eEdBN013dmwv?=
 =?utf-8?B?YWxSdGxrbEI0R2M2bGh1aWt4T3MrRlNKT0RhVmVYcjRTZ3pFNzdPYnJOYVdD?=
 =?utf-8?B?VjZOSWNrb2lGUXFDVHlkeGF2dC9jd1ZqNG15TFcwSzlJRDZFVmdYVSt3YlNp?=
 =?utf-8?B?YkZjT2h2MmIvYUVLenpjNEhNSlJRWFlneFN0aWw0S1hiT1FwN0F5QTZ4OXlp?=
 =?utf-8?B?cXJMVE5NQ2lMNlUvUEk3ODNqV2hrUXRnUTR3TExRY3BvbFIyazQ4eCtDOXg0?=
 =?utf-8?B?NVMrZHpISlNLOHQveXRIbGRxK2wrVFY4NWJySllRNzJueFFXb29lMGQ5MkFn?=
 =?utf-8?B?c1V2YnRlS2l6aytjMk9FMGJBdXQxa3ZwR2ZCNFhQaVE0eGdPWVhVcmJFSHho?=
 =?utf-8?B?TXU0L1dRWXZ3K1lzdVdxOEw2azEyRS9SRTdsMmtVemJ1dGZZTG1SNGhsSnhp?=
 =?utf-8?B?N0hvTjYrMHIzVExtR0licVJiNXZ2Ni9IaEwrcWVKUUR5MEUwd3V2bDVhdHI0?=
 =?utf-8?B?SmlmY1BKY2hVRGtyYVBrVkNEKzNlZDVhVUNnZmVWa3o5QUJsWDFkNnU3ZTZp?=
 =?utf-8?B?b0lZODhlRlZKQTc3dXhaK0VkcDJYM1IxRjl3clRYZFBXUitPdVlBUW1jVlBU?=
 =?utf-8?B?Z1Q1T3pLcElscDVKSi9FMnR1cmJoUmhKQ0hFekVJS3RIVHo5YlZGbnltMmR5?=
 =?utf-8?B?NmN3T2EwYzFKSEZIdHVyYnNZdk90akpXcE13WEFIempRYmNtYXVPMk80MVFN?=
 =?utf-8?B?ZFdubVl4cnZjY1NpK0ZtNFRIVVZxeFNjZ3I1WUlvdXBrM2dna2lYcnFZaG1i?=
 =?utf-8?B?akVoNHR4YW9yU1pocy9ybWgyRm9wSGU1bkJ5bmZFTUkvM2JpdEZLTnF5dWN1?=
 =?utf-8?B?M3RseEJHZGZMd2VPeXBUSU9CQ09BNU1XWTlmUS93ckEzNzdyMWROWDl2NUFL?=
 =?utf-8?B?QlpmeGZQSGNVNFlWaWtZeTRJOHU5dndrTHZTVjJZTzNhSWh4a2kyMzRrOTdG?=
 =?utf-8?B?cDJNbG4yd0sxaDV6UklOSDVJU0tyTkY4T1cvOFlUMWUrdEhmT3NudlJMdGds?=
 =?utf-8?B?UURZUXpQR1FIbGNMSktyVCs4Qkh0WEZZcEU2c2FheEFMUVluT3VKY1dDTi91?=
 =?utf-8?B?UXIvQjIyU1U1bmdCei92eGRSTE9UbmdwM1BsbG16V1lLTWNPaFh2Y3VHelFD?=
 =?utf-8?B?UWRTSU8ybTdoY2kzQ1dBNHFSdVRNaEUxUi9ZY3RYZXpmV0ZzSjhjQW9pSnpI?=
 =?utf-8?B?a2RHcGJFNmMrcmFOZW44QkcxNUFNV2M2U0lvVVJ1Z0RBekVGcmx3N0VwZEQy?=
 =?utf-8?B?azRFeUpsRmViMVYyVStOWXUyZ1RPbUdwQndrQjNLL2JvVklINlZvTGZ0TEo0?=
 =?utf-8?B?VGhPTlV1R3dzNmpvUmNhUjlNNjV2bVptQmFBWTA3b2RNQ0dVdTZzanlpalVE?=
 =?utf-8?B?MDF4ZzJMRTVaUlI5OU5BNU9tNWtkU2lNdWtjZjlMWTRBZG9JVy8wWEg1NU1r?=
 =?utf-8?B?NzhibmxQWEpFbUh4VkVOdXZYcytpYnkvTkRxb25yS2FmQy8rTE5WNzlvVFRQ?=
 =?utf-8?B?RU9nclE3OEtCcmR6MktRbEdHZXlEVmRFR0U0bmp1bno2b0x0by9yOGRTL3pR?=
 =?utf-8?B?M3FwN3paL0lxdmg3NDA3V0N1V0tOOGt3REFwaC9xNkpMZmFRVGNBRWRwOG1J?=
 =?utf-8?B?OUozNytQUGdkSkpPdFNmNE1HbTF4a3pLUnpNQ0tJb1JVT2dZaHl6eTlBOG9k?=
 =?utf-8?B?ZXRMbTFxVUVCd244dVlreHZXSFFVdGdJS2ZQSzBYc0Z3bzNwSmlEVlRsRVl4?=
 =?utf-8?B?REhZSkZmVGpDcXdvSVdWQ0dacXlVNkhvTFVCOWhkTGJkZ0ptKytEbERFK1Qx?=
 =?utf-8?B?N0ZqSnFwSHR2Z3BXeC9DaTlOeFBmY0hiaTNPdHIvbm5sSUx2MTAwc2Y5S3R4?=
 =?utf-8?Q?4kxfidPkNTQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UWFsUy93RGxjdi9ZNGtuV0tYTWNXa0c5d0dTRGJMNHNaR0NEN240L2IrSnF6?=
 =?utf-8?B?VDVVdEQwM0NDRUhMWVBseTlCdXpEWE03SlpmdUhGUG93eDVKK2RRTVcxa0lI?=
 =?utf-8?B?V2hiaGk3ZTQ5bUk1SVRZdkk3dTk4QWU2Wi91aEpOanhzY1BLbDI3SngvZElZ?=
 =?utf-8?B?YXk2dll4cjBhQlkyVjV4cmVBOGZXNUFqekE3RVF4Q2x6SUhLUFRTcEdYTEZZ?=
 =?utf-8?B?Nzk2b2hmUzdXT1VyT0ptcEdWZ1NldUFoeEJDSE9wTnA3UHYrcjVXLzVveWxp?=
 =?utf-8?B?aGx1TitBbnVMQWl6RnlkcHZqSWJGZVlIdWVPNmY1dDlaTVRHTndhOVdSbnZk?=
 =?utf-8?B?K2lkbkgxN1IxWlRsNVNOejh6WC9MUHpQQWFDVk5TcC9zRWVJTUdKUFFrNXlU?=
 =?utf-8?B?MmhQSm1oT3B6VHlsNWVQTDFOektsNGVHbnZqUE9ORjJBQmdDZ1JHNWYyS1FH?=
 =?utf-8?B?Y1VCeHhHU1krcExzUXlqc0JDei8zZW1kdVNCVW4zQjlYOW54YS85VUg2OHBl?=
 =?utf-8?B?ekJpMjg5Q3k4NUxmL25XUWNJckNtaXhLVlpKTWhWZ2h4TDZON3NmOU5qSjRa?=
 =?utf-8?B?ZjdyQmtoM0NIcVhYeGF6UVZibFdXME5FenIrSEZnWjZ6K0NxRVB4NTNPSkdq?=
 =?utf-8?B?ZTNqT3N2dTJuQUVQOGhHeldCbmw2emJvcFIxSE0wU1YxS3NPRENVYjZPRmpU?=
 =?utf-8?B?OWJsSzh0NUtIWTJqd29DelEyL1YxOUdHZEdaNTNScVlwR29xdWhodGJqcFJu?=
 =?utf-8?B?b0RBS1A5aERoTGlUelBEeXZFVDFSdlBCNlBRREFKVjVCQjRIbXZEMmpQZG5N?=
 =?utf-8?B?RWdEbmNsQXQyQmJndFIzQnBvcnl1aWxRZEdIN1pycHNCUldPZXNsU2JPSVRj?=
 =?utf-8?B?WEVBVEVRY3dDMEhUQnpnVXUwRVhockFWdFRSMkp2RXY4QlZPOXNJQnVIcHRC?=
 =?utf-8?B?YklLSEo4Q3k5VnlNaDhHYk1xSW9aV0VVSmEwTFo1My9YWmtVQzRxWEJCTlVz?=
 =?utf-8?B?aU9kOWtIaGJFTktmb09HWVZOS2tZL1ZOSyszbU1CTEk2bDM0VmpWM2p1a1hJ?=
 =?utf-8?B?SGdqRjRJZHlhMDVsMGlkMVJHSEdFeEtFeXRvVGs4T2FwTUVoUTdITTdIR3o3?=
 =?utf-8?B?djdiOUZOaGJ4Q1A5SExVNndIeC81d2FlVldQdmVOcHlhcGNWcTkyVE8xVVIr?=
 =?utf-8?B?azZmK1hqU1pDQ2E0dVlQNFA0UEJTeHFiYTc2Rjgyd1l0V21zd0ZZTElqV0di?=
 =?utf-8?B?aTU3QUxRN05ZQ0E3aFBjeEZrTlpwWjBFcnVRa0VkaHVhWGNuZHdnbGl6dlQy?=
 =?utf-8?B?ZVM5Ymx3dmJTdk5GNTJmSk1ZajlOSGZmWXdlTU5XYVJpTWhMTGRaTXBhK01D?=
 =?utf-8?B?dXRIejIrZzhybWlYYnJWUFU2UzFwRUNleUlqaUIzZDgxWFkyNlZqN2FzU0ZB?=
 =?utf-8?B?WWRUQVdZZWY1Q0pPMGZjQnNyejd4ajRyRHlQZVZtcGRKandvS1pSQUUzT1JF?=
 =?utf-8?B?bk9yOVNCQnIyTEduSXd3bTk0ZHUxRE1RRk5QamdJU2I5MkxyZnBFeWM0RWlx?=
 =?utf-8?B?ZU9sa05LUUl4Z3JGVEs5THl0SFFwZmE5ZTNVYlpYc3RQUytXczFTZFNYbUVL?=
 =?utf-8?B?TXBJUFBZTXIxT3lNc1pNQ05MNmhOMkxqb3dDZTNrdEF6U3RPZnFXbWcyY3Fu?=
 =?utf-8?B?ZE5uM010ZXc3eUFhQUhtcTRNcWVMMnFNNjJTdEJLM0VwbjlLb09BSk8rS2pR?=
 =?utf-8?B?WGFRWXlGbko0cUJJOGt4NXd6aWN3b08vU2tvMCszS1JUV0VReFYzMHIxY2c2?=
 =?utf-8?B?SDRxVDRIZUU4YUZiL0RBNGpIZzU3WWZHeDJSbHR5TmlJbGRLZXA5cmp2a2hD?=
 =?utf-8?B?ajY4NklkY0VYQXozMzVvVC9HWWNGdFJBUTk1MWVZSktjc0ZFbFp4VW9xMEhN?=
 =?utf-8?B?Zi9LRHF2TkNKbXB4eStxdWFHQk50Z1BaS3hoZ0xxR1RFc0c2NmMrbzIwOGJV?=
 =?utf-8?B?ZFA4K2xvUlJHWXVoNkdUWTMzejYyOGtRVXNmYzd5Mm1vMDBkZXNZdDRaUnZ6?=
 =?utf-8?B?VWJEcFJTNVlpWjU4ZU1qc0R4N3F5eWxjRm9DVjRSenh3d1NsSHVxaW1MTDFv?=
 =?utf-8?B?MjE4cnE5eHFLSW5zZmowNkpuSEJSWnNkTjNmRHIzWmVZNDd0NktiU3FhOWdN?=
 =?utf-8?Q?xm9YyRl58xufs+iGU+gPebM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 975fd269-42f6-4560-2177-08ddcf25d67a
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2025 04:59:18.0312 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hgXjHkulkKME7JQCW9arENC85wxikKfeL5kQIF1fAEBJ7JjeHf/mV+/EhEEGSuUSCxz3UQgdrafCnfNHCB5HQ+PDqA4I3GVtMDVsbyu/QDI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8717
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



On 29-07-2025 09:34, Matthew Brost wrote:
> On Tue, Jul 22, 2025 at 07:05:14PM +0530, Himal Prasad Ghimiray wrote:
>> If the platform does not support atomic access on system memory, and the
>> ranges are in system memory, but the user requires atomic accesses on
>> the VMA, then migrate the ranges to VRAM. Apply this policy for prefetch
>> operations as well.
>>
>> v2
>> - Drop unnecessary vm_dbg
>>
>> v3 (Matthew Brost)
>> - fix atomic policy
>> - prefetch shouldn't have any impact of atomic
>> - bo can be accessed from vma, avoid duplicate parameter
>>
>> v4 (Matthew Brost)
>> - Remove TODO comment
>> - Fix comment
>> - Dont allow gpu atomic ops when user is setting atomic attr as CPU
>>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_pt.c         | 23 +++++++++--------
>>   drivers/gpu/drm/xe/xe_svm.c        |  2 +-
>>   drivers/gpu/drm/xe/xe_vm.c         | 40 ++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_vm.h         |  2 ++
>>   drivers/gpu/drm/xe/xe_vm_madvise.c |  9 ++++++-
>>   5 files changed, 64 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
>> index b499006df2cf..96d0ffe8154e 100644
>> --- a/drivers/gpu/drm/xe/xe_pt.c
>> +++ b/drivers/gpu/drm/xe/xe_pt.c
>> @@ -640,28 +640,31 @@ static const struct xe_pt_walk_ops xe_pt_stage_bind_ops = {
>>    *    - In all other cases device atomics will be disabled with AE=0 until an application
>>    *      request differently using a ioctl like madvise.
>>    */
>> -static bool xe_atomic_for_vram(struct xe_vm *vm)
>> +static bool xe_atomic_for_vram(struct xe_vm *vm, struct xe_vma *vma)
>>   {
>> +	if (vma->attr.atomic_access == DRM_XE_ATOMIC_CPU)
>> +		return false;
>> +
>>   	return true;
>>   }
>>   
>> -static bool xe_atomic_for_system(struct xe_vm *vm, struct xe_bo *bo)
>> +static bool xe_atomic_for_system(struct xe_vm *vm, struct xe_vma *vma)
>>   {
>>   	struct xe_device *xe = vm->xe;
>> +	struct xe_bo *bo = xe_vma_bo(vma);
>>   
>> -	if (!xe->info.has_device_atomics_on_smem)
>> +	if (!xe->info.has_device_atomics_on_smem ||
>> +	    vma->attr.atomic_access == DRM_XE_ATOMIC_CPU)
>>   		return false;
>>   
>> +	if (vma->attr.atomic_access == DRM_XE_ATOMIC_DEVICE)
>> +		return true;
>> +
>>   	/*
>>   	 * If a SMEM+LMEM allocation is backed by SMEM, a device
>>   	 * atomics will cause a gpu page fault and which then
>>   	 * gets migrated to LMEM, bind such allocations with
>>   	 * device atomics enabled.
>> -	 *
>> -	 * TODO: Revisit this. Perhaps add something like a
>> -	 * fault_on_atomics_in_system UAPI flag.
>> -	 * Note that this also prohibits GPU atomics in LR mode for
>> -	 * userptr and system memory on DGFX.
>>   	 */
>>   	return (!IS_DGFX(xe) || (!xe_vm_in_lr_mode(vm) ||
>>   				 (bo && xe_bo_has_single_placement(bo))));
>> @@ -744,8 +747,8 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
>>   		goto walk_pt;
>>   
>>   	if (vma->gpuva.flags & XE_VMA_ATOMIC_PTE_BIT) {
>> -		xe_walk.default_vram_pte = xe_atomic_for_vram(vm) ? XE_USM_PPGTT_PTE_AE : 0;
>> -		xe_walk.default_system_pte = xe_atomic_for_system(vm, bo) ?
>> +		xe_walk.default_vram_pte = xe_atomic_for_vram(vm, vma) ? XE_USM_PPGTT_PTE_AE : 0;
>> +		xe_walk.default_system_pte = xe_atomic_for_system(vm, vma) ?
>>   			XE_USM_PPGTT_PTE_AE : 0;
>>   	}
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
>> index c093dc453e32..49d3405aacb9 100644
>> --- a/drivers/gpu/drm/xe/xe_svm.c
>> +++ b/drivers/gpu/drm/xe/xe_svm.c
>> @@ -813,7 +813,7 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>>   			IS_ENABLED(CONFIG_DRM_XE_PAGEMAP),
>>   		.check_pages_threshold = IS_DGFX(vm->xe) &&
>>   			IS_ENABLED(CONFIG_DRM_XE_PAGEMAP) ? SZ_64K : 0,
>> -		.devmem_only = atomic && IS_DGFX(vm->xe) &&
>> +		.devmem_only = xe_vma_need_vram_for_atomic(vm->xe, vma, atomic) &&
>>   			IS_ENABLED(CONFIG_DRM_XE_PAGEMAP),
>>   		.timeslice_ms = atomic && IS_DGFX(vm->xe) &&
>>   			IS_ENABLED(CONFIG_DRM_XE_PAGEMAP) ?
>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index 7f3d0ad04b3f..be51fcf322ec 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -4177,6 +4177,46 @@ void xe_vm_snapshot_free(struct xe_vm_snapshot *snap)
>>   	kvfree(snap);
>>   }
>>   
>> +/**
>> + * xe_vma_need_vram_for_atomic - Check if VMA needs VRAM migration for atomic operations
>> + * @xe: Pointer to the XE device structure
>> + * @vma: Pointer to the virtual memory area (VMA) structure
>> + * @is_atomic: In pagefault path and atomic operation
>> + *
>> + * This function determines whether the given VMA needs to be migrated to
>> + * VRAM in order to do atomic GPU operation.
>> + *
>> + * Return: true if migration to VRAM is required, false otherwise.
>> + */
>> +bool xe_vma_need_vram_for_atomic(struct xe_device *xe, struct xe_vma *vma, bool is_atomic)
>> +{
>> +	if (!IS_DGFX(xe))
>> +		return false;
>> +
>> +	/*
>> +	 * NOTE: The checks implemented here are platform-specific. For
>> +	 * instance, on a device supporting CXL atomics, these would ideally
>> +	 * work universally without additional handling.
>> +	 */
>> +	switch (vma->attr.atomic_access) {
>> +	case DRM_XE_ATOMIC_DEVICE:
>> +		return !xe->info.has_device_atomics_on_smem;
> 
> I think this is is_atomic && !xe->info.has_device_atomics_on_smem;
> 
> We really only want strick migration if the fault is an atomic one.
> 
>> +
>> +	case DRM_XE_ATOMIC_CPU:
>> +		XE_WARN_ON(is_atomic);
> 
> I think we should nack the fault if an atomic occurs and
> DRM_XE_ATOMIC_CPU is set - both for SVMs and BOs.
> 
>> +		return false;
>> +
>> +	case DRM_XE_ATOMIC_UNDEFINED:
>> +		return is_atomic;
>> +
>> +	case DRM_XE_ATOMIC_GLOBAL:
>> +		return true;
> 
> As with above, I think this is is_atomic to only implement strick
> migration on atomic faults.

Agreed to all above comments. Will fix in next rev

> 
> Matt
> 
>> +
>> +	default:
>> +		return is_atomic;
>> +	}
>> +}
>> +
>>   /**
>>    * xe_vm_alloc_madvise_vma - Allocate VMA's with madvise ops
>>    * @vm: Pointer to the xe_vm structure
>> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
>> index 0d6b08cc4163..d5bc09ae640c 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.h
>> +++ b/drivers/gpu/drm/xe/xe_vm.h
>> @@ -171,6 +171,8 @@ static inline bool xe_vma_is_userptr(struct xe_vma *vma)
>>   
>>   struct xe_vma *xe_vm_find_vma_by_addr(struct xe_vm *vm, u64 page_addr);
>>   
>> +bool xe_vma_need_vram_for_atomic(struct xe_device *xe, struct xe_vma *vma, bool is_atomic);
>> +
>>   int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t addr, uint64_t size);
>>   
>>   /**
>> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
>> index f64728120d7c..62dc5cec8950 100644
>> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
>> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
>> @@ -85,7 +85,14 @@ static void madvise_atomic(struct xe_device *xe, struct xe_vm *vm,
>>   			   struct xe_vma **vmas, int num_vmas,
>>   			   struct drm_xe_madvise *op)
>>   {
>> -	/* Implementation pending */
>> +	int i;
>> +
>> +	xe_assert(vm->xe, op->type == DRM_XE_MEM_RANGE_ATTR_ATOMIC);
>> +	xe_assert(vm->xe, op->atomic.val <= DRM_XE_ATOMIC_CPU);
>> +
>> +	for (i = 0; i < num_vmas; i++)
>> +		vmas[i]->attr.atomic_access = op->atomic.val;
>> +	/*TODO: handle bo backed vmas */
>>   }
>>   
>>   static void madvise_pat_index(struct xe_device *xe, struct xe_vm *vm,
>> -- 
>> 2.34.1
>>

