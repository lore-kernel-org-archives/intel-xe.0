Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4794FC46CD2
	for <intel-xe@archiver.kernel.org>; Tue, 30 Jan 2024 14:24:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 006C5113167;
	Tue, 30 Jan 2024 14:24:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73F42113167
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Jan 2024 14:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706624658; x=1738160658;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ZJrF02Dv6Bk3lPIzMwpTnClhwfehw50bLvP4Dds2/3U=;
 b=KoYLI9cShEcM1mnsu8RW/8yIIBjPhkKNw+p9vfjn77kSmr59QP8r2YvC
 amh/9gy4Zxct+/8V5cWjwIiPisn0ncbNE2jrLZX9qkSBCImW0783haU/u
 JbjR0+ZHSVHcob9LQtfBNd7cbDIkShb2qtqdE5ZUOdSs7iWVUaTaXB9CA
 B68T5uHXjd4emF8bQJz1yhcmKhnE3NIeAQoNysCHJHrfUqpoRiILGfQLy
 ebxY5+iK6nvlzaiBh7HWbk5L4/PtvrcfI2AB/i9ki8mguY210OVNCoDxu
 Cu7lcfjW34gyNXGV3UQ4R8kex7rpItx7X+tjgxnQZ0OyUNV8u19pF6CEK Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="16673605"
X-IronPort-AV: E=Sophos;i="6.05,707,1701158400"; d="scan'208";a="16673605"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2024 06:24:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="907507065"
X-IronPort-AV: E=Sophos;i="6.05,707,1701158400"; d="scan'208";a="907507065"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Jan 2024 06:24:15 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 30 Jan 2024 06:24:12 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 30 Jan 2024 06:24:12 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 30 Jan 2024 06:24:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ijEP4OJOWuLTD1woYq8zDxtwjp7/SiJv+peXkzlkwrNpMcWtRyzcDka2LzoalS+9I/Qe6Ki2O6HjNDPQKkVgpUZ+RLwPIBTbkkE/D4oB+PvgTkGOHHXmUz4XQbNf8JgGr6K7Yg69M0YMEOJw1eXuBrFl+hECdmVoxDXgES7Nsc4y1GoFsMhUjM3iz5aJlgSFqgsfq799Y7DL4js4U3hwwAsRTcS5htwkZIrTO6dmNTvZHJyeiAvi/I7Z7nG5Goz1bUuAH13yYb0g9ixgaUX4s5VdqMospNSXo+hiUnhGdDfbepBm6Gb7hkuxxNw1JL7Ng7JSyFCEyO7fyl0iYPPktw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2++cYl3lZxxhrzHa53qgV0EbF1CGvmOjHWwETGrSxtg=;
 b=hM8kg0NmLZmAB+S2bFCWUPyUJXc0hmQzZf4cZ0TGb3frbWQiMTzq9y+qN3mhokSNpIxLlvYGM7TBjJ5WkTVNUq7u6ek4CDKeQ++zMgBReP/z75ePQA2WEyL8gsVvndrnXARSKnGv7SyKrZOO9edndxEiMTi74KyjMxyOIwVwu81nkc7Ju/6rwoTX2RKdG8uPYzAJKQvLlyMe6DovWFhD7f9/JLu12rwy7iXkSL80hhQT6A/FwbvlB7tn39hBahkSMuIQlbQZsNIdAO+l7iqEdfImX54JyFzFz5nRwYLD29tNxYNeb+vUnbbsuEjwQO8rEaRd1iKgVhCytfCT6+VlKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CO1PR11MB5058.namprd11.prod.outlook.com (2603:10b6:303:99::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.34; Tue, 30 Jan
 2024 14:24:10 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954%7]) with mapi id 15.20.7228.029; Tue, 30 Jan 2024
 14:24:10 +0000
