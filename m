Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A33C0C47073
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jan 2024 20:29:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7618010E681;
	Wed, 10 Jan 2024 20:29:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA15410E681
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Jan 2024 20:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704918543; x=1736454543;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Bt5QAyJiTrhlBK0hze+lEo5w7QGN02cngkMEINFx3gc=;
 b=HdMljTDCK4ePwGd2vRGs5pT/K4jbMbBeOekRWrw7kGin/NIwpQt5rrJ1
 yjJjfJf2HYytMTFXl8dki2vQr8K6sq43L/APrcc4af41VRQ+hz4SnaCCb
 265DhkoHLcM0oFrLwVp3chQ1I+lIoeJurGJxX8bzBKnrDofviMPMzhIPT
 fupD6uFmGyWPVTNC92MbmdLg3K/RNtEwHjcTOn2EBopwGT8pLIKIPSP1o
 VBJE6Qs5tHna5DBg5xWxvciuKwXfPDaoIGuQHvrfj5oJ5TarSMUZUeRHP
 KxI/KBsvxop6bLpvZFDR4ZJ2TtNCHQRbQybIqdqRRMrY2hsLgjVP2B9Mt g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="6004652"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; 
   d="scan'208";a="6004652"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2024 12:29:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="30721968"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Jan 2024 12:29:03 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 10 Jan 2024 12:29:02 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 10 Jan 2024 12:29:02 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 10 Jan 2024 12:29:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HiaX8T0Pg+4Kt94e0j5qeeJWqh2hkNfQQrYxt7XjwPF6YzT/9JqOtY5Ng1TOlTHHC6lBh/srCYu9nNb2TP3L45cnqd/ieoJK3tp662MBkBW+1QyCL93NNpPZZA7SSTRaNvIm/bnJVf+cB124Sqxi5M60Qkj/Ab+6KTFko5iCtGYYfzJyX8pMdqeunn78ucGV/RyqgpXfUNQPzwTF1EUkvKOmLMjb5n9h/czstb9KZ3Klz8LUMHueqFRSvk7gO6oBvptdyIhve0wqEWB02jULr+L/dfGt86N6yOlykjmSf+yBhcIiPvFpXRMj+GvX5iFBKPSuXmGyl0wp8374cKrgSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PjsWRW+Q/NGT8NhOWE9asy2Bu0RBqLT1FYzNiosnLHM=;
 b=O6OZZR7DAB1d2JQhNwpsZZNMGHoarBUJSs+a2L/GhcgWXOR19eIfdttCOH2/47LOJ9Bo+SrXRNds8VrxmQ6EvhlM96UeTqHNCKX3Wndf67CKu7Y4RNyA1wRPcN1Qcs2srWoNR+uTo5+jczjRyQXrP9kQZEmyW4znqGbQyEJoKhLhGI/VNtw5Q2o4hAIpOC1v5cM/vgGNWEREoi20JtAEBaHCnm60c/VAWu6fcIrdZTg3mEfkjvw8fsO3ljq4MtAssHhIx5kQNNDqCXt4FKACkiyHu7wTQAob2KOkgypDSyIsCoYpWfP0n57STOYSndtflnoES4OzB/cZMHIB97xaQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH8PR11MB6904.namprd11.prod.outlook.com (2603:10b6:510:227::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Wed, 10 Jan
 2024 20:28:59 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b%4]) with mapi id 15.20.7159.020; Wed, 10 Jan 2024
 20:28:59 +0000
Date: Wed, 10 Jan 2024 14:28:57 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH v2 3/4] drm/xe: Add build on bug to assert access counter
 queue works
Message-ID: <am6ua57ne3fvv7q3gdpu2pf6v3ujwnagoylj4nqsvjaztuxg2b@c7afrht42bfn>
References: <20240110012439.1400618-1-matthew.brost@intel.com>
 <20240110012439.1400618-4-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240110012439.1400618-4-matthew.brost@intel.com>
