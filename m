Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D33BDC27C79
	for <intel-xe@archiver.kernel.org>; Thu, 20 Jun 2024 22:04:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8787610E134;
	Thu, 20 Jun 2024 22:04:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HfK78AFr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DB5410E134
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Jun 2024 22:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718921080; x=1750457080;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=DxjSewqImCiozje1az7cmsKM3/yqI+J9rOpg7h/gXfo=;
 b=HfK78AFrUCaavB/QhJw/6zGdH1S6RcWwEjXrWnc+wJMQ8yIZKE40AilQ
 mTD0bHkdO/ZQdRrL5JmzsH9G3078N/3aLnZzs5whnAFvgmsAkF4BYmJ2O
 y8mv0z+FN/JrBqEXa0p4BLpAGcR1TcvUxCRimjzIZxeUCniiFOAOIIqXf
 TSe5Mb7+dhVwDiv8/FMeACd/F6jMS4Weh9K1cdinYjwbLQrHwvYRJfqqU
 7Q0cmRrquTOyZkL3c2H3z9JEkh/VIDW84x0++KJBNDMvSb6QgQekiEKil
 eFu3C8AvY5D7Bv/RG+5pFsFTOOf/0C1qUVo/1B7Q4+EGth96dUBvmb8t3 w==;
X-CSE-ConnectionGUID: Bq0QhHZATWC/pPXQXRDzFQ==
X-CSE-MsgGUID: DZx9kX4hSIm3Nyc+Z+3Dbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="41340142"
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; d="scan'208";a="41340142"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 15:04:39 -0700
X-CSE-ConnectionGUID: 1q0lt7G0QySBadY8BndnPw==
X-CSE-MsgGUID: Br6U0sCeTz2DA98tjmRXcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; d="scan'208";a="43067452"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Jun 2024 15:04:40 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 20 Jun 2024 15:04:38 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 20 Jun 2024 15:04:38 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 20 Jun 2024 15:04:38 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 20 Jun 2024 15:04:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TH+INt3cO8gYcV8ZoOgaBstPteyq20/aKuOUXe0IvINAM7x2qp2CjE8ndCqNcNGUKJ2HUwkMabZi8SqqnKlEw42hxqZu3R3K7Nxlo7y2Sj5g/Mg//nyn6ER/EKKVlWgBVKcRZNMkueFxg5ZPyCoY3qryJjhJu6BczJkjfyUzIdGB2NHb+0JHjvm9KDe+xsKtYLrWlXkLgdns6gCKrTDjZi0bwg7VrG6i8bmmaxoh3HQp1ChCdkCvPzJ6ycEBPp7N+ruyXoZd7TSTFu4rMjYCpvkA+2s2be6q5oHV6M4b8epR10Q2v2peqCs2DpVPIupVa9BUm/dtYN1szRu7FIaqeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jdroaEfa+5oMGg6xhdi4vJ/E5Al0Xz5hPQuSjL+ImvA=;
 b=iiO/DbvpofzZ2WnB/zw3vHZrkt6LyzSiHHr3DknipYMtYyoFuh4eqxHVId5Hryrg4PSOIyCTf6nRSwbgVpzrgSXBuHdfZHhpUAGNoYJGc0kDENeJ1eHLPEvnwt+nrmu4dRXf9M3SKKKC1iswTqHfop/ZsgEMnZa83WBkv1KFfLNZb9ad83vJUkSr0s7prSW/W4b8FpYRVAaWbQy32VQqEriZc1UgKyIfaBEpz0VWB93Rpi8LgJwySc+xh9NlwiKgTpWqa1NyTr4nx8fYyJ1zYZpMNLDsFGkUbTQQUZ6Fem8AViAV7ldqSi7A2vT9GNMU+6YlbYnqQ458Oxo71+00sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by DS0PR11MB8206.namprd11.prod.outlook.com (2603:10b6:8:166::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.31; Thu, 20 Jun
 2024 22:04:35 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7677.030; Thu, 20 Jun 2024
 22:04:35 +0000
Date: Thu, 20 Jun 2024 18:04:32 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v6 1/2] drm/xe/lnl: Apply Wa_22019338487
Message-ID: <ZnSncCwKW2wGUURT@intel.com>
References: <20240619012617.3756043-1-vinay.belgaumkar@intel.com>
 <20240619012617.3756043-2-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240619012617.3756043-2-vinay.belgaumkar@intel.com>
