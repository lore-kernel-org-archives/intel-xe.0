Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 562F0CCA471
	for <intel-xe@archiver.kernel.org>; Mon,  6 Oct 2025 22:25:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0314610E16C;
	Mon,  6 Oct 2025 22:25:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BsxYrFQS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 906EA10E27C
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Oct 2025 22:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759789507; x=1791325507;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=1S4jvokfS/JeLpFRqDsoI3ka/CtPP0md11/aQs8SFGM=;
 b=BsxYrFQSPjmtf3jL3i5oHG3JPxqR+vwsfVZj4kv/82SJO0p6x3hXhrFB
 7UfCm1eZApK83frumQWrepcD/g2BbORIzWJomCL3FhazGsPoMNiJVZrPX
 sMvW48tbzUfU3BV00PzsjXPiGYA/Mcoja9HffGYMIt3DZ6g46TnVG88HW
 vVKinO1ZVsNfVXSanE2FmSRd0IWBxpyCaP0BY4mS6CtzJEB/eCfCWFCtk
 jHVm9YJuBO8F+PhnFMK0dtH23hqcuKr6gCgdo5fanMzRF0Aul/WbXpMhm
 GMFsaq/rTMvXER4Zpeylj2hwVk8bpv1FENAK13N4YYJyE4GTp22YT/iqf w==;
X-CSE-ConnectionGUID: GGEUJTY9Sk+DWosTQ2wA6Q==
X-CSE-MsgGUID: WlnVsc5fQQqfl4X0a8RsOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11574"; a="84596126"
X-IronPort-AV: E=Sophos;i="6.18,320,1751266800"; d="scan'208";a="84596126"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 15:25:06 -0700
X-CSE-ConnectionGUID: mGEvZ9U/TJesQlGYTqXrbQ==
X-CSE-MsgGUID: lbu2RBDeRTqJJyNMBw6UJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,320,1751266800"; d="scan'208";a="179806610"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 15:25:07 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 6 Oct 2025 15:25:05 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 6 Oct 2025 15:25:05 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.9) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 6 Oct 2025 15:25:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kXSPiiYmWOH4J3AQnJUXPXSWTk9CvWkPO7RTfZKLntxGeprXPc/owScWBTTlSJk+oTX2tvaHe4HkgbfkNg8+ApEckU0d/ZNk/CB2WEeeZ7zHtbq9nn6ayAPM/fGzrvy91OVfjUcD1GsJvPgpwaDKhC7G1g/Y/fxnwUIpydV4HlJZKMUbwfsxOSijieDsAMjm4pSFdJvkDzNb9yw77QxEjKs/n3t/iE90RuoicQg9HDHPZZjrswzYrS1ydNBFn9zqNGGIxh7H56ek7JRgeASI9aJczHBQPvSD3X/EjZ1sfFeU21muFKUJkeqIecRBekpRZmiEXhAu0WOoThzoA2UrGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R5lPSBYIkpFx3GQ7r5QgoHfgK/Opw7EINV5cpu4zllU=;
 b=F3nS/pZWegyKdVRmgix/ZVsesugzBo6VKwkET5EWompO+M3Ufi1jyStfCUWIJUy1aDZs2yFLyKRzXQkBLMc4+/Cd1x5ew76a65x/WstSLHmiL42BY6TVAQqm90dy1aQZvKyMFBKUd0SDBu5Ah2K27+GJl26WLidevfxWb7HfvR0nkZi4AZJ2hWKosrr5XX/DUhFb5dp2FYVFHrwKBGTPTFGv0+OgPipuU20E9JUxszsgddrp62jttg4YyWau40ZxsekWnMDW4qRrDH6XlOVjKAoFWICC3eWMOaFlSN77wWQ48SP/XkMHPpIHLtknJuLVl8LR4tW/jQog6kKx2CD1aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH8PR11MB8285.namprd11.prod.outlook.com (2603:10b6:510:1c5::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Mon, 6 Oct
 2025 22:24:57 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9182.017; Mon, 6 Oct 2025
 22:24:57 +0000
Date: Mon, 6 Oct 2025 17:24:55 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH v6 27/30] drm/xe/vf: Use primary GT ordered work queue on
 media GT on PTL VF
Message-ID: <t6aytzfw5frhua2ojrz3xyrobi25p424exjagpmovtvif5jwhw@ocmceysqldql>
References: <20251006111038.2234860-1-matthew.brost@intel.com>
 <20251006111038.2234860-28-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20251006111038.2234860-28-matthew.brost@intel.com>
