Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02DCECA1012
	for <intel-xe@archiver.kernel.org>; Wed,  3 Sep 2025 22:06:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBB2110E96F;
	Wed,  3 Sep 2025 22:06:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OQ1c0Uvm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4985C10E95E
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Sep 2025 22:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756937209; x=1788473209;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=VzwIQEeqUys2dtq8JfQ2B5o299P+umGyHk2VGoMt1S4=;
 b=OQ1c0UvmoOLZzs+v9gJxtVbbFHMMubv06hR1EMqNCBqcKRLRoQyXAs2B
 yDPwX6nTwGQhELTUiB7yOzbTMDPKYDtOFgu/p/nQRbBDks7s4wY9kzgR1
 IfM4j1t9kZpZuQfEZz61JF0TRBNApPs35+YtS60oMNt5Hcqm7RMpTx2KE
 LTBW1debjmP0QhR93CvzErBXh9SCHyAJnMYOVsPk8i7WDZuMEGGLe+ytr
 5HVIgMeLNxpjmxQu9RCmx7+qlqEGM1+21N6HZh0SBn+v0yhTp1xrdt1hv
 HtzYhtpHc9NbIYgzoge8O+Bshf4IC7v7v3y2jSPXFESYzECddYgV7msNU w==;
X-CSE-ConnectionGUID: 75zjZ3BeQt2ykgB2VUsTow==
X-CSE-MsgGUID: CVv3OcupTiCwUyH7VKT6/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="58298327"
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; d="scan'208";a="58298327"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 15:06:49 -0700
X-CSE-ConnectionGUID: SiTEMD/6RlGS6UPz/sZPVg==
X-CSE-MsgGUID: NIU+2OaoR4mkWhwMI1s8vA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; d="scan'208";a="172543383"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 15:06:49 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 3 Sep 2025 15:06:48 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 3 Sep 2025 15:06:48 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.78)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 3 Sep 2025 15:06:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mXrnt7kt0rEEXrY3hZ7nFTZnQ+kvtlggbR8STg84Lh0iid3WWeBmvlzTaBP7ESaY9I1FnaSPSTTM/1S423LsXSRx5yZMElcIRuL9dv0E485mmk5rdkwPJr8NJUmYf1c7brm/1G4+i+ahOcvNOhcG1OlVsgIAK1BfkY2pGLKvIshDfmydp4ELwjepArkRvugkSZXg8kK5bIOv166uOkNcw2aS1ghqwC0Ep48GaAw2Fr9tKjpZOWb0myCPk6g8eAiMRKLU72vEd+TWIyyw2icu6fZiHd4uzMkhgmftA8f0Sltq/T+LcWLkL+sO6KqbN48d+g5BnV/G7iJmM95VxEjYNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=neUTR2sGbraNLofNntPa+mG0Ys5QkOCtwqmkHPgRcPI=;
 b=l0wQ55UsRuHclw4rtTMyEGRc5E4W2p5F+2Gfi4BMqG+D2DnlrbvRjyaUFlYSv24+NQggQSMWo0Jg42H/w36MPyrv23429/AfzZ8L2C0bOzGmSdVwtvC2PqcEjEAyFHwfQhXPaioVDIRk1X/p4JMRiH6qIqh3wgyKvmRq6TyO7HuRmoymeEjtzwbIEmBZ6NcTJYx+EuMiUWmiZKTbPOz/zujLXNJoY2VlGNzP8nx6tZh33b5TbSMlJK7C6z0hqf/+A1sVY110KOTnUDt0acheb6Oessfk2nuDxGz494oPpGWFGnAXMloV7AdSWfJoV4ljc0cEGZP5rOVMVDzkYlPdLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB8010.namprd11.prod.outlook.com (2603:10b6:510:249::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Wed, 3 Sep
 2025 22:06:45 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9073.026; Wed, 3 Sep 2025
 22:06:45 +0000
Date: Wed, 3 Sep 2025 17:06:42 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas Hellstrom <thomas.hellstrom@intel.com>
Subject: Re: [PATCH 5/7] drm/xe: Define verbose debug macros
Message-ID: <z5gfl545upuwn2eg4didegof4xdj55rxmo4g65tswpbijgqykj@omcamj3erznn>
References: <20250903213712.6364-1-michal.wajdeczko@intel.com>
 <20250903213712.6364-6-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250903213712.6364-6-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR13CA0114.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::29) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB8010:EE_
