Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85CEFC77B7C
	for <intel-xe@archiver.kernel.org>; Thu,  4 May 2023 14:19:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5783210E45A;
	Thu,  4 May 2023 14:19:51 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5305D10E45A
 for <intel-xe@lists.freedesktop.org>; Thu,  4 May 2023 14:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683209989; x=1714745989;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=FKyUcYwdtMX49VIfP38CyHyJJ6vWysYuz+4avNnkQT4=;
 b=NP+vaKzLM9gE9WkcoiBWBFmIb+So+whd+ni64B3tBWRlsz7COeASI+Hd
 rMSuNBpaptBAIBDeJw/FRPy6MA04oa/WJKLkuvrqkjBZZFYY5SDcQ1Kqp
 eA71yjZcn7xJRj3PbZAFZxhyf0/HSb/oBNGr0aK6RmiUM5IRKDBFb9lde
 Xy96mwTSpPqDuZXh8rlo/1Z5rmL43nqw2Es3kr7buIG+Igrv4sq4NV0ic
 ZEqj3Pl7XPA4dLVizHWP4Cq36mpUY+MB/yy7Wv/ichgQrByLtXYPDC07L
 MGAP0m1v91Y0ZDzgYuzg3mrZRDEENKZF6mY/CB91NnjSyrh32szOKy8QD Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="435252152"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; d="scan'208";a="435252152"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2023 07:19:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="841183533"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; d="scan'208";a="841183533"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga001.fm.intel.com with ESMTP; 04 May 2023 07:19:48 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 4 May 2023 07:19:48 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 4 May 2023 07:19:47 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 4 May 2023 07:19:47 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 4 May 2023 07:19:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KIrbJ9dRiJIlNzZOZJtSFkfMy0ZfTYX6KK/0gMezvtGdzOmm3fyKWwNHPxtCGczIoE9EBIejy1I1sIxIDaOLwyJLcAAGR+i3ZG0C5w5+9gmpX80fHq8mIlrFboIVocFO94JfKDw9aFAk4JphapkP1xu5083A1tT0Jda50/x1wKi8hAubyG8Rt3K736F5cDFNkY71DN/g3p0iksrqlo0zFvJZjyf4GnaVvRgBFx9C84CXWQ2yoXH4gRfIu7AVOFTI+SNqReDYrny0QrhWJrLk0mUC/mV7qUNNNqgaIeAqm6nugjqpusK82Qr2aU8GApaw6BMwxemaF2CypAzc7kVQ/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P3K0ayx9WFSQCVTzeij/ap7UOMMwCfZ1e+zakCDmL2s=;
 b=BanD/yv+zaFmdIpb+vyuOx2VNwTJR29mlA6AXEtonAxspdPHLFIxKxS3OlP2oVzFhVKt/5PVqmpioSf3AVe23+Xlv9KyGfnscNZDJ0V8/IFk27YOII/w3UdIEL8iqXdRs0vxACRzIo5ipgZzYdFbTVZ2xCd7OC9gKqIY0ZX4wqyM0Hu8c1ERS6+/UA+fzEkFjKH7uY4WcOl9jGKC6OoTSOuRiqo5uI2fUtfD/VKYoAfhVi+2WgVwnGXb+vVZAwyiaQ1nKZHa17LybHxyqAOs2CdEitB2ZVv01ADHJtobYNdtD47tD1lEE9GBEcOWWUs9eNUR90mt8Cba14S9AEwsjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 MN0PR11MB6255.namprd11.prod.outlook.com (2603:10b6:208:3c4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.26; Thu, 4 May
 2023 14:19:45 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396%7]) with mapi id 15.20.6363.022; Thu, 4 May 2023
 14:19:44 +0000
Date: Thu, 4 May 2023 07:19:41 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>
Message-ID: <20230504141941.GF6250@mdroper-desk1.amr.corp.intel.com>
References: <20230504141227.29785-1-jose.souza@intel.com>
 <20230504141227.29785-2-jose.souza@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230504141227.29785-2-jose.souza@intel.com>
