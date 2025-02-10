Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8A3CC02198
	for <intel-xe@archiver.kernel.org>; Mon, 10 Feb 2025 19:01:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E66810E3A9;
	Mon, 10 Feb 2025 19:01:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K95ItHqt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A68610E3A9
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Feb 2025 19:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739214067; x=1770750067;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RW1jAt+0Fgqrhyrf+kjmau/ch+ZVgZwGm5eU67w7Dm0=;
 b=K95ItHqtN72/l05DAqWUOawtJ/Zuk6N2u5G2/pnrt4ra0+H9T4wXPFVx
 dOdX1AAKlTsyDzjjaHE3IM8uoznk58evgf0gJ027RVtD5AepykAib9vzS
 NIa+VNw1Q2Ifq1+0oGHLsnvBS9qtUxrn+d9Ynas0b/lSG3JTuxvY4Hzt+
 yDdb7cHkKnj6LiDrVNl01bHf58NNWEmnLZ+ys4WxBJSEvdJBe9MDqlb05
 SmNy1CuooIELxUCUuHT+QSQAqg2BmaPgCV2iKdq1F1tOThAsQJMsz3uu6
 vzBB93dJzk9erhfMe2KiRpbgZeLh4M5qdvZqBWqXQiaPbhd8phxUTNx0V Q==;
X-CSE-ConnectionGUID: BssJMmXRQZODrwjEXV13SA==
X-CSE-MsgGUID: 9jaF7tDSQXOcbGUG92c8PA==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="39724738"
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; d="scan'208";a="39724738"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2025 11:01:07 -0800
X-CSE-ConnectionGUID: /55u6LFQQB+uKj80IbN6vg==
X-CSE-MsgGUID: 0Sf72Ft6QzGrvKuVU5dOEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; d="scan'208";a="117296303"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Feb 2025 11:01:07 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 10 Feb 2025 11:01:06 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 10 Feb 2025 11:01:06 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 10 Feb 2025 11:01:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jVTqzTyiezr8KW9Iho2JvI99WXCQBFhOppAwLyj2a9W5YFWDaY4bL6cVxJn1dgpcDURyE/9lR8IcuFR8o3ES0cwq2GZHgUwR1c/cAdOTjtZsZfPmxf0T0fCQko06drCAbabFpnJReowT5a+s2sPofOoriutW+4aQwv4ugxkYW784bC3qN6K9cAwN4uPipUFoywQtKh+d1ccw0Lp3TW+6vLkX6fL4AcuM8/fn2qhWmbXdxoN3h1gIQxzDkeA33SIIx/XWsLmNkm0tz5bVkSvSGHJfmAYcjgNoYJSYFcfoh4e3lOYb8q4Ip7I6iZvACR4ZLVBlObjFbfhRWu6wt/2wWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fXktdGVn+1OaltgCgXDWiRX5Z8k+mmZ//zit11iOp4Y=;
 b=QnRcVEV+iUVZ91CrXCY1EhPQJvmJupq3/ltBYihu5O1QoU9lOejnDu3IDgXE2Kx4fEHulJl+SUsz9ia3SDV/AWFLsCRXwu2LbJ8rQzaR7ypW4dxBtgxJPW0+Sxr7XdDz5Lv4IeSDnxCmb2e3PXRo2ExHYSteGJnFUY7TY8DNSHLzqihmU4kcrFESx3oD5DWcB07NNYB/fc5FpzeDiLdko+TgKcwqEjTpzuDVvsr/7Zt7p7/AIt6R0GNC1i0mbfLvhG5bKS448sJ+bhQkK1uDnYkMO0fnrsKuIJCAHhkDMjS/EDHjS1QSjj5RPTWRDKM7iSzM9dAyYsGbrQVmV2zQOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by SA0PR11MB4560.namprd11.prod.outlook.com (2603:10b6:806:93::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.19; Mon, 10 Feb
 2025 19:00:47 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%4]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 19:00:47 +0000
Message-ID: <bc4db40b-dfdd-49e2-868e-256a2de1aa90@intel.com>
Date: Tue, 11 Feb 2025 00:30:39 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/13] drm/xe/pmu: Fail probe if xe_pmu_register() fails
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Francois Dugast
 <francois.dugast@intel.com>, Matthew Auld <matthew.auld@intel.com>, "Daniele
 Ceraolo Spurio" <daniele.ceraolospurio@intel.com>, Riana Tauro
 <riana.tauro@intel.com>, Vinay Belgaumkar <vinay.belgaumkar@intel.com>
