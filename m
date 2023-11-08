Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2CB5C4332F
	for <intel-xe@archiver.kernel.org>; Wed,  8 Nov 2023 22:41:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B51410E87E;
	Wed,  8 Nov 2023 22:41:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B79210E882
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Nov 2023 22:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699483254; x=1731019254;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=2E9+uoOyr2LPwegC2E6sIeodJHotguKXT5F4xUyw2Xk=;
 b=ZTn1MbGu4sM40CrYnrZgU+7kqSw1ZERfHFJSp4JGu4f+bGgrWcg3Yv5v
 VwT9qUNENr9T2m+mgpHcd7m4Q6P57OrI4zKmwam28EcgasRFcuWhltWyK
 88pduwcD9Ju3STfIq11EmU+VPL5kGLj3vndS7dFd2SAxFWdMlZzv79uJu
 GVJHW5giYUeX4rC984JoJSqTjKQI80cDtsIvMMYRQHG4pkA8K7Wj8Ah0V
 iU7BKN97/U4kdviKsLo4tF1gLVsg5Cw3EaAmbEU3SwtPozB2tc60VtIhi
 NQ5KPP18xlmNXsPlCDJLa8POLigb7Kb4NcvYThRoe+FSwpU9HTAKBw8vg g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="370078963"
X-IronPort-AV: E=Sophos;i="6.03,287,1694761200"; d="scan'208";a="370078963"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2023 14:40:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="739654420"
X-IronPort-AV: E=Sophos;i="6.03,287,1694761200"; d="scan'208";a="739654420"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Nov 2023 14:40:47 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 8 Nov 2023 14:40:46 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 8 Nov 2023 14:40:46 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 8 Nov 2023 14:40:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kH1U5DXij1lNfcZpi6ZTnWb0V5tMgYWtQie3veY85O/tN8YCpW2nwsKuYgF86yRqegNwaS1Z5kypCGBDxPG+PBY80TjFEKc5XOPsCCyKE3nzvApXtXwjpB5NESQoKl/3kbITpHV5Fefj23PbgGd+NrpTMpbqeOiFtQEBT5l7ovk+9ug/VJQxHumDJ83nGFMLQSzElJQg/jLc84GJBzjKVU4noABBf1PDpIlwN+BrzlcFmBdf/zUTy2XwJIN0gzsXpUA/GhBT0f6vhcVUbL5fnUQfyW9JsciqTcy5CfsBChbnQdHwcXXU/2ZzEDFbBRBIipfvpXmUlIebJYHOyg8ihA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rzJY1AxEWtRZYexzU/fqaEcLcQRaV6JHBaTQ5chiSfk=;
 b=Lf+eoBWRPqReDeufoVz+pKAhJaBofjJc3MRX5gZS4DM5Z7EfXTQyesQrxAizXxVVXf3o4XVGQD13C8oq0GIr9DEBDD+WjJBKDboiTqptQZWUXBTnPjBwgZd8XWPuTI3QA64uo9zi6B4wo1ZJPy+nkIxJ2EUxiwEuMZG6MWI09W6U2Ihgk1ZCxnxGt9y1idJLI2gmww8aMvcj8Z0AlCgYEoHCkiZ6+n/BNIHdZXnQ//Zq+bEFtRXbN6LZYJ2bQhh7uJc4hT3F3ubyfCzAEDS7N/2CA5kZVp1qK+ltqr3eIAOIC6B0SUVsv1PJe0wCgUtuNDcO2J1TV1KDyv5x1Chj+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by BL1PR11MB5429.namprd11.prod.outlook.com (2603:10b6:208:30b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.18; Wed, 8 Nov
 2023 22:40:41 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::de08:93ac:5940:ec54]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::de08:93ac:5940:ec54%4]) with mapi id 15.20.6954.029; Wed, 8 Nov 2023
 22:40:40 +0000
Message-ID: <54bc3a5c-68d7-4219-84f5-58ed18ccb56b@intel.com>
Date: Wed, 8 Nov 2023 14:40:31 -0800
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20231027222928.1981633-1-daniele.ceraolospurio@intel.com>
 <20231027222928.1981633-8-daniele.ceraolospurio@intel.com>
 <7ad899dd-460b-42c7-b0a1-4007f817bb37@intel.com>
 <67739f02-f959-48a2-9b2e-40867adf73dd@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <67739f02-f959-48a2-9b2e-40867adf73dd@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR02CA0004.namprd02.prod.outlook.com
 (2603:10b6:303:16d::19) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|BL1PR11MB5429:EE_
