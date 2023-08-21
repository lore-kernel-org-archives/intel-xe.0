Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BC81EE4996
	for <intel-xe@archiver.kernel.org>; Mon, 21 Aug 2023 14:42:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2698610E27B;
	Mon, 21 Aug 2023 14:42:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6A5810E27B
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Aug 2023 14:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692628961; x=1724164961;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ijaRpbM+rbjeoNR0KfnrWem+R2628q1pycp8pNycKSk=;
 b=byl3gaRsvp1KiIb95tGFo+RHWuGvd69mnC3WprI0d39K7sj+8FexS/Oo
 O6Kn854ONVOjYEuBgEQ/Raq5IEU6rUSKC4VxBrGQDWZHdT2qdFDJIPx7u
 v+i5a5fq5lRM8Ly2vZSQGUbwPcfpF5FL0WwMGRr9bfLfk8mnXPjbeGPqn
 o5dz39OlRDBsOYb7eSwu5aXlcUMij9BSBjivtkjp3APGWokf9eFi+/oxy
 JXOkS4DMNjGQwR2LnEk62WA41PmTdhdZRmh0+qXc/0noNbifkfRVnfvSW
 mr5QfWguJTJCB528PQo8ouchVKDTwFlwyerfDzFiZ6EXDoHBio0xHAfAR A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="371037447"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; d="scan'208";a="371037447"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2023 07:42:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="850210735"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; d="scan'208";a="850210735"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga002.fm.intel.com with ESMTP; 21 Aug 2023 07:42:36 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 21 Aug 2023 07:42:35 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 21 Aug 2023 07:42:35 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 21 Aug 2023 07:42:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lNVk0P525XYPUSeBM5ZfcAwS4nUZeZfQy0mzVww/4Veyqii2hMel1Q4R+7+fN0o7KmtHrxGT60Cjl3HRgMdV5fOjELf0+BNJSGGhZsUsir9wOCrP5UirlcYqsotS307BX95dgcNLTi/+lq5ReJeKHEUOLQDMYHT8vpt+jzAhoRdFdK23j5eFbwoxVXm5Hg0jAC/ztBBM3KBmFJvb3usrJcq6u1fIOz3T56mOGbRxMOQqfuYaYNmEva4ydSL3f/dB7uCgMtHxuI6gEoEzEp4nbMq7GwP5wUUxWGiigpZF25LgUv2EFevOGR6xyIV+p+2tEcT+4Fn7XmzHSa55nhazJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J3jjtVeTQwlKvJ0g6AkBXvvp0ArgMrCQL8943ropvd0=;
 b=W7TH2ex0xSzaHilI0mtLlTBtpnLxK45r8bB0VnSjCoa0/wmuhWbmgSBmJOFxkL4/pTlT+GWRzMAp2OWUaAf2whVd8nZBiGLnBQd4dIw4qQtVIug5jmttSB7U0a0biUOScwNkAiuu69P1mEVCRzRnPvOuM4D1U24gouxLX7Ik8zgKkyoshSbXRHDmeULBZH6Lw4Kcq0NYgK4CrqgfUKeQS3e/T0qRguzXBMIrWpykL5dBHQd8hvgBgyU4vk63V8BGRPZZqScsAgIzlTLyAXdrr4VBR2hsvYcij3FdAI5bM6kUVJWOxiP/kxUaeUuP8oQIIhVDiXYPQQ1I5qBtS845Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by SJ0PR11MB5070.namprd11.prod.outlook.com (2603:10b6:a03:2d5::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Mon, 21 Aug
 2023 14:42:33 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::864b:5f88:8b9d:517f]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::864b:5f88:8b9d:517f%4]) with mapi id 15.20.6699.022; Mon, 21 Aug 2023
 14:42:33 +0000
Date: Mon, 21 Aug 2023 20:12:23 +0530
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
Message-ID: <ZON3z2KDdOVGyz96@bvivekan-mobl>
References: <20230811160618.477297-1-lucas.demarchi@intel.com>
 <20230811160618.477297-7-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20230811160618.477297-7-lucas.demarchi@intel.com>
