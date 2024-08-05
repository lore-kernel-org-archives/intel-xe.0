Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA9D5C52D6F
	for <intel-xe@archiver.kernel.org>; Mon,  5 Aug 2024 06:39:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8913410E128;
	Mon,  5 Aug 2024 06:39:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XeNaoGMJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6924210E128
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Aug 2024 06:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722839976; x=1754375976;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=d4OR235D7/vUDhLCLQXpgJnpEjgdmmYs+2kHXoFlcfY=;
 b=XeNaoGMJXX5tkCHwpGEefRktKHI+2YqvLJGTxQQYJlKFT1ixVIEIqhWp
 ayg3eEsJseivl14IfPzxjwI/ozGSzRR4sjkxfEDAKgXZVvhYIFFUUj8eA
 IDw9gQhfQUYUfIkLACd0h72wRRtmd4hP4kw4wsvbytcbjckgynYtNODvu
 4Ob7WZt+qDdzVGuFsFPsj4LoPFqDQARa2+zTjYCxcLYvrnpXpL87APGfz
 VrWysB5ECQRFUBP9VH4hcygTdNWYM2ZAjq+qjCeQWaX67jLPGD1WGyEIR
 xoq0k0LwdvCh9FDdQggxbEPFdhVfJgx+bTA76mzEreV15uKFFdIjI4Jsb g==;
X-CSE-ConnectionGUID: JOlSsiwJQ5SVrL2Zjme1lg==
X-CSE-MsgGUID: Qv4C8nnYR4C3hxWM3kH5jA==
X-IronPort-AV: E=McAfee;i="6700,10204,11154"; a="20664225"
X-IronPort-AV: E=Sophos;i="6.09,263,1716274800"; d="scan'208,217";a="20664225"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2024 23:39:35 -0700
X-CSE-ConnectionGUID: QQL9gBkKQK2Uub0jyLgxbw==
X-CSE-MsgGUID: FRhHUuTHSHefIKq6R9iqHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,263,1716274800"; d="scan'208,217";a="56147037"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Aug 2024 23:39:35 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 4 Aug 2024 23:39:34 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 4 Aug 2024 23:39:34 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 4 Aug 2024 23:39:34 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.49) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 4 Aug 2024 23:39:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KmzsVJHg9T9JlOX7nNmSc2vI6r/K0atux741McCcajywn3sC/3b3upnlBUGoXkCKHuyiAoA83Ggy74RjJNynctHK8WmZxtzepU+Va5kkw8LBVW6mOZ3V7eeNV701xX1IeAOGGQvZLCQvs8fmbo6qy+RIJPUjuPtJYPIhff7y7Zz4XlUE5Awp5qEtkl0THQbEYxwL5QxBDjhQ2A7g+4aEviW5mqY70CQaSOVJ9ntcAtk12HvafOzG55vFTC1yFYpFnhK9H1ZL9Gt3zVSk2WlvN28hMe+W336RrqRTYBoSEl69p+QlGOsL0utTFYMgvBSRX7Xki/aAEK2pp3TRE11jxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M98sKDSVYKhPYiJhIBQHvvIy5J1uE3BG1rqvmQ/W91M=;
 b=auhf22X2jDECNQCNWvkn82xx5UIP7BIOgmJaI5qhN9ovckRxnklQtMfcyXhv7CeVOEx8l76xzxYaoYODuJUbIEpnYeWkcSVCxeGJHv9qM7KWilA6AILASr+xRe834Ns05lR3DoCTPewOA8xdDOaWfBecL0lGbraPu6Ys87PsHVQfL1aCAlQa+nqd3b3CPidDm4Mb4cUd8WouMXffWj+9VRZgl5yadj22Y/lrDEoWlgqUmhkNV6NxYLgCdOspyHv+cxX1744BbagchtZbO2RqkbjLOfcjS/mJvlWQLQ7SKGs4YbqeLU/RAYLLhI1JySiyxdA2Hmc9SCaXhoCyZSAlSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV8PR11MB8607.namprd11.prod.outlook.com (2603:10b6:408:1ec::18)
 by IA1PR11MB7853.namprd11.prod.outlook.com (2603:10b6:208:3f7::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Mon, 5 Aug
 2024 06:39:26 +0000
Received: from LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::55b1:592:df13:a9f3]) by LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::55b1:592:df13:a9f3%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 06:39:26 +0000
Content-Type: multipart/alternative;
 boundary="------------nCU9x092tNrjss1FbWUlj1XM"
