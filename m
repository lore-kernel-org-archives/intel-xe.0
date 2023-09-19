Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E11CCE79A8
	for <intel-xe@archiver.kernel.org>; Tue, 19 Sep 2023 17:36:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0DEA10E3C5;
	Tue, 19 Sep 2023 17:36:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D41F10E28D
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Sep 2023 17:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695144961; x=1726680961;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=0P+7pmI68ukeM97ej66irqbacCJDDVql+0qbw+7aKSo=;
 b=QGU4DrV+AEIGZRfcxBm116HDWZcvSwppOWwh/lx1n7U7XTA9MkrBv0SN
 V7852zFBFL07fW0oJ+Jsv+QW5k1rk0hZOgzqDJeAolWzWYk4eNe1EKPp5
 FN++/ZPwJbS3cDrWGzBdgN7KNj1V7ubWAhHOr9CjGWSdS//oLQQ0M+39k
 GmxJel7AhcRIUXjZ+HV7E3yqOh+pKCZo5JVAoTh+/n0Z6ao05rsWwOSNQ
 dLrFuWBp66U4it3AGUgtDKqLd2HURYuerxSzFLbaBJz4u2x2rK83ilyoH
 oldyeeLdBjTwtnGbYFe2gh1Er7bqxybUryqfo9mO3M+bJz50R4vyJN27q g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="370320327"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; d="scan'208";a="370320327"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 10:36:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="739813695"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; d="scan'208";a="739813695"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Sep 2023 10:36:00 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 19 Sep 2023 10:36:00 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 19 Sep 2023 10:35:59 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 19 Sep 2023 10:35:59 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.44) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 19 Sep 2023 10:35:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c/K7r33J5SClTO0S9XGbJfcPzHjM5rtBB9Q6RuiC1AWBJ2eMmtD7uVaJ+/9dxxF1khrj234Rl4iOYZsR+TZuO32xAPIlRJdm2qF3sqbXMi27TpyHyU9nk3kiz6G9c3wr3UdcpsdOAWe8YnnkhbDZvA84Camt4iBbJ3QpQ0ZOTy0ggemvFUUMmQDJckFYI0YgJnhTtT6hccwi73YiPUEEJ3rxhvcDR3bJmbQURxkMwtgf8J05oG3L5oQQo/Wm4DK/1yX5ua7+WfKjucTvOHMPzy4hfWDlHehZnQQACUNQKAChIlW+tQz5hmHoAP7ypP4HZg1/XjzdYt8YcoBCKqQHkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zQ3fBlaFWDODHYo72ahs03+OUY1T6mBG9+RCMxq+5U8=;
 b=Z5PhibDa0HXkbSL3dMzHv1jUC+1MJgx7hfBeIVaK23475YPJ1IEJ16/UuECfNx6AktjFKz1+JYadizjPNgN/9I9V8m1JXLWCLul4l3Yp9FqJKoyPpVb86CkVpL3NyIenGKnAWKpqRa8/GKpsapZ/jBL+bOFJD7hEyOq6IwXa3pHbN7m8bb6x6tJn69mAuUOI3d+6vpeI4zVEB9Oaq2Q8ngnxYJp+B/3caIlflL4urlGDTfY1gG7X0LeLEozUIKoqwVCoQ1+eqErjoGMpEbnS3XtoqnAaGvT/FWm2EMki6in/wAO6kBLJfqMEQWYMq9De6cS7nwkaNEquCgW7IkeV5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN8PR11MB3556.namprd11.prod.outlook.com (2603:10b6:408:8d::31)
 by SJ0PR11MB4896.namprd11.prod.outlook.com (2603:10b6:a03:2dd::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.28; Tue, 19 Sep
 2023 17:35:57 +0000
Received: from BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::d89f:e7e6:dbb3:3ddf]) by BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::d89f:e7e6:dbb3:3ddf%6]) with mapi id 15.20.6792.026; Tue, 19 Sep 2023
 17:35:57 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <w7l6s4ywimggliinhccwbpnvepxera3an6raryyffusmenesng@me7t4rjxmyjz>
