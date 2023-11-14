Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16070C4167B
	for <intel-xe@archiver.kernel.org>; Tue, 14 Nov 2023 19:39:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D179D10E22D;
	Tue, 14 Nov 2023 19:39:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA1B510E22D
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Nov 2023 19:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699990761; x=1731526761;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=F214vYQb3aBFGdD9iapdk0r1MXwtqFLdGCMrA71xOwU=;
 b=GtQI93I77OmuETYTyB4nfvzWQDDy0Qb3jo/IFL9UCQStjhti62jwWKNr
 goMdEZ+T2y5v7zgbSkLKhDOvctv4b1Dy7zlLFeNIqW3Qe+vscpoRN7lQs
 8M19iUT4aSm6wMVYuPHAiA50BF8rR81MGf3gBp+DSCgtEhgRvNd3pucM4
 rNKfr0oTeqW6eyciqXmrdUfrnpzj6DBwgwdx6Za1TBdwin807EiZKjorJ
 f6+hnwTn59knJLBfqdV4UkzvmzOhgNpSh87yXbqa/8NErEF3VvFALvXOz
 r8IvpQr/4RgxsaDfFHMteqceCHAljfFsQZbuncqygpBhKFdY0dzuTfATN g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="12277718"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="12277718"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 11:39:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="1096208666"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="1096208666"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2023 11:39:20 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 14 Nov 2023 11:39:19 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 14 Nov 2023 11:39:19 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 14 Nov 2023 11:39:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WoB71JmfvPoERzSYIfJA+SOzRFNkVAadGfNbLE8yIxa0D277C6z9P7et/J9evPYtJx3NNiBp6eY2Xe4vAauJQHhUTrUPW5sKj4R7528fEtjyxNG5IAIpwyeGLuKAg0/O0U5Xw6HXpPpWJNFaSnUbqoLoMtSfYzFbmQhrdJwCriC7pLzsaN8MW0w0YL+LJ59BPBrQS85O/CMepDOZs1j7n4Zq5+H+SrSHukFYOaS0L1x942zaJVNXC+9OTK8x61u3QiQIDX6pkCoAQWpnc2m5hNtbhKtH2T2BOtK7F5Ter8N2f6D1BTvQxeHzofm1RxsfVkbHttLUjt5GqJjKvkmXHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nTrEGQRPJJBNBIpzVGqZsmf1fwsd1MNNYOOq7+rth90=;
 b=auyqJJX5Oe4nar2Ajc8PGlw285MxGnvfZzMhxTz164vjiAd8KJABpsX0u00R5IqcsLFga9mF3PZF/3pZm40CQ9Z+qxUjGxAsgIQQpgG4utGucs/idgOEdwneQIDuCErhufOzisFIT0v/mI2xq3dRt7hcc6xzRrpbFdWjgYwhj2uh6bYK5LU52tRxrXsJSUedvWVgl/DJSQzUySrkyCdPmnMjao9Whw66a60k7WCy9lxIooBd6QPZ0YyU8NIEVhP9evQ7zkjjWTo4RRlVDygKK00ZFtdBkJ0Mke9/UOifTbKW5sH1y5JthtVAIpjdJhbELuPgr+vV4hsg0pDQHL2VIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by SN7PR11MB8042.namprd11.prod.outlook.com (2603:10b6:806:2ed::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Tue, 14 Nov
 2023 19:39:17 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::de08:93ac:5940:ec54]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::de08:93ac:5940:ec54%4]) with mapi id 15.20.6977.029; Tue, 14 Nov 2023
 19:39:17 +0000
Message-ID: <37501c91-7e5c-4c66-afe8-93b0a83465a0@intel.com>
Date: Tue, 14 Nov 2023 11:39:15 -0800
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20231027222928.1981633-1-daniele.ceraolospurio@intel.com>
 <20231027222928.1981633-12-daniele.ceraolospurio@intel.com>
 <fb742073-a0df-4406-9e81-e27d049244e7@intel.com>
 <91878caa-e0ba-4d84-8e5f-50b5654a421b@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <91878caa-e0ba-4d84-8e5f-50b5654a421b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0289.namprd03.prod.outlook.com
 (2603:10b6:303:b5::24) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|SN7PR11MB8042:EE_
