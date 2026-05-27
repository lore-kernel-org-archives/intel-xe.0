Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2618CD5BD0
	for <intel-xe@archiver.kernel.org>; Wed, 27 May 2026 21:08:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6439210EA1F;
	Wed, 27 May 2026 21:08:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mlV0QiRJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA6A310EA1F
 for <intel-xe@lists.freedesktop.org>; Wed, 27 May 2026 21:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779916121; x=1811452121;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=tTsTjmUenZ7kmDK7UTyzhbxmbojXMwrqpWwzxAVJvds=;
 b=mlV0QiRJBK1QvkeTRHGXN7aoT7pS4NdfGmROX1eB2tBkVm6u+7JDLtDx
 YJfno9JXI/zfA3PaKrquEOqtvx1In89U0uiDKsif86Tsim230wk28cCUO
 qI1SmZtyCui4lNQ3AdGXvUgFwLkkfG4TrmSRtWeHvJQCjWT38v63P9hSz
 Wek3F2O2a7ogZUTHyXiapRep0/fyGTiCf9sdyA0PHmdoYB1Mr/BskaUIf
 Xq+48rFtAICec7BnrzDylPUGxf6MEcCRnteomOczSI2lVeZcbLjNgVeoP
 +6PcuekbZCuzyDwJgkuAga3KF1j7j4iJjDQLcJRH7S956tgLWzIK51spD g==;
X-CSE-ConnectionGUID: MhXqpi/NQ3WH830pW9fgBQ==
X-CSE-MsgGUID: bcZx1z4EQN+5qyL/pIrkQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="91867355"
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; d="scan'208";a="91867355"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 14:08:40 -0700
X-CSE-ConnectionGUID: hcwsYfuzQIa5BhE1iTr+og==
X-CSE-MsgGUID: FabDTAk7QsmIWVWXRgMJqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; d="scan'208";a="266231561"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 14:08:39 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 27 May 2026 14:08:38 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 27 May 2026 14:08:38 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.46)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 27 May 2026 14:08:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pIkxkDcDCSKjku7O4GsXLr90bTT/sgm3SeN96DGvazVfXcFrka+FqmnSSQ5qRf1FaiqJWquB1n3/rcvVjZ4vwbatLvhf9zoec/NsQtT5PZW6JXZUUrce4o6d10dpWrEkIiYTQlhvWB5nb3jK8WfAjklQpYDL8x3aCiwFzUjbvIvZKO+01DGTZkijcBM+2qA/ff+FGb3b1p+KCEpA58OHzKB9W5zWI4uTz8MMOV5d9IulkHd9cFIu2PTHQu4wY80Mv2OshEfHwDOIu22Vr7xvZX3ZtnCGoEaIV7cGqOgTd/G2TAQnX21e3Sr7tjTszyHiQ3VQYonTyIiVhnDis5wY+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ekGcrX4ZLGOfU17M2C2choKIMMRNL8LrPAFttJPrQUM=;
 b=Ei4gHKT1HlXmgbM1Pousf/AYHSJ+u88q/a0JE8O65KjnwIiFXel2ORlkZxG4/EQPWWYhq2buSEVgUMW9aEQEEryf0KuP0wYLhN49ShDi6s9tu9w9dtS6Vs/xU3AvD9Lehxn2BSHh7p9e4PkRgCEjqtzoe19jwMQkqmIibLk+I3Sb5bjkKtC+BvivmoLVK1zyJ6Ocp1ZzN+mcAK3PyAIefZq9xmAHjTRwf999L7Xa9tJT01MXWQxQAXLHIhFGbXLh+eyNhRd6iWd9J2K1owbFoSdlXxa8rtA1wepqaVJax8gJ9GAxo9h6nud2wDtov/KPDp9u8jntD3ayF6sntsu7oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by DM4PR11MB7279.namprd11.prod.outlook.com (2603:10b6:8:109::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Wed, 27 May
 2026 21:08:35 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%5]) with mapi id 15.21.0071.011; Wed, 27 May 2026
 21:08:35 +0000
Message-ID: <fffa0ee7-0a7c-4a69-9580-f651ff3dfa0f@intel.com>
Date: Wed, 27 May 2026 14:08:35 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/10] drm/xe/guc: add the plumbing for GUC_PAGING_CLASS
To: Matthew Auld <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20260527111335.140000-12-matthew.auld@intel.com>
 <20260527111335.140000-15-matthew.auld@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20260527111335.140000-15-matthew.auld@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0041.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::16) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|DM4PR11MB7279:EE_
