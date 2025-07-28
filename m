Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3601CC83F26
	for <intel-xe@archiver.kernel.org>; Mon, 28 Jul 2025 07:32:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9EA110E491;
	Mon, 28 Jul 2025 07:32:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SFeZV8UX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A923210E494
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Jul 2025 07:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753687939; x=1785223939;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Vk4wBD88HJWuV5DzfzipGN/sTx+5j2NaFWo3xNKZ9nU=;
 b=SFeZV8UXBKci0SaAFTbtXrYMw5yTAZ6L0z5fCReBfCfY0SFV547Iw9Y1
 4v41yQdVdHMN4ZRS1aw89T+TJHvW4KiTDHS6enZzxGqofUjE09kbaRPDi
 wBQWivt4funQERT/yzrQ1l/QOonR7BKFgEwSD39oyg7PkogseZiI1AZKx
 VvemMjhwyAMxWc3t2bkv4jKm0INl//CYDFcsMZ43zWoNXKXgtF78yZEOF
 NScq4HnbXqmxGYShswnlb4rH7h0xu8CmLX5iSkyt8BJwrO0xcd8O6Gg/k
 paPW9SLBskIWtT0/rJEXJvBBS7eRfAYUEeWCIiqdUi1LHmhaq8WzMMHMl Q==;
