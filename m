Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0640CE79AD
	for <intel-xe@archiver.kernel.org>; Wed, 20 Sep 2023 04:10:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6263010E43B;
	Wed, 20 Sep 2023 04:10:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7A1D10E43B
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Sep 2023 04:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695183021; x=1726719021;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=hNA6ysrdT17fXBzwu1HoiZa9y8cqrjGpQrnCxxFMHoQ=;
 b=lJRezS6ev/hHkutTcHod80ZesUXKnG7lGgRI3OPPej9mSqAUcbXazeNF
 uu67h/gs1MaEVIesezTga02rR1RNartDTgQPgA0HCVgpdVKSal2jnhuI8
 IdxuaYE647Xu4vQLhevtnFb5eN2f5iPRtCDF1YV0wktqPtZAFFzqtjl8q
 wDZ68IraOR7llsDZdhZ+HrMO9jkjFGsOhvElx/+LtPfePbCiNne4LTbGf
 LRdZz0+TtJXVsgeIUAL7faSMnTgTQvC5qS0vyeNG9rYh2r2/aaqMJUpK3
 GLoShqKxALTF6dy5M0diFwJ6HyVXC/Wv7j1jXJHh0uwdKhbYoMx1oggCi Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="379009782"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; d="scan'208";a="379009782"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 21:08:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="811982282"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; d="scan'208";a="811982282"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Sep 2023 21:08:12 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 19 Sep 2023 21:08:11 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 19 Sep 2023 21:08:11 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 19 Sep 2023 21:08:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nV+ZsZFkcFRBwcfLYQ8wW96Kpn9OuHz4vcQSCuraH+lfp5E7RO8bT58/pKi4DK6zZdFxcjxLY1+HAt0zYiyXfxItaxahH9qHzPvuyZr52Yb06DxloFk/1W1CVw+neFslKamNNlAAjhpednhVg7HaebkIOOUWyIlcdLYTw/Hy0D95EtyEzHHt/FyxnsS/B8HuvATx2Xzuo4N7TasPsXZjYUGGrwoyiWN9VnU/Wwd3/lIu32LJ5gifcG093bZ3x1kWvyHI+SKnO4eiNy9ZC1B46WgLJWhNSnENqUAK2+7I8obYQnN87TB7/Ucq8C1Vk/6L+vUqmRzl7olVCCTfQ6l50g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N5vobZpM6aXl74yvJXOuI5oaG1GFwJPY9yH60p7OC2M=;
 b=ROulzYyFGD6ZuSU3l6kiViOyNSyK7TZDxVLNl0Q5sW324e5rvd6Oah9drXT7hIbs8MTg9lVMiCQfGDGousYwyu8VZGIQqy0pcIeE7wUvOBG92GSOGCi35yt3vHDc1dlUIZF8Wmlqir8V3aktrXil0BsQiVsDVes6Sh1vmc3PaM1LcYBMGqrVI3cyM1+GevqmdU+S2AB54XjsGkHDEQ8qmDc6NvoBxUMaACdrMiB8jV8jiD56ilpO4ra8zjJ5Q3eLNkw38uhuhdPn7rHsLs/yLv688LJVIoyKfIj4pcCaKEoVpCa1iCQFCODcILnXbtvUU25OBIESoV2itTxm6FEseQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SN7PR11MB6826.namprd11.prod.outlook.com (2603:10b6:806:2a1::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.26; Wed, 20 Sep
 2023 04:08:07 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79%5]) with mapi id 15.20.6792.026; Wed, 20 Sep 2023
 04:08:07 +0000
Date: Tue, 19 Sep 2023 23:08:04 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
Message-ID: <l4avy36wdkxxcmc2beblwvplfokvhrxbybfmmsmm22mt6gjjyc@gk24v7rkvwok>
References: <20230919144111.32702-1-gustavo.sousa@intel.com>
 <w7l6s4ywimggliinhccwbpnvepxera3an6raryyffusmenesng@me7t4rjxmyjz>
 <169514495100.2105.12416170725310981140@gjsousa-mobl2>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <169514495100.2105.12416170725310981140@gjsousa-mobl2>
