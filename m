Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B690DC48297
	for <intel-xe@archiver.kernel.org>; Tue,  6 Feb 2024 21:36:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CAE5112E79;
	Tue,  6 Feb 2024 21:36:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cXu0uSZm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3649112E79
 for <Intel-Xe@lists.freedesktop.org>; Tue,  6 Feb 2024 21:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707255376; x=1738791376;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=3MhiY6wy3Bohm/y/cZysnvTQKLTe2rRPo7IDNhKpPZo=;
 b=cXu0uSZmaxm7VgFSvV3bD78Gvvcuodz5oKY09rDfbTchRPaTkEOtL+ZK
 eQVqENZwGzYI3FzBQroYQB/zG/0jQOXe4lFxRGx0OsnksX1FZF+9h9976
 d/BguHsVW59XsGUsHtVzJOoIrG9YwusMjKW8vfJESgu1ktmP7FUYo+1z4
 U+hXRM0SAwN9bhbFsHQ9nkurWdsc6PjM1g6T0Bnwcc5L+xIBb4u5jLqhE
 zTuxG968OEpbMzo5TID34e+Buua6DqweLpAkKjgMWqnOycokf6mIYkE9/
 qFg+YiC5czP0Wh3TNckegI5/zf0u7q+x/9uT6ZVK/GWJr6TtC+a1RTayX g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="743828"
X-IronPort-AV: E=Sophos;i="6.05,248,1701158400"; 
   d="scan'208";a="743828"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2024 13:36:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,248,1701158400"; d="scan'208";a="32224800"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Feb 2024 13:36:07 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 6 Feb 2024 13:36:05 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 6 Feb 2024 13:36:05 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 6 Feb 2024 13:36:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m/aexfGtMw09odtZVScU43hKdzfC7TPwlHJ2/XRZOkHMjiuSJCN0p21GTLsVBzqj18N4VprASIqFkVQOigZ+qipc5dm5gS59o+Kfi7lRGzur7fvarja+sxDr5fuVhuqB/9GXT1v5GImX47MyCH92DctQO/kVWoJ84Am97TQnFuxymPQXCpum/dBidauxWZ3NVPnMG1iuKSwW9brEYjbKpJw3kAzP9vuX8kXg7CC0v0p7CqlRIXPUC2StQM/2idoglwX+e9ve4c2Q+PS9krGrPPHXKLzr7W0d6GTFxut4q8zS/alGCcOXhH89Mx7Vqg32SgzeneSOme3+DZEH1ucQsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mfiUTSK3XIyF1oOQnbc4ILhAhO9iTiOyOcAfcTT33UQ=;
 b=J1wmOI8a4AvRBGtUUeC6t6FLBI7GvZKiU5UQ/3VBruG4bvJEsQX71oE0ZjgQExuXIkvNyVXKYqCjEcO43qtEMCm6kvTeLbH+MDsLvLdx+5LCZzSA2Y46VnRHhj7Xjr5TPtZoWnT/lN+XejYN1EHo2i58fpZNPiPWYhXLiBKKfzskUdehBRvPDPfGm657hkB9IaOm9TxIl2XRSE64fFrzS7u70Qj7/5sRN23SapA4vACVeE7tplQRXere/ev/rgoc8ZWp0TKUHNx0QkLVlVzHyRe+jyevuCE1JC4yWJ6Q34/yqyJR1HGq+FgWcd0DMLvHScLgPkuL1xGBrOMzeAm8KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW3PR11MB4604.namprd11.prod.outlook.com (2603:10b6:303:2f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.36; Tue, 6 Feb
 2024 21:36:02 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954%7]) with mapi id 15.20.7249.035; Tue, 6 Feb 2024
 21:36:02 +0000
Date: Tue, 6 Feb 2024 15:36:00 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <John.C.Harrison@intel.com>
CC: <Intel-Xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/xe/guc: Port over the slow GuC loading support
 from i915
