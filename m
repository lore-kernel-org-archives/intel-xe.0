Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC76FC83F17
	for <intel-xe@archiver.kernel.org>; Wed, 23 Jul 2025 13:44:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9070110E176;
	Wed, 23 Jul 2025 13:44:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RzWwTso2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8760210E176
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Jul 2025 13:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753278289; x=1784814289;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=DSHQgiS3ZOqK1p9+MLjm2rQmS3MG1DzZgFidJRGQeh0=;
 b=RzWwTso2jsg1pcYaama0zHgnbtzOp50u1g8hVVwX+XNr25mpuKy5ZcZA
 CUBUOwnG/0BCv2nVT6ACR5e8V1IAc2Hytp4n92L35mJ8f39QQZXIDG1f2
 CDp7K/kD+eYBBQm/ludEyKDcYqLrXhvD5Bdn4CLft+t2EIgPa9u6w624O
 xCQ409jlI+u1J7DleB+MV9hj0OFN2rgJNTcmqURJdfSHbEYuRp4Te2DG3
 uzSzpRCRK9hC55eP5sfoCfCNBEcJ9Jtj18R1AJHN9qQMJEcPcBMA3mwNF
 8HAZ+72cnSPfEOt2oGMVuLcQq1CJWOe+PapdS/fDXftaChXFtRby/8rkL w==;
X-CSE-ConnectionGUID: Fzgsyzj3QNCIiqWHO9ovcQ==
X-CSE-MsgGUID: owFm7k/gQcSpzrxTUK0IkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="73137883"
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; d="scan'208";a="73137883"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 06:44:48 -0700
X-CSE-ConnectionGUID: 6uqx6hDxQqyv6H6m6qL17g==
X-CSE-MsgGUID: 4wjWJA8MQyWTj6x5l6BaSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; d="scan'208";a="190522148"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 06:44:48 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 23 Jul 2025 06:44:47 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 23 Jul 2025 06:44:47 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.71)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 23 Jul 2025 06:44:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EcJ/ZuxioANELVn/EAi51Xwcd3+1ivN0fhQkMN4Y0l11YHOAf+h06GbcpVV79c8UAt+TAVjnjuMW1sW7YGD48RXwPKLRHVTwH0dh5uCWl8iJe5GZBeK5obXiTm4hpQ50zidHIoOqdvgzOC1vTPFORtVmMbhLx8a+m3bJp3p3aNve6xw6vFa+KhpijcmB0rKkGjYNVld4VK7YrWsqd/lHfdoQtx/Lx0fiahhegHXCoK6ZCSW3ZRlzbQf/UfO+wqigNJP6dDwuZX6jmMcnBNRiSrjIRjEnADb2taLi1NatgsNDD4PHHqCVNeNe2ta5FON5uFbuD+2tMXPOnko2PguqoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3AppTNrBx0tAQfHxfXrMMi1ofq+2H51E2q9tz0goQLY=;
 b=DrXD6eQBXhFH5IiJUJnGQd7eAdfPbUIytsFHZJcHG2Q7wVA6pZHP/+zfGRJ5f9RlburxJYGzAxSsWPh+KJpe0cT1tlWz4Nc0JE6KoWGDPmBJXb/dyPXLxH+t7kG+dD9FiIukaJgSPbgk8CE4VrUvB3mFjuj7friTdMKeuTIRmrVjwMFNB3iot9YfQgD9W1/JsaAEmS5FSL0TyqvnMxZwwafZFG8y5Azqd9otPObJU/3Vts5d0aqolXw5xRrg1lnd3X+UEIQMQeJ+lNyCHcumSQ9iomjOW7HT4zo+gpTpyUiGfyCxd1LMKD6kc/eKdfFs4Vl/5qfJ6kL6iBMEMmX+qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DS4PPF11E6CAE14.namprd11.prod.outlook.com (2603:10b6:f:fc02::c)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Wed, 23 Jul
 2025 13:44:00 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.8943.029; Wed, 23 Jul 2025
 13:44:00 +0000
