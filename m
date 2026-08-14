Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D090C5CFDB
	for <intel-xe@archiver.kernel.org>; Fri, 14 Aug 2026 12:49:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E66DD10E54C;
	Fri, 14 Aug 2026 12:49:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gdZWiikk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F7D510E54C
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Aug 2026 12:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786711750; x=1818247750;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=nI/7x5lKsHFcIDIhgCb1zTLz1JZBHH2PB6zWHE0H6V4=;
 b=gdZWiikkjZvdkmZCZ/JzmUC6WGoWspMzsdZmhMoKp6AMUZvL+c2zbyCm
 3D/0KCIJMNCBiMGVRQnRYBd9gwf54a2anR63zsk99x3OL4p5UULN3Jq04
 +/gkwLAEuV5CoFGSF599MfUwGTqwedk9gkGIc7GiRjsOmq6b57Tb4nkMF
 /ST6/mMsAVSdUJ2TJnPF6HDcADC35nU5OOfZ0mkB+wRfrIShbA8M9h8oV
 PwMMschrdP8zY67h4uDe9R3HcWD6FWt/S4oAEYbU6eELqg+p/ajJcDDDY
 N9DQ4LyJwc4cAY5QJmuRfuqkMy5/egpF5SSMZQNWBzzm1XOU1PR1YGsW1 Q==;
X-CSE-ConnectionGUID: tvBPV1KNSoKvvWopv/AO2w==
X-CSE-MsgGUID: VKuSgruVRz2kLQFffICyLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="87052077"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="87052077"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 05:49:09 -0700
X-CSE-ConnectionGUID: TnhZymQwQCq0OXQu1pEgvQ==
X-CSE-MsgGUID: I6LFUF22Sqi+ABJpx/9zEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="261569662"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 05:49:09 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 14 Aug 2026 05:49:09 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 14 Aug 2026 05:49:09 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.68) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 14 Aug 2026 05:49:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rdb6TEfsptNnPFYBT7vEmihT9Xh1QSxGbbkIiZsTqNfipLExaEEHnayHURkHxhCaRmv9fHcP2wao2RKO+L6JW/aCFliHsEtVf3dScmURaPOr8/Her84D6Oa0oxI3mf1mfjWXVtXthyaY8Ltz0H02NOANJBBPuriDsQtsMbgPmeck1IBC3vdBHb1YFUTjMFMz8wGU/cnYYFmpQ/sztZ/Mk0HKABFMs6bQa2HYFZRi8qhYJD85X6JVdZf28dEyqOwoljxZ4pBwneEc4n6YrDZmo4lTsChJz2t+yz/8LgPuPncpGgwyK+7G3ueyV/smrMsPgwg0hSuoeJA92TZwY5oWyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mkhmMTCe3QptRlj7v1SG2Ptr36tLe9TQZBttJwdxHZo=;
 b=MpCtDt/tVApMCm3O646CZyY5JB8f4zoK0bsktb5RfWs0zS6yfyu5CU/5NIyCJXp7Xy8UKuw4xlqwuG0RrVB5RaNT946ol0GQ7604ExnXeJ6NS/IqJzzmu+exRJh5DjNWDk0iwZrY3TkbWNAF831+5RmnNtVdHQ1T1EVxQUES0omxUDbOCeGkhnhQeRec9aYNzYDx/7rvdXEgvVhwLcp+w3l9JTfzSpRTNFJrkZolOKlkbTx8jhyH6oieNeOUXNf0RRMGNf0cfEsWDQG4T2FMepcUP6MACZXwoIhzWocchBQyr5hyqUlpvSLphC/kT3NeInkcYHZT4cQGrrYhJd276w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5073.namprd11.prod.outlook.com (2603:10b6:303:92::23)
 by CY5PR11MB6188.namprd11.prod.outlook.com (2603:10b6:930:24::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Fri, 14 Aug
 2026 12:49:04 +0000
Received: from CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe]) by CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe%7]) with mapi id 15.21.0315.014; Fri, 14 Aug 2026
 12:49:04 +0000
Date: Fri, 14 Aug 2026 08:49:01 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>, "Aravind
 Iddamsetty" <aravind.iddamsetty@intel.com>, Mallesh Koujalagi
 <mallesh.koujalagi@intel.com>
Subject: Re: [PATCH v4 30/32] drm/xe/gt: Report 'Fault response' pagefault
 error using SIGID
