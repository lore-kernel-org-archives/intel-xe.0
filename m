Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A7C0CF0429
	for <intel-xe@archiver.kernel.org>; Tue,  8 Oct 2024 22:11:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5297D10E5FD;
	Tue,  8 Oct 2024 22:11:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gx9COrhN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DCA610E5FD
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Oct 2024 22:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728425514; x=1759961514;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=85ta1wqHO0tuqOInu5Mxrr5GPmalwpJoCCyp6SXDDEg=;
 b=Gx9COrhNLYfzCT13cE6Devq5S77V2Uj2I7AfBDr72NKcV24OTzS+dE6n
 5gR1Y9SKmHjrA2GgQdFf89aT7FIN58B1wJnRgTbltXjQf6v/7y4LGjD7t
 +fu6kSAXjo+VHXB1z0ZwhyuKkNWJ2+RozaafOe6HG8qXSCMezmoiZC2y5
 9xOkmSDdBQCmcKl0DKM6gb29Cd6ghy95FfLpGeyBh51YB1PkvxadZRcwa
 P+EF8Ryv7xyeweWd82bpB4SpgfEjW0ZRds60Yo4AGYpIHR1+qhd2/+T2f
 bceOEZRFJ2hcLoiA4d2P0z2cOhRuGBQ9L3V2C0rHLE2jgEnEDx8S8TLZq Q==;
