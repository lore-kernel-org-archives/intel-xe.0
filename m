Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA050C021A4
	for <intel-xe@archiver.kernel.org>; Mon, 24 Feb 2025 19:41:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83F1E88DA9;
	Mon, 24 Feb 2025 19:41:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PBNgs7E7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 196FD88DA9
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Feb 2025 19:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740426086; x=1771962086;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=6/NecwJnETs1ms6BAzMk9f7JPERa1ZH26SJR7I8lA4U=;
 b=PBNgs7E78ppjmz5DBPVb5qF0Y78AGVVP13wbEWkXZr8RI0iPwq80Agru
 8cEWVHWwipc7uYwPZOs5enrDbNoEDQOkRuxAbnjUNDENdHDK/AnEVwEkG
 ggAO0LGRnUlr2zNv4YnnlSDOdnbrLdiIUr3Gl01kM/OJD2ENTklZgXcF1
 e9KEQrW8HKKAfeECrjTKHtI6Z9Nfc68oqqWGAZMpgGHu4/DaMuaRaB+nY
 i5QPl11Mu1VJyezyBLf7EpmIwDPA/5Oahygsxa0Fr1r2l+D6j8wrAr/xO
 q4gzYo7c6yR17VIlqsh3Wb6jg7yHr1HGUWcFSV8szY33sEk+BmO7bnkHr A==;
X-CSE-ConnectionGUID: jGQNZTn+TD+y3UiEY865nw==
X-CSE-MsgGUID: WWnl/zwgQti5SPd7tdn0qA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="52627025"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="52627025"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 11:41:23 -0800
X-CSE-ConnectionGUID: EkU2BFNXR6GR8xo5M2F1Ig==
X-CSE-MsgGUID: 26w17mNPQFqfzCaK0M9+Vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="121407794"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Feb 2025 11:41:23 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 24 Feb 2025 11:41:22 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 24 Feb 2025 11:41:22 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 24 Feb 2025 11:41:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G+7XwskcjhGE44yKj/70ufYiRvYawLb0zygbHAKpL61eexirW0JtcKxktW/PZZcR3GmXl6rkaTSVIzHuZFS1foicT8v+IXGL6mC3dz6hmR/x3mZIr5ZYCGrt6jdV2pcR6JlzATfSFVIJF1s9fBgEaXQTCVvvLpPG9/B0vsqCkScHSPruSYzCF3d+lNm3zYZltGp60UAxF1gybGyqqFCXASnY2Idw2xWlpg5hFmyeRNGqsBCd+VgZyiTlpp4RX9MGKMjcqzQiLjgdQZPs0A1gx40ai4pJqJQOcniTxk10B7fnaDe7dqXUUZuL7JjYjvLTASP6sq++5JZZaDejfjkr/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4x6eUTwgVkzWhy863GkF0gnXMJH0BqVkNHH0GFfr1BU=;
 b=qsGxoaDIyyXWZKHiRhRdYNc6iGYrR6wNLnQVYadU+XVvLX84EUjhamoMoSG7/XOCmagZl4yUCqFA6uDiB5pUS4E8tR3dVqleQQpA+a9BTu5PFQvBmvu49EjLJKT4YSFUDPs4DdFmKKRp3VD9CIM629jnfSmiCRfKpPALIhw73ZLxXsBJ1BTu8KEMzojh/RCbwyrf8/uQumgHc8LouI4IaKmCKJHzHVVUFL2HmrgIPDG7CErcVGa8GiKu95afDeAopbSmGNjUcgbVcdshidg62bOLTXLAiTM6MPlIx7FR8wrqvaA3dhRGGQZM7uzZlVQh5lMqa4YvVIHzV7/Jwcn5zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH0PR11MB5064.namprd11.prod.outlook.com (2603:10b6:510:3b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Mon, 24 Feb
 2025 19:41:15 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 19:41:15 +0000
Date: Mon, 24 Feb 2025 11:41:13 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH v2 1/5] drm/xe/rtp: Prepare RTP to define SR-IOV specific
 rules
Message-ID: <20250224194113.GC5109@mdroper-desk1.amr.corp.intel.com>
References: <20250224150700.1778-1-michal.wajdeczko@intel.com>
 <20250224150700.1778-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250224150700.1778-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BY5PR16CA0031.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::44) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH0PR11MB5064:EE_
