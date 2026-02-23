Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95FC9EF5861
	for <intel-xe@archiver.kernel.org>; Mon, 23 Feb 2026 04:35:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E07E10E218;
	Mon, 23 Feb 2026 04:35:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ei8n6mNb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 346A310E218
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Feb 2026 04:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771821325; x=1803357325;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=2WHrzJ8RF85JIgmDvE3c/NXxuvhk8JtjpGyJOUH2rIs=;
 b=Ei8n6mNbqMaQWkh6UBsOSau0iljzyhezBam7HU/IPuPItJ0J19d5CN+M
 BKoXwp8+lvfEG1MTwGNFmJMEdfwQJ1eiVyvyRnV3wu6+2WO0+lbw27Pf9
 FNPLpnNbC6WbWjOIYaBilYXuQ16UNrgXY4sB6l3BHY6bvoVteKL7uwnUF
 lhrkm0t1VckbNx0vjXWhrS/P6z0ZGG9WkbP4QtWYqPXxdlzCwqMJMM9jI
 vka3b+uHzqWpqwEP1kFqKEyO6qPU+JFizRMK/6XfGGhtWZ/3AebSsOJol
 90MMcCJosy7M3IK4Hz3QhmRAJa1enBpTBMQz4euEAsVJFE5uEliNgf3Zk Q==;
