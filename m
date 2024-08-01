Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A45CDC3DA4A
	for <intel-xe@archiver.kernel.org>; Thu,  1 Aug 2024 18:15:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 700C810E91B;
	Thu,  1 Aug 2024 18:15:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NpjUJRMt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ADAE10E91B
 for <Intel-Xe@lists.freedesktop.org>; Thu,  1 Aug 2024 18:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722536118; x=1754072118;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=0YW9KkcLce/LoIRJ1tnJO2+U8N90N6OQIXnija43QDk=;
 b=NpjUJRMtR2pr/1ZgtY3IHc/mzk+TJCpB9Oe6mPy/yTybol8xQUga2U78
 0IbSBdDH42QLznCYc3EnOkV3i2nJ7wkVKQZ8DWW4gjepNZ7J7tt3Dtszg
 Fi1YToy4EukbC5OhhxlOL3FhW+DHDv86J+//fErigztVy62E2eznEaL9t
 UOurKfeouRSLwZxI2XkrOz9rzxmiKF8b2MV/zl34E5wXXFCHbiGKl8ueC
 8BA5N15gXVRF3H24vi98L9360QmtUjjEU9AnRPprC6u6xbDry9d/87JxM
 PtPwBksvKvx/ikEz60KYQuAiW6dxxf4G5iPVT9/DugUlJ2MDtP0D4JMh4 g==;
