Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81B57CCD1BF
	for <intel-xe@archiver.kernel.org>; Fri, 24 Oct 2025 21:49:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DBC910EB42;
	Fri, 24 Oct 2025 21:49:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NwOSAKwA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D2B210EB43
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Oct 2025 21:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761342588; x=1792878588;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ramTdeplhtR5+U95Ojh2eR65ua3QnJnw+aHBd3138i8=;
 b=NwOSAKwA7JxHAVZHlestpgZvMdFgK7Lksvh/hx7OQ4V3HVMHBfeH/IPg
 RDUlJGIm2yPe171tpFCIULGvMl8leLllvfu15zuQIPmqYpY4rA9u3Ab6d
 UrEdo+sLetbi88F+q+uIhhsPfm5kpsjBSDHg4+QTmyxsCXVphXhQXWOb4
 zkt47PKkpc4kQYhMJ2RH7dth8sfiV8zlQNxfPSiZ5Fn6Zajzq4l4yvEYK
 cs2k5XbRwu5gbhmrJsdjgrYREiow6PRie048J0russi1M/3B4ZZLuzEWA
 ic7kxC/yOgF6KmzgFLjIZaYjdO2nCsEzyiSIKFB3DR74E8T4MQFeBjroN Q==;
X-CSE-ConnectionGUID: 9zv6xYLFRFSZPwHwnGw24A==
X-CSE-MsgGUID: hExpqH8NQiicptff3yMm9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63433965"
X-IronPort-AV: E=Sophos;i="6.19,253,1754982000"; d="scan'208";a="63433965"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 14:49:48 -0700
X-CSE-ConnectionGUID: 8Y099an5QLq6L7q/7knkVA==
X-CSE-MsgGUID: kj6qDY95QAeFouuwkHQ7eQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,253,1754982000"; d="scan'208";a="185293838"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 14:49:48 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 24 Oct 2025 14:49:47 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 24 Oct 2025 14:49:47 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.39) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 24 Oct 2025 14:49:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SU3RkCJeeEYr1uYdUCz/MnYuqd7t6kqbwLIlF6wgQEMYBnmMV1SaXLn74vw6Bta+GCnuAf1UsWIzfT3lKZGOjcBg72DcqTcKlZBC7bP0RStzujRQuXqyL8KJkrcLpuHcCslfINoHsdTQE96KX31hWZr8lHL7AOdycuGwuSlRBiX1gD0Tg9VM+nxpIOiJHV1prlkIA715cCMBdC+f8RXvUvAx85wPKNc1DOFZIEUNNhWv4qhZSRxIMd6wLjvyyse/5/s+AsV4cg8+iSFg4s8u4ISbDDnHyTbSdglgn+hj2HqbBBwfKHVi8Dm5ye4cXnJebSmcqNlKrPs8GHA7J0bnTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WSK3N/RbHCpELye0BaQGMOuSsZnvBXf/m3gERT0i6FE=;
 b=E86C4NrOLYBY/z/0D3IsD6oe1mIJwnRUlCxa9ZVLesiGZ3ac/rboWH+vQjgAUEQO2o52Eyvg1JG1Zb4Au1kMBe7pZWhuX5FlccMaYYJnbpOnS3DWtxqUI+lur3p0hFpRBfWGQMOJdEMKR0DUJ2cl0dCWOnkGxY9LyE1UgIre9ZZYD4jmUFHYihj+6aYh2ulVxztzuiInATFOGZ0mxgBlNM46L4eoFtrUZEnP3iSFW0gw5yCb9HmZV/CJMH+bVHYjcJo84VMFrKc1eAbI7AuCBgQwF4XxYhDgzmsfnERyIRNU+lWmiksBtor9rIIx1EASRLPyXGOhJF26rIUYR6OfMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by CY5PR11MB6365.namprd11.prod.outlook.com (2603:10b6:930:3b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 21:49:41 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 21:49:41 +0000
Message-ID: <bf68bb5b-7722-47f1-a67c-756a78658a33@intel.com>
Date: Fri, 24 Oct 2025 23:49:38 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/uc: Change assertion to error on huc
 authentication failure
To: Zhanjun Dong <zhanjun.dong@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <daniele.ceraolospurio@intel.com>, <ashutosh.dixit@intel.com>
References: <20251024191959.2555145-1-zhanjun.dong@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251024191959.2555145-1-zhanjun.dong@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0181.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:8d::16) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|CY5PR11MB6365:EE_
X-MS-Office365-Filtering-Correlation-Id: c6e81447-f699-4f5b-2833-08de13473cc3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YzhoUEsvR0d5cWgwWXY5MG02Y0NESE9jc0M2b0hmOS8yNEJjeVhoa1RPbDVp?=
 =?utf-8?B?WEg0N0VEQkxEbzVoUWNzWWI3SHM2VnNOaFhXdU9BWERrUG5qRXF5NzB3eFlx?=
 =?utf-8?B?Uk5raVB2cjQyZ3QzYVBhYm9iOC9XNXdRcmZSUktzQmJ0MTBEeTJ5M2JkTTlm?=
 =?utf-8?B?REU0VDlVTlF4N3NTdlA3NWlrSTRjWXh2czZISEk5bHVVM05tVTY2elhFSXdH?=
 =?utf-8?B?UXYzZUdxNTg4NTAvNldkb2huUGZZQ2x5djVySUdIVnlpRWJqQndmajFqbFVt?=
 =?utf-8?B?ZmZHYm9DWnlKZ3pRdGpvYmFrbjVCL2pZTkhGYWJDTkVQM1ZJRXNpSVJFYnpM?=
 =?utf-8?B?RjBDbTd3d1U3M1ZDMUlhcTR5MXUrUDR6aHVsU0Q3R25hc2N2cWhrR1B2UnpL?=
 =?utf-8?B?aVVsb2J5dTcvU1VQd2Z2eXhrRjY2dU9hL0lRYzlPLzYvOVN6bmsxN282a2NE?=
 =?utf-8?B?eDFYN29SL1p3WDhLRFhEZVZ5eS9Pa1dhNHlXQk1td0VyaWtqZi9qWFZpQkUw?=
 =?utf-8?B?TDkrRjF2UTJjeWpndzY5anFRWEl2WG0vQVNlQ0lZVDh2WHFBS2lQRzQ4Z3cv?=
 =?utf-8?B?L21LV21vVEpDV2pqVklsYVNXMUJYTzRxM3NsUlZsWWVZREpPNjYyWldndDdw?=
 =?utf-8?B?RWNldjd1YThFM3NvSGp4dy8yT1JWa3RCUm1BZzhyUW10U1JFc0ZWekp2N1FW?=
 =?utf-8?B?bnBHODdJbjF4V0lIZXVJTUZJME5OdmwrMkd6WEZuSmFRSGdqU0ZhSXhreld3?=
 =?utf-8?B?ekJicVdiTFFUaDRXSkIwTDVjRDE0TXhFU1Y2ZDU1N0IrOEtZQ2hod3JRN0pF?=
 =?utf-8?B?bHZIZDJNZVgwTks1b1NLcDM4L045dXRoMysvSUY4ajlFcVp3dlN4b25xUENM?=
 =?utf-8?B?OWVzRFM1bmhkams1eEtTQ0Jvc0R2aEx2V1h2c2dxWXFBTSt2ZHZvd1VRbTAz?=
 =?utf-8?B?d3BuTVJ4Sk81MStKQWlwRmk3UUFmZ05pQ3FiTDlEUDQrU3RVNXZYZjFOK2VQ?=
 =?utf-8?B?aEZXMzd3RGJZMElKVWt2eXg0STRHNTJzM2srZTU3M1ZJTVNwN0VLUERRY2Zr?=
 =?utf-8?B?aXFvc1l0OXRmVXlURHBvajU0L29JVUI4OXFwcndSc2VpUU02MjBsUVg4a2cz?=
 =?utf-8?B?c0RGemdJWWdLRkVPOW5wc0ZaN2lhMzFITUExRjBzMUNVcktreFBScFhsSGpG?=
 =?utf-8?B?bFBFK2Q0Q2sxVk40U09OUGF4VklPNDVsWmV0TWtxbC9USTZCMmRHNXo1M1JX?=
 =?utf-8?B?MHdBc2tscGFTV21hcVNXWWJLTkp1Zk9HWkIwWnZrMlEyMjg0L2ZodTZXdXNC?=
 =?utf-8?B?SzBFR1pOaDVjeUlpQnV2TVJRZ1JtbUhLNTIxcVI0QTVobXRrUHlCTzFDQlor?=
 =?utf-8?B?d2RoTmM4REJ1NWg5TWJWTUw3cXFtUTFDdUZPWUdDdmZKeTNaby8xSXhGWlNZ?=
 =?utf-8?B?SFB4SUQ4ODcvYWZ4ZU5XUFd5VElTNmRXSmdEbGJiYTRoOTNlMW9MeHJCaVdP?=
 =?utf-8?B?STZpSUJQNnh5WWtYTWtzY285OUdSQ2VrV2FwMm5BVFdYUFpqYVd6em5kUVJU?=
 =?utf-8?B?aEs2WkJlU3BwaGRoelo5aVZnV0NlT3B5TnRQWnNZM1g4N3ozcjVtRmJYRDFL?=
 =?utf-8?B?UDhHY1RHV2RBbVJ5dlFmdXExMEJ6S2FBSkpRbW9FZEhURnZISVNuczhYYW9G?=
 =?utf-8?B?dnRwVnZmNnJMQ0hCUVFNa1dhbTdWRmNubW5oM0p4Vzh4YXhkUy9vbVNrT3hx?=
 =?utf-8?B?bTgzdXdRaFE1ODJtcjg4cG9meGRRK0w4Vmo0ajI0bjBXT3g4L09SejRIUFFx?=
 =?utf-8?B?NWJSTnZXN0ROVFdwUXNSaUFaM2xCN0M0cUlSaFVUeFZvNGE3UVJLc1RFc0Za?=
 =?utf-8?B?Tlo2RVhEdUFQd0paeERFeFdXblVUdWFsMmdPK1ZsMVRpN1dlbjRGa3pDamNN?=
 =?utf-8?Q?s/DDA5Xr4n2NFlYfTzTXy+Hbx6xwKCVe?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d0R5aGtSNnFselVGaWdRRWZENjk2OFpQUWJ1RUdQS2JOa2xIWGR1eFduNGda?=
 =?utf-8?B?RDd4d3BtdDBETmJpVUErbkRWMkFOZENGTU1WcENqemlIZFpwekk2ZDVCWGhY?=
 =?utf-8?B?eXFnMVBwQjdXdlZ0RXNNbW9QcTM3MGsySjBoWXJHQXFJVEsrQk95SU9MelVM?=
 =?utf-8?B?MUprcUFNS0Rab0hwTUw0QkVGVVNtV0wydFZORFZPM1ZrbUFoQVMveE01b25n?=
 =?utf-8?B?b00vNnFTZXBFM3c5RC8yUmpsWndrVzBkaFBCQnhSVVcvV1Nhb1NkZ0taOFlH?=
 =?utf-8?B?K3lqN05wZXQ3T0NESVV5U3FHb21BclRyR3h4bytEVHF6bzh5Skx0T1Q3bVJ5?=
 =?utf-8?B?TDBGVkNBZ251Z0ZZRkdDVzQvODFoR1FpVnlwVGhLeDZ5ZmY4ZjFKc2dmVHpr?=
 =?utf-8?B?U1Nnc01mOElPdmlhSCtoVkMvclU1TXV1ZWRFRmdlcERkUmkzUFo3NlRKNCsy?=
 =?utf-8?B?amYyMHlVYS93clcvcjlhdll2WmpxTU1aRSs1eWZ6Yno1ZktPUG15c2FOK01t?=
 =?utf-8?B?RFZhNVRUUi9sRlB3Ukd1TEs4cnNqT0F1dlNvWnVLM0lhK1k5RzM2R2lVS1A4?=
 =?utf-8?B?eWM3a0JBTlIzUXozQXg1cWQ2Mzk1alVsWnpON0NWWWw2MWFjbzNyOGIyK0pL?=
 =?utf-8?B?c3RtT2RHSXRETHNmeVhjdmg1YkpZY1oxUnNaTERwZ0pBbEdoZy9BK3NOOXlj?=
 =?utf-8?B?MVlTTFNPSEhwTk55ODRqUVVVWlpkNExOY1NCTWdQVVB0cjZVc3VPY3cydEdE?=
 =?utf-8?B?MnJMTjlXMnhsc1hKYUc4OUtTS3UyRXZmMHdyVm9wREo3b3ByR2I2QmYycjBJ?=
 =?utf-8?B?U2pOSmNIZmJMay9lbzh6ZWNtdElSVkxkKzFpYjIxb0xOZzRidVB5S3p5bkpy?=
 =?utf-8?B?dXY4bXA5K1lWY29uUGxJK1BjVEtZKzdCMGM3YVNFVnZHWkpBT3ZCbHRQbjc0?=
 =?utf-8?B?Q0NkcG9DRHNGejVrV3lZRmFyYy9xd21NNTIySjhDN2VJUjA3NFRQcEFvbHdx?=
 =?utf-8?B?UGIvakhMQkZqNnJ0eG5iYk8xQUpZMmMyaEtXQlBaeDZLVnRpdjhEaXpKQmwy?=
 =?utf-8?B?dzlxd1B6YXg0UzZQYldOZHcwTnZsM2w5ejg2ZkxlTXNmVFNiRGpPTGtxZEVU?=
 =?utf-8?B?VHBWcTdQRnFBMC9GRFVGek9HSWdZaDV5WEY5QUkvb09ZTk00djYra21yN2FF?=
 =?utf-8?B?dHBhcnp6WmM0V0VCTVVpbjBjR2hmZTA1blRSdm9uZVFYMUJuaTdZZTl4Nlk2?=
 =?utf-8?B?SDNJWEVJMlJDZ01xT094MlYwZUtJQlM5dmhwYVdmRUdHYmpnUzBpd3FiTGND?=
 =?utf-8?B?N0hUb3pnQ1JTOUN4NlBOSy9XbCtISDhGU2RPSFdmOWYrL1AxckdpWnI0cnRK?=
 =?utf-8?B?M3JoQjVTQzA1VUtObkpraTZHUHpYMFNwdnVjZGdsOVpUK1g3djg3VHdhL1Ja?=
 =?utf-8?B?SWJWb0pOSVJtMlM3V3FHbVRVREhuZU9tejhybUVybFMraFZ6ZDByd3ZlWnpT?=
 =?utf-8?B?NFdkQ3VZMlBYaHAzSFBMYVY2Q3YwT3hYRHlNQ1dLRm1xclNqN2lIU3NvRkI2?=
 =?utf-8?B?TFYwcjZjM0hUM2R2Mm53MkMzQ3drdmZOZ05NTTZUVHBmam1aeFoySzRUOURq?=
 =?utf-8?B?VnhkbjdLbDQzNGhGR3AvdjU5NmNKZWNCek9yR2ZkaXhrOXA3eEpRSlU4RVRy?=
 =?utf-8?B?Mmc0eXBpK1U1VE1iNWxwUGQ5MitCRTFtamhMRW5wRFRUNFZ2NDNHQXVFZFRI?=
 =?utf-8?B?NUpldVhIYlBYZXNXKzIyUS9KRnVNS01FTG5LYnFCeTRYWHlCY3pZTk9TWlM2?=
 =?utf-8?B?d3RadGRWMG90VUJGaXVtckZoTUQ1M1dsWFNWdnRrdEErMFVYOVhkWFhFa0F0?=
 =?utf-8?B?NU54QkJHT29mTlNCcm1HbnAvN0dqSVE2WGE0V3ZnbXkzNDZGWUg1b0VjdURK?=
 =?utf-8?B?MHdvbXozRUVsMjVSZXRsNHl0M1pZYk1ZenNyM3ZzZFdndXYyZVhpaWNPQU9m?=
 =?utf-8?B?NkxBNkwvTUtHb0FsbndCQ1ppanlHdHV6QnpmZVYyOXNyV002MHdBQytwVUQx?=
 =?utf-8?B?R29LQkQ5ci9zMURWd2lwRnFVVXRRNzJ3WmNtL3NaUlFXY0Y3Y2FiMTdvd1hr?=
 =?utf-8?B?a2gyTDBaU0xUQmo2bW1Ld3FMT2RMVDFJbEMxSUU2ZENGaWVUQ2NuSXR2UUVu?=
 =?utf-8?B?cUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c6e81447-f699-4f5b-2833-08de13473cc3
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 21:49:41.8132 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oB4pzHUP6aaxrUhDL7PLUWod6nhpGKSWQnm7ealadAXyaLrll4jw5By9lZW6pWd+gzEpDL6puGsLaUNX3MD1zU5HEuqkruPDbwlq2S6rZiA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6365
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



