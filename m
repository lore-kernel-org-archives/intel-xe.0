Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBA9EC38150
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jul 2024 06:27:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C72210E5E3;
	Wed, 10 Jul 2024 06:27:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k8w7QgPt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A020E10E63A
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Jul 2024 06:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720592857; x=1752128857;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=EGouBrkwMFHzrnZbMlQPQIC7L35XicPp+li+JSiCKtI=;
 b=k8w7QgPtKcFo/9tkO/EsyKSghrOmPdSEqeLHiSmOlr/rJ1fjhYAOdNYm
 nEBNihCpzgCdzsrdrSMALLMRq5uqx8i0iUNAlVCHvp7Qy+Prr5oy2rjgt
 ihCiAcCgHnIYdkPJkzdmzfB+bJ0X2jdSgrmup1qEL+HJuKsau6xyt7yN5
 1USvPwLsCMFMx3nn1jCoWuO/8rKqZ4o8qawcGJv96w31DFNT+SPzuw6gl
 V39UsQCAisBvAiNU3iH06l6XLz4wZtX4fGn1ESbee/Zq+j2Wq/hdJXWsQ
 31gs+gBnsweukHt9vDDJJhboBWxcT8D+NyIVpaHtzPx3hAe4D2QR5r0yZ w==;
X-CSE-ConnectionGUID: EJW7ZdFmSZakRNWiQoRwwQ==
X-CSE-MsgGUID: k3D7Ssc0QaituzGgFRhfag==
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="12466927"
X-IronPort-AV: E=Sophos;i="6.09,197,1716274800"; d="scan'208";a="12466927"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2024 23:27:37 -0700
X-CSE-ConnectionGUID: 0XmpdX2LSbu4/kGsBf4InQ==
X-CSE-MsgGUID: tD1YeKk1RXmDqw2am4d60g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,197,1716274800"; d="scan'208";a="48196198"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Jul 2024 23:27:37 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 9 Jul 2024 23:27:36 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 9 Jul 2024 23:27:36 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 9 Jul 2024 23:27:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cRqIfMZ83AbN7dQ8TLQoVD0RpSF1XmG+eLYE5zxW6lkytnBbU25fcsA4Kih0GqZOyxC5BRsszUKy97YvnRhz20RKqaeI60w4VRusuFNrzBpCuY9poMCPfKKNXZ9YdPSBiZUKSi1/8RJs4aS5h4Q91LVHq3RrFXnEG2Y805BZ/cwodBA5O7P5Fc5K4gSNX/E90ey/wcZXXxdJZV5WXz34pwB+0JcsKYD6m/Fe6J7If9Qm7RZgwN8t6+UTbohh/+b0edkUb9jd9pEWTeUQCqFFQJTgPbe9V5m07RSGfH09rqVcY/LrRmJnMVxMidS3ZJzkbKGgS2NbK0N3QonswKsv9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/mYmQzFfnvJd8XQTnKYGGvT8kZzhVi9oiH0kSB5lbwc=;
 b=I9205UnLt6kRfhqsc/JcvDxGjWeIw2H+dRebAb/qnoJZE3hWpoQQ5bdsfC4Awmk05UjQlRTn257QANayrgD5Dp5P90KVGSQBpddfrGngM/plFDAzAqXZtb4BxfIbTy7t3kbTjTXqTwlW0/P9tybWeHzuS+UjfWnYs28kfb2wbPsoijleovCLTvPuaxIzgMjUEhEQ7VB/De0prxAmxCDz4Tuz0ggMdKi3ppkGZ6A6XYZqFW1H4zJT2Pxo++0rsfNTZabpjtxKwNX7Nc7z0oOOfVRgQk52eA8+lOCQ4OADBLHmjKgD3EtcNKLNb/CCF62ZnV4msVipRU4rs3HglWZZdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by PH7PR11MB7429.namprd11.prod.outlook.com (2603:10b6:510:270::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Wed, 10 Jul
 2024 06:27:34 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::ffd7:2656:a8c4:43b0]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::ffd7:2656:a8c4:43b0%4]) with mapi id 15.20.7741.017; Wed, 10 Jul 2024
 06:27:34 +0000