Message-ID: <d86275db-f65f-4481-9f92-24c5b8c8cf1e@intel.com>
Date: Mon, 5 Aug 2024 12:09:19 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/observation: Drop empty sysctl table entry
To: Ashutosh Dixit <ashutosh.dixit@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Zbigniew Kempczynski <zbigniew.kempczynski@intel.com>, "Umesh Nerlige
 Ramappa" <umesh.nerlige.ramappa@intel.com>
References: <20240805062057.3547560-1-ashutosh.dixit@intel.com>
Content-Language: en-US
From: "Chauhan, Shekhar" <shekhar.chauhan@intel.com>
In-Reply-To: <20240805062057.3547560-1-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MA0PR01CA0123.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::6) To LV8PR11MB8607.namprd11.prod.outlook.com
 (2603:10b6:408:1ec::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR11MB8607:EE_|IA1PR11MB7853:EE_
X-MS-Office365-Filtering-Correlation-Id: 36eacdee-d7d6-4f68-845b-08dcb51959b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZUhKOUdLeUtVajZQWmJiTWFwUXMwV1ZZUDhMOE9NNVQ4dy82NDY4T0NwcXhC?=
 =?utf-8?B?NXpuWStGTUFBanc0Y3hBNVVDUk5yMGNZckFJdVhtWVcyZGdRam5DY0lLejdE?=
 =?utf-8?B?c1g0L0ZkYVE5ckFSbWJTUmR0dWYvVUl1L0N0L3lZQ1dzYUppdEMyMjJhbEVn?=
 =?utf-8?B?NUtYY2FERlFBRXBPOFlzSjFRbVROMlB0cHNLTHZ6SDkxbkovaTVPNWVtR1U2?=
 =?utf-8?B?VkE1SjZqYVBXbVBHazR0eHpteDBxc2xueTlJbjRaSEpYbkNWUU05c2JjYTlr?=
 =?utf-8?B?TFR5U3pDM0dBb0xKUWs1d1RsNXVnTzAxeUpTU29wbEgzUTgweFY1dnhYTjdo?=
 =?utf-8?B?dGFwOGhRaEhCN0lOWWdGcnFqeUpsREg1cUkvcFZ5Mk1NalhiSE5BNFBFYTNy?=
 =?utf-8?B?NUdRd0Z5SW1kOFRGQzJFTFBVOS9NdzJiQ0YwMW9jR1RtUkd5a0RHUTRnZ3dS?=
 =?utf-8?B?K1R5TGhKMTZpSW5LVW1EeS9zaHNJS2NuVFJpN2lyWVhQc3o0ZXZpVjN1NFI0?=
 =?utf-8?B?c1hEWGxiVEZoV0NvbC9KM3FtbCs0MVp5em5RTmtvajRsckk4V0tQZkMyeHAx?=
 =?utf-8?B?RWZxeExSTFhoWUVpYUQyVHZRbmVDcEpIbnEyMFAzREpxd2hYQ1BRby9QdXAy?=
 =?utf-8?B?OG1XMUdnVzVTT3pRbytGVmtDSGtjTDh1NHdoTHpESmFyZ3ZxMWFjSThUWnFy?=
 =?utf-8?B?TmFjRHROVE1FQ211SkhlQVdDSWlMcU1LQUtBdjlObkdkZkczeHhIWDhQcERV?=
 =?utf-8?B?MTZvN2ZLeEJabmU4a1RzckxvWVVQV3dDNlFXV0xvc1BDQlp1T3NLMUV3aDBa?=
 =?utf-8?B?TzZGcG1FK25OdlROZWYrNStVMldwU1BLRHd4MEo0ZWU0YXhFV0NXczIzVFBr?=
 =?utf-8?B?UnFSdlE3am9kc2laQ2N5QkIzSHE4ZmR5cnZ4b0FPWWgzSjBBQnAxaTdma1U3?=
 =?utf-8?B?NzFidjY2enp3QkRHRDJkU1ZLOEZjbkFWWTBmVStKMHkyQW16L0JkWC9SMWl1?=
 =?utf-8?B?MDJIKysrME52emN5SHJ1MndVaVFJVmtxLzdjbmFNUUQ2TnFJOEpWTmhmUlB2?=
 =?utf-8?B?NkhBZjFHM0ZWOFZ5KzIwUDZhbG8yZ0ZvdXphU1hkNEN2Rk5zQ29ncnJXTUE4?=
 =?utf-8?B?L0trblJHdmVYWFpheG5nM0Q2WkFXSWd6OENVS0ZZZW5zMWNSekl4UE40eHhS?=
 =?utf-8?B?OGVDQnYwRG1WQmIydElIL1JHbTFiQ0VOaFZQaEJ3TGpZTkFRaVFLbXk5WXV5?=
 =?utf-8?B?N3hRaEljWE5Dc3N1VnlnWngycVNMSnBMSE1BVjUwVG9jdG41MEtPNFlNd2Nj?=
 =?utf-8?B?cjVUNy9HKzRBVlpzc1VNcUxzWUhZeE1vYW10Y2tFdU5XRjJxNnVML1haTzZz?=
 =?utf-8?B?bmg2QjBMa1NaOUw5aEZVOWI5M3pxSU5EU3dnZnlOSWhZZmprRGZpTVhUdm54?=
 =?utf-8?B?MFVXK21ZNnVOa0FWazlHaHlZZHJBUTZWMmxJMEkvUFdRZ1pZR1FMRFlnN3Zp?=
 =?utf-8?B?M0JySmJUdmFCelA0b1gxK0NxWGlkQU92OWo3SGswa2tKZXdjcFZMTEhaZHNo?=
 =?utf-8?B?ZGZ2QVB6YUVMbjZrVzA5eHNrd2JJZ2RmazVySDYvZ1BQS09ibmdUaVN4Tzdv?=
 =?utf-8?B?K3RCaGVPV1J5T3dFang4RnNwSW5jYUl2Y1R1MWZPQXN5VEJMYXM3aUpKdm9y?=
 =?utf-8?B?K2h3WlRnU2o4aHVvc0J4czlyaUx1NDlrNFZLWERaaW1HSkJrRldQc2dBVHVH?=
 =?utf-8?Q?xQMO7638hjIoy8d7h8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR11MB8607.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VkVZVkJaeVpUR0ticnFwZTJ2WWU0WU1seHBueVlmc25IQjl2Um1UaWZTc0wx?=
 =?utf-8?B?WDJ5TXFiNVV6OW5XM0lwckwzL0xzbWRYTXZjVVhERXRGMjRQZUJadkxKRVBS?=
 =?utf-8?B?cGVhRTRCTTU3VFBtWlVTWnhCeVpyM2YrS08vT2JGQW40eDdaZ0lqbERrR1VF?=
 =?utf-8?B?eTlHZHVQQXFnOHBiTHpzY2hjUEYxanJlYnN3YnZRcnpTdUt0OHZZbjNhbUpR?=
 =?utf-8?B?VEJIak0yWjdwTWl2bXZFRjcwWDlvdDlWU2I0SUVldm0ydU9uZVh2alFmOTZE?=
 =?utf-8?B?MWsyYnh1S3lXekx2elk5WDd1c3dZSDNLWFV5cG1rU3ZZbUhWekZsbG1lRjFa?=
 =?utf-8?B?UWorUHZkTG9qMUgxSnFqSGV1VWZWR3NiakVUYkNYZFVGUVhVdTByY29iYjFu?=
 =?utf-8?B?d29nY040NUt1QzY4NFFGbVRnWWlYOGlEMVUrOFB5MWdrYmJ6cmducmkwMjRM?=
 =?utf-8?B?ZFJCVHBkSWdjNy9ZeG1KSXZ3MzBhK0tkS1hRVU1FWnNFQjl4Y3VnR2hBbHFh?=
 =?utf-8?B?bGJodnpFZEtBUUk5T1Q2ZnMrT1o0OXlSYW9aeHgzTFZDVVNZWDQza0YrR0ZI?=
 =?utf-8?B?bFoyWXlvNW5lVlJQME1QUmJhV2FQQk9DY2h2L055NHRocVU4N2F0bjNaalJT?=
 =?utf-8?B?YXZVNnhGRWo3Z0VJMXJPWE9CVHVtSVd0dnplNXBQQXE5ejRoYkcvZzRCem5D?=
 =?utf-8?B?eUtjRVVPTGQxQnRSaEJuWXBpYU5BdXpYSWdmeE9VMWZCbkplYVlLMTZsM0hM?=
 =?utf-8?B?cG10KzF0NVlaSmttQUZrTjdhK3NBc1crTTkyTlk1ZC9ScEpZb0ZBT2hvSzFl?=
 =?utf-8?B?OTh5dFdNR0hyaXFCM1dBdEgxYzhWUmlrZ0xUMFpMM0tIWWFiVzJ6cGhybE43?=
 =?utf-8?B?Y2ZKKzBUM2V6VzUzRXE5VlBHdXNlcDBOVXpFNlBZUjAvamFmeUxKdWZsWjFL?=
 =?utf-8?B?cm9zdHVrUjdvajU1WGhZQnY5M3RwRGRDT3ZlTGJEVHEwYVhWUFJ5REhHWFQy?=
 =?utf-8?B?c0gwRnFkNjd6Q3RNY3ZUOUl4cjlJc0YxUnc3M2FqMHBMZW5rcVFsYXQwYXBz?=
 =?utf-8?B?UzJUekFocEpUK3MxeVMzMm9pY0hwVU04dGFtQncxUzdkUG05VU4zM3VhM2Zq?=
 =?utf-8?B?U1RteVlMS0YxRXRoRzhCY1VkemZDTWVxRnRiTmZTQThKMGVRWjJqMkNhTnV3?=
 =?utf-8?B?Qy9JbmpBS1E2UE9ueHZUa09BM0R4RzF6Y3lZRGRZOVR4ZXhiUWNpMC80S2gw?=
 =?utf-8?B?Vkp1WGRTSDJOMlhiZmREblBIemY2OE5UeGFyTG5GWWJzWWtYWU5WUjZWQlU5?=
 =?utf-8?B?UWVxZnJxVnJpSVZOeWU1aFMza3FjNWg2ODk4RGkxbmlzR3BRMlN0S3FYOUJZ?=
 =?utf-8?B?TDJ0U2lxTlBNS3V5ZE01ZGhHYXJ6ZS9VOHk3RUxKWTEzVWJhUWpBWGJLMVFK?=
 =?utf-8?B?SnFzR1Mrb1FEN1FLeEZaVnZKdkJFYUx2TFVNVlFjY0RmaEpscXg0eFM5N2M2?=
 =?utf-8?B?YTFTYmUxZzBUOGh5Vk5hOFIvWkMyK1dDQXhxUU92REZwVWtna0NxdjJrTmFy?=
 =?utf-8?B?cGZnTVc5NzErNWd3NXFVZGtKWFQwTDBnQ1FScE1hK01YOWpUeUZxckk2ZENa?=
 =?utf-8?B?UlJLa2hIRVVkTDV6aWVSQmcyQkZlcTUycVFpbytFdDFKUkpvU2tZempiRldk?=
 =?utf-8?B?Tm9ERFRmdElBeEFPeUNVMjJya2prYU9ydklhUDd6bHo1VUpTeHN4WkxIUllS?=
 =?utf-8?B?WGpXODhLcnR0UVRua2VoYVQ4N1ZOMDYvK2wvSXBmVXlLbndhUE14U3R1eGVF?=
 =?utf-8?B?N09yV1dWYStSRHVaZjk4Ui9WaTltcU9aL3JVeWhPTEM2RFJkdSt6YklYUkNs?=
 =?utf-8?B?NWNPTENyc2V5OHJCQkVkT3JqRm9NZEVVZ0lCeCtlTHVsLytXa0VLN044algz?=
 =?utf-8?B?R29rL2hZMnhGUnlZUGlPQ1dHbDBZWnJWVjZTbUpuMDg3SHMrNzhpK2lvTVo3?=
 =?utf-8?B?ZjFOSW1IekpJS2Z0RmVlQThvVjg1RHNQS29sOGdxdmZMVjQxTUliOTZLMU1N?=
 =?utf-8?B?Um4xcm02ZXBqcHdyTUM1bmd6VmU4em5xSk8xcVQ5emdKSUNpU3RyZWF4dURw?=
 =?utf-8?B?RGtaR3R6UGNpVUNpSkgyZ3JFM2gvUzBKUzdTN0F5dERHbmMyanhqQ0dmTk1o?=
 =?utf-8?B?TkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 36eacdee-d7d6-4f68-845b-08dcb51959b8
X-MS-Exchange-CrossTenant-AuthSource: LV8PR11MB8607.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 06:39:26.6767 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0AYt/gAGtHIN2dAEeEjWY71H1tKWeuQWbh7CaVO2A4clPUabftL5gU/+EORwej4wvXYbQNSaqQQHCIOM2csSbOomccQQwcwoU9jT0I12y5g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7853
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

--------------nCU9x092tNrjss1FbWUlj1XM
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Drive-by comment:
I see a couple of articles, citing the removal of sysctl sentinels 
starting Linux 6.10. Is there any plan to remove this from everywhere 
else from the kernel?

On 8/5/2024 11:50, Ashutosh Dixit wrote:
> An empty sysctl table entry was inadvertently left behind for observation
> sysctl. The breaks on 6.11 with the following errors:
>
> [  219.654850] sysctl table check failed: dev/xe/(null) procname is null
> [  219.654862] sysctl table check failed: dev/xe/(null) No proc_handler
>
> Drop the empty entry.
>
> Fixes: 8169b2097d88 ("drm/xe/uapi: Rename xe perf layer as xe observation layer")
> Closes:https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2419
> Signed-off-by: Ashutosh Dixit<ashutosh.dixit@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_observation.c | 1 -
>   1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_observation.c b/drivers/gpu/drm/xe/xe_observation.c
> index fcb584b42a7d5..a78c92a44ec2d 100644
> --- a/drivers/gpu/drm/xe/xe_observation.c
> +++ b/drivers/gpu/drm/xe/xe_observation.c
> @@ -66,7 +66,6 @@ static struct ctl_table observation_ctl_table[] = {
>   	 .extra1 = SYSCTL_ZERO,
>   	 .extra2 = SYSCTL_ONE,
>   	 },
> -	{}
>   };
>   
>   /**

-- 
-shekhar

--------------nCU9x092tNrjss1FbWUlj1XM
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><font face="Courier New, Courier, monospace">Drive-by comment: <br>
        I see a couple of articles, citing the removal of sysctl
        sentinels starting Linux 6.10. Is there any plan to remove this
        from everywhere else from the kernel?</font><br>
    </p>
    <div class="moz-cite-prefix">On 8/5/2024 11:50, Ashutosh Dixit
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20240805062057.3547560-1-ashutosh.dixit@intel.com">
      <pre wrap="" class="moz-quote-pre">An empty sysctl table entry was inadvertently left behind for observation
sysctl. The breaks on 6.11 with the following errors:

[  219.654850] sysctl table check failed: dev/xe/(null) procname is null
[  219.654862] sysctl table check failed: dev/xe/(null) No proc_handler

Drop the empty entry.

Fixes: 8169b2097d88 (&quot;drm/xe/uapi: Rename xe perf layer as xe observation layer&quot;)
Closes: <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2419">https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2419</a>
Signed-off-by: Ashutosh Dixit <a class="moz-txt-link-rfc2396E" href="mailto:ashutosh.dixit@intel.com">&lt;ashutosh.dixit@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_observation.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_observation.c b/drivers/gpu/drm/xe/xe_observation.c
index fcb584b42a7d5..a78c92a44ec2d 100644
--- a/drivers/gpu/drm/xe/xe_observation.c
+++ b/drivers/gpu/drm/xe/xe_observation.c
@@ -66,7 +66,6 @@ static struct ctl_table observation_ctl_table[] = {
 	 .extra1 = SYSCTL_ZERO,
 	 .extra2 = SYSCTL_ONE,
 	 },
-	{}
 };
 
 /**
</pre>
    </blockquote>
    <pre class="moz-signature" cols="72">-- 
-shekhar</pre>
  </body>
</html>

--------------nCU9x092tNrjss1FbWUlj1XM--
