Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11727C5AD49
	for <intel-xe@archiver.kernel.org>; Thu, 29 May 2025 13:25:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1F5D10E048;
	Thu, 29 May 2025 13:25:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DEG5HLQ4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0784D10E048
 for <intel-xe@lists.freedesktop.org>; Thu, 29 May 2025 13:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748525121; x=1780061121;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=cLkEHWNZ5n+i+CO/eaBSrEfNgc5JzvmMFyveuYe7/gs=;
 b=DEG5HLQ48p0eCie0d8SDh1v/A79Blc+drXVYrqd9PXbkGcQzMRMSQTQe
 ncgOLkje8EgPmIhfRih5G27LGLqbXB7L+0d0bmMKykFEJSqK7bNshuLNi
 Hzgzo1kZvpgAUKkjBjQcDjJslCd4YK1ZsNqFpceuapW7M4cSe0aUwP4g8
 v57SabiPWfsTXXX8CqKmyBYuQzZ2n4ewh8Kxl9Yuj5gGF5WZUEhGIlSMe
 7nJHGHtQOV+lMGkZPIvVXHz3Sb+p8ZeZC8cUzHHBnlagBu408F6OditS6
 PqaabBTNyyTGjrMy53ljIfOFuSVTlbHApw90sGJIHglVYGRkMmEPqtYCH g==;
X-CSE-ConnectionGUID: epziTx3QQuiH0czq/NsvJQ==
X-CSE-MsgGUID: fMLSX5LkR3C7vAOmfREmfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="38209566"
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; d="scan'208";a="38209566"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 06:25:11 -0700
X-CSE-ConnectionGUID: LBZp6AyfStGlLFpD3k436g==
X-CSE-MsgGUID: 03n+jcUORTuM25eywDdE9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; d="scan'208";a="148602890"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 06:25:11 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 29 May 2025 06:25:09 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 29 May 2025 06:25:09 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.67)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 29 May 2025 06:25:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UmdrrB2wV9oddF1+mws72uH3hM62GxSVikNwkNGQiKvjeMpVHWGExEIX1rXT7XYrazpT5hqREaq4uNUnPAWIeA8iGVXNiys8QwNihK8aO+fL9n0Y2PxDAeB/6nj6lrHv4NiTDQGPDX6LxzjJXpQZmRatlh7vmG70vxpdv6rTu9hLzUG55CqoyhoOg9SGXIEPHN6RKiRI8rjJlaQyi+l4JdTAtiRo4TQSH9knw22coO2DSphqvTM5KjQ9FXcPB+DerODXVP3k7T3YnfeUDIfgYiZKpqZKjZ6nbB3g/ffmwepccY2VCULajEQTmJ0Aq6LSm37mU6sP+F97YP4sQDPLwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jyDUnEnb+vyWNmID+XEu6tDx5dy2qiH2QCZwf4vFMos=;
 b=SFhLS1dqOJrd5JsJkJPplYUQyti7aY5Av4VzCBMeBgOCvDyW3qqj3Iuu483emgDQN1TUULQPdtLx95ZanLRgGGNgFqs+jOUw/veT+qedrjpQulZ0iIPX51F+qPZGBhccDX/gY7a2qv5Q0LrHvtN1qx2GAw0a1WdJbTLb7MMjvGtDw3RP+fTjYy/lic4fcqsRm1yRSG2emyWyWnny9zTWRdb+OLFw6iPaxS4GAEEaUEji1MOAIpRweaGXxuBUS/f1J6lNke+bHSeqiu3l5A2z5yLJX7l/g6bFAs/Swto+EeaOaxb05wJheBGMbkPzLjn8Vx0MtV7oGwnwZISfLL0hQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by PH8PR11MB6901.namprd11.prod.outlook.com (2603:10b6:510:22a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Thu, 29 May
 2025 13:25:08 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%7]) with mapi id 15.20.8769.022; Thu, 29 May 2025
 13:25:07 +0000
Date: Thu, 29 May 2025 09:25:03 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Karthik Poosa <karthik.poosa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>
Subject: Re: [PATCH v11 6/6] drm/xe/hwmon: Expose power sysfs entries based
 on firmware support
