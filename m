Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9412C197BF
	for <intel-xe@archiver.kernel.org>; Thu, 27 Feb 2025 23:16:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97AF110EBB1;
	Thu, 27 Feb 2025 23:16:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jwwI1Wil";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A65B310EBB1
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Feb 2025 23:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740698172; x=1772234172;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=uYJwhUzELMseiqtS0pIzT9FAD828xl8XNg8eLXO14PY=;
 b=jwwI1Wilaqm9M6E3aLR3Z5ZtjS2B1f+HUfnMKVbWcgL8XiuwvfCVKPM7
 ZQtjbkxr+7H0+qmEHB1dys7gBWRzhFfhcpMymZ0pE0ZHQWtwpsPu64Q2G
 Sgkr6yQR9QvqWyaa2Z0S56zYOI7ZtRFnb2pEKawRTeQ9hVvgDbzRDQ1B1
 4GATe3Xoe+sYh79z8PMqvhuTRP6xq35RccjdiUayGzWnVT8TirZKJ/zBk
 cocTigyU4QYLua4X9tjbLEuT+MceqiCLtf31c2/fYNA8rjTsN2p5sYS4Z
 1uvEHCmiQjSbIcDbVzGbm63uCe3M4aTwWVoKcEEUJSK+Nx9o7u8aFWOQT Q==;
