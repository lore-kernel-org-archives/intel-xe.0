Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7A18C77B61
	for <intel-xe@archiver.kernel.org>; Mon, 10 Apr 2023 17:20:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7E5F10E189;
	Mon, 10 Apr 2023 17:20:18 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43FAE10E189
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Apr 2023 17:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681147217; x=1712683217;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=rIXwuMO/Bm3r8RSkrUkPteWpEY0zVqakc6JPeOMIQME=;
 b=OPbM+DttaVZEPaR819zAWtHnpncv+Gi4gttjXAPC8xNG/RqYuBI5PNU6
 jDQOsADYu4oISxbvTsL06LfFTnpH5e40rlJTlg4RPMDynhrJ6MBsZ6Zwy
 GXoGiVLKW85p+922ng1iqR/RYHV8hN5GXCbToJkNFabNaguLhwaSvWisu
 xeG7OviIG4je0KZtv976mMZKu2uD/P3LHivg7AN98h/LyPAGPYP0LsuKi
 II2PcaYO20FHZPpBjjHZCQ6S5Kqe+CJsVtPR0UVdQjdajlBfIsJzODC1N
 UNGXO4+LAzbQsDneRmFVSTT72prGSyDzdq2goPNyBowMMqUaPEnzTX+Y6 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="346072998"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; d="scan'208";a="346072998"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2023 10:20:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="690859134"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; d="scan'208";a="690859134"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga007.fm.intel.com with ESMTP; 10 Apr 2023 10:20:12 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 10 Apr 2023 10:20:12 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 10 Apr 2023 10:20:12 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.46) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Mon, 10 Apr 2023 10:20:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ili5hNeqG9KzsknfuK3IiKpgr6Zfo0z52ryq3wi4jFbR92hc9kJB/y51u4w7nSA6KPw1fUCH6pTRiVstBMswgSW0mvjstaOrvJ3NTs6ww4RsDT91URpDcSDVdmZKW3D7hlzCB7BSyNcvN/ETOxI8ahw6vGpwZJ8Tt0pm2TwaicrCbQS7HYd94bTP6tBWl8+wRkQ/pHe17Fq9F+fDRLVo8+APJdsL7NKL1zEdr/XZEBcdIQTBaW4GgR4gUxI4+lVaxiVK3PE3T1ppuhXwDlFHbrW0T47FG8wPUoCWEAodSJ9ffn4UJs+1DukdC+HfbZBkcfJpM6ftHa0It3N8Fx6U0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RPf/665hFXSjivw2FG8vkzPfR6TLy9SniAj9UOQT3dg=;
 b=Y0fjr+A2wZBccMkoJbuHQ/GQALDey4Iu5elR1yZqVPA6N6mpyUsqOfJmgW9+HiTugVxQmVNN7XR2Z6Xb/MRI+T0aymDuDwfLVQbqhR9ffqmk/loQe3VvPSvqCNfUkIG/ipIpNQ2Rb0M0OfVGaHwk/RnrPh7O275uYqDstwjdEqaqrn01P0MbylhbUyZ0Yxbd806UGFrOojZ4+OSb6EKh6AFc2ZxLtQchb+LAypl7TL6Wtwwm/pE1S6CTqsTRJ+pZneooM10JajnBd0sl8iSwot/i9YoUpP+d/b9ENmSK3cekDrOMa/VmIea1FukTkKByeQ+xGx+qJbfimGcjdKxryA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA2PR11MB5130.namprd11.prod.outlook.com (2603:10b6:806:11d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Mon, 10 Apr
 2023 17:20:10 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::2b57:646c:1b01:cd18]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::2b57:646c:1b01:cd18%6]) with mapi id 15.20.6277.036; Mon, 10 Apr 2023
 17:20:10 +0000
Date: Mon, 10 Apr 2023 13:20:06 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Souza, Jose" <jose.souza@intel.com>
Message-ID: <ZDRFRruHewZK26MW@intel.com>
References: <20230406143133.29474-1-jose.souza@intel.com>
 <20230406143133.29474-4-jose.souza@intel.com>
 <ZDQteoVKCktzyNus@intel.com>
 <fd512e4feaf3949b2cf5209e741b358159ed7f53.camel@intel.com>
 <ZDQ+VkdmHwcZQL/W@intel.com>
 <e8ab12b22159466ae1fb606ecca2c4e4f02a0e12.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e8ab12b22159466ae1fb606ecca2c4e4f02a0e12.camel@intel.com>
