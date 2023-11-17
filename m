Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85F48C072A2
	for <intel-xe@archiver.kernel.org>; Fri, 17 Nov 2023 21:44:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CDAC10E7A0;
	Fri, 17 Nov 2023 21:44:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B8DD10E7A0
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Nov 2023 21:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700257442; x=1731793442;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=lQgnNWpy10RJ3Rq1Ot1uS0QirunO4YHDQ2hB8HIkNes=;
 b=AimJL7Zf+xGRwBHRZECSqZ1/hPkbvw+VI/z94pTAHCjQbOsZ8j8rAnwb
 JGGfXG/VFBDy2FrW0MHkz7OylR5FTMQWLLrWJcyjqsf4ttxdj7qm43Q5H
 N1SUq7aWAOehYoEkKoWF6OVLDqqFdgBfBVr8itFbEFUbFMFN3ftYl+s93
 a9MdRN04z3/L1NPkCr+gPn1+xPQdFvLBuks3LO8V6j1pcIdEWdkzLZ2gW
 ruT8lcXCU6/xAma/NsKFc+xbhLFTQJgFMGCducVFQeGQ0JcYQc/+dgbXL
 fJWO0Z5IVZJCS4NuquJSUyYomm+aKfDktgTaGsjTr6aepvwgNa1U63moQ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="10033445"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; d="scan'208";a="10033445"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2023 13:44:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="765721858"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; d="scan'208";a="765721858"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Nov 2023 13:44:01 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 17 Nov 2023 13:44:01 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Fri, 17 Nov 2023 13:44:01 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Fri, 17 Nov 2023 13:44:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JQdQYIqx+64skfOQM9HqBkuYMuLthbMfcaMdS+4GXVmncr7aW44xmo5y4GFm6Ns9Eh5jvJWY9NzvSEuUbkUgBdtCZW5vunrya1G6Cgt77OKaWB3pN9qN8NZcJUGLNHOJx2T0Z0Ba661Dabl+I2JguZiQE+z7Jx0lW8/P81p8NUFSTBm0SU9rgGxtU65OJOJBIMRzFEjq0g3PcDKLjkOAClQK/pzN+QySFcQxVtrO4yCz0hPp3gfdJapyen52y34fTpfhjnOPJrZ7eA2wShvPbFnfsL2T0OIYOLdtiC31mcxgiizdfri+hdz2JTe3Ig7cDnTYyykLpK2ef7hKxivMug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TDAGAUETdGN7u0RkfHJ54TgURMUCL6yuvFHvSlf5gec=;
 b=gd0sRe2j8OeiKofroFhw4oJKv3JJwN17b6Iui8pZ2BIYkv2uyJ/04hGmG8zKcNoAbgdPs/hSzFqLLgMjG7ylPWtqhQ055ajwoJqr/Rma/+PVfKLegO/gDmyPmRXzEzEP2Weux8q9XKb8XcbRqHIviOMBCMLyTrKv+wwgK5IvaSdUsGWAHkj786tkYHeEtXWGDXvjWNoVSSmeqy0w91M/Te3fhpjOlfHJ7NJJNj0WYRhghoK0FiGTrIYdT0IQIEwLj35Osj6nkc6nPRB9XZrSAacQroNSvkKufYmQFnmYqgtigDcZ/B6xycE6VS3WMgekjPN/QmGRKALkzSPAv1jqoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by LV8PR11MB8608.namprd11.prod.outlook.com (2603:10b6:408:1f0::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.23; Fri, 17 Nov
 2023 21:43:59 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7002.022; Fri, 17 Nov 2023
 21:43:59 +0000
Date: Fri, 17 Nov 2023 16:43:55 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
Message-ID: <ZVfem1m9puMhHcJM@intel.com>
References: <20231116143043.908412-1-sujaritha.sundaresan@intel.com>
 <20231116143043.908412-5-sujaritha.sundaresan@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231116143043.908412-5-sujaritha.sundaresan@intel.com>
X-ClientProxiedBy: SJ0PR03CA0121.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::6) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|LV8PR11MB8608:EE_
X-MS-Office365-Filtering-Correlation-Id: d5bfab45-91f5-4223-b84f-08dbe7b64e82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HxtDZXY3okaJNMWTuYozTDY8WfuctfBhjxp5F+9CVrdF1tc1/iF3pcqjXKqkRAqCoB2UBp3SoBMKn1hrDLpDPO8hddlNfoMvHQ4fPTrviEJAOXoTayfB0l3/i8uHGC9taCcX1YXGBMfpV+7gyVTj8n6eD7ebi2sPjrp7ow9HdwitOaNfcUXXb/n0HcmK4ydbzMY8s+dRltFJlEbDw975foV4/IKXLnJi5xseUe6rFu4p8Fjb7y0nAkYls/f1txERU6cUAFz4Md2u7e9f2YB//DiM9zYyMH8WaJq4lLsve0rq4pz6haJBegwYTURCVKuIilOZjLny48/mFVAGNgw+WsWmaLz+OIiKlceJhG3q6kP/Qk9NMB6XZIglw3VKlOtVhuG+KemHH4aWZ8lw7Cj9U4qIXdj3cN8VpCO5E2Ohls4Gfl+JThCviK9hy+z8kUMslYEPOtB7khlMznZv5dUF0+AFJOEdWr0OH5faQBthUmSUGXm1idlYDPl5hKCWBghmR92lwumCuGlXq/qKbZ5ipgFWZIR7UpzUNjZsTppLmcqTvt8TuCSR7LxV2l7QuH4R
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(39860400002)(136003)(346002)(396003)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(107886003)(26005)(6506007)(82960400001)(4326008)(6862004)(8676002)(5660300002)(44832011)(8936002)(2906002)(2616005)(66476007)(6666004)(86362001)(66556008)(66946007)(37006003)(6636002)(66899024)(38100700002)(36756003)(478600001)(6512007)(6486002)(316002)(41300700001)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RJU/KpppgENV5eniqf/U2V1n6B3xqGzamfVaXwOFH3OQI5JfRfAwA/oDFXoj?=
 =?us-ascii?Q?KDd1ZnIxs4/hBC8sqte2as04qmQ7Wz4ylSqABxQXOd0RGhCFDFGyDD5nXe2U?=
 =?us-ascii?Q?lG/pCVGPzbs1wy3bbOFHAkOyeAQgNFUm0bRnGCiZI/wAmprtFkn4nUUoux2j?=
 =?us-ascii?Q?1IF4fHvxRNTkyqrni5DsKBZLg+JVN4gtVgG9CcMy3fGfhIgdLRt3KSaAXvyX?=
 =?us-ascii?Q?HmDou+rKUXdvhin0P7F+CQuEgMc/btAbgXlNVsg6vMoRlYeT9Il5NEbL4kTu?=
 =?us-ascii?Q?R3UEsNt/IQNXfV8/SeHyQ1TrrCpZzwVdj273bgeW+EpDj8yXPnW+g2+wgaNz?=
 =?us-ascii?Q?nTMNbe/MAoGtM+ckBt+VjTex/HuAJfA5SYPle1KYxtIYwJIChtSQiZwZ9+Ap?=
 =?us-ascii?Q?Iws/26XJOYXjxxrnSSJgE/xWcinxPW1M1Afp5eWscW7RDzye2wABZ2JvVssv?=
 =?us-ascii?Q?GyhDrL/qGn2x09iYzNCYyXVl1E/XoWUnR6qdVsm+Zc6515ot473UOyhaaZj4?=
 =?us-ascii?Q?mlY4ux0UDIzQEidvLtxxNXWitdNWH4nilvZUSaKgCShB+ZqccDSnCXa5zCSG?=
 =?us-ascii?Q?hHfqlQ8KOF05GRZMCEEd4DmQUmnYE7XfCQuql/DxSj5LiyMALluATsrDP9EZ?=
 =?us-ascii?Q?4l0mvCNr595wuZ+/LVRKQmCoYSX0aonk9RaI7QGb3dpIueCjjwYPLtciXAnQ?=
 =?us-ascii?Q?Z6LzFWS3zsI/SVm40bclbz9dit9TB0QNGvRQL1fgC+tGC8ElM/uPSMtib2x1?=
 =?us-ascii?Q?LNa0RdZz10OhXxSvrUVWmppjXXhOiLGIHUJ6zu4cD59g5IxPfvC6ppoI1pOO?=
 =?us-ascii?Q?wbZUB37LmmBSGrOjcmsMdFRCcY9yjo61FcF7zZghScoQeN4UHoqCrFdvBy4n?=
 =?us-ascii?Q?hEoEfERYuG/fSnVpednXTGdaP/0JmjChrje7tmHjXWQ0/Y8PhTdxuZEyeOgD?=
 =?us-ascii?Q?4LFsntrWsvMAh75cJQgZNL01becAOzyY+BVxeueL8pIzx/Kv5cgc3qtCa9FL?=
 =?us-ascii?Q?L2YTsCFKxMuQYGShHA/DXkYiiLI4UKn1E6jM5waXTCSJPjtvV4mKrPYjOwEY?=
 =?us-ascii?Q?LKWNkA6Y/+5+pMEYt+upnx5kBUUaGZ+5pUhxgfFX3XlX6N4WJntZFTip8EJq?=
 =?us-ascii?Q?h53I25nEMgxu1tMqhV8XMbH1b25e/lX8s1zGDdC18XaWXTjkhFN4+vF0pz/X?=
 =?us-ascii?Q?86nhGQ/V/9gCIpX/o9LbjgWWe9/brnJFkkzK3vmn9QhhM2XfDD9cF8tYA/qS?=
 =?us-ascii?Q?htJCspok3budNLRJpUicb4GkXCxHy0qyBeS6OKPGlIiCfUWEzoYKRtjMuTA+?=
 =?us-ascii?Q?BBhOe6SaPg0HuzAduwxkcxfXLH324B+rUg60gE0gvt5wSOtyjaIroZ6dDY8k?=
 =?us-ascii?Q?FRCJc6keqIVXYbS+bj7F1KFEn9bj6rz5SstQHlr/g3YIwTQObUi2p2KOPhQR?=
 =?us-ascii?Q?4tOPBTLrOgARVRihax8QmtrMs90JBPLpFv0ND2lFKQRS4uKSqMzVdKH9KOch?=
 =?us-ascii?Q?gwbaBCZNGw1SzLm7/ueDws81bpTg608LL5yJNbYVICEwMW4q/UXD6yMNnJIg?=
 =?us-ascii?Q?liaaGuc0pdt28wR86WUnMs7yXVdRiWugmXqfqLOPZG/NQbRzYWCQq6Bor2OS?=
 =?us-ascii?Q?0w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d5bfab45-91f5-4223-b84f-08dbe7b64e82
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2023 21:43:59.2376 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kuSWaQyenwPMsM6TKsp1u8LRHveQePWrJ4jnwhAXI+Zql/bqM+jWA33/JI6j0KujNzS4S5PU7NMOU2+MQV3zrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8608
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC 4/4] drm/xe: Add vram frequency sysfs attributes
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
Cc: intel-xe@lists.freedesktop.org, vivi.rodrigo@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Nov 16, 2023 at 08:00:43PM +0530, Sujaritha Sundaresan wrote:
> Add vram rp0/n frequency sysfs attribuites under
> /device/../tile<n>/memory/freq/vram_rp0/n_freq


