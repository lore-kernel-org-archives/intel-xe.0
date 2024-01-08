Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C90CC3DA6E
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jan 2024 18:14:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C54A10E0CC;
	Mon,  8 Jan 2024 18:14:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7CED10E0CC
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jan 2024 18:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704737688; x=1736273688;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=CsqX5vCMNKT6ffve9ApftBmiIxTj6O2YVJO+Q8M9/mo=;
 b=Dbs78d1LNMVn94JJoiP1k3H55DMrLffvTaV8xY5xMZK/uzJd7FcAhUwf
 MZbtEuLLnR86i3iKP0DOs3WPkW+36iR8IAZXtSnBhrHci/UrU4/7VYzk9
 7f7N2KcOhYDOKPd9mLsj4WOeAJSAPB4eTHHUtvtbo64hkcQ63dp0DHdwH
 WCb19AeqK/J0F8c2S9nv2eoV+2jfBd9rVLmBYG1YT9jWDMoXcwnULEDPB
 KlmnETmsyKvOaromgtIa1fxeRAYXkWRCQuRB5ETJC1TmK7PrhcRVRSVe+
 eRv5MdVqdkZWch0MdqmKDz+lWsPMDmNk9rVcqjQCRE28eVvwjqRVXPvV2 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="16561338"
X-IronPort-AV: E=Sophos;i="6.04,180,1695711600"; d="scan'208";a="16561338"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2024 10:14:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="871958093"
X-IronPort-AV: E=Sophos;i="6.04,180,1695711600"; d="scan'208";a="871958093"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Jan 2024 10:14:47 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 8 Jan 2024 10:14:46 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 8 Jan 2024 10:14:46 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 8 Jan 2024 10:14:46 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 8 Jan 2024 10:14:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b11DQml+8zHUjvVECVn/EaU9YsVAdohglYhgv5OgMaxyEQXOxbBaLladTnLtPnkNBLPwwzIMhRneLNENeJjwes4z5ijW3NUNMZ10kRHWqN6lkfMgwt4hh0z5LrSxy1GCQZV0fWkWSt/EN+aeT8MQ+PYEIFf7wSi6fkIQvyRwcuagZPfmx1U2mIGimx/3iDr3mDsYpaF58GGs6f1f//kK8UzP8uSg7UVql3TJjNokIWDllhLBi7KFq3a6qAyWVxNdsoiIQ4AOMWqJOZFo39tygYunZVyWWpkcsHaOxeoR12bax99Tsl17HD6LkfoAhKzSgL4GqV2Yvd9Sxr/ZKrAo+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KnAvyX3s5NiRuZWAJnHB7lyCoZ5UgygypzLIZmxCipw=;
 b=YRjX1nRdc3z0Tjp5+apPoPe2xk8uQR3CuoTWet1SSc+geDyOeLAVtoRlWA2+4X2c0BjM2osS6dO55IXIy9xSXPbzTBof3vmJawjHXeqUcbfVRwpOn2+yXbQqdFuyRYqrHgf9E7fXHBSugExjv6Vh0XkfcBenfGQeo1zfbNP7RxYy473tPSrh+E5nuFjfYB0SJRMdtOwlesrE/eZU/d+/YNg71gBJ28VVSE5h3RQV2SQCvotu2pHU+YUG903eIRc2QtbtjqNPbz0RRKa570Xqfnl1/PeZk8lgmT/ZzFaSCL2MrH3gyntoiSckOofViiSWrGXohy10gg9/oShR2p07gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA2PR11MB4937.namprd11.prod.outlook.com (2603:10b6:806:118::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.21; Mon, 8 Jan
 2024 18:14:44 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b%4]) with mapi id 15.20.7159.020; Mon, 8 Jan 2024
 18:14:43 +0000
