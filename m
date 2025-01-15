Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76629C02180
	for <intel-xe@archiver.kernel.org>; Wed, 15 Jan 2025 16:18:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2815910E770;
	Wed, 15 Jan 2025 16:18:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lTVulIp7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6EC110E08B
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Jan 2025 16:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736957912; x=1768493912;
 h=message-id:date:from:subject:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yooosDck/POTniVMYuU0lmxdje9NenvknAbGyC0IxlY=;
 b=lTVulIp7r9Rg+vxIB9yeZ7tXZ8xlReukzB/GRu4rAFe2npf3lXlIMT+X
 7vIi6mAAGhRBB57foqYc+/HxGWGUoyxdwrrUiYrlOqngtbCbe/Xzm4M1E
 NzUKKO/R9ujWO8TX+YfKyqhDnpLr/2ruG9+PFgOA40IGH8aWwnCytKKdZ
 TGJeGHJOZ2mw3vCReY346UpFsunkLoydVze3pwjKBpXaSdNgLXL77RITs
 DXcWSYlEy7zliUYVHGmuDbpCPpHquodWYd6Jnp9MFeBhaEza8IKWPpuJw
 sthSwBqNQ2QHqW+x5TbHePjx2ZMvcSRp2n9gnlZlN0OG60RUv6UPn/JT/ w==;
X-CSE-ConnectionGUID: OMoHfqe1QSCNIZ8b7B1NzQ==
X-CSE-MsgGUID: 33nH/HL+SzqTMfY9ALyA1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="37461210"
X-IronPort-AV: E=Sophos;i="6.13,206,1732608000"; d="scan'208";a="37461210"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2025 08:18:32 -0800
X-CSE-ConnectionGUID: HGsQP8bPTQWPAcvkQvv6VA==
X-CSE-MsgGUID: 3ngnZUenSMWLnLOVQiWsyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,206,1732608000"; d="scan'208";a="104948603"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Jan 2025 08:18:32 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 15 Jan 2025 08:18:31 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 15 Jan 2025 08:18:31 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 15 Jan 2025 08:18:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y/7ea9zziKeniCs8VjpFTofPHGWeQnyyEu21YRYXwIaKXXFfRdd1a2doElgoolUi9mSfAbTsMxZ9zeoaIylChDxbRc0m+1ch5nIAROb1E5KCkDz5gb5NyKz2mhD9Yy9jefU3PpIy4RS6Xs8ETHe8sDHHf3CvM9mD9vWavPxJ+uaxDaDzzTV6urOWr9Hpr9Jy+MMm9Fcq6Po90vaiJzBv0ciU4yfSc8B9/H6ZTDYf7dVVLNlOTGEjZfIVIyuGvxsk2kL+dJsKlDhKs49kIGcQFVU+J6ZrafXBMd4abx+oPn05SXp5Jt3huh7kzBPzRRwwcOZ/l9ARiwW1td9EUbK0aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cs/J0/gBUrUxcWjZu0hO8/9Mhtf17zUnSt1Wfb07Q5I=;
 b=GcNgIXIAMvg/gNlbee6gsISglRkgPh1GX8O3qmEhIHxntOWMP5vDrFee5eefzt0OkYeW7p2Hso3RFqlxs3EmanTAUKPEBAiqWML1Qhwk9kusYcN2wmCMBJJUM/ZyYmskKujk1ntryR9nSDm/p6+ZdqyZ3Yo0mmh9h/cTZYHH3aIUBvuxETwvpdbtdXat/bwXOz3qiiyhN1y7r+NqxJQFjsz/QqfX7QxeQOadwzRMxBDFiS7SWlDbMJUdgrHvklWRvUs/hGFhGkfkqPahuTyAvv8qWk+x1Ja4xa4TAXVul6bS56ivFP8Pxui0idsPDuAEca7y8fBb+NyosrdtdcAilg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 DS0PR11MB7457.namprd11.prod.outlook.com (2603:10b6:8:140::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8356.14; Wed, 15 Jan 2025 16:18:01 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%3]) with mapi id 15.20.8356.010; Wed, 15 Jan 2025
 16:18:01 +0000
