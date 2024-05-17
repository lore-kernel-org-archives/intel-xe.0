Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8906EC25B79
	for <intel-xe@archiver.kernel.org>; Fri, 17 May 2024 16:54:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4010210EF20;
	Fri, 17 May 2024 16:54:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OaCxLH/d";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B22110EF20
 for <intel-xe@lists.freedesktop.org>; Fri, 17 May 2024 16:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715964886; x=1747500886;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ThgzuaGQaS5wf4xEsWmEYjeo+r5l/5Z6nx25CixseMU=;
 b=OaCxLH/d8C2vpAcBBVE1Q7vx/jYo9pPPKjZxcc52OyZPcJqLQSHolFYu
 WKXkCt8yVEYh8i3tbxmDqM/rLBc6DQP1AnFpnNqwmIixMh7ZQPjyd73/U
 PO9uUvCcHwmOPQ4TM7iuWUjYW1aQ8Cp9fIIrfn1m1CWXh/tfrHvddxsui
 +Cj7tUkhBQoGfBUzEGvBipWyOQSnbiklV29vKSXr/PKhhewSnlmciGfzr
 lS9wLrWlQHniRJVUqTpbooq9/GyY8AysVEkpUUL4siLTVcSVpTJNgP3hx
 uzDNj3khEvNwGNdiaXweZBOFhqUXqfPOjHE1nYMmJTdjnGnWWsA4DsLpU Q==;
X-CSE-ConnectionGUID: 3c831tJkQJy6vbaD9rDCfA==
X-CSE-MsgGUID: xoOeIv34TD2nWpmlTPTCUA==
X-IronPort-AV: E=McAfee;i="6600,9927,11075"; a="12345369"
X-IronPort-AV: E=Sophos;i="6.08,168,1712646000"; d="scan'208";a="12345369"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2024 09:54:46 -0700
X-CSE-ConnectionGUID: MmJ8bd/gQmSHvj+wHaPLnA==
X-CSE-MsgGUID: L0kG6cbzQkeaGrATe1USTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,168,1712646000"; d="scan'208";a="62684813"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 May 2024 09:54:46 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 17 May 2024 09:54:44 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 17 May 2024 09:54:44 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 17 May 2024 09:54:44 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 17 May 2024 09:54:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eWus+ysQFTrIi7lgH0z8GMy9NQEhwzBirgmhmG/4meo9dkSuKTPEDJwNLZ0dji5/uUIBXrTKswkuX0yOlOv7jAQRMw9hW4QJJmIAjTcDinsLJdluQdaR/BcR0GPcQJGj3jF95aJRZcFFG/r74RUtvFNv8HFGy2csw+Dh9GRg5xPYILFBu04mrFuJzgtLwKzTW+y8B+JLmDx5hWc1vduumn/07sJU2nW08wr5XtjH7VjefNKWOeIRKUtAV3A0IymorF8JbbGHP69lOLi+9Nypa4gEtGAwOo/wVyoO+MrAQ7tAi00mD6+sNUpmyEmphvTtr+NF8dD1LztYLHSPxyFsdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=egYrEBUvlR2bJPMln5KdTsMPVUKFVis3SEPZ0MSxn+o=;
 b=FO1cf1Snr/0sPnCvgH/T+rtZpGN+KDkXK5h56hcigVRVdgZaU82pKcqVi66U7j4+fkk9H+GNOQOG1jpPJpaSwxQKLpa6TR6eSUve8tGLs5iMXlm0G2J6fP7z8pE9BfA8fm8QI0zSv2O+QSEqpqNdLzaCFmoCHUO5wk9Iw41pa/oYa05g5Cz/KmcvFPDAjNOToh/nu7YxGSZekcKT41fYHK478CNWjJVXpMVFV8P4QYpr5pPl1Zk0nzarqrV1nev5wRM4MI9H7NF2Kp88C/jpUoi7qF3TC3u36qw8PYUmNTibB317RRFgvYVlZ2g8Y+kMxy6zxn2MPEFNNCeGqauFaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by DM4PR11MB8203.namprd11.prod.outlook.com (2603:10b6:8:187::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Fri, 17 May
 2024 16:54:23 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::ffd7:2656:a8c4:43b0]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::ffd7:2656:a8c4:43b0%4]) with mapi id 15.20.7544.052; Fri, 17 May 2024
 16:54:22 +0000
