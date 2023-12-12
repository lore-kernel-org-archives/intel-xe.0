Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7BFAC4332F
	for <intel-xe@archiver.kernel.org>; Tue, 12 Dec 2023 04:57:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DCCC10E54D;
	Tue, 12 Dec 2023 04:57:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89E6110E54D
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Dec 2023 04:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702357038; x=1733893038;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=eFoZPhAf0cGTdnJCi1H5cOdp6oblR0J+kBCFGez2p28=;
 b=FsX5BXfq8ucIfsaH1H7EC/nSd8nCFQPy1MvtojN6xsL9icTezXUNYmOs
 /kbfEBtXTv9oI9UB/ckYZIedS/++tNMi8s6OpQGaG3krrkwjwV5ooHxbH
 KBs+Xao4hGuaMK7x5fwY2HOJHcSsVKkwvl5v+A3KZmlBGaSxsE6X+Envf
 5LTVGQEE+A/FxCDm40tNPtp6YGu/n/kZ/iDuWUKswvysBAncgTpL7Sw6x
 tTk7P+q+QeFd3bwU4eSlaXQrWqT4etMn0NF/phd3CHlVjuru3gPA43jWh
 OTPd5r1Q+3YD9parsOANKPv7916a9CZtNi3zKRiD3PJtG5NjB4PO/JulY g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="16305169"
X-IronPort-AV: E=Sophos;i="6.04,269,1695711600"; d="scan'208";a="16305169"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2023 20:57:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="1104754868"
X-IronPort-AV: E=Sophos;i="6.04,269,1695711600"; d="scan'208";a="1104754868"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Dec 2023 20:57:18 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Dec 2023 20:57:17 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Dec 2023 20:57:17 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 11 Dec 2023 20:57:17 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 11 Dec 2023 20:57:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cffx0y2jsJXRmEuuA2Did2pJKf7LGBXFdHTAHgNM42kc+TVkIxhi0icYK6sxrhrZBep1b877S+AZh7nN5qCsDRte2B8tMZJ+nHE0Ob/rUb1Hn1knR5/OfAg34YraSpkIL3v7pO0k8284iRF9OcTaWzSGY5U5rMWfUHbR9TZgqZ/JjghCmipEOAPWZNgcGKT7rnuwJG2XWy2judMc61HRlE6DW9joK2CJwrGNg+gyt2erItm21QKAaQZPW78zW5Di3a4/GQOmcgHo2frpEyCISJk6UJDBa8erGgbb+O4pD7bc1JWOQSnPV63GodGODW7KT170G2bVqb7j8xdFFw3l+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=opQh/bIdD2JJrcQhK4o8AJsrgRwUvw670giZr+yDMAc=;
 b=YU3QJOUH8GgDrvCmtiVf6rTTp9PSYP9oQQ77m/TYWpEdg/86csZhTgGsHPXglKzdkFPJv/gHTjGHeOVSA7IhCC6bTiBKjr8RsAz3sNr118PPU5pfGYANamtvNFobuaMDfR1i9f34rRYKzhXbK81F+22XvfMTLd04YiLKP21IsUM104kJNn3dm+185PX5meKJEVzLV++mJIzaATWLTs/DNsVH+OYm1P8Qhuv6KX7SNhTcaXXtfGOmDFwWGnZ6naI6+Bn130wm3Dyc97DDOauYKmrg4VvrVdrSM6L+tHyPvZAaGgqeCvyrZ3tsPFkYgUnbwjK2grgA1sqc4wxqJ1Ff7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS7PR11MB6103.namprd11.prod.outlook.com (2603:10b6:8:84::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32; Tue, 12 Dec
 2023 04:57:15 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b%4]) with mapi id 15.20.7068.031; Tue, 12 Dec 2023
 04:57:14 +0000
Date: Mon, 11 Dec 2023 22:57:12 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v3 4/9] drm/xe/kunit: Set SR-IOV mode of the fake device
Message-ID: <gswrikdct4ynrkd66yp2globqyvw2irv5oppo6yrl3msri7iek@ebnnp6ybrtya>
References: <20231211200424.1703-1-michal.wajdeczko@intel.com>
 <20231211200424.1703-5-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20231211200424.1703-5-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BY5PR17CA0035.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::48) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS7PR11MB6103:EE_
