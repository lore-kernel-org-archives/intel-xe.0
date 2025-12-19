Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13A77E66891
	for <intel-xe@archiver.kernel.org>; Fri, 19 Dec 2025 22:01:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEAF210F0E4;
	Fri, 19 Dec 2025 22:01:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="atK7qv20";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8564010F0E4
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Dec 2025 22:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766181676; x=1797717676;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=MiQ+u3RZracDMulIZftlf3JCZGIPWEQlPcmwsCR7GwU=;
 b=atK7qv20InWOcaQCyaVffeNOHWZSmYvd8t7waxocEuwU7VPXQqHuqiJd
 Jf4BpAUcPqM6MqimNc0JupkoSka1LuiFVNqvo27Z/Q/4fcPm39Co0LMBx
 M6QIlL70oaxABxTkjr6LrsiuR/UnPRhB5nV8F/WCqEyzg10ijNIbCJE2Y
 rf/OCs3Djv1AvcI2HDEnCouzPD05lsFKRFSQdPe3n3TtkUjOQURu8F/xW
 +mADyTobUJcu4GfmzjRVBvYeWPO6UqsDzuFxB5bTmQYM8gjlyNtTOP5Yo
 H8O61yyTolGC7//5bN7Tge2zS5dn/zxDGEC7IZjq978sUJPnAPZM+gS1Q w==;
X-CSE-ConnectionGUID: 0Ua7m5dvQ5CXr+2xyhXnvg==
X-CSE-MsgGUID: +jCWm2/GSU2y/g09lyXlOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11647"; a="68039554"
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; d="scan'208";a="68039554"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 14:01:16 -0800
X-CSE-ConnectionGUID: eiD493nfQsy72kro6tyPAg==
X-CSE-MsgGUID: frXN3aiiSsOY6A7FjLglIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; d="scan'208";a="198226407"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 14:01:16 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 19 Dec 2025 14:01:14 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 19 Dec 2025 14:01:14 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.34) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 19 Dec 2025 14:01:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RBDPnNUm87mH2tiCEwNCquqxdNB4uDICTgZJPn+Wg9kkm9p4pEgxyJwVoyfauMuCXL4+DEanS4YWKb+JQfzSLKCJKyarJN9vKY3p3nO3JYAvUUwQ8WLFk+GkRkde560tkiwRX19iwQXcOImSUDM9tjnrOEI6qnbEqur1aFBc/kQpsu8h+TmYPM0VShkQ8z+abmQZiAVhNi2yIYXjdfEcjJ9K6IVMYJU8dPLxGLzsgBFFzmrdBg+q9wAlw3IGQhakCdZsL5xwebmrdnICxkFjCA6FHEfcwoDlz3TKmHYQSZoqdYm26w1zxeuFSH/UhhQJc+9WDUEiyWWY2bXxYsUMEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zuA/NXLbEmIAlLAebOFeL1cWUYEfZIJstU8lPGemVqo=;
 b=Hf6M+gzEh2gVIV9j6kn4PmZAmD+Li5iSe6vgANQinNA+auPgPscp0i5yrDZ2VTqoAli3/5h8B4ggqPqj6zrAy9PWx8eRwnispdzO4rB1PcJ7335jxQZKYIbMdX2voNPDHe5/Quv7GQ8LSmUnjgcLgj+bvqReomH7uws/epYr2PfTGV2UkjU17/xnLxH5mZaa1GFaisgUmrVYz7KMCapoDq/OlRFc6JIZ/4n2HU+S49ep71lnJ4MNN/wp67gcuiF8qr8U5dQBeQ8fzwBqNPgEb27RcC6+Jrut3SDPKswwn2QA7/ewoV5W5750XL1t2VrlDlXIOH6A42PCo+Uu+GDnsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by DM4PR11MB6094.namprd11.prod.outlook.com (2603:10b6:8:ab::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.9; Fri, 19 Dec
 2025 22:01:10 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9434.001; Fri, 19 Dec 2025
 22:01:10 +0000
Date: Fri, 19 Dec 2025 17:01:07 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lukasz Laguna <lukasz.laguna@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v11 2/4] drm/xe: Update wedged.mode only after successful
 reset policy change
