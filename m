Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0813C25B75
	for <intel-xe@archiver.kernel.org>; Fri, 31 May 2024 17:04:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85B5B10E16D;
	Fri, 31 May 2024 17:04:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j6ATkigX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2DE210E16D
 for <intel-xe@lists.freedesktop.org>; Fri, 31 May 2024 17:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717175076; x=1748711076;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=sGRItxebyaCfnxArrG8ISUpfmUTtCTiTbYkV4zAjYKs=;
 b=j6ATkigX9sg+27PxxK1x7CXDA0YlByFmIx/tQQDq4yoMls9rIBJaebHm
 NAPsw2mN0VsUb5E80dvI8XyFc/jUGXmuevyRgIZDRWGg0ZPiLp3eS+b4S
 n63iN6y+Iv7UfrpqMJ31VN9jXAMm3Alv7QZufGfRCKjlhLrtX2dvXqC2q
 8yVF4apP2kY1Ik7M7QqIBX2tkxQ1b2JsikWHXByi3537GWA9nJfDNhUhN
 HatB0US3pdUbZFt9Da7mojIx2lxQVPUIiQK9lXXRMRf/Vo2X4CwBcUWyV
 V9D05Jo8/PXCL9Px7xxldNnEUUKzmg+EEuqYeEH7M19oBiADUFuSRquOr A==;
