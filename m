Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DE92C4828D
	for <intel-xe@archiver.kernel.org>; Wed,  7 Feb 2024 01:26:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FAF611302D;
	Wed,  7 Feb 2024 01:26:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b5E3T6Re";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03EB211302C
 for <Intel-Xe@lists.freedesktop.org>; Wed,  7 Feb 2024 01:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707269194; x=1738805194;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=dcXwHgm2UoUnn8Y1tdn3CBrchulK4lh+C8RwZsKAaQM=;
 b=b5E3T6ReGaUVGvDn3PAyXQUSIk15oGxuD/0NHYC/fzZC5gVPC/IEt8t3
 1Po9clrOG0qnCAS48AOVN+t2O6z+dvwfyJq3WeiE5GverlYRHAZtl7Eqe
 yCxzs/m3vvLnhrqdoB57i7qJnWpMLq1e1QVtrWA01Grc644hDnJMO166Y
 FGvDV5PXpw6tYP4ipPTTAgxOWYrrpDtq3BewuL9yZ5r+ps5OMAKJ5x8Fd
 5jMNpIpNPTUX3UxwwHd8y4d7YF1IPnGrMwQMyMlL9Ch5EDF7VgtvVdVpV
 I3fxP4cbLm1sssSwskFVGxHl64wPNeLChltkkGfdBclFcvWWaSdpxKNCt g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="778399"
X-IronPort-AV: E=Sophos;i="6.05,248,1701158400"; 
   d="scan'208";a="778399"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2024 17:26:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,248,1701158400"; 
   d="scan'208";a="5812537"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Feb 2024 17:26:34 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 6 Feb 2024 17:26:33 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 6 Feb 2024 17:26:33 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 6 Feb 2024 17:26:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oWQeenJCDfUUJrBSdbN0P+cmmK9zy5f/Ds+/t8WDFZlKa8o3CmWliUwfGg1sH/nbbUUlSLJrLYM6RGQZVkt+JgRLBlRsGynw5w5bVazdyCnBoOYCqZUbzRtl9LQnVkCRuP6yozBzZIOqk1q8JicbbDDJu7BRHL0We9RnJp0Ho8pXQPK2kI6kwyq2bAF6a/KgTxGzqwiiK0I95W6OPjhpFLZsjEfzJz6pWriFSqHreaPNc1ZfAi36+A4/zU/rLo6DehQcdMhXjD2IznMximwuDPMwc1jbbnIbLbQqHhHq8tPB6imOtMRTjW8lDs76wK0UVawV8TP8ye05533PmyRUqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zuTerQVRt1K690f/+ZQxRrLEzkhgDBOraY61p+CWiTE=;
 b=j3ldtOe+HpPalmeL6HeFlGIIHQy/cE5ELJf0+Nj3cU3SoX+AP/mar0IiaP/PyE79gcRM58hGUpHOuY0oGg+//TP2qv/MTLa3S9ZJ0bWwHo34dvdELXHfDFQIbCIQl++7EXmXDywVbjVVghMhTQlPK8soww7nanNXhgqnAhATBoUDyJbrIAWigRC9/Mr2J5vH/HBB23y0WfaYEb4SlGb51rXik1kqgSHdjubRKxJFWwrXhdpxscEi215+60b5Fd4GBm4OLrXDEl13sy618Ti67tpfgSizGCGCF5S0i6iX3h5KO1+lnF7xJtOHcvCJ7wRR4nsXWZzrgVLdK+H6fuIzCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by CH0PR11MB5362.namprd11.prod.outlook.com (2603:10b6:610:b9::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.36; Wed, 7 Feb
 2024 01:26:30 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::c590:37b4:ad48:cd0f]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::c590:37b4:ad48:cd0f%3]) with mapi id 15.20.7249.035; Wed, 7 Feb 2024
 01:26:30 +0000
Message-ID: <374fb67f-e199-4bd3-9fa9-4fcf2eda94cc@intel.com>
Date: Tue, 6 Feb 2024 17:26:28 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe: Make read_perf_limit_reasons globally
 accessible
