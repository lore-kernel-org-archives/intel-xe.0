Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BA85C5B572
	for <intel-xe@archiver.kernel.org>; Fri, 14 Aug 2026 18:49:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BC7F10E141;
	Fri, 14 Aug 2026 18:49:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jwSNCNTU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B29110E141
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Aug 2026 18:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786733395; x=1818269395;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/Nvk22H/1AIOsELGka4g2oACYvlCBIVGdfGzVei6qwM=;
 b=jwSNCNTUG0bUNuMBeAOhjV5sypu0x+RtwB0pty+hT+ITPHbIFgjPYekR
 UsfoMa1qUrFc6Oe4rcPw+hsKYnWXHbE53XEgaSztEZ7b/hld7ulzt/DcG
 5GiCq2Gp7rJgnb58PF0ndf3GMQpUZ8Z7AvAdUu2YMuT+xzUQIkvPmaN26
 FoTbOWLeoqzyf6DrEdzYrMP6dQMLiJ9pRI2yk1X0Sp2VvkeexmuPWPbss
 qJesuaFD8FvH5c2/Ec/7wiUtC2wNmcfmcfuQ+BPdxBofPb2DMN11DpNqr
 MHAIVR9jlw45lfvQtnjPy+e3a0ZqwQWiHZVisQeiOGU4VUVY5rY3vmplh Q==;
X-CSE-ConnectionGUID: nqg4QMF8RNqoqcxQTrMAVg==
X-CSE-MsgGUID: /gJJp29uQzC2slHXIuLgmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11875"; a="86277637"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="86277637"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 11:49:55 -0700
X-CSE-ConnectionGUID: VY/RJ/4lQ4CvM+GOal/q9g==
X-CSE-MsgGUID: ts9Wj7rKS5+9bOoZt9A1Ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="267787910"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 11:49:55 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 14 Aug 2026 11:49:54 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 14 Aug 2026 11:49:54 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.33) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 14 Aug 2026 11:49:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X0nSZIW+XXU4gDxeFs++MQWv31Ar6gRFTxHt3+ysFyNGuoq/eY+ibJafbbzyfM7dLkpesJm5SRaEFhNkjFdUJzYrnvYwAzZEpgkf8G2WPdUk+dRlCpT7p0Pevf4Lc43ePUxAoaLejgOH1Nw0LZfLdtM5d8mFJ1dnFOL0ZeRUO1FO5H4wNwLyY3cu9fnLcdI93YAUl606FFHlDC/0cvA3peaqECklDbQQW082l3xUYq0/Ge3Zpk1Afwvpk5qUrU2Gox3rjVhKrM6xdc8kmraJAhABAyOC2MZnXzn2J82C+xjC03pMSN8+cctQOFDUVBJ+r6rySpth+w4zIgLnhHiMbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wRdejsuoo8lMfK8/+YjDlYDrWTCP/7/oxHC3K0OO0Pw=;
 b=bUcZWKoKtUGKXyEZxQonBljE8oOFPKIry0AwuIUqhT9KIdyDTvaD0IZrttDmq5Z1heVSo46XX7AUpO7cVHhdY1WtAnt73jfgMwH0FstTuVlcY/pHsuwfE2x1dU9Le2Q7kQskg7Irr4P6uPBLMNb18BucPfsOH+rF5oeIWzbMuTR6mFIvjKiYGERQiLy2nmlFIavDfFLWfjoeWcRCzBbAn8ZHHeUc9S2aoKWxPgbTxGTDV8dGtgAtDqzI941NJz08P4qkieW2jtwaaMsuRRT9w3XZi4Gv/zhMzg6g7UP160lQ6NHwXSK7j+ZczJFuPb9nJrQyrWwpqzg1fBTARjlUGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5073.namprd11.prod.outlook.com (2603:10b6:303:92::23)
 by MN0PR11MB6157.namprd11.prod.outlook.com (2603:10b6:208:3cb::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.15; Fri, 14 Aug
 2026 18:49:49 +0000
Received: from CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe]) by CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe%7]) with mapi id 15.21.0315.014; Fri, 14 Aug 2026
 18:49:49 +0000
Date: Fri, 14 Aug 2026 14:49:46 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Riana Tauro <riana.tauro@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>, Mallesh Koujalagi
 <mallesh.koujalagi@intel.com>
Subject: Re: [PATCH v5 24/33] drm/xe/survivability: Report 'Runtime Mode
 enabled' status using SIGID