Message-ID: <4ec5q2znrsevf3ihnzv6vvcztufpioxlwmy6342k7mam2tkq5l@6istqc7flazw>
References: <20240206201153.2773996-1-John.C.Harrison@Intel.com>
 <20240206201153.2773996-3-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240206201153.2773996-3-John.C.Harrison@Intel.com>
X-ClientProxiedBy: SJ0PR03CA0336.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::11) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW3PR11MB4604:EE_
X-MS-Office365-Filtering-Correlation-Id: f7034359-bf43-4543-f4aa-08dc275b9de4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hoEJbBsluyk/EKmt1OsfETp6HbqHTMMtHisCnqyo1Rj/q90Rs5EotLMCbYKnXEsW/ndTL6o3btpQuPhPFd677ONoYt5w7wLsNGKcQl+dVrrBpwp0mWvAufHEyBUj4fxkkm4ozJKewdkDawvG2h291IqD9QmgRb3AdmryeyuL959iyJVovc7m+fIAErX6JzIxVbCvhwNy7uBQerfbKu0vOxU/T9ve70w1lZl2S1IsKDpq0LrhpVcu2k1YqTRTR/U99qN+l7OIx5RWwcGbUO7YRcxdiRBU63ViIGStWG2rGBcUf4CRRwVo1q6zP1L0WH49MXCUKOiYKi4ZsFPpsIjcml6lfqkVyp8CaaskZbDr+2lQBefLPAK4SldK/KuWTirv8Z+IY49wk8hEFTwjKDV0o8RKtyH93oAJywXtTAGzBkUk8eBtoA7NyVi2Nhomt4lHg//FXIap0FWSZOvMaLyS5ZWWYVYaJZs1zulmE4OJiw0us5vpMwhCEBlanwcpJzXOpBqTtym9yywTQM3F+S+kEyOlTZrxduCHk1BP3yiPswqTTCKazYck6/r/gBQgDEu8
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(376002)(346002)(366004)(39860400002)(136003)(396003)(230922051799003)(230273577357003)(186009)(451199024)(1800799012)(64100799003)(2906002)(83380400001)(38100700002)(82960400001)(41300700001)(33716001)(316002)(6636002)(26005)(66556008)(66946007)(66476007)(30864003)(34206002)(4326008)(8676002)(8936002)(86362001)(6506007)(6486002)(5660300002)(9686003)(6512007)(478600001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?l5m5nvmB9nl23sk79wXEryZZBR8ZsdUrtWLveAehNHU4E5iS9VwZVyCRR8HI?=
 =?us-ascii?Q?v8SNjP5StrezhoXhujRf+JM4D1WBIZJ49IvCHcKVMJ8+xdElfeTyyLVH1j8l?=
 =?us-ascii?Q?CDc6+RaS+z4E6uFlcgI/bAO+AkZS2Ld1YVFl05fHWx3K62fztzKcrgjaa58m?=
 =?us-ascii?Q?RPK9vrOpkvOJBD9XW7qwx5rU3fC8iZvf8ogVpTCRyNHEhxGREX3htUDL44sZ?=
 =?us-ascii?Q?AcYk+OBSTlD97mH+Dm8wZSJe3SfCFPSFjnCC7ABenr77MoiKJKENpojqg+r0?=
 =?us-ascii?Q?VIgilVx/ErGWrPVMEiiXWBlp4ySDMfy3zTmWlOpwa8KLw69hxvk3M8gxeblz?=
 =?us-ascii?Q?q6lkZWcCipyO5C7/nSWQIOrnz8R+s4syIYLvwCn2fc9H2BnxomHPgvj4wJtj?=
 =?us-ascii?Q?BMze46jniXC3S6umJcpbNYHOCuGRUt8Rq1evliNs1rvXhZPCBQ7x6TGMfjY3?=
 =?us-ascii?Q?E4q8j+jOcc6zUQes2OVM7hldoquS1cLOa7Wk49pr71Ed+C/tI6SSEFe8ECA3?=
 =?us-ascii?Q?Y32lLcthFCfKMjUGbrqpGGHf7JJ36lIe04bDezCSSF6zyf2f71Qkt7kpaUIl?=
 =?us-ascii?Q?x2H0gqYFLmkccIb7rNPR8XuhnwoIEgO2AxVo/NvuwIIkB+jBcYoQXdhgfeny?=
 =?us-ascii?Q?XqMZSIO5hMCuKfuAdq3m7g7DPtd94hwSnhYDvyz+MlylQuqITKJR/YnjrIla?=
 =?us-ascii?Q?nCRWAju+qKrqaFuwVIbZ1zKKvNp3DQeTF4g/OTUNSpuIH8kpQMmALl1Ywbxj?=
 =?us-ascii?Q?aRZ464mZbz/pNTLHrvNmM15/zA7TENyO06QjRIqD4v5mb31qaoCbQwtpBsTt?=
 =?us-ascii?Q?xo3xd6IqMN+HtTaUUddhKK89FlPD4fRNXlAH6Kr/W0tNCaW6Bw0QTvEC5O6x?=
 =?us-ascii?Q?bp5lUgTaYdyfNYQ3nMM83npClw3nvLYwqwJJFiaum41sk7CYCTB5DQsPMSLl?=
 =?us-ascii?Q?qrDAcpzuZvpuwE8/yi0CA0BBaTTqk8oVgXu+JoUw4154owxq7j6bmmrNZ8l7?=
 =?us-ascii?Q?X7dne7jiuElGzXfg74prYS3BtPViEX8hBYTcb7WbH7FgMepje8GL/Vupe5Le?=
 =?us-ascii?Q?gOPiElA6wPqysCvozw7JKlD2wJ4zGdyaK5/INpUnPclWuLPsChxpCuMxPLLK?=
 =?us-ascii?Q?mRMLorNHyPhTP+FS/NEJ++/fm9LBsqY1qDTShCun2o4WRyK19eakYpX8co9O?=
 =?us-ascii?Q?UUu/QFN5NHKBhx9wdF1ZfGuIQd7v9cIZjAk9VJsSJWKtwpVgmGhHCHp+63sX?=
 =?us-ascii?Q?dXzzbMYeeXMdK2Vi8FnZjylqWKX4qt7CYh9Tl6R9dME99l8QvGn+wKj8eSHN?=
 =?us-ascii?Q?BDAi3sWxTAzW1os7XXZjSpJR+AzPlW0oS97MDDXXpfjyrNWi/w4C0OLeu0K4?=
 =?us-ascii?Q?+yUxC76FO2DryQffnqLu/h45PzmfnC6/1Xg2SWa+wNlGAEI6MClDZnORHClV?=
 =?us-ascii?Q?BTmRwkFBS4dj0EPmP014ubae9qzrQ9oguYDcWfXERYUU7wiBIaNjnTvvTboY?=
 =?us-ascii?Q?QtZ9cFfhFUrBBKn9gYJ8tLoCO1rMtY0OwujLwAiqAJkkzJDWXfKO7FI2Nu8U?=
 =?us-ascii?Q?SU1yR89lljbNXhz4C9jD0Zk/QyuOzTBQXE5ngsA/4XQsfQX+oWIKvd7feoU+?=
 =?us-ascii?Q?+w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f7034359-bf43-4543-f4aa-08dc275b9de4
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2024 21:36:02.6613 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u5CsvPRk1iC+yd9tNhE7peLKi/RZriojtCchDtD9ftBrH0tvdwklEd8QJjLASwsepSRyS++VqBN37a7+pXdK6AH2n3lZqA2Lls6eELNTjaE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4604
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

On Tue, Feb 06, 2024 at 12:11:51PM -0800, John.C.Harrison@Intel.com wrote:
>From: John Harrison <John.C.Harrison@Intel.com>
>
>GuC loading can take longer than it is supposed to for various
>reasons. So add in the code to cope with that and to report it when it
>happens. There are also many different reasons why GuC loading can
>fail, so add in the code for checking for those and for reporting
>issues in a meaningful manner rather than just hitting a timeout and
>saying 'fail: status = %x'.
>
>Also, remove the 'FIXME' comment about an i915 bug that has never been
>applicable to Xe!
>
>Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>---
> drivers/gpu/drm/xe/abi/guc_errors_abi.h |  26 +++-
> drivers/gpu/drm/xe/regs/xe_guc_regs.h   |   2 +
> drivers/gpu/drm/xe/xe_guc.c             | 197 +++++++++++++++++++-----
> drivers/gpu/drm/xe/xe_macros.h          |  32 ++++
> 4 files changed, 214 insertions(+), 43 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/abi/guc_errors_abi.h b/drivers/gpu/drm/xe/abi/guc_errors_abi.h
>index ec83551bf9c0..d0b5fed6876f 100644
>--- a/drivers/gpu/drm/xe/abi/guc_errors_abi.h
>+++ b/drivers/gpu/drm/xe/abi/guc_errors_abi.h
>@@ -7,8 +7,12 @@
> #define _ABI_GUC_ERRORS_ABI_H
>
> enum xe_guc_response_status {
>-	XE_GUC_RESPONSE_STATUS_SUCCESS = 0x0,
>-	XE_GUC_RESPONSE_STATUS_GENERIC_FAIL = 0xF000,
>+	XE_GUC_RESPONSE_STATUS_SUCCESS                      = 0x0,
>+	XE_GUC_RESPONSE_NOT_SUPPORTED                       = 0x20,
>+	XE_GUC_RESPONSE_NO_ATTRIBUTE_TABLE                  = 0x201,
>+	XE_GUC_RESPONSE_NO_DECRYPTION_KEY                   = 0x202,
>+	XE_GUC_RESPONSE_DECRYPTION_FAILED                   = 0x204,
>+	XE_GUC_RESPONSE_STATUS_GENERIC_FAIL                 = 0xF000,
> };
>
> enum xe_guc_load_status {
>@@ -17,6 +21,9 @@ enum xe_guc_load_status {
> 	XE_GUC_LOAD_STATUS_ERROR_DEVID_BUILD_MISMATCH       = 0x02,
> 	XE_GUC_LOAD_STATUS_GUC_PREPROD_BUILD_MISMATCH       = 0x03,
> 	XE_GUC_LOAD_STATUS_ERROR_DEVID_INVALID_GUCTYPE      = 0x04,
>+	XE_GUC_LOAD_STATUS_HWCONFIG_START                   = 0x05,
>+	XE_GUC_LOAD_STATUS_HWCONFIG_DONE                    = 0x06,
>+	XE_GUC_LOAD_STATUS_HWCONFIG_ERROR                   = 0x07,
> 	XE_GUC_LOAD_STATUS_GDT_DONE                         = 0x10,
> 	XE_GUC_LOAD_STATUS_IDT_DONE                         = 0x20,
> 	XE_GUC_LOAD_STATUS_LAPIC_DONE                       = 0x30,
>@@ -34,4 +41,19 @@ enum xe_guc_load_status {
> 	XE_GUC_LOAD_STATUS_READY                            = 0xF0,
> };
>
>+enum xe_bootrom_load_status {
>+	XE_BOOTROM_STATUS_NO_KEY_FOUND                      = 0x13,
>+	XE_BOOTROM_STATUS_AES_PROD_KEY_FOUND                = 0x1A,
>+	XE_BOOTROM_STATUS_PROD_KEY_CHECK_FAILURE            = 0x2B,
>+	XE_BOOTROM_STATUS_RSA_FAILED                        = 0x50,
>+	XE_BOOTROM_STATUS_PAVPC_FAILED                      = 0x73,
>+	XE_BOOTROM_STATUS_WOPCM_FAILED                      = 0x74,
>+	XE_BOOTROM_STATUS_LOADLOC_FAILED                    = 0x75,
>+	XE_BOOTROM_STATUS_JUMP_PASSED                       = 0x76,
>+	XE_BOOTROM_STATUS_JUMP_FAILED                       = 0x77,
>+	XE_BOOTROM_STATUS_RC6CTXCONFIG_FAILED               = 0x79,
>+	XE_BOOTROM_STATUS_MPUMAP_INCORRECT                  = 0x7A,
>+	XE_BOOTROM_STATUS_EXCEPTION                         = 0x7E,
>+};
>+
> #endif
>diff --git a/drivers/gpu/drm/xe/regs/xe_guc_regs.h b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
>index 92320bbc9d3d..a30e179e662e 100644
>--- a/drivers/gpu/drm/xe/regs/xe_guc_regs.h
>+++ b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
>@@ -40,6 +40,8 @@
> #define   GS_BOOTROM_JUMP_PASSED		REG_FIELD_PREP(GS_BOOTROM_MASK, 0x76)
> #define   GS_MIA_IN_RESET			REG_BIT(0)
>
>+#define GUC_HEADER_INFO				XE_REG(0xc014)
>+
> #define GUC_WOPCM_SIZE				XE_REG(0xc050)
> #define   GUC_WOPCM_SIZE_MASK			REG_GENMASK(31, 12)
> #define   GUC_WOPCM_SIZE_LOCKED			REG_BIT(0)
>diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>index 868208a39829..82514d395704 100644
>--- a/drivers/gpu/drm/xe/xe_guc.c
>+++ b/drivers/gpu/drm/xe/xe_guc.c
>@@ -16,6 +16,7 @@
> #include "xe_device.h"
> #include "xe_force_wake.h"
> #include "xe_gt.h"
>+#include "xe_gt_freq.h"
> #include "xe_guc_ads.h"
> #include "xe_guc_ct.h"
> #include "xe_guc_hwconfig.h"
>@@ -427,58 +428,172 @@ static int guc_xfer_rsa(struct xe_guc *guc)
> 	return 0;
> }
>
>+/*
>+ * Read the GuC status register (GUC_STATUS) and store it in the
>+ * specified location; then return a boolean indicating whether
>+ * the value matches either completion or a known failure code.
>+ *
>+ * This is used for polling the GuC status in an xe_wait_for()
>+ * loop below.
>+ */
>+static inline bool guc_load_done(struct xe_gt *gt, u32 *status, bool *success)

bogus inline

>+{
>+	u32 val = xe_mmio_read32(gt, GUC_STATUS);
>+	u32 uk_val = REG_FIELD_GET(GS_UKERNEL_MASK, val);
>+	u32 br_val = REG_FIELD_GET(GS_BOOTROM_MASK, val);
>+
>+	*status = val;
>+	switch (uk_val) {
>+	case XE_GUC_LOAD_STATUS_READY:
>+		*success = true;
>+		return true;
>+
>+	case XE_GUC_LOAD_STATUS_ERROR_DEVID_BUILD_MISMATCH:
>+	case XE_GUC_LOAD_STATUS_GUC_PREPROD_BUILD_MISMATCH:
>+	case XE_GUC_LOAD_STATUS_ERROR_DEVID_INVALID_GUCTYPE:
>+	case XE_GUC_LOAD_STATUS_HWCONFIG_ERROR:
>+	case XE_GUC_LOAD_STATUS_DPC_ERROR:
>+	case XE_GUC_LOAD_STATUS_EXCEPTION:
>+	case XE_GUC_LOAD_STATUS_INIT_DATA_INVALID:
>+	case XE_GUC_LOAD_STATUS_MPU_DATA_INVALID:
>+	case XE_GUC_LOAD_STATUS_INIT_MMIO_SAVE_RESTORE_INVALID:
>+		*success = false;
>+		return true;
>+	}
>+
>+	switch (br_val) {
>+	case XE_BOOTROM_STATUS_NO_KEY_FOUND:
>+	case XE_BOOTROM_STATUS_RSA_FAILED:
>+	case XE_BOOTROM_STATUS_PAVPC_FAILED:
>+	case XE_BOOTROM_STATUS_WOPCM_FAILED:
>+	case XE_BOOTROM_STATUS_LOADLOC_FAILED:
>+	case XE_BOOTROM_STATUS_JUMP_FAILED:
>+	case XE_BOOTROM_STATUS_RC6CTXCONFIG_FAILED:
>+	case XE_BOOTROM_STATUS_MPUMAP_INCORRECT:
>+	case XE_BOOTROM_STATUS_EXCEPTION:
>+	case XE_BOOTROM_STATUS_PROD_KEY_CHECK_FAILURE:
>+		*success = false;
>+		return true;
>+	}
>+
>+	return false;
>+}
>+
>+/*
>+ * Wait for the GuC to start up.
>+ *
>+ * Measurements indicate this should take no more than 20ms (assuming the GT
>+ * clock is at maximum frequency). However, thermal throttling and other issues
>+ * can prevent the clock hitting max and thus making the load take significantly
>+ * longer. Indeed, if the GT is clamped to minimum frequency then the load times
>+ * can be in the seconds range. As, there is a limit on how long an individual
>+ * usleep_range() can wait for, the wait is wrapped in a loop. The loop count
>+ * is increased for debug builds so that problems can be detected and analysed.
>+ * For release builds, the timeout is kept short so that user's don't wait
>+ * forever to find out there is a problem. In either case, if the load took longer
>+ * than is reasonable even with some 'sensible' throttling, then flag a warning
>+ * because something is not right.
>+ *
>+ * Note that the only reason an end user should hit the timeout is in case of
>+ * extreme thermal throttling. And a system that is that hot during boot is
>+ * probably dead anyway!
>+ */
>+#if defined(CONFIG_DRM_XE_DEBUG)
>+#define GUC_LOAD_RETRY_LIMIT	20
>+#else
>+#define GUC_LOAD_RETRY_LIMIT	3

why? so developers don't reproduce the issues happening on normal
system? 

>+#endif
>+#define GUC_LOAD_TIME_WARN      200
>+
> static int guc_wait_ucode(struct xe_guc *guc)
> {
>-	struct xe_device *xe = guc_to_xe(guc);
>+	struct xe_gt *gt = guc_to_gt(guc);
>+	struct xe_guc_pc *guc_pc = &gt->uc.guc.pc;
>+	ktime_t before, after, delta;
>+	bool success;
> 	u32 status;
>-	int ret;
>+	int ret, count;
>+	u64 delta_ms;
>+	u32 before_freq;
>+
>+	before_freq = xe_guc_pc_get_act_freq(guc_pc);
>+	before = ktime_get();
>+	for (count = 0; count < GUC_LOAD_RETRY_LIMIT; count++) {
>+		ret = xe_wait_for(guc_load_done(gt, &status, &success), 1000 * 1000);

this will need to be rewritten without this function rather than ported
over from i915.

>+		if (!ret || !success)
>+			break;
>+
>+		xe_gt_dbg(gt, "load still in progress, count = %d, freq = %dMHz (req %dMHz), status = 0x%08X [0x%02X/%02X]\n",
>+			  count, xe_guc_pc_get_act_freq(guc_pc),
>+			  xe_guc_pc_get_act_freq(guc_pc), status,
>+			  REG_FIELD_GET(GS_BOOTROM_MASK, status),
>+			  REG_FIELD_GET(GS_UKERNEL_MASK, status));
>+	}
>+	after = ktime_get();
>+	delta = ktime_sub(after, before);
>+	delta_ms = ktime_to_ms(delta);
>+	if (ret || !success) {
>+		u32 ukernel = REG_FIELD_GET(GS_UKERNEL_MASK, status);
>+		u32 bootrom = REG_FIELD_GET(GS_BOOTROM_MASK, status);
>+
>+		xe_gt_info(gt, "load failed: status = 0x%08X, time = %lldms, freq = %dMHz (req %dMHz), ret = %d\n",
>+			   status, delta_ms, xe_guc_pc_get_act_freq(guc_pc),
>+			   xe_guc_pc_get_act_freq(guc_pc), ret);
>+		xe_gt_info(gt, "load failed: status: Reset = %d, BootROM = 0x%02X, UKernel = 0x%02X, MIA = 0x%02X, Auth = 0x%02X\n",
>+			   REG_FIELD_GET(GS_MIA_IN_RESET, status),
>+			   bootrom, ukernel,
>+			   REG_FIELD_GET(GS_MIA_MASK, status),
>+			   REG_FIELD_GET(GS_AUTH_STATUS_MASK, status));
>+
>+		switch (bootrom) {
>+		case XE_BOOTROM_STATUS_NO_KEY_FOUND:
>+			xe_gt_info(gt, "invalid key requested, header = 0x%08X\n",
>+				   xe_mmio_read32(gt, GUC_HEADER_INFO));
>+			ret = -ENOEXEC;
>+			break;
>
>-	/*
>-	 * Wait for the GuC to start up.
>-	 * NB: Docs recommend not using the interrupt for completion.
>-	 * Measurements indicate this should take no more than 20ms
>-	 * (assuming the GT clock is at maximum frequency). So, a
>-	 * timeout here indicates that the GuC has failed and is unusable.
>-	 * (Higher levels of the driver may decide to reset the GuC and
>-	 * attempt the ucode load again if this happens.)
>-	 *
>-	 * FIXME: There is a known (but exceedingly unlikely) race condition
>-	 * where the asynchronous frequency management code could reduce
>-	 * the GT clock while a GuC reload is in progress (during a full
>-	 * GT reset). A fix is in progress but there are complex locking
>-	 * issues to be resolved. In the meantime bump the timeout to
>-	 * 200ms. Even at slowest clock, this should be sufficient. And
>-	 * in the working case, a larger timeout makes no difference.
>-	 */
>-	ret = xe_mmio_wait32(guc_to_gt(guc), GUC_STATUS, GS_UKERNEL_MASK,
>-			     FIELD_PREP(GS_UKERNEL_MASK, XE_GUC_LOAD_STATUS_READY),
>-			     200000, &status, false);
>+		case XE_BOOTROM_STATUS_RSA_FAILED:
>+			xe_gt_info(gt, "firmware signature verification failed\n");
>+			ret = -ENOEXEC;
>+			break;
>
>-	if (ret) {
>-		struct drm_device *drm = &xe->drm;
>-
>-		drm_info(drm, "GuC load failed: status = 0x%08X\n", status);
>-		drm_info(drm, "GuC load failed: status: Reset = %d, BootROM = 0x%02X, UKernel = 0x%02X, MIA = 0x%02X, Auth = 0x%02X\n",
>-			 REG_FIELD_GET(GS_MIA_IN_RESET, status),
>-			 REG_FIELD_GET(GS_BOOTROM_MASK, status),
>-			 REG_FIELD_GET(GS_UKERNEL_MASK, status),
>-			 REG_FIELD_GET(GS_MIA_MASK, status),
>-			 REG_FIELD_GET(GS_AUTH_STATUS_MASK, status));
>-
>-		if ((status & GS_BOOTROM_MASK) == GS_BOOTROM_RSA_FAILED) {
>-			drm_info(drm, "GuC firmware signature verification failed\n");
>+		case XE_BOOTROM_STATUS_PROD_KEY_CHECK_FAILURE:
>+			xe_gt_info(gt, "firmware production part check failure\n");
> 			ret = -ENOEXEC;
>+			break;
> 		}
>
>-		if (REG_FIELD_GET(GS_UKERNEL_MASK, status) ==
>-		    XE_GUC_LOAD_STATUS_EXCEPTION) {
>-			drm_info(drm, "GuC firmware exception. EIP: %#x\n",
>-				 xe_mmio_read32(guc_to_gt(guc),
>-						SOFT_SCRATCH(13)));
>+		switch (ukernel) {
>+		case XE_GUC_LOAD_STATUS_EXCEPTION:
>+			xe_gt_info(gt, "firmware exception. EIP: %#x\n",
>+				   xe_mmio_read32(gt, SOFT_SCRATCH(13)));
> 			ret = -ENXIO;
>+			break;
>+
>+		case XE_GUC_LOAD_STATUS_INIT_MMIO_SAVE_RESTORE_INVALID:
>+			xe_gt_info(gt, "illegal register in save/restore workaround list\n");
>+			ret = -EPERM;
>+			break;
>+
>+		case XE_GUC_LOAD_STATUS_HWCONFIG_START:
>+			xe_gt_info(gt, "still extracting hwconfig table.\n");
>+			ret = -ETIMEDOUT;
>+			break;
> 		}
>+
>+		/* Uncommon/unexpected error, see earlier status code print for details */
>+		if (ret == 0)
>+			ret = -ENXIO;
>+	} else if (delta_ms > GUC_LOAD_TIME_WARN) {
>+		xe_gt_warn(gt, "excessive init time: %lldms! [status = 0x%08X, count = %d, ret = %d]\n",
>+			   delta_ms, status, count, ret);
>+		xe_gt_warn(gt, "excessive init time: [freq = %dMHz, before = %dMHz, perf_limit_reasons = 0x%08X]\n",
>+			   xe_guc_pc_get_act_freq(guc_pc), before_freq,
>+			   xe_read_perf_limit_reasons(gt));
> 	} else {
>-		drm_dbg(&xe->drm, "GuC successfully loaded");
>+		xe_gt_dbg(gt, "init took %lldms, freq = %dMHz, before = %dMHz, status = 0x%08X, count = %d, ret = %d\n",
>+			  delta_ms, xe_guc_pc_get_act_freq(guc_pc),
>+			  before_freq, status, count, ret);
> 	}
>
> 	return ret;
>diff --git a/drivers/gpu/drm/xe/xe_macros.h b/drivers/gpu/drm/xe/xe_macros.h
>index daf56c846d03..eac8f2c9fba5 100644
>--- a/drivers/gpu/drm/xe/xe_macros.h
>+++ b/drivers/gpu/drm/xe/xe_macros.h
>@@ -15,4 +15,36 @@
> 			    "Ioctl argument check failed at %s:%d: %s", \
> 			    __FILE__, __LINE__, #cond), 1))
>
>+/*
>+ * xe_wait_for - magic wait macro
>+ *
>+ * Macro to help avoid open coding check/wait/timeout patterns. Note that it's
>+ * important that we check the condition again after having timed out, since the
>+ * timeout could be due to preemption or similar and we've never had a chance to
>+ * check the condition before the timeout.
>+ */
>+#define xe_wait_for(COND, US) ({ \

we don't want an wait for on arbitrary condition. At most we wait on a
register to become something, and for that we already have
xe_mmio_wait32().

Lucas De Marchi

>+	const ktime_t end__ = ktime_add_ns(ktime_get_raw(), 1000ll * (US)); \
>+	long wait__ = 10; /* recommended min for usleep is 10 us */	\
>+	int ret__;							\
>+	might_sleep();							\
>+	for (;;) {							\
>+		const bool expired__ = ktime_after(ktime_get_raw(), end__); \
>+		/* Guarantee COND check prior to timeout */		\
>+		barrier();						\
>+		if (COND) {						\
>+			ret__ = 0;					\
>+			break;						\
>+		}							\
>+		if (expired__) {					\
>+			ret__ = -ETIMEDOUT;				\
>+			break;						\
>+		}							\
>+		usleep_range(wait__, wait__ * 2);			\
>+		if (wait__ < (1000))					\
>+			wait__ <<= 1;					\
>+	}								\
>+	ret__;								\
>+})
>+
> #endif
>-- 
>2.43.0
>
