Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3324DC77B7F
	for <intel-xe@archiver.kernel.org>; Thu, 26 Jun 2025 03:19:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B477910E259;
	Thu, 26 Jun 2025 03:19:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CRy7MD8E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89DD210E259
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Jun 2025 03:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750907952; x=1782443952;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=OsmBU7C/zdPdmZCqWktZDmCHzgyCu+H9bi1eGjLGx9k=;
 b=CRy7MD8EzpfJMwg6b+X0nU7HuiLYJdwqR9S1ymwK98Z0VpQC7i5GTaB9
 57SpEG61OARyPjRi/gfe9UcQHCt1+QncQTpcSD4lLy2N8kZhXKDuaZD6G
 j18Bxya4EhMQcPqaDKBvT3521FAWRQPAmnoKj3uwv4Wjvf//fI/fatguG
 JQpj2hoNItOoFzRFDLAJJhdgog86dVtAgnmjKx/Pu2c/sNcWlz9RWbyLE
 Ulkz72AFwCjvCZPGAg8iByXZiKHd/IjwqdSUO2+p55LCniv0stT2jhvdH
 tozcyPLufeGIp+62bJZch45JRasjTIgiYpclW5r3A255IQPxMSnDoe/Gn w==;
X-CSE-ConnectionGUID: WxumfZ0iSuiTf8TnwdeEMg==
X-CSE-MsgGUID: ek0gWOskT8uk+69ErEKIzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="63451105"
X-IronPort-AV: E=Sophos;i="6.16,266,1744095600"; d="scan'208";a="63451105"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 20:19:08 -0700
X-CSE-ConnectionGUID: PbKLHCcNSe+t/XlrAB9N+A==
X-CSE-MsgGUID: wNqJvl9LTH69CWLIiyIqeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,266,1744095600"; d="scan'208";a="156784631"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 20:19:05 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 20:19:04 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 25 Jun 2025 20:19:04 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.70) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 20:19:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W49kD59Osu2vkWq7k5lMhJJIgqkYmHK/SfSF9sc0Dba0Xj31pVpBdxhcWgAenBl9qN76tDnKLWg2B4HTJJvU6BzsAqEv16IRvdo99TxzowWrprOsJOIAnsMEgRcl7KkUOxalDBIveA2UiHKgy0tBG4sXb1QtswlpFMJVIOvjLaCzlAAFVMMo4ZugULu5heJG2p7T3qXpc80rfd+fuWAvjZopyGOXHVpq0YLlUF4kfQf8VsCwA2uJisbPMkfXaqYM0AKyYKfrG0I4vLW3mF7slRcwWKob5FPy7OEgoY/6Kj7uNDihVKXMw1/r3OzoF24nxIiGyMswHwZDgkeMJzpG2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SlaRRHGzqGkJCSxKqq4q2JaiJsggjZF006bxRZO1rHY=;
 b=k5JumDQXn78P0V+duplD+huAltdWUW9MOqn0HOWf3HZUFwFPo59Va3hTRXNZE+lrCX+dcvnHb5wfk52dix2zG+dKf4NPHqBj2iHPp50BF+a5dLC21LTT66vIdEeq8vF22Ie5+n2Pna6UqMv43LvUwLAIIRSCzPI42gUAUK0v85jnVUJWF5WJYHZOW5lD+F7gGoTuM+RuQa5kqeJnHn0b8V5wA9DyfH3VUWHTny4TeMRYFJuth+05zlVPfjo4uen4MmJ4ijT8IBfd6NS7yyRKSVpv2p/w6nJAA3APYPsJE9Nq7iJKXcb8U9KxLAwP33r2iY7B751UH2msthhGLUazhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ2PR11MB8404.namprd11.prod.outlook.com (2603:10b6:a03:53f::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.30; Thu, 26 Jun
 2025 03:18:48 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8857.026; Thu, 26 Jun 2025
 03:18:48 +0000
Date: Wed, 25 Jun 2025 20:20:28 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [CI 1/2] drm/xe/guc: Enable extended CAT error reporting
Message-ID: <aFy8fLIMg3raxA/z@lstrano-desk.jf.intel.com>
References: <20250625205405.1653212-3-daniele.ceraolospurio@intel.com>
 <aFyMS/7ZBu+Gafm9@lstrano-desk.jf.intel.com>
 <1785c4a5-31db-4963-8f4e-4a693c740bd1@intel.com>
 <aFy8IhvCJG8ci6vR@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aFy8IhvCJG8ci6vR@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: BYAPR03CA0027.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::40) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ2PR11MB8404:EE_
