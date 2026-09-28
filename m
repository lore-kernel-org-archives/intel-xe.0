Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8112CA5FA1
	for <intel-xe@archiver.kernel.org>; Mon, 28 Sep 2026 17:59:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5C9810E1ED;
	Mon, 28 Sep 2026 17:59:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Udq27zbk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6558F10E1ED
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Sep 2026 17:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790618371; x=1822154371;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=JMCg5PWdPHAkaFrfowip3uXKwFBe7CGrHP4CPiA72Y8=;
 b=Udq27zbkCEmipsx27L5mZKIkmW1x5a02p4KW1D8+NPlHNgKyxaKwQz2i
 Mzlx6x/Gr0BvzZAnkGoPV0fsTdyGlydxJfMN7H6LCacXdls3Y/rh6lvV8
 u6ie/L0XpR6mH3uoUnrTLwtp5zKiYuK5mMeF0BLTinS3V8oPz+f/Y8hYf
 wErjAg6mNTWgdlDK3K+39nwKB4VFnpwrmfb8rvkrNrWwfk9LiVRdmD1eI
 NNLIGbTH9nQ1PqPZyB6EH4fUlmZyYQQni1ewqaIkfQbVIyacRjuJXJ/52
 5gm/sYr92O80OqjCQZwO5q4XyftDnDhpPmywbBNV3kifaU0vw6hPF4Qcu A==;
