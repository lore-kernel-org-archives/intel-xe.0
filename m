Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CA7CCE79DD
	for <intel-xe@archiver.kernel.org>; Wed, 20 Sep 2023 14:44:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49ACD10E4FF;
	Wed, 20 Sep 2023 14:44:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7238210E4FF
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Sep 2023 14:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695221094; x=1726757094;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=Hb9K3A7EMXdzL0c2KHZYsFVejT2LBGd/nE9jGYRIqs8=;
 b=EzkDqIl6zHne1u8Gh7qsSrESHIsod2R43OlVxtIrir7xmPQKXrBOJ1ko
 APG2fIPQdTzWizDZKv5TQPpso0xrDr1N7bGjquzjgLbXhZhXRgJm6J1la
 mq7mEr+TEMJqPbHCJHn0WhXF1l1Qc0mqzrBHz4pIIYiKRurjnJBjgyUDG
 UizlCDPPYOgQfYvFLW2I9CbAFGjoqhXWDOdnIcE0lCjxkmtJVSTM1EJQt
 vIN6mdhj+FbcdooVivDRTP6niYD7Vbvw9IcyyRHsC0YJ0/KI/KCrrK0pH
 wpcADo/ZyQ356PG27syydzrduvqam+P+yRQSodW/6xrDZjY0CBcHsWZkA Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="466551970"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="466551970"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 07:44:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="749939080"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="749939080"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Sep 2023 07:44:53 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 20 Sep 2023 07:44:52 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 20 Sep 2023 07:44:52 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 20 Sep 2023 07:44:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FXEc9Tzx/LoFLboLuMLqOoeSSHwMJf/1b0Ig4CSEPC4FTUpXpPHj74u7pL4jyttiLU0hRPH0lkBASiWzM+3ItXXTiFcvnDU/ZrQxnNLs9O2K+eGOU3fzK1La8Xg3lOKaXYUZWtTdQfxgqWnFmCxT5Sam1+7yoxG/dGbGZfv4nZBll7USsL02dnUSsDp60jxA2iFCOqBY3tGfiAOscvZnG7I3rVYUmmLwCFmWXL8SLlrjS1sHWJVyiaUOkKfr17XZI4pgsVzxezTLXd47a5BUrWO8pV6YqSpOpRsbRNH11put74wA9weBi3H7rLV7D4i7Fxi/JxhdWCCyBP+y0CleWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B42W+XPPpmFwWjp5Ot1PCPG+EKr5IxJJ6BYbJSeR/0A=;
 b=kBVeqaIG0shEezL5aakQf51eAjjbGiKIwOwC0ZulvYNMlZvVnCNqTZvC4Pe6IVlZaECr6JFNIbxUIE5pdQa+QCNXEiHq156REhjQn2lheMULXwKxEp9+xGKzwOxrFz3C0BVqzm/2fwUyfe6+59k/QgC8dxDhUuyAry93wtVFyExEo4HviodmNg5wcFuvAdS9ZSI/hzB2j8/iRo7xNp2sSEgfwcuUSwc+d/jIsm3y4+Q1s6zlB0SVpEYJzC6iqGo8Hire754F/ydahRPOusZ+VCC4T71NBaNKyaIYnM06OUCSBHt9wsf95AhzldHnZpxNWHKSkzNRtHGvIPCmXiPtwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN8PR11MB3556.namprd11.prod.outlook.com (2603:10b6:408:8d::31)
 by DM6PR11MB4689.namprd11.prod.outlook.com (2603:10b6:5:2a0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.20; Wed, 20 Sep
 2023 14:44:50 +0000
Received: from BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::d89f:e7e6:dbb3:3ddf]) by BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::d89f:e7e6:dbb3:3ddf%6]) with mapi id 15.20.6813.018; Wed, 20 Sep 2023
 14:44:49 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230919211506.GH233750@mdroper-desk1.amr.corp.intel.com>
