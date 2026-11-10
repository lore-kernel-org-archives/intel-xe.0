Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55204606A321
	for <intel-xe@archiver.kernel.org>; Tue, 10 Nov 2026 23:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KXTiMeQ2
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1570910E9AE;
	Tue, 10 Nov 2026 23:25:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C45D10E9A6
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Nov 2026 23:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794353115; x=1825889115;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=OB6rQIftn+ii9OpwnY8lVon7OEGSxim8rHzzPx/gvbs=;
 b=KXTiMeQ2kDbU4ES2tn3KFRyVqeL2etazN6vEgPrqyJn4Eta8Ox19OfpM
 7H5GACNuTuWBgSowV8foo10o7qtHOcyp2vkjCi9H5qJLQMMJwsOD1DLXz
 6jUkk/Fa9hLG0OblmkkR4IsXcP2d5CwpbuQq1wR86mmCEH15KKu/R741S
 gcKPJQNUSyJbwveaQw/J7z/OGCzyzOrGvMu3GnY8vrjCqFaCfqCOtnq0L
 t/3AnpJAa026mh1fDHP9yEksu5/T7noZ0AYjs5yTt+NtM4xv5T4KWumpt
 LaAgvgvpyYnOlu1NZk1aD3JcIyosghx2EK7AIpKuUQMDf4ZP8yiqOd7Lf A==;
X-CSE-ConnectionGUID: ZtUM6H3TSPiLvf15IzbRdQ==
X-CSE-MsgGUID: VAoAAmY0Q3S40MAqtlgLeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="2994702"
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="2994702"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 15:25:14 -0800
X-CSE-ConnectionGUID: lEX5thrOSDW/qYzB1vCzEQ==
X-CSE-MsgGUID: ptIhjogmQQiKDP0sM4s+/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="8438235"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 15:25:13 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 10 Nov 2026 15:25:11 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Tue, 10 Nov 2026 15:25:11 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.47) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 10 Nov 2026 15:25:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cXjj+Wm1DxscWYWX4n26N6V5cNIj8tRYhm85KgFzJ2wSL91BQJrIty6JjSY3IA4Zs0VnXfhmTeLTrR1cqzI+oaN+ZNz/1WQ8kSt4m2+OqLa6xFhF9MA32e3FKrVHhXMMsyfuv2WoPRFuD6Frft2ikO28KAhVSbBwr6QFjgxV9RqOmcshBKE6V/NfqHO2AsgI3a2GTpZy1iNBaqic9jws6sSPt6qdx1Koz3/3sxy7NWjOxYV4VmqKZhBiFc9qwKUNOqje6L0DjzTp9LeZ6XELsn4d9lbQJXeSp4Q/aADU2PI2E+oRB74ThaJPVLZP+p8iJr8aZ0P7qj+G9ANWlb95mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OB6rQIftn+ii9OpwnY8lVon7OEGSxim8rHzzPx/gvbs=;
 b=uN/74wpuG61zfY0u2FuzPUhTidcd8BHa6m7prOmkkhF0KCK/I8V/lTopayPkzyqEb0XeEbmOnOxgz7/rsyu+z0SCVD5X62ih//NPXi3E8wFYUjuCJbbpcPBMjNi3SVLxdBpBA0nHkgDzoYtBKbCXHU2C1KUN1ljKqDddL2Pppwm0TXDom3yE7ZXJBzdwOeKToQQfSvQ0w/ArKM1ZV/07C/II1pFYVrNNlgu9lBb2+t3qOVOLvgQhAIic1KnOYvOrKxvsrT6AcOAcEg/3ALBwom3yhgWdW1G3/Zpteyp94xZuanR5RSjXZUlpJ3JTT0CBdjEbYVZ72jlTjSuozRVfmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7821.namprd11.prod.outlook.com (2603:10b6:208:3f0::22)
 by SA2PR11MB4890.namprd11.prod.outlook.com (2603:10b6:806:117::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Tue, 10 Nov
 2026 23:25:07 +0000
Received: from IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::6518:db96:947d:6203]) by IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::6518:db96:947d:6203%5]) with mapi id 15.21.0615.007; Tue, 10 Nov 2026
 23:25:07 +0000
Message-ID: <9fb2ea70-b1e3-4be5-a9bc-80ae4002645f@intel.com>
Date: Tue, 10 Nov 2026 15:25:05 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] drm/xe/guc: Define GuC firmware for CRI
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20261110003553.787861-6-daniele.ceraolospurio@intel.com>
 <20261110003553.787861-9-daniele.ceraolospurio@intel.com>
Content-Language: en-US
From: Julia Filipchuk <julia.filipchuk@intel.com>
Organization: Intel
In-Reply-To: <20261110003553.787861-9-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0218.namprd04.prod.outlook.com
 (2603:10b6:303:87::13) To IA1PR11MB7821.namprd11.prod.outlook.com
 (2603:10b6:208:3f0::22)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7821:EE_|SA2PR11MB4890:EE_
