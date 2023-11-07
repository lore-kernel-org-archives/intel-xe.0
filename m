Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8007CC4332F
	for <intel-xe@archiver.kernel.org>; Tue,  7 Nov 2023 23:58:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E49D10E6C2;
	Tue,  7 Nov 2023 23:58:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79BBE10E6C2
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Nov 2023 23:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699401478; x=1730937478;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+bYh8+BLjh9YEX+6hezEACWIDB0hYB0CbEIeN/I0eNk=;
 b=NUhr8A5h9t+A8RnDOG4YKR9BFc+VtsQE4jZeCkdvV8ytvOBgwyfcM3dP
 FkBtaqij7dNUPiU/JU1PcGv5qVLquYE9gSVmZUr3p3HO69yK6d8ecErBg
 9uRJ94AmfRLkbCWLFMSyGqNke6P/Ka4G994eypfpxHmbfrnXQYFoOPIFT
 3F+DU78rliGiuw3W58EyumosTfpU8HmR1sQh9suHF+1SKft0nPrj6HwcG
 Ll4vt0a4eosqHipE1oIsabbR0xYDXM5jdOmF9nCrke5G6Q2RGieKUyoA8
 knFJ0rTTFMwHV8Nov+KBnPm1AjflenUKhkYxE8m4TfgaIqrUQfCUzgTPW A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="388511249"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; d="scan'208";a="388511249"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2023 15:57:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="1010088502"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; d="scan'208";a="1010088502"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Nov 2023 15:57:57 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 7 Nov 2023 15:57:56 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 7 Nov 2023 15:57:56 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 7 Nov 2023 15:57:56 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 7 Nov 2023 15:57:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fVppm9he2iM/21Oh/hRfeBvsolw6EeO8HLhvzjkC+l7uRlMFcPXlTuHg0Jy9AcZDJtx/NNnVSQuAEa268TQz3HBUiReT4tRvF6Utknd8ZBPdbi0KLMUoNoLPvdYOhd11IfNQiP97e4BEwR0rUdyzNltbE+i2HoZMaoTlyeR49S8hH0Yco++BQLkLXuEOb1ysU+S4ZKkiRqRC87XWh6FXmoX8N/dCjtuIXeioRV1JYoL+pLZ4A+lhcmBEhfuqgfrvyqs2JGC7y5lDLZffu25HJtfavBuyDkP1ah0lV2QYaip8ItwDa3SwkOARzMWaHeq3GU4zzoNsj9D9cBkIFG23qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AKcbB13XDKz9G8DmJuEMoDb5YjoliutDK4JjWNNkoxI=;
 b=TApvVUDryK87EJAWbMl74xzZdbz0tSVkdI8+7+1obn0D44PiZoHUpzgeXOQMSmxAdWnsqx6P9/UWraY9Tw224PD/b9fEY5iQEgcb39e70JOMCp17rurNQnnOCqArHQphJl0hz+AOC0DNBGKE9QCj/gWc9nUiCh1mFV/o+ud3v+uPPxC/3Z7dnI3uIxUUqfkWUL2wqFr3uH3RrR2vOhiGhqsYrglN91BffhEZy9ID4fyyPaIj2j1iO9SXhWu5og61pfpBEsMqwKPiJbzbtD9P1OmTu12l7RCGvvb9HUNouFqf6S2LQOPYueZIzCm6jgBHvG+Zea+lijwOciNS4IQwiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by SA0PR11MB4527.namprd11.prod.outlook.com (2603:10b6:806:72::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Tue, 7 Nov
 2023 23:57:48 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::588d:b37f:130c:9e86]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::588d:b37f:130c:9e86%6]) with mapi id 15.20.6954.028; Tue, 7 Nov 2023
 23:57:48 +0000
