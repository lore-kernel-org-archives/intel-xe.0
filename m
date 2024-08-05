Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACABDC3DA7F
	for <intel-xe@archiver.kernel.org>; Mon,  5 Aug 2024 20:20:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7582510E2B1;
	Mon,  5 Aug 2024 20:20:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VcvdKcVi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D17BC10E2B1
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Aug 2024 20:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722889252; x=1754425252;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=FHfPfh3xzi7zDIjR/e1bWN5jjLpbfFEAVPmUYhnMh+I=;
 b=VcvdKcViyo55jTD9Y3GacPqXB21Psqc+8Xl4XDV1E9I+10eFqDk0pYmI
 7mgSK6NKrtgCOSlUNtTj26EsRidXQ9Zr1X6QUtwQyGYDXeJbfJXo62U/s
 FIAz2KnEp8XbcoexyL2+VnYLKlmVmXrVmmrDSlnrEvL4RAtf4hwyGNddc
 LoB4C5Qjh6DrKq6c3Lbgx57EV7i11wyNhZZQxBLjc70J+YQ/SCL6ifbKc
 b66XpBVxSsUKHbvPYnTEJsaOMvJpAoQNpspsUOU+Qjrv35fygrzRKhEac
 PpIJx7YB29BRPHvbCXAfUqBglCvSvDatdVTQSrw6d3T462kAWSn1vY8yr w==;
X-CSE-ConnectionGUID: Tcqn14iMRTSgV79w7ytEJA==
X-CSE-MsgGUID: DAb28lCKTK2v6WdRF9/9tA==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="31510183"
X-IronPort-AV: E=Sophos;i="6.09,265,1716274800"; d="scan'208";a="31510183"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2024 13:20:52 -0700
X-CSE-ConnectionGUID: XznUbebsQBeP1wyjhTBe/Q==
X-CSE-MsgGUID: 0WjUhHvkT6Sk7FmT0eTkQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,265,1716274800"; d="scan'208";a="55955613"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Aug 2024 13:20:51 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 5 Aug 2024 13:20:50 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 5 Aug 2024 13:20:50 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 5 Aug 2024 13:20:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EnwDAt+kj/cjv1iI0OfIg97UWtUNmbVPx4i4gntze6qNSuZC4wrGRPq0FKJZnjEAIM7eucgNZ6eEQ8p7g6at98KCgrQaKccw/pZidVhMaGbhv/6l8tZR+ZitoBg8YMKTaUoRk1hFa11TI6vHO090vUchvGIxsd1b2fU9bVAZEf4jZaq4An0CQRJudE29IxklYT8bnKvrIcJxImYc66QyCZTlW1rqvu9aigTpKx5mK0H1BecdArMuk2iMWU5loUuYDWzANEFtWlllCTxZuAnPo8Jv4++wobiC4D1bNiBl2eEaY3/YQUw7hjenU8cceFbW4boamCcISJQYTuOJ0bhV+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IrhVNt4AN5pkDUQGLNw3KbdXLgJxZu3CS1ri9u086/4=;
 b=dLFvorXcG29nVuuG2OUxkveUKAyp8MMzEt19wOGDIczAIdHmGLK33c5QSuwwx3caeXKQ8JMhWLs+/hXjmFS1FXWLgTwStxYq80/vW/FHCj8vXnaHozgKY74WuK6cXsXQhwqgDGbbGFpMoLdDSvES/iY+KS+53ZseNj5P516RyJS3tI2L3j0H43BhEypMuW2Mvnw32iaKC1QEg5SlKvwFJmCph/KIBEbgpur2RC1+IXIg41ApaOXzR9smwMma9rg1r+SrFbJAwsu3/Wz6gjgONWCyb/Y90hysYZmpTXtwfoadzP0Uv/4bZiHSOPtZdUIiQzTPAizkmF/VHMR14OB5jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB5231.namprd11.prod.outlook.com (2603:10b6:5:38a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Mon, 5 Aug
 2024 20:20:48 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 20:20:48 +0000
Date: Mon, 5 Aug 2024 20:19:38 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v4 03/13] drm/xe/hw_engine_group: Register hw engine
 group's exec queues
Message-ID: <ZrEzbbDavVap2E6e@DUT025-TGLU.fm.intel.com>
References: <20240801125748.355078-1-francois.dugast@intel.com>
 <20240801125748.355078-4-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240801125748.355078-4-francois.dugast@intel.com>