Date: Tue, 9 Jul 2024 23:27:31 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Dani Liberman <dliberman@habana.ai>
CC: <intel-xe@lists.freedesktop.org>, <illevi@habana.ai>,
 <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v2 4/8] drm/xe/exec: adding msix infra to exec queue
Message-ID: <Zo4p02ClOIK8eM/i@nvishwa1-DESK>
References: <20240627124043.2923586-1-dliberman@habana.ai>
 <20240627124043.2923586-5-dliberman@habana.ai>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240627124043.2923586-5-dliberman@habana.ai>
X-ClientProxiedBy: SJ0PR13CA0223.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::18) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|PH7PR11MB7429:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b4cd133-fa3b-473f-3183-08dca0a96253
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?h01ZU6PVdLRWWvnUbmm7aMSFVzrg5i+wl1WcnZbndXy0k0MMj7pksJyWIJ9n?=
 =?us-ascii?Q?q62Fbw/49zaw9BjHMp9nU0PDNXdqXDYt+bTacE+qQpZbwVkUJrgzUTliuBmb?=
 =?us-ascii?Q?9Q4nId3JJBEGU0GSrlZkY/nTT278KcZo4pHDnxYXuS8EdwLb+QQyv2NwtU3f?=
 =?us-ascii?Q?vPstcTgfdCJleywdIhA7N12eLiA9nnFq6wRI3oyR9KtPvuVtiNqQTFkSi1vp?=
 =?us-ascii?Q?2ua9M53a+5gxyURtW6nlGLNyBUoqy3+4kfgAsEtb+xDxWTu/SWCb1t9v8v3o?=
 =?us-ascii?Q?a2CbqUnQSUQ4iRpVi7ZxFZ5AjvzdADGO0KP8ao+8e1UUZg94MLzX1n4QY953?=
 =?us-ascii?Q?NhQijIafuJ5VOeCf1EH+pfm3KkXzvKMIUJsoz96aS7jPpv4p03N+vTJqpHyu?=
 =?us-ascii?Q?utegr3+S3pfc4BfpzXSpFZKxatMbf7x2kStgB2t3xWLIKeJEjf1kgKwaJiXp?=
 =?us-ascii?Q?ENmnb4ROdKISrwwZk/tGhskChdVSp2nu09E+Ft9D2hOBSoavZ6II5fGLjAZ+?=
 =?us-ascii?Q?09vKV6biWzWHcGPCGbOLHgn2J7So1MsZmnRiA7hF6RfJlF5CxVaT03wNoeN4?=
 =?us-ascii?Q?vqVugrcJukt9WY9ivLlX8hAwb8AMwZUZIThpeRkQAlwuyyUhejgfmNJmbJWN?=
 =?us-ascii?Q?eiGwfVyPzSXt/MaxwjtS6gYqqzAIYdlDkw65dvcRZZI/eHJ2F1qXV1NIckn+?=
 =?us-ascii?Q?Z82nQC0zmI4cJtJGe47sH91eKBfFl+NZJLCljDx2ow5e1645a05r2DyYR1qo?=
 =?us-ascii?Q?cOz9yoT1tk0nBa5fD5E8WFfk83jUaEq96nQV/OX6Z2mS5Xv7U1oDrB1TDsmw?=
 =?us-ascii?Q?3QwImK63QPUOUzdDU3j+Hxeq+lkPe0dvFZgVhrjIYs1mMSOCx9r6w/JxERtX?=
 =?us-ascii?Q?C2nFV4+jrhJDAx+KY/twBciI34dx0UM39o0tISDRdT6qp4h2g1fgB0nk6VNc?=
 =?us-ascii?Q?P12CueaWY6/RIFZqXLuuDEwX2g3Lgw9x6OGNGic7qgM3175Hk+52mF8bWl/+?=
 =?us-ascii?Q?GadPwf35DR2l3QFeQEfRfJh9p40PApyG4boOkdVzd+i3UndnTM8+aOh6Wz7h?=
 =?us-ascii?Q?U/UXZBEt02PzPeBNhVXWVy7FpiYlko0mBplUKlNUV/oNXSjugMudkvY2f4tm?=
 =?us-ascii?Q?sez/xFpOOzfI9GtV11+xxUVkOOPEbN3OCBIspar9pt5A9SdbQmHQjxAE8DQd?=
 =?us-ascii?Q?CU/AgAq/Ijv8tSeti+Z3qSC5Y7d2BXLf2DUUsebwxMNfrtmKmDBvuI//Jm5d?=
 =?us-ascii?Q?UU3/qFrsb2aX4PqO9mau8GaY+0DK8KPpQ39vm88aFIVtSKBtkd53fhT05f3z?=
 =?us-ascii?Q?emPuonFs57pZ7jvzs7r2CkSV9aPsEsggzbyeGRO7ryUapQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bv+f08O/s8l9YOWyzhAi/elp9cMkY+PrNy85cTpS59HaIVkK9JURGEm9X0aZ?=
 =?us-ascii?Q?EoDDAzeBesGK3+eRVCyVNo0kkFxz2dn8i1c2kgL5MDrq2VjN6ZizvFX+byw6?=
 =?us-ascii?Q?mzdaIQ0d299uZFvQnCBrcpp7/qiIZ2j3cSehYKtiueqDnTJCL2jgCWaKknTF?=
 =?us-ascii?Q?3TcsrD/Kh/7moh2kWOXEG8h8EQoh+OHYuFXIwUWsx/ADj4dIqqA0FtRfZeAX?=
 =?us-ascii?Q?EZtOYneC6vBrekFmTy8BucWe746Bsx9R6YJWFHwds2s8kb5JYRgtuCQUx7mm?=
 =?us-ascii?Q?km1GpnetnxPGCcuhUrasfe8asguAykFIlnXMMdxps4l6YgYGsMOE+cpCHq/7?=
 =?us-ascii?Q?qU8pRHSpVC8NdYhsPu6FvjmJgej6HRpkbLTMqeJgMbxRs1t5T1+MbEYWPpgj?=
 =?us-ascii?Q?mQn6ULklnwDc2JAmLJb2M12BGAViPpIwiiQHndjY8HCAg/hDMH69L5mnWMzE?=
 =?us-ascii?Q?1BrBzGaja2XEpg4lRNfqwbz4/3YWxIBVNsaaSzWqjZjGc+7sqG/43NdQf+fk?=
 =?us-ascii?Q?E4ny9tk981WKJzwG9Af1YY4FLQjk9zZmWzYZ+BpGDEbRUS/HIlRaIifjdNND?=
 =?us-ascii?Q?QDfsl8UwN7aliErHE9dfbWU0xfpx0I2M2Sdxt4OPwYw8aVj4zZ82B83OE7nd?=
 =?us-ascii?Q?/1O7Aci5CkM7UX4If2sv9ed7bU2hG92iT1q3EfhH5i0Xz6Ub0ymHgDa2aRP3?=
 =?us-ascii?Q?ESKWmSgJVIQAvFLA5r3MrY4V2TlOrhRH/9MDuFQ4R5ehRGwidXHd/UABZGYI?=
 =?us-ascii?Q?V0oZyUeTu9E/e9v/NuK6KMPRVRF7r2eIlElXOxsMHabrJenrR0bKjZ+LVM1S?=
 =?us-ascii?Q?j9Arf9bj0ubbeeA7SZ+R6osofI/CGvB3ZklEnz5gmLE9/SM3VFX2OtQe3Xlv?=
 =?us-ascii?Q?EIctIU8UydUQq3YK06ADhKWx+1MC7+RTG70+yRohJ1aBqspUtwNjZ2w/qdNX?=
 =?us-ascii?Q?hY1Zfek48xlOhbcp5/MVhSf+opRidACYqS3siz/AfAoLvuhsCN5vLN8YV6qm?=
 =?us-ascii?Q?J4KGLSslDsgelUiLkNwlUja2eSkdOaiRDCUs/Bnt1z5M+C+ATXnIBlU46FNw?=
 =?us-ascii?Q?t4VEVty7wGSXHtTTBEWmP91AVcgr4Pq42+IlTJ6+UVeSzCqWpRYUeJoyo3WC?=
 =?us-ascii?Q?GEh/vbyqJwRHHZYQKrQaoJSMabwE/C1Pc8bz3k30uBCtiY0nXxS+KyKu4A1Y?=
 =?us-ascii?Q?gJdN7kh6E0+F0WTEkQ61UQq48khr8zr04dj7YpVxQJmaNEfr+8t9mn8i1MVd?=
 =?us-ascii?Q?kecmpZvSuYP+xAkPkwjvpwpWk0hPSz/FgMfpodjte0FKc+ZSIMEsGv7y9ZoC?=
 =?us-ascii?Q?opYOXkAiyrLveKaibfcs7JlQzbXfBpSBo5RPs8JZYaJVOSq+iLSltISFTaN9?=
 =?us-ascii?Q?wDsjDy180NbADc6v9zlsMflnDHB7wNePq8ioZ/l/ixKOcYNcPLDkpdpBckmj?=
 =?us-ascii?Q?z/V+LRn+hEPMFQHEsTQG3Y49i9OuOcdotKBQeCJVLpp3nHAgAvARf1EgwtZ7?=
 =?us-ascii?Q?fSNR939SOj/U09E+iwjEdAWTQfAHuWr75+uYe5Tt9AmezoEHKEVXx7WPC7mA?=
 =?us-ascii?Q?2Jc514f2xLi5UreqOuDdRG8jFyxzbFF8tNdL52YoaRJGuZhkNz6VCJ9OheXA?=
 =?us-ascii?Q?kZso3mQxRGLKMHamuGch7Pw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b4cd133-fa3b-473f-3183-08dca0a96253
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2024 06:27:34.0455 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qYXBLgaWwN6bD78pPznNNF3TjvCdde1i8VPlFonCAyxqQu5fs083lHk2yIgwxUVRZlAaH9Dgdk8yICmPn5fjRfH1l9nWrYYT5T/QDi03UoDErdh+YaKJt8QKf2HLj7BX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7429
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

