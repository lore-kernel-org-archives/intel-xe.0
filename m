Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40596606A31A
	for <intel-xe@archiver.kernel.org>; Mon, 23 Nov 2026 11:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TW7eF++a;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=lZ3lwNs+
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E82FC10E06B;
	Mon, 23 Nov 2026 11:39:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D0FB10E06B
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Nov 2026 11:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795433933; x=1826969933;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2DmmK0rmEW3i0hV1uUySH8PB8uPJYY/lE9MtDkbQncY=;
 b=TW7eF++aLvLrIddPcfiB8kpW7W2Co+FWybWSGc2yR4FwUwr/w1TscLHX
 V0wqbAgVIQrOpu38pr5MBXpcL0PegANemBoE1kPOJfr/x1GQFdui0xNAO
 lh2/5IvZfNOiVkoDPGQeb3VezlMk/vnlOotveipqFQBCYhtNjO1VjDI+i
 jgPYBrclFcc6+ifCe8lc//jxz4PxOKjFDBS7qGN9saAAb46LdNracui91
 9gPhXtu+DUhwU15ZamU+rxOeOOVLyf8WlMQKCzbp4ZQG+Cmo9xburfaTS
 zVF2Np8ub9nfHYF5rgxhkf90D8/DGhdTO0PTitBuZAQTGR5w+2cPAjFN8 g==;
