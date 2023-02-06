Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F659C05027
	for <intel-xe@archiver.kernel.org>; Mon,  6 Feb 2023 22:09:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4113210E448;
	Mon,  6 Feb 2023 22:09:43 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0697710E448
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Feb 2023 22:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675721382; x=1707257382;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=vHfMDLvN0WUAHvFgEASryx4OHt97ezcsCwoFyNVUPrg=;
 b=I+3VCvln6mso1GQNU64wEMmp2yBqGltbYn5jCXzqI3UFtnGT15qsx7WT
 Jl+2NKO4+c26m2fBqp0Qmc6zP51IuKKVgdRHLOHiJ1SkruYG6kTupRVT2
 jj4yzmLRE43RJUU6XL7KV3WakX6Wcgc1OmsxHPBBhKUQMjmpWV+XE3eFB
 q+nzmI18Qs1yuhCvL1AJjpbPISxKDviMcobSNIVGPhLfK2u7/roDdbz4C
 T2sdl1ecXSfR0VSOXHzp+Zbz/3HJWL7v9kvBYxBuvJ7HfzidBBWnUExWA
 uS9tyL0xR4tAjisHTT4eThRt0Lq9cGoIBDJlXu1OZJ9OftgoIwVb4rYAv g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="308973724"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; d="scan'208";a="308973724"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2023 14:09:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="790571466"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; d="scan'208";a="790571466"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga004.jf.intel.com with ESMTP; 06 Feb 2023 14:09:40 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 6 Feb 2023 14:09:40 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Mon, 6 Feb 2023 14:09:40 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Mon, 6 Feb 2023 14:09:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C5Zetw3po7DNB4fwLx/hZaj0kSaTlqqhsyhqToa5r5wvdoUeh1gHvCHRPAzpEXJTwRe4qzJ8t4XSkmv324GA8qLRY+NEC5fTCuVDqBd58D0/w01RhvwDQXlbNUW2nbP5xtgLMiMOQLbakp65gx+drw8Y8DZHvxFZrduTz9QD3k3EbOK0toyVBv5i1hZ8GgoehAcpu3g/mDui+hvjj72OtlFRnTVrPAVnlbXhJJedNqKQmfuT49Dw905z25wiUnsXHuZmnXJ/BIh5/5mg9fKUShnDqBRiFSbqp+q54oVjqb3E1HQC3tLYgh5WH7xid6E+2Q1DN9xglFCDWOXpssjk+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t4paad44WyJ06vIZMUQhl9N4L9b3mML6bDqdjk/ErbI=;
 b=QwOHIGHX1jKUnY5BvXiywEai+ILubBYL2qFxNWq0VPR5Okl3HbyoVw3msd2id126UNap2/0/IZl6qu4vmJELcgeZnhf00zORg95R7tF6v4mjJqPC4PF44rVvef74p2dn4dIV8xpQgsNvALI2VKEZB6eAoOgwZWlJPRGWmwNCWUnPNLjRPGpAb5SjIX1ykA+IvuePfk4lRt47/3MLdT5ypGh1DIfmnil70hhNW17jsTEaNXB+h7cBh13nYP/yVSK3P/pCikfBxCRBRtB6W8kSPULiphtVriYapTZgLP8ZBnbV2tS2u9keJOXsNibvocfUO9LekBylK/Sb0ycrySt0tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SN7PR11MB6603.namprd11.prod.outlook.com (2603:10b6:806:271::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.34; Mon, 6 Feb
 2023 22:09:37 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158%9]) with mapi id 15.20.6064.031; Mon, 6 Feb 2023
 22:09:37 +0000
Date: Mon, 6 Feb 2023 17:09:32 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <Y+F6nOgDgem6DYcR@intel.com>
References: <20230130161723.42602-1-jose.souza@intel.com>
 <Y9f7O86ki5W4Qv1C@mdroper-desk1.amr.corp.intel.com>
 <7c9f39e8eb4ad81926af9b91f45509a5a5a9d347.camel@intel.com>
 <20230130192751.ozgru3btj67iojfa@ldmartin-desk2>
 <12ca0b771f2845509e00a36e6514d456ea39073a.camel@intel.com>
 <Y9rXqCOP+8Y2MC4J@intel.com>
 <2814ffcf60f6be04d450517f16795a86db3c3fa4.camel@intel.com>
 <Y9xD3IlSRBlmgTaA@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y9xD3IlSRBlmgTaA@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: BY5PR17CA0050.namprd17.prod.outlook.com
 (2603:10b6:a03:167::27) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SN7PR11MB6603:EE_