X-ClientProxiedBy: BY5PR17CA0007.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::20) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH8PR11MB6904:EE_
X-MS-Office365-Filtering-Correlation-Id: cb20619d-5912-453e-bbad-08dc121ac6e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7Zt25IF+ePz9y5mS9Bckjt7pHkaqIyRpLMN1lWqzQ0XRbR4NuhB1tIxblxqLg0M7SvHE/dUtFDjr21n91LFwbW2efPu76tx2JBbXZ9/83Wgxe7InVLa/RmF3or3TJmCxVyKQsQpVL8BWP0gaWKGkf8TCVNmfFAqfMmHUc/o8AhHRYsX7fjjMdAUkxy2fzURMi3G2aBHOxp9IiGoCx0P0CFlQvqzgUDKluPdH7Ah5antdNkhRHj0wVwYoOy/NQNo5gsdXp37eDWvc57jzTC0HdAFqnCNDNafLAYLxmmwIyUbG9EepbWE9/aVDowiVJ0/W1gs1QemC6wpY99us80DI4zJX54JAje8CTc0AR2qSn0I9WkK4TJlILWfM78pf6wxjNmQslfPW3dm0bYCOr5k2X1f9h20fpIROskCDwyKx3CIPmZDsSFHggXVdMqoroQaog7EOZ52vq5H8o4Uftg4kLvGp/sfef0n2hKJgUHeknke6pkqwEVlzB9DbRh7cql1fGRKq//A8HFL1sPzSCXSl1Z1qxHsPNhrzqEAxAJwwfjoYBHDSgTdij+SJ0lYTrOrO
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(366004)(376002)(396003)(136003)(346002)(39860400002)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(83380400001)(9686003)(33716001)(26005)(6506007)(38100700002)(6512007)(4326008)(6862004)(478600001)(8676002)(8936002)(66476007)(2906002)(6636002)(6486002)(5660300002)(66556008)(316002)(66946007)(41300700001)(82960400001)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?l7O0pdgC/Wuo9ToQvJyZWy6UYqq3G+ilrQGx0z1w4T2HQl/iIz4Tzr5OeE05?=
 =?us-ascii?Q?4Uaf2/ikkE18NrZYl4IquZkMqz9hgMvSthOKlv6wurfmsiTQGWaJcgSjOtY9?=
 =?us-ascii?Q?B3lpg3LwPy5UxAEA1ocQQEvIzjq6GahORlaoOApbhOqEdEqz3w1Sk846JMoG?=
 =?us-ascii?Q?Qx+9Kb2rMCpH176XT57Y0v7CmRqwbGrjruSbGcWnzsib4itXl/PFjoSPxyCP?=
 =?us-ascii?Q?pND8Ql5sJiaSUxYsrxtn04f+gwPShpnaFdg2H+qjAdwqv5OqYjlOnyVJEVp+?=
 =?us-ascii?Q?7f72aVTJ0KnfowNm5baZ1RMiX9OeNcvGal17/vE7ReXwMkUX3qd6Ghwl+0G/?=
 =?us-ascii?Q?gzMvqwtaok2RjTE/lwyI0y7bS5+dadjRa6c/CsjqRyIDK+Xwy2xAXUMDhMkw?=
 =?us-ascii?Q?8HdgNIo9i1efGCTUwHWK4nQiS4K1kLhPKgI7Dr2+ck0cZgXdNl6YY60xkX93?=
 =?us-ascii?Q?EkDoLQJ1db63SZ1jT+GjerxlvCKn4LEVwLzWi/W1LUhECFwbj7MbvtkdghFF?=
 =?us-ascii?Q?ddDlRNutG79nvpS8fiFBaBM5AcPEXZ8VdEwuG2QVm7Y1QW+BNeAEcLRJxLk9?=
 =?us-ascii?Q?ux7I8ssOh2RVQ9FIGbIRORKy2cSktu3SbrK1IKgb5oDyrFhAC52WY48RgisB?=
 =?us-ascii?Q?zKiFB3mHPmaa0Cg0cvWCdOxqvjjJjYW81KdOImyPNFv+uJ7K+3LsbAkT/z3e?=
 =?us-ascii?Q?d2hgaIJPK0hmTHVtF37cH91tsOhH0G8oPujRYJrfYjbUCDR+LnWDtQObvKYg?=
 =?us-ascii?Q?3AOkSjt1A9mALTylqECUcEmgGI+wfGwMNVwzTTyYwN6wPryEFnqEwUjpRlOu?=
 =?us-ascii?Q?oaLX9P3NSjWK9yTVK6zT8AUXVIaA+HXxYR4agYRLzmqz2KC5T76e5V4p9Bdt?=
 =?us-ascii?Q?EVyBt1OnC8e1/ixL0qLVSiqeWXAIz8LTsfn+raX6LIoyCXarfazmt3MlKiLo?=
 =?us-ascii?Q?M9m0EluGIKPjaW6SJR/ZyDS6oPbGQdK5z/zEJg8SNeO832tgOLSOGpd4QBIl?=
 =?us-ascii?Q?eJqPWpUg8UStBv8009NtT8X+TmRuGmy7UjGyCu8QTLGm5DlMuii6M+5bEs3i?=
 =?us-ascii?Q?3lDhlOWs02I0vJ3ynuYV8p5svbwT/1Eey7ZEeboXVBzeq1IVVzjLE7h3nutl?=
 =?us-ascii?Q?FYcMRNw4cYKzb76iFpjF+9H9TRLbo+3RnS7waILMuCnGm09rcEX2SiUNoXWO?=
 =?us-ascii?Q?72/bxfF0iSfJ6toRkDkF1IvsydaZun1ToTHutBFygASqBjC9ikaB9uuUEeS/?=
 =?us-ascii?Q?VF4FDk84SOTxhOxE9C1nchhzkLtPD2r5+MoZMpGdVtwBEhWH4zwAzoDOy+Bs?=
 =?us-ascii?Q?l3SyoA4b8bNHovdCT0VLxqKxvFAds6nsCB4+cCpyLYCdPn3xfJurQaPVTLMx?=
 =?us-ascii?Q?m4OOAkiwjNVr1nRRx2PARYKvbZexwbhDGm1pup0i2n6bdDrCVof/LTF2tR+X?=
 =?us-ascii?Q?ynfJBliVzjFlH29eO/a9GjzoOQnq/yrilR1RalCb4JxW7208gioUC9f0ytZd?=
 =?us-ascii?Q?KjECe9MWVmKKuV2wySeiCSXmP7nMGMzVFu8Ny4HNtN0573M2w4r8+HXDah+i?=
 =?us-ascii?Q?fZNhm2I7AF9GcvQvRJJ927uxVt/hnx0O2EQkSvhSdb6l+3O9gJE4fAs10O+0?=
 =?us-ascii?Q?1A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cb20619d-5912-453e-bbad-08dc121ac6e5
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2024 20:28:59.6904 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n9kIINroxtWC0b5OJS1/Ou18erDM/gUoXZ09R7ErngcYK+7O1vXqG4XTjUNcF8CLZAhJUe1DrkHXqB46L3vpPLIwl4IxMYpH05nvmnIO1+U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6904
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

