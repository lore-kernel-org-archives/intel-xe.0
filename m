Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A55BAC7EE31
	for <intel-xe@archiver.kernel.org>; Thu, 26 Jun 2025 17:03:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54BF210E2BB;
	Thu, 26 Jun 2025 17:03:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZmzRA8rM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FC1C10E2BB
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Jun 2025 17:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750957388; x=1782493388;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=phrhQt31wQim185gpSIYiGm8Hqc4vk1h0eSTm/nwKfY=;
 b=ZmzRA8rM4Di+AoWoNhvn/zeDSei3PuBahkCda2jyrZbXAbm6okoCJ4aw
 nmef3jzpQuN0aXalHDzox5cx7xvnGlS/oZVCwHLHZYqizoi/CH5V0IjWc
 rGdW6S2gYEiAFjAOqpfPjgQx5zPBzPyLXdoHhgw+0zFBac+WVKbrskhM5
 BLOTZjdzfGWe+/Q+EdpkukjNxHNt0I9lgTBhUOhvKpe1WEZvumTvCDGtI
 biNXrWN72cph8taikjScO8RrH0VdbalbBTdulJsj7Va3/SV4E8Drqg3+b
 pXEStaQme2ujUCZXL7Oj4A61rTaRAHI9TBfGr0H7CqbfI1PisMhCUKNZ+ A==;
X-CSE-ConnectionGUID: aVdlWSg+Tp2cdzapAQNxbA==
X-CSE-MsgGUID: NnOSpop7Sl6icMUtnNGZpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="57071805"
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; d="scan'208";a="57071805"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 10:03:08 -0700
X-CSE-ConnectionGUID: FOf+9+HCS8m459AXXqKoVg==
X-CSE-MsgGUID: ea73v5OYQMulgvXLX30RQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; d="scan'208";a="157133475"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 10:03:07 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 26 Jun 2025 10:03:07 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 26 Jun 2025 10:03:07 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.62) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 26 Jun 2025 10:03:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WI/Tx3HE5eQ2/UYl4NpKLWGAbx24nEQ9VsD15D26caGB5v1Bh6YvJEvg2AxW8QqH9edbdm4MPXA5iRxCmk60FkYqO9N9VA+WYy7Oax6aVFk2eQeJMz4RKOubCY/NOTffClFzO0/E7jRI+ksXAkZV+YrNh60WXqfg9RxwnZnN9UkY/d+7CJ/xnxiHEbJzyJAuROiqJ9nIIMLRw0DqvsyNY7WezxxugOZXstmUvW8xfuohDJ71ZZ0vsKzGxcmBLez+5FIiM+ovfDqd/OSVB0cfi6DaKZlMAmT0IR+1fZsPtlA8hLXIDNCDTUJfoAJ4KzLDVyXIoBwX/wmAcujZgGUqCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qvh5pFRHkngfC/N4aEU015pidtZAUHSBTOezKCe2a5I=;
 b=H0uSXGIp6xSO19AFHdxpSn6nGugbMdSXP/dyr39/gHR97Alnr3cDWg1h3r615lv3fqkoGzh0In6p7J57c5x/QZRI1s4AuhPzwRl4Aod8Y72wk89BQuUwpThLOHEWARi+HM2lZLLyz6jT0OCQ+N2xAZmv3I6H8477xXs53igC/Dcnp+Y5YTTtJLJ17x101AqmCU7g/E/fSSbDz5syUUxycPApIf4qSrQx/QTqWp/n+RSC/8dUD4wjH7g1KKKLZLH//GaZ19V+ghIsVKh9LTBxEaqdVt7zu+P67we5Yu/YgePABaAk8EBtGnXtMrR+S5bOu82UdJHxktAb49VRLKgkrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 PH7PR11MB6355.namprd11.prod.outlook.com (2603:10b6:510:1fd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.30; Thu, 26 Jun
 2025 17:03:02 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%4]) with mapi id 15.20.8857.026; Thu, 26 Jun 2025
 17:03:01 +0000