Date: Fri, 17 May 2024 09:54:20 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH] drm/xe: Replace RING_START_UDW by u64 RING_START
Message-ID: <ZkeLvFUigb7i608i@nvishwa1-DESK>
References: <20240510150108.80679-1-jose.souza@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240510150108.80679-1-jose.souza@intel.com>
X-ClientProxiedBy: BYAPR02CA0015.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::28) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|DM4PR11MB8203:EE_
X-MS-Office365-Filtering-Correlation-Id: 4890002d-e846-4818-edae-08dc76920083
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?RnOW6S2wH9gYPgyF+H5GULQIdFhmLHm6xLTRsL4ibmjH9Qg1PCqWLHQREk?=
 =?iso-8859-1?Q?Km9ds2g/VBzo7Ka0H/of3xA/NFEBQP55q7U3P6WBTnp+0UTnlb6eA4SjR0?=
 =?iso-8859-1?Q?uqVPqw6ORo7qJs4xICs2X2hWKzQVfadC+QsMGW4hB5f921DIdUlenr7C04?=
 =?iso-8859-1?Q?007XI4oKlI7xhr2MckcpuUI28DDZgoOFI1NekNVPVrRftCm4ji21fqYBDV?=
 =?iso-8859-1?Q?lwwj3meUCfBrbPuJ0gtm9RUVbVTUrLCn+7vbmThLCMNPuvPdWwfKesHESy?=
 =?iso-8859-1?Q?TC3YCUQWPYMazaszgohAxN9lWq4Ib4nxcGSPvIWavXh/P00ikLHCRuzRC8?=
 =?iso-8859-1?Q?rKz8VZ1vqJGHS+nk7zL98m167fauUqGRJa5HaCHfKWEtMofPxBzi3zjZ0f?=
 =?iso-8859-1?Q?AZhZL38ZopdR9Pa4k2rfdX6jUC8qroKNqwPaG2q6kCZclxeYzlt2XcZpYj?=
 =?iso-8859-1?Q?OTvsCqyZKQR0fsybSF1XCKWa1c1h7DwVzZ8L44xMHpR2PscrtimH4qC6rA?=
 =?iso-8859-1?Q?wGpWi1nt6xXfyzp36zIpXmdN8Q78WpPsl20NXudZDkY5z0v0sI8NgvpsQu?=
 =?iso-8859-1?Q?0WqHJG+zuSyPd9iPnsSPZIxAviuath6Q6N3fAR/VNDgPw++JQ4MWcFATL+?=
 =?iso-8859-1?Q?6ZUpt+W3rCj/Q/UpkZ4Rd5Trgvk3GFbp3A9Zv8D9XSCjuYZBsVf8p70tTJ?=
 =?iso-8859-1?Q?RJm1Vf+rso10yZ/tAJyZyq00HSnQDgQSC5CyOlA1V+uZPdZi1X3Bv9+13d?=
 =?iso-8859-1?Q?Bw1uev4ABpmte9MG8CigE7g/GOgn1X6RK4IYdiLLo1CzWXBR5ZETJfMRiW?=
 =?iso-8859-1?Q?5O34AZTCbDVyejKpUZpNfhdZ5rpR9+3JL4INeGCTYQVXgMWq8A9Su64rcm?=
 =?iso-8859-1?Q?xl3AZErKqQGxOO23USCmjB//WweR5UCzwf9j5RTXqWweb6nUgTShYvOlrc?=
 =?iso-8859-1?Q?Z7aOgegKklbfkUyLmcsMdqS0eL2sSieMdrrbObggFXBrF1wVFH04JPwdAP?=
 =?iso-8859-1?Q?XKhZrTdKu0blrU7eq8kTyD1X6kvt23JunijmJzlZxzFAFpLWS0dkiY7ek3?=
 =?iso-8859-1?Q?xGUQJDtXkYb7r7HJbctQA6RJT3yQXEyVSN6tq2re+ej8Li5yQL91772fb5?=
 =?iso-8859-1?Q?Lk4sCTj1frFfDUCqMA9etaUE/cY/w+7q49NHr01FMMzp2O9nH+IEXDdd2N?=
 =?iso-8859-1?Q?EzMniZT0DWMM2Chl+cz5zzRr88cszEs8OBcEItU+BdK4tWKtR2GqYiUf4l?=
 =?iso-8859-1?Q?kUY82mZ9aGLWz3vYRq2aWDnmSQ4wy8866TEGBYZzBjRy0heYc8qMCuKARY?=
 =?iso-8859-1?Q?HoTWNd3dvh2siZ87qLHacNS2Ag=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?M++8WlOkoQ/qI/Swwljk5KGnzkDjp9J+CyVyH3DBbC79qFzsGHnGjCrxp1?=
 =?iso-8859-1?Q?YY0P5YJGBpPc/NfQJbT/dblv9mJSn3TgdlD9dPBiTsLEWa2LZiTYBnyYUG?=
 =?iso-8859-1?Q?vmt0q09f2Phq1RWrGy0GRqc4BTqhr/tSb29wFWoa4U5k5WAYOYkhAJnoOR?=
 =?iso-8859-1?Q?StUmAvP6COhaY83CB2jWnBhpEKS9L/q/8mbmS4TbLprSv28lwpI7U/9Wnx?=
 =?iso-8859-1?Q?Fss1FqA+DUiL52Ov9LSAVDRV18O6XGnaaMrFcwpSQ4XQkMoUWhw6NhWIyN?=
 =?iso-8859-1?Q?iYePkDb0HpNolt7atpW8whjiKtIcxO7udl4mT/x6Z+7tXGDtd3pPWHXnE/?=
 =?iso-8859-1?Q?961HGndOOwRC3VSIZUAv6YV7uo8M29HPkw0+y/tnBEMrpopcVnPSXtUf+p?=
 =?iso-8859-1?Q?A4AhqZZipCdERXKKD/s7yODxiE9vGYuHnkGFbQdohxpYzJpdilHpeL9mXq?=
 =?iso-8859-1?Q?F8w0B16u+JJloyom+Kj2XPRDV5a3xYXZMnXU7VdNMk9gZh6inbQV5imyaa?=
 =?iso-8859-1?Q?guNPMZbppll3cKBV6w1eVBmD/+VwZ7+CNvmj4RIMGpQGY7CU331I2/tDpY?=
 =?iso-8859-1?Q?ZcBF3zULb3ijewzSMvuJ2+5Ql/Dr/bzQHM98GEjrccvKFLDBGYe8UTce88?=
 =?iso-8859-1?Q?nmpEr7glqrbyHlX+m+u6XQJrFmWKDOW/xaMY4lCnCFA03f0e2ogY5e4PKI?=
 =?iso-8859-1?Q?OlILhSziRopDM0iZ1ReXR7Jg0kZ64nAM54lBbM0aU6JLUJUJ1xHqu43RJ0?=
 =?iso-8859-1?Q?jmVq9jt4DPIDkrOgS3eObWdrYN8ux3t7xzG+t+rnjWnztvGgfXOzYEYP9R?=
 =?iso-8859-1?Q?ms0cllOnPLp6UwsCyXp+2ZNQDofAz0uqPfiok5JLnU/h3ZboX6b1k3TFwe?=
 =?iso-8859-1?Q?4ISR088IahNG8SXsTHN4KuHlq6DJN2Xu9HLNFd4EEW+obFuEKo1NUS0V4v?=
 =?iso-8859-1?Q?z5TEKdur0hXokLSPLlwx+tT0rMFO1WW9dxYFcrF/IxF9mxdX726jTSIO+i?=
 =?iso-8859-1?Q?WFmxx+iBvoPtVhX5Bv739P66hmNGBqClamsD4URtOZew+Ck6f3uau2TacP?=
 =?iso-8859-1?Q?jdR3nrDTeRG8Tm0NVrRBrmqhLSEkB/estvJfIq2OMYQPHshuKwWFJAXgSd?=
 =?iso-8859-1?Q?b5DvYIzY19fnzfnmgxVx4+MJBSUpFqV9MrgGBLQK4k3KyclkNAA12+plnR?=
 =?iso-8859-1?Q?Ze85Ze8vAj/hN587JOYX5zGYVDUI7xAqxjcXacmhBwd4oPzXjYb4iSVjHJ?=
 =?iso-8859-1?Q?/mi4s9v/Z/xug/8D+wCa6Z+PAYGo0KVEXp3pbtoTspFDNyhieiFG4rE/vp?=
 =?iso-8859-1?Q?UoXIkEwWrTuAkaU9Inpy+nDYtfY3Zx50edESrOJdsUMlW88fjKzzS+L9Rz?=
 =?iso-8859-1?Q?d8jfv5H6FyA1bz1Qb2wCuPgrEI56eQvVQTtZMFlKgp1NMB6zMhuQtQ0DxA?=
 =?iso-8859-1?Q?MkdkVFu/KDK+BvBqniVUquV+9irw6M/QWIOQ6XRNOeb4povaZKHfqzZhtu?=
 =?iso-8859-1?Q?EvkcNLjQzr3O8j/e8vw7zrVLQt0eNH9qe27/VQtnS8snZ7AM17XyXGTHjg?=
 =?iso-8859-1?Q?WPqu8ghp2ClCWcK5alhQz2+1foyHBgvO78gj/Nppk+dxCA6R0P6GXqwM5r?=
 =?iso-8859-1?Q?aZrjgnaFM57sdXHeVgnQelaoZsOBG8oB8oAN99J8hBZPWOHptZsrRj3ECn?=
 =?iso-8859-1?Q?LBp5gGaSNd1Rpz4lHv0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4890002d-e846-4818-edae-08dc76920083
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2024 16:54:22.7462 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9nCmSsN6+Vl0DmAHQ2IMnfQvS/LTEEcWXKxPhMilcpbZXwaYR9MfYCS1KgvOhQ9XIxGCfAThwCzde0X3TBAEoJPhzApNW8hDhWzVWSaxnk+9hemH6xDTZ3LmiAdh94S+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8203
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

