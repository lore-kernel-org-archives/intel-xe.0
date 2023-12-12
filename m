Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EDE9C4332F
	for <intel-xe@archiver.kernel.org>; Tue, 12 Dec 2023 14:29:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFA7010E619;
	Tue, 12 Dec 2023 14:29:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B46A410E5FF
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Dec 2023 14:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702391360; x=1733927360;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=0AVUoO6gC5Nuw8zMo5yR63+1Uzp46GSaVfhzLUq4t8c=;
 b=j5THFg/xaYLLKUi5iB4d2ZmtYjC/9pgBf6DaN3G1CnmMed2YuKAO2HtI
 NNkYJvsx311+43xBT/je6+nspavVud3BesikYmYiLx9T5KFdhlRF00FSQ
 Azq/MJrMmT/B+uUhA4+cKzmalAjaTvdYgVPFjZhKRu5S61phXridJHLKm
 fn5hGoCFj8sTWTOjn7/1r5rHBgR1sad0HxRDFpHprcYn0Pj4A2ViXbFO8
 55bq3USnYclq0QTZGfYsGNre40fuxeH3Q9MVtYwtjsPC+zS1m4wdPa5FW
 CPi8LYqYCrxbNldnkTUAsroA3qRWJ1A1ZEyP2Kr1Q8/kIhxjmoLfqm2PG g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="13501575"
X-IronPort-AV: E=Sophos;i="6.04,270,1695711600"; d="scan'208";a="13501575"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2023 06:29:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="777118602"
X-IronPort-AV: E=Sophos;i="6.04,270,1695711600"; d="scan'208";a="777118602"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Dec 2023 06:29:20 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 12 Dec 2023 06:29:19 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 12 Dec 2023 06:29:19 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 12 Dec 2023 06:29:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DFdmP1kgBSuNvNEwwxK0v65wb6qp/Sb1RJ7eYniNr0iJFb1fimGo4XpwvMO6cfKzkvTCRCNMXokga79lQiNV/NRuvlJPLKjT05kTN12jn712Tm+9xI8HeS+8ccMvEc5Gwhb/Ui76oerQzFAMv3rStd/mc9Wtf1UMzsBT9aCAUYc8kRCzwGD3xy87PXNrepzDG1alrMzFVrL7wvCXPHkoKZSM6p7v8Jn4F4KNZke9m/tik25du9Mj027y5bfDEDIS92IzcNgq1IzRhCYAJp3ij+B2oRHPYGKgon+U1JNRJgy0VBQ7aQM1NeXk0sOA5ucCZjkRETgIZz0V5Cny8//m7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mjP+23AU3q+wvLZeU6z77UVbKTuCR3lLnp9bcnw1o0Y=;
 b=BP2dz3StV3PXqaG8yaZKtcuyWICFuO5ZvHuIKTDgdj2ZuNq5Tf7yceWPwni96nm2DIlvprzPdfDtUOEsBT26Nl8uE5YR6CUl5mQWl81tlS9pcECCnilDU0GCwh+M7icfiCD5DZ7DiY0fOQl6jVDy7Z/XCTmxNxTAEg1SA1bhGMI47fkwxLKRLRtsdmzPnTB4TiKxKqwt9CvkQj1jvgRwLdzBZnsTOFHKLuE+PoNO0C2vfzVzhih+sZNznE67Op0StYpmdaHdFmdOhZ0v+1IclYiw7D975raqMVoUg1laAQ/IKVMoONjoPpzcsy8VIYVaMlf7pb2RNJjTI1gxVco3xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by CYYPR11MB8431.namprd11.prod.outlook.com (2603:10b6:930:c7::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.33; Tue, 12 Dec
 2023 14:29:18 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::7d36:1951:b896:cb37]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::7d36:1951:b896:cb37%7]) with mapi id 15.20.7068.031; Tue, 12 Dec 2023
 14:29:18 +0000
Date: Tue, 12 Dec 2023 15:29:15 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH 2/2] fixup! drm/xe/uapi: Reject bo creation of unaligned
 size
