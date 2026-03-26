Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30894109E543
	for <intel-xe@archiver.kernel.org>; Thu, 26 Mar 2026 04:03:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2F1C10E930;
	Thu, 26 Mar 2026 04:02:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bDY29Gm5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2AEC10E930
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Mar 2026 04:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774497779; x=1806033779;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=aG5Tg0cxDuDinBL4CoXlVa4wrlm7Odhs5XExhnE3qZg=;
 b=bDY29Gm5+cFaCCCmg1PVnsBHJ3jaFZpxTx5xkKJgl73jBrtkqe90bd0c
 wOYpXgMZKGUjn/n+4v4hz2FGcsrzX91g/REIuEkWODikczjyg9I3YRfTm
 7OJkix1RFbz/7dg19hrJGSVT5DkyFXBp+TCMME/7ZqgLTH53y4pB/3rma
 f2QZ5BRz0byQQnIHqqF6zzqDaNmZzgcoaoWT6BOAzVBbLcqXhqh+hERvR
 1EBXqoSGvHhIwcX3v2IMa+GOm5/9z+3aFhEbmxdXaMpZI7KPNA5kDLgjv
 pKZuAOcn+F146G50xO7c6JTIeYA9NKIYZwgA5H0PAxNeYIz333dfeWTTY Q==;
X-CSE-ConnectionGUID: qdcSTN49S1SjnnM5aX18+Q==
X-CSE-MsgGUID: +x3i3mVtScG6mrjz/rUOUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="93126256"
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; d="scan'208";a="93126256"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 21:02:58 -0700
X-CSE-ConnectionGUID: yh8+R/NsQnetdHhHrj/7WA==
X-CSE-MsgGUID: VkWo2A3LTZ+pDXPxHDto+g==
X-ExtLoop1: 1
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 21:02:58 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 25 Mar 2026 21:02:58 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 25 Mar 2026 21:02:58 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.45) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 25 Mar 2026 21:02:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FzW6Q7BbT+KGJ2C897TwN2LQ8ZvM8PonKczRVhLPk2yGh/JWuX/4hrc3jSS9rQlbD5vJN6YJSuAD2bNHlbQrinmPxmJVaCNC5xfs34t+lENkB0k+U6Jp4MO8DQA2f4Vyt9skfriDB4MiHgJIzg5RmS/AVL10wWsTmtwFYH2UlnRC+gdjzDrL/+E/HnvggifNz92SC/tjcILPSKyFAcFepLbj4QsWTxuZVTtIFqoGNqBEoU15kbSSRAai/F2RQ8U+c4By7e/MaHeV4q9FQRgYZksE+/GmO8xIvSy9wKr0pIxD5od0n4wnef2jh8hDO2SdzetCQjG6W0cA8RIIe8Yp9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zXRytWCWbwcff274fTgpkXJc/8s6X500v0mvh/OgOqo=;
 b=X4+UDE3jgCIk4xd687t58oKnysnsy6BE3L3lK7CGd1/WNdm/B+RxoBhW5Y+gvosxEdtEZOIad4fYQzHhiIhfIpVTlKJ062iVutAKsqrH9jPrM3YpdQnAFIOfL9b/mDD8/2uAdftC1qCp4+bwB9fLPqFhOXhok9GEicGjPm0volwc9d6vLD/LOGm4W00zEitfNHYm1LgaNSevAi15sTQecB4UU0jIwjkPZo4+1P/IFpYg0qKwnZ0Vigytwaj15Vu9Cx7dgXr+Ysz/f5K3h9bDZvUU8ckoGmo4v6StauD58G9aeFdNhu2T34iEsE96quWNJyytYZuU78FbtVf8FOmwVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN0PR11MB5709.namprd11.prod.outlook.com (2603:10b6:408:148::6)
 by CO1PR11MB4993.namprd11.prod.outlook.com (2603:10b6:303:6c::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.21; Thu, 26 Mar
 2026 04:02:53 +0000
Received: from BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c]) by BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c%6]) with mapi id 15.20.9769.006; Thu, 26 Mar 2026
 04:02:53 +0000
Message-ID: <6f2d7ab6-accb-4ed1-b03a-3edcdaa47df9@intel.com>
Date: Thu, 26 Mar 2026 09:32:46 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 03/12] drm/xe/madvise: Implement purgeable buffer
 object support
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <matthew.brost@intel.com>, <himal.prasad.ghimiray@intel.com>
References: <20260323093106.2986900-1-arvind.yadav@intel.com>
 <20260323093106.2986900-4-arvind.yadav@intel.com>
 <883c4c33284cde728a7a558890e5501781581e33.camel@linux.intel.com>
