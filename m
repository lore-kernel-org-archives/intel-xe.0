Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 671C4C77B75
	for <intel-xe@archiver.kernel.org>; Tue, 23 May 2023 07:14:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F5FC10E3D6;
	Tue, 23 May 2023 07:14:47 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDA9F10E3D6
 for <intel-xe@lists.freedesktop.org>; Tue, 23 May 2023 07:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684826084; x=1716362084;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+le5h4LutvZyYnWU3zN8tzgDwnOmF7XqMGs7QRWeYTk=;
 b=ePqYT6TwSx72oE91CuiA9jEGM3Z+wG4gMEM3zZvCEmlK/HoVvCVJjQL7
 ylyZyRA0Zy0JqUzBsYTs/a+mVnmL0tbymcojcZOCLnh1Ei4psV2PrgsEn
 wt/8IlYvc+uGCIqOK7ph96H288HvQ6eEHveEli73MG7CTRQwl7rYkMvrH
 QO3rXmcoHYOv4qs7+qQLrCSimQoyqAq7yNMdPEvSsPZZPyMXnyXST8HZp
 lIfgQSHJu8ETwDRQpoPNrdzbyCLH1QPySMAYU27Jf6Qk+x4NCy4+yPsYA
 KXyE52Z5l47diIqqAQU5WyFPScAZqXSUcN1vmug1mfRUS9IdHtvsEpe+E g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="353184821"
X-IronPort-AV: E=Sophos;i="6.00,185,1681196400"; d="scan'208";a="353184821"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2023 00:14:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="697948408"
X-IronPort-AV: E=Sophos;i="6.00,185,1681196400"; d="scan'208";a="697948408"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga007.jf.intel.com with ESMTP; 23 May 2023 00:14:22 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 23 May 2023 00:14:22 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 23 May 2023 00:14:22 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 23 May 2023 00:14:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=crxdzZ/kNHO+QLDQrJZSx6ewgTsJBRom0xj7aZNpkLQTJ4/v3HvwS07rLlLqRraE8oH0JFUWt4NIigyXVGLvbEjIV+CKAeqzBpgvS3YoxTz3AeiYrBu3N0D7amsVU37u+qFXAUwl6H2gzZlkzBPdcX+5gjv+SHgqvvOZ6He0lFVumT632aHZhbXoljU9k4WQ/XH4V45aGCOXYfytqoaH3Rgf8wFCcKxH7vOsvBnad2SXQ/TRyznJzXZpAAPm7jsqD8f7cVl8IFC3NbvGnlq68zjZg9UvdITHrHiWyakaxvywHnw+aZ9k70dXzJyQ7TZ+hoFqWUODtICS8+HJ8kwL9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W8KzoN4W2tTm/66Wz+fennTNPRep3zCaNuYFRPtFifM=;
 b=OvcOoE+n0pBKLbr05rQoxhxQlZUJL4WTnUTcNra5J76YPoBKPBXJH3PLpf57BSp9ZzMkTzb5CUvlSgdiiVM6xL4XZTlzr/OeyLTS92UxXKh18wubmb0rEb94sIwFSE8QPEnHjGB1QZS98MMiYrMHhHcRoa6APGTw0nHMyyxb1qBDnEKvQR2vm1avKviJpqtYWK+nnbY4Gvk8JujZJfREY6jYx+Wxne7pJWpTHmVDzcYTvP5jBXy91fSBIo7dIY7qn5IwTaOnKwbrB3OLs26R+elixRjVqHpPd4nrq/uRCDaeAMajuL35VVoHcKydc0cunYuTbozXCZM0SYYhEs74NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by DS0PR11MB7288.namprd11.prod.outlook.com (2603:10b6:8:13b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Tue, 23 May
 2023 07:13:58 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::962f:b14d:4e3b:63b3]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::962f:b14d:4e3b:63b3%3]) with mapi id 15.20.6411.028; Tue, 23 May 2023
 07:13:58 +0000
Message-ID: <47ad6abb-9edc-2651-6c30-48836f57ed9f@intel.com>
Date: Tue, 23 May 2023 12:43:49 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20230512052050.1308879-1-riana.tauro@intel.com>
 <089629af-306d-93c4-08c6-b844cd1fdea4@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <089629af-306d-93c4-08c6-b844cd1fdea4@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0053.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:98::14) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|DS0PR11MB7288:EE_
