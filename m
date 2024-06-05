Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5F05C25B76
	for <intel-xe@archiver.kernel.org>; Wed,  5 Jun 2024 10:49:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25BC810E4A2;
	Wed,  5 Jun 2024 10:49:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P9+7DReC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 535FE10E667
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Jun 2024 10:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717584591; x=1749120591;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XG+AsFO0DD5GdUjSLVLYJXo59Niy4IL96etRXgQzcDA=;
 b=P9+7DReC5BtSog7e2/q3UeKNDdTSWKwHywXLS4m6H0xlHyi23SJXVAVw
 3mahhi+b8irdPtZDKgO4f41goartlfpFTT2vC4DIExLPZo4cI9wAqMy/M
 oYltou20FH1StiTJmmxHO0HqNjrKFdbUX0joA4g9KImaVV7TuiuSk0mks
 vwmMpmBJXHQIxIu3BBLA3/2Y34RW7DCeYv9Y/MDLYnk6JGiBUH8jcEUY4
 tEHaA/EM35+aM+D15IUssL4aVOZkkZjRbI678cI3RkFu7Vk4sVr8ROhXE
 cnDIVNNZUdc20FmJzE0b1ESBHZbbMh266DmdYQCgPXhKM7IFgwQB6rZd6 w==;
X-CSE-ConnectionGUID: AaOGsHWxSSygLHWRPnyjwg==
X-CSE-MsgGUID: XMllduzjTm+UH5ASfyj3zQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11093"; a="31724040"
X-IronPort-AV: E=Sophos;i="6.08,216,1712646000"; d="scan'208";a="31724040"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 03:49:50 -0700
X-CSE-ConnectionGUID: Is7DFRbCQp6C7JbsNBrQhw==
X-CSE-MsgGUID: LnucVctWR5SLTJwtmqWdxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,216,1712646000"; d="scan'208";a="68376909"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Jun 2024 03:49:51 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 5 Jun 2024 03:49:50 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 5 Jun 2024 03:49:49 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 5 Jun 2024 03:49:49 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 5 Jun 2024 03:49:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lNsGqfyiL9vbIFBVgR8vjwjxKy5JijrtOxPgjQE2ClM3oet8SHkIA0iArObYJ95yh3bDJPj1WlDntMBiXBiDrAzFkGmQyo9P2DbpRKGLd19mKiffnElZjt4K+cbjwsFQarOf3gwLsYFD1+wk+2c0Re6cRJgF3hSrHIUbby9rGWbksUyi9cnBypBm0lP/q2OWNXoMulH2BekkG1iVZ3btKkI9N4QG9gqDnyqhSUazYITRexzPl0x+lGtUXE4K9G1Siwg2sJSZM4NtEaf3hu19/3APWBIlrQIs+OGUjjCKWE4xaphRBU6Bs9FZH6h3TLwbK/gPkJDYsqEfEcv+Cx+XzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CexdZY87NdxUdWP7fijJTBF8btCvqKk5bghsgPpvRVc=;
 b=EqD0SldHLj6H8dsrsm/qaHSbgGMVofQRj9yM1kpYiTnuIdrHYysJ0hWdaY95p1npBzcl5Ze/6dKBkhEcMuXg9k7PrQc0UzBCCs6atZ1JIkVwlnOybvXJfQddPc2tvNwG1gZTxj9VHqVGonyt4wAzqN2JDLqQpAIgYylmXOv70M2Pqhz9rsPLxpvatzikP3xg8h2s2d9SxFNMXJWCjaSxKbmw6RPw742Il1ocd29lhwilfvftA+bjhnlj9eEBDlCurkibWNO2VuXa2tFIFO/pftOhQThzDAmEEqCXxZoDUAOWvqrMZGSkm+aruzXQKzDC8KlSsNlJCeKyE1vZyuhviw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 SN7PR11MB7091.namprd11.prod.outlook.com (2603:10b6:806:29a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.21; Wed, 5 Jun
 2024 10:49:47 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347%5]) with mapi id 15.20.7633.021; Wed, 5 Jun 2024
 10:49:47 +0000
Message-ID: <2f8c48f3-598c-4bc8-b9ca-da22e380c130@intel.com>
Date: Wed, 5 Jun 2024 12:49:42 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/9] drm/xe/xe_reg_sr: Always call xe_force_wake_put/get
 in pairs
