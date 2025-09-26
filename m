Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 188B7CAC5AE
	for <intel-xe@archiver.kernel.org>; Fri, 26 Sep 2025 05:52:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE7BD10E325;
	Fri, 26 Sep 2025 05:52:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jFSE3c9O";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 266CE10E325
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Sep 2025 05:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758865970; x=1790401970;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KA8G4TNpNBICZNROumvQhy4shN0qLub4a4jlMQ68fe0=;
 b=jFSE3c9OaVQZyPtB5yFR3qYfVTVWnrBh1YCUDo1m/hEI7LknSGMNlN0K
 gRXzpYrBLOoESYhEF7QxNcf7z9OkUKArEkTNi84y74D/w4qJhsMYEQT8v
 ffa8KhxTLk7xSTEBE0jEZPmYo8LRJHPP95q+bIvrHGD0V55BjelZxT9OH
 2HTjfuzdJ0aFcu/+wCDsPmswovEzft1s/2cC0vCLRVnhWc1RbD825sDXd
 O3TQwG+G0xHVHTqfsdCJg0G9DEaZ59eGIFcGMjOGtAlyG/NC6AFUUl4of
 PDfv4rImr0rPN7gwng8+1+m7D4lxbMWHWDbm3jAAIvOtOtudf5Chki5ON w==;
X-CSE-ConnectionGUID: G4EOB21oTL2pdZZcRzJy2w==
X-CSE-MsgGUID: 28ibPhpLQd+hSkY0tEvNJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="60404589"
X-IronPort-AV: E=Sophos;i="6.18,294,1751266800"; d="scan'208";a="60404589"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 22:52:42 -0700
X-CSE-ConnectionGUID: lYIU7Lz3S0ya6YmKutd/aw==
X-CSE-MsgGUID: NiyX29leROObF0iaLEzegw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,294,1751266800"; d="scan'208";a="177913721"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 22:52:42 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 25 Sep 2025 22:52:41 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 25 Sep 2025 22:52:41 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.49) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 25 Sep 2025 22:52:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RZlXXBXrWIy3YBZ974LQWQDbjI5dJDtzyJu3vMKIXulmnfDBXxOraZnd8ABoL2JoG7ZxcZ43uKIH2WN39rQjs+A2A0W5bXlSnZTLa3bC3W5h3/TwIrfevNdFOBZXDTAcilgBNBQixd1T5nQXHfFuV/7/POF/8DSDxcYvWB4QB3GpZdW/RawxFOQ/dLyeJ8fLusXXFxOIzlBuaDWMgGaBU92yDS9TWoq1WheOyEUsF17NjcbvmRJv/P7fUD14QZabx45l9+wONx6M2vUIqzlD2MM55LDFN2zuq+CASC1VHyKFMI0UpZ3ANOoD9N63N3eILwsetUswr4tE3QYQbeg7Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KorZkv3GASgK1yAAcNz2EGFVLQJnmvg6taIGApLEgNg=;
 b=r0asqFNBaWd44UR8XInjrc9ut+A/3Rmo+N98MF3ZJD8mqSFTJNuNN96refbqxSzkTVSaDFymm7ON1+84HFxufswKOxPh4FApsmXInpDhv39q+l6ThGaoHGGZsf4W6bAlSAmH0pNNFmzqSh0MKTdPaVSFWdippqJenlwFyGjA8XYHl0NzpvSnUEnl9+LDZQKeTTFVDwpwxolWXDmxpWkkyRzimYcgHvAiaUdPTswiE4Y+dTeSK4UK8TzVXgptL/YgrxxMlMLYVxhif2tucsfbvHpFKzJ78N5uyOt88fSCh4wJCLXazUVotINTzlUAzpKQGLYhSTJM20oQfYpCM6E+nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by SJ0PR11MB5771.namprd11.prod.outlook.com (2603:10b6:a03:424::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.20; Fri, 26 Sep
 2025 05:52:39 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%4]) with mapi id 15.20.9160.008; Fri, 26 Sep 2025
 05:52:39 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>
Subject: RE: [PATCH v2 13/22] drm/xe/irq: Don't try to lookup engine masks for
 non-existent primary GT
