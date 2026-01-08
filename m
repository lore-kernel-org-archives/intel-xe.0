Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47ABCD1D493
	for <intel-xe@archiver.kernel.org>; Thu,  8 Jan 2026 20:27:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07B2910E7C3;
	Thu,  8 Jan 2026 20:27:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JiM29JR4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2884110E7C3
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Jan 2026 20:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767904073; x=1799440073;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=KGYL72q2vX8ZRpqHjzJrm9raPRfk8TK6hft1ukI3vco=;
 b=JiM29JR4AYegmyynMIHMuC1DiwEM+N6Bwm3vMstZg2J3XARnj1c4pGfI
 kHT2qlReu51jfc/iQuuKESZ1a5s7wIJ4nrDm/pv+u47wKy71IyeLtIcVP
 kA16asX5QjwsXI6AjSlCTEYy7jKrFpDidBh1nI5Vhs2qlF6YqNFCSiG4g
 HRcrlPHbPW+IhTZHScUAbTPZwRJWT3W3U/VPHjOsQfs7Ug7D3e2xlT4Iu
 0p4HWGvpWXMyhXULZgFjzPX2lzoi4S9Z297NbgA8Ru0i2N3/zouiqQhPD
 DDEBArIt5tLe/SoHmkv2zQ0InTyl15LRsW6A4mxiMoSkayA3fUrP8+2ju Q==;
