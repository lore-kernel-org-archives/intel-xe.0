Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B018C5B552
	for <intel-xe@archiver.kernel.org>; Mon,  9 Jun 2025 15:09:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E110610E0DD;
	Mon,  9 Jun 2025 15:09:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MCkFUUQ4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5924D10E0DD
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Jun 2025 15:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749481751; x=1781017751;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=LdyVrgIUN8l2VHwLaBoZ7PWuQV+w4e3EXE9B75E5jhY=;
 b=MCkFUUQ4yjEeQcS5/wX5O7Wp8TlQ1YU+fG1e4Tq9vKEHuQRse/kFXdj+
 MGrfSjaV+Wi1zZTB4GnrMI31g2iD3VdIZagdT+dKUrF7lMZo6Mlz1YGJq
 ulAN6HifEDjkrx4vISUEz9GDZ//TycHn4LS1O5aeBbH8+tXSZOTajZGSL
 SEf+JBZmSjAer019L5Jmzv9vgjSUVvf7ZPFtDh3x2W5dMHJQjc1uus3cE
 quPE/l4smmSJK/sUkVjRt3RRK0PbVncup0RSWLtNNcBklBzjG5Tsr/RGU
 KeTJuqYu23RwWSWBdfeIMAfcz7NOkiXGFAHnrtzduFf7jrWveWQPYntcK g==;
X-CSE-ConnectionGUID: rK9v37hsTEuuPJyfaFz/ew==
X-CSE-MsgGUID: ANex1Nf8TIOsvKklbijw6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="55367764"
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; d="scan'208";a="55367764"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2025 08:09:10 -0700
X-CSE-ConnectionGUID: 5u0MoIOVTaqvRqLDHNcMOA==
X-CSE-MsgGUID: PMCSiYpAQRCNhZ+dPzNbyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; d="scan'208";a="177478359"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2025 08:09:10 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 9 Jun 2025 08:09:09 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 9 Jun 2025 08:09:09 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.60)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Mon, 9 Jun 2025 08:09:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bWpIFk45taR/eqk4qIUjHAHOEojhi+BZ4dvMtcJAt7ZKqQ6pX7QXOHFyKo4+rvlUK40fBU3Wtn19CZ7inZ0+/KkCsKv7gdFIHCBFiD9MwiZydobTZBWwBe02I+j/5LKjChAvMoKqeJWuyh555bPS6nOWV/Axjf8Fv3xyE9oQpnru1Zbx+Eqhe3NcuOFQdHjfNaQ7weuvNNySdQlrPx/uTcI+HwUwxW5jT9V6/rTJfZHv28vzKHi3EnFE6Z7Evez2YstPZd7h6FMWtQPFlYbyALB8aLkWKd25PRYCj1q8N5lYoBAYkOKtB3AP+1zDjPeYSgVlqaApmrWm9/o63URnqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=76Og0luGnjujCrWx0HnNMHFxrPrgl4XavL/dlEArmss=;
 b=uFPJMEVJpxbbMMPhPitgTSRcb3lX+omp1i3ufFn4F48y78NACn3QKXR0CnJl+4+CTW5gXpeeCxBwelcOJpHw6LmoK7+/PYiD62X4VmGwDVeFA0litQC9LR0+KhLHVX/TzEHBEw3jZdThPGMYJyGjZrVHfGt1N9EuL5utVdP0gWcHjsCixmAh4ou44U1EMtDeiHqtryrkLm+BvhvvES8qPXTvlFdtht6XbOZxJw9mtsjlcjzIaqYQk8EeWOFzxcCeiphLZ4ufy2wRzkcy2YlZjacMmb+K4Y6zrDXOCb6kXYTgQqud9uGaXDj4bKi51z+tM7WIou6gosdbBl7hIfVzbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH7PR11MB6857.namprd11.prod.outlook.com (2603:10b6:510:1ed::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.21; Mon, 9 Jun
 2025 15:09:07 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%4]) with mapi id 15.20.8813.024; Mon, 9 Jun 2025
 15:09:07 +0000
Date: Mon, 9 Jun 2025 08:09:04 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: "Bhadane, Dnyaneshwar" <dnyaneshwar.bhadane@intel.com>
CC: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 9/9] drm/i915/xe3lpd: Extend WA 16023981245 for display
 30.02
