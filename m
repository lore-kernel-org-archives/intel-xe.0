Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64A3EFB5179
	for <intel-xe@archiver.kernel.org>; Tue,  7 Apr 2026 06:41:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20B5D10E294;
	Tue,  7 Apr 2026 06:41:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZZwaYd0Q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C56810E294
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Apr 2026 06:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775544105; x=1807080105;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jGWPj9a6jGZhUXRvm6JXz6T1eM+Vi44unFVzPMcmWrs=;
 b=ZZwaYd0Q5W4GZWVAzV01pht1rpO5rX4f9fcptT5khtf3An2uxUh00jgj
 R4sKzTTidUUkafoXuEhglrBVriuoaWKASc/h8MCXjYb7oGvD0hLk9lpn6
 Vt4a59YqyDpEo9ydMCd7+WmP9+B3xoe1czfIqI7ULg8gvqUVGnh+onVEq
 GqmgaOKbH5zJsjldJIC3nX9QHIDy+rIMquHQxeGrjDtM842UEkloyeRXt
 iulLoPKGAvbrB6GuHJ6IM9eSlmgtO3MIrFi4NLItiiYy8d+2puIteUDhY
 6Va/3xZlGp8ZsPjOgUSMxtrU0wd2gZQ/+r7pP/CwgnZYA6Awhf9S2uxlB A==;
X-CSE-ConnectionGUID: 8EBtcLR5TzaZoLWEqWgYVw==
X-CSE-MsgGUID: i4iWDM1mTUOaHuGS9V8gTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="75673676"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="75673676"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 23:41:45 -0700
X-CSE-ConnectionGUID: v9RFfDMbRdqvsZkxEhtFBQ==
X-CSE-MsgGUID: CIGzMsVHQxCqbBTtbPpREA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="251227732"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 23:41:45 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 6 Apr 2026 23:41:44 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 6 Apr 2026 23:41:44 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.67) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 6 Apr 2026 23:41:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FF+nd05Ymy09RDRmv66votiB1C6PXtxH/kRWWcrTh7Veu+Mx3GcLea8aeECDoTyrlwEZ1qQVfEQ68Cw4c1uGTk9fe72TTZmnJjxUM9qLjlD/jBI8kSoBhQ5e57XiRUYOGvkbCVHulHW4SW4+/qmt5JWwe5kJPjVZ7SE0Qbb99pkay4mTgVlQrgNbWSrV4RJAxXGuY07T/inYg9aiGBXpzK0MZlSOzj6QnIwQfbPi6gHd69sUB8qZ39HJDuPn/AyK2WgT2gm8vJCxUEZK7eoYdecowkqoS5gNL82PeLYoz9nfijoGr1cxhY8jg7Bt7sSvDiOH50Y5+nZjxJVP9n2KCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SkA+lBd4BFxGOv6t6mKXYEf4ygGKYH4AUyayPlu15Jw=;
 b=IHsVrxDPvUjJSORhiNNrkKFfNBWcKNRWtFw53xM/rtv9l0J4izMCtn+GVbX18UEAofvflMWRuyU4lPzCno37g4x0ukFK7pwtTrZgg5EtL38Pm8ukDSsaKOxwxtlcNU7+/JrNJvUFSTix4EoNkey15y1RtZehzxqz+gfUOBwNPQ750h6Rx9rzBBvTATtH9Ff8sih0Vxu7lLTxgiBEvSxJD1hsFZk4M2cKzVkHHYJNBvt44twC+VeSPxmERgISMPG57jiz9hclhluaoMKzrMC6txl46ymsTI2TQog/NVj/Mod+ogY5S8Dj/5kSPxxl5vzaEfQbrURc6IY0cCnEyudGQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH3PPF67C992ECC.namprd11.prod.outlook.com
 (2603:10b6:518:1::d28) by DS0PR11MB7959.namprd11.prod.outlook.com
 (2603:10b6:8:fd::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.19; Tue, 7 Apr
 2026 06:41:42 +0000
Received: from PH3PPF67C992ECC.namprd11.prod.outlook.com
 ([fe80::9e01:c158:3b1d:f93a]) by PH3PPF67C992ECC.namprd11.prod.outlook.com
 ([fe80::9e01:c158:3b1d:f93a%5]) with mapi id 15.20.9587.017; Tue, 7 Apr 2026
 06:41:42 +0000
Message-ID: <bff64dfb-92f7-4150-a7e5-39a5f01a240b@intel.com>
Date: Tue, 7 Apr 2026 12:11:32 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 07/15] drm/xe: Move ASID to FAULT VM lookup to xe_device
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>,
 <stuart.summers@intel.com>, <arvind.yadav@intel.com>,
 <tejas.upadhyay@intel.com>
