Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93516C61D85
	for <intel-xe@archiver.kernel.org>; Tue, 21 Nov 2023 02:19:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DED1610E25C;
	Tue, 21 Nov 2023 02:19:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69E8910E25C
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Nov 2023 02:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700533160; x=1732069160;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=MjsvApgVg8RA3mH1DBZ5Jy2lbZNW5Sx5uj6/4VSrdS4=;
 b=dvPCeWJRlQzVLbNfe3eqzqN8pY9P80zXvVdBTogLzEQpdFgkXjorOv3U
 qAaGIPFY+FcDjVdQrFZGYLiRWo9qZY5CjTOrjFqHOy7RAioGtjFXRfja6
 GCQi27jhKoeS+bCzeVKoTLIXjJY2/mB00ZWFQQ7O2XYCOdQ8yrm44MPvk
 wLZEQCCziG5LKGEDAogYkYAW/4ugxv+Dr4WMbVAmC6VLNdQKcLWDZwXOr
 r1lKQajrSltSDmJciJONhiOTDL16ID58JaSgLx0D0EOtRUjfYQgb0zfxf
 IQ79LuC6rtBfz2IINh1AdrWyGS7FLh7GDCUSpb/7qx061GOfJMBam7Ah4 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="13295630"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; d="scan'208";a="13295630"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2023 18:19:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="801380671"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; d="scan'208";a="801380671"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Nov 2023 18:19:19 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 20 Nov 2023 18:19:18 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 20 Nov 2023 18:19:18 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 20 Nov 2023 18:19:18 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 20 Nov 2023 18:19:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PZ1c2haO018tsec4gzgwYz4RS+c9DfeaF5hG96MPkTQOQPvoVINEUxqtdduBAFuPV3OirRMlA475F9PswkHPhO/mJDenTWj2kWwVp/ieLlxN9yrGqvSrNvriyMlL0JzePIKpWyoqVQqfIf9TmxMlqJwCv8As5R1+5cPrtnZkikFJ2eeju3rGBhmvzxk9ORjmCr1FPTxYlFgdtN/hje0Ks6PjnL1hHNOM8VwP0s6IoEUm/3xBTJeMKxTQDlCPKavRMiH9IPC06csdpQH/2HPlEZTzbT/AW9IQ0Yad0AobziMf0PF77pTk8jd6fvatuQVqYPeD1HCy1sQOTazXn+RTSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fFKy+iKUpU/fRc/9nx8nOcnedh+0bcEz7USSYZaNwDQ=;
 b=O9AzG+0Yz2O38VRogHxbRIvTJiXo/k9C8IR4u3KwwRqu8dgXH6m3KozfRKwn8MoVzdRCaBxd5on4upegdXNSVkG7kUwrbO1Uk0svvEeXJe6Kz86rYkgaw405XL2FV+WSGbJAPsgbQ8nHWaQRL+kWxnuSOhwZhW9fK81rQnTzNwUwiIZG/wQZTl7y0sAXjIm9ygqAtTkEq0XQbSvMWt52rF0vWTUZCEij+czDZVNK6qbysTWWbbEax4LZDJxRM+cLoLhrp8BU99b722J8C70vvNm+f41/nDzH2Y1iQXDaYmxJ+Tpvkz9rlyVUhVa03rHyp5FyUisiQKKvOMsBa0Eeng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB5455.namprd11.prod.outlook.com (2603:10b6:5:39b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.27; Tue, 21 Nov
 2023 02:19:15 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::1c7b:3943:33a5:aa9]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::1c7b:3943:33a5:aa9%3]) with mapi id 15.20.7002.026; Tue, 21 Nov 2023
 02:19:15 +0000
Date: Mon, 20 Nov 2023 19:18:12 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Message-ID: <ZVuw9LT1VPrS7+8U@DUT025-TGLU.fm.intel.com>
References: <20231116221637.2589469-1-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231116221637.2589469-1-daniele.ceraolospurio@intel.com>
X-ClientProxiedBy: SJ0PR05CA0153.namprd05.prod.outlook.com
 (2603:10b6:a03:339::8) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB5455:EE_
