Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A131C27C79
	for <intel-xe@archiver.kernel.org>; Mon, 17 Jun 2024 19:44:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B624E10E0E9;
	Mon, 17 Jun 2024 19:44:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eoTYx6ej";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEA4C10E0E9
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Jun 2024 19:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718653493; x=1750189493;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=K7oQZPiRNvsUcNMRjwPiIQQH+AftdfqsCbivtsqP4sk=;
 b=eoTYx6ejLFK3lVAzZxeS/cQce9Jd3Dkfyn9yxxvtZPb6nmrjpaEs1WXB
 UzPE2oScwY7Fztu2ZREukLrrWrIuxy0NljP31FxYpIrNVCkN6LsN68kHx
 ybK1BuIQNTbvJ5sRSDV3MWafLvqck/SQZsgrPTFcGAX7AI7CGQd/VWg8F
 8scolOxe9ebLufieJqFZoDQxDQcI/ZAEygwMr/A3oYwXZieOgFUFCr1nR
 c4wUmTY5TmPxur4mQAv5hiSIPLIt/0EkN7iv9W8g2o5B5gKAWiqzbK9Yv
 mWSI6YtC0QRjbmmRu1cC4AwWa4e+SHtxceFzhQ0tyqW8qERn7eZGoEGxm A==;
X-CSE-ConnectionGUID: gkomTC1+Qmi527SkLi2PoA==
X-CSE-MsgGUID: ztTvYRNPSJu5sZLzuG3XDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="15219139"
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; d="scan'208";a="15219139"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 12:44:49 -0700
X-CSE-ConnectionGUID: ebB10R2MToe3aUZllBEDCw==
X-CSE-MsgGUID: RyCioSu7Rs6VDAe6ZObRVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; d="scan'208";a="41233875"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Jun 2024 12:44:49 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 17 Jun 2024 12:44:48 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 17 Jun 2024 12:44:48 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 17 Jun 2024 12:44:48 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 17 Jun 2024 12:44:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X2R6kFtIPWvk7f1h9bnOHItsZspk7vFk93eKre/vNinOAdfSxTgIWhVcPaPD0fu9VoL++PMx3trvafuVOrVqESNm71Mf8+IdcdVRGPYke6F+UKHKHKlbxPE3TCDH/YUB3FceDKdSQ7YmnNFw7FXSbwEpEyVulpw5ThcyefA41Sm2kf1wuM8RcL97onalHDp7BtsXX2dg1Z7QdoTm37W1VZ4P68zqZPdc7rey+Z8iYKNEAfOLdr2ge5vd9GMgm6dBiov3moUSN6uyCPKEzPzNvuM7TJH439PcE4zELVpVBJdQ1+0BRrvsDh2CPPbSI3On/vwCDCf8UjueDAtGiUcAPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0iNr14lKyRhiQNNzdX7k2xpCUca3HvDfP23WeWo4C6s=;
 b=VXspN5k9r0KcZoOfnO9re3fE/7YTlfWW9N4N9So3lyyw396G7L8rSyWAqQoXKN9YMMJWNrMXiFeG+fgxuj5y22W5lsGu2ZEvxBMgnqzG6wYxsEQFZmk0OyCfAq1msmVwwIivQG69Ac7pZ00npNELiCIHQzrTOfRk1Hh95SCRmE0AiYyrkoLS6uXvVyWJZZ7eJXUqXISQTlNFufKBtYHVMTrevf5AAvVNcsCecyvjV8c2lyklnXgT32OzTgOsCsJfAiP3hS4X9quupvb3bNcLn7UdBY5mSlA2vFKSqpmunNDGiWRXfy3LfmFrw+O4cECMnKtjnkhr9oQ03elvOcOfRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by MW3PR11MB4553.namprd11.prod.outlook.com (2603:10b6:303:2c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Mon, 17 Jun
 2024 19:44:46 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%3]) with mapi id 15.20.7677.030; Mon, 17 Jun 2024
 19:44:45 +0000
