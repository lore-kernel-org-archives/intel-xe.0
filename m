Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D6DFC47DD3
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jan 2024 20:40:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7BAA10ECEC;
	Mon, 22 Jan 2024 20:40:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B3EF10ECEC
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Jan 2024 20:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705956027; x=1737492027;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=rsjtuCBCteo7e7EW27klfTyEeg5iWQi5p+EdzpZ+O7U=;
 b=mftB4HR9NrJeBpepJKFwLoh3OcTWc1dhilSkHOKgQyh2bmsXQEoVLcat
 UuH3DG4F4aI2PF4QqKUsivKHf/TB8rNzHFpWJwwMoskRXWnTehcOHdjX+
 yDqlyduxiVCIPaDm9Hr1jIwBAO4EnoPJdvWTH2J5enyJXXiMuZ++FVW7/
 EE9+np6oZl0+Ggwvvahnj+ytSMksygA7SCEtR6TQb438xIe6FZcp9S/jg
 g91DOZjBxZtcJWLcVz4FO3t1YRIDgJ3+QWIdcKal8V8MdO5fBQPMF4pMB
 A9NdB1DG9zDFAU7pMuNcTRRhvhcDouBU8lkqWIJLqaAb/UIgH8+BmkU5P Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="8719439"
X-IronPort-AV: E=Sophos;i="6.05,212,1701158400"; 
   d="scan'208";a="8719439"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 12:40:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="929098830"