Thread-Topic: [PATCH v2 13/22] drm/xe/irq: Don't try to lookup engine masks
 for non-existent primary GT
Thread-Index: AQHcLna3/FQQA2Ea1UeoKqHDXu4qyrSk9nqw
Date: Fri, 26 Sep 2025 05:52:39 +0000
Message-ID: <SJ1PR11MB6204E06A9C7889F623035B8F811EA@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20250925234628.2112163-24-matthew.d.roper@intel.com>
 <20250925234628.2112163-37-matthew.d.roper@intel.com>
In-Reply-To: <20250925234628.2112163-37-matthew.d.roper@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|SJ0PR11MB5771:EE_
x-ms-office365-filtering-correlation-id: 87fdf444-5e12-41cf-ec6c-08ddfcc0e6ed
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?5Tn5fAVXLU63+6cPMpbGC9j/dQRJ83qYd8kZ8zQTESK8X3Px19htPA8+30ba?=
 =?us-ascii?Q?00xxD2D3aEHDPpfyH58RwfBNp11zorCvKNpKSMgR1gA0trpluDg8ryfPX6zq?=
 =?us-ascii?Q?tHnWzScmqg+NSzaVYhcK8Jsd/HHWOTB3fGhW1kSOtm4ateDD2x9dhLfuFjK7?=
 =?us-ascii?Q?RJvSYursi469uDdk3qxumr1xkaf3v+EFj1PggBMBP119xghtpOuF4gZBW+FG?=
 =?us-ascii?Q?0rbIBhF7SYtY25iFe/mEjnXUPa0aSoqjYdMeqI/rr15Oi/SSr+H8dbJhdvk1?=
 =?us-ascii?Q?dDafe9dLSkaLTZmqYhdn+d1zUrzD/G9U2wZdS5ZkTKjbuwNzXxBCNziofu54?=
 =?us-ascii?Q?qUP8mpEIqXclGvCDvL2lKJa31Zfpi4hODcxrS03iyQZ8Y06YfH8vdhR9StJ+?=
 =?us-ascii?Q?Wm3NPMku6MGVFc4FaSGOY7/s0iSTNLezIU2C9fOjuS6q20ia9fG5HiP478dv?=
 =?us-ascii?Q?wc6MBFtvYuPjWzpTNCfQRd3SIx0xfxbCP3/nrbtZFD9pO9VvOLYLrTHeBm7Y?=
 =?us-ascii?Q?7euykq1iwXa2dOJHDay9aXSZePBFy9LJBphIc+KnJM2vuwPMz+RB4mdxZbbJ?=
 =?us-ascii?Q?44wNJss29bAzu/c7dpQt6BVMDcw+46FvytA2XEamvoR8EcPDra8vZ1C8L9J8?=
 =?us-ascii?Q?auqP9yxTi5G9M9RFzlFoVC4h9QZz2YCroOsAf9likmadgZsBwuGKkCZnPzAy?=
 =?us-ascii?Q?UjdOntJj88sQo2/dxx2duXLadqqnaU3adwYxLS9njhM8B30MRgujN/9I6Ndr?=
 =?us-ascii?Q?PBs27Il3HWx9hwJGbrtDqIbYVfgacwJ08fyo+PtmTrEcR5DFwJhPrrqYdPK0?=
 =?us-ascii?Q?sLum/N93Lp1qE2jyVJOSTx+iaI3/GnkUI2yKsVUToSkdWOtXOL7cwGS1mQY3?=
 =?us-ascii?Q?u1B9iqJKCw6Ob3MGTNXL49t0cwh6uJP0yo5102blvs1E5YLTId34RI0mylHE?=
 =?us-ascii?Q?+zar5D+PefEcMd++6bQQF9VxCkHnKsThXbLA52Hy1oaGhLDFjAwNZxIrLO0k?=
 =?us-ascii?Q?gCcOl5smT/KnFigSPcR6KoYmWPOKkT473QTIirrfhy2dQtcxtOT4esO89LBo?=
 =?us-ascii?Q?JW4mBT5aqadD0qC6lJpiQSEgGZOVlsEOZjNuv2zNOafdQ6vvWBuprm+LlX5x?=
 =?us-ascii?Q?fD4R9jtNemGR1GzmpxDCKp006weXMnNlrD8gktg5IzAFx/L/AWyMzs4BtM2h?=
 =?us-ascii?Q?mGtXe0/p3g/iXcteb2l2VjkDvrc7itV8eReQAYb3y9i26eFd1fMYFucZacaI?=
 =?us-ascii?Q?/KZdLM2CHvphkEJnHxGasjYO2eQahkHlQMyOZh2MuQdNhYi1s6AxRgkHzHgL?=
 =?us-ascii?Q?k9ZrHTkzZuOC0MyUcX5a2CiF3DcZ6QkpEJcNNIgjO4HQk/2boDqmGtOyP0GU?=
 =?us-ascii?Q?56BRztpPyfCtjL1gdKUpe4VuuZBFisKSmjOsC/XtATkHrgXVaG1IA8EoI2wb?=
 =?us-ascii?Q?GGZRLcasGHJ3dS/6I3DnyJSmj5iR9C+EFdds5otNJX0PUfBskUSa5oJ7ZCkO?=
 =?us-ascii?Q?a61QuoD9dFXnNELXncDSbSn47zWp4IEEzrm9?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?PFxkJEbrHufZTiDu5F3f+jk3Rtml8LGFi6oMXENPTlD4l7SgBDtquoNxSAEm?=
 =?us-ascii?Q?0Im9Rfw7zpVjDw7lGekI8qAT00q2a3cP1+VEASvqOgdpQyrsNTiW1suyEhNl?=
 =?us-ascii?Q?PERDreMRCCTRvonQryL83Uy3uejOh10dshZIy+/BmzKWcSjZLMl8jSD3q8PF?=
 =?us-ascii?Q?X21CjFISMxA+DLAUxIQRCb1a2zBy1NbjV6ztvrOajSaavPVvS+Ow6ua6edzd?=
 =?us-ascii?Q?olrOepPmH4QN75XUMgaRbMMQkRGXCfG3d+mqyo8R0isE8mxzYOvz8o+byDBZ?=
 =?us-ascii?Q?gJMwkdhtGOlaPrxe5Q5BGw8p3bSBMjYziwUBB5PRZxJ4JapdphRIMpoO5BT9?=
 =?us-ascii?Q?0TpGdm7aiCCrMPKNnM714Fm1Pk1jitER868dZc5cFMrWb3O0WJSnqDocBvaj?=
 =?us-ascii?Q?h5q4GUxec6py8pECgOpQd1hepXb1UinZ/1WvyZicL+7vqLFKqlt2gpZE2U85?=
 =?us-ascii?Q?3C3zYijDWTkl2UmtlMkd6wxlCtqlXPoFpcojO4AfkbmaZRZdw04R2+AXZR/5?=
 =?us-ascii?Q?dbSJ1VJM8znbx3Z1P+7tdqhtHWP/ThmUWncY1JQfzwAuzufDCzIVFsqeAr71?=
 =?us-ascii?Q?io4sc0PcvGbiGVzMo1g8FbdLMR+7CwuouncUuX5d03U5XuDy++l1LN1mlDNm?=
 =?us-ascii?Q?pdCNRg5lcxBCEJJH3d7Y6T8gzMBvRif3eayzv7A1RWytacvbpv5pAnibujlp?=
 =?us-ascii?Q?vOH8WdxS9MzQVzoI1Xvsv14W8uldSboEB4VLfgJLsTjlVjjkYag0fuAHEbeD?=
 =?us-ascii?Q?evn+7wbrzXhiMvnHEGr5rSpkPkudXF47WXRackcv3W5ZUjg+6ej3GVsi29QZ?=
 =?us-ascii?Q?0r7he18+R9bm4lXboKA2lDsZN/5ki6dfV0i3atI+xitH6s309mtx+cDdNscv?=
 =?us-ascii?Q?f5gvOHRUpCDTkIzpFLBr9ZhL3B05vYY/Ac4+/LuI2pBg1XWiSmFGyJTQzC5b?=
 =?us-ascii?Q?qSzIrmKTUCL79/4dg966C2zOzsKYuE+aEnxrXrCeC4fk2tf4qZXUrHBFriRk?=
 =?us-ascii?Q?7r2quMUnXv8LyiKrOQxGJmVz27oWIHY6702zrC0Mufg/U3QmEXwDAXA0FoCz?=
 =?us-ascii?Q?P51IQSTzjZE6aeH9pFurECp7KadOcdgIrkVaZ46KMzO51dOVFFT3439Dtu5+?=
 =?us-ascii?Q?VXAICE6RQnjwCOaYBl9nJeXNIVUqrEIt4m+/hn7FCMkXB/r1UJle6nZo07D9?=
 =?us-ascii?Q?F/YuH9hD5BxJ4zPM1zsUO8JgYcxicO45IhTih2yYvZiiag2madeWQg8Oiuu6?=
 =?us-ascii?Q?Rgi5MJYMhO+CX+eS1P1L6kAeTx2nCahMF6b+ONUUPKEpUouvTcTEzhkgeNpH?=
 =?us-ascii?Q?s9vlBKDoterJ0WytsTAeczYGE25WfcQfTUhMx9ekl7XZm5w652AEMYZQPCqS?=
 =?us-ascii?Q?Ah6ppqTt0lHSN4ULtmukhXq52A4Y3XZkEPeuEW686tsuEsg5yV2idwOTFTf3?=
 =?us-ascii?Q?hZdahzf/AkOEPa5nyw5+toihTre4bF9lbjDNkSypcv+7XP+UFQ+Dc7am+SqZ?=
 =?us-ascii?Q?ev+RAlOEI3SzHxqwDQ6ILVParFpnOWqYS68i3fPLYEla1+VMH2tt25Bt7SAU?=
 =?us-ascii?Q?Lq6cdnN4MSxdMsuf6iqcoG4+xFDCdHWG/exU6jUV?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87fdf444-5e12-41cf-ec6c-08ddfcc0e6ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2025 05:52:39.4372 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vXjFnQZasZ08p1k4h8uPsb1fHYlUs0KGXlrvRv2123za85Bj60RSRTjGa5M064M0svdEmNQ/c0n3Sdqv5BwvUZM77iYuivQbqPEgIxt5xHM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5771
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Matt
> Roper
> Sent: 26 September 2025 05:17
> To: intel-xe@lists.freedesktop.org
> Cc: Roper, Matthew D <matthew.d.roper@intel.com>
> Subject: [PATCH v2 13/22] drm/xe/irq: Don't try to lookup engine masks fo=
r
> non-existent primary GT
>=20
> If the primary GT is disabled via configfs, we shouldn't try to access it=
 to lookup
