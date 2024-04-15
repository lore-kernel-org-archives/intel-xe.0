Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AA69C4345F
	for <intel-xe@archiver.kernel.org>; Mon, 15 Apr 2024 09:13:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14ED41123D1;
	Mon, 15 Apr 2024 09:13:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TIAwk0lS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC3461123D1
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Apr 2024 09:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713172388; x=1744708388;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=EYAKaZjV6nICdHjaoLegvn0+hVeWIgJV5rvm7YqE/M0=;
 b=TIAwk0lS+n+zayMcLpQGQ36is+yrRVJjBKi79enQWkXigK1QiiVNCjRp
 oJLxgSCR2epa5unxUUI5BKtdXU1XHfeoD1baLdGSiokIA3iWFb54kunDL
 AydxOC+ilkbBFfOAlPyryyrVvr6ZUlProGHSELdXXvfCNIKiXiFDonLLS
 xq3UFd11rYda3XsCJ3cAiHV5sfEUlJ7g9fB6mTlbmyJUZ2dK4d2cYAUgr
 FwKSDn1PLnUVoOVHAUB3jr3vbUQi5BolAXAEIfbJq/5lmKZeDKGpqT1O0
 iXQqJvoUeLyZl29peZG93nC+hy45aB9furspRMh18HisEzL0HNPLwXagw g==;
X-CSE-ConnectionGUID: K6SoeIP0S2KaZwRPXTloAA==
X-CSE-MsgGUID: T/ff9il7TWa6EqHb+Ph15w==
X-IronPort-AV: E=McAfee;i="6600,9927,11044"; a="8721317"
X-IronPort-AV: E=Sophos;i="6.07,202,1708416000"; d="scan'208,217";a="8721317"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 02:13:08 -0700
X-CSE-ConnectionGUID: RLCp/Up/TWi3wxPQ05hUwg==
X-CSE-MsgGUID: xZwzaoQeT1yLZs9kk7ZPJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,202,1708416000"; d="scan'208,217";a="26411806"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Apr 2024 02:13:07 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 15 Apr 2024 02:13:06 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 15 Apr 2024 02:13:06 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 15 Apr 2024 02:13:06 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.170)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 15 Apr 2024 02:13:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K4aU1sgptO7EXeDUbk58UhDZjXB4YnbsIEPAusobsTw9Qpxy2+60QNFZrw8NQtTXpafjLup6R2E9OaMbNtZfby4Y8JCm8PQIhLiLd4MJrhEBMXY0waRrFmZhKXO5lPHN1GpspQlcrdzdV7B8Ih3QK/EGVfmqSAmNHH47Ks3iFKbAiiJfnE5huH8s2JmEPYs109LSkkEa/z+JVc49nztCOdS5sZmiFuOgPH5G0NjN0CJEtqPk6MIdk45SajpHiaTau5XdEsHXEhL26OWvqqJK+i5p9HWaR5Kh4pWN6OhPVEWs5kU+d3yW8kxR/1Q0k/0aKShhy6eaLWdwsEl4EWv12Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qwqr4eJCdnbgqzcaEVIXFB5woAu6po0nY+B8dudfiAg=;
 b=YMDVIvsuRRGQ7PiJYZVZk7Lh4hnkO+Pc0L4Wtn8MLsp269E92f42KGBEno++7jDsC7WOhPjOW0zN8jE+JpzqGGLtJDWkzEnc4VkpxzTx182Ih/uPORzIAeEpggUFzOhml/Sztfo6pdepwqLaC7ftgcgY/SMS3aut9lds9o50N+N1nWlO1EOt0I4mIQwtK7k5TnDxuy9eI3h656f16hPGUrO7Az2/WFgyq3a6DsKJ/4rBtH/abGp6B0ovYFnMiy/fkJVoO+em13pf6Ethw4UQ7eOb4di4IhaNRSPL4FNUTRUpcUhphQiIHZ/Fa9kYkwMzx8bMsjZhTwR6XS3KUpflhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by DS0PR11MB8719.namprd11.prod.outlook.com (2603:10b6:8:1a8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.25; Mon, 15 Apr
 2024 09:13:03 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::ff2a:1235:d1ba:4f93]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::ff2a:1235:d1ba:4f93%3]) with mapi id 15.20.7472.025; Mon, 15 Apr 2024
 09:12:57 +0000
Content-Type: multipart/alternative;
 boundary="------------LjjMg38QTjTK5A7Ny8l6RNSL"