Message-ID: <e5ea0fe5-71e4-4375-853f-78d35728fc03@intel.com>
Date: Tue, 7 Nov 2023 15:57:46 -0800
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: John Harrison <john.c.harrison@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20231027222928.1981633-1-daniele.ceraolospurio@intel.com>
 <20231027222928.1981633-6-daniele.ceraolospurio@intel.com>
 <9cc04ff6-d3ee-4ab1-bc1e-940813f35af0@intel.com>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <9cc04ff6-d3ee-4ab1-bc1e-940813f35af0@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0123.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::8) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|SA0PR11MB4527:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a36b834-761c-4a2b-ef0b-08dbdfed57fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Zoh9YYPUuBxqIj6jV6ONAy5EOcEM/LlrxSO4GcWIHuCPXtHznNj0qENxP+Ga6jBIzIMcgG1Me66V/YvTYvchPJjnbNVKxF14iM4GPRHJvUE9o0rVnOBxl0PFndKmFAubHMbC9nbjluuCrlJgve8BIbVB4UX3pHj2CnoSzYEb2FmHszMWG01gvkWEIaWZzQELKTjcq210jxNkFDanK9DN+dE4ISTvMAbwzPFXtb46Eg3sJcsVrkZQY6X5LLDEO97drZZfs7TPwUmPBEhZ5FPzA++Ec6zR/SH6/UQMR/ZN9g9HaQFgUIFUFLqqJKOAd1tIPIwoHUu7/y3bUNi7RRpSrXZHgxlB/iQbrlSzzzu6EYznM7wucDv3yKFGUSdGqJlNrfBtxGTcFBuje3kBh6hM7/7I5Ktn5xu136cX/XxIRrXTF1HVkjTh2mcTD+9Ije752uIsJBhn6LbrvV3bkwLj2FB0thge/K9QxHfez3X38pp1GjSn47xtyBHgfyWwOygBa4Kq/5gU6AFP+9a24pmG8aAtq+CPOzYeSohIh2blKhjBIBn3VJi3/Pl+yfW/IjngoJ5uI+nU22n2lb9R+uKjzOnilmvz1+2QXmIwjImnM9P/TcZAGoqdbE+hTFaGpOaZX+AXGoiIUHuYDAFU1Khnmw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(39860400002)(396003)(346002)(376002)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(38100700002)(6506007)(53546011)(83380400001)(31686004)(6512007)(82960400001)(8676002)(107886003)(2616005)(41300700001)(316002)(86362001)(2906002)(31696002)(5660300002)(4326008)(36756003)(8936002)(66946007)(54906003)(66556008)(26005)(66476007)(478600001)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N0xSMVNLR1NLWDhZanp2b2IyMWdraE1Cb1ZJUHJTVzBOUDA1VTZreDZlcU95?=
 =?utf-8?B?N2xnVWRacEdKSjUvWlN2NjZhQWhzdlVzNHJJRUprcDN4Yk16NmxqMDJaU2lj?=
 =?utf-8?B?d2FHdVEzdHZpcFN1ZnN5Nm5BNmo0Y09EeklQb25DcXpqZnF1ZnkzbmJxY2Fv?=
 =?utf-8?B?NERyRVRxUUwrY2FiY2JQRUJZR0NFMitHL1lTanc5czZqMmsxb1NiVnhjSlJo?=
 =?utf-8?B?SnNwZEp6eHVrazRnWk84dFN4UGFlRnRJSGNTOWtmelpBVEFmWndnUm9vcEpv?=
 =?utf-8?B?ZGt5bElzL1JLWStIalZPbzdPTjlzV3NJNTM3bUEvc1NudU1tcmNwUGZqM0dU?=
 =?utf-8?B?VGFNYTFFVkZVR2Z5M2xoKzVXSUJlVTdKZnkvTlpiRmlvNDZ6Uko3TnAzazFY?=
 =?utf-8?B?aDI1NzFpZ3JhYUdqbmtabWpTdlRHWDRHQjVlaGd2OWNxdUhvMG9NWU5vK3c4?=
 =?utf-8?B?NWYzeXVqRDE2eVZIUU9ROStnc2EyU3NHelZxVGRVV3BRcUNTT2cyVWNPd0tK?=
 =?utf-8?B?bVdUd244K0ltdkVhb2QxUTZUUm50QjRTTnVUTFVSa3plcGxFT2ttOGhiazdT?=
 =?utf-8?B?YU9WL2hWRkZTSjYrcmF1VlI5c2ZnSVR0YVIzd3dkdUtHdGpKWFNxSTRCRkh0?=
 =?utf-8?B?N2kwNlU2ZGEzNW1CWURON2QvQ0luUFNSdEFVSGNOK0RlWTR3b1pJcTM0SVFP?=
 =?utf-8?B?aTlEeWtIcDRqZ2FmOFJUMXg3WDFmek5iOTJncEZyWi9EWXZDK1BRUSs4bzlN?=
 =?utf-8?B?cUErTVowM21XUkh0QmpLL29IVVZYc3lZU2dyTExRRHBRanBlMGJ3dHBkWEtY?=
 =?utf-8?B?bktoeVN3ZTlHZ2lSaDN5Wk1xSW9WWVppeEtJeHAxQmhRM3RETTV5Q2VmRXlX?=
 =?utf-8?B?MkhOdU9uUkNqRU1KTCtMVjd2enNhS2daMCtINHNTTFRyR0l6TStkRFZBMDdF?=
 =?utf-8?B?Z3kzUnJtVjJKcTd0V2JrK1F1TlBxMSs1Zzk3Q0RCTWZJTWNRVituZU9ucGpB?=
 =?utf-8?B?eHYzSWNwc2dpNTRoMzNJbWhRMWVWcUI2OEl2UTREeTNweGJkN0l6TWkxbWs0?=
 =?utf-8?B?b3RrNnZUNU9kZlhIYm9XUW9UOUU2OGx3U1BZWXEwbE1YcWhIY1FXY1B4emd2?=
 =?utf-8?B?dE1icUFhRmgzTGlOMnpzM2YwYlFRMm9peUhTKzViR01NQnF3U3FGdFljcTFw?=
 =?utf-8?B?QmdWdjY2N0VaYURiMW5XK25zcUx6NDFJYlZvZGw0d2RtRWJGRC9EQVFpNmds?=
 =?utf-8?B?V1ZSNjMvNmRibml6aWNUQTByTklPWXB1VG9lQ2VTTFBXN1oyVHBobWw1Wjho?=
 =?utf-8?B?K2lmTDhOcnhsQ1Q5VDhIS25URVhReHFwTTcxZG45SHJxQTVWTG5VRVU2OGha?=
 =?utf-8?B?NWRyNlNDLzN0SFBhQlJhNGlleFpsVmtWNG94Y2lxdGxWcmpvN3Qra1Q0ZDMy?=
 =?utf-8?B?TkhzbXgrL1U0TWN3cnkvUlQzMFlLc3B1ZjRUMVZGV3kzbVlFM0UybWsvOEpz?=
 =?utf-8?B?VVdObzR0U1MyUzhvSXFaK3VEdDIza1E2QVhwalpKODFDK0JRamZjb3FPYm1P?=
 =?utf-8?B?THp6cUk2S3JlMkhHZjFTa0NZZ0NFd0pNVE5XcE9UQ01welJ4bng0clBCOHdJ?=
 =?utf-8?B?dkNDUVJTYnl0NWRGa2tVRG5UdWdzY3RVVE5HVFBYUkNFYjBJenY2Tm9rbDZY?=
 =?utf-8?B?b29FQWh1MDJMU1ZyZGNvYUkzbEFTdVN3U2ovV1dBOUV5ZHBkVDFWbEgyNUhU?=
 =?utf-8?B?SVo4VTltbVlLTzhGSGNXK3p4Y3Rsc2xEWnFYaXE1VkFLUElKa0x5YWUrVkEw?=
 =?utf-8?B?UU5MeWppQVFqc011SHFZMnZsK3hIbVQveDhJL2RvcDhmVkwwTDJzY1lSOWdS?=
 =?utf-8?B?ekZhZlVGN3ZPMjNYUXlFWm5TdHBDUVFUOExiTmE3bzh5NFlkc3NYbkVaWHBE?=
 =?utf-8?B?NTV2UEVqY1NDcjZndThkdmlEeGRCWnJRUEMxaDBveHExQ3N5ZVN4RGFia3ow?=
 =?utf-8?B?YXQwbGhQbW14TFNYQjdMdUJGQ1Y2cWxmLys5UWpNdituOHFNdVBpNXJOVG4w?=
 =?utf-8?B?NElMeUN1a2FWZ05iZEhOYlJNcFo5MlpjTU1IUnlQNGhYRXRMTUZid1BxNGFa?=
 =?utf-8?B?MUVhVThCNlFHVG9JUlZ5aUsrWHU3TFBZd3UvMFIzUGdBNGxRK2ZxcUFOaU5u?=
 =?utf-8?Q?OnCpPmkRE3dMoPV70oYRzvY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a36b834-761c-4a2b-ef0b-08dbdfed57fb
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2023 23:57:48.0898 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SzgV0BA1PuLS6a7g87FjmH9oUnMVw/3RADvwbyTyoA7xxJENk7JtWzhnqr3sU7kRazVMXQkt5qXgHij8cqlfn6jUOIL3roC+DrdnfbqgYSQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4527
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



