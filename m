Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3563CC5CFC1
	for <intel-xe@archiver.kernel.org>; Fri, 14 Aug 2026 23:24:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E514010F4B6;
	Fri, 14 Aug 2026 23:24:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dro1yGJ3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF21710F4B6
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Aug 2026 23:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786749853; x=1818285853;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=+mDgCVyxFb7BuSwW7iFsBnUX1xysz8mBO7hzvRBAkrY=;
 b=dro1yGJ3jmxvgzs7bZQCBEGS/ZAIVwpVhbr0sQr7n5jMfsxuvneFjMwR
 2bt4FpotwFNutmpozTvJ+UuzWur4qE7HXFyEC1GTWqbrq8qRKO9/8tk68
 4Z5h/3CQiZN9ujg4ZapRQYL9xrw9K6AZ81I1gwSmvXptl/i8vbQWc1mpC
 7WgU9llDn8WPih3miPXqtl0fpcMEnudjP/pKTNn9ZD54j4xSPAC7gjgxJ
 h5l5KB/Ji0o0R4wa98ftTCCdGHfXP8SrXkX743czS86/E3s6evW9Mdhvb
 ecEooqUuKSG+iXzvnMT4nOOoSLIwR5lvtUPGFNb8ows5ifuHRc31qRFFW A==;
X-CSE-ConnectionGUID: W3HDBkTQTAOVaD93D0xGbg==
X-CSE-MsgGUID: 4ODLdLCmQx2WN5eSkEL9lA==
X-IronPort-AV: E=McAfee;i="6800,10657,11875"; a="91205261"
X-IronPort-AV: E=Sophos;i="6.25,224,1779174000"; d="scan'208";a="91205261"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 16:24:13 -0700
X-CSE-ConnectionGUID: Lb8Cy2EhT3KSkG5cmFKynQ==
X-CSE-MsgGUID: kQ7CrXqTRsSMqpSE7h069g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,224,1779174000"; d="scan'208";a="263904446"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 16:24:13 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 14 Aug 2026 16:24:12 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 14 Aug 2026 16:24:12 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.15) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 14 Aug 2026 16:24:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TT1E/u2i9WSGqLavxl5fD3oZPIxMRDUDHc5bnSqp+r6C/EzSJwtVVaVoJf5DsBKVHafZ98fq1yOuVqQbq1MZLzmQBwF8KFCc/aKcVgPpeHUP3AZGuGzHgUT6ovHA5IpWP5a3STxj0KjTtJ/c2b+dt8xWJSp3n5WVIurJA80EUo/jQ3JQsQKIeYqvqDb9V9zwXkXeNaPxIxnmg+TZDanMluu42ECLf6QRX0IB2MfBtVY6wT78abU5RABc7QLJEyDSD6NkKguL2G2o5rwWCm6V/W/xwRgCV2Y7n9N7QgjwaE2DvdSEnMqJkbqb5BLkmwJuUv7s409L5XfRfgle822HDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uxy53eXQkFmKCO55DpQgn/ENh2nW3yjKK8TIMgtohQ0=;
 b=E22+jzQO7SXlY0yNQ7+i0X1DKEDEqRyIBpUHB0kuRYBD5GZ67JYlL0K4iUs3BKUpX3VqyRLunH7mbMatFfe07zdj3rHYt8IdSprwFAGWw+3Q7xL9wLtQT1Fq2t8OBMp3AxV87dxotc9HSQXTmKdLSbyEY5IQBZ0uuRhAFW9kV+BICNzw92rAi+0t+4GKzE+5i/812+kW3kr4raCNr5hJk3RJhe7Zwgwx35dhWjj28tmVXj+pPqQ5m4F4Ba8EoSeGecZMClrWF/M76Go6uqRFKVj9sIs4IDyX4tYqFbIhpbk/lsSFYjDIdB8ykcjs6MErFJIudlA8qaqsDTGq9i8+Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW6PR11MB8390.namprd11.prod.outlook.com (2603:10b6:303:240::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.16; Fri, 14 Aug
 2026 23:24:09 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0315.011; Fri, 14 Aug 2026
 23:24:07 +0000
Date: Fri, 14 Aug 2026 16:24:05 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Auld <matthew.auld@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH v2 2/2] drm/xe: Update shrinker batch size based on
 average BO size
