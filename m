Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F565C4332F
	for <intel-xe@archiver.kernel.org>; Wed,  8 Nov 2023 22:29:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3CC110E883;
	Wed,  8 Nov 2023 22:29:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D752810E881
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Nov 2023 22:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699482595; x=1731018595;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5n/QDkvU78Y4WDZjkeBh5XwbgFm7SIyGRSzSU8UFEHg=;
 b=ZVRF/2b07FV22t9fLeufUxLmdgAKMLMOG4WiOndPqKvsgnJ6nRQTGQWL
 x4NOTp17Q9gsJ2q5qFtXWuxQF+DsYIMxyyCVEaVx7ZIQznjB+Yxb2h6TJ
 uUIz9Jr+RbJO60yaAtJqsSJAOP37IOgbLW+nVozLB7IIBjqX3aFYiOrXr
 JeomGUfc+aMN8PwvKpnCacQcHsIOddtVtzFTMp6XOJYojs52g94nV7/eW
 VfSi/TzhKrLv3IPZgFE+IufatgbNDODnvBaw6qnIrGUD65MjlMuLwmmg0
 8tJ4s34Jw9RtmOjOHSPgWxBL396HmQpWP+Dy1pWa2atRJ42Q9zW9C0bpy g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="454171840"
X-IronPort-AV: E=Sophos;i="6.03,287,1694761200"; d="scan'208";a="454171840"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2023 14:29:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="798151900"
X-IronPort-AV: E=Sophos;i="6.03,287,1694761200"; d="scan'208";a="798151900"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Nov 2023 14:29:55 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 8 Nov 2023 14:29:54 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 8 Nov 2023 14:29:54 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 8 Nov 2023 14:29:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VngzbJIfwIDvLq7o0PFRwCRVeEsEnkVFCu5WPoP6R/kXokrIC34ZqCbNMJR9PuVVDEdthEhueAdC2m9MNtSCs1GFN9gC+xm6D9/SqOb7XKRRZ031AyCKLYZrovdA1NcU0rJgef6Um8Z4QRvoTY54wgiMqTCOuB78Hfd8fEHlpDdPP4+GAqaPo41cOF+2xZ4cPPQN1dQEFuobnYVgRmXweRoSjGgdVqRxXd7z1Vp/h6vyLJ6GhMEXkrA7xWxiLErwCpqzVKRCURI8lUHn0jgSpr4ppW3PFH0tPaffUVPIMxJzl7NzTpmoR/J2Mb5jE+dweRI3iUCuPgj4j+jDECqL4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QTIIwE8lH0JU5hcTCNUo/MrMzwX8/KmgyI2/j77lviY=;
 b=jjDmcq0RAMFLv12k4axGPZm2Q6HlTZVeqinjTlVeXeBPtM/EYEO6CYdZo5RMefXxjX4ae7n/ysJZE2ORwFKhiAHXukSfo+1zVHVuDzxCaV3vN5f7hj8ayNd25bgPuTQJDk0nLpjcuNMJGkyTlakZ3WfHdE0gMl2iYOD10PDrYbakDdQlZmmLWHYB1ZhU6ZWk+YndW3/v92kD70p46C3/S+khUHIs+jgXVPMFoQpryhwS2WID4uIexWm+waxfWSOAGQ5f65u3JUhKQmp60oSit62C+AwYx6MhYvqWZXtQlMP2ugmLbPdCc4Id2eeLYLPZNEwIV5CzVAWqrSUOKJ27sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by PH0PR11MB5952.namprd11.prod.outlook.com (2603:10b6:510:147::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.18; Wed, 8 Nov
 2023 22:29:50 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::de08:93ac:5940:ec54]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::de08:93ac:5940:ec54%4]) with mapi id 15.20.6954.029; Wed, 8 Nov 2023
 22:29:50 +0000
