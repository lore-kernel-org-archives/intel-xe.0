Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDE74CE79A9
	for <intel-xe@archiver.kernel.org>; Tue, 19 Sep 2023 17:31:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDDC510E13A;
	Tue, 19 Sep 2023 17:31:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C12C710E13A
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Sep 2023 17:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695144698; x=1726680698;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=MGbHaaZ1U3fY7dekKbBVJ0tch+aMqFAyOubJ18177oQ=;
 b=FgwgBhud6NXh1g5Jtd2VO2lzTeUwaZq3h/fS2yFtKXuogt4x2F6p2xHw
 htlmFF6zl/MQVKzaiazhBpLzymflzNey0V9+ePYwOQWkyUimPFdW6Q7Uf
 Zod0+COs/Z+DoQJlSsmWN6jfcZMfiQCoMfzQaOgbV1AcP9QPr6eekZcUV
 vGhdlyPdOwQf26TFU4m2NsR9iJJoWFjsAVfr6Ws/6jsYLqWHYk7Xe4jSV
 Na/8ZTdR0WjI52EsfoHoRbBWbHHXIDe4BaPJ5hKCZF3xjmgBPzB01/ZSF
 q0C/fJdomYv6+PKA1rXsvDkBat5fF32GLQIZ5HBXdg0UC++Yhf8DMCx6O g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="410937374"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; d="scan'208";a="410937374"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 10:31:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="746316885"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; d="scan'208";a="746316885"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Sep 2023 10:31:37 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 19 Sep 2023 10:31:37 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 19 Sep 2023 10:31:36 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 19 Sep 2023 10:31:35 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.107)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 19 Sep 2023 10:31:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nE34Iwk+G1Ibr9KWrCHW9XRpCm5Eq/htW23eYxv/T2q2cmhRwybob5ZEWkkID72lzGsW5cOK1cm9uelH3qhWKePAwJXjN6rMbfuCaFthFGDz/7T6dmTTXCGJqWcY/dczzRVkTNNo8qbRCw+E+AyO73Gtpi7wQRLX8dasjckpBU46QzO2uwyNcb+JErsduCwTTL3bqwaPQLnZnlUQDbv+P74CsiPZGtJZ+3XsQDRs97Hn+cyOMwCkFMqsTVtiesNLddzUxINLLAvXjH8N9ZB92D8op7OZ7eWpHfh0LFXrLNtP9wMePtviE/Ql1HZ+lhTpa6IG4fMEZtj/1GZYBoQZdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OnYdqPr/J7A0UnEfTFe+uyG1qKjPxaRETPQcejZsOqg=;
 b=O9Al9+GdACLEQ6hsZUt8ijcLCbD5ARZeduquhWJcdq5u+el/+X1HgihR/A68ptAvGZLS21rSzI1/quBgSF2xP2Dk+Q3aj42+7tkGt5uVmqeuWXWU3RJP4J2F+gM7EsRFnIUt5Tx6LCvkNVmrAmwdLZdecaXuzMjAWFxCsfpQp1cTw9lCYyvs1pV2DzOEYAq1Dr4oPAoY+C4zNU6DL5VA9meH95WOc3bMb2dfTwAqqsbZELIIpZ261rumalB1Tc7W5OB2NtmIQEFWjAW13V8cDybwiOM3HAmcUfQvoTunwdVu1TKSex1OsytFYV0ppCNin2dtVodqsm7GzRUafG+lLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by BL3PR11MB6484.namprd11.prod.outlook.com (2603:10b6:208:3bf::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.31; Tue, 19 Sep
 2023 17:31:33 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79%5]) with mapi id 15.20.6792.026; Tue, 19 Sep 2023
 17:31:33 +0000