References: <20230919144111.32702-1-gustavo.sousa@intel.com>
 <w7l6s4ywimggliinhccwbpnvepxera3an6raryyffusmenesng@me7t4rjxmyjz>
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Date: Tue, 19 Sep 2023 14:35:51 -0300
Message-ID: <169514495100.2105.12416170725310981140@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: BYAPR06CA0058.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::35) To BN8PR11MB3556.namprd11.prod.outlook.com
 (2603:10b6:408:8d::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR11MB3556:EE_|SJ0PR11MB4896:EE_
X-MS-Office365-Filtering-Correlation-Id: d02e8ea3-6bd5-4a36-ee2e-08dbb936e1d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rXRsAZiEOE0GA5DCyqzMsvCix7ZkZFoaI5WMzjdCzXoGsOzqmIcjizi7fHy9hi/qsuVkMf1fMDQt6GfmHABJWlRefPwaKBJSQnxI3+XJcnCUe0sifBOvZYeUhQbVil1mmE7egJUswxZW4uNo7uTUePc2+sCJaEJnRXsjwX2qC+JJY71zRhY/C2354y232SCKIvxh6Jg4vQynnJOeU7gSVJOoOb9WD1oGrbyRlYcR1oEWi/immC4R0kzes22hR6PYMZOEPhyUJhS7qRspI7NGcWgEJiaGyj2UekwA95l0lPxNsNa/UL2w8hv/Xz8M2ysGxpVLX6Pc3Dn2J3oa7505gQ1BG9MTHMjfhCYRrh8rb0gnL2pvUHsseJ/YPY2Ogc/WhXMsUHXLC2tR5+B/xJ30JD8o4YomQxqVpWIv3zFT6q/tQNkpXIPzbrlWUY9HPf8q2XLw4GYrFWhRmxQl5hrDxOzJ6/LeW+OwhtxtJ0QFSUWEw5NI5rnWj6EMJAKunpCEuHTkUsnA+AdEQYT/8D4UFMqp2nULF07tIkeNcf4GBCX0ZbMRHLFlFLBY8wdCcq7p
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR11MB3556.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(346002)(136003)(396003)(39860400002)(376002)(366004)(451199024)(1800799009)(186009)(33716001)(44832011)(5660300002)(83380400001)(86362001)(8936002)(8676002)(4326008)(41300700001)(6862004)(6486002)(82960400001)(6666004)(26005)(6506007)(6512007)(9686003)(478600001)(66946007)(2906002)(38100700002)(6636002)(66556008)(66476007)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NTJCbExSMXRKZThvZXR5dnMwQndqMXI5MmUxN0ozdXZ3ckkyeDhhTlhBSVBW?=
 =?utf-8?B?RU1aMmVZSlpabjdGQmNwQWdOeGZlRnhYYUZxa25HRDNiQnIzVmw3Nzl2MWEy?=
 =?utf-8?B?bFlJZWhDUHZKRnJhZld3MXAzR3RpZFl1dlBxMlJiZ2Q2azAraERBQmZWZE9B?=
 =?utf-8?B?MEkrTmN5SWtlN3ptU0haT0hseHhpeXZXYm5FZ2pTK3B0S0VNQjg3M2E4TWtX?=
 =?utf-8?B?N1FxSU9xSTlCQ1lBaXltaFZaYWs0dzlDRmJ3cktrbnMweXNQU1RWemdnMEVM?=
 =?utf-8?B?eUVHOGREa1Vmd0psQVJBUlUxUGtDQW5ydFFKSDZ2UTdvSUorSVdqelB1MUZB?=
 =?utf-8?B?VFZ3aUw4WUNmS2prNUE1SllZaEhQd0RmODhxRkRpVE5Rb2NxK1FiVFovclEr?=
 =?utf-8?B?WVFwK0FCd3ZrZHg3bHlRcHdhVzVTelVuUGZ1c20vM1F4TlNjQlJ3d2EyMXZZ?=
 =?utf-8?B?T2FzYm81OEZLNCtnY1RvdnFnVlhXanN5VjlTYlVnSzNnZVE0TUR0UmJjTldI?=
 =?utf-8?B?NnJRNU5vcEozWDNacjg3cXB6Z1lrb1JBdmptRnA0dFpzU1NEdW9RYi9WdlRx?=
 =?utf-8?B?WGg0cG1SRUZSMDkvSkpXRlYwZzRQdjNhT0xxaGVHQ2RuMFVwZjNDbEQreTE2?=
 =?utf-8?B?djlFdCtrMjlOdXJDTkdOZkpDcnNWaCsyc0M5Z0YzcGRGWXB1NjJWT0lyditw?=
 =?utf-8?B?WlR5ZjN6Sm5WcFR5a3o2TlhDNW95ZDZVdGN3aDZDcThZZDYrRUZkLzI5bzJ1?=
 =?utf-8?B?SUVjbkVFcFA3NnN2K1h6MWtmSGlNQTAzaTU1ZTlGYkJhak9mdStYUW9WQjVo?=
 =?utf-8?B?UldxNmZQOTdiK0tsTlc4ZEdkblpRY0ZhSVZQakJodjhxRjkvcDdVL3lWbWdV?=
 =?utf-8?B?TktVZW9tSzlXTXpOQ1dRMXRTSTErMnpyVEIxSEpFeXBCTDFBcTF4YVE2VitO?=
 =?utf-8?B?OFJnL3d1S1RCdStneUNIUXlXN2Y0a3IyRTRWNjIxY2hNaU5xVDhZYURtWXd6?=
 =?utf-8?B?RzAyZ0cwZ29naW1GUkFuOGxlQmFQUnVKam9qODlUMXdDNnZLZVBQdUMvR1lq?=
 =?utf-8?B?Z0RKMHlNaThvTVNBNklKa0tkSU5hLy9kYWdRb09DS1h1TkM5T0MxT2V2UmhC?=
 =?utf-8?B?NzYxNTk3bmgxSCtNemIzRytBM2U2TFNUUXBVRGE2WHUwWVVBMUhHdHlXOFda?=
 =?utf-8?B?OEtpbEZ3cjhkRlFNcCtGRzJzbFpYZk9Zd0tocUJLY0dtWWN0b0JnYkF2Ui92?=
 =?utf-8?B?SHd3U2hPbmJhTDh3SjBjWEMwdFBkdXc5UHVjWCtNcjEzVDl0c3JOQWxvVmJE?=
 =?utf-8?B?bldqSnBsa2ZGS0R5VWhOVWZ2Nm00bTNFd2tVT2hFVVI4RzA3Z1NJNmt0Z2xS?=
 =?utf-8?B?TTZKK0w5TkVmRk1UaUxPcDdGYWRlQ3Zpbk9QK0pGdlMvQUZYTUI2bEYrWGhz?=
 =?utf-8?B?RkRzSWpmcm00VGltWHQyN01qTFVSTy9lVjQrd0J6VFdiQXVCamdHa3cvdkpn?=
 =?utf-8?B?RWd0VFk4eHVIN0Z6Q3Z2NEoyV3BIeDZ6elloZjhZelFlY25NWlFUa0VBZ1dV?=
 =?utf-8?B?VVdpV1hPZDRDQlZHZUcrYVVRaUgzVWU4MWZJTUlmbWQ5dFdhT1hGTnc4NWJh?=
 =?utf-8?B?Q0g3RDIxYW5IV1puWGd3MTI1OS9ZYklYeTZlZ1ZXRTE0aVlhRW1leEhOQ2FO?=
 =?utf-8?B?cVYvN1NWQVp2empkMlpTWEE4aDJwdnpTaE11NlFOL2I3cFdBVFJnUDhqMmZR?=
 =?utf-8?B?MnRqYnR5ZlJyTjlOU3pieTFhYytiSjZhb3Q4cGtxSGNlTHBIc1pNUm9XaEVR?=
 =?utf-8?B?RDRiNUxoaXlpMldlcFBaSzR4THNpazJkbXZlUkMrblF0aWZ5QWlkUllzeU1y?=
 =?utf-8?B?MnIrUUlRMFVNRkRlanZRalVlai82dTFZb0hvSUJVdWc1UDVhUEhMS1FXQWho?=
 =?utf-8?B?NzVPK0N3WWQya3I3UnhvYmVGMWI2U2xGTDJVbWhOdE1QV2pLdjBEcjNGSlBD?=
 =?utf-8?B?QmpHbGlaSVN6Mk1WTzVSS1ZlZVFXYlQyYk5BaVBhSWFoc2lmTjVIU2k4dGxC?=
 =?utf-8?B?ZTRZWHE1dFpiYVUwdUo3clJza3pYclpMekRZamtYOUJQTUw3R3N6aUdITDZ0?=
 =?utf-8?B?MWIyclFHeTl0YkVmdEM1eVpXVnlyYmRoMGE1d3JnR243ZUw1NkdzRHdQa2xL?=
 =?utf-8?B?cEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d02e8ea3-6bd5-4a36-ee2e-08dbb936e1d3
X-MS-Exchange-CrossTenant-AuthSource: BN8PR11MB3556.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2023 17:35:57.3501 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OA/T13NqBDFwNAhLIjcr8mW2neDC2LnM3hfeGUKgohokrsNVb8aDnNKSWu9qR8xoXmO4NxIFRKlBZ699YwyLsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4896
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

Quoting Lucas De Marchi (2023-09-19 14:31:24-03:00)
>On Tue, Sep 19, 2023 at 11:41:10AM -0300, Gustavo Sousa wrote:
>>Starting with Xe_LP+, GFX_MSTR_IRQ contains status bits that have W1C
>>behavior. If we do not properly reset them, we would miss delivery of
>>interrupts if a pending bit is set when enabling IRQs.
>>
>>As an example, the display part of our probe routine contains paths
>>where we wait for vblank interrupts. If a display interrupt was already
>>pending when enabling IRQs, we would time out waiting for the vblank.
>>
>>That in fact happened recently when modprobing Xe on a Lunar Lake with a
>>specific configuration; and that's how we found out we were missing this
>>step in the IRQ enabling logic.
>>
>>Fix the issue by clearing GFX_MSTR_IRQ as part of the IRQ reset.
>>
>>BSpec: 50875, 54028, 62357
>>Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>>---
>> drivers/gpu/drm/xe/xe_irq.c | 4 ++++
>> 1 file changed, 4 insertions(+)
>>
>>diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
>>index ccb934f8fa34..3746e9204e48 100644
>>--- a/drivers/gpu/drm/xe/xe_irq.c
>>+++ b/drivers/gpu/drm/xe/xe_irq.c
>>@@ -456,6 +456,7 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg=
)
>>
>> static void gt_irq_reset(struct xe_tile *tile)
>> {
>>+        struct xe_device *xe =3D tile_to_xe(tile);
>>         struct xe_gt *mmio =3D tile->primary_gt;
>>
>>         u32 ccs_mask =3D xe_hw_engine_mask_per_class(tile->primary_gt,
>>@@ -463,6 +464,9 @@ static void gt_irq_reset(struct xe_tile *tile)
>>         u32 bcs_mask =3D xe_hw_engine_mask_per_class(tile->primary_gt,
>>                                                    XE_ENGINE_CLASS_COPY)=
;
>>
>>+        if (GRAPHICS_VERx100(xe) >=3D 1210)
>>+                xe_mmio_write32(mmio, GFX_MSTR_IRQ, ~0);
>
>shouldn=C2=B4t you exclude bit 31 (MSTR_INT) since it'ss not a status bit
>and would rather enable the interrupts... ?

I thought about that, but looking closer at the BSpec for that register, th=
at
bit seems not to exist for the targeted graphics IPs.

Gustavo Sousa

>
>Lucas De Marchi
>
>>+
>>         /* Disable RCS, BCS, VCS and VECS class engines. */
>>         xe_mmio_write32(mmio, RENDER_COPY_INTR_ENABLE, 0);
>>         xe_mmio_write32(mmio, VCS_VECS_INTR_ENABLE, 0);
>>--=20
>>2.42.0
>>
