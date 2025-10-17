Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D630CCD199
	for <intel-xe@archiver.kernel.org>; Sat, 18 Oct 2025 02:46:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2029710E1DC;
	Sat, 18 Oct 2025 02:46:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iyQN5cbY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8A5110E1DC
 for <intel-xe@lists.freedesktop.org>; Sat, 18 Oct 2025 02:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760755566; x=1792291566;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=wFSe1XOg/TpSWha/gcPr1YhIwm0iV/yIYdgZtwrqO1E=;
 b=iyQN5cbYtETFK4t4tD/OVwTa9H0ek9EH9VqCo3slS3TNrWCl9X6pPU/J
 qDiay7mVA5iX6seMKkkWJ84FttCKgiYFchqhKVyh1kJXYDFISx3fmPn0z
 HTHdEJAl5NxMS/WC54M2i3NjPFlcGh7iEhLfrVG2uAdebXzCX+4Ar52NH
 /X1iKh/wqraKPMURZrha3Xx56kBfxFmo0n9tqhz68xKZFKBP1HpF1RSV2
 JcRIH7pU+D31DBxopZo4H8OvvnxOBxf2NLDDRTiEueKaWjtFNostPI+j8
 k7LYDLDvU5wBZsGwyx2Z6A9uLU2+GmyFBhTujsR8kLCIz1nsIuJfpQ+Zd g==;
X-CSE-ConnectionGUID: 0KJ4N0wYRo+lF9kmAwBl/Q==
X-CSE-MsgGUID: RM9dho5iT4yj5TbG3WNhFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11585"; a="74083936"
X-IronPort-AV: E=Sophos;i="6.19,238,1754982000"; d="scan'208";a="74083936"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2025 19:46:06 -0700
X-CSE-ConnectionGUID: LKzJxQ6GQHCKbRK6l8O9gg==
X-CSE-MsgGUID: TEiDvji/RRis1SeJbufaTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,238,1754982000"; d="scan'208";a="206582531"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2025 19:40:30 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 17 Oct 2025 15:35:24 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 17 Oct 2025 15:35:24 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.70) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 17 Oct 2025 15:35:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tTMZ2+FIsLfVK9ZDa1wLMXDQ1VPy3mhBsQ0nGxmIzY0kscny46Oiuv2S06WPClMER8HpPcdYvA5jqvGL2MGvVtDpjZICubWBBHSJbwAcE9x7M9sI8pl6e46pXIaTplqJDNZmPgicLtdxQvh+SxWCaPUSlfO2TFAtgbo0cFdWxNpCrzY1hshO0mNf1E8B0BRC/ywj1eNfkEuWqcuJ+P88Z7lHaEIg44baJwv13fIZ9tFd2skZEHpQonB7W7R4Y5WFbI2cPSU86063BtUabyS/a2bciUsY9IR0u7vaeQQQWdgfi22+EV0mdP5GWWRwfVcYYqRk+m7WDQsKOTXGKjgSEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qq2KmgK4Ft0EuP7iU9dbp9VuImuWUeDQ0rl7xDPOupY=;
 b=q/82DVeqlXceh+Tqeps2jHKQ54ydU0ngpjLHMAqZpKmmZ9Rq+1TmGD2QyiGRMKq9wrbgrkW8d8H3gvA3HOheAYAMLksaR6oMEBxxFWbv+pZs+w11ztd0EsfLb49FPcUB7SqDb/ym2Sv7LyUFNU8bzpm77xSaEkNAKqnLk4sm/b92PWlgysiyyX1l3aRTs8zbjcSn08oCgR7yQcE012FJmKiJwAqhHcnJQJnaYukfyIkuFIaPs6//QrfuQAVDjY4PRWwbe9unBw5wXl0Gkfu2qdm5Jt4xux9AEWMFCGYeseWNqsUGjarGT396nKtZpp34nwXPf7q8L3gqrye08sxiMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DS0PR11MB7287.namprd11.prod.outlook.com (2603:10b6:8:13f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Fri, 17 Oct
 2025 22:35:19 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%4]) with mapi id 15.20.9228.011; Fri, 17 Oct 2025
 22:35:19 +0000
Date: Fri, 17 Oct 2025 15:35:16 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>, "K V P, Satyanarayana"
 <satyanarayana.k.v.p@intel.com>, <intel-xe@lists.freedesktop.org>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Subject: Re: [PATCH v7 1/3] drm/xe/migrate: Atomicize CCS copy command setup