On Thu, Jun 27, 2024 at 03:40:39PM +0300, Dani Liberman wrote:
>On MSIX platform each exec queue will allocate MSIX.
>
>Signed-off-by: Dani Liberman <dliberman@habana.ai>
>---
> drivers/gpu/drm/xe/xe_exec_queue.c       | 39 ++++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_exec_queue_types.h |  2 ++
> drivers/gpu/drm/xe/xe_irq.c              | 11 +++++--
> 3 files changed, 49 insertions(+), 3 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>index 0ba37835849b..e40c5380e292 100644
>--- a/drivers/gpu/drm/xe/xe_exec_queue.c
>+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>@@ -22,6 +22,7 @@
> #include "xe_ring_ops_types.h"
> #include "xe_trace.h"
> #include "xe_vm.h"
>+#include "xe_irq.h"
>
> enum xe_exec_queue_sched_prop {
> 	XE_EXEC_QUEUE_JOB_TIMEOUT = 0,
>@@ -33,8 +34,40 @@ enum xe_exec_queue_sched_prop {
> static int exec_queue_user_extensions(struct xe_device *xe, struct xe_exec_queue *q,
> 				      u64 extensions, int ext_number);
>
>+static int xe_exec_queue_msix_init(struct xe_device *xe, struct xe_exec_queue *q)
>+{
>+	u32 msix;
>+	int ret = 0;
>+
>+	if (!xe->irq.msix_enabled)
>+		return 0;
>+
>+	ret = xe_request_irq(xe, xe_irq_hwe_handler, q->hwe, q->hwe->name, true, &msix);
>+	if (ret < 0) {
>+		drm_dbg(&xe->drm, "Can't allocate unique MSIX to exec queue (%d)\n", ret);
>+		return ret;
>+	}
>+
>+	q->msix_number = msix;
>+
>+	return 0;
>+}
>+
>+static void xe_exec_queue_msix_fini(struct xe_exec_queue *q)
>+{
>+	struct xe_device *xe = gt_to_xe(q->gt);
>+
>+	if (!xe->irq.msix_enabled)
>+		return;
>+
>+	if (q->msix_number)
>+		xe_free_irq(xe, q->msix_number);
>+}
>+
> static void __xe_exec_queue_free(struct xe_exec_queue *q)
> {
>+	xe_exec_queue_msix_fini(q);
>+
> 	if (q->vm)
> 		xe_vm_put(q->vm);
> 	kfree(q);
>@@ -81,6 +114,12 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
> 	else
> 		q->sched_props.priority = XE_EXEC_QUEUE_PRIORITY_NORMAL;
>
>+	err = xe_exec_queue_msix_init(xe, q);
>+	if (err) {
>+		kfree(q);
>+		return ERR_PTR(err);
>+	}
>+
> 	if (vm)
> 		q->vm = xe_vm_get(vm);
>
>diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
>index 201588ec33c3..7da157b0e676 100644
>--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
>+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
>@@ -56,6 +56,8 @@ struct xe_exec_queue {
> 	 * @logical_mask: logical mask of where job submitted to exec queue can run
> 	 */
> 	u32 logical_mask;
>+	/** @msix_number: msix number */
>+	u32 msix_number;
> 	/** @name: name of this exec queue */
> 	char name[MAX_FENCE_NAME_LEN];
> 	/** @width: width (number BB submitted per exec) of this exec queue */
>diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
>index 28173e946e77..cf4f523b7fae 100644
>--- a/drivers/gpu/drm/xe/xe_irq.c
>+++ b/drivers/gpu/drm/xe/xe_irq.c
>@@ -895,11 +895,16 @@ void xe_free_irq(struct xe_device *xe, u32 msix)
> 	void *irq_buf;
> 	int irq;
>
>+	/* When removing the driver this function can be called twice for each msix that was
>+	 * allocated for exec queue. First from irq_uninstall() and then from exec queue free.
>+	 * Hence, it is possible that the xarray was already destroyed or the member was removed.
>+	 */

I think the comment standard followed in the driver is to leave a empty line at the top fo
multi-line comment. Perhaps, it is more readable if we follow same standard throughout the driver.

>+	if (xa_empty(&xe->irq.msix_indexes))
>+		return;
>+
> 	irq_buf = xa_load(&xe->irq.msix_indexes, msix);
>-	if (!irq_buf) {
>-		drm_err(&xe->drm, "MSIX %u can't be released since it wasn't allocated\n", msix);
>+	if (!irq_buf)
> 		return;
>-	}

I think we need some lokcing here to avoid such race.
Though xarray apis themselves have locking, I am worried our usage might have races.
If the exec queue freeing removes the allocated msix from xarray, then irq_ininstall()
shouldn't see that. Also, xa_empty() check above might be redundent.
I am also fine with leaving it as is as we have it documented in the comment above.

Niranjana

>
> 	irq = pci_irq_vector(pdev, msix);
> 	if (irq < 0) {
>-- 
>2.34.1
>
