Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28D39C3ABBF
	for <intel-xe@archiver.kernel.org>; Wed,  7 May 2025 20:03:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E596610E88D;
	Wed,  7 May 2025 20:03:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="StQ6YOn5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5285910E88D
 for <intel-xe@lists.freedesktop.org>; Wed,  7 May 2025 20:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746648210; x=1778184210;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=8FV59rBVxMsFDkf4PSO1Tv1ZafDVe83raPFTQm9U3lc=;
 b=StQ6YOn5rMxCL3xF3BVvoTBe0Cpgzm/HBNy2GmS0QjHH4aMPjCDwPf0q
 PuNw7PdvxqIAPHh0bdtunn5J0khpgG3qdVo6Tyq68g2YPdW0BKlEuiasn
 moUxLoy7efDb/4R5E3yHBtwXHf0/EY2Bk+OV7grZdjvNkxQZ8RDWRlfkg
 IKYSOffzUyOXkAxMCZ8u38Y1gq3T/sHHBRrlR/VyGDgg8oHIdkXE4x49d
 QnCOpgauKQnyYZ+h6DpAzkGn1xtLZYy0CcJPgygkIkc7y7VCKn0sbWjJw
 DO5VaRqBlGLzRH5fRszDdSdFS6iGaI6nEV3HNZm8OhMhJg/eKTmmipouu g==;
X-CSE-ConnectionGUID: NNvAZm+FS46Zixmnx2OU8g==
X-CSE-MsgGUID: I0T8Z/vgQcOKRLLpJeindw==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="48111780"
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; d="scan'208";a="48111780"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 13:03:27 -0700
X-CSE-ConnectionGUID: astXP6EoT7ad7CXME60XGA==
X-CSE-MsgGUID: 48P01aaOQwKiGUzvMztfhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; d="scan'208";a="136566572"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 13:03:27 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 7 May 2025 13:03:25 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 7 May 2025 13:03:25 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.42) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 7 May 2025 13:03:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MFU71PBf9dlhdFbOjC+0aHAj5Kc0Lm5MT2BuZAnU5+sk+PX1WQYTqaT/WLIxA42uc5TGk1Ac7K/ok2imcEQLxc97VpQUW+l8URTplHxHl4Y9nTcdL5l+P7h4bCnznuLfywrWAFt7yAkR8lv+9aks2Sv8ey6r85WAGkNwahVyNbbct5yzUxQmBBvz6IFE4dBY3HkGsHTNGEGKM0NixEm/UtlH51oUpdZOnS7GYzhlDEYetUb1F6oyi9fGfESSHdHmAyVBqSeCkm8PmhkTuhAJJF3EWZ1LWRE86UPvDAD8m+EugVvhDvyeXF2lgfk267qIycr1qkvXx9gpHfiwZkRUeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NsTIZRjEdPvRLmIidyC1ZjMwJSYWwds0uV2rl/lfnTc=;
 b=St/J3JYq/it2M8kjDRo2P3uHjTDXKriLM2coqebO/00UQpgaexV3FTj+h5cvsHPg0tp67FtVwZIpCmO5XDSQrPxFucfbQ04gyCmQNmw8LfoIqOiVyfAL2xv0LWL1edCbvPhyAubkYKW2ybZSJqHpDXkGLK4WiNr8rpkIX+8XZtoN8kj1fAyju8TiDZ3ddXImSuLvmk7W2cr7blKi2bisrAn1a4nJddPdbb1450M9gParYxbotfpz4Yo4gnKRt4lZUWYMFObI7My80CcJf8ye1ur4K/94N/jCb1OwIqVDORHLEyDwvdqlCN5hSFflpKG8vF4BLWR6iuDeCjL68wxXMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CH3PR11MB8185.namprd11.prod.outlook.com (2603:10b6:610:159::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Wed, 7 May
 2025 20:03:19 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8678.027; Wed, 7 May 2025
 20:03:18 +0000
Date: Wed, 7 May 2025 15:03:14 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>,
 <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v4 1/4] drm/xe: Save CTX_TIMESTAMP mmio value instead of
 LRC value
Message-ID: <xuiq2spalkm37cbz6pezsf2kfmie2kkpae4cg3laa34mmq72xx@bxklz5oinj2j>
References: <20250507013039.2043897-6-umesh.nerlige.ramappa@intel.com>
 <20250507013039.2043897-7-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250507013039.2043897-7-umesh.nerlige.ramappa@intel.com>
X-ClientProxiedBy: MW4PR04CA0108.namprd04.prod.outlook.com
 (2603:10b6:303:83::23) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CH3PR11MB8185:EE_
