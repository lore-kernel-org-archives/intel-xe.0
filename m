Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33631E6F092
	for <intel-xe@archiver.kernel.org>; Fri,  1 Nov 2024 22:15:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCC6010E03C;
	Fri,  1 Nov 2024 22:15:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KplC0jYh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1378E10E03C
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Nov 2024 22:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730499318; x=1762035318;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=OjV6UgnFQ3GKun3TFt7fE1FpqrtcB7FVWILDx2X2R94=;
 b=KplC0jYhMq6NPMh70yzbvyLqEq0R/MF9nh8dXfooEqqFYoDLcyaFxDhf
 qELZo7scXEzZvgOf38236JFmmRHUchzmLAyw5F4Eah8N+mx+ThfPZBv3g
 ysEz66yppnsBahIlC2g3xcrmBuUcFAMtw7ReSkIRzgmI5ZkdKWUPVVwsz
 e8SQWbOG+hm7ZTTRrAmW+8FKvQjYnh1zBMnoQBzkKP/3VhuhsUvbm19RT
 5EHHrYW47r7ylf/QNnx+v9nF/qrTVLOKmftFYZmGVPQTFvryCmXBaNlQk
 kVMoeKws83J+Sd3ArpOVMXu9g1Y7B4M0VeS6DsrZK3r5S47ZbBuBmyQCX A==;
X-CSE-ConnectionGUID: czm2YH+OSWudUJprOJA0aQ==
X-CSE-MsgGUID: a5Pwyyr2SPySwfTcKHIzAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30231832"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="30231832"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2024 15:15:17 -0700
X-CSE-ConnectionGUID: 8GaYzx28TnC9I7I9sDI2lA==
X-CSE-MsgGUID: sNCNhUgGTEeMPeqDoF6umg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,251,1725346800"; d="scan'208";a="83196541"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Nov 2024 15:15:16 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 1 Nov 2024 15:15:16 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 1 Nov 2024 15:15:16 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.49) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 1 Nov 2024 15:15:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OO/E5Vu7FLElC2ZdkdNWMZk2i98ChqdacLBQmqhWVxV3uS0ybHpJh+eNZUhH8FJp9NFkS/U0kWgZeY/FmnoiXK2TpLTWDtI5kHjVqQWwVUUGvPpA+DQUK8TghKY2dqAWEN4CB5mW0nJKgR6mq3vWgCHOt+opPd9PSvKAxBFrwONJfN9I0iWP9FctlDNkzQMDeNJ4DOlwpKQT6M1fqCEZxxlKFadh6qzFUijDPSB/rwFK+D5dInRT5y9SEeMW/U+Gr8hVa69+yJ1xraC9lQiZiU9bukZ+8WssdTzdKWP+nK8A1x63piJ1R1p4S0ZZzu0/8BHgha0pEDiw/BcgvaMR7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=55u4c4izDszF+m1p/+FYDu3v+7YZS+bCqgL6DiFnVLk=;
 b=utNODm/CUbf+Zmg2A4PcYv953W8QZFikiAG6y33OE4iD6KH7C9YFhY1E2ellUbRYyVZXAaQI4PDUX7P4zPHMhQFjHrWJszh/H26eDiEL13kUmgcUr7cPjOXqHGbz6EzYFub5q7QZ2gVg/Z+KweJCaSyzuz81hLCnJlYM8vEoglJg9S4uAa9IlvmK4HM5JNENBebc88A9wHGUlpposUXzEwN6+IUsV39t5QfSHuf6lLPv/7I7hJ/hYCpnEZ0qs5hH4Lg8LIMo+z8SQV4ek5A4JD9zn6v7m8f1KUb+SJRio/UWoOFxeKW2HuhCD0rNmevofp0rWCala75Egsy4232sKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by CY8PR11MB6820.namprd11.prod.outlook.com (2603:10b6:930:60::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.20; Fri, 1 Nov
 2024 22:15:13 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%3]) with mapi id 15.20.8114.015; Fri, 1 Nov 2024
 22:15:13 +0000