X-CSE-ConnectionGUID: Gq7BJP+KT/eTLjt4Okw6dg==
X-CSE-MsgGUID: /UAjZESwREa+pJQ62XXKwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="90089834"
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; d="scan'208";a="90089834"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 10:59:31 -0700
X-CSE-ConnectionGUID: iKfQndyVTEmaxKlbp3nr3Q==
X-CSE-MsgGUID: u5K6s56CQ6uj1wtq7AhWHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; d="scan'208";a="278319743"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 10:59:31 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 28 Sep 2026 10:59:30 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 28 Sep 2026 10:59:30 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.31) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 28 Sep 2026 10:59:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A1u0MSFLOc1rptaVNRxfOtPn1ptQl7CYfzpbu78Q2AKXDrGP0P+pO+7+tXv1rMwNMEu+imr/Kd4MMymyTkfqShdIwFRVbzJ1Av+tQccN4Pi31Tw2PSAEilDEPeNOGAa+MAlgtxnHTnj1ATsshtWZ/l/cHHUTpm+iAM8wr+7V+J5KSEppBN8RBRyisSzb99O686bJXBximbBvmEbrTocKMyrYTwCMa1UlJ0DTz35KHspkWX49f8ewaG54rLBrrpgonpOTcNPkHikLVF3lws52y1QlN4tMY/mNBNAjO8nfxbn/4ENV4lkcL56QUi0pLgioNJmPkRZX6D2aQC0UoibuXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Weh2iwuCE6gSl2tgWdCtpN+b7lmn5kpAi2wy8eWxegE=;
 b=BMyq7IT+j7M+pbeY2MR0hmrt7ALlr4jW6gBVmOV+T8Hm8UPvmun/T5vBFjoEgGsGtBZZQHbjqNe+h9SaCySk2c5DTR44uOvRfpP4N3BhOFF2TfhNQLQfgTdcP+X9sERlE0KfZrYz9g5T12Bs6Whx1HHbY2uDDzB09GzrcuVRQcjDmQTOZJOgUqnKRsKXtyWh+8QubuW/31tob+R/MGtMwaZtqH4Yg6l3EUggx86fPgzONwCPZ2RFxcuIGt/lZRilUdt44x4hvXMoCKtnKd2DEBYj43267F3+kPggTmh2aYNqBHMfEbK2HkMR60YgUkcyA8JkaADuoMmASxE0K2gx9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by CH0PR11MB8087.namprd11.prod.outlook.com (2603:10b6:610:187::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 17:59:27 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 17:59:26 +0000
Date: Mon, 28 Sep 2026 13:59:04 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Poosa, Karthik" <karthik.poosa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>, <riana.tauro@intel.com>,
 <sk.anirban@intel.com>, <mallesh.koujalagi@intel.com>,
 <soham.purkait@intel.com>
Subject: Re: [PATCH v6 04/13] drm/xe/hwmon: Add helpers to validate thermal
 sensor readings
Message-ID: <arqq6N8GUMMYm9zv@intel.com>
References: <20260924205429.2846256-1-karthik.poosa@intel.com>
 <20260924205429.2846256-5-karthik.poosa@intel.com>
 <armyqeTPA83vcjMv@intel.com>
 <54b739c1-f86f-40fa-ab43-0edf72840b8e@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <54b739c1-f86f-40fa-ab43-0edf72840b8e@intel.com>
X-ClientProxiedBy: SI1PR02CA0031.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::11) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|CH0PR11MB8087:EE_
X-MS-Office365-Filtering-Correlation-Id: 800f5a3f-ba21-4fa1-e4c7-08df1d8a3c15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|3023799007|10067099003|11063799006|56012099006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: u4K+1k4u43iFWk9F4+Q9wrZmqJ2/yZKD2AMHiKUzUPa/RAKlqW985RQQjErnFomV/D/nEv/lXrPusInT6OeSuKApIf/EqVLaz/GBIZLoyAsvIhJbpJwdgI6GCV5OIU9RXT/dHosC1ifGXGmSrqFteqSE9E39KYiOSdVecFeMD/Vg9pS0+SbZ5NqLTxGv9Ik2dlOLo+oXBq4bcgNc4e0mMcPfxauOpFawF3dep7JpEDkuwSovjfJ17po08ZIvlRFNiiAsyQ1gfeTrcvdlibShE1SLPuo8P+Umb5PEDsylh0GMLc7DGz7JzHog1qth8DWmXy+dRr92xEYAQdarSL3eCILYGpSI8n3OrbAW6p//vtzl0rol13VW+L5dRxbYPY766mgj5LQbtfUoqudkK19ccxj25POcUKiF/9TUSaTkyGY+J57Mi3LFW6tPm38xCEgCAKUht/+Z0sNZGusH9/n+TIoGDNleXbc/AyIoiOUW4LK7TP0pZ/bTsZ3hUwWCEiGQhFEjD9u+uXFu2/7KXoX2E327aZ9VZcPuzMAFASMEOLgkoO2FpSC1hAAC2raOSJd7mbEsB9l5io8UC5UlRLOPG7bRU3uSqH/iKenv3klCpuOZqRX3tdTnyeBdiB/YeKTLsoAxiwvumk02ONJKBKgMqjRScNi8JZW5F8LAn/TrPVs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7187.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(3023799007)(10067099003)(11063799006)(56012099006)(4143699003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yJkMBqVHa+E2RHT6PFJa5rkrAqHDx2TPHKYy2kyXAu27IwUxaMgvuNUuxv6+?=
 =?us-ascii?Q?BONK68CcL8l7cZlYlQPQSJfhXk429FH3LirvF3wCXXs83u37GRCJAQ9Gvc4G?=
 =?us-ascii?Q?WoauASecDEvasunYJJ2vAkdPsmCvgsjkgrh2fY9hMyPth8kVU5+h4ksr1Ff9?=
 =?us-ascii?Q?dwwnhnPq3yO7PQSVCKc4Rz3T0NufiRtBnmlxZcSjJYknl9HVGphC1Uv1Jxob?=
 =?us-ascii?Q?Z8WhmPKJGdAvm5PtQjW6xFjGG1/zIYTkXXcVPWsfVghpD89ORVt2ijivzRoS?=
 =?us-ascii?Q?aGmGaRJw7AGXBfUpnefiqzQTX5QA920BziKxqWjh8Iidxs3Q7PvqPIlbMjra?=
 =?us-ascii?Q?egkF0FUy93Mls661CWHRGBG+zszDSYXhiJOfb68QwEFWLyzkbZJu+D4uGraZ?=
 =?us-ascii?Q?97YRZLpm8FvP30AOL/vgRYykhI3UibHWPVEf6BbVAYLBQijUpb2lAmfPUjfQ?=
 =?us-ascii?Q?G/dMpdgLRp4POdhfYy6VNd9JFGcUeShXvu+KMHJXmb2+38I3HqRc0HsNMoby?=
 =?us-ascii?Q?oN+Bh4ocLO5yHWrQPpdcz42//u1JlwU3YXBaXuIxaa51wrS+JymPkgFGjvoH?=
 =?us-ascii?Q?+Kp4mPuKJzU5izDn3T8Fj+I5KCINaMY2HnzOQ+AD16Y8JUi/Pz7VN1ceWgNy?=
 =?us-ascii?Q?/ZjqnTpuTqkEO3euZAr017qiefrfO0huBdEvv5ttJNlqPcjWaNS4357sdJvb?=
 =?us-ascii?Q?MRn89SiGRaV4zvKlUzEQw26FJqBRNoHX/Sqxjnl9jdl+z3JWIdzyJDlDzAQK?=
 =?us-ascii?Q?qADCPZsE+6P/y1wRR9bEHPpZyzbXTq8ZfZR77vlILERgDLb8zU6hFfJp6j6N?=
 =?us-ascii?Q?szRkj09K980sbuKdMv1NFx2PlUGTrtID9+IFSMhes8W8lnSPOY9VfNKIQpC3?=
 =?us-ascii?Q?JtO1KhpVxMmrznz7D+wHp8wZ/40UJ2jyg/TgNgz3RoHFMOsPdkaJ60nZ1XKo?=
 =?us-ascii?Q?/z2UF9G3x9Ex/mbL4GGeNFBqehyZmh4KxvQEO6JJ6Ur7ukzpn230lFlYQ/eP?=
 =?us-ascii?Q?QukvMbWPUGMRTS2ixvsSsgtk2vKUfb72+1Br115mqFaea4RmlahOwYpmiY5P?=
 =?us-ascii?Q?82w/KdBkuqbZk+u2PaWaERPdao3z+jUS4+zZbWnGXBaqoa3VXxz8Whb34T4o?=
 =?us-ascii?Q?MU3tCV/cL7yYYRlK/Qb17lG2aDIvQn8XWi7IstuVBOybULNMXjLtWvgu0YkS?=
 =?us-ascii?Q?oO9nihyUB/rUV+yqgZUvBrZ3PehtLQp39/ZOORWdbVAQ/Y8QkqyKmVYp0J95?=
 =?us-ascii?Q?RUkuTyngaCeE5ZpZ/AEfjdMfweSSoVuHa3MSq0O/1M10l6obUMx0FiZsh0B8?=
 =?us-ascii?Q?D0gnMAabdfD5RHBd8P+p1kk9xpE8SIBK9zcmKxuMzRRDNMrsc+527+cUsjKd?=
 =?us-ascii?Q?jkE/gI8otmhxulpW7iHZaQMR95YfuewQ0zdE7xklA3JrjrRCfL3EDmJh6mSF?=
 =?us-ascii?Q?3WyjsFDr4l22WgqxV7AjDwMJCsHnHxWQ+80pOnp5bCTv/blm5nhqVaEXlLK3?=
 =?us-ascii?Q?z6MAvhUFqAF7MXRYCLpaPEpwdZnEyb5nJRl/rcL+H53zP2FZiFBP8eshCQE1?=
 =?us-ascii?Q?O9uKmvP0MUAqSiExNHvP5cHOIGt3wndsqYuPpzd7q1/dFfp1yBBUTWmbaPHp?=
 =?us-ascii?Q?dVfMAtIyFp5HWzO5HegZrKEV5u90Kvzid2GAOmkjweI2a5G/JpTw5uSPvgYL?=
 =?us-ascii?Q?C1INRQLpMYAJSQM2ckephQyXwubP6YLcuF7OSHgzDt80InIT3QCeVesyxG5S?=
 =?us-ascii?Q?51eyRqsNZCkBQGsMzdqIIyqlpG58M9g=3D?=