X-MS-Office365-Filtering-Correlation-Id: 5590ce2d-46f1-4e19-c475-08ddb4602a86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jT1FwFGY5vkL0jo3mtzFhz3XxvR51lrmnxVqzer2ucXccx+Sp/oNdkQHwR9Y?=
 =?us-ascii?Q?i6PlCTzMOJwO1y0UjD7C7tQ3YUt334pjiyeh9LVo3byUqvLEVypNsj/KHfs5?=
 =?us-ascii?Q?VtdL12SY69HzxnlibumjqoxEU4fO+H5KLxO46c9yUhfr6JUfzTIgz3Dlz+lq?=
 =?us-ascii?Q?QlDmiv0jKUXDSo9JPNWjL+55TTVLi+8db95omQniUCpvY+tSh5HFK9m0K7qf?=
 =?us-ascii?Q?TBRW95np7YAroo2UfhpX8UlKG6jDpmOgSsfgWIvF1/K5RQE0/BLC8w8XwdZZ?=
 =?us-ascii?Q?VfcoruQWDFEfOXQhe9kQoNyhiprS75FTTaRAGtFKgEe+HuBuotM/T0ThQHwt?=
 =?us-ascii?Q?a9ihDGKPUCYNlPZNpvq2IFkr3Xl9rG5mRPUFhh6dFzc5IcEVhmFmXv7ns+Yp?=
 =?us-ascii?Q?pxNdEhq3qhe6x8qVIIaLS6iUBlkKqLueCZTmA1E5PBFCXLoZURAVCI8e1wMM?=
 =?us-ascii?Q?DT1/1g7TqfDZL8oqxo5suweGtoV7zK5cqoNLQNrRq0xu1GjP1xZoOhseR/wj?=
 =?us-ascii?Q?QJ4OkleCptuiu/6sETVn+IrY6ARLX+L+J0fSFR/429FT6WhsrI1p3VEVWuAS?=
 =?us-ascii?Q?qG29qzFz5XgBbEqF6xqGFhUPQYqvp+Nvfiw3KujIFQqMr/5Q5QZqA8BxGPa4?=
 =?us-ascii?Q?L3opw69wfMIyKnjTJtadg6aW+qSzImc3Fr2O3UlwX5qS202KjrDw0+WhOU+A?=
 =?us-ascii?Q?MSFfIwrLwm51I2ehX8zpp9SCkYaRmq69y1lRFb+ryLfFg+TR8NEWEEtkw4XA?=
 =?us-ascii?Q?BKgTV3cps8+x3Pu2Id0+hURHRY3I3EGXwfF0wX/sJfFJBdBM+/hn6iyHOj5E?=
 =?us-ascii?Q?y4mD+8NMk3OqLKa+rUW1CVWjDifQ1DD+Q5ukPMN4pplD65f1Ap1JshVsmUvN?=
 =?us-ascii?Q?6ovfScVaxrlC3pxOX9Frjfh1FaNHQh3S0JzMQArFR6pJ35uO3uhxGy9MtF7X?=
 =?us-ascii?Q?vk5Vp0A6Q4eDAprnATCBBjabku0L522y1xn9qIPGILxVsUSp9QAGBHojFnPO?=
 =?us-ascii?Q?vurQqG7+arbSjUczqVjh3+uoZbI5EB9B8xte/dIm4ri1hJ7lAnITqahJbZzS?=
 =?us-ascii?Q?widjRlnrqOr2rjtoZMgtKmCH4ehlEVaeEJCovaCEREBbrl8e9nLOl1hKqbXl?=
 =?us-ascii?Q?Vw0LvQve417ESXQuIIszaTNvDkm/oZngsD0RcIvP+M0oYZR9I+giP28PnVKx?=
 =?us-ascii?Q?23ZF52sp8f5K4Dxbzn7fYXbHVjOEnXtImsNmuaoswVQUjcfwhX/igLU8UMkg?=
 =?us-ascii?Q?ebLq76YCtHEJOHjBtVRwV5bRkDwUHuZL03fiEJEHu3yuSZOTdNGS/3JlaXew?=
 =?us-ascii?Q?DuoLlTa1fUlL+unCw/Ifsu3OJAEPvhDuJLexlEu3dxcOmwXVgdS3q4L1mkGF?=
 =?us-ascii?Q?Gc24T2ueaGfn72hygHhLW/IA/W1saquR2xbCYIyQMkBV5DIYE3KdAQgPKhwt?=
 =?us-ascii?Q?MphxcTF+Dkw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hJ7aJxsIGWKijeRyGsgF2sVbsN4aALstC54B1KzErPz7WXhjahqDtRW96ewz?=
 =?us-ascii?Q?/QzlKznrdeQy40hCoNTIYRR1T5Ta0lm0D9KileQwJ1MC51K75PjvKrLfy7vw?=
 =?us-ascii?Q?K0Roxe36JCqUuGe7Kcvq8bDiA7flcnMa6qZNx2wVLXuJhIG/huhggPjspDqA?=
 =?us-ascii?Q?l7JwxE18KBqznshC8x/SX/qHh6ayEqD5ybwaWmnCCbVYGy7LaHziiKm6G/ti?=
 =?us-ascii?Q?EFkeEqDHsF+xQnqBrPp9dxQlu/mNcwp9wiypBsWyWjO/AalacTWTWqWORKyT?=
 =?us-ascii?Q?lC9Xa508lGJPcpYz7TuEYT8CFgN1z8M4QzORppOoeZE748f0rL42BPCMxZQS?=
 =?us-ascii?Q?4E2n21pJpgcBPzHKCmm/mZmC1P23/1+7Fu+hoHkAn0OljggbJ3Est8H+CEPH?=
 =?us-ascii?Q?CdeXzVH3c+PCXyLZQIR6NWD0accqd2ZCpPMrirnu1z+7ROx/mlGztcf6K2lJ?=
 =?us-ascii?Q?xYb11xEhcYLnDdtw6ctSoDiTGRrwCHyanp64izNr+V8u4DWHpbVEn+iNuj+V?=
 =?us-ascii?Q?qbG3FJWDmvKIJbmCs3XDD3NZi7TuJDmnSFVxmwdqbxvDtqffIA1zB0EX/95G?=
 =?us-ascii?Q?dgIciSzby5vpZOzzMo3nPTwD2GVnUQB6Me+4gPfZ5+u7XDDtGPVs6ftu2GrT?=
 =?us-ascii?Q?k80AnD0QIQmb/hNwYXbwva3OB5HXlAB71IdzLcUrOFtxl30AE3ibGKS9VOHc?=
 =?us-ascii?Q?2HQo65hF42dBEvMWk2aOrPJGQogLTiqD+Y+eormLO01b+7wfwhQCYvmK19e2?=
 =?us-ascii?Q?/FO1HS4IeQ3+o2NRiiAK6bhAwWgsmhsoAGk4l7ep9OUA43BHmi5PDPGA7/Wp?=
 =?us-ascii?Q?ABgNk08TROxyEddvycrqdip1E36k4KT7zFkXJkBZMvQPOmGxUN6g/0okX6P0?=
 =?us-ascii?Q?trXRJk4G6zKk7Yls2QjzJLN5TjwYGcFwwlUdIfAxpdUl98f8idPmFRyYHyEO?=
 =?us-ascii?Q?VcBoIJQXBxkQzcA/XYFF1wk3Zwbeib7nuuzkXOgzFcxdHiN44Th0fqGmYxrt?=
 =?us-ascii?Q?j8caQ7wqKgyUof7y2KfeDujzvZRBfCgSRdh8hI8mipX8JvCg5R7Sd7muIr59?=
 =?us-ascii?Q?XASB8yihn+5GfhbN+yxU3pNu31kF4hNUA/DjIQmKGSLOC795ZMEe8e590eWk?=
 =?us-ascii?Q?tx3TRcGudcpO22pxTG4Sjtvecad/AeZJTeF8l5RSzU0XYlhEzCgjoxPd/OCw?=
 =?us-ascii?Q?d5C/Qd2oqWep6lx2YzFyNYFfB/xD28HV1rcWrR4UNCoOamzisbnG4CINgSda?=
 =?us-ascii?Q?rFNXhaZ812Li88RaH3cX+TCjQkuqyYuDJ/3CvVqSn6VMa/U6stRRIkEWYHJv?=
 =?us-ascii?Q?uATWfrNxZyHTra6RBjG8pKAfpTXspIIX6CEpGiITqHiFKl1pNU4+pSTof8Gb?=
 =?us-ascii?Q?SXeUPd4HWNt7HW7LLK2Oi0iUFEugNS1yAEvPaOq95lX5lxRUGY5NP5yJ0K9X?=
 =?us-ascii?Q?GE72wWdZN1uGvtnpeWp2gWfkPJv/qooRGM+wSvKl96v19NJDd5cxayJu1eyB?=
 =?us-ascii?Q?ZXanMERWxKAxqn6iN24+MT+eCbaW4HuoVG6HmDUQhEa6fD/GjJ3CSPa8Qgtm?=
 =?us-ascii?Q?EMFW8XKXKqf/gTMQMDI0tnM1ypcyR0g8ktqrzeuk7xIqfGN5JbcXz/B+9XyG?=
 =?us-ascii?Q?OQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5590ce2d-46f1-4e19-c475-08ddb4602a86
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 03:18:48.1460 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eLskA2JRHqvIJTabTZ3TurDtfi+ICkAjoI/qiNiWeLAt8Iom955/az/o8aLmPtyN1NdvIvMKwNAF1nGbb4aRCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8404
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