On 11/7/2023 3:45 PM, John Harrison wrote:
> On 10/27/2023 15:29, Daniele Ceraolo Spurio wrote:
>> The GSC blob starts with a layout header, from which we can move to the
>> boot directory, which in turns allows us to find the CPD. The CPD uses
>> the same format as the one in the HuC binary, so we can re-use the same
>> parsing code to get to the manifest, which contains the release and
>> security versions of the FW.
>>
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
>> Cc: John Harrison <John.C.Harrison@Intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_gsc_types.h |   3 +
>>   drivers/gpu/drm/xe/xe_uc_fw.c     |  77 ++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_uc_fw_abi.h | 113 ++++++++++++++++++++++++++++++
>>   3 files changed, 193 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gsc_types.h 
>> b/drivers/gpu/drm/xe/xe_gsc_types.h
>> index 135f156e3736..1bc50583fe58 100644
>> --- a/drivers/gpu/drm/xe/xe_gsc_types.h
>> +++ b/drivers/gpu/drm/xe/xe_gsc_types.h
>> @@ -14,6 +14,9 @@
>>   struct xe_gsc {
>>       /** @fw: Generic uC firmware management */
>>       struct xe_uc_fw fw;
>> +
>> +    /** @security_version: SVN found in the fetched blob */
>> +    u32 security_version;
> There is no official structure to this version number?

no, it's just a linearly increasing integer, there are no 
minor/patch/build versions involved.

>
>>   };
>>     #endif
>> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c 
>> b/drivers/gpu/drm/xe/xe_uc_fw.c
>> index af3e5cba606f..bb38a76eb4a6 100644
>> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
>> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
>> @@ -12,6 +12,7 @@
>>   #include "xe_bo.h"
>>   #include "xe_device_types.h"
>>   #include "xe_force_wake.h"
>> +#include "xe_gsc.h"
>>   #include "xe_gt.h"
>>   #include "xe_map.h"
>>   #include "xe_mmio.h"
>> @@ -488,6 +489,13 @@ static int parse_cpd_header(struct xe_uc_fw 
>> *uc_fw, const void *data, size_t siz
>>       release->minor = manifest->fw_version.minor;
>>       release->patch = manifest->fw_version.hotfix;
>>   +    if (uc_fw->type == XE_UC_FW_TYPE_GSC) {
>> +        struct xe_gsc * gsc = container_of(uc_fw, struct xe_gsc, fw);
>> +
>> +        release->build = manifest->fw_version.build;
>> +        gsc->security_version = manifest->security_version;
>> +    }
>> +
>>       /* then optionally look for the css header */
>>       if (css_entry) {
>>           int ret;
>> @@ -517,6 +525,73 @@ static int parse_cpd_header(struct xe_uc_fw 
>> *uc_fw, const void *data, size_t siz
>>       return 0;
>>   }
>>   +static int parse_gsc_layout(struct xe_uc_fw *uc_fw, const void 
>> *data, size_t size)
>> +{
>> +    struct xe_gt *gt = uc_fw_to_gt(uc_fw);
>> +    const struct gsc_layout_pointers *layout = data;
>> +    const struct gsc_bpdt_header *bpdt_header = NULL;
>> +    const struct gsc_bpdt_entry *bpdt_entry = NULL;
>> +    size_t min_size = sizeof(*layout);
>> +    int i;
>> +
>> +    if (size < min_size) {
>> +        xe_gt_err(gt, "GSC FW too small! %zu < %zu\n", size, min_size);
>> +        return -ENODATA;
>> +    }
>> +
>> +    min_size = layout->boot1.offset + layout->boot1.size;
>> +    if (size < min_size) {
>> +        xe_gt_err(gt, "GSC FW too small for boot section! %zu < %zu\n",
>> +              size, min_size);
>> +        return -ENODATA;
>> +    }
>> +
>> +    min_size = sizeof(*bpdt_header);
>> +    if (layout->boot1.size < min_size) {
>> +        xe_gt_err(gt, "GSC FW boot section too small for BPDT 
>> header: %u < %zu\n",
>> +              layout->boot1.size, min_size);
>> +        return -ENODATA;
>> +    }
>> +
>> +    bpdt_header = data + layout->boot1.offset;
>> +    if (bpdt_header->signature != GSC_BPDT_HEADER_SIGNATURE) {
>> +        xe_gt_err(gt, "invalid signature for BPDT header: 0x%08x!\n",
>> +              bpdt_header->signature);
>> +        return -EINVAL;
>> +    }
>> +
>> +    min_size += sizeof(*bpdt_entry) * bpdt_header->descriptor_count;
>> +    if (layout->boot1.size < min_size) {
>> +        xe_gt_err(gt, "GSC FW boot section too small for BPDT 
>> entries: %u < %zu\n",
>> +              layout->boot1.size, min_size);
>> +        return -ENODATA;
>> +    }
>> +
>> +    bpdt_entry = (void *)bpdt_header + sizeof(*bpdt_header);
>> +    for (i = 0; i < bpdt_header->descriptor_count; i++, bpdt_entry++) {
>> +        if ((bpdt_entry->type & GSC_BPDT_ENTRY_TYPE_MASK) !=
>> +            GSC_BPDT_ENTRY_TYPE_GSC_RBE)
>> +            continue;
>> +
>> +        min_size = bpdt_entry->sub_partition_offset;
>> +
>> +        /* the CPD header parser will check that the CPD header fits */
>> +        if (layout->boot1.size < min_size) {
>> +            xe_gt_err(gt, "GSC FW boot section too small for CPD 
>> offset: %u < %zu\n",
>> +                  layout->boot1.size, min_size);
>> +            return -ENODATA;
>> +        }
>> +
>> +        return parse_cpd_header(uc_fw,
>> +                    (void *)bpdt_header + min_size,
>> +                    layout->boot1.size - min_size,
> Could compare this calculation against bpdt_entry->sub_partition_size 
> before bothering to try to decode a partial CPD?

The CPD parser checks for the size. I could add an extra check here and 
bail early, but why add extra case to optimize a scenario that should 
never happen?

>
>> +                    "RBEP.man", NULL);
>> +    }
>> +
>> +    xe_gt_err(gt, "couldn't find CPD header in GSC binary!\n");
>> +    return -ENODATA;
>> +}
>> +
>>   static int parse_headers(struct xe_uc_fw *uc_fw, const struct 
>> firmware *fw)
>>   {
>>       int ret;
>> @@ -526,6 +601,8 @@ static int parse_headers(struct xe_uc_fw *uc_fw, 
>> const struct firmware *fw)
>>        * releases use GSC CPD headers.
>>        */
>>       switch (uc_fw->type) {
>> +    case XE_UC_FW_TYPE_GSC:
>> +        return parse_gsc_layout(uc_fw, fw->data, fw->size);
>>       case XE_UC_FW_TYPE_HUC:
>>           ret = parse_cpd_header(uc_fw, fw->data, fw->size, 
>> "HUCP.man", "huc_fw");
>>           if (!ret || ret != -ENOENT)
>> diff --git a/drivers/gpu/drm/xe/xe_uc_fw_abi.h 
>> b/drivers/gpu/drm/xe/xe_uc_fw_abi.h
>> index d6725c963251..edf2a448f4bb 100644
>> --- a/drivers/gpu/drm/xe/xe_uc_fw_abi.h
>> +++ b/drivers/gpu/drm/xe/xe_uc_fw_abi.h
>> @@ -140,6 +140,58 @@ static_assert(sizeof(struct uc_css_header) == 128);
>>    *    |      RSA Key (MTL+ only)                       |
>>    *    |      ...                                       |
>>    *    +================================================+
>> + *
>> + * The GSC binary starts instead with a layout header, which 
>> contains the
>> + * locations of the various partitions of the binary. The one we're 
>> interested
>> + * in is the boot1 partition, where we can find a BPDT header 
>> followed by
>> + * entries, one of which points to the RBE sub-section of the 
>> partition, which
>> + * contains the CPD. The GSC blob does not contain a CSS-based 
>> binary, so we
>> + * only need to look for the manifest, which is under the "RBEP.man" 
>> CPD entry.
>> + * Note that we have no need to find where the actual FW code is 
>> inside the
>> + * image because the GSC ROM will itself parse the headers to find 
>> it and load
>> + * it.
>> + * The GSC firmware header layout looks like this::
>> + *
>> + *    +================================================+
>> + *    |  Layout Pointers                               |
>> + *    |      ...                                       |
>> + *    |      Boot1 offset >---------------------------|------o
>> + *    |      ...                                       |      |
>> + *    +================================================+      |
>> + *                                                            |
>> + *    +================================================+      |
>> + *    |  BPDT header |<-----o
>> + *    +================================================+
>> + *    |  BPDT entries[]                                |
>> + *    |      entry1                                    |
>> + *    |      ...                                       |
>> + *    |      entryX                                    |
>> + *    |          type == GSC_RBE                       |
>> + *    |          offset >-----------------------------|------o
>> + *    |      ...                                       |      |
>> + *    +================================================+      |
>> + *                                                            |
>> + *    +================================================+      |
>> + *    |  CPD Header |<-----o
>> + *    +================================================+
>> + *    |  CPD entries[]                                 |
>> + *    |      entry1                                    |
>> + *    |      ...                                       |
>> + *    |      entryX                                    |
>> + *    |          "RBEP.man"                            |
>> + *    |           ...                                  |
>> + *    |           offset >----------------------------|------o
>> + *    |      ...                                       |      |
>> + *    +================================================+      |
>> + *                                                            |
>> + *    +================================================+      |
>> + *    | Manifest Header |<-----o
>> + *    |  ...                                           |
>> + *    |  FW version                                    |
>> + *    |  ...                                           |
>> + *    |  Security version                              |
>> + *    |  ...                                           |
>> + *    +================================================+
>>    */
>>     struct gsc_version {
>> @@ -149,6 +201,67 @@ struct gsc_version {
>>       u16 build;
>>   } __packed;
>>   +struct gsc_partition {
>> +    u32 offset;
>> +    u32 size;
>> +} __packed;
>> +
>> +struct gsc_layout_pointers {
>> +    u8 rom_bypass_vector[16];
>> +
>> +    /* size of pointers layout not including ROM bypass vector */
> pointers layout -> layout pointers?

I'll just simplify it to "size of this header section"

>
>> +    u16 size;
>> +
>> +    /*
>> +     * bit0: Backup copy of layout pointers exist
> exist -> exists

ack

>
>> +     * bits1-15: reserved
>> +     */
>> +    u8 flags;
>> +
>> +    u8 reserved;
>> +
>> +    u32 crc32;
> Should we be doing anything to test against this crc or the one in the 
> bpdt_header below?

No, the GSC ROM checks those at load time.

Daniele

>
> John.
>
>> +
>> +    struct gsc_partition datap;
>> +    struct gsc_partition boot1;
>> +    struct gsc_partition boot2;
>> +    struct gsc_partition boot3;
>> +    struct gsc_partition boot4;
>> +    struct gsc_partition boot5;
>> +    struct gsc_partition temp_pages;
>> +} __packed;
>> +
>> +/* Boot partition structures */
>> +struct gsc_bpdt_header {
>> +    u32 signature;
>> +#define GSC_BPDT_HEADER_SIGNATURE 0x000055AA
>> +
>> +    u16 descriptor_count; /* num of entries after the header */
>> +
>> +    u8 version;
>> +    u8 configuration;
>> +
>> +    u32 crc32;
>> +
>> +    u32 build_version;
>> +    struct gsc_version tool_version;
>> +} __packed;
>> +
>> +struct gsc_bpdt_entry {
>> +    /*
>> +     * Bits 0-15: BPDT entry type
>> +     * Bits 16-17: reserved
>> +     * Bit 18: code sub-partition
>> +     * Bits 19-31: reserved
>> +     */
>> +    u32 type;
>> +#define GSC_BPDT_ENTRY_TYPE_MASK GENMASK(15, 0)
>> +#define GSC_BPDT_ENTRY_TYPE_GSC_RBE 0x1
>> +
>> +    u32 sub_partition_offset; /* from the base of the BPDT header */
>> +    u32 sub_partition_size;
>> +} __packed;
>> +
>>   /* Code partition directory (CPD) structures */
>>   struct gsc_cpd_header_v2 {
>>       u32 header_marker;
>

