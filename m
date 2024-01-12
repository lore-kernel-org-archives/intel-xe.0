Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EB15C4707C
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jan 2024 09:16:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E99B310EAAD;
	Fri, 12 Jan 2024 09:16:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D6A510E9D8
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jan 2024 09:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705051009; x=1736587009;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=NqKIpSwr7IuFlzZJahY/eWgQrsvEbjLxsG6tnmPMPow=;
 b=A45ehnaXJM+SSbZJjF43/YjgRIz+IMc/MkgD1K2vhQpxr9slNs6DbdyX
 Ba/m5PdJnKsRrpPm5pZ6dAfA7VTHD89jY9tBfKIUi80kr3JUfwu8IvPC1
 igkyqPF4bUQjO0+TTXFVmza1FH93XxiEErPGlFH2+kZSh0yrPyL2BLlRd
 rFpNDytaJn5vVAb8kFG2QTzEHUZxFix9XKkML+VqjMQ5vmxWEP2khFdAO
 2wn6Zj/yiBFasyr60HhjAMZQk3fDRB8E8b84MnRnaXXWXHA3a4uvaegFy
 d4/18X36VaSqSG0Xr1+gxM0pAdhz2E8+VK2LFQCrwSpDW8sPK+BzR6vYP w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="485300978"
X-IronPort-AV: E=Sophos;i="6.04,189,1695711600"; d="scan'208";a="485300978"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2024 01:16:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="901924029"
X-IronPort-AV: E=Sophos;i="6.04,189,1695711600"; d="scan'208";a="901924029"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Jan 2024 01:16:48 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 12 Jan 2024 01:16:48 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 12 Jan 2024 01:16:47 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 12 Jan 2024 01:16:47 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 12 Jan 2024 01:16:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OuUSNFth3hK73d1Z04Sb3wUmxqjLiDtHmsa/ZQqrc2pWxSLkjWvcfwYwkTWudRwy8HycnbinVmLCiB5+jFbxl4+77C2tBMCuELDXUHoaZBxCxiCaf+BMdAFKmqVGHk4S65bPEKYBY/2nP2MGWN5zaUdXKttshkGoZ9+h61vpY7dtP7zhlo6h38vI3+inRyhL7G7xzChpPHNaKGrTpcBnZzLOr9XvA3jZX36sloUZ2whpxlSgF0NLp2QfRnfL2e57RvROvQbkGsoaazZz2Cl7QN7UdPxvTXQhCPrwt+v+HZV+sEFW3VyJkhvmesD4LHQPvaSPS5pQN/KcmBL+53MTbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6G291TVblVONY3Pgk840QKEWoJ2zvCCPZoCJmVcCsTg=;
 b=YtPf+VfcsXececAjOvPXacoIHOQVmnOWfKsHWuJQYFxGF6jtT0UMjncnPiMCnGuAV47y6soKmrprFCWTIPfX78nsSHeaL0isCKA86WYVPheK7rNgB9K4hPjBqj4wnJl+s1ApeEg8uU1lrpyOjl/VMrbhMJBniY0EEuigr9SarKWtoR0QubJsBri8nsZf8WQAdqy+5OlS33Pw+VVYC4sWmONx0lGxYUETGJb7DBb7V6rra+xGTtlRluzxMKG7wiCiDcy9PzQ3Rw79gRMVUMsMbzSZ52NVPZ14GoiCLAcpRhK/hBFHGs0DQ/rQE6hJvsbC7J3wtRVAuYO7xMZ1i24pgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by MW3PR11MB4732.namprd11.prod.outlook.com (2603:10b6:303:2c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.18; Fri, 12 Jan
 2024 09:16:45 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::b30b:545e:3b7f:9626]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::b30b:545e:3b7f:9626%2]) with mapi id 15.20.7159.020; Fri, 12 Jan 2024
 09:16:45 +0000
Date: Fri, 12 Jan 2024 10:16:43 +0100
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH] drm/xe: Fix potential deadlock in __fini_dbm
Message-ID: <20240112091643.zl4dohob6npa4lhs@intel.com>
References: <20240111185603.673-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240111185603.673-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: DBBPR09CA0002.eurprd09.prod.outlook.com
 (2603:10a6:10:c0::14) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|MW3PR11MB4732:EE_
