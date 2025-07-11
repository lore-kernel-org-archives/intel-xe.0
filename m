Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74B1CC83F1A
	for <intel-xe@archiver.kernel.org>; Fri, 11 Jul 2025 00:36:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D59510E991;
	Fri, 11 Jul 2025 00:36:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cAT9DpjL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E378410E00D
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Jul 2025 00:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752194193; x=1783730193;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=JCwqVxmNKBmk35u6r2cuYyVqOTbtQDEufS/o6MjF2u4=;
 b=cAT9DpjLol9Rhn6DYYq+YKIA8rQhS52N3ZJwmwa3eF/xZDKQRe0prALU
 tKEBUDQ/Ow/ZojTdrXPzBguo7IybkeEG/0p7lIsAtTYwrsHHc3fKss4dT
 Qy3sjiBgVZKpKJTkym3vAFkgqavtPdmVepICFeOQUpqLbky0Gpj3+WY2+
 yVE85UmkBi60aQhVASuRH7MIcNj4juid62m8kLeCHgn1qkkHu5h1qpEa8
 +peSrY3zhJ9CXBDMx9i70EgpJ2+TPn/ygRfgSdCCz8yEi4/3P6+R9fO6G
 M25HBYb+cFG04DsOfcLnmnLxm+11XS7qfqZby7XXjDCJ+BgAFUNHYbRbN w==;