Date: Mon, 8 Jan 2024 12:14:38 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: Re: [PATCH v2] drm/xe: Check skip_guc_pc before setting SLPC flag
Message-ID: <2ypah5a7qa5erqw2ha7mj2zs3mblomtnpu2yahu2bbyojblsm3@qvpuxz6cgo5d>
References: <20240105003341.124422-1-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240105003341.124422-1-vinay.belgaumkar@intel.com>
X-ClientProxiedBy: BYAPR08CA0037.namprd08.prod.outlook.com
 (2603:10b6:a03:117::14) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA2PR11MB4937:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a37f152-6ced-4605-c3d7-08dc1075b070
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uG4nVhI4xjfBWILydUJWx4UXH4774Q+9TMOZ0Dd9mxPtfO9nn4vFtjXspjBWTLJWVOkDxe2osw4mQbx32tpT/oOAYxkabR1asB5hkf3T9hL3IdVW97nePASwnII1rZ3VRRu5YLDNjK2sndN90EPw+eY+iN4hluVJNcaRVbDV/9yfEJdxkNwJdo+anP1FSul6r1DJIBRbkL7AEMF3fK+Ok0pEkvL7gY4ZF0uMslBbdHcMjgGMsY7flR5sD09K3wK3SSNLDC+xrSXzDaFlm40qJ/MDj6cEbgF+Nos5cG57hXqgWpqb+7nl6stPOLWYUWsBlsgtfaUVgaTfGlfFQEj7u/zoZkMEgpNB07Rv/eoLcGPugFa0GTGTtui++HMV7d9vbA3AZko9LFB0CGdCOWavuKS5gwWGOVQ4l0kjskj3Ig0p68wzDqMYByLADsnXBJglPEzF4DAK6TQZGe8WOj+mRrwRtMhz2e4OjO2Z/Atd/XnO8GQIZ3IimM1AUGHL2nWIgHuqXJ8kQIOgDGMFdRYiFCSbn+KHzN/jShb/kO/yK1qExDSXyJ8BD7oHP5si3F+2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(346002)(366004)(396003)(376002)(39860400002)(136003)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(66946007)(66556008)(66476007)(316002)(6862004)(8936002)(8676002)(26005)(478600001)(83380400001)(6636002)(2906002)(5660300002)(41300700001)(38100700002)(82960400001)(4326008)(33716001)(86362001)(6666004)(6506007)(6512007)(9686003)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ud1MrzVlIT0h35Qd/2WVM17VtAK8c9++wALRRLyINhs2Yj3pvgPsnqHVIYee?=
 =?us-ascii?Q?c4uErEz7Yi3FNHCTTX9yIiW5nca8OECWla/bXVCPed7mpmmfh99Q5WzFmukE?=
 =?us-ascii?Q?y78a55fn3yv7k27jxNKQRVFpIbn5GrkHx2MVHv6EbeWMM9W2wI0o6gl4ir85?=
 =?us-ascii?Q?e1tHpey2fo7CWl0/PISR4WL6tZVsi3pYJoud6ZLf8K2z//Hu7Eaq+eXZfXxq?=
 =?us-ascii?Q?TIV4DEXGqSlIt1R874T8pZCrLuz5xT/KteyeCx3B4/AheP8io6N8Lh71+ExX?=
 =?us-ascii?Q?QHI6HoTk2oVuSzqoDcYW9v/O0P2dhS2GU9s78+xsN4EbwHg06d5hG7uEm7yQ?=
 =?us-ascii?Q?L/2UzATRCN4wKYhb3hdHvVAF2/roYQXav7OJx9wvlGRDhtqu65PodAw65WXU?=
 =?us-ascii?Q?CDVNHt/qjovWuSyeQceH7RLa+AZ/gal1d++R5tbE+8WxAPy3fMiKid9abgqb?=
 =?us-ascii?Q?JFYBzjx6gCbNt6/hx3kZv2j20KLIWrba5WmsLgZmFOIpeW6phYy6NlWOOI9t?=
 =?us-ascii?Q?ZwoB3RMvN+8TkXjKqu7iEd5SCAD2NmVSM5X62TwBawJTl6vbNmdruIEMVjeh?=
 =?us-ascii?Q?z/BeLH4oUNRDHNfoEOCEQDNxUim98LLriK1cv/RaDQ/Ef3O0WhRWY7SlgJUJ?=
 =?us-ascii?Q?QNMBAT0NKNCZzmukzndRiGjKNjOKXJQq6dBTMg7WyuKB+YwuAGb4s/K/tU5K?=
 =?us-ascii?Q?rqOpn7pR9PqQhxpCwVU481+wogGOJoa2RpzKUmXGxKi88C0a2e8ttuHtqbX2?=
 =?us-ascii?Q?TMbfZQbIXW5tAFgTGZKNEXawfWfaJSrCJsiAZaSDF3lp4rSk2R1up3gdW68w?=
 =?us-ascii?Q?CoLJDE8Z9/R6bNK+q+eImh83D9OZOhmwdCFISc+1ZL5Ugj9aKuANrqrDU1nM?=
 =?us-ascii?Q?KKAL+qYYeS01FTwe53Lw+i1x+TM4uS2sLj2xWvjtqRaibjIKEBaBHVU0CPA4?=
 =?us-ascii?Q?IH6iLPzHA1rZYFhRnDsuiGzVh7o3q9MffcktKBQ2grCgQ6R1fbdCaxKEVY+5?=
 =?us-ascii?Q?nAzJGRNED8ZFReRykBZMoVUIWbgstbltcodj41+UGbAeyrwLLCOUDPEno8rP?=
 =?us-ascii?Q?LjYtQqgxY0+tHToAT3QV0BZ15pqiwIxfyCM9m4YMAbVHbQ6QAiBIUghFdHmF?=
 =?us-ascii?Q?PcXOE/UTspNwN7QC99A0EpCCYTMU8CvY78LV33lPcHYTBvoRFn9vreNOLnSn?=
 =?us-ascii?Q?h1mYT3n9GWs/4s0D/3RhpH6+XjbgHObZsvm18/YvXDsVj0QyMY6A5ZrudWAi?=
 =?us-ascii?Q?s6q0doA6Kv7Fl4CSy08/d4hcdACXhN1Hgw1S5GRPuMyKYxZ7ZrepC8/OPKEo?=
 =?us-ascii?Q?82IZ/aEfOIoCk+4g3wqDa+FfhTONJgZYdm5XhnhVijaG0wxPK7k8AZ6LkXat?=
 =?us-ascii?Q?V8DBd5c6jR0irzBMrBNOWajrsMzJ8pZLx4naea1yuayVAsV3tpuXyLEp56HG?=
 =?us-ascii?Q?4YESHDr1z9AFvZaHoSZlkwRfom8ngOZdqUGHnQCxT1yJ/poQQrzGxeSnP6CF?=
 =?us-ascii?Q?4H8Pt+3Jai3Z2qL242HpqfZCzL+VwJd0KBpIOGg3z1Zr8VKKoPphdRwJlplv?=
 =?us-ascii?Q?1Na/3S/+IrdigeIYynIJ5thSHqHBmRqxh9AA3jIiwe9ROFrhjuMgOpVsVk5M?=
 =?us-ascii?Q?FA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a37f152-6ced-4605-c3d7-08dc1075b070
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2024 18:14:43.9156 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pbi/dsOh1n8fWWv64ZFJUCpKvgjyntlxOAYd2eBFTQ5mfv3PR7u8S+Eb2gdUhr8VdGV268/W13cW9u4xngmG52zHD0NQ+l2YwCLCTVxsecg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4937
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

