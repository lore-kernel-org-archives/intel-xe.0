Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7CC2C4167B
	for <intel-xe@archiver.kernel.org>; Fri,  1 Dec 2023 00:29:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C82E10E787;
	Fri,  1 Dec 2023 00:29:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBC1A10E787
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Dec 2023 00:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701390542; x=1732926542;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=DBT7YkHc3lhKvodciPYEFszRhUB16JQ6IGGKCFZ05YY=;
 b=UksFttZLvuokcW/4+JlO+zr6/XljJybvruQHLb1wOdKqCAQb+MQ/EIvu
 8FUoSGw0MoBUSwAeo9Vyrao00LFFIZ8AasevQ+RSv/QuwVR3vMSbkeanY
 /yVpgGt868CiIekUGbpQQPgXp4cXN3sZ+Lhh44QPWXRHHP5Ku7lMQBH34
 EdjvB83xW2P2u35llHqqws4QqKgL53WG1vB9e5/RH6KkShILiIobhjstT
 9I+ShEC4nMbCY4HE1icOVlzgKSdmfdCIXGC0IFA/zwAMC+ZClPYnSUfrY
 QwNEXSotSrxr0yz0LIxaoi6IuSHbUypleVNUMa4gfsacZO+/1UF87Dp5V A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="310896"
X-IronPort-AV: E=Sophos;i="6.04,240,1695711600"; 
   d="scan'208";a="310896"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2023 16:29:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="773243152"
X-IronPort-AV: E=Sophos;i="6.04,240,1695711600"; d="scan'208";a="773243152"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Nov 2023 16:29:01 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 30 Nov 2023 16:29:00 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 30 Nov 2023 16:29:00 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 30 Nov 2023 16:29:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IdPCrcmbc2PCoB4+GPU7kgKX1S1qISLevcrEAfGjd2etvXl7kl4ovJng6uZdGmeirES8UU/H2Zc5MdHZPZsFPnpO0I0zYHDA1YlkF7PAxLUfYWd0RwCEgzLPwSl2aMnh0SHFz/XMKy/2JotCo1a6JdDp9wewy+WCOgPDUIjy6k+sx8+jQwSMn5TvRXlYpddIrlY3E+aPF+3gSjsb9TzN1PvAGje/OejiefGQp2FFMKEvvrZymRgkkNYUkodyZU/4rmVN33pIDgMNsN9JxwOHs/jVyEeKb2pu5SbxIBrReWMiLBzXWrIMk/QHfd3PmNXs0Y9Jw22gMmSzFPqF+PiZ6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gziaEXBFOlvfZ0i+Me8LdDrbfV5WMObZqQ2pjVqFSfE=;
 b=aMYpWOZr4ShaV3eqgToQRNqC2mzfnZohoT76c68H2E/BjVLaaqbho6rM5ZQ15SV/lOanpLjvOTx1YaJfP//tghbfgaEcXBJVEfdeDJe7N6V9IXcQ4z/h/uDjO9hE6rROqkB7zUO6iYXTDD+2rAeaOj/uo9qn3heK/JmQ77HBmuGzLf8XT5CxQkBRlH+0De3Q5VJYS64Zpx3pHD7ZEqUv9+aTJA1Z2RWejDRPa9gbW3OyNjbFAP7408m0bhGAzzOBbnTjEoQMoWz7uQ8r16mmwwfWi8v9RL9E1EAO8G3a0iLIHTEKp7aC+5d4ovWZXEGf2bNla0Qza3/2lonZdOGeCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by DM4PR11MB5972.namprd11.prod.outlook.com (2603:10b6:8:5f::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7025.29; Fri, 1 Dec 2023 00:28:58 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::73d0:f907:41e4:4a34]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::73d0:f907:41e4:4a34%4]) with mapi id 15.20.7046.015; Fri, 1 Dec 2023
 00:28:58 +0000
Message-ID: <2e0f6881-ad17-4c55-a944-1980ac929116@intel.com>
Date: Thu, 30 Nov 2023 16:28:56 -0800
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20231116221637.2589469-1-daniele.ceraolospurio@intel.com>
 <7e7306b7-dc7a-4003-9d83-f0d518597f43@intel.com>
 <1c335fa6-534e-400f-8ee1-f9e0697bd3ab@intel.com>
