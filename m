Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8629BCD98DE
	for <intel-xe@archiver.kernel.org>; Mon, 15 Jun 2026 12:30:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4070610E3F9;
	Mon, 15 Jun 2026 12:30:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OZzmN5tg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F33110E3E8
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Jun 2026 12:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781526644; x=1813062644;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=QaQ1vBW6ppsEYHXMHdENtynksoPSCXeNW25jGAjQxCo=;
 b=OZzmN5tg40hsRTBgDHoYWuV5f/xaa/zx/PzhjqlxjyeEKs5PCUUL+tuD
 d6M3vm+6CqbaxcEDhS+MZd6i4IOOy7Fvaxd+Q2sz+XeIFCqdlXT+cey6/
 ycBpY9sYsfYNa1btQzE+8ABxMdOftSsKeBaSJxKEPOGKKcjA5SZz27o38
 x0r1bYD05v8VSzK1GuAIlhlx5VQWCTq/njNkadahcr9Na74gkB0ryi3ge
 u/K3419ZP2oJsoNAB/6BDNC7Em3pSgZ8JAOalW1oZNVg7AnI2sJQlRZ6o
 aGHLtD7lGoSGNf14a4Uy9pvXa6at3yfQebVz9rj8Cxj6MZ9C4Zsxl3g8D g==;
X-CSE-ConnectionGUID: R5kbGk/JSwWxxCjBMlh8+A==
X-CSE-MsgGUID: Gp4pO6kIQ0qTiYJI4U3i1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="99840844"
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="99840844"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 05:30:44 -0700
X-CSE-ConnectionGUID: GbOEy9riSSe+A0hqInh/Sg==
X-CSE-MsgGUID: /wptE4awQQqPfNBGmyyG4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="252413036"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 05:30:44 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 15 Jun 2026 05:30:43 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 15 Jun 2026 05:30:43 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.13) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 15 Jun 2026 05:30:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uY7Db6mpb43Fx+y170xmCiwM4d40vnY0RVMKmhIarrO76Z6Rc1M6hbzKq/H5CgV6bPhzmKAmh9/urXFaaWCa2UDz7SCfJKIcYrgJibvy+Fzy5sP4JgILQLWppBIE4TsCGfa6bHwmUiXWjW5nI8924y2UxfEL4uPRLz1FlLmeayltM4fZdLbeDb9PANxgv6i/Xq/4FvJIlxCY6H2KKnYJ7JsK84a0Ydm+Wvrios9NXn3ZPuoenTCX4cCx9lM/R/B11qyy/mZlzVcCmZy1mJULqrDQeW0SB9Kp4CMnGlNntNwhJZpoAdm75Ye5rk6QxzcTq6Q3XilZ92vUmngskZM7+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iP9iXNvvwId3ytTh4uICqH6Y2qFd9fYmFxfgaJZlyDQ=;
 b=l+xaje/Tx7Y6mY6z3XcOMn2CKPDKZPHz9ClWFgCfI3osEjZ4JmvA4XsIFXC4Dt5J4PlOJcyPbDduQB9H0tc+HRnLLgSepOOdofLCNWhxYfMmOVOlTQrYdQ6PW9I3w1yKy8XW6AdZfPyeKVdBKuqBZuPMCKE1kcAZwq2VsfLRRlk8LzWuFryF/2PHbbtWYmrZXlOVU1hkJ+LEMjneb68sXXwIe3HPTjvEa6PNQLvQApTEGZ5Oiu6EkiE9+8qhqCVWaUCIeSlRDFQZDEEBLjsuda813IQ4xssQSI8eOPBwI/PQ0my2w7pNGMnCshr8eMlA77STTqoln3edng569eHK7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by IA0PR11MB8397.namprd11.prod.outlook.com (2603:10b6:208:48b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 15 Jun
 2026 12:30:40 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%5]) with mapi id 15.21.0113.015; Mon, 15 Jun 2026
 12:30:39 +0000
Message-ID: <c12f2cec-0e3a-4f8e-9fe9-46cce244ac96@intel.com>
Date: Mon, 15 Jun 2026 18:00:31 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 1/2] drm/xe: add structured RAS error logging
 infrastructure
