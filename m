Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81240E7E631
	for <intel-xe@archiver.kernel.org>; Tue, 26 Sep 2023 13:08:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FAAF10E3D8;
	Tue, 26 Sep 2023 13:08:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F7C010E3D8
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Sep 2023 13:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695733702; x=1727269702;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=yRzbiis+et8EC6tTZtnjwSqRtkJVpz311+p/Ylm0UtM=;
 b=Rj6ghBHA3+OVMdxLLTnY+EII0Hq08p6fNle/LnhxzTR7GufHHbw1Nl5e
 op7Sg/ubqYzz7drZfvww6hdYmi3r1gfFFi8L4W6i3hftIP68joY9H+bGq
 jI2lFY4TM203/jgb+R9pd6ufdr80LBNPmh32Kl3waFP9gxDurU0uzUf51
 K0OZTAGItne64ghUQz3OuxAUsSl+qhF1bndZnNIjrpy4o0wBbo1wLTS8D
 XZ5Tk3LEthSPkbcaD8z1eR1qmSa5KrecIjzdkL2vRNBKKMr4hBkp+WiSl
 pWF6nSHYRcGKogifRF+q9VC05jTFM0I8KQfAl7Vqskc7RPdptVRnW/WK7 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="380428838"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; d="scan'208";a="380428838"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 06:08:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="783950127"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; d="scan'208";a="783950127"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Sep 2023 06:08:12 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 26 Sep 2023 06:08:12 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 26 Sep 2023 06:08:12 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.44) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 26 Sep 2023 06:08:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RcrfGVtfZrW/0Pn+Z5xi63npaylHMH2R4Z/xcNrVHXvjdu71j9R0lRuALL8WQtUms6uBA9INdz4W2YP9fw623HbgDwqfBjVSR1GZPOJN93AD1I4HZ3xjSFlZAeU0rDhwOTohQ7T2t+8Wqc3PjBo/cJNrEY3E21dQs6XjtGxOIxQ21SyoqAD1VxXxzC2Lq+JpG7aQ2QhXVct6ZxuBzKjrermExKAOIT+F5Omc81YQCcakql/jkVxqU8FCOBxv3cp3W9JrcvpXD9ps5wT5paX2MC1UpxMrDV0UqWBIgLAfnhf0hyurG5UuoBXNNz1ktlA3oFUIL33iEx2PFhw0YCWDbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OPr/I0rfiKrh2N83VSlQRfxG8SaBaBinwfsLGGDJ8Yk=;
 b=Y4nxB3YAu/6JPSSa3xvo/ZfFHmiwsuIUe/cvB23ti6okH5oJS015CjGfF5IoO/I2V0WHVATbMwu+Ki+45WruC4DDnJErey5yM/AznQ9D83L7hMLE2E0tjvhI2E9Fwl1/dgoE0wvVsh9gkkn1pEOVCXEgqr12iVnO1+GeQysj9+9kJQ/Dqv2Qyn4JgYjT7bwjKmhjxb2dzcRExrmmgjXGoaeyIJXHnpTA6vJYHKemW4D0bJcm7t306zBPVKIH9eeNAmCmkj3HEsXVR4OaZvrqNiMzzIEuAw4k492dPo3f6TmX/+LPBHIC7A6BJNTHVkpXafz+TiF9d24FwkalwC4yQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN8PR11MB3556.namprd11.prod.outlook.com (2603:10b6:408:8d::31)
 by LV3PR11MB8676.namprd11.prod.outlook.com (2603:10b6:408:20f::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.24; Tue, 26 Sep
 2023 13:08:10 +0000
Received: from BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::d89f:e7e6:dbb3:3ddf]) by BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::d89f:e7e6:dbb3:3ddf%6]) with mapi id 15.20.6813.027; Tue, 26 Sep 2023
 13:08:10 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <2b6m6xjd22m2ijbfryjvb42tovmmmtze4i2eajuqewtqiemnf5@iyurmbf76mnw>