In-Reply-To: <1c335fa6-534e-400f-8ee1-f9e0697bd3ab@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0218.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::13) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|DM4PR11MB5972:EE_
X-MS-Office365-Filtering-Correlation-Id: 490e4e45-c09e-413e-cd36-08dbf204823c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: F6mtMzxHKy9ul4yZUU1aXpTnwu59W2CRpcslE/yd4I/kRtzuDhley1m9TRC0Bs3NgiCrX0qihXUPfGqb32DSGvSzhvhD0YsZ45lxxL7Btnl3BQ7pw4yafi6RGlosQm+jRQbcb2HAWJTXrhIyo7EfFdHhBpP1qXUvirV02aiqP18E8YSVKB5T/zMkz7nenbGhg21wCPBs9VJgfpYiU6r9MYtU0MCUrkav1H/Cu2l85ZUds37dgGlTnyZIfjtzKnjPKXsHmJSU/qvl53qhuBgUiFfEy8oHzsiZq7IIsqnSvqPftnSaoBN81KxgOsLcgBuaZm1eeKOSSAzFuv+4k7Os5Cy7DM7w5K8nz+kezV41ZmrnEeuWmZM4JP1F6OQYUlb2zyjUDFcY3/I3ruT5XwaqgnOwZbrXVRDmkUXw6aeKPBBmohA0qVuuZsoH8D0LzngHxppXb2oSyrHAonDhl5ogAGYH5lFAU9oiduxlvN82CopUATxqPmPfcX+jpqWYJl14QGe8SXk5gPdNoi0Xs293RnJ++AG3nnBM0lj3eTC70furiYy0ipggNZxgkelUJG/NtJgOYmmMndeSiEJRg/sinrj+9KZfG1opX8A+1NJ46fBw5iSbhbJZTf3hrRq279MFdG8bMFlanHejNytW8kENm63N/fyKFlTcOyxe7jvalkHY2skeaK3x130BoljXIlzi
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(396003)(366004)(39860400002)(346002)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(41300700001)(36756003)(38100700002)(31686004)(15650500001)(2906002)(86362001)(83380400001)(5660300002)(82960400001)(26005)(107886003)(2616005)(6506007)(478600001)(53546011)(8676002)(8936002)(31696002)(4326008)(6486002)(6512007)(66946007)(66556008)(66476007)(316002)(54906003)(45980500001)(43740500002)(309714004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UjZkcGowblRaOURqRTBBU1Vpb2I2eFBRS0lOcFdkZmdOVm9hNWI4TmhYalJM?=
 =?utf-8?B?K3NEY2J6TC9PMExjd2dvWjlpdG56bnVQK2xFU1hqMGhnOVoxNXdGZnZQcnlB?=
 =?utf-8?B?RUR4UkNzcVA3VWQ4K0d2SWFqR2plTnJrS2x5VUxwUXRtZXRhaW5GWU9DZ0ZV?=
 =?utf-8?B?Ty8rSnV5STlJUGgvNjhkQUYrdTlJSlV6RCtVVHp1c2FjUGxTN3g1VExFemhv?=
 =?utf-8?B?V0E0VXZ1N3c4dFRaMGVKTE13UEw1c2NWK3hqbnVadG51TE90TVhqNVNxL29P?=
 =?utf-8?B?OFoxeUVybjU5K2pxVE9XYjkyMHhxTlVBOVpRMzFZQXhncnRJVFNSQWlTUEZT?=
 =?utf-8?B?a1ZBYnAwMXNJa2dWS2FNb0JOWG9WZ0xRYU5xWEExVzE2ZVkwdmpGZ0NLei9z?=
 =?utf-8?B?S3Q3b3lLN2VhU0w0WmdKd1Y1a0JqNDFhblc0OEZZT2gvY25Ob0dTUGo2c0ZJ?=
 =?utf-8?B?Y2RmUURwZ0ZqQ0RVbXB5Vk5KMkpkMlBmandiSitsQktjbDhlNFVkdXFGbEZR?=
 =?utf-8?B?dmtqNGlZMFExK24vcFRITGxBam5TaUxTOS95YUJReEplcnNPNlg4Wml3OC9T?=
 =?utf-8?B?RmJhM2w3RjFZS0Y2RHd1M29sMFBZWUtldzZEc0R1Q2lzTTV5dWFxL1dwUDI3?=
 =?utf-8?B?Qjgvc1RJVEI5bE8zVFZaQ2RNbzlTYzhZc3pMRklRZkhWWTMyc3JOUHZTNXJa?=
 =?utf-8?B?Y3VZK24vNDRyTjJPSStvMGR2WStUNWhYdzJDMC9QOGpUa2t0UHpOdnJibit6?=
 =?utf-8?B?WjJIbzdxcjJDdmJyd0Z0Z0E4ODdCL0g5dGxYYTdaeWZ6VWd5MHRySTRqZ2dD?=
 =?utf-8?B?YnZydDhqdkpFTEZ1d1oyLzZyaEFLcm4zRzNpcUpLSHh0Y3FibFh5ZjFwQVl0?=
 =?utf-8?B?REF6aWFIODdVUFp5RDQxNUloQThBbmEwcnI3VEJSM3dDeUF1VW5DQ0UwZC9K?=
 =?utf-8?B?aFYzTUpUNmNIN1Nwbi9PK0pYUXZSMUFPRklKQnFHOE5oREdRL2p6dkw0ZzlO?=
 =?utf-8?B?dE8xdjAvbG9YQUh1akRiUVV6SWJCaTE2NnlCVmNhT1ZlUTZZM0FZOUJGMzFO?=
 =?utf-8?B?MmVKQTVlTDc2MGQ2OEtrdGpuWDY3WHAzOEp0b1l3RTQ3d2FaTFdNTnQzTGlY?=
 =?utf-8?B?bjBPUzl5a2FyOUY0ZEprUk84WEZOTUF0K3p1ZGUzaFhlUU0xRUc3UFltT3Z5?=
 =?utf-8?B?M0dBQXB0bDRWRTNobmxSdVVsZW52YUh4cFpSaEFJUk5zTXNDTzR6b3Z6dk0v?=
 =?utf-8?B?RTRBbGo3VjZ3dDJSRmZwYUt1MkM0d2N4SlZ1aURCZm5DaVhSWTBVQ0ExZFlD?=
 =?utf-8?B?aFRtQ242T1I2NnZacHZ6MGM3TUIrTHZ3MFgzRVQ1V0J5VFh4MDdqMmhLaklD?=
 =?utf-8?B?dDJuQmNIYnhnMEZpMjZNc0thSHVOOUdkd0QybEtYRlRIVjdzbVlKTkx1ZENO?=
 =?utf-8?B?em92NnBhZHVSR3NPOHBkSGtPZ1NiakU3K2o4RnBnbmJ0UGRCeURwNjJ4NkU1?=
 =?utf-8?B?dDRpNHhVcmRZMVRGcFZ4MVU4UEQ5M2RKS3UrbldldEVFd0l1eU5jOTZtWlFk?=
 =?utf-8?B?RzVHTlM2emVzdGNPN1hTSXlMN3plTFYzTFk5THBCUXU0cUc2azVNSDZkUDNs?=
 =?utf-8?B?MjFEQVhsZVYyUVNCbEVCS1FZSjFZV21sd29UakVaZUk3NVJYUHBaY1hENVZR?=
 =?utf-8?B?L2J1YTRpZ0NBSmZQVE01TkNYcDd6V2x3aEptSThROENZNlpCaUVVcFRRZXVZ?=
 =?utf-8?B?WWpzVWpjMDFwaGdOVGlxMjQ5b2kvMVNibzRLZ3ExeW5DYmcwUTVUYUVqTHhP?=
 =?utf-8?B?Z2hZWWJLbVJiZG14Nm1EU0tpTlJYTGV5SnhtU1orL3hySGcrZ214STFTT2FN?=
 =?utf-8?B?TjJHU0RNU08rYXhFZ2VENnRnWHplS2U1L3czTEFEMDRFdTJCNDVveFRiLzU2?=
 =?utf-8?B?c00vYkhSQW43bm1FTGYxSHErSkllOFFOQjNLY2RwL0gzSC9rbUdjeE5BUGF2?=
 =?utf-8?B?Y0VoRmxQa2pKMGp1ejJLQ0JQU05DTHJoR2JobDdYSVVGLzN1MnBwUGY4eHNP?=
 =?utf-8?B?V2JMbEo3VkhiVVpsVkM4VzJOVEZ6d3N6dHBIbWZ4dDNGdWRqdERvMVRlbnN2?=
 =?utf-8?B?YWc2OFhiZkJjcVU0SFZtWk1xUTdVaUtKY0lVY01MeVJsQytTbTdXelZGNGkw?=
 =?utf-8?Q?jCvgVxSSCjXdzlN8wNK8xBo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 490e4e45-c09e-413e-cd36-08dbf204823c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2023 00:28:58.3568 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tms8GJksNscAQifbeijvf4MRtWqMyeXDfae2H/JPPK5fXtLIv5JKBCLJAHUTfHliYCsRamu6FiG6jSApKA7zS6D3d4e/XvaH4aPDbbkVL4g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5972
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2] drm/xe/guc: Use FAST_REQUEST for
 non-blocking H2G messages
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



