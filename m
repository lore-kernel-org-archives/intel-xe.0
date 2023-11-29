Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7E57C4167B
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 16:36:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A5EC10E635;
	Wed, 29 Nov 2023 16:36:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F063810E635
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 16:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701275802; x=1732811802;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=wv0j+7A9/GqeqHpdBUYlXuWgXVHZFZ31Gb+2N7Tme+E=;
 b=XtNdI7OKkW/pzLvdlwGKTjw8ca5ZCD2sU+I0oxg8rNYn/KhV9JHk2taB
 j0hFIjpUO8c+aRZvjFrxRjbgEibxyD/fqwv6Hx9/9RV0oPgB5I7WwJ22D
 bcwSrD5rHfwmz0I3nTxMibryAgjEiNV+ElPaD3Y8Cd/PvjIq7Et7utitg
 QzU/wxQ7eT+CICPMRKPSAKhUMDgOTLlsNgwN76W7Ldv5WBb6Ix7Cck32N
 48FrFQanWQoI0ew80pGM+uxLW7aOUfXU2pBlHUjUfvfZh/BppvG0Wg6Nj
 WjP32v8qftDf3Xo5br+jlcbYfC3e0G2WE5zP4e/VtYmtrP7yVq6G1C3D7 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="378219428"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; d="scan'208";a="378219428"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 08:36:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="797969952"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; d="scan'208";a="797969952"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Nov 2023 08:36:42 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 08:36:42 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 08:36:41 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 29 Nov 2023 08:36:41 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 29 Nov 2023 08:36:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ygkmdk3my1m72CZqFatutFVe05lUlEmgb1ruX+agyaByRgPK/JQMNp7UPqc4XsOHP8gPWNur+H8waL278JB5xyyjS7J1mvUuXk+Mwqim/VSzR2sMLppL6bYYP0iN/HiPxWrGHv+chcYipvKG4s8oFRbHNaC4mVHEZG8D2889YTcouQTcdxUtEyILWbQAKwEerPT9bKjz2yQa9AlmCe5OeQP62c741JDlH7V2dlg/JgREPxK55gI6xSJQBgT25ERuI9jaEmN9e/vYT0V2vWNXMP9f/eqMmSUXsuBmVOw+iwk/E1RifqfnYirnefpZmRgToB25WnlINImCodTqQ278Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4qWv6/Bu311kvR86BmWhrcvIZH9Fc16626TiRDe1Uco=;
 b=hPkmddKw/9G1d0k65qnnC1KFGrL/BzZYLUeGrizfQsv8EfMzPXAFlim3ahEw+d2I+m3zzCUlO04oozXAuBSyUuB4l8YPlhUmBQkCa+GXYxIhWrgoi1WvbJyIB8uY5HdyNPRHb4OMHYe0NWzVFkctUUM6wy0sJjIUY7LROfPO6QGQ8f1rPCV1aLi6UDaDg0NWkTRwiYvSqzNKKG/ZAj5HqYi8b+NwXGokwvgNSq2BKuhgf6RwqtlQKfNA4E/oCo42DODnScl5uex42rE7qSbVCooPU9Ac5nNR1JBRfgvNX7VnglXPBJcvxNyF0fWiISMwerrypn4MH5s7bIM6+VEAsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ2PR11MB8422.namprd11.prod.outlook.com (2603:10b6:a03:542::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.23; Wed, 29 Nov
 2023 16:36:40 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7046.015; Wed, 29 Nov 2023
 16:36:40 +0000
Date: Wed, 29 Nov 2023 09:35:03 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <ZWcFx5KPegW17QV4@DUT025-TGLU.fm.intel.com>
References: <20231129162900.15342-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231129162900.15342-1-rodrigo.vivi@intel.com>
X-ClientProxiedBy: SJ0PR03CA0062.namprd03.prod.outlook.com
 (2603:10b6:a03:331::7) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ2PR11MB8422:EE_
X-MS-Office365-Filtering-Correlation-Id: 07fa72c0-b398-4731-86cd-08dbf0f95cc3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NO1iq+cmCpx8f39KcVDapirHpeMHWjKyCtaW6JX1zBY6ol1Z22NTV3DqhUzMlfZPmhakoov4Cr32pMBHBSZo3rtphh8dmxvtS7/PUzjaRmD2XXkaZv/DTiEVhgXGe5LrLTByDydkRapvpPH/wklhAo0QsUrUTdBeina04/ZF1TzNk/UYMR5z9zp0J+JwsMG4obf4PFSU6gPB5xv3/QkTtFho15Pl7HYPWmNnKQHD6AzerunF/tReY1lxWBGZhBqe6iGOi9EpVRYs8XZuROj6NHM9HnF32hcEF20BIkc/P2R4tbfBPrV59IPRgSHmza/6UDn55ccXz3G2i6nb2pJqwYS7SV+iQ3XK1t0mbex0p0S/zGJ0mQxJpory5vhxwo9hbwXIc7dWTEGrSTP7tEon6fz2ymG27qKu6Yohiez96AD5tBEiWmlf6BfJVuw3h0yE4hSo7+HwZliCotjlxwMhltc1nOI3J1VIc+MXOFxKR69/DkoPjNZ2FTGUKrt2QOnftd2QmgiXje/wE1RUlozknqfhhrDiz2Ay7a6UJmuLlABUu63OsAe9MMhF1iA5GAxQ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(346002)(136003)(366004)(39860400002)(376002)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(82960400001)(38100700002)(83380400001)(2906002)(4744005)(86362001)(44832011)(5660300002)(8936002)(8676002)(6862004)(4326008)(6636002)(316002)(66556008)(66946007)(66476007)(6486002)(478600001)(6666004)(41300700001)(6506007)(6512007)(26005)(107886003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OsFf/Nl0JmgUwHIauDmVzt2Sl7rcPwr681xLMnupeHhaAonyZAWq6c7W93Nf?=
 =?us-ascii?Q?NGlL8JhY0iT0RaVcDF3BBxvwySSV+UDIoGz8RJpw42GRJfeypJmk46FKwj6i?=
 =?us-ascii?Q?bsSZeF+FHKGZjn8rNByrN8n1UOrUUnAiVjOUw6xP2p4M2egiNtevHwdILvMW?=
 =?us-ascii?Q?eJG8i7w+7V7DW5cH8ibE/XWKHmzi3UIhaqmpZ49P/b2qwyhdvSYYEEUqea3i?=
 =?us-ascii?Q?taemC5vPzHkjc38gjPRpwZGnGSqiYzlw0IijWMm/YD95bR4v39rSLVAFkWIC?=
 =?us-ascii?Q?SJdAwumk1yJItB/Cf2GBk8A4eHLyhDgGJuWdmMNSERmZkJBtiSkeF494X6bt?=
 =?us-ascii?Q?NaQ1GPQufylWcQIaBhuZJPM4OsA7fXpf+vmjP/WX2I1R2GZZF2IlOmU44pEE?=
 =?us-ascii?Q?tAF8ihDlG/C4LhwsIdGBa44wJT4jVL1O/UV6hZijP1fzB9Jkt0SXkJ9V0AUH?=
 =?us-ascii?Q?EMtnWiC74sYsNUnL3oRdV7rSQ/jMu1M/+3Q6WobLcQOtbxc5e+UsnGMW1+AR?=
 =?us-ascii?Q?wmPyz3N1RocQiX8qlDpmUz+AE8bVxVExNO1RKBBzfFWD7aXzxddX/dwsqf6t?=
 =?us-ascii?Q?zOSKfZrhQEhBrShmWzmY9PUWIv/YFUqnHIqFCJLtMQp8GpUWd6EJcnf0Eyoh?=
 =?us-ascii?Q?Pc4Pi9K+7JPKc/cPguezKFr+puec6+DvtmzvEYugarF/yTEj9hDeDJVhUDpl?=
 =?us-ascii?Q?tVP0fc8kNlM94adMEAr9CjThJnv7cY1TZBk55Bp/NegdCKPmTeBobT++nShX?=
 =?us-ascii?Q?T2nMa/2YODWxQ8bV7NlsNAL7Q0JlrWSCWa6KZ88y0CPPoRCyxY/M0tVqF+p6?=
 =?us-ascii?Q?Xr+vXyr1OGJj4AN8YM6wfY0YG5YuVxje7wpmWBsSMkhcNdBdWEvzYdC9G0G2?=
 =?us-ascii?Q?gLqehjoZ+TQmJHuV9v0WJtuZ7nAcvwFdkZLcbaqcpUJcwydx+t74LfuUR8bW?=
 =?us-ascii?Q?F3Xii0g9FWbh1fqUwvbYI9hOrXWQe/7lhDr66OWbkxlaaEfFDM821QvvnT42?=
 =?us-ascii?Q?T98OnxeGjd8SlIfvwcmAux/kVx43rmRQ7Qt8zcaaNxcsTnzgyVxOfmJhyJjr?=
 =?us-ascii?Q?MpJgdojQm0SIW8clNtXG5umG/FuOyAitReRI5s7MRI7q4HAgvqckLYTfMetI?=
 =?us-ascii?Q?eIjpWAQWwwbKIPN/KayK9nE9XaRsH6CGJqelEv9vb2OcYIq+Zep8O4nL2p9I?=
 =?us-ascii?Q?WdBjhucNHagF67tB5E1Z4v0Pr7RR0FFYB0O6Lgag7rizJTb+jZoRJxgQBOKb?=
 =?us-ascii?Q?r5AC80rR+/SYRKNp3BI9rtxa/QztlVYdl6VioiRFQmLP+Fq4wG48TzfsJ5iz?=
 =?us-ascii?Q?K74hbnhUrW0p8yFk2o3DtslDaa+pafIOzp7UFTFsOP2/5X2cCw+mUOvoU2O8?=
 =?us-ascii?Q?dTwfCEMb+aYV8+969OH0+6nE38l/rXNLo7/qx9wvuNdL8wfw4NaM0YP91qH4?=
 =?us-ascii?Q?G6OQ3swTXh3LfDK0iIn7xtCIibPQtCyxUMJy2rf1juCNzPfH87wDtSWQU+BD?=
 =?us-ascii?Q?Vp1hJ8zHFbGumSvSpH6iuMzBThuLJldrGZk1nqR535btwn9uggXRp9j2HPx+?=
 =?us-ascii?Q?Y/yJBkFG2iJkiaA+y/ef6QzQOqqlvP3A+ju8UhrxY6PO8Mh8oisWviBWoa8b?=
 =?us-ascii?Q?vg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 07fa72c0-b398-4731-86cd-08dbf0f95cc3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 16:36:39.7905 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7hN7QqmlnmBC57e+iT5BnG/dhHdtWQh2TnfqTou6Rzl7rKJFbmwVV4yxbEolga6MVUAVRQ6VD/h1aOCdBe3JGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8422
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Remove unused extension definition
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
Cc: Francois Dugast <francois.dugast@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Nov 29, 2023 at 11:29:00AM -0500, Rodrigo Vivi wrote:
> The vm_create ioctl function doesn't accept any extension.
> Remove this left over.
> A backward compatible change.
> 
> Cc: Francois Dugast <francois.dugast@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  include/uapi/drm/xe_drm.h | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 88f3aca02b08..2c44845c4ba4 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -584,7 +584,6 @@ struct drm_xe_ext_set_property {
>  };
>  
>  struct drm_xe_vm_create {
> -#define DRM_XE_VM_EXTENSION_SET_PROPERTY	0
>  	/** @extensions: Pointer to the first extension struct, if any */
>  	__u64 extensions;
>  
> -- 
> 2.43.0
> 