Message-ID: <an9jSrsHiT5Wp3Sz@intel.com>
References: <20260814171801.13347-1-michal.wajdeczko@intel.com>
 <20260814171801.13347-25-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260814171801.13347-25-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ2PR07CA0024.namprd07.prod.outlook.com
 (2603:10b6:a03:505::14) To CO1PR11MB5073.namprd11.prod.outlook.com
 (2603:10b6:303:92::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5073:EE_|MN0PR11MB6157:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a1748b2-ccf0-477b-52fd-08defa34d196
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|56012099006|10067099003|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: OPgexqon/H8EuNAqZZIO8SNGefF0nF1sKGrIIAMVKQRSgrYXBtXWI9kRVFuETroLvbLY0m1K/qo2sWvgTyb+rWKzCKrrocUYjzOLWbT3wRXq5+7+wHiIrDaiT/KgZzc1jVxg2YOo4Wlpju8KSSZ711t06+0bXIY/KF5Ua7x4c+vZalOwbdDj/7PYnO/KTEUYW+sNOgCCWZy8sHYFa+Grf9lYIc3lAYFj8prtQ7GqI1YPZuv0i5vJQAEyLgFFglczxWRP035GpCcETcwYMq3FVoCkKXCcyBkfjm88TH+loawQ/q76F4sLXBoMET7qwNRatsdmSSncYLWz9vRM+W33k0li4RNnyqg7ZC72Put6ko8DSxm7jM7raqLl2BRMBoX2exPBQ+s9uytRjvo8n/ofcrNYZdpHnXqVc6iSso9DgMxWyUKcEWl+hPiDAB+tSHeq+Xq/xdWRVf0GqrLAZFPhQ6FE1gPIe7+pxz0AJtapyI3xdWWVTMljzZNlg1mHkGId+UxEizjzEAJ37Dldy80tVhszV0573A/jgrD1ljGAZt+qfpEA4RA61tYOt2Xst1qgKOUc9bcWgklKSlG54ZkdPpEpxKHiAWj4CvvmSdsiwKkVwjycaoomv7BM5A2I2STNj9obyGdY+DVL2wdtCLaj+fr5dBX/ufm8SXS8XmiIIvY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5073.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(56012099006)(10067099003)(11063799006)(4143699003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XwtmgMIpMw7Br38rTcZrp3s+2EHQPuRCOIKYHb06985APkUdGqVQwKXcGQzW?=
 =?us-ascii?Q?XcZHzOpfYPKH8DB06vdlkTGnqUkW9xTdYsCnzzyUxzEzeFtAnN4Pk913NacI?=
 =?us-ascii?Q?rrB7RAb9FRZtELo4Jx4E9PcX+HW11Oz6dRVPKwFrHybqCsz7n6RacYt1lITB?=
 =?us-ascii?Q?jEUzmMxVjmMxtScgHbnP9VD5AhHMrhDbHo5VVGKzTmYpL/PkhadjZ+rSCfgr?=
 =?us-ascii?Q?tU0omyLBpS/yiMkIUzXdGD1oB/CXbVZC4sggsTIGjOVlAm88zA5TTZy40BIi?=
 =?us-ascii?Q?jXpN2pbt6FwjOHPyoYLbEvaOonPCV9bjwclKZNiooSz0VAc/Vd1GNiT5yMcr?=
 =?us-ascii?Q?xbrMMUrCUuPkd8lw9o1q9Kz7ztssYxEGVV6znYSRe+ms+ELEEzlaSkWf44r+?=
 =?us-ascii?Q?5tsTCAUCQYL/rKimDzhjH15cIDYcQ2f/CxOrRuDI2zxjOMtCEbImo3TVLQLN?=
 =?us-ascii?Q?Kj8NwzriqOLVqxuU7QlC5Dk2S/7p3rZHNxVzDn1+S4UFoD4v0BUsY3yFSCNT?=
 =?us-ascii?Q?84ey3mdUgvR+1KSWITdJ/NnJm1fl9ksv8y4zC10ZR1Zx6glkL0Oj+SrZpEko?=
 =?us-ascii?Q?QXH1wvQi9dc/XqhX2+YTLR3Lvf4/kutkm5OHA+tFX4wU58rr8T6wp2KHY3Rl?=
 =?us-ascii?Q?SezuWXGNlqcuP9ZxiMZ7NIJH69or2FNLiKR0jZZil8sQn6hbJyoI6sri2bI1?=
 =?us-ascii?Q?I6ADHIZahQPulmFTAg17Wl7FF4fzQDB8JamlSL0DsY26uxSLG7u/ier6ttuQ?=
 =?us-ascii?Q?ZmY38kxfek3ka5zRaHGjoUVE1cKGDoD0JekfDpfj3oX69Xa8oopnbNSDLsRU?=
 =?us-ascii?Q?2UfdGpbAKH1DIW2qbdJEJtJAQ2yO0KrJpxiTHzW5qizYiiCa9WNDbg0pB05V?=
 =?us-ascii?Q?ZwUJi1banRI386NhhRLdXWjiUM/eDWj7CgFhH6vZtueEcVmsD8Y+6hPfglR8?=
 =?us-ascii?Q?IuG2CzcQMTcb6d+aSedcUWc++8X0tw82BY2EZR/uDND11/oD1+QaadNRrQwM?=
 =?us-ascii?Q?qR6VUe4wiAhMS0QfWV68Y9BwjehBsX8kKti+hO5P0pYzO0NAXghFLIZa7Qsj?=
 =?us-ascii?Q?B6V8M7gkmhTuFdj+phSAsctqE9DSo0Rs8glZ1Jfeo1059awwzH7HELgTTN6P?=
 =?us-ascii?Q?tV/rfCzonTM5+sq/iVRorsv3LvIMZHA0i81diCNN9+SrlvFIaL64HSOyJ4M/?=
 =?us-ascii?Q?23Q6DYAPNEpSVfj+ERojk2m3FH6ED95KeZ4TQv1jNZu7HTq67yjiXQcEvji4?=
 =?us-ascii?Q?Du0Kevr4R+/JBuAoNJiTFVUNbk7ettqh1adeTJ8XhE6IAIkAhGZsEi8tlT7t?=
 =?us-ascii?Q?jLSNDjrT+8OWPSDa6e3G9e8oWlYS+/h9vSnh1hgn9aNYPke7HMT3Gkr/M92A?=
 =?us-ascii?Q?hQrysCxBY8xOoxRako5nmrKs8A+FNXPp1eLr0EL3zj/zj+akXnpJAOalI818?=
 =?us-ascii?Q?ODFP8Bq7Z0KweaHO9AHBzN3gOo8xvNsTxcrV8ACSwhHVEMyooYrTXEHu9v2I?=
 =?us-ascii?Q?1PJaLEYVlPE5Zu0oVGgdJQXm1XpYRKwWQ4+dj/5pbcaQCStqmVrqsUUaFwYf?=
 =?us-ascii?Q?CFiUF7DjXljtgeD2nc22Blwvgwn2oFSzddLW5k7CoSzl75Kft+wQkzyRETFj?=
 =?us-ascii?Q?6OfsDYyrvt1aTJ7tKezXlMO3NGGvPpfUL4jAMFj4q3q/dzILxUlNCJGoaiag?=
 =?us-ascii?Q?Oc2ppPMCmoCN8pT0smLEU08imDl2izPHLZI0Gh4rsGpidmkXpYmZ7vBZmKAg?=
 =?us-ascii?Q?fTSlIOLeag=3D=3D?=
X-Exchange-RoutingPolicyChecked: npt0wd00+ozdrnBIW5XAtbWGxS41oHXOCh29oJdcBPhT5TtCtNA0mwLj4AqkBDve5zYT6kTa01jkffnr50pyBDK8/e5yUh8Kq2xSv615laeriEJ0VoJXcmEgYdkCbGhGvbAj3NTrB/bTHX66qq382+olr2W800io0jeIHGC0io+OuIfXsK4Do6yGFt8w7tXV/uIPPsArg8lwBY7fwWs7DPW2HF+P3roTIuYg3TZgsA3D0rzJJYjpX04r19Qv1GyQU6spHFGmX1VN7+1G2Nb995677ZZbmL7wioTHi8WbL97eE6ABr29NyNEA90XZ1+MB4/KFw7Eyt7+4zDDile0ypg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a1748b2-ccf0-477b-52fd-08defa34d196
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5073.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 18:49:49.6279 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V5FPRR7Wgx+6E5h9YFfKAngk82bbypmagB9jx/xEkML5rnLZKEkudG3aroct688qKaDkk+kp0H3YElisNnyc3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6157
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

On Fri, Aug 14, 2026 at 07:17:50PM +0200, Michal Wajdeczko wrote:
> Report 'Runtime Mode' status or failure using xe_log_err() helper.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Riana Tauro <riana.tauro@intel.com>
> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
> v2: always use xe_log_err (Riana)
> ---
>  drivers/gpu/drm/xe/xe_survivability_mode.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
> index 77923bdfb19b..45d44ebe288b 100644
> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
> @@ -436,7 +436,7 @@ void xe_survivability_mode_runtime_enable(struct xe_device *xe)
>  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>  
>  	if (!IS_DGFX(xe) || IS_SRIOV_VF(xe) || xe->info.platform < XE_BATTLEMAGE) {
> -		dev_err(&pdev->dev, "Runtime Survivability Mode not supported\n");
> +		xe_log_err(xe, SURVIVABILITY, -EOPNOTSUPP, "Runtime Mode not supported!\n");
>  		return;
>  	}
>  
> @@ -444,11 +444,14 @@ void xe_survivability_mode_runtime_enable(struct xe_device *xe)
>  	create_survivability_sysfs(pdev);
>  
>  	survivability->type = XE_SURVIVABILITY_TYPE_RUNTIME;
> -	dev_err(&pdev->dev, "Runtime Survivability mode enabled\n");
> +	xe_log_err(xe, SURVIVABILITY, 0, "Runtime Mode enabled!\n");
>  
>  	xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_VENDOR);
>  	xe_device_declare_wedged(xe);
> -	dev_err(&pdev->dev, "Firmware flash required, Please refer to the userspace documentation for more details!\n");
> +
> +	xe_log_err(xe, SURVIVABILITY, 0, "Firmware flash required!\n");
> +	xe_info(xe, "Please refer to the userspace documentation for more details how to flash the firmware on %s!\n",
> +		xe->info.platform_name);

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

>  }
>  
>  /**
> -- 
> 2.47.1
> 
