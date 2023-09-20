Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA052CE79C8
	for <intel-xe@archiver.kernel.org>; Wed, 20 Sep 2023 10:58:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7178D10E47B;
	Wed, 20 Sep 2023 10:58:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0611610E47B
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Sep 2023 10:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695207488; x=1726743488;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=LxAiHyLJCptDlhZiGCJwADLGIuGcxfAFRwYRc/vDppY=;
 b=UIDHXcJ9YFeoVK/iH1sylBmFMSSX0ghyLjdVmYevIrwLnTMF4ljXKoMU
 6i4kv0cfmMGv4agfgIZmwvZVZ5SyzWNpqzHi7zkZATb4HkbxsovMmu6+8
 ruToU5YLVpKjMIdTvaqg4pkc9sbLer3m8GTtkEnJxuDBrRLYW85BqMH1/
 Kjpc1ws3KDNBmyzPPSWaB3Z/+k+mdCRPC8VzLzgdylcnm/jjAA6Cqu6xv
 53KgEVSz43YaX2uzJLElJnZcBF8/kdsjACqlw3/vK46rC9wlgQleghUhJ
 nvtSbJ4FnyQf1U5fXiyo63s0w8sCJBko+muBcJOaICV7tMxmH+PtNW8jL A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="382935264"
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; d="scan'208";a="382935264"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 03:58:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="836802816"
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; d="scan'208";a="836802816"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Sep 2023 03:58:07 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 20 Sep 2023 03:58:06 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 20 Sep 2023 03:58:06 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 20 Sep 2023 03:58:06 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.103)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 20 Sep 2023 03:58:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g2NLesKKqS5h6j9u2xBjzFjpluoY1CZ8mNjRksG5yrJWQvrAfq4ru9OKwdiiAQBtJylOy8XwKStMUSi/HNZvOKXceLFgJwWjVEj1aCRNOthelv6X7bZ+JqpcENBnZlmfOG2y53XphWk3e65U3a7f8nrBLypcCKPzw5HkS1oJKpvQ+528AF3dO453SrBjmSVTi6FBhWSJShcStKPaBwRDoaNS4J1n+JZ6cu/1ZWXFrEV0qiXIPSF7tBR/yu1qk2PT5lgMlTEKjdgjFQZcH26qCqBn/oHxWs4+79TSrjqOxog28GgwvR37iiyR+IoaQJ5QDP+5WaRJ7/R6AxUX6OMfqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LYd1CHOEMgld8O0rwCBPcPurKACbpj/ACzTr+IO3tx0=;
 b=NAEZICnTUOa/A2OIsBDUule/jfh8yLVfrXZXb0o2YEugNxzBaj/ono/vHd8D2NYk6TIBjwElYWJQJYQdd5TJum7vzhpktU6bitj+MUCactKWd4unUBz/2lV3PQ7aowbAnRWyCGe+2pLVJpgFTlQ/dRHH6MjR6o76lGPvrNz57syKHMSsJe6it1Yxms3c4tBohIX7dryHQUvgGioS8T0ouPdoHb68T6qhqsa0/spPxjUn0rHIYbj7SKjYPcwRXx3rnej5SGlI+gzy8gkEmV5HvvI8lAdobBO3EiURfG56vmAAASFerYBGK43TElHmE9Ws7HwJXMnjlsobV+mtDVnaWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by PH8PR11MB6879.namprd11.prod.outlook.com (2603:10b6:510:229::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.19; Wed, 20 Sep
 2023 10:58:04 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::ed57:a908:f0ad:13cd]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::ed57:a908:f0ad:13cd%7]) with mapi id 15.20.6792.026; Wed, 20 Sep 2023
 10:58:04 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [PATCH V4 0/7] drm/xe: fdinfo memory stats