X-ClientProxiedBy: BYAPR07CA0053.namprd07.prod.outlook.com
 (2603:10b6:a03:60::30) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|DS0PR11MB8206:EE_
X-MS-Office365-Filtering-Correlation-Id: e448c645-199b-4ca6-0cdf-08dc9174f89d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|1800799021|376011;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZDIKVi0lFfXC5zSUSFkSTDUILf5cVr5A9iMBAUX2wxKJ4nq192Vnfyy8UZac?=
 =?us-ascii?Q?VsOVSkecfQ/WV4ju4pdYLWB5MUXsb63XjSD7coggRu2/rR+AIbt+Bnlc+ktK?=
 =?us-ascii?Q?mooH/CDRD6mN0ai9ThnaaS8DP0uuzNN1B2cceMdosV10qjGFLfzJ9wn+JOqp?=
 =?us-ascii?Q?WyB9ABViYMimHiCuWaZ3jsrmpuheyjDFS2qI7yPKh97rvvXiasbAF8fNGCKI?=
 =?us-ascii?Q?k61z8ycQq6Rt+r9oDYaWIjzPFPk92CnkgL7hMWr4LNctijqejZTOAhCkfLzP?=
 =?us-ascii?Q?nVH0MioCi647T1sMmISVHhwuOkDiS8IPW/g7RXikQwj5UbMXC+O59jHHw/Fu?=
 =?us-ascii?Q?gIwv62Dl8x3TI0T4b5N/Z3fE1xA3wVTHdy5nJtC/PJHVlrTY+qp2df+qjkH2?=
 =?us-ascii?Q?Kr0qgKXYYFSSccstFU2IZscVdEN0z9lIaI/0DJ7JQPvDQESu71gykS8/djxa?=
 =?us-ascii?Q?agH+PmpL4vcdUqoz9Y5I3zgd7sw5PNajbtEQJa0Eji7UDhTdlQPDY5lNVRnr?=
 =?us-ascii?Q?ok1c+NumAklWUpIqHL9yg8tFGgdBVEHEkfq3eTozCqpHCJhVcjF7BoxAWeai?=
 =?us-ascii?Q?Ko9yr79txxrZC05Okm3BuKEoqdObUiCDAIg6kOSGxFDIK9tjd7k7KgZBCkpd?=
 =?us-ascii?Q?maFaIZsHbd5GOqV8x0kM8JFd2fmT+vS2Qr8eBqtc7kOavD8h8f7FY11xlTFD?=
 =?us-ascii?Q?vVLKw1MRxt9r5f37jQNkBxJfw9unSIDylaFqdRGRrvrlNuWhgnDN+O/zc1FZ?=
 =?us-ascii?Q?iMHz9r0UxeqSlLMFAPpRCkpJdBSiCqxSnGph8D+lYqBJ2JXdrb8oiHo1XwZz?=
 =?us-ascii?Q?a4z81QY+Ub7AT4PdJvgqSOU+sVNq3OQ12EY/DD34z72/BCvebS3NMuQIxgKd?=
 =?us-ascii?Q?Ud2Ku8VI8KNITm4YqaeYz2dwLGDQr/tHjG9pwZhIBTS3bAeL6aLatVn2I1g0?=
 =?us-ascii?Q?9A1o4Em2wO2Dwyz7soOG9rWhVsP0lleojFSmjAUyh7CePfmn4dbDbaLt1ifh?=
 =?us-ascii?Q?bzVrrrClPA8RnooEXaE0P+Ata+FTmV34i8sC1R4nQrSR9flmEjmt9IkRBwp4?=
 =?us-ascii?Q?HNL3KVr183so1JlVshcS02aMly5nsSmZkdY7vbxUCsWa97FFJ+zn8hYXFRK7?=
 =?us-ascii?Q?Ie3JZ+c5Pza+NBsqER2r+KHdQ2jOZkDgx56hGEKCl7WVLhPPh5Edv3b3gtdO?=
 =?us-ascii?Q?+XZBuQACxelR5j6Hq4Ruz79l31iXOcMFFEQTbEeczQZFcPm3Ou3ITTspmiQB?=
 =?us-ascii?Q?ZgmyQVVYv7dMp/IpDV3hZiZJn0NEZYJ1K3O2UQlc/uX2FuOxzrQMGIRvoejA?=
 =?us-ascii?Q?DxcqRV3g8xnGYJs14JGj/gjM?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(1800799021)(376011); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ShtNW6GcdLgEBk62llZ7tYGGDVQPLYXb5mOj6Wi/5WowaTKnMcgUL18dxVlN?=
 =?us-ascii?Q?1V4ynRZl8687J3vZy8pwK7+GRT1/4ikSaV46rhNRZWB14t8UrxXnUr9yWLQ8?=
 =?us-ascii?Q?B44AZbe/vKyfOhouMr7CqDZ5DmMpha9XtrOWrYqzMT/riG0TSUp/nh+62imY?=
 =?us-ascii?Q?oxJyQ8yyIDBrzhYHE0YZgfP+pt4kbRB+HLejWfJFAeHfuBuOXlv2yIz4J90J?=
 =?us-ascii?Q?RmI5wofyCyb2cyQlvdrih7nCG2Id9kJyqJGGyQ15m/jOZZ9tHiGhyjmRlSu8?=
 =?us-ascii?Q?i+jEFy2k+yDQJ0MLnR6pFe367ob4f/wl+7xbu1MWBWqk0ipiM+GT1Po78yB6?=
 =?us-ascii?Q?TtthLN4VUIBpBO28gdb65v9qJ6Y+G+17jD/mS3dSlpNN3Q5FSLVJqv0v+/Em?=
 =?us-ascii?Q?gcSzl4Fz3XR5IznBSVbAbAvrrw6xx2IO/4RZ+vM6/5lucnJcikEWjI5Qau8n?=
 =?us-ascii?Q?JueLu1ewsKV6ZdoklU6d5whnyV4avuUge6XrNl43LO4oU067HrXnQrW+6jEU?=
 =?us-ascii?Q?AkHs3mMLsNOWjnZIbVV1FktcA4uAF647cHaOHYE7z7OdsQZs4RYS203JrihI?=
 =?us-ascii?Q?YLw8biAblZ/vYOp83USAFqLxFfxpCcNivts3jyaODw633Le39p1U9KDR9QUo?=
 =?us-ascii?Q?nLt/nOALFPQr6Wbg0zGJGPOtVr8zPtjEH2zX8Qa0a8C9Hlt0sqFCzREDy93n?=
 =?us-ascii?Q?mqhC/Db+Anw3OSlegEcAGPrpAuNr3l2rbjiCBOpKN4DbnCYC5CEdW2c7/cPa?=
 =?us-ascii?Q?UdiDwnLZ2oHGLOuCg3jaNopjr4E2RsWjq+623oR1P1vvL2fbFUzpFH3uxaAG?=
 =?us-ascii?Q?LX7EzNbcFKwrZmk3xn+AHgZS3ZP0f5Kqre7vMpPhgRlk5ICtQ6oSW2m9aAZu?=
 =?us-ascii?Q?8iHjFq8Ydvu5x/5qzY2VU1TVDNw8d53dlEpZo6XpteE1t8NgSyGp1uEC888r?=
 =?us-ascii?Q?tluMvApOgDUfDLTDl3N8g5TAdrjiLEzFANf+IiyveboY94dIKrT5qsadQ/kP?=
 =?us-ascii?Q?Nj4MJ1Fi+/zb9y06Sf+CR20MSf8GJE/U+VLOAr1JTme2kt5OjFOuWjTV5DJ8?=
 =?us-ascii?Q?uvDDfV9uISjmPaUR35TfegKaFlVhxHdv0Yse/MzVbVUJv4qlhV/H7VQUDZLX?=
 =?us-ascii?Q?8eMt6uChdFkpSkb7+cD2L07WmL1w0QUvwAXZjvQfblmaqqQCVQLglAQJRKje?=
 =?us-ascii?Q?qQmhaChrOjBmCvWK5PP7rQbnSc/+C13JmOXYSqfzywn56DOqKiMDS813bWYU?=
 =?us-ascii?Q?/E1QXtQZ4A57TEiN8DDHGZriwRHOVRj+fbE/v1axQZFIMP+ZAvXXo0XZXNS/?=
 =?us-ascii?Q?JdQWnM9YaCgOU4BB+3VzofQtoH+Uy5ZGJ+JnAEKLRlUqXTX+iUs0LuYdXL0J?=
 =?us-ascii?Q?YK3OGTMGDdQx4VplZmq157kttnV/uR/jlRtiiFgXxGm4+uvzDBPcr/5UiDLu?=
 =?us-ascii?Q?gcOfs1+YvmwJk5F4Pejdbwwg1Afp9uCk6XRtpBdwqh2twVHpIj2seWoQY/zb?=
 =?us-ascii?Q?NNs7oR8zSBA0EI/apaYwj2/lvz59LGr5nzPcg/mbyG7Ji6u7871zW7m1jJ4D?=
 =?us-ascii?Q?cgFSsJTIaqZrtTgtpWQ657VcyCj4dnP3llYMdAxg?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e448c645-199b-4ca6-0cdf-08dc9174f89d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2024 22:04:35.4984 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zf2UoVHylZq8R6e4R1sGQWimcPmi+pbE2KVt2F7CAb/Mcj3qjxKnDe0h+VDaJs1lfoZ9bWrNu8tfWXnUH2xMpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8206
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

