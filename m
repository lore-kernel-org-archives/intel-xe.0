Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 228F3C79F89
	for <intel-xe@archiver.kernel.org>; Mon,  7 Sep 2026 08:40:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBE4510E6E0;
	Mon,  7 Sep 2026 08:40:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NE0nbZoW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8F3E10E6E8
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Sep 2026 08:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788770413; x=1820306413;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8EoSo/f2mYzNuoO+xERqcH+A3dNHQSvE97icfRWDKa4=;
 b=NE0nbZoWywtpkvcwn9CZsOwVsf2QWwWZl233NoXIgBpK9M9vl+NFvRt1
 5E/dsgDoiF/SxMNlgXtfqrAG/4xmHBLqipduoHKIKuRXRWcst1NjZ0wME
 oRoe0qTFi81AswXFo4+48vjDfPGFto9sgyi4WvoCJzZfgw4hpx4SCfESk
 DtjiRW2Br1PRms831Nxdshk81poFQsYliwRS3FNhDQreebCMwK/dN5PR7
 TKhqgbMGNmc7J+BtMyoLtspQHpaxTWuGlvoMg6GoUQN8PL5ghxZDYAfHC
 O/MFQM+a2e6aXmOHApB3ia5D8jOtzpJM6+LIBSPlZOQm0PE2VYDz79gfI Q==;
X-CSE-ConnectionGUID: 8Fr3Rd5OTDG97O7yaCW+FA==
X-CSE-MsgGUID: jZljzF9ATdeTuCWXnSXM7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="76726489"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="76726489"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 01:40:12 -0700
X-CSE-ConnectionGUID: ynDiuUNXSAexXXC1o4RmZg==
X-CSE-MsgGUID: mGNUs/D1SH2DWHj/xLLOxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="266961049"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 01:40:12 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 01:40:12 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 7 Sep 2026 01:40:12 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.14)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 01:40:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CkioNYcCl5AAQcoh6VFosipZepMDw2kbY0op6Ygl4HzuV294FhZmK4bHf7lX9B2HzFpDcBaH5CwT2Yd3FbAs4g6id8Tw+olLKq29qeC2XINOTnR5O/BwmdIVoecP3wGlkt/jwoqUifKlgV4nC0Xm+FB6o5t/lgJ64RVAjZ6sMurmcMISF+8X5qO4nTaY9A5DrhHmazIbhlT3FmvmozIpoRazeCLc2j4AW65u38lByCmvdHk+vb0Ge4lVGdzcas9yifcpdLXut8SiJV58ML1s4Kct971ra+7wDSOmAW5MOEanpQNKoxIa6F/SxFL3x8THoZ8SgzKQYXjBpzzaKgNR8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=izvc83H5rmvMGYzzumZuqMS6jEyY5Xn8E+SppgJzAx0=;
 b=hl+FBbjWuE802V607jEla8QtlZNK2sa+lKBi+dYxtVHJp5zfSeB0hjqxpIk+iL3MjK0vIg47bvm7bfva7j/y3ir+gz4hfzXXSgDoRXp/tymA1gYnVFTK0+JWxIUv7PJzS6/+8IYJT/QxrsdZBsJ4YcJCk6MV1SqswdFN/tp1UqNMVKnYSHLcrq03N+jRAkyuqRMDAIss5elDoB26g5MMf99rqWn6P9jOHPB8UaqnVSMOyWNX/NVd/elFQ7AgcAbKYf4tyrnyJs6HECX1dwn6N/36enXTIElAc3/vaBQjkDvtayfBQR9WhHckjrbYus1+Yp/XP+YrZN2r9f9Q4R3T9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB6195.namprd11.prod.outlook.com (2603:10b6:208:3e9::8)
 by DS6PR11MB361022.namprd11.prod.outlook.com (2603:10b6:8:465::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Mon, 7 Sep
 2026 08:40:04 +0000
Received: from IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391]) by IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391%5]) with mapi id 15.21.0382.014; Mon, 7 Sep 2026
 08:40:04 +0000
