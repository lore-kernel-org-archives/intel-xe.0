Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 351B0CA5FAD
	for <intel-xe@archiver.kernel.org>; Tue, 29 Sep 2026 18:27:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D57DE10F005;
	Tue, 29 Sep 2026 18:27:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FlfK4b3L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF90310EFF1
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Sep 2026 18:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790706417; x=1822242417;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Cm+VAzooh1y+/LukJP/MiDibxsmAQNm4h1wBE4Yfjm8=;
 b=FlfK4b3LRkBuRexeiMITDlNep1zpuMuqulwcNocsZMC/IayWyZklMWMd
 3CfW8ZgCokzbtZFpyWemYFNe45bDoFKfFH6LkQ5VCVg0l239dx1bwO8ww
 934RSLqXDO6kgJdpvcX1TVSYMz/FVVBWYXh14A46w+IYr+Ue8/xl0Yg8X
 Hx5ikN2R7YdO3kpwiN3sTzfomqEtWR/Zp5zMHhL/REa11CVdbQP+JZfqi
 IWBN/LCAhkL5lXYjfV6zvo8cScdxuc3aJpkGzJM+sNTSe+ILpkrjQCFfh
 xhnSoTnacE/LtfCZmwoWoaBbK/PKtMWW3TsnPdThddzZ0tBeJ4b0eQUQB Q==;
