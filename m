Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00FCF109E52B
	for <intel-xe@archiver.kernel.org>; Thu, 26 Mar 2026 02:50:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 486A010E931;
	Thu, 26 Mar 2026 02:50:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VsQ3cHs3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD5E110E931
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Mar 2026 02:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774493449; x=1806029449;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=NxQ+Y8EiQTNlgkMQTtyjgujL9cXA6uBw3bo9T6F2hYg=;
 b=VsQ3cHs3lVyQkZRSQ9rJ5eYxaIFecCghb+Fe2yYqVn4Ja6/V6rVuq2mc
 c9GC3KZvQjniXNZ5Z8vO3P9H5KoSKz+Zn3avT6azIVbTwmcEVc+IbgzNF
 BhuSl0UzCgZu6UEGO400zzfBnG91Y3XBxmH3nTYAc6VbWM1y5X765Thk+
 42lw0KVYNnPNzJL9979HgoLRO0QAz5kO5UUCyWxs1GAeVRYvBiJ9UKwgb
 XiL9r4VmXrrDzdftFnh24E2TpkfTn0/VwbZ00LXLJ/op8d/s/jRhsOftV
 6TtxjWnIVLTXN7mmjhOjWPd9vo42aV3h7JSl/W/Vx8AXn9Lnp/C7qtYxn Q==;
X-CSE-ConnectionGUID: CszpA8iKTRGtOzTcAkSMyQ==
X-CSE-MsgGUID: 8rqxTkt7TDSnv292z1cdNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="79448986"
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; d="scan'208";a="79448986"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 19:50:45 -0700
X-CSE-ConnectionGUID: IwIDWmJSQJu6w9NUUiLpNw==
X-CSE-MsgGUID: D2t6erS+RJ6hslVHd9u9CA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; d="scan'208";a="224053182"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 19:50:44 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 25 Mar 2026 19:50:43 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 25 Mar 2026 19:50:43 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.67) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 25 Mar 2026 19:50:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OTiKbBXWSdk5XGFAqfzy5IZjoz9Gnb6ft40F+jf/m8vCwWK/brRcv0lh9cjr+EfEqP3YTStzmv+/PtEMGinCjAAao/1lHwYReelQv4QYJ3iU4571Jyg8/TR4fZrPAieARQ3dSRc/4hy38+uW+6T3Xrq2eVwdKooav2fSa9OxW9RDhuHvAKO5gxO89yQt30oBzBg49Sgfv39DyzCdx/XLTdKtQfQSOmkykXJAIj5XHyiIc7Ql1qJ1IG4iVDYfH6Ewkaxb8Rwp1XIFLlRA6xJJFBdrl9fq2UugV+0xV09wgNfNb0TgXYYoVJOB5JUgYstSDz+aXoLFfpl2nJzPdN1/NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qg1/rS+WPQ+kqPW9Sl6iKzn/61VfyFgnckw4LO1DI4U=;
 b=aAlYPSu36F7aYNlAklobjQnQ20JowiSdlZecMDIPR6+iH4hKWxe9OGAcQOeS7Wq6URE3qs5S/zKPT9MA+oEeTxG2HwouQyi57es3uhWbXxg4IlLj/Y44PBHsJhs0e9dmVZQwkA58Kz6KF/zUnMVaEE4OsnyUk8TXSc6pAlUwfMKWT59PbQTuql/UBCwKTUgr4TwJMdLtdFzBJLfY3KFRXBAOiNZgIstUrnnvt8Zha34S2ExmqLPxvEr2Uxpla2jNuCaDfozU1nBxQmtRVPnFcB/6yT97kn5eU+kvifbCJiDmOhVK3gOktCsAtEq+EuSdVfIUgYOaQgJVKV8n6IEc9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5706.namprd11.prod.outlook.com (2603:10b6:610:ed::6)
 by MN2PR11MB4661.namprd11.prod.outlook.com (2603:10b6:208:26b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.6; Thu, 26 Mar
 2026 02:50:23 +0000
Received: from CH0PR11MB5706.namprd11.prod.outlook.com
 ([fe80::30ac:8e5:b7c6:524f]) by CH0PR11MB5706.namprd11.prod.outlook.com
 ([fe80::30ac:8e5:b7c6:524f%4]) with mapi id 15.20.9745.019; Thu, 26 Mar 2026
 02:50:22 +0000
Message-ID: <9c766ec3-cc62-4047-ae3c-7a96b56cd8e7@intel.com>
Date: Thu, 26 Mar 2026 08:20:15 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 09/12] drm/xe/dma_buf: Block export of DONTNEED/purged
 BOs
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <matthew.brost@intel.com>, <himal.prasad.ghimiray@intel.com>
References: <20260323093106.2986900-1-arvind.yadav@intel.com>
 <20260323093106.2986900-10-arvind.yadav@intel.com>
 <bf99efe5398cadc1f8dcac8bb34b918eff73bee8.camel@linux.intel.com>
