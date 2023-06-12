Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65ECCC88CB2
	for <intel-xe@archiver.kernel.org>; Mon, 12 Jun 2023 14:29:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 396D710E076;
	Mon, 12 Jun 2023 14:29:16 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F359410E076
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Jun 2023 14:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686580153; x=1718116153;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=88IQuD96KP/zbj3T+5hZQ3P58yTSnyDLj3FO0D4F0Co=;
 b=l6V+zGqCd7Y9yVoEizBQwRfL3hCtvIizMZQkObIO+5OwW0upGqWZYnlY
 2jS6NVSBR7wr7d84l4jEF2t6AN7+cPhUKSn2BxwguvNo+1UTY9+g5sBqK
 jW+GMteJjbvX+0qSfwdJQxjg6qLsMdEbsKqSQ06gm1gQvWr+KUJWE9Azl
 Nan1NbotzGaSAW4L79APojbBm5n0NPVEpSRdVQ/YlCLSX1Q21O4gtG8Ua
 eW1dUwOsJjS5TVZOB2q+E8QyKF4WT34eOKOx9Hutlx96c1bG3WUg4E7Pu
 x4ZYcm6kixpE7hhLmtHuxLRsD75S8GLxHBMEEhMZFNw0nHe8ttQIR0G3V g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="444431078"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; d="scan'208";a="444431078"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2023 07:29:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="1041350753"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; d="scan'208";a="1041350753"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga005.fm.intel.com with ESMTP; 12 Jun 2023 07:29:12 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 12 Jun 2023 07:29:12 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 12 Jun 2023 07:29:12 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 12 Jun 2023 07:29:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hbMUY4FFOa3XOmzNx40CmWu39PTt48F+pt4Be5+kvTuR9Qfcu0Ft1t1WdDO9Gbqp+Dk1khD/x9Wj3qAfUbz8A/iImeUnEPpD1xGuYOZJGyNLi4vsd1F17iLmBOfGCgUy9buY8Q3FYV1AshOwlnknNFdrsg15ZgxZIfTOxmfkcqCDT+7NIIW9HWNe9aL1QUAJqc9Nk4dH8LsGm5BUffXUaaB0C2m5o5XMOvQcIBeKUSlB64Qd8jvKeXG68UEoXyOrfU6DPcKxMId26b6vsQ+94PCfnBrSwQXcNUN01WXekYQw8aeYWCq/Wuk9duukvDa1Wl2YFp7oLapX8LQyVF1Ijw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iMe4YUPhqPG0obPzLfCsjPkD7mbw9MyIkbQqJNFvQwA=;
 b=HUJ2YtDnO0fIgsqrjcP0Ow9+idBC6CbL5o25jEr2vNvyraJrA93kxMZjNyZWNypIFodFchBfjhe/n8Mu70l284Po93lYQCK/AOsflSNwb8XkfvGNVyfk/03uQ/ojUd/4C2vhf9JQp1SFu2Q+MjkB2nMHJ8UGHpjTNR30VUJWGrk37vroQd3w01pzgACsMPH6qD6QDGXAA8c3g2OB9Lk/pKZ4DwKqAQ9F6x8lf25r2jGTsPmmdWMmyKrJwY1DX8Hb6x5giMVJszQNXrXcKaA6XUUqyTRclCKaJCl3yHxYN0zEtPO7ORucLILjRnXZNwJk0G7Mv0Sr8R3UfgRrTNEQIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by SA2PR11MB4986.namprd11.prod.outlook.com (2603:10b6:806:114::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.29; Mon, 12 Jun
 2023 14:29:09 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::2728:b097:ff42:bd19]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::2728:b097:ff42:bd19%4]) with mapi id 15.20.6455.030; Mon, 12 Jun 2023
 14:29:09 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [Intel-xe] [PATCH 1/1] drm/xe: Fix stolen memory size calculation
Thread-Index: AQHZmwMkE9ZwbW5bG0OfpoIpw7ynha+HM9YA
Date: Mon, 12 Jun 2023 14:29:09 +0000
Message-ID: <IA1PR11MB6418E0AF6621EE62DF042E06C154A@IA1PR11MB6418.namprd11.prod.outlook.com>
References: <20230609185249.2032370-1-aravind.iddamsetty@intel.com>
 <20230609185249.2032370-2-aravind.iddamsetty@intel.com>