Message-ID: <bfb3420c-dc1b-4947-bfa7-2d60d6bce2db@intel.com>
Date: Wed, 15 Jan 2025 21:47:53 +0530
User-Agent: Mozilla Thunderbird
From: Riana Tauro <riana.tauro@intel.com>
Subject: Re: [PATCH v2 1/3] drm/xe: Add functions and sysfs for boot
 survivability
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <aravind.iddamsetty@intel.com>, <jani.nikula@linux.intel.com>,
 <matthew.d.roper@intel.com>, <alexander.usyskin@intel.com>
References: <20250108103959.1219312-1-riana.tauro@intel.com>
 <20250108103959.1219312-2-riana.tauro@intel.com> <Z4E7DB6pbb11QDWT@intel.com>
Content-Language: en-US
In-Reply-To: <Z4E7DB6pbb11QDWT@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2P287CA0011.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:21b::18) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|DS0PR11MB7457:EE_
X-MS-Office365-Filtering-Correlation-Id: 10a88375-dbbc-45aa-1e3f-08dd35802e6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VW9vRGdKNkMxVTdoS0JDSVNveUFOUXVTYWtZKytJeG9OWVpJUmU1OGd3TVdS?=
 =?utf-8?B?TEs3c05aemJvbkJ0bCtWSm9jRG5YTXdobGEvQXNmU3p5RDRwL1JnWllaSjhK?=
 =?utf-8?B?N0pmaGYwSlBENTBxNURTVGlNYUN3STJZVGpFa2ZpeFowR2k1KzJOVFhZRlAv?=
 =?utf-8?B?VEFabzlxd3RlY1JiNC9qSnJuMHRha3NmOWt4Rm5XQmxGTUpsQ1pVRERxY3hL?=
 =?utf-8?B?Z1pFenN5cjh4NVZPbzV2MWxKNXF4TG1RZEhtdDg0VXBYaCtJWVc4ZmxQUzF3?=
 =?utf-8?B?ak1CRDlySFV4SUJUWW94M1J1a0xFeUwxNmhTdTM3QkxxVFJnN2g4MGdxaTkv?=
 =?utf-8?B?VmpwdFlRd3BmVnMrN0Z5ODc1RFEwcVQ1eUM0M2E2S1lQbjhLbHZzb25hUkM2?=
 =?utf-8?B?QVZQamtDK1YwajZsYVVkSnFUcVRwZ1FCeHI2U0svTENaUVRJWm5pMS95cGpK?=
 =?utf-8?B?ZlV1RkVKTzBkUUN2Qk9qUVdPbHhsYTNNTnk5WTEyYnFucHNZMXdtTS9Ia1ph?=
 =?utf-8?B?L0RaME1SenZxcFczVVkzVnRLNFlvNmFYWFNtdDhHazNIRnN1NnFhbWdaVG9s?=
 =?utf-8?B?UVFVYXhqTEdkMG5QQzFleVUvRDVURWZ1WVJjUG9GY2dzazZlYmlERU02SFA3?=
 =?utf-8?B?VjV3SEhDWEJMMHhoeFJNRktnNnlNdlpBaG84M1ZWbWxBTnQ1V3VKMmJ6NElS?=
 =?utf-8?B?YVkxOWUwVHZoSmpiVnRBdWY4NU5TZ0FGWmswRUdsNU9ZZ0tqODJsOVp1NDNm?=
 =?utf-8?B?VUlFcmRaOFVGTktWSVV3VWJMaklwRkN0dnRGNU1ZMFM2NnlId3J5MVMxYzQ4?=
 =?utf-8?B?S0k1QUhyRHBWSm9NZ3JaVGQ5ejBGQnR3SVp1a0JFSG9wZGZaREtsZGpjMHJK?=
 =?utf-8?B?eUhjQmxUbFoxL0hRV29rRnZaZ21qUU1CdTlNeFB3S045czQ5eUszaVFRRGRl?=
 =?utf-8?B?ZEdrRklKQVBlMHE4aGN6Njd3cHE5R3NCU3pkdFdVbEhHbDJDZlRlaDRxN3U0?=
 =?utf-8?B?L3NTRlRxaENBdEh2MllrbnFUMGE5OWxGVmxNREtQWnl3U05XYXZZbDczK1VN?=
 =?utf-8?B?MlFxOWdJV0hsbWRvQVFtUnZtQ1h1aGdsY3hQR0xDRDJZcG1ZQzE2T1lyNlEv?=
 =?utf-8?B?NXQ2eTE5MTV2NXoyN3FVZWtWc1ZxbEJ4K1R2UFNFd2ZMUFNGeHJONlFZWko1?=
 =?utf-8?B?SFAwL2RsWHU0ZkpQRytvZ3FqSmJ6S2VOL3dzZ2ZxYTFQY2FPVDRxUnBnLzNz?=
 =?utf-8?B?NUcyTmIxSXRsMGxCWWF4WUNoT2w0THowR3N4MWE4WnpHWHlqTHdiVS9HbFRF?=
 =?utf-8?B?S1d3Z1BiOTZuTXFFVmxkNnZSNnlUS3hIdGkydlZQcWM3UmJrc1VKeWlWQndB?=
 =?utf-8?B?cDRyL3hZbGdjcktWTmJEbkRPOGJWVWFFenE1bmRXZE1lSGFLZFFidHdxU0J4?=
 =?utf-8?B?bVlxSHQ4dzZqSVVleUhaaGFNMmlwQzdPaVhSMDAyZW0yMlNtdzBvVFpOU0di?=
 =?utf-8?B?Tno5azRXMnp1cjlucGQ2YlJ6TFhZcmY4NlpwMjVWOWtkQ3NZL1lmWmNBTXEw?=
 =?utf-8?B?cmFTdmVGbC9RNU5RNDBHRnJNNjIxRjFSOVByNE5OUFFsREpxREtRWnJYeGtz?=
 =?utf-8?B?TUE4c2Vzd2thcmkyNEtYRnUwcHc2R3puNzIzWXp6Rm1jVmJlZm8vNWpwREJH?=
 =?utf-8?B?ZnRrYkMrZjY1RmdvNWZXUzJEUlZ2SUNsY2Vpc2FMRTBUQXQyN3NoZmFjdzdq?=
 =?utf-8?B?dlBvbmVPM0p2am9Cb0J3bHhyMHpmTjkzMEhtWEs2SHlCbFAyejNEU1ExMmFS?=
 =?utf-8?B?bGU2RXVkNjNGL1pTd1g5RDJrYjZYaUtiamhzMXdYcU1qYTFqQVBmbkprZzIw?=
 =?utf-8?Q?hFyu/ADeExknq?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QlVnSFYxdXp6VkJHNDgycVlVWGxsYWRsWWgwd0kwTEthUUM5aVErNDdkOGww?=
 =?utf-8?B?Zjl3bWM5aWV5R1RET01CN3RaRjRFdzJLeHRJZzdzc0l1MDJTY0t6TVdROEFU?=
 =?utf-8?B?UGdiRFRzajNLZGJkeElmbzR4N3lXNmlIU3FoT3ZraUxuZkJhK21xdVRRWXFS?=
 =?utf-8?B?eXVjWHcwQ0tFK0NQbllSdG5nNWFHOFlLT1RYaXhrTDZKWlJlTE0rZmV3dC9Y?=
 =?utf-8?B?cUdWc1BXZW1RU1doeldFSkRjOGxqejNhVmNDMjNFYXd5UEF6TnNucWNPanNW?=
 =?utf-8?B?MW04clNPbmlQM2FWaTlnWHNUZmMvZzhMSmxCMWc5Y1lxcE1hdnNrTzJ6OWFE?=
 =?utf-8?B?U1VuK1Z3V1E3K0l5VjFKQzVCVEphWWhETFBSZWFndlEwVUx3VG9DOEFXcXRR?=
 =?utf-8?B?RmZJaysxTm0zaU05aTlhbWMzSU80Q1FuTm5KVUtHY3hES1NJOHlEODVhME1B?=
 =?utf-8?B?OGtxQ2dHQ21aYU41SXR1bk5vMnlHRnVuenl3Nm1Gdy9DOVRvNEY0aDhLNGt3?=
 =?utf-8?B?aTBJOWsyTjRhTThOV2Jjb0J0UXFrUG0zaW9RODZkNXJVZERSRmdVeFdNZDZS?=
 =?utf-8?B?QVkxZUt0Tys2dWJFSzJtT1NNampSdnQ0SXdzTEEvTmVmZzBvamxOKzBYVVZv?=
 =?utf-8?B?ckNwV0NPeTRyUmFzVm1Fb0V4UkZFVUtoTERSVlpIUG5pb2syKzNaTlZsdEpV?=
 =?utf-8?B?cTYySmZLM1hseVVSMXJ3d0cxYVJZdE5FY1EwdWZoZC84bmYwVUp1cTR5NDdI?=
 =?utf-8?B?Vi82N0VoL2pWVHNZaHlWWkNvR1J0eEpiVEhoVHUycjhNczF6RGVoTnNZbEts?=
 =?utf-8?B?NkpBL3RzMUkyY1FmM3RKQVhkTGdpaWNIN2wrL1h6Ly9tQmRqY3d5c2xxUEFp?=
 =?utf-8?B?K0FkTFhiS0lwZDd3NDNJTWtMUWppL3AyV1lUem44bVRkQmVWOXR2NnJmK0VD?=
 =?utf-8?B?SW5xaXR5RnRjZTN2cUcrVDY4dS9qWWhLSkJwM01mTW5vTVEwTms5bndCSXZ4?=
 =?utf-8?B?czVqenU2VkpZK2hoTGxJUWhub1lvYStwWjRLSWZSNnorSE1HSTgyczRWUk1G?=
 =?utf-8?B?bWpyalhkUjMycndFWnJkSU4wYkVZYm9TYUxTVFdCWngzdmlhU3M1MFI0bnBC?=
 =?utf-8?B?T3VNTDA3VnhJRThtcklvK1JvRHZtTFpKUFZIUnAvYmRZS21ZVjhYNlVvT1VE?=
 =?utf-8?B?Y2FOK21TekNXN252a0NPRUd0RmE3Yk5oVnZxQUpNWnpFd0FHRnk5R3h2ZkxC?=
 =?utf-8?B?MlpFY05OMzNLbmtjVXdCekF6ZzNUL0R3NG5YUXhsVHBuRW9tdzhQZHcxNFQv?=
 =?utf-8?B?bG1uSHZEdlNDNTcxcGQ1ZE1wTzFaK3FtRDJZRzNnWHVjc290L01wU2EzNkdI?=
 =?utf-8?B?N2RQWDdFRXoydFllZUkrcVJva09FWHBWMm93QW5ZMElrV0tWMFUrK3NHNERo?=
 =?utf-8?B?c0p3elY1UDFydXEwMDluK1J1ODl0cGtRc2JZWFhPbWJoemQxTFc4MzhxNHF6?=
 =?utf-8?B?ZkpEVFFwd2RnNXFhUWEyNkVnUVBxS1F3V2dYL2dFb3Fmd05vdzlMQkdGMFpC?=
 =?utf-8?B?M05WNnFRKzBqK3FIYWNBdThGT25qZlA4aVgrRXkvcUFGeWtzdHpFdzJpSGNS?=
 =?utf-8?B?MFZwdjRndjN2SFBJNy8vWHJMNS9LeDROdHplV1dtOVQ4aDUvQ1V4ZHhEVWlw?=
 =?utf-8?B?Zzk4UjBCNG5Wd2JrUFFFWUFWQ0c0RnI3MXpkbCtlaTRWdXloVXFnMk5Wd0dq?=
 =?utf-8?B?b3Y2ZkdqdWEwUlFqQWNsTXc5NFdNdTQ5SkpJVGFzNUN6TGM3VEZNZjYzNUZt?=
 =?utf-8?B?ZStMMlJXdjZFOVc0YTZ6NGR1TlJIUFRiVXU1bFZ3WGhjYWpQN01xNGFoYjdp?=
 =?utf-8?B?Q3MyanUvQUVuMlgvQjN0VW9KaStRRXVGdWk1RzMvQ1kva3cxeU9oM3YvMWRa?=
 =?utf-8?B?eXUzbDAzOHgxdHljNHMrK2VUaVF0SUxCYWk2SzY5SFQzY1dldzMvdU9PKzYv?=
 =?utf-8?B?SDJ2QzIvUDFxVWdveFZpNVkvWjI1OEJKREZWWWZrcEhCT2g2MVNSNVdDYitG?=
 =?utf-8?B?MTRPTzIwdzUzMVp0U2ZHVkRiUXJKTjlwYi9kcXNKS1Y5TXZsdXgrRXdvZ1hD?=
 =?utf-8?Q?4usPcIInyn2bkjMPQFX+RuMX1?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 10a88375-dbbc-45aa-1e3f-08dd35802e6f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2025 16:18:01.1700 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nDWCVd7mGvD9wh7PMy9ra0BcEPHdno5h5ycIZWK0ajCQlpEyGnPIQbvX2t9FguNFvmsFrxAOEheLlOj/MWUvew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7457
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

