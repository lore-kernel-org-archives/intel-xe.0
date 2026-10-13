Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98404CC6B0E
	for <intel-xe@archiver.kernel.org>; Tue, 13 Oct 2026 15:14:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F3CA10E933;
	Tue, 13 Oct 2026 15:14:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E55E10E8AA
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Oct 2026 15:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791904444; x=1823440444;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=JUazmeeQkbDJLf56lZp9HyWJS5VPkRL2l7dk8narXHo=;
 b=NYbNmjjjN4dJslxLMb7IT03e9B1eanNc7F2H9v/istgzW8t9Fd8ovwBe
 JHB0zB4QOLzGSFdC9K4LXku1yslI62wgtIZz1J+teDWPaRBsd2sOTrgex
 yE3xu/G8iCDYv630t/V7zCqjy6uOen8RCMWi7lY2gEfjmN5rpdtlnG0DP
 e6PcH/pwF7+I7Wzje6m6gswCpiTzmdJdom4hOn80HUfLmLZWYYFI64quu
 FBG11Aa0d7SCPXRPmuO4HIlp688rZOkv9UR76jLNfcfI5Kx1/cntQDBeT
 0dhTNJG9myhvZlPHwj1zry6t6ia+Wec7llZDCW3LSEhBdrIPkfNFdd0cO w==;
X-CSE-ConnectionGUID: t6BCOaRgT32eiTE3Tswtvw==
X-CSE-MsgGUID: AoKbarXmTmmEv5xQU00gnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="518453"
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="518453"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 08:13:52 -0700
X-CSE-ConnectionGUID: BoLfw71zReWfI5WE0MohOQ==
X-CSE-MsgGUID: Ct4E6kaPR4agN0xATPsL5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="1247736"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 08:13:51 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 13 Oct 2026 08:13:50 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 13 Oct 2026 08:13:50 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.62) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 13 Oct 2026 08:13:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QK4ITaSu+hzEzZ3chTs2crOQt7B6cAoW9YrVkxJhYtie9s3TEZ5DkimnBtLEwLAkw7aAdLlFRlJV/JFF1DRFOC+mjvzSsAyaRkYQnWCk7/Yw+xijH0uoJ+GylL+kBvke+uDy/ZDlFtwJbZ0Nm1+jiSw5MqR3WqEz0AcWl0hGT+QBwjj93Zz7q2e4Nx5EZRPgFMpQ0VQezsH5d2CzqN5+ari42XKTERvubMAL1ham/8Zr27ON0vbhpaGPt7+JC0l+lTu1wMXg0jquACYvI8qTEedzFqDSJn+42/gyPvMz6/l/Vq/ns8kLLl4v8Jau4hEcCzebO+ceQvVm9Gx1Rwn9sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X8gQZUh6G2Y0A1TTW/6WyAVjwB2w5BWxUNXoBtakZdg=;
 b=BTXJq7ma1XcRrsmA15zU31+N3qmxI+S9NQr11tdAQiiGx5UPbgz/JSm85t0DIypyLNjNV/IgIliR1gCwvZbuUmGq8L6191Lud4r1dX7ZUUcYBeQHESVqHGPXjoKX3prPyYBk7pKt+DWwmvO5ssjnZncGvKwXtH9N5dxLfmLxT3MMCnHBZCOmzA9l+biggSpVQH1DqQ1in0DObsivkGLsWUMzPI1Hh6yE9vznkNoVo95rZW6rvcB2JLaawKy0zKX0knnphJeGLGTdYYsdueLTrAnOKDVD575NSTbrmmTfhf57xGc171mwRpRDRusO2SUQHnYHoMuEUsA3M5Sm3Jx+wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by IA0PR11MB7329.namprd11.prod.outlook.com (2603:10b6:208:437::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Tue, 13 Oct
 2026 15:13:46 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%6]) with mapi id 15.21.0496.021; Tue, 13 Oct 2026
 15:13:44 +0000
Date: Tue, 13 Oct 2026 08:13:42 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: "Tauro, Riana" <riana.tauro@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "Vivekanandan, Balasubramani"
 <balasubramani.vivekanandan@intel.com>