Date: Tue, 30 Jan 2024 08:24:07 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [RFC PATCH] drm/xe/uapi: Remove support for persistent exec_queues
Message-ID: <m3dktl4dhsaz6doivscmbmlohgwpwrsp2r4h77jysm23ltptla@zvxbcxzhvyob>
References: <20240130125220.5517-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240130125220.5517-1-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0332.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::7) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CO1PR11MB5058:EE_
X-MS-Office365-Filtering-Correlation-Id: 440b40ef-2bc6-4c3c-dbb8-08dc219f1fd4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5XeTQCbIQr3l+GPBmt0VbvoBqYSoHxU5rVYSZ3TMivvpCQUfx+Uc9irkrcWbcETCdBfq9JVT6jRwGbjg4jqMjtFJ6N8w3AKOPTHd/8sKlMoT9qCmduDlpIn8i+S2uYGroiU948aJ0Gr0EcCAEu16wGt7IcSRXV/GPllEwtU/V+0L77KOWRUeNKN8i0PLshi/6fa3MGXUgtihKGbVgs+h56XkbtPXxnCBnpYS9jX2iTFLeKjZ3VKPBZ84YkAIKD2Z2jsXpSmqFQpnZe4MDbH0TOfIHhv+DYcUxdHOxFUJLAQpK4WM3bQXhTrZgFF6pZP3IJdVLykwjmhbO9+6PEYwzFz/kp5u+xvT+q/5jk++Gqbyb+t3yweYyR/C3zx2Lj31o58C/MEvhn9RqEC8gF0475iserq2UdZmLmMnyRpRmciaFHV57Zs7EiF9ONYFNFH3/N5WBbfkzrgPYqS0B+n4ptRLp/KRfCvRUjUvQgvfQ3Yf5tTZgFgpqdkm776x9P5ys2ngzNTU70Q2o45HgzO4etpSjG1NCOfL3Jp3R7kKl8Ll9O1SRnKWFrvez5ElsZEg2g4eiRupa99W58aaHfA7isLtMHZG2dQWcV7ZSrbWSEAzNmHIHvZ2OfFopv0uygBD
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(136003)(366004)(346002)(396003)(39860400002)(376002)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(2906002)(5660300002)(33716001)(41300700001)(316002)(66476007)(66556008)(6916009)(86362001)(54906003)(9686003)(6512007)(66946007)(6506007)(26005)(6486002)(478600001)(6666004)(82960400001)(38100700002)(8676002)(4326008)(8936002)(27256008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?TwJdKG/jQPxSD9qM4woM1LDJH1MjZvpSDH7ny97NVBA048G40PpOxdoN/L?=
 =?iso-8859-1?Q?Piw0kxRQXw3O3tv0QyvnXajQdWdYXDW+CHNXT5w2c+KnELNjAUOn3Sb2RC?=
 =?iso-8859-1?Q?tjWgUhuWIsiyOaWlA9xEb7t2UvxJ6EwZKKTe+QGGIbyfvVpNDyl0IH2po/?=
 =?iso-8859-1?Q?bxbpZ5fsyxRo7qjKwpMaGs9R7k4JcU779NYZMxaPFsUKQhCYQ/LE9e5Pvd?=
 =?iso-8859-1?Q?iToGc7YMXrTvXZOiRMZQhcZF749HpgNZbhu3a1gKn125FJ3d/xMiKRn8ff?=
 =?iso-8859-1?Q?PY9BDwNGh9uS+fJK5vLdwlsRUzt6qxRimiEY4WxHcCP/RjYrV0uLOtP1JZ?=
 =?iso-8859-1?Q?0YFyvG+ZD7ZNHr+afP5lIHb6MElfvdPBTEfg/pGwJ433TWyF7F/HVKudSW?=
 =?iso-8859-1?Q?lhnRwgIZtW0IK6wzwu09RPJV103r9SslmpSBgk3gmr3zLqQilKU71VVCiP?=
 =?iso-8859-1?Q?SX9Uf4K7hI75dMnVk8CNIS7pPm6Ro72sbBN7QGBkIclsFyeWA12LbjPSOV?=
 =?iso-8859-1?Q?P5JT42/+E//ZUEtdsckvlo02jIVaiXBT4dV4EHWA87MRJ9LAeW3J1ESAwY?=
 =?iso-8859-1?Q?Z5YU0DVEPbJL/4hnNmq9+mlL4XXyXFYHUZ/jQIE9VV/i4vTSZissxFQr+w?=
 =?iso-8859-1?Q?aov5CCKHOuuNJne2FwTfDMePYBiyadugR5skEIQUmWJ2ycdVYtx0eUYXpw?=
 =?iso-8859-1?Q?bx7jfz2mFsMgrF1Lbbd20Adjh+rhQgUXlm60TSl6YXxiI7G9ikwcPHGLUT?=
 =?iso-8859-1?Q?mDWYd1O3fRzbpQ6r0oBx9zy8bpehfIhgpGVPtQaVnkIcN3a5uCQq8B9xQj?=
 =?iso-8859-1?Q?dlx3bi8Zx/eiH2i9wtm0ZmGuS9995f+498gXtpm5CVmOApwQSV0X8blvLG?=
 =?iso-8859-1?Q?4cUnDQFuo1nbFC+1kLvHDZAtgidAuIJvPVT3iUVGN9mC3Gh/6D5YqhPqxd?=
 =?iso-8859-1?Q?HBmgM5+xDhk6VAbxKyJU0ynlXTq8mpv8Ofs6pBtfAV00Q+LGMPXyvaWBkd?=
 =?iso-8859-1?Q?4nh/UURWK0LiIXhBBe9dPbmrsM4jxmcYEMELKJSMXs1I/bz8Nk/HNmpWWG?=
 =?iso-8859-1?Q?rOZ8soi5mlxcy1Ke1hGuuAMUwNd9YiMreFK3Sm84GFSY+WxQlt1bk/EH5w?=
 =?iso-8859-1?Q?+eT84vL+ziu6+WtpSkFBYg2C47ajWF+OL0/RL+o4oCIjBd1mV3r+7GJ1LL?=
 =?iso-8859-1?Q?ohBEtl9ZA3RiXU8RXPJBSfo/fZtzWWNG/VbaXRHS1TNQ1FbTCc1en1EG3f?=
 =?iso-8859-1?Q?/OfnVFHP9Dfst3ZyQMU5HcP2+Q9g/QGHU/lS689bAA+CBZYHHMpRQ77Axz?=
 =?iso-8859-1?Q?347FxYhKMiALnCtP8sl5T9LvoGn1rDl2zVmt6vivEhb02Z3EzK+5FEZtQP?=
 =?iso-8859-1?Q?CGltnWBspGAm9W/HQ0u8a2fHWZ6xUaeFHWwEQrBEVRKyWn/O3Rxovm+v34?=
 =?iso-8859-1?Q?zg+eF2OsHbXuYNFN9XsfzJOHkI6J5VPMCuNakKg1q8PS8CaZKtRnzshCSx?=
 =?iso-8859-1?Q?m2GR7gLalm1n/xHK2WLPVRmv2+B/9/S6eiw2ztINnQXAz6rBI467+PPyBY?=
 =?iso-8859-1?Q?jKIQ3fOBIhsVAHW7+0PANfnpVgOyNOCUKvCzIIhjluzNWCgT40NoaWOoqQ?=
 =?iso-8859-1?Q?uQ/zwauTuDlRiXJ/2/OBJ0XkIxSuw86iXu82stOHkjIZfmhXOZrJNpaQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 440b40ef-2bc6-4c3c-dbb8-08dc219f1fd4
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2024 14:24:09.9095 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mkJr9PuGHbs803wqUgY3Rb1/ClSshWfQluvXOG4j4LrZbNC1h/tJMWaSPhgRHNzdUNEfUFlDexcQnyUyC6xqh76gBC+tehV7cD4+3QGLFEc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5058
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
Cc: Francois Dugast <francois.dugast@intel.com>,
 David Airlie <airlied@gmail.com>, intel-xe@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Jan 30, 2024 at 01:52:20PM +0100, Thomas Hellström wrote:
>Persistent exec_queues delays explicit destruction of exec_queues
>until they are done executing, but destruction on process exit
>is still immediate. It turns out no UMD is relying on this
>functionality, so remove it. If there turns out to be a use-case
>in the future, let's re-add.
>
>Persistent exec_queues were never used for LR VMs
>
>Open: Should we renumber the exec_queue properties, or leave a hole
>as in this patch.

I think it's fine to leave a hole

>diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>index 50bbea0992d9..4124284e4cce 100644
>--- a/include/uapi/drm/xe_drm.h
>+++ b/include/uapi/drm/xe_drm.h
>@@ -1045,7 +1045,7 @@ struct drm_xe_exec_queue_create {
> #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY		0
> #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE		1
> #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PREEMPTION_TIMEOUT	2
>-#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PERSISTENCE		3
>+#define   DRM_XE_EXEC_QUEUE_SET_UNUSED_1		        3

but I don't think we should add this define here. We could eventually
just use this whole.



Lucas De Marchi