Message-ID: <aDhgL7NEDUj56oq3@intel.com>
References: <20250529103430.2348053-1-karthik.poosa@intel.com>
 <20250529103430.2348053-7-karthik.poosa@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250529103430.2348053-7-karthik.poosa@intel.com>
X-ClientProxiedBy: BYAPR21CA0006.namprd21.prod.outlook.com
 (2603:10b6:a03:114::16) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|PH8PR11MB6901:EE_
X-MS-Office365-Filtering-Correlation-Id: af3cee09-38d5-4b07-9681-08dd9eb43ab1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zBWX1OQ6X25VqGs51MuM5OcHTsXvwzjm7CKeLnPQz1wW+54Y7M0s/F81yVZG?=
 =?us-ascii?Q?QExMGcxG7f/N2BTQSrYO+1Mx6re5Yf9xlUi2D/9B2ZsVy12BEPDYY7v7FYxn?=
 =?us-ascii?Q?W84qjwCEuxVQjUTe8WrMrJJ4xxEQo51XHQXdUC0Q8lmXFGKIhpiK6c/NTkHy?=
 =?us-ascii?Q?kEc+N5zQsLnA+szAHf7zvf6onNRUuo8VMQ9j15HZcQEjGDRY0/7GzwxP8teK?=
 =?us-ascii?Q?LJAQUZ1dtgkULfQyM5t7cGAqZvJ3kuJdRVAfKsw26Nsp2nSzssC/ebYH+aKI?=
 =?us-ascii?Q?qDZb3RChQ5lt8DgT79vrHoken/UVFd9JbUmgvWG1fXgsgBlykK/RiXiyAFtL?=
 =?us-ascii?Q?lqEtG+0iC2STVdZNkoe+uPCC9+F4qcH4a4POnglqqw7CuDWnqCPMLx5ziwLN?=
 =?us-ascii?Q?UuA6BWVpePWuFOZVSZax+UvuPgf/Eq4icE4RPk8RGkLOhpUWG0Kkh/4Js4Ja?=
 =?us-ascii?Q?N7AeozaAeSMLsXv8JZ/RxJXCG0R7Zjh0nmJidMyRR0+gIsSMiKFB6Jb0boqy?=
 =?us-ascii?Q?XjB+p0hr/Gg0/5+Wqfc4c6WV5nMtpZPDV+Rwp3aDUQz1H2FIKSFkwn/5tiyr?=
 =?us-ascii?Q?ddwUZDVRe+HNt0Vk2IVHIpe3T6AeHnYhHI1/e2hJxeAo9dbCYwJ9fYjbRcbQ?=
 =?us-ascii?Q?ENS3O+2pR1+7yIFweiKryqZKKnz3PPsM5vDjqU9dFGyTZp5beVTkHFBJcwzs?=
 =?us-ascii?Q?CCGTT2AsnUI7lMIog8+kKSKdeTLr7RJNMDa+AaSCnzLr+vF0YKrCi9hfX4Ov?=
 =?us-ascii?Q?OS+09J3JcpK6yGd5eflKkWVeARITMLOBBt0aGGcn5I613ZOfb2NdJL+LTsQZ?=
 =?us-ascii?Q?kdtSlNd6sl9d/c8mdXsBRnbUX+O8ECYD30AAbUTfeGTz8BdsKrVQj4sndE50?=
 =?us-ascii?Q?nMea25ITuU70nQ9uB+lO5dw1jGCRZmyZvMg/S4p1iZYUdznna3D5tBkWnlPc?=
 =?us-ascii?Q?xFQdsWJAhOm+QTz8oMioX1IAiyKCNKTeimttlnwzcjLtVu4QbVo3G6x27aMX?=
 =?us-ascii?Q?HFWt8Q1qDIgxtf8k7a5TEA+SWaatvBi2ouWkV2RyXoMcfGzHi/Hdd0SK+11M?=
 =?us-ascii?Q?IIRPTb4RgHbuYYGmHi+t5kfqz6vS72/FUDiHQx+Z5G76gxNi/pPIKSuaIqui?=
 =?us-ascii?Q?a1WIuk/hO/+9MiozboO9HR5/IDFZhN7zQpR2QZHXYIGX2bFQ8opLIxKaDinC?=
 =?us-ascii?Q?2pukR0GfPPmiL16tmUgisnsHStWD6LOJwX8txs0k/tgnzbjalZTVV0OGizOY?=
 =?us-ascii?Q?WpaAT+mfjTRy2mzPGcYkMwmPUSw1WI/2DYaI9sxFU8Zl83/SIEAwR1nTLNQ4?=
 =?us-ascii?Q?TbkUAAiaaZfAeC+nSOXbnOs38ZT1S3k54Ax+pEltNgBZfvoJsjN3uFdVVvfy?=
 =?us-ascii?Q?JT9BBUqoapxj4m9pyFoE9ervKgeYOvZX8ljwyEPVdAiCy1QpoP3j6FxnGHa0?=
 =?us-ascii?Q?/Xah13rFhh4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GmBHdNHKbPLX9JHDy/ibEX3BiCkxJwUH9VKSPN2bGifnfkvaSHDLmkxDR8tg?=
 =?us-ascii?Q?BiAOeAQMj1wkTVrqzApuYxXT+PxUJH9PWgGYGx2wD2V5ht/X8ZWTM1mUGYC9?=
 =?us-ascii?Q?Y/kGYUT9IlDU02cCoUfm7NM85vq/1SGJD0gHF1GNv3xvv+qbSe7QrSRjd7Qt?=
 =?us-ascii?Q?k/+RlC4tZ3uqU5J+m9X+Jg7zUDCPMrHlHeHsMFE9hW01GZrycQAkSoIHCl20?=
 =?us-ascii?Q?pfJaC1w/SYzM4T5KQS3GmTNiY7AeDrNp0npebpU6W4HqAYnaXKYZUUSPD0JJ?=
 =?us-ascii?Q?/UdDw9Q3WRfpu9q4QwaQT0xtf0Zoitw5Jy8HEg0pjCo06nrR4do7HNoBh6R4?=
 =?us-ascii?Q?ZLSkuhxMx6TePyKmTJjk9o4fCKNjwU6U9/i5A2X0YxNzbeyeAT93rdjFTxtT?=
 =?us-ascii?Q?I2F2RjKoeCRVYpF3G97n5Mey13p8IZhN521VAYMSzIWM/fHvw33wV/EeOxvG?=
 =?us-ascii?Q?32zPLV/pt8thKc/8CxL8AHOXKIUvwp9YzznK3RRgO9TOO0SOzI7IGMrs/9FW?=
 =?us-ascii?Q?qcnfS6xrKLZhZHxvjLueDJoD2uH4PochQ6gvkHEK84nZTQnyRc1TdN6mRHRp?=
 =?us-ascii?Q?tOyTdZzrPDpYBZ1stulEhvLvVnewjzyh8K8Y5UZmxA1U/D2LrrLMxWDLJr44?=
 =?us-ascii?Q?wbsC9EIPpytHu8qKr+GS67BXmClDwoWw4r2MI7Nu7ElN5qDpH4boKVqktZCX?=
 =?us-ascii?Q?FX5c8OSI/UFynMdHro2v06LoPljjDb7cS2ZiK8wD+n7Y+dHKVVv5+/o1kxvW?=
 =?us-ascii?Q?XijW/piA2FDKzV7yN/HMVRBnOAWmcUb2v7o0sw/HKcm3I3WLYMD9le55Ct/7?=
 =?us-ascii?Q?4q7y+PLL0NlPwSgFdc/H2dSP8e9RRGnXI0ykck1ay4qXYCfH8tU4KIAlbVs/?=
 =?us-ascii?Q?cQrI7GsO2MCSJks1jLVG4ZiL45Q8EYGKzdPCz28UzqUt7dVm2t0VcNd+Oo/a?=
 =?us-ascii?Q?V5kWP/qWlTlI5Ks4CK7K2XQ4TWIUObCxbUVPyJkqmqHD8WTG72Su5cU/p0rq?=
 =?us-ascii?Q?nkvg0YD/NmlMHaWsr4ejHUTlDimpk5maiWOV4DccFVTPOBnAFG8o4ILdOUB+?=
 =?us-ascii?Q?NPLQyZq5S4DjN/MgPbgz2S/RGdhgWQBS5SFOUlmmnbElBMJ969EoRPB5TPZN?=
 =?us-ascii?Q?EqyMd32gUV0iFhx3pwVWru3JIm5kQCwDRJf24waX53MpLhgoxBEGNUxsLiVo?=
 =?us-ascii?Q?YCZKtiErg9nwHb3MtbMdmnoXkbsZMkhMUgUtJjKYQBEW7rqXhxJ4GTGn6BTn?=
 =?us-ascii?Q?Cy0SjLFigIdmnmFgyRGVAWlKoBtyqI1ZULgrxgbKJ3upj210hFoMmKq8Mtnz?=
 =?us-ascii?Q?KAXn1SyiR7PDz4Uv8TeWFAd2z0Na/bQOjCOggfLcZalYyXYlOUrbhOZ3vEOb?=
 =?us-ascii?Q?f09fnI3jhKZgrlptjajpB4K2FeLdNUulE1ylkoOSj60aTtchoXrots+A4kwN?=
 =?us-ascii?Q?zxWLyVcfmUT5oEiCC9KTWq/bQeRXuEsXrivbtOwx+yXKqXhg5qMHf3bpr1eG?=
 =?us-ascii?Q?GIlKN2b5INQofEFbcgJeZTZai7j6v+YiCtdblck/zCy2oTAcr+ia0VNi24/1?=
 =?us-ascii?Q?eVaG/EHcRdLg0O7LABhC+WL6nga0IJKTKr1+RDD1?=