X-MS-Office365-Filtering-Correlation-Id: 7efbacc2-41dd-4f33-8a33-08dbe0abbc3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BVc/EE+zIxGLTPn+LOfnLRXKn+2zqppZiBkoKP10jviyx4oFFPYwLOfnaE4UPX08SU0ZU9bzzHw4jmO9aZ2aYi/gXOO2gtpYSDsW8WtQD70JeShYGvGU4XcQCHaoY1J5hMWPxYAiXXDsefmBuYCFXhRQnuS827CzTMQSIJar9WemjW+oU0kAXjVBnvaEzmzCemtSji7/1anJf9tZb8rkz4UY/aL04ecVhEbu8lbyKvxcHnM6kn4H2dbfeU8NCLXl4GOyXIAQfau2cYpHGwE83BZgg/QS/Ny9Xh75qqw1j2Cq4sJ9Z3p3i1C2ByaLrvonEfermfXjGG61oVyFanX+rItd3xirO01GGLZIqJI7TrsIDEfD0L6Eamh6PxvSBM6eeekH2/69uAcXYBk76XMKvTuKgEdiRhPLMapPwcvf3/yBzvYJfNvD/CL0TeAud8K/MwwwcLHb3iHbIbqag+AFTXabDmEXwPXFZcrF9+gKWI3KqiCdCu8U6ULIzSmYB+LwAr4pNQur7fek10KR22uL6McLNPidGsW7rwj49n0dKcbi5D51y+L38PySX6OrNW5j2RUZTkGmQ3BQ8jX11gaZuo7C5JKOYoJo45hCv4r/vj9OX4PVssJPNOAXMWAm/+km/B+Ii9c8G0wBXmVEaNsA3A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(39860400002)(366004)(136003)(396003)(230922051799003)(1800799009)(64100799003)(451199024)(186009)(8676002)(8936002)(31686004)(2906002)(5660300002)(41300700001)(36756003)(316002)(86362001)(31696002)(66476007)(66556008)(66946007)(478600001)(6506007)(53546011)(83380400001)(6666004)(82960400001)(38100700002)(2616005)(6512007)(26005)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K3RvUk9HZ1hwYTZUd2VjZVptd0o5aDQzaFNFdXNLMnFDcTUvZmkzSGduWjM2?=
 =?utf-8?B?UmpFTW1vT0lsS1AzWmVkbHpmZVpweUxURjNmckhJdEY2cUNiK1ZwdjQ2SUgw?=
 =?utf-8?B?c2hocVNyOHRkeklpQ2FZK2cyaU5iR1dsUVRWeHVEVVBjVlg3YkZRbCt0QjFI?=
 =?utf-8?B?YkU1RURWM3NFbEQxdGJCNkxZUjhJVGlqQ3ZBdGxlUmtkYWk1YWtMTTgzTDM0?=
 =?utf-8?B?WnhWUm1BMm43MUZTNEpGak1PUmYwcjdUN2ZDSXFsd2wzTzFCcWJJUXdHMndT?=
 =?utf-8?B?RkN3bFBpOUQ0Q0lvdDFNQ1Q2K1hwdHovSXNxZFgvbHlxd1NzRDc0eTZlSERa?=
 =?utf-8?B?ay95UFkzdElabHVYQmlWUXp2KzlZNXA0aWR4clpVcjJ4TW1vZTNNdnNsMzZT?=
 =?utf-8?B?YnppZW5mYyszdnJFa1pFOFVrc2JabWFrMUIwTXMwaDZhdlBhb1hxMUVoTjZJ?=
 =?utf-8?B?d2tleUZqSnUwRjFCNFNCNENsaENLTG1kL09qUHVlT2c1Y3BvS3YxY1VWemNJ?=
 =?utf-8?B?ckkrRnVmMWMxblBwKzBLSktGMm5ONzNlRHNiRXEzVS9rU0NyNk1UcjZ6QUcx?=
 =?utf-8?B?YmhiTlhMQkRUOWF0aFgyWFdaaEhteGJ2dWxtMkxxclp5TitrNWJiZm1EeWhP?=
 =?utf-8?B?NHBMNTlLRXVkVHhlemszK1ZzMWNxaEE3TStscFhMK0h2WjNzZGFzaWV2TjlQ?=
 =?utf-8?B?VHBLYjIzZm5KNlFOOW1XNndTVUVVWENndE5JNzRtUWpxUWJiUGVJTW1maWx3?=
 =?utf-8?B?MDY0bUVUWmFmWElGYS8xbGVIeDZOMlFSc2F3ZmVRdkZZOC9ydXpnVHl1L01o?=
 =?utf-8?B?U3RnTE1EYXJBTzBtTTZFQzN1MFh3SWVMaE95TEFPeGpQYzcxbHNjTzR1dCsv?=
 =?utf-8?B?alV4K1ZYUzRZcnFlZHc2Wi9BdE04STZoTHAzNDh0MmNrMjFrVUFBZ3VSYU91?=
 =?utf-8?B?eE1XSStDb2RpMjZOVXc2NWdIbFhEcklDN3YvVlBHdVZENjBjSDY2NitEV1lN?=
 =?utf-8?B?Q2NnUnNZWlNEOStOVmtreGFZRWpBRktSV2dKOUgvNXBldnFQeFVlWDhJaHVN?=
 =?utf-8?B?Vkx0SHRXYzhRUjRDSldEcU45MER2UmJQRmVvUkFyUnJYWnQ2eUVHWVBwMGxT?=
 =?utf-8?B?czlOTG5vRkZZTHBON29OdnhoUUgwYXk4NXIzT1RORXhaeWx1TFVuUkdjWGZS?=
 =?utf-8?B?QzZZN2FuclRNSmZ4VEhUQ2VqQWpZTG1OQVV0T2pjSmNHbFIzaDltREhsRExV?=
 =?utf-8?B?SWVpNmhDLzk3VkJQc2ozem1sd0xieEhrTzRzTTZrK1Z1cHFlNVBua0I2dngz?=
 =?utf-8?B?enc5MTl2Q0o2VjJGT2RwbjZzamMrWGFNbGZFZnMxakNlTVNhNGhWV1krQS9s?=
 =?utf-8?B?LzhOMmE1Ti8yaWRWQWIydTNweWt4WjZsR3MvVlJGYktGVC9vRkRTTzg1Qktq?=
 =?utf-8?B?K0ptQ04zZ2ZkaUVOVHYrUGlrNUd6N0FNdEF2Q3BPQVBZQnl2R2Y5dkpLVnMz?=
 =?utf-8?B?bStBZXRmQUhtaXg0NXN6bENsNE1yZDhDOTJrZU1DMm5JZmR3VmhaWktJdUVn?=
 =?utf-8?B?a0h4NmNmVlNPR0s3UUtMVmVRRkJjbllWZFFlbzQ0b2NwNDFRU0FiMGUwaEdk?=
 =?utf-8?B?aWlLRXN6RTJiQ0RWb1U1VVFqb3ZzWVVWeTNObkJzeHpXTVBEREsyY20rb0NK?=
 =?utf-8?B?SjNUb0Rad2tiMWdPUHpVWi9ScVYxQ1pWRXpZSFdwdFBZU2tTYUtvNmkxOFpx?=
 =?utf-8?B?akdWWFlTVXl3L2t0VEFqQ2FUemkzUElQZHMxMnozb3ZrVm1RdmlON0ozQTZU?=
 =?utf-8?B?Z1NtaVNMTFJydEo0N1YxN3gxa1Zmb05RbHhrU1BabkU2L2tORzhsMWVTNlE4?=
 =?utf-8?B?VWloOWRBTHg5VFB3eEhpcjVnY1lrejhXLzhWVkNBQlJ0WkY5REJrbjJWMVQz?=
 =?utf-8?B?OWpRU0lleU0xam1wWmpYbmppQTIrRUUwRWcrSFBOL3Aya1Nqa0hXbC9TcGhr?=
 =?utf-8?B?YlM4cFA4MUtVMXFwVlJkdzAzcXBmU1lHYXY1cUVnVjZiWmxJbG1HZVYzMmd5?=
 =?utf-8?B?UTJlNmloaWdGMTFwK2FVOTR2TnUzNDFWMms5cTUrclB6M3laejc3RXlMZGFB?=
 =?utf-8?B?dTRUNXYwNkplWkk0OUExeHRwdFJ5SnQzRExFZjdVOFFmYWhiUkZpOFZoMFl3?=
 =?utf-8?B?ZWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7efbacc2-41dd-4f33-8a33-08dbe0abbc3e
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2023 22:40:40.6583 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ihWG3rAz24pywRSgikLsoLO0vwhaQqG9UEGo0CLszlUG3GcOubuEZ//NtOOGKtcn77gd97g4V97uSVoW/Clq8cXUHE0sZWnTKgqsUc/3ugY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5429
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 07/12] drm/xe/gsc: Implement WA 14015076503
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