Content-Language: en-US
From: "Yadav, Arvind" <arvind.yadav@intel.com>
In-Reply-To: <883c4c33284cde728a7a558890e5501781581e33.camel@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0176.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1af::17) To CH0PR11MB5706.namprd11.prod.outlook.com
 (2603:10b6:610:ed::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR11MB5709:EE_|CO1PR11MB4993:EE_
X-MS-Office365-Filtering-Correlation-Id: baa84fb5-8f9a-4c55-6f50-08de8aec8dac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|22082099003|56012099003|18002099003; 
X-Microsoft-Antispam-Message-Info: CScIXeMU3O6H4Awp+/cFQmtFkdLAWE2+g9lSUazS4oLm/xdkhUXFqFaN55oS/hE7smCF+FwZyIwP0i6sO1x8Hq+bI+KEofWbI7UCC6sAMeS07qqDhiOx/dBtH3V1CtXktxMKeG8hpEnzeq1d0sRO5TUJ0XP/hkmhgHEgWWbYGII/fvhpBfEpphKkE1P5Kt4js2z/+T1YdAfJMZpAQUsrJvSeVo9H6F4XKutGOg3TxEJMCNHxF1Sq9mQKrO+M7NU4dYOgJT+xwS7APFok+Tab6CHm4Au0Klr8pRhzcQFKezjUaglO0Ixt55L4SOATmeLcsrOgaXc9acdHMwY3S+hK5HFpdGXoElFz2DWCABONnh7dGXpqsnQuDL+wGuoQNn14uic9/7yGslWO75Mnst5vokIBP80yAvA/3GmqeHes2gSjVG/zOsvVkTMLrbDuOoMY4wTmrnpfGikFQnP9T0d6pE6nursc127ToB7XmSf6q7S/IVMF54y++xuIvA6gIfm/2098/GQ4tNGo1OhKUXi+lo+HB4bNww4bZ+8HSMGVvRaDPJo3F0a2Ndn3t5TfKkoCJRojwuJXBJHTAt2cJL8eRGN5kcF0+DjbVWhzWtsBZwR4fJ6H7oxrjzQCIMoMyng3RSbkrlo8wQN59n1p3BRK1JnUiSibTTscFMnzVIwp77YkSKTiKbS13jE7NRQBZinzaAsYEt4NohR0jN4zr/YSrPgB4awf/S+Gv8iCQt6UcrY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5709.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VFFLVnNwaSs5NjJNd2lvZTR5UVpuZ3VJdFNaaGRwZHVSZkErU0V1bTRPMVVk?=
 =?utf-8?B?YmVJd3ZRWW8wZmxYRUROaWRvZW4zbkMzZXNZck5MNnkvWkhoK1pqNnVLL21S?=
 =?utf-8?B?VmFhMTFNR1RxT0FkRVBrcWR2Tlo0RFJIaVlJQU5wS2ZBTUZwWEl6NTdaTHIv?=
 =?utf-8?B?VE1CK0EwS0FrY1NVbVFDZG5CcHNKTm9HeHA5UHBTZlFncXJZdmF2cVF6aW1Q?=
 =?utf-8?B?SXM4ZHYycXhsTzJKS0wySkhMcHJTMjlxMFplanNNSThOT2lQWGtIcjJlSDZT?=
 =?utf-8?B?c2RhVUU1bktMTGRPclRmVzEyQ2tieFBPYkZPcnpRRkgzZ0pkNkZyTC9PcGtC?=
 =?utf-8?B?c1NZbXlMQktlV0ZZL0l0QmI4eW9oem1vZWVSVUtDUWUxQytOdVdZOU5kT3Vt?=
 =?utf-8?B?cEFmTGVyd0VEemRxWllVQncrTHp2Q2hTUmZQTGp4NGFud1RZeHhEemxQZU45?=
 =?utf-8?B?d3hHSmczWklmdTJpbEk2NnlGd2NhbVJFYzVZTzJyMW8vdmZlMm54am5tLzRR?=
 =?utf-8?B?N3RBT3NYdkZjMk5yQ2pCUC9teWtIUENkc1l4akF4VVl2LzUrMmNDRzZtMEI1?=
 =?utf-8?B?Z0E3QnJhYUlJbG5HUHp1MFgwNjlDSmlmQTVsVmZmT0FWWHBUbEczWDJDVWx3?=
 =?utf-8?B?U1ArbkV3eUQwdUhlOFlRdEsvendKQVRGdFJqOXdTeHNKTmNRSnVycXVESXhr?=
 =?utf-8?B?dzVHMURESFJvRmR6QmFXMFBUTFBib0NYRWlFRGRBdlJpOG1ITWIwVjJGaEhU?=
 =?utf-8?B?TFhibGVsWkgvRjJaSGFxd21Rbkk4UHllOGYreXgxNmMwWTZuTnNhRUpQRE1N?=
 =?utf-8?B?NFNIUmVSeTFlSGdzTlBoWlNrR3JsR0Rzc2U4VnZsR1Y5RXdCaXpCcEtpRFN2?=
 =?utf-8?B?b09nUExXTytrOUo0Z0s4bnpSV2FVbC9samo1OG9pWlErMXdUa1AvZG14ZWhY?=
 =?utf-8?B?UHZ2REQ4VCtSV3lOdXdTNXd4cHAxN1VRejFhajB3MTcwaStzczZueEIrdTYv?=
 =?utf-8?B?SlRxeGpOVXUxKzMzVU9EUDd1bGc1REdtekVzd1U3NEZVeTNuNG5sNFpzMWcy?=
 =?utf-8?B?M3ZLTmZxQ2RJWS85Q2NHS1dLNFZOdUtXSFg1U3Q4U2NHQnlhd2pjYnhjTElK?=
 =?utf-8?B?aHBxekVoN05JdUsyYnVJc0d6UkYvTXFKcExSdnRwU2tRS0lDQVhoNVdGSkQw?=
 =?utf-8?B?VU00aksxMkJDRlpXcjA4L05QVUFNcHlaRzRPVkhvT1FmQzl1R2JNUElpN0pU?=
 =?utf-8?B?aVozdjFZSHQzRTZyOTFJclRhbnZHRGZhZXhSNjJmTTNZL3gwblNNUWcxMUZY?=
 =?utf-8?B?c0RSVGJ2bG9NWHVvbEp4R2RzbGNQc2R1OGtQS0wvazgyd0puNWIzWUFFTHdP?=
 =?utf-8?B?eW5ielQzalVtUkZUM3dXdG9UU2xpK3gyOFpndEhNekI4TmsvWDMyZ3k0Rnov?=
 =?utf-8?B?aXdxYmN0R0NlcFRPRXZjaFZaMWlvTE9VYno5a2FieFdIVDg0RVAyUG9jYnZs?=
 =?utf-8?B?WmhySTBHQm5ZbHIzTkxNWHJjQThZZVQ2bUZoL2ptMDZzOGphUjRsNytsMlVk?=
 =?utf-8?B?dHE1akxjYmNlNnRvNXI3N0Z3a2xSN0FLZFluQ1BzSlpoMUpmV3E0ZkVaVVF6?=
 =?utf-8?B?SXBSQzczaEVIa2o0ZHZDY2M3Sk04eXFHYW5MQ1BFdjNYZzJjTUtXblB0NDdS?=
 =?utf-8?B?U28vWmRaalRNMmFPTCt3R0NZbHV2NmlLVFg2TWVGUmoxTUZOWDRDaHNpV2l0?=
 =?utf-8?B?TVFFSkNyL25zOXREa1dSNUVaNWhVSDVYb1drbGJrTU92K29Vb21Qa1Z1Z1h5?=
 =?utf-8?B?Q2xxZ0xkS0pQMmE3V2t2dFdPanNQQ0F5cW9kRlEvcmJDWTlCYndXaXZvb3JI?=
 =?utf-8?B?bkdkWmpHQ3JYelkweDJKL1prOTRXOG1sZWxoZXlncUlsLzVOaHdxaXJvcUhI?=
 =?utf-8?B?SVY0TFM4SkFnZ0wxUDF0WDFMSjgzQmEvZmFTZmdKbzZ6cGpVQnNCTDVaMGRI?=
 =?utf-8?B?SVdXQ2pHTkcvam5rNlNZbmRxOTBkeTZpM2FQSTBXVHlNTyt2VFZSZHNsNDYv?=
 =?utf-8?B?NGt4OGx3OWR4TXRVOTZlQldURGZiWWFoNXJEZThiaVhEcEV5V1E3VWdPUk9O?=
 =?utf-8?B?U3B3V0pDSm5GSWlUTGVEQkYwMXgyTHlZYndraTFzaUhIVzRuaWFTeUF5MzFV?=
 =?utf-8?B?aDRIQ09KRjR4QytBS1pDc1owOVVXa2w1RC91aG5WZHl3cGZWbzVlV3hJYW0z?=
 =?utf-8?B?MUF2Z3c2S3VXYU9KRmhXdWZERFZ6d0phTjY4NUNTRWY3VEVkeGxpUjMyVzNi?=
 =?utf-8?B?WUdIeHJUWWU3dHlJRFFzaXZvRWxkaGFQUVhTTEhEWEFSUzF2dk5wQT09?=
X-Exchange-RoutingPolicyChecked: Gg5LjH+6nSsNWLXyz8q82iTrqLOi+b8MH/rbG//hp0sEjA7AfnXKD7dy9OcPNjLLjW35GqK5zKUT7qIRXeW6LWIJbo9J71p12hLn9coPq4quHe2UosjH/KJe3KvWYxYi67xDZ7uJcpzme4O6Es/XrlA7Bw1bCfvrxEYvnlnSJJT/QWPHZQ9j9n8Wx//k/aADRbq0vO17vz6ZkGkLijNU/limjA5mFZ3o0evd8O4WTx7M+f8e77iNbaP29O2y0u/nYxKtNkEVZSp2eL3q+frmXNHMtrN5V0S4S+nsyZ907B0EoSJMfnm2bKf2j06DUcCPOYGgNNQ2jlQzxAvk9v91dA==
X-MS-Exchange-CrossTenant-Network-Message-Id: baa84fb5-8f9a-4c55-6f50-08de8aec8dac
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5706.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 04:02:53.8084 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uOO/F4J7piRDTlyIcetKfIU4q5Go5jVVVDuTEoaclsPWLTXmDIJxaJ635QkhCgpjteHvHa0EsUF5APLcZljS+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4993
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


On 25-03-2026 20:31, Thomas Hellström wrote:
> On Mon, 2026-03-23 at 15:00 +0530, Arvind Yadav wrote:
>> This allows userspace applications to provide memory usage hints to
>> the kernel for better memory management under pressure:
>>
>> Add the core implementation for purgeable buffer objects, enabling
>> memory
>> reclamation of user-designated DONTNEED buffers during eviction.
>>
>> This patch implements the purge operation and state machine
>> transitions:
>>
>> Purgeable States (from xe_madv_purgeable_state):
>>   - WILLNEED (0): BO should be retained, actively used
>>   - DONTNEED (1): BO eligible for purging, not currently needed
>>   - PURGED (2): BO backing store reclaimed, permanently invalid
>>
>> Design Rationale:
>>    - Async TLB invalidation via trigger_rebind (no blocking
>> xe_vm_invalidate_vma)
>>    - i915 compatibility: retained field, "once purged always purged"
>> semantics
>>    - Shared BO protection prevents multi-process memory corruption
>>    - Scratch PTE reuse avoids new infrastructure, safe for fault mode
>>
>> Note: The madvise_purgeable() function is implemented but not hooked
>> into
>> the IOCTL handler (madvise_funcs[] entry is NULL) to maintain
>> bisectability.
>> The feature will be enabled in the final patch when all supporting
>> infrastructure (shrinker, per-VMA tracking) is complete.
>>
>> v2:
>>    - Use xe_bo_trigger_rebind() for async TLB invalidation (Thomas
>> Hellström)
>>    - Add NULL rebind with scratch PTEs for fault mode (Thomas
>> Hellström)
>>    - Implement i915-compatible retained field logic (Thomas Hellström)
>>    - Skip BO validation for purged BOs in page fault handler (crash
>> fix)
>>    - Add scratch VM check in page fault path (non-scratch VMs fail
>> fault)
>>    - Force clear_pt for non-scratch VMs to avoid phys addr 0 mapping
>> (review fix)
>>    - Add !is_purged check to resource cursor setup to prevent stale
>> access
>>
>> v3:
>>    - Rebase as xe_gt_pagefault.c is gone upstream and replaced
>>      with xe_pagefault.c (Matthew Brost)
>>    - Xe specific warn on (Matthew Brost)
>>    - Call helpers for madv_purgeable access(Matthew Brost)
>>    - Remove bo NULL check(Matthew Brost)
>>    - Use xe_bo_assert_held instead of dma assert(Matthew Brost)
>>    - Move the xe_bo_is_purged check under the dma-resv lock( by Matt)
>>    - Drop is_purged from xe_pt_stage_bind_entry and just set is_null
>> to true
>>      for purged BO rename s/is_null/is_null_or_purged (by Matt)
>>    - UAPI rule should not be changed.(Matthew Brost)
>>    - Make 'retained' a userptr (Matthew Brost)
>>
>> v4:
>>    - @madv_purgeable atomic_t → u32 change across all relevant patches
>> (Matt)
>>
>> v5:
>>    - Introduce xe_bo_set_purgeable_state() helper (void return) to
>> centralize
>>      madv_purgeable updates with xe_bo_assert_held() and state
>> transition
>>      validation using explicit enum checks (no transition out of
>> PURGED) (Matt)
>>    - Make xe_ttm_bo_purge() return int and propagate failures from
>>      xe_bo_move(); handle xe_bo_trigger_rebind() failures (e.g.
>> no_wait_gpu
>>      paths) rather than silently ignoring (Matt)
>>    - Replace drm_WARN_ON with xe_assert for better Xe-specific
>> assertions (Matt)
>>    - Hook purgeable handling into
>> madvise_funcs[DRM_XE_VMA_ATTR_PURGEABLE_STATE]
>>      instead of special-case path in xe_vm_madvise_ioctl() (Matt)
>>    - Track purgeable retained return via xe_madvise_details and
>> perform
>>      copy_to_user() from xe_madvise_details_fini() after locks are
>> dropped (Matt)
>>    - Set madvise_funcs[DRM_XE_VMA_ATTR_PURGEABLE_STATE] to NULL with
>>      __maybe_unused on madvise_purgeable() to maintain bisectability
>> until
>>      shrinker integration is complete in final patch (Matt)
>>    - Use put_user() instead of copy_to_user() for single u32 retained
>> value (Thomas)
>>    - Return -EFAULT from ioctl if put_user() fails (Thomas)
>>    - Validate userspace initialized retained to 0 before ioctl,
>> ensuring safe
>>      default (0 = "assume purged") if put_user() fails (Thomas)
>>    - Refactor error handling: separate fallible put_user from
>> infallible cleanup
>>    - xe_madvise_purgeable_retained_to_user(): separate helper for
>> fallible put_user
>>    - Call put_user() after releasing all locks to avoid circular
>> dependencies
>>    - Use xe_bo_move_notify() instead of xe_bo_trigger_rebind() in
>> xe_ttm_bo_purge()
>>      for proper abstraction - handles vunmap, dma-buf notifications,
>> and VRAM
>>      userfault cleanup (Thomas)
>>    - Fix LRU crash while running shrink test
>>    - Skip xe_bo_validate() for purged BOs in xe_gpuvm_validate()
>>
>> v6:
>>    - xe_bo_move_notify() must be called *before* ttm_bo_validate().
>> (Thomas)
>>    - Block GPU page faults (fault-mode VMs) for DONTNEED bo's (Thomas,
>> Matt)
>>    - Rename retained to retained_ptr. (Jose)
>>
>> v7 Changes:
>>    - Fix engine reset from EU overfetch in scratch VMs:
>> xe_pagefault_begin()
>>      and xe_pagefault_service() now return 0 instead of -EACCES/-
>> EINVAL for
>>      DONTNEED/purged BOs and missing VMAs so stale accesses hit
>> scratch PTEs.
>>    - Fix Engine memory CAT errors when Mesa uses
>> DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE:
>>      accept scratch VMs in xe_pagefault_asid_to_vm() via '||
>> xe_vm_has_scratch(vm).
>>    - Skip validate/migrate/rebind for DONTNEED/purged BOs in
>> xe_pagefault_begin()
>>      using a bool *skip_rebind out-parameter. Scratch VMs ACK the
>> fault and fall back
>>      to scratch PTEs; non-scratch VMs return -EACCES.
>>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_bo.c         | 107 ++++++++++++++++++++---
>>   drivers/gpu/drm/xe/xe_bo.h         |   2 +
>>   drivers/gpu/drm/xe/xe_pagefault.c  |  25 +++++-
>>   drivers/gpu/drm/xe/xe_pt.c         |  40 +++++++--
>>   drivers/gpu/drm/xe/xe_vm.c         |  20 ++++-
>>   drivers/gpu/drm/xe/xe_vm_madvise.c | 136
>> +++++++++++++++++++++++++++++
>>   6 files changed, 305 insertions(+), 25 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>> index 22179b2df85c..b6055bb4c578 100644
>> --- a/drivers/gpu/drm/xe/xe_bo.c
>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>> @@ -835,6 +835,84 @@ static int xe_bo_move_notify(struct xe_bo *bo,
>>   	return 0;
>>   }
>>   
>> +/**
>> + * xe_bo_set_purgeable_state() - Set BO purgeable state with
>> validation
>> + * @bo: Buffer object
>> + * @new_state: New purgeable state
>> + *
>> + * Sets the purgeable state with lockdep assertions and validates
>> state
>> + * transitions. Once a BO is PURGED, it cannot transition to any
>> other state.
>> + * Invalid transitions are caught with xe_assert().
>> + */
>> +void xe_bo_set_purgeable_state(struct xe_bo *bo,
>> +			       enum xe_madv_purgeable_state
>> new_state)
>> +{
>> +	struct xe_device *xe = xe_bo_device(bo);
>> +
>> +	xe_bo_assert_held(bo);
>> +
>> +	/* Validate state is one of the known values */
>> +	xe_assert(xe, new_state == XE_MADV_PURGEABLE_WILLNEED ||
>> +		      new_state == XE_MADV_PURGEABLE_DONTNEED ||
>> +		      new_state == XE_MADV_PURGEABLE_PURGED);
>> +
>> +	/* Once purged, always purged - cannot transition out */
>> +	xe_assert(xe, !(bo->madv_purgeable ==
>> XE_MADV_PURGEABLE_PURGED &&
>> +			new_state != XE_MADV_PURGEABLE_PURGED));
>> +
>> +	bo->madv_purgeable = new_state;
>> +}
>> +
>> +/**
>> + * xe_ttm_bo_purge() - Purge buffer object backing store
>> + * @ttm_bo: The TTM buffer object to purge
>> + * @ctx: TTM operation context
>> + *
>> + * This function purges the backing store of a BO marked as DONTNEED
>> and
>> + * triggers rebind to invalidate stale GPU mappings. For fault-mode
>> VMs,
>> + * this zaps the PTEs. The next GPU access will trigger a page fault
>> and
>> + * perform NULL rebind (scratch pages or clear PTEs based on VM
>> config).
>> + *
>> + * Return: 0 on success, negative error code on failure
>> + */
>> +static int xe_ttm_bo_purge(struct ttm_buffer_object *ttm_bo, struct
>> ttm_operation_ctx *ctx)
>> +{
>> +	struct xe_bo *bo = ttm_to_xe_bo(ttm_bo);
>> +	struct ttm_placement place = {};
>> +	int ret;
>> +
>> +	xe_bo_assert_held(bo);
>> +
>> +	if (!ttm_bo->ttm)
>> +		return 0;
>> +
>> +	if (!xe_bo_madv_is_dontneed(bo))
>> +		return 0;
>> +
>> +	/*
>> +	 * Use the standard pre-move hook so we share the same
>> cleanup/invalidate
>> +	 * path as migrations: drop any CPU vmap and schedule the
>> necessary GPU
>> +	 * unbind/rebind work.
>> +	 *
>> +	 * This must be called before ttm_bo_validate() frees the
>> pages.
>> +	 * May fail in no-wait contexts (fault/shrinker) or if the
>> BO is
>> +	 * pinned. Keep state unchanged on failure so we don't end
>> up "PURGED"
>> +	 * with stale mappings.
>> +	 */
>> +	ret = xe_bo_move_notify(bo, ctx);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = ttm_bo_validate(ttm_bo, &place, ctx);
>> +	if (ret)
>> +		return ret;
>> +
>> +	/* Commit the state transition only once invalidation was
>> queued */
>> +	xe_bo_set_purgeable_state(bo, XE_MADV_PURGEABLE_PURGED);
>> +
>> +	return 0;
>> +}
>> +
>>   static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>>   		      struct ttm_operation_ctx *ctx,
>>   		      struct ttm_resource *new_mem,
>> @@ -854,6 +932,20 @@ static int xe_bo_move(struct ttm_buffer_object
>> *ttm_bo, bool evict,
>>   				  ttm && ttm_tt_is_populated(ttm)) ?
>> true : false;
>>   	int ret = 0;
>>   
>> +	/*
>> +	 * Purge only non-shared BOs explicitly marked DONTNEED by
>> userspace.
>> +	 * The move_notify callback will handle invalidation
>> asynchronously.
>> +	 */
>> +	if (evict && xe_bo_madv_is_dontneed(bo)) {
>> +		ret = xe_ttm_bo_purge(ttm_bo, ctx);
>> +		if (ret)
>> +			return ret;
>> +
>> +		/* Free the unused eviction destination resource */
>> +		ttm_resource_free(ttm_bo, &new_mem);
>> +		return 0;
>> +	}
>> +
>>   	/* Bo creation path, moving to system or TT. */
>>   	if ((!old_mem && ttm) && !handle_system_ccs) {
>>   		if (new_mem->mem_type == XE_PL_TT)
>> @@ -1603,18 +1695,6 @@ static void xe_ttm_bo_delete_mem_notify(struct
>> ttm_buffer_object *ttm_bo)
>>   	}
>>   }
>>   
>> -static void xe_ttm_bo_purge(struct ttm_buffer_object *ttm_bo, struct
>> ttm_operation_ctx *ctx)
>> -{
>> -	struct xe_device *xe = ttm_to_xe_device(ttm_bo->bdev);
>> -
>> -	if (ttm_bo->ttm) {
>> -		struct ttm_placement place = {};
>> -		int ret = ttm_bo_validate(ttm_bo, &place, ctx);
>> -
>> -		drm_WARN_ON(&xe->drm, ret);
>> -	}
>> -}
>> -
>>   static void xe_ttm_bo_swap_notify(struct ttm_buffer_object *ttm_bo)
>>   {
>>   	struct ttm_operation_ctx ctx = {
>> @@ -2195,6 +2275,9 @@ struct xe_bo *xe_bo_init_locked(struct
>> xe_device *xe, struct xe_bo *bo,
>>   #endif
>>   	INIT_LIST_HEAD(&bo->vram_userfault_link);
>>   
>> +	/* Initialize purge advisory state */
>> +	bo->madv_purgeable = XE_MADV_PURGEABLE_WILLNEED;
>> +
>>   	drm_gem_private_object_init(&xe->drm, &bo->ttm.base, size);
>>   
>>   	if (resv) {
>> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
>> index fb5541bdf602..653851d47aa6 100644
>> --- a/drivers/gpu/drm/xe/xe_bo.h
>> +++ b/drivers/gpu/drm/xe/xe_bo.h
>> @@ -271,6 +271,8 @@ static inline bool xe_bo_madv_is_dontneed(struct
>> xe_bo *bo)
>>   	return bo->madv_purgeable == XE_MADV_PURGEABLE_DONTNEED;
>>   }
>>   
>> +void xe_bo_set_purgeable_state(struct xe_bo *bo, enum
>> xe_madv_purgeable_state new_state);
>> +
>>   static inline void xe_bo_unpin_map_no_vm(struct xe_bo *bo)
>>   {
>>   	if (likely(bo)) {
>> diff --git a/drivers/gpu/drm/xe/xe_pagefault.c
>> b/drivers/gpu/drm/xe/xe_pagefault.c
>> index ea4857acf28d..415253631e6f 100644
>> --- a/drivers/gpu/drm/xe/xe_pagefault.c
>> +++ b/drivers/gpu/drm/xe/xe_pagefault.c
>> @@ -46,7 +46,8 @@ static int xe_pagefault_entry_size(void)
>>   }
>>   
>>   static int xe_pagefault_begin(struct drm_exec *exec, struct xe_vma
>> *vma,
>> -			      struct xe_vram_region *vram, bool
>> need_vram_move)
>> +			      struct xe_vram_region *vram, bool
>> need_vram_move,
>> +			      bool *skip_rebind)
>>   {
>>   	struct xe_bo *bo = xe_vma_bo(vma);
>>   	struct xe_vm *vm = xe_vma_vm(vma);
>> @@ -59,6 +60,20 @@ static int xe_pagefault_begin(struct drm_exec
>> *exec, struct xe_vma *vma,
>>   	if (!bo)
>>   		return 0;
>>   
>> +	/*
>> +	 * Under dma-resv lock: reject rebind for DONTNEED/purged
>> BOs.
>> +	 * Validating or migrating would repopulate pages we want
>> the shrinker
>> +	 * to reclaim, and rebinding would undo the GPU PTE zap.
>> +	 * Scratch VMs absorb the access via scratch PTEs
>> (skip_rebind=true);
>> +	 * non-scratch VMs have no fallback so fail the fault.
>> +	 */
>> +	if (unlikely(xe_bo_madv_is_dontneed(bo) ||
>> xe_bo_is_purged(bo))) {
>> +		if (!xe_vm_has_scratch(vm))
>> +			return -EACCES;
>> +		*skip_rebind = true;
> So what happens here if we have a scratch VM, then do a lazy VM_BIND,
> then madvise(DONTNEED) and then hit a page-fault. If we then
> skip_rebind, aren't we going to hit the same pagefault again and again?


You're right, thank you for catching this. With lazy VM_BIND + scratch 
VM + madvise(DONTNEED), skip_rebind=true meant no PTEs were ever 
written, so tile_present stayed 0 and the GPU kept faulting on the same 
address — infinite loop.

Fix: remove skip_rebind and let rebind proceed for scratch VMs. 
xe_pt_stage_bind already handles both cases — DONTNEED BOs get real PTEs 
(pages are still alive, shrinker can purge later), and PURGED BOs get 
XE_PTE_NULL scratch PTEs. Either way tile_present is updated and the 
fault resolves.


>
>
>
>> +		return 0;
>> +	}
>> +
>>   	return need_vram_move ? xe_bo_migrate(bo, vram->placement,
>> NULL, exec) :
>>   		xe_bo_validate(bo, vm, true, exec);
>>   }
>> @@ -103,11 +118,13 @@ static int xe_pagefault_handle_vma(struct xe_gt
>> *gt, struct xe_vma *vma,
>>   	/* Lock VM and BOs dma-resv */
>>   	xe_validation_ctx_init(&ctx, &vm->xe->val, &exec, (struct
>> xe_val_flags) {});
>>   	drm_exec_until_all_locked(&exec) {
>> +		bool skip_rebind = false;
>> +
>>   		err = xe_pagefault_begin(&exec, vma, tile->mem.vram,
>> -					 needs_vram == 1);
>> +					 needs_vram == 1,
>> &skip_rebind);
>>   		drm_exec_retry_on_contention(&exec);
>>   		xe_validation_retry_on_oom(&ctx, &err);
>> -		if (err)
>> +		if (err || skip_rebind)
>>   			goto unlock_dma_resv;
>>   
>>   		/* Bind VMA only to the GT that has faulted */
>> @@ -145,7 +162,7 @@ static struct xe_vm
>> *xe_pagefault_asid_to_vm(struct xe_device *xe, u32 asid)
>>   
>>   	down_read(&xe->usm.lock);
>>   	vm = xa_load(&xe->usm.asid_to_vm, asid);
>> -	if (vm && xe_vm_in_fault_mode(vm))
>> +	if (vm && (xe_vm_in_fault_mode(vm) ||
>> xe_vm_has_scratch(vm)))
>>   		xe_vm_get(vm);
>>   	else
>>   		vm = ERR_PTR(-EINVAL);
>> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
>> index 2d9ce2c4cb4f..08f40701f654 100644
>> --- a/drivers/gpu/drm/xe/xe_pt.c
>> +++ b/drivers/gpu/drm/xe/xe_pt.c
>> @@ -531,20 +531,26 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent,
>> pgoff_t offset,
>>   	/* Is this a leaf entry ?*/
>>   	if (level == 0 || xe_pt_hugepte_possible(addr, next, level,
>> xe_walk)) {
>>   		struct xe_res_cursor *curs = xe_walk->curs;
>> -		bool is_null = xe_vma_is_null(xe_walk->vma);
>> -		bool is_vram = is_null ? false :
>> xe_res_is_vram(curs);
>> +		struct xe_bo *bo = xe_vma_bo(xe_walk->vma);
>> +		bool is_null_or_purged = xe_vma_is_null(xe_walk-
>>> vma) ||
>> +					 (bo &&
>> xe_bo_is_purged(bo));
>> +		bool is_vram = is_null_or_purged ? false :
>> xe_res_is_vram(curs);
>>   
>>   		XE_WARN_ON(xe_walk->va_curs_start != addr);
>>   
>>   		if (xe_walk->clear_pt) {
>>   			pte = 0;
>>   		} else {
>> -			pte = vm->pt_ops->pte_encode_vma(is_null ? 0
>> :
>> +			/*
>> +			 * For purged BOs, treat like null VMAs -
>> pass address 0.
>> +			 * The pte_encode_vma will set XE_PTE_NULL
>> flag for scratch mapping.
>> +			 */
>> +			pte = vm->pt_ops-
>>> pte_encode_vma(is_null_or_purged ? 0 :
>>   							
>> xe_res_dma(curs) +
>>   							 xe_walk-
>>> dma_offset,
>>   							 xe_walk-
>>> vma,
>>   							 pat_index,
>> level);
>> -			if (!is_null)
>> +			if (!is_null_or_purged)
>>   				pte |= is_vram ? xe_walk-
>>> default_vram_pte :
>>   					xe_walk->default_system_pte;
>>   
>> @@ -568,7 +574,7 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent,
>> pgoff_t offset,
>>   		if (unlikely(ret))
>>   			return ret;
>>   
>> -		if (!is_null && !xe_walk->clear_pt)
>> +		if (!is_null_or_purged && !xe_walk->clear_pt)
>>   			xe_res_next(curs, next - addr);
>>   		xe_walk->va_curs_start = next;
>>   		xe_walk->vma->gpuva.flags |= (XE_VMA_PTE_4K <<
>> level);
>> @@ -721,6 +727,26 @@ xe_pt_stage_bind(struct xe_tile *tile, struct
>> xe_vma *vma,
>>   	};
>>   	struct xe_pt *pt = vm->pt_root[tile->id];
>>   	int ret;
>> +	bool is_purged = false;
>> +
>> +	/*
>> +	 * Check if BO is purged:
>> +	 * - Scratch VMs: Use scratch PTEs (XE_PTE_NULL) for safe
>> zero reads
>> +	 * - Non-scratch VMs: Clear PTEs to zero (non-present) to
>> avoid mapping to phys addr 0
>> +	 *
>> +	 * For non-scratch VMs, we force clear_pt=true so leaf PTEs
>> become completely
>> +	 * zero instead of creating a PRESENT mapping to physical
>> address 0.
>> +	 */
>> +	if (bo && xe_bo_is_purged(bo)) {
>> +		is_purged = true;
>> +
>> +		/*
>> +		 * For non-scratch VMs, a NULL rebind should use
>> zero PTEs
>> +		 * (non-present), not a present PTE to phys 0.
>> +		 */
>> +		if (!xe_vm_has_scratch(vm))
>> +			xe_walk.clear_pt = true;
>> +	}
>>   
>>   	if (range) {
>>   		/* Move this entire thing to xe_svm.c? */
>> @@ -756,11 +782,11 @@ xe_pt_stage_bind(struct xe_tile *tile, struct
>> xe_vma *vma,
>>   	}
>>   
>>   	xe_walk.default_vram_pte |= XE_PPGTT_PTE_DM;
>> -	xe_walk.dma_offset = bo ? vram_region_gpu_offset(bo-
>>> ttm.resource) : 0;
>> +	xe_walk.dma_offset = (bo && !is_purged) ?
>> vram_region_gpu_offset(bo->ttm.resource) : 0;
>>   	if (!range)
>>   		xe_bo_assert_held(bo);
>>   
>> -	if (!xe_vma_is_null(vma) && !range) {
>> +	if (!xe_vma_is_null(vma) && !range && !is_purged) {
>>   		if (xe_vma_is_userptr(vma))
>>   			xe_res_first_dma(to_userptr_vma(vma)-
>>> userptr.pages.dma_addr, 0,
>>   					 xe_vma_size(vma), &curs);
>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index 5572e12c2a7e..a0ade67d616e 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -326,6 +326,7 @@ void xe_vm_kill(struct xe_vm *vm, bool unlocked)
>>   static int xe_gpuvm_validate(struct drm_gpuvm_bo *vm_bo, struct
>> drm_exec *exec)
>>   {
>>   	struct xe_vm *vm = gpuvm_to_vm(vm_bo->vm);
>> +	struct xe_bo *bo = gem_to_xe_bo(vm_bo->obj);
>>   	struct drm_gpuva *gpuva;
>>   	int ret;
>>   
>> @@ -334,10 +335,16 @@ static int xe_gpuvm_validate(struct
>> drm_gpuvm_bo *vm_bo, struct drm_exec *exec)
>>   		list_move_tail(&gpuva_to_vma(gpuva)-
>>> combined_links.rebind,
>>   			       &vm->rebind_list);
>>   
>> +	/* Skip re-populating purged BOs, rebind maps scratch pages.
>> */
>> +	if (xe_bo_is_purged(bo)) {
>> +		vm_bo->evicted = false;
>> +		return 0;
>> +	}
>> +
>>   	if (!try_wait_for_completion(&vm->xe->pm_block))
>>   		return -EAGAIN;
>>   
>> -	ret = xe_bo_validate(gem_to_xe_bo(vm_bo->obj), vm, false,
>> exec);
>> +	ret = xe_bo_validate(bo, vm, false, exec);
>>   	if (ret)
>>   		return ret;
>>   
>> @@ -1358,6 +1365,9 @@ static u64 xelp_pte_encode_bo(struct xe_bo *bo,
>> u64 bo_offset,
>>   static u64 xelp_pte_encode_vma(u64 pte, struct xe_vma *vma,
>>   			       u16 pat_index, u32 pt_level)
>>   {
>> +	struct xe_bo *bo = xe_vma_bo(vma);
>> +	struct xe_vm *vm = xe_vma_vm(vma);
>> +
>>   	pte |= XE_PAGE_PRESENT;
>>   
>>   	if (likely(!xe_vma_read_only(vma)))
>> @@ -1366,7 +1376,13 @@ static u64 xelp_pte_encode_vma(u64 pte, struct
>> xe_vma *vma,
>>   	pte |= pte_encode_pat_index(pat_index, pt_level);
>>   	pte |= pte_encode_ps(pt_level);
>>   
>> -	if (unlikely(xe_vma_is_null(vma)))
>> +	/*
>> +	 * NULL PTEs redirect to scratch page (return zeros on
>> read).
>> +	 * Set for: 1) explicit null VMAs, 2) purged BOs on scratch
>> VMs.
>> +	 * Never set NULL flag without scratch page - causes
>> undefined behavior.
>> +	 */
>> +	if (unlikely(xe_vma_is_null(vma) ||
>> +		     (bo && xe_bo_is_purged(bo) &&
>> xe_vm_has_scratch(vm))))
>>   		pte |= XE_PTE_NULL;
>>   
>>   	return pte;
>> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c
>> b/drivers/gpu/drm/xe/xe_vm_madvise.c
>> index 869db304d96d..ffba2e41c539 100644
>> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
>> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
>> @@ -26,6 +26,8 @@ struct xe_vmas_in_madvise_range {
>>   /**
>>    * struct xe_madvise_details - Argument to madvise_funcs
>>    * @dpagemap: Reference-counted pointer to a struct drm_pagemap.
>> + * @has_purged_bo: Track if any BO was purged (for purgeable state)
>> + * @retained_ptr: User pointer for retained value (for purgeable
>> state)
>>    *
>>    * The madvise IOCTL handler may, in addition to the user-space
>>    * args, have additional info to pass into the madvise_func that
>> @@ -34,6 +36,8 @@ struct xe_vmas_in_madvise_range {
>>    */
>>   struct xe_madvise_details {
>>   	struct drm_pagemap *dpagemap;
>> +	bool has_purged_bo;
>> +	u64 retained_ptr;
>>   };
>>   
>>   static int get_vmas(struct xe_vm *vm, struct
>> xe_vmas_in_madvise_range *madvise_range)
>> @@ -180,6 +184,67 @@ static void madvise_pat_index(struct xe_device
>> *xe, struct xe_vm *vm,
>>   	}
>>   }
>>   
>> +/**
>> + * madvise_purgeable - Handle purgeable buffer object advice
>> + * @xe: XE device
>> + * @vm: VM
>> + * @vmas: Array of VMAs
>> + * @num_vmas: Number of VMAs
>> + * @op: Madvise operation
>> + * @details: Madvise details for return values
>> + *
>> + * Handles DONTNEED/WILLNEED/PURGED states. Tracks if any BO was
>> purged
>> + * in details->has_purged_bo for later copy to userspace.
>> + *
>> + * Note: Marked __maybe_unused until hooked into madvise_funcs[] in
>> the
>> + * final patch to maintain bisectability. The NULL placeholder in
>> the
>> + * array ensures proper -EINVAL return for userspace until all
>> supporting
>> + * infrastructure (shrinker, per-VMA tracking) is complete.
>> + */
>> +static void __maybe_unused madvise_purgeable(struct xe_device *xe,
>> +					     struct xe_vm *vm,
>> +					     struct xe_vma **vmas,
>> +					     int num_vmas,
>> +					     struct drm_xe_madvise
>> *op,
>> +					     struct
>> xe_madvise_details *details)
>> +{
>> +	int i;
>> +
>> +	xe_assert(vm->xe, op->type ==
>> DRM_XE_VMA_ATTR_PURGEABLE_STATE);
>> +
>> +	for (i = 0; i < num_vmas; i++) {
>> +		struct xe_bo *bo = xe_vma_bo(vmas[i]);
>> +
>> +		if (!bo)
>> +			continue;
>> +
>> +		/* BO must be locked before modifying madv state */
>> +		xe_bo_assert_held(bo);
>> +
>> +		/*
>> +		 * Once purged, always purged. Cannot transition
>> back to WILLNEED.
>> +		 * This matches i915 semantics where purged BOs are
>> permanently invalid.
>> +		 */
>> +		if (xe_bo_is_purged(bo)) {
>> +			details->has_purged_bo = true;
>> +			continue;
>> +		}
>> +
>> +		switch (op->purge_state_val.val) {
>> +		case DRM_XE_VMA_PURGEABLE_STATE_WILLNEED:
>> +			xe_bo_set_purgeable_state(bo,
>> XE_MADV_PURGEABLE_WILLNEED);
>> +			break;
>> +		case DRM_XE_VMA_PURGEABLE_STATE_DONTNEED:
>> +			xe_bo_set_purgeable_state(bo,
>> XE_MADV_PURGEABLE_DONTNEED);
>> +			break;
>> +		default:
>> +			drm_warn(&vm->xe->drm, "Invalid madvice
>> value = %d\n",
> Please use either "madvise" with an 's' or "advice".


Noted.

Thanks,
Arvind

>
> Thanks,
> Thomas
>
>
>
>> +				 op->purge_state_val.val);
>> +			return;
>> +		}
>> +	}
>> +}
>> +
>>   typedef void (*madvise_func)(struct xe_device *xe, struct xe_vm *vm,
>>   			     struct xe_vma **vmas, int num_vmas,
>>   			     struct drm_xe_madvise *op,
>> @@ -189,6 +254,12 @@ static const madvise_func madvise_funcs[] = {
>>   	[DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC] =
>> madvise_preferred_mem_loc,
>>   	[DRM_XE_MEM_RANGE_ATTR_ATOMIC] = madvise_atomic,
>>   	[DRM_XE_MEM_RANGE_ATTR_PAT] = madvise_pat_index,
>> +	/*
>> +	 * Purgeable support implemented but not enabled yet to
>> maintain
>> +	 * bisectability. Will be set to madvise_purgeable() in
>> final patch
>> +	 * when all infrastructure (shrinker, VMA tracking) is
>> complete.
>> +	 */
>> +	[DRM_XE_VMA_ATTR_PURGEABLE_STATE] = NULL,
>>   };
>>   
>>   static u8 xe_zap_ptes_in_madvise_range(struct xe_vm *vm, u64 start,
>> u64 end)
>> @@ -319,6 +390,19 @@ static bool madvise_args_are_sane(struct
>> xe_device *xe, const struct drm_xe_madv
>>   			return false;
>>   		break;
>>   	}
>> +	case DRM_XE_VMA_ATTR_PURGEABLE_STATE:
>> +	{
>> +		u32 val = args->purge_state_val.val;
>> +
>> +		if (XE_IOCTL_DBG(xe, !(val ==
>> DRM_XE_VMA_PURGEABLE_STATE_WILLNEED ||
>> +				       val ==
>> DRM_XE_VMA_PURGEABLE_STATE_DONTNEED)))
>> +			return false;
>> +
>> +		if (XE_IOCTL_DBG(xe, args->purge_state_val.pad))
>> +			return false;
>> +
>> +		break;
>> +	}
>>   	default:
>>   		if (XE_IOCTL_DBG(xe, 1))
>>   			return false;
>> @@ -337,6 +421,12 @@ static int xe_madvise_details_init(struct xe_vm
>> *vm, const struct drm_xe_madvise
>>   
>>   	memset(details, 0, sizeof(*details));
>>   
>> +	/* Store retained pointer for purgeable state */
>> +	if (args->type == DRM_XE_VMA_ATTR_PURGEABLE_STATE) {
>> +		details->retained_ptr = args-
>>> purge_state_val.retained_ptr;
>> +		return 0;
>> +	}
>> +
>>   	if (args->type == DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC) {
>>   		int fd = args->preferred_mem_loc.devmem_fd;
>>   		struct drm_pagemap *dpagemap;
>> @@ -365,6 +455,21 @@ static void xe_madvise_details_fini(struct
>> xe_madvise_details *details)
>>   	drm_pagemap_put(details->dpagemap);
>>   }
>>   
>> +static int xe_madvise_purgeable_retained_to_user(const struct
>> xe_madvise_details *details)
>> +{
>> +	u32 retained;
>> +
>> +	if (!details->retained_ptr)
>> +		return 0;
>> +
>> +	retained = !details->has_purged_bo;
>> +
>> +	if (put_user(retained, (u32 __user
>> *)u64_to_user_ptr(details->retained_ptr)))
>> +		return -EFAULT;
>> +
>> +	return 0;
>> +}
>> +
>>   static bool check_bo_args_are_sane(struct xe_vm *vm, struct xe_vma
>> **vmas,
>>   				   int num_vmas, u32 atomic_val)
>>   {
>> @@ -422,6 +527,7 @@ int xe_vm_madvise_ioctl(struct drm_device *dev,
>> void *data, struct drm_file *fil
>>   	struct xe_vm *vm;
>>   	struct drm_exec exec;
>>   	int err, attr_type;
>> +	bool do_retained;
>>   
>>   	vm = xe_vm_lookup(xef, args->vm_id);
>>   	if (XE_IOCTL_DBG(xe, !vm))
>> @@ -432,6 +538,25 @@ int xe_vm_madvise_ioctl(struct drm_device *dev,
>> void *data, struct drm_file *fil
>>   		goto put_vm;
>>   	}
>>   
>> +	/* Cache whether we need to write retained, and validate
>> it's initialized to 0 */
>> +	do_retained = args->type == DRM_XE_VMA_ATTR_PURGEABLE_STATE
>> &&
>> +		      args->purge_state_val.retained_ptr;
>> +	if (do_retained) {
>> +		u32 retained;
>> +		u32 __user *retained_ptr;
>> +
>> +		retained_ptr = u64_to_user_ptr(args-
>>> purge_state_val.retained_ptr);
>> +		if (get_user(retained, retained_ptr)) {
>> +			err = -EFAULT;
>> +			goto put_vm;
>> +		}
>> +
>> +		if (XE_IOCTL_DBG(xe, retained != 0)) {
>> +			err = -EINVAL;
>> +			goto put_vm;
>> +		}
>> +	}
>> +
>>   	xe_svm_flush(vm);
>>   
>>   	err = down_write_killable(&vm->lock);
>> @@ -487,6 +612,13 @@ int xe_vm_madvise_ioctl(struct drm_device *dev,
>> void *data, struct drm_file *fil
>>   	}
>>   
>>   	attr_type = array_index_nospec(args->type,
>> ARRAY_SIZE(madvise_funcs));
>> +
>> +	/* Ensure the madvise function exists for this type */
>> +	if (!madvise_funcs[attr_type]) {
>> +		err = -EINVAL;
>> +		goto err_fini;
>> +	}
>> +
>>   	madvise_funcs[attr_type](xe, vm, madvise_range.vmas,
>> madvise_range.num_vmas, args,
>>   				 &details);
>>   
>> @@ -505,6 +637,10 @@ int xe_vm_madvise_ioctl(struct drm_device *dev,
>> void *data, struct drm_file *fil
>>   	xe_madvise_details_fini(&details);
>>   unlock_vm:
>>   	up_write(&vm->lock);
>> +
>> +	/* Write retained value to user after releasing all locks */
>> +	if (!err && do_retained)
>> +		err =
>> xe_madvise_purgeable_retained_to_user(&details);
>>   put_vm:
>>   	xe_vm_put(vm);
>>   	return err;
