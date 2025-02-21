Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80E2FC021B3
	for <intel-xe@archiver.kernel.org>; Fri, 21 Feb 2025 17:42:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B80310EB14;
	Fri, 21 Feb 2025 17:42:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gZeA8F+2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4858F10EB14
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Feb 2025 17:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740159736; x=1771695736;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=rvy0+IHHzgjARgvITdk5wLgsXrHJL8/6hKeC8flM2xc=;
 b=gZeA8F+2jwJRr6rbtB/C0H7i1n8qloxhFaHIcS8Asx7LtuDsuVx+yrWV
 JBZTDLqT7m5/EQi7cZ1nz06K96ZIwyhTZl2KXCjvlaAX7t5D+HuJs25u1
 r3y4VUMshfwfoLdSxfMiLLDKWYyN80i82WkC6EHJgGdv9EaNI3VXH4Ouk
 qDsm+YZqNYf79g9XiuOr0DiGNGKALI0T4F9qSfW97e3LSHd2aGtsm56B5
 kgdGI4mMvpMV/gLliH7CLS0drKUJO6VPSRaXVlupfK/gV+9SX1uq/FsHT
 ST/joJHJUyXSaL9TdV24n2h0BS4izyH4Dg7YHVDz74+FWWay8EzJxm4O3 A==;
X-CSE-ConnectionGUID: E+cZHLApS9iO7SL1OqaZXQ==
X-CSE-MsgGUID: FPswNxVsQluKPVdxiebuPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="51613208"
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; d="scan'208";a="51613208"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 09:42:16 -0800
X-CSE-ConnectionGUID: K5/2Ft5iSg2n/jQbj6XRXw==
X-CSE-MsgGUID: PVnsIY+STyCnZ/HuT7rYAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="115259757"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Feb 2025 09:42:16 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 21 Feb 2025 09:42:15 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 21 Feb 2025 09:42:15 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 21 Feb 2025 09:42:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DmRaz5mUgW4vnQ4h9qV60Sx3eXy2GRvBkO49Bzu+J5rDlQq1Ojt2p7uwAZhCM39XdOUH+HZjGNACD0XdXYKA89Y1+PaaHCzgyhlXsHVrz0mnjznL9DHgDOlkCM1WAcRY37GlXnpM8HfKwg5uluZCBrO9biYad3uRxFQNdSW2Ug+ysQ4vIuK9h5Aaqz9e3FGodx1vJb0h9MHo4mTc6iBQRBd6q88HC2vDJXNI1BeRkc4sByy1sTWq8InfIR06IJ+e0/Q8hLKMQHT+8HIfrK+nD492O62kNkNqNUGXUG8J1JdTBTcac5mHV9+9OCi8jo4I3iD1ZmOpmpam0bC1KRLRnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GA+nd5vfBIYjpLQvhpeFA4eV34mVXcVeJ1xJloxmuKg=;
 b=Ri2MYGUnCRijW7CjIoe8NHD0eW/xELtASaYaYOBsBjBlDL+JUGeB8bLD9ZMU+och/cUZgvcHyvp9PN8jS2Y01tEBOQcSVwHvQVZKdqnfsP+usrVhKqbOPA1JmA8aoBzym23C5K5hDmLzDQNdgfuhDhRM9Vd79OJJnoHb+Fem90N2dU10fPNH87X21xQcNRLDbzv5Oo0xpcUQG1aVSU/u23xLk3395jJ0rH0H2OLpK879cKKmadnjXiGzUMfJzCxGqq3RJqg8fh7ZUTELpAC+tKJlgBSTXNNd9Ki7dT7KJ/tpjMzHsEl3FC3BCWcpGvfjowj/1+OxCjvkEX9VHSfF2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by IA1PR11MB8174.namprd11.prod.outlook.com (2603:10b6:208:450::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.16; Fri, 21 Feb
 2025 17:42:13 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8466.015; Fri, 21 Feb 2025
 17:42:13 +0000
Date: Fri, 21 Feb 2025 09:42:10 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>, <vinay.belgaumkar@intel.com>,
 <soham.purkait@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, "Himal
 Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH v7 5/5] drm/xe/xe_pmu: Acquire forcewake on event init
 for engine events
