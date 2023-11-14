Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22A03C4332F
	for <intel-xe@archiver.kernel.org>; Tue, 14 Nov 2023 09:47:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D820F10E1EC;
	Tue, 14 Nov 2023 09:47:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C05E810E1EC
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Nov 2023 09:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699955219; x=1731491219;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=4WmEMJhoQLvoF/rGR4Dz7rbd0+L/ZtxpO5jFOs0Z5vQ=;
 b=ZAFUMH0VbefsN7yMza2l4HYrRVfBKzzXQk715zXvOxhpt+7Eb5eSBgvr
 Wwh2LB0epBZduXGdMY5wZ6ZtEDZmgRBXXqmzepz0F3hYfG31DUG9M9Po9
 fDcKM9uDGCaMJpti6gZ+p7NXwLTdrOwN4d6t+pcAoMwnxQZXObgoySxWS
 hNwG5EZ8KSAToLptATLj8I10yau5hHCnNBHh4VQbvv3Jiv3SHtuyjXGdp
 M/oP9C0qR4WKDAkuQv+uWfYf0iV90vFZfOWU+YQ+RDh7uG8OdpsDPGASs
 pE0pBLYqGl2+h2edE2hzZclptEVlUkpe75KzuMdiLwG8xM3ravoVFQbQ9 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="454913754"
X-IronPort-AV: E=Sophos;i="6.03,301,1694761200"; d="scan'208";a="454913754"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 01:46:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="799468810"
X-IronPort-AV: E=Sophos;i="6.03,301,1694761200"; d="scan'208";a="799468810"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2023 01:46:58 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 14 Nov 2023 01:46:58 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 14 Nov 2023 01:46:57 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 14 Nov 2023 01:46:57 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 14 Nov 2023 01:46:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fxW/QiyLAvgnnJY+nrzfBUjZB8pbE1Dl2vZ2j1zBvE63zW/hc8pFZ7bXFJr5k7CnipHoPBg813IwWXnNdnJdZv7iTMbACxYwVMX0tRmQ0ie3rlGM9znQ3+e21PgEr8HXgmf5W/IhW9e/aUqV5LPaekXuQ4ZRyH5qeLkqtSibv7H6AYNNyuRW9xZAUXznPUrvWN9g6EjuefbZ2J/jTTFAQVjVih5x/Wh1wnbF1isCBoTOnox4AkwjAutw0qEqr/vq0HGf+zUEAcGLUTNq6HDtcdKfOJIbrG4c1OTZHFCkEtEdZ3Ght1jbyBU5TS5u/mwPvFKa+uumCRXLiCrweypL3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jXnRqEa/TD6uCiezR24DZwPHq2XjrpbR8K4iMYIK2bs=;
 b=ElnV8XafyB3na69z+jlH2ZjItsKu3hQ9XBBehZD/Pp0yxXCgnqnYEaes+hhqAmByP8bp1DzPg3Kuu5UbRKu5ZpLmqeAGFFJjKXysvqN8LNR/R9QOkC1D1ZaXJ2ZIYgyYOG2FbPthpHVwczQ+t26EO/lVcMdxgQz+5vZKPEI4ROi4/agX1XDaqXr13RowoBzgr/tda4OIYeSM7Ap+wQF7q1FyRd83ySlgDLMDDnuaIN2lJpyIIltZ645GTVAb6TSubpIBavG6BC/YCIbD63Dc5KXazsjOGZwuUuqoTiA7hGO8b7+nQtDsTNskdPfYs283XLG+TUMK0QnKZkOyLf8fug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 SJ1PR11MB6179.namprd11.prod.outlook.com (2603:10b6:a03:45a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Tue, 14 Nov
 2023 09:46:54 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::d5b4:6e20:2de9:ebb1]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::d5b4:6e20:2de9:ebb1%6]) with mapi id 15.20.7002.015; Tue, 14 Nov 2023
 09:46:54 +0000
