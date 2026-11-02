Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A720606D813
	for <intel-xe@archiver.kernel.org>; Mon,  2 Nov 2026 21:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=N3kJ0WD0
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3E1910F202;
	Mon,  2 Nov 2026 21:15:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BBE510F202
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Nov 2026 21:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793654108; x=1825190108;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=oS96iBPTC4VUi3okiyBAxu2kltMZawW7sG3iXowil5c=;
 b=N3kJ0WD04xaXraFSUmc1lFxunwxeOCHulC9ok9kJZkXxWUJM4gzTBYeL
 n/T0MXoiUhW+kr0FnWv2ESfJNSFEALW1WqfSBM1KkzZMDftwLWBu3JEyQ
 yujIE8W/HSSbFtBiRzUUUPdc9JUMPLbwSOQuxvS7zwP/zvbFVzJJPPdUJ
 +/RASVrlvMzbFkN7oaLXSvh6Zz/4s7R8TNHgni4778O/IyoIcLXArbAjb
 wANrpG+MAx9P0IuBJxqlKo4PKLYg9t2WfZ2Aj+e2gLVEeNmyaY3FyUcwj
 FA35gWBWpqbBK9ASAXfERomO0/CgtwGC9hvPmmTj10HECBTb7jbJhQeNb w==;
X-CSE-ConnectionGUID: 59CKZy6sSDGbMHqX/XnGlg==
X-CSE-MsgGUID: MsGtnFyJR1WvU9b8yyuqVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2262017"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2262017"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 13:15:08 -0800
X-CSE-ConnectionGUID: 8e0xt6I0RVOEVIvtmy5SMQ==
X-CSE-MsgGUID: 22/rpHUlSNiBB+BQiXsiLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="6068272"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 13:14:53 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 2 Nov 2026 13:14:52 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 2 Nov 2026 13:14:52 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.54) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 2 Nov 2026 13:14:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HWm5OGfYkdCHKje11800ebhiS1LrXkcBJQw2F1g7nNMitMtMGyQW/oGKKQoZcXhpZc4joYS7sQrQATklPVwN+CU3QoaCZvxnLXfSK6cFwCMzg7YIGh0rqOkquwyPoqYZEK4NSh+ay0xPz8DqPLePEsPoYb4Q01JJaraBJlXeSQFHUedSCn39vKLcddPbAlmjGD0AgEBTv63ziOsWJ/FvLRa67e4il77DDfWCn+9t9N5CrSMEIvBOfUQFO3tKWW0qGnfdQYPdoRFVvWEMQIRvboq8aDxxd0+85YCD7WemqKOeXUgNbhubkNOx61wiidCHdVtwO9JMtoEhyiTnfwQ7KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oS96iBPTC4VUi3okiyBAxu2kltMZawW7sG3iXowil5c=;
 b=xN2T0uyUnIIYvlWkKBQlNLQFSUrNRt9lGyZeYrPtG4harfDubQ8OlXX3ASkaOaroSf0kGggBP/iHG2rT1B8WFaL3Q3oRgLAPz++rv2l/MTAZLviLgLasFS83gk/mpma/mvWeWXzgPw+ZgDfivm/FoyL4cUwKdbYo2HfdZQcm0S9NGe+lNxgr+F2KJcPE/cigiY5IMmczIlBYmjA02px2tXgnx68TfKjQW8+8bi5vXa9YW47GQrEi0tChclk3GCG4YNrwDhnVd3oODRtxXS74noFaSTxxfXeZMZBRjaUxxtpTYnNkYDnll2zI/ricGEFLBRRBUBHR6dnCVzm+FVawDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7821.namprd11.prod.outlook.com (2603:10b6:208:3f0::22)
 by CH3PR11MB8466.namprd11.prod.outlook.com (2603:10b6:610:1ae::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 21:14:49 +0000
Received: from IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::6518:db96:947d:6203]) by IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::6518:db96:947d:6203%5]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 21:14:48 +0000
Message-ID: <fe8f6aca-70d0-4c6c-b977-6086d8b79e9a@intel.com>
Date: Mon, 2 Nov 2026 13:14:45 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] topic/xe-for-CI: Define GuC firmware for NVL-P
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: John Harrison <John.C.Harrison@Intel.com>, Gustavo Sousa
 <gustavo.sousa@intel.com>, Matt Roper <matthew.d.roper@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Rodrigo Vivi" <rodrigo.vivi@intel.com>
References: <20261102163840.2231293-6-daniele.ceraolospurio@intel.com>
 <20261102163840.2231293-10-daniele.ceraolospurio@intel.com>
Content-Language: en-US
From: Julia Filipchuk <julia.filipchuk@intel.com>
Organization: Intel
In-Reply-To: <20261102163840.2231293-10-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0184.namprd03.prod.outlook.com
 (2603:10b6:303:b8::9) To IA1PR11MB7821.namprd11.prod.outlook.com
 (2603:10b6:208:3f0::22)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7821:EE_|CH3PR11MB8466:EE_