X-MS-Office365-Filtering-Correlation-Id: 739e36f6-4fb4-467d-c4b6-08dd8da235f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?LCrx0u5QHEOm3YMQL4p8nAic+rfAlm5iNYqxnnaNF271zTPzlizUW0zwOTYD?=
 =?us-ascii?Q?nipbFiNMZbJ1uCRb4XqXH/E2xcdKVaEuc6MAApYrk2xfxCaRBPOE6LIiyMCK?=
 =?us-ascii?Q?1McS0fNBuZPkKYWEdle+ZjoojKtzjJ/LwcTNeIw+nlw2PgsnevCOPA6BDhZj?=
 =?us-ascii?Q?sd5aY2kV86XnrgBg5yUG/D85ChBxclS1BfCvhwSTLD/6U3An9ILTKCbSx1Zu?=
 =?us-ascii?Q?Nlo0+bQ9ZLODWzBBQ7f4ex+gfuGaYu22028mZEtbc84vf4tlHC8juitSpXZ+?=
 =?us-ascii?Q?OorVnZ+H7CGkA61mIYJlyU0DAY+AY98g5EFKws7ejgjb4KBfSGrStToIGPH0?=
 =?us-ascii?Q?LVYWXSvmBv1gLcfrv71ANKkN//RCpF01OBcCTuKD/Bmm0zQ3U/k84dpTlhy/?=
 =?us-ascii?Q?LYcJl8o4/abR5ieANbTTKS9YUXFmiUBkjJ72TdCt8Sy702iDLdf99gVTGUZU?=
 =?us-ascii?Q?pl9ruYwUSdB1Xb+0JJVaFe1Jnigt29bKsaanU8Rpg3B77YHnTZPerTb1biPq?=
 =?us-ascii?Q?KT72kQ0qINHZ4oG3t6J0xzbMVWXmEW8+X0DRP39abgDUH+Vrbn1rBg15WdE4?=
 =?us-ascii?Q?jrFHn/KJk9oWYRrwbQj/NnA1MfOxSH82cqe37PDXzSihfv1qRCXmkBXVrMdS?=
 =?us-ascii?Q?+9cWdfZy2z90xrPKXinegMqHBYV+xyVHptSnGyqG/yTj3jSqWilUi4WiZzAP?=
 =?us-ascii?Q?UWbBIac+W6ookNO7w1GC9yoFeW8GT3J/MzDgsTDijMFz70raU0d+2/OPtG1i?=
 =?us-ascii?Q?fUQYqQR0VpUVnnULjMaLCfF0DQx6mXWpcFst3HfFdEy75Ex6j0ZVyTLceGMD?=
 =?us-ascii?Q?8xLMFF1Y+kM8hygvrBdl6G5jqO4lxflySJRdCDW4JL8RUSuAhM715udQy2KJ?=
 =?us-ascii?Q?xnbKLphRPYkSZtly4aLdfHnXk3e0kgpUOfjwWMYSt5xGvWlWFs+G65YdsiXI?=
 =?us-ascii?Q?GmQscO0+fxPjquPrOitJhwWRxbWSXiOtOmwi6So8v4l4tOQKDlCRAwGs1Ck8?=
 =?us-ascii?Q?G7O0zRE+KnZ+C/HWSP2BHwM66Mn2iSM+o9YsOViASbm9jYUKX9SP7uR3CwHd?=
 =?us-ascii?Q?JWHF0YndLNw0xExt6Iw7gxs3vg5m6XuZZOMpGcmSNF+53JqxA5I4o5Vy6eLF?=
 =?us-ascii?Q?k3T9zMp6jTEWjBu3cyRhmMs7+eYr5a0H5MCermYxypr6Zj1zRZ0cb2l+F0/G?=
 =?us-ascii?Q?kH62QTVag9m/OQXebCLETl4ibFNmVc7bcdqOS3zszITQizM6fU27TS1HP9f0?=
 =?us-ascii?Q?eR2urbE5ppwg6mluRpe6a6QYFa/KDqJUiXsRx74s27JTyi1QR6G0qn1TTBPF?=
 =?us-ascii?Q?tw7xshFeQea9zO6AtenecVpb8IeFlgkH+4MONBVj3wTTX+xgE/kk0m300SBm?=
 =?us-ascii?Q?2KVwfkQBIAA6jwxrRg+1b+RNbQpinbFE23GrHvn3sS7UjD70a8w0quRkFpVq?=
 =?us-ascii?Q?lgU6GiPL8SQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3UCTveinn8QyaoyD7tjkusQQPInuVBZIln4uL+r+KWc9u9QbaOSrLZ6ZzvG0?=
 =?us-ascii?Q?3O3N7X3MNNmdYQlEweICOsnHhf6zc5ig158mtfwmMMo7Uz8j8d6FC6ehvf+B?=
 =?us-ascii?Q?E6++oYFAnpKQ9ghpGiLgsbDjXN3myzT9qu3hNJdzui5mA0eVeUW6to+pFciG?=
 =?us-ascii?Q?50OHaOI9C0rZd/upqVa//uA/IJsDQ4wHNrQ7ysraUw8nbZw3DV3qnxXXUHUo?=
 =?us-ascii?Q?ttQ8XSZnhD5PoDFpPw3PA/baYIOKCV5OTNgFYRenNvaOnThMqJtkOxbR05Ov?=
 =?us-ascii?Q?QqYwQx2kSwVLY073jFsG4ohP0VbpFmSmxXIJSFHEQdvTSIQZXjsrEPk++0a+?=
 =?us-ascii?Q?r13UuP369D48xDnhM+DhdIXqTvsz05tlpv9Kv+lSFVaEE7Rpu1fIZB7GwsRZ?=
 =?us-ascii?Q?Zsez6e7f3kLAUedRr1XxZJ6kv3dGGN/zRPH2bxTtvwLA8t4GX8B/2lUzqlNE?=
 =?us-ascii?Q?XBj0egwNU8zwhxQ9i4cbbPtLc1tXQKY7pV1Kk1aR2aD3jTgCFSytnoUL6C9k?=
 =?us-ascii?Q?jsNeRz53h2WsHgOsmtHgX+/OhEKZY6LdYt+g6vktML7nbchu/7Z+Cg34VI17?=
 =?us-ascii?Q?AkCEbBUtjeU3oj9NRFSzNrccV8zkBZzM2JdKPqWarNXAkChoXQvlONRyB3V7?=
 =?us-ascii?Q?8+XM5zgiI8fbAgQ2+R7WFFUekRiOF2b2ZZEJklLhi636H1aEVb3uSzGxYce0?=
 =?us-ascii?Q?qsweqKuS+nG3n++WqWlD29fSmJg8wIzQ3NkomCtu0tAlzNxQhtrOe6lFo8kd?=
 =?us-ascii?Q?gaSpxAqVHIruU3+NYCIJTnuvKeXAV03Y6Zd/bSEnEATcpqfb3mhb2VocJ3hw?=
 =?us-ascii?Q?z1ybH4PJZQT4BkXCqKJQGAr58rAmObYDXJEQ7MwJRulZIHKZOG6qmXaNpdKw?=
 =?us-ascii?Q?LHbeD4jzMHCuh45/KDOUo/XTMA2+sLUpujcI5VZDmHazP2yHMMm3CmRu5Sqy?=
 =?us-ascii?Q?5kj62nj5UCXakHjTQYUtKYt4FhRCxzpeyn9Uu3SGOeA01sXllRbP4YjFpiXv?=
 =?us-ascii?Q?Zad+SXhDy0Yuh1Pq+eCz9/RaJ1fw+W2+zl/pz1hApEE1XLxp3lS/tyP3AjYb?=
 =?us-ascii?Q?ysQCUSOTr2jbcwIigsxHLW+uTEex72FCJ35G7aF9H6rwaIajZb4mfiuncdId?=
 =?us-ascii?Q?znm6wo4M7NER5Igw0TXHqlOntlpYfPsFuHmdJsPgXSSWtIj05Y6wWXuMLrC9?=
 =?us-ascii?Q?YsSBRiVVt0TPaEb+X5IxcgFZnLFSy74RfUAxGBcjN1rmYLhOnaTZ43H2ZMo5?=
 =?us-ascii?Q?4c4c9PfA2c5OMFWNd/ho7aqA0IqEsYybQjjeZCLanjSgqBU+mPGSj1Nk1Twd?=
 =?us-ascii?Q?xiXbhmOVPHHsQWUryxcHOKDudThicjWXXP9fIalHDvx6Ttbsx77H+T5bplKG?=
 =?us-ascii?Q?tjbA+/kvOH2h/mkwUo7b1RGWwYDQ6GRAcND4NNbkxca71y4Fec5DUz2LFHWV?=
 =?us-ascii?Q?c/KKooR+c4hMOShejpyTPddgEU22bF1tXmQu7c4PnyTX1+Aois30z5mqV0cQ?=
 =?us-ascii?Q?UerQElXuKMyCRlak4TBDsdVNEz/B2iNzeTuFUfFtr0TI87UXhEQ7Uj9QJJk7?=
 =?us-ascii?Q?t1XV7xSsscTQGh80S2BfeMnYyGoVXzAM2f4Ia5H/mXKPBfD1RLucZZx0flLs?=
 =?us-ascii?Q?9g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 739e36f6-4fb4-467d-c4b6-08dd8da235f6
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 20:03:18.8488 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bvVlzhg+B+hPVh0a7bicu32z0xZWc+DjuPWKiqlhZLMZBL/vwpDKrE5eTch/WtePQFNAlZ9II0VUjjQk8d3jMVRnthveQOX4Vvdz5HR6hUs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8185
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

