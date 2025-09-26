Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEB58CAC5AE
	for <intel-xe@archiver.kernel.org>; Fri, 26 Sep 2025 11:39:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DA0910E066;
	Fri, 26 Sep 2025 11:39:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tk/KlUit";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6B3810E066
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Sep 2025 11:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758886774; x=1790422774;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=FnlkS5qAxnfL1ji7lNkzR9zNDr2X112AaBWigvlV17U=;
 b=Tk/KlUit5Cxxh6svlqe9F58AUnuMj+JWMZ9E6RMsZ+fW+r0rzNo0A0z/
 45gCoNPnDicQWUda9o0WkqFaS/LPbcEzsCSOGfLtiv/9uDl+1Hl3RCcWw
 lA2E/bH+FttywzD2Ns/pN9uKVNC8fJ78q3zWSLAxCp1tgjhFbld8YAG8a
 NlAIYt+cMwapwaO2Iu8aM0g1rCHvIB5fCOBEGFfR1T5cXPJFa0uzIer2d
 kitdszLy9/3JwaBhymZ/CGprvLOFGDMulo8ghc1V2HFUDToCVcnSNJz2k
 muV/ZKkno10o/zP9RmesA8CtV6HB5m+Ks9C7T9CCVvBLgQ6+iGizNconU A==;
X-CSE-ConnectionGUID: rRudatZ3S2e+EtxvFCEuMg==
X-CSE-MsgGUID: ukUm2JeGRe+nEfM2rylUxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="72316133"
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; d="scan'208";a="72316133"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 04:39:34 -0700
X-CSE-ConnectionGUID: LN4DFk+SRi6A8lOtqnxW8g==
X-CSE-MsgGUID: 3cag8vRERcGz7v9JxURquA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; d="scan'208";a="176870181"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 04:39:34 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 26 Sep 2025 04:39:32 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 26 Sep 2025 04:39:32 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.41) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 26 Sep 2025 04:39:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xsUXKx83brAWJ4uiLO59zOHKVauvVvgZ1EeMzTWbCb9zrmcb7pyvr+McI+THbsxgdxWiltcXCSFTIEHYfDu1RGPVvXMsFJ7bdvQyay5EgVKrGwfTiA+Rs3uJG1ZuNtfVMXAKdMmR4HDy3ntgrFkQc7BR6IESm6cYrlVzIPlpfRsUFWcd1f+upCRdi+j8N6gbLzec+3b3WvD/B2ily+BX5Ss4dw9mHR6MB+r8ziEdrLMEVYiy4uDBs1kasFnfltixbACVW7WxCceSAcjh30VeW8UzeJUSS7+VDA7kbPtZ5K6uL23K+LmXx8o0TK30N1P1yc0vw8jbN5KGT2S1pBNkEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HeByPdEaaSO1JnGhcOPJL6InDii8Z+6MmNwHY2PJGg8=;
 b=VcUG4SS3sORaKU5/m+qVcdB5XP7QcN6hBIziW2mQly4lomOLtjPRt48+6pAjgzxkI1aR1fO5+G+dPjvZYwokSbM9Y2eRUbOgTc7PHIUhQAeYzI68SJAF1X6L2oSOmaF81mOEi0T5I9rbjVyoy2g5SkfSkUOGsfq0UhqUSsSy6I0tA1/tMawykZwDrMDqwKOrHBohcmx9EYq2SSMzI0APqhOLZCMPDzQGdjtjfUsANmMJSmewjoawil3wAmuTg8Dbb5JU93OFCuSbE5oBmbQVZkvRfGFeTkSZvpq2YPaCTI9xvt/rHVTMUufVFTKaqiEYOX8ZIHD3kna4QnSE4/b+Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by MN2PR11MB4613.namprd11.prod.outlook.com (2603:10b6:208:26d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.13; Fri, 26 Sep
 2025 11:39:25 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9160.010; Fri, 26 Sep 2025
 11:39:25 +0000
Message-ID: <14246da3-5103-4886-9f88-fd241aab6ec7@intel.com>
Date: Fri, 26 Sep 2025 13:39:20 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 22/22] drm/xe/sriov: Disable SR-IOV if primary GT is
 disabled via configfs
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20250925234628.2112163-24-matthew.d.roper@intel.com>
 <20250925234628.2112163-46-matthew.d.roper@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250925234628.2112163-46-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR07CA0143.eurprd07.prod.outlook.com
 (2603:10a6:802:16::30) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|MN2PR11MB4613:EE_
