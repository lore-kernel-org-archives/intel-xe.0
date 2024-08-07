Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94044C3DA7F
	for <intel-xe@archiver.kernel.org>; Wed,  7 Aug 2024 22:42:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DEC210E1F2;
	Wed,  7 Aug 2024 22:42:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QyhPbPzo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4325F10E1F2
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Aug 2024 22:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723070538; x=1754606538;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=vdYQQsYCh7WQMB3fk1DfzMRAM6o6YvBAI5HBr2sw6M4=;
 b=QyhPbPzoqK5aSuSEKVk+pjGn5TqdNUhgKtuk29KOWQQ9so/E9kA6rWQa
 BqbXQyRQ3cHV6kVwonmP6srSznFvs4UbRW5CxtgESJ0ENEoWpA9144ufo
 0SXb+bNA4tuRuMrzgjffJruFQ6HnQj02zEIYTI/S0Fn7wgu3KDRYzwIEz
 zd90XgEwiNO0ps6OoIky5jlJxTNrhpoRn+VPCwQ9Yoochw30CjfIBh+jE
 9VGfCDl9hmH4ZoWDlWdRWefLJRyeFSbHWVoAWH3iGZj5BZq3UWmZZnLfj
 U2l1H5KCCawwOKrmIHXX6pT5Tz3NR53bMRFnN7ZiK7P1CpN2Pnzj9ArET Q==;