On Tue, May 06, 2025 at 06:30:40PM -0700, Umesh Nerlige Ramappa wrote:
>For determining actual job execution time, save the current value of the
>CTX_TIMESTAMP register rather than the value saved in LRC since the
>current register value is the closest to the start time of the job.
>
>v2: Define MI_STORE_REGISTER_MEM to fix compile error
>
>Fixes: 65921374c48f ("drm/xe: Emit ctx timestamp copy in ring ops")
>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>Reviewed-by: Matthew Brost <matthew.brost@intel.com>
>---
> drivers/gpu/drm/xe/instructions/xe_mi_commands.h | 4 ++++
> drivers/gpu/drm/xe/xe_lrc.c                      | 2 +-
> drivers/gpu/drm/xe/xe_ring_ops.c                 | 7 ++-----
> 3 files changed, 7 insertions(+), 6 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
>index eba582058d55..9153a7cd2ceb 100644
>--- a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
>+++ b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
>@@ -62,6 +62,10 @@
> #define MI_LOAD_REGISTER_MEM		(__MI_INSTR(0x29) | XE_INSTR_NUM_DW(4))
> #define   MI_LRM_USE_GGTT		REG_BIT(22)
>
>+#define MI_STORE_REGISTER_MEM		(__MI_INSTR(0x24) | XE_INSTR_NUM_DW(4))