X-MS-Office365-Filtering-Correlation-Id: d25cfec5-765f-43cc-67f9-08ddfcf1582c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RDZvMm9SN1o0NFp2T3djWkp4THlGZkVEU1NvL3dxM3czb0VDZGVwSzdEV3Jx?=
 =?utf-8?B?azBWMjI4YlBBNlp5OFp0YXlRMGtXYjI4QW15Tm5odUtEVHhUVFFBVUNZRVZQ?=
 =?utf-8?B?Rlh5NThZY2t0dzlraHpEcFNPSitiNjNHZnMrcHVwZ01qUE9LakJDL2w2VlVp?=
 =?utf-8?B?VzZnQlEvZ0E4aDVHWm1kVnVlbFhvT3pkUnJsVHZRbit2Nmt2c3l3N1lEbjVT?=
 =?utf-8?B?VDRtRVZHS0dpYnJNM2dNdnV5aVViUTEwZE1scC8yNkFrWlQ5MnozbDVGTUZh?=
 =?utf-8?B?K05xUFYvQlJENjNuRFBjRmhhL0hjd294eXh0bGNtbU9neUVIZEJZdmFZRW9t?=
 =?utf-8?B?akQzQlRWVmZQS0RhWTFnK2EvZFFqc2pDdkhjN3dRcGNtMVhvMEp5cy9oRm1u?=
 =?utf-8?B?dFg1TlNUalc0YVpYczN4UTdwSTcwYXhndHZyVlU5YnRHOTg5UHhYbmRhV2E1?=
 =?utf-8?B?TTY1MXlTMHNZbnA0WnFuUURNbEUyNERCY2hJcHFGU1NyaFp6V1hQOXNXRU1R?=
 =?utf-8?B?NXNSUDNrV0I3M1VkNTRTTHR6c0xQM1dGRU15M1M4c0lLWVUyM2NzOVhVK0Mv?=
 =?utf-8?B?a202a0paWDNJak5oVFhOMk4yL2MxUTY2WjNaQ1ZHSzRTTE9qRk9KTXBxNCsz?=
 =?utf-8?B?NC94b21UdjREKzBETmpCbXVHRjh2ZzBCOXh6NTF0ck1TbGpqcjJyaTlON1VQ?=
 =?utf-8?B?cUFXWFU1c2VOV3d5L1JFRk9XWSt4eDhxUzF4Y3Z0Z3UvSHVLcjErZktQT3hv?=
 =?utf-8?B?Q0JQRUYwY0pJRENmTDJ1aWxrRG9TTm95UEV1V0dBMW50YmtNZldkTVBhb3Vr?=
 =?utf-8?B?Y3VmeXZ5bDJmK3hoZW5tM2ttc0ErZEozdGJzb3pEUlFGbHVjVnhsSzA2dDcv?=
 =?utf-8?B?c3ZVUmZkKyt6VzhRZ3VJZnBLUFJmWlZGSnhEU0VBT0dJM2FvL1pPb25SaW03?=
 =?utf-8?B?ZE50Z29RQzB1NlBVaVNjeTZyRWtKWHYwT1NlYVZuRmFaMWpJZGc4NUgvZlBs?=
 =?utf-8?B?NUlINmZVQmJoUGI2V0ZNSjhmbHJWaC9sY001NWo1dEhZdUdEaVNMNmxWMi93?=
 =?utf-8?B?elpNb3VreW5VcEN5dVN4WTVRMmw5YmV6WnJBZWlYZ3J2SG5LT3hrbE5BLyt6?=
 =?utf-8?B?R0kvbm9sMFYvT3Iwd0JORWc0UVNhUDZFUXZSdURidFZ3UDFDeC9BZU1kTzJE?=
 =?utf-8?B?UFo2WnhSajZuRlgzRmlpSWV6ZWFkcWtXSzdhcUN4UjFtNWp5akQ2eVkzSkNx?=
 =?utf-8?B?REtFcUNEbFo5UUhzTFlPWHp1WHJrMmI4enRHaUpQQlloYkY0cG9aVkQ5ZGFP?=
 =?utf-8?B?MGl0R2Y0Mk5Jd1krTkFxSFNjR0FnM0RZRFBMYWw4dXB5OTZ5TTk1amVscWR2?=
 =?utf-8?B?ZUZBN0ZZRFMzVFYxdTMySU1VdHZudm5yQ3JGTlVtRzBlTWFyZkFWbG13Ykx5?=
 =?utf-8?B?SzNLT05IT1NwRFJBS1hNYmxzeUtrL3E3d2hud2I1dzVQcyt5S092bFhadE42?=
 =?utf-8?B?Q1NVS0pnSkhuRDZNNVNlMzIvN0xDVGFIbVAwd3NVRko1b0U5U2p1UUtwRjlR?=
 =?utf-8?B?RDB4QmZjNnl4RDFObFBNZGhuWTZrWVNkdmVPeG84d1VDMThrWStTRlQwbnRB?=
 =?utf-8?B?MUthQW1IM2FnTUVJKzRVKy8vMVJOaXNJdWpvWkxVUnJPSkV6NnoxdTd3MWNO?=
 =?utf-8?B?OVU5cjNLRC9WM3dBQS9lOWtuejZqcnJDZW1zaHFHTVczdnBiRFRrTlVXOHBY?=
 =?utf-8?B?VWpXS1VkaTZ4bENIVXlFejY0Z0RjQk1WUzlqZFFGTktZcmJWUUMwdW4vZnQ2?=
 =?utf-8?B?SW1oV09tVnJENit5ditRaHNNcTNKWitEMC9CdFZkWVVSZ1B0bDF1eFJnVHFn?=
 =?utf-8?B?NTVyWTBCNC9NaFpxSlpvWXF1Ny9hbGZjbjdkYXFhMit5Uzg0RVVKVFIvN0hj?=
 =?utf-8?Q?U9PAQuhX28Q=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UXdSV1JzRjlUSWZ1U1RQdHFNS2JHWGxSUHpLWGdDOXd1ZDUrOVdyY0FRejR3?=
 =?utf-8?B?dWpHdEVOMTdYVE1vc2xoQ2pUSHNqN0IvNjBTdncvbnFEcXZjbzZYMklrc0FH?=
 =?utf-8?B?ZElxdnBYcUIrNnQ4NmM4ckxLZWF5QmZxYUxheU1IaDRJTExBd3dvbFVyNEtr?=
 =?utf-8?B?RUo0NGVKZmo0THJjVmUyZzJpcFFpajVyczBCN25Tbkh2c0xaR1VMUVlyaFE3?=
 =?utf-8?B?T3F0SG5KeFVlV0tGZlZySUJKZEZGajg5Y2NPR3Frb2gzZWRtQmRvaFpJa1Zt?=
 =?utf-8?B?N1NQUk92RkF3N29qU0pUMWdEQ0tKZXk4Tk9GaFdNVzVBV3M0akhOV2V4TGtj?=
 =?utf-8?B?VFBtOFVQdlUwWHRIRnZWNTZpcjM2ckdYQ3dFZE9pck1yMkp3WUZ0akNRazM3?=
 =?utf-8?B?ZnJMcUtBbTFyZGMrQm9mSnloK21YU041RUFLTmVKMm5lajdjYnllQ0dnanJP?=
 =?utf-8?B?K3BPbGtyTGhZRStiL01NV3B4Q3hCaU4wOTlYNXZpT0dHWk1Yd1ZOUURvWlJI?=
 =?utf-8?B?RUd2NlYwUlVRUVIzek1uLzBxbEtoNER1dEF3TlRYQytHcXJCOHJldTZ0UU5X?=
 =?utf-8?B?V0M3dmFLRnVOKzVNd1dJa1F4Rkk5SFZvVzFVM0d5Zkk4c1pvRllRWHNpWGNv?=
 =?utf-8?B?SnhWdG56MGFDZVJlUTJhS2ladkdQTGNVZEV0RmQwRGh4ei9QSWUwSGtmNDU3?=
 =?utf-8?B?OGNEN3lUZUcyMjVhc1JabkRCR1RNS2xKZ3pVTGtCMld6cy9WMDh2ZkVVOTFx?=
 =?utf-8?B?b0UvT29VVEhqUE1LTldnRlN4cUR6cWNTdDVxQUEzelp5emlrS0k2TTU2cVVC?=
 =?utf-8?B?SmtoMzN4b3JheWZuUkZuZlFhUFkzL29SWkphOG4rNkd5QUJYQmxEekVBVnly?=
 =?utf-8?B?Y3NyMUpKSlBDRG81UkxmUEdFT3ZBcnhzY290RHJlRE1ydUtVQ0RuVHN1WTVQ?=
 =?utf-8?B?YnNhdHJDcEp0U1g5RjhuQVM2a2tLaUZVU2tSVlBxbmNUVCt4ZkR0SWw0UlNj?=
 =?utf-8?B?NHEra2E2dzc2c1pSaUJNbWk2Vittc2FXOVdQVTBVTW9HdE1JaE9ZOGlub09k?=
 =?utf-8?B?VHlEeWlWWHY2QjMzUmRQMm42Nm9hMWswUGFLYTdhWDExc2VpWU95aTg3UDNG?=
 =?utf-8?B?WmpoRjFJNERtWFpCT3lYdmlGVnErZHRwdXk5RDVIT2ZHTmM5MnVUZUlKTVBy?=
 =?utf-8?B?M08rcEVQUGxzT3VSWkN3STVrSk5XcGJDZmdENkxXTlFMZFdvWjhFQ2lkT3R6?=
 =?utf-8?B?WmwzekJJS3NhbnVLaEllZS9PTjBpQnpxbmxFdnlGa09kRi9FWGRtSXFaVnM2?=
 =?utf-8?B?UGlwQXFWUVpUb2hvblpBT1pob2o3ejIzWktOcGYwMTdTRThyaHZWc0pibmdQ?=
 =?utf-8?B?K1JheXN2bXA1U3AwZDhzeHVGRlFZVkxMR0JsUFY5aXNMTTh3YW5LWm9TRFVZ?=
 =?utf-8?B?aVhzak5NVmRXamF3MURDeVhxNmxVVTJ6aHZmbkJNMjlTS3FIRDFUc2JRbXhm?=
 =?utf-8?B?eXBtb1EyYjdMRHBjYnRsSE45c2JSb3REb3RVVS9KMmtGZjhWMWd4RXBNQTBC?=
 =?utf-8?B?a1RleWR4YmtrQmxpdlRjWUFTNmkrZjVpSksyZHBUQWREd3lBcmxwWFFzQ093?=
 =?utf-8?B?dlhDcjAyWkFJTlJNK1k0ZVFyaXlrUzc3a2d2ZlJUMHFkbzBxTisyaWUwSW9F?=
 =?utf-8?B?SlM2Vy9vK2tKWEpqT0FRb09IMWdUVy9kcmY2SHBuVHNhWXVMV21MRlhNQmFT?=
 =?utf-8?B?Tk1nK3NGNWt4b1c4aW41UUlmTU9VUzQ1UE1HelZOYWZaS0FsYk13bEUrRWRR?=
 =?utf-8?B?ZHVSM0FNbDc3a1paOHdYSXI1eXNsVXhOMW5nSURHb0E0QWp6WUp5S3F2SzdF?=
 =?utf-8?B?WHlOVmQwb2hyemVkZHZib1pMWHpjOW5RQVIzT25iSkVwQmQ1UEtQMzNQZFVz?=
 =?utf-8?B?ZU5VbElJTkVGOUoxTldTM2d6ZGhjd1BhOEx0dVplUGNmdUpicTcwdHZuVmU1?=
 =?utf-8?B?SUoxY1YxMWxGMEhhUDN1WTZGRmVNSnZkdEJZU0hmSWNPa1JyVEYrTGpWc1ZG?=
 =?utf-8?B?QnM2OWRLZm5TaWxUV3NvdmszNWJBQnpqWEZzWFg1UGo0Mkc4T1ZwL0xwcUNZ?=
 =?utf-8?B?Mk5Uc0Y4RnV1NUY1R0xVZUp0OWoyQyt3SW5ZZmZBMllzcGVGSnpNUGFOejVm?=
 =?utf-8?B?QkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d25cfec5-765f-43cc-67f9-08ddfcf1582c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 11:39:25.4938 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n8khZnYRka7IDn8Pr/OWlBQuTAKpymkm1dGbUsFbGjewoyRlyEF5baZWqLt9/Kj0C44X6s9GHyu2O/F5Bw8NUGI9l0DsC19LD3n5Q73zPew=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4613
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



