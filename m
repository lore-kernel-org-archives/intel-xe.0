Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38FEDC7EE25
	for <intel-xe@archiver.kernel.org>; Wed,  7 Jun 2023 04:58:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0729810E423;
	Wed,  7 Jun 2023 04:58:44 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DBD410E421
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Jun 2023 04:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686113921; x=1717649921;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=rvaui2HSM2gHgJl3Tk8p0Z0lWPWi1xiye2M7CsD3lXA=;
 b=lzkyJpuaqA3lnQ7LsxeqBPVYLT9tdulhiUIQXZWU8ZSNfefZ7HKEsfMg
 TFU71M3Iw/U6oQqqXqP5B5DfglfWe6RvvSXhiWo0lf7UYt4dDAl5S/Zf9
 +BViFav+KBpS6SGqoooGZy1xaP1Lg2Sn0Wocy5kDoB84rc9czGS6BXr2o
 lsCOCLXRLPJLjxL+9bhbky5lxTZsmvbhiGcDq6+sDIvTQnCZlrgMrMJYf
 ++s0vOqHTL57Dozb2DXKzmuSC1VyPO83F6uSvn+vXEdGQ9Z7QWhCSKbcA
 dn+YCFGI4pgTSHeM8XRNMtlSFgG+7P1qWQB+KU50SVoowJ9f+x3gPLvmK A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="337241551"
X-IronPort-AV: E=Sophos;i="6.00,222,1681196400"; d="scan'208";a="337241551"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 21:58:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="833503504"
X-IronPort-AV: E=Sophos;i="6.00,222,1681196400"; d="scan'208";a="833503504"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga004.jf.intel.com with ESMTP; 06 Jun 2023 21:58:39 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 6 Jun 2023 21:58:39 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 6 Jun 2023 21:58:39 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 6 Jun 2023 21:58:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H547+KvnBUhxOYnWrDO4p9CAOTxFBY2ZvLUne8jLEzHP3hFuHAexDMN+uHnweGO4nkIcMW+tOUfdlyb7/R+WkbvPtmFaMan9Zqk8s7+OwRdsvr9W1nxLxUz1iVUar2tBBuU4cwhTOUvjHq6RTwiQ8495m5WAlKmPItWo64C3ivA5F/UTaQT3+IzpAVIaBsuc5vT0PTXTOYX84w7zpdj9VKbBKi+yhOmSBnWAq3bKcXzOUYOwzxrDHorLJdslSjfRv/Rp3hFbtfnLMjTolcG7YErm2aHszCSkuGEsQKRkLgTS4XTN3C/yGy92hPrkiROj4LO4ocp6Ccs1B++eMdGtkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Xb07nHyOF5WS7VoTE1FlwzMAcGRhtFAJ+4x85K4Hpo=;
 b=d+wL3V26z54Gkf7fITNXjJjlWNYwyurbwrH/aHH2DzJtmt5SFKEDBWWIPy+9CpHA3rCuzYvcUu1F1tbTg1e8nTv3BwcfVz6VTOA+XfxHeSiRupXmXCd6TsYLYp539NU85V92Qduk4Z8yE9louKgveWT6cNIrqMvZ47TFo1gwkm2j/m/XoUqvEEMgb3dxkmZNviWNZZVM1BuJTetoUbxBV8kYoyrHN/STWmMM8087+WFQTpe3UnxCt6arHNPYK5z1d5Z2pz6/HpP6mLgfRtzNC7zlbyBNxD2DLpzagXLNuQ7OAjbuBkQa9Ld8L1R265ckakRo4hv+9uyGrD5Mqbu+DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS7PR11MB7932.namprd11.prod.outlook.com (2603:10b6:8:e5::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6455.33; Wed, 7 Jun 2023 04:58:36 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%5]) with mapi id 15.20.6455.030; Wed, 7 Jun 2023
 04:58:36 +0000
Date: Tue, 6 Jun 2023 21:58:31 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Message-ID: <ay5367nkebvpxhef5477ozdejitfhorpr4irfga6ku45matwc7@y7qblym6lcfp>
References: <20230531152338.6-1-francois.dugast@intel.com>
 <20230531152338.6-2-francois.dugast@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230531152338.6-2-francois.dugast@intel.com>
X-ClientProxiedBy: SJ0PR03CA0115.namprd03.prod.outlook.com
 (2603:10b6:a03:333::30) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS7PR11MB7932:EE_
