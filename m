Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE5E4FCD0C4
	for <intel-xe@archiver.kernel.org>; Wed, 18 Mar 2026 13:02:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0CD610E21A;
	Wed, 18 Mar 2026 13:02:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K6uKL5WQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFB6710E21A
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Mar 2026 13:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773838955; x=1805374955;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=OTOKo2kaFyBL9x6ZWYgU11ZHqBOzSUlGpqh2PvUof7U=;
 b=K6uKL5WQ27ZSNIXDolVKbwIUpBJoTlL+xi+T3256/vouZNg4GmEXkCqk
 mBAHTl0qMyictZ7uQY3usQh3qC9LchkVSYdm5cDRPPpkAyJFVFeYQmRiq
 +TR7/7MEuqg0xISyi73tAY3EiCzTBPLL8faME+lfpoZnHAYZDnzprNfJw
 tpRntsWCauxntLEEDQDxj4AmFTXVgvFiTA9D3yfCQYKzV0SRqNa8GuQnW
 +ECbLCcpOzaQ2EEOJqfvG3w9IAa13CuPOnPHRYigHJwXzRatbW1nGtaiW
 mrwlSmgXHm4dPEkfTZDPBz+dTsLzG7OcOIK0MD3JX0XZ2alKkAL8JygTW g==;
X-CSE-ConnectionGUID: tZ7BbW9oQSiH3AihL4Kvbg==
X-CSE-MsgGUID: hTLiGOr3S8OYaUsmsLhk/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="74920706"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="74920706"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 06:02:34 -0700
X-CSE-ConnectionGUID: s/FGlbGySL2xMFxvtJuctw==
X-CSE-MsgGUID: TNtOPkYBSvC6vooxgSuHmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="218196078"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 06:02:33 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 18 Mar 2026 06:02:31 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 18 Mar 2026 06:02:31 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.3) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 18 Mar 2026 06:02:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fkREJ3sJVSH/0cF4+UreZyW7yPrAXxBnVbXHBj9wmwN9VDh8soITUs4JZdutCRJpILCqIbnFO/46xH6MIm0SvIHOJxpPSfJvr4grwIfFf9R1Vhcpk/FzOwBq2L+yBaEzOyroy0tL/hUlbQPOPZEPNUqlsftE8eXsKubHsOW8hDUfS8+rk86ymLy2TXFiFRTbrtgDRX8N16RvNbDH+CJz5W37lajuqI3bfm5tDgTqH+mU63gYsASd73hP9SuQlxLLBD5WjeXlNNvN1OIDl4irLBEiWHhDUH381/gBYtMqEVxdTrV4Xnt1ei62nb1wIx0XRAhq0WQeYm7NSf18VgIf4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zRUaH6UHLwfumzRyoHLAaExPIe71m0niR1kczo+m54g=;
 b=MqabO3fv0YniwkkoPmMsDFfo/O0La0ebYfGSREaazaeHKL/PIobI6VDB9OtqLShZRC0LuGH6kwoyBgBYCH40wpnyVP26RQaTLpgxCoFUQw0B8yLHmtpdv7/1CWnAuL5wNLkEnQ0Bt7HnqIHbNF4ZM/WNVXR2Aj5PIk3AYzgJfNr44Sr9QoBZ7Qe8+LbacMfS1tGBkQ4T09h7nACp4qrg/S1zsotRkRV0Y57iP1Y4v+69GEbaF1A2Nl7YJvFgUX018HEwOaexXeihBbtKGKtY5h3Jpk+rsSEJxx1W/paZb4LbnLS8nNDtEqop1pn9z1a6c4r2RC5LbZnIsA//bho7Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5706.namprd11.prod.outlook.com (2603:10b6:610:ed::6)
 by PH0PR11MB5832.namprd11.prod.outlook.com (2603:10b6:510:141::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.14; Wed, 18 Mar
 2026 13:02:20 +0000
Received: from CH0PR11MB5706.namprd11.prod.outlook.com
 ([fe80::30ac:8e5:b7c6:524f]) by CH0PR11MB5706.namprd11.prod.outlook.com
 ([fe80::30ac:8e5:b7c6:524f%4]) with mapi id 15.20.9723.018; Wed, 18 Mar 2026
 13:02:19 +0000
Message-ID: <43760883-6bb8-470d-b739-d6c650fd7898@intel.com>
Date: Wed, 18 Mar 2026 18:32:11 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 09/12] drm/xe/dma_buf: Block export of DONTNEED/purged
 BOs
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <matthew.brost@intel.com>, <himal.prasad.ghimiray@intel.com>,
 <pallavi.mishra@intel.com>