Message-ID: <0d5a5db5-6eee-4def-bbee-0071b376f142@intel.com>
Date: Mon, 15 Apr 2024 14:42:51 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] drm/xe: Allow to assign GGTT region to the VF
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20240414190137.1243-1-michal.wajdeczko@intel.com>
 <20240414190137.1243-3-michal.wajdeczko@intel.com>
 <f3151915-3057-4fe8-981f-cf58ced43b04@intel.com>
 <a49558af-c6d5-42c4-b942-68fda8bec3b5@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <a49558af-c6d5-42c4-b942-68fda8bec3b5@intel.com>
X-ClientProxiedBy: PN3PR01CA0145.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:c8::23) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|DS0PR11MB8719:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d9ac306-938a-4731-b34c-08dc5d2c3da5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VYqEqBxmQGPyeujtLwxGRylHRj2VMPM+/0EFMjov0AsxFmgK/22VYgSoMJBPu62l9d6lWAGqWX8UfbGlnGMhbg03ULWpqGMcP6UAgYlbHurRprPsPrS+LJBO9ro+s7CyA3LD7AayO/cecEe3GqdCn4B5XZNT3bTlx5QZwaWXX2mI4kIt2vms9fKianJf5IFIviKUidCxfsKhsYkIlbVha/uZ+MvMT86ORA4OefnDzi3FbZjGlQ5+eXeV6L1fNLjyD7dui+91HHJ/n97NUzPpzw6rhA7d2Q2EnkUMXBF8h6zwXYOfsnW8U7z57QXwFvF5D2DgZXqXzopmPYh3FY5btveNXLYgU8Aew28wSaA2YRqv1avRKGJPmBFNC4onQBp9+v1E7wLRc1BGseUrswX2sin0OEhkQ7ioLFzUgl6bOeVT+XCFsFAgEs9mgZimhHtWK3krfn6rKULRD9u/KFMWhYZ5zjPpOIoRDTi9c1jE3YX4Tx7aNzS3coEwPK0p03CQTKTXlkzbg2ybkcPIsCai85XJsX65qIUdpGgUWiEpx1+2aoulB90uP5aSa31YLDshBhQb1jhHeVo3/h87hPOBhJy3N4Xthk42U52CNZTUVkeqR3rebJtPPyGq96Roi53eap0A1iKgIbp38NaPt1emU4tSsB8rXBHFP2+gN55sMFk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K1FkZHpsdHJzYnZkQnJDS1k1dkh2ZFdFbVFCTjVudHR5ekUwcHNPYzlnakln?=
 =?utf-8?B?ZVkwd2hvb0ZJYUc1NWhRam44MWppMmNrcGN6TERtL1BOeCtKbWI4MjV1M3dZ?=
 =?utf-8?B?ZWgrTDhUMk9hcHZubTFZdEt4eitrRERSQlhaZ0V1cExaMHlvS2lTRnlIZ2ZM?=
 =?utf-8?B?WE5vb1VDWVJsYWVtSGFEYlludGM5WERDN0hEMUhOZWlBYUhNUzR1N2NFeFBr?=
 =?utf-8?B?UFBSZllOZENYL1FSRWlSaFhMV29BT1BwbEdaR0poVVlMMUlsbHYwMkt3Wkdz?=
 =?utf-8?B?VEZzNmJ3OFNnRWRVVG5Yci9EVlJYdXFKR21SUjhFUTBWZnFwbE5NUGMxUzZx?=
 =?utf-8?B?NWlFYzQzVVRsSUxtTFM4NE95eVQwV3hJVGZYTG90eks2b0V2czhvd1d2Tjlj?=
 =?utf-8?B?NmNmNU5IOTF4ZHJjODhqay9IWXdyVTE3V0lLSmgxNnpHcGowbHNYYlJuQmNB?=
 =?utf-8?B?a1VlRCttbnA0ZVJjODFzaTNNSXlEMlFIOVAwaXhDVTFhRmNyVjkyV2hsVXla?=
 =?utf-8?B?TnJOb2kwOEtYcTlBZVdpQnpzSVNERTNkQWczb0ZtcmRiRVFiM2E4WG01cGlB?=
 =?utf-8?B?R0h0TGRXWGtYam1vVmRCdG1YSVFCOEdQeE9YSFFwcVpTbTNwMWdKaDZVc25S?=
 =?utf-8?B?OS9UbXJmWUg1eElwVG9CNTN3OXJrcFl5NmRyS1YxNUhEd1RFNXFVa1Q3U2ZX?=
 =?utf-8?B?RkxET1pVOTZKVkxuSVZ3Nmg4UkJSVG82NThQSFZBQXdDQmJYekU5bGhMRzFL?=
 =?utf-8?B?a0c1ZTNFNWVSUzhVTE13aHlDR3hraGRWZlkvOWtLRmFmVlRnUVJsdnVnRHhM?=
 =?utf-8?B?dGU3SHdGcWhFUyszZitTTWRHeHRXQi9tNUlrSUVVZGcxa3lpOEFtZlN2a2Zq?=
 =?utf-8?B?VEsxeXA5V0RtZzBIcGZkSGtwNHl4cUkxd0JWdlFOZWxDaGNqMVNTL2pNL2F6?=
 =?utf-8?B?aTQyZUU2NUswY21KWUptQ1ZFRkF6ZE56YndvcmM1M2RrQkg5N2hsNmNxYjVl?=
 =?utf-8?B?OEZHY0NheWtKNnpTaDBYSFYxUmxhUnlnZTVRUmV5QWZwV2RUNVY4NWE1U3JU?=
 =?utf-8?B?YUYwVGdxcEZZRHhFQUFOd2VNbEs4QThCL3JjQTFLM1NPZ0lLcnlmeXp1OEd5?=
 =?utf-8?B?ZEF4R21KRkswRE1NYnFad2czR1doUWxZQ3FjejdtM2M2aXVUd2xGTEhsV0xi?=
 =?utf-8?B?THhiNUdLWUt5aXRIKzFnNjB1ZnFlL2toRll6c0poSU9PSVRjNXBhMjUvalc3?=
 =?utf-8?B?SmZmVkxXQzROWHdEbUtSMmpPc3QzY1VtTlVoMEl2NTlDM3NxcU9aZ0FzN1pz?=
 =?utf-8?B?MEp4QlRJaFRxd2NadS9UZDBwM0o3MUZFZlpKY0dlVFQwSXUxcGYzYTZuZXda?=
 =?utf-8?B?TSs0L2lHblJ4ajRlWElQT0pSeFR2VEgwMitCNC9tLzVtVVFBTGNOZCtEQTlN?=
 =?utf-8?B?aUJjam1hR0hhQWl0NXZ1eit3cjFzSnJHTms3ajdpTmMvendOQVpaYzlGMzM1?=
 =?utf-8?B?dEVhTXk4a2dWTk9MQlFUMmg0eEtnc0h2ZlFuNnRMSm14NFRkb2pzQXdTTkhy?=
 =?utf-8?B?OHkrRzdONDlrTWdMM2hienVFTnJIeG1GVlNYbHlCSTY0a2JySitLY3dmS0Rh?=
 =?utf-8?B?ME9SeVRZVUJIRkl6RStrYS9Hamt1dnlsV0ZHTEtuZ3V6Q3lDenE3SWtWc3Ba?=
 =?utf-8?B?WnpZdExqOFpmWDF3VU1uOGgwcjZ6K2xIcFFRWVlpR2xZc2pqNnlRZWhTVVNL?=
 =?utf-8?B?NlN5bEw1MjYwUHpTY1lPT2xzU3FVRW1BMm5HWUhCWktFVVVZWmplbVRaWmdZ?=
 =?utf-8?B?MFl0SnVyNzRXRWhNMGFvNkVRSnZCcmROODhPK1RjNHBESVI1eGNGTW5JMkJ1?=
 =?utf-8?B?dDVXK2lxQ0NkU2JtWGVMN2NTZlJwakJtamFDdnRObXJZdlRWcjZYODB1S2th?=
 =?utf-8?B?dEQxakwxenpCTjc2THptZFBrSzVxRTVUbSt6OE1OemM3d2Y0QVVTc3htY2U2?=
 =?utf-8?B?djdxeHQ5eHFrbldFMDZGQVZ4TENDMEtBLzhHa1JhYnYrMGVuT0h4clpyRExF?=
 =?utf-8?B?NVo3aXZvbkpHSHZPeFQ2TGk2bFd3VWhoOUc5alFYWnhEMExWcG1VRkIyQWU3?=
 =?utf-8?B?TkJkNFFwTTVRQ1Q1ZmNzSjFhSDQzYjVzNmNqTmNLOHdQOXQyVFppdFhvQWtZ?=
 =?utf-8?B?Snc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d9ac306-938a-4731-b34c-08dc5d2c3da5
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2024 09:12:57.6861 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YWDSJLkoeBdcUL3bWvjrp8esOI7eRBIejprKpImzn5Z91r0WvnNT8YI3wJXPbD62BrZOuBKgFJRUTOweNUJ+0RjZ1cilC4hIimCggEcTMwE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8719
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