X-CSE-ConnectionGUID: qD1HgwQTTJCCDICjsu1dJg==
X-CSE-MsgGUID: zZ+QX5r4Rq2daeufUtiuXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="95248897"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="95248897"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 11:26:56 -0700
X-CSE-ConnectionGUID: ABF1ZgXWRhOx4gr1Y/wO7Q==
X-CSE-MsgGUID: Agxe79/yQQuhjCLByNr8lA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="304954701"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 11:26:57 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 29 Sep 2026 11:26:56 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 29 Sep 2026 11:26:56 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.34) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 29 Sep 2026 11:26:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m71qhU6Emt4VV8lPU9w+5CkOSao9+tr3+Hi5Ovy4kuTrQGUP9qQUhPnSWjd39bA5LkUjF90J5hgxnZTPqWBahbt1WWDCb5lYVxIe6gjgkcl8u0cnhhObCJNFOW1J5vxzJvRYwMOWmCFh1UZEKQfYUiV3mfLI2mYQCRFa1tZTGbxO2+vwIO33IV2SwK3uQ2n9gWFJv8k3fpvxYaoMq7orGOolglBqDQfEsG93xPT+6f0BZr/1wF47YBRc0gitdZQqBdmmN98gjmq5Kcqiw+ZeguhLLke0EN4FxyjyZOPvs7raq6ap14AaKHPPvScjQY+Bp9UQN1vITHl/idNdLtz60g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jCRmwmAVY6LqidDdBmu2vDVZIy6T3uklAskPtpRO11E=;
 b=dAKKUyqmuBahvW2iOHtdKKYyhJl1fs+mNJWfo+vJqTnE0eim/eFebmbZpLe46TcmAHK0Q/LNFvlLSC7sfdYXuad/fWcZ3MTSc8tBuWT+3P46neiMOwe8OPl8+ot6+pOY06eE+g+DCT61LjR1yHS6oslSuQYefE7uWN+PThRD9Ws++hNJp2YPJNuFfSpGZyKSUMe/m6nxvpDfcqO7JheHQjZNxOLk3fjxRRHkOasuynxtRK5H5GschTAZ54qXYi8W6uyNhVYh9bPCkyK2s9YqhmUhGIEUo6xtECtvQWMoIASvEMwkpTh/RIc2v6myXQ+I9NS8UqAkQ1h+QLPd3lvsFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by MN6PR11MB8147.namprd11.prod.outlook.com (2603:10b6:208:46f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 18:26:52 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0451.026; Tue, 29 Sep 2026
 18:26:52 +0000
Date: Tue, 29 Sep 2026 14:26:37 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Poosa, Karthik" <karthik.poosa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>, <riana.tauro@intel.com>,
 <sk.anirban@intel.com>, <mallesh.koujalagi@intel.com>,
 <soham.purkait@intel.com>
Subject: Re: [PATCH v6 04/13] drm/xe/hwmon: Add helpers to validate thermal
 sensor readings
Message-ID: <arwC3cQwJNROLqDt@intel.com>
References: <20260924205429.2846256-1-karthik.poosa@intel.com>
 <20260924205429.2846256-5-karthik.poosa@intel.com>
 <arrCNETSdIpLzF-n@intel.com>
 <f9fbd2b5-1290-4a3e-a439-96cf8c124bc0@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <f9fbd2b5-1290-4a3e-a439-96cf8c124bc0@intel.com>
X-ClientProxiedBy: SI2PR01CA0043.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::12) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|MN6PR11MB8147:EE_
X-MS-Office365-Filtering-Correlation-Id: 261c2b25-65fa-4c27-9798-08df1e573b52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|56012099006|4143699003|11063799006|10067099003|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: VUUlylscf0Xl+zMELHA12RK+p2kqyn65Ig6YDh5sRJZEi3wp6MWSGWuoBnaNYs0cORV+GKq9E48ivwamUS4tLrtk919USuULrNt70n+XrcywMeb/3lRP/uH6xjTzoPaY0HoyV1V2/Fo3x2ImQVp4xpkPSQcWZuESCsPEUll0x7I8MhXagE7QBrwX4EOAbviB8wEaVqVEOU+Z4uIyaF+O+LVX70F1KTVN0ZH1y65S/hNH5uoMT/XmCc7BNPV8AzE4g2H1Gqyz4JBr7PeknE0rut3R4rZrPc75vP7p/gUm3eCYfOqgmJS2EDnHJr+FCzZG6W41x46zFf5P23HGdsnLz5blFgYbNOqF3P9Yi/oHjDfDyXfKQEdVnmeLk+R/QaPYN1zU3NeTiRLFX64WCV+WqXOqS+cxU3mDr27p0XWMO0sbmSjzCxH6g6atNpeZOGHi6QBmZhS9FaQddWbINTJwc5xg269Ts6F51Ka1EBcFphuVI1sAY1tb4TDTiKCOm2aw3AX83pcRKlcblo40euZzNVpbg/TvMqcJ8psJeAouVd6CyS7TYsKhZXJYFwdsoBN7sMsUczJSBTtUQk3GkM+XmNwzTyEO7PUndIcrPOjfvQIzrUo7FAT9U6hgVbRqcaQIT3nbziWdqmPbn57MBC8jFz0jTCJOymvSee9JJ7Cd+o4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7187.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(56012099006)(4143699003)(11063799006)(10067099003)(3023799007)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?M/MqRyum/TAxhVsO0kBgk14Og8ly8Sft7OJg95QIPa9KHTkRWKHC8gzrr3sG?=
 =?us-ascii?Q?zYm10qrw51ghMQ3odCOUMR2n4QSYFcFG4dz7dWz7VPOHeKXWLMxKQMnvOPP9?=
 =?us-ascii?Q?eDiC7t6P3jIR0KQm2EW1jDyoDidbKVim19ylh6UtxTtrvr3YD/ThbEwZF8qV?=
 =?us-ascii?Q?VY64HwG32aecfF2KKenAKTH0Nb5F/WBHO8M3bwCK5054Dj0B7oRi9aOaZujX?=
 =?us-ascii?Q?hi+Sqi4Ug+cmjSFhLoMgjSFl5coblX+1ngau1cyEErQenMXrBhYoq4WKRJpS?=
 =?us-ascii?Q?SLQER4ZT0T9TFaQuXrUeaw2dmzlMC8omfTWxbSB21GegGX1DOrHPfY76+kGJ?=
 =?us-ascii?Q?hnY0BaQaPD7ayceqC7dxTR7s+ZfBdkd9aidibxsj3CEYICV9X7DNJ4o9Fklq?=
 =?us-ascii?Q?ZuuaXLYxZwFBxwbOv2mwdo4gW2vNVar7YpQGXXwqS6mdB40VjsAAtxaJU2qO?=
 =?us-ascii?Q?IF5XdxQvn+POSi/NHkhG91CFF0RlrmWsidm1j9OhHv9+l83R0K2v3g3COXMb?=
 =?us-ascii?Q?oaGoyO2CekFmNtTwW0icluaXQQdqmZlMYfSewzgqgS/s4SZp2CRIpW3CJufm?=
 =?us-ascii?Q?s0BM+VUOZiWWDYlykFjKLBzoqVylui4pK5nB78N95bxK666MEiKxZZdjvNLD?=
 =?us-ascii?Q?AIsaR8P9xJr/YQ+olP6fwS0IoDgOk4sPEW/rX9seHt/eZKnRcJXAbuAlchZ/?=
 =?us-ascii?Q?V2PBfsO3DhnD0hQ8keWSLBYMFAycbXld2bk4srDV6yl2zLEdX/mLJFA7/rys?=
 =?us-ascii?Q?ZdRkNKKCVrcI6Vm+AYInpe0+kGeQMVnXMz3N65XepgLarXrX+l0r9C/MOoZr?=
 =?us-ascii?Q?QBGLQ7jMaxx+mB/g2B4PyZ1QJYIt1OoTBRgxfelPHV4HN701hkwaE4IT5qH/?=
 =?us-ascii?Q?ptQDG+f9VveM/73PxQQM1mqWlGxGr5aRcssl5dyB9+JmpwM6Y+w4gQMlz2KX?=
 =?us-ascii?Q?bigaSn95unGRKPyFH/haLCRDG0TdInYDdBvhoJenDWiwrZ6VXQt+0QHy8+ge?=
 =?us-ascii?Q?ad5lbK8gxiTjh6qq0R4eU9pSupCT7aL3F3aDUQ0ZG6mnPnZ0foJ9wcZO50Vw?=
 =?us-ascii?Q?85Ho4u/4MFBSmYr9aDREBRZHBnWbKSM+9nNFa58lJ1Admy/x8QiOBAjZNh5H?=
 =?us-ascii?Q?9pqbdtkRxa5DBFgHnMD9Xp3r2QYN6uZ2yoNNgMHbrL2Wp8Fk9D/D/gd4/EYg?=
 =?us-ascii?Q?Sx5ACCIRhiZ+MyZ27a9trOkLXo0iMdhRi2GsXpq4fvjFf7UDTf0ws9mzWzwR?=
 =?us-ascii?Q?JjVy6xREUjyVyxX3uL1iyv4mCNPFgzFC1V500dGxKwTkC5samlsbtqANrEtQ?=
 =?us-ascii?Q?tEc/9pRgSWgeORdZjVlHPOZn1/5S0RjzASnLpNfVhMvaYgplAQHSCR1ABiO0?=
 =?us-ascii?Q?m9Y1rH4iXZqYZCxjxngmnCbe1cITvQEYfSYK7SRCAWgF1ve4pBPoSsCJAXhA?=
 =?us-ascii?Q?Vv9Vs8iTAKKJAjGcsKOy9vWNH//AA3dpdUUbfiWlKGrMUyk+YS1+j0pda/fs?=
 =?us-ascii?Q?V+A8bBk0eg7krYneQA8U+dfTt21SCFs0RuDmttjKw/G86z39TyvW1cNrGe2x?=
 =?us-ascii?Q?ApGk3Fc/vPG95ggMUBg5qiYQmPauQxfLlRXSXtOHFddy/WNBDvLKqEz6xxp6?=
 =?us-ascii?Q?rppJiURW91ws4HGmG4jokaVDuOcZ6HvWePPPTckN99f27qzU7xiLHYLe5c2v?=
 =?us-ascii?Q?TpGwyeEhwxEc6XpgUsCkzRTawSu60xMPh2MBl3bkQXC4SAWhYIedCB+/apzN?=
 =?us-ascii?Q?Ixef2YcY4zWSdb+YsXPCTCwveyQtyzA=3D?=
