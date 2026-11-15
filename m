Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC0F606A31D
	for <intel-xe@archiver.kernel.org>; Sun, 15 Nov 2026 12:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hTxUYDEe;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=j2uTA+3A
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70ECD10E8BB;
	Sun, 15 Nov 2026 12:07:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8341E10E01F;
 Sun, 15 Nov 2026 12:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794744443; x=1826280443;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=QIwerL25Lz22+jzaVfRgtr52Zhw6lhdeXFRs4Df5CIk=;
 b=hTxUYDEe59iwfodyzOrFjJ8kKwZeveRwmFOXf7v2if8CHpiCpD6nKS5D
 nHk0s8OEEWe81zz9JFqJNLEmey8ty0uyM1ANEv4Vh34sKV8tLSYpePMo+
 Q0EYTnz08UHScoQhqSuBjL+wM2WqlxqtKPJCgOYeJobx1ZhzhzbQdrDKf
 CtlBEouKNscIBdxhN7MOMlanMLZpQXxFgU79dPMVKYiLJeO8H6x5hkPSp
 JAvaPbEJ/z8+PadZh6bs0JjKCZC46X66LtDX95E+/6JZaL2Y/PnhXOmSS
 OAdOqzZfU5CBBegq1McJ/tQNARLO4p1gcvED4NcTq1IAjA94ToEAhzhUJ Q==;
X-CSE-ConnectionGUID: RyK6GkKGTHiE6TqcnS+sTQ==
X-CSE-MsgGUID: Fc1Uxm32TG66C90uje+SOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11966"; a="3534656"
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="3534656"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2026 04:07:23 -0800
X-CSE-ConnectionGUID: uYAYWP6/TD2iCWQACoQpAQ==
X-CSE-MsgGUID: 32wejP6DQXSxFupnKvAtPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="9256130"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2026 04:07:23 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sun, 15 Nov 2026 04:07:22 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Sun, 15 Nov 2026 04:07:22 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.71) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sun, 15 Nov 2026 04:07:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PHo0n+Lev2x/JDnZvAsgkkO69faXldmPjXq/WeuXOEwf8K841P5ACl4AnCN4JQjM1Xbx55JIvRwEPV0joJ0/Rh//ekMgchSmFfcF7XemFFwvJUfidYTbHa5aAWgfLVtyUTd0sb1lIKddpacG+iKi5EaefwV5ZvuG69P4yPA91c+m+VoZHR6lo8CgbF5mV9ohqy8VNuHJMj7fMQjJ48GADPHnlE1kbehkzFGtqOmSFurZnCuPi8bPVObEiIKmToDmSD7gcwAMb1unz9LntLIhFhKc0GL3+gnC/UNEVof2feoRpiQGvey68Ub+16//ty7CV4f+3Py4Ah39Ngr26Ui0rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=axNDmhww2fgcsWCjaqoEK0CMvAxgJ4FbUui/lYRDCwE=;
 b=lYL4IEK3ZW+YNHfeElJMENsB+EHJiW0sHpJB2OHuk1d5dTlPTMnGQ6rhZ9q7abSFEUfMw1e4CqwD0IXkKnwDRG4BU+w/rsWglF7wXPH89LjajuahfsBdV3jFOy+4O5ygNcYpq91Ciy/XwOQ+/ynPXtKz6CPnDUyPQ+5mFJPT3pemm/aW24TyTdPgTdVbYVBKtv13BXP7xS0ZaYWo9NH2+MGMiono/bVVj3HqbujF6ZflTdxbtdUWFqWa0EUdvFn1Nfn1vIDA4v2pcFXCoVqI2ywipxgBCO7qSXIaFjx6v8pEYq2h1sc6NTMnpAvDUDmRWw6bpT9JCaHrGi5vpJwYuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=axNDmhww2fgcsWCjaqoEK0CMvAxgJ4FbUui/lYRDCwE=;
 b=j2uTA+3A1oVDGLphDFkSCtL6F0PBmYR7VZNFDSRo4oFq9xXaw0C5LlJaQHdB+TvnoiIZuxyKYvUntJ16yOU+NFP0x0N/P/7rYk+PxrfYr8IyUIHhYRFPuITtHtPsMCFUmrPQRG/vHvNIVeay8wOmHcp5bNc+zn1gQlD93O5wO/Y=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LY0PR11MB357627.namprd11.prod.outlook.com
 (2603:10b6:404:21a::11) by PH8PR11MB9805.namprd11.prod.outlook.com
 (2603:10b6:510:3c2::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.13; Sun, 15 Nov
 2026 12:06:20 +0000
Received: from LY0PR11MB357627.namprd11.prod.outlook.com
 ([fe80::71fd:d139:945b:a71c]) by LY0PR11MB357627.namprd11.prod.outlook.com
 ([fe80::71fd:d139:945b:a71c%5]) with mapi id 15.21.0615.012; Sun, 15 Nov 2026
 12:06:20 +0000
Message-ID: <c39e99be-d923-4648-9fcc-b7d64421a250@intel.com>
Date: Sun, 15 Nov 2026 17:36:13 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/7] drm/i915/dp: Compute the DP symbol based timing
 generator parameters
