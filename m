Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAACCCCA462
	for <intel-xe@archiver.kernel.org>; Fri, 16 Oct 2026 13:49:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C3F911284C;
	Fri, 16 Oct 2026 13:49:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70A3610E043;
 Fri, 16 Oct 2026 13:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792158589; x=1823694589;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rTbY/DQgpc1gpBVNcDw54NdF+fBumdoRKGNh9m9cnjE=;
 b=FkKwYTNZfriQR0mPTfch9IdMANDx4km4+Rx7nfCY+TJBLzeojldYjqvW
 E7qU1aXsi3Lbuk1YI/vUdI1Vwp1T/Xh03Osg/WHivIaXQqa2/2CRK9DJR
 SQvyekomOXpsGWa+W/jvazF+1Vdf7R1YxOJ21Do9YQM4LCuEemKpQkwdO
 ErfC8RVDrT8LMsAa4MiNWVq8HQbDRfcwFDvXw9cAEc9wUA1TgMGxiQqly
 QW8HEAOOXLuGaPEWICExEp2UymtH3ZC+zwHMYSGjwQDxxinC3z2z1uqIZ
 NKQTJaVWvQeapxjtteKmdt/HcWbRhuoNu3FaHC6ogD0RZAYOBPiRm48mJ Q==;
X-CSE-ConnectionGUID: LnMXrNPCSuedxNh0Yhsspw==
X-CSE-MsgGUID: Q7NE4qfrTQq7+dc7dsqbdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="942480"
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="942480"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 06:49:48 -0700
X-CSE-ConnectionGUID: fhvR1sTkTQK7Z+CktuErrg==
X-CSE-MsgGUID: O/dK0vjSR3uW2hs6NKlJuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="2197762"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 06:49:47 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 16 Oct 2026 06:49:47 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Fri, 16 Oct 2026 06:49:47 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.52) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 16 Oct 2026 06:49:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QA0G6uxeizdEFNDQIue4w0LA+RLBJThtkCzDaVaPY12esWTg6plgzQvaj8o1TyizYUoMqujYCucCI9vagZkqEb2020U086xUmkwpuZ5/eymLAo0nDFcvEGlHP9tbnbK5l2Xc2jZIWbvedDoA7BW3otDBAr5hHyqyKXjbOVcTNto5J69ffpMepAe1BK02AAh+a3DjvA+ZHGjA0OkQff9GM36yCGh8v38H6ymB7T8Yu+jizO0hg0UsHiDR3PRUx6vqM77xl6o6h+f3sP2A7O2FwNE+KWVy2gXp/Q3ygYIhaIzvBxNZRA8WeF03Ga6jy+tgBYCN3AKqakC7pUw2qcgwMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PeeNsG+SlhXhJCaefrS+c8NtF60jNwK+GXYBDFFelSE=;
 b=EXcnPFHFvAa4/v8yqqvtGonMLEeJR+rz7g3VkV8gT4dtN6ARbyYS+3wjC5SrpXH8/xM4msFeJwgaeasSZ8pnb2Ycu/qF6evyOT4I6AYpFnLzJLLWtfOE4A/e+GefOshGARXZDXMwFCO08cZYfz/w5MqzzApZcmmw41ea6z4CIyZeIsvrhUbAWGlGRfUWlxOVJlb+So1TzlSMY89/8SAlOmIvK2CHBKvdLY4396ZdOHwTIM1B9xTYxA884OborpRlq7DOWLC85ccxhhyBe9SwS5rIbC3zNJR7W1emafCVBPm+i1ZiDFqLoo31KFXnhx9zYJwHxQK6kjTNFJiWHvXQZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7183.namprd11.prod.outlook.com (2603:10b6:8:111::10)
 by IA3PR11MB8940.namprd11.prod.outlook.com (2603:10b6:208:57e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.15; Fri, 16 Oct
 2026 13:49:40 +0000
Received: from DM4PR11MB7183.namprd11.prod.outlook.com
 ([fe80::d9c7:d2fb:680d:1ee1]) by DM4PR11MB7183.namprd11.prod.outlook.com
 ([fe80::d9c7:d2fb:680d:1ee1%6]) with mapi id 15.21.0496.021; Fri, 16 Oct 2026
 13:49:39 +0000
Message-ID: <98843ea9-a6a6-44ea-85fe-270dd84c056c@intel.com>
Date: Fri, 16 Oct 2026 19:19:30 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915/cmtg: Disable CMTG after PSR exit to avoid
 disable timeout
To: Jani Nikula <jani.nikula@linux.intel.com>, "Manna, Animesh"
 <animesh.manna@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Shankar, Uma" <uma.shankar@intel.com>
References: <20260807055452.2997983-1-animesh.manna@intel.com>
 <220f80c2de131ecf25a869bd9218af30fbbe4b54@intel.com>
 <DS0PR11MB8049B57E8E753BDDBEBE62E9F9D12@DS0PR11MB8049.namprd11.prod.outlook.com>
 <636908b4af9b34f638e05e574e18438ef4f28bc2@intel.com>
Content-Language: en-US
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
In-Reply-To: <636908b4af9b34f638e05e574e18438ef4f28bc2@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0132.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d5::9) To DM4PR11MB7183.namprd11.prod.outlook.com
 (2603:10b6:8:111::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7183:EE_|IA3PR11MB8940:EE_
X-MS-Office365-Filtering-Correlation-Id: 99786db7-1936-445d-9702-08df2b8c52c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|6133799003|10067099003|18002099003|22082099003|4143699003|261009223027099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: YrHk+nJV03C7GuW+kBbpzYhWBB5iIq3JDLoKw12I/FaogoE4NekGA3fY8LUFjF4l/eBKRGKtNqrCx1r0n/gni0Idvlwc9Nvk+gmEy+bSYJyvlMzmVrPIz2fOPBuFAGVGQ6wMFkiNRuO8se66O42cqiEA5MAHqAtTGekebDAWUaGynjepRvhZz4oF1mQC6NXjYW6qMel+ojTvOmCvoo0b979OTsCGojkuL8lbN2yaDiG/xPaip+C501BRr3llXuwywBodT04rbn2qhCGXuwnV+t3hNAEwwSVDk+PoZCZReCkC0E2OLt/2D12/j9MgGwq15RNq8IRBWQlWc1TMiBwb2QFHukLnX1785Vz2DEpiBaUxsFJx21FxUTm+0NsljINnvfCDy6szvR60etlI4WWbb0VI9NPFcDm8Ci5+Adg2xH4hwJqYKLRn2JxPjAhDTdz1EaOMhsY56ZQltDswoxAJGRWvepCsapLw91w6QHNub1vqxdnpn46yL/9PEwp5qiW4lrZdSHajsJvCsxEdDf8uNG1nQtKroTxmvkzYVzvZQcNsrkBe0WhnrarUAYPzY5l8C3ncewj4S0AHZNU4FYCDHmPIk0xNIzKlJ30qiIjbTkIR4bTImx4z8IRw+wP0XYIjAPMrXzPMvPOUFviqrZ3adqRcBX8Vkv9zMq5TlvSox50=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7183.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(6133799003)(10067099003)(18002099003)(22082099003)(4143699003)(261009223027099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aUlQbG1lY2gyVTNXV0duK2p0Z1VpaW5UNkFOZnhoOVJ6UUZ4MEFvTHZFSC9a?=
 =?utf-8?B?RzVkOTg1UkI3YkFMOFNvK3hlbndIQ2s5T1FGR0ltek9KRTVHMzV3ZXdNQzVz?=
 =?utf-8?B?TjFNUjEyQm9Bc3k5R3hJTzE4OXhGRzhpYjRKZVBrenlrSjVXREd5VnE0QXdR?=
 =?utf-8?B?bjNZNCs2emNySDVqaXptb2cvbGU0Q212YnY1elF1a20xdWRsbi9udUZ1dHpP?=
 =?utf-8?B?eDNuN3dXRG01eGE1b1JsdGRic1FpdTlGUTV4VW9mMUxxMHJ4VmNSVmhSVFlk?=
 =?utf-8?B?dk9HUkh6VXdJMy91a01COXdONXdMRzNHczZ1ayt2b3E0eGU1UHJzejlPd0I5?=
 =?utf-8?B?aDVjYTZNNDdGV2RCRWVhajVJS0t3VHFhSHdGc1JxRzFwYjJVekdsdmNqdWtY?=
 =?utf-8?B?UVU5YU1JSEs3dm83ZEtoekNDTnQydEp5SDhTMDF1RC8yZi9zZjlvM0pMSUNW?=
 =?utf-8?B?VUJFU1N4N1dLcVY4MTB5NXFMeTkwOWd5Ly9HNlJTbisxbEc2TlRISG9heHJy?=
 =?utf-8?B?QlhKQlo0eU9IZUFGdmdpYndMSXg1cFlQYWFoUGh4aHk5SFlNbWJqb21NNnV4?=
 =?utf-8?B?aHZjbFdoYVdCbExaT2xQVFJSN2lTUTVaZk9zV2wrQTd1NkZYNVNLbk9xcFpE?=
 =?utf-8?B?UUVLMTZ3OUtQU3hkNW1GTFEyblQxMEQ0K2hsa1h2SEc0d3FUdUJ0UjJ1ajRj?=
 =?utf-8?B?eVIyQ3ZpU2pBQmpjSlBxeVZKb0VpV2g3Vi9MWllNaU0xMGlnNmtnK2c5a3Br?=
 =?utf-8?B?OGQzdFRmdHNIT0krd3hzWW1uQzBzRElEdzNQd3EzOStvT2EvdU41S2tObjNx?=
 =?utf-8?B?YmVGOTlBR2R4a0kxQVlyeVpmVFRvUkx4bWxRNDM0ejJwekUwbVoyZVB0UVE4?=
 =?utf-8?B?THgybngzVUd6M0J3SlF3UWxNNTZ2VC92dVp6RHFLRjg1NVYyK0hucjNMSmRW?=
 =?utf-8?B?TTVjQm5yMXY1WVhLVG9qT3g5bE1uTWFKUHdPSDJ5elZwVUVGYjMwaGZ2b0xL?=
 =?utf-8?B?ZUZRNjNncFk5ZXRrMnNWSnZRZGx5Y3JadEs5TTlQT1dkZHZOc09WWkdaNmkr?=
 =?utf-8?B?S3JFaUNBRGpwUldqelNxdVlrdk92ME01Y0x2cTZwbjliVHZWWDBJWVVjZ2Nl?=
 =?utf-8?B?cFhzUVhEeUo4MFhxQXEwSXlFeVlvcVY5Y1JhenYyTDg1a2ZMeXdNTysybk45?=
 =?utf-8?B?OWx4MFF6OGJHSnZEcXRaU1NMeUpiNUR2YW1yZFl4QlB5YXM5R0t0WFVTUDNV?=
 =?utf-8?B?eU42ZEM5N2xnYXpBZTBvVVRkTXJvNG5KL2JIckRtUFliQkVVNnA3MjNMSW04?=
 =?utf-8?B?WDUybmFOUjZCQU5abzdDQVJCMVFjbWNkZ2lrU3JqZC85V3Zibko4Z2N2NUZF?=
 =?utf-8?B?ZThjTXFxanFTbXE1ZWZxRHJObG1tK1ZlSU9lWjc5MENZRi9veTJaVzJxdzhi?=
 =?utf-8?B?QUEzVmJpcUpHZmRGeXloaS83ckdBeDlTMFB6UkpodGlqSFJYRkZvcXhHQ1lw?=
 =?utf-8?B?ZHlhUjlTQUllMDVpYlQ5WHM3K3dISU9qTGRObWZkU2VZQ2F5L3ZlblQvemd3?=
 =?utf-8?B?cXVKaHZUNWthZlh5Uk1lQVVDZFVaQ0k5MGNhcVQ3UTJaT3JQQTY3dUVpZnQr?=
 =?utf-8?B?ZWhyZndvWlZVYTluNUNaVkpITHVkL3crS01Eam1QUzJVOFlXcGRCN0lpMHFn?=
 =?utf-8?B?YUVhd2ZoRitwVWR6VlB1ZkZyVnZiUGdmQithVHF2YzNPUCtUWjR2R2lvT2VP?=
 =?utf-8?B?SVdnRjNyOVFZbjZ4RHIyUXQ4MGxVaXJ3SkVtbUl0RnVSUmF6N3FESDJ0YlVW?=
 =?utf-8?B?RUozUFh0c2M2QVpLdHN6aDl3WkYwaGZXSTJoUnRRdmlKMzFRVDUwVkpyK2lt?=
 =?utf-8?B?ODFBaWZVWFdsenZPMlUwNjIyd1dVY01NNUlEaEV2bVI3Q0pWSUtHbmtkb21p?=
 =?utf-8?B?VFEzMXgrdGVnREpicGZ2NTQwQ1dLdFhEQytqNUcydkhqVWhEL1NhVkJrZmhi?=
 =?utf-8?B?SFlJK0psKzRRUkpxWUpONUhoNXV2UGJ4UWRoNjZTZzAwSGwrMlNqWkk2ZWU0?=
 =?utf-8?B?OTlOUFlxbC95ajNjRk0wQjJyQ3E5eFJnUEpTU2xld1UzcnRuMFpubkNMMnZk?=
 =?utf-8?B?OWdvZ2RFOTVJcngrTUEzTlF6QlFXeDlXak9Xbk5Yam5oWlFqNGFWSDhxeVBw?=
 =?utf-8?B?Sm5tWlZ2QndSZFVDQ2trdWJsNzZ2NjVtR21Ic0V1dUx6SmNCZGRVbWNIbmhj?=
 =?utf-8?B?R1I2NS9VU2ppaE55R1lNeXBZck96N3BkMGYyMXdqdTdUZWp1cGhOUFp2bHNa?=
 =?utf-8?B?dHdyTEVnMmxpKzRJb0Y4alQxRlJVdzhNSExaaDdzY3lWMGdWS1hyNlZEOXl5?=
 =?utf-8?Q?SF5P/3Jn/cJEas773wOOVrYdGk8AZr/KcTE4O?=
X-Exchange-RoutingPolicyChecked: jF47VgB6LRqoSL5vylgWYacWhirBqNEH7TwenJOxMBR/mwVVTxa6uW1sVEPJT0DGFE3YGV6JcDbsqdcId4WfypdTV4K8jam4x/3FibbfCVoGXYYFUy9t+/eMWua54nCh07DRr/Q7HzJI/Wgk0a0tX1ZWQlOrkw21MHzt6bdJfAla6X5IZIBR6cJIzIOkIHZ57HBI9zORBZGl9DgjdJoNqpM8chKzltDFsXGj686M3qFSAnxcC25HZ9PnLgNhkiegDHF+NZHil7MidPTrtxrvIwbE8Bx9Vv3loN8CxAGRTWkWaOO0nyPaRjOXybzDkb6k8AKyyWMY+o8r4KK2h0haFg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 99786db7-1936-445d-9702-08df2b8c52c3
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7183.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 13:49:39.6813 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z/KdpvNV9fziEDA8P7LkPnitvWO2DvdHk2zAL/Jc6PSuS0rzZ5MvdRkPgCzhx4jN9t08ENIwP0dD+Kl67Q9dt0zKUltFAtF6twxAd0Kq14E3pqvW1SEDIkYA3JMUW3xa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB8940
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

On 8/7/2026 1:46 PM, Jani Nikula wrote:
> On Fri, 07 Aug 2026, "Manna, Animesh" <animesh.manna@intel.com> wrote:
>>> -----Original Message-----
>>> From: Jani Nikula <jani.nikula@linux.intel.com>
>>> Sent: Friday, August 7, 2026 1:33 PM
>>> To: Manna, Animesh <animesh.manna@intel.com>; intel-
>>> gfx@lists.freedesktop.org; intel-xe@lists.freedesktop.org
>>> Cc: Manna, Animesh <animesh.manna@intel.com>; Dibin Moolakadan
>>> Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>; Shankar,
>>> Uma <uma.shankar@intel.com>
>>> Subject: Re: [PATCH] drm/i915/cmtg: Disable CMTG after PSR exit to avoid
>>> disable timeout
>>>
>>> On Fri, 07 Aug 2026, Animesh Manna <animesh.manna@intel.com> wrote:
>>>> CMTG is enabled in sync-to-port mode, so its running state
>>>> (CMTG_STATE) can only clear while the port is actively timing. In
>>>> hsw_crtc_disable() the CMTG was torn down at the very beginning of the
>>>> sequence, before the encoders were disabled. At that point PSR may
>>>> still be active on the eDP, leaving the port timing generator idle. As
>>>> a result, after clearing CMTG_ENABLE the wait for CMTG_STATE to clear
>>> never completes and triggers:
>>>>    xe 0000:00:02.0: [drm] CMTG: A disable timeout
>>>>    WARNING: drivers/gpu/drm/i915/display/intel_cmtg.c:205
>>>> intel_cmtg_disable+0x331/0x3d0 [xe]
>>>>
>>>> This is intermittently seen with igt@kms_hdr@bpc-switch-suspend, which
>>>> repeatedly cycles the eDP in and out of PSR across suspend/resume.
>>>>
>>>> Move the CMTG disable to after intel_encoders_disable() (so PSR is
>>>> exited) but before intel_encoders_post_disable()/intel_dpll_disable(),
>>>> so the transcoder timing generator and port PLL are still active while
>>>> CMTG_STATE is polled. The ordering requirement of disabling CMTG
>>>> before the transcoder and port PLL are brought down is preserved.

The new CMTG disable position preserves the ordering before transcoder and PLL shutdown,
so the change in placement seems valid.

However, I traced the PSR flow in the code, with some help from an LLM, and the flow is as follows:
1. `intel_commit_modeset_disables()` calls `intel_pre_plane_update()` for CRTCs requiring a modeset.
2. `intel_pre_plane_update()` reaches `intel_psr_pre_plane_update()`, which calls `intel_psr_disable_locked()` when `intel_crtc_needs_modeset(new_crtc_state)` is true.
3. `intel_psr_disable_locked()` disables PSR/PSR2/Panel Replay, waits for the status to become idle, disables PSR on the sink, and clears `psr.enabled`.
4. After plane disable, `intel_old_crtc_state_disables()` calls `hsw_crtc_disable()`.
5. Later, `intel_encoders_disable()` calls `intel_ddi_disable_dp()`, which calls `intel_panel_unprepare()` and `intel_psr_disable()`. At this point, PSR should already be disabled, making this PSR disable call a no-op.

Based on this flow, PSR exits before `hsw_crtc_disable()` disables CMTG.
Moving the CMTG disable after `intel_encoders_disable()` therefore does not appear
to change the PSR exit ordering.

Is there another PSR flow I might have missed?
Do we have any logs showing that PSR is still active when the CMTG timeout occurs?

Please also add the appropriate `Fixes:` tag.

>>>>
>>>> Cc: Dibin Moolakadan Subrahmanian
>>>> <dibin.moolakadan.subrahmanian@intel.com>
>>>> Cc: Uma Shankar <uma.shankar@intel.com>
>>>> Signed-off-by: Animesh Manna <animesh.manna@intel.com>
>>> Fixes: ?
>>> Cc: stable ?
>> Sure, will add in next version.
> If there is no next version otherwise, you don't have to and should not
> send a new version just to amend these trailers. Just reply with them to
> the patch.
>
> BR,
> Jani.
>
>> Regards,
>> Animesh
>>>> ---
>>>>   drivers/gpu/drm/i915/display/intel_display.c | 18 ++++++++++++++----
>>>>   1 file changed, 14 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/i915/display/intel_display.c
>>>> b/drivers/gpu/drm/i915/display/intel_display.c
>>>> index 829d7a411dcc..cc4d20fdda44 100644
>>>> --- a/drivers/gpu/drm/i915/display/intel_display.c
>>>> +++ b/drivers/gpu/drm/i915/display/intel_display.c
>>>> @@ -1791,15 +1791,25 @@ static void hsw_crtc_disable(struct
>>> intel_atomic_state *state,
>>>>   		intel_atomic_get_old_crtc_state(state, crtc);
>>>>   	struct intel_crtc *pipe_crtc;
>>>>
>>>> -	if (crtc->cmtg.enabled && intel_cmtg_is_allowed(old_crtc_state)) {
>>>> -		intel_cmtg_set_clk_select(old_crtc_state);
>>>> -		intel_cmtg_disable(old_crtc_state);
>>>> -	}
>>>>   	/*
>>>>   	 * FIXME collapse everything to one hook.
>>>>   	 * Need care with mst->ddi interactions.
>>>>   	 */
>>>>   	intel_encoders_disable(state, crtc);
>>>> +
>>>> +	/*
>>>> +	 * Disable CMTG after the encoders are disabled (so PSR is exited) but
>>>> +	 * before the transcoder timing generator and port PLL are torn down
>>> in
>>>> +	 * intel_encoders_post_disable()/intel_dpll_disable(). CMTG is
>>> synced to
>>>> +	 * the port, so its running state (CMTG_STATE) can only clear while
>>> the
>>>> +	 * port is actively timing. Doing this while PSR is still active leaves
>>>> +	 * the port idle and makes the CMTG_STATE clear wait time out.
>>>> +	 */
>>>> +	if (crtc->cmtg.enabled && intel_cmtg_is_allowed(old_crtc_state)) {
>>>> +		intel_cmtg_set_clk_select(old_crtc_state);
>>>> +		intel_cmtg_disable(old_crtc_state);
>>>> +	}
>>>> +
>>>>   	intel_encoders_post_disable(state, crtc);
>>>>
>>>>   	intel_dpll_disable(old_crtc_state);
>>> --
>>> Jani Nikula, Intel