it should be sorted by __MI_INSTR(), so this define should be between
MI_FLUSH_DW and MI_LOAD_REGISTER_IMM.

other than that,

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>


thanks
Lucas De Marchi

>+#define   MI_SRM_USE_GGTT		REG_BIT(22)
>+#define   MI_SRM_ADD_CS_OFFSET		REG_BIT(19)
>+
> #define MI_LOAD_REGISTER_REG		(__MI_INSTR(0x2a) | XE_INSTR_NUM_DW(3))
> #define   MI_LRR_DST_CS_MMIO		REG_BIT(19)
> #define   MI_LRR_SRC_CS_MMIO		REG_BIT(18)
>diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>index 855c8acaf3f1..015b00a73c0b 100644
>--- a/drivers/gpu/drm/xe/xe_lrc.c
>+++ b/drivers/gpu/drm/xe/xe_lrc.c
>@@ -687,7 +687,7 @@ static inline u32 __xe_lrc_start_seqno_offset(struct xe_lrc *lrc)
>
> static u32 __xe_lrc_ctx_job_timestamp_offset(struct xe_lrc *lrc)
> {
>-	/* The start seqno is stored in the driver-defined portion of PPHWSP */
>+	/* This is stored in the driver-defined portion of PPHWSP */
> 	return xe_lrc_pphwsp_offset(lrc) + LRC_CTX_JOB_TIMESTAMP_OFFSET;
> }
>
>diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
>index a7582b097ae6..bc1689db4cd7 100644
>--- a/drivers/gpu/drm/xe/xe_ring_ops.c
>+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
>@@ -234,13 +234,10 @@ static u32 get_ppgtt_flag(struct xe_sched_job *job)
>
> static int emit_copy_timestamp(struct xe_lrc *lrc, u32 *dw, int i)
> {
>-	dw[i++] = MI_COPY_MEM_MEM | MI_COPY_MEM_MEM_SRC_GGTT |
>-		MI_COPY_MEM_MEM_DST_GGTT;
>+	dw[i++] = MI_STORE_REGISTER_MEM | MI_SRM_USE_GGTT | MI_SRM_ADD_CS_OFFSET;
>+	dw[i++] = RING_CTX_TIMESTAMP(0).addr;
> 	dw[i++] = xe_lrc_ctx_job_timestamp_ggtt_addr(lrc);
> 	dw[i++] = 0;
>-	dw[i++] = xe_lrc_ctx_timestamp_ggtt_addr(lrc);
>-	dw[i++] = 0;
>-	dw[i++] = MI_NOOP;
>
> 	return i;
> }
>-- 
>2.43.0
>
