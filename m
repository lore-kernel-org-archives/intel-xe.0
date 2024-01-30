Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86241C46CD2
	for <intel-xe@archiver.kernel.org>; Tue, 30 Jan 2024 21:18:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 883D010E332;
	Tue, 30 Jan 2024 21:18:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D87A810E332
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Jan 2024 21:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706649516; x=1738185516;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=tz3tdQPZlFjKnh4fGll9WFUw7vlQfl+NYKxE9w/7qAg=;
 b=iFXXIV3SX4dnZNWsysYLv6MT8+ROpTvzbH3vkGcyT0yoc6dQZ+6MjgD8
 5375JKQmxOGapOZQXgOrIykJSwMdgaMrtlZSgmgan33b9avT+vdhQO0d0
 x96rPLBZhzRrX0Qlzs1EOt1nYWH5M8xaDjsYtlgqAIsyyX2SN4bbkUGn5
 uLnFxOX+4TZE2gCcDKEK5uXnwWukroIXx3fCkEdyVma3SD9+JPm/q+fbZ
 l6URwkLS0zO3iDW8QTy4cqEd7dJFBFvRqi/fcSGDrcVC0IRZO5fH+snSd
 eSwDGo9d3hR6CsySpD3VZhtwvhas6e+qtlmQShLXXOi2mGBZILAmOIxi4 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="10791486"
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; d="scan'208";a="10791486"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2024 13:18:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; 
   d="scan'208";a="3820377"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Jan 2024 13:18:35 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 30 Jan 2024 13:18:34 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 30 Jan 2024 13:18:34 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 30 Jan 2024 13:18:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LTZMd+dZRgIGHDfEcWcpRw/ITNP3PZWf9ymVpmHGrfoQeg+F8PXR8WM6ai+TtdayckqeB5LfYjGhCPDdsYIcTHnfFP4MNs30GKA90I6Pz66jGkfPQok6XFUyZ9D/tHDaOy2RFjgRY9rxV0KySM2gb0xYeWpanrzHLSnfvUQ/w4gOdfeKR50h6+9E5Isb5/Wl/CBWVBr13977LRZ0EFlIsYzKfmWPPRC/QoeDMqdkD5urKbQX9jUBwqb7Kjzbf3EeVA2+MVu6W80qxsr99NdMcgtafDpWMNnXjvnUhla8RKphMWQKA1GAUxZAcE7h7sV9FgSfPduiTnnXH958PuDZlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3KHunXzz3GVfSI5h4FXnmqxpEdpJka1abfuuzNE4axo=;
 b=AjsJ29V1GhIGKvLg5dXpMO3zKkzYF/x1SvLJP6NeGGQ97EaYzMAA8SGnfwaaTNMQMOX4JixnVys/NCP0dHxyEBhCx4t3l7DIYOaeHq8eINfXageXucHcs0Mepy9Nh/lTihgYSGE21qYyUUYzwg3Ssan770jcCS7FcWMSk3YkoIXTca9ATa9g2DF+EPGDO+Oc0YLdA4wIulFI+nTKEpu/0l2CruBPhHhxYM7pDs/lbCcedIOu/KFBrFsbyHVcnjbktyDxI5/ts4MiiKjEExzxFOiZiJt/W6ukQbCVkGRlcBSFW5/9Fm9grhdZvad9io2tA5V7PTlvQcWm/uvJSg/inA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB6007.namprd11.prod.outlook.com (2603:10b6:510:1e2::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.32; Tue, 30 Jan
 2024 21:18:32 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954%7]) with mapi id 15.20.7228.029; Tue, 30 Jan 2024
 21:18:32 +0000
Date: Tue, 30 Jan 2024 15:18:30 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Karthik Poosa <karthik.poosa@intel.com>
Subject: Re: [PATCH] drm/xe/xe_guc: Reduce a print from warn to debug
Message-ID: <x2csj4ekohacnqkjtit36dibnqfgddwemevo2e55jzdxfzijro@uwv23czmvr34>
X-Patchwork-Hint: comment
References: <20240125165652.3764711-1-karthik.poosa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240125165652.3764711-1-karthik.poosa@intel.com>
X-ClientProxiedBy: SJ2PR07CA0008.namprd07.prod.outlook.com
 (2603:10b6:a03:505::8) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB6007:EE_