Hi Rodrigo

On 1/10/2025 8:51 PM, Rodrigo Vivi wrote:
> On Wed, Jan 08, 2025 at 04:09:57PM +0530, Riana Tauro wrote:
>> Boot Survivability is a software based workflow for recovering a system
>> in a failed boot state. Here system recoverability is concerned with
>> recovering the firmware responsible for boot.
>>
>> This is implemented by loading the driver with bare minimum (no drm card)
>> to allow the firmware to be flashed through mei-gsc and collect telemetry.
>> The driver's probe flow is modified such that it enters survivability mode
>> when pcode initialization is incomplete and boot status denotes a failure.
>> In this mode, drm card is not exposed and presence of survivability_mode
>> entry in PCI sysfs  is used to indicate survivability mode and
>> provide additional information required for debug
>>
>> This patch adds initialization functions and exposes admin
>> readable sysfs entries
>>
>> The new sysfs will have the below layout
>>
>> 	/sys/bus/.../bdf
>>               	     ├── survivability_mode
>>
>> v2: reorder headers
>>      fix doc
>>      remove survivability info and use mode to display information
>>      use separate function for logging survivability information
>>      for critical error (Rodrigo)
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>>   drivers/gpu/drm/xe/Makefile                   |   1 +
>>   drivers/gpu/drm/xe/xe_device_types.h          |   4 +
>>   drivers/gpu/drm/xe/xe_pcode_api.h             |  14 ++
>>   drivers/gpu/drm/xe/xe_survivability_mode.c    | 231 ++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_survivability_mode.h    |  17 ++
>>   .../gpu/drm/xe/xe_survivability_mode_types.h  |  35 +++
>>   6 files changed, 302 insertions(+)
>>   create mode 100644 drivers/gpu/drm/xe/xe_survivability_mode.c
>>   create mode 100644 drivers/gpu/drm/xe/xe_survivability_mode.h
>>   create mode 100644 drivers/gpu/drm/xe/xe_survivability_mode_types.h
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index 5c97ad6ed738..fb1cb98ce891 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -95,6 +95,7 @@ xe-y += xe_bb.o \
>>   	xe_sa.o \
>>   	xe_sched_job.o \
>>   	xe_step.o \
>> +	xe_survivability_mode.o \
>>   	xe_sync.o \
>>   	xe_tile.o \
>>   	xe_tile_sysfs.o \
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>> index 8a7b15972413..0f5a052150c9 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -21,6 +21,7 @@
>>   #include "xe_pt_types.h"
>>   #include "xe_sriov_types.h"
>>   #include "xe_step_types.h"
>> +#include "xe_survivability_mode_types.h"
>>   
>>   #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>>   #define TEST_VM_OPS_ERROR
>> @@ -341,6 +342,9 @@ struct xe_device {
>>   		u8 skip_pcode:1;
>>   	} info;
>>   
>> +	/** @survivability: survivability information for device */
>> +	struct xe_survivability survivability;
>> +
>>   	/** @irq: device interrupt state */
>>   	struct {
>>   		/** @irq.lock: lock for processing irq's on this device */
>> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
>> index f153ce96f69a..4e373b8199ca 100644
>> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
>> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
>> @@ -49,6 +49,20 @@
>>   /* Domain IDs (param2) */
>>   #define     PCODE_MBOX_DOMAIN_HBM		0x2
>>   
>> +#define PCODE_SCRATCH_ADDR(x)		XE_REG(0x138320 + ((x) * 4))
>> +/* PCODE_SCRATCH0 */
>> +#define   AUXINFO_REG_OFFSET		REG_GENMASK(17, 15)
>> +#define   OVERFLOW_REG_OFFSET		REG_GENMASK(14, 12)
>> +#define   HISTORY_TRACKING		REG_BIT(11)
>> +#define   OVERFLOW_SUPPORT		REG_BIT(10)
>> +#define   AUXINFO_SUPPORT		REG_BIT(9)
>> +#define   BOOT_STATUS			REG_GENMASK(3, 1)
>> +#define      CRITICAL_FAILURE		4
>> +#define      NON_CRITICAL_FAILURE	7
>> +
>> +/* Auxillary info bits */
>> +#define   AUXINFO_HISTORY_OFFSET	REG_GENMASK(31, 29)
>> +
>>   struct pcode_err_decode {
>>   	int errno;
>>   	const char *str;
>> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
>> new file mode 100644
>> index 000000000000..077422ae009d
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
>> @@ -0,0 +1,231 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2025 Intel Corporation
>> + */
>> +
>> +#include "xe_survivability_mode.h"
>> +#include "xe_survivability_mode_types.h"
>> +
>> +#include <drm/drm_managed.h>
>> +#include <linux/kobject.h>
>> +#include <linux/pci.h>
>> +#include <linux/sysfs.h>
>> +
>> +#include "xe_device.h"
>> +#include "xe_gt.h"
>> +#include "xe_mmio.h"
>> +#include "xe_pcode_api.h"
>> +
>> +#define MAX_SCRATCH_MMIO 8
>> +
>> +/**
>> + * DOC: Xe Boot Survivability
>> + *
>> + * Boot Survivability is a software based workflow for recovering a system in a failed boot state
>> + * Here system recoverability is concerned with recovering the firmware responsible for boot.
>> + *
>> + * This is implemented by loading the driver with bare minimum (no drm card) to allow the firmware
>> + * to be flashed through mei and collect telemetry. The driver's probe flow is modified
>> + * such that it enters survivability mode when pcode initialization is incomplete and boot status
>> + * denotes a failure. The driver then  populates the survivability_mode PCI sysfs indicating
>> + * survivability mode and provides additional information required for debug
>> + *
>> + * KMD exposes below admin-only readable sysfs in survivability mode
>> + *
>> + * device/survivability_mode: The presence of this file indicates that the card is in survivability
>> + *			      mode. Also, provides additional information on why the driver entered
>> + *			      survivability mode.
>> + *
>> + *			      Capability Information - Provides boot status
>> + *			      Postcode Information   - Provides information about the failure
>> + *			      Overflow Information   - Provides history of previous failures
>> + *			      Auxillary Information  - Certain failures may have information in
>> + *						       addition to postcode information
>> + */
>> +
>> +static void set_survivability_info(struct xe_device *xe, struct xe_survivability_info *info,
>> +				   int id, char *name)
>> +{
>> +	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
>> +
>> +	strscpy(info[id].name, name, sizeof(info[id].name));
>> +	info[id].reg = PCODE_SCRATCH_ADDR(id).raw;
>> +	info[id].value = xe_mmio_read32(mmio, PCODE_SCRATCH_ADDR(id));
>> +}
>> +
>> +static int populate_survivability_info(struct xe_device *xe)
>> +{
>> +	struct xe_survivability *survivability = &xe->survivability;
>> +	struct xe_survivability_info *info = survivability->info;
>> +	u32 capability_info;
>> +	int id = 0;
>> +
>> +	set_survivability_info(xe, info, id, "Capability Info");
>> +	capability_info = info[id].value;
>> +
>> +	if (capability_info & HISTORY_TRACKING) {
>> +		id++;
>> +		set_survivability_info(xe, info, id, "Postcode Info");
>> +
>> +		if (capability_info & OVERFLOW_SUPPORT) {
>> +			id = REG_FIELD_GET(OVERFLOW_REG_OFFSET, capability_info);
>> +			/* ID should be within MAX_SCRATCH_MMIO */
>> +			if (id >= MAX_SCRATCH_MMIO)
>> +				return -EINVAL;
>> +			set_survivability_info(xe, info, id, "Overflow Info");
>> +		}
>> +	}
>> +
>> +	if (capability_info & AUXINFO_SUPPORT) {
>> +		u32 aux_info;
>> +		int index = 0;
>> +		char name[NAME_MAX];
>> +
>> +		id = REG_FIELD_GET(AUXINFO_REG_OFFSET, capability_info);
>> +		if (id >= MAX_SCRATCH_MMIO)
>> +			return -EINVAL;
>> +
>> +		snprintf(name, NAME_MAX, "Auxiliary Info %d", index);
>> +		set_survivability_info(xe, info, id, name);
>> +		aux_info = info[id].value;
>> +
>> +		while ((id = REG_FIELD_GET(AUXINFO_HISTORY_OFFSET, aux_info)) &&
>> +		       (id < MAX_SCRATCH_MMIO)) {
> 
> This is a clear case where 'for' is better. But also, generally here we
> try to limit while usages...
This is similar to linked list with the address of prev aux registers in 
the AUXINFO_HISTORY_OFFSET. So used while.

Using for would be like below

for (id = REG_FIELD_GET(AUXINFO_HISTORY_OFFSET, aux_info);
      aux_info && id < MAX_SCRATCH_MMIO; id 
=REG_FIELD_GET(AUXINFO_HISTORY_OFFSET, aux_info))

Isn't while better?
> 
>> +			index++;
>> +			snprintf(name, NAME_MAX, "Prev Auxiliary Info %d", index);
>> +			set_survivability_info(xe, info, id, name);
>> +			aux_info = info[id].value;
>> +		}
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static void log_survivability_info(struct xe_device *xe)
>> +{
>> +	struct xe_survivability *survivability = &xe->survivability;
>> +	struct xe_survivability_info *info = survivability->info;
>> +	int id;
>> +
>> +	drm_info(&xe->drm, "Survivability Boot Status : Critical Failure (%d)\n",
>> +		 survivability->boot_status);
> 
> hmm, since we are avoiding the drm, should we really use drm variants here?
> or the pci/dev ones?!

drm variants use the dev ones and prints the prefix if drm is not null.
Will change the drm_info in this file  but the logs in mei and vsec 
initialization would have to be retained.
> 
>> +	for (id = 0; id < MAX_SCRATCH_MMIO; id++) {
>> +		if (info[id].reg)
>> +			drm_info(&xe->drm, "%s: 0x%x - 0x%x\n", info[id].name,
>> +				 info[id].reg, info[id].value);
>> +	}
>> +}
>> +
>> +static ssize_t survivability_mode_show(struct device *dev,
>> +				       struct device_attribute *attr, char *buff)
>> +{
>> +	struct pci_dev *pdev = to_pci_dev(dev);
>> +	struct xe_device *xe = pdev_to_xe_device(pdev);
>> +	struct xe_survivability *survivability = &xe->survivability;
>> +	struct xe_survivability_info *info = survivability->info;
>> +	int index = 0, count = 0;
>> +
>> +	for (index = 0; index < MAX_SCRATCH_MMIO; index++) {
>> +		if (info[index].reg)
>> +			count += sysfs_emit_at(buff, count, "%s: 0x%x - 0x%x\n", info[index].name,
>> +					       info[index].reg, info[index].value);
>> +	}
>> +
>> +	return count;
>> +}
>> +
>> +static DEVICE_ATTR_ADMIN_RO(survivability_mode);
>> +
>> +static void enable_survivability_mode(struct xe_device *xe)
>> +{
>> +	struct xe_survivability *survivability = &xe->survivability;
>> +	struct device *dev = xe->drm.dev;
> 
> do we really have this pointer valid at this point?!
This is allocated in xe_device_create. Registration is done later in 
xe_device_probe so the prints and xe->drm.dev will be valid

Thanks
Riana
> 
>> +	int ret = 0;
>> +
>> +	/* set survivability mode */
>> +	survivability->mode = true;
>> +	drm_info(&xe->drm, "In Survivability Mode\n");
> 
> same here...
> 
>> +
>> +	/* create survivability mode sysfs */
>> +	ret = sysfs_create_file(&dev->kobj, &dev_attr_survivability_mode.attr);
>> +	if (ret) {
>> +		drm_warn(&xe->drm, "Failed to create survivability sysfs files\n");
>> +		return;
>> +	}
>> +}
>> +
>> +/**
>> + * xe_survivability_mode_required- checks if survivability mode is required
>> + * @xe: xe device instance
>> + *
>> + * This function reads the boot status of Pcode capability register
>> + *
>> + * Return: true if boot status indicates failure, false otherwise
>> + */
>> +bool xe_survivability_mode_required(struct xe_device *xe)
>> +{
>> +	struct xe_survivability *survivability = &xe->survivability;
>> +	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
>> +	u32 data;
>> +
>> +	data = xe_mmio_read32(mmio, PCODE_SCRATCH_ADDR(0));
>> +	survivability->boot_status = REG_FIELD_GET(BOOT_STATUS, data);
>> +
>> +	return (survivability->boot_status == NON_CRITICAL_FAILURE ||
>> +		survivability->boot_status == CRITICAL_FAILURE);
>> +}
>> +
>> +/**
>> + * xe_survivability_mode_remove - remove survivability mode
>> + * @xe: xe device instance
>> + *
>> + * clean up sysfs entries of survivability mode
>> + */
>> +void xe_survivability_mode_remove(struct xe_device *xe)
>> +{
>> +	struct xe_survivability *survivability = &xe->survivability;
>> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>> +
>> +	sysfs_remove_file(&xe->drm.dev->kobj, &dev_attr_survivability_mode.attr);
>> +	kfree(survivability->info);
>> +	pci_set_drvdata(pdev, NULL);
>> +}
>> +
>> +/**
>> + * xe_survivability_mode_init - Initialize the survivability mode
>> + * @xe: xe device instance
>> + *
>> + * Initializes the sysfs and required actions to enter survivability mode
>> + */
>> +void xe_survivability_mode_init(struct xe_device *xe)
>> +{
>> +	struct xe_survivability *survivability = &xe->survivability;
>> +	struct xe_survivability_info *info;
>> +	int ret = 0;
>> +
>> +	survivability->size = MAX_SCRATCH_MMIO;
>> +
>> +	info = kcalloc(survivability->size, sizeof(*info), GFP_KERNEL);
>> +	if (!info) {
>> +		ret = -ENOMEM;
>> +		goto err;
>> +	}
>> +
>> +	survivability->info = info;
>> +
>> +	ret = populate_survivability_info(xe);
>> +	if (ret)
>> +		goto err;
>> +
>> +	/* Only log debug information and exit if it is a critical failure */
>> +	if (survivability->boot_status == CRITICAL_FAILURE) {
>> +		log_survivability_info(xe);
>> +		kfree(survivability->info);
>> +		return;
>> +	}
>> +
>> +	enable_survivability_mode(xe);
>> +err:
>> +	if (ret)
>> +		drm_warn(&xe->drm, "%s failed, err: %d\n", __func__, ret);
> 
> same...
> 
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.h b/drivers/gpu/drm/xe/xe_survivability_mode.h
>> new file mode 100644
>> index 000000000000..410e3ee5f5d1
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.h
>> @@ -0,0 +1,17 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2025 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_SURVIVABILITY_MODE_H_
>> +#define _XE_SURVIVABILITY_MODE_H_
>> +
>> +#include <linux/types.h>
>> +
>> +struct xe_device;
>> +
>> +void xe_survivability_mode_init(struct xe_device *xe);
>> +void xe_survivability_mode_remove(struct xe_device *xe);
>> +bool xe_survivability_mode_required(struct xe_device *xe);
>> +
>> +#endif /* _XE_SURVIVABILITY_MODE_H_ */
>> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode_types.h b/drivers/gpu/drm/xe/xe_survivability_mode_types.h
>> new file mode 100644
>> index 000000000000..19d433e253df
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_survivability_mode_types.h
>> @@ -0,0 +1,35 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2025 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_SURVIVABILITY_MODE_TYPES_H_
>> +#define _XE_SURVIVABILITY_MODE_TYPES_H_
>> +
>> +#include <linux/limits.h>
>> +#include <linux/types.h>
>> +
>> +struct xe_survivability_info {
>> +	char name[NAME_MAX];
>> +	u32 reg;
>> +	u32 value;
>> +};
>> +
>> +/**
>> + * struct xe_survivability: Contains survivability mode information
>> + */
>> +struct xe_survivability {
>> +	/** @info: struct that holds survivability info from scratch registers */
>> +	struct xe_survivability_info *info;
>> +
>> +	/** @size: number of scratch registers */
>> +	u32 size;
>> +
>> +	/** @boot_status: indicates critical/non critical boot failure */
>> +	u8 boot_status;
>> +
>> +	/** @mode: boolean to indicate survivability mode */
>> +	bool mode;
>> +};
>> +
> 
> I believe the only blocker is the while-vs-for loop. I believe the 'drm'
> could be avoided, but not a big deal if it is really working...
> 
>> +#endif /* _XE_SURVIVABILITY_MODE_TYPES_H_ */
>> -- 
>> 2.47.1
>>