Message-ID: <3ad9a61b-893a-4ebe-bdd4-ab94fa6728ac@intel.com>
Date: Wed, 23 Jul 2025 15:43:54 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/xe: Improve VF provision stability with fault
 injection
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>, Matthew Auld
 <matthew.auld@intel.com>, Summers Stuart <stuart.summers@intel.com>
References: <20250723131008.26916-1-satyanarayana.k.v.p@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250723131008.26916-1-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P194CA0029.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:803:3c::18) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DS4PPF11E6CAE14:EE_
X-MS-Office365-Filtering-Correlation-Id: bba9cd08-77b8-4cc7-a11b-08ddc9eefaa9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?emw4ZE5IMDRhUG5sZFRycXJ0OEpabE5QaXFXeXlXUDI4elhwb1VCWk9uS0dM?=
 =?utf-8?B?MStHQ3FCNXBYR0Vadmw1QkozK3JkUHpnQ0lqbTRuUmhlNWFLZUNueGtFQ0Nx?=
 =?utf-8?B?MjNtdStwbmtwTGx5RTU5K1Qzd1FzN1NKZEdKVS9OamIyc0ljRGo2NzZpSDVQ?=
 =?utf-8?B?bkpkNVY5YnFWc2FHdjZUQjB4dlRrU1JvZGJ5T29GQ3FhYlVQUFJ4USttV1hN?=
 =?utf-8?B?bFc1MXNKaXdUT0xSNCtzcUZySVNzOUpyejVLTkNIcllZVEdEaU9PbEdMMS9k?=
 =?utf-8?B?WkFPeUNqNEhwNUMyeiswQi82MVBzK25FVHJkWmN2UTRVZkduRmlsQkYxNjJj?=
 =?utf-8?B?bmFQUklDeEN1TEsxUGhaYzdVeThSY05BUVk0QlF5dGJLb29aWVdpRHZTYjZW?=
 =?utf-8?B?QnMxYUxvR1V5cHkweURVQTlyc3N4Nmtya2t2WWs4N0VXUk9jRVlyVWwvbjlL?=
 =?utf-8?B?K1lCT0RRL3lhYk1oQWV4eDJmN2pnT09sSTJuVG5va1poTWxaSkgxYURnQ3Vw?=
 =?utf-8?B?cy9SVjRwWWw2QUhhakVHQnF1V2I0QjYrbHpicDVSMVJNMmN2WHdYRmZuRXVs?=
 =?utf-8?B?aE15NlVRbWxROXdFYSt3d3Vyd2k2ZW1tb2xWVnpYNUVCYnNDUDRlNE9RbFdi?=
 =?utf-8?B?NkYvdVdINkJZTG5TOGNIMlQ2TUtMTXVZeFZsR1VxNVBDTFV5ODRRN1pEZ1hM?=
 =?utf-8?B?clZxWGR4ZFd3dDNjZGdNUWlEdHFkQWE4NGk1aDlxcUdYdjJpbjBnRWFDYVFy?=
 =?utf-8?B?dlkwNFBpa3haMXNBZFhQYyt1ZEFjUEliT3Rad0llM0dFRXBsdnE1YVQyclVh?=
 =?utf-8?B?SFhjOHBoYnpYbjA1WkJWbU96dW9yLzl2bDcva2dCSjRyTFZZajA4UTU5eldy?=
 =?utf-8?B?WkQ3UGN4TUhFUHpOTm9tMEx6bGZjRE0xT3AvbEtlZm9ZTnNRM2oweWdjQ3Ri?=
 =?utf-8?B?c1VJVk1mNW9rdk1OWmJ2cW5qc2FVLzZSbnd2OGkwY0FHcnlhMGZqVjV2azl4?=
 =?utf-8?B?NUNyU2YvRE5aclpIclFvL0t4VmUybUtYMVJiVlV5M1dKQUZZUnl4cjEvWE9v?=
 =?utf-8?B?WUt1eVViZFhsbHlhcGEwRlg2TUxRcGhOOEF5TEZWS3RRNHR4Tms5eWNRU3Ur?=
 =?utf-8?B?UzRabDRjcmFUb0JKZjJaRmNmOHcybVloRElYbUJjMi9nZ2xBN3J4MGRMdlpk?=
 =?utf-8?B?RlpuYWtieWpzL2w2alhtS2ZuNHBNaFhmTUEwVGFpQm80NVVrK0NEZXowSE1Y?=
 =?utf-8?B?MXhxdXkwWjN3UWJ2b0tYcG53eDBuOVZ3NytOK2FRMGVlWUV6LzU1Ryszdlpt?=
 =?utf-8?B?OTV4blRzdTBjSkVMeHozVDB0NUgxNUh2V3JUdWd0UDN1UVZ0a1hMVWFmRXc1?=
 =?utf-8?B?a3BsTkplQmc5aVZHZ1lWYTMyNE41cERwM2FpellxQmRRdWFNOElDcFlWL1VK?=
 =?utf-8?B?aXlrTVc5d0dmdlhtdXVGQjUyd0VLQytBWFRPVDh2RnplYnpGRlJjWkt1QUlF?=
 =?utf-8?B?YXpueThiNVQyNkE5eTNkeEVHZEJDMDA1S29FcXZCaXAzaGhtRWpaaUlDeFNx?=
 =?utf-8?B?aWhxT2NDNmlLZ3ozK3BMcHkwWU9FYTFDKzZVb2JVWHFGVWRoMnZtQjhLcU9u?=
 =?utf-8?B?b21UQXVLdjdpMy94ZW52d3dBcnNyVnRORSthRitOdVBuZUNBNEZnMzRkbFJH?=
 =?utf-8?B?MzhReU00dGI5ZFVKYTVlbTdNVmNhaDVQMFdmZXBSVlVVR1ZOUXB6QTZ1bmN2?=
 =?utf-8?B?ODhrTXNLRVVlYkc1V3A0Vkx0TE9zcGdHR3k1Y3UwVXIyLzNXY3B3eWI3OTNQ?=
 =?utf-8?B?MVI2c3VwTkhqa2QycHlEMVpqZG5lRlU5dFczRDUvdnp5OElRK1dXNzE2QnJo?=
 =?utf-8?B?SitFSTArSFpvUS82NVhhUHVGYkRJeCtyVDByeCtpODRZMEx3elNJNTZSbzRi?=
 =?utf-8?Q?DLNx9F9ZnLk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WDJuZHIvSUh2ZC9Bd1RSMHZZM1lEQXFrOVlzYjNjb2ZWSURyMTNDT0UrSzVS?=
 =?utf-8?B?cE94NnFjZThVazRtNzkrcitaN2l6UXFNUkpBMit1b05iTjRtaWRpMk03d1E0?=
 =?utf-8?B?dU1qS0VXQXpFM3VrMDc4NGNGOVNtcG9FOWFHc3dJZnZOTGVUaDIycGxJcjR1?=
 =?utf-8?B?SjQ0Y0RmeTE3NWhKZVNxOUtPVjJ6eitNd3VyVTFPaEJ3bVcyaThaWm5UcHhL?=
 =?utf-8?B?RmwvTnFDYnhEdjRDL2Foc2cxSWRiT2hqUlVqMzE0VXhlTGRMOGZTcmFXc1c4?=
 =?utf-8?B?TnpxRDJiZFkwOE9vNkw3VC9jOWpMTyswakdYa21nVGpadmFtNGhoZlkrWjBP?=
 =?utf-8?B?VGU3TUQvaXNMTEZXN3RlRXIyUUFmblFPaXRrYWgyQ1g1MnBlSDhpMDVZek5M?=
 =?utf-8?B?cnljWVFGVmtsaSsxdDRianVNV3JZSnY3aU9RRmNPNE1ybndqU0FFeXZvL1g4?=
 =?utf-8?B?VGlUWXlLVGJteGhHYmlpd2twd055Yy9mQXlRMC9TdFNLMnRXQVVGZmdyRkhW?=
 =?utf-8?B?R0FRb253Z0FwR0RORXZSNTFwbDhuT2tBTW9yMmdiWE9iV1VmOE9PK2FobjdE?=
 =?utf-8?B?NmE3cThpa3ZmVXFoSWtjTVVQeXVBeGNSVlcyanBsTy9WRDhpNk1uSzZ0VHZP?=
 =?utf-8?B?aUZESVBSMGVHajBsRU5HMXFmbUxIaG5DQTQyQVplNm56NHNEZjBGdXN3RXA5?=
 =?utf-8?B?RCtJUTVISmEvdnE2RC9ac2xHUy9vUkkyVlVRRWN6SlNsd2VqK2c1cEE0Z2VT?=
 =?utf-8?B?b01TSCtzclMxK2ZoQkFNLytIUXhTWVlmMmFYeElIbWRWSmNkenhpQy9EeXZ1?=
 =?utf-8?B?RVVpMlRjOFNhWk83S0V1a1kxc0Zzd2N4Uk1aUFhHTVA3Y1E1eEhxNjVWaUwz?=
 =?utf-8?B?SEtZcFJBK3N3YnZPUlhsM1FFNnNkb2FmNHVUQ2hHdVdvU3BoSWx3UEFXL2NK?=
 =?utf-8?B?ZUllbUd2QitVZGtWekc3NVB3aWtOYUp3blUzeUVhd0dSejVEVFZPZS9xWElj?=
 =?utf-8?B?eVkyYXF5VHN6VWp6SnY2MG91QkxMQnMxbzF5dDJqT0dIMjg2bnBScHRvOXJs?=
 =?utf-8?B?UzJ3cTN5Yk9iZlk2OTBvSFc3QWp0UHlHM2tKMVV1b3p1SzJIakFnY1d5QkJW?=
 =?utf-8?B?UmJVYk1GUDRKclZaVndLTnFhWHBZbytMVGc3N2pyeW5mSk00LzVKbitHQUc3?=
 =?utf-8?B?ZTVNWVludjh3bHRNSjJSZjhFdTBFclAvakZzb0l1emdlQnY5Zko5ZldkZlhs?=
 =?utf-8?B?dkd6MzFDbUVKcGNRTmZ0cVJVWVB6bElyUVRuTWN2VVQrUDZUQ0JwOUpRY0pS?=
 =?utf-8?B?emFrNGo0RDVLZUh3VDA0T3RMYkp6YnJqalRVYlBuNTdmdFFQOTJMSm9DYmdl?=
 =?utf-8?B?a0tyV3hLTUdqOUZ3VWRJZVdRMU84RkNVUyt5UmlSMjFQOWRlRU5UVUYrN1ds?=
 =?utf-8?B?UnhPaVRXM0lqNWhZYTUzay8wTWlobzA3dVpqZmxTMzZaZUpWOHdMOG5rYkNw?=
 =?utf-8?B?bSsxNlhyYmw1YWlQNDA4bksya1Q0NzA0ZDl6NlZmeVQxQW0yb2pzbjFZUXF3?=
 =?utf-8?B?UUVBeGd2K1Rwd2JGVnZHNmhwV3ZGN3V1SUZ6NWMzN3N6VEhjLzNiUG9iN1Vt?=
 =?utf-8?B?aFNKb0dMdE9HdGFuT2hYQlBQM1ZDMEZCSmlTSGs4ZkNFaGw3YjYrMGl5VnZh?=
 =?utf-8?B?RTVpc3BTSHk1T1lTTmkzeERzQmlzN1RjUUwwcGFSMHpOWklMdzdaRm9xTnNa?=
 =?utf-8?B?S3V6WUl1eDJmUnlYZmFYQTFkRDJTVDBHUXRMNS9hOEhEQit1OVkxaTF5OWEv?=
 =?utf-8?B?SjE1a0o1VFJzVWQ2SFAxWFlDUzFKQjBpTnNZY0VqWGs5SjN0TzhmRFlKUzFr?=
 =?utf-8?B?OEZtZGx4K2Nrd2xRZXRhT2dVd2dId1JZNFlHQWNGZXBkRkF0TTI0STdYbWpx?=
 =?utf-8?B?TmNacDl4NFA4RjdvbnNyWGFTZ2JvNDc2UTlVcmxuUUJnWGEyby9MUmh2ME80?=
 =?utf-8?B?Qml3VlB5VGRSNjFUZDRTSE5CaDAwak4vbGh1S0c2ZnFZZVVzSUMzYWJYQzVv?=
 =?utf-8?B?cTNVc3o0Q1hJVERpMUhiRm5PSnplNHBxMnJDN3hqbjhQKzlteGFKUm5nc3NU?=
 =?utf-8?B?ZHBmKzJsT1NTRVRNRUZoTXBLZmhmSHdhVlZNRFhYSUl0NldzeWFZaWdIaXQy?=
 =?utf-8?B?akE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bba9cd08-77b8-4cc7-a11b-08ddc9eefaa9
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2025 13:44:00.3720 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j/u27uwLe//pKBJSs5lf66/oQ0dCwlNF6cFNMny3GxifaWnxvJmcp1RsS6ODSkSFsKsfa5YRZa7gG0Tb5XjxWcP7nOKZxQIC0zOdegWVfbA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF11E6CAE14
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



