Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14610C27C4F
	for <intel-xe@archiver.kernel.org>; Thu, 13 Jun 2024 22:40:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5054510E062;
	Thu, 13 Jun 2024 22:40:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XP+RtCbP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DE0910E062
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Jun 2024 22:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718318408; x=1749854408;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=baqzEm2R6je0qCATibFewf/X1hQeF4lWb8npqTH5j3A=;
 b=XP+RtCbPcR1jHhbAor2qQFJXzTHjy/V9tOFzAZJF0mjCkPPTcNbICOso
 Ci3B5lIVxZ6Uoy6GVsiSByl1nrN5GowaAiVCDsUaFXh45ZPO3BCSplbUd
 XVK0oXcyC1OzmQC4PfqiT5ZJDbD9JLCCIQ39ueZG4Utwtdp2srKQcqOPl
 KERW4+DVIl9r/WpIZw6M/8Tufv8pEHJZ8yYk2LLtBPNpKYD1Ei9tlCZzD
 yBavyA+Fzryvnm6KjwOY4gyb00rS4c1I7FDcKj1mdlFKq72okDJAKRfRK
 nehYncK9MqbABBidCjgxYkx1KgkoHoxgbhOCWn2fNMcwcixXwKFnJ16ga w==;
X-CSE-ConnectionGUID: Lzs2CcFJRfSkQdc5B3Gtjg==
X-CSE-MsgGUID: tuby6G23S7ihQElKSEfgYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="26302439"
X-IronPort-AV: E=Sophos;i="6.08,236,1712646000"; d="scan'208";a="26302439"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 15:40:07 -0700
X-CSE-ConnectionGUID: 83LtgKpmQcGasMjWCEZl3A==
X-CSE-MsgGUID: KGGZ6scXTZaEzHkiAwba0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,236,1712646000"; d="scan'208";a="40799432"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Jun 2024 15:40:07 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 13 Jun 2024 15:40:06 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 13 Jun 2024 15:40:06 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 13 Jun 2024 15:40:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=igRkuwL8iMVcUjdg+p8pIXJ6voR6VdLxe3sihlAzQ6/xLvPqXp4AJVnsTVkzVgDDMW/+AMuMFZ8BQqt2J3V+baketrD/u8oRTmh6RU0dmS7kCI4zLnJoH87YLHK/RcWn125WET9phI2vATvsJ3ff6oyQsgQSbIplp9UMBgN1e/LKk/XSlF/oWmL+Nu40VCQrQxhJK+bzg4882S6WoBQ435CT+A//R/DCenHV4+CX1tcIilXQbe0Lea2cXzeEZxEMR7agZGKSVm7Jtqbc47htnkUk2HchQUF7nZXdApXt593lhI9owofIhiWnof53QKz/WASd7XNgw7BrCqI3g07kdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m8Gg6GWzAKaCs3+WPOvoC91/brPF8grv7m9E4lo9aM0=;
 b=OkFBSIgBkYxFB0X3uF5NgMTz+/OOTNymLHat5G0rYPL7eHKZmwJxyuVrz+PEo3iiEEkSgGEMoQm8JHLgksFNIWud4La/wKAiB8dxj0PK4p7n+FgT9fflJdxFKYZyQNmsRCqhJ+FlT8xN2YItFDuaR0tq4Tt/K7t4W5rEBYc1psijBBEkeSemQrCbhwKzqerBUVE9wF5hLgwA+cU5bRNKkYxltQ5F+sGuwKrTq2Id/iElNWN1iBiN8fB9awDgg9vyFrxxEHoF21BqH0ANiTKSImV0kU3D9f9g15tv/K9VVrgXoCos/XiLEMqmMNRhkc5BmighmMI7uACmb3TC+QUM1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by SJ2PR11MB7597.namprd11.prod.outlook.com (2603:10b6:a03:4c6::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.20; Thu, 13 Jun
 2024 22:40:03 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.7633.036; Thu, 13 Jun 2024
 22:40:01 +0000
Date: Thu, 13 Jun 2024 22:39:27 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Auld <matthew.auld@intel.com>,
 Paulo Zanoni <paulo.r.zanoni@intel.com>, Francois Dugast
 <francois.dugast@intel.com>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Fix missing runtime outer protection for
 ggtt_remove_node
Message-ID: <Zmt1H0uPt3Dhf8dz@DUT025-TGLU.fm.intel.com>
References: <20240613215357.307061-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240613215357.307061-1-rodrigo.vivi@intel.com>
X-ClientProxiedBy: BYAPR11CA0064.namprd11.prod.outlook.com
 (2603:10b6:a03:80::41) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|SJ2PR11MB7597:EE_
X-MS-Office365-Filtering-Correlation-Id: b4a4c08e-2cbe-4e1d-7a5b-08dc8bf9c2ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230035|376009|1800799019|366011;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?sC7XbNTdhsxitxhslVuS7nPNWOrikfrZrih9tfPC3wW92qjSVYTUNkqzEb?=
 =?iso-8859-1?Q?0FIVdCWwrrF/l3hDMWJmREyN6LnQ2B5R1FZ/QRx2nmSqAJJegBaLMUP9SG?=
 =?iso-8859-1?Q?sirXe23yF38Q22QDraHfAkM/UbZaEjHXG3i9yQaaHhRXrXZt0lLupzkxhI?=
 =?iso-8859-1?Q?h8C7pdV0x6nE/wvJAr2wtQX1KSvkatZsVhaA3Lr93P5dNyloFNdaPT9FLK?=
 =?iso-8859-1?Q?z2it8ZBwPJIeqBxIZpchO1FtF0aCWXXBT2iB6AB4HU5JSDfORbzfGJ0Ont?=
 =?iso-8859-1?Q?7UcSuLzlG4pW+8heb7aRGq1WwSYetno325x1p9ZtraMwjF3IkG8N/NBCek?=
 =?iso-8859-1?Q?e+2I0DSeJK59K3jAqCgN8NI+ytB3fyRzzBf2RtiF0mCmu7fsySxfbBB7Qk?=
 =?iso-8859-1?Q?pLf1an+gBWIaWAxp/L/nRq5/vMwhKGHdZjBGSJp9mhP2ieafRegJwHHPt1?=
 =?iso-8859-1?Q?DlS8Or/zJgoOFneQ9Y0vBO/txUowpNWj3HWKdaCiWjeOjy1oBHsfTAtFUc?=
 =?iso-8859-1?Q?4Bktkbjv+PYoJrPC5Xrfo4ESus5iLb8IEVNq39twdTtmLPAJFz6eBHkbTv?=
 =?iso-8859-1?Q?rpF810LVJ9BbDwDXnUe5yNAO8FqjP8P2LcCo8lBwC5cYFX2UQoOxUmSRRr?=
 =?iso-8859-1?Q?yFknzFhZuswWM2OIfuU2ETuspppXpd0O0DEUVl/TiJTrAE/Jodp0+wtrWk?=
 =?iso-8859-1?Q?kwQWX+J4bbJBlNSow3PtigzYjo80/GbE/ylFVxcJ8flcM1WvISns9Vrccp?=
 =?iso-8859-1?Q?JU8rvhfP30F/LoDPeq3quB1sh/Y5du09rhV7W5sdBV9N/A4UH6JaC0Z9vn?=
 =?iso-8859-1?Q?qhZgJjzMFh365LEQck5gTrDTHq2KhNtBwVpp7PhnbUu3RU96TQjiVEPdJo?=
 =?iso-8859-1?Q?eiF9/uL73Cg3oH8d72sEqHcGGT/zFVnVGf2/YiT4uYWrdUxOxFg70HqlfP?=
 =?iso-8859-1?Q?2mPTw7FKiXZP7envYvRU+V2y8wxNvZEeBiXpavQHEXTjoOy8AQgxU6YObR?=
 =?iso-8859-1?Q?PE3lI+N3cK+XlWPFAfORBuZvDZTavALGhz3+GLq2Wp8fKfIyui/LiXfQBf?=
 =?iso-8859-1?Q?aMwTGhzBDz9mrFP5GMJufeXPQZ9jR4nPn9LB8fzOepsy3JAOmeQ+aM3fk+?=
 =?iso-8859-1?Q?1YE5+K2WI80atJ7Wi1CfZqcVpolB2a40J9XF7BbQon7CSVJ8ZIYu3CHMEw?=
 =?iso-8859-1?Q?Sa39GtQQuNNzWdAHe09QU8zzXQxydRIxho67pD8AyGlE9kSH4N9t+cxk9i?=
 =?iso-8859-1?Q?dRQ1hGgMMARAvCwrYjhcZ06vKtL6XIVeWBB7LgBWfMZR9kjSNN+N5xivOZ?=
 =?iso-8859-1?Q?W3m4K5EIIpgDB4z/07hNrQLx05VqxqH8hKbPMEV5C+AfE+JhAbkktjHneA?=
 =?iso-8859-1?Q?1bH86+h8hW?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230035)(376009)(1800799019)(366011); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?B6Dqhw9zx0dS1+kdKJKsasLcWE7pTGWdujgD/ju6RHgMurMznOtYSXLDkU?=
 =?iso-8859-1?Q?3C1a1p9ab69ZJyiuLAQQpWLHQKhyh8eDVpQYyi+ZFYVmYwuANTawsody3u?=
 =?iso-8859-1?Q?K6m4WVtbaHWvoaFijZqARjvTx+fyzRi0TJrC3swIrJMaE37UEl/2XPNJsc?=
 =?iso-8859-1?Q?p1JI++tHWF6AhrD1/3LjEbS7G2lrcQCgAfjdY85gQXAmibw8tKJ45T4q7t?=
 =?iso-8859-1?Q?tR6HxVBWQU9oQVWturiS1ESx06jL6469AmsuoOgGE1Z2rz/zNQCe8w6npM?=
 =?iso-8859-1?Q?96VlgLvopgsH0Z1O8Aen/mjGDZ48/tqd+7+QK5hEUHvUFuqx/zjAuIiMdl?=
 =?iso-8859-1?Q?81xait43l1Krxd06Ylyw5CRxV19lfZTSDxHFAWBOUpT6x5r6YqPBY1+CO/?=
 =?iso-8859-1?Q?hatfkOCgkX8+35Wi0kOVoIVbet72POTviY29MKlGD9HooOWNfoLbfTEajA?=
 =?iso-8859-1?Q?ln+MMg2gvr78y6RfqFiMyTBsjrat7Wblpl6tAxzdZl3/dyRYoeJz+aQLmL?=
 =?iso-8859-1?Q?uUaq2fw+KOk2jaNpX2CsYdZUhupRpoisMQk4fFQt2TC2v4t/cZIyuhbd5Y?=
 =?iso-8859-1?Q?8scZhEcwq+3R3dqO1l5bQ0GDPnxtESTgCwSW/DM3L+BEUmphQSFgpqntfH?=
 =?iso-8859-1?Q?Y/y9GtAAj4r4MJmxak3bFQZTuk+LLRsaVML1davCGXaOGjUD6s8m/orhpN?=
 =?iso-8859-1?Q?NHur/Tr4MgrYeP7HZMs1b4dG7oKSRD5oXBLC/FndVRBvT3+9UWVSvyMEqH?=
 =?iso-8859-1?Q?8uW5e3ZPDW8IM9IUS3/+ciWAPc3bylmiX7xc4N4vRobX4cV/CyOyE7BUR/?=
 =?iso-8859-1?Q?hj9KCC2ljMGAMnOkJZTA0GEro5yQV8aoA5sM+NmMvIioRAUJdmlQfAKovk?=
 =?iso-8859-1?Q?udtkhCvz1e/urUwzznzgtX5xFLxcUu/cnKq145AEKgLCbnL/9NKhbk/syV?=
 =?iso-8859-1?Q?VfUQ+YRmOCSOihbb3IXz2tUsZM70jgHH1QzUhvq59EK1ckiGRLUbjj3Qx5?=
 =?iso-8859-1?Q?bR+ZjUgakew7ZCs15ILTYHxPBKKN/Xyj0CT9HDeLO3GtaQxLJqnSQSi3Yt?=
 =?iso-8859-1?Q?0uXGNgm68vjRJNxKvvCwA3Zii+yKPYmLXmULtzbdkPnJoz4kN2tOTqxWn0?=
 =?iso-8859-1?Q?vQg1825MosnQuLPW4ODboRUF8yAqYM20z2Aq5RX5IexLvYowB4aBCjdYR4?=
 =?iso-8859-1?Q?iOS8l+0jR5XjM5HfvkJ/xL7X85IsTr2CquEMSthhiK3cbhVvBZuvxeM2pC?=
 =?iso-8859-1?Q?yF2+nbnOScU77SPBIY0EwYhMMhe1KkLv2qR+Z6idbsoavi/MluZQtFU7wN?=
 =?iso-8859-1?Q?L62ViSDweCH9B5M58EyPvaP9sJawai8vhwSyQpBCbyJBF6PWIDwQQ94/Wz?=
 =?iso-8859-1?Q?ZBaUipuwV/4r1/XhDu8FTz07vzdbqBAefnBeHIwQMa9L/tdj4E5HIHvBNf?=
 =?iso-8859-1?Q?4IbFJPvAourkI//Vand+zRG4ZYgeoNumNt6Y1Ix+NYR5v1C1q1HvDSWryY?=
 =?iso-8859-1?Q?Mb16ry0PGBzIMkwtCMuw3k5KJCwe/nJKEZFAW23npAAGcPoxzMNF0IKy62?=
 =?iso-8859-1?Q?c4vR0nOVD7IgU+R7scMZ7rZ1VVmwzIFKN3eUQhnUi1NdkM8KZQFcO9YX2G?=
 =?iso-8859-1?Q?uyVcJn3qnWs84djF/YISjZiZ5RPnLCGoZamxg/+las8V9v72NyB5YjuA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b4a4c08e-2cbe-4e1d-7a5b-08dc8bf9c2ee
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2024 22:40:01.5707 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uBLCTebv+nLmOMXs0+UyG8ed0Q+Yzz/JR7+JP/BR3yvXaZuePtO3bGBpEOKt9WhsAnDRVaQHXuQiWG36gtyjDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7597
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