On 9/26/2025 1:46 AM, Matt Roper wrote:
> SR-IOV operation relies on the primary GT's GuC to operate (in both PF
> and VF mode).  If the primary GT is disabled in VF mode, fail the probe.
> If the primary GT is disabled in PF mode, force the device back to
> native (non-sriov) mode.
> 
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c |  4 +++-
>  drivers/gpu/drm/xe/xe_sriov.c  | 19 ++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_sriov.h  |  2 +-
>  3 files changed, 22 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 0b4fa7769f05..1ae984f1fb90 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -736,7 +736,9 @@ int xe_device_probe_early(struct xe_device *xe)
>  	if (err)
>  		return err;
>  
> -	xe_sriov_probe_early(xe);
> +	err = xe_sriov_probe_early(xe);
> +	if (err)
> +		return err;
>  
>  	sriov_update_device_info(xe);
>  
> diff --git a/drivers/gpu/drm/xe/xe_sriov.c b/drivers/gpu/drm/xe/xe_sriov.c
> index 7d2d6de2aabf..9fa864f8c3fa 100644
> --- a/drivers/gpu/drm/xe/xe_sriov.c
> +++ b/drivers/gpu/drm/xe/xe_sriov.c
> @@ -10,6 +10,7 @@
>  #include "regs/xe_regs.h"
>  
>  #include "xe_assert.h"
> +#include "xe_configfs.h"
>  #include "xe_device.h"
>  #include "xe_mmio.h"
>  #include "xe_sriov.h"
> @@ -55,11 +56,25 @@ static bool test_is_vf(struct xe_device *xe)
>   * SR-IOV PF mode detection is based on PCI @dev_is_pf() function.
>   * SR-IOV VF mode detection is based on dedicated MMIO register read.
>   */
> -void xe_sriov_probe_early(struct xe_device *xe)
> +int xe_sriov_probe_early(struct xe_device *xe)