Message-ID: <20251017223516.GY1207432@mdroper-desk1.amr.corp.intel.com>
References: <20251017141226.924-5-satyanarayana.k.v.p@intel.com>
 <20251017141226.924-6-satyanarayana.k.v.p@intel.com>
 <aPJSNo8XM3cpGZCb@intel.com>
 <78cc87ee-6d2d-4a85-9e42-7836b97ea435@intel.com>
 <aPJgP9ShLrvSeXzU@intel.com>
 <34f2d811-6d95-450b-978f-e4fa2d21c986@intel.com>
 <aPJ0I7V4srCj6qo4@intel.com> <aPKJRxvJzdvEZ69f@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aPKJRxvJzdvEZ69f@intel.com>
X-ClientProxiedBy: SJ0PR05CA0007.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::12) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DS0PR11MB7287:EE_
X-MS-Office365-Filtering-Correlation-Id: 76d0e81a-f7f8-40f9-826f-08de0dcd73c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?N8RsKAMcL3U5yE5eRrWir/DZHAdM+fL3EeFTpkLtIH+dOFta199BrOpFtB?=
 =?iso-8859-1?Q?sX2q6sIvt2do9/yesqfhUUDhOkt3ajBo2pKZlAac8jqUxabC+rqSC9oyBs?=
 =?iso-8859-1?Q?qXaWFxOrudE8k4dYQ7IAD9lQ4R7c6Oy+PdS1j4iFAag+qtXnoJWacMoLqt?=
 =?iso-8859-1?Q?oUhF5P1A0TnIz2y8vi51yWW2NvyN4TgESP3QDroykqnGFSRDmKyUHID8BN?=
 =?iso-8859-1?Q?rEDxZGxcRpmuXAANtFzUu8aMCXEgq6zA0946Tmvp0yWlRd9WiyTdoSOFEm?=
 =?iso-8859-1?Q?jnZ0NBIpZUoCUthevpi3OVsMjKcMrkoT8htKvk2ri8cTXVY5EHpu+WK6qC?=
 =?iso-8859-1?Q?iCcZDc0NHu1s+LB72g/qCWmjtZqwk8drFJYZIaDVhwie66muga12HSbecP?=
 =?iso-8859-1?Q?MMMFB/t1/QkMQs34m+JTVKjjPO8EUe02gE1cFJ6atMs8FS8E3CLbXPR2Kl?=
 =?iso-8859-1?Q?eJpdMEb8+Hi52qqOVHzV8tcjl/O8DjuieHK93jWcdJvGt4hls6ivY2J4gQ?=
 =?iso-8859-1?Q?G4QbxPuWNrEvCNj03ua5NmZynM/FG2XgtwdoCsOptgzDh8aQTdYdu3hlfI?=
 =?iso-8859-1?Q?v0vvYFmSIHmo74n/fUQMpr5PhONVO7+CxhkEURL977/yf/PbfJDGhky3z5?=
 =?iso-8859-1?Q?iY1zG5x640EKvNjHVZEqjSL4OmhKPk6+dWhx9bviS3oiZ+dTDjtE8QwOoF?=
 =?iso-8859-1?Q?J2tN2huHzR4wD1YrpN4ocrX6pNFrfcvBY1tuRci3kbDWEX7Fka+TlJr3iI?=
 =?iso-8859-1?Q?lKCIIwcgIF+wCu7agPFm4jn5nh5Pq1VIEXWeoFuArD3/Fo3AH7fPq9a6/2?=
 =?iso-8859-1?Q?vAV0MaL+FDrLPGXORIMiJ5Cpg0i+Z4UE2Xxpa2MRMAVhVBvfB01R6AVa6k?=
 =?iso-8859-1?Q?lhHo1xSFJ2gZkedI+qQ5SNPPwjZR1Lje5FTBZGL9pJa03g7MRRLWgFMR7m?=
 =?iso-8859-1?Q?pzgnrOLLTC9khDL41Nchau4xWS4RRih/oXuV6CiEH/saLh6IOTsWcJmSq1?=
 =?iso-8859-1?Q?PPWGQPdSbXCrJqfMw0qhAVagiNvN846Rmp45XTE6ojyBPvlc8sJbhetB7D?=
 =?iso-8859-1?Q?fZqPqxrYoxiGLQNB3Bv41VuAPr4jPrZnO/WwFFxcfn1jTcfLEVECViPSej?=
 =?iso-8859-1?Q?h/AOYK6+4ZxiECynY0qpzBxWdS4WJZQp/KFKWmfwhR3AXKJmxc35g3q6z3?=
 =?iso-8859-1?Q?99CqBCVVeCIdfO8JHJYyu3iBYxP7SdN2wsB2RHO0t1xM9uidgIoY7NRRcq?=
 =?iso-8859-1?Q?TXERONyTJQqDwG7AFfjxaaardHmsJJ3Xkuy6IWjtr3RJahxt5oggeh8whb?=
 =?iso-8859-1?Q?8PvTTNW9RsRyp+8fscsAAO9uaLgdPguuduDZRuRo0mBRYnpPuA65GLMikO?=
 =?iso-8859-1?Q?RCiqqyazHkgiP4XqX0IKhpopaUbxmm1uxxYvApQT1bPMe6wPVhQnqMcViG?=
 =?iso-8859-1?Q?oDM62veTrTBgO7UcpBJGC+fz3ypKX0BBCfji6dtNO5hJNWCTlOCsGlVOCm?=
 =?iso-8859-1?Q?+S39554HviTi/3x0/ht6Hs?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?g2tA9xqfFQ/F5KUNPW6QsE6CSw8PMQz4Cpt1g8l3JgpskPKXta5DK1MuXZ?=
 =?iso-8859-1?Q?2PS7AGlx46QtzHlNpN1EbnABQraTDkIm42mj2+Wj9l4YRQBeVfcb3i/aVl?=
 =?iso-8859-1?Q?Ut4c8kM9o1Gl61Risp+k5uX4K+XW9V5bavyxTHS9t93qmRRFy99vpw96Qb?=
 =?iso-8859-1?Q?S/H6Z6YKwkx7mu5wn8U5qf3eMz3uyQOkPOw+eU/w2CeyjV6QwvTdIbcnzo?=
 =?iso-8859-1?Q?iih8leZez9yUBgxDanJIL2Y6yBqzM2TI1AnRXX6hatZGG6Gth2uq54d+ya?=
 =?iso-8859-1?Q?Wl2bHFYxlweS8hpUdoojDPmMZMgRip8J8GdYBs/kgHjC9wifHZz+X9lsT3?=
 =?iso-8859-1?Q?jt5hLnMOebXUwlr/f0lCgt2mhxC5grklJc+TztLyuwErp8XGkeNZG1ozMV?=
 =?iso-8859-1?Q?nQzMoJvVcmX+FBB0ST4xsp1gn8pg6034aGJR1BmvhbxdWzRPMm2gMqsbPs?=
 =?iso-8859-1?Q?hNCKG5Uvl0GLBoso/pnAdnhwYs1GlEb2Qr4FLScsvzTGg/Ia4G6HkhEgzu?=
 =?iso-8859-1?Q?uzBhof/ESMGKgLXXa6l0GrRL7CBJ72Fz/SajsywAeW3onNjwYZt0Uw/5p+?=
 =?iso-8859-1?Q?GrvBiK5qWB1OZvqJyezAOskx/Y7ShbvBijuDLFJ5FsamfMO/uMuaZx4v7J?=
 =?iso-8859-1?Q?fcvRYrnlnwl9M/pFv86wQN9XAi0jtvOz1hxyLXPGq1bDEaUyKuTZ5DDRbr?=
 =?iso-8859-1?Q?AFyCpaxZeVEQq6pA/+MU/IkIPxbFxqmLIfaslItYJDrWHQyIFlRA4DuRvB?=
 =?iso-8859-1?Q?syZokKFjNg/o654QqXkainsKS3rSRjw1BCQ05npGvoLN9bAhPOIFKLgbcb?=
 =?iso-8859-1?Q?Szx9MzfnZa0BC9oOQCqKEQ4j59+mikkKTs/cIwhe8Jenr2boPpZhwPB/kc?=
 =?iso-8859-1?Q?k/BwT0D4CUKrPXahqMMdjCd8IDb6fnDMPLLE2uqcBqOMCaOOEesgwHgv62?=
 =?iso-8859-1?Q?lecIxRn2Lg6OOF9hfYAVX09tPIZBkV77fbECKR8vLAGJXhGDSW5K4yfcJw?=
 =?iso-8859-1?Q?VFs85iQY7KhaR5FDqXqkL4d5k5LU2MFP3n+jkofyvOv1kBluNKFyu/TPZG?=
 =?iso-8859-1?Q?/ltHnXpI5TS/6q1WMxOrQsqDu2yXOS9sKrqAb4/82UjIEvkExMq5nl2mUH?=
 =?iso-8859-1?Q?UWEd938//3eBvGvSMe/x8kf6uaIsrYCXadDcmPu71yZlXExgHiTrJtlnXO?=
 =?iso-8859-1?Q?ZQkCbEJ2cJq8tYouWcW5CC4agQf2mRNI4t3ktn87CJXKeO5I0DQ6DLLrT2?=
 =?iso-8859-1?Q?bQr3YOOe0X7gKGtV8QyW+27ghlf6xVRo3O/xk5G6H/gZdVTVYiNE3NNDtx?=
 =?iso-8859-1?Q?ZCJ7QFlAH+1/8Xeyg75BIMDnag9+rZGcczCMfTVDG/K89O0FFQEEUVt6+l?=
 =?iso-8859-1?Q?r2oT7rcntsy4RlZTJTyCsWAtUveq3v0tbzyhnIJ2jW9X/Xteh6UC7yC1K5?=
 =?iso-8859-1?Q?aBxNQgvzGKFs/IV6Htdj8/AhK1ABGkWViMSllCR2As1uS/QZC2LV9FcpJp?=
 =?iso-8859-1?Q?BU0AnMkpu3lqerFx9Zkby/wPFTEbKqOKZLSakJ8pkLWj/nV864yqHWiBeW?=
 =?iso-8859-1?Q?ZdtFEG5akMJ2rMyO/C55O+DIgiM6wLNITR8To9PP705cImU35St9OG1Qcb?=
 =?iso-8859-1?Q?JBVGRhegiRonhTSC+LVdAtsXmVvF7Dr+at9wpcOS/0IvXJZqRLAG++eA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 76d0e81a-f7f8-40f9-826f-08de0dcd73c0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 22:35:19.6715 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pbFeD5eDQvpjDgvPQtIbftmJsWbtMNpdQvQEddv3pl871qPrOD8+ALCSo7l1gmfXZs2Z8J1nwL6fkWvt+KRFOw5eoGeD1apgPD9/Sic8ZrM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7287
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