Message-ID: <2712aade-deec-47c4-8e3c-058fe55ebe39@intel.com>
Date: Wed, 8 Nov 2023 14:29:47 -0800
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20231027222928.1981633-1-daniele.ceraolospurio@intel.com>
 <20231027222928.1981633-7-daniele.ceraolospurio@intel.com>
 <602813e9-7dc0-4cf4-bc6a-338c5ee36065@intel.com>
 <5509d09c-f404-4ced-8f0b-77f4b69eadac@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <5509d09c-f404-4ced-8f0b-77f4b69eadac@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0308.namprd03.prod.outlook.com
 (2603:10b6:303:dd::13) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|PH0PR11MB5952:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d7b0708-88e4-4632-78c2-08dbe0aa380b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Y+Vc0GtGqP3Y/GV6UC0Exu/5sVHeZDwy+jETf/pi5zcTp35+Gbd3KiGx1GZ47eFeGaVLuhiz19e3scyqJ7SZIpUXlSMyf/O2VSlt5cC1ZHD1+hswgIQXauxCmbBvjfMAmua+M5rQH7LnY6xv5TLyqvJuHlPzTlb+x9xv62N7HYvhdvsJfjvLhqj8hrrtiSbjy/hVsfLGSRgEuZuwLa2f8NZ+I+A8KUTc5r3ehKKCh5sN7gGdSQ+ELz1MpNQAmgCPc6XT9Ys5idnzejf8SYkM5+/q365T3MIN1SzxwFpAkP1Xb4RXnu/f9+UdedQXTvlt8mfe3kBp9Yvcy622BZPCVfTcMIBADMOE1euP0H5WSB1KRpdzPH8yE8Qr6ms9gkkuTLnPS8TJuXRvmk6pbBY5PvRq/M5htI1rivsaFU8QfjqVb3yjGGoHFg+dLlRUdVnx2K48+cKo8P34SALkQuTibynMhEjuNsxEv2Z9rKkHuS58/EmbsK7m7HdhG2X5HQLqmyWD25YQBjSMv7QQD4r56fwpMrQZfPS04gUrxRIxXL2i79XqXa2j39pYZv1NY08vKyWMo0lMAlFEF7sVK1xBezVNZhctA5Xhy9j4b56RIDkzWkvu5G1255PMvPNfThn6O3VkIqHjVVc/OitBjPzqs9FPSdSmQxTUhhyxOvu/MRBNzDkcWsszQZk/iI26ezGk
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(136003)(396003)(366004)(39860400002)(230273577357003)(230922051799003)(230173577357003)(451199024)(64100799003)(186009)(1800799009)(6512007)(53546011)(6666004)(38100700002)(6506007)(26005)(41300700001)(36756003)(83380400001)(107886003)(2616005)(5660300002)(66556008)(66476007)(66946007)(86362001)(316002)(82960400001)(31686004)(31696002)(8676002)(8936002)(2906002)(6486002)(4326008)(30864003)(478600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZGlTMU11cmVoU2Z4aU9OWEZYN1lGRUFWdU1ZaE1kVnhrRmJBdEZCeUxSZWtM?=
 =?utf-8?B?OUFMVDBhUCtQbjUrdE5vdytJcHNhcTVOaWNVUkpGV2dNVXhFTnZOZUNyQVZp?=
 =?utf-8?B?TlcvOUg5UzhQUmJFeU8zaVV2ZU0yRkloUHRkeE1pNUFqaGNmLzhHVWJBYlZT?=
 =?utf-8?B?WGRLNjJSTDMwNk9Ubkw1WG1ZeWlUdzhMdUIyTk1ONXlzcEhabHo5Y1EzK2tP?=
 =?utf-8?B?QlpyVGxidjZxQ3Zra2J3RDIydlM3SDQ3anU3anN2dUxYZnRDZk0rdjJQYVZp?=
 =?utf-8?B?bHdabHJpdzY5TVhtV09vZUNwRThTRmdmQUZqaWxBRUovL3VqdXRDOVhCQVhp?=
 =?utf-8?B?WjB2VllnZnhBajZvcGcycXk4Y2hYUlpwRDk2MGhyYXlNQk82ZmFPSTYzU3Bp?=
 =?utf-8?B?bllEQ0g5N0hkUjRaWUl5L1hZc0Q0OVc2MVp2dERZRERXeGhpTmcxdDNDcG9Y?=
 =?utf-8?B?OFNxTmUwMzhvOGZIVldmcElyQjVxSkZSWTVuR2hpN29ZR251aFhXZ3I4OEZx?=
 =?utf-8?B?SUVPYktLNTlKVzRDNEFXVnZlOFdmRFFpZWpMaGpONlF1QU9kK1JhNmxPOVVF?=
 =?utf-8?B?U3JmUGZ2b0Z1eWRCa3R3ZS91akQxSFNqaW5pUDJhOHZKVTFxeVRKSVNRc1B1?=
 =?utf-8?B?K1BHbzBqcW0wTEF5UnluQm1hSWFTSzFZZ1VKNDEySGRwaldHcVJxdUhHM1lR?=
 =?utf-8?B?QTNOcGQzT01TM294SVJ1N0l3dDcrNENWV1ZZNzdaRUhQWmFtL3VvRDhlSHgx?=
 =?utf-8?B?NlZreFl5WnZPSHRKcGl6eWFrQ1hOU24xSHJNOEY2TEpnbkFWK25McFV5enR0?=
 =?utf-8?B?RTJhMUdlNTZwZU9mbFZySmg1ZWJ4QzRWSnhmK2ViWTE0L3NlbnEyaTc5T3hS?=
 =?utf-8?B?dzlSZ0J5c2lHQlZ3QjU5aDNhMnNEOElERkNLTjJIbjlncDBjOElzUUZzMmkr?=
 =?utf-8?B?SGtWcTZCdjVGSVY0VUx0U2lLbFlXWFhzMjg1UjZ6WDA2WDdnRVFkR3lTWjB4?=
 =?utf-8?B?YTV3eklvc0c0K2ZEYWZTTXhXejBDSDcwbWY4SnJKcURnaFdlMUQ5aTFQQzBT?=
 =?utf-8?B?L29zZVVvK3VJQ2g1QUI0Q1pKVUhEM2xiNXliZWYzSzlDem8rclJjdFp2Vmw4?=
 =?utf-8?B?ZWp2a2ErcnJIVTA5MHVKK2UrVzJDeU4rdUExZFN3V0N6djljTXMvd1kwWVpi?=
 =?utf-8?B?Tjg4Q0JuZUhpTmJsNEp2ZXk2OXJ3K2hpeDBpZEsrYm1CWFQvN2t5OGdLdUc1?=
 =?utf-8?B?UDhqeDJybjc1WDFpS3ZaMFdELzVrd2JvTUJXMjNPQkFsNlJkeDFPZDM2MUN3?=
 =?utf-8?B?dmRWUE9TYzMxV2tyemUxdUtKZjRvNkVVUHloSHd1MVlJNzJOWnRtYzFBZnZI?=
 =?utf-8?B?TUlKZ0R4ZXJvdFl1Smp4MnpJK3NMeTVwSGRRNmVlSnlFbHR4NWNxZ1ZKTG1S?=
 =?utf-8?B?SGpVTE1pL05Gd1oxcVk0b253alh0U0N3eURJWDYycWx2cm1yVlBJQlBsdCtT?=
 =?utf-8?B?Vlp1ZG53aldaeSs4VEdaN0xjMWtDRVFZQ0JoZCtpT2RZaHZOUWJPNm84Lzdh?=
 =?utf-8?B?ZnJjOWlZY3FwSktqWkthQVE2QTNNQWM4aUU0aTFCY0RsZldXZVprRXNONzhV?=
 =?utf-8?B?YVVkMTFKT3JkV0dhZFhwdUE1T25NdThMOHgrbTFBYmlwenVGZDU4UzdESFcx?=
 =?utf-8?B?bUV6YUdJNit4MWJwVU1TN3d1ZEZORTN6Uy9scUlpejE5L0Z2RzRQazQzQnRR?=
 =?utf-8?B?UStWMVg4b3NwL2dWZ29xZWR6Q2l2SHNtSGNJWHJ2Q0UxS0FVazNxTVBFNW50?=
 =?utf-8?B?Q04ycTBqMzVhaTQ4aWJTZU5ldU5sOGVJc2hKQTNiY3FkTUkvSU14cEgvWm9a?=
 =?utf-8?B?eXNpTWQrMkpJcEtITXY4dTZRWkNXNTd3NStydWY3NmFTbmJHdE8vSEllMUhj?=
 =?utf-8?B?M1VCUGxnNG5KamlrVmdVQUJpVjU3V3lBZDk2c0drMXVIditQOEZQemNXMnZK?=
 =?utf-8?B?WGlVcFZCMSsvMjd2aWhJaVdjUXZ6WjJ2YjI1QjlzcitkcDg3QmlTK05QcEhU?=
 =?utf-8?B?Ry9XSm8zdk1sY1BuWEVPYVZOZW5DRDJBb3J1eXFlRG1DZEpmSkkzNmpNeU94?=
 =?utf-8?B?QmRtS0VMWmVvcGtPOUIvZU5UR2NVOGdHN3pmV1hGS3ZEcFRkdWpYVFViRmFn?=
 =?utf-8?B?a1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d7b0708-88e4-4632-78c2-08dbe0aa380b
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2023 22:29:50.1257 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +46Zhnz69B82k8M8Qyb5vuwm8LMsl+uRQ025p9Lt384eflpE1CR31sqPDZqVZhcTcoQeaK7zXFuLXrE5mMd+NUzTS5r4dI4hDTDTg9pVuWI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5952
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 06/12] drm/xe/gsc: GSC FW load
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