X-MS-Office365-Filtering-Correlation-Id: 29a3a621-65f8-4899-1769-08dbea38420c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9LvHfoEVC5h2r9bZ+ar8FLa6kZ5N0XURWVra4u2YWj2XgXdxG4Cl2B4L9nDyoH7XuzIKZWWQ6UveU+NSse2geN24yQP7ktYcvnJgmhUUWtHFI8zX6ZJJe200lXnFY3IaHweDLzJIdV+R8Ts+cdvyfCXnZ4bPmN7o/sg0x/BhZry7dW+FsbiemqzONirlf7FSAaEnCHLF3hrLPI36s77ewoFbtjtRgoctpOjjPrbXolUioc0NnuyN9wnYYOZTWaP9G4Jn1B4lAVglx7McuyA5pV6yQKI9s3iwokSrR0Aq8FIXd/rc+O3CNuneoWbWQ1TzU8gdf+Bnlng1KfS/Byw2wueWjAtufFcZP4BA//yM/O0MPQkN1nn0OHmM9j6wQASIYWHaHQtHDim3Pu8wKTdSP3yXtDFiVE6LHPElA6dwur8tfxqxa1TocM2/GInoDpgDxyuG504hcI8r4l+YUkO+9gljg7OCdoKv5rCVUU0tbJ+FbbKKVYfs+2A13obUH17elm4vSyXOTxZvD7MEIG6TIqcZYwyIpdR8R+rIHqhbrN05mok6KhDU2/Pmx9DmAKHAjAAOF3VcfWyvEwmChnTBdGpf/d+/I15kRyFr9fZ8F9uKXh24lorVciFWGI2YcZuEm9xDFiRbPdxL4PtpikaWvQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(396003)(376002)(366004)(136003)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(82960400001)(86362001)(6486002)(6666004)(6506007)(66476007)(6636002)(66556008)(316002)(54906003)(66946007)(107886003)(6512007)(26005)(83380400001)(2906002)(44832011)(15650500001)(5660300002)(478600001)(38100700002)(8936002)(4326008)(41300700001)(6862004)(8676002)(67856001)(309714004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DM5KV2BZshqQmgjD2piCU/j+gaa5IcuiIJz3byw09JOLnompgatlxxJgDMMp?=
 =?us-ascii?Q?OvATnZIuzW0Gm3eoT0DNOMM/oseNgjwwC7lcH0jM8MZ/ieX3imEXffvGXH1S?=
 =?us-ascii?Q?6yONISFsWoSKD4xt+IlZp4KNe30wg4lUQaPBrtlTRHhCcqtGzX+XM+ICbzll?=
 =?us-ascii?Q?ZoWekuGNnm0rYI8pxENyBSwfHPXEsXgffZ5dqlpEpPNyeI5bEnksmgrtQeAK?=
 =?us-ascii?Q?pEAf6oPaqBUHqeq+i3YdFwUVOhZVfPXccAfvTs7Oe33CqaxfvmwgZ77Rr/3y?=
 =?us-ascii?Q?/OawYSj3EVrB+zpoBEOCq8q++6Bu7h8vQltrvqNeMSVwV+jJZB84e+MBE7hp?=
 =?us-ascii?Q?8I7Fjj+9nSffMMcZjKeRlv5Ude0Nm3QrRyUE9FX03IARkvIwRaWAIvzyR5Ck?=
 =?us-ascii?Q?zCMiV2NI3Bvk0HMl756JlNl7MMLExnBTtTeeoPtLtfK4I0WZuuOqsdHDlxfE?=
 =?us-ascii?Q?XTQ1CoiIHtvkKiaDQrrQ8dmqzxcLZMEiEx999WoK/w+HTX8YUFv9c0J1d84I?=
 =?us-ascii?Q?ugxx7+ndkP1/7xAGyE0MHM5Q/ZB/IRuI3YaPQvsQ9laoz4pL9/5hdPeMgQIN?=
 =?us-ascii?Q?Tq1h8EjLTfOCV8Mld3DPJdsfaAWxBht5394QnK2OjVxVEIxBGSjiibCpdUJp?=
 =?us-ascii?Q?W5UmIVY+ydVAJvV7wBOuQ8MhDJ85pVqZw2lITFl/1ipR0GTP8uQEmS+R6zpC?=
 =?us-ascii?Q?EpclXZSaw2oKJG4He2t+k7ASEXYStCNI5Rjx85PSpGK6+lpLPREHKLdrz/TO?=
 =?us-ascii?Q?AHaWCoeZU/NxssEiodIzyHrh07cYqVI9Yvfxer2lV0UU3ukyP7TNaSvexDBy?=
 =?us-ascii?Q?q+ktn6NOcZaxS6ns9bnDHHN36zQP2z4KjPnPOqplACvWDvW0uX8AAwB2D/KI?=
 =?us-ascii?Q?IBeKJKERgmuwRaFvILGuvY72R0VfrV4e7Z6oRyxqTdTwSgOyAZfQPtNA8Gns?=
 =?us-ascii?Q?CLQXbZExjb4iw+MCFOxqYSxjo7pfCbFaLl951DRVymnlR9nFg+9v/KHmVHTf?=
 =?us-ascii?Q?2GaNqYMIpFVXRJp+jdwuaQIc9P5ODT3adw79TEj2GVt+biR12HNdbEUfUquM?=
 =?us-ascii?Q?99mIWT/Ufq+g8lRMwXWE5Ta9xdZZU8iwwdqIHDk9j4e7jq6C02ddechhLIr8?=
 =?us-ascii?Q?h8JwllMXpf1cQ5hoVP0+tUlYXVc/GptLodYUSJKQP/GdvMzCPXj4OR1PxXyw?=
 =?us-ascii?Q?OeVmtIMcko5j5Q7SoEGU7jxrq10D3F51sk/YG3mhSwBXTg/zyY+u4Y/OR73x?=
 =?us-ascii?Q?dLkEzv6uSZH76shB0lLNKLv/uPCdGiqZaliXnnQIsDCaQzX0BId3LK5RQGLW?=
 =?us-ascii?Q?QaEAW22lNtj+q5FyDXhItA+RhKc2vIM02G5EqwjLVAlun87ewXhfB23vA3Bz?=
 =?us-ascii?Q?tlFibHaq3Ou0tzEDrDV2fHZZ8GrrSuBJiI/+bwv+BtqV+B/cSdE9ubcAKrkj?=
 =?us-ascii?Q?9VW7/41ITVUDHaNlnfs/y+LTpcVIkhHXeVPYCMcYZKwWLf6TFj+6ZVYdp25Y?=
 =?us-ascii?Q?y+vSIVOV8gYpIt5rrTouvhT8KDgudpyTyxvabrWjKVoQl6S6h1HJl1ZQLWSu?=
 =?us-ascii?Q?EL7SwqPvb/8AsPSClY4h1ePA/EL/6LlOAR/zOVr2n7+4ZY0GxkXiiVbeW0QP?=
 =?us-ascii?Q?mg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 29a3a621-65f8-4899-1769-08dbea38420c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2023 02:19:15.1578 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RQTNH97oRZsR4FiHqSqw5+p1lqRXXJsT4wsvKvMOSl+hbBIJDZFasSnjl6vYobHT9Rx1R0TZuO9etLdqgO14QA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5455
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2] drm/xe/guc: Use FAST_REQUEST for
 non-blocking H2G messages
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