X-MS-Office365-Filtering-Correlation-Id: c6b6f353-6624-4f15-ce39-08dc134f3294
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: twWIYuP4RpTIQChofX3BG2U2HRxu4TSHVTMsTKuKz57qns27S04GV/equsrDvG0kaSq/xy/4FOJDFMb+xN2/8tPAnjAZlEuUW40whyNShik6QY6m2r9eOEsV2PLdjZhCe7WdQ/Ntkk54KTl0qgfY13+cGFl9YptOi3uZBZBvpECo+uv2350Cqdy9ZFr0H/9+t1oSk4iugiI38etUAzuGaP1knVVQv0kr8ipR5nNaA/vwzgLFDpA1JGPbg6WPLIsuC9n3pQt754vg6hRWtMUUrNeXtCSrxjHDWLur6kiDbdMAqpwfWbbaK/r1MCFtcxCTz/Je1os50yUl2Ug3ULYybyKEo6SnAmodYT5nGWimeImy1L3D0Wdhu/19OOc0LI/aGlSBxN+DkEsdgg96VgiJZzoFSCXvU3Zn2rEclOvOMTwcKSugKYED/99d/Wu98hFnJf615WjIKx3P6nFa/upd7xWUzoSVEkHetMkQKziNd+NP/uG2EfT5Q6G7TxX+pxw6Pev5nCr/QiQkfKw69m5TeQoByXdXBqi6zIma8ZQtXVPFIBl9zvEvbQcV5R+oSt3w
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(366004)(396003)(39860400002)(136003)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(6506007)(6512007)(2616005)(8676002)(5660300002)(8936002)(4326008)(6862004)(82960400001)(38100700002)(2906002)(66574015)(6486002)(26005)(1076003)(6636002)(66476007)(66556008)(316002)(41300700001)(37006003)(66946007)(83380400001)(36756003)(478600001)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c2k0ek5jbEpxemhGVkVvTzFUWVlzSHNIMlMrZnh1NFpnWHZiVkRjVzVOK0ZN?=
 =?utf-8?B?NWFtZlBlcHZoUURTVUJrVmROazlUMmZnazJTcE1zakdTUWVwM3pQdDc3bEFk?=
 =?utf-8?B?bHJoTm5ISFVZN1NBZmc0RENMaEczdTgyTGFwVURmbG1nNG52ZHJhbXQvNWZT?=
 =?utf-8?B?L05oV0Y5b2RJMmkzMGJlOTBsc1lOcEJRTDVackJNYm5CT2JlUGEyQmtpcE8x?=
 =?utf-8?B?YTNhRXY0bGI3WVRoZ2srVFJBNzRmUlI4dGdJSFZiQXdzc3M1SmRLMkRJRTEv?=
 =?utf-8?B?U3N1THNkNWNPUUJrN01VcFYrWW5rK0xGb2pUWGp3SkQreXF4M3RNVjZwUVc3?=
 =?utf-8?B?QzBRbDM3dCtNL3pGYjg1RUV6bEFDNEVrWWR6RExQZjh2cVV6eW5PeElKaG9u?=
 =?utf-8?B?anpyWk9xcC9rNDl1U3piQlJlK2JvcTh5VVR5aEhmVjRTM2R2MlBqSytiWHVn?=
 =?utf-8?B?Q2xGSnp2YzdEdG0zNFhxVThLUHhDUm11cHhRYlo1N2t6bHpjQUZEQ2FKNVFp?=
 =?utf-8?B?c3VMNWZhdDluMERSMS9WQnFGMGExdlM4ZzhSN1VEOXVlaHo0dFIxUTdseTho?=
 =?utf-8?B?Sng0cFF4TzByMkpuS29lSlBMdldwemtocUxyZHB5NmIxMkYzeTF4dVJPQXls?=
 =?utf-8?B?UkRBWmFmMXZ5Z2hvWi9GUGQ3OTRVRm1iNWsyYmlWOFFFRko3QzdTYmZMYjJF?=
 =?utf-8?B?OEQvanRZVHBGcjVEVitiVURla2tFSWRlSkk3RlVLWXZJTFlLMy90OEZUU1h6?=
 =?utf-8?B?UU9QQ2ZzcHVlQ0xGTldIcFBlRERjMlg2aFhNQnlsZXpvbWI2ZUlTallrT05D?=
 =?utf-8?B?b1h1d2tPU1JZVTgxc0VpaWFIV214MGJwaFUwRXkvWlduK3UyWWZzYTl1dkdS?=
 =?utf-8?B?eTNKK0pCY2c1QVBTTDRZZktwUkhLN0pXQVR1SG9RaXhwWmNrcitPV0oxZXFh?=
 =?utf-8?B?ZFNIdUFyaVdHa2VXc0I3ZjYwLzZLZUIxUklQbzUvamJ6dmdIcktHbFc5L29v?=
 =?utf-8?B?eVMyMDZnOFY2Y3RLcFlySm5XN2NkdDNUemFQK3lHc2F0V0g4SXlmUk9aOVV3?=
 =?utf-8?B?QzdMSG9jTUQ4M3pESmFDb2JSdEp5enNpRXRKL3YyV21xZVhOMktKL2ZXQWdq?=
 =?utf-8?B?TUVlYkhCQm9sRzc0L2pRWGtkUWh5ZWdsOXN2YVVCeTZaT29DRUE3Sno3YUcv?=
 =?utf-8?B?SzEydkJ1NzNOLzJLQjIzcEVHNmZqVVdhcURTZExuVm1sN3gvN3d6WHgzaDhV?=
 =?utf-8?B?RnhEdGpnM3hKbmtNQ05qWGNNWmowZm5wNi82UXYwNGlqRjZNbGJuMVRDekJH?=
 =?utf-8?B?aUkwVHFsb3kwNlNpdmhXQ3hXNkh2RythU3o0cUc0OTltb1gweEJGcEtqemNu?=
 =?utf-8?B?L202QzB0cllrc1VSQmFPaGl5bVRrSndyK1kyQndBU3JQc1FXb29IRlZPZ1hQ?=
 =?utf-8?B?OUtXbDJSMythVFUvZFBIQjM2MC9LbXpRcC9EZjZIQXFSblVvSVNCWXJxR2h0?=
 =?utf-8?B?ejhDTlhjc2J1MDhPRGczaU5xQ012Z3FMc3BwdXJDUTlNQUp0TWJGTHBaZkV1?=
 =?utf-8?B?RWY2aUlpK0duc0xLY1B1ZGRKWStHUzRIU0xrYnI1T0RPYWU1cVZvWGNqZlNL?=
 =?utf-8?B?ZDcxdkJ6Q0FlZ3hyajQwNTg3NnJCNkNxVTB5M001WFg0L1FVY0pWNWV1OEkx?=
 =?utf-8?B?Y0k0Y21YQ3YwUW51K1pyZ2svYngrd2F1NWpPMHJHekJ2bEVrZWxhZURKM0Nk?=
 =?utf-8?B?c3ZCMjBRY1RnSlZLT2t1WmRDQkpsd2F2RTZUUGduMm8rK1Q3YmhjZVBGWjAx?=
 =?utf-8?B?ZjAxU3p2ZUdyMlRMZjRxTEphV2hBVHlqaFg3eVRWQnFjUlp5blc4YlZWTWxX?=
 =?utf-8?B?TTMrT3BNdTlTN1A2VGhVUFhMc2RJc0pxYkgzSzhZU1JoOVhva1E2bWNPWEJ5?=
 =?utf-8?B?TzcrQ1Z5NUNGZFRaOTZtd09zS2RueW1xTHVmRkV5Uk02QzkzSHV2NlYyQXZs?=
 =?utf-8?B?TjQyanVCTWFNY29LSkdsUGRmMU5DQjJYYnJSR3dGeHlsQ3VuUytRdUZLMzUw?=
 =?utf-8?B?d2RtRy9DZ3JvZ0lKTjdGbmR3ejhjd3BvcFZYYUpMSjI1RVJMczlwMlJNRkw1?=
 =?utf-8?B?aldERFRqVnptMUtXZmgvN3IyVnF2aEdlU0JjbEVnelZZb2ZoWWIzR3VLaDJF?=
 =?utf-8?B?M2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c6b6f353-6624-4f15-ce39-08dc134f3294
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2024 09:16:45.3029 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lk1O0WIdoUN/9XXDc8QDMqs1XHqtY/OR6kemJvpI4LQHMwadJwdJS87rWxm5echfHn+VMJXVhOAMphugy5UcPLzvcirARZ/oP1F8QEjfwDk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4732
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on czw [2024-sty-11 19:56:03 +0100]:
> If Doorbell Manager is in unclean state during fini phase, for
> debug purposes we try to print it's state, but we missed the fact
> that we are already holding a lock so the xe_guc_db_mgr_print()
> will deadlock since it also attempts to grab the same lock.
> 
> Fixes: 990fe6e6ed3c ("drm/xe: Introduce GuC Doorbells Manager")
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_db_mgr.c | 27 ++++++++++++++++-----------
>  1 file changed, 16 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_db_mgr.c b/drivers/gpu/drm/xe/xe_guc_db_mgr.c
> index c1c04575d82d..8d9a0287df6b 100644
> --- a/drivers/gpu/drm/xe/xe_guc_db_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_guc_db_mgr.c
> @@ -46,6 +46,8 @@ static struct xe_device *dbm_to_xe(struct xe_guc_db_mgr *dbm)
>  #define dbm_assert(_dbm, _cond)		xe_gt_assert(dbm_to_gt(_dbm), _cond)
>  #define dbm_mutex(_dbm)			(&dbm_to_guc(_dbm)->submission_state.lock)
>  
> +static void dbm_print_locked(struct xe_guc_db_mgr *dbm, struct drm_printer *p, int indent);
> +
>  static void __fini_dbm(struct drm_device *drm, void *arg)
>  {
>  	struct xe_guc_db_mgr *dbm = arg;
> @@ -59,7 +61,7 @@ static void __fini_dbm(struct drm_device *drm, void *arg)
>  
>  		xe_gt_err(dbm_to_gt(dbm), "GuC doorbells manager unclean (%u/%u)\n",
>  			  weight, dbm->count);
> -		xe_guc_db_mgr_print(dbm, &p, 1);
> +		dbm_print_locked(dbm, &p, 1);
>  	}
>  
>  	bitmap_free(dbm->bitmap);
> @@ -219,14 +221,7 @@ void xe_guc_db_mgr_release_range(struct xe_guc_db_mgr *dbm,
>  	mutex_unlock(dbm_mutex(dbm));
>  }
>  
> -/**
> - * xe_guc_db_mgr_print() - Print status of GuC Doorbells Manager.
> - * @dbm: the &xe_guc_db_mgr to print
> - * @p: the &drm_printer to print to
> - * @indent: tab indentation level
> - */
> -void xe_guc_db_mgr_print(struct xe_guc_db_mgr *dbm,
> -			 struct drm_printer *p, int indent)
> +static void dbm_print_locked(struct xe_guc_db_mgr *dbm, struct drm_printer *p, int indent)
>  {
>  	unsigned int rs, re;
>  	unsigned int total;
> @@ -235,8 +230,6 @@ void xe_guc_db_mgr_print(struct xe_guc_db_mgr *dbm,
>  	if (!dbm->bitmap)
>  		return;
>  
> -	mutex_lock(dbm_mutex(dbm));
> -
>  	total = 0;
>  	for_each_clear_bitrange(rs, re, dbm->bitmap, dbm->count) {
>  		drm_printf_indent(p, indent, "available range: %u..%u (%u)\n",
> @@ -252,7 +245,19 @@ void xe_guc_db_mgr_print(struct xe_guc_db_mgr *dbm,
>  		total += re - rs;
>  	}
>  	drm_printf_indent(p, indent, "reserved total: %u\n", total);
> +}
>  
> +/**
> + * xe_guc_db_mgr_print() - Print status of GuC Doorbells Manager.
> + * @dbm: the &xe_guc_db_mgr to print
> + * @p: the &drm_printer to print to
> + * @indent: tab indentation level
> + */
> +void xe_guc_db_mgr_print(struct xe_guc_db_mgr *dbm,
> +			 struct drm_printer *p, int indent)
> +{
> +	mutex_lock(dbm_mutex(dbm));
> +	dbm_print_locked(dbm, p, indent);
>  	mutex_unlock(dbm_mutex(dbm));
>  }
>  
> 
> base-commit: 39d854dbde14bef5cabe3cf3a49de8894cd99ba7
> -- 
> 2.25.1
> 

-- 
