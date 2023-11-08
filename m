Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 175DCC4332F
	for <intel-xe@archiver.kernel.org>; Wed,  8 Nov 2023 00:42:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B300610E10A;
	Wed,  8 Nov 2023 00:42:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA01D10E10A
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Nov 2023 00:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699404150; x=1730940150;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=n+kenIMADnQq16XNajdwztTXoO5bu9G4/j1v9pg6Re0=;
 b=MG1ZksH7R9i5pHsWHfq+726NK4EGpFWQEDmqsInMuYsqDGQ0iaqsU0KJ
 4Ctnixk4iPENwzZHX44nfdELjmPDIPhGWh7wUyuGyCPFeCVQUTdvf6swq
 5ofJ08QayEpDwSEOR/PfOEx7r2HxLpHOeAIlj7JG5qkV/m28YKuceis14
 ddqIdpfyhcD42/rtBfGy7CTtEtf3DAJi1F2hF4fKTPXeyDfBCdJvLeqak
 GiJNMxuoR/Qsl5cF/dH+/8HieiRvJikcKUqy5AbfHjKN04Tsx01EIiWyG
 qV08WUKWwiHVjBFl1wv8M0Ynj7XZqMJRdmCZ9AfBcyAUrj9BEPMN63xmF g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="456153956"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; d="scan'208";a="456153956"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2023 16:42:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="936336867"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; d="scan'208";a="936336867"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Nov 2023 16:42:30 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 7 Nov 2023 16:42:29 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 7 Nov 2023 16:42:29 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 7 Nov 2023 16:42:29 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 7 Nov 2023 16:42:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cK7MI/hGc4bp97C7DOxFnKchgQueDtLrT+mzDn/qc59H3gMVdIdtmNx3d9KBnhDE2m46EIjOWnpJssAzB0cW/r+U4PxGuoxLCCcU44I9mLobiuwLZwQXeB5r5L5Agc+9ojAtq6b+zoaD3fOeHQjRSxDvXykSEXUNvz17pMTMKfAULN7e5VZR6WXFmVsAmJN3QBB6oikuoyj7WBWmVxC/An5bZ2zEBdZSx/gOoiVQJzPpCcIiegd80eUq0xrohxdmeEHEhVY2wz7iHlBGZymhN2glrwS+Xw9zsl/at5dVkkSVMqhZA5jx49N+5ntPsUoi8726poXTe1SneNDl4eJtxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P0u2syN6E+1QkePSgcvRXHYC9Jd0lhSqvuz8hrsthWQ=;
 b=WPvW8J0BoXj0qecrd7gx8KaA56l1fxmGQwfmYlLS35W95Ahbl1SqzC5c0H1JhmWxs7gC4yF6MEdt4kCjjjvYTJ0m9+mO6hNhwivbCiIgDmGRnjdkPW5SqomuFtirg8eKB+DIOCUmXusc7kBrWBXfrT7PQw+OaLiXQXAOfLqjlJgbuc8ctTEbXpzMxEQmVQ2WP17YcxZHmAefUz9DuTOlhEHJumv6U60R8/R/B4322ZmkCcUb162tLujDzRgKScZ8RQGkP/iSfxwo5MsqbDqK0kHXt9PSjd7vB3pHN5tmn5cASyd+wKymErZIwCO+ePVOv8VUkIp8GX5uYs2dtLEKMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by CH0PR11MB5475.namprd11.prod.outlook.com (2603:10b6:610:d6::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Wed, 8 Nov
 2023 00:42:26 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::de08:93ac:5940:ec54]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::de08:93ac:5940:ec54%4]) with mapi id 15.20.6954.029; Wed, 8 Nov 2023
 00:42:26 +0000
