Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E91BC8303C
	for <intel-xe@archiver.kernel.org>; Tue,  8 Jul 2025 20:15:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FE3A10E5D0;
	Tue,  8 Jul 2025 20:15:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="buVTft35";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8E4610E5D0
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Jul 2025 20:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752005740; x=1783541740;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=osDbhAz92dh4OsC3AB0YVV9rmz0W+1URp7p/GvwSt2Q=;
 b=buVTft35tAii9s2NSP0mSm2698KwU0F7Izaj9tioqlGv7oFSIqztg3UH
 ccMLBym7PO2MTaRw+cFMsdA1laWF89KXXGsVySovGwyy2XuW4LdNthzxv
 GwVj5z0m6xxA94PSpxOPf5gKkyxKsvIZR3p1HzW5w2IEAm5SETDp/eAb1
 nBhqCSAKMkNyRf7m+ebfSk7p46S+4Hm4sHTl3j+NRltu5KEpzdYSGPD8u
 hHp0gQ9ejv+eFZSE1Waj2417jRw6p1LOjZqRiJmqi5AOn+qRHfvAZS3/7
 d9mJXUWwVnEU0HxwLrfU8oj3W1PirEF7Hc1XWeSri/uCLXo/AvqF1qtgJ w==;
X-CSE-ConnectionGUID: FWSDCPIZR5+aQn03odfxQw==
X-CSE-MsgGUID: ysPMAw7FT36x5FuCJ/iN5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="54398255"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="54398255"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 13:15:39 -0700
X-CSE-ConnectionGUID: qcuHsarpQ9qXgCo084AwEA==
X-CSE-MsgGUID: DIPQB1mKSSG/b8fgSB3AiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="155001351"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 13:15:36 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 8 Jul 2025 13:15:33 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 8 Jul 2025 13:15:33 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.47)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 8 Jul 2025 13:15:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KaksWsV9V5ET4P7PKa/GBcTk9efTO8+11FnEMsWMfObw/BczUmxpipedDTd0ZnwawZht+PNHrTou+hUn90GtuTSMHkq/tx1uWB6k9ch7T94uNO3tAefKHTR42kbiZ+GLbtLalfhfjsjJKvh5kDm+7X1AZSDCY+9bPMw29Mrul7hLIp/Bi+65dMjFcwiEe2U7yP2i1PaQxD4Gw5B5EhCKJa7JxEp2yBufBJ7+28xOAMB+xmzO7CV7GUSZXfYbTfD6YPQICAIiBEts9zGijPBamRERdEFZCTq6LuqQ6Hmb34ji3AfvoWISdwqVkdYtG5crpO7zA40Qb+3IfesCSPXAug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eTPKhdHeLO1LkU//aCYpc5LGopXladMrNE2OASLDOeU=;
 b=vrpJXulK6/z51et2oQycdSkaVsx5IOIoqODSxA8rsXxVbBJvJEongBOxHbqYqXwPzBtBtQFQVsfDq7M/ZWiaR+RMUH5CsfZ8hl8c81FKjU32ZurOBj9/UwEgXU7goXKk//xja5iFoDwDmJ1O+6tz06JDwC0txPkjigYmAGGDlLxnzPr7wWPxNbIENDVGAZkjqLwaRnI+hQjO4D4F4mvhCwYnPLbDR0+KPJR+3Tf8mlh/9T2+avBQNN6I8Su+Pz7BgsIHZ5nJIGKJLWk25KLsG8dWj7H0ZILnnsm2AaU03EvTEzfWW124irdasBS3QfwAmL7QMvGtEYGb9nonIp2vjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA3PR11MB9039.namprd11.prod.outlook.com (2603:10b6:208:570::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.24; Tue, 8 Jul
 2025 20:14:49 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8857.022; Tue, 8 Jul 2025
 20:14:49 +0000
Date: Tue, 8 Jul 2025 15:14:46 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Ilia Levi <ilia.levi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <koby.elbaz@intel.com>,
 <konstantin.sinyuk@intel.com>, <yaron.avizrat@intel.com>,
 <moti.haimovski@intel.com>, <didi.freiman@intel.com>,
 <tejas.upadhyay@intel.com>, <matthew.auld@intel.com>,
 <matthew.d.roper@intel.com>, <matthew.brost@intel.com>
