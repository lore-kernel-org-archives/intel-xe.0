Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1CDDC54FD2
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jul 2026 08:48:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CD8910EE4B;
	Thu, 30 Jul 2026 08:48:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dJ7noHCc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5152510EE4B;
 Thu, 30 Jul 2026 08:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785401319; x=1816937319;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3mX2BwIWS7TNvavsdGI9IJ1cHdP/ZBUgm6hf6a3qmqo=;
 b=dJ7noHCcA5DjgQk4J2Lp9ayeprcBmvloVk+buyih1ZEIm3wjpG1JGL4j
 eg4ZBVMVvv+QPRYCd+SUbPLfsjZbr296Pwr87fYXRQ4WjR7WnQeJXurBI
 ++/7vn9ZNEjwnQNOkO3RqjLjmal2rLxLMTz+HGX0eBIDtKmHhQtlttNS2
 L0tYDpnd77xyoDMSwDslSdq5na4H2pKyFjWmoTzIO1xW1IibQvxxYoLRR
 GjNSG7zMH1DZCQClks/dP0psuUs7l2JD4MOU+ZzEi+R8KqRiU6M4aIJ9T
 +fEve7rJ0SwD7Zl3FaJdp2FvLpdD4x9Tjw9z2iUocUJ8XSLYfJDLS7O92 w==;
X-CSE-ConnectionGUID: x3Fhdr7dRk605Zsn1V7+og==
X-CSE-MsgGUID: rNOPVQMlSK6mtQaUECcFRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="89695803"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; d="scan'208";a="89695803"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 01:48:39 -0700
X-CSE-ConnectionGUID: jmpfGrxATlKstBDtn39JZw==
X-CSE-MsgGUID: AfbVETkPQXS/vTaFI8kYZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; d="scan'208";a="265296817"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 01:48:38 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 30 Jul 2026 01:48:37 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 30 Jul 2026 01:48:37 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.6) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 30 Jul 2026 01:48:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JPxVFtwry91I7C0aec5qHH5EXUx0eNYBJjsZOiM2wUDbDbanTF2/amv9fzWUzc5Jkw9M95xGpnZ5NvbATw0TAIfguK8MJHZOnvdZy8PnSf/Npb8oN/6vTasy6d4LP4oexqFQeWxoFNQvEy6vT2+gwU1b/p94ov77PDA+JuTTrKsqS9/LVqWFfZdcUgDR1EjcWh7n/7E8C6UGWbFWElpeVHh10vXX7POuG7deUILSuRXLUc5GUqoWC0U2DKxQwK+xtz1INSUEmpQ661cFyBCHbEdQnpzOMbRP2j8GiGzcFlsk2pwyxMR+pho3RucHek1np1ueWjV4pc0kG40vrD6gJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g7iSE6KgfShmMGmL2GIFyn5qsDbC+pdFYl/BgGsGs/E=;
 b=CGOf83c3kPNb+9nUd5+Rc9/hYIbeG9KMzOUqx41P+ecFPz+U1TnMHLFGLoh9r5zD6Q83F7y99vGSonOpMwHLIYSLdF4L/QLyHwztlJQU2wqoRc63x/N7EpV+/S+O2RMDI3GeGE2r82RlCGJdys1poOWqX+342HCBaO2s7iykvHidhvOSlcirrFg7TSzLElC39iT4EITEsQXc+xIavDt+DMwDljguHw0pPBTtxABkjcsPvPvuskf/B4o+bTNHChIc9wI7DJ7r7V3zGNvx20x2+T971DHLqZeHJmJtWljNHeAlgJjDJ7hin79myVO0U7qRuj5/mPZmVZR3htUixOImgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7636.namprd11.prod.outlook.com (2603:10b6:510:26f::13)
 by DS4PPF2F49754B6.namprd11.prod.outlook.com (2603:10b6:f:fc02::1a)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Thu, 30 Jul
 2026 08:48:29 +0000