X-CSE-ConnectionGUID: DMKWUDzWRQW7Nse6TNseaQ==
X-CSE-MsgGUID: ZZrE1fx3SkeO+xTthZAr6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="45196248"
X-IronPort-AV: E=Sophos;i="6.11,188,1725346800"; d="scan'208";a="45196248"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2024 15:11:49 -0700
X-CSE-ConnectionGUID: kGT54HXFQfiJ+2wcS/TkIQ==
X-CSE-MsgGUID: Aqw3M49rQ8ONefhaqj+Ecw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,188,1725346800"; d="scan'208";a="75886003"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Oct 2024 15:11:48 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 8 Oct 2024 15:11:47 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 8 Oct 2024 15:11:47 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 8 Oct 2024 15:11:47 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 8 Oct 2024 15:11:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dMxpCYBAnDNr/MT0ZrM2a6GHBs3orMS+F9naLw2dz1hwWsKWfwxuGWt7LyGSMmOD447KUtFn5lMf8sRm4givu0ivXVOdzxZMWoRiQvrY437NTs42zj9LB1W1UW1D+AqELhTBiErg0ckii4UOwURfesL0O0VjPKUU1IBzYOw1xd1yooQjDD9xIh+2s9HWHStnJvBdTd0aBMWfR/DXIzsHoiHzzcKEaeVF3hnQVEm3V/yg09u0oU769UpC7ACqwVYA8YB5uRiu+jz3RmMTu3UQvtKNBxfrV6FusSwjkDEshzLebEfRDRy9aghVtNjAKKIdkSA+KnDBeDOw5qVOWI8eIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ymlddDjOauyJ3F1M2CSpe9b4Wg3H46i9voiHztseYAc=;
 b=JEk0VOeH6SR2SaM7gCR5wJjiJvU354K2lkERZJcOWdMa6USr3Ij/O+GoB6uSGfnFRfff/JnLt5h4YB7YLC9meSgFnsJbWtFRbrCSu0oAK0CRq1ox68jaY3mZR7zcLuWiMEEh/erLJu0epbTh9bjQflt6IFbaM6tQYO5KGsJWd+4P3DaWM/D/qzY/mBcefFKGizLMKM/yw/OHPHuQzvKNG+41yY/xBwPInxQepYyqxz63Br6h5JCcMD2Blj6GSMBPbIzaYKgJQjaQl/WAT/EuzECSFybDUjBkZLN8HDTqBTnJnT9k4cgb4fHONc8+4iyK9724C5wSZf0S9vkHSZBgXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SJ0PR11MB5214.namprd11.prod.outlook.com (2603:10b6:a03:2df::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Tue, 8 Oct
 2024 22:11:41 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.8026.020; Tue, 8 Oct 2024
 22:11:41 +0000
Date: Tue, 8 Oct 2024 15:11:37 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Matt Atwood <matthew.s.atwood@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Gustavo Sousa <gustavo.sousa@intel.com>
Subject: Re: [PATCH v4 1/1] drm/xe/xe3: Add initial set of workarounds
Message-ID: <20241008221137.GK4891@mdroper-desk1.amr.corp.intel.com>
References: <20241008204626.55802-1-matthew.s.atwood@intel.com>
 <20241008204626.55802-2-matthew.s.atwood@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241008204626.55802-2-matthew.s.atwood@intel.com>
X-ClientProxiedBy: SJ0PR03CA0358.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::33) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SJ0PR11MB5214:EE_
X-MS-Office365-Filtering-Correlation-Id: 76571315-5fb9-4921-486f-08dce7e62fc5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?nUdcvOzcBSLtDbc0uPuQCUUZWaFcxiIVXVhSF0KXfEakFFEQ/mEnBPoqoj/q?=
 =?us-ascii?Q?C6WHETYvU0o8MpR4vTLYbLJSfbo+t1QrlkuZs1FD0Omdy/mMrLyaaIZdMI3x?=
 =?us-ascii?Q?B/y5GNvt5UTuynaQOEufJ5sIq4Ln6JK+ylBEmeJF8sr18Pdd8oxMBWCAcyP2?=
 =?us-ascii?Q?WtoD5vA9vwcJXvrjW6U9hG45pu9GXvW/G6OMb3d98G0bJTaCB3DD/ntncA28?=
 =?us-ascii?Q?UkmJRqsZW+gkZiN7qP9Wrq8g+P0W1oRNABp3d1dgZAk2G1lhL3Zb0IbOT34A?=
 =?us-ascii?Q?zQg5U4/UiyCkGdw8QXTeqnlGW7NdCjyt9+ImzDNfOc4fXADKo4MiUh6TCAEa?=
 =?us-ascii?Q?KcPLuPh7kRB5QT37OHdWwCENraCdqw6u2w1NvCy+azKvT7m72J2+wL4rdaAa?=
 =?us-ascii?Q?abDoEvU/a+mkXsyhcMxNU4gcZbLJMa+jnWV94lgk7ntw6b4mdC6ESNd0PK0g?=
 =?us-ascii?Q?kdOjHJw+2OiikMMMDOjH0C5lVx0SHeVUzkZIy15xmtz28Ptd8Rw9F6OPqQf4?=
 =?us-ascii?Q?6V/0Etuu/f1pwOBI9D8eeG0OTmUXFKfbGGkqQ7hAbN3j8MVh/8ipwbAVE/K1?=
 =?us-ascii?Q?YYVIIdUKEt6ucUKCUEYZJzf0MckyVlJAWvPxQGGO0nzW6Yu8IS5aMEddgEN5?=
 =?us-ascii?Q?bSsib0oaULdcEXLMP1/E4O+FB6kVGvYysJGvwVfyY1RNSc+7cCs9KNX8XLMW?=
 =?us-ascii?Q?wItzwey2mfxA36LlUbQqyEqKd6MJIuE+31/M+lBS7gwZwlty1ehEokYgkcO5?=
 =?us-ascii?Q?CMtsfPDNomEoYCVmWdZ2WvqXjjXXf5ztVdGsQvhRfD7d9TtMJ8QRwPHp7m92?=
 =?us-ascii?Q?ZWrydqiQuBHiR55otJ4njZ2gNFlIcb8dmGINKh7JGL8VB0PPHGnJb9GU2aO8?=
 =?us-ascii?Q?fqWX+wj57wtsWtDvCGa+kH9YwNNyt3lotmPE7kA6XdvDGToO7ggdzHiIBdc6?=
 =?us-ascii?Q?9fsp6GmJD8pXjjzn3LSJOsC54UeZljfxZ1x1wpGFxVBf4N7S5I2XLWhDznYw?=
 =?us-ascii?Q?UQJOYoaWA0KjJQkKmsksmEfFn973PKnVdxlg51ta6T7+pyucmNwA2Wn7DZ8m?=
 =?us-ascii?Q?xweHrRoFE93nCZmQXHYmIvGKZijMcveerHj+cZhntdFKGNv/er9Iup+q02k0?=
 =?us-ascii?Q?pEU+jMsLXRGeOFeM/WfRezFFiAI9tYJAS1v9GssRSeemIAh0skQtFlkw7j5O?=
 =?us-ascii?Q?NBSkdoOzHk+4yu797YExbRGKYEhTxSPtbZ+8zO45SIh8HUUQ0cmLLzARW5U0?=
 =?us-ascii?Q?xcrElx8Nxs3qJTww4p9JIm6+Bc6AJtA3jOvqyeyNow=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WqHPMAI6u8XsQwkXMWEsdXhy+dj7BVZvDDvGEhZstc116m9R/r9g3bkM/GUs?=
 =?us-ascii?Q?Q5z6dAJ2MEwYiJeG3vvRdJmitTvbAHRWs/OdCbnivUvVi14O3nEGtUAqJwuR?=
 =?us-ascii?Q?qRunM6XJYTurAC5KA00UP8NVcx/ntp0g35s88hASjy38H5qUR/Qok7H65OIJ?=
 =?us-ascii?Q?7oacqMb5qaXptRDALbSD8bM6NMxWsZb4W6GMvbUv4rnRLERj8Ki0AFGbtbx+?=
 =?us-ascii?Q?tEN0ku8fA54yCkB7SXZxaRWXDARXG+SSICp0ZWe6ExUgd5z7YRjBjacUE8s/?=
 =?us-ascii?Q?NlaZs0p5EEXz4Lr6vZkRGh9qBTJrqfAfDMWOOxmdAkpetKp0qzqJZKkf+DbA?=
 =?us-ascii?Q?NudbTc8arK3YvajnnDadREZsoJeoLyx7CBxuwXKkpX1vaxmzDnPePJsSjLDq?=
 =?us-ascii?Q?3fCH5YwITa21W1i5bIQjT3RgNwFI3p2GPkcE+noYNHH8CsIBmsrta81CnhxB?=
 =?us-ascii?Q?5XGM5vEak82ypLMCcDT/0R9RIGmH+E/xie91zQvOTC2G8zQYzKaQrQ5IB5Dm?=
 =?us-ascii?Q?UdQzjkfAVIB6OUhTptmI21M8kjK6fSEcnB4iYYtAZv7hN7VKh0VLtnYwysl9?=
 =?us-ascii?Q?5qTKRlT+F/Ff3x5K6DjUfRt/v9ne4YcXFUuP8qkX/ceqOOHJOkkfa3dfGuvo?=
 =?us-ascii?Q?elzwbScZ2fr8BfjjCGPr8IuDAxlf19NQEyIxo2EEsxLRIiYg0Qav6+sfJFY2?=
 =?us-ascii?Q?ZbWJDklf0f8fsur/Ibca7JjQLuyWk8Y06pvIrnQgXP8Sq5goX8SVw/anXPHK?=
 =?us-ascii?Q?rkKD8G1DgU8RdcqqrwKvPbTDBoJOsNXFVG9KpPfFzQ3mKVUqiy1ciGBXLdG0?=
 =?us-ascii?Q?PZFMdxnbxMh5AfpbVZ4Z25cZYovf5Iap/LCgeR+8oX41V7H6fRzNfZeJaXiv?=
 =?us-ascii?Q?9gHDQ/7QrLqmlB3A9m1iyCwrdFJt2ykI5dHgmeZjf1eUDuUvClLeB7j9067n?=
 =?us-ascii?Q?9NhMZQ7wRxOhltB8Jf8pN1PkJXCfHbDgf97se/B4I5xBr+c+wpZf0QxIO6JV?=
 =?us-ascii?Q?4iNkareJX9fUQKcJyQpW8eQfxY+sLGUeUKg/aewWW1GPXXHb13Bi5inSHKiA?=
 =?us-ascii?Q?lTbTI4qb1hGE/cvEn+CnZUA0xvb2V0F9iM+Pv9GNb2mJ4uy8sDVsps+65jLq?=
 =?us-ascii?Q?Bcw5h0t6+2uLibFeopyk/+2MO9W56ZFdGgwSL6AP7xri/y2/StUmaHfzJ70H?=
 =?us-ascii?Q?BkuqRSAJCIkjSaHiC5SrE6PjOqiOK0lJj9ZeWWlO6cs6lDPhOfTmLIvjUjrD?=
 =?us-ascii?Q?xpJsh9asc0ETAJUpmSOS8WqhHHb/Hr3IZy7Q20jeqn21H8MzrOsbhMJKkxVg?=
 =?us-ascii?Q?3wC+Vl7weEdV1T4yYDr324oq96fgLS1cJVw1N0KRheo9rlNW4xTIgftKzCgY?=
 =?us-ascii?Q?PT0Qh97wIrs/PnNS5ihGknpybsEItn1n+THkumN+VfBZksxHHn7SPjOLaOna?=
 =?us-ascii?Q?AdlwMVvtl5RMTE8SzZs3LRvxT8CCNIZ5XbkeW5W5cTfAgZOqMc/LPt/5GaHp?=
 =?us-ascii?Q?+ZSmSe3w2qDGmZwnTnTRXLntpD5MJwBZrHjiiC+ldQLwb7HBUTgr5iQUUHWC?=
 =?us-ascii?Q?qW3UsdCdW0YMhEyhnCjSKqRTs7uKM0DUcoJ3iqlU+/6GPb3AcNGNfJjt4J93?=
 =?us-ascii?Q?/w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 76571315-5fb9-4921-486f-08dce7e62fc5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 22:11:41.1344 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dUFeqi/uGChhlJjLqEVK2I4GhhlJTun86wdQgFqIdR32ac6kezjSOZifupVDxPEvAXoEfxyQXusomzHyUVsRKimdTiy/4/djUIymHV1q/LA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5214
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