X-CSE-ConnectionGUID: 6UxiRic/S46BFMfIOovQpg==
X-CSE-MsgGUID: Bg34x3mPRgKQQDEabDnR2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="51819650"
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; d="scan'208";a="51819650"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 15:16:06 -0800
X-CSE-ConnectionGUID: xmEFOfGBR92mNGbYX3Ow6w==
X-CSE-MsgGUID: AKZjikvBSrqDd2UsRN4QgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; d="scan'208";a="122118130"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 15:16:06 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 27 Feb 2025 15:16:05 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 27 Feb 2025 15:16:05 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 27 Feb 2025 15:16:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GUjODZEaaYJ90EvtwG/aWcS8FRti+JrhwlucyXLYiF17/RFQPwVuPPd1QDQa+TJLFB4LqTgFWESnt+5V4uCLduKlKTZpxrakjoFAy0SLxl54sEowMuP+NlIDFR3vrNAipeqUZdW99b0b3IOVinpXk+TKFMiG4rTpnIKBCVg4eAoMMCN5L4BUd0pJQmu+LPGrzy7rk8DcL0KqWTQkrxgDyikWVlfsbWqaJ7dCoHYLzH/sutd1VewDLgfqH7GByeyTSw7OWmMyaSMwlpWwK83CcOo+/rHUfzIHt4c6WOPlguOGR/N8o7waqzItfcqTu1s8SyW1EhGKnNlNEGwGN6UbPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s/StO//C5jPhM+0dZ8e7p1yDLx/gicf4tmLbBUCkh1g=;
 b=PM/UoKPth/BkMnj4/0RCot2cN9MFxEjTccHvT3JhgEr3+UcQJ7Ehx/hffihTkNX/pnhpfsnnpMNF1geDwpz2ecU/QpwKbrJnP5KWu6VXdzm+YvDghEkNsYbsbGtxpM+4g8zGyw9xSoTzlF6eIS0kP0ckeARhcuxMZBsD9EA9R4+kxV3QyMyRTNabtiez8jDaKHRawUji2G5VzF9ALeOfYR0HgduhqohTvmYsnZlX2c8S1wAXcL3E0oegIH0KOQrxFMeJk/SeVCQGmpb2c9sg5Bs/15vFUxHy7NSuVW4vIZDrWMZoAIBxB3BvTRNAZzYLgwxVa5xzQtg4rYbPcGXTMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH7PR11MB6978.namprd11.prod.outlook.com (2603:10b6:510:206::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.18; Thu, 27 Feb
 2025 23:15:47 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.8466.016; Thu, 27 Feb 2025
 23:15:47 +0000
Date: Thu, 27 Feb 2025 15:15:44 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH] drm/xe/xe3lpg: Add Wa_13012615864
Message-ID: <20250227231544.GJ5109@mdroper-desk1.amr.corp.intel.com>
References: <20250221112200.388612-1-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250221112200.388612-1-tejas.upadhyay@intel.com>
X-ClientProxiedBy: SJ0P220CA0007.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::15) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH7PR11MB6978:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b8cf5d1-347e-4c77-3932-08dd5784aaf2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mXffoK/EMh29ecaubRxnP5y35JAnG7bRuoe9YU9MAKPDlsb/GLTeICipmyCE?=
 =?us-ascii?Q?tB1WDeccEURraanHn6GUo0TMHL8VgDhsms5jf8IMO1DNBTVVdUH2YZlHUprz?=
 =?us-ascii?Q?cp113tHRgwW8SACEHA2gCGMc20qvdSBPq8RQ4uVA+KCrxztcWjfIhN0QYOyv?=
 =?us-ascii?Q?ybR+Fbpwwmhz+Ece23F1Qppaw0544qMP++8nHhRGoD791h3wZY8rSCVONQDl?=
 =?us-ascii?Q?HR3idNHr/JbzXE1+Wbs5ETx8IshUFZFFkbcUj2r2gLoX8rdzl6LChb+bjkLs?=
 =?us-ascii?Q?Tau+Uukp2vWz90rb9Rgu6my4IYAyidZRtcXGM6SK3mXFqhGtFc8ASOudYkbE?=
 =?us-ascii?Q?dGqPwEFV8DLiThV2VQotMQjVhwg5M5Z7tTpI3FMu/OS1wfDBEovZ4swtPf6d?=
 =?us-ascii?Q?W9VaOe+0/1wbSL9cbJEExaOoA9K+li8nyUp48gkeKNax2I42LLrotQCw8Ksm?=
 =?us-ascii?Q?YJ88w4eklz6EENcY04aAfhj7ZTOs4STKn+GRltMt7OFe8/FqVUV3eMlYzmau?=
 =?us-ascii?Q?CI/cSimgxtG3xSJsZXFxNDFxr798rd8CdaTeUsTHDvHO62Ew7NSqHnwjUdUA?=
 =?us-ascii?Q?/UQfNrE9PXIue/gcvKDHRu8/9aKK2VQ2HekDiBADmmKQ6u/rrYY3vtC9qkyg?=
 =?us-ascii?Q?YIlaKogTn7AOu3W4To0JR9szgTQ82S8njn13TafIGPHcCfrpsed7koF8wwWE?=
 =?us-ascii?Q?XAQD5D37IAD2D2+ONoNS8G/Fw87UmWwfo5g3hgA1yMrcwQPdz7NS8HjnlVZo?=
 =?us-ascii?Q?CJ9OOsG8PY4ltmOkrLc76HUqbBOkGMpfTBzzbldHZVXb/yJssrhoo5Xd138k?=
 =?us-ascii?Q?MP9oTgm9Ts6mDymo4M5TaZD5in++AvU/lGjAzQlDxFOuzyw74d6qHd6oZl8A?=
 =?us-ascii?Q?rysIoLvaM9bdDB1XWOCwH34Oq0qpS1xS53i0NoXdI5ns0C3uU4AQxMfHEgZG?=
 =?us-ascii?Q?ZYi0hQbVbVuxc4EFLZd64g7H/OLgP7YlUDPSjJ9wxFcYlr/Um+2+16i7piwz?=
 =?us-ascii?Q?ZJsjRcYu/TgM4uclTdTgXcKfCN/TIZxOFg7Uu9OZTRxac6YPiOEY4tVBvZio?=
 =?us-ascii?Q?rMZxZmWjskfbI8vp61rvAIp4wELsNeznIk5JGdLeOXXYMJ5saoYuIsfPxNP5?=
 =?us-ascii?Q?fWEDL0KSF7jNmOMqhIgaSl6pLz6WrSsyU5nECJRdUwIr0D6qh+44HGhsh7xt?=
 =?us-ascii?Q?pRQ08WWN30wPL7D3R8E9CJUJ+6rkNIkWgWX/ViFS0FsFkQnu7rWiJUeb3ArK?=
 =?us-ascii?Q?X+jzIC4FSeH8KBL7Njl8re0134n7+ScMc54bCFOIvr306EG+fJODhl5tZ5DH?=
 =?us-ascii?Q?awDRivhX3c8CzuVacIocNfGyRDnu4wH6YeJmBhvEnIHDfcMMZJFzkLuwowxA?=
 =?us-ascii?Q?3VM75U7cSOQkHw8YctIq/kU3AlCO?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+X9DimQWqyxyr1eDmqslGlYQ5QmB2t35b0MnQrlQC7qKF2jvNizB8vdEbhmV?=
 =?us-ascii?Q?ArH5KczngqUr+0tzEasZdfJLrO3qVNokqYwjZVqLXTswUCWDDSL35tk+KBuF?=
 =?us-ascii?Q?khfsF/KxYHwlcC5UbKIRg9ZuQWpWihd3kS6fr3VUlueleQVFdGFjhrlz/cs/?=
 =?us-ascii?Q?X4w3sbG3FeL9RH8IkykiXcp2hn4NYKwOZpjdAevRaozhUk0p8OQZKpmpnAoU?=
 =?us-ascii?Q?fNc+e375V5aML6GSlZ2OwEi8/vGrnkT1mElkahrJgiyp7FU+OaMZItZVXQHF?=
 =?us-ascii?Q?/gDxitvtzc4vt1u+7xuiN2Em3WkacexFhhFkrkkiR2E+RbaQbx0qCPpY1jYK?=
 =?us-ascii?Q?jNkT4tIE5BMJvIrctB9+EeUSgD9GIEEPSwVtnYbalgDJ0u8WwnjgXyQkrQQV?=
 =?us-ascii?Q?nM1oL/Jel4hjd/nVQoCDgnXGNHL+OgKHtUSzCs1MVI4Y4m1uhWcMqeb9nrgN?=
 =?us-ascii?Q?ihKEP2isOcqCAf4fK+gStAxEW9DAnvRiEV+Hf8wUFWqYkETxQiyJFjOxbq7j?=
 =?us-ascii?Q?zE5swPoPYi5WKjDBgwAV3ugUq0dxD5xOfx2btCDk2Coc084aMPiz869PN+ka?=
 =?us-ascii?Q?FfcVjZqdteZXrwdcvXE4gRMJgFtQFyLnMeCyMJZWJdCN9y4dbvBolOUB0HBG?=
 =?us-ascii?Q?Q3Lfoe5yRYOCUD34pYamTAqBvbSIQctne5952IgTIYBvACdgS7M0mLLMNBse?=
 =?us-ascii?Q?OjDATJzjnKRJWE9BDKpsuhHshbUH5c76MaWm1/qqlqjFFMgy3L9LOzmL8haQ?=
 =?us-ascii?Q?OvHJQWWAeybTiV247yXzFzOmTtZft2zY3bZDECiOe5HJRz2n+5Px1tprmfBE?=
 =?us-ascii?Q?O94vIlNFxInuVFm53kENm9rd3wnMM5BtDQNviA/iYLjjwCIaR48V8hxHHfkJ?=
 =?us-ascii?Q?oRHRico4CWBmC3UOgKb+dQYkizarIxa4rxrX8jT9jkJKv1eWPUbtMp9n5MhU?=
 =?us-ascii?Q?vMiFjtRH8T2H1hodET9jI3izLAXD4c3glwMFOT2RdlZ/0BZOLfdExOvs8etz?=
 =?us-ascii?Q?4PFrIIijAwLzlQ99gcfpgL2nwmPyr5ICHhBvdeGtfoWROTlurHyn6ipHE3LF?=
 =?us-ascii?Q?9l+k3CSRVseJDGACHzORbXigt1tpyYB5IfQJsWQApsJwiZUOWZJ/pjfjZcqB?=
 =?us-ascii?Q?cmphe8x2it3jw9ziHzDsGK5yS6MCrXJqIBg5fktPMZwDSrJe86GOEadbJs62?=
 =?us-ascii?Q?jrv4dc6defD0jX9lP7U20L5EAbBKAaUv69KbsDFYG+Zr74fLmcZJsNjHXtQN?=
 =?us-ascii?Q?0oQbNy1/sMXqquCDXfnQSDmulrNHKgYwnxZ1VupgvPjSmcAcFoNpxBT+2M67?=
 =?us-ascii?Q?GB8C32cYYEdtRIQzO35Y0kARjOzIhvyZuSKe5wgBtH5Q0ro94trtbRCo26TV?=
 =?us-ascii?Q?OPOPHsblxmNZ09Mp+9qmdg/X1BtVB0kC1udHGYuIm/qOj89FuwzrClj/Sld+?=
 =?us-ascii?Q?N9VBoEWSXqzD+yBUZ2kHZGZQ2eR1JHUNeNdkbn6SOLdwBbEXKxWKPu9Y5RtK?=
 =?us-ascii?Q?uOwtlcBSmh/ljeuOJ3ni/c4LcH1dNyz7hVQ4l9pL9A8Y86/ZX1ER8PGzz+wo?=
 =?us-ascii?Q?+U/FTZlwSSr/UeE5PY1z18TbeqQDKcevHN1T15nHJXbFB/PoT1r7wDvZLv/O?=
 =?us-ascii?Q?ig=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b8cf5d1-347e-4c77-3932-08dd5784aaf2
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2025 23:15:47.4990 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fieqQQCz2Pwt7r1ITM6MSkYpYWVM+RDssWR82cnxIhC98muGJvtppHkUztWFd/rPMDwpC14nvF8XxVaK3O1Acf/NoVOjm/KqFpG89wkqMkw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6978
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

