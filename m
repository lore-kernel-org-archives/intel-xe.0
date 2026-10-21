Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1184606A31D
	for <intel-xe@archiver.kernel.org>; Wed, 21 Oct 2026 20:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Z5NtmoJ5
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6560E10E049;
	Wed, 21 Oct 2026 20:20:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 970AD10E049
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Oct 2026 20:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792613998; x=1824149998;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GxwCAD3m2aA3A0xV7dA3Uu3EEAOsKCQTdMq+x2NPPc8=;
 b=Z5NtmoJ5+RTi/WbqV2ZDPeu0HAdoPjxj4/cROJaHE1NV2Fwp+oFH4o8j
 TvtvB40xOajANCsLBiYQ/Odf/fZ7CwEjqe0nfOszzNrNltG4MeZk1dQdk
 9XC/+xBJtAPSOCFaZm8armEnXRf2IutlCPpnwGtvM9qfetqCgrikS8twh
 8MCJ9zKZNLA5X1LdpQBty5PD5XZ6fJRGsj6gvyx1ypH8qECQyYVmQbTsy
 KCWRB4wkR0Wa1pQcGdVgYHYBJ0pcm8I852S52aYlY1oTrXjXqdrcsvYxH
 B9KRjHuMqNOWu99hhBLogwo+3Z1lxRewB1lD3q21LWdpWvDn5NMjX4s0j w==;
X-CSE-ConnectionGUID: aUC+l0GBSCCODqrGprYgsQ==
X-CSE-MsgGUID: xfLP6awwQbi2lLFn8tQ2xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1249870"
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="1249870"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 13:19:57 -0700
X-CSE-ConnectionGUID: pLDAy7luTH2nJW/gpXRRgA==
X-CSE-MsgGUID: 1vMAGYhcS3y8AxpHXl/1EQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="3178199"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 13:19:57 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 21 Oct 2026 13:19:56 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 21 Oct 2026 13:19:56 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.43) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 21 Oct 2026 13:19:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aENneCwleTN4ofp49jdWXdgK93kMLQJqcU0in2UkdEcGY88zXNgLAoA/hVuMjiNMmNrPfYsm1P+xbHkcmpLl1pv0NzyGjJJ4zX5fc2PsZ0YXSHow60rMoqmNuDJcst+XfpVJCoKf8o5Q9sPO6ORWsj6nnY4qQD5MG3pNvSmsR0Xst7z74m2lZ5QsDkrHUiZnRbAtqz7U7tTQaRsrkURm3BeSGJf0R3//gYETN30WE6TkUdgM/RozJ7PDOLUoOK5CGP6I5GdFfoWz2k3S+veV8SsMinZvc4A2CrvHE6wnNQrTnul38qBiq89IiEmRldJUI5y45x6TR+b/A4/lioTSyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xpTCguPAI6MTtLrqq+/T5PjLOpVFZF09yt7OHbTleig=;
 b=DAgWXX9Vn9JB8zGZStyiMZIM0C2R8kI415P7a9ImhI7yXdHdVbOx71i30GKBNuCN1Al3ZHaCEIol0VT/ZkSAhiPAS7yP1+g9iMLlYmDgg/ZPiUoHUesSKAMjeep5PTiey8glTqDlR2uV0WGvyK4VVcNg2y1Zb6t18bwijcmIm92jaGy2w40F7qAWANYpGOSXqqAmEJo1EKmRnz3LsR5dIM1lCMj3cqaP8GzeoCISXrssvx5RtwLm9lhvxRH8rf0TXi33HS0d96gUylI8ytZP6etO6RfkBJsu9jrC7L/LQoXqc08r7Vh9u8K60mtp3iM+FAQaTABs3zZRz9b/KyALyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4979.namprd11.prod.outlook.com (2603:10b6:303:99::16)
 by DS7PR11MB9449.namprd11.prod.outlook.com (2603:10b6:8:266::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Wed, 21 Oct
 2026 20:19:54 +0000
Received: from CO1PR11MB4979.namprd11.prod.outlook.com
 ([fe80::ed0a:e4ab:fde6:edcc]) by CO1PR11MB4979.namprd11.prod.outlook.com
 ([fe80::ed0a:e4ab:fde6:edcc%7]) with mapi id 15.21.0522.017; Wed, 21 Oct 2026
 20:19:53 +0000
Message-ID: <550a1a9b-70da-479d-b0d8-d4e75a7a146b@intel.com>
Date: Wed, 21 Oct 2026 13:19:52 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc: Handle GuC semaphore instruction field check
 error
To: "Narvaez, Jesus" <jesus.narvaez@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Alan Previn <alan.previn.teres.alexis@intel.com>
References: <20261012192828.226700-2-jesus.narvaez@intel.com>
 <34f5896a-0e9d-4eb8-893e-fca156dbc18d@intel.com>
 <7f1c156d-6751-48f7-a013-16f5e9ed3336@intel.com>
Content-Language: en-US
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <7f1c156d-6751-48f7-a013-16f5e9ed3336@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0154.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::9) To CO1PR11MB4979.namprd11.prod.outlook.com
 (2603:10b6:303:99::16)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4979:EE_|DS7PR11MB9449:EE_
