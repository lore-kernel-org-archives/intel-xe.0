Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD588C4167B
	for <intel-xe@archiver.kernel.org>; Fri,  8 Dec 2023 07:32:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EA9F10E9E7;
	Fri,  8 Dec 2023 07:32:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65CD410E9E7
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Dec 2023 07:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702020757; x=1733556757;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bQjyDWUXykAeGoI8+9V+8jqBJRPBDC2nUYF6A0A+xW4=;
 b=jrbNGiWoQ/AXrHymPdyF5U/0XOqV1RMLa9WxBpzBu8LCma2oBzsbcSXX
 62cXU3g6IADd7x463nKiQDvHP6qJcClSaw4gNsWbwwNIH+mlwJz+xBLeE
 MiD+AcBezy7jXMjkFsqaC+mcElepWbA8/bfnWaq0rqriYCrJ9aRHDffIF
 Rrl0LRJENTEO32qKG1pKPAmET0oHEApw4WnpMLQcDHq2kf77kH/WiCtgY
 +9gsCSNTeGUNBYFpdSg4yC+aKeCcHbaIsEA1/GmhQgeRIuAXjWG9WeB0e
 HOwHeQe3Fw+1Y6zW0Z/rqnf7+G+thqnG4noScGedc7AxPczuNbsBRbl+Q Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="394110609"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; d="scan'208";a="394110609"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 23:29:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="721779273"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; d="scan'208";a="721779273"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Dec 2023 23:29:14 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Dec 2023 23:29:14 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 7 Dec 2023 23:29:14 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 7 Dec 2023 23:29:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RP8RiishJOwTYSX/WxmWnhkzPA3XkxD0mavwZfa70n845xYhtFKGUnWMmSWlU2pwF+ENxDgbxphqWeIXvL2vUAKItRvmaTBz2zl4p1YdZeO1HFpc24qv7Tb/U62rvf/RoTSlAIOd8gVrKoaHwzKplVo6MJGyAaUjg1Fo6ReXJ9PUOoka+Wd+QTlmq6JkRPxZVDQJdFYMxpQTd0T/AM9lRpshXhbcZ/6tb3ZIjZtkSPgVvqZ6ouQ6EI5WSnKn7TjWdWB1Y1SyTucDacmHQHZxmIAwnIkOhbeO9R37HGSphvfQFBhrpsamkaonnYayBx3+vE9FlhWXht6VHKgokRKB5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PmduK6YEYmzm3466S3QITY1sl+XstOnVm1GCrLTqZNE=;
 b=OspDnB0/wTBjuPTYcy9+5SUAphtKB4OYpBW/Yr/TrxSPgQdGc1CMxjVc7LNPqnW52ZFuOQ6dZWOhaUP6d2vLXvKWXgl4EG4XCq0gdLsrHMpmkNlrX/6Qa0a3eUbVZBpfT5n2ISUIssk1sqiHRMGX+ixdoKYY6QeSDehiFDsXdWZ+HVJ07GFGyd2JYaazWTJdfZSCImxQy+zSOvzbxkDzloUmYo9CQUMTWY9rUjls3O3rT2VwgMo90v9WsSrWD05/jK5Epb8yx9cpJevH/jlcJdK+IpcfpfQnPMXJFI1h+I2v0594bK2Et5j4fWwTfwbQ6B5q+DRSrUIg8nHJv4N2OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by PH7PR11MB6521.namprd11.prod.outlook.com (2603:10b6:510:213::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.27; Fri, 8 Dec
 2023 07:29:11 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::51c3:59ea:6d4:8bc0]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::51c3:59ea:6d4:8bc0%4]) with mapi id 15.20.7068.028; Fri, 8 Dec 2023
 07:29:11 +0000
