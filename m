Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EEC0C6FD1C
	for <intel-xe@archiver.kernel.org>; Fri, 24 Mar 2023 04:58:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 607C910E4A7;
	Fri, 24 Mar 2023 04:58:07 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A99B10E257
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Mar 2023 04:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679633886; x=1711169886;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Q8f2CkH9IWPf8Qt6npq2rDxZ30OnI792ZNu4F4R08wU=;
 b=l0hisELelLCDGu5S8V/WwTNBQPZnsVdXrzvpjsr48woJhMpfEvAopQhn
 5upNdbeNaUni7cL1X8u4m+V1p7WHaNkWtgAJMljg7pk+q1razWQmvjYM6
 6OSlxlPAJYhx2ocSGQMMPFyE92qL5+PMfhK8XHiHhmcmkhOOOA8kHju2z
 bzWaSOm9L/Kigl0JbWSML6RMbqM1UEWRo5VCVNO73fXCGJn/eChnAmupg
 t3cTHutY0StTWYc/5MM/KuXTY1mx/IICDfLnck6XQejAqcbj8CYp8InNh
 nH4EU3vG8jIbSJ2HuDorJ3BWtNPBGX07uXXT8WqZuZFqM09267LdZS89O g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="402276760"
X-IronPort-AV: E=Sophos;i="5.98,286,1673942400"; d="scan'208";a="402276760"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 21:58:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="682546855"
X-IronPort-AV: E=Sophos;i="5.98,286,1673942400"; d="scan'208";a="682546855"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga002.jf.intel.com with ESMTP; 23 Mar 2023 21:58:05 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 23 Mar 2023 21:58:04 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 23 Mar 2023 21:58:04 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Thu, 23 Mar 2023 21:58:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YP580U1EbnpnjcbSIt2eQaTdVDqgP2bKHtQYAz6TU1/+4qbJb9tngxwRc5Vqm42bFneouxatuqoNmXTE4T6PYc0ygb0lz7ZZRaVMgRAiDETBBibpvp1Dp0B/PqUvA45I/uJz8Br5Nr8aHtlNjYBPIvn3yKY8A7CbbeZqn6WemovaYKVatHdpHDZCnVIXjEUIR6u1Yo1iLpoXMN8L0Nue4BT1mQ4NlwJPaol2L7CPC8lnZqsRyj70FhtF2e2st4wssUz6tdUSw7AlU34JShn73h9+xqhlVC5ofOB4GtIRCj2VgO5gCH/43pk3ZCh0vGpQXonjUL3pgZC7IZWl98hLqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=goJIJ7/W087nCuGrvtMFIKePVUARw9OHtoi2cEwUdjA=;
 b=PN9y6nda7Qr02DYoBnGFLOjLE31eLNqmdSkrA3asCwbgFyEnbnCUXQI5CxAlJTjFGf+vpGgiOiNhOfbSXKxDHPTvKmU6uJxmBKlR2RfCR3ZlU/hxxOGyX3odJIglzvRgjE8CInfp9LvpX2b0Zeiqv1KkX5toZHMw79XZtn92mBRsjg6QpjhN+4JQtYiRRao06B8hfCCiHFCsI/9VJu3nzBXDV0JXc3EukKw65Ii9bZ3NFZ9698/FOax8rH7guvrkRiQMRGWSKK0PiPFnbqg3JMRPmUUoxcD0Va7Tyf2u0jGMICIByeWM77XSxV0QlmdEXa2s1dDqGMTu6b3WNnkRLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW4PR11MB8267.namprd11.prod.outlook.com (2603:10b6:303:1e2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Fri, 24 Mar
 2023 04:57:57 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745%5]) with mapi id 15.20.6178.037; Fri, 24 Mar 2023
 04:57:57 +0000
Date: Thu, 23 Mar 2023 21:57:55 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Message-ID: <20230324045755.g5uzy6unqm2itaay@ldmartin-desk2.lan>
References: <20230323224651.1187366-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230323224651.1187366-1-lucas.demarchi@intel.com>
X-ClientProxiedBy: BYAPR11CA0060.namprd11.prod.outlook.com
 (2603:10b6:a03:80::37) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW4PR11MB8267:EE_