To: "Tauro, Riana" <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <rodrigo.vivi@intel.com>, <matthew.brost@intel.com>,
 <thomas.hellstrom@linux.intel.com>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <vinay.belgaumkar@intel.com>, <aravind.iddamsetty@intel.com>,
 <karthik.poosa@intel.com>, <sk.anirban@intel.com>, <raag.jadav@intel.com>
References: <20260611111542.19256-4-mallesh.koujalagi@intel.com>
 <20260611111542.19256-5-mallesh.koujalagi@intel.com>
 <33c682e6-5677-4cb1-bbc6-eb40e5aa22fb@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <33c682e6-5677-4cb1-bbc6-eb40e5aa22fb@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0119.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d0::16) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|IA0PR11MB8397:EE_
X-MS-Office365-Filtering-Correlation-Id: 277925d8-400c-4b29-9238-08decad9e8ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|6133799003|56012099006|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: SWJ+/o9Ajr8r8lIyEOXaki5r2PTehOwOleIsovOFanwog4QIz0wl3GaztlIfCPMPWZALoLYdRnelMP0wt7BYvdUEqHpwPDHeQPtN7Ltn1cyzu9qajKr7KnrgUl4RRWS5EOmT3+W9wQr8BHBgbBzqk6k+OJExewuzBUNljHyXKdh6eXEp1o9YcvAw56x4Tnn68eBTuMZwlx9sG2jtjZBIeTdGeA6r2kJJp49O4kJYz5a8xJ9UFtu5/D3zTCnuB166GqwsdC54gxRUFcr9GfcWM6rBTf28SPEO2XbSgXrKX0iz6lsUvs/FHF5bH888id0IC2YrU+6d0tyaNUZHVXYRdvqYZl2YT1psBZvkLR6k9GHL3iYbrCf90PClBkBdGZ1p9AR3/TKyuzTnWUa8LiJw8+MVQCDz47PVl91u1+/PvfIIitTcMo6I5QHrMst4orxVI2S+XUsziS9GvJyoUvPMIxs3PhPo2jnazutIlLvezeCkU2vNXZXEQWTlmkO81nGA+F+X2Fj2iJWtyDJYD2rsEORh9YSbDx0ckN0wWpMTgvmoke56j075bqiF+LWpuGxg7jLGLxgq84Vy7NXHV7QIyE7ECXuNMkVo3oEyeBAfYUccnUOG8gyz2sxP9Z9iN95ARq0251ihIzG+jiv79HaQFg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(6133799003)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TlFXOTJkQ0VyQlUzdnlrQmFEb1FHNDhYNWJITlVMWWV3eHZ2Y0pXeWk2TVg2?=
 =?utf-8?B?R1RrdFZBaVZzMS9aaE02UVprc3VFaVJpbXdTc1JhaFZDc2wyOXgvdnpUUmVP?=
 =?utf-8?B?Z0VTTVFKeGt4cXc3S09VdzBLcDdVTUt1ZFZsbUFVbGNmdkkwRSs1MkFJSHJG?=
 =?utf-8?B?RXhlRnJjbktHZWFxQW1BRURtc1QvcmNpdEJ1SXVMeE1uRGJpZnFDdmcyNm1U?=
 =?utf-8?B?VnpVT2FoQ1lRQ2VQeDh1Sk1wTzZYZHdGNE5MZUhHcFp6Q2pkcytnOXJwVkV2?=
 =?utf-8?B?bFp3bFVGaGdrSTMxS2dLdE1qckNFSE5Wb2NUUVRDYlBHOC9Ka1JOOXY3UDhC?=
 =?utf-8?B?V25SSmUxU1Z5bzJOc25Rc3Rpa0FPNzRQdGZSN0xIVWRleHZFZzJSZHlBeUVr?=
 =?utf-8?B?ajh5THloMXVRd0UraFNtUVgrdkdHVzJ1d3ljZzFabXd3VW5pK1JIR2FRUDhS?=
 =?utf-8?B?dlNpbU96czdudFRvNXlmeUE5eERXTXk1YzErd2ZiT243YkNMSkVtTzk5cktE?=
 =?utf-8?B?Y3dhN0JMTm82VlNwZHpFLzBYbDlhaGM0QzJZejVTY1BxRTdEdERyVG5Vd0tp?=
 =?utf-8?B?UUM3b0pWbXZDUVExei9DOGc0WSsrMDVXTHE4MkpFRnc5Yy9iczBGbE4rOEtz?=
 =?utf-8?B?em42OUhlZld2djRCK3pjQ1Nib012NG16N3l3alcySDZ6OWp6cDh6VHpkaWQy?=
 =?utf-8?B?Ky9oOXNKdisrYkZtaUNKN1czQVhrRjBEZXJpQlc5QVRRQ1Y2Y0JrLy9YL01s?=
 =?utf-8?B?T00yQWM3WG9WQllLMDVwUi94UEZSbEdFUml1VWRoT29GbUN2RFpBbkJHV2VQ?=
 =?utf-8?B?U2JrenF4UEZxTmhRUEZZanZZNTdWeW04S0VJTTVBMDVnV1A0aG94VnNDdTl0?=
 =?utf-8?B?dWl4aGNSM2tNbEpEVVh4WUhheXE0ZjJYMmNaS0JHbkhHR2FRRG5mRmc3dkVa?=
 =?utf-8?B?QTZXU3MxbldMT0g2RnBIVEt6NXV0RUxLdWZRcFpCQmhETkN6ZUlWMFZiNFBG?=
 =?utf-8?B?QlBkaCtXUit5ZkRYc3B0WFVBZndRQVkxTFpoRVFvVUFnS0E0U0R4bzdYV0t6?=
 =?utf-8?B?OURITjY2Z1FFcnd6S3N1dldHSlVZTFVLMDA0RXNhWStWMTY0cW1XZTVXOUk3?=
 =?utf-8?B?TVdwclYwVnVkeGU1MlNhbCtBL3hjOWhUc0crU1hNZEthL2dZUkJ1eDg5Z0FX?=
 =?utf-8?B?dE1FQnp5QjRlNVJRMkc3R3dveU1LOGRXNVovb3ljTC9kOWlKaUJ0UVVpZkll?=
 =?utf-8?B?VlFRVmhlOWxxemFSR0JBR2xScWZUbTNTQWpHNzRGcDhrN25Xam9USEFudWdB?=
 =?utf-8?B?bUhXKzFuOUt5Q3BML0hTY3VOeFVibDQ5cHM2ckJsZkgyWmVESDNhRDdwZjlS?=
 =?utf-8?B?QXNSYUFJMitMc3N0b0JyRlQrUmIyc3dNdXBkQXVXSDJNZlN1b2d5cUMvMWpS?=
 =?utf-8?B?a3dKUW5jVHRBckNBVXNESGdzc3JXanBQMm5JcDM0RVpYakh5SW9XOFNZb0ZG?=
 =?utf-8?B?azBDOTJzQjJvczMyYzcydzZhRm9sYVJRcUh1MlN6QVdlb0xIMEk4RldUZ0NR?=
 =?utf-8?B?M1VEZ0pKNGZPZmZLU0ord21VbkFPWnV2Z3BBR0tZSnBHNXl2VmVxY3h1UVRW?=
 =?utf-8?B?YWVHREVjM2F3WEVrRWR0RjltdnlHYVRQbEN6Mk1HOXpjZDVCQmVtd09EcHBi?=
 =?utf-8?B?UmV4VGZEWHViWC9zVU15cC9EY2hvOWNHdGxkVUZnbGE1d1VLQnhxY1dCMFFG?=
 =?utf-8?B?bkhnclB6UDRPZzluZzI4VmFRck9rYW1nZ2dTa0FsTjV5a3RvYjUyZFFYMXIw?=
 =?utf-8?B?RS9mYUZpczN1UTRlVmlXVmcyaW1OcGoxV1d3QmtGNURJa2hzV0x0RkJKbkFS?=
 =?utf-8?B?NTBTc3owT3FicmFLNXNlV2RVa1BTQm5oV3FoWldWTE5iVkJOVllESFRIUldD?=
 =?utf-8?B?WWp0OVJlZUhqQVp2dU5FZWFRM3NpODVsNTRQdjRQQmlyeGJVY21vQzY2bm5X?=
 =?utf-8?B?c2dBWGsvaDYyQnEvU1l6S3VvN21zNk5SNTVyR1B5SDVocU12V25WRU5LVWxL?=
 =?utf-8?B?a2RoaXgrZ2dwdDdrcitYZm93N1NUZVRjK0lsaDQzV3F5SlQ5dHBsZzhmajBo?=
 =?utf-8?B?clJKR2l1RVhSVHByUEhTaFQ1c0VCWEQ4bm1lWWhsdHFMQmcxN1ROV1ZMT1Nq?=
 =?utf-8?B?US9laUF6aDNIaTlPK3FYRlhBSDlKYmVna1ZBZWRUbXF3WERnbnplcjYyZG5H?=
 =?utf-8?B?YUtraGJFY1hOMG5BOFgyWk5nbFQ0cTZOQ1dZOGVkUXFYM214d0FVajAzQUpJ?=
 =?utf-8?B?YVR4R2txNGVkWlg3K3ZyUUQvTFBwVzloY2sxbjUrQUNKVllLbHpMTUVXOEo0?=
 =?utf-8?Q?38c2ft8pXPwj3Ejw=3D?=
