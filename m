Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEB55CCD184
	for <intel-xe@archiver.kernel.org>; Sat, 18 Oct 2025 02:47:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A654D10E1DC;
	Sat, 18 Oct 2025 02:47:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FHtnCtKc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0593610E1DC
 for <intel-xe@lists.freedesktop.org>; Sat, 18 Oct 2025 02:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760755632; x=1792291632;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/UtwwbSK90PMVTRKgLZddeoTSMtkFJpXMG/KDLOK5OY=;
 b=FHtnCtKcIQ9ynEa0FGLtaOhBm7lY3WX7wCVjX4f6uwrx0+5IQ6CFhaAS
 +GevFS9F4+5Rib7uKhZj/gAG7PElTyGmJpfxoWibn5ZeezUNXI9K/ctOP
 /j5v92xBvZ4erdUeKdJ/kMRax9osyi8dFXel+QuPNtBgtupLWMAMZQiQv
 TYmAgyZeKZzoNnSoCah8LrGcGjlqhS2mOFpfxPPcFldO/U7XjCaX2CQxI
 WYUEkr3772+rL3UJNMscClhMB3RinM4LFvJPyHN4xVTFtT2voa90u5f7F
 bi/r6ns4z4x7/XQsPc33ieWG1oWdC5CGsspqfvR+XyXlwMWZHNn6eiO1Y Q==;