References: <20260318074456.2839499-1-himal.prasad.ghimiray@intel.com>
 <20260318074456.2839499-8-himal.prasad.ghimiray@intel.com>
 <ac7ksb6r259ILaR/@gsse-cloud1.jf.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <ac7ksb6r259ILaR/@gsse-cloud1.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0070.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::15) To PH3PPF67C992ECC.namprd11.prod.outlook.com
 (2603:10b6:518:1::d28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH3PPF67C992ECC:EE_|DS0PR11MB7959:EE_
X-MS-Office365-Filtering-Correlation-Id: d8f058ad-faa5-45e9-4d30-08de9470ba7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|18002099003|56012099003|22082099003; 
X-Microsoft-Antispam-Message-Info: oxHIn025/LtB9Yp5qMK3y2fLWqgQsisdvdyCqmlclXmFjlgJczGkcKXMDSnM6DHynyIj8jWQiQpnAAyFPnhVfoh/mtntxIUGBKYf05j2sXOW8DupY7HNfFtRhdyJb/QFruo/enOUQqTBiH0vCVcXbEppfCeMRc3dIToFnWTD7LrpQjtftivbqMe6cjie8sGo6kGz3lW3pLkPI9cf4uXIgEGqAPEMR/jPiFgmv//FnkgIQVyNjcukxWWUOwdzDbdfHMW+UDBliu9MDDioGDyzzsI4jUNFa2vIZYu1akqWLtB5F627wsiJ0g/MS0nFxOK2YGviaFTE9tg8NfHR2Qe30pzdajRZefPeknvwoYyNeQOXRS17GRu3Nxcpu5pW1dBVGy1eoVgv2XCXdU+DuCyPC4A9exi2Jvjhmwpld9x3V9XgEfQRDzv5BDsAkwi4ePDz7SSgd/MkBsCzrxPdrEUUO4mRMstdZC0G5kxb8Ph4oCnLeiLmvMW8I7pTVAXRsreawcwaZqErt3ZrCfBvyXnpFoFWLYo3lhJr4iwsJr+4uIR7rwFar6gizfo23ZjUPvxr13zMh930/5ltsuHw7GE3I/x9DnDv+pxFqQTHx+Cce+XlMF2NjuUk5zydz1Fva8q3l8qvwy2VQgUQWBZpe+ZLTSW/s1om7EcOHKPWUiA245FwkO4hBtqJ+FW9M1/pBclZRNSAxT2c6i1Al2IfLN4XqgYARCRT2qH23dGgzre1R0k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH3PPF67C992ECC.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SlVPUTF1SjMzK2xKbXB6TXRCNzRNZUx6K3RSeVVjTksyd0Rvd2tnM0dvdDFV?=
 =?utf-8?B?TGhZSDN1OVVuRUk5aWY2WEhYczQ3eDM4OEVCMFZGV0pzSk5iK2hkVlV6ZEpr?=
 =?utf-8?B?RGdVTmlTNGhpbXB2aWRzZlk5eHhnZ2psb0Z2aExESE1kRVhtM3QvV1NoOFlI?=
 =?utf-8?B?Z0lONkRnNCs3aTVNNTZhSjZ3V0h3b1ZXNGNDeU9EK2VYT2gycjFjK0dqb21L?=
 =?utf-8?B?OUJhVnp4S3pNZVVzV3ZKUzJnaTdmWmcrelpyekN1RmZMR1UvazN5ZnpybXhw?=
 =?utf-8?B?TnR3ejN3Y2picnk5akp0K1lZYW1rWlRXV3lGYnlQRE9pNmlzSHNnTWZVMEJQ?=
 =?utf-8?B?Uy9DckxpdlN1cUZaMEtqRXEvUXBZRGRWSEFlaGwyMERoc05LNXorQ2gzUkpF?=
 =?utf-8?B?M0lOZFQrSzYxMitOR1V0LzNlb2d3djdXUnVpZ1NMa285RXFaWndWeWViWWFB?=
 =?utf-8?B?S3RoM0huU3MzMm16TG1ZT0dkaVRKbUNZenEwQUhUbXhZeTRQSjM4dGkvS0Rn?=
 =?utf-8?B?MlhvUGxYa1pQYmcrM2c2Q0k1bW1sS3VYTTJJR3JMUk9pUjNYWFY1THl3ZldH?=
 =?utf-8?B?QXllQjVEbG5wZ3grY29qa2EwQjQyUEc5K1A2RVRXUUpsQXl6ZC80Q0Z0MmND?=
 =?utf-8?B?L2pQa0k5QUNLdjBCc3hWZUVhN2YvMXdYNDlaR3FLUFZDSWpGaFhTUDhCMFJ0?=
 =?utf-8?B?c0pBTGkyZG5RcmxuRjNSc0dkZXZMKzdId0pGQzBncno3UUdxc21sTHl3NVdt?=
 =?utf-8?B?Qmp5NEI4VVppaU9rZ0RiZzVWMlJhWC9jOWV1MGVyQk9vNmJ3aFA5cXJGUE5E?=
 =?utf-8?B?eGRMWEM5L0pOZGNtN0dWVGxSRlgxTTNaWmRMWGxzbEE3QlNlVVFSL0JjcElI?=
 =?utf-8?B?cTRxUDBKWG51Yy9OWjRSaURxenovclZUNW4wQ0p2M1NmOW1ST2tiK2ZocTcx?=
 =?utf-8?B?dUdGV3VJcGNab056RE5DSFNkbGtBSUxpcHppMUlLUnlLL09vaW4zNG9uK1dw?=
 =?utf-8?B?bkNISTlSWnZQbUUvWTgveVVDUTRjbTBaK3BldHB0WEVmZkNXR3prZitxajQx?=
 =?utf-8?B?WG9oVFhFVTl1OE04elNIUmc1L3hQYUVxTTNNdUZ1ckhEZmk3OCtxb1NERmRV?=
 =?utf-8?B?eVFtdzZmMjlzaGdMMzF1c1RmcUxVRGdRcytjaWhCR2M3d2pBMlNlbUxnNXVq?=
 =?utf-8?B?MU5ZdDZVZXdPL01kN3RNc0NZVGtSYi9CUko4amx2eksveDYrWTNaZnFiMjVE?=
 =?utf-8?B?Yms3NnY1Ym0ra2ZrRUUxQzhmLy9FbEtMWnRCY1cxR3NPYnRjd2VOUWs4MGJT?=
 =?utf-8?B?WGtndlpqRE9FM2Z3a3orSDFlUU95cHQrRVpHdlA2M3psZ0dVUEk2aTl5eFl3?=
 =?utf-8?B?ajV6U0h2RnRFOHExS2hNWXNlZmRVc3hEdVVMRlhLcFlYT2hJZ3l6QkdSamxj?=
 =?utf-8?B?Z3c0WmRJSXY1eHNkZXdZK0p6a2JNS1lyWnRUSGN4VjdJZkNBUS9BRzhsRXds?=
 =?utf-8?B?NXNYc2dBaTUvOHBUZUtBNFhlbG9uQ0hOUCtQeUFNMHFLM0VUaTlPRERNbER1?=
 =?utf-8?B?ajRRU1ExNUdZVUJUazI1bDZHMnpzL243Nm1SVTI0QUlwZGtOSFR3MDE4RS9i?=
 =?utf-8?B?RnNka1lFeE4xYjN0VHlkZnlFTjJOaC9wYnQxYjZEQWtNeXhIOGZTSWJWN3V2?=
 =?utf-8?B?NTZITUJtMW14UTNXbzUrTU1aSjVLK0xTQzQ5OWRPMlpBUnl0ZWRJTlF5eXVM?=
 =?utf-8?B?Y2FIcXZ1K2JoUFZOenEwWTRPd0NOSWRPOEhDN2hWQmNjUTFxdUw3bWFtV3do?=
 =?utf-8?B?MHFBVFB3K2djamJNR1hpQStYQUxHMnFwcUdOVStJZEZKWXR0VmlLYmtjbXRV?=
 =?utf-8?B?Sm1CNy9VdE42WHNVQ2lITFErcmJCSy8yWEcybkxFWTgyUmNkVE5Ua2d1aDcw?=
 =?utf-8?B?UXBFZG1KNEFzajNWWjdmcXVFTXFnU0d6Z2lzbzdVQXJkS2VpMTFaTFZBOUcy?=
 =?utf-8?B?TDJMMFBzUnNzeDZyQktiNi9pOWxROHRONUhoZDB6VnBidW5lZ1h6d1hzMmsx?=
 =?utf-8?B?bXZiS1grSVFFbTZTZk5sTmw1UjFkajFvNWh5anpuWm1VcXNwbTRJR3Vaa2Ny?=
 =?utf-8?B?Nkc2MFE3ZEI0TjBGQUZHYUZIRUR4ejNReGU0WmhGV0dnMCtDY2grWE9DUDFO?=
 =?utf-8?B?YWlweUlLN1NsUlB0QTVrcU9BZVNteTZDSlZlcFZmMDBwL2JvN1gva0Ryc2hE?=
 =?utf-8?B?Z1dlWlBNMTdJbzBHL09YRCtkR3FUYlMvZUp1L3NQSmIxc0hvdnMvMFNaVDEr?=
 =?utf-8?B?MUpWQVJvWnFFKyttS2lNZGZlVjdJRzEwRVZFSWtad0RmZEl4OEdrUURKTEdS?=
 =?utf-8?Q?2GADIJ5MfvHOE5n8=3D?=
X-Exchange-RoutingPolicyChecked: h3nlVig7sIlkchgoOHc5DzJk0lyV0kTad86U8FmbOhQ7RSymAlHs4lFQBLc+8qowCkSzznDVNqNHCblhqipC/5Amh2OCb2EnQpF8YswvSpl3gHKQOOPlpe8p+h31aECEQmjQdMelSS8QPikmZ2EEWdjnfk7zKcZM6Z/wWzUVTC0VoVrVkY0ZM/kkjnhFDuZcG3Anje0+kEYuFiJqBFIoQo1rQSKajcJnT0hZTLlxKu91zUOZ15z7hEo98c3TXwnnjZuMi2GCRIcNPTPwk9LNSHeNfHXZDsC2m1/xkQhZi2CbsBJvQWRXPGkIEDymYS2f3DhrwK3cbjVGZuDa4CwuSg==
X-MS-Exchange-CrossTenant-Network-Message-Id: d8f058ad-faa5-45e9-4d30-08de9470ba7e
X-MS-Exchange-CrossTenant-AuthSource: PH3PPF67C992ECC.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2026 06:41:42.2366 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BN7l6r+vkv9BhPuyp1m7cBSSG1w7IEKOQjcqJIHf5iCe68cjuaBxFftJ98/oTPa0lsp1T6A+JaxhMzBUZu5PBe6kVcowqzN2rfhz8evYD4A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7959
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



On 03-04-2026 03:20, Matthew Brost wrote:
> On Wed, Mar 18, 2026 at 01:14:48PM +0530, Himal Prasad Ghimiray wrote:
>> Move xe_pagefault_asid_to_vm() to xe_device.c as
>> xe_device_asid_to_fault_vm() for reuse in access counter handling.
>>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_device.c    | 25 +++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_device.h    |  1 +
>>   drivers/gpu/drm/xe/xe_pagefault.c | 16 +---------------
>>   3 files changed, 27 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> index 8773c2d2f69a..ba2f0e345257 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -1399,3 +1399,28 @@ struct xe_vm *xe_device_asid_to_vm(struct xe_device *xe, u32 asid)
>>   
>>   	return vm;
>>   }
>> +
>> +/**
>> + * xe_device_asid_to_fault_vm() - Find FAULT VM from ASID
>> + * @xe: the &xe_device
>> + * @asid: Address space ID
>> + *
>> + * Find a FAULTING VM from ASID and take a reference to VM which
>> + * caller must drop. Reclaim safe.
>> + *
>> + * Return: VM on success, ERR_PTR on failure
>> + */
>> +struct xe_vm *xe_device_asid_to_fault_vm(struct xe_device *xe, u32 asid)
> 
> I think the recently merged xe_pagefault_save_to_vm() function can reuse
> this function now too.