Subject: Re: [PATCH] drm/xe/cri: Implement workaround Wa_15020021844
Message-ID: <20261013151342.GA1329272@mdroper-desk1>
References: <20261012233035.1277288-2-matthew.d.roper@intel.com>
 <ad1c34ce-7481-4ba9-9cb7-662caed35528@intel.com>
 <as3AGwcjolGc0hcf@black.igk.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <as3AGwcjolGc0hcf@black.igk.intel.com>
X-ClientProxiedBy: BY3PR10CA0021.namprd10.prod.outlook.com
 (2603:10b6:a03:255::26) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|IA0PR11MB7329:EE_
X-MS-Office365-Filtering-Correlation-Id: 26efb393-5147-4b17-c60c-08df293c92b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|261009223027099003|56012099006|4143699003|11063799006|260925022911599003|260925021311599003|260925021911599003|22082099003|10067099003|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info: Vu6FIlutf/mV4pfHiqBQns308YSjGvxfAZJOXsqalM4BrZOCWfq7BxFQorANwEgBn5iwe0e2qM0kK6OrYW7nCL406fNlAx2Bqom1KttjsX6IDYcUbC3Bg3+n6L7jNXWU9XUVqd8Tvv+NK6TAygT1gS1fUjJwtOeuxL5tPDmKFYmX/oRIpatlkP9hr4t2CKXEOmsz8r5CDcI2sV4sUBf045BNNUKJX7wxJLdJyDYQBymHvcmuKWBPy9YCeJfilU76XEigfqftqEdToS4sgr81EzWdoZqbUW76zLt5Vy79WETp0Beeh5L4TYHkBVTmUSWjoqmaRyAJLRDw50Njqrh7jflaps0eK6xWMM/V6VhN0CVSvpQ8sz1wXV/8rjlZProNfxKnM2yc6NUhWsni1C+Jad7r+HwIK9izDThcnSmAVPKDaCB3TwPCXa8VXEsnYlq2slCec+c4b5xNFjPLe9M5iC8WKKrvtH87FvGTxo7gEdg+ebK8p42CRpb7KFaG+U74v0DDCbJ2k/0HHVlouh8eFwbFlt2wQAMGlRS+mpBrzGAQy0ltKMXm6VhCkbEch5f0YVNE+MHHheOXA04a802WXUO0t8CJGrLvV9N6Sk4Emb17N6cHp4RVlOgjxegozzSr/dv23jFNWE0KPpKH91CRnC/RZLl30rmUyNnj7WWpJ8U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(261009223027099003)(56012099006)(4143699003)(11063799006)(260925022911599003)(260925021311599003)(260925021911599003)(22082099003)(10067099003)(6133799003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wcnZAjYYDjGkMlWvFutrd3okt+yOFMPnZPnecjlU0LiZVQ8PNlaBXxcMhf/8?=
 =?us-ascii?Q?P4Erp11zY3YUshseXeeK7NlzvOvuPimEu19F+puAFYoJffyGSYlrNfquBB3x?=
 =?us-ascii?Q?T1e9aGyOEEdpz6jSPgImDMW5euYF7DryGJZbYrmHXLzwCNhjGFT34SW2AMP2?=
 =?us-ascii?Q?zBCO0eJATeRDj3/0D1GB9G4JraZYACBwfr/wL71enHZHBGBFP5fLyOoymIv1?=
 =?us-ascii?Q?f06hmsmSYGEnK4Eum7ket8mA4/q/nxvuVf5i7yZo4+d13tWdNOaksBVxO5lr?=
 =?us-ascii?Q?SZqKvMT/twO8316LK4P3vb5W5o5O8fftZXzvz4TvG2s1jSk1qWW25HBs5QmZ?=
 =?us-ascii?Q?7mjYvfVFarKD2lBE8QB4WagU/zmlgW61cMwN+1eR6KKx0G285ZgdT9VpBxqY?=
 =?us-ascii?Q?I3XWT+v/zM9j3JUk1pVENF69mxVS7bc5ECE2XAvUNZL+nygPjZFjvYcn12QS?=
 =?us-ascii?Q?K4k/xLMHsAnD6ZDrAs7EKTdzzG9dICXYxcRckmCEk4c/g72anFXjWBCKGDBI?=
 =?us-ascii?Q?4LgA4K/NA2Mapu9cs0Jei6XUj7d4GipbV7HqZgk+M6Wu+p4+O5yVZJ6wNJ3C?=
 =?us-ascii?Q?ZFENVDxxsImJ0fpli8jI0hAt+M8Fkw7H+7mLFAwczW/x3i0FUvfMGmvXzbPp?=
 =?us-ascii?Q?o7j736ojlUIl/jexONnFlC/E0TMb/pTAsYYHvboBbXA7Fw4HBiu5JJTgbkve?=
 =?us-ascii?Q?pgm3B8jyNISIZ5dyLNltv5W0JJ0BgaOImlJtqozVzLvceft4XYJBV+FY6Lqj?=
 =?us-ascii?Q?Wo6/BBviV6+FVIUAaungXqhyaHhB/DAJzoqwTDBpfjwO4/JRJ27NySY/1pRb?=
 =?us-ascii?Q?CDLuwo3N5NhMNG0x3T7Do4PzvMPD28XWgYyWVTb2/IhKuAYvc1SC4w8eBZcL?=
 =?us-ascii?Q?vF96xV1BTlvFwsmQ1tdlDK4Vl/qXgWur5ZRpZdfBvY0uzMpTO3wRFOTgtOPg?=
 =?us-ascii?Q?2AwRld1gLAURovTAwgpkau7OnueGYDN3ct06IuQp3vccpwTMD2kbwXhyEtcI?=
 =?us-ascii?Q?K6P+lKrXWP/LGF/yk31Zr/XtlHuNTED8CucoDHt7z4OWIS0NTx52oEOiOHzs?=
 =?us-ascii?Q?G3M79PqRKoP4etva60jUpvZr8rRHGb9E7Z3ChA8lydyBEmJBb28MucT5VWn/?=
 =?us-ascii?Q?Ilt4dnrS6hXmWDjtCeU7+N/VFjVpQTkjdLperIawxNP7sqZn42KI3FmrmqFq?=
 =?us-ascii?Q?wX/rahCizHMkzVNpH1XvYmDia74t0aJnxr3EMJ66M1JsHe08gSBMtSUPKOf1?=
 =?us-ascii?Q?lBXZDZi1iIMz+683HHBO9ilmR21lhvwsxjuzZ6pPfoeff8bpY4cj+NZ7u1mP?=
 =?us-ascii?Q?CDgy+YQ2jB1NJ+kxkMWPQ2di7JNCMfPhhT9BeLXHS5jaV2X/NodfRlliUfMW?=
 =?us-ascii?Q?ZFrfwPVyGDoYXe3/PFRppNlZAs8FVsNa7e97oi3zMdo8wYkiArd0WV1FQ9bB?=
 =?us-ascii?Q?6kiqS09TGpC1BscIha4cwlXh4ZTOjRKWZnI0QFWkE+/2/EnBsx7mkKDLbgW6?=
 =?us-ascii?Q?3Vvq66JvG+DQIsoQ6PiaxtrCJ1gCpf6/I/s5Cq/owoKgftu7R6iMMdpa4ze4?=
 =?us-ascii?Q?WzhpObeHeAeKpzN09Ed2b0uUJKg407+eDXACNjWTfyLSo83KauCp+ptRMkXt?=
 =?us-ascii?Q?6/cvavDbICOwYtFzGlsfy0wq/OKFcJvY3uvaTCZhl9vphGPgbCAT4V7T46HX?=
 =?us-ascii?Q?VHeDMTDXXEr1yjpfsn+S4UdVUC16LlhsPdLgod4Ue1eRI4mNYlzI9Jkefkdi?=
 =?us-ascii?Q?pnKID0/0hL2/5Em4A4GZPcHXBS7k6oE=3D?=
X-Exchange-RoutingPolicyChecked: nuQ5sZudZHruGWJN0hxAzn1zweLVRp96KyJtERSGGG8iGx5UGvO8bqRtrzFImbjARNn1ur8VitEx8g66OhUKBXdpEGA/HDMHaKeso3uQQgm5YB8409MovJwtv/0bANyrpdp86qvBm8FoxqtdrLMwuiIvkXOMH4p0ckD3RE+eUm97twviErNQ3UvAOt5q8OpBwytP/1cxejGvZYS0cD8yRHQphbJKty0VC6PQVaQWTdpPH+DJ3yPvNyMZMeJoD9lQexEXktR3+E0uVRlXuScz4Qtkrtys+gYOadJjMXub40bqSbqBgKCCi5vqmqfzKuEZziXAK6QV5JyRNCnNKYcdzA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 26efb393-5147-4b17-c60c-08df293c92b2
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 15:13:44.8349 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sfuxh1jzcEZz+O1FeRU63JUHIGQUCWbiHeVZgKzdeoFwseZCSz2J4Lx9DmQ4hxWmKICycegta5AYOV7gOcQvTVSCKAZetqXACyZ+/nC7eY4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7329
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

On Tue, Oct 13, 2026 at 07:22:35AM +0200, Raag Jadav wrote:
> On Tue, Oct 13, 2026 at 10:19:29AM +0530, Tauro, Riana wrote:
> > On 13-10-2026 05:00, Matt Roper wrote:
> > > On Crescent Island platforms, the pcode is signaling "ready" to the
> > > driver prematurely since one last sysctrl firmware initialization step
> > > is still underway and not fully complete.  Since the driver's
> > > initialization is racing with the end of the firmware's init, this can
> > > lead to error messages like:
> > > 
> > >     xe 0000:be:00.0: [drm] *ERROR* sysctrl: Firmware error: 0x06
> > >     xe 0000:be:00.0: [drm] *ERROR* sysctrl: Mailbox command failed: -EIO
> > 
> > i see boot survivability having failure codes for sysctrl. Shouldn't pcode
> > ready be indicated
> > only after the firmware is ready?
> 
> +1. This loosk like we have no indication of firmware being ready and we'll
> still end up with same failure in case sysctrl decides to have a bad day.

Yes, I agree.  This is definitely a case where the firmware is really
the source of the problem.  I was told verbally that this would be fixed
for future post-CRI platforms, but for CRI specifically they want to
take the "easy" path of having the XeKMD add a workaround/hack to avoid
the problem.


Matt

> 
> Raag
> 
> > > The current recommenedation to work around this is for the driver to
> > > wait an additional 0.5 seconds after getting the "ready" response,
> > > before moving on with other initialization tasks.
> > > 
> > > Note that the official definition of this workaround is still being
> > > finalized, so "Wa_15020021844" is a bit of a placeholder/guess.  It's
> > > possible that the actual number could still change, although the request
> > > to wait the additional half second is pretty well set at this point.
> > > 
> > > Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> > > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/xe_device_wa_oob.rules | 1 +
> > >   drivers/gpu/drm/xe/xe_pcode.c             | 5 +++++
> > >   2 files changed, 6 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_device_wa_oob.rules b/drivers/gpu/drm/xe/xe_device_wa_oob.rules
> > > index d8dc41851425c..0488a20461d81 100644
> > > --- a/drivers/gpu/drm/xe/xe_device_wa_oob.rules
> > > +++ b/drivers/gpu/drm/xe/xe_device_wa_oob.rules
> > > @@ -7,3 +7,4 @@
> > >   14026633728	PLATFORM(CRESCENTISLAND)
> > >   14026746987	PLATFORM(CRESCENTISLAND)
> > >   14026779378	PLATFORM(CRESCENTISLAND)
> > > +15020021844	PLATFORM(CRESCENTISLAND)
> > > diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
> > > index 266deecbb100a..897d44ecae42b 100644
> > > --- a/drivers/gpu/drm/xe/xe_pcode.c
> > > +++ b/drivers/gpu/drm/xe/xe_pcode.c
> > > @@ -11,6 +11,7 @@
> > >   #include <drm/drm_managed.h>
> > > +#include "generated/xe_device_wa_oob.h"
> > >   #include "regs/xe_pmt.h"
> > >   #include "xe_assert.h"
> > >   #include "xe_device.h"
> > > @@ -20,6 +21,7 @@
> > >   #include "xe_pm.h"
> > >   #include "xe_printk.h"
> > >   #include "xe_vsec.h"
> > > +#include "xe_wa.h"
> > >   /**
> > >    * DOC: PCODE
> > > @@ -320,6 +322,9 @@ int xe_pcode_ready(struct xe_device *xe, bool locked)
> > >   		xe_log_err(tile, PCODE, ret, "initialization timedout after %ld seconds\n",
> > >   			   timeout_us / USEC_PER_SEC);
> > > +	if (!ret && XE_DEVICE_WA(xe, 15020021844))
> > > +		msleep(500);
> > > +
> > >   	return ret;
> > >   }

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
