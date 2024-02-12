Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7471C4829D
	for <intel-xe@archiver.kernel.org>; Mon, 12 Feb 2024 21:44:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03D2610E02F;
	Mon, 12 Feb 2024 21:44:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SiNuOem5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3256E10E02F
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Feb 2024 21:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707774284; x=1739310284;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=b3NdHkcX4cZr8OGUoMH8NXOVxstdPToCSk/2E/z3a58=;
 b=SiNuOem53a9F2qLp/SwyHfjfr7sZKseSxqc0JTYXVqpQF5WUDuGV7dbm
 1KTPxcTlHdyD6LUU9FutDN/sAaZFmO+8dUMZ2zmZarWO+n/gl94h8ljWz
 z42OSVfwph3aJHvIadlXfvhIuUdAjfN/FV3zO2F/5u4DSabUO/SE5DB+S
 omXw+bbCDH3xI/4UTwWIRlz5tEy9IVrqKMtvHeRlD2kYGcLUgNAc0OQGV
 /LzWrWRpBIRyDXocoKGAQ2TfqJ5JQa2oPrk6jPMPhspqV1idDchwAEc6c
 k4V8eTR3uuLAqMWRyuTrLArlT+gcFx3rkXFb0TJbaYq9pOaW9VahRyZNA A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="13165332"
X-IronPort-AV: E=Sophos;i="6.06,155,1705392000"; d="scan'208";a="13165332"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2024 13:44:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,155,1705392000"; d="scan'208";a="33503172"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Feb 2024 13:44:39 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 12 Feb 2024 13:44:38 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 12 Feb 2024 13:44:38 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 12 Feb 2024 13:44:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hly/fdqMQbQ28Jf3VdwpvaGKIxVyIRSq13QvSUq6uVS79hi5GnvTcXfqS0fjzJid96Zf5LfZ2DNKa7opetQ7r7fQ4lh3fAXGsi9UZf5uALPT/2LHdlK+4lDWlSa+TtB75JP+E3Iq0c/dENAPTIF3eHpqU+UFrbTF2hypTOOEcy9UyYW7D09zPUp0vCHlrA4NtFZ4jYUbl65sLXycOEH/4Uu8Mtcgac06eOdKfU8qT0QplanxSJmsMRJ06ViCsfkJD1Xj9rjAcm7WmTmJlf0pCaWgZa0zpkWpOry/JsOqKORUU6vgob3CtxXmT/f8CGBOCNVF9+p4tqohF8ldjK4opg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DHtUNhOXDt52quVJhCG8jzmD88C+vSxJWk8/GOSYN3o=;
 b=AtOo8OVfh16DOgRrc05mJ9tmBEbOOyHTqb4P/eUMoMKfcyA0xbtFGJkD1A/7dcjW9vUKdUXYA6j4DKp8R9blvKyVGSBbqndIuYspCsbeh6cNClGnJdF/c5Xn1mPEUNaosgpg39fNwCYRsqvdNjs/XPrq4vcb77ZxXrm/AKGlKnliFTj788kwX5fPCeTCHbVxMsvenS8SPUVYobE2gcguY9lhAi4ov+YGevZvgPoejDRpBJ+rpK3kPleLBOMvxIFjlekt8OB8vsVVg8KM6voVGAiDWZCJtpjWzNshJDg4vAlm33pz5Sf18RLJYJ7m0NVwJjsrrHUlJypvXQxogKFXIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DM4PR11MB6550.namprd11.prod.outlook.com (2603:10b6:8:b4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.35; Mon, 12 Feb
 2024 21:44:36 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::2157:7433:d32c:a8e3]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::2157:7433:d32c:a8e3%4]) with mapi id 15.20.7270.036; Mon, 12 Feb 2024
 21:44:36 +0000
