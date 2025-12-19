Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6CBDD7879C
	for <intel-xe@archiver.kernel.org>; Fri, 19 Dec 2025 16:42:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84E5D10E223;
	Fri, 19 Dec 2025 16:42:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ga/BXW2E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EF1010E223
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Dec 2025 16:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766162571; x=1797698571;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=gfqv0DkKwhabwthzp33EpURrVpZQgoBvWpyivkw2pZ8=;
 b=ga/BXW2ECidTxWeEQBwOredj+gd//ATwBSzS1E9z4PAeSfMNGlFiTGIE
 jYSW+iC+8Ln7VptvMeNFApMp1o5FzKngGGuza6BGIBezv4al4zFu2Q+D+
 w3usu4EqJAuTOKjAYc7IRBbhjDYMiyPfU3hnwMZ8sUPawkS0cDi91fOe7
 +iLJCI4M6YV8cTdpzBb3eTbqZicXLdUsSXlLld2gnePRj6W65aNpTitg7
 nBPbkGSZ9e0CA5cOdksWw9cFVI3JXytcNSbgmiJT1AFcJword2BjLN10J
 2FIDVAHzYbgva9f9JkmQih9sVcgEYHHmR4pE2HIaBP+3zAQgsyywjAx5c A==;
X-CSE-ConnectionGUID: d1DMkjxrT/2PeEWmByvpdw==
X-CSE-MsgGUID: yAqk2JW+S5+ewQD0Gc9CkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11647"; a="68171088"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="68171088"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 08:42:50 -0800
X-CSE-ConnectionGUID: 65jPbNwJQOO2r/bcqY0enw==
X-CSE-MsgGUID: 05cOZC4CRFibWTHKIL103g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="236331320"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 08:42:50 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 19 Dec 2025 08:42:50 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 19 Dec 2025 08:42:50 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.43) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 19 Dec 2025 08:42:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i3zVfgWC7YKM5zfGHyld4QQZB2Xak28LiNOXm8rkwGmxSZU07j45cAlM1oz+U43pULMPrDkUrevx4Y9i0uL6PxeG5YFh6UWEpvU51GoO9mpCCC0LxADbj4Kt9FMZQ7CXb/Xtr/tMGRngS/AfaOJVCFq21SmgbIGK6RzfZIFUuWK9YiOX2LFdp3S6VM/35TR6+lgSubUZvmxfBWUFZWsWLwWaxETJ27Te3he5hMW0Lm86nuOTWNDqNdTJnRR/ZvHMk+Vi2NMxDvD9pCpBrI53eKEV7enTjMQn8WS4FLDtTdEMVnY5fs2dY9Aw1DE47nv00s4OsYzaLlgfibTCVgQ+3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V7el4hm1gdFOz0XcUUMcycXgiaXo1XEO2Eld+ySjATA=;
 b=f8l0U3OKiKTbYaQLyVcgf6rNOR16ZK5JklrQg2WolXrzyLYC0Ow8ngFoC9o9v0xRaTyqsKO5c+gWRzwVS9BYC3Cp3Q71FBN8idnZdjR8x3Sx6JSuaspjXUkILAF/taLUiw12iDJYap2OtbMbaimI6RjGWHDVcK9JBPZYYfbtvugVlPfXVNdRAz3XfVM6dIECN2YkGMjaA7p4x6VVps3jM/CkfrOEc2ocMx0mgWk5wGx/0ZPZt/vjsiK9r7dz5iK4E9pBSGn/lOzjRuGLaF+X+NUQgp+U4pjkbUr9TGWgJhnN6AMVQi26CBOnx+FOCGpHkQ33uKnzwzPbZFm1Pt7vFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by LV3PR11MB8768.namprd11.prod.outlook.com (2603:10b6:408:211::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.9; Fri, 19 Dec
 2025 16:42:42 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%4]) with mapi id 15.20.9434.009; Fri, 19 Dec 2025
 16:42:42 +0000