X-ClientProxiedBy: SJ0PR05CA0152.namprd05.prod.outlook.com
 (2603:10b6:a03:339::7) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB5231:EE_
X-MS-Office365-Filtering-Correlation-Id: 008c0a59-901c-4837-abfb-08dcb58c17e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?SbQvGdfIu0ifIA0R6GnvDEOTbV/vSb8pJkwSGmTBDkPuZEMqy3arZsNntjWj?=
 =?us-ascii?Q?3b3U6eLxHbJCeTmJ6rlGjSIKGmSwoDbcc30e5on6pz/B/dD+UPYvpIgvV1Cm?=
 =?us-ascii?Q?jABxGaCl3g+NbFT1835F6bS4IOFLVwq4ISe2OW5VhHvNXWt+vNCw6sCC9Hjm?=
 =?us-ascii?Q?Zp6iPINJx4elkFRbeaSolzUPP+0E8c9dU0UCkOugym6C4TOrw5bUwrMZUcc5?=
 =?us-ascii?Q?KCilRml8qF54kjwNKvB8yxVmhczMwGhKiTReKR+knWlssrfMxMww0f603P2y?=
 =?us-ascii?Q?Q9e6WY1zMr3ok7pVDj7WrX8ljTEy6pCNMKX1aVSaa/N5toLxnWNuUfKIrekx?=
 =?us-ascii?Q?HzQ8g/kT8GjDRWuHBoqUnnl6tPJPZsl9SbKfl0MLhN1mY5H6CNXkvn8iK8fH?=
 =?us-ascii?Q?yffJntDmu1rdsXUXCnkKfPnwUFqgNbyyMWL6Kr12C/cBVnrVRp72DXYAVMWM?=
 =?us-ascii?Q?s15qmGnfICiW5p9r7OEdWF7nk56IsyrPV3MAPjLLBc7pzUQ83HRx7+K8ddMC?=
 =?us-ascii?Q?ack8+2+4+i1TSekvZ6cM4pzHdB0QbU8Q/37FMozkomEPfdC2mNGjDZXleNZx?=
 =?us-ascii?Q?6XHSkxA+EfgT7IP8OQAEBqrZ5M4169HUh/k0T7WrKmzoAu/O9bzfbMNOAJtR?=
 =?us-ascii?Q?E+J54PQtZiyke7U7Q1BDlgw4G9JNic/lxj4FzcQ8IbTSl8y6rKTRvt5Un8YS?=
 =?us-ascii?Q?5NAW51ws3ZzmyR2Q2zMN/Zg2Zq5923o3RhK54FVUehwwHDjOoyAERIaZtLiZ?=
 =?us-ascii?Q?w5hj8q8av+CAlpWcUs4wxlZJYq1Xw/Lh3zBuDkNvhNZ19HQNk2xiDop8SUsA?=
 =?us-ascii?Q?rcHwJ5vSBJ7AvPp1Z2yRAaEQ/Bx4MCnWYcgB2m4ebDAVfMZIeBTxZQBFMtPw?=
 =?us-ascii?Q?X4fNJCTSZd4pin6Qdpnt9WuKsf2w6zEFVlR2r/8QBYKSe23nELdWmLs4uCx7?=
 =?us-ascii?Q?fFASqcS7uiffIJqjPnHyMGgP2aHuEbmnxFk3Yl/cZqtHJTTKJQ7wq+n+AnUd?=
 =?us-ascii?Q?sdkyaYhmOI+OrmK4VI2GFVXyZvVgnh3zkWNi8YB3uTpGl/4yinJ82O4GJuRP?=
 =?us-ascii?Q?DnKceE+yhT6fyrRl++t8sKwSvtSaV9Wk8XZIOC9HrvQrxKepiCp4hsVX9msg?=
 =?us-ascii?Q?AKsXBN+er6HGyIzKtFTINUCuur9Ep/Sb169MExsjGii/u1q5RGheK/3pZIzh?=
 =?us-ascii?Q?HIiiAAw32RzOALI8GP+HKxDStY669BKN57zdoDj+3swyrGzT9pdLxJ0CJ0F5?=
 =?us-ascii?Q?dObJPi3wC8p5ai6i7gM4PZncvJpLsGOHR8FYOJTIrTO9h2/Kpe0RH1FldvAz?=
 =?us-ascii?Q?cHZ2iJ9Teo6eYOAgMuCkug1Xd86hL3zZkti1kqDYMiEeeQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bZg8WItgiX4teYrusNhESdIY2rDQaskE8knYRM8UvwHvHnxPBhLAZEcXtrAs?=
 =?us-ascii?Q?roWSb+DAkCPcOgyqC7UUChNwWE4jSpCA+WgqVj03Yms6XVb/c4sKdneBfrO9?=
 =?us-ascii?Q?RkML9VO2cieVAQetYGPqb+uQaI4SI8ePxrD5yNjKWvoKZQnn79ES4p3Q6c4l?=
 =?us-ascii?Q?6arv22q0IQgf5D9M7tW0XadB/wBE7O2kBv0K/ZCF0kxzXa0LCRBRL3i7BHSB?=
 =?us-ascii?Q?KFSwFUf/XBiD45/FlexlB7Gp2iaqCtq6HrEXwpf9DrFGyHDabhaKstnnNrqX?=
 =?us-ascii?Q?92kcGDiCefq4vs449AnHjUZ38nTXbAQyknK3OrOrFYsE+57wpLg3N8t+QQsk?=
 =?us-ascii?Q?Esr/vfNLqCCrArI+pXCKlkHIdJ5uNKhZwIDLemrCZwbPTycH1j1gjjXYFuHj?=
 =?us-ascii?Q?duTwMwP4CvnOvny+2KJNvg9NMWIiQauJyctEIpXqC8u3ll8ZZfOiFWlI8bNy?=
 =?us-ascii?Q?5vVNm+wvy2VYnlkvuu+LpmL02ASCxTfX3QBCdbfYikGjPKzavxn50MWiYdyz?=
 =?us-ascii?Q?hXdOs1VZghko03lZHka5M4r9n7ogYWjWG7N3JW3GQ27XGxwFGutjsT82H/1f?=
 =?us-ascii?Q?UYLNmpwm8QdG7bEJEeRLH7gwgbkePqfuc/J1F/SjdaRlNymIqcimnEyNf6Op?=
 =?us-ascii?Q?IJ1PRoZAqiPQ/7S3uwqabzSxH3UDemu7s+uITRzO7DKscf2eCLJnilfPUvOC?=
 =?us-ascii?Q?ftg9cYFcpHbD2yiYwlj9R/hBYnhs+Hzu4QD2wRFn6X1vMMdOSE4dLCxJ4mCQ?=
 =?us-ascii?Q?FEQX4sAjPm0BqGzMA+aDqs+1DI+rnfoDbHj3SDaod9rVyVORA/yqZDmBJZ0b?=
 =?us-ascii?Q?t74K1mJqX4yySM1xUGlXV0IxUCJoi+PCKzXMYJnhe4UaZKWPjrTqCpYLcKbP?=
 =?us-ascii?Q?Z6YpEtRBBSQJfpFAUuxjWB+5t/kvQ/aUUKKH5JEmjfnQj0YGo0UFZ3AIQJ3k?=
 =?us-ascii?Q?ZWIpCzZFx3vtlslV+3R7REAiDd2XrJhsD/Ai5SxtMQ17KwzlfS0r+0ljgjmu?=
 =?us-ascii?Q?U2hCcgDRYVPc4YPDjBG2XxGzG0jdRuXKo4itfnQZ1Dlb2R3frEorLUR1JDz7?=
 =?us-ascii?Q?EQnjFk/WyYf6cMhRBG6tPIopYlr9LIT+em0QhRa/l/iWys3kIS1xVSQ0W6fQ?=
 =?us-ascii?Q?3q0Vu/9f/7+n+H6ml8er1mauKuW28qy9Xr66+otA95Fp1OUiQn2pxPVDUBOh?=
 =?us-ascii?Q?WNaocUhLgI71molIofP/HhDcUeLCir3G7TyaX1DJnaddkTzANB0sF8pin5p6?=
 =?us-ascii?Q?ekLvWr2NN61aRQ7JDTF9zeHwJc1tq+mwPNtCeyfLngrNtaSQ3ejIep0FZzx8?=
 =?us-ascii?Q?pV6FP0qErmgVdDV68MfYvZ+1MmfjCY/nsom06L1ERKWr8ewrArNbT3GooMbL?=
 =?us-ascii?Q?ie8UEF4Ui6nVLdjqYZtZ3R9SDtacP7iA0lhvJDRc1M+fahNjFhvgwMlSGbGK?=
 =?us-ascii?Q?bNlexxduNGbONlOY5IOBVIiJCQsTpAP4t22cewMrqyhtXTVS51lrJ9Z7uWNJ?=
 =?us-ascii?Q?7t55CGkyDkUZnh4vPSrHF4sTYSW8H0xrTY+e5I8e1E5EN6+rLI0LUoP9YuHe?=
 =?us-ascii?Q?+CkDYDJCqTmM0QN/AvgwgTzRCuUaFiuBXrtfk+p6FWxLkHma9M4fqxxkAW7z?=
 =?us-ascii?Q?CQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 008c0a59-901c-4837-abfb-08dcb58c17e0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 20:20:48.1977 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FURWOGMLLSQnOIriesq6qkMPu+XkY9rgJTiIy4hXUpV3vp1AJpsuGLwJq43uVxn6gj0OPbHiQczmxCoCPh/dZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5231
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

