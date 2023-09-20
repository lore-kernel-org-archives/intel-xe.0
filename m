Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A330FC04AAA
	for <intel-xe@archiver.kernel.org>; Wed, 20 Sep 2023 16:13:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 501A010E0D3;
	Wed, 20 Sep 2023 16:13:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8302910E0D3
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Sep 2023 16:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695226433; x=1726762433;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=bPCeRuBNsuHnKNl6pZiwPAD209QhcNcPpPomlNW9nJM=;
 b=As3JC6eJf4n8glMWMls9kAYMpAKeSKhKEfncx6WG4pMh4TN5aMDkdgoI
 HUdIRUlcTD1Ls0ZPRqFVNb3qVNiNhVCjWIhli99ORQzrnIVO0/UvYZQFa
 +8Ii08sM7XN0UMk68O8/5QDU+XjQsqvN0fw1fca4awNa1GYD0KdwgAHv/
 hXelAThvsQkX+mH2Vfw48sio6ibSfQafNJ8rw4R/Yldf+u7UxbfeEQGp4
 o3CHHzbTH7CGFwpaty+wgAB0aWCDTUBe8UWY2DlySSlRDxaix83tChLtB
 jUaWvxjAsackfcVxh2klGednMKinqxkLgUjU8K+y+mLc55t4P8LOxnSXJ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="377571708"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="377571708"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 09:11:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="812215459"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="812215459"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Sep 2023 09:11:26 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 20 Sep 2023 09:11:25 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 20 Sep 2023 09:11:25 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 20 Sep 2023 09:11:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WK1L5iVu0e0+JS3/nV/TLOxaFZf2+Qnoa6ubX48LR9MSrj8BmM+3BD6j2VpeP4rh5IB/pB90NgC4pTIHCeqNHAyWKOajmZVUfZm9VSgj/2ijSHM+JYBsfmt3SHwyevOCpYk9HOTlrh/q9cb2AUq6uy9QI2TSgw8VHNARbjm1a7xFOM9JTywsR4NEOpwDUWtAO1Wj892tTv3XBtTN/zC1hJKsOV4+aY0L+YLzb5vEsMCtX0KMFZNszRaqqtvOByMT9G5Uq4nQ1UvLmIJPC8uHYEhGDRQSoxkaN3cqQS+s3nKdSmzEsyiM7l94pxAak80gwZ9oEehyCO39FTdH0G1Ebw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U+VN6lG93QAWsLEi6P0MW5wkCOsTKHPYa/Alh0cLohc=;
 b=ciMGOR6IPKWIsFifWXp7hXxurUrD1u1C35p7VyR8TMZVhmRKummMapX9FkgIJkwWwMBrUE0NOU2o2Y0DJHmKzsc6ZgIMypRjOlxfx/6pWBAZ39VAWQMRD96fjVGz/qBul2T0WB1oM718WzNhhD8r0UHSf6Ai3KdNVK9iFpNGnY6HdZ4vyHZ0u6d7psEmXEEW0IED4dnJ7cc9YJ8n4ZjwddAQT8J3aELuunRJh/l/xhbK0jxZRGpWnShB0o52rXm5jvKN3gr/954AFlRp9KWfc68IEmJO+MaYFi3bkqRHIudrVBfifuKJ/WonJRSdzvybrutnkgRqtzumJIugWox3ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN8PR11MB3556.namprd11.prod.outlook.com (2603:10b6:408:8d::31)
 by BL1PR11MB5954.namprd11.prod.outlook.com (2603:10b6:208:385::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Wed, 20 Sep
 2023 16:11:22 +0000
Received: from BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::d89f:e7e6:dbb3:3ddf]) by BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::d89f:e7e6:dbb3:3ddf%6]) with mapi id 15.20.6813.018; Wed, 20 Sep 2023
 16:11:22 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <l4avy36wdkxxcmc2beblwvplfokvhrxbybfmmsmm22mt6gjjyc@gk24v7rkvwok>