Message-ID: <an+jlUmNfwnh44Pl@gsse-cloud1.jf.intel.com>
References: <20260814143737.49684-1-thomas.hellstrom@linux.intel.com>
 <20260814143737.49684-3-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260814143737.49684-3-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0296.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::31) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW6PR11MB8390:EE_
X-MS-Office365-Filtering-Correlation-Id: 454a7633-3ccc-40d7-9b1f-08defa5b2321
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|11063799006|4143699003|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: SWvobUSFQEvzNBsB8YlHMfRTHB8hGzN6BrSc2ldGuJwRuI8Sqo/sTxd7rzcmNKPTV0n4N5QlmhkSGWRYnNCNTSQZrae6Qd+KmpxqvHQHStIOm5uJZkiAZcTcDjK3eSc2wnkzzU+GOUOSqsxz7y3HSc9l0MXk5tK+K78f4HLR+UdAuMErn3iAYio6mUrjL0QlWSJ5HS/eHb4r77rkiT1IWShgjPiJ1eOR/sLtz+G9NU98hrOvJkKnjBZwMF2oW5Rtax3tt9WITY+3Vbbo/eqEUyGGH+BMWfjfpkmaa/PBSgaIHt8g7+3VdcOmXPfngG62FQWfItr+P/HH1l7CDKVWEaGmPAfOmqH05p8AHvqvFh0Ve9J+99iwAUxEADZI/nESfMEtcs9WlmVxX1H0RH1imJVrG9aW4gpCGYzhOKYVVCBjMmoEUpciMFcgigTXmxpFjSkKTxGUncr/QH/tsYyaRjBUyIhpISQiyz6uLQF4lTl6GQxx57ouWeS9Gro2B5XRNNrROF+YxUy/i34O0u6FBKadJVG/hKja0907kIkhCc/WFFckS17emFpA9kS21QiQFyjEir/uBpYJ3N4i28kWY833cKNI9yDFhgHbqqQ6YV0u7e0wy38PtaPCDUWCkuFsaoOtK8YdIQtqUYNmyYa9y6DN1eIjsFIMLSztY1SU+Ys=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(11063799006)(4143699003)(10067099003)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?NseeZf9ZkPI6dl5YOOR0qWeRR3nLKQap/nhhx36Gl29c5PkB2iOPMRGU9F?=
 =?iso-8859-1?Q?RytrX9LHJ82sYHf9mYuKiZu/b/M1crjIK/2fYAKAXU90h0aPMh7KTLK6iM?=
 =?iso-8859-1?Q?5tce6wJMqm5ZylQhvBUqzdt9O6SlMlcYUQTlNYgm2PAC9GqOmGz+SWfaew?=
 =?iso-8859-1?Q?qEcEtGIvlQuGCyKzI9uM1BFoRDKhBIag9AC9sYHNggRr/dAL1yKzhestsv?=
 =?iso-8859-1?Q?tLaoVci7yKSBPZyow4Kw9VcvUpbAuuJUCq+ozlMTMGFv+DDBaVcWlDAL+6?=
 =?iso-8859-1?Q?SzdW/VaY8TkSq+XxHSaUJyj94JZIpxG2PX8H/kOhVR58VFrmQ/3zrlWhZc?=
 =?iso-8859-1?Q?Vz/U+Z8JEO6FzyUTKyaf8Qp8Oy2frH9oHYt5RSzzJyH5d0WkZraZLLeErf?=
 =?iso-8859-1?Q?iGSOSbPJTj/DI7GeQ0I0R+vPN5kdrgVayKSujyIbzB2d3iEIiHG7NdKoEL?=
 =?iso-8859-1?Q?MJfVH/hGC812yVn6Moq0VGQ8R4SYGZov0eU0qlZVLIj7MUt7sFirTGFs11?=
 =?iso-8859-1?Q?fvAirwJq+3dbFITq12WJv0n8hE7wR48DThYQNp8rFrucD5ejmJ1DyfmIOJ?=
 =?iso-8859-1?Q?6aEi9EaViL1IVfQE94IwpCH4LN4PWCggnti4SR7KFtIXuptPhFLsYFR/qL?=
 =?iso-8859-1?Q?IuHvZKNV9BC5LM4hmiCDtA4x+JutmdzKEEN24buLVtyjk5/Gd+nqr/TyQd?=
 =?iso-8859-1?Q?oZtNZOcrUkoViCaLhYTRFSdrPAlVjFX+r5GiGXCMjwpJ1ljFqDNp4rOlZJ?=
 =?iso-8859-1?Q?N4AHYHvxAfO3npuUQ+AQIE1C/oQTngq6cOdwX5N9c1RgmvuK0AD9diFtZk?=
 =?iso-8859-1?Q?IRcSuCYHWZcmHMx4ZoyoRe0QijNzN1H3BtvpKEfTB6ff/tHlXotwsRWkPy?=
 =?iso-8859-1?Q?ErgXP67NbRTvFAaPKFShp97cl5zmkOYY55asWN2/iJrF3x2Hn7JokiXccy?=
 =?iso-8859-1?Q?3tAJpJEDpLhlHvUPGq32DC2pL2IfGocVmoNtrY/At+ZpHJWEh21bD9Ea5i?=
 =?iso-8859-1?Q?ugLMSYVFueYRWn6W/FhgtUqLjSQTQnRdoxNfOoRgZJmx5Kp3DL1Xhtx+uP?=
 =?iso-8859-1?Q?rwAnKSoN5YadVJyXJZ90Kxv85h808VZ/2anZmmdI/XUs90nOcQOJO9fJDG?=
 =?iso-8859-1?Q?FRe83dpvgo6m0aAPKRtXmokQHi+4LarUduODNDYFc/CicHmUdEyvgcqzPI?=
 =?iso-8859-1?Q?twrhYgY0ZsqP4PvOtz/jzAB/yF22EQQUz5Ad3veMLRU6vIqcstD8PZeHxk?=
 =?iso-8859-1?Q?G03kh8UY0Fq5smQP+cgfnd8LvEpN0M4iRT/IrlSd6DGKMfDBmSUJoywhTz?=
 =?iso-8859-1?Q?MvygfjalAzep3A3LjbbyFVLmUqbTrp4ZXWVHWCEPdpX2znqsq35QQBjgPC?=
 =?iso-8859-1?Q?LFT1WUJOQ8MC1TVSbhgQmjlTScNJrdVIxjSqc94RGMki++/yKoOqv/258E?=
 =?iso-8859-1?Q?iAVOGV+wLBLEMnfqGzgYqGN+p1H8gF/UTiXpSnrOX25lt0lIU2gnNbOur/?=
 =?iso-8859-1?Q?IzaPhzvhrpkvtRVfCINNu1Wov3EjgaJP7CDDgO4huTyLa9tNZd3ijdhHmv?=
 =?iso-8859-1?Q?nGBewg21v1L59WF8fwHBpwoIFLog2qmkTQ3JUd/BxgsAS8mT0FoK8nr2Jc?=
 =?iso-8859-1?Q?SAsRalSEIgAW5fu77iT36d5g/DYnmR/2JhlPk27cE6TAhtoD2QNajhofRJ?=
 =?iso-8859-1?Q?3VHU2GOnFYAduUhcbBzoPwHj1Ywvj1IXYly0Cc8m87QZbscNsl7pQUqHxX?=
 =?iso-8859-1?Q?ziJwJZ4v2xBUiWgYawax8zPDymq+a6hS2h0wcpFEXwXdxe/rB/dj+uDJxt?=
 =?iso-8859-1?Q?rnRtZwEgAQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: IJ5TZrhvusBRqR9+zuzefOzmHueFBfyVdTKOoPR7XZo+JytJhw4RCALXtjW8o8stxrPgLf8VatCDk/a9ylQFFD2Or/pmGcipgDB7YwuEMrTiHrlq4O0xJHLjTmLg6e5EUVQktz5TZMuVxw1rVFyGWH7jZItyxHNL2dc6KxDHHBtSoGgCyKmC6pGX6BzAth5ioGWjjpcD9J/iY/D5E3k2nlwzhbKU5GwtW9rOE/lHZuUZqUv7oHHepPrnmsDBBqqk9G/Z7hkNh4RelOabGhme2dt2t9hmRqbz8EsmSXWqsOIJ4F4FAbj/7ObR0Wx/sd/m7/3U88NULNTarSv0STx3RQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 454a7633-3ccc-40d7-9b1f-08defa5b2321
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 23:24:07.3530 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p3uvPXmqm9+bV4cjcQ3TkIL6gshpTUUAHLXS1kQeIJvUwKh4fv7t/vB6OAE9Oik1Oz5M7Xdoe2JMh7BVSfNEOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8390
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

