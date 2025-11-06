Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AD15CCFA05
	for <intel-xe@archiver.kernel.org>; Thu,  6 Nov 2025 16:09:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97E4710E11C;
	Thu,  6 Nov 2025 16:09:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QiKWzANf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1A9B10E11C
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Nov 2025 16:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762445378; x=1793981378;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=kVrgBtevZ9TmUb+X5CHYXehblOj5Z8NlffSK7Uca1iU=;
 b=QiKWzANfxHeiXMBTOgrYjnyCritebWAEDOx2vn1aVmzotl5QRC7QddG2
 zIo1/RWZDdxolFykUF0oonRWSWP+aJFMeNKWS0f2zddUYMUSpJSv5yi5Y
 Ei6SaBp6taY8W4jrG0xhwCbJ73Tvsy3sjRVz4vb4iROdu5DXmI3vwGvUv
 hJ9+zIUWZl0HKVK6HfYKqYdixkuFZF61vdiEAbq7kTpQSh43cueaskTxU
 oAxx2WjW4jb8ZvZxmH+f4+g69tm9TO+n9WwXHwN9Jp6b7jwl6mWXNxL8H
 VElbk2/W6XgorJDvczxZUJxnmiLYw1HrMFVw0Wv4aHWDuIuXCEwY3YuAW Q==;
X-CSE-ConnectionGUID: xPy0qNwSRHq/hhZMTMv9Mg==
X-CSE-MsgGUID: d8WQZfrDTaeVMMsm24o/9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="75274650"
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="75274650"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 08:09:38 -0800
X-CSE-ConnectionGUID: addcQ/k7RMSanecbJ6wWRg==
X-CSE-MsgGUID: u09hc10FRl2Maa7u6qmkiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="187636822"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 08:09:38 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 6 Nov 2025 08:09:37 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 6 Nov 2025 08:09:37 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.56) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 6 Nov 2025 08:09:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ibBQ8yAmOMOUISQzBwoc3biKHrp4joC3Oa+Vb6drWOzCVpHz6Eo5LRdoNx5aq8SM0oFhz0RwUTFcBdab5Lj0BG6WI9NJ46Lxd1V39yo0qgzAkIT/OF89TWuNMHe7hx6CFS6ST69O545OmXfUGmqkzunS27s6QGu9a7k8U09Xu9pJ/lnoaCZ0OP2O6escoHpU5neJ8MxBcN14MdnmUwB4V3wN4Z/T9HfyIOqM5N+qUG3EPDxBJ94dq8kZ6SEtBTYNcV/CleL1faHJ0IPLFbqS3mFnkgPD/0y8kXJqlyVEorcBrNuE1WcCmi06sNHJ96rZkpOMYaDFFyF4GtJrIOnDHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MXsbEG5W3c93O7ObVz4RukIVQ+3ZPamU2PJp0vzTb8g=;
 b=lRfLjR96z6P0FRf1g2rK4cIAJb2UHVGkioxHjRLadooVuancsWa0sRUYGGRCcRh4bWymqNbGORhhkwNiEyj6vcAU/GZq2OUcRjZUbAJi0bFpjgx6PT0eFE/8lXK+Zm6KVy9L4ZE/bMgnDYyTb7vYgN7Ek97DkxhouTLOQw9pAn5rDf71oa1VGC3V6CjUSwJ5YZRfEnMFPKuGjRMGY2r7deiaU1tOIy3ClMkZ82Xpq/w96yrtPmwQjbrZn/7eRx5+u4yDX2Nh+EKr91wWWpAREsjiEd5Av2cySbaEPt7EK5c5FfHt/Jz6m+cbqSXZ7pXd4KOoKeVqAUbHogVam60yvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by SA3PR11MB7612.namprd11.prod.outlook.com (2603:10b6:806:31b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Thu, 6 Nov
 2025 16:09:32 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.9298.007; Thu, 6 Nov 2025
 16:09:32 +0000
Date: Thu, 6 Nov 2025 17:09:29 +0100
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 3/3] drm/xe/tests: Add KUnit tests for PF fair provisioning
Message-ID: <20251106160929.pcflqlleh5otbr3t@intel.com>
References: <20251105183253.863-1-michal.wajdeczko@intel.com>
 <20251105183253.863-4-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251105183253.863-4-michal.wajdeczko@intel.com>
X-ClientProxiedBy: DB8PR06CA0062.eurprd06.prod.outlook.com
 (2603:10a6:10:120::36) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|SA3PR11MB7612:EE_