Message-ID: <43529e9d-3bd4-44d5-a603-8394a7a0f049@intel.com>
Date: Fri, 19 Dec 2025 17:42:36 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: select CONFIGFS_FS dependency
To: Matt Roper <matthew.d.roper@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
CC: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>
References: <20251219080513.848072-2-riana.tauro@intel.com>
 <aUV3dk3wUpf7U6tP@intel.com>
 <20251219163238.GN4164497@mdroper-desk1.amr.corp.intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251219163238.GN4164497@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0202CA0015.eurprd02.prod.outlook.com
 (2603:10a6:803:14::28) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|LV3PR11MB8768:EE_
X-MS-Office365-Filtering-Correlation-Id: e95d31ce-7ea9-482f-f414-08de3f1da103
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dWwwYThjcHA3dUY5My9oLzltTVZTdnU1TzlDR2dVVHU2V0ZiQXNDRVNtbExi?=
 =?utf-8?B?Y3ZvR1JYM1BuSUdHU211UHZIK0pMSHNWOUVUU0tBVmIwTFRDV1kvOUtkc3c5?=
 =?utf-8?B?QytnNjl1YlZBeHEzd3JIb092eU5DUzJwSXlRQ3cvcFl6ZFh5L0tBaWhTcjBx?=
 =?utf-8?B?QUtBNlR1NUpSMENJQjUrTDd0U2V2eWlScTd3YUhIUFJIaThpYnh0SW82djIx?=
 =?utf-8?B?WUV4ZFkwYS9Rd0ZETjFaZlV3WXo4OS9DalBYK05iVDNQMFR6Y1h5YWh1VjFC?=
 =?utf-8?B?VTlPaUFHYjJ2RCtSVjI0MGd0UXlCRTFYWTZCTlg3SGdSSlZTMnRyT1pyb205?=
 =?utf-8?B?UExKMjltNDBBMTZObWtCS21yZXdqejFTY2lNU2hkeW4zV0tuTHdLQUtCdHE1?=
 =?utf-8?B?QTR5bDNZUzByZ0VoelhkU0tXcy9oS1dmeVlDQ0dqN2NCZm5QMGJqanhFc05j?=
 =?utf-8?B?enNUUlYwUkh0cC9DTlFNWlRxR1dmL0kzRXBrT3lOdGs0bTdZUkptWGlaYlBs?=
 =?utf-8?B?MVZwOEZtODRUWjNsQ0JmemV5K2JRTncxelkyUWZOdlVFNnBIeW5yM0NETzRy?=
 =?utf-8?B?ZU56Q1FTNlVlYmFhb2VxMlU0VGxLbWpSZjVDREh2YmJFUFV0ZXRxWUg0WjMv?=
 =?utf-8?B?OVhwWGpNRnJiSklJKy9lWkdhS1k4UnpGWXYwaFE0cXRFdkdaVWd5UFVwOUVZ?=
 =?utf-8?B?RDlVb3BhVWtXRVpHbmZhRWNhY20rTHl3R085MlVrT2lNZDBrTlpHREhtckZ4?=
 =?utf-8?B?VUZYaUNZWmx5a2xjN2Z4alJxdnhONUZuTjgzWDB2RWpnbEFGMEpFVkQ4dEkw?=
 =?utf-8?B?WmJvSzJXblpKKzNVbkdXUVRGbmlXTENSMU9uYkxNKzVoZlpmZEdDT2ZsRVZT?=
 =?utf-8?B?WGNvVi9DTlMrUHl5UnlOUTZQWE5TKy9oOEQyckxTUTNTWTQ2N3p6QzhlOW92?=
 =?utf-8?B?WXl1N2dRa2g1WWtxRjlkTVIrOUpkY0wwR04xYlpUZkRLelF6MHBuRzUyNlVX?=
 =?utf-8?B?dWsxY0JHSHFpbEhGbGg5d0JmSU1GaHl6UnBhd0Y1ZjBMOVFxNnhxT0k4d1dC?=
 =?utf-8?B?WTVtNFA4V2JzV1JuME9UajJsbE11Tlp6cS9MOFNvOGN1QXFDVTFCZUtzSVlW?=
 =?utf-8?B?WWdVeWhzWmVVZ3dFeXhGdmhkVEc5ai82bVNvUjQ4V0IwTVN0RDZQTHNVbGxB?=
 =?utf-8?B?OWVqZzBhK1VWL1QzNnh1cWxZK2d2c053UFdmTCs4ZmplcXNMTy9CRUpFdnBy?=
 =?utf-8?B?VFNpckd1YkRQU1daalE2Y0R0ZkZ6cWNnRUg4TzB1THdqUXZhaWhNeXMrYXlM?=
 =?utf-8?B?Y3VqTUZMc2I5aEZvRHpYRmFBTHdpVU5kWTR1RFpTay9vNlNxNWJVZUhtZUJn?=
 =?utf-8?B?SUprckZYQ0VvQ0JOKzMyZWdRR3hDbE9iemFlS3Urc1JUdkxNOENRaFI1M2gy?=
 =?utf-8?B?OUJEUFJSQXBEVkJmTVpuNDZlR1BVMDBpYlNUc3lMVHZKS1JWelRvM0RwUjNZ?=
 =?utf-8?B?L3pra1VlWUxSMC9HT1BCNXJpcTdJVkVZZi9melRSaEtpTHA1amszNWw1NWUz?=
 =?utf-8?B?bmhCaEFqNEgzVE11OFFXMTVMWW9UYjYrRzFybk5ycGZTV2ExT1I0Vk9udENX?=
 =?utf-8?B?bnQyU2ltYzN5MHZReWxrSzFUMm5OeGpveDF0UFhVUXNUZENNQmIrdTlHdUlN?=
 =?utf-8?B?ejVROUpxWTA4VnNlZGhTWm5sdVgrWGV3Umc3cEZXY2JncU40OUlSSktiRTFq?=
 =?utf-8?B?M0hFWXdLMU9LbnJlU0pINjNQZ2VuNDVUZ1M4L0FhUWxsR2Rmd2lHNk9naUo5?=
 =?utf-8?B?M3dsRVhFZDFGR2l1NFhpaHhaa3FsdmgweHMvTytJVjhTQXBsN2dnbXZIQ0x2?=
 =?utf-8?B?R3JXMXVkUCtIeFpYTytLemhjZXloR3c0RzRyS1pDMm42NGF5MU1Ya0hiaDJN?=
 =?utf-8?B?dGNVU2tiM1B1cXJ4T2w0aUdYU0ZNaitPZ0p0SUJXYzRYNE12RzBXWGMrdmVV?=
 =?utf-8?B?MlZzNkd5bEJnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RU1mTlhYTkpmYW82MkdNNHkyM0F6b1ErNTZRNXd3UXc1Vk13SUVrTlJodk9t?=
 =?utf-8?B?MUFSdmlaSEFwWVZ1ZXpWQjB5eHZpMGpEcmRUem84bjZUNnVEY2ZzODFaajlT?=
 =?utf-8?B?RkZTT3p4MTQwa1ZjOWZFVkNmSG0xbFJoS3ZUM0dNQzFFbmRrWUtvQUN3eGFy?=
 =?utf-8?B?dG9yUUFlMXpTa0RkdGNrWkwxMVVFbGJEWDJZNlROUm1OUFFSZEMySDNXV29x?=
 =?utf-8?B?b3VKY3EyTzdXWFZ3cS9Rd1BhMmpzenlTcFQzRFNxdmNneGhTOHRSbjBhM2dC?=
 =?utf-8?B?WFBEOUE5eUdxV2htbXJmVEJFVDRkT2JFUUI2eGRoRzJmT1JPT2o5RnJ1cFpv?=
 =?utf-8?B?RGVIZFVOMXZoVnhmM09ISkc2NjQ3Nmh2RlAvQ2hZQ3VEYXErSzFFYVhFSFVy?=
 =?utf-8?B?WjliUUFUZVI2QzhNQmZRS3UwRWVDSFlSdDFMbVVmcGVqTHpaYmZobDl0VjhH?=
 =?utf-8?B?d05LbEMweEJoSUgwd00wcGM4cDM2ZjY2QW91S0hsbVRLS1JHSXNaa1FyNFp0?=
 =?utf-8?B?cDBaNHRFSEcwZm1vcG1hNTU2MU42cDFxelNyb1gwM3lFUndaS05GNG9JQmhM?=
 =?utf-8?B?eCtLU2VsT0ZtV2dIYVROKzAvWEIvUUdhaWl1WXRaRFJyRStXcXFsd2w4ZlUy?=
 =?utf-8?B?TVFCQTlqTzRXRDBoOHlVN0g1NTY3T2NwOXhKT0J0T2o3dnhaL3RHYVZlQjdj?=
 =?utf-8?B?N0xmcTg0ckRxNE0zNzBOekJpaTQrZHVQYzJWNHpVUGcwTWJ6K1l5WlNDeTM2?=
 =?utf-8?B?Mzc1QXhRU0gvbkwwdXp0ZkJ4SDZHTTg0ZVNWY2pXcTVwL3pzWER2RFNLcEV5?=
 =?utf-8?B?emU2Kzgwd3AwYkRjNmxpNnJKbElMN0t4dml0aStaMnpqaTJzWTkycjEyRDZn?=
 =?utf-8?B?aStiRnc0SUdMV0h3MXFqaVB1cFBlQys4Y2J3Yi83dTFNejZqaFJtQ1pTcW9J?=
 =?utf-8?B?c1lEcnJ1RStOVElVUWppUzBtQXpQUklvZURCU0JYRkR3YXhwV21NcU5OTkox?=
 =?utf-8?B?Uk1wanVLT3cxUnVNREUrclpvU3BlWDAwdWVvU096Y21SUmxocmJ3VlZTZHBs?=
 =?utf-8?B?R2hVV0tTeU83aXVUUkxPVDduWXBWcWtUeUloR0YrZ3ZsUklhUmMzbWtJMjZQ?=
 =?utf-8?B?Zm9CTWRncG51YUUrVjJ1YjkvRjEwWGFBSkJVdThXbS9ENmQ0Mnhqb21XTnIw?=
 =?utf-8?B?MXhLd25ERWYyNWthaXVSQm9FdWhMOFRhMHhWVDdRRmZVb0R5dVY4K2xZTnRY?=
 =?utf-8?B?RkdCOVJQYnJQZlRjT3lhWHY1Y0hpRjltQW1SM0ZjTmIvOVNJRDFqemZGMVlh?=
 =?utf-8?B?dllaZWxDQzFGb2hXTVkyNTdiTVBFbkJNV1djYkR4VTF1WjZqRnA3SFR5QzdG?=
 =?utf-8?B?bWlYTzQyL2RJMlV0bmFabmJQTTlqRm94OGFNSFpUUUF1N1dIaU42L3l0STUz?=
 =?utf-8?B?M21GOXUwYm1OMXJFYXh3L1FGN1UxYms0QzlWdExMMUJyZkZZa01jcko3NkhD?=
 =?utf-8?B?WTU1dGN0YnJWSnVBM0s3RjBzMUNWWGFZWnhINHRCYzZRZk5KSjVqR0pSZzJR?=
 =?utf-8?B?NGNTS1F4cFJFb1RRZW1BMmxzTitiOFR6STE1bGJyNFdUenZwZ1Vxa2F5RXUv?=
 =?utf-8?B?RVBLdXFaTG9aZmdiRnZOT3pYQmxFV1dwNGw5T0QzMjl3bENlWmVsU0JvNTNr?=
 =?utf-8?B?NVllS04rc2ZDVWloNjFQaktRNXQ3ekVQdEt1OUNIL3VwRzJOWi8xQlh4Y0la?=
 =?utf-8?B?WU5DMHdnR3p5elZVNkF1K1YvUGxNeHpCQWdDSTFpZWExVWJXWnYrc3VUZnBS?=
 =?utf-8?B?UkRXdzRiMWRLQmY2WHZhOUJSNzM0QzI2UCtkSlQ0bHFQUHF0Z2ZEUWo5aUUw?=
 =?utf-8?B?V1VFSFhXY2RySjNnK1BVNDdHWE4vczJCUDMzam1QK2hGbEJWZC9qTXJTS3FK?=
 =?utf-8?B?TVp1TWQ2cnlXYnA4NUpqTStLaHYzK1QrZUxNRE1oNWhFU3cvaXhZREJYamZJ?=
 =?utf-8?B?aEVBaDBpSmROV2pwOTU4V2hwdkFPWVpoOGczOFRzUkE0VndSVU84Wk00dTRs?=
 =?utf-8?B?enkxQmNjWitoTkl2WTVCaWpISG5MOElZQUF2czNyRG1xMXNHZzFPNHJtcm9y?=
 =?utf-8?B?N3ptZGUvbXJjTnc1YnUydlZlWTNrTlFuMmJaajgxVk95aGVZdzdjVGo1L2NH?=
 =?utf-8?B?MzMzUUVYaFJsWk9pWko3UWcrTm80WmdjQTdaeG93QnQ1VGgxM2NCdEZzT2Ey?=
 =?utf-8?B?WmZQbks2MWo4Wndab0Npck0xemdZak9JZSt5NW5iMzlKK0xNdGlMSDdIWGxP?=
 =?utf-8?B?MFVHdVpXektsUVdsaDVEVEYyTHlucmpScTRZeGdHOHFvZ2dSSjJUTHJIM2U2?=
 =?utf-8?Q?OrE/Zfos4sG2Qmm4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e95d31ce-7ea9-482f-f414-08de3f1da103
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 16:42:42.3600 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YEJ99Hs9B5dJmzZ19YD7bCgeGA8QKBmuBckJ+efX5ZJOYZ+kDRAtT2Ba2bYMPYAIrOBXVV5gns9gU50X9fsUeDucgj1b498KvpQFDZqP85k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8768
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