X-ClientProxiedBy: SJ0PR03CA0099.namprd03.prod.outlook.com
 (2603:10b6:a03:333::14) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH8PR11MB8285:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f97853a-0469-49db-9fcd-08de05272e85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|27256017;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4r+RSEnQnnzQFr91i6jBcz2Lyx06Tw4Ftbfq4ji9JqJpWk/8DLpAqOS2KrWj?=
 =?us-ascii?Q?0UR9fCph6lTFVZyTX/nvri4wSy9Jko822p5Gww9O0ikYMigik8rQgKh2VVEu?=
 =?us-ascii?Q?BZJF+42hDqudYjrivHJRePxrnTj/RUJb21ithPwXFEm07qNNB5Z4rf+jxy1w?=
 =?us-ascii?Q?nUPwMVU03/cbmp4jyYgKJ0mBlBR/ZBtlrl7HjvvvyRk0zZzL35dHL3UTKZf1?=
 =?us-ascii?Q?CzYMrMGBYo+B2cO+axoDHDSTmmECWGfsuigqCp8+NfZjuV4vVfetSqRFbX0k?=
 =?us-ascii?Q?VUaQXnDQyffhxb8eXJvZMDMl3Quz6misqZcQTRjUsr2Qo+mZf9KFVZbFmldz?=
 =?us-ascii?Q?qu4h2bC9GdWTOf8sR69CSzMmhOgRp4jTnYI9Gxq30vPmSqD9kHLXHeH4laeE?=
 =?us-ascii?Q?rzO0z3fO2Rv/S35cPsUrZJnwAh70bb9e3FnDuBSnl5tjhILzTuy0xIFsW3nA?=
 =?us-ascii?Q?gPMPih5X/J0310zuAB4Q56onb1WDAzEiGJm5fQ/x7a6NiPpjhXVgqCylMypl?=
 =?us-ascii?Q?yGxnWoTecxgXGHt+wh5RPCC4oQiVt/p67EAVh9FEphp0lWge3yisygkUoNMW?=
 =?us-ascii?Q?ITtOP7UeG4bxm+fxkGVmwda3tolmfzSxfiiy+ZVieqOCzaY0aFv2hgD531L3?=
 =?us-ascii?Q?Vmw5m1nBYi6wxXY1UJzDNTonvaqE3MBRX+YNVzGB43l/EWPEao7gPfeXSmTY?=
 =?us-ascii?Q?AQp4DdcYscWHACEhiuYO5LXAc5/Pr+tjlqFaVH9Vcl0f5O7zubsUdF/fU+Ik?=
 =?us-ascii?Q?hvlFOzyL+os8mrjlB77V1cNLvcWC4oz4ngmwUPjTQttiP9leqzmK4Yo5sfwj?=
 =?us-ascii?Q?uxXlUnXMNHcPYvcyLJ98xSYJOj4GnR17BIMaJwEcEBycDReNUSvCkxump2Du?=
 =?us-ascii?Q?8guMtz/etEneW6Uq8m49BiQVmhg0PfDjuHLpmNEbxO9hW7YSdS98fwczbxz/?=
 =?us-ascii?Q?K34aATmrZiGYt5a4Udp1HiS0gJ10sF/OnXd5+G/TmDspN8UZIxhMN7pOV7vF?=
 =?us-ascii?Q?5B4c/6PvS+yHqIaZchSI7fuYbdXaCY/fLhhWB3HYBSB3Z3UZMWTZF3f19rje?=
 =?us-ascii?Q?63F32ASO6Ab3ihwfMWPSXVUBqUVvMTieX6IMgNOn5pLS9M4HAwTksD19mMT1?=
 =?us-ascii?Q?hgtwajWCetNbg2/0IRdaMx6kIbQSiKt9cyWwXi6J/1xxM7+c0q4ol3KMFH5D?=
 =?us-ascii?Q?/AKqfI7//AbhuPMlvmFuZJjaz8l61xiI09p1EnOOifBonJTQ99bfyUtugEDI?=
 =?us-ascii?Q?TdOeSC2JZ6UI5uthpPAi4/2xAKJT+qznwGV+jMieo6+E/GDw1soyrem3jhkx?=
 =?us-ascii?Q?WORcSCLfLIovoUHad7eO46RYBzcIts51HegzAKhXn3nxLVufG/7XpIAD+zY9?=
 =?us-ascii?Q?QdfWTfY+uiZA8QXQ9j/cTpILoPBO3jE/HSGuyARnANdkjXdoVjtLEJwKchGB?=
 =?us-ascii?Q?aLoF4nLMT2oQgZiACfqRe6H7rtoyyy//?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(27256017); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3BDTIn/7Aak71/sr98XHwbCy/PSYDJr2DKCKQlQEeS32WaEOu+w6afOHOi4w?=
 =?us-ascii?Q?ukgt/DFANcugWinBu8zvCfiHT2tM0N9uwg2MxPrsRGYTvx2jCbXVioQ9y8be?=
 =?us-ascii?Q?2G/4v35Kkd4C03ZhgmFCPxmRD7eRkPuMaLxokRWhYAotGhPiJ6T0x3LOK3qh?=
 =?us-ascii?Q?BmZczxGDoL4jWC+65JomnlhaqbAQGp4+0YHb+RRciBm6Poa3oyCuUoDFXvel?=
 =?us-ascii?Q?jq7kDGrSV3rDQNyV85+ZEY0eIfMsdKJjQ0iz7VVTDY3mxo1nEXbomz3KsVPZ?=
 =?us-ascii?Q?aO69S3XTHmmYquEiFTaK0iOkX9xvN4c/YHq2SwFBFz0XHeAmp+uX6mc2cvQ5?=
 =?us-ascii?Q?qLNHOqlnL7r689LkGcNhwReRjyyIp9EWPMUUEmD6dwutwF++JNpkF8rw76HJ?=
 =?us-ascii?Q?J50mkFP3REI2+EPxAmLdaYL0rS8/17WUsa1FDpnXON/P66IXZIF7diAo1EUg?=
 =?us-ascii?Q?nQUXzoAn8N8bukQDmvQDtV05wzkOch5ovqZt94qDDka7cW2/KAJ2UqUVqPOM?=
 =?us-ascii?Q?Teo9G03Ns+kG4nW6vRwEF0JA6rv3UwokK1sOIEJeQBJNRWpqo4wuNksjXSC8?=
 =?us-ascii?Q?iZ/+xok+QlaQezvuHu8Xz65D5QA2uFz8IW320IYfRRQ/iyoNdNbqBFLeHaI/?=
 =?us-ascii?Q?kZ1YBXvwxD63nngmTXo0p7dey36q07drUiZb4I/xYKlHbReM8DVEiz+nbP04?=
 =?us-ascii?Q?DAwOziLPqhlIpTyK5Abtxj7usq0wtVOvTaraVyIor8HNUMcS14tajHoUr9U/?=
 =?us-ascii?Q?bUyPwkGlu5UjpYHOylh06Ne2QnPebMMVCzbF8wsle/lo9ZEabaWcNSI+BYPe?=
 =?us-ascii?Q?jZ+ADiZMxQGmmky1IoQFB/5716E7yQ0HPTkat0ViTnvt+Tq3/JyZrEGAGPId?=
 =?us-ascii?Q?3K5LVDWdw4DsduyeooeynU7ykFU4ZIpX7NXUqZ4jDWsIOMFDlRLOTllLJe5T?=
 =?us-ascii?Q?9v1di+AaUbKi8+6aHcwEdjOKvnIEONTby8mL/564zqQU4u9tNwHx/D+OuUmD?=
 =?us-ascii?Q?H979V5rrcMsBqSzXycoCudY7nwU4+d0u0ZLSnBBhFqmKZnyDV4JmIv6YHleZ?=
 =?us-ascii?Q?MM1AzfEwDvdTJ6gc7+ACENm9wb3MpXb8MOV9icDfuDCS9ZL7j27qhzVYwrxB?=
 =?us-ascii?Q?ZpJekU1/sgv7SGHEq9FcC0IlZZDJOOVAo1VN4dVyMoxJqgPYbHTQT7Gsm3/R?=
 =?us-ascii?Q?Fnnt1tqbdy8WoV9O/W8BJx/AyYzOsa8BahEVu9r4DheJsucTkJVnfcbd9d55?=
 =?us-ascii?Q?6eHyGxU0B2rsElEyY6l5cC6dBBC4L9ZXzGbN+Fyg+mJO5y4iOEkV5+aSKnRb?=
 =?us-ascii?Q?ByxYynLaCKaGZuzKaGvBjfXMa8cJLtUjnK+Kb3T1Ip7FpWe2An0EDljgpItD?=
 =?us-ascii?Q?Ukp7NbK2bTfDGnup0/Mga3GmSmbVxVyhUquCQEEtE7TUP23QzJZqh26655vp?=
 =?us-ascii?Q?xT5IyhsgKRumu8u323aB3O+1I3pdYfLDgSdaaLYDm0A55u4OwWcPX0KzIJtC?=
 =?us-ascii?Q?MN+5kGDxw5eYcIIyRJpz776e5wixiWp/mEDzhKqG6MDfYinLgPBK7WsxALou?=
 =?us-ascii?Q?gHIfvHq1XYYpGDl4RHvlorXRCVe+Lcy0vj7XoDQagw7r6c5avqfR9E7dp6Sk?=
 =?us-ascii?Q?7Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f97853a-0469-49db-9fcd-08de05272e85
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2025 22:24:57.7048 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nQe6p9C+crkAGNHzR0YRy0zOwqWDMInmxz0J+x8rZSC2alBTn0bppwc3rB7X2FG4JKqlDqOpoJ9eW6RIwWGx5fyqz3AjWDz4hS4+XJjg2do=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8285
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