X-CSE-ConnectionGUID: iOgW2K6+QZW0h0BrSGxMrQ==
X-CSE-MsgGUID: DIlXkijDSdKoxbK1eAHeEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11585"; a="63012682"
X-IronPort-AV: E=Sophos;i="6.19,238,1754982000"; d="scan'208";a="63012682"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2025 19:47:11 -0700
X-CSE-ConnectionGUID: vusq7WxFR9+/ikFFMytm5A==
X-CSE-MsgGUID: nMEB6pIrTZu3WC4dP1b83Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,238,1754982000"; d="scan'208";a="187290649"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2025 19:46:01 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 17 Oct 2025 14:52:38 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 17 Oct 2025 14:52:38 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.61) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 17 Oct 2025 14:52:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eXahYp3seQN37oFlM0wGu4jZm2iavSe4FQjnMKXCChK8b7zJIg8KfzPFKx/2L777iEh/bLqkMeP69t24M+QCdDcdwPPS14lndS6aRBSRPL/Xw5I9IhxP9i5SiaySdRNxOCVCGMxhyln4EdJWAmkqcj9TKsXSkJGlv3w6AAxI0G7zyvwUF1H7rP5WXArqfHLZ9rD4wm/k0vVk9r/YQb08BQxBDw4ygf7WTlMc9gYx9WDLtYjf6AQeEUvrhb/Hgy6RqOWPES02SzrNYGH51ikksUou2Frj+CWAmWgLaoJBvtUZMGQQv3flGI8CLaiswHGb2K+WSs5TA4uiWt+7H2sfbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AlBg30M/n9JRo3IWSv/wBsyCWALVbkETW0bFxqqRVlU=;
 b=i2hxCSYNCKmlojSawalkX2N8eDv9BXanpny5V0Kn5LseWeLlH7/JgOXlavpl8edGDGVbq1n2okbsg+bl3McMfiO+d3HNw5KZDUujicGQfChtzEDY8Bi/T9foWWSglOAd2wUUi6qxdD9nRP9ov6cE4o79AHxPTlNGMj1Kk0lCKx9ywQ+ZOZSXM5vvcM6kumG21vFltLZNxklvVce9PLY+LCqrsPuDFal/Dx24cT4VxMSmaSwoKwkEjkS8IfpariUm4UH8K/oQusukqVQGkAL8ctTrzgzrGnHn7wdNIawUZA+/eHChMFeK2PrxTksUf/6plx3OuC80pkZO3+NTJ3NbEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB7704.namprd11.prod.outlook.com (2603:10b6:a03:4e7::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.13; Fri, 17 Oct
 2025 21:52:36 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9228.009; Fri, 17 Oct 2025
 21:52:36 +0000
Date: Fri, 17 Oct 2025 14:52:33 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Nitin Gote <nitin.r.gote@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.auld@intel.com>
Subject: Re: [PATCH v3 2/3] drm/xe: add xe_migrate_resolve wrapper and
 is_vram_resolve support
Message-ID: <aPK6obX8UPqWad8z@lstrano-desk.jf.intel.com>
References: <20251015104709.44476-1-nitin.r.gote@intel.com>
 <20251015104709.44476-3-nitin.r.gote@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251015104709.44476-3-nitin.r.gote@intel.com>
X-ClientProxiedBy: MW4PR04CA0159.namprd04.prod.outlook.com
 (2603:10b6:303:85::14) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB7704:EE_
X-MS-Office365-Filtering-Correlation-Id: ec5faf03-6b59-4393-e694-08de0dc77c05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5Bo30R9V3SPi4Vd20nG9uV9VBXpQw4coSdTtqZTVir76V/RvY8isE4AzUbqn?=
 =?us-ascii?Q?gdA45dfHlpS94YY4USxQJlCPurNl3JWjV3fwXZLfMLSRxvy4kqgtiIx0tWXa?=
 =?us-ascii?Q?uJ+WLGcZCZzCMm1cR0QWFIlnp7PkecgSFMOIwOezdFH5KG/NkU9BDYz7LhdT?=
 =?us-ascii?Q?GvtD63wmyVp0Ixg41Gjo2csE/MfQzvABJetXJpbbIzG5pgFOQZ/lr5GgCo3q?=
 =?us-ascii?Q?qruQuASF/UYKoR7WnL8iTbTqQV66VdwBVQCkTmQ4T3VNp2PpRPhCfA6uB0mU?=
 =?us-ascii?Q?jMpd2WwC6ig+X76pwyk6gJ8OXuKpZPZrZFLYslk0F3rj9sMYUIR1RvvvgTsQ?=
 =?us-ascii?Q?9rVjeUc1GhtXIp0YhqTbL7mVPDYGRbBJxXzI9ulCa+SOCOQDJ3NE+6fwfnk5?=
 =?us-ascii?Q?TaePSZZlxQ2+NTjLhC84jf8M/oEO19b3SFHjIq507o1m6WTPx+x3PqN8QsmQ?=
 =?us-ascii?Q?so3s5DmCdx61/KQOefhP7oXBM+NFKsVtZmBuGkwLfgaL3SIDgUUR/y0SQWXm?=
 =?us-ascii?Q?7RoWNvr1cLrNeK9JyX/qob6AzMD8cqTq5XTBM1zeeF0DSAMXLpb8cr5yesqE?=
 =?us-ascii?Q?rc8fdFgjJ2NgtiedbPxGM/KVzT+UWSc1G7xgqcg5w2liCzvhcD3h0cbmnSZ0?=
 =?us-ascii?Q?lSw7zJmx2K3fji+JppbjcQLw6efphAKhdFPgj6kcLs+9yTnhUdHxCOPSV2nh?=
 =?us-ascii?Q?jtujCosUDWZhKV2vU3rUBEVVMjFEi1VEDV0/bIBBk8WDkoMxmrqiqahT1i+v?=
 =?us-ascii?Q?xqG3DiFSHNtMx3YVljSUaFD3o4HExVRR8KzBX+vodQzTV+sMu9nLktqcc9eI?=
 =?us-ascii?Q?0cOZCOAk8514s2FcEBY6Wgxay9CrSLb3y5ih8q49dY7rdgp5JbwGyhH8STmG?=
 =?us-ascii?Q?iT5bDH9bx5T+XIGrOKSIk7o5/pTFi0VYGxlMV6Vgp5PRH1HKCDyg7+o30DbO?=
 =?us-ascii?Q?5kZGo3kAqF752kgutlzJQ8ken+x6xGjYucIWCz6R/8gFFiSF4nD2927N7yF8?=
 =?us-ascii?Q?AW8kSPYrAbGDJ5seIEGv8Klgl2RtajmH5OQksPdvWFKBFu89wy7hAtdoEow5?=
 =?us-ascii?Q?90aKm0SAM4/4b8ouPOG+gOK7/wrxtv/TsDNVq53slPmB292XKlrJAoIefXnG?=
 =?us-ascii?Q?dPvg9qBbLYz6Wl5Qa9S3TIhTWTzZ8wW+q/9EinhK7KUOQiGGrJEuTUEd29Nh?=
 =?us-ascii?Q?PqZlS/o7ppqO+P0lBkbAb8PN59tKgCkdr1zd1lx0ldDj6MIoesZtrsqRDWpB?=
 =?us-ascii?Q?45XTONZUSvYo4v/6VN8AC1NOehDqbvIoEB9cmBckwn1wvKM/UohTjYL+7Ygj?=
 =?us-ascii?Q?0xc4uiSPmE9jrhjG3yDIVD2VycR8m7PVGrZ0jiF0nB2uAH22FFDoMALbZ2WZ?=
 =?us-ascii?Q?GvI/vo/hswUgVYNj7fnqagP4wj9T1zk7xcu9yR1ml5riAbA3xvUlzG52mTq+?=
 =?us-ascii?Q?U8iFxaBxMuBHxos9EhkqIGeSlOul6tdt?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GANHjQN4N6F9+s35olt4rmwdAruup3Y/gfxmkReXKOIxEkMLy/zQx9jgYtaD?=
 =?us-ascii?Q?KIdNYIY6hJ/+xbvX80lH48qfBhsLqE+q1IGWEQx9NJlGDsh6kGlhSnwcXg3A?=
 =?us-ascii?Q?kSBGDg7vNpeUV/LYQAfGnpRI3lCg3kSuthkV/8DXBVl45CZg9oioxbeicBhT?=
 =?us-ascii?Q?wMhy0rm38c6lKpnE0hr1FbiPS7ak+e2VM+LSZKhY4g/uAmyPWKHdeMMH7J8i?=
 =?us-ascii?Q?yx9ckMP1OUbrOs8Z5oebWTTjPVCD/bFJRwnWF3Eb4KcfVC/WP5G/hSXZNlFO?=
 =?us-ascii?Q?QRDQGiJ5M1u86nDEIVnOwsNlu6T2We5nr52IehJ9se6PC9viAIn0WGjP/JIV?=
 =?us-ascii?Q?jh13WCHRR06bhZOLyRValfM4X7X8G3gjn9VddDyIHqyX/83UZy1rz/4Pk6/Y?=
 =?us-ascii?Q?A3A5eNjmcqj1ROQrPioBOPCal3PT+idLbtdO+J1Cg95EXjwcnnH24/x9IILr?=
 =?us-ascii?Q?0wP7q3HqDMNugUG2zI/XbsDstUHrcKY3ARjrJm9rhTdkNfSqE4Rq+gzAgyvP?=
 =?us-ascii?Q?IxF3MA9IRJbO5QhSRvaIMAHPd0juU+K9YvPg0cslOdTvrGZ+cKbGfyWTBAex?=
 =?us-ascii?Q?VZ+qWZpyCviSNaOVi+YAOHvLMZU7VC8f7KFkJ7yO9bUASJ1K6eJHCCzzdwRU?=
 =?us-ascii?Q?KV5jyl6dN51lFpU5R8foUr6DEQN2ACvj59FwpwsCcobXps1FIhjhHgSqcOWx?=
 =?us-ascii?Q?oJVCGYaFIOeA/IqiOP4au9vMRIQPHJyWIoAYIxXBrkVoeWFR253xh3aomVXZ?=
 =?us-ascii?Q?6U0RbeDmqJRRfb5CtdcLF6LNIWrNYi/UBtljsC2TFeuG2SQrL5lnyslfigWs?=
 =?us-ascii?Q?mWK7B0HH+xJU9EduPtl3RLXWG928Bh4xhM4x68BeGgH2LDG6OVpVwClGAB7A?=
 =?us-ascii?Q?wYgAXzMQe2R+g5b1KcxKL8Cpb8FDLX6hMp79rtB97snbYgjKFxqei0shp8NU?=
 =?us-ascii?Q?pL3IWO6GKCSUVYPWPlolLRsfiFF+hxmpCDWRP1i9lQgPo8efi4rSBTqPHU/a?=
 =?us-ascii?Q?3MfPnTs3fLha6mEVL7fc/qPlT/C1UwCwj7yH6Lnmiu7ubQOyXkTgVX6r5Xxr?=
 =?us-ascii?Q?ilwb5HsAy8hdrEu1Q2O332yVtZRGuug3aFiKORp08yq3+5L5HkKjPc99YWVM?=
 =?us-ascii?Q?N9gAhYudKDBBK31BzQ7WZ0mPFKSzLCh7BGDrJGJnNlZ2uaV0bEnnD7Kc/AJm?=
 =?us-ascii?Q?9ciBNWfAZRXB4ieM+ULFwDQZtjsHihEmPutgfiN9osWHtucGtboH8J8udoUP?=
 =?us-ascii?Q?fLHEqzVtiUqsp+kSJdakQ/Ra0XEsvn2D+Yiwp87bB/pN/GVbpqYqXAozWyA5?=
 =?us-ascii?Q?ejCqWyE1DZFEZF2ZX2dqfVXEn5Cmeykw7oSn+5EcDEbZYGhmjaqI5ajrZ07n?=
 =?us-ascii?Q?7Db7aVzkvA1wP4cNYvS9UR4JFmwI3r/kRtWgXy+YzDSCtRyliq0xf2TdwQ/+?=
 =?us-ascii?Q?MI1gIsld05F6H8dCYklWqaWyQwEx5Vhtf2SdN47sdcFbaPzoY+aI2LnDyBub?=
 =?us-ascii?Q?y2Gtk6jl1GXXs5R42rCyRFUyt1fH9PM/x/5KAz5wwCFVxm+59atUDjzItYQM?=
 =?us-ascii?Q?LAzsQD12Z/AadXA7UCNobPGC+iNy8ItRY17b0SuCmJg3MTe+rGNBiyzqC76l?=
 =?us-ascii?Q?xw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ec5faf03-6b59-4393-e694-08de0dc77c05
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 21:52:36.5088 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: depw3dSbDKFrgUCWYrYMC6kLe473yTr4fuV3tInO7urcdNfudhF9u1/i3Cn/1NSFz3qx8rtwxLvgE/U+0XhueQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB7704
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

On Wed, Oct 15, 2025 at 04:17:08PM +0530, Nitin Gote wrote:
> Introduce an internal __xe_migrate_copy(..., is_vram_resolve) path and
> expose a small wrapper xe_migrate_resolve() that calls it with
> is_vram_resolve=true.
> 
> For resolve/decompression operations we must ensure the copy code uses
> the compression PAT index when appropriate; this change centralizes that
> behavior and allows callers to schedule a resolve (decompress) operation
> via the migrate API.
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_migrate.c | 90 +++++++++++++++++++++++----------
>  drivers/gpu/drm/xe/xe_migrate.h |  7 +++
>  2 files changed, 70 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 4ca48dd1cfd8..1ab649c1e4e0 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -777,31 +777,13 @@ static u32 xe_migrate_ccs_copy(struct xe_migrate *m,
>  	return flush_flags;
>  }
>  
> -/**
> - * xe_migrate_copy() - Copy content of TTM resources.
> - * @m: The migration context.
> - * @src_bo: The buffer object @src is currently bound to.
> - * @dst_bo: If copying between resources created for the same bo, set this to
> - * the same value as @src_bo. If copying between buffer objects, set it to
> - * the buffer object @dst is currently bound to.
> - * @src: The source TTM resource.
> - * @dst: The dst TTM resource.
> - * @copy_only_ccs: If true copy only CCS metadata
> - *
> - * Copies the contents of @src to @dst: On flat CCS devices,
> - * the CCS metadata is copied as well if needed, or if not present,
> - * the CCS metadata of @dst is cleared for security reasons.
> - *
> - * Return: Pointer to a dma_fence representing the last copy batch, or
> - * an error pointer on failure. If there is a failure, any copy operation
> - * started by the function call has been synced.
> - */
> -struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
> -				  struct xe_bo *src_bo,
> -				  struct xe_bo *dst_bo,
> -				  struct ttm_resource *src,
> -				  struct ttm_resource *dst,
> -				  bool copy_only_ccs)
> +static struct dma_fence *__xe_migrate_copy(struct xe_migrate *m,
> +					   struct xe_bo *src_bo,
> +					   struct xe_bo *dst_bo,
> +					   struct ttm_resource *src,
> +					   struct ttm_resource *dst,
> +					   bool copy_only_ccs,
> +					   bool is_vram_resolve)
>  {
>  	struct xe_gt *gt = m->tile->primary_gt;
>  	struct xe_device *xe = gt_to_xe(gt);
> @@ -822,8 +804,19 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
>  	bool copy_ccs = xe_device_has_flat_ccs(xe) &&
>  		xe_bo_needs_ccs_pages(src_bo) && xe_bo_needs_ccs_pages(dst_bo);
>  	bool copy_system_ccs = copy_ccs && (!src_is_vram || !dst_is_vram);
> -	bool use_comp_pat = type_device && xe_device_has_flat_ccs(xe) &&
> -		GRAPHICS_VER(xe) >= 20 && src_is_vram && !dst_is_vram;
> +	bool use_comp_pat;

I'd write this like:

	bool use_comp_pat = is_vram_resolve || (type_device &&
		xe_device_has_flat_ccs(xe) && GRAPHICS_VER(xe) >= 20 &&
		src_is_vram && !dst_is_vram);


> +
> +	/*
> +	 * For decompression operation, always use the compression PAT index.
> +	 * Otherwise, only use the compression PAT index for device memory
> +	 * when copying from VRAM to system memory.
> +	 */

Feel free leave this comment in as it is helpful.

> +	if (is_vram_resolve) {
> +		use_comp_pat = true;
> +	} else {
> +		use_comp_pat = type_device && xe_device_has_flat_ccs(xe) &&
> +			GRAPHICS_VER(xe) >= 20 && src_is_vram && !dst_is_vram;
> +	}
>  
>  	/* Copying CCS between two different BOs is not supported yet. */
>  	if (XE_WARN_ON(copy_ccs && src_bo != dst_bo))
> @@ -982,6 +975,49 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
>  	return fence;
>  }
>  
> +/**
> + * xe_migrate_copy() - Copy content of TTM resources.
> + * @m: The migration context.
> + * @src_bo: The buffer object @src is currently bound to.
> + * @dst_bo: If copying between resources created for the same bo, set this to
> + * the same value as @src_bo. If copying between buffer objects, set it to
> + * the buffer object @dst is currently bound to.
> + * @src: The source TTM resource.
> + * @dst: The dst TTM resource.
> + * @copy_only_ccs: If true copy only CCS metadata
> + *
> + * Copies the contents of @src to @dst: On flat CCS devices,
> + * the CCS metadata is copied as well if needed, or if not present,
> + * the CCS metadata of @dst is cleared for security reasons.
> + *
> + * Return: Pointer to a dma_fence representing the last copy batch, or
> + * an error pointer on failure. If there is a failure, any copy operation
> + * started by the function call has been synced.
> + */
> +struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
> +				  struct xe_bo *src_bo,
> +				  struct xe_bo *dst_bo,
> +				  struct ttm_resource *src,
> +				  struct ttm_resource *dst,
> +				  bool copy_only_ccs)
> +{
> +	return __xe_migrate_copy(m, src_bo, dst_bo, src, dst, copy_only_ccs, false);
> +}
> +
> +/**
> + * xe_migrate_resolve() - Resolve and decompress a buffer object if required.
> + * This wrapper forwards to __xe_migrate_copy() with is_vram_resolve=true.
> + */
> +struct dma_fence *xe_migrate_resolve(struct xe_migrate *m,
> +				     struct xe_bo *src_bo,
> +				     struct xe_bo *dst_bo,
> +				     struct ttm_resource *src,
> +				     struct ttm_resource *dst,
> +				     bool copy_only_ccs)
> +{
> +	return __xe_migrate_copy(m, src_bo, dst_bo, src, dst, copy_only_ccs, true);
> +}
> +
>  /**
>   * xe_migrate_lrc() - Get the LRC from migrate context.
>   * @migrate: Migrate context.
> diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
> index 4fad324b6253..ade68ab32a71 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.h
> +++ b/drivers/gpu/drm/xe/xe_migrate.h
> @@ -125,6 +125,13 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
>  				  struct ttm_resource *dst,
>  				  bool copy_only_ccs);
>  
> +struct dma_fence *xe_migrate_resolve(struct xe_migrate *m,
> +				     struct xe_bo *src_bo,
> +				     struct xe_bo *dst_bo,
> +				     struct ttm_resource *src,
> +				     struct ttm_resource *dst,
> +				     bool copy_only_ccs);

I think you can have single BO / resource argument as resolves are always the
same src / dst.

Likewise for resolve copy_only_ccs is always false, right? So can likely drop
that argument too.

Matt

> +
>  int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
>  			   struct xe_bo *src_bo,
>  			   enum xe_sriov_vf_ccs_rw_ctxs read_write);
> -- 
> 2.25.1
> 
