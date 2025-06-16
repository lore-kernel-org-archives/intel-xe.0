Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93314C71135
	for <intel-xe@archiver.kernel.org>; Mon, 16 Jun 2025 07:15:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 575CD10E031;
	Mon, 16 Jun 2025 07:15:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i52pBDg6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB10210E031
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Jun 2025 07:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750058118; x=1781594118;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=CGVBusiBWMtuz45OqoFDaH4Fv/3SwV8jO5PFNIcVtCY=;
 b=i52pBDg6zeZQU+c+7rChw+8vh2/UPcq9AkoARfvIPHYZ4XxE4Z4+uqS6
 iz7SaszGcBHZmOZzQuDLY8qYHtIuot2Bo+WR76QlVEO1wt3aO4Y/Gs5X5
 0gMndvLpsC3IJy0pZr5kOPi7XW0li95kWgcbbQNqTsukeQC2IxbpwkDYI
 +vJZUlr4sb+0+ofLwd52lRgQtZfpyeZCax287dkDCUziHhkvw/oA9rOTr
 tGNDtJ0TKtjOFsC+daxGCLgHg92g3b/7ku77AKQO1wdoayWBf5u6Ixigl
 RglGuyXG6qoRtopTJlrIgnQuaEX/CoFLbgwp9OiLiQbx66wjbc78UUjn2 g==;
X-CSE-ConnectionGUID: DT9YJD7pQ3O9th75k/+VdA==
X-CSE-MsgGUID: IcqBtYm0SrebCLbW5NxiFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="55866976"
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; d="scan'208";a="55866976"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 00:15:16 -0700
X-CSE-ConnectionGUID: Ap7j/EBMSyCKiCdO0z8HNw==
X-CSE-MsgGUID: OTtGITi9TuWwPtcafj/0Gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; d="scan'208";a="148291630"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 00:15:15 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 16 Jun 2025 00:15:14 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 16 Jun 2025 00:15:14 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.81) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 16 Jun 2025 00:15:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oOYpdjPaml47ovroEwJbOGDYFCu3xWoaD/9rMtVBAjBpHBQ0aCqbWqs3NYgvT1ddTjnFthYXIx+Vggv1sleY1SGMPZLggz1k9yh5ikEV3rTv+LpbpJAOjVIbko0eODQiBJToYG41usTygE+Ediz8JvNELcF6dJTSaM3jjAVVaPSxRHFaHXXv8YT3ugpFpdfnphOXxx9ODV+WSIJMHVKh3KzeThhABCT2foourbnzUlRyg1y6lbcuXSqdBDrboc/o9q1+0bx5FwVdfvx0aO8xquKJyE9ZP1T3XMn3jfFU3ygpJ1FhOEohiMyZzkDtQ21mRAfBk6rZ2E+lWzbvVewEYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dDxy4/SMNv0hAE7dl8Ofl21NBPmFW0CYPYSHQzsiy0o=;
 b=TvFVt6rRsdyJmN8Zi0bkeKfyLs6MgGpU/F9cTUztCIoVSes5Y+Y3ASmXXVjxf3CkTn2wdvwbhtXZxNwCkcbUM6EpHtYy+jk+pMPudjZ63wdFwc941SnFx6IUNagQEwplCZfsA6opObtBuhTUv/lGOSP9riTFWvSDY/jYT9uKN3m9Aw9l56qsOdMRJRVlsk6Db5OgNB9c/qy5EfyDID3cr6tYGf6Ah9dhyZrHs61qpMqQTB/HY2D4+Tgd/amuNgBL5d3QrgtUzYWm2R4kQQq3EBxuyh3WOYNLKarwxT0sYkV2bWqcjf7ubnoDGxsn/KJGCOusd7pwUAR1C7mSbHA81A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by CO1PR11MB4913.namprd11.prod.outlook.com
 (2603:10b6:303:9f::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Mon, 16 Jun
 2025 07:14:45 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::2ae2:110b:2487:40ed]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::2ae2:110b:2487:40ed%6]) with mapi id 15.20.8835.018; Mon, 16 Jun 2025
 07:14:44 +0000