X-ClientProxiedBy: BYAPR06CA0060.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::37) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|MN0PR11MB6255:EE_
X-MS-Office365-Filtering-Correlation-Id: f663ad8d-bb70-4df1-60cc-08db4caa9b9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Gh3XveV/Ns6S+8QmJS+iZmFOMOLkmMnyfZQoftkjn7/e3JgMNbQplL718yo+UmN/kvnQ1BtpEUJAz/tGATw1lReeqd4HQ0gYN63QhHqTZvNKhNsqibo/DR3LBvgubMVxuL3yGDiNsJQqkOmPK7F4UC3Y7DW9EtnrAST6zFz5MRYDxPXGOGuA61m1PMYw4ggd0ctYQrf60EF2RwkgCrWKIIx7FWc47GUpK8lLTdJu8x48rNEMV4bbMpFN8Bb7+6PoUANtl2I/KH3kdR7kuJiMTvfZydDdmBMOpsEwF/yH+Ud4qgfGoT75VbIhh4wN1ALJhcCRN49ezCzaD4nwukurpCZLPwfYLjhJJ12ZxFNj3AcwNqq64aczIG9tkji5PnHrcoapBjgtyXW9BcrNuBP/FeK5hI2s+DBc0ONJvCBEgRPUuP3a3FYO4wBtP8SfG5SFmpAXJ1zgAlAPp9tsaxEYSV11BNt0l1pxSfNAgX6BbkWhR0gNkCKMKX8bg6aigKo0q+VVFbSTn21GA09xwEa478Oz2zmvPZHNpqlVXT7pUahds19DoWylRosIRExhX4Ls
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(376002)(366004)(396003)(346002)(136003)(451199021)(2906002)(1076003)(26005)(6512007)(6506007)(186003)(5660300002)(66946007)(66556008)(66476007)(82960400001)(478600001)(38100700002)(8676002)(8936002)(6862004)(33656002)(41300700001)(86362001)(6666004)(6486002)(4326008)(316002)(6636002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?WBooH8DCDhKzratbPFGbtfBKRl41AECelHIbrTIBHb7zSPZdYvx+xpsaTZ?=
 =?iso-8859-1?Q?XncqTqHA2AwxDTs6gO7VsDNdvGCEqbbEmTO+BSHQzoHum828MC6cQ7ys+c?=
 =?iso-8859-1?Q?OsvjTvW7clsxv0xkIxuPNf1jeOtyQ3035rvqUj6zZo3RdgCzWh/EfB9KiP?=
 =?iso-8859-1?Q?f6V+Vi2NWnVFkjj4AVmQ9tXBDwW6JMc86akW/ZsBcqrjxzSHPxbXLjzirV?=
 =?iso-8859-1?Q?OSS7CkYSWUSxfUKceP2kB2RD0KMm3CgiWxnVRPkkXYZQdnOz+gAo6kYoIP?=
 =?iso-8859-1?Q?joExyoR1bzSEMIlIq9vPGsDAoHGZZhL71Xlck+BNKgk0WWpdIPtIkyeoj0?=
 =?iso-8859-1?Q?vKLQPgnCV2ej3c/whSWPdNfPcOiK9u9XV+/dRZsKjrTfJ/eEdTF5myfeCN?=
 =?iso-8859-1?Q?gbN6kWXMPuQu7bEpEi9yEGTlFek8DmqdkTK+0gyIlCivaxYty6q0jCQSGw?=
 =?iso-8859-1?Q?2jNtkzWY5FGk67bJHT9BHeowUPq20yrVGg7wvQjAnLm21H8ILOWlvaKphS?=
 =?iso-8859-1?Q?ghpxrYe1hmF1oyVR17RUHmzBjjluR3se2hMbirr76+1gV+f/DnoovOavpA?=
 =?iso-8859-1?Q?SD06yz4Eg/yoFh9O7EQgR9fkBOWRNmY0aNlu8K+v+VbXdDLlCMMpOJGN/+?=
 =?iso-8859-1?Q?w1m3JJbX5yk04oAnDNUIYY0MY7X//OdhhrLf7NcA3sm39qS1kK6XVMGJFE?=
 =?iso-8859-1?Q?nP/z94+fq1fZtxi+Hd4QurcB2WCf60F82XUd8IljShyxZKXF2y3nGTSzQ+?=
 =?iso-8859-1?Q?GIgaP74OaF9gjPy658zcGQ2SrfGJy7qNZakdh6mUsDDPLL0vnVxt3A9j1q?=
 =?iso-8859-1?Q?vVUmONx0Y5C1ff+kB1EmkqczY55HepZcQ7H323Bj6eQmZOlMm6D6LmXFJJ?=
 =?iso-8859-1?Q?z3I0D25OKw0BjaFyDoBmEEqRay1XcDHFyz91ELNzGzJ79vb84BT6G0odFi?=
 =?iso-8859-1?Q?PS3qoGDUMffz/DexWpEIhbdxPqOnCrSYSpXxdmSXHYyI5FVZtyRlBf+Dpb?=
 =?iso-8859-1?Q?u6BvFqboTCdtECg4DbdgWiNFqGMPE8sszDO51b2o64y33wOg7bBNYblbiZ?=
 =?iso-8859-1?Q?6p5MdbX43tHN6/5BdyQ7eYzZA1fayEaSBT/fTavPoaF3W9EG2lF1Zlo6tu?=
 =?iso-8859-1?Q?bw5CuoZop/+qWyC/S6TlUOT1/yOnQczGc7eFH/szZbBfWgRj+IIFney/c4?=
 =?iso-8859-1?Q?/DSduJmGVtQoJRCc3k6iI7QKx54oslF95khX/BYG7ESu3ZsQz0I/9XEiHH?=
 =?iso-8859-1?Q?q7sWViTbGoZPytqEv08aGyZt2DjRvrcNh0TkFU/t9W/+TbMVyNia73oRqx?=
 =?iso-8859-1?Q?ERDHioqHstJt/IRCUmeMFg2uZpYNzg+xeYs6+Lr4p8syRj9uxlMandzQnd?=
 =?iso-8859-1?Q?TaczEEfVbeWbAWC5X39K2OdS4LfuQb2XUTibgbufprYehAojMbMwYrGvsP?=
 =?iso-8859-1?Q?AsDnOQxeQ2lOQhED1/to0me37y0CKi3c77+xuDWJPk4au+UHEbbq+sWE1G?=
 =?iso-8859-1?Q?LTFbwKVB/xa56HhCOTeAXrlNlroD9OBfe8vM8jcj5Ihixc4MZRFI9CvQbM?=
 =?iso-8859-1?Q?+TQiOM2EHPmgUhf7UzcI2mQZC+aMOvqkqm3Jltz3ql1F/qfGlIgn9ryeKQ?=
 =?iso-8859-1?Q?0luNYBIVAmGFCECkUvbrHRvzpBzEXPTyVs0Xtxa7U9h0MKf0ZQm68mXw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f663ad8d-bb70-4df1-60cc-08db4caa9b9e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2023 14:19:44.4463 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vuw3kTt20rN5BI+io0MEXPxuX6lBMtBGgEs5c1z3W/S1b8ugtxlrNk6H0qXvti58Ne06lGKznPhIbzOrjWUO+9zfJYVXq1hOauaIHQFO7GM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6255
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v4 2/2] drm/xe: Set default MOCS value for
 copy cs instructions
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