Date: Mon, 12 Feb 2024 13:44:34 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Subject: Re: [topic/xe-for-ci] drm/xe: Add new PVC PCI ID
Message-ID: <20240212214434.GD718896@mdroper-desk1.amr.corp.intel.com>
References: <20240212185125.457721-1-radhakrishna.sripada@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240212185125.457721-1-radhakrishna.sripada@intel.com>
X-ClientProxiedBy: SJ0PR03CA0136.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::21) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DM4PR11MB6550:EE_
X-MS-Office365-Filtering-Correlation-Id: 7cc94fdf-fb74-4add-1606-08dc2c13cebc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4Lr0znyBUbbpyszIqT7zjRRDDZ2FADTT+onP4StwPoAp/ZMrwcUTESvUJCd5Jt6n3QeAC4aYUNWiPlj4IKJCtT9SWlasP3ftONAC9rbhD/Mvgq1guQHgn5ycu9B7vFDDex6yjZ/Pk+7buxbQADjoBtGxl07DYYUnxNpyDIJE0xV8csufkE7bECUxRarsRgubehoqk871BNAi9ffhBleFlk5RwJlDdf3rLBzixxJ9ClPz3jBzEdsuSfMuKA9Elm+ojag8HpgoZbsOfSHtMJfLZPtJNx2cuggHGVF/3WKZ9dx8Fwu3otiBwkyikGsbdMcvGnqME99W+VYrRsEKM3ebhgk2baf14xc6qHrlOiEyc5FyQm/nMNaGyW5kJn3S+fya3gT4/5GrkBMjQTXf2Yrl9bCFGv6Pyuj+mqyYPbZoDCLvHfCD8xQCzp2Wy5Hp4ahsfqd3v//KtoWge9/HuS0AC59a/xUlkXBJxrVQa4YhEFmQkAWOn13SSMKuoseH+cPay29Ydhy6TH+BC5uhsMLam8vHLfgZMy7wasnhZOX0wH8cxEYrQiFkrz2LAd2WdnlY
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(136003)(396003)(376002)(346002)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(6486002)(6506007)(6512007)(2906002)(33656002)(86362001)(66946007)(5660300002)(82960400001)(1076003)(6862004)(38100700002)(66556008)(478600001)(6636002)(316002)(4326008)(66476007)(107886003)(26005)(8676002)(8936002)(41300700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Jk7rvw9HDxvnTs9qhgCzgm3ceHjXqvPD6CagSs9DROfZpPVQk3Km8XzYDgUu?=
 =?us-ascii?Q?TTwmEqxQr6ldY+oG7lIAd62/bd3UV5JoVRUbVnFGkNyGChGCrhiHWA+xh352?=
 =?us-ascii?Q?/NCgzjqMYBxa+8w0N+J/P8vyIRoawfnfSxIZ2/jxfc6pUu4UcFgdU6OahCQE?=
 =?us-ascii?Q?6Msg8qvTYzkvs/UWpXsLyDKokmgCqSAxjfqht31sEsi0VNqhzojBj/sktAUo?=
 =?us-ascii?Q?49UmO0CUgyJL3hqQYqFywnVcPOdS2DFmfeFri5AT9BuUFq3YPAt6aE5frWqa?=
 =?us-ascii?Q?9O65a6A/C1ymu4tooCXlTkwWoZTZCjQo0E3ee6txm7RUIg5H2ZUOjDMercVt?=
 =?us-ascii?Q?zTkgykODORf9w9OOlOdXChyp28WGNdvmdJ6pn98boO0zaMPVD3W/EjNrwgOI?=
 =?us-ascii?Q?rWxxltiG5DUr8dfPCl4sLKP6+IA//l088zYBtg1Hleda2idJ/G6vlGy5R2AL?=
 =?us-ascii?Q?H9W6+exqSFx0QVwl+ndt5O184WHymnnRz7n4FexxN6xk3MmJSiOJ3ZXY4/88?=
 =?us-ascii?Q?XIpGroIyG6C44V4kK0WauSj5MuJQOQjltgHQDNcKh1SWFo2ugQDJDt+deWJy?=
 =?us-ascii?Q?FvkA7ELy1MDle51mhCix27MY9/Dcbsnlmf7M3pcujfl9K2oRSCzl4vIx+HbM?=
 =?us-ascii?Q?j9ssV8vqE8lTvMbNJ/7iPIx/jjsmUOEa4v4EpS/RdNd0fs0StFKBKrPn6J0K?=
 =?us-ascii?Q?lGtvwss52p/zEPS2Kj+jZLened5F7YYgRS2MbNKfTIPdhqPhLbCFd9yGNRBi?=
 =?us-ascii?Q?Y8vpff9UCvAVkSQqcrEi+bKxjbGWAeZdH3bGvU0Lbb4+jsaZDW+GDx3vX3k2?=
 =?us-ascii?Q?RRw/Zms9dmogj0IAEdkDB/e7ZjD1rjCBCm6gvodT6attdugqHnqIkWvpfbsr?=
 =?us-ascii?Q?WB4Qsgz6tW6IUZS6aRnAFhJOXT1zKzYrGoWcUhMZ5VqsJc9w304VGUz7bvSy?=
 =?us-ascii?Q?MQES1YNgr2JfjCikBA4mvcTauLKqxME4DjBbnRm3jwOisVC4dAQp09fl7reg?=
 =?us-ascii?Q?sVSJtnOgBAK50QUQoWmLgaKgVBcfIEak8WOR88s2T+ufIL9o9HoMyHwoy83C?=
 =?us-ascii?Q?M6rSw74yspVn7nIVE9D0NWLtONpYF48r/fUzgznZa9yVIRgXA4+Jdepyy5DT?=
 =?us-ascii?Q?qjSUJVF1NtWaDadsMoJfEhqaSFKPZKFYA1S5rz5Ko+WUIDPCIb9q4pgVRcfK?=
 =?us-ascii?Q?SJwjdJjdAdn8Pp159QZLkfPcGgTOfNJN0NG0F2xUC9imB9P9zkaZzg8Oo/Sq?=
 =?us-ascii?Q?c3qgZ84BEE1gwGL45L2wP6k26i5E8O7YR6kaZsizTHQ0E77DwsgbOGWH8xry?=
 =?us-ascii?Q?JNV9qSjTThO7iOFlmF6UaUopYfbxacNs6VwvXjC746G390Q1d29O9CFYlcvT?=
 =?us-ascii?Q?a4hI0Z846KMTTT+O/Oho8z2XAnXafouupKW4oGEcgffI0CL0W0MElvzS4n1Q?=
 =?us-ascii?Q?zM7yS4LYvKWTaFhZaGdsXlKEy6c38xKyhKi1q3KvQiNma4D2TxOvdL5STcx6?=
 =?us-ascii?Q?4vAQ1X00HtXHlsSr+IDB8J7EAUKzpOU+//RrF6n55hy4KOZoO2lMZ/VXIzth?=
 =?us-ascii?Q?zlas0Kcfuw7JtrcHNjbv9an9IsKycau8mkupxGMzzYx82BJdJL/FBYoj29Ol?=
 =?us-ascii?Q?mQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cc94fdf-fb74-4add-1606-08dc2c13cebc
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2024 21:44:36.5400 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g5nuovm09gPR4UFDAmD+1LVytcB+79XozDKf150+lOy7RRYBhqAZgswDVKacwFZPvhRng4QnCTyfFS2vvA+jBdIQ7ZgXXTErb2lmTHvgKzo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6550
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

On Mon, Feb 12, 2024 at 10:51:25AM -0800, Radhakrishna Sripada wrote:
> A new PVC vector only SKU got introduced. Add the new PCI id
> to the list of PVC PCI id's.
> 
> Bspec: 44484
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>

Since the other PVC PCI IDs are also only on topic/xe-for-ci and not
flowing upstream yet, it might be better to just make this a fixup!
patch against b8462744d250 ("drm/xe: Add PVC's PCI device IDs") so that
this can be easily squashed into that patch the next time somebody
rebases the branch.

Aside from that the new device ID looks correct, so

    Reviewed-by: Matt Roper <matthew.d.roper@intel.com>


Matt

> ---
>  include/drm/xe_pciids.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/drm/xe_pciids.h b/include/drm/xe_pciids.h
> index 3011d99a05c5..2b7c2003ddb4 100644
> --- a/include/drm/xe_pciids.h
> +++ b/include/drm/xe_pciids.h
> @@ -186,6 +186,7 @@
>  #define XE_PVC_IDS(MACRO__, ...)		\
>  	MACRO__(0x0B69, ## __VA_ARGS__),	\
>  	MACRO__(0x0B6E, ## __VA_ARGS__),	\
> +	MACRO__(0x0BD4, ## __VA_ARGS__),	\
>  	MACRO__(0x0BD5, ## __VA_ARGS__),	\
>  	MACRO__(0x0BD6, ## __VA_ARGS__),	\
>  	MACRO__(0x0BD7, ## __VA_ARGS__),	\
> -- 
> 2.34.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