Message-ID: <20250609150904.GM6239@mdroper-desk1.amr.corp.intel.com>
References: <20250606195104.1771715-1-dnyaneshwar.bhadane@intel.com>
 <20250606195104.1771715-10-dnyaneshwar.bhadane@intel.com>
 <aEaKuotfceheCnFJ@bvivekan-mob1>
 <IA1PR11MB6266508D28B63129F76D069DE26BA@IA1PR11MB6266.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <IA1PR11MB6266508D28B63129F76D069DE26BA@IA1PR11MB6266.namprd11.prod.outlook.com>
X-ClientProxiedBy: BYAPR21CA0013.namprd21.prod.outlook.com
 (2603:10b6:a03:114::23) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH7PR11MB6857:EE_
X-MS-Office365-Filtering-Correlation-Id: 871cdf9e-9643-4b02-1c0c-08dda7679465
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ilDP15pgnq5MjJcaNcixqx+ZJKpREveQMOhPSUmcPq5la8CyQjpuxQwltVl+?=
 =?us-ascii?Q?2Ggb5XT/A1oMyVpgEJMZQ367jzB1U/9X7cbInM9H0Z/Jzwlke0z9HalSVnBr?=
 =?us-ascii?Q?qkp9iN05BfwWBS0Ppb65PI596r1HKT+XCGlD6B/3en7IzcG44kmdHyUjX+n9?=
 =?us-ascii?Q?zyhsG5rXOLX1T3Hxase7pLzkem6VBVB4Ewps68FwVdUshmLtwGsSwHmEFOTV?=
 =?us-ascii?Q?/Drm3Q68Z+RlIG2JT1mBlCO5q4aXkrthhtjxtvHAv02taQV3P1cK5AXTwSqR?=
 =?us-ascii?Q?eiXlgTAMvKvnq8Q6PY+NX3CSeUEi5eZIXAic6GhQdiOQHhu1md5iWSByqr6v?=
 =?us-ascii?Q?yY1cw4oSArbpmyapvAWCWD7GeVJKbGPAkuulhW3pEblUzjHtQa+upj3yjs2B?=
 =?us-ascii?Q?7b9E1l1BHau1TSL2s/+f4i3UxqIELQn09UatOcm/V4UCrQCeReJbDSPlwEV1?=
 =?us-ascii?Q?EzWtYV9ynjngt8riJ96kqokU0OXCTN6k7DsP0mcyt08xXNAuFHlrFW029XMe?=
 =?us-ascii?Q?Zc0skieK4Wb1RClRftML6FAvshOr3qeWRnBFJZ0mjHrd1wi0iGNy1kZ9ucoZ?=
 =?us-ascii?Q?XCLQAtQwXtHAyKaD1HDtXg1jvAbR1yq+mRAOjiEXZzc0Bfz5vZo2NWJ1TDpP?=
 =?us-ascii?Q?UTos3vtq3Rl5DQuQSPkt8aUvRriip09Xd0MwTV/jBFfs8wedGkMDBxDyq49d?=
 =?us-ascii?Q?MY8JNIkHdDQSn6Qd5akjuKm2GmGYekj1dxGQdgsAqgF/hST7rikM2FK7kbuG?=
 =?us-ascii?Q?3eOC/AH/uF/KvOsgsTMuc7a92DqJuPKe5ZZITJJ1ReB0ClbUi5VXUfUzczEn?=
 =?us-ascii?Q?CIj9wY6E4a/N5vN7H0RM3lFryaHdP362LDoOyfcL6s4D6m4n2BfkACAXUqhy?=
 =?us-ascii?Q?Sybtq1TOkLozbMud5zrRSTZkNvh1mf+ghqa5VIhyqip40WK0BzE+yEGlAnyQ?=
 =?us-ascii?Q?UpX1UbEGRFYOSJ2ElbJSK/BCzYbm3ttDesF5yJcuItrSUDM2ChXT+BUvvsEO?=
 =?us-ascii?Q?nbBTzpo/6qf7ABP0IU7sWsf6F6/Mwlg9SqoZ2xvi86Kj1CdyetReb+pu3jmm?=
 =?us-ascii?Q?Q+R1r5JNrEg9j+WL1tAwsYBJ24V/IsFblLJPzi2goCbMCooi1XVExpLNQwL6?=
 =?us-ascii?Q?Wyxj28Z2YqIVQ3QbqF1U7iiA92F1lFu5u4QZyPR7Y/B5k+K3EtnPDaPnSAAS?=
 =?us-ascii?Q?VR1eFfQtYaT6yNvUUXF6S4fBZIXSf6in8T/lRGLUPzuaO3+RCrBV71QSL3Om?=
 =?us-ascii?Q?QJyB8BhDujTQTJSz8nqNPb0P0nubIGtJKsd9Jm9FmhwX8HqYpoQ4ZlHzXilp?=
 =?us-ascii?Q?WZKCcoKtOjQGRG5piSdSR0AhFaHUVhkBl4pEJWprDRaCfEZayEFR6bK76k52?=
 =?us-ascii?Q?4s7kt5WmA9nmSz3clM1gt7mafOX+TG2nV9x+CwxVrZwuJyGUonBD7KGwBeCh?=
 =?us-ascii?Q?T9E8fM9t9gc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tWE2wVr/mQ6JwVr89YH+CwRCam3DrWUBs8NzSoujLej3lo63VmdEHsKuLEFL?=
 =?us-ascii?Q?E7qfyVNpufA2rKkt1vvcCRghhF0NQq10tObycvfYoK0+V6WrYP+9vJbAKSK/?=
 =?us-ascii?Q?QdHi4itMJveyoIH0JqR7OKLi7OqtIOIF4lv98nZXpA8Une3b1+/NzFczOiNf?=
 =?us-ascii?Q?1c87FqS+b/fWyy5Sp3gF1+eXaXHUKEDEBbZ/zhOB2BZJpUiuxLMbD/Q36+p6?=
 =?us-ascii?Q?4/FkMYSzAHOi023QtP/KLteAebVYXh+U8cBkBsmTDX85aCrb9ofE1WGvFkVH?=
 =?us-ascii?Q?U7KvWHSggKoUkGdgIwKsJELo0OQmbz1B/O1QTChSFH3JG9+D5NgPRjG3yv4F?=
 =?us-ascii?Q?M9caqNRqq+tj+nZFqsT8HO+uUfe6kIOz87cppegWY0+y8HmBSfHJAmA2VyP2?=
 =?us-ascii?Q?fZ4ZpU7o0wu5unBwHGex5Y/aT9ixTAMK4sI5JhOY5pE/UQWboIWAYoQF6Uab?=
 =?us-ascii?Q?jlorMlnWOrfV5WiP/v8x1xOd6ltkjF60tVk2n9B6bJYqc+sOMAmQB7Yn6JmH?=
 =?us-ascii?Q?b/sfYV1zUCvdUWa7k1cWQ/hWYTBOssOgzj+RvS0NXkjiFN+voyf7F7ARVSYN?=
 =?us-ascii?Q?i3UZxwv4T8ajXtwGC5uui9FIF7gKW+kM+XRNrKQfkuUaGXOjnc/Iry9JhHmL?=
 =?us-ascii?Q?snVZuN6NylsN3UqwNWMYAR7XKnu3DH+RHB9I9mWJUYfHVlXJZTqJEjhU4i0k?=
 =?us-ascii?Q?P+gPjo5cRIw/eopd7n7knri7euj/6dUaW9Wurgf7AOwaWIXWd8ezgvRcVVYJ?=
 =?us-ascii?Q?LJ58OcVsqebLYHAXnmgj/TTyFfg8Or17csQuewLqA5+Dx0HEYf4qAL0Mcdqs?=
 =?us-ascii?Q?seMOHoLhQvS2tdRJGD1ykGPFdoi2G8DtaJUQeZ/jHsOSt2Tr3fXrOtVbaKDK?=
 =?us-ascii?Q?ohqN1On+8XfAXcOfw1f/ywTn/gXMsgqLs/wCsyeMkc9jpA14JSVRSeL9LDpl?=
 =?us-ascii?Q?HS5zdm23hV2P3+pRFGLiFdNvDXvVD8g33DSqWNIB+4/XFzyoCzdcyeygU5cZ?=
 =?us-ascii?Q?bLUvMJrCa+1COTXq5MOq7U7swLHHbD+jCX2inJXrETzkm1BbmbyYbAtb9ZGS?=
 =?us-ascii?Q?If1+D01TUgFX3z9q4ddXYK4f6oL13+IfYh1WL5NyaR8PfK0yth9Udm+etkVk?=
 =?us-ascii?Q?fiRiGgmIlm0x8eZZ6Zizk2QPKxTOVV+iRfPklRhw7gmtKjd5qfyR4QoW/8mr?=
 =?us-ascii?Q?1G7wY6Q92EWbdR6IQ55hO7Hj9ur3B+Bs9UiAPgyJezp3vECDEVGhjw/zfvdW?=
 =?us-ascii?Q?SQsNIqQXvWoa47vCogVEGHweM/7fIPjbThBfwkFpQOSoOmahb2hKP8XBqKEH?=
 =?us-ascii?Q?/R78QFeDkB8U2uFQSr90tWzibJoYR2mCRFXi41CaDqi5L7a35o/twJ4YP9gx?=
 =?us-ascii?Q?b7tLvCGVygLjotk+YGec7YlGqGg1ZqL/9jDiAPOWPQHXdZpQbDy+owunATIk?=
 =?us-ascii?Q?wkFfecWOFHWf9DFCGqg6SggvpyGucLKynUCwCPeRnqQKOoVn/lIIRtU62792?=
 =?us-ascii?Q?gMLT0bf3/qa+67RmDad8t7e/AGc0YlpV1cGgNbWKrKtfxa7I8EzGIa9k9DMK?=
 =?us-ascii?Q?oDGx1n+PKH7hjwKCAE1bnWm3eZsM42IC+FRiNdqawGlwex3lcvbeyrZZBv6/?=
 =?us-ascii?Q?6A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 871cdf9e-9643-4b02-1c0c-08dda7679465
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 15:09:07.1897 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cPVuoxeyN0W0OmXxfLUbFXjz7qkbTocslIxsPYgcQzBXdTIBtfoZJMHGBoO6q7CqMFWxIVpuq6s1N4cvm2tcXuI6nsKxLwGsEZ05tN5tgqw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6857
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

