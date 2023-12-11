Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6C03C4332F
	for <intel-xe@archiver.kernel.org>; Mon, 11 Dec 2023 23:16:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8324E10E523;
	Mon, 11 Dec 2023 23:16:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8371410E523
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Dec 2023 23:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702336568; x=1733872568;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=gUlLa99uKKOj/ZhJ6qME7H+Wh0PE2yhjCza+SDhIrTA=;
 b=TPOEyoaUGQxNKYO6VMHcde3aKIdCYYizx9n3F4fcVfu5YrPHGl/eSZnt
 ZiqbgxX1bwo+c7lK5qwgBnq7c8ajOuQa+c/0To9KP65/BWbyZuTtpJXJf
 rYc+wxZi2KancxikUWCUkeKqxFubK7oxD82KhV9McyvFY7f/sjkxFnKdP
 6Pmuol2hHCIalg2VfX43ib3RvlfRmyueVnlubwL1cB5FLtrQP2psMUjBN
 RoyDlu3mxfDrBFN8VCVJ3dRrS/Y9DJj8v2g2NWMIPABI9hZfAJ2Nomyqv
 TsVIcyqND3Vb9y5neCk+If+LtznDvSU3VlUnF9fUwhKVl3guFZUadwnVO g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="1563441"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; 
   d="scan'208";a="1563441"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2023 15:16:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="946518888"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; d="scan'208";a="946518888"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Dec 2023 15:16:07 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Dec 2023 15:16:06 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Dec 2023 15:16:06 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 11 Dec 2023 15:16:06 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 11 Dec 2023 15:16:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i1s4bPSQFzUZ5WhD3LsOF5iugV4zRQ4v0Y46utV3DCQNENARfh236o4oLmH0Rkp0sRAM8Zo01JSBxUALGu+Eh1hTfqJb3u69ygiNACFbSTglFQi7kbfR3g2wpZv34QjDNfObxkr9kNygck6H8BD+2fT7kcc6NPJ8oqex/fq6FRg4CwLyxUl/7K5yx/vg1XtSpIOJn3alMpSLIhVeGQ5ksFsBO2Zlm71vf21gTp5HQJrQ+D8d82m6wsgbE687SKPN6zTSvD//ktt3fraHariiXpXZalLc21cOqmNJZqjP/PdbaXZANq2ngzyfbgS0HSybfNFt6bJ9zz38BNbkMY0tnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K0C/BYsYpvL2b1vYwM6Mc0dzWxUPESCVp/Y5V8CjA/k=;
 b=V8oT82kzUJi7KlMDQwu94HKig/aT0wLoimN5/HicRB0rCHkL0/6gWv9NdH5j6e7y9yJnkk078qKkyV190xEfsK10lI8hM3Q1+rzzPeKu0o7HfIfjBFu3UYEmiDboEIJgjoFH9W8KBpOaZIkA/vrFo+vvBxZwBrlhirpiu5PLLNKVVDpeh4F8KJhR4V8/UdsFgP5pGIwpZ6YCVjUB5Ooj5LDFKJq/Wnc8zMUv7MbDTE0F4buG1sl/LmjJYm4RhZjIgp0BOB3OGl3xUQKi21sM1uAz4tw/Qq5OezKVd6vlIOvykDY5Apkh4GSVbOBP4cpwrv9LVZhlcurM2SJhghXnJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DM4PR11MB5375.namprd11.prod.outlook.com (2603:10b6:5:396::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32; Mon, 11 Dec
 2023 23:16:02 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0%7]) with mapi id 15.20.7068.033; Mon, 11 Dec 2023
 23:16:02 +0000
Date: Mon, 11 Dec 2023 15:15:59 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH v7 02/10] drm/xe/xe2: Modify main memory to ccs memory
 ratio.