X-MS-Office365-Filtering-Correlation-Id: ee08cec6-d3a7-448f-1c1c-08de1d4edefe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MVh6ckdFSDRxZEw1MFIyS3Y2NitvdG5KbTFGNXozcU1MQWRLWXU5QzhKays3?=
 =?utf-8?B?TXdSYTd6eENJL2NDUis2aHRsVXNQdStTVzRya242a2lXQy9JV3J5QW12UlRB?=
 =?utf-8?B?ZzArZ2RDdmY3ejUvK29paWIyUkJhS3VPWWRPYkU4bWJFRmx3SjRXc0d1RXA5?=
 =?utf-8?B?L2gvQThnR1hoMU9xZVk4S25Sc1RDZTBjQndMd0VGTFliQ08yUXBCdlM4U045?=
 =?utf-8?B?cVA3ZWppbmNCK1hPSWp5T0xjaEkvR3ltS1h3WXRkSFVhQyt0M2NNR1A5S3pM?=
 =?utf-8?B?VzFML05zYWg2ZnhIWk14SUVmZ2E4K2M2NHFCTVVkQytvYzJuTTd5Qnp6OWRq?=
 =?utf-8?B?ZnBzS0QxQnNSeU5QcVBqMXB5RjhJeENPUm56WG1sM0NXakQvRVJJanJEVml1?=
 =?utf-8?B?MmNub21MallNVXVnaWZYaDFORnY5dXVHWDNXcmxGT2YrRDE3TzZzNC94QUhh?=
 =?utf-8?B?SUVkQXdHdVZXR3JzdjUrekV4S2R2U0crVW12VHpaaVpFcmt2aEluWFNoZEx3?=
 =?utf-8?B?bGp4SE9BUEQ4bWQ5Y3VhMzh6WVZkWVJLRks3SU16NTlheml5UDBhT1RGNU5E?=
 =?utf-8?B?RFFIVUVhcXAxVHRKN1dFYVNWWnFOZ2haYVRxV0VHSlQxSUI3L2ZLNlRLcWo4?=
 =?utf-8?B?TEVYY0N4cHliWXBvbENyNTlnKzFySFp2eU1YUnlhWmdvRFJwN0xNZEU5WFdC?=
 =?utf-8?B?Zm1Obm5ocmNoSURoclFFR3lRTGhmajErUjhodXNOZ0g2ZUVpOHowU0JvbWE0?=
 =?utf-8?B?Q0JDN21lVzl5NCt5TVQvci9xMXpBcTFiSjRWRDZTaGg5eXM3bE1jTVpIUzVR?=
 =?utf-8?B?NTBZRmxFWldmb2J2RDBqa1hsNyt0YUNIdnhtRXZGRlNiT29hOWZuNWFZaFVu?=
 =?utf-8?B?S1BUSGJsMFpuYUR1ZzE0aDl4a0JTT2dRUUJ6YnZlM0VFdzRDYUtWc0RNN2xO?=
 =?utf-8?B?aXJqWHEzdnFmNTU0TlowNXAwRXd4R3N5WmZ3SWF3NVZDUk1SdGNMWXhOMVJi?=
 =?utf-8?B?OU9LNHg2YU9LdG1SbGJpZFUyL1oxc2R4TjB5QzBoZWhVUVJnS1JROTN3Ti9j?=
 =?utf-8?B?Tm40M2RSSUlRRlQ4NWNNR0FxN1RHWUdKbXNhNURxeE1vaXpDNHR5RUh4ZlR1?=
 =?utf-8?B?dE1nYVBOOWRycE51UlFIVGIwc2s3Y0duQU5meUR4WERiUHZ4SWNNeVk0eFo4?=
 =?utf-8?B?a2p5Nm8xdjg2Wk1rMmFYVEV0aVh0VkFWR2FrQ0hDMmtOTXQrOFFKYXNqVG90?=
 =?utf-8?B?eTlBTGhCZnJqVUkxZkpnaWxPTEFtUjl4Mi80WmVIQ2FZbnJ5alAvcDQ3RkR6?=
 =?utf-8?B?TkNnK3lwQWhPTkdEcDRQb3A4c0NRQzBNQVNrWUlKVEZFRlF1WDE3Y2FaakdF?=
 =?utf-8?B?SkFSdU00TU03YWdIQ2dNWXZtVkZNUVhoRHFiNHJCNXJ1cEN1WmxHc1NiSysw?=
 =?utf-8?B?RmJsVDJPUUU4allKSUorU3l4b0dUdER3TkNFRjdGdWRVWEozUlVnSHMvaExu?=
 =?utf-8?B?R01nUjg1REJ4WEhMQnAwMXFieW1rbE5DNkpTUzMybnZUSDhZTGRIQjdFMkEz?=
 =?utf-8?B?b3pKKzduRjVkcmM3clRiMlFaZjNML3lmR3JXS3J2dHBySWZPaDFTNFpyeDVZ?=
 =?utf-8?B?bzlKUjY4NHErT1QzQXErcmNEc3l6RGhPRXY1WjZaZEJRVjh3ek94ZFFzMHYw?=
 =?utf-8?B?cU1NZmk3RjZSVXpvaHR4M3JYNzdzWGM1ZHNJUWxhTmNRQ1kxQkxvdWVyY1lk?=
 =?utf-8?B?NFBDcGtHaXVoQWJoUTBmV0VxYVVLWTJYQVhQcUZIRGZBN1pDdlMrRU1scStu?=
 =?utf-8?B?Kzl3TGxNRmRaNWJSUDE2d3AvQTRQK2JKNjl1M05tZk51WjZyT3NzcWIySFFN?=
 =?utf-8?B?M1U5aDZ6dEU2eUJCTFJtYXJzUzA5ZE02YkZsT2J1bWxrd2VmcVZmb1ZzTHZ1?=
 =?utf-8?Q?ebHT/VY4k7WuDBOkWyMUQBvvYFzStZrn?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z1M2UTlSY2VweVM5UTdvL1NOdmVvdXRaSXlPMDIwQVpHaXl2TEppdHpkeWlB?=
 =?utf-8?B?Qnh3dUNmcHdQZDNNcE5WUFFodkFTdzJvUlZiOCtXdDdmSFlZTjBRbXNOYVpG?=
 =?utf-8?B?Q3hNQndNT1NGNWs1RzJ0d2dZRU9YWkttMzJpMzFhNmFEcEtZT29XY0JGT2c5?=
 =?utf-8?B?SHUzVjU0dWh0NDdKRVlCWWtPZ0QvRzdHU3ZuMUxrajBDcksvK0NQMTRUc1ht?=
 =?utf-8?B?ZVRaOGJubVFPZmhvMTRQY3J1aU1pWTM1S1pyRGpVVkhVOUNyMWtyK0hLMXJa?=
 =?utf-8?B?Q05aQmltZEN3SHUzMEFQejdrQUh5QlY2WEhLbVZmRVV6cXRJLzNESVMxL2o0?=
 =?utf-8?B?blJteDdqWmVqZ1RnLzFxYkoyVkM4VnF1QjgzZjRTempsTUk2ZFVtTW9rZXdB?=
 =?utf-8?B?SnN2VFNiMFBPS0I1SFF4Uk9XdjR5ZU9HNjdrdHMraTlGeHhqMzhtWnJuSkxD?=
 =?utf-8?B?UHdEOWdFVnBRVnVDbUZ3Mm52MTFIbTdaMnRlblFxWDFwYmxuQjVUZktmM2t3?=
 =?utf-8?B?MzFycE5xbDlHbThFUWMvMGd4MVpCR1BXdy9TcEk5Rk1WMDBOZUVVNWdKa052?=
 =?utf-8?B?anVVMld6Q2pWTUJFVkFtemdnWmNhUWxxUHR2NW1kYXJRTmpZZkdicWRKVk5O?=
 =?utf-8?B?UmtLWjhYN0sxQzlUZmd1cHQxWnBlcGcvWXBSSElPS3RnMThHQ0ZNeXNza0l5?=
 =?utf-8?B?V1BkNHN6aXR1YjVhbnF6dllaek0xL2VuSmk2OHdnNzN0ZFZSeVY1cmpWUnYr?=
 =?utf-8?B?cU9VT253Vmt1VXJXbFJHVWJidVVIa0QvK0tHSERBVVN0aUc4d0Y3MnRjVGJy?=
 =?utf-8?B?VU5TV29rSyttck00S0l3UlM4Njd1ZldEL2xKWlgyNVlhMG9LSXZ4cGRTaVFo?=
 =?utf-8?B?aEx5bDNyejFXNEVoZThCdmR0QTRiYytpbzJjZGJvc3d4R3d6eWxyclpMb3FC?=
 =?utf-8?B?djdXMVlUSGl5ckFUUUMzRjdJM2pkd2V2c2RMaEk5RXJxdkV2MWtWaFh6Zng2?=
 =?utf-8?B?LzhlVWhtd3dhRDJKdVlFcFJIY04xeVJxZGR5YlpmYVVoYjIyT21oSUNMZkMw?=
 =?utf-8?B?UjRPTVQ0RUp1L1kwS2x0T2dEYW5PTW1wQ2tDdkR3UURCYVdsTUFHMkpXdEF2?=
 =?utf-8?B?OElLeEdtMTRzaXF2UzBEOEhuYngvZXJ2MVRMdXZyOGNxMnREclBoTDcvUzgr?=
 =?utf-8?B?Vzd6TFVRdHMrVUcxL01nUFFUMFFzVzJxc1c5V3o2aFZuTWVyaW1tU2pFVWpH?=
 =?utf-8?B?cmp6Ti9KNEhUaDErNE1Uck5Ba1FMVTkzNzdlaTRlOTRBT2RoUWVHWHFkcHFS?=
 =?utf-8?B?RXRjV3NzQ09jNFpuMDhuNkRDYUZ5UzdFbGhucHd0R2k2b08zbXgvTDg1ajJ2?=
 =?utf-8?B?ZmpDM0lnekhHZERiY3doUXV0ci9wV2crZWFZN3hJRWNneDdQSVBLcjB5anhT?=
 =?utf-8?B?OURiS1ZCT2dWaG15NTVRRjJqb09ZeHU2SEE1Q0lCV1dTL005NFc5Y0xUSkNh?=
 =?utf-8?B?dVo1NE1KalZFb2pXQ1VOZFl5dVVlTldmdVZ2WE5QdHpqZUJDR3JieGMvTVpP?=
 =?utf-8?B?bGU3RCtRVWorRzNrbDhrWlBTOGM3MW1SQVpTRk04bVVUYXhVQmx6NnZkT2cz?=
 =?utf-8?B?cHhzaTEwSmx3RkY5TnRSdEZQQTZSSWRaclQ0MnE2ZTFWSGNDSmFXcDdOTWJo?=
 =?utf-8?B?Q0hBeDkyV1NOODdxdDQybm9oeEZQckp4dmU0bE5UNEgyVjhVYzZMRy8wUXJD?=
 =?utf-8?B?clkzb1cwaE1oY3ZlcGs3ajA5UDZhSndYbmhxUTFiNHhuNElOSFFuSTIyNUYz?=
 =?utf-8?B?cFNSd1o2dTBIZ3p1a1M3TW9WQTlaVi8wdTdGdE9OcUl2N0pVT3JTekFqb2Y2?=
 =?utf-8?B?RFA4NS9TMzQydU91anBKQWtwcTBjU20wTVdaeTB0R2hpUVZENnVXcUU4VmVp?=
 =?utf-8?B?ei9Ra2VsWktEWGVFMGdFaGxTZTBFbndZeEVSVzhudnVhOVN5aXlZVG9OTHZi?=
 =?utf-8?B?SnVwOG56OFdKbXdSTmw4UDR3ZDJXY2RNQjNsUlU5NzFpZ1lwVCs4S1dSaXZk?=
 =?utf-8?B?eGVyaS95c2grVmhKUGR0YmFDS3ducE83d1Q2VjIzSWdjbHNHZHcvWEdSTkVK?=
 =?utf-8?B?NVQ5aEgxdDV1UDk0MTdJTDNYYjhtNjcxenNoNEVJYm5QWDFmdnFPaitnRGlp?=
 =?utf-8?B?alE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ee08cec6-d3a7-448f-1c1c-08de1d4edefe
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 16:09:32.1233 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2JA9PT6tpUI7NPgA02Q1umzvrI/JGpR9RNFE5H8O0NsYeUHkMi2U5SfBh+SjYUvJKo2KOYrisGVPx75ggauZeF2rbQ5ebhi5qt2fLtk5n3o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7612
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on śro [2025-lis-05 19:32:52 +0100]:
> Add test cases to check outcome of fair GuC context or doorbells
> IDs allocations for regular and admin-only PF mode.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  .../xe/tests/xe_gt_sriov_pf_config_kunit.c    | 162 ++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    |   4 +
>  2 files changed, 166 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c b/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
> new file mode 100644
> index 000000000000..162a8a1a1dc6
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
> @@ -0,0 +1,162 @@
> +// SPDX-License-Identifier: GPL-2.0 AND MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#include <kunit/static_stub.h>
> +#include <kunit/test.h>
> +#include <kunit/test-bug.h>
> +
> +#include "xe_kunit_helpers.h"
> +#include "xe_pci_test.h"
> +
> +#define TEST_MAX_VFS	63
> +
> +static void pf_set_admin_mode(struct xe_device *xe, bool enable)
> +{
> +	/* should match logic of xe_sriov_pf_admin_only() */
> +	xe->info.probe_display = !enable;
> +	KUNIT_EXPECT_EQ(kunit_get_current_test(), enable, xe_sriov_pf_admin_only(xe));
> +}
> +
> +static const void *num_vfs_gen_param(struct kunit *test, const void *prev, char *desc)
> +{
> +	unsigned long next = 1 + (unsigned long)prev;
> +
> +	if (next > TEST_MAX_VFS)
> +		return NULL;
> +	snprintf(desc, KUNIT_PARAM_DESC_SIZE, "%lu VF%s",
> +		 next, str_plural(next));
> +	return (void *)next;
> +}
> +
> +static int pf_gt_config_test_init(struct kunit *test)
> +{
> +	struct xe_pci_fake_data fake = {
> +		.sriov_mode = XE_SRIOV_MODE_PF,
> +		.platform = XE_TIGERLAKE, /* any random platform with SR-IOV */
> +		.subplatform = XE_SUBPLATFORM_NONE,
> +	};
> +	struct xe_device *xe;
> +	struct xe_gt *gt;
> +
> +	test->priv = &fake;
> +	xe_kunit_helper_xe_device_test_init(test);
> +
> +	xe = test->priv;
> +	KUNIT_ASSERT_TRUE(test, IS_SRIOV_PF(xe));
> +
> +	gt = xe_root_mmio_gt(xe);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, gt);
> +	test->priv = gt;
> +
> +	/* pretend it can support up to 63 VFs */
> +	xe->sriov.pf.device_total_vfs = TEST_MAX_VFS;
> +	xe->sriov.pf.driver_max_vfs = TEST_MAX_VFS;
> +	KUNIT_ASSERT_EQ(test, xe_sriov_pf_get_totalvfs(xe), 63);
> +
> +	pf_set_admin_mode(xe, false);
> +	KUNIT_ASSERT_EQ(test, xe_sriov_init(xe), 0);
> +
> +	/* more sanity checks */
> +	KUNIT_EXPECT_EQ(test, GUC_ID_MAX + 1, SZ_64K);
> +	KUNIT_EXPECT_EQ(test, GUC_NUM_DOORBELLS, SZ_256);
> +
> +	return 0;
> +}
> +
> +static void fair_contexts_1vf(struct kunit *test)
> +{
> +	struct xe_gt *gt = test->priv;
> +	struct xe_device *xe = gt_to_xe(gt);
> +
> +	pf_set_admin_mode(xe, false);
> +	KUNIT_ASSERT_FALSE(test, xe_sriov_pf_admin_only(xe));
> +	KUNIT_EXPECT_EQ(test, SZ_32K, pf_profile_fair_ctxs(gt, 1));
> +
> +	pf_set_admin_mode(xe, true);
> +	KUNIT_ASSERT_TRUE(test, xe_sriov_pf_admin_only(xe));
> +	KUNIT_EXPECT_EQ(test, SZ_64K - SZ_1K, pf_profile_fair_ctxs(gt, 1));
> +}
> +
> +static void fair_contexts(struct kunit *test)
> +{
> +	unsigned int num_vfs = (unsigned long)test->param_value;
> +	struct xe_gt *gt = test->priv;
> +	struct xe_device *xe = gt_to_xe(gt);
> +
> +	pf_set_admin_mode(xe, false);
> +	KUNIT_ASSERT_FALSE(test, xe_sriov_pf_admin_only(xe));
> +
> +	KUNIT_EXPECT_TRUE(test, is_power_of_2(pf_profile_fair_ctxs(gt, num_vfs)));
> +	KUNIT_EXPECT_GT(test, GUC_ID_MAX, num_vfs * pf_profile_fair_ctxs(gt, num_vfs));
> +
> +	if (num_vfs > 31)
> +		KUNIT_ASSERT_EQ(test, SZ_1K, pf_profile_fair_ctxs(gt, num_vfs));
> +	else if (num_vfs > 15)
> +		KUNIT_ASSERT_EQ(test, SZ_2K, pf_profile_fair_ctxs(gt, num_vfs));
> +	else if (num_vfs > 7)
> +		KUNIT_ASSERT_EQ(test, SZ_4K, pf_profile_fair_ctxs(gt, num_vfs));
> +	else if (num_vfs > 3)
> +		KUNIT_ASSERT_EQ(test, SZ_8K, pf_profile_fair_ctxs(gt, num_vfs));
> +	else if (num_vfs > 1)
> +		KUNIT_ASSERT_EQ(test, SZ_16K, pf_profile_fair_ctxs(gt, num_vfs));
> +	else
> +		KUNIT_ASSERT_EQ(test, SZ_32K, pf_profile_fair_ctxs(gt, num_vfs));
> +}
> +
> +static void fair_doorbells_1vf(struct kunit *test)
> +{
> +	struct xe_gt *gt = test->priv;
> +	struct xe_device *xe = gt_to_xe(gt);
> +
> +	pf_set_admin_mode(xe, false);
> +	KUNIT_ASSERT_FALSE(test, xe_sriov_pf_admin_only(xe));
> +	KUNIT_EXPECT_EQ(test, 128, pf_profile_fair_dbs(gt, 1));
> +
> +	pf_set_admin_mode(xe, true);
> +	KUNIT_ASSERT_TRUE(test, xe_sriov_pf_admin_only(xe));
> +	KUNIT_EXPECT_EQ(test, 240, pf_profile_fair_dbs(gt, 1));
> +}
> +
> +static void fair_doorbells(struct kunit *test)
> +{
> +	unsigned int num_vfs = (unsigned long)test->param_value;
> +	struct xe_gt *gt = test->priv;
> +	struct xe_device *xe = gt_to_xe(gt);
> +
> +	pf_set_admin_mode(xe, false);
> +	KUNIT_ASSERT_FALSE(test, xe_sriov_pf_admin_only(xe));
> +
> +	KUNIT_EXPECT_TRUE(test, is_power_of_2(pf_profile_fair_dbs(gt, num_vfs)));
> +	KUNIT_EXPECT_GE(test, GUC_NUM_DOORBELLS, (num_vfs + 1) * pf_profile_fair_dbs(gt, num_vfs));
> +
> +	if (num_vfs > 31)
> +		KUNIT_ASSERT_EQ(test, SZ_4, pf_profile_fair_dbs(gt, num_vfs));
> +	else if (num_vfs > 15)
> +		KUNIT_ASSERT_EQ(test, SZ_8, pf_profile_fair_dbs(gt, num_vfs));
> +	else if (num_vfs > 7)
> +		KUNIT_ASSERT_EQ(test, SZ_16, pf_profile_fair_dbs(gt, num_vfs));
> +	else if (num_vfs > 3)
> +		KUNIT_ASSERT_EQ(test, SZ_32, pf_profile_fair_dbs(gt, num_vfs));
> +	else if (num_vfs > 1)
> +		KUNIT_ASSERT_EQ(test, SZ_64, pf_profile_fair_dbs(gt, num_vfs));
> +	else
> +		KUNIT_ASSERT_EQ(test, SZ_128, pf_profile_fair_dbs(gt, num_vfs));
> +}
> +
> +static struct kunit_case pf_gt_confit_test_cases[] = {

typo

> +	KUNIT_CASE(fair_contexts_1vf),
> +	KUNIT_CASE(fair_doorbells_1vf),
> +	KUNIT_CASE_PARAM(fair_contexts, num_vfs_gen_param),
> +	KUNIT_CASE_PARAM(fair_doorbells, num_vfs_gen_param),
> +	{}
> +};
> +
> +static struct kunit_suite pf_gt_config_suite = {
> +	.name = "pf_gt_config",
> +	.test_cases = pf_gt_confit_test_cases,
> +	.init = pf_gt_config_test_init,
> +};
> +
> +kunit_test_suite(pf_gt_config_suite);
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> index 701889e5dded..80cc3f2cd047 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -2826,3 +2826,7 @@ int xe_gt_sriov_pf_config_print_available_ggtt(struct xe_gt *gt, struct drm_prin
>  
>  	return 0;
>  }
> +
> +#if IS_BUILTIN(CONFIG_DRM_XE_KUNIT_TEST)
> +#include "tests/xe_gt_sriov_pf_config_kunit.c"
> +#endif

one typo but the rest looks okay:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>


> -- 
> 2.47.1
> 

-- 