Message-ID: <56089e4a-806e-4a9f-8945-02b4b301d9ca@intel.com>
Date: Thu, 26 Jun 2025 22:32:53 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/2] drm/xe/regs/xe_pmt: Macros for G-State and pcie
 link state residency offset
To: Soham Purkait <soham.purkait@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <karthik.poosa@intel.com>, <jonathan.cavitt@intel.com>
CC: <lucas.demarchi@intel.com>, <ashutosh.dixit@intel.com>,
 <jani.nikula@intel.com>
References: <20250626131805.3977408-1-soham.purkait@intel.com>
 <20250626131805.3977408-2-soham.purkait@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20250626131805.3977408-2-soham.purkait@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0002.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::8) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|PH7PR11MB6355:EE_
X-MS-Office365-Filtering-Correlation-Id: abfad349-659c-4cb9-f26e-08ddb4d34f13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?elJ0cHhxZFczNjZPbDlMcFhLVnRMWGROZnh1RmRlYkxiSXJHejRUaVBOMjk0?=
 =?utf-8?B?NHorL2FqQWpxamxrUWdlbXlHbEJjMWxpL1h5WWhub0JlSHp6V2N5c1YwSTQ1?=
 =?utf-8?B?dlhUOEduRmY3MkhMNGFKazVHYWJSeHg4aGgraGE2MGZiWXJsL3RYc21LVzNs?=
 =?utf-8?B?emxzeFNnV2tCRHRvK3dkNzBER2NGWmp5a2RBaDVHK2xxQkRuR0RIa2I3NkNr?=
 =?utf-8?B?Rk54cXQvRU5hTlkwSEhhdjU4T3V0QjZUbElaTVR5ZFI4bytYTUh5NDNPQlM4?=
 =?utf-8?B?OGhHUElBY3J5Q2xEOUNGeW9MRTc3RXFzMUxhSEwxYittM2RycVg1ZW9pMCtC?=
 =?utf-8?B?bmRvTG1walBSeEI3c0Z1QjA2OG1OUFNpWHpEWWNtN3FQSzh2WEJGNStiRTBU?=
 =?utf-8?B?bDVLWE9ZMjRyRzlCY1h1MWJmSzJ4MGI1QVkvYVdzc041MWZKdXFaZWh4WHVK?=
 =?utf-8?B?RnpVYnhCN0krVzlFQTNaRkpITFlKbEU5bVBpWG9zNWtQeWJJcER6bXlMRDNi?=
 =?utf-8?B?UHZJV1BkWmRjKzEyVlFkZE9LSjN6YnFmeHNuZ3RHWGEvOUpsNW9wM2x4aVE4?=
 =?utf-8?B?eTg0TlFkUkFZVDZjMTBVVzRBMVpFVjNpa2FjR0svVTZ3NWN3VkJ1bmpxUUY2?=
 =?utf-8?B?YjZyaXpXRkM2b3VMVkx6MHZmalN4aSs0cXhUbS9BRWFXRmZ3V2hzMnYrS0RT?=
 =?utf-8?B?dXRhRm5XNEo0VG9GM1dwUTFSclpiNU51SDJZbW9BREZNRGtMaUVoem1hdVF1?=
 =?utf-8?B?MTNpSklOQkJCZkdlc1EzalhoOEFGWU51cEhvaUw5d1lDRFhPY2kvaHI4aCtn?=
 =?utf-8?B?cVp0d0JpRHVBbEVySW9JQklzV0JUbWRQam1EWk5neHk0UUZhaVp1ckxodk42?=
 =?utf-8?B?SzM0TUp3S3g5WjBQRVl3dTBrQWNNL1BUczRldXN5eWZXUjhZblIwb1pEbUxB?=
 =?utf-8?B?K1FMaEZjZE9IUHFZWGZCTGJEREhSWE9STGpaeENQcEtmeE1Db0VnTm1zakto?=
 =?utf-8?B?bk5haVVzaUJ1SXVjczlmWkoxaTFQbWFmcHJIdDgwWXR4aWYxUjN0ZTB6TW5t?=
 =?utf-8?B?L0dWdG1Xa2p6NndkL012OXg5bU5HRWgzVnU3YUs5K1p3UWF3bDZadU5aeUtB?=
 =?utf-8?B?elZiL1ZXaSsyN0JsYWhncTZYdHU0NXBCMU5sQ014RThBWDlMRzI5bTQzOEJk?=
 =?utf-8?B?b1IzaWpkY1pBVVkwOGFtYlhsSmRWWGNTd2wvNko3WTdGSDdLbmd5WEdYaGRC?=
 =?utf-8?B?WkYraWJQZkROdHp6RzM5c3BMRFk2b0xkZTlDRUZnN2FUL3hzakRXR1RIbnVy?=
 =?utf-8?B?RjBkVUtPWVBaaGlncGozellHZWtXWUJEcTJiU2luam43VDlHQXBSK01PKyt1?=
 =?utf-8?B?ZXpvYWhBZmQ3R3JQUnVkZGp6VUl3Q0Noc2FGYitOUFFjUXpTVUFleU0zejJz?=
 =?utf-8?B?a2tQSTljSWhUK2lUNDlvc1NKak9iL0I2NmJaUkR0cmJoL0NQaWdpS0c4QnJ5?=
 =?utf-8?B?a29vRlhOaHFjSmJ6UStSQ2JoOUQyZW5XMkZEbDZhcjZWUXBXWG1hVG16aUFt?=
 =?utf-8?B?c2pKZ1AyNGFLNm52YUI4TUg5em1xUTRwTHNHRGRXOUx1MkJzRzhRZUlqeW9q?=
 =?utf-8?B?dG9FaEQ0L0NGMlBmcnRueHJoOGRmZlc5Y201UGZDN0Z6TEZPNVIxb29KRlR1?=
 =?utf-8?B?OWZvNzROUE8vYStpN0xWYjRoeFdyaExONHVBK1dqaFVpeWFCdlFPdUtDb3ZW?=
 =?utf-8?B?cWZqZ2VMNjJIMHV3SzIrczRKdlVubGRObmF5YkdnY2F1cGpScUhhMVIySlFt?=
 =?utf-8?B?UUJlVjVSVzlNLy9LcGUyQy95VTBaUTJ0bUZYSU5KUXA3QVV3aU8zQ094TU1h?=
 =?utf-8?B?MXV6VExpTWJqdXNaemVvK0I5V3krQWZ2ZkgvalcwcXFqZGgybStydjVtSFFR?=
 =?utf-8?Q?x74TIkEmeiU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bU91Y3JlY0Rmb3BqcldQVHVSckVTbEtjWVFoV0g5MlFLcU5zSmtNdDVsS2dx?=
 =?utf-8?B?ZkFmRysrd3ZFeGx6aXJ2VUE3aFV2bTVUL2RUYW1sTUU0b3RKMGNWLzNMMFE5?=
 =?utf-8?B?SHRibWMwN1J4a09qUCtPSHNtcCs1Y0QvbFhEWmpqMUp3dFJENGRQTk9Hb3Rz?=
 =?utf-8?B?RDZrdHA2djlLc1FSajBJcnZjYXdQNUpxVGJRVm9ZNS9wbHlDZE45TWVIZ1M3?=
 =?utf-8?B?UUQ1YzRsTHNWb1ZuNVVTYU9SYk1MOXVwL01kMTUwLzk5MVBEOXNLWFY4a0o3?=
 =?utf-8?B?OEpiTDRaUlh6N3JsMU5ZNnlaWFQ4Y0NwYUkxYkVEVjRMZGtFRVRvWlpRL0Jz?=
 =?utf-8?B?cTh5amI0VU9HQmtBQTd1b0NsMlA3bUtWMEJLcTdmMFhEN0YzK2hUUWhZV3Bz?=
 =?utf-8?B?eTJuRlJ3d3IrNTZpRHlXdWZIVEJzcHpTYzhMTWFDbVdKdGk4Qjc0MEhDK3VV?=
 =?utf-8?B?QU51TCtyak5aUXNjd3cxeDJsYm85K25kWjdsdWZhTlRmaVh4ZDdYaG5TVGpL?=
 =?utf-8?B?bVozWDFpUnZUdXRaV1FEVWZOK2Fqb0MzZUFGaXhhclU5NUtkcnY1K25aS3hF?=
 =?utf-8?B?M3l1UTBuVHpkVFJRNWJxdUpXNEJia21DWjh1NVdGMkhqeSsyTW5rK2dwZ1lE?=
 =?utf-8?B?aXhiNmZ2OGtrMFJLT3VSUUVTcUwwK2lZemlpWVFuVENnVDgzbE5ZcDlHVUZt?=
 =?utf-8?B?UExxOVFROHFzb2pZdVY3ZjZyWGw1c0g0ZUxCOXpWMXJFL3pVOVB6NzVwazFC?=
 =?utf-8?B?KzZVMGFkRjJGZk9Dd1RYcmwzcTNEK3dYdDdRcTI5YUtVc3BUOCszR0tGWXVM?=
 =?utf-8?B?ZlowNjU3UGZtdmphMWQzQk1LUnZURUx0Q01EVFc1akY5TFd6RTlPbC8wT3ht?=
 =?utf-8?B?QUxneG42bzRRUnA0RSsyMzVXRVlBSmMwRk9nemk3ZzBISzJRUlN5V1A1Wmk3?=
 =?utf-8?B?aVZvcXNkdXdOUlJrblk4YXo2ZmhWTFRYdCtVUldIL0wxU3hILzN2clN1eVh6?=
 =?utf-8?B?M3ZjeFlHUTJiZ3ZEN3grazZKellPY1NRVEFURk9EN0g3ek5uc1I3R1JIYUx3?=
 =?utf-8?B?MTdXNkYzUldHb0x0Zy9YazJTV0U1V0QxcHpNUUFnaENGaFV4c244QjVZOStp?=
 =?utf-8?B?ZXRxWUhSblRZdnY5K280RmM2U21GalN3QkJ1Rjg5RVAreC91aFIvcklaZUJV?=
 =?utf-8?B?azFDaUVLNVFudmVBdFdzS0dPMzFXak1RdjByVzd0NE1icVkwaEJvQmhPZ3BI?=
 =?utf-8?B?S2Y1cU0xeFBvVjF2V2pFSm9ldGMxc1Y2SHBoelhnNTBJb3k3QlgrK2dHSXpG?=
 =?utf-8?B?OWhCUzRNTHhoRFlORTZRQXZxbSs1MGhhR2lDN1ZzVmk2azJLWGxPeW5rcTRH?=
 =?utf-8?B?a3VjVFJiYmI3KzNBVEM0MzJTNEs1V1hkNWQ2b01jREZYbUxLc2kxdVdDTkJt?=
 =?utf-8?B?VC92YmpJWlA3czlsYW9nUU5BMVE2YlhJMkV2OURkeTZpb2xJYXhZRkZyWWlt?=
 =?utf-8?B?bFhPZGlQTEdRN3QwNmU4T2tsWW00ZlRSR0ZsakFkNGVEQng1SGV6V0JUWHlo?=
 =?utf-8?B?ZGkrRXU3bVl1OEN2N0tDb3lOUGc2bXlWVmhtOGtZSUl0cTd0cktjazdtaVFG?=
 =?utf-8?B?ZmZhbnZBV2g1OTE1dDAvQ0RDK21aTE42TGJxams3OTNUNjIvU2M0Tm5HNUhY?=
 =?utf-8?B?VXgzOWhjRENoNk9HTGlhNWZOa3VBa0hWVzZzUXorMnJjUTR0dXZ5cWJMZ0RU?=
 =?utf-8?B?U2U0TFZ6WjNJUUNxaXgxYmRlVExwQXM0a3Y0S25uK3M5ZGRpNUN3ZzB4OFZ4?=
 =?utf-8?B?ajFyMUExaWtHZ29HUzdCMnAyMHRVMUlOeDNFS005WjgxQ3lzUS85emVJT2xK?=
 =?utf-8?B?L0tmTjdyY0dMMEl5dnpzUis1WmJJUXJMZ2JkWS9hOHJoeVZLKy93ZU1paEJZ?=
 =?utf-8?B?ZlpMa25UcHBQSyt4MWFCRHJsa1dSbThOZVNkc0FHbEU2Mm1ONnVBR3pLbi8y?=
 =?utf-8?B?dmRaMURyRGR3T3c2Ly9rTHJSQXlNNkFYbkVFbk5KekJGS2cxUVFaUk5GLzlo?=
 =?utf-8?B?MlZVTG9PU1o4disrVUdsRUtUeTlsZFVkS2xmejFNeUkzZTkySnpvZGowZnB4?=
 =?utf-8?Q?5WoifvNdTz4fRfTmBjHRNgd5T?=