On 11/8/2023 14:35, Daniele Ceraolo Spurio wrote:
> On 11/8/2023 2:22 PM, John Harrison wrote:
>> On 10/27/2023 15:29, Daniele Ceraolo Spurio wrote:
>>> When the GSC FW is loaded, we need to inform it when a GSCCS reset is
>>> coming and then wait 200ms for it to get ready to process the reset.
>>>
>>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>> Cc: John Harrison <john.c.harrison@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/Makefile           |  2 +-
>>>   drivers/gpu/drm/xe/regs/xe_gsc_regs.h | 10 ++++++
>>>   drivers/gpu/drm/xe/xe_gt.c            | 44 
>>> +++++++++++++++++++++++++++
>>>   drivers/gpu/drm/xe/xe_wa_oob.rules    |  1 +
>>>   4 files changed, 56 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>>> index 474b6044d054..4a442dcf4d79 100644
>>> --- a/drivers/gpu/drm/xe/Makefile
>>> +++ b/drivers/gpu/drm/xe/Makefile
>>> @@ -37,7 +37,7 @@ quiet_cmd_wa_oob = GEN     $(notdir $(generated_oob))
>>>   $(generated_oob) &: $(obj)/xe_gen_wa_oob 
>>> $(srctree)/$(src)/xe_wa_oob.rules
>>>       $(call cmd,wa_oob)
>>>   -$(obj)/xe_guc.o $(obj)/xe_migrate.o $(obj)/xe_ring_ops.o 
>>> $(obj)/xe_vm.o $(obj)/xe_wa.o: $(generated_oob)
>>> +$(obj)/xe_gt.o $(obj)/xe_guc.o $(obj)/xe_migrate.o 
>>> $(obj)/xe_ring_ops.o $(obj)/xe_vm.o $(obj)/xe_wa.o: $(generated_oob)
>> Is it not worth splitting this into multiple lines?
>
> Not sure how readable it'd be if we have a rule on multiple lines. 
> Maybe instead I can just add a variable with the list of files and use 
> that in the rule. Not sure it belongs in this patch (or series) though.
Yeah, I guess.

