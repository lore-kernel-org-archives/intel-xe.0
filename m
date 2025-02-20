Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26F8EC021B2
	for <intel-xe@archiver.kernel.org>; Thu, 20 Feb 2025 23:54:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8B1810E9F5;
	Thu, 20 Feb 2025 23:54:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fYMVGkkK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5093310E9F5
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Feb 2025 23:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740095683; x=1771631683;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=dEJK438qzE5X7X8mCjQJGDcAOUkweq3iswDZX7qAdmY=;
 b=fYMVGkkKpOkqSnC3eYZdGrHcUDAsuiStq3HRDuhFjWdFIBOBUeGMuJv9
 NDMc3zG+JLJN/oyDaKGFBf9UwY6VChA5tqle8MwWwcXgmcmSxVOgW011a
 IJDoRNzX9z8XvjsSHYgxTiMK8TWbTomvpelbgN3x8PVxduD6nwGxIj3FQ
 YWMkI2j+vQ94rpvlm91N3GWXCD166SqwgbBR1ZRijZpL9a1Pz3EB2vn+K
 Y8z+5Db1AyFHQiI3lUIbHfdIyhY2xTWYENSj8GJi7LsCPuaMpxVa096eP
 U4jzall+NSM6KyJMhQOLfiJDtOk/Pl3zcIB0HN2mlRxSqfTXJ0kF77n06 g==;