Message-ID: <Z7i68srVjEyUpGg+@orsosgc001>
References: <20250214100819.798544-1-riana.tauro@intel.com>
 <20250214100819.798544-6-riana.tauro@intel.com>
 <tkee4kttili63cqcpreoc6wqz3r6depkmixt34ctilypa5rb46@ddqsv44zsvi3>
 <Z7fTX2X1qrdcv0fb@orsosgc001>
 <bsmgo4sti6ue46ocarjt3qltjke64ln4gf3vol2novnbw57goo@iihu3gswpjnx>
 <3isbafrfmgy7bi2vqjq4ixecuhugqk7o7tzdlsib3wx5wtfku4@g34iofqphcxs>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <3isbafrfmgy7bi2vqjq4ixecuhugqk7o7tzdlsib3wx5wtfku4@g34iofqphcxs>
X-ClientProxiedBy: MW4P221CA0028.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::33) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|IA1PR11MB8174:EE_
X-MS-Office365-Filtering-Correlation-Id: ac48556a-0469-4bc6-dabf-08dd529f130a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RGNTOXN1SmQyc1NRRmxuL2pMV1NBQUMzMSswVTJnaldVMlZQRnlnemtoTWtw?=
 =?utf-8?B?VlZOZC9xTFpCa2ZkcnBqemo4UWxSVnpRRk45TTBPZUU4OWJ2aVIvK3pVcGNE?=
 =?utf-8?B?WFNITUJYT011bWRKVEVxTnZubTZxUEJjY1kwNXYzZnZYLzZxQ2pqcGNCUFpW?=
 =?utf-8?B?RzNERitsSTcvTFFFeVc0Umlmdit1Vm85ZTJVd3dGaG4yR21QNm9td29TeTdU?=
 =?utf-8?B?L2hNVGptaE1HYUE5WUZ5aTlBdHpRRGQvamhFNmNBS2JBNHc1Yit6VitMT0lP?=
 =?utf-8?B?UmZnYlJ5TXZLcGpMWFk1UFhVYUxDM0tNd083YUdZL1FVVi90K3I2RFlPaWNY?=
 =?utf-8?B?ZS95R3JNZkZoVHlTd2ExWVJTU0orckRQZHdYSlVGMEV0djJhaGVCT3Foc0k2?=
 =?utf-8?B?aVJHZTFBUDErR2FNb29DQ08ycWdGOVVhMWN6Rkc2eEJRVHVzU050ZnFTekQ5?=
 =?utf-8?B?bzc4RFZCaE1vYnpRTjNDcGJLTjNmMGVoaXdnMU0vSGpjS3ZlUEMya1JtTVc1?=
 =?utf-8?B?ZkZEUTE1bVFJUGVwaEo1S0I1Smo3UnhqTmg4QXBSckIyUm1odG5MM1d0MTFL?=
 =?utf-8?B?UzF5Kzg5Sk5vN0tIOW85d1dkUXloeWx0eXVIQkFaMXkyRDdha3dEOXI5dUVO?=
 =?utf-8?B?cWRGM0JJZ2JzbU84TFJac0RIdTJ3cyt1NDYzN25ZNGcxcVBOdDBSZW1XN1Vk?=
 =?utf-8?B?bnpWc0ZhNlB1MlZZcHFtYlFpS3k2NlA0dWErd3Q0Y0RpL1lqZHZBNHlUSU5F?=
 =?utf-8?B?dlluSXdQU2xZSGd0MlB0UzI5c1Z6TEpMaWdJOXE0MkJDTStXd3VSQnkyTUxh?=
 =?utf-8?B?VkovQW5FWS9FRk45b1VySGhVSlhQLzdBQThKc05jUXlsYnpjZ0xPKzg2Ukpw?=
 =?utf-8?B?dytrT1NYQVpnWFpwNERsS1ovdVJGcGprbENza3UzaDJlUFlGb0F3dW14OXdx?=
 =?utf-8?B?RCs2ekxveTZhZ3ByR0JLc2JFaEx3Y282Q3BKNjR4OVpBNW1RN3BacVFacXVy?=
 =?utf-8?B?VzhHNnhXamlyRDlUZXJOMnQrVnNFV1ZsTHYzM3d3Y0lpelZxWHRZTnlpVWRT?=
 =?utf-8?B?MUtUaHVEbnZJNmlBOGZXWEd1ekZ0L09WQVBaMnZrMUdYUTZNSk9rK0FiODVK?=
 =?utf-8?B?MmpIMFpudXRIWC9GNXBNdFN5M3UwKzdtOTlvbzFBQno1VU4wb3U5TTdwNUMv?=
 =?utf-8?B?eTFnbnRYMStmS1B4ZHR4d3ZVOEZKMzI0bHBQbWtlTTUxeEg4eGhVTE5zT1hE?=
 =?utf-8?B?VFhHRDNEaGJvRW5nNlk3T0ZRTXBYakthVXJxWjg0OWl0a2tET0VsMGRnMjV3?=
 =?utf-8?B?ZytZenY3K1lRN1pTQUtiY1AzVTFYUlJLOUJLRWdFNGNkYWtzY1E5OElCL1Y4?=
 =?utf-8?B?RWE2Z0dJODd2dEdLc3ZlTkhpU21NbEl6dkpUdGxvOGNwTzVqeDluYXgwWXVT?=
 =?utf-8?B?RWszNFlkY1d1VFhvUFZFK3d0RVdvMHRLYU52aDFYU0NILzF5WSttMnFpRTFW?=
 =?utf-8?B?UlV0dEgyUFpHK0pxbFlFNDNSTzM5cnhOeThXOWNhclFZOFYwR09FcmJpRW5N?=
 =?utf-8?B?aTFhU0FyVEtzN2RrMjdibkZVd1IvZ0NBVXpvaERZWHkwaFR3eE5yYTJQYTRi?=
 =?utf-8?B?empZOTRSWm5kV0wveThBQVByaVlDeVJiL3RKWjN1TEFSRWNhMHVOeUhMR1kx?=
 =?utf-8?B?Vk44T1JuRVJmSGxERHphWG9Uei9YU0xZM0VYeUl4OVNzSkk5cFJLM0lZU3dZ?=
 =?utf-8?B?TTB5Szl2LzRtV1E3NlJOR3BBVXdEZWxYNGNTRlBsOElqWWJJK29obW04VlVw?=
 =?utf-8?B?cHB5eGxkQzlub0FCam83Zk81WVhMVlF0RXBJVDRVcWhyZVdPVkxiMW5id1Rm?=
 =?utf-8?Q?ynzbEd87F1TbI?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VTF4Q1BNTWROSmNlTWhmTE1jc2s2d1ljVVhReW5FQjhqTll6SW9VRGd4V3RV?=
 =?utf-8?B?SWlDRWhYbU4yRVNiN1lUTGJLS1lTMHQ1MW5FaFF5bkVDZ2dyZ2xSMXV1S0Zm?=
 =?utf-8?B?NGh1aThWTVgzTXlleXE4SStuaTR2cTJZRmFxNmtDTFNrZWdjZzB5M01yQkJF?=
 =?utf-8?B?OFNEaDBCZWtZLytzN1Awc3hUS0VjUThtcTRNY2VZN2FaTjBGckhTaU96TDVC?=
 =?utf-8?B?Ty81ZWw5Nm5SeUVXMXQyQkFJc3JGY3lWaTlnOUVwbG0wKzU5S2pTemI1UFJQ?=
 =?utf-8?B?RTQ1U2t2bGhRQTltbGM1czRyeE9rRW05cGxrVFcvTExxV3c5b0drNDFmNjM2?=
 =?utf-8?B?bk1xWHlGWEF1dU12SkY5b2dMbldkelJFcDdDMzlrNW9lQkFyMWtzdmJ6aHlP?=
 =?utf-8?B?OHVPNm9Qd3NrdGpDUm5wUnNvbm9lV1pMUVNWdGVaMmpvU0EwQlVMWlZ4MXRy?=
 =?utf-8?B?UHNUckdDYU5qUXRaQk00dGpVREpla2xTNlZvaVZ6WXpEbE52SkUwd2VYa1Z4?=
 =?utf-8?B?dEdmMnhpdXJIRVlrNUNONWF3ajJHNkFsK2Z2d3phTTVxVlRCUW1kK1daZnFI?=
 =?utf-8?B?T2twV0RoKzJGbnkvbE45elZoMXd4MjdIbkE4K09sUkdtcjNnZ1pwUUt3STkx?=
 =?utf-8?B?ODhBK2RveTY4UmFIUDJ6Q3lyUFpxZDdneStMaFc5U0ZnRzlaQWlmcjVwb3p6?=
 =?utf-8?B?Zlg2VE9nSkUwdHd1VjlOR1NSMWtWRWVEUGFnVzFuWTdZbzkycDlIV3ROMWFN?=
 =?utf-8?B?M1hKNlJXRVRFeGgyTmF2MU1DUGVyMnlkS1h6Q3UrV2N2QXFHMUp1UGt2V3hD?=
 =?utf-8?B?RDV5ZEwxSTVJamtzUDdVa2xPSGo5elRVeU40VDAxR3NxQVdsWW5ZQmVnL01a?=
 =?utf-8?B?aWZyRjFzUzZ1RHhHSUlHWjExZUNoT3YvbCtwUmRtUjdqQ0hKYnBMaTB5OWZS?=
 =?utf-8?B?K0FYazFzVlhuTVpna2o2WDZKT255V3Q0ZVRyMG5GRmhDQnhQenBnL080ZGFi?=
 =?utf-8?B?Z1AwcjQzOGI2bXdTNGRhUTNBaDZjQ3Vjd1ZteFQyY2ZxSWxmZXJlVlhCcjcx?=
 =?utf-8?B?YUN1ZkM1WS9SSWxwbzYrZmFTQWVUUGlTc2xES0NoSmxjSWVMVHJ1YnJLdEF6?=
 =?utf-8?B?Ylh3T2lvWm5tOVdZUlNJMWxrS3ZRZUx1WlB2NHUra05ja3RaQjVRcm5MZDIr?=
 =?utf-8?B?b0VmL0RDZTJUUjhUeThHQWdCT0NPVjVDb3lRQkg2MHpmeGFsOUJVTEVFTDZz?=
 =?utf-8?B?S2EvU3FCVkpFUEpOQVFUdG9ZdVpYZlhZeDl0MkRQeGhUUjlXam5zbXVWSDN5?=
 =?utf-8?B?MTZLYkVQVktBV1dYbUNqK2VvdGRrdmpubFZDblJLL2VOYmNiT1JkMDRSVVZQ?=
 =?utf-8?B?NWhmNWYzUzVxcEFVVTUwU3Q3aThsdk9XRGlmNXltb3VtaDlPWGFnbGhWREgz?=
 =?utf-8?B?SXg5VXBBYk9YMzFJbHFFZnptM2t6emxwQWp5SGczWDlCWEF4Z1JvZDJtSzly?=
 =?utf-8?B?cFc3N1hvSFNrbUp2aWo4UTNBRE56VjFaRTNQZTBPSFBSV2VselRwRm5RaTEr?=
 =?utf-8?B?Mnpad2QrYVIvQTAxbmhaem1OS3RQd0Q5Z2N2RG5ILzlxNmFOdnNYWFVZZGtR?=
 =?utf-8?B?QmwxdUJOZ1N2T3JIZWhoTHEvcXl6VDRKNUZLN0ZwOUl0RHR4M0g4N3hidDZ2?=
 =?utf-8?B?QktGQlljb01IVlNvWEs3QWlHQ1ZjK01YeEl1eEhHOFdQSWJHZEs4QXAzcUlE?=
 =?utf-8?B?U0w3ZCt5MVVkeU1IWWM1V2tPTFpqb2hmeVk2TnFoL2x6QzJYVVFoVWIxem9F?=
 =?utf-8?B?SFlvLzRib1hmZzBJZ3pCZ1hLdlVGTElucW1HL0tRaXpTckllZDVTcEJSUTk3?=
 =?utf-8?B?TnB0MSt6V25UNkt4NDQ1Ti9oMjVRMEhsTWJrZUcwaitNK1hRaWNnYXFBR3la?=
 =?utf-8?B?NTJMTGtpcmRCRCtpQ3JoNnVQbUVKNTdTNEJyb2ZneFRMaVpYVmZKUnloNzVS?=
 =?utf-8?B?UnhqRkNmcWNLUHFWd3JVbWVXL3ZvUDk0bzdEZkk5eHlwU3hzc2JMdVVqR0lt?=
 =?utf-8?B?bDFVeXgrQTQ5SjF1TTU2aXhGYngzRUZYdlgyQ1ArZTY3VG9HbjJYYTdDbmlt?=
 =?utf-8?B?aHp2d2VMN3FwQlQyUUIwMWVCL2Z3c1dVN2lUekp6TXhRYXhCT29MNjBGMGhm?=
 =?utf-8?Q?Rnx4+AmhZRfGwu4UkHnvK18=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ac48556a-0469-4bc6-dabf-08dd529f130a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2025 17:42:13.0851 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: viuB7LrNdjbcOTkthBGI9DZws/O61HM+0LQySuK0rCCX1rtC5psiodciqH8ioNfZ3s0iioZ0B8I3pkZvb4QXym+YfJilJgAglYukYAiT3Ls=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8174
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