Message-ID: <6c3ce96c-7817-482d-835d-3925b9b52111@intel.com>
Date: Mon, 16 Jun 2025 12:44:38 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] drm/xe: Opportunistically skip TLB invalidaion on
 unbind
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <thomas.hellstrom@linux.intel.com>
References: <20250616063024.2059829-1-matthew.brost@intel.com>
 <20250616063024.2059829-3-matthew.brost@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20250616063024.2059829-3-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0156.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::26) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|CO1PR11MB4913:EE_
X-MS-Office365-Filtering-Correlation-Id: 86c3eff6-e245-43d6-cf88-08ddaca57849
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WDZydnNDV2RaeXlkNVJ1UUF5cnVvcEtsT0dRSlJYekx2N0doclU1cHVLbjNZ?=
 =?utf-8?B?cXVqOHpORFdZbWVUUUNFSGUydWY1V3NuamJrZ1BYVW1NemVwSzhSKzIvQURE?=
 =?utf-8?B?NHFYQjYzekJZVVZzdnFaL0xMY0dqZDVuTTdLMEEzOUxmR3hSdlFHQ3ZEeVc5?=
 =?utf-8?B?WDBsOHVValo3dEFSclJ0ZzZ5VWFPWENFYjdBQm9ReEN2Vy90OEZQU2tIMURD?=
 =?utf-8?B?SnRIc0xJWHJ1bC9yNnpRSVFmSFVPbkpjc1dVTng4aFRiVksrbHhsaTBzMUhP?=
 =?utf-8?B?ZFlFcEg1RkJtT0JWQ0lKTWQvWHdtcHNKNDBZY01xVUVVbkhWeHdZM1gyeWww?=
 =?utf-8?B?bFpkcVlqd1JwNWZRYVdndjhWR3c1MktySkJnTlhjYTRiQmF6NUZhRDFSK3Na?=
 =?utf-8?B?YWxwZnFpQ0FDRE1NRjM4ZVpMeTdQODhUVWluQUpLQ2ppbmZlTWFxSVZFTEVj?=
 =?utf-8?B?QzFCOTF5OVZrYksyWDNRKzJOTGdtcWtaNFVkbE0vaVE5Y1J1NFhyR0Z6cjcw?=
 =?utf-8?B?ZzZqVmUyTWcyZjlLc1J5SWsxMnhoUkREdTArc3c4YjEvT3FMS3FqOGtMeGh4?=
 =?utf-8?B?NVN5Mk1wc2gyVDhBMHc0QS9OWTRxRXU1aFVmam9kUXBFSkVaQmhQMExWK3FZ?=
 =?utf-8?B?bHBtSVVJL2FsQ214T2tlN1ZRQ0FQdXM4OFp3cG52MmpGdW1WRDRWeDdsQzhP?=
 =?utf-8?B?THdMQVBnbGFrT3lTN250eUk1c3l1WkxtL1BMdE9ZRDE2b3Vqcm5oK0FxNVBt?=
 =?utf-8?B?RG1VYzh4Vnp5SXBsMklkclg2aDZaYmI3VDZCMTdsVnRiZDJrejA3a3U2T1ZL?=
 =?utf-8?B?Q0tPSHA0UnRmVEMzTGxSb01VbVZPMW9MTy9QMUhXK0plZmJCdnFsSnNGSGdG?=
 =?utf-8?B?R21uTWJhZlU0QmdVRUN5ZFh3Q1RkZUVzMzlUbmpQaGE2OFlScGF5M2VKSXcz?=
 =?utf-8?B?b05iR2d6YzVWZ1VjejRINmx6MGZha21pcWkyb2pqclpoZUw1NXhFV2dSN1Zy?=
 =?utf-8?B?WS9QMzZmd1hjZGJYb3VQRE9mbmFHSTBKRUJaQWIrRXQwb254UXIwcm9naURl?=
 =?utf-8?B?K3RlSXJpSjQvMFA4U0FIeHF3aG9KV3hZT2xpUE5rMjd0MktjalRqYTZ4N1Y2?=
 =?utf-8?B?c1RlUlE2V0RibU1HN0hDRCtBT003ZG1QSXdyUzNUTVdzNy94ZUxTQVdWWmdF?=
 =?utf-8?B?QzVPQW4wMFc1alIwbUc4QTdMSHlBZG5HOTBNb081VnI5SytCWlNXdjFvUWNF?=
 =?utf-8?B?UGJVdXFFc1lLTFQ2Tjl4UXZRZnZ3allKMm40Z0dra3pFTGx3T1BaWjlzeVJE?=
 =?utf-8?B?WUdzdWNQYmpzbkZFdjhWS2F0U3dkWnRBbE9CQVI2VmY1dTBSU08zdnVydnlJ?=
 =?utf-8?B?NHBiV3ZUMkZwaU9rUTZJM1lGTndCR1NXSkpPOEt5QjR2c3FGbXlPSTlEdDl1?=
 =?utf-8?B?MFVVeWZtMVJtSmxLVG44c0t5NGloOFRUdWJ5OWVOd0Z0a3RWaldzbWRydVEx?=
 =?utf-8?B?Ry9ZQVdEdHhra2k5bmVWcVlFa096QXhVWTR1YlEwY1NMbEV4clF4OGdmY2Nn?=
 =?utf-8?B?ekxoeEFJUEc4MDlES25tQmZOVmJER1RGeG53NDJQWCtSSTN2WkRVUFEzb0xX?=
 =?utf-8?B?Zm5meVlaOGFpbDJVQlVzazBxcDBtWkhKWEhVY0txblRYUzFSNXRzTjRNajhV?=
 =?utf-8?B?aEwxWkEvUzJjRFhmczlYSys4V3B2QndOQ2xmSisvcEhRMTNIQjdaWUxJNHpF?=
 =?utf-8?B?azl3b3RqYUhmZTBvQlhmdDFRaW9ldVBjbjczZFMzSkpBazJmd216WnNGOFdB?=
 =?utf-8?B?ampoUm9aUm5QOVpJTEhIMlZEZTdPTkU4QVlSSC82bk1tTlhJaWxkOTFtYkhH?=
 =?utf-8?B?Y0dhTUJhU3ZvSU9SSVVqVWZtMWpFMU0vdkwwTmRaUnNHSjRoS3kxbDhvcDQ4?=
 =?utf-8?Q?pAY4Xco0kLo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y0JnRWthVmcyU1NLMlN2Y2dNOFRRUTRxSFZlUnM0SHFQaG9Xd0JZUDlPVDlH?=
 =?utf-8?B?MFVWNE1peDlQWWx1OGNvd3E4ejF1cUJzWEFFWmw5R3RRZ25RYzUxaFAvdnBH?=
 =?utf-8?B?TWVuYkhmS0xEMVRNc0taRjJUeWQ0KzVXcGRMclRPQlNnZ1F6VmRqTGVpWjBY?=
 =?utf-8?B?ODM3cEw3TTNMaGwyWi9weWxQelpPeXdWamQwMGh3eVhta0ZlV3NNRnN2Y3Br?=
 =?utf-8?B?T2JRWVdKQ2UxWDdWSURQVDYvcm1UNUxWR0M2Q2Z0Y0pSam1RRlJKS1FTeExE?=
 =?utf-8?B?MlZpeUJ1b21tenNqOWZpeVF6T3R1ZVFSemlHZ3hYTHFDMUQ4THNzQ2ZNTTdB?=
 =?utf-8?B?S2RiZkQwVWNNenlMV2FZbXB2VUpPN2tVK0p6TldwSFluL2prUU9RYm9kbzVu?=
 =?utf-8?B?Um1HN04xS2MrMWl1N0E5K3hTVkw4bm93K2d0ZTRyZkxzbkVic1JkYU1KQ280?=
 =?utf-8?B?RDBZZ0ZhSjd5YUxVNXBkU2dPbngwU3I2T2pvQkJsRmVkZ0h3U2NqRzgyV09P?=
 =?utf-8?B?b255amVwRVlaWEdLdW1Da1IzN0ZRNjJMUGJCWkdiMEtSMUg3RnhmdzRrTzVu?=
 =?utf-8?B?citKM29QRktQdEJqdDQwRmdDbzBaZ0pNdStINGd0eFE0OTE4bFRYQmU0NDhp?=
 =?utf-8?B?UWgyRzZTSk1sS1ExUlRRek93ekhPZDU2TkFUZE11TkllM0ZtUVV5ZUR3QWRj?=
 =?utf-8?B?RUlFekZBcllpcGp5blBNVVNmYVgxTTh4ak5XTjk3a2MrTStZUW9OS1ptSU9V?=
 =?utf-8?B?dUMvMGlSbldnRHhXTmdRQTJ6SHNKYk1SYmVIVkpLNEx2cUJESm54dXJtamRE?=
 =?utf-8?B?RUEwbVRoVG5Kd3RyRlllWXdacW1ldlJzcHhlai9jRXJ0dldYQ3pkZEs1VjNZ?=
 =?utf-8?B?U2FqazZvaUxtUDFCZEhEQ0prckJtQndqd1VHZWFVckxMMDVNYVp5NFBKU2p5?=
 =?utf-8?B?UTZmR2tmamRWaDlJOWpGVXFnS3BQMWQ0VjdxU1R0eDBWRnlSNnEzY1VpWDdx?=
 =?utf-8?B?bGdoc0NRbEx0QmR0ekc1VjMzQ0hYWDJNZW5uZjR6Wm9EKzZTMklMNHQ1b3Ix?=
 =?utf-8?B?VWFWUVFIYnRSMVNaN1A3bW94d2tFdmZlOGFkRFJVZURONjVQMEZJbWU4QlRl?=
 =?utf-8?B?elF0c1dXZ3VZRGp3TGdxQ2VrUlZ0ZTJxbXFjbFh6dFczeHlVOFUyOVl1aWxp?=
 =?utf-8?B?c2tWR1VGRnk2Z05UQ1FxV2c5VGZaR2h5WDllMWF6TCtwTnhybUxzTko3RXVR?=
 =?utf-8?B?eUNTRzVnR1p6bHpadDFYdWhCeis3U0R4bnNYUWZjUXNJL1lVZnZnMm8raUp3?=
 =?utf-8?B?ejF3SWFQQ1hvVFNteE5ja0FrZ1dlM3JyZTR0Z2VtVldIL1I0NlFKdzlxWFls?=
 =?utf-8?B?dStlWVIxd2ZISXhIZlRGRUxKVUJ3WXlhL2NGbmdXVnUrbnZlcGJaWGJGN3hu?=
 =?utf-8?B?UzVXSjJpc1pxY2U3OEJvaHZJWUgxMEQzTGtVTVAwTWgxdENYbXljMnIrTnBw?=
 =?utf-8?B?cjJhVmMyL2NjRlAwaU8zVUs1L3pHS3FkeEdEMURIRUVabStyMllGb0pBQlgz?=
 =?utf-8?B?RkdUWHNxNDlGMHAwcXdzeHprdmRhbERsdmJDdnhIMzE0cVJ1S21BckxWemp1?=
 =?utf-8?B?Ui8zTTZ0eHErQlFpZCtVUXdIVHhyWGtwZmpVVGxwZzVyZStYQjdlSjFXTmdO?=
 =?utf-8?B?bmgzcjJxdlpGaWFTN3E1VVBnQmxBYnZ2VXA1T1NraU05QkVQZFZNRVF5UWlp?=
 =?utf-8?B?MExacGFVN2FrUFNVKzE1MFBna0RWazlUNDNsd3ZGWFBXZXVzaFg4a1k5SXRw?=
 =?utf-8?B?N0l5YjhWRW1GMnVwanorV3h1R3JRRFRVTVc1R1h6SVRSejFyeDRyT0ljT2tx?=
 =?utf-8?B?WDliVjFlS0dFMURPRjlhcEdyWUlzMnoxRFRxbVBZcW4rU2xWZEg2SlFLUzB0?=
 =?utf-8?B?Zi81NHBqOFJXZ1YwM2JTSkI0WG0za1FWRHkzK0NQdHVNbU1xcWh3cjAvRTVa?=
 =?utf-8?B?d29JZU9yZmdiNGtLaEI0QWtVTk81S3RZYUdRcEdSMXBiT2JjaGh0b1FCd3k0?=
 =?utf-8?B?YzZzcUtKaFBVWmVYK3BxSU5MQ0c0WlJCRUhvb0xFam1ZdXVrUnUvL0hIZ3Jv?=
 =?utf-8?B?R1NxRUpQRTcyMVFDUzJKSW1ZaUZRbUhKM2M5K1JHWEFxS2lQSDRleE1mSGhV?=
 =?utf-8?Q?9DAeymgHrco3NJMjaZVnctw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 86c3eff6-e245-43d6-cf88-08ddaca57849
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 07:14:44.7633 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oiEUhHZes39u2d+X5xXAypD8qXV50FH6GAEwpdnAiVuLwxQmfA5QOhHlPxEztKxVMd8ynCOoSjJ5cSAh6OopO+35HQKMZbQAbd0lEIIa77k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4913
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



