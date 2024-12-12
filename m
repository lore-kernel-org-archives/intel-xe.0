Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAB6CE7717F
	for <intel-xe@archiver.kernel.org>; Thu, 12 Dec 2024 21:04:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86F0010E03E;
	Thu, 12 Dec 2024 21:04:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hfAM71zn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A7E210E03E
 for <Intel-Xe@lists.freedesktop.org>; Thu, 12 Dec 2024 21:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734037484; x=1765573484;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4VG+2njWA+fRo2WI+BsZsYWnJjg8JKoCNnZJUYtpMVk=;
 b=hfAM71zn/HEDRkK6bIlLaCOpU9h4aA/lEElkczEBwUKz97nE53e/adNb
 vveA9Gw+7peWmmbr7Bl17tyhEZqrYEQbJEu2M0RwunqVc0uENSZxtHeGC
 Q02P3PlYhBElHBQ5qgnwcqRUxrtAYYZdBF75h2VnNQECv1bEXUILZ+QIp
 dzR/W9+Y0lCNrRauBPwxOscdfQKqKsVg3rpvwMz2r69P4YHi1TEXeWkYQ
 /opNlh/J50DXXvkTyB3z6d7J2BYL+G5LnGKZ/2XWne8wXjikRoJO2ZKB6
 mPIJYwF3a3AmHc+barJcZO1AXQuVpuk8BEsxj37tXEUgwkZDQ+Nkvl9au Q==;
X-CSE-ConnectionGUID: +MOIPGSsT72ld9zGZ0R4jw==
X-CSE-MsgGUID: NmxKJnxpSWeNWNliOiIQlg==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="45086244"
X-IronPort-AV: E=Sophos;i="6.12,229,1728975600"; d="scan'208";a="45086244"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 13:04:44 -0800
X-CSE-ConnectionGUID: O/FgeUnkTt6pj7vEC5ZMUQ==
X-CSE-MsgGUID: AxUlPWQeRbOx8unaTt5s7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="101306461"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Dec 2024 13:04:44 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 12 Dec 2024 13:04:43 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 12 Dec 2024 13:04:43 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 12 Dec 2024 13:04:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tblPevEchH+ynNb+bmxfWh8Z/cs+kttY5WWyLxJcxkNHYR0U+nNr4bkbAPk7z7EKRK8ZkVXV8QnJeZ4mRCyVuF+OAGM8APSZWsRGbieDR5FaX5JD9npmBy3d8i/f0bg8cZ6iF8f8jmRP40V9/4HSrtZc4rPiE6BGj5o85Q+nHLGBqyxiLWQODRDXNjpKg7vAcVlyrMRdS+8JQhSq4RJnUJaAoaC99FTwyvZIJzJoHNK9qYvHFvXEe7SKfJlGjmwNyT0eGSISFQN5smC1axNK1GBD7YfubLvdUt/csj9gA11ZNLFDqyh3m16QtidZR59shHVID1/uLQ+k+0g3ZtkO2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wpyngnEJfl6GKlLf8zecT9S/BSb8bNdxvjXqe29jGj0=;
 b=pmwKCkqOLnR7+CIzjuXGnbUb4APzlpSNWl4xvEZgokgcZqLuVebUQe042sqvKAICx7IEQpi7borEKTg5sjwMt1RAAWUfVbVI2FE/+Ocovrqws1zn0pWiP7KovdTotGllcI4nCuMYV3XH9VkGSVcerjKj+mCpx8O/XS1HJEBvfmuP+xUqXqs3LrCfvx0q3CZShi5uFgXzxiDw0bQ3EcysYxQNEyjE9Vxk/84RHF6WiIa1aQZe/PhkwPXvB8FbtSRSTkDu9OYHqeJGL1573Icm93nTQTBO7agILa74t+oe7XuYpEUbBTgBG8uAqB4BUodfGEfLW+mivZZhXb9Gt2t+9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by SA3PR11MB7553.namprd11.prod.outlook.com (2603:10b6:806:316::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.16; Thu, 12 Dec
 2024 21:04:27 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%4]) with mapi id 15.20.8251.008; Thu, 12 Dec 2024
 21:04:27 +0000