Date: Tue, 19 Sep 2023 12:31:24 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
Message-ID: <w7l6s4ywimggliinhccwbpnvepxera3an6raryyffusmenesng@me7t4rjxmyjz>
References: <20230919144111.32702-1-gustavo.sousa@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230919144111.32702-1-gustavo.sousa@intel.com>
X-ClientProxiedBy: BYAPR05CA0108.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::49) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|BL3PR11MB6484:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bbda6d5-40d4-4a75-673d-08dbb9364484
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QXalVKpV7JaJjyb7r4f0el9JHZO+6U0p6TVE8FU9d+yiQbu0E7m0QU5jxFVNVSG5O4929mresyCwwW8gwRBwFvGlNUiTevGohP97tizalGjDN6NF6yklDCD3ZJMYLfxVehu8PICqv8g120ZFVVGco5YwEX8FiIp0rVEmeO3kLiK39p0PG2rViiln7ARVk0Sk4fbyoY9qixKV/AGgHzSQL9JJryh1vLYElmITemgT8rSIyx3asbqHr2CLmr3sDz9pZ23PjVOdRMcSiZKKLQox924UAtM9HaL0oRYqbWMRT9LO6QZhFzDjrXEN7m9/Bb/zyRNNiTxZH3m+Vxi17w5PLZNLS0BXcnNcQzcpNDivGMby5/Hqg1ewpZY0lleQTkC7V2fP6gJBrZraoT4xwni50Gwt0eWW4KSezqkgSAN6PivxqRseM2kW/NhESfUvGcBisOZumhrC1Kak2Qd2aPYjfN5TRahewkVMCE7O33CB2HuapKcskRnz8bYxjVcKmNQNjj6Ldp0PPYVO/tIWMwjda47tf8XXOzN5n4YNnsccBRfZpmYvzWKqIHT6NHgO2cDo
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(39860400002)(366004)(346002)(376002)(136003)(396003)(451199024)(1800799009)(186009)(6862004)(8676002)(8936002)(4326008)(83380400001)(2906002)(5660300002)(86362001)(6512007)(9686003)(6666004)(38100700002)(6486002)(6506007)(82960400001)(41300700001)(478600001)(33716001)(66946007)(66556008)(66476007)(316002)(6636002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?thW2zKdYDhyK+wgmPKU7Rblk5PUY8fbt2BsUfI6iUfht+9gPsTYGx2a2Ea?=
 =?iso-8859-1?Q?DcMFh8U/B7+PXrH6wVVGudrPWYAfGElbEZlNCGcx/91oW5vSh3yO8We/GI?=
 =?iso-8859-1?Q?P8H/XDfYP9+Vlnkv2N1afQsoQ/qcLKIFpD5YltBV1q8Blvt7bSYNiqtv4g?=
 =?iso-8859-1?Q?t/H1ZCF5lBMsA9yszvMHFFRED6QE2EtEWr0u4LJ//XSb366HNpV+g/gdR5?=
 =?iso-8859-1?Q?OVRent3slwewsSLqDOEJBT4iAwATkEzsXzy68ylGOaIvFg0bbV+Fe2BD3D?=
 =?iso-8859-1?Q?QlFSKb+HZ1SUs58LxadFrc86THDAD64XzuPgIrrJyRn4im7MASDXaIOFhE?=
 =?iso-8859-1?Q?RIBbfSoHaa8Ar+iPFswPXEO1DF/jkzZ74o+GlqhYbD2YCE/b79PD3zHFxI?=
 =?iso-8859-1?Q?EOzSzuV5FP+oLCQlcZbS+vlNaEmoBm/XduLushwxbBkspDFij3JDaAahpz?=
 =?iso-8859-1?Q?/onl+2fidNRAGvpmFEgmGtNW7y1Nj3B/0P3+woWIgdqz9y8EdUWvF33cDB?=
 =?iso-8859-1?Q?iTy/gEbsKmN5/SbV2Kk5mYZRikrp6QlLVfCa/QPk/v/bZbqUQn9qrY50NR?=
 =?iso-8859-1?Q?hv76lY4nCplu9ifIKCugXzKxOfUyHOPL6OPYfbom8bAHRzG8cZ3a+aPL1B?=
 =?iso-8859-1?Q?Xy9EsmJ4PepdxHNSHYB/uhM97XOXrYBOzSsZBHXVCWdopr0JDDKknEYtSZ?=
 =?iso-8859-1?Q?gof7xmq3ceWsNTSLMsVxK+ffty2VQgWlRjXrLbhRUp9t8Fdp5Bdyo9icQ2?=
 =?iso-8859-1?Q?YLznhf1vZ383/mTeuuqd6q5OrzmPp/m4aBYIaJCR7bifdyIPx86GIJFg2W?=
 =?iso-8859-1?Q?RGTh5U8lCN6wxDlAjtTHBd4ZMz+5nv3S0uHLJtZxrZYHs5I33qel0rV6dD?=
 =?iso-8859-1?Q?uWUnd7tutjKoB/Zuw/+O8Ow2uwZHCr+yMwy0lR2b36/LH4yXABJYL01fJB?=
 =?iso-8859-1?Q?4Laz+weq0NfDPD+gk7AwMgu/IeFPWqw0DIs03yCFO/jQOJUuKB6f2Yl9xY?=
 =?iso-8859-1?Q?CyWI9u5tIk5QnSDiMixW9FULYUcV79cyzYQalZ6fTRNdV2aE51ZnQjwwea?=
 =?iso-8859-1?Q?9i5A7kVapiqOXlmSu65u7jq7feBo8Fk/b39bB56r5Ss22dSBWdH+jXG+dE?=
 =?iso-8859-1?Q?D4+Oxs+tY86Nl4dntSMbOq30WQckgNEbpoqXIK+KGzdwk+RlO0E/THlObH?=
 =?iso-8859-1?Q?pVgGG4xkS/riOo0025BQERBl5wXXTSR5YIFcJ8iFlr+EH5NoGG70kxmgSS?=
 =?iso-8859-1?Q?lwJOxWQtNLEByY+QnIrh3mQJkOXXFW9jiy0LvhhK1PqglVRMWt3O3YaQAh?=
 =?iso-8859-1?Q?I0SxZwhdDAFxfsVkKb2W0lzqT2hjPvyKQkiu3s17Uv0LNqAURM9BfalBi5?=
 =?iso-8859-1?Q?aldOY5RfQSic7K++sd+cOrk/3ex6JBOwbfD+5yWoiy754HrqK3rzIeV97O?=
 =?iso-8859-1?Q?H4EvSqkV/CKs05hIi+TsE+TktV0GZlIHW9C3RcWwGBEsGtYTmOrqAU1w+1?=
 =?iso-8859-1?Q?TFSE+nnnRg+NQFwdEAXPFswl0H5+2pZ0k9iIw32PFiXSzsoHBX5Prq6Q2u?=
 =?iso-8859-1?Q?Ilx/GsAU6BDKM5ql90fOnt+H7KYNIuthBxHtY4A2judrEfg67pY28kJGG/?=
 =?iso-8859-1?Q?s7xfMku8V3qk/8cqqpuMFKA6owwpLKv0mPQ2fgWYLNpg6W/p6b+LH+ylRq?=
 =?iso-8859-1?Q?46NFtPm9FMVe6DW8LC0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bbda6d5-40d4-4a75-673d-08dbb9364484
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2023 17:31:33.3127 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VlFZA9uOvR1jS6xKm8rU5pzVD3669uxXmYNF9SBSYRBeOxuLWZV2so42qogYSOsf2p+FxgHyD2nnfP4FzMckJlBapmjf+SdGe2+6N4o8XKQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6484
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/irq: Clear GFX_MSTR_IRQ as part of
 IRQ reset
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

On Tue, Sep 19, 2023 at 11:41:10AM -0300, Gustavo Sousa wrote:
>Starting with Xe_LP+, GFX_MSTR_IRQ contains status bits that have W1C
>behavior. If we do not properly reset them, we would miss delivery of
>interrupts if a pending bit is set when enabling IRQs.
>
>As an example, the display part of our probe routine contains paths
>where we wait for vblank interrupts. If a display interrupt was already
>pending when enabling IRQs, we would time out waiting for the vblank.
>
>That in fact happened recently when modprobing Xe on a Lunar Lake with a
>specific configuration; and that's how we found out we were missing this
>step in the IRQ enabling logic.
>
>Fix the issue by clearing GFX_MSTR_IRQ as part of the IRQ reset.
>
>BSpec: 50875, 54028, 62357
>Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>---
> drivers/gpu/drm/xe/xe_irq.c | 4 ++++
> 1 file changed, 4 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
>index ccb934f8fa34..3746e9204e48 100644
>--- a/drivers/gpu/drm/xe/xe_irq.c
>+++ b/drivers/gpu/drm/xe/xe_irq.c
>@@ -456,6 +456,7 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
>
> static void gt_irq_reset(struct xe_tile *tile)
> {
>+	struct xe_device *xe = tile_to_xe(tile);
> 	struct xe_gt *mmio = tile->primary_gt;
>
> 	u32 ccs_mask = xe_hw_engine_mask_per_class(tile->primary_gt,
>@@ -463,6 +464,9 @@ static void gt_irq_reset(struct xe_tile *tile)
> 	u32 bcs_mask = xe_hw_engine_mask_per_class(tile->primary_gt,
> 						   XE_ENGINE_CLASS_COPY);
>
>+	if (GRAPHICS_VERx100(xe) >= 1210)
>+		xe_mmio_write32(mmio, GFX_MSTR_IRQ, ~0);

shouldn´t you exclude bit 31 (MSTR_INT) since it'ss not a status bit
and would rather enable the interrupts... ?

Lucas De Marchi

>+
> 	/* Disable RCS, BCS, VCS and VECS class engines. */
> 	xe_mmio_write32(mmio, RENDER_COPY_INTR_ENABLE, 0);
> 	xe_mmio_write32(mmio, VCS_VECS_INTR_ENABLE, 0);
>-- 
>2.42.0
>