X-CSE-ConnectionGUID: cPn9A+XkRE6aeMyj94QsLQ==
X-CSE-MsgGUID: 71GzWfWhSRe0sd/g4p/ahQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="21310420"
X-IronPort-AV: E=Sophos;i="6.09,271,1716274800"; d="scan'208";a="21310420"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2024 15:42:17 -0700
X-CSE-ConnectionGUID: JuUNNJm6QZ+b9FfyIqrbVw==
X-CSE-MsgGUID: h2P8EVt8SBmvjGqEQc6liw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,271,1716274800"; d="scan'208";a="57578156"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Aug 2024 15:42:18 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 7 Aug 2024 15:42:17 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 7 Aug 2024 15:42:17 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 7 Aug 2024 15:42:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=COpRqcYVPZOh58rfd7nEG9PNEJCMbY6SAQh6UhxiRKeyzHhNbCKzhfJgWUMMu57jERkOwQz3AATUaSLM+luEyzK30c7kjpGFrh07LKJl9hcTZxu/xhRefyJZBSQoZRIh95wbfD88bUduevArq3p2Nz+iVT4kLQZJ2ByfIM7GTgDUFmqocBV/Yyx2iKM6fYbC9JRAokHZ5tyVafDN7jI2rmD17kWzsvO1Q0Fs3bn/6KouW5GUC+brZYx2vRWXfUgFDjPMkG3A2m3hxUqF+CV+uh2bGJ5mtiR6W6ZPxHJp27+1EOQuhkHD1P0kBz4tyZ13l6Opy2ZlxhlV5dziyQ4axg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5bM0gYos5I+e+LOY9eZwCox40dtaZoNM3RysWJ5ihLY=;
 b=XrUhK7Omh6M/Ey6NPvDygfVk3RtDdGiummMOoVUlOkFR7HUnDkCK/g5D5ok7x7o7MwRFIDGhRh0EqYpZabaQP8OkwJGRdyh1nS3pg/yP9Rx8wPuFI9tFNXjN2Z+fr7R9uwJfRrttQbcDWjzaXakkW0fOjOqJjy66TAl2pq3hhqBp6ryA3T1y8vgZTuuhyzZjgz77vAo/3p+I+qKrP+J1Y2fky1WqqUdh/tFTnnbYMnYFzfF+QmtMZZVvIJefMAeBsRX0ge6raQOSz4Dnvw7pQWLJAx7pKGz4IAKouP9CWegTzDk7/K/nh4HF3tBza1ClOrZV6lPzx854vmDQ4vhPCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CY8PR11MB6892.namprd11.prod.outlook.com (2603:10b6:930:5b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.29; Wed, 7 Aug
 2024 22:42:12 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.7828.023; Wed, 7 Aug 2024
 22:42:12 +0000
Date: Wed, 7 Aug 2024 15:42:09 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/xe: fix WA 14018094691
Message-ID: <20240807224209.GC5774@mdroper-desk1.amr.corp.intel.com>
References: <20240807211106.1322197-1-daniele.ceraolospurio@intel.com>
 <57qe3afswvijqjsf2vowsif7p4hofxn3mhv36e3k5wc5qwop47@xgh3gy6ol5cl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <57qe3afswvijqjsf2vowsif7p4hofxn3mhv36e3k5wc5qwop47@xgh3gy6ol5cl>
X-ClientProxiedBy: SJ0PR13CA0002.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::7) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CY8PR11MB6892:EE_
X-MS-Office365-Filtering-Correlation-Id: 16b85153-0440-4765-6d24-08dcb7322d9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?eqIb+zx69jeKwbswMnRSCnScChY5dXFoPKzZTSUhHfa+9RRqQUkFZ3L41aP3?=
 =?us-ascii?Q?oNU59077aLDx115boZ/i2bIUcwCJFvqdRtcZnRhfL6D2ysVohZXIiiTprDRd?=
 =?us-ascii?Q?PCG/xC1fvsSZM47+sMNzdbbtea+kMg1bi2EYYByIBFjzKKucpzVjaqeQHowK?=
 =?us-ascii?Q?L5IBU0DhqxonKO1NI2LhzkFmifl/djtqpAnJLKaN2IzTgO+HC9l5UVqHl4fO?=
 =?us-ascii?Q?5ry9MoHT1GNPrPDoj6pOu3Coj7wsERRLTi7G4oiYiJPJuCsdeZpwk9axChpE?=
 =?us-ascii?Q?YJ3F/wJhsyOXj0lR1utWDhTIMt8xhycKaitBufDhOGKiJi09jBRDYRtpdFzr?=
 =?us-ascii?Q?vy/tu2LybYx+kYJKVwMchP617EmbJpcFw+d340LnDxcmU3KeXGVJwToNMdvm?=
 =?us-ascii?Q?veiZbNR54wVKQzg2lUaIlnXooU7Wu6HrFOUAtQjDiA/wLpr5Mh7hDmiU5Edp?=
 =?us-ascii?Q?JXXbCDb8DWILGP5LTH9r/VuqmIffLgSVAeRk+0FzuyMd8mLVevPmQzzF5uxI?=
 =?us-ascii?Q?qN6WPMmAouYgraYcSqkesvD0trohIuY9Gpp8U5Tnivo9IXZc6lkyiHHJj8iy?=
 =?us-ascii?Q?MrWDaGPha94g+AMefIDCSK3vE+z16DzA29SutOpJr6qcO/FwaGLZlMJ9bdH6?=
 =?us-ascii?Q?XD0mFzQBU196U8ZhFM4Z4v7swLk9fWc4XUUlNuiGNxtYMS4MQW1unrgNwGyx?=
 =?us-ascii?Q?KeoJJdFq5Nmz9iS4XqSnxldklT30/Bgkb0ow8OWFORDHVpCyiZ4SczI0aE4/?=
 =?us-ascii?Q?iR43urLvAF0CHaFHlwhWwESSBo/9Bw+52OJXnT4zcfZKQ9M5Wy2Ji+YmreHb?=
 =?us-ascii?Q?UFwXerGIUNUGK/P/3SvxpHLjZGBYDH+6JjA+TtejoplFLck2kyjp10qF7Spe?=
 =?us-ascii?Q?tAHLkx+422fyTPpA75SiX7/t1X6Q/Gj9GPkJU9sckU1l1H5OJN7HDl/kJ6cm?=
 =?us-ascii?Q?tN26I3vJ1Z20eQ4eiFgIW112ENSB5P9ibIMPEXupLmHeMvOliLzY2c6bOn45?=
 =?us-ascii?Q?78CDWSoYspyMtyC2knocoSzko3ZFAaULUkvs9a1O7M5WXDEWI4Cc9IlJI6CC?=
 =?us-ascii?Q?UfNZhXzZUBcb3W/FtsL5wG9C9yas8LyLYqj/eACjWSB49ZivpP6ZJNtJSHGe?=
 =?us-ascii?Q?Y+9YEtC+YgsnNbGHmt/lYeM+sHiNJ1a4TMlNUiRAigEc1pimz6c95AcC6F2u?=
 =?us-ascii?Q?PawuA81SIwDBAh5Vh9sEjZtLso7JA6PUXusTQeOKryIrPKbev0lXdNjtIFVq?=
 =?us-ascii?Q?MJt+L3t5Wg6lmO2Zwv7Y4liqG3Uov/ia1oD/elqpFKwpsVPpP7asET4v1LH1?=
 =?us-ascii?Q?otUTtlRFNBgJ5JV0pa3h3a0OegVVbSo66mXUCJhLQOqiLg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ISGa5W2rrJosLmEQmBKVvvju9VRclDFD3e3+fiCyTugM4ujNmXwyMcbwrVKE?=
 =?us-ascii?Q?KE2U/jke7OFB1t4gxmTS53zARYRZgF4WcP3dPYbjQMHN4wO+ChlT0Y5mJSdI?=
 =?us-ascii?Q?8rW3oHzFTVpqIx3Zw6Pl/jJvMTaebI4B2M+QMjZmFatCq8CTDOf4M8dP2QfX?=
 =?us-ascii?Q?+A+r2Ou0BRHMJPEXVwqrzXjt20fcYtvoLu9AVVFVIAOhvh0glLVD3g5s/rhR?=
 =?us-ascii?Q?FsbFjtoUiBiYtAJ4OtFVKYLQrdHvBgZaKY1M1vRgGriC5PlbCpBErWigiWqz?=
 =?us-ascii?Q?xlFebQs6CKl6S3qTgb1c+5D8fr3kVQx8PAfro6mI8I9uk4XUzWCsi0Pdzy7v?=
 =?us-ascii?Q?fpFL9ufIJW84CS5pwKpcKVGv3LwvtDE7qh7PAObUKjQQNpPBx9DeppO7usry?=
 =?us-ascii?Q?jWUj4Skx5zVBXRuaglQvGlGU/87Dn3Lo7h6fNzOeTvUfd2SZAbnnYwdm6LGE?=
 =?us-ascii?Q?+IJuhRsTTo2eLue/3b7uxlalJU9ydkt9v9UHV2h3iNetVNeIBIPS0h/HiCZX?=
 =?us-ascii?Q?X3hT5GW7rzqFx2Znd7MPn2gfyauX5+i4jHefVYK/zOEIX9BameceuGoWHREv?=
 =?us-ascii?Q?S0OcZsDdyLvjQ0bATQ0Omz80VPNN6Z2adtbxezQ8LujA4LFGIl80BYB5gop9?=
 =?us-ascii?Q?P3Pl/LQc/DUhRqtmLaih4qBmXi4SX9PuJIfObX125tPGMx4zl4IYaZkhS4NU?=
 =?us-ascii?Q?S5JesUXBFfAQIE8vQ3zSKQoEHtUuxpJij+ooqWNcbMUycOjUngsBUg4M88Kc?=
 =?us-ascii?Q?OxFyjBDPFzqUXvSdJ5LRFbTAfEqruVn1dqLi0W0UCYW46jEMtCOpF6tE0JZm?=
 =?us-ascii?Q?ZWZFOEceSUsVvCMX1H84wOMauDUwv+ldA55gt2v1E9WrBhYK8tlWtKvXFGSq?=
 =?us-ascii?Q?ntjYeqiRa62FY7kr4tGQ/4IJ3ArX9RFcApKGazEA4Qo3KFSNNYDvnIZUJrrB?=
 =?us-ascii?Q?HFDB1gx8m7fku4brvoVxy61ZZfBoWRqBE/5Bj7ISI+pwvyhWcLYD9Nr+xLxH?=
 =?us-ascii?Q?CywVga5IBctpNNdHSmkwOL6MXRAEOna4fTl1iDH3b3yeD1yHe6CeXWpMgzEk?=
 =?us-ascii?Q?anUNSooBof++S6ooRilZPNwMF3SRgBdD5aqwhm28X3Pf/OE5RaTI4pWxrSko?=
 =?us-ascii?Q?0xb+NDrw2ZaeSQPn9DAHHBr5BlBAJAeBewj2riQUmOgtE8++4aAqEN2kvKUg?=
 =?us-ascii?Q?Yc0ybkEWIpWojUGt7ZdzomnimNDuG/4wrslaaFaXiUt7+xhRrvPrSe48twNh?=
 =?us-ascii?Q?hxaYDLHMdxoMitASY/qi+9S1xxGr2PCerTsbaSbZFmMLKfNnUB2In+LDLaU6?=
 =?us-ascii?Q?fgXgQxP4pr+A4AXo7DmhN8THGYmbbD1OwrrYcIm1j0IhzmX6fOGAlkVQlMEm?=
 =?us-ascii?Q?3iEinL/opUyh1NlJWZby9WKcOij381ahuefFfHOPGoOFPaID+cbuhvrFXEco?=
 =?us-ascii?Q?mjOSD+EcmHeDQYRgL15YB5oNYcPwNvflgl5WGi6xXCM5C3VRk3op6Jehhyae?=
 =?us-ascii?Q?XeD0nRVl4yhjBBi2oSOIscNA75eZpqFJeYpZANhEg50j293wZ5j8/5MBt9ol?=
 =?us-ascii?Q?1mehZXEOu8UNPUtk/Q0Hw0nR/+9qKGXTu+81ihuN+qsl/yclzfaI/1QxZaxS?=
 =?us-ascii?Q?NA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 16b85153-0440-4765-6d24-08dcb7322d9c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2024 22:42:12.2450 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kn2iCPzUUfWnFTxpm8ySHvcV4qdyRc3fcFfjYIu5D1goTJNtBWOUEJt6vTot4Igr+mJUuGXK7rtOBadLaJg/CitbjZBEGu4Y0FhW7lVFxL0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6892
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