The ideal scenario is that our xe_freq is generic enough to be used
under gt, tile or vram/memory...

> 
> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pcode_api.h  |  8 ++++
>  drivers/gpu/drm/xe/xe_tile_sysfs.c | 77 ++++++++++++++++++++++++++++--
>  2 files changed, 81 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
> index 5935cfe30204..c003a423562c 100644
> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
> @@ -42,6 +42,14 @@
>  #define	    POWER_SETUP_I1_SHIFT		6	/* 10.6 fixed point format */
>  #define	    POWER_SETUP_I1_DATA_MASK		REG_GENMASK(15, 0)
>  
> +#define   XEHP_PCODE_FREQUENCY_CONFIG			0x6e	/* xehp, pvc */
> +/* XEHP_PCODE_FREQUENCY_CONFIG sub-commands (param1) */
> +#define     PCODE_MBOX_FC_SC_READ_FUSED_P0		0x0
> +#define     PCODE_MBOX_FC_SC_READ_FUSED_PN		0x1
> +/* PCODE_MBOX_DOMAIN_* - mailbox domain IDs */
> +/* XEHP_PCODE_FREQUENCY_CONFIG param2 */
> +#define     PCODE_MBOX_DOMAIN_HBM			0x2
> +
>  struct pcode_err_decode {
>  	int errno;
>  	const char *str;
> diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs.c b/drivers/gpu/drm/xe/xe_tile_sysfs.c
> index d61c6fb1df40..2a6a515f48e8 100644
> --- a/drivers/gpu/drm/xe/xe_tile_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_tile_sysfs.c
> @@ -7,9 +7,15 @@
>  #include <linux/sysfs.h>
>  #include <drm/drm_managed.h>
>  
> +#include "xe_gt.h"
> +#include "xe_gt_sysfs.h"
> +#include "xe_pcode.h"
> +#include "xe_pcode_api.h"
>  #include "xe_tile.h"
>  #include "xe_tile_sysfs.h"
>  
> +#define GT_FREQUENCY_MULTIPLIER	50
> +
>  static void xe_tile_sysfs_kobj_release(struct kobject *kobj)
>  {
>  	kfree(kobj);
> @@ -34,6 +40,58 @@ static DEVICE_ATTR_RO(physical_vram_size_bytes);
>  static const struct attribute *physical_memsize_attr =
>  	&dev_attr_physical_vram_size_bytes.attr;
>  
> +static ssize_t vram_rp0_freq_show(struct device *dev, struct device_attribute *attr,
> +				  char *buff)
> +{
> +	struct kobject *kobj = &dev->kobj;
> +	struct xe_gt *gt = kobj_to_gt(kobj);
> +	u32 val, mbox;
> +	int err;
> +
> +	mbox = REG_FIELD_PREP(PCODE_MB_COMMAND, XEHP_PCODE_FREQUENCY_CONFIG)
> +		| REG_FIELD_PREP(PCODE_MB_PARAM1, PCODE_MBOX_FC_SC_READ_FUSED_P0)
> +		| REG_FIELD_PREP(PCODE_MB_PARAM2, PCODE_MBOX_DOMAIN_HBM);
> +
> +	err = xe_pcode_read(gt, mbox, &val, NULL);
> +	if (err)
> +		return err;
> +
> +	/* data_out - Fused P0 for domain ID in units of 50 MHz */
> +	val *= GT_FREQUENCY_MULTIPLIER;
> +
> +	return sysfs_emit(buff, "%u\n", val);
> +}
> +static DEVICE_ATTR_RO(vram_rp0_freq);
> +
> +static ssize_t vram_rpn_freq_show(struct device *dev, struct device_attribute *attr,
> +				  char *buff)
> +{
> +	struct kobject *kobj = &dev->kobj;
> +	struct xe_gt *gt = kobj_to_gt(kobj);
> +	u32 val, mbox;
> +	int err;
> +
> +	mbox = REG_FIELD_PREP(PCODE_MB_COMMAND, XEHP_PCODE_FREQUENCY_CONFIG)
> +		| REG_FIELD_PREP(PCODE_MB_PARAM1, PCODE_MBOX_FC_SC_READ_FUSED_PN)
> +		| REG_FIELD_PREP(PCODE_MB_PARAM2, PCODE_MBOX_DOMAIN_HBM);
> +
> +	err = xe_pcode_read(gt, mbox, &val, NULL);
> +	if (err)
> +		return err;
> +
> +	/* data_out - Fused Pn for domain ID in units of 50 MHz */
> +	val *= GT_FREQUENCY_MULTIPLIER;
> +
> +	return sysfs_emit(buff, "%u\n", val);
> +}
> +static DEVICE_ATTR_RO(vram_rpn_freq);
> +
> +static const struct attribute *vram_freq_attrs[] = {
> +	&dev_attr_vram_rp0_freq.attr,
> +	&dev_attr_vram_rpn_freq.attr,
> +	NULL
> +};
> +
>  static void tile_sysfs_fini(struct drm_device *drm, void *arg)
>  {
>  	struct xe_tile *tile = arg;
> @@ -46,7 +104,8 @@ void xe_tile_sysfs_init(struct xe_tile *tile)
>  	struct xe_device *xe = tile_to_xe(tile);
>  	struct device *dev = xe->drm.dev;
>  	struct kobj_tile *kt;
> -	struct kobject *kobj;
> +	struct kobject *kobj1, *kobj2;
> +
>  	int err;
>  
>  	kt = kzalloc(sizeof(*kt), GFP_KERNEL);
> @@ -65,17 +124,27 @@ void xe_tile_sysfs_init(struct xe_tile *tile)
>  
>  	tile->sysfs = &kt->base;
>  
> -	kobj = kobject_create_and_add("memory", tile->sysfs);
> -	if (!kobj) {
> +	kobj1 = kobject_create_and_add("memory", tile->sysfs);
> +	if (!kobj1) {
>  		drm_warn(&xe->drm, "%s failed, err: %d\n", __func__, -ENOMEM);
>  		return;
>  	}
>  
>  	if (IS_DGFX(xe) && xe->info.platform != XE_DG1 &&
> -	    sysfs_create_file(kobj, physical_memsize_attr))
> +	    sysfs_create_file(kobj1, physical_memsize_attr))
>  		drm_warn(&xe->drm,
>  			 "Sysfs creation to read addr_range per tile failed\n");
>  
> +	kobj2 = kobject_create_and_add("freq", kobj1);
> +	if (xe->info.platform == XE_PVC) {
> +	err = sysfs_create_files(kobj2, vram_freq_attrs);
> +		if (err) {
> +			kobject_put(&kt->base);
> +			drm_warn(&xe->drm, "failed to register vram freq sysfs, err: %d\n", err);
> +			return;
> +		}
> +	}
> +
>  	err = drmm_add_action_or_reset(&xe->drm, tile_sysfs_fini, tile);
>  	if (err) {
>  		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, err: %d\n",
> -- 
> 2.25.1
> 