X-IronPort-AV: E=Sophos;i="6.05,212,1701158400"; d="scan'208";a="929098830"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Jan 2024 12:40:26 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Jan 2024 12:40:25 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Jan 2024 12:40:24 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 22 Jan 2024 12:40:24 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 22 Jan 2024 12:40:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zl3QRj0qoJ0ggss42m0tmldKxWuOhvV9WwE7JK4y6uzN0EPvRyGZyaFaudfETIEawEvIkqmiUEoSniDEPHcqICHW6anhf7sW8+4Gz/1Oeb0pCVmiduuM7dk2XFwhtEctJTa99SKAN3rM1irLqW6Vnxi5rpO38tiPWzlMDKO3s64kP5lg8Z0xy71TdFamupzMupQ/CtiVB8B2Odmjzy7nKYIeQaqWW9OhI7lPQUW279jVewHFqsazz7WhHKrL3jgNaw9co9qiSACOtn2+/JT8wKgBu9qAjmZi4tlPsroPfMKlGiIlF0agnQTyOaOJtaAvRADrXqYFUZricXAHfZSZyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3UQ3/jQRUFPYUFjy82bLRC1cqn9/+3uuLmmNTRqQZuQ=;
 b=DUuMOKNRRFqPhJeIQXKvtetCRaVqLrJsyTDrNkB8t4Zv08TaP0nD+MOV28SP0Xyw/AtWTwwy2naPWRt+p8UT505xY0rqA0Ps94OarTnyIg1S77QGZSqMFmj1OMDQlxztqZ6G2MTQ4Bs+dOD35JySOh1a6+CLn1D85iV7V3WekghhAKeupvo9w5fY9QiDvze6+LQqUFI+aAV6k8mbQJO9lKAgtqorsQiJp+oHUgW5XrLpxh3r7rnQ8pZm1Oci9RqB6NzIBERuwc7IZb8exKUnS0cR/EZz6dkGHbS7Q3xz/th4rwqXdTpac7hsFmPtky0DRyBTVE0bYgR74OrGEX6p3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM4PR11MB7374.namprd11.prod.outlook.com (2603:10b6:8:102::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.32; Mon, 22 Jan
 2024 20:40:22 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7202.031; Mon, 22 Jan 2024
 20:40:22 +0000
Date: Mon, 22 Jan 2024 15:40:18 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Souza, Jose" <jose.souza@intel.com>
Subject: Re: [PATCH 5/9] drm/xe: Nuke xe from xe_devcoredump
Message-ID: <Za7SskbqwItP8qRf@intel.com>
References: <20240122170445.108856-1-jose.souza@intel.com>
 <20240122170445.108856-5-jose.souza@intel.com>
 <Za7MCPKPvfndug9K@intel.com>
 <38dfe3b065dc97df697ac5fb7bf51895ba503abc.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <38dfe3b065dc97df697ac5fb7bf51895ba503abc.camel@intel.com>
X-ClientProxiedBy: BYAPR08CA0063.namprd08.prod.outlook.com
 (2603:10b6:a03:117::40) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DM4PR11MB7374:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a0c0a96-77bf-4074-9ec4-08dc1b8a5aa8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6MwusXeH51KsPrvPLBBpu6kidEeciRrj8XHjphOGgw+A8xbakEC45IHJVuR4izG5++C4YU1d8KXS0mA555xKdNhlCkL6TUiUpzaaM1B0WTsiioxkBvhDkGZFMh6QPINkV/Vz/2zYa/drwdvD7dzzyf3ZLrSWNv4oSKfrgwiN3HHpQ9737BA7A9cm+7KOY/N74PBw5fhPhs3D7Pm2ditKM+nqbFjloOAElO8whsSmu6NQb17k7T9lwEu/1yJNc/sBQMghW7fzUNqoFghAtFMRDBhzaisZ5nf+q1wibwf3wlKJKyLyZkE12FxiBiDFyaHGQAPvrEeVbxUO0eWjdbFczdRRmk5L/fUBsCcE32CidWgpH2DgA/0g7ABOB7tYjYjKG8BbIlCjWc4EtwoZXGqHp6BCMpbJV/746QfxA10e6Zu2cgKPnPgt2UitTkvkC5J+Q9++L9DNIKAaPQKaVW8DMvpTzZ2jAsY81HqCi2LUREw0zAxtIYv5ZnD5fzN0cHROEShps1/btby2oFN0ZhIQhny9OTvpDOpfPaU/hFdQFgIw/tHdk25Hl3BXfF+oD8mc
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(396003)(136003)(346002)(366004)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(6512007)(38100700002)(6666004)(6862004)(8676002)(6506007)(86362001)(8936002)(44832011)(5660300002)(6636002)(66476007)(2906002)(316002)(82960400001)(37006003)(54906003)(41300700001)(66946007)(36756003)(66556008)(4326008)(6486002)(478600001)(26005)(83380400001)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?EDeI0zboaC6sOvNSWIkbl/LQHnpySC926ZQlDdzGtQ4GNd/23FHMqkHoBl?=
 =?iso-8859-1?Q?IJ7+S8MJ5kMn90gXKYjs3ueYynpWqkGkp2M4qeu6sJJF22VWETjTh4PwQu?=
 =?iso-8859-1?Q?0KzBgvEMUIMXVYe07cXi5YvvVWgTp/33bUyyHzNDECvfT0V0bbdxNYSEvd?=
 =?iso-8859-1?Q?UCO+W9OEvOYL14BMFi2ymTxlWyVw+Rz/y9eBEzbIbYrGNn+R4Q4FRrQ+ig?=
 =?iso-8859-1?Q?jF6dybOxDxREXxBQIRvixDxophlYyXktwvzM1MWAwsr/ir7eVIjJoIGJBS?=
 =?iso-8859-1?Q?cSiZ3ZSHMXcA3FDeT6ccsAj495/DfqK0inw9FxSX3yBi6+Lru7npV/z7Lt?=
 =?iso-8859-1?Q?nzpe7HkbgTTBR6mWHwopf1JRy3eznuJIqq2aDulOzBE0ngc79DpEnEPrg4?=
 =?iso-8859-1?Q?ff126AtMEYDo8c7KwCqVFbVfKD45Y5xv4huHgwjQ7Q8B1f2A6xgZHB5Iz5?=
 =?iso-8859-1?Q?Vmcs5H8iZISZF0VhKhCrMO6ctPXuEBcizsID6vktBUaYlnmiuXX0SNjwcQ?=
 =?iso-8859-1?Q?fiGV6osnG+Fx/5MPZbbZxyoMZWIeHkShY/IHijB7hUy9r3UvQUfvSOhvg0?=
 =?iso-8859-1?Q?oanVJGOp69dk5lmp7xO7ZTbQ8AfqsUNzOqRCRoDX3L9A3K8I1oXn5I2eqL?=
 =?iso-8859-1?Q?fPPRZY9ehnWMYBcrtHATmYUpfkFmtosBXG8WnQx52xIVUTTIGkEMfDQZ5t?=
 =?iso-8859-1?Q?vcIMNTsEMTwHFXZwGT4Z/TUByRxd0yfBKef5Dh4QcaypABekiNDbmJbnor?=
 =?iso-8859-1?Q?EoUZhMW8OOY7ossyg8ZC/lB5w9IkV0ZXeOy5EO0xDovTe55qM9EqzmWklE?=
 =?iso-8859-1?Q?yRLfJ8SHnOLNrYtuRf1nQFfJZTJe2tazNAUVmMqIMDRmGD5bDsHURDnHDH?=
 =?iso-8859-1?Q?Mz4obJh6nz9PSXWF98/4X0L8BRQKGcw8S/5YySdH6JGC0Ntj8OaU3CK2lD?=
 =?iso-8859-1?Q?GnSIjO07ufvflHNIMGN2cRK46N6+MYibt3dOPxXCamIWFG2i7RlIODn7HD?=
 =?iso-8859-1?Q?sXXUb7GKwS3dtwOtzeofTq6RjMH6jrhUtkegh56dlc5ymikb9KyS/57Fh6?=
 =?iso-8859-1?Q?WftPGMV6am1B/PCt20zHlYYX02ysbR9RI84wH2KGxKkm2OvbL2vLkLuGIR?=
 =?iso-8859-1?Q?4qukCuwn2yNUcKvZiP2uCw6BwJkvVcPU9OGmY6NJVfi3ZUzCi0LAWDSCbS?=
 =?iso-8859-1?Q?mY0ZrsAqkuA0WSxEocVrLTRA+uQTsUR2tB8C3NQDbcnyOqrJnBcmyutjd2?=
 =?iso-8859-1?Q?R1F7MDS3o5/2aQgDdp0ifW9NAXSqIDFjCXTuLP3Sa5Q2XZ/rCTopTZJwqz?=
 =?iso-8859-1?Q?Q/5XfIXmYDGhI1UjR827PZT9DNml6Ybp/KbHhqPieR4G6uCjHhHSWwzKOw?=
 =?iso-8859-1?Q?0HU0kj5BXOpZDYXGTkIcZejfuXrP33B5yaRgOQfutc5S5sepCbLFGh/037?=
 =?iso-8859-1?Q?40X0HvIlfjAoEx9bazkpCSF5Jl75GvaovzjBl2UywKYiBi7Muyd8vs6WCh?=
 =?iso-8859-1?Q?5FaAdFLvtEHnsWW3mNfuLTsLlbf8DzBI5fPjT/Y6/zebNC+UAiQnQDIka3?=
 =?iso-8859-1?Q?wMRc2CzqT/+buDLmFbFGOT1ZfqwSGKYr2BX3oFF6i95O9Y5pzHuc7ln19Q?=
 =?iso-8859-1?Q?FoHaSQzoLiLuqfOg1EzSVGXikq5B5yqo+ySaAAp3Eo1Dw8HJyVw3HlDA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a0c0a96-77bf-4074-9ec4-08dc1b8a5aa8
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2024 20:40:22.2627 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SDc9taQ7aWHT0lzXXgR/IiJftAqKUiV6s9lD1P8kRPmyqHp+DLAdKMo45QdvORcIXu3Rza1+UD6RkYXsH4RwNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7374
X-OriginatorOrg: intel.com
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
Cc: "dev@lankhorst.se" <dev@lankhorst.se>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Jan 22, 2024 at 03:26:57PM -0500, Souza, Jose wrote:
> On Mon, 2024-01-22 at 15:11 -0500, Rodrigo Vivi wrote:
> > On Mon, Jan 22, 2024 at 09:04:41AM -0800, José Roberto de Souza wrote:
> > > xe is never set in xe_devcoredump but if xe_device is needed
> > > devcoredump_to_xe_device() can be used.
> > > 
> > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > Cc: Maarten Lankhorst <dev@lankhorst.se>
> > > Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_devcoredump_types.h | 2 --
> > >  drivers/gpu/drm/xe/xe_device.h            | 5 +++++
> > >  2 files changed, 5 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/xe/xe_devcoredump_types.h
> > > index 9a12959ed6b14..d259119b2c980 100644
> > > --- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
> > > @@ -47,8 +47,6 @@ struct xe_devcoredump_snapshot {
> > >   * for reading the information.
> > >   */
> > >  struct xe_devcoredump {
> > > -	/** @xe: Xe device. */
> > > -	struct xe_device *xe;
> > 
> > good catch.
> > 
> > >  	/** @captured: The snapshot of the first hang has already been taken. */
> > >  	bool captured;
> > >  	/** @snapshot: Snapshot is captured at time of the first crash */
> > > diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> > > index ce20f6fe6219a..781a1aa164ecf 100644
> > > --- a/drivers/gpu/drm/xe/xe_device.h
> > > +++ b/drivers/gpu/drm/xe/xe_device.h
> > > @@ -35,6 +35,11 @@ static inline struct xe_device *ttm_to_xe_device(struct ttm_device *ttm)
> > >  	return container_of(ttm, struct xe_device, ttm);
> > >  }
> > >  
> > > +static inline struct xe_device *devcoredump_to_xe_device(struct xe_devcoredump *devcoredump)
> > > +{
> > > +	return container_of(devcoredump, struct xe_device, devcoredump);
> > > +}
> > > +
> > 
> > But now this is kind of duplicated with the coredump_to_xe that is in xe_devcoredump.c
> > itself.
> 
> oh missed that, will drop devcoredump_to_xe_device() then.

with that feel free to already use:

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>


> 
> > 
> > >  struct xe_device *xe_device_create(struct pci_dev *pdev,
> > >  				   const struct pci_device_id *ent);
> > >  int xe_device_probe_early(struct xe_device *xe);
> > > -- 
> > > 2.43.0
> > > 
> 