X-CSE-ConnectionGUID: VtdfcPG8TK212aCnwRsP0w==
X-CSE-MsgGUID: qoqG6AZaRJmfZxqlO5/Hig==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="31150708"
X-IronPort-AV: E=Sophos;i="6.09,255,1716274800"; d="scan'208";a="31150708"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 11:15:17 -0700
X-CSE-ConnectionGUID: sJxGmTsJRgGhmNfwknLcWg==
X-CSE-MsgGUID: +O2w2uUmRraHgc5x6PnpbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,255,1716274800"; d="scan'208";a="55220540"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Aug 2024 11:15:17 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 1 Aug 2024 11:15:16 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 1 Aug 2024 11:15:16 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 1 Aug 2024 11:15:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ocmGtKTq8EEXy4jRp+IeVLqOblqcdF/dm9VWVyzOnHMIzuBAwwaLj9A4vAv/WVXwNFe84zrEumB+zy5Hi6FaZaqX5RW0rTwuJXhPxxfVgBvT5vlvqZ9TVAM4AU46W4l4oGKvsnssEjxViLfNRlAT66TA6Gqszcuy5T+CLV0dOytP7dIx3jdkoAehPogR/Ll8gOSD+VNfwgOzPP6EIfKMzyBzpYrBK62qg6dAVwvs5ZVrIfGvx3hXstmhrvKpQCj311rOqiUQGo3i3mJHGaA6g1L5+BDTq2AJDZAhT8LlDlgt3W8WPoHlAY1pMupbyO7+19To9LnhywmsO+x53Hr15A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UxIk2nE8USrEKtcbf0SuUBXKz3mIgKBDvL3fMyb0wEU=;
 b=I/atfivtuYy7jhPdcf9otaUUKyiMUfeE4rUB6bPuLhJpmP21/iEfnqBp54bXC77jppP3mrEdsvKM65a7KO+kIeWS+I7h593ZTcGVMAYR5IA6Tc6PIk+HvcLwHtxjP4QeO+q5XVO4ddtDM9k7LGxWKBWG+nDdNfsQnc0l8128TGECp+jIu6ZgCG9l9lENafkZ8/CdbNTl4dMHW2b8dr9viaJB6IoMQcoL3P0kyJjfOKKPX2s1XW2aUOQNiLzAx+W9QgEQtAWxRcp9FzMVeTnwdCGttsgWcTdO+uAgUJz4WT2+r21qC6IHtUsNgGMZUzg+0RdG14xAUBCtmfgkrDybdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY5PR11MB6282.namprd11.prod.outlook.com (2603:10b6:930:22::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.23; Thu, 1 Aug
 2024 18:15:14 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7828.021; Thu, 1 Aug 2024
 18:15:14 +0000
Date: Thu, 1 Aug 2024 18:14:21 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Souza, Jose" <jose.souza@intel.com>
CC: "Intel-Xe@Lists.FreeDesktop.Org" <Intel-Xe@lists.freedesktop.org>,
 "Harrison, John C" <john.c.harrison@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>
Subject: Re: [PATCH v5 1/8] drm/xe/guc: Remove spurious line feed in debug
 print
Message-ID: <ZqvQfUZcHc91EApC@DUT025-TGLU.fm.intel.com>
References: <20240729231753.3101070-1-John.C.Harrison@Intel.com>
 <20240729231753.3101070-2-John.C.Harrison@Intel.com>
 <9306b3ec-3999-468b-8395-dc3b7900ff6f@intel.com>
 <a9ef6254-f428-47b7-827d-82ec94408ca2@intel.com>
 <1dd11a1f9d0ba530483bc443f6ae09481569fb17.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1dd11a1f9d0ba530483bc443f6ae09481569fb17.camel@intel.com>
X-ClientProxiedBy: SJ0PR03CA0297.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::32) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY5PR11MB6282:EE_
X-MS-Office365-Filtering-Correlation-Id: 3022f4d4-fbb6-4ead-ba1f-08dcb255e3db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?KB0tBhwK4mml/jSS15Q6tZnIzTQGeX+b0Ji4dYBCetZRG2ekVEVYsmk3Lw?=
 =?iso-8859-1?Q?pvxRmcrbpfxcSYx5pLIPr2Fh+lKCRbXXXxIM/grdZmbdZLVF8856jXfIGQ?=
 =?iso-8859-1?Q?/o5lP6n+evJSxGxRv6YVJnd3vf9p8bUV8LmmUtUcV65F9R3Mkwmfg4xn2v?=
 =?iso-8859-1?Q?Zmqx0DJpKRwrwC5nUkrHSFXLNBjyWA3dx74bKFOwZ93f4MW6NB8RSFJVu5?=
 =?iso-8859-1?Q?qCcqZPi2p8dsEz9A1pjNn3PYu/ApCR1WinAnPHeOM6a8gRzJt4j8EhWV5O?=
 =?iso-8859-1?Q?bfjy0m//YqbCeACFHyLVdcZTiWzAPNivOTMpOdYgOf+SAurkIf8T7asxbo?=
 =?iso-8859-1?Q?wpl46lLUQ1vI/xGqWFHsjScbpDYf7KTJ+PjUHVbe8Ahvv7+CoE4ZB69Rmc?=
 =?iso-8859-1?Q?X82z9ErDNQTC/iuu6ZMCruH7P1QGpYBN9/JEZZ54CtoDIbaWFvR6q1OkQy?=
 =?iso-8859-1?Q?s8JWZPyp63E7NZHSjavF+VrG1oainWUAF5m7qZdK3Bpab4yMzbRz+tME5Y?=
 =?iso-8859-1?Q?NRiCr8wOnYYs7fbr8gukXApbvvgU2bgqsFXYAuUvqSmedWguwhnV6yUX8C?=
 =?iso-8859-1?Q?kG5ULDt1vtMxOWWOrMneZJ9C1Thdd32vOq1sNs4WC9AoEWgwcIfPVjLOq0?=
 =?iso-8859-1?Q?uTDEuDIs1nWbGKN4VcGkRx6a9rdhITweL2F9EWZnYIsXotJf3bhhxbP9zI?=
 =?iso-8859-1?Q?ATNJRu0AQ7GDAwSUKsgZmLPlznaAusDCXctKzc6tAtCFJgaKthkl8NtpYB?=
 =?iso-8859-1?Q?st0ybin/64TW0t5g/aVuJ4258MHI7BF44YEt/ypS/H9o0MXptIyUIA2w06?=
 =?iso-8859-1?Q?kJFRLQ75WhxlTPxl3aE/NTiO0twEJU1x2EcQECawEBwYNPdrKA0/I+2fSF?=
 =?iso-8859-1?Q?KD0fRqXhutrNVPRWbHPGgqQ7PPVXBElSnsmGCxRmSxKeU+aFVL67cRRqnw?=
 =?iso-8859-1?Q?MYix3rUvuv7JD7O1/Xp26uEauWpPp8dFBnj4Giu9ZoM97ihpsp5ptAHiyr?=
 =?iso-8859-1?Q?1PryOyHLcjDDH7FKQp9qx0FPFM5bwo0Z0gX11g6edoFWBNJtXjqnPBc1MB?=
 =?iso-8859-1?Q?OTIoqg1u4z5e15yL3PGk63pq3nElYWC/DPgvyaGUBf+jfC2EB4YV7eguLb?=
 =?iso-8859-1?Q?nN8dxnWsg6dIvzk4Ckd1iKGil9NMdJ155KnVEec+0wCd8AviNkTARgES32?=
 =?iso-8859-1?Q?aTkngsSEv0S3vBsk8REX517Q1hxDYa0ggjvGl5EEghoXTNLsZ9xOpjZwgI?=
 =?iso-8859-1?Q?DifOZZIGFWAfQbr0sKtHC+2g4OQNGmCXnsx+wFF11P31eP2Lau9uoi72K7?=
 =?iso-8859-1?Q?2RgwQ8jZKsjXE7k/OSKtWk+OY4mgSau/yHVezRb9VE+Hoc0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?b0MrR7Gz0EwVdd09k+JS57PyCLIBQVM33HUx/JB0n0AKl+BmTUNPGF/Cpc?=
 =?iso-8859-1?Q?ndf1/YQ30iogzMvX6RKxygTr0M2fTTIOS9B60HGKhGENFhLcbuLinOXwC2?=
 =?iso-8859-1?Q?kKsD0uI/HyW7E41+A2slFLNGOYsZYevXkioYDM7hprZ1Fwk+QMUXzW+BID?=
 =?iso-8859-1?Q?IcSvJvQ+4IdlHn6sZG4V8pN1s7YU1YSmmS33DMK7cG+XaILa/qLCllQ+X+?=
 =?iso-8859-1?Q?uJNq8X2Cl2I8KIslaqy40mLr8eSp94PsiwlnSb1zUcU2HwkJLwY3pZ6h2x?=
 =?iso-8859-1?Q?4hhB7VqQvonGsAuSpjEYUUv+TztJdoG6O8nS1otXg2n/Srge1UaE8DpbeP?=
 =?iso-8859-1?Q?Te5/cZpx9nX5QjXW80VC/U4yd5bdxnlwCOFlMeQYdVjqbcmfHAH+j8yTmq?=
 =?iso-8859-1?Q?AtbVKsTToVZPygbxJEIeuLdK+2oaNjt6wGFrvxHvVabvDTCYhLVxtvOWeH?=
 =?iso-8859-1?Q?5mt1KJA64weFAjoFceEBl6qFADXTdQqJedliH5uHZIos1X3T0vFkFLzniD?=
 =?iso-8859-1?Q?eU9tfIYFGa1AoF6NqWzWDf1a/mdKesdpKESMBnB3HM7AUAqGVLzigw2iLr?=
 =?iso-8859-1?Q?QaLpdX2nNaymD1BmS73k0mRRSzjKKmEgrq83mxf8TVa4AalFhw8SiHvFH0?=
 =?iso-8859-1?Q?oVeNF+enWp2MBDeQ7yeHhOvPrsAQ3Rb+eeq813hhAb+362dMl/nhTo0eLf?=
 =?iso-8859-1?Q?txLHeqWHdOmjlcGv/Yrs7TJM4qG205zfgcYYz8VQEk3IqduuBNgvHRm2RJ?=
 =?iso-8859-1?Q?y0kHe2D8o0PSEj0Z5ROTYM4Zp9GPUNtgtVerC1M01FyoZWJkIf/flGIm1j?=
 =?iso-8859-1?Q?/+LBaGLju7zNX1XyJP0VYuoySdiwIDW/qngUvSm6zMbdZvAjMChjiWN7yj?=
 =?iso-8859-1?Q?/Vd3MaXOwTwbIo1Djl6Fw9/wEjn+8AK53cU0DfmBm0W2sRVZb953i36F5f?=
 =?iso-8859-1?Q?d0/r8OBA1mihyVnctpNM5SqV039Pbzd8y5gKnJpERvBsUymCk7WosVzpmH?=
 =?iso-8859-1?Q?Vl/8zQdt75JnU9/nHIRPRupELClNZhhfFracfzyq3J0/QabA4qPsynyesU?=
 =?iso-8859-1?Q?E8jCEqTaNKAnx0U7/o6la92CwdLr7vM0B+Tr3yb0bk5Ivz5J/8Gu7VmNp4?=
 =?iso-8859-1?Q?Irc2yy9EUebBjTr5Xl4BrDTHip/dUn+mEsFk3AE2tzR/pazewYDJZ6CXVj?=
 =?iso-8859-1?Q?6g0wBJL+09qPlsBWz5rYDA9wyhcWsKhlv5YAjH58PAB1uBfJ3Su+plbh9e?=
 =?iso-8859-1?Q?t8b3JYz37tn7Lk/Wl6INMI96V3hngcG9w8f61fLkXzsDpma6TFLVg3CswE?=
 =?iso-8859-1?Q?AaMD/asRNcJs7/CMWMl4vFDn9hLy0FQlNUbFucVAes+iBJ+C/je468zdXS?=
 =?iso-8859-1?Q?FV1S5HQor1w7HaTndZsVlta1w/YfG3EqGOeyw5B1UrWllGG2wpyZfbakoa?=
 =?iso-8859-1?Q?1sPJUjKQbTFO10XqdbqcZw2hfPMDAS3U9eGACH+vYvs1OvrX9HncmW5laz?=
 =?iso-8859-1?Q?MZdI/y0Cfd74AT0tgS+qZ2N0/arLGFxuRvms1405dQmjycrcRcO6fV7Pty?=
 =?iso-8859-1?Q?pkzUyfp6hThMSzGAnbpLtoOs4UigzUd/8q7VjtgJKv+zQzByY3kj1l+/lj?=
 =?iso-8859-1?Q?14kLNz+/8TqOKbIN5dt2ttxfgDadClCOYq4NG7i1ioD0l8onKPNEMVkQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3022f4d4-fbb6-4ead-ba1f-08dcb255e3db
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 18:15:14.6056 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u7dWILiM4K+dT47TCm2FaDhalP27Cs9p+h+JWWmV4GcpKO17o/N2grjZrIaIKMx9fD930Mgsp4P1g3NJL7pksA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6282
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

