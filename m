Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48D24C3DA4A
	for <intel-xe@archiver.kernel.org>; Mon, 19 Aug 2024 20:51:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07E7310E373;
	Mon, 19 Aug 2024 20:51:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FRyt2PSJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CE2E10E372
 for <intel-xe@lists.freedesktop.org>; Mon, 19 Aug 2024 20:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724100700; x=1755636700;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=jE2ORwqpJFQ3UCaKqEKOCkJokPQJvXVfgmXEIH5Xgys=;
 b=FRyt2PSJA2TJAwAoqa8fgEBRI7TwPEi3q3Adnmh9d7an8UxcNK7H7CvW
 4ScLzDR4FMIewj884FGNRBUldGh2bWTcMIUbGVCgrwiAyeuICef3alieW
 24aHSEqKJEqw2ULKXBbP9y2pHU4Ea0Gbe/nywgYH9H0GZVaCmSyl1wUYm
 vT/2ZOum6qUFXLvmxZd7UZm3Xhms7ZCOgtR3O/GjxFInCzF2YCmjoFZep
 o+LKHcUOv7s81fCcTMPSI6smxuHU2uG36TyhyOz5bEQY2wDLFLKaX8gQi
 qmigtfhIDBVBuJeQXkK6HeIEY2FlBe+sqi8tmtZYo3oQb5NjSZl7aYZ+s w==;
X-CSE-ConnectionGUID: YNI+hVP+Rje6DsF16J+GxQ==
X-CSE-MsgGUID: W7BJo/mNQt2hBJjeGYd0TQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="21993463"
X-IronPort-AV: E=Sophos;i="6.10,160,1719903600"; d="scan'208";a="21993463"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 13:51:40 -0700
X-CSE-ConnectionGUID: TU4LYMyDSW+HbNTqfby1Ew==
X-CSE-MsgGUID: NulRhsRjTf2TO+CP+5Y2WQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,160,1719903600"; d="scan'208";a="60544560"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Aug 2024 13:51:40 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 19 Aug 2024 13:51:39 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 19 Aug 2024 13:51:38 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 19 Aug 2024 13:51:38 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.177)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 19 Aug 2024 13:51:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dbr8ZUFDcXWIpCLvCUKzhuUQTtVGW6fTNnoulyBysLU9eO2o9uddPeV88gaSGKH826NgGuqvS8DEcfVZiYRdM4ONzJcjFw+7GWIkpPfoje4Br9vnoWGoiNqk+9LZae5YfJq04TSioZx8tt25uuE3qd8uk7kQsof9szpe+HVvW9gvgjY9zi7uy+pdvH8IF4dXPDoEp/A8T/kCI0TDdNKYk0GxXk+lrlagQ96lJuEW+WvYpQ5Pu3Q9L/4rleO4Gi4n7SdifXwXbec4ouLOWBZ0rJLJiUYi7I0pkt5jAug/2TMXicRCRvhnnYp9ywEr0taDg/JclFrkwfNmLCcAO0vzhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wZ0xrkMlXPwUimQKBpAY2RFA0yXGkIn2YmXI1A6vMxM=;
 b=org+CwVqW6nPeowedbYBwno6IThRbFTemeW8wTEQzDk7Bh6LB0ztAZA/+zd9T9cgzEjnwylJqkecOxFGMfMDIFFwvhtTvcvIcwxsb71P+fGbHYWCo01Eb5IIcdmpSFcsLBdzYh2XKsG1xam8x6mtNElL2AAu0iXmGRyCacoT2RoP0pouRG1UQoZX+l2vl39mUSpFSanX1FgVDDm0MtT1WGI0Rg2zesx0Kgk+peL6hNA1N+PfvPoKn6kmYgPrKxICyw7DOtfzSH/XwLF0OiJ1PgvnoUAyxZYOC7zf98O1kpPSlhsMlpqwOpw6Vs6dCvIMcnLNMwmphG5ZjVcrXSNUzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by MW4PR11MB6887.namprd11.prod.outlook.com (2603:10b6:303:225::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 19 Aug
 2024 20:51:36 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7875.019; Mon, 19 Aug 2024
 20:51:35 +0000
Date: Mon, 19 Aug 2024 16:51:33 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <lucas.demarchi@intel.com>,
 <jose.souza@intel.com>, Matthew Brost <matthew.brost@intel.com>, "Himal
 Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH 02/12] drm/xe: Introduce GGTT documentation
