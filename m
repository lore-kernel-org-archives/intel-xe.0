Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FCD2606A31A
	for <intel-xe@archiver.kernel.org>; Thu, 29 Oct 2026 08:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XaRzjgZ8
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32216112075;
	Thu, 29 Oct 2026 08:20:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B7D5112075
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Oct 2026 08:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793262034; x=1824798034;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=BoY3CWCjZGpLaNG9CUdhfSV94lbHwarVa3PmJKjDeZw=;
 b=XaRzjgZ8pSKWrtydZwOgBJ6r3nlC8TWPH1cwFBEP85KICSR5G2nPEUVF
 ixWPzmvOtX08lioJNpCT8/kWNa3R6Y3TqHYP1LvhsyDERiNDFpr3CZY1o
 VbGN+JH/7BzCZ64IYsBOD7/vA5U1BEu5B4xa+Hs3WxmnBvGhJeWr/xlav
 uHNfIMFZdULFTAAbtZVlgGWc4OPe9m+/w7G5XPOXN4o27g+KjUMcY8Hp6
 2WFemgITnMnesNLIawqq59r2xA8BHJu5h931yALjUxltNxmmZ61+l1tuO
 gCuyNoLsGWxv+3jIZ/z1gV/Q9WaMwCniBygAT2q14CdoVNkSpCWGjqpyS w==;
X-CSE-ConnectionGUID: gFeugB/9STum3eY6T6lbyQ==
X-CSE-MsgGUID: YX6+GmTNT66xmK3cNtZNCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="2023894"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="2023894"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 01:20:33 -0700
X-CSE-ConnectionGUID: VokE4zqGTy2qYs3b2vofDA==
X-CSE-MsgGUID: PC02mizpTfWsNIGdAKtUfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5466501"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 01:20:32 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 29 Oct 2026 01:20:32 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 29 Oct 2026 01:20:32 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.49) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 29 Oct 2026 01:20:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W3EQGsQkwcz+MzPKTPduwoBYkoq5LZcMkV6XJzjKPGXHF5zGRbRj3xqrgytMkw9SCXjvfzZVdyo3lqOnXlh+fW5PQO+KqOZc1Hn/NxnzhTIgleaR8IRP/8Ay4u1xSJqoFdIdhtAJkxS/ctNI6YIHcAUvSvx9WkDvux/OTeOuo9lS12vVzdBrdwhwhSnBpYFQ75DQEPv9UDwqapbFKoA9lK4Mq3LT9FYQ5HkRc5LHGqvao+PMsPk6EdWaOycCsTRiqTK3y9Wwo0S+8qFsLJrQazUclwUqUaUhdX+0iufCfx8vkYLhgDsJSJ4HcxZwL/N/34uDO8c4okezTAW+GSYjVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cE5da1cBCmr93/SSHZE7tEBpizq8ITpgdcDQaMfV2fc=;
 b=Q3hCAVKdGBQZmp/b0Oz+/4FPOIGqI0Pmrbhe/dF7MHUK7FlDDzupSGDpUg4QLGz9xyxuWDymqO9oIT8/hhzZZVn7cA5n1yk8GIrS5l5uqaDIBl+wL4qzV4k20RZpd/PuCJqJTQ4Mt+FIE1Pma3ynelxGQWsnJsIxgJHSRdskq7vqHEC0BsNfVK8aU1bNlLYhB+Fv0CcAKH/bJnp7psQW5bzZNGiuiq/7p4NISosLIHqfJptP4rEUO8SJscDn4qm7ZZxlRqQsxDWVT7luuicWaRMW9odjPQy7wGqGZlbNGWUopxuK+nzepaBT7M8r1rH5afUDdh42cdVqW3zb7RrL7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.8; Thu, 29 Oct 2026 08:20:27 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0546.021; Thu, 29 Oct 2026
 08:20:27 +0000
Message-ID: <85173697-a85e-4590-a458-65efef64ee36@intel.com>
Date: Thu, 29 Oct 2026 13:50:19 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/9] drm/xe/xe_hw_error: Handle non-fatal errors routed
 via direct IRQ
