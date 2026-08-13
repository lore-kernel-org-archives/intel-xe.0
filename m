Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72C65C5CFEB
	for <intel-xe@archiver.kernel.org>; Thu, 13 Aug 2026 06:26:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C9EE10E20C;
	Thu, 13 Aug 2026 06:26:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kbk9Qwk4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86A4810E20C
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Aug 2026 06:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786602385; x=1818138385;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=QWwzAlCSavBX71TqLd/A57tGopfw0NO3ecY8Lak7aHU=;
 b=kbk9Qwk4aI00V2yeq3s/dEGkkWPmWgc38Buqega4c61xxvLtFvyS/ddv
 CpTiObcMPzpeh0S7FZZCvZwmZpRe84keJIyuVvDMDWLJcrxWoXTsU65/Y
 Vk8CqDNiS4HqvN1pky8t1KXbOT1QACXfKczSfwQY3FnInLmrOdONXvqZG
 jIr0S9AAxSkjYC09eMNsWd3tjNGNilGh0ilK3suCzDL7CTq84srjBmPG8
 ZQTeICEFtkGNQ8yzZ+/kw77agfNLN9pM6G2GkrVKmNzJeGzUp9pvWnL7a
 zYaxXKMPC0ZVqo5o/3LnnzmOtCczInoOtemRC9Yi6Mz9Wy+ZV/0LE/DaQ g==;
X-CSE-ConnectionGUID: bRz8aW8zQdqyk9zrcC+9DA==
X-CSE-MsgGUID: EM07jZ99SsuYtq733OPUVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="97758235"
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; d="scan'208";a="97758235"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 23:26:25 -0700
X-CSE-ConnectionGUID: 6U/29eG2SG6/ZogjkKd/Sg==
X-CSE-MsgGUID: zqQoBnlwRD6eCwhks/KhWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; d="scan'208";a="287297739"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 23:26:25 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 12 Aug 2026 23:26:24 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 12 Aug 2026 23:26:24 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.50) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 12 Aug 2026 23:26:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cuLboQ0G5PW9WFTwWpKf1RIpN4BGCmFrC70PJ/OTbERgZT8StxUVwHID/yRpWqNVD/ulPwX4x5h0C2WBHL7rv+28nZ8iU57ZSSpvGNCpmZYVGX3RQH8NTVPQsph6o0YoDSBJb8MmNO17h1hEuqZXlcCMZjQHH5FzdbdW5xIDh9fOCCVUTfHBR4py0w5hf0H4hJ5XCh7pbGMbQlnuFAjVOCNZZ0bVMDeZJJaje/6FPHG9C2bi+S01TIw95ftZ4g6j54nFmsPWJuT0DiBeW4V1zQ9UhHifNkuvrFlwicz4/8o/UjaaMQ41BXso16SIAclXXqOQPkYal+eTZ2GmFOGEVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XmFnq826yy8IQRRv8GUjD1C4fkLXKFLFnwJPcnm1ReM=;
 b=XhkTSyVF6jxAKQLiM6VyjnU+Fy6P77jldFgFwBz4w7MSi4EJaadqf0d06oaGrimvLP9fXr2tQD4UtcFrAV4bXz3wW3X6wGO1940V223T+zl4GmqOfEUDoSdhv5rT2D5yNzRYq4+zzXrjQ95QoOW1FfCBvtVTo7qkmEFAGfB/HnBjkRApBp276VE0J2BJnuJ45qjqoHc93Tv7gXl4qD16F4o9kzkvbq3LXUo+hCwR/OugxYirRij9x3Dn+xkozEVfEQ+OWL9/eHFga1z0i5SmT0IybrYa1VuQPSToYPEHGHiikptWAvGWYL2t5/PCGkMEoCG7AGJr7/b5Rvcc87Jjlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by SA1PR11MB9827.namprd11.prod.outlook.com (2603:10b6:806:4d8::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Thu, 13 Aug
 2026 06:26:23 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%5]) with mapi id 15.21.0292.024; Thu, 13 Aug 2026
 06:26:22 +0000