X-MS-Office365-Filtering-Correlation-Id: db243805-bda0-4c1c-2401-08db5b5d46b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: evNaPWLDrSTBlN7TMRdUW6GbTsNWalAGTZ9GZAXT+2x6ZEnxjHYIfF83k0D6fA6of574b87AWK7AI2FURYniDoGkiNaNF8W8RscortWMNszhJG3wrCCVvAI4bOTuK21eMdJTLUjGoP0NJG1wj45gBtzD/cqNYFVvrhjg00G65r/qhUk6L0TOpayozru6nEmD40J95hRSn7RukOmih8N7IWk9C+G4HBocLcc8krBaqLHizmJzG24n8/4mxOh9JtWoLYZgJ7uS16+UUEOOoIeYmJxkmsd2a8FPM1YOFt141reDNl0gjML0iBdqM+vhADYYJbOkJRdOpIsb86de7CGIWxQd8O6WpmsVxJBG2Hw3pRJ2mD/Guh6BVPS0610NAn3DL+a9E8vSRuRMIcREliHpwPPd2r7PiA+0cYEoFZNSZ9N4S/XtFQeN/V8B8HYBTvDW0syVxiq92NbVnWz+v7vH6t7FmY17VRtu2VOThlTlKtx2eIhrRKT0pAzwwoRqMriD1r6x9iH6lNS9Bb9JvN3zKUXCQ9biWvWLLNuNAmxDFb1/8+zaNCvfyXA0gUeK7Y4s5ZzNGafBcgjMr4F8Oyv2jVbA9mzoRfuKXHqU/fEjY8Ct8PK8/qbiDr75wcFxI/sJTHWGjgFeG4G9qD+0MvRoRlivK6uemeTTM8oVsy0ucho=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(396003)(39860400002)(376002)(136003)(346002)(451199021)(8936002)(44832011)(5660300002)(8676002)(36756003)(2906002)(186003)(83380400001)(30864003)(86362001)(2616005)(82960400001)(38100700002)(31696002)(107886003)(26005)(6512007)(6506007)(53546011)(41300700001)(478600001)(6666004)(316002)(4326008)(66476007)(66556008)(66946007)(31686004)(6486002)(21314003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SHg5bGt1emN3cEEzTy8wQ1dOTkY5UFBxTFVhMlpVNUVkSUpjeXpIOHorUjRh?=
 =?utf-8?B?Rkk3QTR2SjBGRjdRcW1zd2pycDhVYTViNVN1Z01yM1NUZ2tvUWdRQzc4aC9n?=
 =?utf-8?B?UXBKc1NFendDejI2eXV4UHFyeWZmNlBDcnJEM1Y0T0wrcDlGdnBWYU04NmxH?=
 =?utf-8?B?NVRROVdtajFsWjBadEdTajYzNnFtSGZsM25HNUpJZUlNbVpkY0hQL21nQkFZ?=
 =?utf-8?B?SzBxSzNuc2hzaUFVV2gwelN6dVJDZkFkVjkwY2FJcC9IR2ZNNkxuNzlKY1gr?=
 =?utf-8?B?QTBpSFN2ekRaZVNGZ2FLSFZIOHI2aHhnSXh4UTc4MDhuNDYzTW1Bc2dLa1Vp?=
 =?utf-8?B?T1dWT1JZenY3U0o0dlVPMmppeDNQOEY2SWtQQm9IQ00zbHh1d1M2OGVjVUY5?=
 =?utf-8?B?M3hiWDhuVkxZRTVMYWdmTFRxVHZpeUI5ZE5kUXJadTVZeWxvTy9jWkRjblpR?=
 =?utf-8?B?cDl6RWZoSW13T0RyTUNPWVlZZ3kzM2RPVzdQZjZlcVNlVk9QaFA2R05vTnRY?=
 =?utf-8?B?a0VCRStnUGtyS0h3bWRBbm5ETnhTYUNTNzFFNFMza21rY0lsWEN3NGtiZ2kz?=
 =?utf-8?B?anlNT0NJR0RXRlprNXc2eHU3R0ZsSnhaWHR3NTIveXFsUmlTOEZHN2ZWdUo5?=
 =?utf-8?B?YTRFd0sxZ1pWQXVjNkFCMEJZWU1Ib2g5eElaYlFUS0p5WVlmSFRNVDhkalli?=
 =?utf-8?B?U0hYUytQRXh0U3E1UXIwa1RPM0oweHJmVmpJMzBzU1hJTnlGY2k3UFBuc2J6?=
 =?utf-8?B?YTZGeng0VStId1U2cnFzcERVZ3IzZ21KNkZuSVAwMkt6OUlqYmlQZ1M1dER2?=
 =?utf-8?B?K3BrWFQvNEJzMURHMS94eU1RU1NEbDV4cXdxTW1qQzM0NkdsZ3E0OThVK3BH?=
 =?utf-8?B?WSswaDhlSnhKRjdTODNLWXA5aVlHRnI5SW4yQTJWQTRseEVBQXA2T25qZ25l?=
 =?utf-8?B?L2ZDUEFCdUVuNTFJU0NoREhKaW5jdVR4UEh3WjlFS1U3ekNEVjE0amZrbkRS?=
 =?utf-8?B?NHN1WHc0M2RjM0NDalVsWDNyQUdNU1F3NW4ySkdGeFhydmliQ01wcGdseWRa?=
 =?utf-8?B?bEx6cnI2bkxpdUdrTXJ2cVpvcWNzQW52aHFLd1h1aXFhd1hUcEhxLytBRFBO?=
 =?utf-8?B?OEhUeUpqKzRDUFlxbGZMRk80djlFRjhuQlQ3TmFETHM3UEFNS2V5c002Z05M?=
 =?utf-8?B?MTQ3UHFVRjVxQ3ErbHU5UzdnN1FEMlFZR0d4L2JiK0dXM3c5TnBOV2dEMS92?=
 =?utf-8?B?OU55YW5mdDNBYktvdnM5RTF3bXdYcW9EbmV6YUNaRzRsVTNjZnl0Uml6VWF0?=
 =?utf-8?B?U1YwSjNhMGlxZFIyMmkvZkFrZmVqbzBqZUhwUUhHRnF3dC9YanBHR3FpVnRo?=
 =?utf-8?B?djhXTmFmaXdGdlZmNzhxdk16MlZ6Z3ZyYkVhUW5ZUFFkTkdSWkYzdkxuMFdP?=
 =?utf-8?B?RlJHalF1WmYxcHc2RktvejZhcUtPd0JqTmYraTNCOVlldGIzb2UzRjVwTXN2?=
 =?utf-8?B?bi9SWXhEaUlFWStqNmRESndRN3cwQllPRHpiSkNNTnJxRWhSc1E1ZUwvQ2Jl?=
 =?utf-8?B?U3U3OVRXbkw0ZjRLNnlJUkpxSU9VOUdLektIQ2RTZ0d0TlFKK2pNRVNmZWFX?=
 =?utf-8?B?UHFTU1lndklhN1YzSEFoVlhvdjY4K2pncTRFMFlpVW95ZnJ6WTJtTkthbWc2?=
 =?utf-8?B?Y1ErSndQSUZySzB0K3orWWJNWTQ4a3ZUVnEvUGlYeWlVTmlFZ0JEZ0FtNmFK?=
 =?utf-8?B?SWtUTXZYdHhOWE1iUXpwL0RNdXd2NTlTM0pEdVlHV2VPRlZyaSs2Vm8wbmpv?=
 =?utf-8?B?MnZyVnBKY216ZE5TY2ZwTVVrbXJsTDNrV0taR2lnVk1ENDBSVk4wcURxajRM?=
 =?utf-8?B?eUdQT3F0Y3F3anlTUHl4bFRsNG56aGRyaXMzMVRYSDd5UU53YVRTQ1JUT1d3?=
 =?utf-8?B?MkhUaFVoanYxN3ppRE1weG5jZGlNdWNlZmJtWmJFbi9kYU55YW5iUHJQK3NF?=
 =?utf-8?B?QTNRNEhBY1RxS1c3ODRMWS91VlhUOHdYa2JOZU1TOE56YW5sSEpubGU3dWVv?=
 =?utf-8?B?Tkg0alJqZWpSOWJndHN5VU9lenllc2MyN21xRnlISldSQXMxRVBWb091UitF?=
 =?utf-8?Q?+x+2OSNjT4N2SWnUKj4uA36rT?=
X-MS-Exchange-CrossTenant-Network-Message-Id: db243805-bda0-4c1c-2401-08db5b5d46b6
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2023 07:13:58.2966 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J6na/9betVWMmx5Qhvcedvgng4vQsG/l8Lxg1Bir+tan1JcrLs/1sshkNucMEkZE/RTMk1o1L6eruI/6ffPXdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7288
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC PATCH] drm/xe: add a new sysfs directory for
 gtidle properties
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
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