X-MS-Office365-Filtering-Correlation-Id: d7c4171c-5b5b-4b03-645f-08dbe54963ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q8rUxIr2ZPYZ/tDHjUQ7GycwBgyBXcOgV475C9Bco8kJja1kl53bD8+3T56cwaMgy+K5xSR+xQgiUqOril7io6vFInKca21OAHgmO7zU/vj3CNaCHE3psp765rzAVQq1Y6f6/rFriP63CHmi2QyLIG579UWPrZLXTSvDkh1vwVDoxhczSHHMJQH5hxqRB37zVzyL6vHlLTMhnUd11Nfz6cJnJGlTsDWJTKJt6EjjgNuOeAkRzSenpQPFkPJiyyluLZBf0vpGfg1kIMPz07gnVijqZ5HBFcTtjCrtf5U9MLtwcGjFk1gIL6wRd6GjOAXpcBRmaMM+BGIeXLuPpE9CYyZJQ/6d7TejtSHj+6q5uN+r5wxnh958eSoyOywNSP+WTalLnsA55icpWSQwEWd9bB5RNHHf7xyeDhot2XAFsE4Acj/dWqr9YNnylxB3y3+TLmbMw9NMagVqn0Dcrc0pNyIjcNe3XfBe4w3Xn2maM7JdWfmj6xK6PWPXyM1+f5vFHG+c15UplwDoKF8y4veJpg+ubDx412cncYkM6GOxqXg3EQYTYmREALn4NsQRXS3EZF3opsRPidGQfcuV5iVxwoRdx1AnRmrmStHmog2G3eypw43FpvSQq9vGZbO63AYQ8s9KzuXnLAbjLKSJ6AJvSg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(396003)(376002)(136003)(366004)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(82960400001)(53546011)(6506007)(2616005)(6512007)(83380400001)(5660300002)(41300700001)(8676002)(8936002)(478600001)(2906002)(6486002)(66476007)(316002)(66946007)(66556008)(31696002)(36756003)(86362001)(38100700002)(26005)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SGlYS1dpVDdYOGV1cnM2eVBZSW5iVExDeVBUODFPQk5mUnBqUnB5ajY0ZGkv?=
 =?utf-8?B?b2xtbTkxZU1LV2pqMlR5eEFNWksxZVdsQXRNVDRCNnhiTTNDSTZqelVSaDdW?=
 =?utf-8?B?SUlpNzdZbTJYQTlGY0lZMVpES1l5WDN4OFZuRkNaUjlWUHRVVFREUXlYQnpN?=
 =?utf-8?B?T2VBaEFNYTlxanY2T0liTi85SVFxNGVMS2NtTUp3OHBXYVZiMFZ0aTZJR3Ri?=
 =?utf-8?B?Wmt3d21tK3FDU1J4dFF0YkJqZDcyMXhBTkpvYUVqL1RCRmw3MDJoQUwyMW9s?=
 =?utf-8?B?YTAraGNUUi9xcXEwdExKNzcreW5JdnBiQnZ0aE45ajQ1WUFPczc4bFNDZ25B?=
 =?utf-8?B?cTBST1h4dWxDRWFkY2h5Z2hsOXZkSGdkMEJXSThlS1NiK3pobktDaDcyN1dB?=
 =?utf-8?B?cGRWYmR4UnNxRVlJZFBPVERXaHZaNkN1WkpuN2VkaUhaRVFZUFhWcUdWdnJZ?=
 =?utf-8?B?bTdHamtvK3NGMVRWQWhDTFNzK1MvdUVFOFdKRExHV25IU01aRzZIM211UGZ5?=
 =?utf-8?B?Y3BZZ3Fpbmc4R1lHRWRJbkYzSXlCTFFKQjc4RjZuL25ycjNCQUVHNmNJOFFp?=
 =?utf-8?B?SUgvRXNuNDJRYk1nUE1JUnJDNGN1b28xUzRxWlZuU05OMlVhV0FtOUZwQzdS?=
 =?utf-8?B?STFuVVFGMm1jS1h4VWZJMjUzWUFYK051VDBaWmx2UU1Ga0tkbjFTOEluMkxG?=
 =?utf-8?B?VmQvZTZWb2FFekRYTTIzT1ZrVDJGS1BzYkdZMDkrVFJFR1E1eWtpd2R1cnB4?=
 =?utf-8?B?Nm1UWENTUnVaWklRbWxqVERaNEhqYUpsUmFnMGNlZVU1cXFreDdROForWHo2?=
 =?utf-8?B?RnhFTW9ZSmtxVzh3aHIvaWR3Z1grMDhXcno0TkxnQnk0U3NlSFp5U0NmN1lT?=
 =?utf-8?B?aEpqaGw0MjNkTW9IbU8vZll5d0ZoVGR6YWVUV3VMd0RHWTM1SHIwUWx5aTh4?=
 =?utf-8?B?SHV2VEFyMkFxaXdpSXFIbEZTcG5wK3U2aFlRdk9zeVdRVllMaG5pQjBkOGNN?=
 =?utf-8?B?bm5QRTZrdzBLcGZzT2IxRzBSNzlKSVpyYm91MklIZWM0OTg2OE4yeVFObzFo?=
 =?utf-8?B?eE9BQlgvdnJtUndTYXlUUGgrcUhjcjZDMTNTM0h2TThrb2prZEZNN3AyMUlJ?=
 =?utf-8?B?SU40by8raUVFUGJMZTFWTk1zRGcrYm5YQWgvMVkxYkpsZkI5K3pwTE04c3RK?=
 =?utf-8?B?aTFZait5bjlpSlVxblNaY0RMUmNEcklzMXM5ZFcrTjJ6RFhaTW52OVg5MHJ1?=
 =?utf-8?B?algzWEt1RTlRWGxGSjN5R0xEdys4QVlGd1lmQjZGL2wrMmRScW1oeU8zUC85?=
 =?utf-8?B?ZHFKYnd1Q3RpVUVoSEdoYXp3SlRPRHR2R2RaaWVjWUZ5ekJaOFRrc0pwelJt?=
 =?utf-8?B?YnN3S0xLZW9RMUxCelJEZFdId2E3VmY3UC9GUThweDVtc3FkSSsvejYxTGk1?=
 =?utf-8?B?ZUxpU3dyQWpKaWxndXFCQ1JET2lEYVllQUFHMXlqQ2ErTjNDYmtMTHFodzJO?=
 =?utf-8?B?QmVhRW8rUWpxUFVTZEw3eGNhTk0veU16aDhZNzFzODFNK2lGeExpL25BdmRi?=
 =?utf-8?B?b2hOTWhHQlF3WStmWjB5dERQOW1VR1Z5TTg5Sy94NDd2RC9wNGkyeEZiRlky?=
 =?utf-8?B?Ly94alQwQW5wYUdRTzRTMHhVMWtnelVSNlJvMVN4TE1IbVo5TFFlMWl2dWtY?=
 =?utf-8?B?blh6SjlBemNUY1plNTdMamZyYzNIZ3plUEUvRk9wc2ZXYzdod2tpN2lMLzd1?=
 =?utf-8?B?bDhiSmZsWnJyckVSZkxPaTV4SXNxSW9LNTJ1MXZVMEMyU3R6TjB4S0tZbUJk?=
 =?utf-8?B?K0lMWUZRZ3F6ZjNad2hOUGF3REsxRjlzUUZnRGpsNmY5QUJNZzdnb3VwQnh3?=
 =?utf-8?B?Rncvem9vbkpHR21mRmpDUzg0N25WTFdzMDRSWUl5VXQ4RXlLeTMwRkcwZHpH?=
 =?utf-8?B?N2krOHZSMklEa3d5R21vcVNRSWVIbEt1VU9kNnkzL2xJSmc5T0Q3Vm9UOW5l?=
 =?utf-8?B?eHUzUjk2d2FQbGZ4VVhpTE5pUTRmc1gwb0lHeWdsbnNYYmZhdGFhQ010UUpm?=
 =?utf-8?B?TWY3alFTdkhSWllVeXZJR2NmNWdhcXcxTThHOGJYQmhxa0V6bVpEVXBWUlRN?=
 =?utf-8?B?RldJRnBzSEhMREhVMXFSYVBMQVlNSmI2MHk5dUVBU3lnNzA1bDlKQ3J4d2hN?=
 =?utf-8?B?ckE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d7c4171c-5b5b-4b03-645f-08dbe54963ff
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2023 19:39:17.8218 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E+NctGcjatnOYvbJ21sRTuctbGv1R94nmv8Pm1UhIiDLT8CKz2GIRKArymGO/AQ/la1gMtXw+g9Buzv2n1yykl/ULE/4ktC/8RKVaz7N8YU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8042
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 11/12] drm/xe/gsc: Define GSCCS for MTL
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