X-ClientProxiedBy: BYAPR06CA0013.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::26) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SN7PR11MB6826:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c8e9524-88f0-441f-f940-08dbb98f31e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 58vv9L4Tg3tu6Kv49/CkH31f3EYgCjdru+/GGUH+3nHn7c8SK3jFNNd56cFd5XWAjzDu1dOfGK9UNm6LsfiVJAu0g2HA3ePdpEV1yScsLZa1jhDahCmMrgHUWuLcyG3bVIcBok0+PSCJBZ41BmhE/ha6+1w3T025KrWd3T7coMyRe/TRTtRoqJxD2C4aOebrdFGXe7ttqe7LSfAZFd3u7MNWPr/C5K/0nsILRikMv75gRb68P44u2d3bHxPv407evakgoqXLHupwYyhlaXlWcbgtnmqxH6NodnGkrjM0mhHwgmPHQjpUVor2eIXP6vjzUX3O70gb1lb+CA0k9XNjcfkrhHnSfuPj/AzlwECmzCCyFBTk9hmrH73Kq+XW+18mSDzRIxkVckWfcbeVzhN4O3TP9yWhtURIfMDF9EJdK93fZHfzLJLoXRj0Re3/BIi6iqXq67DHjSN6kwcVp8FfvKrwT4BrvDwZxDkDz1T9Pw/0iDMyicxi2XvYfNkkpL/oeCxtvXBhxReoJ+zi/ZmcmCvM33tCWegB1cmY71v6th6gw5oBE/0s3ue7/asX0H8x
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(366004)(376002)(346002)(136003)(39860400002)(396003)(451199024)(1800799009)(186009)(4326008)(2906002)(8936002)(8676002)(316002)(6636002)(41300700001)(26005)(6862004)(66556008)(66476007)(478600001)(66946007)(5660300002)(6486002)(9686003)(6512007)(6506007)(83380400001)(6666004)(33716001)(82960400001)(86362001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?qyzfV8oH4GUgM1H0uB0aJ0NLI1ZnVlMThe+1mAv5AMHEcUah2hBC8FR6nQ?=
 =?iso-8859-1?Q?paX2hs97DteG2m4Z/zFvjjIcP/m5T5rdpchSdR1TwoDs9mbivQsGrpz1fp?=
 =?iso-8859-1?Q?xvhpRL19y1+tVZNmzXDp6vkhENFyj/1Npg9uVBnFwxx5o0pp1nrX7znocd?=
 =?iso-8859-1?Q?prKUDTczQJ8y7EMA3lqkOtWIPafyBiX+1Xqk4tvxi/g7ckJeFrfYYZM1yM?=
 =?iso-8859-1?Q?if1e2cQBkFz/jrhoCUkb9dES/GEUSwAR49v4XXkwYQebByZbmsOnnwOxWp?=
 =?iso-8859-1?Q?rIgy5cY1b4iTGlqFfxy20BJ8SGZDyxG2tVZCA9r7ocnTFsLDzHOA49voke?=
 =?iso-8859-1?Q?1PxaCCEIxsPPS0sW/zPGAaSHw9TSWazx8rKg5ZFFm7y9gU8ETa9Mq48dKj?=
 =?iso-8859-1?Q?A6LW3di0laWe/5RkFvFxFjmaOBVNwmb58UevADM28IjkWNgoWGOZS7KE29?=
 =?iso-8859-1?Q?QPngJo5qHsUdkZa2LA7t8IHuetkkwXbj+4N0hTc7KR5cs2bzRs8FuMAlk/?=
 =?iso-8859-1?Q?JGMMV8ieGJTJCv4BrG45wPOdEnzP/LztIl0mEFdZegxsMvRsF7l9KRpaPE?=
 =?iso-8859-1?Q?8oquAftdHk8J/sJHFOAGcGn6OUPzZ5kYjSm6GWFUDBYcr8/MxNJtBMs5VH?=
 =?iso-8859-1?Q?VzbxWAWQvywlqqb+6OkJrb914uQ4FbJq29VKHSPENVopMwlbY3Td2k1+Vw?=
 =?iso-8859-1?Q?lGnuaUZi50Vk30a8UPwfn5hKe4Ix+QdI+/Gc0FA/Vbj7zKvIwLeb2aJ5xP?=
 =?iso-8859-1?Q?QR7ZrgEjFhbMAvGyBnH+qcCQnNmTphshurl1eaqjUPxfZUqGtmRAGYAP13?=
 =?iso-8859-1?Q?2GM87/rsflpOVuezg9yjEY+9yXdY8Y1N2MYmc7IcY4RhQkxZBeMej0XT46?=
 =?iso-8859-1?Q?JPK36fL4FBK44V0/CCZvRAPUuivA6GhqgJtY1+bxgMv4gnpjfueYURpBrs?=
 =?iso-8859-1?Q?X+mnH44hBVFaprn1r64EcTjje4jjKM2PuHEllaygkRViRqHjHF1NwiqPho?=
 =?iso-8859-1?Q?7OT2kSRnxokJvc/ehYaQsEosYUWUdf19GfLp/D2XFf6SQqz9nFxxvBNJy/?=
 =?iso-8859-1?Q?MgAkfQbdxsHqs5cvqRQ9wUVHx+xEeDVq0z/fS8qpunaLdq5KAagYsjySwU?=
 =?iso-8859-1?Q?2OAKXzUFRHWZF2+1zw5aML0rkmW0ZSKXnPMbLm2y768luiR4hbI7sUix6n?=
 =?iso-8859-1?Q?8KB9I49SQU+ygf9E+q7zaqRJLrfy20wYdIF7t4PP8rty7MncdXCAMg9ngx?=
 =?iso-8859-1?Q?wpNlzP5CXoR571l/RqPs690TKf9fQvJgar2kn3sd4ScEq1yz2LVEB2h9Be?=
 =?iso-8859-1?Q?Z4YfTls1QYZzMax2rmXazW2s+Br1Tya4T/Fnn/bUUo1SyO+Xd4QBOHf+fq?=
 =?iso-8859-1?Q?a6wqyv96+7cAXL+BfSnkkI5OJV43smTeYvGEtcoL6UPH3a7q0cHwF2wxmj?=
 =?iso-8859-1?Q?Jdv8zLac0e11AP08pyAulZlXEFujBmTicjT8ckkcVJqDtHWym3K/E0Pm5L?=
 =?iso-8859-1?Q?iiV4nAbwjCMrGAhDecwpOPB5fAPbOTOjkCMVUtfI/YoTuli9xSdZ8QOk9g?=
 =?iso-8859-1?Q?f8YruP5ZrAfG0cAB+TGFUWpPBwgr3vGsLNZMjHcl7hGGKFQPMk5PbVtKjL?=
 =?iso-8859-1?Q?uDBZ1ct2Ad0rteuzFZxxzgOwwcrCUnfuy7WZDjJOVVTMCdHj3mOo+rBg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c8e9524-88f0-441f-f940-08dbb98f31e8
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2023 04:08:07.4115 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OXBTbj0//0FRYaemGUIxu93Kds5pul0vic462apvHna3u9RRMhCiNJJyDw6yUFXjlQIg2267DOHjSayyKWyPDUsNmbVGDlCASI9+E7drvc0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6826
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

On Tue, Sep 19, 2023 at 02:35:51PM -0300, Gustavo Sousa wrote:
>Quoting Lucas De Marchi (2023-09-19 14:31:24-03:00)
>>On Tue, Sep 19, 2023 at 11:41:10AM -0300, Gustavo Sousa wrote:
>>>Starting with Xe_LP+, GFX_MSTR_IRQ contains status bits that have W1C
>>>behavior. If we do not properly reset them, we would miss delivery of
>>>interrupts if a pending bit is set when enabling IRQs.
>>>
>>>As an example, the display part of our probe routine contains paths
>>>where we wait for vblank interrupts. If a display interrupt was already
>>>pending when enabling IRQs, we would time out waiting for the vblank.
>>>
>>>That in fact happened recently when modprobing Xe on a Lunar Lake with a
>>>specific configuration; and that's how we found out we were missing this
>>>step in the IRQ enabling logic.
>>>
>>>Fix the issue by clearing GFX_MSTR_IRQ as part of the IRQ reset.
>>>
>>>BSpec: 50875, 54028, 62357
>>>Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>>>---
>>> drivers/gpu/drm/xe/xe_irq.c | 4 ++++
>>> 1 file changed, 4 insertions(+)
>>>
>>>diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
>>>index ccb934f8fa34..3746e9204e48 100644
>>>--- a/drivers/gpu/drm/xe/xe_irq.c
>>>+++ b/drivers/gpu/drm/xe/xe_irq.c
>>>@@ -456,6 +456,7 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
>>>
>>> static void gt_irq_reset(struct xe_tile *tile)
>>> {
>>>+        struct xe_device *xe = tile_to_xe(tile);
>>>         struct xe_gt *mmio = tile->primary_gt;
>>>
>>>         u32 ccs_mask = xe_hw_engine_mask_per_class(tile->primary_gt,
>>>@@ -463,6 +464,9 @@ static void gt_irq_reset(struct xe_tile *tile)
>>>         u32 bcs_mask = xe_hw_engine_mask_per_class(tile->primary_gt,
>>>                                                    XE_ENGINE_CLASS_COPY);
>>>
>>>+        if (GRAPHICS_VERx100(xe) >= 1210)
>>>+                xe_mmio_write32(mmio, GFX_MSTR_IRQ, ~0);
>>
>>shouldn´t you exclude bit 31 (MSTR_INT) since it'ss not a status bit
>>and would rather enable the interrupts... ?
>
>I thought about that, but looking closer at the BSpec for that register, that
>bit seems not to exist for the targeted graphics IPs.

true, I missed that... but then this would be a weird place to reset
it. We already forked the irq setup in xe_irq_reset(). Also, this
is going to be called for each gt, which doesn't seem right.
Better to move it to dg1_irq_reset().

Lucas De Marchi

>
>Gustavo Sousa
>
>>
>>Lucas De Marchi
>>
>>>+
>>>         /* Disable RCS, BCS, VCS and VECS class engines. */
>>>         xe_mmio_write32(mmio, RENDER_COPY_INTR_ENABLE, 0);
>>>         xe_mmio_write32(mmio, VCS_VECS_INTR_ENABLE, 0);
>>>--
>>>2.42.0
>>>