X-MS-Office365-Filtering-Correlation-Id: b106b24b-1ace-4ae8-0333-08ddeb362bfa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?eQ18Bc2QDbLpRZp75CColTj04u0ooU8S4ihO7pmXwMfGEV8hfjJRoRn0XD9W?=
 =?us-ascii?Q?CQBr8gXuXDL0jn/QL5jnNru2giRxu2hZT+uVx5ET7aReBvkXvbzawJk5/c/9?=
 =?us-ascii?Q?fPPLxLUGJo78AKGYndVwUu2YIfwFC6iQ0fhnaRYrEQ+YVy/AAKEQwinvdHDq?=
 =?us-ascii?Q?gZDelGKhe+nGKp/GkZgQKjNzM4g/LWWjifPph5pwoSf5g0mkDEEdPDMHOaPz?=
 =?us-ascii?Q?8NFpAGsCFIVOqGDkNalvpUwfrxqNHj/Ieq6sDX4n3nCIz7DDeHJcToAWTsJr?=
 =?us-ascii?Q?NU6X6JserqdAbLZ1Y2SFQdNFwh29/VmvZTSxDJST+MGaty+p9v7LEI0zu9f1?=
 =?us-ascii?Q?oSUfWX8qNFRYq8eFGJEYk8TkovvtlBnlJjIqsz9EGhqwoMVncY9T9EaTXZlZ?=
 =?us-ascii?Q?nVR8TbocsPghcwjsK+kiWWl/C+Bpnf5tn3yCN02nvy13EMR33BQJS0dLv+ZI?=
 =?us-ascii?Q?22beG46+WVBpfZAA4aQanbEloE/ajPzuV+S+zMQbKyDkj2iRcl7kPjGnC47U?=
 =?us-ascii?Q?4L9XXTWBt3+H5MNcm47ITWrQjdQMnvT5HLWDvo72Vf4p8E4mXTfSzNVRzuts?=
 =?us-ascii?Q?4867oWkEy1b6yXCXYVzjCW6gyjzlGapUN7AKOhNrjGSGmt8I3aq6rlAAuIHs?=
 =?us-ascii?Q?gSDpLGihgBQ9oImSVgK2kXLAziJJXbOG10DcGPVNhWxePR8b4DdJnts2ws+w?=
 =?us-ascii?Q?YLoQ+m2T8pA9BbbQcEyr2/hpZ1mG1XU4z72Xtt9L3n5RD1svviES1ZKPprEi?=
 =?us-ascii?Q?WA16cPhlrvuzpu3s8liXuohOyTLGyJ6JQyr5cVwI+sOXAtIcSYu74CsDa1Dy?=
 =?us-ascii?Q?vh0hevcNpx2LijbM9faWrEtD2RMUJuLSwVuYizkyuFeMS+1590Sszh7+Da8U?=
 =?us-ascii?Q?2zjBGiRp41Gv7h63W4tV76RiayUHT8ED9WQDb3uXo/SM+nzPYMwkpgOGDW/c?=
 =?us-ascii?Q?q9ARW7K9fkwtPW6kO3WnE0jokIKTmIrKfy11M+8xDPUJC2e8HueJzSNHf9uy?=
 =?us-ascii?Q?7vbDy28qhaK8WGbnuGq2lO0siuvtWERoOeE3YziCmiyAcRfoZONsD1dFsoag?=
 =?us-ascii?Q?+6NfnU2ghJCYCoCGVKLQZKM0US2IDfu1/MsHJMaqr5qkqV//tl2v+4bCX7mB?=
 =?us-ascii?Q?sIyGIc5t/oP4BHAQcCBDrdo82O1VjXJOpgdz5riv56bgv2RqKvWfmPK96pgJ?=
 =?us-ascii?Q?Quxd/n52fbjxhMN1mactRk/tx4REEN+xYxiHv3L5cY99mJeEAYreK7+UmHtF?=
 =?us-ascii?Q?qdJDol8wJCv5C8CRZWw7xLUboBJwN4SMbWCqRvRFRFvIkRDdakCpSo4KKxU6?=
 =?us-ascii?Q?VE4Ks9YU6x6YHR1uX0eDffOrhGmanDPBKbc/iukESnzZDBAUsq+DRxm/3oNq?=
 =?us-ascii?Q?yKGoEIsrqgSoMWZzv7OBTIB5EYFuiE8ZulyfL0EzftT0lf5IfrOS4ZHtOYEj?=
 =?us-ascii?Q?Od2TKYOapJw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uyeGLFlPOx6a7yCH9jb1KEGedOUiX6XirYnhDsn3GRryR+DXBm2lSLkYlnR6?=
 =?us-ascii?Q?FcmS1TvDCPcn+QshpsnVHnFwzFl+pO9b3TIasV5BuSUUGrU0N95Pr+J6qXU/?=
 =?us-ascii?Q?JK1DRH9UXLaWKbOzcIDeNHkIOJKnbG0xeA/8PF55/1P0B9+UG8jQchvD12Az?=
 =?us-ascii?Q?Tr4LRXxZ55EPiOSNAgPzqg7jkgSSomJuJY3pohGDS66zgCRCu430Zh2hdjTi?=
 =?us-ascii?Q?KbuPcAnLlk/FX3YicZQh7EE34kWrHgvtUbBEpi8AjzWXLf5mlAZ5Qtu3BH0k?=
 =?us-ascii?Q?1Ll/C9OFazKpGtCsuCiI86D9fgA/CyOETxDWce3Yq6++oiJhOxBNExJv2OmE?=
 =?us-ascii?Q?ZhQsa9WyGiqmGgVMSDkM1LQxPoqMmV+O6vc7SyzzH07ySRYY+GwV89X9dO6v?=
 =?us-ascii?Q?jKU7idpQGY8HoQDmb1ruzrVZVqsO+lVSqDZ+q7rXooun8/NSJUxX4afJbrC0?=
 =?us-ascii?Q?wRUI9kt05DFhbIRIHOxEwXQ4yNzMExJrq/Nf+rpNToP8kAGpLEhZYnUb+0GK?=
 =?us-ascii?Q?n2UoC2bplkBf5gXeAfULCqsFNkUcwQ2WWnoyck3l18W78YwQINo3vDFyGRXH?=
 =?us-ascii?Q?FttFuvuE80f4cnGj62KwgnoBeVf06ZGUWHAnGHW7IG5cclJW99wuM+ykCm2M?=
 =?us-ascii?Q?bhAeDhYWdKVZ9qtOJf0oyZhcdZfPK/IpVC5AJ+BOSf874jHzu9hFb1Hp7r1Z?=
 =?us-ascii?Q?kpSp8MHi6oehRxpVgiWq86wX6E7j7sNWQBuH9fsspKCWpJZgbYQdhnGdiPj9?=
 =?us-ascii?Q?K14a1t/GYxNjZ4DbKL2NWveekP/9pd1b1j2ZffcURC11Cd8dYsWNRhBhqS+1?=
 =?us-ascii?Q?Uwit7UtncnlYrqiXOh+9KIL4WEjWahcGHEcaDA1be7FkeC8SHLp2EddTPVhH?=
 =?us-ascii?Q?i41eOvLDIOzQH29YV1i2iHoi6PqJZyZcsw1S4fjTcpd3QT130VezxWAUWZkl?=
 =?us-ascii?Q?BlRW8Y1A6FeKcBjbSp8w34qqGy68HCpNZwxN5weGbySO7itSb5a5/VVQ1oRJ?=
 =?us-ascii?Q?J1tEpJnSZom4psk4CcIQlq7Aw/yGbJLSQWszAL3wSCivxfVp3DYJe0bH8Cir?=
 =?us-ascii?Q?jH2/MqEOleTjPJ7bNzkQSuk/Roruvuk22CDRXutlPDDVVtmQEl8qxbsJKY+A?=
 =?us-ascii?Q?e/EBNxI6as9p9sylq2lmCdP9qGOWzutBJ5iysRXOyFPKOINzqb5L6R47tavY?=
 =?us-ascii?Q?zmySlMQAme2IgsM4bZQmJD0HdhW+HFkPkDyeo2iuC1NjDMgZLyoLIiR2zTgG?=
 =?us-ascii?Q?XWBt9zByYgtL+2ZmpBdIqAePNlL4IAuoJx1MyYD1jJ0whZo9eYvAkjXuctiY?=
 =?us-ascii?Q?EFTF3Z4LUZJTtshnuN6LtU1tF+vzJ6PqYXZDc5HnvtUdHFGQceE1+M6hd7Ko?=
 =?us-ascii?Q?OMyLLRsRgz2+EF2g8ZzaNY0fbGdIseyvPhqKUCVxTBnZRjAjdBxK04EaX8Pu?=
 =?us-ascii?Q?ZFhmt7y9KJYSvXhfC5IF8ObhY0lHtaw6hUofgyuM4rtUzUB8NgUXFhn0cupy?=
 =?us-ascii?Q?WrCYI75u+mMfimMZb4i2oYcovPaWybbHEoCEIAs0sA2K/FHx/+DPImZ7oJfb?=
 =?us-ascii?Q?/Gs60oYRjnQBC8dRnknfjtS8glrfq2UfGmBseFuBaiRswO5v9WEwPa7K0un2?=
 =?us-ascii?Q?GA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b106b24b-1ace-4ae8-0333-08ddeb362bfa
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 22:06:45.7214 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g7UkQiFT3ZE/xWLN/L2jdpL5W7C5C8FwrRWMaBVgwhqOaNVPJy5/zD6wmSPw+/JtRQXoBNPWDL0PCuJnQLid9QDIBmecxRFhk6wOVP/DvFs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8010
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