On Wed, Jul 31, 2024 at 08:14:23PM +0000, Souza, Jose wrote:
> On Wed, 2024-07-31 at 12:56 -0700, John Harrison wrote:
> > On 7/30/2024 02:14, Michal Wajdeczko wrote:
> > > 
> > > On 30.07.2024 01:17, John.C.Harrison@Intel.com wrote:
> > > > From: John Harrison <John.C.Harrison@Intel.com>
> > > > 
> > > > Including line feeds at the start of a debug print messes up the
> > > > output when sent to dmesg. The break actually appears between all the
> > > > usefu
> > > typo
> > > 
> > > > prefix information and the actual string being printed. In this
> > > > case, each block of data has a very clear start line and an extra
> > > > delimeter is really not necessary. So don't do it.
> > > > 
> > > > Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> > > > Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > > there was some discussion about merging this one without a conclusion
> > > 
> > > [1] https://patchwork.freedesktop.org/patch/601018/?series=135447&rev=1
> > The last comment was for Mesa people to shout if it would be a problem 
> > and no-one shouted, so...
> > 
> > However, I would strongly argue that devcoredump exact layout and 
> > content cannot be considered UABI because it is going to change as the 
> > driver changes. Some of the information being printed is internal driver 
> > state. Driver internals can never be UABI. If there are userland tools 
> > parsing the dump then those tools have to be able to adapt to changing 
> > core dump formats. There is also the argument that we are still in 
> > force-probe so there is no fixed UABI yet anyway. So now is the time to 
> > get the formatting as good as possible before officially going live.
> 
> I don't think KMD can freely break fundamental UMD tools, during my time in KMD team it was not even accepted to break the behavior of a sysfs only
> use by IGT display tests.
> 