On Tue, Jun 18, 2024 at 06:26:16PM -0700, Vinay Belgaumkar wrote:
> This WA requires us to limit media GT frequency requests to a certain
> cap value during driver load. Freq limits are restored after load
> completes, so perf will not be affected during normal operations.
> 
> During normal driver operation, this WA requires dummy writes to media
> offset 0x380D8C after every ~63 GGTT writes. This will ensure completion
> of the LMEM writes originating from Gunit.
> 
> During driver unload(before FLR), the WA requires that we set requested
> frequency to the cap value again.
> 
> v3: Do not use WA number in function name. Call WA wrapper from xe_device.
> Rename some variables, check for locks in the correct function (Rodrigo).
> Ensure reset path is also covered for this WA.
> 
> v4: Fix BAT failure
> 
> v5: Add a function pointer for ggtt_ops (Michal W)
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile          |  3 ++
>  drivers/gpu/drm/xe/xe_device.c       |  3 ++
>  drivers/gpu/drm/xe/xe_ggtt.c         | 40 ++++++++++++++--
>  drivers/gpu/drm/xe/xe_ggtt.h         |  1 +
>  drivers/gpu/drm/xe/xe_ggtt_types.h   | 12 +++--
>  drivers/gpu/drm/xe/xe_gsc.c          |  5 ++
>  drivers/gpu/drm/xe/xe_gt.c           | 24 ++++++++++
>  drivers/gpu/drm/xe/xe_gt.h           |  1 +
>  drivers/gpu/drm/xe/xe_guc_pc.c       | 71 +++++++++++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_guc_pc.h       |  1 +
>  drivers/gpu/drm/xe/xe_guc_pc_types.h |  4 ++
>  drivers/gpu/drm/xe/xe_wa_oob.rules   |  1 +
>  12 files changed, 157 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 20dc9759bb3c..b1e03bfe4a68 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -24,9 +24,12 @@ $(obj)/generated/%_wa_oob.c $(obj)/generated/%_wa_oob.h: $(obj)/xe_gen_wa_oob \
>  	$(call cmd,wa_oob)
>  
>  uses_generated_oob := \
> +	$(obj)/xe_ggtt.o \
>  	$(obj)/xe_gsc.o \
> +	$(obj)/xe_gt.o \
>  	$(obj)/xe_guc.o \
>  	$(obj)/xe_guc_ads.o \
> +	$(obj)/xe_guc_pc.o \
>  	$(obj)/xe_migrate.o \
>  	$(obj)/xe_ring_ops.o \
>  	$(obj)/xe_vm.o \
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 75d4c8ae9234..2172b7d0e36a 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -676,6 +676,9 @@ int xe_device_probe(struct xe_device *xe)
>  
>  	xe_hwmon_register(xe);
>  
> +	for_each_gt(gt, xe, id)
> +		xe_gt_sanitize_freq(gt);
> +
>  	return devm_add_action_or_reset(xe->drm.dev, xe_device_sanitize, xe);
>  
>  err_fini_display:
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 8ff91fd1b7c8..c345298d4a14 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -11,6 +11,7 @@
>  #include <drm/drm_drv.h>
>  #include <drm/drm_managed.h>
>  #include <drm/intel/i915_drm.h>
> +#include <generated/xe_wa_oob.h>
>  
>  #include "regs/xe_gt_regs.h"
>  #include "regs/xe_gtt_defs.h"
> @@ -23,8 +24,10 @@
>  #include "xe_gt_sriov_vf.h"
>  #include "xe_gt_tlb_invalidation.h"
>  #include "xe_map.h"
> +#include "xe_mmio.h"
>  #include "xe_pm.h"
>  #include "xe_sriov.h"
> +#include "xe_wa.h"
>  #include "xe_wopcm.h"
>  
>  static u64 xelp_ggtt_pte_encode_bo(struct xe_bo *bo, u64 bo_offset,
> @@ -69,6 +72,21 @@ static unsigned int probe_gsm_size(struct pci_dev *pdev)
>  	return ggms ? SZ_1M << ggms : 0;
>  }
>  
> +static void ggtt_update_access_counter(struct xe_ggtt *ggtt)
> +{
> +	/*
> +	 * Wa_22019338487: GMD_ID is a RO register, a dummy write forces gunit
> +	 * to wait for completion of prior GTT writes before letting this through.
> +	 * This needs to be done for all GGTT writes originating from the CPU.
> +	 */
> +	lockdep_assert_held(&ggtt->lock);
> +
> +	if ((++ggtt->access_count % 63) == 0) {
> +		xe_mmio_write32(ggtt->tile->media_gt, GMD_ID, 0x0);
> +		ggtt->access_count = 0;
> +	}
> +}
> +
>  void xe_ggtt_set_pte(struct xe_ggtt *ggtt, u64 addr, u64 pte)
>  {
>  	xe_tile_assert(ggtt->tile, !(addr & XE_PTE_MASK));
> @@ -77,6 +95,12 @@ void xe_ggtt_set_pte(struct xe_ggtt *ggtt, u64 addr, u64 pte)
>  	writeq(pte, &ggtt->gsm[addr >> XE_PTE_SHIFT]);
>  }
>  
> +void xe_ggtt_set_pte_and_flush(struct xe_ggtt *ggtt, u64 addr, u64 pte)

