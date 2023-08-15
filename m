Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A6CDC001B0
	for <intel-xe@archiver.kernel.org>; Tue, 15 Aug 2023 18:33:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42CE010E199;
	Tue, 15 Aug 2023 18:33:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B170710E199
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Aug 2023 18:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692124403; x=1723660403;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=FM6+YLn+VQROlfhiHNKbg3se1FMjhxine4GT52ASczc=;
 b=BFs+7YuN3bCY50Tx+XFC7JLDUZmYMSzLvL0RYHianOKgx+8YduG7wSjX
 JQoqmU7kQaImHHNzDztMUuta6tvcYBNwfIqGk3I9ov4dLai7T67iU8T+r
 wZv3BvqgebAu5t1MhSFhDyXEgYwZWZldEBzLu5Rv2Zq00PE1KBNGjy4Ce
 Krld+HV31VsJ9UkvMMDE6sylPRZ8j6UFjEP7TVDNxOI36LBSL6jSJFoML
 1BUo5j7TtByfCWCYcEX/4je62kObSvSeGgOToXsxYyYjhl7AucrBN542E
 ReKOIcFqO95MJuDRzuWww8UkQg9wbi/sqKs235TB9lneEH6W1z3oEJMYO A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="438693097"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; d="scan'208";a="438693097"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2023 11:33:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="763354801"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; d="scan'208";a="763354801"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga008.jf.intel.com with ESMTP; 15 Aug 2023 11:33:00 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 15 Aug 2023 11:33:00 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 15 Aug 2023 11:32:59 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 15 Aug 2023 11:32:59 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 15 Aug 2023 11:32:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ENAGyJM6kLvYUa45FrQm4JH+cWLJ2u/gy1dp7+9ppY7lQfF74ePbLYb4QwZJXZtWxmCr8fwSiTd7gKvQ2oy9ZU77BghmucG3B6PhV+l5PuAZBl02VmkfTB9MHmcJwUiq5QAi/ar80ypgL9f4mQG3ofzeNr/L/AABZnh/FdYW0iSAnNKj2KxRuLIQVGG5gCcbrNEAkND+Yf+ZU4k2R7BAQmJ35kB8+UYkj6uiQuSK3goKMpw4+6KG0tifcKzAN9gkIMJFI77ccb8m01eBuQrSMbYskLY0O5yfsqM9Fpu+7Z7yHoTx6LVbVtvLKJMFF1FF7d+q8uBxfvwreD3Ys7pkig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RwRnih17nZZ8ZaMtQwocq5Mbh+C0Jn1DR3kYmr2X500=;
 b=ilFdD/pipoZd4JBWjfHpNPCHhL7eF0o2IC0bw10WkCQcnH1cF7LMzONG0QGfME+zPEGo+yk03npfmsOFf/BATe2ntIU+Tjq50/bXPinmLpYXEe/0t73g9U4PUbN1RkdxRe+i4+cHFnuUn31M+zsbz+qhOFApvwOHyci8jpYRTMjLJZh+ErilzzVJb6mp4nq26eIZ23UiKZ5hFGBlWBE4Rab52KOK47BmufCYjRU7qsF4WY80CTvU98Uacrf1mK7AaUOru8HXrgPkd2+XBw2zWOpXfhhOBT54E28GkXxVJxyCGX0g9Z4xRI15zq8HaeLWVDvtPtzlcLzCxOBZL4eGoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2987.namprd11.prod.outlook.com (2603:10b6:5:65::14) by
 MW4PR11MB5797.namprd11.prod.outlook.com (2603:10b6:303:184::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Tue, 15 Aug
 2023 18:32:57 +0000
Received: from DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::5f98:c6b:6aa8:4a8d]) by DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::5f98:c6b:6aa8:4a8d%2]) with mapi id 15.20.6678.025; Tue, 15 Aug 2023
 18:32:57 +0000