X-Exchange-RoutingPolicyChecked: 5T7JWw7qtpj4bKzhJ4D2yUDBTsANTS0a7DFcG0QLABpokVofjVs6Ehz1JdUeNg78wneFhSRw4WtXpzsexDP19k0mAy8KsqUBFDfubUG1iEYgA7Oup0Q+63CKnTCsvDn/sEOnuyZnlG1HM0HNbCPOGESSkj/WygQ3TxM4jLc5dZEJdI/0rA4vQVJMKkxI3YDYliIKgZ2NEvRSrUO49KTJzooNjhoY/K6bH2KzI9/EJJxHOHaKD6dWm1zrqTcUeqWHxuY6wkl45jlpWMN9QcmgK21V0uUWjOKh+QuobHXwBLb3CZcw/tOitYaQyUWBqoeQGlYFGdEllxbi+a27mrlExA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 261c2b25-65fa-4c27-9798-08df1e573b52
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 18:26:52.2851 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L4tvJkdZU3khmbLitPktFk0+bFVKXnRJS0pnkwcaEmr8HnYLxZtV1ssiuKJ/Cigh9KfY7H3TtVE86AtacI7s9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8147
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

On Tue, Sep 29, 2026 at 10:18:14PM +0530, Poosa, Karthik wrote:
> 
> On 29-09-2026 01:08, Rodrigo Vivi wrote:
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
> > > +}
> > > +
> > > +/* Mailbox temperature is sign-magnitude (bit 7 sign, bits 6:0 magnitude). */
> > > +static inline bool mbx_temp_valid(const struct xe_hwmon *hwmon, u8 value)
> > > +{
> > > +	return hwmon->xe->info.has_mbx_temp_sentinel ? value != TEMP_MBX_INVALID
> > > +						     : value != 0;
> > > +}
> > When reviewing the patch 7, I noticed a small change that took me back to the
> > temp valid...
> > 
> > What if temperature is 0 ?!
> > Why isn't it valid?
> This can happen on pre-CRI platforms (.has_mbx_temp_sentinel!=true), where
> temperature sentinel is not supported.
> In that case, we shall return true here on those platforms.

thanks for the clarification.
rv-b remains

> > 
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