On Fri, Feb 21, 2025 at 04:52:00PM +0530, Tejas Upadhyay wrote:
> Wa_13012615864 applies to  xe3lpg
> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 1 +
>  drivers/gpu/drm/xe/xe_wa.c           | 5 +++++
>  2 files changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 096859072396..a3ad2ad7a03b 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -478,6 +478,7 @@
>  #define TDL_TSL_CHICKEN				XE_REG_MCR(0xe4c4, XE_REG_OPTION_MASKED)
>  #define   STK_ID_RESTRICT			REG_BIT(12)
>  #define   SLM_WMTP_RESTORE			REG_BIT(11)
> +#define   RES_CHK_SPR_DIS			REG_BIT(6)
>  
>  #define ROW_CHICKEN				XE_REG_MCR(0xe4f0, XE_REG_OPTION_MASKED)
>  #define   UGM_BACKUP_MODE			REG_BIT(13)
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 744dba4fdb58..7b3eed278483 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -618,6 +618,11 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>  		       FUNC(xe_rtp_match_first_render_or_compute)),
>  	  XE_RTP_ACTIONS(SET(TDL_CHICKEN, QID_WAIT_FOR_THREAD_NOT_RUN_DISABLE))
>  	},
> +	{ XE_RTP_NAME("13012615864"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3001),
> +		       FUNC(xe_rtp_match_first_render_or_compute)),
> +	  XE_RTP_ACTIONS(SET(TDL_TSL_CHICKEN, RES_CHK_SPR_DIS))
> +	},
>  
>  	{}
>  };
> -- 
> 2.34.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