Date: Mon, 17 Jun 2024 12:44:43 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/vf: Don't touch GuC irq registers if using memory
 irqs
Message-ID: <20240617194443.GK2905419@mdroper-desk1.amr.corp.intel.com>
References: <20240617154736.685-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240617154736.685-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR03CA0100.namprd03.prod.outlook.com
 (2603:10b6:a03:333::15) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|MW3PR11MB4553:EE_
X-MS-Office365-Filtering-Correlation-Id: 244b17fa-80c8-4907-1b3a-08dc8f05f0d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|376011|1800799021|366013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?nyRGS+LoylEjakSkjRv3UIwF1ey5FOCotycKzsFTCDOdGRcrunUpMtjSrSiw?=
 =?us-ascii?Q?8id59utjfDB0uufkGm6RoxslUK8mQzs+NQqyGAwNUAuGCtnvxadZbNvxAByb?=
 =?us-ascii?Q?HOeHyKJixEpxNDaCV9N4dezxumwZXIq2c6rh9SevqN0SWE7rKWe6NCeKdt5q?=
 =?us-ascii?Q?T9uyyrVrbJfeCpsAwSwllYtEJJYZnAM6lZHUu5vXCLRvuzd4JrQkRhjPpcCK?=
 =?us-ascii?Q?S1NhLDKbftayyR0V5Q6jgtun196wUxnhgTOOcjUgUuRKRUN76A//mO+RxXck?=
 =?us-ascii?Q?yUmD9fDBHUr7hxTGFHHH8k6YYAj+9ZCxLXt2skYJf/ZHSLV1+u0DjoHz4q30?=
 =?us-ascii?Q?euuLNEdGTN4EXasgUCcElNmokEYwNvAlIvPwa/k9Z7aIKx+SEbpInS3GoxMG?=
 =?us-ascii?Q?2osAAu1isIHUwtLv3wPomEVWlcsqwkUYtCmjf6pSxAsxbFoNZ5VweKImtVh7?=
 =?us-ascii?Q?Tr/6dPR9csGlydG4kFhePEt1DGwtPz8O7mb592A0jbt1WMYv8hVbZDffFsbe?=
 =?us-ascii?Q?mgSyK+w4B+puKWVL9LfLl0XevYo/5vPZuDkCUahm7K19gOlOzo5fWus7N+Xp?=
 =?us-ascii?Q?hXl4HmJ3q2vf1ZsDTiVbdV0yr2ldpyguyiQI6G+CCFjQtftOPe2ENGQ5yKJN?=
 =?us-ascii?Q?3zZLTk2JvLkzxaSLUQCHy2OiwdNExCgJhvETVqn+V4jcBT09HNeIg4rdHUvY?=
 =?us-ascii?Q?ViPcTfbw0VzGRJkaw1ecSNwBFXIRGEwjXjDGy1erF/Wp4AoJDU/RAUIozZ/y?=
 =?us-ascii?Q?ChBDdUH6JHZjzUMNmhStJKJGFRwgjcDKUO+Qe2MNEL0ksa84E4gUrH2kb2hI?=
 =?us-ascii?Q?IKJXOXqYNQJS5ELP960p2Tk9HlVNWiYOXJnkZhf8hh6oBI95FJLq29AKNkBb?=
 =?us-ascii?Q?GWl0s7EcUw7eJfGcCKfehdBE9N81Z4Tpd2Vkw8HWK/HXdiMHlv6A7xwOOu0x?=
 =?us-ascii?Q?evcunjhkEBvXMgHlTMliL90BDOPSAZSojZ+Z8TPCYb6Qz2b13L+FhZ/Z7dg9?=
 =?us-ascii?Q?qlHVKXNXhE6XWAWnnsFFn124N7gfbcRUZzwacKJ6DX+R0D1uWAep3//NIY9N?=
 =?us-ascii?Q?UiuRSDcoLDXe1zoUXzLvdY+93A6yLLqMO0T08gOIVxJ3DCAwhiH6PGS/86D6?=
 =?us-ascii?Q?olwCVgZAcYi+X/fDTpkar3z7yt3FxsK14SfNtw8hWg7djxPng5GcfNsicof0?=
 =?us-ascii?Q?uzHJa6ysPBi51pXRjI7oe8DnCe1zA82UBDq4zdgSud+gKr5u8ngmMv6/J2zx?=
 =?us-ascii?Q?56Iy1imGphBe4cZiLRUwctPV9a+iRhxBpO8VqKJicpEdhY0PXSDWzRO39UeP?=
 =?us-ascii?Q?gXvfsLfbjIFkPB2v00zFVaPC?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(376011)(1800799021)(366013); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cdx7RHdo41x2LXqyOIpzHTqMMFutvXr469F/n+wq95Mr0M7P1w6U67sdpyOR?=
 =?us-ascii?Q?Sq7zz7GhY+OGFvdDz5TuenbncaHg4Oy/4Bw3ICn00xbvCQKUibDpEVM7/wwB?=
 =?us-ascii?Q?VhenKvcSHQykLLxyr2faJflDR2NmvWxbwB5fbCdLqeFJZBx69ExEfpKHEGSk?=
 =?us-ascii?Q?NChdzfkMmD4Nyn+0ZWoxnctwzA3L+nCRwBSVuaHJzohKiinlkaHqc0YDIPv8?=
 =?us-ascii?Q?QpSeJuD9SquQiXIB8tL9r2KP+UpQM1N7Njwo6uHWQT4edLjHkOhz3dUX4cNF?=
 =?us-ascii?Q?YkMWQ5LsEz9uGbdElqKBcFO252tqGSTKTyi/UIwA/75CWFUp1Zyb5uV+/85v?=
 =?us-ascii?Q?b+FeqgZVi8Q+ivig4GoycMyTb9ggLt1YhfouZvMswNyxduueA8Uvsx21RmxG?=
 =?us-ascii?Q?zEz66BWRnRQLL9IGr9FkaqHG6yEL1JpYjNzT2w+WSraieApRRjpvoWrvH7v3?=
 =?us-ascii?Q?xAjwL4qT8XqGL4LY7thuDMYO6MKPPYB/rssA2NVITzrNmPq1eF73JzQxCwI7?=
 =?us-ascii?Q?bsfcM2VSJ+ixq7EJkQSPyeyc1Eanf3G0AX7+17HawEWeKkpSa3mfDawoCnwL?=
 =?us-ascii?Q?tKLrCyRGwJI9aa5VqepeO+Wp1AYV+v1wQ62ZjjtJA6/3o5Ob4J3s9h6V5Q3i?=
 =?us-ascii?Q?GCkV3F1gFak7pDpWN9VGIfEvfl/LgkjEHyjN723zGdTI8pof42NJcwEmZjLN?=
 =?us-ascii?Q?u0+SHC6Jf2+gBwDXB5LWjUDq4WgKP6/eB+mgpCTMqhdtPNIVWdt7/JxSQxk2?=
 =?us-ascii?Q?iE6SlfsKAT/kMaNUmm/S4hhf2Z7P2QwDDR+Cg7wfGpYcJ/Z/vEyTId7KX270?=
 =?us-ascii?Q?EHL5gsJNwh6tJTnuU3TpaDKdGKU21O36neSAWunQ18tzDCRgcGGDvNDhhFpt?=
 =?us-ascii?Q?BMSv/I2f+sbKq9/qhsm/MA458TFUPAwS67gxYaFcvsMwFQgYKIVnbCR6c4Fm?=
 =?us-ascii?Q?DIZKCMrWI3kErUiXefVoAEQ7cVMZJaI9NXdNAytPoulGcVDx0U1XLgJGcm/h?=
 =?us-ascii?Q?c+dzHmpdwfbrOIUzT9aqBbKA6dBN/GFuzZiCHwZ+ouD5hm1RrNIJMeA6/6Px?=
 =?us-ascii?Q?2OV8lvvooNm5nfSHfwyzRUOAQmD5BkTauTkogJaCGrcfbl00buXn1dw0oH/t?=
 =?us-ascii?Q?Ubx/zmeSAc1Ac4bZptIbX32LYuFgo1wR9Ex0h50HiJnLUMdQrzaIlHTmxigm?=
 =?us-ascii?Q?zBY6xTJQe5i7DSoJuQnqP8Envzw3Mvm2XCLfydbUwVU0jyTljIGdE235zEPL?=
 =?us-ascii?Q?jE+ky2ILph95fgMQn0tu3oNHqP4+LGt+jgKCSlUdvfABWOffwDA5qa1YIzMn?=
 =?us-ascii?Q?fPbVYqMj+GVaMqwUAHlFSKpSFE8diCjvwU5WWo+Q4PvY0CjWYihoi5qU+hHE?=
 =?us-ascii?Q?+eKPvhAJGys3b0rrnscFSdSGOg4mjIIH8zfFjrKdQ4zyNHm09Fs94rkXPZjW?=
 =?us-ascii?Q?HHUKAwTG4fCZSUfn1mR1LQxedoVk1NkiG96wLU/bRi9ggC6CFwPkU0YegqXr?=
 =?us-ascii?Q?NuA9y5OjUVC5p36xAzIJY2jQQuF8XSb7Gw1/ipb2V9IS8EXoSU7tiofwOkaN?=
 =?us-ascii?Q?q2TE03S5LOMu9DZvIHU6cN/tyzxdT51AwYfByHjuPXxsh4m0e3q90UjHGFs/?=
 =?us-ascii?Q?ng=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 244b17fa-80c8-4907-1b3a-08dc8f05f0d0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2024 19:44:45.8676 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4yB45AzzPbv4638q5lMWYDtoXe7J1fQdHb5CBPDEnPYa0re9fjPBUgxdNbTffdax7ZlgcTIlj0XjCA2DTQLsmVuWx2Kp3nj6al/7Vec0/oQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4553
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