To: Arun R Murthy <arun.r.murthy@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
CC: Jani Nikula <jani.nikula@linux.intel.com>, <uma.shankar@intel.com>,
 <suraj.kandpal@intel.com>
References: <20261103-vlk-64036-dp-symbol-tg-v4-0-6cf8a588b54c@intel.com>
 <20261103-vlk-64036-dp-symbol-tg-v4-5-6cf8a588b54c@intel.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <20261103-vlk-64036-dp-symbol-tg-v4-5-6cf8a588b54c@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0260.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:21c::8) To LY0PR11MB357627.namprd11.prod.outlook.com
 (2603:10b6:404:21a::11)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LY0PR11MB357627:EE_|PH8PR11MB9805:EE_
X-MS-Office365-Filtering-Correlation-Id: 833f1afa-6336-4cf3-78aa-08df4310dc4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|10067099003|56012099006|5023799004|11063799006|4143699003|260925022911599003|260925021911599003|260925021311599003|261026121527099003|261026140227099003|261028144727099003|261021135927099003|261022105027099003|261022075727099003|261021123027099003|261021121427099003|261102130727099003|261102123227099003|261009223027099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: QKKnsrNlDgdJPVdBjLH4uOI8CXyV2EnP7PbWylZExJt6emztzA6Y8+M6HWPT+qQsciWblQOb+pTC/RhKl5+LtNA/QUZHGCGrSkxFdMyWXMh7tkI5ywy4Pyhc0gvbfxSU9rXrbV9G2B3lD9A66VRgDM914x77C4jjkq2tOvYDV7NUTI1yKOf0ET4/uHfTQVacHqJYW2febzdncehyaZ2cxCI8GJAVH6dX+jIIPoUMaOhmntZFaq63rfV03nO/rRoyt5HHqpEgchjv5mW6jTXSBSzF5Hhw0VR6P+UqwvsjDiBsjkjKiXMWY6vg9rJxggiTXMvKnxtT901eyAV+pbH4OTBIZOCHiy7iO/7rRQTgDNaTrWpq5Fut42+pwqtPvHJR7G3kpNjF5aMoXWuGxx9G6slfDtyJgJ6ewFRw6hf2SkigO0k8mwlbV9HQXW03St8PpJtACqyhZgESbCS0LAgk9NkdgQq7ozuQqozlmQXxtNxZpkmDVehdmdMLKoxGtJnY45LeH61Sq/xsjbfUNEd9ecMBNrHorKKHwPe1AoQeSsOLP3X9Z+GwVo6PzHoqfqaVj39njeqhKvyp7hVtpLqdicJ5Kydz8dqR/814Cb4BvoOX5AKGBYPPNJbSKiuaaH60fsMudu2IvncMHkOnnVmfjpajKge7e6wrdN+uVV5zL10=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LY0PR11MB357627.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(10067099003)(56012099006)(5023799004)(11063799006)(4143699003)(260925022911599003)(260925021911599003)(260925021311599003)(261026121527099003)(261026140227099003)(261028144727099003)(261021135927099003)(261022105027099003)(261022075727099003)(261021123027099003)(261021121427099003)(261102130727099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(6133799003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YkFIK29MdTJDNXZYZWI2QURqaHZleTFIZUw5dEFUQnVlaFdlbngzNjFxMnlq?=
 =?utf-8?B?eWtLdUVjN2hIMWdVbjYyVUlxQ1pjUVJib0daSTJKU01zY2lNOER6Vzl4Y1ZR?=
 =?utf-8?B?d2hkalIzbE5aWGVDL2RvUEtDNjNUSG5nTDV6Tm42R2pWTm1hYkN3NWs1Z01X?=
 =?utf-8?B?MXRSM2wwZm1KNzk3bEptRFI5RUcxTUJOY1dtcTZLeXJNeTd4TEgrZHBZQU9D?=
 =?utf-8?B?TGhRMVY0NFN3bE5mM2gyTHo1ajRlTEJuRDIwWW8zSk8xcm5FUmFWeTh1RWxL?=
 =?utf-8?B?b2hyRUlrdzFUYno3ZDYwbXROczdjQTNza25vRndVT2IrYUp4aEpUbVhTRUR5?=
 =?utf-8?B?dHRYL0p5VUJPY0J1cmNJLzQvQldiemFza2dETUJRb1prV1RBYlJjYzRqQ3ZN?=
 =?utf-8?B?MlRyNnlUVUI1NGdNWUU1YW9OaWZSbXIxYkJLbXR0Q2U5dUh5enBWYXJBTlpL?=
 =?utf-8?B?OFBaZ3IvR08yUlJDV3M2ZmJ5R1VHNGhQelRFSTRoK1dObHpIWGtxd2tWSi92?=
 =?utf-8?B?VThNc2tLb3pwdmRNYklpeUFYY3BhQ01VVmFQak5XcmxEcmIweXdrRkNPUTU4?=
 =?utf-8?B?TmtuL1lodloyYjMvR1htSmJYbFJnNmg3dS8xRDRhUUo0RC92L0tUUzFUV3ox?=
 =?utf-8?B?WHkzb0k5OW9UeFlkTmw4SXh2M0RRajdtZ29xNVdLTnpyS3hXZWF2SEFjeTZv?=
 =?utf-8?B?NU55R3VZSlIvSG1vWU1rTHZJQU85RnZOdDF6ZExGTmh2M3dRSjkraU5CVnZX?=
 =?utf-8?B?UUkyQkcybXZqYzJtS2M1UVNRbWFWbHpWOHZNeEk5ckJndWdOUjNaZDBiZ1dS?=
 =?utf-8?B?M1QyNmZ2VkhjZWFKTTZON0tPMXZud1I0SDRGWnJ0RlJqWHpOSlNMQVRrUWI4?=
 =?utf-8?B?TzlyNWh3cHpPd2tmWWNzTi9uQWlYNkIxMGJZbnNhZ2JpTXM4WlNzVGdjejcy?=
 =?utf-8?B?ZHhSZWJab3BnWWhYeHdTN1U4MGpSNDlmQXV5ZWhiWk9LT1lOdjJuZ2k3eWkv?=
 =?utf-8?B?V0JQelkxRm1HaE9qVGxjVGhaMC9MUWNXb050S0ZtTkNOTmxpdWZoV0RmUTNC?=
 =?utf-8?B?RUV4RUxJQ2JMS0VCUFZMdzdCNWQyNW5VWkNlLzBFVlZZbFltOTVOWENEYjlS?=
 =?utf-8?B?dU8yQzNEb1NDQmgwc2lTSE5SdmV6MHNsVittNCtHb2kxWWY4SE9NRHpKUWs3?=
 =?utf-8?B?QmVDT1ZmQWZxRmFCUDdtcU1zNTdiUWJ2dHpqT2FPQUdLc1BvUkxpUjM5NDBO?=
 =?utf-8?B?RHVBQ0dESjFCczhpZ013bDIrb09hdUZ2UE1adURPYzhVK21OdEVOL0FQU0Jw?=
 =?utf-8?B?UEF5NFJBMU9PdWY3K2dmNm9KaUdlT25RV1RvelVpdGtLWkRoRFBnUzhtWlNL?=
 =?utf-8?B?U1pXakhSM2hJSFdtcTRnUEZpMlhkN0lUY3E3ekdqcy9kUEdhZ0NCTE05T3ow?=
 =?utf-8?B?TzFBVEFRTlRaNkVNMXAzQlZuL2llVGR5UW9nL2NRUWcvRGNhQVlIVTFiLzV0?=
 =?utf-8?B?TGJjelJEU2I2cW5IWlN4Qkh4M0w1Y2tQak1mbHpNR0dPamFqSVJYYXdKVWJx?=
 =?utf-8?B?NGJzREFSdk5aUjUyajdYaUJYYm9ISFVSa3BQNGhkazRvb1pBc3FFWElvbXpO?=
 =?utf-8?B?L3lTRWR0NEh4TGJmVkRWWGs5MzdYbFZQaGFrNE1kaGR6dmZGTzExZWVqTERH?=
 =?utf-8?B?ZjdEZ0p1M3c1ZDU5OEtpdjYvNU5IU2FEK2ZVVUk1R1ZBek0zYmwxWHp3NTBm?=
 =?utf-8?B?T3J2U1pRckhqbUhNT0xyTlJobXU0NnNGbEttYzMwWG9hbkxQZjVLclFPdVpv?=
 =?utf-8?B?djZxekRPdmdJTHl4bC9UUkU2ckpYaDVzNWJqL081dlowV0xjbUYvOUdaZHln?=
 =?utf-8?B?QWRIVTdvdTZrU3llNHhLMWVsdFVRYnBCbjJpWU9vdkJtVDNEMHpKSGd1ZlVB?=
 =?utf-8?B?WWdYcVhkU1U3Z3JrVWFiYVYyeGxLSHRveWs4T2FSY3hmUmp6MVJ3NG5INE9i?=
 =?utf-8?B?MjRtZ1dXbnJQVGpwZEN3QWV4OUZFSFlTVWhUNlUvN0Y0NVlzZFU2SGErdUtG?=
 =?utf-8?B?RVR2c09odzVrSmlXVzhta3VUUWxXRGxCQXFPdGNteXU4bWdLMDcrcFQxQTdj?=
 =?utf-8?B?OWZWOG5qVG85YjZsUmNpa1YwMi8rQnZVR2drazFXdlFQYitWTncyYkZ1VFpq?=
 =?utf-8?B?R3c3Qk5KNTY4K3RpSUtyVEQvYTFPR1dTUS9iczlYaXhBd2RNYmZteTJKUUtt?=
 =?utf-8?B?bHJ3TFFkL3JvcjRFS1U5TjJCUzZyZXR5dmZuYUYvOHFiT3p5a0FDR3FwSnlm?=
 =?utf-8?B?TVNxOGJwcmtpY0d2cXVYMDNPbTRtUFpRSXB1NWhKUUdQRU9GcXh5dDJLa0ZD?=
 =?utf-8?Q?oUaKJ+Tv9Dw1oDB4=3D?=
X-Exchange-RoutingPolicyChecked: MtwWA4rCpIEk2usxpJ/QeedaH/Frxu+/4eHsVLTYsL8zeFdTrT60yaAywrfewTaGVqxHFaWWMPqq+2jOPYK3k71i6I15TmyNn3XkfUKqdPa7tmoMpEFrRAtUSZ2CKApOsALAJpURGpLr6FVuNPlT6i/+6DsrN/xqu3II1jiBhcpdB10ODPv/MAHX905FVt33Q7iMAoR8SwVZsA7h+4rUL3HDEWf2lh+De4QJGsvJ77/8W3JlcRunMKXElMvqy21oCD3PZSV8pYdP7odrGqaMQfZhX/dbKd1OuJxKYIdEWtLf9hJpv3KnvKJpYhH/1dsYNmzbVrrJZ8szafpaGxsN+g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 833f1afa-6336-4cf3-78aa-08df4310dc4b
X-MS-Exchange-CrossTenant-AuthSource: LY0PR11MB357627.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2026 12:06:20.4979 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XB3tW2BDmE4r+bHhXcLrmpPAqADrE5p+4r0+C0Mrtds4Qh9DT/dwL1KDDbHKJrQXtbBgsXJTPV0BJ97NTUamE4OkNoKQc4uuqYz4XaiSTDg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB9805
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/3/2026 3:28 PM, Arun R Murthy wrote:
> Xe3p has a DP link layer (LL) symbol based timing generator, which
> makes the per-line symbol insertion for 8b/10b MST and 128b/132b
> SST/MST compliant with the DP 2.1 hblank symbol cycle count, reducing
> the line-to-line hblank jitter that some sinks can't handle.
> 
> The Data M/N registers are 128 bits wide, so the Data M/N is computed as
> 128 bit values, without reducing them apart from the GCDs of the pixel
> clock/link rate and of the SSC efficiency, to keep the full precision.
> 
> The timing generator is not used (yet) with the MSO/eDP splitter, and if
> the values don't fit the hardware the pixel based timing generator is
> kept. The Min Hblank mechanism must not be used together with the symbol
> timing generator, so clear min_hblank when it is used.
> 
> v3: Move crtc parameters, checker and dump to new patch (Suraj)
> v4: dpcd caps bases ssc capability => intel_panel_use_ssc (Suraj)
>      Use gcd() from linux/gcd.h
> 
> Bspec: 68922
> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_dp.c     | 171 ++++++++++++++++++++++++++++
>   drivers/gpu/drm/i915/display/intel_dp.h     |   3 +
>   drivers/gpu/drm/i915/display/intel_dp_mst.c |   6 +
>   3 files changed, 180 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index db7c8fcc8683aae1a2bc7050ef7c87ed5155c8dc..788c16df9801131294c73420c2c0d4d3ec848310 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -26,6 +26,7 @@
>    */
>   
>   #include <linux/export.h>
> +#include <linux/gcd.h>
>   #include <linux/i2c.h>
>   #include <linux/iopoll.h>
>   #include <linux/log2.h>
> @@ -1269,6 +1270,12 @@ bool intel_dp_has_dsc(const struct intel_connector *connector)
>   	return true;
>   }
>   
> +/* The symbol based timing generator is used for 8b/10b MST and 128b/132b SST/MST */
> +static bool intel_dp_has_symbol_tg(struct intel_display *display, bool is_mst, bool is_uhbr)
> +{
> +	return HAS_DP_SYMBOL_TG(display) && (is_mst || is_uhbr);
> +}
> +

This decides whether the symbol TG is used rather than whether it's
supported, so maybe rename it to
intel_dp_use_symbol_tg().

>   static int
>   intel_dp_get_max_m_n_ratio(struct intel_display *display)
>   {
> @@ -3734,6 +3741,165 @@ int intel_dp_compute_min_hblank(struct intel_crtc_state *crtc_state,
>   	return 0;
>   }
>   
> +/* Number of symbols the transcoder link layer processes in a symbol cycle */
> +#define LL_SYMBOLS_PER_CYCLE	4
> +
> +/* 64 x 64 -> 128 bit multiplication, result as {lo, hi} */
> +static void intel_dp_mul_u64_u64(u64 a, u64 b, u64 res[2])
> +{
> +	res[0] = a * b;
> +	res[1] = mul_u64_u64_shr(a, b, 64);
> +}
> +
> +/* Compare two {lo, hi} 128 bit values */
> +static int intel_dp_cmp_u128(const u64 a[2], const u64 b[2])
> +{
> +	if (a[1] != b[1])
> +		return a[1] > b[1] ? 1 : -1;
> +
> +	if (a[0] != b[0])
> +		return a[0] > b[0] ? 1 : -1;
> +
> +	return 0;
> +}
> +
> +/* Compute the DP link layer (LL) symbol based timing generator parameters */
> +int intel_dp_compute_symbol_tg(struct intel_dp *intel_dp,
> +			       struct intel_crtc_state *crtc_state,
> +			       const struct drm_connector_state *conn_state)
> +{
> +	struct intel_display *display = to_intel_display(crtc_state);
> +	const struct drm_display_mode *adjusted_mode =
> +					&crtc_state->hw.adjusted_mode;
> +	struct intel_connector *connector = to_intel_connector(conn_state->connector);
> +	struct intel_dp_symbol_tg *tg = &crtc_state->dp_symbol_tg;
> +	bool is_uhbr = intel_dp_is_uhbr(crtc_state);
> +	int symbol_size = is_uhbr ? 32 : 8;
> +	int hactive_cycles, hblank_cycles, chunk_cycles = 0;
> +	int hblank_pixels;
> +	int dsc_slices, link_bpp_x16;
> +	u32 ch_num, ch_den, ssc_num, ssc_den, spread_x1000, link_rate_mbps;
> +	u32 rate_gcd, ssc_gcd;
> +	u64 data_m[2], data_n[2];
> +	int ret;
> +
> +	memset(tg, 0, sizeof(*tg));
> +
> +	/* The symbol based timing generator is used for 8b/10b MST and 128b/132b SST/MST */
> +	if (!intel_dp_has_symbol_tg(display,
> +				    intel_crtc_has_type(crtc_state, INTEL_OUTPUT_DP_MST),
> +				    is_uhbr))
> +		return 0;
> +
> +	/* TODO: Support the symbol based timing generator with MSO/eDP splitter */
> +	if (crtc_state->splitter.enable)
> +		return 0;
> +

As Suraj pointed out on v3, MSO is only used with 8b/10b SST, where the
symbol TG doesn't apply, so this can't happen and could be dropped (or
at most a drm_WARN_ON()). The TODO here / "(yet)" in the commit message 
suggests pending work, which isn't the case.

Note that nothing today prevents an MSO panel from using UHBR rates, may 
be the spec guarantees it, if so that should perhaps be enforced 
separately. But that is for another day.

> +	ret = intel_dp_compute_dsc_slices_and_link_bpp(crtc_state, connector,
> +						       &dsc_slices, &link_bpp_x16);
> +	if (ret)
> +		return ret;
> +
> +	if (crtc_state->dsc.compression_enable) {
> +		int slice_width = DIV_ROUND_UP(adjusted_mode->hdisplay, dsc_slices);
> +		int chunk_bytes = DIV_ROUND_UP(slice_width * link_bpp_x16, 16 * 8);
> +
> +		chunk_cycles = DIV_ROUND_UP(chunk_bytes * 8,
> +					    LL_SYMBOLS_PER_CYCLE * symbol_size);
> +		hactive_cycles = dsc_slices * (chunk_cycles + 1);
> +	} else {
> +		int hact_width = adjusted_mode->hdisplay;
> +		int pix_bpp_x16 = link_bpp_x16;
> +
> +		/* YUV 4:2:0 without DSC: half the Hactive at twice the bpp */
> +		if (crtc_state->output_format == INTEL_OUTPUT_FORMAT_YCBCR420) {
> +			hact_width /= 2;
> +			pix_bpp_x16 *= 2;
> +		}
> +
> +		hactive_cycles = DIV_ROUND_UP(DIV_ROUND_UP(hact_width, LL_SYMBOLS_PER_CYCLE) *
> +					      pix_bpp_x16, 16 * symbol_size);
> +	}
> +
> +	hblank_pixels = adjusted_mode->htotal - adjusted_mode->hdisplay;
> +	hblank_cycles = DIV_ROUND_UP(DIV_ROUND_UP(hblank_pixels, LL_SYMBOLS_PER_CYCLE) *
> +				     link_bpp_x16, 16 * symbol_size);
> +

Nit: please use crtc_hdisplay/crtc_htotal throughout this function, to 
match crtc_clock and the timings programmed into the transcoder.

> +	/* DP 2.1: the minimum Hblank is 5 LL symbol cycles for 8b/10b, 3 for 128b/132b */
> +	hblank_cycles = max(hblank_cycles, is_uhbr ? 3 : 5);

Bspec also takes the Rx minimum Hblank into account here:
MAX(computed, Rx_Min) if DPCD 0221Ah[4] (8b/10b) / 0221Bh[4]
(128b/132b) is set, with Rx_Min = [3:0] + 5 / [3:0] + 3.

> +
> +	if (hactive_cycles + hblank_cycles > TRANS_LLSYM_HTOTAL_MASK + 1 ||
> +	    chunk_cycles > TRANS_LLSYM_CHUNK_SIZE_MASK) {
> +		drm_dbg_kms(display->drm,
> +			    "LL symbol timings out of range (hactive %d, hblank %d, chunk %d), using pixel TG\n",
> +			    hactive_cycles, hblank_cycles, chunk_cycles);
> +		return 0;
> +	}

Modes whose LL symbol timings don't fit these registers should be
pruned in mode validation, like the transcoder timing limits in
intel_mode_valid(), rather than being accepted and then silently
falling back to the pixel TG. More on it later.

> +
> +	if (is_uhbr) {
> +		ch_num = 1568768;
> +		ch_den = 1622115;
> +	} else if (crtc_state->fec_enable) {
> +		ch_num = 51200;
> +		ch_den = 65537;
> +	} else {
> +		ch_num = 8;
> +		ch_den = 10;
> +	}

Nit: It would have been nice to use some drm helper here. Unfortunately, 
drm_dp_bw_channel_coding_efficiency() rounds the value and does not 
consider FEC.

> +
> +	/*
> +	 * spread_x1000 is the spread in % multiplied by 1000, so 500 means 0.5%.
> +	 * ssc_den * spread_x1000 / (200 * 1000) is ssc_den * (Spread_Amount / 200).
> +	 *
> +	 * With 0.5% spread: 100000 * 500 / 200000 = 250, so ssc_num = 99750.
> +	 * The efficiency is 99750 / 100000 = 0.9975, which equals 1 - 0.5 / 200.
> +	 * With no SSC the spread is 0, so ssc_num = ssc_den and the efficiency
> +	 * is 1.
> +	 *
> +	 * SSC is used only if both the panel/VBT policy and the sink allow it,
> +	 * same as for the PHY PLL programming.
> +	 */
> +	ssc_den = 100000;
> +	spread_x1000 = intel_panel_use_ssc(display) &&
> +		       intel_dp->dpcd[DP_MAX_DOWNSPREAD] & DP_MAX_DOWNSPREAD_0_5 ? 500 : 0;

SSC does not apply in TBT alt mode, where the TBT PLL is used with SSC
disabled (intel_lt_phy_tbt_pll_calc_state()). So while making the
decision here we might have to take into consideration which PLL will
actually be used, i.e. the TC mode (see icl_update_active_dpll()),
otherwise it might lead to the Data M/N accounting for 0.5% spread that
isn't there, which with the symbol TG most probably results in frame drift.

However, the fact that the active PLL is selected at enable time 
complicates things.  One option would be to do the same as for the PLLs: 
compute the Data M/N for both the SSC and the non-SSC case, and select 
the one matching the active PLL, with readout comparing
against the variant matching the PLL's ssc_enabled.

> +	ssc_num = ssc_den - DIV_ROUND_CLOSEST(ssc_den * spread_x1000, 200 * 1000);
> +
> +	/* The link rate in Mbps, port_clock is in 10 kbps units */
> +	link_rate_mbps = crtc_state->port_clock / 100;
> +
> +	rate_gcd = gcd(adjusted_mode->crtc_clock, link_rate_mbps);
> +	ssc_gcd = gcd(ssc_num, ssc_den);
> +
> +	intel_dp_mul_u64_u64((u64)(adjusted_mode->crtc_clock / rate_gcd) *
> +			     LL_SYMBOLS_PER_CYCLE * symbol_size * ch_den,
> +			     (u64)(hactive_cycles + hblank_cycles) * (ssc_den / ssc_gcd),
> +			     data_m);
> +	intel_dp_mul_u64_u64((u64)(link_rate_mbps / rate_gcd) * crtc_state->lane_count *
> +			     adjusted_mode->htotal * 1000,
> +			     (u64)ch_num * (ssc_num / ssc_gcd),
> +			     data_n);
> +
> +	if (intel_dp_cmp_u128(data_m, data_n) > 0) {
> +		drm_dbg_kms(display->drm,
> +			    "LL symbol data M/N ratio exceeds 1.0, using pixel TG\n");
> +		return 0;
> +	}

IMO, the symbol TG's bandwidth needs to be accounted for the same way 
the pixel TG's is today, instead of being checked only after all the
bandwidth decisions have been made.

For the pixel TG, mode validation, link config/bpp selection and the
slot/PBN allocation all use the same model (intel_dp_link_required() /
intel_dp_mst_bw_overhead() -> Data M/N -> TU), and the programmed Data
M/N is derived from the same numbers. So a config that passes the
checks is guaranteed to fit its allocation: tu <= 64 for 128b/132b SST,
and slots <= total_avail_slots for MST.

With this patch the symbol TG Data M/N is computed afterwards from the
exact SCR timings, while the link config, TU and PBN are still sized
from the pixel TG estimate. That estimate doesn't include the SCR
rounding (the 4-pixel group padding in HACT, the rounded-up
EFF_HBLANK), so nothing guarantees that the symbol TG Data M/N fits the
reserved slots.

To get parity with the pixel TG, when the symbol TG is used:
- compute the symbol TG Data M/N as part of the link config / bpp
   search, and fail the candidate config if it doesn't fit, so the
   search moves on to the next bpp or link config,
- derive the TU (and from it the PBN) from the symbol TG Data M/N,
- use the same computation in mode validation, so the modes we expose
   match what compute_config will accept.

Also, I don't think falling back to the pixel TG here (or in the
out-of-range and MSO cases) is the right approach. The pixel TG is the
legacy path and may not be available on future hardware.
We can, however, keep a debugfs knob (to be used in 
intel_dp_*use*_symbol_tg()) to fallback to pixel TG if we encounter 
sinks that turns out to have issues with the symbol TG or if the spec 
asks us to.

> +
> +	tg->enable = true;


For bisectability, it would be better to only enable the symbol TG once
all the pieces are in place.

> +	tg->hactive = hactive_cycles;
> +	tg->htotal = hactive_cycles + hblank_cycles;
> +	tg->chunk_size = chunk_cycles;
> +	tg->data_m[0] = data_m[0];
> +	tg->data_m[1] = data_m[1];
> +	tg->data_n[0] = data_n[0];
> +	tg->data_n[1] = data_n[1];
> +
> +	/* The Min Hblank mechanism must not be used with the symbol TG */
> +	crtc_state->min_hblank = 0;
> +
> +	return 0;
> +}
> +
>   int
>   intel_dp_compute_config(struct intel_atomic_state *state,
>   			struct intel_encoder *encoder,
> @@ -3834,6 +4000,11 @@ intel_dp_compute_config(struct intel_atomic_state *state,
>   	if (ret)
>   		return ret;
>   
> +	/* Clears min_hblank if the symbol based timing generator gets enabled */

To make the dependency explicit, I'd compute if the symbol TG is in use 
first and have intel_dp_compute_min_hblank() return early if it's used, 
both here and in mst_stream_compute_link_for_joined_pipes(), instead of
clearing min_hblank as a side effect.


> +	ret = intel_dp_compute_symbol_tg(intel_dp, pipe_config, conn_state);
> +	if (ret)
> +		return ret;
> +
>   	/* FIXME: abstract this better */
>   	if (pipe_config->splitter.enable)
>   		pipe_config->dp_m_n.data_m *= pipe_config->splitter.link_count;
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.h b/drivers/gpu/drm/i915/display/intel_dp.h
> index 1f4a3aff9abebdb2bf8cd17a77231e5af66f47ac..352c656299e3b2d81e0612a71da6247d02b5aa17 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.h
> +++ b/drivers/gpu/drm/i915/display/intel_dp.h
> @@ -215,6 +215,9 @@ int intel_dp_dsc_min_src_input_bpc(void);
>   int intel_dp_dsc_min_src_compressed_bpp(void);
>   int intel_dp_compute_min_hblank(struct intel_crtc_state *crtc_state,
>   				const struct drm_connector_state *conn_state);
> +int intel_dp_compute_symbol_tg(struct intel_dp *intel_dp,
> +			       struct intel_crtc_state *crtc_state,
> +			       const struct drm_connector_state *conn_state);
>   
>   int intel_dp_dsc_bpp_step_x16(const struct intel_connector *connector);
>   void intel_dp_dpcd_set_probe(struct intel_dp *intel_dp, bool force_on_external);
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> index 1e6190689e6b2616ed850d61c5bfbf60a62c5422..81ac454603603df42db477ddb26cfb2f620dcfea 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> @@ -732,6 +732,12 @@ static int mst_stream_compute_link_for_joined_pipes(struct intel_encoder *encode
>   	if (ret)
>   		return ret;
>   
> +	/* Clears min_hblank if the symbol based timing generator gets enabled */
> +	ret = intel_dp_compute_symbol_tg(connector->mst.dp,
> +					 pipe_config, conn_state);
> +	if (ret)
> +		return ret;
> +
>   	return 0;
>   }
>   
> 