X-MS-Exchange-CrossTenant-Network-Message-Id: af3cee09-38d5-4b07-9681-08dd9eb43ab1
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2025 13:25:07.4992 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nZ3sdHepbf+2nlFgTXK6Z6T9U00TGJt5aK84XtUNnBcPWsZeLxbg2Kn+OCUwgrD68fzjKGUVesyQVKbnleTf6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6901
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

On Thu, May 29, 2025 at 04:04:30PM +0530, Karthik Poosa wrote:
> Enable hwmon sysfs entries (power_xxx) only when GPU firmware
> supports it.
> Previously, these entries were created if the MMIO register
> was present. Now, we enable based on the data in the register.
> 
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_hwmon.c | 65 +++++++++++++++++++++--------------
>  1 file changed, 40 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index c57c613471c3..25a89575a629 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -296,18 +296,12 @@ static void xe_hwmon_power_max_read(struct xe_hwmon *hwmon, u32 attr, int channe
>  	if (hwmon->xe->info.has_mbx_power_limits) {
>  		xe_hwmon_pcode_read_power_limit(hwmon, attr, channel, (u32 *)&reg_val);
>  	} else {
> -		rapl_limit = xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, channel);
> -		pkg_power_sku = xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU, channel);
> -
>  		/*
> -		 * Valid check of REG_PKG_RAPL_LIMIT is already done in xe_hwmon_power_is_visible.
> +		 * Valid check of these registers is already done in xe_hwmon_power_is_visible.
>  		 * So not checking it again here.
>  		 */
> -		if (!xe_reg_is_valid(pkg_power_sku)) {
> -			drm_warn(&xe->drm, "pkg_power_sku invalid\n");
> -			*value = 0;
> -			goto unlock;
> -		}
> +		rapl_limit = xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, channel);
> +		pkg_power_sku = xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU, channel);
>  		reg_val = xe_mmio_read32(mmio, rapl_limit);
>  	}
>  
> @@ -652,17 +646,20 @@ static umode_t xe_hwmon_attributes_visible(struct kobject *kobj,
>  	int ret = 0;
>  	int channel = (index % 2) ? CHANNEL_PKG : CHANNEL_CARD;
>  	u32 power_attr = (index > 1) ? PL2_HWMON_ATTR : PL1_HWMON_ATTR;
> -	u32 uval;
> +	u32 uval = 0;
> +	struct xe_reg rapl_limit;
> +	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
>  
>  	xe_pm_runtime_get(hwmon->xe);
>  
>  	if (hwmon->xe->info.has_mbx_power_limits) {
>  		xe_hwmon_pcode_read_power_limit(hwmon, power_attr, channel, &uval);
> -		ret = (uval & PWR_LIM_EN) ? attr->mode : 0;
>  	} else if (power_attr != PL2_HWMON_ATTR) {
> -		ret = xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT,
> -						       channel)) ? attr->mode : 0;
> +		rapl_limit = xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, channel);
> +		if (xe_reg_is_valid(rapl_limit))
> +			uval = xe_mmio_read32(mmio, rapl_limit);
>  	}
> +	ret = (uval & PWR_LIM_EN) ? attr->mode : 0;
>  
>  	xe_pm_runtime_put(hwmon->xe);
>  
> @@ -806,24 +803,20 @@ static umode_t
>  xe_hwmon_power_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>  {
>  	u32 uval = 0;
> -	struct xe_reg rapl_limit;
> +	struct xe_reg reg;
>  	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
>  
>  	switch (attr) {
>  	case hwmon_power_max:
>  	case hwmon_power_cap:
> -	case hwmon_power_label:
>  		if (hwmon->xe->info.has_mbx_power_limits) {
>  			xe_hwmon_pcode_read_power_limit(hwmon, attr, channel, &uval);
>  		} else if (attr != PL2_HWMON_ATTR) {
> -			rapl_limit = xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, channel);
> -			if (xe_reg_is_valid(rapl_limit))
> -				uval = xe_mmio_read32(mmio, rapl_limit);
> +			reg = xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, channel);
> +			if (xe_reg_is_valid(reg))
> +				uval = xe_mmio_read32(mmio, reg);
>  		}
>  		if (uval & PWR_LIM_EN) {
> -			if (attr == hwmon_power_label)
> -				return 0444;
> -
>  			drm_info(&hwmon->xe->drm, "%s is supported on channel %d\n",
>  				 PWR_ATTR_TO_STR(attr), channel);
>  			return 0664;
> @@ -832,17 +825,39 @@ xe_hwmon_power_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>  			PWR_ATTR_TO_STR(attr), channel);
>  		return 0;
>  	case hwmon_power_rated_max:
> -		if (hwmon->xe->info.has_mbx_power_limits)
> +		if (hwmon->xe->info.has_mbx_power_limits) {
>  			return 0;
> -		else
> -			return xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU,
> -					       channel)) ? 0444 : 0;
> +		} else {
> +			reg = xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU, channel);
> +			if (xe_reg_is_valid(reg))
> +				uval = xe_mmio_read32(mmio, reg);
> +			return uval ? 0444 : 0;