X-CSE-ConnectionGUID: mUHIVU2iT2uZmSAf8gaIaA==
X-CSE-MsgGUID: ME/q/SHuQL2H+7Ollc0cpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="83524766"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="83524766"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2026 20:35:25 -0800
X-CSE-ConnectionGUID: eWYK+KE7T1SSlQXt/9jpeQ==
X-CSE-MsgGUID: stO6WprCR0GyfQ7H8MBvpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="214364756"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2026 20:35:25 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Sun, 22 Feb 2026 20:35:24 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Sun, 22 Feb 2026 20:35:24 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.63) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Sun, 22 Feb 2026 20:35:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QzpdCjK9fke5+XQsHUTK3qS+CVU9h8L5/Su2yzCcJkbczkJ8cWP7fqxORvCiPqTRDRpGzP32SKs24rPR4TyNCN/1mD7+45pAgCD8AmKIFNnEdLST71TBC1t5mz5Qcy+TYDz5DmFyFb6hOKtuK8zNL70sDPSH/3xzge7CIcUQtssdKYWRhFrFntPwtNRSr8+fyuxtFhmB4S6eSnfj5TTtrOLdKltG3cQgezjneE4dZB5n61AuSZTn8IROYujxZm/qQZfuJvgX6jQ343stgNdghl+yPNQ7+YTj/Q7Im5DtGX1jsHMSRR/Fb31DAkvLGtZpr1OVlte+/GH4/4QAlgPovw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u0PFPjaGk+FisACBaYgCRPtj58BV39kqzOmlzjQCv6o=;
 b=eyXzO6kOsFOMQRgn5qRo5LSi+iVij2qqkhvkE1LlwfKhs3KVl2n/h8n8+zOcDE05bIVbW3YTmX9XzXftJhKFV1rpcDpTWc6Ws4WHzNE40rhWpTCRtcCVoa7RTp838BfoeEErY44GfeSyNE07ZLtcf9i/W1Evz0tevAktcTh+KaQ50zuJlyb310Tpxtg1uvvdq4VuZErG0aLKuc1Vb1NHDU17PPMHxw+yJxtQc98w33wTyaqOitkkn3up/n4pFMeCdq05SvT/8mf9yaohzqMUgj4zBbCKWrI+oGlkih6KmvQNAP/A2iEhVgoR+hhl3DlBOEeCzHue8Zbl+bDwhc74yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CO1PR11MB4883.namprd11.prod.outlook.com (2603:10b6:303:9b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 04:35:22 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 04:35:22 +0000
Date: Sun, 22 Feb 2026 20:35:20 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Varun Gupta <varun.gupta@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.d.roper@intel.com>,
 <himal.prasad.ghimiray@intel.com>, <priyanka.dandamudi@intel.com>,
 <stuart.summers@intel.com>
Subject: Re: [PATCH v5 1/2] drm/xe: Add counter for invalid prefetch pagefaults
Message-ID: <aZvZCI7Taku+538A@lstrano-desk.jf.intel.com>
References: <20260223040729.1157739-1-varun.gupta@intel.com>
 <20260223040729.1157739-2-varun.gupta@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260223040729.1157739-2-varun.gupta@intel.com>
X-ClientProxiedBy: MW4PR03CA0340.namprd03.prod.outlook.com
 (2603:10b6:303:dc::15) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CO1PR11MB4883:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c6bc4d5-088e-426e-df26-08de7294f510
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZGA3bRZq5QvHF3UWxUV7Dip77KQsj0evktG4gnAYf04zIId5TI0oY+jOIkzE?=
 =?us-ascii?Q?ejQGInjhSvPjs2UVe7LOzZ8+bIRhCGxKVaVrSJ4VXKJS4hKzWCWwXJkOLBGm?=
 =?us-ascii?Q?XHNF49fARDyruZRoIpWkemJ0KyKcHtni5N1+kAgrulIdVJmCltSTPsz3PAp+?=
 =?us-ascii?Q?u+exJ6rmh8yUFmfKBHdAj4H83ecKkj0O7VwU0KDLxAiCGJIyfJZKP5hx4phR?=
 =?us-ascii?Q?0fuYDEalMtVqktIqE4dps7LzaL4j0ZRYWpbHgLDGe2oIEykmVJ2RehX8yIaJ?=
 =?us-ascii?Q?pgja1mOXPjXrUpNxt/ClVIyPqIpCsLwh/Ky+gRdKbhfyIjeR3era8fMVafaD?=
 =?us-ascii?Q?jFWPqOj5OHnXTZq6u4N0ap+wYH42RuaTM8zHkHAR2iE0lEjUAmgyduZP8tmD?=
 =?us-ascii?Q?G/s+Zb7k1nzun7QDKI6kDtszFU+OaSovyHxXVbvLfcoMp/KhSAHu4OJyV8Za?=
 =?us-ascii?Q?/DWO09G95MJDnKkDU5oZ19vTvn2FnIWLroTQshARhWWuq/OjSKA69BQIvh97?=
 =?us-ascii?Q?Di3V0wG0AGfC/mv93cjJMOxXQ8+PVFqxxpD4eb8FQjx9+1P8YZpDc+96rPV8?=
 =?us-ascii?Q?TqkuCm69VLwg6tHnuL92BUnzPz5kqRYBnD8GRZYKlZjC8O+daIWSqfJDp2O8?=
 =?us-ascii?Q?5ZVzheACXmn9B+8N+tdMjKSAC8CbVaA+o7ChgQYR/qdCUrfrwiTFsvskhZSO?=
 =?us-ascii?Q?lcTozBW1udxY60fFPz6DqrEWrvfyxnT67lNgEZywT0XVRFPqb9tdzdHK7j75?=
 =?us-ascii?Q?tLDIWFCRBkY9dzg5cYBLoqfn98r08l7hZg/gG2VZUiifu1spzHcGZeTr7uFs?=
 =?us-ascii?Q?Bk4BSnZtsOhJH0E/Yo0bPglSstDgW5QF0RixPgj8mgNqVBAf+gLiChCtPym5?=
 =?us-ascii?Q?qPOkN66og6UoS3RqbO+xsCC+t/PLUWNaRQZD/H/L5oLZvg/nwFbTDIfPiVGc?=
 =?us-ascii?Q?SzZ3otB6xrG6p1VJmecF1CJC8R98q6NldVykBcJgUDqR51s0ig0rd5+VI/DO?=
 =?us-ascii?Q?FCSKWUzkp66gPwNXE2ofizDZxjyjakSSJJIwPfpIheLj+GWBrVzFQUDUR5Sm?=
 =?us-ascii?Q?EgoWQDUZiJpt4e91Vo7Qmsu5lEAL2JjTwZk0KZJPZduXducMwZ0GcJqD5Vy+?=
 =?us-ascii?Q?Z8nepYZR7cNtzdcahWjp2l38UJIVvOv4C36t/6qrB0YJYCDiRay2kHx0JDi6?=
 =?us-ascii?Q?NWXoQasqur4kTu0Mhw47fdPr3p8jLpBBWFddBjCME2FmHNjtPALTZSDgCO0G?=
 =?us-ascii?Q?DkiRJVa3mCJ+1W6+BfTXHVq4uDHZSLcZdUjm6lRS5mfRF+l1EJlbHQiPsh2J?=
 =?us-ascii?Q?FJE9vHW69e4JjDfyB3vuxqAHBJXkteuMBJPDbcem0lNZsXw7TGbjq0qs6Les?=
 =?us-ascii?Q?5NQ+xY6p6KQ+bgKzI2WuulpoXBjebOCDMI4U1DsyfWmtMfgcHCvGWGhAD63+?=
 =?us-ascii?Q?oZcXh6fwcruzA53ftsP3kEwGSL3nSOJUGZ3gHYBRgnYfgXOZi1wYmNSyBzBz?=
 =?us-ascii?Q?pzftRlAdXGX9StqyOiPX7+bAK8rQJLLMLvdSMGpnjAN6l9P5fpgcsR65fAU1?=
 =?us-ascii?Q?g1x0TNGJQWNriUohCwY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?swqd6e6cUNsqQbSB51c3nezni89PHx0QI4m+HNLuxGJlbPyp6fqnKFovYOT6?=
 =?us-ascii?Q?8KrKcrk8LzUSEkVM3FQWAp5UMqIJaojhny5YTKSLogHN0IbVgyJAoOUOQiOL?=
 =?us-ascii?Q?osdi2gK7DXaq0qsU2WTcKUKsL5pLb/FT+2ch9owfbEcEEmzYCGYctFdVlQGQ?=
 =?us-ascii?Q?IZuS+Yyxvi6yVkJYWTz+/0pX0Rvv+U1eXC1eggipbhzbcygM9R0kdGtjNltL?=
 =?us-ascii?Q?zTlgxqPCtb6CsPXeyYKFNiwiX0/7yUF3vl69aRonjfeqEOeeEUfg+ANo1sTa?=
 =?us-ascii?Q?t5UQIjhkUVIVdELC/ryGqGoretLJgvVOc0A24UJJdb4I5/Md2Dbh+MQzma+U?=
 =?us-ascii?Q?0ah72ndZIpRiNNZuY8+OZbSMHxwbG48maGSM+qpqemVDSwATgz0s+G3n5Sq0?=
 =?us-ascii?Q?av9SAdmciPSW3I8sLqkHBbNaM1NUkJual4nK/f1qQKcJZaAe6ZJEiN1FPN0C?=
 =?us-ascii?Q?tmmYqPf9JiVhpXIPPqgBv1wgDmACeeoyr1gL197qYuv7gMSzoGUYUPgu6GXW?=
 =?us-ascii?Q?c6+bXWAFh2lHD5JOjQoXr3x/kjn6dPq3VpwWlsb/yKGD95gSZyoTk9yUMotS?=
 =?us-ascii?Q?nSLVX72xSrteZe3D5Me98wQnhkx0ItDIfImoXS65K8wwlV5eC+gf3sFSz6OY?=
 =?us-ascii?Q?SDWJR9ifv6Lk4bcmK0Rw2GwQvVzDdungzOau6xwRnKp40TWRYqH3oLC4FFio?=
 =?us-ascii?Q?2KZp0aml5Lkp3qAk8chnjeXgUTcJlgXBGNO9I1huCLYelHkbBQM1CpkPxcN6?=
 =?us-ascii?Q?Kdk63QulO92LOPzIQhOGlxjb/YOZIiWnT2sTAmXNnji/MkrckXN9rSWW1o9N?=
 =?us-ascii?Q?m+WycTUt+RromOZ8GMgoT0y5aJUprxkZOZhKk1lsSZ+QSf36EIVGbeHwGMzj?=
 =?us-ascii?Q?xUmWQusApGIlALSlNv/bpnTmclnf8CtnTdluW/XLyVACF8WzVCCrDX5kKLUc?=
 =?us-ascii?Q?qeqmnImS6F8VEIX8eepqBbifY/97Bc8lml8sT5BPJPsc2HNHv19TdyWBSQ5w?=
 =?us-ascii?Q?n1Lm6rlwyxImxo8xLUfh6fRTbWG+NJB0la0Y4ExwhVpz41LcTsgt9DaG9gXl?=
 =?us-ascii?Q?J3YFunyxIAPRdtEPqumJjJJG4CfUmmSWlZbb+lW4H14JlbuEMEDu+v+kIg2K?=
 =?us-ascii?Q?14aLz69n8IWSE6m9TTzqaZsAC7DQVaHEUlSOc6LNYHiVvSh1ofE61ST8Gcgz?=
 =?us-ascii?Q?Ehb7cYpsPONdu7XLcQXzkfgtqpNbwK5EC6tMyJSYRahTZBhmpo7V8CUfmSH4?=
 =?us-ascii?Q?kiGPm0jME+BP5prfIEU1SKlPhwf+/Yj0CfrMXNn4Ckoa6AqYNi/3cVHGFAZV?=
 =?us-ascii?Q?fwKTbV9LsjV/8ODBJDzulAONlJsMZ1scLbMI7KuimizYCuSbMFhDNdXjngf8?=
 =?us-ascii?Q?m7fWfm5j9Fg5gZts0RkE0EPTyKKPOBPLVx06jR677FX8fro69w8qJqTALwfM?=
 =?us-ascii?Q?ZJ1761A3lpe8wa9/X03POwrY+XHVCO+gKU8aE8DZn9DbGvhs/48lMNuzND3v?=
 =?us-ascii?Q?4n1vfjsRZAwRyu9mS8EHkqQU9vWPZK+X9VDdrWPnIQchRn5fkPRJ7KnMZwsY?=
 =?us-ascii?Q?xN3Uu2Zb08irkyfELbyUTJeJIy4iR37X/keBelo21w7WbUvxyS2SOVwLIh/j?=
 =?us-ascii?Q?LshSxUO+VHED0dTonk0W+XDLhA+PSJmkYdzO5qEAK8WZ0RoU/l8Ce4puvbQ5?=
 =?us-ascii?Q?IHo/64lOWmEmb9qxWrJh8YV1l5o+l96yBmdnXnkQbuJFb8231A1s0K7AFbT1?=
 =?us-ascii?Q?66Gh7+IX1gL9bq+bKnaMPAWLz2a2+io=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c6bc4d5-088e-426e-df26-08de7294f510
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 04:35:22.6528 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y0gfgSHgA+ht6vdLAwjufJviK6TlGBoxWO3kRSN1tO17jWXErutOQ+6jTmDiGkcUlweH/XJnOcMzYaj84JwwIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4883
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

On Mon, Feb 23, 2026 at 09:37:28AM +0530, Varun Gupta wrote:
> Add a stats counter for invalid prefetch page faults to avoid
> excessive logging.
> 
> Originally-by: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Varun Gupta <varun.gupta@intel.com>
> 
> ---
> v3:
>  - New patch splitting stats counter from main prefetch implementation (Matt Brost)
>  - Renamed from PREFETCH_PAGEFAULT_COUNT to INVALID_PREFETCH_PAGEFAULT_COUNT (Matt Brost)
> ---
>  drivers/gpu/drm/xe/xe_gt_stats.c       | 1 +
>  drivers/gpu/drm/xe/xe_gt_stats_types.h | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_stats.c b/drivers/gpu/drm/xe/xe_gt_stats.c
> index 8ed0160a6041..81cec441b449 100644
> --- a/drivers/gpu/drm/xe/xe_gt_stats.c
> +++ b/drivers/gpu/drm/xe/xe_gt_stats.c
> @@ -60,6 +60,7 @@ static const char *const stat_description[__XE_GT_STATS_NUM_IDS] = {
>  	DEF_STAT_STR(SVM_TLB_INVAL_US, "svm_tlb_inval_us"),
>  	DEF_STAT_STR(VMA_PAGEFAULT_COUNT, "vma_pagefault_count"),
>  	DEF_STAT_STR(VMA_PAGEFAULT_KB, "vma_pagefault_kb"),
> +	DEF_STAT_STR(INVALID_PREFETCH_PAGEFAULT_COUNT, "invalid_prefetch_pagefault_count"),
>  	DEF_STAT_STR(SVM_4K_PAGEFAULT_COUNT, "svm_4K_pagefault_count"),
>  	DEF_STAT_STR(SVM_64K_PAGEFAULT_COUNT, "svm_64K_pagefault_count"),
>  	DEF_STAT_STR(SVM_2M_PAGEFAULT_COUNT, "svm_2M_pagefault_count"),
> diff --git a/drivers/gpu/drm/xe/xe_gt_stats_types.h b/drivers/gpu/drm/xe/xe_gt_stats_types.h
> index 79568591bd67..b6081c312474 100644
> --- a/drivers/gpu/drm/xe/xe_gt_stats_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_stats_types.h
> @@ -15,6 +15,7 @@ enum xe_gt_stats_id {
>  	XE_GT_STATS_ID_SVM_TLB_INVAL_US,
>  	XE_GT_STATS_ID_VMA_PAGEFAULT_COUNT,
>  	XE_GT_STATS_ID_VMA_PAGEFAULT_KB,
> +	XE_GT_STATS_ID_INVALID_PREFETCH_PAGEFAULT_COUNT,
>  	XE_GT_STATS_ID_SVM_4K_PAGEFAULT_COUNT,
>  	XE_GT_STATS_ID_SVM_64K_PAGEFAULT_COUNT,
>  	XE_GT_STATS_ID_SVM_2M_PAGEFAULT_COUNT,
> -- 
> 2.43.0
> 