X-MS-Office365-Filtering-Correlation-Id: 39d40e62-300a-47db-ecd4-08df39265358
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|22082099003|18002099003|56012099006|10067099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: WNWGQCCgr965gJr3Gn5LmKWVcJftaWnD0kCFYOnrkmvkJWFBFunoEOzli2c0DIclR8HT7ctHrhhbMpPL2KtuEZ6gLhkW5jA5ZCAZZ7lsbLRMXYIH+IxX9cLoLgCtOg30ilTNr5qXIIZ6B6yucBxMhSZL7XTCbeWsEGDRAtyyvx6jJmNX82MxLOFs8WPDbiyk7j2i8uYKmNkgpacNhylzdHFpYeFDzARnJSiJE3loOkCU1Ac2VEmaAVURbwSSj+vL4kfHb+aueQ02ODEfC7z0tOpofGfbPZmn/zLrXXDXZm6sn0forEmg9/UY6wpyROaky7eLQuLvm1fvDchTxzKc77kdGmZ05lAyea3JkLv4fcvh3kLM61Gp7+QhRaZJbv1DXGq2aOBtQl890N8DQXLfgqsm0lFY0Iuj7P0JeZrxoIySelrtSbZBv8Uh6PkI40+YieXlnimXdOK+1r2Ig+cX/EN6ixqzZlwpLpC5Il/BkecwzWdgwNY7pggu2oQ2pxEFbHuOjP0+fNHCKT13DZes+eQOWNg9tcI4KWJFjUyVs+TJ1DAlOqIk/4YG49WNrKhcPGY3baQv/0+fhQVcWtA/wnQceC3zLoJIobJIpcqm1ErhxpEPUALxMyVcqkQruQ1Akq2nx8r8vXlnoCtouofXRtBc9Ko96extGgRgepBBZJo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7821.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(22082099003)(18002099003)(56012099006)(10067099003)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TUtqcnNsRU5YcFFBS1VaRzdmRTladGExdzg0a2dqWlhGamQ3L3pQOVZXd1VK?=
 =?utf-8?B?dHJCNTdMWGdBUmpKTWx1S21JR3RVUG5QQ2hKMm9Ea09lL3JVY0VOMmpERW9L?=
 =?utf-8?B?K3FqV2VOUTcwcDFKUmg0bTZSQkdReEFiQW1iZVIzTExmaHVzcFV6bWRxdHFL?=
 =?utf-8?B?ck44U2htcWdpWWhJQUpYZ3ZIbW43S0cySFA4UFdGMkFwUmhia3pEWCt3UmJs?=
 =?utf-8?B?NlJhVFJ6K1RmRXI0cjkydzN5a3JSZFVEdkdYQVZKb1BmZEdiTFVaWmlkK0lW?=
 =?utf-8?B?cFo1dTVBZlhxYzErWmpJcG1taTEwdkpXM3NNeUNBTTNYblJlNVBxeFlPNzZk?=
 =?utf-8?B?S2FuL040dUVaTVlraytNa0RaTDFVcnR2aURZT0UwTS9XTHFXUTRnb3B3cng5?=
 =?utf-8?B?UTczZUV6NTNPck5ibElqZERPLzR6MEdQeGYvMm4vRno1VHJWWHJBVndCRmJs?=
 =?utf-8?B?LzJITHFZUnlRRVdKRnpob2lnTmFXbnZZcHFINnYvWkdRc1NMdWQwcFBuOVk0?=
 =?utf-8?B?d1NRVmpFZFlISFpMSjBaU21mbHJHaE9aVmJjeUZTVEVpZng1TDVBME9YQndm?=
 =?utf-8?B?MGlOaVk2djZkdVRVdzBjdzlLS2JnYVk2VkVpQzRPRndFZEQ5UFRjc3MvWUx0?=
 =?utf-8?B?TDkzM1VpOUpIN1lnM2lNdU1LV2ozNCs3ZW91eEtUbEdEdlk0b2JuM01Iemdl?=
 =?utf-8?B?STdkQjBMZkZWQkZ0VjFNaUhDbHBCcE1NVGhJcS9PaHVXb1JkQWFNYTVTbnUv?=
 =?utf-8?B?MWtpRXFyeFhQOWF3MjM3T3ZIWGpPNmVsV0dFUHVoNUJ3ZmhLK1lvTzAxUGk1?=
 =?utf-8?B?M3BSL05NKzF6TWk1ZVJYMC80TnkyeVdMVUttTTVZWHhmYldBc01QVVdBdkhP?=
 =?utf-8?B?b3VyaFEvQTExU2JZbEJwaFMvSmphbkMxZVIrS1BQYmpxS3o5WTlsODFFdXQ4?=
 =?utf-8?B?TkQ5bDg4a1pIaDdZWVNicDBKcFlDM3lPWkZmaXZkQk9ORS9SeFQ4TXBhV1hE?=
 =?utf-8?B?aEhYWm9zVmVYS0Vudm55UDRuczdCZGNOTkcyUkJmTUpBaStzNGF0RXNHR3o0?=
 =?utf-8?B?SVNadFdNY1Vja0wvb3krS3NwQzlITVUzSkx2UnVZOGU0Q2pFT0xIcjdMa09D?=
 =?utf-8?B?eDRZZFUrZVdGY21XUFNEdXNMYy9zSlVBVTYxcUg1MmdHeE5rMmhLWVhKd3hX?=
 =?utf-8?B?R29wVUtqejJGUW5nMlNJV0NxYmQ2akxTcjJEVFJTeTFIWkFFU1JqdTl3a3RY?=
 =?utf-8?B?R1EwWnE3dkQ5cnQ1UnpOckZEVFJsN0syMjliQUtiOHFuVnQ0cnBaN2hDRlhY?=
 =?utf-8?B?TjhHSGJiaU1BcmdsVForaWFpTXg4WWtPbDJhSlZ3b0ZTQVc1eWZjL0NCaUJX?=
 =?utf-8?B?S21UYTlzV0FWYUR6UTdlK2lPVTliWE9uVkhoblg3K3psQTZkdHkxMmlrWDN1?=
 =?utf-8?B?ejFTUFowQlVQVFVIRDd0RUlYZ24rejZHN3JuSStaMjZRNVMyaE5kc2Z4YVU1?=
 =?utf-8?B?clNsM1pSTHNpRDhtQVpTS0Y3UmdROWRMTEMwM2YrNWRQNDIyMVU3dC9aekFi?=
 =?utf-8?B?Rk1IN1dZaytWblRpWkNPSVEydnBhK0ZJdDd5OG5PYXVVWldwQjlxK012bUFX?=
 =?utf-8?B?VU4xSjI4aXJneElTUEFPeUJqQ3EyYVZYRHRxbCt2S2Q1bURYLzRQY1g5ZXRM?=
 =?utf-8?B?QmhzTjFrVmpLdllaQTZuQjg1bDhoejBHdHJrOHduQUY2NVQ3U3N6RklFRFdv?=
 =?utf-8?B?VjZVbS93ZnhHSGdwSGlYKzhuaXVZZVkvSVVkTFBGSzFTLzg2MkZlelFoRTg4?=
 =?utf-8?B?enpsMmFXdlRQNHdzQk1KUHFqOWNLQjVaaDlRYnR0ZEVyZnhIMFBSelR6eGow?=
 =?utf-8?B?OFFpU09vTHZJMjM3c3MzZUc3NHN6S2NYdS8zanFMaU5pVmNwaGFiWnlNU3J2?=
 =?utf-8?B?WjZ4VzQyNWx2cHVnamZvTlNRbWU3OWp1azM1eWd1SEx4dU96WVVxVllFLzVr?=
 =?utf-8?B?ditLaXdkamliWVMrS0EwRmdBTHRON3BtTmY3Z2JzYVQ0aFppeDNtMjZEM0Fm?=
 =?utf-8?B?L09USlBuTktYUGVpaGxlSGRTbG1HSzYwems0SkxVeW4wWm1ueE1zTVR4N2Zl?=
 =?utf-8?B?VDhscFo0WHVCQ05CQTNvSGV6T29XTUt6eFh2bStRZWhhYXpqTWRXVmNQeDY1?=
 =?utf-8?B?cjBpRkJvYlRETWdadHdxMzdUQzBlMmxVTU9YOTdNZnowYWRMTEp1WEx4Sjkz?=
 =?utf-8?B?R2IwREt1dEMzQzZCOVlSSEhtRnFTZDAyd0cyWUVUT2dBbFFIT1JIdm45ejdQ?=
 =?utf-8?B?L0NwOEpTakZ6d054NmVSVnFMMXNDTCthWk9odzdqQm9HU2c2cTAvUW9URm1T?=
 =?utf-8?Q?9aanOR1YEiLE7xyM=3D?=
