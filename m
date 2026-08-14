Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40889C5CFC1
	for <intel-xe@archiver.kernel.org>; Fri, 14 Aug 2026 18:54:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E796410E141;
	Fri, 14 Aug 2026 18:54:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SK9g1dpb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D081110E141
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Aug 2026 18:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786733691; x=1818269691;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=A1kOSi+nP7nPpIqJkID2/LewzFEvDziLEiZT+oFA5zQ=;
 b=SK9g1dpbqnvnv/qHsHtyS0eNt6L13KTxcLCFikhIaGaCxU54dpJOgHVQ
 kHh1FFqWpscJBXC8sk/8K/tElF1slfBzSdCAEXPVK1FrUG0pN51wG55U6
 kfn5yRq0Hmn3Jlw5FPCFla9nRaQjTGl/1T67duqyY8yj7M+F8g24MKdg4
 psicY7kNHsl3lZH/c2Vb/J2yor9bskYbOIgIly5U5zDjHh91AKK511X0v
 1fI9csdoH4t8gw7jeuCwGJ4rsfk7dzBD2rh1pI8FA/N5/2TsuegxoopVw
 qbXQtNsIKnjso2kOz4tdO8gk39Kd2V/vqJRjyx77lDTBZr3P+tD/8Jz1v A==;
X-CSE-ConnectionGUID: DN9MRsIBRey9jbO+EzB31Q==
X-CSE-MsgGUID: QMXf6bSESBGzXgHWRCeHzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11875"; a="87446447"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="87446447"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 11:54:50 -0700
X-CSE-ConnectionGUID: H6kE/eCSSXW5W44O3+JLkg==
X-CSE-MsgGUID: YGbwuKbeRvyWN3AF5rwOhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="302530934"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 11:54:50 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 14 Aug 2026 11:54:49 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 14 Aug 2026 11:54:49 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.11) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 14 Aug 2026 11:54:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=baPOkbhAGnjY26yW0bVscSMltKexUWi8h6vE6F3PiuI9wiwElSqjSyWAGJDyzP5ixT71GrsmkFzEZP86p+BGEYsdU7NjxaVTwHHZmDRNDZAVKVKY+GR4DTjpMDfQdQ2QgVbIraYsAKXk3c9WnvUEmgyl4bWlhsKVlUpwtQuGvTOjM7Mjqsj6mSFrD1mYjfsmOFJp2csZz4++8iPcowEOAGsy+qobQ5kF1DREaKgcyWODLCbeUJh30oUVNwfSMMxErl4v1qI2RBxEdxxXQtmNKxHM0b9IIqopnIBe9RPB+tzXDBURVuNsn/DHyMGDQ2sKA897uGPRWE0POXyXIO96DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3MJUBzRboJGh33raaeQeo60NvG7871UPmzjigWNbbmo=;
 b=vjB45g+6zGQvfHaNPk0P5xkrqLDYnOa1kY2GtiXtnLzMng1gKrbmMDHg6Sj4j307pIItVyuLKZbyvD+lnIvNr6uSC2SzENbHjg/u4SpU/7z6TtuZHvEO6HnOJmQpNnoBRnXudLlMoSnWhokBSWVupAI/065j2d7uPmZStLvImY132439SamlIz5wWSaCHOpuZnIAzstnN7icqgmofgdz+22x7ZtXb3IQlpUmHd2heV3VR7cFV9dbgsaJjUAGvqDjQc3OEmXNz3s8ge4MamdgklqHLaNARPVszZCc2Z0b0yMm0baFIvq0HM6CmfITgy2KllFSZ3tVEf36GMErwOwFqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5073.namprd11.prod.outlook.com (2603:10b6:303:92::23)
 by IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.13; Fri, 14 Aug
 2026 18:54:46 +0000
Received: from CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe]) by CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe%7]) with mapi id 15.21.0315.014; Fri, 14 Aug 2026
 18:54:46 +0000
Date: Fri, 14 Aug 2026 14:54:41 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Mallesh Koujalagi
 <mallesh.koujalagi@intel.com>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Matthew Brost <matthew.brost@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>, Riana Tauro
 <riana.tauro@intel.com>, Raag Jadav <raag.jadav@intel.com>, Badal Nilawar
 <badal.nilawar@intel.com>