Message-ID: <f57ff426-6f66-4c31-a368-44f4a955bdc7@intel.com>
Date: Tue, 7 Nov 2023 16:42:23 -0800
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20231027222928.1981633-1-daniele.ceraolospurio@intel.com>
 <20231027222928.1981633-6-daniele.ceraolospurio@intel.com>
 <9cc04ff6-d3ee-4ab1-bc1e-940813f35af0@intel.com>
 <e5ea0fe5-71e4-4375-853f-78d35728fc03@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <e5ea0fe5-71e4-4375-853f-78d35728fc03@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0323.namprd03.prod.outlook.com
 (2603:10b6:303:dd::28) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|CH0PR11MB5475:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ec93cd8-bb94-41d6-95b3-08dbdff39442
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LqKgGwZPjZHCZNaMZbAPIkpbNAnQaK0UuaZzDqCxv99LSc2l7i6QfhgivJHHc+eiQcpsX7gKE7wW9P8iMlVA7qRAzAQO7nbxoaO9BRXeGh6Nx4ccK5fdyzEhOVpGzYpPX8aXZ9lzoF8uGn66FyPgf15t10Eeot08qk9E2BrbnqRyQOs0klyudIohJyZvADNM+sYnGJ5fxESq9YEq2oHEwjFcBpwbAzD8QJ5nLhWl19xFz/iNBseiIz3TnuE3vB0xGcNYxoXSbvwmjAD7emf7vmju8Fdt6LRs2nIS//S7c/11HmNMcxy7pybkge2+O6K+aSbCELo9mj35e52/25xKrjsOdOc/O6tnaDFFWMlugdXrw1oQL7SbIQPefTWo3rcC19524nb4wMSN4HKrLL0BppQqBhWpN4UXOa8zbboMkq4K7mErkPsSFdGrJPn2ZlfovcUdDFkgHbd6th/2Gp0cVLp7QiJSSX4rsMY2hWJIjpus44LNbjiM1mV6BatBilwq0ewTm61yWPQAQj9saliCOI58IH3Nez83Jb5jr+NPUpfavJlno4kK4oh8WeV267MX6em36J5AJnHwdvGIeZK230XPaV7aplmmcnm0KIjvzbbBcywcxvbjfwCnqEzQPEY9XDn/hEqzUsQI+xAS8K7I3w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(396003)(376002)(366004)(136003)(230922051799003)(186009)(64100799003)(451199024)(1800799009)(30864003)(2906002)(41300700001)(316002)(66556008)(66476007)(478600001)(54906003)(66946007)(5660300002)(8936002)(38100700002)(8676002)(4326008)(36756003)(86362001)(31686004)(31696002)(6486002)(83380400001)(53546011)(82960400001)(2616005)(6666004)(6506007)(107886003)(26005)(6512007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YmpDOGhLc2swVEQrdUlqc3p4RU9KZFdZaFgwVTlERWNYOWIxZXliaTg3RjJS?=
 =?utf-8?B?OUFHMVNiVVJGK0k3LzYvUGtUcDlOaTBBRTJUaGhpTm1XSnV0eTA1QmVqemRu?=
 =?utf-8?B?TUxrb2N5RmFEazdmMnpuN0dGS3dJUDV1QVFZdjFUNmVLMHB6amwxZ1ZnYVlI?=
 =?utf-8?B?MnhLVGwyYTNsdDJIMnkyOXhMWmhtT1h0UUdnZzhEcnUrZkljZk83RE5VM2w3?=
 =?utf-8?B?aEpIZi9qYzhuWmZSbGJ6RkVXNUpyVlBxRWl3eTRWQTdwV04rRXdVM1lpWVNE?=
 =?utf-8?B?bzIvWk9rWnlsbU1EbzIrUWJobDhFbURidVFYNlRYUXJGTXl0VmkyKy90M0x5?=
 =?utf-8?B?VTFURGYvamxJSnlOOVEvaWtGWk42eFJNM2tDUmpKQU93VVh0SlFIUmlLTloy?=
 =?utf-8?B?T0o2YW9hcThtdkdZbi9DLy9iSE1GalgyWGFTSXFKeWRtbDUxUVR1TTN1emNE?=
 =?utf-8?B?UWZtL2FFVEdZOHRTV0Z4enFsZ1VYQlYzcUtsSGk4eStjRnFhaGNJeEt6SHlx?=
 =?utf-8?B?ZkFYQlFjbm1rZGtZcG54QktZVFZyR28xSWt1dXNCREVVenJacmZ4Y1FBaW5B?=
 =?utf-8?B?NEJJOFdQMHpqK1hHSUIzdlJ0ZDJ0RFZKbElCZ1V2K0ZWaTVnV0tXK2UvcENZ?=
 =?utf-8?B?UFZlbEV5MEFqNVY3ZzM4N1NqWXhjbm9aRXhCMkpKYzJqK2habXRBNkFzOW5W?=
 =?utf-8?B?b2NUTXJZV0ZISGdSSjA4UjVzdzJVa1RiRlhRVEJJUkt5VkpnTnJjQ0lRM2Q1?=
 =?utf-8?B?V2tXMC8wZ0FrdjJhcjBsSkpyNzJUcnhraElMVkZ3SjBROFlBQ0NqcHNHT0F3?=
 =?utf-8?B?dG9lVG5CRGo4eEVwaVI4OXFBQ3pTMUkzaFVWci8zRVFQVzBwdWZacE5jSnp6?=
 =?utf-8?B?REQwaG9OUnE3WEwreGowL1RnUnUxcWxqRGhMRi94ZDQxbXJUVDlOdG1ONlFS?=
 =?utf-8?B?U0RIMVNYVE9QdlF1M1lKUXVCMnhVSGJ6d1pOT09lOVBqWnduWFYwek1YYXJ3?=
 =?utf-8?B?NWFEZGhFUG1kNXBiZmhOMStueHl6R3k0SnVOYXpwa1YrQm84RVc3RGJQZHBp?=
 =?utf-8?B?c0Y5QTdRUFV1RWFIdVBEUjFaWXRzVUlpVFB5TjMyOWlLTGhGWVVXNVp2dWpi?=
 =?utf-8?B?WGhCN0lGNVBpeTFoUDdmZ0lFQWlpVFdkcFV6U090L0FJY2s2aFRQdnE0YWlS?=
 =?utf-8?B?eFJJaXVabDJEL0IrTnFGeCtQM2dHVnF2ejZpQ2JQTC9tTUFKellUQWUxc3V6?=
 =?utf-8?B?ZzZEc0E4NlFERUNZSkk2SHZtQVBvaGRjR2QzL3o4Vys3amtxSC9zdnRDYnBm?=
 =?utf-8?B?bGZuY05lYURITHUrNDA5NnhlakRtMEoxRStNcHhVaEdTK1hrNDl3eGRkeWFt?=
 =?utf-8?B?OW5UelZIdnhIR0ZaRjNsZ3NBbTgySkplYVZyZmdKcnhTWUxuQ3Z6eFVIRWNX?=
 =?utf-8?B?V0l5SDNQSUlyTEhnRWxZUTNBQ0dYMnVhLy9vRStBWWVYY1JvRmZPYk8yMHZ3?=
 =?utf-8?B?ZTIxSU81WGprem1Gb0xGVGswb1AxTFhyR3NaYWc5Z1BsQ3hIeFZiNDcwclo5?=
 =?utf-8?B?ODNTRTFJSFpVTnJaUng1LythQStOQUpKT3JoRXJZdFFXd3N4YlJwZ3RnM3pj?=
 =?utf-8?B?Y1hYMEZyeStxd2ZwaUxHMWxWQ08ybEc4Y1BlOHpWZFFMSjlONTZ5UlVzTzNm?=
 =?utf-8?B?aFgrU1lSbkp2RGVBWWwxc01weTZhWDkvZzM5WVV4MUJhNE5Vc09ueStqR3Vm?=
 =?utf-8?B?UUorelJwWmRqNGRqbnp6QXZ6ekRlcm1md3pYYjh1dUlieEVxaC9vZThVQmM0?=
 =?utf-8?B?R3JXUHRKT2ZWc21XaUQyNGdnY1VQNXpPUVpDWEpLVU1kaTc4Q2ZxVEJsTHpN?=
 =?utf-8?B?dmwxN2dUMU9VaUloaVdiQ21tYmM3SUVzVHFxNGwzNzN1ZjdYK1BJZ25FNGtS?=
 =?utf-8?B?L29PdHpKazVrQnozTURDNzVKVytzQmpMMk9peEsvUEEybUpUS1VKWXI2aDZ3?=
 =?utf-8?B?cDQyZHdCZU0vd1YzRlJkcFlUZGl1VlVWdDlST2RRWnROS2dKa24ydXhtNjhH?=
 =?utf-8?B?U211VGY4TFMvZ2JRZ1lYUE1pSnc2NXk2bUhMcHBkajBKMlNTKzJ0MWJ2MVJw?=
 =?utf-8?B?KzlOTFJXSXRKWlgxVDROeERESUdXSHVuYVpYVGw5Q244d1VlVzJaTExzWDJH?=
 =?utf-8?B?SUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ec93cd8-bb94-41d6-95b3-08dbdff39442
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2023 00:42:26.2185 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P1L31UoLYR1ShEBpopO3gthvOBxr/E9RNgJOivMeSl99T+Ul/SoLsSECrkDAwhXuSEOg4Zpb3VwgOtL+Ag40A8WBjawhYQboKphzmz6bgDQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5475
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 05/12] drm/xe/gsc: Parse GSC FW header
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On 11/7/2023 15:57, Daniele Ceraolo Spurio wrote:
> On 11/7/2023 3:45 PM, John Harrison wrote:
>> On 10/27/2023 15:29, Daniele Ceraolo Spurio wrote:
>>> The GSC blob starts with a layout header, from which we can move to the
>>> boot directory, which in turns allows us to find the CPD. The CPD uses
>>> the same format as the one in the HuC binary, so we can re-use the same
>>> parsing code to get to the manifest, which contains the release and
>>> security versions of the FW.
>>>
>>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
>>> Cc: John Harrison <John.C.Harrison@Intel.com>
>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_gsc_types.h |   3 +
>>>   drivers/gpu/drm/xe/xe_uc_fw.c     |  77 ++++++++++++++++++++
>>>   drivers/gpu/drm/xe/xe_uc_fw_abi.h | 113 
>>> ++++++++++++++++++++++++++++++
>>>   3 files changed, 193 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_gsc_types.h 
>>> b/drivers/gpu/drm/xe/xe_gsc_types.h
>>> index 135f156e3736..1bc50583fe58 100644
>>> --- a/drivers/gpu/drm/xe/xe_gsc_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_gsc_types.h
>>> @@ -14,6 +14,9 @@
>>>   struct xe_gsc {
>>>       /** @fw: Generic uC firmware management */
>>>       struct xe_uc_fw fw;
>>> +
>>> +    /** @security_version: SVN found in the fetched blob */
>>> +    u32 security_version;
>> There is no official structure to this version number?
>
> no, it's just a linearly increasing integer, there are no 
> minor/patch/build versions involved.
>
>>
>>>   };
>>>     #endif
>>> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c 
>>> b/drivers/gpu/drm/xe/xe_uc_fw.c
>>> index af3e5cba606f..bb38a76eb4a6 100644
>>> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
>>> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
>>> @@ -12,6 +12,7 @@
>>>   #include "xe_bo.h"
>>>   #include "xe_device_types.h"
>>>   #include "xe_force_wake.h"
>>> +#include "xe_gsc.h"
>>>   #include "xe_gt.h"
>>>   #include "xe_map.h"
>>>   #include "xe_mmio.h"
>>> @@ -488,6 +489,13 @@ static int parse_cpd_header(struct xe_uc_fw 
>>> *uc_fw, const void *data, size_t siz
>>>       release->minor = manifest->fw_version.minor;
>>>       release->patch = manifest->fw_version.hotfix;
>>>   +    if (uc_fw->type == XE_UC_FW_TYPE_GSC) {
>>> +        struct xe_gsc * gsc = container_of(uc_fw, struct xe_gsc, fw);
>>> +
>>> +        release->build = manifest->fw_version.build;
>>> +        gsc->security_version = manifest->security_version;
>>> +    }
>>> +
>>>       /* then optionally look for the css header */
>>>       if (css_entry) {
>>>           int ret;
>>> @@ -517,6 +525,73 @@ static int parse_cpd_header(struct xe_uc_fw 
>>> *uc_fw, const void *data, size_t siz
>>>       return 0;
>>>   }
>>>   +static int parse_gsc_layout(struct xe_uc_fw *uc_fw, const void 
>>> *data, size_t size)
>>> +{
>>> +    struct xe_gt *gt = uc_fw_to_gt(uc_fw);
>>> +    const struct gsc_layout_pointers *layout = data;
>>> +    const struct gsc_bpdt_header *bpdt_header = NULL;
>>> +    const struct gsc_bpdt_entry *bpdt_entry = NULL;
>>> +    size_t min_size = sizeof(*layout);
>>> +    int i;
>>> +
>>> +    if (size < min_size) {
>>> +        xe_gt_err(gt, "GSC FW too small! %zu < %zu\n", size, 
>>> min_size);
>>> +        return -ENODATA;
>>> +    }
>>> +
>>> +    min_size = layout->boot1.offset + layout->boot1.size;
>>> +    if (size < min_size) {
>>> +        xe_gt_err(gt, "GSC FW too small for boot section! %zu < 
>>> %zu\n",
>>> +              size, min_size);
>>> +        return -ENODATA;
>>> +    }
>>> +
>>> +    min_size = sizeof(*bpdt_header);
>>> +    if (layout->boot1.size < min_size) {
>>> +        xe_gt_err(gt, "GSC FW boot section too small for BPDT 
>>> header: %u < %zu\n",
>>> +              layout->boot1.size, min_size);
>>> +        return -ENODATA;
>>> +    }
>>> +
>>> +    bpdt_header = data + layout->boot1.offset;
>>> +    if (bpdt_header->signature != GSC_BPDT_HEADER_SIGNATURE) {
>>> +        xe_gt_err(gt, "invalid signature for BPDT header: 0x%08x!\n",
>>> +              bpdt_header->signature);
>>> +        return -EINVAL;
>>> +    }
>>> +
>>> +    min_size += sizeof(*bpdt_entry) * bpdt_header->descriptor_count;
>>> +    if (layout->boot1.size < min_size) {
>>> +        xe_gt_err(gt, "GSC FW boot section too small for BPDT 
>>> entries: %u < %zu\n",
>>> +              layout->boot1.size, min_size);
>>> +        return -ENODATA;
>>> +    }
>>> +
>>> +    bpdt_entry = (void *)bpdt_header + sizeof(*bpdt_header);
>>> +    for (i = 0; i < bpdt_header->descriptor_count; i++, 
>>> bpdt_entry++) {
>>> +        if ((bpdt_entry->type & GSC_BPDT_ENTRY_TYPE_MASK) !=
>>> +            GSC_BPDT_ENTRY_TYPE_GSC_RBE)
>>> +            continue;
>>> +
>>> +        min_size = bpdt_entry->sub_partition_offset;
>>> +
>>> +        /* the CPD header parser will check that the CPD header 
>>> fits */
>>> +        if (layout->boot1.size < min_size) {
>>> +            xe_gt_err(gt, "GSC FW boot section too small for CPD 
>>> offset: %u < %zu\n",
>>> +                  layout->boot1.size, min_size);
>>> +            return -ENODATA;
>>> +        }
>>> +
>>> +        return parse_cpd_header(uc_fw,
>>> +                    (void *)bpdt_header + min_size,
>>> +                    layout->boot1.size - min_size,
>> Could compare this calculation against bpdt_entry->sub_partition_size 
>> before bothering to try to decode a partial CPD?
>
> The CPD parser checks for the size. I could add an extra check here 
> and bail early, but why add extra case to optimize a scenario that 
> should never happen?
Fair enough.

>
>>
>>> +                    "RBEP.man", NULL);
>>> +    }
>>> +
>>> +    xe_gt_err(gt, "couldn't find CPD header in GSC binary!\n");
>>> +    return -ENODATA;
>>> +}
>>> +
>>>   static int parse_headers(struct xe_uc_fw *uc_fw, const struct 
>>> firmware *fw)
>>>   {
>>>       int ret;
>>> @@ -526,6 +601,8 @@ static int parse_headers(struct xe_uc_fw *uc_fw, 
>>> const struct firmware *fw)
>>>        * releases use GSC CPD headers.
>>>        */
>>>       switch (uc_fw->type) {
>>> +    case XE_UC_FW_TYPE_GSC:
>>> +        return parse_gsc_layout(uc_fw, fw->data, fw->size);
>>>       case XE_UC_FW_TYPE_HUC:
>>>           ret = parse_cpd_header(uc_fw, fw->data, fw->size, 
>>> "HUCP.man", "huc_fw");
>>>           if (!ret || ret != -ENOENT)
>>> diff --git a/drivers/gpu/drm/xe/xe_uc_fw_abi.h 
>>> b/drivers/gpu/drm/xe/xe_uc_fw_abi.h
>>> index d6725c963251..edf2a448f4bb 100644
>>> --- a/drivers/gpu/drm/xe/xe_uc_fw_abi.h
>>> +++ b/drivers/gpu/drm/xe/xe_uc_fw_abi.h
>>> @@ -140,6 +140,58 @@ static_assert(sizeof(struct uc_css_header) == 
>>> 128);
>>>    *    |      RSA Key (MTL+ only)                       |
>>>    *    |      ...                                       |
>>>    *    +================================================+
>>> + *
>>> + * The GSC binary starts instead with a layout header, which 
>>> contains the
>>> + * locations of the various partitions of the binary. The one we're 
>>> interested
>>> + * in is the boot1 partition, where we can find a BPDT header 
>>> followed by
>>> + * entries, one of which points to the RBE sub-section of the 
>>> partition, which
>>> + * contains the CPD. The GSC blob does not contain a CSS-based 
>>> binary, so we
>>> + * only need to look for the manifest, which is under the 
>>> "RBEP.man" CPD entry.
>>> + * Note that we have no need to find where the actual FW code is 
>>> inside the
>>> + * image because the GSC ROM will itself parse the headers to find 
>>> it and load
>>> + * it.
>>> + * The GSC firmware header layout looks like this::
>>> + *
>>> + *    +================================================+
>>> + *    |  Layout Pointers                               |
>>> + *    |      ...                                       |
>>> + *    |      Boot1 offset >---------------------------|------o
>>> + *    |      ...                                       | |
>>> + *    +================================================+ |
>>> + * |
>>> + *    +================================================+ |
>>> + *    |  BPDT header |<-----o
>>> + *    +================================================+
>>> + *    |  BPDT entries[]                                |
>>> + *    |      entry1                                    |
>>> + *    |      ...                                       |
>>> + *    |      entryX                                    |
>>> + *    |          type == GSC_RBE                       |
>>> + *    |          offset >-----------------------------|------o
>>> + *    |      ...                                       | |
>>> + *    +================================================+ |
>>> + * |
>>> + *    +================================================+ |
>>> + *    |  CPD Header |<-----o
>>> + *    +================================================+
>>> + *    |  CPD entries[]                                 |
>>> + *    |      entry1                                    |
>>> + *    |      ...                                       |
>>> + *    |      entryX                                    |
>>> + *    |          "RBEP.man"                            |
>>> + *    |           ...                                  |
>>> + *    |           offset >----------------------------|------o
>>> + *    |      ...                                       | |
>>> + *    +================================================+ |
>>> + * |
>>> + *    +================================================+ |
>>> + *    | Manifest Header |<-----o
>>> + *    |  ...                                           |
>>> + *    |  FW version                                    |
>>> + *    |  ...                                           |
>>> + *    |  Security version                              |
>>> + *    |  ...                                           |
>>> + *    +================================================+
>>>    */
>>>     struct gsc_version {
>>> @@ -149,6 +201,67 @@ struct gsc_version {
>>>       u16 build;
>>>   } __packed;
>>>   +struct gsc_partition {
>>> +    u32 offset;
>>> +    u32 size;
>>> +} __packed;
>>> +
>>> +struct gsc_layout_pointers {
>>> +    u8 rom_bypass_vector[16];
>>> +
>>> +    /* size of pointers layout not including ROM bypass vector */
>> pointers layout -> layout pointers?
>
> I'll just simplify it to "size of this header section"
>
>>
>>> +    u16 size;
>>> +
>>> +    /*
>>> +     * bit0: Backup copy of layout pointers exist
>> exist -> exists
>
> ack
>
>>
>>> +     * bits1-15: reserved
>>> +     */
>>> +    u8 flags;
>>> +
>>> +    u8 reserved;
>>> +
>>> +    u32 crc32;
>> Should we be doing anything to test against this crc or the one in 
>> the bpdt_header below?
>
> No, the GSC ROM checks those at load time.
Okay.

John.

>
> Daniele
>
>>
>> John.
>>
>>> +
>>> +    struct gsc_partition datap;
>>> +    struct gsc_partition boot1;
>>> +    struct gsc_partition boot2;
>>> +    struct gsc_partition boot3;
>>> +    struct gsc_partition boot4;
>>> +    struct gsc_partition boot5;
>>> +    struct gsc_partition temp_pages;
>>> +} __packed;
>>> +
>>> +/* Boot partition structures */
>>> +struct gsc_bpdt_header {
>>> +    u32 signature;
>>> +#define GSC_BPDT_HEADER_SIGNATURE 0x000055AA
>>> +
>>> +    u16 descriptor_count; /* num of entries after the header */
>>> +
>>> +    u8 version;
>>> +    u8 configuration;
>>> +
>>> +    u32 crc32;
>>> +
>>> +    u32 build_version;
>>> +    struct gsc_version tool_version;
>>> +} __packed;
>>> +
>>> +struct gsc_bpdt_entry {
>>> +    /*
>>> +     * Bits 0-15: BPDT entry type
>>> +     * Bits 16-17: reserved
>>> +     * Bit 18: code sub-partition
>>> +     * Bits 19-31: reserved
>>> +     */
>>> +    u32 type;
>>> +#define GSC_BPDT_ENTRY_TYPE_MASK GENMASK(15, 0)
>>> +#define GSC_BPDT_ENTRY_TYPE_GSC_RBE 0x1
>>> +
>>> +    u32 sub_partition_offset; /* from the base of the BPDT header */
>>> +    u32 sub_partition_size;
>>> +} __packed;
>>> +
>>>   /* Code partition directory (CPD) structures */
>>>   struct gsc_cpd_header_v2 {
>>>       u32 header_marker;
>>
>

