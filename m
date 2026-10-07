Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B305CA6002
	for <intel-xe@archiver.kernel.org>; Wed,  7 Oct 2026 18:21:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2562E10E657;
	Wed,  7 Oct 2026 18:21:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UF/nCOxN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50F8C10E657
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Oct 2026 18:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791397315; x=1822933315;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=WveNo9TtoavU2tk0Uv4qeLItX25OLFTxtjlye3J9w+Y=;
 b=UF/nCOxNIsWW306rxszL8wvS7fcG9uCVZGnGOyBgFTmyL7sc8gJNzM/+
 uXF3oDktYZWB9gi+szBBbSahjnbFX7o+gkPoh/4KYrzPWrG74FsyMQdyl
 YrkQ3eNYYqvIhOirY8VLXxWzvLgg7n+E0qgyZNRlmM7iq+YKFbPrdojuW
 0y4vQ3wKD2yfMRco3D2+WWrtNBz2PK3Ab5RG/4r/kTHPdGr4zsvUUw5sg
 23Ehe1ciJj6BPnPUOJnyRYCGen5bJkXB4vA2r7SbtSDbOCbGnYNp7Kdvb
 zigPY4KYqMAxmBGNPShq34gLOWYdv9CgeueU7X7b/BcHOUgXnlP1Y7oFU A==;