Date: Tue, 15 Aug 2023 11:32:54 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Message-ID: <ZNvE1oHPedth0zFF@orsosgc001.jf.intel.com>
References: <20230814223734.375449-1-umesh.nerlige.ramappa@intel.com>
 <20230814223734.375449-5-umesh.nerlige.ramappa@intel.com>
 <ZNuqpIgzYu5BmJtD@nvishwa1-DESK>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZNuqpIgzYu5BmJtD@nvishwa1-DESK>
X-ClientProxiedBy: BYAPR03CA0012.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::25) To DM6PR11MB2987.namprd11.prod.outlook.com
 (2603:10b6:5:65::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2987:EE_|MW4PR11MB5797:EE_
X-MS-Office365-Filtering-Correlation-Id: 00822249-5ccc-467d-3f2c-08db9dbe0be5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J1CpEWyAGXxczHFH/T7geoGXXonSnXsIp/NuskCrf5BKjNb5VPp6iYY11IZbnFHxXK4DuxK/xoLi4MzNqgCqDSdECBghXoPIs61Vpad6kB/zIeNgT8tOTEio8G8gZkd06LEIn16sdogs0cQkjm0oxxbuuy6aYLu/OJl8Q7ScDjvyl/tQlE73aDjfZfhgcHEKOUQkrPrleizR4KEWGc/Mf2tbEgR0kCeZFTAXmzZANQ/2mPz0R7HUOwmKb5ZewCRlOEhH5+dLAk3R4gx0dClFg/GSEXbyVY1QVPwADr3f6ofGXDNd1SyTNsqhl3NO6gaDVXdeOcsGav5vhL5Y9v02eWgtMQ3b2HZWGbDvuVIhT50yEWxj8QXvvWkoN59B6ISd9MlpiRIS1BxHg8e1w6Bz5wwesGxYXDkCDXujexWWBDHZYXbXpefsFnvI7CoaypNUO02f/6CpPlQxWunBi3aGDhtiv8oB04wu1NdYaBLKKOstaRhed6AAKOI6ssGKWZpDRJHzMSEF7KljpdXsxV7h284D7dBTvE6bJIHwGZRBSi4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2987.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(39860400002)(346002)(136003)(366004)(451199024)(1800799009)(186009)(2906002)(5660300002)(6862004)(8936002)(38100700002)(41300700001)(6506007)(66946007)(30864003)(26005)(8676002)(4326008)(316002)(6666004)(6636002)(966005)(82960400001)(478600001)(6486002)(83380400001)(86362001)(66556008)(66476007)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V09PQzhEQmpkUXNTT1VlYjJSdFVRbURFMjRKbmRCYjZHZXJkY1o5RGZEMWIr?=
 =?utf-8?B?ZzhxU1lTdjVzNlFwc0hVT1lRVHVhdkNkclhtV2hZY2VZeHJOV2xYMFUxbnJK?=
 =?utf-8?B?L3Z5cURNVFNLdHcwNW1Ea2JMUVN1MVl4NVhaSm84TmVwR2RHdHEzUENJZS9o?=
 =?utf-8?B?R254blhxOVBOcTF4ak1MdUZIV2dnN0hxZHdzdnRCcWZjWDZIQlF2NVdhNjEy?=
 =?utf-8?B?YXkzVnRhWGMreG5tOVl1VXRWbFZEVit3TzNERG80OUNlT3RhNG9pT3dLZCtP?=
 =?utf-8?B?YiticnNDcUNIUHdLU0dURjhSTWR1M2k4WlFUbXJhTFdhS0RWSDNOVUVlMmNl?=
 =?utf-8?B?aXlrL2dUZzNmaVk5TGxZTVVpNEg4dm9KUVAvUC9rY2MvTHV3NUtYM0hoZ0VL?=
 =?utf-8?B?UG9abll4ZG04YmY5SXBaQ1FrOGtnc292QVFvUk5Mcm1mU1Jtb2g5Syt5OTNP?=
 =?utf-8?B?akZpTlQyNzlucTdQRk16cmdCcHJMU1p6c0VpTU9CVXZ0blg1UW5IdkZmVDl3?=
 =?utf-8?B?UXlxeEdLR1lHSUZGWGIvT01VTG9BQ3QxVlh4ajJsZGFEQUdVTU9hR0l1TmJU?=
 =?utf-8?B?NGNjZ1F1d1ZwVTBUWUw3enRtNGVDUmtQK2YyTnZzS0VBcmZ0eklBWXgwakV4?=
 =?utf-8?B?dE5NbHJOMVBDWGJuUUZNOEJSWlo4Z2ViYXlHLzU5UzJ6RVlnYWhvUXcrR1VT?=
 =?utf-8?B?Qk9kWWtRTWtCQkp6d0FKbXJ1WEF1eVlUUldBR0dQbGRWTm1wN0ZGZy9BQjVi?=
 =?utf-8?B?Vmp2NGlnYW8rMWV5ckxNQWRycGVQOENudWZyb0RhYmF5M2NTK21RUW5Rb0k3?=
 =?utf-8?B?Nk16VnJGWHdtclh2TERpcGN5V0xzNGZ1MktOMHZPN1MxdWF3VHByNDB2RjVF?=
 =?utf-8?B?STV5eEZsQnNnUkl4NlEvYTFZTDlaY2diMVp4VEREVUxqZEpXckY4aHVSblJq?=
 =?utf-8?B?a1kwdFNXRlNYMmpmMXp0NTBIWktKY05mYUV3cHY5bTlMSzlIMFdDSDRLZEU2?=
 =?utf-8?B?Y3lIUVFEU1V5bnNSMmZPK0lhSmViaVdsOUtISFE5RXJrODlzWStJVlpBZnZR?=
 =?utf-8?B?K0htTEJFS2ZYK2hmMjUveHp4enh0L1Z4dE53NEVBTW1jc0pJYTRzbzhQN2dS?=
 =?utf-8?B?WEUxTTM4Vlo0QlNOZHNzbzB5THBFQXZaRkk5VzR6aEVhWGdPWmtJSUFrSzlG?=
 =?utf-8?B?eld3U2NOcnNjcFFrZVIraWUzVHg4ZEIwbWZUQURvSXNWT3B1am1EbkpkM2lY?=
 =?utf-8?B?L2gwaUcydmttbFgxRW9xYzV1ci9OWEhGdC91amVYVDV2TkhQTXhGN1NLL2JQ?=
 =?utf-8?B?VG51b0hxWVFhMC9nN0E0bnJhTHdXTlRTU24xVWZCZWV6OWc4V3QvMlFEUGJ1?=
 =?utf-8?B?ckFwTzUzVVI5cURBZDlDcmRzOGVYaDBNYVE1Q3k3R1JSRGdoSUN4SGhoNTFD?=
 =?utf-8?B?TEJEaWt2T0kvWTV0cEk2WXY4LzIvL2dYT0Y3RytVZGx4cEdHajU5cFNDTyth?=
 =?utf-8?B?NjM3K0oxNjBWb0FUMlhnSjBsQVU1cUswYmQzMkJ0N3NJRVk5MzZBTUJXTnFv?=
 =?utf-8?B?ZkJBRk9xWWxReHEvSTVVRTB4dS9GL0N2bmdiOHMzU25ieFJLc2VtZWVhK2FU?=
 =?utf-8?B?b3hjSXVmdlgyYjcrY0NMRVJxQUY0VGEwRU1lcjY3a3hWR3cwK2FZeVovQm45?=
 =?utf-8?B?dTYvekluUk1Pc1Y4bzU2UlhhZHVER0lKMENHSVJVaXppMFBhYVV1MkZSdGpV?=
 =?utf-8?B?Z2hNYWExZGtzVngra0llYlpkdEtEWmpXMTVEc0IzRFlQcEZLUTlBZnkxMUdi?=
 =?utf-8?B?MHNCeHZiaVJ6QjZxZ2lkT0JXaUdKQ2NITnVWRTBTcTNMSFZVT0x3Snh5R2gx?=
 =?utf-8?B?dlFsMFpzcEtDSksyTUR6TGZBUTBlTG4rNDRkN0o0Rmk0UW8zOTl3RUVTL0M0?=
 =?utf-8?B?WmpmNUVsdUFubkVLQ0tQc0ZkSGo4NjB5ZW9wWVNyYm9kTXp4bHNiZDZOYnV6?=
 =?utf-8?B?NzM0d0FESENtcDVKdHJmeFZTbkpaZURTcG04ZzVOUkhFbWlRcSt1Ynl0cC9H?=
 =?utf-8?B?MlYxRG1iUTl0NVRmSkt1Z3FVTS9ObDZpVHBIMWUvdy8xWUtuVHc4Y0JrWU5H?=
 =?utf-8?B?ZDJ0MVFnSlBUb0pSNXhoZHluamt6akdseE5xQmZHa2NMUWFXdDgwaXFaeWM1?=
 =?utf-8?Q?OQqD2JrR+LnqjSdGI/szuiE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 00822249-5ccc-467d-3f2c-08db9dbe0be5
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2987.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2023 18:32:57.4712 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bVNBq4f0MbQETQHWiIa0sf2BjzKqf7gFFt+IAcP+4rNUKBKwj6JItpRVMmR1HMIkgLNp6A0o5L5fT2p0xhWwHvwqlTVTB0Uvjs2JoskhEgs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5797
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 4/4] drm/xe: Correlate engine and cpu
 timestamps with better accuracy
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
Cc: Lionel G Landwerlin <lionel.g.landwerlin@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Aug 15, 2023 at 09:41:08AM -0700, Niranjana Vishwanathapura wrote:
>On Mon, Aug 14, 2023 at 03:37:34PM -0700, Umesh Nerlige Ramappa wrote:
>>Perf measurements rely on CPU and engine timestamps to correlate
>>events of interest across these time domains. Current mechanisms get
>>these timestamps separately and the calculated delta between these
>>timestamps lack enough accuracy.
>>
>>To improve the accuracy of these time measurements to within a few us,
>>add a query that returns the engine and cpu timestamps captured as
>>close to each other as possible.
>>
>>Mesa MR: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/24591
>>
>>v2:
>>- Fix kernel-doc warnings (CI)
>>- Document input params and group them together (Jose)
>>- s/cs/engine/ (Jose)
>>- Remove padding in the query (Ashutosh)
>>
>>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>>---
>>drivers/gpu/drm/xe/xe_query.c | 138 ++++++++++++++++++++++++++++++++++
>>include/uapi/drm/xe_drm.h     |  93 ++++++++++++++++++-----
>>2 files changed, 212 insertions(+), 19 deletions(-)
>>
>>diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
>>index b9d565264ceb..af083f57a618 100644
>>--- a/drivers/gpu/drm/xe/xe_query.c
>>+++ b/drivers/gpu/drm/xe/xe_query.c
>>@@ -6,10 +6,12 @@
>>#include "xe_query.h"
>>
>>#include <linux/nospec.h>
>>+#include <linux/sched/clock.h>
>>
>>#include <drm/ttm/ttm_placement.h>
>>#include <drm/xe_drm.h>
>>
>>+#include "regs/xe_engine_regs.h"
>>#include "xe_bo.h"
>>#include "xe_device.h"
>>#include "xe_exec_queue.h"
>>@@ -17,6 +19,7 @@
>>#include "xe_gt.h"
>>#include "xe_guc_hwconfig.h"
>>#include "xe_macros.h"
>>+#include "xe_mmio.h"
>>#include "xe_ttm_vram_mgr.h"
>>
>>static const u16 xe_to_user_engine_class[] = {
>>@@ -27,6 +30,14 @@ static const u16 xe_to_user_engine_class[] = {
>>	[XE_ENGINE_CLASS_COMPUTE] = DRM_XE_ENGINE_CLASS_COMPUTE,
>>};
>>
>>+static const enum xe_engine_class user_to_xe_engine_class[] = {
>>+	[DRM_XE_ENGINE_CLASS_RENDER] = XE_ENGINE_CLASS_RENDER,
>>+	[DRM_XE_ENGINE_CLASS_COPY] = XE_ENGINE_CLASS_COPY,
>>+	[DRM_XE_ENGINE_CLASS_VIDEO_DECODE] = XE_ENGINE_CLASS_VIDEO_DECODE,
>>+	[DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE] = XE_ENGINE_CLASS_VIDEO_ENHANCE,
>>+	[DRM_XE_ENGINE_CLASS_COMPUTE] = XE_ENGINE_CLASS_COMPUTE,
>>+};
>>+
>>static size_t calc_hw_engine_info_size(struct xe_device *xe)
>>{
>>	struct xe_hw_engine *hwe;
>>@@ -45,6 +56,132 @@ static size_t calc_hw_engine_info_size(struct xe_device *xe)
>>	return i * sizeof(struct drm_xe_engine_class_instance);
>>}
>>
>>+typedef u64 (*__ktime_func_t)(void);
>>+static __ktime_func_t __clock_id_to_func(clockid_t clk_id)
>>+{
>>+	/*
>>+	 * Use logic same as the perf subsystem to allow user to select the
>>+	 * reference clock id to be used for timestamps.
>>+	 */
>>+	switch (clk_id) {
>>+	case CLOCK_MONOTONIC:
>>+		return &ktime_get_ns;
>>+	case CLOCK_MONOTONIC_RAW:
>>+		return &ktime_get_raw_ns;
>>+	case CLOCK_REALTIME:
>>+		return &ktime_get_real_ns;
>>+	case CLOCK_BOOTTIME:
>>+		return &ktime_get_boottime_ns;
>>+	case CLOCK_TAI:
>>+		return &ktime_get_clocktai_ns;
>>+	default:
>>+		return NULL;
>>+	}
>>+}
>>+
>>+static void
>>+__read_timestamps(struct xe_gt *gt,
>>+		  struct xe_reg lower_reg,
>>+		  struct xe_reg upper_reg,
>>+		  u64 *engine_ts,
>>+		  u64 *cpu_ts,
>>+		  u64 *cpu_delta,
>>+		  __ktime_func_t cpu_clock)
>>+{
>>+	u32 upper, lower, old_upper, loop = 0;
>>+
>>+	upper = xe_mmio_read32(gt, upper_reg);
>>+	do {
>>+		*cpu_delta = local_clock();
>>+		*cpu_ts = cpu_clock();
>>+		lower = xe_mmio_read32(gt, lower_reg);
>>+		*cpu_delta = local_clock() - *cpu_delta;
>>+		old_upper = upper;
>>+		upper = xe_mmio_read32(gt, upper_reg);
>>+	} while (upper != old_upper && loop++ < 2);
>>+
>>+	*engine_ts = (u64)upper << 32 | lower;
>>+}
>>+
>>+static int
>>+query_engine_cycles(struct xe_device *xe,
>>+		struct drm_xe_device_query *query)
>>+{
>>+	struct drm_xe_query_engine_cycles __user *query_ptr;
>>+	struct drm_xe_engine_class_instance *eci;
>>+	struct drm_xe_query_engine_cycles resp;
>>+	size_t size = sizeof(resp);
>>+	__ktime_func_t cpu_clock;
>>+	struct xe_hw_engine *hwe;
>>+	struct xe_gt *gt;
>>+
>>+	if (query->size == 0) {
>>+		query->size = size;
>>+		return 0;
>>+	} else if (XE_IOCTL_DBG(xe, query->size != size)) {
>>+		return -EINVAL;
>>+	}
>>+
>>+	query_ptr = u64_to_user_ptr(query->data);
>>+	if (copy_from_user(&resp, query_ptr, size))
>>+		return -EFAULT;
>>+
>>+	cpu_clock = __clock_id_to_func(resp.clockid);
>>+	if (!cpu_clock)
>>+		return -EINVAL;
>>+
>>+	eci = &resp.eci;
>>+	if (eci->gt_id > XE_MAX_GT_PER_TILE)
>>+		return -EINVAL;
>>+
>>+	gt = xe_device_get_gt(xe, eci->gt_id);
>>+	if (!gt)
>>+		return -EINVAL;
>>+
>>+	if (eci->engine_class >= ARRAY_SIZE(user_to_xe_engine_class))
>>+		return -EINVAL;
>>+
>>+	hwe = xe_gt_hw_engine(gt, user_to_xe_engine_class[eci->engine_class],
>>+			      eci->engine_instance, true);
>>+	if (!hwe)
>>+		return -EINVAL;
>>+
>>+	resp.engine_frequency = gt->info.clock_freq;
>>+
>>+	xe_device_mem_access_get(xe);
>>+	xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>>+
>>+	__read_timestamps(gt,
>>+			  RING_TIMESTAMP(hwe->mmio_base),
>>+			  RING_TIMESTAMP_UDW(hwe->mmio_base),
>>+			  &resp.engine_cycles,
>>+			  &resp.cpu_timestamp,
>>+			  &resp.cpu_delta,
>>+			  cpu_clock);
>>+
>>+	xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>>+	xe_device_mem_access_put(xe);
>>+	resp.width = 36;
>>+
>>+	/* Only write to the output fields of user query */
>>+	if (put_user(resp.engine_frequency, &query_ptr->engine_frequency))
>>+		return -EFAULT;
>>+
>>+	if (put_user(resp.cpu_timestamp, &query_ptr->cpu_timestamp))
>>+		return -EFAULT;
>>+
>>+	if (put_user(resp.cpu_delta, &query_ptr->cpu_delta))
>>+		return -EFAULT;
>>+
>>+	if (put_user(resp.engine_cycles, &query_ptr->engine_cycles))
>>+		return -EFAULT;
>>+
>>+	if (put_user(resp.width, &query_ptr->width))
>>+		return -EFAULT;
>>+
>>+	return 0;
>>+}
>>+
>>static int query_engines(struct xe_device *xe,
>>			 struct drm_xe_device_query *query)
>>{
>>@@ -376,6 +513,7 @@ static int (* const xe_query_funcs[])(struct xe_device *xe,
>>	query_gts,
>>	query_hwconfig,
>>	query_gt_topology,
>>+	query_engine_cycles,
>>};
>>
>>int xe_query_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>>diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>>index 53cd57342620..4c0c58ca63a3 100644
>>--- a/include/uapi/drm/xe_drm.h
>>+++ b/include/uapi/drm/xe_drm.h
>>@@ -128,6 +128,25 @@ struct xe_user_extension {
>>#define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
>>#define DRM_IOCTL_XE_VM_MADVISE			 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_VM_MADVISE, struct drm_xe_vm_madvise)
>>
>>+/** struct drm_xe_engine_class_instance - instance of an engine class */
>>+struct drm_xe_engine_class_instance {
>>+#define DRM_XE_ENGINE_CLASS_RENDER		0
>>+#define DRM_XE_ENGINE_CLASS_COPY		1
>>+#define DRM_XE_ENGINE_CLASS_VIDEO_DECODE	2
>>+#define DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE	3
>>+#define DRM_XE_ENGINE_CLASS_COMPUTE		4
>>+	/*
>>+	 * Kernel only class (not actual hardware engine class). Used for
>>+	 * creating ordered queues of VM bind operations.
>>+	 */
>>+#define DRM_XE_ENGINE_CLASS_VM_BIND		5
>>+	__u16 engine_class;
>>+
>>+	__u16 engine_instance;
>>+	__u16 gt_id;
>>+	__u16 rsvd;
>>+};
>>+
>
>I think moving this structure here should be moved to a
>separate patch with either 'fixup' (if possible) or with
>'Fixes' so that it can be merged with original patch.
>While at it, can you add kernel-doc for it :)
>
>>/**
>> * enum drm_xe_memory_class - Supported memory classes.
>> */
>>@@ -223,6 +242,60 @@ struct drm_xe_query_mem_region {
>>	__u64 reserved[6];
>>};
>>
>>+/**
>>+ * struct drm_xe_query_engine_cycles - correlate CPU and GPU timestamps
>>+ *
>>+ * If a query is made with a struct drm_xe_device_query where .query is equal to
>>+ * DRM_XE_QUERY_CS_CYCLES, then the reply uses struct drm_xe_query_engine_cycles
>>+ * in .data. struct drm_xe_query_engine_cycles is allocated by the user and
>>+ * .data points to this allocated structure.
>>+ *
>>+ * The query returns the command streamer cycles and the frequency that can
>>+ * be used to calculate the command streamer timestamp. In addition the
>>+ * query returns a set of cpu timestamps that indicate when the command
>>+ * streamer cycle count was captured.
>>+ */
>>+struct drm_xe_query_engine_cycles {
>>+	/**
>>+	 * @eci: This is input by the user and is the engine for which command
>>+	 * streamer cycles is queried.
>>+	 */
>>+	struct drm_xe_engine_class_instance eci;
>>+
>>+	/**
>>+	 * @clockid: This is input by the user and is the reference clock id for
>>+	 * CPU timestamp. For definition, see clock_gettime(2) and
>>+	 * perf_event_open(2). Supported clock ids are CLOCK_MONOTONIC,
>>+	 * CLOCK_MONOTONIC_RAW, CLOCK_REALTIME, CLOCK_BOOTTIME, CLOCK_TAI.
>>+	 */
>>+	__s32 clockid;
>>+
>>+	/** @width: Width of the engine cycle counter in bits. */
>>+	__u32 width;
>>+
>>+	/**
>>+	 * @engine_cycles: Command streamer cycles as read from the command streamer
>>+	 * register at 0x358 offset.
>>+	 */
>>+	__u64 engine_cycles;
>>+
>>+	/** @engine_frequency: Frequency of the engine cycles in Hz. */
>>+	__u64 engine_frequency;
>>+
>>+	/**
>>+	 * @cpu_timestamp: CPU timestamp in ns. The timestamp is captured before
>>+	 * reading the engine_cycles register using the reference clockid set by the
>>+	 * user.
>>+	 */
>>+	__u64 cpu_timestamp;
>>+
>>+	/**
>>+	 * @cpu_delta: Time delta in ns captured around reading the lower dword
>>+	 * of the engine_cycles register.
>>+	 */
>>+	__u64 cpu_delta;
>
>Why do we need this cpu_delta?

It's been a while since this patch was originally written.

fwiu, the time taken to read the registers varies (esp, over PCI), so 
this information is used by UMD to calibrate the readings.

Thanks,
Umesh

>
>Niranjana
>
>>+};
>>+
>>/**
>> * struct drm_xe_query_mem_usage - describe memory regions and usage
>> *
>>@@ -395,6 +468,7 @@ struct drm_xe_device_query {
>>#define DRM_XE_DEVICE_QUERY_GTS		3
>>#define DRM_XE_DEVICE_QUERY_HWCONFIG	4
>>#define DRM_XE_DEVICE_QUERY_GT_TOPOLOGY	5
>>+#define DRM_XE_QUERY_CS_CYCLES		6
>>	/** @query: The type of data to query */
>>	__u32 query;
>>
>>@@ -737,25 +811,6 @@ struct drm_xe_exec_queue_set_property {
>>	__u64 reserved[2];
>>};
>>
>>-/** struct drm_xe_engine_class_instance - instance of an engine class */
>>-struct drm_xe_engine_class_instance {
>>-#define DRM_XE_ENGINE_CLASS_RENDER		0
>>-#define DRM_XE_ENGINE_CLASS_COPY		1
>>-#define DRM_XE_ENGINE_CLASS_VIDEO_DECODE	2
>>-#define DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE	3
>>-#define DRM_XE_ENGINE_CLASS_COMPUTE		4
>>-	/*
>>-	 * Kernel only class (not actual hardware engine class). Used for
>>-	 * creating ordered queues of VM bind operations.
>>-	 */
>>-#define DRM_XE_ENGINE_CLASS_VM_BIND		5
>>-	__u16 engine_class;
>>-
>>-	__u16 engine_instance;
>>-	__u16 gt_id;
>>-	__u16 rsvd;
>>-};
>>-
>>struct drm_xe_exec_queue_create {
>>#define XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY               0
>>	/** @extensions: Pointer to the first extension struct, if any */
>>-- 
>>2.38.1
>>