X-CSE-ConnectionGUID: /jUjq0nQQq26u8SBJfzj7A==
X-CSE-MsgGUID: 7trL+WEOS62Eco5v9oczig==
X-IronPort-AV: E=McAfee;i="6600,9927,11089"; a="13921882"
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; d="scan'208";a="13921882"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2024 10:04:34 -0700
X-CSE-ConnectionGUID: K2jotY8nQcO6Btpq8nx9DA==
X-CSE-MsgGUID: /2HtUy46Rp6SRs2E8PbSiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; d="scan'208";a="40663849"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 May 2024 10:04:30 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 31 May 2024 10:04:26 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 31 May 2024 10:04:25 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 31 May 2024 10:04:25 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 31 May 2024 10:04:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dQFJRyebgXJz/6AzwMAgFVc9kvAczC48esVG7BITSmEMvwX9ITLsv4GlqZfHB+DCqchqPFPBdxejDn+WOZrnqk+bDiNvBO1Z+/qkFP/FxaR4fRxS7TOpoYpcs2Fh7mGtbtT77Z1ccRjFe1cNj2Uu1ndw+MzKvgImIaUGZUhZKLR967GU+3m0lJNZxUhuAiewqtKKYyRH8CUn58wVY6DSzu4aYAmLaeJa+UQ52vx5PcyqWbpi3mDP9UrzyUfNepaNWM9ma3IG4fjXcu2HqQHdIRGC+XPhcWl/XAEhF6qzKLReuSOWub95RPBIPgrKD4eqmmgxrhpRDWbOncWjiZz5ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MKsGPzIKs09uZrpFZF0pR3qBld4KTpwIJU/UaaiuzbY=;
 b=hbw9CrCnOYq7lvk+ipQga6M36TZj7ugxBlrBlSqtMncV3eLgGaAYst7i9T7CvO8uod7ClizjHXfhIN8fX54n/lQXBiHLF8CA/hhDxS1iMub3RPo/exErYxQo6LLaJUJ1ezc9wqpO5uytup6dpRdTomIGaMRV0e9n7lbDJaodynTTgz+Vf+//ijk56lm2pvBTsX7IWDKp8B59cPEubwwu9vDg+A+5MZA/hliMpbDvNJfCKv7mlEeNmeWP9NpRzx0YKLsYI8wq5mXM/w8bCZ+jfAolxvnhHWaP+yVY3n7qmQNggXiFN/5SySge0xOSiipsweTVi4qmBXsN322ynUY7yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7SPRMB0092.namprd11.prod.outlook.com (2603:10b6:510:2b1::6)
 by SJ0PR11MB6814.namprd11.prod.outlook.com (2603:10b6:a03:483::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.27; Fri, 31 May
 2024 17:04:22 +0000
Received: from PH7SPRMB0092.namprd11.prod.outlook.com
 ([fe80::2ad4:4a5:b333:6ff7]) by PH7SPRMB0092.namprd11.prod.outlook.com
 ([fe80::2ad4:4a5:b333:6ff7%2]) with mapi id 15.20.7633.018; Fri, 31 May 2024
 17:04:22 +0000
Date: Fri, 31 May 2024 17:03:53 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Yang, Fei" <fei.yang@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [RFC PATCH] drm/xe: Don't overmap identity VRAM mapping
Message-ID: <ZloC+a18NbT/jXrY@DUT025-TGLU.fm.intel.com>
References: <20240531070717.1904762-1-matthew.brost@intel.com>
 <BL3PR11MB63624632546B03D6551C4F0C9AFC2@BL3PR11MB6362.namprd11.prod.outlook.com>
 <Zln6NXwSXfLFZyMN@DUT025-TGLU.fm.intel.com>
 <BL3PR11MB63623093B3F25F03F4EB14099AFC2@BL3PR11MB6362.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <BL3PR11MB63623093B3F25F03F4EB14099AFC2@BL3PR11MB6362.namprd11.prod.outlook.com>
X-ClientProxiedBy: BYAPR01CA0048.prod.exchangelabs.com (2603:10b6:a03:94::25)
 To PH7SPRMB0092.namprd11.prod.outlook.com
 (2603:10b6:510:2b1::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7SPRMB0092:EE_|SJ0PR11MB6814:EE_
X-MS-Office365-Filtering-Correlation-Id: f46bb4af-7bca-4ab9-98e1-08dc8193b7a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vSkJq9nEKPEVXQLGR0vUzptrudHA3v3keq/vCIIeA/QeaB258en49AYDrdiU?=
 =?us-ascii?Q?DVGQTamHKRK2m6Fpj2Uztmx4DH/x6I2o0FsCLgBi+f7hpZuIv4mYHnlBs5db?=
 =?us-ascii?Q?nGaGcZaTB00n3kEWPpLclVMCS55UnHkHkz0NFyY++SsO+v2eMtz6GlGihYC9?=
 =?us-ascii?Q?I5FnMN7RXl9+60KfcRJeVfkRJao46VNEDzWJx3gJzfuUBAef90OM+WovT6Kf?=
 =?us-ascii?Q?05EYJcefAvOncDRnExb0csDmPNb41ep+HE2eLnbo4noe70McyliTlhgm1n7B?=
 =?us-ascii?Q?BOG5cfdOKxCqUbVizx5AJTfwm6dmvHbU1BFExZgCMmgv6Jg1XlKuQa+dkeqt?=
 =?us-ascii?Q?mFbUHuSyHbx2C6QRQc6TZtxlSFZxKGmneH3Vzeqj60rHU5YDxo3mk/D/tJiH?=
 =?us-ascii?Q?38DgxVX6rUu9xsn4d8t2yHZcYVSHHhCrOnYD6UbnXkJCuSzQok/681a5GsMQ?=
 =?us-ascii?Q?C3M28EyY1t4PRMCRYxSTl92eua1zIiEv44YsWYKzSDVgEangV1ZRacJMXA/N?=
 =?us-ascii?Q?QhGZ8LRQ4ctChRQsg+LTamvvX+osFcNT2rfu9MFgl8QgJTlOx6yk74mMlGQM?=
 =?us-ascii?Q?CxKSwELBwh16tu3Dd1xR/dEPT6GWJkBHt4+fKveuKyGgkVi/zPqLH62yU3LW?=
 =?us-ascii?Q?27durohZXGQMpX7vWgrmb/IcZcS3JXd3HrmZeyTsPUKc4ckT1HrMJ8gL5VBv?=
 =?us-ascii?Q?efFlMwD+Iduc8Qu4iPziT/ZOrhR8ut4dvATY/5mDe0n19mM0bUiNOv0fjWG1?=
 =?us-ascii?Q?E1G13yRa8++WoX0BdR5RCHkkTldUA4WmD5nopQOc+1YAyLuu3IKOdJTScXvy?=
 =?us-ascii?Q?K4GA8Ca06mcjWtlvR9TOTjAoj7MoZnQX5gMF4+EQU610PirIm5Gdm3+z2fnU?=
 =?us-ascii?Q?IMB1v4h9SKu8Wn9Kc3sgfTEQAeO9+1BPhjdQTQuWgwKlacrA6vL0zF2mGluG?=
 =?us-ascii?Q?083CR8C9pr1cGmvKajvkZD9m3uX7BzSibhI1W0tPrdhb1E8qc5j801rxvENL?=
 =?us-ascii?Q?CMsuqiH7LvDJUxrZIg7JJ0uZywLF8IcxSQkBdzgJGk+QuiT0QiTZXTEslu8x?=
 =?us-ascii?Q?51n2+R1w3k6OQ8VmbCCbeHi75Aoj5kd/qStquLi4U57BAyl3m7vpcHv5NNFi?=
 =?us-ascii?Q?ABba6iqI8KFgqcdDeeGsPrYVj83/AShp8sViFKSLsZ3C/xggop1Y7I7aGc5F?=
 =?us-ascii?Q?PWtNMUDf7Rpqzj8zYKhwPNeWFLM0H6LjSPqWKTMZfaYiUw6HkzgFQjHHd7sw?=
 =?us-ascii?Q?Sf43lnQatpUwWl/WjCnhMm2hnmCAKgFrBhF/wOgTew=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7SPRMB0092.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jeoR/dmYAQPU7TDUJj837HdXxl9iwvS7UFUVjm9t1ScaoL84BlgVHg5vZx0l?=
 =?us-ascii?Q?Xz28gXaOgCpuTk/Mw1aelXm48mfYvWusDkZROe4gvRCe+c5UHkPnJdlsWY4b?=
 =?us-ascii?Q?FIzKEHaXkaAexkarWVm0CckmXxjk6aFPmvr2wp7e6Ko14zWgnT7vTzo45o16?=
 =?us-ascii?Q?/0ziPKSd8/gxcKgXGTajivU4Z1YpZTbnmF2AKl9jrglfRxVuujHcurEjTQWW?=
 =?us-ascii?Q?j6ThlkDqBqmlBxOfnUOEAv6QKfqNd6Ii/9WRXFYl1KC5Tj9k9gePZ6FKZFgU?=
 =?us-ascii?Q?cWotkUNUxNCktCtgCpQxuTNzP4WwTzAJ8OqMt69HQZzDT43aAZXaW6udjr2Q?=
 =?us-ascii?Q?0RgapMiNvSPHfwlmQ5EvAec9Ctv8iustY6zAzlA5B7sw2WXQJCKH+1yernQ5?=
 =?us-ascii?Q?d3NkGrs40kVQXDe1TlnuY9IWZoa36O6YxwLreETAL8iXYE3sZTF3HqQ6JwDQ?=
 =?us-ascii?Q?lUw6lI9K+LIAwmfgc1Vinh4Cfk5739sCPJTQZaKKoX4uVPSyD5lrv1eKu/eF?=
 =?us-ascii?Q?1Zzkd/HlUBgwH2tlJQo9MAns3nK1X9Hxzv8zyU388heAy+say2XdKOecZNe5?=
 =?us-ascii?Q?Vr0qRYnk+D3wWnoIMJ8kpa/gPpA3NtPUMRs60vGGJQ+QspzcpmrqfuSIHngq?=
 =?us-ascii?Q?gtJqZOxUSR3sy8SsRRqkakw+x8pWaKfqReXK8bLtFzz20HKe4C1lb75Dl8jw?=
 =?us-ascii?Q?jKerL2K98rn83EOyHizcFbl7B6kWx8q6NGRWvEMFZdIK+exgp9wNitAAR7Lu?=
 =?us-ascii?Q?PzTET8cW3i6JIe6G9wk2WJtxRS5DeGMz8eq9OnJ3FJe4r+daVOEDIxdZ7Sxn?=
 =?us-ascii?Q?HX0RZ6Xo3xGRcMThamUktZhtNy85sQGtDvPaAQS7O5xYoQihoiWBCRbK9f78?=
 =?us-ascii?Q?MhuvPU5HPC0k1aZ/zQZXcPUjpS19gqiYNy4WdLNlI6JIWuA64HdMZdHsHspe?=
 =?us-ascii?Q?mhJIFDozyzpxH/ubyU7RoUOLc9Vf0prYqW++QO7GvIwLkX3C5ZDfBE/3hyo8?=
 =?us-ascii?Q?DzDFgABMLHSLJni9OHZvtJu9TjsdWuyqGVKJ3jMwc/tfiDXcXFKkTzGX3UiL?=
 =?us-ascii?Q?0A7Uo0ZOmBOHLKvnckFPAic7u/qfw1hrKEsbRBStdJvRbagpUB8okm0UOUUV?=
 =?us-ascii?Q?1ttlWe1OdyRVfFMdNgKd974kDXYflMx5zyEu4zL1owTlLb8kjEjBtFhG3dye?=
 =?us-ascii?Q?+DCRGZZ+2PqlMfqfOwfgn3WrmZKoLirPbF6M70kD46lSE/QwUL0xXQmc6F8Y?=
 =?us-ascii?Q?ukfpjT8tzDx6fSTAOzZrZY8vHjz6jbnAprh9jZvpd7AzGazHuGVGzrBgK7oV?=
 =?us-ascii?Q?Wm0/6K+pr9lyZ14YyOLezJ1kpUzVlVdN0Bhf9RWEiqS/00UEQyNZT3o79djf?=
 =?us-ascii?Q?2Ac9RLjjITu7bnlqLh9DzLy9SiavawdAv3h+4HjwhbxHTiWS484SjhOilZKk?=
 =?us-ascii?Q?LkXvCBHrt/wJ5KWjRtb/fCEHHFEy/hb79fLJ2xKiNeJJvL1iBnBJBBIUFbKB?=
 =?us-ascii?Q?HCPN87O9ieSwQsl8LWizY6GHxrrLkt5a/eILho63g1IIFLStc0nnjCjMyOE+?=
 =?us-ascii?Q?QUTIk2/opDishjNttka03+L85G8+4URDzks8qB7NE5QaHEfaGexZPdh7uES+?=
 =?us-ascii?Q?1A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f46bb4af-7bca-4ab9-98e1-08dc8193b7a9
X-MS-Exchange-CrossTenant-AuthSource: PH7SPRMB0092.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2024 17:04:22.4002 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yC2Q/4Z4AtJYArtS+7JUMqZd5pWNM+XUqKoYgtCTf/JuiPf2xS64aIX2OuNCLFBOl97UvAj+Txys+R9+oJpFXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6814
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

On Fri, May 31, 2024 at 10:52:37AM -0600, Yang, Fei wrote:
> > On Fri, May 31, 2024 at 10:20:26AM -0600, Yang, Fei wrote:
> >>> Overmapping the identity VRAM mapping is triggering hardware bugs on certain platforms. Use 2M pages for the last unaligned (to 1G) VRAM chunk.
> >>>
> >>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> >>> Cc: Fei Yang <fei.yang@intel.com>
> >>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> >>> ---
> >>>  drivers/gpu/drm/xe/xe_migrate.c | 54
> >>> ++++++++++++++++++++++++---------
> >>>  1 file changed, 40 insertions(+), 14 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/xe/xe_migrate.c
> >>> b/drivers/gpu/drm/xe/xe_migrate.c index b882d32eebfe..2d92ec27981c
> >>> 100644
> >>> --- a/drivers/gpu/drm/xe/xe_migrate.c
> >>> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> >>> @@ -69,7 +69,7 @@ struct xe_migrate {
> >>>
> >>>  #define MAX_PREEMPTDISABLE_TRANSFER SZ_8M /* Around 1ms. */
> >>> #define MAX_CCS_LIMITED_TRANSFER SZ_4M /* XE_PAGE_SIZE *
> >>> (FIELD_MAX(XE2_CCS_SIZE_MASK) + 1) */ -#define NUM_KERNEL_PDE 17
> >>> +#define NUM_KERNEL_PDE 15
> >>>  #define NUM_PT_SLOTS 32
> >>>  #define LEVEL0_PAGE_TABLE_ENCODE_SIZE SZ_2M  #define MAX_NUM_PTE 512 @@ -136,10 +136,11 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
> >>>       struct xe_device *xe = tile_to_xe(tile);
> >>>       u16 pat_index = xe->pat.idx[XE_CACHE_WB];
> >>>       u8 id = tile->id;
> >>> -     u32 num_entries = NUM_PT_SLOTS, num_level = vm->pt_root[id]->level;
> >>> +     u32 num_entries = NUM_PT_SLOTS, num_level = vm->pt_root[id]->level,
> >>> +         num_setup = num_level + 1;
> >>>       u32 map_ofs, level, i;
> >>>       struct xe_bo *bo, *batch = tile->mem.kernel_bb_pool->bo;
> >>> -     u64 entry;
> >>> +     u64 entry, pt30_ofs;;
> >>>
> >>>       /* Can't bump NUM_PT_SLOTS too high */
> >>>       BUILD_BUG_ON(NUM_PT_SLOTS > SZ_2M/XE_PAGE_SIZE); @@ -159,10 +160,12 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
> >>>       if (IS_ERR(bo))
> >>>               return PTR_ERR(bo);
> >>>
> >>> -     entry = vm->pt_ops->pde_encode_bo(bo, bo->size - XE_PAGE_SIZE, pat_index);
> >>> +     /* PT31 reserved for 2M identity map */
> >>> +     pt30_ofs = bo->size - 2 * XE_PAGE_SIZE;
> >>> +     entry = vm->pt_ops->pde_encode_bo(bo, pt30_ofs, pat_index);
> >>>       xe_pt_write(xe, &vm->pt_root[id]->bo->vmap, 0, entry);
> >>>
> >>> -     map_ofs = (num_entries - num_level) * XE_PAGE_SIZE;
> >>> +     map_ofs = (num_entries - num_setup) * XE_PAGE_SIZE;
> >>>
> >>>       /* Map the entire BO in our level 0 pt */
> >>>       for (i = 0, level = 0; i < num_entries; level++) { @@ -233,7 +236,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
> >>>       }
> >>>
> >>>       /* Write PDE's that point to our BO. */
> >>> -     for (i = 0; i < num_entries - num_level; i++) {
> >>> +     for (i = 0; i < map_ofs / PAGE_SIZE; i++) {
> >>>               entry = vm->pt_ops->pde_encode_bo(bo, (u64)i * XE_PAGE_SIZE,
> >>>                                                 pat_index);
> >>>
> >>> @@ -251,6 +254,9 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
> >>>       /* Identity map the entire vram at 256GiB offset */
> >>>       if (IS_DGFX(xe)) {
> >>>               u64 pos, ofs, flags;
> >>> +             /* XXX: Unclear if this should be usable_size? */
> >>> +             u64 vram_limit =  xe->mem.vram.actual_physical_size +
> >>> +                     xe->mem.vram.dpa_base;
> >>>
> >>>               level = 2;
> >>>               ofs = map_ofs + XE_PAGE_SIZE * level + 256 * 8; @@ -258,21 +264,41 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
> >>>                                                   true, 0);
> >>>
> >>>               /*
> >>> -              * Use 1GB pages, it shouldn't matter the physical amount of
> >>> -              * vram is less, when we don't access it.
> >>> +              * Use 1GB pages when possible, last unaligned chunk use 2MB
> >>> +              * pages as WOCPM is not allowed to be mapped on certain
> >>> +              * platforms.
> >>>                */
> >>> -             for (pos = xe->mem.vram.dpa_base;
> >>> -                  pos < xe->mem.vram.actual_physical_size + xe->mem.vram.dpa_base;
> >>> -                  pos += SZ_1G, ofs += 8)
> >>> -                     xe_map_wr(xe, &bo->vmap, ofs, u64, pos | flags);
> >>> +             for (pos = xe->mem.vram.dpa_base; pos < vram_limit;
> >>> +                  pos += SZ_1G, ofs += 8) {
> >>> +                     if (pos + SZ_1G > vram_limit) {
> >>
> >> I'm afraid this patch wouldn't take effect on platforms where
> >> vram_limit is 1G aligned. Even for the last 1G, this check wouldn't be true.
> >
> > We shouldn't use 2M pages if the VRAM limit is 1G aligned. This leaves this code in a risky position where the 2M pages could largely remain untested. Perhaps introducing a Kconfig option to enforce the 2M path could be considered? However, excessive Kconfig options can be frowned upon, so I'll defer to the maintainers to decide if that's a good idea.
> >
> >> Should be if (pos + SZ_1G >= vram_limit)?
> 
> But the problem we are trying to solve here is that the last 1G page overlaps
> with reserved memory region, there would be no change at all if we don't
> break down the last page.
> Or vram_limit has to be usable_size + dpa_base, because usable_size excludes
> the reserved region.
>

I misunderstood your statement. Yes, I have a comment in the code for
actual_physical_size vs. usable_size which needs to be addressed. Need a
platform expert here to answer.

> > No, it is always better for performance (TLB usage is better) to use larger pages if possible. With that said, the logic is correct.
> >
> >>
> >>> +                             u64 pt31_ofs = bo->size -
> >>> + XE_PAGE_SIZE;
> >>> +
> >>> +                             entry = vm->pt_ops->pde_encode_bo(bo, pt31_ofs,
> >>> +                                                               pat_index);
> >>> +                             xe_map_wr(xe, &bo->vmap, ofs, u64,
> >>> + entry);
> >>> +
> >>> +                             flags = vm->pt_ops->pte_encode_addr(xe, 0,
> >>> +                                                                 pat_index,
> >>> +                                                                 level - 1,
> >>> +
> >>> + true, 0);
> >>> +
> >>> +                             for (ofs = pt31_ofs; pos < vram_limit;
> >>> +                                  pos += SZ_2M, ofs += 8)
> >>> +                                     xe_map_wr(xe, &bo->vmap, ofs, u64, pos | flags);
> >>> +                     } else {
> >>> +                             xe_map_wr(xe, &bo->vmap, ofs, u64, pos | flags);
> >>> +                     }
> >>> +             }
> >>> +
> >>> +             xe_assert(xe, pos == vram_limit);
> >
> > Also while I'm here, I think this assert will pop on 2M pages. I think a break is required after writing the 2M pages.
> 
> hmm... pos would be incremented to vram_limit no matter it's 2M or 1G. Unless vram_limit is not even aligned to 2M, which I doubt that would ever be the case.
> 

The assert is for ensuring whatever we map is fully and exactly mapped.
So yes, if vram_limit is not 2M aligned this will pop. In the current
codd if we use 2M page, the outer loop also increments pos += 1G after
setting up the 2M pages which would create an issue. Sorry if reviewing
my code is confusing, just noticed this during my reply.

Matt

> > Matt
> >
> >>>       }
> >>>
> >>>       /*
> >>>        * Example layout created above, with root level = 3:
> >>>        * [PT0...PT7]: kernel PT's for copy/clear; 64 or 4KiB PTE's
> >>>        * [PT8]: Kernel PT for VM_BIND, 4 KiB PTE's
> >>> -      * [PT9...PT28]: Userspace PT's for VM_BIND, 4 KiB PTE's
> >>> -      * [PT29 = PDE 0] [PT30 = PDE 1] [PT31 = PDE 2]
> >>> +      * [PT9...PT27]: Userspace PT's for VM_BIND, 4 KiB PTE's
> >>> +      * [PT28 = PDE 0] [PT29 = PDE 1] [PT30 = PDE 2] [PT31 = 2M
> >>> +vram identity map]
> >>>        *
> >>>        * This makes the lowest part of the VM point to the pagetables.
> >>>        * Hence the lowest 2M in the vm should point to itself, with
> >>> a few writes
> >>> --
> 