Subject: Re: [PATCH v3] drm/xe: Support for mmap-ing mmio regions
Message-ID: <cdbrkwbzjkdrerbatfanlplukifvupv3w57ouipbmlaugpdzem@yunngcsuevxj>
References: <20250624155221.208338-1-ilia.levi@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250624155221.208338-1-ilia.levi@intel.com>
X-ClientProxiedBy: SJ0PR05CA0098.namprd05.prod.outlook.com
 (2603:10b6:a03:334::13) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA3PR11MB9039:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c606bfa-0a4c-4255-9c5c-08ddbe5c1701
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Iw/hhqd2WZjXhFTermLGxJPAC3bQznrBU56cq3rpijv7SvKO4pI5rLThaK5U?=
 =?us-ascii?Q?q/jI2Xmh/f0XqAd+XjBNt7i5DS/x+XZkHG0O5wMEX8t4RwBVdkHcUScBur5Z?=
 =?us-ascii?Q?yLkfEJbbmLg5ILN5M6mQOPKE1jm+AkLv76Ow9rqG56HCjbJ0us8jAPVEOVJ2?=
 =?us-ascii?Q?xRVSadvBoXfMJxi0+vHrFounWDXsk/NF5X2aiM7mHU0o6pvB//5cwNxuPFry?=
 =?us-ascii?Q?UBou0H2pQPSFFWvkATEl/ONen1rMmaMohu87vna+RxCiGHosqoIr5FQPu35G?=
 =?us-ascii?Q?YlK+0sde4uA6UClCgNL107cl1Mqdgyvg2/SLFrcd6f3dGThUdLUAxhuMnsAo?=
 =?us-ascii?Q?EsAPIaAHtNOfw68JPZ+fWTeJbOoBQOPV30LW695imc0JGpRPYXtGi+8QZYrn?=
 =?us-ascii?Q?bG/84uWxyfhNfkZ2N78JO680zdR6b4Q9ag7MdUbtMDjPT2YP0eKQKtG0Tvrn?=
 =?us-ascii?Q?Oj/WWhXtmABM1KEv7E64EQQ8OshMrU6k/f2rRZ6IWzsxVZ4LCJu/L/6o4WTd?=
 =?us-ascii?Q?TKUDcuhFwZ/GzW6rC9vnQJkLpdF3b6D0MBXa1JtQoKtG3Ze3+jCtDteivMbx?=
 =?us-ascii?Q?Buf0bc6acg4n/euM7Taln5CDnDJVrgVluzMWHNBOAzvu+aqvlHd4RJdzLvt0?=
 =?us-ascii?Q?o3/THnAfpmSghMg8fRxT0wEQRV+px+w66Vwy5Yv9zAcdEu9+MiVNkl1o7lr/?=
 =?us-ascii?Q?Ybi3FNGtALxikVYUOcJ7p3wbuib1EhocmVR0H5AdVvjY+irxLnX33kjRKUbA?=
 =?us-ascii?Q?tY/5nP60koH8/OWRYYGncDATxoKoT+NbZdsXdCCtHXokFXWn6FCvbcEjVxO1?=
 =?us-ascii?Q?HiYQZ3IycbqGg5GpsR3z4TrWoxYYNiPUNynMZVDmFBGV+jfIs2cwdAhIbb0F?=
 =?us-ascii?Q?ESB4GWgUcylH/ErMC2taSQefRBrmfmlFMDTbi7vE4Sk7akHG8c0/7qXcA4Xv?=
 =?us-ascii?Q?h1Z8Dv8sd8ILMzY1EASsUa9KzyAAyNgR5fSnDRUKXfKyx8HYP/XcXImQ+wGZ?=
 =?us-ascii?Q?H+EnyEIFoKIZK/+soVoRvSkZbDgSUfvqHdR3MP7MTL6C+y2dBveIM+O7BvMP?=
 =?us-ascii?Q?vXpp8O+l1gdNyNfQuSkI24YvO/Jrz/KVPBjFjx9U5G7FGRTk/yQmkAs0bO9N?=
 =?us-ascii?Q?eOBx0bC5W63Po5KV+WiiGvyYElBkX36EdegKdkbdabGGJS8DQQH8SoQo+XN1?=
 =?us-ascii?Q?Ysn+Pt2HMfqVJWG6hy1K+jreUMkVz8gJgae0qP0NQyMdGhdVEtPDZZSlXmZ0?=
 =?us-ascii?Q?X90mdhUTVqSJwpT2pawG0G1tAxp3l1ZyOMi09serOZ0yTV8HnT85vqma3eul?=
 =?us-ascii?Q?HzyyC5F80zqYf+bygiMpLcfqsHt3QjhY3Gi2uegjJ7l3c7xNO5XROsMli38C?=
 =?us-ascii?Q?uX9YpYqAQBB7uCBDQmltxjf/eMlNNPAf5gT9NtA9YstgQKMwVg3RV8Bch05y?=
 =?us-ascii?Q?Qw+x6Z3gsUo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rzF2UlgNBbFXr/21YBkNlNfz7EJPsU+W76umW92gL3iZadQ+zTUmPPurjKnL?=
 =?us-ascii?Q?dab7DamDirBcWAHmYxuH8cE00cHOFA9UWMz4wzlOZZ+4YFFItl4UGCcB5rzC?=
 =?us-ascii?Q?bJomR6q01BA1vN5Xng8C5y60Cq1DYONsytzzLi6uf3rCAV7QvgSjg0jCZalt?=
 =?us-ascii?Q?CP8Znllqz8f545Q+dSNUpvmywSnOwuQgbc/eFwMoWjtlNTsdgSjwCxPJHqHU?=
 =?us-ascii?Q?+PzS8o4PpyUdy8JsscuR2rrwOTs4xEG4TQy/TS1pNZipRF4hq9YFLASMUHdd?=
 =?us-ascii?Q?4/YXUq5EDkLHygW2VjbT84YQ0PYnEBimjGG1PKN5sZ0CuhOUdMpb8z19oiym?=
 =?us-ascii?Q?vq03EFVta5agnkpGofBlnCBVYYIbHk2+bHf0hd39KGh9yHDRmq1DN0FBTTej?=
 =?us-ascii?Q?2T/lop05FQmCooj+K98t5ASxG4bDgrCvqhn92n7/Rxa4uZMkGwFWpoydwY8f?=
 =?us-ascii?Q?a8rceVh0KBttFuhdb01YgqQKA6OdSGAhlD7qySJmOELylf310FW0OsJ2LxoM?=
 =?us-ascii?Q?oCW7SVt5s2dNC2v+VMVsiRgU1+jAIeS1vsRLA43B5oyh01TTeltXTyNEnT/b?=
 =?us-ascii?Q?NfbsVPSLPfgrC2m14r31xLztfZu66GnenaX/g9K80qV9ap8E2F/QZx+CsHhg?=
 =?us-ascii?Q?cWjxC5dVyDUZxfcH+nMaFp2f/nCCU+SVsH051cP5qxWidZrr1F5rsUJtWkX/?=
 =?us-ascii?Q?emVH5WJc0vGlovBCkeooaw0Emeo5hLFi4RURegnpJaSP1yZHGfTG1Xs0jaXV?=
 =?us-ascii?Q?AWHgDAv0RfH4ZjCSDbRfgwe7ycV30p/L9qzSDq79TFCp1eNd7jRubtB/FtwL?=
 =?us-ascii?Q?Xbbxu7SOpGiwthi6H21JF/Yk8bVgMCAQuB0A3IKbeyvSy0NYcE4MFTjn4HtI?=
 =?us-ascii?Q?qtaPySAoaJWfUgsq0JC7aPMNibo9sT2UoSgbZmM0j+h3kXu7E7ve2d+dkUV6?=
 =?us-ascii?Q?0kZep4k3KenW84GSfT79QnQhVu3dDUhOAwseK5bACyakNRCtzD7Li9couJn4?=
 =?us-ascii?Q?SS0nMkgIpGaCiZ9uK0NF5mwu8hYirgq7D/3+EwXj9LfUY9vKqFoJSXNt5P9D?=
 =?us-ascii?Q?Iyo1bD8b89ltEn5iVDKt507GSpRGqQIMlJZjWHqY3E76QxOvGJX8H0BS0xyt?=
 =?us-ascii?Q?cD64w0qodRkRyiTEt/gAw0R/0xPfljmqHZ4oZUoMEZaWCV5GfHYf36BvTSIC?=
 =?us-ascii?Q?6NVzfpY2EQUBu34yFvLKwKe/NFQHZWNLIJOytbPBeUuIvb+ULY7UQsvP2ivy?=
 =?us-ascii?Q?/HLpV2BhWpi4qjndaWKlHOoxyjC2EOES1hj6aCl1YJjTv/ZeHlafVRSGahPi?=
 =?us-ascii?Q?+2O/zWKSJrLqhYPgULALfA6Zuz65v88apvyWCwPch0iQvp6e1wMI9siIaUS3?=
 =?us-ascii?Q?G/a5ZOUzRGbK54P3/dVwz97zIS74GhFJiDBYigmuQqtFOdRH7WrMrDQ/s1Ur?=
 =?us-ascii?Q?WW3WHUMUkbUMFRar9Ko8j/7CW+JT/bmM0V10s5BxK3yJhOeXaI3AxXtHS4Z/?=
 =?us-ascii?Q?IgC1kS7bHs/B/xbJeoWGInDkDXAeYIpHsWt/iqzvH8+Ea5cGKuyxzl+Oqv5t?=
 =?us-ascii?Q?SW2FUBIE3G7hvi4g+JBOkMui9/KkZifb6sJxTFUfdJtalbIXyLUfQikRn4v0?=
 =?us-ascii?Q?sQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c606bfa-0a4c-4255-9c5c-08ddbe5c1701
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 20:14:49.1281 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gSgSe2H46LVz+WBGh+BGKsuEQD0cCrqkZTy0GPWUbmJg83no8ovYMWmpwHV7rwgsLf0rrt7dubIv3f40RdjPFCLP/068BCtdqZV15WS53ik=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9039
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