Message-ID: <aUXLIynGVV5YA7yU@intel.com>
References: <20251215174613.3701-1-lukasz.laguna@intel.com>
 <20251215174613.3701-3-lukasz.laguna@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251215174613.3701-3-lukasz.laguna@intel.com>
X-ClientProxiedBy: BYAPR06CA0038.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::15) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|DM4PR11MB6094:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c280934-6b31-4adb-c026-08de3f4a1e33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?buXflCRUi+b+wwvkxGTw7+MICZla5rb8KrP3nb8sxPW6il1PkiTtsspSjMFp?=
 =?us-ascii?Q?eHk3NIgetTCsWpeSOp7f4f3q+Z5VTnj0r3HUW7FAa57L+iFDwZ/Se+2oIyt3?=
 =?us-ascii?Q?j77VBPEFhkaXQXTbclDmW4fsJ6XD/NH0DwHpwGrqEJkFmuaEz9tu46SEl1FD?=
 =?us-ascii?Q?oavktbIkPAgPsqKEY2grjFXLje1YVjOOPOjFlUZxbal+mMpaddDBXWUDuVk6?=
 =?us-ascii?Q?XkuE+QOrA1ciWQq2h3TToKnThGv88t67wfLHzkqg8ABdVZWUC0mja7pecIYU?=
 =?us-ascii?Q?edfJQ6tNWikEoOofJmMn3b+qJ07+ksYXrLoM8q78RlxRoF9Ze0aVJotRhcAN?=
 =?us-ascii?Q?IaKW4+ou7Z1tFJtfXMtremAaJRoHHoV3MMvlyOz4s5Hw0RoucU71ew3nuDfO?=
 =?us-ascii?Q?qi6FoZeIbzhKl7mevwzC5PiPksY0sRxDMm3vp7ORzzCV7wI2Rtl5ZPbeiBL1?=
 =?us-ascii?Q?ONMHDN1Z9SSUb/PWyY1R3JzuWy9FqbxhjFDIWgbJEugASz0XQValNKMcFqwx?=
 =?us-ascii?Q?lJFleFaocn1BmzZT/wbFDMkq7QXA9+5ySRuZiU4UxpmWNlJpMEC/bFDUus9m?=
 =?us-ascii?Q?LLJtRYwunz/RaWowKtSc2TOyE0RQp7sXeT26+ksVGU6z3KG2MEk1MlqHZ3kC?=
 =?us-ascii?Q?BpjTfsUZgp2XK7N5/upufePkIxcE5sIaTISRi8kHuZjD/saHjHmuf7pXGAp/?=
 =?us-ascii?Q?GaPNk2sHtae803AAI+eh9NGkdGrtkTlXAaJuPOolyAmMtpsE28JPPzuXURx0?=
 =?us-ascii?Q?Q8xYr+Iam6cH4EQOvuiqEHUv83PiaOAcYOH2FZUbtGVvpJefXbcJFvrJUQ8C?=
 =?us-ascii?Q?foRZBxeFrXt9lvNft2vY0CUyI+T8YGoyh4o8ihEroyFbViWQwVCYDxpCADrr?=
 =?us-ascii?Q?GrTq2CQnAtIjZMnxF3OeVIlqWkACbViFt8WGQsZYpKZGpRy343uPXaZYlu7M?=
 =?us-ascii?Q?hPBZs29Kx+qD0iuqpBBI5kVPtEf042F3U4xG65Vt7dIqGwa1utMrA2mM/bJ9?=
 =?us-ascii?Q?nqaG0/8hJg8hg6OE81RfDHAT+fRZm+ICZSzLfJOS7j0v8ROinwJTEYZMvlyz?=
 =?us-ascii?Q?DlXkTlaFXVEM7x6hUK22Ku5LO/rPqnxuYzLhLZmx0bT3ZBS1FXYiqO9wnb8J?=
 =?us-ascii?Q?m5pAxBkNFLSkcqelgYW4XA6t+gyRdpFyjBnXjFguJPGglOdZY0XRSi7GAIdB?=
 =?us-ascii?Q?iq5ZwU+dXtsM7IvNroB68gWyGpLK0ScVDk5q79uJjqtjW7gODJ+gPbbm75Wp?=
 =?us-ascii?Q?5assK1RglSeZdrG9SpG6+LLYdpNykMTsBQc/CbziMgoleGDnREWr8DT93GwG?=
 =?us-ascii?Q?noHvzi8vb8ojFl8Wh/NXSZYyB8HAvTJ6R/9bP6v7xMARxC3V8/osA9PtPo/K?=
 =?us-ascii?Q?/dK1prKTLiNMYtqYplVcpjhXU6QlCRCOvhLwdTIvfTvTvMPP7IFy2LYEhHgu?=
 =?us-ascii?Q?vLf2IM/33/+2VWQBKAq9JR0dBTjyh8zg?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ebLQvvG3Rye+jp6QwaIKwrFlsjlQiwuJ313wJWC4DYXU0hLyTebnO0kYDO/6?=
 =?us-ascii?Q?ZpUYiLb3KAuPK+tLmH7ncOL1prTKEYNHZmwDPCJTcnTOHQFs252XQ3lAjuZX?=
 =?us-ascii?Q?qmYrp1vsMgfbhapSE97tZoyIlGf1kCmtBjTrDPB2yRjr4eEC0VMU/TfWHt37?=
 =?us-ascii?Q?+8ddq/2o3bOlC45pmiWQflXJFrwjGSRxm8Mado+e26Gt3kknObHRkpIvjcjo?=
 =?us-ascii?Q?6lhQN6deVdcM6K6nf4OFlV6B6MetUJVgfB+Sv/MmB8aSCRvsWS45/OiV67Vm?=
 =?us-ascii?Q?x7DEG626HMO0pYercOYtxSTN6jQOPqB5JVB+WPZG4PS5C5yTQuHUngEOsEtP?=
 =?us-ascii?Q?Jv9D0D4zrTCptR7aRtRx5zeCAV5LcKx3MCdbNrS5DYZFR7pb1SjfNtMB105N?=
 =?us-ascii?Q?fV6bH+LQlv9qcJ++0/KaRpPuE8hJaBCV2GIPa2+nyJ0Xd3TIFCV7tCh1pBlM?=
 =?us-ascii?Q?QCU4PBK1cT5DSk2kYUa85yhJtMuvRv7IkHmdXErAcj8yH4lOQlI7ETpxvv2o?=
 =?us-ascii?Q?fUZFwJZGp6Sha7mFgipfmDa0m7laFkZyaX3zTGVZWNGWBp4FA7QfoOi8DiAO?=
 =?us-ascii?Q?mi5qmY5CLsaHmoLQFIUKhvwTebydI4JeV0QHOrTRpD9UtrbQk3ETIxSV6Q7D?=
 =?us-ascii?Q?yjw0Qpl54Xsg/kjTDdY0d1EDTS2pRjMBmGdxbVXDJduXbhUbFDpGqK95pd4K?=
 =?us-ascii?Q?pwDq6YVlJCUBZiktPhYh1qaQvTA/Yo364Nr9Ue3p0YAGQ5HZO87UMifW9qnH?=
 =?us-ascii?Q?M429Tn8IEeCzpZSPa7xuR0nunp8BBOD5i7DfwNug0A4ep9B8qzG3Yu/jZhq5?=
 =?us-ascii?Q?5y5idZXB/T6kkQV9r/3mvx7ZAmWVrkaSk0fFELYKKCrwssthTqI8uVFFc9No?=
 =?us-ascii?Q?LxhIEFCMbkRe+KF8bMdCKfvRgIC3fIoNFa11xxs7FgibViqfIu0W/np91mEx?=
 =?us-ascii?Q?qmbcKj2KKlNOaFpXhU+DslfVHPJuBSBcODFf1RRzy4nXjGmaOqspD/J6gnn9?=
 =?us-ascii?Q?vwo7hb3aVpZHDBqB+rorS/cY4fucou7GwKIPRqH2BAE/BtyS2NePse9id8GY?=
 =?us-ascii?Q?U9aPBCezYfijYvcnezLEyW2RVffEzy9NzWvACQVJgQbzmq8oxZ+uGdYc64uK?=
 =?us-ascii?Q?vhkf9p/dgxJdLy/XWPBmnUQ4aSi4TUi2nxW+Dig7uFC5feu9YKrsqWJgTKw0?=
 =?us-ascii?Q?o16udb7G+Tiozuav7pBeVvcpQNbvPRK3MmgC99EfMuqaMSfMkl9B9xP74dyG?=
 =?us-ascii?Q?i9KPr/RebRSIU37DkqHOqdgmY23qe/5qr/evpVtAoF8ftRpj9QDu5w0EeDBR?=
 =?us-ascii?Q?QeJYM63hg8zBd4DHMLaJc+dRK3ljURuEeNwZ4NjDMI31cMFShJizlJNexofk?=
 =?us-ascii?Q?grAp3uvbVeQYNSCwG4uJITMKalFmUED5oEmr0lXHoDMM0Uq1CInmKTTKWMZ5?=
 =?us-ascii?Q?icJy3Fl9mU2hLEU5b083aQpbm0jJp8bHmfccBLr6wKSq9cDJijfwySx/jqha?=
 =?us-ascii?Q?GyviXKPhESLq8IzL86ZwF+4YIIXrATSiZqI+M31UvstxfBLSU3UedcRIOm/1?=
 =?us-ascii?Q?GXNBRzVSjJGgaW+lAKMKsNYh0pFasEIqSdV0OfhJRmQZP7ThLhFddMCzxj/6?=
 =?us-ascii?Q?BFhVEb17JgO1rcQaop3NeH4iQtX/ptR2nu+Qymm2nCvEgixV0sUbWWs+iAtR?=
 =?us-ascii?Q?IVWMRuvKWpcf9hxlkKFKxhFtAZSGczVwx+wsfugGL40Q2Z5TqzHjUL0Z8gfK?=
 =?us-ascii?Q?BxLshRa08w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c280934-6b31-4adb-c026-08de3f4a1e33
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 22:01:10.1708 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H4ZP8Gm4TIE+xgY6+txDrKw3OrGUiwrJNmxCnZQ2O35BxYle0EKI8e5wulJf01NbFQd1jfD6l91o9BHzCyKTyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6094
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