X-MS-Office365-Filtering-Correlation-Id: 484ef08f-4861-46ff-80ae-08dc21d902ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3FNOUQn/yV4NUg/YFNOe08ATW3NmrQefPLCc7HttpMEGKtzpV7vrtCz+XZFh/08O49kDpO82rK42yAV66C9iPTytvbXleYghAG743ZV9h7TBMlSm7zj0GWJ+vgO0YDXU5tNk3Su2qcsOyt6Oxy6Y+kzSHw6d8tMwSSjKnclFbvAmKPtSifps5WbtRcpR03s2FxjxmP/QTl1HTvosJHk2fi8rwpVufa/zCZcxHRSAGdcc8jOKV7ttvryX6nD4yYO5iMKenyri2IkYa3jjTkNZTSq63iT3VNQyBHPjWtqa3ElvI2rZQ//lrZrNc7HHkNYdco1oMjIxy7lHoA6XyVc7Zw80L24F2YxCduXcPV/NTpiX9YaWMmx3BSaAZop76rG54mQ4/F4rTwecQPYQTIwfFrWoAchGwDZmqyJP7qe8hQyT12T+i7DlubZkAi8WbQL1DEdhglMoCDzYqYAQlFwLb1iepufHmv8p6WMiI++PVvC1qzvpRXa+VgtxB2dZKm3Fppq/sSYSJo9dyUxsbj+svTHlOrGH0QRsAdD3M+ZUzt6fhNHCgcwrNp3sJz1yLIh5vTLFfxGd8jE8siy/mPP2EidcsBxdDrYZ6iNZLnUkAKxn0Kfd+xJT9jhW8geEkOIn
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(366004)(136003)(39860400002)(376002)(396003)(346002)(230922051799003)(230273577357003)(230173577357003)(1800799012)(64100799003)(451199024)(186009)(83380400001)(82960400001)(86362001)(66946007)(5660300002)(8936002)(4326008)(8676002)(6862004)(33716001)(26005)(9686003)(38100700002)(2906002)(41300700001)(6636002)(6512007)(66476007)(478600001)(6486002)(66556008)(6506007)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SsYsf+E0BrOxYa5c8t4UjNG9woANhIcBYwaRqJXGxq/uyvoqy42YMqd13VWo?=
 =?us-ascii?Q?asFBB2gkkmy2rzx/k8i5qHLx4deeIouYjNkg8hTw5f/pnvbLu6UtkQjbb3Sm?=
 =?us-ascii?Q?lLqxACWKhOyxUF7yxJyrq8CW1LpQaD8wseIsOGo94QEe7E2dq8VzrnQrwUTO?=
 =?us-ascii?Q?+7TeU5BiudxqzF29sKv/f1/7CipzgAtMwrr45cptU8JNpHce9KTBQiLbhwKz?=
 =?us-ascii?Q?1d1DZ4c/WXOKJV3dKGd15ciO7Q1nGwU4/aRPM6kWgSR1fycQovVirA8p/oUO?=
 =?us-ascii?Q?m1P55vvgsQHbxD0nGsp/Ie01y4Y0nKBvnFr7mR2tlVFdRSnBVF98FGGM2OG4?=
 =?us-ascii?Q?eY9dAADJwHKelN/x63lQ066P4X35veBtYyxZQTURKPe7vqUZj+bNJHG7r7Mv?=
 =?us-ascii?Q?Tf2ATkcpir1loPfpc93lDLlV+IL3mZGcAG0ocvNbSQW9jRUATYIz682ci/Vk?=
 =?us-ascii?Q?w8ycgDdNFM4QpB0F1CuS3cd0CthFAtfR3dZVgc0Uj8gbsPmWMHXDtQFFml2q?=
 =?us-ascii?Q?CBuvzhVYDVcp5DsVNUojvqa1a5db5pBo5rIuVkAz+YKughlwUqNUtpuTITIg?=
 =?us-ascii?Q?pqA+MIRwZ6f/K/Hmm3+pPrNpUaQQbY3pW/4c6WkKIKqOf58Dywco2XfO3ozO?=
 =?us-ascii?Q?ioNP5MopkTjgaqHmRvYayGe1TwmU/cqY3D8fb3kCA3nikHfjPAJ1FP0jwPoe?=
 =?us-ascii?Q?wVs/IYStbN4epRIVurFxCWecxKX+8Nm5K+3FBugAPToat2bRGF5q/BVsrFLw?=
 =?us-ascii?Q?W0MRMQbHdoLw80Y+tWBo0QmP3lVpxOFD2bNt7d0iQybProiHCdO4Uy+tCfP8?=
 =?us-ascii?Q?Y6rObwcaZKeyXLKRCCkDljITcJCyxmCdEIdPqxDbwmndwlFDZD033xHYdLDK?=
 =?us-ascii?Q?+6BRmG5YnCUH7Fp8Ct1ROHQnT4lzpsmv9fqJSFh4h16xgeijyG1VbRQabJZf?=
 =?us-ascii?Q?bbG9SPlnTsWJgzocsncdkMcP54jKh2opJFqlTrMtcOh1DxHzwn88iJtBJ/Nx?=
 =?us-ascii?Q?Tx+s96jnwZZDP8HywgA1gwUBzFikhdNgGTVDMYwcsxh50FBU4iJsGmRVl8w0?=
 =?us-ascii?Q?Clh3irsSjqeGdeiYRZ2NEW83lYJtziC608NsjtslYtA/jjuQErtD7SKV4s+p?=
 =?us-ascii?Q?natxrDX5/VnHIleLrnua8WudITYh2j5OrweAVDVBA5rwIZ7LV9+YtcYhMECR?=
 =?us-ascii?Q?3bIZji/8HVWAWGomi7XgfHES1JrlzmYZk02h0ZA7A9ta6E1wCbkrPIEzugKz?=
 =?us-ascii?Q?z517YHUb9/1mJTeoX53rByVSC77e0fWYwnLhxL5WCqJgDWIDquIkW4KFliWB?=
 =?us-ascii?Q?ZUduixn5EXXcQeKoadA4KJe6GxIQFNlIANkuG89j9XsqgtitYJr6DIrEebdM?=
 =?us-ascii?Q?XLSQ+yd5QyiQIjx+zGPWLHaieEJ/Zpz94oKoBeGf2YMiWG+g069qQVSKLyWp?=
 =?us-ascii?Q?HsbjGtoxf9j3EC6cvB6rHE0I1g1HSFaagyAEAxWXs9nx4nGIU2ZweZRv42IR?=
 =?us-ascii?Q?6o04ghiOwCtvWOBCdabFs7aCPLEIcakILyAXKnFpV7lmqz0nAF6OC5PPfw5D?=
 =?us-ascii?Q?8XDpQsq5wqrmqu75CByfhAcxGy/4EHB+NWG8UFee98bUsn2l1smuzWJ4VkTu?=
 =?us-ascii?Q?Yg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 484ef08f-4861-46ff-80ae-08dc21d902ed
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2024 21:18:32.2338 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WPVAV1apdlL4RXpNKZOyZSg65mdxqyWd+ew5d5FaBqo8CcJAyC/MKujD/F3vxegsLwmJl5ghZgTN9GYhB6orDhqNwnjKwlrTk6BPHjnJ8II=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6007
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

