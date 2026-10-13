Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F21C1CC6B1A
	for <intel-xe@archiver.kernel.org>; Tue, 13 Oct 2026 19:15:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4A3610E8DD;
	Tue, 13 Oct 2026 19:15:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C349610E8DD
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Oct 2026 19:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791918902; x=1823454902;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Ms708yC64kyZC4oUtMVcBIav1II9BruBZwlSNrrl6fY=;
 b=fbJAy8NnxPrhctmGOVkq282p8Y5H5L8CJ4JqlpTyu2j4orWAcEZELHb7
 Ix6Gm9YdIckVWJsP0kBvUnjN02VqD0dQ7SrZAplIUykWU5/VUK5UeDXIy
 IlLd0TjvCuwLQ4GaA0aTRvqgzBnTW6IFhSqdMhrZF3jEDFE1RREn3117D
 sS7g1tuHTAXvwI6N+dbvmUPATIwy0lRKwpkZvgHn5NcaCYxyB1gJwrhiG
 t1BQxZ5WvRuSD0cMm9Bs+VY0+DZQX13rNOGuUJkqa8U6g97qRAWKjLncb
 zknnyVmJTPz9xHuKTAyZY3Llr3Hzb5l4M9cPS/LzpVS3kJsMiujPm8WVP A==;
