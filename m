Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8588C3DA6F
	for <intel-xe@archiver.kernel.org>; Fri, 25 Aug 2023 17:06:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CC7C10E0F7;
	Fri, 25 Aug 2023 17:06:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40F9510E0F7
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Aug 2023 17:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692983179; x=1724519179;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=sWeDdXui5boHzpL+4OZJNdXmdY7MYeNyGTv7BxHzfqA=;
 b=CjPQsmYUKtBUCU7SGalt1I03bEWsOXF39VOn20he5lRnX17SxNo6eTMA
 Nz3yKNGIkwWNGJ103rzxkppM94sbFvnTr/9ZyANycTfvbHYgACIDT6UrM
 Do2uxeSJHtWzZo1r6Hk3My91SGz7o82wYMI7Ejd5ipS7M+yL3cqD/eGCq
 MLJ/Yve/ak/Mi6LOKEVn70k/pljeFTpyrnr1GiWHy/aQBE3TcDzas2RfQ
 ElqFsb2DXcWFVQEfWtouuKZZGt8pDz+M3vVv12moMr/vy1/RLzJ87Pypq
 5BpUoBnn6jxcumB4gR4wR1oKvqt08hPVAz0uuZ/Ol7YORIP5pHs6FeN3k Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="378539324"
X-IronPort-AV: E=Sophos;i="6.02,201,1688454000"; d="scan'208";a="378539324"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2023 10:06:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="731119215"
X-IronPort-AV: E=Sophos;i="6.02,201,1688454000"; d="scan'208";a="731119215"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga007.jf.intel.com with ESMTP; 25 Aug 2023 10:06:13 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 25 Aug 2023 10:06:12 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 25 Aug 2023 10:06:11 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 25 Aug 2023 10:06:11 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 25 Aug 2023 10:06:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RY1eBWUN4MhpfocZzGYZ5+O1vPS93LKWcGHP1k+dNfS0GowVhJj2ogNKINmBzCTNqkqBdhQ3KSxbrix3/DZ1a1qJqaICC59KPdXihc3WTVBH/G5aWg5/yfM356TIVLvkH7Th+75CNcwAudXhVzH5Pim7C+XJiLS0E+yzaZaPc9Rbt/622MSxe1RTJUSt68mf4p/wsLzNLtsCwweIyOwwHTUY+eRuKJNV0Cjovupj5xTUNfsb08yB3efC0lhEnIjskrDo7iZJz/lVOMwBy6xSArimcl3jjz0W0DMyouz6Gt2SIv1lM23EoATMwj5kmqx0tJApbdpQhE/IbU93lSFY3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7uQvOxqHdvFSq+uxEQTSIDqafCR9zwFRDtb/2wEx1NE=;
 b=MedC0mkzOAv693iB4yyYRTfm3TMcL0i4v0UB0XktNexhUGijCNYk2qESNYQUWLhiZZlF6k3a/s0y6qAHGSpuoJobzLHLPb7BSlrQObLSfExE6MDYSeSRUG5df1nffEsaEseextxIpStUQzmjf4KT/cjnjxOq59y0erIf0Tmxny0xpejeThz27foPVfB3Z5nlngPsMbq9f9MF/m9p1QADVu9Hox5J8XOrnIe9OoK9cmsn5tzSOom8gIksn21iwff+otTErEd09/kUpzy8YShq1BOMn1ppJu1rMt1LrGnOeL5cD5Yqpghf6MU1EXFnkfE8BxMb6bop4IPXV0Ih5bT2zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5624.namprd11.prod.outlook.com (2603:10b6:8:35::16) by
 BN9PR11MB5387.namprd11.prod.outlook.com (2603:10b6:408:11c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.29; Fri, 25 Aug
 2023 17:06:08 +0000
Received: from DM8PR11MB5624.namprd11.prod.outlook.com
 ([fe80::b9a3:5861:febd:8ecd]) by DM8PR11MB5624.namprd11.prod.outlook.com
 ([fe80::b9a3:5861:febd:8ecd%6]) with mapi id 15.20.6699.027; Fri, 25 Aug 2023
 17:06:07 +0000
Message-ID: <33e816c1-e99c-62ec-9266-f0e827e08a12@intel.com>
Date: Fri, 25 Aug 2023 22:35:58 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
To: Matthew Auld <matthew.william.auld@gmail.com>
References: <20230821144504.236122-1-ravi.kumar.vodapalli@intel.com>
 <CAM0jSHPpezh52jzkON3H1_MGfP-Q152Jb5p-vBBJThdtEdWpdQ@mail.gmail.com>
 <CAM0jSHOWtqjcwP1CFyq5_E6=-m1OVEk8TCK+8w9G5AS6ef5gTw@mail.gmail.com>
Content-Language: en-US
From: "Vodapalli, Ravi Kumar" <ravi.kumar.vodapalli@intel.com>
In-Reply-To: <CAM0jSHOWtqjcwP1CFyq5_E6=-m1OVEk8TCK+8w9G5AS6ef5gTw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0022.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:97::23) To DM8PR11MB5624.namprd11.prod.outlook.com
 (2603:10b6:8:35::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5624:EE_|BN9PR11MB5387:EE_
X-MS-Office365-Filtering-Correlation-Id: 07e9bdda-05c7-4ae8-9655-08dba58d92d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kmZ1C1K/PsufEGPxanLY9ojrI4UvP3Op6okrSb63n0abJt/9XovfMvzNp/Lj0ZAfa8s1sWbRlvghxT45C1w8EHEm0nNpEX7alo0z535+qj0bY50r6xKvdN5IMs5y0NEwnNu80bfSu0EzlZJ7vR1JDJ4s7Nt4lvX2B3/2YcT5csmZq4X2XLiOn7pv7oyb56kZaocEcsfB8gXXvbbWJMyW3S5Ajdy8tVEhEFbH+X2uBoXjgjNyXxwGvA37xXCkLJi7CgkD9d2qmDFOWttpJLBOR1t8P74msePr+9hdyBZmfV+7FhSbNdhoPAj8A++W0ZyCYbmKZ6xo/6dNHNFAvHmt6U5WrualpFLIuc1sNhD4GQVUMr22uZjXbQ1Gn3k/rTRk7XT4V14L6bOyLbxcPIrpasQNoFz7oisP18ixHvxh4mqA+9q1PZdtMjFh5G2QY2EQpyYKJWLP6RcJfbJxJZKDOkF2Dt99FSoT8/4vRXeedIFMsWohxfEkOJvlZy+UdXEkyN3EYeqbCZcJ+6kKHJmLzPVpTk/33RzbaEOmHH50R6/aiSdkBpkd3jQ5c6jgPRla7mgucz18s+svaPvkR+cfI6v7uCENrVs8hoJaPdMk9DszMN6KLrtv2WuluDv4/hv9rCTBxZ+3fkk1IX+HcWb15w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5624.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(376002)(396003)(136003)(346002)(451199024)(1800799009)(186009)(82960400001)(38100700002)(8676002)(4326008)(8936002)(31696002)(41300700001)(6506007)(6486002)(53546011)(316002)(6666004)(36756003)(66946007)(6916009)(66476007)(66556008)(86362001)(6512007)(26005)(478600001)(83380400001)(31686004)(2906002)(30864003)(2616005)(107886003)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bWJrK0U1TUpoM3hUYm9yOGdPZ2hMamwyZzAzVktNMWNLOS9YVm90SXV3aVgw?=
 =?utf-8?B?a0o1cHZ5aXlIMUcwT0x4SVVTOTdrTVFQS3ZUcXdBME9tNXRJQlpwSXQ5bUNV?=
 =?utf-8?B?WU0yYm0vbkplS29TRzVvUjIwY1YrZmhPZVVwUmVDY2NUMlhKaWZGV0hJWG5v?=
 =?utf-8?B?TDQ2RjZPMWN5dXZacUN3ZXVIRWNxeFhTQU1FUUZCdW1xRnc1TW5iVlVTcWp1?=
 =?utf-8?B?SEU0Zm90Ky9qbHUzSnY5M0lzamNYTFdnZURScGMxalAzcUpVL0FZOWVsektT?=
 =?utf-8?B?YUNBUmZIdkVVeW1zayticUJyVFJiejJ1L0lycUx0VEo3YlY2U2sweE1lTzBZ?=
 =?utf-8?B?MlNQbXRFcDRjaXRscTIzUmxWa1RxajZiVDRZZHJMS2Zzd1VpRU5OZDhGUVF2?=
 =?utf-8?B?TTc0S0l4SFUzRE5CNTBEbitqN2hmb2M5a1JQN2xHUm8yUTlmakE3ME9rTCta?=
 =?utf-8?B?b3hvdjhUWloxTWdaTUJITTh4RmxIcC9ITWE4SW5mbFRxWTlxdncyYi80eXBU?=
 =?utf-8?B?d3Rrc2V3LzQ2dlMvQ3JLY25WbVlyZW0wTEQ2VlJEUXJsYzdFTlJqT2p6VHdQ?=
 =?utf-8?B?TW9UR3Ztd1ptL2xzcGRvdC9GZmRscW9wcW1tQkJHMDRMOHd0L2VHVUIwc0hm?=
 =?utf-8?B?eHlIZjNydHhyK0ZlWEtQMFdDUERtV2lFZHlqRERDWjVPS0hFTkU3M05UcWlk?=
 =?utf-8?B?eDVtU293cTczb2lzRDMyWS9ZeC9TTEt4SnlKanlBQnZDTkZxWVFTRXA3VTlS?=
 =?utf-8?B?YnlBWStsQmtHcnRYTDR1QTVSbm0xRElLbHZxZDYvcDR6WVdKaGRGNjNsMkMr?=
 =?utf-8?B?UFVvTHh4QnhNOTR3MFF2c3hldExVTTV5RThaU1hOMjBZU3d2Y1ZMbkJpRDZu?=
 =?utf-8?B?dVRwRGtCRTRNc2JDOFB5L0s1WGw3MDlWcUlmMzB1cXduOVN4OVc5eGV1dlRO?=
 =?utf-8?B?UXNTaVRDWWVmQm41azN6TWFWeTdzTExKNkxMbjZyLzRXOStERFdEUVNlSTJE?=
 =?utf-8?B?VXVsRGxVZXJwQmhDNUNiVjJMSkN4N1BsVHlPclBBbVNPN2s3YklSOTNTZkRW?=
 =?utf-8?B?NGJKc05RSWZuZ1FSM21hMUdWR21nTDhkMVo2eUtaVExEQUR5YmxXSFBMejZC?=
 =?utf-8?B?RFUxZEIxM05mTElyc3BIOTU5SHAxNUt5eWN5bDVQWjV1cVRQWnQ0ZzQ5aGM3?=
 =?utf-8?B?R2RCNXo4Um5LMFZKSStlejZqUTl6OWU2c0VZTjZlT3BLMXZBMmk5bmVWRmZm?=
 =?utf-8?B?UGdiTjJMWk5rd2RvSXV1cVB1eXFPM05MQklEeVQ3Qnp4d1QvbWx0MzZUMFYv?=
 =?utf-8?B?cWxYekdUa1RiMmhQejhLcittWk1IT2lLQkR3M290allhYzczYXRqeFAySEp1?=
 =?utf-8?B?UHd2cnZSRHR4ejY1N1FpSWtVVU10VWdJcEpKMzdUMHdIN2Fld1VjZDRQK2k0?=
 =?utf-8?B?QitSbTBIVlFMUDN4VnhHZEFlV3RsZXVoNXNINVBqSVVJMUhuZDZ3aVFaT0hQ?=
 =?utf-8?B?a3E2Y1VwekczQXVyZ0gvaW9VQnNEejQ1Rm8yblJON3ExVC8zZDgyeWJxQktG?=
 =?utf-8?B?SllQbWw1OVNUN2lzOCszK0hjZmphWUF5YzluajJtM3hkeXZyNXhqaVlFc0J2?=
 =?utf-8?B?azRhcEYxYzRPNlRZb3dVd0RIM0VkZENwb0xHSHY3dVBiR1Q5cFJsRTM2VnpS?=
 =?utf-8?B?QnM3MTNtWS9mdG1jaUl1VGFReDh6WlFZSWhuYVlPeHBrUktwclhSc3pFc241?=
 =?utf-8?B?MDNRS3pJSytlSmhnN0p1blZEQWxObmJvL1BOcUkyeUs0Y0VrVGVrUzBkM2ls?=
 =?utf-8?B?Y0J1bHMvekR0a0Y0UHNPQVJaSXVkSVUrV2JLTzlyOTlQWFBaNHNRTER3MzhZ?=
 =?utf-8?B?NENTSVVmdGs2SVdkQVdUOVVoU3R0cTYrd01sa3dXUTRwbmxkTGZ2L2ppbW9T?=
 =?utf-8?B?TlZ3YmhHOFBUYmhucW9TWGpmWVkrZXFHSlBXazBKc1pSQUljb2RndHhBRFJN?=
 =?utf-8?B?MVJHeEYzTmN5cm1tcUxIaXBDVEVDWlh4dlNvRmQ0L0h1eE16YWpWT2NtR01J?=
 =?utf-8?B?bmFyTDVhVkhBY25ZTzJ4NUxxcEtPeGFVSGsxdURLa3ZtVmllOHZnYkFPcnUr?=
 =?utf-8?B?bkpoZTlPaDJGclF0ZkdQZVlGRDNOMjhScEpmNVhXdUVVNlozUkI4VjlsZFd4?=
 =?utf-8?Q?JSOcpbLeJz75C+zWHFDQX5o=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 07e9bdda-05c7-4ae8-9655-08dba58d92d5
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5624.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2023 17:06:07.9028 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I1VWPJPELgCQ6sxS2702YyIVvGOPqLHI0VUVpEC1gVVZUy3hX23TNrP/MGPoEe++XOqygMRVkgL+LKoTH/jzBMhorRIy6pDkZpA5eTyguX4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5387
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Add support for PAT encoding in PTE
 and PDE
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
Cc: lucas.demarchi@intel.com, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 8/24/2023 8:14 PM, Matthew Auld wrote:
> On Thu, 24 Aug 2023 at 15:37, Matthew Auld
> <matthew.william.auld@gmail.com> wrote:
>> Hi,
>>
>> I started adding the vm_bind + pat_index stuff on top of this. Just
>> some comments below.
>>
>> On Mon, 21 Aug 2023 at 15:43, Ravi Kumar Vodapalli
>> <ravi.kumar.vodapalli@intel.com> wrote:
>>> Different platforms has different PAT encoding in PTE and PDE format
>>> of PPGTT and GGTT, add correct PAT encoding for
>>> pre-Xe2 platforms (XELP, XEHPC, XELPG).
>>>
>>> Bspec: 45101, 71582
>>> Signed-off-by: Ravi Kumar Vodapalli <ravi.kumar.vodapalli@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_device.c       |  3 ++
>>>   drivers/gpu/drm/xe/xe_device_types.h |  3 ++
>>>   drivers/gpu/drm/xe/xe_ggtt.c         | 28 ++++++++++++++---
>>>   drivers/gpu/drm/xe/xe_ggtt_types.h   |  7 +++++
>>>   drivers/gpu/drm/xe/xe_pat.c          | 38 +++++++++++++++++++++-
>>>   drivers/gpu/drm/xe/xe_pat.h          | 22 +++++++++++++
>>>   drivers/gpu/drm/xe/xe_pt.c           | 31 +++++++-----------
>>>   drivers/gpu/drm/xe/xe_pt_types.h     |  4 ++-
>>>   drivers/gpu/drm/xe/xe_vm.c           | 47 ++++++++++++++++++++++++++++
>>>   drivers/gpu/drm/xe/xe_vm_types.h     |  7 +++++
>>>   10 files changed, 163 insertions(+), 27 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>>> index 766df07de979..e952bb2d021c 100644
>>> --- a/drivers/gpu/drm/xe/xe_device.c
>>> +++ b/drivers/gpu/drm/xe/xe_device.c
>>> @@ -25,6 +25,7 @@
>>>   #include "xe_irq.h"
>>>   #include "xe_mmio.h"
>>>   #include "xe_module.h"
>>> +#include "xe_pat.h"
>>>   #include "xe_pcode.h"
>>>   #include "xe_pm.h"
>>>   #include "xe_query.h"
>>> @@ -292,6 +293,8 @@ int xe_device_probe(struct xe_device *xe)
>>>                          goto err_irq_shutdown;
>>>          }
>>>
>>> +       xe_pte_pat_init(xe);
>>> +
>>>          err = xe_mmio_probe_vram(xe);
>>>          if (err)
>>>                  goto err_irq_shutdown;
>>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>>> index 303447c093c5..fda435ae5ef0 100644
>>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>>> @@ -355,6 +355,9 @@ struct xe_device {
>>>                  struct mutex lock;
>>>          } d3cold;
>>>
>>> +       struct {
>>> +               const u32 *pte_pat_table;
>>> +       } pat_table;
>>>          /**
>>>           * @pm_callback_task: Track the active task that is running in either
>>>           * the runtime_suspend or runtime_resume callbacks.
>>> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
>>> index 3ce2dce844b9..209fa053d9fb 100644
>>> --- a/drivers/gpu/drm/xe/xe_ggtt.c
>>> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
>>> @@ -18,6 +18,7 @@
>>>   #include "xe_gt_tlb_invalidation.h"
>>>   #include "xe_map.h"
>>>   #include "xe_mmio.h"
>>> +#include "xe_pat.h"
>>>   #include "xe_wopcm.h"
>>>
>>>   /* FIXME: Common file, preferably auto-gen */
>>> @@ -30,6 +31,7 @@
>>>   u64 xe_ggtt_pte_encode(struct xe_bo *bo, u64 bo_offset)
>>>   {
>>>          struct xe_device *xe = xe_bo_device(bo);
>>> +       struct xe_ggtt *ggtt = (bo->tile)->mem.ggtt;
>> Why the extra brackets?
for readability i have added
>>
>>>          u64 pte;
>>>
>>>          pte = xe_bo_addr(bo, bo_offset, XE_PAGE_SIZE);
>>> @@ -38,11 +40,8 @@ u64 xe_ggtt_pte_encode(struct xe_bo *bo, u64 bo_offset)
>>>          if (xe_bo_is_vram(bo) || xe_bo_is_stolen_devmem(bo))
>>>                  pte |= XE_GGTT_PTE_DM;
>>>
>>> -       /* FIXME: vfunc + pass in caching rules */
>>> -       if (xe->info.platform == XE_METEORLAKE) {
>>> -               pte |= MTL_GGTT_PTE_PAT0;
>>> -               pte |= MTL_GGTT_PTE_PAT1;
>>> -       }
>>> +       if ((ggtt->pat_encode).pte_encode)
>> Ditto here. Also in a bunch of places below.
>>
>>> +               pte = (ggtt->pat_encode).pte_encode(xe, pte, XE_CACHE_WB_1_WAY);
>>>
>>>          return pte;
>>>   }
>>> @@ -102,6 +101,22 @@ static void primelockdep(struct xe_ggtt *ggtt)
>>>          fs_reclaim_release(GFP_KERNEL);
>>>   }
>>>
>>> +static u64 xelpg_ggtt_pte_encode_pat(struct xe_device *xe, u64 pte_pat,
>>> +                                               enum xe_cache_level cache)
>>> +{
>>> +       u32 pat_index = xe_pat_get_index(xe, cache);
>>> +
>>> +       pte_pat &= ~(XELPG_GGTT_PTE_PAT_MASK);
>>> +
>>> +       if (pat_index & BIT(0))
>>> +               pte_pat |= BIT(52);
>>> +
>>> +       if (pat_index & BIT(1))
>>> +               pte_pat |= BIT(53);
>>> +
>>> +       return pte_pat;
>>> +}
>>> +
>>>   int xe_ggtt_init_noalloc(struct xe_ggtt *ggtt)
>>>   {
>>>          struct xe_device *xe = tile_to_xe(ggtt->tile);
>>> @@ -120,6 +135,9 @@ int xe_ggtt_init_noalloc(struct xe_ggtt *ggtt)
>>>          if (IS_DGFX(xe) && xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K)
>>>                  ggtt->flags |= XE_GGTT_FLAGS_64K;
>>>
>>> +       if (GRAPHICS_VERx100(xe) >= 1270)
>>> +               (ggtt->pat_encode).pte_encode = xelpg_ggtt_pte_encode_pat;
>>> +
>>>          /*
>>>           * 8B per entry, each points to a 4KB page.
>>>           *
>>> diff --git a/drivers/gpu/drm/xe/xe_ggtt_types.h b/drivers/gpu/drm/xe/xe_ggtt_types.h
>>> index d34b3e733945..7e55fac1a8a9 100644
>>> --- a/drivers/gpu/drm/xe/xe_ggtt_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_ggtt_types.h
>>> @@ -7,9 +7,11 @@
>>>   #define _XE_GGTT_TYPES_H_
>>>
>>>   #include <drm/drm_mm.h>
>>> +#include "xe_pt_types.h"
>>>
>>>   struct xe_bo;
>>>   struct xe_gt;
>>> +extern struct xe_device *xe;
>> What is this for? I think we just need something like:
>>
>> struct xe_device;
Thought of since it was defined in other place used extern
>>
>>>   struct xe_ggtt {
>>>          struct xe_tile *tile;
>>> @@ -26,6 +28,11 @@ struct xe_ggtt {
>>>          u64 __iomem *gsm;
>>>
>>>          struct drm_mm mm;
>>> +
>>> +       struct {
>>> +               u64 (*pte_encode)(struct xe_device *xe, u64 pte_pat,
>>> +                                               enum xe_cache_level cache);
>>> +       } pat_encode;
>>>   };
>>>
>>>   #endif
>>> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
>>> index b56a65779d26..a468655db956 100644
>>> --- a/drivers/gpu/drm/xe/xe_pat.c
>>> +++ b/drivers/gpu/drm/xe/xe_pat.c
>>> @@ -3,12 +3,13 @@
>>>    * Copyright © 2023 Intel Corporation
>>>    */
>>>
>>> -#include "xe_pat.h"
>>>
>>>   #include "regs/xe_reg_defs.h"
>>>   #include "xe_gt.h"
>>>   #include "xe_gt_mcr.h"
>>>   #include "xe_mmio.h"
>>> +#include "xe_pat.h"
>>> +#include "xe_pt_types.h"
>>>
>>>   #define _PAT_INDEX(index)                      _PICK_EVEN_2RANGES(index, 8, \
>>>                                                                     0x4800, 0x4804, \
>>> @@ -62,6 +63,31 @@ static const u32 mtl_pat_table[] = {
>>>          [4] = MTL_PAT_0_WB | MTL_3_COH_2W,
>>>   };
>>>
>>> +static const u32 xelp_pte_pat_table[XE_CACHE_LAST] = {
>>> +       [XE_CACHE_NONE] = XELP_PAT_UNCACHE,
>>> +       [XE_CACHE_WT] = XELP_PAT_WT_CACHE,
>>> +       [XE_CACHE_WB] = XELP_PAT_WB_CACHE,
>>> +};
>>> +
>>> +static const u32 xehpc_pte_pat_table[XE_CACHE_LAST] = {
>>> +       [XE_CACHE_NONE] = XEHPC_PAT_CLOS0_UNCACHE,
>>> +       [XE_CACHE_WT] = XEHPC_PAT_CLOS0_WT_CACHE,
>>> +       [XE_CACHE_WB] = XEHPC_PAT_CLOS0_WB_CACHE,
>>> +};
>>> +
>>> +static const u32 xelpg_pte_pat_table[XE_CACHE_LAST] = {
>>> +       [XE_CACHE_NONE] = XELPG_PAT_UNCACHE,
>>> +       [XE_CACHE_WT] = XELPG_PAT_WT_CACHE,
>>> +       [XE_CACHE_WB] = XELPG_PAT_WB_CACHE,
>>> +       [XE_CACHE_WB_1_WAY] = XELPG_PAT_WB_CACHE_1_WAY,
>> Wondering if we need XE_CACHE_WB_1_WAY for every platform, or just
>> make XE_CACHE_WB the equivalent of 1-way or something? There might be
>> some more kernel internal spots where we want to use XE_CACHE_WB_1_WAY
>> across various platforms.
> Actually maybe just making XE_CACHE_WB use the 1_WAY on xelpg is best?
> What do you think?
Yes discussed with Matt Roper he also suggested to use 1_WAY for XE_CACHE_WB
>
>>> +};
>>> +
>>> +unsigned int xe_pat_get_index(struct xe_device *xe, enum xe_cache_level cache)
>>> +{
>>> +       WARN_ON(cache >= XE_CACHE_LAST);
>> What happens with XE_CACHE_WB_1_WAY on non-xelpg?
If we use 1_WAY for XE_CACHE_WB this will go off
>>
>>> +       return (xe->pat_table).pte_pat_table[cache];
>>> +}
>>> +>  static void program_pat(struct xe_gt *gt, const u32 table[], int n_entries)
>>>   {
>>>          for (int i = 0; i < n_entries; i++) {
>>> @@ -111,3 +137,13 @@ void xe_pat_init(struct xe_gt *gt)
>>>                          GRAPHICS_VER(xe), GRAPHICS_VERx100(xe) % 100);
>>>          }
>>>   }
>>> +
>>> +void xe_pte_pat_init(struct xe_device *xe)
>>> +{
>>> +       if (GRAPHICS_VERx100(xe) >= 1270)
>>> +               (xe->pat_table).pte_pat_table = xelpg_pte_pat_table;
>>> +       else if (GRAPHICS_VERx100(xe) >= 1260)
>>> +               (xe->pat_table).pte_pat_table = xehpc_pte_pat_table;
>>> +       else
>>> +               (xe->pat_table).pte_pat_table = xelp_pte_pat_table;
>>> +}
>>> diff --git a/drivers/gpu/drm/xe/xe_pat.h b/drivers/gpu/drm/xe/xe_pat.h
>>> index 659de4008131..54022f591621 100644
>>> --- a/drivers/gpu/drm/xe/xe_pat.h
>>> +++ b/drivers/gpu/drm/xe/xe_pat.h
>>> @@ -6,8 +6,30 @@
>>>   #ifndef _XE_PAT_H_
>>>   #define _XE_PAT_H_
>>>
>>> +#include "xe_pt_types.h"
>>> +
>>> +#define XELP_PTE_PAT_MASK              (BIT_ULL(7) | BIT_ULL(4) | BIT_ULL(3))
>>> +#define XELP_PDE_PAT_MASK              (BIT_ULL(12) | BIT_ULL(4) | BIT_ULL(3))
>>> +#define XELPG_GGTT_PTE_PAT_MASK                (BIT_ULL(53) | BIT_ULL(52))
>>> +
>>> +#define XELP_PAT_WB_CACHE              0
>>> +#define XELP_PAT_WT_CACHE              2
>>> +#define XELP_PAT_UNCACHE               3
>>> +
>>> +#define XEHPC_PAT_CLOS0_UNCACHE        0
>>> +#define XEHPC_PAT_CLOS0_WT_CACHE       2
>>> +#define XEHPC_PAT_CLOS0_WB_CACHE       3
>>> +
>>> +#define XELPG_PAT_WB_CACHE             0
>>> +#define XELPG_PAT_WT_CACHE             1
>>> +#define XELPG_PAT_UNCACHE              2
>>> +#define XELPG_PAT_WB_CACHE_1_WAY       3
>>> +
>>>   struct xe_gt;
>>> +extern struct xe_device *xe;
>> DItto with the extern.
>>
>>>   void xe_pat_init(struct xe_gt *gt);
>>> +void xe_pte_pat_init(struct xe_device *xe);
>>> +unsigned int xe_pat_get_index(struct xe_device *xe, enum xe_cache_level cache);
>>>
>>>   #endif
>>> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
>>> index 5709518e314b..64713f400d94 100644
>>> --- a/drivers/gpu/drm/xe/xe_pt.c
>>> +++ b/drivers/gpu/drm/xe/xe_pt.c
>>> @@ -58,19 +58,18 @@ static struct xe_pt *xe_pt_entry(struct xe_pt_dir *pt_dir, unsigned int index)
>>>    * Return: An encoded page directory entry. No errors.
>>>    */
>>>   u64 xe_pde_encode(struct xe_bo *bo, u64 bo_offset,
>>> -                 const enum xe_cache_level level)
>>> +                 const enum xe_cache_level cache)
>>>   {
>>>          u64 pde;
>>> +       struct xe_vm *vm = bo->vm;
>>> +       struct xe_device *xe = vm->xe;
>>> +
>>>
>>>          pde = xe_bo_addr(bo, bo_offset, XE_PAGE_SIZE);
>>>          pde |= XE_PAGE_PRESENT | XE_PAGE_RW;
>>>
>>> -       /* FIXME: I don't think the PPAT handling is correct for MTL */
>>> -
>>> -       if (level != XE_CACHE_NONE)
>>> -               pde |= PPAT_CACHED_PDE;
>>> -       else
>>> -               pde |= PPAT_UNCACHED;
>>> +       if ((vm->pat_encode).pde_encode)
>>> +               pde = (vm->pat_encode).pde_encode(xe, pde, cache);
>>>
>>>          return pde;
>>>   }
>>> @@ -78,6 +77,9 @@ u64 xe_pde_encode(struct xe_bo *bo, u64 bo_offset,
>>>   static u64 __pte_encode(u64 pte, enum xe_cache_level cache,
>>>                          struct xe_vma *vma, u32 pt_level)
>>>   {
>>> +       struct xe_vm *vm = xe_vma_vm(vma);
>>> +       struct xe_device *xe = vm->xe;
>>> +
>>>          pte |= XE_PAGE_PRESENT | XE_PAGE_RW;
>>>
>>>          if (unlikely(vma && xe_vma_read_only(vma)))
>>> @@ -86,19 +88,8 @@ static u64 __pte_encode(u64 pte, enum xe_cache_level cache,
>>>          if (unlikely(vma && xe_vma_is_null(vma)))
>>>                  pte |= XE_PTE_NULL;
>>>
>>> -       /* FIXME: I don't think the PPAT handling is correct for MTL */
>>> -
>>> -       switch (cache) {
>>> -       case XE_CACHE_NONE:
>>> -               pte |= PPAT_UNCACHED;
>>> -               break;
>>> -       case XE_CACHE_WT:
>>> -               pte |= PPAT_DISPLAY_ELLC;
>>> -               break;
>>> -       default:
>>> -               pte |= PPAT_CACHED;
>>> -               break;
>>> -       }
>>> +       if ((vm->pat_encode).pte_encode)
>>> +               pte = (vm->pat_encode).pte_encode(xe, pte, cache);
>>>
>>>          if (pt_level == 1)
>>>                  pte |= XE_PDE_PS_2M;
>>> diff --git a/drivers/gpu/drm/xe/xe_pt_types.h b/drivers/gpu/drm/xe/xe_pt_types.h
>>> index 2ed64c0a4485..075040b8a2d4 100644
>>> --- a/drivers/gpu/drm/xe/xe_pt_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_pt_types.h
>>> @@ -9,9 +9,11 @@
>>>   #include "xe_pt_walk.h"
>>>
>>>   enum xe_cache_level {
>>> -       XE_CACHE_NONE,
>>> +       XE_CACHE_NONE = 0,
>>>          XE_CACHE_WT,
>>>          XE_CACHE_WB,
>>> +       XE_CACHE_WB_1_WAY,
>>> +       XE_CACHE_LAST,
>>>   };
>>>
>>>   #define XE_VM_MAX_LEVEL 4
>>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>>> index 2e99f865d7ec..3f8675e9a62c 100644
>>> --- a/drivers/gpu/drm/xe/xe_vm.c
>>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>>> @@ -23,6 +23,7 @@
>>>   #include "xe_gt_pagefault.h"
>>>   #include "xe_gt_tlb_invalidation.h"
>>>   #include "xe_migrate.h"
>>> +#include "xe_pat.h"
>>>   #include "xe_pm.h"
>>>   #include "xe_preempt_fence.h"
>>>   #include "xe_pt.h"
>>> @@ -1192,6 +1193,44 @@ static struct drm_gpuva_fn_ops gpuva_ops = {
>>>   static void xe_vma_op_work_func(struct work_struct *w);
>>>   static void vm_destroy_work_func(struct work_struct *w);
>>>
>>> +static u64 xelp_ppgtt_pde_encode_pat(struct xe_device *xe, u64 pde_pat,
>>> +                                               enum xe_cache_level cache)
>>> +{
>>> +       u32 pat_index = xe_pat_get_index(xe, cache);
>>> +
>>> +       pde_pat &= ~(XELP_PDE_PAT_MASK);
>>> +
>>> +       if (pat_index & BIT(0))
>>> +               pde_pat |= BIT(3);
>>> +
>>> +       if (pat_index & BIT(1))
>>> +               pde_pat |= BIT(4);
>>> +
>>> +       if (pat_index & BIT(2))
>>> +               pde_pat |= BIT(12);
>>> +
>>> +       return pde_pat;
>>> +}
>>> +
>>> +static u64 xelp_ppgtt_pte_encode_pat(struct xe_device *xe, u64 pte_pat,
>>> +                                               enum xe_cache_level cache)
>>> +{
>>> +       u32 pat_index = xe_pat_get_index(xe, cache);
>>> +
>>> +       pte_pat &= ~(XELP_PTE_PAT_MASK);
>>> +
>>> +       if (pat_index & BIT(0))
>>> +               pte_pat |= BIT(3);
>>> +
>>> +       if (pat_index & BIT(1))
>>> +               pte_pat |= BIT(4);
>>> +
>>> +       if (pat_index & BIT(2))
>>> +               pte_pat |= BIT(7);
>>> +
>>> +       return pte_pat;
>>> +}
>>> +
>>>   struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
>>>   {
>>>          struct xe_vm *vm;
>>> @@ -1249,6 +1288,14 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
>>>          if (IS_DGFX(xe) && xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K)
>>>                  vm->flags |= XE_VM_FLAG_64K;
>>>
>>> +       if (GRAPHICS_VERx100(xe) >= 1200) {
>>> +               /* __xelp_pte_encode applies to xelp, xehpc and xelpg platform*/
>>> +               (vm->pat_encode).pte_encode = xelp_ppgtt_pte_encode_pat;
>>> +
>>> +               /* __xelp_pde_encode applies to xelp, xehpc and xelpg platform*/
>>> +               (vm->pat_encode).pde_encode = xelp_ppgtt_pde_encode_pat;
>>> +       }
>>> +
>>>          for_each_tile(tile, xe, id) {
>>>                  if (flags & XE_VM_FLAG_MIGRATION &&
>>>                      tile->id != XE_VM_FLAG_TILE_ID(flags))
>>> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
>>> index 3681a5ff588b..83a1f87b6537 100644
>>> --- a/drivers/gpu/drm/xe/xe_vm_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
>>> @@ -336,6 +336,13 @@ struct xe_vm {
>>>
>>>          /** @batch_invalidate_tlb: Always invalidate TLB before batch start */
>>>          bool batch_invalidate_tlb;
>>> +
>>> +       struct {
>>> +               u64 (*pte_encode)(struct xe_device *xe, u64 pte_pat,
>>> +                                               enum xe_cache_level cache);
>>> +               u64 (*pde_encode)(struct xe_device *xe, u64 pde_pat,
>>> +                                               enum xe_cache_level cache);
>>> +       } pat_encode;
>>>   };
>>>
>>>   /** struct xe_vma_op_map - VMA map operation */
>>> --
>>> 2.25.1
>>>

