Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DDF8606A31C
	for <intel-xe@archiver.kernel.org>; Fri, 27 Nov 2026 05:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YdnA0Ao3;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=Diqhy3lD
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A8E810E2C4;
	Fri, 27 Nov 2026 05:54:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93FDA10E2C4;
 Fri, 27 Nov 2026 05:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795758881; x=1827294881;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=w43hfgjKuhxpI9SLZpLDTkG3IPl4jxvsJsHK3oRAc6Y=;
 b=YdnA0Ao3t5ojrc3ItRtDX8UMVvmqAC8Vi5QeVjRamAti3shi8hn2z26W
 eXEGbX1S/yHaTXO10D7tc6S34/CsmmtM+7CkaQyICSPQtmsdOabqF2mOP
 CjfHir1VxOlq6JsSRYo++CKsZWJ9K9VR9kAMeRak8Qa219PxLKsA4gsSO
 Ka5sDYfithKNP+IP/PaAIJnVPdCnf+mY5XppzQV38TyWBUGKrvP+oJqdE
 hSIzsdPSo/oVrHAzO39iLHot2+p76kOEx3nUOap6rqkMkPtxHyHqmhfxo
 AHiKEH7k/bwpp3kKnipHFsaKbo7QiB4H2ec7sjDbR+VqS45NHx/SlkVqX Q==;
X-CSE-ConnectionGUID: eObz5DF8Q3eQHlC88tdkrQ==
X-CSE-MsgGUID: fO9ekO21RM6Prlu0qsCw7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4560013"
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="4560013"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 21:54:41 -0800
X-CSE-ConnectionGUID: 7ci24C6JS2C1KQTVeTIiBA==
X-CSE-MsgGUID: zL3Zpx9WReeUz13d7ixZuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; d="scan'208";a="12626219"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 21:54:41 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 21:54:39 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Thu, 26 Nov 2026 21:54:39 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.10) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 21:54:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X1TF7XoVh+qRvNdS2YmduU/vRp02qZIfDcmx0P+Iwd21KPF+Gz5kuQnNdzvj2OJD89Q3xyNrgwCC3Dtl5boN9dsBYzAUKQDzcnVEAfxK53ujRSNvqE31LRL3cm0s46m7G/Apk1WUCMjEe/ZFLgagW11d60WjeLL0oi/scOaOEb/Mbcc07KzEEwTgxVnzo6vJiGoLWZL4/3jf02JcDJvunCIttzt34xC+/YPshoeEt3axZQVjOY+JLFxdT9Q9ZgDg+4UPcMaH7UBb10xU6XNKr5hG3krjVCXsTIy3CICGWSFCV8PrHGinN+QIqBi2rT9py1c0b1hCcrTZP6S/Klpk2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=opq7c2WatkUu+aQyxmBDsPH7SO1jHKvdQO2c/sgFe8Q=;
 b=bSHCAU6eOen9ZYUli3M9IX6Q7Y2wz+puGkkaxfIJZKwMlqp+OcliMba59gfZK9v1+U2aM2afN9qlXrWDzzcOMzlnwK3dQDNkE0h0gColsOWpDcPG3o07b97CAmbthokmegJq+u6rmLtzGZxDJm4SV5XrspE2rclZcDzgVU+W+WRlYrv1Z9SsvF1gmNS25/Pu2dXbim6widhSxLhzzexvcWAdgVNgMzJi2Q5dRmOiV4jvGwqDa+zTrqxpILv6C9qUVv/a1v7mbIwXPPG21ypoHFrNp6tM5IcjT8MY3bJxNKEIss7UGlZak4qLQnMfYMXLk7uHBibFfT1Ih9Nmhja7vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=opq7c2WatkUu+aQyxmBDsPH7SO1jHKvdQO2c/sgFe8Q=;
 b=Diqhy3lDfIQVTlXdZ04mKSALHr/ppE35dUiRiVruvww3cwZvKST/E88Qvy19+4h897dtz/7A3cXVQc+mvoRmw1w9vwYMtseGjTbCqC8cbfSD9IIQqCl1gzuVhgWnOX28OQpIdcVYaI//bQIm3vVbz2ctVqJdkPkj0Mpl3+Wy1CA=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV2PR11MB148960.namprd11.prod.outlook.com
 (2603:10b6:408:40f::21) by IA3PR11MB9397.namprd11.prod.outlook.com
 (2603:10b6:208:573::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Fri, 27 Nov
 2026 05:54:37 +0000
Received: from LV2PR11MB148960.namprd11.prod.outlook.com
 ([fe80::9761:b20d:6f27:5460]) by LV2PR11MB148960.namprd11.prod.outlook.com
 ([fe80::9761:b20d:6f27:5460%5]) with mapi id 15.21.0662.004; Fri, 27 Nov 2026
 05:54:37 +0000
Message-ID: <d046755b-e555-491c-ac78-5b6ed6613669@intel.com>
Date: Fri, 27 Nov 2026 11:24:30 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/13] drm/i915/vrr: Drop bogus intel_vrr_hw_value() call
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 <intel-gfx@lists.freedesktop.org>
CC: <intel-xe@lists.freedesktop.org>
References: <20261023165803.31016-1-ville.syrjala@linux.intel.com>
 <20261023165803.31016-3-ville.syrjala@linux.intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20261023165803.31016-3-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0059.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b8::14) To LV2PR11MB148960.namprd11.prod.outlook.com
 (2603:10b6:408:40f::21)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR11MB148960:EE_|IA3PR11MB9397:EE_