Content-Language: en-US
From: "Yadav, Arvind" <arvind.yadav@intel.com>
In-Reply-To: <bf99efe5398cadc1f8dcac8bb34b918eff73bee8.camel@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0156.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ac::6) To CH0PR11MB5706.namprd11.prod.outlook.com
 (2603:10b6:610:ed::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5706:EE_|MN2PR11MB4661:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b210849-4a0d-4610-32e0-08de8ae26cc8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: ZOqigSKjAq1304eZfzJ3K8X6iVGKz5H/yYSb69iDKr0FjnTQl1LehtQ8kwDMFD85d3lMi3uySSVTRdb+FoY3Gra0Apzk1cLlxV5w+2EcPn6Zl9lEqJRubM/dHMpWIxUSuXO9VPLDUByUx995Zc3a6KXly+SVDlcnD/53sDXJs/pxBRaWRvHi0KDB4i8dbT5yiVpQUzjheH8sGKkKnqO6Q5FcCatcyLwQsT5XBSfdlhna2dv/6opk+xOaEoQltAP8YIt74eRWY9u0WjWJEFKhZB/BFIcCLeiT1t49V4TfGf93JgUQH0XxCDsm+g4XVJgPENdSuMthTj+6ygD0uY4gx0NduT4pfuqLU3RSKFZmE390EABxZ78jS01hpsNGnyxtQDAkVqq4DpL8O8WipAdV2X2NE6//yBKeDaWWAJJw8Aexi9aJ7bpDG1vu6wVhTGgOSGpTbjAXMcCWMqn9eysJ15ShLh/3vtVdNcMadULKUtMzyr43Jw0ExObjHZp+SNJfWR9BfDA7ujXisF6forH3rp/ytUVKX72W7iCmtB/HJkPw/VCDkR9/7KWTQfg5cj5PP9eLCMnvareg++MJ3IeaJySm7y74ytQbIDqnilTNZGahaIprcFI5730puCjRL7myVEzIJTaXR+mEd4KG5EvVOBEBvyd6hlOZ+MCfrFdgnr/+uryX7aJQaOVcFzkCtzMiBdaAy6IPaUgCI48jcHHGXU1JIK5de+p/EbSvkDykVZ0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5706.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QXpOUmNodFo0OEVycWdnTjczSGVoK3ZKWTBQbXBXcEp4eURoZ0U2L3ZKRDc3?=
 =?utf-8?B?QW54T0RwdGM4Z01scnZxSmJRNENFbFRkWEZXOUp4eW5NOVE0YUpveERlTXk5?=
 =?utf-8?B?ak00MGZGeWFqdjA4cUJNdEJzWExlYWx2SEloclRyc1JtYXVrcnkxdWIxcjE0?=
 =?utf-8?B?K0NsQTVKNnBmRVhPSkVqS3hkei9yMXRJTnlxbU5PeFh5RkJpcm9iNnJzbFV4?=
 =?utf-8?B?WHdsTWlZc2IxSUtLbVJnZ295WjVydjhuUy9BYW5JVlRxK0dSdzNQNnhZRndi?=
 =?utf-8?B?dzNiWmRDYkJEYitiWmpOUWVCWjh0RE5mNFFzV1BHMmpRZk9OWXZCVU82Smw1?=
 =?utf-8?B?U2RRL2ppczA3ZlJuazJocFR4d0dpYXVINlF0aXovOUU3QzJ6RUk2ZnFoZFIv?=
 =?utf-8?B?bVZpdTJZdWhOaWtWeGEyc3RlN0xxZzVZRVhKZ2tZdSsrWjNPZzJCdzErRnhw?=
 =?utf-8?B?RTd0cHNtQ1d5QmU5bDFpOHdYR1hPb3k3cmIwSGwxVVZhT0ZzRkpFQTlMNWRC?=
 =?utf-8?B?MzU1U3hibEVVSEJ0MzBIYWc1UTg3QVlPWkJtN3pKTDRmOXRwS1hpdTZJTi9V?=
 =?utf-8?B?VkVBR3lRTkJZd3NKcWlIcGcxb2U4aE5YbDZzRW9EeG90cmVqZUliVGg4Z1Ax?=
 =?utf-8?B?VVVVS0xoVWlRUjJJaG1DNFp2am54V1FxOXpheXI0cWN1RTh6cW8vTkVMR2R5?=
 =?utf-8?B?Q3hROTN2UVVGdWRkRVlScGlUWU1EbkJWTGljaHlUZmJUQjdIRWszYml6cUJ2?=
 =?utf-8?B?RUd6eS8zQ2tyaGxFaHAyR2RzSVBYWkF5YXlBdVlvd252clh4c0N4aDF6cWF3?=
 =?utf-8?B?MWI1bXhnVmwvditsc0lwZys0bkRCdS91WHpPbXhFR3cvelVXRllnV05xckw3?=
 =?utf-8?B?VVd3NDRFeWZmanZCbmk0Nm41MDVFdEFCYWo5TU5lUVN6b2VGWnp5bTRWTzJL?=
 =?utf-8?B?bUhrVkhFUzE5aGoxeHRna1V3bERoQkcyaE5IZExiUGRlMkVjSW16M21YTDM5?=
 =?utf-8?B?bk1UV2dVaVJ2V2FHZUN4NWdpdEZQRUh6SnVkSEt2a3dEWDlPTVRoc2QrYlJJ?=
 =?utf-8?B?aUdFbGdHeTNtY2VJcHBiay9yck54UTJhUzl0M0xhN3d5NDYxajV3YXcwcmpH?=
 =?utf-8?B?c2dSNHZ5d2FncTlJNlo5Yk4vQVFKa0ZMbFJwZ04vYktVZXBHTlJkRHMwbTRI?=
 =?utf-8?B?MFA5QjBSTWdxaFhOOEtXWENydnhxVHovc2R3SnZSYlA3aWNDeG1sSGxhOUs1?=
 =?utf-8?B?N1NkTVIxdUlETm5BKzZYWW96aVFCMHNyOWE0dWFmeW9Scm43WjI1bXQyLy9B?=
 =?utf-8?B?akVBWXJVM2N4LzMrV0lLVEFwcm9Hd0xZZjNVa2UyYzd4bWVPNGlmaW91Q0tU?=
 =?utf-8?B?UTJYZFhxSEhIclJ5NE1sTUNGbmtubTc2TnJMUkdzNHBQbHRaNUpXSHNKYVFz?=
 =?utf-8?B?TVpiMnNncXdNTmRidmVqK0JHdUJJZ1NodUxUSnhrLzJuUlZYS04xT1pIWkls?=
 =?utf-8?B?dDdEaVJWQlBmdzNRWG1JVXAyUERrbUZtdk9kUENreFN2QTJVeVBWcnROaFAx?=
 =?utf-8?B?WmtpejFJTWtGT1kveDZsVDlxQ0JXZXYrUDNjQ2dDWnFZRDMwTFhsVWlJeE5U?=
 =?utf-8?B?TnRMaWIxNGdmdFc1akI4VGRsUGJvYVBiM1lMdjkxUHRjTm5GODF4ckhCdExR?=
 =?utf-8?B?N1psR1ZpUVdQT211Tm16Mm1iL0Q0L3J6NTFqM0NkWmsxeS9SakNDbThCZUZ2?=
 =?utf-8?B?TU1GWTJSUkwzZFIxZGJQMW9xc1JRMlJ3b3JUYmlyYU9UdHlIdUhiZmdjV0NP?=
 =?utf-8?B?Q09iWFhFd3p1RjhKRnhuYm16d0MvWDV1L2pKamJvUUJoNlRqV294UjcrbDRT?=
 =?utf-8?B?c1dTMjFGTURhcXk5TVMwbXJiQTZGbTQxT2ovQklDZ1ZEWllsNk9YK2hRNHV2?=
 =?utf-8?B?MnI2UE02TUtLOC84elF1UFViRUk2Y2p0a2RUbHNnYThQa09BdzVZUURONmZq?=
 =?utf-8?B?RFVvUFBGcVljOHFHYndZdDBPK1ZuYjhvK01LOGFMcTNUS1pHTkFDVG5MK1Bn?=
 =?utf-8?B?a2RqZXJsT3lubzdra1FEN1JSZXNWNE5zRTN1RUV4RThBV3VQVkIzNGVtMExp?=
 =?utf-8?B?eFJqL2MxM0xYNUJFSHJCVzhpbXYyYmMxWHB6cUJtb1ZGSHE2L0ZSTGZZRFFO?=
 =?utf-8?B?RkhlRUtkMThtaStIWmxlejhUZWxkdnVBMEcwcE1oZkFBYmhXM1duUW9hcWZS?=
 =?utf-8?B?OThsZzQrK0p6Tk9YOWR4S0dhd2pUNnlEbGIveFZZa29Kd3Z0Tlo2S0VoaFc0?=
 =?utf-8?B?WDRRMmRGQy9qV0liWUZ1OHlQcXEyYlRNZlVPclRveE5yL2JUZ2JOUT09?=
X-Exchange-RoutingPolicyChecked: HbXKix263v7Rixp96bQDz5amqjj/e6+6zoQOsln+eVyzIu/FgMxv7s9KQ91Su8WpkodX0NsnWGO/JGvKPYKUG9ubxIHIZ3BAjH6MruGfrlbi0kntuZ3+Ysa4eFFyR4tF7gAGyni8INny+7bnJIe5bF58cbRRFbl6LZH3vSDJnG0sbun/9304t3/gRaK1hwyKCGFtt4CiYMt0ClAeybmMyj16rIM2j7+vDKdBxQ2yNRmfouESx1Ny4JEMTLN4xLhrBzP/CgEXcWbvkxQDTnVjQptjmwkLdW6zwzgJ7QzJz86c0UBZ0jO/rZ5dS7N6ZGgw1FIjvmTnHDuZy6cLQViocg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b210849-4a0d-4610-32e0-08de8ae26cc8
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5706.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 02:50:22.8721 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SrbYkvEazCpbCH2PsK/q0D+m6XcSIIyPJip7wIbRNeS8A1ptvKsPccKmZtxqbp5D7Jz0ZgV163ddziNUJOXGJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4661
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


On 24-03-2026 20:17, Thomas Hellström wrote:
> On Mon, 2026-03-23 at 15:00 +0530, Arvind Yadav wrote:
>> Don't allow exporting BOs marked DONTNEED or PURGED as dma-bufs.
>> DONTNEED BOs can have their contents discarded at any time, making
>> the exported dma-buf unusable for external devices. PURGED BOs have
>> no backing store and are permanently invalid.
>>
>> Return -EBUSY for DONTNEED BOs (temporary purgeable state) and
>> -EINVAL for purged BOs (permanent, no backing store).
>>
>> The export path now checks the BO's purgeable state before creating
>> the dma-buf, preventing external devices from accessing memory that
>> may be purged at any time.
>>
>> v6:
>> - Split DONTNEED → -EBUSY and PURGED → -EINVAL for consistency
>>    with the rest of the series (Thomas, Matt)
>>
>> v7:
>> - Use Interruptible lock. (Thomas)
>>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_dma_buf.c | 21 +++++++++++++++++++++
>>   1 file changed, 21 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c
>> b/drivers/gpu/drm/xe/xe_dma_buf.c
>> index ea370cd373e9..4edbe9f3c001 100644
>> --- a/drivers/gpu/drm/xe/xe_dma_buf.c
>> +++ b/drivers/gpu/drm/xe/xe_dma_buf.c
>> @@ -223,6 +223,23 @@ struct dma_buf *xe_gem_prime_export(struct
>> drm_gem_object *obj, int flags)
>>   	if (bo->vm)
>>   		return ERR_PTR(-EPERM);
>>   
>> +	/*
>> +	 * Reject exporting purgeable BOs. DONTNEED BOs can be
>> purged
>> +	 * at any time, making the exported dma-buf unusable. Purged
>> BOs
>> +	 * have no backing store and are permanently invalid.
>> +	 */
>> +	xe_bo_lock(bo, true);
> Missing error check.


Noted,

Thanks,
Arvind

>
> /Thomas
>
>
>
>> +	if (xe_bo_madv_is_dontneed(bo)) {
>> +		ret = -EBUSY;
>> +		goto out_unlock;
>> +	}
>> +
>> +	if (xe_bo_is_purged(bo)) {
>> +		ret = -EINVAL;
>> +		goto out_unlock;
>> +	}
>> +	xe_bo_unlock(bo);
>> +
>>   	ret = ttm_bo_setup_export(&bo->ttm, &ctx);
>>   	if (ret)
>>   		return ERR_PTR(ret);
>> @@ -232,6 +249,10 @@ struct dma_buf *xe_gem_prime_export(struct
>> drm_gem_object *obj, int flags)
>>   		buf->ops = &xe_dmabuf_ops;
>>   
>>   	return buf;
>> +
>> +out_unlock:
>> +	xe_bo_unlock(bo);
>> +	return ERR_PTR(ret);
>>   }
>>   
>>   static struct drm_gem_object *