Message-ID: <ZXhuO2KPGqbApSwL@fdugast-desk.home>
References: <20231212142045.22182-1-maarten.lankhorst@linux.intel.com>
 <20231212142045.22182-2-maarten.lankhorst@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231212142045.22182-2-maarten.lankhorst@linux.intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: FR4P281CA0264.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e8::18) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|CYYPR11MB8431:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e0bdb7d-e6fb-454f-77a3-08dbfb1eb960
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NscNdRkXem3UZgLmeFVp9r6okP47y39gMAThJDFMoiOtiJ7/gtm+dvLCE6kUPw/b2lJ6sck0wX6AnF0KoFipA77uH8UgDnm7kaGP9A3ImV9ClNXwHuSx/1p9rIKiYnR5mMVTKTN1j2A/o+t3YYpadyWHv0S8370Ayms8C7JO4CmbFoZLECSM9IxtpyulvjfhG1ad3IkCeYx76i6AXXmVe0aN03S6xiLfCM59rU5Jj/vHDte9N/9swwX2tk7HF6dMUrMxZvrXo52NL35I8SU7NBaYjaNBWqajUxvW0jdmGkwlVRDafWtW39LtyFGNEdLvmXtnQQ3rVDEM/YP8EcK05BG5GcFIRv4np96ELclkAOxvajl7ZVloEQFlnLZN6yDXDtxUApY4X0IwylmpdJV0w9PvK1HSKSKxPyGJC2EuGl1cLYxmW0GrHfav8nJaSDI2SGKVDxkMhqoLl17/MIftZ+v3XcI9fKDsG7iOrcqJCdaIqHGhJ6xa8Vzm9xgKBTNSvSPbIbVk+81GIcJObFkVp/K3GAqQHS9bp6n5uZHr6vrnhEB9qJOicDiuZLiR4EhA
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(346002)(396003)(136003)(39860400002)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(41300700001)(38100700002)(82960400001)(8676002)(8936002)(86362001)(316002)(36756003)(66556008)(66476007)(6916009)(66946007)(478600001)(6486002)(2906002)(36916002)(6512007)(4744005)(9686003)(26005)(6506007)(5660300002)(44832011)(83380400001)(6666004)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cuRd6gGuUyRwpnJrcALu+URS53eq3nQ/oe5Z5gHxB9ptuD8s9MqP377H4DTJ?=
 =?us-ascii?Q?3n1u9qxiljQ/aNDJlFakpF5aKZ8KiLyFJY1cFsjsI0n/zEPwZjXK+ut9DF4A?=
 =?us-ascii?Q?nY3fIHKmiB+4DZKR/wNRbahHL6Ahqe3IOFo9YJY+MKr6aIgPKu+Ust3vas3K?=
 =?us-ascii?Q?gpSjuymFDJXwSlKaAiISTYzBgXWIRJVQBHKV1e7jEgxDPNwUyMKGH56A0r4a?=
 =?us-ascii?Q?5cyCLSnLPT5odQWP1WONbII9s5oDQc1I/ybM3apByum7Nh4Ib7t00E4Rdnqo?=
 =?us-ascii?Q?N6h35K2epdLO3GNeQ3rVgDSST6BNxXuEWYbHtoGOSMC++VoR8npSlCYqUr4A?=
 =?us-ascii?Q?Oz4pIW2GcOMtLIXOkXombnQq6SKxZuoB3tN+wm9JFSiHAV36M24bNPMYmtE6?=
 =?us-ascii?Q?v/A2D4zmOBnPVbMhFqSaBViGtw86lGOw0BZDEIO2s0w8gh3vMSMafla60ruV?=
 =?us-ascii?Q?ngflDzPxX/o5rtKf1QpzQObcuKmRYZbnFQC+HIUMt+x+4c1wAqRDow2iwGSO?=
 =?us-ascii?Q?b0yxbECxcZL7z9xwn/y6GC4JRyTJ2irWCLtTjoituO3MUhLi+ZQSUVQiHzXP?=
 =?us-ascii?Q?IFkIdAbgKNj82CzUjrl7IINytqzkbDXfHdLiE5sF3LHe/az4qcwHIWJRLI02?=
 =?us-ascii?Q?TTVtYXFvlic0YyTp+AENzfM5En3NHRcsP4/3KUduSUdm2rFXpilDp9fgaP2K?=
 =?us-ascii?Q?AfCrEX3L9YEcriOJJPu6979apVNa/PTvY8qnadx0X74lmq1WZWWwnUbwtUk/?=
 =?us-ascii?Q?vV7V6T4gMUWIDTfJGe2TNj5l2ieDd1UfpwlDnPNSjnvfHsbi7qZeAbHNrykU?=
 =?us-ascii?Q?5cw92aL9b8mHMLBFzB9cBOx+7c7Vo7OCY7jgqjp2Q49TP8AP5n0qgUQi+03H?=
 =?us-ascii?Q?yJ0hK7DU+/yJGPlvjaxaC5PsVMiKiogiLs2UR2p5c+HSTZL4YJKOjlJMode5?=
 =?us-ascii?Q?QtzpavlzE7VYGd7AsOUEwSYQ3gExO9fu0C3yhLGvz3nV0zs7kPWUdcGfdsnB?=
 =?us-ascii?Q?dYpUdGVekUY+IawqyKRajAvScsP5T9rEFP+4H9kC2H7k/BFznmATjOaxLf3n?=
 =?us-ascii?Q?97REpQI4AcCI0UcuDuLvr3/d6G0ZgeFstqy6pdqSibBuYM0rzLUTGWnnt4rW?=
 =?us-ascii?Q?9uRezFcV0zYs4OUQ4d6nD9FMFoHCR8jxX2QbE8M7iAQE3o8AWBaZMm8qQpET?=
 =?us-ascii?Q?abs9jAf/BlbK2R+TuNqVxjv7W8WoU8sjUNG8iA4/wCRFpjDOOo5VnEoH+M9P?=
 =?us-ascii?Q?oB+uC+1OTMgZXyacm1n4hYSU+avTQZtJ+35dl5flUpzamYQQa6S3Ngpr53pg?=
 =?us-ascii?Q?GiIcuNViS8kWNr8nY2YY/Yo7Acm2uMZ0DpqlE9j+MK/vef6pa6bOZJM6UdUA?=
 =?us-ascii?Q?jMsCP/9HE8jwgAsCVxn6MZodFoizGAxSEFXa+MT9S+2bBNCijzprV5H6GOYU?=
 =?us-ascii?Q?4XXlkXQjmbD13yhnfZiGd6mTgrsza5ZWduCA73PDRdc8DMKLoAR99OPjKRpg?=
 =?us-ascii?Q?kRWtDwS+xrsP0c3xD0IOnSgPJNr/8TbrY52JNyDCRuDZlSTnFGGjkHYtkaR3?=
 =?us-ascii?Q?8GxpECaooM5jb8h6scOgHnRbG9fiQNfLjY0kbMgPIdtJCNXU2NvV5WwDpBM2?=
 =?us-ascii?Q?lA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e0bdb7d-e6fb-454f-77a3-08dbfb1eb960
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2023 14:29:18.1999 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7GKVPsKOBmUHd2nw6WVRpddoyKU8YB+JGy2oRDwfj1Y3zNzO0YY6Z8yHW3/8J//tp5aSalMMIvha5/Z8LafLXnZoLGQM3DPcuU4f4bmV8Nw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8431
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
Cc: Maarten Lankhorst <dev@lankhorst.se>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Dec 12, 2023 at 03:20:45PM +0100, Maarten Lankhorst wrote:
> From: Maarten Lankhorst <dev@lankhorst.se>
> 
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_bo.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 7e25c8b7a01a..9cc78986dbd3 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -1574,7 +1574,7 @@ struct xe_bo *xe_managed_bo_create_pin_map(struct xe_device *xe, struct xe_tile
>  struct xe_bo *xe_managed_bo_create_from_data(struct xe_device *xe, struct xe_tile *tile,
>  					     const void *data, size_t size, u32 flags)
>  {
> -	struct xe_bo *bo = xe_managed_bo_create_pin_map(xe, tile, size, flags);
> +	struct xe_bo *bo = xe_managed_bo_create_pin_map(xe, tile, ALIGN(size, PAGE_SIZE), flags);
>  
>  	if (IS_ERR(bo))
>  		return bo;
> -- 
> 2.40.1
> 