X-CSE-ConnectionGUID: yV/2hWT+RJ6RSwcHfpefCw==
X-CSE-MsgGUID: dL9MBAViT3KTzfTLnBMlOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="54619601"
X-IronPort-AV: E=Sophos;i="6.16,302,1744095600"; d="scan'208";a="54619601"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 17:36:33 -0700
X-CSE-ConnectionGUID: oTs2kTtqQh+C3ALf9NlIPg==
X-CSE-MsgGUID: eypJHZRrROeIeDvk1bE6TQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,302,1744095600"; d="scan'208";a="156792923"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 17:36:32 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 17:36:32 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 10 Jul 2025 17:36:32 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.78) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 17:36:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EOdrqb97x0H3/DSUKK/QQxtttBUqKp1EiCA5vpRWyH3PkDmIBo4HS+bhqSLcWFYUf8RhktAq4MmTcEuVMd7wKQ1f95FhIRk8xAnFkchyY20LtK7y0wbQcwpqkt0rCd5HsNI0g084h1iZM5iRFVT8sBeiPq17M+UlUt4NUqEs1CdMTmAHB4CmfxRMARasm7CMfLYc3SwfkhupXpN1Y++VzoK/D0rLSTrVsad0d9xceNNxVvaDy6aSvBm395iCS6inGJBu1G6+dvx1TQ7jEgwLlWVi1/iIRTK+Rdi4XnolKbrqwNwoPnHHvBBYeoGWIfFpdL9u8/l8vxShnPsAk83ZQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yTS8rh8f7ODHbjjAjCdludOfdNre492JomOd0PStRfA=;
 b=Ad6J3AMU3aSgEYZerOjUkC808XxeLyLB+4Ri8vwBzlEUXeQMHzuzqUklbWrx1kXWGPIdqlLcEXg/ICrSZ3dHQKGRsTvqBXeaPupH2XHTN0plkOzBssIz7nUiulIerEMQgizwT57pIdPnXq3X9b0LJrwyxE4QRuI9U7awT/Azk/NeUcRg1Y6lIYYmhM6sVD5u+3BF17XsFEKivUZw0Ug5q0SjwHTMk5KRya3Q1d9/ARoKVp/CqCdYWVM6FosRIItTbwOxKJNKii3a4KDB0I0RPXoPFtZ8vPqWhy7FQ8fyOdqRe3LrpUP+qS8gXaG28ParWmNUz/md93WIrIVrtqK6ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SJ0PR11MB5940.namprd11.prod.outlook.com (2603:10b6:a03:42f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.29; Fri, 11 Jul
 2025 00:36:22 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8901.024; Fri, 11 Jul 2025
 00:36:22 +0000
Date: Thu, 10 Jul 2025 17:36:12 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <lucas.demarchi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <raag.jadav@intel.com>,
 <frank.scarbrough@intel.com>, <sk.anirban@intel.com>
Subject: Re: [PATCH v4 8/9] drm/xe/xe_hw_error: Handle CSC Firmware reported
 Hardware errors
Message-ID: <aHBcfIp4FzeivAdB@unerlige-desk.amr.corp.intel.com>
References: <20250709112024.1053710-1-riana.tauro@intel.com>
 <20250709112024.1053710-9-riana.tauro@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250709112024.1053710-9-riana.tauro@intel.com>
X-ClientProxiedBy: MW4P223CA0023.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::28) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SJ0PR11MB5940:EE_
X-MS-Office365-Filtering-Correlation-Id: 73460b99-6164-409e-d368-08ddc012f5c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RTgwbFIyYWtsRmp0ZS8ydCtjVkJCQnNxMjd4V1BybVRxUVIrVXJQVHZaeUtu?=
 =?utf-8?B?MG1DT0x1a1NEaWZmR09EVzFHczJncWNDbnVJWUM4cVJrVG1EZ3ZnbXZOQ3Yr?=
 =?utf-8?B?ekJBcDFjUzdqVWt0VEl2ZEY5SUZGZmd0dy9kZjYxNERjaGJjdndDZUFDWjVV?=
 =?utf-8?B?d0E3bVBnODlkYjZSN2VvUjFrV0ZRRlAydjhkdldQVUNpamRwZC9NWnR3ZktV?=
 =?utf-8?B?elFOazF3T0ZqcWwwc1pzdnkyLzBDV05pSktOMGgwR2ZHUjR0VTRzVFpTSG44?=
 =?utf-8?B?TUhscGNsT29WMHQxQkx4TGlMMThCQkxsUElxbnJvWGMrd0JvRGNnT1JUMzRO?=
 =?utf-8?B?ekU0WlczcFVTMDFCZUd1NlBUaXZnTGpualBOUlFZVkdyMENrMml3aXdRaHB2?=
 =?utf-8?B?V2d4WUVOTk5KWU1yRFRvUkxvM2NqRVdxMk4vZnUxM1M1MU11UWd6T1BlSUVX?=
 =?utf-8?B?S2ZYS0p2SkdUeCtVcEpVOE1FT1NSVEtpY1pqWTd3aTQ0UmV0QUZTZE0vdCsv?=
 =?utf-8?B?ZXhsMFQwbXVCdkZyWWxXbys2UjYrZUlueGI2NGN2ZUR6WXdXck9KUjBWSVBJ?=
 =?utf-8?B?NDJmMUV2aFlqUGRpQStqNEJhZ2JvTThEVXNBdysxalFWQklnQXgwSGFYc1A3?=
 =?utf-8?B?Rm5yQjJtZTRCZlhPUGNML2ZNVU8zdEtxN3N0VVRtS3oyRzYyYk9wdEpZTlZw?=
 =?utf-8?B?eEljeGpxeklETUJ1L2lEaFZlb21OTGpLdkQwcm5oa2xLZlA2MGN6bDg4V0tu?=
 =?utf-8?B?T2h1THNNK3BxMUVyRnpnV2o5dVFTakYvMldWRm1ranRrWks0UER6Y2p1UlRx?=
 =?utf-8?B?cXhIc2RxM2xuMzEvSFhZV3BxVHA5NmxsdlQ4Q0JFczlRaitlK3Z4bFFCT2E4?=
 =?utf-8?B?d0V5bTN1bC9uN25RWFhQajhScFUxSWVGVTVpMWJFVllqK3R2QnB0c01RcXU2?=
 =?utf-8?B?U2tQWU8va0VUdzlRcnlCZ3ZnMlZLNitNSkhIdU94NEsyLzJ0Y1VhY3Rma1hH?=
 =?utf-8?B?VDRyMFRja2NFc1ZSaUo4VVZMdEJ3Q2lLNDI5RzFwd3dFazY2Z09qSzhGUDlw?=
 =?utf-8?B?QWh1ZVBTbXdJVHd2c0dXNTkwQ25IT0JEQ0d0aHU0OEo3Y1hXOWd0OS9uSXhn?=
 =?utf-8?B?RWZMV0xsWm9Ib2tXQi92UHlzNVhYd2ZUM0xzWmZiaC9hWHRJRkJYMkVyMmgv?=
 =?utf-8?B?RGNDNzBaRTdTTzZPSlRTb2dVUjhxcHpUN2RUVnU5QXRSWGJDazNDR3Q4OUgz?=
 =?utf-8?B?RVY0d1lpSVJhbzZxVVo4dzVvc3liYlBmT2FjdVkvYkNZMHc1RUx2RnZ6RjIv?=
 =?utf-8?B?U3JydjROYVFoTFNLR0dPZjBjbG14RGViM0hEeTdRWFhrS3JiTjI4L01NR0xQ?=
 =?utf-8?B?Rm1vcFdzaFJpS0VCeTE2NnVtcHNPSzF1VkZJQ01KQWZwWlFDeUNaKysyTVFS?=
 =?utf-8?B?ZnVXREc0dVJoVVViUDVKR1hDaWxhbmtNMCtGUXpsMVBZUjFmNnlUcjRDMko4?=
 =?utf-8?B?elNlbFRMRnhpNHY3ajFiYkdLSGpKSUhnRG9VVlJVa1BIMU5jYUl6eHA0ZURy?=
 =?utf-8?B?OVFkaGErdkkxVEhsVE94bnRFNGtUeXFCOUZaUDZXNVhlZlhpa1JMWGpGUFBv?=
 =?utf-8?B?T1dLKzBMSmx6NnpXQ1FtM2x3RVpyU0JXNWMzMkdqQ1RxcEk2OHFZUXdwbjdy?=
 =?utf-8?B?NmlmWFM1RDk4Y1NqN3ZHQ3N6TG1pZ2p6MUlGUlllVkNjVlhDaDVISE9wN1E3?=
 =?utf-8?B?K3F2Ynk0V1F0aTI0VGlBd0grcDVGMkNnU2UyWFcxa3U2azB6cklJU0FsRVRm?=
 =?utf-8?B?cUR3Tk14eHV6VTEvZ3c4Y1dzVURMYU93NGVlYVphTXhQZVNjOXBLUEw5TTJm?=
 =?utf-8?B?VE9yaXZvTS9vU3FvenhlMFhPeWhrcE9iLytCMFhsMm45UHc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RG9WMmZhQ1U0THhjb2NiRitvemJtdnd6djJiYzJYL1l0cTB0QmM1akxETkZy?=
 =?utf-8?B?N0xCTkJYc3hpLzhVRVFtMXBkbFA5eStRVUtCZFdMRDdYSUNlcis0QjRVQmNW?=
 =?utf-8?B?QTd0UmtOL3NrcjFYZzRUREJ3Q3Ztb05IUUsxd0VnaGx6ZHM5Z0Nlc3pybWg4?=
 =?utf-8?B?UmtvYTdsbkhCMWNyd2JQVTR5N2krUW0xczJqQlhXNzQvVWZpNDZuMWFXV0Q1?=
 =?utf-8?B?QVcrbDQ2UnJEMEdIVnoxNHRsRUhxOUtNNkpmdThJY3c4MXI1emFTOXJRays3?=
 =?utf-8?B?ZWRCbG9aMHdWaWJLQXBSZTNUQnFXNGZIVkNwajRGVWFiZXZWekNHZVU0V2V0?=
 =?utf-8?B?ekRzdDZPdy94bWd1ajJXS2xKS2g2ZG5XTkxkSlBPSjJ1YVVSN2hVUjVNd1dU?=
 =?utf-8?B?cWhJNDBGaGR5RE4wVjZvNVlWWnArbWNWamdMYUU4R3dQMkpPb3VvMEJRTnp1?=
 =?utf-8?B?N3FYWnBIYnlZRnQwMkdDSHYvUllFVXlPWnpTL1ByeCtkRjJQNmIyampUWitn?=
 =?utf-8?B?VnJNZW5TTU1ZcWhIMXdVRm9kT0htQWEwbDhTU1d4U2tRNmJTYklYMnhrczJN?=
 =?utf-8?B?OEZqVGpRbEViZGpYZ3BqbGFoU2pYQkdqcnBIYXNoc25RWDFwNHdoNXpNMVEv?=
 =?utf-8?B?Y1lHS3E4WmNYTzk5Y0JYT3Y3ODNDMU5RZzZQb0xaL0dyYVpSRWw5YVJqNDhR?=
 =?utf-8?B?UWRMRFBqQm1LUmZPcVBINGNxT09JYTZXSXlNL002dnlFaTRjWHFSTUhiQmd1?=
 =?utf-8?B?UytwRDZuN2N0R1ZiRWdENU5IMTBJVW1iQXJQY2VrQUVEc09LVEVXZFA5dDFp?=
 =?utf-8?B?dmJxYzNHQjRJQ1Z0UFFEUk8yZHU3T2htWi9PNUJwN29ENjczYS8vb245cFM4?=
 =?utf-8?B?a3Zma1ZVTzhWWkp1S1Rhd1ovZklXMVhvSUxmNWRMaXhBelI0RTRqcVpJQkFC?=
 =?utf-8?B?TUp1QTVBNGVQV2RocVg5bm9KTXVFbTE2b1RQQ05BSE9qT2VZb3F4RlloNTRi?=
 =?utf-8?B?RUJWNHVmOEtvWTl0TjRTQWtPd0c1bTNITzB2MUpCMWNjdWxMSEZPRkFJRmFG?=
 =?utf-8?B?NWdJendpZjB4dXRhTy8yR0xMajB0SzIvU1U0a280Z1drdnJCSDA5dXY0ekFV?=
 =?utf-8?B?NW5Zb0Y0MnNOcGROWlVVNW5NZDhvckJVWWRGeWNYSFJUQUY1SDN0TW1wdklI?=
 =?utf-8?B?RUlQd2tNeEY0SVdianpMdnVwQWpmWmVkYUtlUjNOTkFCNWpYR3RtU2VleklH?=
 =?utf-8?B?bnMrL2g4MU1nUDZFT3VaTi9IU2kxaWJNS3AzdnZWSVBLMXJleUt1VFp4Ymxx?=
 =?utf-8?B?aXdXMjNiRlp1OFExcFZId2krb0phYWlDSTkrOUtTSXZnRWdxUUNEUk10Y0xM?=
 =?utf-8?B?dHM0OXpuWDJlS0RscEdobStJVjJQSURaMVhndHE0TTR1bTluMzNEQ21tYTAz?=
 =?utf-8?B?b2JLdUV0aERsb1J4N2FMRWt4QldKclR0cjZwL2d1M1kzdmVqc2lUZEV5T0dj?=
 =?utf-8?B?eWxWTEFQTmMzNE9kYlo4eGorSGE2NWpUSTU4Wkg4WTBNMFNHVngxeU5XT21Q?=
 =?utf-8?B?NU5ZNXVtTmM4dzV3OHZtTUgzZWFWdXBXZEVFNlNOK1FwVmtWWGlCZTcvVEFC?=
 =?utf-8?B?Ty9xU0l0SUhEOG9hUm5qRCs0TmFYNGp4WkZ4cVVZSnRSaGN0K1lBZ2hIYy9w?=
 =?utf-8?B?a29nUk4xT3NnSjVJdmh5c2gxWk9Ta25MRFZTMUVkSHhPYVEvRjZHd1BKalQ0?=
 =?utf-8?B?Vyt5OXhFRnIyaG5hM0tIbXN5VWJmV0tJb0R5QzMvNWs2UmEvc3RhSWc0WG92?=
 =?utf-8?B?WjFkVEZuTDN3U0R4Z3BxbU9wcVBPcEo1Q0hKQm9USnZtRFhTOUxMeXVON2pk?=
 =?utf-8?B?RzZjcHcvZFRFRkw5UmxJS0ZUMG1kQ05tcWN1Y1p0NnFZNUhBOXIybzdoTnBR?=
 =?utf-8?B?NmtWcS9CTTlhTTIyalpWalp0VVdmTHAwanpvbGZsQ0ZHT2JRbXFZSVRQaE9z?=
 =?utf-8?B?ZVZiM1NqdnlMZ0NDVVZEYnVZQVk4bnY0YUlVYUZFQnZVTFJGSG5wVVZyV3Zq?=
 =?utf-8?B?bVRmRW5sUFpxQkpRNlV6SVo4S29xRlpMNXRvVE03eWpsTHdZbWJWcDRJc2Vh?=
 =?utf-8?B?K0Q3YXMySENwanZHRXdwUXNJUU5OdExvUmJmL014elhrcnh6N2t6eXQ4U0sr?=
 =?utf-8?Q?jKbyNsQrZC9tnafmaWW+52M=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 73460b99-6164-409e-d368-08ddc012f5c4
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2025 00:36:22.3232 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e5KMh7ak1CI7o+S09LGCUMiZFOeb5yzT+f/6o0Fwv86KRYpdcnlGtFDqkFWUiAQzqdxAoixJBSP4A9jn8kuIAydKMM4JYvc2V6f+GMnKSu4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5940
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