--------------LjjMg38QTjTK5A7Ny8l6RNSL
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 15-04-2024 14:31, Michal Wajdeczko wrote:
>
> On 15.04.2024 06:49, Ghimiray, Himal Prasad wrote:
>> On 15-04-2024 00:31, Michal Wajdeczko wrote:
>>> VF's drivers can't modify GGTT PTEs except the range explicitly
>>> assigned by the PF driver. To allow hardware enforcement of this
>>> requirement, each GGTT PTE has a field with the VF number that
>>> identifies which VF can modify that particular GGTT PTE entry.
>>>
>>> Only PF driver can modify this field and PF driver shall do that
>>> before VF drivers will be loaded. Add function to prepare PTEs.
>>> Since it will be used only by the PF driver, make it available
>>> only for CONFIG_PCI_IOV=y.
>>>
>>> Bspec: 45015
>>> Signed-off-by: Michal Wajdeczko<michal.wajdeczko@intel.com>
>>> ---
>>>    drivers/gpu/drm/xe/regs/xe_gtt_defs.h |  2 ++
>>>    drivers/gpu/drm/xe/xe_ggtt.c          | 44 +++++++++++++++++++++++++++
>>>    drivers/gpu/drm/xe/xe_ggtt.h          |  4 +++
>>>    3 files changed, 50 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
>>> b/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
>>> index 558519ce48c7..4389e5a76f89 100644
>>> --- a/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
>>> +++ b/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
>>> @@ -9,6 +9,8 @@
>>>    #define XELPG_GGTT_PTE_PAT0    BIT_ULL(52)
>>>    #define XELPG_GGTT_PTE_PAT1    BIT_ULL(53)
>>>    +#define GGTT_PTE_VFID        GENMASK_ULL(11, 2)
>> Patch looks good to me.
>>
>> Just to confrim, based on BSPEC, this MASK applies to GRAPHICS_VER >=
>> 12.50. For versions before this, the applicable mask is (4, 2). I infer
>> that since SRIOV support on XE is expected beyond GRAPHICS_VER version
>> 12.50, you are using mask (11, 2).
> true, but even on earlier versions, which we may want to use as SDV,
> where real mask is (4, 2) this extended mask (11, 2) should be still
> harmless as number of VFs would be then always less than 7 so it will
> fit only into (4, 2)
Thanks for confirming.
>
>>> +
>>>    #define GUC_GGTT_TOP        0xFEE00000
>>>      #define XELPG_PPGTT_PTE_PAT3        BIT_ULL(62)
>>> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
>>> index ff2239c0eda5..f090cab065b8 100644
>>> --- a/drivers/gpu/drm/xe/xe_ggtt.c
>>> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
>>> @@ -460,6 +460,50 @@ void xe_ggtt_remove_bo(struct xe_ggtt *ggtt,
>>> struct xe_bo *bo)
>>>                    bo->flags & XE_BO_FLAG_GGTT_INVALIDATE);
>>>    }
>>>    +#ifdef CONFIG_PCI_IOV
>>> +static u64 xe_encode_vfid_pte(u16 vfid)
>>> +{
>>> +    return FIELD_PREP(GGTT_PTE_VFID, vfid) | XE_PAGE_PRESENT;
>>> +}
>>> +
>>> +static void xe_ggtt_assign_locked(struct xe_ggtt *ggtt, const struct
>>> drm_mm_node *node, u16 vfid)
>>> +{
>>> +    u64 start = node->start;
>>> +    u64 size = node->size;
>>> +    u64 end = start + size - 1;
>>> +    u64 pte = xe_encode_vfid_pte(vfid);
>>> +
>>> +    lockdep_assert_held(&ggtt->lock);
>>> +
>>> +    if (!drm_mm_node_allocated(node))
>>> +        return;
>>> +
>>> +    while (start < end) {
>>> +        xe_ggtt_set_pte(ggtt, start, pte);
>>> +        start += XE_PAGE_SIZE;
>>> +    }
>>> +
>>> +    xe_ggtt_invalidate(ggtt);
>>> +}
>>> +
>>> +/**
>>> + * xe_ggtt_assign - assign a GGTT region to the VF
>>> + * @ggtt: the &xe_ggtt where the node belongs
>>> + * @node: the &drm_mm_node to update
>>> + * @vfid: the VF identifier
>>> + *
>>> + * This function is used by the PF driver to assign a GGTT region to
>>> the VF.
>>> + * In addition to PTE's VFID bits 11:2 also PRESENT bit 0 is set as
>>> on some
>>> + * platforms VFs can't modify that either.
>> This info regarding bit 0 not being modifiable by VF's on some platforms
>> is missing in Bspec.
> Piotr reminded me of another page:
>
> Bspec: 52395

Thanks.

LGTM

Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com> 
<mailto:himal.prasad.ghimiray@intel.com>

>
>>> + */
>>> +void xe_ggtt_assign(struct xe_ggtt *ggtt, const struct drm_mm_node
>>> *node, u16 vfid)
>>> +{
>>> +    mutex_lock(&ggtt->lock);
>>> +    xe_ggtt_assign_locked(ggtt, node, vfid);
>>> +    mutex_unlock(&ggtt->lock);
>>> +}
>>> +#endif
>>> +
>>>    int xe_ggtt_dump(struct xe_ggtt *ggtt, struct drm_printer *p)
>>>    {
>>>        int err;
>>> diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
>>> index 8306ef74abc6..4a41a1762358 100644
>>> --- a/drivers/gpu/drm/xe/xe_ggtt.h
>>> +++ b/drivers/gpu/drm/xe/xe_ggtt.h
>>> @@ -33,4 +33,8 @@ void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct
>>> xe_bo *bo);
>>>      int xe_ggtt_dump(struct xe_ggtt *ggtt, struct drm_printer *p);
>>>    +#ifdef CONFIG_PCI_IOV
>>> +void xe_ggtt_assign(struct xe_ggtt *ggtt, const struct drm_mm_node
>>> *node, u16 vfid);
>>> +#endif
>>> +
>>>    #endif
--------------LjjMg38QTjTK5A7Ny8l6RNSL
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 15-04-2024 14:31, Michal Wajdeczko
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:a49558af-c6d5-42c4-b942-68fda8bec3b5@intel.com">
      <pre class="moz-quote-pre" wrap="">