Date: Tue, 14 Nov 2023 10:46:52 +0100
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Message-ID: <zyc4moss4fpg52eplhp2zvyhyvv7eojlfurcmn5gfadtmdy5rg@y3wduijdyyic>
References: <20231108003344.1169016-1-michal.winiarski@intel.com>
 <20231108003344.1169016-12-michal.winiarski@intel.com>
 <ZUumK/ru72HfDK+n@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZUumK/ru72HfDK+n@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: WA2P291CA0003.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::7) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|SJ1PR11MB6179:EE_
X-MS-Office365-Filtering-Correlation-Id: 68fda2fb-4839-432d-77ef-08dbe4f6a289
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 018YPGMZBaIh8BTeY8IJdG8J6hsYBl0AwZcASeWdUIgBsZ9lOUnbXGWuMZMy7oQBPcWISCniF9QKNJj/x5T05DHErwmLVTaNO2jp6xkfs/Z2q6hWibOPD6IWLtYkejQPgMZqt/h19Ypt8Nx2a0+Odd4RVgF59ABzePSJP4wPAfbw/IEHyMEOoP8KF/xrGPNjPBLK26SWdZQEIg3/wCj/lqn8xlFdV3E4Y3Hi+4HSG7xJfo/5aR9CgNMK8zq6mAt3kYB1vp0wV5vF1hJmU4h9awolzxguK6xvG/JCRkdR/9SiKwNF3avaIImKufi7UoY/w26nPYrm2VsoFv6DCbpardHuus6MrgdiI5fGoUf8jSGEkbH1vm7QwxCHv/lUL67KYL5BQkhO6zlE5h4rJPlJCCPDK9YUZA2GTNpywdkI2hKqRLNeILLp3lfLHmjJzVOJGT2Zst5sjYRADWBd9mSgBWdOAceC8vyyDC8k/wSw65X9dymx6EkpqsflToLe7tZYhoven5K/wQaRT9vBNuUqAyR2KrlvHaTYtPKK1CtwP5g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(376002)(136003)(396003)(39860400002)(346002)(366004)(230922051799003)(186009)(451199024)(64100799003)(1800799009)(38100700002)(41300700001)(83380400001)(4326008)(82960400001)(6862004)(26005)(8676002)(8936002)(6512007)(9686003)(6506007)(33716001)(2906002)(966005)(6486002)(478600001)(6636002)(316002)(66946007)(66476007)(66556008)(86362001)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S0pHc0ZWbjN3Yld5cEtlSHJCNHZENE1TOWhnUUlxZTlIbUVVZXZqd1ExVVVi?=
 =?utf-8?B?enZtU3RzL095cEtIQzFQZ0JGbldjZmNuUGxpdjR4Rzg5YWw4eW5UYVJHWXdT?=
 =?utf-8?B?WVhlWU5oQm82aGx1VExGNkhQc1dYajZBMGZMNFhEL1M4V2dYeGUzSFprMHlu?=
 =?utf-8?B?TXo1dEYwTEc1amdqZjhScVRBMDNLS3RnQVh1T0hoSndXc25wWll1OWZJTmhz?=
 =?utf-8?B?cW1ocEtoWHBwV0JqMit2SUJob2xlSXVDUzJ3ekUxYldvbEk3QWRMbHNrNnJv?=
 =?utf-8?B?ZGgra2NMbVJFbWVDbFNNR1NDVmU2TG8yczF0NUlXaDk5dlJyWXVZQWc1TmIv?=
 =?utf-8?B?OU9KQzR1UUY5YzI3QklraGp5SmJlcDhvYjVEUXRpSWczZVJiR211SVhUQUZw?=
 =?utf-8?B?MFhQdTRUYVlOaGo5STdMbGNiTEdRcTg4WnZrMHpOaDNhWmpjb2IvU3YrcjlU?=
 =?utf-8?B?VTNaclRGeDhMUHY3Q055SVhoSWVHTUpLYkJuRzZGbUtHdCtZQTJ3S3hsczVQ?=
 =?utf-8?B?WnRkQWduaGlxaWJyYUxxRHZpa3ZadkhnVWpRWUROV1A1MGpBYjdwdjdFRTJ6?=
 =?utf-8?B?b24rb0h3ZU50UEZ2YW1SSENZcm0yNFZsQUJSWXMyeWdheE9tMHdlUkVnenJH?=
 =?utf-8?B?Y2cvUnJkaTErZGlUTnhlb3pQN05sdDFxMlpFTWF4aVJiRVVLYXVIUENJb3FB?=
 =?utf-8?B?SzBHK0VXdGJ3T3VCcDhlU3haTGxQa1RsMnR2aER0VlVOV09Rd09uMk85UGZ2?=
 =?utf-8?B?UUJ5KzJVd3RYbzdGTFdSNWZWaGt3ak5FZXIwQWFMY3p0TTVSVTUwUm4xNVli?=
 =?utf-8?B?YzQ1TzFCQ0toY0IwZkNFYXFTQzF5V0NiK0tQVzFuajVoMld1NUNaMXNEUVhF?=
 =?utf-8?B?UnBzUHgrb3p2eWV6Y0tSaWxaOEdTVkNHSWhpSUh4ME9rVHVnSTZpaUplWmUv?=
 =?utf-8?B?TlVpSjdTNUFTRlFubWx0YVVKWjI0VmV4K1NsUy91ZTg0ODNITnBWckYxQVQ5?=
 =?utf-8?B?QjBGREorT3poMDdzRTN0U0FneWlwdFcrdFdEelp6MzNTbndTeXJYR2xGNW9t?=
 =?utf-8?B?dll4cCs5ajdGamVHcWx4NnFsZ1RsRncwQkkyNmF3U2VVRyt1VHBRQTUzV0dK?=
 =?utf-8?B?MmpBMDNNRjg4bHJzZER6VC9MOEc4SG5UZnVxOURYQkcvVDYyT0diT0F3MFJF?=
 =?utf-8?B?dktWRG84aXF2N3lNMVZXLzlibWZhQ282R2pRQ2RSQTd4NzhYNG1IS2p2bEpw?=
 =?utf-8?B?QzNEL2RXeGpIQ0RqQW9xdUdRNU42QVdIYy9lZHlWZmxZVkRudnBBYnQrTFg3?=
 =?utf-8?B?K3pJWXNXMGR2aGQyRi93UjNYZzZkSnFIeTdobXRpb3ovWmZreEU2VUxpZ21K?=
 =?utf-8?B?QU1pSmdDU2w3b3JGS0g1RnFrVUdmZHgzNzJuU3N4eGhydVhOKzI1MXM0Z1BD?=
 =?utf-8?B?RnNRZTFad0dlaEpzVEpXM0xPNXdSOUpvQm9pWVRTOXhaMDBDWHhva3d2dWQ0?=
 =?utf-8?B?VzVOdFg3M3JvaFlHUlMyUTRLOExsWlM3ZE0rc3lXd09lVHl3bjBla21qWW1T?=
 =?utf-8?B?ZWIxMFg0d0pGVkgzeUVGcDBWaU5oaDg1U3Q1ZW93UFFpSU8xMnV5ZVM0ZjlM?=
 =?utf-8?B?NGJwdWZ4THpDQ244d2xPKzlUcWVZUklsemhDKzg4YW5uT0YvdXRrc2JUTFd0?=
 =?utf-8?B?MUNhcEhkVm8vZGJlK3crMzJKZHpnK1VaV3FlV1pIMUgzODZ2OHNoUFZGeUFn?=
 =?utf-8?B?NExxTTFCUHdpUFF2dmxsU003REVrTHZBL1FPZjE5YXJtQVdDeWljeTRPYWFI?=
 =?utf-8?B?TnpJbzZURXlQNzhFWVZyR25UUVZtL1E2dktZcnI5WDFtSUJkcjMyOW5mdjFz?=
 =?utf-8?B?d042UnlTYnhneGtuNTUxOTZzZXZrbExBYkV2bjFwVFZzMkRuZDZSRGdiRDJ6?=
 =?utf-8?B?ay9VbDkySWx5QWdTQzF4TitISnZhaXd1S2pqdi9USlE3OU0wdW5TRTFUQkQ3?=
 =?utf-8?B?dDdJc2pEL3B3TEpEZG81YzMxTDYyTUcxTnp6RFNxNEhScHpLeWU3dGRhSnYy?=
 =?utf-8?B?b0luNDFHRWRWWlJ6cThGSFpqNk9ZbFVMUTFJSjBndXlNTHVlcWJXb1l2OTdn?=
 =?utf-8?B?RUR6V3NkWCtZNUU4SGFzL243Z3NURG1HY2RUKzRTNVYxRVFGR1Q1djlkYjlv?=
 =?utf-8?B?eXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 68fda2fb-4839-432d-77ef-08dbe4f6a289
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2023 09:46:54.6043 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uVdJf36fsSpzRiiUK0h7RyGDqkMTjI60f+irBPt26Is7UrkQDYFQtd81VpB7n0MSGfdDYwF1QYTHGWoyV2tZZekVgCiCn+AW25v5lreHGWI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6179
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 11/12] drm/xe/device: Introduce
 xe_device_probe_early
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