X-MS-Office365-Filtering-Correlation-Id: 598afa9b-a1af-4056-1060-08dbfacecef0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UoOQ7p7S3Euz2BfZWh9Sr+IcbsPeb/PonhnUJ9iUocZbm827Vxh32+2BeKGqmGAGzJ2C+WdGzAamLAjqZQnUDTDf6jBj2I73t2wjDMYzOXZ7XP1tT3OaL/pKASvCnxoUc3/26B+SwbH4XlGrVjIWB9vEYqsTCAL6lkkO6igv6ONXrYVCHyYBL+kQnni75xFZ4N1QhsorXW9c4qnAFQfzHi60ptjqZ0KqV4/i7wBoO4sVu8Twb9bRP4M0adoEmWA3Ktipd1T2lHPEGAsMEtGKxotCPSgwpSvlLpcS2YRtd9UCiayrA6o2mzyFBGqf79D3jqx+fvCuSYUSrBt0s1hjVBX+eYiAP5WDAie8PNY6N4+NeEuCO3NVdaqLrVKc3KE9qnAgtGnWB7cz5my3qfEbHbYvMm8L7GU3qg9GxhPfdicjLTgFws87wvFDQOuiSJbYFpMfoCBLyTSx8rO5Ai+zUmSlNdj2bbSceA6ACThc92LESb0aRAg0g9iTVvUIUULwOlSBCUpjuaHO0KzzzKxI7k36PyNZL4Ut09ZQzt89kjpOqBqHFHvBH4adyZF9IqkkjH/qM5g9seYncNjDfSQNoZPpI+r/IerCkBkBx+4i6CE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(136003)(39860400002)(376002)(396003)(346002)(366004)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(26005)(83380400001)(6512007)(9686003)(5660300002)(6862004)(33716001)(4326008)(2906002)(41300700001)(6506007)(478600001)(6486002)(8676002)(8936002)(66946007)(316002)(6636002)(66476007)(82960400001)(66556008)(38100700002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HImSzoNJYHmS+beTB9AbBifKrSPUpKQga9dhzj/XpmCW6gi3XhSzIhzQ+trO?=
 =?us-ascii?Q?D2bueJty0ge7IN+4tC3sieGvQM5+oLgTWPEHBaFRYoyxVv3Vowe0XXCZdyzh?=
 =?us-ascii?Q?eshUgHwJpjA7xVfNRGWRDZqqIc3D0YAUQSMModlZ/13z25CtDXceWVDIrva0?=
 =?us-ascii?Q?s7PZcD6xUgStcMqC0ktOO2H1loAkFwjF0BXb7MjR1c5WAx18GyYHDINUxrjR?=
 =?us-ascii?Q?9XPgC6KBEbsQtHmmLdBDz7PwmDoVMhrfrNdTlqM0I/tiuO6Tm9aBe59KvT7o?=
 =?us-ascii?Q?LWFotfKHZUrcA5kMMSC/OUV2/7ht3jEYrk+KWz4ZKDsX16J49XK8ed/lmzCp?=
 =?us-ascii?Q?2AaZ+FOWUinVghtls5x040FAwuUExVca+7mfTRPAugm+gZNk7R2PGcydi2KL?=
 =?us-ascii?Q?1OlB72zPrM+xJWaBdZSZErg3Bg1+n3ueEKQu8E9aQX7yDMK6Iefp13gQiw/R?=
 =?us-ascii?Q?2VdD4AWTmaV3PM1WG56wCKj49oSQCuNjqCvBIXK9zNE8Bl7HgVJTdNMRiHt/?=
 =?us-ascii?Q?ZsghHK9/L+wyqsYKxMxQ4XVoBEWk0tL7vfyuPTD7wZIdpx26C96cnfx5umEp?=
 =?us-ascii?Q?IKcRdlMVrKN30/3Cn3FA5UbmwDhM9fEbzX5vnxrG/ceeAe5lZ+oStgGgcHt8?=
 =?us-ascii?Q?wdYxWKpLiA4mlHL3hxljAkX9KV4serbUdS02m/pR4xUeLnKj1OdvbcIXNWTm?=
 =?us-ascii?Q?fLvn+70dxAbvh09/5L/9XngPGL74uNIeyKMYVp1Korvchh4+t/xTniBpEG8v?=
 =?us-ascii?Q?qomQnAMahjyhcGcAnFSvB6MHD2D9WC/91xhYkJmiuLUroigaidDgw/UMFVAU?=
 =?us-ascii?Q?U37ycPxfWrNDGZcCmkb0TongpI/0kPRM+PTgfjvPoMhvIh3vkg0zqmezS5/U?=
 =?us-ascii?Q?co64Gql2tQ8RyvXG6iEOjesnjK6Dg5Hb7WYnovzbqkQHq0074LfYVUEQdX0x?=
 =?us-ascii?Q?VHI1m+wS60V2PIE5yqbAzQiuO5yYc56+7bosTiflLtdFP1ET17vCHlSk6iFP?=
 =?us-ascii?Q?S/4Kz9oRXGltM64v4EPS9JeJluUp9AMhnFLvCPiTY04j6ygY49dcWclVGBfU?=
 =?us-ascii?Q?CrrXZvmr5qJRlRFO6eQ+l3KAhZ6MXNp6gLCpdjiiSBCKQFmaI7+nU/3KUAu3?=
 =?us-ascii?Q?ZXCqQ9qEuA85cnEmKQXztM4PSRWKBF831Y/q2FaSfuy0lr5yH5h5A0Uwn4oZ?=
 =?us-ascii?Q?7gHKwFp7RGZp3P3xZnLZbmsZQ1YaD3SRQ8lpdyfAXpp9htJvkwQrzxehrROI?=
 =?us-ascii?Q?MSWuLLiKfpb78OffCrN9epX34fKTTYWKS6dEcxqXMaU20vM7ovpD5QAP6VBS?=
 =?us-ascii?Q?9WbBFW6ry1YB2MbNZ5+6nxdX7Zs2dXEj3bAlH6xYJmh7UdSTZw4Zb4UPyOiD?=
 =?us-ascii?Q?gl4uMl8rxgK8V8TB/P+XgFG7NMQ3GQo/pjdedH0D3Ja3mVy71+9agyMqnuo5?=
 =?us-ascii?Q?QaTknYVnelAjq6AtjUvTLfIdaR4sNTe/rmbDdvuLE6IuVyFG4/EanzHFvhL9?=
 =?us-ascii?Q?IgQJECkWf6JKwqTL6XbiBpqCPBXngRnZUzOcQNsKoTbgUoiAu8Hvn1ha4ju/?=
 =?us-ascii?Q?BLNNjs37gr1ySPsu5wgwcR2nXrVDayBroTDE6/hfm1se1oF9ND9Yb5ZOTqgy?=
 =?us-ascii?Q?dg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 598afa9b-a1af-4056-1060-08dbfacecef0
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2023 04:57:14.7416 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zxjyj8n+jhWeVi2ybtTWBupRhxMAcjY6UY1RERPm7/hjNJF58LnOwUwaLbhKc+5SZX4s6mrR5hs9IX3cQwQg8Jisefxq2lQI+De4/mQfALI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6103
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

On Mon, Dec 11, 2023 at 09:04:19PM +0100, Michal Wajdeczko wrote:
>We want to add code that will check the driver's SR-IOV mode.
>
>Update xe_pci_fake_device_init() and struct xe_pci_fake_data to
>either explicitly specify desired SR-IOV mode of the fake device
>or fallback to the default bare-metal mode.
>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>---
> drivers/gpu/drm/xe/tests/xe_pci.c      | 3 +++
> drivers/gpu/drm/xe/tests/xe_pci_test.h | 2 ++
> 2 files changed, 5 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
>index 602793644f61..dc5a1c3f897d 100644
>--- a/drivers/gpu/drm/xe/tests/xe_pci.c
>+++ b/drivers/gpu/drm/xe/tests/xe_pci.c
>@@ -158,6 +158,9 @@ int xe_pci_fake_device_init(struct xe_device *xe)
> done:
> 	kunit_activate_static_stub(test, read_gmdid, fake_read_gmdid);
>
>+	xe->sriov.__mode = data && data->sriov_mode ?
>+			   data->sriov_mode : XE_SRIOV_MODE_NONE;

should be above the stub activate. With that,


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>+
> 	xe_info_init_early(xe, desc, subplatform_desc);
> 	xe_info_init(xe, desc->graphics, desc->media);
>
>diff --git a/drivers/gpu/drm/xe/tests/xe_pci_test.h b/drivers/gpu/drm/xe/tests/xe_pci_test.h
>index 811ffe5bd9fd..f40dcec83992 100644
>--- a/drivers/gpu/drm/xe/tests/xe_pci_test.h
>+++ b/drivers/gpu/drm/xe/tests/xe_pci_test.h
>@@ -9,6 +9,7 @@
> #include <linux/types.h>
>
> #include "xe_platform_types.h"
>+#include "xe_sriov_types.h"
>
> struct xe_device;
> struct xe_graphics_desc;
>@@ -23,6 +24,7 @@ void xe_call_for_each_graphics_ip(xe_graphics_fn xe_fn);
> void xe_call_for_each_media_ip(xe_media_fn xe_fn);
>
> struct xe_pci_fake_data {
>+	enum xe_sriov_mode sriov_mode;
> 	enum xe_platform platform;
> 	enum xe_subplatform subplatform;
> 	u32 graphics_verx100;
>-- 
>2.25.1
>