Message-ID: <3faf9d20-0cea-4294-a9c4-97a5f104d90c@intel.com>
Date: Fri, 1 Nov 2024 15:15:10 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/xe_guc_ads: Add whitelist registers to write list
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Gupta, saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex"
 <alex.zuo@intel.com>, "Nerlige Ramappa, Umesh"
 <umesh.nerlige.ramappa@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>, "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
References: <20241101180403.97272-1-jonathan.cavitt@intel.com>
 <6a317425-bf13-4269-b510-04a765c3cc23@intel.com>
 <CH0PR11MB5444581AA95D474000743B9CE5562@CH0PR11MB5444.namprd11.prod.outlook.com>
 <80cb07e4-8049-4320-814f-7535b20e1145@intel.com>
 <CH0PR11MB5444240B935D3ABF926E2156E5562@CH0PR11MB5444.namprd11.prod.outlook.com>
 <b32a1ea8-3a2a-4ba8-a195-4babca8e5c8c@intel.com>
 <CH0PR11MB544446DF9387BC1B7AE57002E5562@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <CH0PR11MB544446DF9387BC1B7AE57002E5562@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0259.namprd03.prod.outlook.com
 (2603:10b6:303:b4::24) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|CY8PR11MB6820:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c8f10c3-4593-49c2-c244-08dcfac2a80b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V1BOY0xBUnpEQXU2eVFqQzlLTnI0RXdPb1lZc1o5KytNbEF2ckpSYk5saC8z?=
 =?utf-8?B?U1ZMTW9TTTNId3VkdGhKVXUzdjdOTFdzNHYxcmFXT3Q2YXNIMXgzV3hzWEo0?=
 =?utf-8?B?bHdockN2NjhhWTdYdnE3V3Vqbmkrc3dpbDMrT280bVRPeUlYdEZpbnFTTlB1?=
 =?utf-8?B?U0NGeDBmdE5JRk4vK21kNHhqVW1BVDJyNnE2bS9EY3d1Y1Nzd21nVGd3QWRR?=
 =?utf-8?B?cGNtOUhDeDd2KzdYRmVEMFo1WW1qb1dUV29TWEVpRVRqeFRIL2xPSkJ2WVlM?=
 =?utf-8?B?YjZsWndrZVFMSEhjSmJlZEhxTm1WQThvQ0lHTHhpNTIxcWVRbWRrQlIvU3NQ?=
 =?utf-8?B?eDI5S2ZzeFJ2QnhFVEx3c0tLcisrNGlISjlUQ2dSakY2RnBGckkxbWErYmRQ?=
 =?utf-8?B?aXBad0J4dUNBOUw0MWJNNzRVamdGd0ZKeXlqV0JQaC9UTlN1b1JkeE1FZTVq?=
 =?utf-8?B?NTBoN1VwZ1NXVWM4RTIyL2JUV01ZZmhLbTdLVVJMZTBqNnU3ZTNIZnBDaUJt?=
 =?utf-8?B?YkZvQU1ULzZoQ1BydnhGVHFXUUVoMFVTcnE4N0tWcVV5NnZlQlp6QWdQanEx?=
 =?utf-8?B?NnhiVzN4OXA1TEZ6M1AwZGhCNW8xQkZuWUQ2UVZYZnNuS0xVRkhhd3BhSDlR?=
 =?utf-8?B?V3FnSVdZOXJSRDE3YkxQMjdIUFZkamF4QkJnMFhmbzZDMWo4dU9YeEloeVE0?=
 =?utf-8?B?NXFjTHpVQ2syalNWd005Mzc5NXpHWlE5SDFoVDdTNGNpeFYvZlpXeFNjdGxI?=
 =?utf-8?B?WUtyT2ZGWnl4MHhyWnBpY3g5TW4zM08rL1l1aUhQb0pFMytveXJlVnhpK0J1?=
 =?utf-8?B?emhyRTZXandOMmtQcG9KcUJyS01JWnFiRFZnTHNrTzByWXZybG92c0NaYlFE?=
 =?utf-8?B?MWFZUFFxRWN5dnZGbGxiZjFBdWwyd2xTNFp0aCtiZ2p6NVdZWFdZRUkwdE5z?=
 =?utf-8?B?a0FBOFJKVkFiSmNCdm9mYitqK0tmUUhOcm5na05wcXk3ejhSRE1jbU5ZYWNP?=
 =?utf-8?B?S0xYUXJlNkNDMTF3enN4K2M1ZHR6c3psckdpWHpnTTZMcWcxK1orUVo2SWJs?=
 =?utf-8?B?NnpOczdvczVLSFV5L2gvR0VWSzhIem9VKzJJQUdiSjFSNEg5eXA2bWJsQVdi?=
 =?utf-8?B?ck5xeFV5SXZvNkQwRXhqSW8rV21XaGIrSjNqa29TS2xMeFBuRkVQRHp4dCtH?=
 =?utf-8?B?R1NyRWJSTDEyb2Jlem5CWkxBclZzODVtQVB6SkJDSW5vdE1ScWI5T0RMKzE0?=
 =?utf-8?B?UjUvblUrUzE4dDNnMHJWU0lYOTNrNmREeEJSbjhPL2hCWnVmODdkeXVCQitG?=
 =?utf-8?B?Zko3RitGOHVSNWNBaWtNS2xwYmtNc05DZElBN01mZlcrYXd2NGZHRWtFemJi?=
 =?utf-8?B?NjhxOS8xcGdHMkszWnQ4NGdRb1kyeWRTeThWSWtUaVBZQmplVVJvU0MxU3Ix?=
 =?utf-8?B?ZW5idEFwZU1POFM0SHZDcVZXeUJCRkhTMkhYWWk2UUpDaFlSamh0S3BlZytQ?=
 =?utf-8?B?RE02QUV4S1ZSa29XQlAwN3VMci96TkZpbk5sTnBIdmF4TEhHdkV6OUFVNHNL?=
 =?utf-8?B?MGZlVTU4a1V4QzIySG9PQzVMc29iT0Mxa09EZnhuSzJjMjBoQjJzMWp0RStQ?=
 =?utf-8?B?NlhkRkZ2YlFNQTVIQllNRSt1RkFlb3JWeFlIcEhxTURKUTJvanBUczJtdkNZ?=
 =?utf-8?Q?MAbXM5gHUtsw8PQas8/d?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S1AveldrdDJrSEtLRGozK0hwWFViNTZ5bTJoaWtsRDZad0NsL2dxcnVYbk1J?=
 =?utf-8?B?OGRaMHdabUlSTmNpeEFTNEczSDU5TXNOeVhnTUo1c0l0dERGQ3RteE54cDQ4?=
 =?utf-8?B?WDRDaHA0dDlDb00yUTVqM1R5YWp0SlB3anZJemU1T21lWHhmSjlDQktBUHVp?=
 =?utf-8?B?U1h5QytGbnlEemFRcGU4dTZvUHNkbmVOQkdla1dERTNLRlN4ZnF2V0ZncTJF?=
 =?utf-8?B?MnRSOFk5akZKZDJkNElUREhGNEw1bFJQK3FqM2ZNMGlKbURlRHFrWVU3VUFn?=
 =?utf-8?B?Mm9qSGVNSnZUcnFGN1V6U1hTMi9BdkxWMTRaejVuWXVaa3FCL3V0b29KTXZ2?=
 =?utf-8?B?eFdGQkdiMUZFZUk2VlRaNzZlRDdITUkwME9URnpvUFlycm9NbkE5RTBPQWpk?=
 =?utf-8?B?UVp0YmNvZEJOajV6emJSRzhkbFExd3Y4OFJ0TDY4R2pyWXduY2F6bjdqa09k?=
 =?utf-8?B?TmxkRVBiYTN5eENrMndsaUxOQ1daM2Z3MkxDZWVjSzFOVkYwVWp5dFZzekNK?=
 =?utf-8?B?Nlk2dVVNZWllUHJVMVRnbjdrc29WSEVkMjhyVjJGdjNhdWRIQWpJUUQwME04?=
 =?utf-8?B?YmVTMVNMVVpGS1RXaU9sbW90Zy9oMXFZZXRDQ3ZWSlUrczJyaVlKRFVJNnVD?=
 =?utf-8?B?ZmpVeVI5MW5GU0JUUkRocW9aZGRqWHVraEh2UjllVzZaSi8wNVdCbmJVRTR3?=
 =?utf-8?B?MW45ZTlnZ091U0VHcUc3Y0lEWFBKM0JGZytjaVQrWEpyT1VUc0ZmdW1zNFoz?=
 =?utf-8?B?RlRBdGdIdW44WFhkU3M3OVh4UUxzR3ZrdUgzT2FSRUdjR3BRSE8xdWlObUdB?=
 =?utf-8?B?QXRZRVU3cEp3aUxUbGNPa1VONGJnR3JGNitmcXJCQXBYaUZTWU1TVWlTV2dj?=
 =?utf-8?B?RzRXL21JWDFoeUVvUjE0UWd2L0ErZHgzZ0E4SG4wOWx2cUVLN0tuNWRHREg3?=
 =?utf-8?B?ZFRkdTEyNnA1TDUreFJWd0QrVWpWdEZXRWlmUUdER1Fwd3kvYi9pU3ZlM2lr?=
 =?utf-8?B?YWpuUTdSOGZsNVRtTG9pYUduQ3V1ZnUzdGE5YkgzWDQ4RGl2NXZyaHVNR1ps?=
 =?utf-8?B?bE1MdHVUZmJEWUtaMjRaUEY0Y3ZtVzVtQmVBajJEYXJvYzdpT1didEpiVFZx?=
 =?utf-8?B?cGFXMzN4UDhLV2FJd0RPbmtZem1IaDg0UW8vRUZZS1RkKzNqL29MT3B5VUNZ?=
 =?utf-8?B?NjkyY1JPbU41a0lTMzRQS2JFeDVvY0lkMW9FckFrYXV2c0VBYzUvK0JTbDND?=
 =?utf-8?B?M2k3SWhMbFJLTEQzdkJMWlJ0c0M5YzF5YUVmaVVLcEo5K1MwQWVxeFphVGcw?=
 =?utf-8?B?ZzN2WUxlQWxDOG5wSmtmOFBtVmpLcXpJZlkwK0FCUlo5anFGOUMwQ3dLbSs3?=
 =?utf-8?B?TnFtSm9KQ2l3WldvelZYN1dnRENjWXB4bHNQT2ZRTVViWHdyRmtRdzRDQnFC?=
 =?utf-8?B?ZXIxTk1XcTU4UE80Z0NaUHJtQnNCai90RUtLWXhueDA4VmkvRm1HUnJvNzFH?=
 =?utf-8?B?SDBiSjZXaWwxZHplWEwwN0w5a3N4dnNsRGhtQWVEOFZHeGczWTJCbG83eUlp?=
 =?utf-8?B?dUk2WFU3azJwN1JTZzlDeVlrTmwzT1k3aW1vdHBJOXRwanJWWlVDS2lyaytN?=
 =?utf-8?B?OTVVTXIrZ1NRZFlrT0VOdFFZUGVvMnNYaFpscjdydUpvSXVBTU55NzFZMWIv?=
 =?utf-8?B?Snh0VzZlVDlKUE9XdHN4TUhESmt6MHQxOGUyOXhhS01sMUgvUXY0Wm83RWJu?=
 =?utf-8?B?T1VDS1pkTWhTd3F2bWNzU2hRU1hqTnFFV1ZzZ2RLWEwzUHNkRE1wV1FIdUNo?=
 =?utf-8?B?aTVBTEUvMWpSQko4Tmt3UnNLdlUrQmsxdGdOdW9iTjdzUEp1Y3RPVlZ1Ylg4?=
 =?utf-8?B?UDYzTm1hYXEveWlkTFJqdU8xWG9iWkg3cFNxdmw1RTl1MkJ5djFCL0o2bXlr?=
 =?utf-8?B?Y0xiODNEMHFobDNTdWlROWJYRzNNNU1oRTFFTTl5a3djYTFNNFVnWFo5OGdm?=
 =?utf-8?B?WDJjVTBzVlgxOFovUFFoL0NUS2hveEhWK3lRTnN5b3R0WkIwS3FFYldmUzl1?=
 =?utf-8?B?V3BkV1FRUHBvQmVQVkFDUm41bjFZUWxiVzRzYUZnQXNXZTdPVDhvYXJQdXo4?=
 =?utf-8?B?ZzNheHdOcUZveGk1YXROdXlxbjhOZHpVWnJCWWtROUVOOGFVNWNucjczWlZp?=
 =?utf-8?B?bXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c8f10c3-4593-49c2-c244-08dcfac2a80b
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2024 22:15:13.1466 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fvLPlsojbWhHkisNrVt8tLc7Ycrsm+W3L47xp46jOKtoojA5G74FffREgojYreY1PpXXe58ytcCIuh5er/xIAYWj9JrzA3rmTNwFaeX3SUg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6820
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