Received: from PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b]) by PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b%5]) with mapi id 15.21.0270.009; Thu, 30 Jul 2026
 08:48:29 +0000
Message-ID: <4c1e990b-b2d2-4e35-b62a-2f3d4469deb2@intel.com>
Date: Thu, 30 Jul 2026 14:18:22 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 07/10] drm/i915/vrr: Latch CMRR ratio via fastset on
 debugfs write
To: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 <intel-gfx@lists.freedesktop.org>
CC: <intel-xe@lists.freedesktop.org>, <uma.shankar@intel.com>,
 <ankit.k.nautiyal@intel.com>
References: <20260728145943.3848704-1-mitulkumar.ajitkumar.golani@intel.com>
 <20260728145943.3848704-8-mitulkumar.ajitkumar.golani@intel.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260728145943.3848704-8-mitulkumar.ajitkumar.golani@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0299.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:21e::18) To PH0PR11MB7636.namprd11.prod.outlook.com
 (2603:10b6:510:26f::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7636:EE_|DS4PPF2F49754B6:EE_
X-MS-Office365-Filtering-Correlation-Id: 02acdf56-ef65-459a-522c-08deee175400
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|4143699003|10067099003|11063799006|56012099006|6133799003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: GUy6SSPFiM9vc/87Aq4z1kwosrS53ClwvE4CSkBQfixuwUuwa3d+Q7lkYBJWOHR6w6GQF/sDBZkii00kiPGNzU7EPXinARjC+b7LZxhByI82SH05smdvbYUyDysT2xxeYymu5z5dK8V6szwhPcpOwZ6pOPRcOPoAdx/GVJfDEXV+DzSThvaeN91Vqcm9DWuxi9tPNFjj6hWw1xySZC69mNm1kqB4MwSv4hUKWyMi91pSU9pDdf9jD1dAo98ycjtVgZJY/dpfjolMiFR97TtvksdXE/KrJV6CFw89jaNTGwhk4IQHRccQCIqh9UQnXkWsIML62QEeNFvqhpsn8VBWaSDjEgweqaOrc2wmkh3rPdwgHG4dhakARmM5Z9yhyYtZQ1TNbRw5bPh88JFZCkYszk9j4Ie8obEvxT44l5TDzZjOeFQRve334PkmHgSP3yGpbofbrHAO1ltu5zZw2df6argTsBuCY/I/5CCo95WSIjey6ypuwQgKw/iKU+uQUEOQ/FnOAfXiA01+rBMj6StHQdGa+J0PdSnuluuT/L61PQ4heQqFo4L+bvsnM0QAmBaE4AvDMLUS66j3qMqR1v83jhfVF4yOIb5DDK9E4bHkSYg+Xrro1WjrYT6whNyEpuK5NeLFUj9M0n4z+eoS88HGaYMfKh80rLpiAkWoaJF3wKU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7636.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(4143699003)(10067099003)(11063799006)(56012099006)(6133799003)(18002099003)(22082099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Um12bEgwV2Rwaks4NlR5d2JJSC9hNlkwQW5ka0t5RnMyN1E4MDlITFlBUEJS?=
 =?utf-8?B?d2QxSURPUE44ejBtVEEzdTljd0ROa0lJTFVwSCtVR3NmVklYWlhVaE9VN0Iw?=
 =?utf-8?B?enkwTzcyZWRpNFJWdVlMZDZ4aDIxeEtwZnFLeUp3ZDNsanRpNjBtUXdpK083?=
 =?utf-8?B?d0o0bU5HMmpNZzZVeHRQcElIeDlPMUo1dGF4WWZqcENiWHRaTjZpSEV5MkFZ?=
 =?utf-8?B?cGQxTkt3cHhUdUtLZ2NEZnJ6dXpiZ1dOc01VckdIeXBycW9GeTFhNmRiRktP?=
 =?utf-8?B?Y29ramwvS244OGxQd3NISzFGMmV2ZitGUjNYdjZ6bUFENkFPRk5ZeTF4UGNq?=
 =?utf-8?B?ODg4dUhiZmxDZHNUa01BMGRRNURGRzMwVEVmSWp3U2hjU0thdU8vQ242WUxX?=
 =?utf-8?B?eTZwczJHdDdoeVYwVEhvS3IyV0dld0VUbDlmMXl1M1pMVFdBbUU0WmFINlZD?=
 =?utf-8?B?WTMzSEFFSXRTcVo3TmxlNzkzNHh2TWlQVGtaUUIzR25KQ0c0QXZlaEZxVGlS?=
 =?utf-8?B?YW1ub2NBSjBRMGtpWFBUZ2Y1MGNlbGx1MC9RQjZaRkExNjhmSU9jOTdXL2V5?=
 =?utf-8?B?ajN4dE9iN0pjTmV3ZkdrUXdsSktoeG94U2JyeUNXMmNGWThXZnQzUjdQeHNq?=
 =?utf-8?B?Z2IrRXpQMjNFNEVuK09ybVRvMHNvZjZGdWt0OVRSZ29kU04yOVdQZ0FORDIr?=
 =?utf-8?B?SW1DaXRRQ1Fyb3M2L1FVU3JRUDZhNFZ2eTRIa0NJODAra0JVNTlHUFBpc3g0?=
 =?utf-8?B?SkkwWjlKSEhoaFA1QnhtaVE5ZXRscVdYRTNUQmVmMnlQeVRxU09XbDdhYUFX?=
 =?utf-8?B?cDR5WEc1V2g3NVNqZEhhVnhZS3VQTWtKOUxsR3lqZmRRbWtXUytkcEdxbitl?=
 =?utf-8?B?cW5tdlhiYjByNkVIdG9LNU4yQzVBT21SZDJnQWZ2M0ZIQzBMN1F4UklBNnZp?=
 =?utf-8?B?VCtjVXZLK0dqZ3Y5b1ArWGp4SWxTcDNQd1ZQemNuWittdWk0T2pqQjRweHM3?=
 =?utf-8?B?UjJHbC9rWnNvNHpvdmlzSXZiMTZhbjVEYWFZRy8vNTlUZk1nYWREZFNNK3VE?=
 =?utf-8?B?b1p3Q25WVWFwQ2x5MnhFQ3YyeUt3NUFMUjVvT0Y3aFNTTDJmeGFUUVlRekdM?=
 =?utf-8?B?Tkx3MGpoR2F3K28wT1FSeWM1bzlha3pmNHJEVFMyaDZxQ0d1eGg1VWZlM1lw?=
 =?utf-8?B?dUJiV1NOcDhSUmxoa1BoeklzZTk2cDJ6OHJFcnJpNy96U0JkQXpLTXA4Z2VO?=
 =?utf-8?B?a29EbmduSHcxZGhhYkZxM2xmMXN4b21zRXdNbTkyNktJblpad3cwSmlDNjhG?=
 =?utf-8?B?WGN2aGJjNFJRWUZXS3FBbHgzZVBzbkxSVGxnOVNzR2hnVXZOaU9pekJhUG50?=
 =?utf-8?B?bVRVUzhLN3BSM0RHL2pnckJ0R1FNOTdnUzZUMjZCbXcvZEpCS1lZV2hBTG94?=
 =?utf-8?B?UkdxMS94ZExzVlFNSUsxOWdEb0ROT2lKbjRDSjJjR0Z3U0FvMDVORUlielRQ?=
 =?utf-8?B?SWRzK3I3TnUreVFBeFZEY1F4RTdGOTkzSXZER05jRGhEaUVmNzBFVW1pMDA0?=
 =?utf-8?B?dWsxS1U3TTVyNkNUeGVIMHIzN3VqWUlQQUNFTlJvaVRCZkVPU0ZLelU2L0J2?=
 =?utf-8?B?bVZxa0pKSHlZRnFHT2o2L0lhTm5Xdmo1a2pXM0tWWVB1eHRocEl0anNBVkxH?=
 =?utf-8?B?aVdSMU1XbUlZMFNYYXd6SW94dTBaOW9wejRlb1RYRmNIZnNmUkt2WkljVndo?=
 =?utf-8?B?VmoyTkx6VXIvY3FibjVHNXNKRU01SWUxUnoyUVdsdTlJSFZjS2JkTUhuK1lL?=
 =?utf-8?B?M2ZwLzJnN2ZYejF1WExURTVNR3FDMklDa3NoVTQ4bE1KamNGZXZJQlYrelJv?=
 =?utf-8?B?d2VXK1M5aHdyM2xjdnlaOUxVS0xaVDRiN1V4U3BXNE9PSFAybHRBMW9saEo0?=
 =?utf-8?B?a1g2aEZiV0lBaWE0VzZrNGtuTTNXMldIekh4Ym5WUlBVbkZpdVJxNGdvRDhz?=
 =?utf-8?B?ak9GaWVHcE0yeHVEYitMc3NYT0t3VlNTZEFYOUFxUWNCdEVDWUM1QlNHSEt0?=
 =?utf-8?B?ajUreTN2MTNVRmtCeFJqWUVNeXBES3FnWGYzdWd6V1VUSkxhNFZpZjBBem9m?=
 =?utf-8?B?Wkd4OGt2Zi9xRHRYQ3NLMmloc2U2cStEUmYzeEZuR2J0elVBSHVVQzZlaS9F?=
 =?utf-8?B?L0Z1U0Y4QVIveFJZbUZTbFR6cmFzdmkrbXQzcmJXM1FqNDVtRW92clhXTnFx?=
 =?utf-8?B?aGYvRnZjNnlXQi90ZnNTTVBtSGRPeG01NHBURlhhbDAyUWdOWEN3ODg1am9w?=
 =?utf-8?B?cGRhQVRLNWN3MzdQTThlZXdNOXJTcytLNENBQVk2SjNsZE9OM01za2dJWG03?=
 =?utf-8?Q?Qz7ClhHhjJAJdXzQZudVhLCP7ksCB9xjkzNC7?=
X-Exchange-RoutingPolicyChecked: B8no6Oq3OzRgoE0G8FhFlj5OI5HjzuFsxaarujaUkR3wwpy908Mxa7d/rUekN6ulZKnOCr/f8y9TuaInCHcR91hQOwVMjRgK6OnetikJbKRbgZg+aaXe9Ncuao6h1rZEoRWJzxp2fuH7tyZdJR90g9YRRyM7AjhfoZWi6R9MROXQ9AS/YXz8wx+7G1QgOoT6yn7wWcS7UImNAf6rRtVXe9eC7RuHLi2FvcmGcvZZHm5/MvKfmTSwaYQ51aT2qVl+MONn0TY41XnvgwFXq+7/eN1xTFCLtfSuF75D1LkO1bFxKpRA4cDP/B3Z0eJu/B7vcnTzlSNdGXLcoHUfMaW5CA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 02acdf56-ef65-459a-522c-08deee175400
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7636.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 08:48:29.5009 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UGhCuk+3wVthungO4nuh6XJU+wFSAhSxboMMzH7O+04f4M/pqWpsFQOuFRIOP0TfA0suffX5FiCzD1iNGlY+ZUf/1RBU4+Ff+h/T74nSLS8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF2F49754B6
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



On 7/28/2026 8:29 PM, Mitul Golani wrote:
> Writing the per-CRTC "intel_vrr_target_refresh_rate" debugfs file only
> updates crtc->force_cmrr, a side channel that is not tracked by the
> atomic state. The requested ratio therefore does not reach the hardware
> until some unrelated commit recomputes the pipe config.
> 
> Kick an internal atomic commit for the CRTC from the debugfs write and
> mark the CRTC mode as changed so the pipe config is recomputed.
> 
> Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_vrr.c | 63 ++++++++++++++++++++++++
>   1 file changed, 63 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
> index 7746b2ead7d1..056d513ab637 100644
> --- a/drivers/gpu/drm/i915/display/intel_vrr.c
> +++ b/drivers/gpu/drm/i915/display/intel_vrr.c
> @@ -8,10 +8,12 @@
>   #include <linux/seq_file.h>
>   #include <linux/string.h>
>   
> +#include <drm/drm_atomic.h>
>   #include <drm/drm_print.h>
>   #include <drm/intel/step.h>
>   
>   #include "intel_alpm.h"
> +#include "intel_atomic.h"
>   #include "intel_cmtg.h"
>   #include "intel_crtc.h"
>   #include "intel_de.h"
> @@ -1312,6 +1314,58 @@ static int intel_vrr_debugfs_target_rr_open(struct inode *inode, struct file *fi
>   	return single_open(file, intel_vrr_debugfs_target_rr_show, inode->i_private);
>   }
>   
> +/*
> + * Force an internal fastset commit on @crtc so that a CMRR ratio programmed
> + * via debugfs gets recomputed and latched into hardware. CMRR only alters the
> + * (average) vtotal, which is handled by the LRR fastset path, so this does not
> + * trigger a full modeset (no blank out).
> + */
> +static int intel_vrr_cmrr_fastset_force(struct intel_crtc *crtc)

We need to be careful with the wording here. This commit may or may not 
be downgraded to a fastset, depending on whether the computed vblank 
value (with LRR disabled) changes. We need to figure out if we can also 
seamlessly change Vtotal in case of CMRR but until then lets not 
characterise it as a fastset commit. Let's just call it a commit.

> +{
> +	struct intel_display *display = to_intel_display(crtc);
> +	struct drm_modeset_acquire_ctx ctx;
> +	struct drm_atomic_commit *state;
> +	struct intel_crtc_state *crtc_state;
> +	int ret = 0;
> +
> +	state = drm_atomic_commit_alloc(display->drm);
> +	if (!state)
> +		return -ENOMEM;
> +
> +	drm_modeset_acquire_init(&ctx, DRM_MODESET_ACQUIRE_INTERRUPTIBLE);
> +
> +	state->acquire_ctx = &ctx;
> +	to_intel_atomic_state(state)->internal = true;
> +
> +retry:
> +	crtc_state = intel_atomic_get_crtc_state(state, crtc);
> +	if (IS_ERR(crtc_state)) {
> +		ret = PTR_ERR(crtc_state);
> +		goto out;
> +	}
> +
> +	if (!crtc_state->hw.active)
> +		goto out;
> +
> +	/* Mark mode as changed to trigger a pipe recompute + update() */
> +	crtc_state->uapi.mode_changed = true;
> +
> +	ret = drm_atomic_commit(state);
> +out:
> +	if (ret == -EDEADLK) {
> +		drm_atomic_commit_clear(state);
> +		ret = drm_modeset_backoff(&ctx);
> +		if (!ret)
> +			goto retry;
> +	}
> +
> +	drm_modeset_drop_locks(&ctx);
> +	drm_modeset_acquire_fini(&ctx);
> +	drm_atomic_commit_put(state);
> +
> +	return ret;
> +}
> +
>   static ssize_t intel_vrr_debugfs_target_rr_write(struct file *file, const char __user *ubuf,
>   						 size_t len, loff_t *offp)
>   {
> @@ -1340,6 +1394,15 @@ static ssize_t intel_vrr_debugfs_target_rr_write(struct file *file, const char _
>   	crtc->force_cmrr.numerator = numerator;
>   	crtc->force_cmrr.denominator = denominator;
>   
> +	/*
> +	 * The debugfs value is a side channel that is not tracked by the atomic
> +	 * state, so kick an internal fastset commit to recompute and latch the
> +	 * new CMRR parameters without a full modeset.
> +	 */
> +	ret = intel_vrr_cmrr_fastset_force(crtc);
> +	if (ret)
> +		return ret;
> +

restore the values of num/den to last successful value on failure. 
Otherwise, all subsequent commits fail as force_cmrr holds on to bad values.

>   	return len;
>   }
>   