X-MS-Office365-Filtering-Correlation-Id: c64524c2-a2e9-4c1f-7cef-08db6713d988
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: okBvdrJi83KlULXmdsEqsrvAhyqbr4R29nzkdNt+sWewnP0F8vwMOZglXsLtAattNKAy8ln5tD4rm0UM9bORrbpFxRtueymg0IDlpqxqFFV8XIodHTzLoocjrroFbMZnjtrNDBwG+WzzzuCWR7fxshLwfTEBDDxKQyKUgeUXJDO4fl9upsnQ6PVc4ZTNxN1fE+VFliYUSujRDZ1IClPtNPEUG9J0qHWDTQpEQEeOfMaL7H18g00LSEKDmznJ3TP1JGqDCHHxX301G8TLRWPwCUG2rWGRi+Xa8FK8RjzVNI/tMRR4iMQP6huWiNZIV37rlygsScsv+IdL5YoOXO1L21TGsmDkKtepgOkunYptWCAldKau0qEE2l+1tGGtMTY7jXRKoBolm/WfC6vOaufNvS+pG5CvT12spzmXbr00MpVsW7R7eUr0AmTpoSyS4cj+BGjER8WVHtNjUM2Ur9qixo9V6SXmb2oGA0uiQG8QVc5B7XN7M+/L5AD7ua1pDj8Ekc66sdrvLPwysK/tLNAHSQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(376002)(346002)(396003)(39860400002)(136003)(366004)(451199021)(6666004)(966005)(6486002)(83380400001)(86362001)(38100700002)(6506007)(6512007)(9686003)(82960400001)(26005)(186003)(33716001)(8936002)(5660300002)(8676002)(6862004)(41300700001)(316002)(2906002)(66899021)(478600001)(66946007)(4326008)(66476007)(6636002)(66556008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?b+JUAFD5epBOse1Ucka+Gsyz7kGL8E7gtb24i6xb7govtrfMFJZELWHMTB?=
 =?iso-8859-1?Q?lJg4P57P5m41/3RC19ofz7E1CGyGtzmpHXvBe+nNOo4xkjHqBTXg2HBeeG?=
 =?iso-8859-1?Q?lGKa1DQIrapFJxqeNA54NCUJdd+TmyO0J4TlB07Qg7gWnsJeN/fMqO24yN?=
 =?iso-8859-1?Q?vrg2iP4IjO83SxrCJwo5ebJeWMLRX+mbXqyFqgkMLN+BWmCBBmslljtuWj?=
 =?iso-8859-1?Q?yty8JDv0Cc3vJdquA1VsYblMVdlwQxCq+Qh3olfpDvOwkePEqjKKs9VXE+?=
 =?iso-8859-1?Q?phsYxJhRfQcnnc74tFLMYpM1rBAPa2kVgNu0F7l/feoJ7yYyugDa/T8glG?=
 =?iso-8859-1?Q?TeYmXX6oufDBImTmxfxqyYy/5qpWkwsl93eObzpHnehrQm+IUPtS7uP/XL?=
 =?iso-8859-1?Q?UNEWUmwPzeXkhv8iRuKiPnzmbZ6D+0MnJCj7Z+eJiwn9QMKPgu+EXf1xLa?=
 =?iso-8859-1?Q?/Y/L/GgfdxgPpy+LxpSdmRoDPs0VcnXL+MwXJbFjOCgmG4eMpK5Rya7CCk?=
 =?iso-8859-1?Q?bxrSyWg/mMq3SUocFJaxpQJARtFJzEH9QZMtAxL1SW9Iqx9YtLxrVVYcj0?=
 =?iso-8859-1?Q?pLk2wBzF6LyX5+qyj8ULR1Ee+ixKY/CegLSGYBYPA2UAEdQnTL7MrGd+0p?=
 =?iso-8859-1?Q?e688gIoNwBQgeTXNqt/IokFVqj7DmTPamPD2fc1zH3OCxQKS+CQpq0qOwz?=
 =?iso-8859-1?Q?JzignZKV9p2ULrj3Px9/y5mcKF+bOucrS8Ux7Hps163PDeN3uyxn0SZree?=
 =?iso-8859-1?Q?Jfrwp6BuhfhtMnQKc/i7y4PFYOhG4c4VN6Y7BObROyopLxGVtkUtRWWAH2?=
 =?iso-8859-1?Q?ymrLJZf1WdCPgmcy9Rl6fLJ6h4a9/FXGiDflv01nYyuCZCOeBIQfVN69fD?=
 =?iso-8859-1?Q?qO7uUi/joWU28JqvlEvpllCfpj9Dvni3UQqDYTjMXuK9fHggun8q0NbVPm?=
 =?iso-8859-1?Q?VbhJxOA1wLBkF8y0M4unzsTk2N1uOcf/OX63R7P02n1E6D+VWBIT2Z8+4W?=
 =?iso-8859-1?Q?Fq1tOBO/YAAcT/x48XUQg4lRQkB6d3IWzEGlxywcoh4rrFRcLtFrkFxw4a?=
 =?iso-8859-1?Q?ZUPQ7KvS0w9sfddbcUQ9K5P7VBQ8QhIz+RTxWe/04+xjehoCPvsCnl/sBN?=
 =?iso-8859-1?Q?6Ujha2Q4Y/bRSdigPIxGeLC0HHLsGsGpfyr9NgSDO5FdE/vsmFoNiCMyB9?=
 =?iso-8859-1?Q?znjCtJysA8PSvu0JT/Ryc2aRVZG113d5sFwN78IDd55m3oZRAK2QCJuUKO?=
 =?iso-8859-1?Q?MZCgLFmonfcq74gP8tlaqDL6IadgXv07ky95X+iumH3qX0Y0n1Q+c2L+An?=
 =?iso-8859-1?Q?zvbC8tAbE7UXgXgvQts9XCZahTu4q63DifuQnUnC3vsunE2wUwQJRI6E9F?=
 =?iso-8859-1?Q?5VOYdyGzcZZqgomDA0i2E6MRN3gqYOms/ei3K1RgJUJbgWMjRqkQeRW4B5?=
 =?iso-8859-1?Q?XxSjLmeYAagUAn7x8RfJcDQB3H2Dcm/GvMGmMwbGMbYmYBp1Kv/HOPho+l?=
 =?iso-8859-1?Q?tEx21a43TmfU3pXbqP2gO6bh4uG1GKwhyOgRV6zYKbi8KHHXmxQFjEHeLs?=
 =?iso-8859-1?Q?eOD8eJz8Or+3N1guLrnji7q/JHIe/RA01QyXF2FKk71wFOyTylN6L1yd+T?=
 =?iso-8859-1?Q?01a1RKw8zzbSMSERhmphiA/LWo3PJlZC+G2uxlmH15lnHJNEUcgUwg3w?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c64524c2-a2e9-4c1f-7cef-08db6713d988
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 04:58:36.0947 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xf3fuvleZIjhK6vQ/CoRuuoqmg+gx2aQmfq68AUZFzznQSHIfzomb0AsjfBM/wKn8ljuYbj9pK/BhxuJbtfuXu6au4lUX579PQlW+zmlWt0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7932
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 1/5] drm/xe: Use SPDX-License-Identifier
 instead of license text
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

