Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85806C67861
	for <intel-xe@archiver.kernel.org>; Mon,  8 Apr 2024 18:33:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19A5D10F94A;
	Mon,  8 Apr 2024 18:33:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AjO1cc/I";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1047110F94A
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Apr 2024 18:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712601182; x=1744137182;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=KC/scv+T5X7MWPorqukGt9h/3a8U3+W8mthZYTu3De0=;
 b=AjO1cc/IrRq8iC7RjOgNJVhrEkI8/FMfeH7/FtfkXT2N6toRl7tDYRRM
 OktYiuywJi7x9fJuevlFjZIVXldI8iRI3X7f2ZW5+TxA6FQ4fjceCaCZN
 6oD/osxsHdS0LHS8FG4ki/gRpBqv+plDeTip8T+hpKaB/nBLbWtwUx5uq
 6g51KGOVyynJzvrhcFgG/3ywRMdL0XIDTEGNBX1mIa+mAscJhMNXF1jWC
 MaIyIKSzBVLrTAI3zvirwWPCLmJhAjQdcaZZfcAZ4p3GJChLVpkpoqyWD
 9fBESxvy/iRaXFH3l37Ht0sgrAqmX9DEWuQvFyIv8Zmy+sR5F/VlFOuAs Q==;
X-CSE-ConnectionGUID: v/J8wldwQn2rpvrI9n/icQ==
X-CSE-MsgGUID: ogfdkNUTRiSklzOayQju3w==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="8058321"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; 
   d="scan'208";a="8058321"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 11:33:01 -0700
X-CSE-ConnectionGUID: dCyF/WyZT7mGcELVGcaSJg==
X-CSE-MsgGUID: 8xBDcmKQSgGvpgX39icnXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; d="scan'208";a="20404797"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Apr 2024 11:33:01 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 8 Apr 2024 11:33:00 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 8 Apr 2024 11:33:00 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 8 Apr 2024 11:33:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WCIMIyzoharh2m3zItSRHbkbxIkAbx5/KvBoiV26FUzDPQ7pjEvTiPiBXllCRXpalnJYxYZqLlsu9zTpH8l5H7ylFYsbp+Q3v9OVL4FcMWMqiJJDkXBF6QER5tHz8Gp6N9lMtqGnwc7oCNvF/8qZ0b+Zh+bUi5wTDoQuJvFCZX70FVAAPsficPMa/P82eczFEY+C0K3oswwgjo7sKVOgWFMNa5htOGiMnOUfFLjK8CSJwfT24J5GZ6qhOaVBy7FE4X/KwWTizLTTve3lSqQTtBrEaYWq3jxIPxsfHesZLynNRpCeSqwf4b7VAhziAY1QNl/kR9fJ8ibnMujmu7RK0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IbPOKKBqmUv9XGYjxdhdTVb9XSCIeNBcg4ojHeAN/MI=;
 b=cRhviwencJ4Uqxp/wBHbcSNQiS6iYKgSfEpT0K9lVeP97qOQng4wjcHrXlKgUBAViiIfMfGPWr902ndGGFKElyRcYnpFCpJ6Lw5/lsDrc2lNw8pa7i97cDFM8+rnaXm1u/7U1087O9i9wgFov6WOU+lY3/VOh7VSNRAsCl0Nd4xJQcFeCKdelteT6zHlwH1wSI15I3325SJ0kBmWZqCDig1jKlSmCKNB4JesWzNVwtboS8jA1+RxNipzt6fqRLwD31+DYANX4+ZlQpIMegp4eA19fhamFWZc/YikCkr8g/pIRbDEMn5SQ83WL/DSiTUzo6s3NdA0Aztv52DsIAzEYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by BL3PR11MB6436.namprd11.prod.outlook.com (2603:10b6:208:3bc::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Mon, 8 Apr
 2024 18:32:58 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189%4]) with mapi id 15.20.7452.019; Mon, 8 Apr 2024
 18:32:58 +0000