X-MS-Exchange-CrossTenant-Network-Message-Id: abfad349-659c-4cb9-f26e-08ddb4d34f13
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 17:03:01.8382 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v9ylIJICATZTHmI/XvKm2iIFJtGzO0tlIugooHL1UhHwqZipjCGhTsw8Jo2qhnFP0ToJqfkfXJVAcU8FasvxqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6355
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

Hi Soham

On 6/26/2025 6:48 PM, Soham Purkait wrote:
> Add G-State residency and pcie link state residency
> offset macros for G2, G6, G8, G10, ModS and L0, L1, L1.2
> respectively.
> 
> v1:
>   - Move offset macros to drm/xe/regs/xe_pmt. (Riana)
> v2:
>   - Add BMG prefix to PCIe Link state residency
>     offset macros names. (Anshman)
> v3:
>   - Fix typo in commit message. (Jonathan)
>   - Rephrase commit message. (Karthik)
> 
> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> ---
>   drivers/gpu/drm/xe/regs/xe_pmt.h | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_pmt.h b/drivers/gpu/drm/xe/regs/xe_pmt.h
> index b0efd9b48d1e..34f5bfdffe46 100644
> --- a/drivers/gpu/drm/xe/regs/xe_pmt.h
> +++ b/drivers/gpu/drm/xe/regs/xe_pmt.h
> @@ -21,4 +21,14 @@
>   #define SG_REMAP_INDEX1			XE_REG(SOC_BASE + 0x08)
>   #define   SG_REMAP_BITS			REG_GENMASK(31, 24)
>   
> +#define BMG_G2_RESIDENCY_OFFSET			(0x530)
> +#define BMG_G6_RESIDENCY_OFFSET			(0x538)
> +#define BMG_G8_RESIDENCY_OFFSET			(0x540)
> +#define BMG_G10_RESIDENCY_OFFSET		(0x548)
> +#define BMG_MODS_RESIDENCY_OFFSET		(0x4D0)

Maintain ascending order as the other files

Thanks
Riana > +
> +#define BMG_PCIE_LINK_L0_RESIDENCY_OFFSET	(0x570)
> +#define BMG_PCIE_LINK_L1_RESIDENCY_OFFSET	(0x578)
> +#define BMG_PCIE_LINK_L1_2_RESIDENCY_OFFSET	(0x580)
> +
>   #endif

