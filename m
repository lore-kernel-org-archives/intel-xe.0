Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5807ECAC5BB
	for <intel-xe@archiver.kernel.org>; Wed,  8 Oct 2025 23:27:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 093B010E104;
	Wed,  8 Oct 2025 23:27:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IAR5by4m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A994010E104
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Oct 2025 23:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759966059; x=1791502059;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=p33qZHnLktnJrdSkrqSglZTRcGKvQ1KLCCjf571vV08=;
 b=IAR5by4modUXoQtEhMkkG6nWh54viAr+gizI4nx3ySWg1j9eXo3v7TcA
 TBfn41ztHcXMwDWO+oZHadRKx2GiaO8NI/85xcCdat0AkZzA1/ADlfbGB
 XusuWDu+cZsCjc/SVzFon/C1kli5MZHDLviv1NEoCFYvqHfWJ09wxNq0k
 DkP6SNQsssHuLEarxGExiLMgKIjhoDuaKLwXtohyqerQEPWAEj2X94Hl9
 BGmXA+nwuAGNfJInp40zR2TvKy3XZnjSz1amk+Z/rw47XcLBjFrcPcucr
 EioOJ2NOpWRqp+ciTtvgGmkgdCiB2ZAc3bit1ZH6RtN7CotUhp9D+q1jT g==;
X-CSE-ConnectionGUID: fJ2sLxmPQ8GG28zp1/0Fqw==
X-CSE-MsgGUID: Eu2AIrNxRRedLalh59BZlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62113527"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="62113527"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 16:27:38 -0700
X-CSE-ConnectionGUID: pKNuLWYhR9Cnic8VNxQLSw==
X-CSE-MsgGUID: lO8bXc6PQaO7uBx2f8U7rA==
X-ExtLoop1: 1
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 16:27:38 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 8 Oct 2025 16:27:34 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 8 Oct 2025 16:27:34 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.2) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 8 Oct 2025 16:27:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S2uPbn0dkGw/3hEMg59CHgN36XQalG74j7D2YozpnzWMW8R4tqEe5lmi2Aa20JVu2vWIXe5AbuGlAi6Si0xEfiXrCFr+8fvrT3KQDA6FgIQVFC7eNdTq8tI+0weHI2rXiE2/s+HmNHLPNvA1dffarAX9w4V1mwTIDbTUECw2dQcJhovJUv50Ssuec4S/xNMZcvGGROq0ElMFXk8lDz7drShGC2RDSwPJjdK/oE94zKjptCIhmmNmeXd7All/jNT69wiIV82NPS1TZkGjSnaAgXQaUUB4dhubQpdp1735b5LGAHeliglsoYYkfDLGHgKA+qAhZhPnxlx7lsHrZGFfpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UZQL9p30Gm1n03Q/lcFCCOEXilZB0gz0V/+q5e8fI8s=;
 b=Z98J+P+PMoex5t6/GnpLRbnCem55gIsI/eCBOyjc7QFM5bXWEzL/xi8oYCRcXp5kd/3idT2G4pwvxLnvTWR0XVsU++ISU9+oxoiqODQwPZ9w9RgpxoGpaTGwHxvaLYVRVi8shiYEVq7nf4lglfW9NPlymxeYr429fP6eYwv+ve2Mla5uh6w2FnQqNfzywfHJUlRBqw8T4lvBNYhNbka48Wj2INC3KZ4kStcysGn/bZ/L4dDIfpVR2bUWK5eVxBWX9gayIztFRVuoC7A7rSi+R+2N/gvhLbo2SLwdDLY3YDqOwSObbTEHJQDopaWq+6jrj1lZCHlP0wuLzG++hYRScA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS4PPF7CCC4B437.namprd11.prod.outlook.com (2603:10b6:f:fc02::34)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.16; Wed, 8 Oct
 2025 23:27:20 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9182.017; Wed, 8 Oct 2025
 23:27:20 +0000