Hi Michal
On 5/20/2023 3:41 PM, Michal Wajdeczko wrote:
> 
> 
> On 12.05.2023 07:20, Riana Tauro wrote:
>> Add a new sysfs directory under devices/gt#/ called gtidle
>> to contain idle properties of GT such as name, idle_status,
>> idle_residency_ms
>>
>> v2: abstract using function pointers (Anshuman)
>>      use device_attr (Badal)
>>      move rc functions to guc_pc
>>      change name to gt_idle (Rodrigo)
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>>   drivers/gpu/drm/xe/Makefile           |   1 +
>>   drivers/gpu/drm/xe/xe_gt.c            |   5 +
>>   drivers/gpu/drm/xe/xe_gt_idle.c       | 134 ++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_gt_idle.h       |  18 ++++
>>   drivers/gpu/drm/xe/xe_gt_idle_types.h |  39 ++++++++
>>   drivers/gpu/drm/xe/xe_gt_types.h      |   4 +
>>   drivers/gpu/drm/xe/xe_guc_pc.c        |  87 +++++++++++------
>>   drivers/gpu/drm/xe/xe_guc_pc.h        |   5 +
>>   8 files changed, 261 insertions(+), 32 deletions(-)
>>   create mode 100644 drivers/gpu/drm/xe/xe_gt_idle.c
>>   create mode 100644 drivers/gpu/drm/xe/xe_gt_idle.h
>>   create mode 100644 drivers/gpu/drm/xe/xe_gt_idle_types.h
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index 84ad0e949044..93bec17ee0de 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -44,6 +44,7 @@ xe-y += xe_bb.o \
>>   	xe_gt.o \
>>   	xe_gt_clock.o \
>>   	xe_gt_debugfs.o \
>> +	xe_gt_idle.o \
>>   	xe_gt_mcr.o \
>>   	xe_gt_pagefault.o \
>>   	xe_gt_sysfs.o \
>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>> index 0d4664e344da..9e1f7343f256 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.c
>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>> @@ -18,6 +18,7 @@
>>   #include "xe_force_wake.h"
>>   #include "xe_ggtt.h"
>>   #include "xe_gt_clock.h"
>> +#include "xe_gt_idle.h"
>>   #include "xe_gt_mcr.h"
>>   #include "xe_gt_pagefault.h"
>>   #include "xe_gt_sysfs.h"
>> @@ -381,6 +382,10 @@ static int gt_fw_domain_init(struct xe_gt *gt)
>>   	if (err)
>>   		goto err_force_wake;
>>   
>> +	err = xe_gt_idle_init(&gt->gtidle);
>> +	if (err)
>> +		goto err_force_wake;
>> +
>>   	/* XXX: Fake that we pull the engine mask from hwconfig blob */
>>   	gt->info.engine_mask = gt->info.__engine_mask;
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
>> new file mode 100644
>> index 000000000000..0060d8584485
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_gt_idle.c
>> @@ -0,0 +1,134 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>> +#include <drm/drm_managed.h>
>> +#include "regs/xe_gt_regs.h"
>> +
>> +#include "xe_device.h"
>> +#include "xe_gt.h"
>> +#include "xe_gt_idle.h"
>> +#include "xe_guc_pc.h"
>> +#include "xe_mmio.h"
>> +
>> +/**
>> + * GT Idle:
>> + * ================
>> + *
>> + * Provides sysfs entries for idle states of GT
>> + *
>> + * device/gt#/gtidle/name - name of the state
>> + * device/gt#/gtidle/idle_residency_ms - Provides residency of the idle state in ms
>> + * device/gt#/gtidle/idle_status - Provides current idle state
>> + */
>> +
>> +static struct xe_gt_idle *kobj_to_gtidle(struct kobject *kobj)
>> +{
>> +	return container_of(kobj, struct gtidle_kobj, base)->gtidle;
>> +}
>> +
>> +static ssize_t name_show(struct device *dev,
>> +			 struct device_attribute *attr, char *buff)
>> +{
>> +	struct kobject *kobj = &dev->kobj;
>> +	struct xe_gt_idle *gtidle = kobj_to_gtidle(kobj);
>> +	ssize_t ret;
>> +
>> +	ret = sysfs_emit(buff, gtidle->name);
> 
> no need for 'ret' variable, just:
> 
> 	return sysfs_emit(buff, gtidle->name);
> 
>> +
>> +	return ret;
>> +}
>> +static DEVICE_ATTR_RO(name);
>> +
>> +static ssize_t idle_status_show(struct device *dev,
>> +				struct device_attribute *attr, char *buff)
>> +{
>> +	struct kobject *kobj = &dev->kobj;
>> +	struct xe_gt_idle *gtidle = kobj_to_gtidle(kobj);
>> +	ssize_t ret;
>> +
>> +	gtidle->idle_status(gtidle);
>> +	ret = sysfs_emit(buff, gtidle->state);
> 
> sysfs_emit takes "fmt" so this should be rather
> 
> 	return sysfs_emit(buf, "%s\n", idle->state);
> 
> but I'm wondering whether it is good idea to keep state as a string,
> maybe it should be done simpler/direct as:
> 
> 
> state = xe_gt_idle_state(gt);
> return sysfs_emit(buf, "%s\n", gt_idle_state_to_string(state));
> 
> 
>> +
>> +	return ret;
>> +}
>> +static DEVICE_ATTR_RO(idle_status);
>> +
>> +static ssize_t idle_residency_ms_show(struct device *dev,
>> +				      struct device_attribute *attr, char *buff)
>> +{
>> +	struct kobject *kobj = &dev->kobj;
>> +	struct xe_gt_idle *gtidle = kobj_to_gtidle(kobj);
>> +	ssize_t ret;
>> +
>> +	ret = sysfs_emit(buff, "%llu\n", gtidle->residency_ms(gtidle));
>> +
>> +	return ret;
>> +}
>> +static DEVICE_ATTR_RO(idle_residency_ms);
>> +
>> +static const struct attribute *gt_idle_attrs[] = {
>> +	&dev_attr_name.attr,
>> +	&dev_attr_idle_status.attr,
>> +	&dev_attr_idle_residency_ms.attr,
>> +	NULL,
>> +};
>> +
>> +static void gt_idle_kobj_release(struct kobject *kobj)
>> +{
>> +	kfree(kobj);
>> +}
>> +
>> +static struct kobj_type gt_idle_kobj_type = {
>> +	.release = gt_idle_kobj_release,
>> +	.sysfs_ops = &kobj_sysfs_ops,
>> +};
>> +
>> +static void gt_idle_fini(struct drm_device *drm, void *arg)
>> +{
>> +	struct gtidle_kobj *gtidle_kobj = arg;
>> +
>> +	sysfs_remove_files(&gtidle_kobj->base, gt_idle_attrs);
>> +	kobject_put(&gtidle_kobj->base);
>> +}
>> +
>> +int xe_gt_idle_init(struct xe_gt_idle *gtidle)
>> +{
>> +	struct xe_gt *gt = gtidle_to_gt(gtidle);
>> +	struct xe_device *xe = gt_to_xe(gt);
>> +	struct gtidle_kobj *gtidle_kobj;
>> +	int err;
>> +
>> +	gtidle_kobj = kzalloc(sizeof(*gtidle_kobj), GFP_KERNEL);
>> +
>> +	if (!gtidle_kobj)
>> +		return -ENOMEM;
>> +
>> +	err = kobject_init_and_add(&gtidle_kobj->base, &gt_idle_kobj_type, gt->sysfs, "gtidle");
>> +	if (err)
>> +		goto exit_kobj;
>> +
>> +	gtidle_kobj->gtidle = gtidle;
>> +
>> +	gtidle->residency_ms = xe_rc6_residency_ms;
>> +	gtidle->idle_status = xe_rc_status;
>> +	sprintf(gtidle->name, "gt%d-rc\n", gt->info.id);
>> +
>> +	err = sysfs_create_files(&gtidle_kobj->base, gt_idle_attrs);
>> +	if (err)
>> +		goto exit_kobj;
>> +
>> +	err = drmm_add_action_or_reset(&xe->drm, gt_idle_fini, gtidle_kobj);
>> +	if (err)
>> +		goto exit;
> 
> gt_idle_fini() will be called here on error, so below
> sysfs_remove_files() will be called twice
> 
>> +
>> +	return 0;
>> +
>> +exit:
>> +	sysfs_remove_files(&gtidle_kobj->base, gt_idle_attrs);
>> +
>> +exit_kobj:
>> +	kobject_put(&gtidle_kobj->base);
>> +	return err;
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.h b/drivers/gpu/drm/xe/xe_gt_idle.h
>> new file mode 100644
>> index 000000000000..ac0ab970a3f7
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_gt_idle.h
>> @@ -0,0 +1,18 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_GT_IDLE_H_
>> +#define _XE_GT_IDLE_H_
>> +
>> +#include "xe_gt.h"
>> +#include "xe_gt_idle_types.h"
>> +
>> +int xe_gt_idle_init(struct xe_gt_idle *gtidle);
>> +
>> +static inline struct xe_gt *gtidle_to_gt(struct xe_gt_idle *gtidle)
>> +{
>> +	return container_of(gtidle, struct xe_gt, gtidle);
>> +}
>> +#endif /* _XE_GT_IDLE_H_ */
>> diff --git a/drivers/gpu/drm/xe/xe_gt_idle_types.h b/drivers/gpu/drm/xe/xe_gt_idle_types.h
>> new file mode 100644
>> index 000000000000..bc9c59249b6c
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_gt_idle_types.h
>> @@ -0,0 +1,39 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_GT_IDLE_TYPES_H_
>> +#define _XE_GT_IDLE_TYPES_H_
>> +
>> +#include <linux/kobject.h>
>> +#include <linux/types.h>
>> +
>> +/**
>> + * struct xe_gt_idle - A struct that contains idle properties based on gt
>> + */
>> +struct xe_gt_idle {
>> +	/** @name: name */
>> +	char name[16];
>> +	/** @state: current idle state */
>> +	const char *state;
>> +	/** @cur_residency: raw driver copy of idle residency */
>> +	u64 cur_residency;
>> +	/** @prev_residency: previous residency counter */
>> +	u64 prev_residency;
>> +	/** @idle_status: get the current idle state */
>> +	void (*idle_status)(struct xe_gt_idle *gtidle);
>> +	/** @residency_ms: get idle residency in ms */
>> +	u64 (*residency_ms)(struct xe_gt_idle *gtidle);
>> +};
>> +
>> +/**
>> + * struct gtidle_kobj - A kobject struct that connects the kobject and xe_gt_idle
>> + */
>> +struct gtidle_kobj {
>> +	/** @base: The actual kobject */
>> +	struct kobject base;
>> +	/** @gtidle: A pointer to the struct xe_gt_idle */
>> +	struct xe_gt_idle *gtidle;
>> +};
> 
> maybe all you need is to reuse kobj_gt from xe_gt_sysfs_types.h ?
> 
>> +#endif /* _XE_GT_IDLE_TYPES_H_ */
>> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
>> index 7c47d67aa8be..90b2d34efe5b 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_types.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
>> @@ -7,6 +7,7 @@
>>   #define _XE_GT_TYPES_H_
>>   
>>   #include "xe_force_wake_types.h"
>> +#include "xe_gt_idle_types.h"
>>   #include "xe_hw_engine_types.h"
>>   #include "xe_hw_fence_types.h"
>>   #include "xe_reg_sr_types.h"
>> @@ -287,6 +288,9 @@ struct xe_gt {
>>   	/** @uc: micro controllers on the GT */
>>   	struct xe_uc uc;
>>   
>> +	/** @gtidle: idle properties of GT */
>> +	struct xe_gt_idle gtidle;
>> +
>>   	/** @engine_ops: submission backend engine operations */
>>   	const struct xe_engine_ops *engine_ops;
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
>> index 72d460d5323b..e83283cbcb00 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>> @@ -14,6 +14,7 @@
>>   #include "xe_bo.h"
>>   #include "xe_device.h"
>>   #include "xe_gt.h"
>> +#include "xe_gt_idle.h"
>>   #include "xe_gt_sysfs.h"
>>   #include "xe_gt_types.h"
>>   #include "xe_guc_ct.h"
>> @@ -40,6 +41,9 @@
>>   #define GT_FREQUENCY_MULTIPLIER	50
>>   #define GEN9_FREQ_SCALER	3
>>   
>> +/* Multiplier for  RC6 Residency counter in units of 1.28us */
>> +#define XE_RC6_MULTIPLIER	1280
>> +
>>   /**
>>    * DOC: GuC Power Conservation (PC)
>>    *
>> @@ -76,12 +80,7 @@
>>    *
>>    * Render-C states is also a GuC PC feature that is now enabled in Xe for
>>    * all platforms.
>> - * Xe's GuC PC provides a sysfs API for Render-C States:
>>    *
>> - * device/gt#/rc* *read-only* files:
>> - * - rc_status: Provide the actual immediate status of Render-C: (rc0 or rc6)
>> - * - rc6_residency: Provide the rc6_residency counter in units of 1.28 uSec.
>> - *                  Prone to overflows.
>>    */
>>   
>>   static struct xe_guc *
>> @@ -580,11 +579,41 @@ static ssize_t freq_max_store(struct device *dev, struct device_attribute *attr,
>>   }
>>   static DEVICE_ATTR_RW(freq_max);
>>   
>> -static ssize_t rc_status_show(struct device *dev,
>> -			      struct device_attribute *attr, char *buff)
>> +u64 get_residency_ms(struct xe_gt_idle *gtidle, u64 cur_residency,
>> +		     u32 residency_multiplier)
> 
> as this function is not used elsewhere it should static
> but OTOH it operates on gtidle so not really belongs to guc_pc.c
> and should be properly exported from xe_gt_idle.[ch]
> 
>>   {
>> -	struct xe_guc_pc *pc = dev_to_pc(dev);
>> -	struct xe_gt *gt = pc_to_gt(pc);
>> +	u64 delta, overflow_residency, prev_residency;
>> +
>> +	overflow_residency = BIT_ULL(32);
>> +	/*
>> +	 * Counter wrap handling
>> +	 * Store previous hw counter values for counter wrap-around handling
>> +	 * Relying on sufficient frequency of queries otherwise counters can still wrap.
>> +	 */
>> +	prev_residency = gtidle->prev_residency;
>> +	gtidle->prev_residency = cur_residency;
>> +
>> +	/* delta */
>> +	if (cur_residency >= prev_residency)
>> +		delta = cur_residency - prev_residency;
>> +	else
>> +		delta = cur_residency + (overflow_residency - prev_residency);
>> +
>> +	/* Add delta to extended raw driver copy of idle residency */
>> +	cur_residency = gtidle->cur_residency + delta;
>> +	gtidle->cur_residency = cur_residency;
>> +
>> +	/* residency multiplier in ns, convert to ms */
>> +	return mul_u64_u32_div(cur_residency, residency_multiplier, 1e6);
>> +}
>> +
>> +/**
>> + * xe_rc_status - get the current Render C state
>> + * @gtidle - xe_gt_idle instance
>> + */
>> +void xe_rc_status(struct xe_gt_idle *gtidle)
> 
> hmm, this function seems to accessing GT registers only, why it is
> placed in guc_pc.c ? it really doesn't belong to GuC IMO
> 
>> +{
>> +	struct xe_gt *gt = gtidle_to_gt(gtidle);
>>   	u32 reg;
>>   
>>   	xe_device_mem_access_get(gt_to_xe(gt));
>> @@ -593,37 +622,33 @@ static ssize_t rc_status_show(struct device *dev,
>>   
>>   	switch (REG_FIELD_GET(RCN_MASK, reg)) {
>>   	case GT_RC6:
>> -		return sysfs_emit(buff, "rc6\n");
>> +		gtidle->state = "rc6\n";
>> +		return;
>>   	case GT_RC0:
>> -		return sysfs_emit(buff, "rc0\n");
>> +		gtidle->state = "rc0\n";
>> +		return;
>>   	default:
>> -		return -ENOENT;
>> +		gtidle->state = "unknown\n";
> 
> kind strange design pattern to pass status as string ...
> IMO we should rather define enum and convert to string as needed
> 
>>   	}
>>   }
>> -static DEVICE_ATTR_RO(rc_status);
>>   
>> -static ssize_t rc6_residency_show(struct device *dev,
>> -				  struct device_attribute *attr, char *buff)
>> +/**
>> + * xe_rc6_residency_ms - rc6 residency in ms
>> + * @gtidle - xe_gt_idle instance
>> + */
>> +u64 xe_rc6_residency_ms(struct xe_gt_idle *gtidle)
>>   {
>> -	struct xe_guc_pc *pc = dev_to_pc(dev);
>> -	struct xe_gt *gt = pc_to_gt(pc);
>> -	u32 reg;
>> -	ssize_t ret;
>> -
>> -	xe_device_mem_access_get(pc_to_xe(pc));
>> -	ret = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>> -	if (ret)
>> -		goto out;
>> +	struct xe_gt *gt = gtidle_to_gt(gtidle);
>> +	u64 reg, rc6_residency;
>>   
>> +	xe_device_mem_access_get(gt_to_xe(gt));
>>   	reg = xe_mmio_read32(gt, GT_GFX_RC6.reg);
>> -	ret = sysfs_emit(buff, "%u\n", reg);
>>   
>> -	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
>> -out:
>> -	xe_device_mem_access_put(pc_to_xe(pc));
>> -	return ret;
>> +	rc6_residency = get_residency_ms(gtidle, reg, XE_RC6_MULTIPLIER);
>> +
>> +	xe_device_mem_access_put(gt_to_xe(gt));
>> +	return rc6_residency;
>>   }
>> -static DEVICE_ATTR_RO(rc6_residency);
>>   
>>   static const struct attribute *pc_attrs[] = {
>>   	&dev_attr_freq_act.attr,
>> @@ -633,8 +658,6 @@ static const struct attribute *pc_attrs[] = {
>>   	&dev_attr_freq_rpn.attr,
>>   	&dev_attr_freq_min.attr,
>>   	&dev_attr_freq_max.attr,
>> -	&dev_attr_rc_status.attr,
>> -	&dev_attr_rc6_residency.attr,
>>   	NULL
>>   };
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h b/drivers/gpu/drm/xe/xe_guc_pc.h
>> index da29e4934868..a6abac189c8a 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pc.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.h
>> @@ -8,8 +8,13 @@
>>   
>>   #include "xe_guc_pc_types.h"
>>   
>> +struct xe_gt_idle;
>> +
>>   int xe_guc_pc_init(struct xe_guc_pc *pc);
>>   int xe_guc_pc_start(struct xe_guc_pc *pc);
>>   int xe_guc_pc_stop(struct xe_guc_pc *pc);
>>   
>> +void xe_rc_status(struct xe_gt_idle *gtidle);
>> +u64 xe_rc6_residency_ms(struct xe_gt_idle *gtidle);
> 
> if you look around you should clearly see that such function prototypes
> do not fit here, all other functions have "xe_guc_pc" prefix and takes
> "xe_guc_pc" as param ...
> 
> please reconsider function placement and the flow
Thanks for the review. Will fix the above review comments.
Rev1 had the rc functions in gt_idle. Based on the review, all low level 
functions were moved to this file as it is a guc pc feature

Will retain the prefix and change the parameter to guc_pc

Thanks
Riana
> 
> Michal
> 
>> +
>>   #endif /* _XE_GUC_PC_H_ */