References: <20250207221945.2878241-1-lucas.demarchi@intel.com>
 <20250207221945.2878241-13-lucas.demarchi@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20250207221945.2878241-13-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0075.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::16) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|SA0PR11MB4560:EE_
X-MS-Office365-Filtering-Correlation-Id: 50119a28-1bcf-4c4e-402d-08dd4a053a12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RFp1T05UR2lVMjFBcGZsMW8rOXhiLzZYZ1hWUTVwUkRkMnliTmVsaEFYc24z?=
 =?utf-8?B?dXR3UXJVWXJ2cVlIeHE0NWVqZFIzZzJpWmh6Ylc0dUNWM2ZKNy9BVmdTYmxu?=
 =?utf-8?B?RytCWmg4Njg3dzJDNGFkTEZueEV3dE1wOUlycDdWOGFZelhTeDdvemZDQWE3?=
 =?utf-8?B?STNEODJ6ME8yREw2cXNycndJbmFJbGlPZ2RHVGQzY0JicVRwVXFTY2F1TlZt?=
 =?utf-8?B?Z2pkZGVpRTBlWXhCZkJ2RHlRSm1yczU2MXlGaE05RWo5cVNqZm9wWDRyMmZw?=
 =?utf-8?B?QkljWWlZQ0ZKVk9VZ29GQVY5OGcrNDVMSk1kSlJuU1FQallrWG00UGZCNlNq?=
 =?utf-8?B?Q2VzSWpaUkllVUUrQU1IK0FtMnFjR1VlQTJxWm55eFF1TVF5YmhNV1ZmK3JF?=
 =?utf-8?B?N1V6dTdPaDlhZy9TWXJXYm90WkpubVRXSytFVWozTFViNlNzaHM4WWNzdGxU?=
 =?utf-8?B?N2N2U1p1T3ZXdkpXTmpMYmo2cnc1Z1YxVWdoL0o5WFluUGNISjFybGk4TkF5?=
 =?utf-8?B?WnlMdFJYNVlDQTlrTVBaeUk0WDh5T0VMaXRHdHFVVm43NGt2OHBqaFBpZGJP?=
 =?utf-8?B?anRtaWNBN1d3Yk1zaDlYaHkwd0x4Rk1QZUwyamI5SHB6Y0ZkWThFVllmd2No?=
 =?utf-8?B?ekd4bWFBU1loSmorVkxlWS9Cd3M3aGxIRTNaRi9zUldoU2ZOVmpSRUl2anEz?=
 =?utf-8?B?OERvM1hRMWs5TXBkNHhSOEVNanpJbkVITnVFQmdSbXl6eEE5U2M4MjJmVVNl?=
 =?utf-8?B?V2tFM2h3SGdLVTlmQXlaY1RHekZpZm5tYmZDbm5GUFlFa0RqYWdHdXZjaVNL?=
 =?utf-8?B?ZmpzZmM0dmIwLzJjMytmMitPVzRzNnR4UTZEOWNDUU9HeFdpclBmYTdJMVZN?=
 =?utf-8?B?YmlYT0dVWUZ4YnpDbXBVR3YxcFgzdkdwVnpvNUphR1NBU0JFNExvRDErM05T?=
 =?utf-8?B?ZldOQ3ZiNkhTY3B5ZnowZWppT0NjU0ZoTy9tSGczL3k1NXRkb2xQaisrMUxI?=
 =?utf-8?B?bE5TK0pGWEFKdFBBeDF4eGZZRzMwZzQ4K2djSkxBVG95YWpRZ2pQcjRGMXhS?=
 =?utf-8?B?NXJQaE4wcWpDQXc0ZVZOa2ZubFBqdnR2TjhCQWxRcXNWOW1HS29vNWhRMFk3?=
 =?utf-8?B?RDZRZjRCL2diUTQ2MWYwUlRvR0YweG03SytkNjJKa3lxcnd2bzFsNjRFSE5k?=
 =?utf-8?B?ZEpQNTVJdy9KbjdFKzhKR0JleFh1SS9KRlJVR3NZNHRUa0hoZUhMUzcyNlMy?=
 =?utf-8?B?QUNNTDNzeEFTem9OTHZJMWpXR0JseDQvczVLekU5SzczTlc3bW4xWHdUSzJY?=
 =?utf-8?B?NWZYZmlUWlNQQmZKNnRRODlYaVdCaUh0TEtaRFluRmxrRVdFTVlEYlJ0K1F6?=
 =?utf-8?B?VCt2VlZ2ZEVRQmVoUXRzWjhGRHpLNXcxVnV1MGRpWDBqcmhwZ3Z3STlMVVNW?=
 =?utf-8?B?dDNNbzZrMlpsZmprbWh3L3N3UnJ6OGZ3Y09YZnhDM1YzZkFKNDgybVgvUWc3?=
 =?utf-8?B?bkxwUVE4bVFDbG4vZk9YdW5kNFQyQnFTOWIzYUo5UklPTVg4ZzAzdmFUMlNx?=
 =?utf-8?B?Umhnd045R20wKy9URFBSZGxKVEh1aHF0YzRFL094d1FDYjV6MDhka2FWaHJ1?=
 =?utf-8?B?MUtNdHAxWmFZYU1iWDZhWi9vMGwwblo1SzE1QkxIR1J6eTJJVWluTERocVJJ?=
 =?utf-8?B?NU5EcXNXSTFyNUpjV0h5M3prUWpZK0ZWaDZ4VW5TQ1hoRVgvdW80RjJwdXA4?=
 =?utf-8?B?Zk9XQldzTFJtdmFuVWdhT0J3c3dlcWJOWFNUMitBekhLV05Ha0RIY1NKMXp3?=
 =?utf-8?B?amNoQ1dQbVVMWnR0c2pZNjBhbFZmQXJNN0JzanlDeW9JNUx2bkNQVWFYc0ZU?=
 =?utf-8?Q?OPQxkO5uvEwGi?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NU03MlpKQjNvd08vVEpUaHBRb2NPOWZrb0VUZGF6ZW1xUTQzS2kxempaczFB?=
 =?utf-8?B?c1hBSGNzRU5xOG5sVkFPR3g2RWxFMk90eTF2UVE0VkwvbVFsZ2x1dmJPN3NO?=
 =?utf-8?B?eWRUdllaZWhDZ1V4NTdMaTF1SDlMQ1BTRHNpOHh3WmMzN2tVekR1cFJ1bnA2?=
 =?utf-8?B?aDUyN1VPSC9qSUdTU0luOU9xZXZyWUswRzRYcEdBeGtIN1UySHpEeHJzbjBB?=
 =?utf-8?B?dkViYmpRdExlS0lIUHYzQ1JMSGpzNjJiK0NLMlVEcFA1TWROYWgrUGI1Yk5P?=
 =?utf-8?B?MW9ES3dXTFNvRVhCa3BFUHU1czdYemlxc0lSVnYyUVo2UHBmT1ZlSUhPTC92?=
 =?utf-8?B?WXJvTldLN1RKa1hDWUY3NVg1REcrMDFvc3RkSmFOaVY1eW5wSkJ0bFVTMDVB?=
 =?utf-8?B?UVV2TXBnbVFTdVdSQ2RvVWZ3ZUhBMElpSE16SWFpOFk1Y1ZldUJTNDJxNnll?=
 =?utf-8?B?U3d3a2FVK0p2ZGlDb1FkaE5STVl0QndsL1Q1aHo4ZVF5eXhFT0RORDRHMVdD?=
 =?utf-8?B?eVBOaGRZWGF2SVRMclRJb09XRTdpVHdQQis1YTJxNHFOc29saG9wSGpQQUJ4?=
 =?utf-8?B?bjVLbm1GOFZCMDNmekRjMmgxNHhLUjhGMzRlTGt5STBsNnRtWFd1bWQ1RE9h?=
 =?utf-8?B?WlYxMGJwNkk5SzFIaktMMm05cnJqRUJqNFFGbkhoNDdKZG9xb2pwMkJPenBT?=
 =?utf-8?B?aFlRbzFSR2EzS3AwQ0hvRmRZVG81dEFudlcxaTVMak5qR1F6eUlBcEFqSGds?=
 =?utf-8?B?U01samUrZm14OEVVR0JGWFN4Z2lsU3dwWGNiMDV6Znd0SHlRS3NMblk3SStP?=
 =?utf-8?B?Q1dqZnlVTTlkaStuVnk3bWx1aUxVdzBjSUYwRVJWdEUwcGs0ZXgzWkhERzJK?=
 =?utf-8?B?RjJNcHRvdys1ejNOdGc3WmVZQXpKdmVGanY2R1N4b2IvVzI1ZG94RmY5SCtC?=
 =?utf-8?B?RTF6NXViQmtqZ01NY2xLU2RNK0xtQkNta0s5Z3pjdjR5RnM0MWVBWWlkbGtY?=
 =?utf-8?B?ZEdUeDhnWHd2Tnh1UUxabW1lZEJPRlhWUmlDQmVGSWY5SDJUSWwwVVBhUjAy?=
 =?utf-8?B?dDQwUlpGQUl0MXNkZnE0T0d4bU5hRHVQUHlMcndqbmtibkQzVUlKQVFWRGpP?=
 =?utf-8?B?blAzK3piSmlnaU84UUtEUll6eDFYUlUrVTRXZWxlQzFCVVZ6VktWdnZXZlBa?=
 =?utf-8?B?Wk5hV3A1Mldpbnp1QjY2MlQxZGZaM2dyZy9VclkvWUJlblEwSTZpb1RFZXky?=
 =?utf-8?B?b1dqclF3QVBFMTZTM094bVpVZVBIL21pWTJZUUJDZlZrWkdzL3I1QjZsVERz?=
 =?utf-8?B?OE9WblkxOUV4aDRIL25YMjJBUmV5bkQ4TXhDMzVQU1FoYktpN2V3QXd2TFVs?=
 =?utf-8?B?OFZ6ZURsK1VGUVVxbmRxVVpTMWFXQ0F2cnRiS254YnFsN29QeXNNaVZMUWY4?=
 =?utf-8?B?OGtjRDlXREo2YkFpcndqRUJWb0l4K0pXRGs1dEw2d3RKQkY2WGtFS2hxUUNQ?=
 =?utf-8?B?Ull6TWd1djc4OGtZV2tnYkpNY1BPeGtEWk1aRVNZT0RPdXZrekgzWERTZmpK?=
 =?utf-8?B?ZjZvcjVzVnJHVEorYW5lMjByU2NwSStBV25hUUpBNm5jYjZucDVqSlV6dHNu?=
 =?utf-8?B?TURMSlVaaWh3TFFKeExMdTAzM2E2bW5xakQvNmUzNFpTT0gvaWxCV3dONjA1?=
 =?utf-8?B?VlFQWGU4R2dpaVUreEtFdWZWRElVSTVwejNnNkxicU9JaTRKWHVSZTNqQ09p?=
 =?utf-8?B?aWVIMzN0d0tUZytvMEVnaDJlZERxL0lTQ1AvWFdBRXlPL2hJdjdTMUhWQy9n?=
 =?utf-8?B?SHNtOGg3UUdTMHJoS3d4dnR4TElHdmdIU2JmNFNMc0ZnS2g2SlhOVU1BL0l1?=
 =?utf-8?B?eFdrM3BjdjFRa0tuZFFxeVBwejd2NFVpSWYyMGNkcVJLUFpRajlDWkNTWkZs?=
 =?utf-8?B?VVhOcWZhOXlHZldKM1A0ejNJSVorOEs0S2d2Z2dOSjFHTGN2S0FiNGZPRlpq?=
 =?utf-8?B?ekFsRVJaTVBNa3hTWCt0NDhiaGYwRWZBVW9HTDkzUTFiS0I0VnBCQW9hYTM1?=
 =?utf-8?B?azQvNkI5MFRzTHBvZjBQZEQxY21oZkNTVkNqcm9UM0hCNXdxTFRHNkRIYnNX?=
 =?utf-8?B?Y1ZDR0p0aDBFVHN1c0hqTld4SmFHbnhWNFRwOVdBY0s5VUNGQmN6MzFCeGZB?=
 =?utf-8?Q?Ab/eaZ9P8EQOGS3Lj1jwlJc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 50119a28-1bcf-4c4e-402d-08dd4a053a12
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 19:00:46.9443 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OBDLqvl8OgrhS9Pb01WqgF1EsbIAKpeq1Gy0RcZq9HITrtYS6T9m3aRGCuRx+HGx/7tsoekkCGtjrVu5IUeuFepAeItkCZEuGQoREQQtLXA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4560
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



On 08-02-2025 03:49, Lucas De Marchi wrote:
> Now that previous callers in xe_device_probe() are handling the errors,
> that can be done for xe_pmu_register() as well.
> 
> Cc: Riana Tauro <riana.tauro@intel.com>
> Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_device.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 6f90d74330524..002e066f5f288 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -883,7 +883,9 @@ int xe_device_probe(struct xe_device *xe)
>   	if (err)
>   		goto err_unregister_display;
>   
> -	xe_pmu_register(&xe->pmu);
> +	err = xe_pmu_register(&xe->pmu);
> +	if (err)
> +		goto err_unregister_display;

LGTM
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

>   
>   	xe_debugfs_register(xe);
>   