Date: Wed, 8 Oct 2025 16:27:17 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH v5 2/3] drm/xe/migrate: Make emit_pte() header write atomic
Message-ID: <aObzVYIXjS+bNjXl@lstrano-desk.jf.intel.com>
References: <20251008101145.11506-5-satyanarayana.k.v.p@intel.com>
 <20251008101145.11506-7-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251008101145.11506-7-satyanarayana.k.v.p@intel.com>
X-ClientProxiedBy: MW3PR05CA0023.namprd05.prod.outlook.com
 (2603:10b6:303:2b::28) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS4PPF7CCC4B437:EE_
X-MS-Office365-Filtering-Correlation-Id: 767d5fe3-4765-472d-d216-08de06c239e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7HeE0Y5ia4b4FKLskrmMbAHnQpQRiHZtS5x5eFy5q2Y9molHkmk1lJlw1O1g?=
 =?us-ascii?Q?KZ8MSuLAaPm1UMCnjR+0hRVZG9547p/mHUtISISOmjmoWOaOGKSw5raFj6Yn?=
 =?us-ascii?Q?jtN4GopZw77trWZqaIdGDoBXm2ZIIl8pEE7GKVF2+4TOzcX4f0DBeKuBqdEJ?=
 =?us-ascii?Q?aS3auzB+KYVa7v2nbYT6iO4OjHm3fL0YykWT026o/131w6JZpOn8MZ8jdBjM?=
 =?us-ascii?Q?yejv9lRBKBx/IwhwmXxxECFAecODnbyWhWf8/hKMFOR6mChfRfIswQ0VZsOx?=
 =?us-ascii?Q?e/CAd6fN8N8IxyPbQUvV2oeo5hsPqi+o0UIFVeArXblgLEqDm7Ze1I3m+mno?=
 =?us-ascii?Q?R0kJeqOfVxs+EHWwOtem6w4bhjbOkS6BvgH8j0XjGbXU5kOnJsEs8SYWcLD7?=
 =?us-ascii?Q?4qowV/fSVQzZy903M6L7rTTOq5SPH7y+9MRkm6t1v7Bpu79KEw6GbZaRpbyl?=
 =?us-ascii?Q?S9da66bzgjwWHok8qMEjvUfPAOfv0kK/CKxSR6o98aW8JJ2xB/aaQyJ2zhZi?=
 =?us-ascii?Q?YjoDFxPi8RI1kX6WuiwNVTd1MJ/bGB6gzOm88abW5icLB7XRmCbs6bBf8IOD?=
 =?us-ascii?Q?Z0eXhmoa9l9FlEL84pduj58uFWA2FJ31NFtrf4r5Y/u9AkouOXFi8+P8RmCZ?=
 =?us-ascii?Q?4LeWqQosn9W51+GcrZrkZNAsJxFYOeHOnuUWEh4zsJGXy70Mt+JcwFr1MSUK?=
 =?us-ascii?Q?5CVmD6IIy5XEyqUvwuCmnt0MCeDqSkfZIdFRzXG2AKzrcbVVUptgkX18oRYd?=
 =?us-ascii?Q?i4zrX60piGUj5xCMjSG1VsN4shqXfooPfTk4+K04mZz5Ye1rFI7oPwBlkgo8?=
 =?us-ascii?Q?fV9e5E1mt5ws0keW7i5qW666kboFSW3OKHBPi2nzWwFf896avX3BsGz50NUG?=
 =?us-ascii?Q?gwUIaMNbUYUUd0dP5CT7aelOX+9LHMKnKQOLtTC1CDNxN9MS6OH1neEJryP2?=
 =?us-ascii?Q?9NVRv+S3j+fH7nDeBXU9rcyU8pYCMEDDBd/3+wdwGqBdZrHxfk38y2RufQ8Y?=
 =?us-ascii?Q?4CsGe4Qhw5vV1gzyizqNZ6Kzb/OT+U/2Jjh6E8APTiLz87gThUcUIIUqg0df?=
 =?us-ascii?Q?4mBPgJ1bRj1w4FmPaJyio2ICB3DlXJNZzdIBprEetNX0w/OtZAzWGDA5g+5q?=
 =?us-ascii?Q?/TSAos/pXvKfWTG7Z02RONMq9krC0+SCh/zluhdnTBsFNCo4k/uLnK4IgrtM?=
 =?us-ascii?Q?jLGSrGwwXj5Bq/QVyd8vBFJA5G4KFZVlnmzVGOigRWyvUnzcDqtr+09fWI0A?=
 =?us-ascii?Q?4f1qIQlmvBXIdsLFL3sN/Q9gu6diq7Yj1MaLZm1qcjrIFVv7Ih9OE/UF8pCU?=
 =?us-ascii?Q?l3Xo59qQie1FUZDbBTh1JXykPbwC9zs6yHm3Ujd0Nf3vJF8Z/Im1aePz+Yha?=
 =?us-ascii?Q?Vz7kJbD8qRpJs/G4M2S1W/M28LptUWtHYJP9JbDmgNLH8WLunrgFQkdLHKzX?=
 =?us-ascii?Q?U0FdyCN9GPArIpX55spuiKIcym5Z0E4g?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+aEhsgBNR36lzd8mmTkbsvfCzcZhOBkVLFiMe+JqC9W0iuLZzEjTtcnZuFN1?=
 =?us-ascii?Q?wx7j4WQbm1fmG55oaFR5/9MMMYz4zu+GdC8x9PidiGfYXMqc6jw47TJzN4UO?=
 =?us-ascii?Q?9K0zQQAlK7FsIxKWO+o8YohgvCgDZK5Gcny/4ZKk3HVF5M9i2ESIlRJ66yf+?=
 =?us-ascii?Q?usL6cNlKAu3YO5ueqX7coq2mWWRxzsWf/Z7l8lNXF0Oh3ddn0n253x6RjS8n?=
 =?us-ascii?Q?PpEVMFo2enOEyDPyNDCHJEkMvcDwpVAIh05SN9xM5JnIkIDETvAMcDYYY9KY?=
 =?us-ascii?Q?R0pB+rAsTA8XXCmQklUMFdZdPJYW7IO6sdVOigNWaJcrzxmlY/xcKsYZjrNL?=
 =?us-ascii?Q?G0yMFhwdZdt8z1TxszVwLbav/ePvx3QBg08XEaoNd8tq96fYM94YxZk1vfBD?=
 =?us-ascii?Q?D/uWumyghhzMuEI/LezdblKo+nwQBog0G1yIkHyxFlet+5FNIITAMqwKIsAC?=
 =?us-ascii?Q?mzDy+RbH1XRVNteWbtknj+c7lvKYaFFoz4qepgX+yAztDTokaWQi6KoNIRYf?=
 =?us-ascii?Q?kkKVYH9TaqceBz+LmssBrOJAf6/+aXpnWL33EFkuKCGuSjFK/HVdB9CpyunY?=
 =?us-ascii?Q?DHWwgo4nJWktmI7gl4ABZ2nVCCmviDuW+QGq85nmw5XW+MO2M/RMVl6Q3mmX?=
 =?us-ascii?Q?7OYG8WjP69MNd10v2w5/VFMDlQhoRbIv9e4fRUWj72STfURuXZZFGje0NFdp?=
 =?us-ascii?Q?ghqIFeI81uv4PER8nVT5jyi4PsFwNEdQ7gZ6j0YIlWeT/0ojKSFaZPoIKEWX?=
 =?us-ascii?Q?1xC3saQIEjrGnFFAQ9cvbQzF6nY5xQHFB7GSH3HqQtrHRbaSv90Gdj1pJBtX?=
 =?us-ascii?Q?4jfRmIUoESUBEy1wrzyR2mmvZeg1i0luv6/iUSxEAxsf4t9pQ13cJ+3ZuE8d?=
 =?us-ascii?Q?u2f2ViwxDHJJWwBDXafb3yJ1CCnhUz64JnXmjLHB8N8hFoKZ+0yXW6gEly+0?=
 =?us-ascii?Q?j7urFs9OibGA3Oa95GdfK0QX9O6NyePG3FnYi5DXCStnz/ijBVv9s2gktdhV?=
 =?us-ascii?Q?kqzR5kcDDCfk8sNpLLVDFlcRCKMPp0zfUyYKVK9FC/yWbwQ5aU9Qwf/T7csx?=
 =?us-ascii?Q?EF434JTCP69og0Rez15zm2aon3ZfmLgGsDBhZhVe8kGGmgUcAtZsl2u/rMF1?=
 =?us-ascii?Q?EexjTC4A/t/6WG60zWoI7M17F+Gi8QpjOxoum6Pz/X+TSyo9YRnc/kWFvYAr?=
 =?us-ascii?Q?wY43U+a5tTcDO+x7wuACxo5tVMwU96ktOIQhjHG6mjwYP/CqGa7Pfn4elYVl?=
 =?us-ascii?Q?RjvCcAmY9OO6LV0FOE7Ks4l4zUU7xOCEIQHUiJapv50y3L9cEXPT5uWL8285?=
 =?us-ascii?Q?Nmg03LThpPqmWnPV3feGAS90mXILM5nfNuptl6Qiz3j/6z6odtJ5HbXMjq/+?=
 =?us-ascii?Q?vlKwmsCZ4FzRVrbuJ6zTxn6kLHvLSdjWRTJtWGnQvHfejr9boYu2ziv3iTCX?=
 =?us-ascii?Q?uS6I9ZkAEAvzGXS0uIZZOqC9tKzfzF7bMCZZLo3YF++nD7o/WACwa9x+KN7p?=
 =?us-ascii?Q?8x3On5Zsf6D7eVbCWKitSPyggLBPEPZKRs3/a8KjgHKFElg/iYg/lKW9EQTs?=
 =?us-ascii?Q?EYqzqP1OqmVA1oS8SLsdAd+Sz8s95RArpYpejuezjuIi468AAywfOK5h5gZr?=
 =?us-ascii?Q?zA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 767d5fe3-4765-472d-d216-08de06c239e4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2025 23:27:19.9137 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9TDltVWuk7oc7phoLxWTUiAwtjIZS00p0xJKBA/Rm9Os0Fl1yZfzZa3pG2L7wfQ56Tk3U/MkkQOaN+waskTjwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF7CCC4B437
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