On Thu, Jan 04, 2024 at 04:33:41PM -0800, Vinay Belgaumkar wrote:
>Don't set SLPC GuC feature ctl flag if skip_guc_pc is true.
>
>v2: Skip the freq related sysfs creation as well (Badal)
>
>Fixes: 975e4a3795d4 ("drm/xe: Manually setup C6 when skip_guc_pc is set")
>Fixes: bef52b5c7a19 ("drm/xe: Create a xe_gt_freq component for raw management and sysfs")
>Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
>Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>---
> drivers/gpu/drm/xe/xe_gt_freq.c | 3 +++
> drivers/gpu/drm/xe/xe_guc.c     | 7 ++++++-
> 2 files changed, 9 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_gt_freq.c b/drivers/gpu/drm/xe/xe_gt_freq.c
>index 3adfa6686e7c..e5b0f4ecdbe8 100644
>--- a/drivers/gpu/drm/xe/xe_gt_freq.c
>+++ b/drivers/gpu/drm/xe/xe_gt_freq.c
>@@ -196,6 +196,9 @@ void xe_gt_freq_init(struct xe_gt *gt)
> 	struct xe_device *xe = gt_to_xe(gt);
> 	int err;
>
>+	if (xe->info.skip_guc_pc)
>+		return;
>+
> 	gt->freq = kobject_create_and_add("freq0", gt->sysfs);
> 	if (!gt->freq) {
> 		drm_warn(&xe->drm, "failed to add freq0 directory to %s\n",
>diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>index 811e8b201270..0e112b144ec8 100644
>--- a/drivers/gpu/drm/xe/xe_guc.c
>+++ b/drivers/gpu/drm/xe/xe_guc.c
>@@ -62,7 +62,12 @@ static u32 guc_ctl_debug_flags(struct xe_guc *guc)
>
> static u32 guc_ctl_feature_flags(struct xe_guc *guc)
> {
>-	return GUC_CTL_ENABLE_SLPC;
>+	u32 flags = 0;
>+
>+	if (!(guc_to_xe(guc))->info.skip_guc_pc)

I was about to apply this, but then noticed this weird parenthesis.
Did you intend to do !(guc_to_xe(guc)->info.skip_guc_pc) to clarify the
operator precedence? Anyway, the parenthesis is not really needed and
also not used anywhere else in the code base
(git grep -e '_to_xe.*->info')... it's actually confusing.

Lucas De Marchi

>+		flags |= GUC_CTL_ENABLE_SLPC;
>+
>+	return flags;
> }
>
> static u32 guc_ctl_log_params_flags(struct xe_guc *guc)
>-- 
>2.38.1
>
