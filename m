Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF10DCA5FFC
	for <intel-xe@archiver.kernel.org>; Mon,  5 Oct 2026 09:29:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81CFE10EC4F;
	Mon,  5 Oct 2026 09:29:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k/VYteSx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C363B10EC3B
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Oct 2026 09:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791192598; x=1822728598;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=udgDrujdgooVUI9f/CXH1rrXtKxkTcieFORHwpdojD0=;
 b=k/VYteSx8Uh6m9xzEFZhKpo2NYZ0xI7IhK9nw3a5GsBUKi5Untm0qs8g
 EKZJ+JRgnNWW+5Fmdi3cpogHfep38vX0sg8uHNcklYZYafYi1EK6LdkNi
 cBwJ8SO0Qv/CIniStgOO8sVOPaHk0aXf5HAmiX9tSHLcWNiN/XDHYNKSi
 4WKKiZCjhfjoLG07mosNFFBHg+C1AQ6lz9A9E2QAcqdDCTXFEBpQuXOHG
 15Lw5KAo4CaPZYoD/T8VTPbrKEbTt6GKCk/CXYFFoHMheRGkvX4NFMOvu
 PNNp04od9Whe3NPcQhTNmN50HIS61BlpXNs2UW9AD5de2LcrlBy72+zW1 A==;
X-CSE-ConnectionGUID: qyYi3DjcSMGRYVNwJxhO4g==
X-CSE-MsgGUID: DxMSU3VPQyeQj9/kB+MfBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11925"; a="101183042"
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; d="scan'208";a="101183042"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 02:29:58 -0700
X-CSE-ConnectionGUID: gdgp0KwTTu+ZVQAH49myUA==
X-CSE-MsgGUID: 9VNFBIKZRvOEGpH4ug1xvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; d="scan'208";a="281544716"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 02:29:57 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 5 Oct 2026 02:29:56 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 5 Oct 2026 02:29:56 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.46) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 5 Oct 2026 02:29:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RjSYoUHZHxfFrGBo0T//leJWf/TYyMMZE2XVqwRsfhjWUmzFWjQKGejNN4KxAPjjpwcB05Dc4+hbE945NSi2B3oiX8bhp1VaJN+1WyRjhLSk3HKcJK6VHkc289qOO2g3Nw4D47sxjjwjAUB+/8EzP3FkK4diRNB9jqqLNOjJwldl830lky88My0Gw+Nyq4hmBxJrP1bf1wA/KkW86Lsu+O3WAR4WpxAGm3qanoOqiRs+RYPDawuqh6kPvorS2os7WNS1DnoVQQVOeN8oqXYGMtf00uXs9TkE0h70pEIEs5kYb73caCVjh7ITE9tUN/qtZvjm0gj8gdfa2gICbIn6tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oQrcZpkpyOB1JGWICCnxd8kYeedFwwtY4OpEImpZb80=;
 b=mPcUddcOzI7VNAh2SAG9Fzb9zoQotUih5q0bjp04eMx8pFk0CtXarxDLgTIDnFtPmj5f9mIG7QYj9EdMjVWMOisuEuoOPsK1hxoQ4Dv3GREtJmUvZuS8ZtMrT+TxUXk83+nog/LsH8xpVCTzFnIAp0seGYnuFj4k03q0FbetpOMIoPJK5phTsWi/CK8XrGImFtFQRrb79wVQIY3I5CqRsyOLqCg47PGR5EBYuVISlAGHriZ0o0hhvMGnTRfJ3CTk4q6PaJy54gInIeMrWzmTU2pTmB+GeBqBntu/3GlGYwpLsWIBmjAH4GO/Cibl/8j35GBkjUELwD9/p3sHoB2bGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by CH3PR11MB243846.namprd11.prod.outlook.com
 (2603:10b6:610:362::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Mon, 5 Oct
 2026 09:29:55 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::3a:cd0a:2af8:5837]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::3a:cd0a:2af8:5837%3]) with mapi id 15.21.0472.016; Mon, 5 Oct 2026
 09:29:55 +0000