On Wed, Nov 08, 2023 at 03:15:55PM +0000, Matthew Brost wrote:
> On Wed, Nov 08, 2023 at 01:33:43AM +0100, Michał Winiarski wrote:
> > SR-IOV VF doesn't have access to MMIO registers used to determine
> > graphics/media ID. It can however communicate with GuC.
> > Introduce xe_device_probe_early, which will eventually initialize enough
> > hardware to allow the driver to communicate with GuC early during probe.
> > This will allow both VF and PF/native driver to have unified probe
> > ordering.
> > Initialize root tile MMIO and TTM sys mgr early, as both are needed to
> > communicate with GuC firmware earlier during probe.
> > 
> > Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> > ---
> >  drivers/gpu/drm/xe/tests/xe_pci.c |  1 +
> >  drivers/gpu/drm/xe/xe_device.c    | 21 +++++++++++++++------
> >  drivers/gpu/drm/xe/xe_device.h    |  5 +++++
> >  drivers/gpu/drm/xe/xe_mmio.c      | 17 +++++++++--------
> >  drivers/gpu/drm/xe/xe_mmio.h      |  1 +
> >  drivers/gpu/drm/xe/xe_pci.c       | 26 +++++++++++++++++++++-----
> >  6 files changed, 52 insertions(+), 19 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
> > index a40879da2fbe1..733df9a270db2 100644
> > --- a/drivers/gpu/drm/xe/tests/xe_pci.c
> > +++ b/drivers/gpu/drm/xe/tests/xe_pci.c
> > @@ -143,6 +143,7 @@ int xe_pci_fake_device_init(struct xe_device *xe, enum xe_platform platform,
> >  		return -ENODEV;
> >  
> >  done:
> > +	xe_info_init_early(xe, desc, subplatform_desc);
> 
> This should probably be in a patch [1] earlier in the series.
> 
> [1] https://patchwork.freedesktop.org/patch/566444/?series=126105&rev=1

Yeah, I'll move it.

> 
> >  	xe_info_init(xe, desc, subplatform_desc);
> >  
> >  	return 0;
> > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > index 696f997bd2c93..19faddb779808 100644
> > --- a/drivers/gpu/drm/xe/xe_device.c
> > +++ b/drivers/gpu/drm/xe/xe_device.c
> > @@ -364,6 +364,21 @@ static int xe_set_dma_info(struct xe_device *xe)
> >  	return err;
> >  }
> >  
> > +int xe_device_probe_early(struct xe_device *xe)
> > +{
> > +	int err;
> > +
> > +	err = xe_mmio_init(xe);
> > +	if (err)
> > +		return err;
> > +
> > +	xe_mmio_root_tile_init(xe);
> > +
> > +	xe_ttm_sys_mgr_init(xe);
> > +
> 
> Presumably their will be some sort of GuC bring up here during the SRIOV
> flow to get the graphics/media ID? Will that be done in follow on?

SR-IOV flow will detect whether it's PF or VF (using GEN12_VF_CAP_REG
MMIO reg) and if it is a VF - initialize MMIO communication with GuC (as
SR-IOV VF can assume that GuC is already preloaded).
I then expect that the graphics / media ID detection will follow at the
same place as native code (xe_info_init).