X-MS-Office365-Filtering-Correlation-Id: 93246ecb-3070-4d9d-4976-08df4c4aeb91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|261026121527099003|10067099003|11063799006|56012099006|4143699003|261009223027099003|261021121427099003|261102123227099003|261021123027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 1wB9xVxtoiDkmmC74zwAHzLf3eN1vIYRuNVAvHXZ9IGkqgUcPTdIkC3bTyv6JiuXtwvP2AaNX2xmt5bQUYl4voJEo6TFFBJPyt18wbe+mmcuMb2IBekLF2n+g8y9B9yd6E+anc1+wFLGqWY6l1MtMrGsRbQH429jYKC1y2LBpC35kTkGR3kozHwNoHmpz0P1tmlY5H9MZmKgyshEJlkZyhI7FnMvuXz/tpcAeCUbcSdP+wk2XfsQfhAByXUdqIRIM/x5hoCjnq/ECq/ZrFfqQj/fhT3mLbRPfDJf1uSg2/Gunt18ErxY8anjBzRO0a4qhLyzRX4FHDq52GzKOONTl8lEaq6/w9BKIkrxYb6D9TKST+QOI9uKK15Pb0aaNcplSx+N+9EiUkcjYaSilsWlRTTE4hpOAtO6QpkbqgzC1Fiq9EyKp4Ki+AQEhVYgzw0f/rUWxZ9Ck7r1Nn9Py/bY+FQExF3GmXGk5P6V0kuRRlZyOBcN3+PiL5pDU4kKglxMAvZInNhuPapIvkn9ybAyfbpIbYLjM2PvGG2z4K28et88WvhUU3VNtAnxXrWt53jVxVAB/MhLfNHhBcXrqAEslcAmQH1IplitaR6P8we2i0S8cG10JkrG9K2TExezLcVs7ZBnE618XZwQcqGj0qboZVvABUhEG90aTYrVJViapko=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR11MB148960.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(261026121527099003)(10067099003)(11063799006)(56012099006)(4143699003)(261009223027099003)(261021121427099003)(261102123227099003)(261021123027099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a2N6NHp1WU1QTmhwRFBOd3hPUUpLTWhVMWxEV3MxOUZmOXY3Q1NqZk1PcCtD?=
 =?utf-8?B?eXBvVndrWVNaM3ZDVjNIai9HS29VREhMZDVQUExIcW9MRFRnQVVPVDRXSnBW?=
 =?utf-8?B?ZTdVMTJMQTRmTkxQWmZyOUxOWXdvMVRoL2RhU1IvbnhxWTBvazBaUEJkY1Bk?=
 =?utf-8?B?eHl5QUcvOXVJd2I1UXExVDAyM0d5empNL2xiWjJxWi81dHhyZDRkZ0pDL3BH?=
 =?utf-8?B?eDJQM3RkVlFCbXpoVlU3VTlZNkNBY2wwZlhJVXZTSnVaSEJlWExLbDE2SUVF?=
 =?utf-8?B?cVhlSUxuN2tydElVaERjUGJMRHhSaFhVblUvbXlCVDIzTzZCK3NUL1VxUEV4?=
 =?utf-8?B?RzNLSWRrSlU0eWRvZ3J6N1QzWW0zdTRKNjJjbWNwbkhESEt4MDFNSEl1TlJn?=
 =?utf-8?B?ZFNMQzNJR1ZKd1hDTGFlQjVvMUYwcTNhWmNWT2RIQmdoem9EY0hsWGYzdm5r?=
 =?utf-8?B?ejFDVmRpYmdBKzl4M1h2NDJkZDYwN0ZuN3BLS3lFNDl5NDNBZDZLNVlpSHNn?=
 =?utf-8?B?alpMa1NSS1U3ZFlaempoSTBMU1NsSFJwdjZleDVEMmtxeUhnc0pqOWd4MGhI?=
 =?utf-8?B?ekZPV21HZFR4SCtKOXVDYU5tOVNyUHN4RWRDQjNRVVp0aHNsTEQ5NXRlSHhL?=
 =?utf-8?B?eC9HZVowYVhWbXB2dlRscEdseEozM2kzWHJGVGZOM21ZNVloWjNoZW9VWmtD?=
 =?utf-8?B?MHpwRzFSQkJzbSsrZzNCandOSHYwUFhJd1ZrbEpnT3NmeVNvR3ZZeXpEVkxL?=
 =?utf-8?B?dk5Za1p2M1hxRjgxbElYNDNzUVQ0VVowWE5sbE1pc2VpUTV6blBjRFA1bjlj?=
 =?utf-8?B?N3VXeWxDcTgrKytodncxM3FrUTFjbGNXQm1sNTNrTXppa09BamhuMG9QY1BF?=
 =?utf-8?B?ZFZQRGZtN0xvYUp4SHgrN0hJdW5rbXNNTFE3TmdaSTlySTI2OGlyWjE2OEhh?=
 =?utf-8?B?aDUyU0hidlRkZVp3ai82dytVd2VxbW9KVVdSNWNGKzRheEpFY0prWGpPQmZG?=
 =?utf-8?B?MWhGUkptSzhvdXJDbWVRL3JYeGlMcVZ0OVhpdjloSE9OaTNUTHdlSlpVckFD?=
 =?utf-8?B?RG1qT0wvZS9WVFZpaDYvUWt5djJnZjE1MWwvRkl0ejBFVGtkYTFJaGk1Q0Zy?=
 =?utf-8?B?QUFBbFdGNjkyckcxTGdxNHFMNTVMb0FxWFdxbEw2MHRrUnJGdVg3Nm4rL2lE?=
 =?utf-8?B?TWI5RHNpUVBrY3didFJoemdPTEhuMmk0djFnWUJoN2VZV3JMRWlnaWVjaUJn?=
 =?utf-8?B?Y0RWRHJEaXNxUlFHcW9mVzNZOGNwSmF2VTVjQzE5dHZleG5kaXhneFhuS2Nr?=
 =?utf-8?B?cUNwNThsSUNnOWFJRDQ4YzdWNzJqamJIU3JlZFhpcFJxdGhELzNVdlpVbDhM?=
 =?utf-8?B?TzhZR2xBclI3bWpaZW5CZGxFcDEzNEFUbUJ2dzBlWmdkcWk1S2dkSXlUUGF6?=
 =?utf-8?B?cG5VUWI1eEk3b0FzZXlKWWl5RzhBeWowenMreUJaQzJLUjh3VDNxM0NLdVFZ?=
 =?utf-8?B?dU9oaVdaTTFxZnA2Zkl6Q3JWOGhXQnVrZGlwZTd3U1l6MnBlTlExeElDVDdu?=
 =?utf-8?B?TWNCYlltVE5WODUyRTJrSmNZcnRmUTZRN21vN3FrN3E4US9walExZXNsV3dE?=
 =?utf-8?B?TU1PY0JBeEVQSkErMUhSeUxLZ0o4WjNrWWIvVkxmeTF1ZkFZQXdoWEtma25n?=
 =?utf-8?B?K01pQXU3WEdXTk5zU2hkYksvb0laK3hmcHI3T25GZ1hnVHJXY2pDaDNxWXJm?=
 =?utf-8?B?STFpZndKbGMyU3VVS3J5RVFQTjlCdkNyZjc5TStrZUwweUQ2b1VLa3VyRUhs?=
 =?utf-8?B?U2hIM21VbzM1NkIxZ2hEeEhEQUJWZ0VBSTVsSU9MZHZHVHVrcWVBVWJQTStT?=
 =?utf-8?B?YS9YU25qM3A0UTF6MGNCZzYzd3hlVHFEM25CaEhZbWN4QVh6aVNEMW5MTFJU?=
 =?utf-8?B?eG03eVZzaGJiTVhWVUFtMnQwT2FTekpoTG0wZ052cVBDM0NKWkszb2o1VlFp?=
 =?utf-8?B?RXNLT1Iya3hmUkZSZWlwTnJrczdwQ2UvM3hrZHRGZzJLYjZheGNidGZ4a0lL?=
 =?utf-8?B?N1lPWWEybHJ6ajZidFNNc1J0c0tMakVGLzE2NlA4N2Z6ekxydUFVb1QrUXN6?=
 =?utf-8?B?UXhuTUtmeVdxN0dFK1lQNm9YRGJxd1Zha3JmV3RqQXpEZ3lkQWlueDE5RnNW?=
 =?utf-8?B?Vk5jRU5PbGhiNDRkZTFMRStjVzBMOWxGMm5kU2lIeERyYzFFelVMbHlHWGpp?=
 =?utf-8?B?VUduK0ZyanhtQVBhdkdDUzBxSVR6cG13aW1ic0pYQXRDdnlVQSs3V1VQVXVC?=
 =?utf-8?B?UndqZ3ByNm1WNTFZcW1jVGx4ck9Wb3dFeUl0R0FKR2h1MC9ackJ5YSs3aHpS?=
 =?utf-8?Q?3iE4umSZpuYZimfw=3D?=
X-Exchange-RoutingPolicyChecked: mmpUilvCk8GD4WuoWY7pzISpkVhKTMVd9O+ziiy7JKxYpeaSEm9Zi81eliwig9Hrt4+HA9xIHThoTPsO9J9z7j+Y16ygJipUWn7PLELrQbPRMWSd4CGLwaMhNj4B1jJ0nu6bwzlaGfNl1lnJhkkBPDehuVTb102kTkTnY3zqfoSaw7Mofji6FLkJtHL6TI7QpsGf6dwchPxU7ybfQnwERnCPGfSwceVwNGXEwwuoZM2PaVN3IANKZAd5ur0ln8llAA80McQH2d0eTFoQGsDgOpxyiyreNw4qqs2GTjyJkAuJJNKHW+ewwMlt0rV4Bnu4Y4+i/OGJR3UqGTdFtO4b7A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 93246ecb-3070-4d9d-4976-08df4c4aeb91
X-MS-Exchange-CrossTenant-AuthSource: LV2PR11MB148960.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 05:54:37.6197 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 04DN1VkRxg/6u/HeaCnn0XBVL/zCJ8EX3KzCEcRsOrmRz9EEtuDRNEj4akDmEaAbI1/6FmWWy0QJoee7BH/coGM5/3EvwXEav4oEe6jhY2s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9397
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


On 10/23/2026 10:27 PM, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
>
> intel_vrr_vblank_start() is used for the hw->sw direction
> by the DC balance code, however intel_vrr_hw_value() is
> meant to be used for the sw->hw direction. Drop the bogus
> intel_vrr_hw_value() call.
>
> This isn't actually causing any problems since on ADL+
> the hw<->sw conversion is a nop, and the DC balance code
> only applies to PTL+. The DC balance code doesn't
> use intel_vrr_hw_value() for the actual sw->hw
> direction either, so the ADL+ hw behavior assumption
> is already baked into the code.
>
> And rename the somewhat confusing 'vmin_vmax' parameter
> to just 'vtotal' while at it.
>
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>


LGTM.

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

> ---
>   drivers/gpu/drm/i915/display/intel_vrr.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
> index e59345bd1d33..8dfebcbaf8b5 100644
> --- a/drivers/gpu/drm/i915/display/intel_vrr.c
> +++ b/drivers/gpu/drm/i915/display/intel_vrr.c
> @@ -312,9 +312,9 @@ static int intel_vrr_hw_value(const struct intel_crtc_state *crtc_state,
>   }
>   
>   static int intel_vrr_vblank_start(const struct intel_crtc_state *crtc_state,
> -				  int vmin_vmax)
> +				  int vtotal)
>   {
> -	return intel_vrr_hw_value(crtc_state, vmin_vmax) - crtc_state->vrr.guardband;
> +	return vtotal - crtc_state->vrr.guardband;
>   }
>   
>   /*