Message-ID: <b04990da-633b-496b-8d32-bf2c9996f179@intel.com>
Date: Thu, 13 Aug 2026 11:56:15 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 18/32] drm/xe: Report 'probe blocked' error using SIGID
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Aravind Iddamsetty
 <aravind.iddamsetty@intel.com>
References: <20260812191450.11690-1-michal.wajdeczko@intel.com>
 <20260812191450.11690-19-michal.wajdeczko@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20260812191450.11690-19-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0263.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1f1::11) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|SA1PR11MB9827:EE_
X-MS-Office365-Filtering-Correlation-Id: 90ce5693-da32-47b1-00d1-08def903cb40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|10067099003|56012099006|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 7wP9H6bvwpZraRATrrOaBq3WzhtDPsJHm4CsUJz84WAHtlTHLCox8VFefnwt2sNqcTDolC97LPBeGicyemmiQJcWvD6fwyumprJTywoRXsw/pTOxSGs7mJrJ4N2ueCtb732u17aBbhKDLMp33E27vgKSmBxbpJQ2ysNkuuYB6YouivobmUsLZul6aIDzosjn6qmwFB4BnKyZta2pR4weuB8yMoys7bjX7myWwy5RUd4WrWsOZjEMSW4ekwLaaW0Yr4C1UYTfMdCziMhXRfuOxgLZREiR7a+/+KsvEn3BAW8GA/dziAkdxe1h75lWE4vpsCKZx4Wa9rxTyV+blYGpHYBGF/eeBIjVWkJPL7ciNdXZect45jtVsm4wr97TxgVeahhg7z2Ol7uhOlCvNt9cqmo2nKuXqdmiWi+J0GoYNHExzmaB2ZpNTJljN2ihIjtJEd2jHVmt4AySWbu6D9+Ot6hGNrHUq8epywUd/RmJ3jftKUtykBmilYHcyGm6tqyDvhT1bOxmlK61rsaFU1fV/1hOeaKVtBDCmOybiJ3eR8+CpF/tjeLYPFjx/HxoqGV4ZBD5OU0p0RBtVtl4Z8kqvsKgxatwsvaX9kWFr9E8qZLj4m7WHMnuEVqP5kFlFpCRaDFNRErscuLstoMj/tCUV53A6gvsNCscuPbud531oWI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(10067099003)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dXlsZW8wcUV0bzN0UVd2UVR4STRjc3lrU1JFTEUvYUFabTZucEZGOXIydUJ0?=
 =?utf-8?B?U1FBR2lDK2VFejhoRlFsSWNPd2xyQXQ0eGw3eHhtSjlidm5oYjM5UkIwNWJR?=
 =?utf-8?B?VUpKNlNXSGMvNEN6ajlhSGFDYTZZbHY5NUJXN2RuUmRrUVdWWVpwMWU3UVF4?=
 =?utf-8?B?Vm02d0xKVU1NanJFdGduUTQxV2ZzVGFaUE5PcTNGcXJocllrdm55RlBseHJE?=
 =?utf-8?B?UHZaaGlCSVliaXd6VVhLYkZEM0ZsRlFYZ0JJUDVxekt4WERCQjJVVkY5M1B3?=
 =?utf-8?B?R24vcnhSc0lUVUdJL1NSZGNKa0laUXhZbDQ5a2liZ25rNEIvTm5jNitFKzRy?=
 =?utf-8?B?N1ZpT0syQkZReWZDcnVlVE1DZkl5WEFkdFhmOE13bkZCOUk2V2Fxc0RYcmxS?=
 =?utf-8?B?dFVOMDJNcGZ1cDd1dmpnQXM0R0RvWDJYQnc5YzdRVTM2ZFBJQi9MWWMwNHZE?=
 =?utf-8?B?eFN5VDNjTFFlbnZTOHd5dWtnUHp4akNJcnpTR0hJUzhkWDZVK1F6U0FDaXNz?=
 =?utf-8?B?TUNqUDNXZDZ5S01zdVQ2dG40MWpYb0J6NEd5Y2FYRTdWcDV0ZWZLQndRaUhx?=
 =?utf-8?B?d2tHYzA3VFlGaWM2RzM0QW01QThzNlZTQlVHMnZOeTllVXZKMENiNUEwQVNL?=
 =?utf-8?B?TnNEc0NOa3hncEdtM1NxdXlWSnc3QzR2Z0RwQ0RPNnBmMWlHdkFFRDdvVjFP?=
 =?utf-8?B?enI1Snp4cEIyNXJyU1kwRUxZZGREbGZ6YWxzdHgxNVJXWndKQlEvZ2NNOTBC?=
 =?utf-8?B?cWpua1lXS0NtWmUzbkF5NEpELy82ZEI4Y2FsbHIxVmRTYnN3UUFWYlZaVGFT?=
 =?utf-8?B?clJzK2dUSlZEYlgzYkV6V1B3eE5RQVczYjM3U3VQOEl4ZHJUcUg2SG83RGdv?=
 =?utf-8?B?UnFyczloOEdnTUJSdzF3b1VzWmc3OHgydWpIK0d1TVBpQk5KV0J5dE8xUDI0?=
 =?utf-8?B?bTNGdmZIRTQ5MkszWWRWQzdHOHJRQmllOXBSTWN3RS9uWmx0QXJTbHVvZlRz?=
 =?utf-8?B?Qjh1alV2WjNRNjBNSWVRYTJZL0F1UmladWNRVU04a3RZRUhoUEFyZ2hHc1Rs?=
 =?utf-8?B?RENmeVhld1JPQ1dGNDlSM29MdjU0eExLL05mRnhYQU9raUF3WmdCMmJnT1VC?=
 =?utf-8?B?UXpiKzRSRXlHT2xkNlE5Z0RabUlyMWxSbjNXbElrbkRYQVAzZmxKWEQ3elpF?=
 =?utf-8?B?OEUzVGVhcGFKOXFnQnZoRWpjSXZWdjRyZWVzaWdyd3JuTDhYYWp2MjFUNmFU?=
 =?utf-8?B?cjYreENjb3Zyb2ZQZEtyU1hwY1pBc2t5MjBXemJOMGdydG1td3lRT0JibHNJ?=
 =?utf-8?B?UUVTSVFtQjlhZytQemRRZG5BYVU5SlV4RDhzVnA4akFTeGlkUVk1QmIxQytS?=
 =?utf-8?B?STF3SkZHSUZNYVRhSFFFV1N4eXBySmowTk9tbnY1Q2NsVFpYQ3hMeDE3a0lY?=
 =?utf-8?B?QjFiZkE2Rlp4L21lY05XNFcyN3k3Mkw3UXNsek8zWElmN1RudmYreThiUm8v?=
 =?utf-8?B?R1pVT2t0YktNdUhHRVF5V1dVU3RHdzAwa1NXODZvT2VVdUgrNituRHBlT3Jv?=
 =?utf-8?B?V2U1UVllZDlwTHJMVm14dFlYVFpxUFJTajZFNFFOZzZXVXBPWm1KTWFDQ0JO?=
 =?utf-8?B?cDIvR1JYcUN5VkZ5b1hoSCsvb2ZFbXh6N25RZDhFS3pNWW1CMTRSQm00cVhx?=
 =?utf-8?B?ZnNxV3ZCbW9ZWE4ydEhsVDdlT25oeldlbFBXY1NtY0V5bm9wVW03SEpINUVI?=
 =?utf-8?B?cU9qQ2FPaUN3TDNtMVhWeG5EaUt4VnVEOEsyc1EyNDU5TVBNeU4zU25IRGVL?=
 =?utf-8?B?RnVmdUNSbVN1OFdqdTduRkZCazNqb3I4Mll6QXl0N3pBQUUyK0dDU1FvcHZu?=
 =?utf-8?B?cFZ5SmZyU2hKdGt2ZkJRZHhvRDV3dGhmcTBLS0xPUVFyZGgwQ3FQQmdZbytt?=
 =?utf-8?B?MWh1TGxmaFBHYlZocEVja1Nab0xEYU93Yzd1UWpnZUoxK21lVk4wTVR0Kzdm?=
 =?utf-8?B?aFBpZnJ6OERaNlg5UHViWUYvRGtjampqRmxpNWlDQU92RWhSYitBc2NXWDlp?=
 =?utf-8?B?VzlKb0l3VTZDU0ltTWZpSjNMMit5OVdkZm9Vc1ppL3dCM3VNTXpSaVV1T2xi?=
 =?utf-8?B?TTFPcWsybU11d0RvbEZFeTM1S21NR1JaSHpndDJjQmNMRjc2M2dRTlU4ZXVQ?=
 =?utf-8?B?TXdlU2FSTjhZTXUvUU05QU5kcXljRzZWMHZnTzNLSm9Qb1ZxcitNb01XNUoz?=
 =?utf-8?B?bVBnY1ZRaVFSQ2lrVDl5TFd5QUtzRDhQVDgxQW1QQkpaeSt6Z0p0QytOVllq?=
 =?utf-8?B?R0J3Rit6YzIvYW9Lemh4N2hRVTZ0RGhNL0xpd2QyNXU4U0FLaCtjUy9IU1U4?=
 =?utf-8?Q?uy1fHrvMz4M4EC5s=3D?=
X-Exchange-RoutingPolicyChecked: Lz8qf/PwWfdsu5mw6QLJe5XdjUJ51dVaHwxUCJZ33ojrsh1+yUXLtz1zAWlEI9S+WUxX5BLTjWTKwfoDFQ5tmY0fsRf91KrbAUmwEO3xznVroTLSh6WFU25M+woeOKD25CtaRlT3GGccv6cYgr/5aHTxjQFdShKi7s6SmMrKIwEXJ8jvQ5imMxzPAXhO+PEc9UTChVK5dOcU7sITBGTI/k7ShWot0xajIn6WeQfLz/plEK35IuBqNsxLEhrvY/CBG0Q3eBTGu2iiEoEun0rXfTHU4bgFaU1vDFK5tbOi7LtJAdChIKecUaLQBeeGVsvcC+bV9+yE8hm7UMYXTv+k+Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 90ce5693-da32-47b1-00d1-08def903cb40
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 06:26:22.7674 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GPbeZB8RX/6CKKh2kJBP5M8aTS3Ofy6ISr/3wW9VzVP4RH8fR2EXEQjwUy4F+fTMLEuukvVRlJ66k3OtgOe7x9vDCwE0A9vZHfXJtYxbINM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB9827
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


On 13-08-2026 12:44 am, Michal Wajdeczko wrote:
> Report 'driver loading blocked' error using xe_log_info() helper.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Simply we are logging information using xe_log_info right? not error.

If you want to log as error then please use xe_log_err right?

Please update commit accordingly.

After above changes

Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
> v2: use info severity (Aravind)
> v3: drop "Probe " prefix (Mallesh)
>      drop redundant vendor code, update message (Michal)
> ---
>   drivers/gpu/drm/xe/xe_pci.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 36d62927b969..b19efef1c5cd 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -25,6 +25,7 @@
>   #include "xe_gt_printk.h"
>   #include "xe_gt_sriov_vf.h"
>   #include "xe_guc.h"
> +#include "xe_log.h"
>   #include "xe_mmio.h"
>   #include "xe_module.h"
>   #include "xe_pci_error.h"
> @@ -1172,8 +1173,8 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>   	}
>   
>   	if (id_blocked(pdev->device)) {
> -		dev_info(&pdev->dev, "Probe blocked for device [%04x:%04x].\n",
> -			 pdev->vendor, pdev->device);
> +		xe_log_info(pdev, PROBE, "driver loading blocked for device '%04x'\n",
> +			    pdev->device);
>   		return -ENODEV;
>   	}
>   
