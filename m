Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 969CCC83F1A
	for <intel-xe@archiver.kernel.org>; Mon, 14 Jul 2025 18:49:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DD8A10E212;
	Mon, 14 Jul 2025 18:49:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VYtThGFg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 054C110E212
 for <intel-xe@lists.freedesktop.org>; Mon, 14 Jul 2025 18:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752518976; x=1784054976;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=fYCzcybbZZRFT3Q6pVUTs0ZZeb3Igei+3vOGu1XG6+k=;
 b=VYtThGFg+GVhUyLaDcXaoKnwizMitIHhDMSIkrKZFzIQvwE+to9EoWEC
 +kUbt7ku1gKyVgZXC8uuV7MiVX69M2+MMxI8QIxoafazPAHhLKLxGpuA+
 8WIHzgBuZkWknKz7ZiirFNJDZZKfiRFpuWEjs3VjicphMzGSHo77Vq+XT
 cxUMoeMui/IxhtWoVrYkpVEf7UG5AlGHhu54ujlDetgK8wrof/cQsA1t1
 ry9+LiOz4SUwG60K52txjodNMq6N+spNSmgkxTqPRKNeOx3iQjXwde8ry
 bcSl72P6P/H3qzdCIo7O9rqQ5d6zYMHQ/YSWeaBUkulKXGi+guOGr0i/4 g==;
