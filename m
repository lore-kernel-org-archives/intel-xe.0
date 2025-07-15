Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62149C83F22
	for <intel-xe@archiver.kernel.org>; Tue, 15 Jul 2025 15:57:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AE5910E38F;
	Tue, 15 Jul 2025 15:57:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QztVmjVT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E10210E38F
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Jul 2025 15:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752595059; x=1784131059;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=zR0Un5Yf5SPD8bGYMIRzUkR7LgnpqazsXkzlXmbgUPo=;
 b=QztVmjVTu66K4CMR9QedvHhKgeHCC3+M/4mY1HhMFl89Mu9iPRwrljoe
 bZ0YJz3G39461XCJa9wLSNCeyM6G7txsv3SJ1ZPAvTcru8TwG++TuUpWq
 GAlw0XylJIZJjebmab2dgoIZB7uxrPzR5CBcUpgTMy+oQMsoUkn1FAGJu
 yFTWjI3yjyotg0NMp8lbKA3EjJR2KvnCVoEmbQLMPofgdiVxolJJgSffZ
 CrI1l2GUI1k2tnlbcxxPW0DCTIF+JmX7f72g4nEr6/cxaiJJxk6JOF3E3
 c/NFB0YZcOOR9Bh7SIHciKgjnSe6D8zx0ZdHwj2jhqRbbLDKenQCtjFiG A==;
X-CSE-ConnectionGUID: spC50FG+QT2WAs+hoPRZYA==
X-CSE-MsgGUID: J3+zeu7ZQG60Amt5bXCp+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="72274365"
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; d="scan'208";a="72274365"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 08:57:27 -0700
X-CSE-ConnectionGUID: 3srOm3nFSMqEppsFgr0fpQ==
X-CSE-MsgGUID: JrURm73sQ8O/U11xOVSMvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; d="scan'208";a="157612216"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 08:57:23 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 15 Jul 2025 08:57:08 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 15 Jul 2025 08:57:08 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.67) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 15 Jul 2025 08:57:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TOE/LTgRTsMs/twFlLD8nTzR02C4b80zun7pJvr7mJpkL1+eRIIxc9ewkhV8iF6YuWay7/VLfKZNdet2wMRK57PKI6vuH8hhIBB0EUU3UhDKzuIu0vkGLWfC5z/v39hsz+GklF0oI99q0Fr2irwd0JitffyyB38SvoRJjdXIZQ+c9d2izxuacWI//z5cbHmkGdIR+7UftMVLeZ/iBZyFxAgMuu23H8j7uGfjvXUkTxZJ9LyEFZBU01+/C1CXET0xbtCnodCTplgEudfEg5wbC4jwe2wpRvy0gulgKRrGlvBrfRtCXbxBhe3IAotq9JWIwF3tl2V4SAhY0HKohxGF6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BkdNKCBMZeCbiIaZypII/M/m3YiWJKPGJCHEr9Etg1w=;
 b=fei9WZxCDgrkFixhZ80ej5kW1adE7tjW4Asa4xih3YsrhAcP5Ljtz4I2QxsCJvUVv/I20d//5lV/AQscMpxR7jMYXJEK33C6d4KeIjc2MYTgDjH5ZSzXdJHwub8l4DOo50QR8dPX9g5yQ8vAaUG3l3hoWNjFeYtQgnF+UqAXWt7gr4Z4eJSgJLr1eXkNzkmM55EXlMFualgd2FFR0MuVHzscsw2ufEzgig5E7RmPOyCvwXSy795H8Qttk0is1TLuS0J3wnC+vM7nuyOexuXzbtzRG59CId16TpiwYrnzUx8wcfZzIHm8d0WoqQ6ueJjjoFzpG185cFBII5mxOXuTWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.29; Tue, 15 Jul
 2025 15:57:03 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%7]) with mapi id 15.20.8880.021; Tue, 15 Jul 2025
 15:57:03 +0000
Date: Tue, 15 Jul 2025 08:58:47 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <michal.mrozek@intel.com>,
 <himal.prasad.ghimiray@intel.com>, <francois.dugast@intel.com>,
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH 2/3] drm/xe: Update xe_migrate_vram to support compression
Message-ID: <aHZ6t3/theJMcqGB@lstrano-desk.jf.intel.com>
References: <20250714173342.2997396-1-matthew.brost@intel.com>
 <20250714173342.2997396-3-matthew.brost@intel.com>
 <0068e1bf-de5e-475f-9e4c-e4d358ea180a@intel.com>
 <953bb519-2e86-4cf1-be38-9455776d2c22@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <953bb519-2e86-4cf1-be38-9455776d2c22@intel.com>
