Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C2D0F3C989
	for <intel-xe@archiver.kernel.org>; Tue, 24 Feb 2026 15:08:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D3EB10E5AF;
	Tue, 24 Feb 2026 15:08:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GJthMENR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69CE310E5AF
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Feb 2026 15:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771945710; x=1803481710;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kmzRGEJf8zjB1q3AkMPFYSptcwVF8aZCVca24m5AiLE=;
 b=GJthMENRz2sBMmGKR5otI/w2MxwndzBsitbxaSdT4JSpEx5dJjvYgxWg
 91S0svFvkqaxJuYx51EQWmIMjqysG4RT6oiN10C6ldaBtdUNoRQiMbla0
 SoieKeFY6M5tsv3ZCz71dQeL+7iWm1R5XlG5JObXlizwMIMZ6TcBQnddl
 2oItgKMP5RwBIk8RIT2BfiUY2OF3qf4Xhmqzfp2VJjXowW2Jd8ss5XZ6J
 1EkrWG1cwrabLQ4attuUgOKZhEyR1OqHbMeYpGMdLGoStBcRZmPvc3QT/
 YIagsTd+bzgCkBRq8JJZbNQ3ZavBCvEWV0zcCozm7bwxp7qfseF9VwouF A==;
X-CSE-ConnectionGUID: FoQ/PYbRRnmT5Io+Pmn/kA==
X-CSE-MsgGUID: yxtuCMqaR5an6SCYhGQIuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="84055654"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="84055654"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 07:08:29 -0800
X-CSE-ConnectionGUID: SE7psjDXQCS7WKpRIFGtVA==
X-CSE-MsgGUID: lSIIeoweR/Klkb/Niv28xQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="220523187"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 07:08:28 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 24 Feb 2026 07:08:26 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 24 Feb 2026 07:08:26 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.45) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 24 Feb 2026 07:07:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F+IQp94qZAwHBPv3Qmiu6hW6qPZbE2355+YBgB46r4x7jahbAD2mi0jtpyf+qsebd8yu5MvDbuLfWIhmMCC9n0OPAj929j+EiikWrV8Q6XYiX7j9DIjLHlf6eq6I2XHESHQDnR98CRLp2qwwEgz18bJtSGcoKdEjk0Jhi9sQVngwQTxs4u1yTj/hHNaCv8CEsAiexTKYy4/LrXC899xLN9yKWP4biXTUlg8YI741DqX78pHwPgLyEyCeezeSSlKXHNWqQdoSUWlfpq3cisxbInQi11T5v0Yon7DOr84iv+iv+EEnui6jg955S2fw6UQjKpDmzGsVAA3f6G355l0kBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yFrdrIp1kvbYZPtxktQh5kKDZarbmmPQz3uivdmm0x0=;
 b=xozZ9FypQKcXkOk70xDxn2xe+c6przt4E021PeJ8TXgzvoTvi7sSN9GDzF5/5ewNKJRA+LHTWY148E0YVFDQYGPTpRBYeI/o9NfA5VMwHnl0L3nnufwIZOZ4gVYECcVY+oszebZgiPDz+BUAKaBpNZAIw+H8pDgJh3ZkmHeqU/+h9mOa+IgYefyi/SWA+hi4EKF3ck5CeoV3ZF7hjtBR9+/52Fy5UJMZgcwVYYHlkLu+0SeudDAH13O72dq6kinbRLa7YNNkf8GGJJr7GUW7XovgtU0/+ytfF3p3tZ41dj2OG1sHhYzdQRqYazWQLct7HWu7PEd1x2S0zoaTKllveg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN0PR11MB5709.namprd11.prod.outlook.com (2603:10b6:408:148::6)
 by DS0PR11MB7358.namprd11.prod.outlook.com (2603:10b6:8:135::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 15:07:53 +0000
Received: from BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c]) by BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c%6]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 15:07:53 +0000
Message-ID: <5aaab739-2291-441e-937b-746495ce7d58@intel.com>
Date: Tue, 24 Feb 2026 20:37:44 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/9] drm/xe/madvise: Implement per-VMA purgeable state
 tracking
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <matthew.brost@intel.com>, <himal.prasad.ghimiray@intel.com>,
 <pallavi.mishra@intel.com>