On 11/1/2024 15:00, Cavitt, Jonathan wrote:
> -----Original Message-----
> From: Harrison, John C <john.c.harrison@intel.com>
> Sent: Friday, November 1, 2024 2:53 PM
> To: Cavitt, Jonathan <jonathan.cavitt@intel.com>; intel-xe@lists.freedesktop.org
> Cc: Gupta, saurabhg <saurabhg.gupta@intel.com>; Zuo, Alex <alex.zuo@intel.com>; Nerlige Ramappa, Umesh <umesh.nerlige.ramappa@intel.com>; Roper, Matthew D <matthew.d.roper@intel.com>; De Marchi, Lucas <lucas.demarchi@intel.com>; Dixit, Ashutosh <ashutosh.dixit@intel.com>
> Subject: Re: [PATCH] drm/xe/xe_guc_ads: Add whitelist registers to write list
>> On 11/1/2024 13:47, Cavitt, Jonathan wrote:
>>> -----Original Message-----
>>> From: Harrison, John C <john.c.harrison@intel.com>
>>> Sent: Friday, November 1, 2024 1:14 PM
>>> To: Cavitt, Jonathan <jonathan.cavitt@intel.com>; intel-xe@lists.freedesktop.org
>>> Cc: Gupta, saurabhg <saurabhg.gupta@intel.com>; Zuo, Alex <alex.zuo@intel.com>; Nerlige Ramappa, Umesh <umesh.nerlige.ramappa@intel.com>; Roper, Matthew D <matthew.d.roper@intel.com>; De Marchi, Lucas <lucas.demarchi@intel.com>; Dixit, Ashutosh <ashutosh.dixit@intel.com>
>>> Subject: Re: [PATCH] drm/xe/xe_guc_ads: Add whitelist registers to write list
>>>> On 11/1/2024 12:40, Cavitt, Jonathan wrote:
>>>>> -----Original Message-----
>>>>> From: Harrison, John C <john.c.harrison@intel.com>
>>>>> Sent: Friday, November 1, 2024 11:46 AM
>>>>> To: Cavitt, Jonathan <jonathan.cavitt@intel.com>; intel-xe@lists.freedesktop.org
>>>>> Cc: Gupta, saurabhg <saurabhg.gupta@intel.com>; Zuo, Alex <alex.zuo@intel.com>; Nerlige Ramappa, Umesh <umesh.nerlige.ramappa@intel.com>; Roper, Matthew D <matthew.d.roper@intel.com>; De Marchi, Lucas <lucas.demarchi@intel.com>; Dixit, Ashutosh <ashutosh.dixit@intel.com>
>>>>> Subject: Re: [PATCH] drm/xe/xe_guc_ads: Add whitelist registers to write list
>>>>>> On 11/1/2024 11:04, Jonathan Cavitt wrote:
>>>>>>> When performing a guc_mmio_regset_write, we add all the registers in the
>>>>>>> reg_sr list to the save/restore list, but do not do the same for the
>>>>>>> whitelist registers.  Add them in.
>>>>>>>
>>>>>>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249
>>>>>>> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
>>>>>>> CC: Lucas de Marchi <lucas.demarchi@intel.com>
>>>>>>> CC: Matt Roper <matthew.d.roper@intel.com>
>>>>>>> CC: John Harrison <john.c.harrison@intel.com>
>>>>>>> CC: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>>>>>>> CC: Ashutosh Dixit <ashutosh.dixit@intel.com>
>>>>>>> ---
>>>>>>>      drivers/gpu/drm/xe/xe_guc_ads.c | 11 ++++++++++-
>>>>>>>      1 file changed, 10 insertions(+), 1 deletion(-)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
>>>>>>> index 943146e5b460..2fc6b1ccc8fc 100644
>>>>>>> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
>>>>>>> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
>>>>>>> @@ -239,9 +239,12 @@ static size_t calculate_regset_size(struct xe_gt *gt)
>>>>>>>      	enum xe_hw_engine_id id;
>>>>>>>      	unsigned int count = 0;
>>>>>>>      
>>>>>>> -	for_each_hw_engine(hwe, gt, id)
>>>>>>> +	for_each_hw_engine(hwe, gt, id) {
>>>>>>>      		xa_for_each(&hwe->reg_sr.xa, sr_idx, sr_entry)
>>>>>>>      			count++;
>>>>>>> +		xa_for_each(&hwe->reg_whitelist.xa, sr_idx, sr_entry)
>>>>>>> +			count++;
>>>>>>> +	}
>>>>>>>      
>>>>>>>      	count += ADS_REGSET_EXTRA_MAX * XE_NUM_HW_ENGINES;
>>>>>>>      
>>>>>>> @@ -727,6 +730,12 @@ static unsigned int guc_mmio_regset_write(struct xe_guc_ads *ads,
>>>>>>>      	xa_for_each(&hwe->reg_sr.xa, idx, entry)
>>>>>>>      		guc_mmio_regset_write_one(ads, regset_map, entry->reg, count++);
>>>>>>>      
>>>>>>> +	i = 0;
>>>>>>> +	xa_for_each(&hwe->reg_whitelist.xa, idx, entry)
>>>>>>> +		guc_mmio_regset_write_one(ads, regset_map,
>>>>>>> +					  RING_FORCE_TO_NONPRIV(hwe->mmio_base, i++),
>>>>>>> +					  count++);
>>>>>>> +
>>>>>> The code that actually writes to the NONPRIV registers
>>>>>> (xe_reg_sr_apply_whitelist() in xe_reg_src.c) explicitly clears all the
>>>>>> unused registers with a comment of "clear the rest in case of garbage".
>>>>> The code in xe_reg_sr_apply_whitelist calls xe_mmio_write32 to write the
>>>>> registers, whereas the code in guc_mmio_regset_write uses xe_map_memcpy_to
>>>>> internally.  While the former seems to be writing to the
>>>>> xe_mmio_adjusted_addr(mmio, reg.addr) + mmio->regs, the latter appears to be
>>>>> writing to IOSYS_MAP_INIT_OFFSET(ads_to_map(ads), guc_ads_regset_offset(ads).
>>>>>
>>>>> I'm not particularly well-versed in these functions, but it looks to me that these
>>>>> two functions write to different locations and thus would not impact each other.
>>>>> Or, in other words, I don't think the garbage we're clearing in xe_reg_sr_apply_whitelist
>>>>> is the same as the data we're writing in guc_mmio_regset_write.
>>>> No.
>>>>
>>>> The apply function is writing the list of whitelisted registers into the
>>>> whitelist registers themselves. The GuC ADS code is adding lists of
>>>> registers to the save/restore list for an engine reset.
>>>>
>>>> Specifically with regards to the NONPRIV registers, these are a set of
>>>> registers which hold the addresses of other registers. When set, they
>>>> allow untrusted users to access those 'other' registers which otherwise
>>>> would be off limits. The whitelist code is setting up that list. E.g.
>>>> adding the OA registers to the whitelist to allow applications to use
>>>> the OA mechanisms. So it does "NONPRIV_REG(x) = OA_REG". It also does
>>>> "NONPRIV(x+1 .. max) = NO_OP". That is to ensure all the NONPRIV
>>>> registers are set to something valid and not uninitialised. Otherwise we
>>>> potentially have unintended registers being whitelisted and users are
>>>> able to access things they shouldn't. Whereas, setting them all to NO_OP
>>>> means we are granting all users access to the NO_OP register which they
>>>> already had access to anyway.
>>>>
>>>> Completely separate to that, the GuC ADS code is creating a list of
>>>> registers which GuC will save and restore across an engine reset. These
>>>> are all the registers which get trashed by the reset but which are not
>>>> saved and restored as part of a running context. The NONPRIV registers
>>>> apparently fall into this category. So we need to tell GuC to preserve
>>>> their content across a reset. Otherwise, after the reset, the whitelist
>>>> will be lost. But, the reset state of those registers is 'undefined' as
>>>> opposed to 'NO-OP' as suggested by the whitelist code. That means that
>>>> any NONPRIV register which is not part of the reset save/restore list
>>>> will be no longer be set to NO-OP after a reset. Instead, it will be
>>>> giving users access to some random register again. And we do not want to
>>>> do that.
>>>>
>>> Okay.  It sounds to me that we aren't performing xe_reg_sr_apply_whitelist
>>> during an engine reset, because that function should be setting the registers
>>> to a defined reset state, rather than "undefined".  Should we be calling that
>>> function during guc_mmio_regset_write?
>>>
>>> I tested it and it didn't work on my end, but I might be missing something.
>>> -Jonathan Cavitt
>> No. The KMD does not execute any code on an engine reset. The reset is
>> handled by the GuC. The KMD merely gets notified that it has happened
>> after the fact. That is the point of giving a save/restore register list
>> to GuC. GuC will save the values of all the registers in the list before
>> it does a reset and restore them again after the reset is complete.
>> Therefore, any register whose value we want to be manually preserved
>> across an engine reset must be added to the GuC's save/restore list.
> AFAICT, that's what I'm doing in this patch, so could you please
> clarify what it is I need to do differently from what is currently
> present in the patch?
> -Jonathan Cavitt
You patch is only adding the NONPRIV registers which have been used as 
opposed to adding all of them. The foreach loop is iterating over the 
list of whitelisted registers (i.e. the target registers that are 
written into the NON_PRIV(x) registers) and adds a NONPRIV register to 
the save/restore list for each entry found in the whitelist. So if there 
were three entries in the whitelist, it would add NONPRIV(0..2). 
Therefore NONPRIV(3..11) are not added to the save/restore list and will 
be trashed on an engine reset.

The original patch was simply looping over 0..MAX_NONPRIV and would have 
added all the NONPRIV registers to the save/restore list.

The current patch is an optimisation to only add the in-use registers. 
My concern is that optimisation is not valid and the original version 
was actually necessary.

John.

>
>> John.
>>
>>>> John.
>>>>
>>>>
>>>>> -Jonathan Cavitt
>>>>>
>>>>>> If we don't trust the reset state to be valid then we need to ensure all
>>>>>> of them are saved/restored across a reset. Otherwise, that garbage can
>>>>>> come back and cause problems.
>>>>>>
>>>>>> John.
>>>>>>
>>>>>>
>>>>>>>      	for (e = extra_regs; e < extra_regs + ARRAY_SIZE(extra_regs); e++) {
>>>>>>>      		if (e->skip)
>>>>>>>      			continue;
>>