X-Exchange-RoutingPolicyChecked: Yxwnje1DPxr0wjx6Ev93D6BbHWGlBET1/9RYp+Fc8+PXQAAcsh0Yl0B1hBVQjX8s+NUx3eqG7gOpQDfLVxc4jhpTD+vLOgV0ubs9fQv9Z7xo6qddDM5zX0uKowusXXLRv3i7Fzea3Y9KNSHi5M6ablBsmYiHj8McwI4hJf/9uVQlvPFiJSH2B/C5B8iE/GsuWaIwCAxEx9AzWuKO/ANPH4uBJWAum9xhf5+fV0Kb72QOD5GeFB1PhTALa6TMNtorRRmewSF+Fs4LuPMDUb64nbdgMNyni6j/l4X9scy2e5pLSAubTkMOTk8hvv8FcXj5s+irT8bJr+oU6WfEssz44g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 39d40e62-300a-47db-ecd4-08df39265358
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7821.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 21:14:48.2145 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vuiniki4LtjXiSHnU+a4Ffn3vbQwK6xHZVYnzNQzZ+c7BIVt8Zfk3EWJkfvSL86wZkF3qSP9X7uHfkFkxHSvxB25MdyJc3RKeQDg18OP7ps=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8466
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

Acked-by: Julia Filipchuk <julia.filipchuk@intel.com>