References: <20260303152015.3499248-1-arvind.yadav@intel.com>
 <20260303152015.3499248-10-arvind.yadav@intel.com>
 <dd1098ed4987ded7c49eb31de5a8dc3e70786124.camel@linux.intel.com>
Content-Language: en-US
From: "Yadav, Arvind" <arvind.yadav@intel.com>
In-Reply-To: <dd1098ed4987ded7c49eb31de5a8dc3e70786124.camel@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0056.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::12) To BN0PR11MB5709.namprd11.prod.outlook.com
 (2603:10b6:408:148::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5706:EE_|PH0PR11MB5832:EE_
X-MS-Office365-Filtering-Correlation-Id: 2900a00b-e37b-4f0a-024d-08de84ee9602
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|56012099003|22082099003|18002099003|7053199007;
X-Microsoft-Antispam-Message-Info: H5xlMzq0O1b09vayQ8+6zRPeRQxUnA6Ozobl1gjtuXzE9m2qA1d+L4xmNJku5mU6QLx7i44GTEzdOeTxS8iZezHt/2XFx4ZRqa7XGeih/eYN9RsHdGbMz9TCVLIv6/+Eqw6ObDbFFlTssljLbf91mP0+cePrk8K9Njk0yCrznPAxvA6La7Y+4PRFJYvr2q+rcCuAADz0dBARlWXiSWPgAaYc9MTzUSWTQ+EOU1WVoflfMW+39CnXh1LSVUNuIHcOmsxI1kO+uCORJmGJllP/dNyGkhxM87EA+RnQpDz25VtA91VCHasUnSbgxJSYg4/aH+01KEtBkuCh8DKtKvOENPXnLsenFdVkAIw9uUMWZ3J8HWn92A4RmE0s8oI0vk7eGyPEAAlaflMIqjw2uJEms7gf6Ou5G5rHDSjwaPdOmk8xkonD+qhwsWvW9jOYlM3wwmDLya7WS2k1/XSZ1zNSiwcTuxIZqGzoMmb3TQI+fVcv6MQJBmw0tXU99MJ765eIxmL19LHHydkitva8gFLFavu285PuQUGZK0c71wurzr+tMAD2LRL/RxJxYqR1vRe41td5dtDk0dw1ZiIZ4Ji1Kvt37XnWeBuhiyNI81E+BqL9SztsmMxtd8zbl+lkbSfEWXSmexcB0VCLADzZ7TGJ9ZSSrvRHFHWkoe07jVsWd2GljyQySVfU7crtYbB79YuWh24dc36ORtCTx2T4FMfzYewANnA4sxy/ZL8oCGqz3yA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5706.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(22082099003)(18002099003)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cHI2ZzVTZkttQW94MWdhWHVtU1dWQ3JnYmk2ZjMxTmdacDVYdnlYa3pTblFp?=
 =?utf-8?B?c2Fvc2pRYzVFekJRN2RuZWdScWFjeEE3Y3JFVFJFamE1bjBPRDMxR1YzTlAy?=
 =?utf-8?B?clpMemFvZW5hSS9PeUk5N2dnRHRXRTZqNjFFQnJPaHg1RXphYVNNSjhyY3Zm?=
 =?utf-8?B?RkcyaC9NWnF1RUVoczJyV255WGFDdnZ1ZlBOMVlObWRtYkRKRG5XVC9lVkI5?=
 =?utf-8?B?QnpNMkpDZzBsemhob3RTZ1JvU0dEdHg5SWlQTHlrQTZwdStJbmhZeURjazhC?=
 =?utf-8?B?WmlUcmdZNVBibnRleFZncDNDQUtLZEs1OFc1ZERuMGY3eTd0QlJGS2hYRzlB?=
 =?utf-8?B?RzRQSDhxekg1OGc4QjUxUU9rWlFISzY5bERQTHhXQmdRNXVXZnV4Yk1RajFQ?=
 =?utf-8?B?OG5nUDhIWHZraldIeDRKZ0p6dnM2SURUOHVlMUZSV3IwMEZON042SGthb3NC?=
 =?utf-8?B?eXE3SW5iZmhja3BEUmhSdDA3RStBWktLNHM1akxWNEFJS01Hc0crMnlpZFZZ?=
 =?utf-8?B?YzFidU5yWVpwbk5HYVRsdWJEU3hUVC9HOURiV0psRzRZSjJVNU5lU250QnNq?=
 =?utf-8?B?NXR4d2R3aEE2NDBCSVVITHRSZ2NsaTBIc1JrYUZtU2N4bXJTa1hQN1JwVy9E?=
 =?utf-8?B?aXJiNnlld1hUQ3diNVhWL2RMOVdjR2plMEVTdkhYbjA4UnVEdS9ScGRpV0dN?=
 =?utf-8?B?MytrVWFmdjVLSDR5VXZ6YzZ1UW1NWU4rNTRtT1VPK0pXTm4wUytIWVhveUc0?=
 =?utf-8?B?dWFrSXlkQVh4ZVdGeFQzQ2xtVkJ6TnJhR25uOVg2THBncVZ6ZWFhRHRlYVQ4?=
 =?utf-8?B?WEJjWmdHQWtxRzNzNHRheFp2R2psLzArNzRBb3o4TXpGUytIQUtxeWZWNGcz?=
 =?utf-8?B?K2NLSHZTdlRLL0czeWEvTWNiajJMbWZvNm1LUGM3L2pwTzhzeGZkQW9tTWx5?=
 =?utf-8?B?U01nTmUxSFZwazJIalhWSk1nUmY3QnZXRDZtNUIrZThHVVRhZ1N2cnZEaFk4?=
 =?utf-8?B?Q2MyOGZXZk0rQnZTQTlIYldiT2NTc3RBR01QYWVCQlpLV3drQmtqeStuSzY3?=
 =?utf-8?B?cmlCMm84SS9VeTFEL3pBYVZOZUJicEVYRWJWNnVDSTdNbXV1WS8yYkFQY0tv?=
 =?utf-8?B?Ym1yeTJ5bnM3RDNaYkJ4MFd5S0tJZm9UL1laNy9OU25FTFVnNzFiNCs0WVRS?=
 =?utf-8?B?SkNWWWxHNU5YdlpHbXJaa0pmbjl5RDIxSlhXcitBbVM2QVR4OEJSdGhCd0pL?=
 =?utf-8?B?ZXVGcFhtLzMzYm43NEN5SkZCNUlrQ2xrd3k2U1VYYmpMSjRQZVVzeXZLL3Zu?=
 =?utf-8?B?YW12elZWMUE1c0w5VUJUU1hqU3NFb0VuVFBJK2krVmZKaEV3NzFxSWVIR1Rx?=
 =?utf-8?B?UGpCdnlaelQ0T0U5Y0tLbU5Sd202TXlHTmdiZTNmd3JqQTZKazc0blRBejl0?=
 =?utf-8?B?YlFiVVlCbVpuYlJ3TXlYRm1XbGdmUjQ3WEV0SE91MlRSRm1PN053a2dpWWZL?=
 =?utf-8?B?K2tmV0M5ZnNnVFdFNUVUUjRTa0ZramZ6eEl5YlU2N1FYeHMzZ201WE1lc0tH?=
 =?utf-8?B?K0RIRUI3dEZMYjJHTzk4L2xhOE00Nm14Y0ZwRi9ZUFBzRHRFY09yZTlvWjdw?=
 =?utf-8?B?Tm1nWTgvbFVuSWl2ZGw1TC9CZjg2RFZKaUtiRnRBc0FIWG43eDNsNENxRHpy?=
 =?utf-8?B?bndIM2U4WHVwZjBsd1lzM0EzeDl0Rnc4UkhpLzZMZUc3OCtabEJsWWdzMjZq?=
 =?utf-8?B?TU1seEpJRzIyd3U2WnpsNTU4TXhlMzZaZUMwQko0eEFmWjA2M1ZlYkhRZlpN?=
 =?utf-8?B?bDZ0L3NuMXUzamMzQVovUUdSLytjUFBCZ2JlQVVHWURWK256TUdUdkhBcVNi?=
 =?utf-8?B?UGR5QTRPa1hKb2x5cUd5ZUJBVVJqL01ZZXVhUkpqZ0pxV1ZEZktielNLT2dF?=
 =?utf-8?B?QVdYNmphQXpNVURVSTR5SytKRVAxbjBCL25EWUNWb1JSRDBkVk1xc3BJdC9E?=
 =?utf-8?B?Y2l0VHUvRElkK1BETGJxL1IzNGtydk16ZjU0UkFVMTFOeld3ZUc0aFZORHFM?=
 =?utf-8?B?YzM4dFZVUCtWV0NTcGF1ZDVOL0szcnJSaThIci9xKzF2V1RseEV1YlZ3Q2hD?=
 =?utf-8?B?ZURtRHVFSkU0ZnZmaFBpeldyVVRERTUrSmtPZGZ4Lys5ZWplZHFlWEFVM2hR?=
 =?utf-8?B?RXR5cS9TaTZSN0lJTUFUNUF1d2lrdWwzcHE3TnZzSnY0NnhXcUdVRXFqY2Zt?=
 =?utf-8?B?MTJvdHMwdGtYOEZubGE3NzNEemhLYW42K1p2OS9pNnIzTG5oM29JY0lpVFJo?=
 =?utf-8?B?TS9kNTNZNk9Ka0dwTFpBSC9RVHFMSm9FdHhNSHlQRWJUZHlCeHAxZz09?=
X-Exchange-RoutingPolicyChecked: EiMF95c0ixHbwplUbQB5jVHyKmFk0I47B68SLfeiBsdQtFiEqiRSYw0klYgeQ5IojaCbZJT5gPzg4ESaCEP9YWdS0MvRPQJjhIxHL+k/z2HeqUfxA+li+oGB/UEQiepVeDtjXsEVjWoKmROckvmNw/KxjV+jyK/gB/cFM1TNSPFjUYKoKpfojlqtTFbf+NWU8+vlCA4GpTfkXfn6AodrVNTKa6juEaGrL3TH4LtmPlHJ7OZdqnC2u0v71C9Xyc+aAVdaW5G7QiRVJxODRkRzpszzGW5gHuRNap99X5V4Jb5X2zm9lQ1npU3YkNNYKdzgDizkrouf5F9O8vFw/yUWzQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2900a00b-e37b-4f0a-024d-08de84ee9602
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5709.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 13:02:19.7165 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yh8MGN1WcXDq03j1VfofxedBitLwk3q2WTXFa8/hjmN5bSUq0TXbMRNVdVkthQgLMuJ2BkWqRkov+mo+TBiYUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5832
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


On 10-03-2026 15:49, Thomas Hellström wrote:
> On Tue, 2026-03-03 at 20:50 +0530, Arvind Yadav wrote:
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
>> index ea370cd373e9..aba6b9696030 100644
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
>> +	xe_bo_lock(bo, false);
> Interruptible lock.


Noted,

~Arvind

>
> /Thomas
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