On Tue, Jun 24, 2025 at 06:52:21PM +0300, Ilia Levi wrote:
>Allow the driver to expose hardware register spaces to userspace
>through GEM objects with fake mmap offsets. This can be useful
>for userspace-firmware communication, debugging, etc.
>
>v2: Minor doc fix (CI)
>v3: Enforce MAP_SHARED (Tejas)
>    Add fault handler with dummy page (Tejas, Matt Auld)
>    Store physical address instead of xe_mmio in the GEM object (MattB)
>
>Signed-off-by: Ilia Levi <ilia.levi@intel.com>
>---
> drivers/gpu/drm/xe/xe_device_types.h |  14 ++
> drivers/gpu/drm/xe/xe_mmio.c         | 210 +++++++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_mmio.h         |   4 +
> 3 files changed, 228 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>index 6aca4b1a2824..22a567c5f0de 100644
>--- a/drivers/gpu/drm/xe/xe_device_types.h
>+++ b/drivers/gpu/drm/xe/xe_device_types.h
>@@ -10,6 +10,7 @@
>
> #include <drm/drm_device.h>
> #include <drm/drm_file.h>
>+#include <drm/drm_gem.h>
> #include <drm/drm_pagemap.h>
> #include <drm/ttm/ttm_device.h>
>
>@@ -162,6 +163,19 @@ struct xe_mmio {
> 	u32 adj_offset;
> };
>
>+/**
>+ * struct xe_mmio_gem - GEM wrapper for xe_mmio
>+ *
>+ * A GEM object for exposing xe_mmio instance to userspace via mmap.
>+ */
>+struct xe_mmio_gem {
>+	/** @base: GEM object base */
>+	struct drm_gem_object base;
>+
>+	/** @phys_addr: The physical address of the exposed MMIO region */
>+	phys_addr_t phys_addr;
>+};
>+
> /**
>  * struct xe_tile - hardware tile structure
>  *
>diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
>index 7357458bc0d2..3298ab0f1fb4 100644
>--- a/drivers/gpu/drm/xe/xe_mmio.c
>+++ b/drivers/gpu/drm/xe/xe_mmio.c
>@@ -10,6 +10,7 @@
> #include <linux/minmax.h>
> #include <linux/pci.h>
>
>+#include <drm/drm_drv.h>
> #include <drm/drm_managed.h>
> #include <drm/drm_print.h>
>
>@@ -408,3 +409,212 @@ int xe_mmio_wait32_not(struct xe_mmio *mmio, struct xe_reg reg, u32 mask, u32 va
> {
> 	return __xe_mmio_wait32(mmio, reg, mask, val, timeout_us, out_val, atomic, false);
> }
>+
>+/**
>+ * DOC: Exposing MMIO regions to userspace
>+ *
>+ * In certain cases, the driver may allow userspace to mmap a portion of the hardware registers.
>+ *
>+ * This can be done as follows:
>+ * 1. Define an xe_mmio instance that represents this portion.
>+ * 2. Call xe_mmio_gem_create() to create a GEM object with an mmap-able fake offset.
>+ * 3. Use drm_vma_node_offset_addr() on the created GEM object to retrieve the fake offset.
>+ * 4. Provide the fake offset to userspace.
>+ * 5. Userspace can call mmap with the fake offset. The length provided to mmap
>+ *    must match the size of the xe_mmio instance.
>+ * 6. When the region is no longer needed, call xe_mmio_gem_destroy() to release the GEM object.
>+ *
>+ * Limitations: The exposed xe_mmio must be page-aligned with regards to its BAR offset and size.
>+ *
>+ * WARNING: Exposing MMIO regions to userspace can have security and stability implications.
>+ * Make sure not to expose any sensitive registers.

what exactly in this patch is preventing that?

how is that any better than simply mmap the BAR already exposed in sysfs?

Lucas De Marchi

>+ */
>+
>+static void xe_mmio_gem_free(struct drm_gem_object *);
>+static int xe_mmio_gem_mmap(struct drm_gem_object *, struct vm_area_struct *);
>+static vm_fault_t xe_mmio_gem_vm_fault(struct vm_fault *);
>+
>+static const struct vm_operations_struct vm_ops = {
>+	.open = drm_gem_vm_open,
>+	.close = drm_gem_vm_close,
>+	.fault = xe_mmio_gem_vm_fault,
>+};
>+
>+static const struct drm_gem_object_funcs xe_mmio_gem_funcs = {
>+	.free = xe_mmio_gem_free,
>+	.mmap = xe_mmio_gem_mmap,
>+	.vm_ops = &vm_ops,
>+};
>+
>+static inline struct xe_mmio_gem *to_xe_mmio_gem(struct drm_gem_object *obj)
>+{
>+	return container_of(obj, struct xe_mmio_gem, base);
>+}
>+
>+static inline phys_addr_t xe_mmio_phys_addr(struct xe_mmio *mmio)
>+{
>+	struct xe_device *xe = tile_to_xe(mmio->tile);
>+
>+	/*
>+	 * All MMIO instances are currently on PCI BAR 0, so we can do the trick below.
>+	 * In the future we may want to store the physical address in struct xe_mmio.
>+	 */
>+	return pci_resource_start(to_pci_dev(xe->drm.dev), GTTMMADR_BAR) +
>+		(uintptr_t)(mmio->regs - xe->mmio.regs);
>+}
>+
>+/**
>+ * xe_mmio_gem_create - Expose an MMIO region to userspace
>+ * @mmio: xe_mmio instance
>+ * @file: DRM file descriptor
>+ *
>+ * This function creates a GEM object with an mmap-able fake offset that wraps
>+ * the provided xe_mmio instance.
>+ *
>+ * See: "Exposing MMIO regions to userspace"
>+ */
>+struct xe_mmio_gem *
>+xe_mmio_gem_create(struct xe_mmio *mmio, struct drm_file *file)
>+{
>+	struct xe_device *xe = tile_to_xe(mmio->tile);
>+	size_t size = mmio->regs_size;
>+	struct xe_mmio_gem *obj;
>+	struct drm_gem_object *base;
>+	phys_addr_t phys_addr = xe_mmio_phys_addr(mmio);
>+	int err;
>+
>+	if ((phys_addr % PAGE_SIZE != 0) || (size % PAGE_SIZE != 0))
>+		return ERR_PTR(-EINVAL);
>+
>+	obj = kzalloc(sizeof(*obj), GFP_KERNEL);
>+	if (!obj)
>+		return ERR_PTR(-ENOMEM);
>+
>+	base = &obj->base;
>+	base->funcs = &xe_mmio_gem_funcs;
>+	obj->phys_addr = phys_addr;
>+
>+	drm_gem_private_object_init(&xe->drm, base, size);
>+
>+	err = drm_gem_create_mmap_offset(base);
>+	if (err)
>+		goto free_gem;
>+
>+	err = drm_vma_node_allow(&base->vma_node, file);
>+	if (err)
>+		goto free_gem;
>+
>+	return obj;
>+
>+free_gem:
>+	xe_mmio_gem_free(base);
>+	return ERR_PTR(err);
>+}
>+
>+static void xe_mmio_gem_free(struct drm_gem_object *base)
>+{
>+	struct xe_mmio_gem *obj = to_xe_mmio_gem(base);
>+
>+	drm_gem_object_release(base);
>+	kfree(obj);
>+}
>+
>+/**
>+ * xe_mmio_gem_destroy - Destroy the GEM object wrapping xe_mmio
>+ * @gem: the GEM object to destroy
>+ *
>+ * This function releases resources associated with the GEM object created by
>+ * xe_mmio_gem_create().
>+ *
>+ * See: "Exposing MMIO regions to userspace"
>+ */
>+void xe_mmio_gem_destroy(struct xe_mmio_gem *gem)
>+{
>+	xe_mmio_gem_free(&gem->base);
>+}
>+
>+static int xe_mmio_gem_mmap(struct drm_gem_object *base, struct vm_area_struct *vma)
>+{
>+	if (vma->vm_end - vma->vm_start != base->size)
>+		return -EINVAL;
>+
>+	if ((vma->vm_flags & VM_SHARED) == 0)
>+		return -EINVAL;
>+
>+	/* Set vm_pgoff (used as a fake buffer offset by DRM) to 0 */
>+	vma->vm_pgoff = 0;
>+	vma->vm_page_prot = pgprot_noncached(vm_get_page_prot(vma->vm_flags));
>+	vm_flags_set(vma, VM_IO | VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP |
>+		     VM_DONTCOPY | VM_NORESERVE);
>+
>+	/* Defer actual mapping to the fault handler. */
>+	return 0;
>+}
>+
>+static void xe_mmio_gem_release_dummy_page(struct drm_device *dev, void *res)
>+{
>+	__free_page((struct page *)res);
>+}
>+
>+static vm_fault_t xe_mmio_gem_vm_fault_dummy_page(struct vm_area_struct *vma)
>+{
>+	struct drm_gem_object *base = vma->vm_private_data;
>+	struct drm_device *dev = base->dev;
>+	vm_fault_t ret = VM_FAULT_NOPAGE;
>+	struct page *page;
>+	unsigned long pfn;
>+	unsigned long i;
>+
>+	page = alloc_page(GFP_KERNEL | __GFP_ZERO);
>+	if (!page)
>+		return VM_FAULT_OOM;
>+
>+	if (drmm_add_action_or_reset(dev, xe_mmio_gem_release_dummy_page, page))
>+		return VM_FAULT_OOM;
>+
>+	pfn = page_to_pfn(page);
>+
>+	/* Map the entire VMA to the same dummy page */
>+	for (i = 0; i < base->size; i += PAGE_SIZE) {
>+		unsigned long addr = vma->vm_start + i;
>+
>+		ret = vmf_insert_pfn(vma, addr, pfn);
>+		if (ret & VM_FAULT_ERROR)
>+			break;
>+	}
>+
>+	return ret;
>+}
>+
>+static vm_fault_t xe_mmio_gem_vm_fault(struct vm_fault *vmf)
>+{
>+	struct vm_area_struct *vma = vmf->vma;
>+	struct drm_gem_object *base = vma->vm_private_data;
>+	struct xe_mmio_gem *obj = to_xe_mmio_gem(base);
>+	struct drm_device *dev = base->dev;
>+	vm_fault_t ret = VM_FAULT_NOPAGE;
>+	unsigned long i;
>+	int idx;
>+
>+	if (!drm_dev_enter(dev, &idx)) {
>+		/*
>+		 * Provide a dummy page to avoid SIGBUS for events such as hot-unplug.
>+		 * This gives the userspace the option to recover instead of crashing.
>+		 * It is assumed the userspace will receive the notification via some
>+		 * other channel (e.g. drm uevent).
>+		 */
>+		return xe_mmio_gem_vm_fault_dummy_page(vma);
>+	}
>+
>+	for (i = 0; i < base->size; i += PAGE_SIZE) {
>+		unsigned long addr = vma->vm_start + i;
>+		unsigned long phys_addr = obj->phys_addr + i;
>+
>+		ret = vmf_insert_pfn(vma, addr, PHYS_PFN(phys_addr));
>+		if (ret & VM_FAULT_ERROR)
>+			break;
>+	}
>+
>+	drm_dev_exit(idx);
>+	return ret;
>+}
>diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
>index c151ba569003..2990bbcef24d 100644
>--- a/drivers/gpu/drm/xe/xe_mmio.h
>+++ b/drivers/gpu/drm/xe/xe_mmio.h
>@@ -8,6 +8,7 @@
>
> #include "xe_gt_types.h"
>
>+struct drm_file;
> struct xe_device;
> struct xe_reg;
>
>@@ -42,4 +43,7 @@ static inline struct xe_mmio *xe_root_tile_mmio(struct xe_device *xe)
> 	return &xe->tiles[0].mmio;
> }
>
>+struct xe_mmio_gem *xe_mmio_gem_create(struct xe_mmio *mmio, struct drm_file *file);
>+void xe_mmio_gem_destroy(struct xe_mmio_gem *gem);
>+
> #endif
>-- 
>2.43.0
>