References: <20230920194534.57856-2-gustavo.sousa@intel.com>
 <2b6m6xjd22m2ijbfryjvb42tovmmmtze4i2eajuqewtqiemnf5@iyurmbf76mnw>
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Date: Tue, 26 Sep 2023 10:08:03 -0300
Message-ID: <169573368393.2955.14422639399101299083@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: BYAPR08CA0001.namprd08.prod.outlook.com
 (2603:10b6:a03:100::14) To BN8PR11MB3556.namprd11.prod.outlook.com
 (2603:10b6:408:8d::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR11MB3556:EE_|LV3PR11MB8676:EE_
X-MS-Office365-Filtering-Correlation-Id: c256cd45-d6f0-49d5-55d8-08dbbe91a1e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 82jPePG1+w7E12RMipFp0w3OkGSfz8a7o/bMXtSNBxe7dsZ9/UQtD9FQnCe/nTMhRQKS8JidPA5ccz+/FrzxYqngTrkhVrLxcfZGZ44gM422p5pQxANHN9UrUDafgy3Qhjr8R0LSOpA+XncF9eNdjg12wLcxKcCaZ0CleQ+iSK5bUiSUiOrbDu3RoGbSl9lbuTvFntAJZwwSz0YSShLgz2g+k+I0VgkYkPar/lI6TTgBhMSD42isqVsSeJK9gTDtl6dWShjhRHghiztlnLlkFfQE4f3Gsjyhsl7DGFKLn7tFJdit2EeMQ/ARQAsxOfcts0Yuio8S6KhgD848X/i7RZ+sP6T3BLdFkHlVIvpoHcOATvAOFixL4Qvm0yPshaAtQjWreXJz5uY//ktN8BTApUibKdOazPtJOkYdFz6z1iR+szWys5yYvsEGbvbMT7K5MNSRQxD5zsf0C6ZQ+GsxBhySiT84WzsoIq8V32mNS+cI6kjsZVwSmpZB74UMS/5/cbs3c8AEvLrS3F7wXAX1YwL0AivYTrLys8QeV7WzO9BNvN1u6n4hjsFtojsX8TxH
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR11MB3556.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(39860400002)(376002)(346002)(136003)(396003)(366004)(230922051799003)(1800799009)(451199024)(186009)(478600001)(6486002)(6636002)(86362001)(6506007)(41300700001)(66946007)(316002)(9686003)(66476007)(38100700002)(6512007)(5660300002)(44832011)(66556008)(6666004)(8936002)(82960400001)(6862004)(8676002)(26005)(33716001)(107886003)(2906002)(66574015)(4326008)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OXhPL0F1WHI0ODUwaXdOdVpaTGVabHdIaDIxczVhL2hSRk1FckZZTmtwRHQ2?=
 =?utf-8?B?SDErTDhIb3g0WEFORnhib1czckZSOGJxRGdENnhmcDNvY0U2MjhxMnRZd3Vx?=
 =?utf-8?B?SHA4OUdOeDcxcmFJelZuY3VZc05qRGxUS0RlaEE5M2RHN0l2RHFDVFpBbnVW?=
 =?utf-8?B?L2dkNGpiSGp1aHAwdTFhRTEvSCtYeVk3WGgzT2xRZ1htb2VrRWxmd1JnSlpz?=
 =?utf-8?B?Nmw5VUdJN05wS3YwOHpkalVmbkJLWFdVYjFWNkNnU1dmUnlZSk9Fc2h0M1o0?=
 =?utf-8?B?NlNsNnltR2tEVkJhTXlLbVVFVTBmM0hyajFhU2dpVk5PQ3UwNjJxZzd0RW9v?=
 =?utf-8?B?WXQxZXh0ek5TQnlhWGRObmVkeXNqbGg3U25DcExvVVpZNSszazBWczhNNlo1?=
 =?utf-8?B?VVUzU1M2R3F2MEs4N2R5M1ppL0tETWMxekJYRjExMmNWMUF6ZXo4STFaUFFl?=
 =?utf-8?B?cm9kTVU3V1phMldqcm1zTGtWWXpuVEhZalNEamVsalIwdGJJRUN4MUVLWjVy?=
 =?utf-8?B?OHg3K05scUNSNUdYWERyM3hpUXlsNFJ4OUtUeTBSRnF0eENrajdiQUVHdUo2?=
 =?utf-8?B?R0w3OFpnaDhENDFnbXd1VnVLUGZzWFkzN21MdGdZOUtQaTNmWDdCNStodzBq?=
 =?utf-8?B?eFNUVS81L2hVZStYbDkxL2xiWHZwaGJlUmRwbmJCamxsN0t5dUhrTG1vRk50?=
 =?utf-8?B?Z0RWb2gyelFmZzV4c0w2Q1IxelZhdERwZlAvWXo2V0l4VVZIUk1oTUpENkFz?=
 =?utf-8?B?T0pSaEk5NktNTmc4MjRwSm1rK2RERVZrekZKQ0ltUVk1S2N3K1c0NDdwcVgx?=
 =?utf-8?B?d0gzbVNOSjRlemRreDZDdU5RMzB6ZXA1ZjZqSTRKVCtpdmxWNDZRMERmUXo0?=
 =?utf-8?B?Zk1WVm90ZUM2ZnJKSTNLekJPT1F0a3p2enlpV1FXUU9UVjZqVURpQzY0bTVH?=
 =?utf-8?B?VUJ6WW1CUGVxMVdORm5QSnVFN1NVTWNDVmE2RzM1ZlEzVnp0M2VydmhPOXBk?=
 =?utf-8?B?R0VzWEtWZ2JOZHdOZmw0OHAwK25yTnl3K0pGdlZpNUlUS2p3VXJwclJycEJJ?=
 =?utf-8?B?bmpPN1lWOG40YkUyZkN3UkFDMUR4Wko2cmdQZWFlVzZQMEQ0ZzFRUndoOEhT?=
 =?utf-8?B?ZzhMdUNmUUtDZHJjaDg4bW1qSllWa1JPYXVyNEdCSnpMekZHbVNKUU1TMHVF?=
 =?utf-8?B?MUdsdDAwRVlYS2hPSTBoVlFXSm5ITkVHQVlBT3lZUlpoa21YM05TYjVsUDhq?=
 =?utf-8?B?a0RGc09PcEswZUVJMlI3KzZhRDJkY2xHaFc2RWdzMi9jRE1sK3I4enQrdVNr?=
 =?utf-8?B?LzdVOWdGL2tMaEVWOThRS0V4SEpOVUhndWNmZDFDOWNsRFZoeXNQZjZMa0VO?=
 =?utf-8?B?UEYzT1F4RE9GNE1KZmhGT1ZPTDBLNlZJMjVybng1aGtSKzkzaUhLV2hCdHdr?=
 =?utf-8?B?bVJxN0hoVHp3V0g0cXVIc0FxbkNOQ2swRE02MmVZYXloaURIZVdLcVAzNXVp?=
 =?utf-8?B?UHR0NEhFT21kTTJRaUhiY3AxRGVobW0zYnVMKzNVWEZ4SjRLSWg2ZVN6bzBn?=
 =?utf-8?B?N0F6eEJYU1JDMXVTbGxWZ3U3UzRlMklMeWg5cVFhY280TWUrOWRoK0gwTnNu?=
 =?utf-8?B?Zzl0cytES3doVDZaM1lsMmV0bmtjZ1dDSDFhcUhLY0FPSG1GV05DOFZBS0Fw?=
 =?utf-8?B?bkUxRVBmekQxVHFqS2lZMlQ3N01SZGJtZmE2SU5od3cwUGp4b2REUjY3RWRh?=
 =?utf-8?B?VHFiUzFSR05WVjVSdlAreEJva1RjMmlFQXpEQWpubUtDY1RRc0w0WjFFMDYv?=
 =?utf-8?B?RXB1ZjhFSmhwZ1BmMnNJeDhId1NRNno2WUNCNTVNTDRINXQ2UUNITVo1OGly?=
 =?utf-8?B?b25QaGR1U1pFWmpQVEZ0ZDhPYVc5Y1VIQ3J1YXRMVHJCR2dxd2dLaGREK0Fy?=
 =?utf-8?B?ajdRTEtYSUdiRHFYTXkxZjhVZGNBNGdOTFd4NTh3dGNYVEVvVTAzT1FnakhZ?=
 =?utf-8?B?cnluQmsvaFl5SHArNXdFLytubjRDOWVCc3NZRnB0cVU3b1UzNTBob3k0WGtM?=
 =?utf-8?B?MUZQNGZhYWxrS3JtNERFVHplNUJYMU1GSlhrMFhZL3Z4cWtmeFNMT1lPVTly?=
 =?utf-8?B?eUgxdVJLaXV2b1BMaitmMHZEMWhNbXJvbDcwVTFaalA5SzJ4Ums2VmhKeDVt?=
 =?utf-8?B?UkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c256cd45-d6f0-49d5-55d8-08dbbe91a1e3
X-MS-Exchange-CrossTenant-AuthSource: BN8PR11MB3556.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 13:08:10.0946 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QUMqss7yEnCkRT6xu9i+s7z7cw1r309YaKM6Q/OWVcCcJR2QJFn/t9nCT5occ7qII0x7WkPIMRsSnwXvJBN5Gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8676
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2] drm/xe/irq: Clear GFX_MSTR_IRQ as part of
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
Cc: Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Quoting Lucas De Marchi (2023-09-25 14:09:56-03:00)
>On Wed, Sep 20, 2023 at 04:45:35PM -0300, Gustavo Sousa wrote:
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
>>v2:
>>  - Make resetting GFX_MSTR_IRQ be the last step to avoid bit
>>    re-latching. (Ville)
>>
>>BSpec: 50875, 54028, 62357
>>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>Cc: Matt Roper <matthew.d.roper@intel.com>
>>Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>>Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>>---
>> drivers/gpu/drm/xe/xe_irq.c | 16 ++++++++++++++++
>> 1 file changed, 16 insertions(+)
>>
>>diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
>>index ccb934f8fa34..cb03f40df272 100644
>>--- a/drivers/gpu/drm/xe/xe_irq.c
>>+++ b/drivers/gpu/drm/xe/xe_irq.c
>>@@ -519,6 +519,13 @@ static void dg1_irq_reset(struct xe_tile *tile)
>>         mask_and_disable(tile, PCU_IRQ_OFFSET);
>> }
>>
>>+static void dg1_irq_reset_mstr(struct xe_tile *tile)
>>+{
>>+        struct xe_gt *mmio =3D tile->primary_gt;
>>+
>>+        xe_mmio_write32(mmio, GFX_MSTR_IRQ, ~0);
>>+}
>>+
>> static void xe_irq_reset(struct xe_device *xe)
>> {
>>         struct xe_tile *tile;
>>@@ -534,6 +541,15 @@ static void xe_irq_reset(struct xe_device *xe)
>>         tile =3D xe_device_get_root_tile(xe);
>>         mask_and_disable(tile, GU_MISC_IRQ_OFFSET);
>>         xe_display_irq_reset(xe);
>>+
>>+        /*
>>+         * The tile's top-level status register should be the last one
>>+         * to be reset to avoid possible bit re-latching from lower
>>+         * level interrupts.
>>+         */
>>+        for_each_tile(tile, xe, id)
>>+                if (GRAPHICS_VERx100(xe) >=3D 1210)
>
>Better with the version checked swapped:
>       =20
>        if (GRAPHICS_VERx100(xe) >=3D 1210)
>                for_each_tile(tile, xe, id)
>                        dg1_irq_reset_mstr(tile);
>
>The code in the beginning of this function is about choosing between 2
>versions of the function, which is not the case here

Hah! That was my first approach, but it looked inconsistent with the above =
loop.
:-)

Thanks, I just sent a v3 swapping the order.

--
Gustavo Sousa

>
>Lucas De Marchi
>
>>+                        dg1_irq_reset_mstr(tile);
>> }
>>
>> static void xe_irq_postinstall(struct xe_device *xe)
>>--=20
>>2.42.0
>>