On 16-06-2025 12:00, Matthew Brost wrote:
> If a range or VMA is invalidated and scratch page is disabled, there
> is no reason to issue a TLB invalidation on unbind, skip TLB
> innvalidation is this condition is true. This is an opportunistic check
> as it is done without the notifier lock, thus it possible for the range
> to be invalidated after this check is performed.
> 
> This should improve performance of the SVM garbage collector, for
> example, xe_exec_system_allocator --r many-stride-new-prefetch, went
> ~20s to ~9.5s on a BMG.
> 
> v2:
>   - Use helper for valid check (Thomas)
> v3:
>   - Avoid skipping TLB invalidation if PTEs are removed at a higher
>     level than the range
>   - Never skip TLB invalidations for VMA
>   - Drop Himal's RB
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_pt.c | 31 ++++++++++++++++++++++++++++++-
>   1 file changed, 30 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 9c30111e8786..b6df8995e8c1 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -1995,6 +1995,32 @@ static int unbind_op_prepare(struct xe_tile *tile,
>   	return 0;
>   }
>   
> +static bool
> +xe_pt_op_check_range_skip_invalidation(struct xe_vm_pgtable_update_op *pt_op,
> +				       struct xe_svm_range *range)
> +{
> +	struct xe_vm_pgtable_update *update = pt_op->entries;
> +
> +	XE_WARN_ON(!pt_op->num_entries);
> +
> +	/*
> +	 * We can't skip the invalidation if we are removing PTEs that span more
> +	 * than the range, do some checks to ensure we are removing PTEs that
> +	 * are invalid.
> +	 */
> +
> +	if (pt_op->num_entries > 1)
> +		return false;
> +
> +	if (update->pt->level == 0)
> +		return true;
> +
> +	if (update->pt->level == 1)
> +		return xe_svm_range_size(range) >= SZ_2M;

 >= or == ? Dont think ranges can be greater than 2 MiB.

> +
> +	return false;
> +}
> +
>   static int unbind_range_prepare(struct xe_vm *vm,
>   				struct xe_tile *tile,
>   				struct xe_vm_pgtable_update_ops *pt_update_ops,
> @@ -2023,7 +2049,10 @@ static int unbind_range_prepare(struct xe_vm *vm,
>   					 range->base.itree.last + 1);
>   	++pt_update_ops->current_op;
>   	pt_update_ops->needs_svm_lock = true;
> -	pt_update_ops->needs_invalidation = true;
> +	pt_update_ops->needs_invalidation |= xe_vm_has_scratch(vm) ||
> +		xe_vm_has_valid_gpu_mapping(tile, range->tile_present,
> +					    range->tile_invalidated) ||
> +		!xe_pt_op_check_range_skip_invalidation(pt_op, range);
>   
>   	xe_pt_commit_prepare_unbind(XE_INVALID_VMA, pt_op->entries,
>   				    pt_op->num_entries);


