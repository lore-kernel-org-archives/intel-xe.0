Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11533C04AAE
	for <intel-xe@archiver.kernel.org>; Wed, 20 Sep 2023 16:31:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1D2C10E4CD;
	Wed, 20 Sep 2023 16:31:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A367310E4CD
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Sep 2023 16:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695227504; x=1726763504;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=qKnVGnCinHIwBLMpmebevJRyur/KuL63Qm7Sla2kxBA=;
 b=JnhARRlDjiNEjU82wzs5KffEZA+4kz2+zViTxijBWaCMLN/jlIm/XC78
 Oj7Eqm2+59RH4mWMx19b7gCHvOrQiXmHbqBfy5xuSSn//SjUOvSet98AH
 yqUYD0M+Itw3kOYbLlLldHp2yZeqMxIYXssyMKFS21Dd7DftNL5SE4T8J
 ICZSNonEnRz3AhwfSR0OXCFHVV2hgihfKxulmOtvxz5dTUn5IL7PFUOQe
 vth0EGXHSzgPItKLsQFqlTFV9xx1pV5mAi4cAmxhBt8WVvM7nrj7q3W6/
 MAcHYVZHUSTuP9xWzgjSOKwqCpebva3/w5RSeOI1ya2AyUz/9MHEhtmfG A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="383019535"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="383019535"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 09:24:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="870437685"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="870437685"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Sep 2023 09:24:00 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 20 Sep 2023 09:24:00 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 20 Sep 2023 09:24:00 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 20 Sep 2023 09:24:00 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.171)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 20 Sep 2023 09:23:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jBlXNyvC5X4aNbgVgZMIkXy+SEtyOrq794STHUqVm+tRuc2j0CJ2CCtDVZZsgSORkM5BgwmFoKmRUF9KbB4/rdmZJFj6CsgSsLt4WFSdj3g2kNLnRQ16SCUGw8Bgd2LNY//T9DlqUB2pELQOpPewL76JM71sjahi+RfzbrPyV+0jOsz/0ci10PQ18CgX3FRfHYDg+7Xab478mCyCVwAxUYUZDbPXKb8cGepGFAFby+11AjVxpwn8xtDWSeuahYKJJLl88FF9IicdHC/ViJHZpoTzKm9hYiqifo0Zbg2aQNjpAM9eWLkENRDHOEFuL0dwt6B0jJCURaibgkK/c3YnWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ztHWPkp93itNunmQ2FEGEAi7hRHIqSD1y50A1VDRuTU=;
 b=dYO6I4XsG57pVWs0uCWXHnj4TTK8nnnvOVVevZTO+4p180e6fdtT7IAAkRFBMQVLEaiLlw2I6JdDhsDbeyU8GYyqavWOyU44Lr6TBqjbcJ/y4S0VPQXFuBY2ydZSroUXq+ZWHlUseTcbiIqmFS/OaU5lhstXrXPxLK7qDyWnsEpi1UAGTEjNlU8cle2rQW6e278zkZmkMEDjCFmH9MxSr3DU/iFJ4dSQz6ecxGAMgXRNnsUr44ex367SOWMkU+Z0TkQnYSnO5Vc9y+XTNmoDyJWnEmIpj7UXkNcdJm3RRIRpXlcRJVevacH8tbtiAz5lNQUBQI7W9RpfYZumA1n8NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN8PR11MB3556.namprd11.prod.outlook.com (2603:10b6:408:8d::31)
 by CO6PR11MB5665.namprd11.prod.outlook.com (2603:10b6:5:354::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.19; Wed, 20 Sep
 2023 16:23:55 +0000
Received: from BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::d89f:e7e6:dbb3:3ddf]) by BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::d89f:e7e6:dbb3:3ddf%6]) with mapi id 15.20.6813.018; Wed, 20 Sep 2023
 16:23:55 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <ZQrPxAC4dBYv9fNi@intel.com>