X-Exchange-RoutingPolicyChecked: DgDA41KOMUPQVvPxMHIr2trtNjGEFH+kpHiomnfpJgX1UwsQzUQXl+iSsLuE60yL1yXxGkW5ZUql1SudOSCWd4yplJMN4ooTRRyxtQqbgYC/x3Tu3O4yWKqeAw9vPBkzJTgHIscXsOsO/6ZRysl8Qa56xKRcsHkxDAFZ4dNQNzWvN5bzVa8j1Lo/bWJBpmxUH3wi0M0PWltnme8DojeRM96gezo4hUf5csf6I3pC8W90LEoHgCpn438UOjysykaF/NsJfvPUjXEORLE5kXp8jVIqSlBtYBrdFkrWKhKioOsg0YKZkQ/tpYdebN//LtALz/OmM5RTvUPOECirNxCOjg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 277925d8-400c-4b29-9238-08decad9e8ae
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2026 12:30:39.7234 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ixfGNGxpipejVK9ibEIcb89HrOWabqXsrMmIFJMGVdstOHnzMzIWBS8YTl5Ua+TpV+sbA8MsJ9F42HPJsiymTVmjuiGGPDqrHuEMvVBU8xE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8397
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


On 15-06-2026 02:55 pm, Tauro, Riana wrote:
>
> On 11-06-2026 16:45, Mallesh Koujalagi wrote:
>> Introduce SIG_ID defining Signature IDs (SIG IDs) for
>> categorising XE GPU errors, and __xe_ras_log() to emit
>> structured log lines with SIG ID, CPER severity, tile/GT
>> location, errno, and a free-form message.
>
> Maybe add a documentation. What is sig id. Why do we need this.
> When should developer make use of sigid ?
> Is it applicable for all logs?
>
Good point, will add in next revision.
>
>> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>> ---
>>   drivers/gpu/drm/xe/Makefile     |   1 +
>>   drivers/gpu/drm/xe/xe_ras_log.c |  64 ++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_sig_ids.h | 101 ++++++++++++++++++++++++++++++++
>>   3 files changed, 166 insertions(+)
>>   create mode 100644 drivers/gpu/drm/xe/xe_ras_log.c
>>   create mode 100644 drivers/gpu/drm/xe/xe_sig_ids.h
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index 09661f079d03..45b5aa735aa7 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -114,6 +114,7 @@ xe-y += xe_bb.o \
>>       xe_query.o \
>>       xe_range_fence.o \
>>       xe_ras.o \
>> +    xe_ras_log.o \
>>       xe_reg_sr.o \
>>       xe_reg_whitelist.o \
>>       xe_ring_ops.o \
>> diff --git a/drivers/gpu/drm/xe/xe_ras_log.c 
>> b/drivers/gpu/drm/xe/xe_ras_log.c
>
> Either use xe_ras_log or xe_sigid.  Not a combination of both
Agreed, will add xe_ras_log.c/.h, so everything under the xe_ras_ 
namespace.
>
>> new file mode 100644
>> index 000000000000..b6a2792b61d4
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_ras_log.c
>> @@ -0,0 +1,64 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +
>> +#include <drm/drm_print.h>
>> +
>> +#include "xe_device.h"
>> +#include "xe_gt.h"
>> +#include "xe_sig_ids.h"
>> +
>> +/**
>> + * __xe_ras_log - Emit a structured RAS log entry
>> + * @xe: xe device instance
>> + * @gt: GT instance where the error occurred, or NULL if device-wide
>> + * @sig_id: signature ID from xe_sig_ids.h identifying the error class
>> + * @cper_sev: CPER severity (one of CPER_SEV_FATAL, 
>> CPER_SEV_RECOVERABLE, etc.)
>> + * @errno_val: negative errno describing the error condition
>> + * @fmt: printf-style format string
>> + * @...: format arguments
>> + *
>> + * Formats the message and emits a kernel log line via drm_err() for 
>> fatal
>> + * events or drm_warn() for all others. CPER record generation and 
>> hex dump
>> + * are planned as follow-ups.
>> + *
>> + * Format:
>> + *   [xe-err] SIG_ID = <id> Severity = <sev> Location = <loc> Errno 
>> = <n> Message = "<msg>"
>> + */
>> +__printf(6, 7)
>> +void __xe_ras_log(struct xe_device *xe, struct xe_gt *gt,
>> +          u16 sig_id, u32 cper_sev, int errno_val,
>> +          const char *fmt, ...)
>> +{
>> +    char loc[32];
>> +    char msg[256];
>> +    va_list ap;
>> +    int ret;
>> +
>> +    if (gt)
>> +        snprintf(loc, sizeof(loc), "tile = %u/gt = %u",
>> +             gt->tile->id, gt->info.id);
>> +    else
>> +        snprintf(loc, sizeof(loc), "device");
>> +
>> +    va_start(ap, fmt);
>> +    ret = vsnprintf(msg, sizeof(msg), fmt, ap);
>> +    va_end(ap);
>> +
>> +    WARN_ON_ONCE(ret >= (int)sizeof(msg));
>> +
>> +    if (cper_sev == CPER_SEV_FATAL)
>> +        drm_err(&xe->drm,
>> +            "[xe-err] SIG_ID = %u Severity = %s Location = %s Errno 
>> = %d Message = \"%s\"\n",
>> +            sig_id, xe_cper_severity_str(cper_sev), loc,
>> +            errno_val, msg);
>> +    else
>> +        drm_warn(&xe->drm,
>> +             "[xe-err] SIG_ID = %u Severity = %s Location = %s Errno 
>> = %d Message = \"%s\"\n",
>> +             sig_id, xe_cper_severity_str(cper_sev), loc,
>> +             errno_val, msg);
>> +
>> +    /* TODO: Add CPER record driver handler */
>> +    /* TODO: Add RAS dump cper hex handler */
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_sig_ids.h 
>> b/drivers/gpu/drm/xe/xe_sig_ids.h
>> new file mode 100644
>> index 000000000000..8abe7554714e
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_sig_ids.h
>> @@ -0,0 +1,101 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_SIG_IDS_H_
>> +#define _XE_SIG_IDS_H_
>> +
>> +#include <linux/cper.h>
>> +
>> +/**
>> + * xe_cper_severity_str - local severity-to-string helper
>> + * @sev: CPER severity value (one of CPER_SEV_FATAL, 
>> CPER_SEV_RECOVERABLE, etc.)
>> + *
>> + * Avoids a link-time dependency on cper_severity_str() which is only
>> + * compiled when CONFIG_UEFI_CPER=y.
>> + *
>> + * Return: string representation of the severity, or "unknown".
>> + */
>> +static inline const char *xe_cper_severity_str(u32 sev)
>> +{
>> +    switch (sev) {
>> +    case CPER_SEV_RECOVERABLE:    return "recoverable";
>> +    case CPER_SEV_FATAL:        return "fatal";
>> +    case CPER_SEV_CORRECTED:    return "corrected";
>> +    case CPER_SEV_INFORMATIONAL:    return "informational";
>> +    default:            return "unknown";
>> +    }
>> +}
>
> We already have this  here
> cper.c - drivers/firmware/efi/cper.c - Linux source code v7.0.12 - 
> Bootlin Elixir Cross Referencer
>
> <https://elixir.bootlin.com/linux/v7.0.12/source/drivers/firmware/efi/cper.c#L66> 
>
>
> Can't this be reused?
>
Sure, will drop the local one.
>> +
>> +/*
>> + * Driver SIG_IDs
>> + */
>> +#define XE_SIG_PROBE            1  /* FATAL: probe failed */
>> +#define XE_SIG_WEDGED            2  /* FATAL: device wedged */
>> +#define XE_SIG_SURVIVABILITY        3  /* FATAL: survivability mode */
>> +#define XE_SIG_FW            4  /* RECOVERABLE: 
>> GuC/HuC/UC/GSC/CSC/PCODE */
>> +#define XE_SIG_GT_TDR            5  /* RECOVERABLE: engine hang / 
>> reset */
>> +#define XE_SIG_MEM_FAULT        6  /* RECOVERABLE: VM bind, page 
>> fault, GTT */
>> +#define XE_SIG_IO_BUS            7  /* RECOVERABLE: runtime 
>> PCIe/IOMMU/MMIO */
>> +
>> +/*
>> + * HW SIG_IDs
>
> Mention these belong to error categories
Ok.
>
>> + */
>> +#define XE_SIG_HW_DEVICE_MEMORY        8
>> +#define XE_SIG_HW_CORE_COMPUTE        9
>> +#define XE_SIG_HW_SCALE_UP_LINK        10
>> +#define XE_SIG_HW_PCIE            11
>> +#define XE_SIG_HW_FABRIC        12
>> +#define XE_SIG_HW_SOC_INTERNAL        13
>> +
>> +/* Must be updated when adding new driver SIG IDs */
>> +#define XE_SIG_DRIVER_LAST        XE_SIG_IO_BUS
>> +#define XE_SIG_HW_FIRST            XE_SIG_HW_DEVICE_MEMORY
>
> Why is his needed? There cannot be id's in between according to the 
> current
> implementation
>
You are right, the intent was to allow a range check, such 
implementation is not yet done anywhere. I'll drop it until there's an 
actual usage.
>> +
>> +struct xe_device;
>> +struct xe_gt;
>> +
>> +/*
>> + * Common backend helper
>> + */
>> +__printf(6, 7)
>> +void __xe_ras_log(struct xe_device *xe, struct xe_gt *gt,
>> +          u16 sig_id, u32 cper_sev, int errno_val,
>> +          const char *fmt, ...);
>> +
>> +/*
>> + * Driver-facing reporting macros
>> + */
>> +
>> +/* FATAL */
>> +#define XE_RAS_PROBE(xe, errno, fmt, ...) \
>
> use the same prefix as the file.
>
Sure!

Thanks,

-/Mallesh

> Thanks
> Riana
>
>> +    __xe_ras_log((xe), NULL, XE_SIG_PROBE, CPER_SEV_FATAL, \
>> +             (errno), fmt, ##__VA_ARGS__)
>> +
>> +#define XE_RAS_WEDGED(xe, errno, fmt, ...) \
>> +    __xe_ras_log((xe), NULL, XE_SIG_WEDGED, CPER_SEV_FATAL, \
>> +             (errno), fmt, ##__VA_ARGS__)
>> +
>> +#define XE_RAS_SURVIVABILITY(xe, errno, fmt, ...) \
>> +    __xe_ras_log((xe), NULL, XE_SIG_SURVIVABILITY, CPER_SEV_FATAL, \
>> +             (errno), fmt, ##__VA_ARGS__)
>> +
>> +/* RECOVERABLE */
>> +#define XE_RAS_FW(xe, gt, errno, fmt, ...) \
>> +    __xe_ras_log((xe), (gt), XE_SIG_FW, CPER_SEV_RECOVERABLE, \
>> +             (errno), fmt, ##__VA_ARGS__)
>> +
>> +#define XE_RAS_GT_TDR(xe, gt, errno, fmt, ...) \
>> +    __xe_ras_log((xe), (gt), XE_SIG_GT_TDR, CPER_SEV_RECOVERABLE, \
>> +             (errno), fmt, ##__VA_ARGS__)
>> +
>> +#define XE_RAS_MEM_FAULT(xe, gt, errno, fmt, ...) \
>> +    __xe_ras_log((xe), (gt), XE_SIG_MEM_FAULT, CPER_SEV_RECOVERABLE, \
>> +             (errno), fmt, ##__VA_ARGS__)
>> +
>> +#define XE_RAS_IO_BUS(xe, errno, fmt, ...) \
>> +    __xe_ras_log((xe), NULL, XE_SIG_IO_BUS, CPER_SEV_RECOVERABLE, \
>> +             (errno), fmt, ##__VA_ARGS__)
>> +
>> +#endif /* _XE_SIG_IDS_H_ */