X-CSE-ConnectionGUID: 8RAoL77BTRq2wrLhVeLPNw==
X-CSE-MsgGUID: uBmIJluPS4qKcGUgxyTurA==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="86707169"
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; d="scan'208";a="86707169"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2026 12:27:52 -0800
X-CSE-ConnectionGUID: Sg6t6Ay4Sd+54COOCc3zAQ==
X-CSE-MsgGUID: UqBRXQKdTyOBiLZaQA3HeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; d="scan'208";a="203733737"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2026 12:27:52 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 8 Jan 2026 12:27:51 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 8 Jan 2026 12:27:51 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.27)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 8 Jan 2026 12:27:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TrCB6/zb7xTz7wVGFBy3SZ9RNRCu41y7MdoCgMVSliiw1MVyd52gh15JcE1/Rh2DGf+k9SOrcwWuIxyatbpDgXUl1l/ksibsCQdx/rgpCPVVcLCIJuZlFiwPg+FGBuvCT2+R6qfj63bVSDig8t9TXq7aR2vkdDxv5Q457hsrEW9Dw8l6TJTRXq/uOXPMeIKyJX1jw9TgYLTNonaJwFttqI/IL4x7sLLvHfNJqeGRj4YpR4EY+YPobYIum2AuHZhPM1nEOED1noD/7ePPYgm0V81RnxPRbfZ5XtrR17uNS3EULP9mDMo/icFzHxBHfJ6xDR08JVEs8yQ7fZzklCTTlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aGE0NcjKh8bRrKITeECgvM5/3hTZi6yX6fLdg2FJrIg=;
 b=pwMA7vxkTjVKkkQkwTb6gONmBrxMsWy0PoPVphcvTrMj2/CvKtyUdktq8u6R9+YnI3WXbGiFAEfGbymQSZDDH7SVFHU9vUwkO9e/AKvPCvzuGrEwEVH8hrenzMWf6r+whTt+lAPjTAiIrIDFSGuApm7T93zT1WyQm7GyZ0jtuSfs0X+HA6z4PsyciqbDQCS8RFYR/FTqlajkAlrp3DXLjLoq3Xp0rk09mJjcrq3jCOCvHIpV1/S8yAgoj1NePFpZq2OOSCwLh3uWPtG3ErTlIzHJqS5Fk/ZWZSLIP1YyIxPnCg4m6yAA0PeDb6omup/m9z2fHTN9pKvEh85H/0ezZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by PH0PR11MB7424.namprd11.prod.outlook.com (2603:10b6:510:287::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.3; Thu, 8 Jan
 2026 20:27:48 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9499.003; Thu, 8 Jan 2026
 20:27:48 +0000
Date: Thu, 8 Jan 2026 15:27:45 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Julia Filipchuk
 <julia.filipchuk@intel.com>
Subject: Re: [PATCH 1/3] drm/xe/gsc: Make GSC FW load optional for newer
 platforms
Message-ID: <aWATQVGNA_zRghj6@intel.com>
References: <20260108011340.2562349-5-daniele.ceraolospurio@intel.com>
 <20260108011340.2562349-6-daniele.ceraolospurio@intel.com>
 <aV_ArSsLW8jWUgHI@intel.com>
 <0de2125a-c8b2-4d4d-bbbb-b079f752e303@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <0de2125a-c8b2-4d4d-bbbb-b079f752e303@intel.com>
X-ClientProxiedBy: BYAPR06CA0014.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::27) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|PH0PR11MB7424:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f45d1b2-7ce5-4283-c1e2-08de4ef463b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6WexOXn3UWByc7RSBgx1MDbqdHG9AnC93Z6bvPgtA6aC4Wa6kUW86AJAHrI1?=
 =?us-ascii?Q?HkkfBIf+tqQEagk29kB0teqR06B1Ry5NckoLLexNrri6gN4w5Hxfmi8Bs+1i?=
 =?us-ascii?Q?cZi/BuKaf+OeD9C1HwP/rhjhBcUPvR90sCT/aCyruihBtyNYR3gNB/xhbrcO?=
 =?us-ascii?Q?GpIiytqF7JXu8vVQCzNxVn6GuEElrX65f/0mqb/QNDQAHmIiMPh+xsWcY43e?=
 =?us-ascii?Q?wAKzniyyaA0Zs23wFmQ42oKWrOAPv7c+enHapBqr203TAxXU3hgIzHR2BAv2?=
 =?us-ascii?Q?oD7RY+MMI2LE2J9JTZLNeslixbom3EleYykW01NWJicQWLU1FWYck0/RcmD1?=
 =?us-ascii?Q?TCAoQq4Px5lKYtVGV/atiTwoH+qI52YgEVHFG8gWtrrofq5UmPglSSKzPh+i?=
 =?us-ascii?Q?LEQX/Oy1cNN2F+2bv0SiYqErcDmFpWFK/JHc0g0WXirEt/ap8hKvKTiz7YKO?=
 =?us-ascii?Q?sYWS9wwsL9KgbvnMvOodonB3KrNak4Yt5sg5Fq4eSlmbRAegxtizdbuCWthx?=
 =?us-ascii?Q?8opv/S3a3UTEdewj1rUMlpUjgWHAZlPR4oBiuPOzHyDqGX3e9norC7o/gEbN?=
 =?us-ascii?Q?YlSqhypgFlkIbEtD5Z7UiD7pIizSOnmgGEoZxIQdlB+GzR92yidYE4y/idK5?=
 =?us-ascii?Q?+shFCc/NixamEuvcmKx27QwLHq8LCvie93IAU68KIxgpuSSLtbJolcqzNIfs?=
 =?us-ascii?Q?kCSWVyhKWFn2x4/C0FBJnJVl/WCq09W1qvgdVdXEg1vORQX3FLMP21mUce5p?=
 =?us-ascii?Q?Laat6HnY/8hEjopeN9AqARIp0FWs81t4gJgvWzD+XzHkp4e6nKF/wClZBD0w?=
 =?us-ascii?Q?K0974dEwlZnckilwQzk/mtsqSVcugnl5fXht+DNHhfYjpeQTG/IXJjZGUMDY?=
 =?us-ascii?Q?GJvd77KnAEMRxNo8f69NhwiOvzUxNqeobRUUeeJwq6cPqBcrp0Tejc8IHW+Q?=
 =?us-ascii?Q?CLXFvyZMwrHdSkj97/EyGc2UpLwWQQcIKcIuxdOwxJd/jPSm7IJqbJBoc23A?=
 =?us-ascii?Q?OifjOvjGj6Ss2D4KWSwlQBf8Fdd7cfYrEAvqPP/a4Ruy9dDuheRY8nL6a2tF?=
 =?us-ascii?Q?QMeSaCFt9pv49IB49tOiuBqaZcQDM9jUtKqpHbMddA3NCPcByWLaEg5N5Ay2?=
 =?us-ascii?Q?a4Ez/c8UHB1B/f7M0bi2r+WyGVRS4tuPR1fW+vBXJMrgeoH4fWTJww8Ze6Ow?=
 =?us-ascii?Q?O8edV9wV6f/fIgk5Xd16iSmCOorVJmXEIKGPfXfPXcJqAFJKPSBQ+Uwsg6YM?=
 =?us-ascii?Q?bN9AdF7rMUIy+1X8Vh04Q4/bCLBYwtRWon73X03jPps+C0QZOU4+txMlAs6l?=
 =?us-ascii?Q?h9C9m+/8VZeo4crqCBlNGuLDn/F/vX/pT3n36HENdCFWQUp2UP8Phz2bkAyE?=
 =?us-ascii?Q?Y28pFqYWVkq4znksk6XNGyzQRqTMrXeoKf/nq+9vBKo2XVz9MtBr4uiA7m78?=
 =?us-ascii?Q?tcC1+DPnu3V/+Zorg4jgEBpyOQ+IkfvR?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8nO8g7Slf0FUbrRoPLNl2YKDPr7trulbMFOpZ2BU1PgxzUendAdIFlAqUGl2?=
 =?us-ascii?Q?XuSH+FpQXZUAauP8zlqWNGuSXLGxAgas+tQhWEsHKY4CHK0/jVWaGHX7uL8Z?=
 =?us-ascii?Q?QtKMoEW/7SUSiptmeKYdgz5Ile2XXc8kzE5uNhkyHTQrdRnNx2zf/mQsci+1?=
 =?us-ascii?Q?sz+7TonsfXfZY5OJ80Df5oKzP/x1d/N6CvFs+8WuMIfWkGtZQSzS8EsDNww2?=
 =?us-ascii?Q?Wvaji1d6VhaNnsiz5Bny3Yyc53zs4EVEuznmm+yY7C9FNunWOThGSjLUV7ki?=
 =?us-ascii?Q?mE8fqtt+88DXL7Qk2uzKdKFwD2XBa2tXtF+LJ7Ugl82O9ZIp7UDy3kkKY1Bz?=
 =?us-ascii?Q?aVODjWoAuqYRXsAmw18JShOTb/HORPJu9mp5cuQPGq/DJ+Z/o5hnPbhnZMFu?=
 =?us-ascii?Q?/g2HAzmYR1eV9mshbYetAJjsDTMtFEeLOyxvHx3yfsWqT8QQ6MDURTKl6uBC?=
 =?us-ascii?Q?7nGHY4evMxmE6qZeFaRi8tQz66DegYA9OVv1WKo70vf5kHTWvNpKxFv7ULml?=
 =?us-ascii?Q?OKtEPrdew6nxbFpBJPBJ72m7oggFf7ULTXXIoscMQRczeoZjblAJpSVcKrE+?=
 =?us-ascii?Q?+RuzfyCSLa4Y45WKj1Tm18U426Eu4IAUcFUGJ+SgNj95VPivoNxnOSKqrcsv?=
 =?us-ascii?Q?WcizUD3ejjkLqULx5MkahMJ1s6VRwfD4W0S5JNlccYCedpOUmdnht2+lPXTk?=
 =?us-ascii?Q?RmsRlvG1Fd9G2ad2vDfuaLeej5mcU25FAcBs1I3PxhydBUYjB7o5b6KcNWS3?=
 =?us-ascii?Q?S0J5EcJxjVcPQaRCYdzJUZw8Sx0TY8SRGeVIF6wpsYeyhciDt3wHFmxlnPkT?=
 =?us-ascii?Q?n9Kl1p+nwJXVShQJFI/7oFNPeT+Z9m/141ZAmEUoii7MNUIwls57x4uUXLqs?=
 =?us-ascii?Q?iPF7KpgXfAXIwGnIcf55kcmR1OGCSsHgIAs6yN+bfAmJB8dztrBcRAp1b37C?=
 =?us-ascii?Q?D3T5OKvb43hdQF3NzqMuxjvM+4JhSdUL4+5Eq9LrMxZEZKaOwDf09bX68oT7?=
 =?us-ascii?Q?YW3BA7+HcBDvfZ/GOwTWeBMr4C6ed8ak4NwysNVifoTZb1ouH06q42ann6CU?=
 =?us-ascii?Q?SEOtirzlg07WIPpkuxxRMAcRAoyVQvIiLbzoXf3lfAJJFK5yVQDyW5D+KwSa?=
 =?us-ascii?Q?CQjKuBOgFurZ5OgdqbGiRbvDYx/bryv4+tVKiNZo7nQtoLlTniJw8XBXsUws?=
 =?us-ascii?Q?4IibwUhyhU5q/1oQJ5PoNIucq7KlTezrdv0OWGrUb0uCnG2wrkOPga7wE+fi?=
 =?us-ascii?Q?85auPERJQp4/i+U3YRT9BFKxlo1jmmo5VXcu248EjtK1UgBuPOEtFYFgpJqC?=
 =?us-ascii?Q?CCO6J0KPo5sVG/+g0agxJvdK/aPyl27RSr7AVTrmgzgjbDgU99ZxO2Cz0HMO?=
 =?us-ascii?Q?oiIEWSDBkUJEsmxJZ6mzVrgv12M7EuJfZlB0Q7q4xh4UOfDY6h36ZFNGLCQb?=
 =?us-ascii?Q?YfbvvWTE1Cud89gTeiDOm0apHSTyfOP4XalUq3kiJ5vrucAofLdqecGeX2Qt?=
 =?us-ascii?Q?zya2Wwttvk/jUdqYQZjbjN54VuIqVlGEl7vjSqYuf69sRN8UIG1FsE+FQ7qE?=
 =?us-ascii?Q?9x5nFCQ+iYI4wSm7mcIEUpZWZn71tCkF7vlxgsFb+F+/cOMXrdIHBwS5Xk5q?=
 =?us-ascii?Q?iU95wT87yoSRGTHG9bAiC0kOE1eT6W1Gb2nGhI59pd9s+ry9AoDnp6luSyf/?=
 =?us-ascii?Q?elrQN2OrC45W/QX12DJfaqj61IXmmATk+oObLBQpxABZs3XX6io4wGG7gZGn?=
 =?us-ascii?Q?mJDQUOj8vQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f45d1b2-7ce5-4283-c1e2-08de4ef463b2
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 20:27:48.6832 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ylH+IFIRSNGD3etvew9fFMck61SKPvw4rwtiM7iFFaIKhL/fjq+dT7VrDPVzb/4jVgWlfTMsMc5dMHoddBP5tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7424
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

