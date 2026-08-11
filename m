Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49F8FC5AC67
	for <intel-xe@archiver.kernel.org>; Tue, 11 Aug 2026 20:19:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFB7910E0C9;
	Tue, 11 Aug 2026 20:19:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FWvzoVsJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E91010E0C9
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Aug 2026 20:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786479580; x=1818015580;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=6QftMrE4vAw2R6HtArJ2mhgSxqX4/lryow7cPih807U=;
 b=FWvzoVsJm2G2uW1CUlwNWrpohO1MSiGo4KGxVQIA/LQ/lEZJt4IV/dzm
 0H7Ci7Zb7GZXubVwNzBVO9cuoJQLEASCL0YUP5Ms7PwloHunzR7BsVgIV
 4/0Rg8eFu7Y6QWldhyH7w8KRwuakMsi2sOm6SM+RfNIl4Ggjf5yD2sWyc
 iYooOuJ3u9p9QP05BL1O3NqqpoMZhyh7VJolMcr6T+r6Tc6H2PxvGIBmN
 FR1YwNPViNt/p+zVYX2qYnplfKYntT4UI/hBwkQpv2lMGqywk8uw3/XZr
 en970QUfIAk9eEWgmhjEaoho9cPbLrV6c0psvmJlQU2ecfuu6L75GpKMN Q==;
X-CSE-ConnectionGUID: d1wXfEGJSH6J5JHwz0O1Lg==
X-CSE-MsgGUID: nvqbZh3eTX6TMiKBPwdWCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="98379817"
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; d="scan'208";a="98379817"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 13:19:40 -0700
X-CSE-ConnectionGUID: kSNV4LirSsyIi9yV5KFoew==
X-CSE-MsgGUID: dJx+oRqPRbed8Vbp/CJUIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; d="scan'208";a="257218017"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 13:19:40 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 11 Aug 2026 13:19:39 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 11 Aug 2026 13:19:39 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.39) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 11 Aug 2026 13:19:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FoKIfdaa9r1d93vzWZGhqKHKt8iujRfbxvC6XejOArCgpzgpwNEZhJhUFRUyG8l8PaEa1rPRVUq06ExIc/tGUjJKLL6OedZzTHXepebWhM4sQQ5ce7HU3L5zhJErpx+4WajTGsdPFXVpkwpDlyjfvIjwBu0xmfMONl93Q7P9bzJc8bRBAvD4Jo/LSxC+9jh46WSuuwNz8SYYaJtwFj4NcYVzZeG2fRBT4flyV6A34LX2B+n8eoGWy7k5WjmytS8OSefoXZA+FDFXU72sLiNDKqYZrnuXvknsEEeLM3oTjJS+Ky7QZzaZgkUXBDHEVS2jKcYrKsB4fl4M316yElDiIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hO5vS1zGmgBcdRvMuJqSqJOa8yevu4VW9O1dBBX+UIw=;
 b=eXNqV7xQo0ygsU8zGquKRahsU+jubaA69/hMazaOkwVIcYmAX4u/cR1SGdpxfrT0VCy1uSgv8dUZAb3iTRYNjqn98XN6Z0C/m926I0o4KDy46/YkRCP/qO6E/AvcwmOPdvC2n5VyPcYnV+QA3veSC6whmPg3OehWdcwzuu4IKpBYlcpuj3E4ZCg36Omn29YvO7aceev+EyMOdVWCoPmwv4o03+0ewVFg+2viPAH55gld0wx2QYD5VoYUR2vusheoFN+8I4LxDzZzrxdPrwGOk95V9Bt23NY1EjlHxpdQvJ9oEXnFV6If+lp9k61W7fNGl7JnejSrgnwOgi+gK+JS1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5073.namprd11.prod.outlook.com (2603:10b6:303:92::23)
 by CY5PR11MB6509.namprd11.prod.outlook.com (2603:10b6:930:43::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Tue, 11 Aug
 2026 20:19:30 +0000
Received: from CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe]) by CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe%7]) with mapi id 15.21.0292.024; Tue, 11 Aug 2026
 20:19:30 +0000
Date: Tue, 11 Aug 2026 16:19:26 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Karthik Poosa <karthik.poosa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>, <riana.tauro@intel.com>,
 <sk.anirban@intel.com>, <mallesh.koujalagi@intel.com>,
 <soham.purkait@intel.com>
