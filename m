Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 819DDC83F09
	for <intel-xe@archiver.kernel.org>; Wed,  9 Jul 2025 22:19:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4435710E0E5;
	Wed,  9 Jul 2025 22:19:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nj0mfb28";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F420D10E0E5
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Jul 2025 22:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752099565; x=1783635565;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=5y4l907RTesJik4JKfBxP5x9cfFrCPdvI3GOcYFn15Q=;
 b=nj0mfb28tlBT6A9yhmFWrxAXAqmyEkEmFV3kQWeHnB0snkY0infGmnb0
 vBglzHoGjnAUgg/rfzr+n9xE717YOvCmN8WspsaSXhrfNGgaqFbiaG+Az
 FD9jEcWqYC6qmT1Pwf0k8hR956cH9OiKjVx/6F3SL+rhAtvafJ88NL0Vu
 UhnAxk+DtSs9MM9RE1RtX3I62r94IFzrJwX8GMRjs//1njM9oYbwbomL4
 nO7ofh8KzYVo2cTEx6ChYUxrAn3CBm4f8hDEhW9Gbu91CgvmLThuzSTvv
 FmAuIs+yQk7uGgdxXDhSwqcPl1PehPHxTn8IBKBSdxZ0zAJSjd4CsD8ld A==;
X-CSE-ConnectionGUID: 8UgCRt9zQ7usbeNan9QT6g==
X-CSE-MsgGUID: tM8cC+V2T8WtGY/MHQpnig==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="54501437"
X-IronPort-AV: E=Sophos;i="6.16,299,1744095600"; d="scan'208";a="54501437"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 15:19:25 -0700
X-CSE-ConnectionGUID: tnx7zAPwRm+R0aQAg+UIrA==
X-CSE-MsgGUID: H44KkF9kTDyh6+UvE7rW1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,299,1744095600"; d="scan'208";a="156627905"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 15:19:24 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 9 Jul 2025 15:19:23 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 9 Jul 2025 15:19:23 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (40.107.212.66)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 9 Jul 2025 15:19:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uC5TufJQ0etjENWZMRPR0LYS1KRtKDKXMCtdswG2nZYk2ztLEIU/BWlhHNmyKGIGzrN4OiTvwdCNTveC8qyhO8PLqzYvV67fism5OKe+5ySJyMyHuSViNXY0o6IyUenjPD76Hr8cIAiYcDFxo1Rmvzb41NVG7/DohIZ0akhe7SxZIQhIFgAiQdhSgb9zvqaNyB5adcUP2lzSt2+/KpCQzhNPdIboxTFVIFRX5btBNOXIYoKfkuyOOKng5NiZOsE/3VvKovRDYbUwtpECuSDNyosKc7UECa5//EHA7aTWB71QsikCKHnyJosUdH6NVgr7rIiOQ8kXM+E5Dlr4w6vM5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xfcstJyzNFyy1cF+UJJoFYy1yugP4W5UWdIHtQnBeQ4=;
 b=I9acEIkUJZw+M6LFzCcHrSgIRCcKGLuZDyhMyw8KJmEF13HAvNm318y9CwkdiAh2hQIz6OXkLPTNdCCFeTftLpmCJs3BcBLD6QSFK4yc3+2Fkb2cfgc5c2Ca/N6w/GugYYi/SB+rPXYjTq2s5Pd0MNNP+BPgP7Z+JnO9sL+pvsl9UrmsfhrechXpU06xpNvLMn7oVEWyg1Ep6qLut/OGa+jk8mgkNRnNSlNFybCCh4ri67UOqX8vISO5b+8w2UXuK6F/4HnhncV+lDqaEjvIY/OFw+XkcUFd4fYBQeC6bY3pyNR/zcxkW6WeKAtmKLFgIdnrjJMy6eU9MvP/Zbne8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SA2PR11MB5180.namprd11.prod.outlook.com (2603:10b6:806:fb::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.22; Wed, 9 Jul
 2025 22:19:20 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8901.024; Wed, 9 Jul 2025
 22:19:20 +0000
Date: Wed, 9 Jul 2025 18:19:17 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <lucas.demarchi@intel.com>, <intel-xe@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <riana.tauro@intel.com>
Subject: Re: [PATCH v4] drm/xe: Expose fan control and voltage regulator
 version
Message-ID: <aG7q5WkccYm6bnfq@intel.com>
References: <20250709164224.2676086-1-raag.jadav@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250709164224.2676086-1-raag.jadav@intel.com>
X-ClientProxiedBy: SJ0PR03CA0177.namprd03.prod.outlook.com
 (2603:10b6:a03:338::32) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SA2PR11MB5180:EE_
X-MS-Office365-Filtering-Correlation-Id: 156837fb-199f-4f20-3ab2-08ddbf36a6ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ctnKpNl/7J3Bz/csjiyTQHbZsbNStnsPzzDS+nlNn1Kz3V2TohAwfDO8lfej?=
 =?us-ascii?Q?H0tJ+a5JdGBySkd+int8NYEfRMmUC3GtOIlAGgBJ7MQ+PoFmwhB5titfzTN1?=
 =?us-ascii?Q?QjqWlIe3yQ2BQwnm6P/xMTId7jG0t2kR3lVrB6Z8eFCha2VwTSAG3840jH4q?=
 =?us-ascii?Q?OgAwS/hqHjk96AkfxFU0QWny7tQLD1ozXBVhSwVFgCKz6Y/9ZmEHAevKcs56?=
 =?us-ascii?Q?MVgH8iCW9+Ljl9iqUK14GMiczy3gRlT2TdDTjYMHe+SobGqTj050xjNGyOnp?=
 =?us-ascii?Q?CvofSs4zLB842Jd5qXu/EBXQGnQnVypoUAIkhJlY/g7bv3/NfqhCc4qLVzeY?=
 =?us-ascii?Q?6MdyOJpILTJpAVuqszQ27Y9e3PK7UCRfZbAs8PWo4rY/wyn0PHv/ZEjf3LZj?=
 =?us-ascii?Q?sNj8QAZARh4bzCjKcD6Xebp72mM3Jhom9SVCS8/gXUCGq2zlT92I/rQ7/ZGi?=
 =?us-ascii?Q?ZK5TtI311tZxFMgSlWMI4MMRtEOETbHfchxgk96uUiH8EtXCtrlODInOprby?=
 =?us-ascii?Q?DsxuxWTUmjddjA5jHszFx2rNIjaBomBmgU0g0CuVE+zlyM9QDUwFGQbWl2Wa?=
 =?us-ascii?Q?zCYKf3AfyHZSu22/vu7aVGV64bjuLFYnM1f8pPq9ShjVWakt+NMMX96w7PSI?=
 =?us-ascii?Q?vTxqjq0wI3i36I5Kb3J8vBkxYFpG5A2k2fQYC8kTjiRM9ufpimXOHUEijtGN?=
 =?us-ascii?Q?Eo6IgwnZ9d/7NKQBi98DmJoCsMSxOadsfWPhWjRo8SSB2DzyOz5Gwn3Q9xdK?=
 =?us-ascii?Q?DPQQOYP3mxvNiz4HLZ9c8/1NTR4z6sDNQTq6xT+X4FH+rkqyFIv9BBMZO186?=
 =?us-ascii?Q?sf+TRUlc3hqrrYyjnwwEAUGWImudBDvCzU8rWRN55wajVVcTR550YwkLt/9C?=
 =?us-ascii?Q?A9N/QGg8ko1m0kSueAt9b1lCQGy+8ySZMKGQorILSqXt1w1SGKdRgGeuDssl?=
 =?us-ascii?Q?3CLJVSO65BHEVAKmHE+LAlxJAp/ErJGQUF75Np3yCr9lS+5EyvKu34/GDSLU?=
 =?us-ascii?Q?EIcLF4NZa/611eBFAbeHfskga41I1tzinykf0ARTz7lSPDWepe2Lh9DUKx84?=
 =?us-ascii?Q?1yEQqWkdzFSXwAuvoBMwTKfGgQt6as0YtsPJ5zSXsPvpxne5CswajM6KAKDe?=
 =?us-ascii?Q?4M3i6kxygPJtJkCJD2/VW9+EX0aoDrlKaGZd5+RHWe8RXucDJ4b0OR4sHs57?=
 =?us-ascii?Q?OgqNKA8B5WGqYEXH213kcPjgdjhRjD4VGbDedvWr8mxZ25t9XP6YfTGur9qS?=
 =?us-ascii?Q?ueixaz/D8tVm5KDhyJfr2UpFlR8yynafK260nDkwKeiIJTlheWrdam3hno0A?=
 =?us-ascii?Q?gJGkbY0LM3v58e+Lx01ngrUOEAwFYk5DrSzE+Z7QDKfc5WE8lfxKpC+nH43a?=
 =?us-ascii?Q?yw7zPjVS9xQQY2hEjl61Zfu9oOMlAbqQRduroueBpshsJwq0RiRiMrfhLc48?=
 =?us-ascii?Q?/Hr4eKdAOsU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nnTAu+OfUmVBWMKrKyna3fBEWd9t0N9joESp9d66qrC+VRMStrJGsklUXsLu?=
 =?us-ascii?Q?5TcRlsw6GlVQFgUNdtJPW7uWGCrq+aXzir/YYoaT3gqsptHiI1r49XI3EH8d?=
 =?us-ascii?Q?G+nvxKKsXppTc/XlkQBzGJHNXK+5XWI2iC41/gQ9DgyNdA8xHT+qPJYJKae9?=
 =?us-ascii?Q?wCPdpFelxRTMFKrofEk0yngEqMmz5sWlXdGzzS5lJIZgrbIrPzCMOXcYxl+y?=
 =?us-ascii?Q?ba9HV0b78jCPCl4RVtg9AIJZklEsLGROnJtRyuCPd5l5ftleCllQ+VnleXxX?=
 =?us-ascii?Q?z9zQfBoeuqKt12Onm+Iet6NWz4/PTyj2eTV/+8G+eButrs7C6ezigkP3GdHd?=
 =?us-ascii?Q?r6wVlG3g36tnY3b35W1fI8IXTqik16oSXXC13hAsrONNn2/hXp4nLYPGJ5MU?=
 =?us-ascii?Q?GvxIXO5naMMmpI2UaveDZNQfMz5yrdRyVhBrnhTeyTagkko43O6e8DTr/fS+?=
 =?us-ascii?Q?8LtsOoSUSe+P6G5VfNldrupz95R37Pj18nTRElELd21o66OR40MBxkZymDCI?=
 =?us-ascii?Q?BM0a+FkOuW5KOeMJj+9ZI53fSijxcAnujYkd3FzvtDK1lFFNeUuhqDzOlRwl?=
 =?us-ascii?Q?HUrf2FS2ncves19XCzisefK2k+YtesJE9nsLmyg4djjueCLe2754QsLOEqjO?=
 =?us-ascii?Q?6f5N6hvRxrLWTkYgJGruUHmun/Nyx4kloD+yNjN2pJjjXJJFPpBqu7jcMAXE?=
 =?us-ascii?Q?moM6Cpkj4afEhI0+bRXu+heRkk3yfEY45L017EHdQA//zFbM74c2+BSS4SHr?=
 =?us-ascii?Q?LQ1OC1lwS7jnr+pW+lPo3s4Ctw6h4f8bFRRfgzZJCnuK2kPnDDNrfGT9go+p?=
 =?us-ascii?Q?w8sU4Si8d6YJroY0hWtBau01s2fOLyLfsmESjWD8eLVf79AZGa0OzRH7a+C8?=
 =?us-ascii?Q?0e2isFO9TMcA2qvLrybqsprnjtq1BgJtF5/KRFPpBIJ5R0nh8mf9TBqBBlYq?=
 =?us-ascii?Q?KvZodHnkhJPHEwrl12SsfRxJxH1QUT6tJfG1c8+BNIPx6SkSzE4PVFljyf5T?=
 =?us-ascii?Q?fADGmYX81lcBiVUNXaPK3okp9ajjy25PqsH6hTqWRiXvaEjKB5rrnQMXyYRR?=
 =?us-ascii?Q?dAMR8hdngpTcn+5KRhHHHnLC4BL/9vV1uu+8FlpzuI3otSim7ONp9toP6DbS?=
 =?us-ascii?Q?j7IwHS3xxBswyetFEFvxg5CNl3D/vnMKLKorhy7VE+muPvWA8L3omIfycbc/?=
 =?us-ascii?Q?SiWqDQmjn9gmKR56GMasYEewc5K3fA08GaTsh2U0h/3swXxRRuspRQYDUgXT?=
 =?us-ascii?Q?XXiYDDT7ea2IaUV+08/m+B9jk3h/rdj0OM9yTHRMwoP/SO2zrJSqN3PXAsEX?=
 =?us-ascii?Q?GczUtOt2DnYllLSEPbaAwl3EcmFqCqdgCXBoSmkz1qkwsLP8gtw50MpLVOhy?=
 =?us-ascii?Q?2/3R6fwDZcKsIFl93mA93RAOH+iQY0Rhr+y4HOfztZS7r6Rh5uNRP0Eg4BJ6?=
 =?us-ascii?Q?ENw7FLa8+DHhRYw96pxUlyNPjgi6RVtxTbNSK+AdC3uvB+/NLtlHK1rsMVBt?=
 =?us-ascii?Q?hGUoXZFjvAGYpldHMvqOzZsXT7mSV9UJC/ueOxp6cK12YMbak3aLXsm79n9I?=
 =?us-ascii?Q?4e472/dMbikaw+aM54Ndps19Abl3D2sv+GMrnVnsrqm6tT2E2CkhssXCDDwR?=
 =?us-ascii?Q?Ww=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 156837fb-199f-4f20-3ab2-08ddbf36a6ca
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 22:19:20.6457 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iinwReJBgvGRAsHCAwXGbC6QxIzk/pcyQyXgykR+vBw6GiTG42LzwxuiTfk7188zUnhbnhtIXxQDR+XLNQJNaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5180
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

On Wed, Jul 09, 2025 at 10:12:24PM +0530, Raag Jadav wrote:
> Add sysfs attributes for late binding features which expose bound version
> to the user.
> 
> v2: Rework attribute and macro naming (Badal)
> v3: Drop fancy formatting (Rodrigo)
> v4: Form version string using local variables (Rodrigo)

Thank you

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device_sysfs.c | 143 ++++++++++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_pcode_api.h    |  15 +++
>  2 files changed, 157 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_device_sysfs.c
> index b9440f8c781e..e5fd0cd537bc 100644
> --- a/drivers/gpu/drm/xe/xe_device_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
> @@ -24,6 +24,12 @@
>   *
>   * vram_d3cold_threshold - Report/change vram used threshold(in MB) below
>   * which vram save/restore is permissible during runtime D3cold entry/exit.
> + *
> + * lb_fan_control_version - Fan control version provisioned by late binding.
> + * Exposed only if supported by the device.
> + *
> + * lb_voltage_regulator_version - Voltage regulator version provisioned by late
> + * binding. Exposed only if supported by the device.
>   */
>  
>  static ssize_t
> @@ -65,6 +71,135 @@ vram_d3cold_threshold_store(struct device *dev, struct device_attribute *attr,
>  
>  static DEVICE_ATTR_RW(vram_d3cold_threshold);
>  
> +static ssize_t
> +lb_fan_control_version_show(struct device *dev, struct device_attribute *attr, char *buf)
> +{
> +	struct xe_device *xe = pdev_to_xe_device(to_pci_dev(dev));
> +	struct xe_tile *root = xe_device_get_root_tile(xe);
> +	u32 cap, ver_low = FAN_TABLE, ver_high = FAN_TABLE;
> +	u16 major = 0, minor = 0, hotfix = 0, build = 0;
> +	int ret;
> +
> +	xe_pm_runtime_get(xe);
> +
> +	ret = xe_pcode_read(root, PCODE_MBOX(PCODE_LATE_BINDING, GET_CAPABILITY_STATUS, 0),
> +			    &cap, NULL);
> +	if (ret)
> +		goto out;
> +
> +	if (REG_FIELD_GET(V1_FAN_PROVISIONED, cap)) {
> +		ret = xe_pcode_read(root, PCODE_MBOX(PCODE_LATE_BINDING, GET_VERSION_LOW, 0),
> +				    &ver_low, NULL);
> +		if (ret)
> +			goto out;
> +
> +		ret = xe_pcode_read(root, PCODE_MBOX(PCODE_LATE_BINDING, GET_VERSION_HIGH, 0),
> +				    &ver_high, NULL);
> +		if (ret)
> +			goto out;
> +
> +		major = REG_FIELD_GET(MAJOR_VERSION_MASK, ver_low);
> +		minor = REG_FIELD_GET(MINOR_VERSION_MASK, ver_low);
> +		hotfix = REG_FIELD_GET(HOTFIX_VERSION_MASK, ver_high);
> +		build = REG_FIELD_GET(BUILD_VERSION_MASK, ver_high);
> +	}
> +out:
> +	xe_pm_runtime_put(xe);
> +
> +	return ret ?: sysfs_emit(buf, "%u.%u.%u.%u\n", major, minor, hotfix, build);
> +}
> +static DEVICE_ATTR_ADMIN_RO(lb_fan_control_version);
> +
> +static ssize_t
> +lb_voltage_regulator_version_show(struct device *dev, struct device_attribute *attr, char *buf)
> +{
> +	struct xe_device *xe = pdev_to_xe_device(to_pci_dev(dev));
> +	struct xe_tile *root = xe_device_get_root_tile(xe);
> +	u32 cap, ver_low = VR_CONFIG, ver_high = VR_CONFIG;
> +	u16 major = 0, minor = 0, hotfix = 0, build = 0;
> +	int ret;
> +
> +	xe_pm_runtime_get(xe);
> +
> +	ret = xe_pcode_read(root, PCODE_MBOX(PCODE_LATE_BINDING, GET_CAPABILITY_STATUS, 0),
> +			    &cap, NULL);
> +	if (ret)
> +		goto out;
> +
> +	if (REG_FIELD_GET(VR_PARAMS_PROVISIONED, cap)) {
> +		ret = xe_pcode_read(root, PCODE_MBOX(PCODE_LATE_BINDING, GET_VERSION_LOW, 0),
> +				    &ver_low, NULL);
> +		if (ret)
> +			goto out;
> +
> +		ret = xe_pcode_read(root, PCODE_MBOX(PCODE_LATE_BINDING, GET_VERSION_HIGH, 0),
> +				    &ver_high, NULL);
> +		if (ret)
> +			goto out;
> +
> +		major = REG_FIELD_GET(MAJOR_VERSION_MASK, ver_low);
> +		minor = REG_FIELD_GET(MINOR_VERSION_MASK, ver_low);
> +		hotfix = REG_FIELD_GET(HOTFIX_VERSION_MASK, ver_high);
> +		build = REG_FIELD_GET(BUILD_VERSION_MASK, ver_high);
> +	}
> +out:
> +	xe_pm_runtime_put(xe);
> +
> +	return ret ?: sysfs_emit(buf, "%u.%u.%u.%u\n", major, minor, hotfix, build);
> +}
> +static DEVICE_ATTR_ADMIN_RO(lb_voltage_regulator_version);
> +
> +static int late_bind_create_files(struct device *dev)
> +{
> +	struct xe_device *xe = pdev_to_xe_device(to_pci_dev(dev));
> +	struct xe_tile *root = xe_device_get_root_tile(xe);
> +	u32 cap;
> +	int ret;
> +
> +	xe_pm_runtime_get(xe);
> +
> +	ret = xe_pcode_read(root, PCODE_MBOX(PCODE_LATE_BINDING, GET_CAPABILITY_STATUS, 0),
> +			    &cap, NULL);
> +	if (ret)
> +		goto out;
> +
> +	if (REG_FIELD_GET(V1_FAN_SUPPORTED, cap)) {
> +		ret = sysfs_create_file(&dev->kobj, &dev_attr_lb_fan_control_version.attr);
> +		if (ret)
> +			goto out;
> +	}
> +
> +	if (REG_FIELD_GET(VR_PARAMS_SUPPORTED, cap))
> +		ret = sysfs_create_file(&dev->kobj, &dev_attr_lb_voltage_regulator_version.attr);
> +out:
> +	xe_pm_runtime_put(xe);
> +
> +	return ret;
> +}
> +
> +static void late_bind_remove_files(struct device *dev)
> +{
> +	struct xe_device *xe = pdev_to_xe_device(to_pci_dev(dev));
> +	struct xe_tile *root = xe_device_get_root_tile(xe);
> +	u32 cap;
> +	int ret;
> +
> +	xe_pm_runtime_get(xe);
> +
> +	ret = xe_pcode_read(root, PCODE_MBOX(PCODE_LATE_BINDING, GET_CAPABILITY_STATUS, 0),
> +			    &cap, NULL);
> +	if (ret)
> +		goto out;
> +
> +	if (REG_FIELD_GET(V1_FAN_SUPPORTED, cap))
> +		sysfs_remove_file(&dev->kobj, &dev_attr_lb_fan_control_version.attr);
> +
> +	if (REG_FIELD_GET(VR_PARAMS_SUPPORTED, cap))
> +		sysfs_remove_file(&dev->kobj, &dev_attr_lb_voltage_regulator_version.attr);
> +out:
> +	xe_pm_runtime_put(xe);
> +}
> +
>  /**
>   * DOC: PCIe Gen5 Limitations
>   *
> @@ -151,8 +286,10 @@ static void xe_device_sysfs_fini(void *arg)
>  	if (xe->d3cold.capable)
>  		sysfs_remove_file(&xe->drm.dev->kobj, &dev_attr_vram_d3cold_threshold.attr);
>  
> -	if (xe->info.platform == XE_BATTLEMAGE)
> +	if (xe->info.platform == XE_BATTLEMAGE) {
>  		sysfs_remove_files(&xe->drm.dev->kobj, auto_link_downgrade_attrs);
> +		late_bind_remove_files(xe->drm.dev);
> +	}
>  }
>  
>  int xe_device_sysfs_init(struct xe_device *xe)
> @@ -170,6 +307,10 @@ int xe_device_sysfs_init(struct xe_device *xe)
>  		ret = sysfs_create_files(&dev->kobj, auto_link_downgrade_attrs);
>  		if (ret)
>  			return ret;
> +
> +		ret = late_bind_create_files(dev);
> +		if (ret)
> +			return ret;
>  	}
>  
>  	return devm_add_action_or_reset(dev, xe_device_sysfs_fini, xe);
> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
> index 0befdea77db1..92bfcba51e19 100644
> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
> @@ -50,6 +50,21 @@
>  #define	READ_PL_FROM_FW				0x1
>  #define	READ_PL_FROM_PCODE			0x0
>  
> +#define   PCODE_LATE_BINDING			0x5C
> +#define     GET_CAPABILITY_STATUS		0x0
> +#define       V1_FAN_SUPPORTED			REG_BIT(0)
> +#define       VR_PARAMS_SUPPORTED		REG_BIT(3)
> +#define       V1_FAN_PROVISIONED		REG_BIT(16)
> +#define       VR_PARAMS_PROVISIONED		REG_BIT(19)
> +#define     GET_VERSION_LOW			0x1
> +#define     GET_VERSION_HIGH			0x2
> +#define       MAJOR_VERSION_MASK		REG_GENMASK(31, 16)
> +#define       MINOR_VERSION_MASK		REG_GENMASK(15, 0)
> +#define       HOTFIX_VERSION_MASK		REG_GENMASK(31, 16)
> +#define       BUILD_VERSION_MASK		REG_GENMASK(15, 0)
> +#define       FAN_TABLE				1
> +#define       VR_CONFIG				2
> +
>  #define   PCODE_FREQUENCY_CONFIG		0x6e
>  /* Frequency Config Sub Commands (param1) */
>  #define     PCODE_MBOX_FC_SC_READ_FUSED_P0	0x0
> -- 
> 2.34.1
> 
