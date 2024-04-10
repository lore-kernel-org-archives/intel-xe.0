Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C59B2CD11C2
	for <intel-xe@archiver.kernel.org>; Wed, 10 Apr 2024 21:18:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C52410E633;
	Wed, 10 Apr 2024 21:18:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dZPxaKWJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB4F210E633
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Apr 2024 21:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712783919; x=1744319919;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=IHF1vJD1VJeMPCzClMNhYofu3TE0H+pCvsg0xb4MAPA=;
 b=dZPxaKWJuvLg4BfOO+9ubzemMWDzHudRg83wKmpRg2nXQYJO9ddLgCz5
 WPvBAFIASSdrLcorFiCqGIzdtmcXlTdbxmBcY2ikFhwfe+rWgbYmGJwyQ
 Av3i3n8HWZunUpkzxBqKlJO8YZDklwe/PCZ0jIUphoftDgIcO8zo3NNMA
 7MXB2AXt8FkbjwW8RmBQObP0q9JAk4uSOvIroSOl+LyhGaB3mHZpf5O6+
 ixU6hBlXNz6rgW5aRI1RyYz/p/uuIBoHhQmweDyL2cJcQPj6OGgVRvIkg
 U9mt0eaWdPO9+wIgCjOOs3y3j0vQz8pf0idqPhmbi3kRcF8nVX7X+k1SO w==;