Thread-Index: AQHZ6ADcPMG7CYBpoEW3b/VAGR1ByrAjkjHQ
Date: Wed, 20 Sep 2023 10:58:03 +0000
Message-ID: <SJ1PR11MB62049F487436D1DAEA74A45181F9A@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20230915182457.3951938-1-tejas.upadhyay@intel.com>
In-Reply-To: <20230915182457.3951938-1-tejas.upadhyay@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|PH8PR11MB6879:EE_
x-ms-office365-filtering-correlation-id: e77415ba-c5fa-4dff-5207-08dbb9c876b3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TS3rbXX2vURn3/aD0DwzpnqEJ+zIj2FOlhLM2RYaYxtFGgvyu3igX9ayNh8sYeUdEiIryhD7yxrlZ9Cddga01mTMc0/xJkZUB0zsx4Bbp0Iusz/iu2gku5+BE6wgX+35/9aVq5zCQB55FsQ45tqIa6zWZcw/T9ib003H9gBjkikBsnnKAO8BAE5yFewkzqiMMk4JvKZPxHVmiocr1nOBeKWWrTuiOcgyvXf7H5RU3cHEAg1NhHVL57UsecM7c8V8z3U6VOpWRf9yAyEbG04AufHXXRgPvZApDb6c4NVBCKJf1fWS/8PwGlCHxNIccSYz4u0juaaAN5mP1iaZ5M8IXVKqSecrsC9AkGOkJ6bskrmNfrRym1pAc2YAxf2ix/4d0D3ID9UPyA1cLeQDsDBotjJv2M7EhHb6OuHMR/TBCmeUIq4qIqD0ZqHuaLvdi2ZhItTbjhVfCbdRr7SUpUQfEORV+vukBB13hIcFA/446H7mJ7DU5lgMDriiz+M+onOio0BehJTXOSUk0WY5wFvUWelXlNbB4HzWDor5w8FVb2fM1RnXOHoKfrNgFnaN2Nl6z6wFeUzLE4hhP0GVzbvnRN06baweACoXz7zz9iLQLlQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(366004)(39860400002)(136003)(396003)(1800799009)(186009)(451199024)(6506007)(7696005)(53546011)(55016003)(33656002)(38100700002)(122000001)(38070700005)(82960400001)(86362001)(26005)(2906002)(9686003)(966005)(478600001)(83380400001)(5660300002)(8936002)(8676002)(4326008)(52536014)(41300700001)(66446008)(54906003)(64756008)(71200400001)(6916009)(316002)(66556008)(66476007)(76116006)(66946007)(107886003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?zLsHQOYf+4wkNWJJTxpdbqrx8cC4EPGIlNRBcJLrl8mgCoN3TTDdybP7asJ1?=
 =?us-ascii?Q?qXt9G4dVGR8z/trIvaJHQhrtYrvrO5CEDLgCEgS0uz+hptF2Z7HyjLAHT0J+?=
 =?us-ascii?Q?OWoQtTFxp/qyAUuewGvq0gY8b5fNJKJkZF5haZVQf12pppxWHGbTuCdmcqXR?=
 =?us-ascii?Q?3Rl2W1LYhJ+aO65jKWLUALUSbtdp1aDlQoAzyYK8Jrdhk6fRiu7cvZXOLNir?=
 =?us-ascii?Q?m1ly1ROPdYPAlNlG+vrjqcwn+8/PzjmQ2wmf77Hg3aY5qokaB1/6qZafMDD1?=
 =?us-ascii?Q?HD55KSYUHLMPi/0MShwSH9GL0Ox9WwjjhZ5/eTKqzkPJaALXDN8uKp2f+Vgr?=
 =?us-ascii?Q?4EzwfJKD+0yKB6XF7GQOAnZkyQfEJTJJ5lnTtFfDp7ZVKgv7vWQ17satKD9R?=
 =?us-ascii?Q?qLaFChfhBpNAM1BGtl2vGcPaBkx+82whHwguQtR2U5XzmESZmYlXldtelFKS?=
 =?us-ascii?Q?vvX3llHgt8ysbzFJ/HoX5dnFrSuUFKxeZdwd27VIqJC9e1STDssZazrCc60l?=
 =?us-ascii?Q?0eXleXjdY9NDJ5hnBknwKtkYUiyir8GAT96tpPBb6jMVrKkGBdZqwDwPoA3I?=
 =?us-ascii?Q?7/pHqvN4415/AsQac6B+uAMpGNLOQmNS485onZslHCXeDS9nAWGk3U9WyLWG?=
 =?us-ascii?Q?cy/yBDcqFgo0Xcwkge4YrtVoEK8rNSkMvGbPuDvXYfbu/HogE3/Mkz/SPqul?=
 =?us-ascii?Q?FB31Vw8B5a5qWYzg5FN0uZmOoekSxdPTZ/iPkt1JJH3Nx/uHvqEqqXPKz8fY?=
 =?us-ascii?Q?fK+vhXSra87Yq05wKJ/7ZBlGrnaxPFVUwUh+bKnHWO3YycRaTBIXqTNx7xBd?=
 =?us-ascii?Q?LwD7a7/bcSd6ypdAqRvQVHQvToGVtrA4+5sQ8dJHUet41t/OIwgB1sXTWoXv?=
 =?us-ascii?Q?iM0THauwJgwfDp/Svz0HsZzhuGLEFioWBgereiJhXKD4HSqDPWkXuYJyHx64?=
 =?us-ascii?Q?xuXPWkWBWnRo4RrsH0YYqgCnAiat4tXINLfbRNqjxD+knYIqSHNOAINCISsm?=
 =?us-ascii?Q?AWSjXWwxJfR1Bz95nkbkg4O0otsZnYkOPdZNR9j+QbYEKAQSwUmXFIL5Ll6H?=
 =?us-ascii?Q?y8Rr9++/ndVWc2EOAsXFurYYGHKY+O3749BvEY6N8D/fVAzIHNS6Zd/0GllI?=
 =?us-ascii?Q?qoEMEwdf0G/aiXIcXtOBwE1GL4gaIIvStXUoPtn20VxSUEr3z/tfV38lFMOO?=
 =?us-ascii?Q?+Ch0XzNekgAUsq7SqP8iecoaEBILYsjWznppwbgOzc4PyBIKz3fzksG7CtHD?=
 =?us-ascii?Q?ZGhugZDD9731K54Hhad5zHqaaR/zUVq/38AA1sOD+MoOZ3h2/3UamD+ibpiY?=
 =?us-ascii?Q?O2T04N8EAjrrVD2KsD1Zj9EoW0zu1qpS53tG5Fv7kkOvPtChiB6zKyApBYbN?=
 =?us-ascii?Q?pWj8RfZHD3GhMZUEigZfXror4YfHkNBNgwD6W02Ys1X9wRz8VfxsHU58yZBT?=
 =?us-ascii?Q?fvTx+c8luE2B50VSon1YkEmrXK23t8+m041knnszSYTPmW1RR/ffGWg6w3fh?=
 =?us-ascii?Q?Pok7PkflcNJdHBBTniaQEBxA9xPd6JIwJLbt0B+r4TNmZQNI5yrZWRAR+KUp?=
 =?us-ascii?Q?eKOYuSWhJQ5Un7FWPHl+skcKkraa966m4LNLTmga?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e77415ba-c5fa-4dff-5207-08dbb9c876b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Sep 2023 10:58:03.8797 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TFqFXySEbUugaRgufkTYvl87T9uBJMRJb1YQKefMTTkAz/0BDb31N7co+Vp0TGeN24DNKAz9mX2DbnuJawt/4UXBOAxUilrfmpUaDVP44e4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6879
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH V4 0/7] drm/xe: fdinfo memory stats
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
Cc: "Auld, Matthew" <matthew.auld@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi I am planning to merge this change by end of this week, please let me kn=
ow in case any comments on this series.