On Wed, Jul 09, 2025 at 04:50:20PM +0530, Riana Tauro wrote:
>Add support to handle CSC firmware reported errors. When CSC firmware
>errors are encoutered, a error interrupt is received by the GFX device as
>a MSI interrupt.
>
>Device Source control registers indicates the source of the error as CSC
>The HEC error status register indicates that the error is firmware reported
>Depending on the type of error, the error cause is written to the HEC
>Firmware error register.
>
>On encountering such CSC firmware errors, the graphics device is
>non-recoverable from driver context. The only way to recover from these
>errors is firmware flash. The device is then wedged and userspace is
>notified with a drm uevent
>
>v2: use vendor recovery method with
>    runtime survivability (Christian, Rodrigo, Raag)
>
>v3: move declare wedged to runtime survivability mode (Rodrigo)
>
>Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>---
> drivers/gpu/drm/xe/regs/xe_gsc_regs.h      |  2 +
> drivers/gpu/drm/xe/regs/xe_hw_error_regs.h |  7 ++-
> drivers/gpu/drm/xe/xe_device_types.h       |  3 +
> drivers/gpu/drm/xe/xe_hw_error.c           | 68 +++++++++++++++++++++-
> 4 files changed, 78 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/regs/xe_gsc_regs.h b/drivers/gpu/drm/xe/regs/xe_gsc_regs.h
>index 9b66cc972a63..180be82672ab 100644
>--- a/drivers/gpu/drm/xe/regs/xe_gsc_regs.h
>+++ b/drivers/gpu/drm/xe/regs/xe_gsc_regs.h
>@@ -13,6 +13,8 @@
>
> /* Definitions of GSC H/W registers, bits, etc */
>
>+#define BMG_GSC_HECI1_BASE	0x373000
>+
> #define MTL_GSC_HECI1_BASE	0x00116000
> #define MTL_GSC_HECI2_BASE	0x00117000
>
>diff --git a/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h b/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h
>index ed9b81fb28a0..c146b9ef44eb 100644
>--- a/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h
>+++ b/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h
>@@ -6,10 +6,15 @@
> #ifndef _XE_HW_ERROR_REGS_H_
> #define _XE_HW_ERROR_REGS_H_
>
>+#define HEC_UNCORR_ERR_STATUS(base)                    XE_REG((base) + 0x118)
>+#define    UNCORR_FW_REPORTED_ERR                      BIT(6)
>+
>+#define HEC_UNCORR_FW_ERR_DW0(base)                    XE_REG((base) + 0x124)
>+
> #define DEV_ERR_STAT_NONFATAL			0x100178
> #define DEV_ERR_STAT_CORRECTABLE		0x10017c
> #define DEV_ERR_STAT_REG(x)			XE_REG(_PICK_EVEN((x), \
> 								  DEV_ERR_STAT_CORRECTABLE, \
> 								  DEV_ERR_STAT_NONFATAL))
>-
>+#define   XE_CSC_ERROR				BIT(17)
> #endif
>diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>index ca300338e8c2..283d5c88758e 100644
>--- a/drivers/gpu/drm/xe/xe_device_types.h
>+++ b/drivers/gpu/drm/xe/xe_device_types.h
>@@ -241,6 +241,9 @@ struct xe_tile {
> 	/** @memirq: Memory Based Interrupts. */
> 	struct xe_memirq memirq;
>
>+	/** @csc_hw_error_work: worker to report CSC HW errors */
>+	struct work_struct csc_hw_error_work;
>+
> 	/** @pcode: tile's PCODE */
> 	struct {
> 		/** @pcode.lock: protecting tile's PCODE mailbox data */
>diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
>index 0f2590839900..7cc9b8a7fa1a 100644
>--- a/drivers/gpu/drm/xe/xe_hw_error.c
>+++ b/drivers/gpu/drm/xe/xe_hw_error.c
>@@ -3,12 +3,16 @@
>  * Copyright © 2025 Intel Corporation
>  */
>
>+#include "regs/xe_gsc_regs.h"
> #include "regs/xe_hw_error_regs.h"
> #include "regs/xe_irq_regs.h"
>
> #include "xe_device.h"
> #include "xe_hw_error.h"
> #include "xe_mmio.h"
>+#include "xe_survivability_mode.h"
>+
>+#define  HEC_UNCORR_FW_ERR_BITS 4
>
> /* Error categories reported by hardware */
> enum hardware_error {
>@@ -18,6 +22,13 @@ enum hardware_error {
> 	HARDWARE_ERROR_MAX,
> };
>
>+static const char * const hec_uncorrected_fw_errors[] = {
>+	"Fatal",
>+	"CSE Disabled",
>+	"FD Corruption",
>+	"Data Corruption"
>+};
>+
> static const char *hw_error_to_str(const enum hardware_error hw_err)
> {
> 	switch (hw_err) {
>@@ -32,6 +43,56 @@ static const char *hw_error_to_str(const enum hardware_error hw_err)
> 	}
> }
>
>+static void csc_hw_error_work(struct work_struct *work)
>+{
>+	struct xe_tile *tile = container_of(work, typeof(*tile), csc_hw_error_work);
>+	struct xe_device *xe = tile_to_xe(tile);
>+	int ret;
>+
>+	ret = xe_survivability_mode_runtime_enable(xe);

xe_survivability_mode_runtime_enable() returns if it's not BMG, not dgfx 
etc., so does it make sense to not even queue the work if those 
conditions are not met?

>+	if (ret)
>+		drm_err(&xe->drm, "Failed to enable runtime survivability mode\n");
>+}
>+
>+static void csc_hw_error_handler(struct xe_tile *tile, const enum hardware_error hw_err)
>+{
>+	const char *hw_err_str = hw_error_to_str(hw_err);
>+	struct xe_device *xe = tile_to_xe(tile);
>+	struct xe_mmio *mmio = &tile->mmio;
>+	u32 base, err_bit, err_src;
>+	unsigned long fw_err;
>+
>+	if (xe->info.platform != XE_BATTLEMAGE)
>+		return;
>+
>+	/* Not supported in BMG */
>+	if (hw_err == HARDWARE_ERROR_CORRECTABLE)
>+		return;
>+
>+	base = BMG_GSC_HECI1_BASE;
>+	lockdep_assert_held(&xe->irq.lock);
>+	err_src = xe_mmio_read32(mmio, HEC_UNCORR_ERR_STATUS(base));
>+	if (!err_src) {
>+		drm_err_ratelimited(&xe->drm, HW_ERR "Tile%d reported HEC_ERR_STATUS_%s blank\n",
>+				    tile->id, hw_err_str);
>+		return;
>+	}
>+
>+	if (err_src & UNCORR_FW_REPORTED_ERR) {
>+		fw_err = xe_mmio_read32(mmio, HEC_UNCORR_FW_ERR_DW0(base));
>+		for_each_set_bit(err_bit, &fw_err, HEC_UNCORR_FW_ERR_BITS) {
>+			drm_err_ratelimited(&xe->drm, HW_ERR
>+					    "%s: HEC Uncorrected FW %s error reported, bit[%d] is set\n",
>+					     hw_err_str, hec_uncorrected_fw_errors[err_bit],
>+					     err_bit);
>+
>+			schedule_work(&tile->csc_hw_error_work);
>+		}
>+	}
>+
>+	xe_mmio_write32(mmio, HEC_UNCORR_ERR_STATUS(base), err_src);
>+}
>+
> static void hw_error_source_handler(struct xe_tile *tile, const enum hardware_error hw_err)
> {
> 	const char *hw_err_str = hw_error_to_str(hw_err);
>@@ -50,7 +111,8 @@ static void hw_error_source_handler(struct xe_tile *tile, const enum hardware_er
> 		goto unlock;
> 	}
>
>-	/* TODO: Process errrors per source */
>+	if (err_src & XE_CSC_ERROR)
>+		csc_hw_error_handler(tile, hw_err);
>
> 	xe_mmio_write32(&tile->mmio, DEV_ERR_STAT_REG(hw_err), err_src);
>
>@@ -101,8 +163,12 @@ static void process_hw_errors(struct xe_device *xe)
>  */
> void xe_hw_error_init(struct xe_device *xe)
> {
>+	struct xe_tile *tile = xe_device_get_root_tile(xe);
>+
> 	if (!IS_DGFX(xe) || IS_SRIOV_VF(xe))
> 		return;
>
>+	INIT_WORK(&tile->csc_hw_error_work, csc_hw_error_work);

Same here, why have a worker if it's not BMG?

Also, reiterating a previous comment in another patch - if the feature 
can be defined as a has_ struct member in the pci/gt info that could 
streamline the checks.

Thanks,
Umesh

>+
> 	process_hw_errors(xe);
> }
>-- 
>2.47.1
>