X-MS-Office365-Filtering-Correlation-Id: 86de7e44-dfa6-4f89-4f06-08db088ed628
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +ufcML9uHdVqQ1edct+xCm6hzfTW5dVKRgkwHKwfJKf+u+I3y9N4bXw7Z8RAAIc/kvrCrukrZZmLe1lZ1ViiioffPAiPejxHTcIbAWpSpGG5PR3bbRsmesxuaLm9nyCy7QCFD0BMa0eEDsVvUeO/3DY7UaOYDg167rVqKRgzm0xSPVbBIXwcpEZvifwFLdeBVYMGGiG45wC9NZZqNNA7/jMCwnaN3N6FO1I99Ub3s2Oa1PnHObrbTVoZNncZZtk1B66gmNX7XZoRmpmS3cHpTAdmXicPHNCvWmTven9k46SlENe6QdP9BK/By2YIo2FnK8SXSVh+M7zBZYXkSKm0srsfP/H0p3af4gx+qqM+7NvBVGCBLbetTrMgqd/KgyPy7z4Md9HtLxP4vTw8KBo5eXeK0AbpPobL5+Es2442wIcArRu0/ZLpNDHzi6lw8GO8SAjsLvipDK4H/BEwnX8X4e/n9lCy4kGmfSKKIMyQx0deKW30lOethjo3zodZfVYn2szH+oqTUVALa3NvtRr4D73syxMvlScy42EFbPXqQWYr/fkELbqbfYYhpJXMNQEB5o4AM+ZD4GzOCBGKrbNDqgoQYW/z6W5UQYgULOnnMzg79MBIHXOYifiaO1LQUQv4uvsOVW1E6+rRS6G4pP+7EplyhsI9dgRnq91I2ItSqYl5Mk8G1AiqWd5cpJHhco+A
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(136003)(346002)(366004)(396003)(39860400002)(376002)(451199018)(6666004)(6506007)(2616005)(478600001)(6486002)(186003)(8676002)(6512007)(26005)(4326008)(6636002)(66556008)(316002)(66476007)(66946007)(54906003)(36756003)(37006003)(82960400001)(86362001)(38100700002)(83380400001)(44832011)(5660300002)(41300700001)(6862004)(8936002)(2906002)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?8Cj7S3CPkRWV+7iPC18KeKkxvYs3QBF0VHaebz/8sES7Kii6eVr4qKP0EV?=
 =?iso-8859-1?Q?PlEjGEGzIW2n1+yh+KwGLtzgOeLHnWuoskCmxo1+bj65Hp6A9kHq/EEOSR?=
 =?iso-8859-1?Q?C4dCOfUXyo0oHCnQ80YKWpv0F4s1okDuBcxHUP5eY5UpHlj5jXEqcobnQz?=
 =?iso-8859-1?Q?6Sg9H6yPwYNUwhjiP3j2zG5FLIljwGozj0/ZV2GdHifeXh85BbkHLfWAuq?=
 =?iso-8859-1?Q?52UUtlv6U+8hLQHfts/vnW9qlDHkJAeNXsTiz/8RHDeCwWUxTSgu+DwF4w?=
 =?iso-8859-1?Q?1P5bnhpsu9dHdExhhCKNcflYpvj6G3D2PRHkfUweYKZkHiMjgFGkKCF4AV?=
 =?iso-8859-1?Q?4MBAYPFaix/WTu7NPjVdkxsyubA4t176GJDKcGzkukpdJ9V1bMr37jFx5j?=
 =?iso-8859-1?Q?H5gt/VwNeFbmKpp2tWcO9fGMDAJJcelMfxGnrbc4uGzIx7AWsnFdbnFURE?=
 =?iso-8859-1?Q?8DrCl1mypUSLA0bnJPIZlYrEhnQKAinayojGV7MNBYxOczSNyvghvWdyZA?=
 =?iso-8859-1?Q?/99JafEadJdqN3E0SSnlpv34dUu/cESolZ6loXLvUANyHNyhgV2XYTXL3h?=
 =?iso-8859-1?Q?UuSbvu98Xn1YRdcsBHLU5prOJFs9GzQKOn1lCke6AoznSYSs/RzXYLjGMS?=
 =?iso-8859-1?Q?CSGI3l8DoEjtWYCWYE8FLQ3QukPK+/j3AKUq+MPnkbOofdQMYzwmSa4vFe?=
 =?iso-8859-1?Q?6Ohr82BublHQEKe5GC4GlAa/rXkgqgHgcEbM5CAARzmwz/giovRadPnGQB?=
 =?iso-8859-1?Q?Jw1vXL82UwEvLhxfpoESXckK99RD9/fcFwgncgB3mhxxvevCE62WXh17N/?=
 =?iso-8859-1?Q?+yRP2JqoBKCAXPM6wcAofGXpVE19AcjLKUl/3m11IaKXJ1N3QjtMle+qFb?=
 =?iso-8859-1?Q?0rwDRtGMUMhmlPgGyixbVmQGe56+LuqiyecFJdCe7uJxCLlQ/6odHCmPF0?=
 =?iso-8859-1?Q?hFFaydUxfDqcnv7M+Ew8et7QnFNMkD9TRJW6VigpU9vWvrtTAuuFPQU6rw?=
 =?iso-8859-1?Q?jTMlji2ziA5pErpjRq3lxCUbVwGuJB1qZoHBcGh6kbTxlWT831ZcxUzqwn?=
 =?iso-8859-1?Q?uig/mZwOiiADRKUNTEZzCjszAinYl+cRc+aV4zrx9MUMIIPdLQGc4gr1y7?=
 =?iso-8859-1?Q?HMRcZXUXGOrbxf5N6d3M63R/YUT3btIC2bdEv6sKcaR3CXWVP8E//kIM7X?=
 =?iso-8859-1?Q?v/bAootb2ZwzRWWTLskXskaCMDNCCufEo1WY0MPTATQ8X13F0i7h9+Y355?=
 =?iso-8859-1?Q?Airx22lQj0Eg1HAqVRgT9OdKkx0UE5TidBJqgBKJuez3eDeYdWWSeT0e+a?=
 =?iso-8859-1?Q?KcLL4iDlOEeAoF8dqdFQaF7au64OjOuaDWlNAm5uFUzRUkPpncbhjqhNmW?=
 =?iso-8859-1?Q?Rw8LzyPKFcoAi+9pM3vB3L/Vi7R0Z5BuOE7a+6nuZylp1Vo+amo2h2sn66?=
 =?iso-8859-1?Q?rmlzV9JYH+myTw5+3eCC3ZBofNL8bqzuhAxYOVq4bn9weIgu5uGhaYNFqe?=
 =?iso-8859-1?Q?p2PFRB6bZP1+QS3USOV+n6sn1qKGwrGdNyTObv336iWWNDmtcsdVLBJRIF?=
 =?iso-8859-1?Q?SZHedPSuGHwMytdBsixcvN3sf7RDa8SyN6p/t1u43nRy3YgfGhEtb5gI7r?=
 =?iso-8859-1?Q?Z5lQfbiRSSa7Azr/viNORL3oEo0ys/IMpaR6fxD+DBnarRZhAl6GFGWw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 86de7e44-dfa6-4f89-4f06-08db088ed628
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2023 22:09:37.7382 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uaRxkAyiRumT6XlFICyg1GKBGo4Qcor/gKrQAuDOKNvfxPdkU44Q0AywopRwgkEHpm1Y+yVbw/+Le6GGPMIcjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6603
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2] drm/xe: Add fake workaround to maintain
 backward compatible in MI_BATCH_BUFFER_START
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
Cc: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Feb 02, 2023 at 03:14:36PM -0800, Matt Roper wrote:
> On Thu, Feb 02, 2023 at 02:02:28PM +0000, Souza, Jose wrote:
> > On Wed, 2023-02-01 at 16:20 -0500, Rodrigo Vivi wrote:
> > > On Mon, Jan 30, 2023 at 07:43:58PM +0000, Souza, Jose wrote:
> > > > On Mon, 2023-01-30 at 11:27 -0800, Lucas De Marchi wrote:
> > > > > On Mon, Jan 30, 2023 at 10:04:25AM -0800, Jose Souza wrote:
> > > > > > On Mon, 2023-01-30 at 09:15 -0800, Matt Roper wrote:
> > > > > > > On Mon, Jan 30, 2023 at 08:17:23AM -0800, José Roberto de Souza wrote:
> > > > > > > > i915 has the same fake workaround to return MI_BATCH_BUFFER_START
> > > > > > > > nested batch buffer behavior in DG2 and newer platforms to the same
> > > > > > > > behavior as older platforms.
> > > > > > > > 
> > > > > > > > So here cleaning up TGL_NESTED_BB_EN in MI_MODE to disable third level
> > > > > > > > chained batch buffer level.
> > > > > > > 
> > > > > > > I was kind of assuming we'd just drop this setting for the Xe driver.  I
> > > > > > > believe hardware will be removing the option to turn off nested
> > > > > > > batchbuffers in an upcoming platform, so userspace is going to have to
> > > > > > > adapt to the new behavior soon anyway; doing it while moving to a new
> > > > > > > KMD seems like the easiest time to make that happen since the UMDs are
> > > > > > > already updating their programming models.
> > > > > > 
> > > > > > This would bring even more changes to track when debugging issues in Xe KMD port.
> > > > > > Better do this after Xe KMD is stabilized and with better CI coverage in UMDs and KMDs.
> > > > > 
> > > > > but if we start supporting these platforms with nested bb disabled,
> > > > > we can't change it later. At least not for the older platforms that had
> > > > > it that way.
> > > > 
> > > > Xe KMD will not support by default TGL, DG2... anyways.
> > > > Why have different hardware behavior between KMDs then?
> > > 
> > > For the older platforms we will always be behind the force_probe.
> > > So we will be able to change the uapi behavior later.
> > > 
> > > However, I tend to agree with Matt and Lucas that it would be better
> > > if we align with the future, instead of trying to align with i915
> > > first.
> > > 
> > > But I'd like to hear from Jose, how much of a trouble this is for the
> > > user space? What are the advantages of aligning with i915's current
> > > behavior first and then move later?
> > > 
> > > If you noticed all other uapi, there's not a much of alignment with
> > > i915 anyway. Why should we align on this?
> > 
> > i915 x Xe changes don't affect the files and functions that fill the batch buffers in Mesa.
> > Changing the behavior of MI_BATCH_BUFFER_START would be the first change that actually goes to batch buffers.
> > Minimal batch buffer changes means less surface to debug in issues that only happens with Xe KMD.
> > 
> > That is why I would like to postpone this behavior change to when Xe KMD and UMDs support to it are more stable.
> 
> The other thing to consider here is that the Xe driver will presumably
> be adding SRIOV support soon.  If our behavior differs from the Windows
> driver, then I believe userspace Windows software running in a VF under
> a Linux PF could potentially see unexpected behavior.