X-CSE-ConnectionGUID: 6HMkxoxyRBG8ze/Ztw87sg==
X-CSE-MsgGUID: D+ZOs6kgSGqHqKvLXvrEzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="59746792"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="59746792"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 00:32:16 -0700
X-CSE-ConnectionGUID: j9taEBcESOeih0U+3vR1Lg==
X-CSE-MsgGUID: vGNLDj8nTOidRSKdVl75yA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="166823242"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 00:32:15 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 28 Jul 2025 00:32:14 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 28 Jul 2025 00:32:14 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.75)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 28 Jul 2025 00:32:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c2e+ec8YLN5egiOmG79lazTwUxJkriQSAQileoBt9VOGcXF/8fSfCfzXc/gTX07Zz2jKvdl2OdEnPIZFQIp+g1XHHxN67B2vVvdSAcvS6fTM5U0+eSjGJflLaVZVeS/OYQo7U4LOTdiPEA1zgIdQfGmp/hRmPWbpMMJqPvYDUt+6jsqsSg3L3H6lUA5AYyGaBJ7PT5pViVTIERYgYnsikUGyzRgOCRJhLSOLINAM9VBb4BSVljMzMC4Q/iFAkusFuPBAorokU//n8FspZo7b1sCSjE7OFMoxX+rgGwwbtNxZsdmAnPay38zpU/HOZzRM4TtrJRAqWh6qMzl4NTbUHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KTNmy5Iu1Q00OPqEWDCtaZeR49OOOSFvFfaFvPH7r/0=;
 b=iYB31nw4jN9YAA1AzwTj3vd+gE7DE41OmGHLad/V3WNCdAC6PJhcL1W4X/CxxmzDYXiGVioRrOtzCiExfHlTum2DPJD7mICkqUaNOQtgrN9WB6QZAcOG+OCUhc5f22vcuVGQgo05pX9D75N40Azu74V4VhWsFINVoqglfZBT1P04duWiLePEYGyFSBFB1aCbc/137IJQS+X2ZYlykwzECaKb2nfKpAT4fXBLzzl9h46IlVv+XIKZ5EiS1vKAbRcH41DZaZgm4g6QUC1HRIheDoAuUDpiiWYL+sqczOYJUwU3rJ0BhuWLOvhb7sQR9SLSWNHP2LpD0FpHZEsl7t/7dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB6268.namprd11.prod.outlook.com (2603:10b6:208:3e4::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Mon, 28 Jul
 2025 07:32:06 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.8964.019; Mon, 28 Jul 2025
 07:32:06 +0000
Date: Mon, 28 Jul 2025 00:33:55 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Matthew Auld <matthew.auld@intel.com>, Piotr
 =?iso-8859-1?Q?Pi=F3rkowski?= <piotr.piorkowski@intel.com>
Subject: Re: [PATCH v2] drm/xe/vf: Fix VM crash during VF driver release
Message-ID: <aIcn426bvQsqEUor@lstrano-desk.jf.intel.com>
References: <20250728064002.8457-1-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250728064002.8457-1-satyanarayana.k.v.p@intel.com>
X-ClientProxiedBy: BYAPR06CA0049.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::26) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB6268:EE_
X-MS-Office365-Filtering-Correlation-Id: 92488603-a980-40c5-63a5-08ddcda8da9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?+kZPRJel9qyORx3F0GHz+n7avj62kKnp3NwVaCUTL0MYC0sT21zIC82zTS?=
 =?iso-8859-1?Q?oq9pErTSZYAL4nZv1tgRF//2nv8aDuQg5b1mnJ4p0kRO75HH1A5OwGxTjE?=
 =?iso-8859-1?Q?gwWlwPTH0z8Nn8dIZtgG20LmtFQWWnCkFe2uSdqGp+lc+9gfdfOCJdS2iO?=
 =?iso-8859-1?Q?F81v+U/CHXjJlwqLisBC6kgupJY5tU5tqeQV7ZPi114UOtusn6quEH05tf?=
 =?iso-8859-1?Q?dVveol3gd9mqJjiYXpXKa9I30+MPoWBBsX6jYha1h/+VGNjwzFlFdb5jhw?=
 =?iso-8859-1?Q?5t6f+bgT1Q75YNGb29Ieyl1JXpc3tKZmJSu5kGYopCz9p2fBzzcyQKGfg6?=
 =?iso-8859-1?Q?3XveqW7v9KEq+hFApGkhCcQJqOL5U3oTXYDsZCZDwAF5tCgN+to/WYhnXC?=
 =?iso-8859-1?Q?/ZOXDv35QhZqPuZAQYe/tobLW3UvaMjxQ2BtQ3G/bSRGCqVymKFcUwmtN9?=
 =?iso-8859-1?Q?qIhHL0jiuc22EriZpRv2pWo3n2qz9MyZOUEuera2Ju+uSKqb4A0jzlaB2P?=
 =?iso-8859-1?Q?tSUV76GbwBouORqFebkehJS5De0Wm7oB//bw5NU47G577GeJ9xaNFPh/fR?=
 =?iso-8859-1?Q?0f6eOMnvqCfABu35jFeNZWpmIUwUXVuaRVp6Mz3CI1tyB/kfJseNBq6r4E?=
 =?iso-8859-1?Q?Y8uaVHn+NtqmKfC4tZxpCSpM4Jjx5YVY8XjBWQRfIxtC3QMDWuWEZXwMEQ?=
 =?iso-8859-1?Q?+dETDxU7e+iVfQahAkAd2tAo986Mq967aQ3e1JB6pRsQv8hMdFsonGLa4F?=
 =?iso-8859-1?Q?Rjqwm/4DF9zIu3/JLxgvAUtpNSvPMU24uqKpeTyqVGrv4xAir2f4kU1Mw+?=
 =?iso-8859-1?Q?pjtOj9n2DLvK2BB+jLOhWNYFFK0rnkE3HSNhfjL8HFunnMsOgi048GB/hg?=
 =?iso-8859-1?Q?XIYMArR685m0+QdnKA+CMmcPnpKokNr9GDpkOVepc2i0eYZAn51Ii3NYGZ?=
 =?iso-8859-1?Q?IoVICuuhUEljwbPLJmjbV62HHlaRw/RVNG/MW0wxoMBP3PLc61ca/GC3wA?=
 =?iso-8859-1?Q?Zqpe8S/2niFPjGhcKWSQdxwnOYq7PPPEcgOcP9f7jtfN9eU7GCHVqgISvF?=
 =?iso-8859-1?Q?rSjApEqJ5GfWGXCUELY1qdNB+qljv13vRO735uuYtXdR7YlPqhKFvV3cx6?=
 =?iso-8859-1?Q?Ov6aZEwZ5jxLLv9f06bkq7Rkx53II68PLd1w/XC9LBgt/tqNh2w77vZw1Y?=
 =?iso-8859-1?Q?/B2K6D2l3EOiso/BeailEh2ODBLjodqg7oRt9zyLVl27/tWAnTOO37GXRx?=
 =?iso-8859-1?Q?iJFCHbi9PWchRJ4BZL3ams/zdbvKmiZa3Sbr2s74h4Pj1uHETUM1/hEkcd?=
 =?iso-8859-1?Q?g7iWofiTrSMH9vnx04e18PIS0yxdx/0vZ3r9JJua5Q8x8cyvCHniwy/T62?=
 =?iso-8859-1?Q?aR1bBcGQlobL1VyFT1D5WA6ugxFr6Ybx/SMpUxJHk4hI2AGn6wVSpKgnn0?=
 =?iso-8859-1?Q?H6wx1R7bt4bWMqiwwu7zD+WAVgf/yzBGes+uB4DNDGvYvATx4sjclDDk+2?=
 =?iso-8859-1?Q?I=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?VFCcQIwaGTqSP6DJeI87WIDS662uHGNK7+0IGIi6gwrWUZoiRu18NrxCDw?=
 =?iso-8859-1?Q?UYujbLNW5H4OM65/9ybSrWsSg1yaW7Az56ZWLwTct8mneXqvcHowCJTKvw?=
 =?iso-8859-1?Q?G9KaK38MRD1+Nghr8I3Df2Pl6tB3HBowHPAk9laYdT+nXUWfyC/teRBiOx?=
 =?iso-8859-1?Q?/iwdpVgUTqYEeeYBiLykS5hn+TkjKkX050ldvjIGe/9ta3hvL0DUI9QWa9?=
 =?iso-8859-1?Q?dJUyOaXVz79T6cjtfsiEP+UrT+CQt9oVn14s1ZyQkquN7SB2H0R7uO3Hat?=
 =?iso-8859-1?Q?VXPtnm5zlTVTZjBoqWiwHXHLUf5O8ZgpA4O68PYznw4tpeM1r0YMQTk5dE?=
 =?iso-8859-1?Q?cHksa2PUHRxGumjTybvIox+Kc7MDHLD86u7p95lcIwlz3jpeWhYXAo00u3?=
 =?iso-8859-1?Q?LMul+4VorBQVD4WanpV9bCxPvnSESHl3zUMYmLRQyuCCaNSeOuYPsuk8ah?=
 =?iso-8859-1?Q?UhpKuSQyWsHnfnl9i5OicjoSEp0pJn0Fq496x8h1knu23L/mgMThEid8xS?=
 =?iso-8859-1?Q?QwQ+BTMRNrWHP4nC91KrijJxAOzyF5IfL90AlYzeQDIhZmzlbcVKtkILZc?=
 =?iso-8859-1?Q?cKcxSQZoTgQYjltO8tDF/1LpqxCI3nPGGmtc2p5PGAKIoYPGBmzeStswgH?=
 =?iso-8859-1?Q?MFRfzu9tRQ3/m7mNninwpdRg35cRoAqWT74wl69CmPxBtUyImQYl3hHXeR?=
 =?iso-8859-1?Q?18K70I7LPVcgskI76+LqkoiyBA+BrqjWco+ZvPJc2QdMPzq6sK8QEpthL3?=
 =?iso-8859-1?Q?1VAUCpxFmEExpGMknM7cKwY4Bjfq+eEBl8ch4xwia+DXhmQW0m2wAb9ple?=
 =?iso-8859-1?Q?g6k3HQGS9PcCjkzAyMiWZUtnWsaPUHYCfsWsnFcqv2dPf8McyyEXe1oSHJ?=
 =?iso-8859-1?Q?Woe86dQbUaWbz35RM/vMhT2ByS0irTtdRdqpR2EX1jL+8AHHNEmIrR9UaO?=
 =?iso-8859-1?Q?rLetTIXIjFwuB/pUR+wVtHULHEZGx+PBUyThugSZ/lsTNLlR4vYQE62lX0?=
 =?iso-8859-1?Q?tnNJTQJ+UH1Jouw6K5vKxz2vqmqnYD8H9HcRfmImXyV94n4+pdBTeXUJVr?=
 =?iso-8859-1?Q?fG5OpeEZh6KiebWF0g1NksXwNzfRd0mXfL44OshZ3hSfkFWmB3XI+tjgOh?=
 =?iso-8859-1?Q?RlicQMBlmgLo+NuqUsnJagufsEJlBxxcC8T84zoZ+qEDjP8x53Eb6lsYrT?=
 =?iso-8859-1?Q?H5C9hHR/ynY1+jUac+7zbYlzAv7m/o7lIBPMJQV1r3AqU6SIbEpQ49ADRn?=
 =?iso-8859-1?Q?kKNkzzxSeCJ2E0zqU2bfmc+iJ7NZDBPn8apusHMqLB9TEOYLyZVi95mGFK?=
 =?iso-8859-1?Q?HKLlkUQ+rMgw5UWH2GEH+ZINfD8AGwIkk92UO0d755xLD9JutFMIvqHQKx?=
 =?iso-8859-1?Q?BLneg+jVXPnhECRCystwpYFcbprWuEPxhq3S2e11SPg8Pdx0mCBBlJnDcN?=
 =?iso-8859-1?Q?YZ9x10xw/Wt86zDE6OlAXNEOFADEAjnrVEuNdF0X34wot7AGNTIsNYPrU5?=
 =?iso-8859-1?Q?E4JIbwi5Ihp0i/lpMqzIYgZbhyb4N3jFKqi4DOGjbbSa77w14p2nG8pZ6f?=
 =?iso-8859-1?Q?uSo4tG5IRox33HIVF+/rHyrIM/pr/tv265JmET6YzrgnX5I+G5QC/mHIHm?=
 =?iso-8859-1?Q?x3HXbJKp5zzJI4eOS2I9kkSQQebKNKHpCm1afU1mh7fiI3r2DdutC85g?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 92488603-a980-40c5-63a5-08ddcda8da9e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2025 07:32:06.4167 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rZyt9sl1NM9CikXJQ+h4utQy+dobFwvxBtJUGSt1fuhi0nbDuXbigLGUSRmx156aEhWBG/pLoCdmHBjM93Tp1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6268
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

