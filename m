Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD69EC41535
	for <intel-xe@archiver.kernel.org>; Fri, 15 Dec 2023 14:50:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77C3610E15C;
	Fri, 15 Dec 2023 14:50:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E682C10E15C
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Dec 2023 14:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702651828; x=1734187828;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=4mf1hjBy+BAOe202Wta3HrYbdjXmZILUSLRdrg3hDTg=;
 b=BamF6fCe4Rd57Av6NlaEkcxs4CA9AZLngPQRZu+1zA4a8K6cgB0t5voi
 9mOWdeJAA75b6erZDr0w+4U5nRUH99owbxV3MhGhrmYwf9owfLZ7WkeKD
 G/FS9ZwqLQGN/XfCZR+jGJ3zGNrYv6Yjp9kPoM7jj56tDqW6byBFvLl3q
 y6VFwyDXlM4zTcWPvWYgdqCaSAlKpgMrDRDAU+1wySzViAUVC0pxvD87z
 euSWc9XUhORCEh212y+A71+WvktFQ5AKj9EFu1vl2vOaREL4QJhbPDMEW
 tdZH1U/1s0riuOOC1IRk/PXrH+/ykk3e7GT+Mg39ac4u2vGHigGlDQC9K g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="374784887"
X-IronPort-AV: E=Sophos;i="6.04,279,1695711600"; d="scan'208";a="374784887"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2023 06:50:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="803728803"
X-IronPort-AV: E=Sophos;i="6.04,279,1695711600"; d="scan'208";a="803728803"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Dec 2023 06:50:27 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 15 Dec 2023 06:50:27 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 15 Dec 2023 06:50:27 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 15 Dec 2023 06:50:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PzgyrDDK8ZoY6ppNO7YZj2LSM4TrujGnvbOxuQ34O5BZ0sy6v3alSwdBWv2rgt5Htqr8Jar66nA7ye9bsjUP6dhcBCkOm1yxxmmgxLwh+cz2Cy/xhJQhHqZ6czq8sPIU/DRS5HjpMw7fuatHX3yvTey3PVo/f62AvKKVX/0F0PUyARgeVEkb7zxbmUHcTW6089a0KX4XnoVRdlv70b3qcCPAGZ66jtSLOVNwHjV4tlWCMPeA425FxvGnqnp9K6tCY96fbcT7ihB5sm+HtO9zICO0HM3T58vL1FooratoFWOpDWP7fv2W3KgQb5094Uv4/8jsmIzxl70grBTjwGS1Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LToOikMDDs+VCrYRPrLTuPLcSYmXDdT1pbLk5SYWRZs=;
 b=ViqAY8FirsCVu/TLEWHo6ft3IjS6XPM9DvEkXsh74hQjeAyFnUuKlYn9cEkscs93am5cNi/upcnbd8ICKzcddQuIn63IZNgbQlbKcBoOnCn1BU5nO8UrgaQ97T1UKS4Lzp+HIHe13hriQ7m3kpqiPFdYnwXG7icURS/9hrspHp3oJ8vEvCMPrNwF3BUXpvzTKWvfbf+2RcvZQaafqJrOitJnEq6ADwnQzImHTZRNuezHGRcc+jNPmhI0sHldJOxL5POvowHYYmd0nOAvlX4KNwORpQ0BaJmA/w/KB0DD801NFBJTl63x26Zk8MLTBnTT1m0fNguhQuX9QXjV5sVP2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by SN7PR11MB8261.namprd11.prod.outlook.com (2603:10b6:806:26f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.28; Fri, 15 Dec
 2023 14:50:25 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::775f:2197:89f9:105d]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::775f:2197:89f9:105d%3]) with mapi id 15.20.7091.032; Fri, 15 Dec 2023
 14:50:25 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: "Kershner, David" <david.kershner@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Fleck,
 John" <john.fleck@intel.com>, "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>
Subject: RE: [PATCH v3 0/3] Add support for XeLink device
Thread-Topic: [PATCH v3 0/3] Add support for XeLink device
Thread-Index: AQHaLg24IY8wUpNrxUCpMNmmme48A7Cqb7vQ
Date: Fri, 15 Dec 2023 14:50:25 +0000
Message-ID: <IA1PR11MB6418A9FFC88A65541BE9004AC193A@IA1PR11MB6418.namprd11.prod.outlook.com>
References: <20231213214525.2584729-1-david.kershner@intel.com>
In-Reply-To: <20231213214525.2584729-1-david.kershner@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|SN7PR11MB8261:EE_
x-ms-office365-filtering-correlation-id: 0d939bf4-ecb2-452b-aa88-08dbfd7d2be8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PZ1RQeZU7Stki1tMJiedQ99ecK6AuDGe7k7tXa/Q1HlFPrrfc2g1OHmHT7ka+C5Slbh296KrzN4lSbGGLqyTUuorlOUAGkQM8NmqjQo7KHP1ZGSyVxxjCDgNlJx8HBMgkMkQL2eAyCPWP/GKEEH4FCQpNl4amN3F5e6V3pJFJGRKtPcD4WI5jdyylAbWtnwZ5QiA5oSTe9hAjl9WvJ/kJgV44E8wWcXGbQeSYtqo4Q5u5p2XWWmzEnqvvjprYRTO4q2JEK6OtpMjeIispYqDYBfizGfd8CZHGlvPI8D5bJ1C0MzOpH0xT03Ii3QtGLTmhijLGa4nzTZ+orXty2TPPbWcoe53V7eO3eq2pbpcPfh9R48ba3mNw0/V3dpJgfBfuLomVcHHnwOPXA84AWhWr/1uXr8WSWr7uS7po7vFziU1+/eUods7fUVn/pPZwD+nVfuG9pYYjgKrC51y4NDXmbBwupvYs3BbrdUZE5HMEeHQ/bKG/zISi85aCzUn+jSf2KWr4q32jA6q1xzAlYxxNU6wFFjU9UnABtIaXq3HpBUawDRkdb5xg70cclRKGlwEo2o2DT523RivFCqGCmS+14XIobf7RVuqFT1j7/wA0lDh9ZPoXjxEuTT/Ix7XBiaVGgiPwGnqW4gkYGaguyCq5A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6418.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(6029001)(346002)(136003)(366004)(396003)(39860400002)(376002)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(33656002)(38100700002)(82960400001)(5660300002)(2906002)(122000001)(86362001)(41300700001)(66446008)(26005)(55016003)(64756008)(66556008)(66476007)(66946007)(76116006)(6636002)(83380400001)(316002)(921008)(38070700009)(7696005)(71200400001)(6506007)(9686003)(110136005)(478600001)(52536014)(8676002)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?SLFk6+ZguYlzoFb5ONYGfxCS0ZkSXE7CDIt7dwLYvRv+/X4M4D16zghNNq/x?=
 =?us-ascii?Q?6avGSdlK/N1Bcax6P2/KrL7r31j1JUt05oeU0iBTqQWk8ElrCh2oYcWKPW4A?=
 =?us-ascii?Q?vr+PacIsx11RgookHh5t7tjUxdMPtf8kaP077WZje+tg8bDl6Sy15ubFPAyG?=
 =?us-ascii?Q?wKGyk5pXFVZZf+JIfyqzjD6BEJFXU4As1znqxEFsz2eTE8E/jPN8NREsIPon?=
 =?us-ascii?Q?SUkHe0ifxGYx95I57FEvBDXl3fBMA76AYyYYiBm9wo3lreCKk1+Yh7BZ9oBS?=
 =?us-ascii?Q?ftQNDkFT58dVqb6efV6XVGohIt/FuvwBie/3Blx5MqohTR9jHLCvgGPxvyyd?=
 =?us-ascii?Q?C1nqrhmlwki/WVBvuDU+Lc/bJEpPAIzmW9EEfe7IAE7t5VxPBWQGEIyMQUPi?=
 =?us-ascii?Q?qitjcMO+pvMigBpkLTcsCleJDIpf06ktpwqeNhWDKsy26U+LKcgJlNzAheFY?=
 =?us-ascii?Q?6xBImLZ4XXvtJG8nPTCfq2qFd6EAPq0OL/HMcjxhevLYLkGO2kvOQUP5bgk9?=
 =?us-ascii?Q?CDwcq8mciyBPQZSIc49F+8SeRUkYi4vFnpQH/1iKk0goiHASUkjbnmBN6Krs?=
 =?us-ascii?Q?7Q2xxEBTJLJP85n6v/wetCjzH0/IMsQ6FvUCE1Fa8rNoRbADcc83fbtX+pKW?=
 =?us-ascii?Q?cdc0R9mOFShF3tnHr8B/wiZip+OtfFU1BQIJCpiJ14DFAEfQrqyiiBSBr2/1?=
 =?us-ascii?Q?IiYcpVQ5lTVGkVA06fEevNla3rppMUn5nleBWRIND9KglTlOBUtLO2GuWVhO?=
 =?us-ascii?Q?07c99sO2k3CClSz/1+kOBPWrfZBh9Ile4nlwT5gw6pS4bpqt5jr5l4RdUMrk?=
 =?us-ascii?Q?GcvzubVZjuNyXm/1lG8wReeRb94kTtz7+lIJW4wu/pqrJir8B/L6w2tFTB9U?=
 =?us-ascii?Q?OOURrRtDfYaBEB6B+cAMpcFm5p5dtI2lcSJB2BF5l8gw/WXjr0zRwZ8BUxmP?=
 =?us-ascii?Q?5ZYNoSEZgH8/TtidzA0owy2Me8zc75RnltplNosihATPZqXvu5a65qBHPG41?=
 =?us-ascii?Q?dfS9YWCBixqcrw1AR8T2bca36HSYg+JYDYQZOdQG/3SYM3WyXyp+SYF4W89L?=
 =?us-ascii?Q?9jREAWKi4qXvcWRyCv0M81EaFGA5s4/a5tTQhcQQp2KyipV651/ahbZaJc7s?=
 =?us-ascii?Q?EV5bXq4mS4O8jbWDt3Q9g90LnD+IOqLskKeB/9gcTVzHZwswESKkLfaweizL?=
 =?us-ascii?Q?nm09s9w5uGO72ohwgEhX8Bi//c38iYZSxefwK04oaYkOkLI3l/vX71LRCt2d?=
 =?us-ascii?Q?NoEQHhhWigHFioSFx3gh0rmhszByvgJipqrJ6VMh7Qxty9iE7h61AbTmmRfT?=
 =?us-ascii?Q?sWLB2Odx8XRh/lgcvNjfBOA3iARHVf9IQPpVT80UiJNSsMviDJxtFXIAoFDe?=
 =?us-ascii?Q?lukKaalrIJWHq5y/bzRbnkRxZByOe9hmrkgfVg6Z2knV/a3wbXQGsd0fhlum?=
 =?us-ascii?Q?QzpQMRJdSIILzyvVaQyFyZHgAbXfJXVVKVKUWBNSPBHLGXT1a/EqRjSF8Iuo?=
 =?us-ascii?Q?k6XNIgNnZWKaPIhVaTs2rywY8HoamBJkIuQE1wt068Qyk4FcSjK2sOeJTNB0?=
 =?us-ascii?Q?mK3x46g+ID1D3CMvityZWWp0yNeG2euSZgh1UCrZ?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d939bf4-ecb2-452b-aa88-08dbfd7d2be8
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2023 14:50:25.2254 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sHVfsvoK7AaR0Zz4W3IZ2XKHVV0/mkbyomNtgk2ig5eKAzBmiV1PSVopHLKePpsxFJn4cuIWzFg978ca5u3cOGBe4C3o3Gc4kOOHi7eXcB4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8261
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

>-----Original Message-----
>From: Kershner, David <david.kershner@intel.com>
>Sent: Wednesday, December 13, 2023 4:45 PM
>To: Kershner, David <david.kershner@intel.com>; intel-
>xe@lists.freedesktop.org; Ruhl, Michael J <michael.j.ruhl@intel.com>; Flec=
k,
>John <john.fleck@intel.com>; De Marchi, Lucas <lucas.demarchi@intel.com>;
>Vivi, Rodrigo <rodrigo.vivi@intel.com>; Roper, Matthew D
><matthew.d.roper@intel.com>
>Subject: [PATCH v3 0/3] Add support for XeLink device
>
>First patch set introduce the needed Xe infrastructure to support
>XeLink device.
>
>The XeLink device is a glue-less module attached to a GPU device that
>provides connectivity between different GPUs on the same system.
>
>The XeLink is part of the GPU (the register space is part of the GPU
>PCIe BAR), so it cannot be a completely separate device driver.
>
>The Linux kernel provides an interface for handling this type of
>device, the Auxiliary Bus API.
>
>The Xe and XeLink will use the auxiliary bus to enable the XeLink
>and the Xe to probe and communicate.
>
>A followup series will include the XeLink driver code to provide
>full functionality for the device.
>
>Changes from version 1:
>	- Fix kernel-doc error
>Changes from version 2:
>	- Fix up rebase conflicts

For the series:

Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com>

M

>David Kershner (3):
>  drm/xe: Introduce XeLink device
>  drm/xe: Teach Xe how to use objects with XeLink connectivity
>  drm/xe/uapi: Augment query ioctl to allow for fabric
>
> drivers/gpu/drm/xe/Makefile          |   1 +
> drivers/gpu/drm/xe/regs/xe_gt_regs.h |  30 ++
> drivers/gpu/drm/xe/xe_bo.c           |  45 ++-
> drivers/gpu/drm/xe/xe_bo.h           |   2 +
> drivers/gpu/drm/xe/xe_device.c       |  13 +-
> drivers/gpu/drm/xe/xe_device_types.h |  25 ++
> drivers/gpu/drm/xe/xe_dma_buf.c      | 208 ++++++++----
> drivers/gpu/drm/xe/xe_dma_buf.h      |   3 +
> drivers/gpu/drm/xe/xe_ggtt.c         |   3 +
> drivers/gpu/drm/xe/xe_gt_types.h     |   2 +
> drivers/gpu/drm/xe/xe_irq.c          |  22 ++
> drivers/gpu/drm/xe/xe_link.c         | 461 +++++++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_link.h         |  38 +++
> drivers/gpu/drm/xe/xe_mmio.c         |   3 +-
> drivers/gpu/drm/xe/xe_pci.c          |   2 +
> drivers/gpu/drm/xe/xe_pci_types.h    |   1 +
> drivers/gpu/drm/xe/xe_pt.c           |   2 +
> drivers/gpu/drm/xe/xe_query.c        |  54 ++++
> drivers/gpu/drm/xe/xe_trace.h        |  29 ++
> drivers/gpu/drm/xe/xe_ttm_vram_mgr.c |  17 +-
> drivers/gpu/drm/xe/xe_vm.c           |   3 +-
> include/drm/xelink_platform.h        | 140 ++++++++
> include/uapi/drm/xe_drm.h            |  26 ++
> 23 files changed, 1057 insertions(+), 73 deletions(-)
> create mode 100644 drivers/gpu/drm/xe/xe_link.c
> create mode 100644 drivers/gpu/drm/xe/xe_link.h
> create mode 100644 include/drm/xelink_platform.h
>
>--
>2.38.1