On Mon, Dec 15, 2025 at 06:46:11PM +0100, Lukasz Laguna wrote:
> Previously, the driver's internal wedged.mode state was updated without
> verifying whether the corresponding engine reset policy update in GuC
> succeeded. This could leave the driver reporting a wedged.mode state
> that doesn't match the actual reset behavior programmed in GuC.
> 
> With this change, the reset policy is updated first, and the driver's
> wedged.mode state is modified only if the policy update succeeds on all
> available GTs.
> 
> This patch also introduces two functional improvements:
> 
>  - The policy is sent to GuC only when a change is required. An update
>    is needed only when entering or leaving XE_WEDGED_MODE_UPON_ANY_HANG,
>    because only in that case the reset policy changes. For example,
>    switching between XE_WEDGED_MODE_UPON_CRITICAL_ERROR and
>    XE_WEDGED_MODE_NEVER doesn't affect the reset policy, so there is no
>    need to send the same value to GuC.
> 
>  - An inconsistent_reset flag is added to track cases where reset policy
>    update succeeds only on a subset of GTs. If such inconsistency is
>    detected, future wedged mode configuration will force a retry of the
>    reset policy update to restore a consistent state across all GTs.
> 
> Fixes: 6b8ef44cc0a9 ("drm/xe: Introduce the wedged_mode debugfs")
> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
> ---
> v11:
>  - add more detailed commit description (Rodrigo).
> ---
>  drivers/gpu/drm/xe/xe_debugfs.c      | 70 ++++++++++++++++++++++------
>  drivers/gpu/drm/xe/xe_device_types.h |  2 +
>  drivers/gpu/drm/xe/xe_guc_ads.c      | 14 +++---
>  drivers/gpu/drm/xe/xe_guc_ads.h      |  5 +-
>  4 files changed, 71 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> index 0b65c3940f41..f62174f7035a 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -254,14 +254,64 @@ static ssize_t wedged_mode_show(struct file *f, char __user *ubuf,
>  	return simple_read_from_buffer(ubuf, size, pos, buf, len);
>  }
>  
> +static int __set_reset_policy(struct xe_gt *gt, enum xe_wedged_mode mode)
> +{
> +	bool enable_engine_reset;
> +	int ret;
> +
> +	enable_engine_reset = (mode != XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET);
> +	ret = xe_guc_ads_scheduler_policy_toggle_reset(&gt->uc.guc.ads,
> +						       enable_engine_reset);
> +	if (ret)
> +		xe_gt_err(gt, "Failed to update GuC ADS scheduler policy (%pe)\n", ERR_PTR(ret));
> +
> +	return ret;
> +}
> +
> +static int set_reset_policy(struct xe_device *xe, enum xe_wedged_mode mode)
> +{

since these new functions are in a generic debugfs file and not
in a exclusive wedge component, it would be better to identify wedge in the name
of the function.

Or perhaps we are in a point deserving a xe_wedge component?


> +	struct xe_gt *gt;
> +	int ret;
> +	u8 id;
> +
> +	guard(xe_pm_runtime)(xe);
> +	for_each_gt(gt, xe, id) {
> +		ret = __set_reset_policy(gt, mode);
> +		if (ret) {
> +			if (id > 0) {
> +				xe->wedged.inconsistent_reset = true;
> +				drm_err(&xe->drm, "Inconsistent reset policy state between GTs\n");
> +			}
> +			return ret;
> +		}
> +	}
> +
> +	xe->wedged.inconsistent_reset = false;
> +
> +	return 0;
> +}
> +
> +static bool needs_policy_update(struct xe_device *xe, enum xe_wedged_mode mode)
> +{
> +	if (xe->wedged.inconsistent_reset)
> +		return true;
> +
> +	if (xe->wedged.mode == mode)
> +		return false;
> +
> +	if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET ||
> +	    mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET)
> +		return true;
> +
> +	return false;
> +}
> +
>  static ssize_t wedged_mode_set(struct file *f, const char __user *ubuf,
>  			       size_t size, loff_t *pos)
>  {
>  	struct xe_device *xe = file_inode(f)->i_private;
> -	struct xe_gt *gt;
>  	u32 wedged_mode;
>  	ssize_t ret;
> -	u8 id;
>  
>  	ret = kstrtouint_from_user(ubuf, size, 0, &wedged_mode);
>  	if (ret)
> @@ -271,20 +321,14 @@ static ssize_t wedged_mode_set(struct file *f, const char __user *ubuf,
>  	if (ret)
>  		return ret;
>  
> -	if (xe->wedged.mode == wedged_mode)
> -		return size;
> +	if (needs_policy_update(xe, wedged_mode)) {
> +		ret = set_reset_policy(xe, wedged_mode);
> +		if (ret)
> +			return ret;
> +	}
>  
>  	xe->wedged.mode = wedged_mode;
>  
> -	guard(xe_pm_runtime)(xe);
> -	for_each_gt(gt, xe, id) {
> -		ret = xe_guc_ads_scheduler_policy_toggle_reset(&gt->uc.guc.ads);
> -		if (ret) {
> -			xe_gt_err(gt, "Failed to update GuC ADS scheduler policy. GuC may still cause engine reset even with wedged_mode=2\n");
> -			return -EIO;
> -		}
> -	}
> -
>  	return size;
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 20a847965b20..e41f82518d75 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -626,6 +626,8 @@ struct xe_device {
>  		enum xe_wedged_mode mode;
>  		/** @wedged.method: Recovery method to be sent in the drm device wedged uevent */
>  		unsigned long method;
> +		/** @wedged.inconsistent_reset: Inconsistent reset policy state between GTs */
> +		bool inconsistent_reset;
>  	} wedged;
>  
>  	/** @bo_device: Struct to control async free of BOs */
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index e95604416f2d..25ea17a74a64 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -983,16 +983,17 @@ static int guc_ads_action_update_policies(struct xe_guc_ads *ads, u32 policy_off
>  /**
>   * xe_guc_ads_scheduler_policy_toggle_reset - Toggle reset policy
>   * @ads: Additional data structures object
> + * @enable_engine_reset: true to enable engine resets, false otherwise
>   *
> - * This function update the GuC's engine reset policy based on wedged.mode.
> + * This function update the GuC's engine reset policy.
>   *
>   * Return: 0 on success, and negative error code otherwise.
>   */
> -int xe_guc_ads_scheduler_policy_toggle_reset(struct xe_guc_ads *ads)
> +int xe_guc_ads_scheduler_policy_toggle_reset(struct xe_guc_ads *ads,
> +					     bool enable_engine_reset)
>  {
>  	struct guc_policies *policies;
>  	struct xe_guc *guc = ads_to_guc(ads);
> -	struct xe_device *xe = ads_to_xe(ads);
>  	CLASS(xe_guc_buf, buf)(&guc->buf, sizeof(*policies));
>  
>  	if (!xe_guc_buf_is_valid(buf))
> @@ -1004,10 +1005,11 @@ int xe_guc_ads_scheduler_policy_toggle_reset(struct xe_guc_ads *ads)
>  	policies->dpc_promote_time = ads_blob_read(ads, policies.dpc_promote_time);
>  	policies->max_num_work_items = ads_blob_read(ads, policies.max_num_work_items);
>  	policies->is_valid = 1;
> -	if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET)
> -		policies->global_flags |= GLOBAL_POLICY_DISABLE_ENGINE_RESET;
> -	else
> +
> +	if (enable_engine_reset)
>  		policies->global_flags &= ~GLOBAL_POLICY_DISABLE_ENGINE_RESET;
> +	else
> +		policies->global_flags |= GLOBAL_POLICY_DISABLE_ENGINE_RESET;
>  
>  	return guc_ads_action_update_policies(ads, xe_guc_buf_flush(buf));
>  }
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.h b/drivers/gpu/drm/xe/xe_guc_ads.h
> index 2e6674c760ff..bec404dda56b 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.h
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.h
> @@ -6,6 +6,8 @@
>  #ifndef _XE_GUC_ADS_H_
>  #define _XE_GUC_ADS_H_
>  
> +#include <linux/types.h>
> +
>  struct xe_guc_ads;
>  
>  int xe_guc_ads_init(struct xe_guc_ads *ads);
> @@ -13,6 +15,7 @@ int xe_guc_ads_init_post_hwconfig(struct xe_guc_ads *ads);
>  void xe_guc_ads_populate(struct xe_guc_ads *ads);
>  void xe_guc_ads_populate_minimal(struct xe_guc_ads *ads);
>  void xe_guc_ads_populate_post_load(struct xe_guc_ads *ads);
> -int xe_guc_ads_scheduler_policy_toggle_reset(struct xe_guc_ads *ads);
> +int xe_guc_ads_scheduler_policy_toggle_reset(struct xe_guc_ads *ads,
> +                                             bool enable_engine_reset);
>  
>  #endif
> -- 
> 2.40.0
> 