On Wed, Oct 08, 2025 at 03:41:48PM +0530, Satyanarayana K V P wrote:
> The MI_STORE_DATA_IMM instruction header is quad dword in size. If the
> vCPU halts during save/restore while this sequence is being programmed,
> partial writes may trigger page faults when saving IGPU CCS metadata.
> Update instruction header atomically.
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> 
> ---
> V4 -> V5:
> - Fixed review comments (Matt B).
> 
> V3 -> V4:
> - New commit added.
> 
> V2 -> V3:
> - None
> 
> V1 -> V2:
> - None
> ---
>  drivers/gpu/drm/xe/xe_migrate.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index b629072956ee..7097da1555ca 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -607,9 +607,14 @@ static void emit_pte(struct xe_migrate *m,
>  
>  	while (ptes) {
>  		u32 chunk = min(MAX_PTE_PER_SDI, ptes);
> +		u32 dw[SZ_2], i = 0;
> +
> +		dw[i++] = MI_STORE_DATA_IMM | MI_SDI_NUM_QW(chunk);
> +		dw[i++] = ofs;
> +
> +		WRITE_ONCE(*(u64 *)&bb->cs[bb->len], *(u64 *)dw);
> +		bb->len += i;
>  
> -		bb->cs[bb->len++] = MI_STORE_DATA_IMM | MI_SDI_NUM_QW(chunk);
> -		bb->cs[bb->len++] = ofs;
>  		bb->cs[bb->len++] = 0;

I think you actually need an emit_atomic here. I just read the bsepc and
the last dw enforces some msb restrictions so the 3 dw must be written
atomically. I believe it is safe to write out 4 dw in the atomic
instruction but only increment bb->len by 3.

Matt 

>  
>  		cur_ofs = ofs;
> -- 
> 2.51.0
> 
