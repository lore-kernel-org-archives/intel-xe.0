Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF8F9C4167B
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 14:17:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FFF410E1EE;
	Thu,  7 Dec 2023 14:17:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABDE610E8A4
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Dec 2023 14:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701958674; x=1733494674;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=NbAnV8AP0U8EJcMFLImTIp5M0pgZ6qYvZ/UyablvQ+Q=;
 b=KkOxoCWGL01Ojl/gOBIiyHS7G6EJ4hcb5XAcsHyjIudVzB9WRFy4mjM4
 FefsbdDwLD1triKFBcKZ9gN+xbg91WHey7BhnCSrP3pepTEFVc23u+7AN
 SCksy/cGbrOyZPoS5chy4KGo/w2jvcbIifaT/Cuqp0y4di+LdIjystfnM
 Gh0xnwmt+d6H/OKeX5myNzWHAKBqfEay+rIONm9c3R/mX1VQy4uJi5VKq
 ZDDKzcMjRW0T0Da+fWIKGqE+fZnpeapKT7NdjgSMKH7k6Lrtyrl4bDTC9
 GZwKSIc+dn7+RzaMLUAbJOOoxoDQGLG5ufHPu99d3KwJ7Fk8awZbe+iDX A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="460726303"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="460726303"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 06:17:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="915599867"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="915599867"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Dec 2023 06:17:53 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Dec 2023 06:17:53 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 7 Dec 2023 06:17:53 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 7 Dec 2023 06:17:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e6rHdtElqTXrwMJDWPQtYf8ACc6uAAgCTARf2AcxbeTtAK/NwTNyZIZ8OQqztmpJaBR7vxaHNpCc1ZdMxOyPZ+nU9+JRclklvoXmm6OmYJD6DXXHOADpiOmerH2BcZG/+wvCLyWoFpcENVBweUsuDq6CR66FJM2kJqIRJ+nrGpNiO98ZCJaZKdGkGUru+ioFzHCpjaYzyd9EKxlQFjw3DrmtBpkVNtmEL7BHxqCwR4Cg1NN4Nytf1Wn2uuAoufzwiiwb40K0QbVPt9kZkoeY0Xpobu6iuW/+eSzHgGR3tRJW14XEaP16flz7Ij9w5hIjtScD6/v/vjjMoocYRyTUDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zAGliwQIULLBU+/NiuJvZYdEk6rA0pYQrfG1T3kzpKk=;
 b=gA1RPTxFTWQojiwPjAlIvdXGxISWMFZ4TRnamJFTENlB5xOTRW5MI1F5WfR2eL+dzvaR6+9LqCBNQp4K92y744mtEqlaSH9iVqbbZdbtuZ2O89Wqs97Bc/7GmupntfLveG1rHzEcZLLY9jVb/lUbpa8C7gnaH/ZdpCli9WkIHTQxLsEE7BofjlYcvsGEeuPTtyNc3k6pQ1uUIKXUiMnnSiQEiKC95Ozn+W6t1iODcyVqNRoRaphkIShRVwVX+FRyu0dO+i3TeDCJaZMkjUmN/IOyfq5Pc4RECdkD/ZTzPnmoEMHV5RHmd0/GpKajyR90CWxaseb/BBiGxotZtU0BZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA1PR11MB6324.namprd11.prod.outlook.com (2603:10b6:208:388::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.27; Thu, 7 Dec
 2023 14:17:50 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b%4]) with mapi id 15.20.7046.033; Thu, 7 Dec 2023
 14:17:50 +0000
