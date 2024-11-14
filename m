Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D52E2D6A221
	for <intel-xe@archiver.kernel.org>; Thu, 14 Nov 2024 17:45:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A05F710E0B1;
	Thu, 14 Nov 2024 17:45:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QDwf1uYi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF23E10E0B1
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Nov 2024 17:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731606301; x=1763142301;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bMRzs2Rht8YsDAhC8y9aIlIL7O3tIbrpeioc1dbrh2w=;
 b=QDwf1uYiHYuHGIymF75fvEthLzmaB1ZiqK0sZl4tsC68MCSAG5XvYyBQ
 HVkxpMfHP1HP9KKwoy2e1FjEiJXOGSi1nXmuSiut5J3kr/eSZlaC2w9/K
 Z2TS9IzlciLjtDR3huFIyEm5mBhHVvjCqoABBpG170hroWdzltfhoGiud
 FjQWhX87nsb6zWSnGbctPN3O/MEDp9aGjqBtkzL3xs+mdUAU9Kd1TmTHV
 DcVYwmvmFlmtjsEAEUdDBDmS5kQcVWu/aIL1GG2+7iOIndp95zOndohKz
 gmv2MSHUmTTpC/1I+/DiDRbpUGPTlIJeqnI5PjFOzkhUXTp/M6iqNRWdT Q==;
X-CSE-ConnectionGUID: 2VeML7KARn+92Z5Xslsjag==
X-CSE-MsgGUID: U1tuswoGSPKtQDxzNazijw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31548756"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="31548756"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 09:45:01 -0800
X-CSE-ConnectionGUID: OeuOYU4kRROHc5CReurpbw==
X-CSE-MsgGUID: lvoQYMKCT+WyxKg0EGtatg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="93235921"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2024 09:45:01 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 14 Nov 2024 09:45:00 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 14 Nov 2024 09:45:00 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.47) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 14 Nov 2024 09:44:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o0n4gpJKpBzKiAYE/G2YYeJ/NekOwHl/jcJgVpL8dpcaY9UnoKSH5JE+3ePSk8M8nhzQrdCyuQIKuJ3FL7bd1tCBL+SMPcNXTbWD3RU/iMbUwDiCGIDwg0FCAibW330bfPpFE92INJIb5kWcD2DDQfYrMgFqZQoFB1xwD7sJtkvV50kzscYrOKNrMpc/iiPBx0k3FOoHP30jaNnraRY32j2iVtYpWkxZJBDnDQkctf78zy6ch6MHxUEFFMUIdgVQnlipeNYIRqfeW7vn800H75EDXumfoNduzsVBCTeyEMSbKQA52sdz3NF4UndEXMjDk6DbAa/3d7G322GBw1AqCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RBkNC0UGdk3/acW7Qt6sadLzfh3aYbw7fgpWYVCwLow=;
 b=oIMDQhkktWOVu6GNoo4CgK96ETJOR6SiUILA2mOMhJ8IRoFdCfaLrQeB9tb3qO7PO7PGSb1r0yCbSatI4Q4OqtmzCM/gO983vm8ZuylD2cYCdVEjQNegr1WcXxGWTHwcTRpXhfoRgkqTA7ACFwf9uHROrJov0R5w7jwMq+jTGJjPEuiyCnwH3Fqv0fs522Ox1qNPh61mxNX2PfvhTPlhzXy5TO/WVWGgGj/ZKMG51pWr6Uej6f5QBcTxwbGEAp48wpw/PVL2ovghRrovTpI2NaL54TE2jYE3xZsRh4TCtvaWsTK4tzFBrAReGrNPpCfbPsx5LwFfTnnUNXYyFibQdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by SA2PR11MB4969.namprd11.prod.outlook.com (2603:10b6:806:111::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Thu, 14 Nov
 2024 17:44:53 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1%2]) with mapi id 15.20.8158.013; Thu, 14 Nov 2024
 17:44:53 +0000
Message-ID: <7572a2d1-67b6-4aa3-a26c-887104f7fb42@intel.com>
Date: Thu, 14 Nov 2024 09:44:50 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/3] drm/xe/pmu: Enable PMU interface
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Aravind Iddamsetty
 <aravind.iddamsetty@linux.intel.com>, Bommu Krishnaiah
 <krishnaiah.bommu@intel.com>, Riana Tauro <riana.tauro@intel.com>, "Rodrigo
 Vivi" <rodrigo.vivi@intel.com>
References: <20241113174242.24787-1-vinay.belgaumkar@intel.com>
 <20241113174242.24787-2-vinay.belgaumkar@intel.com>
 <lnvrm7guru3ujx7kt4irhvjb3wc3vcfzzhko3h5zkvgdig6znm@xb56nnaemwi5>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <lnvrm7guru3ujx7kt4irhvjb3wc3vcfzzhko3h5zkvgdig6znm@xb56nnaemwi5>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0132.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::17) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|SA2PR11MB4969:EE_