Thanks,
Tejas

> -----Original Message-----
> From: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Sent: Friday, September 15, 2023 11:55 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Iddamsetty, Aravind <aravind.iddamsetty@intel.com>; Ghimiray, Himal
> Prasad <himal.prasad.ghimiray@intel.com>; Upadhyay, Tejas
> <tejas.upadhyay@intel.com>
> Subject: [PATCH V4 0/7] drm/xe: fdinfo memory stats
>=20
> This series enables enables fdinfo memory stats for xe.
>=20
> I added tracking of most classes of bo (user bo, page tables, ring, lrc) =
which
> contribute to client's memory usage. This follows similar lines to what R=
ob's
> msm code and tvrtko's i915 code is doing with some xe way of showing and
> tracking/fecthing objects which adds to client memory stats.
>=20
> Example fdinfo format:
>=20
> #cat /proc/4620/fdinfo/3
> pos:    0
> flags:  0100002
> mnt_id: 23
> ino:    1140
> drm-driver:     xe
> drm-client-id:  19
> drm-pdev:       0000:4d:00.0
> drm-total-system:       0
> drm-shared-system:      0
> drm-active-system:      0
> drm-resident-system:    0
> drm-purgeable-system:   0
> drm-total-gtt:  4 KiB
> drm-shared-gtt: 0
> drm-active-gtt: 0
> drm-resident-gtt:       4 KiB
> drm-total-vram0:        20 KiB
> drm-shared-vram0:       0
> drm-active-vram0:       0
> drm-resident-vram0:     20 KiB
> drm-total-vram1:        20 KiB
> drm-shared-vram1:       0
> drm-active-vram1:       0
> drm-resident-vram1:     20 KiB
>=20
> Testcase: https://patchwork.freedesktop.org/series/123264/#rev4
>=20
> Tejas Upadhyay (7):
>   drm/xe: Add drm-client infrastructure
>   drm/xe: Interface xe drm client with fdinfo interface
>   drm/xe: Add tracking support for bos per client
>   drm/xe: Record each drm client with its VM
>   drm/xe: Track page table memory usage for client
>   drm/xe: Account ring buffer and context state storage
>   drm/xe: Implement fdinfo memory stats printing
>=20
>  drivers/gpu/drm/xe/Makefile          |   1 +
>  drivers/gpu/drm/xe/xe_bo.c           |   9 ++
>  drivers/gpu/drm/xe/xe_bo.h           |  11 ++
>  drivers/gpu/drm/xe/xe_bo_types.h     |  10 ++
>  drivers/gpu/drm/xe/xe_device.c       |  21 ++-
>  drivers/gpu/drm/xe/xe_device_types.h |   6 +
>  drivers/gpu/drm/xe/xe_drm_client.c   | 204 +++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_drm_client.h   |  71 ++++++++++
>  drivers/gpu/drm/xe/xe_lrc.c          |   7 +-
>  drivers/gpu/drm/xe/xe_pt.c           |   3 +
>  drivers/gpu/drm/xe/xe_vm.c           |   8 ++
>  drivers/gpu/drm/xe/xe_vm_types.h     |   2 +
>  12 files changed, 351 insertions(+), 2 deletions(-)  create mode 100644
> drivers/gpu/drm/xe/xe_drm_client.c
>  create mode 100644 drivers/gpu/drm/xe/xe_drm_client.h
>=20
> --
> 2.25.1

