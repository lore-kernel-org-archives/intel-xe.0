Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BA0DE94136
	for <intel-xe@archiver.kernel.org>; Fri,  6 Oct 2023 22:50:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0356010E578;
	Fri,  6 Oct 2023 22:50:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6192610E578
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Oct 2023 22:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696632632; x=1728168632;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=S9hJk8vCyeO7I78QTLtMeBTy3gP/+WcKVm+0veRELdQ=;
 b=dlHgcDcZE0iOC6EbgY57RaTNe9NNPe9BmabubRYXem0T9uCYnsZhqwTl
 8riASdvgW/Rssy7lIqOcqk7HpVE2ygNL9uz9Na6DLWD4PFLrn8pehOMO8
 6ryO9XzdbSkR6Iivx7SzH58L/hOfo+1CVIHuwNzvfBkDmcdWJR2QuRkrB
 G8QupfLum8/qUVbd43AApuRa5S3gh1AsbJ+dXSFiKAWEtY6QozsBHfdLU
 JrZBrtf9VyiWEKCMKXrOGSJiuRM6C22W1AKg53kTDqVdljMeVGL/gB+Ye
 i8b5UWIFdviHcMRHV4xtT0PiTGi31JWwulYyQIUIfrxJPBehQSphGPD5d g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="450343806"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; d="scan'208";a="450343806"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2023 15:50:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="756004095"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; d="scan'208";a="756004095"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Oct 2023 15:50:31 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 6 Oct 2023 15:50:31 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 6 Oct 2023 15:50:31 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 6 Oct 2023 15:50:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a7j2EbrbMZsuAkCVEr+jzNvX90y7HlIBc0beSH75L+shPu7lKsZxl1AC9PzNDq+kW3KVKK0DY8YD1xxAQQtynNgmkmYD0kDToGVsCRQ9FBRl3FDdAIckOpFswCQlBZHAWOAj+NJsc0JWCG/HTVCvUdHJGbU79j3v7ERWTZ8/J8FiIo2OGJ9tDjARONuUFrffUNgji7GqC9qEXHuGLaY9QoWJdLat4uTZwcg90aOsKr+2NT1e9j4oKweJyOQYOPlS49dmAQvHg1uu71gCCQQKgWrsoP7KqSIKZ6PcuI2To3cM7i/VHkIinxbtdd56YPZARTQRr5N3079yhiznyHYynQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZSISWMa3i8LAu4hlunzCC8qC6Zl9LtS8rBUDVr+R4yA=;
 b=GtYSc7NfRgx9P4IDs+Zzt4HhO8/3CX6EHAhWT1zG7vlsbakJF6NvHSKvQ37MkLTWgfyEQpizwpM9EwN/X/lG/6u0ZXzqsdEuauK7kmbjbRORXahfJTxB/eKetyK0aL65YljoFMUMgw+fPwS8cNjDRovZdzRDOagjTYPkgrk/ElEQTOn/HnQDT4avNHRqD6BB/ZLChs9x5mj3bE8+C1Fs2mKR2m1bpqL8pE1/wBo5wqJwMvA9XLOOCsSQ/lsU/dXhLvf+4BSF0P2EFmnWnVz3eteF6eoJWpw83b52r7epr12K9VJkyylqPHHKJSKYcjrFGmq7nD+fM/5oR/nfacyxwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB5865.namprd11.prod.outlook.com (2603:10b6:a03:428::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.24; Fri, 6 Oct
 2023 22:50:23 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::f345:2318:9a82:51b5]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::f345:2318:9a82:51b5%7]) with mapi id 15.20.6838.033; Fri, 6 Oct 2023
 22:50:23 +0000
Date: Fri, 6 Oct 2023 17:50:20 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Anusha Srivatsa <anusha.srivatsa@intel.com>
Message-ID: <hoa357iced4fa3tcxpudulqweqk76wgdokibtrbeicrhcdvray@j45hemhsjkis>
References: <20231005205450.3177354-1-anusha.srivatsa@intel.com>
 <20231005205450.3177354-2-anusha.srivatsa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20231005205450.3177354-2-anusha.srivatsa@intel.com>
X-ClientProxiedBy: MW4PR03CA0107.namprd03.prod.outlook.com
 (2603:10b6:303:b7::22) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB5865:EE_