On Mon, Jul 28, 2025 at 12:10:02PM +0530, Satyanarayana K V P wrote:
> The VF CCS save/restore series (patchwork #149108) has a dependency
> on the migration framework. A recent migration update in commit
> d65ff1ec8535 ("drm/xe: Split xe_migrate allocation from initialization")
> caused a VM crash during XE driver release for iGPU devices.
> 

My strong view a revert, restructure to use single xe_migrate object
that initialized on driver load, but provides queues for the VF
migration needs.

Matt

> Oops: general protection fault, probably for non-canonical address 0x6b6b6b6b6b6b6b83: 0000 [#1] SMP NOPTI
> xe 0000:00:02.1: [drm:guc_ct_change_state [xe]] GT0: GuC CT communication channel enabled
> CPU: 1 UID: 0 PID: 5998 Comm: bash Kdump: loaded Tainted: G     U  W           6.16.0-xe+ #4 PREEMPT(voluntary)
> xe 0000:00:02.0: [drm:xe_sriov_pf_service_handshake_vf [xe]] PF: VF1 negotiated ABI version 1.0
> Tainted: [U]=USER, [W]=WARN
> Hardware name: Intel Corporation Panther Lake Client Platform/PTL-UH LP5 T3 RVP1, BIOS PTLPFWI1.R00.3214.D01.2505280450 05/28/2025
> RIP: 0010:xe_lrc_ring_head+0x12/0xb0 [xe]
> xe 0000:00:02.1: [drm:xe_gt_sriov_vf_connect [xe]] GT0: VF: using VF/PF ABI 1.0
> Code: c3 cc cc cc cc 0f 1f 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 0f 1f 44 00 00 55 48 89 e5 41 55 41 54 53 48 83 ec 10 <f6> 47 18 02 74 45 48 8b 47 38 48 8b 00 4c 8b 20 e8 69 db ff ff 80
> RSP: 0018:ffffc900043eb8d0 EFLAGS: 00010282
> RAX: 6b6b6b6b6b6b6b6b RBX: 6b6b6b6b6b6b6b6b RCX: ffff88811a028c40
> RDX: 0000000000000000 RSI: ffff88811a028c68 RDI: 6b6b6b6b6b6b6b6b
> RBP: ffffc900043eb8f8 R08: ffffffffa1695dda R09: 0000000000000010
> xe 0000:00:02.1: [drm] GT0: reset done
> R10: 0000000000000000 R11: 0000000000000000 R12: ffff88811a029c40
> R13: ffffc900043eb970 R14: ffff888119fc40c8 R15: ffff888119fc4548
> FS:  00007e03036bf740(0000) GS:ffff8884eb3b0000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00005af31328c000 CR3: 0000000114534004 CR4: 0000000000f72ef0
> PKRU: 55555554
> Call Trace:
>  <TASK>
>  xe_sriov_vf_ccs_fini+0x1e/0x40 [xe]
>  devm_action_release+0x12/0x30
>  release_nodes+0x3a/0x120
>  devres_release_all+0x96/0xd0
>  device_unbind_cleanup+0x12/0x80
>  device_release_driver_internal+0x23a/0x280
>  device_release_driver+0x12/0x20
>  pci_stop_bus_device+0x69/0x90
>  pci_stop_and_remove_bus_device+0x12/0x30
>  pci_iov_remove_virtfn+0xbd/0x130
>  sriov_disable+0x42/0x100
>  pci_disable_sriov+0x34/0x50
>  xe_pci_sriov_configure+0xf71/0x1020 [xe]
>  ? sriov_numvfs_store+0x78/0x160
>  ? _parse_integer+0xe/0x20
>  ? _kstrtoull+0x3a/0xa0
>  sriov_numvfs_store+0x10c/0x160
>  dev_attr_store+0x14/0x40
>  sysfs_kf_write+0x4a/0x80
>  kernfs_fop_write_iter+0x166/0x220
>  vfs_write+0x284/0x550
>  ksys_write+0x6f/0xf0
>  __x64_sys_write+0x19/0x30
>  x64_sys_call+0x2bf/0x2660
>  do_syscall_64+0x93/0x1320
>  ? ksys_dup3+0xba/0x170
>  ? __x64_sys_dup2+0x2e/0x1f0
>  ? do_syscall_64+0x1a2/0x1320
>  ? __rseq_handle_notify_resume+0x447/0x5e0
>  ? trace_hardirqs_off+0x5a/0xd0
>  ? irqentry_exit_to_user_mode+0xdf/0x2f0
>  ? irqentry_exit+0x77/0xb0
>  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> RIP: 0033:0x7e030351c574
> Code: c7 00 16 00 00 00 b8 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 f3 0f 1e fa 80 3d d5 ea 0e 00 00 74 13 b8 01 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 54 c3 0f 1f 00 55 48 89 e5 48 83 ec 20 48 89
> RSP: 002b:00007ffd34a10798 EFLAGS: 00000202 ORIG_RAX: 0000000000000001
> RAX: ffffffffffffffda RBX: 0000000000000002 RCX: 00007e030351c574
> RDX: 0000000000000002 RSI: 00005af318d7da30 RDI: 0000000000000001
> RBP: 00007ffd34a107c0 R08: 0000000000000073 R09: 0000000000000000
> R10: 00000000ffffffff R11: 0000000000000202 R12: 0000000000000002
> R13: 00005af318d7da30 R14: 00007e03036045c0 R15: 00007e0303601ee0
>  </TASK>
> 
> Update the VF CCS migration initialization sequence to align with the new
> migration framework changes, resolving the release-time crash.
> 
> Fixes: f3009272ff2e ("drm/xe/vf: Create contexts for CCS read write")
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
> 
> ---
> V1 -> V2:
> - Updated xe_migrate_init() input arguments and return type (Michal Wajdeczko)
> - Fixed review comments.
> ---
>  drivers/gpu/drm/xe/xe_gt.c           |  6 ++----
>  drivers/gpu/drm/xe/xe_migrate.c      | 22 +++++++++++-----------
>  drivers/gpu/drm/xe/xe_migrate.h      |  2 +-
>  drivers/gpu/drm/xe/xe_sriov_vf_ccs.c |  7 ++++++-
>  4 files changed, 20 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index c8eda36546d3..5a79c6e3208b 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -564,11 +564,9 @@ static int gt_init_with_all_forcewake(struct xe_gt *gt)
>  	if (xe_gt_is_main_type(gt)) {
>  		struct xe_tile *tile = gt_to_tile(gt);
>  
> -		tile->migrate = xe_migrate_init(tile);
> -		if (IS_ERR(tile->migrate)) {
> -			err = PTR_ERR(tile->migrate);
> +		err = xe_migrate_init(tile->migrate);
> +		if (err)
>  			goto err_force_wake;
> -		}
>  	}
>  
>  	err = xe_uc_load_hw(&gt->uc);
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 90065d7d29ff..7e295ca00763 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -396,15 +396,15 @@ struct xe_migrate *xe_migrate_alloc(struct xe_tile *tile)
>  
>  /**
>   * xe_migrate_init() - Initialize a migrate context
> - * @tile: Back-pointer to the tile we're initializing for.
> + * @m: The migration context
>   *
> - * Return: Pointer to a migrate context on success. Error pointer on error.
> + * Return: 0 if successful, negative error code on failure
>   */
> -struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
> +int xe_migrate_init(struct xe_migrate *m)
>  {
> -	struct xe_device *xe = tile_to_xe(tile);
> +	struct xe_tile *tile = m->tile;
>  	struct xe_gt *primary_gt = tile->primary_gt;
> -	struct xe_migrate *m = tile->migrate;
> +	struct xe_device *xe = tile_to_xe(tile);
>  	struct xe_vm *vm;
>  	int err;
>  
> @@ -412,14 +412,14 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
>  	vm = xe_vm_create(xe, XE_VM_FLAG_MIGRATION |
>  			  XE_VM_FLAG_SET_TILE_ID(tile));
>  	if (IS_ERR(vm))
> -		return ERR_CAST(vm);
> +		return PTR_ERR(vm);
>  
>  	xe_vm_lock(vm, false);
>  	err = xe_migrate_prepare_vm(tile, m, vm);
>  	xe_vm_unlock(vm);
>  	if (err) {
>  		xe_vm_close_and_put(vm);
> -		return ERR_PTR(err);
> +		return err;
>  	}
>  
>  	if (xe->info.has_usm) {
> @@ -430,7 +430,7 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
>  		u32 logical_mask = xe_migrate_usm_logical_mask(primary_gt);
>  
>  		if (!hwe || !logical_mask)
> -			return ERR_PTR(-EINVAL);
> +			return -EINVAL;
>  
>  		/*
>  		 * XXX: Currently only reserving 1 (likely slow) BCS instance on
> @@ -450,7 +450,7 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
>  	}
>  	if (IS_ERR(m->q)) {
>  		xe_vm_close_and_put(vm);
> -		return ERR_CAST(m->q);
> +		return PTR_ERR(m->q);
>  	}
>  
>  	mutex_init(&m->job_mutex);
> @@ -460,7 +460,7 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
>  
>  	err = devm_add_action_or_reset(xe->drm.dev, xe_migrate_fini, m);
>  	if (err)
> -		return ERR_PTR(err);
> +		return err;
>  
>  	if (IS_DGFX(xe)) {
>  		if (xe_migrate_needs_ccs_emit(xe))
> @@ -475,7 +475,7 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
>  			(unsigned long long)m->min_chunk_size);
>  	}
>  
> -	return m;
> +	return err;
>  }
>  
>  static u64 max_mem_transfer_per_pass(struct xe_device *xe)
> diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
> index 3758f9615484..e81ea6b27fb5 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.h
> +++ b/drivers/gpu/drm/xe/xe_migrate.h
> @@ -105,7 +105,7 @@ struct xe_migrate_pt_update {
>  };
>  
>  struct xe_migrate *xe_migrate_alloc(struct xe_tile *tile);
> -struct xe_migrate *xe_migrate_init(struct xe_tile *tile);
> +int xe_migrate_init(struct xe_migrate *m);
>  
>  struct dma_fence *xe_migrate_to_vram(struct xe_migrate *m,
>  				     unsigned long npages,
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> index af43e04179aa..bf9fa1238462 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> @@ -270,11 +270,16 @@ int xe_sriov_vf_ccs_init(struct xe_device *xe)
>  		ctx = &tile->sriov.vf.ccs[ctx_id];
>  		ctx->ctx_id = ctx_id;
>  
> -		migrate = xe_migrate_init(tile);
> +		migrate = xe_migrate_alloc(tile);
>  		if (IS_ERR(migrate)) {
>  			err = PTR_ERR(migrate);
>  			goto err_ret;
>  		}
> +
> +		err = xe_migrate_init(migrate);
> +		if (err)
> +			goto err_ret;
> +
>  		ctx->migrate = migrate;
>  
>  		err = alloc_bb_pool(tile, ctx);
> -- 
> 2.43.0
> 