X-MS-Office365-Filtering-Correlation-Id: 7acccf83-4bfb-42a9-e490-08dd550b339a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8SCKBFSUsDTVQKsqUrzXuFQ6/C2uzysoYMlta953opb+cDwnwTx+oudPaDhs?=
 =?us-ascii?Q?kws3QZqdGcLEBdpYvXioma6LfH1Z9At2zTsKKiOZ460l8Y/iFUxJ7awX8+V8?=
 =?us-ascii?Q?eyNIfQtOkU05N7BxufpMDXBAB6LJ1o5kYWCiWB/eD+Ha3xdboLxssm59bQyO?=
 =?us-ascii?Q?dVDFHvbNfYvCOSljLdESzAjORFk0/12+7NHFbKyZZri3mYZNkEQRhbLYIIbi?=
 =?us-ascii?Q?10cSoqiGiYnCjWIJS6IlGc/4OJv7APUtfrw2Wt093VE+oVkChcqzAEhecvQN?=
 =?us-ascii?Q?s0uKUPsmo5vf3T3trYIhfjNnmxAGV1oF4wgu96l1IiCoh0Mqoj0pSs/EoepK?=
 =?us-ascii?Q?XVItBKmiIBIrlIXIezPJmv2Qiti5TpExMVLB+dThI5QpSKQtGvkA5yBGZrnB?=
 =?us-ascii?Q?szaVtPynY3BFg4zVAWE8lj120OX/V0/zBtuaG8UWdBswCxsUspINobSzTzWn?=
 =?us-ascii?Q?Jd8rc5HYmNM0uN8+u1Rc8p6JVnI8S3m86wA0y1rq2k4UEVji8xCd3VekIZed?=
 =?us-ascii?Q?w9ayYuixEbdtGJBbTu367kqctzXlaJAosyZebKPklUHluDVuq3gxQFCzc9vJ?=
 =?us-ascii?Q?2PgiwMCsURqtD8HGsjJEAIUFGpUKxoXO7KllwT2hVg2VDZ87B5ZKOqgsEjar?=
 =?us-ascii?Q?qBtwytVGXVxspfw0/schlb10QXgaV62Mdn1SLqLnEFnLw4OJk0Tygclcpyqy?=
 =?us-ascii?Q?KCCz6xY9yxRfSW+ixxh2vpLNUJuL6juV5lyyxgDPthCrScdWS0cM0V04MoTI?=
 =?us-ascii?Q?ePVjuWyduoDJN6/eZPYV0m2Muk2mPdOF1afi8obZun2RQ9Ii57bcQchLrkXO?=
 =?us-ascii?Q?eMprPYo7Gb0mICppPzJ1D5jOJf2VWBlkGyPCtr299s2Y17ZpB4GBb7ubb2ba?=
 =?us-ascii?Q?941pSGe0O2mmh8fNhj6H//3D4Oaouk3Cyt26hesSWCTGpQWunFLB4k981nW/?=
 =?us-ascii?Q?PQf2VxuBeKOpkdsrTdqPLFNzjj2tVnnIG9NgnjiGdaGGK2GsTYsZOsoCzAOJ?=
 =?us-ascii?Q?EnyximWlFVPPtbUuMVSGIOZS73/4jrfZc6ez/JM/5wN217wimp6rlxLKxLKX?=
 =?us-ascii?Q?x0Tvjj9fxHRQO9kb0DZTZPg8prKVGbIOsYZ3W/aWeBsJlZK4MTmiDTCq97eV?=
 =?us-ascii?Q?UgSKNhZdf2xC2omIGqx0TCoINv75g1f65mFvfgwFp+cSHbhClW9B4Wp55HGq?=
 =?us-ascii?Q?urAURFt2sMZVDj4QTwkoQOHaueoqzwlAy6L8F1UdxfuikEFpS45C6xkhMMaX?=
 =?us-ascii?Q?tZo9xHOx+C71eTwJkqtIW3rQlWKMHPBenvz5YHwocThMxoeHWwSII17uMiD5?=
 =?us-ascii?Q?XZ24bhwEaNOEd9o0cpxnK4W3uzfNHUc0FlT8gVKmg5EhFvYmeYUtFIWAa0Py?=
 =?us-ascii?Q?10+wqByB7NLU1Jy81YWQiPKEPyI4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SrOxPh6gMape2BkhCxyfwsVNRm/jJkHp9Al5FQDLFPAtwl4ZdgsjqrkhtzX8?=
 =?us-ascii?Q?D9+tg/0CaKXw2ilPG6UZgINbyreiVsT7MWRObLzp42Kda88C4F9xXqU7Mur9?=
 =?us-ascii?Q?Z48mFORAO/Y819o0JaYbPTbnKu617yHakQDelTqq/CprN0YH/E8IAL1XJaBt?=
 =?us-ascii?Q?OI8nPTQbK/N+YAjL8SdMUpuFFA2GmCw8fcMHWNbiNsvNC4tAAs+AixU+L6bt?=
 =?us-ascii?Q?v98K+WeerIAGl/NV72VhMTo6uS7nSyuvRc9ZFuW5txMDZpVLAipmsn9MtozK?=
 =?us-ascii?Q?Vt7aiVhO9dMawDzVwhZuygsllgyNm/PxgOJKw4ifJRQMi+YBbfUmSmYGxfCA?=
 =?us-ascii?Q?UJuauOEzM4tMG+KdqzUfSli0+9asse7ONVvWqj2z3VwcYVdUFcMRBxd4iwlN?=
 =?us-ascii?Q?OkuaWm34Iaj4g+JJdwv4WyRecVQDuSuOZoZOHLih4TSwxUw0nhBEV40KDiKm?=
 =?us-ascii?Q?EhM7lZ1Ls1ta7myXtSnIthzrJMueKW/14FIpFvg+aqzWvxGA42whALMrHkrI?=
 =?us-ascii?Q?DtCgFWajqCc+lXObk3riB2Y3UqscL/7BflkVaoYCfvZPgiYTW14iUPZNRM9v?=
 =?us-ascii?Q?jIYPDc/Y/Uof7C4znQC+mHU+WCS+yVFSwDlyJ4HVdtxaAWESqglZrKai9glQ?=
 =?us-ascii?Q?pYWCQcf1NAO143cbO6Xkehb5U4bUH7DojLiYQdtwCHaB4TQyQfdM0KxaVdBX?=
 =?us-ascii?Q?BAh0qTIyGDaKms4tiOhaV4p4dxvqlTiwJPkve5UIKG47r4FGfbh/CzAuwbrF?=
 =?us-ascii?Q?t1Sp/8MBfu8D/fgQBVK7hMltSfH8DZV2PrGF4ybkpB3cSwWBMpIP5i8Faynr?=
 =?us-ascii?Q?FT1HQwhbHMAnejeF3NKNgYpTRhu1b32PvvbwZK55H2ptNvHsUZEK1KYDma5P?=
 =?us-ascii?Q?DMWkot0MgXTneeoQSDPIGJl0JJ+ifaG3C/fhkkfHCX4qQ1gIOIFvWfBnxxHV?=
 =?us-ascii?Q?1sfHUDTxhjNiZE8GwHuioaTZjXwxASPbLiFkRPxdKMJmXqfLE7e3ywtwdEaZ?=
 =?us-ascii?Q?VbVHU+eYS00yy2GFLbd1ED24Tb62FFkGV7G1CSJVAtInMWUATCDAcAEg4jnd?=
 =?us-ascii?Q?OS72EOMzmKwBxp1cSlpzDTj3VF/C2cJNlxOPhhQPXUNA8Bm6b3xUSAlS43Go?=
 =?us-ascii?Q?ftNXnvFhCIeP6M7qbqe0WdBP5pT/bIuVZNSeDhtQFx/9oE86UA0H427MzSDw?=
 =?us-ascii?Q?MVd3UORliDL+tbmGv15+XPFVkUHMRW9uhxRaAv59oRrc2q4CFeDy2cH/2b10?=
 =?us-ascii?Q?5QSlEMVhNnYtbTwUWI5eQoxh7qCtEVvnQw7xuNnWZWjIGzrNXSiGKVmoFyvP?=
 =?us-ascii?Q?Kql/PODAH866pZJyg0uHGS4zJJIrT+44cdp30xuHiLqCbQkQ9alqoVePEJcX?=
 =?us-ascii?Q?0XMjD2B2l6yM3ypLj9iD0jwvMbaiXM6UT/bMPtf0oXi2I8THgScTrsSS7F4e?=
 =?us-ascii?Q?OfwrDpys1c12AbVBvZcVmCyph1pKzOiWjiOr9K3UARhAMIqSBaZ+aZ9gcRIl?=
 =?us-ascii?Q?RwD739scuhHlZhtG/RF/wP7hyNer/aDwtfsOTr6Vr7YhNB9RfBUap9mgeDKv?=
 =?us-ascii?Q?xaQYEMuaVwy/8poxxnbBTes8RArPwE+ow3M0n/ykV4Sk1oJqwL9HDn5VKlfJ?=
 =?us-ascii?Q?bw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7acccf83-4bfb-42a9-e490-08dd550b339a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2025 19:41:15.7553 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: moYIKDpnfx+/R7okrYfY44+sgGJXCAvNlVFLVlGkVx+tW8XZy8ANFZipI6KtnEUsXOREveoGJdG7tJysecuRR7N58CfuFVyGDVfrmFOGVAE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5064
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