On Tue, Oct 08, 2024 at 01:46:26PM -0700, Matt Atwood wrote:
> From: Gustavo Sousa <gustavo.sousa@intel.com>
> 
> Implement the initial set of workarounds for Xe3 IPs.
> 
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>

In the future, please make sure you include a changelog in the commit
message and add a Cc for anyone who provided feedback on the earlier
revisions of the patch so that they get notified about the new version.
Also, since this is down to a single patch now, we don't really need a
cover letter anymore.

Anyway,

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/regs/xe_engine_regs.h |  1 +
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h     |  3 ++
>  drivers/gpu/drm/xe/xe_wa.c               | 47 ++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_wa_oob.rules       |  1 +
>  4 files changed, 52 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> index 81b71903675e..7c78496e6213 100644
> --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> @@ -186,6 +186,7 @@
>  
>  #define VDBOX_CGCTL3F10(base)			XE_REG((base) + 0x3f10)
>  #define   IECPUNIT_CLKGATE_DIS			REG_BIT(22)
> +#define   RAMDFTUNIT_CLKGATE_DIS		REG_BIT(9)
>  
>  #define VDBOX_CGCTL3F18(base)			XE_REG((base) + 0x3f18)
>  #define   ALNUNIT_CLKGATE_DIS			REG_BIT(13)
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 55092089bff6..502a2804c1f0 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -286,6 +286,9 @@
>  #define   GAMTLBVEBOX0_CLKGATE_DIS		REG_BIT(16)
>  #define   LTCDD_CLKGATE_DIS			REG_BIT(10)
>  
> +#define UNSLCGCTL9454				XE_REG(0x9454)
> +#define   LSCFE_CLKGATE_DIS			REG_BIT(4)
> +
>  #define XEHP_SLICE_UNIT_LEVEL_CLKGATE		XE_REG_MCR(0x94d4)
>  #define   L3_CR2X_CLKGATE_DIS			REG_BIT(17)
>  #define   L3_CLKGATE_DIS			REG_BIT(16)
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 94ea76b098ed..0ee532eb26d6 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -252,6 +252,34 @@ static const struct xe_rtp_entry_sr gt_was[] = {
>  	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
>  	},
>  
> +	/* Xe3_LPG */
> +
> +	{ XE_RTP_NAME("14021871409"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(3000), GRAPHICS_STEP(A0, B0)),
> +	  XE_RTP_ACTIONS(SET(UNSLCGCTL9454, LSCFE_CLKGATE_DIS))
> +	},
> +
> +	/* Xe3_LPM */
> +
> +	{ XE_RTP_NAME("16021867713"),
> +	  XE_RTP_RULES(MEDIA_VERSION(3000),
> +		       ENGINE_CLASS(VIDEO_DECODE)),
> +	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F1C(0), MFXPIPE_CLKGATE_DIS)),
> +	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
> +	},
> +	{ XE_RTP_NAME("16021865536"),
> +	  XE_RTP_RULES(MEDIA_VERSION(3000),
> +		       ENGINE_CLASS(VIDEO_DECODE)),
> +	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F10(0), IECPUNIT_CLKGATE_DIS)),
> +	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
> +	},
> +	{ XE_RTP_NAME("14021486841"),
> +	  XE_RTP_RULES(MEDIA_VERSION(3000), MEDIA_STEP(A0, B0),
> +		       ENGINE_CLASS(VIDEO_DECODE)),
> +	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F10(0), RAMDFTUNIT_CLKGATE_DIS)),
> +	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
> +	},
> +
>  	{}
>  };
>  
> @@ -568,6 +596,13 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>  			     XE_RTP_ACTION_FLAG(ENGINE_BASE)))
>  	},
>  
> +	/* Xe3_LPG */
> +
> +	{ XE_RTP_NAME("14021402888"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3001), FUNC(xe_rtp_match_first_render_or_compute)),
> +	  XE_RTP_ACTIONS(SET(HALF_SLICE_CHICKEN7, CLEAR_OPTIMIZATION_DISABLE))
> +	},
> +
>  	{}
>  };
>  
> @@ -739,6 +774,18 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
>  	  XE_RTP_ACTIONS(SET(CHICKEN_RASTER_1, DIS_CLIP_NEGATIVE_BOUNDING_BOX))
>  	},
>  
> +	/* Xe3_LPG */
> +	{ XE_RTP_NAME("14021490052"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(3000), GRAPHICS_STEP(A0, B0),
> +		       ENGINE_CLASS(RENDER)),
> +	  XE_RTP_ACTIONS(SET(FF_MODE,
> +			     DIS_MESH_PARTIAL_AUTOSTRIP |
> +			     DIS_MESH_AUTOSTRIP),
> +			 SET(VFLSKPD,
> +			     DIS_PARTIAL_AUTOSTRIP |
> +			     DIS_AUTOSTRIP))
> +	},
> +
>  	{}
>  };
>  
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index 0154fbe154e9..264d6e116499 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -33,6 +33,7 @@
>  		GRAPHICS_VERSION(2004)
>  22019338487	MEDIA_VERSION(2000)
>  		GRAPHICS_VERSION(2001)
> +		MEDIA_VERSION(3000), MEDIA_STEP(A0, B0)
>  22019338487_display	PLATFORM(LUNARLAKE)
>  16023588340	GRAPHICS_VERSION(2001)
>  14019789679	GRAPHICS_VERSION(1255)
> -- 
> 2.45.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