Message-ID: <ZsOwVVyeEnbUZT0t@intel.com>
References: <20240817103556.163783-1-rodrigo.vivi@intel.com>
 <20240817103556.163783-2-rodrigo.vivi@intel.com>
 <3081852b-bfc0-416b-bb6c-18c8149ab2b9@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <3081852b-bfc0-416b-bb6c-18c8149ab2b9@intel.com>
X-ClientProxiedBy: SJ0PR13CA0134.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::19) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|MW4PR11MB6887:EE_
X-MS-Office365-Filtering-Correlation-Id: 47a7bd9d-2cad-4d37-f594-08dcc090b6e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?LKjqliT0YtiasHZ7CSoLgeElEZh7gHJ+P6ODo0oUy5KRLDUhaMHeotsfDXjK?=
 =?us-ascii?Q?T7QmxjbFwnzCBeYYqJ80lxd4MF37771+vliv/F6RfhFguDvxOLg0mxN0L3eI?=
 =?us-ascii?Q?GeZYLR+jo9v6PsGFZP0JQJdwpx+sNftFEG/7Ier1q36nMUoh+Azjh8YYkKYn?=
 =?us-ascii?Q?evahtx74IOg7jZUPvH7SBWaQioygqVyM6Ikhs9LUaxHD1URNnv4sehM+Z6QK?=
 =?us-ascii?Q?KkvDrNwoerJqwl7bLo5tGxZjAy87AtmFHsZMQuCyn2uzCHxfM8p3IIOfuy/r?=
 =?us-ascii?Q?uP2FCausXgEc3D0qmOzvBQhxYSoNmCQWDa2ycpdPyt4KrDb3q+CIQJzZqWcQ?=
 =?us-ascii?Q?Fwe8MWNVz8VKMzxrsVZVg8rGtvGaJkUnPkcStd/WIMHQwLY6ARFVgYYVtcLu?=
 =?us-ascii?Q?GnDVCzetxeVZqdKh7HlS6hzU6NnEn8bKdfcquxpy0AcGHBM/s3YU/0Aq+iAU?=
 =?us-ascii?Q?/rJPKDBKxY8WRhICQTPhveR5Hr1FZ9/3wrsvqVqZxOjMhaq40UXv1sRhjkzH?=
 =?us-ascii?Q?M6RhoESEtlW8pyUMUZt6EGLzy44NVq8VB4BfRmG7zrSWWGBuBVpm8cPJN1vJ?=
 =?us-ascii?Q?acrIj8hU61oBPoiSFwEwQ5HyTj/ke5xYjN47AesABLbPCNXc1lExBVc1VRUA?=
 =?us-ascii?Q?VGYGY21Qm3B8F+cpPqDxnXruU7Fh/9gdajIYxLSTHw9LRbqP/Y2zXRGYhZDn?=
 =?us-ascii?Q?SBllMW3KTRn+UxQTLJHg73+c68/jruFFifDmxKFi2MgKj5M242445wLakZvw?=
 =?us-ascii?Q?w9hZPk80CxY03APYewmgTYYqwjRyyT0rK6tW3hehexPwQ1+8rl8E5zxnIR4q?=
 =?us-ascii?Q?ztxFv4+89p/uwUrP/IEIUU04TOkiJJDMLc9QA7MXQqAu5ImrcDjIKF3zmDXm?=
 =?us-ascii?Q?sDlMEEaWjInkT+rN9cEwwBiQ+aEkAvVLYjlF6AYg6hgn4A4wyUlwsROI+Ccn?=
 =?us-ascii?Q?0EWOXOJtNDNjfwez5yx3eN9z8hDaM/c1SGjw8HmvAeasjqSUTEwnNYy36jam?=
 =?us-ascii?Q?wdyPaMD4NBg5HSLpPjoseHvbJ+d3ifkPicCzloXNVqTG5uvfs5ZkzRIiU3og?=
 =?us-ascii?Q?3EEFMmZiHnPMIMK7lpu46o0DVDQsVkYiic1P+SJg54rSeqKPoXIOj7QWX4zo?=
 =?us-ascii?Q?bmV8bjASyt7MPp3pqnyDfICuQUDimWHEUA3twplcbWn7uecD0Vl9tywG+BA8?=
 =?us-ascii?Q?qKL/nNJ5dzyMWKOPOE8qdHOb6AqmoexZoX+3ozhOlD8Ld8ZB48mh5wF0OpRC?=
 =?us-ascii?Q?VFJ70a2/r1T9HLR93gL9/TS6kVv5ZBv8SAARhfeNGf34ReIdCVWG7Aab1198?=
 =?us-ascii?Q?Myv70TOviqbokYEp9c4Lip3mLpC0rtbIZm6uVCD0LVHU/Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?B8MmraD5Hu7DuUAoD7AzdahmvHC1MeLEdv5GPiqg8dehxUV4eeYKeIJlEfNR?=
 =?us-ascii?Q?5u7fRA75A7AmmktXsDKJILzDTymW6rsKjBotPQaXLIg2HuaV9xGfXmIWKoFa?=
 =?us-ascii?Q?zx7yPKk88losyprs4eLs2SDFor38BWm1F+cxeGTlga98uw4OTViDC8Wm0+8g?=
 =?us-ascii?Q?wKlfsgyM+eX+Yfl1Szr1doJc0c2cYpxgPhNZ7KMIW8dFFxEjWZ/eJQBDQQYl?=
 =?us-ascii?Q?CKWI2cNlNPC2BT471W1ZTxSYrzv8dLwckqM9RJiDhsRIVu2nRFBwQtdbyi4t?=
 =?us-ascii?Q?O5qnVjXYGVb52+PQSG/JYJUaxq4sGBYOxGfyVe+7q/CtiBEnlTsDFMkvDtE0?=
 =?us-ascii?Q?luHvKCnHOQP0ERMV2+YQXI1sdR1M2cCeRRrGTO1DDMV9VpDdwCT1kiQdLoMH?=
 =?us-ascii?Q?HG1JxXs3QGghKGL+Nvg31rzV/t9DwkQGBAZq0O48X7+OgBi2Rct37h1uWYl6?=
 =?us-ascii?Q?k+7lzUhd6IeL+cTKw18DiMOhOwDYZcrSAdv37ajfdFyUE22K4ykylolUXU0l?=
 =?us-ascii?Q?QA5AmLCwtHzKPazgctyUQJ450SSrMKYjSiNRR/g0ULeuidZtETUox6Iu9jn5?=
 =?us-ascii?Q?/WpsMOcD8xKhtQpKyEpr5Y5xgOcoeFt3Y7MpDV/MtFPrMXfW1Gwi7SUOgvJS?=
 =?us-ascii?Q?42s77t+gNlC0mNH69u4utDI58/pQof9R5CtClHijXZuA7plJ/RIsI2IGzss+?=
 =?us-ascii?Q?23r0pxoja3hpzZJEh35LLP1jS8yAoKeN5XvLHdBj2kPowHpVD5NizcTRNkP3?=
 =?us-ascii?Q?5Od/IzTcfmdewdD3V2T9GFzqHK10T4YQiswZOnhHY2BagIFnbieX5kKWejjC?=
 =?us-ascii?Q?NrZv0ngvFuIRcO95YjCGQ18ZWpHCoYkthCH54MT45kbHQ+2qYNAROjbQFFqg?=
 =?us-ascii?Q?42H9VHWMxg26EVH6i0UdPX+OdgNIM5Y/3fmmyAUFLHJnNVeuLYyt2ynAdcuq?=
 =?us-ascii?Q?7EPQhQyPGtTl4hSkbr11gPb9azb1/kxatJSJbHIs43MjrjKWxCZJ+E7ytjDI?=
 =?us-ascii?Q?Lee5e58b4fZTy594ckjw+oc2ZYsUA2rQW2CH6+nZc4Ildpv9vS9+qP9azqVp?=
 =?us-ascii?Q?Z3BO/z3vk1PDvjeuGKw7QjxOkUcQL2WCPzPc/pdL6tmJHEDIvSLkVUOZe8jb?=
 =?us-ascii?Q?t69aqRGZ48wXNPXiNGBMAOqoMgO9Yok8KqIiMLfAaAO9/iQVXNRYbiOMYoUM?=
 =?us-ascii?Q?fFhRpWxsKKqKu+yd+hhPr7dItTKaLCsRusSEBfm6jO4VlhBZmIJk54I+Z1Mg?=
 =?us-ascii?Q?L5Gdl1fzyuGcUbbvHXYgvx85Um1B0cJ1LQOiwSTJn6AXHTdGzc/kxmeGzS8x?=
 =?us-ascii?Q?jJwRouAiEwJjLJQPQ7Igms2yRzsK0kSCUQMSERhypx1Ov6S1mAmWiv4OkY8G?=
 =?us-ascii?Q?aziBY31HTFbEVYfuauxsLINA4O6G3OnbOagQ3jYcpse/1m7Drb/19UMI89UK?=
 =?us-ascii?Q?GMkcX7IDbal3Hky9YKhILPhEvTkPzfLytjEzMngnUhLxtGG0oSXZGAE2LsEU?=
 =?us-ascii?Q?Fh4KlclSX9jupb3Ra/IysX3xZB+Q4bs7C0c/lU7JTz63rp4naDLZSQVtpLJC?=
 =?us-ascii?Q?jLX7BhXWNvuhlhEufPargr5YjUPyT+MdbRVvROtQ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 47a7bd9d-2cad-4d37-f594-08dcc090b6e4
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 20:51:35.9322 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gTJZvwoZbQoP0OriqNIZXkqm9HjQXn5Y7j3WwernkgTKGcwolDIkeMmiHYF+BVru6UDX4fCAOJJkWg570CjEFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6887
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