X-CSE-ConnectionGUID: KXEuOAaHRqOPFX3jn0Oskg==
X-CSE-MsgGUID: 5mR+LqMqTj2h+RDx6GYAGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="544087"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="544087"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 12:15:01 -0700
X-CSE-ConnectionGUID: NY2whtU+TgOtC2F42A9asw==
X-CSE-MsgGUID: B2jYxqq1QP+z6tETzHSc9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="3079985"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 12:15:01 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 13 Oct 2026 12:15:00 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 13 Oct 2026 12:15:00 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.8) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 13 Oct 2026 12:15:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o9RlrE75VuyTjr9feUY/IESn2L0VsdusG/7BHSn2TyRvI23LEavRPEEFK2L4dNcTBTc3AXa2/BsKjmdPoRNt6J+4kikPIETcm37osMEOCSYA3sCHBYT4DpajnqYiJNUPXAleUzFddDwTe6eg2UeFj3b12efoUV2L4zl9p4qGxvhVXkDuGdNbjtb9oTPVcbn3sRIN4GJ5F7+X3g6tRNiPXoAQzo7Akq6mmlc/8aGwcXcOx4QCfhc7Yqu8KxKIFVMSqdQpDcTOjWAUHUr/++995OM4r/jVM0pLfcSvFllcuGvryPCCNMKG9j8Na138YfEo51+Ha9tAc471BzY8wkgvzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TESjDIKIDbxIWSwOuKOF/SmUHOggd4jpfkOYT/sqI9A=;
 b=Fqv34Et25ZIwGgvfFdJMAjXmVmhIZ7v3CkEEjKshqmdXKbMkJGmDR0iC5hjs8bgp8ENKJl+iufaUBt5FxiYka+A3oYEmHu+2FonBk439iLuPKs7scp1ymjXeZVeOr/YUpl3ox2+XfF7+BfpYCNY3QKeizcgfVZrUxVFFIO1jsowoozxBrmjUnLreitUtij+uP8AjFzvlA33jqObHYwkDB594JaAV3Ia5wfXHMWjZNAWY05C9eD0WzMdsQ5ND5q0+I96y8o/O+Iimjhfy7ELoOl38iCDoDKNZ8C6MsruQKh3c1hhoSXm6kCEVvSAhpPrXOnzo8uns8DL6CNAcTjux9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7192.namprd11.prod.outlook.com (2603:10b6:8:13a::22)
 by PH9PR11MB016272.namprd11.prod.outlook.com (2603:10b6:510:3eb::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Tue, 13 Oct
 2026 19:14:58 +0000
Received: from DS0PR11MB7192.namprd11.prod.outlook.com
 ([fe80::c747:a502:4a7f:f5bb]) by DS0PR11MB7192.namprd11.prod.outlook.com
 ([fe80::c747:a502:4a7f:f5bb%4]) with mapi id 15.21.0496.021; Tue, 13 Oct 2026
 19:14:58 +0000
Date: Tue, 13 Oct 2026 15:14:45 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Stuart Summers <stuart.summers@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>,
 <umesh.nerlige.ramappa@intel.com>, <gustavo.sousa@intel.com>,
 <matthew.d.roper@intel.com>, <daniele.ceraolospurio@intel.com>,
 <shuicheng.lin@intel.com>
Subject: Re: [PATCH 05/15] drm/xe: Make survivability_mode configfs attribute
 a bitmap
Message-ID: <as6DJeimtHriaWle@intel.com>
References: <20261005220636.602826-17-stuart.summers@intel.com>
 <20261005220636.602826-22-stuart.summers@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261005220636.602826-22-stuart.summers@intel.com>
X-ClientProxiedBy: SI2PR02CA0016.apcprd02.prod.outlook.com
 (2603:1096:4:194::9) To DS0PR11MB7192.namprd11.prod.outlook.com
 (2603:10b6:8:13a::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7192:EE_|PH9PR11MB016272:EE_
X-MS-Office365-Filtering-Correlation-Id: 848edeb6-6826-4e5e-d9ac-08df295e459f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|261009223027099003|11063799006|56012099006|4143699003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: Fw1SGsjHsiKi7Fu7OsP2XFwWEDE4drSIf+UHDBpg4vEmWfu9UBDhJvZ+vu1Hp086mz1H019P3Hmgu/UCACCot+CGEhp2rAOiqTL0R+r1LeakjEe1hkGXfTwTpSi7E5oyODO0Vl6qXHM8Y113EYNeJ4+QYNV1M6ZLMyeJJ/YqvW/4/h9+bTybilYwRUJKa2BMInGcl/0VFZ0CPaSo/pIKMfYarFM4tXltKGaCmceZReH7A5QKOI6SEl6g9fHZOspcN0LzE944bc/cSiIV4m8f0ecC+h2JJfaAGlJx05PXvN9x1Qe+sWD6E+5maZticWrMcn3qpehN6PCNL2B5GqoliXr4hXwXMoBtE8R9j0zD5E2b0FsTjC+ml7ByC2nAMHH4irRvAutv8U/SMlQnekV2lSofKngGlfi+SnV6GP/1uXuBB1MDGh/ex+I6mNPoTxsaQnt5p+Qkaj+pyN0z0jPI/NmxRmff7/FD6hR9HVDC43UOxPkA2z42MinC6arOFkUZ4FeY+0ydSI6d5LSwZZURMDg79vTprs7Am3glemZFgngO3KsBl5RLxWZABMAIUqatf0JTnY+oxEx+dyah5B7QyNOzDIqeqJnc1iQaMpuiWtx1a+viluOB+pYWqakWF1xTBMaNRXKxAEeVh+NF/LwizV8oTL6VZFBLUPciJclVlVs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7192.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(261009223027099003)(11063799006)(56012099006)(4143699003)(10067099003)(18002099003)(22082099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KlIaCwUY8s7zwtDhS/8z778pJ6JCs3CEh6N4cLymQ7gR2echs6vHM//DIVQH?=
 =?us-ascii?Q?RC+BUibMNfAytO51n1DStf7vnTXHqUXB3VuJKat1t9tjyGgZ+nZjlVrRTSwb?=
 =?us-ascii?Q?GoGZVq42c3eiEtAy6oSfeTGBYSyrSv+cmFZF2B0594o3yLHmY5whaL3unm6y?=
 =?us-ascii?Q?rDeRpRRi6f5A1EN6PM5jKW9PkLImqcOgWbdMMG4cMYIvNVnrUqG00rqiwZIQ?=
 =?us-ascii?Q?ehYRAflw+mQ0bL3dcJ8py3FaMxqP8AseTWOynKm9f5FW4LE2tBMf+QPODpT4?=
 =?us-ascii?Q?xiEd9fb7iVkoo/9WWYg4BNw2+gNliMp/8qkYy0nrVZ3DonVmPsBlfHfqi+Cr?=
 =?us-ascii?Q?LemYtoG+a5Xg2ecgw7aStLGpWl6sOvg8JFeKVPgLNMdkmV5jzto6yeNvIoMk?=
 =?us-ascii?Q?KqX++aIL4vDZBln9eeE9Gxv3bKmNKk7Hi8N+scm7HtquuRL1HXpzuTQhfNLI?=
 =?us-ascii?Q?wHrxL5n2V7VSZ6BlaDUeWCikFLsLqtkoLF1PB3T1Tx3sg8sVBEY5acrP47mm?=
 =?us-ascii?Q?GWUVrluJklSM/ILErPhWFL1tpbjTITaHExYE+zmPQO1oy8C9MZjkJJd7WhtO?=
 =?us-ascii?Q?Q+hWG+BLD/RUpUBRuUqVfoD1Rrnha5A4RXZCkrVx7UXg9yY8n/GXZUb+EUVv?=
 =?us-ascii?Q?dJEVbqKeMl8KbmgSxx5OWxc/wHR6N28kqVafhKZjZ2KQn6YSPDwzbbUaPq+f?=
 =?us-ascii?Q?RJaI3iVsoHt6hLUV04Igq7bPUzaP6m9UGY/ZvTON4ATg43EK7sInewkNiVbv?=
 =?us-ascii?Q?R0jYeYyZgW91Jrg8TisZGU0xwt7egz6at/sGOdwEgDRtJulYYoBl2N/dn/uX?=
 =?us-ascii?Q?cmIQo40/QFQ5OI6zI/TtIjgMGaB5aWYTsYbXrKgBClCK4i+G0Skd5E0V5zw8?=
 =?us-ascii?Q?Zd1y5jfe1qA0dSo2HIlLLzRX8OimdN1CXcgTYKGTrBGCaB/XhSHOZdggMQ64?=
 =?us-ascii?Q?qpor2pkf+KARX+AjeGIjksLn5u3TA5lQ0vmrjh+YY5CAr5vopnN16pZfqFuV?=
 =?us-ascii?Q?4aQ596RU9ou3vs403yXg040dFWSFRxa3VHGRr7AxGZAZqrCDftVomYNiArjL?=
 =?us-ascii?Q?7nfOGUAN5sm6xK3WK5j7I5EMUNFCkUCbT8HDRHUId0IawRU2Z1DiZJd4cBaM?=
 =?us-ascii?Q?XruGg6gPSro56ioB9WEKHSwNekc2hIrcQLbhtHhy2MseXXQ1BDP1E/L4qc67?=
 =?us-ascii?Q?dqf6nDTqLjLGgFCzy2CVuMR9sHud+MAxDMxF96hNyYgY/w1htP0jKuLprQRB?=
 =?us-ascii?Q?wBgatLnUjEMZVKS75plk7AijYVHnRf24Hx9mG+wibc9J54KH0g15+5xA73Q+?=
 =?us-ascii?Q?PyE3XJYQCaZKFIpZLHRyhUmDAgzWbinZ3h5eWkTlW2RVidmqdghVzkRzoo8U?=
 =?us-ascii?Q?ZEkZ4VBXwwXvMbq6DvjaHBty75uCuPzvZ+E2xjnbeYAlRvQHr3Sz9LSw46G/?=
 =?us-ascii?Q?xE4ZRolh6SviJiPbjh7iAH3xfPYy0CkpLFZGrVwZJ5R2J/yVImOqFZ41ih+t?=
 =?us-ascii?Q?bvCBHy05t4O6ENvM+7cTIxnYTNz9YclzjZY04O3y4Q3X38g21lYt1ZPWW/es?=
 =?us-ascii?Q?8EtWpkw+WRG/a4jGg0S7b2a7Bqgi9uY0juzf5tcMw+j82PEUIv0Y747WGNp2?=
 =?us-ascii?Q?6M9vktgYhXVDYY5kcLV9WXEgyyBYDGFbb5NyW99B7iOlZhgp+QGBIJiZGZ3H?=
 =?us-ascii?Q?/19GmUMGkwufE9sdtE92WZZBmJE/vVHTRIOTJwipezb/Zqrq5RbKQHenqjEi?=
 =?us-ascii?Q?YonC7ZAwQGNexEPUxFT8QzYB/MwTtn8=3D?=
X-Exchange-RoutingPolicyChecked: pUNIgvwDSWZJvzyq/DlXpxrwpIFN15+ycBpZgmc8Qnq9YSbFmt5h6ITQr3bTvo24wYjO0QW+y2NoqYHGUmOhPaMWbnygI86h8DtWPMdHsgcCjsFO/95bwfTOBVVyEzHIO9Dz39ceQcAz8elkgdgztW9/1anGQ59a6+Cx0xdjtIjmpoZ4kiCM7cQ/w659FgOcP9fWQGN2K5yPx9eIpXJw8YTcHwaBV+bCTeXODKuvX6bPLbUxS8eI47jW89CW5qU7+yKNDI1i9cxDMnErxBUMQ/ai1r9yquk1VEhXXhXTL6B80pKcB4+JZW4rzh5QWjywEj4zz6b4u8BAXyMaVoJpxg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 848edeb6-6826-4e5e-d9ac-08df295e459f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7192.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 19:14:58.6582 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 27n+TLDHNtvLPRi/SQbOFH63OJROtxl0DWAShCnpESE39yWPaZuZL+UM9Jmdw6ZRDlOPjya94e39qJJmB2Y/xA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH9PR11MB016272
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

On Mon, Oct 05, 2026 at 10:06:41PM +0000, Stuart Summers wrote:
> Survivability mode is likely to grow additional independently selectable
> behaviors, so store it as a u8 bitmap rather than a bool. Only bit 0 is
> defined, so the accepted values are unchanged.
> 
> Signed-off-by: Stuart Summers <stuart.summers@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> Assisted-by: LLM
> ---
>  drivers/gpu/drm/xe/xe_configfs.c           | 25 +++++++++++++---------
>  drivers/gpu/drm/xe/xe_configfs.h           | 16 ++++++++++++--
>  drivers/gpu/drm/xe/xe_survivability_mode.c |  7 +++---
>  3 files changed, 33 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
> index 0ccf163306fc..a16e2f48b01a 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.c
> +++ b/drivers/gpu/drm/xe/xe_configfs.c
> @@ -78,8 +78,10 @@
>   * Survivability mode:
>   * -------------------
>   *
> - * Enable survivability mode on supported cards. This setting only takes
> - * effect when probing the device. Example to enable it::
> + * Enable survivability mode on supported cards. This is a bitmap; bit 0
> + * enables survivability mode and is currently the only bit defined, so the
> + * only accepted values remain 0 and 1. This setting only takes effect when
> + * probing the device. Example to enable it::
>   *
>   *	# echo 1 > /sys/kernel/config/xe/0000:03:00.0/survivability_mode
>   *
> @@ -301,7 +303,7 @@ struct xe_config_group_device {
>  		u32 migrate_ulls_period_ms;
>  		struct wa_bb ctx_restore_post_bb[XE_ENGINE_CLASS_MAX];
>  		struct wa_bb ctx_restore_mid_bb[XE_ENGINE_CLASS_MAX];
> -		bool survivability_mode;
> +		u8 survivability_mode;
>  		bool enable_psmi;
>  		bool enable_multi_queue;
>  		bool enable_vram_page_offline;
> @@ -323,7 +325,7 @@ static const struct xe_config_device device_defaults = {
>  	.gt_types_allowed = U64_MAX,
>  	.engines_allowed = U64_MAX,
>  	.migrate_ulls_period_ms = 5,
> -	.survivability_mode = false,
> +	.survivability_mode = 0,
>  	.enable_psmi = false,
>  	.enable_multi_queue = true,
>  	.enable_vram_page_offline = true,
> @@ -407,19 +409,22 @@ static ssize_t survivability_mode_show(struct config_item *item, char *page)
>  {
>  	struct xe_config_device *dev = to_xe_config_device(item);
>  
> -	return sprintf(page, "%d\n", dev->survivability_mode);
> +	return sprintf(page, "%u\n", dev->survivability_mode);
>  }
>  
>  static ssize_t survivability_mode_store(struct config_item *item, const char *page, size_t len)
>  {
>  	struct xe_config_group_device *dev = to_xe_config_group_device(item);
> -	bool survivability_mode;
> +	u8 survivability_mode;
>  	int ret;
>  
> -	ret = kstrtobool(page, &survivability_mode);
> +	ret = kstrtou8(page, 0, &survivability_mode);
>  	if (ret)
>  		return ret;
>  
> +	if (survivability_mode & ~XE_CONFIGFS_SURVIVABILITY_MASK)
> +		return -EINVAL;
> +
>  	guard(mutex)(&dev->lock);
>  	if (is_bound(dev))
>  		return -EBUSY;
> @@ -1243,7 +1248,7 @@ static void dump_custom_dev_config(struct pci_dev *pdev,
>  	PRI_CUSTOM_ATTR("%d", enable_multi_queue);
>  	PRI_CUSTOM_ATTR("%d", enable_psmi);
>  	PRI_CUSTOM_ATTR("%d", enable_vram_page_offline);
> -	PRI_CUSTOM_ATTR("%d", survivability_mode);
> +	PRI_CUSTOM_ATTR("%u", survivability_mode);
>  	PRI_CUSTOM_ATTR("%u", sriov.admin_only_pf);
>  
>  #undef PRI_CUSTOM_ATTR
> @@ -1278,10 +1283,10 @@ void xe_configfs_check_device(struct pci_dev *pdev)
>   *
>   * Return: survivability_mode attribute in configfs
>   */
> -bool xe_configfs_get_survivability_mode(struct pci_dev *pdev)
> +u8 xe_configfs_get_survivability_mode(struct pci_dev *pdev)
>  {
>  	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
> -	bool mode;
> +	u8 mode;
>  
>  	if (!dev)
>  		return device_defaults.survivability_mode;
> diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
> index 1d538ce0ed2c..a5c081fc1672 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.h
> +++ b/drivers/gpu/drm/xe/xe_configfs.h
> @@ -5,6 +5,7 @@
>  #ifndef _XE_CONFIGFS_H_
>  #define _XE_CONFIGFS_H_
>  
> +#include <linux/bits.h>
>  #include <linux/limits.h>
>  #include <linux/types.h>
>  
> @@ -14,11 +15,22 @@
>  
>  struct pci_dev;
>  
> +/**
> + * DOC: survivability_mode configfs bits
> + *
> + * The survivability_mode attribute is a bitmap so that additional
> + * survivability behaviors can be requested independently in the future.
> + * %XE_CONFIGFS_SURVIVABILITY_ENABLE is currently the only defined bit, so
> + * the attribute still only accepts 0 and 1.
> + */
> +#define XE_CONFIGFS_SURVIVABILITY_ENABLE	BIT(0)
> +#define XE_CONFIGFS_SURVIVABILITY_MASK		XE_CONFIGFS_SURVIVABILITY_ENABLE
> +
>  #if IS_ENABLED(CONFIG_CONFIGFS_FS)
>  int xe_configfs_init(void);
>  void xe_configfs_exit(void);
>  void xe_configfs_check_device(struct pci_dev *pdev);
> -bool xe_configfs_get_survivability_mode(struct pci_dev *pdev);
> +u8 xe_configfs_get_survivability_mode(struct pci_dev *pdev);
>  bool xe_configfs_primary_gt_allowed(struct pci_dev *pdev);
>  bool xe_configfs_media_gt_allowed(struct pci_dev *pdev);
>  u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev);
> @@ -40,7 +52,7 @@ bool xe_configfs_admin_only_pf(struct pci_dev *pdev);
>  static inline int xe_configfs_init(void) { return 0; }
>  static inline void xe_configfs_exit(void) { }
>  static inline void xe_configfs_check_device(struct pci_dev *pdev) { }
> -static inline bool xe_configfs_get_survivability_mode(struct pci_dev *pdev) { return false; }
> +static inline u8 xe_configfs_get_survivability_mode(struct pci_dev *pdev) { return 0; }
>  static inline bool xe_configfs_primary_gt_allowed(struct pci_dev *pdev) { return true; }
>  static inline bool xe_configfs_media_gt_allowed(struct pci_dev *pdev) { return true; }
>  static inline u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev) { return U64_MAX; }
> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
> index 45d44ebe288b..3b96097f6ee6 100644
> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
> @@ -306,7 +306,8 @@ static const struct attribute_group survivability_info_group = {
>  static int create_survivability_sysfs(struct pci_dev *pdev)
>  {
>  	/* Survivability info is required if not enabled via configfs */
> -	bool needs_info = !xe_configfs_get_survivability_mode(pdev);
> +	bool needs_info = !(xe_configfs_get_survivability_mode(pdev) &
> +			    XE_CONFIGFS_SURVIVABILITY_ENABLE);
>  	struct xe_device *xe = pdev_to_xe_device(pdev);
>  	struct device *dev = &pdev->dev;
>  	int ret;
> @@ -405,14 +406,14 @@ bool xe_survivability_mode_is_requested(struct xe_device *xe)
>  	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
>  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>  	u32 data;
> -	bool survivability_mode;
> +	u8 survivability_mode;
>  
>  	if (!IS_DGFX(xe) || IS_SRIOV_VF(xe) || xe->info.platform < XE_BATTLEMAGE)
>  		return false;
>  
>  	survivability_mode = xe_configfs_get_survivability_mode(pdev);
>  	/* Enable survivability mode if set via configfs */
> -	if (survivability_mode)
> +	if (survivability_mode & XE_CONFIGFS_SURVIVABILITY_ENABLE)
>  		return true;
>  
>  	data = xe_mmio_read32(mmio, PCODE_SCRATCH(0));
> -- 
> 2.43.0
> 