X-ClientProxiedBy: BY5PR04CA0024.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::34) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA2PR11MB5130:EE_
X-MS-Office365-Filtering-Correlation-Id: 2413ad6f-260f-4409-8e88-08db39e7d654
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QoXs52fDPhQK3S3KHqCcSwicydRfrJA7vDR1DVzbUGPhiANfOz19nJPJpbq3WtbyW1Bn62dd4jmzLUxrS0rO6XGxsALOUhRi7auxX2EDgtl8lUq3vesE5oLUxy+I4Rr3pYOChgXqJlvZwZRr40ePpwDCB4eC7Rxnoo/P5cEj/QZKBHImweH025s0VHAdOuyICyPvKQYVpgVaWJnQHd5lW6/TmwHdV+6yVpUCjYlzcwza+sO9WQzfmC6F5QdP/x8wuBz90sPaIY0AGZWmUKJz73F1nPe+OjsBX8PekBA9tlOHjE6na6FXGaAMHyoHCC344Vf/Md/YTb1D1chp6PBFyD25Sk8Sj/0oJmMatWCW1bacyUCn0q4RhxugI8PlkEsC+IgFJQ/ZV320+hIpIcZCAoCSuwn8z8os6NndNdt1f2LrKErr2nD5xDfFKVk/VlPq3WfcXs7LNdK513qnOF/YaYf5TRrC2uUcVm/+dRWGe/ojiznVm1g0Q3sXsZ9ZfLoNxYgHER5IL2ezLBzvLoqahaJjxK0ONd3wb9cV5Te6FT9lraIbMnCg4uu8KNUVTniR
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(136003)(376002)(396003)(346002)(39860400002)(451199021)(478600001)(316002)(6636002)(37006003)(6512007)(26005)(44832011)(6506007)(186003)(6486002)(6666004)(2906002)(5660300002)(4326008)(66946007)(8936002)(8676002)(6862004)(41300700001)(66476007)(66556008)(38100700002)(86362001)(36756003)(83380400001)(82960400001)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?f7FACGdGj8LARgvCDu+oWtQzCrshq2oZwziQgy5dR4KnOSlx2cY+/0egtS?=
 =?iso-8859-1?Q?bZt3+vN0Bw2q5cc4sQ/8MqI6vuntcGduW3e7GdcZwOiwcAAEDCjXIbFRPV?=
 =?iso-8859-1?Q?OAwK3rivZskisKD0avD8flRZKKUggtTxwHd5cEPa5Yt8JKDHXu44aY/nKK?=
 =?iso-8859-1?Q?1OgTpHPysYhpTkycNFeXXM5UFFwy+p0CSCELfZDRJxZB/DxaQXRJHSwRac?=
 =?iso-8859-1?Q?OOIyCZ++Xun1VtqUDZeHsX5k1VDAsqNEPo5tu0IXaRBKkyIDeOCMo6+M0T?=
 =?iso-8859-1?Q?rMRAihVM/7geAskTWZ4WMIt2OO0YnuIhPTTdKhrt0gUkdAwi9BkmgCDlQi?=
 =?iso-8859-1?Q?acXyq5GyD4p4I0MWzI9RkI0UQBgRmS+Yux8d3O8oHNwEwWtBGWRfuGMfX3?=
 =?iso-8859-1?Q?Y+aHomS5C58t/TblQwjZQB74h0Fx1m3k5nc2rK0oZLdaveUCUNVqbWoqCO?=
 =?iso-8859-1?Q?cQVj+cUF7kgCGL8dF0AsZ4BMuLvRASqp3pIFFVJc6qazIW0W1Py5UTOgQS?=
 =?iso-8859-1?Q?LSslmdYDI/0UvA4MkC1DoxoALAuo8Su/g63/9YF+vkRN2AuSho0KC4CwEY?=
 =?iso-8859-1?Q?QfCodmY9UpkpC4VenxQukzOFAomhDxfp9mzcQNN9uSGsHbUv4wXskUwrBi?=
 =?iso-8859-1?Q?S+M3QWfahDXBoJb2yEwmungCb1T6VC8Ii7rpX4igNxTb7sX5KCPQWg7nu+?=
 =?iso-8859-1?Q?W148QUg+Zu4qapP5/mHDHzQJD+QBO0NmfSr0K/66j9bjJh0NoUb7qZvwmO?=
 =?iso-8859-1?Q?KqPXUJwG/7dS8PXeRqAm/3jIPq5ndI8zN+goT2Fqw5quLOJqPePrEIF4/k?=
 =?iso-8859-1?Q?GeZzjNvRjO5JA+GKcwTyJCIHpBZutFyeYwDQEROHhO07rlVEt5u51hMMZ4?=
 =?iso-8859-1?Q?AK9mlEe6afPN53HA2MgXzD+P6Z7rtfHW58aZMVifrtNYGIQhbYMjBcVpQr?=
 =?iso-8859-1?Q?jX+wiGt6yAh0iOB8JLcqckcex1KuEmAe3yAveTZBEbwN3oeCdnk31PSb3X?=
 =?iso-8859-1?Q?0V99p/LaTWdQMyQfLyVgrUpz7Z8iYjSgD/BfDlM0Py+fd322JtGG/vGCSo?=
 =?iso-8859-1?Q?SIAPnFODh9flRbGVwocl0d80KMS1HKBr2sCzRbMa7iOj2doc0i2DJSh1Eo?=
 =?iso-8859-1?Q?qH24tRZGnX4RJ6O3MB/OzYwEV4L3E2X7DxI0/+OXWcw2Wdb8JVzfdj4dc1?=
 =?iso-8859-1?Q?bUrSgLlc+JIYpLPRA8glWD3lpcI4os4jr3FIkejAftUXR/8G8rk/O9r1yE?=
 =?iso-8859-1?Q?iLZV9QMGY5Ljm+YSDJPnFklBjd7MmAvRYozV7iMxrVwlNfLXcPSP5Te2Lb?=
 =?iso-8859-1?Q?7xfv123jKFDEOccvjKBwW/fBjNoRw3M5NNqDuhqWLPs1dwEJ2QxMOhK0x9?=
 =?iso-8859-1?Q?VosvuufsBVlaDZYlS+U04sQ9SiX1zoB/81q+bmJHjqi8G8gB4hIIbC8ffH?=
 =?iso-8859-1?Q?cAIrfd6gsilz2LdKiUjiWZEQFQrkcaazILOLNYqMbjdKDVItOJeip1y6N+?=
 =?iso-8859-1?Q?OmM60VZFUNnCoHOJRIsewz1i4TCttuafel3T+JYenTVBwLnfRCdr2pGuj5?=
 =?iso-8859-1?Q?jhULvGoClorJK0JZtq3te8plRFwSZQWzErdgdKHe+RTGCsiFImjimYbpUk?=
 =?iso-8859-1?Q?2VwjDXcxyPEV2Wu8u/5lLNA3ZBDUvIGZ105LP1VqpoEZPlTeJ4F7+OHw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2413ad6f-260f-4409-8e88-08db39e7d654
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2023 17:20:10.1852 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l00pm6GZV6FIwNtON9hkCY1mE1f2344+XDuiEvxKyiko7dsT1KrPblMeP5h2iQacqsIbkHU42m1HoD85tRrLug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5130
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 rebased 4/6] drm/xe/display: Enable
 modular fia in TGL
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Apr 10, 2023 at 05:15:11PM +0000, Souza, Jose wrote:
> On Mon, 2023-04-10 at 12:50 -0400, Rodrigo Vivi wrote:
> > On Mon, Apr 10, 2023 at 04:24:09PM +0000, Souza, Jose wrote:
> > > On Mon, 2023-04-10 at 11:38 -0400, Rodrigo Vivi wrote:
> > > > On Thu, Apr 06, 2023 at 07:31:31AM -0700, José Roberto de Souza wrote:
> > > > > TGL is the first platform tha has it.
> > > > > Enabling it for DG1 don't cause any issues as DG1 don't have any real
> > > > > TC ports, so intel_tc_port_init() will not be called for DG1.
> > > > 
> > > > so, why do we need to enable then?
> > > 
> > > TGL had it disabled.
> > 
> > so it looks like we need to refactor this info stuff...
> > because looking to the desc it was there on TGL:
> > 
> > .display.has_modular_fia = 1,
> 
> Where?
> I only see it set for adl-P in xe_display.c and on i915_pci.c for tgl, adl-p and mtl.