On 11/8/2023 14:23, Daniele Ceraolo Spurio wrote:
> On 11/8/2023 2:17 PM, John Harrison wrote:
>> On 10/27/2023 15:29, Daniele Ceraolo Spurio wrote:
>>> The GSC FW must be copied in a 4MB stolen memory allocation, whose GGTT
>>> address is then passed as a parameter to a dedicated load instruction
>>> submitted via the GSC engine.
>>>
>>> Since the GSC load is relatively slow (up to 250ms), we perform it
>>> asynchronously via a worker. This requires us to make sure that the
>>> worker has stopped before suspending/unloading.
>>>
>>> Note that we can't yet use xe_migrate_copy for the copy because it
>>> doesn't work with stolen memory right now, so we do a memcpy from the
>>> CPU side instead.
>>>
>>> Bspec: 65306, 65346
>>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
>>> Cc: John Harrison <John.C.Harrison@Intel.com>
>>> ---
>>>   .../gpu/drm/xe/instructions/xe_gsc_commands.h |  34 +++
>>>   .../gpu/drm/xe/instructions/xe_instr_defs.h   |   1 +
>>>   drivers/gpu/drm/xe/regs/xe_gsc_regs.h         |  29 +++
>>>   drivers/gpu/drm/xe/xe_gsc.c                   | 240 
>>> ++++++++++++++++++
>>>   drivers/gpu/drm/xe/xe_gsc.h                   |   3 +
>>>   drivers/gpu/drm/xe/xe_gsc_types.h             |  17 ++
>>>   drivers/gpu/drm/xe/xe_uc.c                    |  12 +-
>>>   7 files changed, 335 insertions(+), 1 deletion(-)
>>>   create mode 100644 drivers/gpu/drm/xe/instructions/xe_gsc_commands.h
>>>   create mode 100644 drivers/gpu/drm/xe/regs/xe_gsc_regs.h
>>>
>>> diff --git a/drivers/gpu/drm/xe/instructions/xe_gsc_commands.h 
>>> b/drivers/gpu/drm/xe/instructions/xe_gsc_commands.h
>>> new file mode 100644
>>> index 000000000000..c7a833d7f965
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/xe/instructions/xe_gsc_commands.h
>>> @@ -0,0 +1,34 @@
>>> +/* SPDX-License-Identifier: MIT */
>>> +/*
>>> + * Copyright © 2023 Intel Corporation
>>> + */
>>> +
>>> +#ifndef _XE_GSC_COMMANDS_H_
>>> +#define _XE_GSC_COMMANDS_H_
>>> +
>>> +#include "instructions/xe_instr_defs.h"
>>> +
>>> +/*
>>> + * All GSCCS-specific commands have fixed length, so we can include 
>>> it in the
>>> + * defines. Note that the generic GSC command header structure 
>>> includes an
>>> + * optional data field in bits 9-21, but there are no commands that 
>>> actually use
>>> + * it; some of the commands are instead defined as having an 
>>> extended length
>>> + * field spanning bits 0-15, even if the extra bits are not 
>>> required because the
>>> + * longest GSCCS command is only 8 dwords. To handle this, the 
>>> defines below use
>>> + * a single field for both data and len. If we ever get a commands 
>>> that does
>>> + * actually have data and this approach doesn't work for it we can 
>>> re-work it
>>> + * at that point.
>>> + */
>>> +
>>> +#define GSC_OPCODE        REG_GENMASK(28, 22)
>>> +#define GSC_CMD_DATA_AND_LEN    REG_GENMASK(21, 0)
>>> +
>>> +#define __GSC_INSTR(op, dl) \
>>> +    (XE_INSTR_GSC | \
>>> +    REG_FIELD_PREP(GSC_OPCODE, op) | \
>>> +    REG_FIELD_PREP(GSC_CMD_DATA_AND_LEN, dl))
>>> +
>>> +#define GSC_FW_LOAD __GSC_INSTR(1, 2)
>>> +#define   GSC_FW_LOAD_LIMIT_VALID REG_BIT(31)
>>> +
>>> +#endif
>>> diff --git a/drivers/gpu/drm/xe/instructions/xe_instr_defs.h 
>>> b/drivers/gpu/drm/xe/instructions/xe_instr_defs.h
>>> index e403b4fcc20a..04179b2a48e1 100644
>>> --- a/drivers/gpu/drm/xe/instructions/xe_instr_defs.h
>>> +++ b/drivers/gpu/drm/xe/instructions/xe_instr_defs.h
>>> @@ -15,6 +15,7 @@
>>>    */
>>>   #define XE_INSTR_CMD_TYPE        GENMASK(31, 29)
>>>   #define   XE_INSTR_MI REG_FIELD_PREP(XE_INSTR_CMD_TYPE, 0x0)
>>> +#define   XE_INSTR_GSC REG_FIELD_PREP(XE_INSTR_CMD_TYPE, 0x2)
>>>   #define   XE_INSTR_GFXPIPE REG_FIELD_PREP(XE_INSTR_CMD_TYPE, 0x3)
>>>     /*
>>> diff --git a/drivers/gpu/drm/xe/regs/xe_gsc_regs.h 
>>> b/drivers/gpu/drm/xe/regs/xe_gsc_regs.h
>>> new file mode 100644
>>> index 000000000000..22d2ad9cb64d
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/xe/regs/xe_gsc_regs.h
>>> @@ -0,0 +1,29 @@
>>> +/* SPDX-License-Identifier: MIT */
>>> +/*
>>> + * Copyright © 2023 Intel Corporation
>>> + */
>>> +
>>> +#ifndef _XE_GSC_REGS_H_
>>> +#define _XE_GSC_REGS_H_
>>> +
>>> +#include <linux/compiler.h>
>>> +#include <linux/types.h>
>>> +
>>> +#include "regs/xe_reg_defs.h"
>>> +
>>> +/* Definitions of GSC H/W registers, bits, etc */
>>> +
>>> +#define MTL_GSC_HECI1_BASE    0x00116000
>>> +#define MTL_GSC_HECI2_BASE    0x00117000
>>> +
>>> +/*
>>> + * The FWSTS register values are FW defined and can be different 
>>> between
>>> + * HECI1 and HECI2
>>> + */
>>> +#define HECI_FWSTS1(base)                XE_REG((base) + 0xc40)
>>> +#define   HECI1_FWSTS1_CURRENT_STATE REG_GENMASK(3, 0)
>>> +#define   HECI1_FWSTS1_CURRENT_STATE_RESET        0
>>> +#define   HECI1_FWSTS1_PROXY_STATE_NORMAL        5
>>> +#define   HECI1_FWSTS1_INIT_COMPLETE            REG_BIT(9)
>>> +
>>> +#endif
>>> diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
>>> index 3f709577d73b..7e5ba9039163 100644
>>> --- a/drivers/gpu/drm/xe/xe_gsc.c
>>> +++ b/drivers/gpu/drm/xe/xe_gsc.c
>>> @@ -5,10 +5,20 @@
>>>     #include "xe_gsc.h"
>>>   +#include <drm/drm_managed.h>
>>> +
>>> +#include "xe_bb.h"
>>> +#include "xe_bo.h"
>>>   #include "xe_device.h"
>>> +#include "xe_exec_queue.h"
>>>   #include "xe_gt.h"
>>>   #include "xe_gt_printk.h"
>>> +#include "xe_map.h"
>>> +#include "xe_mmio.h"
>>> +#include "xe_sched_job.h"
>>>   #include "xe_uc_fw.h"
>>> +#include "instructions/xe_gsc_commands.h"
>>> +#include "regs/xe_gsc_regs.h"
>>>     static struct xe_gt *
>>>   gsc_to_gt(struct xe_gsc *gsc)
>>> @@ -16,6 +26,134 @@ gsc_to_gt(struct xe_gsc *gsc)
>>>       return container_of(gsc, struct xe_gt, uc.gsc);
>>>   }
>>>   +static int memcpy_fw(struct xe_gsc *gsc)
>>> +{
>>> +    struct xe_gt *gt = gsc_to_gt(gsc);
>>> +    struct xe_device *xe = gt_to_xe(gt);
>>> +    u32 fw_size = gsc->fw.size;
>>> +    void *storage;
>>> +
>>> +    /*
>>> +     * FIXME: xe_migrate_copy does not work with stolen mem yet, so 
>>> we use
>>> +     * a memcpy for now.
>>> +     */
>>> +    storage = kmalloc(fw_size, GFP_KERNEL);
>>> +    if (!storage)
>>> +        return -ENOMEM;
>>> +
>>> +    xe_map_memcpy_from(xe, storage, &gsc->fw.bo->vmap, 0, fw_size);
>>> +    xe_map_memcpy_to(xe, &gsc->private->vmap, 0, storage, fw_size);
>>> +    xe_map_memset(xe, &gsc->private->vmap, fw_size, 0, 
>>> gsc->private->size - fw_size);
>>> +
>>> +    kfree(storage);
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static int emit_gsc_upload(struct xe_gsc *gsc)
>>> +{
>>> +    struct xe_gt *gt = gsc_to_gt(gsc);
>>> +    u32 offset = xe_bo_ggtt_addr(gsc->private);
>>> +    struct xe_bb *bb;
>>> +    struct xe_sched_job *job;
>>> +    struct dma_fence *fence;
>>> +    long timeout;
>>> +
>>> +    bb = xe_bb_new(gt, 4, false);
>>> +    if (IS_ERR(bb))
>>> +        return PTR_ERR(bb);
>>> +
>>> +    bb->cs[bb->len++] = GSC_FW_LOAD;
>>> +    bb->cs[bb->len++] = lower_32_bits(offset);
>>> +    bb->cs[bb->len++] = upper_32_bits(offset);
>>> +    bb->cs[bb->len++] = (gsc->private->size / SZ_4K) | 
>>> GSC_FW_LOAD_LIMIT_VALID;
>>> +
>>> +    job = xe_bb_create_job(gsc->q, bb);
>>> +    if (IS_ERR(job)) {
>>> +        xe_bb_free(bb, NULL);
>>> +        return PTR_ERR(job);
>>> +    }
>>> +
>>> +    xe_sched_job_arm(job);
>>> +    fence = dma_fence_get(&job->drm.s_fence->finished);
>>> +    xe_sched_job_push(job);
>>> +
>>> +    timeout = dma_fence_wait_timeout(fence, false, HZ);
>>> +    dma_fence_put(fence);
>>> +    xe_bb_free(bb, NULL);
>>> +    if (timeout < 0)
>>> +        return timeout;
>>> +    else if (!timeout)
>>> +        return -ETIME;
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static int gsc_fw_is_loaded(struct xe_gt *gt)
>>> +{
>>> +    return xe_mmio_read32(gt, HECI_FWSTS1(MTL_GSC_HECI1_BASE)) &
>>> +                  HECI1_FWSTS1_INIT_COMPLETE;
>>> +}
>>> +
>>> +static int gsc_fw_wait(struct xe_gt *gt)
>>> +{
>>> +    return xe_mmio_wait32(gt, HECI_FWSTS1(MTL_GSC_HECI1_BASE),
>>> +                  HECI1_FWSTS1_INIT_COMPLETE,
>>> +                  HECI1_FWSTS1_INIT_COMPLETE,
>>> +                  500, NULL, false);
>> The 500 at least needs a comment to explain where it comes from and 
>> why. If not a #define as well.
>>
>> I assume this is the <=250ms in the commit description?
>>
>
> yup,  I just doubled the 250 to 500 to give it a bit of wiggle room. 
> I'll add a comment.
>
>>> +}
>>> +
>>> +static int gsc_upload(struct xe_gsc *gsc)
>>> +{
>>> +    struct xe_gt *gt = gsc_to_gt(gsc);
>>> +    int err;
>>> +
>>> +    if (XE_WARN_ON(!xe_uc_fw_is_loadable(&gsc->fw) || !gsc->q || 
>>> gsc_fw_is_loaded(gt)))
>> The last term here is a register read of a firmware written value? 
>> The kernel should not barf with WARNs and such due to external data. 
>> Those are for internal bugs only. Dodgy external data should just be 
>> an xe_gt_err, shouldn't it?
>
> The idea was that we shouldn't be here if the GSC HW reports that 
> we've already loaded, we should have bailed early (in 
> xe_gsc_load_start), so somewhere in the stack we have a programming bug.
Right but once you include external inputs, that programming bug might 
not be in the KMD. The KMD is perfect and never goes wrong, but we don't 
trust those pesky hardware designers ;).

If nothing else, you could get a PCIe drop-out between the previous 
check and this one. So all the software state is perfect but the 
hardware is toast. That should not be a WARN, it should be a xe_gt_err.

John.

>
>>
>>> +        return 0;
>> And returning zero means the state will transition to TRANSFERRED not 
>> LOAD_FAIL. That seems plausible in the case of already loaded, but in 
>> the other cases that seems wrong?
>
> You're right, will fix.
>
> Daniele
>
>>
>> John.
>>
>>> +
>>> +    err = memcpy_fw(gsc);
>>> +    if (err) {
>>> +        xe_gt_err(gt, "Failed to memcpy GSC FW\n");
>>> +        return err;
>>> +    }
>>> +
>>> +    err = emit_gsc_upload(gsc);
>>> +    if (err) {
>>> +        xe_gt_err(gt, "Failed to emit GSC FW upload (%pe)\n", 
>>> ERR_PTR(err));
>>> +        return err;
>>> +    }
>>> +
>>> +    err = gsc_fw_wait(gt);
>>> +    if (err) {
>>> +        xe_gt_err(gt, "Failed to wait for GSC load (%pe)\n", 
>>> ERR_PTR(err));
>>> +        return err;
>>> +    }
>>> +
>>> +    xe_gt_dbg(gt, "GSC FW async load completed\n");
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static void gsc_work(struct work_struct *work)
>>> +{
>>> +    struct xe_gsc *gsc = container_of(work, typeof(*gsc), work);
>>> +    struct xe_gt *gt = gsc_to_gt(gsc);
>>> +    struct xe_device *xe = gt_to_xe(gt);
>>> +    int ret;
>>> +
>>> +    xe_device_mem_access_get(xe);
>>> +    xe_force_wake_get(gt_to_fw(gt), XE_FW_GSC);
>>> +
>>> +    ret = gsc_upload(gsc);
>>> +    if (ret)
>>> +        xe_uc_fw_change_status(&gsc->fw, XE_UC_FIRMWARE_LOAD_FAIL);
>>> +    else
>>> +        xe_uc_fw_change_status(&gsc->fw, XE_UC_FIRMWARE_TRANSFERRED);
>>> +
>>> +    xe_force_wake_put(gt_to_fw(gt), XE_FW_GSC);
>>> +    xe_device_mem_access_put(xe);
>>> +}
>>> +
>>>   int xe_gsc_init(struct xe_gsc *gsc)
>>>   {
>>>       struct xe_gt *gt = gsc_to_gt(gsc);
>>> @@ -23,6 +161,7 @@ int xe_gsc_init(struct xe_gsc *gsc)
>>>       int ret;
>>>         gsc->fw.type = XE_UC_FW_TYPE_GSC;
>>> +    INIT_WORK(&gsc->work, gsc_work);
>>>         /* The GSC uC is only available on the media GT */
>>>       if (tile->media_gt && (gt != tile->media_gt)) {
>>> @@ -48,3 +187,104 @@ int xe_gsc_init(struct xe_gsc *gsc)
>>>       return ret;
>>>   }
>>>   +static void free_resources(struct drm_device *drm, void *arg)
>>> +{
>>> +    struct xe_gsc *gsc = arg;
>>> +
>>> +    if (gsc->wq) {
>>> +        destroy_workqueue(gsc->wq);
>>> +        gsc->wq = NULL;
>>> +    }
>>> +
>>> +    if (gsc->q) {
>>> +        xe_exec_queue_put(gsc->q);
>>> +        gsc->q = NULL;
>>> +    }
>>> +
>>> +    if (gsc->private) {
>>> +        xe_bo_unpin_map_no_vm(gsc->private);
>>> +        gsc->private = NULL;
>>> +    }
>>> +}
>>> +
>>> +int xe_gsc_init_post_hwconfig(struct xe_gsc *gsc)
>>> +{
>>> +    struct xe_gt *gt = gsc_to_gt(gsc);
>>> +    struct xe_tile *tile = gt_to_tile(gt);
>>> +    struct xe_device *xe = gt_to_xe(gt);
>>> +    struct xe_hw_engine *hwe = xe_gt_hw_engine(gt, 
>>> XE_ENGINE_CLASS_OTHER, 0, true);
>>> +    struct xe_exec_queue *q;
>>> +    struct workqueue_struct *wq;
>>> +    struct xe_bo *bo;
>>> +    int err;
>>> +
>>> +    if (!xe_uc_fw_is_available(&gsc->fw))
>>> +        return 0;
>>> +
>>> +    if (!hwe)
>>> +        return -ENODEV;
>>> +
>>> +    bo = xe_bo_create_pin_map(xe, tile, NULL, SZ_4M,
>>> +                  ttm_bo_type_kernel,
>>> +                  XE_BO_CREATE_STOLEN_BIT |
>>> +                  XE_BO_CREATE_GGTT_BIT);
>>> +    if (IS_ERR(bo))
>>> +        return PTR_ERR(bo);
>>> +
>>> +    q = xe_exec_queue_create(xe, NULL,
>>> +                 BIT(hwe->logical_instance), 1, hwe,
>>> +                 EXEC_QUEUE_FLAG_KERNEL |
>>> +                 EXEC_QUEUE_FLAG_PERMANENT);
>>> +    if (IS_ERR(q)) {
>>> +        xe_gt_err(gt, "Failed to create queue for GSC submission\n");
>>> +        err = PTR_ERR(q);
>>> +        goto out_bo;
>>> +    }
>>> +
>>> +    wq = alloc_ordered_workqueue("gsc-ordered-wq", 0);
>>> +    if (!wq) {
>>> +        err = -ENOMEM;
>>> +        goto out_q;
>>> +    }
>>> +
>>> +    gsc->private = bo;
>>> +    gsc->q = q;
>>> +    gsc->wq = wq;
>>> +
>>> +    err = drmm_add_action_or_reset(&xe->drm, free_resources, gsc);
>>> +    if (err)
>>> +        return err;
>>> +
>>> +    xe_uc_fw_change_status(&gsc->fw, XE_UC_FIRMWARE_LOADABLE);
>>> +
>>> +    return 0;
>>> +
>>> +out_q:
>>> +    xe_exec_queue_put(q);
>>> +out_bo:
>>> +    xe_bo_unpin_map_no_vm(bo);
>>> +    return err;
>>> +
>>> +}
>>> +
>>> +void xe_gsc_load_start(struct xe_gsc *gsc)
>>> +{
>>> +    struct xe_gt *gt = gsc_to_gt(gsc);
>>> +
>>> +    if (!xe_uc_fw_is_loadable(&gsc->fw) || !gsc->q)
>>> +        return;
>>> +
>>> +    /* GSC FW survives GT reset and D3Hot */
>>> +    if (gsc_fw_is_loaded(gt)) {
>>> +        xe_uc_fw_change_status(&gsc->fw, XE_UC_FIRMWARE_TRANSFERRED);
>>> +        return;
>>> +    }
>>> +
>>> +    queue_work(gsc->wq, &gsc->work);
>>> +}
>>> +
>>> +void xe_gsc_wait_for_worker_completion(struct xe_gsc *gsc)
>>> +{
>>> +    if (xe_uc_fw_is_loadable(&gsc->fw) && gsc->wq)
>>> +        flush_work(&gsc->work);
>>> +}
>>> diff --git a/drivers/gpu/drm/xe/xe_gsc.h b/drivers/gpu/drm/xe/xe_gsc.h
>>> index baa7f21f4204..f870eddc77d4 100644
>>> --- a/drivers/gpu/drm/xe/xe_gsc.h
>>> +++ b/drivers/gpu/drm/xe/xe_gsc.h
>>> @@ -9,5 +9,8 @@
>>>   #include "xe_gsc_types.h"
>>>     int xe_gsc_init(struct xe_gsc *gsc);
>>> +int xe_gsc_init_post_hwconfig(struct xe_gsc *gsc);
>>> +void xe_gsc_wait_for_worker_completion(struct xe_gsc *gsc);
>>> +void xe_gsc_load_start(struct xe_gsc *gsc);
>>>     #endif
>>> diff --git a/drivers/gpu/drm/xe/xe_gsc_types.h 
>>> b/drivers/gpu/drm/xe/xe_gsc_types.h
>>> index 1bc50583fe58..57fefd66a7ea 100644
>>> --- a/drivers/gpu/drm/xe/xe_gsc_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_gsc_types.h
>>> @@ -6,8 +6,13 @@
>>>   #ifndef _XE_GSC_TYPES_H_
>>>   #define _XE_GSC_TYPES_H_
>>>   +#include <linux/workqueue.h>
>>> +
>>>   #include "xe_uc_fw_types.h"
>>>   +struct xe_bo;
>>> +struct xe_exec_queue;
>>> +
>>>   /**
>>>    * struct xe_gsc - GSC
>>>    */
>>> @@ -17,6 +22,18 @@ struct xe_gsc {
>>>         /** @security_version: SVN found in the fetched blob */
>>>       u32 security_version;
>>> +
>>> +    /** @private: Private data for use by the GSC FW */
>>> +    struct xe_bo *private;
>>> +
>>> +    /** @q: Default queue used for submissions to GSC FW */
>>> +    struct xe_exec_queue *q;
>>> +
>>> +    /** @wq: workqueue to handle jobs for delayed load and proxy 
>>> handling */
>>> +    struct workqueue_struct *wq;
>>> +
>>> +    /** @work: delayed load and proxy handling work */
>>> +    struct work_struct work;
>>>   };
>>>     #endif
>>> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
>>> index b67154c78dff..15dcd1f91e9c 100644
>>> --- a/drivers/gpu/drm/xe/xe_uc.c
>>> +++ b/drivers/gpu/drm/xe/xe_uc.c
>>> @@ -74,11 +74,17 @@ int xe_uc_init(struct xe_uc *uc)
>>>    */
>>>   int xe_uc_init_post_hwconfig(struct xe_uc *uc)
>>>   {
>>> +    int err;
>>> +
>>>       /* GuC submission not enabled, nothing to do */
>>>       if (!xe_device_uc_enabled(uc_to_xe(uc)))
>>>           return 0;
>>>   -    return xe_guc_init_post_hwconfig(&uc->guc);
>>> +    err = xe_guc_init_post_hwconfig(&uc->guc);
>>> +    if (err)
>>> +        return err;
>>> +
>>> +    return xe_gsc_init_post_hwconfig(&uc->gsc);
>>>   }
>>>     static int uc_reset(struct xe_uc *uc)
>>> @@ -173,6 +179,9 @@ int xe_uc_init_hw(struct xe_uc *uc)
>>>       ret = xe_huc_auth(&uc->huc);
>>>       xe_gt_assert(uc_to_gt(uc), !ret);
>>>   +    /* GSC load is async */
>>> +    xe_gsc_load_start(&uc->gsc);
>>> +
>>>       return 0;
>>>   }
>>>   @@ -197,6 +206,7 @@ void xe_uc_gucrc_disable(struct xe_uc *uc)
>>>     void xe_uc_stop_prepare(struct xe_uc *uc)
>>>   {
>>> +    xe_gsc_wait_for_worker_completion(&uc->gsc);
>>>       xe_guc_stop_prepare(&uc->guc);
>>>   }
>>
>