X-ClientProxiedBy: PN3PR01CA0079.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9a::19) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|SJ0PR11MB5070:EE_
X-MS-Office365-Filtering-Correlation-Id: 28a328d9-f355-4032-768b-08dba254da93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ICGif8Henl4IwNbeik/+m5M9mWe0Za+EKQa3ZlpRUFvoTqz2CtTWY8Ew9w68grcxXH4tqbEg1CmrjU09OXaIfgigIJA1lprgZeoVmS+reknN/b7JQCZhrBnJAmZ4BuPlD88BziWh8VC9Qyl1hO/v0Lu2objfttagU6hzv+X4m1xXZtPSFaVuEUxIhYeY8hU3lP33a/oSfF7G2MLpc/o6opxcoEToPQpabASP5wtFpUvnWwZWisNyyVkcdK0A7zwoVQd8rkQvNkLV5N4fihFT2dHWHj3Sj6wtO5V1ddtNZkFe6XzwCBqVymcuh+9HPTGE4ohmph56z+YvILJu2DcrC305MGl68znXjFaqpknfm+iSEvOx5nuc2KJn3bnAHFWVIPh9fpxIWpq+bMrA6qvA8ZE7sShT+RhDzH8uzaGTciwkEwzEmKLwacFVzdCL7vpvVQiAXH6IwleiORGBzOsCC625Q3LhLc8gv7iIsHkLEmHU8GDqLMmr73rPXMBtAG5ISUIdWwI16qlfITVxDPneLe5sf7TysyUd+VADP6J81z5AmcPLRLIK/TVyAToycZC+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6974.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(346002)(366004)(39860400002)(376002)(136003)(396003)(451199024)(186009)(1800799009)(2906002)(53546011)(38100700002)(6506007)(6486002)(83380400001)(5660300002)(44832011)(26005)(86362001)(8676002)(8936002)(107886003)(4326008)(316002)(9686003)(66946007)(6512007)(66556008)(66476007)(82960400001)(478600001)(6666004)(41300700001)(33716001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y0YwYTM2ZzBybkJINnp3M2s1a1dGMHFPbldtT0NtYXB4WXp5c1pTcHJuOEhw?=
 =?utf-8?B?eDRCZnU1YTB6ZUhWREFTVkRuOUFoSndaeUs4cWJlU0F6NUJqeWIyMFZlRWwz?=
 =?utf-8?B?NXdkVjhKLzNqN3YzQ0p0YzZlMU9HRjI3VU10Y1I4SVdHdEtuN1ZmSXYzYXpD?=
 =?utf-8?B?U1dBM2Z2cjVTZ0psL2xZeDdCVWRmWmU0RW1tZSs0YURQd0hnenFHSkNCekpJ?=
 =?utf-8?B?M08zdzd1c3V5SkJVNzZzOStCVzhLWTNtVXAzT1dHTFpMUXErQzc1OWdHTjls?=
 =?utf-8?B?L3BtRVkvZFFTWU5yYmxRa29IdGhVTE03aEQ2QkRXVmZDOFhQRVpSL3Q0b3Z6?=
 =?utf-8?B?TWtoMkl5U25vTDIySWRjUVhtWEE5eVQvbWJsNXZwM2J6TzlHcDY3MEdSd3BD?=
 =?utf-8?B?UVhxZVUyWVQrYzhrWDdLdUxXdWtwRUp2MDZLNWhXMWJkdFFGemtOc2xDZ3BP?=
 =?utf-8?B?S09BSUVhek1EWS8rUmJuMVJCcStwZkUwK2dzUHhvMkdPb1VyaVZoN2p2cWkv?=
 =?utf-8?B?ZFJJQzRneTR4RThGM3owUDhhVGMva2g1MkZrbkJTalRlUVpqNW0wYmw2R1Fi?=
 =?utf-8?B?Z0hpdDRnVXYyeFRlRjJDU3haRGZyVkgyZjdhTGgzWXViYlBSZjlXY0RIaGEx?=
 =?utf-8?B?RVZqMUFsM0lud2dHOWRDdzdLZW9NenF0SWJFZmlvcFZsSUR3aC9yNHF0aTVN?=
 =?utf-8?B?aDNlNC9wWHRWT0k1RXB1SHpaVFB0eC8zZFJNa2RKRnJlQ1FyNWxYcjVOa3k3?=
 =?utf-8?B?OXhSWUNEd0tVQm9YWjUyZC8vdU5nbzd5cmhPNnprYlFkV2M2Rk1TbzIwQUQ1?=
 =?utf-8?B?QkwyazhqdGFZUjFsOE9Xdko3aU55dVE3ekhyK1FXbVFGc0IwajIzdzREVnpL?=
 =?utf-8?B?bkhsRDhMRWNRSDFFYW1IOG0zblNDYXhVRklsSGNJVURSK1JuQmk0NExZZUEz?=
 =?utf-8?B?ZXBUL1FaWWdqVmFhYUppMVZWKzdBU2ZaYzV4TTB6T0hnM2hzMDZtT3p4Wi9I?=
 =?utf-8?B?WHJLYzRFREJ0U25VMTVMdC9ldFNKYW5vMWU0K1dXQ1ovQzhYQy93QWZaclhK?=
 =?utf-8?B?S1huZU9DdjkxWnJ5UXpmRG5Eb0h1YUJ0TkV2T0ZPcm9aRmRURkR6WE91QmJn?=
 =?utf-8?B?RGcwSnd6TUd0dndSRmdhUVIrUmE2cDhNZUNaQzFCT2pJNG9IZ3ROaHZMeEJV?=
 =?utf-8?B?MjJTMDBodmR0VEF3OERGdGpvTTV6R2x6bDdzV1dlViswODlZSHNMUnEvbDZ3?=
 =?utf-8?B?SlZCNmlSVmI5MEpxQkxpdG1IWmYyb0FVOW5KN2ljalJSVjBXeDMvZ2pFUjFT?=
 =?utf-8?B?UVJBcHBpTEpUQzdCbGMyNnEyMlJ2M3RWRDZTbGRCM0ZHVXoxM0FsSmxyOXR5?=
 =?utf-8?B?YkJTWUxOYmJtMWo5SXlNN3Y4ZC8zQVNRYmJUMEpKbXdiSDVnZ0RMak5DMXFH?=
 =?utf-8?B?blVRNmdEdGdQMTEveGIya1FCbzM2WGhvSkRuZGpRZ0szZ0hhRC9PY0JmWWo0?=
 =?utf-8?B?ci9Ed1pYMmpNNUUzSWJ2UndrNmFCaEhTcDBSVy9HV0Q5REE3SElDRjlkTVFr?=
 =?utf-8?B?SE1xbVNkQ2thMk5DVDRIL2JqSWZieGhaekRBRkRiNG9mSzNuRmdzL2xIejhL?=
 =?utf-8?B?ZkdRUWhDbzYra2dyQUNXUGovZ0xPaUFSaTJYTWlZOEVYVU5ZdTdsVmdubldH?=
 =?utf-8?B?ZlhqRmxrdXZZS203c2lNVEVGRnpLd0NKSG5lWGVWM295NlE5REpXQm9ZeitG?=
 =?utf-8?B?RFpDejJERFFqbFVUQU95OWN5c1hHK3hjRVVLaUpnRkZlYnRMcUhGcEFoRWhF?=
 =?utf-8?B?ZUlwcjVxMmVCSTdlOHVwQTd3a05pMWh5bzVOREdZemR2emFzdnlDNVZDV3pE?=
 =?utf-8?B?bHpKbVozY083RWVNY2JGQTBEaDk4a0ZESzU4VGl2TVNaZWoxWXhpZEJ5cUtR?=
 =?utf-8?B?bnRlcjZwQ3ZYbTcxcHFuK3V6aXFoeWVPdWI5Zm1TZVdKUXdLTy9BaktxZXBU?=
 =?utf-8?B?VkU3Uyt5R09RQXJhcWk4WEVmNlZxZ3ovNFIyTFlpdzg3V1lDMWFKdkl2SDR1?=
 =?utf-8?B?amZ0OFJWY2VZMzQxc0MzckYvM0JmMTZJd1N4SXMzMTgvdDVicEVMK1FTNFlV?=
 =?utf-8?B?SmxCY2IweFZoNVowclFTV1NkclRUYlVXRy9XRWVydEd5WUxNQWVPN2R5dmw2?=
 =?utf-8?Q?D0gGRMTdwSDv56M32W8bkOw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 28a328d9-f355-4032-768b-08dba254da93
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2023 14:42:33.2550 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: il0uguWLyVT5z+J+i223HQL8j+hbPB9HJBkX8Dj9B9v6ypvHKFZBGFXSUNdsWBoBAb/munB3LpHJpkcY+kyq1lGx+Jpc1cagx71hFnEPRfZJlajoUnK8L3BWVP6u0pCg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5070
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 06/15] drm/xe/xe2: Handle fused-off CCS
 engines
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
Cc: Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On 11.08.2023 09:06, Lucas De Marchi wrote:
> From: Matt Roper <matthew.d.roper@intel.com>
> 
> On Xe2 platforms, availability of the CCS engines is reflected in the
> FUSE4 register.
> 
> Bspec: 62483
> Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h |  1 +
>  drivers/gpu/drm/xe/xe_hw_engine.c    | 29 +++++++++++++++++++++++++++-
>  2 files changed, 29 insertions(+), 1 deletion(-)