On 12/19/2025 5:32 PM, Matt Roper wrote:
> On Fri, Dec 19, 2025 at 11:04:06AM -0500, Rodrigo Vivi wrote:
>> On Fri, Dec 19, 2025 at 01:35:14PM +0530, Riana Tauro wrote:
>>> Xe driver uses configfs functions to expose configuration to userspace.
>>> If CONFIGFS_FS is built as module (=m) when Xe is built-in (=y),
>>> undefined reference errors occur.
>>
>> Perhaps we don't need  this middle phrase. Only the first and the last.
>> But anyway, we need the patch in. I just pushed it.
>>
>> Thanks,
>> Rodrigo.
>>
>>> Add select CONFIGFS_FS to ensure configfs is built at minimum required
>>> level.
> 
> If we make this change, shouldn't we also remove all of the #ifdef logic
> we have to support running without configfs?

but is it a good idea to always back select CONFIGFS ?
maybe the actual fix should be like this:

-xe-$(CONFIG_CONFIGFS_FS) += xe_configfs.o
+
+ifdef CONFIG_CONFIGFS_FS
+       xe-y += xe_configfs.o
+endif


> 
> 
> Matt
> 
>>>
>>> Cc: Matt Roper <matthew.d.roper@intel.com>
>>> Reported-by: kernel test robot <lkp@intel.com>
>>> Closes: https://lore.kernel.org/oe-kbuild-all/202512190827.IeXYj4qg-lkp@intel.com/
>>> Closes: https://lore.kernel.org/oe-kbuild-all/202512181854.hPyTAXc5-lkp@intel.com/
>>> Closes: https://lore.kernel.org/oe-kbuild-all/202512190407.CcUFXX2F-lkp@intel.com/
>>> Fixes: 16280ded45fb ("drm/xe: Add configfs to enable survivability mode")
>>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>>> ---
>>>  drivers/gpu/drm/xe/Kconfig | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
>>> index 4b288eb3f5b0..1094c5fc5bdf 100644
>>> --- a/drivers/gpu/drm/xe/Kconfig
>>> +++ b/drivers/gpu/drm/xe/Kconfig
>>> @@ -46,6 +46,7 @@ config DRM_XE
>>>  	select WANT_DEV_COREDUMP
>>>  	select AUXILIARY_BUS
>>>  	select REGMAP if I2C
>>> +	select CONFIGFS_FS
>>>  	help
>>>  	  Driver for Intel Xe2 series GPUs and later. Experimental support
>>>  	  for Xe series is also available.
>>> -- 
>>> 2.47.1
>>>
> 

