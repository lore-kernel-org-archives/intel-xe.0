Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DB6CEB64DD
	for <intel-xe@archiver.kernel.org>; Thu, 20 Jul 2023 14:18:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 576EE10E03A;
	Thu, 20 Jul 2023 14:18:53 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33A7E10E5D3
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Jul 2023 14:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689862732; x=1721398732;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0VgzN4vAAMdCvBkqSfH6kMtLhARxtPAVOnch/GxI8DI=;
 b=iS5f+9aQTMpNGCjwcLOaJMjxgHl+37fAH0d0c4guuJYLbIHWEk395fo/
 80e3bg1HPc1bv8MelTYKi8f9iBTRYug+T7m0p1YRtBnOlulvUG7wAaUAG
 tNd+mgZxmVCZSGR7MH+zKFg8AWaxw8ExFDcTYnn2Zi8jUpWQwl01R4/Vb
 lE61t8B3jZDe3nscQ3WZq5nkydCxdPT6SSLMHysmxOtMCIP5H3SXXmDNl
 GiL+LlkQHn77wEqf8KzuDOHYoa2EJ7Hbr6x0BoQvCGksOt509C60/tOGQ
 EiTHbeZDTkVS0rc37ZAXhcuoYepk0O7KtDT/1nscq3wXB8mZrEhwfH481 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="453122810"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; d="scan'208";a="453122810"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2023 07:18:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="754069300"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; d="scan'208";a="754069300"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga008.jf.intel.com with ESMTP; 20 Jul 2023 07:18:47 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 20 Jul 2023 07:18:46 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 20 Jul 2023 07:18:46 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 20 Jul 2023 07:18:46 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 20 Jul 2023 07:18:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nSc87oHz4CX7270QCjRnOhp3gBn8hdQNFVtSyuOzzmKNzwzXQ99daNjq/mG7IMhdu0GURKg9aPupaF2nmLt/TOkUYq9qd9nw2GqsZyZD2SA9Thdz9xmnl6merQ2CUW4betVeNuc2wpQeoeUll2I4lFKoIfzOgw5/HU9VhTwBYBu2f+ngEUsmalx/8iprQCKdg7vnFwWtKOtM/EHvlajMT3dEr0wRNzjNqt2cw4UFeDJa/P8G3Sn3wkZ0TnI0jNZCMbzlYmvmC0+WHeVN7WTUkhjEpWaRw2d+PC2UexkAkGujfpUs2ri4Ew0VPDgBdxgvCFaFzzSuUjP7n3IlnZxP9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R6/nE7AubcmkpYBTjKXNfiaPF5Fk3D7kwWlrh9airA4=;
 b=VVIwqrITFHDkk8avFWO/sTa0LeLbmjATe9cKBlym2OGPcfuCiiBMP8+r9zsgjTcVvxe1HSY8SLXuEaufj4/O9BcPEdVjNxagh54phn+kxQjaJJw/xR9odjRNiC07kzGcPXS2sOngMwqxNtT/5W32EJ3tLbkxughLtVwxnRsGIlRk+S2o/1nihILDPwE64SovynIt/emFgzv+R4wL4Sdztm/yHAk49WjMns6MnFQMRqFxmVg/yyuYyhl5r0CbO7r4WDRgruo7Se4wIcVBqqkn4u333UFg+TV0knszYH715HL7ue2ynqc9P7ysFiilfZY5w71lOWRrLksdhJDh6QyLlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5624.namprd11.prod.outlook.com (2603:10b6:8:35::16) by
 SJ0PR11MB4927.namprd11.prod.outlook.com (2603:10b6:a03:2d6::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.24; Thu, 20 Jul
 2023 14:18:43 +0000
Received: from DM8PR11MB5624.namprd11.prod.outlook.com
 ([fe80::dead:4565:f8d6:50a8]) by DM8PR11MB5624.namprd11.prod.outlook.com
 ([fe80::dead:4565:f8d6:50a8%5]) with mapi id 15.20.6588.031; Thu, 20 Jul 2023
 14:18:43 +0000
Message-ID: <e19e20f1-637c-4660-ee24-bfa714e89d17@intel.com>
Date: Thu, 20 Jul 2023 19:48:33 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: Lucas De Marchi <lucas.demarchi@intel.com>, Matthew Brost
 <matthew.brost@intel.com>
References: <20230712125640.1471850-1-ravi.kumar.vodapalli@intel.com>
 <ZK6+NZUQnfZCLQj0@DUT025-TGLU.fm.intel.com>
 <mr6slrxoedm46acyb73yzx5yoyuhjbeuixh3albo5jofuuawma@uformzo3j2r5>
From: "Vodapalli, Ravi Kumar" <ravi.kumar.vodapalli@intel.com>
In-Reply-To: <mr6slrxoedm46acyb73yzx5yoyuhjbeuixh3albo5jofuuawma@uformzo3j2r5>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0032.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:97::22) To DM8PR11MB5624.namprd11.prod.outlook.com
 (2603:10b6:8:35::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5624:EE_|SJ0PR11MB4927:EE_
X-MS-Office365-Filtering-Correlation-Id: 5472ad4e-a869-409e-5c4a-08db892c392f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v7rqb7pSsj/T19bgl+fLEr32381eu/3Aq4ER7oEmIKFcS0YthnuabdWd9Tt5p9eVDh9daN/2/Xii8ZbjnucpKJgHMR/7BLOJPiky8yCXePLUvFC2yAJU011oVn03ZuN1SOSDsULBiSI4OnSYHkS5pxnTdOQkYH0BqyJw8j/zG92bBXnzMGGN1Qgynpo78YAO4yLKCcvREa/aicmzdIaDLLUwntcil//nXcyb9YFmN3TsBjQlWTZmXTE+3FiXBgtzd5zVqwtmIFQiN4zeh91o0kgSwtvYXQ9fyo/SY1VmlT1nNzId1DrM91NxiVkNeIqtWxx0xHouBRfJmjWXH3ACPj6Busut+WzMxGSuDLeSzN9csM+SsW5pMSZ7wCROSMDCaTXq6+wmBZCQ09SEmN4GVf8QiLQyARhqOvDkKxVLOMDfQ4DAaY0KqS/e0YBjAvtYXJWHym1m9N0BBc4JsnugMvcAp4vQCrXV5kH0y57jWo/zm57q7N9ObeJcYapRgW5fs1vnM6oERBG+NKcLRrVHEAY97o2Vvnf4Ag4ZzlYtNotQ3xyJX/+wz5GqiOoRjyo0kJNcNx1wTNEgwqe44KPtUu4YCkc55omwRfu/TfRfu+pg6oZ2K4SAtebc95nE0eGYLrKYzi6gSzHpuLgaRaTlQw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5624.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(396003)(376002)(366004)(346002)(39860400002)(451199021)(41300700001)(316002)(66476007)(4326008)(66946007)(31686004)(66556008)(6636002)(5660300002)(110136005)(2906002)(6666004)(6486002)(53546011)(26005)(6506007)(8676002)(86362001)(186003)(6512007)(8936002)(31696002)(36756003)(478600001)(2616005)(83380400001)(82960400001)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RE5Xa2svdmlZNVJUZllnYVJBMkM4RVFsbFgyekFidXR4Z253T0NXMlJZMGRL?=
 =?utf-8?B?OFNXYXltSVgyMGVTSGpxNThkU2dHQUhCOG1YUkwzZnlDOEU4QURiUG9MQkVE?=
 =?utf-8?B?SWpnV0p3OGV0bWxkYmY2THpqQUZaeWgzZDJuamlmOS9jTUNRQkl6T1Bqc1pP?=
 =?utf-8?B?cXhiNWt2bEJnak1wcFB1RDAyNkV2SjBhOTh3bGtCS2JzNFVETHM5MXhRNnhC?=
 =?utf-8?B?MTd2Y0xCclZmUVhiWjVXbXlpdXphbmgvVktXb0xtblJpRjVyeVpBM3ZTSnA4?=
 =?utf-8?B?cmZBWDN6T2UyYzBXNkZsK3NMdkZBR2lqTzdPMVNITmplRjFnd0xORXBiZWlV?=
 =?utf-8?B?SkJNeVNuQ1R4aVdiWDR3dTdFS2cyRGdOZE5pRW1qaWs4TmxUaThoTnBaUW1O?=
 =?utf-8?B?b0dsdjhXaGh1WDhWQkFhbGNNSUNpZVoyaGc5NzFkeGlJUGJaczMzSGYya2Zk?=
 =?utf-8?B?SDJoVWZJdW1CdTFIN0g3dGVTQndvS1E3QTcxZndkcE5hamVXUmprM2swVWlm?=
 =?utf-8?B?QWlFK0oyckJvR0hHQzVzSEc1UjhIU3ZGY3FBQ3hlT3c1SmZ3KzNHa01CUGp0?=
 =?utf-8?B?TlUxQnRLWWNtdE42ek55aERZNTVFZS83azdjbzBuL3BkYlZ3bnR4Uzg4SkJU?=
 =?utf-8?B?Q1FaRElGMVNVSExINDJLYVVSTEs5LzRvaXovMGtzNG9sVEtkWUdVRE8yZkdx?=
 =?utf-8?B?REEwSkx6WVlNOGczODhMQ0U5dUgyVHF5TXFhcFhka2k1bkdSK0hwVjV1MExU?=
 =?utf-8?B?QWo5WUI3QnorM0doZk1raTRTVi9nMGoxSm5kTE43SVZpUU9jeTdDYnUrNnBU?=
 =?utf-8?B?OWJTaHdoU080eTBsZWZkNTByYU9XM2JPOEF5cm9nMy9JVWFkUkpONTNKamVN?=
 =?utf-8?B?Y3QyTUcrMTB5RzVJSVIvUFBZWkQ1d3FuMDJoOGFjZG5PR1lvRUZteHN3eHRt?=
 =?utf-8?B?ZkJHWC9aRlR6WnhPcitRdGZWaWZvdi9UcGcvOHBDbzhNWGhUa2lNNmxncGtV?=
 =?utf-8?B?Z01UMnBnOEhBZkRIaWZrNVlQd003RUc0MXlSZ093a3dHTVBLNmF4bnhSaEpR?=
 =?utf-8?B?RDZVeXc5VVdKUU92d0lpUEVTTUVGa0tGTnFtTHY5Ym4rUGZ5TkFxR2pYTndp?=
 =?utf-8?B?dXpOTElIUWpnQTFVZ1NTYUNyVmlPaTBIcU5ibUdVcmg2czJGQ1diVnRKR3lJ?=
 =?utf-8?B?S2NHMy9Pcmh6dEc4M2FOS3QzaEFKL0JoQlFVU3JkSXRLZyttdi9ZM1VRWG4y?=
 =?utf-8?B?VkFoM0RkVHVGNXd4MkduN3UrWFJiQm9sSW5vTTlzeHlmSUxYem1wR3JkNGF1?=
 =?utf-8?B?bTJrbit6QytQV29vSEt3NTRBQ3hIZkM3Uk5NQUgvM0tRV0FKdk9Ga1phdXFx?=
 =?utf-8?B?bnh2Znpiek9KMDhSbi9XSUhrVzVDelJKMS9ZRUhxdk42WTNTdE9NOGl5M2tL?=
 =?utf-8?B?WUsxbm9vYmlVOVl0NGo4QVY5cDBQcTVXZ1pPa3d5T3hwbmNFS3pqcUpjZnUw?=
 =?utf-8?B?MWRuVUQ4VGcwOHUzMVF5Wm5CY1BqYVJWSnQvT3lSVUhYZGVCTko0cUZPL1Qy?=
 =?utf-8?B?Y2VkTkE2QVBid3F3RWxWVGlkdUxKZW05QlJxQTZGc210MVhQMHR5QU5GTE14?=
 =?utf-8?B?OCt2NUlXVjZ4cmJUNVUwQkhQbE5ZOWJrdkVtSkluQkVpTkUzZ3FFTTNUM1Rm?=
 =?utf-8?B?cU5yTFpLTzA2S24yOVlaRTQyTGNDRFZDekdvQVd4ZGpsWXBoMDZZanJwelc2?=
 =?utf-8?B?SmdvWHM0aUxGdlZVMWp2bEEwUUI2QjFJNzBEVm9NbG5EaUJubE5VTW5tR21Y?=
 =?utf-8?B?Vnl0MHpNYUxsbDZhNXR6c0w2WnJGYmZDU29MT2ZuYk00Y3l6TWl5VWxnajh0?=
 =?utf-8?B?bXVsZ2kwWjdBMzI0WjdYemYzdzVNOWlvZ2dIVlo0a0g1TWpkTnpPQnhJMTYy?=
 =?utf-8?B?VENueDlKZVJZQkVnL0dyUDFQNytjMERvZ0t5ckQ3RXBPQTg0MHBrY0N5RC82?=
 =?utf-8?B?K2J5Z1RuNFVrM2w2cFJwSXYrbkVJUDJtRWEyQlhQaVNPL1FHUDY5bi9hRDgx?=
 =?utf-8?B?TG1kRi9qTUVKbEhsODZoR3RzU0lNU0VkaDgrWUhpRnkyV3pNbEpyd0FMZnhw?=
 =?utf-8?B?M1VvR3VRbCtUUytUTXRLenR6Smt4Qko3WkRqazZGM21tKzN0SWJJYS83Ri9W?=
 =?utf-8?Q?wVIg/pI9b07v8Lv/eN/FsCI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5472ad4e-a869-409e-5c4a-08db892c392f
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5624.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2023 14:18:43.7818 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ExSw7fejc4WHtZj/BF95XQQEkDtOcYepyCuDDmV+6lDzMTNp1CcsVAcl/7IHQ2ZRI5kPMaxb55UIgnrmMXTfgRTK677wT+jYH/57nrJnEyU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4927
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/ppgtt: Add support for correct PAT
 encoding in Page Table Entry (PTE) format
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 7/17/2023 6:53 PM, Lucas De Marchi wrote:
> On Wed, Jul 12, 2023 at 02:52:37PM +0000, Matthew Brost wrote:
>> On Wed, Jul 12, 2023 at 06:26:40PM +0530, Ravi Kumar Vodapalli wrote:
>>> Different platforms has different PAT encoding in PTE format, add
>>> correct PAT encoding for pre-Xe2 platforms (XELP, XEHPC, XELPG).
>>>
>>> Bspec: 45101, 71582
>>> Signed-off-by: Ravi Kumar Vodapalli <ravi.kumar.vodapalli@intel.com>
>>> ---
>>>  drivers/gpu/drm/xe/xe_pt.c       | 110 +++++++++++++++++++++++++++----
>>>  drivers/gpu/drm/xe/xe_pte.h      |  31 +++++++++
>>>  drivers/gpu/drm/xe/xe_vm_types.h |   1 +
>>>  3 files changed, 129 insertions(+), 13 deletions(-)
>>>  create mode 100644 drivers/gpu/drm/xe/xe_pte.h
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
>>> index 00855681c0d5..e7f8bd4dd518 100644
>>> --- a/drivers/gpu/drm/xe/xe_pt.c
>>> +++ b/drivers/gpu/drm/xe/xe_pt.c
>>> @@ -16,6 +16,7 @@
>>>  #include "xe_trace.h"
>>>  #include "xe_ttm_stolen_mgr.h"
>>>  #include "xe_vm.h"
>>> +#include "xe_pte.h"
>>>
>>>  struct xe_pt_dir {
>>>      struct xe_pt pt;
>>> @@ -111,19 +112,7 @@ static u64 __pte_encode(u64 pte, enum 
>>> xe_cache_level cache,
>>>      if (unlikely(vma && xe_vma_is_null(vma)))
>>>          pte |= XE_PTE_NULL;
>>>
>>> -    /* FIXME: I don't think the PPAT handling is correct for MTL */
>>> -
>>> -    switch (cache) {
>>> -    case XE_CACHE_NONE:
>>> -        pte |= PPAT_UNCACHED;
>>> -        break;
>>> -    case XE_CACHE_WT:
>>> -        pte |= PPAT_DISPLAY_ELLC;
>>> -        break;
>>> -    default:
>>> -        pte |= PPAT_CACHED;
>>> -        break;
>>> -    }
>>> +    pte = xe_vma_vm(vma)->pte_encode(pte, cache);
>>>
>>>      if (pt_level == 1)
>>>          pte |= XE_PDE_PS_2M;
>>> @@ -187,6 +176,94 @@ static u64 __xe_pt_empty_pte(struct xe_tile 
>>> *tile, struct xe_vm *vm,
>>>      }
>>>  }
>>>
>>> +static u64 xelp_pte_encode_pat(u8 pat_index)
>>> +{
>>> +    u64 pte_pat = 0;
>>> +
>>> +    if (pat_index & BIT(0))
>>> +        pte_pat |= BIT(3);
>>> +
>>> +    if (pat_index & BIT(1))
>>> +        pte_pat |= BIT(4);
>>> +
>>> +    if (pat_index & BIT(2))
>>> +        pte_pat |= BIT(7);
>>> +
>>> +    return pte_pat;
>>> +}
>>> +
>>> +static u64 __xelp_pte_encode(u64 pte, enum xe_cache_level cache)
>>> +{
>>> +    pte &= ~XELP_PAT_MASK;
>>> +
>>> +    switch (cache) {
>>> +    case XE_CACHE_NONE:
>>> +        pte |= xelp_pte_encode_pat(XELP_PAT_UNCACHE);
>>> +        break;
>>> +    case XE_CACHE_WT:
>>> +        pte |= xelp_pte_encode_pat(XELP_PAT_WT_CACHE);
>>> +        break;
>>> +    case XE_CACHE_WB:
>>> +        pte |= xelp_pte_encode_pat(XELP_PAT_WB_CACHE);
>>> +        break;
>>> +    default:
>>> +        /* pte |= PPAT_CACHED; */
>>> +        break;
>>> +    }
>>> +
>>> +    return pte;
>>> +}
>>> +
>>> +static u64 __xehpc_pte_encode(u64 pte, enum xe_cache_level cache)
>>> +{
>>> +    pte &= ~XELP_PAT_MASK;
>>> +
>>> +    /* Initially assumed as CLOS0.
>>> +     * To Do: CLOS1/CLOS2 has to be set depending on requirement
>>> +     */
>>> +    switch (cache) {
>>> +    case XE_CACHE_NONE:
>>> +        pte |= xelp_pte_encode_pat(XEHPC_PAT_CLOS0_UNCACHE);
>>> +        break;
>>> +    case XE_CACHE_WT:
>>> +        pte |= xelp_pte_encode_pat(XEHPC_PAT_CLOS0_WT_CACHE);
>>> +        break;
>>> +    case XE_CACHE_WB:
>>> +        pte |= xelp_pte_encode_pat(XEHPC_PAT_CLOS0_WB_CACHE);
>>> +        break;
>>> +    default:
>>> +        /* pte |= PPAT_CACHED; */
>>> +        break;
>>> +    }
>>> +
>>> +    return pte;
>>> +}
>>> +
>>> +static u64 __xelpg_pte_encode(u64 pte, enum xe_cache_level cache)
>>> +{
>>> +    pte &= ~XELP_PAT_MASK;
>>> +
>>> +    /* Initially assumed as Non cohorent mode, correct values
>>> +     * has to be set depending on requirement.
>>> +     */
>>> +    switch (cache) {
>>> +    case XE_CACHE_NONE:
>>> +        pte |= xelp_pte_encode_pat(XELPG_PAT_UNCACHE);
>>> +        break;
>>> +    case XE_CACHE_WT:
>>> +        pte |= xelp_pte_encode_pat(XELPG_PAT_WT_CACHE);
>>> +        break;
>>> +    case XE_CACHE_WB:
>>> +        pte |= xelp_pte_encode_pat(XELPG_PAT_WB_CACHE);
>>> +        break;
>>> +    default:
>>> +        /* pte |= PPAT_CACHED; */
>>> +        break;
>>> +    }
>>> +
>>> +    return pte;
>>> +}
>>> +
>>>  /**
>>>   * xe_pt_create() - Create a page-table.
>>>   * @vm: The vm to create for.
>>> @@ -216,6 +293,13 @@ struct xe_pt *xe_pt_create(struct xe_vm *vm, 
>>> struct xe_tile *tile,
>>>      if (!pt)
>>>          return ERR_PTR(-ENOMEM);
>>>
>>> +    if (GRAPHICS_VERx100(vm->xe) >= 1270)
>>> +        vm->pte_encode = __xelpg_pte_encode;
>>> +    else if (GRAPHICS_VERx100(vm->xe) >= 1260)
>>> +        vm->pte_encode = __xehpc_pte_encode;
>>> +    else
>>> +        vm->pte_encode = __xelp_pte_encode;
>>> +
>>>      bo = xe_bo_create_pin_map(vm->xe, tile, vm, SZ_4K,
>>>                    ttm_bo_type_kernel,
>>>                    XE_BO_CREATE_VRAM_IF_DGFX(tile) |
>>> diff --git a/drivers/gpu/drm/xe/xe_pte.h b/drivers/gpu/drm/xe/xe_pte.h
>>> new file mode 100644
>>> index 000000000000..8b3b5b471a99
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/xe/xe_pte.h
>>
>> s/xe_pte.h/xe_pte_pat.h
>>
>> Just my option prefer this.
>
> dunno, but since we have different pte formats for ggtt and ppgtt, IMO
> it would add to the confusion.
>
> Maybe this belongs in xe_pat.h since it's xe_pat.c that programs the
> tables giving the meaning spelled out in the macros here for each index.
> The rest of the code then need to set the bits in the PTE to reference
> those indexes, according to the PTE format.
>
>>
>>> @@ -0,0 +1,31 @@
>>> +/* SPDX-License-Identifier: MIT */
>>> +/*
>>> + * Copyright © 2021 Intel Corporation
>>> + */
>>> +
>>> +#ifndef _XE_PTE_H_
>>> +#define _XE_PTE_H_
>>> +
>>> +#define XELP_PAT_MASK                  BIT_ULL(7) | BIT_ULL(4) | 
>>> BIT_ULL(3)
>>> +#define XELP_PAT_WB_CACHE              0
>>> +#define XELP_PAT_WC_CACHE              1
>>> +#define XELP_PAT_WT_CACHE              2
>>> +#define XELP_PAT_UNCACHE               3
>
> example... this duplicates what we have in xe_pat.c (comment added here
> for clarity)
>
> static const u32 tgl_pat_table[] = {
>         [0] = TGL_PAT_WB,
>         [1] = TGL_PAT_WC,
>         [2] = TGL_PAT_WT,
>         [3] = TGL_PAT_UC,
>     // .... those are programmed, but not expected to be used
>         [4] = TGL_PAT_WB,
>         [5] = TGL_PAT_WB,
>         [6] = TGL_PAT_WB,
>         [7] = TGL_PAT_WB,
> };
>

TGL_PAT_WB maps to PAT table register bit mapping, we cannot directly 
use tgl_pat_table to get PAT index rather we
need to implement code to retrieve the index like below instead we can 
use macro directly.

xelp_pte_encode_pat(u8 cache_type) //example pass TGL_PAT_WB
{
     u8 index;
     for (i=0, i < 32, i++)
         if (tgl_pat_table[i] == cache_type)
             index = i;
}


>
> IMO the abstration could be something like
>
>     // this is valid for both ppgtt and ggtt
>     pat = xe_pat_get_index(xe, cache);
>
>     // this changes between ggtt / ppgtt
>     pte |= vm->pte_encode_pat(xe, pat);
>

I have one approach like below example where we can use same function 
for both ggtt and ppgtt

static u64 pte_encode_pat(enum gtt_type, u8 pat_index)
{
     u64 pte_pat = 0;

     if (gtt_type == PPGTT)
     {
         if (pat_index & BIT(0))
             pte_pat |= BIT(3);

         if (pat_index & BIT(1))
             pte_pat |= BIT(4);

         if (pat_index & BIT(2))
             pte_pat |= BIT(7);
      }
     else if(gtt_type = GGTT)
     {
         GGTT type PAT PTE encoding code here.
     }
         return pte_pat;
}


vm->pte_encode_pat(u64 pte, enum gtt_type, xe_cache_level cache)
{
     switch (cache) {
            case XE_CACHE_NONE:
             pte |= pte_encode_pat(gtt_type, XELP_PAT_UNCACHE);
             break;
}

what's your opinion.

Thanks,
Ravi Kumar V
>
> so the PAT indexes are handled by xe_pat.[ch]. The pte *encoding*
> is then handled differently by ggtt and ppgtt. Thoughts?
>
> Lucas De Marchi
>
>
>>> +
>>> +#define XEHPC_PAT_CLOS0_UNCACHE        0
>>> +#define XEHPC_PAT_CLOS0_WC_CACHE       1
>>> +#define XEHPC_PAT_CLOS0_WT_CACHE       2
>>> +#define XEHPC_PAT_CLOS0_WB_CACHE       3
>>> +#define XEHPC_PAT_CLOS1_WT_CACHE       4
>>> +#define XEHPC_PAT_CLOS1_WB_CACHE       5
>>> +#define XEHPC_PAT_CLOS2_WT_CACHE       6
>>> +#define XEHPC_PAT_CLOS2_WB_CACHE       7
>>> +
>>> +#define XELPG_PAT_WB_CACHE             0
>>> +#define XELPG_PAT_WT_CACHE             1
>>> +#define XELPG_PAT_UNCACHE              2
>>> +#define XELPG_PAT_1_WAY_WB_CACHE       3
>>> +#define XELPG_PAT_2_WAY_WB_CACHE       4
>>> +
>>> +#endif
>>> +
>>> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h 
>>> b/drivers/gpu/drm/xe/xe_vm_types.h
>>> index edb3c99a9c81..9e1b33c17d05 100644
>>> --- a/drivers/gpu/drm/xe/xe_vm_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
>>> @@ -312,6 +312,7 @@ struct xe_vm {
>>>
>>>      /** @batch_invalidate_tlb: Always invalidate TLB before batch 
>>> start */
>>>      bool batch_invalidate_tlb;
>>> +    u64 (*pte_encode)(u64 pte, enum xe_cache_level cache);
>>
>> Add kernel doc.
>>
>> s/pte_encode/pte_pat_encode
>>
>> Again just my opinion. Let see if anyone else has an opinion on the 
>> naming.
>>
>> Other than these NITs it LGTM. Didn't read to the bspec to check the
>> actually bit setting, but can do that ahead of the next rev. Speaking of
>> that, do you have a bspec link so I don't have to search through it?
>>
>> Matt
>>
>>>  };
>>>
>>>  /** struct xe_vma_op_map - VMA map operation */
>>> -- 
>>> 2.25.1
>>>