On Thu, Aug 01, 2024 at 02:56:44PM +0200, Francois Dugast wrote:
> Add helpers to safely add and delete the exec queues attached to a hw
> engine group, and make use them at the time of creation and destruction of
> the exec queues. Keeping track of them is required to control the
> execution mode of the hw engine group.
> 
> v2: Improve error handling and robustness, suspend exec queues created in
>     fault mode if group in dma-fence mode, init queue link (Matt Brost)
> v3: Delete queue from hw engine group when it is destroyed by the user,
>     also clean up at the time of closing the file in case the user did
>     not destroy the queue
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c           |  3 ++
>  drivers/gpu/drm/xe/xe_exec_queue.c       | 10 +++++
>  drivers/gpu/drm/xe/xe_exec_queue_types.h |  2 +
>  drivers/gpu/drm/xe/xe_hw_engine_group.c  | 52 ++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_hw_engine_group.h  |  4 ++
>  5 files changed, 71 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 1aba6f9eaa19..447e9acbb570 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -37,6 +37,7 @@
>  #include "xe_gt_printk.h"
>  #include "xe_gt_sriov_vf.h"
>  #include "xe_guc.h"
> +#include "xe_hw_engine_group.h"
>  #include "xe_hwmon.h"
>  #include "xe_irq.h"
>  #include "xe_memirq.h"
> @@ -165,6 +166,8 @@ static void xe_file_close(struct drm_device *dev, struct drm_file *file)
>  	 * vm->lock taken during xe_exec_queue_kill().
>  	 */
>  	xa_for_each(&xef->exec_queue.xa, idx, q) {
> +		if (q->vm && q->hwe->hw_engine_group)
> +			xe_hw_engine_group_del_exec_queue(q->hwe->hw_engine_group, q);
>  		xe_exec_queue_kill(q);
>  		xe_exec_queue_put(q);
>  	}
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 956dc15b432a..77edb20aa21c 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -14,6 +14,7 @@
>  #include "xe_device.h"
>  #include "xe_gt.h"
>  #include "xe_hw_engine_class_sysfs.h"
> +#include "xe_hw_engine_group.h"
>  #include "xe_hw_fence.h"
>  #include "xe_lrc.h"
>  #include "xe_macros.h"
> @@ -73,6 +74,7 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
>  	q->ops = gt->exec_queue_ops;
>  	INIT_LIST_HEAD(&q->lr.link);
>  	INIT_LIST_HEAD(&q->multi_gt_link);
> +	INIT_LIST_HEAD(&q->hw_engine_group_link);
>  
>  	q->sched_props.timeslice_us = hwe->eclass->sched_props.timeslice_us;
>  	q->sched_props.preempt_timeout_us =
> @@ -190,6 +192,7 @@ void xe_exec_queue_destroy(struct kref *ref)
>  	struct xe_exec_queue *eq, *next;
>  
>  	xe_exec_queue_last_fence_put_unlocked(q);
> +
>  	if (!(q->flags & EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD)) {
>  		list_for_each_entry_safe(eq, next, &q->multi_gt_list,
>  					 multi_gt_link)
> @@ -615,6 +618,10 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>  			if (XE_IOCTL_DBG(xe, err))
>  				goto put_exec_queue;
>  		}
> +
> +		err = xe_hw_engine_group_add_exec_queue(q->hwe->hw_engine_group, q);
> +		if (err)
> +			goto put_exec_queue;
>  	}
>  
>  	mutex_lock(&xef->exec_queue.lock);
> @@ -797,6 +804,9 @@ int xe_exec_queue_destroy_ioctl(struct drm_device *dev, void *data,
>  	if (XE_IOCTL_DBG(xe, !q))
>  		return -ENOENT;
>  
> +	if (q->vm)
> +		xe_hw_engine_group_del_exec_queue(q->hwe->hw_engine_group, q);
> +
>  	xe_exec_queue_kill(q);
>  
>  	trace_xe_exec_queue_close(q);
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> index 1408b02eea53..315f874426bd 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -142,6 +142,8 @@ struct xe_exec_queue {
>  	 * Protected by @vm's resv. Unused if @vm == NULL.
>  	 */
>  	u64 tlb_flush_seqno;
> +	/** @hw_engine_group_link: link into exec queues in the same hw engine group */
> +	struct list_head hw_engine_group_link;
>  	/** @lrc: logical ring context for this exec queue */
>  	struct xe_lrc *lrc[];
>  };
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.c b/drivers/gpu/drm/xe/xe_hw_engine_group.c
> index 5ab08e86b085..7a43d6b77753 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_group.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_group.c
> @@ -5,9 +5,12 @@
>  
>  #include <drm/drm_managed.h>
>  
> +#include "xe_assert.h"
>  #include "xe_device.h"
> +#include "xe_exec_queue.h"
>  #include "xe_gt.h"
>  #include "xe_hw_engine_group.h"
> +#include "xe_vm.h"
>  
>  static void
>  hw_engine_group_free(struct drm_device *drm, void *arg)
> @@ -98,3 +101,52 @@ int xe_hw_engine_setup_groups(struct xe_gt *gt)
>  
>  	return err;
>  }
> +
> +/**
> + * xe_hw_engine_group_add_exec_queue() - Add an exec queue to a hw engine group
> + * @group: The hw engine group
> + * @q: The exec_queue
> + *
> + * Return: 0 on success,
> + *	    -EINTR if the lock could not be acquired
> + */
> +int xe_hw_engine_group_add_exec_queue(struct xe_hw_engine_group *group, struct xe_exec_queue *q)
> +{
> +	int err;
> +	struct xe_device *xe = gt_to_xe(q->gt);
> +
> +	xe_assert(xe, !(q->flags & EXEC_QUEUE_FLAG_VM));
> +	xe_assert(xe, q->vm);
> +

Nit: If queue's VM is in xe_vm_in_preempt_fence_mode you don't need to add it.

> +	err = down_write_killable(&group->mode_sem);
> +	if (err)
> +		return err;
> +
> +	if (xe_vm_in_fault_mode(q->vm) && group->cur_mode == EXEC_MODE_DMA_FENCE) {
> +		q->ops->suspend(q);
> +		q->ops->suspend_wait(q);
> +		queue_work(group->resume_wq, &group->resume_work);
> +	}
> +
> +	list_add(&q->hw_engine_group_link, &group->exec_queue_list);
> +	up_write(&group->mode_sem);
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_hw_engine_group_del_exec_queue() - Delete an exec queue from a hw engine group
> + * @group: The hw engine group
> + * @q: The exec_queue
> + */
> +void xe_hw_engine_group_del_exec_queue(struct xe_hw_engine_group *group, struct xe_exec_queue *q)
> +{
> +	xe_assert(gt_to_xe(q->gt), q->vm);
> +
> +	down_write(&group->mode_sem);
> +
> +	if (!list_empty(&group->exec_queue_list))

if (!list_empty(&q->hw_engine_group_link))

Matt

> +		list_del(&q->hw_engine_group_link);
> +
> +	up_write(&group->mode_sem);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.h b/drivers/gpu/drm/xe/xe_hw_engine_group.h
> index c2648f87f7ef..857a83787504 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_group.h
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_group.h
> @@ -9,8 +9,12 @@
>  #include "xe_hw_engine_group_types.h"
>  
>  struct drm_device;
> +struct xe_exec_queue;
>  struct xe_gt;
>  
>  int xe_hw_engine_setup_groups(struct xe_gt *gt);
>  
> +int xe_hw_engine_group_add_exec_queue(struct xe_hw_engine_group *group, struct xe_exec_queue *q);
> +void xe_hw_engine_group_del_exec_queue(struct xe_hw_engine_group *group, struct xe_exec_queue *q);
> +
>  #endif
> -- 
> 2.43.0
> 
