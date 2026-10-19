Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C9D4606A320
	for <intel-xe@archiver.kernel.org>; Mon, 19 Oct 2026 23:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QzG4uSYH
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E70A10E6A1;
	Mon, 19 Oct 2026 23:36:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B23E10E6A1
 for <intel-xe@lists.freedesktop.org>; Mon, 19 Oct 2026 23:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792453010; x=1823989010;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=f1msUdneCTSHbKDFEq9x/GwCD4N2rkSgSaVIG2865vk=;
 b=QzG4uSYH8o5BRBo+N4STmpdO6/ZGleFoUTj5qoQhgbZUgXfHSpEQKktb
 Z2U+KDx1FNqzUH7+8Tc/jBsvoX87D3voVDz4wj1CR9LmLkMjhxISB44Ec
 SHlTna779lrK+jUJ21ueO8HWOO8/vbEsWOU755wNgkIa4tn7AekbLl+to
 oPG2O6JSCW5QD+OixZz+pU1PRkOJN1ylC2uL4HMFfh4cEOihRJN/NBT5D
 6JuaisUoNDWqx+ob2ySLhEFdOu5HcFTF2jNHhyCkZlYeDGkK4ctSwuyRt
 Z6jESsrm39GDPobZKR4CJrT+bqwzSnN8xnOMjiYjxOryIlaRpMmNjHXHz A==;
X-CSE-ConnectionGUID: t1fywLOcSAi6X31OIXmSzg==
X-CSE-MsgGUID: RBts7ZinTR+4327hgSXLfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1052490"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1052490"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 16:36:50 -0700
X-CSE-ConnectionGUID: LQoDOfWzT6m4Mb8qxrBL+A==
X-CSE-MsgGUID: Y0/0hhnTSEyA7WmMfHdGCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="2675558"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 16:36:50 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 19 Oct 2026 16:36:49 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 19 Oct 2026 16:36:49 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.17) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 19 Oct 2026 16:36:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ap4H/6j+pdYkRXTXMV0cXvowH9n6SCVDftGWTz2GO1EDQKyjrJKdHUE3ivBBxy03LiE2cRdFVLoTCfuCoK75cSN87kAbNMomXBN0t3StAot7eH+7om3VwO5eeOe2J4b3aCtApyn/F2jlYFv1aBFMtPSYvq6RFLKiTwxTHjHSYbsLhUJjAQx19lXLHAaXDyCA8+1EIVnxFVn5qn4QMd8Gjk3cfJ9HjNgI6tqqG70BHTOj6nBP0zuj1Z1fzeVzN+NsGGBrRHjDgPlgYmWWjwsXp5lzArVx1OjyiZYmRwqp/AwzBXuK+8vv2iM7f+wbvpB460LUjWlrkbMEZpL9vnmhDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pdsNA96WQVgo5mQkSlIjPYmuz4weLzjMI0RniVOlYAM=;
 b=Fj37BJwdnJPIaEIRWIiReI42OV/k5cL8KLw45JnjrdydbE7V6mZ/P4i2OjH89xBmteo5MfmwdE26btEEfV9VN1hc7SYpGWIcIKUKUC9SQ4dRvFc2nBxxRmcqivKPFUdRDQTNZR/xytF2JgHX/8atP+dyozE4FiakKRuP11/bidttBAd/1gEblbOKouBU6PZiRieefUzNGkfAIBeP5DfvrQ30cbmgqkXjZ63du7CRU7cyuzkodOzACwR7iiJm5Pz7ACUZNHMYZ5mDo3fkJyA5Tcs2rgD2WrK49DtXJIUvquyHbak5Id9GVJe3XUtMxN0ZppzK8cQNhfmUySGJz2Zi8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SJ5PPFAC7DDD7F1.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::84b) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 23:36:47 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%6]) with mapi id 15.21.0522.016; Mon, 19 Oct 2026
 23:36:47 +0000