X-CSE-ConnectionGUID: cRPeX140QPap1SLhIwgGHg==
X-CSE-MsgGUID: x1GbhvE1QhSP5cWfEKzS0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="65789082"
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; d="scan'208";a="65789082"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 11:49:35 -0700
X-CSE-ConnectionGUID: LzPtn7Y4T6CskG5Af77ZRQ==
X-CSE-MsgGUID: n9TxXl37RZKxJCZmpvAhXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; d="scan'208";a="162561449"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 11:49:36 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 14 Jul 2025 11:49:32 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 14 Jul 2025 11:49:32 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.81) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 14 Jul 2025 11:49:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Uf9ZiA1HJ7n1rYp2N6PCBI4iLqb2NIXTWDTtZNb+3URvHbzompCmaRN4E9QgYJFXOd8vdUKVCd8FkaTBS/LmPlFvBCYsyp7nEzolHrR6bFAphTGCnEgSroDq/kfA+9WqzpbsvH7FvJgfO/Fib1JAG91QEFqHtZWdTA5k6qtvuKzk036UagI8J7rgK+mQ70jr8sBEQcwd6APpYaEZonYAvVBb6xr6a6x55d7yaupePhHDQkmgmx7MXcaQz8pXWG2NQA0NTa4lx04u57cFH/rDQrJjX3pUSNGfFeX/J5IK7fA7IdEPNpTUTgixtt3UW6i6Kzc6LJ3BJSMiSfNrXciWVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/uo7zNhC0HzM6tK/QIPNoU5dcXbvDxCS3y7T79W8nrk=;
 b=EcxObigqBj6Vz+8iLBFUTdxMw/cEKDD/B85u7AQLkPfLFF5OLyTdiBnbk3vkgDL5i04D9sOBrl7Xrr+FW8YdUG8r6BwX7X1YiiRVk11ozyVzSHO/p6BLRinnCf0t3LcIWJNJ068if6wEADMuxfDF8Z8hTXDpwaFNqKyCa8X9/OFSnex+fWswRwtynFi6TFzPZ7KIGdspQYmZguXVJL41VyrJit1YZ3DQH/lCm/McbA1Hf+WfB/rFwT8OWINP5E6ASjJwbly1v0CU2F/oADOhLfbcdohYFbYLmbVPyDGkhxcrLKqbARsxMXabwpdW0Ii/XVP9sxXRA2zdOLCvvlkGwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH8PR11MB9506.namprd11.prod.outlook.com (2603:10b6:610:2bf::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.33; Mon, 14 Jul
 2025 18:49:30 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8901.024; Mon, 14 Jul 2025
 18:49:30 +0000
Date: Mon, 14 Jul 2025 11:51:16 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <lucas.demarchi@intel.com>, <rodrigo.vivi@intel.com>,
 <intel-xe@lists.freedesktop.org>, <stuart.summers@intel.com>,
 <daniele.ceraolospurio@intel.com>, <vinay.belgaumkar@intel.com>
Subject: Re: [PATCH v1] drm/xe: Don't fail probe on unsupported mailbox command
Message-ID: <aHVRpIZ4Ud4rzz3X@lstrano-desk.jf.intel.com>
References: <20250713020701.2747237-1-raag.jadav@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250713020701.2747237-1-raag.jadav@intel.com>
X-ClientProxiedBy: SJ0PR03CA0163.namprd03.prod.outlook.com
 (2603:10b6:a03:338::18) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH8PR11MB9506:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f3dd330-a2c8-4a2d-6de3-08ddc3072aa5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WACxB7Aj6P28A6BI9ig4LCMVhu3ivb8vGKFixivS9iWib0sWSjA5H63D6+ym?=
 =?us-ascii?Q?y5mbs51v9h3be1BatnzcunEf6FWRzgMIo9+wrJXoRmQKu7d1tYC8m7oa+KH2?=
 =?us-ascii?Q?dFFKVxI2u/Fp9XG/gUmH6mLXK1b8rHltQwFqDT35x8bz8MdJ08XFSzgZTlxH?=
 =?us-ascii?Q?/M8b8VOlV7UY4jhRbd08O51kNq0x22ewnYcBlMwSGX2Fghc+25TYJwFbfJPJ?=
 =?us-ascii?Q?EwNIor//o7cUB/lVMeaSOGn27cH6aKg7OwXP5uVAm5DQMT9zPhX1LvR78gAH?=
 =?us-ascii?Q?dKxxDBByMhcInYIp75a6jsSRlOGR8C4i7tGNKWpL2wXz/GxFcrnebUVO2b54?=
 =?us-ascii?Q?SA6nTRjBFtRSE8Ay8dP7UsXskXuBLVHe6uDXDwv0vUlknrB9NDa4Q1tLvZPK?=
 =?us-ascii?Q?5MjgVkML2rXj0jfD3pT+m0u4eqk6ClgPxb+zhkR3cflRsDXcY4KsCs6NJ7iX?=
 =?us-ascii?Q?Ip346dncYw+4Q1IfnTZuYHCEVxTxa1XUatVbyMNm+qFcgvgLLlqaoqUaRo5/?=
 =?us-ascii?Q?lW9okEkZCQiMOoyuuQYlbaGB1+XVB+Z+J9UqQJE1cSLEu8BkVvzvAFI2ZELj?=
 =?us-ascii?Q?n24URdA5/yQ4bi/mgD8puOSm6KM46FCOv6YpVsTsN5h1GNmiZ7I33qfWv9KQ?=
 =?us-ascii?Q?FMxp7jI8A0rhWRHf4MA+IkV2vTmdargABB8jZ1clQKFAxx3QFIG1PJG+xliy?=
 =?us-ascii?Q?tLb/oFdLbsOMJpg281qZjhTlF6bO+r9PwFQTKjoi9cZ6mzCau+dTLfLwC+E+?=
 =?us-ascii?Q?jwxoo65t3CRg0NdkSHUME34LyZg2PBOxtV3vnZOgJnRC+wNi5ncxnGAt5wmm?=
 =?us-ascii?Q?vBN9ucrcjfble0kMoGHRI+uK+fXQq5irX4yFpiFMfZqLrrTvQ83tfZLZ8PRV?=
 =?us-ascii?Q?8DZwZ1Z60nWgt/m0o0h4CDG5tskSpc8iM4p0alR067UrhTxHWLgXFlZ1zmKQ?=
 =?us-ascii?Q?Q7JX6WlbKzbDHJ+dzdhLZzplVQGREgb+qFtZ5q6aQSqTpy9N187PsS8sRHcu?=
 =?us-ascii?Q?9+tYdo0ejqPaDEqzEcNDAsEwqHWmfdX7vZqz+fGqy3DZz2qLuZYMgpH2huQw?=
 =?us-ascii?Q?Z9yZsu0LeKkXCSLpmGBDHo2tjqTvl9eaOlBcsLt6e7vFqCnoO6S1VjOp6lni?=
 =?us-ascii?Q?nM49kHB+2ZAGA4V8Fa+I7u38gVTjrmG+zeq9rz6V1E2Tb6SdMRkkKuOUGanP?=
 =?us-ascii?Q?MsmcDAM50mCGiPGPJHai4LdOphNfWWO7qQx1XzCd96Gs6JdCCzwkzfuMgJUJ?=
 =?us-ascii?Q?rXf+IaAqhrIbcRC9KoHRmD5iWcczLZgYd0irFJNgoeLsUaOhcDHMF47ow6bi?=
 =?us-ascii?Q?1JFu/WpFrmbpWJjeZ3dfOfp4vrlcQsydA0uJo5fYCHeAXkeqjtfSzB/5f6bw?=
 =?us-ascii?Q?a0nDy4srucAUit2p3+fUWVGrwRaoUCp6acK60vW4uSt8JL2stlMIDPREs37T?=
 =?us-ascii?Q?A35dhvltI1g=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?T98Lnxb71tjMnFGPZI4na2h5E0F62ePtdDaqnWdCVKw8ze16U1bECHy3Vz74?=
 =?us-ascii?Q?sQjFqXVYY56kziN3HhT5SdTz2OyXI6dp2vdx3Z/8cfJUDspmxovCK4gZIPzA?=
 =?us-ascii?Q?TOV+nTt4YpFX/arFtMMvj+j3BjYmZMa+sfRlKBxcYjPhpQMCv4Rci4l40yhG?=
 =?us-ascii?Q?fV7EOtyZblSUTLOtTCVedwFgiP/gNF9KqFGO4tJj43Gs145kLdEhDuaZcVE2?=
 =?us-ascii?Q?cniZEh8LpZFdtrUiT7fye20SUxKTqh8jEtlD+aHzg/jsMzVPfCWcxxYz9h7l?=
 =?us-ascii?Q?g+lTRaG8ausckSfaAv5EvvE806zDQkz3E5YHzKo9wbykEc9K25GJxzafjaKf?=
 =?us-ascii?Q?DtfQS1h5ctA+CNzte65bBy1l3NkWp6UUQutX7qJ2oE2gbfe1c/J6Y2QovvUE?=
 =?us-ascii?Q?15UFo2hQuV8z4bLejOvv9/ke8vHFMYZ3qwN/QNFIyAwE/tlTFC8YPlaq34eG?=
 =?us-ascii?Q?QA4f+y6mtPtdtGotYPufZvD/WGsWpqyqVvrrV/GvS3apHjtqo5f2bz29adKu?=
 =?us-ascii?Q?46bsj3/1IRpwFQx+OyOEkTj7SYI70OnzD9MPKq/ipnFMtsBEeaZp0XrvOVkw?=
 =?us-ascii?Q?qmy9Jui82Q6Eo2JTh2mwxEH/jAzR0iafxuBUEQPgxlAZoJ2UVOL1eHkbKY1R?=
 =?us-ascii?Q?p1hwo/n9sNSCdWyeQRhif6rMhGjConwbHzWuvnIlbgUDlsoO91+xhYBpu/6o?=
 =?us-ascii?Q?6ZZ9ahft6jdlCJhRCspgBMKTazkjGV5ZBB3HX6kaNPNWqDteSPw/8en/Zf48?=
 =?us-ascii?Q?eTiIIBp5QTxDLfyZbJQ37GlmlkwftsbKPEQN55DEnamaOVQhTwflCkr0ERn9?=
 =?us-ascii?Q?0yQkQEV1xF3Myg7GSowPiCwzTfFN4R2suLON8yQhXC9XVKIQMJkC57mGP/Mc?=
 =?us-ascii?Q?0O+YPiMv/qP/fIBhgp+UcNMIyfSRmCfsoNAy3rPcrDFLCnzBQ7yWpTRLIJ5x?=
 =?us-ascii?Q?LA75ZLdi49B9DesOPhvznrUsdygNPwf3ZG9EjsVHvjOr0wW91ceEDVvNeXm5?=
 =?us-ascii?Q?SdkDqItJQxV5kcCQKupSehsFPPTgvJKJAeEutrUthRAWcii9x3+g5MbhrfsF?=
 =?us-ascii?Q?qAQ8rhwkiSwZjTiPsf8nIx/JP7f4vKefE3QMUVZGu4O4iRq/DLkqYZma1CxM?=
 =?us-ascii?Q?JtcLshWdn2dkriMdLmCvQXOvbnCCFvwK4EayIDs8Ilk//vSqTmA1LHGDFFON?=
 =?us-ascii?Q?jQ+IG0mjTHoN9pvodwUCUkvQ/4dfgHXc6l4EWWi1J/N1cVzQ2fOTSR7tBLgN?=
 =?us-ascii?Q?qTOYK5HEyCq4HLLVZ4fY3RWFs+lCDu8qED7OYme3XHSJK8ixQvKBDCjHkVOv?=
 =?us-ascii?Q?BEbyksnWnIgSfptRAlUH0IlANG6B5od3KM4VvjZ3kuyMM74BTUxbB6R0JON9?=
 =?us-ascii?Q?wTtTt+Tn6v6OId8GZ1fHBYE7xXp1QGSI1KsGhAogrLqxybUTsjMRWalpa6Bj?=
 =?us-ascii?Q?ht5GTYER1TiXw74eWHMbAtpWH3Zv2mIq6crNxHzuKF/cNN57ZLCZmC1nQjp1?=
 =?us-ascii?Q?Z5DnLS20xWPePh2iclJqZUFZUwEY/Kk9g2bnS9SHU1wPC3/1XI50ZTlNXPdp?=
 =?us-ascii?Q?DbGDS9403lAGqvFSvNHGsJx6Y3UMFKPH4zQXfoS2hKtqD3X64amklV8Bp9Mr?=
 =?us-ascii?Q?Aw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f3dd330-a2c8-4a2d-6de3-08ddc3072aa5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2025 18:49:30.6343 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zl71blRYUhAHhLAUAK4sVRe5LkuUQ9PrfHkUqkQEA0eHqTlB90LRiRW6O16pWWHWPpdlnQKEHrPQg7CLj/6eBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR11MB9506
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

On Sun, Jul 13, 2025 at 07:37:01AM +0530, Raag Jadav wrote:
> If the device is running older pcode firmware, it is possible that
> newer mailbox commands are not supported by it. The sysfs attributes
> aren't useful in that case but we shouldn't fail probe because it.
> 
> Fixes: cdc36b66cd41 ("drm/xe: Expose fan control and voltage regulator version")
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>

This allows the driver to load on my BMG with very old (and non-public)
IFIW firmware. Even if IFIW I'm using not available publically, I agree
we shouldn't fail the driver load on this type of error.

Tested-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_device_sysfs.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_device_sysfs.c
> index 8250aa4620ee..654a1ba92311 100644
> --- a/drivers/gpu/drm/xe/xe_device_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
> @@ -160,8 +160,13 @@ static int late_bind_create_files(struct device *dev)
>  
>  	ret = xe_pcode_read(root, PCODE_MBOX(PCODE_LATE_BINDING, GET_CAPABILITY_STATUS, 0),
>  			    &cap, NULL);
> -	if (ret)
> +	if (ret) {
> +		/* Don't fail probe on older pcode firmware which might not support this command. */
> +		if (ret == -ENXIO)
> +			ret = 0;
> +
>  		goto out;
> +	}
>  
>  	if (REG_FIELD_GET(V1_FAN_SUPPORTED, cap)) {
>  		ret = sysfs_create_file(&dev->kobj, &dev_attr_lb_fan_control_version.attr);
> -- 
> 2.34.1
> 
