Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D0A5C43458
	for <intel-xe@archiver.kernel.org>; Wed,  8 Jul 2026 08:14:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FDE410F033;
	Wed,  8 Jul 2026 08:14:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f/z68ypY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02E0E10E495
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Jul 2026 08:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783498485; x=1815034485;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9xfXJRvjtYwylXYg2SwzLcXmlY5W87mCEYQeC5w2z1I=;
 b=f/z68ypYyj3zminCvUtlKz2Su4FOORsIWHjLSQUznz1DOKMlNK5m/QAx
 87Hsuspwz61/qvViXgnchBs0nUi5PBkloCh0/oGuxXAojqua0w5xVKcKn
 GOW2sGu7uRulYxWCK4/ZteCY19AriFNPU9vqM6QO54backq8wrv/t8Fax
 oFzAvDCNQ3nAapcUrMxhxE2PdjqMpu9N/mqzluvJ47pGeGAnbHV1Dx/i9
 oLyeNATpIFfRoVGz+xhx2Ory+aB06BYLAAAri7p0UDU3D3VzDOC9NNznp
 04wQnwniXvnfXqQanqOcjid4eR8PjYNFZrTEQBbDbI/gZerNejN5nVc0+ w==;
X-CSE-ConnectionGUID: 1vTIUGnwQt+x1MQjrTyczQ==
X-CSE-MsgGUID: gsFJkvrGRqSh2APtLL8PIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="94797545"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="94797545"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2026 01:14:44 -0700
X-CSE-ConnectionGUID: DoEijtzGTKqMGMqkx0BxiA==
X-CSE-MsgGUID: Z0mVj8pyTTOwQga9ZSV7hA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="253141507"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2026 01:14:44 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 8 Jul 2026 01:14:43 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 8 Jul 2026 01:14:43 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.5) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 8 Jul 2026 01:14:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jci9PM56jS8PkepUY8iR4I9Mykd7w2yk1CBkpFtRjPvoBjuZS2tyP9w2PGXCankrqjijoKGWNtarCuAQWF/cxPcQwsVf81kdwZgMZitOP7Xv4gW+lG+vmHWzsPa+9EIeSq7WmfmbbgtxKsYVY8jQhVtdQai+4+KHp0CxAUAm9EVz2/p6rCN4QMvn0ECm8Rjm822d2RqDuPAXLDEO2HMnnguZv1XUEpF884JA6m6XgN9uP4/5DWeCW+Orbywzx7/8TsI6dVMlUyFI7dpN1vr1HjqyEKC99sI26b0VuY0JqLNXB6JxlKK1gupQ1KHiVHcCgneJuy8F8QgsWvo443Rd8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=byqxYrPIa3I6HnedKQdL4Itapr+luyT42CT09G8jaNI=;
 b=xyc0I4+J9xTtWCSK2mcj6p5vxP8mdHsXdLLFAA/xZl6yPL1CWRNxn9czYs3cXnxvShH5JTHukbRAYdImGj+7IkfRcu4f5YCQ1gl6pDtpH7bs3FGopSI+LslKMQnhY32WQBX9wtgb32C+IrmEnCrHiyfsg8Jva45n9kHzKuSklb8TAZZ7NiKhPsiwTOQArgQm0TJ/DzEr+ubzCLYiXITLOS0JayzvLPqot5iKbF5DjPnj93jHzmquiw5thRdbjatwTtvrkc8k7ix9pO3VCho9asQ28bigUwX6S9ljCBfUiaSWapI9FVkIU0ooetG1vZuLCGkklzfsVMWu1ArAozfW1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8706.namprd11.prod.outlook.com (2603:10b6:610:1d1::22)
 by DSVPR11MB9696.namprd11.prod.outlook.com (2603:10b6:8:352::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 8 Jul 2026
 08:14:36 +0000
Received: from CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d]) by CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d%6]) with mapi id 15.21.0181.009; Wed, 8 Jul 2026
 08:14:35 +0000
Message-ID: <c2eb9860-0fdb-42ef-a6f6-aad3cb700429@intel.com>
Date: Wed, 8 Jul 2026 13:44:26 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/1] drm/xe/xe_ras: Add RAS GPU health indicator
To: "Tauro, Riana" <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <raag.jadav@intel.com>,
 <ravi.kishore.koppuravuri@intel.com>, <mallesh.koujalagi@intel.com>,
 <andi.shyti@intel.com>, <rodrigo.vivi@intel.com>