On 15.04.2024 06:49, Ghimiray, Himal Prasad wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
On 15-04-2024 00:31, Michal Wajdeczko wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">VF's drivers can't modify GGTT PTEs except the range explicitly
assigned by the PF driver. To allow hardware enforcement of this
requirement, each GGTT PTE has a field with the VF number that
identifies which VF can modify that particular GGTT PTE entry.

Only PF driver can modify this field and PF driver shall do that
before VF drivers will be loaded. Add function to prepare PTEs.
Since it will be used only by the PF driver, make it available
only for CONFIG_PCI_IOV=y.

Bspec: 45015
Signed-off-by: Michal Wajdeczko<a class="moz-txt-link-rfc2396E" href="mailto:michal.wajdeczko@intel.com">&lt;michal.wajdeczko@intel.com&gt;</a>
---
&nbsp; drivers/gpu/drm/xe/regs/xe_gtt_defs.h |&nbsp; 2 ++
&nbsp; drivers/gpu/drm/xe/xe_ggtt.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 44 +++++++++++++++++++++++++++
&nbsp; drivers/gpu/drm/xe/xe_ggtt.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 4 +++
&nbsp; 3 files changed, 50 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
b/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
index 558519ce48c7..4389e5a76f89 100644
--- a/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
@@ -9,6 +9,8 @@
&nbsp; #define XELPG_GGTT_PTE_PAT0&nbsp;&nbsp;&nbsp; BIT_ULL(52)
&nbsp; #define XELPG_GGTT_PTE_PAT1&nbsp;&nbsp;&nbsp; BIT_ULL(53)
&nbsp; +#define GGTT_PTE_VFID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GENMASK_ULL(11, 2)
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Patch looks good to me.