In-Reply-To: <20230609185249.2032370-2-aravind.iddamsetty@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|SA2PR11MB4986:EE_
x-ms-office365-filtering-correlation-id: d07ef93f-b5b4-42fb-be96-08db6b5162ba
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ysini+huw7hhPt8wEcf2iHfk7VlJcuMcgtaECoPW+TKvYUAPQaTXUv+qVrU2ylHrl5RnSdbZHuihStySaQNwVunv5xlc9cFYlLnBqczgUqDcsI/7g50DCUdD2b5wOHTm3YzXEe6IdcZLxsrGyd3/ET1aUDzNHWLyEzY0phagm3l+Y4DXHioU93dsn9B8FfW7B+g0pe0/LIjgL5hYXuLdHC8kOBAiHTI/c57Q0QsM5RNtsiCdB7oqVVR4HvV2xtq1QZ0BHu5X1JIwtXkHBEoedcB3jNW/RrvlRbQaGu3HiZY0jBzCKZNYwHY+hFwL643fOz5teca+ZTtiU6D8wJMi2IDfHD5pnZcKweqI4dnCkmX/aGKbAzKIzhgYSGADcsRrQALN6EKxwjUsCPgHRfRoMXdQ+bTSVDHqgDBQHaUXqwaXQtFbJZ1bpE3qMA1LRvEiyx0iCt69bI2GdHu2SOZmMIMfBGXck7ROveoS8Wk3KlxOovNbkKeshZIcTswvevxEWxAwgAR4W6pOkam7IxHkOCUa/DfgwmowrwPjORiJmpl+x5NvitgA04BTSVXurZH2JEA86piJB5iya6I6BHWU5rlaseNJhc/FbJyuAnStXgtATnD7gI4X4bf+5pENRdHd
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6418.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(366004)(376002)(346002)(136003)(396003)(451199021)(110136005)(54906003)(5660300002)(4326008)(66946007)(66556008)(8936002)(8676002)(52536014)(41300700001)(316002)(186003)(2906002)(66446008)(71200400001)(64756008)(478600001)(76116006)(66476007)(107886003)(7696005)(6506007)(33656002)(122000001)(26005)(55016003)(83380400001)(9686003)(38070700005)(86362001)(82960400001)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Se1bpZD91g4Ysx4KQcKUghs2CQCA4945iFG0gx3M/cnd4nPh1UxmyUn3hhbJ?=
 =?us-ascii?Q?/kP+c8OaoHDXgqG85zNhyudcExQbjGG6IA9fZ3gp+bKBB4wlXCRJo0cgAZtT?=
 =?us-ascii?Q?JikcScwOZAR2Jtm2nhuCMD5Wp32EqTHqK1S01Ivv+BUymNjcHmIMzIIl7WfM?=
 =?us-ascii?Q?HSanDi/HlaU5B3Nk02ZJIL0dRKg5Hiu3MHU6xed+GPGwvyRtU6d375xKPMlC?=
 =?us-ascii?Q?+p2RoeoTh++WmcD/DJJSF85RKmqmYoRTZOM2kxMCCnBG4K1w5GJ3eaE+MXJU?=
 =?us-ascii?Q?hld+ZOLj4xq/JHjqSTiyMNkaMyqy6JaV6hetuDl9F6Fu9yvKgcrpdfGGkkAP?=
 =?us-ascii?Q?PY5LInGHnp4Ff2hCGxwY69R1UK5ZkXqi9weFmf9b77ABylfdQ4b9qLolNUMj?=
 =?us-ascii?Q?A5bkSOxFwAEB9dm+gr00v8m6mKf4oqW64TYIRDdXYyyR4DzI1AT0N8qYCeBf?=
 =?us-ascii?Q?IZcu2IWa1eMc4tNqqvLTb3/pJxsbCsoM3uvA+kI9MIi48cXK46zQSLPF8a7P?=
 =?us-ascii?Q?LR9YqElJnehGkilz/rsHQlCOFFxkz2mLCV72/WB6YcafXxPGwEDdvRC8TqDx?=
 =?us-ascii?Q?YMdMW3TMvbPYpdUiGV6rc44SSkLTZia0p1wdQjt/OzJItIxpUQ0mW9ip2UXx?=
 =?us-ascii?Q?nmrJioSXyM4MDTXGELXztoRrwPNrK56FVFnQ351MejpOe0mNnv3+ueNLkSHn?=
 =?us-ascii?Q?UBJo+Ren2p+1Va9EeW0P+U0iv04m9uCaLg3W7EAaldIjLRclPodJ03BPVkBe?=
 =?us-ascii?Q?UE06A4PiS8osBX91Z+atk2AVEWocLjKu5/oUF03B7cONN7iBwSYHbY9Vw6UN?=
 =?us-ascii?Q?Rd2xGRCbbCpAsqWXeRg3+xLNzoZc0NENQut8U7Z4fuPaHaIf87razll0p+Qw?=
 =?us-ascii?Q?pp/mjumkE0pmDNoHQey3xiCvVNebroaRIEFFqNie42a/Q/EB7agbv+owLDjl?=
 =?us-ascii?Q?pcx/XdwlTKT0HsD7uXh21j68dgSExs5FwKfXNufzNlB0HuMxqcn6r6GBK+f4?=
 =?us-ascii?Q?CA2ACUEiM1cvIgkMtzpV2Y88vK9psONTjHBTbaFZPgDLUv5gcirctCNUqm2l?=
 =?us-ascii?Q?sa8ZKXrdbWMJY+Ohycyj8EAWd3ZZFcq7Qv7KWbvTHsydo72vg5Aweo89t42b?=
 =?us-ascii?Q?2EqG+/kImJuD763g7/3Mwu/P/wCRjuPbNVltwMjzpiTSMu51oUM+C+yqhVgK?=
 =?us-ascii?Q?oEDrUO6Z3VV5g4jmuqrrmQiRmlyHFhSx9X5gtqtXnoyfWRAj/hr3Pr38Gcyl?=
 =?us-ascii?Q?h0QI5tx+hHrroF13kitKtm/JbCb+Yupid4LJ2L64AHAuqASFpageUL2IUN8Z?=
 =?us-ascii?Q?WAl8RER38ZPClFyLOeBsphUt4pnWZfZDtX1EAOvmKegVBTXTJ9nLbZDTXBAI?=
 =?us-ascii?Q?/E1TRK3wa5BRPQcq9rDkT9BK7damTZCi8mjAWNF7JyBrJfw/XOD+lSFiSo4h?=
 =?us-ascii?Q?eeWcCZ84mKeJs1ZnOxUuON3efSGq8V13FKf82AGwqxlTbB4lbRs8WgXGGtfY?=
 =?us-ascii?Q?HqcvESUML1qbDX3SImHIirXjf2SuKo/z6CdnKoMDfqQLK0SKKRJVSr1Zsz+W?=
 =?us-ascii?Q?VFzfhcmTga/KqUEiUk8X+LurYbdKKscQPEfcx4Po?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d07ef93f-b5b4-42fb-be96-08db6b5162ba
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2023 14:29:09.5922 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DWE8HwFsvX0EBcBejoWmxJBZU6goJrxKfHL5d5DZMA2PiC4KdKi7n6J/kbX1WRuF/b1byCUIYugJGNR2z5A4CLy9DizEwA+3ybva9nCzVXY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4986
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/1] drm/xe: Fix stolen memory size
 calculation
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
Cc: "Roper, Matthew D" <matthew.d.roper@intel.com>, "Auld,
 Matthew" <matthew.auld@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