On Wed, Aug 07, 2024 at 04:51:32PM -0500, Lucas De Marchi wrote:
> On Wed, Aug 07, 2024 at 02:11:05PM GMT, Daniele Ceraolo Spurio wrote:
> > This WA is applied while initializing the media GT, but it is currently
> > defined as a primary GT WA (because it modifies a register on the
> > primary GT), so the XE_WA macro is returning false even when the WA
> > should be applied.
> 
> humn... I don't see the media gt marked in the WA db. Does it need to
> be updated considering the GSC is actually loaded in the media GT? But
> it would be odd to write to the primary_gt. So... alternative approach
> that I think would be more correct would be to change the implementation
> in drivers/gpu/drm/xe/xe_gsc.c so it passes the primary_gt to XE_WA(),
> just like it's doing when writing the register.
> 
> Thoughts? Would also like to see Matt Roper's opinion

Yeah, I agree.  It sounds like the workaround applicability is keyed off
the primary GT's IP and the registers that need to be written are also
the primary GT's copy, so I think we should just be passing that GT to
XE_WA() as well.

BTW, it looks like this workaround needs to apply to both graphics
version 20.04 (used by LNL) and 20.01 (used by BMG) if I'm reading
correctly?


Matt

> 
> Lucas De Marchi
> 
> > Since both GTs are involved in the flow, fix this by marking the WA as
> > applying to the platform instead of just the specific GT.
> > 
> > Note that this WA only applies to PXP and we don't yet support that in
> > Xe, so there are no negative effects to this bug, which is why we didn't
> > see any errors in testing.
> > 
> > Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> > Cc: Matt Roper <matthew.d.roper@intel.com>
> > ---
> > drivers/gpu/drm/xe/xe_wa_oob.rules | 2 +-
> > 1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> > index 540d38603f32..40354fb01737 100644
> > --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> > +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> > @@ -19,7 +19,7 @@
> > 		GRAPHICS_VERSION_RANGE(1270, 1274)
> > 		MEDIA_VERSION(1300)
> > 		PLATFORM(DG2)
> > -14018094691	GRAPHICS_VERSION(2004)
> > +14018094691	PLATFORM(LUNARLAKE)
> > 14019882105	GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0)
> > 18024947630	GRAPHICS_VERSION(2001)
> > 		GRAPHICS_VERSION(2004)
> > -- 
> > 2.43.0
> > 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