X-ClientProxiedBy: BY3PR04CA0001.namprd04.prod.outlook.com
 (2603:10b6:a03:217::6) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|CY8PR11MB7828:EE_
X-MS-Office365-Filtering-Correlation-Id: 81318785-4e82-4a28-0925-08ddc3b83dac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?PmgNbdvUxpXrXO68sn+fGRlmZemLeaO1KT2XavshrKMwJLzAPeBtqHdfFV?=
 =?iso-8859-1?Q?Vf132+nzyonOCgCxCIXTcIPz0ZD8Uv8UpiwdA0jp3YuET+uPrHz0HSyzPS?=
 =?iso-8859-1?Q?tFNpn1RBypueNSnBc/I4CAAj7nrEkZcBo+KwbQpkZ/Cu311bFHTUPDcTjL?=
 =?iso-8859-1?Q?iws6Ugyc2b7hSvLfRSTdm0W6E6AXQvT86+4/uCbUPdaNERIBgIAQ3dxvWV?=
 =?iso-8859-1?Q?64wCxnSdB+63b28mCGIES4L3Va3slNzN4p4dEj23cOXEUqWjXnGBUdhfZm?=
 =?iso-8859-1?Q?xWXOqrRfXCOCga/wtCpyEI1Cicgi0fPtdqZVj5WD0NkQSp5YoaO4hicBoE?=
 =?iso-8859-1?Q?wxWH6OVf3JYiyQNr54wy6CN7PdWy9Nz+W4P/44VWwiciz2L7AYf7IkquDi?=
 =?iso-8859-1?Q?ljRM3gxYx2ZnVOECLKBW8UF3yVc0be2Sa/gWAkGkhwZzWTMcEDL0sAphQO?=
 =?iso-8859-1?Q?2cCy5b31jUfJt6qbPPBgxBZOMspsXj/dr4xI6/E8F2Ssf7q/tyqcJNWrbt?=
 =?iso-8859-1?Q?/R7st5M3Uqu3mokCkJ8a/SPB+0H+rCbczL9x7yGBcg9MtK/em+c+ka/2NQ?=
 =?iso-8859-1?Q?kS5AJnHghn/a8I30eLlx1bczLustIaLwaCqHixfpYH24D+189VoE/czdNp?=
 =?iso-8859-1?Q?DXPxr5F7em5kwc316V0TrY9KpwMHlyfDIkLEgc8sCbex0IeRlIhBoXx9ie?=
 =?iso-8859-1?Q?G2IG4mH9K9/h5sgA84war9Bq25qcuB0NkRk5adzyXW1QaZ0dunqIIZWDxR?=
 =?iso-8859-1?Q?600g3oiJSSPDVgk8+OkKTXb5V9Z1CpljJrBDm6tShGZv0iWxX4AyellOAY?=
 =?iso-8859-1?Q?x7briWAXWaJSHgtcvJ64Mwx01YItPoW9z49VwgI8CaePfvCUMPgRmcWIJu?=
 =?iso-8859-1?Q?VJhRSxgtJ52P2rHRDMdAVBG3yqGVFWb/9CHvSVAGxiky8m2JFnpzB1UXA4?=
 =?iso-8859-1?Q?o/9qvadWa9fEuLvrDcmw/A6DLkrwkCPLyNp5j3JarVuFml+YWZ/h6itWKX?=
 =?iso-8859-1?Q?MMf256tsxQw4qZUUXj3DMAPSZh8bCxhY3MVtXbi+n5HngkkNJkDHln9Hs9?=
 =?iso-8859-1?Q?zgRU0HgBBgd4Dp4mWI0h87LaOWgJZ8BquzigSg8xiWQ+MRwvBuV4sxEm96?=
 =?iso-8859-1?Q?MO1JesOPEreW+wceNouA3ux90JqZ0b/Zx5U7fPtQZoo9bSEVKzDOQjG5A6?=
 =?iso-8859-1?Q?VLVNJHlAa4ZFRRqXBQI7dI6rkZ+HvqDbHr/2YvjS12nV8v7hq8ralkqui1?=
 =?iso-8859-1?Q?5sVRLUoCHvXKUTZKlV1yM9kXi1D4CGxwYG/YdMMwJlJtGu5f5cFxuO4ied?=
 =?iso-8859-1?Q?pv7p48vwXzuTRkCqw33aZivCkqRfCvsZqPuTnlzxArpvORXOkgc6aWqkcx?=
 =?iso-8859-1?Q?tE/wGN9SNKX4KEB4iMKiIfnI+Wjq6yWRFGQ1WskV/lKTaE0JNWIfbe4KZo?=
 =?iso-8859-1?Q?UfBVqLiNCX8M2LRn1EnPaehfgOKs3OY3GtP7D4wCSJy1xh1Vo1mj5X+AFs?=
 =?iso-8859-1?Q?8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?OpR5FgHbmrrDap8KlHN6HqJ3FhaTCY8MuMUIExOmop4LKj+PmS4fcTwC/B?=
 =?iso-8859-1?Q?BsZEDRcCt6Qek4JSxg+aRkq+tl0t4T4IoAtHEcrkXW0ZLotlaRRDBnVXhM?=
 =?iso-8859-1?Q?tp2HjzQ2Zx+8+Hwc/4ihI+IFbA8TLBLTP+zYtTj1yafrh77QXV6sNucx3P?=
 =?iso-8859-1?Q?bk9lLcfJGcQ/UiBPr44A5dzS3lbP1OFIfMvML/tybdIREfA5AErb1Df9UU?=
 =?iso-8859-1?Q?WqiVrASrfFlOxLXLe1zbKwyHfy0sZQqg0Wzq168HvYtMJUVxLGmf/RRx9R?=
 =?iso-8859-1?Q?g+vUsSwuYOlVA7zAjwwF50fV9TAcPK1AkV9X/jWz1j0KKEFL2HSgFSRAp+?=
 =?iso-8859-1?Q?96oZXQuAocSN0D07MLWq/l4QxQ/8ytgJn93JOl6l+atVPQrhlYTZuiDb9l?=
 =?iso-8859-1?Q?NOmptl5/CbAb6JANhTPKcIhJuPCULU4sX7dSp8bbbz6MlL3yB2QYiDduiq?=
 =?iso-8859-1?Q?sJvM4FuVY4FPxjdNDx89SOcnoNsRLzdMFGZ8uMUg0DIDaCA+qMayWjkwnc?=
 =?iso-8859-1?Q?qjJVrnWf2IcqTLV+MqgSBz729uOyLYSZCDQ3xVkWK/KYNijE0aqgsOgQLd?=
 =?iso-8859-1?Q?2pGEduwvgtFL7U/XQnrzV6imNPcGMgFNJU7uMTvEltW1gevvExllJTArhm?=
 =?iso-8859-1?Q?OC9cQlrUzzYmHxMBSKsL3A1aOf50mZzmGd96ZFGtF4kxhCEusXRy7qiJw0?=
 =?iso-8859-1?Q?gHgcP+fpYBDTz36gOMmJ/oiU6jcdMXuxLHCm5O1POEn4P61cJoVfmXYDy/?=
 =?iso-8859-1?Q?P15P2sDUjfau4CDigs09xysmzgY8rvGlCszc7EwXj+5z+I3QYFo/Ji00BZ?=
 =?iso-8859-1?Q?MGKYQdIDG41yQcKxnQ/sYdPUHNLqW3+YcNlQ5kN2gLHKI20YZvv2nJk/SI?=
 =?iso-8859-1?Q?e/cRhobIHNxEbGEdGRcZKJA7qlBAHAYD0mZTenLcRZ2LVVxhqjQheyonGY?=
 =?iso-8859-1?Q?LnBJoZRVJUjM/A+nVpkxu4qkVTc9NMSrQAOBO3njcgyvuABBWQtz1PK1Ab?=
 =?iso-8859-1?Q?gbO7WIIGJbf1donzsDx0ctz7A25d29JRbiWgRCogmWIMzeF9FZjprOFYOQ?=
 =?iso-8859-1?Q?7VL3vHCBm8jR04+AbBJEKka5FMBEUJbE9lJFhujfgQvfanppAwaXFvxFE8?=
 =?iso-8859-1?Q?rFlB96K9fd5ks/Uguqh6kMipqXgWhz6eZG4aH8LVTw0VKcUz3DN9omnImY?=
 =?iso-8859-1?Q?UQfh3Y0/KBN0lFpBjiGpR/xpisUrirTumdYOoZ3m2GXF92EzXfAheXx1aZ?=
 =?iso-8859-1?Q?tTJU7MxrV2Pz4vm6i99QRmbgdptI2I/Cycj5VsTtrSMoN80yOaF5s/m+j3?=
 =?iso-8859-1?Q?ASEz22F4DIk6s5RiJiKpqt1dtrlNuZX49j8D2JLkug/Ut0M5TCYfFTJJKO?=
 =?iso-8859-1?Q?51LGctCr+9QqU8BAmrhnGLAUuZztyr/n23mvNAYXeXZRrgpOaqCzco/Vgf?=
 =?iso-8859-1?Q?+qToUePQYR0TP2lQacD/bMDqp7K0ReuXF8KVvLXHKj3LkIKJC+lfPv9sWH?=
 =?iso-8859-1?Q?Eu5kCtPlrXKwpNh0jIIBVvwQFYBeN+gKBMiP6mV98EaIUFFAHl1kGHLdfU?=
 =?iso-8859-1?Q?IBID27QxHJgw6RXE9cuSGr2casksF3e1nJPrQnQ964QvS54gU/y0Z0YwX4?=
 =?iso-8859-1?Q?30/rAuQUT+2bP5nPlKPuhjJdset77MD7/sMeqHu5XXw4zN5ygDwuGfEA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 81318785-4e82-4a28-0925-08ddc3b83dac
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 15:57:03.5597 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ViLVXqYWQghasV7lP0H50FFEMMWMi1+8Asrp809dym5JQ1smKAc4cepdm3e9QrGG5qFfbjJgQKHIi+37Zdnl9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7828
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