X-CSE-ConnectionGUID: zNoMGq1rQIGMBUTXnJtc/g==
X-CSE-MsgGUID: vvMy/Q1uQCa13+Qt355ffA==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4263898"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4263898"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 03:38:52 -0800
X-CSE-ConnectionGUID: 4mOQs0uAS0GFypTfVBVQqw==
X-CSE-MsgGUID: iRq9IpxiQKikjehVUNMBbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; d="scan'208";a="13263147"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa013.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 03:38:52 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Mon, 23 Nov 2026 03:38:51 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Mon, 23 Nov 2026 03:38:51 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.28) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 23 Nov 2026 03:38:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xmZaA27AdBg2BvWz0OGknD1hXCizMXzZDwGu9V10EnBUF4nvJqJrHtVukYC5YCvWCjsnZZzpQSIji136w7mLzJGFzVVnrWlfmbmvrwGdrPanUuCFfZWXfxvTCxHb5M1Tqksz4005+qxvZpf95g8uTHWsunl4KiSoiGw+JbkPE7LSMLDOtvTOYFC/NFsDclhzeCj/vdcoMy5XmDkWbjhIl3q31n/BZp6+qp/SWshddqqcPhoT2JdZ3WmZG8EaKwEMBZeuHyHJkiRb9afaFjPKLSf4GgHj/arhKp9tFONUjaHiUEY8/PV2vRzRQ+jVSUlatYUx2ubPgXNVkTKO6vFQng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c2kpCau4ErerJS8xguYmLJMQO28/a6MJL920s9uoNoo=;
 b=Fh+cHL+0Ax2pftUJr6mxedNSqsqAoDLqtQqWo1FCZLN9MiKLBqQJKNFCeHeMPw2DvJr0vQa+l7+JVIsGFnw1RMM9mxU/tPg6hMk5vZINZTDAjKRT62fKJUcWeVCKkhyWu83DlD0VzbMENNU1K6eKed9eiUNP1OzkKwAuVCeli0hXljWWsa9etoMGVWA9oxic18fqzemRdvt75/M02Ty46A9IWLxV2btNUWwl9zmX3mkwzQO8WV/wFOheSsZerkn4Rd9L5umDT7yuHXGlNfQJbszEZPZMKmX6mzizO9mA2rRtMwxdUwDDyyBL+e1yIf8pv8VahSDJJw8WxKVRAeUavw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c2kpCau4ErerJS8xguYmLJMQO28/a6MJL920s9uoNoo=;
 b=lZ3lwNs+4gtc5r0nnnr28UEkadBnehfByopkDabmjU/HoKK8Zd2RkmW9zplkIlqCukgpWcyU4bxEmOHLmLXTCHChB+CgHWG5zyd9tN2j5vYzpKjQ8HCM06mMHATxcqilugFs34kDMkXMHHP/JUOB/51zXVPfKKT/V7XFFPjfQRI=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7862.namprd11.prod.outlook.com (2603:10b6:208:3dc::8)
 by CH3PR11MB7179.namprd11.prod.outlook.com (2603:10b6:610:142::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Mon, 23 Nov
 2026 11:38:49 +0000
Received: from IA0PR11MB7862.namprd11.prod.outlook.com
 ([fe80::3b4e:43a6:6e22:22f]) by IA0PR11MB7862.namprd11.prod.outlook.com
 ([fe80::3b4e:43a6:6e22:22f%5]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 11:38:49 +0000
Message-ID: <20527346-4745-47d6-a15c-82beb896f870@intel.com>
Date: Mon, 23 Nov 2026 17:08:40 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/hwmon: Expose powerX_cap_max
To: "Poosa, Karthik" <karthik.poosa@intel.com>
CC: <rodrigo.vivi@intel.com>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>, <riana.tauro@intel.com>,
 <sk.anirban@intel.com>, <soham.purkait@intel.com>,
 <ravi.kishore.koppuravuri@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
References: <20261119104029.3066660-1-karthik.poosa@intel.com>
 <0c4c526e-e181-4702-bf14-2794c191fa9d@intel.com>
 <36c174dc-7653-476f-8dab-e0e905b2d594@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <36c174dc-7653-476f-8dab-e0e905b2d594@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0021.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:177::13) To IA0PR11MB7862.namprd11.prod.outlook.com
 (2603:10b6:208:3dc::8)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7862:EE_|CH3PR11MB7179:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c55177e-9a72-4cf1-bd86-08df49565744
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|261102123227099003|261026140227099003|261026121527099003|261022105027099003|261028144727099003|261021123027099003|261021121427099003|11063799006|4143699003|56012099006|10067099003|261009223027099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: wL77qkkefSrnka4STjKhta/J3CImy0uWouqnmEkL7Kdn6Wk+T9Fmme8eCOwlPIDhCASpxoHnq7qctm2ZsdinntvdYQJKZ3RgxGQky8+cmd9yZpWPXe07ck9rsTO36KO7ietcBi4GefSuga4H63IQVrdRACdERrEix4vOcB4Bblpf7XvFtPOftsYGhphP+jNDSxRRka5wzkgQx38OuFOSThpJ48BfeEUjcqsV7LnmmSioalekLW5Jrg+CI8cah8I89l/MgGgCPgvJHyvCgGwat7G2j9VRRO+4DACbxR4+2g0Y26GyFuW1EPGuf+hKWblwaa+dyezIaOOfGeZENqybhmpCEa/a0DZhtICc4I/e7v7j9kogE1VQuZwfIFdZ9Z/s/1D6sLonLBYRqUfm7dOBPkC7gI41OKSjM9Y8EjejTr8ScnVPrY83AcxyYagp6IoBsRHFASFjUNihe8xR/OgG5GkLPMgvKtclA0VABBHB/FxbtTp6q0tQpkTWr8gqkuSVkR7pyNSd7fosPAB4Wx3EUyQ2DSZQwSoKI4DwPgSXQiF0s/OfyXbefbnAE50neGCXmF4Tm1/XoNOSCKX0jUbe05w+HpTnGlYkpSDmsSYx19zdAVszLm6wo09XcqlD4UUl
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7862.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(261102123227099003)(261026140227099003)(261026121527099003)(261022105027099003)(261028144727099003)(261021123027099003)(261021121427099003)(11063799006)(4143699003)(56012099006)(10067099003)(261009223027099003)(18002099003)(22082099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NWQ3a1BrSDd3cG52WVFtZlg1MDNvV0tQZ0RHcHVkbVZPNVZlQXFlOFZ3eE5y?=
 =?utf-8?B?RG9ieS9VekMzcDVYYzB3ZmtyNDhMenRIT0JxVlZpQlBCbk96cEJXbTVTcW5F?=
 =?utf-8?B?ZFJtY0ZheTF2TEd2RTY4Szd4cGM4dnEvNWR5VWxuZ3lrU0tXMUVHVjhvWnFQ?=
 =?utf-8?B?NUFaTWVpQXhTaVk0WDdQZ1RLODVKbU0yeUQvOUgwdHd5WFM4NDl0Q3g4Wnps?=
 =?utf-8?B?M1dUUUI3dE1ZU3o0T21jMkk2MWNzZ0dnYjlrQzJKYnZLSmpPSTRjZ3A5MnRT?=
 =?utf-8?B?dXo5ekR0Um0vVStIVVIxMGNWblNkczNwQXBNWWQvc1NxYzk2U2hFRm54WHdl?=
 =?utf-8?B?VTBoWG1xbHF1Y3hqbEIyWC9EOHpFeE1vYTVHNGk1TVdkTUtnUjhuS1JYb29V?=
 =?utf-8?B?QkRNaWc5VkNYZ1BXQUNHaXRNcVhpQVpscHpvTGw2M2EvUjNTcFlyTHFoNXE4?=
 =?utf-8?B?QTVhMFMybGh3Rm15SFVvdnFvQ3ZXRXYycXR4SkcwSkRlRnU1VHl2dkZDRDVw?=
 =?utf-8?B?MUI4cU1xK1JFYVdwVzR2RnN1djhHT1kzRVUrZDY0MGU0RTI5WXBvbDhQcVNn?=
 =?utf-8?B?ODc3RDJBM2JtMG56K0dnVEkzdUllQTU0ZmpEQnFxWnorcm8yMzBVRU9Md244?=
 =?utf-8?B?SjdnTEk1M296RFU2dnFKVnNpektWd2I0RlBwZjNpVFlEWEhHZkdGR3RhY0lX?=
 =?utf-8?B?cWMybFMvYmoxeGIwL1E4bE5nL1IxS1YzYjk4eENxSFZuTUlOcFAzVmRkT2dX?=
 =?utf-8?B?dHBPbkpDTkxlaUV1RUFpaWFQdjNwLzc3MjIvTWNGbmJDTGU3SDFyc2tzUDMz?=
 =?utf-8?B?MUxiZ29RZ2g5dXJQd3F3ZHc3d0haYk1pend5MGZ1cTJFVGNrYzliemlyVEEv?=
 =?utf-8?B?V1diZ2sya2Z1QndzdFQrbmpFbVFGTzJqNnNSaGhEUGVDVGxvRkhzdUlLa2Zv?=
 =?utf-8?B?S1VQOE8zdzNYaEkxbCsyYkdvZmliQll5NVJOVURldTZoa3llcnNMSDI5a05W?=
 =?utf-8?B?dGhEWThHL2FHVUxET3hKVjBjaVNqU1hBeUtneFM0ek5vUlFQNS9jVU9VTUFD?=
 =?utf-8?B?Y2o2a1JoTUVBU2c1Z1k3WStQd2t4QS81UkpENTB5MDlVS1pXbHlUcGVzekE5?=
 =?utf-8?B?N1JHamFlcWl6RS9EZHFEbFZsSFF5Mm9jai9xOXp3eTZJWmxjMkRObkVsTEdK?=
 =?utf-8?B?QXNKQVBYaGdmWC8vYzNlTXM4NTNOQUp4SXpUVlJjT0ozbFZ2emMyKzdHSDN4?=
 =?utf-8?B?RFV6bytMek5sRDJvMUFsT25NV3haU0JpMWpaRyt1S0VidFhhbHJ6M3d0UE9x?=
 =?utf-8?B?cDhFSHZOc0dLWmcxOWU1OEF4SDY3MEVqaCszWWp0c2JDUGtPaHJ1MWwwZFFK?=
 =?utf-8?B?ektVcy9lcnFLV1pqc0Y0ME5NaFppYjNpc3hZL29LUzFHbzZMYmJkUFJ2Vzl1?=
 =?utf-8?B?QU5rWklRa2NIR2cvZ3Jadm9rZHQzWHM1MjNHSDdDN0RuOWFrd3YvbnNiNENJ?=
 =?utf-8?B?TE45Y2ZVNENRKys2dGNZcmNnZC8wWWFicHZMUFR3cWlSNm45ZTFUdElVSDd6?=
 =?utf-8?B?cHBHK3RQWU5xYVluT1R3LzBsTnF2TlJOd2dpUVp5b0ZRWG15MEh5cWdGSzAr?=
 =?utf-8?B?ZCtBZDYvTURYQUFpdy8zcmMva0tOVjkvMzJZYmY2WTg4NERXUnVUa3h3KzZJ?=
 =?utf-8?B?dy9Sc2cxcXpRN0NDT1NseVdJeHJpZEVaaStQMWxwRXI2cWNKNkt5RUtjSHp0?=
 =?utf-8?B?VTlQY091WmcxWkJNeUwvRWo1b3hOcVZzS3Q0VUFPbEI3Z1Z4cXVabkdGLzVQ?=
 =?utf-8?B?UWJHbHE3RUhLVkNDVEI4RVhIU2RVMDl5cGg0bUFVM3RJcWNLbmRLYnV4ZW9x?=
 =?utf-8?B?dGZxREMyQ3RZRjRMS0pnQXp5Ym1LeVdzaHdpZ2pPcEdoNVRaOEFza1UwUUJl?=
 =?utf-8?B?ZHFyNjhPazlzNzdDRHFuVHFZWlNuVkVOcGZ0TWxYMzBxKzE0VTJCTlk1TStl?=
 =?utf-8?B?OHlSV3AxdzJvQkF2ZXRFMlVDZXg5aUwzWlg2WUFlenRKWlpRbkFxZi93SzVh?=
 =?utf-8?B?aEtvMHlXdUxNcDFOZERKdXV0Mm5SUUU1dzN2TjgvdWhVRTlSVU1hL1JDQkkv?=
 =?utf-8?B?cmoxcFJFSUo5U3BSNml0ZDJqeWYvVUZsRlNmQm5veXVYTmQ4NG9IZ205WTNm?=
 =?utf-8?B?UzViMjVkTTF0NHp6WExqZjdLd2dlcXY0RWpYQWdYdGUxRFN5QUZ0NFQ0UFNj?=
 =?utf-8?B?VlFRdFJDTjdOV1RNc1lzWEtmdW9acUh0dW82N3FGRVZNajlOUXMvV2JlNnRz?=
 =?utf-8?B?anBXL1MveEVsWHVWT09CRTBEU3pxQnkvRzJHaW5QaGN4ZDVXWjIzVElmOEVw?=
 =?utf-8?Q?OWL4Lur2xFUEwTAk=3D?=
X-Exchange-RoutingPolicyChecked: TE8S5nXPtilCt2qU9D270ORjR08WsjexDRCTjWfuznryQ0i37kko8Q9cq1Jyvb80dOiBlnNsAFydAJhCH3OhRA+1CvCvBzeBoiXdeC7CZ33l6dQHw4jhwHByt01IL1TqEOH/1q8Dl98RZE0yyrilaJ4v0+JRwTcZEGAV1b5pDV+br7oLdIRdmEKu9HB4r9NeeCtnvx5yzfbJaClCCC3+03+mk+chptJ2wdSbCT09Uf0TUXqVPnof7RG3CBr3cWpzQNxaZHsYUuulYQVLXo6p1Bs53mBSNChYldM/2mM6rBt/vOs2oby8XgzLNvbGXQ4wBNtAXKN0sWvPOT5jAiL9Qg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c55177e-9a72-4cf1-bd86-08df49565744
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7862.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 11:38:49.4145 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OPapBxS3Eo3mbVl5EAoSEG+0owzAnTIExjLn1mdNgLAWU355oBeOk3Zkrck50NXJ5BLt6NePyP5g6sMijTm1/FjNo5IkdK+wp0/wQ06fwy4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7179
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 23-11-2026 03:19 pm, Poosa, Karthik wrote:
>
> On 21-11-2026 18:53, Mallesh, Koujalagi wrote:
>>
>> On 19-11-2026 04:10 pm, Karthik Poosa wrote:
>>> Add a read-only power<i>_cap_max attribute for the card and package
>>> channels. It reports the PL2 (burst) power limit that firmware sets at
>>> boot, which is the highest value userspace can write to power<i>_cap.
>>> The attribute is present only on platforms using mailbox power limits
>>> where PL2 is enabled at boot.
>>>
>>> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
>>> ---
>>>   .../ABI/testing/sysfs-driver-intel-xe-hwmon   | 24 
>>> +++++++++++++++++++
>>>   drivers/gpu/drm/xe/xe_hwmon.c                 | 11 +++++++--
>>>   2 files changed, 33 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon 
>>> b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>>> index 0da739d9a816..097902fd8346 100644
>>> --- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>>> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>>> @@ -296,6 +296,30 @@ Description:    RW. Package burst (PL2) power 
>>> limit in microwatts.
>>>             Only supported for particular Intel Xe graphics platforms.
>>>   +What: /sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/power1_cap_max
>>> +Date:        November 2026
>>> +KernelVersion:    7.4
>>> +Contact:    intel-xe@lists.freedesktop.org
>>> +Description:    RO. Card default burst (PL2) power limit in 
>>> microwatts.
>>> +
>>> +        This is the firmware-provided default limit and the maximum
>>> +        value accepted for power1_cap.
>>> +
>>> +        Only supported for particular Intel Xe graphics platforms 
>>> where
>>> +        PL2 is enabled.
>>> +
>>> +What: /sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/power2_cap_max
>>> +Date:        November 2026
>>> +KernelVersion:    7.4
>>> +Contact:    intel-xe@lists.freedesktop.org
>>> +Description:    RO. Package default burst (PL2) power limit in 
>>> microwatts.
>>> +
>>> +        This is the firmware-provided default limit and the maximum
>>> +        value accepted for power2_cap.
>>> +
>>> +        Only supported for particular Intel Xe graphics platforms 
>>> where
>>> +        PL2 is enabled.
>>> +
>>>   What: /sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/power1_cap_interval
>>>   Date:        May 2025
>>>   KernelVersion:    6.15
>>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c 
>>> b/drivers/gpu/drm/xe/xe_hwmon.c
>>> index 515b288f18e5..023a317a443e 100644
>>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>>> @@ -865,8 +865,9 @@ static const struct hwmon_channel_info 
>>> hwmon_temp_info = {
>>>   static const struct hwmon_channel_info * const hwmon_info[] = {
>>>       &hwmon_temp_info,
>>>       HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | 
>>> HWMON_P_LABEL | HWMON_P_CRIT |
>>> -               HWMON_P_CAP,
>>> -               HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_LABEL | 
>>> HWMON_P_CAP),
>>> +               HWMON_P_CAP | HWMON_P_CAP_MAX,
>>> +               HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_LABEL | 
>>> HWMON_P_CAP |
>>> +               HWMON_P_CAP_MAX),
>>>       HWMON_CHANNEL_INFO(curr, HWMON_C_LABEL, HWMON_C_CRIT | 
>>> HWMON_C_LABEL),
>>>       HWMON_CHANNEL_INFO(in, HWMON_I_INPUT | HWMON_I_LABEL, 
>>> HWMON_I_INPUT | HWMON_I_LABEL),
>>>       HWMON_CHANNEL_INFO(energy, HWMON_E_INPUT | HWMON_E_LABEL, 
>>> HWMON_E_INPUT | HWMON_E_LABEL),
>>> @@ -1423,6 +1424,8 @@ xe_hwmon_power_is_visible(struct xe_hwmon 
>>> *hwmon, u32 attr, int channel)
>>>       struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
>>>         switch (attr) {
>>> +    case hwmon_power_cap_max:
>>> +        return hwmon->pl2_on_boot[channel] ? 0444 : 0;
>>>       case hwmon_power_max:
>>>       case hwmon_power_cap:
>>>           if (hwmon->xe->info.has_mbx_power_limits) {
>>> @@ -1486,6 +1489,10 @@ static int
>>>   xe_hwmon_power_read(struct xe_hwmon *hwmon, u32 attr, int channel, 
>>> long *val)
>>>   {
>>>       switch (attr) {
>>> +    case hwmon_power_cap_max:
>>> +        *val = mul_u32_u32(REG_FIELD_GET(PWR_LIM_VAL, 
>>> hwmon->pl2_on_boot[channel]),
>>> +                   SF_POWER) >> hwmon->scl_shift_power;
>>
>> At line: 
>> https://elixir.bootlin.com/linux/v7.4-rc1/source/drivers/gpu/drm/xe/xe_hwmon.c#L1501
>> What happen when pl2 is nonzero and scl_shift_power is not 
>> initialized. it will show 8x high value. right?
>
> you are right, we can move the assignment of hwmon->scl_shift_power(), 
> before reading the power limits as below
>
> @@ -1824,6 +1824,11 @@ xe_hwmon_get_preregistration_info(struct 
> xe_hwmon *hwmon)
>         struct xe_reg pkg_power_sku_unit;
>
>         if (hwmon->xe->info.has_mbx_power_limits) {
> +               /* Mailbox units are fixed; set them even if the limit 
> reads below fail. */
> +               hwmon->scl_shift_power = PWR_UNIT;
> +               hwmon->scl_shift_energy = ENERGY_UNIT;
> +               hwmon->scl_shift_time = TIME_UNIT;
> +

Exactly, now we see proper value. :)

Thanks,

-/Mallesh

>         /* Check if GPU firmware support mailbox power limits 
> commands. */
>                 if (xe_hwmon_pcode_read_power_limit(hwmon, 
> PL1_HWMON_ATTR, CHANNEL_CARD,
> &hwmon->pl1_on_boot[CHANNEL_CARD]) |
>
>>
>>
>> Thanks,
>> -/Mallesh
>>
>>> +        return 0;
>>>       case hwmon_power_max:
>>>       case hwmon_power_cap:
>>>           return xe_hwmon_power_max_read(hwmon, attr, channel, val);