On Mon, Feb 24, 2025 at 04:06:56PM +0100, Michal Wajdeczko wrote:
> Almost all currently defined workaround actions are dedicated
> for the driver running in a privileged mode (native or SR-IOV PF)
> and those actions should not be used when running in the VF mode.
> 
> While we can easily skip any attempt to apply tile, engine or
> LRC workarounds by doing early exit, it's not so easy with OOB
> workarounds, as on exception basis, there could be some actions
> expected to be done also by the VF driver.

A bit orthogonal to the specific patch you're adding here, but stepping
back and thinking about this for a moment...does it actually make sense
for LRC workarounds to not apply to VF?  I can understand the tile, gt,
and engine workarounds not applying since presumably there's only one
setting at the hardware level and the VFs would use the setting the PF
had programmed into the hardware.  But LRC workarounds seem different
because the hardware value is expected to update with each context
switch to whatever is in the incoming context's LRC.  If we don't apply
LRC workarounds in a VF, then the actual LRC getting switched in won't
be inheriting anything from the VF, but rather using whatever unmodified
value is present in the VF's default LRC.

Am I overlooking somoething here or should we actually be handling LRC
workarounds in a different manner?

> 
> Since we process OOB rules also in the SR-IOV VF mode, we had to
> explicitly decline the ones that were not applicable for VF, by
> using FUNC(xe_rtp_match_not_sriov_vf). However that may not
> scale well, since most future workarounds will likely not be
> needed in VF mode.
> 
> Instead of forcing us to append more and more FUNC(not_sriov_vf)
> to potentially every new OOB workaround, change the RTP logic
> and assume that RTP rules are not applicable to VFs by default,
> unless there will be added a special SRIOV(VF_READY) rule.
> 
> As of today only no_media_l3 OOB workaround seems to be applicable
> also for the VF mode, since the value of MIRROR_FUSE3(0x9118) from
> the PF is likely unreliable, so mark that WA as VF_READY right away.
> 
> For completeness define also SRIOV(ONLY) to require PF or VF mode,
> SRIOV(PF_ONLY) to require PF mode and SRIOV(VF_ONLY) for VF mode.