On Mon, Aug 19, 2024 at 09:04:24PM +0200, Michal Wajdeczko wrote:
> 
> 
> On 17.08.2024 12:35, Rodrigo Vivi wrote:
> > Document xe_ggtt and ensure it is part of the built kernel docs.
> > 
> > v2: - Accepted all Michal's suggestions
> >     - Rebased on top of new set_pte per platform/wa function pointer
> > v3: - Typos and other acronym fixes (Michal)
> > 
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com> #v1
> > Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > ---
> >  Documentation/gpu/xe/xe_mm.rst     |  15 ++++
> >  drivers/gpu/drm/xe/xe_ggtt.c       | 136 +++++++++++++++++++++++------
> >  drivers/gpu/drm/xe/xe_ggtt_types.h |  34 ++++++--
> >  3 files changed, 150 insertions(+), 35 deletions(-)
> > 
> > diff --git a/Documentation/gpu/xe/xe_mm.rst b/Documentation/gpu/xe/xe_mm.rst
> > index 6c8fd8b4a466..95864a4502dd 100644
> > --- a/Documentation/gpu/xe/xe_mm.rst
> > +++ b/Documentation/gpu/xe/xe_mm.rst
> > @@ -7,6 +7,21 @@ Memory Management
> >  .. kernel-doc:: drivers/gpu/drm/xe/xe_bo_doc.h
> >     :doc: Buffer Objects (BO)
> >  
> > +GGTT
> > +====
> > +
> > +.. kernel-doc:: drivers/gpu/drm/xe/xe_ggtt.c
> > +   :doc: Global Graphics Translation Table (GGTT)
> > +
> > +GGTT Internal API
> > +-----------------
> > +
> > +.. kernel-doc:: drivers/gpu/drm/xe/xe_ggtt_types.h
> > +   :internal:
> > +
> > +.. kernel-doc:: drivers/gpu/drm/xe/xe_ggtt.c
> > +   :internal:
> > +
> >  Pagetable building
> >  ==================
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> > index add14f3dea1f..dd5cd0df705c 100644
> > --- a/drivers/gpu/drm/xe/xe_ggtt.c
> > +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> > @@ -30,6 +30,39 @@
> >  #include "xe_wa.h"
> >  #include "xe_wopcm.h"
> >  
> > +/**
> > + * DOC: Global Graphics Translation Table (GGTT)
> > + *
> > + * Xe GGTT implements the support for a Global Virtual Address space that is used
> > + * for resources that are accessible to privileged (i.e. kernel-mode) processes,
> > + * and not tied to a specific user-level process. For example, the Graphics
> > + * micro-Controller (GuC) and Display Engine (if present) utilize this Global
> > + * address space.
> > + *
> > + * The Global GTT (GGTT) translates from the Global virtual address to a physical
> > + * address that can be accessed by HW. The GGTT is a flat, single-level table.
> > + *
> > + * Xe implements a simplified version of the GGTT specifically managing only a
> > + * certain range of it that goes from the Write Once Protected Content Memory (WOPCM)
> > + * Layout 
> 
> nit: I guess you wanted to link this with DOC in xe_wopcm.c but that
> doesn't work this way, you need to wrap title in `title`_
> 
> and maybe it's worth to drop the "Layout" from that title

I honestly didn't think about that. I know that we have a lot of documentation
to clean up and link and make a better format. At this time, my only goal was to
make this documentation as near the code as possible and as updated as possible
so whenever we get a clean up we don't have something like really updated like
xe_vm_doc.h, xe_migrate_doc.h, and xe_vm_doc.h

> 
> 
> > to a predefined GUC_GGTT_TOP. This approach avoids complications related to
> > + * the GuC (Graphics Microcontroller) hardware limitations. The GuC address space
> > + * is limited on both ends of the GGTT, because the GuC shim HW redirects
> > + * accesses to those addresses to other HW areas instead of going through the
> > + * GGTT. On the bottom end, the GuC can't access offsets below the WOPCM size,
> > + * while on the top side the limit is fixed at GUC_GGTT_TOP. To keep things
> > + * simple, instead of checking each object to see if they are accessed by GuC or
> > + * not, we just exclude those areas from the allocator. Additionally, to simplify
> > + * the driver load, we use the maximum WOPCM size in this logic instead of the
> > + * programmed one, so we don't need to wait until the actual size to be
> > + * programmed is determined (which requires FW fetch) before initializing the
> > + * GGTT. These simplifications might waste space in the GGTT (about 20-25 MBs
> > + * depending on the platform) but we can live with this. Another benefit of this
> > + * is the GuC bootrom can't access anything below the WOPCM max size so anything
> > + * the bootrom needs to access (e.g. a RSA key) needs to be placed in the GGTT
> > + * above the WOPCM max size. Starting the GGTT allocations above the WOPCM max
> > + * give us the correct placement for free.
> > + */
> > +
> >  static u64 xelp_ggtt_pte_encode_bo(struct xe_bo *bo, u64 bo_offset,
> >  				   u16 pat_index)
> >  {
> > @@ -164,12 +197,16 @@ static const struct xe_ggtt_pt_ops xelpg_pt_wa_ops = {
> >  	.ggtt_set_pte = xe_ggtt_set_pte_and_flush,
> >  };
> >  
> > -/*
> > - * Early GGTT initialization, which allows to create new mappings usable by the
> > - * GuC.
> > - * Mappings are not usable by the HW engines, as it doesn't have scratch /
> > +/**
> > + * xe_ggtt_init_early - Early GGTT initialization
> 
> I guess the correct doc format is to have () after function name:
> 
>  * xe_ggtt_init_early() - Early GGTT initialization

I believe both are acceptable. We just need to pick one...
Right now xe uses mostly without (). But we can adjust in a doc
clean-up series later indeed.

> 
> same for all function doc below
> 
> > + * @ggtt: the &xe_ggtt to be initialized
> > + *
> > + * It allows to create new mappings usable by the GuC.
> > + * Mappings are not usable by the HW engines, as it doesn't have scratch nor
> >   * initial clear done to it yet. That will happen in the regular, non-early
> > - * GGTT init.
> > + * GGTT initialization.
> > + *
> > + * Return: 0 on success or a negative error code on failure.
> >   */
> >  int xe_ggtt_init_early(struct xe_ggtt *ggtt)
> >  {
> > @@ -194,29 +231,6 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
> >  	if (IS_DGFX(xe) && xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K)
> >  		ggtt->flags |= XE_GGTT_FLAGS_64K;
> >  
> > -	/*
> > -	 * 8B per entry, each points to a 4KB page.
> > -	 *
> > -	 * The GuC address space is limited on both ends of the GGTT, because
> > -	 * the GuC shim HW redirects accesses to those addresses to other HW
> > -	 * areas instead of going through the GGTT. On the bottom end, the GuC
> > -	 * can't access offsets below the WOPCM size, while on the top side the
> > -	 * limit is fixed at GUC_GGTT_TOP. To keep things simple, instead of
> > -	 * checking each object to see if they are accessed by GuC or not, we
> > -	 * just exclude those areas from the allocator. Additionally, to
> > -	 * simplify the driver load, we use the maximum WOPCM size in this logic
> > -	 * instead of the programmed one, so we don't need to wait until the
> > -	 * actual size to be programmed is determined (which requires FW fetch)
> > -	 * before initializing the GGTT. These simplifications might waste space
> > -	 * in the GGTT (about 20-25 MBs depending on the platform) but we can
> > -	 * live with this.
> > -	 *
> > -	 * Another benifit of this is the GuC bootrom can't access anything
> > -	 * below the WOPCM max size so anything the bootom needs to access (e.g.
> > -	 * a RSA key) needs to be placed in the GGTT above the WOPCM max size.
> > -	 * Starting the GGTT allocations above the WOPCM max give us the correct
> > -	 * placement for free.
> > -	 */
> >  	if (ggtt->size > GUC_GGTT_TOP)
> >  		ggtt->size = GUC_GGTT_TOP;
> >  
> > @@ -262,6 +276,12 @@ static void xe_ggtt_initial_clear(struct xe_ggtt *ggtt)
> >  	mutex_unlock(&ggtt->lock);
> >  }
> >  
> > +/**
> > + * xe_ggtt_init - Regular non-early GGTT initialization
> > + * @ggtt: the &xe_ggtt to be initialized
> > + *
> > + * Return: 0 on success or a negative error code on failure.
> > + */
> >  int xe_ggtt_init(struct xe_ggtt *ggtt)
> >  {
> >  	struct xe_device *xe = tile_to_xe(ggtt->tile);
> > @@ -382,6 +402,18 @@ void xe_ggtt_deballoon(struct xe_ggtt *ggtt, struct drm_mm_node *node)
> >  	mutex_unlock(&ggtt->lock);
> >  }
> >  
> > +/**
> > + * xe_ggtt_insert_special_node_locked - Locked version to insert a &drm_mm_node into the GGTT
> > + * @ggtt: the &xe_ggtt where node will be inserted
> > + * @node: the &drm_mm_node to be inserted
> > + * @size: size of the node
> > + * @align: alignment constrain of the node
> > + * @mm_flags: flags to control the node behavior
> > + *
> > + * To be used in cases where ggtt->lock is already taken.
> > + *
> > + * Return: 0 on success or a negative error code on failure.
> > + */
> >  int xe_ggtt_insert_special_node_locked(struct xe_ggtt *ggtt, struct drm_mm_node *node,
> >  				       u32 size, u32 align, u32 mm_flags)
> >  {
> > @@ -389,6 +421,15 @@ int xe_ggtt_insert_special_node_locked(struct xe_ggtt *ggtt, struct drm_mm_node
> >  					  mm_flags);
> >  }
> >  
> > +/**
> > + * xe_ggtt_insert_special_node - Insert a &drm_mm_node into the GGTT
> > + * @ggtt: the &xe_ggtt where node will be inserted
> > + * @node: the &drm_mm_node to be inserted
> > + * @size: size of the node
> > + * @align: alignment constrain of the node
> > + *
> > + * Return: 0 on success or a negative error code on failure.
> > + */
> >  int xe_ggtt_insert_special_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
> >  				u32 size, u32 align)
> >  {
> > @@ -402,6 +443,11 @@ int xe_ggtt_insert_special_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
> >  	return ret;
> >  }
> >  
> > +/**
> > + * xe_ggtt_map_bo - Map the BO into GGTT
> > + * @ggtt: the &xe_ggtt where node will be mapped
> > + * @bo: the &xe_bo to be mapped
> > + */
> >  void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
> >  {
> >  	u16 cache_mode = bo->flags & XE_BO_FLAG_NEEDS_UC ? XE_CACHE_NONE : XE_CACHE_WB;
> > @@ -449,17 +495,39 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
> >  	return err;
> >  }
> >  
> > +/**
> > + * xe_ggtt_insert_bo_at - Insert BO at a specific GGTT space
> > + * @ggtt: the &xe_ggtt where bo will be inserted
> > + * @bo: the &xe_bo to be inserted
> > + * @start: address where it will be inserted
> > + * @end: end of the range where it will be inserted
> > + *
> > + * Return: 0 on success or a negative error code on failure.
> > + */
> >  int xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
> >  			 u64 start, u64 end)
> >  {
> >  	return __xe_ggtt_insert_bo_at(ggtt, bo, start, end);
> >  }
> >  
> > +/**
> > + * xe_ggtt_insert_bo - Insert BO into GGTT
> > + * @ggtt: the &xe_ggtt where bo will be inserted
> > + * @bo: the &xe_bo to be inserted
> > + *
> > + * Return: 0 on success or a negative error code on failure.
> > + */
> >  int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
> >  {
> >  	return __xe_ggtt_insert_bo_at(ggtt, bo, 0, U64_MAX);
> >  }
> >  
> > +/**
> > + * xe_ggtt_remove_node - Remove a &drm_mm_node from the GGTT
> > + * @ggtt: the &xe_ggtt where node will be removed
> > + * @node: the &drm_mm_node to be removed
> > + * @invalidate: if node needs invalidation upon removal
> > + */
> >  void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
> >  			 bool invalidate)
> >  {
> > @@ -488,6 +556,11 @@ void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
> >  	drm_dev_exit(idx);
> >  }
> >  
> > +/**
> > + * xe_ggtt_remove_bo - Remove a BO from the GGTT
> > + * @ggtt: the &xe_ggtt where node will be removed
> > + * @bo: the &xe_bo to be removed
> > + */
> >  void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
> >  {
> >  	if (XE_WARN_ON(!bo->ggtt_node.size))
> > @@ -544,6 +617,13 @@ void xe_ggtt_assign(struct xe_ggtt *ggtt, const struct drm_mm_node *node, u16 vf
> >  }
> >  #endif
> >  
> > +/**
> > + * xe_ggtt_dump - Dump GGTT for debug
> > + * @ggtt: the &xe_ggtt to be dumped
> > + * @p: the &drm_mm_printer helper handle to be used to dump the information
> > + *
> > + * Return: 0 on success or a negative error code on failure.
> > + */
> >  int xe_ggtt_dump(struct xe_ggtt *ggtt, struct drm_printer *p)
> >  {
> >  	int err;
> > diff --git a/drivers/gpu/drm/xe/xe_ggtt_types.h b/drivers/gpu/drm/xe/xe_ggtt_types.h
> > index 2245d88d8f39..154de298a4e3 100644
> > --- a/drivers/gpu/drm/xe/xe_ggtt_types.h
> > +++ b/drivers/gpu/drm/xe/xe_ggtt_types.h
> > @@ -13,30 +13,50 @@
> >  struct xe_bo;
> >  struct xe_gt;
> >  
> > +/**
> > + * struct xe_ggtt - Main GGTT struct
> > + *
> > + * In general, each tile can contains its own Global Graphics Translation Table
> > + * (GGTT) instance.
> > + */
> >  struct xe_ggtt {
> > +	/** @tile: Back pointer to tile where this GGTT belongs */
> >  	struct xe_tile *tile;
> > -
> > +	/** @size: Total size of this GGTT */
> >  	u64 size;
> >  
> >  #define XE_GGTT_FLAGS_64K BIT(0)
> > +	/**
> > +	 * @flags: Flags for this GGTT
> > +	 * Acceptable flags:
> > +	 * - %XE_GGTT_FLAGS_64K - if PTE size is 64K. Otherwise, regular is 4K.
> > +	 */
> >  	unsigned int flags;
> > -
> > +	/** @scratch: Internal object allocation used as a scratch page */
> >  	struct xe_bo *scratch;
> > -
> > +	/** @lock: Mutex lock to protect GGTT data */
> >  	struct mutex lock;
> > -
> > +	/**
> > +	 *  @gsm: The iomem pointer to the actual location of the translation
> > +	 * table located in the GSM for easy PTE manipulation
> > +	 */
> >  	u64 __iomem *gsm;
> > -
> > +	/** @pt_ops: Page Table operations per platform */
> >  	const struct xe_ggtt_pt_ops *pt_ops;
> > -
> > +	/** @mm: The memory manager used to manage individual GGTT allocations */
> >  	struct drm_mm mm;
> > -
> >  	/** @access_count: counts GGTT writes */
> >  	unsigned int access_count;
> >  };
> >  
> > +/**
> > + * struct xe_ggtt_pt_ops - GGTT Page table operations
> > + * Which can vary from platform to platform.
> > + */
> >  struct xe_ggtt_pt_ops {
> > +	/** @pte_encode_bo: Encode PTE address for a given BO */
> >  	u64 (*pte_encode_bo)(struct xe_bo *bo, u64 bo_offset, u16 pat_index);
> > +	/** @ggtt_set_pte: Directly write into GGTT's PTE */
> >  	void (*ggtt_set_pte)(struct xe_ggtt *ggtt, u64 addr, u64 pte);
> >  };
> >  
