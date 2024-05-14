Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22E28C04FFE
	for <intel-xe@archiver.kernel.org>; Tue, 14 May 2024 13:09:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E122310E297;
	Tue, 14 May 2024 13:09:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cu/gI45V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEC5A10E297
 for <intel-xe@lists.freedesktop.org>; Tue, 14 May 2024 13:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715692177; x=1747228177;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=QaOm1GDrazEauF3Aw/XKAVWcaRmppnatbQ4ngzfHaMc=;
 b=cu/gI45VV2YrJzdEQZf1cTXkrlPzTC9H0LzZJ3bW+c5khOfQM3kMG6kF
 7HBKUryFsxCwkT9k/nxkta2LbdqKRXvuAZSGTXSTC7jwa/GpJFiOQ+DaV
 hnRBt/aqiCYdr0ImXm/+qjUtO1UHhxCPU+k+q93ffHVwl1Z9uj1MR7rtA
 xcTEZtQRoGEHHpsiskgOI/WABT8E8yFB0UeKJCEDtIgcn3tENQwLywXaU
 r2OBUOcPDa8oa+iB1pdKOB6WsxGfHcPYJaiCedmz6X8DQz7KQ5gQkTPP/
 RcS8ypzBtPpEHdI2ZQstefq2ySIkfqGI0NtKJlR2ASYqzwuObh/RSmXZ/ g==;