On Wed, Sep 03, 2025 at 11:36:10PM +0200, Michal Wajdeczko wrote:
>We might want to add (and in some cases already have) some debug
>level messages that are too verbose and need to be guarded by the
>CONFIG_DRM_XE_DEBUG. To simplify that define verbose variant of
>our printk debug macros that will be compiled out on non-debug
>builds, in same way like we already did with xe_asserts() macros.

thinking out loud... aren't we going too overboard with this?
Looking at other places in the kernel we have pr_debug() and that's
awesome as we can simply enable it via dyndbg when we want, with the
granularity that matters for the issue we are looking at.

Lucas De Marchi

>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>---
> drivers/gpu/drm/xe/xe_gt_printk.h   | 6 ++++++
> drivers/gpu/drm/xe/xe_printk.h      | 6 ++++++
> drivers/gpu/drm/xe/xe_tile_printk.h | 6 ++++++
> 3 files changed, 18 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_gt_printk.h b/drivers/gpu/drm/xe/xe_gt_printk.h
>index 8dc4217ddb4e..69c4553d0f80 100644
>--- a/drivers/gpu/drm/xe/xe_gt_printk.h
>+++ b/drivers/gpu/drm/xe/xe_gt_printk.h
>@@ -35,6 +35,12 @@
> #define xe_gt_dbg(_gt, _fmt, ...) \
> 	xe_gt_printk((_gt), dbg, _fmt, ##__VA_ARGS__)
>
>+#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>+#define xe_gt_dbg_verbose		xe_gt_dbg
>+#else
>+#define xe_gt_dbg_verbose(_gt, ...)	typecheck(struct xe_gt *, (_gt))
>+#endif
>+
> #define xe_gt_WARN_type(_gt, _type, _condition, _fmt, ...) \
> 	xe_tile_WARN##_type((_gt)->tile, _condition, _fmt, ## __VA_ARGS__)
>
>diff --git a/drivers/gpu/drm/xe/xe_printk.h b/drivers/gpu/drm/xe/xe_printk.h
>index 691d3611b889..9ffa26c869da 100644
>--- a/drivers/gpu/drm/xe/xe_printk.h
>+++ b/drivers/gpu/drm/xe/xe_printk.h
>@@ -36,6 +36,12 @@
> #define xe_dbg(_xe, _fmt, ...) \
> 	xe_printk((_xe), dbg, _fmt, ##__VA_ARGS__)
>
>+#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>+#define xe_dbg_verbose			xe_dbg
>+#else
>+#define xe_dbg_verbose(_xe, ...)	typecheck(struct xe_device *, (_xe))
>+#endif
>+
> #define xe_WARN_type(_xe, _type, _condition, _fmt, ...) \
> 	drm_WARN##_type(&(_xe)->drm, _condition, _fmt, ## __VA_ARGS__)
>
>diff --git a/drivers/gpu/drm/xe/xe_tile_printk.h b/drivers/gpu/drm/xe/xe_tile_printk.h
>index ed951cdb08cb..33ebfd9722d3 100644
>--- a/drivers/gpu/drm/xe/xe_tile_printk.h
>+++ b/drivers/gpu/drm/xe/xe_tile_printk.h
>@@ -34,6 +34,12 @@
> #define xe_tile_dbg(_tile, _fmt, ...) \
> 	xe_tile_printk((_tile), dbg, _fmt, ##__VA_ARGS__)
>
>+#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>+#define xe_tile_dbg_verbose		xe_tile_dbg
>+#else
>+#define xe_tile_dbg_verbose(_tile, ...)	typecheck(struct xe_tile *, (_tile))
>+#endif
>+
> #define xe_tile_WARN_type(_tile, _type, _condition, _fmt, ...) \
> 	xe_WARN##_type((_tile)->xe, _condition, _fmt, ## __VA_ARGS__)
>
>-- 
>2.47.1
>