On 11/30/2023 1:19 PM, Daniele Ceraolo Spurio wrote:
>
>
> On 11/30/2023 12:59 PM, Michal Wajdeczko wrote:
>>
>> On 16.11.2023 23:16, Daniele Ceraolo Spurio wrote:
>>> We're currently sending non-blocking H2G messages using the EVENT type,
>>> which suppresses all CTB protocol replies from the GuC, including the
>>> failure cases. This might cause errors to slip through and manifest as
>>> unexpected behavior (e.g. a context state might not be what the driver
>>> thinks it is because the state change command was silently rejected by
>>> the GuC). To avoid this kind of problems, we can use the FAST_REQUEST
>>> type instead, which suppresses the reply only on success; this way we
>>> still get the advantage of not having to wait for an ack from the GuC
>>> (i.e. the H2G is still non-blocking) while still detecting errors.
>>> Since we can't escalate to the caller when a non-blocking message
>>> fails, we need to escalate to GT reset instead.
>>>
>>> Note that FAST_REQUEST failures are NOT expected and are usually a sign
>>> that the H2G was either malformed or requested an illegal operation.
>>>
>>> v2: assign fence values to FAST_REQUEST messages, fix abi doc, use 
>>> xe_gt
>>> printers (Michal).
>>>
>>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>> Cc: John Harrison <John.C.Harrison@Intel.com>
>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/abi/guc_messages_abi.h |  2 +
>>>   drivers/gpu/drm/xe/xe_guc_ct.c            | 58 
>>> ++++++++++++++++++++---
>>>   2 files changed, 54 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/abi/guc_messages_abi.h 
>>> b/drivers/gpu/drm/xe/abi/guc_messages_abi.h
>>> index 3d199016cf88..6544205cf40d 100644
>>> --- a/drivers/gpu/drm/xe/abi/guc_messages_abi.h
>>> +++ b/drivers/gpu/drm/xe/abi/guc_messages_abi.h
>>> @@ -24,6 +24,7 @@
>>>    *  |   | 30:28 | **TYPE** - message 
>>> type                                      |
>>>    *  |   |       |   - _`GUC_HXG_TYPE_REQUEST` = 
>>> 0                              |
>>>    *  |   |       |   - _`GUC_HXG_TYPE_EVENT` = 
>>> 1                                |
>>> + *  |   |       |   - _`GUC_HXG_TYPE_FAST_REQUEST` = 
>>> 2                                |
>> -----------------------------------------------------------------------------------------^ 
>>
>> is this aligned correctly ?
>>
>>>    *  |   |       |   - _`GUC_HXG_TYPE_NO_RESPONSE_BUSY` = 
>>> 3                     |
>>>    *  |   |       |   - _`GUC_HXG_TYPE_NO_RESPONSE_RETRY` = 
>>> 5                    |
>>>    *  |   |       |   - _`GUC_HXG_TYPE_RESPONSE_FAILURE` = 
>>> 6                     |
>>> @@ -46,6 +47,7 @@
>>>   #define GUC_HXG_MSG_0_TYPE            (0x7 << 28)
>>>   #define   GUC_HXG_TYPE_REQUEST            0u
>>>   #define   GUC_HXG_TYPE_EVENT            1u
>>> +#define   GUC_HXG_TYPE_FAST_REQUEST        2u
>>>   #define   GUC_HXG_TYPE_NO_RESPONSE_BUSY        3u
>>>   #define   GUC_HXG_TYPE_NO_RESPONSE_RETRY    5u
>>>   #define   GUC_HXG_TYPE_RESPONSE_FAILURE        6u
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c 
>>> b/drivers/gpu/drm/xe/xe_guc_ct.c
>>> index a84e111bb36a..04e443c6fd8b 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>>> @@ -15,6 +15,7 @@
>>>   #include "xe_device.h"
>>>   #include "xe_gt.h"
>>>   #include "xe_gt_pagefault.h"
>>> +#include "xe_gt_printk.h"
>>>   #include "xe_gt_tlb_invalidation.h"
>>>   #include "xe_guc.h"
>>>   #include "xe_guc_submit.h"
>>> @@ -448,7 +449,7 @@ static int h2g_write(struct xe_guc_ct *ct, const 
>>> u32 *action, u32 len,
>>>                      GUC_HXG_EVENT_MSG_0_DATA0, action[0]);
>>>       } else {
>>>           cmd[1] =
>>> -            FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_EVENT) |
>>> +            FIELD_PREP(GUC_HXG_MSG_0_TYPE, 
>>> GUC_HXG_TYPE_FAST_REQUEST) |
>>>               FIELD_PREP(GUC_HXG_EVENT_MSG_0_ACTION |
>>>                      GUC_HXG_EVENT_MSG_0_DATA0, action[0]);
>>>       }
>>> @@ -475,11 +476,31 @@ static int h2g_write(struct xe_guc_ct *ct, 
>>> const u32 *action, u32 len,
>>>       return 0;
>>>   }
>>>   +/*
>>> + * The CT protocol accepts a 16 bits fence. This field is fully 
>>> owned by the
>>> + * driver, the GuC will just copy it to the reply message. Since we 
>>> need to
>>> + * be able to distinguish between replies to REQUEST and 
>>> FAST_REQUEST messages,
>>> + * we use one bit of the seqno as an indicator for that and a 
>>> rolling counter
>>> + * for the remaining 15 bits.
>>> + */
>>> +#define CT_SEQNO_MASK GENMASK(14, 0)
>>> +#define CT_SEQNO_IS_UNTRACKED BIT(15)
>>> +static u16 next_ct_seqno(struct xe_guc_ct *ct, bool is_g2h_fence)
>>> +{
>>> +    u32 seqno = ct->fence_seqno++ & CT_SEQNO_MASK;
>>> +
>>> +    if (!is_g2h_fence)
>>> +        seqno |= CT_SEQNO_IS_UNTRACKED;
>>> +
>>> +    return seqno;
>>> +}
>>> +
>>>   static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 
>>> *action,
>>>                   u32 len, u32 g2h_len, u32 num_g2h,
>>>                   struct g2h_fence *g2h_fence)
>>>   {
>>>       struct xe_device *xe = ct_to_xe(ct);
>>> +    u16 seqno;
>>>       int ret;
>>>         xe_assert(xe, !g2h_len || !g2h_fence);
>>> @@ -505,7 +526,7 @@ static int __guc_ct_send_locked(struct xe_guc_ct 
>>> *ct, const u32 *action,
>>>           if (g2h_fence_needs_alloc(g2h_fence)) {
>>>               void *ptr;
>>>   -            g2h_fence->seqno = (ct->fence_seqno++ & 0xffff);
>>> +            g2h_fence->seqno = next_ct_seqno(ct, true);
>>>               ptr = xa_store(&ct->fence_lookup,
>>>                          g2h_fence->seqno,
>>>                          g2h_fence, GFP_ATOMIC);
>>> @@ -514,6 +535,10 @@ static int __guc_ct_send_locked(struct 
>>> xe_guc_ct *ct, const u32 *action,
>>>                   goto out;
>>>               }
>>>           }
>>> +
>>> +        seqno = g2h_fence->seqno;
>>> +    } else {
>>> +        seqno = next_ct_seqno(ct, false);
>> maybe instead of calling next_ct_seqno() twice we can set it earlier as:
>>
>>     seqno = next_ct_seqno(ct, !!g2h_fence);
>>
>>     if (g2h_fence_needs_alloc(g2h_fence)) {
>>         g2h_fence->seqno = seqno;
>>         ...

Missed this comment in the first reply. The reason I didn't do it this 
way is that I didn't want to leave holes in the assigned seqno sequence 
by calling next_ct_seqno() when g2h_fence_needs_alloc() is false.

Daniele

>>
>>>       }
>>>         if (g2h_len)
>>> @@ -523,8 +548,7 @@ static int __guc_ct_send_locked(struct xe_guc_ct 
>>> *ct, const u32 *action,
>>>       if (unlikely(ret))
>>>           goto out_unlock;
>>>   -    ret = h2g_write(ct, action, len, g2h_fence ? g2h_fence->seqno 
>>> : 0,
>>> -            !!g2h_fence);
>>> +    ret = h2g_write(ct, action, len, seqno, !!g2h_fence);
>>>       if (unlikely(ret)) {
>>>           if (ret == -EAGAIN)
>>>               goto retry;
>>> @@ -786,7 +810,8 @@ static int parse_g2h_event(struct xe_guc_ct *ct, 
>>> u32 *msg, u32 len)
>>>     static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, 
>>> u32 len)
>>>   {
>>> -    struct xe_device *xe = ct_to_xe(ct);
>>> +    struct xe_gt *gt =  ct_to_gt(ct);
>>> +    struct xe_device *xe = gt_to_xe(gt);
>>>       u32 response_len = len - GUC_CTB_MSG_MIN_LEN;
>>>       u32 fence = FIELD_GET(GUC_CTB_MSG_0_FENCE, msg[0]);
>>>       u32 type = FIELD_GET(GUC_HXG_MSG_0_TYPE, msg[1]);
>>> @@ -794,10 +819,31 @@ static int parse_g2h_response(struct xe_guc_ct 
>>> *ct, u32 *msg, u32 len)
>>>         lockdep_assert_held(&ct->lock);
>>>   +    /*
>>> +     * Fences for FAST_REQUEST messages are not tracked in 
>>> ct->fence_lookup.
>>> +     * Those messages should never fail, so if we do get an error 
>>> back it
>>> +     * means we're likely doing an illegal operation and the GuC is
>>> +     * rejecting it. We have no way to inform the code that 
>>> submitted the
>>> +     * H2G that the message was rejected, so we need to escalate the
>>> +     * failure to trigger a reset.
>> if we trigger a reset then we might lost GuC log where additional
>> information about why the call was rejected could be included
>>
>> maybe WARN or taint will be sufficient ?
>
> Since we don't know which message it was that failed, we don't know if 
> we need to release memory in the G2H buffer and in case how much, so 
> the only safe option is to do a reset and start fresh. The GuC log 
> should be included as part of the error capture, like we do with i915.
>
>>
>>> +     */
>>> +    if (fence & CT_SEQNO_IS_UNTRACKED) {
>>> +        if (type == GUC_HXG_TYPE_RESPONSE_FAILURE)
>>> +            xe_gt_err(gt, "FAST_REQ H2G 0x%x failed! e=0x%x, h=%u\n",
>> maybe add "fence" as one could interpret that hex as action code, while
>> code below us using %u to print a fence
>>
>>     "FAST_REQ H2G (fence %u) failed! ...
>>
>>> +                  fence,
>>> +                  FIELD_GET(GUC_HXG_FAILURE_MSG_0_ERROR, msg[1]),
>>> +                  FIELD_GET(GUC_HXG_FAILURE_MSG_0_HINT, msg[1]));
>>> +        else
>>> +            xe_gt_err(gt, "unexpected response %u for FAST_REQ H2G 
>>> 0x%x!\n",
>>> +                  fence, type);
>> wrong params order ?
>
> D'oh!
>
>>
>>> +
>>> +        return -EPROTO;
>>> +    }
>>> +
>>>       g2h_fence = xa_erase(&ct->fence_lookup, fence);
>>>       if (unlikely(!g2h_fence)) {
>>>           /* Don't tear down channel, as send could've timed out */
>>> -        drm_warn(&xe->drm, "G2H fence (%u) not found!\n", fence);
>>> +        xe_gt_warn(gt, "G2H fence (%u) not found!\n", fence);
>> nit: it's a shame that we even don't try to dump unexpected messages
>> (those could be legitimate but late SUCCESS, but equally could be spam
>> that we will be just tracking as unknown fence
>>
>>>           g2h_release_space(ct, GUC_CTB_HXG_MSG_MAX_LEN);
>> btw, I'm not sure if this is correct as we reserved different len, no?
>
> No, when we use a g2h_fence we always reserve GUC_CTB_HXG_MSG_MAX_LEN. 
> I had the same doubt when coding this and confirmed it is correct.
>
> Daniele
>
>>
>>>           return 0;
>>>       }
>