On Wed, Jun 25, 2025 at 08:18:58PM -0700, Matthew Brost wrote:
> On Wed, Jun 25, 2025 at 05:05:59PM -0700, Daniele Ceraolo Spurio wrote:
> > 
> > 
> > On 6/25/2025 4:54 PM, Matthew Brost wrote:
> > > On Wed, Jun 25, 2025 at 01:54:06PM -0700, Daniele Ceraolo Spurio wrote:
> > > > On newer HW (Xe2 onwards + PVC) it is possible to get extra information
> > > > when a CAT error occurs, specifically a dword reporting the error type.
> > > > To enable this extra reporting, we need to opt-in with the GuC, which is
> > > > done via a specific per-VF feature opt-in H2G.
> > > > 
> > > > On platforms where the HW does not support the extra reporting, the GuC
> > > > will set the type to 0xdeadbeef, so we can keep the code simple and
> > > > opt-in to the feature on every platform and then just discard the data
> > > > if it is invalid.
> > > > 
> > > > Note that on native/PF we're guaranteed that the opt in is available
> > > > because we don't support any GuC old enough to not have it, but if we're
> > > > a VF we might be running on a non-XE PF with an older GuC, so we need to
> > > > handle that case. We can re-use the invalid type above to handle this
> > > > scenario the same way as if the feature was not supported in HW.
> > > > 
> > > > Given that this patch is the first user of the guc_buf_cache on native
> > > > and VF, it also extends that feature to non-PF use-cases.
> > > > 
> > > > v2: simpler print for the error type (John), rebase
> > > > v3: use guc_buf_cache instead of new alloc, simpler doc (Michal)
> > > > 
> > > > Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> > > > Cc: Nirmoy Das <nirmoy.das@intel.com>
> > > > Cc: John Harrison <John.C.Harrison@Intel.com>
> > > > Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > > > Reviewed-by: Nirmoy Das <nirmoy.das@intel.com> #v1
> > > > Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > > > Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
> > > > ---
> > > >   drivers/gpu/drm/xe/abi/guc_actions_abi.h |  4 ++
> > > >   drivers/gpu/drm/xe/abi/guc_klvs_abi.h    | 15 +++++++
> > > >   drivers/gpu/drm/xe/xe_guc.c              | 56 ++++++++++++++++++++++++
> > > >   drivers/gpu/drm/xe/xe_guc.h              |  1 +
> > > >   drivers/gpu/drm/xe/xe_guc_submit.c       | 16 +++++--
> > > >   drivers/gpu/drm/xe/xe_uc.c               |  4 ++
> > > >   6 files changed, 93 insertions(+), 3 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> > > > index ff4f412c28d8..81eb046aeebf 100644
> > > > --- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> > > > +++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> > > > @@ -142,6 +142,7 @@ enum xe_guc_action {
> > > >   	XE_GUC_ACTION_SET_ENG_UTIL_BUFF = 0x550A,
> > > >   	XE_GUC_ACTION_SET_DEVICE_ENGINE_ACTIVITY_BUFFER = 0x550C,
> > > >   	XE_GUC_ACTION_SET_FUNCTION_ENGINE_ACTIVITY_BUFFER = 0x550D,
> > > > +	XE_GUC_ACTION_OPT_IN_FEATURE_KLV = 0x550E,
> > > >   	XE_GUC_ACTION_NOTIFY_MEMORY_CAT_ERROR = 0x6000,
> > > >   	XE_GUC_ACTION_REPORT_PAGE_FAULT_REQ_DESC = 0x6002,
> > > >   	XE_GUC_ACTION_PAGE_FAULT_RES_DESC = 0x6003,
> > > > @@ -271,4 +272,7 @@ enum xe_guc_g2g_type {
> > > >   #define XE_G2G_DEREGISTER_TILE	REG_GENMASK(15, 12)
> > > >   #define XE_G2G_DEREGISTER_TYPE	REG_GENMASK(11, 8)
> > > > +/* invalid type for XE_GUC_ACTION_NOTIFY_MEMORY_CAT_ERROR */
> > > > +#define XE_GUC_CAT_ERR_TYPE_INVALID 0xdeadbeef
> > > > +
> > > >   #endif
> > > > diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> > > > index 7de8f827281f..5b2502bec2dc 100644
> > > > --- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> > > > +++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> > > > @@ -16,6 +16,7 @@
> > > >    *  +===+=======+==============================================================+
> > > >    *  | 0 | 31:16 | **KEY** - KLV key identifier                                 |
> > > >    *  |   |       |   - `GuC Self Config KLVs`_                                  |
> > > > + *  |   |       |   - `GuC Opt In Feature KLVs`_                               |
> > > >    *  |   |       |   - `GuC VGT Policy KLVs`_                                   |
> > > >    *  |   |       |   - `GuC VF Configuration KLVs`_                             |
> > > >    *  |   |       |                                                              |
> > > > @@ -124,6 +125,20 @@ enum  {
> > > >   	GUC_CONTEXT_POLICIES_KLV_NUM_IDS = 5,
> > > >   };
> > > > +/**
> > > > + * DOC: GuC Opt In Feature KLVs
> > > > + *
> > > > + * `GuC KLV`_ keys available for use with OPT_IN_FEATURE_KLV
> > > > + *
> > > > + *  _`GUC_KLV_OPT_IN_FEATURE_EXT_CAT_ERR_TYPE` : 0x4001
> > > > + *      Adds an extra dword to the XE_GUC_ACTION_NOTIFY_MEMORY_CAT_ERROR G2H
> > > > + *      containing the type of the CAT error. On HW that does not support
> > > > + *      reporting the CAT error type, the extra dword is set to 0xdeadbeef.
> > > > + */
> > > > +
> > > > +#define GUC_KLV_OPT_IN_FEATURE_EXT_CAT_ERR_TYPE_KEY 0x4001
> > > > +#define GUC_KLV_OPT_IN_FEATURE_EXT_CAT_ERR_TYPE_LEN 0u
> > > > +
> > > >   /**
> > > >    * DOC: GuC VGT Policy KLVs
> > > >    *
> > > > diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> > > > index 209e5d53c290..4a7c467ad669 100644
> > > > --- a/drivers/gpu/drm/xe/xe_guc.c
> > > > +++ b/drivers/gpu/drm/xe/xe_guc.c
> > > > @@ -29,6 +29,7 @@
> > > >   #include "xe_guc_db_mgr.h"
> > > >   #include "xe_guc_engine_activity.h"
> > > >   #include "xe_guc_hwconfig.h"
> > > > +#include "xe_guc_klv_helpers.h"
> > > >   #include "xe_guc_log.h"
> > > >   #include "xe_guc_pc.h"
> > > >   #include "xe_guc_relay.h"
> > > > @@ -570,6 +571,57 @@ static int guc_g2g_start(struct xe_guc *guc)
> > > >   	return err;
> > > >   }
> > > > +static int __guc_opt_in_features_enable(struct xe_guc *guc, u64 addr, u32 num_dwords)
> > > > +{
> > > > +	u32 action[] = {
> > > > +		XE_GUC_ACTION_OPT_IN_FEATURE_KLV,
> > > > +		lower_32_bits(addr),
> > > > +		upper_32_bits(addr),
> > > > +		num_dwords
> > > > +	};
> > > > +
> > > > +	return xe_guc_ct_send_block(&guc->ct, action, ARRAY_SIZE(action));
> > > > +}
> > > > +
> > > > +#define OPT_IN_MAX_DWORDS 16
> > > > +int xe_guc_opt_in_features_enable(struct xe_guc *guc)
> > > > +{
> > > > +	struct xe_device *xe = guc_to_xe(guc);
> > > > +	CLASS(xe_guc_buf, buf)(&guc->buf, OPT_IN_MAX_DWORDS);
> > > > +	u32 count = 0;
> > > > +	u32 *klvs;
> > > > +	int ret;
> > > > +
> > > > +	if (!xe_guc_buf_is_valid(buf))
> > > > +		return -ENOBUFS;
> > > > +
> > > > +	klvs = xe_guc_buf_cpu_ptr(buf);
> > > > +
> > > > +	/*
> > > > +	 * The extra CAT error type opt-in was added in GuC v70.17.0, which maps
> > > > +	 * to compatibility version v1.7.0.
> > > > +	 * Note that the GuC allows enabling this KLV even on platforms that do
> > > > +	 * not support the extra type; in such case the returned type variable
> > > > +	 * will be set to a known invalid value which we can check against.
> > > > +	 */
> > > > +	if (GUC_SUBMIT_VER(guc) >= MAKE_GUC_VER(1, 7, 0))
> > > > +		klvs[count++] = PREP_GUC_KLV_TAG(OPT_IN_FEATURE_EXT_CAT_ERR_TYPE);
> > > > +
> > > > +	if (count) {
> > > > +		xe_assert(xe, count <= OPT_IN_MAX_DWORDS);
> > > > +
> > > > +		ret = __guc_opt_in_features_enable(guc, xe_guc_buf_flush(buf), count);
> > > > +		if (ret < 0) {
> > > > +			xe_gt_err(guc_to_gt(guc),
> > > > +				  "failed to enable GuC opt-in features: %pe\n",
> > > > +				  ERR_PTR(ret));
> > > > +			return ret;
> > > > +		}
> > > > +	}
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +
> > > >   static void guc_fini_hw(void *arg)
> > > >   {
> > > >   	struct xe_guc *guc = arg;
> > > > @@ -767,6 +819,10 @@ int xe_guc_post_load_init(struct xe_guc *guc)
> > > >   	xe_guc_ads_populate_post_load(&guc->ads);
> > > > +	ret = xe_guc_opt_in_features_enable(guc);
> > > > +	if (ret)
> > > > +		return ret;
> > > > +
> > > >   	if (xe_guc_g2g_wanted(guc_to_xe(guc))) {
> > > >   		ret = guc_g2g_start(guc);
> > > >   		if (ret)
> > > > diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
> > > > index 58338be44558..4a66575f017d 100644
> > > > --- a/drivers/gpu/drm/xe/xe_guc.h
> > > > +++ b/drivers/gpu/drm/xe/xe_guc.h
> > > > @@ -33,6 +33,7 @@ int xe_guc_reset(struct xe_guc *guc);
> > > >   int xe_guc_upload(struct xe_guc *guc);
> > > >   int xe_guc_min_load_for_hwconfig(struct xe_guc *guc);
> > > >   int xe_guc_enable_communication(struct xe_guc *guc);
> > > > +int xe_guc_opt_in_features_enable(struct xe_guc *guc);
> > > >   int xe_guc_suspend(struct xe_guc *guc);
> > > >   void xe_guc_notify(struct xe_guc *guc);
> > > >   int xe_guc_auth_huc(struct xe_guc *guc, u32 rsa_addr);
> > > > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > index 26c6c71dc91a..32548c931615 100644
> > > > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > @@ -2103,12 +2103,16 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
> > > >   	struct xe_gt *gt = guc_to_gt(guc);
> > > >   	struct xe_exec_queue *q;
> > > >   	u32 guc_id;
> > > > +	u32 type = XE_GUC_CAT_ERR_TYPE_INVALID;
> > > > -	if (unlikely(len < 1))
> > > > +	if (unlikely(!len || len > 2))
> > > >   		return -EPROTO;
> > > >   	guc_id = msg[0];
> > > > +	if (len == 2)
> > > > +		type = msg[1];
> > > > +
> > > >   	if (guc_id == GUC_ID_UNKNOWN) {
> > > >   		/*
> > > >   		 * GuC uses GUC_ID_UNKNOWN if it can not map the CAT fault to any PF/VF
> > > > @@ -2122,8 +2126,14 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
> > > >   	if (unlikely(!q))
> > > >   		return -EPROTO;
> > > > -	xe_gt_dbg(gt, "Engine memory cat error: engine_class=%s, logical_mask: 0x%x, guc_id=%d",
> > > > -		  xe_hw_engine_class_to_str(q->class), q->logical_mask, guc_id);
> > > > +	if (type != XE_GUC_CAT_ERR_TYPE_INVALID)
> > > > +		xe_gt_dbg(gt,
> > > > +			  "Engine memory CAT error [%u]: class=%s, logical_mask: 0x%x, guc_id=%d",
> > > > +			  type, xe_hw_engine_class_to_str(q->class), q->logical_mask, guc_id);
> > > Do we define the type anywhere - I only see XE_GUC_CAT_ERR_TYPE_INVALID.
> > > 
> > > It would be useful if we had this defined somewhere in KMD headers or
> > > even more useful if type was accompanied by a string description.
> > 
> > The type is HW-defined, the GuC just forwards it. AFAICT the values are not
> > guaranteed to be the same across platforms (the Xe and Xe2 lists are
> > different, see bspec 54047 and 72187), so I don't think we want to maintain
> > a list in the driver.
> > 
> 
> Maybe throw a comment a comment in here for bspec links when merging?
> 

s/bspec links/bspec refs/

Matt

> Matt
> 
> > Daniele
> > 
> > > 
> > > Matt
> > > > +	else
> > > > +		xe_gt_dbg(gt,
> > > > +			  "Engine memory CAT error: class=%s, logical_mask: 0x%x, guc_id=%d",
> > > > +			  xe_hw_engine_class_to_str(q->class), q->logical_mask, guc_id);
> > > >   	trace_xe_exec_queue_memory_cat_error(q);
> > > > diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> > > > index 3a8751a8b92d..5c45b0f072a4 100644
> > > > --- a/drivers/gpu/drm/xe/xe_uc.c
> > > > +++ b/drivers/gpu/drm/xe/xe_uc.c
> > > > @@ -165,6 +165,10 @@ static int vf_uc_init_hw(struct xe_uc *uc)
> > > >   	uc->guc.submission_state.enabled = true;
> > > > +	err = xe_guc_opt_in_features_enable(&uc->guc);
> > > > +	if (err)
> > > > +		return err;
> > > > +
> > > >   	err = xe_gt_record_default_lrcs(uc_to_gt(uc));
> > > >   	if (err)
> > > >   		return err;
> > > > -- 
> > > > 2.43.0
> > > > 
> > 