Message-ID: <20231211231559.GC1327160@mdroper-desk1.amr.corp.intel.com>
References: <20231211134356.1645973-1-himal.prasad.ghimiray@intel.com>
 <20231211134356.1645973-3-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231211134356.1645973-3-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: SJ0PR03CA0012.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::17) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DM4PR11MB5375:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c4ddd64-0b5f-49fa-c3d9-08dbfa9f2450
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: L341sVtPC36Wz2EM8OoFcmmdxDThFV/og5bygPMLVpV4aZDlF+0qXhJU/RaihPHXudlVmw98G6xkjUmgnvphx34E0NbfS/OC7pfW4T8kZNuUit0xd1Pdb9SudpcY3k2b4pvee9MlIrxR9A4S10WaS7ukhkPyVX1JVo+IJBFmqhrAQEIbXbMIsxi8Z4C972+enhNCTt33ND6VuDUkT3JeYy4FUS1xNcibsw1vbWcn9d03yHwN1qNjJNYi4PsMGivXoY4gaeDQe5qTtb6ew/lpzHKD0O7Q20SSjtL7CxWphx52+25BRxdLDL4BvfVDGD46oV+S5gZEUjDZ4EpMWmJKGZlrrBSQpglhcNkjNhNyuBIrRRBtlJOLEiUlKW5hi5QrswcqZdzdiiyK/6akxMo4i/lnmotbGZazIMArZ/BLuqexyjOt8Qjl/QcqvM+03P8IYZLqvFwBQuAREUqWcX1Ar2pmTLg8ygkfNa9/O/SFEC15idquXKwZ/ZUdwKwQ0N9P8RJEICC5A3lSw3xN7BGNN3QF9jBF2MWubJ85lxg4BOUn1H7eiDfr4NGfqFD1iXVo
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(346002)(136003)(39860400002)(396003)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(41300700001)(66574015)(1076003)(26005)(83380400001)(82960400001)(86362001)(33656002)(38100700002)(5660300002)(316002)(8676002)(8936002)(6862004)(4326008)(6636002)(2906002)(6666004)(6512007)(6506007)(66476007)(66946007)(66556008)(478600001)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?pcyxLrrpVD5AEHdg2Mwzn0vih3ibn+H8U2nRqDz2eLO4E6NNIo9QoElAZr?=
 =?iso-8859-1?Q?CzQJIcEeZWYjh2tOHnVCKvjVWcCLDOnIfApJefNiXPRUqVBKZV7veKowb9?=
 =?iso-8859-1?Q?4IUUm+IvuG1tOJ5hDjU7unonekxd+aHxseAGaIF4qzcLMWd8BYWkE0DaoG?=
 =?iso-8859-1?Q?CRpPzUZ7Lg2oLhgbtKOheggD6cF3tMgV0kmqwh/ixFlfVliRRuKqzHbgby?=
 =?iso-8859-1?Q?ZuudX96yqNqxZpOdEAjT6ZJdo/FmDXWGyd7YWA5fyaelbbFTVc7rd89Mex?=
 =?iso-8859-1?Q?aMReHa77DrRcCytfNrcDiQmMMFn2/6Mi6m/WSltNStsexBQEwbfnlHMUsW?=
 =?iso-8859-1?Q?Z2G3p+0XOb091esDu/j5ZF9YLlf6t6KAFxWgxRMBL9tYfuPfIEjCQ79fUD?=
 =?iso-8859-1?Q?WG+g/cyTENVTrUc24GY7RD4f0YTae8fdxF0y/RISDVtuPn44EtjnGHGdst?=
 =?iso-8859-1?Q?oXcMPXPB1H9g/Blaxnj2yyBojb4tJ1tOpZOvCYYgV+2FQp8n4LO0rcKgBU?=
 =?iso-8859-1?Q?reRprGD/OYyAP/IPfPMlnKl/aXK3O0Vkiwfyej5C8lkAywIdE6psXtAO0M?=
 =?iso-8859-1?Q?btgYIjdbQoNpVvRthmbFVUbnRL0wANyy/fs34V2Y7kJPeHxSvHOYxPNtdn?=
 =?iso-8859-1?Q?0QdMY07phcWytnfXM7gaIX0U7YBxgAPZwwKChZJ/WXyUB6W5n1tr7qOGMW?=
 =?iso-8859-1?Q?4LWDmRm96F90GBFI1io1NKar7NXMOs0zSozw+RAYOVr/8SLLr7Czm8lMRs?=
 =?iso-8859-1?Q?hNykWgKlJE3VUBcNv0AV8hI/5dzt2Le3DuOwLIxWHOIhSGpMDRMGEbGDbg?=
 =?iso-8859-1?Q?0f6j9oCC34s89stk0DtHPpjA511VshM0E8X3Xo4Rdw6OddzyGOAsU8mv7Q?=
 =?iso-8859-1?Q?Eh8J2BNCnuWyvbT5eOP7Xwn6BwcHevhBGfTIszE/Gtwds8m9ldHq4Mx2QD?=
 =?iso-8859-1?Q?NzI48ne8wnFu3h+zAswdGi0OIHVA391mxmtGvN9KJl0e9lMrOUzv4ILlRx?=
 =?iso-8859-1?Q?D3qSjJEibZhrahLely1ItjmYAPNA6Oo8NcNdREDnkqSwJtnfLCxaytpvLJ?=
 =?iso-8859-1?Q?d6W+DXA0ipfIQBlAe+qs9U9yExe8+7AOmyT4qDI+RPjBEZJEgnpK8+LDS+?=
 =?iso-8859-1?Q?+idUHk5oU6RDKcHlRqua/XtARXfuFXAVFNO0MBhNSZ+NIrOKWwEFY1H9Pj?=
 =?iso-8859-1?Q?48UXbKMtsQchQwnorsqx6h4q3c7fIxDaJdcw810wWboAMDn91nlzcEm0mE?=
 =?iso-8859-1?Q?MOBER+oOUMU1MVMs0kSFo3QZkSUuVslqL3v9S8PFgZZe67IXfGvE6iG82A?=
 =?iso-8859-1?Q?7OiBxaxKPFpxjncnwH6ZzCSmi2NZM2ZuCPJngEqEcc9KmXz1lvdQHBIste?=
 =?iso-8859-1?Q?rDvctaScpiiSR5RItE4PkL9RfiqCJzv55fp+CqVTTz1n1+ZpBVn2DEEhkl?=
 =?iso-8859-1?Q?gilOVQzShQ+KwDHFoI5R+qfGG6gOwQSDd/fHN+0QTYcwWT4NyClmJbPySP?=
 =?iso-8859-1?Q?2Q8tpj6HsK/2hv9yqCb/SCd2nTiTGJugo1CZwEp4Z+PfDZq6pauNiTybRm?=
 =?iso-8859-1?Q?WGZr/V8mk/NrenCG9eoLGbqYKgrajvsbDTfHwxAaWHEqH1x4sfPSQvXwkn?=
 =?iso-8859-1?Q?xV6fEGGOrARajwXbSf4eETRDrIJXrksVi8o4A7FADqY5gB5V+IfhBLyA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c4ddd64-0b5f-49fa-c3d9-08dbfa9f2450
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2023 23:16:02.3521 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dfk33jZIhNuNP3CyhPFQxZePRzy4ffW2l0E/O9O9Zf/MdmH4t3p/MlQIZNyIAFEK55Ho7s73KDLXN5E/wP6YjuPiPmh504E3Cmk0zhOJF3w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5375
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