>
>>
>>>     # Please keep these build lists sorted!
>>>   diff --git a/drivers/gpu/drm/xe/regs/xe_gsc_regs.h 
>>> b/drivers/gpu/drm/xe/regs/xe_gsc_regs.h
>>> index 22d2ad9cb64d..9a84b55d66ee 100644
>>> --- a/drivers/gpu/drm/xe/regs/xe_gsc_regs.h
>>> +++ b/drivers/gpu/drm/xe/regs/xe_gsc_regs.h
>>> @@ -16,6 +16,13 @@
>>>   #define MTL_GSC_HECI1_BASE    0x00116000
>>>   #define MTL_GSC_HECI2_BASE    0x00117000
>>>   +#define HECI_H_CSR(base)    XE_REG((base) + 0x4)
>>> +#define   HECI_H_CSR_IE        REG_BIT(0)
>>> +#define   HECI_H_CSR_IS        REG_BIT(1)
>>> +#define   HECI_H_CSR_IG        REG_BIT(2)
>>> +#define   HECI_H_CSR_RDY    REG_BIT(3)
>>> +#define   HECI_H_CSR_RST    REG_BIT(4)
>>> +
>>>   /*
>>>    * The FWSTS register values are FW defined and can be different 
>>> between
>>>    * HECI1 and HECI2
>>> @@ -26,4 +33,7 @@
>>>   #define   HECI1_FWSTS1_PROXY_STATE_NORMAL        5
>>>   #define   HECI1_FWSTS1_INIT_COMPLETE            REG_BIT(9)
>>>   +#define HECI_H_GS1(base)    XE_REG((base) + 0xc4c)
>>> +#define   HECI_H_GS1_ER_PREP    REG_BIT(0)
>>> +
>>>   #endif
>>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>>> index 73c090762771..0e8e24bded1c 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt.c
>>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>>> @@ -10,8 +10,10 @@
>>>   #include <drm/drm_managed.h>
>>>   #include <drm/xe_drm.h>
>>>   +#include "generated/xe_wa_oob.h"
>>>   #include "instructions/xe_gfxpipe_commands.h"
>>>   #include "instructions/xe_mi_commands.h"
>>> +#include "regs/xe_gsc_regs.h"
>>>   #include "regs/xe_gt_regs.h"
>>>   #include "xe_assert.h"
>>>   #include "xe_bb.h"
>>> @@ -504,16 +506,58 @@ int xe_gt_init(struct xe_gt *gt)
>>>       return 0;
>>>   }
>>>   +static int gsc_fw_is_loaded(struct xe_gt *gt)
>>> +{
>>> +    return xe_mmio_read32(gt, HECI_FWSTS1(MTL_GSC_HECI1_BASE)) &
>>> +                  HECI1_FWSTS1_INIT_COMPLETE;
>>> +}
>> This function is duplicated exactly in the GSC source file. That 
>> seems bad. Either it should be exported and shared or the usage here 
>> should be moved to the GSC specific file.
>
> This was on purpose. We do have a bit of duplication for simpler 
> functions in the Xe codebase; e.g., guc_to_gt() is re-implemented in 
> every single file that uses it (I count 6 copies). I can see that this 
> is pushing it a bit tough, since it's a GSC internal detail in a non-
Seriously? Ew! Surely that has to be worth an xe_guc_accessor.h or 
something!

> GSC file, so I'll export it as you suggested. I might also instead 
> export the WA code from the GSC file to hide all the GSC internals in 
> there, will look at both options and see what looks better.

Keeping all the GSC internals in the GSC file seems better to me. Given 
that this is all firmware specific 'registers' rather than bspec defined 
hardware registers. But either way works.

John.


>
> Daniele
>
>>
>> John.
>>
>>> +
>>> +static void wa_14015076503_start(struct xe_gt *gt)
>>> +{
>>> +    /* WA only applies if the GSC is loaded */
>>> +    if (!XE_WA(gt, 14015076503) || !gsc_fw_is_loaded(gt))
>>> +        return;
>>> +
>>> +    /*
>>> +     * wa_14015076503: if the GSC FW is loaded, we need to alert it 
>>> that
>>> +     * we're going to do a GSC engine reset and then wait for 200ms 
>>> for the
>>> +     * FW to get ready for it.
>>> +     */
>>> +    xe_mmio_rmw32(gt, HECI_H_GS1(MTL_GSC_HECI2_BASE),
>>> +              0, HECI_H_GS1_ER_PREP);
>>> +
>>> +    /* make sure the reset bit is clear when writing the CSR reg */
>>> +    xe_mmio_rmw32(gt, HECI_H_CSR(MTL_GSC_HECI2_BASE),
>>> +              HECI_H_CSR_RST, HECI_H_CSR_IG);
>>> +    msleep(200);
>>> +
>>> +    return;
>>> +}
>>> +
>>> +static void
>>> +wa_14015076503_end(struct xe_gt *gt)
>>> +{
>>> +    if (!XE_WA(gt, 14015076503))
>>> +        return;
>>> +
>>> +    xe_mmio_rmw32(gt, HECI_H_GS1(MTL_GSC_HECI2_BASE),
>>> +              HECI_H_GS1_ER_PREP, 0);
>>> +}
>>> +
>>>   static int do_gt_reset(struct xe_gt *gt)
>>>   {
>>>       int err;
>>>   +    wa_14015076503_start(gt);
>>> +
>>>       xe_mmio_write32(gt, GDRST, GRDOM_FULL);
>>>       err = xe_mmio_wait32(gt, GDRST, GRDOM_FULL, 0, 5000, NULL, 
>>> false);
>>>       if (err)
>>>           xe_gt_err(gt, "failed to clear GEN11_GRDOM_FULL (%pe)\n",
>>>                 ERR_PTR(err));
>>>   +    wa_14015076503_end(gt);
>>> +
>>>       return err;
>>>   }
>>>   diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules 
>>> b/drivers/gpu/drm/xe/xe_wa_oob.rules
>>> index f3ff774dc4aa..132c35497f74 100644
>>> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
>>> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
>>> @@ -19,3 +19,4 @@
>>>           SUBPLATFORM(DG2, G12)
>>>   16017236439    PLATFORM(PVC)
>>>   22010954014    PLATFORM(DG2)
>>> +14015076503    MEDIA_VERSION(1300)
>>
>