Just to confrim, based on BSPEC, this MASK applies to GRAPHICS_VER &gt;=
12.50. For versions before this, the applicable mask is (4, 2). I infer
that since SRIOV support on XE is expected beyond GRAPHICS_VER version
12.50, you are using mask (11, 2).
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
true, but even on earlier versions, which we may want to use as SDV,
where real mask is (4, 2) this extended mask (11, 2) should be still
harmless as number of VFs would be then always less than 7 so it will
fit only into (4, 2)</pre>
    </blockquote>
    Thanks for confirming. <br>
    <blockquote type="cite" cite="mid:a49558af-c6d5-42c4-b942-68fda8bec3b5@intel.com">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">+
&nbsp; #define GUC_GGTT_TOP&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0xFEE00000
&nbsp; &nbsp; #define XELPG_PPGTT_PTE_PAT3&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; BIT_ULL(62)
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index ff2239c0eda5..f090cab065b8 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -460,6 +460,50 @@ void xe_ggtt_remove_bo(struct xe_ggtt *ggtt,
struct xe_bo *bo)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bo-&gt;flags &amp; XE_BO_FLAG_GGTT_INVALIDATE);
&nbsp; }
&nbsp; +#ifdef CONFIG_PCI_IOV
+static u64 xe_encode_vfid_pte(u16 vfid)
+{
+&nbsp;&nbsp;&nbsp; return FIELD_PREP(GGTT_PTE_VFID, vfid) | XE_PAGE_PRESENT;
+}
+
+static void xe_ggtt_assign_locked(struct xe_ggtt *ggtt, const struct
drm_mm_node *node, u16 vfid)
+{
+&nbsp;&nbsp;&nbsp; u64 start = node-&gt;start;
+&nbsp;&nbsp;&nbsp; u64 size = node-&gt;size;
+&nbsp;&nbsp;&nbsp; u64 end = start + size - 1;
+&nbsp;&nbsp;&nbsp; u64 pte = xe_encode_vfid_pte(vfid);
+
+&nbsp;&nbsp;&nbsp; lockdep_assert_held(&amp;ggtt-&gt;lock);
+
+&nbsp;&nbsp;&nbsp; if (!drm_mm_node_allocated(node))
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return;
+
+&nbsp;&nbsp;&nbsp; while (start &lt; end) {
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_ggtt_set_pte(ggtt, start, pte);
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; start += XE_PAGE_SIZE;
+&nbsp;&nbsp;&nbsp; }
+
+&nbsp;&nbsp;&nbsp; xe_ggtt_invalidate(ggtt);
+}
+
+/**
+ * xe_ggtt_assign - assign a GGTT region to the VF
+ * @ggtt: the &amp;xe_ggtt where the node belongs
+ * @node: the &amp;drm_mm_node to update
+ * @vfid: the VF identifier
+ *
+ * This function is used by the PF driver to assign a GGTT region to
the VF.
+ * In addition to PTE's VFID bits 11:2 also PRESENT bit 0 is set as
on some
+ * platforms VFs can't modify that either.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
This info regarding bit 0 not being modifiable by VF's on some platforms
is missing in Bspec.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Piotr reminded me of another page:

Bspec: 52395</pre>
    </blockquote>
    <p>Thanks.</p>
    <p>LGTM</p>
    <p><!--[if gte mso 9]><xml>
 <o:OfficeDocumentSettings>
  <o:AllowPNG/>
 </o:OfficeDocumentSettings>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <w:WordDocument>
  <w:View>Normal</w:View>
  <w:Zoom>0</w:Zoom>
  <w:TrackMoves/>
  <w:TrackFormatting/>
  <w:PunctuationKerning/>
  <w:ValidateAgainstSchemas/>
  <w:SaveIfXMLInvalid>false</w:SaveIfXMLInvalid>
  <w:IgnoreMixedContent>false</w:IgnoreMixedContent>
  <w:AlwaysShowPlaceholderText>false</w:AlwaysShowPlaceholderText>
  <w:DoNotPromoteQF/>
  <w:LidThemeOther>EN-US</w:LidThemeOther>
  <w:LidThemeAsian>X-NONE</w:LidThemeAsian>
  <w:LidThemeComplexScript>X-NONE</w:LidThemeComplexScript>
  <w:Compatibility>
   <w:BreakWrappedTables/>
   <w:SnapToGridInCell/>
   <w:WrapTextWithPunct/>
   <w:UseAsianBreakRules/>
   <w:DontGrowAutofit/>
   <w:SplitPgBreakAndParaMark/>
   <w:EnableOpenTypeKerning/>
   <w:DontFlipMirrorIndents/>
   <w:OverrideTableStyleHps/>
  </w:Compatibility>
  <m:mathPr>
   <m:mathFont m:val="Cambria Math"/>
   <m:brkBin m:val="before"/>
   <m:brkBinSub m:val="&#45;-"/>
   <m:smallFrac m:val="off"/>
   <m:dispDef/>
   <m:lMargin m:val="0"/>
   <m:rMargin m:val="0"/>
   <m:defJc m:val="centerGroup"/>
   <m:wrapIndent m:val="1440"/>
   <m:intLim m:val="subSup"/>
   <m:naryLim m:val="undOvr"/>
  </m:mathPr></w:WordDocument>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <w:LatentStyles DefLockedState="false" DefUnhideWhenUsed="false"
  DefSemiHidden="false" DefQFormat="false" DefPriority="99"
  LatentStyleCount="376">
  <w:LsdException Locked="false" Priority="0" QFormat="true" Name="Normal"/>
  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 1"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 2"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 3"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 4"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 5"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 6"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 7"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 8"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 9"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 7"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 8"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 9"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 1"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 2"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 3"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 4"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 5"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 6"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 7"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 8"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 9"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Normal Indent"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="footnote text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="annotation text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="header"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="footer"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index heading"/>
  <w:LsdException Locked="false" Priority="35" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="caption"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="table of figures"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="envelope address"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="envelope return"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="footnote reference"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="annotation reference"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="line number"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="page number"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="endnote reference"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="endnote text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="table of authorities"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="macro"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="toa heading"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 5"/>
  <w:LsdException Locked="false" Priority="10" QFormat="true" Name="Title"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Closing"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Signature"/>
  <w:LsdException Locked="false" Priority="1" SemiHidden="true"
   UnhideWhenUsed="true" Name="Default Paragraph Font"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text Indent"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Message Header"/>
  <w:LsdException Locked="false" Priority="11" QFormat="true" Name="Subtitle"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Salutation"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Date"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text First Indent"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text First Indent 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Note Heading"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text Indent 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text Indent 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Block Text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Hyperlink"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="FollowedHyperlink"/>
  <w:LsdException Locked="false" Priority="22" QFormat="true" Name="Strong"/>
  <w:LsdException Locked="false" Priority="20" QFormat="true" Name="Emphasis"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Document Map"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Plain Text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="E-mail Signature"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Top of Form"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Bottom of Form"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Normal (Web)"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Acronym"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Address"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Cite"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Code"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Definition"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Keyboard"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Preformatted"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Sample"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Typewriter"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Variable"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Normal Table"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="annotation subject"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="No List"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Outline List 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Outline List 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Outline List 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Simple 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Simple 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Simple 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Colorful 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Colorful 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Colorful 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 7"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 8"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 7"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 8"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table 3D effects 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table 3D effects 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table 3D effects 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Contemporary"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Elegant"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Professional"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Subtle 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Subtle 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Web 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Web 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Web 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Balloon Text"/>
  <w:LsdException Locked="false" Priority="39" Name="Table Grid"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Theme"/>
  <w:LsdException Locked="false" SemiHidden="true" Name="Placeholder Text"/>
  <w:LsdException Locked="false" Priority="1" QFormat="true" Name="No Spacing"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 1"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 1"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 1"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 1"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 1"/>
  <w:LsdException Locked="false" SemiHidden="true" Name="Revision"/>
  <w:LsdException Locked="false" Priority="34" QFormat="true"
   Name="List Paragraph"/>
  <w:LsdException Locked="false" Priority="29" QFormat="true" Name="Quote"/>
  <w:LsdException Locked="false" Priority="30" QFormat="true"
   Name="Intense Quote"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 1"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 1"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 1"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 1"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 1"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 1"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 2"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 2"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 2"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 2"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 2"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 2"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 2"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 2"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 2"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 2"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 2"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 3"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 3"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 3"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 3"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 3"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 3"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 3"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 3"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 3"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 3"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 3"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 4"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 4"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 4"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 4"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 4"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 4"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 4"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 4"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 4"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 4"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 4"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 5"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 5"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 5"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 5"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 5"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 5"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 5"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 5"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 5"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 5"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 5"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 6"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 6"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 6"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 6"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 6"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 6"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 6"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 6"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 6"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 6"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 6"/>
  <w:LsdException Locked="false" Priority="19" QFormat="true"
   Name="Subtle Emphasis"/>
  <w:LsdException Locked="false" Priority="21" QFormat="true"
   Name="Intense Emphasis"/>
  <w:LsdException Locked="false" Priority="31" QFormat="true"
   Name="Subtle Reference"/>
  <w:LsdException Locked="false" Priority="32" QFormat="true"
   Name="Intense Reference"/>
  <w:LsdException Locked="false" Priority="33" QFormat="true" Name="Book Title"/>
  <w:LsdException Locked="false" Priority="37" SemiHidden="true"
   UnhideWhenUsed="true" Name="Bibliography"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="TOC Heading"/>
  <w:LsdException Locked="false" Priority="41" Name="Plain Table 1"/>
  <w:LsdException Locked="false" Priority="42" Name="Plain Table 2"/>
  <w:LsdException Locked="false" Priority="43" Name="Plain Table 3"/>
  <w:LsdException Locked="false" Priority="44" Name="Plain Table 4"/>
  <w:LsdException Locked="false" Priority="45" Name="Plain Table 5"/>
  <w:LsdException Locked="false" Priority="40" Name="Grid Table Light"/>
  <w:LsdException Locked="false" Priority="46" Name="Grid Table 1 Light"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark"/>
  <w:LsdException Locked="false" Priority="51" Name="Grid Table 6 Colorful"/>
  <w:LsdException Locked="false" Priority="52" Name="Grid Table 7 Colorful"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 1"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 1"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 1"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 1"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 2"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 2"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 2"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 2"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 3"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 3"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 3"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 3"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 4"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 4"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 4"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 4"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 5"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 5"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 5"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 5"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 6"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 6"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 6"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 6"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 6"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 6"/>
  <w:LsdException Locked="false" Priority="46" Name="List Table 1 Light"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark"/>
  <w:LsdException Locked="false" Priority="51" Name="List Table 6 Colorful"/>
  <w:LsdException Locked="false" Priority="52" Name="List Table 7 Colorful"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 1"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 1"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 1"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 1"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 2"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 2"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 2"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 2"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 3"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 3"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 3"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 3"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 4"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 4"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 4"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 4"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 5"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 5"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 5"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 5"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 6"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 6"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 6"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 6"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 6"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Mention"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Smart Hyperlink"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Hashtag"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Unresolved Mention"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Smart Link"/>
 </w:LatentStyles>
</xml><![endif]--><!--[if gte mso 10]>
<style>
 /* Style Definitions */
 table.MsoNormalTable
	{mso-style-name:"Table Normal";
	mso-tstyle-rowband-size:0;
	mso-tstyle-colband-size:0;
	mso-style-noshow:yes;
	mso-style-priority:99;
	mso-style-parent:"";
	mso-padding-alt:0cm 5.4pt 0cm 5.4pt;
	mso-para-margin:0cm;
	mso-pagination:widow-orphan;
	font-size:10.0pt;
	font-family:"Times New Roman",serif;}
