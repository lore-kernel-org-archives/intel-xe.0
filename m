Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7E30CA0FF0
	for <intel-xe@archiver.kernel.org>; Tue, 26 Aug 2025 22:53:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E64810E3BE;
	Tue, 26 Aug 2025 22:53:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VcXlVfRG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BEF910E3BE
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Aug 2025 22:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756248835; x=1787784835;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Y1jiyCGodQHYGlZmhzcyXSKB7Mf0hPYOxHVCT5BicpU=;
 b=VcXlVfRGsnqpw/yRXFuzQaJBzkWmxdl+eCnHOVUzErRr/JuvPhdw3TZd
 EnMwyhV7h7djzGt41axqT/Tzi1ToJQ4MK1GRAyz+sXbJE5CXX6SUK251U
 XlJh/QGxhS2cjRjnqpKr669AZjXZX8R5tajrCj+9GP+ach+ErbxmQo9qn
 jBr4gL0YSBOPoB/k3vnxmMKoduI2iK/7NdF0Y9q7DSAnL6yB4BBdefuZV
 nwgDx1dSRAj9NEIkRtiIkvvJO4J1jioEI3erq+7fi9xMwdsId+/2PuPym
 pdpxjMMFbfcrGlV4o/oFPSW0Mto9nGzhRQHi+BHJVJv2ZR+o42merBHtF Q==;
X-CSE-ConnectionGUID: mPUtvSUTRkyGE/ZcKbviBA==
X-CSE-MsgGUID: q+Cer81GRQO905ZTK5h+jQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11534"; a="58433178"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="58433178"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 15:53:53 -0700
X-CSE-ConnectionGUID: jiPal7T2QceFiY66LUaCdg==
X-CSE-MsgGUID: RFAoHrO8QLqH2P9NkoEjBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="170518930"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 15:53:54 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 26 Aug 2025 15:53:53 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 26 Aug 2025 15:53:53 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.66)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 26 Aug 2025 15:53:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IAFEMsyHfxmfY5r2RU/oHnUyt1CV/t5YJjPzzuUyuYZUzftghS2GFh0pFbyfJEhKcyd7d9Cg8/g780K8Avquct+pENtnixNHW+dBB38CDBVtmmEIIkHb1fvz4KI9vNPBP2tWBatfKtqzk7U1ZErIe4SLHwLwmG0D9rbDI9HN6PH12/PqOF4NqnRwwRDTg055tjPvpeSLiOkenLNsAJtjdOKZD3HSukLCYBwgNRO8767NnW1BRYYRvKUaIbCZcouKgxHHvG2ko8oxmgLD5ZDQ9x00qVqDsaQcbUxD1Dm4HqiuUD+z+S7LX+JNAQnaMqU6r8mOLp8rrvq8OZOMKcI61w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=60VcXH9di+No4OM24n3otv+afU0AENxm4t4g0t6DKRE=;
 b=jd9+yk8kqgKQnn7JfkzrhADGpUuT+zo5VqaPQHZQ7+kfIeyaFChzSAnQjh0R/KkCXX0KASfwX7FnLfL+l24iEU/NW9u3VTU94kgZLXPwjsIpCuy7ifCbeM+bIxtRUanluPLz+TJ4juKOlPqqdVPrIxvs2XiEtXargo3iZhdyEYZz9xT3r/D0UU7+t08X6SLGW2Xiry6vgllnCdxnN7MBQXwGaVK5P2BrZDf/6m3r93FyOAOzbP4S5hc0N/AbVM+IcrMpLbnNoFUImD4xaqYvq+JI1hN961OEKHL2/g44VZAVCl2i94PykMDLuzlqD1YmWr2Hz2aWbd25PfuUOTZX8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by PH3PPF5A672BE95.namprd11.prod.outlook.com (2603:10b6:518:1::d22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Tue, 26 Aug
 2025 22:53:50 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.9052.019; Tue, 26 Aug 2025
 22:53:49 +0000
Date: Tue, 26 Aug 2025 15:53:46 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Jani Nikula <jani.nikula@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Subject: Re: [PATCH v2 09/16] drm/xe: Convert the CPU fault handler for
 exhaustive eviction
Message-ID: <aK46+muNkR2uAq75@lstrano-desk.jf.intel.com>
References: <20250822094030.3499-1-thomas.hellstrom@linux.intel.com>
 <20250822094030.3499-10-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250822094030.3499-10-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: BY1P220CA0007.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::13) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|PH3PPF5A672BE95:EE_