X-MS-Office365-Filtering-Correlation-Id: 51abf904-4bf1-4592-db0e-08dd04d40b6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VkcyYVpaL09ob28yZ0JpRTN4aXZIQTJEQ3puM29CVFJhWVduZWhnRG5TUUh6?=
 =?utf-8?B?Zkt5bzFydTBQbGNrYkNSZldaTmVBRU5LTXRjWmx6NTJJdk1kNHZtVGhKS0Vw?=
 =?utf-8?B?WmtDQmhIeklwaGllZlNnVG9oQUVUOWlNbllHaEpQVFhVaEYybnpIcEFmRlBq?=
 =?utf-8?B?UDFueXJsOWJNVHJEaTdXY2hXb0NqNjM1UGF5MXM3bVp3ZzJmSmhLSXd1Vnkx?=
 =?utf-8?B?Z0NwTWg2SzgreDlJbC81bkRBcTlVV0htc1NJZXpDUDZMMm1ZNERSWEh1SEhx?=
 =?utf-8?B?U0NHa3BuUjE0N2wwdC9JZUc2N1lXano2bkk4WWJ4cndCYzZ6ZlhNOHQ1Zmdn?=
 =?utf-8?B?dVA5Z2dhR25TMEZib2loTGpxVWVOZ1VKOUlIRlV3YUJSTXZXRHlaY20rQ01T?=
 =?utf-8?B?Y0lDWjBSOWY5TllnMGl0QUVsbGJtMXdmcVA5TFl1bHlldUc3UFBHcW1Zc0Fa?=
 =?utf-8?B?UndRdlNFemFRK2FoYjVET0h0YlFPQk1IL1R6N2xvdWM3R0IwWE5sWitEUCtj?=
 =?utf-8?B?SVcyOGZSOUdjN2txbUJUeW5HZ3BSRzZ5blVKNkZvd2cwd21jTlhXTk11NGk4?=
 =?utf-8?B?NG5DeXpUNm95K3Ezd1BjU09oQW5QL1d4aUJyNkp0ZnRCc1pBSDd5UkR1RHJl?=
 =?utf-8?B?eHFwQ1pLbndhQzdiMjNWMFlTYm1IOUlBNlcvd2Z2MmpBNWlwaG9JSTVhLzVQ?=
 =?utf-8?B?Znd2OTlKRXFzSVd5RVZnZ1A5Z1RvUm9EZzgzSmJtanBubzFiL29RTWJ6TXN3?=
 =?utf-8?B?Q085SHFGaEtvQVNmTHFQaFV1NGc2RnVXemxFUmtOcGFCVnlyVVJkT1U4bGRZ?=
 =?utf-8?B?NWZaT21pMjJWenRQb2Q5WXdJVkY4L3JWRFR5V0tqaGFwNGxrazkycFNnaTll?=
 =?utf-8?B?eFJQeWVwWlZQUkhZdmhDWWdJalZMZ25KYlh0d1E3a05tbkp4VDBybEIwMFk2?=
 =?utf-8?B?TUJPUXFzVTlVdncvdXF6bDRRVjhVbFc5RlB4Rmp4dGlVSWh2RnN3V1RuVktZ?=
 =?utf-8?B?dkpleW43YURTWDZnbTJTbTQ5QnVIREhpdGdxV3M2T3I4ajRmbmVFSGp6dWEv?=
 =?utf-8?B?MmxjYTNEMDcyanZvNWFDVENNblo3VWhwMnA1S0pOYkY2T2gvUFBOZjl6V3U0?=
 =?utf-8?B?MHdvQTV5cEM1a2hWTW03RjdwM2tjNDJreitaekNkTkVFZWJHYXoyMm9JaFVB?=
 =?utf-8?B?UTVlcTBMckZkdkZoTzZJR3dIekMvNkp4NFFsWVVqQXRPc2FrQS9iVUhnSkUy?=
 =?utf-8?B?N1NRNlBZNHFzNXlXWEw0T1E0UWtUUXhJSTlWUFdlY0s2Rkc3L0QvTFRETlRV?=
 =?utf-8?B?NWtLL0R1WXRUc3VIMGlmV1k0YkVEUnRteTBWUjF3VFBIUUk5VWdaN2JEV1Ew?=
 =?utf-8?B?RDN3SkZsV21vMGZiMkpPVUhISUU1UmVhTU9PQkF4VHdWdzg2K0VFbDFvTlM4?=
 =?utf-8?B?U3kyNUcxcDBIWnJJbjJHM2RPZ1NSNkFPZkZtcEVkUlpCcVlHNXNISDg0YldX?=
 =?utf-8?B?NW1kSUk5dk83ODIwNU1TY1lnc2dzUlYrblRxSDAwT3psV1BtQi9XS2ZaL0sv?=
 =?utf-8?B?VjhYb2lrbzQvUy9rQldhNE5OdjllNnhaSkJheXk2QklaeURQbE5BTVppbmVD?=
 =?utf-8?B?c0t0SWhUL3cyVm82cktQUkNSVTFkc0hhcHFFQXFRWVY1SjJXWWdsM1I3RytV?=
 =?utf-8?B?NnFUTGhFTUtZRkxHallMRm4yOS9wdXB6Zis3UWgxSXdMK0JBUGt1UWhnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NjJIcWhIYUl0amJDNUU0UlRuNS9tMDMwanoxSlZNSEFaa1o1NUZZN0t3N0NN?=
 =?utf-8?B?NElZZGc3L0JPR1B5QjNyVXU1Y3gxdlltei9iRWJKdHVaci9qVlFIOTZwRERB?=
 =?utf-8?B?SWhrUmxhWGdEK3dCVStUSDh6dnBidjQrUHllek0xblNwRjY2VXVhb0FxdXFD?=
 =?utf-8?B?MlFwbG9LM0JUNVlmOW9XUHdOSEtHcjgvejBpMG5ZZU5vQ3ZNV0dPbFdCWmdC?=
 =?utf-8?B?anhFc29aOU5aZ0N6VUJ5SUNUWk9HR2h6VHF4b3BnNVBkb1R0dmpzQmhycGZw?=
 =?utf-8?B?T2x4b1ZMLytXNXBRWXhsTHZ1TlZIMWdacUNpS3dkQWVQelEwdWJFSk13aEMy?=
 =?utf-8?B?RDRJYTZiRHZZZGt6dE5BVXdKQ3Fod3hVcGNlTlRiQ2hmd0VtYVQyTTV5MDFC?=
 =?utf-8?B?azdoeUtyRDhPUXdzTnRqSno1emg3TmEzTXhIN0tRU2pIR1FCVGU1U0FjRGNC?=
 =?utf-8?B?a0d1RDZBZFR3QmVkKzBTWGFDVzBhaUFObFZYZXZpdlFIQ0xWTGxScjIvWnBz?=
 =?utf-8?B?TWM4a25Qa0NXVGwrR0NIU1pkalV2YkF6R1kwSzNoZ3ViaTI2N2JDTXJWTzFk?=
 =?utf-8?B?K2xmVDRHWGl6alFwQzNWbXBMNGVwUFJRZVhubmhWVCtpQm1Za3RmdVZOV2h6?=
 =?utf-8?B?Y1lUeXRWenZqczV3V0tTa3V2dXJKNmJCUERWWk1icFRjMzdGTklWZGZwUjN3?=
 =?utf-8?B?UHVZMjZKUjhKM1hyY3AydmJCYkIySWdUUnNCS1Y1V1ZyRUdBaVFUeHFUL282?=
 =?utf-8?B?TWhEeG1SSk1Nei9FVHdtMDEwc1BMUm9raXh5RlQwQVl0UU90eXN4QjZha2k2?=
 =?utf-8?B?M2o1QkgvZ3FaWVpwUTRiVVgzYXNCSnd5SFEzWnBMYzUyWlBGVFlONmFQUFpH?=
 =?utf-8?B?c2IxOVU1aDZoRklmdnk2Vk1IaWErb1o1YU5TVzk1dUUwdEZQbFJucUw2SDlr?=
 =?utf-8?B?cVhYNlpwRU1HNVpUaWx5eFJ6bVJ6eDVPc0J6MG8zNkVmNVp3VDl6aXcxQnRp?=
 =?utf-8?B?Y1RqLzBsV3l1aG0xbEI4OUhiT3ljNnVlQzVjTStBakJnRkhncWozcU43OElt?=
 =?utf-8?B?SXZ0dmdaVkJPQTlCUFBVU3pkdTYrNVFBWkRCZ0loUFp4MW9FaU5DaTdsYjVR?=
 =?utf-8?B?Z3BJa2VORWN6N3VwbmhpVEs2M0dYenpxSHFSS2JPWFRpUE5aNXN4c1ZOejBR?=
 =?utf-8?B?V0dJQWhpZHdFVDVKWVJBcWJQeU5LQXFUOHpOaWs0WXdFNFVERHc2ZEtLbllP?=
 =?utf-8?B?L3huMkZad2FuUmRnMHdhWWp3N2pqRFlRSGdRdzdMMldST2lVUkcrNUM4Rjdm?=
 =?utf-8?B?bE1PLzZ6NnRhVC9ha3ZtZVNYY0ZZZ2dhak4vSjk2c1FibHNNeVJGR0FKWHZM?=
 =?utf-8?B?WW1venhUUmZLVWhmT2Fjd212MGt0bjhWVDhmb1J1YWphVkdnaVVXQVl4cDhh?=
 =?utf-8?B?UmZOQXlDNWh1Y2k2S0lZWGFnb2V3aTk1ZHlWRHpWeFp3Z0E0elZ4S2pJbEZL?=
 =?utf-8?B?QVV5OWRxeHBTU0JReTZsQ0dtczFSY2k3UFJDMnZmWXRrY0d3bm9INXVHelEw?=
 =?utf-8?B?dWptUjJ3TWVUQytXSDNFSFhuMlB3bE9uczd0cWRudllzaVh5bmZTQ3BFQVly?=
 =?utf-8?B?RXY1SjREU01DZVNTTDJobFlJb0poYmVQYUNPamJ6VG1LQ1dTU3A4ZzdZVWpo?=
 =?utf-8?B?R3UvRFpOWU11VWRCK05pd0ozWXc0QkNlSC8rUDdNOWRrZnpqMUZYbkNxbVVF?=
 =?utf-8?B?SmZCdmFwS3ZndkJrN2Y4SlRMWGFjSWkxdnlKSlRUemR2S0gvd0ZWSnpHWmJz?=
 =?utf-8?B?MW10U3ZacDRrNytKeWtpM3NYU1VMLzJScnRoRDJZN1M0MDVWSEFCMWlXTUFv?=
 =?utf-8?B?aUF6M1F2Zys5MXBPMHhuQWxiMjlRczZuSFBHNHVycTBSdzZ6ZXlZNmM1bWpw?=
 =?utf-8?B?UlBXZEpLNEIvU3RKNGF3RzdjcFBDY3k3L0FZL0QxdTR1eDh4SzlCWC9ZcnQz?=
 =?utf-8?B?MWl3NzRWNExlckc0OXpoQk4wYUdqdlZXcm81dkF1aCtiazYzT21yQXJNUFlX?=
 =?utf-8?B?VjYrTG9qTGZuSGJnMkRPUXJKK2RCbkkyWkpCRnh4NnBaOGRUT3R3bTkzNHRQ?=
 =?utf-8?B?WFJFRWNCUmd0YjMzMjhrYUxYZk56M0NFQlNDeHpCbGpvek1LUCt3L3BZWGRS?=
 =?utf-8?B?cXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 51abf904-4bf1-4592-db0e-08dd04d40b6f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2024 17:44:53.0839 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r4NUuJuDQGeYj4lfk/pJDH5At6F86OQvhpcrg9NkHggpLA+5OgM94Skxz3UA9H4+r/hbiRRdfpa/yF0KrEPEw8hwEeAzfArAhn/IR1hMbfA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4969
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