X-CSE-ConnectionGUID: Eo7XaLCOR4SMF5qGMdXbGQ==
X-CSE-MsgGUID: WUWSL5ObS2Cljxx9+48+Qg==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="11794363"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="11794363"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 06:09:37 -0700
X-CSE-ConnectionGUID: dKP95IROSCW4wLpEozf/gg==
X-CSE-MsgGUID: 7RdrVlumQhCzjhNheM8yDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="30757723"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 May 2024 06:09:37 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 14 May 2024 06:09:36 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 14 May 2024 06:09:36 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 14 May 2024 06:09:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RXLUpjmX5JczBRKvoWHJl04AUqKlGNjdIadJ0sPBxpHamsdfFHcSD3IY36CchJ9IKSErSN5Cu1JvUKvHzVByHk0eFbPz5s5gJhARWpRYzX8lkUoGR38bZTlsO/eKchG9uS2RzDxSHkgngsgEFW5RwHXkv/ddvEz8iT8F/auSNQ2QNK3haljg/xssPL+on6DqIMOzgo0AyTAONsphhq0XTVjz+A4rH6wBcvDf9+D7b1mlMtOItP4Mhqx2WFI9yl5Axoeav0CArBwq78sNyVhskQUmOvii2cV1xRi3Ujr/BIQO9YlUKUiIZQUI+BrRNujQRRR6Z4gjm6iDfxxeYnsM1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1UcjKHIzamIVqZvwh0cxzG+QGH9dUCqyPCLp0zlbC8g=;
 b=FIhGVwOzMNQGZiC53keMROLF97pns8oLXS8IZmHF1Mot04qPOxt94YNo0xg9fSexWPIQ93lbisUjPFi1KBdIbUOmW7anPL7uH5PRbED476o2iYYEYjWHt2aDb5K8eqWzNMmbGNd8pDy2JbiA23ib+q247A2dhnCK/Tcpi+4lXbLccfU2Ulx+HeRoh+4gvExvyUTgXPQYAA2IRxdS6w9P3GWYZV1pkH66ThGYfzr6Dc3vYxZ8ZdVKiX7AxHOrXi6h7SaYkEY1bU6+pzBqoUegdxi4o9kcDwOOGYgxACNfMLjEiTULyadlPv0VVWXarJk7UWp8hnHm1j4xo0M8v/nI5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY8PR11MB7313.namprd11.prod.outlook.com (2603:10b6:930:9c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Tue, 14 May
 2024 13:09:35 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.7544.052; Tue, 14 May 2024
 13:09:35 +0000
Date: Tue, 14 May 2024 08:09:30 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/pf: Don't advertise support to enable VFs if not
 ready
Message-ID: <aqh6x2lwhruly3g4pxjiljnbodaxidb6np6tievlxk4ivq4nbt@b3z2lzsdectv>
References: <20240507165757.2835-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240507165757.2835-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MW4PR02CA0011.namprd02.prod.outlook.com
 (2603:10b6:303:16d::28) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CY8PR11MB7313:EE_
X-MS-Office365-Filtering-Correlation-Id: af27ca8a-3fc2-4e03-0279-08dc741719f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?07Pk1h8s5Taae6uHiRnqn5JOrFhmb5jpnAF6vkrLl2zY1m0V0+c+0Zs+KZPA?=
 =?us-ascii?Q?OxuQwo0mKgWvweKhyN7UlE5gvqQXtQwJ7wohlW9gqTHJKMiPy57UJzyLZhTQ?=
 =?us-ascii?Q?HgMgoJveBXZOfgbqK9pfR98fjhrUyINGSoCJx8+AWSCBO5x0ogQlaEQzvePS?=
 =?us-ascii?Q?sCowEeBeiEGdkxJzpeBDlYNi2We92c7OMVzrkDbhFiOOejJQaJWCCOZ6yulh?=
 =?us-ascii?Q?pz5CmOv+pxn1hEWZs4PCZ/IgV0bfIwzM3U2yTg6uOGeppD2bkvCi+DxBTP2a?=
 =?us-ascii?Q?/IZCjVrnEtMnAZsdLxt5UNlFew71lUCIHWj80durkqPx1nzNjojinznaCQKA?=
 =?us-ascii?Q?kIXcl8oBzIwj3vtvJ2ZIzVBpzlaP98mIlZsieJ68QojyeHBO/9ZpNfGhjrYb?=
 =?us-ascii?Q?3g2LRM0I6m6x5pZWdlc+KeliS8zpm5h/FTqT7JC1RDBfJ59UOr+kONTzLcy/?=
 =?us-ascii?Q?uQb/zhzgVhUF8iVvrc5t8BB/bpYdOwhRRW7O7Qy4FQt6jPp2dBlJFfaRmGZU?=
 =?us-ascii?Q?UmPqCCSPfhkF3tGF63VLg0WxQEACjnahgTeN3UdAzS/8+qbv+Cd2Ljb6m5HG?=
 =?us-ascii?Q?X9WNexIO7DsaQQ/nrmqML+CUAF4FFpIZle8DpCZsOPvaVRmJ/b1969Z8skMe?=
 =?us-ascii?Q?TKf3i7kWIzFK4IFI427gtFTqy9hZ/6UiPmMTQtU6xN9reDvrBFHXitfvfqZ4?=
 =?us-ascii?Q?uHTDEUWGCTsp243q5NqyZIg2n6X33N9tv0pae9QfKsjiyF2g2CMMYIlf8h+o?=
 =?us-ascii?Q?f/NLF1e8sWQYHzVbH1W/zdW55roBDf0IWnf+NKPRsEBFOrztio8MtsMFTl/8?=
 =?us-ascii?Q?Lo5Pw+hzTqoKEc7XZyzWKd2IuVJ8PEv6b6FNNO8zjLh0gZLUcwsXOoZyyZgN?=
 =?us-ascii?Q?bvD0XSNyiAvewHFln/VSy5ooLiCmear8PxrJstL0XmsG+SIAEhUEBZToZhkq?=
 =?us-ascii?Q?2C03NTQRuHQAfP0p2NAnSi4LVjoZOwxusO58q9+SmZ3CO2gfLIhzRYbWWRiQ?=
 =?us-ascii?Q?eTemsMs89smD9m7g4jTkQ1Y1nrpSFUDkOuYt3Iecob5bGd4e7H7n3WfyLGOP?=
 =?us-ascii?Q?lS6taP3ZQ5TuvXl4zzsV1Nx6CI4OkYNxp9aRtZnfB/tA7bkW2IbvGEs4NsTR?=
 =?us-ascii?Q?2irldizf2Zz4d1Q5JhJxRfdgTKMMmV0h2m4bzkKY2i3vpIsbaFt5Ij4Ir32M?=
 =?us-ascii?Q?lIEbEk8/s/NGNUqv4yRWZb+Uk4p/KUGplXsiHrGRfC653YliusjC6+eqaWlE?=
 =?us-ascii?Q?u/UlAS+SFemzk4arH0hJKziI1QmKNg6/v7XrHmdSfg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lttlkLrV+zT/TaYvVPswqGa0Vxc3z/NtigOlCxe7X4U3IBB03Kyi9qgEx3Of?=
 =?us-ascii?Q?pah/7/OVIw62WrLNG9zNqP9OlQgeKsZhAWc9rBSlrre6yny5qzANfBDcMUh4?=
 =?us-ascii?Q?cxXl3TFEADFL/gy6x6vT4LUjgadOZzM84ghktjJoP5KWksitUa5ceXRFEO3j?=
 =?us-ascii?Q?PH0SmEkqnD3bCuO+tnZyIkKqAIaSKLi75AuLCyBC4a0jHMzaV2tIXbrF/Ezo?=
 =?us-ascii?Q?yrtf3Uw1c96j6LhkixCUwb+39h0IE19i6P/MBA4/YiG7N0mq0DCuLD1hSsII?=
 =?us-ascii?Q?Tbv/I85QbBeEk+t+Pql/BwrYEHdHxoDn4mjh+FjPV3q4j+3EVSfA6J4JjDv7?=
 =?us-ascii?Q?olGPUQwv9zO2u4DNItdWuhI1mS3zKbWVxoBjEJj9oAk7DvwnOznXpsRp1t67?=
 =?us-ascii?Q?bBKCYLlp2wbzE5jTfwDXtPqKTM9MXTjmhcFlJqUorE7yAGNgFrjLOL0EPi07?=
 =?us-ascii?Q?fzMwkLf3KGjCksaVMcwtP6pfW32ShGSibFSQYsTt8fAit+tmw5FtWSUJDcXd?=
 =?us-ascii?Q?Bvd2146NZVEC82GZ/EAmyW38B0pX4vj+Sbomb3M9vOUNb/T6mcjuD13Ic4W+?=
 =?us-ascii?Q?z0nMyxMZF24/ye6GkpIJIOPRLj9syLEz+cKu7Mlotp2RWvjJ6qiE2T/U6qPc?=
 =?us-ascii?Q?q6i8YFWvto1xgp6OXiaTLyty3wwuQe+I1718Vh04eymUA6h7YPF+AOr41S6M?=
 =?us-ascii?Q?NSvH2T+8bYAaAm1D/KNkE9/PwhtiW2qePusBPkKutGwzZQmC8XmekgsysJCS?=
 =?us-ascii?Q?ZSLwqWe7r1KJ7iL1a5jit+kjCLoqU6kWmtEAp38cEAke/lQ7SOKQPEVKgcv2?=
 =?us-ascii?Q?MzXIc7LZfKuG4rO7Bw2lCc7FlO8uCrIp2TJ/SN6ICHu3F+1rqXo2gL5lYCvq?=
 =?us-ascii?Q?KhjKFiYAgo0Ffmh5r4glMKHmZvbitK3VLFyqdfeXwPdeIoV8H9bhctryAC1v?=
 =?us-ascii?Q?3OtiWJQFYVFRCFjhjLpk5oiQfNfy1dGBxJPTea2QTIM2GiPlX8RP5ZSNTZMv?=
 =?us-ascii?Q?8tw0F7Lk+pktg2HOD9HqXkzgppiKvu6lh1GjvTB1f5ao5x4Ozr1L9XjlFZRv?=
 =?us-ascii?Q?Lj9J43cRF+WYAKkvo3dMFwZMyTNEHEiR5W4kmikPOHnfpfJ+JNHoUIlXNd3S?=
 =?us-ascii?Q?K5HNDdEMwVdWD8heBEfH0NpbXAAZf9pn8Izxi8A5zHrH65n0ygADBGVtBmpE?=
 =?us-ascii?Q?KSGKgEWypqL5QvXXAKt2ybgSlqMhKf6kvCQ9DW11U3NjiCdQfrzBSPnWoagw?=
 =?us-ascii?Q?BU20CBur2y8RuTMjQpdy5LgQQwwEfTpv/sN6IhIB6wQyk2Y4Z/66qRH6rfBq?=
 =?us-ascii?Q?XP/fHN9f+YW6KsJAzxYl5sCz9QOxj06tohREoQZqxaqdtpd2t/mQ+XGblQmY?=
 =?us-ascii?Q?CjBRlrKedtwG16Yg7hjMOJFLNN3O8V91dKLRMktEwgHKcrgthhruoanYaoPW?=
 =?us-ascii?Q?BthCMF/rvqwm4Dwf3pIdpA0GPDdlOhe5uuhJ5wbVvQ25bMiuW95spDbe3CfI?=
 =?us-ascii?Q?A0nQbveqxUTvqvjTq1UzQ68nRno4+Nvf0NGUBAMm42Ew3JrGQ+gKLV9kND47?=
 =?us-ascii?Q?3eTwUEIK2Lx1N8KGrMZTJn12KxMW+T/8smA/IfeIMZEiwqzBKHL4YPhwcWUn?=
 =?us-ascii?Q?BQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: af27ca8a-3fc2-4e03-0279-08dc741719f3
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2024 13:09:35.0140 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PoUIngUnNmG2rfQsUQ2y9CAR8KMdvp1YN2KT8//MkWIcYmiLjEtZzhSYAKygiKafXxsE54Slt5CHO4K7bA+b8CDyxBjnISPLrzX6prBQA1E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7313
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

On Tue, May 07, 2024 at 06:57:57PM GMT, Michal Wajdeczko wrote:
>Even if we have not enabled SR-IOV support using the platform
>specific has_sriov flag, the hardware may still report SR-IOV
>capability and the PCI layer may wrongly advertise driver support
>to enable VFs.  Explicitly reset the number of supported VFs to
>zero to avoid confusion.
>
>Applications may read the /sys/bus/pci/devices/.../sriov_totalvfs
>prior to enabling VFs using the sriov_numvfs to check if such an
>operation is possible.
>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>---
> drivers/gpu/drm/xe/xe_sriov.c | 11 +++++++++++
> 1 file changed, 11 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_sriov.c b/drivers/gpu/drm/xe/xe_sriov.c
>index 1c3fa84b6adb..a274a5fb1401 100644
>--- a/drivers/gpu/drm/xe/xe_sriov.c
>+++ b/drivers/gpu/drm/xe/xe_sriov.c
>@@ -53,6 +53,7 @@ static bool test_is_vf(struct xe_device *xe)
>  */
> void xe_sriov_probe_early(struct xe_device *xe)
> {
>+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> 	enum xe_sriov_mode mode = XE_SRIOV_MODE_NONE;
> 	bool has_sriov = xe->info.has_sriov;
>
>@@ -61,6 +62,16 @@ void xe_sriov_probe_early(struct xe_device *xe)
> 			mode = XE_SRIOV_MODE_VF;
> 		else if (xe_sriov_pf_readiness(xe))
> 			mode = XE_SRIOV_MODE_PF;
>+	} else if (pci_sriov_get_totalvfs(pdev)) {
>+		/*
>+		 * Even if we have not enabled SR-IOV support using the
>+		 * platform specific has_sriov flag, the hardware may still
>+		 * report SR-IOV capability and the PCI layer may wrongly
>+		 * advertise driver support to enable VFs. Explicitly reset
>+		 * the number of supported VFs to zero to avoid confusion.

Aren't these 2 different things? The PCI layer is reporting SR-IOV
availability as reported by the HW, which doesn't mean the driver
supports it.

Lucas De Marchi

>+		 */
>+		drm_info(&xe->drm, "Support for SR-IOV is not available\n");
>+		pci_sriov_set_totalvfs(pdev, 0);
> 	}
>
> 	xe_assert(xe, !xe->sriov.__mode);
>-- 
>2.43.0
>