Date: Mon, 19 Oct 2026 16:36:45 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZVTEw=?= =?utf-8?Q?=3A?= failure for Use
 SIG_ID logs for GuC component (rev7)
Message-ID: <atapjfi4N61qfun2@soc-5CG1426VCC.clients.intel.com>
References: <20261016204354.364846-9-umesh.nerlige.ramappa@intel.com>
 <179220758004.36666.2568011004864931321@221881a7231d>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <179220758004.36666.2568011004864931321@221881a7231d>
X-ClientProxiedBy: MW4PR04CA0194.namprd04.prod.outlook.com
 (2603:10b6:303:86::19) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SJ5PPFAC7DDD7F1:EE_
X-MS-Office365-Filtering-Correlation-Id: 08a753d7-6f96-4693-09a0-08df2e39d793
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|18002099003|22082099003|10067099003|5023799004|4143699003|261009223027099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: EctDgyN5MpbyLY9DbWpsuqzwD+V1E/8IbD6MXLP4E4kxtiPOwjIXLmFmTwHmj4Ojqqi2TvGtjnl3XVDr6cSGu+N/tSN+cNPmM0px94cznJkbX39PA4Tg16Jj1Dng4dpHtlVp/Tma+7hdUSDxAbxx7IFKdrCXZpS3qmNXoKRIiasb7v0axigE6juibPzR7vMb4Y0vCX8iUhaey0rHArIrDFZ40WINa5wM8ZksothDDeJZHpVKVPwmTgpoJL7xsFrUddAKxKFXVRP43dzS9yy2jcaDwCjeW7w4cQaVmKXhKycysVoODx/SWyGb2LTzFUcSyc7OeCtL4+9KGvB6Oj1iWBQ/DNNASUOIxqMsy9ily8c3XJ4GUHWLdps2/dB4njmJC+VaTHx59Un2xRQllBjwQPy73ie+E2VPo9QeffPeQqV2QoYrKKZNxNeXcIOVr+XxVbS/KkAtyj8othYcOaTXE3d+/BqGm67wEwifHUVPReFY1mdSIgHd2atMa9cCpphDUj1RrC8t/A2Rah5sgb3ZhW7RgyZCJSTXPrMpZgkC/KaDPQOCPQLJtF/DQu4DPniKZKAUhvTr6C1n+I/K7mIg3es1MaEDudtUkoNKKsBfL6aqZSLyvymhfBQ0+jrjdpfZ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(18002099003)(22082099003)(10067099003)(5023799004)(4143699003)(261009223027099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RzQya0F3bVFOaUl6ajdINmUzSkdWRWtTM0JHWXRXcm1ic2VtYTFMRDZkMDZZ?=
 =?utf-8?B?WW1yLzBaWUJuYVRuSVh4Q0F2NDF5ZDhkMFcvZDZWZzZYcnZHeWZzUDZFTDMv?=
 =?utf-8?B?SWtTb1g1V25ZVHBISUJRK0JYb0xlYmlCSWIzS0lpc0RUYzBtRVJvZ1M1Tnl1?=
 =?utf-8?B?Rlk2ZlZIeG9NWk5kZjRYc2tXak5xQnllVkFWdzk2RVA4cDVOK1M2a055THk2?=
 =?utf-8?B?aGN0b2t4VnFMdFpBMDZMNC8zamlzNEx1TjRQRFZhMUE1Z0s0WXo2em12dmxw?=
 =?utf-8?B?bkNocHdxYTEwdUNwRW9FdUg0OCtGelc4eWRwbGhobW1xYlBsWmVaWlRGdE1O?=
 =?utf-8?B?OXB4a1YveEpXRWNxYkdVZG0zb1FCL2xHUzNMcDYyYldHc2ZPSXhCQXc4ZVRM?=
 =?utf-8?B?ay9pMGtRQ0pYMlBTZG03MTllSXVWaGg4Qjk3a0QxNUd1dU0rRG1IKy80Q2FU?=
 =?utf-8?B?eUY1Y1lLem1YYk4zUVVodFlpNXZqa050R3lXdVdSUnlUaldpeDJGcytyTDh5?=
 =?utf-8?B?aVZWT2RnbXZxOVlaOTVKak9KRDlDL0FiVmtpTVBWU3BUVjZwcjJJc1VqTEVC?=
 =?utf-8?B?NnBCYTBubEZ0MSt5RG1yRlNWYlBUUGFVMFFLUGd5RU4zTzdOSlVjTnZMSm5q?=
 =?utf-8?B?T2dSYlNNSHNrY3BKMzQ4ODc5MnhjUHI1bTBQR2V5ckRoYTFBR0ZDMVh5WXZL?=
 =?utf-8?B?ZUlZNEYrVkFPcFI2a2p1MjJNdnFmeURGakhGSWJOejhLWTFPNE9jbXd2bmhV?=
 =?utf-8?B?emRGR0N0MnVkaE9RWTZHblUwOGlBeUxES1VJK25taklZTlA2Y011RVlnNjN5?=
 =?utf-8?B?eDgyemdXOWVYVGk1ODNRNEU4ZEdLSnhDeTJoZGZGaDhhajN2dWErL2pGZGVQ?=
 =?utf-8?B?dFN4OVVRTlBuMzRha0Jvbmkwa05PeTk1Y1B6RmRNQUFPOVRkSStsTjhBVWdC?=
 =?utf-8?B?Lzl1c2xNMWdmNnloZXc1OW15SUJqUUl3aWVFN0c4STVacDBQYjd4UlV5Nlp2?=
 =?utf-8?B?SjZaNzUzL25LbnRzNEVIQ01vdjgyYUEvSStmUGllWnRwYThYUENFVHdjT1FP?=
 =?utf-8?B?NlBLTEowdkVGNHZmUFM3Q1B2S1gyTHdKdWw2aUhqbkxzYnZ3YWRnb21CSTh6?=
 =?utf-8?B?UkpwUENrdHl4Ri9CMlk0ZHorWDFSQUpPWXVJdXRuNis0a1JOMEpXY1hTN042?=
 =?utf-8?B?RGEvajFvRnZscUtMbDluSVcwVWgybzkySGI3MXArZEFLcUowYmh0YXVMTzgy?=
 =?utf-8?B?MDl3dkJNTDBYZms3ZWRBZGlCaHM0YXFBcDc0TVpEMkdDSDZXdkwxSW9tVkZI?=
 =?utf-8?B?eVJRMGxlK2IrYkJnT2JxUmgzVEpFUkdwSEFwOVFvMGFNcWQyQjZmQkczSFNJ?=
 =?utf-8?B?Q0JYeC9GSDBoeGxINWl6dlcza2VMOVpIUkJBTVJNL0d1N0F6RFhyN1RzVDlk?=
 =?utf-8?B?RWViUVA4UElIQ3B6NzlNdTZicytDT28wRXNLdzdiZSsyOTFJQ1JTNDI4TnNw?=
 =?utf-8?B?RS9Sc0x0OGJJV3dvRXZXQkdKOENsbUl4UnZGZlJRUzNXWGRJZ2NOUzNtY1F2?=
 =?utf-8?B?V2ptUkpBVjVnU1NmVGt2eWpZbHJ3REVZSlMyY3d0blJUNWRMTitaQ1d4ZS9R?=
 =?utf-8?B?Zm5qQlV1Tlhjdk9pQk10QWFKL2NDRmdPU0k5TUVwTTExOWJXYUI4SjU2QUMr?=
 =?utf-8?B?WWR2NmJGQmhtb2VWVHVyZFNieVo3MGFnbGdzSENPbVI1bFFmMkk5d29hQzhZ?=
 =?utf-8?B?ZGxEMEJJaHNLbEhYYVcwT1ZFZU9PRmpKeXVFWHJTQ3F4L0tCK284cnJkSStV?=
 =?utf-8?B?cTFiMkZpWmpxRGV5WW01Zm54ZE1QRHhFakoyVE9JdE5QY2l4eWlVZWhFZmRi?=
 =?utf-8?B?d0IrMmxUQ0dPOWFMVEdPL0d1MEQyTkp6c2lFd282eUxsUjJWUXE4bGdvRU1Q?=
 =?utf-8?B?MFZXbk5SUzJtUGlwVkhtZXpZRjRNOUo2NkRGcWZlM2YrK0RIY0dlRk10c0ZC?=
 =?utf-8?B?RmxheERsdEZENFF0eld1N0Q2M0J6S0RRMHlhakVjQisvKzd6UzJlRmVGdzNa?=
 =?utf-8?B?QmxVVzZId0oyNU1MamFUc1hBOEFqTTc0NUd6RUNDNzlpTDNpdmdWUUxGQkg1?=
 =?utf-8?B?N1E4RzArRXUzM2FEWnk1Q3dEZ3JoUGdTcTlEVVpCNythb0UzRTFWQ2lZcEor?=
 =?utf-8?B?YUJoVkxnNGxQV3ZBZXZqWko1YWp2bEt5UHRPQ0h3ZzQzekJpUEVRWVFWR2Rl?=
 =?utf-8?B?Y1U5RXIrTW9aNGQ2MVgvZGhtMzVFYUtLMnc2dGhjWkJlQUZKbDZJem1zeExZ?=
 =?utf-8?B?RDh4OENkUjVDanB0WmpaQ25EWXNIaGJzRGl3NjlrSm53MDhRSkJhVlVYMmZJ?=
 =?utf-8?Q?uK0VC3UrJcbGHq1Y=3D?=
X-Exchange-RoutingPolicyChecked: DLLc73YaHGvBPw6wJ9lvIiosNRUT7d1d5BFhx1Zx+Pc3YVkCjCY1Km8ro6CykAw5BwBa5bRIIKIY98nUCfY8v5pP5zo8Xtx3We9ArQf67Js3GSYiDvZfDkjL4Py3bq9HLRwMMCPLePmX5X1C1Q2nN0wyhpNAtucE9ir/oYCKEieqmuf/iAD8Sydnh6XKm8yILu4sHzxoepgnOhUiN7tIjNIiV5w5PgbVa2Fad14oFon0eX/SFAPr2YDdokC7tynfIvfss1twuzO/YDyjADzUpd5GegtSfib1YNoXzM1kLDv1HAt1HHzhiSo9Bf3Vfl9GoiOPGEXAaEyxONuH3mprjQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 08a753d7-6f96-4693-09a0-08df2e39d793
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 23:36:47.6548 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HOPPZxN/ds5JXZmbuB33KejipVS4U9KEBho2bCUVum6mh2JtUFVQBEyxCZiVzlOW8YhV+8ASAFFQBcPWUbsCI2Lj4vHf+hjaFLnGMs8Ahkw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFAC7DDD7F1
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
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, Oct 17, 2026 at 03:26:20AM +0000, Patchwork wrote:
>   Patch Details
>
>   Series:  Use SIG_ID logs for GuC component (rev7)                            
>   URL:     https://patchwork.freedesktop.org/series/173177/                    
>   State:   failure                                                             
>   Details: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v7/index.html 
>
>CI Bug Log - changes from xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89_FULL
>                             -> xe-pw-173177v7_FULL
>
>Summary
>
>   FAILURE
>
>   Serious unknown changes coming with xe-pw-173177v7_FULL absolutely need to
>   be
>   verified manually.
>
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-173177v7_FULL, please notify your bug team
>   (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in
>   CI.
>
>Participating hosts (3 -> 3)
>
>   No changes in participating hosts
>
>Possible new issues
>
>   Here are the unknown changes that may have been introduced in
>   xe-pw-173177v7_FULL:
>
>  IGT changes
>
>    Possible regressions
>
>     * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation:
>          * shard-bmg: PASS -> DMESG-WARN +1 other test dmesg-warn

This is unrelated to changes in this series

Umesh
>