Message-ID: <e58f9ca6-4efa-4bd5-b033-b9dd2661d3b5@intel.com>
Date: Mon, 7 Sep 2026 10:40:00 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] drm/xe/debugfs: Consolidate wedged_mode debt into
 xe_wedge
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <riana.tauro@intel.com>,
 <michal.wajdeczko@intel.com>, <matthew.d.roper@intel.com>,
 <matthew.brost@intel.com>, <rodrigo.vivi@intel.com>
References: <20260831042633.1760474-1-raag.jadav@intel.com>
 <20260831042633.1760474-5-raag.jadav@intel.com>
 <87ca1466-be15-4417-9ff2-16715365fedf@intel.com>
 <ap5tZj9I6hNtPlYd@black.igk.intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <ap5tZj9I6hNtPlYd@black.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR05CA0358.eurprd05.prod.outlook.com
 (2603:10a6:20b:490::25) To IA1PR11MB6195.namprd11.prod.outlook.com
 (2603:10b6:208:3e9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB6195:EE_|DS6PR11MB361022:EE_
X-MS-Office365-Filtering-Correlation-Id: 3497b033-7ed0-409d-f2c7-08df0cbb9ce7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|10067099003|4143699003|11063799006|56012099006|18002099003|22082099003|18092099006;
X-Microsoft-Antispam-Message-Info: 7uG4ix+4tRPONLKgbQjRiMXoSNtaGoouks3zNAl7uAgkjV9q7uWJs5w9/unxcNGY4jB64jxK3vaW7KNWaGX0vw7CciGGcRNmRHCGt6YIjGVKTBDC0trD+RNTiDhX7ptu55B5Ov3JYsOqW+kj2Ava984+fFub3j6mB0KaXRqGfl1HfKZbecj6e0j8b9oxZWSAwo46uParbfwmusTpbQKpthoT2FhNMERRInfre5ALhqHOk0v7s1/z4rH3BbkjRpi0ieHFhp+XSaT6Xs2URBbm602gKOUV/+E5+wrlPc9E5OdGtpE0Rw6Tki/+2UNtvxmYy9HqKvWtRLO+S7jfp+tjytNDjBhSqWZC75XjjLf6jSfPp/l96iyq52wx4nv3UA/0Aym0r94mcpZTnNmvZKs/aLsHdr2HMoitPszOTryBOUMTowwt+EgT3a5zI11nuI0V1Em/TH4e0c+ZoJ9yU0LruhyLvMPk/+XDU2uooxeii+JgbpMsOZTOuoywdqIgC2beOhDctev7Yr9GCdKqntRfgXCgEnfsy8wv2B2qLvHndEFBvga/h9LH0TsZnwVz27RbgzO66VVICN8/kLU7HNOROvYYR5WhNqxfdxhos0O7VpcOIIlvt3SX2HjSg2DsFDJMQt3n9AWUekLBp7RO3dsV9PzQd/YLsaZaKKkYErwoWT8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6195.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(10067099003)(4143699003)(11063799006)(56012099006)(18002099003)(22082099003)(18092099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MHhQK1N4MkEvQzZmZkZwZnU1cHpYUXRyT2V3N0FoUHNPNUQ1M2JFMTEvQVdv?=
 =?utf-8?B?Z3FHcHFnMEpWQVBjWFVla2owTUl6Z3l1T0l5RTErK2hzQ0g3MkRKZU1JTEw2?=
 =?utf-8?B?UGlqUFlTTUh1S3hHb1N3Q1JkclcxL0VoTE1abWNpczdqcXIrTFV4VVloOWE4?=
 =?utf-8?B?OTE0Um1aYURhSDVNQ1Z1cVFoWVhqTFhYbGowd2dsVVZTL1BKbjlPY3NEb2NC?=
 =?utf-8?B?Z0ZZTDNpZ0NqOC9EYUpTN2xZVjduTkM0REk2anBnZldoTm9kZWZUYmRKNlNn?=
 =?utf-8?B?OFpNdVpzQ2tEUEdsbTh1YTBUakNzRmxFanpHTE53SFVLVGR1QmwxemVDUUlz?=
 =?utf-8?B?VTVWcGV4K3JtZXZQbjlWdUdUNEZpQldNWXpMaGFZUVg4aE1BRzljOXJrNDIr?=
 =?utf-8?B?ZG1HS0tVT2ErTFJGTzl5OFR0QldvR01WTkYzTTVPV3VSYjEzRE1TUEdkWVNI?=
 =?utf-8?B?dllUSXE2SGNZUnYreHc3RXV4blI5Z3dPRzJUSUZ5bWw1Yy96dGxReWcvY0ZS?=
 =?utf-8?B?RG9PbmZiSlllUXRXS0c3QkZXN3Z6S0wvaTk2eUtDZjhXaFNDRGRHb0g2SnRi?=
 =?utf-8?B?eVFjT1k4RUxGNC9rR0xoYXZYOGNhRHY3OWQvR0NySmNuWWdKUVRYaVhoZXli?=
 =?utf-8?B?OW1kREVZdTJPbldwNUkxV3gybFVZdHBJUVZwSlNWN2xmY2hTZytWQlBiTDBV?=
 =?utf-8?B?OWYydjhJalBxcjZxUXdtWnhuZEYyZXlhczN4bmlIcUhRUU5SZVdpazJVV1JP?=
 =?utf-8?B?V2ZLU0dBTi8vQkxnZnVHMFdXODJNZlJQV1JXMFVML0xvVXpmS3l6STJPNi9D?=
 =?utf-8?B?eXI1MmluR082OFdNUXZ6SE9hK0RrYTRDUm4yaHZaMW9pSXlwd0FlSW1uM0x5?=
 =?utf-8?B?SVc1K2ZQODFNRThtYVRrdUZ1ZmFmNnBKbmhLcGc5YUxLb1Axb042cS9uZnVz?=
 =?utf-8?B?OU1zbkVzVzg4aXVMOHpqQ1dmWm9NRUdBSlY4c3g3ajBFZExDV0NWV0lBY3VZ?=
 =?utf-8?B?Wk5TT2MyMXRvR0FiRXN0NTc2NStQYVRSck1tUGNob1RsUE1vUHpPRk1zemJI?=
 =?utf-8?B?eng3QXdWcDZpWjRxeUZ2M3pHaGlmQWsyZ0c5L0pGTWhESjBvODVjK01VbVNp?=
 =?utf-8?B?ODViS1hGNFpSbWlQK1l0aElNS0lSRjdZbFJveVAvWm15aHZsOW5tekxYMkNT?=
 =?utf-8?B?YWVqVkY2ZENDT3FRVUV4N1FDbnVYRCszaDZQa3FyWURYcGlFUGJnTGVaMEYx?=
 =?utf-8?B?VllOV2lFUU1sK2hyZUU3dUhkell2ODQ3bDQ4S3dzUy8ydzdSQzNud0c4VDdw?=
 =?utf-8?B?VG41K0VGR09qYUwxck83WGxvQmhaT1llaUNFMkdEeFFheTNPNmhUSWVqNS94?=
 =?utf-8?B?aHYwNml5akd2NEVpYnRhSHpuVmllNEJPNkVSM0JQLzhOa016aU5SRnhoSVN0?=
 =?utf-8?B?bXhTdk54ZUptSVpudXo2bVRvZmZuNjRRTlJMcy9PSTJIUVRuT1JGWFRjWXA3?=
 =?utf-8?B?ckVqMWlieVdYMWdrZGtWOHdBc0IvT29aUDlGUlpKZXFwSW42ZlNFdVlSbUxG?=
 =?utf-8?B?T3NQaVMvTlFERjZncE9jWDRyUlZqa1FxZHdWbldib2Uxb2pmTkF4SlFXdVNS?=
 =?utf-8?B?OGFtWmR1d1hoMGxkVFovZlJkRUFlWTdrOWp3OVkxeUJ6aWg2dUFpelZpaGJv?=
 =?utf-8?B?aDVRWWFLRVBlVnJUa09XaGJWbWd5VmVvTnpNKzdXRVdhQVNtQTZPV3gvNzVn?=
 =?utf-8?B?Z01BK1NjUjNaV0NRdlNZUGJqUlk1dWZDTjQ0TElhRWliZCtiVHBZMERSSzFp?=
 =?utf-8?B?MEhjZlpkY1pWeWlQajhQaU5CUWVmeXJ4UTAyTG91WEw2QWpaUGNRS1RRZzUv?=
 =?utf-8?B?b0FMaitHUG9FM2kvaGNMMVdrenRaakhtS3U5Smd3aUJiSktBQWorMTFpeVdT?=
 =?utf-8?B?clpjN1hWMWhDV0YvaitjcmxhcHBrWHFscU50YkNJVUwyMm9jT2MvYTc0UDdo?=
 =?utf-8?B?dExIVzQ1NVlkYVorcjlKK2FBdHg3dHRKUGRQU3F3WFh0alY2N0cxQ1F6NXpI?=
 =?utf-8?B?VG82dGs2Tk5BVEphbHdaNmxJVGZBR1BzZFAzWVU2VHlGRVVWNitJUXlnY1VW?=
 =?utf-8?B?WjdCYndYRlpENmxSZTNCdVZZQ0tudTBiSGhhUDE2MGtJUVNmR2JSV0NyZ1hu?=
 =?utf-8?B?WVBBTUFYdVYxSXZCMjlSTnVheUJDc2YwNUJLM21hWG44bDU2NlZWOUtHcFFr?=
 =?utf-8?B?Y1dob1d5cmUrczhueGxvTCs4SVZqR3Z5aE44dlFzdW92RU5yQVZ5TnNWUVhQ?=
 =?utf-8?B?TzlkdmowcVpid2wvaWRWRjZVdkY2UkRuQTZDblllSXJuUW0yWmxTdz09?=
X-Exchange-RoutingPolicyChecked: hcO1tJkkZ/OuX8+JXDrVeWDSBJk2dGW9iqI5hg2VbAQgkF5gbmGZAS5d/vBEQzeH5wOa+tBci8mGbM/qb90f8HhpZt9+omPyHJSLTj3CHjl1HB2XQ4rIRMkRTVX3z4UtdGjjVkkBS/SJgo6pr0FtYn8LPIET4NvhCFvi/JA3Ff3rLXTfvjX30UaJrPsvZ1o4MYYAvif4/kTEqliszW7kCnRSz57ysa8H/DRbBrcTIoSybM+FBqcKg4D6sn4pgR0KFRy01VBlIBNYMbKgfzrQOnwc7n+TU5LI4LTqjyfrkY7MVQSCWO3kqhfmgGSvEXrTTa3gt3pnHlm123tnGKDj9w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3497b033-7ed0-409d-f2c7-08df0cbb9ce7
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6195.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 08:40:04.2388 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ttzA8xhNFNmt40//aBfMPifW9Ls2nkgNmnu00OwaXRRcBOOO5YVzj5Jcs4x0U2nNjOpG2TdPyq7H4/5y46RzkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR11MB361022
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


On 9/7/2026 09:53, Raag Jadav wrote:
> On Mon, Sep 07, 2026 at 09:24:19AM +0200, Laguna, Lukasz wrote:
>> On 8/31/2026 06:25, Raag Jadav wrote:
>>> Now that we have a dedicated xe_wedge component, cleanup all wedged_mode
>>> implementation and move it to xe_wedge for better maintainability.
>>>
>>> No functional impact.
>>>
>>> Suggested-by: Lukasz Laguna <lukasz.laguna@intel.com>
>>> Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
>>> ---
>>>    drivers/gpu/drm/xe/xe_debugfs.c      | 65 +-------------------
>>>    drivers/gpu/drm/xe/xe_device_types.h | 30 +--------
>>>    drivers/gpu/drm/xe/xe_wedge.c        | 91 ++++++++++++++++++++++++----
>>>    drivers/gpu/drm/xe/xe_wedge.h        |  3 +-
>>>    drivers/gpu/drm/xe/xe_wedge_types.h  | 45 ++++++++++++++
>>>    5 files changed, 131 insertions(+), 103 deletions(-)
>>>    create mode 100644 drivers/gpu/drm/xe/xe_wedge_types.h
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
>>> index 28135f84e286..9caeb357b865 100644
>>> --- a/drivers/gpu/drm/xe/xe_debugfs.c
>>> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
>>> @@ -18,8 +18,6 @@
>>>    #include "xe_force_wake.h"
>>>    #include "xe_gt.h"
>>>    #include "xe_gt_debugfs.h"
>>> -#include "xe_gt_printk.h"
>>> -#include "xe_guc_ads.h"
>>>    #include "xe_hw_engine.h"
>>>    #include "xe_mmio.h"
>>>    #include "xe_pagefault.h"
>>> @@ -34,6 +32,7 @@
>>>    #include "xe_tile_debugfs.h"
>>>    #include "xe_vsec.h"
>>>    #include "xe_wa.h"
>>> +#include "xe_wedge.h"
>>>    #ifdef CONFIG_DRM_XE_DEBUG
>>>    #include "xe_bo_evict.h"
>>> @@ -374,58 +373,6 @@ static ssize_t wedged_mode_show(struct file *f, char __user *ubuf,
>>>    	return simple_read_from_buffer(ubuf, size, pos, buf, len);
>>>    }
>>> -static int __wedged_mode_set_reset_policy(struct xe_gt *gt, enum xe_wedged_mode mode)
>>> -{
>>> -	bool enable_engine_reset;
>>> -	int ret;
>>> -
>>> -	enable_engine_reset = (mode != XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET);
>>> -	ret = xe_guc_ads_scheduler_policy_toggle_reset(&gt->uc.guc.ads,
>>> -						       enable_engine_reset);
>>> -	if (ret)
>>> -		xe_gt_err(gt, "Failed to update GuC ADS scheduler policy (%pe)\n", ERR_PTR(ret));
>>> -
>>> -	return ret;
>>> -}
>>> -
>>> -static int wedged_mode_set_reset_policy(struct xe_device *xe, enum xe_wedged_mode mode)
>>> -{
>>> -	struct xe_gt *gt;
>>> -	int ret;
>>> -	u8 id;
>>> -
>>> -	guard(xe_pm_runtime)(xe);
>>> -	for_each_gt(gt, xe, id) {
>>> -		ret = __wedged_mode_set_reset_policy(gt, mode);
>>> -		if (ret) {
>>> -			if (id > 0) {
>>> -				xe->wedged.inconsistent_reset = true;
>>> -				drm_err(&xe->drm, "Inconsistent reset policy state between GTs\n");
>>> -			}
>>> -			return ret;
>>> -		}
>>> -	}
>>> -
>>> -	xe->wedged.inconsistent_reset = false;
>>> -
>>> -	return 0;
>>> -}
>>> -
>>> -static bool wedged_mode_needs_policy_update(struct xe_device *xe, enum xe_wedged_mode mode)
>>> -{
>>> -	if (xe->wedged.inconsistent_reset)
>>> -		return true;
>>> -
>>> -	if (xe->wedged.mode == mode)
>>> -		return false;
>>> -
>>> -	if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET ||
>>> -	    mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET)
>>> -		return true;
>>> -
>>> -	return false;
>>> -}
>>> -
>>>    static ssize_t wedged_mode_set(struct file *f, const char __user *ubuf,
>>>    			       size_t size, loff_t *pos)
>>>    {
>>> @@ -437,18 +384,10 @@ static ssize_t wedged_mode_set(struct file *f, const char __user *ubuf,
>>>    	if (ret)
>>>    		return ret;
>>> -	ret = xe_device_validate_wedged_mode(xe, wedged_mode);
>>> +	ret = xe_wedge_set_mode(xe, wedged_mode);
>>>    	if (ret)
>>>    		return ret;
>>> -	if (wedged_mode_needs_policy_update(xe, wedged_mode)) {
>>> -		ret = wedged_mode_set_reset_policy(xe, wedged_mode);
>>> -		if (ret)
>>> -			return ret;
>>> -	}
>>> -
>>> -	xe->wedged.mode = wedged_mode;
>>> -
>>>    	return size;
>>>    }
>>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>>> index 7d83f79f27f4..2b7114e9fee1 100644
>>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> Shouldn't this be moved in the previous patch "drm/xe: Introduce xe_wedge"?
> That's what I did locally but it results in a huge patch that's hard to
> review, hence the 3 patch split here. I don't mind squashing if it makes
> everyone happy.
>
> Raag

I was thinking about moving enum and struct from xe_device_types.h, but 
squashing all is also fine for me.

Lukasz

>
>>> @@ -30,6 +30,7 @@
>>>    #include "xe_sysctrl_types.h"
>>>    #include "xe_tile_types.h"
>>>    #include "xe_validation.h"
>>> +#include "xe_wedge_types.h"
>>>    #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>>>    #define TEST_VM_OPS_ERROR
>>> @@ -45,22 +46,6 @@ struct xe_pxp;
>>>    struct xe_ttm_stolen_mgr;
>>>    struct xe_vram_region;
>>> -/**
>>> - * enum xe_wedged_mode - possible wedged modes
>>> - * @XE_WEDGED_MODE_NEVER: Device will never be declared wedged.
>>> - * @XE_WEDGED_MODE_UPON_CRITICAL_ERROR: Device will be declared wedged only
>>> - *	when critical error occurs like GT reset failure or firmware failure.
>>> - *	This is the default mode.
>>> - * @XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET: Device will be declared wedged on
>>> - *	any hang. In this mode, engine resets are disabled to avoid automatic
>>> - *	recovery attempts. This mode is primarily intended for debugging hangs.
>>> - */
>>> -enum xe_wedged_mode {
>>> -	XE_WEDGED_MODE_NEVER = 0,
>>> -	XE_WEDGED_MODE_UPON_CRITICAL_ERROR = 1,
>>> -	XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET = 2,
>>> -};
>>> -
>>>    #ifdef CONFIG_DRM_XE_DEBUG_PAGE_SIZE
>>>    /**
>>>     * enum xe_page_size_alloc_ctrl_mode - User BO page-size allocation control modes
>>> @@ -525,18 +510,7 @@ struct xe_device {
>>>    	atomic_t in_reset;
>>>    	/** @wedged: Struct to control Wedged States and mode */
>>> -	struct {
>>> -		/** @wedged.flag: Xe device faced a critical error and is now blocked. */
>>> -		atomic_t flag;
>>> -		/** @wedged.mode: Mode controlled by kernel parameter and debugfs */
>>> -		enum xe_wedged_mode mode;
>>> -		/** @wedged.method: Recovery method to be sent in the drm device wedged uevent */
>>> -		unsigned long method;
>>> -		/** @wedged.inconsistent_reset: Inconsistent reset policy state between GTs */
>>> -		bool inconsistent_reset;
>>> -		/** @wedged.work: Worker for wedge handling */
>>> -		struct work_struct work;
>>> -	} wedged;
>>> +	struct xe_wedge wedged;
>>>    	/** @devres_group: devres group */
>>>    	void *devres_group;
>>> diff --git a/drivers/gpu/drm/xe/xe_wedge.c b/drivers/gpu/drm/xe/xe_wedge.c
>>> index 92973133a6f6..04d8c5666be1 100644
>>> --- a/drivers/gpu/drm/xe/xe_wedge.c
>>> +++ b/drivers/gpu/drm/xe/xe_wedge.c
>>> @@ -9,6 +9,8 @@
>>>    #include "xe_defaults.h"
>>>    #include "xe_device_types.h"
>>>    #include "xe_gt.h"
>>> +#include "xe_gt_printk.h"
>>> +#include "xe_guc_ads.h"
>>>    #include "xe_log.h"
>>>    #include "xe_module.h"
>>>    #include "xe_pm.h"
>>> @@ -160,16 +162,7 @@ static const char *wedge_mode_to_string(enum xe_wedged_mode mode)
>>>    	}
>>>    }
>>> -/**
>>> - * xe_device_validate_wedged_mode() - Check if given mode is supported
>>> - * @xe: the &xe_device
>>> - * @mode: requested mode to validate
>>> - *
>>> - * Check whether the provided wedged mode is supported.
>>> - *
>>> - * Return: 0 if mode is supported, error code otherwise.
>>> - */
>>> -int xe_device_validate_wedged_mode(struct xe_device *xe, unsigned int mode)
>>> +static int wedge_validate_mode(struct xe_device *xe, unsigned int mode)
>>>    {
>>>    	if (mode > XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET) {
>>>    		xe_dbg(xe, "wedged_mode: invalid value (%u)\n", mode);
>>> @@ -185,13 +178,89 @@ int xe_device_validate_wedged_mode(struct xe_device *xe, unsigned int mode)
>>>    	return 0;
>>>    }
>>> +static bool wedge_mode_needs_policy_update(struct xe_device *xe, enum xe_wedged_mode mode)
>>> +{
>>> +	if (xe->wedged.inconsistent_reset)
>>> +		return true;
>>> +
>>> +	if (xe->wedged.mode == mode)
>>> +		return false;
>>> +
>>> +	if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET ||
>>> +	    mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET)
>>> +		return true;
>>> +
>>> +	return false;
>>> +}
>>> +
>>> +static int __wedge_mode_set_reset_policy(struct xe_gt *gt, enum xe_wedged_mode mode)
>>> +{
>>> +	bool enable_engine_reset;
>>> +	int ret;
>>> +
>>> +	enable_engine_reset = (mode != XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET);
>>> +	ret = xe_guc_ads_scheduler_policy_toggle_reset(&gt->uc.guc.ads,
>>> +						       enable_engine_reset);
>>> +	if (ret)
>>> +		xe_gt_err(gt, "Failed to update GuC ADS scheduler policy (%pe)\n", ERR_PTR(ret));
>>> +
>>> +	return ret;
>>> +}
>>> +
>>> +static int wedge_mode_set_reset_policy(struct xe_device *xe, enum xe_wedged_mode mode)
>>> +{
>>> +	struct xe_gt *gt;
>>> +	int ret;
>>> +	u8 id;
>>> +
>>> +	guard(xe_pm_runtime)(xe);
>>> +	for_each_gt(gt, xe, id) {
>>> +		ret = __wedge_mode_set_reset_policy(gt, mode);
>>> +		if (ret) {
>>> +			if (id > 0) {
>>> +				xe->wedged.inconsistent_reset = true;
>>> +				xe_err(xe, "Inconsistent reset policy state between GTs\n");
>>> +			}
>>> +			return ret;
>>> +		}
>>> +	}
>>> +
>>> +	xe->wedged.inconsistent_reset = false;
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +/**
>>> + * xe_wedge_set_mode() - Set wedge mode
>>> + * @xe: xe device instance
>>> + * @mode: wedge mode to be set
>>> + */
>>> +int xe_wedge_set_mode(struct xe_device *xe, enum xe_wedged_mode mode)
>>> +{
>>> +	int ret;
>>> +
>>> +	ret = wedge_validate_mode(xe, mode);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	if (wedge_mode_needs_policy_update(xe, mode)) {
>>> +		ret = wedge_mode_set_reset_policy(xe, mode);
>>> +		if (ret)
>>> +			return ret;
>>> +	}
>>> +
>>> +	xe->wedged.mode = mode;
>>> +
>>> +	return ret;
>>> +}
>>> +
>>>    /**
>>>     * xe_device_wedged_init_early() - Set wedge mode passed as module parameter
>>>     * @xe: xe device instance
>>>     */
>>>    void xe_device_wedged_init_early(struct xe_device *xe)
>>>    {
>>> -	xe->wedged.mode = xe_device_validate_wedged_mode(xe, xe_modparam.wedged_mode) ?
>>> +	xe->wedged.mode = wedge_validate_mode(xe, xe_modparam.wedged_mode) ?
>>>    			  XE_DEFAULT_WEDGED_MODE : xe_modparam.wedged_mode;
>>>    	xe_dbg(xe, "wedged_mode: setting mode (%u) %s\n",
>>>    	       xe->wedged.mode, wedge_mode_to_string(xe->wedged.mode));
>>> diff --git a/drivers/gpu/drm/xe/xe_wedge.h b/drivers/gpu/drm/xe/xe_wedge.h
>>> index c6f16b10ea69..b31a682dbff8 100644
>>> --- a/drivers/gpu/drm/xe/xe_wedge.h
>>> +++ b/drivers/gpu/drm/xe/xe_wedge.h
>>> @@ -9,12 +9,13 @@
>>>    #include <linux/types.h>
>>>    struct xe_device;
>>> +enum xe_wedged_mode;
>>>    void xe_device_declare_wedged(struct xe_device *xe);
>>>    bool xe_device_wedged(struct xe_device *xe);
>>>    void xe_device_wedged_init_early(struct xe_device *xe);
>>>    int xe_device_wedged_init(struct xe_device *xe);
>>> -int xe_device_validate_wedged_mode(struct xe_device *xe, unsigned int mode);
>>>    void xe_device_set_wedged_method(struct xe_device *xe, unsigned long method);
>>> +int xe_wedge_set_mode(struct xe_device *xe, enum xe_wedged_mode mode);
>>>    #endif
>>> diff --git a/drivers/gpu/drm/xe/xe_wedge_types.h b/drivers/gpu/drm/xe/xe_wedge_types.h
>>> new file mode 100644
>>> index 000000000000..e6084f151c62
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/xe/xe_wedge_types.h
>>> @@ -0,0 +1,45 @@
>>> +/* SPDX-License-Identifier: MIT */
>>> +/*
>>> + * Copyright © 2026 Intel Corporation
>>> + */
>>> +
>>> +#ifndef _XE_WEDGE_TYPES_H_
>>> +#define _XE_WEDGE_TYPES_H_
>>> +
>>> +#include <linux/atomic.h>
>>> +#include <linux/types.h>
>>> +#include <linux/workqueue_types.h>
>>> +
>>> +/**
>>> + * enum xe_wedged_mode - Possible wedge modes
>>> + * @XE_WEDGED_MODE_NEVER: Device will never be declared wedged.
>>> + * @XE_WEDGED_MODE_UPON_CRITICAL_ERROR: Device will be declared wedged only
>>> + *	when critical error occurs like GT reset failure or firmware failure.
>>> + *	This is the default mode.
>>> + * @XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET: Device will be declared wedged on
>>> + *	any hang. In this mode, engine resets are disabled to avoid automatic
>>> + *	recovery attempts. This mode is primarily intended for debugging hangs.
>>> + */
>>> +enum xe_wedged_mode {
>>> +	XE_WEDGED_MODE_NEVER = 0,
>>> +	XE_WEDGED_MODE_UPON_CRITICAL_ERROR = 1,
>>> +	XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET = 2,
>>> +};
>>> +
>>> +/**
>>> + * struct xe_wedge - Struct to control Wedged States and mode
>>> + */
>>> +struct xe_wedge {
>>> +	/** @flag: Xe device faced a critical error and is now blocked. */
>>> +	atomic_t flag;
>>> +	/** @mode: Mode controlled by kernel parameter and debugfs */
>>> +	enum xe_wedged_mode mode;
>>> +	/** @method: Recovery method to be sent in the drm device wedged uevent */
>>> +	unsigned long method;
>>> +	/** @inconsistent_reset: Inconsistent reset policy state between GTs */
>>> +	bool inconsistent_reset;
>>> +	/** @work: Worker for wedge handling */
>>> +	struct work_struct work;
>>> +};
>>> +
>>> +#endif