Message-ID: <db943f8a-0d92-49bc-827e-46284739e8be@intel.com>
Date: Thu, 12 Dec 2024 13:04:23 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 04/11] drm/xe/devcoredump: Add ASCII85 dump helper
 function
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: "Souza, Jose" <jose.souza@intel.com>, "Intel-Xe@Lists.FreeDesktop.Org"
 <Intel-Xe@lists.freedesktop.org>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "Filipchuk, Julia" <julia.filipchuk@intel.com>, Matthew Brost
 <matthew.brost@intel.com>
References: <20241003004611.2323493-1-John.C.Harrison@Intel.com>
 <20241003004611.2323493-5-John.C.Harrison@Intel.com>
 <ccc1066ab139e800cd8f67535c97aca486bf105d.camel@intel.com>
 <7qhmppwrqj5fsr3tkvufwua3iw7noadrefajrii66x7yydfeba@lqhgd7b5decp>
 <208f50d9-58e8-413e-915f-95ca077e0fa0@intel.com>
 <dahmzb4tveblm74nwhq5mabz672xivpfeuvkpzb6hnjfs4qrwt@rl6c56v6mfyy>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <dahmzb4tveblm74nwhq5mabz672xivpfeuvkpzb6hnjfs4qrwt@rl6c56v6mfyy>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0290.namprd04.prod.outlook.com
 (2603:10b6:303:89::25) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|SA3PR11MB7553:EE_