References: <20230919144111.32702-1-gustavo.sousa@intel.com>
 <w7l6s4ywimggliinhccwbpnvepxera3an6raryyffusmenesng@me7t4rjxmyjz>
 <169514495100.2105.12416170725310981140@gjsousa-mobl2>
 <l4avy36wdkxxcmc2beblwvplfokvhrxbybfmmsmm22mt6gjjyc@gk24v7rkvwok>
 <ZQrPxAC4dBYv9fNi@intel.com>
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, Ville =?utf-8?b?U3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>
Date: Wed, 20 Sep 2023 13:23:32 -0300
Message-ID: <169522701249.7665.16720184796685652725@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: BYAPR07CA0091.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::32) To BN8PR11MB3556.namprd11.prod.outlook.com
 (2603:10b6:408:8d::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR11MB3556:EE_|CO6PR11MB5665:EE_
X-MS-Office365-Filtering-Correlation-Id: e044123d-6419-46f6-b7ac-08dbb9f5fc50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jxsi2G14EVyYUPWaN16CUldhvT9rJdhAltbhf6UXpsiNHCH006JzNjO51RL3L4SIeGR/HoK3SNlJP9gLF2kIVFX1gvB0cxjDZMej9bzCwPMkbWlb66Tg9zJ+MXykJtOtadjG6Ys7aB6NR3Y7oHh/2hlqrUci1b0lo0dxwuO6ePn4YskTpnsKL3Fsb0kyk+llbR4ic4ilXMA7+TbHYwUwqc2P+o0zQuSg9tX9h5j+N9EHwIphWIYEUEJITpVXgF3Wo4pzITKK0v89RiWChwP4H2KHMBsZ/J6BhKicfDYZkKxZrOT0l2HtPiDrz7n582Ejkpek16nJmNgYkUcrQpIv4AUBNWe664mIQM8fcBVFufw5/F6Fsj5H/omigtPuL3QhKl6lmsvEzTJIDIrrjkwvvX7Q03dKIhjXuBPL8aMi+krHOEqLcwrWrzI5jD2XZXzjCn8Kc8Bb7lnYXG5gs/sJiUcFpoVKPEDQDwZLDvZlUWW/QvSke/mmEqH0vPG0656JyS5mjTzJoVxZvgjhk6qpCTqH28EPWejRj3xr4TQjnITYjKCy5NbcTgJCp3HBd3UG
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR11MB3556.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(396003)(39860400002)(346002)(376002)(366004)(136003)(451199024)(1800799009)(186009)(6666004)(6506007)(6486002)(9686003)(6512007)(478600001)(2906002)(26005)(66574015)(33716001)(44832011)(66476007)(66946007)(66556008)(316002)(41300700001)(110136005)(4326008)(8936002)(5660300002)(8676002)(86362001)(83380400001)(38100700002)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S2QvU3QzaERubCs3UFljUU9vVFpTTE95T2JHTTdUcmpJb2RxcS9KUTdaZVI5?=
 =?utf-8?B?bmo1S3hENGtnanJJQVFGRWphYUtHUUM4MStlN0F6eXEwYTRVd2JaWnhuSWR3?=
 =?utf-8?B?eVBUMUc1dzk3aG5ZVTMrNVFUTldNbitlb3pmL0xtb056c3QvNHg0emllR2dF?=
 =?utf-8?B?VGVxS1JrQzNDTHFlbEgyRTg3WnBWWXRPQzFiR2hiNnkzWS9LajQyN2U1T2hL?=
 =?utf-8?B?cTJ3dExzblVMRmVmUndQQ05hdlEzaFFVRnQ2eE9RNE5LMXVmQ3Q0WE5yclR5?=
 =?utf-8?B?NWZlS2VDUlNOTXFBUDNUaTl5VjdLcmJHT0xSR1ZXNjI3OHJsUlQwektVQklu?=
 =?utf-8?B?YmxHM2JsMnNadzZtbW91ZHZFVDd4b25HVHZlNElnQ2lUaTh4TTZTdUdMRVlO?=
 =?utf-8?B?SEREMVpRbVltMzN6cXZjS2QrdmpjWDZkV3UvSnVJcEMxVERYbXVobml3bFFW?=
 =?utf-8?B?M1c2S0pTQXpvaXBTYjhnNE9LT2hVbUhhNDRXQ2t4WTJZb2hLL0luazNJUnlI?=
 =?utf-8?B?cmR2RFJGMGRNZ3N0SDJTcktPS2phN2lMQUJLRERqbFByenpnM01Td1psblZD?=
 =?utf-8?B?Qk4zN2ZhdnJsSjJReDE4R21qWUJLeFpJRjBZK1gxcFZ1S3l4eUxSOERvQTJB?=
 =?utf-8?B?WlJxZWg3aVloT2dhaFNGUDBrSjBzZko5QXRPdnloM2xNR1NNVWVYWlozNEZN?=
 =?utf-8?B?RmhCNGFROUpZbXR6WFAzZ3UrekhqSExIWEk2cTJpeVo3WEt2YTdHWHBQaXIx?=
 =?utf-8?B?WnhyKzVLc0czOWY4ZFpmOGlweWFBK0NSa1FpZFRqUDJFWDZRUkhVYVpGdWly?=
 =?utf-8?B?eWRReTJsdVNNZjlvT2liMTh5bGZ2cXNoeG10UURCVEFkMDZSczJzUGFuY0w3?=
 =?utf-8?B?MmV6NU9yclhxeEU2YVl1WDFocDNiQzFLS25VWGlyRVNuUHVmYUNIUGZyeXpC?=
 =?utf-8?B?Z3hyTDdCRTRINVIrNjNKNDRDT3dtWUVoR1NwQmFHNVdWT1RmYUxiR2ZPRjho?=
 =?utf-8?B?Y0RVd1RkTUlLWDdibXZQLzVnWUNPbkZBcnkrakhzcDRtME5Edkk4QllHMVNh?=
 =?utf-8?B?MDkwUGJvdHNIcXhNRXhLZk9KOE5rcDVRTW92NWJFc2l4dkNvYUJtam9PSXpx?=
 =?utf-8?B?MVRuMlBWY3F3WDZZVDVtdEs4TFkySXNGWnpseEVHVTVEMENicWRPeVhROE8w?=
 =?utf-8?B?eno3SmJHejlTNmpyWmFwL2VIQ3BMWnBKUVVneWVETyswenNidXJabmZlc0pJ?=
 =?utf-8?B?akkzc1BlV0E0MlJreVZ6c3B4ZE5YOTE5UmdkMXc1dUN3YkVUQWVYRVBIa3No?=
 =?utf-8?B?ZHg1ZVJZeHU4dUFESnRuRVQ3MEpvYTJtdGF6Z3RKQXNNdkhJTG4zV2UydDM1?=
 =?utf-8?B?NWhKemhDdG1yK2g5amVEZzE1NVNCSlh0L2RWU3lJTE9tNTY5MWxtZ0RraTJ4?=
 =?utf-8?B?K28xVERHTzJSN0lBR3ZUS1kxdU95T0xSYmZZTTdQcDViMGtFcHIrc1BCVytP?=
 =?utf-8?B?cnM4WERuN2NjWStaRlpxZ2JxdEx2QzJKdEpwdzBydGMzMDdQUkU1NWNkdSt4?=
 =?utf-8?B?REpvY1plYm9mTlE2SXUxY1B6Q0tyMzVGS0xlNUFlRlRtWWVFUDdueEZjTDZD?=
 =?utf-8?B?eFRBL242aUVjU21DeE9zTTc0RGZQQ2RZR2xxWHNva0FacEpCMjZ6d2o0YTVj?=
 =?utf-8?B?SytHS2lDTDNBTVlXQXNkNksxcFVpYThvZVhJYjZMd3VpNE90bmRuTVAvWndK?=
 =?utf-8?B?djdrZTNGVHdxY3ZrdmYrbnJqeUg5Z0hNVTI1dVNKUTdzeTlkSExkaGVWbUZ0?=
 =?utf-8?B?T1JlOHVZRjN2NmFDRHlwYVVyL2l1UTN4amVBUThBWFZsUVJleVZuS2ZLRGhZ?=
 =?utf-8?B?bHZyajl5K0hRUWtlU1NVaVVsMzBVeDc4ZHkycnBKbkRlSTEzaVlhWnpQa1pK?=
 =?utf-8?B?d09WY1JrVGRveVZQR2dUNkJQTTZpcWxCeXBILzRyM2lzenlJYjBMQ3c1aWQw?=
 =?utf-8?B?a3h4b3EyVmpid3doVG9ZVkRMSURFeUo5b2xmRVEwNTVUWE84S1Bkdk1xbjY2?=
 =?utf-8?B?OGcyUmhIZlg5aWtQOVVENnR4Qjd1Y3RESWphdUtkNDRYK21pTytKSXU5MmxP?=
 =?utf-8?B?L3hlVlBSNUp6RkV3U0dvNHR1dEp5eTladDB6ZVhZN25vSzd1UmdzamFSQncz?=
 =?utf-8?B?WVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e044123d-6419-46f6-b7ac-08dbb9f5fc50
X-MS-Exchange-CrossTenant-AuthSource: BN8PR11MB3556.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2023 16:23:55.7087 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ScJpV9cR+TrO0sEx6GkpCkhr2oS25JCExqyBrkqu7wujJSBqiP9AIgj3QNBG9iQwzQCMpJGcenAsEc+hmw6yjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5665
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

Quoting Ville Syrj=C3=A4l=C3=A4 (2023-09-20 07:56:04-03:00)
>On Tue, Sep 19, 2023 at 11:08:04PM -0500, Lucas De Marchi wrote:
>> On Tue, Sep 19, 2023 at 02:35:51PM -0300, Gustavo Sousa wrote:
>> >Quoting Lucas De Marchi (2023-09-19 14:31:24-03:00)
>> >>On Tue, Sep 19, 2023 at 11:41:10AM -0300, Gustavo Sousa wrote:
>> >>>Starting with Xe_LP+, GFX_MSTR_IRQ contains status bits that have W1C
>> >>>behavior. If we do not properly reset them, we would miss delivery of
>> >>>interrupts if a pending bit is set when enabling IRQs.
>> >>>
>> >>>As an example, the display part of our probe routine contains paths
>> >>>where we wait for vblank interrupts. If a display interrupt was alrea=
dy
>> >>>pending when enabling IRQs, we would time out waiting for the vblank.
>> >>>
>> >>>That in fact happened recently when modprobing Xe on a Lunar Lake wit=
h a
>> >>>specific configuration; and that's how we found out we were missing t=
his
>> >>>step in the IRQ enabling logic.
>> >>>
>> >>>Fix the issue by clearing GFX_MSTR_IRQ as part of the IRQ reset.
>> >>>
>> >>>BSpec: 50875, 54028, 62357
>> >>>Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>> >>>---
>> >>> drivers/gpu/drm/xe/xe_irq.c | 4 ++++
>> >>> 1 file changed, 4 insertions(+)
>> >>>
>> >>>diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.=
c
>> >>>index ccb934f8fa34..3746e9204e48 100644
>> >>>--- a/drivers/gpu/drm/xe/xe_irq.c
>> >>>+++ b/drivers/gpu/drm/xe/xe_irq.c
>> >>>@@ -456,6 +456,7 @@ static irqreturn_t dg1_irq_handler(int irq, void =
*arg)
>> >>>
>> >>> static void gt_irq_reset(struct xe_tile *tile)
>> >>> {
>> >>>+        struct xe_device *xe =3D tile_to_xe(tile);
>> >>>         struct xe_gt *mmio =3D tile->primary_gt;
>> >>>
>> >>>         u32 ccs_mask =3D xe_hw_engine_mask_per_class(tile->primary_g=
t,
>> >>>@@ -463,6 +464,9 @@ static void gt_irq_reset(struct xe_tile *tile)
>> >>>         u32 bcs_mask =3D xe_hw_engine_mask_per_class(tile->primary_g=
t,
>> >>>                                                    XE_ENGINE_CLASS_C=
OPY);
>> >>>
>> >>>+        if (GRAPHICS_VERx100(xe) >=3D 1210)
>> >>>+                xe_mmio_write32(mmio, GFX_MSTR_IRQ, ~0);
>> >>
>> >>shouldn=C2=B4t you exclude bit 31 (MSTR_INT) since it'ss not a status =
bit
>> >>and would rather enable the interrupts... ?
>> >
>> >I thought about that, but looking closer at the BSpec for that register=
, that
>> >bit seems not to exist for the targeted graphics IPs.
>>=20
>> true, I missed that... but then this would be a weird place to reset
>> it. We already forked the irq setup in xe_irq_reset(). Also, this
>> is going to be called for each gt, which doesn't seem right.
>> Better to move it to dg1_irq_reset().
>
>It should also be cleared after disabling/masking off all the lower
>level interrupts, otherwise you could just get some bit relatching
>immediately after clearing it.

Meaning to move this to be done after the call to
xe_display_irq_reset()?

The BSpec says:

  "For any new interrupts set after the 190010h read, new interrupts are
  re-generated after setting 31 of 190008h."

Considering that we disable interrupts with dg1_intr_disable(), doesn't
that mean that relatching won't happen until dg1_intr_enable() gets
called?

Btw, from the sentence above, I believe the proper way of resetting this
register would be to read its value and then write it back instead of
simply writing 1's as I did in this version.

--
Gustavo Sousa

>
>Also, are the latched bits single or double buffered? If double
>then we need the double clear that standard IIR registers use.
>
>--=20
>Ville Syrj=C3=A4l=C3=A4
>Intel