Message-ID: <d116ce1e-abc3-4f4a-8805-6d718416cf8c@intel.com>
Date: Mon, 5 Oct 2026 14:59:46 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] drm/xe: Fix stale pinned_link entry when fb-pin
 performs the final unpin
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, <stable@vger.kernel.org>, Matthew Auld
 <matthew.auld@intel.com>, Matthew Brost <matthew.brost@intel.com>
References: <20261002100830.12297-1-thomas.hellstrom@linux.intel.com>
 <20261002100830.12297-3-thomas.hellstrom@linux.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20261002100830.12297-3-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0239.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1f4::16) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|CH3PR11MB243846:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cc0e302-9a82-4708-e760-08df22c336f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|11063799006|56012099006|4143699003|10067099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: DL42VqYHwsjDg4C4iO6rh89x5vmG6myDAKrH3I2sYC0Qi2PnRGYndD3Xt5WVS211C6ScqpHQpuaT/j0NXFPpa5jua8mpqx/y39T1KZS8PSc5F8V38g5yDI5Q9EoB7c8tu3yWmKai3wS20cZzQZOg3ln/J2X4jPCPRD5qTu+MzkEdwOdcIRVcNwxtwQnOTF0eSLeQGffvFgnkweJnfrDuuYKMJINmi2iQIum53XNjSKBw5NIXAJby84eisrWA8A1HtDD+aGlf3GAvbzEiGgDBiW1ICGmaXUoX6k7+Ex6uOAAj8l43rnYACmBTtsZvXFyfGP41DWAknZK6TwIVtNsZrd6GwzoT2D/JUswrNLwtwzewam6H056Qh4mMSHFWDcxZFyEpBQUugF9Pu37h6Icgr740Mu8QTJVTR93bXHn0yDKW3Xww5eAXEd7X9NpTa1Bpu7IFf2omAE58eH3cLbX9DlT/jS4F2JskeRE4uj7k2Vnc6iFNqKz70CoFdBZS6aOG+jlqx+3eWGfDmlTqAVVNPUlb+TurSiqJYN6D+OY/SWKXBeViVcf7Ctr3h9vCDQ/6dhzhwcDBR6dwixBEAxl+a8bhL6tFWsGhfwuLpamPNh61Q/J7Eb2MzHKJfGmOsD/yfhfUQUEecX+J4226c4IaP6vHlkwPPHmrnL/Wlk9SW18=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(11063799006)(56012099006)(4143699003)(10067099003)(22082099003)(18002099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cElTZG9JWE5SY3crcWJqMVBjMWpQMGQxd2Fta2NKV0NNNFJQN3djeFlRMENk?=
 =?utf-8?B?NWZnMEQ3VFpsTEJZS1JYTkUzVWxKcmYrbkI0d01UangySm5nd2FFWmxpeW8y?=
 =?utf-8?B?c3Q2S2E0a3hDNmRITFRnV0hOdDllSzNyKzhzQzNZSUNBRXM2U09tNzJFaTV5?=
 =?utf-8?B?MmtxWlArSnpGNlVaQUVYbkZBaSt5SWFlRUQ1bjNGcUNLZUFST1NWR1JNcVRE?=
 =?utf-8?B?MVAzK3ZEbDJpdHJqdVByc3BFSWdXZWFZMERlTThuY2ttakxsMnU0eVdoekVR?=
 =?utf-8?B?Z01nM3krSmpJYkxJcXlUSFdGeEhkL1J4bCsrRkRaenhnNGVQM09KSUhDTHJn?=
 =?utf-8?B?cVZkeVlxVlZNb3NvakJEWTI5dmVOS3JzMmVvUnNVaUNLMXh4bEJBYUhOazVn?=
 =?utf-8?B?MTk0dEc4TDg3QU5IdEwvaTViNFVTa3dwQytDeStxT2N3TmgyemEvM25VUWVj?=
 =?utf-8?B?eUZZRVhpOFZMYjNYSmpHclZQRGkwVGVuQTVSaDJpZklmai9KTjBNQUZKcG85?=
 =?utf-8?B?Z05yYWNsLzZSNTBpeVJyWURZRGIxbzBtZXVYcGt3eGt6NVI3VlNvUXlId0Na?=
 =?utf-8?B?TU5tQVgzY20vOFFObU5MbEpka0lXM0J5ckJBNCtDOVcxRjFIOUdPem1kd1JY?=
 =?utf-8?B?enI5NXV1cXErUEo4V2pDUEViUE44Q1ovdEJiUTFCTlBKNlFqWWJCam1NUXJo?=
 =?utf-8?B?YXlpSlByZTNVa2NsNkJLMWwvK2J0empnN0h5MzI3NEVqWjRobFJjaXVTcXph?=
 =?utf-8?B?STlVV0x3c3FwODREeitWZzNEVUFuTzQ3TlRwQUx5N0tSd25xNkltdTNWNzRL?=
 =?utf-8?B?anNlLzBueHNaQVVQcThXS0tPcTZ1TXBKTnhtcDcramxCN1QxTnE3a0RGNkxz?=
 =?utf-8?B?VXNNQ20xSEtIbU9oQzkwTnVjSnI2SlBQRE9xMFRxQ29ENVJMUVpqR3l2d1dI?=
 =?utf-8?B?MFphN1k2SHdETTU5dHU2Q1ZBZ0swQ3pXS1pqRHpySllOZVVUWFlNMU9oMUxQ?=
 =?utf-8?B?bURSWHR5V0kvTEVyS1BlbkwyWjlkS2lDK0psRWdBVTlpOWRiWEZWeit6bWhq?=
 =?utf-8?B?UDZNWlcydkNQR3Z3NkVLeUdsUGVKYkdDdHBYWTFkWlBRcWphczhaOWd3ZTlQ?=
 =?utf-8?B?YlNSVW12Rm5TZktXa1pDSksySkY4Z3BDZ0ZhU3Rjb0htbXpudCswVTk5WnR0?=
 =?utf-8?B?NFVjaUZ3RHlkSDdCMFBVVmZISGtlUk5Tcnd3eno3Nmo5VDVhbmtHd1F6dFpt?=
 =?utf-8?B?Q0d1VmFaZWFtbndWalF4dWtBandtQ2prZWc4Y2lFdUhRWU8rS29xK1dyd2ly?=
 =?utf-8?B?SjRMVi9YSEIzR1AwSGo1Q1ZlenV1Qjh4QWVwQjNMYWdLL2Z2d0FiSUpwbEFC?=
 =?utf-8?B?TkRPV2gwMDdCVDZKVXV3RzJYcjR4enFPRC9rK0EzcTRyR3ZrVkVTWUMwYlNO?=
 =?utf-8?B?bWNva1ozUG1ZQ0hrVk9MYTJkaG5GNzRLWE5QWkhWaWVuUUlxcy9mSlVYQ2p1?=
 =?utf-8?B?azB2bWl1eDZ5QzRVMENFMVVUMk8yT1RWTk03elpJYTRoSEZLNVo2b3puT2U5?=
 =?utf-8?B?QWpJZkZoK3hpU2hPRW9EZHJ2bGpvUzZEUkczaE1DcFZaZXlFc1lEelNzZU1q?=
 =?utf-8?B?SDBBc2g2Y3pNWGx5NVlIbVV6MnNnRUJDbEtkTmZqNVRBZ2JTL2NZbk9Rc1ZS?=
 =?utf-8?B?cDhhTHU4WE1jTGo3R3JZOG00NHNoVUNqNzVHR2NwSHdiS2pGMEV3emYyYzJx?=
 =?utf-8?B?cjJvTm5wUCtGcHlJRFl4S2VYSnNYTUREZ1g0WFByTXdrWG5FOUloS09RWjVo?=
 =?utf-8?B?Wmx3Z2JOQm1PTm9CYndjL2w4ZnlVUXdINHg1SVVWK283SklWL3plS05mdkEv?=
 =?utf-8?B?cU50d0RqRE9PTHdJbDZRd1doenZVWHE2WWI5QjFuSUJuNk4vU2dkUW5yWEpl?=
 =?utf-8?B?ajVHZlM1RGdwTWRvbjg5K2lIYXY2SDFFVFZRVlJZd3dqamI3L1dQSEVWbGx4?=
 =?utf-8?B?VHRnRUN2SEJ5K2IvNGc3VGhNLzFRaXJkamdyOTBleDFXZ3hOa0YxQkRqeXBk?=
 =?utf-8?B?TFVQN3NEbVBvN1dBVTFuSGNwMTVia2NYdUJBN1ZOS2NRYTJEbm5yeUdoVW5x?=
 =?utf-8?B?b1lJUTI1TkNZeGdqZUVHdmVWaThLS0xxcytoMTBsc1o2VjUyVTRidE5EV2w0?=
 =?utf-8?B?VDh1YXp0Nk9saW5SdkNLSG1tUEVTTFQzT3VCSmhqSk1tRk0rc1VJTGNYcGQw?=
 =?utf-8?B?c1hEd09zaDY0Y0o3THBzU2x0bHRKNFg4ajBtQ0g3RGNabXp3T09yK2kvMWNI?=
 =?utf-8?B?OCtKZk15SUxNemNXRXg3dkp1OHA2OFlEZGNsSEJIQkNkZlFWb2JjekhXSHhY?=
 =?utf-8?Q?jAXBiu+fAmpG+JTA=3D?=
X-Exchange-RoutingPolicyChecked: D6DzTmZZODv3jZvWmGHFFOiIMDFRzJB5ruE0xqMj7fklx5k3RkUvSsBrFucpLBWNUSb6UFKii27w8DE+EyskJSmInghPjrvk05WOO+oihBNAhAZRBZ/Az/PTGsfkhlDAhKkh3vMVPpFfuY1iDTEYl621D3CjkvTgFI3MPEMThLuoeQqMN1RI7dqScJ6LO+RkeXimrO2XIcu5xAWSr58L/j934hgdt5ELSNhkW40f41iunDIwbVvtpQ9RtIOLIysSXJbDaIJyfcGxoJ9vc/erBbqmGgT5slJvzFNsmKu180LW+L0V5luN4W7c43MmymIdMfuqrbvgwoIcfVEXbek+dg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cc0e302-9a82-4708-e760-08df22c336f1
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2026 09:29:55.0476 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 42PhR9oq3naE9XLVxx5LiMgM3HND917PgLArkhLSrL9T+qB/AMJI7fnlQTDDa+49TXdKNZMtr7cU9yYbiAME9VX5b+oX8VKa7xi9eBqKeoA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB243846
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



On 02-10-2026 15:38, Thomas Hellström wrote:
> xe_bo_pin_external() and xe_bo_unpin_external() maintain the bo's
> pinned_link list membership in xe->pinned.late.external, based on
> whether the current call is the outermost pin or the final unpin.
> However, the same external bo's pin_count can also be raised and
> lowered directly by __xe_pin_fb_vma()/__xe_unpin_fb_vma(), which pin
> the bo as a display scanout buffer without going through
> xe_bo_pin_external()/xe_bo_unpin_external() at all, and have no
> notion of, or ownership over, pinned_link.
> 
> If a bo is pinned both externally (e.g. dma-buf export) and as an fb,
> and the external unpin happens first, xe_bo_unpin_external() correctly
> observes pin_count > 1 and leaves the bo on pinned_link. When the fb
> unpin later performs the true last unpin (pin_count 1 -> 0), it never
> touches pinned_link, leaving the bo linked on xe->pinned.late.external
> indefinitely. Once the bo is subsequently freed, this stale list entry
> points into freed memory, corrupting the list and risking a
> use-after-free the next time the list is walked or spliced.
> 
> The backup object pin/unpin sites in xe_bo_notifier_prepare_pinned()/
> xe_bo_notifier_unprepare_pinned() have the same bypass characteristic,
> though they never add their bo to a pinned list, so are not affected
> by this particular list-corruption issue.
> 
> Move the pinned_link removal into xe_bo_account_unpin(), which already
> runs on every unpin path (kernel, external, framebuffer, backup
> object) right before the true 1 -> 0 pin_count transition. Since
> list_del_init() only operates on the node itself, this removal is
> list-agnostic and safe to perform regardless of which list (external
> or kernel_bo_present) the bo happens to be linked on, or which code
> path is performing the final unpin. Drop the now-redundant explicit
> list_del_init() calls in xe_bo_unpin_external() and xe_bo_unpin().
> 
> Fixes: 44e694958b95 ("drm/xe/display: Implement display support")
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: intel-xe@lists.freedesktop.org
> Cc: <stable@vger.kernel.org> # v6.8+
> Reviewed-by: Matthew Auld <matthew.auld@intel.com> # v2
> Assisted-by: LLM
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> 
> v2:
> - New patch
> 
> v3:
> - Rebased on changes to previous patch.
> ---
>   drivers/gpu/drm/xe/xe_bo.c | 25 ++++++++++++++++---------
>   1 file changed, 16 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 6cc3f0bc0be4..5a70e652895b 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -505,12 +505,27 @@ static void xe_bo_account_pin(struct xe_bo *bo)
>    * ttm_bo_unpin(), so that the check against the true 1->0 transition sees
>    * the pin count that is about to be released. See xe_bo_account_pin() for
>    * why imported bos are excluded.
> + *
> + * On the true last unpin, also removes @bo from whichever pinned-bo list
> + * (external or kernel_bo_present) it may currently be linked on, since a
> + * bo's final unpin can happen through a pin path (e.g. framebuffer,
> + * backup object) that has no notion of, or ownership over, that list.
> + * This is safe and list-agnostic: list_del_init() only needs the node
> + * itself, not knowledge of which list it is threaded through, and is a
> + * no-op if @bo is not linked.
>    */
>   static void xe_bo_account_unpin(struct xe_bo *bo)
>   {
>   	struct xe_device *xe = xe_bo_device(bo);
> +	bool last_unpin = bo->ttm.pin_count == 1;
>   
> -	if (bo->ttm.pin_count == 1 && bo->ttm.ttm && ttm_tt_is_populated(bo->ttm.ttm) &&
> +	if (last_unpin && !list_empty(&bo->pinned_link)) {
> +		spin_lock(&xe->pinned.lock);
> +		list_del_init(&bo->pinned_link);
> +		spin_unlock(&xe->pinned.lock);
> +	}
> +
> +	if (last_unpin && bo->ttm.ttm && ttm_tt_is_populated(bo->ttm.ttm) &&
>   	    !xe_ttm_bo_is_imported(&bo->ttm))
>   		xe_ttm_tt_account_add(xe, bo->ttm.ttm);
>   }

LGTM
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

> @@ -3322,11 +3337,6 @@ void xe_bo_unpin_external(struct xe_bo *bo)
>   	xe_assert(xe, xe_bo_is_pinned(bo));
>   	xe_assert(xe, xe_bo_is_user(bo));
>   
> -	spin_lock(&xe->pinned.lock);
> -	if (bo->ttm.pin_count == 1 && !list_empty(&bo->pinned_link))
> -		list_del_init(&bo->pinned_link);
> -	spin_unlock(&xe->pinned.lock);
> -
>   	xe_bo_unpin_account(bo);
>   
>   	/*
> @@ -3348,10 +3358,7 @@ void xe_bo_unpin(struct xe_bo *bo)
>   	xe_assert(xe, xe_bo_is_pinned(bo));
>   
>   	if (mem_type_is_vram(place->mem_type) || bo->flags & XE_BO_FLAG_GGTT) {
> -		spin_lock(&xe->pinned.lock);
>   		xe_assert(xe, !list_empty(&bo->pinned_link));
> -		list_del_init(&bo->pinned_link);
> -		spin_unlock(&xe->pinned.lock);
>   
>   		if (bo->backup_obj) {
>   			if (xe_bo_is_pinned(bo->backup_obj))