Reviewed-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

Regards,
Bala

> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 5bc6c7fa4759f..b8dde495b8a32 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -154,6 +154,7 @@
>  
>  /* Fuse readout registers for GT */
>  #define XEHP_FUSE4				XE_REG(0x9114)
> +#define   CCS_EN_MASK				REG_GENMASK(19, 16)
>  #define   GT_L3_EXC_MASK			REG_GENMASK(6, 4)
>  
>  #define GT_VEBOX_VDBOX_DISABLE			XE_REG(0x9140)
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index b8fcc6e985cfc..d2c358e711cb6 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -529,7 +529,7 @@ static void read_copy_fuses(struct xe_gt *gt)
>  	}
>  }
>  
> -static void read_compute_fuses(struct xe_gt *gt)
> +static void read_compute_fuses_from_dss(struct xe_gt *gt)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
>  
> @@ -556,6 +556,33 @@ static void read_compute_fuses(struct xe_gt *gt)
>  	}
>  }
>  
> +static void read_compute_fuses_from_reg(struct xe_gt *gt)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +	u32 ccs_mask;
> +
> +	ccs_mask = xe_mmio_read32(gt, XEHP_FUSE4);
> +	ccs_mask = REG_FIELD_GET(CCS_EN_MASK, ccs_mask);
> +
> +	for (int i = XE_HW_ENGINE_CCS0, j = 0; i <= XE_HW_ENGINE_CCS3; ++i, ++j) {
> +		if (!(gt->info.engine_mask & BIT(i)))
> +			continue;
> +
> +		if ((ccs_mask & BIT(j)) == 0) {
> +			gt->info.engine_mask &= ~BIT(i);
> +			drm_info(&xe->drm, "ccs%u fused off\n", j);
> +		}
> +	}
> +}
> +
> +static void read_compute_fuses(struct xe_gt *gt)
> +{
> +	if (GRAPHICS_VER(gt_to_xe(gt)) >= 20)
> +		read_compute_fuses_from_reg(gt);
> +	else
> +		read_compute_fuses_from_dss(gt);
> +}
> +
>  int xe_hw_engines_init_early(struct xe_gt *gt)
>  {
>  	int i;
> -- 
> 2.40.1
> 
