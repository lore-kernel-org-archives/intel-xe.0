Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE169C4332F
	for <intel-xe@archiver.kernel.org>; Tue, 14 Nov 2023 09:48:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F1DA10E1F6;
	Tue, 14 Nov 2023 09:48:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AD7510E20F
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Nov 2023 09:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699955319; x=1731491319;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=DIyVhwjDNub14bN95PNVJMuxHmM4EVPsSEeQyoWKk4I=;
 b=G+vBwUjwfpLBC5uvO++n5JglFDTWk09pezFp0Jf9ArPJxxCd7+KICFGN
 RZDpUvbeTOiTO/v6FtWU2amb94X0cI+h98FwVXPHXn5htt18uxnEXeyqv
 Yn+oMD2tCrxLnT5Oc8RO3niS0NCPDWxofUTfdfBudw4eMVsoImajmqK3M
 xSNel/JXLgpmbulFc7aT7WaU+VdsNiHnCpNQlsk0+az7iD3QtU4CUAomj
 ovNNNYshFEA3PHD1w4FGE4j6Iap31+hkvYy6DI8a9Ut8+70mThAZghJOU
 Y3P8JSSOHYn2EOCh5+zq+21H7n/E8Sgb9vh6y16lq+TZLjPhvtHNZzK/P w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="476832283"
X-IronPort-AV: E=Sophos;i="6.03,301,1694761200"; d="scan'208";a="476832283"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 01:48:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="830527659"
X-IronPort-AV: E=Sophos;i="6.03,301,1694761200"; d="scan'208";a="830527659"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2023 01:48:36 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 14 Nov 2023 01:48:36 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 14 Nov 2023 01:48:34 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 14 Nov 2023 01:48:34 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 14 Nov 2023 01:48:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VNczX+Evtq46iYZfDQ0MjbGMME0NF03GZcskTTSn3L0PRx0NBOdSqVFI6xGKZ6NkI1XZ/cCoa56DruxThU9T3IDjJ5PsoF6IbuTvt3ZmbIaynOTQL8LuTLWwqTAZKsBK7msgz4JychBwutW/xPDuDXzhnox1N0gp7M0MigJzrNjb8LlQ+NPWMYsbyr4vl2FrCl4K3EaBbNngiyXvT0yTcxUXVgIvqVQphPVFCTdhPKKlsS38cAKvosD+91YCG3WERg1V1c+C/mW7K+CIIvkkGO8d8/cz+c9jQ2YV/wz8H3JYnRgHZ3U09TWPStifNvOjO0DYF2HqOpNaQTBrFryNsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VjsH2eFhVtNEUzky9XLIdN/iKaZ/38ZCIywgvwUtBC8=;
 b=MXmmFCFZlgf99K5VYxjb5wqAi98CeasodugC3SjjCSuo4y6cJXZSrqfkDIayGy/UJXDAA0gsd/+Tu+efK3MLKARXErWqOAXTzW7N9HgGZdL6Wx8CjtVmA0SkUwaL3HpdJLpbyCuTbwXtketcR26Dj1bszPUfEhUbCZCV4x3DH3ls2b/1Wt91cVfI2MnCaFYFL1EF4O9qTSTKB+PRzm+dsQmgbr7p+ftJBBsxWhk7aWGGwxoTLN/hqLDpaheJiceyU9KuziAJIhqqBwxJqzByff+4+Wsu0aKU8gKNpTWAgQa4e7l/O8u4Ke7VlW8R/smUMgR0thblnQ2Yw+cVw9MCIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 SA1PR11MB6944.namprd11.prod.outlook.com (2603:10b6:806:2bb::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Tue, 14 Nov
 2023 09:48:32 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::d5b4:6e20:2de9:ebb1]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::d5b4:6e20:2de9:ebb1%6]) with mapi id 15.20.7002.015; Tue, 14 Nov 2023
 09:48:32 +0000