For xe_pagefault_save_to_vm we need to use existing function 
xe_device_asid_to_vm instead of xe_device_asid_to_fault_vm(). Will 
submit patch for same too.

Thanks.


> 
> Patch LGTM to though.
> 
> Matt
> 
>> +{
>> +	struct xe_vm *vm;
>> +
>> +	down_read(&xe->usm.lock);
>> +	vm = xa_load(&xe->usm.asid_to_vm, asid);
>> +	if (vm && xe_vm_in_fault_mode(vm))
>> +		xe_vm_get(vm);
>> +	else
>> +		vm = ERR_PTR(-EINVAL);
>> +	up_read(&xe->usm.lock);
>> +
>> +	return vm;
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
>> index c4d267002661..e746f5c7cce0 100644
>> --- a/drivers/gpu/drm/xe/xe_device.h
>> +++ b/drivers/gpu/drm/xe/xe_device.h
>> @@ -209,6 +209,7 @@ int xe_is_injection_active(void);
>>   bool xe_is_xe_file(const struct file *file);
>>   
>>   struct xe_vm *xe_device_asid_to_vm(struct xe_device *xe, u32 asid);
>> +struct xe_vm *xe_device_asid_to_fault_vm(struct xe_device *xe, u32 asid);
>>   
>>   /*
>>    * Occasionally it is seen that the G2H worker starts running after a delay of more than
>> diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
>> index 8c159e3512ee..a4ee9393e4af 100644
>> --- a/drivers/gpu/drm/xe/xe_pagefault.c
>> +++ b/drivers/gpu/drm/xe/xe_pagefault.c
>> @@ -121,20 +121,6 @@ xe_pagefault_access_is_atomic(enum xe_pagefault_access_type access_type)
>>   	return (access_type & XE_PAGEFAULT_ACCESS_TYPE_MASK) == XE_PAGEFAULT_ACCESS_TYPE_ATOMIC;
>>   }
>>   
>> -static struct xe_vm *xe_pagefault_asid_to_vm(struct xe_device *xe, u32 asid)
>> -{
>> -	struct xe_vm *vm;
>> -
>> -	down_read(&xe->usm.lock);
>> -	vm = xa_load(&xe->usm.asid_to_vm, asid);
>> -	if (vm && xe_vm_in_fault_mode(vm))
>> -		xe_vm_get(vm);
>> -	else
>> -		vm = ERR_PTR(-EINVAL);
>> -	up_read(&xe->usm.lock);
>> -
>> -	return vm;
>> -}
>>   
>>   static int xe_pagefault_service(struct xe_pagefault *pf)
>>   {
>> @@ -149,7 +135,7 @@ static int xe_pagefault_service(struct xe_pagefault *pf)
>>   	if (pf->consumer.fault_type_level == XE_PAGEFAULT_TYPE_LEVEL_NACK)
>>   		return -EFAULT;
>>   
>> -	vm = xe_pagefault_asid_to_vm(xe, pf->consumer.asid);
>> +	vm = xe_device_asid_to_fault_vm(xe, pf->consumer.asid);
>>   	if (IS_ERR(vm))
>>   		return PTR_ERR(vm);
>>   
>> -- 
>> 2.34.1
>>