On Mon, Dec 11, 2023 at 07:13:48PM +0530, Himal Prasad Ghimiray wrote:
> On xe2 platforms each byte of CCS data now represents 512 bytes of
> main memory data.
> 
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gpu_commands.h | 2 +-
>  drivers/gpu/drm/xe/xe_device.c            | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
> index f1c5bf203b3d..1f9c32e694c6 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
> @@ -16,7 +16,7 @@
>  #define   XY_CTRL_SURF_MOCS_MASK	GENMASK(31, 26)
>  #define   XE2_XY_CTRL_SURF_MOCS_INDEX_MASK	GENMASK(31, 28)
>  #define   NUM_CCS_BYTES_PER_BLOCK	256
> -#define   NUM_BYTES_PER_CCS_BYTE	256
> +#define   NUM_BYTES_PER_CCS_BYTE(_xe)	(GRAPHICS_VER(_xe) >= 20 ? 512 : 256)

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

for the time being, but longer term I don't think we want this
definition in the "xe_gpu_commands.h" header at all since it's not
actually related to the GPU instruction.  This is is a more general
device characteristic that should be moved somewhere else, possibly to a
field in the device info structures.


Matt

>  #define   NUM_CCS_BLKS_PER_XFER		1024
>  
>  #define XY_FAST_COLOR_BLT_CMD		(2 << 29 | 0x44 << 22)
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 91f5807d2d20..f8e1b809f944 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -615,7 +615,7 @@ void xe_device_wmb(struct xe_device *xe)
>  u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size)
>  {
>  	return xe_device_has_flat_ccs(xe) ?
> -		DIV_ROUND_UP(size, NUM_BYTES_PER_CCS_BYTE) : 0;
> +		DIV_ROUND_UP(size, NUM_BYTES_PER_CCS_BYTE(xe)) : 0;
>  }
>  
>  bool xe_device_mem_access_ongoing(struct xe_device *xe)
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