On Fri, Aug 14, 2026 at 04:37:37PM +0200, Thomas Hellström wrote:
> Update our preferred vmscan batch size on each count pass to avoid
> invoking scan_objects for requests too small to free even a single
> average-sized GEM object. Our rough estimate for an effective batch
> is twice the average number of pages per populated ttm_tt across all
> shrinkable and purgeable objects. The factor of two provides headroom
> so that most scan invocations can free at least one GEM object despite
> variability in object sizes.
> 
> The batch value is updated as an exponential moving average,
> (old_batch + avg) / 2, to smooth out sudden changes in the
> object population. It is floored at 128 pages, the kernel default
> SHRINK_BATCH, to ensure the shrinker remains responsive when there
> are very few objects.
> 
> The populated_tts counter introduced in the previous commit provides
> the object count needed for the average. We inherit the same
> justification as the analogous mechanism in i915: shrinking a GEM
> object has non-trivial locking overhead, so firing the shrinker for
> requests smaller than a single object is wasteful.
> 
> v2:
> - Fix the average object size estimate to account for the full
>   shrinkable and purgeable population.
> 
> Assisted-by: GitHub_Copilot:claude-sonnet-4.6
> Assisted-by: GitHub_Copilot:claude-sonnet-5

This is probably the right direction given what we currently have in
terms of shrinker control, but the core heuristic is still a pretty poor
one. My understanding is that it combines batch and seek values using
some odd math to determine whether a scan is worthwhile at a given
priority level. We probably want to avoid shrinking at the initial scan
priorities, and I believe this change accomplishes that.

