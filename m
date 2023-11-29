Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7C57C4167B
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 19:34:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC60E10E571;
	Wed, 29 Nov 2023 19:34:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8642C10E571
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 19:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701286464; x=1732822464;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/1ws7AmCvPRBHIHVJJOMgEJZzx7Uf84/9ZVD7sNesBQ=;
 b=EJIvZEHnha6Fx73H+N0HwtLPB0AR691jY8MANECXOzwps9KxaCbu6jLR
 1LQpCW3dw6aWsfTuZeBW5Gw4OiHhrleRpO0xkfoBiA8mwFuEmV2ewKfvD
 F5KRErARVBuMTNPH03W+4/+Rx7owpGxxYFoiX7dC2Pci7ZSlAR2mzZ1NG
 JllHfXgw4pOouByfefls6WZTqdsTE9Z1IDk81WXOT+KyeFeziU73CYToW
 lMFxSF5uXhVme2AVzZQK0sbAjtayJ4zHKSvsQUBJ7jrlyhnUjLMpl3Iz3
 K7IDvqpWwrXeaEHlU4oShkuYkyOH/iDnz7PmynNVVQJrFObY0N/DNIJvN w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="383609740"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="383609740"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 11:34:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="745368763"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="745368763"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Nov 2023 11:34:17 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 11:34:16 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 11:34:16 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 29 Nov 2023 11:34:16 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 29 Nov 2023 11:34:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nHkG8Ntxc6q/HwP0698fqxT4QgYO4FHK57mg7kwTn6wEdb81ZM0wN5oGqUWIAbqkfJd9wjrvJILasCMVjMASwigBSOlpAUFXEc5Ly4H5i+5HQ37nKtRRbgngtH7sQDVEghtgDNs0dVgaURynUeJXsEmb67cBZplAyVLbOwn10kIhwhgP+v7crbST5+oz7tvXbfSH/4IlsPNVKhMsHK1ynPOiWZ1dyvEl+1xEpYUqbKXWZkhIz4fRXTw14+4t9QOrjFzQ+Xm6fjGV0F1M+adaD+74hqYOqjjRgWA7rHyRwTVUnXx0W1pkIe/t8aKWddwIHcX71DdrjorxhsthAtnneQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pFIWIIkiTLqJaXeee1YWKjxOXw/Eozc4A+MtxJyufik=;
 b=Yv7dYJLY+w9AIlqDabJwSUfFAP0JX1N6C/c6/HInELYh9GlfJtHzIM9t2e+s7UO9PO9Qq0wu+dXx/lesOCojE1hkoHQnFaylifPDa8D+ZQyZXMhnuTxjXq9Xv/vHrZ+qpuStWBpC9sLkOSIPzrzevcJr1IEIdw9YjwtjY9WuW3XDJNBfBp7JaYKkN7NNqCLCN6RtqnkZf+msYqaG2bQ6lSfS8K4iXKM62zvZ4TZpLxlQRSL5Ahz98TZCsFwdfJlzofPwV/3/3dnJGF5Ekb5iCgfG5LKWV8daSGubFUFyZAzRoq6e8V+m+erg1xx6n2GqF2/yYTKx5a8UYyu1KGAQgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB5470.namprd11.prod.outlook.com (2603:10b6:5:39c::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29; Wed, 29 Nov
 2023 19:34:08 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7046.015; Wed, 29 Nov 2023
 19:34:07 +0000
Date: Wed, 29 Nov 2023 12:32:31 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Brian Welty <brian.welty@intel.com>
Message-ID: <ZWcvXxO5sLDgwc+D@DUT025-TGLU.fm.intel.com>
References: <20231128213634.3633-1-brian.welty@intel.com>
 <20231128213634.3633-3-brian.welty@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231128213634.3633-3-brian.welty@intel.com>
X-ClientProxiedBy: BYAPR07CA0017.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::30) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB5470:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a8a2308-f356-4320-5899-08dbf1122778
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: P/jenIBbZ1Og+gHT8kIwt5WIUd6VW4VPPaAdHvO8zStO/t5ULz3c6LH0dLcNEQcYvAAttRp6Qp5eAdr+cIEycqs1DR6aCaGhxoGeva7blQypuYLbWv14z2KNlFabufS9EgNTsA9EiPfIPASVm9XWDWjS86MRjOkUVXXDMp4K7THjxz1yUEWEEju+V0w5saGX03uTwUNpr68EZ14j4B59sNOPsVgpSy9vTgEgfxTMbDE8gFg9PhfGtAkTyVdDFcPv7PAko64bgu4lzrxpVPl5z6gUFradahW6493mdglv0UweqCbGyl+/4bECxsxSYgD8pybZvxrgiv1mZsuNLdwjM275A/ECKdjusodYSqAwvGEYEVtFtifhND3Z9OamTYt0sHSV/17qgX4XunXika0cOotFQ19wF2mmDrZWPKgDYbHXt3eNRKCe5RfHRsHDJVVBSyMKDblnE8edS6W2PHaJqojfPqdTQ/eg+OVVq9De6eef2YPvO8BAITNP3rfU9c/OuLqtIn2YtmE6aU/61wED21fngzF1Dh7hXPqIk/guN20pr2Yau7PFVdlz1XQrfAzFRI3a+FCwulrF2X4SfXecldjBe8QwdMNIzczCXnLmEe07hGW5gOcDlwO9QSYlnpZnDBD5uDLSkoS0GX3FLJ1zKA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(136003)(366004)(346002)(376002)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(202311291699002)(6512007)(6666004)(478600001)(26005)(6506007)(82960400001)(86362001)(38100700002)(8936002)(44832011)(41300700001)(83380400001)(2906002)(4326008)(66476007)(66946007)(6862004)(66556008)(6636002)(316002)(6486002)(5660300002)(8676002)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wWCj2fT6vYbDhgRckdOJ1BEJmOhuv+SDOqDHBZIIFCc9PL6zO0dN785D+1Qf?=
 =?us-ascii?Q?KulCRFnn+D1EPY/6y1R2b7QcxUg+0hpYg4endOgJ9wDUqSqTjfIaSCuS7cj7?=
 =?us-ascii?Q?rqpexaYZpJyQRnksrR9cWmIkpvrUlk0nTng1G6shmU0cOUniKJOcWuiEVlNv?=
 =?us-ascii?Q?FfgACiV15gN50EaLioRJlbf+24MbTo2fj37NS5LqV3c4c+1bhE7r58+9iSTg?=
 =?us-ascii?Q?UCoTueQ3T3GiiisNvNMtV3SP4z2qtYwpDqb8kvLONBaDqzPhuJ9N/S2ggKD0?=
 =?us-ascii?Q?q8ADZ/IVAlKos2hwlv8ncIFIAYoZb1kH/wKARUAiQCeCxsX239KnbNbEtk2h?=
 =?us-ascii?Q?ZycQNuFf5SsyRZ9r3pF5JPux8rGdhL1OQ1cjOKHMAVmuX/1FCmLZzvF97h+N?=
 =?us-ascii?Q?O3PABdu6tYJJcbmPXEJcdcoRjeoV2C2EYyIPVv+ywtZaIdgN7IiOic8RgL42?=
 =?us-ascii?Q?Pa2H2o2hau69JEmyLrxuekqzOWx7pBRPHEbky778bZgoScwUZO0wHJoqpTno?=
 =?us-ascii?Q?wuwZ3XYEPaK6EZKR44Q/Jo2ME3NkvD31h7J8xJ1KIBsKnzXERLu58C53hTxu?=
 =?us-ascii?Q?KqCrwkxgmBC44H+oGZsbqX0A3Ohro2Kk/D99X+WNg9HjHoVXNKfZz2KnV1jC?=
 =?us-ascii?Q?Uo13fxV3wHO55ylY+WsYTOdsmFFQDYFvX4wK0RqfkZfpX3FF0hUfBxHLAIRC?=
 =?us-ascii?Q?1HCIRU+4lNc3JHbm3QyZVlPAgmn/UXQN6kJvWGg3txaE5+H4jrXLYzgaluTq?=
 =?us-ascii?Q?foH7IXbqsfic4oV9EvInxQG1/HSpA8NBTB7IsfdqfB7Wvc78rzYmosKWqlrE?=
 =?us-ascii?Q?JaWxvsAeA7Hlnd+L/JpXubCOv56ab+xmYvfkfBSZPKsBAYYo80uJ6I1sLRr0?=
 =?us-ascii?Q?mq1KO/IAkE4YJ1c0Vg0IqU5ikj+ZA2xSAKaC2ngv22YTrLwDJ+gQKiuHx1Mz?=
 =?us-ascii?Q?tzaLHnn1Ktl7fwe37H/DYvLvtRjHb8QnyRuHWeUvBZdRxqg5rhapk4lB3BPu?=
 =?us-ascii?Q?U5UPxIvMzkWfkg1ZoxT06Pmlft6CYKCB7Rwe46197CwSD5PhCF2bYDv+fncV?=
 =?us-ascii?Q?U01xuP3mZa3NjN2oj8ORu9Q2XtJ4z5e7FF9xYNZnjOR+Or1b/S70zayWz4Fv?=
 =?us-ascii?Q?zXCr1FaoFKmv+XsVEbI2KV3Nl8o8F/Hk6RiMMqTPzp3YmlNHMty6JEotwpy1?=
 =?us-ascii?Q?Uv8s+lQ7Mz1LNGqUGQt+B9EutHxOhotjPfChfe5l28giruVmV9pRGzNtqPSv?=
 =?us-ascii?Q?Guao4syLDU1qr0ghmbE3WQOCXgvRF/JRJvzNRd+a/JQaZPWSHh6gjRHrofBx?=
 =?us-ascii?Q?Tf8r3Hw1bWz0aBMkkuK09DYqNqnRjNOe4iVSmMS1ofc52jAcqfRqsAPdHond?=
 =?us-ascii?Q?6emHKk8F++PyFaJb00BdZm31VH7MFhd3BpIQJkHc5iH3Copk7NVjV9HtEpgJ?=
 =?us-ascii?Q?Fb4UVEV/knxP0mJjwwAhowroAlXtH6oKJWuym0xBr3XwXRMxKj5H66oPKkx6?=
 =?us-ascii?Q?U57V9Bog83H8AGjMc9/o2Q6NXsRagotiUjwCIuTKgm0kmar+2UEXVL79/Gxq?=
 =?us-ascii?Q?uNE47/p9S+uzfeWuXY+PTZgQUEJFWgig3/D/q34HdVbb/bcYAK1lJiD/pXoV?=
 =?us-ascii?Q?yQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a8a2308-f356-4320-5899-08dbf1122778
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 19:34:07.8293 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XIaSnwV1ochRtloyT5YUpQai3OhFxRCwZdRgAWWta/5K88PeINjp/eXG72TXKswh6ccfTtVLtDsYmSwWiOcWNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5470
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe/xe2: Respond to TRTT faults as
 unsuccessful page fault
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