On Thu, May 04, 2023 at 07:12:27AM -0700, José Roberto de Souza wrote:
> copy cs instructions that dont have a explict MOCS field will use this
> default MOCS value.
> 
> This was mainly copied from i915 source code.

Nit:  It kind of seems like Xe has moved far enough away from the
original i915 code that this sentence isn't really needed on either of
these patches?

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> 
> v2:
> - move to xe_hw_engine.c
> - remove BLIT_CCTL auxiliary macros
> - removed MASKED_REG
> 
> v3:
> - rebased
> 
> v4:
> - process workaround in hwe->reg_lrc
> 
> BSpec: 45807
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_engine_regs.h |  6 ++++++
>  drivers/gpu/drm/xe/xe_hw_engine.c        | 20 ++++++++++++++++++++
>  2 files changed, 26 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> index 717d560626cec..79873bf64e8dd 100644
> --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> @@ -58,6 +58,12 @@
>  
>  #define RING_BBADDR(base)			XE_REG((base) + 0x140)
>  #define RING_BBADDR_UDW(base)			XE_REG((base) + 0x168)
> +
> +/* Handling MOCS value in BLIT_CCTL like it was done CMD_CCTL */
> +#define BLIT_CCTL(base)				XE_REG((base) + 0x204)
> +#define   BLIT_CCTL_DST_MOCS_MASK		REG_GENMASK(14, 9)
> +#define   BLIT_CCTL_SRC_MOCS_MASK		REG_GENMASK(6, 1)
> +
>  #define RING_EXECLIST_STATUS_LO(base)		XE_REG((base) + 0x234)
>  #define RING_EXECLIST_STATUS_HI(base)		XE_REG((base) + 0x234 + 4)
>  
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index d497f0289c372..a7d5d81335f47 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -277,6 +277,8 @@ hw_engine_setup_default_state(struct xe_hw_engine *hwe)
>  	const u8 mocs_read_idx = gt->mocs.uc_index;
>  	u32 ring_cmd_cctl_val = REG_FIELD_PREP(CMD_CCTL_WRITE_OVERRIDE_MASK, mocs_write_idx) |
>  			        REG_FIELD_PREP(CMD_CCTL_READ_OVERRIDE_MASK, mocs_read_idx);
> +	u32 blit_cctl_val = REG_FIELD_PREP(BLIT_CCTL_DST_MOCS_MASK, mocs_write_idx) |
> +			    REG_FIELD_PREP(BLIT_CCTL_SRC_MOCS_MASK, mocs_read_idx);
>  	const struct xe_rtp_entry engine_was[] = {
>  		/*
>  		 * RING_CMD_CCTL specifies the default MOCS entry that will be
> @@ -297,8 +299,26 @@ hw_engine_setup_default_state(struct xe_hw_engine *hwe)
>  		},
>  		{}
>  	};
> +	const struct xe_rtp_entry lrc_was[] = {
> +		/*
> +		 * Some blitter commands do not have a field for MOCS, those
> +		 * commands will use MOCS index pointed by BLIT_CCTL.
> +		 * BLIT_CCTL registers are needed to be programmed to un-cached.
> +		 */
> +		{ XE_RTP_NAME("BLIT_CCTL_default_MOCS"),
> +		  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, XE_RTP_END_VERSION_UNDEFINED),
> +			       ENGINE_CLASS(COPY)),
> +		  XE_RTP_ACTIONS(FIELD_SET(BLIT_CCTL(0),
> +				 BLIT_CCTL_DST_MOCS_MASK |
> +				 BLIT_CCTL_SRC_MOCS_MASK,
> +				 blit_cctl_val,
> +				 XE_RTP_ACTION_FLAG(ENGINE_BASE)))
> +		},
> +		{}
> +	};
>  
>  	xe_rtp_process(engine_was, &hwe->reg_sr, gt, hwe);
> +	xe_rtp_process(lrc_was, &hwe->reg_lrc, gt, hwe);
>  }
>  
>  static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *hwe,
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