X-MS-Office365-Filtering-Correlation-Id: 720a9a7f-472e-4e14-82bd-08df2fb0aa6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|6133799003|22082099003|10067099003|18002099003|261021121427099003|3023799007|11063799006|4143699003|261009221227099003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info: RhgDAPLtKHF+/G9Se73JoyZl1HeR+U7lepz3jL0HYDwTWTYICYMhkrRirsiQi4LH7nMsXRNqOK2QlZFUdheAw2ndofhXXw7iBxB0QQhuyGnIrmmRXc2YpWePSdg7bGXdp/VXHTt92Ni4VXTjeNnBQ+8zSrTRBgzUR1szj3V7Uz8+AWWW16dwbW2Yu8tom8zfZEN9wWlXQP7Hq087P0lJkmBlLpwqCWKulmMBdjoNb4/IkJZojGjEWXTPoDxFJ7gq68HhLMNEmYOZYjjJOXjuUSpgPVZqu/Kiu0ZK6GIwaPd3FUJ2cOVUpZCtoGKB4J5zAj9O3Hfx8z8a33BEWPqI7IdsfWvnvZx/JmlmmxLt2nRNWs0m3lz+FKg3j40co5+sSKzm3Mnsu2j7DbEnpqSUSg3RMBJBq4ZP8jyQ8AHaenioLJR4BtpWailIyXXVRh5rIQ+C3ZZyVaRcZ4PADhav4tn7hAKFxiPr2+T7Q4c5LmuLxgzmW3CqwfnpvKQz5oUysa2niLKIf9X1MFV1xIM5u1rfUwWerbutplzyK0kcih3khOWhFBf2QAX/BvCcn6uVLo8lq+6d0vOow2gNy6x9zbkZO2jp41Ju6raHGTuSkqsYjWF1+Jt7/Vm6y4CD4Ymxlt/ACL3ovkET0W1Og2l8Ub64qz50FR8pcpJ+avw4U6o=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(6133799003)(22082099003)(10067099003)(18002099003)(261021121427099003)(3023799007)(11063799006)(4143699003)(261009221227099003)(261009223027099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VDVMdExrd291bVVTbjdKeXBwN2sxV2x2T081U2Q3cTltK21XaFAzRWdxZG1T?=
 =?utf-8?B?bkRHMERQb0tQVlFjQ0N1ZEQ5TDRRK0FBQU13eTg2Wmsvdms1QlZLOEtkd0ds?=
 =?utf-8?B?OG9xOUZOaktucUJUQzBidXQ4M1VQVERsYUR3MDNnemE2WmtBZVAveEozRmZ2?=
 =?utf-8?B?VjlOdmQ2NFBsZXRvRXVIVDZmZkk1TUhVOG9vOG0yU2RWY1BzdlN6ZkRwam1Y?=
 =?utf-8?B?cnhXVXQ1YksyME9QUFdHZ3gxeGptTzhNR09EbGY0WG9PZUVnWWdQMUV6WklS?=
 =?utf-8?B?RzlHOGNpcGNvVWpHRldoSysyNVBRUTIwN0E3N0F5d2VUOTU1Q1lRREQ2aElQ?=
 =?utf-8?B?UWllaUFJK1picVBpNlVRdGcyNHFENkxmcUx0Q0cydVFVYURnN1JnTTJHSDNM?=
 =?utf-8?B?WndLTkNWWFBaNnVkQUpUdG8rNzdTV1BCSkVsVlpFWXRBelI5QnVQR21MSGVa?=
 =?utf-8?B?NnVBdDhYTkhWcEZiS2lXa2t3aW5MdWhGZmJSdzdwSGRWbnlueUwveGNPUU9U?=
 =?utf-8?B?VklKNTFsZmxMK3BWOHZML3h0eDNwcExXaHdvdDFYSHFnQ3d0V3RyUnU1NU93?=
 =?utf-8?B?SWNqY2ljL1FMWjhGc1pGYzN6RnhrT0QxeDRBeG9TTXdVVjF2VXNNL2R2Y2Iy?=
 =?utf-8?B?UmR2WlFRbkt3eUc1ZTQ1aGpxdythd2tXbWIvOTVmTnRqR1RpS09ka1AxWWhz?=
 =?utf-8?B?eHBMdEpNaGdEN0VwUStBdUJnQVRyTzlpeXpiQWxrUWVCRXdqQ3RZVUY1NnB5?=
 =?utf-8?B?YVcwZEw4ekY5UHJLdDR3MmpoTGR6Z1dGVTRhY28rOVBscm9FSjZ2U3dETm1H?=
 =?utf-8?B?VElPL1d4RjhKN3cvNSt5c253d0pFTWFDN0xZcFFBQjd3U3ZNUndYME53UDFB?=
 =?utf-8?B?dDZ5aE5la292VytLYjIxcS9idm44WUY3c05LcGRwQ053VFU2UE9aTW1XZFhM?=
 =?utf-8?B?NmJjNjNlMkUxVGlRNWpaOTJmeThzRlZKNEJ2Y0MrbGphb0djdTNzRUtxWkdG?=
 =?utf-8?B?NHhYY3F2bncrYUJPWU9hTC8zeUt6MDFqQ0lMc29yaWdwZzdWdWJ4TjlhVzBn?=
 =?utf-8?B?emJtOHA3K3FGbnhxUXJ6dWFtd0Uzc014SHFaNjkzMjMzZXcyMDVzRzlLYWRu?=
 =?utf-8?B?U0NyYlNaQzNkRjF6V1hwYVVRUE8wc1NnbDBnS2hCTzZYWGthQ05mcEUwZnJL?=
 =?utf-8?B?V01PSTFGWmp3bkFtMENiWGFxaVI2cSs1VWo3QWlZaU9IT0VPem9aaFBFV1BB?=
 =?utf-8?B?eHNSRXlqbkxCQjN0NlRlRzdoUjhZVCs1TS9mVWJLSnZoeHRJZUFSVEVabUVJ?=
 =?utf-8?B?d3BzVlE5c3BHNm05RGhoUnJzS041TGc2TURtRVZ2SDlSUElESCtST21jUGdy?=
 =?utf-8?B?T3dSa1ZyS0FsSUphQWV5TU5oOGlra3Boa29vNUM1R0QrQ1JWaVFkalZjYWc1?=
 =?utf-8?B?TXI2ZTA2WXpvVk03cEpYNklyQzU5SlcxRHU1Ynp3TDMyL0FNYVRzOU45K2Ro?=
 =?utf-8?B?TzNzbWdMVWEvYklCL28wQzBQRllyeEkvaDdhM1d4QlprN1BuVmI2cUVYL3ZC?=
 =?utf-8?B?RWZiT1plMURxTEUyeDlpYzVsOGx0cGR6TklHcTB5R3Vsc01EWWtHSTluL0I0?=
 =?utf-8?B?NTdiTU9jdGtEdmRqSDFCYmN0TDkrUTVPYXRGNGRlNFFTS09YT1hIYnBOTHpF?=
 =?utf-8?B?RXlSTkhHWjlxSkJrS0sxOWY4VHlzNnlvRkV1WVp0S09iY1ZNT25oeDNuaUJv?=
 =?utf-8?B?U2VsazhuUnJnSzAyd0lxeTc5VENPSGo5aFRxS2JUU0E0bnAxeS9YRXdmblNt?=
 =?utf-8?B?WXVBYjNKaFJhSjB0U1hlaWwxbS9yRXdNYVpjQ1FFNnR2SklGYmkyVE1RZzJs?=
 =?utf-8?B?NVAyZDlGeTNTYW1tcjBOdFJnOHdzWHVUdFpJNXFmR1pMQVU1R1p5UjRZaS9i?=
 =?utf-8?B?YThiTkJGN2VZVmFkU2dMUVpSbHdSR1NRREtjbG5YY1Z6cjMyMW03WUhGVmM5?=
 =?utf-8?B?VFMrNzRpdFhKYVlMby8wMFY5eWx2OUVSVTZUQjVJc3NRd2dpQU5CeVJEdk9V?=
 =?utf-8?B?Z2RFQW1oTDBiWFJQZFkyMk92dDhyd0M2cGNXR0QwOWJRbUs1djVVT0xjZnFl?=
 =?utf-8?B?SU5ZY0tRRDZnT2lQUk0zTzZuS2JFZjNGSmQyZW55Vjc1QkZsbFR0OWFlcjM2?=
 =?utf-8?B?cDRnQUx5eVBWcUNUNWxQZjAwQTJFTGMrYmFPdGJsbGVDQjdBeFNiNHJlYUJO?=
 =?utf-8?B?RWNOeFVyeEFGdTVsYmtRKzhPa3Q4a1JEOTZGNyt2VWZ4VDhBL0tNL1d4VFJH?=
 =?utf-8?B?TlZ3Z084d1BobWNRUjVUL2pUUmZkM1FBRlAyM25TajhJNXhabFAxa25QaHVp?=
 =?utf-8?Q?XnwNQSmyjPFnzKZ4=3D?=
X-Exchange-RoutingPolicyChecked: dRNtNBZm7cy59z8cafKCd4k1gL6qmEpQ2VTZQ2EJGJn+cnPJV7Z/+v5qhtffCXzbLCdxXbFM9CkjHp7AtPqAhiVZNDc9eme+oYE/LOPePlZDVHyZcAy9YhKmmCxWaEicyu79V/I+G8+5VjmzvKHcDzBobRVUscbglwuMu/+5JRyvb2qouSEgIbk5Q+XFpzP3Z5gAWciP9AvDZtmfskSrEoTXWCl3QQQiciIsBt41V2rgYu8dhAmtoaxMT3oh/UkJ3fPdyeZMmNyej+SGJE9RuA0EoVlPQMHWGqmzDMZTVJ5gVh3+cmX2ZE9r43dzHBSBvCT+x8jEZErzuSWOlB3Jdw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 720a9a7f-472e-4e14-82bd-08df2fb0aa6f
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 20:19:53.1887 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xrEh0Ir+Msgdq1Av8HSUk+wN8HLy8dssnPli6K/OHZtx+f367LuZ4BzgM/s6mHRsDeGT2LqPqVLdETSlAqmt6V99QAaCnHTb/tihlDyMiGY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB9449
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
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 10/21/2026 11:15 AM, Narvaez, Jesus wrote:
>
> On 10/20/2026 4:43 PM, Ceraolo Spurio, Daniele wrote:
>>
>> On 10/12/2026 12:28 PM, Jesus Narvaez wrote:
>>> Starting on NVL-P and newer platforms which support 64 bit semaphores,
>>> opt in to enable GuC to check semaphore instruction fields when it
>>> receives them from HW.
>>>
>>> The GuC will send a G2H back if the check failed, so add a handler to
>>> deal with the context that has been marked as unrunnable.
>>
>> This needs a bit more explanation on why we want the GuC to check 
>> this. The new commands have a field that is not used for HW execution 
>> and is instead passed directly to the CSB, which the GuC consumes. 
>> This check makes sure that no unsupported values are passed in this 
>> field, so that if we eventually start using those values (e.g. to 
>> send hints about the semaphore to the GuC) we don't risk a userspace 
>> regression due to the change in behavior.
> Ok makes sense, will improve.
>>
>>>
>>> Signed-off-by: Jesus Narvaez <jesus.narvaez@intel.com>
>>> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/abi/guc_actions_abi.h |  1 +
>>>   drivers/gpu/drm/xe/abi/guc_klvs_abi.h    |  9 +++++
>>>   drivers/gpu/drm/xe/xe_guc.c              | 10 +++++
>>>   drivers/gpu/drm/xe/xe_guc_ct.c           |  4 ++
>>>   drivers/gpu/drm/xe/xe_guc_submit.c       | 47 
>>> ++++++++++++++++++++++++
>>>   drivers/gpu/drm/xe/xe_guc_submit.h       |  2 +
>>>   drivers/gpu/drm/xe/xe_trace.h            |  5 +++
>>>   7 files changed, 78 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h 
>>> b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>>> index f5c9b37038d4..520b771906cd 100644
>>> --- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>>> +++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>>> @@ -143,6 +143,7 @@ enum xe_guc_action {
>>>       XE_GUC_ACTION_MULTI_QUEUE_CONTEXT_CGP_SYNC = 0x4603,
>>>       XE_GUC_ACTION_NOTIFY_MULTI_QUEUE_CONTEXT_CGP_SYNC_DONE = 0x4604,
>>>       XE_GUC_ACTION_NOTIFY_MULTI_QUEUE_CGP_CONTEXT_ERROR = 0x4605,
>>> + XE_GUC_ACTION_NOTIFY_CONTEXT_INVALID_SEMAPHORE_INSTRUCTION_FIELD = 
>>> 0x460B,
>>>       XE_GUC_ACTION_CLIENT_SOFT_RESET = 0x5507,
>>>       XE_GUC_ACTION_SET_ENG_UTIL_BUFF = 0x550A,
>>>       XE_GUC_ACTION_SET_DEVICE_ENGINE_ACTIVITY_BUFFER = 0x550C,
>>> diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h 
>>> b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>>> index 4bcdc1a96785..c63387ebc173 100644
>>> --- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>>> +++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>>> @@ -169,6 +169,12 @@ enum  {
>>>    *      This flag will enable notification from GuC to KMD via G2H 
>>> message
>>>    *      GUC_ACTION_GUC2HOST_NOTIFY_UNCORRECTABLE_LOCAL_ERROR upon 
>>> receiving the
>>>    *      same interrupt from the CS.
>>> + *
>>> + * _`GUC_KLV_OPT_IN_FEATURE_SEMAPHORE_INSTRUCTION_FIELDS_CHECK` : 
>>> 0x400A
>>> + *      This flag will enable the GuC to check the semaphore 
>>> instruction fields
>>> + *      when GuC receives them from HW. If the check fails the GuC 
>>> removes the
>>> + *      context, marks it as not runnable and notifies the driver 
>>> via G2H
>>> + *      message 
>>> GUC_ACTION_GUC2HOST_CONTEXT_INVALID_SEMAPHORE_INSTRUCTION_FIELD.
>>
>> nit: "instruction fields" feels like the GuC is validating the whole 
>> instruction instead of a single field that is copied in the CSB
> Yeah, I can change that to just "instruction field".
>>
>>>    */
>>>     #define GUC_KLV_OPT_IN_FEATURE_EXT_CAT_ERR_TYPE_KEY 0x4001
>>> @@ -180,6 +186,9 @@ enum  {
>>>   #define 
>>> GUC_KLV_OPT_IN_FEATURE_UNCORRECTABLE_LOCAL_ERROR_NOTIFICATION_KEY 
>>> 0x4004
>>>   #define 
>>> GUC_KLV_OPT_IN_FEATURE_UNCORRECTABLE_LOCAL_ERROR_NOTIFICATION_LEN 0u
>>>   +#define 
>>> GUC_KLV_OPT_IN_FEATURE_SEMAPHORE_INSTRUCTION_FIELDS_CHECK_KEY 0x400A
>>> +#define 
>>> GUC_KLV_OPT_IN_FEATURE_SEMAPHORE_INSTRUCTION_FIELDS_CHECK_LEN 0u
>>> +
>>>   /**
>>>    * DOC: GuC Scheduling Policies KLVs
>>>    *
>>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>>> index 3ab4cb9e4964..a0c693a1e74f 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>>> @@ -663,6 +663,16 @@ int xe_guc_opt_in_features_enable(struct xe_guc 
>>> *guc)
>>>       if (supports_dynamic_ics(guc))
>>>           klvs[count++] = 
>>> PREP_GUC_KLV_TAG(OPT_IN_FEATURE_DYNAMIC_INHIBIT_CONTEXT_SWITCH);
>>>   +    /*
>>> +     * 64 bit semaphore instruction fields check support was added 
>>> in GuC
>>> +     * v70.64.0, which maps to compatibility version v1.33.0.
>>> +     * Support starts with platforms that have 64 bit semaphores, 
>>> which
>>> +     * is NVL-P and newer.
>>> +     */
>>> +    if ((GUC_SUBMIT_VER(guc) >= MAKE_GUC_VER(1, 33, 0)) &&
>>> +        xe->info.platform >= XE_NOVALAKE_P)
>>
>> If we have other uses for this check, maybe it's worth adding a 
>> "has_64b_semaphore_support" in the platform definition structs? not a 
>> blocker.
> Are you thinking of something like has_uncorrectable_error_reporting? 
> As far as I know, I don't think there are any other uses for this 
> check at the moment, so leaving it as is makes more sense to me.
>>
>>> +        klvs[count++] = 
>>> PREP_GUC_KLV_TAG(OPT_IN_FEATURE_SEMAPHORE_INSTRUCTION_FIELDS_CHECK);
>>> +
>>>       if (count) {
>>>           xe_assert(xe, count <= OPT_IN_MAX_DWORDS);
>>>   diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c 
>>> b/drivers/gpu/drm/xe/xe_guc_ct.c
>>> index da5ce97484b8..cdd7285465b1 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>>> @@ -1802,6 +1802,10 @@ static int process_g2h_msg(struct xe_guc_ct 
>>> *ct, u32 *msg, u32 len)
>>>           ret = xe_guc_exec_queue_cgp_context_error_handler(guc, 
>>> payload,
>>>                                     adj_len);
>>>           break;
>>> +    case 
>>> XE_GUC_ACTION_NOTIFY_CONTEXT_INVALID_SEMAPHORE_INSTRUCTION_FIELD:
>>> +        ret = 
>>> xe_guc_context_invalid_semaphore_instruction_field_handler(guc, 
>>> payload,
>>> +                                         adj_len);
>>> +        break;
>>>       default:
>>>           xe_gt_err(gt, "unexpected G2H action 0x%04x\n", action);
>>>       }
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c 
>>> b/drivers/gpu/drm/xe/xe_guc_submit.c
>>> index 7ce73489c35f..35965667c198 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>>> @@ -3708,6 +3708,53 @@ int 
>>> xe_guc_exec_queue_cgp_sync_done_handler(struct xe_guc *guc, u32 
>>> *msg, u32 le
>>>       return 0;
>>>   }
>>>   +/**
>>> + * xe_guc_context_invalid_semaphore_instruction_field_handler - 
>>> Invalid semaphore field handler
>>> + * @guc: guc
>>> + * @msg: message indicating which context failed the field check
>>> + * @len: length of message
>>> + *
>>> + * The GuC has detected an unsupported SW Token Info value in a 64 
>>> bit semaphore
>>> + * instruction and has already removed the offending context and 
>>> marked it as
>>> + * not runnable, so trigger reset-cleanup on the queue to match the 
>>> state GuC
>>> + * already applied.
>>> + *
>>> + * Return: 0 on success, -EPROTO for malformed messages.
>>> + */
>>> +int 
>>> xe_guc_context_invalid_semaphore_instruction_field_handler(struct 
>>> xe_guc *guc,
>>> +                                   u32 *msg, u32 len)
>>> +{
>>> +    struct xe_gt *gt = guc_to_gt(guc);
>>> +    struct xe_exec_queue *q;
>>> +    u32 guc_id, type;
>>> +    u64 lrc_address, token, data;
>>> +
>>> +    if (unlikely(len != 8))
>>
>> The GuC specs list the payload for this G2H as being 6 DWs long, but 
>> the GuC code is indeed writing 8; probably just a spec bug, but we 
>> should wait for them to confirm before merging.
> Yep, sounds good.

Got an answer about this from the GuC team. It looks like the bug was 
with the tool that renders the specs, because the actual files the specs 
are generated from lists 8 DWs. They match what you implemented below, 
so good to go on that side.

Daniele

>>
>>> +        return -EPROTO;
>>> +
>>> +    guc_id = msg[0];
>>> +
>>> +    lrc_address = (u64)msg[2] << 32 | msg[1];
>>> +    token       = (u64)msg[4] << 32 | msg[3];
>>> +    type        = msg[5];
>>> +    data        = (u64)msg[7] << 32 | msg[6];
>>> +
>>> +    q = g2h_exec_queue_lookup(guc, guc_id);
>>> +    if (unlikely(!q))
>>> +        return -EPROTO;
>>> +
>>> +    xe_gt_info(gt,
>>> +           "GuC: invalid semaphore instruction field! guc_id=%d, 
>>> type=%u lrca=0x%llx, token=0x%llx, data=0x%llx",
>>> +           guc_id, type, lrc_address, token, data);
>>
>> We don't need/want to print the LRCA.
>>
>> Daniele
>
> Understood, will remove the print and the lrc_address variable.
>
> Jesus Narvaez
>
>>
>>> +
>>> +    trace_xe_guc_invalid_semaphore_instruction_field(q);
>>> +
>>> +    /* Treat the same as engine reset */
>>> +    xe_guc_exec_queue_reset_trigger_cleanup(q);
>>> +
>>> +    return 0;
>>> +}
>>> +
>>>   static void
>>>   guc_exec_queue_wq_snapshot_capture(struct xe_exec_queue *q,
>>>                      struct xe_guc_submit_exec_queue_snapshot 
>>> *snapshot)
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h 
>>> b/drivers/gpu/drm/xe/xe_guc_submit.h
>>> index 29abf07d8f04..d3ecca3c8ed5 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_submit.h
>>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.h
>>> @@ -41,6 +41,8 @@ int xe_guc_error_capture_handler(struct xe_guc 
>>> *guc, u32 *msg, u32 len);
>>>   int xe_guc_exec_queue_cgp_sync_done_handler(struct xe_guc *guc, 
>>> u32 *msg, u32 len);
>>>   int xe_guc_exec_queue_cgp_context_error_handler(struct xe_guc 
>>> *guc, u32 *msg,
>>>                           u32 len);
>>> +int 
>>> xe_guc_context_invalid_semaphore_instruction_field_handler(struct 
>>> xe_guc *guc,
>>> +                                   u32 *msg, u32 len);
>>>     struct xe_guc_submit_exec_queue_snapshot *
>>>   xe_guc_exec_queue_snapshot_capture(struct xe_exec_queue *q);
>>> diff --git a/drivers/gpu/drm/xe/xe_trace.h 
>>> b/drivers/gpu/drm/xe/xe_trace.h
>>> index d4e9d91f6f7f..e52054eccc8d 100644
>>> --- a/drivers/gpu/drm/xe/xe_trace.h
>>> +++ b/drivers/gpu/drm/xe/xe_trace.h
>>> @@ -223,6 +223,11 @@ DEFINE_EVENT(xe_exec_queue, 
>>> xe_exec_queue_cgp_context_error,
>>>            TP_ARGS(q)
>>>   );
>>>   +DEFINE_EVENT(xe_exec_queue, 
>>> xe_guc_invalid_semaphore_instruction_field,
>>> +         TP_PROTO(struct xe_exec_queue *q),
>>> +         TP_ARGS(q)
>>> +);
>>> +
>>>   DEFINE_EVENT(xe_exec_queue, xe_exec_queue_stop,
>>>            TP_PROTO(struct xe_exec_queue *q),
>>>            TP_ARGS(q)