For the purposes of a workaround, what would be the difference between
PF mode and native?  I.e., what kind of language in a workaround
description would signal to us that we need PF_ONLY (or SRIOV(ONLY))?
Do we have any historic examples of these?


Matt

> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> ---
> v2: tag no_media_l3 workaround as VF_READY
> ---
>  drivers/gpu/drm/xe/xe_rtp.c        | 20 +++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_rtp.h        |  8 ++++++++
>  drivers/gpu/drm/xe/xe_rtp_types.h  |  4 ++++
>  drivers/gpu/drm/xe/xe_wa_oob.rules |  2 +-
>  4 files changed, 32 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
> index 7a1c78fdfc92..b607be981590 100644
> --- a/drivers/gpu/drm/xe/xe_rtp.c
> +++ b/drivers/gpu/drm/xe/xe_rtp.c
> @@ -37,6 +37,7 @@ static bool rule_matches(const struct xe_device *xe,
>  {
>  	const struct xe_rtp_rule *r;
>  	unsigned int i, rcount = 0;
> +	bool vf_ready = false;
>  	bool match;
>  
>  	for (r = rules, i = 0; i < n_rules; r = &rules[++i]) {
> @@ -110,6 +111,22 @@ static bool rule_matches(const struct xe_device *xe,
>  		case XE_RTP_MATCH_FUNC:
>  			match = r->match_func(gt, hwe);
>  			break;
> +		case XE_RTP_MATCH_SRIOV_VF_READY:
> +			match = true;
> +			vf_ready = true;
> +			break;
> +		case XE_RTP_MATCH_SRIOV_VF_ONLY:
> +			match = IS_SRIOV_VF(xe);
> +			vf_ready = match;
> +			break;
> +		case XE_RTP_MATCH_SRIOV_PF_ONLY:
> +			match = IS_SRIOV_PF(xe);
> +			vf_ready = false;
> +			break;
> +		case XE_RTP_MATCH_SRIOV_ONLY:
> +			match = IS_SRIOV(xe);
> +			vf_ready = match;
> +			break;
>  		default:
>  			drm_warn(&xe->drm, "Invalid RTP match %u\n",
>  				 r->match_type);
> @@ -128,6 +145,7 @@ static bool rule_matches(const struct xe_device *xe,
>  				return false;
>  
>  			rcount = 0;
> +			vf_ready = false;
>  		} else {
>  			rcount++;
>  		}
> @@ -137,7 +155,7 @@ static bool rule_matches(const struct xe_device *xe,
>  	if (drm_WARN_ON(&xe->drm, !rcount))
>  		return false;
>  
> -	return true;
> +	return IS_SRIOV_VF(xe) ? vf_ready : true;
>  }
>  
>  static void rtp_add_sr_entry(const struct xe_rtp_action *action,
> diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
> index 38b9f13bba5e..7874ea8588db 100644
> --- a/drivers/gpu/drm/xe/xe_rtp.h
> +++ b/drivers/gpu/drm/xe/xe_rtp.h
> @@ -207,6 +207,14 @@ struct xe_reg_sr;
>  #define XE_RTP_RULE_IS_DISCRETE							\
>  	{ .match_type = XE_RTP_MATCH_DISCRETE }
>  
> +/**
> + * XE_RTP_RULE_SRIOV - Create a SR-IOV rule for Virtual Functions
> + *
> + * Refer to XE_RTP_RULES() for expected usage.
> + */
> +#define XE_RTP_RULE_SRIOV(TAG)							\
> +	{ .match_type = XE_RTP_MATCH_SRIOV_##TAG }
> +
>  /**
>   * XE_RTP_RULE_OR - Create an OR condition for rtp rules
>   *
> diff --git a/drivers/gpu/drm/xe/xe_rtp_types.h b/drivers/gpu/drm/xe/xe_rtp_types.h
> index 1b76b947c706..02c4e67906cc 100644
> --- a/drivers/gpu/drm/xe/xe_rtp_types.h
> +++ b/drivers/gpu/drm/xe/xe_rtp_types.h
> @@ -53,6 +53,10 @@ enum {
>  	XE_RTP_MATCH_ENGINE_CLASS,
>  	XE_RTP_MATCH_NOT_ENGINE_CLASS,
>  	XE_RTP_MATCH_FUNC,
> +	XE_RTP_MATCH_SRIOV_VF_READY,
> +	XE_RTP_MATCH_SRIOV_VF_ONLY,
> +	XE_RTP_MATCH_SRIOV_PF_ONLY,
> +	XE_RTP_MATCH_SRIOV_ONLY,
>  	XE_RTP_MATCH_OR,
>  };
>  
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index 228436532282..ff9da494efcf 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -40,6 +40,6 @@
>  16023588340	GRAPHICS_VERSION(2001)
>  14019789679	GRAPHICS_VERSION(1255)
>  		GRAPHICS_VERSION_RANGE(1270, 2004)
> -no_media_l3	MEDIA_VERSION(3000)
> +no_media_l3	MEDIA_VERSION(3000), SRIOV(VF_READY)
>  14022866841	GRAPHICS_VERSION(3000), GRAPHICS_STEP(A0, B0)
>  		MEDIA_VERSION(3000), MEDIA_STEP(A0, B0)
> -- 
> 2.47.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