</style>
<![endif]-->
    </p>
    <p>Reviewed-by: Himal Prasad Ghimiray <a href="mailto:himal.prasad.ghimiray@intel.com">&lt;himal.prasad.ghimiray@intel.com&gt;</a></p>
    <blockquote type="cite" cite="mid:a49558af-c6d5-42c4-b942-68fda8bec3b5@intel.com">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">+ */
+void xe_ggtt_assign(struct xe_ggtt *ggtt, const struct drm_mm_node
*node, u16 vfid)
+{
+&nbsp;&nbsp;&nbsp; mutex_lock(&amp;ggtt-&gt;lock);
+&nbsp;&nbsp;&nbsp; xe_ggtt_assign_locked(ggtt, node, vfid);
+&nbsp;&nbsp;&nbsp; mutex_unlock(&amp;ggtt-&gt;lock);
+}
+#endif
+
&nbsp; int xe_ggtt_dump(struct xe_ggtt *ggtt, struct drm_printer *p)
&nbsp; {
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int err;
diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
index 8306ef74abc6..4a41a1762358 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.h
+++ b/drivers/gpu/drm/xe/xe_ggtt.h
@@ -33,4 +33,8 @@ void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct
xe_bo *bo);
&nbsp; &nbsp; int xe_ggtt_dump(struct xe_ggtt *ggtt, struct drm_printer *p);
&nbsp; +#ifdef CONFIG_PCI_IOV
+void xe_ggtt_assign(struct xe_ggtt *ggtt, const struct drm_mm_node
*node, u16 vfid);
+#endif
+
&nbsp; #endif
</pre>
        </blockquote>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------LjjMg38QTjTK5A7Ny8l6RNSL--