X-MS-Office365-Filtering-Correlation-Id: 574bdcd9-b175-4480-a7d3-08dd1af09033
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YnhlLzZJNEkrRVZZWFNKR2pBdlowS3o1SHBXV0dvR21GcEVXMTVVdmp2NjQz?=
 =?utf-8?B?TCtaR0g4VEF2dzBsYStVdXowK2pQMFdkQzZYMnZ4a3Z2UXVxUXRHSFoxZFVt?=
 =?utf-8?B?TjRsQVZnUUNkRGdUdGQrdXdPdVNsbnJKT29OZi9WKzQ5MVR2MWJFYnFDZVNr?=
 =?utf-8?B?RXpDdzlzRWY2MWhEOWJvSS9nVnBRZnA2cVZUeW1kWmhoeUJKbFk4WkVKRUFC?=
 =?utf-8?B?VzkwT3hvVnRCYWdUNWJxNVFsVkVrZDJsdHpEb1FRajVuYUV1NFptR1cvVUJW?=
 =?utf-8?B?SDF4cVlyc2ROQm41SVJwb0tYMkM5VVhCdGUrbFRMeXg1SURVcWYvK05acFFQ?=
 =?utf-8?B?WjlPYXMyU1N1K2xwbXNULzhENDFEcDBKTGdFY2xrYk05dGw5K2FYRFZ3bGhL?=
 =?utf-8?B?Q01vdlVZdFF1ZkFtdjNLSlRSQmN2bjdYZ2VYR1JBMDM0bXBmdWR4czZJalJQ?=
 =?utf-8?B?UFlCcUUvZldJTzQvcW1xY0wwbC9INW5wNmQ0QUd6YzB4bzIwVTVwaUhNRFJi?=
 =?utf-8?B?UUpoMU5hVW9jdHRuR0Q1bTJmZDZJMjBzVlRGaCs3VDgwVnc0WVNyb3dHT3ZN?=
 =?utf-8?B?Z2lMN0IwZTdybVhQcGVCbEVJSFRvV3lGQW13MWpjY2FSZlplMVlXbUkzeXc2?=
 =?utf-8?B?R2kwUXI4ZStndERGUlFMM25HTVBwMWovSFh1WklnRmtxL0xPdjdKTzBvQzlK?=
 =?utf-8?B?Ty8wQlk4a2t0VThQR3BhQWZkdmxibmxMQ01VWjJGS0RmbHF1Sk9aMkhMYjRO?=
 =?utf-8?B?aStTWTRxWHA1V01qd3h4QXpFT0VqZFJyL09RcEIzYzlWY3AwMnh5NXhHTzIy?=
 =?utf-8?B?b1kxUklPWmhFc0crVXFnR1ZGSDFmT0ZvOTd4dW8wV1VPTWY1ZnpocUtzWTMx?=
 =?utf-8?B?aDFydzRLMitpZlVvLzlWVFNkRVIyakVwajJGcFFEVGZvUFVveiszdENPeW5V?=
 =?utf-8?B?ZE9RU29oeUNKaVBEU1JaYlIyalQ4MU1TMzBibXhlQnZSRnNDSTE3akswVTNW?=
 =?utf-8?B?Y1J4b3hwL0JJbCtFdnN4ZzFaVlZaeEdSSGg0d0JFNFZmekZNYnlqNTVsWXVZ?=
 =?utf-8?B?b1pwVnZSNG4yQnFIRXdnb09oNklhcjZxSDNlNG53TkZNUTlDY2hXVEVKTlh3?=
 =?utf-8?B?c1NJNEd2Z1Bldm1Dd1kyaUN2N1M4VjFXTzBYN1NXRXF5RHFPaThkQU4xYjZ1?=
 =?utf-8?B?dVRmU2V4d3hwM2plM2MrSHlNNTRYWkQ4MFJSd0crRWhaeTlnOGluT0kwTDJ4?=
 =?utf-8?B?aHFLVjJ3MkZmOVFteHF3dmUwWmhUb1NRQVdQY0h2UEJjNzFSK05OQndJbUlR?=
 =?utf-8?B?RWg2ZnRrMHoxWnN6Tk5sNjFFNnYxWFBUS3JEbDB2amtuNU11WnNSQ3FFa0No?=
 =?utf-8?B?R0piMDBuUjQ5Y1RyY0Jwak9GS1dseStZL3drYzk2d1lublRsajc4U25Ba21I?=
 =?utf-8?B?MW10MnZNbnJCc3FNUXA5M0pnbEtKS0RuSXVSTHQzbTE3NEduaEkxZmdzcTJi?=
 =?utf-8?B?TlBCcWVrcEtDQ0c5MlVGTEV6NEJQSlptTXdUeXE5T3Ntd29tbFVuYThlaHVD?=
 =?utf-8?B?RWc2dFdRT2JqTG9ma2QxS3MvdU5qdzN6NVJRR3NhVVBLVkdFZG1XY3RwbVNG?=
 =?utf-8?B?aHJSSkwxT1R6R1JGUklSTWZZK0xNVU4vemNIaTR4WHRnS1EzNFFIMHZrV0NY?=
 =?utf-8?B?VmZrUFMrOEFyaXVnU0Q4cDZCd25oTmFaZlM0ZTI1ZEFERkVCOU80VC9vaGxD?=
 =?utf-8?B?Wkl1U3Azc2h6cEVETzdlOHJpcVpOUDJRWFUzTWZJSWVhZ1RDRkZBZVZYVzM0?=
 =?utf-8?Q?OlOEaDOwuROPewY3wPThS5zw3royZRHmPP3Fk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TUUxV1p4bmVZeWV3S1l1eWxwRi9VZ0Zra1JTSklUNzN1V2c2OTdPMjA1Yk1m?=
 =?utf-8?B?Sm5XSnhkTEg4YjAveExlcm9aYno1azBwbWFGSklhOWVKL2J1ZzJFSyszRk15?=
 =?utf-8?B?QXhiY2FpaVBTR2NLQ0Zhb2Y3MkZIUHV6OEM0UFpVRnUwbmlPU0pPdjJpcnd5?=
 =?utf-8?B?TDVYUFJRZDB4MVgydGt1bmllSG9PeTltKzYwRTMraE5pODhUWTRwVmdhMTBo?=
 =?utf-8?B?cjZzZXlTNmhWaGJQS0pXczBuZnVvb2EyNUYyVUlwY1RZdXN2N1JDMlg3aUdi?=
 =?utf-8?B?Q00zK2ZkdkxsdGxubnBiaTZCeklDVDFHWEFEWXg2UnBUQlovc0dNMk94THc3?=
 =?utf-8?B?QThwa2l4Mkg5SFdBRmNFYThBTk9kY05YdFFtQzFGMjN2ekhVcmxMMUxzQnd4?=
 =?utf-8?B?NWFpZkhaZGRzK2pUc1V4d2hNVjV2cUxLNGtWdFRYRnFNUnVwemZWNFBweEV4?=
 =?utf-8?B?NE40Q0xHZU5NREpNczlRaSsxNzFMTUwyMm9pOGRwcmpYNzN0R09EU3FQMGZ6?=
 =?utf-8?B?ZVkxMkpFUTQwQmRtUFVaSUxEa05vR3p0MTRXaHJOMGpOOUdiL29iTXdhYTUy?=
 =?utf-8?B?dWNJQlJtRGFrOU9QK25EQzhCZmR6eGVKK2RqWFlqQVdwVEVCdHA4V2JWb3J4?=
 =?utf-8?B?NEFLcDd2NWs1M24wWnhZUmhjRU55VkdLZ0tMZmpXR0kwUG5EQ0MyR3AvZHZU?=
 =?utf-8?B?cGxyREtZeWs0clMvS2ozUDhyYU92aFd1YzhJNE1qY1hMcWtITW1JaFppRnpO?=
 =?utf-8?B?alZTU25RWStJbFRNNk1BYS8vUlZqejVNaXo4YTdCTzJ2V1NaZ0VHS3pYY1pJ?=
 =?utf-8?B?VUxKdGdIN2NRS1ZHblVUUVZiNEUrdms4R0FxYU1VRmVxRWdBdzZwVGYyYUMx?=
 =?utf-8?B?Zm9wdWh0NjU4T252NXZXdm9vN0JkMHhkM1Zja3VhMk11anNJWi9xQmdkTjFT?=
 =?utf-8?B?eUNkNHBKUi9ReDUyTUFXT1ZXZitPdXlQWURxZlg3a3hwVXUyQ2lmWnVCaHlZ?=
 =?utf-8?B?ZmtBWkRySENpRzJIN3VjNERiNjR6N21ickZEUXR6THpvdUQ2L1Naa0ZRcm40?=
 =?utf-8?B?UHFsc095dkdLaUx6S2VoYzYxWWVPRWROUVFNWTVLLzJQME9ocUNpemtEVHRj?=
 =?utf-8?B?aEI1RXBzVVRVcndVTE90cEhEWC9YSWVkQVMxbzIxSStVQ1FhQXdQWW5WQUQz?=
 =?utf-8?B?aE1MVmkxTVFnWUNTK0lJQXRuYm93QWp4Z3MyMVF1RGl6bUJYS3p3dGFFUFZH?=
 =?utf-8?B?bzRSK0x0TFhGV04yTjdvcnZ4eEM5MWVKMUZLbkNYa1U0NDdKK3RtZnhYZWRP?=
 =?utf-8?B?VmlUdEVzeHVrT0F3TkdYeEg3TmNSeVhxQ0x2NGMyM2s4c3Y4WUlDOHBRYlZv?=
 =?utf-8?B?TFR6QmMzYWRkNG9wckVSYzBmZnVOa3hTRUZLOHdiN01QSGo3RXhBT0tkTjFp?=
 =?utf-8?B?cDh4bi9PZGE3V1BWV0tHYU5VRi9oQUxaZnBwNDFmTEN1OEQrSElaZ0J3OGV1?=
 =?utf-8?B?WmVIYkJqUlZQRDhEZ3JxU1Bnb2tmbkVNejNhMkgwN2p3MFU0aXRtMGJkUDVH?=
 =?utf-8?B?ZGtSYW1uUlhJVTg0MUIrVEovdnF5UlV6ZGdlYk5na0hkZmFOQk9GZ0lWVmdS?=
 =?utf-8?B?OHBmZzBsanMvbjdnYWJPOFBSTi9Vem13enJkVTRxYnNGMEczdXN1b3dFVHAv?=
 =?utf-8?B?aUpGalB3RnU1bktEcGZwWGlPeUtRME1IUHNqTXpOQzFsYXUzaEMrTjUzUDNP?=
 =?utf-8?B?endjOVlXdHFNYUl2YlV6Y2t2NEtHMU00N2xOVnAzYVZsazlockUwK2ROSThv?=
 =?utf-8?B?VUJqWGFiOHZwVkx5K1dKc3hOWVZWUUlSaHpKN1BZaXF6VDcvNWYyc2grb0Ja?=
 =?utf-8?B?aEFqVWRFK1R3UVZmVDdCZ01Jak5BMFUyaGkrN3JVUTVZejN3K1lUUmpNUU1x?=
 =?utf-8?B?ZTE2OGUzek9jVG5wZXc5WEw1c1pvWmRQVnBIUWhDRDYxZEI3cUUxV0VuZUFn?=
 =?utf-8?B?dUJhU2pqQVBBN0U5alE0N0UvOXVqOTVENVdESGZiUDR4dFJQaWFBWU1tcDZ2?=
 =?utf-8?B?UUdOQ2FpdnFiM2RsSU9rNHFUakZzbW5zUytqdTdlRFBrM0RwOE5MNUxXdERt?=
 =?utf-8?B?ZVkrNFBET0VzQng2QVhtZXJhSGZNazV0dlI2VC9qNDJmRmRHNi9GMmNtYWpr?=
 =?utf-8?B?YXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 574bdcd9-b175-4480-a7d3-08dd1af09033
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2024 21:04:27.2289 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AEamsZbLzrpI7+hxqIKNzaqgVx/QuhB4odwImArgtdSpOzWdBV4XJTgz8L9LhDKjnDV8ZxLmf+prO3JvwtJr894hHZv1HCZ/B8pvdK0Sijw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7553
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