Message-ID: <a2a11619-faca-4fb6-b6d1-4aa09a6d8070@intel.com>
Date: Fri, 8 Dec 2023 12:59:05 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe/dgfx: Block rpm for active mmap mappings
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20231206133421.3295163-1-badal.nilawar@intel.com>
 <20231206133421.3295163-2-badal.nilawar@intel.com>
 <c3e2e04f-7cb3-4d68-b19a-5c7271a0c626@intel.com>
 <381b6034-cdbf-4259-ab28-e7858fd750dd@intel.com>
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <381b6034-cdbf-4259-ab28-e7858fd750dd@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0002.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:95::22) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|PH7PR11MB6521:EE_
X-MS-Office365-Filtering-Correlation-Id: bd57078f-b3cc-45ea-f40c-08dbf7bf5f69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: j+3MLoroozBcQMcyNRVIMjxhaOBMNLWA0WSwPRKP57QDXKLkt7chlEhzrg9vFJn3+A3bhK8q4P+xTckBrjQtUm4JWPZlTsBOM5ytb1eTwjnsO8czPnIKPcoZe/pWwMaTUTjGq21hqCAWI9Ko39BJ74ryx8M05g3zaFPq638YMBABWeq3q526g44sWfyJkPiIkcHyA7VWKeCO9BZphYtCkU8RVsgkXlKxIUl47kDZ/F+gabCKvLulVzSgAVCTLW+bfDKoQVGkNHhtpSnHEv5FuKdXbVatZX+sTfOgAYzNAryO3URPkZDZa4FfOjveQtcmo38dcL7XL6h7rF9cFpKnZnXm5GMi4fHMbWTUOHdUIQ7q4+7ePgqdK6lbEr80c6dIpjp28z5HgfFxfy3KPmB4mVE8w2UoN+Mp45tnxbIbxHEsGNL0v32QFGYOEdy+IPNpSXPTZV77dtF2gaFJrj6tCUjuido7ivftA7wSSKLGQTDMZw+eX01sLjFWm/kpL0tP+gzKvAL4JipMqnqxpDNvNZk+f2f7pI0EE82bXLfY8jcZU410KflpQYQpYt5JbYI+DlWj1l22W/xpqeeKOGCUxWW9YD95noecKb66/JbsIE81EuFySVeNp2u1f4Iuw+4ZN0ao4w2xT2+74nnRMiYaYA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(376002)(366004)(346002)(136003)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(66899024)(31686004)(38100700002)(41300700001)(5660300002)(2906002)(36756003)(8676002)(4326008)(316002)(6512007)(6666004)(478600001)(53546011)(6506007)(8936002)(66476007)(2616005)(31696002)(82960400001)(26005)(66946007)(86362001)(107886003)(66556008)(83380400001)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cWV0YWtGaTlsY1Q1QzZVb0NOdVZnd0hoUjdyYzRIZ1VEd0o5Ni93ei84WGdy?=
 =?utf-8?B?eWl5YVN2aksrenRHaE55WXE1SU1NaVZZQmo1Z20wU2pnSUpRRU9FRTVDWWF1?=
 =?utf-8?B?WURkMWFEVUtYVTdVNXhxblo2RERMdUFHM010Z3JYc3lEMC9ydUgzYklMNTE0?=
 =?utf-8?B?Nll2SnZCVnRXMkpmTHBrSTVGQ0ppVkxSZVhheWxlWG5yMUFJNFc3ZDd5YlF1?=
 =?utf-8?B?M2ZpMWc5cHlxMytiWlczYWpqNzZRbko0d3FMYUlYcXZQS1NEcWlIR3g4ZEc1?=
 =?utf-8?B?V2FFTStXUTR3LzI1TFFQdENvT2I1M3VhMEdDbENXMjMwZkRYSmp6aUFacEJv?=
 =?utf-8?B?YzVEN1luVTZlY2o4bEtaZ3RvaTlSUEh6TDJvU0VnV1NBdFRRZkl4TnI3UkVu?=
 =?utf-8?B?a3dzcW9KSXVYWUttYVFqUVdid0t5cG9DWmhVQjVIM043WndWWUIwOGVzeTNi?=
 =?utf-8?B?Z2VzTmdHY282NExFbGNwcWVER1R1S2pmQjh3Wk5BekJUTWp0RGc4ZlN3bFVx?=
 =?utf-8?B?VVBDRExRekNYTjN6VEM0N3QvQUpDcVpyOWUxVC9tdUtrVGVKa1dvcFRwTXdn?=
 =?utf-8?B?alp1NVhXZkdIVUxOMExoZmFuekp1UEt5ZWEwVExYMW5iWmY4dW5ldnlvUW9I?=
 =?utf-8?B?dm9XRWNqZUxPQkRlUWJjaG1Qa3VGMVJmb3BzMzMyTkh2STIzM2FyUlRNcTlJ?=
 =?utf-8?B?WENQd3l2ZkJFWnk5UGVqUVZvUWVrMjNwUmtsU25zamFXLzRWSzVqNkZCSnU2?=
 =?utf-8?B?MFcxUzJjaHRiOXFQbVVEZTY4b3FxRlU1T0dUR2hPT0EvQVkxVjVudWZSUGpP?=
 =?utf-8?B?L1daVCtYZi9MaXZWNDladTdubEk4Qjc3cE1wY0tLcW9tSVkwVUdPdGdqUXd2?=
 =?utf-8?B?UzdjUG01dWE4b05YR0hGeVBzalpFTGs2ZzY3aFV4Wk42ZFEyVU8xWmpBUEl0?=
 =?utf-8?B?d0VVbXhmT0g1a1NxMHN4UmlNT0ZvOUhrN1NHU2cvcTJQOUR0OG44Z0RQdzFH?=
 =?utf-8?B?Y0R1bFF6MzFIRXR3ekNQUXlJaE4xeFB2SThYUlBXWUo2TFo1M2Zuem1CK0xZ?=
 =?utf-8?B?Q0hvaXhESmcyaGF4amdVWHRuSUNmZHVUSEdRRGhrcGhZMVVhR1BvTmx5YWtx?=
 =?utf-8?B?SC84VkpsTTBJTHp0L3JRa0RXTDR3U3pNazNocEtIQkpkTENxS2ExdkJONVJa?=
 =?utf-8?B?VHprRnpFMzZvTUFnUWttY3oycmU3ell5RTlrN21ZbnVQdk5oUHhqYy9GZFd1?=
 =?utf-8?B?a1BQY2xTd0owcFU2TDZ0Syt1b3I4ZTVWekpoMXVpZjgyelZncG9YYk1XaTJJ?=
 =?utf-8?B?YXIyZ1d1bFRJRmhRczkyeDh6R3VNWVdSd2lJekN1VWtwN1JycWFZS05rcHBl?=
 =?utf-8?B?WTcvK2JkRUQ1aHRObHhaWWxtSnJnK29FaGUvb1NrZDYxSSs0emJkNmw5UHor?=
 =?utf-8?B?eWNKbkg0RWdpM3dUdXR4Mjh4MnU2N3JrQ2RhUWx2NzRrcC9hZkZKSTg4NVha?=
 =?utf-8?B?a29zRStNMW41TDVUcWFSQlpWZERxYnBvdVJ0ZDdYOUVZTElBWmlmM1NIMkVO?=
 =?utf-8?B?ZVFtVEpBeHMyNkRYK296OWR4RXd6TUNmdmZzaVloQVYwUENWMUp6MURNbkY3?=
 =?utf-8?B?NFlzZW03MTh1VWxmZW1nU011V1dJbFJUb0svWmJGSm1uTzFDOGtzWHFqa3ZS?=
 =?utf-8?B?R1BnZFJPR2grak1GYnVUaEtVc0o4WHpTU3hpOFdNUzRTSWFKZG1SZStyRzRH?=
 =?utf-8?B?YzNnZTZjY1JRckZGQVdUTWdEYWVxY003ejNlRHVHR01xL1VLY1RDTXN5NXRQ?=
 =?utf-8?B?aXgrOXVOZXArc0hIZWN1eXVLckt4WG5jRlprMjUzc3RvYlA0TDczSTdGc3hJ?=
 =?utf-8?B?Qm5KRWJaYUZTZm8vTkt5NGRZbjRGUHE2UlVxSGtxa1FrOXpONzZvNWVvcFBl?=
 =?utf-8?B?REVIenBtdTExdnBpUzM3TFFUckMvRU1HZTBoOWQ4S3huNUg3VVpCek5SNDlT?=
 =?utf-8?B?S21pbjQvZHJka2pOd0I0N0JzSnljbmZGbTVrcjk4U0MrS1hyL2ptT0VzUnVx?=
 =?utf-8?B?S2t0T1RkUGZ4UjFXVm9zL1p5c2tEM3AyYzBGb2ZSZkd2aGhFR3R4SWEvR1FK?=
 =?utf-8?B?eXMxL253d0ZsUHdQdXhKN1RLUmJQUFlzYm4wSnZkQUZ3VGg1bmJVZFp0MEls?=
 =?utf-8?B?Snc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bd57078f-b3cc-45ea-f40c-08dbf7bf5f69
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2023 07:29:11.7508 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SMd0uCeeeRXxOamSm0bEwZgtNFJuZ9p78BKhiTk+IDqgfr7XYld61KvdoRwYH8KaKD+w9RRO1GoxDD1Q54IgAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6521
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
Cc: rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 07-12-2023 18:36, Matthew Auld wrote:
> On 07/12/2023 11:26, Matthew Auld wrote:
>> On 06/12/2023 13:34, Badal Nilawar wrote:
>>> Block rpm for discrete cards when mmap mappings are active.
>>> Ideally rpm wake ref should be taken in vm_open call and put in vm_close
>>> call but it is seen that vm_open doesn't get called for xe_gem_vm_ops.
>>> Therefore rpm wake ref is being get in xe_drm_gem_ttm_mmap and put
>>> in vm_close.
>>>
>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
>>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_bo.c | 35 +++++++++++++++++++++++++++++++++--
>>>   1 file changed, 33 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>>> index 72dc4a4eed4e..5741948a2a51 100644
>>> --- a/drivers/gpu/drm/xe/xe_bo.c
>>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>>> @@ -15,6 +15,7 @@
>>>   #include <drm/ttm/ttm_tt.h>
>>>   #include <drm/xe_drm.h>
>>> +#include "i915_drv.h"
>>
>> Do we need this?
>>
>>>   #include "xe_device.h"
>>>   #include "xe_dma_buf.h"
>>>   #include "xe_drm_client.h"
>>> @@ -1158,17 +1159,47 @@ static vm_fault_t xe_gem_fault(struct 
>>> vm_fault *vmf)
>>>       return ret;
>>>   }
>>> +static void xe_ttm_bo_vm_close(struct vm_area_struct *vma)
>>> +{
>>> +    struct ttm_buffer_object *tbo = vma->vm_private_data;
>>> +    struct drm_device *ddev = tbo->base.dev;
>>> +    struct xe_device *xe = to_xe_device(ddev);
>>> +
>>> +    ttm_bo_vm_close(vma);
>>> +
>>> +    if (tbo->resource->bus.is_iomem)
>>> +        xe_device_mem_access_put(xe);
> 
> Are you sure this works as expected? Say if the user partially unmaps 
> something?
> 
> map = mmap(obj, size);
> unmap(map, size/2);
> unmap(map, size);
> 
> That would be one mmap but multiple vm_close calls leading to an 
> imbalance in the RPM ref. I think we need the access_get in the vm_open 
> also?I haven't tried partial mmap but for single mmap-unmap I observed
equal number of xe_drm_gem_ttm_mmap and vm_close call. Will try partial 
mmap.

For mem_access_get in vm_open, initially we were trying the same but 
observed that vm_open never get called.
In fact i915 i915_gem_mman.c we found this comment for vm_open.
         /*
          * When we install vm_ops for mmap we are too late for
          * the vm_ops->open() which increases the ref_count of
          * this obj and then it gets decreased by the vm_ops->close().
          * To balance this increase the obj ref_count here.
          */
Does similar reason applicable for xe vm_open as well?

Regards,
Badal
> 
>>> +}
>>> +
>>>   static const struct vm_operations_struct xe_gem_vm_ops = {
>>>       .fault = xe_gem_fault,
>>>       .open = ttm_bo_vm_open,
>>> -    .close = ttm_bo_vm_close,
>>> +    .close = xe_ttm_bo_vm_close,
>>>       .access = ttm_bo_vm_access
>>>   };
>>> +int xe_drm_gem_ttm_mmap(struct drm_gem_object *gem,
>>> +            struct vm_area_struct *vma)
>>> +{
>>> +    struct ttm_buffer_object *tbo = drm_gem_ttm_of_gem(gem);
>>> +    struct drm_device *ddev = tbo->base.dev;
>>> +    struct xe_device *xe = to_xe_device(ddev);
>>> +    int ret;
>>> +
>>> +    ret = drm_gem_ttm_mmap(gem, vma);
>>> +    if (ret < 0)
>>> +        return ret;
>>> +
>>> +    if (tbo->resource->bus.is_iomem)
>>> +        xe_device_mem_access_get(xe);
>>
>> Checking is_iomem outside of the usual locking is racy. One issue here 
>> is that is_iomem can freely change at any point (like at fault time) 
>> so when vm_close is called you can easily get an an unbalanced RPM ref 
>> count. For example io_mem is false here but later becomes true in 
>> bo_vm_close and then we call mem_access_put even though we never 
>> called mem_access_get.
>>
>> Maybe check the possible placements of the object instead since that 
>> is immutable?
>>
>>> +
>>> +    return 0;
>>> +}
>>> +
>>>   static const struct drm_gem_object_funcs xe_gem_object_funcs = {
>>>       .free = xe_gem_object_free,
>>>       .close = xe_gem_object_close,
>>> -    .mmap = drm_gem_ttm_mmap,
>>> +    .mmap = xe_drm_gem_ttm_mmap,
>>>       .export = xe_gem_prime_export,
>>>       .vm_ops = &xe_gem_vm_ops,
>>>   };