On Thu, Jan 25, 2024 at 10:26:52PM +0530, Karthik Poosa wrote:
>Reduce debug print from warn to debug to avoid uncessary
>warning message in dmesg (Lucas).
>
>Fixes: c5a06c9169f3 ("drm/xe/guc: Enable WA 14018913170")
>Suggested-by: Lucas De Marchi <lucas.demarchi@intel.com>
>Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>


thanks, I reworded the commit and debug messages a little and applied
to drm-xe-next.

Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_guc.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>index 576ff2c1fbb9..f4e555611baa 100644
>--- a/drivers/gpu/drm/xe/xe_guc.c
>+++ b/drivers/gpu/drm/xe/xe_guc.c
>@@ -174,8 +174,8 @@ static u32 guc_ctl_wa_flags(struct xe_guc *guc)
> 		if (GUC_VER(version->major, version->minor, version->patch) >= GUC_VER(70, 7, 0))
> 			flags |= GUC_WA_ENABLE_TSC_CHECK_ON_RC6;
> 		else
>-			drm_warn(&xe->drm, "can't apply WA 14018913170, GUC version expected >= 70.7.0, found %u %u %u\n",
>-				 version->major, version->minor, version->patch);
>+			drm_dbg(&xe->drm, "can't apply WA 14018913170, GUC version expected >= 70.7.0, found %u %u %u\n",
>+				version->major, version->minor, version->patch);
> 	}
>
> 	return flags;
>-- 
>2.25.1
>