On Thu, Jan 08, 2026 at 08:36:43AM -0800, Daniele Ceraolo Spurio wrote:
> 
> 
> On 1/8/2026 6:35 AM, Rodrigo Vivi wrote:
> > On Wed, Jan 07, 2026 at 05:13:42PM -0800, Daniele Ceraolo Spurio wrote:
> > > On newer platforms GSC FW is only required for content protection
> > > features, so the core driver features work perfectly fine without it
> > > (and we did in fact not enable it to start with on PTL). Therefore, we
> > > can selectively enable the GSC only if the FW is found on disk, without
> > > failing if it is not found.
> > > 
> > > Note that this means that the FW can now be enabled (i.e., we're looking
> > > for it) but not available (i.e., we haven't found it), so checks on FW
> > > support should use the latter state to decide whether to go on or not.
> > > 
> > > As part of the rework, the message for FW not found has been cleaned up
> > > to be more readable.
> > > 
> > > While at it, drop the comment about xe_uc_fw_init() since the code has
> > > been reworked and the statement no longer applies.
> > > 
> > > Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > Cc: Julia Filipchuk <julia.filipchuk@intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/display/xe_hdcp_gsc.c |  2 +-
> > >   drivers/gpu/drm/xe/xe_gsc.c              | 13 +++++++------
> > >   drivers/gpu/drm/xe/xe_uc_fw.c            | 10 +++++++---
> > >   3 files changed, 15 insertions(+), 10 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
> > > index 07acae121aa7..ed1f65f5ef4d 100644
> > > --- a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
> > > +++ b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
> > > @@ -39,7 +39,7 @@ static bool intel_hdcp_gsc_check_status(struct drm_device *drm)
> > >   	struct xe_gt *gt = tile->media_gt;
> > >   	struct xe_gsc *gsc = &gt->uc.gsc;
> > > -	if (!gsc || !xe_uc_fw_is_enabled(&gsc->fw)) {
> > > +	if (!gsc || !xe_uc_fw_is_available(&gsc->fw)) {
> > >   		drm_dbg_kms(&xe->drm,
> > should this be changed to a warn or info?
> 
> I'm not super familiar with the display side of things, but AFAIK this gets
> called when UMD checks the HDCP status, so IMO better to keep it to debug
> level, similar to what we do for messages in ioctl-related code.
> 
> > 
> > >   			    "GSC Components not ready for HDCP2.x\n");
> > >   		return false;
> > > diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
> > > index a3157b0fe791..8ad27c884f68 100644
> > > --- a/drivers/gpu/drm/xe/xe_gsc.c
> > > +++ b/drivers/gpu/drm/xe/xe_gsc.c
> > > @@ -414,15 +414,16 @@ int xe_gsc_init(struct xe_gsc *gsc)
> > >   	}
> > >   	/*
> > > -	 * Some platforms can have GuC but not GSC. That would cause
> > > -	 * xe_uc_fw_init(gsc) to return a "not supported" failure code and abort
> > > -	 * all firmware loading. So check for GSC being enabled before
> > > -	 * propagating the failure back up. That way the higher level will keep
> > > -	 * going and load GuC as appropriate.
> > > +	 * Starting from BMG the GSC is no longer needed for MC6 entry, so the
> > > +	 * only missing features if the FW is lacking would be the content
> > > +	 * protection ones. This is acceptable, si we allow the driver load to
> > > +	 * continue if the GSC FW is missing.
> > >   	 */
> > >   	ret = xe_uc_fw_init(&gsc->fw);
> > >   	if (!xe_uc_fw_is_enabled(&gsc->fw))
> > >   		return 0;
> > > +	else if (gt_to_xe(gt)->info.platform >= XE_BATTLEMAGE && !xe_uc_fw_is_available(&gsc->fw))
> > > +		return 0;
> > >   	else if (ret)
> > >   		goto out;
> > > @@ -614,7 +615,7 @@ void xe_gsc_print_info(struct xe_gsc *gsc, struct drm_printer *p)
> > >   	drm_printf(p, "\tfound security version %u\n", gsc->security_version);
> > > -	if (!xe_uc_fw_is_enabled(&gsc->fw))
> > > +	if (!xe_uc_fw_is_available(&gsc->fw))
> > >   		return;
> > >   	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GSC);
> > > diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
> > > index 50458d3bdc7d..b1a9ef3f6195 100644
> > > --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> > > +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> > > @@ -741,7 +741,7 @@ static int uc_fw_request(struct xe_uc_fw *uc_fw, const struct firmware **firmwar
> > >   		return 0;
> > >   	}
> > > -	err = request_firmware(&fw, uc_fw->path, dev);
> > > +	err = firmware_request_nowarn(&fw, uc_fw->path, dev);
> > >   	if (err)
> > >   		goto fail;
> > > @@ -770,8 +770,12 @@ static int uc_fw_request(struct xe_uc_fw *uc_fw, const struct firmware **firmwar
> > >   			       XE_UC_FIRMWARE_MISSING :
> > >   			       XE_UC_FIRMWARE_ERROR);
> > > -	xe_gt_notice(gt, "%s firmware %s: fetch failed with error %pe\n",
> > > -		     xe_uc_fw_type_repr(uc_fw->type), uc_fw->path, ERR_PTR(err));
> > > +	if (err == -ENOENT)
> > > +		xe_gt_info(gt, "%s firmware %s not found\n",
> > > +			   xe_uc_fw_type_repr(uc_fw->type), uc_fw->path);
> > > +	else
> > > +		xe_gt_notice(gt, "%s firmware %s: fetch failed with error %pe\n",
> > shouldn't this be an warn or error?
> 
> The lack of FW is now a valid case for GSC on PTL, so I think it is better
> to avoid throwing an error for it. Note that there are errors for both GuC
> and HuC being printed at other levels of the stack.

thanks for checking

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> Daniele
> 
> > 
> > > +			     xe_uc_fw_type_repr(uc_fw->type), uc_fw->path, ERR_PTR(err));
> > >   	xe_gt_info(gt, "%s firmware(s) can be downloaded from %s\n",
> > >   		   xe_uc_fw_type_repr(uc_fw->type), XE_UC_FIRMWARE_URL);
> > > -- 
> > > 2.43.0
> > > 
> 