Date: Tue, 14 Nov 2023 10:48:30 +0100
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <xyhhjtzkbpqrfbkxjrfzgmzyihjc4qptlfbnfz5mcp5enub4xu@yzg2enr4jbey>
References: <20231108003344.1169016-1-michal.winiarski@intel.com>
 <20231108003344.1169016-6-michal.winiarski@intel.com>
 <20231109215712.GA1327160@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231109215712.GA1327160@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: FR2P281CA0070.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::9) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|SA1PR11MB6944:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b62bf0d-6670-4f64-c43e-08dbe4f6dce3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OxHtuzQ/7BuDlR9Ih6T6igPpsQeU3UUK/a0vYq8qT9L3fVKVPIgyQgQEDVP8OyK+PwPdItkyvM2kXjIsDXqsssnEdFaiJr/qzoibBqq7Ccpxt/WXGAOxo9tSKwW45RATxmQJ1Jt6uRHr/cqysZy5tzfJZ+eE9PYP0bJC7pZ5dt+LkdW0bHSOU5c3xLOeZEBR0/MBP1rMXjQAtVW6k+1tXkMknHbasIQmMpWj0QoXIp3+LHabLEcEisQr7NfE44fDKxq4GWn8+XNLMHHZqyAFodYfvBr0uOvLpcpFABairT63YUcYlEYHmSyamWnNcNtVxFUcLlG7KG3DJxOEEnL8qzcDBIj6VkMY/4Xs7zJS5DucpANj4EO6IChrX6kgy2NVf+uXcudK8Mz6l6seOjSfnlPU0O/k3KgVcGn/DEgX9Tf3AdSjd4FsQE8X4jR+GtZR/3ofL2Uvrb3A9DdBroqEuksB6RUwWsu6DCSQH/9TiHgpu2EHE7OWCSVK6GVnP4/WF3sNNV7xG9WLrHyK7e9iAhinS0Mz3oX6hscv/M7p22KC5KE+0pXk+QnVXh4sOtMfYKaLgIorSEkvkAMCz2X3yQOMlqlrW5rwQQ8Vzke2mX4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(136003)(346002)(39860400002)(396003)(366004)(376002)(230922051799003)(451199024)(186009)(64100799003)(1800799009)(6512007)(6506007)(9686003)(6486002)(82960400001)(26005)(6636002)(8936002)(8676002)(66946007)(5660300002)(66556008)(33716001)(2906002)(4326008)(6862004)(478600001)(316002)(38100700002)(86362001)(41300700001)(66476007)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OGxOMklrRXZPVnFLMjQ3VWxORVRoRkM5V0dSV1RlTlRyWmRnczZWS2xQTGRZ?=
 =?utf-8?B?UkpZSVlFMTZMaFFYQTFsOUNQYWdmbk8wZlJBMDZSendWbkx2Y1doSjJSQ2Ni?=
 =?utf-8?B?NWVsd0taa2x1eVBDbUY3QkZTNkcrSnNRRWlQcERBRURldkgzeEVHdlZyYndZ?=
 =?utf-8?B?SlRnemdGblZ4OHV4bUlzRjVhV2oyZVY5QlpjaE1jVjhpNUN1amVHeTluMlVI?=
 =?utf-8?B?YkFhRVkxRC92QW5kdUNaSFVHNVlFaGxpSmNMSlozbGFuMXd6RHI5ak5GU1BC?=
 =?utf-8?B?ODM5c2o5cGlxaGdvbUpkNTgrVkFhMjc5SCtkVndKQWo4MmNHcHkvcWprQ0RU?=
 =?utf-8?B?OEp0cHNUVmFDaFJYb1o1ZjMySDR0SnJyVFhQbVZyY1RXaEc4QnFWT3Z0THMz?=
 =?utf-8?B?VmlPUHgxMzFNWFJZZ3Bnc1c2N2gra2VHTHROY0oyZWF1MG1sL3ZGR1Rsanly?=
 =?utf-8?B?aUN0T2xjRDR0cGJ4Nk5IdHJhUy9JYnFqZ0U0Q0FTQk9TRDdEcndHSGc2bGtl?=
 =?utf-8?B?aGFNSjR0Rkt1UDR5dFZ3MXdzbTB1cTUyMmlwVDZYZ0lMN21MWXRjVXlCNXlL?=
 =?utf-8?B?MlA1bkhwa3JkaVAzcnBJVUdlaXU4YW8vNXhXdGczSTlmanU1VEwxN2tOa1FX?=
 =?utf-8?B?MTdleXJ1UXZZZGhKWWh1Wmx1ZWYzbk9kcnFvUFZGUUprYzFCbVJRYzBac3oy?=
 =?utf-8?B?MDU3bEJzYUJRdldLZytld2FYR1phSTJLTlpvR2FJTGtaY3RPRXpYSzBXRXAy?=
 =?utf-8?B?UUpvK2Fkdm1lZnhidDBVbWtXMm1VQmlSb1hXZFBrMGh6RjRidnZtK1AraHZj?=
 =?utf-8?B?VzBhdVc0WGlOZ0NqdWdQM1F0SUNlQlhRZlo2WkFlS1NKM2MvSlZKVHNzVVRV?=
 =?utf-8?B?cUVYUlBqUThtWmF2SHBsUWVVZDFuSm43WkVaZDBCemVmc295cFU2dWU2SVNT?=
 =?utf-8?B?c1hJQytxNzIzdk0yVjYvRDZiTldsMUR4Z2VSQXZmbXRuQUx1dDFOaVRCOG5p?=
 =?utf-8?B?cXRYTDlNY2VPTnVNc1hmKzdLWkw1YkM3SDNlTUhocjJGNGJURGtBMm9QNzha?=
 =?utf-8?B?aDNnRitGT0pIQlhlQ0ljOTlERm41bmZDdjNWYXNuSDZ1Mks2WGN6UVY3aTZH?=
 =?utf-8?B?dDNJN3U2VnBJSDNJOXhPa3BNYkdQVit2Q0hMNzJpUnRyUkxOTHNNaW11dThC?=
 =?utf-8?B?UGNWY0FpYnptVDVQNmdkdzJ0TXFDaG1CY0lMRTg2TG1UZW5mVndERWdvTEg3?=
 =?utf-8?B?MGE0R0h0U05SNEgySG1acGlNM2IrRDdTUU9QaXhvWldZNzZOSXVOeHdFNlRN?=
 =?utf-8?B?RlBobTU3R1FibGthSVBkT1hEMml3R1hHeGxNcnd2MzZlSExkUmJsdTVVVnVQ?=
 =?utf-8?B?NVNOb1V2dlg1ZUNqcDcrckoxbzVFL0RaSUhsTEZzQkZ4V3hyd2E1MisrMDVB?=
 =?utf-8?B?QkhISkV6eHkybFI4Tm1LUFdZYWJHQVJKQWphME03azI1Z3Zpb2NPY1kvSmc5?=
 =?utf-8?B?ajdhcUloc0VMQ3QxemRqU29VanVqK0p2NVJJMU51U2RHV2M0WEkwV3dxU1ZB?=
 =?utf-8?B?TWxNdzV2Yk9SY2dHU25mbG5CN3ZEWTBOZ0lTM3llVFQ3QUI4MXVISUZ4S3pv?=
 =?utf-8?B?TnRuRWREdGpLTk9IV0ExSEdSRC9CL2Ivcm5HZCsrb2NPQVd1My84SWF3VW51?=
 =?utf-8?B?dkNzQmEyRmIzb3RxMHZHUStrQVp6QUxUQ0JmbzM5N3FRUEt2YnAvVWdaZlV0?=
 =?utf-8?B?RktLUEo1UHpZUCtDYVJqaXkrWVFuVXZ6V2xxYVluQkNnMHVQekpVUFZnRisw?=
 =?utf-8?B?NWluMWZKNlh1VlBoekpqbDVsc0pwMWZXdWU4eFM3eXAyWUgrRFpqT1VwUi8r?=
 =?utf-8?B?SFdmQ1B3MHNwcFFmcHYyOXF4OE4xa1FwSXR5MjNBdmEweCt2S3c5WGkyb3JK?=
 =?utf-8?B?QlNLY2JrTjRzR0ZFZlU5OUJvM0U4RHNUSHZ1K0U5ZitRVFlwUjVoNU8xSGtq?=
 =?utf-8?B?Q3hRb0xKdEV1TUpsVHUwcExNa2xjb0ZMKy9vOHNEdkNSdk5Eb3FsSDN2TWY0?=
 =?utf-8?B?T2dwT2VZSW9NZFZ0dG5GMFZZVU91N1h1L3ZkOTU5QjBLRm9jZ3lrYnJVVDBE?=
 =?utf-8?B?NUIyK3B6MEZzeWprZElLMEh4ekxFT2NXR2lkQW5ob20yT0RJVTJBdS9SSVFU?=
 =?utf-8?B?Umc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b62bf0d-6670-4f64-c43e-08dbe4f6dce3
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2023 09:48:32.3210 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aGlqA2lshHcsd4iBzakDEDbrn2/5eVN/kEgmb35WqMptZ9uV6ec2e8JNx7mWQoVZpFqAAL1O/vvvwZK/ARGk7YeZKh7o7PAaHf8EGm31x0M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6944
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 05/12] drm/xe/mmio: Move memory training
 check to probe vram
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