doh! I looked to the wrong place.
What confused me is that this has_modular_fia doesn't exist anymore on i915.
So we probably need something different here... or backport something that is
already in drm-intel and then a fixup! on top... or something like that...

> 
> 
> > 
> > > This is needed to properly initialize TC in some skus.
> > 
> > This is a key info that was missing in the commit msg, please include it
> > in a next revision. Although I'm now confused with the info set in the
> > descrition and here...
> 
> Will do.
> 
> > 
> > Why is that desc one not working?
> > 
> > > 
> > > > 
> > > > > 
> > > > > Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
> > > > > ---
> > > > >  drivers/gpu/drm/xe/xe_display.c | 5 ++++-
> > > > >  1 file changed, 4 insertions(+), 1 deletion(-)
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
> > > > > index 5fab5b9fbde0c..0001a9d02495d 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_display.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_display.c
> > > > > @@ -486,7 +486,10 @@ void xe_display_info_init(struct xe_device *xe)
> > > > >  	switch (xe->info.platform) {
> > > > >  	case XE_TIGERLAKE:
> > > > >  	case XE_DG1:
> > > > > -		xe->info.display = (struct xe_device_display_info) { GEN12_DISPLAY };
> > > > > +		xe->info.display = (struct xe_device_display_info) {
> > > > > +			GEN12_DISPLAY,
> > > > > +			.has_modular_fia = 1,
> > > > > +		};
> > > > >  		break;
> > > > >  	case XE_ALDERLAKE_S:
> > > > >  		xe->info.display = (struct xe_device_display_info) {
> > > > > -- 
> > > > > 2.40.0
> > > > > 
> > > 
> 