On Fri, May 10, 2024 at 08:01:08AM -0700, José Roberto de Souza wrote:
>Other u64 registers are printed in a single line so RING_START
>needs to follow that too.
>As there is no upstream decoder tool parsing RING_START this will
>not break any decoder application.
>
>Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>Cc: Matt Roper <matthew.d.roper@intel.com>
>Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
>---
> drivers/gpu/drm/xe/xe_hw_engine.c       | 10 +++++-----
> drivers/gpu/drm/xe/xe_hw_engine_types.h |  4 +---
> 2 files changed, 6 insertions(+), 8 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
>index 45f582a7caaa5..e19af179af338 100644
>--- a/drivers/gpu/drm/xe/xe_hw_engine.c
>+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
>@@ -908,11 +908,13 @@ xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe)
> 	snapshot->reg.ring_hwstam = hw_engine_mmio_read32(hwe, RING_HWSTAM(0));
> 	snapshot->reg.ring_hws_pga = hw_engine_mmio_read32(hwe, RING_HWS_PGA(0));
> 	snapshot->reg.ring_start = hw_engine_mmio_read32(hwe, RING_START(0));
>+	if (GRAPHICS_VERx100(hwe->gt->tile->xe) >= 2000) {
>+		val = hw_engine_mmio_read32(hwe, RING_START_UDW(0));
>+		snapshot->reg.ring_start |= val << 32;
>+	}
> 	if (xe_gt_has_indirect_ring_state(hwe->gt)) {
> 		snapshot->reg.indirect_ring_state =
> 			hw_engine_mmio_read32(hwe, INDIRECT_RING_STATE(0));
>-		snapshot->reg.ring_start_udw =
>-			hw_engine_mmio_read32(hwe, RING_START_UDW(0));
> 	}