X-MS-Office365-Filtering-Correlation-Id: f5b329e7-e059-4e27-a62c-08dde4f36bf9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?47qj+aL8MzU/RF+SQ2Q9BSaxPWXogC1IcvKQ0RSCXBNXBKW4xhcRRajyed?=
 =?iso-8859-1?Q?oWXGOeNhiwTmyH4LL6RI+QNIjRAHnnYqtXb/afaHKfQT9v4i9q/3omEqBp?=
 =?iso-8859-1?Q?iFB2J/kqhM7LByPEDpvOKhELMvCbelAvE6WUacC9vPW6kSX8q1NBKav8Ry?=
 =?iso-8859-1?Q?tl+CLt3gZ7/+KDS0ZjgJb4pFDkYK7tLx4ybaqNZH2wGTB7xxkEKydv2b6C?=
 =?iso-8859-1?Q?FTmKSCTVQHD3fVR77ZV6RUv4xtM+3ITEXlRSU8JItYHsxYo1N4bbyaCqI9?=
 =?iso-8859-1?Q?QgegO31MmOONVYAm3IwcoAsWArKuzN9iMwzeKWYYRwEvxC4q7zG0GXCap4?=
 =?iso-8859-1?Q?/8KNyRnhZo9uIz2WXt5DayWoNqBYhFFbGtOad2D5oY9wEomdaSZZ/t0LXn?=
 =?iso-8859-1?Q?lm5ZHbfEy3SS8dY3QhjXGTeaUctPjjCPKmcK+S97WR/BzFRsnW3NWYfcOI?=
 =?iso-8859-1?Q?Xx/fdLp6ciTheBsZNik2uLobKF2b0n1CSVZ4vkvtuW4Tunc57PM+gC2I8y?=
 =?iso-8859-1?Q?feIhdH1bIQkD5vZ78QvMzyvFWwHmYsWHUKaWp9woSvOHxSnrn36pReijI2?=
 =?iso-8859-1?Q?PZgV/caupdABvrkYw7wUy617AbmIKiXzmVDRpbgChsmKfjXFKirqlkIkT9?=
 =?iso-8859-1?Q?5TtwOLaMVZzrS8D4OjeswfwZMnLqQ9EuTZm7cl2Z83h64FYaoObFYMZncY?=
 =?iso-8859-1?Q?2FbpOuPk9ycTaqpAW1kdKw1f9U6SYubyUtNeuLWmQyvRPmL6qwDKTAoMNI?=
 =?iso-8859-1?Q?xoSj0+zBDT75Pcdr709sPkpu/PX3f43cRy6iV8abfH2TyvQOVDuNa6uSyd?=
 =?iso-8859-1?Q?J0DSi4+/PEsw61xOIFA+9fXYZHEsdqJVjzxd1dOGiNhoi3f2A+CnfPngic?=
 =?iso-8859-1?Q?AiS3lnAFojyzeXUZvU3ptKUMWOoDvJQ4Eplt8xOBgdYIidp3dH2cnkZMtm?=
 =?iso-8859-1?Q?WjYRnpjBoq0JdA+0hwD+W+uV9bifEL6CaWGsvrop5syvkd3C7D0qb4bpRn?=
 =?iso-8859-1?Q?mxZzlm5r1dhjDpmgH3qjNx1x+e31br80+kcyuSg9WXHg318sR8FOkEE48b?=
 =?iso-8859-1?Q?bP9kR4M6c7qUDc0XJCz3dWkT0T9s1yteNs/O/5p458kPtu7sHLaZm8ZXws?=
 =?iso-8859-1?Q?sRbFAYoWgnsTxDM4vwMtjWYECzYW2mXzIuzOwkiZml/yFgTVBRiOT6jtDu?=
 =?iso-8859-1?Q?I7pGmR3VODu4is3h9y8TGYNRqid81CP2xUMw0HXBNHNsXDMzD+umsA71wH?=
 =?iso-8859-1?Q?EJyMi4h+ODU+ihlhYKG4NS4JyAMWBNYeDImGMHERYdzQ643SkuUt7DpPyc?=
 =?iso-8859-1?Q?8Q/zdGbG1e5/9ZpsrVm/7kk1gcWzi4IMHxqBizmchEcMNAuZ96ykrmRLc5?=
 =?iso-8859-1?Q?7/vZHdrhwlNShQmwLZvYejW0ljbs3+f8NIlJrkeIL6vdD1Jl4/DfzE5puS?=
 =?iso-8859-1?Q?l3tuc5H9qCDC5+lfJKv2rdaskMoNRHqSVWauag=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?WhDn4rZ0beV4PA3GijSaChHniwxWSnwE9pHtk80/bx0q+QHULqz8ciM1FR?=
 =?iso-8859-1?Q?pUwhYJIVWum4iFD5nP0LEZNcEk/L0NVI/pduQN3/stnrUPZGdYzm3BiYyk?=
 =?iso-8859-1?Q?mB7snHb2CaQngJB1zVBJwBxa6aE2AMQ4Q67c3SSSxYQL0Cv77Bdj6t3nbj?=
 =?iso-8859-1?Q?SUo0j1vzssZxIKXTFPHTRn3Hkhg0uC6PMFrlOslxTdTVOHfHdjp4XeHnT0?=
 =?iso-8859-1?Q?uejSpscHy7dW/374AwVtZdzBGpXyXefRg9WGQTq8BMSkMC0oat+iA0VgbX?=
 =?iso-8859-1?Q?/AI9EpUYfdMRHOmFUNj3U9HfDRKsm6Tc74cQnGWeF5OPFv64dDu99bDlPp?=
 =?iso-8859-1?Q?p/7jzgWUoajMD/N+wfSe5jGZr/VzYyLDMrdfjTOck6JxcIXcfdtuxHTSuH?=
 =?iso-8859-1?Q?aqVGf/7lWyCmj2VH+zEXfFhx9Unqbqh4u1OHi5oxPwzPSpl+jbz/chb+S+?=
 =?iso-8859-1?Q?uHY1X+2aPc74uHTgCU0ptZ+29MQk1Q+sKecC6xmxuDfTnsyHr+q0rYZLsh?=
 =?iso-8859-1?Q?d3zecN3RtW0nmA+Cryrw6XPqTEVZFM7AclxIGlCcnMxRpkrReAUX5JtFBY?=
 =?iso-8859-1?Q?6+aeA2VxhbG9CLPqC7j2WbNH23hN+TkeB2Z7J8OE7k6DQJ1MZh4Fcu56G+?=
 =?iso-8859-1?Q?+ZXGCD5fl+MiQkja6MI+HW/9KM3hN8rmZaxH/bITOsjIGHYhmSQ6xtqrIc?=
 =?iso-8859-1?Q?fz78w3ulZUZMQN51IE0hpd1NnVtGPQiO9/aQoxhkZo16QcO5ve++wT7mva?=
 =?iso-8859-1?Q?QvxOwRxaNWJTtGTKIQS933lQjXEvwCqvqNOm6GgqlqbUnyCNW5o8nVxBjL?=
 =?iso-8859-1?Q?tBQcRbh5GNyhIuP8P39l3xS3OXZg67gNCWlMu/uHe6xGZDHCRenq+Lj97L?=
 =?iso-8859-1?Q?qGPlaxs5i4GXNRfY9dFuJ/uL8z363LCq4UfbxK6lbScM538WluhF7lJN3U?=
 =?iso-8859-1?Q?FD+J5YSUGWzyEgYvJr5PZigDKVq+0Gx6w7g6mwgy2Iv6a53NLmziMV7ALy?=
 =?iso-8859-1?Q?erODFkUsbR6/i/yuyqXqS/h3C171FOlEXAX6z45nlRgITXbTgu4mJMEIky?=
 =?iso-8859-1?Q?bbinjkebh0Wkga8O2lX6tWUTGVdK0LGnLHgC61wFEf8AInQ2fH/XlgCphj?=
 =?iso-8859-1?Q?5aEv85nYXBlIQjYUX9Bb3QmEBUCajx4KiaVa0P8ypobMuYsgm18Xs/9QJq?=
 =?iso-8859-1?Q?/fF66DWtlky0GfN8VdP5W2I0kBU2Tm3CQHmsBZ/RFnHNujHELXwNd0Wh2y?=
 =?iso-8859-1?Q?wyLrSPK03flxPGyhkCiSVoTOH8lExTECxue8ow8q2ZP3oAU8u5Ouq69ITh?=
 =?iso-8859-1?Q?6I7VrUBWBAI7ciSl2e2DYuJrhJJz7pD7Ic0xfPae2fr/r+XfDuhy4hSVB7?=
 =?iso-8859-1?Q?Uhb8k5isDLrRirO6muBIqTfSqFiB4NpBYk5m+TdcDIagJnOJDCcXlC6guc?=
 =?iso-8859-1?Q?/cwePvZcCwe50OSYLovOKB0HAh82JaxjDy7sDNdA+DrS/PXNmSVEfGfm3B?=
 =?iso-8859-1?Q?WPdB8TfvZtwBsqmW8+vNIsGpXEGcoVF6DhUkmtxTfpMnUMZC+YG+EldumS?=
 =?iso-8859-1?Q?uFKbjkugW7eM1sCNOQOO4sVXvWp1GJ2rLlHSPeQx3bCNKilLVBYNcB6FEI?=
 =?iso-8859-1?Q?bj9QQalgm1EnZmRw9gG26Sw6Hhw6Z6fHmLzT7iWRbOBUWPvTjfm+ZPWA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f5b329e7-e059-4e27-a62c-08dde4f36bf9
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 22:53:49.8524 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j3LV88Z/eKndDz6XnCidGoAXOz52XZ9kciVOBbK1FI29tx1WHgUVOJ6gNbMBd65kTDV64ISQwhLJe38zkO+hyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF5A672BE95
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