On 11/13/2024 7:16 PM, Lucas De Marchi wrote:
> On Wed, Nov 13, 2024 at 09:42:40AM -0800, Vinay Belgaumkar wrote:
>> From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
>>
>> Basic PMU enabling patch. Setup the basic framework
>> for adding events/timers. This patch was previously
>> reviewed here -
>> https://patchwork.freedesktop.org/series/119504/
>>
>> The pmu base implementation is still from the
>> i915 driver.
>>
>> v2: Review comments(Rodrigo) and do not init pmu for VFs
>> as they don't have access to freq and c6 residency anyways.
>>
>> v3: Fix kunit issue, move xe_pmu entry in Makefile (Jani) and
>> move drm uapi definitions (Lucas)
>>
>> v4: Adapt Lucas's recent PMU fixes for i915
>> v5: Fix some kernel doc issues
>>
>> Co-developed-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
>> Co-developed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
>> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>
> are all these s-o-b and r-b still valid after several changes and back
> and forth?
r-b is recent, s-o-b's are old.
>
>
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> ---
>> drivers/gpu/drm/xe/Makefile          |   2 +
>> drivers/gpu/drm/xe/xe_device.c       |   6 +
>> drivers/gpu/drm/xe/xe_device_types.h |   4 +
>> drivers/gpu/drm/xe/xe_module.c       |   5 +
>> drivers/gpu/drm/xe/xe_pmu.c          | 579 +++++++++++++++++++++++++++
>> drivers/gpu/drm/xe/xe_pmu.h          |  26 ++
>> drivers/gpu/drm/xe/xe_pmu_types.h    |  70 ++++
>> 7 files changed, 692 insertions(+)
>> create mode 100644 drivers/gpu/drm/xe/xe_pmu.c
>> create mode 100644 drivers/gpu/drm/xe/xe_pmu.h
>> create mode 100644 drivers/gpu/drm/xe/xe_pmu_types.h
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index a93e6fcc0ad9..c231ecaf86b8 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -299,6 +299,8 @@ ifeq ($(CONFIG_DEBUG_FS),y)
>>         i915-display/intel_pipe_crc.o
>> endif
>>
>> +xe-$(CONFIG_PERF_EVENTS) += xe_pmu.o
>> +
>> obj-$(CONFIG_DRM_XE) += xe.o
>> obj-$(CONFIG_DRM_XE_KUNIT_TEST) += tests/
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device.c 
>> b/drivers/gpu/drm/xe/xe_device.c
>> index 0e2dd691bdae..89463cf7cc2c 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -759,6 +759,9 @@ int xe_device_probe(struct xe_device *xe)
>>     for_each_gt(gt, xe, id)
>>         xe_gt_sanitize_freq(gt);
>>
>> +    if (!IS_SRIOV_VF(xe))
>> +        xe_pmu_register(&xe->pmu);
>
> this IS_SRIOV_VF be inside xe_pmu_register()
ok.
>
> Also, differently than i915, the direction is to fail probe if any
> component fails. So this call should return something and we should deal
> with the fallout if it happens.
>
> not all parts of the probe got the memo though and requiring this to be
> done here would be outside of scope.
>
> Anyway, this should definitely not be be between xe_gt_sanitize_freq()
> and the return!
Ok, will move it near the oa_register.
>
>> +
>>     return devm_add_action_or_reset(xe->drm.dev, xe_device_sanitize, 
>> xe);
>>
>> err_fini_display:
>> @@ -803,6 +806,9 @@ void xe_device_remove(struct xe_device *xe)
>>
>>     xe_heci_gsc_fini(xe);
>>
>> +    if (!IS_SRIOV_VF(xe))
>> +        xe_pmu_unregister(&xe->pmu);
>
> same thing, no check for SRIOV in here. It's not even needed inside
> xe_pmu_unregister() as it only unregisters if it got registered at some
> point.
>
> This should follow the inverse order of registration.
>
> [ It's sad we got mixed style in the probe and it's now
>   a complete mess. The idea behind the calls 
> devm_add_action_or_reset() is
>   that you wouldn't need the call on the remove side since it'd be
>   automatically called. In the right order. ]
>
> For now, let's just move this above xe_oa_unregister(), since it got
> registered after it.
ok.
>
>> +
>>     for_each_gt(gt, xe, id)
>>         xe_gt_remove(gt);
>> }
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h 
>> b/drivers/gpu/drm/xe/xe_device_types.h
>> index bccca63c8a48..0cb8d650135a 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -18,6 +18,7 @@
>> #include "xe_memirq_types.h"
>> #include "xe_oa.h"
>> #include "xe_platform_types.h"
>> +#include "xe_pmu.h"
>
> you will need a xe_pmu_types.h where you only define the types.
> See the other lines that serve as good citizens, don't look at xe_oa.h
I do have xe_pmu_types.h defined.
>
>
>> #include "xe_pt_types.h"
>> #include "xe_sriov_types.h"
>> #include "xe_step_types.h"
>> @@ -509,6 +510,9 @@ struct xe_device {
>>         int mode;
>>     } wedged;
>>
>> +    /** @pmu: performance monitoring unit */
>> +    struct xe_pmu pmu;
>> +
>> #ifdef TEST_VM_OPS_ERROR
>>     /**
>>      * @vm_inject_error_position: inject errors at different places 
>> in VM
>> diff --git a/drivers/gpu/drm/xe/xe_module.c 
>> b/drivers/gpu/drm/xe/xe_module.c
>> index 77ce9f9ca7a5..1bf2bf8447c0 100644
>> --- a/drivers/gpu/drm/xe/xe_module.c
>> +++ b/drivers/gpu/drm/xe/xe_module.c
>> @@ -14,6 +14,7 @@
>> #include "xe_hw_fence.h"
>> #include "xe_pci.h"
>> #include "xe_pm.h"
>> +#include "xe_pmu.h"
>> #include "xe_observation.h"
>> #include "xe_sched_job.h"
>>
>> @@ -96,6 +97,10 @@ static const struct init_funcs init_funcs[] = {
>>         .init = xe_sched_job_module_init,
>>         .exit = xe_sched_job_module_exit,
>>     },
>> +    {
>> +        .init = xe_pmu_init,
>> +        .exit = xe_pmu_exit,
>> +    },
>>     {
>>         .init = xe_register_pci_driver,
>>         .exit = xe_unregister_pci_driver,
>> diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
>> new file mode 100644
>> index 000000000000..2bd98c91ab0f
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_pmu.c
>> @@ -0,0 +1,579 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2024 Intel Corporation
>> + */
>> +
>> +#include <drm/drm_drv.h>
>> +#include <drm/drm_managed.h>
>> +#include <drm/xe_drm.h>
>> +
>> +#include "regs/xe_gt_regs.h"
>> +#include "xe_device.h"
>> +#include "xe_force_wake.h"
>> +#include "xe_gt_clock.h"
>> +#include "xe_mmio.h"
>> +#include "xe_macros.h"
>> +#include "xe_pm.h"
>> +
>> +/*
>> + * CPU mask is defined/initialized at a module level. All devices
>> + * inside this module share this mask.
>> + */
>> +static cpumask_t xe_pmu_cpumask;
>> +static unsigned int xe_pmu_target_cpu = -1;
>
> I still have no idea why we need this, even worse that it is at the
> module level rather than the driver/device level.
>
> since we are working with the gpu it seems we are limiting perf to
> create the event in just 1 cpu, and because of this we then need to let
> it migrate to another cpu if that cpu go offline. Wouldn't it suffice
> to set cpumask syfs to 0 like we have in e.g. cstate_pkg?
>
> $ cat  /sys/bus/event_source/devices/cstate_pkg/cpumask 0
Yes, I think we can safely assume CPU 0 will not go offline, especially 
when we are collecting stats.
>
>> +
>> +/**
>> + * DOC: Xe PMU (Performance Monitoring Unit)
>> + *
>> + * Expose events/counters like C6 residency and GT frequency to user 
>> land.
>> + * Perf tool can be used to list these counters from the command line.
>> + *
>> + * Example commands to list/record supported perf events-
>> + *
>> + * $ ls -ld /sys/bus/event_source/devices/xe_*
>> + * $ ls /sys/bus/event_source/devices/xe_0000_00_02.0/events/
>> + *
>> + * You can also use the perf tool to grep for a certain event-
>> + * $ perf list | grep rc6
>> + *
>> + * To list a specific event at regular intervals-
>> + * $ perf stat -e <event_name> -I <interval>
>> + *
>> + */
>> +
>> +static unsigned int config_gt_id(const u64 config)
>> +{
>> +    return config >> __XE_PMU_GT_SHIFT;
>> +}
>> +
>> +static u64 config_counter(const u64 config)
>> +{
>> +    return config & ~(~0ULL << __XE_PMU_GT_SHIFT);
>> +}
>> +
>> +static void xe_pmu_event_destroy(struct perf_event *event)
>> +{
>> +    struct xe_device *xe =
>> +        container_of(event->pmu, typeof(*xe), pmu.base);
>> +
>> +    drm_WARN_ON(&xe->drm, event->parent);
>> +
>> +    drm_dev_put(&xe->drm);
>> +}
>> +
>> +static int
>> +config_status(struct xe_device *xe, u64 config)
>> +{
>> +    unsigned int gt_id = config_gt_id(config);
>> +
>> +    if (gt_id >= XE_MAX_GT_PER_TILE)
>> +        return -ENOENT;
>> +
>> +    switch (config_counter(config)) {
>> +    default:
>> +        return -ENOENT;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static int xe_pmu_event_init(struct perf_event *event)
>> +{
>> +    struct xe_device *xe =
>> +        container_of(event->pmu, typeof(*xe), pmu.base);
>> +    struct xe_pmu *pmu = &xe->pmu;
>> +    int ret;
>> +
>> +    if (!pmu->registered)
>> +        return -ENODEV;
>> +
>> +    if (event->attr.type != event->pmu->type)
>> +        return -ENOENT;
>> +
>> +    /* unsupported modes and filters */
>> +    if (event->attr.sample_period) /* no sampling */
>> +        return -EINVAL;
>> +
>> +    if (has_branch_stack(event))
>> +        return -EOPNOTSUPP;
>> +
>> +    if (event->cpu < 0)
>> +        return -EINVAL;
>> +
>> +    /* only allow running on one cpu at a time */
>> +    if (!cpumask_test_cpu(event->cpu, &xe_pmu_cpumask))
>> +        return -EINVAL;
>> +
>> +    ret = config_status(xe, event->attr.config);
>> +    if (ret)
>> +        return ret;
>> +
>> +    if (!event->parent) {
>> +        drm_dev_get(&xe->drm);
>> +        event->destroy = xe_pmu_event_destroy;
>
> We won't need this anymore after the pending pmu patches.
> We can keep it if we end up applying this before.
>
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static u64 __xe_pmu_event_read(struct perf_event *event)
>> +{
>> +    struct xe_device *xe =
>> +        container_of(event->pmu, typeof(*xe), pmu.base);
>> +    const unsigned int gt_id = config_gt_id(event->attr.config);
>> +    const u64 config = event->attr.config;
>> +    struct xe_gt *gt = xe_device_get_gt(xe, gt_id);
>> +    u64 val = 0;
>> +
>> +    switch (config_counter(config)) {
>> +    default:
>> +        drm_warn(&gt->tile->xe->drm, "unknown pmu event\n");
>> +    }
>> +
>> +    return val;
>> +}
>> +
>> +static void xe_pmu_event_read(struct perf_event *event)
>> +{
>> +    struct xe_device *xe =
>> +        container_of(event->pmu, typeof(*xe), pmu.base);
>> +    struct hw_perf_event *hwc = &event->hw;
>> +    struct xe_pmu *pmu = &xe->pmu;
>> +    u64 prev, new;
>> +
>> +    if (!pmu->registered) {
>> +        event->hw.state = PERF_HES_STOPPED;
>> +        return;
>> +    }
>> +again:
>> +    prev = local64_read(&hwc->prev_count);
>> +    new = __xe_pmu_event_read(event);
>> +
>> +    if (local64_cmpxchg(&hwc->prev_count, prev, new) != prev)
>> +        goto again;
>
> should have been a do { } while() and need to use the try_cmpxchg 
> variant.
> we shouldn't need the local64_read(&hwc->prev_count) when repeating.
>
> I think arch/x86/events/rapl.c:rapl_event_update() is a good reference.
ok.
>
>> +
>> +    local64_add(new - prev, &event->count);
>> +}
>> +
>> +static void xe_pmu_enable(struct perf_event *event)
>> +{
>> +    /*
>> +     * Store the current counter value so we can report the correct 
>> delta
>> +     * for all listeners. Even when the event was already enabled 
>> and has
>> +     * an existing non-zero value.
>> +     */
>> +    local64_set(&event->hw.prev_count, __xe_pmu_event_read(event));
>> +}
>> +
>> +static void xe_pmu_event_start(struct perf_event *event, int flags)
>> +{
>> +    struct xe_device *xe =
>> +        container_of(event->pmu, typeof(*xe), pmu.base);
>> +    struct xe_pmu *pmu = &xe->pmu;
>> +
>> +    if (!pmu->registered)
>> +        return;
>> +
>> +    xe_pmu_enable(event);
>> +    event->hw.state = 0;
>> +}
>> +
>> +static void xe_pmu_event_stop(struct perf_event *event, int flags)
>> +{
>> +    struct xe_device *xe =
>> +        container_of(event->pmu, typeof(*xe), pmu.base);
>> +    struct xe_pmu *pmu = &xe->pmu;
>> +
>> +    if (!pmu->registered)
>> +        goto out;
>> +
>> +    if (flags & PERF_EF_UPDATE)
>> +        xe_pmu_event_read(event);
>> +
>> +out:
>> +    event->hw.state = PERF_HES_STOPPED;
>> +}
>> +
>> +static int xe_pmu_event_add(struct perf_event *event, int flags)
>> +{
>> +    struct xe_device *xe =
>> +        container_of(event->pmu, typeof(*xe), pmu.base);
>> +    struct xe_pmu *pmu = &xe->pmu;
>> +
>> +    if (!pmu->registered)
>> +        return -ENODEV;
>> +
>> +    if (flags & PERF_EF_START)
>> +        xe_pmu_event_start(event, flags);
>> +
>> +    return 0;
>> +}
>> +
>> +static void xe_pmu_event_del(struct perf_event *event, int flags)
>> +{
>> +    xe_pmu_event_stop(event, PERF_EF_UPDATE);
>> +}
>> +
>> +static int xe_pmu_event_event_idx(struct perf_event *event)
>> +{
>> +    return 0;
>> +}
>> +
>> +struct xe_ext_attribute {
>> +    struct device_attribute attr;
>> +    unsigned long val;
>> +};
>> +
>> +static ssize_t xe_pmu_event_show(struct device *dev,
>> +                 struct device_attribute *attr, char *buf)
>> +{
>> +    struct xe_ext_attribute *eattr;
>> +
>> +    eattr = container_of(attr, struct xe_ext_attribute, attr);
>> +    return sprintf(buf, "config=0x%lx\n", eattr->val);
>> +}
>> +
>> +static ssize_t cpumask_show(struct device *dev,
>> +                struct device_attribute *attr, char *buf)
>> +{
>> +    return cpumap_print_to_pagebuf(true, buf, &xe_pmu_cpumask);
>> +}
>> +
>> +static DEVICE_ATTR_RO(cpumask);
>> +
>> +static struct attribute *xe_cpumask_attrs[] = {
>> +    &dev_attr_cpumask.attr,
>> +    NULL,
>> +};
>> +
>> +static const struct attribute_group xe_pmu_cpumask_attr_group = {
>> +    .attrs = xe_cpumask_attrs,
>> +};
>> +
>> +#define __event(__counter, __name, __unit) \
>> +{ \
>> +    .counter = (__counter), \
>> +    .name = (__name), \
>> +    .unit = (__unit), \
>> +}
>> +
>> +static struct xe_ext_attribute *
>> +add_xe_attr(struct xe_ext_attribute *attr, const char *name, u64 
>> config)
>> +{
>> +    sysfs_attr_init(&attr->attr.attr);
>> +    attr->attr.attr.name = name;
>> +    attr->attr.attr.mode = 0444;
>> +    attr->attr.show = xe_pmu_event_show;
>> +    attr->val = config;
>> +
>> +    return ++attr;
>> +}
>> +
>> +static struct perf_pmu_events_attr *
>> +add_pmu_attr(struct perf_pmu_events_attr *attr, const char *name,
>> +         const char *str)
>> +{
>> +    sysfs_attr_init(&attr->attr.attr);
>> +    attr->attr.attr.name = name;
>> +    attr->attr.attr.mode = 0444;
>> +    attr->attr.show = perf_event_sysfs_show;
>> +    attr->event_str = str;
>> +
>> +    return ++attr;
>> +}
>> +
>> +static struct attribute **
>> +create_event_attributes(struct xe_pmu *pmu)
>> +{
>> +    struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
>> +    static const struct {
>> +        unsigned int counter;
>> +        const char *name;
>> +        const char *unit;
>> +    } events[] = {
>> +    };
>> +
>> +    struct perf_pmu_events_attr *pmu_attr = NULL, *pmu_iter;
>> +    struct xe_ext_attribute *xe_attr = NULL, *xe_iter;
>> +    struct attribute **attr = NULL, **attr_iter;
>> +    unsigned int count = 0;
>> +    unsigned int i, j;
>> +    struct xe_gt *gt;
>> +
>> +    /* Count how many counters we will be exposing. */
>> +    for_each_gt(gt, xe, j) {
>> +        for (i = 0; i < ARRAY_SIZE(events); i++) {
>> +            u64 config = ___XE_PMU_OTHER(j, events[i].counter);
>
> what's "OTHER"?
I guess this is from i915 where anything other than busyness was 
categorized OTHER.
>
>> +
>> +            if (!config_status(xe, config))
>> +                count++;
>> +        }
>> +    }
>> +
>> +    /* Allocate attribute objects and table. */
>> +    xe_attr = kcalloc(count, sizeof(*xe_attr), GFP_KERNEL);
>
> afair from doing the dummy_pmu
> (https://lore.kernel.org/all/20241008183501.1354695-1-lucas.demarchi@intel.com/) 
>
> we don't need to allocate the attributes. What we need is a function
> like dummy_pmu_events_sysfs_show() that returns the right config using
> the id.
ok.
>
>
>> +    if (!xe_attr)
>> +        goto err_alloc;
>> +
>> +    pmu_attr = kcalloc(count, sizeof(*pmu_attr), GFP_KERNEL);
>> +    if (!pmu_attr)
>> +        goto err_alloc;
>> +
>> +    /* Max one pointer of each attribute type plus a termination 
>> entry. */
>> +    attr = kcalloc(count * 2 + 1, sizeof(*attr), GFP_KERNEL);
>> +    if (!attr)
>> +        goto err_alloc;
>> +
>> +    xe_iter = xe_attr;
>> +    pmu_iter = pmu_attr;
>> +    attr_iter = attr;
>> +
>> +    for_each_gt(gt, xe, j) {
>> +        for (i = 0; i < ARRAY_SIZE(events); i++) {
>> +            u64 config = ___XE_PMU_OTHER(j, events[i].counter);
>> +            char *str;
>> +
>> +            if (config_status(xe, config))
>> +                continue;
>> +
>> +            str = kasprintf(GFP_KERNEL, "%s-gt%u",
>> +                    events[i].name, j);
>> +            if (!str)
>> +                goto err;
>> +
>> +            *attr_iter++ = &xe_iter->attr.attr;
>> +            xe_iter = add_xe_attr(xe_iter, str, config);
>> +
>> +            if (events[i].unit) {
>> +                str = kasprintf(GFP_KERNEL, "%s-gt%u.unit",
>> +                        events[i].name, j);
>> +                if (!str)
>> +                    goto err;
>> +
>> +                *attr_iter++ = &pmu_iter->attr.attr;
>> +                pmu_iter = add_pmu_attr(pmu_iter, str,
>> +                            events[i].unit);
>> +            }
>> +        }
>> +    }
>> +
>> +    pmu->xe_attr = xe_attr;
>> +    pmu->pmu_attr = pmu_attr;
>> +
>> +    return attr;
>> +
>> +err:
>> +    for (attr_iter = attr; *attr_iter; attr_iter++)
>> +        kfree((*attr_iter)->name);
>> +
>> +err_alloc:
>> +    kfree(attr);
>> +    kfree(xe_attr);
>> +    kfree(pmu_attr);
>> +
>> +    return NULL;
>> +}
>> +
>> +static void free_event_attributes(struct xe_pmu *pmu)
>> +{
>> +    struct attribute **attr_iter = pmu->events_attr_group.attrs;
>> +
>> +    for (; *attr_iter; attr_iter++)
>> +        kfree((*attr_iter)->name);
>> +
>> +    kfree(pmu->events_attr_group.attrs);
>> +    kfree(pmu->xe_attr);
>> +    kfree(pmu->pmu_attr);
>> +
>> +    pmu->events_attr_group.attrs = NULL;
>> +    pmu->xe_attr = NULL;
>> +    pmu->pmu_attr = NULL;
>> +}
>> +
>> +static int xe_pmu_cpu_online(unsigned int cpu, struct hlist_node *node)
>> +{
>> +    struct xe_pmu *pmu = hlist_entry_safe(node, typeof(*pmu), 
>> cpuhp.node);
>> +
>> +    /* Select the first online CPU as a designated reader. */
>> +    if (cpumask_empty(&xe_pmu_cpumask))
>> +        cpumask_set_cpu(cpu, &xe_pmu_cpumask);
>> +
>> +    return 0;
>> +}
>> +
>> +static int xe_pmu_cpu_offline(unsigned int cpu, struct hlist_node 
>> *node)
>> +{
>> +    struct xe_pmu *pmu = hlist_entry_safe(node, typeof(*pmu), 
>> cpuhp.node);
>> +    unsigned int target = xe_pmu_target_cpu;
>> +
>> +    /*
>> +     * Unregistering an instance generates a CPU offline event which 
>> we must
>> +     * ignore to avoid incorrectly modifying the shared xe_pmu_cpumask.
>> +     */
>> +    if (!pmu->registered)
>> +        return 0;
>> +
>> +    if (cpumask_test_and_clear_cpu(cpu, &xe_pmu_cpumask)) {
>> +        target = cpumask_any_but(topology_sibling_cpumask(cpu), cpu);
>> +
>> +        /* Migrate events if there is a valid target */
>> +        if (target < nr_cpu_ids) {
>> +            cpumask_set_cpu(target, &xe_pmu_cpumask);
>> +            xe_pmu_target_cpu = target;
>> +        }
>> +    }
>> +
>> +    if (target < nr_cpu_ids && target != pmu->cpuhp.cpu) {
>> +        perf_pmu_migrate_context(&pmu->base, cpu, target);
>> +        pmu->cpuhp.cpu = target;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static enum cpuhp_state cpuhp_state = CPUHP_INVALID;
>> +
>> +/**
>> + * xe_pmu_init() - Setup CPU hotplug state/callbacks for Xe PMU
>> + *
>> + * Returns: 0 if successful, else error code
>> + */
>> +int xe_pmu_init(void)
>> +{
>> +    int ret;
>> +
>> +    ret = cpuhp_setup_state_multi(CPUHP_AP_ONLINE_DYN,
>> +                      "perf/x86/intel/xe:online",
>> +                      xe_pmu_cpu_online,
>> +                      xe_pmu_cpu_offline);
>> +    if (ret < 0)
>> +        pr_notice("Failed to setup cpuhp state for xe PMU! (%d)\n",
>> +              ret);
>> +    else
>> +        cpuhp_state = ret;
>> +
>> +    return 0;
>> +}
>> +
>> +/**
>> + * xe_pmu_exit() - Remove CPU hotplug state/callbacks for Xe PMU
>> + */
>> +void xe_pmu_exit(void)
>> +{
>> +    if (cpuhp_state != CPUHP_INVALID)
>> +        cpuhp_remove_multi_state(cpuhp_state);
>> +}
>> +
>> +static int xe_pmu_register_cpuhp_state(struct xe_pmu *pmu)
>> +{
>> +    if (cpuhp_state == CPUHP_INVALID)
>> +        return -EINVAL;
>> +
>> +    return cpuhp_state_add_instance(cpuhp_state, &pmu->cpuhp.node);
>> +}
>> +
>> +static void xe_pmu_unregister_cpuhp_state(struct xe_pmu *pmu)
>> +{
>> +    cpuhp_state_remove_instance(cpuhp_state, &pmu->cpuhp.node);
>> +}
>> +
>> +/**
>> + * xe_pmu_unregister() - Remove/cleanup PMU registration
>> + * @arg: Ptr to pmu
>> + */
>> +void xe_pmu_unregister(void *arg)
>> +{
>> +    struct xe_pmu *pmu = arg;
>> +
>> +    if (!pmu->registered)
>> +        return;
>> +
>> +    pmu->registered = false;
>> +
>> +    xe_pmu_unregister_cpuhp_state(pmu);
>> +
>> +    perf_pmu_unregister(&pmu->base);
>> +    kfree(pmu->base.attr_groups);
>> +    kfree(pmu->name);
>> +    free_event_attributes(pmu);
>> +}
>> +
>> +/**
>> + * xe_pmu_register() - Define basic PMU properties for Xe and add 
>> event callbacks.
>> + * @pmu: the PMU object
>> + *
>> + */
>> +void xe_pmu_register(struct xe_pmu *pmu)
>> +{
>> +    struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
>> +    const struct attribute_group *attr_groups[] = {
>> +        &pmu->events_attr_group,
>> +        &xe_pmu_cpumask_attr_group,
>> +        NULL
>> +    };
>> +
>> +    int ret = -ENOMEM;
>> +
>> +    spin_lock_init(&pmu->lock);
>> +    pmu->cpuhp.cpu = -1;
>> +
>> +    pmu->name = kasprintf(GFP_KERNEL,
>> +                  "xe_%s",
>> +                  dev_name(xe->drm.dev));
>> +    if (pmu->name) {
>> +        /* tools/perf reserves colons as special. */
>> +        strreplace((char *)pmu->name, ':', '_');
>> +    }
>> +
>> +    if (!pmu->name)
>> +        goto err;
>> +
>> +    pmu->events_attr_group.name = "events";
>> +    pmu->events_attr_group.attrs = create_event_attributes(pmu);
>> +    if (!pmu->events_attr_group.attrs)
>> +        goto err_name;
>> +
>> +    pmu->base.attr_groups = kmemdup(attr_groups, sizeof(attr_groups),
>> +                    GFP_KERNEL);
>> +    if (!pmu->base.attr_groups)
>> +        goto err_attr;
>> +
>> +    pmu->base.module    = THIS_MODULE;
>> +    pmu->base.task_ctx_nr    = perf_invalid_context;
>> +    pmu->base.event_init    = xe_pmu_event_init;
>> +    pmu->base.add        = xe_pmu_event_add;
>> +    pmu->base.del        = xe_pmu_event_del;
>> +    pmu->base.start        = xe_pmu_event_start;
>> +    pmu->base.stop        = xe_pmu_event_stop;
>> +    pmu->base.read        = xe_pmu_event_read;
>> +    pmu->base.event_idx    = xe_pmu_event_event_idx;
>> +
>> +    ret = perf_pmu_register(&pmu->base, pmu->name, -1);
>> +    if (ret)
>> +        goto err_groups;
>> +
>> +    ret = xe_pmu_register_cpuhp_state(pmu);
>> +    if (ret)
>> +        goto err_unreg;
>> +
>> +    ret = devm_add_action_or_reset(xe->drm.dev, xe_pmu_unregister, 
>> pmu);
>> +    if (ret)
>> +        goto err_cpuhp;
>
> now I'm confused... if you added it here as an action to be called on
> remove, why are you manually calling xe_pmu_unregister() on xe_device.c?
>
>
> So.... I have some stashed changes here with the suggestions I mentioned
> above and will probably have some more once I get to play with it. Are
> you ok if I just do the changes locally and submit the result?

Sure.

Thanks,

Vinay.

>
> thanks
> Lucas De Marchi
>
>> +
>> +    pmu->registered = true;
>> +
>> +    return;
>> +
>> +err_cpuhp:
>> +    xe_pmu_unregister_cpuhp_state(pmu);
>> +err_unreg:
>> +    perf_pmu_unregister(&pmu->base);
>> +err_groups:
>> +    kfree(pmu->base.attr_groups);
>> +err_attr:
>> +    free_event_attributes(pmu);
>> +err_name:
>> +    kfree(pmu->name);
>> +err:
>> +    drm_notice(&xe->drm, "Failed to register PMU!\n");
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_pmu.h b/drivers/gpu/drm/xe/xe_pmu.h
>> new file mode 100644
>> index 000000000000..d07e5dfdfec0
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_pmu.h
>> @@ -0,0 +1,26 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2024 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_PMU_H_
>> +#define _XE_PMU_H_
>> +
>> +#include "xe_pmu_types.h"
>> +
>> +struct xe_gt;
>> +
>> +#if IS_ENABLED(CONFIG_PERF_EVENTS)
>> +int xe_pmu_init(void);
>> +void xe_pmu_exit(void);
>> +void xe_pmu_register(struct xe_pmu *pmu);
>> +void xe_pmu_unregister(void *arg);
>> +#else
>> +static inline int xe_pmu_init(void) { return 0; }
>> +static inline void xe_pmu_exit(void) {}
>> +static inline void xe_pmu_register(struct xe_pmu *pmu) {}
>> +static inline void xe_pmu_unregister(void *arg) {}
>> +#endif
>> +
>> +#endif
>> +
>> diff --git a/drivers/gpu/drm/xe/xe_pmu_types.h 
>> b/drivers/gpu/drm/xe/xe_pmu_types.h
>> new file mode 100644
>> index 000000000000..4da96b8fadd1
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_pmu_types.h
>> @@ -0,0 +1,70 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2024 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_PMU_TYPES_H_
>> +#define _XE_PMU_TYPES_H_
>> +
>> +#include <linux/perf_event.h>
>> +#include <linux/spinlock_types.h>
>> +
>> +enum {
>> +    __XE_NUM_PMU_SAMPLERS
>> +};
>> +
>> +#define XE_PMU_MAX_GT 2
>> +
>> +/*
>> + * Top bits of every counter are GT id.
>> + */
>> +#define __XE_PMU_GT_SHIFT (56)
>> +
>> +#define ___XE_PMU_OTHER(gt, x) \
>> +    (((__u64)(x)) | ((__u64)(gt) << __XE_PMU_GT_SHIFT))
>> +
>> +struct xe_pmu {
>> +    /**
>> +     * @cpuhp: Struct used for CPU hotplug handling.
>> +     */
>> +    struct {
>> +        struct hlist_node node;
>> +        unsigned int cpu;
>> +    } cpuhp;
>> +    /**
>> +     * @base: PMU base.
>> +     */
>> +    struct pmu base;
>> +    /**
>> +     * @registered: PMU is registered and not in the unregistering 
>> process.
>> +     */
>> +    bool registered;
>> +    /**
>> +     * @name: Name as registered with perf core.
>> +     */
>> +    const char *name;
>> +    /**
>> +     * @lock: Lock protecting enable mask and ref count handling.
>> +     */
>> +    spinlock_t lock;
>> +    /**
>> +     * @sample: Current and previous (raw) counters.
>> +     *
>> +     * These counters are updated when the device is awake.
>> +     */
>> +    u64 sample[XE_PMU_MAX_GT][__XE_NUM_PMU_SAMPLERS];
>> +    /**
>> +     * @events_attr_group: Device events attribute group.
>> +     */
>> +    struct attribute_group events_attr_group;
>> +    /**
>> +     * @xe_attr: Memory block holding device attributes.
>> +     */
>> +    void *xe_attr;
>> +    /**
>> +     * @pmu_attr: Memory block holding device attributes.
>> +     */
>> +    void *pmu_attr;
>> +};
>> +
>> +#endif
>> -- 
>> 2.38.1
>>