References: <20260211152644.1661165-1-arvind.yadav@intel.com>
 <20260211152644.1661165-7-arvind.yadav@intel.com>
 <823a16af4733d5b82470b6ed6da203de09644caa.camel@linux.intel.com>
Content-Language: en-US
From: "Yadav, Arvind" <arvind.yadav@intel.com>
In-Reply-To: <823a16af4733d5b82470b6ed6da203de09644caa.camel@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0218.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b4::17) To BN0PR11MB5709.namprd11.prod.outlook.com
 (2603:10b6:408:148::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR11MB5709:EE_|DS0PR11MB7358:EE_
X-MS-Office365-Filtering-Correlation-Id: 144558fa-1156-44ce-d30e-08de73b67bd8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VEZzK0dkVWN0Qkc4L0JzUk9HTkJKa00wZ2RXellxb1RYMWp0Y1g4dXQ2cmNk?=
 =?utf-8?B?ZXFJKzNMQlNTcnp2SFowUmFtRzArZTFMM1J1RisyK0RjN0V4MWFTWGV4T3J0?=
 =?utf-8?B?ZEhKWFBtQ0hFSEsybHZJS3hTVVEwWDVxVE4wUDNKejRiZmJMTkh0SndXZXVK?=
 =?utf-8?B?VTVPb3JCR1d0dzZwU254TlloMWUvL2EwQUtaRzVaV1BUOTVuQ2Z6eVE5b1NJ?=
 =?utf-8?B?c2s5a2x3c0dDcFArNFVrTi9Qa1BJZG12OXl1d3RvVXNhRTRxRlVUT0JCVzZM?=
 =?utf-8?B?d1YwNUUxbDFmQ3ZMZ3NUWmRUYWhVYnlUWDdMS01yODQ4dmZEUWRrN2J5K01H?=
 =?utf-8?B?N0hwcDIvSXhqU1AzdVlna1VHQUV1bnl4NkcvT3RYcWRFWFZocS8ycFhyTVcw?=
 =?utf-8?B?VmxxaG54aXVXOXYrTkVmSG9EWEpHQ2JXNXFFQjFDWjRKL0NZVmhPQ0JrRHhB?=
 =?utf-8?B?SnZOdkhkSVlIUVZDTUdjaFpkcDF3Z3Nzdis4ZFF1M2VUVW9CK04rM0hTZXpD?=
 =?utf-8?B?N2x4bVdMOGVZaEZNUk8wblNIUmZyZEtPTmlrcVJoYS9MVXVFQ2oxUlhuT3FB?=
 =?utf-8?B?K3pKV2VjWmhPM3g2VDZlaEJxMDNwWkRCM3dpQUpmejJtSnA0YmFVSGdlRzhC?=
 =?utf-8?B?VWVJa09na1pDY2FlUkxyMjNjMWJleVFEeDBvTzhFQWQydm03dFZldGZZSjNO?=
 =?utf-8?B?Uk5Na0pFaGtoVEYxRjh3a2tFYk9IMjhCRkJqR1ozMDl6S1FFeDM2UVRTbGNm?=
 =?utf-8?B?MUFneURHR2ZlUW5vN2pyd29ZeEFYYjFFL3NrT21XOUNxVzZ1RmdQcG4rSFBw?=
 =?utf-8?B?SzFJL2JGeHhrNFpMd0FyTTU5YnJBMlpTbVRZMDZ4SGZkSEhON0hMQXlLQy9h?=
 =?utf-8?B?dnFETmxpUjRvY3NvTEdpM0pXa2RjQTRrekJ1RlJuMldJR0lNVXFhNkR4Sm5k?=
 =?utf-8?B?Skpadi9qZjB4c0xYcE1ZN05XV3ZBenFuYTVzOXh1dVc4Y09UTWlEZFFvOWtO?=
 =?utf-8?B?NXl0YTlMQTNYejhqWE9nQnBTVTVpc2ZnL09pU2RUNTQ1ejBneWZpSUhXT25X?=
 =?utf-8?B?NEdGQ2ZKeWhiUGxyM2JHdTRnUlZpZUZ5T2RCMll1NGxyWDZZN2U0WkxBTmgr?=
 =?utf-8?B?cjBQN3hiYU9BVE8yMkRhNStUNERua3dLNG0rN2htUnYwVUhmK3hOSzdaRzJh?=
 =?utf-8?B?ZGZFWEhBVWZNMmZWSHdUMytmai93bjNhZThMaXdqL0JvYlpwUERkZER1VlRz?=
 =?utf-8?B?WHgrNWpyTDJML1VWTFYwK2pqUURqRHBhTWZxQVk0ZGZvbkJWdHZVdUJNejZj?=
 =?utf-8?B?UHNJVUxFaDlGcnA3OUJmZUdCMmFGMEdETDlFUlY1VXVyektPKytVVVM0MWVF?=
 =?utf-8?B?cUUwdnJOQlFYVmh5UCttZ0lPdTBHRHVka2U5bnRiVkU0OTlVbzFlTHBVTmpn?=
 =?utf-8?B?R0hkbjlORjFzMzY0ZXY3UzB1OHhzZ0VlL0Vob1NROEhIa0Y3Q2NleHkzSXB3?=
 =?utf-8?B?RHphZmNVSTA2VTd0TVplUldKcnlPWlJtWW8zMGlJOWVkV1FBZWdnQVZ1Vzg5?=
 =?utf-8?B?eTc4UDI2WEM2TW81dm5hY3pMbGxQd2JjRHlBUElINk1GRnNMSnhmL0s3VUZk?=
 =?utf-8?B?T2kyd2Q0SGFGaGZJb2ZJeUNoOFNybWl2QXk2emJyMml5SVBsNG5SUFFkencz?=
 =?utf-8?B?aUFVSFZMcUlLUjRobnVtclJENEhxbFp3T2hpU2pPV0p6bVR5NEh5TFIvcW5h?=
 =?utf-8?B?Z1RKTFRyM1p4YUU3cnZONmtlUnFrb2JrOHJyTUpxMXliMmNGSmY3L0lDRStB?=
 =?utf-8?B?d3NZVndLTGV5dE5GeXlKaWwyQ21TVXd2dWdReTZTamkvK2NhNUFNK1plYlNY?=
 =?utf-8?B?YXRKV1BUV1pFd3BuNEtuQ1hQWlB0TDQ1dWVNOXNTMjl3ZTB5QUw4U2xXR203?=
 =?utf-8?B?YVR6V1I2U3hzZHZHVEJrTjNxbUlQb2tNVDBVUnhFS0ExN3ZGWkIxK2xMRUlZ?=
 =?utf-8?B?ZHJmSC9jY3hHOExkNldveXd0RHNHVWZ6Sk05UXhWZ3liTDZpWm5iTVMyNVdC?=
 =?utf-8?Q?OHndW0?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5709.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UHpqQjVJOGdvMnZXRVJ0TUhrWmdOaS9URUNDWnh5bFFmSGU2SGxUdE91WUc1?=
 =?utf-8?B?Tld1ZkpYVk5HMkRrMzY5UmpWSmhYc3FWYjN5UWRtZjJCY0oycEx4bU1rRUVo?=
 =?utf-8?B?cGx3WkUxblMycVhJVjNlaGN2V3R1aGkwK1dxcWYwWm5ENXRNZ2RlU2tHNTZq?=
 =?utf-8?B?WlJzdmNlZWM5cVY3c2lCdnRpSlFrUnVyUDBKcUlGdVVpeStBSEZVamo1SnVn?=
 =?utf-8?B?QjFaRldSdUE3QUJWWnB2MVdMZ1BMdEorbGxUWXVoQ3hBWHZqL1lMMm40Y1Zt?=
 =?utf-8?B?djJWRlJvM2oxWTdSRmhCTmNrWXdGdkZpTHlYRENzTFpKVGdKRGpieTBDTFFo?=
 =?utf-8?B?dnNmcWxaVjFDdzhtSmxjcWlLb3NqdUd4MkhMNG9CMjFFVTV5OGZvMXEzVlJU?=
 =?utf-8?B?T0RxZkt5UituYzdzaEprVlYwSnRNb0RvU3lMTkxZZHNqbytkazFpS2tBUHk5?=
 =?utf-8?B?eUFJQzZibFFkL2xqTFhOekU2SzRwT3lqai90amZqS1lob1doaGhpNjl3TG5w?=
 =?utf-8?B?Q1VkY05GUUt2Mk1WN01lbFdQWDd0VjdCbFFyK1hkejIyY1VnK2N0V0pPdzFt?=
 =?utf-8?B?bjRXb2FCSHNXVmxrdXAyeldCbFN3N0NUcVdVR2lkalhUT2JSSE1idjA4MWw4?=
 =?utf-8?B?dmF1UXQ4RGhJcWZUdnJpVXdIejhOWWNUejJYSm5sb2tzQnFUdWtqcjFibTgr?=
 =?utf-8?B?aTJweDhGNkV0a0dxd1lSUGQ2bTlPWEVoRm4rRXVydnVtOFVhRmhyV1Q2VDFm?=
 =?utf-8?B?ZlphU0g5QkExUlhEWm5mUURjZTJYNVAxUFNieDFQYk9BUU93ZGVTNDVsSTNo?=
 =?utf-8?B?SVFaUllxbXVtM1RZbmhZd2E2d0haVGJteUhCTWJGUWNmbmkwM1J3R296U1Fw?=
 =?utf-8?B?Y0hWdnJIaElQenlhRFU4ekVGUkszM2l6RWE0ZTFFdTlnamxuWkNYL3ZNL0JN?=
 =?utf-8?B?UEJTVS9xQzN6YW9STFBvU09zRXlDbXYxTnhySUE1MjdHUmx0L0dyZlhVdUtj?=
 =?utf-8?B?SnhBWVJUY3hEekhpdTBrK1UvRGNYcytBNWZDaUVYWlZsK1dqdFN6TTAwaC9k?=
 =?utf-8?B?cWNqaTUxUStEZDNtbG9rcnpFZ1U5OFZ6SEVrQzhGaHFKMDcxTTJLWlVlRng2?=
 =?utf-8?B?blo3Ym9CL3lER1h6Y3dWbml3czREY1MwTXZEckxnV2pLSzFMdWZXSVJGS3VR?=
 =?utf-8?B?QVE1UUxQbnU1TVgvNEhGVGIyQjM1MndJd3BoTG1sV0VZL1hFOVRnNzExb0lT?=
 =?utf-8?B?Mm9vRElBakJwZjBqbFZ4SUhUMzNkb1NFbFZvVXYyTEcxUExJT3hXWEE5Wk1C?=
 =?utf-8?B?djBjNmp1TWUrVUpjd1RFeHBDSk1TUnAyOVMrZGdaMXd0eHdiNEIyenpkQ3Vt?=
 =?utf-8?B?d2MzOVlDc1p1MFV4bmVIRlM3RkdvZ2pIaDFwUHVlQnFSN1RJWHBRYUF5UHRj?=
 =?utf-8?B?Qm55STA1YXlxNWpjSTdRQnZzOEF4cDRUVi8vcDRQTzBrWnhWc3hnVEhvQm9h?=
 =?utf-8?B?NVE1aW5zN0htWENRZkRKTnB1Wk81a2pSdXM5V2cydHhlYmt0TEdqU2piZUZL?=
 =?utf-8?B?TjR0eDdPSXE2eWwxQktpSmZOVnhsSUVsd2Z0UC96cFhtYzFKSUZQQnZEUmoz?=
 =?utf-8?B?Y1VXMzBOc2NHT3VmUVF4SXNSRFFyYmRCVkRxZDBBL3BBNWtmOFhKWXRYa3hT?=
 =?utf-8?B?b1d6WURhQU5PVTRnWXpqVjdCbDh0OWRnK1kvTkR4ZDN3Ym5jVjF2QVQvRURP?=
 =?utf-8?B?V3FPNCt5UHQwSXVob250ZDJsSGhpRkdlell1eVhRODltbHVWY1JhdDd1RGdL?=
 =?utf-8?B?VUxTMk9UY3pUMFNNVndXTitweGtOL0loNkY3NzNURnBjSENKT1prNEM2MkhU?=
 =?utf-8?B?THlhM3hxUy9obWxjcWR0eTQ3MHRZa0xVSDVBZ2VUNzFNa1luci9BMkdUY2Mr?=
 =?utf-8?B?UHp6ajhqRGhsL3pwNkxiczZvNlJlY1hVbGZRaTlnNUVZb1dLSTEwWE9OMTMy?=
 =?utf-8?B?WmdaV2x6R0dXaVlkVkcwc1pmZzU5OXlvbUZEVGNTWHpldVNmYjdTRWczZDRk?=
 =?utf-8?B?cUtDWVR6WW51WEhuVlAvR2VwK2Y3Q0IwL2VXNE12eEdLcFRycVUzZi8vR3NF?=
 =?utf-8?B?Vi9UOFl0VS91eXVpQjZsTDNablhHYzRobHFlaG5ZYmF6MDFaWUZ6czFzYjBq?=
 =?utf-8?B?Z1Y5SnFnOU1DQlpKRVBHUlFGVm5lbFBqVTB3eFJyaEpSRVdEK1Z0blZLd01G?=
 =?utf-8?B?UDVPTkFRM1Q3U2VxZkhOWUsxamdKRktuT0NaUEIwY0U5V3E0Q25vcXdsTkxU?=
 =?utf-8?B?QjdGQ3Y5b0xGVGhHYmZndlh5QkRIYThxTnYwN2MrT0hFMW02dXNaZz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 144558fa-1156-44ce-d30e-08de73b67bd8
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5709.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 15:07:53.6268 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1g86d7EaY43DgvwVH3+w1xPxjtPvvQPjOflqg9Y+obn8L+mMb6HGOAuqsIPyg62/oXTFzL3iMnTj+tIqZu9hwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7358
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


On 24-02-2026 18:18, Thomas Hellström wrote:
> On Wed, 2026-02-11 at 20:56 +0530, Arvind Yadav wrote:
>> Track purgeable state per-VMA instead of using a coarse shared
>> BO check. This prevents purging shared BOs until all VMAs across
>> all VMs are marked DONTNEED.
>>
>> Add xe_bo_all_vmas_dontneed() to check all VMAs before marking
>> a BO purgeable. Add xe_bo_recheck_purgeable_on_vma_unbind() to
>> handle state transitions when VMAs are destroyed - if all
>> remaining VMAs are DONTNEED the BO can become purgeable, or if
>> no VMAs remain it transitions to WILLNEED.
>>
>> The per-VMA purgeable_state field stores the madvise hint for
>> each mapping. Shared BOs can only be purged when all VMAs
>> unanimously indicate DONTNEED.
>>
>> One thing to note: when the last VMA goes away, we default back to
>> WILLNEED. DONTNEED is a per-mapping hint, and without any mappings
>> there is no remaining madvise state to justify purging. This prevents
>> BOs from becoming purgeable solely due to being temporarily unmapped.
>>
>> v3:
>>    - This addresses Thomas Hellström's feedback: "loop over all vmas
>>      attached to the bo and check that they all say WONTNEED. This
>> will
>>      also need a check at VMA unbinding"
>>
>> v4:
>>    - @madv_purgeable atomic_t → u32 change across all relevant
>>      patches (Matt)
>>
>> v5:
>>    - Call xe_bo_recheck_purgeable_on_vma_unbind() from
>> xe_vma_destroy()
>>      right after drm_gpuva_unlink() where we already hold the BO lock,
>>      drop the trylock-based late destroy path (Matt)
>>    - Move purgeable_state into xe_vma_mem_attr with the other madvise
>>      attributes (Matt)
>>    - Drop READ_ONCE since the BO lock already protects us (Matt)
>>    - Keep returning false when there are no VMAs - otherwise we'd mark
>>      BOs purgeable without any user hint (Matt)
>>    - Use xe_bo_set_purgeable_state() instead of direct
>> initialization(Matt)
>>    - use xe_assert instead of drm_war (Thomas)
> Typo.


Noted,

>
> There were also a couple of review issues in my reply here:
>
> https://patchwork.freedesktop.org/patch/699451/?series=156651&rev=5
>
> that were never addressed or at least commented upon.
>
> The comment there on retaining purgeable state after the last vma is
> unmapped could be discussed, though.
>
> Let's say we unmap a vma marking a bo purgeable. It then becomes either
> purged or non-purgeable.
>
> Then an app tries to access it either using a new vma or CPU map. Then
> it will typically succeed, or might occasionally fail if the bo
> happened to be purged in between.
>
> How do we handle new vma map requests and cpu-faults to a bo in
> purgeable state? Do we block those?


@Thomas,

The implementation already blocks new access to purged BOs:
  1. New VMA mappings (Patch 0005): vma_lock_and_validate() rejects MAP 
operations to purged BOs with -EINVAL via the check_purged flag.
  2. CPU faults (Patch 0004): Both xe_bo_cpu_prep() and 
xe_gem_mmap_offset() return errors (-EFAULT / VM_FAULT_SIGBUS) when 
accessing purged BOs.
  3 . "Once purged, always purged": Even when the last VMA is unmapped, 
xe_bo_recompute_purgeable_state() preserves the PURGED state - it never 
transitions back to WILLNEED or DONTNEED (see early return at the top of 
the function).

The only way forward for the application is to destroy the purged BO and 
create a new one.

Regarding the 'no VMAs → WILLNEED' logic: this only applies to 
non-purged BOs that happen to be temporarily unmapped. Purged BOs remain 
permanently invalid.

Thanks,
Arvind
>
> Thanks,
> Thomas
>
>
>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_svm.c        |  1 +
>>   drivers/gpu/drm/xe/xe_vm.c         |  9 ++-
>>   drivers/gpu/drm/xe/xe_vm_madvise.c | 98
>> ++++++++++++++++++++++++++++--
>>   drivers/gpu/drm/xe/xe_vm_madvise.h |  3 +
>>   drivers/gpu/drm/xe/xe_vm_types.h   | 11 ++++
>>   5 files changed, 116 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_svm.c
>> b/drivers/gpu/drm/xe/xe_svm.c
>> index cda3bf7e2418..329c77aa5c20 100644
>> --- a/drivers/gpu/drm/xe/xe_svm.c
>> +++ b/drivers/gpu/drm/xe/xe_svm.c
>> @@ -318,6 +318,7 @@ static void xe_vma_set_default_attributes(struct
>> xe_vma *vma)
>>   		.preferred_loc.migration_policy =
>> DRM_XE_MIGRATE_ALL_PAGES,
>>   		.pat_index = vma->attr.default_pat_index,
>>   		.atomic_access = DRM_XE_ATOMIC_UNDEFINED,
>> +		.purgeable_state = XE_MADV_PURGEABLE_WILLNEED,
>>   	};
>>   
>>   	xe_vma_mem_attr_copy(&vma->attr, &default_attr);
>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index 71cf3ce6c62b..e84b9e7cb5eb 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -39,6 +39,7 @@
>>   #include "xe_tile.h"
>>   #include "xe_tlb_inval.h"
>>   #include "xe_trace_bo.h"
>> +#include "xe_vm_madvise.h"
>>   #include "xe_wa.h"
>>   
>>   static struct drm_gem_object *xe_vm_obj(struct xe_vm *vm)
>> @@ -1085,6 +1086,7 @@ static struct xe_vma *xe_vma_create(struct
>> xe_vm *vm,
>>   static void xe_vma_destroy_late(struct xe_vma *vma)
>>   {
>>   	struct xe_vm *vm = xe_vma_vm(vma);
>> +	struct xe_bo *bo = xe_vma_bo(vma);
>>   
>>   	if (vma->ufence) {
>>   		xe_sync_ufence_put(vma->ufence);
>> @@ -1099,7 +1101,7 @@ static void xe_vma_destroy_late(struct xe_vma
>> *vma)
>>   	} else if (xe_vma_is_null(vma) ||
>> xe_vma_is_cpu_addr_mirror(vma)) {
>>   		xe_vm_put(vm);
>>   	} else {
>> -		xe_bo_put(xe_vma_bo(vma));
>> +		xe_bo_put(bo);
>>   	}
>>   
>>   	xe_vma_free(vma);
>> @@ -1125,6 +1127,7 @@ static void vma_destroy_cb(struct dma_fence
>> *fence,
>>   static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence
>> *fence)
>>   {
>>   	struct xe_vm *vm = xe_vma_vm(vma);
>> +	struct xe_bo *bo = xe_vma_bo(vma);
>>   
>>   	lockdep_assert_held_write(&vm->lock);
>>   	xe_assert(vm->xe, list_empty(&vma->combined_links.destroy));
>> @@ -1133,9 +1136,10 @@ static void xe_vma_destroy(struct xe_vma *vma,
>> struct dma_fence *fence)
>>   		xe_assert(vm->xe, vma->gpuva.flags &
>> XE_VMA_DESTROYED);
>>   		xe_userptr_destroy(to_userptr_vma(vma));
>>   	} else if (!xe_vma_is_null(vma) &&
>> !xe_vma_is_cpu_addr_mirror(vma)) {
>> -		xe_bo_assert_held(xe_vma_bo(vma));
>> +		xe_bo_assert_held(bo);
>>   
>>   		drm_gpuva_unlink(&vma->gpuva);
>> +		xe_bo_recompute_purgeable_state(bo);
>>   	}
>>   
>>   	xe_vm_assert_held(vm);
>> @@ -2681,6 +2685,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm
>> *vm, struct drm_gpuva_ops *ops,
>>   				.atomic_access =
>> DRM_XE_ATOMIC_UNDEFINED,
>>   				.default_pat_index = op-
>>> map.pat_index,
>>   				.pat_index = op->map.pat_index,
>> +				.purgeable_state =
>> XE_MADV_PURGEABLE_WILLNEED,
>>   			};
>>   
>>   			flags |= op->map.vma_flags &
>> XE_VMA_CREATE_MASK;
>> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c
>> b/drivers/gpu/drm/xe/xe_vm_madvise.c
>> index d9cfba7bfe0b..c184426546a2 100644
>> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
>> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
>> @@ -12,6 +12,7 @@
>>   #include "xe_pat.h"
>>   #include "xe_pt.h"
>>   #include "xe_svm.h"
>> +#include "xe_vm.h"
>>   
>>   struct xe_vmas_in_madvise_range {
>>   	u64 addr;
>> @@ -183,6 +184,89 @@ static void madvise_pat_index(struct xe_device
>> *xe, struct xe_vm *vm,
>>   	}
>>   }
>>   
>> +/**
>> + * xe_bo_all_vmas_dontneed() - Check if all VMAs of a BO are marked
>> DONTNEED
>> + * @bo: Buffer object
>> + *
>> + * Check all VMAs across all VMs to determine if BO can be purged.
>> + * Shared BOs require unanimous DONTNEED state from all mappings.
>> + *
>> + * Caller must hold BO dma-resv lock.
>> + *
>> + * Return: true if all VMAs are DONTNEED, false otherwise
>> + */
>> +static bool xe_bo_all_vmas_dontneed(struct xe_bo *bo)
>> +{
>> +	struct drm_gpuvm_bo *vm_bo;
>> +	struct drm_gpuva *gpuva;
>> +	struct drm_gem_object *obj = &bo->ttm.base;
>> +	bool has_vmas = false;
>> +
>> +	xe_bo_assert_held(bo);
>> +
>> +	drm_gem_for_each_gpuvm_bo(vm_bo, obj) {
>> +		drm_gpuvm_bo_for_each_va(gpuva, vm_bo) {
>> +			struct xe_vma *vma = gpuva_to_vma(gpuva);
>> +
>> +			has_vmas = true;
>> +
>> +			/* Any non-DONTNEED VMA prevents purging */
>> +			if (vma->attr.purgeable_state !=
>> XE_MADV_PURGEABLE_DONTNEED)
>> +				return false;
>> +		}
>> +	}
>> +
>> +	/*
>> +	 * No VMAs => no mapping-level DONTNEED hint.
>> +	 * Default to WILLNEED to avoid making BOs purgeable without
>> +	 * explicit user intent.
>> +	 */
>> +	if (!has_vmas)
>> +		return false;
>> +
>> +	return true;
>> +}
>> +
>> +/**
>> + * xe_bo_recompute_purgeable_state() - Recompute BO purgeable state
>> from VMAs
>> + * @bo: Buffer object
>> + *
>> + * Walk all VMAs to determine if BO should be purgeable or not.
>> + * Shared BOs require unanimous DONTNEED state from all mappings.
>> + *
>> + * Locking: Caller must hold BO dma-resv lock. When iterating GPUVM
>> lists,
>> + * VM lock must also be held (write) to prevent concurrent VMA
>> modifications.
>> + * This is satisfied at both call sites:
>> + * - xe_vma_destroy(): holds vm->lock write
>> + * - madvise_purgeable(): holds vm->lock write (from madvise ioctl
>> path)
>> + *
>> + * Return: nothing
>> + */
>> +void xe_bo_recompute_purgeable_state(struct xe_bo *bo)
>> +{
>> +	if (!bo)
>> +		return;
>> +
>> +	xe_bo_assert_held(bo);
>> +
>> +	/*
>> +	 * Once purged, always purged. Cannot transition back to
>> WILLNEED.
>> +	 * This matches i915 semantics where purged BOs are
>> permanently invalid.
>> +	 */
>> +	if (bo->madv_purgeable == XE_MADV_PURGEABLE_PURGED)
>> +		return;
>> +
>> +	if (xe_bo_all_vmas_dontneed(bo)) {
>> +		/* All VMAs are DONTNEED - mark BO purgeable */
>> +		if (bo->madv_purgeable !=
>> XE_MADV_PURGEABLE_DONTNEED)
>> +			xe_bo_set_purgeable_state(bo,
>> XE_MADV_PURGEABLE_DONTNEED);
>> +	} else {
>> +		/* At least one VMA is WILLNEED - BO must not be
>> purgeable */
>> +		if (bo->madv_purgeable !=
>> XE_MADV_PURGEABLE_WILLNEED)
>> +			xe_bo_set_purgeable_state(bo,
>> XE_MADV_PURGEABLE_WILLNEED);
>> +	}
>> +}
>> +
>>   /**
>>    * madvise_purgeable - Handle purgeable buffer object advice
>>    * @xe: XE device
>> @@ -231,14 +315,20 @@ static void __maybe_unused
>> madvise_purgeable(struct xe_device *xe,
>>   
>>   		switch (op->purge_state_val.val) {
>>   		case DRM_XE_VMA_PURGEABLE_STATE_WILLNEED:
>> -			xe_bo_set_purgeable_state(bo,
>> XE_MADV_PURGEABLE_WILLNEED);
>> +			vmas[i]->attr.purgeable_state =
>> XE_MADV_PURGEABLE_WILLNEED;
>> +
>> +			/* Update BO purgeable state */
>> +			xe_bo_recompute_purgeable_state(bo);
>>   			break;
>>   		case DRM_XE_VMA_PURGEABLE_STATE_DONTNEED:
>> -			xe_bo_set_purgeable_state(bo,
>> XE_MADV_PURGEABLE_DONTNEED);
>> +			vmas[i]->attr.purgeable_state =
>> XE_MADV_PURGEABLE_DONTNEED;
>> +
>> +			/* Update BO purgeable state */
>> +			xe_bo_recompute_purgeable_state(bo);
>>   			break;
>>   		default:
>> -			drm_warn(&vm->xe->drm, "Invalid madvice
>> value = %d\n",
>> -				 op->purge_state_val.val);
>> +			/* Should never hit - values validated in
>> madvise_args_are_sane() */
>> +			xe_assert(vm->xe, 0);
>>   			return;
>>   		}
>>   	}
>> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.h
>> b/drivers/gpu/drm/xe/xe_vm_madvise.h
>> index b0e1fc445f23..39acd2689ca0 100644
>> --- a/drivers/gpu/drm/xe/xe_vm_madvise.h
>> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.h
>> @@ -8,8 +8,11 @@
>>   
>>   struct drm_device;
>>   struct drm_file;
>> +struct xe_bo;
>>   
>>   int xe_vm_madvise_ioctl(struct drm_device *dev, void *data,
>>   			struct drm_file *file);
>>   
>> +void xe_bo_recompute_purgeable_state(struct xe_bo *bo);
>> +
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h
>> b/drivers/gpu/drm/xe/xe_vm_types.h
>> index 43203e90ee3e..fd563039e8f4 100644
>> --- a/drivers/gpu/drm/xe/xe_vm_types.h
>> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
>> @@ -94,6 +94,17 @@ struct xe_vma_mem_attr {
>>   	 * same as default_pat_index unless overwritten by madvise.
>>   	 */
>>   	u16 pat_index;
>> +
>> +	/**
>> +	 * @purgeable_state: Purgeable hint for this VMA mapping
>> +	 *
>> +	 * Per-VMA purgeable state from madvise. Valid states are
>> WILLNEED (0)
>> +	 * or DONTNEED (1). Shared BOs require all VMAs to be
>> DONTNEED before
>> +	 * the BO can be purged. PURGED state exists only at BO
>> level.
>> +	 *
>> +	 * Protected by BO dma-resv lock. Set via
>> DRM_IOCTL_XE_MADVISE.
>> +	 */
>> +	u32 purgeable_state;
>>   };
>>   
>>   struct xe_vma {