On Fri, Oct 17, 2025 at 02:21:59PM -0400, Rodrigo Vivi wrote:
> On Fri, Oct 17, 2025 at 07:51:47PM +0300, Ville Syrjälä wrote:
> > On Fri, Oct 17, 2025 at 09:59:48PM +0530, K V P, Satyanarayana wrote:
> > > 
> > > 
> > > On 17-10-2025 20:56, Ville Syrjälä wrote:
> > > > On Fri, Oct 17, 2025 at 08:46:37PM +0530, K V P, Satyanarayana wrote:
> > > >>
> > > >>
> > > >> On 17-10-2025 19:57, Ville Syrjälä wrote:
> > > >>> On Fri, Oct 17, 2025 at 07:42:28PM +0530, Satyanarayana K V P wrote:
> > > >>>> The CCS copy command is a 5-dword sequence. If the vCPU halts during
> > > >>>> save/restore while this sequence is being programmed, partial writes may
> > > >>>> trigger page faults when saving IGPU CCS metadata. Use the VMOVDQU
> > > >>>> instruction to write the sequence atomically.
> > > >>>
> > > >>> If this whole thing is so racy why don't you always add a new
> > > >>> BB_END after new commands, and only replace the previous BB_END
> > > >>> with NOOP _after_ the new commands have been fully written?
> > > >>>
> > > >> We maintain a suballocator for batch buffer management, with size
> > > >> proportional to system memory (e.g., 16MB suballocator for 8GB SMEM).
> > > >> Batch buffers are dynamically allocated from this pool based on the
> > > >> number of active workloads. The entire suballocator region is submitted
> > > >> to hardware for CCS metadata copy operations.
> > > >>
> > > >> We cannot insert BB_END commands after each individual instruction
> > > >> sequence because additional GPU instructions may be appended later.
> > > > 
> > > > You *overwrite* the previous BB_END after the new commands have been
> > > > appended.
> > > We do not know where the new BB allocation will be. It may not be 
> > > sequential and every BO has a BB. BBs are allocated and freed so often 
> > > based on BOs getting created and destroyed. So, we can't use that approach.
> > 
> > Hmm, could perhaps use second level batches then. Each BO would gets
> > its own second level batch, and the first level would just call them
> > in sequence. Or is this already running as a second level batch?
> 
> This I'm not sure...
> 
> Matt, do you know?