On 10/24/2025 9:19 PM, Zhanjun Dong wrote:
> The fault injection test can cause the xe_huc_auth function to fail.
> This is an intentional failure, so in this scenario we don't want to
> throw an assert and taint the kernel, because that will impact CI
> execution.
> 
> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> ---
> History:
> v2: Update commit comments (Daniele Ceraolo Spurio)
>     Remove warning comment (Dixit, Ashutosh)
> ---
>  drivers/gpu/drm/xe/xe_uc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> index 465bda355443..c94b828cc24f 100644
> --- a/drivers/gpu/drm/xe/xe_uc.c
> +++ b/drivers/gpu/drm/xe/xe_uc.c
> @@ -218,9 +218,9 @@ int xe_uc_load_hw(struct xe_uc *uc)
>  
>  	xe_guc_engine_activity_enable_stats(&uc->guc);
>  
> -	/* We don't fail the driver load if HuC fails to auth, but let's warn */
> +	/* We don't fail the driver load if HuC fails to auth */
>  	ret = xe_huc_auth(&uc->huc, XE_HUC_AUTH_VIA_GUC);
> -	xe_gt_assert(uc_to_gt(uc), !ret);
> +	xe_gt_err(uc_to_gt(uc), "Huc authentication failed:%d\n", ret);

s/Huc/HuC

this will always print an error message, also for success:

	*ERROR* HuC authentication failed:0

and in case of real error it will be redundant since in xe_huc.c we already print similar messages

maybe just say that we acknowledge that HuC error (printed in a friendly way)
and that we decided to move on:

	if (ret)
		xe_gt_notice(gt, "Continuing with no HuC (%pe)\n", ERR_PTR(ret)


>  
>  	/* GSC load is async */
>  	xe_gsc_load_start(&uc->gsc);