>-----Original Message-----
>From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
>Aravind Iddamsetty
>Sent: Friday, June 9, 2023 2:53 PM
>To: intel-xe@lists.freedesktop.org
>Cc: Roper, Matthew D <matthew.d.roper@intel.com>
>Subject: [Intel-xe] [PATCH 1/1] drm/xe: Fix stolen memory size calculation
>
>The stolen memory base should be derived from GSMBASE or
>FLAT_CCS_BASE_ADDR when flat ccs is applicable.
>
>Fixes: acf067c2f5a5 ("drm/xe: Implement stolen memory.")
>
>Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>---
> drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c | 7 +++----
> 1 file changed, 3 insertions(+), 4 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
>b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
>index 21ecc734f10a..29ce69bf8200 100644
>--- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
>+++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
>@@ -54,7 +54,6 @@ bool xe_ttm_stolen_cpu_access_needs_ggtt(struct
>xe_device *xe)
> static s64 detect_bar2_dgfx(struct xe_device *xe, struct xe_ttm_stolen_mg=
r
>*mgr)
> {
> 	struct xe_tile *tile =3D xe_device_get_root_tile(xe);
>-	struct xe_gt *mmio =3D xe_root_mmio_gt(xe);
> 	struct pci_dev *pdev =3D to_pci_dev(xe->drm.dev);
> 	u64 stolen_size;
> 	u64 tile_offset;
>@@ -66,12 +65,12 @@ static s64 detect_bar2_dgfx(struct xe_device *xe,
>struct xe_ttm_stolen_mgr *mgr)
> 		return 0;
> 	}
>
>-	/* Use DSM base address instead for stolen memory */
>-	mgr->stolen_base =3D (xe_mmio_read64(mmio, DSMBASE) & >BDSM_MASK) - tile=
_offset;
>+	/* stolen base should be at end of usable vram */
>+	mgr->stolen_base =3D vram_size;

Hi Arvind,

The stolen memory in i915 is not calculated like this.  It uses the DSMBASE=
 for the offset like the
current code.

The lmem size includes the CSS sizing, but that is for the LMEM memory regi=
on.

This is calculating and creating the "stolen" region for use in kernel spac=
e.  If the offset includes the CSS space,
won't the DSM usage be in the wrong place?

> 	if (drm_WARN_ON(&xe->drm, tile_size < mgr->stolen_base))
> 		return 0;
>
>-	stolen_size =3D tile_size - mgr->stolen_base;
>+	stolen_size =3D tile_size - vram_size;

The tile size was picked to work with devices that do not have tile informa=
tion (pci_resource _len used).  vram_size
can be wrong in those instances.

My original patch set used the vram_size, but that was not accurate for thi=
s usage.

Are you seeing an issue with the current code?

Thanks

Mike

> 	/* Verify usage fits in the actual resource available */
> 	if (mgr->stolen_base + stolen_size <=3D pci_resource_len(pdev, >GEN12_LM=
EM_BAR))
>--
>2.25.1