X-MS-Office365-Filtering-Correlation-Id: d116ff2e-56de-47f2-c60f-08df3f81db05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|10067099003|11063799006|4143699003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: FskgjK8PxW2+ZK1wcfZdZeDDbGJ3L+IgPH3dr0SsS6wNS01lkX5UDFGfsEllrLtCX2OsDi9R3xAeIuMB4z/ClvlCnBWkAPy+wjAVJmdi7zCc+/26uzQJJLZXqizjmUg0TrefJsSWk8110zDKO94M/tH37TKaLiHPR8Kxi+CVWmWIfUkDqobYnK+k4WslugqBq6ao8mowAAymn9ZYp/WbGKMCiiY3vWYv6eWHqQA5pmdZ8z5rxq3BypBm7i9+EHutRlE94qF9yVTvPU3wt1OU0ZmTmFg9ZvVqeDghc1NHUaFaIu7RpxsA/gbPKU5x9V3QswH90kzaCJ+aoVqV451tEuPpN6EqymFaVl4QjKl9x0UWhiQFuwxUN0IU7rLLMsNkQwCGcZA3RPbBGJ/HGXAAl2boTp+PulQjfwlk6DhWTfrB2OaylhqOydjlIUHVQRppoYGr26V7tVejDZE+GSNsMtmKAdHvNx2WIMRSUDYvPapD6MZ0MajSAQJPEVF/S8zTW5t8ZKfRz9/G9NDQsES6cPn3fB5U7vjBLB92XiSOt+0BOsoy/I92x+DLR6Hd8orEVWRbuZKlpvtTMjOYbSPABE+s6Xjn7xH4fCpB1qRVDJGxUNvbMUJm7NeV4jWUU0yz47efkKyxygKT8Zmn4RQSWmxdrqwD1cqtmtZ+IdAUhJ4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7821.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(10067099003)(11063799006)(4143699003)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bVRSdjkxUzhIelkyZjhsNUlZZ0JmelROd1F2TlRZWmxPMWJLcXhidFJaT0dS?=
 =?utf-8?B?Z2pZb3lTMWpjT3NORncrS25DNU4xYkJSaTNBa0Z5c1RsTUJIdmdrSmNhUC9T?=
 =?utf-8?B?U3gvT0VSUzFubWJkZDVPaEdHZXRLQ1dRd1BIYjNSN2NWajdIZGJXa2J2ZU9x?=
 =?utf-8?B?dzJHUzV1ZDRmRnYwa1NxekZBQXE0bEkrZWk1blVKODVHZ2lZY3l1UTljRzlZ?=
 =?utf-8?B?YWFpZ0hPTElsM1ZzWUxYcnROREF2aytLZjlERitCV3gweFdJektZN3h3OUgw?=
 =?utf-8?B?b29vdFhnQzRZRWV0MCtrRWlhSVFCSXgvNnUwcDBsSXd5V2pvOHYrWEc2RVNi?=
 =?utf-8?B?R09RUHNEWWt6cklQT0w1ajgyTU04akdQMlp1SW0rMWxQL1ZuOHplOUR5QTVk?=
 =?utf-8?B?V2dlcVo4dmpIRkVrWDlmajdvUWs0SjZCZFhEcnVaLzVHK0RtYldZWnl5dVdx?=
 =?utf-8?B?VjIwVUFnYjJnRDdIOGJUc05OME5nTm1HK29aVExRcndxclZYcTBUeG9CUE5D?=
 =?utf-8?B?bXgvdHVCamtWNHd2MWtrYzYwNDIxWkJyNW9SdzRzK0FwRzJBeGVZUGR4SWdL?=
 =?utf-8?B?ZzlOS1VVekw4SVhXOWthcGs5Q09Hb3FhLzZtclFaL1MvcC9LMFJsVmFNWmg0?=
 =?utf-8?B?ZlIyTTVUU1JzUzFlNUp0SktTMEd2NzViNXFkSitZWlFEZVM4dFVUc2o5SEZs?=
 =?utf-8?B?bWc1ZzlaYmZBaVVKN1lxOG5JTW5kaEE2NzBwTkVhbG1oVEJ1QmYyRm9BTUho?=
 =?utf-8?B?OWwvNjdsbFRKWFpEaytHVHBmdkEvVUhYSFhTRS91bEl5a09wNG9wVWxISnpn?=
 =?utf-8?B?MGRPVmV3V1c2VWpzdFZLVHc5bnhnalZjK0NmMGtqMVdta1hFczBTRDd3Ympm?=
 =?utf-8?B?c09qZ1lSa3hETUxBa0l6YzlpL25Wd0pxek9RVHJmMkxQL1dHeVNwTzMwRnpQ?=
 =?utf-8?B?SmFJSnNoeFhCRVVlK25ZQ0k5eW9PalFWalIzZG5tM2FEYzN2ZVBGTFRtMGJ3?=
 =?utf-8?B?OXdZVGFsQkM4WVB0eTU5NVpWVzFhVlpIa3QreUduNERwRDFJK2Fud1V6RzB6?=
 =?utf-8?B?VEo1SzROaFB4MVJrYkVJcDNHNlJNRjJxdVh6eGNJUGxvY0lwT3lQNUxNdnJV?=
 =?utf-8?B?TlJnZnZpK3BRVlVBakV5Z09OelJwcm41bU5DdStmekFaNnJia1ZUdW9YZVQz?=
 =?utf-8?B?Z2VnUW9wajFESTZyMFBQQk1OcFFVaG15YkdVRFpPRUF5dTlmc2t0WUtXZWJD?=
 =?utf-8?B?STBMZWRvZUpIaDUxU3JKT3kxSmJQTlpEU3ZQM1o0cENrQW0wd3NLWUpLb3l1?=
 =?utf-8?B?QzNKeVp1N0ZYdG9xTHJJN1VKVTk2OW9rOGhRMlAwckhjMEhyNExQTnllTkg4?=
 =?utf-8?B?TnJhWTAvSk1YU0gxNTFKSjZEMkMyWWhnUmRZUDJEVVJQalJpeCtmZUwrY0F4?=
 =?utf-8?B?ZmhUMjZSb2RZZEN3eTJoWDlMS1pDVjkvbmJFc0dRYjgwNW85b2V0bE9sa252?=
 =?utf-8?B?UzV0V2hjeXcrT3IzUGhTeGhiQUZTUGRUM2MxNDdheGlqamdmQnBPT3N4KzFU?=
 =?utf-8?B?SWpEbGFWMXE1dFQyOVYySURMaXZCS29ObXNGdWh1Q29zbjZWd1FIYmpiWm5E?=
 =?utf-8?B?SGZUQnRGdWxtVG5zNjBjSm1YVmxMKyswTlRhNG5pelRSRnE4SHdQckU3bmhL?=
 =?utf-8?B?VzRvNVlSdU5xa1RJRHZqdmFHZVhWaDAzOFlLelBPWlBwOFJ4UnhYUHp3UXRH?=
 =?utf-8?B?YWpMeDBta1hOYlJ3Ym5IMnBkR21UTVowZ3JoQWM1SEJvbUJNc0RmQmd5WGZC?=
 =?utf-8?B?RU9keU9JakNFaUFnR3o1cGhKT1Iwdjc3WHNQb0pOam9aWnlaak8zZVJyVXRh?=
 =?utf-8?B?UUdvUFE4RlJ4QjZGWWg5MW5XL1Bnc3Q3WG15WDZYWkJkMzhzRTczUE5KUHpQ?=
 =?utf-8?B?K1E2MWx2dFhTcFBIaEdYN21GZUtMYXFaYzg4TENXM1F6TWN6bGpjRE9NcnV6?=
 =?utf-8?B?ZWlNOGlTUnNkdmxWTTJxcXZEdUdjZ2cxdGdzWU5kc0UwRzB3ZVYxd0JBOVll?=
 =?utf-8?B?OFQ3eXNQNW1YYm13WkcwZVNsRTA2VysrYVBhTTZEN2ZGRUFKRTRZTXNzUFlG?=
 =?utf-8?B?RFIxWW13TUhHWWViUU1BRHBUQzNoUy93OU9TV2FFSFpIQVJVWmVUSUw2S256?=
 =?utf-8?B?eENkZ3dMbmduL092aUpjYXhEV2NyWEd2cjR2cHZ6Q1U4VmZGakhZbE5XdGdM?=
 =?utf-8?B?WnlTeDN2aVdvcDQ0Zm1wRHNMRllESUw4QkRiakd3VDJJeVIvNGowVVRaZGEz?=
 =?utf-8?B?VE4zbjFmeVlKNGxBbllma2FQa0NjRi9yMktHOTBtenpJaERFZjFPd0tuMEJB?=
 =?utf-8?Q?F3cmTaMQC78hI7k8=3D?=