X-CSE-ConnectionGUID: 0VI28VMFS12SGGIVw1UkZA==
X-CSE-MsgGUID: dK7BzVUSRLuL+adoZ6Bfbw==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="41163656"
X-IronPort-AV: E=Sophos;i="6.13,303,1732608000"; d="scan'208";a="41163656"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 15:54:43 -0800
X-CSE-ConnectionGUID: DlwPSb9zR/ePf8NqA/X89g==
X-CSE-MsgGUID: eB/WA9FNTrSDyCfMwFCWaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="152391081"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 15:54:43 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Thu, 20 Feb 2025 15:54:42 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 20 Feb 2025 15:54:42 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 20 Feb 2025 15:54:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zPGZqXx7jhDc+MzWlk4ZXyrLQZoCjh5CzAPVbqgoyY06gjWZr2LcwTjKhh750/hQAaKxa4XQk0th5/ZnKnS1g2P8zyfMyWPaMmo+/Cm+3X8f5YA47fPPqvJGzTFatld6oZLaVNbewwO/lvIUvxurKe1KbLUmt3vpv5SqKmtI/gRqP43DvnxM8Y7M9E+9xLPsQp42cnR7uPm6hDGeXN/gi4eu8+7mitN1Cw9wJWJ4faQP4Uxrhbzs38q0tlqenUhNY8LCiq656JcwMqo1YUL07PQUPJCO9fkXRA12akm8xBAHL/3DDAxsXZ1yPzA0ykS+1iklzixHNmFghBMg90qjcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/CKTgxATbnByzRLUZCcOkFwZh2Wb0KhTR9qMXy11u6Q=;
 b=Lfa7knMqSmn4H+S1RuUH4S+VOrPSTrWjr7jsyuQtBfku+xZko1I3gSDyU1ourMx1h2BbDPO8RpI2xDZ3Urgc+3WZFp1osATnc2PrYLL2z64XLAG2fLUxFI7z+znszs3JnswZT3oOWPWYqm18EUNa/ZaC6egoRp+RjyK+U14yQ9ph2XOAtqtXa4TrH7CM3KmtSYAcEYfmkFheysnuzQUQctmRZyNfNcu7PYRcEs2ENMewG52ENLrzfHAO7m/fFIzIQJVehYjz0kB3Td9YEWaM+LapqUR5aB0wtuizNC3T6Bt3H1dnOvgy69OdkCaQlSeEqCJvg47/nocF1hq7jhS+Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CYXPR11MB8691.namprd11.prod.outlook.com (2603:10b6:930:d5::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.16; Thu, 20 Feb
 2025 23:54:32 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8466.013; Thu, 20 Feb 2025
 23:54:32 +0000
Date: Thu, 20 Feb 2025 17:54:29 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: Shuicheng Lin <shuicheng.lin@intel.com>, <intel-xe@lists.freedesktop.org>, 
 John Harrison <John.C.Harrison@intel.com>
Subject: Re: [PATCH v3 2/2] drm/xe/devcoredump: Remove IS_ERR_OR_NULL check
 for kzalloc
Message-ID: <wtk56h75pu66dnnqx6az6dxyfhvgqbovp6sdihtenuhxuoneh5@yo2joqcv75sk>
References: <20250219212631.1788586-1-shuicheng.lin@intel.com>
 <20250220001710.1803749-1-shuicheng.lin@intel.com>
 <20250220001710.1803749-3-shuicheng.lin@intel.com>
 <60047a3a-9919-486f-8fe1-4c2f90c110d9@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <60047a3a-9919-486f-8fe1-4c2f90c110d9@intel.com>
X-ClientProxiedBy: MW4PR04CA0171.namprd04.prod.outlook.com
 (2603:10b6:303:85::26) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CYXPR11MB8691:EE_
X-MS-Office365-Filtering-Correlation-Id: 839fa3ae-cf64-4bf7-136d-08dd5209ec1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8RM4n3D42mFN7d7PWb6xW1yExy3CpunOHj4xrshChYLCPT8bt7NB3GU4vbDd?=
 =?us-ascii?Q?Q/s3ai3fy8zc2vMCPJxCksIGJDrs3shkELGkjEpltBwWH1BddY0uqTh150of?=
 =?us-ascii?Q?UaLjPIAcPiGaiyrsFR6n5mi+thqVjll3+5pDiMdEbh/ZN7kJr6aBdhhbYBCR?=
 =?us-ascii?Q?rz32LR7ypC4KGHuZ9W8gO9ejCH1gNjh+Bgc5+JKo1TQeZC0ExhThSTiEE5yA?=
 =?us-ascii?Q?PmlDiqQas9DdT+iXIkivup0fOY+ctopopCqKAoASBe3WXsI2astu3zzz/0kK?=
 =?us-ascii?Q?H3H7QhZbpBjJ9Y4Igbm7sHLSjetowiiIFqG/uWTKCP1PVsA8mbuzAomcuD/i?=
 =?us-ascii?Q?QwOnF7QImzbJrNCGklMXSWkR4Wxkbk5vSB/6actCF4woi4gLzDNNz8p1cLGl?=
 =?us-ascii?Q?MrSkELBg8zIfYwQsdlQRV1lYsf29/4ER6SasVGHyK5J7Si6wTD9UySpI3uyU?=
 =?us-ascii?Q?IqG4w2YrkWv5zAJgGLqiZTd9YvYP6WiB9SsZuZ8LeJWATi0gzKFMPo+G35CD?=
 =?us-ascii?Q?hAfqFDyGQeGjneAqia3uhpZq+7GocRKG55gn/jAS39biQQ/usgyFYG8inr0/?=
 =?us-ascii?Q?42iQZ1DnCAx2RBIgVU00AezmQ4j370R2tEonJFILi1M+wr0hEER3lKJxPwVJ?=
 =?us-ascii?Q?gpjGBwAu2WYDsvebohNHB2jsAef6s9lPrjOZjYU2saewAlHT9yromjrfjH1l?=
 =?us-ascii?Q?36u4q80dIdfeWw1KtYWswhCPxp2hMs5LTUUvxNFk3DxizFXQacZ/9adRii+G?=
 =?us-ascii?Q?XuGaoSJtEfhZfIrTcqNjrfhu+IukwpXU7bS5jOZgPlp/u7Iv9Wg66l5t93/h?=
 =?us-ascii?Q?88vUj0RVOj5CD9QYIUCnvc2wGKuPHzjbSTEIJTnnlf4ZSnH2B6kjOT4Oip60?=
 =?us-ascii?Q?Be8SlY3i5FzTuUS2qGxFGrb2JP4wdH01IDGROvXYaBAFRgV5aHq3VA3+OckL?=
 =?us-ascii?Q?vWxH45EL9NnsWuVZO7+3efmLCVJSHuuB49nWvc/ggh4pV9T+f7UbXOuVFkXo?=
 =?us-ascii?Q?hYMynM9RHU1ob/08wDKkR8Z9d2F4j+w3kKO/s90aNv7ZYAunzt8YWElZlifL?=
 =?us-ascii?Q?1JtC+ClOQiSYlAy2aYSj6VIw+f5nYPwmThRh2bRuBHAGgOAXf0/xbfEID0eM?=
 =?us-ascii?Q?KgTVdsZfsUsLBNwdJfVsj4qTiuNDz4Q18Iz1gl7AsO3U/VxuRzQbMSqAa1+L?=
 =?us-ascii?Q?0G8IBLuGEwpEtvHlzMJrnIlqF05wyOGSxbKp0I6DhY1v9MCc/K7p8NMHdTu7?=
 =?us-ascii?Q?BQCG1E36fhjO+w2twh+vwhHgW1XCVYUp7Xgv5opCuDvpnMMFEFlD49889JFb?=
 =?us-ascii?Q?kNhoxxY040RIsO56M5tSznrlwLZVLRCD35HM63aZw6gqrpWUp1xVxNoeyL2z?=
 =?us-ascii?Q?8e7dF7gkWccv/9f6KNgisbPxkJX8?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/CNxBka0L/SKIJsupx9UUOp6895/AZrQNMOmOY2dieMZifJfx75wM7HzfrGI?=
 =?us-ascii?Q?2rWbDaAxEt4XCkjxsx/gnShaSVmY2EjiBG9uQ0SpFpDF8y7EVlyvmHOGm+ZI?=
 =?us-ascii?Q?pFVpg/DzfGX5bz8MnuoEthw9LyxHVplkneOyyeUqwc5ZD8pBljlnUR9skbi3?=
 =?us-ascii?Q?K6DRZ48dfBBj3ILEbGPPiRVuE5Wy/AGhloTWvVR1aP12M7buN84nkrMl/Ipc?=
 =?us-ascii?Q?yl1QNbTtYa2q/fzRjdY4f800jcxlqik/ZpnY1QEjCdAsI2NuvEnRl/OpBQph?=
 =?us-ascii?Q?8lA/LtBEgjuMgqjIkGk1t/QH6V+J7X4yzIZgvzHj4k1vhRLt9/pjoJyyEY0K?=
 =?us-ascii?Q?q0dSTlH91rUVMm8c2OH5BDzSRAAR+mwxi1BOkQYntY8K0oRczX0za0Qu+PYl?=
 =?us-ascii?Q?Qg4rfCspBQVp9lOH4+7sNG3onkrAK2lteW85oKHDFd5849xQ/ceA4jPRTs0d?=
 =?us-ascii?Q?DTzM2M4TUxNlDY5uopMZ/o/yA/lyTFX9vEkxz1Kj//tyMKBDHEvagWy5Og/Z?=
 =?us-ascii?Q?2bW0mUqZLBPUTLM4yjwISghIkxn8314Ga9djkDth62kNFd7NOjHCBxvwwYwr?=
 =?us-ascii?Q?JSsyvOfstKd3vIS0y9r0K6J+tWlzo9FstuISRLnjL8iTGu2IZbEhn5ttwSy2?=
 =?us-ascii?Q?avvAuV97p1zREE9OSVOSyVovWOG3GDFEqCH+uvgo0NQunXq7fEVOMpVbZR6W?=
 =?us-ascii?Q?3kQkNyO9iy4YI8MSUz3hmGhjGobpFiNQswkDq2ft4NlsDSjJWtPC9xQQAkwx?=
 =?us-ascii?Q?mn4AIpOhX1Ca0WQdMcOXn6kIC71FTWmr6bBIBoaJlvo0GCrxFZthNWX9ZulL?=
 =?us-ascii?Q?mnT1wNNTV/6UL4SJqLosXxd6UXmc3278jyRXAXArLFKEChyfOh1PLPlXfr+n?=
 =?us-ascii?Q?dr3b42KLvYwk+M0wBgm9WwV9Sio81i+4gDcIPSUysC1MZv891Bio0vj6srJT?=
 =?us-ascii?Q?0Ai6333v/SDifzg6MHEIaCgHHZ8foA6cZpDXlTLReBy1In31E2u6ybFpXw/y?=
 =?us-ascii?Q?4Rf0yrci1g9EjS+USVEWfDYjYRBEEMZ4ciKvYaK64Glp1QF572PIdA/vFFXj?=
 =?us-ascii?Q?IVRZeCZ78Vrgk2w/8YhUD5hi/vR9Eq3+GKOx5SI1LoniuGG1+CFeaoT8dxc7?=
 =?us-ascii?Q?O9bgpyPQFRPezrTCEaC7qjKsPjnEAqW/VXxmtr8QFW6HHzNWPBwQtRdKKslm?=
 =?us-ascii?Q?VYR9ErrRhF98fOdACGw8noFegv/Cno3tS0GCMJAGA7uWnh/7vL6O9a5DS17j?=
 =?us-ascii?Q?L2gPCgSa5wfoHGJg71A5mUj/jUBV+ArQ12pGgNCWK8/5evh3RDDAfSc3/5Mo?=
 =?us-ascii?Q?0AMFjz2FEv7XQyP7S014gUvTx/FXz8yQJrJK3G+s1Vup3xxsrthxrPBTICGz?=
 =?us-ascii?Q?emZU4YHHY4YmHriuc6xGz68zawaVQ+/mQHXgW87M6br8OwyK8yooh4DizGMP?=
 =?us-ascii?Q?XNSaZ3aiwPw0+HWHXDMeJyn1gxVdGn2+fkjzaaRw7Xp7DMttE0TKXAf46xIW?=
 =?us-ascii?Q?zCyAMpzqJ6zW9lAsPMYGLsLLi9Bt+mlFI8Ryqf0IdiUn9jd0IW0gAMFT3564?=
 =?us-ascii?Q?dDbV9EDhLuyLpYOg8w1TgBxve8CSGhHxPt8m+o7LukP5kmSWC7MHdGz6KmN1?=
 =?us-ascii?Q?zw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 839fa3ae-cf64-4bf7-136d-08dd5209ec1c
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2025 23:54:32.7795 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KTJMyHHqXATiNZD3TlZhwWGfs2eP/3n3uif2L5SUszX69/6lUW5J7HRgNvnBRjonrcbSunJ2Fjk3/e7ZrnM7+IuglHZlhWfVB2whDcRNN94=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8691
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

On Thu, Feb 20, 2025 at 05:29:56PM +0100, Michal Wajdeczko wrote:
>
>
>On 20.02.2025 01:17, Shuicheng Lin wrote:
>> kzalloc returns a valid pointer or NULL if the allocation fails.
>> It never returns an error pointer. It is better to check for NULL directly.
>>
>> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
>> Cc: John Harrison <John.C.Harrison@Intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_devcoredump.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
>> index 60d15e455017..81b9d9bb3f57 100644
>> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
>> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
>> @@ -426,8 +426,8 @@ void xe_print_blob_ascii85(struct drm_printer *p, const char *prefix, char suffi
>>  		drm_printf(p, "Offset not word aligned: %zu", offset);
>>
>>  	line_buff = kzalloc(DMESG_MAX_LINE_LEN, GFP_KERNEL);
>> -	if (IS_ERR_OR_NULL(line_buff)) {
>> -		drm_printf(p, "Failed to allocate line buffer: %pe", line_buff);
>> +	if (!line_buff) {
>> +		drm_printf(p, "Failed to allocate line buffer\n");
>
>btw, since this line will be included in the output, where one could
>expect ascii85 data, shouldn't we print that diagnostic message with
>some special prefix to make it clear there is nothing to parse? like
>
>	"# Failed to allocate internal data\n"
>
>also since caller may have already provided a prefix, shouldn't we also
>include it in this diagnostic message?
>
>	"%s%s# Failed to allocate internal data\n",
>	prefix ?: "",
>	prefix ? ": " : ""

or stop printing and return an error. we are missing the `.error: ...`
already that is used in other places.

$ git grep '\.error: ' -- drivers/gpu/drm/xe
drivers/gpu/drm/xe/xe_vm.c:             drm_printf(p, "[0].error: %li\n", PTR_ERR(snap));
drivers/gpu/drm/xe/xe_vm.c:                     drm_printf(p, "[%llx].error: %li\n", snap->snap[i].ofs,

Lucas De Marchi




>
>>  		return;
>>  	}
>>
>