On Thu, Nov 16, 2023 at 02:16:37PM -0800, Daniele Ceraolo Spurio wrote:
> We're currently sending non-blocking H2G messages using the EVENT type,
> which suppresses all CTB protocol replies from the GuC, including the
> failure cases. This might cause errors to slip through and manifest as
> unexpected behavior (e.g. a context state might not be what the driver
> thinks it is because the state change command was silently rejected by
> the GuC). To avoid this kind of problems, we can use the FAST_REQUEST
> type instead, which suppresses the reply only on success; this way we
> still get the advantage of not having to wait for an ack from the GuC
> (i.e. the H2G is still non-blocking) while still detecting errors.
> Since we can't escalate to the caller when a non-blocking message
> fails, we need to escalate to GT reset instead.
> 
> Note that FAST_REQUEST failures are NOT expected and are usually a sign
> that the H2G was either malformed or requested an illegal operation.
> 
> v2: assign fence values to FAST_REQUEST messages, fix abi doc, use xe_gt
> printers (Michal).
> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/abi/guc_messages_abi.h |  2 +
>  drivers/gpu/drm/xe/xe_guc_ct.c            | 58 ++++++++++++++++++++---
>  2 files changed, 54 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/abi/guc_messages_abi.h b/drivers/gpu/drm/xe/abi/guc_messages_abi.h
> index 3d199016cf88..6544205cf40d 100644
> --- a/drivers/gpu/drm/xe/abi/guc_messages_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_messages_abi.h
> @@ -24,6 +24,7 @@
>   *  |   | 30:28 | **TYPE** - message type                                      |
>   *  |   |       |   - _`GUC_HXG_TYPE_REQUEST` = 0                              |
>   *  |   |       |   - _`GUC_HXG_TYPE_EVENT` = 1                                |
> + *  |   |       |   - _`GUC_HXG_TYPE_FAST_REQUEST` = 2                                |
>   *  |   |       |   - _`GUC_HXG_TYPE_NO_RESPONSE_BUSY` = 3                     |
>   *  |   |       |   - _`GUC_HXG_TYPE_NO_RESPONSE_RETRY` = 5                    |
>   *  |   |       |   - _`GUC_HXG_TYPE_RESPONSE_FAILURE` = 6                     |
> @@ -46,6 +47,7 @@
>  #define GUC_HXG_MSG_0_TYPE			(0x7 << 28)
>  #define   GUC_HXG_TYPE_REQUEST			0u
>  #define   GUC_HXG_TYPE_EVENT			1u
> +#define   GUC_HXG_TYPE_FAST_REQUEST		2u
>  #define   GUC_HXG_TYPE_NO_RESPONSE_BUSY		3u
>  #define   GUC_HXG_TYPE_NO_RESPONSE_RETRY	5u
>  #define   GUC_HXG_TYPE_RESPONSE_FAILURE		6u
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index a84e111bb36a..04e443c6fd8b 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -15,6 +15,7 @@
>  #include "xe_device.h"
>  #include "xe_gt.h"
>  #include "xe_gt_pagefault.h"
> +#include "xe_gt_printk.h"
>  #include "xe_gt_tlb_invalidation.h"
>  #include "xe_guc.h"
>  #include "xe_guc_submit.h"
> @@ -448,7 +449,7 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  				   GUC_HXG_EVENT_MSG_0_DATA0, action[0]);
>  	} else {
>  		cmd[1] =
> -			FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_EVENT) |
> +			FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_FAST_REQUEST) |
>  			FIELD_PREP(GUC_HXG_EVENT_MSG_0_ACTION |
>  				   GUC_HXG_EVENT_MSG_0_DATA0, action[0]);
>  	}
> @@ -475,11 +476,31 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  	return 0;
>  }
>  
> +/*
> + * The CT protocol accepts a 16 bits fence. This field is fully owned by the
> + * driver, the GuC will just copy it to the reply message. Since we need to
> + * be able to distinguish between replies to REQUEST and FAST_REQUEST messages,
> + * we use one bit of the seqno as an indicator for that and a rolling counter
> + * for the remaining 15 bits.
> + */
> +#define CT_SEQNO_MASK GENMASK(14, 0)
> +#define CT_SEQNO_IS_UNTRACKED BIT(15)
> +static u16 next_ct_seqno(struct xe_guc_ct *ct, bool is_g2h_fence)
> +{
> +	u32 seqno = ct->fence_seqno++ & CT_SEQNO_MASK;
> +
> +	if (!is_g2h_fence)
> +		seqno |= CT_SEQNO_IS_UNTRACKED;
> +
> +	return seqno;
> +}
> +
>  static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
>  				u32 len, u32 g2h_len, u32 num_g2h,
>  				struct g2h_fence *g2h_fence)
>  {
>  	struct xe_device *xe = ct_to_xe(ct);
> +	u16 seqno;
>  	int ret;
>  
>  	xe_assert(xe, !g2h_len || !g2h_fence);
> @@ -505,7 +526,7 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
>  		if (g2h_fence_needs_alloc(g2h_fence)) {
>  			void *ptr;
>  
> -			g2h_fence->seqno = (ct->fence_seqno++ & 0xffff);
> +			g2h_fence->seqno = next_ct_seqno(ct, true);
>  			ptr = xa_store(&ct->fence_lookup,
>  				       g2h_fence->seqno,
>  				       g2h_fence, GFP_ATOMIC);
> @@ -514,6 +535,10 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
>  				goto out;
>  			}
>  		}
> +
> +		seqno = g2h_fence->seqno;
> +	} else {
> +		seqno = next_ct_seqno(ct, false);
>  	}
>  
>  	if (g2h_len)
> @@ -523,8 +548,7 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
>  	if (unlikely(ret))
>  		goto out_unlock;
>  
> -	ret = h2g_write(ct, action, len, g2h_fence ? g2h_fence->seqno : 0,
> -			!!g2h_fence);
> +	ret = h2g_write(ct, action, len, seqno, !!g2h_fence);
>  	if (unlikely(ret)) {
>  		if (ret == -EAGAIN)
>  			goto retry;
> @@ -786,7 +810,8 @@ static int parse_g2h_event(struct xe_guc_ct *ct, u32 *msg, u32 len)
>  
>  static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
>  {
> -	struct xe_device *xe = ct_to_xe(ct);
> +	struct xe_gt *gt =  ct_to_gt(ct);
> +	struct xe_device *xe = gt_to_xe(gt);
>  	u32 response_len = len - GUC_CTB_MSG_MIN_LEN;
>  	u32 fence = FIELD_GET(GUC_CTB_MSG_0_FENCE, msg[0]);
>  	u32 type = FIELD_GET(GUC_HXG_MSG_0_TYPE, msg[1]);
> @@ -794,10 +819,31 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
>  
>  	lockdep_assert_held(&ct->lock);
>  
> +	/*
> +	 * Fences for FAST_REQUEST messages are not tracked in ct->fence_lookup.
> +	 * Those messages should never fail, so if we do get an error back it
> +	 * means we're likely doing an illegal operation and the GuC is
> +	 * rejecting it. We have no way to inform the code that submitted the
> +	 * H2G that the message was rejected, so we need to escalate the
> +	 * failure to trigger a reset.
> +	 */
> +	if (fence & CT_SEQNO_IS_UNTRACKED) {
> +		if (type == GUC_HXG_TYPE_RESPONSE_FAILURE)
> +			xe_gt_err(gt, "FAST_REQ H2G 0x%x failed! e=0x%x, h=%u\n",
> +				  fence,
> +				  FIELD_GET(GUC_HXG_FAILURE_MSG_0_ERROR, msg[1]),
> +				  FIELD_GET(GUC_HXG_FAILURE_MSG_0_HINT, msg[1]));
> +		else
> +			xe_gt_err(gt, "unexpected response %u for FAST_REQ H2G 0x%x!\n",
> +				  fence, type);
> +
> +		return -EPROTO;
> +	}
> +
>  	g2h_fence = xa_erase(&ct->fence_lookup, fence);
>  	if (unlikely(!g2h_fence)) {
>  		/* Don't tear down channel, as send could've timed out */
> -		drm_warn(&xe->drm, "G2H fence (%u) not found!\n", fence);
> +		xe_gt_warn(gt, "G2H fence (%u) not found!\n", fence);
>  		g2h_release_space(ct, GUC_CTB_HXG_MSG_MAX_LEN);
>  		return 0;
>  	}
> -- 
> 2.41.0
> 