To: Andi Shyti <andi.shyti@kernel.org>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>,
 <ravi.kishore.koppuravuri@intel.com>, <mallesh.koujalagi@intel.com>,
 <tejas.upadhyay@intel.com>
References: <20261026060459.771448-11-riana.tauro@intel.com>
 <20261026060459.771448-15-riana.tauro@intel.com>
 <auIf1k9MOd63oVee@zenone.zhora.eu>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <auIf1k9MOd63oVee@zenone.zhora.eu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0078.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d8::6) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|IA1PR11MB8200:EE_
X-MS-Office365-Filtering-Correlation-Id: dc2054b7-f9b6-4063-9819-08df35957d06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|1800799024|376014|6133799003|22082099003|18002099003|56012099006|4143699003|11063799006|261022075727099003|261021121427099003|261022113327099003|261028144727099003|261021123027099003|261022105027099003|10067099003|261026121527099003|261026140227099003;
X-Microsoft-Antispam-Message-Info: lwvN9wyjgJ0lD0cuY/ADPXT4k1hh/y/cj5PZqiUQnHamhkI1j+4Oa/V1LSAXOOZ0LDTHPcZUhE4GkefpP7kiCLRXqyMPvFDx5JQmdPJ4+iY141QpgWp3R/d+qoqCRLgA1sRec0VETTjO5HPhARaYmHlnz+dLUFvY9Lxw/Bnzto36iaeb3DF5SYmeOfUDwXof9OXlboL5aYgyqlS+DSR9TwW7afyrGaPC6UxxksYGmQBpG6Gri86W7JNDKo7YepLjrPtv9ta89VeDU5bLYaHry/2PJky6bZOrFzunY0cZHcngq9xpHMdQQOEA3TwXlc8cQVftlYrSG/wOZbVtcvuxKv+QgIFrAu8gl3nH2NHMSV0747atffUsVzkBYyLKZqflk02g6RV60e69o2OznFtWkFXMQSvBja9mrvknZp13pwbFKUAn609DTXSGaAmBLWF2yFR3rBgejV9J6F8EYpBi2Yj/e0Q/Ce67fueU8AcjYmX0IFbCwwZGLv/llbf3HxOhpCopQKLR5Y+sDMkJT4Edp3qXrwjglr5hMIqjc5wzIBGE221vcz5jft3SIuLPTAGIjaGsqFKdxuYtirUvolYtfvu3IlQRqjWlIVtbElSxR36BPrPS0y5g5iZOEyIfahJt6c3wmCabuZk9zNM2wrG0iWZrOv2QIzrdmCfm5X7rG7w=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(6133799003)(22082099003)(18002099003)(56012099006)(4143699003)(11063799006)(261022075727099003)(261021121427099003)(261022113327099003)(261028144727099003)(261021123027099003)(261022105027099003)(10067099003)(261026121527099003)(261026140227099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N0ZOZ0w3bWdNSzhEVzRZVk9tNlZjWHY2bG9xUFl5UkJmcnNPQ3BaSHNjcGxY?=
 =?utf-8?B?SVFpQ25aMG03emFkdFNYNkpub2ttS2tmN2swOXo2aTJza3VyMEVOQVVNNHQ5?=
 =?utf-8?B?VE5jMFBBWGQ4VGQ1U3VCaFlvbE02bGdSOXBzRWdBd0VHUitIbXhOVjdkL0pk?=
 =?utf-8?B?dlFmQ3ppN0p3bERvdWxqUjB0eEs5V0ZNMCtRVEY2eEd0a0NsckdQbDJqdVM2?=
 =?utf-8?B?TVJGWDVNVDdJRm1RVEFObjZ2aU5VbDV3MnU3L0NFUTBwQ09rR241ekN1OHV2?=
 =?utf-8?B?V0tYMDlLeFJKd2k1enZsc3psMGRpWjRQclVPM2l4ZktMVUNJbU51UDViVlZq?=
 =?utf-8?B?Uy9DdlhqK1hNL3ltRzR5SGV3Y2tRQmUvNlRsV1hQWWdVbE1BUS80QXZmUVJG?=
 =?utf-8?B?TnJkRDQ4Z0w1d2s3TEN2RVZyK2l4aXlrWHdZMys5ZjVtcmxXVFhoR3hrUDlG?=
 =?utf-8?B?NHJGL2NiQ2lxR0sxWDQzOVZxVmwxRjlGaEJzZnU3YWJBWGw3czN4ZEQ4b0FK?=
 =?utf-8?B?OVg1eklXcUpJdWZrMFR6TlhURkFaNkZqbCtMa3VKNGNReXFxbUdRSEduRDVz?=
 =?utf-8?B?Y28rWFFKamIrOUlvWVdoYVZOQlJkOHhLQy9FbGlEb2dsT3Z1V2I5YmwyS1pi?=
 =?utf-8?B?bUlVOHBUQUN1UU1wa1ZZSTZwc2RNcWdVMXB2dDdBdEVmZVdDNGpFUWhYeXpv?=
 =?utf-8?B?VDFhZ0taQnNEV0RpT3hKRnJTV0dOUzJ1SVQ5OFpNa1FHV1hZWE9mZ0k3MFJR?=
 =?utf-8?B?SXkzakRNUzR4SjJTSnlkSTB5ZVdsbmVxQWR0ejhvUENsaVFHYXdreHBURFlF?=
 =?utf-8?B?MjRUL3ZPeVRibkkvS3V3WSt5clFVbldVSVBDbUo3WDdTellWcEIrVVVKbFJ3?=
 =?utf-8?B?elRVUk9nYXQ1czBWV1ZwTkppRTFlb0FIaEo0bVB2WU1VaWFEQVREUUtkTXp3?=
 =?utf-8?B?ZlBTMDlBRlh2YmcyQUpWQm56UDJacjVjencvQjd1TnIwMmg3QitYR3ZNY3o4?=
 =?utf-8?B?bDBaQ0h5ZDUxcWJhbGpGT0tWSUQvcFdYZ0t6NFpVNFhxU1NVaGs5UDd1YzB2?=
 =?utf-8?B?VzBiTFUrdXdnMWYrRTlZNU9RdExSU0NzVk1RdkJSZ0tlb0wxcDJQdWFXUjdM?=
 =?utf-8?B?WHdsMGtjV3VyU0R6anI2TDZlNjZSaWs2aWpiSTk5a09HSUZpQnRoL3pZZWc4?=
 =?utf-8?B?QVgzbHdHalBXb1VBS0Y5ZjRYQUpMcTU5NGZLdnV3MDNoellFeTNLd3pjV2Jh?=
 =?utf-8?B?Qllnd0N2emNOWXZTaVc2cUdmbUwzZFQ4S1BMQ3orOWtoVlF5ZHNvOUtTZ2hk?=
 =?utf-8?B?NGQranduSVI3SklINTh6ait1NEZvQmhTNFM5UVI5clI1YzgzQTgvcGxzayty?=
 =?utf-8?B?clRrRTNNUkFkN05TZk1ObC81dHE3cFZJdmtVekM1VXN5d1l0UkxBYWxwY3JL?=
 =?utf-8?B?d3JVQ3JXTm5HYkNQK05oRWs2alllYzZoLytEdkcvYTA1TmtPUmFXakhDaVRn?=
 =?utf-8?B?c21Yb09tUVJhVjdqQlVkZzdmZXFSNUk5Q0lYVkNnb2t0QkZjVXR5TDlUREN6?=
 =?utf-8?B?cFRqMHlrRlM5S1VZSmZDUE5KcU4vMjBsU3ptRWZkN0pZVm9ic1lFdEg1YXdm?=
 =?utf-8?B?Yy9rVUlZdXoxTWIxZjJzdm5HSmNKMTNPUmQyOFF5Sk9Ra2xJYkZuRC8xOVR6?=
 =?utf-8?B?RjU5eVFzQi8vclRCN3VsU2llYWdrYVdRRWU5VHFybUQwa3JqT3dJMGg0Zk9a?=
 =?utf-8?B?dFFlNEdnejJJNWJFK1BzTkJjSGswTWZrNWNudUZ5Z1YyME1oSmpMVUl5T3Fw?=
 =?utf-8?B?NGRtT0dSdWlOTDl1OXdIQ1ZkS2J6dC9mZHJKbWZIS3E4RXdqaG1ocHNkRkF5?=
 =?utf-8?B?emdHMGtZVmxnbFEwRUhRK0VHUGx1U1VxYm0wbHNIblpudEx6WDJ1UFJqTy9L?=
 =?utf-8?B?R0pvbHhHMUlwWmE2WFk2QlY0S3E3MnoxbDhWRkZLVG9KVHFJRnJ5emJ3WDhB?=
 =?utf-8?B?UjBSNi9YQnhFWUl4SnQ2UVVYZXZKTFM5RmdDdGRPa1UyNHM4S2poYy9BNlRN?=
 =?utf-8?B?aWZ3czl2NnRLeE9CV3Z1Y2k4b2phcjA1UFBCUWpaRXVHSU4zZnNYYXFxM1N3?=
 =?utf-8?B?ZmRKa1VXK3BPWUtCU1VUTVJtTmpUeVR0TUNqaUFxNjVqV2RRWXh0cU1BM3ZJ?=
 =?utf-8?B?Y3RLTEEwZzROZVZGYkdoRGFyUThmdGlnMEtOSDc3d3JmZkxuM24rTEVwQ3V6?=
 =?utf-8?B?cWtIQ3pnSWR2V1ZNRTVrVHl4TDJLWVVJb0o5THZaSnlJdy8xRTNJNTY1eDd1?=
 =?utf-8?B?YnlSTFdLaWlSOHRZcWZaZzRRRzk5eENwNWNQQlZpMWFuRzNuelBxdz09?=
X-Exchange-RoutingPolicyChecked: RH1YdrUpg69tAasx8df1kdPLaaL7gwApLEj9n1DFUZ5kBU5GkOZ6B4uFpesf7LJQtEeP/BTclkSFaf6jPNWGzKkf2BliC28OUryV0RVkUNdywHhEHvT2lr9nMBWAgLyCIpMTj9eWUoNmgSihCXUm/dvwtHfB6Dcs2yVcQU1f3JUXPf6E6UEnf1Ln0nGyTmP/0TKd+n4trmDoDVLE4mU43h7586pVot8gzHgNImWjS+ax+nK2TXDwNhoFpxgNRksOkJ8MCh4AqNn4oPE3H3yox9rY8q88bVJchz+PQI1oufbyHxuWdFG5oifjb/l3k04eTgO/W7ZxZMPyrlfVu1AumA==
X-MS-Exchange-CrossTenant-Network-Message-Id: dc2054b7-f9b6-4063-9819-08df35957d06
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 08:20:27.7186 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8fjGcJfM3V2s/lJQ0QfsH1o5r4Mc50uNdg1akSK19vR1Z0Z4Apm4UFNBDRXSa/RvkU3upyTf1tKYJrtMiHPWGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8200
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
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 28-10-2026 21:47, Andi Shyti wrote:
> One more question here...
>
> ...
>
>>   	/*
>> -	 * Hardware errors are reported through System Controller on the platforms that
>> -	 * support it, and never routed as direct IRQ to SGUnit. So we should never be
>> -	 * here for those platforms.
>> +	 * Non fatal errors are routed as a direct IRQ on platforms that support
>> +	 * system controller.
>>   	 */
>>   	if (xe->info.has_sysctrl) {
>> -		drm_err_ratelimited(&xe->drm, HW_ERR "Invalid error routing\n");
>> +		drm_err_ratelimited(&xe->drm, HW_ERR "%s %s reported\n", hw_err_to_str(hw_err),
>> +				    severity_str);
>> +		schedule_delayed_work(&tile->hw_error_work, msecs_to_jiffies(MSEC_PER_SEC));
> why are we waiting one second here? How did you choose this time?


Its a best case scenario that if there is a non-fatal error which is 
accompanied with a fatal at the same time.
We will wait for AER to get triggered to avoid unnecessary handling of 
non-fatal errors.
It is not guaranteed that we will see a AER in 1sec because even that is 
a worker.

If this is not okay, we can drop it as we are waiting for worker to 
complete anyway.

Thanks
Riana


>
> Andi