X-MS-Office365-Filtering-Correlation-Id: 15671fcd-f72e-4d02-a6b6-08dbc6be9ff2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PeCC47fk8amaM0LA9lnz1fcXStjzJi/U2VKHlC8/n1Sjy9N6A0Uk1/PHwFHsJoXZbTGcy8YfNOelh3fGISPrbl0Gc2cTcWDrmA5XEmGF7bYzjDm1MJTvdPEcW3dHyDGtFof5hKmfSjJzRLWOfD0Rzvo4WTLTmWPYBsJYH6LlVpjZ0Y0L7aDrxi98hKvvC9Co/ItKyyflXUV3nCUoul3Afeunt8DeglVbaFyNHvEzSfTvs+rghX0jq4+ZQA04Rwb0oq8kRDwpBe7ApG3HYA60jBRt2IPPfoQbM4NwjfAIr/AFL8BX0LQIju5tKiKkl9FDVYjBV96BMWX3QY1aJeiCzIZdMgP33kW4GW1ijkx9ZZoBXx0UwMWoUBR6MW30bktAZ+C9suNP8VsToG8eO5tvkaxKBbXPaBcIzfMGdvvNECNc1n1lRkXgKFSFM9MucU4mGKCMiwqT+6AtvjIonMYehA5oIq0d3RqwDq5YvVp+yCmdG3wpi2DOGT/zvBqfHAwORRAAdbo7lOYJ2biaQBGZV47xJnEaNcDk1ApuCCrzyfMsIXCzZvFcQowKjhqhSLFs
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(136003)(39860400002)(376002)(346002)(396003)(366004)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(2906002)(8676002)(8936002)(5660300002)(4326008)(6862004)(41300700001)(66946007)(66556008)(316002)(66476007)(38100700002)(6636002)(33716001)(6512007)(83380400001)(6506007)(26005)(82960400001)(9686003)(6486002)(86362001)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HbttKNqI0rqshScr9YN+WCQ+8Ha/lhuNttPCxPfY9FZD/lKBnM9SrHBV0kzp?=
 =?us-ascii?Q?mbqk+lWd2Udm3YWsUUT4xKemzH+9l4ArEReANw1+fYCUk05np+KA6mZQpedj?=
 =?us-ascii?Q?1wKBNe7m+1PuomtXJxN1W/rgxhXDWHm1NBqX5SzTzLPHreWjInTPmaQ6mUsr?=
 =?us-ascii?Q?C/K5086Ncwus2CjmT/pROpZMTCVD/QG9BpMmHfmHi6pUSvPth3+hW1HwgxD1?=
 =?us-ascii?Q?ysZlZG6J9WHHasU8pklqNhgdP70FisxIjNskZWRIO4QOFRBdAOCY5O0ASeAs?=
 =?us-ascii?Q?bBMNTw+0rXPnxKefsazXMbAjisIrb/cQeo0q8eva0yqWR/LGgFBI0YbWwnwt?=
 =?us-ascii?Q?FT3C4tI8YsBWBAnslkJWhvwd2er3wCk75qv7/xFfzbfN7Xcs8RygBCz8IKX0?=
 =?us-ascii?Q?N9ojGX7Uv99m3N0jEw1/e8MJj1rnB4bwgm41cxwD/N8ugwKLmAEEqIcU/rfB?=
 =?us-ascii?Q?msoXWN20oOMMsBF3Jf52B2cvqWcodYyZwQrsbr44iqfPc/hNGbt/iu+40xLy?=
 =?us-ascii?Q?WFpo3S9rWUbKqMl6jYOu7Rmyfz/sIn+ccYpbLbtO8CxksfxJoyxdo+BTuBc8?=
 =?us-ascii?Q?sBIVkAd7myUTYxQEPaXimp1m7AJRgHGGUeq+ZDvxSLECG2OzJa2MZ3qNKlEJ?=
 =?us-ascii?Q?cqe4YdYBhX3Xlm86fPGDE3zgWUBvfpopwbXYsc4jY3ms1y1q/nSBCQGE/bGy?=
 =?us-ascii?Q?R0LCgebzahTAleSu/A9JN2FQs3b6mZUJIB5I+8FoXVLh4jF7uVQHeznLCGE/?=
 =?us-ascii?Q?Wne5mSwVtXLmkVWxP9NKGIz3ZfCS0/KtJWCjAz78NGIPfTfWacjUTTCQGhkI?=
 =?us-ascii?Q?4B/4j9Rv8yN9btrpy/wPO7MOSPegBtpscYDg+nBVIMTefjU6lvhlozHWbz7R?=
 =?us-ascii?Q?3x3xbtWrMh+TxTvzOqDJLELwHD6KBjPnjpR/1KRRzKtMH/hrUzd5mU8Pzd9+?=
 =?us-ascii?Q?t24jcrPmhaWObAoUuyDBPtWOjlUJBTe2UrluH1j0CjQgBokyvcFgC6I8rUr5?=
 =?us-ascii?Q?Y3JlMQ0XgbcYW50fDiXs/M7RNExunhlDDoDEQQ+Ye8rvaX7EKBp+QWGSrFAo?=
 =?us-ascii?Q?bikrcFG56u5LMybD5fTXx55gmYfM7RwMccxKw+kO5kpBKwLpRuRkWuYCcd6f?=
 =?us-ascii?Q?XCZkTV6dU3Q/sF7+TUEicoapGaPVVic0kzfaHmnvfjkbGTJOCNMJNbQd1AZL?=
 =?us-ascii?Q?eEFw/mYok7yIDDtu/bfZH1wQ8a8ukSwgxEPti8BQ3uo9AmeCrXDW80ekPVVx?=
 =?us-ascii?Q?G35vyrbE6maG5nMIUpKGkp6Jl7oQqH5l1VZrkh3/lHvsfVmiXncwD6YQRar5?=
 =?us-ascii?Q?m3+NkXkhOUEn8oqTzhMiLiuIuWrc2+WWoUK+GH4OTjaw3bdJC0ibgJveVMYA?=
 =?us-ascii?Q?bd4kiPFIWxYrHJW6DtQxo0/eX3WKT9yMLl0vOGGAdlfBoO8mABjmcHMxLd1U?=
 =?us-ascii?Q?AIDWJGlHs9TL5yFMeffe5xhK07w/9Q3r6qWnqnHGAxcjdig4PJC91HqtUGHA?=
 =?us-ascii?Q?BLkh6phBdiEbKOkb5X3T/+k9VF1PLVHikDx0ozkUX570rmj5NwdtyaWwk1d6?=
 =?us-ascii?Q?u7z8On4m8+zeSvDh900NSob3wtsN1GHP2MkVC6nlRqModzONbGdkQlk87OwG?=
 =?us-ascii?Q?Xg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 15671fcd-f72e-4d02-a6b6-08dbc6be9ff2
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2023 22:50:23.6932 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x43d0sDQmicjFpiDsHtVkExFseJr39iT4bwpkE9tzMN1LCihsPr59CXnUvH/pzqqb0X45+J9iwMK7nY8sFdJW3BZzhAq++oICdasI3zkYJc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5865
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/5] fixup! drm/xe/display: Implement display
 support
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