On 7/23/2025 3:10 PM, Satyanarayana K V P wrote:
> In unlikely event, due to PF malfunction or misconfiguration, VF may
> receive incomplete or invalid configuration and it must be prepared
> to handle such cases without causing a crash.
> 
> When simulating errors with the kernel's fault injection framework, crashes
> were observed during device unbind. These crashes were primarily due to the
> use of the XE_BO_FLAG_GGTT_INVALIDATE flag when creating buffer objects.
> 
> The GGTT is invalidated using CTB, which is allocated with the
> XE_BO_FLAG_GGTT_INVALIDATE flag. However, the buffer object for CTB is
> freed before GGTT invalidation completes, leading to crashes.
> 
> Similarly, for buffer objects allocated in memirq_alloc_pages() and
> __xe_sa_bo_manager_init(), the CTB is already freed by the time GGTT
> invalidation occurs, resulting in system crashes.
> 
> To prevent these issues, while invalidating GGTT, an additional check for
> validity of GGTT is added which avoids sending CTB to GUC.
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Summers Stuart <stuart.summers@intel.com>
> 
> ---
> V2 -> V3:
> - Moved GGTT validity check to xe_ggtt_invalidate(). (Michal Wajdeczko)
> 
> V1 -> V2:
> - An additional check for validity of GGTT is added in
> xe_gt_tlb_invalidation_ggtt() instead of removing XE_BO_FLAG_GGTT_INVALIDATE
> from memirq_alloc_pages(), __xe_sa_bo_manager_init() and xe_guc_ct_init().
> (Summers Stuart)
> ---
>  drivers/gpu/drm/xe/xe_ggtt.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 29d4d3f51da1..b3005a462186 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -447,6 +447,16 @@ static void xe_ggtt_invalidate(struct xe_ggtt *ggtt)
>  {
>  	struct xe_device *xe = tile_to_xe(ggtt->tile);
>  
> +	/*
> +	 * To avoid crashes during BO unbind operations, always verify the
> +	 * validity of the GGTT before attempting invalidation. This check is
> +	 * particularly crucial when handling BOs created with the
> +	 * XE_BO_FLAG_GGTT_INVALIDATE flag, as improper invalidation of an
> +	 * invalid GGTT can cause crash.
> +	 */

hmm, I guess this should be shortened as full explanation is in the commit
message, and here one may just wonder why we care about the 'scratch', so:

	/*
	 * we can skip invalidation if we didn't setup scratch page yet
	 * on probe or scratch was already released on unbind
	 */

> +	if (!ggtt->scratch)
> +		return;
> +

but OTOH maybe the original problem is that driver claims that CTB is
still functional, even if the underlying CTB managed BO is (or was)
already released?

then check in xe_gt_tlb_invalidation_ggtt() will work as expected, no?

>  	/*
>  	 * XXX: Barrier for GGTT pages. Unsure exactly why this required but
>  	 * without this LNL is having issues with the GuC reading scratch page