CC: <anoop.c.vijay@intel.com>
References: <20260708061221.4006706-3-soham.purkait@intel.com>
 <20260708061221.4006706-4-soham.purkait@intel.com>
 <1642a35e-36f4-4930-b9f4-c4a64105fa06@intel.com>
 <9d18fe09-196d-4766-b82e-5561de15dec7@intel.com>
 <2d2dff48-2955-441a-bd63-4f56a56cfabe@intel.com>
Content-Language: en-US
From: "Purkait, Soham" <soham.purkait@intel.com>
In-Reply-To: <2d2dff48-2955-441a-bd63-4f56a56cfabe@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0037.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d6::11) To CH3PR11MB8706.namprd11.prod.outlook.com
 (2603:10b6:610:1d1::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8706:EE_|DSVPR11MB9696:EE_
X-MS-Office365-Filtering-Correlation-Id: 130e35f8-8af5-4173-b7c2-08dedcc8f2ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|921020|22082099003|4143699003|5023799004|3023799007|11063799006|56012099006|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: HEzda+NLBmWEpoChS7JFKq0g45q/5/dzXjbtK4J4kwuvOgpkWtnVkca+p0uekbHaeus4CcOJPCzt1SxEhlb/LZtHK0D3kcKhQXjHFihvMb1gd28Sh7mSCjWlXAmn8jT5VRTBqi2m8sEzWN1sYbjJFFCRFt6kM9U+YUx2AeQ8lgjop8mtjPAkOigzVQKL7JlAPBFfB1ipqQotiuQDTj8sDM/BDBnoZS95eftje5HeJFzCeMlYL2KETkTj0sz/Y/fqdlkyUGgTONAwTBf09PG40hucrpF3z3Dqhkmdd8ZcFkcxb2Vu0mPUKhdJe5TCkCvSSCiUYx9UmjqY9APTidJp8Dj04CCTx4u4bVFEQqOe5WYEGhkOIEcmpE19i2IV8FbrxjHrEC1wS628b7M7CH63GhVW3mRjyRktmtu64TmooCSBYAEv/0rVivl/zumBM/IwYGfFw0Nd8pJ30XSU2sN4qFc1Vc3UzTeePKz3U3CSBkzXvl79LgdI7U4shBCRzoVq9eQe9Jb4/feibNdVUP4qey1taSFgUk/q3B1shnOc/8sa0vMqCcc8zRbFB4SsDVbe1EAH8RJfhErCviLer6wYouA/enC0znPdKx76v8nQkC9btoGO3NFY5pFwyueRd+h6/pUJix9MrDA2pieS7o0KI+rjVwucK5JJ7dVCCWCX8dsi7MuyrmANHJ0R6NqACwxZV5v6ec4xvWKn/OLV7VtOyQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8706.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(921020)(22082099003)(4143699003)(5023799004)(3023799007)(11063799006)(56012099006)(18002099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b3JiUG5DcGEvTTQrdVFRNHI3Q1MxYkdXRStteHZTdkIxamhmOHBYL3lZZldx?=
 =?utf-8?B?Zzc0M1IyTGw1L0VsU1lmdmtVZkVRUzZSSVFFRnBaRDZ6VmdLNndmODFaN3pX?=
 =?utf-8?B?UjZIZGovSTlXY1FTVlhxU2dBOWRhWi85YVVUbzZrb2k1Vm9ZSkV4VktlelZU?=
 =?utf-8?B?cVZocUxnNS9xdDZsdDI0N0lTOGJHclYrZVc5U2xMMWxnU0lpZmFpejJadmt0?=
 =?utf-8?B?U21XWWlrN2s5Y0V6R0FyaEhyM3A4SC9jdjBHS05NbFpqU1E1TDZvNFp6VEgr?=
 =?utf-8?B?SEw3S0VsUHNqQ3ZMdHA1VzZxS3NvUCtZbGppQkpTM2RNd2oxKy84Sk5uQzlS?=
 =?utf-8?B?d0QrQU8vOFZjWlpHKzhKTUY5YUlIWjlkLzVPTFhvZXcxZWRqQmYyYUhoV1FW?=
 =?utf-8?B?Uk1RTUJHVmFuNm5ab0pxU0x3aGMyMlkxNkhjb3F1NlJKa1pZU01IeTI0bVhL?=
 =?utf-8?B?ZWw4bVFXTzR2YkJ5RXpldm9uVk9zWG44SXl6V1lkZHJHZkR2MGwwTTBuVmYv?=
 =?utf-8?B?YjNYVHdqUXRPanZNd1Q1c2pHMVdESUR6QVNUczFidzh0aDJMQXEzYk56VnRv?=
 =?utf-8?B?aXRQeGR6Vm13ZEFobHhWTEk3YjhTYVR4bnV2Wk1QcEtsWHpXMkpKV1g3Sm05?=
 =?utf-8?B?RGxMbjQ2emxpWjhhOHd5emdDTkY0U3pyVU5Cc0d6WEYxclZVOWU0WHlqcTQr?=
 =?utf-8?B?NldIVEk1Rzdvb0UzMHcxZ294c3BSaVhjbmdGZ1gzdllueWhuSnErbEU1VkFi?=
 =?utf-8?B?VVYvS2NBN2c0MXBTMW5qU01jTmtweDhYbDlubStzYnBDbTZDY2lpOEdIZUpm?=
 =?utf-8?B?RkJwdWtxV24zRkxKMWJZZWszc05IZ0N3dEhINDU3d2xNbTRveDFINkRJRTZS?=
 =?utf-8?B?TTFWT2xVZVJ3NjBHN3A0eTdhWlZSeEd3YWZlY1lqSjk4dXQ3Tm9zLzRVd3NH?=
 =?utf-8?B?WXpFNk9tU3plc0J1YVNqOXExY2ZjelVOUitSVmFQNW1IOXpDVVdjRW0vdkRo?=
 =?utf-8?B?bVNQc3MzRjJvWmM1NGJhVkFDWE8yU3puRXhseC9QS2x0WWJtMG5reGpLeC9S?=
 =?utf-8?B?SHRNVkFyTVJOb1RJTWlwOEQvZnFuaFJHVUZIMzFweTVCYkNZdVd2a2VsZGEz?=
 =?utf-8?B?clZSOTY2NVBUM2xCd3lCQ2luRDE1SVFYaUU5VTlYZWY3V2U5OXlMTXdrOU91?=
 =?utf-8?B?S3hxakdadWJNTk1VajV3OGpsNmwrVlMvYmNJeEhuZk43dUQ5ek5DSEVsVVhP?=
 =?utf-8?B?NWcvMnlUQjZ3alhVL09FVWQyMVlPbzlIN2N3WVlJNFUvMGpKcEhiYWJ4cUgv?=
 =?utf-8?B?eVd3bG03MGNlWU9VeXd2emhZbXF0b3BnYmxJdGxtdEZMMW1EWUwvOTlYMUVH?=
 =?utf-8?B?YTBzYzE1VUpBYzRuYTQ1SlM0cTQzK29RYkJUYVREK2ZxRHZBcEVmOTVhU3la?=
 =?utf-8?B?alMrNVRGajhpSTJtQ3R2WmRLMTl0MTNSR3UxdmRESDhaSUY1SWdxR3ZiajFB?=
 =?utf-8?B?d3NqZGdONHF4eEtxMWpXWnVBb0dCckhqUmcwOHVDUjM2bEphcllBTy9hT09N?=
 =?utf-8?B?MjFMOFhKbm5Jdzc0STFFeXh1VEs5MXlSNWhxcHptMm1DSmFmd3E0WlI4WENZ?=
 =?utf-8?B?L3ZZMlk4dmx4Z3IrVHJqaWFxaHdMMC8rWFBrRmc3Z1JnV1NCbmR1V0ROSWs3?=
 =?utf-8?B?L1RmRXo1R1FyS1Y2bVN0cHFCcHhMckJPeTFZaEtKcGNCZnJnSVJLTUNYREVs?=
 =?utf-8?B?dG1UYXozSGdLK0lLdVVyNis5Y2NiN1ZJdEowWXdvcFNncmZhdWRtdVBmVzVC?=
 =?utf-8?B?UXJBSTZydG1PUjBHYVV2RzRXU1FwQlVpeWVaWERtekZseHdxa1IwSXRnNzF3?=
 =?utf-8?B?S3RyR2VMOFVvc3Iwdk4zQXlxamNPcTB1aEdSaE5MQmIydk1SSTZIbUcweGVr?=
 =?utf-8?B?YVhWT1RtMTFyK2pxR25mNDNKSGQwellvbFhkc1lxd053ZFhmKzhNRUxWeEJm?=
 =?utf-8?B?bE5rSHJ2bm9RSm4rem01ejB0UzJBWS9nS1NRajlnYTNmTkdHdGhVeGswM0pD?=
 =?utf-8?B?MzJYaTZFUVBTTUcwdHg1VGNyQUJvZWJpckJJN3Jyb1VKWUZhZ1k5TjBxMVNZ?=
 =?utf-8?B?U2JHREhFMEE0YnhhSE16elBkNWd3dXBEaEY1V2dZMXF0WFMraGJEc0NKaHJS?=
 =?utf-8?B?SG5BSDV6WS93MDZsbjBkVmdValJ6WitORkxoNEhOY3BqaEw5MUoydmkwUFdV?=
 =?utf-8?B?Z3BqbzllanNDcUtUUElESDdrNE9acmZMQngzcFhpaDA3VmpzYVZCclNxYTM2?=
 =?utf-8?B?OFV0dUJzK2FqNnhHbkdMMmlCZmJkQnZsRGloQ3pOYTRhWUovRnV4bkFZSmJL?=
 =?utf-8?Q?CuTWMoNKSB7+M/YA=3D?=
X-Exchange-RoutingPolicyChecked: eNJgiNpju2ECIjgVcik+TmgL4ajpXD64FBjqymb2byQR9bggoLU6EMo6P97nnG3CPLy78nHN+aOOHGDUuFsH/6lsZi2PysQR2aJRPT5B4v+UjXqYQg5Z1kyLes8g+6vI3kSF2zoQ3vhfAe2ye4n+h9AvdPIM7MTxMMLcXCJJP6XamFVilDHga8WW6eiEnoSc1wkMigiHtKZKy39RSDgzRE1ZEMKjssygedi4s4XSZOqivG4EdtPPvVRxILklPTwwEBrLXYBdi0EVVq9Eq8kW6PnQOh9JyuTSahby3PzwSezJTqlMGEzxFtXRJarE2xv/e4JXu077xD+BRPhrCa1vqw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 130e35f8-8af5-4173-b7c2-08dedcc8f2ab
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8706.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 08:14:35.8198 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i6AWO/HOa6c/rlhZl+7g6hgoK6vsoKL0VLQhkn5mtlMA8AMkjMGFyKTjiaU/mNdrgt3wVJIkC3eVP+WP7AES0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR11MB9696
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


On 08-07-2026 13:31, Tauro, Riana wrote:
>
> On 08-07-2026 13:27, Purkait, Soham wrote:
>> Hi Riana,
>>
>> On 08-07-2026 13:10, Tauro, Riana wrote:
>>>
>>> On 08-07-2026 11:42, Soham Purkait wrote:
>>>> Add a sysfs interface that reports the current GPU health state and
>>>> lets admin users and management tools update it but is readable by all
>>>> users. Requests are routed through the sysctrl mailbox. The interface
>>>> is present only on platforms that support the GPU health indicator.
>>>>
>>>> The interface is a single read/write file at the device level:
>>>>
>>>>    $ cat /sys/.../device/gpu_health
>>>>    ok
>>>>
>>>>    $ echo critical > /sys/.../device/gpu_health
>>>>
>>>>    $ cat /sys/.../device/gpu_health
>>>>    critical
>>>>
>>>> v1:
>>>>   - Add enum for health status. (Andi, Rodrigo)
>>>>   - Return error number instead of error message in _show/_store. 
>>>> (Andi)
>>>>   - Move GPU health sysfs init error logging to xe_ras_init. (Andi)
>>>>   - Return only the current health state for sysfs read. (Andi, 
>>>> Rodrigo)
>>>>   - Add documentation for sysfs interface. (Andi, Rodrigo)
>>>>
>>>> v2:
>>>>   - Make logs and structures consistent with their counterparts. 
>>>> (Riana)
>>>>   - Drop unnecessary variables. (Andi, Riana)
>>>>   - Add correct KernelVersion. (Raag)
>>>>
>>>> v3:
>>>>   - Add missing blank line before #endif. (Badal)
>>>>
>>>> v4:
>>>>   - Add consistent "gpu" nomenclature to the gpu health indicator
>>>>     DOC blocks. (Riana)
>>>>   - Add Kdoc for gpu health indicator. (Anshuman)
>>>>
>>>> v5:
>>>>   - Rename struct fields to response.health, request.health. 
>>>> (Riana, Raag)
>>>>   - Use devm_device_add_group instead of custom sysfs init/fini. 
>>>> (Raag)
>>>>   - Rename health enum to shorter XE_RAS_HEALTH_*, drop redundant
>>>>     invalid-input log, and minor log/format cleanups. (Raag)
>>>>
>>>> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
>>>> Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
>>>> Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
>>>> ---
>>>>   .../ABI/testing/sysfs-driver-intel-xe-ras     |  30 ++++
>>>>   Documentation/gpu/xe/xe_device.rst            |   9 ++
>>>>   drivers/gpu/drm/xe/xe_ras.c                   | 139 
>>>> ++++++++++++++++++
>>>>   drivers/gpu/drm/xe/xe_ras_types.h             |  57 +++++++
>>>>   drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |   4 +
>>>>   5 files changed, 239 insertions(+)
>>>>   create mode 100644 
>>>> Documentation/ABI/testing/sysfs-driver-intel-xe-ras
>>>>
>>>> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-ras 
>>>> b/Documentation/ABI/testing/sysfs-driver-intel-xe-ras
>>>> new file mode 100644
>>>> index 000000000000..9612b97b0f88
>>>> --- /dev/null
>>>> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-ras
>>>> @@ -0,0 +1,30 @@
>>>> +What:        /sys/bus/pci/drivers/xe/.../gpu_health
>>>> +Date:        April 2026
>>>> +KernelVersion:    7.2
>>>> +Contact:    intel-xe@lists.freedesktop.org
>>>> +Description:
>>>> +        This file exposes the current gpu health state and allows 
>>>> the gpu
>>>> +        health state to be updated.
>>>> +
>>>> +        This sysfs file is present only on Intel Xe platforms that 
>>>> support
>>>> +        the gpu health indicator interface for RAS. Reading the 
>>>> current
>>>> +        health state is available to all users, while updating the 
>>>> health
>>>> +        state is restricted to administrative users only.
>>>> +
>>>> +        Read returns a single line containing one of the valid 
>>>> values for
>>>> +        the current gpu health state. Writing one of the valid values
>>>> +        updates the current gpu health state.
>>>> +
>>>> +        The valid values for the gpu health state are:
>>>> +
>>>> +            ok
>>>> +                The gpu is healthy and operating within normal
>>>> +                parameters.
>>>> +
>>>> +            warning
>>>> +                The gpu is experiencing minor issues but remains
>>>> +                operational.
>>>> +
>>>> +            critical
>>>> +                The gpu is in a critical state and may not be
>>>> +                operational.
>>>> diff --git a/Documentation/gpu/xe/xe_device.rst 
>>>> b/Documentation/gpu/xe/xe_device.rst
>>>> index 39a937b97cd3..6fdba960c2d9 100644
>>>> --- a/Documentation/gpu/xe/xe_device.rst
>>>> +++ b/Documentation/gpu/xe/xe_device.rst
>>>> @@ -8,3 +8,12 @@ Xe Device Wedging
>>>>     .. kernel-doc:: drivers/gpu/drm/xe/xe_device.c
>>>>      :doc: Xe Device Wedging
>>>> +
>>>> +.. _xe-gpu-health-indicator:
>>>
>>> Where is this used?
>>>
>>>> +
>>>> +====================
>>>> +GPU Health Indicator
>>>> +====================
>>>> +
>>>> +.. kernel-doc:: drivers/gpu/drm/xe/xe_ras.c
>>>> +   :doc: GPU Health Indicator
>>>> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
>>>> index 74d5016d9ffe..d1214a213d6e 100644
>>>> --- a/drivers/gpu/drm/xe/xe_ras.c
>>>> +++ b/drivers/gpu/drm/xe/xe_ras.c
>>>> @@ -65,6 +65,13 @@ static const char *const xe_ras_components[] = {
>>>>   };
>>>>   static_assert(ARRAY_SIZE(xe_ras_components) == XE_RAS_COMP_MAX);
>>>>   +static const char * const gpu_health_states[] = {
>>>
>>> status or states. Use any one consistently.
>>>
>>>> +    [XE_RAS_HEALTH_OK]        = "ok",
>>>> +    [XE_RAS_HEALTH_WARNING]        = "warning",
>>>> +    [XE_RAS_HEALTH_CRITICAL]    = "critical",
>>>> +};
>>>> +static_assert(ARRAY_SIZE(gpu_health_states) == XE_RAS_HEALTH_MAX);
>>>> +
>>>>   static u8 drm_to_xe_ras_severity(u8 severity)
>>>>   {
>>>>       switch (severity) {
>>>> @@ -332,6 +339,132 @@ int xe_ras_clear_counter(struct xe_device 
>>>> *xe, u8 severity, u8 component)
>>>>       return 0;
>>>>   }
>>>>   +static ssize_t gpu_health_show(struct device *dev, struct 
>>>> device_attribute *attr, char *buf)
>>>> +{
>>>> +    struct xe_ras_get_health_response response = {0};
>>>> +    struct xe_sysctrl_mailbox_command command = {0};
>>>> +    struct xe_ras_get_health_request request = {0};
>>>> +    struct xe_device *xe = kdev_to_xe_device(dev);
>>>> +    const char *health;
>>>> +    size_t rlen;
>>>> +    int ret;
>>>> +
>>>> +    xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP, 
>>>> XE_SYSCTRL_CMD_GET_HEALTH,
>>>> +                  &request, sizeof(request), &response, 
>>>> sizeof(response));
>>>> +    guard(xe_pm_runtime)(xe);
>>>> +    ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
>>>> +    if (ret) {
>>>> +        xe_err(xe, "sysctrl: failed to get health %d\n", ret);
>>>> +        return ret;
>>>> +    }
>>>> +
>>>> +    if (rlen != sizeof(response)) {
>>>> +        xe_err(xe, "sysctrl: unexpected get health response length 
>>>> %zu (expected %zu)\n",
>>>> +               rlen, sizeof(response));
>>>> +        return -EIO;
>>>> +    }
>>>> +    if (response.health >= XE_RAS_HEALTH_MAX) {
>>>> +        xe_err(xe, "sysctrl: invalid health state %u\n",
>>>> +               response.health);
>>>> +        return -EIO;
>>>> +    }
>>>> +
>>>> +    health = gpu_health_states[response.health];
>>>> +
>>>> +    xe_dbg(xe, "[RAS]: get health: %s\n", health);
>>>> +
>>>> +    return sysfs_emit(buf, "%s\n", health);
>>>> +}
>>>> +
>>>> +static ssize_t gpu_health_store(struct device *dev, struct 
>>>> device_attribute *attr,
>>>> +                const char *buf, size_t count)
>>>> +{
>>>> +    struct xe_ras_set_health_response response = {0};
>>>> +    struct xe_sysctrl_mailbox_command command = {0};
>>>> +    struct xe_ras_set_health_request request = {0};
>>>> +    struct xe_device *xe = kdev_to_xe_device(dev);
>>>> +    const char *health;
>>>> +    size_t rlen;
>>>> +    int state;
>>>> +    int ret;
>>>> +
>>>> +    state = sysfs_match_string(gpu_health_states, buf);
>>>> +    if (state < 0)
>>>> +        return -EINVAL;
>>>> +
>>>> +    request.health = state;
>>>> +
>>>> +    xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP, 
>>>> XE_SYSCTRL_CMD_SET_HEALTH,
>>>> +                  &request, sizeof(request), &response, 
>>>> sizeof(response));
>>>> +    guard(xe_pm_runtime)(xe);
>>>> +    ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
>>>> +    if (ret) {
>>>> +        xe_err(xe, "sysctrl: failed to set health %d\n", ret);
>>>> +        return ret;
>>>> +    }
>>>> +
>>>> +    if (rlen != sizeof(response)) {
>>>> +        xe_err(xe, "sysctrl: unexpected set health response length 
>>>> %zu (expected %zu)\n",
>>>> +               rlen, sizeof(response));
>>>> +        return -EIO;
>>>> +    }
>>>> +
>>>> +    ret = ras_status_to_errno(response.status);
>>>> +    if (ret) {
>>>> +        xe_err(xe, "sysctrl: set health command failed with status 
>>>> %#x\n",
>>>> +               response.status);
>>>> +        return ret;
>>>> +    }
>>>> +
>>>> +    if (response.health >= XE_RAS_HEALTH_MAX) {
>>>> +        xe_err(xe, "sysctrl: invalid health state %u\n",
>>>> +               response.health);
>>>> +        return -EIO;
>>>> +    }
>>>> +
>>>> +    health = gpu_health_states[response.health];
>>>> +
>>>> +    xe_dbg(xe, "[RAS]: set health: %s\n", health);
>>>> +
>>>> +    return count;
>>>> +}
>>>> +
>>>> +static DEVICE_ATTR_RW(gpu_health);
>>>> +
>>>> +static struct attribute *gpu_health_attrs[] = {
>>>> +    &dev_attr_gpu_health.attr,
>>>> +    NULL,
>>>> +};
>>>> +
>>>> +/**
>>>> + * DOC: GPU Health Indicator
>>>> + *
>>>> + * On Intel Xe platforms that support the GPU health indicator 
>>>> interface,
>>>> + * the driver exposes a sysfs attribute at the device level as:
>>>> + *
>>> code block would be appropriate
>>>
>>>> + * ``/sys/bus/pci/drivers/xe/<BDF>/gpu_health``
>>>> + *
>>>> + * Reading the attribute returns a single line containing the 
>>>> current GPU
>>>> + * health state. Writing one of the valid values updates the same. 
>>>> Reads
>>>> + * are available to all users; writes are restricted to 
>>>> administrative
>>>> + * users only (attribute permissions ``0644``).
>>>
>>> Can these be set by firmware too? Worth mentioning incase an admin 
>>> had never set
>> Does this  falls under the scope of this doc ? 
>
>
> I am asking.  Do you know if firmware is allowed to set it too? Or is 
> it only admin.
> If as a admin i am reading this document i see that only i am allowed 
> to set. 
Then It could be explicitly mentioned that :  for only inbound cases.
As reset of the part is out of the scope of this doc.
>>> the value and sees a warning.
>>>
>>> Do we need to mention when user needs to use this?
>>>
>>>
>>>> + *
>>>> + * The valid values for the GPU health state are:
>>>> + *
>>>> + * - ``ok``:
>>>> + *    The GPU is healthy and operating within normal parameters.
>>>
>>> Have you generated the document?
>> yes.
>
> Any reason for having the description and the status in different lines?
Just for the aesthetics nothing else.

Thanks,
Soham
>
> Thanks
> Riana
>
>>
>> Thanks,
>> Soham.
>>>
>>>> + * - ``warning``:
>>>> + *    The GPU is experiencing minor issues but remains operational.
>>>> + * - ``critical``:
>>>> + *    The GPU is in a critical state and may not be operational.
>>>> + *
>>>> + * See Documentation/ABI/testing/sysfs-driver-intel-xe-ras for the 
>>>> ABI
>>>> + * specification.
>>>> + */
>>>> +static const struct attribute_group gpu_health_group = {
>>>> +    .attrs = gpu_health_attrs,
>>>> +};
>>>> +
>>>>   /**
>>>>    * xe_ras_init - Initialize Xe RAS
>>>>    * @xe: xe device instance
>>>> @@ -340,6 +473,8 @@ int xe_ras_clear_counter(struct xe_device *xe, 
>>>> u8 severity, u8 component)
>>>>    */
>>>>   void xe_ras_init(struct xe_device *xe)
>>>>   {
>>>> +    int ret;
>>>> +
>>>>       if (!xe->info.has_drm_ras)
>>>>           return;
>>>>   @@ -350,4 +485,8 @@ void xe_ras_init(struct xe_device *xe)
>>>>         if (IS_ENABLED(CONFIG_PCIEAER))
>>>>           ras_usp_aer_init(xe);
>>>> +
>>>> +    ret = devm_device_add_group(xe->drm.dev, &gpu_health_group);
>>>> +    if (ret)
>>>> +        xe_err(xe, "Failed to initialize GPU health sysfs, 
>>>> err=%d\n", ret);
>>>>   }
>>>> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h 
>>>> b/drivers/gpu/drm/xe/xe_ras_types.h
>>>> index 6688e11f57a8..4c4fbc42c956 100644
>>>> --- a/drivers/gpu/drm/xe/xe_ras_types.h
>>>> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
>>>> @@ -10,6 +10,21 @@
>>>>     #define XE_RAS_NUM_COUNTERS            16
>>>>   +/**
>>>> + * enum xe_ras_health_status - gpu health status values
>>>> + *
>>>> + * @XE_RAS_HEALTH_OK: gpu is healthy and operating normally.
>>>> + * @XE_RAS_HEALTH_WARNING: gpu has minor issues but is still 
>>>> operational.
>>>> + * @XE_RAS_HEALTH_CRITICAL: gpu is in a critical state and may not 
>>>> be operational.
>>>> + * @XE_RAS_HEALTH_MAX: Sentinel value for validation
>>>> + */
>>>> +enum xe_ras_health_status {
>>>
>>> If you removed status from enum, remove from name as well.
>>>
>>>> +    XE_RAS_HEALTH_OK = 0,
>>>> +    XE_RAS_HEALTH_WARNING,
>>>> +    XE_RAS_HEALTH_CRITICAL,
>>>> +    XE_RAS_HEALTH_MAX
>>>> +};
>>>> +
>>>>   /**
>>>>    * struct xe_ras_error_common - Error fields that are common 
>>>> across all products
>>>>    */
>>>> @@ -121,4 +136,46 @@ struct xe_ras_clear_counter_response {
>>>>       /** @reserved1: Reserved for future use */
>>>>       u32 reserved1[3];
>>>>   } __packed;
>>>> +
>>>> +/**
>>>> + * struct xe_ras_get_health_request - Request structure for 
>>>> obtaining gpu health
>>>> + */
>>>> +struct xe_ras_get_health_request {
>>>> +    /** @reserved: Reserved for future use. */
>>>> +    u32 reserved[2];
>>>> +} __packed;
>>>> +
>>>> +/**
>>>> + * struct xe_ras_get_health_response - Response structure for 
>>>> obtaining gpu health
>>>> + */
>>>> +struct xe_ras_get_health_response {
>>>> +    /** @health: Current gpu health, see &enum 
>>>> xe_ras_health_status */
>>>> +    u8 health;
>>>> +    /** @reserved: Reserved for future use */
>>>> +    u8 reserved[3];
>>>> +} __packed;
>>>> +
>>>> +/**
>>>> + * struct xe_ras_set_health_request - Request structure for 
>>>> setting gpu health
>>>> + */
>>>> +struct xe_ras_set_health_request {
>>>> +    /** @health: New gpu health to set, see &enum 
>>>> xe_ras_health_status */
>>>
>>>
>>> Let's use short description . "gpu health to be set" or just gpu health
>>>
>>>> +    u8 health;
>>>> +    /** @reserved: Reserved for future use */
>>>> +    u8 reserved[3];
>>>> +} __packed;
>>>> +
>>>> +/**
>>>> + * struct xe_ras_set_health_response - Response structure for 
>>>> setting gpu health
>>>> + */
>>>> +struct xe_ras_set_health_response {
>>>> +    /** @status: Status of set health operation, see &enum 
>>>> xe_ras_response_status */
>>>> +    u32 status;
>>>> +    /** @health: Resulting current gpu health, see &enum 
>>>> xe_ras_health_status */
>>> Let's use short description . "current gpu health" or just gpu health
>>>> +    u8 health;
>>>> +    /** @reserved: Reserved for future use */
>>>> +    u8 reserved[3];
>>>> +    /** @reserved1: Reserved for future use */
>>>> +    u32 reserved1[2];
>>>> +} __packed;
>>>>   #endif
>>>> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h 
>>>> b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>>>> index 6e3753554510..d4da6e9ef774 100644
>>>> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>>>> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>>>> @@ -25,11 +25,15 @@ enum xe_sysctrl_group {
>>>>    * @XE_SYSCTRL_CMD_GET_COUNTER: Get error counter value
>>>>    * @XE_SYSCTRL_CMD_CLEAR_COUNTER: Clear error counter value
>>>>    * @XE_SYSCTRL_CMD_GET_PENDING_EVENT: Retrieve pending event
>>>> + * @XE_SYSCTRL_CMD_GET_HEALTH: Retrieve current health status
>>>
>>> gpu health
>>>
>>> Thanks
>>> Riana
>>>
>>>> + * @XE_SYSCTRL_CMD_SET_HEALTH: Set new health status
>>>>    */
>>>>   enum xe_sysctrl_gfsp_cmd {
>>>>       XE_SYSCTRL_CMD_GET_COUNTER        = 0x03,
>>>>       XE_SYSCTRL_CMD_CLEAR_COUNTER        = 0x04,
>>>>       XE_SYSCTRL_CMD_GET_PENDING_EVENT    = 0x07,
>>>> +    XE_SYSCTRL_CMD_GET_HEALTH        = 0x0B,
>>>> +    XE_SYSCTRL_CMD_SET_HEALTH        = 0x0C,
>>>>   };
>>>>     /**