Content-Language: en-GB
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <Intel-Xe@lists.freedesktop.org>
References: <20240206201153.2773996-1-John.C.Harrison@Intel.com>
 <20240206201153.2773996-2-John.C.Harrison@Intel.com>
 <4tyazvyh5rc42ethjxv7lotzdkzs7gbthzen2j7uyxfo32f6lf@ialkyb6nybvn>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <4tyazvyh5rc42ethjxv7lotzdkzs7gbthzen2j7uyxfo32f6lf@ialkyb6nybvn>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0150.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::35) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|CH0PR11MB5362:EE_
X-MS-Office365-Filtering-Correlation-Id: eae10b11-1095-489d-f746-08dc277bcfeb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Poe5MrPhr318FiCW0HKfRbHmArtFRrqnL5fD1uPtvYrZCOo5RfqWLj/WX1lAQBJmsfBBFoJIC2n1fiWnBWydKkCC+qC27QnapdlqxosajHghoaKLQvfgcyDg2VHkCe41b/QWhMmanYl+VsYsN11AncOWgIWZS3MycjIthJ/DT2tlAGAzFbhNW/UoI4M+o6iw7Ir0Q0IHiVC3hv/AVf0rjClYMi0oPwtyKTPiZfHnQ7F9IVxS+2cYc4IqS+9niblO+TY1dV16EagpAWpDUaWE2lIyqg7y/1lM+IrQdC28jZyJjY+uW16+OBC+vj8ZPmXkqwQad8PEryUWexd0YSS1KObW5ep0huKrqzkA2izm8xpby23uWsLviSJlMUtvYXj0BC94g8taarcfuCjkF7zBUuUVBQSqlWpugbCi3iLaIbY6y4LOXY4mYnFzZKMs11nqXdoZ+OiBi+VhXyM9cowPUlbI4/1ceMUWd9KylloRhxvYjrmjS0s+AMMfMzDDrOn9nLgCv4kTV5SUaCVugfPRdhx6BwM9IKq+J00i0fMBTxvVw3E0cLibPslJSgJoThJkKajmxYJAvXljHGpfG2dbQf1P+5V4y+dIfEJxwPuPeEw13OtSDw50ZiYdFFh7zY+ZZW5YPi4dX+dTeeNzyBidtw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(39860400002)(346002)(396003)(136003)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(31686004)(38100700002)(82960400001)(53546011)(6506007)(83380400001)(316002)(86362001)(26005)(31696002)(41300700001)(2616005)(4326008)(8676002)(8936002)(6862004)(36756003)(6512007)(478600001)(6486002)(2906002)(5660300002)(66946007)(66556008)(37006003)(6636002)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MEROb3N6UmZINTdiNGIyRkhHdGZJeGgyNFhvYUpFS2VPRHY1SjJndVBPdm10?=
 =?utf-8?B?YWlxclREdGlqOEhHZHc5TitjRFNTaHgvckEyQnh4NDd2RHZ3Qmk4djBBak9v?=
 =?utf-8?B?anordm5OejJyN3NPbWV1QWVCMTBpYUV2NTNiaTRDTk5TR3BZM3VudEgzY3M5?=
 =?utf-8?B?WDJsd2tqdXhuU1BGKzh5dk9jaVhFakJnNlpwRllXTU51bTl1UnBhaTgzU1pJ?=
 =?utf-8?B?cHlyVVdTMjEwRWREd1JjM2NIK3FwOC94aTJpelUyWE5HRCt2Y0xFYVlPL3ZS?=
 =?utf-8?B?VjFqUEM3Y2JFTk9lVVlrSUFEV0t3M2dVM1hzbGMxRzRoOU81R084MVdNcXV5?=
 =?utf-8?B?aE84dzhna0VYcHJBd1F0a2RiQ1pBejhVbjJGSG8rYmJTWUJoU1NsR2x6ODMr?=
 =?utf-8?B?YzJnRDlEQWUvTjMyVzhhdVNldTEycGNYNkR3b3MxdEYyZVhLLzdMbTVZbEd2?=
 =?utf-8?B?V1VrM2ViTUFNS3hxQzdVMDJ3TzZqVmtXemwvd01qVEhRTlRIRU1jSlQvZWxB?=
 =?utf-8?B?Vi9XbU1rUTdNSFFNY2M0U3JJYlV3ZjdFcUJwd0tVTytuQjFXc09KSm1xc1pz?=
 =?utf-8?B?ZnFsRTdXbWZUWUtvM283WFpEWEdtcERoaGE5bkxoWlNMdE5vbXJwbkJqSndU?=
 =?utf-8?B?VmxWMlRIRkFyNzNzMVBDbGoybXVqU0hSSnZUUkZVa0I1WFNJelp4MjY5b0hS?=
 =?utf-8?B?SlJNYzFTQVZDNFVJM1VTdjhaWGlUcVNQM21lSThjYllaeC8vbDA5WHByU3Nv?=
 =?utf-8?B?RStZQkg0c1FjKzRyancxQVpCTHNrSk5wS29rbG83NUwwZWNZZTdjSUk5djJT?=
 =?utf-8?B?bVJlRUdIbm9jUVBBSUpQZmUvTVdCa2RzNzloaFpJd2hmcU5zWWZydWxjaUwv?=
 =?utf-8?B?eGZ5b2tzTnhJV3ZLYkZNbFF3d0xJdkxSVEg1b00ranQvTmMyZTJPS0kzYlRZ?=
 =?utf-8?B?R256OWZWbXBYaUNBYm16cnZENDR4bkdmb2hBTVBsUXo1ZDFvZTNFZzBFY0JQ?=
 =?utf-8?B?TFJnZ1lJOCs1eC9aVEhkODdMbFhvQzFGdjU0WjJFejVqNmpHT0RpaUtQcy94?=
 =?utf-8?B?SDB6NEhGZ2VEcXNBRHBIYzBrNkVjcUViVDgwZkdGMEl5TWsvaE9pcVRjdG9W?=
 =?utf-8?B?azM0WnArWEs4emQ0SU5KUUlNVGI0dU14QjFrWTJpZkx5djlCVnVTYllWSWFG?=
 =?utf-8?B?dDl1VnlaSTk3WXNDZ0ZZUHdWc202c1BUTFVEdGZRYTl1UGQ5aHJpRkpMVGNM?=
 =?utf-8?B?STVmc3NGUDl3bS9RVmFIdExEWk5TVmg4dUhzSHA1bkhTTzBPc2VreGJ6QjNN?=
 =?utf-8?B?dVFreC81Qlc4a0xXRk43YllYWnRHRStYMmRZak9vc2x3TFFPclA5cUlyNG9t?=
 =?utf-8?B?NGdlMVJrc096RUUxck85WDdDalA5ZzVMMy9CMHNkSkVrMk1GMzVoaDhHWDVO?=
 =?utf-8?B?YktLK1cyUjdndkI0OEtJYU9lOTVsTHNuYlJqOVJqSzcyd1RlM2kwRVBPOHYv?=
 =?utf-8?B?UlVqS2hqazZ5SHdqWitvd25ReHJCTlNDS1dTVWRzQjlyS1NzYzhUREQ3R2NE?=
 =?utf-8?B?V0lmWGlzUVBqZHE4VUhBTXljbCtHRUJEQzV6MDBHRjJlR0xzUUxUUjBkVERw?=
 =?utf-8?B?TDkydVFSam9pZW8xRGxTaDhuekpQOUxCSGdxcWxmdnRGbTFpblVGTU0zWStx?=
 =?utf-8?B?VkJlVEMzWFVyQ3RBNFZsU2hyUDZzNEdMa0tVTWlHZStWYnF6eVhPRWRBdER1?=
 =?utf-8?B?Q0pCSDRRTEpRd3hwOUc0ak1TaEd0WW5FdXBXb3ZJMDBaSEIvQ1F0WWY2NjRS?=
 =?utf-8?B?b0REY1N4SnB4M2w4UXZvbkROKzBnNk1HSlZZUTJpY3ZVZmV2eHpNOGdLUUVo?=
 =?utf-8?B?aDRudlExNndNQ1BJWHBoWFMzclV0b1U5SytPbXdHdzI0MmlqZXZCRjIrbllY?=
 =?utf-8?B?bkpueTNZaHNKQVo2NktUMjE1UzIyMWlEQ1NsR3FWV3dNaTJYWlkwdDIxWHpv?=
 =?utf-8?B?WU9kNDdrbWFTcENNRHd3c0Y4OW9VTHBtejBadGxrSERYTjdMNFFBQVJsTSsz?=
 =?utf-8?B?WWdSTEt6WWM2d2NxOVBmUzdXcytpS0lVUW93RkdsZCs1RERDVFB5Wm5DU1lE?=
 =?utf-8?B?UERFMGZ2S0t1M05rak90TWZxMG0yUllwY1J3RDd6TVNXdVBaekl5L1RuNnFU?=
 =?utf-8?B?WHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eae10b11-1095-489d-f746-08dc277bcfeb
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2024 01:26:30.4073 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I0TQgK7rTpNRT3ATZB2QNeINuQeqM7RImEiuaCp3pHk33NiCFvo1Z8e+4b9RwkxDaaMxGDqYCZREf92rYKmo/G5xx3tWFAcGDCA7nQH+4oE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5362
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

