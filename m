Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71089CA0EC1
	for <intel-xe@archiver.kernel.org>; Mon, 11 Sep 2023 21:13:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A0E810E1E5;
	Mon, 11 Sep 2023 21:13:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB15810E1EA
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Sep 2023 21:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694466778; x=1726002778;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:to:cc:date:message-id:mime-version;
 bh=udq7dCzMF66j1uRQ4zIbUttg0U0C70NVkDuvGHFwNq8=;
 b=Tncm0OdpGNpzTTgLX6EXl/5QIt9eSKuRsFAOiobpIqmbuoULjqlr6C0B
 fEtxDSRRaAMFTKFYHM10fcX1RhT0Q5Oca72wahKNpTGXIF3+49CyNVHn7
 mvfdLyctGANVOSB+g1b30unJ7WzDsfmnaWJFqcN69xcS8FerIHUkipYCN
 l0rducPlCQGaBxT1P2HfFrKz/T3RvVji7HgsXIFT7mODE3tNV6VAWXSC9
 AOOPH4Bq1kym/kG5sFcPx+RKHeuMz9UudBuRVygRwxHVMpwFjUs17S7/S
 uvObx852gsMq67wkojQTg3ZNbshG6cy+md4xfx9LpYXm6OE6ZEYPcKkRz A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="358485432"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; d="scan'208";a="358485432"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2023 14:12:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="1074309107"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; d="scan'208";a="1074309107"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Sep 2023 14:12:57 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 11 Sep 2023 14:12:57 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 11 Sep 2023 14:12:56 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 11 Sep 2023 14:12:56 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.44) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 11 Sep 2023 14:12:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LihozD5wk7QwsQWvmD3Ef3sJ9wm8lLo1l10TN9IEQTXQi7pqP1EXBKwA8B53ycHHsgQDTYM/Q4n7RzXmL2K59jPDrfmWyRyqjoE4TKPiPy5pW1+s0RMx2UcgtTEduZVQHiT7h4taF8wWfQ4PsCP63C3IhP84dMcmnRm9xr4i5bzy5DgOsEo5mPMVSSpbsSdEB6kE74FARZ5BQee+oDwIp14519B3A90FhEn6cbp5pxw2PSFzCvw8CYRMrjZ0Z/5a9oor4lCXHyqxRz4gJ8BsW7endoVMIJQLb+mqQ6x3Kcw4ZTRPNYI2ucMd2EcYrygFbUzLKy/AtD3QRbItFtZBRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LXmWMXopGZhH5DLS0UltEznkUKU8ClB3xJtaTIcZPmI=;
 b=EZXzG1A1h5XnPUkklv+FMMaHalayJB4g5/qfpbme4uvHYokfz9wD/C6fhC2HC2F/LSU1f8g2bo/1hms7HvxBL1rli1sBZIqcTJgEDAl0bT5pWkXBNTdpTlqJNWQHCMxyjmmCYj6OtpKZ2AI4VQ2yKibIi2vVIfBI3wBY525keZZCk2kivXHTS7vUYbZFjq5ItNP/CQ/sZw5bp/VBNXCeNByay2vzxslqlYiXjGh0639d9c3MaZJ39T7pYwsgGEs4ikjHxUHmR956sdaW1NAsARdMNBjSkGxTzZVB04IjzLkpOyma/jOb2OgSemJRdFahe/TDtLnl7hB5iA5yiXut0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN8PR11MB3556.namprd11.prod.outlook.com (2603:10b6:408:8d::31)
 by CH0PR11MB5522.namprd11.prod.outlook.com (2603:10b6:610:d5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.35; Mon, 11 Sep
 2023 21:12:54 +0000
Received: from BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::d89f:e7e6:dbb3:3ddf]) by BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::d89f:e7e6:dbb3:3ddf%6]) with mapi id 15.20.6768.029; Mon, 11 Sep 2023
 21:12:54 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <169446500395.31367.111071769261433416@emeril.freedesktop.org>