Message-ID: <an8OvaqD-ctk-_Cc@intel.com>
References: <20260812191450.11690-1-michal.wajdeczko@intel.com>
 <20260812191450.11690-31-michal.wajdeczko@intel.com>
 <an4PAo7kT0tomdgh@intel.com>
 <fd80931a-b656-4220-b099-a370fe2a5313@intel.com>
 <4c041efa-449a-49f5-89d2-a2db09940cec@intel.com>
 <7a237006-bf12-4fea-8b34-921f9a00c1a6@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7a237006-bf12-4fea-8b34-921f9a00c1a6@intel.com>
X-ClientProxiedBy: SJ0PR03CA0125.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::10) To CO1PR11MB5073.namprd11.prod.outlook.com
 (2603:10b6:303:92::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5073:EE_|CY5PR11MB6188:EE_
X-MS-Office365-Filtering-Correlation-Id: a1228f53-55b3-42e9-7cd2-08defa026bf5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|56012099006|11063799006|4143699003|6133799003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: nQTh4XRzyJ6GPHjhgpQpZEPzgEhGIJ33cGUkGEfXNmEqJjarv6e3cIVHN4k15aTTenAhTcT8rEQmvbtZzuXgttojVv190xvDCh0t7/PLLNwuoAPt5R7jBQMM5tD83vZS+eC7wepBuYUG3PV9YhAe4GI3nKed57XK5NulYYDM84P3ibMQ+KZP7rQczqwtTfEwqh4lsEkJYhmePe5OOu9btFdIJSwXxk8plT5yjo3kss6smevc0Z3AJHvDs//caa+nWfaUhCLHuvlppdEZ1S8Oynfj2o9qU3UvMbgZM3xgvK7kF5hI7eyc3ckCUbmL7DBmNqFNg1lNQ7EJfl1lj1XYDIEdO0Bi2VzmuJWMyjFF2rlIZbLT+fCsRDs0bRG2mVLg4RWt6OmKcS1Wesnxen89C1z2G/YWPq6yARcOXlZt5BDCcK4sB97i16Tpun6yoo8+EwizrU6RetEWNr0nSBEQzyPvlZh5y3EAHEdwzf1+QBwbWVQGaCapTr2GiJbzmdEFQo0enifmaDRt96R33XRWkswU1apbeOPSXcvN3efGelXBxTyDQPPzcn1H4/dzHjdWFdUfzMUbgHdGuWXIQv829rUIpkqJZMHJCYL32C3KvZk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5073.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(56012099006)(11063799006)(4143699003)(6133799003)(10067099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?ZCXF7Azug/oZhQhUk8q9P8anfi+wpvEFcHB6kj/LnrnkAk9ffkPnMKxqBJ?=
 =?iso-8859-1?Q?Jr62bMvfI5wUWlfZ83ytgqNt2CouQ6q5UORJvkSfgb6sWE14oJLUQBJdSp?=
 =?iso-8859-1?Q?Ox7Kr6e5TUxEeiC1gxJkMppECfnNSn5XOEjUPU/oHD0zA5aom8dNQy7lb2?=
 =?iso-8859-1?Q?2dmwmfJ1F9/X/XHBLyYp3OzueEHygKsH8v5/eza+ivXo/rc4aMHoMfazGC?=
 =?iso-8859-1?Q?X6xIDqJMYWOwHtLl5av9LTwrJNQGF+VfEMu7ZQ3M2QylBl4TUGaShd0jQA?=
 =?iso-8859-1?Q?yJybXrC+WuntSItWgMAlZBjUGvWER6w6ZvEiWakNF1VSqpFN1SA+99TCxZ?=
 =?iso-8859-1?Q?XtVOsexUdyF1tnJBH7Ff071Y2TC2nnl58lMD5+Oc07Lx3G/zcL+4sD4DG3?=
 =?iso-8859-1?Q?AiyW2+fsMBsQG6tBG6DN8ygQFPEA2K7CkPGhZjN9ApJVIb8S28PsaJpWNd?=
 =?iso-8859-1?Q?xyQKcEP8tn68IhpfgzfBUh+UbjRg+2cv0VLwM7Tm5r1otQypZMUoDgYW1B?=
 =?iso-8859-1?Q?nml5RTIne19KorUpbyt+NzqhFzwwQKCKxGotGNW+Zq/OSRfSiDamzpTW2d?=
 =?iso-8859-1?Q?SL3Mq41zhIzuXq5hVjNIL4srlimt/50cHPa0BcX4w3D7TQVDZquAf0Ceej?=
 =?iso-8859-1?Q?E2HgukAzo/5w/pHc5Bx9Sh7t0QrN5VduWNDLeEPctZYSRYrfv2ePOwqbwr?=
 =?iso-8859-1?Q?CtdqBiA364Q8g6XGO/hO3AMyN6FrO+nRXs/zbk7AcdOHp33sOu/WiF/6Sf?=
 =?iso-8859-1?Q?06RF3wrIq0gYMwI0Iy1lQmOrYGcyrHffe0lEVdszHl6d5prV2GYPsbVpj8?=
 =?iso-8859-1?Q?/PuKD6cuVy7dfnOTyEX9sObCfLPPUsYmT0SHXBpQTWuMoK4Z8yclhfg/0X?=
 =?iso-8859-1?Q?DwaZeG5UL3BUzU5Eu9J3h7t8cUn7QLLURV5gbDczG4ehtwanpoKtlrGbk3?=
 =?iso-8859-1?Q?7C5IhJCbm/BGhcW8fHYzNWOol3MVATgMfDVN23BwdatTGgo4PeSDjiaymj?=
 =?iso-8859-1?Q?kwB2mU33vf/7h8Sz0JC5IGoD6djoR4bdOpbNqykhcuwnULF4zSYa0YK3Ge?=
 =?iso-8859-1?Q?G15rwZLSMvubU/D6xyy17c3rPYsSix0JhbDhO3qTBcnyGpERStmlz4aZvl?=
 =?iso-8859-1?Q?ALqtXjYzjHh4NGkk/cQOmpSHjI5y/BMXyFWPlkctvWXrDheEY3a1an1xiE?=
 =?iso-8859-1?Q?gFihUt9+PrEeWA0HbwfI7XoONtoR4858U9Yo6cHv6N1FD3uogUrE96ShpN?=
 =?iso-8859-1?Q?nVuOqxM5QADlsRtb1L0E4rFlB22ByjLFs9VNx4WCoKMNU2j1gY/zoiuV37?=
 =?iso-8859-1?Q?7UmAZ6Rp4hisbbb3hjanPPNJIFduEX3tuFa9fd+4SFpg0bbRpGGkHwkfLJ?=
 =?iso-8859-1?Q?nI/Pu7KHs0Rt9Vpul3jobpIHtqD2SQ7/P9ivlo9jNENnaRQQkfDangEETt?=
 =?iso-8859-1?Q?b///W7PALYElTNAC2m9c+8bD46qnsv6z67/BOy61RuRl2plNAG9YROdbUa?=
 =?iso-8859-1?Q?7OWJDc1i5N4GBINH0dWzXzclrSbS+BoVvz4ac4wrt4e7BQanfhj+R/EM9f?=
 =?iso-8859-1?Q?S74tGgbNMxbp75Ubs5mgBfRS5reQ5tJBxsbdmyuKcJKgnfHmm6+Uc40Wdt?=
 =?iso-8859-1?Q?FYZX9tTGN8phSLT4PcVxgVD3XM+C2/J6TXQhOgwtTuY18e8F57TrT96uvG?=
 =?iso-8859-1?Q?QTa+nfq1Y8fWJppsbb85P7cHkHAOEpkXxYzO1R8tJyJO0XIO/vjqkwpTvM?=
 =?iso-8859-1?Q?ZHbgbtExyYcaVm3uU2o7ttYfP2JG0bDi7bM45UWXoJDTJzoMJPvfMqGt9n?=
 =?iso-8859-1?Q?qc6hg3h/OA=3D=3D?=
X-Exchange-RoutingPolicyChecked: RjOgSY9gLUq2iaMX8sbGkEDQESM05T1E5iXN4wC0Hw0e79b436/gJGhafTbkAETCBMTxJy6c0nQp+mnj8RohzCRlwAKNw1RajWRbcjUsCQfRPKykFm7CdgYP7JiMDis9xGvfsYVfH8pn8I7L40o70HdERQo8En7ej/XBDhfOAegleg8JK1PQLPK8trBtoF+vT+wCbZp8JKV3O68lmUvfJ8ZjnfPlIjsMNf35WDQaEA/y4dBBoy37wcVxCeWLXeThS47eGg6ILfkiP/EhRjPc10FkeZRZaROfObhdqx43yfwNkOXbxkYYL+0+N2gVdgwt38Ngh7Bo0zxPqODdxqdYaQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: a1228f53-55b3-42e9-7cd2-08defa026bf5
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5073.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 12:49:04.6121 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6lr47omGYzFxCUsq6HlC7r9ry4g+iMHQMqkNz2YYtJxJ41KD6xyooioO+uooav7fVRtARaKIvpQtI3JN9zfi8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6188
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

On Fri, Aug 14, 2026 at 12:30:35PM +0200, Michal Wajdeczko wrote:
> 
> 
> On 8/14/2026 12:12 AM, Daniele Ceraolo Spurio wrote:
> > 
> > 
> > On 8/13/2026 12:46 PM, Michal Wajdeczko wrote:
> >>
> >> On 8/13/2026 8:37 PM, Rodrigo Vivi wrote:
> >>> On Wed, Aug 12, 2026 at 09:14:46PM +0200, Michal Wajdeczko wrote:
> >>>> Report 'Unsuccessful response' error using xe_log_err() helper.
> >>>>
> >>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> >>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> >>>> Cc: Matthew Brost <matthew.brost@intel.com>
> >>>> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> >>>> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> >>>> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> >>>> ---
> >>>> v2: rebased (Michal) reword message (Mallesh)
> >>>> ---
> >>>>   drivers/gpu/drm/xe/xe_pagefault.c | 4 ++--
> >>>>   1 file changed, 2 insertions(+), 2 deletions(-)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
> >>>> index 7e829c61387f..eb600c466187 100644
> >>>> --- a/drivers/gpu/drm/xe/xe_pagefault.c
> >>>> +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> >>>> @@ -14,6 +14,7 @@
> >>>>   #include "xe_gt_types.h"
> >>>>   #include "xe_gt_stats.h"
> >>>>   #include "xe_hw_engine.h"
> >>>> +#include "xe_log.h"
> >>>>   #include "xe_pagefault.h"
> >>>>   #include "xe_pagefault_types.h"
> >>>>   #include "xe_svm.h"
> >>>> @@ -625,8 +626,7 @@ static void xe_pagefault_queue_work(struct work_struct *w)
> >>>>                   xe_pagefault_save_to_vm(gt_to_xe(gt), pf);
> >>>>                   xe_pagefault_cache_start_invalidate(cache_start);
> >>>>                   xe_pagefault_print(pf);
> >>>> -                xe_gt_info(pf->gt, "Fault response: Unsuccessful %pe\n",
> >>>> -                       ERR_PTR(err));
> >>>> +                xe_log_err(pf->gt, PAGEFAULT, err, "Unsuccessful response\n");
> >>> I'm wondering if we should really go from info to err here...
> >> my question was different:
> >>     "why this err is only reported as info level?"
> >> as once we hit this condition we also print large dump
> >> (see xe_pagefault_print) likely for debug/diagnostics
> >> so it seems important
> > 
> > drive-by comment, but AFAIU this error can be intentionally triggered by UMD by simply accessing an invalid PPGTT address (see e.g. xe_exec_fault_mode@invalid-va), and we usually avoid using error-level logs for something that UMD can cause on demand.
> 
> thanks for explanation! 
> 
> so we have two choices here:
> 
> 1) drop this patch completely, or
> 2) switch to SIGID reporting with INFO severity
> 
> but currently xe_log_info() does not take an 'err' parameter
> so we will not print the actual error code as it is today
> 
> so we have two more choices:
> 
> a) update xe_log_info() macro to accept 'err', or
> b) add new xe_log_err_info() macro that takes 'err'
>    but it will still use CPER_SEV_INFO severity
> 
> I'm in favor for 2) + b)

I agree

> 
> > 
> > Daniele
> > 
> >>
> >> @Matthew, comments?
> >>
> >>> Why not staying with xe_log_info or now?
> >> I can change that for xe_log_info, but then (by design)
> >> we will not print an error
> >>
> >>> But also, why err and not ERR_PTR(err)?
> >> patch 10/32 [1] introduced helpers that take just errno
> >> value and convert that into data { ERR_PTR(err), 0 } pair
> >>
> >> [1] https://patchwork.freedesktop.org/patch/745993/?series=171022&rev=4
> >>
> >>>>               } else {
> >>>>                   xe_gt_stats_incr(pf->gt, XE_GT_STATS_ID_INVALID_PREFETCH_PAGEFAULT_COUNT, 1);
> >>>>                   xe_gt_dbg(pf->gt, "Prefetch Fault response: Unsuccessful %pe\n",
> >>>> -- 
> >>>> 2.47.1
> >>>>
> > 
> 
