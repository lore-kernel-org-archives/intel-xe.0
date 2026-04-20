Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D363F36C49
	for <intel-xe@archiver.kernel.org>; Mon, 20 Apr 2026 07:48:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 023EF10EC63;
	Mon, 20 Apr 2026 07:48:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JKbsYB1p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FEF410EC5F
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Apr 2026 07:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776671332; x=1808207332;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Qt3HEu+qzg0W+KNkxwXmT/1wgKiYTyNF1CYJFKFa/YU=;
 b=JKbsYB1pBUkIu17ia/5gajL4WJlVVCueNru3k0ijMmmY5F+PsHqqbQ7B
 IzxRAkZgqM0lMLCeZ6q0Nsq1USGa4Pd6k2MyciFNRWfkq28dubSK9k/Oe
 GFxDYJYzLjUlHWgiuTcZeXe9o6zJut61+fmur8eYbWMeerOeOQDbQP+Jf
 +ySW3Sla3UJ88MdFVWhhBzcGidMxGHUmmKXfwLkj9lKW1tgvEu9RKqF+f
 ig5cPIa2+3tnw4f+N3zrb54Er6XEJH/qgwDu8C1BdgdS0NedWcMolBKBZ
 JAWOb/FmTnTOQW+4JAAHwcVmqCfHZf4eHakRLXHTrw6Qlvb1FgFvxDv7c g==;