X-CSE-ConnectionGUID: F3NC9iATQSS56CBbqOFxxw==
X-CSE-MsgGUID: UZ8D0qiTTu26+86OXJLmZQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="11965462"
X-IronPort-AV: E=Sophos;i="6.07,191,1708416000"; d="scan'208";a="11965462"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 14:18:38 -0700
X-CSE-ConnectionGUID: 59wBH9MASq2csY0Eqpj/Yw==
X-CSE-MsgGUID: knjqZvSDRCqSeC9GwVqrAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,191,1708416000"; d="scan'208";a="51892782"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Apr 2024 14:18:37 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 10 Apr 2024 14:18:37 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 10 Apr 2024 14:18:37 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 10 Apr 2024 14:18:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dSvIw8iKz5smhJP0cJnsdrMIPTov68f+oQT02Y3V5MVpsLV4fax5por32CKWTow3SnLWfJwidDyM7b4fzZh7ZR/lQcW0L4own3AzY6cDC3Fa4rLjqAISZSdoGbx1wseQKl8OGj7jTEn8JBUOTNg03kHXb5XeHPIUN/yW/bKCo3qTfy3ZvEka9JMmU7ar4u9ePuLjroCI+pg+5yOM3MXlB+qtMXbCmMwqGXdqxyJbP84ctwOjrzROiueqIC0yNLiHEiPyv5ub9eK74iEbAaAHdh4D2MZAXpDDE4uz95IzHLmIHs4y5OOttRGFhWkZlbA3Km13LOl6ZtZ5RMY39zXTVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EULvl5nRKcCohRvurzmbrTufj1SBWRh153Z98K9zLhk=;
 b=hi39EqWh732fsmFKrU8+Pne47st5vQ20xzBHiqdSMGvn8QXbWDchW3hQnhCe115MejBwThuYWnTKcKDbtldk2yRHmmesaM+TX+7eAflZnP5SaT5PHbOfGp0jc2A1wNYb1X2C4bwVrHQYE1WQxGRr7Pzt1Pv5nM8oDtsgLt8VDM3HqGAcWoTUrvZUV3FOS6P5KMm8jtHhVWyTUWAr+GhCyMtEgxB/rqpkAPbBwPt2hmEzpbvnqJt0SCrNvoyKo5a5cJssTUhRbfffDN/qBDIrpb9eF+dS8bg1xJPFQPN3Fmmi2IV5HwfM7v3k4fLWOAERZZkAyfYEafH0kkC7avsmPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH8PR11MB7143.namprd11.prod.outlook.com (2603:10b6:510:22d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.25; Wed, 10 Apr
 2024 21:18:35 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7452.019; Wed, 10 Apr 2024
 21:18:35 +0000
Date: Wed, 10 Apr 2024 21:17:28 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Oak Zeng <oak.zeng@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <krishnaiah.bommu@intel.com>, <Thomas.Hellstrom@linux.intel.com>,
 <brian.welty@intel.com>
Subject: Re: [v2 14/31] drm/xe: Introduce helper to get tile from memory region
Message-ID: <ZhcB6Mbfx5qAqila@DUT025-TGLU.fm.intel.com>
References: <20240409201742.3042626-1-oak.zeng@intel.com>
 <20240409201742.3042626-15-oak.zeng@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240409201742.3042626-15-oak.zeng@intel.com>
X-ClientProxiedBy: SJ0PR03CA0079.namprd03.prod.outlook.com
 (2603:10b6:a03:331::24) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH8PR11MB7143:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t0Lf1HOsYlNXSLBH4OY+wCiiJOTFZkufUP5wmF0eLzarjekWdV9exbymQLr15WACifoUkQW+ZEXbRjKLhZaS15UFxdz4D/HXfQwaolH7zMekkavSPLeEAtLCWOmukTtspqxkMxRoU1YuNxj5B4t/BaHvDxD6jZ0pz5Gn6Y9Ogvy3ssYzD8GlV9YyX4RMj6q9iS6q6z++iGQEWftUpdZAEoB9o4niW5XOPiRb0tiZ9ullqiFK0UEPHikSrgptkeAq+4mDQtJn2GUCPlkMjPmxnMp5uQqoW4gUkdwQMP8Rl01CLDC1Lyq3E1wQFJOsFUk5/AAztodV+JyGSaBeU+An6mC1Zu8yba7zkeAHpE0gWA4g2hyoMBoJlru2SaHSYVreVA5cs4A0SHeaACeRGgV1kK8dfFUGDWycwSKaAZriGa/XUkzbdI/5HpIp/wTcBS8x9q+oASP79ye+6in/lpAFYSlp99+qhOfw4rGJlljkjQmfFvDoGQ5fc0SLUoc13TsjBKEh2hP7kdkZTys2QOc/T5S9cf0oJSYvU0f/l6oJ5lVySQzsowKA0huowxZtPU5BYYilz9b+Ck8e5+BKdLT9b1Td6PMfNXy82qMmKb3Sf5tsPYt8AxWX6U7OpzOWAjvs9NheFof7L/n1UZxL45kmQsUaFK5Mwe7poR+9AKWBT+8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SddEiFUlNPXEqWfz+rj+mYaVPZ9LLV1RjZebdIQbcvPz1O8cBQk38b6j0g0o?=
 =?us-ascii?Q?QWHoJK6J3aSZvW8F1mOpxtXCCP+mBuaDZaiC6eG/EHQlm8AMcYhjmBFtHfNG?=
 =?us-ascii?Q?T1l8qjkXsWy5hve0oPH6H0J0y3+QXUydMZcqxVZMCZM+QS2gwl9vDBH0jYxa?=
 =?us-ascii?Q?JohYRxSIlmkcQ2+jp0gBd03wI8Ksv4+3+C5MUwUzapirvCJ2Dx+qt5dKfasZ?=
 =?us-ascii?Q?vwPRwEXltifksGXR0vWeRGVKsMrE/0DDxkV1V+7kkhg/1zUmGV9WS1x4QGLw?=
 =?us-ascii?Q?TFauBE61lipwA7VzODXBpMon9CZQHwtQYEd24ZaEHnNRMgywYAo4b1fklRnB?=
 =?us-ascii?Q?C7nNGU12Z2AainxM2blaiRkcMRYI2KykqPDyXpLeA02Z+fWiE8vDdUzcxxMk?=
 =?us-ascii?Q?X6cZXqlzM4AXjlj0nl8YvnQTrJmp1DFXcUD+JgbIf6fVN/8ya8z2NFg2d4Bj?=
 =?us-ascii?Q?nVEtYlB6C+Slazf6VoHBtZLvPILupHf0pliix+yb6p/5mMhlGzX5/UF4Vs7Q?=
 =?us-ascii?Q?MLAs/ls7baEaTTTYbqbHHPtLG59rScwD1gcYQMR0V8q8GjiQNVd1upCHveB3?=
 =?us-ascii?Q?UGrwwsHPMFVW95smWXPbDocPXNdqwirMuZgBH05/OQN5lKNHj2LM9dXpakaz?=
 =?us-ascii?Q?EebNsI+HnEkwvAoFqr0PBgRmLfDdo5Q5Y4lmd2fgmPxXHajQjI71Nxtun/d+?=
 =?us-ascii?Q?VFOjbL6KnPU4aVLHmqMQ/eE8Nc4WRDRy7NpIi19J64rcpPUMrvW5VJ5/mlTW?=
 =?us-ascii?Q?fp+qn0RP1OLMi8+mmGfKJGMz58OZRN/mDoCynAcTvRY9a8AJ6ozZL4wnYOzG?=
 =?us-ascii?Q?wTT+9xJwJhRJBQwLhLIWi1d9ZbjsIDPRUgFwQ+S6O4MM5Uy7iHyKu8Lei0Tg?=
 =?us-ascii?Q?jx6StV/cMSCh4Wg5rpvnDLslEPupUlfYfbj438Xen5vFpT5MK6PdI0aU84Dy?=
 =?us-ascii?Q?vreU17L2YfwMktsCP/ambvfErqUAP8zAQmygKeiypWB/kPsj1TIyMsoIQmgx?=
 =?us-ascii?Q?TFOyD64hSds3UyhpIyabSgqR6B8lOQ28cxvuaoisYGVptoO1pSDbw4t3sDL9?=
 =?us-ascii?Q?Y+rxlwRLlt8Ga0iwMIzhXrhR5vC61281aG+C6PKJpk12ZBZW95h8RR88AF+v?=
 =?us-ascii?Q?Z/2tOaBCDJRujw1OQhZX8PosBiziR+BRQSDXOXkaRcU37znBWmzu0VAH9ngn?=
 =?us-ascii?Q?mYH+piHB77nAssQ2gme2Bt9lKHbWUDCBj2EbOPm8hf+bnBh+fF3xxSUJJY82?=
 =?us-ascii?Q?aX2wQzXtH7vs7mFPVpkXkog3L/asT/h1dIrGtkf73KmVWtllu+u0AEGssXw2?=
 =?us-ascii?Q?HgX47xMXFV+aAmnlxuY4sIKsuI5IBBta62g6Ru1l8wxRoEGOZEQ01OViEoMf?=
 =?us-ascii?Q?vcwqhXH/+AJ2BAXE0l4PGURrKMg4kAtiZLJMRMVAj5RHFZZvXCbZmu0oPUQh?=
 =?us-ascii?Q?brv8dh1z70NLQhzJ+Zn4Pv5BrPUi3v4/sYAPS/wOvkCcrO5lcIHfQqJEZBVy?=
 =?us-ascii?Q?GDXpqJY+HmJmfcc8QfUz6L702Oeh/M6Af5J5wmiJCZ+EUnuUA59D1KZiaTlC?=
 =?us-ascii?Q?Y8zmOaXVLaH6udGKH0oErWo2zXz0s93gfpPLXSyWMN8Dcp+XBaLfTJKmu14T?=
 =?us-ascii?Q?ng=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 84e21b3e-8ecb-46b8-0047-08dc59a3c80a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2024 21:18:35.1799 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kEYWgYwnHuXdjTHkuv756qE8aIInXB3UL94YBXbGEqNToIcJH6GB5IH7gsN9143x1E0x62HvPevc3oVyFuqHww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7143
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

On Tue, Apr 09, 2024 at 04:17:25PM -0400, Oak Zeng wrote:
> Introduce a simple helper to retrieve tile from memory region
> 
> v1: move the function to xe_device.h (Matt)
>     improve commit message, add kerneldoc (Thomas)
> 
> Signed-off-by: Oak Zeng <oak.zeng@intel.com>

This LGTM but can it be moved to xe_tile.h? That might be a better place
but I know xe_device.h and xe_tile.h are intertwined a bit.

Matt

> ---
>  drivers/gpu/drm/xe/xe_device.h | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index 74eb9833d4d8..68082357aebd 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -178,4 +178,12 @@ u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address);
>  
>  void xe_device_put_deferred(struct xe_device *xe, struct llist_node *deferred);
>  
> +/**
> + * xe_mem_region_to_tile() - retrieve tile from memory region
> + * @mr: the memory region we retrieve tile from
> + */
> +static inline struct xe_tile *xe_mem_region_to_tile(struct xe_mem_region *mr)
> +{
> +	return container_of(mr, struct xe_tile, mem.vram);
> +}
>  #endif
> -- 
> 2.26.3
> 