with these checks here, now your drm_info will never be visible... and the ifs there
becomes bogus...
Move the entire logic here and make like there, checking enabling bit and not
all the 32 bits...

> +		}
>  	case hwmon_power_crit:
>  		if (channel == CHANNEL_CARD) {
>  			xe_hwmon_pcode_read_i1(hwmon, &uval);
>  			return (uval & POWER_SETUP_I1_WATTS) ? 0644 : 0;
>  		}
>  		break;
> +	case hwmon_power_label:
> +		if (hwmon->xe->info.has_mbx_power_limits) {
> +			xe_hwmon_pcode_read_power_limit(hwmon, attr, channel, &uval);
> +		} else {
> +			reg = xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU, channel);
> +			if (xe_reg_is_valid(reg))
> +				uval = xe_mmio_read32(mmio, reg);
> +
> +			if (!uval) {
> +				reg = xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, channel);
> +				if (xe_reg_is_valid(reg))
> +					uval = xe_mmio_read32(mmio, reg);
> +			}
> +		}
> +		if ((!(uval & PWR_LIM_EN)) && channel == CHANNEL_CARD) {
> +			xe_hwmon_pcode_read_i1(hwmon, &uval);
> +			return (uval & POWER_SETUP_I1_WATTS) ? 0444 : 0;
> +		}
> +		return (uval) ? 0444 : 0;
>  	default:
>  		return 0;
>  	}
> -- 
> 2.25.1
> 