X-CSE-ConnectionGUID: 6Ko/ZnVITW+9++aVaJSwbg==
X-CSE-MsgGUID: Qd0TcygpSy6J5E+Egku7kg==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="76607862"
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; d="scan'208";a="76607862"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2026 00:48:52 -0700
X-CSE-ConnectionGUID: vsZCAJgUT2W2hcWlyUiV5Q==
X-CSE-MsgGUID: 2k1kKS60SMaXHfJx7B7quw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; d="scan'208";a="236630935"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2026 00:48:53 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 20 Apr 2026 00:48:52 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 20 Apr 2026 00:48:52 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.27) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 20 Apr 2026 00:48:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HYv0Xu0oKvAuxlJhzvzoAyQW2I2FFRZgJOq+ITRYDZF0PLtGCMoF0sGTsv40jSbnK0rszEaBdx6xuPEwYpXtrlXXpJLMOiibk/mPSl8pKZtxPOSRqXmsz6s/tf+IRu3eDxdsIG1znynXHEqPK8uBuxTXkezheXBtJ9yVk8xti9DUfdQcqfTIahovM11Ixvfj25tG5ygkqcrwc7HB7zuoHm6aMp/sRNZ8sHdqtmbtYFawcQ/mtlZfqzQpo2vVoen9Y5aWwQRAK+OADEwe8jqbbYy740qmoPzdbvrtCpCKhjdhMFNK2u4hmMrfir8DBSGSgkeKZKBs+UvrvJn9jCTdrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wa/hHXzelfw6S/DAS70dqsz8k+zGz0JgBxW+5VdlusI=;
 b=KZaTHkN59H4jP69HSvPJElgzReEWX2GPx/sv4QyDx5z50fWI+lzKF38vPwWfU0Ekn5s4MoewFXenSY6AIqkwngjW6AN369n3pFT0SO3Fg/F0ehJWVDtsDuhlKA/I09zNd2VKRTtH3pls6ozht64IGSAvUQeptCh54DEnUDo3XBhAzA/sOV7xhncr2rg1ssvvlbOm1qltBfDUHj+HrercM3A2eIVArvK+2JETpPh9Og46l6h7IITR6GUG4d52DFP4zVsTYzGuse5qcSLRov0ulfSpOZyOd46qBNkUyWE7YLGbXn7EUOah/IZqvFmuS2T/n88/HhSoCQKuXBp5T7qyDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7955.namprd11.prod.outlook.com (2603:10b6:208:3dd::6)
 by PH0PR11MB5807.namprd11.prod.outlook.com (2603:10b6:510:140::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.14; Mon, 20 Apr
 2026 07:48:47 +0000
Received: from IA0PR11MB7955.namprd11.prod.outlook.com
 ([fe80::6021:79ca:45d2:ae46]) by IA0PR11MB7955.namprd11.prod.outlook.com
 ([fe80::6021:79ca:45d2:ae46%4]) with mapi id 15.20.9846.014; Mon, 20 Apr 2026
 07:48:47 +0000
Message-ID: <7f0babdb-a816-4ff2-830a-786476964d01@intel.com>
Date: Mon, 20 Apr 2026 13:18:38 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] drm/xe/xe_ras: Add helper to clear error counter
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <badal.nilawar@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <mallesh.koujalagi@intel.com>, <soham.purkait@intel.com>
References: <20260406145440.2016065-7-riana.tauro@intel.com>
 <20260406145440.2016065-11-riana.tauro@intel.com>
 <ady2f_SEVmooxt7u@black.igk.intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <ady2f_SEVmooxt7u@black.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0067.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::13) To IA0PR11MB7955.namprd11.prod.outlook.com
 (2603:10b6:208:3dd::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7955:EE_|PH0PR11MB5807:EE_
X-MS-Office365-Filtering-Correlation-Id: fc9e7779-17f8-4b5f-deba-08de9eb140e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: FtKnYTsOrUtp5VlmhJyHYsjicelIFQhUZ4wrOaetdMn/A50yKSqY+mTV7nu1AVaaKI47nzmGtFBy7FiSOvytu89FnxYLkQ7N+cWXcl9UnvdJj8MjJR64dRKJbzN9rFrURqWCXxmnTXsII65Asxkl3QvHYgypy1pKhNS2HQs3nqCsbIGE6AvMM8BwvnDVXigYpfpOVkOZc8/KZ2nnuxg1fyuo+6qpM3rz41deJwegNcLZAGdfI7Az+9t4oTnHUzW4JueITKvDoEZ6Sz1BLKHgNC74tuMm0m+1hcwlKOBQj6cMAHVE+Z1qg6uhxDwG4AvvmotGFdmSsogbjz0U71AqSvVhuRkTTgPFIOqRz5gtuoJwz9ag0lMWR2LYLDjpWu5V1W6hmUGmpY6Zi3TidSMWKLlZMbMRofMCp4ewR1dPZ3zunzQRPO+VkwUmkTZ06Hd/kFDSHA4rD8BT7GjhooTFDYrUQ39LbLWTaYclfx9j9+ccIPqSUQwWdYMlA9SJDl2SZx1gm9Sa6hKDrX1RR7/oe7xCkcLJNjupL7YJPDoAuf/4cab29H9AyNhNuFKUBmc0tpp0ZiyBsGU7ORz5Twm37v6RVNiMUKsSJevh/x3JHA9AR3D/gD1oftrPZ8dZATCZXahdS8fYDUu/fB8KFwDgCJiyoWGyrbT6jko0DrpdOklhjs9O7b+Fmi//IyLJSrWx
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7955.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aVo4WHBvWVFvOTBuOXJBWEFWS1Jqc0IrNHBYaVIvanBtcndKNllpdUJvRGlm?=
 =?utf-8?B?VHlFVlpwYlZYdmg1eVlySTl1RmtaUHpoc1BDaXh3REFUamxleTlWMzBscWY0?=
 =?utf-8?B?YUMrRkcyTFkrTGxRdEcvb01lYlN3a2tleE5zK3VpYk1hY09aRVo5VUc2VENu?=
 =?utf-8?B?bnBQZWsrWWhUY0pUZTdXOXRoL1hIY3I1KzU0QktIeW9pTUwxait4MEhXU2Yz?=
 =?utf-8?B?eVhKZDRUWmxRYmhpcVRLK3VEUTJrNkQwdmtTaGw3TUpMQ1cvWXBqcGluV2Yv?=
 =?utf-8?B?QkxRdDViT0dZUzFHcGtvYnJxcXU0eDJCM0RSelBqT2RHazVJSmNpUkVZcHpW?=
 =?utf-8?B?VGhwKzRJYy9nUS9ZQ2plMmUzRmZ5ZENYM3ZoTUFaaEtTZCs4OUgvUlpBS0Nr?=
 =?utf-8?B?aGRTRFZkZXhRelZNU2l2SHlKYVAxQlkxVFE1UFdLZXJ4QjRNR0QwVnFMMjhs?=
 =?utf-8?B?cXNremtyTzFaa1Q2Q3Z0R0RxMnY1M1VoWVp4dzhYc1ozRkxTbnRhZmFlWEpl?=
 =?utf-8?B?UEVtNWd1UGxBcXgzS3dOWjRtOW02dkZuOHcvWDE1cnNpRTJVajdGRXIwQVZH?=
 =?utf-8?B?ckdia1JVTG05YlNKaG1PL0ZTTCs5eVNTZHF4aVpYZ09zVXUvRlhUSW1TTFJB?=
 =?utf-8?B?YjJBZkNPY053WGxCZGM0R2F4L053Zkxabk5YempXQ0p5WVd4dEprWExXZ3pF?=
 =?utf-8?B?ZEd1ajhhektadWZqUXg5cU9WQ0ZLc1FPbXFOL0xFdjBJdmxyZ2MwZTRCMnRH?=
 =?utf-8?B?ZUhjR0JML3MreENXcnRxZHRlMHc3MHI3dFErZVIzRFdxN2FzcGljOXpoMTd4?=
 =?utf-8?B?RzBlNjVEOVpXT0kzNVFtRlZiT2cwT0EyLzVMTlVaZldob01ZZW9uSGg5UkdW?=
 =?utf-8?B?N0NudkgxcmFMM0tTcHliT2NuWFYxcy9tclpvbldYZTd6a3B5LzlsQ2lidDJ1?=
 =?utf-8?B?dXhPZjNQMi9wV1RDdkdybko3WmJwZUFSSTZzTGtMZ3RGSWQ5anFYcFNyeFFu?=
 =?utf-8?B?cXBTcGZBQkVTc3UzTDFzUFZxQlNSQjdUSkpocm1CbUVkTTZBaWpVVWJBQ1cz?=
 =?utf-8?B?dEZPUnBydzlRMHJRaURpdmZycDAwM2JQaDJMaHkrUjk3Mk5QdzhSWDlONGgw?=
 =?utf-8?B?QUsxMWl3bHF4TW1mb1hCU2ZpdkdienA1TEhiOUs2SWM5NE9ZZVBma01qa2pI?=
 =?utf-8?B?UU5qaTh4d3BpSEhYT1pZZStBQk4zWU5CWmlCbVc0WmNBbjRoWlM2aldPYWZG?=
 =?utf-8?B?c3ZJVDJjTUE3YnhiMDN3bWpSVHVZeFNGU0N5YnplNDVsOG5oU3AwRUdlT0RC?=
 =?utf-8?B?RmliMUZTekE1NE96cTVIbENNamRxQW5nVG1jb2xQWEFLdW9FWS9PblBkMmth?=
 =?utf-8?B?cTQ5WFRnVnZqYlFoM01zZk1jWlhzbUpnMWJPZTZDdUpIRnA0ZGQ0N2c2Qm53?=
 =?utf-8?B?Q0JKanNFUCtzUDFWeDJGWFZwQSsyVktPV1RIbEZUNWV2NUZ2UHJkR05YVU1u?=
 =?utf-8?B?T01KREs3dFdrZUdNQlBkRzdjekxlOWFRT0NidkZwNDJXcm1ORGdydkU1V3lB?=
 =?utf-8?B?ME5KWnd4MXdnUTZxWXdyMC9CbG5MdnFUNVJEV1hFVm5DcU1pOEJYZ3F5bFEv?=
 =?utf-8?B?L3lHcnFjZk1nZFFlRE8vUFBZcHYranI4UFdTalZGV2xwQkQ5Q01jSEl5ZFVW?=
 =?utf-8?B?ZWhnN2Nrc1RDbS90M2RUc3ZIUDlUckZoRmEwaHJIUUNxUFRTTkhNM2puck5j?=
 =?utf-8?B?cDdmZTFKWFo3OURKaXcvSWU0SmFUckFaNUdhaEJsS1pzU2tHL1ptcVo5K2xH?=
 =?utf-8?B?aWVZQThaWk5aV0pVbXZzZTZxekN6L2Zxa2ZxcnVROUl4K1BPMG5ramRZSWdM?=
 =?utf-8?B?bWxVazc1UUl3MXhHUk50OVIydm5BZE9CYk1hbitPZnhlR3FsWlJmbG9PeDk4?=
 =?utf-8?B?NGxWaEhONGhEWE1YcnNnalgxL08xVnRBNnpXQ2s3Nkw3b0lGRXZ3eTZrSEs0?=
 =?utf-8?B?RnpDRjM2b3ZWZWZjbXZudE1wZTdNaGdXaGlvVjI5MkJob3ZITTRpTGNVQ09t?=
 =?utf-8?B?R21IQzlQb2RJWGM1M08wemt3SU0vci83MTluQmgyK2FYZGFKeUdpaGdoOWFl?=
 =?utf-8?B?aEp6bHloc2VOYjBobnlHclRPcWkxTDNIYVJPMTBPOVVTaERna0JSMFlGRTIz?=
 =?utf-8?B?TzR3QjhEd2lNU3VjZkRRRytuVW1hOVFsVkdSZnhhLzBmMkIxcmZDalgzeWdO?=
 =?utf-8?B?bHg4WWRKTlA3OVZtdURIbXJ4Q1hRd25paWVWem5heGhQREpsM2pUOG1hZ3Fp?=
 =?utf-8?B?MHhhdGk0S0Q5a25odEFSc1dldHdaSklRKzFwbGo5UDFhKzB4SVZydz09?=
X-Exchange-RoutingPolicyChecked: mHa72mRdA4BvxPaI34OOAgx82H1nWOqMsFv16CxkyknGwp9y8Z5OyPihJQkK7Gr7CdsV15+VOwNCT+tjXAfUpTAER4BmLuSi2B1TMdjqv2GTPr72GfpqWuq4pO5+GWR9FTRM5u08LUEi6o00P88h+PaafP+OYAAAUpFKICSHl+RimM2y+Qq9e4ZrK2SKOg8sMRdoxhZZ+cXqpH7GfuyZJE2eg/pzuaMNiBFPFFb8H15JHbSTY40qmqJ5OI8IH/pxoZvs6NKTqcXAHVvGYJKMjtHwduj5qHJcA+3OA/7wE6NF2Q9ApiuJRPgjjDNprSKftVkUTNGJBsyf+gcs5qqK5Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: fc9e7779-17f8-4b5f-deba-08de9eb140e9
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7955.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 07:48:47.2668 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DrUr1EVNeUJJuH2p7GMifhy6AISiXKeZfzyu0Fja31rnDwY6c2notMC1vlWQuaR2MjwYs918xi34pUosjuI5fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5807
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


On 4/13/2026 2:55 PM, Raag Jadav wrote:
> On Mon, Apr 06, 2026 at 08:24:43PM +0530, Riana Tauro wrote:
>> Add helper function to clear error counter value.
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>> Note: This will be integrated with drm_ras implementation
>> once clear-error-counter patch is merged.
>> https://patchwork.freedesktop.org/series/163019/
>> ---
>>   drivers/gpu/drm/xe/xe_ras.c | 48 +++++++++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_ras.h |  2 ++
>>   2 files changed, 50 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
>> index b5fdad2c801d..56abcb9783a4 100644
>> --- a/drivers/gpu/drm/xe/xe_ras.c
>> +++ b/drivers/gpu/drm/xe/xe_ras.c
>> @@ -121,3 +121,51 @@ int xe_ras_get_error_counter(struct xe_device *xe, const enum drm_xe_ras_error_s
>>   	guard(xe_pm_runtime)(xe);
>>   	return get_error_counter(xe, &error_class, value);
>>   }
>> +
>> +/**
>> + * xe_ras_clear_error_counter() - Clear error counter value
>> + * @xe: xe device instance
>> + * @severity: Error severity level to be cleared
>> + * @error_id: Error component to be cleared
>> + *
>> + * This function clears the value of a specific RAS error counter based on
>> + * the provided severity and component.
>> + *
>> + * Return: 0 on success, negative error code on failure.
>> + */
>> +int xe_ras_clear_error_counter(struct xe_device *xe, const enum drm_xe_ras_error_severity severity,
>> +			       u32 error_id)
>> +{
>> +	struct xe_ras_clear_counter_response response = {0};
>> +	struct xe_ras_clear_counter_request request = {0};
>> +	struct xe_sysctrl_mailbox_command command = {0};
>> +	struct xe_ras_error_class *error_class = &request.error_class;
>> +	size_t rlen;
>> +	int ret;
>> +
>> +	error_class->common.severity = drm_to_xe_ras_severity[severity];
>> +	error_class->common.component = drm_to_xe_ras_component[error_id];
>> +
>> +	prepare_sysctrl_command(&command, XE_SYSCTRL_CMD_CLEAR_COUNTER, &request, sizeof(request),
>> +				&response, sizeof(response));
> Nit: Probably worth having a set_error_counter(), we never know when might
> need it :D

I did think about this while working on the drm_ras command . Since this 
is a error counter which is incremented for an error,
userspace shouldn't be allowed to set the count to anything other than 
0. So retained the command as clear

Riana
>
> Raag
>
>> +
>> +	guard(xe_pm_runtime)(xe);
>> +	ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
>> +	if (ret) {
>> +		xe_err(xe, "[RAS]: Sysctrl error ret %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	if (rlen != sizeof(response)) {
>> +		xe_err(xe, "[RAS]: Sysctrl response size mismatch. Expected %zu, got %zu\n",
>> +		       sizeof(response), rlen);
>> +		return -EINVAL;
>> +	}
>> +
>> +	if (response.status) {
>> +		xe_err(xe, "[RAS]: Sysctrl Failed to clear counter %u\n", response.status);
>> +		return -EIO;
>> +	}
>> +
>> +	return 0;
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
>> index e468c414148e..19e0e649d55f 100644
>> --- a/drivers/gpu/drm/xe/xe_ras.h
>> +++ b/drivers/gpu/drm/xe/xe_ras.h
>> @@ -12,5 +12,7 @@ struct xe_device;
>>   
>>   int xe_ras_get_error_counter(struct xe_device *xe, const enum drm_xe_ras_error_severity severity,
>>   			     u32 error_id, u32 *value);
>> +int xe_ras_clear_error_counter(struct xe_device *xe, const enum drm_xe_ras_error_severity severity,
>> +			       u32 error_id);
>>   
>>   #endif
>> -- 
>> 2.47.1
>>