On Mon, Oct 06, 2025 at 04:10:35AM -0700, Matthew Brost wrote:
>VF CCS restore is a primary GT operation on which the media GT depends.
>Therefore, it doesn't make much sense to run these operations in

I'd need to double check the previous patches to see the entire
picture, but this seems weird at a first glance. The VF CCS restore is
not the single work we queue in gt->ordered_wq.  To me it seems more
like "in what ordered queue we are going to queue the VF CCS restore. If
it's global per device, why are we not using the device wq rather than
making all the GT wq point to the same thing?

>parallel. To address this, point the media GT's ordered work queue to
>the primary GT's ordered work queue on platforms that require (PTL VFs)
>CCS restore as part of VF post-migration recovery.
>
>Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>---
> drivers/gpu/drm/xe/xe_device_types.h | 2 ++
> drivers/gpu/drm/xe/xe_gt.c           | 7 +++++--
> drivers/gpu/drm/xe/xe_gt.h           | 2 +-
> drivers/gpu/drm/xe/xe_pci.c          | 6 +++++-
> drivers/gpu/drm/xe/xe_pci_types.h    | 1 +
> drivers/gpu/drm/xe/xe_tile.c         | 2 +-
> 6 files changed, 15 insertions(+), 5 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>index c66523bf4bf0..02c04ad7296e 100644
>--- a/drivers/gpu/drm/xe/xe_device_types.h
>+++ b/drivers/gpu/drm/xe/xe_device_types.h
>@@ -334,6 +334,8 @@ struct xe_device {
> 		u8 skip_mtcfg:1;
> 		/** @info.skip_pcode: skip access to PCODE uC */
> 		u8 skip_pcode:1;
>+		/** @info.needs_shared_vf_gt_wq: needs shared GT WQ on VF */
>+		u8 needs_shared_vf_gt_wq:1;
> 	} info;
>
> 	/** @wa_active: keep track of active workarounds */
>diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>index cf484a2da35e..05465f358c96 100644
>--- a/drivers/gpu/drm/xe/xe_gt.c
>+++ b/drivers/gpu/drm/xe/xe_gt.c
>@@ -65,7 +65,7 @@
> #include "xe_wa.h"
> #include "xe_wopcm.h"
>
>-struct xe_gt *xe_gt_alloc(struct xe_tile *tile)
>+struct xe_gt *xe_gt_alloc(struct xe_tile *tile, bool use_primary_wq)