On Mon, Jun 09, 2025 at 08:21:20AM +0000, Bhadane, Dnyaneshwar wrote:
> 
> 
> > -----Original Message-----
> > From: Vivekanandan, Balasubramani
> > <balasubramani.vivekanandan@intel.com>
> > Sent: Monday, June 9, 2025 12:48 PM
> > To: Bhadane, Dnyaneshwar <dnyaneshwar.bhadane@intel.com>; intel-
> > xe@lists.freedesktop.org
> > Subject: Re: [PATCH 9/9] drm/i915/xe3lpd: Extend WA 16023981245 for display
> > 30.02
> > 
> > On 07.06.2025 01:21, Dnyaneshwar Bhadane wrote:
> > > wa_16023981245 need to be exteded for display version 30.02
> > >
> > > Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
> > > ---
> > >  drivers/gpu/drm/i915/display/intel_atomic_plane.c | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> > b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> > > index 15ede7678636..e0336c79c294 100644
> > > --- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> > > +++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> > > @@ -1085,7 +1085,8 @@ int intel_plane_check_src_coordinates(struct
> > intel_plane_state *plane_state)
> > >
> > >  		/* Wa_16023981245 */
> > >  		if ((DISPLAY_VERx100(display) == 2000 ||
> > > -		     DISPLAY_VERx100(display) == 3000) &&
> > > +		     DISPLAY_VERx100(display) == 3000 ||
> > > +		     DISPLAY_VERx100(display) == 3002) &&
> > You can simply the check to `DISPLAY_VER(display) == 30`
> Hi, 
> Thanks,
> This is good idea to merge it as `DISPLAY_VER(display) == 30`. I will do in next revision.

We try to avoid doing that for workarounds since we don't know whether
that will be correct for other 30.xx platforms that may show up in the
future.  The workaround database gives very precise IP version numbers
for each workaround so we try to just follow that, at least early on in
the platform's lifecycle.  Several years down the road once we've moved
on to later generations and we're relatively confident that no more
30.xx platforms are likely to show up, we might go back and consolidate
some of the workaround conditions like this.


Matt

> 
> Dnyaneshwar
> 
> > 
> > Regards,
> > Bala
> > >  		     src_x % 2 != 0)
> > >  			hsub = 2;
> > >  	} else {
> > > --
> > > 2.34.1
> > >

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