X-CSE-ConnectionGUID: K/r66LLNQmWswnksjnkLeg==
X-CSE-MsgGUID: mUj9TmpxQEu2X6Qg9CSdqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="66692"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="66692"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2026 11:21:55 -0700
X-CSE-ConnectionGUID: fVFnIVLdQx6EXb93O7jtQg==
X-CSE-MsgGUID: 7QNcHRpIQTmxFwaKAcUO2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; d="scan'208";a="303782832"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2026 11:21:55 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 7 Oct 2026 11:21:54 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 7 Oct 2026 11:21:54 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.67) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 7 Oct 2026 11:21:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q4DvICzGHw4ysksxWeNDhofISFj2klRFauu8tlpRPzl7yjHJ0TQAokZ2yKrzckKJcVJ50lK2twE+P+oKR7RgQAFSfvXVRoB9lJQTvxy7Z/jsdd4Wx3DTgNH70saQM8QBaVmlNLj2Txw5EM6Go6htc5ZMTznoqj1oCuKTmk7kCFO4WxKAefnKgqm1jXMKUFSFWYy2QeO5UA3E1gCsuax39ND8mUq3VFtmpkcieYJqD6Duh3bFD8Aj8DjihBti3HybHkA+gWuzWMapMLuFtGEDzxFBDUKSe+Ejf+NJ+uQn0+JrhJfs/EkAjmP7nvnRnr43ZyYmW3gATb+wwMK9XghYnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J+IoHtSOsCd8+uQFGWRlvxJcf2XcxlfX9zb3ZdfIN3E=;
 b=AxVxIQ7BpsNMKbPNrPJhP18DUXexqLSK8B1dGIyCJhaFzs5yXJxOypvPlMy8RJa7ct/zIDOE71/V+VbzHKFTL+MOtoBWlaZ1VeSVnyUIrzyNlOLzI1Sb8HOhM53G0hw6OkTa7caJUIe5usblacddWTIzi9DCBOyhvMBo2wVwffxYBjnow9WZqkWQtp8VFb3bNtZgX3oOjNz3mdhu2Nt1eW9kaVJC7C7L3dbRKSzC68jnVcl/+oGvj7tQxJXThIeFUvq3pEK4lBUXcrY0pfqEUzPD3Izoyy7syuiVnFaim62sNOzVbiIiRve2kVHlmCPocTVWf+895a2dH+RRW1s2Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB7180.namprd11.prod.outlook.com (2603:10b6:610:148::5)
 by SJ0PR11MB5006.namprd11.prod.outlook.com (2603:10b6:a03:2db::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Wed, 7 Oct
 2026 18:21:49 +0000
Received: from CH3PR11MB7180.namprd11.prod.outlook.com
 ([fe80::70dc:90b2:50b4:31a8]) by CH3PR11MB7180.namprd11.prod.outlook.com
 ([fe80::70dc:90b2:50b4:31a8%7]) with mapi id 15.21.0451.026; Wed, 7 Oct 2026
 18:21:49 +0000
Date: Wed, 7 Oct 2026 14:21:35 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Karthik Poosa <karthik.poosa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>, <riana.tauro@intel.com>,
 <sk.anirban@intel.com>, <mallesh.koujalagi@intel.com>,
 <soham.purkait@intel.com>
Subject: Re: [PATCH v8 13/15] drm/xe/hwmon: Get PCIe temperature sensor
 offset from xe info
Message-ID: <asaNr2xYdWYY-YDN@intel.com>
References: <20261006033534.3583967-1-karthik.poosa@intel.com>
 <20261006033534.3583967-14-karthik.poosa@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261006033534.3583967-14-karthik.poosa@intel.com>
X-ClientProxiedBy: SI3PR01CA0002.apcprd01.prod.exchangelabs.com
 (2603:1096:4:296::9) To CH3PR11MB7180.namprd11.prod.outlook.com
 (2603:10b6:610:148::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB7180:EE_|SJ0PR11MB5006:EE_
X-MS-Office365-Filtering-Correlation-Id: 296ab3d1-a4fb-48a7-9b16-08df249fda07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|22082099003|18002099003|10067099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: VsiW6oWkJI7ixETB8Y/r1ccoag6GHRmSPj7rCXNdnmG/bhGlC+CoH1R6QNsKsB7fBRs+/lIEQEpvN7JqOsV7pos/8uS6W1hG8t5qICHoGWT2JnVFyjNNVWY5H9Bx6U/W+POvW5CKVulvgoBar6BkHb6clC8/jV8zkVTNYSXeN6UMD4BdzuX3qaY8769Z69Ym4YV8RqgDllbSJNSLdcOCIL2LuCVqJze8OIZVrBO6Bdl0hUCuIRedjRNeDZDDZHQwMrosyZGwbOfXln7q+eHHhQtPhOoaBppdYMqTR+zq83UxL7vrLN2brRLXfTW1qhz+YBsTB/c77MxKPG3FTYMIjvjvbyu3zpLJPc5EwvGQ0/t7M5gFxh/fiOpGfbFGcbrE3SdNtwgVr0uAxh5JL0g8pS80jcR8uwZSQu6POTt0ATFe5KUEIJfEJoLYo9i2LEb2+P0bL1eAqi+kYGbLT8g2WzeEe9P9eNYl8HtWntqnu9BurnZRKJGZ8Mu5C+ICoQTL/FSqlml/tUnN04glaGZxtR773G/iv216hpaZW223G1DgxronJVE91IgCw29h/ojcSargwUANeuvywFsjUwvlTXnfsXOEIqM6uJz0TV1x7Gh9z8Nrjk1KTOZNofyLXqR4wTFk0ctVXh7LZmLh8dDp79folI5Bct0AVHXC/2oyZcY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB7180.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(22082099003)(18002099003)(10067099003)(4143699003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xs2m8vPQynPE+CcdMqnmOr01VPfXXdZygupU6f9BeHq5nozo3O7lC+p/Wukm?=
 =?us-ascii?Q?1GHLnxubuSTFUdJDyZ89D98TR8rSn2iwyh/IHPZXUsIdtWDpwOLmNr7dV0qe?=
 =?us-ascii?Q?e3G3RJQjncL2JWSBW8rjlxjXBjFT63q1rpRy1UkYWpOD/Cc0LuqjZwafWQ18?=
 =?us-ascii?Q?kSrigGXY8Kh8L3CuGd5kfxTkWCrGpGIJ22YBPgMahQZvu2kDtx9BuQEONjtO?=
 =?us-ascii?Q?qvkWqA9XiFJqNqZg0e2DBibGckthzzzFV/f4Mi2GMo127TXi4vzlq/TJp5ZT?=
 =?us-ascii?Q?OtWp9nY7iGcKt9vTYREDuUn4j1K/4BqmVi2a9wYaaXzP7Zaes5vt4ZEAeop8?=
 =?us-ascii?Q?2VDmTmlKQ1RZJu3VYOwTR+L5sGKafJcpHcsje7KaTBttOAhFjJuos1XtXe64?=
 =?us-ascii?Q?ki7RC/6aM4zDFlFwaUrvGbSMk11hj+JRctJfuEgorsmQ99D9p06hBoaEiAhg?=
 =?us-ascii?Q?uUfYDtcUcTPDq/qK/t8O/kwwjR+3YZo0NP1IwGcIdt/dNe4NS6AgIuS14hm+?=
 =?us-ascii?Q?M+e2q9Ya9asEv6MD4jMuLCj7dNUoGYF99cUC/2mqPpmkEA0YxYDq+LURZNKV?=
 =?us-ascii?Q?a9C6aXerYNrBoO1oeNqE4odTOJmRkiVB7aJwo6m4g53HhTeLYJNZ/8XDVDh5?=
 =?us-ascii?Q?FIuNasq1NfB2COPfdWY5p5buPJVcpJFKL4Hs+GWAhWIRpGDup3ymFTv5jIZG?=
 =?us-ascii?Q?3ibqOhrxwdbaWbv1a47oKi/VJ4iX1hVmNrmKqh6X9c4hVBPu7YpPBm/CLnta?=
 =?us-ascii?Q?947YAUWW5GsCglB0eEbmB8m+J55W1sptZzRrYLgkdbChx3E329Qb9ihhApzh?=
 =?us-ascii?Q?c/67vtE/FzEupMiOBEzmhyi9cO6JiQ80Jv5NF0pcrVogBwX9MJoFpq54IJF8?=
 =?us-ascii?Q?dRrMIe6FhAESGsbhlu2DmVIQD+Z4OegoaCGEuROzRerEHh3DJlXRiZ/BPVx8?=
 =?us-ascii?Q?9npWi5jG0TH7pwudIz71OOEcCO157QLLL40C4eOPTh2A9Zqlt3kVCl5lKxND?=
 =?us-ascii?Q?YG1bcKuQEJk2fz70vRZjEF67IcIY9u2pdwz53YQY15F/YowmY0k31l38dJOk?=
 =?us-ascii?Q?k6krVFgjG4BIXo6YTaGx2iofpTpNcRGjkd+4sBKaWKnLwhDvyTtU0TJzQgsl?=
 =?us-ascii?Q?/dXRkonaGyUNF+d8lYcn+zdp999rfLlX0DZ+ksaJkEfVzp6gj1/peu4lWOHA?=
 =?us-ascii?Q?Z4ZkOxeEKqKflhCFdiEwPkFCvNJGLokP3sHoHM4BPcJzBoL2Ayp+mLCpMgPS?=
 =?us-ascii?Q?LHwUAw87VYr57gcTL/OsVGF7B38axpWACIVS+wAL25tlf7YudYWEJrcD+zhY?=
 =?us-ascii?Q?2VAM4XeWKKMgUNZxL22Alp4Ssv2yPWSuOvxMb2D0ryh5pv76CJJh9HNRHA5h?=
 =?us-ascii?Q?utMCcmKKJXiUFB0wDNozxtXx0F+qD+2TdJbrCDSxh5sILIA+VYhF18LOitKo?=
 =?us-ascii?Q?zB+XozVBqVTNb6pw9aXmDxkxFX6xErXN5yKmu3wuO+OquEPXFQDkYRuXpx/7?=
 =?us-ascii?Q?Mb4k33Yo9BFg1gkYcdWsB5Trksp2OuAjWGRjna9VTT8QdMUwLyx6OcuBoY6+?=
 =?us-ascii?Q?stHl0Tw8cz74o8MnAE+4ngY5aDajR6MntoD+Pv4NmOCCVsOhLEsfUF22I+tG?=
 =?us-ascii?Q?x0LWjtY0yjZa7r1LsdAZMumxkSATdgbFc0C0zANyg9sIfdsxKjJdJyiZmOqV?=
 =?us-ascii?Q?KYsvDqqvVZuU/XdTMgRGUL2rHRbgdJfyNB5z9XzIHSCnynAXCXp7RHzQPe2P?=
 =?us-ascii?Q?RkCCSm1AMsWHYVIKoJqNQJDOXnmCNu8=3D?=
X-Exchange-RoutingPolicyChecked: nUqN4hpVlKgoH1ig0ixfBvYvtlNuDS0Ud3I/ygMfoGDi8X7MrMQI6Q6Vn5140vLL6myvkGGYlWlEpnmLnr/nuwwzsOLOMSAQYk9DMWWCt2n4n0vjoARhws628PMdFQVpuYAHVFagkAeGvQGtmcgKnlMjV3+Icxn2RPYJJQoKBQggok0lWek/VDalx+7j9qtgEDMVaQeZiaOptZLWotCibamNCk72MTvpV8rkYdZv4kT94XgjPtW+TiLNmsgW4oF6V1TSuaAfnye4kbyfjjhMuOLeJoa3wT/4MApNYs9CbS6j+kpLmZPNQNvVVE9UWX8288dC+gbj+DLOyYpyPulIWw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 296ab3d1-a4fb-48a7-9b16-08df249fda07
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB7180.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 18:21:49.0444 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uYc96W9YA0c0p1fe7yqT9Sk/X/YgB00TdHiGnzGj9T62VqVHRNicgjGIiEeo7pqZrQUZi04yl5R0J05GI7oiuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5006
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

On Tue, Oct 06, 2026 at 09:05:32AM +0530, Karthik Poosa wrote:
> Store the PCIe temperature sensor byte offset in xe device info and derive
> the thermal mailbox group and byte from it. Read the configured offset
> inside get_pcie_temp().
> 
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_device_types.h |  2 ++
>  drivers/gpu/drm/xe/xe_hwmon.c        | 14 ++++++++------
>  drivers/gpu/drm/xe/xe_pci.c          |  4 ++++
>  drivers/gpu/drm/xe/xe_pci_types.h    |  1 +
>  drivers/gpu/drm/xe/xe_pcode_api.h    |  2 --
>  5 files changed, 15 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 161ba2b27f47..4b2da72ed136 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -164,6 +164,8 @@ struct xe_device {
>  		u8 vm_max_level;
>  		/** @info.va_bits: Maximum bits of a virtual address */
>  		u8 va_bits;
> +		/** @info.pcie_temp_sensor_offset: PCIe sensor byte offset in READ_THERMAL_DATA */
> +		u8 pcie_temp_sensor_offset;
>  
>  		/*
>  		 * Keep all flags below alphabetically sorted
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index 7fe3ba422cc8..54b2fd29ccbe 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -1018,17 +1018,18 @@ static int get_pcie_temp(struct xe_hwmon *hwmon, long *val)
>  {
>  	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
>  	u32 data = 0;
> +	u32 group;
> +	u32 byte;
>  	int ret;
>  
> +	group = hwmon->xe->info.pcie_temp_sensor_offset / sizeof(data);
> +	byte = hwmon->xe->info.pcie_temp_sensor_offset % sizeof(data);
>  	ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_THERMAL_INFO, READ_THERMAL_DATA,
> -						  PCIE_SENSOR_GROUP_ID), &data, NULL);
> +						  group), &data, NULL);
>  	if (ret)
>  		return ret;
>  
> -	/* Sensor offset is different for G21 */
> -	if (hwmon->xe->info.subplatform != XE_SUBPLATFORM_BATTLEMAGE_G21)
> -		data = REG_FIELD_GET(PCIE_SENSOR_MASK, data);
> -
> +	data >>= byte * BITS_PER_BYTE;
>  	data = REG_FIELD_GET(TEMP_MASK, data);
>  	if (!mbx_temp_valid(hwmon, data)) {
>  		drm_dbg(&hwmon->xe->drm, "PCIe temperature not available\n");
> @@ -1168,7 +1169,8 @@ static bool xe_hwmon_temp_probe(struct xe_hwmon *hwmon, int channel)
>  	case CHANNEL_MCTRL:
>  		return hwmon->temp.count && !get_mc_temp(hwmon, NULL);
>  	case CHANNEL_PCIE:
> -		return hwmon->temp.count && !get_pcie_temp(hwmon, NULL);
> +		return hwmon->temp.count &&
> +		       !get_pcie_temp(hwmon, NULL);
>  	default:
>  		return false;
>  	}
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index e754668100cf..1cbd49933b2c 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -421,6 +421,7 @@ static const struct xe_device_desc bmg_desc = {
>  	.has_flat_ccs = 1,
>  	.has_mbx_power_limits = true,
>  	.has_mbx_thermal_info = true,
> +	.pcie_temp_sensor_offset = 10,
>  	.has_gsc_nvm = 1,
>  	.has_heci_cscfi = 1,
>  	.has_i2c = true,
> @@ -793,6 +794,9 @@ static int xe_info_init_early(struct xe_device *xe,
>  	xe->info.va_bits = desc->va_bits;
>  	xe->info.vm_max_level = desc->vm_max_level;
>  	xe->info.vram_flags = desc->vram_flags;
> +	xe->info.pcie_temp_sensor_offset = desc->pcie_temp_sensor_offset;
> +	if (xe->info.subplatform == XE_SUBPLATFORM_BATTLEMAGE_G21)
> +		xe->info.pcie_temp_sensor_offset = 8;
>  
>  	xe->info.is_dgfx = desc->is_dgfx;
>  	xe->info.has_cached_pt = desc->has_cached_pt;
> diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
> index ce0b0f6c5b18..a613bd4ed94c 100644
> --- a/drivers/gpu/drm/xe/xe_pci_types.h
> +++ b/drivers/gpu/drm/xe/xe_pci_types.h
> @@ -34,6 +34,7 @@ struct xe_device_desc {
>  	u8 va_bits;
>  	u8 vm_max_level;
>  	u8 vram_flags;
> +	u8 pcie_temp_sensor_offset;
>  
>  	u8 require_force_probe:1;
>  	u8 is_dgfx:1;
> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
> index 94575c476e3d..00c4fc7d0124 100644
> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
> @@ -58,8 +58,6 @@
>  #define     READ_THERMAL_LIMITS			0x0
>  #define     READ_THERMAL_CONFIG			0x1
>  #define     READ_THERMAL_DATA			0x2
> -#define       PCIE_SENSOR_GROUP_ID		0x2
> -#define       PCIE_SENSOR_MASK			REG_GENMASK(31, 16)
>  
>  #define   PCODE_LATE_BINDING			0x5C
>  #define     GET_CAPABILITY_STATUS		0x0
> -- 
> 2.25.1
> 