On 11/13/2023 13:32, Daniele Ceraolo Spurio wrote:
> On 11/13/2023 12:23 PM, John Harrison wrote:
>> On 10/27/2023 15:29, Daniele Ceraolo Spurio wrote:
>>> Add the GSCCS to the media_xelpmp engine list. Note that since the
>>> GSCCS is only used with the GSC FW, we can consider it disabled if we
>>> don't have the FW available.
>>>
>>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_hw_engine.c | 20 ++++++++++++++++++++
>>>   drivers/gpu/drm/xe/xe_pci.c       |  2 +-
>>>   2 files changed, 21 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c 
>>> b/drivers/gpu/drm/xe/xe_hw_engine.c
>>> index b5b084590888..142783177e45 100644
>>> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
>>> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
>>> @@ -26,6 +26,7 @@
>>>   #include "xe_rtp.h"
>>>   #include "xe_sched_job.h"
>>>   #include "xe_tuning.h"
>>> +#include "xe_uc_fw.h"
>>>   #include "xe_wa.h"
>>>     #define MAX_MMIO_BASES 3
>>> @@ -610,6 +611,24 @@ static void read_compute_fuses(struct xe_gt *gt)
>>>           read_compute_fuses_from_dss(gt);
>>>   }
>>>   +static void check_gsc_availability(struct xe_gt *gt)
>>> +{
>>> +    struct xe_device *xe = gt_to_xe(gt);
>>> +
>>> +    if (!(gt->info.engine_mask & BIT(XE_HW_ENGINE_GSCCS0)))
>>> +        return;
>>> +
>>> +    /*
>>> +     * The GSCCS is only used to communicate with the GSC FW, so if 
>>> we don't
>>> +     * have the FW there is nothing we need the engine for and can 
>>> therefore
>>> +     * skip its initialization.
>> Is that correct? Is this testing against a firmware image being 
>> available on the system or against a firmware blob being defined for 
>> the platform?
>
> This is post fw fetch, so it checks whether we have a blob or not.
>
>>
>> If the firmware is not available but was defined then presumably that 
>> means that any feature that is reliant upon GSC is going to be broken 
>> - HDCP, PXP, etc. It seems like that should warrant more than a 
>> drm_info level message.
>
> The fetch code will already print at drm_notice level. This log is not 
> about the fetch failure, it is about the GSC engine being disabled as 
> a consequence of that (or of the FW not being defined in the first 
> place). PXP and HDCP should have their own checks for GSC availability 
> when we add support for them (they do in i915).
Okay. That makes sense.

>
>>
>> On the other hand, if the check is about whether a firmware blob is 
>> defined for this platform then surely this code path wouldn't even be 
>> taken in the first place? This can only be reached if actually trying 
>> to load a firmware file at all, can't it?
>
> I'm not sure what you mean here, this code path is part of the engine 
> init flow, so we'll always take it.
>
> Note that the main goal of this check is to allows us to define the 
> GSC engine before the GSC FW, which is useful because the GSC FW is 
> usually publicly released quite late for a new platform, while engines 
> are one of the first things we define.
Hmm. Meaning this is essentially pre-release only code? We generally try 
not to include internal only hacks in the public tree. Having said that, 
presumably this is not actually pre-release only. Exactly the same 
situation exists if the end user just does not have the firmware 
installed for any reason. In which case it seems reasonable given the 
above more specific checks in the firmware loading and PXP/HDCP code.

Reviewed-by: John Harrison <John.C.Harrison@Intel.com>


>
> Daniele
>
>>
>> John.
>>
>>> +     */
>>> +    if (!xe_uc_fw_is_available(&gt->uc.gsc.fw)) {
>>> +        gt->info.engine_mask &= ~BIT(XE_HW_ENGINE_GSCCS0);
>>> +        drm_info(&xe->drm, "gsccs disabled due to lack of FW\n");
>>> +    }
>>> +}
>>> +
>>>   int xe_hw_engines_init_early(struct xe_gt *gt)
>>>   {
>>>       int i;
>>> @@ -617,6 +636,7 @@ int xe_hw_engines_init_early(struct xe_gt *gt)
>>>       read_media_fuses(gt);
>>>       read_copy_fuses(gt);
>>>       read_compute_fuses(gt);
>>> +    check_gsc_availability(gt);
>>>         BUILD_BUG_ON(XE_HW_ENGINE_PREEMPT_TIMEOUT < 
>>> XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN);
>>>       BUILD_BUG_ON(XE_HW_ENGINE_PREEMPT_TIMEOUT > 
>>> XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX);
>>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>>> index 2fae45b9d88e..c09b51735ee4 100644
>>> --- a/drivers/gpu/drm/xe/xe_pci.c
>>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>>> @@ -197,7 +197,7 @@ static const struct xe_media_desc media_xelpmp = {
>>>       .name = "Xe_LPM+",
>>>       .hw_engine_mask =
>>>           BIT(XE_HW_ENGINE_VCS0) | BIT(XE_HW_ENGINE_VCS2) |
>>> -        BIT(XE_HW_ENGINE_VECS0),    /* TODO: add GSC0 */
>>> +        BIT(XE_HW_ENGINE_VECS0) | BIT(XE_HW_ENGINE_GSCCS0)
>>>   };
>>>     static const struct xe_media_desc media_xe2 = {
>>
>

