Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F6F6EDEC58
	for <intel-xe@archiver.kernel.org>; Wed, 13 Sep 2023 13:56:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 324D910E4C2;
	Wed, 13 Sep 2023 13:56:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44B3310E4C2
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Sep 2023 13:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694613381; x=1726149381;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=dWTM4S+k1FHy4cU4p6iOYBcLyD33vYSPfMijqXhPetQ=;
 b=ZztqcIoHBDXbqszWUIM6RXGh+4lUAp39T5XE1qAVAh8o9YQQR07Gcbzq
 wYl+fdJ6r75z/YWc2TApyoSZX9Igpe59qEsC8+muSCcXrcoIsZ5gimSL4
 EsRCl6KWU2VNyRTGACU6QW4KBsigA/fiMuny7WowXvD1yNactkubNKPrS
 AVZsiQg/+Xw82aDIkBreObLKVVrfzUxf+JBOEN5yXN/UzlgWPJUPjMnm6
 n2vdoqolt5+08vm4E5tQ6TvIKmJu5NzoAQuQhxNQC91Tskwc8ixVIIlNT
 PEvBRVGH8tjpmvd9bG2dK7FN8gFComZdJBe/FKr7z8Sq2qDw5fEGJTB6Y Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="381355941"
X-IronPort-AV: E=Sophos;i="6.02,143,1688454000"; d="scan'208";a="381355941"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2023 06:56:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="917834392"
X-IronPort-AV: E=Sophos;i="6.02,143,1688454000"; d="scan'208";a="917834392"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Sep 2023 06:56:20 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 13 Sep 2023 06:56:19 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 13 Sep 2023 06:56:19 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.103)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 13 Sep 2023 06:56:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VYhJ/QAcJbmUMhOvtK/lD0A5fjctJeWWBgloqGLXGfgiTdD7yDi4Cl602HVG+F6cYawtIZIFMljU/GWZFW6jtSC+BEYt2i3n5zrzElPxIF6OY0ufeyTIpWeP1hqckxGhz/jCj4efuD1Ld+Rygwjysbi71hPM8Keo2+oGkrMVnYKFTEQDzwHnQqkuV/hAZrDzN/jTJRc3cqc1rbCI6ZSWtPCDJjNrt5QT1a5SAjidPgiPktx9CG4eJRVy0ba4N4D+MVKWjFxJGl+cModR7OZr2+yTF57iN71Wxsb6eMU2XPlXB5jW4ZOiu01l8S6GF3DAASVAdfjlkv4C6zyTe3v7vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fLoyBnkjQ0hqGV/bjqZPw2uezuf5fyIMIeheBKIP9Fo=;
 b=BHPXQMtL8JMo+1v1pSLgT7kQnK9YPhCEI+0UFdJQAJTg6ulawSXQZUcV6pABJ6KF1KOCTtT4R0NNhjseDrE/SvqpJCKsFqgm1At8F5zZ0DYWFhc+1xzPMTEKZX6NnZeU5Dm+fki55a1GzAhUPs6lih/es0Z6MtLH2EpJ7Fl8Xq6XFBO2Dba7WhAeWledy/iCMQAgNsCYsQl1iwDY5Ebq+9LeATNJQdzUgu5/NK9DQFqX1IgvYQnpJe7gtXlU+kYGNX9YHW7hcy+7YBYPD8v37wh7krtXt6h6+WEEtwsAfSUhYUdod6mrN+o/9Trn2/fj0O7gEGGkf54nJ+7rrSBaaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by SJ2PR11MB8472.namprd11.prod.outlook.com (2603:10b6:a03:574::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.35; Wed, 13 Sep
 2023 13:56:16 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5772:f514:b746:5723]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5772:f514:b746:5723%5]) with mapi id 15.20.6768.029; Wed, 13 Sep 2023
 13:56:16 +0000