X-Exchange-RoutingPolicyChecked: z653D60kTYipXaMX0NQ4CvAV3oa7vsZ6LF3HXbZIIZqJhl+Ix7oK1Bh1ajdqR1UKAki1BtILHy4eFk55Zvl6m1Rlz/r+rcKtzRguWA5GTiloPDY3h6vfMKLtmT3Qgmgl3T4QHy0KC+ribl++Qhc6E0ITwEjsiF4hHD52+TT7Vbv53TSsikqWRwvewaCpJ7MIN0bSNK4LT+6l6NJiYawiCov873CXSehBNei5nwb1TZXgCFoBE6PNeSjhTtxcYs2bIJ+i9sDhKpjJZCfiLqeTOXnem46kjYjtrPrmqczNfCv/Ang/hqVBw3sbXjCMDxUWIvA4rOY11mCi0wsp1WLmTA==
X-MS-Exchange-CrossTenant-Network-Message-Id: d116ff2e-56de-47f2-c60f-08df3f81db05
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7821.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 23:25:07.2118 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QqtMgp2vNeCXEzTdZhuDfJxlZ7hmiUY/dA8Ekcta2z0zpPW09aRggyGWi8zxcD5K2nm7OChe5tqkiJxsWKR+GXpVc/Xd9ARjsnFgI60O3Xk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4890
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
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Reviewed-by: Julia Filipchuk <julia.filipchuk@intel.com>