References: <20230919144111.32702-1-gustavo.sousa@intel.com>
 <20230919211506.GH233750@mdroper-desk1.amr.corp.intel.com>
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Date: Wed, 20 Sep 2023 11:44:38 -0300
Message-ID: <169522107869.7665.12110197860331889450@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: BY5PR17CA0012.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::25) To BN8PR11MB3556.namprd11.prod.outlook.com
 (2603:10b6:408:8d::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR11MB3556:EE_|DM6PR11MB4689:EE_
X-MS-Office365-Filtering-Correlation-Id: a8cc11b3-dda4-4c1c-8a94-08dbb9e8241d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yscaMWuwsSPyuWVjLZMWXtpzLR9wttZ7t0W/WGnkAOiwhmwUyzFjnx9f1xfauRw62fT1gN9L4XPjk0XV8DVKc4Vw8quUkEyYfJFdxrjAwkAHYDq8JMxJxPKezXpYzIkSFPNWyXmgks/mWEtSGLbH+oLL9ndkIs5wyCNaFz2EjXJy7ilC7194i//kdzPeyCqVNE9y3AZMkoHDfFIfXaNRtmyt/GaITz1ABtTuETageg4GPoinURtg2pj6BEHjqmboJGut/1HlHR/wr31gvTxq3Sy9lRACxX5fmU85KvY/qkmbznE221KGSOAQy3Vc51gL+txahUDCz2Z6T1LlPBiLN7E7kTkiSBLKRZGssISO0eqJ3e719fup1JZ1USPihUWBEQuBwgoK7719sHIHzIUzIETitIa/Jb6JEX0tCj6mNOe+l5dInIiX9AtvaLYHP0dFQAGjwY7B6zybvGsFIy+0NIcz5pLS279NyF2rYzM3edRhzr16evBZktTChOBRV+6r1+lKifBkTSMx6IbKudjt8iO9/mOZdex7LO0N2J89wJt3WJBYXtMSAM5UEAfE4EZ3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR11MB3556.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(136003)(346002)(396003)(366004)(39860400002)(376002)(1800799009)(186009)(451199024)(478600001)(6506007)(6486002)(6666004)(6512007)(9686003)(83380400001)(26005)(2906002)(44832011)(33716001)(6636002)(66556008)(66946007)(66476007)(316002)(6862004)(4326008)(8676002)(5660300002)(41300700001)(8936002)(86362001)(82960400001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZlZaMTY2dlVuZkp2cjUzbjFkTnlqdUI1R2RtUUZwYjdyQWlENWJXRlE2enM1?=
 =?utf-8?B?NUFrUG9TazZjRE9TMUIyeW52VVBoakc5enNOaUdGRHFiaUZZK1B2akR1UVgw?=
 =?utf-8?B?TllNUzZQRlc1cWJJNis5M0hBNk91bS9XSHN2T3NoT2Q3NWhyT21NTU9Qek1F?=
 =?utf-8?B?N2UxK3BDeVBHK2lCaXcyU1FzUEpkOTJTaFVRbkFCYmZJczUxUlAwWnQ2eklO?=
 =?utf-8?B?anJCS1NKaklxSnBmS3BTMmQ0RVJJQ1VmT0pEL1lIZUdGNzliUVNuRUo1d1Fo?=
 =?utf-8?B?VUZCR2RabUMzUHZieDVzVnZmRFhYd2k2MGFEdGhRTHA0aGxmK0d3Vm5Ga2xl?=
 =?utf-8?B?cHU4YlhPcS8rcVU4YXRvc0VSWUtHTFZDSStjVEZJc1N2VUR5OTk5dFlPdFlB?=
 =?utf-8?B?RU9mczBJbThPWlFjSHZBL01DT3F1NDgycmNoKzE1eWJ0TnM3TlBzanUyRmRR?=
 =?utf-8?B?N0VqU3kyK0pIT0gxM3ZKSU83Q05EODB4VVlrOUwyc2VINHVtYWw4UEJaNS9G?=
 =?utf-8?B?RndlVTNqNGpHYVBBZ2w5djdLcXZFZGMwRDlEamJwcm04NVVsVnQ0dEZ3V25n?=
 =?utf-8?B?ZHZUZDg3VmJKeDRuakpVSGdpL3BxbHpuSFJnZlJBK251V2FISnJrRk01dE9m?=
 =?utf-8?B?aVU5VjhvbjJMeXQ0eTVmMlM3S0xKYXFzVnJyLzhsYmlTT1ZLSkhCc3NPNGND?=
 =?utf-8?B?WFROdUJwSHdSSko3TXo2ZmtwU1pzTS94VVJjZkFaQThJZHJOUmZYR3dkRUJp?=
 =?utf-8?B?aytmVkJVcWk1OVYzTE8zMmp1bmNpOTd5SFFMUHNualBRKzUwM2ZEMEZuQTls?=
 =?utf-8?B?S3BkR0tweVJmczhRZzJPaDJzY0FvdDNKRXgyTWFNMXFZSWw5WFZ0bXRWeTYy?=
 =?utf-8?B?dHdsZTkyenZnVXFhdU5UcU5aREhFYjBzK1EybFlvbXNTbE02QUJ3NlNCTFdm?=
 =?utf-8?B?OXBDNVZEenlieVMvUGR3S2F2UEp0UVdrUENRN0JPZkxmVVJ3S0VUQTE4SFBq?=
 =?utf-8?B?OWZOR1dpNDBZQ3pzYlBjdENiYXNnZElJZkJDa1A2eVhDdFM3Q0oyeGZqWWpT?=
 =?utf-8?B?VU5aY09MT2E2d3hhNU5YbHgvb0dWUjJhSEhNQjZxUlFJRStIRmduZHJhb1R1?=
 =?utf-8?B?aHpHMEFxSm9sNE1veDh3Um5KYWFwbm9OVDJoYUlualU4d2xKbHc4UlhBenNZ?=
 =?utf-8?B?MStoYlFGWHlLNmU3R2ZBY3dIeWR3V0hPbHBCNUlBdW5MYy9wSXlDZVpaUXJJ?=
 =?utf-8?B?M0RKMkNsbVZQM1pFeUw5aXNNYStWelBiUkNVZlM1V2RUK3RXMkRVNkdTUldD?=
 =?utf-8?B?eTFieXUrcWxIaitEbHY1cHhzSGNma1M1TUZBQ2RuUVVmOGx4L0ZwbElONzNt?=
 =?utf-8?B?SFZxbHc3THpuWm9qbWlJVkloek9iR3F6dTRlaXRTQ0Uyamg2ZjgyQjBhZkEv?=
 =?utf-8?B?VnNaN0Y5MStyRk9Bc0QwRTRkWGd0WllkeUlOQkZJcEpENGdlRzU1NzU3MGtr?=
 =?utf-8?B?NllZZ0lHT0x3Z2ZZaCtVMWZQOGhUdS91MzRIRUVrZFNWdVlWdCtEOHdXN044?=
 =?utf-8?B?Slp2cnJhanpLaUdpbHZvUVFRMzN5QjdxQlJJTWpscHlrd201VU5jVGNpR0Zp?=
 =?utf-8?B?emJXYmJGUFdIdXFrbExTb3VzU2dyQzNkV29adjlUV0wwVFo4VmRkNElVaG1m?=
 =?utf-8?B?NUE2a1pRZzY4M24welY4MXc1TGlCYjFXUVZzUWNNeVM0NXRUOFM2NEtyTHRP?=
 =?utf-8?B?QUFSSWgxNC9KU3JBZTQ4dFJRYjJVWnlyQkw0bXkwUHFzYy9HZFgzdGMza2JS?=
 =?utf-8?B?b0hsZTJ3TDVQUW1QYWVhTWF1VGU0ZFR0ZFI0SU9ESE1GRUlxZzl5NVNtVVl3?=
 =?utf-8?B?eFpTLzl1NlcyQU00b0FkM255WnVLVlVSMUYxaTlIMjlsQTZxTE1LNW42ZGRB?=
 =?utf-8?B?eGhpQnYyWWhRREZGL2NPYWdzOS9iSXNRTVM1OXc2R0FwT05UMFhacmkvOURI?=
 =?utf-8?B?ZzcrK2MrVnFDaWltV01pVGZVazVMSEFJaGNMSDhhZlN1V2JTaGJUNEIvRVAv?=
 =?utf-8?B?TGFFMnZPUlROK05KRUdpL0I2aVBYM1V5RlFCQXZQY1IydjlJT3RFbHoyMm9k?=
 =?utf-8?B?enhjd2hKamNPamQzZUlLMkVzejRReGpkMzY2RUxFalYvWFZhZGFPQk9WaEYv?=
 =?utf-8?B?YlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a8cc11b3-dda4-4c1c-8a94-08dbb9e8241d
X-MS-Exchange-CrossTenant-AuthSource: BN8PR11MB3556.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2023 14:44:49.4633 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b03iPbTdEn1CwV3l1ty1GY1lXi2LUOpeo1fCOuKqUpCfxbK2ib2/6rFVk71Qgm5bA7Z8ENM9Z6bNfrYG0/lfmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4689
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

Quoting Matt Roper (2023-09-19 18:15:06-03:00)
>On Tue, Sep 19, 2023 at 11:41:10AM -0300, Gustavo Sousa wrote:
>> Starting with Xe_LP+, GFX_MSTR_IRQ contains status bits that have W1C
>> behavior. If we do not properly reset them, we would miss delivery of
>> interrupts if a pending bit is set when enabling IRQs.
>>=20
>> As an example, the display part of our probe routine contains paths
>> where we wait for vblank interrupts. If a display interrupt was already
>> pending when enabling IRQs, we would time out waiting for the vblank.
>>=20
>> That in fact happened recently when modprobing Xe on a Lunar Lake with a
>> specific configuration; and that's how we found out we were missing this
>> step in the IRQ enabling logic.
>>=20
>> Fix the issue by clearing GFX_MSTR_IRQ as part of the IRQ reset.
>>=20
>> BSpec: 50875, 54028, 62357
>> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_irq.c | 4 ++++
>>  1 file changed, 4 insertions(+)
>>=20
>> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
>> index ccb934f8fa34..3746e9204e48 100644
>> --- a/drivers/gpu/drm/xe/xe_irq.c
>> +++ b/drivers/gpu/drm/xe/xe_irq.c
>> @@ -456,6 +456,7 @@ static irqreturn_t dg1_irq_handler(int irq, void *ar=
g)
>> =20
>>  static void gt_irq_reset(struct xe_tile *tile)
>
>As noted on the i915 patch, the bits in this register correspond to
>tiles rather than GTs.  And in Xe we do a much better job of handling
>the two separately.  You probably want to move this to dg1_irq_reset()

gt_irq_reset() seems to end up being called for each tile, but, yeah,
dg1_irq_reset() looks like a much better and natural place to do this.
Thanks!

>and only reset the bit that corresponds to the specific tile that was
>passed as a parameter.

Not sure I follow here. Shouldn't the bits in that register already be
specific to the tile?

I think the per-tile bits are in MSTR_TILE_INTR (0x190008), and they are
already handled by dg1_intr_disable().

--
Gustavo Sousa

>
>
>Matt
>
>>  {
>> +        struct xe_device *xe =3D tile_to_xe(tile);
>>          struct xe_gt *mmio =3D tile->primary_gt;
>> =20
>>          u32 ccs_mask =3D xe_hw_engine_mask_per_class(tile->primary_gt,
>> @@ -463,6 +464,9 @@ static void gt_irq_reset(struct xe_tile *tile)
>>          u32 bcs_mask =3D xe_hw_engine_mask_per_class(tile->primary_gt,
>>                                                     XE_ENGINE_CLASS_COPY=
);
>> =20
>> +        if (GRAPHICS_VERx100(xe) >=3D 1210)
>> +                xe_mmio_write32(mmio, GFX_MSTR_IRQ, ~0);
>> +
>>          /* Disable RCS, BCS, VCS and VECS class engines. */
>>          xe_mmio_write32(mmio, RENDER_COPY_INTR_ENABLE, 0);
>>          xe_mmio_write32(mmio, VCS_VECS_INTR_ENABLE, 0);
>> --=20
>> 2.42.0
>>=20
>
>--=20
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation
