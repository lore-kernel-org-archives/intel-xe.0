Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 056FECDB474
	for <intel-xe@archiver.kernel.org>; Wed, 18 Oct 2023 02:56:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DB1710E35B;
	Wed, 18 Oct 2023 02:56:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F84B10E35B
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Oct 2023 02:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697597811; x=1729133811;
 h=from:to:subject:date:message-id:references:in-reply-to:
 mime-version; bh=oltk+EALFsXSA2jfr5dzYscR9F0UjvlAjzrgI8pa8dY=;
 b=fr7wybOxDQ6AWsuaXNFnUzfaNNryqObM4NRXUXiRxYVvOlF7tFt6uoSx
 oJbpH6ps2dbD0oXZ1eEzYAA5ZLOd0mWjH7OA731GXzUEyAffBk9PveImk
 zmkH+fzfQ2OAe0fipXhiyITWiHN+KeVtlseWVlffBjz4pNrLqRA4ucaB2
 26L2FwMdNRrigcz7TFacegSlNLZdqZqgA//1HDSbPDYFUzvPqhWY1TSK8
 zXbv7JXjO4kjMcSGPu2lsREaBgzAnC54IgUt15cCbgm/k+X2vAUl+XwRn
 tlZi2JuBYQ90LF/F7DyMP8vhK0L+o9BcoWlGiFxmS4+wou37FojErmmNO g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="370986855"
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; 
 d="scan'208,217";a="370986855"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2023 19:56:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="847061976"
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; 
 d="scan'208,217";a="847061976"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Oct 2023 19:56:49 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 17 Oct 2023 19:56:49 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 17 Oct 2023 19:56:49 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 17 Oct 2023 19:56:49 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 17 Oct 2023 19:56:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AWvAc8nH17fzUkpTfUm0/T7wEUNOUVnQ31twxVc9H/fD+PI/d4qWh13ICOmwRPSSJt811DaR7dkKIPG4TIG7tQv/KPEuPa5PnZ0RYP1TvdBbI4tYzXlwN84XdeNs24hn9qrYoCpGzRvtQN9DjvUjsbNVyLFPw/fGC9Ow3M/DI+A3Fx7Rw7ziqx+SdWibxJ8IwGX+bncKmuvibO0h0uTFgV3pBqRTqZoRineYwziLmEJKDcEHI6rdEoJIp2t4jMIlfUGSV/1k+ElgwfIUrjfn40mNMI9nB8mgfknRlOo5GlsKqHBpR0WnhB1zR/IDzCbc0+zrr1iSruqeYDo296wNgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=toGOpqbrTsK/WXNMoi6HRP75X30TEhOcsr9g8GWkeZg=;
 b=KsyWIMz6J9jIAFRyudaBzAKXA0OtMELgBRIFbVhKHOxo8xiV9YmJRDKQdLEAfgrfz7XESp2v+89eUmU2P1VUJghUDAFBTsu8TsJhOgK71RfEnCXTpTaF6jj1/eACIyzL2CzVzWtdDLPqWBm4IqNlh6zoRRedgXXpybpfl6TB9dzSu7CLGmPlcEP05/l0IMcrLg56vdGJelaalpQzT2ov/LqP9ZQd7FM33c3mws1VWTkAobKnODDJ/frtraIaB7tYVO6OcCjs0YZElkZO9YTKLu18BlRgRmHy4fZOzfCkQ5cGea/TGrajzKYqGqpLmPegZKjFzJZIvjoGPezokjTPcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by PH0PR11MB4917.namprd11.prod.outlook.com (2603:10b6:510:32::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Wed, 18 Oct
 2023 02:56:46 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::163d:1c68:1eeb:3514]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::163d:1c68:1eeb:3514%7]) with mapi id 15.20.6886.034; Wed, 18 Oct 2023
 02:56:46 +0000
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [PATCH v8 00/10] *Supporting RAS on XE
Thread-Index: AQHaAWyvg4yO3P3j+EW/TIHB7ZkDk7BO2mbR
Date: Wed, 18 Oct 2023 02:56:45 +0000
Message-ID: <MW4PR11MB7056BCC18405A0C3FF1B40B3B3D5A@MW4PR11MB7056.namprd11.prod.outlook.com>
References: <20231018024838.1223255-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20231018024838.1223255-1-himal.prasad.ghimiray@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB7056:EE_|PH0PR11MB4917:EE_
x-ms-office365-filtering-correlation-id: afdf8a03-cc96-4ebb-c66b-08dbcf85dd73
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5cyc1NmmDXZ9V7fjqlmGFjOWapxOPIj668X+X6YKbvrenpwxUmVFUYbFhsaOWJGHQh84vb4OhCKozriZZaFIuR+3B4ITxGLr2F0Y6r6gdbX24Vg6lO4iRO/5hGdR9CFV8aCfFWuOqCf4l+bRqrQ8MhMMmTGaYCZvnITPsJ9w7My6ST9Mi6vRZB5aaUtFRJtHhHvTSSytUGKPoqfG70iVx5xdTr99h1iH/8R7PReUwei26iTspK8i/xCJNOOKa5ViFSUlsWn+6ap+JCgG/dkeBk3Ywo9X9bQdMON+rCpEHaxjEB3emKvDpJFvpsICXBWIBZ6scQ9NRcMHF8J9hqWb35EvxkBuPRw65ib4L4tkeKhvgXRwzFeugUfnYwLhBBQnX1AMw6/D6w16IU2DfSQUxiuSusIyQKYDnlZdcWX60ID7rOhyCG7wrL9VD2OHGSfOZXkU2fPdvNg8lEvXrM4h074vporzAaT8g+U2en09yN0QI+D/vmNLs1A1IEgh3jvKTO876qBR4ZFJHS/UCt5IZsNCQ5GIQj+eee0YqRW9ZTUHHIV0QEn3dEPXbFdGUPdixoJZP38Z8CH65XGsvBFeezgstn3gji4ey1SQeZqwDFpA60fLZT1fcH3eFlFVKuHRNbtKKbNiXabgcRSASrggwA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(346002)(376002)(396003)(136003)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(71200400001)(76116006)(66476007)(64756008)(66946007)(66556008)(316002)(66446008)(966005)(6916009)(478600001)(7696005)(6506007)(53546011)(26005)(8936002)(2906002)(52536014)(41300700001)(9686003)(5660300002)(38070700005)(122000001)(33656002)(8676002)(86362001)(82960400001)(38100700002)(166002)(83380400001)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Lo3laSjgb+G4Z1mgzp3NL1E1XPVHvkLQsnlww+dZUJao346KjzFiuo6EcevD?=
 =?us-ascii?Q?G5ImNvQ47JLs3jKOh2jkVuJ6A5cE2kOjDwRFzEp4yWELG4JSp3gEVTE0qRTu?=
 =?us-ascii?Q?xwksggLREWODz7461f0MGcHZXSy6qSbUuuAM39Yo4D1UDlZ3jPmnmn10EJAG?=
 =?us-ascii?Q?V1v8pA2TX4DRUiI3bN2csSf/Yuq8EyhpudVIJrtG5GyKQf21KyRcrSy0xKr7?=
 =?us-ascii?Q?HtPjKxkJ4e3EttoWBlbN6NO3bed4OG35uo2a8SqDg6joa178QJ8aDdXJa9LQ?=
 =?us-ascii?Q?qi/ApP+V30D3irMoAAZ1WqLI/ZxveZs8HnAoYaTXsCuTIhXJpcz0+fuBfxrU?=
 =?us-ascii?Q?ydjk0rEZoKMraq2wmzqgJYOoTym3lGQ/OHTXjV05mJNwFUIjBOWAmwsubqDj?=
 =?us-ascii?Q?n0BzY8LoBblIQNpJA471FOqA8lDda22m1DpGHPcd1xsqG1M1IN4vq7JlcQTb?=
 =?us-ascii?Q?aIICy5vEO9C6HquJNQI0WZox35vamv4hKJgaevOKtJL3O9N4oBzt2kvZNHcl?=
 =?us-ascii?Q?UpL6TvnIDN0aDT7S4jlc3qRVrK7ySHTphFH7z9Xp17NsGPRW6bz68NhtyV9U?=
 =?us-ascii?Q?QyFSK/yWcG4vllukB3UJBXpN2yM0nLJq2XZNdX06Iou326Or+YUwTqVK0K8+?=
 =?us-ascii?Q?+AGUpJg5Zvuw7vLQnndyXycdbqG9kbGDbYmD09recgiUY41GX9NRDSIzdHh/?=
 =?us-ascii?Q?hiP6L/sYyrEB3+wYD6FvZuwYzZHfLN3AoflbpJdzPFqRupn9wEjIyJ4gSjJu?=
 =?us-ascii?Q?ZPnfEOgdSl1j3otb67opQSfh14GGmxB8hqP1kv6T9dXcwzejtwKPnz9Hh79g?=
 =?us-ascii?Q?EgSiw5ObBYFs2nJy2U/KhRGewL3cNWJsOatGmXkB8rV473Kif80PeteDIGo3?=
 =?us-ascii?Q?fLDRn5KEBora6gsvDYKGpWALzysSYBB/Q6IzWbbsmxOGGKwoPyqnes2BdOBM?=
 =?us-ascii?Q?OslsYcqgHHJMQQ0peHwBUzLZAwxOOAqOZo1G7CoSxOMh2+QLVU07Jqx1+bvH?=
 =?us-ascii?Q?dmL/bcU7/mMozjHoWAebnuecbFO87wMkYZ7kQORLScFoP0+6VHgAsYOV4dBU?=
 =?us-ascii?Q?T3giFJUMOXVU5cIhL0r7nw3OX3PDAPNUXKPeL+ellIkxutQ/j+Zk3yFdcv2w?=
 =?us-ascii?Q?rt8rnthWURXItldQMpDWSvd0atBZOYcR0NP0xfUyKwb8yHwsNKxLTNpvBglV?=
 =?us-ascii?Q?OqGxVD0hGs4MeEMBsCQBSNEjn0Zyw8UGv7OAa7hnaU+0pTUDBr1t5jax+P80?=
 =?us-ascii?Q?3fV56wD5PFxg28vXr0aRtXGreY4EzSdlNmQ/Gv2zCrDh9D54NDFDwxfsPQCx?=
 =?us-ascii?Q?Hake8myvbFiqqET4kQwWsJkQYrcU9zWInmBn+XBVWMXfSfZHNxEToGwZns/d?=
 =?us-ascii?Q?NCfRTwTpBbIyZlxbj2+g7BxTPHBfdTan7EK1ArY+yGzogc8nkfkAzwAarab3?=
 =?us-ascii?Q?e3SvsTagySHy++mIMYJYXPSlk/QqwXb8H7bkvVofvN5LnlxODnSsItmejMg+?=
 =?us-ascii?Q?ofCj7bFPdbflmbmwTWHpEtpDa+vSpdq/Q7TK8MDhQ6ZOwVpuh8/HM5sSSeHd?=
 =?us-ascii?Q?Tw1UslbmiS9kkUOj2PAiM3xJ4AUekKvk2ekLAD+AEvLw6jCAIW2fQaEVkzOM?=
 =?us-ascii?Q?gEtnmdtdgF6E1aNgnX6n3d8=3D?=
Content-Type: multipart/alternative;
 boundary="_000_MW4PR11MB7056BCC18405A0C3FF1B40B3B3D5AMW4PR11MB7056namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afdf8a03-cc96-4ebb-c66b-08dbcf85dd73
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2023 02:56:45.5855 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VS1MyVmfV6wbCpywvyFYjXOjeP4Q+6ndISgFbyS1Gyet+tvooMSsKSt2RaxMZka09QENUS0gm1hi3nkh66a4LqNeScO5yb/b/AZcgmsTg14=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4917
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v8 00/10] *Supporting RAS on XE
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

--_000_MW4PR11MB7056BCC18405A0C3FF1B40B3B3D5AMW4PR11MB7056namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Please ignore this.
Will resent with fixing the Subject.
________________________________
From: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>
Sent: Wednesday, October 18, 2023 8:18:28 AM
To: intel-xe@lists.freedesktop.org <intel-xe@lists.freedesktop.org>
Cc: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v8 00/10] *Supporting RAS on XE

Our platforms support Reliability, Availability and Serviceability(RAS).
In case of hardware errors, our hardwares provides the causes via
sending interrupt or pcie errors. The fatal errors are propogated
as pci errors and non fatal errors as MSI. This series focuses on
loging and updating counters for these errors, which will be  helpful to av=
oid,
detect and repair hardware faults.

This [1] series proposes mechanism to expose this counters to userspace.
[1]: https://patchwork.freedesktop.org/series/118435/

The error counters  exposed by KMD will be used by L0/sysman
They will be categorized to specific category of error in sysman:
https://spec.oneapi.io/level-zero/latest/sysman/api.html#ras

We have very limited capabilities for error injection to validate the
code flow.
Output of L3 fabric fatal injection from PVC is:
xe 0000:8c:00.0: [drm] *ERROR* [Hardware Error]: TILE0 detected GT FATAL er=
ror bit[0] is set
xe 0000:8c:00.0: [drm] *ERROR* [Hardware Error]: GT0 detected L3 FABRIC FAT=
AL error. ERR_VECT_GT_FATAL[7]:0x00000087

v2
- Use different headers for error registers. (Nikula)
- Correctable errors shouldn't be considered as dmesg errors (Matt)
- Limit series to HW errors.(Aravind)

v3
- Rebase

v4
- Use xe_regs.h only for registers, move enums out of it.
- Make sure global data/structures are immutable.
- Avoid adding custom error logging macro's.
- Redesign the registers error name and counter index
structures for maintainability. (Nikula)

v5
- move struct hw_err_regs out of CONFIG_DRM_XE_DISPLAY.

v6
- Addressing Review comments from Aravind.

v7
- CI fixes.

v8
- Conditional check fixes.

Himal Prasad Ghimiray (4):
  drm/xe: Handle errors from various components.
  drm/xe: Log and count the GT hardware errors.
  drm/xe: Support GT hardware error reporting for PVC.
  drm/xe: Support GSC hardware error reporting for PVC.
  drm/xe: Notify userspace about GSC HW errors.
  drm/xe: Support SOC FATAL error handling for PVC.
  drm/xe: Support SOC NONFATAL error handling for PVC.
  drm/xe: Handle MDFI error severity.
  drm/xe: Clear SOC CORRECTABLE error registers.
  drm/xe: Clear all SoC errors post warm reset.

 drivers/gpu/drm/xe/Makefile                  |   1 +
 drivers/gpu/drm/xe/regs/xe_gt_error_regs.h   |  29 +
 drivers/gpu/drm/xe/regs/xe_regs.h            |   5 +-
 drivers/gpu/drm/xe/regs/xe_tile_error_regs.h |  65 ++
 drivers/gpu/drm/xe/xe_device.c               |  14 +
 drivers/gpu/drm/xe/xe_device_types.h         |  21 +
 drivers/gpu/drm/xe/xe_gt.c                   |   1 +
 drivers/gpu/drm/xe/xe_gt_types.h             |   7 +
 drivers/gpu/drm/xe/xe_hw_error.c             | 919 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_hw_error.h             | 210 +++++
 drivers/gpu/drm/xe/xe_irq.c                  |   9 +
 drivers/gpu/drm/xe/xe_tile.c                 |   1 +
 include/uapi/drm/xe_drm.h                    |   8 +
 13 files changed, 1289 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/xe/regs/xe_gt_error_regs.h
 create mode 100644 drivers/gpu/drm/xe/regs/xe_tile_error_regs.h
 create mode 100644 drivers/gpu/drm/xe/xe_hw_error.c
 create mode 100644 drivers/gpu/drm/xe/xe_hw_error.h

--
2.25.1


--_000_MW4PR11MB7056BCC18405A0C3FF1B40B3B3D5AMW4PR11MB7056namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body>
<div dir=3D"auto">Please ignore this.&nbsp;</div>
<div dir=3D"auto">Will resent with fixing the Subject.&nbsp;</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Ghimiray, Himal Prasa=
d &lt;himal.prasad.ghimiray@intel.com&gt;<br>
<b>Sent:</b> Wednesday, October 18, 2023 8:18:28 AM<br>
<b>To:</b> intel-xe@lists.freedesktop.org &lt;intel-xe@lists.freedesktop.or=
g&gt;<br>
<b>Cc:</b> Ghimiray, Himal Prasad &lt;himal.prasad.ghimiray@intel.com&gt;<b=
r>
<b>Subject:</b> [PATCH v8 00/10] *Supporting RAS on XE</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Our platforms support Reliability, Availability an=
d Serviceability(RAS).<br>
In case of hardware errors, our hardwares provides the causes via<br>
sending interrupt or pcie errors. The fatal errors are propogated <br>
as pci errors and non fatal errors as MSI. This series focuses on <br>
loging and updating counters for these errors, which will be&nbsp; helpful =
to avoid, <br>
detect and repair hardware faults.<br>
<br>
This [1] series proposes mechanism to expose this counters to userspace.<br=
>
[1]: <a href=3D"https://patchwork.freedesktop.org/series/118435/">https://p=
atchwork.freedesktop.org/series/118435/</a><br>
<br>
The error counters&nbsp; exposed by KMD will be used by L0/sysman <br>
They will be categorized to specific category of error in sysman:<br>
<a href=3D"https://spec.oneapi.io/level-zero/latest/sysman/api.html#ras">ht=
tps://spec.oneapi.io/level-zero/latest/sysman/api.html#ras</a><br>
<br>
We have very limited capabilities for error injection to validate the<br>
code flow.<br>
Output of L3 fabric fatal injection from PVC is:<br>
xe 0000:8c:00.0: [drm] *ERROR* [Hardware Error]: TILE0 detected GT FATAL er=
ror bit[0] is set<br>
xe 0000:8c:00.0: [drm] *ERROR* [Hardware Error]: GT0 detected L3 FABRIC FAT=
AL error. ERR_VECT_GT_FATAL[7]:0x00000087<br>
<br>
v2<br>
- Use different headers for error registers. (Nikula)<br>
- Correctable errors shouldn't be considered as dmesg errors (Matt)<br>
- Limit series to HW errors.(Aravind)<br>
<br>
v3<br>
- Rebase<br>
<br>
v4<br>
- Use xe_regs.h only for registers, move enums out of it.<br>
- Make sure global data/structures are immutable.<br>
- Avoid adding custom error logging macro's.<br>
- Redesign the registers error name and counter index<br>
structures for maintainability. (Nikula)<br>
<br>
v5<br>
- move struct hw_err_regs out of CONFIG_DRM_XE_DISPLAY.<br>
<br>
v6<br>
- Addressing Review comments from Aravind.<br>
<br>
v7<br>
- CI fixes.<br>
<br>
v8<br>
- Conditional check fixes.<br>
<br>
Himal Prasad Ghimiray (4):<br>
&nbsp; drm/xe: Handle errors from various components.<br>
&nbsp; drm/xe: Log and count the GT hardware errors.<br>
&nbsp; drm/xe: Support GT hardware error reporting for PVC.<br>
&nbsp; drm/xe: Support GSC hardware error reporting for PVC.<br>
&nbsp; drm/xe: Notify userspace about GSC HW errors.<br>
&nbsp; drm/xe: Support SOC FATAL error handling for PVC.<br>
&nbsp; drm/xe: Support SOC NONFATAL error handling for PVC.<br>
&nbsp; drm/xe: Handle MDFI error severity.<br>
&nbsp; drm/xe: Clear SOC CORRECTABLE error registers.<br>
&nbsp; drm/xe: Clear all SoC errors post warm reset.<br>
<br>
&nbsp;drivers/gpu/drm/xe/Makefile&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; =
1 +<br>
&nbsp;drivers/gpu/drm/xe/regs/xe_gt_error_regs.h&nbsp;&nbsp; |&nbsp; 29 +<b=
r>
&nbsp;drivers/gpu/drm/xe/regs/xe_regs.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 5 +-<br>
&nbsp;drivers/gpu/drm/xe/regs/xe_tile_error_regs.h |&nbsp; 65 ++<br>
&nbsp;drivers/gpu/drm/xe/xe_device.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 14 +<br>
&nbsp;drivers/gpu/drm/xe/xe_device_types.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; |&nbsp; 21 +<br>
&nbsp;drivers/gpu/drm/xe/xe_gt.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&n=
bsp; 1 +<br>
&nbsp;drivers/gpu/drm/xe/xe_gt_types.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 7 +<br>
&nbsp;drivers/gpu/drm/xe/xe_hw_error.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 919 +++++++++++++++++++<br>
&nbsp;drivers/gpu/drm/xe/xe_hw_error.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 210 +++++<br>
&nbsp;drivers/gpu/drm/xe/xe_irq.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; =
9 +<br>
&nbsp;drivers/gpu/drm/xe/xe_tile.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 1 +<b=
r>
&nbsp;include/uapi/drm/xe_drm.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nb=
sp;&nbsp; 8 +<br>
&nbsp;13 files changed, 1289 insertions(+), 1 deletion(-)<br>
&nbsp;create mode 100644 drivers/gpu/drm/xe/regs/xe_gt_error_regs.h<br>
&nbsp;create mode 100644 drivers/gpu/drm/xe/regs/xe_tile_error_regs.h<br>
&nbsp;create mode 100644 drivers/gpu/drm/xe/xe_hw_error.c<br>
&nbsp;create mode 100644 drivers/gpu/drm/xe/xe_hw_error.h<br>
<br>
-- <br>
2.25.1<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_MW4PR11MB7056BCC18405A0C3FF1B40B3B3D5AMW4PR11MB7056namp_--