If using the device wq is not an option (possibly because it would queue
with other undesired work going on there), then I'd rather drop this
bool passing here and make the decision inside this function:

> {
> 	struct drm_device *drm = &tile_to_xe(tile)->drm;
> 	struct xe_gt *gt;
>@@ -75,7 +75,10 @@ struct xe_gt *xe_gt_alloc(struct xe_tile *tile)
> 		return ERR_PTR(-ENOMEM);
>
> 	gt->tile = tile;

	if (!xe->info.needs_shared_gt_wq || !tile->primary_gt->ordered_wq)
		ordered_wq = drmm_alloc_ordered_workqueue(drm, "gt-ordered-wq", WQ_MEM_RECLAIM);
	else
		ordered_wq = tile->primary_gt->ordered_wq;
	if (IS_ERR_OR_NUL(ordered_wq))
  		return ordered_wq ? ERR_CAST(gt->ordered_wq) : ERR_PTR(-EINVAL);

	gt->ordered_wq = ordered_wq;
	
... or something like that so you use the xe info to decide it here
rather than passing it down as a function arg.


>-	gt->ordered_wq = drmm_alloc_ordered_workqueue(drm, "gt-ordered-wq", WQ_MEM_RECLAIM);
>+	if (use_primary_wq)
>+		gt->ordered_wq = tile->primary_gt->ordered_wq;
>+	else
>+		gt->ordered_wq = drmm_alloc_ordered_workqueue(drm, "gt-ordered-wq", WQ_MEM_RECLAIM);
> 	if (IS_ERR(gt->ordered_wq))
> 		return ERR_CAST(gt->ordered_wq);
>
>diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
>index 5df2ffe3ff83..9545c0c93ab6 100644
>--- a/drivers/gpu/drm/xe/xe_gt.h
>+++ b/drivers/gpu/drm/xe/xe_gt.h
>@@ -28,7 +28,7 @@ static inline bool xe_fault_inject_gt_reset(void)
> 	return IS_ENABLED(CONFIG_DEBUG_FS) && should_fail(&gt_reset_failure, 1);
> }
>
>-struct xe_gt *xe_gt_alloc(struct xe_tile *tile);
>+struct xe_gt *xe_gt_alloc(struct xe_tile *tile, bool use_primary_wq);
> int xe_gt_init_early(struct xe_gt *gt);
> int xe_gt_init(struct xe_gt *gt);
> void xe_gt_mmio_init(struct xe_gt *gt);
>diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>index 3f42b91efa28..25a1d96a68e7 100644
>--- a/drivers/gpu/drm/xe/xe_pci.c
>+++ b/drivers/gpu/drm/xe/xe_pci.c
>@@ -347,6 +347,7 @@ static const struct xe_device_desc ptl_desc = {
> 	.has_sriov = true,
> 	.max_gt_per_tile = 2,
> 	.needs_scratch = true,
>+	.needs_shared_vf_gt_wq = true,

as per above... I think this needs to be detached from vf. There may be
other reasons the wq needs to be shared.

If we just make them point to a device wq as suggested above, then
there's no extra issue with the ongoing work to disable GTs that Matt
Roper is doing (https://patchwork.freedesktop.org/series/154739/).
Otherwise we will need to think on how to reconciliate them.

Lucas De Marchi

> };
>
> #undef PLATFORM
>@@ -598,6 +599,7 @@ static int xe_info_init_early(struct xe_device *xe,
> 	xe->info.skip_mtcfg = desc->skip_mtcfg;
> 	xe->info.skip_pcode = desc->skip_pcode;
> 	xe->info.needs_scratch = desc->needs_scratch;
>+	xe->info.needs_shared_vf_gt_wq = desc->needs_shared_vf_gt_wq;
>
> 	xe->info.probe_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
> 				 xe_modparam.probe_display &&
>@@ -766,7 +768,9 @@ static int xe_info_init(struct xe_device *xe,
> 		 * Allocate and setup media GT for platforms with standalone
> 		 * media.
> 		 */
>-		tile->media_gt = xe_gt_alloc(tile);
>+		tile->media_gt = xe_gt_alloc(tile,
>+					     xe->info.needs_shared_vf_gt_wq &&
>+					     IS_SRIOV_VF(xe));
> 		if (IS_ERR(tile->media_gt))
> 			return PTR_ERR(tile->media_gt);
>
>diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
>index 9b9766a3baa3..b11bf6abda5b 100644
>--- a/drivers/gpu/drm/xe/xe_pci_types.h
>+++ b/drivers/gpu/drm/xe/xe_pci_types.h
>@@ -48,6 +48,7 @@ struct xe_device_desc {
> 	u8 skip_guc_pc:1;
> 	u8 skip_mtcfg:1;
> 	u8 skip_pcode:1;
>+	u8 needs_shared_vf_gt_wq:1;
> };
>
> struct xe_graphics_desc {
>diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
>index 6edb5062c1da..e9bcff2de563 100644
>--- a/drivers/gpu/drm/xe/xe_tile.c
>+++ b/drivers/gpu/drm/xe/xe_tile.c
>@@ -157,7 +157,7 @@ int xe_tile_init_early(struct xe_tile *tile, struct xe_device *xe, u8 id)
> 	if (err)
> 		return err;
>
>-	tile->primary_gt = xe_gt_alloc(tile);
>+	tile->primary_gt = xe_gt_alloc(tile, false);
> 	if (IS_ERR(tile->primary_gt))
> 		return PTR_ERR(tile->primary_gt);
>
>-- 
>2.34.1
>