On 2/6/2024 13:26, Lucas De Marchi wrote:
> On Tue, Feb 06, 2024 at 12:11:50PM -0800, John.C.Harrison@Intel.com 
> wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> Other driver code beyond the sysfs interface wants to know about
>> throttling. So move the query function out of sysfs.
>>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>> ---
>> drivers/gpu/drm/xe/xe_gt_freq.c           | 18 +++++++++++--
>> drivers/gpu/drm/xe/xe_gt_freq.h           |  4 +++
>> drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c | 31 ++++++++---------------
>> 3 files changed, 30 insertions(+), 23 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_freq.c 
>> b/drivers/gpu/drm/xe/xe_gt_freq.c
>> index e5b0f4ecdbe8..4cf7772c387f 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_freq.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_freq.c
>> @@ -3,15 +3,17 @@
>>  * Copyright © 2023 Intel Corporation
>>  */
>>
>> -#include "xe_gt_freq.h"
>> -
>
> foo.c should always include foo.h as the first thing.
My understanding is that local header files must be includable in any 
order and therefore should always be kept sorted alphabetically. Also 
that system includes always come first and local includes after 
otherwise you risk doing bad things to the system headers if you have 
something dodgy in your local include.

>
>> #include <linux/kobject.h>
>> #include <linux/sysfs.h>
>>
>> #include <drm/drm_managed.h>
>> #include <drm/drm_print.h>
>>
>> +#include "regs/xe_gt_regs.h"
>> #include "xe_device_types.h"
>> +#include "xe_mmio.h"
>> +#include "xe_gt.h"
>> +#include "xe_gt_freq.h"
>> #include "xe_gt_sysfs.h"
>> #include "xe_gt_throttle_sysfs.h"
>> #include "xe_guc_pc.h"
>> @@ -220,3 +222,15 @@ void xe_gt_freq_init(struct xe_gt *gt)
>>
>>     xe_gt_throttle_sysfs_init(gt);
>> }
>> +
>> +u32 xe_read_perf_limit_reasons(struct xe_gt *gt)
>
>
> any function available to other compilation units should keep the prefix
>
> xe_gt_freq.c ->  xe_gt_freq_XXXXXXXX()
>
>> +{
>> +    u32 reg;
>
> this gives the impression you are getting the register offset, not its
> value.
Not my code, I just moved it from the sysfs file to the generic file. I 
was assuming that the code itself was already reviewed and perfect and 
should not be modified.

>
>
>> +
>> +    if (xe_gt_is_media_type(gt))
>> +        reg = xe_mmio_read32(gt, MTL_MEDIA_PERF_LIMIT_REASONS);
>> +    else
>> +        reg = xe_mmio_read32(gt, GT0_PERF_LIMIT_REASONS);
>> +
>> +    return reg;
>
> does it make sense to share the function to read a register, but then
> only return the raw value? What if the register change in the next
> platform or what you are reading changes?

For the sake of a debug print, I didn't feel like it is worth exporting 
accessor functions for every single field within the register. The 
fields are pretty meaningless to an end user and are only of use when 
the user logs a bug report and someone here is trying to work out what 
happened. At which point, the developer can look up the register meaning 
in the specs for the appropriate platform.

John.


>
> Lucas De Marchi
>
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_gt_freq.h 
>> b/drivers/gpu/drm/xe/xe_gt_freq.h
>> index f3fe3c90491a..89be518b4967 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_freq.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_freq.h
>> @@ -6,8 +6,12 @@
>> #ifndef _XE_GT_FREQ_H_
>> #define _XE_GT_FREQ_H_
>>
>> +#include <linux/types.h>
>> +
>> struct xe_gt;
>>
>> void xe_gt_freq_init(struct xe_gt *gt);
>>
>> +u32 xe_read_perf_limit_reasons(struct xe_gt *gt);
>> +
>> #endif
>> diff --git a/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c 
>> b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
>> index 63d640591a52..89d9f89962ad 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
>> @@ -8,6 +8,7 @@
>> #include <regs/xe_gt_regs.h>
>> #include "xe_device.h"
>> #include "xe_gt.h"
>> +#include "xe_gt_freq.h"
>> #include "xe_gt_sysfs.h"
>> #include "xe_gt_throttle_sysfs.h"
>> #include "xe_mmio.h"
>> @@ -34,77 +35,65 @@ dev_to_gt(struct device *dev)
>>     return kobj_to_gt(dev->kobj.parent);
>> }
>>
>> -static u32 read_perf_limit_reasons(struct xe_gt *gt)
>> -{
>> -    u32 reg;
>> -
>> -    if (xe_gt_is_media_type(gt))
>> -        reg = xe_mmio_read32(gt, MTL_MEDIA_PERF_LIMIT_REASONS);
>> -    else
>> -        reg = xe_mmio_read32(gt, GT0_PERF_LIMIT_REASONS);
>> -
>> -    return reg;
>> -}
>> -
>> static u32 read_status(struct xe_gt *gt)
>> {
>> -    u32 status = read_perf_limit_reasons(gt) & 
>> GT0_PERF_LIMIT_REASONS_MASK;
>> +    u32 status = xe_read_perf_limit_reasons(gt) & 
>> GT0_PERF_LIMIT_REASONS_MASK;
>>
>>     return status;
>> }
>>
>> static u32 read_reason_pl1(struct xe_gt *gt)
>> {
>> -    u32 pl1 = read_perf_limit_reasons(gt) & POWER_LIMIT_1_MASK;
>> +    u32 pl1 = xe_read_perf_limit_reasons(gt) & POWER_LIMIT_1_MASK;
>>
>>     return pl1;
>> }
>>
>> static u32 read_reason_pl2(struct xe_gt *gt)
>> {
>> -    u32 pl2 = read_perf_limit_reasons(gt) & POWER_LIMIT_2_MASK;
>> +    u32 pl2 = xe_read_perf_limit_reasons(gt) & POWER_LIMIT_2_MASK;
>>
>>     return pl2;
>> }
>>
>> static u32 read_reason_pl4(struct xe_gt *gt)
>> {
>> -    u32 pl4 = read_perf_limit_reasons(gt) & POWER_LIMIT_4_MASK;
>> +    u32 pl4 = xe_read_perf_limit_reasons(gt) & POWER_LIMIT_4_MASK;
>>
>>     return pl4;
>> }
>>
>> static u32 read_reason_thermal(struct xe_gt *gt)
>> {
>> -    u32 thermal = read_perf_limit_reasons(gt) & THERMAL_LIMIT_MASK;
>> +    u32 thermal = xe_read_perf_limit_reasons(gt) & THERMAL_LIMIT_MASK;
>>
>>     return thermal;
>> }
>>
>> static u32 read_reason_prochot(struct xe_gt *gt)
>> {
>> -    u32 prochot = read_perf_limit_reasons(gt) & PROCHOT_MASK;
>> +    u32 prochot = xe_read_perf_limit_reasons(gt) & PROCHOT_MASK;
>>
>>     return prochot;
>> }
>>
>> static u32 read_reason_ratl(struct xe_gt *gt)
>> {
>> -    u32 ratl = read_perf_limit_reasons(gt) & RATL_MASK;
>> +    u32 ratl = xe_read_perf_limit_reasons(gt) & RATL_MASK;
>>
>>     return ratl;
>> }
>>
>> static u32 read_reason_vr_thermalert(struct xe_gt *gt)
>> {
>> -    u32 thermalert = read_perf_limit_reasons(gt) & VR_THERMALERT_MASK;
>> +    u32 thermalert = xe_read_perf_limit_reasons(gt) & 
>> VR_THERMALERT_MASK;
>>
>>     return thermalert;
>> }
>>
>> static u32 read_reason_vr_tdc(struct xe_gt *gt)
>> {
>> -    u32 tdc = read_perf_limit_reasons(gt) & VR_TDC_MASK;
>> +    u32 tdc = xe_read_perf_limit_reasons(gt) & VR_TDC_MASK;
>>
>>     return tdc;
>> }
>> -- 
>> 2.43.0
>>