On Wed, May 31, 2023 at 03:23:34PM +0000, Francois Dugast wrote:
>Replace the license text with its SPDX-License-Identifier for
>quick identification of the license and consistency with the
>rest of the driver.
>
>Reported-by: Oded Gabbay <ogabbay@kernel.org>
>Link: https://lists.freedesktop.org/archives/intel-xe/2023-May/004704.html
>Signed-off-by: Francois Dugast <francois.dugast@intel.com>

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> include/uapi/drm/xe_drm.h | 24 ++----------------------
> 1 file changed, 2 insertions(+), 22 deletions(-)
>
>diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>index b0b80aae3ee8..ac3cfc1fb4a5 100644
>--- a/include/uapi/drm/xe_drm.h
>+++ b/include/uapi/drm/xe_drm.h
>@@ -1,26 +1,6 @@
>+/* SPDX-License-Identifier: MIT */
> /*
>- * Copyright 2021 Intel Corporation. All Rights Reserved.
>- *
>- * Permission is hereby granted, free of charge, to any person obtaining a
>- * copy of this software and associated documentation files (the
>- * "Software"), to deal in the Software without restriction, including
>- * without limitation the rights to use, copy, modify, merge, publish,
>- * distribute, sub license, and/or sell copies of the Software, and to
>- * permit persons to whom the Software is furnished to do so, subject to
>- * the following conditions:
>- *
>- * The above copyright notice and this permission notice (including the
>- * next paragraph) shall be included in all copies or substantial portions
>- * of the Software.
>- *
>- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
>- * OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
>- * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT.
>- * IN NO EVENT SHALL TUNGSTEN GRAPHICS AND/OR ITS SUPPLIERS BE LIABLE FOR
>- * ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
>- * TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
>- * SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
>- *
>+ * Copyright © 2023 Intel Corporation
>  */
>
> #ifndef _UAPI_XE_DRM_H_
>-- 
>2.34.1
>