> 
> > +	return 0;
> > +}
> > +
> >  int xe_device_probe(struct xe_device *xe)
> >  {
> >  	struct xe_tile *tile;
> > @@ -382,10 +397,6 @@ int xe_device_probe(struct xe_device *xe)
> >  	if (err)
> >  		return err;
> >  
> > -	err = xe_mmio_init(xe);
> > -	if (err)
> > -		return err;
> > -
> >  	xe_mmio_probe_tiles(xe);
> >  
> >  	err = drmm_add_action_or_reset(&xe->drm, xe_driver_flr_fini, xe);
> > @@ -418,8 +429,6 @@ int xe_device_probe(struct xe_device *xe)
> >  	if (err)
> >  		goto err_irq_shutdown;
> >  
> > -	xe_ttm_sys_mgr_init(xe);
> > -
> >  	for_each_tile(tile, xe, id) {
> >  		err = xe_tile_init_noalloc(tile);
> >  		if (err)
> > diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> > index ee89af6b1ea9c..5d7fd16f545c6 100644
> > --- a/drivers/gpu/drm/xe/xe_device.h
> > +++ b/drivers/gpu/drm/xe/xe_device.h
> > @@ -37,6 +37,7 @@ static inline struct xe_device *ttm_to_xe_device(struct ttm_device *ttm)
> >  
> >  struct xe_device *xe_device_create(struct pci_dev *pdev,
> >  				   const struct pci_device_id *ent);
> > +int xe_device_probe_early(struct xe_device *xe);
> >  int xe_device_probe(struct xe_device *xe);
> >  void xe_device_remove(struct xe_device *xe);
> >  
> > @@ -122,6 +123,10 @@ static inline bool xe_device_uc_enabled(struct xe_device *xe)
> >  	for ((id__) = 0; (id__) < (xe__)->info.tile_count; (id__)++) \
> >  		for_each_if((tile__) = &(xe__)->tiles[(id__)])
> >  
> > +#define for_each_remote_tile(tile__, xe__, id__) \
> > +	for ((id__) = 1; (id__) < (xe__)->info.tile_count; (id__)++) \
> > +		for_each_if((tile__) = &(xe__)->tiles[(id__)])
> > +
> >  /*
> >   * FIXME: This only works for now since multi-tile and standalone media
> >   * happen to be mutually exclusive.  Future platforms may change this...
> > diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> > index 8945c601e1c54..526a6ac6be56a 100644
> > --- a/drivers/gpu/drm/xe/xe_mmio.c
> > +++ b/drivers/gpu/drm/xe/xe_mmio.c
> > @@ -15,10 +15,12 @@
> >  #include "regs/xe_regs.h"
> >  #include "xe_bo.h"
> >  #include "xe_device.h"
> > +#include "xe_ggtt.h"
> >  #include "xe_gt.h"
> >  #include "xe_gt_mcr.h"
> >  #include "xe_macros.h"
> >  #include "xe_module.h"
> > +#include "xe_tile.h"
> >  
> >  #define XEHP_MTCFG_ADDR		XE_REG(0x101800)
> >  #define TILE_COUNT		REG_GENMASK(15, 8)
> > @@ -369,10 +371,8 @@ static void mmio_fini(struct drm_device *drm, void *arg)
> >  
> >  int xe_mmio_init(struct xe_device *xe)
> >  {
> > -	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
> >  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> >  	const int mmio_bar = 0;
> > -	int err;
> >  
> >  	/*
> >  	 * Map the entire BAR.
> > @@ -386,15 +386,16 @@ int xe_mmio_init(struct xe_device *xe)
> >  		return -EIO;
> >  	}
> >  
> > -	err = drmm_add_action_or_reset(&xe->drm, mmio_fini, xe);
> > -	if (err)
> > -		return err;
> > +	return drmm_add_action_or_reset(&xe->drm, mmio_fini, xe);
> > +}
> > +
> > +void xe_mmio_root_tile_init(struct xe_device *xe)
> > +{
> > +	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
> >  
> >  	/* Setup first tile; other tiles (if present) will be setup later. */
> > -	root_tile->mmio.size = xe->mmio.size;
> > +	root_tile->mmio.size = SZ_16M;
> 
> This value doesn't change based on platform at all?

No - for all platforms supported by Xe, it's always 16M per-tile,
followed by "extension".

> 
> >  	root_tile->mmio.regs = xe->mmio.regs;
> > -
> > -	return 0;
> >  }
> >  
> >  /**
> > diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
> > index 9f1a25cfd2cf0..894a792ac8abe 100644
> > --- a/drivers/gpu/drm/xe/xe_mmio.h
> > +++ b/drivers/gpu/drm/xe/xe_mmio.h
> > @@ -21,6 +21,7 @@ struct xe_device;
> >  #define GEN12_LMEM_BAR		2
> >  
> >  int xe_mmio_init(struct xe_device *xe);
> > +void xe_mmio_root_tile_init(struct xe_device *xe);
> >  void xe_mmio_probe_tiles(struct xe_device *xe);
> >  
> >  static inline u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg)
> > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > index 87c45c6e08aec..2f04f07dc17a4 100644
> > --- a/drivers/gpu/drm/xe/xe_pci.c
> > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > @@ -532,10 +532,12 @@ static void handle_gmdid(struct xe_device *xe,
> >  	}
> >  }
> >  
> > -static void xe_info_init_early(struct xe_device *xe,
> > -			       const struct xe_device_desc *desc,
> > -			       const struct xe_subplatform_desc *subplatform_desc)
> > +static int xe_info_init_early(struct xe_device *xe,
> > +			      const struct xe_device_desc *desc,
> > +			      const struct xe_subplatform_desc *subplatform_desc)
> >  {
> > +	int err;
> > +
> >  	xe->info.platform = desc->platform;
> >  	xe->info.subplatform = subplatform_desc ?
> >  		subplatform_desc->subplatform : XE_SUBPLATFORM_NONE;
> > @@ -549,6 +551,12 @@ static void xe_info_init_early(struct xe_device *xe,
> >  	xe->info.enable_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
> >  				  enable_display &&
> >  				  desc->has_display;
> > +
> > +	err = xe_tile_init_early(xe_device_get_root_tile(xe), xe, 0);
> > +	if (err)
> > +		return err;
> > +
> > +	return 0;
> >  }
> >  
> >  static int xe_info_init(struct xe_device *xe,
> > @@ -611,13 +619,15 @@ static int xe_info_init(struct xe_device *xe,
> >  	 */
> >  	xe->info.tile_count = 1 + graphics_desc->max_remote_tiles;
> >  
> > -	for_each_tile(tile, xe, id) {
> > +	for_each_remote_tile(tile, xe, id) {
> >  		int err;
> >  
> >  		err = xe_tile_init_early(tile, xe, id);
> >  		if (err)
> >  			return err;
> > +	}
> >  
> > +	for_each_tile(tile, xe, id) {
> >  		gt = tile->primary_gt;
> >  		gt->info.id = xe->info.gt_count++;
> >  		gt->info.type = XE_GT_TYPE_MAIN;
> > @@ -717,7 +727,13 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
> >  	pci_set_master(pdev);
> >  	devm_add_action(&pdev->dev, xe_pci_clear_master, pdev);
> >  
> > -	xe_info_init_early(xe, desc, subplatform_desc);
> > +	err = xe_info_init_early(xe, desc, subplatform_desc);
> > +	if (err)
> > +		return err;
> > +
> > +	err = xe_device_probe_early(xe);
> > +	if (err)
> > +		return err;
> > 
> 
> So this is the point where need the GuC to be up (eventually) so the
> GMD_ID can be read with SRIOV?

Yeah, it's just MMIO communication though.
I initially wanted to load the "hwconfig" GuC for native at this point
as well, so that we have CT communication for root tile GuC available
here, but I ended up moving it to early point in xe_device_probe
(just after all tiles are detected and their resources mapped).

-Michał

> 
> Matt
>  
> >  	err = xe_info_init(xe, desc, subplatform_desc);
> >  	if (err)
> > -- 
> > 2.42.0
> > 