I agree with John H that we can't have devcoredump output be UABI as
over time this will change as the KMD internals change. Perhaps in
devcoredump, we include a version number or something which indicates
the format? I know version numbers for uAPI is a no go, but maybe this
works devcoredump.

Matt

> Like I said in the previous version, I agree with the change if you add one line breaker in the end of guc_ctb_snapshot_print(), with that: Reviewed-
> by: José Roberto de Souza <jose.souza@intel.com>
> 
> having a break line between sub-sections is good for readability:
> 
> 
> **** Xe Device Coredump ****
> kernel: 6.9.0-rc6-zeh-xe+
> module: xe
> Snapshot time: 1715877420.647211377
> Uptime: 70684.605982665
> PCI ID: 0x9a49
> PCI revision: 0x01
> GT id: 0
> 	Type: main
> 	IP ver: 0.0.0
> 	CS reference clock: 19200000
> 
> **** GuC CT ****
> H2G CTB (all sizes in DW):
> 	size: 1024
> 	resv_space: 0
> 	head: 978
> 	tail: 599
> 	space: 378
> 	broken: 0
> 	head (memory): 599
> 	tail (memory): 599
> 	status (memory): 0x0
> 
> G2H CTB (all sizes in DW):
> 	size: 4096
> 	resv_space: 1024
> 	head: 626
> 	tail: 0
> 	space: 3071
> 	broken: 0
> 	head (memory): 626
> 	tail (memory): 626
> 	status (memory): 0x0
> 	g2h outstanding: 0
> 
> GuC ID: 9
> 	Name: rcs9
> 	Class: 0
> 	Logical mask: 0x1
> 	Width: 1
> 	Ref: 4
> 	Timeout: 0 (ms)
> 	Timeslice: 1000 (us)
> 	Preempt timeout: 640000 (us)
> 	HW Context Desc: 0x01480000
> 	LRC Head: (memory) 280
> 	LRC Tail: (internal) 552, (memory) 552
> 	Start seqno: (memory) -125
> 	Seqno: (memory) -126
> 	[HWSP].length: 0x1000
> 
> 
> > 
> > John.
> > 
> > 
> > > 
> > > > ---
> > > >   drivers/gpu/drm/xe/xe_guc_ct.c | 2 +-
> > > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> > > > index beeeb120d1fc..422c3f5c87d8 100644
> > > > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> > > > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> > > > @@ -1515,7 +1515,7 @@ void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot,
> > > >   		drm_puts(p, "H2G CTB (all sizes in DW):\n");
> > > >   		guc_ctb_snapshot_print(&snapshot->h2g, p);
> > > >   
> > > > -		drm_puts(p, "\nG2H CTB (all sizes in DW):\n");
> > > > +		drm_puts(p, "G2H CTB (all sizes in DW):\n");
> > > >   		guc_ctb_snapshot_print(&snapshot->g2h, p);
> > > >   
> > > >   		drm_printf(p, "\tg2h outstanding: %d\n",
> > 
> 