Subject: Re: [PATCH] drm/xe/hwmon: Enable package and vram temperatures for CRI
Message-ID: <anuDzkGVbxrhiL5Z@intel.com>
References: <20260810065053.620270-1-karthik.poosa@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260810065053.620270-1-karthik.poosa@intel.com>
X-ClientProxiedBy: BY1P220CA0043.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59e::11) To CO1PR11MB5073.namprd11.prod.outlook.com
 (2603:10b6:303:92::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5073:EE_|CY5PR11MB6509:EE_
X-MS-Office365-Filtering-Correlation-Id: e1fd6e8e-1bb8-401b-f81c-08def7e5d98c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|22082099003|18002099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: pnN56EzdEId8nP9rgKWc6FY7OA6FyyEYDW7ZmbTj8pJgIh/k1QgK0MG1MyMwZkLnI58WT981cK8aNNoargydMdi2CPlG/PeYCG8dwkeUit/myw22JxVVorxaBPU4p41I1hrNhbRJOVaU6oDthxXi2Q2co3gRhvN6uyMoggTZgs++T9My06IWliuyGYfuAmAxV9X8keYV3CqXvh0frhDOqlssx7mgIwItFSWdk1oo7D4FbhsuFSNuWTBv3Ald4Z8mMMgZnUiaCYeGg+ltFVTUifmrq31n3Mi/sWelFc/7PEwInlhN46kOfNUNnU4ZZwSlHrHz6zNO7w2CU8pe+8d9ZkAdgnHTtUsn8uGhREUGibjdEkzT8U0NhG8jLSsuqxGleacoonzPZjhF65LZE+JJfBV9JUrtkBy9XMi/BI+jsegedUNYAhvRofKYGtIwJ9xZ9Hh7TrRAnuwzEbq4vp9JTOpc9Gr6f3qbShKbSrWL7ML4bmbX/s16AzwyKrLyd692hUIp42LQXT6pTpdlm/pxS+6PhDtihJsH1ORRaX+t+5xeFwHFxrmqMQSwu8W5da6du8iD0VDx/XmN/WUQvetZxawAfKjFYV3WUtsxF+VKTor6TkoEFXAXXXPL2U488MicexauKkuS3ux2R1JlkhOHL3P9G3XsIbaTHFSPkueyClI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5073.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lynoEkRsLT3igqDKotcN2ISGsBVwwWvcY5VI9M5yOHdZIhzqY3y7BJqG29EV?=
 =?us-ascii?Q?4c3SQsDViEFsrjyql3fIxMpAZyAIj4FPKMgMPmPUmu48PhSu2mqCu5c3I99D?=
 =?us-ascii?Q?AsrNrkc4IJ0ZWx4o/d/9GgENmCLoCU3L5Z1759h5O5ThmxLvd+YdVv4ggpML?=
 =?us-ascii?Q?mb/vJc70WEcQRpKxL1LJtdc7b/aTVZT0p7DL642qfLvOqXPSmGAEn2JQE6CA?=
 =?us-ascii?Q?MVOgHpcfvxW+2mKryhxKCxdGm0KtjaqZYK0fbJDWlpg3MbzfxN1HN+W+AuFI?=
 =?us-ascii?Q?OewCOQ0On3q/ZnootK1L/OZkif5flSp7d+XpJJmPgV8h3n6Q7Tr9LDOQtjMJ?=
 =?us-ascii?Q?DKIEFRjeP4RdHveqXvsklVKoPf0GHfGn5ygo2y8M675ZtXP2IOWXT0iwsLjf?=
 =?us-ascii?Q?sYWeV9n3iL4SeDyK2h5iadlI13Yzxt0eL9TXOX2IDW11o655cFpa7IUqKg3k?=
 =?us-ascii?Q?57Yu2Goj4MIdTj0XSaZlAyXGTtKHbcCni2trDXC114gehR4v/68EHnGTMnEN?=
 =?us-ascii?Q?E8wP/BQoWz17n8rmMbw6WJI2b5m7CoEWpNuFvKZd6k0YTDOYWyz57ZZ7IWqX?=
 =?us-ascii?Q?xIPbqgpMpLT23kFpzVpgWyd5E6fn8djToeMxxmg0jaXyvC1yXA1WSL9Jq02q?=
 =?us-ascii?Q?/yZ0b9Yvzsj8XyJPvkaAxzbqRS3U3wxuuHW8Os4Cy8PEnUL/BmDhupXSArpk?=
 =?us-ascii?Q?JT1aur6VbVLOSsvfYvPaTtYxeTGUm3cYHdJkLON9GVnzh9R3fbRi5QSLox+0?=
 =?us-ascii?Q?pHYFqeAWVBtic6kZorhvmFAWuf2yFw3bVf2WR+Pczrxk/J0R7R/Ux5XfkWaS?=
 =?us-ascii?Q?eMkgxGw9Jg/Yy/efI5gSC6HDk8e3PgyiruhxrDmPgjs/RihnAsmQMzS6sEVe?=
 =?us-ascii?Q?BHI0NC/GGlsviCUd0yqVzCCHHoXYGDlfidhf7IGnL6pRu0glBKUR0bA23Uod?=
 =?us-ascii?Q?/RCl81vWXK0Rm8G1yxWHFtGrNA6VF0RvFYf1yL8HKGR2v1+uIiMKfCyDR+iV?=
 =?us-ascii?Q?S2TSJ932SD5KSW4Rahwht50xVo2u4khbNnA1am4ChN4cMHuYU5fgU93pZZ1Z?=
 =?us-ascii?Q?y4Pe2iRcR3zrTu8SEQxZyq2TTm1cAYmfaSCi+eTEYlgMtYY56NYypOBEWYrf?=
 =?us-ascii?Q?bnohB3AmHgOlm86URriYV6BeIMnoo/j0BX27uqibKr/hdDz2SETlZPQklrg3?=
 =?us-ascii?Q?d19YxYF69CcdkyRPO3dirkY0pqJa7fhIY9ZbaopWg5EpeRaWbH4AOMOwP707?=
 =?us-ascii?Q?mNFyTo9YdyeUHXkghk7LaMvYhKDL46QWBIgXFvw9LEQ3nlUSLh8Nrm50R6zl?=
 =?us-ascii?Q?nepga5CkrKvXrAegA8Q0MmeVSJV4zHCL1CknBu11nZqYSmfUiiJQTMQvpnW7?=
 =?us-ascii?Q?2Roqt5VtpkFvJZg/vlzUN1GbMFeHD18BXgoAChUn/kBtY7ElEqWv7Q8QD9Nv?=
 =?us-ascii?Q?RCGtTmvU5exMj9/9h7FH3cZVsOjNEOtuL9HBVhkucJWMQkJvh8wi3ECSW+2z?=
 =?us-ascii?Q?RfWP8EWsB63Ims9vCVrHi/y0g+fUC0HjQ42+5/jPyo0fpFL3BdCzE1jC7u7v?=
 =?us-ascii?Q?6ysHgBiwIvMLRLff/xSxDgNik1SUXeRzRzblDzoQEIpM6v6QZvD1xv3Lvzns?=
 =?us-ascii?Q?GBt/fj9WqFxR3qSh3V31XrfCSpcB6sX+/p6N0m5cj1vf9TaE4mXmWsDik0ps?=
 =?us-ascii?Q?D4IYIgwc7m9rVC/ZL7dVTSDtc8a7cM8Ke+CjtA1QQkah5SCUrZFcFTbqi3sm?=
 =?us-ascii?Q?JSql1GtWYQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: k5vT7vXsH350+XC3pfT+nIAI7/sBsXK1ykttKwzFZNfsj/VhEnVOCWhK0TgAlxnbkWol0TlrUJ/T+F4lfb8lk6LDHQdsOWRVBZJd83NZR2KI+/SU0Ta0XjZ95v+Tg/B76lU0BJzjePPZY3tzN1XI1cYYXw5/4yWE4a6fSDNeJUw8VJA2yEMohl2NgmBkS9CxWflinWQaj2SsxzgTtfj77QXS5piNEPoXE6O3bUo2F2vZ7oGtl3I3mM5U4LFcxBleB87eKBU/2dd72WGMwPgs0IrasZvVSMzwrLJpWhs6Q2yrIy6GNEpn2jX1vtMh67qA9uExTBH00N/U5W3DQKr9bg==
X-MS-Exchange-CrossTenant-Network-Message-Id: e1fd6e8e-1bb8-401b-f81c-08def7e5d98c
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5073.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 20:19:30.4957 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4lV5aGWJrsNx6ZJ1AvfDPfFlwOcrxtbo2gKWweWoQZDYziTDqWRjZcS2B8kgpF+z4SIB1B4dl0Pp7tzp2XQyJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6509
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

On Mon, Aug 10, 2026 at 12:20:53PM +0530, Karthik Poosa wrote:
> Enable package and temperatures support from hwmon on CRI.
> The required MMIO offsets of these are same as on BMG.
> 
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_hwmon.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index 49f7e0edcc4b..5284cab6703d 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -266,7 +266,7 @@ static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg
>  
>  	switch (hwmon_reg) {
>  	case REG_TEMP:
> -		if (xe->info.platform == XE_BATTLEMAGE) {
> +		if (xe->info.platform == XE_BATTLEMAGE || xe->info.platform == XE_CRESCENTISLAND) {
>  			if (channel == CHANNEL_PKG)
>  				return BMG_PACKAGE_TEMPERATURE;
>  			else if (channel == CHANNEL_VRAM)
> -- 
> 2.25.1
> 
