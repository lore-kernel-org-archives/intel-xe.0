Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E918CD1288
	for <intel-xe@archiver.kernel.org>; Thu,  4 Apr 2024 04:04:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E001A112C5B;
	Thu,  4 Apr 2024 04:04:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nc1ix9QQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B112112C00
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Apr 2024 04:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712203484; x=1743739484;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lBiuL7Gn0X5bFJfh8lo4el8sK1vuIZMVEc16FWv7Z2w=;
 b=Nc1ix9QQ3bFou7Plbd/pfy8YiB0vr7csU1C49/OPDmTSdTzxgHaG/xtp
 aiKT5E28A8veg5MXKj6bAvVWNjnT7oGKarSrSRfeiwBL+H6p2A5oq/ePF
 TEAlVHMY1RJMSK8eOmZK/zq5yqzc15MLwl4U/myG/zuPaSsn4JkzXKDME
 8NkaZQ91aUuEKWobtjkYqWnDvPUhvtSVMsakTyAGOeMXz7OV/R6d5TM+a
 XRjCnMYiK0qF2lChq0XL0AmaSn196jNcDm6OB6zVz9NgFvqnHbxdrddSP
 ryT7wksik8p9RFBucs/Ng6UXADNkwd/jbFLstD5f/TnTCBwwVvJQB/fj3 w==;
X-CSE-ConnectionGUID: ywnWLPBvSqyfVgK5mJyr4g==
X-CSE-MsgGUID: 5ZnSw9f0T3+cocVG1D/TSw==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="7324519"
X-IronPort-AV: E=Sophos;i="6.07,178,1708416000"; 
   d="scan'208";a="7324519"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 21:04:43 -0700
X-CSE-ConnectionGUID: RPiEVrkGR7aBhoppXJnWpw==
X-CSE-MsgGUID: 3tzWG5wNQd+3fFtaJCbF9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,178,1708416000"; d="scan'208";a="18752744"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Apr 2024 21:04:44 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 3 Apr 2024 21:04:42 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 3 Apr 2024 21:04:41 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 3 Apr 2024 21:04:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h8GMsKKAg16frhZlgRNFhdLpssbyThtETIVwlV7RB6kO9ksVveXPEZUheowhtsw+TfTGHjZxlUrYIRszaVGomXMrkxvgpwYr+bsOyfV31jKQcbZPvs+hY2Ma5JdzVNPX/Vi6gql6EVU/UwC5j4UPs9nrVaYLiFoLoeP3fSutTU0LJtsQXhFsbSGirvyldqlAyGu3XPErdD2yhZXJ7B7frOL1sAHhRx8P8OYq/N2RvUTPZpuoLjawxarV81tqtM54jDQjnXymbQ2dDU1pJ5X1fys8N7vV0H0ao7JzaEtk+Jgb/MHPVkJBWsGW0sBTo3oqPQ9ewd2IGg5lQdLKjPpEoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kh7vaSnEVovLaeHe+hqllfhO+jEEpB0znoM5xts0phE=;
 b=BTtW6KxWfb9xqR89pYaY5XpqxISornSjZvCongYm7Xijqh3EMSTzpPCqerBcKoDxvDg3jZudUzTdr4c9+Ddbl+NvuVdJGkgbXMcfT56MePJ1r+2VywUjw9s4cMYqqn68Bn4W4ZE8hTFMcPU36e9Do7uvMdnyxQVUyfX5ne6e21U99nCpeEBa6dOVlkQ4dDtUssasJkvslO6tw7sU1QYa5CrnLe1qgF/i5psGwsxeevFaotRU2ZZQjVYbSw4L8kZ+2FZktvqdlCMqoI8lJDx1ENuzplZ5/iu89ovtwax+NnmhoUKvGajkLmwOSoQ5uxJz3wjQzmLBs3v/NhQ1o/hExw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by MW3PR11MB4635.namprd11.prod.outlook.com (2603:10b6:303:2c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Thu, 4 Apr
 2024 04:04:39 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::eb80:5333:fa3e:cb6c]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::eb80:5333:fa3e:cb6c%4]) with mapi id 15.20.7452.019; Thu, 4 Apr 2024
 04:04:39 +0000