hmm good point. Although we are protected by the force_probe and still
not integrated to the tree yet it looks to me that the right thing to do
is to align with the final api as soon as we can.

> 
> 
> Matt
> 
> > 
> > > 
> > > Thanks,
> > > Rodrigo.
> > > 
> > > > 
> > > > > 
> > > > > Lucas De Marchi
> > > > > 
> > > > > > 
> > > > > > > 
> > > > > > > 
> > > > > > > Matt
> > > > > > > 
> > > > > > > > 
> > > > > > > > v2:
> > > > > > > > - replace IP_VERSION_FOREVER by XE_RTP_END_VERSION_UNDEFINED
> > > > > > > > - move fake workaround to lrc_additional_programming table
> > > > > > > > 
> > > > > > > > Bspec: 45974, 45718
> > > > > > > > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > > > > > > > Cc: Matt Roper <matthew.d.roper@intel.com>
> > > > > > > > Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
> > > > > > > > ---
> > > > > > > >  drivers/gpu/drm/xe/xe_gt.c |  1 +
> > > > > > > >  drivers/gpu/drm/xe/xe_wa.c | 28 ++++++++++++++++++++++++++++
> > > > > > > >  drivers/gpu/drm/xe/xe_wa.h |  1 +
> > > > > > > >  3 files changed, 30 insertions(+)
> > > > > > > > 
> > > > > > > > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> > > > > > > > index 84a73eeccd297..5d07e1e7bd506 100644
> > > > > > > > --- a/drivers/gpu/drm/xe/xe_gt.c
> > > > > > > > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > > > > > > > @@ -311,6 +311,7 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt)
> > > > > > > > 
> > > > > > > >  		xe_reg_sr_init(&hwe->reg_lrc, "LRC", xe);
> > > > > > > >  		xe_wa_process_lrc(hwe);
> > > > > > > > +		xe_wa_process_lrc_additional_programming(hwe);
> > > > > > > > 
> > > > > > > >  		default_lrc = drmm_kzalloc(&xe->drm,
> > > > > > > >  					   xe_lrc_size(xe, hwe->class),
> > > > > > > > diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> > > > > > > > index 3325de3edf691..744b7d0982683 100644
> > > > > > > > --- a/drivers/gpu/drm/xe/xe_wa.c
> > > > > > > > +++ b/drivers/gpu/drm/xe/xe_wa.c
> > > > > > > > @@ -288,6 +288,21 @@ static const struct xe_rtp_entry lrc_was[] = {
> > > > > > > >  	{}
> > > > > > > >  };
> > > > > > > > 
> > > > > > > > +static const struct xe_rtp_entry lrc_additional_programming[] = {
> > > > > > > > +	{ XE_RTP_NAME("FakeWaDisableNestedBBMode"),
> > > > > > > > +	  /*
> > > > > > > > +	   * This is a "fake" workaround defined by software to ensure we
> > > > > > > > +	   * maintain reliable, backward-compatible behavior for userspace with
> > > > > > > > +	   * regards to how nested MI_BATCH_BUFFER_START commands are handled.
> > > > > > > > +	   */
> > > > > > > > +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1255, XE_RTP_END_VERSION_UNDEFINED)),
> > > > > > > > +	  XE_RTP_CLR(RING_MI_MODE(0),
> > > > > > > > +		     TGL_NESTED_BB_EN,
> > > > > > > > +		     XE_RTP_FLAG(MASKED_REG, ENGINE_BASE))
> > > > > > > > +	},
> > > > > > > > +	{}
> > > > > > > > +};
> > > > > > > > +
> > > > > > > >  static const struct xe_rtp_entry register_whitelist[] = {
> > > > > > > >  	{ XE_RTP_NAME("WaAllowPMDepthAndInvocationCountAccessFromUMD, 1408556865"),
> > > > > > > >  	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210), ENGINE_CLASS(RENDER)),
> > > > > > > > @@ -362,6 +377,19 @@ void xe_wa_process_lrc(struct xe_hw_engine *hwe)
> > > > > > > >  	xe_rtp_process(lrc_was, &hwe->reg_lrc, hwe->gt, hwe);
> > > > > > > >  }
> > > > > > > > 
> > > > > > > > +/**
> > > > > > > > + * xe_wa_process_lrc_additional_programming - process additional LRC programming
> > > > > > > > + * table
> > > > > > > > + * @hwe: engine instance to process workarounds for
> > > > > > > > + *
> > > > > > > > + * Process additional context programming table for this platform, saving in
> > > > > > > > + * @hwe all the registers changes that need to be applied on context restore.
> > > > > > > > + */
> > > > > > > > +void xe_wa_process_lrc_additional_programming(struct xe_hw_engine *hwe)
> > > > > > > > +{
> > > > > > > > +	xe_rtp_process(lrc_additional_programming, &hwe->reg_lrc, hwe->gt, hwe);
> > > > > > > > +}
> > > > > > > > +
> > > > > > > >  /**
> > > > > > > >   * xe_reg_whitelist_process_engine - process table of registers to whitelist
> > > > > > > >   * @hwe: engine instance to process whitelist for
> > > > > > > > diff --git a/drivers/gpu/drm/xe/xe_wa.h b/drivers/gpu/drm/xe/xe_wa.h
> > > > > > > > index 1a0659690a320..872f3e4ddc73c 100644
> > > > > > > > --- a/drivers/gpu/drm/xe/xe_wa.h
> > > > > > > > +++ b/drivers/gpu/drm/xe/xe_wa.h
> > > > > > > > @@ -12,6 +12,7 @@ struct xe_hw_engine;
> > > > > > > >  void xe_wa_process_gt(struct xe_gt *gt);
> > > > > > > >  void xe_wa_process_engine(struct xe_hw_engine *hwe);
> > > > > > > >  void xe_wa_process_lrc(struct xe_hw_engine *hwe);
> > > > > > > > +void xe_wa_process_lrc_additional_programming(struct xe_hw_engine *hwe);
> > > > > > > > 
> > > > > > > >  void xe_reg_whitelist_process_engine(struct xe_hw_engine *hwe);
> > > > > > > >  void xe_reg_whitelist_apply(struct xe_hw_engine *hwe);
> > > > > > > > --
> > > > > > > > 2.39.1
> > > > > > > > 
> > > > > > > 
> > > > > > 
> > > > 
> > 
> 
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