On Tue, Jan 09, 2024 at 05:24:38PM -0800, Matthew Brost wrote:
>If ACC_QUEUE_NUM_DW % ACC_MSG_LEN_DW != 0 then the access counter queue
>logic does not work when wrapping occurs. Add a build bug on to assert
>ACC_QUEUE_NUM_DW % ACC_MSG_LEN_DW == 0 to enforce this restriction and
>document the code.
>
>v2:
>- s/NUM_ACC_QUEUE/ACC_QUEUE_NUM_DW (Brian)
>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Signed-off-by: Matthew Brost <matthew.brost@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_gt_pagefault.c | 5 +++++
> 1 file changed, 5 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
>index 3ca715e2ec19..13183088401f 100644
>--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
>+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
>@@ -629,6 +629,11 @@ int xe_guc_access_counter_notify_handler(struct xe_guc *guc, u32 *msg, u32 len)
> 	u32 asid;
> 	bool full;
>
>+	/*
>+	 * The below logic doesn't work unless ACC_QUEUE_NUM_DW % ACC_MSG_LEN_DW == 0
>+	 */
>+	BUILD_BUG_ON(ACC_QUEUE_NUM_DW % ACC_MSG_LEN_DW);
>+
> 	if (unlikely(len != ACC_MSG_LEN_DW))
> 		return -EPROTO;
>
>-- 
>2.34.1
>