X-MS-Office365-Filtering-Correlation-Id: 40c614aa-afd8-4627-7e68-08db2c2455b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XVYCHoE+ODEb/KmS/wYaNvZ8xKil82h0gZoE1p/dIPtAapZ0olxwH3VxPRO/fXxNbjLoo+o15csSF6o7vFxdiAEiqbFJ8t+eHGIrHtBk8choSnwZnyYwai07ogb+uAACwtpmUKKsSOeqAVw+37OmnttOIm26ETEpIc+29lbd+fVFJMb/nABEO/A+D2Uz0iD8Or4aQ3/YWGXuS9J/uqPX8uyGL71kct0syiESBynX6RsojTuHNSXh87dMiNemrs1J2U+GgULH6zCyszwOkaOrR5Me/kgXkOdxfovz6i8CaEJ1nON+ZhT+Woqyc2s2n7gvg8+y6WYq47Y+xHfcM9bkh8Qj+Gt5G3tERrNtXLnaZbpWb/RYVh/uvGn4o7ypphawYBY+CtKYlMga+Xnd1HCn7BMGQfgO9cbu144nGBjeJP31aTBqLAJPPq+bCmo16LDK0t7CtMPQ1TdORzwUitmCrGpikRaQ1QnvuXtLo8Pc2scsKuKFKkRitfOG5Jh2cnhS
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(39860400002)(396003)(346002)(366004)(136003)(451199018)(41300700001)(6916009)(66946007)(8676002)(66476007)(66556008)(8936002)(5660300002)(4326008)(4744005)(2906002)(38100700002)(36756003)(82960400001)(86362001)(9686003)(966005)(316002)(6486002)(186003)(6506007)(6512007)(1076003)(26005)(107886003)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sK7DDfQCPi/5TIFoNjiGtrBaqp6e2y032T2wrNbtrv3cDitwLnYfY8zNRfEI?=
 =?us-ascii?Q?mWsYf1HFnO0Kd5QviqL5k3sjLSdbQT4jdjXoaQRoDJYPPHzqK/1fPHvYzkV1?=
 =?us-ascii?Q?H2C5koTkDzF7J7InYp7cgKc4LslD544IvB0ekz0P0FAWojKK1eh8po8SXEPP?=
 =?us-ascii?Q?VGEBsJLdWnORJJaPmxp5cD0zdTYxoQ+U+tl8esbwqMLrgNMi98bSSV2HZ13W?=
 =?us-ascii?Q?xvLUl4zueUAYWO7wnW8iHWunIEAZ2TTLiUXA0i04SgJPzXCQqx3z5/j5Ehb1?=
 =?us-ascii?Q?0oCimH8VwBrYikqRsgK4rG1YJWx2p1DgCiKHlYQdEC7OI3QhipTQAye8MWv1?=
 =?us-ascii?Q?8KGCBIojyArfG7HVn7nv+91Qv1gYbdzs2MHjwaxgN86m8k8eHyTNp5ZJ807E?=
 =?us-ascii?Q?MvOw0AqWdVq+ITZ6CJnzeQv/l1AEwGGZxzI53wzZjvH+JlKPJR7EY19Qth26?=
 =?us-ascii?Q?PeeZJ1NnIBmgitO4i47Sf+D6HzywPm1TDssVkB3jKPIygHnWPem9AT0PsciU?=
 =?us-ascii?Q?DdI50Zwk2DW1C1T7t8T0WLK+3o/UkDnrnxTK+1sEWWF/EmIjpPRqMt81O1MV?=
 =?us-ascii?Q?OGNZbjM2xaRE001yUx9N4qrhtBl7mK5Iz47SBtbLo+OnTCmqSbf8tQchDsi/?=
 =?us-ascii?Q?NZT14nDXqsSIk1mKS0oTPTqj6HSpZrU3tWkNlBXLzTBtVjRrTQlypQh05dD0?=
 =?us-ascii?Q?AunNUoUe3W0brJyIgqh2QSUPXqm4sMaQOrRqV4Y3E2ZhiXxoUiKcMLVTuvac?=
 =?us-ascii?Q?sqHCK8FWf5lrnA1WIL4ElcgUhIE6+OVdl+mOdegmfb36dxod2REG6S+ZHjuE?=
 =?us-ascii?Q?FTvYP7X1HojRne4CRJj2YWAnuv90At/HikZP86zExX0w7gBFoHdRYZrBPcD/?=
 =?us-ascii?Q?elX87Erx9cBlYxL7VEQq9i7E0ASCroPBfB3tHivWVKow1jFMWZOJrR2i9YLw?=
 =?us-ascii?Q?7a53PdXkRsoV+a87+yw962dYueEi3Ox7ZN7spmW4BamSt19NTFZ+MSGk0Fvt?=
 =?us-ascii?Q?JQFvv6w2uwSiphXtpEpRdZN+ZM7Ia/oxhPsHdF8PVQjywq5C0+B6Np+0aAo2?=
 =?us-ascii?Q?ke5eZssbIJuPZ0gpQpQzPFMGhQzyl3TDOdBJVYDtDxHCJeknUin60Joq2WOC?=
 =?us-ascii?Q?FGUsvm+bbRDB49sth+7b8p6Qq46yJQhWvd84ln06ZNtxCbYRyU4uRLaWuzI8?=
 =?us-ascii?Q?AOlmHUtNkJqbtZsEu1Si4POTomIjy9C28+G/iW3Xj3WQnX3itSKeMfHS0VBe?=
 =?us-ascii?Q?RbHiGyccDFsVTLRX+ywMvEaAT3Ug5Gq/iZLHpSApYXsAgN7SHMbfmrjPitSF?=
 =?us-ascii?Q?Zvh9+hfBnu/Ja6nqAIKG3EyYAgr8ZbxwyWZc0Bp0OO4sPHL+6vRQpoQkrU6M?=
 =?us-ascii?Q?+SeURXPCR8sfxNCBU0PEbDniKlISpfcVA0LrO9zhjnsTwSUnn8zyieaeuee9?=
 =?us-ascii?Q?Zi81r0eeWDtOLuBNcNnKV1HBhUK0Bpppbhggk3V4ytq/4X6uvit1/151/SXN?=
 =?us-ascii?Q?XE1T3W00l0QzzULS7HVO88G3OXG0tBwiEN9GXh0pq2g2131EGeWasVxV7H8m?=
 =?us-ascii?Q?WYaD7oDIUx+xfLYZsWAqFagPUWxoHx9RZoHRJ1WxwpcjENdVEBTCKfE7UggZ?=
 =?us-ascii?Q?Ig=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 40c614aa-afd8-4627-7e68-08db2c2455b4
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2023 04:57:57.3268 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S8n0qljg+lqH/RRyVNfSk04MmojiJWxG+DQHuCsW3ZcRiG1DG6ZshnwbP3MVyUJWy5EKyT3Hl9i5RyoAhDB4Qac4RWGO/HGk9LybbtQbyp8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB8267
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 0/2] HuC support for ADL-S
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
Cc: Anusha Srivatsa <anusha.srivatsa@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Mar 23, 2023 at 03:46:49PM -0700, Lucas De Marchi wrote:
>Same as https://patchwork.freedesktop.org/series/115526/, but without
>the 2nd patch, a few cosmetic changes in the first and my r-b.
>
>I was working on top of these commits since we still need some changes
>on the autoselect logic for both HuC and GuC. However there are still
>some issues to iron out. There is no reason to keep these 2 commits out.
>
>2nd patch I'm removing as plumbing the require_force_probe to the
>xe_device is probably not what we want to do as per my review. And that
>part will also need to change for the autoselect logic being done.
>
>Anusha Srivatsa (2):
>  drm/xe/huc: Support for loading unversiond HuC
>  drm/xe: Load HuC on Alderlake S

pushed, thanks

Lucas De Marchi