References: <20230919144111.32702-1-gustavo.sousa@intel.com>
 <w7l6s4ywimggliinhccwbpnvepxera3an6raryyffusmenesng@me7t4rjxmyjz>
 <169514495100.2105.12416170725310981140@gjsousa-mobl2>
 <l4avy36wdkxxcmc2beblwvplfokvhrxbybfmmsmm22mt6gjjyc@gk24v7rkvwok>
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Date: Wed, 20 Sep 2023 13:11:16 -0300
Message-ID: <169522627644.7665.1350296536892918335@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: SJ0PR05CA0019.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::24) To BN8PR11MB3556.namprd11.prod.outlook.com
 (2603:10b6:408:8d::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR11MB3556:EE_|BL1PR11MB5954:EE_
X-MS-Office365-Filtering-Correlation-Id: d90243bb-a4e6-4430-5f35-08dbb9f43b47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kU/qa1P1jKkfQu/BbC6cxbjNBclw4CVeyf6PD8nvJYfRnWIzYjuic+lbGLtjPqdo3CJIEuuOliBHkx4KGopSAYZaDyfhCY3/wRwuLrVSrVx5q09USmJFUniIcZoQFUagLP070l+EcqVL5ahvpCkel9O0g68+RnkvfxgxJ344lkVCuYAzqn+KpQknD348wIFaj1l8RaERNY20geNInXV2IXQAyxf3CeFM1qHVZivK8FTSK7jVNer+36fn+SES3ekINbZ1j1krgg9keM52x18uhe+bCXeFqNzAwREc/vcfHjDrgp95z1KgQAfZoyRAzVinaYL9wdZwjBvNAL5EbWKlBkDtoYCDJqS/+9vrXrhYgE39ST4zsnEJeAXc4Qa7tN9QY9W0ur1CovYu+jgeCl3QpVR3bsR02nEDvLYoU6BqOGadIS0Itl8+4d1UimmDpx4w7RyvTYK8MgMDfnj6iALRuF53jquv3lz0kLjmnZGVTF3R99VU9UtRfRBy5PLJLpSUwvatCHievYtidHIwKAv+YqCBoTQZwqTiPXeZI6vBAy54d0wuJxVnmaBeRFqh0dCW
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR11MB3556.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(136003)(396003)(346002)(376002)(39860400002)(366004)(1800799009)(186009)(451199024)(26005)(9686003)(6486002)(6506007)(6512007)(33716001)(82960400001)(86362001)(38100700002)(83380400001)(478600001)(5660300002)(44832011)(6636002)(41300700001)(8676002)(66476007)(66946007)(66556008)(316002)(4326008)(8936002)(6862004)(2906002)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RU9nRzFuYnc4UE9rUUxrWnRwMkViSU9jS1VQODUzdFZjWEFFeHN4T1pwSDBs?=
 =?utf-8?B?c2hqQVRpcnJ1anE3cE5Sc0p4MWs2Ym1qa1lRL3VZYUJJMndhTE5wM0dYYkVk?=
 =?utf-8?B?b1E3Zk9ydjVwN3pXbDhVR2tuSzdCQk42RThpZ0ZoaTh3enVsRk4yUlp2VE4y?=
 =?utf-8?B?cFduTUFEWEpaWFFjeVVtdmZUNTZkZzNWNlZzdlJISU9WUnJURDBBRjZSbmZE?=
 =?utf-8?B?SXVVb002elFCMnNoajVrWmlpTEtZdjcwOVh0bjFOM3VYaHRlYm95enVXVGhX?=
 =?utf-8?B?UWFFNE1oN1JEUWpRbDFYMkhVcExaalYvVUw5dzd6YXprMFo0RWJWL3h4L01E?=
 =?utf-8?B?RE9XTVRXOHhhcWtPVDcwN0FkRHFSYWlrd2l1bk9EbjRDSStPcUQ1Q25oeHFP?=
 =?utf-8?B?aDZrcEZRZi91SFRXT2ZtbS9Yai9OMk1ZemFOUkJscmwrdlhobHozbVJ6elBX?=
 =?utf-8?B?ek8wbTJ1M043Y3ZSWWs0Q3REalFlQ1c1VjloT09sTnRKeXI2c0FCOFB6NEhJ?=
 =?utf-8?B?M2I1SU5rTFF6MHBpZTE5VDV3T2l5aGZsdDlYcWMySTgxTnV6NG9QOU1BZUl6?=
 =?utf-8?B?eTBma3dJWTUyU1dNT0htMWpudVY2U0tOdDJNR0NkZlU2MDN3elR3SDRKeVds?=
 =?utf-8?B?eTVqdlNnRXh2dXRCeHhvYWM2K21ac3lXYUxhcDJWN1JlckJDeTFoYXZkQmV1?=
 =?utf-8?B?RXR4MGJSZ0ZFeDhTMm95dFFwaEhqVnNwTXU5OVEyM3ZNRW5vdmp4aDh3cVBJ?=
 =?utf-8?B?YTVvdnV2QnVjREFQWHhmNXhQRGN0ZXk0a2FSUjg2TTB5dmR1OFFRaVVHcDBE?=
 =?utf-8?B?UUhweVByQy9PZ0dxSnpkUmNEY3M3SmZJc2tyNE5qWHRXRTdPd2xISXlaZ2w0?=
 =?utf-8?B?OVdNUktkN0JLdTRCWGJuaFUrczkyQ1hHVmhnak5neTV1akdMTGp1NmVaMUFS?=
 =?utf-8?B?VFYzM2EvZDQ0dm1oTG03MURTZGZGT3pEY20yVVhZVGJnd3BGTjlBTHJDQWtV?=
 =?utf-8?B?TzBhdFlGL0JBWUQ5WnpJWThFdDhVTnhGajBnQkluZ1hBa2JRZE9EM3dYQU9Y?=
 =?utf-8?B?MURzUWZVdDV0UW1aWTY2WThKTjU1R3hUWEdIeWZyd2RZVUEzQmNWc1JKWUZw?=
 =?utf-8?B?NDJjSnY5UmFCUlgxaVlicXhhTlFRM083K3VrbTBZdjBManhuVDJkb0xaTUcr?=
 =?utf-8?B?aUxKK3NsRStmVG5pODEramdnZFQ0M0R1cDd0MmlkdEtSRTlHODgxWk0xM2Vv?=
 =?utf-8?B?QWMvS1kzdW5KUnhsTUhQaVNkdzFrb1VuU3Z0NlpnVlRZZk9QT1JVVi8rbjRi?=
 =?utf-8?B?RFVyZCtRdG9lM3dJZU5HckFvUGtIZmFMbE5NczlXZWthMzJLYzdEa0hVVFdZ?=
 =?utf-8?B?MEM2T05BSTlqVm1uYWo4TE9oUE5EbDBpODd5aVF1VXV0b0J3Ymp0NTlPay82?=
 =?utf-8?B?dXNraVp1ZVE4dWhnN1lDVVNrZ28xVTMwSm1FYnhsaStDZ3dQdzV1d2NqTmhG?=
 =?utf-8?B?MGRoMHp1WEJCNUU0NVBGTmw3RVhnR1ZzbEphM1M4ckZYVnZDVENnVlRoN2Za?=
 =?utf-8?B?U3BvSlRCWmh6OGFIdGMrQjJCTFVpM3c1TWFIZTY3TGt0OFZ1WmlveXk4bHI3?=
 =?utf-8?B?bTZBM1hBbWhIeVFlMXJQbkQvZHdueEZZZGdqelEvUTNOMlVlb010b1VucThU?=
 =?utf-8?B?SXhxdnVpaVFrZkhYOTFVMWtPNkRpTnM4KzJYWSs0TWI3VXgvM2ZyTW53Tk4y?=
 =?utf-8?B?ckF4U2RlTTMzWmdsaERUVUl4L0Q0TFBFZ0hpQnVyMHc5TnE4V01VRGVyTGIz?=
 =?utf-8?B?RDBkaGxuT3QwTVV6RzNLRjdRdW9RM3FacXRKa1RvdXNQY3Vnd0JoQ1JMVHJR?=
 =?utf-8?B?RU00dFpydzBiNCtkZUVUeEFWY2t5WXdCblJuU05zSGZkWitjMXVUNXRYQTdh?=
 =?utf-8?B?WDN4Z3hEYTNMbU5jK3lhVm4xS3lwa2RlTmFnUXo4QU5hbjR1S1ovdlRLQy9r?=
 =?utf-8?B?dFptUlFuTWdwb2NBSm4wZ1FESEhVNUl0clpIeUd1bGswNkNmODVxb0d5UEN2?=
 =?utf-8?B?TjVXR1RXVFlBNkdvUEVKdjVrTzJTN05OK2FKM09FWUpNS09PZFR1YVJmMVV0?=
 =?utf-8?B?aWx0NmZleWdpY1RBeFlUeUVvMHFBSWhpNElXUGt0ZjVEdkpmTnAxdTZsSjdo?=
 =?utf-8?B?dnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d90243bb-a4e6-4430-5f35-08dbb9f43b47
X-MS-Exchange-CrossTenant-AuthSource: BN8PR11MB3556.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2023 16:11:22.5515 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KN7IkbIBbYWdtdda0+JPjWhtaeXTwDOeo3Csa2XJa/PqScaEMAH4jLJ+348m6y6Km6xLNIyfsDUHzg2w/zh0MA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5954
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

Quoting Lucas De Marchi (2023-09-20 01:08:04-03:00)
>On Tue, Sep 19, 2023 at 02:35:51PM -0300, Gustavo Sousa wrote:
>>Quoting Lucas De Marchi (2023-09-19 14:31:24-03:00)
>>>On Tue, Sep 19, 2023 at 11:41:10AM -0300, Gustavo Sousa wrote:
>>>>Starting with Xe_LP+, GFX_MSTR_IRQ contains status bits that have W1C
>>>>behavior. If we do not properly reset them, we would miss delivery of
>>>>interrupts if a pending bit is set when enabling IRQs.
>>>>
>>>>As an example, the display part of our probe routine contains paths
>>>>where we wait for vblank interrupts. If a display interrupt was already
>>>>pending when enabling IRQs, we would time out waiting for the vblank.
>>>>
>>>>That in fact happened recently when modprobing Xe on a Lunar Lake with =
a
>>>>specific configuration; and that's how we found out we were missing thi=
s
>>>>step in the IRQ enabling logic.
>>>>
>>>>Fix the issue by clearing GFX_MSTR_IRQ as part of the IRQ reset.
>>>>
>>>>BSpec: 50875, 54028, 62357
>>>>Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>>>>---
>>>> drivers/gpu/drm/xe/xe_irq.c | 4 ++++
>>>> 1 file changed, 4 insertions(+)
>>>>
>>>>diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
>>>>index ccb934f8fa34..3746e9204e48 100644
>>>>--- a/drivers/gpu/drm/xe/xe_irq.c
>>>>+++ b/drivers/gpu/drm/xe/xe_irq.c
>>>>@@ -456,6 +456,7 @@ static irqreturn_t dg1_irq_handler(int irq, void *a=
rg)
>>>>
>>>> static void gt_irq_reset(struct xe_tile *tile)
>>>> {
>>>>+        struct xe_device *xe =3D tile_to_xe(tile);
>>>>         struct xe_gt *mmio =3D tile->primary_gt;
>>>>
>>>>         u32 ccs_mask =3D xe_hw_engine_mask_per_class(tile->primary_gt,
>>>>@@ -463,6 +464,9 @@ static void gt_irq_reset(struct xe_tile *tile)
>>>>         u32 bcs_mask =3D xe_hw_engine_mask_per_class(tile->primary_gt,
>>>>                                                    XE_ENGINE_CLASS_COP=
Y);
>>>>
>>>>+        if (GRAPHICS_VERx100(xe) >=3D 1210)
>>>>+                xe_mmio_write32(mmio, GFX_MSTR_IRQ, ~0);
>>>
>>>shouldn=C2=B4t you exclude bit 31 (MSTR_INT) since it'ss not a status bi=
t
>>>and would rather enable the interrupts... ?
>>
>>I thought about that, but looking closer at the BSpec for that register, =
that
>>bit seems not to exist for the targeted graphics IPs.
>
>true, I missed that... but then this would be a weird place to reset
>it. We already forked the irq setup in xe_irq_reset(). Also, this
>is going to be called for each gt, which doesn't seem right.
>Better to move it to dg1_irq_reset().

Hm... Actually, gt_irq_reset() is being called for each tile. But I agree w=
ith
the suggestion that dg1_irq_reset() is indeed a better place for this. Than=
ks!

--
Gustavo Sousa

>
>Lucas De Marchi
>
>>
>>Gustavo Sousa
>>
>>>
>>>Lucas De Marchi
>>>
>>>>+
>>>>         /* Disable RCS, BCS, VCS and VECS class engines. */
>>>>         xe_mmio_write32(mmio, RENDER_COPY_INTR_ENABLE, 0);
>>>>         xe_mmio_write32(mmio, VCS_VECS_INTR_ENABLE, 0);
>>>>--
>>>>2.42.0
>>>>