On Tue, Nov 28, 2023 at 01:36:34PM -0800, Brian Welty wrote:
> SW is not expected to handle TRTT faults and should report these as
> unsuccessful page fault in the reply, such that HW can respond by
> raising a CAT error.
> 
> Signed-off-by: Brian Welty <brian.welty@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gt_pagefault.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> index 959ea50c04db..2ee7005d7e39 100644
> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> @@ -33,6 +33,7 @@ struct pagefault {
>  	u8 engine_class;
>  	u8 engine_instance;
>  	u8 fault_unsuccessful;
> +	bool trva_fault;
>  };
>  
>  enum access_type {
> @@ -137,6 +138,10 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
>  	int ret = 0;
>  	bool atomic;
>  
> +	/* SW isn't expected to handle TRTT faults */
> +	if (pf->trva_fault)
> +		return -EFAULT;
> +
>  	/* ASID to VM */
>  	mutex_lock(&xe->usm.lock);
>  	vm = xa_load(&xe->usm.asid_to_vm, pf->asid);
> @@ -281,6 +286,7 @@ static bool get_pagefault(struct pf_queue *pf_queue, struct pagefault *pf)
>  			(pf_queue->data + pf_queue->head);
>  
>  		pf->fault_level = FIELD_GET(PFD_FAULT_LEVEL, desc->dw0);
> +		pf->trva_fault = FIELD_GET(XE2_PFD_TRVA_FAULT, desc->dw0);
>  		pf->engine_class = FIELD_GET(PFD_ENG_CLASS, desc->dw0);
>  		pf->engine_instance = FIELD_GET(PFD_ENG_INSTANCE, desc->dw0);
>  		pf->pdata = FIELD_GET(PFD_PDATA_HI, desc->dw1) <<
> -- 
> 2.38.0
> 