On 12/12/2024 12:52, Lucas De Marchi wrote:
> On Thu, Dec 12, 2024 at 11:14:23AM -0800, John Harrison wrote:
>> On 12/12/2024 10:45, Lucas De Marchi wrote:
>>> On Thu, Dec 12, 2024 at 05:41:41PM +0000, Jose Souza wrote:
>>>> On Wed, 2024-10-02 at 17:46 -0700, John.C.Harrison@Intel.com wrote:
>>>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>>>
>>>>> There is a need to include the GuC log and other large binary objects
>>>>> in core dumps and via dmesg. So add a helper for dumping to a printer
>>>>> function via conversion to ASCII85 encoding.
>>>>>
>>>>> Another issue with dumping such a large buffer is that it can be 
>>>>> slow,
>>>>> especially if dumping to dmesg over a serial port. So add a yield to
>>>>> prevent the 'task has been stuck for 120s' kernel hang check feature
>>>>> from firing.
>>>>>
>>>>> v2: Add a prefix to the output string. Fix memory allocation bug.
>>>>> v3: Correct a string size calculation and clean up a define (review
>>>>> feedback from Julia F).
>>>>>
>>>>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>>>> Reviewed-by: Julia Filipchuk <julia.filipchuk@intel.com>
>>>>> ---
>>>>>  drivers/gpu/drm/xe/xe_devcoredump.c | 87 
>>>>> +++++++++++++++++++++++++++++
>>>>>  drivers/gpu/drm/xe/xe_devcoredump.h |  6 ++
>>>>>  2 files changed, 93 insertions(+)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c 
>>>>> b/drivers/gpu/drm/xe/xe_devcoredump.c
>>>>> index 2690f1d1cde4..0884c49942fe 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
>>>>> @@ -6,6 +6,7 @@
>>>>>  #include "xe_devcoredump.h"
>>>>>  #include "xe_devcoredump_types.h"
>>>>>
>>>>> +#include <linux/ascii85.h>
>>>>>  #include <linux/devcoredump.h>
>>>>>  #include <generated/utsrelease.h>
>>>>>
>>>>> @@ -315,3 +316,89 @@ int xe_devcoredump_init(struct xe_device *xe)
>>>>>  }
>>>>>
>>>>>  #endif
>>>>> +
>>>>> +/**
>>>>> + * xe_print_blob_ascii85 - print a BLOB to some useful location 
>>>>> in ASCII85
>>>>> + *
>>>>> + * The output is split to multiple lines because some print 
>>>>> targets, e.g. dmesg
>>>>> + * cannot handle arbitrarily long lines. Note also that printing 
>>>>> to dmesg in
>>>>> + * piece-meal fashion is not possible, each separate call to 
>>>>> drm_puts() has a
>>>>> + * line-feed automatically added! Therefore, the entire output 
>>>>> line must be
>>>>> + * constructed in a local buffer first, then printed in one 
>>>>> atomic output call.
>>>>> + *
>>>>> + * There is also a scheduler yield call to prevent the 'task has 
>>>>> been stuck for
>>>>> + * 120s' kernel hang check feature from firing when printing to a 
>>>>> slow target
>>>>> + * such as dmesg over a serial port.
>>>>> + *
>>>>> + * TODO: Add compression prior to the ASCII85 encoding to shrink 
>>>>> huge buffers down.
>>>>> + *
>>>>> + * @p: the printer object to output to
>>>>> + * @prefix: optional prefix to add to output string
>>>>> + * @blob: the Binary Large OBject to dump out
>>>>> + * @offset: offset in bytes to skip from the front of the BLOB, 
>>>>> must be a multiple of sizeof(u32)
>>>>> + * @size: the size in bytes of the BLOB, must be a multiple of 
>>>>> sizeof(u32)
>>>>> + */
>>>>> +void xe_print_blob_ascii85(struct drm_printer *p, const char 
>>>>> *prefix,
>>>>> +               const void *blob, size_t offset, size_t size)
>>>>> +{
>>>>> +    const u32 *blob32 = (const u32 *)blob;
>>>>> +    char buff[ASCII85_BUFSZ], *line_buff;
>>>>> +    size_t line_pos = 0;
>>>>> +
>>>>> +#define DMESG_MAX_LINE_LEN    800
>>>>> +#define MIN_SPACE        (ASCII85_BUFSZ + 2)        /* 85 + 
>>>>> "\n\0" */
>>>>> +
>>>>> +    if (size & 3)
>>>>> +        drm_printf(p, "Size not word aligned: %zu", size);
>>>>> +    if (offset & 3)
>>>>> +        drm_printf(p, "Offset not word aligned: %zu", size);
>>>>> +
>>>>> +    line_buff = kzalloc(DMESG_MAX_LINE_LEN, GFP_KERNEL);
>>>>> +    if (IS_ERR_OR_NULL(line_buff)) {
>>>>> +        drm_printf(p, "Failed to allocate line buffer: %pe", 
>>>>> line_buff);
>>>>> +        return;
>>>>> +    }
>>>>> +
>>>>> +    blob32 += offset / sizeof(*blob32);
>>>>> +    size /= sizeof(*blob32);
>>>>> +
>>>>> +    if (prefix) {
>>>>> +        strscpy(line_buff, prefix, DMESG_MAX_LINE_LEN - MIN_SPACE 
>>>>> - 2);
>>>>> +        line_pos = strlen(line_buff);
>>>>> +
>>>>> +        line_buff[line_pos++] = ':';
>>>>> +        line_buff[line_pos++] = ' ';
>>>>> +    }
>>>>> +
>>>>> +    while (size--) {
>>>>> +        u32 val = *(blob32++);
>>>>> +
>>>>> +        strscpy(line_buff + line_pos, ascii85_encode(val, buff),
>>>>> +            DMESG_MAX_LINE_LEN - line_pos);
>>>>> +        line_pos += strlen(line_buff + line_pos);
>>>>> +
>>>>> +        if ((line_pos + MIN_SPACE) >= DMESG_MAX_LINE_LEN) {
>>>>> +            line_buff[line_pos++] = '\n';
>>>>> +            line_buff[line_pos++] = 0;
>>>>
>>>> This breaks ascii85 parser that we had up to now.
>> It should not break the decoding of existing sections. This helper is 
>> only being used for the new GuC objects at present. As per the TODO, 
>> the intent is to use it for all blobs in the future. But that was 
>> deliberately left to a future update (which hasn't been posted yet) 
>> to avoid breaking the mesa tool.
>
> it broke nonetheless because then it fails to decode this line the way
> it was doing:  each line starts a new key.
It barfs on any line it doesn't understand? Seems like it could be made 
to be more robust in general.

>
>>
>>
>>>> And I think there is not safe way to parse it now, how would the 
>>>> parser know that the blob reach to end?
>> The GuC decoder tool simply ignores leading/trailing whitespace and 
>> keeps decoding until it finds a line with a new field - i.e. anything 
>> with a non-ASCII85 character such as ':' or '*'. It is totally 
>
> character set for ascii85 is [33, 117] and 122, which includes both ':'
> and '*'. Hopefully it's hard to hit a collision, but we shouldn't design
> it in a way that is possible.
Sorry, getting myself confused - it was a while ago when I was writing 
this. Yes, punctuation marks are part of the ASCII85 character set.

The GuC decoder looks for white space - a blank line or a line with a 
space in it. Any new field is guaranteed to be "name: data" so will have 
a space. And sections are delimited with blank lines, plus section 
headers are "**** name ****" so also guaranteed to have a space.

John.


>
>
>> reliable for me.
>>
>>>
>>> Just looked at this code to check if we also had a "Size" as I remember
>>> seeing it in previous related patches, but we don't. If
>>> we did then you could use that to calculate how much you still had to
>>> read, ignoring the \n. With the current scheme I think one
>>> way would be to continue the previous key when the line doesn't start
>>> with a new key. Awful, yes, and not future proof.
>> Any new field is guaranteed to have a colon in it and any new section 
>> header is guaranteed to have a star in it. Sounds pretty reliable to me.
>
> that's what I said by "continue the previous key when the line doesn't
> start with a new one".
>
>
>>
>> The other option would be to have an explicit prefix at the start of 
>> each continuation line. E.g. "A85:".
>
> let's not make it worse than it already is. And not future proof by
> given the encoding algorithm the meaning of "continuation line".
>
> Lucas De Marchi
>
>>
>> The problem with a size field is that ASCII85 encoding is data 
>> dependent - it has extremely basic run length encoding of strings of 
>> zeros. So you only know the size after the encoding is complete. 
>> Which means either the size field is in the dump after the encoded 
>> data (which is therefore useless) or you can't stream the encode and 
>> must encode to an in-memory buffer first, then print the size, then 
>> print your pre-encoded data.
>>
>>
>>>
>>> John, I explicitly said *we can't break the existent users*,
>>> pointed to the one in the mesa repo and confirmed with José it would be
>>> indeed a breakage. Please check again the past email thread at
>>> https://lore.kernel.org/all/3jexgpnh3br3gqi4ol4c3hx3tyhwevq5nqo5xssyie3xglqohz@e7mnj4dewupu/ 
>>>
>>>
>> That discussion was a question for Jose not a statement. As there was 
>> no response for several weeks, I assumed that it wasn't a problem 
>> after all.
>>
>>>
>>> Did you at least prepare the mesa parser for that additional \n?
>>>
>>> We shouldn't have merged the kernel patch as is with the excuse it 
>>> reads
>>> better in dmesg, when we also said we should not print that garbage to
>>> dmesg :(
>> Not following. Should not print what garbage in dmesg? As I keep 
>> saying, none of this goes to dmesg by default except in the case of 
>> catastrophic CT failure. And in that case, it is extremely useful and 
>> the only way to debug issues.
>>
>> John.
>>
>>>
>>> Lucas De Marchi
>>