On Thu, Oct 05, 2023 at 01:54:46PM -0700, Anusha Srivatsa wrote:
>Extend the change introduced in the previous patch to xe
>driver.
>
>v2: Change the patch subject to reflect the patch for which
>it is a fixup
>
>Signed-off-by: Anusha Srivatsa <anusha.srivatsa@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
>index 7c825f129166..918dd27868fa 100644
>--- a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
>+++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
>@@ -146,7 +146,7 @@ static inline struct drm_i915_private *kdev_to_i915(struct device *kdev)
> #define IS_DG2_G10(xe) ((xe)->info.subplatform == XE_SUBPLATFORM_DG2_G10)
> #define IS_DG2_G11(xe) ((xe)->info.subplatform == XE_SUBPLATFORM_DG2_G11)
> #define IS_DG2_G12(xe) ((xe)->info.subplatform == XE_SUBPLATFORM_DG2_G12)
>-#define IS_RAPTORLAKE_U(xe) ((xe)->info.subplatform == XE_SUBPLATFORM_ADLP_RPLU)
>+#define IS_RAPTORLAKE_U(xe) ((xe)->info.subplatform == XE_SUBPLATFORM_ALDERLAKE_P_RPLU)
> #define IS_ICL_WITH_PORT_F(xe) (xe && 0)
> #define HAS_FLAT_CCS(xe) (xe_device_has_flat_ccs(xe))
> #define to_intel_bo(x) gem_to_xe_bo((x))
>-- 
>2.25.1
>