On Tue, Jul 15, 2025 at 09:49:01AM +0100, Matthew Auld wrote:
> On 15/07/2025 09:37, Matthew Auld wrote:
> > On 14/07/2025 18:33, Matthew Brost wrote:
> > > While SVM does not currently support compression, other users of
> > > xe_migrate_vram (e.g., devcoredump) expect the data to be read back
> > > uncompressed. Update xe_migrate_vram to support compressed data.
> > > 
> > > Cc: stable@vger.kernel.org
> > > Fixes: 9c44fd5f6e8a ("drm/xe: Add migrate layer functions for SVM
> > > support")
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/xe_migrate.c | 31 ++++++++++++++++++++++++-------
> > >   1 file changed, 24 insertions(+), 7 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/
> > > xe_migrate.c
> > > index ba1cff2e4cda..936daa2b363d 100644
> > > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > > @@ -1613,7 +1613,8 @@ static struct dma_fence
> > > *xe_migrate_vram(struct xe_migrate *m,
> > >                        unsigned long len,
> > >                        unsigned long sram_offset,
> > >                        dma_addr_t *sram_addr, u64 vram_addr,
> > > -                     const enum xe_migrate_copy_dir dir)
> > > +                     const enum xe_migrate_copy_dir dir,
> > > +                     bool needs_ccs_emit)
> > >   {
> > >       struct xe_gt *gt = m->tile->primary_gt;
> > >       struct xe_device *xe = gt_to_xe(gt);
> > > @@ -1623,10 +1624,12 @@ static struct dma_fence
> > > *xe_migrate_vram(struct xe_migrate *m,
> > >       u64 src_L0_ofs, dst_L0_ofs;
> > >       struct xe_sched_job *job;
> > >       struct xe_bb *bb;
> > > -    u32 update_idx, pt_slot = 0;
> > > +    u32 update_idx, pt_slot = 0, flush_flags = 0;
> > >       unsigned long npages = DIV_ROUND_UP(len + sram_offset, PAGE_SIZE);
> > >       unsigned int pitch = len >= PAGE_SIZE && !(len & ~PAGE_MASK) ?
> > >           PAGE_SIZE : 4;
> > > +    bool use_comp_pat = xe_device_has_flat_ccs(xe) &&
> > > +        GRAPHICS_VER(xe) >= 20 && dir == XE_MIGRATE_COPY_TO_SRAM;
> > >       int err;
> > >       if (drm_WARN_ON(&xe->drm, (len & XE_CACHELINE_MASK) ||
> > > @@ -1637,6 +1640,8 @@ static struct dma_fence
> > > *xe_migrate_vram(struct xe_migrate *m,
> > >       batch_size += pte_update_cmd_size(len);
> > >       batch_size += EMIT_COPY_DW;
> > > +    if (needs_ccs_emit)
> > > +        batch_size += EMIT_COPY_CCS_DW;
> > >       bb = xe_bb_new(gt, batch_size, use_usm_batch);
> > >       if (IS_ERR(bb)) {
> > > @@ -1652,7 +1657,7 @@ static struct dma_fence
> > > *xe_migrate_vram(struct xe_migrate *m,
> > >           dst_L0_ofs = xe_migrate_vram_ofs(xe, vram_addr, false);
> > >       } else {
> > > -        src_L0_ofs = xe_migrate_vram_ofs(xe, vram_addr, false);
> > > +        src_L0_ofs = xe_migrate_vram_ofs(xe, vram_addr, use_comp_pat);
> > >           dst_L0_ofs = xe_migrate_vm_addr(pt_slot, 0) + sram_offset;
> > >       }
> > > @@ -1661,6 +1666,17 @@ static struct dma_fence
> > > *xe_migrate_vram(struct xe_migrate *m,
> > >       emit_copy(gt, bb, src_L0_ofs, dst_L0_ofs, len, pitch);
> > > +    if (needs_ccs_emit) {
> > > +        if (dir == XE_MIGRATE_COPY_TO_VRAM)
> > > +            flush_flags = xe_migrate_ccs_copy(m, bb, src_L0_ofs,
> > > +                              false, dst_L0_ofs,
> > > +                              true, len, 0, true);
> > > +        else
> > > +            flush_flags = xe_migrate_ccs_copy(m, bb, src_L0_ofs,
> > > +                              true, dst_L0_ofs,
> > > +                              false, len, 0, true);
> > > +    }
> > 
> > I think we can drop this and anything related to needs_ccs_emit.  In
> > theory we should only need the use_comp_pat change. IIUC this path is
> > VRAM only, and only xe2+ can be decompressed in the KMD (dg2 is no-go),
> > and for that we don't manage the raw CCS state.
> 
> So xe_migrate_ccs_copy() is not actually decompressing anything, but rather
> copying the raw CCS state around, which I think we use for manual
> save/restore during swap and things like that to preserve the compression
> state.
> 
> I think we do also use xe_migrate_ccs_copy() to intitially clear the CCS
> state, but I think that has already happened somewhere else? Or do we need

Yes, the clear has already happened on BO allocation (or free when that part merges).

> it here, if we say go from tt -> vram on platforms like dg2?
> 

This copy to user path readable path either in devcoreeump, or SVM page fault.

I agree, this part can be dropped.

Matt

> > 
> > > +
> > >       job = xe_bb_create_migration_job(m->q, bb,
> > >                        xe_migrate_batch_base(m, use_usm_batch),
> > >                        update_idx);
> > > @@ -1669,7 +1685,7 @@ static struct dma_fence
> > > *xe_migrate_vram(struct xe_migrate *m,
> > >           goto err;
> > >       }
> > > -    xe_sched_job_add_migrate_flush(job, 0);
> > > +    xe_sched_job_add_migrate_flush(job, flush_flags);
> > >       mutex_lock(&m->job_mutex);
> > >       xe_sched_job_arm(job);
> > > @@ -1708,7 +1724,7 @@ struct dma_fence *xe_migrate_to_vram(struct
> > > xe_migrate *m,
> > >                        u64 dst_addr)
> > >   {
> > >       return xe_migrate_vram(m, npages * PAGE_SIZE, 0, src_addr,
> > > dst_addr,
> > > -                   XE_MIGRATE_COPY_TO_VRAM);
> > > +                   XE_MIGRATE_COPY_TO_VRAM, false);
> > >   }
> > >   /**
> > > @@ -1729,7 +1745,7 @@ struct dma_fence *xe_migrate_from_vram(struct
> > > xe_migrate *m,
> > >                          dma_addr_t *dst_addr)
> > >   {
> > >       return xe_migrate_vram(m, npages * PAGE_SIZE, 0, dst_addr,
> > > src_addr,
> > > -                   XE_MIGRATE_COPY_TO_SRAM);
> > > +                   XE_MIGRATE_COPY_TO_SRAM, false);
> > >   }
> > >   static void xe_migrate_dma_unmap(struct xe_device *xe, dma_addr_t
> > > *dma_addr,
> > > @@ -1890,7 +1906,8 @@ int xe_migrate_access_memory(struct xe_migrate
> > > *m, struct xe_bo *bo,
> > >                         dma_addr + current_page,
> > >                         vram_addr, write ?
> > >                         XE_MIGRATE_COPY_TO_VRAM :
> > > -                      XE_MIGRATE_COPY_TO_SRAM);
> > > +                      XE_MIGRATE_COPY_TO_SRAM,
> > > +                      xe_bo_needs_ccs_pages(bo));
> > >           if (IS_ERR(__fence)) {
> > >               if (fence)
> > >                   dma_fence_wait(fence, false);
> > 
> 