X-Exchange-RoutingPolicyChecked: Ju9jA/7Lbr9AYIRRzKsiLEU9QTcEFaCXdRDSPIDYQ453/ImMJkN5yuXn3TXKSo+J/8fH3p7FtH7LKoQa0FNzkdobFSml4C3uMiInEjPeJbTytpZUWtyVp0LV2843tNVLHdps3rlyxXmGBtT3tLJ38aXsiE+2c11ToLO3V4T6yFzZQqaepD2OH4I3Nma+uSzVwGJtF10G2qIE35jTpGBkiLBF8W96EfU6owQNkbeH+wobLEqckl0WcxOrflTPHNry9FM3pv+uiLSKeRsXqHCQ87+ANBRjGm3BZgrOcgqJJmYDRDtvzcHdREtsOYhhl2FljFO2E2P4NsGzSJDQt0JyfA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 800f5a3f-ba21-4fa1-e4c7-08df1d8a3c15
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 17:59:26.7299 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4B0mF+tsOei+TPV6EiJR9D+TIlOZg6NYM1C3wNjtuqUwJijjf30vBAPwypRRVadNmGrGsKYBCgp8hH8tq2BeUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8087
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

On Mon, Sep 28, 2026 at 09:38:06PM +0530, Poosa, Karthik wrote:
> 
> On 28-09-2026 05:49, Rodrigo Vivi wrote:
> > On Fri, Sep 25, 2026 at 02:24:20AM +0530, Karthik Poosa wrote:
> > > Add mmio_temp_valid() and mbx_temp_valid() to check whether a temperature
> > > sensor reading is valid. An MMIO value of 0xFFFFFFFF or a mailbox value of
> > > 0xFF indicates the sensor is unavailable.
> > > 
> > > Gate these checks behind has_mbx_temp_sentinel, enabled on CRI currently.
> > > 
> > > Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/xe_device_types.h |  2 ++
> > >   drivers/gpu/drm/xe/xe_hwmon.c        | 16 ++++++++++++++++
> > >   drivers/gpu/drm/xe/xe_pci.c          |  2 ++
> > >   drivers/gpu/drm/xe/xe_pci_types.h    |  1 +
> > >   4 files changed, 21 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> > > index 4661bfce2f4e..87554605fa41 100644
> > > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > > @@ -202,6 +202,8 @@ struct xe_device {
> > >   		 * pcode mailbox commands.
> > >   		 */
> > >   		u8 has_mbx_power_limits:1;
> > > +		/** @info.has_mbx_temp_sentinel: Device has temperature-unavailable sentinels */
> > > +		u8 has_mbx_temp_sentinel:1;
> > >   		/** @info.has_mbx_thermal_info: Device supports thermal mailbox commands */
> > >   		u8 has_mbx_thermal_info:1;
> > >   		/** @info.has_mem_copy_instr: Device supports MEM_COPY instruction */
> > > diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> > > index c743867a2ebf..8a1dbe708828 100644
> > > --- a/drivers/gpu/drm/xe/xe_hwmon.c
> > > +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> > > @@ -104,6 +104,9 @@ enum sensor_attr_power {
> > >   /* Index of memory controller in READ_THERMAL_DATA output */
> > >   #define TEMP_INDEX_MCTRL	2
> > > +/* Mailbox sentinel reported for an unavailable temperature sensor */
> > > +#define TEMP_MBX_INVALID	0xFF
> > > +
> > >   /* Mailbox temperature is sign-magnitude: bit 7 sign, bits 6:0 magnitude. */
> > >   #define TEMP_MBX_SIGN		BIT(7)
> > >   #define TEMP_MBX_MAG		GENMASK(6, 0)
> > > @@ -822,6 +825,19 @@ static int xe_hwmon_pcode_read_thermal_info(struct xe_hwmon *hwmon)
> > >   	return ret;
> > >   }
> > > +static inline bool mmio_temp_valid(const struct xe_hwmon *hwmon, u32 value)
> > > +{
> > > +	return hwmon->xe->info.has_mbx_temp_sentinel ? value != U32_MAX
> > > +						     : value != 0;
> > _mbx_ seems a wrong prefix now...
> you are right, I can rename to .has_temp_sentinel
> > 
> > And this patch is kind of hard to review alone without its usage...
> 
> shall merge this patch with the next 3 patches then ?

nah, just rename it and feel free to use:

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

since I ended up already checking the usages anyway ;)

> 
> [PATCH v6 05/13] drm/xe/hwmon: Handle unavailable memory controller sensors
> 
> [PATCH v6 06/13] drm/xe/hwmon: Detect unavailable PCIe thermal sensors
> 
> [PATCH v6 07/13] drm/xe/hwmon: Consolidate temperature sensor availability
> checks
> 
> > 
> > > +}
> > > +
> > > +/* Mailbox temperature is sign-magnitude (bit 7 sign, bits 6:0 magnitude). */
> > > +static inline bool mbx_temp_valid(const struct xe_hwmon *hwmon, u8 value)
> > > +{
> > > +	return hwmon->xe->info.has_mbx_temp_sentinel ? value != TEMP_MBX_INVALID
> > > +						     : value != 0;
> > > +}
> > > +
> > >   /* Decode an 8-bit sign-magnitude mailbox temperature to degrees Celsius. */
> > >   static int mbx_temp_decode(u8 value)
> > >   {
> > > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > > index d66d5a0339ae..e656fc012902 100644
> > > --- a/drivers/gpu/drm/xe/xe_pci.c
> > > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > > @@ -476,6 +476,7 @@ static const struct xe_device_desc cri_desc = {
> > >   	.has_gsc_nvm = 1,
> > >   	.has_i2c = true,
> > >   	.has_mbx_power_limits = true,
> > > +	.has_mbx_temp_sentinel = true,
> > >   	.has_mbx_thermal_info = true,
> > >   	.has_mert = true,
> > >   	.has_pre_prod_wa = 1,
> > > @@ -796,6 +797,7 @@ static int xe_info_init_early(struct xe_device *xe,
> > >   	/* runtime fusing may force flat_ccs to disabled later */
> > >   	xe->info.has_flat_ccs = desc->has_flat_ccs;
> > >   	xe->info.has_mbx_power_limits = desc->has_mbx_power_limits;
> > > +	xe->info.has_mbx_temp_sentinel = desc->has_mbx_temp_sentinel;
> > >   	xe->info.has_mbx_thermal_info = desc->has_mbx_thermal_info;
> > >   	xe->info.has_gsc_nvm = desc->has_gsc_nvm;
> > >   	xe->info.has_heci_gscfi = desc->has_heci_gscfi;
> > > diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
> > > index fed509ff601e..0041ec5676d3 100644
> > > --- a/drivers/gpu/drm/xe/xe_pci_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_pci_types.h
> > > @@ -50,6 +50,7 @@ struct xe_device_desc {
> > >   	u8 has_late_bind:1;
> > >   	u8 has_llc:1;
> > >   	u8 has_mbx_power_limits:1;
> > > +	u8 has_mbx_temp_sentinel:1;
> > >   	u8 has_mbx_thermal_info:1;
> > >   	u8 has_mert:1;
> > >   	u8 has_pre_prod_wa:1;
> > > -- 
> > > 2.25.1
> > > 