> BCS/CCS engine masks.  For the purposes of IRQ reset (which masks &
> disables interrupts in an sgunit register), assume all possible instances=
 are
> present.
>=20
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_irq.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c in=
dex
> 5018a116852f..eaca56df08e4 100644
> --- a/drivers/gpu/drm/xe/xe_irq.c
> +++ b/drivers/gpu/drm/xe/xe_irq.c
> @@ -494,11 +494,15 @@ static irqreturn_t dg1_irq_handler(int irq, void
> *arg)  static void gt_irq_reset(struct xe_tile *tile)  {
>  	struct xe_mmio *mmio =3D &tile->mmio;
> +	u32 ccs_mask =3D ~0;
> +	u32 bcs_mask =3D ~0;
>=20
> -	u32 ccs_mask =3D xe_hw_engine_mask_per_class(tile->primary_gt,
> -
> XE_ENGINE_CLASS_COMPUTE);
> -	u32 bcs_mask =3D xe_hw_engine_mask_per_class(tile->primary_gt,
> -						   XE_ENGINE_CLASS_COPY);
> +	if (tile->primary_gt) {
> +		ccs_mask =3D xe_hw_engine_mask_per_class(tile->primary_gt,
> +
> XE_ENGINE_CLASS_COMPUTE);
> +		bcs_mask =3D xe_hw_engine_mask_per_class(tile->primary_gt,
> +
> XE_ENGINE_CLASS_COPY);
> +	}

Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

Tejas
>=20
>  	/* Disable RCS, BCS, VCS and VECS class engines. */
>  	xe_mmio_write32(mmio, RENDER_COPY_INTR_ENABLE, 0);
> --
> 2.51.0