Subject: Re: [PATCH v5 00/33] drm/xe: Add structured SIGID error logging
 infrastructure
Message-ID: <an9kcfvZJrLJmN57@intel.com>
References: <20260814171801.13347-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260814171801.13347-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ2P221CA0005.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:a03:5db::17) To CO1PR11MB5073.namprd11.prod.outlook.com
 (2603:10b6:303:92::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5073:EE_|IA1PR11MB6418:EE_
X-MS-Office365-Filtering-Correlation-Id: 53ee7b9e-e506-49f4-2982-08defa35823b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|11063799006|10067099003|6133799003|5023799004|22082099003|18002099003|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info: BxPcaN82R3Sx56avyRNUjY8xmjs7m72Z/MqZoWXaBzCN40wAla0jIZRKcFhfJcVyokGiRKQP36+LxuzGjc+9VbUOQN8tMZanmvuDuBkTjuGbC7KCpWkbplJiQWufnACnLAjS1GnD6O+TJpU+Os2i6T3fnM1cO/VIHABW52b/PI4MBjvMiJb4CIH6f/o0fK4tMDiPOmgolyHfi/3w8C9Dq0uQQakXoG+HyHIu1R3oj+I8oUbcgZlwCLKcOhe43O2iZXWJNa1RWl0Iy/elJR2bvr8YFATtc3Z4zcA5KYpPT/Q6XDdk4QNqWvswhbw100ccWE/cXFvsin7kMRV4cZNxKTtLMpsZNygpDspIYBSP+HqELEGAHgxe1j4pc9UuAzGSa5MlJr3FZHuKUYPhpEmstOzCLvnTUw2jj3Z88CZ9XrxK6Y0q/IJ3zAXOSQ5NNFhy7B1hop++bOdn7ZMQVPMfmLUvAOfseINliotYObNxjMdpyeAg7nUMaxph1OSOC9uj+chPHtjAGC8ZiM941JTmFeFKyL2aX48WJLWPOdDiL6oetr4djeQv82NZqD/LMkleUMvfjNBdBvzXQgji0EYXxWKzHXTfDGnmDnzp7W3bQm0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5073.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(11063799006)(10067099003)(6133799003)(5023799004)(22082099003)(18002099003)(56012099006)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?lTXE4oNexJG7XbKTJRgHJX24d5dB4s6ZZrMT4/bcAg6A5Y2+/2E79xzKXP?=
 =?iso-8859-1?Q?uPCoiMbPEKXY2Ww5K6LgT0of28rNh1MvaiU8KHEI5SaWZfYBiVugNSrrKZ?=
 =?iso-8859-1?Q?/zvaAPbtHgi1ZClAG6HTfFig4hVtAMb5HJOc7kGYBLyu0vTB5z0p1R1aLP?=
 =?iso-8859-1?Q?pDlu2P/RVpSZ4ZzvXZ0oyZrJGngE3mSX/LzrL6E5aO/G9haE+9TTe95dIy?=
 =?iso-8859-1?Q?VTshjguEJvNAiFoSXVcbRAfUDCGBcswuF9cIMcaHP2UHPuin7CWDsZrfpw?=
 =?iso-8859-1?Q?SMCNVE6BqgEMy+zDAPTvU01RF4ZbnlmkRR9XGFYSv/SyoHe/Jy2PCMeVoo?=
 =?iso-8859-1?Q?raISTsQ5TMHDYXcO+dVPT2BnP/2hfY1T/dceZO82Z0IQ3VT4wanUNNPV1N?=
 =?iso-8859-1?Q?A2f/uFLWboBLZsD5q5pUCZ75QDs00a3Je9ULxF8U5eRCrLyIOTm0mqni4v?=
 =?iso-8859-1?Q?G+psZNG6850UuLcuhkUCCVADraBsnhvpankywzqFuQoP0iroAAweCC/eSZ?=
 =?iso-8859-1?Q?QtF7lPTFJOtXZrdJb6zvCI52nhXCAmL5tIBc0pnDyUjXvsJ/yjKHDmCzDZ?=
 =?iso-8859-1?Q?3hCBMENhGXzD5IvC4RgYvd30ZtF7GBl3zq/jQNLpXuXV87KeJ7VTV2633h?=
 =?iso-8859-1?Q?EIADyDgmYHSTKNm7PTM7TBGjZ8dKOE5tU2dA+TXqMuYrnEy2ORF93+3EW6?=
 =?iso-8859-1?Q?pqDZOQEoSaHliloANUc/XeIRGpKGhQHyyxhThgEmkoDK5jxs3zYnNSWwFS?=
 =?iso-8859-1?Q?hxIZHxa0wxXvNSi0buL/2LOfIGHaxa3FdvkoghynIbA30aoJrRMFjmD3wk?=
 =?iso-8859-1?Q?xB3pjv45wv9cBkoTxsnKQAQsWNpY2zHt9E5Vghk45Uw4/0IjgrrmkwIUo5?=
 =?iso-8859-1?Q?JG4lEenREP31y+5bw0DRtkM2mZU6cC+3MSGTdGRdfMQm0rehOX8orVeYTf?=
 =?iso-8859-1?Q?5c2pBA8rKFBWlJiekN5YE+L2OvG+gH/Lc2ZJEu+ymrvKAQa+EjzwrqQ0+M?=
 =?iso-8859-1?Q?4MA0re9cGoNEcGjYTldObBVZ8qBqe2mKrecZU5jqShfn7zleZo3m83t3eE?=
 =?iso-8859-1?Q?m7hHx9706j/RBo30llduk5UoTv867nUhaQxnKAkxrMjm9O3cM3Q4xr78IL?=
 =?iso-8859-1?Q?mZRINmdxRrRhKaqLXtJ3qjBx87FF1xVTPMaKSdWKn65i01i2df0QqW5Rh3?=
 =?iso-8859-1?Q?Ui6wwJnqBefTJ3HjDAILK/BQpHH4aUh9rIFxq0iq5h+aK15Cs5/8vn5G2K?=
 =?iso-8859-1?Q?+xeqt+TpmRyyeZNkNQVMUW9PB+uHPxTW4RLVGSAJFO12fs8VCslMvvzYM4?=
 =?iso-8859-1?Q?F7KeS37F5aBQGZYBmi3ri8Yf2IiQ4E8CdU/bSVDdBmh9gidpK+4FtsfwDY?=
 =?iso-8859-1?Q?EAwBRVhjlLpFbIz/nGE1F/RX58RJXngFmM7J5Fu8eLgsrlAvWTIWvaEwFY?=
 =?iso-8859-1?Q?JZTp2rqiYmdTQsJbeaEPxp7romS/hC9GGo1cIvmk4gN5GCqEWYG/lwnmi/?=
 =?iso-8859-1?Q?5K40vYHnWDiEW11jq+SARGYkG4i55Gnfapr0dYmVbaM7tEt6U2lXG5eofp?=
 =?iso-8859-1?Q?GbP5XRzOmUElyMchxG6+qR7z5dqxHk7e8PkCDVKHPOdAxxj482PACy43Ko?=
 =?iso-8859-1?Q?5CblkUnFfFVu9i7Wfj5a1jEImqf5qkhA9UuG4xhq0oSE7gsMWvn22V82A3?=
 =?iso-8859-1?Q?+fotgl6IPWIWtxdzcMzV3WtXu22QQ6jsQ8viPIxo0QBhJysh+kDLMtf6A4?=
 =?iso-8859-1?Q?t7MQiL5lO+GkVlz3Y0gFVD/tqx5tlCeCAwEkimKgstiLKLdTqaBK3rv+eA?=
 =?iso-8859-1?Q?qzPjj28FNQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: gXsoCnI7SBF4ki+hboC3tSvtnJNEF2Rjd7M7BnC+jeg5mLSGnBXQQOmefuCNPDgIeCpweX1Goq4R7S4gZKXGU0O7lc8gq5k2XiK/lIDw5p+0QlZ0qtOrFzSbuPoqTiIaNwNDsvKdjPuuNvKyeqIJR6df43/7JlsKbkCJsZ08sWLaJzFIAf9hwRPVTqJZkA9B/LauL3xDc6toQCAi3/8u1jCMM7PakfQyS2tognEUtrcpkMfvx/6zxAMQ3xWGldYaqlACLWFOBsLoUoxxOfzRtWQghv5htkRfCh/yiAiEADS5VxnDHjolF52IqSXhhAdRu85k3SQTvkatX2J6q2I0qQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 53ee7b9e-e506-49f4-2982-08defa35823b
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5073.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 18:54:46.1460 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A1Kn6zHD6WrXs1GVf0/tJFqE3GA+geuIJgWllI0yAN4XHjJVFa8TvN65fI2HTSIN1qNq+XeyE4lPQGk+vAIU9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6418
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

On Fri, Aug 14, 2026 at 07:17:26PM +0200, Michal Wajdeczko wrote:
> Today the driver reports faults with ad-hoc drm_err()/xe_gt_err()
> strings that have no stable shape. That is readable for a human, but it
> gives fleet tooling nothing durable to match on: the wording changes
> between releases, lines can be rate-limited or dropped under an error
> storm, and there is no consistent way to ask "which recognised fault
> just happened?".
> 
> Introduce a signature identifier (SIGID): a small, stable integer that
> names one recognised Xe fault situation and serves as the primary handle
> for triage. A SIGID maps, through published end-user documentation, to a
> description and a recommended action; the driver only has to emit the
> right SIGID next to the usual human-readable text.
> 
> Design decisions:
> 
>  - Software-emitted signatures only. This header enumerates just the
>    situations the driver detects and reports itself. Signatures that
>    originate in firmware or hardware are identified by those layers (via
>    their own records/counters) and are logged as received -- minting a
>    driver-side id for them would duplicate an id the reporting layer
>    already owns.
> 
>  - Flat catalogue, chosen per report site. Each site emits the single
>    most specific situation for that site, so a multi-layer failure
>    produces a chain of reports rather than one ambiguous classification
>    (e.g. a failed GT reset reports GT_TDR and then WEDGED). A site that
>    matches no defined situation keeps using ordinary xe_err() /
>    xe_gt_err() rather than forcing a wrong id.
> 
>  - Stable numbering. A single flat list numbered sequentially from 1, in
>    introduction order. Values are only ever appended, never renumbered
>    or reused.
> 
>  - Severity is decoupled from the SIGID and chosen at the call site via
>    xe_ras_log_fatal() / _recoverable() / _info(); the same situation can
>    be reported at different severities depending on the instance.
> 
>  - dmesg stays close to a normal xe error line by reusing xe_err() /
>    xe_gt_err() (and their Tile/GT decoration); the only stable,
>    machine-matchable token added is SIGID=<n>. dmesg is not an ABI --
>    the durable machine record is the CPER carrying the same SIGID (a
>    planned follow-up, left as a TODO).
> 
> Wire up a representative site for each software signature so the set is
> exercised rather than merely declared.
> 
> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Cc: Riana Tauro <riana.tauro@intel.com>
> Cc: Raag Jadav <raag.jadav@intel.com>
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> 
> v1: https://patchwork.freedesktop.org/series/171022/#rev1
> v2: https://patchwork.freedesktop.org/series/171022/#rev2
>     component/location dmesg decorations moved away from macros
>     HW component identifiers related to RAS/FW enum values
>     CORRECTED severity rendered as an error
>     more support for const pointers
>     log 'probe blocked' as INFO
>     fix kunit device setup
>     more tests
> v3: https://patchwork.freedesktop.org/series/171022/#rev3
>     fix typos, args list and to_dev() corner case (Sashiko)
>     use assoc macros in xe_any (Jani)
>     add xe_any kunit test suite (Michal)
>     add more xe_log test cases (Michal)
> v4: https://patchwork.freedesktop.org/series/171022/#rev4
>     more patches with SIGID usage (Michal)
>     support for printk index (Jani)
>     more macros and other fixes (Mallesh)
>     no recovery buckets (all)
> v5: new helper xe_log_err_info (Michal)
>     survivability changes (Riana)
>     report fault-response as info (Rodrigo/Daniele)

Thank you so much!

series pushed to drm-xe-next.

> 
> Mallesh Koujalagi (1):
>   drm/xe/log: Add structured SIGID error logging infrastructure
> 
> Michal Wajdeczko (32):
>   drm/xe: Introduce xe_any helpers
>   drm/xe/log: Introduce structured component/location identifiers
>   drm/xe/log: Add component/location decorations to dmesg
>   drm/xe/log: Add SIGID log helpers for severity
>   drm/xe/log: Add SIGID log helpers for location
>   drm/xe/log: Add SIGID log helpers for location & severity
>   drm/xe/log: Add SIGID log helpers for components
>   drm/xe/log: Add SIGID log helpers for component & severity
>   drm/xe/log: Add SIGID log helpers for errno-only
>   drm/xe/log: Index all SIGID printk messages
>   drm/xe/log: Add hardware error signatures
>   drm/xe/log: Extend components list with hardware items
>   drm/xe/ras: Check RAS and LOG component definitions
>   drm/xe/kunit: Setup driver data in the test device
>   drm/xe/tests: Add Kunit tests for xe_log
>   drm/xe/tests: Add kunit tests for xe_any
>   drm/xe: Report 'probe blocked' status using SIGID
>   drm/xe: Report all probe errors using SIGID
>   drm/xe/survivability: Report 'boot status' using SIGID
>   drm/xe/survivability: Report sysfs failure in one place
>   drm/xe/survivability: Report 'boot status' on sysfs failure
>   drm/xe/survivability: Report 'Boot Mode enabled' status using SIGID
>   drm/xe/survivability: Report 'Runtime Mode enabled' status using SIGID
>   drm/xe: Report 'device wedged' errors using SIGID
>   drm/xe/pcode: Report 'Mailbox failed' error using SIGID
>   drm/xe/pcode: Report 'timeout, retrying' error using SIGID
>   drm/xe/pcode: Report 'initialization timedout' error using SIGID
>   drm/xe/guc: Report 'GuC mmio' errors using SIGID
>   drm/xe/gt: Report 'reset failed' errors using SIGID
>   drm/xe/gt: Report 'Fault response' pagefault error using SIGID
>   drm/xe/gt: Report 'Queue full' pagefault error using SIGID
>   drm/xe/pci: Report 'cannot re-enable' error using SIGID
> 
>  Documentation/gpu/xe/index.rst              |   1 +
>  Documentation/gpu/xe/xe_sigid.rst           |  14 +
>  drivers/gpu/drm/xe/Makefile                 |   1 +
>  drivers/gpu/drm/xe/abi/xe_log_abi.h         | 199 +++++++
>  drivers/gpu/drm/xe/abi/xe_sigid_abi.h       | 172 ++++++
>  drivers/gpu/drm/xe/tests/Makefile           |   1 +
>  drivers/gpu/drm/xe/tests/xe_any_kunit.c     | 213 ++++++++
>  drivers/gpu/drm/xe/tests/xe_kunit_helpers.c |   4 +
>  drivers/gpu/drm/xe/tests/xe_log_kunit.c     | 553 ++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_any.h                 | 137 +++++
>  drivers/gpu/drm/xe/xe_device.c              |  16 +-
>  drivers/gpu/drm/xe/xe_gt.c                  |   7 +-
>  drivers/gpu/drm/xe/xe_guc.c                 |  18 +-
>  drivers/gpu/drm/xe/xe_log.c                 | 235 +++++++++
>  drivers/gpu/drm/xe/xe_log.h                 | 194 +++++++
>  drivers/gpu/drm/xe/xe_pagefault.c           |   8 +-
>  drivers/gpu/drm/xe/xe_pci.c                 |  32 +-
>  drivers/gpu/drm/xe/xe_pci_error.c           |   7 +-
>  drivers/gpu/drm/xe/xe_pcode.c               |  14 +-
>  drivers/gpu/drm/xe/xe_ras.c                 |  11 +
>  drivers/gpu/drm/xe/xe_survivability_mode.c  |  85 +--
>  21 files changed, 1854 insertions(+), 68 deletions(-)
>  create mode 100644 Documentation/gpu/xe/xe_sigid.rst
>  create mode 100644 drivers/gpu/drm/xe/abi/xe_log_abi.h
>  create mode 100644 drivers/gpu/drm/xe/abi/xe_sigid_abi.h
>  create mode 100644 drivers/gpu/drm/xe/tests/xe_any_kunit.c
>  create mode 100644 drivers/gpu/drm/xe/tests/xe_log_kunit.c
>  create mode 100644 drivers/gpu/drm/xe/xe_any.h
>  create mode 100644 drivers/gpu/drm/xe/xe_log.c
>  create mode 100644 drivers/gpu/drm/xe/xe_log.h
> 
> -- 
> 2.47.1
> 