On Mon, Jun 17, 2024 at 05:47:36PM +0200, Michal Wajdeczko wrote:
> On platforms where VFs are using memory based interrupts, we
> missed invalid access to no longer existing interrupt registers,
> as we keep them marked with XE_REG_OPTION_VF. To fix that just
> either setup memirq vectors in GuC or enable legacy interrupts.
> 
> Fixes: aef4eb7c7dec ("drm/xe/vf: Setup memory based interrupts in GuC")
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>

Confirmed in bspec folder 53221; the registers written by guc_enable_irq
used to be VF-accessible on the pre-memirq platforms (e.g., TGL and
such), but are no longer part of the VF interface on any newer platforms
with memirq.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 0e1a5674ef13..7ecb509c87d7 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -854,8 +854,6 @@ int xe_guc_enable_communication(struct xe_guc *guc)
>  	struct xe_device *xe = guc_to_xe(guc);
>  	int err;
>  
> -	guc_enable_irq(guc);
> -
>  	if (IS_SRIOV_VF(xe) && xe_device_has_memirq(xe)) {
>  		struct xe_gt *gt = guc_to_gt(guc);
>  		struct xe_tile *tile = gt_to_tile(gt);
> @@ -863,6 +861,8 @@ int xe_guc_enable_communication(struct xe_guc *guc)
>  		err = xe_memirq_init_guc(&tile->sriov.vf.memirq, guc);
>  		if (err)
>  			return err;
> +	} else {
> +		guc_enable_irq(guc);
>  	}
>  
>  	xe_mmio_rmw32(guc_to_gt(guc), PMINTRMSK,
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