On Thu, Nov 09, 2023 at 01:57:12PM -0800, Matt Roper wrote:
> On Wed, Nov 08, 2023 at 01:33:37AM +0100, Michał Winiarski wrote:
> > The check doesn't have anything to do with initial MMIO setup. Move it
> > to the place where it belongs.
> 
> Even though it's called "LMEM_INIT," we're supposed to make sure we
> don't touch any GT registers until this bit is set (because the GT won't
> be fully functional until that point).  It looks like if we move it to
> probe_vram, we've already tried to touch GT registers (e.g., under
> xe_irq_install) which might cause problems?
> 

It's not documented very well. Sure - I'll keep it in early probe, to be
called right after MMIO regs for root tile are mapped.

Thanks,
-Michał

> 
> Matt
> 
> > 
> > Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_mmio.c | 24 ++++++++++++------------
> >  1 file changed, 12 insertions(+), 12 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> > index 0da4f75c07bf6..f4cddf2dfa3a3 100644
> > --- a/drivers/gpu/drm/xe/xe_mmio.c
> > +++ b/drivers/gpu/drm/xe/xe_mmio.c
> > @@ -254,6 +254,18 @@ int xe_mmio_probe_vram(struct xe_device *xe)
> >  
> >  	/* Get the size of the root tile's vram for later accessibility comparison */
> >  	tile = xe_device_get_root_tile(xe);
> > +
> > +	/*
> > +	 * The boot firmware initializes local memory and assesses its health.
> > +	 * If memory training fails, the punit will have been instructed to
> > +	 * keep the GT powered down; we won't be able to communicate with it
> > +	 * and we should not continue with driver initialization.
> > +	 */
> > +	if (IS_DGFX(xe) && !(xe_mmio_read32(xe_root_mmio_gt(xe), GU_CNTL) & LMEM_INIT)) {
> > +		drm_err(&xe->drm, "VRAM not initialized by firmware\n");
> > +		return -ENODEV;
> > +	}
> > +
> >  	err = xe_mmio_tile_vram_size(tile, &vram_size, &tile_size, &tile_offset);
> >  	if (err)
> >  		return err;
> > @@ -384,7 +396,6 @@ static void mmio_fini(struct drm_device *drm, void *arg)
> >  int xe_mmio_init(struct xe_device *xe)
> >  {
> >  	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
> > -	struct xe_gt *gt = xe_root_mmio_gt(xe);
> >  	const int mmio_bar = 0;
> >  	int err;
> >  
> > @@ -409,17 +420,6 @@ int xe_mmio_init(struct xe_device *xe)
> >  	root_tile->mmio.size = xe->mmio.size;
> >  	root_tile->mmio.regs = xe->mmio.regs;
> >  
> > -	/*
> > -	 * The boot firmware initializes local memory and assesses its health.
> > -	 * If memory training fails, the punit will have been instructed to
> > -	 * keep the GT powered down; we won't be able to communicate with it
> > -	 * and we should not continue with driver initialization.
> > -	 */
> > -	if (IS_DGFX(xe) && !(xe_mmio_read32(gt, GU_CNTL) & LMEM_INIT)) {
> > -		drm_err(&xe->drm, "VRAM not initialized by firmware\n");
> > -		return -ENODEV;
> > -	}
> > -
> >  	err = xe_set_dma_info(xe);
> >  	if (err)
> >  		return err;
> > -- 
> > 2.42.0
> > 
> 
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