Message-ID: <eaefb802-4037-42d5-b232-007e5873f06f@intel.com>
Date: Thu, 4 Apr 2024 09:34:31 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/4] drm/xe: Define XE_REG_IS_VALID
To: Karthik Poosa <karthik.poosa@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <lucas.demarchi@intel.com>
References: <20240404035441.965590-1-karthik.poosa@intel.com>
 <20240404035441.965590-2-karthik.poosa@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20240404035441.965590-2-karthik.poosa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0195.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:be::23) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|MW3PR11MB4635:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hIEMbp8yFf1+eOTFAaNM7Q2OaWaJka6MSSzFlXao5V381prIOgqgreyDDaBCGt8/r1DNl1d5sltzLkJLO/3HmfNztNOKVib8fMVqpM1QOHfMF3ljqasgQAgRVPU4USh4bopSCkSxKDlm0KOX/f00jRYwl2IHmNLPL1/M6FP6MjnHoP2AbKYC09MahuOvO7aOESAwiM5Zg+brqQbnC/mcIw31HtDRsd+eiwGQ/HXvfKtQBldwrPiN3vTPt5VWG2rT02OlEwVy+zfvIMhWzDiYW4RqwH4R3K2rF+BtjwF8i5dYPD9sRLu6S4cdpzTO5Bd61YoNK+xyBGHwFQm9n1MNlEZxkqYKITpAB/4eHq5bv3vM6iLMxKSCGzE8cbvQtMkxVR/47qZWv+5WxE8uKfYco8FoXYwvdqQHSDPsUOCn6BZ0jA/+DXHdkNOsNxp1zxXdZ/MhK+ho0393REXqx8U2XGZvwnS9q3IdFK8qCH6GoQmjDFcM1E0QjeADkgIomAz7rEiE++hPMlp+SuoWelOTAc/yWh7XtS1zcYXKAoq5JPIniyKlkj7di2tAfX9I7UKQJ6EtIckzapHWWm0mImPbmuYOtIS9/MmBElXxDEi9nVQ1c1Li6CukSVApPw/3hJ8utrY3v+wvYKiUHcDQCH6MKbPABjKNa6+XND7X0FaLFws=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QURydi9ReVltY2NtTE5MUkczUWkwOG5xclA4Q3FCUEpUWDNKa1ZFK252OGJV?=
 =?utf-8?B?bThaNzI1Rms1LzRna0g3WjF2b2VLUEZydnkrUm5RWFlxcnBYNk1UWnQvbGNL?=
 =?utf-8?B?WUNweUoxTkY1L3VBT0RPQk54bEttcXZtMkxaV2ZLR21YVGtQekZrZFhkVkRV?=
 =?utf-8?B?SUwrTWVUaGV0d2lRaWNFUTQ2d1BRdTJqV0dZOWtHMFltZXpCY0FNbEJ5ajJm?=
 =?utf-8?B?ZTFDQmhqdzducmROSUpsYk5IblZUNWo4emk1SlRiWnI4M1c4MUF4dm1qb09N?=
 =?utf-8?B?Q1p2Q2FMSFBFRFVJYzJLMnhlMzJkUEkvVzI4YkpmeDRqTmtkbENjck9rMzZG?=
 =?utf-8?B?UW1QbGR1SDB4QVhtbnI4Z2NkMVRhWXlkcmhUY2l0cDdnU0VOVlFmNWNRWjJk?=
 =?utf-8?B?cHF1SHNQVWRmam9ER2lnNTNTOHFqVnovakJ1cWhQa3R6Tm16bnQ0eE95bmNF?=
 =?utf-8?B?UUJDZFRLZStOMVR5MmpLejAvZCtqaVNqY0Vzbld1NGxLS3ZnRDZ3ZkpnTnZm?=
 =?utf-8?B?eGNFYkovS1pWdytTdVdGd3hla09jZDFzTndJTWJyYkd3TFJpOXE1ZzlHZGV2?=
 =?utf-8?B?bWlFamsxSjBIa3V1YlcvdUNSVTRyc2hOVGtQZXNjSVdCZTlVK0hIR0UwRVpm?=
 =?utf-8?B?dE95LzkvUis5M1RvMjc4V2Y1QUp2RVVJL1NOdzJDUHpiWGQxb0JRclpNcEJV?=
 =?utf-8?B?ZjB4SERVaHc4UnV6d1pldU1Mc1JYd1RBdHRlTmVYWWhjY0ZnTS95bk14OEcr?=
 =?utf-8?B?ZTZDVDJ4MzBGRXBDSVQ1clRmbnFxdmxKaDV0VlNmRWhWeXluS1BIYUdKT3hQ?=
 =?utf-8?B?Um5lU2JxaVdXeDlqcnZWcnNLOWdWWU9HeWo4dmhtQS96VHVCTG9SKzZydkR0?=
 =?utf-8?B?eXU0SCswZzBTMGp0NzZnbVBwT2lPTHNHT2tDaThVQy9CajVoUEVndmovUUJk?=
 =?utf-8?B?WG1LKzdONWZOTEtCcDVUWDlEK1dlZ1ZKczNkeVNUV2FwQ0ZLaHJVOWptdmdy?=
 =?utf-8?B?enVoOXRneW1jMUtaQlpmVVRaSFdpL0pkWitkNEI0R2RxeW9PNlFwVXhpUVJy?=
 =?utf-8?B?TmFxenI5SjA4OE1BRDJuMWtZdWZTdkFEcFE3b28xRjl4QVZMNkhXY1NqTHdn?=
 =?utf-8?B?cXVtZzhKUVpTSWJiOGNZWUlLU0cxT1VyTXFzMWJEZjRMSVhTYVBOSEJkWUFH?=
 =?utf-8?B?emltVFVVZHVtenMzdTRjUktPYWtpdGZWeUNITFZmRlJtYVZ2NUdmb0RhMHNh?=
 =?utf-8?B?SFIyTzdWNU9WeHRRaDlrZWZUb3pWVWkweUZyUk1pNDFkR2hacFExS0hodmlz?=
 =?utf-8?B?YzhFTlhXTDJNZTd2UFNCVW1uRDJqRnlCeGxLUE9JaDRUTkhEKzdBc1lXZTF1?=
 =?utf-8?B?SHUxK3I3cDdBTE10WlViMjFab29sUVZZOU90V1pGckU0dDExVmN1U0NTRzVR?=
 =?utf-8?B?Tkt1a2JtYkdVRVN1eUlMZTlKTDJFUERHYjdkZ2pMbUxNU1I0V2xBck9iMG9J?=
 =?utf-8?B?S0hWTHRwNXR1ejd4aThOR2d2cVh1a2hqalNOM1NDS0syTjRuOHk4dDV1QlpC?=
 =?utf-8?B?MEwveXl2citRUDVKK05kNC9iaVhEdzBrMlBmRmUrNjhCaGNlc215VEtZL3RZ?=
 =?utf-8?B?WmtzQURWc3I1K3B1TTlrbTQrM0JaZTlqQmpxNlZtQUtNdEZMZStvUWh5MVc4?=
 =?utf-8?B?VjZmdzFnSFFoTUNYdkI4dWV5Y0RzMEloV0dqcFlna1hXRmlTeE9vVC9LbCty?=
 =?utf-8?B?Vm9RVThROWdsdWhGM0tyZmQ2K1B5M0grcFlxTmhxSDFicWRNYnhrZGJENnFM?=
 =?utf-8?B?Mi9VUE00MDdhMnBsNGs4VDJWNzA1T2RSN21WQ2lRNG53SFp2QTFjTGNIMTZi?=
 =?utf-8?B?QzREYzd1bUErTGx2ZTRpQm9jMFZWRFdWNUZFenRXdDRDNWhHTWlwTWZtRFJs?=
 =?utf-8?B?c2Y0TlRMNU9ReG5HcCtkTnpZcDNnN1RYMDdCMWd5UWlGejdvam1nVElRYXdw?=
 =?utf-8?B?U3VycjJDZFlWb1ZXb3NVd2tGY2ZtQmF6MWFRMDFyV0JrdUZoNGt1ZU5qcWlY?=
 =?utf-8?B?V1UxbGpKNm5ESXBGTzFwaENJZUFtbzh2cGxvWUtSRnFPbElmNEdIYXVpcGkv?=
 =?utf-8?B?eEtVZHY2dExVSmtUalRxUG5hK3dmNXVGaTR2Z0pQejNRM2RSaDVlckZIYUtl?=
 =?utf-8?B?T2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f5e96f6-0b6a-4086-7137-08dc545c5946
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2024 04:04:39.4366 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BrxQRBdK4eWcc7mjATVsk3CwzUepTFZPq3ktRvseiaYcpDXeTnno3FH3QiTXKvUWRLvADEhg5z6hzoEzo3QcwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4635
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

On 04-04-2024 09:24, Karthik Poosa wrote:
> Add macro to check if struct xe_reg has valid address. (Lucas, Badal).
Usually we don't add (reviewer names) in top level commit message. You 
can use Cc: or Suggested-by: which ever appropriate.
> 
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> ---
>   drivers/gpu/drm/xe/regs/xe_reg_defs.h | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_reg_defs.h b/drivers/gpu/drm/xe/regs/xe_reg_defs.h
> index c89ef2b79a3f..42078643be6b 100644
> --- a/drivers/gpu/drm/xe/regs/xe_reg_defs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_reg_defs.h
> @@ -131,4 +131,6 @@ struct xe_reg_mcr {
>   				 .__reg = XE_REG_INITIALIZER(r_,  ##__VA_ARGS__, .mcr = 1)	\
>   				 })
>   
> +#define XE_REG_IS_VALID(r)	((r.addr) ? true : false)
Looks good to me. Please maintain this RB if you float new revisions. 
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
> +
>   #endif