To: Lucas De Marchi <lucas.demarchi@intel.com>, Nirmoy Das
 <nirmoy.das@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20240604110225.29495-1-nirmoy.das@intel.com>
 <20240604110225.29495-4-nirmoy.das@intel.com>
 <e4a9c72c-ea14-4aad-9020-d7e503baa59e@intel.com>
 <63c1b974-491a-4349-bd13-d649d8dc2717@linux.intel.com>
 <ew5v4bxh7ocvaquhp7ghcuwexmkfdkzyp2giuanr3lhaetxntl@xlfupwcaraxd>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <ew5v4bxh7ocvaquhp7ghcuwexmkfdkzyp2giuanr3lhaetxntl@xlfupwcaraxd>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DB8PR09CA0028.eurprd09.prod.outlook.com
 (2603:10a6:10:a0::41) To DS0PR11MB6541.namprd11.prod.outlook.com
 (2603:10b6:8:d3::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6541:EE_|SN7PR11MB7091:EE_
X-MS-Office365-Filtering-Correlation-Id: f5b6fac5-8dae-4c83-90eb-08dc854d3755
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QnRIbnNpc0Z0SXprQ1NwUVRYZU9YWHVDUEhObWFlMkM3L2VNTEhMTGRTdzRK?=
 =?utf-8?B?U1BBWTN1TFhZSUJlK3FKdDZPVUhiYVpQRVp5dEpwZHhQOXc4dndSejZIdVFu?=
 =?utf-8?B?LzUzMEhJLy9IWWVFc2FkOThMdkFtUzA0VCsxU3NzeUVYU3kvTWZqNlhjNkxF?=
 =?utf-8?B?Z0NWRzBDa2xhcG5TZ1lZRTQySG10bStSRnJyN2JteHU1WWFPMVREdnVQOStY?=
 =?utf-8?B?cEhRYWhaYXV4dW9VVWtGQWNVK0JXdXVSOXlwaWdROHo5QkdTNnIrWGU5UW13?=
 =?utf-8?B?bk5wMnE5YmRJRTVWOFVlSmRGcThXbkJRbUs3Rms3SXYwYVo5MlltWkc2VkNI?=
 =?utf-8?B?WVdxWHVhVGxWTWFZVDF0WkVqQ3ozU3RjWk9vZjBKcm92SjJqMEExRWErUGpG?=
 =?utf-8?B?WVdYMHhBSytBQzZSeDRyZGxuMWJGclUxUDF2NGtoZUYvMy9lakxTTHVwYjdC?=
 =?utf-8?B?am9IVU1yaEw1Rlk2dXhjYjBwclZ0TUZuSkxZdVNoNkYwMWxtSVJ4UkFVQmNy?=
 =?utf-8?B?aW1NM3NuSDA4WitsVVB2Rk1ZNExRa1lHVVRaNG1UbUVDeXRZdW9ORUlPY045?=
 =?utf-8?B?bWdsWFl6TnFtY3dkNHdnb0V6Q2FDR2E0WVd4clRKelZBSFZ3Zjh2eWNWajBa?=
 =?utf-8?B?UmI3YzdFT09Pak5XQkZGQXREb01xNjBFOEc3ZmlnOG1qLzZyNnhxaDAwNUJM?=
 =?utf-8?B?cHhLaEZLVDZRcHgrQldXNjBWUFBUSlVVQnpvaU1jVm1EUUkwSGN3bkF2S0dl?=
 =?utf-8?B?OHZ6c3B2Y0h2YkpOVU1RQWYyeHdudTZ2M0IzYTloakFLNmZjTlQycUxrTFdh?=
 =?utf-8?B?ZHJzc2NvZEd5Z1E3VUVSTG5wWWhZQjJwYWRKY3FVMVlDbjA0S2JXSElZOFZI?=
 =?utf-8?B?bS9SL1grWVRWZGJHQjhVV25SOXdOSUxrNXg3eDZHN0FQcjdMMU9ZbWt0WGxW?=
 =?utf-8?B?WW9sMGhVWEEwbzd3NElSNHg5RTNqU1RPcUowV2ZidVBubTZTYUQrMndMNGhZ?=
 =?utf-8?B?clJKRjdISENaMTRNQlR4M1VMLytGTERRUms0ekxBVnl3YzBZNHYwa09YUVpY?=
 =?utf-8?B?YTdXUjVZTGlLL3lDNkJReGdweVhOVWZ6OWc0VXNaaUZSQWhhMXQxdW5DWDdh?=
 =?utf-8?B?c2o2eHZXMjNZUkhlQ0ZZRzhob00vYXJQMEZNdVQ2M2ZzVDhGcXhBdVVPUEF1?=
 =?utf-8?B?eUpwNkJKUUs4dHZ3TXlLM01ZejJCVXBKbFRiYnFhRjNmdnhEVUQ2UVc2VEZP?=
 =?utf-8?B?dzhOczRwQTE4VVZlR1RHNjhqRWtQb3FUWkdoNWgwK3F6dHZ4RVU4eTUxaURK?=
 =?utf-8?B?UjMzZ1JabzRldHRTeFVZYUs0TEtWZ2tRWG5mdDd0d3NBb1NrOVhTZkJQVmdF?=
 =?utf-8?B?TjVQcnl0SEM0Sk9aRjJKbzJ3eDMzTDhJUEdGK1cxKzVTemhsTkNSaWs4UGs0?=
 =?utf-8?B?NThUVkxDbUhRV0JZWDNGdUlnVGhENWpCN3NoTzI1Z3dVYTBXNVRZQnUxemdK?=
 =?utf-8?B?NENxVGVjUWVWeVU2MmR6RHV0dFBOSXBYUkVDWjBjWVRVeDZDYlEzS1BTRi9D?=
 =?utf-8?B?anpFOThEWURYLytBWGt5b3NwbElZZ1NQbS9IMzJKazZEc2t3MHMzajd5VkMy?=
 =?utf-8?B?YUdSSEw5OENGTk9xZmVkVGpuK3h4b2dORnRlUDh1RVBkMGFUZWtUUXBHVmor?=
 =?utf-8?B?dmhNZDYzNEd5TVp1TklMUk5kYjFNaWVuRWtPUENUa0d6cmFGVXZoMm5KRzdj?=
 =?utf-8?Q?ptpyjsiB1bZo0MKjHGaOb9AJbH30lROfZFjdp/R?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6541.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QmxaNnE2UHVrTnlNWEpLZTZReTdTQ1V6bWhtSXZSekFyWmU0a3lIam9CQmlj?=
 =?utf-8?B?YlBOTll2eXU3MnVZZzZPTHhiV044NG13VWEyUGVjMmFGNGJROGFoSW5rTFcv?=
 =?utf-8?B?STNCM1oxSW52UWFwZlVKSmVtbDB4d1JEbjFNMW1hZTdjaHRnemVQUkc3aU0y?=
 =?utf-8?B?UHlic3pwRFVYV3dOZHZlSjk1a2taK2V4b1ErcVZkQ1Y0eXM1Y005WWY1UGg2?=
 =?utf-8?B?VGpnUzNwckxkTzI3UEZUdlRJYlFoWThoVTJZNktqU1gvOWpSdCs1bHZVUGFT?=
 =?utf-8?B?NWNDdW1weDdKL3YzRUJKYk5JV2MwbHFGbXlkNHZKdUg3aEtkWWFFQ1pmTE0v?=
 =?utf-8?B?bzFKdXI3K3JPS1NYZGp6b0FyVURob1kzY2hMUVhZaS8yU1N1bUtiR2hhSVZP?=
 =?utf-8?B?SFJ2d3ZHejhZRDVVNWdQK2QxWEUzeFVGTGQyNFUreDQxV0dwaENXNXlpSTJQ?=
 =?utf-8?B?b2x2SVBheExoL2Z3dVFHZkx1TWJTb1lvaWl0ZHdITjF2Y2VsdmpqVnFwVFEr?=
 =?utf-8?B?UHFjK1Z5a25YYTV3eHhuNmthOWY1aUFMRElpc0s2Uk5zVURCN3MzV0VxTzRY?=
 =?utf-8?B?N21CY0ROWEg2Wkt1aWRiUkNhOW1JNHdyaFFmaWRDczlNaTQ3T3FZTmJ3bkl6?=
 =?utf-8?B?Vjc3dWRMYXVPMDNwK1RPdGhmR3JvajFYTjEzVTJsRytKR01SSHZsSVRSM3NV?=
 =?utf-8?B?ZkFJR1RqclZBbHVWN1lBTHBhOWFFR0JIMXRlOGZDMUdxbmtFczhFcGl1TjRT?=
 =?utf-8?B?NTlpUWFYcFA5VElzWUhqVlhkcTZ3Y28rdmlvSVFQMmUreGt6c2hWMmMzZDND?=
 =?utf-8?B?YURtYWdsU2tPb2ptOXdaeEJvbW5hNDJ5QUU5U2xEKy9ObUowOVNLanZoL2Np?=
 =?utf-8?B?dGN2MlVUMm9rM1p2WTZqNHN0a00vTlp5TzVmSkQ1ZW1xcTVvdmVsRzhyVndk?=
 =?utf-8?B?TUlhUUc4K0FLTzBjWUNDa285K2c0V2tiYm1RUk9lb0tXWjYxWVNnRmJwRVJE?=
 =?utf-8?B?QWpUaEVSUTYrN0RXTnJoRDNEeFVWYk1UNlVCWjV0cGpWeEFnUks1aTRtRXdy?=
 =?utf-8?B?SEhJa04wSHB5RFNtaUM1dnFJcjFnTU1hWkdveXp5N3ZnSUMwSnR5NmJoQTBB?=
 =?utf-8?B?cEJpM1lBaXF5TUY1TE9QOEk2aGZOVm9naFNBcWFHdlROQVE2a1F4dnYwYVFK?=
 =?utf-8?B?M2ZwMTI2Nko0S0JhdFFlZUk4QW9ET1lWTGNWSmwyOUF1akhDcS9TRkJ5cFAr?=
 =?utf-8?B?aGRtUkxtTWtQWnZmeG5qSFA5RnBmWDI2RkZnSDhDM3ozK0hNekFNUjRMYWVS?=
 =?utf-8?B?YWREamE2KzlaL1FzVXhUMVY4dVhQWkIyM29PUzUvanJuY3hSeENwaHYxdXhl?=
 =?utf-8?B?S2RUVFdIMWsrYVpyUGh5T0VuMkZCZ0V5U2prV2l1WU9mTnRMa3JiNGlLQ090?=
 =?utf-8?B?emlmbXA2VHpkMVFJYXUvT2JDUzkxeVFoZnFFWGFPSFJUWm1tc3lkeU1XT3B1?=
 =?utf-8?B?T2taZ3RHdlB5TEV3Y0MyQ0IzUW9FR3FpRDNKQlpRSHRVa2VxTW9JMU5zUHlB?=
 =?utf-8?B?aHM2Wkt1WlFKWkFMM0VqZnh1cVloajF4VGNOa3RNbC80VUVTdWk2Wk1qWm1k?=
 =?utf-8?B?SGZneFdyVmNnVlBJNm0ycU1POUswdkRnZFVibTk2WGFlbVRpYy9tbys0VUpw?=
 =?utf-8?B?cjNkNE9ac3dsQlMwQjNsTkFka3Y5RXE3MnZ2Q1F1VVhPTld6ZmRyaXVtZ2pD?=
 =?utf-8?B?Nm9XSTNPRDFBTEpmNmVwQ2pmZkVUeGxiejV0NHpWN284VWMxRUxjYVhaZGVp?=
 =?utf-8?B?T0d0Nis0WnVNQ0JPTVJnM1ZOZlpvNHYwL0NrTWhYMFdSVDRaSlZ2OHdMTVlG?=
 =?utf-8?B?SUlYZllFVnpjeGczUDhCdkFvcXI5dzUwWjg0YjdJVXI2YmwvWGZYbHZLNllW?=
 =?utf-8?B?dkpLZnNDVkZCYXg3ZGVBTVN4QkYzRmlBNUVWUDJKazViNkVmaVJDaXdzZ0RN?=
 =?utf-8?B?MlRta3BBNERWd0lCWjFVZG5vME04cHhMQUxkM2JzWVdNc0tzVGJzTXRDditR?=
 =?utf-8?B?OVdqK0JOVXVacFA5Qlh1ZlczUEFyNHFSdHQrMmZCUnZKL20rM3VGNDNzSkhW?=
 =?utf-8?Q?07jO8TbLVuO6TqTaCcdHOKg+e?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f5b6fac5-8dae-4c83-90eb-08dc854d3755
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2024 10:49:46.9252 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u+fvgbnNlo/L2JHOolXsgMhxEZWV+MD2OwITPox0teNgXCpmKzge4OWqDoB3aI5x1AwLyrhqiYTqCEKWg1Om+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7091
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


On 6/4/2024 11:13 PM, Lucas De Marchi wrote:
> On Tue, Jun 04, 2024 at 04:21:25PM GMT, Nirmoy Das wrote:
>> Hi Michal,
>>
>> On 6/4/2024 3:12 PM, Michal Wajdeczko wrote:
>>>
>>> On 04.06.2024 13:02, Nirmoy Das wrote:
>>>> xe_force_wake_get() increments the domain ref regardless of success
>>>> or failure so call xe_force_wake_put() even on failure to keep ref
>>>> count accurate.
>>>>
>>>> Signed-off-by: Nirmoy Das<nirmoy.das@intel.com>
>>>> ---
>>>>  drivers/gpu/drm/xe/xe_reg_sr.c | 20 ++++++++------------
>>>>  1 file changed, 8 insertions(+), 12 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c 
>>>> b/drivers/gpu/drm/xe/xe_reg_sr.c
>>>> index 440ac572f6e5..8fcc08658d89 100644
>>>> --- a/drivers/gpu/drm/xe/xe_reg_sr.c
>>>> +++ b/drivers/gpu/drm/xe/xe_reg_sr.c
>>>> @@ -201,13 +201,11 @@ void xe_reg_sr_apply_mmio(struct xe_reg_sr 
>>>> *sr, struct xe_gt *gt)
>>>>      xa_for_each(&sr->xa, reg, entry)
>>>>          apply_one_mmio(gt, entry);
>>>> -    err = xe_force_wake_put(&gt->mmio.fw, XE_FORCEWAKE_ALL);
>>>> -    XE_WARN_ON(err);
>>>> -
>>>> -    return;
>>>> -
>>>>  err_force_wake:
>>>> -    xe_gt_err(gt, "Failed to apply, err=%d\n", err);
>>>> +    if (err)
>>>> +        xe_gt_err(gt, "Failed to whitelist %s registers, err=%d\n",
>>>> +              sr->name, err);
>>>> +    XE_WARN_ON(xe_force_wake_put(&gt->mmio.fw, XE_FORCEWAKE_ALL));
>>> what's the rule whether to WARN about the failed xe_force_wake_put() or
>>> not ? should we also WARN when xe_force_wake_get() failed ? does it 
>>> make
>>> sense to WARN about put() if get() already failed ?
>> We don't have one yet.
>>>
>>> maybe simpler solution would be make function xe_force_wake_put() void
>>> as it almost nothing that caller can do and move WARN there if needed ?
>>
>> We have code that  does "return xe_force_wake_put()" So question is 
>> what shall we do
>>
>> if xe_force_wake_get() worked but subsequent xe_force_wake_put() fails ?
>
> there's not much can be done here. I even don't think there's a reason
> to wait on ack for force_wake put... in most of the cases.
> +Rodrigo, what exactly are we protecting against there?
>
> If that xe_mmio_wait32() fails, driver is toast. The reason we check (or
> should check) the return on _get() is because we want to bail out
> whatever we are starting to do rather than attempting it and handling
> bogus values of an IP that is not awaken.
>
> So, maybe what could be done is
>
> a) XE_WARN_ON(xe_force_wake_put()) -> xe_force_wake_put()
>
>     We cann probably move the WARN_ON() inside xe_force_wake_put()
>     if we want to maintain the behavior in most places
>
>     Then make xe_force_wake_put() void as suggested here.
>
> b) I'm not sure about the benefit of the weirdness of
> xe_force_wake_get() incrementing the ref even if we failed to wait for
> ack.  The only thing the caller is going to do is to call
> xe_force_wake_put() and bail out. Why are we not unwinding then?