Date: Wed, 13 Sep 2023 15:56:10 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <ZQG_erefoFhzg6sd@fdugast-desk.home>
References: <20230907193515.7-1-francois.dugast@intel.com>
 <ef36eb06-d65b-6ad4-ac4f-f1fb2ba7a544@habana.ai>
 <tl37n5qledvt7yxce5sl4byon6puewxvs3ymfebsndnolwstg3@3fjfvpuzna5b>
 <fede72f2-e542-8308-fcb4-ad37ae058154@habana.ai>
 <20230912002541.GD2706891@mdroper-desk1.amr.corp.intel.com>
 <23515ffe-c397-21a9-94b5-e28f5b26fd64@habana.ai>
 <oglhtekjfa3i2mfbfks4peoc4ap2y4yvflwsf5ri2za2jvrcsy@ttkz4mxz6xwr>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <oglhtekjfa3i2mfbfks4peoc4ap2y4yvflwsf5ri2za2jvrcsy@ttkz4mxz6xwr>
Organization: Intel Corporation
X-ClientProxiedBy: FR2P281CA0110.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::20) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|SJ2PR11MB8472:EE_
X-MS-Office365-Filtering-Correlation-Id: faaa1052-a50b-43b0-b96e-08dbb461330a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cyrjhLgSxYPuaUZs1ljPD0Tq2NDNb6vGCqooh+f7qJdlCgPIy5+baZvwcQMAHaiJqr0/hFJ2sUniCoaohbpdtdaCd0hkVwRK/SzBHAqP9V6Sxndi37BogxWx0MquvzZ5Pdi+5EGxwFoDIghRQ4zqLSkiKcc9wkYEOSvyVeQfcV75LObUnWhm9pheLJ+zOHRcYdEhCm8pt6zQNoZqQMZtxtCnvASvTHk1TtTHe5MQsFs7znW/o38tq06SYjN+oz1ajcHID5ljgnuxZG1SdOK59AeAE+xzZsApF5kvJa4X+PYGM7o6anektZGCITf3Sse4wy5MeQBXmSopAoO0U0zq74U0SeqIZ+0A/xT7hvXmq5Up29qem86gNpZm6Z1T+7FgxNS9oJY1M5JcnRgPiX5HN3yvMfIWAhZl73WhmyRVgN5NMb1A5Ftk1YCuzW1eg0Oo1Spb6qHhkGvlevHceBKkc/za/lNu8gzuyV/rdm91s7w9p0S1sPY6F4D1BHUa1DwQ7tz6n47rX2/uPZXnOYO/Yv5co4PBwpRJme0sKbxafpnVXmQcgdGInBxH3buBNDMXd8aXEiSEu2WxURK4EwVnfA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(136003)(346002)(39860400002)(376002)(451199024)(186009)(1800799009)(66556008)(36916002)(53546011)(66946007)(4326008)(6862004)(8676002)(66476007)(8936002)(82960400001)(478600001)(6636002)(6486002)(316002)(54906003)(6512007)(9686003)(6506007)(41300700001)(26005)(83380400001)(44832011)(5660300002)(6666004)(966005)(30864003)(2906002)(86362001)(36756003)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?W0FD1W5ciCHs0M6CyjO7BzJ3RlJCRzX5oABKDR4Sd4lZLFzKu+R4TkZGtETu?=
 =?us-ascii?Q?mIfqtpxManT2ptfp4GZWFZjirUg70ubgMC5S7Dd7C9YCDHrsPqZRR5mt5Da4?=
 =?us-ascii?Q?aIcEwArFjSvG3t4aeucuF6tnx/VZMUljZFHr8kdkjhL2iL5ZR12QhCTHjHlO?=
 =?us-ascii?Q?8+QBd8LwnjUOyEUWpDdyCpau2XgArYJTg9riQoS+1LikcqgMRqoVL8iJ11Hb?=
 =?us-ascii?Q?Clz7j4XGTs5ew2pkfr7WmwKtZG4w2heFDXnYYp6gqoaj78ICa9TLp/RtZWFv?=
 =?us-ascii?Q?kUdtz+Pw2SnD0ARI3qqN4Rw1kSEymUHZ86pFqAiYAy4W97mCqXJu5bwP49E+?=
 =?us-ascii?Q?d8E2V3WyRGbwexKQLUWnFvj6Ym4JJ3U5ZqbbvUZjAHrpaDyVlOn2XTbDxxsZ?=
 =?us-ascii?Q?G6Ttyk0dDqeT00z7jd+Ie/55FV+RsYTcoG9QS7cvfVB8m1Qgek3X5yNjp09X?=
 =?us-ascii?Q?jylKsUOhuHr7AHAmum59lFdJM2x4NViX/pV7G6vsniWH9iKmcLwodYXJlvjl?=
 =?us-ascii?Q?mAzyH45SF+4tTvau3bK/UpsLnrg9tY+zvSHdOdS2GWt7SIMBcVJfxK+tOxUU?=
 =?us-ascii?Q?l784iWFk+qT7UwD0u5yzBkg2rM4HA65KUM3l2rXdvijCljnoz9JdrmKD7CYg?=
 =?us-ascii?Q?5mVyqDUdyJzi877HB+N99Z1G/uMEpLUALbypejnCH+wwW0yVKkMLd1XkXDYR?=
 =?us-ascii?Q?paQ8XBqqw6+KoLVrP2yTdT2qvuqBbcF4SQVrKKL4V8kkVi+mBe+EFy5rf9Xp?=
 =?us-ascii?Q?hCDIBLHGGC5TFX01bWtoqRwo7F6LtP7aGscADTdjSO8rKgBxcNOH/YivQb00?=
 =?us-ascii?Q?SKirQprateCUPSgjwEmmwVA86/mcLZPru6BrkdHvBA0pKbxd3P4e2SL6Ut4f?=
 =?us-ascii?Q?xlQPMajo69OStxMFSCQGm1kCoIZ9UcmsARFxYazPVOvMYs6mVpAXvIb7/y57?=
 =?us-ascii?Q?2a3J9s07nM9uCPJTNX5pqW3PmZc4A4fJb6gyv/Ys+Ym6q+kpfpZ3Y79yQe/O?=
 =?us-ascii?Q?fbJBtgRy/yRIVC/uqXDknInBK7IrPOAJd6bvOmS2s08px09Hvcc6qZDU5sKm?=
 =?us-ascii?Q?GJeuLfmxP4d/E4FEP9p33DoWENfdFeqzTueKZRhvv+bzdty51mhwAALybks+?=
 =?us-ascii?Q?+/G/RfqmyZ4T1DuPKIzePMgqYiFEHoSScHFLdrEVL1+LbVAZez/TmEyy+KBh?=
 =?us-ascii?Q?ujGfUzZseG+38zO81QIa7IVPTiesi71YAvqvh8Zk2zFd3UC6dPcGgzfjCgnm?=
 =?us-ascii?Q?kvRYupIn37bPlnb5+oHBvnTxBjoRwvpoHowZDKXbAod+SvT7iidQBVa61Wls?=
 =?us-ascii?Q?Djq6ToxfMkllw6u4B5QFYDdzfG8m1ScOJu/XgoU/OeD+Z9cxOSQ/u33pJFhd?=
 =?us-ascii?Q?s1XnhWJehBvCBM0EjIjuHT5mbzBJIYuYql8CigSaXGzPlVvoSEi7s2CrbDrc?=
 =?us-ascii?Q?tFI7RgC/hi4v6S0dld5hNhCtDLm7OyWzCeiLpCRsx8LWQrO0zHOBSKmjNzdk?=
 =?us-ascii?Q?vXGzjVeGI1phz/U4bELBqFDUw8FjcwW6z5C31ESYb4iTk5cpmvrwxWDAdlcq?=
 =?us-ascii?Q?j0XOIN8trzeveaKGacCkBgsbu9M0sHrjtaIVUwgje0MNI4BbrnhoTQuzXaSM?=
 =?us-ascii?Q?nw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: faaa1052-a50b-43b0-b96e-08dbb461330a
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2023 13:56:16.6223 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pdEwUZXEvpSARGoz2U7/DeNxsyy9G+U5a3pRjmJ2nkMtec5Fa9xvRO4LxBoMGfhMZFPGRAfQ1ja71Erw0NV9Fc4TX5BI7savhOwfylv0L0s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8472
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/uapi: Remove MMIO ioctl
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
Cc: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Sep 12, 2023 at 09:42:41AM -0500, Lucas De Marchi wrote:
> On Tue, Sep 12, 2023 at 03:43:06AM -0500, Ofir Bitton wrote:
> > On 12/09/2023 3:25, Matt Roper wrote:
> > > On Mon, Sep 11, 2023 at 04:21:37AM +0000, Ofir Bitton wrote:
> > > > On 11/09/2023 6:45, Lucas De Marchi wrote:
> > > > > On Sun, Sep 10, 2023 at 04:34:24PM +0000, Ofir Bitton wrote:
> > > > > > On 07/09/2023 22:35, Francois Dugast wrote:
> > > > > > > This was previously used in UMD for timestamp correlation, which can now
> > > > > > > be done with DRM_XE_QUERY_CS_CYCLES.
> > > > > > > 
> > > > > > > Link:
> > > > > > > https://lore.kernel.org/all/20230706042044.GR6953@mdroper-desk1.amr.corp.intel.com/
> > > > > > > Closes:
> > > > > > > https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/636
> > > > > > > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > > > > > > ---
> > > > > > >    drivers/gpu/drm/xe/xe_device.c |   1 -
> > > > > > >    drivers/gpu/drm/xe/xe_mmio.c   | 102 ---------------------------------
> > > > > > >    include/uapi/drm/xe_drm.h      |  31 ++--------
> > > > > > >    3 files changed, 4 insertions(+), 130 deletions(-)
> > > > > > > 
> > > > > > > diff --git a/drivers/gpu/drm/xe/xe_device.c
> > > > > > > b/drivers/gpu/drm/xe/xe_device.c
> > > > > > > index 109aeb25d19c..10fa1b55578a 100644
> > > > > > > --- a/drivers/gpu/drm/xe/xe_device.c
> > > > > > > +++ b/drivers/gpu/drm/xe/xe_device.c
> > > > > > > @@ -107,7 +107,6 @@ static const struct drm_ioctl_desc xe_ioctls[] = {
> > > > > > >        DRM_IOCTL_DEF_DRV(XE_EXEC_QUEUE_DESTROY,
> > > > > > > xe_exec_queue_destroy_ioctl,
> > > > > > >                  DRM_RENDER_ALLOW),
> > > > > > >        DRM_IOCTL_DEF_DRV(XE_EXEC, xe_exec_ioctl, DRM_RENDER_ALLOW),
> > > > > > > -    DRM_IOCTL_DEF_DRV(XE_MMIO, xe_mmio_ioctl, DRM_RENDER_ALLOW),
> > > > > > >        DRM_IOCTL_DEF_DRV(XE_EXEC_QUEUE_SET_PROPERTY,
> > > > > > > xe_exec_queue_set_property_ioctl,
> > > > > > >                  DRM_RENDER_ALLOW),
> > > > > > >        DRM_IOCTL_DEF_DRV(XE_WAIT_USER_FENCE, xe_wait_user_fence_ioctl,
> > > > > > > diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> > > > > > > index 3ccc0af4430b..e636e3f3456d 100644
> > > > > > > --- a/drivers/gpu/drm/xe/xe_mmio.c
> > > > > > > +++ b/drivers/gpu/drm/xe/xe_mmio.c
> > > > > > > @@ -422,108 +422,6 @@ int xe_mmio_init(struct xe_device *xe)
> > > > > > >        return 0;
> > > > > > >    }
> > > > > > > 
> > > > > > > -#define VALID_MMIO_FLAGS (\
> > > > > > > -    DRM_XE_MMIO_BITS_MASK |\
> > > > > > > -    DRM_XE_MMIO_READ |\
> > > > > > > -    DRM_XE_MMIO_WRITE)
> > > > > > > -
> > > > > > > -static const struct xe_reg mmio_read_whitelist[] = {
> > > > > > > -    RING_TIMESTAMP(RENDER_RING_BASE),
> > > > > > > -};
> > > > > > > -
> > > > > > > -int xe_mmio_ioctl(struct drm_device *dev, void *data,
> > > > > > > -          struct drm_file *file)
> > > > > > > -{
> > > > > > > -    struct xe_device *xe = to_xe_device(dev);
> > > > > > > -    struct xe_gt *gt = xe_root_mmio_gt(xe);
> > > > > > > -    struct drm_xe_mmio *args = data;
> > > > > > > -    unsigned int bits_flag, bytes;
> > > > > > > -    struct xe_reg reg;
> > > > > > > -    bool allowed;
> > > > > > > -    int ret = 0;
> > > > > > > -
> > > > > > > -    if (XE_IOCTL_DBG(xe, args->extensions) ||
> > > > > > > -        XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
> > > > > > > -        return -EINVAL;
> > > > > > > -
> > > > > > > -    if (XE_IOCTL_DBG(xe, args->flags & ~VALID_MMIO_FLAGS))
> > > > > > > -        return -EINVAL;
> > > > > > > -
> > > > > > > -    if (XE_IOCTL_DBG(xe, !(args->flags & DRM_XE_MMIO_WRITE) &&
> > > > > > > args->value))
> > > > > > > -        return -EINVAL;
> > > > > > > -
> > > > > > > -    allowed = capable(CAP_SYS_ADMIN);
> > > > > > > -    if (!allowed && ((args->flags & ~DRM_XE_MMIO_BITS_MASK) ==
> > > > > > > DRM_XE_MMIO_READ)) {
> > > > > > > -        unsigned int i;
> > > > > > > -
> > > > > > > -        for (i = 0; i < ARRAY_SIZE(mmio_read_whitelist); i++) {
> > > > > > > -            if (mmio_read_whitelist[i].addr == args->addr) {
> > > > > > > -                allowed = true;
> > > > > > > -                break;
> > > > > > > -            }
> > > > > > > -        }
> > > > > > > -    }
> > > > > > > -
> > > > > > > -    if (XE_IOCTL_DBG(xe, !allowed))
> > > > > > > -        return -EPERM;
> > > > > > > -
> > > > > > > -    bits_flag = args->flags & DRM_XE_MMIO_BITS_MASK;
> > > > > > > -    bytes = 1 << bits_flag;
> > > > > > > -    if (XE_IOCTL_DBG(xe, args->addr + bytes > xe->mmio.size))
> > > > > > > -        return -EINVAL;
> > > > > > > -
> > > > > > > -    /*
> > > > > > > -     * TODO: migrate to xe_gt_mcr to lookup the mmio range and handle
> > > > > > > -     * multicast registers. Steering would need uapi extension.
> > > > > > > -     */
> > > > > > > -    reg = XE_REG(args->addr);
> > > > > > > -
> > > > > > > -    xe_device_mem_access_get(xe);
> > > > > > > -    xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> > > > > > > -
> > > > > > > -    if (args->flags & DRM_XE_MMIO_WRITE) {
> > > > > > > -        switch (bits_flag) {
> > > > > > > -        case DRM_XE_MMIO_32BIT:
> > > > > > > -            if (XE_IOCTL_DBG(xe, args->value > U32_MAX)) {
> > > > > > > -                ret = -EINVAL;
> > > > > > > -                goto exit;
> > > > > > > -            }
> > > > > > > -            xe_mmio_write32(gt, reg, args->value);
> > > > > > > -            break;
> > > > > > > -        default:
> > > > > > > -            drm_dbg(&xe->drm, "Invalid MMIO bit size");
> > > > > > > -            fallthrough;
> > > > > > > -        case DRM_XE_MMIO_8BIT: /* TODO */
> > > > > > > -        case DRM_XE_MMIO_16BIT: /* TODO */
> > > > > > > -            ret = -EOPNOTSUPP;
> > > > > > > -            goto exit;
> > > > > > > -        }
> > > > > > > -    }
> > > > > > > -
> > > > > > > -    if (args->flags & DRM_XE_MMIO_READ) {
> > > > > > > -        switch (bits_flag) {
> > > > > > > -        case DRM_XE_MMIO_32BIT:
> > > > > > > -            args->value = xe_mmio_read32(gt, reg);
> > > > > > > -            break;
> > > > > > > -        case DRM_XE_MMIO_64BIT:
> > > > > > > -            args->value = xe_mmio_read64_2x32(gt, reg);
> > > > > > > -            break;
> > > > > > > -        default:
> > > > > > > -            drm_dbg(&xe->drm, "Invalid MMIO bit size");
> > > > > > > -            fallthrough;
> > > > > > > -        case DRM_XE_MMIO_8BIT: /* TODO */
> > > > > > > -        case DRM_XE_MMIO_16BIT: /* TODO */
> > > > > > > -            ret = -EOPNOTSUPP;
> > > > > > > -        }
> > > > > > > -    }
> > > > > > > -
> > > > > > > -exit:
> > > > > > > -    xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> > > > > > > -    xe_device_mem_access_put(xe);
> > > > > > > -
> > > > > > > -    return ret;
> > > > > > > -}
> > > > > > > -
> > > > > > >    /**
> > > > > > >     * xe_mmio_read64_2x32() - Read a 64-bit register as two 32-bit reads
> > > > > > >     * @gt: MMIO target GT
> > > > > > > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > > > > > > index 86f16d50e9cc..6c6d1cfa415a 100644
> > > > > > > --- a/include/uapi/drm/xe_drm.h
> > > > > > > +++ b/include/uapi/drm/xe_drm.h
> > > > > > > @@ -106,11 +106,10 @@ struct xe_user_extension {
> > > > > > >    #define DRM_XE_EXEC_QUEUE_CREATE        0x06
> > > > > > >    #define DRM_XE_EXEC_QUEUE_DESTROY        0x07
> > > > > > >    #define DRM_XE_EXEC            0x08
> > > > > > > -#define DRM_XE_MMIO            0x09
> > > > > > > -#define DRM_XE_EXEC_QUEUE_SET_PROPERTY    0x0a
> > > > > > > -#define DRM_XE_WAIT_USER_FENCE        0x0b
> > > > > > > -#define DRM_XE_VM_MADVISE        0x0c
> > > > > > > -#define DRM_XE_EXEC_QUEUE_GET_PROPERTY    0x0d
> > > > > > > +#define DRM_XE_EXEC_QUEUE_SET_PROPERTY    0x09
> > > > > > > +#define DRM_XE_WAIT_USER_FENCE        0x0a
> > > > > > > +#define DRM_XE_VM_MADVISE        0x0b
> > > > > > > +#define DRM_XE_EXEC_QUEUE_GET_PROPERTY    0x0c
> > > > > > > 
> > > > > > >    /* Must be kept compact -- no holes */
> > > > > > >    #define DRM_IOCTL_XE_DEVICE_QUERY        DRM_IOWR(DRM_COMMAND_BASE
> > > > > > > + DRM_XE_DEVICE_QUERY, struct drm_xe_device_query)
> > > > > > > @@ -123,7 +122,6 @@ struct xe_user_extension {
> > > > > > >    #define DRM_IOCTL_XE_EXEC_QUEUE_GET_PROPERTY
> > > > > > > DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_GET_PROPERTY, struct
> > > > > > > drm_xe_exec_queue_get_property)
> > > > > > >    #define DRM_IOCTL_XE_EXEC_QUEUE_DESTROY
> > > > > > > DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_DESTROY, struct
> > > > > > > drm_xe_exec_queue_destroy)
> > > > > > >    #define DRM_IOCTL_XE_EXEC             DRM_IOW(DRM_COMMAND_BASE +
> > > > > > > DRM_XE_EXEC, struct drm_xe_exec)
> > > > > > > -#define DRM_IOCTL_XE_MMIO            DRM_IOWR(DRM_COMMAND_BASE +
> > > > > > > DRM_XE_MMIO, struct drm_xe_mmio)
> > > > > > >    #define DRM_IOCTL_XE_EXEC_QUEUE_SET_PROPERTY
> > > > > > > DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_SET_PROPERTY, struct
> > > > > > > drm_xe_exec_queue_set_property)
> > > > > > >    #define DRM_IOCTL_XE_WAIT_USER_FENCE
> > > > > > > DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct
> > > > > > > drm_xe_wait_user_fence)
> > > > > > >    #define DRM_IOCTL_XE_VM_MADVISE
> > > > > > > DRM_IOW(DRM_COMMAND_BASE + DRM_XE_VM_MADVISE, struct drm_xe_vm_madvise)
> > > > > > > @@ -883,27 +881,6 @@ struct drm_xe_exec {
> > > > > > >        __u64 reserved[2];
> > > > > > >    };
> > > > > > > 
> > > > > > > -struct drm_xe_mmio {
> > > > > > > -    /** @extensions: Pointer to the first extension struct, if any */
> > > > > > > -    __u64 extensions;
> > > > > > > -
> > > > > > > -    __u32 addr;
> > > > > > > -
> > > > > > > -#define DRM_XE_MMIO_8BIT    0x0
> > > > > > > -#define DRM_XE_MMIO_16BIT    0x1
> > > > > > > -#define DRM_XE_MMIO_32BIT    0x2
> > > > > > > -#define DRM_XE_MMIO_64BIT    0x3
> > > > > > > -#define DRM_XE_MMIO_BITS_MASK    0x3
> > > > > > > -#define DRM_XE_MMIO_READ    0x4
> > > > > > > -#define DRM_XE_MMIO_WRITE    0x8
> > > > > > > -    __u32 flags;
> > > > > > > -
> > > > > > > -    __u64 value;
> > > > > > > -
> > > > > > > -    /** @reserved: Reserved */
> > > > > > > -    __u64 reserved[2];
> > > > > > > -};
> > > > > > > -
> > > > > > >    /**
> > > > > > >     * struct drm_xe_wait_user_fence - wait user fence
> > > > > > >     *
> > > > > > 
> > > > > > I would prefer to keep this ioctl for debug, or an equivavlent
> > > > > > alternative. We can remove the timestmap part but keep the general mmio
> > > > > > ioctl interface for 'CAP_SYS_ADMIN' access only.
> > > > > > Any objections?
> > > 
> > > Well, one general roadblock is that the DRM subsystem rules don't allow
> > > adding ABI without a real, open-source userspace consumer.  Not only do
> > > we not have a "real" consumer for this ioctl itself, but we also don't
> > > even want to give anyone the impression that we have a backdoor
> > > interface to allow non-opensource userspace to go behind the driver's
> > > back and start controlling the hardware.  Userspace can still obviously
> > > do that by running as root and mapping the BAR directly, but they're not
> > > using official driver uapi at that point, and there are potentially
> > > other ways that a sysadmin can close those holes if necessary.
> > 
> > Hey Matt, I totally undesrstand your concern, I might have another
> > suggestion. We can create another FD in debugfs and move this ioctl
> > there (I can take ownership on this), This way ABI is not an issue.
> 
> an interface in debugfs would be better than keeping the ioctl.
> We seem to have some consensus now to go ahead and remove this.
> 
> 	Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
> 
> Please record the Acked-by from UMD when you get them and before
> merging.  And we will also need to change IGT ahead of merging this.

Sure, do we rely on intel_reg only or do we also keep xe_reg?

Francois

> 
> 
> thanks
> Lucas De Marchi
> 
> 
> > 
> > > 
> > > > > 
> > > > > CAP_SYS_ADMIN can already map the bar and do the reads and
> > > > > writes. What's the benefit of going through the kernel?
> > > > > 
> > > > > Lucas De Marchi
> > > > > 
> > > > > > 
> > > > > > Ofir
> > > > 
> > > > Some register read/write requires driver involvement, for example
> > > > disabling clock gating or going through a register gateway.
> > > > In addition, if a user would like to access directly through the bar he
> > > > will need to be aware of the exact bar mapping. It is preferable that
> > > > the user will be able to ask for read/write from/to a specific MMIO
> > > > address and the driver will map it to the proper offset in bar.
> > > 
> > > Are you using the term "user" to describe the userspace _software_ or
> > > the person sitting at the computer?  If the latter, then we don't need
> > > this ioctl at all; the "intel_reg" tool from IGT has provided this kind
> > > of functionality on i915 for years; it's a simple command-line tool that
> > > can be used with commands like:
> > > 
> > >          intel_reg read 0x1234
> > >          intel_reg write 0x5678 0xabcd
> > > 
> > > The tool uses libpciaccess under the hood to map the BAR, and can
> > > perform other necessary pre/post operations (like grabbing releasing
> > > forcewake to make sure the register is accessible).
> > 
> > By 'user' I do mean userspace process. Intel_reg tool can work but it
> > has its own limitations.
> > 
> > > 
> > > If you're using "user" to refer to the userspace _software_ (e.g., IGT's
> > > xe_reg debug tool which is using the ioctl right now), then there's even
> > > more incentive to move away from the ioctl --- the ioctl interface we
> > > have today already has a bunch of limitations that make it less useful
> > > than it should be for debugging:
> > > 
> > >   * There's no way to specify/access registers on non-tile0.
> > 
> > I am aware, I will add support for multi-tile devices.
> > 
> > >   * There's no way to specify that you do/don't want it to do the "extra"
> > >     steps like you describe (e.g., automatically grabbing forcewake is
> > >     convenient a lot of the time, but if you're actually trying to debug
> > >     forcewake itself, then the ioctl's automatic behavior just gets in
> > >     your way).
> > > 
> > 
> > Understood, for these kind of debugs the mmio ioctl is irrelevant.
> > 
> > > While the ioctl could theoretically be extended to overcome these
> > > limitations, we still shouldn't really be building up ABI like that for
> > > debug purposes without real userspace consumers, especially if we have a
> > > viable alternative that's been used for a long time.  It's relatively
> > > simple for tools like intel_reg and xe_reg to just use libpciaccess to
> > > map the BAR, figure out the appropriate offset, and then optionally
> > > perform other operations (like forcewake) according to whatever options
> > > were passed on the command line.  With debug tools it's especially
> > > likely that we'll come up with new behaviors that we want to add (e.g.,
> > > handle display register accesses via msgbus transactions on MTL/LNL?)
> > > and it would be better if we didn't need to keep extending the ioctl
> > > uapi and ABI for these debug-only purposes).
> > 
> > I agree we need an interface that will not be obligated to any ABI as
> > this is for pure debug, so we are left with 2 options:
> > 1. My suggestion to create a debugfs FD and use the ioctl there.
> > 2. Move code to innersource
> > 
> > I prefer option #1 as the latter will not be available for customers who
> > uses the opensource driver.
> > 
> > Ofir.
> > 
> > > 
> > > 
> > > Matt
> > > 
> > 