My understanding of this feature is that we create two additional
contexts (LRC's) and tell the GuC that they're special --- one should be
scheduled whenever a VF is being stopped and the other should be
scheduled when a VF is being started.  The intent is to use these
contexts to do a "context switch" of the VF's CCS data --- saving it out
when the VF is stopping and bringing it back in when the VF is resumed.

From a hardware point of view I think we could handle things however we
like in the LRC's ring and/or batch buffers.  We could add all the
necessary copy commands directly to the LRCs' rings if we wanted, or we
can add them to batchbuffers, or add them to 2- or 3-level nested
batchbuffers.  The current approach actually taken appears to be to
allocate a large chunk of memory (ctx->mem.ccs_bb_pool) and do an
MI_BATCH_BUFFER_START off to it.  That ccs_bb_pool is originally full of
NOOP (nothing to do), but as the VF allocates buffers, suballocations of
the pool are done for each buffer allocated, and those suballocations
are filled with the necessary commands to copy the CCS data in/out.
When a buffer is released by the VF, it's suballocation of the pool is
wiped over with NOOPs.  Any time a VF starts/stops, the save and restore
LRCs get scheduled by the GuC and execute their entire ccs_bb_pool as a
single batchbuffer (mostly containing noops, but with sections of copy
instructions scattered around).  

          Save LRC
H +-----------------------+
  | MI_BATCH_BUFFER_START |-------> +-------------------------------+
T +-----------------------+         |            <noops>            |
                                    +-------------------------------+
                                    | instr's to copy CCS for a bo  |
                                    +-------------------------------+
                                    |            <noops>            |
                                    +-------------------------------+
                                    | instr's to copy CCS for a bo  |
                                    +-------------------------------+
                                    |            <noops>            |
                                    +-------------------------------+
                                    ~             ...               ~
                                    +-------------------------------+

So the problem this patch is trying to address is when a suballocation
of the pool is made, and the CPU is in the process of poking
instructions into it with the CPU when the VF is stopped; part of the
copy instructions will have landed in memory, other parts may not have.
But the GuC will still execute the entire pool as one giant batchbuffer
but the subsection that was being updated will be incomplete, possibly
in harmful ways (e.g., an instruction started, but the addresses it
referenced not yet filled in).


The architecture document for this feature suggests the following:

        """
        VF KMD can utilize standard cmd programming technique like
        Shadow cmd buffer or ping/pong and swap BB_Start address to
        avoid partially-updated BB is executed by GuC in case of middle
        update pause.
        """

So it sounds like you could have two "save LRCs," make the updates to
the one that's currently inactive, and then tell the GuC to replace the
current save context with the other one once you finish an update (if
the GuC interface lets you do that --- I haven't checked).  Any time the
GuC actually starts running something, it's a complete LRC, ring, and
batchbuffer, and there are no racing updates to those from the VF KMD.

Alternatively, you could stick with a single context for each, but just
create a shadow batch buffer instead of a whole shadow context and then
patch the address that the MI_BATCH_BUFFER_START is jumping to after you
update the inactive buffer.  If the batchbuffer is in the GGTT, then we
only need an uninterrupted 32-bit update since the upper dword of the
address is always 0.

There are probably also ways you could use MI_PREDICATE and/or
MI_COND_BATCH_BUFFER_END to make the hardware execute the "ready"
batchbuffer and not the "inactive, updating" batchbuffer without having
to go back and patch the ring contents via the CPU, but I'd need to
refresh my memory on the exact usage of those kinds of instructions.


Matt


> 
> > 
> > It might also be getting a bit complicated I guess, but at least it
> > wouldn't have all obvious problems of the SIMD stuff:
> > - looks like it will explode on non-AVX capable x86
> > - will be broken on other arches until someone implements the equivalent
> >   code (assuming the arch has such an atomic copy instruction
> >   and supports in kernel SIMD stuff sufficiently to use it)
> 
> This is Pantherlake only. And the reason why I asked to add a
> check with error/warn for IS_DGFX()...
> 
> which by the way is an assert... I still don't believe it is enough.
> I believe a return with warn_on seems more appropriate to really
> never try to run that code in case of a big future mistake.
> 
> > 
> > > 
> > > -Satya.>
> > > >> Instead, a single BB_END marker is placed at the suballocator's end to
> > > >> terminate execution.
> > > >>
> > > >> This patch ensures race-condition-safe CCS metadata save/restore
> > > >> operations by guaranteeing atomic writes to the batch buffer, preventing
> > > >> corruption regardless of when save/restore operations are triggered.
> > > >>
> > > >> -Satya.>>
> > > >>>> Since VMOVDQU operates on 256-bit chunks, update EMIT_COPY_CCS_DW to emit
> > > >>>> 8 dwords instead of 5 dwords.
> > > >>>>
> > > >>>> Update emit_flush_invalidate() to use VMOVDQU operating with 128-bit
> > > >>>> chunks.
> > > >>>>
> > > >>>> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> > > >>>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > > >>>> Cc: Matthew Brost <matthew.brost@intel.com>
> > > >>>> Cc: Matthew Auld <matthew.auld@intel.com>
> > > >>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > >>>> Cc: Matt Roper <matthew.d.roper@intel.com>
> > > >>>>
> > > >>>> ---
> > > >>>> V6 -> V7:
> > > >>>> - Added description explaining why to use assembly instructions for
> > > >>>> atomicity.
> > > >>>> - Assert if DGFX tries to use memcpy_vmovdqu(). (Rodrigo)
> > > >>>> - Include <asm/cpufeature.h> though checkpatch complains. With
> > > >>>> <linux/cpufeature.h> KUnit is throwing errors.
> > > >>>>
> > > >>>> V5 -> V6:
> > > >>>> - Fixed review comments (Rodrigo)
> > > >>>>
> > > >>>> V4 -> V5:
> > > >>>> - Fixed review comments. (Matt B)
> > > >>>>
> > > >>>> V3 -> V4:
> > > >>>> - Fixed review comments. (Wajdeczko)
> > > >>>> - Fix issues reported by patchworks.
> > > >>>>
> > > >>>> V2 -> V3:
> > > >>>> - Added support for 128 bit and 256 bit instructions with memcpy_vmovdqu
> > > >>>> - Updated emit_flush_invalidate() to use vmovdqu instruction.
> > > >>>>
> > > >>>> V1 -> V2:
> > > >>>> - Use memcpy_vmovdqu only for x86 arch and for VF. Else use memcpy
> > > >>>>     (Auld, Matthew)
> > > >>>>     - Fix issues reported by patchworks.
> > > >>>> ---
> > > >>>>    drivers/gpu/drm/xe/xe_migrate.c | 112 ++++++++++++++++++++++++++------
> > > >>>>    1 file changed, 91 insertions(+), 21 deletions(-)
> > > >>>>
> > > >>>> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> > > >>>> index 3112c966c67d..e0be7396a0ab 100644
> > > >>>> --- a/drivers/gpu/drm/xe/xe_migrate.c
> > > >>>> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > > >>>> @@ -5,6 +5,8 @@
> > > >>>>    
> > > >>>>    #include "xe_migrate.h"
> > > >>>>    
> > > >>>> +#include <asm/fpu/api.h>
> > > >>>> +#include <asm/cpufeature.h>
> > > >>>>    #include <linux/bitfield.h>
> > > >>>>    #include <linux/sizes.h>
> > > >>>>    
> > > >>>> @@ -33,6 +35,7 @@
> > > >>>>    #include "xe_res_cursor.h"
> > > >>>>    #include "xe_sa.h"
> > > >>>>    #include "xe_sched_job.h"
> > > >>>> +#include "xe_sriov_vf_ccs.h"
> > > >>>>    #include "xe_sync.h"
> > > >>>>    #include "xe_trace_bo.h"
> > > >>>>    #include "xe_validation.h"
> > > >>>> @@ -657,18 +660,68 @@ static void emit_pte(struct xe_migrate *m,
> > > >>>>    	}
> > > >>>>    }
> > > >>>>    
> > > >>>> -#define EMIT_COPY_CCS_DW 5
> > > >>>> +/*
> > > >>>> + * VF KMD registers two specialized LRCs with the GuC to handle save/restore
> > > >>>> + * operations for CCS metadata on IGPU. The GuC executes these LRCAs during
> > > >>>> + * VF state/restore operations.
> > > >>>> + *
> > > >>>> + * Each LRC contains a batch buffer pool that GuC submits to hardware during
> > > >>>> + * VF state save/restore operations. Since these operations can occur
> > > >>>> + * asynchronously at any time, we must ensure GPU instructions in the batch
> > > >>>> + * buffer are written atomically to prevent corruption from incomplete writes.
> > > >>>> + *
> > > >>>> + * To guarantee atomic instruction writes, we use x86 SIMD instructions
> > > >>>> + * (128-bit XMM and 256-bit YMM) within kernel_fpu_begin()/kernel_fpu_end()
> > > >>>> + * sections. This prevents vCPU preemption during instruction generation,
> > > >>>> + * ensuring complete GPU commands are written to the batch buffer.
> > > >>>> + */
> > > >>>> +
> > > >>>> +static void memcpy_vmovdqu(struct xe_device *xe, void *dst, const void *src, u32 size)
> > > >>>> +{
> > > >>>> +	xe_assert(xe, !IS_DGFX(xe));
> > > >>>> +#ifdef CONFIG_X86
> > > >>>> +	kernel_fpu_begin();
> > > >>>> +	if (size == SZ_128) {
> > > >>>> +		asm("vmovdqu (%0), %%xmm0\n"
> > > >>>> +		    "vmovups %%xmm0,   (%1)\n"
> > > >>>> +		    :: "r" (src), "r" (dst) : "memory");
> > > >>>> +	} else if (size == SZ_256) {
> > > >>>> +		asm("vmovdqu (%0), %%ymm0\n"
> > > >>>> +		    "vmovups %%ymm0,   (%1)\n"
> > > >>>> +		    :: "r" (src), "r" (dst) : "memory");
> > > >>>> +	}
> > > >>>> +	kernel_fpu_end();
> > > >>>> +#endif
> > > >>>> +}
> > > >>>> +
> > > >>>> +static void emit_atomic(struct xe_gt *gt, void *dst, const void *src, u32 size)
> > > >>>> +{
> > > >>>> +	u32 instr_size = size * BITS_PER_BYTE;
> > > >>>> +
> > > >>>> +	xe_gt_assert(gt, instr_size == SZ_128 || instr_size == SZ_256);
> > > >>>> +
> > > >>>> +	if (IS_VF_CCS_READY(gt_to_xe(gt))) {
> > > >>>> +		xe_gt_assert(gt, static_cpu_has(X86_FEATURE_AVX));
> > > >>>> +		memcpy_vmovdqu(gt_to_xe(gt), dst, src, instr_size);
> > > >>>> +	} else {
> > > >>>> +		memcpy(dst, src, size);
> > > >>>> +	}
> > > >>>> +}
> > > >>>> +
> > > >>>> +#define EMIT_COPY_CCS_DW 8
> > > >>>>    static void emit_copy_ccs(struct xe_gt *gt, struct xe_bb *bb,
> > > >>>>    			  u64 dst_ofs, bool dst_is_indirect,
> > > >>>>    			  u64 src_ofs, bool src_is_indirect,
> > > >>>>    			  u32 size)
> > > >>>>    {
> > > >>>> +	u32 dw[EMIT_COPY_CCS_DW] = {MI_NOOP};
> > > >>>>    	struct xe_device *xe = gt_to_xe(gt);
> > > >>>>    	u32 *cs = bb->cs + bb->len;
> > > >>>>    	u32 num_ccs_blks;
> > > >>>>    	u32 num_pages;
> > > >>>>    	u32 ccs_copy_size;
> > > >>>>    	u32 mocs;
> > > >>>> +	u32 i = 0;
> > > >>>>    
> > > >>>>    	if (GRAPHICS_VERx100(xe) >= 2000) {
> > > >>>>    		num_pages = DIV_ROUND_UP(size, XE_PAGE_SIZE);
> > > >>>> @@ -686,15 +739,23 @@ static void emit_copy_ccs(struct xe_gt *gt, struct xe_bb *bb,
> > > >>>>    		mocs = FIELD_PREP(XY_CTRL_SURF_MOCS_MASK, gt->mocs.uc_index);
> > > >>>>    	}
> > > >>>>    
> > > >>>> -	*cs++ = XY_CTRL_SURF_COPY_BLT |
> > > >>>> -		(src_is_indirect ? 0x0 : 0x1) << SRC_ACCESS_TYPE_SHIFT |
> > > >>>> -		(dst_is_indirect ? 0x0 : 0x1) << DST_ACCESS_TYPE_SHIFT |
> > > >>>> -		ccs_copy_size;
> > > >>>> -	*cs++ = lower_32_bits(src_ofs);
> > > >>>> -	*cs++ = upper_32_bits(src_ofs) | mocs;
> > > >>>> -	*cs++ = lower_32_bits(dst_ofs);
> > > >>>> -	*cs++ = upper_32_bits(dst_ofs) | mocs;
> > > >>>> +	dw[i++] = XY_CTRL_SURF_COPY_BLT |
> > > >>>> +		  (src_is_indirect ? 0x0 : 0x1) << SRC_ACCESS_TYPE_SHIFT |
> > > >>>> +		  (dst_is_indirect ? 0x0 : 0x1) << DST_ACCESS_TYPE_SHIFT |
> > > >>>> +		  ccs_copy_size;
> > > >>>> +	dw[i++] = lower_32_bits(src_ofs);
> > > >>>> +	dw[i++] = upper_32_bits(src_ofs) | mocs;
> > > >>>> +	dw[i++] = lower_32_bits(dst_ofs);
> > > >>>> +	dw[i++] = upper_32_bits(dst_ofs) | mocs;
> > > >>>>    
> > > >>>> +	/*
> > > >>>> +	 * The CCS copy command is a 5-dword sequence. If the vCPU halts during
> > > >>>> +	 * save/restore while this sequence is being issued, partial writes may trigger
> > > >>>> +	 * page faults when saving iGPU CCS metadata. Use the VMOVDQU instruction to
> > > >>>> +	 * write the sequence atomically.
> > > >>>> +	 */
> > > >>>> +	emit_atomic(gt, cs, dw, sizeof(dw));
> > > >>>> +	cs += EMIT_COPY_CCS_DW;
> > > >>>>    	bb->len = cs - bb->cs;
> > > >>>>    }
> > > >>>>    
> > > >>>> @@ -1006,18 +1067,27 @@ static u64 migrate_vm_ppgtt_addr_tlb_inval(void)
> > > >>>>    	return (NUM_KERNEL_PDE - 2) * XE_PAGE_SIZE;
> > > >>>>    }
> > > >>>>    
> > > >>>> -static int emit_flush_invalidate(u32 *dw, int i, u32 flags)
> > > >>>> +/*
> > > >>>> + * The MI_FLUSH_DW command is a 4-dword sequence. If the vCPU halts during
> > > >>>> + * save/restore while this sequence is being issued, partial writes may
> > > >>>> + * trigger page faults when saving iGPU CCS metadata. Use
> > > >>>> + * emit_atomic() to write the sequence atomically.
> > > >>>> + */
> > > >>>> +#define EMIT_FLUSH_INVALIDATE_DW 4
> > > >>>> +static int emit_flush_invalidate(struct xe_exec_queue *q, u32 *cs, int i, u32 flags)
> > > >>>>    {
> > > >>>>    	u64 addr = migrate_vm_ppgtt_addr_tlb_inval();
> > > >>>> +	u32 dw[EMIT_FLUSH_INVALIDATE_DW] = {MI_NOOP}, j = 0;
> > > >>>> +
> > > >>>> +	dw[j++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | MI_FLUSH_DW_OP_STOREDW |
> > > >>>> +		      MI_FLUSH_IMM_DW | flags;
> > > >>>> +	dw[j++] = lower_32_bits(addr);
> > > >>>> +	dw[j++] = upper_32_bits(addr);
> > > >>>> +	dw[j++] = MI_NOOP;
> > > >>>>    
> > > >>>> -	dw[i++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | MI_FLUSH_DW_OP_STOREDW |
> > > >>>> -		  MI_FLUSH_IMM_DW | flags;
> > > >>>> -	dw[i++] = lower_32_bits(addr);
> > > >>>> -	dw[i++] = upper_32_bits(addr);
> > > >>>> -	dw[i++] = MI_NOOP;
> > > >>>> -	dw[i++] = MI_NOOP;
> > > >>>> +	emit_atomic(q->gt, &cs[i], dw, sizeof(dw));
> > > >>>>    
> > > >>>> -	return i;
> > > >>>> +	return i + j;
> > > >>>>    }
> > > >>>>    
> > > >>>>    /**
> > > >>>> @@ -1062,7 +1132,7 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
> > > >>>>    	/* Calculate Batch buffer size */
> > > >>>>    	batch_size = 0;
> > > >>>>    	while (size) {
> > > >>>> -		batch_size += 10; /* Flush + ggtt addr + 2 NOP */
> > > >>>> +		batch_size += EMIT_FLUSH_INVALIDATE_DW * 2; /* Flush + ggtt addr + 1 NOP */
> > > >>>>    		u64 ccs_ofs, ccs_size;
> > > >>>>    		u32 ccs_pt;
> > > >>>>    
> > > >>>> @@ -1103,7 +1173,7 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
> > > >>>>    	 * sizes here again before copy command is emitted.
> > > >>>>    	 */
> > > >>>>    	while (size) {
> > > >>>> -		batch_size += 10; /* Flush + ggtt addr + 2 NOP */
> > > >>>> +		batch_size += EMIT_FLUSH_INVALIDATE_DW * 2; /* Flush + ggtt addr + 1 NOP */
> > > >>>>    		u32 flush_flags = 0;
> > > >>>>    		u64 ccs_ofs, ccs_size;
> > > >>>>    		u32 ccs_pt;
> > > >>>> @@ -1126,11 +1196,11 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
> > > >>>>    
> > > >>>>    		emit_pte(m, bb, ccs_pt, false, false, &ccs_it, ccs_size, src);
> > > >>>>    
> > > >>>> -		bb->len = emit_flush_invalidate(bb->cs, bb->len, flush_flags);
> > > >>>> +		bb->len = emit_flush_invalidate(q, bb->cs, bb->len, flush_flags);
> > > >>>>    		flush_flags = xe_migrate_ccs_copy(m, bb, src_L0_ofs, src_is_pltt,
> > > >>>>    						  src_L0_ofs, dst_is_pltt,
> > > >>>>    						  src_L0, ccs_ofs, true);
> > > >>>> -		bb->len = emit_flush_invalidate(bb->cs, bb->len, flush_flags);
> > > >>>> +		bb->len = emit_flush_invalidate(q, bb->cs, bb->len, flush_flags);
> > > >>>>    
> > > >>>>    		size -= src_L0;
> > > >>>>    	}
> > > >>>> -- 
> > > >>>> 2.51.0
> > > >>>
> > > > 
> > 
> > -- 
> > Ville Syrjälä
> > Intel

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