With unwinding of ref count and partial woken domains on error, we 
should be able do


     if (xe_force_wake_get(fw, d)) {
         ...
         xe_force_wake_put(fw, d);

     }

I will let Rodrigo suggest how best to handle this.


Thanks,

Nirmoy

>
>
> Lucas De Marchi
>
>>
>> Regards,
>>
>> Nirmoy
>>
>>>
>>> what about making the flow more intuitive like this:
>>>
>>> bool xe_force_wake_get(fw, d);
>>> void xe_force_wake_put(fw, d);
>>>
>>>     if (xe_force_wake_get(fw, d)) {
>>>         ...
>>>         xe_force_wake_put(fw, d);
>>>     }
>>>
>>>>  }
>>>>  void xe_reg_sr_apply_whitelist(struct xe_hw_engine *hwe)
>>>> @@ -253,13 +251,11 @@ void xe_reg_sr_apply_whitelist(struct 
>>>> xe_hw_engine *hwe)
>>>>          xe_mmio_write32(gt, RING_FORCE_TO_NONPRIV(mmio_base, 
>>>> slot), addr);
>>>>      }
>>>> -    err = xe_force_wake_put(&gt->mmio.fw, XE_FORCEWAKE_ALL);
>>>> -    XE_WARN_ON(err);
>>>> -
>>>> -    return;
>>>> -
>>>>  err_force_wake:
>>>> -    drm_err(&xe->drm, "Failed to apply, err=%d\n", err);
>>>> +    if (err)
>>>> +        xe_gt_err(gt, "Failed to whitelist %s registers, err=%d\n",
>>>> +              sr->name, err);
>>>> +    XE_WARN_ON(xe_force_wake_put(&gt->mmio.fw, XE_FORCEWAKE_ALL));
>>>>  }
>>>>  /**