I also just noticed that this doesn't need to be exported... it could/should be static.

I have a patch for that ready, but if the check of the hook failure make you do another
version, please make this static.

Thanks,
Rodrigo.

> +{
> +	xe_ggtt_set_pte(ggtt, addr, pte);
> +	ggtt_update_access_counter(ggtt);
> +}
> +
>  static void xe_ggtt_clear(struct xe_ggtt *ggtt, u64 start, u64 size)
>  {
>  	u16 pat_index = tile_to_xe(ggtt->tile)->pat.idx[XE_CACHE_WB];
> @@ -92,7 +116,7 @@ static void xe_ggtt_clear(struct xe_ggtt *ggtt, u64 start, u64 size)
>  		scratch_pte = 0;
>  
>  	while (start < end) {
> -		xe_ggtt_set_pte(ggtt, start, scratch_pte);
> +		ggtt->pt_ops->set_pte(ggtt, start, scratch_pte);
>  		start += XE_PAGE_SIZE;
>  	}
>  }
> @@ -124,10 +148,17 @@ static void primelockdep(struct xe_ggtt *ggtt)
>  
>  static const struct xe_ggtt_pt_ops xelp_pt_ops = {
>  	.pte_encode_bo = xelp_ggtt_pte_encode_bo,
> +	.set_pte = xe_ggtt_set_pte,
>  };
>  
>  static const struct xe_ggtt_pt_ops xelpg_pt_ops = {
>  	.pte_encode_bo = xelpg_ggtt_pte_encode_bo,
> +	.set_pte = xe_ggtt_set_pte,
> +};
> +
> +static const struct xe_ggtt_pt_ops xelpg_pt_wa_ops = {
> +	.pte_encode_bo = xelpg_ggtt_pte_encode_bo,
> +	.set_pte = xe_ggtt_set_pte_and_flush,
>  };
>  
>  /*
> @@ -187,7 +218,8 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
>  		ggtt->size = GUC_GGTT_TOP;
>  
>  	if (GRAPHICS_VERx100(xe) >= 1270)
> -		ggtt->pt_ops = &xelpg_pt_ops;
> +		ggtt->pt_ops = ggtt->tile->media_gt && XE_WA(ggtt->tile->media_gt, 22019338487) ?
> +			       &xelpg_pt_wa_ops : &xelpg_pt_ops;
>  	else
>  		ggtt->pt_ops = &xelp_pt_ops;
>  
> @@ -394,7 +426,7 @@ void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
>  
>  	for (offset = 0; offset < bo->size; offset += XE_PAGE_SIZE) {
>  		pte = ggtt->pt_ops->pte_encode_bo(bo, offset, pat_index);
> -		xe_ggtt_set_pte(ggtt, start + offset, pte);
> +		ggtt->pt_ops->set_pte(ggtt, start + offset, pte);
>  	}
>  }
>  
> @@ -502,7 +534,7 @@ static void xe_ggtt_assign_locked(struct xe_ggtt *ggtt, const struct drm_mm_node
>  		return;
>  
>  	while (start < end) {
> -		xe_ggtt_set_pte(ggtt, start, pte);
> +		ggtt->pt_ops->set_pte(ggtt, start, pte);
>  		start += XE_PAGE_SIZE;
>  	}
>  
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
> index 4a41a1762358..0e36ed4cd68a 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.h
> +++ b/drivers/gpu/drm/xe/xe_ggtt.h
> @@ -11,6 +11,7 @@
>  struct drm_printer;
>  
>  void xe_ggtt_set_pte(struct xe_ggtt *ggtt, u64 addr, u64 pte);
> +void xe_ggtt_set_pte_and_flush(struct xe_ggtt *ggtt, u64 addr, u64 pte);
>  int xe_ggtt_init_early(struct xe_ggtt *ggtt);
>  int xe_ggtt_init(struct xe_ggtt *ggtt);
>  void xe_ggtt_printk(struct xe_ggtt *ggtt, const char *prefix);
> diff --git a/drivers/gpu/drm/xe/xe_ggtt_types.h b/drivers/gpu/drm/xe/xe_ggtt_types.h
> index d8c584d9a8c3..5d3de08831f3 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt_types.h
> +++ b/drivers/gpu/drm/xe/xe_ggtt_types.h
> @@ -13,10 +13,6 @@
>  struct xe_bo;
>  struct xe_gt;
>  
> -struct xe_ggtt_pt_ops {
> -	u64 (*pte_encode_bo)(struct xe_bo *bo, u64 bo_offset, u16 pat_index);
> -};
> -
>  struct xe_ggtt {
>  	struct xe_tile *tile;
>  
> @@ -34,6 +30,14 @@ struct xe_ggtt {
>  	const struct xe_ggtt_pt_ops *pt_ops;
>  
>  	struct drm_mm mm;
> +
> +	/** @access_count: counts GGTT writes */
> +	unsigned int access_count;
> +};
> +
> +struct xe_ggtt_pt_ops {
> +	u64 (*pte_encode_bo)(struct xe_bo *bo, u64 bo_offset, u16 pat_index);
> +	void (*set_pte)(struct xe_ggtt *ggtt, u64 addr, u64 pte);
>  };
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
> index 80a61934decc..f8239a13fa2b 100644
> --- a/drivers/gpu/drm/xe/xe_gsc.c
> +++ b/drivers/gpu/drm/xe/xe_gsc.c
> @@ -22,6 +22,7 @@
>  #include "xe_gt.h"
>  #include "xe_gt_mcr.h"
>  #include "xe_gt_printk.h"
> +#include "xe_guc_pc.h"
>  #include "xe_huc.h"
>  #include "xe_map.h"
>  #include "xe_mmio.h"
> @@ -284,6 +285,10 @@ static int gsc_upload_and_init(struct xe_gsc *gsc)
>  		return ret;
>  
>  	xe_uc_fw_change_status(&gsc->fw, XE_UC_FIRMWARE_TRANSFERRED);
> +
> +	/* GSC load is done, restore expected GT frequencies */
> +	xe_gt_sanitize_freq(gt);
> +
>  	xe_gt_dbg(gt, "GSC FW async load completed\n");
>  
>  	/* HuC auth failure is not fatal */
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 57d84751e160..759634cff1d8 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -9,6 +9,7 @@
>  
>  #include <drm/drm_managed.h>
>  #include <drm/xe_drm.h>
> +#include <generated/xe_wa_oob.h>
>  
>  #include "instructions/xe_gfxpipe_commands.h"
>  #include "instructions/xe_mi_commands.h"
> @@ -54,6 +55,7 @@
>  #include "xe_sriov.h"
>  #include "xe_tuning.h"
>  #include "xe_uc.h"
> +#include "xe_uc_fw.h"
>  #include "xe_vm.h"
>  #include "xe_wa.h"
>  #include "xe_wopcm.h"
> @@ -678,6 +680,9 @@ static int do_gt_restart(struct xe_gt *gt)
>  	/* Get CCS mode in sync between sw/hw */
>  	xe_gt_apply_ccs_mode(gt);
>  
> +	/* Restore GT freq to expected values */
> +	xe_gt_sanitize_freq(gt);
> +
>  	return 0;
>  }
>  
> @@ -801,6 +806,25 @@ int xe_gt_suspend(struct xe_gt *gt)
>  	return err;
>  }
>  
> +/**
> + * xe_gt_sanitize_freq() - Restore saved frequencies if necessary.
> + * @gt: the GT object
> + *
> + * Called after driver init/GSC load completes to restore GT frequencies if we
> + * limited them for any WAs.
> + */
> +int xe_gt_sanitize_freq(struct xe_gt *gt)
> +{
> +	int ret = 0;
> +
> +	if ((!xe_uc_fw_is_available(&gt->uc.gsc.fw) ||
> +	    xe_uc_fw_is_loaded(&gt->uc.gsc.fw)) &&
> +	    XE_WA(gt, 22019338487))
> +		ret = xe_guc_pc_restore_stashed_freq(&gt->uc.guc.pc);
> +
> +	return ret;
> +}
> +
>  int xe_gt_resume(struct xe_gt *gt)
>  {
>  	int err;
> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> index 9073ac68a777..1123fdfc4ebc 100644
> --- a/drivers/gpu/drm/xe/xe_gt.h
> +++ b/drivers/gpu/drm/xe/xe_gt.h
> @@ -56,6 +56,7 @@ int xe_gt_suspend(struct xe_gt *gt);
>  int xe_gt_resume(struct xe_gt *gt);
>  void xe_gt_reset_async(struct xe_gt *gt);
>  void xe_gt_sanitize(struct xe_gt *gt);
> +int xe_gt_sanitize_freq(struct xe_gt *gt);
>  void xe_gt_remove(struct xe_gt *gt);
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index 2b45a9cd3ec0..edf4a29a2aa3 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -8,6 +8,7 @@
>  #include <linux/delay.h>
>  
>  #include <drm/drm_managed.h>
> +#include <generated/xe_wa_oob.h>
>  
>  #include "abi/guc_actions_slpc_abi.h"
>  #include "regs/xe_gt_regs.h"
> @@ -25,6 +26,7 @@
>  #include "xe_mmio.h"
>  #include "xe_pcode.h"
>  #include "xe_pm.h"
> +#include "xe_wa.h"
>  
>  #define MCHBAR_MIRROR_BASE_SNB	0x140000
>  
> @@ -42,6 +44,8 @@
>  #define GT_FREQUENCY_MULTIPLIER	50
>  #define GT_FREQUENCY_SCALER	3
>  
> +#define LNL_MERT_FREQ_CAP	800
> +
>  /**
>   * DOC: GuC Power Conservation (PC)
>   *
> @@ -695,6 +699,16 @@ static void pc_init_fused_rp_values(struct xe_guc_pc *pc)
>  		tgl_init_fused_rp_values(pc);
>  }
>  
> +static u32 pc_max_freq_cap(struct xe_guc_pc *pc)
> +{
> +	struct xe_gt *gt = pc_to_gt(pc);
> +
> +	if (XE_WA(gt, 22019338487))
> +		return min(LNL_MERT_FREQ_CAP, pc->rp0_freq);
> +	else
> +		return pc->rp0_freq;
> +}
> +
>  /**
>   * xe_guc_pc_init_early - Initialize RPx values and request a higher GT
>   * frequency to allow faster GuC load times
> @@ -706,7 +720,7 @@ void xe_guc_pc_init_early(struct xe_guc_pc *pc)
>  
>  	xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
>  	pc_init_fused_rp_values(pc);
> -	pc_set_cur_freq(pc, pc->rp0_freq);
> +	pc_set_cur_freq(pc, pc_max_freq_cap(pc));
>  }
>  
>  static int pc_adjust_freq_bounds(struct xe_guc_pc *pc)
> @@ -762,6 +776,53 @@ static int pc_adjust_requested_freq(struct xe_guc_pc *pc)
>  	return ret;
>  }
>  
> +static int pc_set_mert_freq_cap(struct xe_guc_pc *pc)
> +{
> +	int ret = 0;
> +
> +	if (XE_WA(pc_to_gt(pc), 22019338487)) {
> +		/*
> +		 * Get updated min/max and stash them.
> +		 */
> +		ret = xe_guc_pc_get_min_freq(pc, &pc->stashed_min_freq);
> +		if (!ret)
> +			ret = xe_guc_pc_get_max_freq(pc, &pc->stashed_max_freq);
> +		if (ret)
> +			return ret;
> +
> +		/*
> +		 * Ensure min and max are bound by MERT_FREQ_CAP until driver loads.
> +		 */
> +		mutex_lock(&pc->freq_lock);
> +		ret = pc_set_min_freq(pc, min(pc->rpe_freq, pc_max_freq_cap(pc)));
> +		if (!ret)
> +			ret = pc_set_max_freq(pc, min(pc->rp0_freq, pc_max_freq_cap(pc)));
> +		mutex_unlock(&pc->freq_lock);
> +	}
> +
> +	return ret;
> +}
> +
> +/**
> + * xe_guc_pc_restore_stashed_freq - Set min/max back to stashed values
> + * @pc: The GuC PC
> + *
> + * Returns: 0 on success,
> + *          error code on failure
> + */
> +int xe_guc_pc_restore_stashed_freq(struct xe_guc_pc *pc)
> +{
> +	int ret = 0;
> +
> +	mutex_lock(&pc->freq_lock);
> +	ret = pc_set_max_freq(pc, pc->stashed_max_freq);
> +	if (!ret)
> +		ret = pc_set_min_freq(pc, pc->stashed_min_freq);
> +	mutex_unlock(&pc->freq_lock);
> +
> +	return ret;
> +}
> +
>  /**
>   * xe_guc_pc_gucrc_disable - Disable GuC RC
>   * @pc: Xe_GuC_PC instance
> @@ -911,6 +972,10 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
>  	if (ret)
>  		goto out;
>  
> +	ret = pc_set_mert_freq_cap(pc);
> +	if (ret)
> +		goto out;
> +
>  	if (xe->info.platform == XE_PVC) {
>  		xe_guc_pc_gucrc_disable(pc);
>  		ret = 0;
> @@ -959,6 +1024,10 @@ static void xe_guc_pc_fini_hw(void *arg)
>  	XE_WARN_ON(xe_force_wake_get(gt_to_fw(pc_to_gt(pc)), XE_FORCEWAKE_ALL));
>  	XE_WARN_ON(xe_guc_pc_gucrc_disable(pc));
>  	XE_WARN_ON(xe_guc_pc_stop(pc));
> +
> +	/* Bind requested freq to mert_freq_cap before unload */
> +	pc_set_cur_freq(pc, min(pc_max_freq_cap(pc), pc->rpe_freq));
> +
>  	xe_force_wake_put(gt_to_fw(pc_to_gt(pc)), XE_FORCEWAKE_ALL);
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h b/drivers/gpu/drm/xe/xe_guc_pc.h
> index 8a7b91ce1b3e..55fdb55ab688 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.h
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.h
> @@ -32,5 +32,6 @@ enum xe_gt_idle_state xe_guc_pc_c_status(struct xe_guc_pc *pc);
>  u64 xe_guc_pc_rc6_residency(struct xe_guc_pc *pc);
>  u64 xe_guc_pc_mc6_residency(struct xe_guc_pc *pc);
>  void xe_guc_pc_init_early(struct xe_guc_pc *pc);
> +int xe_guc_pc_restore_stashed_freq(struct xe_guc_pc *pc);
>  
>  #endif /* _XE_GUC_PC_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc_types.h b/drivers/gpu/drm/xe/xe_guc_pc_types.h
> index 2afd0dbc3542..13810be015db 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_pc_types.h
> @@ -25,6 +25,10 @@ struct xe_guc_pc {
>  	u32 user_requested_min;
>  	/** @user_requested_max: Stash the maximum requested freq by user */
>  	u32 user_requested_max;
> +	/** @stashed_min_freq: Stash the current minimum freq */
> +	u32 stashed_min_freq;
> +	/** @stashed_max_freq: Stash the current maximum freq */
> +	u32 stashed_max_freq;
>  	/** @freq_lock: Let's protect the frequencies */
>  	struct mutex freq_lock;
>  	/** @freq_ready: Only handle freq changes, if they are really ready */
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index 12fe88796a49..a6b897030fde 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -27,3 +27,4 @@
>  16022287689	GRAPHICS_VERSION(2001)
>  		GRAPHICS_VERSION(2004)
>  13011645652	GRAPHICS_VERSION(2004)
> +22019338487	MEDIA_VERSION(2000)
> -- 
> 2.38.1
> 