On Thu, Jun 13, 2024 at 05:53:57PM -0400, Rodrigo Vivi wrote:
> Defer the ggtt node removal to a thread if runtime_pm is not active.
> 
> The ggtt node removal can be called from multiple places, including
> places where we cannot protect with outer callers and places we are
> within other locks. So, try to grab the runtime reference if the
> device is already active, otherwise defer the removal to a separate
> thread from where we are sure we can wake the device up.
> 
> v2: - use xe wq instead of system wq (Matt and CI)
>     - Avoid GFP_KERNEL to be future proof since this removal can
>     be called from outside our drivers and we don't want to block
>     if atomic is needed. (Brost)
> v3: amend forgot chunk declaring xe_device.
> v4: Use a xe_ggtt_region to encapsulate the node and remova info,
>     wihtout the need for any memory allocation at runtime.
> v5: Actually fill the delayed_removal.invalidate (Brost)
> v6: - Ensure that ggtt_region is not freed before work finishes (Auld)
>     - Own wq to ensures that the queued works are flushed before
>       ggtt_fini (Brost)
> 
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Paulo Zanoni <paulo.r.zanoni@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/display/xe_fb_pin.c |  10 +-
>  drivers/gpu/drm/xe/xe_bo.c             |   2 +-
>  drivers/gpu/drm/xe/xe_bo.h             |   6 +-
>  drivers/gpu/drm/xe/xe_bo_types.h       |   6 +-
>  drivers/gpu/drm/xe/xe_ggtt.c           | 129 ++++++++++++++++++-------
>  drivers/gpu/drm/xe/xe_ggtt.h           |   1 -
>  drivers/gpu/drm/xe/xe_ggtt_types.h     |  23 +++++
>  7 files changed, 130 insertions(+), 47 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> index a2f417209124..b84139b27970 100644
> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> @@ -153,7 +153,7 @@ static int __xe_pin_fb_vma_dpt(const struct intel_framebuffer *fb,
>  	}
>  
>  	vma->dpt = dpt;
> -	vma->node = dpt->ggtt_node;
> +	vma->node = dpt->ggtt_region->node;
>  	return 0;
>  }
>  
> @@ -203,8 +203,8 @@ static int __xe_pin_fb_vma_ggtt(const struct intel_framebuffer *fb,
>  	if (xe_bo_is_vram(bo) && ggtt->flags & XE_GGTT_FLAGS_64K)
>  		align = max_t(u32, align, SZ_64K);
>  
> -	if (bo->ggtt_node.size && view->type == I915_GTT_VIEW_NORMAL) {
> -		vma->node = bo->ggtt_node;
> +	if (bo->ggtt_region->node.size && view->type == I915_GTT_VIEW_NORMAL) {
> +		vma->node = bo->ggtt_region->node;
>  	} else if (view->type == I915_GTT_VIEW_NORMAL) {
>  		u32 x, size = bo->ttm.base.size;
>  
> @@ -322,8 +322,8 @@ static void __xe_unpin_fb_vma(struct i915_vma *vma)
>  
>  	if (vma->dpt)
>  		xe_bo_unpin_map_no_vm(vma->dpt);
> -	else if (!drm_mm_node_allocated(&vma->bo->ggtt_node) ||
> -		 vma->bo->ggtt_node.start != vma->node.start)
> +	else if (!drm_mm_node_allocated(&vma->bo->ggtt_region->node) ||
> +		 vma->bo->ggtt_region->node.start != vma->node.start)
>  		xe_ggtt_remove_node(ggtt, &vma->node, false);
>  
>  	ttm_bo_reserve(&vma->bo->ttm, false, false, NULL);
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 74294f1b05bc..0bfd6d1eb0be 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -1072,7 +1072,7 @@ static void xe_ttm_bo_destroy(struct ttm_buffer_object *ttm_bo)
>  
>  	xe_assert(xe, list_empty(&ttm_bo->base.gpuva.list));
>  
> -	if (bo->ggtt_node.size)
> +	if (bo->ggtt_region->node.size)
>  		xe_ggtt_remove_bo(bo->tile->mem.ggtt, bo);
>  
>  #ifdef CONFIG_PROC_FS
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index 6de894c728f5..aeb1ebc0d3fc 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -194,9 +194,9 @@ xe_bo_main_addr(struct xe_bo *bo, size_t page_size)
>  static inline u32
>  xe_bo_ggtt_addr(struct xe_bo *bo)
>  {
> -	XE_WARN_ON(bo->ggtt_node.size > bo->size);
> -	XE_WARN_ON(bo->ggtt_node.start + bo->ggtt_node.size > (1ull << 32));
> -	return bo->ggtt_node.start;
> +	XE_WARN_ON(bo->ggtt_region->node.size > bo->size);
> +	XE_WARN_ON(bo->ggtt_region->node.start + bo->ggtt_region->node.size > (1ull << 32));
> +	return bo->ggtt_region->node.start;
>  }
>  
>  int xe_bo_vmap(struct xe_bo *bo);
> diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
> index 86422e113d39..f45b1c4bbb6d 100644
> --- a/drivers/gpu/drm/xe/xe_bo_types.h
> +++ b/drivers/gpu/drm/xe/xe_bo_types.h
> @@ -14,6 +14,8 @@
>  #include <drm/ttm/ttm_execbuf_util.h>
>  #include <drm/ttm/ttm_placement.h>
>  
> +#include "xe_ggtt_types.h"
> +
>  struct xe_device;
>  struct xe_vm;
>  
> @@ -38,8 +40,8 @@ struct xe_bo {
>  	struct ttm_place placements[XE_BO_MAX_PLACEMENTS];
>  	/** @placement: current placement for this BO */
>  	struct ttm_placement placement;
> -	/** @ggtt_node: GGTT node if this BO is mapped in the GGTT */
> -	struct drm_mm_node ggtt_node;
> +	/** @ggtt_region: GGTT region node if this BO is mapped in the GGTT */
> +	struct xe_ggtt_region *ggtt_region;
>  	/** @vmap: iosys map of this buffer */
>  	struct iosys_map vmap;
>  	/** @ttm_kmap: TTM bo kmap object for internal use only. Keep off. */
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 8ff91fd1b7c8..d0284f2c7cbc 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -101,6 +101,7 @@ static void ggtt_fini_early(struct drm_device *drm, void *arg)
>  {
>  	struct xe_ggtt *ggtt = arg;
>  
> +	destroy_workqueue(ggtt->wq);
>  	mutex_destroy(&ggtt->lock);
>  	drm_mm_takedown(&ggtt->mm);
>  }
> @@ -191,6 +192,8 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
>  	else
>  		ggtt->pt_ops = &xelp_pt_ops;
>  
> +	ggtt->wq = alloc_workqueue("xe-ggtt-wq", 0, 0);
> +

Random rantings... I think we are at the point where it would be good to
add a drm managed API to allocate work queues and subsequently handle
the cleanup. Not a blocker but may take a pass at adding this API and
updating Xe to use this soon.

Anyways, patch LGTM:
Reviewed-by: Matthew Brost <matthew.brost@intel.com> 

>  	drm_mm_init(&ggtt->mm, xe_wopcm_size(xe),
>  		    ggtt->size - xe_wopcm_size(xe));
>  	mutex_init(&ggtt->lock);
> @@ -389,7 +392,7 @@ void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
>  {
>  	u16 cache_mode = bo->flags & XE_BO_FLAG_NEEDS_UC ? XE_CACHE_NONE : XE_CACHE_WB;
>  	u16 pat_index = tile_to_xe(ggtt->tile)->pat.idx[cache_mode];
> -	u64 start = bo->ggtt_node.start;
> +	u64 start = bo->ggtt_region->node.start;
>  	u64 offset, pte;
>  
>  	for (offset = 0; offset < bo->size; offset += XE_PAGE_SIZE) {
> @@ -398,18 +401,97 @@ void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
>  	}
>  }
>  
> +static void ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
> +			     bool invalidate)
> +{
> +	struct xe_device *xe = tile_to_xe(ggtt->tile);
> +	struct xe_ggtt_region *ggtt_region = container_of(node,
> +							  typeof(*ggtt_region),
> +							  node);
> +	bool bound;
> +	int idx;
> +
> +	bound = drm_dev_enter(&xe->drm, &idx);
> +
> +	mutex_lock(&ggtt->lock);
> +	if (bound)
> +		xe_ggtt_clear(ggtt, node->start, node->size);
> +	drm_mm_remove_node(node);
> +	node->size = 0;
> +	mutex_unlock(&ggtt->lock);
> +
> +	if (!bound)
> +		return;
> +
> +	if (invalidate)
> +		xe_ggtt_invalidate(ggtt);
> +
> +	drm_dev_exit(idx);
> +	kfree(ggtt_region);
> +}
> +
> +static void ggtt_remove_node_work_func(struct work_struct *work)
> +{
> +	struct xe_ggtt_region *ggtt_region = container_of(work,
> +							  typeof(*ggtt_region),
> +							  delayed_removal.work);
> +	struct xe_device *xe = tile_to_xe(ggtt_region->ggtt->tile);
> +
> +	xe_pm_runtime_get(xe);
> +	ggtt_remove_node(ggtt_region->ggtt, &ggtt_region->node,
> +			 ggtt_region->delayed_removal.invalidate);
> +	xe_pm_runtime_put(xe);
> +}
> +
> +static void ggtt_queue_remove_node(struct drm_mm_node *node, bool invalidate)
> +{
> +	struct xe_ggtt_region *ggtt_region = container_of(node,
> +							  typeof(*ggtt_region),
> +							  node);
> +
> +	queue_work(ggtt_region->ggtt->wq, &ggtt_region->delayed_removal.work);
> +}
> +
> +void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
> +			 bool invalidate)
> +{
> +	struct xe_device *xe = tile_to_xe(ggtt->tile);
> +
> +	if (xe_pm_runtime_get_if_active(xe)) {
> +		ggtt_remove_node(ggtt, node, invalidate);
> +		xe_pm_runtime_put(xe);
> +	} else {
> +		ggtt_queue_remove_node(node, invalidate);
> +	}
> +}
> +
> +static struct xe_ggtt_region *ggtt_region_init(struct xe_ggtt *ggtt)
> +{
> +	struct xe_ggtt_region *ggtt_region = kzalloc(sizeof(*ggtt_region),
> +						     GFP_KERNEL);
> +
> +	if (!ggtt_region)
> +		return ERR_PTR(-ENOMEM);
> +
> +	INIT_WORK(&ggtt_region->delayed_removal.work, ggtt_remove_node_work_func);
> +	ggtt_region->ggtt = ggtt;
> +
> +	return ggtt_region;
> +}
> +
>  static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
>  				  u64 start, u64 end)
>  {
>  	int err;
>  	u64 alignment = XE_PAGE_SIZE;
> +	struct xe_ggtt_region *ggtt_region;
>  
>  	if (xe_bo_is_vram(bo) && ggtt->flags & XE_GGTT_FLAGS_64K)
>  		alignment = SZ_64K;
>  
> -	if (XE_WARN_ON(bo->ggtt_node.size)) {
> +	if (XE_WARN_ON(bo->ggtt_region->node.size)) {
>  		/* Someone's already inserted this BO in the GGTT */
> -		xe_tile_assert(ggtt->tile, bo->ggtt_node.size == bo->size);
> +		xe_tile_assert(ggtt->tile, bo->ggtt_region->node.size == bo->size);
>  		return 0;
>  	}
>  
> @@ -417,9 +499,14 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
>  	if (err)
>  		return err;
>  
> +	ggtt_region = ggtt_region_init(ggtt);
> +	if (IS_ERR(ggtt_region))
> +		return PTR_ERR(ggtt_region);
> +	bo->ggtt_region = ggtt_region;
> +
>  	xe_pm_runtime_get_noresume(tile_to_xe(ggtt->tile));
>  	mutex_lock(&ggtt->lock);
> -	err = drm_mm_insert_node_in_range(&ggtt->mm, &bo->ggtt_node, bo->size,
> +	err = drm_mm_insert_node_in_range(&ggtt->mm, &bo->ggtt_region->node, bo->size,
>  					  alignment, 0, start, end, 0);
>  	if (!err)
>  		xe_ggtt_map_bo(ggtt, bo);
> @@ -443,43 +530,15 @@ int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
>  	return __xe_ggtt_insert_bo_at(ggtt, bo, 0, U64_MAX);
>  }
>  
> -void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
> -			 bool invalidate)
> -{
> -	struct xe_device *xe = tile_to_xe(ggtt->tile);
> -	bool bound;
> -	int idx;
> -
> -	bound = drm_dev_enter(&xe->drm, &idx);
> -	if (bound)
> -		xe_pm_runtime_get_noresume(xe);
> -
> -	mutex_lock(&ggtt->lock);
> -	if (bound)
> -		xe_ggtt_clear(ggtt, node->start, node->size);
> -	drm_mm_remove_node(node);
> -	node->size = 0;
> -	mutex_unlock(&ggtt->lock);
> -
> -	if (!bound)
> -		return;
> -
> -	if (invalidate)
> -		xe_ggtt_invalidate(ggtt);
> -
> -	xe_pm_runtime_put(xe);
> -	drm_dev_exit(idx);
> -}
> -
>  void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
>  {
> -	if (XE_WARN_ON(!bo->ggtt_node.size))
> +	if (XE_WARN_ON(!bo->ggtt_region->node.size))
>  		return;
>  
>  	/* This BO is not currently in the GGTT */
> -	xe_tile_assert(ggtt->tile, bo->ggtt_node.size == bo->size);
> +	xe_tile_assert(ggtt->tile, bo->ggtt_region->node.size == bo->size);
>  
> -	xe_ggtt_remove_node(ggtt, &bo->ggtt_node,
> +	xe_ggtt_remove_node(ggtt, &bo->ggtt_region->node,
>  			    bo->flags & XE_BO_FLAG_GGTT_INVALIDATE);
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
> index 4a41a1762358..75511b5f43eb 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.h
> +++ b/drivers/gpu/drm/xe/xe_ggtt.h
> @@ -30,7 +30,6 @@ int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo);
>  int xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
>  			 u64 start, u64 end);
>  void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct xe_bo *bo);
> -
>  int xe_ggtt_dump(struct xe_ggtt *ggtt, struct drm_printer *p);
>  
>  #ifdef CONFIG_PCI_IOV
> diff --git a/drivers/gpu/drm/xe/xe_ggtt_types.h b/drivers/gpu/drm/xe/xe_ggtt_types.h
> index d8c584d9a8c3..202d7f3085ba 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt_types.h
> +++ b/drivers/gpu/drm/xe/xe_ggtt_types.h
> @@ -34,6 +34,29 @@ struct xe_ggtt {
>  	const struct xe_ggtt_pt_ops *pt_ops;
>  
>  	struct drm_mm mm;
> +	/** @wq: Dedicated unordered work queue to process node removals */
> +	struct workqueue_struct *wq;
> +};
> +
> +/**
> + * struct xe_ggtt_region - GGTT region node
> + * It needs to be initialized before the drm_mm_node insertion in the GGTT.
> + */
> +struct xe_ggtt_region {
> +	/** @ggtt: Back pointer to xe_ggtt where this region will be inserted at */
> +	struct xe_ggtt *ggtt;
> +	/** @node: The drm_mm_node itself */
> +	struct drm_mm_node node;
> +	/**
> +	 * @delayed_removal: Information for removal through work thread when
> +	 * device runtime_pm is suspended
> +	 */
> +	struct {
> +		/** @delayed_removal.work: The work struct for the delayed removal */
> +		struct work_struct work;
> +		/** @delayed_removal.invalidate: If it needs invalidation upon removal */
> +		bool invalidate;
> +	} delayed_removal;
>  };
>  
>  #endif
> -- 
> 2.45.1
> 