Date: Mon, 8 Apr 2024 14:32:54 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/xe: Capture GuC CT snapshot when stopped
Message-ID: <ZhQ4VoTtz_PnQrCg@intel.com>
References: <20240405211632.223568-1-matthew.brost@intel.com>
 <20240405211632.223568-3-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240405211632.223568-3-matthew.brost@intel.com>
X-ClientProxiedBy: BY3PR05CA0017.namprd05.prod.outlook.com
 (2603:10b6:a03:254::22) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|BL3PR11MB6436:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FCVbj4OvpE6Xu2g9t64u5nrePIisGmZZJfrO1sBfLkVAWs3U4yOxxY751F+P8Jkz902ZvzPMiwbVTPjWMIw1Fh/p1FpfA7cV6HdWW7Rj5c+3zl+3EshF6m9mUGKjfRoam/QaQdvPnzpzxXUSZ0pS1in4UBbLW+od4AnwIbHVmAq5tkjf54KclX9qYR5HOf89cLy0DFkSlHmFdURdIvxzWOa6jSKwIp2REsUnA8uF4kyhifQl56RcUovKnQLBVCBLlQEN8NeWYh9SMCZTRICkWaZmSJMs1bhYoeTFEyu3OMG5PvNORfWEefckK8QEfaMjddTyNAX9zplWyALvODNZLa6YXtKi8c0zmW4l4D7aZQ+5G9Eehjd8vbldIXayPUM/a2lY/U09bf4KF+wfV1CVrmgKxh9oMX0tOkVEZm3gEnGn1LTTxYGT/+jH07MDXa2HNTHi6tBjvsc0HcICwLC9YDd+rQOh/iDm34uEtIw5oLVcGp9nqvGUTna559/xjNqiyWgE0rwPfwDi6Una1P0Pase48tnnx4JGcKmMWHIiSo0bMSqAPOs3Mrbw8BOBio49npS3USIEmwZwnzbFs81GCOS8mwWLR6uY7Z++XbFxFHgTkhLSu7PJpw1UqJTl7Jqlvle7o8JsjUqys66VdFI6txFoTDj8bl08vHEpTa/8rQ4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9rEzDKgG+2KyVnzwnEKeWYxYr5LpAyp7tm9PxEwTd8xoZZRbksxq3YJXMEjP?=
 =?us-ascii?Q?Bs9cS7DKnwL3JUO+N/AndxbvJHbzK6k5R+GFrq+yRoLIOYCNcI2U1JXkhUoL?=
 =?us-ascii?Q?IrJIGVSoHMhLH/ixxbHfPF3dyn7JZVb5nt1Gkl8WVTL6549lcrNrp170vtyA?=
 =?us-ascii?Q?DS118kDlI4jzvl4MysSHDIgriSTwd1xZcwfrQYirFRyCDmc3L8j05iZdgVon?=
 =?us-ascii?Q?ZKwj/D11GRZV1I5XmsOXENrxh/wONRFivwhKWk4eQ5WYFMpJX0TLO08geM0j?=
 =?us-ascii?Q?9dLFrI1aZ2SjZVcDXW2c1mBQPAtKDD/9kd7YJ6kfdyIAG1JIbCX8jAwRdZYR?=
 =?us-ascii?Q?gOoaiouxtBPebG4tRl9ym3v1Y8LEbTA5U/LhAPK0dPt6SpQ1HC/guya5FCF8?=
 =?us-ascii?Q?rWdhBDm+hjZHdAkxXug6IWNmCb8bN7J95+fG8mi46D8TAdP8207NwBkLUhGK?=
 =?us-ascii?Q?9SqskRW4UwSUh/sijP1bYkJVckiZInQ2FPka8Rr73l99rr1teD8Cabj1DEA4?=
 =?us-ascii?Q?Gwg3s82wreGvfedd0HKsctd0Xn1BqwsXSz2Jsb9IrCVlgnSpF00ZrEzbJXhm?=
 =?us-ascii?Q?xWcZKyLCQ3itgWMscVaWK9RWVOTAaItUmJZaDYuVpmlpyEDInwzk4+RNiCIb?=
 =?us-ascii?Q?TmUvvRpJmjVeluWPlkQX/MprvjUc9Xwk5nqGrXdZcvWwGqFN+cHo/broP4gd?=
 =?us-ascii?Q?aQb/O0TKjz0tGP69xmSqIzqKgVPKpeBwZceuo5HNs++FkvYix7Xt8errp3zH?=
 =?us-ascii?Q?xFm2k7aJ8C4jEZQV5TvziFNCliUT1xgfk1lakrYSi6Hjn2w0t9Fifjzvwti2?=
 =?us-ascii?Q?UmCEAQQGLhAw2NVFZ3mv0CRLziotoKFdd1Oj0ZxQgjDRKKcyQOEEkQBISd9f?=
 =?us-ascii?Q?WFBNdvsyvgEFt2XPURh0WZtnNcwgMyKfIhsAOiAl229QRldiqi1qJ1yidinN?=
 =?us-ascii?Q?FFeFO0b6YNNCRxkEE9w5hhLuRkKq4wwSTAsEIvBfD7H6GarWx+KhOMYFdfuX?=
 =?us-ascii?Q?/z8X2M+7frUujEi2O/RqGNJpJ2aRZLaqEZ0AHK2xbekF/TKgjdUM1071BAH7?=
 =?us-ascii?Q?AeyR+N+209kbJw7ush6R8liin3MGG41TCDkzQe/msrYtrX7fzCU2mijANKCw?=
 =?us-ascii?Q?kqYgbtdnaiir7WaNmxogDHuJ2hQRxEKAgnWaGpWLyIJn8m9Y/GD/hrwQD+kL?=
 =?us-ascii?Q?PhW56w5lcelQsta6cX49H7Tvzqx1JoDdeTYrVSlGSw1j6gR6+AJaXQfys4H9?=
 =?us-ascii?Q?L9zTiyHR0GS4VeORAT0c3re/gYvvRcL8fHecwfZS74zf9u5foZzfMkufhGSy?=
 =?us-ascii?Q?2wkew8ZLRX4uQX5Rllo9FETl9dTDlVNXC9NaDoAn6xwT96QbOqYE93Ew6YVF?=
 =?us-ascii?Q?KTFD78kw7t9W1ux2iNYMFVLQKzulaQdbClprIWrxnIJKcQ8ENpuM5w5GUTUU?=
 =?us-ascii?Q?R7ZXR1SLh037+O3ZOK0fnhLJrNxwHpxb6nkYJfNGpho0t2dTxIogYUwUKqxs?=
 =?us-ascii?Q?SX2MGuV5SriJ7qxusc6QRcrIsZJHx9J0D5UDdQTtYiK9nYyLqrqejGljBrIX?=
 =?us-ascii?Q?6thA8E7kixXuU7hkxjmRV4o69rPgrjZK8eGXFfscVM3rDClEdd0LUD8EQtzT?=
 =?us-ascii?Q?UA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d038277-9131-4620-3330-08dc57fa50a6
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2024 18:32:58.8339 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9o4zp6HZoY2rMrdZSpXGLtnwaPx9BnNQSrdf8X4qWzqK2h08+nO4JMepd9+Z7t720aoOoi4SefjQojAljbGClw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6436
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

On Fri, Apr 05, 2024 at 02:16:32PM -0700, Matthew Brost wrote:
> It is useful capture the GuC CT snapshot if the GuC CT has been
> forcefully put into the stopped state. Enable snapshot capture when in
> this state.
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc_ct.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 6c37f4f9bddd..0aa3abaca66d 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -1403,7 +1403,7 @@ struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_capture(struct xe_guc_ct *ct,
>  		return NULL;
>  	}
>  
> -	if (xe_guc_ct_enabled(ct)) {
> +	if (xe_guc_ct_enabled(ct) || ct->state == XE_GUC_CT_STATE_STOPPED) {
>  		snapshot->ct_enabled = true;
>  		snapshot->g2h_outstanding = READ_ONCE(ct->g2h_outstanding);
>  		guc_ctb_snapshot_capture(xe, &ct->ctbs.h2g,
> -- 
> 2.34.1
> 