On Fri, Aug 22, 2025 at 11:40:23AM +0200, Thomas Hellström wrote:
> The CPU fault handler may populate bos and migrate, and in doing
> so might interfere with other tasks validating.
> 
> Rework the CPU fault handler completely into a fastpath
> and a slowpath. The fastpath trylocks only the validation lock
> in read-mode. If that fails, there's a fallback to the
> slowpath, where we do a full validation transaction.
> 
> This mandates open-coding of bo locking, bo idling and
> bo populating, but we still call into TTM for fault
> finalizing.
> 
> v2:
> - Rework the CPU fault handler to actually take part in
>   the exhaustive eviction scheme (Matthew Brost).
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo.c         | 191 ++++++++++++++++++++++++-----
>  drivers/gpu/drm/xe/xe_validation.c |   3 +-
>  2 files changed, 163 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 76e9c93826a2..686ca5d6038a 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -1713,57 +1713,188 @@ static void xe_gem_object_close(struct drm_gem_object *obj,
>  	}
>  }
>  
> -static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
> +static vm_fault_t __xe_bo_cpu_fault(struct vm_fault *vmf, struct xe_device *xe, struct xe_bo *bo)
> +{
> +	vm_fault_t ret;
> +
> +	trace_xe_bo_cpu_fault(bo);
> +
> +	ret = ttm_bo_vm_fault_reserved(vmf, vmf->vma->vm_page_prot,
> +				       TTM_BO_VM_NUM_PREFAULT);
> +	if (ret == VM_FAULT_NOPAGE &&
> +	    mem_type_is_vram(bo->ttm.resource->mem_type)) {
> +		mutex_lock(&xe->mem_access.vram_userfault.lock);
> +		if (list_empty(&bo->vram_userfault_link))
> +			list_add(&bo->vram_userfault_link,
> +				 &xe->mem_access.vram_userfault.list);
> +		mutex_unlock(&xe->mem_access.vram_userfault.lock);
> +	}
> +
> +	return ret;
> +}
> +
> +static vm_fault_t xe_err_to_fault_t(int err)
> +{
> +	switch (err) {
> +	case 0:
> +	case -EINTR:
> +	case -ERESTARTSYS:
> +	case -EAGAIN:
> +		return VM_FAULT_NOPAGE;
> +	case -ENOMEM:
> +	case -ENOSPC:
> +		return VM_FAULT_OOM;
> +	default:
> +		break;
> +	}
> +	return VM_FAULT_SIGBUS;
> +}
> +
> +static vm_fault_t xe_bo_cpu_fault_fastpath(struct vm_fault *vmf, struct xe_device *xe,
> +					   struct xe_bo *bo, bool needs_rpm)
> +{
> +	struct ttm_buffer_object *tbo = &bo->ttm;
> +	vm_fault_t ret = VM_FAULT_RETRY;
> +	struct xe_validation_ctx ctx;
> +	int err;
> +
> +	if (needs_rpm && !xe_pm_runtime_get_if_active(xe))
> +		return VM_FAULT_RETRY;
> +
> +	err = xe_validation_ctx_init(&ctx, &xe->val, NULL,
> +				     (struct xe_val_flags) {
> +					     .interruptible = true,
> +					     .no_block = true
> +				     });
> +	if (err)
> +		goto out_pm;
> +
> +	if (!dma_resv_trylock(tbo->base.resv))
> +		goto out_validation;
> +
> +	if (!dma_resv_test_signaled(tbo->base.resv, DMA_RESV_USAGE_KERNEL))
> +		goto out_unlock;
> +
> +	if (!tbo->resource->bus.is_iomem) {
> +		struct ttm_operation_ctx ctx = {
> +			.interruptible = true,
> +			.no_wait_gpu = true,
> +			.gfp_retry_mayfail = true,
> +		};
> +
> +		err = ttm_bo_populate(tbo, &ctx);

The version of the fault handler before didn't have a ttm_bo_populate
call. Can you explain why it is added here?

Also in we have this code in ttm_bo_vm_reserve which rejects external
object marked as unmappable. Do we need something like this?

        if (bo->ttm && (bo->ttm->page_flags & TTM_TT_FLAG_EXTERNAL)) {
                if (!(bo->ttm->page_flags & TTM_TT_FLAG_EXTERNAL_MAPPABLE)) {
                        dma_resv_unlock(bo->base.resv);
                        return VM_FAULT_SIGBUS;
                }
        }

Matt

> +		if (err) {
> +			if (err != -ENOMEM && err != -ENOSPC)
> +				ret = xe_err_to_fault_t(err);
> +			goto out_unlock;
> +		}
> +	}
> +
> +	ret = __xe_bo_cpu_fault(vmf, xe, bo);
> +
> +out_unlock:
> +	dma_resv_unlock(tbo->base.resv);
> +out_validation:
> +	xe_validation_ctx_fini(&ctx);
> +out_pm:
> +	if (needs_rpm)
> +		xe_pm_runtime_put(xe);
> +
> +	return ret;
> +}
> +
> +static vm_fault_t xe_bo_cpu_fault(struct vm_fault *vmf)
>  {
>  	struct ttm_buffer_object *tbo = vmf->vma->vm_private_data;
>  	struct drm_device *ddev = tbo->base.dev;
>  	struct xe_device *xe = to_xe_device(ddev);
>  	struct xe_bo *bo = ttm_to_xe_bo(tbo);
>  	bool needs_rpm = bo->flags & XE_BO_FLAG_VRAM_MASK;
> -	struct drm_exec *exec;
> +	bool retry_after_wait = false;
> +	struct xe_validation_ctx ctx;
> +	struct drm_exec exec;
>  	vm_fault_t ret;
> +	int err = 0;
>  	int idx;
>  
> +	if (!drm_dev_enter(&xe->drm, &idx))
> +		return ttm_bo_vm_dummy_page(vmf, vmf->vma->vm_page_prot);
> +
> +	ret = xe_bo_cpu_fault_fastpath(vmf, xe, bo, needs_rpm);
> +	if (ret != VM_FAULT_RETRY)
> +		goto out;
> +
> +	if (fault_flag_allow_retry_first(vmf->flags)) {
> +		if (vmf->flags & FAULT_FLAG_RETRY_NOWAIT)
> +			goto out;
> +		retry_after_wait = true;
> +		xe_bo_get(bo);
> +		mmap_read_unlock(vmf->vma->vm_mm);
> +	} else {
> +		ret = VM_FAULT_NOPAGE;
> +	}
> +
> +	/*
> +	 * The fastpath failed and we were not required to return and retry immediately.
> +	 * We're now running in one of two modes:
> +	 *
> +	 * 1) retry_after_wait == true: The mmap_read_lock() is dropped, and we're trying
> +	 * to resolve blocking waits. But we can't resolve the fault since the
> +	 * mmap_read_lock() is dropped. After retrying the fault, the aim is that the fastpath
> +	 * should succeed. But it may fail since we drop the bo lock.
> +	 *
> +	 * 2) retry_after_wait == false: The fastpath failed, typically even after
> +	 * a retry. Do whatever's necessary to resolve the fault.
> +	 *
> +	 * This construct is recommended to avoid excessive waits under the mmap_lock.
> +	 */
> +
>  	if (needs_rpm)
>  		xe_pm_runtime_get(xe);
>  
> -	exec = XE_VALIDATION_UNIMPLEMENTED;
> -	ret = ttm_bo_vm_reserve(tbo, vmf);
> -	if (ret)
> -		goto out;
> +	xe_validation_guard(&ctx, &xe->val, &exec, (struct xe_val_flags) {.interruptible = true},
> +			    err) {
> +		long lerr;
>  
> -	if (drm_dev_enter(ddev, &idx)) {
> -		trace_xe_bo_cpu_fault(bo);
> +		err = drm_exec_lock_obj(&exec, &tbo->base);
> +		drm_exec_retry_on_contention(&exec);
> +		if (err)
> +			break;
>  
> -		xe_validation_assert_exec(xe, exec, &tbo->base);
> -		ret = ttm_bo_vm_fault_reserved(vmf, vmf->vma->vm_page_prot,
> -					       TTM_BO_VM_NUM_PREFAULT);
> -		drm_dev_exit(idx);
> +		lerr = dma_resv_wait_timeout(tbo->base.resv,
> +					     DMA_RESV_USAGE_KERNEL, true,
> +					     MAX_SCHEDULE_TIMEOUT);
> +		if (lerr < 0) {
> +			err = lerr;
> +			break;
> +		}
>  
> -		if (ret == VM_FAULT_RETRY &&
> -		    !(vmf->flags & FAULT_FLAG_RETRY_NOWAIT))
> -			goto out;
> +		if (!tbo->resource->bus.is_iomem) {
> +			struct ttm_operation_ctx tctx = {
> +				.interruptible = true,
> +				.no_wait_gpu = false,
> +				.gfp_retry_mayfail = true,
> +			};
>  
> -		/*
> -		 * ttm_bo_vm_reserve() already has dma_resv_lock.
> -		 */
> -		if (ret == VM_FAULT_NOPAGE &&
> -		    mem_type_is_vram(tbo->resource->mem_type)) {
> -			mutex_lock(&xe->mem_access.vram_userfault.lock);
> -			if (list_empty(&bo->vram_userfault_link))
> -				list_add(&bo->vram_userfault_link,
> -					 &xe->mem_access.vram_userfault.list);
> -			mutex_unlock(&xe->mem_access.vram_userfault.lock);
> +			err = ttm_bo_populate(tbo, &tctx);
> +			xe_validation_retry_on_oom(&ctx, &err);
> +			if (err && (err == -EINTR || err == -ERESTARTSYS))
> +				break;
>  		}
> -	} else {
> -		ret = ttm_bo_vm_dummy_page(vmf, vmf->vma->vm_page_prot);
> +		if (!retry_after_wait)
> +			ret = __xe_bo_cpu_fault(vmf, xe, bo);
>  	}
> +	if (err)
> +		ret = xe_err_to_fault_t(err);
>  
> -	dma_resv_unlock(tbo->base.resv);
> -out:
>  	if (needs_rpm)
>  		xe_pm_runtime_put(xe);
>  
> +	if (retry_after_wait)
> +		xe_bo_put(bo);
> +out:
> +	drm_dev_exit(idx);
> +
>  	return ret;
>  }
>  
> @@ -1807,7 +1938,7 @@ int xe_bo_read(struct xe_bo *bo, u64 offset, void *dst, int size)
>  }
>  
>  static const struct vm_operations_struct xe_gem_vm_ops = {
> -	.fault = xe_gem_fault,
> +	.fault = xe_bo_cpu_fault,
>  	.open = ttm_bo_vm_open,
>  	.close = ttm_bo_vm_close,
>  	.access = xe_bo_vm_access,
> diff --git a/drivers/gpu/drm/xe/xe_validation.c b/drivers/gpu/drm/xe/xe_validation.c
> index b90fda3dd5f4..826cd09966ef 100644
> --- a/drivers/gpu/drm/xe/xe_validation.c
> +++ b/drivers/gpu/drm/xe/xe_validation.c
> @@ -241,7 +241,8 @@ int xe_validation_exec_lock(struct xe_validation_ctx *ctx,
>   */
>  void xe_validation_ctx_fini(struct xe_validation_ctx *ctx)
>  {
> -	drm_exec_fini(ctx->exec);
> +	if (ctx->exec)
> +		drm_exec_fini(ctx->exec);
>  	xe_validation_unlock(ctx);
>  }
>  
> -- 
> 2.50.1
> 