the goal of this function was to only probe the SRIOV mode, not to decide
if we need to abort the driver load, as there are many reasons to do so

>  {
>  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>  	enum xe_sriov_mode mode = XE_SRIOV_MODE_NONE;
>  	bool has_sriov = xe->info.has_sriov;
> +	bool has_primary_gt = xe_configfs_get_gt_types_allowed(to_pci_dev(xe->drm.dev)) &
> +		BIT_ULL(XE_GT_TYPE_MAIN);

little ugly, what about adding some helper:

	xe_supports_primary_gt(xe)

> +
> +	/*
> +	 * SR-IOV operation relies on the primary GT's GuC.  Fail VF device
> +	 * probe if the primary GT is disabled, and force PF probe back to
> +	 * native (non-SRIOV) mode.
> +	 */
> +	if (test_is_vf(xe) && !has_primary_gt) {
> +		drm_err(&xe->drm, "Cannot probe device in SR-IOV VF without primary GT enabled.\n");
> +		return -ENODEV;
> +	} else if (!has_primary_gt) {
> +		has_sriov = false;
> +	}

maybe cleaner solution would be to just to reset info.has_sriov
in the xe_info_init_early so there will be no PF, and thus no VFs
could be even created?

and if someone will still try to run PF with primary GT and then
disable primary GT on the already enabled VF, we can either let
the driver continue running as native and then just die, or ..

add this unconditional check for test_vf regardless of .has_sriov
(as one could try to load older VF Xe driver without .has_sriov
enabled yet on the newer PF that has this flag enabled) and then
just correctly handle lack of primary GT in GMDID case, so we will
abort from xe_info_init like the native would do

>  
>  	if (has_sriov) {
>  		if (test_is_vf(xe))
> @@ -85,6 +100,8 @@ void xe_sriov_probe_early(struct xe_device *xe)
>  	if (IS_SRIOV(xe))
>  		drm_info(&xe->drm, "Running in %s mode\n",
>  			 xe_sriov_mode_to_string(xe_device_sriov_mode(xe)));
> +
> +	return 0;
>  }
>  
>  static void fini_sriov(struct drm_device *drm, void *arg)
> diff --git a/drivers/gpu/drm/xe/xe_sriov.h b/drivers/gpu/drm/xe/xe_sriov.h
> index 6db45df55615..9c283c028377 100644
> --- a/drivers/gpu/drm/xe/xe_sriov.h
> +++ b/drivers/gpu/drm/xe/xe_sriov.h
> @@ -15,7 +15,7 @@ struct drm_printer;
>  const char *xe_sriov_mode_to_string(enum xe_sriov_mode mode);
>  const char *xe_sriov_function_name(unsigned int n, char *buf, size_t len);
>  
> -void xe_sriov_probe_early(struct xe_device *xe);
> +int xe_sriov_probe_early(struct xe_device *xe);
>  void xe_sriov_print_info(struct xe_device *xe, struct drm_printer *p);
>  int xe_sriov_init(struct xe_device *xe);
>  int xe_sriov_init_late(struct xe_device *xe);