Date: Thu, 7 Dec 2023 08:17:48 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [Intel-xe] [PATCH 1/5] drm/xe: Define DRM_XE_DEBUG_SRIOV config
Message-ID: <2tfki4zhr2gsmk2vnhfjhnzrtqhedlokv3fph76xyerlboicke@idsek3w6zf7q>
References: <20231128151507.1015-1-michal.wajdeczko@intel.com>
 <20231128151507.1015-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20231128151507.1015-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BYAPR11CA0107.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::48) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA1PR11MB6324:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a00a832-9985-4c3b-eee5-08dbf72f4b75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lessY9URnbgeUdpIQUVZ5pFEoL2voQirWHJYtyj6LLcFfv8DQ5E3FoFPa164A7dEO9i92C9QQVerqJ1q/A31UrUqw1Mb93EpHXzVDvVsM/vjD8Xq6bdmEfa5ljkCHPBCXaGjPywe+yXi5X/A7iOzhhYkuhET/LlfWgd6MhkWF+cjps2BmdbRAJ1e6F12P9f9uiaIzKfOGaLSRk9yeCcSSf7G32Ot2l9AutBum7QHoUHFFzlnE9wgKPx7RoWjugxbReuxZoTGPgEar0DBDgQiXCXVJQtKJX4CXsKLgxZR3lQE39y1NfM7aUYuLqn0vIrgWRzEPJRwiGG9mfrlfn67GmrJXamKqMEot8265RKxGzaJH+YYtDmGAMhGwa3SpfnRGVaCE8e5NYW9UY9QuNFbwW33hLyM52KavWGA7L7vn4ig1IdtiZppyTQB5+YwkHgvP7CU1Av3BZeVlTw73hIMUNLuuwwd6Hd0xr7HIbCHGAM3C9gdxUIRmGgJ8X3BGK6yonAIzMUwEVZgkkh9u1hncB5Ao4CPwCvrYJ90zkNwVqH2/ROBi8/115mZpkfzqR4+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(346002)(396003)(376002)(136003)(366004)(39860400002)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(38100700002)(83380400001)(26005)(86362001)(82960400001)(9686003)(6512007)(6506007)(6486002)(478600001)(6636002)(316002)(66556008)(66476007)(66946007)(4326008)(2906002)(8936002)(8676002)(6862004)(5660300002)(33716001)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eH1hdd/bP04PI2roj2frX9QVG1cMnvGdaWhyuhxdyrCvrERbci6dZnfa7+2L?=
 =?us-ascii?Q?Kn+hTp3VfGMkIHtCtQDgTlGoywktC1D2kajWjEJYVAoJy2EMARbz6ZbQoLcD?=
 =?us-ascii?Q?6RaNw7MTLhiYBHhTvWCdniBTxMIonic0Z0+GmT2bXPo6ivbl3gAGA3EfCpha?=
 =?us-ascii?Q?nlat664VU9XHhfNXnOGm0eCWdJCpU58yInd/q55FvjtjREdI550OxE1OAl1P?=
 =?us-ascii?Q?FxbH4v8mSWSbOMikkjx4oddIycl+x0gsPGfYEvUuimyzGjyIfPDuX6SrdqRR?=
 =?us-ascii?Q?czKBmmSXTG4dMX+p1OqfOW1V0Cv0s4tLmoxfwddN+YyQk4z0ppJBjbukhpU1?=
 =?us-ascii?Q?9AvJH/IKUTGwSCYnUJAOkBaev9DYhbt7/lHsmq60YnSUbdYt9oUT53jOy5c6?=
 =?us-ascii?Q?Ifj516JBnHKWFeLgXtJf9p+zPAQLWESNGxOye9FfBnKKxFY/ls+s4yu8cc0p?=
 =?us-ascii?Q?6qCjv9LgBYYdi5YoGFv6FeFcGjvzFFm2WtZ2p4Q61aHcaYz8i6SErlJwcRA3?=
 =?us-ascii?Q?xLH6ppLq6HOEPwFsuRPRJGWD8xsiDH3W6sFYhPVqY7PT0xkDfcC0sED3DyB6?=
 =?us-ascii?Q?53wH3C0u1YpW5jqx9JHFD5a4/hRy/3YrThUatixYtPHOiYKD8bFatjNOweLh?=
 =?us-ascii?Q?AmJLoL+226K8O6HikHxTRAE4k9EVkv7F8UPmomJKG44K6VkQWvK+i844AT7x?=
 =?us-ascii?Q?Fo+EhAcpgNapwHXN8Az6C1rgR5SJ4CDFBOg0Q9XIU39s8gVGWlLzF1EcyVTZ?=
 =?us-ascii?Q?lQy4NvH+1yY1GgrDe8YZQMZzGMN7Ymz7LL9JfVNhrhm8yO9j+JUbM4Lnu8H2?=
 =?us-ascii?Q?KQPQp8Eoj/g69s0WUzXRNjwhQfd+8s6BvA+H9zBAPa64kMn24N0+z6SlTquy?=
 =?us-ascii?Q?Z1XsjJOFM9L1A1kxBOXJ8xBEjjZfUOqCTTaOYA5jeke7oWBFtjYkiFh1H1yM?=
 =?us-ascii?Q?7X4V5gpTfPe8ijr9Smv11BImrK5SQXBE57F7aVm1FB63o17sVzj0lwlH7f/r?=
 =?us-ascii?Q?2DG//9aiPkHB1fThor5FvVH1phXZ1hvEbCwAzhneq+bZT9CibhZLxLLTGeGb?=
 =?us-ascii?Q?Y8fMASj1FWbQRNt5EJYb8RZsX+4rmxlXrtTGnkAT2/DIdST0CF6DYG1BEnrd?=
 =?us-ascii?Q?4Om91oV+qoaBxyxy33xP7v2Y9STQrRlTjbY/ZLA/aKbfQfGU9mlcpW5NoOCY?=
 =?us-ascii?Q?Lzv6xhMGCD5t7LupNUBVL3ygklB6jjfvUTQURy6NFXVUu7fNaBI6FNX0yIVW?=
 =?us-ascii?Q?hQ2J9XHntBCQ8+2wn2xnaJcjVwmD2PZkKWwZSwmPtsKzPQBk137oetInyEEC?=
 =?us-ascii?Q?0pr7bFWevVa7uwtg/zUrfciB8rHvMW7qsrw8RFU6pS5IgbgwE5y5xNSq1fx2?=
 =?us-ascii?Q?0V3T8aCc4FWWcjARqO5SpWO2TcSh16qeTY1beXvnPGFrqN1ZWpdNfsOdkPiM?=
 =?us-ascii?Q?WvL/rvy4dg0ykzbWUH2p4vIgoj3YPws3ryNK4a0YmaaIIcQaKGHXH8Mjxc3m?=
 =?us-ascii?Q?QxjfMoexXV/CUnjfO21epoVe2YhPXzt2c1PETvb8j1cknb9Gh7/hjNAU6Sce?=
 =?us-ascii?Q?TVbso6Z5IVF4W3orp+mzxhG0veTvxPRUF3z0tcjcRoyxuxC7zUKRC4rwPqOy?=
 =?us-ascii?Q?1w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a00a832-9985-4c3b-eee5-08dbf72f4b75
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2023 14:17:50.6431 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fizUmesZ12PW06dTdSnnXo1S7iLc0CWNWrn2BxJw+wC407ODYaWGPUZwsGLrXepFdjqWsY+FC5KIKAYeLdxTpTzcsJtkUhWsU7Wt5qUhavc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6324
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

On Tue, Nov 28, 2023 at 04:15:03PM +0100, Michal Wajdeczko wrote:
>We will be using extra logs during enabling of the SR-IOV features
>or when adding support for new platforms. Define separate config
>flag to keep that low level logs disabled if we're not debugging.
>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> drivers/gpu/drm/xe/Kconfig.debug | 10 ++++++++++
> 1 file changed, 10 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/Kconfig.debug b/drivers/gpu/drm/xe/Kconfig.debug
>index 11bb13c73e7b..549065f57a78 100644
>--- a/drivers/gpu/drm/xe/Kconfig.debug
>+++ b/drivers/gpu/drm/xe/Kconfig.debug
>@@ -40,6 +40,16 @@ config DRM_XE_DEBUG_VM
>
> 	  If in doubt, say "N".
>
>+config DRM_XE_DEBUG_SRIOV
>+	bool "Enable extra SR-IOV debugging"
>+	default n
>+	help
>+	  Enable extra SR-IOV debugging info.
>+
>+	  Recommended for driver developers only.
>+
>+	  If in doubt, say "N".
>+
> config DRM_XE_DEBUG_MEM
> 	bool "Enable passing SYS/VRAM addresses to user space"
> 	default n
>-- 
>2.25.1
>