On Fri, Feb 21, 2025 at 12:26:56AM -0600, Lucas De Marchi wrote:
>On Thu, Feb 20, 2025 at 10:45:46PM -0600, Lucas De Marchi wrote:
>>On Thu, Feb 20, 2025 at 05:14:07PM -0800, Umesh Nerlige Ramappa wrote:
>>>On Thu, Feb 20, 2025 at 03:46:55PM -0600, Lucas De Marchi wrote:
>>>>On Fri, Feb 14, 2025 at 03:38:13PM +0530, Riana Tauro wrote:
>>>>>When the engine events are created, acquire GT forcewake to read gpm
>>>>>timestamp required for the events and release on event destroy. This
>>>>>cannot be done during read due to the raw spinlock held my pmu.
>>>>>
>>>>>v2: remove forcewake counting (Umesh)
>>>>>v3: remove extra space (Umesh)
>>>>>
>>>>>Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>>>Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>>>>Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>>>>>Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>>>>>---
>>>>>drivers/gpu/drm/xe/xe_pmu.c       | 52 +++++++++++++++++++++++++++++--
>>>>>drivers/gpu/drm/xe/xe_pmu_types.h |  4 +++
>>>>>2 files changed, 54 insertions(+), 2 deletions(-)
>>>>>
>>>>>diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
>>>>>index dc89fa6d0ec5..67693d642f5a 100644
>>>>>--- a/drivers/gpu/drm/xe/xe_pmu.c
>>>>>+++ b/drivers/gpu/drm/xe/xe_pmu.c
>>>>>@@ -7,6 +7,7 @@
>>>>>#include <linux/device.h>
>>>>>
>>>>>#include "xe_device.h"
>>>>>+#include "xe_force_wake.h"
>>>>>#include "xe_gt_idle.h"
>>>>>#include "xe_guc_engine_activity.h"
>>>>>#include "xe_hw_engine.h"
>>>>>@@ -102,6 +103,37 @@ static struct xe_hw_engine *event_to_hwe(struct perf_event *event)
>>>>>	return hwe;
>>>>>}
>>>>>
>>>>>+static bool is_engine_event(u64 config)
>>>>>+{
>>>>>+	unsigned int event_id = config_to_event_id(config);
>>>>>+
>>>>>+	return (event_id == XE_PMU_EVENT_ENGINE_TOTAL_TICKS ||
>>>>>+		event_id == XE_PMU_EVENT_ENGINE_ACTIVE_TICKS);
>>>>>+}
>>>>>+
>>>>>+static bool event_gt_forcewake(struct perf_event *event)
>>>>>+{
>>>>>+	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
>>>>>+	u64 config = event->attr.config;
>>>>>+	struct xe_pmu *pmu = &xe->pmu;
>>>>>+	struct xe_gt *gt;
>>>>>+	unsigned int fw_ref;
>>>>>+
>>>>>+	if (!is_engine_event(config))
>>>>>+		return true;
>>>>>+
>>>>>+	gt = xe_device_get_gt(xe, config_to_gt_id(config));
>>>>>+
>>>>>+	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>>>>>+	if (!fw_ref)
>>>>>+		return false;
>>>>>+
>>>>>+	if (!pmu->fw_ref)
>>>>>+		pmu->fw_ref = fw_ref;
>>>>
>>>>how this shared fw_ref is supposed to work for multiple
>>>>perf_event_open()?
>>>
>>>Agree, not ideal, but I don't see an issue. This forcewake is only 
>>>being taken for engine-* events and the domain is always XE_FW_GT. 
>>>Looking at xe_force_wake_get(), I see that it returns a mask of 
>>>domains enabled. In this case, it would be the XE_FW_GT. The 
>>>return value is just stored so that the corresponding event 
>>>destroy can put the forcewake.
>>>
>>>>
>>>>fd1 = perf_event_open( ... gt=0 ...);
>>>>
>>>>	event_get_forcewake()
>>>>		pmu->fw_ref = xe_force_wake_get()
>>>>
>>>>fd2 = perf_event_open( ... gt=1 ...);
>>>>
>>>>	event_get_forcewake()
>>>>		// get the forcewake, but don't save the ref
>>>>
>>>>forcewake for gt1 is never put.
>>>
>>>pmu->fw_ref should be identical for all events taking this forcewake.
>>>
>>>>
>>>>
>>>>Or even multiple perf_event_open() for the same gt: we will not handle
>>>>the count correctly.
>>>
>>>The count is actually handled in domain->ref in the forcewake 
>>>implementation and note that forcewake is always taken for every 
>>>engine event that is being initialized and hence always being put 
>>>for every event that is destroyed. This code is not refcounting 
>>>that.
>>
>>so... we never set pmu->fw_ref back to 0 and any event destroy will try to
>>put the force wake? That seems a different bug that avoids the bug I
>>was thinking about.

oh, yeah missed that. That's a bug.

Thanks,
Umesh