References: <20230906212333.61119-1-gustavo.sousa@intel.com>
 <169446500395.31367.111071769261433416@emeril.freedesktop.org>
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Patchwork <patchwork@emeril.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>
Date: Mon, 11 Sep 2023 18:12:46 -0300
Message-ID: <169446676691.19625.13875821903519677934@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: BYAPR06CA0049.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::26) To BN8PR11MB3556.namprd11.prod.outlook.com
 (2603:10b6:408:8d::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR11MB3556:EE_|CH0PR11MB5522:EE_
X-MS-Office365-Filtering-Correlation-Id: 141850d3-d0c3-458d-1a0d-08dbb30bdd46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ogq74q0n0y+4PurzR85/SgFPh1OsEw/8n+XK7Frfpvy94tzF1nRRwg2EGtZRJz+lvvdwThbWVUSCd/2ge8LVJlK5FY++7PpD6pVayuLBuixNXiS7oobRutFThbQirndSpfCtswZky9Jq/Mh7xil4zC4tTCJZuOi9mD/bf5Ac1Tdcwb+qWHwkkXO3LSjfEjGhix9KwS/jlRCquNSK7UkdXBMLx6M9HtrJGfkZYrEAIBeuyQKzyiP5lI8v0aDZzOC3klx69YFTKFLts4MgZ+MT/QsbEtuhdWDsVSKwTgRLG1rhZbw4Nj8BxLVltw9p799DoU1Q4qULJs4CSr73BV/5xVi+RArvt6Wa6mvd/iftme4p1MrhGfrkcnuk/RgdamKgVMauB5rjkE4SQLC48Wy/zLNvivADnJg8cAxzuprYK3DPWCK4RJ8lfv/ThttrSZfWwjDK8jUJotkBEVdI78SNvH+Tai8QTMQ6Hvtlpl7j0JnU1F71zaolSf3LsakbbeDDPK0Qz506of/wpP2b52NuXNx8ZTG/LaEDaF1ms72ER8ecpfb5X654mZYiUq0aUNmT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR11MB3556.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(39860400002)(366004)(376002)(346002)(396003)(136003)(1800799009)(451199024)(186009)(4326008)(8936002)(5660300002)(41300700001)(44832011)(66476007)(316002)(66946007)(66556008)(33716001)(38100700002)(966005)(478600001)(6666004)(9686003)(26005)(6486002)(86362001)(2906002)(107886003)(83380400001)(6506007)(6512007)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VUlQYk5RRzdpVDRUS0tzT0ErQlBWRnJNSktDclJqaUkwNVlCRllHKzV0U2l0?=
 =?utf-8?B?ZXhaZ0FXVUU2NEhiSDNaNHM3UXAxM3dPNXM3NFVSZk1tWmRwcjZlQW9Pa0Nv?=
 =?utf-8?B?V3EwOTZPQ05BN2owT2Q4R1pqVE85UlFJUEtSV2VGaGlnem5xYzJnTTBJU1Uy?=
 =?utf-8?B?YUViazg5dFpIRmRCRXFHTXYxNStLZFVtT2ZRRDRCVHN5aWRHc042dkN4OGEr?=
 =?utf-8?B?cUxjNmxIYVpNT3pYcjIra2VpWWcrQ2ZOYkpoOHdId0JvaTZ3R2syTXpkcVh6?=
 =?utf-8?B?QlFualNwang2SUllRklNVFpTTElBTFpxMGJLM3VSb28rTDgweTVBcG9QY2Y5?=
 =?utf-8?B?eVdJbjV6cUp6VXhMNjVPSGNqckk3ZFBydXUwRTNlU2gvNkdveFg2NWdsU2NV?=
 =?utf-8?B?NkRTbjcveDZwRzZVblYvMTdnZjZOWW8xcmJVRDhuS3pSMFU3MzlqK3RsSFo2?=
 =?utf-8?B?Um9NT0pGSXBJcnlIVytYbXN4b0hLdGhESDluNnZZbTRLay8yWUJhdksvZzRj?=
 =?utf-8?B?ZXRNdk9Qb2tiODRUMGhBYzl2cUNTMGdxL3IzekhtSFM1NE9hVXlzcXVSVW0y?=
 =?utf-8?B?SWpnU1c5eFZielpEblV3Lzd2RUlGck0zWUlVY09seWpzYWdpL2c1ZTY0Szht?=
 =?utf-8?B?ZGIyaFdJdEJFS2F3MUdidmdVTmx4K25qa1pQUmR4aTJqR3pyWDNka2liUlpE?=
 =?utf-8?B?RFBwZ1ZYaE92NmRQQmNrM24zVWdualpDS1YwWUZuYTFrQTE1UUpBTmRaUWxH?=
 =?utf-8?B?cm1IMWNRMTZNUlJqdTRXdmNMOWRhY1N6YnpvSmJsNit5enFraFNZMWkrN0NI?=
 =?utf-8?B?QXpOZUxpdDk1Y1lhVE5Uck5sVW1lcFFQYnNEYkxKOHcxSmZnWnVKeHhvWUdS?=
 =?utf-8?B?SHBlVGZuV21SYzk5Z0JoeFlaRFJhdkRyUmUyNGQyREVNTHI4c2tlL2V0K28z?=
 =?utf-8?B?M1dNdUcrejR3L3BJQmZGN2R3SkN2NnBJMWV6QkpEd0FSaEw4VncyOFhRQ2to?=
 =?utf-8?B?MlZSL040NnFUeTloRjAvcURYUDVvMWhoYUhtNWs5cG1jL20xelRTRVBYV001?=
 =?utf-8?B?ZGxMck1YTCtUcUppcmRTR05vcHlSOEcwR2xwSllKazU3anN3eS9SWkpHNUFx?=
 =?utf-8?B?dVVRSWFLbUZSZkVMalFmZ2JKL0pzb1dsaEtmWEx0WGhySjVEYkdUcDR5YU12?=
 =?utf-8?B?dXVFbDdRaWxLRlNvTXRHcEkwUzF3UWNnSFBoK2d0TVMvQ3ZOc2VkOTRkaUc1?=
 =?utf-8?B?MENSRlR0bTVsTG9OaS9aVVprTjJRejI0UlBxTFl5SnNSUE5aV1dpaGRycjc4?=
 =?utf-8?B?eitzQTJ3OGtPbDc5dVFOWUQ3YnlMdkh0QmZmaTlvaE9DL21YL1lLblV3eFdu?=
 =?utf-8?B?QndrdDF0RzNCMFUxak5ua1pPTDRKb1lweHhFNWp4K1JUOHpaRU1SMWZ5MHlN?=
 =?utf-8?B?SHVPWjYzSGJ5cGx5NnVxMjNCSU5xRksyd3FoaDB5TkEvU0cxeE92SlJzSWkz?=
 =?utf-8?B?N1BHRzVPSjNudmJwTGRMem9rZzFnUklObTdndmpmaUVGMWhqY1prTC91cEtF?=
 =?utf-8?B?SHg4YXJOajJxL1BWMFRaTWJMWUVwWDRQZEgzOXRrVFBKOCtDRHFOa3dnNGU2?=
 =?utf-8?B?SHlZZnhuNkZOWVd3MmhxNG9LK3pIcGRnZ0RFQXpSRnVVNElnblBKeitJYXds?=
 =?utf-8?B?UVBxQUhQSHJwc3k2UmwxWjA4OHdwdFZiYUJZNzYyOWxsQ2RtSUtnRktQVW4x?=
 =?utf-8?B?alVXZm1leXpJNEp2RTVvS25zRWpBcC8wcWkxU2ZYa3pLb0NJUVF2NXRZdFor?=
 =?utf-8?B?MlBIYVQzczhGZ0c0UEhLV29Rc05XY3BKNHgvS2hQdm5STmFoNzFvTFpES3B0?=
 =?utf-8?B?VC8ydnliSFFUR0JhZUhyNDlqN09oWkg5Wk5UQmVNczN3QlkxN2I3MC8rQjRX?=
 =?utf-8?B?eThPKzZ4dkJrMXJGcE11OWJUdmRnSG50VEQwaHVMRjdjWEU2ZzUvbUlaR2VV?=
 =?utf-8?B?UURIQTRPZ3FvakFza2NuRFQzdmpUZ2lWd1BvcDlHR3BDV25sa2JPOGx0WWsx?=
 =?utf-8?B?VGFselhlTWRzc21ERE15WGZyNmJxUjNKemhkMGJzNVBaVXRDOWNzVUdYdFo1?=
 =?utf-8?B?S21MdFMrTDcwMGpvUmVoN3ZZL1hzTS9MazRLVU1IK0xLVGhEdjNkWURUVXRU?=
 =?utf-8?B?d3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 141850d3-d0c3-458d-1a0d-08dbb30bdd46
X-MS-Exchange-CrossTenant-AuthSource: BN8PR11MB3556.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 21:12:54.4571 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 22EhRQrrQIxF8gN7UdALEnzLxZQDzy8Ak4XDwH/icUZVz2bXlJHw0c02DzLszXcd8KaxTvoyjh0fLbAWq0asJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5522
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] 
 =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_Properly_?=
 =?utf-8?q?return_-EPROBE=5FDEFER_if_xe=5Fdisplay=5Fdriver=5Fprobe=5Fdefer?=
 =?utf-8?b?KCkgKHJldjMp?=
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Quoting Patchwork (2023-09-11 17:43:23-03:00)
>=3D=3D Series Details =3D=3D
>
>Series: Properly return -EPROBE_DEFER if xe_display_driver_probe_defer() (=
rev3)
>URL   : https://patchwork.freedesktop.org/series/123357/
>State : success
>
>=3D=3D Summary =3D=3D
>
>CI Bug Log - changes from xe-366-8b1dfde2899992006000b358a282173604338f88_=
BAT -> xe-pw-123357v3_BAT
>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>
>Summary
>-------
>
>  **SUCCESS**
>
>  No regressions found.

Pushed to drm-xe-next. Thanks Lucas for the review.

--
Gustavo Sosua

>
> =20
>
>Participating hosts (4 -> 4)
>------------------------------
>
>  No changes in participating hosts
>
>Known issues
>------------
>
>  Here are the changes found in xe-pw-123357v3_BAT that come from known is=
sues:
>
>### IGT changes ###
>
>  {name}: This element is suppressed. This means it is ignored when comput=
ing
>          the status of the difference (SUCCESS, WARNING, or FAILURE).
>
>  [Intel XE#524]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/524
>
>
>Build changes
>-------------
>
>  * Linux: xe-366-8b1dfde2899992006000b358a282173604338f88 -> xe-pw-123357=
v3
>
>  IGT_7480: a8d38db9ac258d7fd71b2cf7607e259a864f95be @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git
>  xe-366-8b1dfde2899992006000b358a282173604338f88: 8b1dfde2899992006000b35=
8a282173604338f88
>  xe-pw-123357v3: 123357v3
>
>=3D=3D Logs =3D=3D
>
>For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1233=
57v3/index.html