I think the braces can be removed here as there is only one statement now.
Other than that,

Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

>
> 	snapshot->reg.ring_head =
>@@ -1003,9 +1005,7 @@ void xe_hw_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot,
> 		   snapshot->reg.ring_execlist_status);
> 	drm_printf(p, "\tRING_EXECLIST_SQ_CONTENTS: 0x%016llx\n",
> 		   snapshot->reg.ring_execlist_sq_contents);
>-	drm_printf(p, "\tRING_START: 0x%08x\n", snapshot->reg.ring_start);
>-	drm_printf(p, "\tRING_START_UDW: 0x%08x\n",
>-		   snapshot->reg.ring_start_udw);
>+	drm_printf(p, "\tRING_START: 0x%016llx\n", snapshot->reg.ring_start);
> 	drm_printf(p, "\tRING_HEAD: 0x%08x\n", snapshot->reg.ring_head);
> 	drm_printf(p, "\tRING_TAIL: 0x%08x\n", snapshot->reg.ring_tail);
> 	drm_printf(p, "\tRING_CTL: 0x%08x\n", snapshot->reg.ring_ctl);
>diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
>index 5f4b67acba991..b2f64b92a6362 100644
>--- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
>+++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
>@@ -188,9 +188,7 @@ struct xe_hw_engine_snapshot {
> 		/** @reg.ring_hws_pga: RING_HWS_PGA */
> 		u32 ring_hws_pga;
> 		/** @reg.ring_start: RING_START */
>-		u32 ring_start;
>-		/** @reg.ring_start_udw: RING_START_UDW */
>-		u32 ring_start_udw;
>+		u64 ring_start;
> 		/** @reg.ring_head: RING_HEAD */
> 		u32 ring_head;
> 		/** @reg.ring_tail: RING_TAIL */
>-- 
>2.45.0
>