That said, I think we really want two shrinkers instead: one with the
default settings (or perhaps even a reduced seek value) for purgeable
BOs, and another for BOs that we legitimately need to back up. The
purgeable one should be favored to run eariler, likewise the TTM pool
shrinker should be favored run before our shrinker too.

Also we really should look at getting priority based shrinking in too, I
have follow up there too which disconnects purgable / not in working set
from shared VM dma-resv also, further prioritizing though shrinks.

> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_shrinker.c | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_shrinker.c b/drivers/gpu/drm/xe/xe_shrinker.c
> index cded230f5459..284fce207705 100644
> --- a/drivers/gpu/drm/xe/xe_shrinker.c
> +++ b/drivers/gpu/drm/xe/xe_shrinker.c
> @@ -146,6 +146,8 @@ xe_shrinker_count(struct shrinker *shrink, struct shrink_control *sc)
>  {
>  	struct xe_shrinker *shrinker = to_xe_shrinker(shrink);
>  	unsigned long num_pages;
> +	unsigned long total_pages;
> +	unsigned long populated_tts;
>  	bool can_backup = !!(sc->gfp_mask & __GFP_FS);
>  
>  	num_pages = ttm_backup_bytes_avail() >> PAGE_SHIFT;
> @@ -157,8 +159,32 @@ xe_shrinker_count(struct shrinker *shrink, struct shrink_control *sc)
>  		num_pages = 0;
>  
>  	num_pages += shrinker->purgeable_pages;
> +	total_pages = shrinker->shrinkable_pages + shrinker->purgeable_pages;
> +	populated_tts = shrinker->populated_tts;
>  	read_unlock(&shrinker->lock);
>  
> +	/*
> +	 * Update our preferred vmscan batch size for the next pass.
> +	 * Our rough guess for an effective batch size is twice the average
> +	 * number of pages per GEM object. That is, we don't want the
> +	 * shrinker to fire until the request is large enough to justify
> +	 * the overhead of freeing at least one GEM object.
> +	 *
> +	 * Base the average on the full shrinkable + purgeable population
> +	 * (total_pages), not on num_pages, which is reduced to just the
> +	 * purgeable pages whenever the gfp mask disallows backup (can_backup
> +	 * false). Otherwise the estimate would systematically undershoot in
> +	 * exactly the GFP_NOFS / GFP_NOIO reclaim paths where avoiding
> +	 * excessive scan_objects() calls matters most.
> +	 */
> +	if (populated_tts) {
> +		unsigned long avg = 2 * total_pages / populated_tts;
> +
> +		shrinker->shrink->batch =
> +			max((shrinker->shrink->batch + avg) >> 1,
> +			    128UL /* default SHRINK_BATCH */);

I think 128UL should be at least whatever TTM pool batch is?

Matt

> +	}
> +
>  	return num_pages ? num_pages : SHRINK_EMPTY;
>  }
>  
> -- 
> 2.55.0
> 