X-MS-Office365-Filtering-Correlation-Id: 2465f511-3fbf-4c70-6f2f-08debc341d55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|11063799006|18002099003|22082099003|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: Cdy5jCXOfsN4DmluwWZdELgYwMvoPoPt/7Qdh7eCa1cijJIcckYbC0LWoZWC2VK1UBND8hjcJwNr1GtJISHxX7o7ME22aoK7Qql8y7CS0wRgSRfB6/tXgGlH7VPjdjJGxDUZ4/odwGk724tKe0SRmysKwMkJlQIsJIF7jG5QehZQROxgldJuoNAtJ4I6QW0yg+2nhOUm4ZVzdulVVwWWz5R9tGcuaPgAKJ/Q9UNVmDj7g+eaKJ/CjC6PonnacZ1UFhiIsKK6DLSEIuAbFE54izsC4eFlxAgO7XQf7atMhTeEJ1bQ0jPs9QT9A2JWe5pel1hxewbjzJGMVLiC0FTNBb59gsbPYhPENkco79EP+ph4hI4TzqQ002KXUzpO5hn82DBm/hTy/vrUewaFSsmHi3NetQiRODi2mjfj4lk+Hyy75+hwh61M6RKYpD1j+n/ur24qIDuV2vBzeiz1adjRLwf2CpWTw1WqvxvvDere5hnMkh1QE0H+iMXrNbpfjHe2GVwWRXt5UoFq36T4xoOL3wE9GazNTfBWu7g/H3CsvrT+rVhVfA7JET3zb7DPu6GIBrYlV1nh9pz+se4uzJVf/qlQ+z2QN6e4prI2/EeJNhZhO8VuZcxRFl/XxjZubgNNNIqOWyiuJVJNfVF6FiM8xXfK7yyQj24BIlH/W/VxxC2CmdB5IQcsuT+FeHHYNPlK
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(11063799006)(18002099003)(22082099003)(4143699003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TU1XZm5OTWxqWlU3OUN3eFd6Y3d3ZnhQeGlZSVQ3YWxBbkk5cnJjc0pmcmpz?=
 =?utf-8?B?L2diMExRM2VyamJGSjdNYllWOWVDY3pqY1Flejd5TjRUOWxmZVQveC96clVv?=
 =?utf-8?B?cmlkMytzVnk0aFk2eWNyOUZNeGZ5MjhCdjFwcnp0azNiUEt4VURSQXFsSjNM?=
 =?utf-8?B?a2xUVjZmenUwQzF6NUROQ3RSOEhtS3lTWlpEWjVUL0Q0QWlGTDllaWx3cEFM?=
 =?utf-8?B?RFVuUGovbzVETTRJTE5BVStFVmtNZWFIU0lSWnc5UGQ4WHN1dkkvY0NVQzJ4?=
 =?utf-8?B?T1dCUEkvMDRYTG9rdWVWSEJYcUZqbkhydmR6Y2xGVWFiMDcveDRFMHB6NHVW?=
 =?utf-8?B?NkwwamxtRHgzcFRjWXhyT0JXbVp4UjAyZ3FhT3A4QldUK1hndGFlYkpCOXFx?=
 =?utf-8?B?VlU0QzVUVGdLeDNzQlpVMEhhb0dCR1BwKzc1WWVCR0dpYU1NZFJJbkZoYjgy?=
 =?utf-8?B?OFFIcXZwK01LbXBmOXZRSHJwVWdaSUtPN3REM2w2d2JtcklyaDRtclRsSmp1?=
 =?utf-8?B?VTdwRVZxemdLK3MyV2VhQ2VuMlJxN0xGaUlwdnRhZjNVZkNUNUJuR3doMHNJ?=
 =?utf-8?B?eDY4OFArNjdFNkp5c1pYZnE4RUhkYXM0anpZQU1UVzB0S1I0alJSM1c4M3JN?=
 =?utf-8?B?b1JVV0ZWWWtocXFYRHdMNjMxQ015UzNjN2NSR1NYd1pPeWNEWnlPeDNVNnpl?=
 =?utf-8?B?dWZoOGd5UDRwQ3U5VHJmZHh1TFJ5YXh6SGFJT0luaEVNaVpIOVpkU0I5bmRR?=
 =?utf-8?B?cm8wVU55TGM3ZUFERDM1TlNwWlZJM0pweFVNQkdXcDdnYzhnajlQaFJWSyth?=
 =?utf-8?B?ZjlmazZRMWxwNnFkMGRhU1cvY2xSL0RPeTV0SmpTSXlDdHNEdzhOdWVZalhj?=
 =?utf-8?B?NW85MU5KNmFVbG8wWGhFaUVRbURjRTJKdTNaV0tDbWxtbERUVEhreHVtY2Fo?=
 =?utf-8?B?L2dvaVdkSmdyamVsL1prUGthczRHNi9YeHJsdlJqUUZNckptTlhKR09GSHF0?=
 =?utf-8?B?Y1lsKy9kRG5oM1AzUjlpU29DYzZkQUdMR1kwdzBvWG9ubTI3bnZ3RHdYL1R4?=
 =?utf-8?B?ZVhFVys0K3FWWWxTOXU2YTZlcXdhQzhuK2Urc2x1NXRXdk9KOUZicy9icmVm?=
 =?utf-8?B?bnNQVXE5bXIvOWwyaFc1dE1hZ2NZczVpNDFCUlhIbkhLamdZZVlRRnJuRjFi?=
 =?utf-8?B?dkpUY3ZMOE5hWnBtd2M2TlljbUgzbDhrU1IzNzFoakFQbEZtaG8zY0MvUkdX?=
 =?utf-8?B?QWh2TnpBdVlRbFVEbnBTM3Bicmg2NldEa3lLdWVFeEF4NWNzRm9uZE9SM0w3?=
 =?utf-8?B?M1JqdmI0MDdwOWVaTXJjZGJlUHlwL2RIUjc2WjFOQzhBUHQ0c2Q1M2crVXBN?=
 =?utf-8?B?YW5STW1SMVN4ZnFWNEJlbDdZTzlOcmFqMk5HbEE2ZFdBVXpZbnBCdStQeXBE?=
 =?utf-8?B?RmVGallOYi94aTFCVmI2OS9DaDJmUGx3SmdqbUg4NWF6SjBMNGh3TzErek9G?=
 =?utf-8?B?QlA1QmlLRDh0bWM4aS9UK1lQMEZEOGFITlg0U0FKSnJZamlNcWJ0aWVsSGRi?=
 =?utf-8?B?K1hVbnVuZWhCSk40RndBTWhqSzRCN1ozMUdyR3RmVlBvbDhJeEF1K0JqQ25Q?=
 =?utf-8?B?eDJnMno2S0FDU1puY3luS3hQQy80aTYrdGROcGxkZXFjYzU1SXN1cDZ6eDBO?=
 =?utf-8?B?b3FnWFRVbDUweDA1Z2l6UlBFYmZManhINGJoYkJjNnJKUS96RSsxZmJHYmxu?=
 =?utf-8?B?OVFGZkw2dkpqdUdKSkNDckxrbXUrMnB3ajdUc09Va1dGUGttZWVPd2cyU3FM?=
 =?utf-8?B?d2lVTzM4N3JaK21tMFY4VktVbVFUMmMwZkhPeHFLZndHcnhKelYzeFN5Z1Nl?=
 =?utf-8?B?b0ZFeEtZSC8zYUVDdEwxV2xsazBsSUh5WVdHSkF5RFRLditxQmVFa3lCcUxy?=
 =?utf-8?B?T2pTQm4rc3Q2ODNXWXVuZkhWSkwwMVNkUjk3ZFI1djNYNkZkSkVnNElSeXJQ?=
 =?utf-8?B?c0NEdEVQVzBmUGVTTXlFN0hZN3hUak5pOFlpUnRpTWp6cFZKMHNXWjlGK0pm?=
 =?utf-8?B?aUZiNWZCenBDTGRwQ04yOU9xTklnemIwMFl1SkdXMDVEV1JlMElCc1o2NlpH?=
 =?utf-8?B?V3F1OUltTlhsMGQ1T0R4Y1ZqQmNXbE9JZWhjaUpQVnVzM3ltcWtva3ZWS3Z6?=
 =?utf-8?B?bE53blRrRWhyV01GZHJqaXd2SHhVODBHaXpZU1VXVDJLNVJHSUk1MFFjYlQr?=
 =?utf-8?B?RjlKSSszQU4vbzlyL1N2aWpMN1FSOFFFK3FseHl0U09HcFVNdUpNUUdZb0Rh?=
 =?utf-8?B?UnNJRUpjTkxoZE9Cc2hSVVFhS2NVY1BnK2ZKWFk1N1FIMlpnTGc5bDFGSFlu?=
 =?utf-8?Q?cyWaDhkDklIW/zQk=3D?=
X-Exchange-RoutingPolicyChecked: qeGZJOhLCHMBDrpmscTf5pmojZa1FJssqqc5pCtx1/aj+HeYjp+HOkgy2SEaQhtbn4FbJJjuwsCr41Nti8R/nGDz84tdbRXxwU3cfb/WnX0dBFPGW52hX/J66gbEjRQ2jX6wHINndKCCy+MVXj0w8FGbDSuqeJ3Yil6gPe8Xv9MYuWqP3ayQKiMJgsbW6DWNQ63Df5BIm6jNyEDlcTuC+fvM3qReCdPQOfNWEo1rfZcObGELLbKWee7yBbXvXsgU1TGAuGydjWlEPUwWPrvNw0QI+sD6QXUZBWeQ++nO7Vf7Nr7SsUjmAvcLrPYWgRvqzYLwZMlgkM9YUnVqvscI7A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2465f511-3fbf-4c70-6f2f-08debc341d55
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 21:08:35.0809 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YliU7DQYnDmZrJFTJT2hl6EvdxiTLY1P4JQeVs3w5g2/PsEPyBe62TplUPoIgcAhwF+Pk9wXc+piEMHAHj9FGFfjDsiFZ2SddypwqXZn4wQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7279
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



On 5/27/2026 4:13 AM, Matthew Auld wrote:
> On newer platforms, the GuC has a new engine class which we need to use
> to refer to the dedicated/reserved KMD BCS engine. With that, add the
> plumbing in the GuC backend to support GUC_PAGING_CLASS and
> GUC_CAPTURE_LIST_CLASS_PAGING.
>
> Currently this is still turned off.
>
> v2 (Daniele)
>    - Also add adjust the capture list for hpg, so we account for nvl-s.
>    - Move single paging engine assert to a more natural place.
>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> ---
>   drivers/gpu/drm/xe/abi/guc_capture_abi.h   |  3 ++-
>   drivers/gpu/drm/xe/abi/guc_scheduler_abi.h |  3 ++-
>   drivers/gpu/drm/xe/xe_guc.c                | 15 +++++++++++++++
>   drivers/gpu/drm/xe/xe_guc.h                |  1 +
>   drivers/gpu/drm/xe/xe_guc_ads.c            | 12 ++++++++++++
>   drivers/gpu/drm/xe/xe_guc_capture.c        |  9 +++++++++
>   drivers/gpu/drm/xe/xe_guc_capture.h        |  2 ++
>   7 files changed, 43 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/abi/guc_capture_abi.h b/drivers/gpu/drm/xe/abi/guc_capture_abi.h
> index dd4117553739..ff9c0ae34a28 100644
> --- a/drivers/gpu/drm/xe/abi/guc_capture_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_capture_abi.h
> @@ -32,9 +32,10 @@ enum guc_capture_list_class_type {
>   	GUC_CAPTURE_LIST_CLASS_VIDEOENHANCE = 2,
>   	GUC_CAPTURE_LIST_CLASS_BLITTER = 3,
>   	GUC_CAPTURE_LIST_CLASS_GSC_OTHER = 4,
> +	GUC_CAPTURE_LIST_CLASS_PAGING = 5,
>   };
>   
> -#define GUC_CAPTURE_LIST_CLASS_MAX	(GUC_CAPTURE_LIST_CLASS_GSC_OTHER + 1)
> +#define GUC_CAPTURE_LIST_CLASS_MAX	(GUC_CAPTURE_LIST_CLASS_PAGING + 1)
>   
>   /**
>    * struct guc_mmio_reg - GuC MMIO reg state struct
> diff --git a/drivers/gpu/drm/xe/abi/guc_scheduler_abi.h b/drivers/gpu/drm/xe/abi/guc_scheduler_abi.h
> index 19ec89bf39c5..85bba34277ed 100644
> --- a/drivers/gpu/drm/xe/abi/guc_scheduler_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_scheduler_abi.h
> @@ -21,7 +21,8 @@
>   #define GUC_BLITTER_CLASS		3
>   #define GUC_COMPUTE_CLASS		4
>   #define GUC_GSC_OTHER_CLASS		5
> -#define GUC_LAST_ENGINE_CLASS		GUC_GSC_OTHER_CLASS
> +#define GUC_PAGING_CLASS		6
> +#define GUC_LAST_ENGINE_CLASS		GUC_PAGING_CLASS
>   #define GUC_MAX_ENGINE_CLASSES		16
>   #define GUC_MAX_INSTANCES_PER_CLASS	32
>   
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 4023700ff2a9..2bc9fa5fb393 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -1846,6 +1846,21 @@ bool xe_guc_using_main_gamctrl_queues(struct xe_guc *guc)
>   	return GT_VER(gt) >= 35;
>   }
>   
> +bool xe_guc_has_paging_engine(struct xe_guc *guc)
> +{
> +	/*
> +	 * On newer platforms the GuC now has a dedicated engine class for the
> +	 * special PAGING engine, which is the driver reserved BCS engine used
> +	 * for KMD paging/binding operations. GuC requires KMD to refer to this
> +	 * using the special PAGING engine class. Note that there is no new hw
> +	 * engine here, this is purely a sw view in the GuC itself, which we
> +	 * need to respect.
> +	 */
> +
> +	/* TODO: Have some way to query this from the GuC? */
> +	return false;
> +}
> +
>   #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
>   #include "tests/xe_guc_g2g_test.c"
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
> index 12faf0ba7229..0934927e8254 100644
> --- a/drivers/gpu/drm/xe/xe_guc.h
> +++ b/drivers/gpu/drm/xe/xe_guc.h
> @@ -62,6 +62,7 @@ void xe_guc_stop(struct xe_guc *guc);
>   int xe_guc_start(struct xe_guc *guc);
>   void xe_guc_declare_wedged(struct xe_guc *guc);
>   bool xe_guc_using_main_gamctrl_queues(struct xe_guc *guc);
> +bool xe_guc_has_paging_engine(struct xe_guc *guc);
>   
>   #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
>   int xe_guc_g2g_test_notification(struct xe_guc *guc, u32 *payload, u32 len);
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index c84b98828981..1858b9a8fc0b 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -261,6 +261,7 @@ static inline enum xe_engine_class guc_class_to_engine_class(u16 guc_class)
>   	case GUC_VIDEOENHANCE_CLASS:
>   		return XE_ENGINE_CLASS_VIDEO_ENHANCE;
>   	case GUC_BLITTER_CLASS:
> +	case GUC_PAGING_CLASS:
>   		return XE_ENGINE_CLASS_COPY;
>   	case GUC_COMPUTE_CLASS:
>   		return XE_ENGINE_CLASS_COMPUTE;
> @@ -282,6 +283,10 @@ static u32 engine_enable_mask(struct xe_gt *gt, u16 guc_class)
>   		if (xe_hwe_to_guc_class(hwe) == guc_class)
>   			mask |= BIT(hwe->instance);
>   
> +	/* We expect at most one paging engine per GuC instance, for now */
> +	if (guc_class == GUC_PAGING_CLASS)
> +		xe_gt_assert(gt, !mask || is_power_of_2(mask));
> +
>   	return mask;
>   }
>   
> @@ -496,6 +501,10 @@ static void fill_engine_enable_masks(struct xe_gt *gt,
>   
>   u16 xe_hwe_to_guc_class(struct xe_hw_engine *hwe)
>   {
> +	if (xe_guc_has_paging_engine(&hwe->gt->uc.guc) &&
> +	    xe_gt_is_usm_hwe(hwe->gt, hwe))
> +		return GUC_PAGING_CLASS;
> +
>   	switch (hwe->class) {
>   	case XE_ENGINE_CLASS_RENDER:
>   		return GUC_RENDER_CLASS;
> @@ -615,6 +624,9 @@ static u32 guc_get_capture_engine_mask(struct xe_gt *gt, struct iosys_map *info_
>   	case GUC_CAPTURE_LIST_CLASS_GSC_OTHER:
>   		mask = info_map_read(xe, info_map, engine_enabled_masks[GUC_GSC_OTHER_CLASS]);
>   		break;
> +	case GUC_CAPTURE_LIST_CLASS_PAGING:
> +		mask = info_map_read(xe, info_map, engine_enabled_masks[GUC_PAGING_CLASS]);
> +		break;
>   	default:
>   		mask = 0;
>   	}
> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
> index 50c6b9466c14..4456dee072c2 100644
> --- a/drivers/gpu/drm/xe/xe_guc_capture.c
> +++ b/drivers/gpu/drm/xe/xe_guc_capture.c
> @@ -249,6 +249,8 @@ static const struct __guc_mmio_reg_descr_group xe_hpg_lists[] = {
>   	MAKE_REGLIST(xe_blt_inst_regs, PF, ENGINE_INSTANCE, GUC_CAPTURE_LIST_CLASS_BLITTER),
>   	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS, GUC_CAPTURE_LIST_CLASS_GSC_OTHER),
>   	MAKE_REGLIST(xe_lp_gsc_inst_regs, PF, ENGINE_INSTANCE, GUC_CAPTURE_LIST_CLASS_GSC_OTHER),
> +	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS, GUC_CAPTURE_LIST_CLASS_PAGING),
> +	MAKE_REGLIST(xe_blt_inst_regs, PF, ENGINE_INSTANCE, GUC_CAPTURE_LIST_CLASS_PAGING),
>   	{}
>   };
>   
> @@ -265,6 +267,8 @@ static const struct __guc_mmio_reg_descr_group xe3p_lists[] = {
>   	MAKE_REGLIST(xe_blt_inst_regs, PF, ENGINE_INSTANCE, GUC_CAPTURE_LIST_CLASS_BLITTER),
>   	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS, GUC_CAPTURE_LIST_CLASS_GSC_OTHER),
>   	MAKE_REGLIST(xe_lp_gsc_inst_regs, PF, ENGINE_INSTANCE, GUC_CAPTURE_LIST_CLASS_GSC_OTHER),
> +	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS, GUC_CAPTURE_LIST_CLASS_PAGING),
> +	MAKE_REGLIST(xe_blt_inst_regs, PF, ENGINE_INSTANCE, GUC_CAPTURE_LIST_CLASS_PAGING),
>   	{}
>   };
>   static const char * const capture_list_type_names[] = {
> @@ -279,6 +283,7 @@ static const char * const capture_engine_class_names[] = {
>   	"VideoEnhance",
>   	"Blitter",
>   	"GSC-Other",
> +	"Paging",
>   };
>   
>   struct __guc_capture_ads_cache {
> @@ -766,6 +771,10 @@ size_t xe_guc_capture_ads_input_worst_size(struct xe_guc *guc)
>   	total_size = PAGE_SIZE;	/* Pad a page in front for empty lists */
>   	for (i = 0; i < GUC_CAPTURE_LIST_INDEX_MAX; i++) {
>   		for (j = 0; j < GUC_CAPTURE_LIST_CLASS_MAX; j++) {
> +			if (!xe_guc_has_paging_engine(guc) &&
> +			    j == GUC_CAPTURE_LIST_CLASS_PAGING)
> +				continue;
> +
>   			if (xe_guc_capture_getlistsize(guc, i,
>   						       GUC_STATE_CAPTURE_TYPE_ENGINE_CLASS,
>   						       j, &class_size) < 0)
> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.h b/drivers/gpu/drm/xe/xe_guc_capture.h
> index eb954f4d1ffd..fcd4f1298536 100644
> --- a/drivers/gpu/drm/xe/xe_guc_capture.h
> +++ b/drivers/gpu/drm/xe/xe_guc_capture.h
> @@ -28,6 +28,8 @@ static inline enum guc_capture_list_class_type xe_guc_class_to_capture_class(u16
>   	case GUC_VIDEOENHANCE_CLASS:
>   	case GUC_BLITTER_CLASS:
>   		return class;
> +	case GUC_PAGING_CLASS:
> +		return GUC_CAPTURE_LIST_CLASS_PAGING;
>   	default:
>   		XE_WARN_ON(class);
>   		return GUC_CAPTURE_LIST_CLASS_MAX;

