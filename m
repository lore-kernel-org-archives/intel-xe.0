Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D933C02182
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jan 2025 10:45:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CEB910E7C7;
	Thu, 23 Jan 2025 10:45:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JTNhxMMH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3658010E7C7
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Jan 2025 10:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737629143; x=1769165143;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=TaKZ4f4o6O68mqkPV0rVsBFaMSaArQSPwMuirQ3uAf0=;
 b=JTNhxMMHF+YdSKa8mQR/fpSw51XDjb+67y0AdR/IneqMDk1Ds/ams6A/
 eZYedChYKklPVmlikmGv+glUHIpn0bEHFBkuq0sXy+/ly8SGuTs07YBGx
 2fkNacAC/psuJzRxyRfF2QAAaNeGaxD0k/q5Mx6RQr6aQLWl5TyK9pGjL
 IpFdjM1rFzazxsNhBuTQKpgewJ/KCBgSJJ0gce0bR/zNVD8H9yorJx0vR
 n9c3pdaxZIWre+Mzt3QW39FwHhTmTubiRFh712CaamT7t3WVQRBoVUOuO
 NquZgILNldyS+dBEWmz6aINHgZ0o6lVzVEDrek9iZKmg1OpGlwg/qWods g==;
X-CSE-ConnectionGUID: r7ReuBFyTcu6kLok0CnMnA==
X-CSE-MsgGUID: TtuHrWLqShe3WPkZm8/5PQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="49515944"
X-IronPort-AV: E=Sophos;i="6.13,228,1732608000"; d="scan'208";a="49515944"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 02:45:42 -0800
X-CSE-ConnectionGUID: Ffi1OmxzQ7mqMKIYzHaQ2w==
X-CSE-MsgGUID: gS9F+Ib6Q2a8QP8cuVfpsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,228,1732608000"; d="scan'208";a="107969100"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Jan 2025 02:45:42 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 23 Jan 2025 02:45:41 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 23 Jan 2025 02:45:41 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 23 Jan 2025 02:45:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Uqtac3TaEemy2hg0qR35YHnxmfjwTZHMcJ2RaIoODVfslZ1Sf1HJkpPJ3TaFVAjl4xJXFDw7p54PJGjQ3RwRi2tIdx/EnWwUg+imWNmANLz+cNHPn+hiROxrqYF0N1Fvfrhrg8oWUkG6TeEfVv6b5e7mBPoj9X+uWDVFeQ2ZTHJnFlS/u/RcZUrOGmFF7o4YedAOVNGC2qpunDd1FUhLhhISxdONYY6bAtQhF/8yfvbYm8KAOiC3UwLltI9BCBdA8z3ZAXtvw+JQhGW8AaWZuZRbyjbcM1HJxAvrnzUfdN9et5/a66fuyatI6CWXdSajD6ZdI4d6xqdHKcoWsOaI0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6kUBo4TmhNd6thdSmaqdqSDjkaa+22GnNOnnKdcllXQ=;
 b=ZOy5YL+MXXH98SiQijgVPDIU1di3hNTQgWbakKzHN9iUsUg2gh/Zj85Vd9j4F7DXeacwGQZ/JIW/UgxsayE21zAhhhx0mfui2uXo+8wIlpA2nz+BcY5TYchUKYHFAFFOILGz0jkQGXlpvwt1TMYOIHetJ8pxX7PPu+nqRjJhFoa2nyKi8Phhbh/OfiFeEr2tI9G+B5NzTGdMUcqWGfkym/rN2Nfy8mpU5EDzRo6+bdFfMzaaKkvRlPM2QwDGT9OVKM0Bb26H+g/uW+S0/N+BLqeNwupd/XqS4cUJUz2xf9viTsSSGMiSRs6VmLxu9n+k/R8Cn73yLvQ5ppD3qQjFNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7SPRMB0046.namprd11.prod.outlook.com (2603:10b6:510:1f6::20)
 by SJ0PR11MB5769.namprd11.prod.outlook.com (2603:10b6:a03:420::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Thu, 23 Jan
 2025 10:45:39 +0000
Received: from PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc]) by PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc%6]) with mapi id 15.20.8356.020; Thu, 23 Jan 2025
 10:45:39 +0000
Date: Thu, 23 Jan 2025 05:45:34 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>
CC: "Tauro, Riana" <riana.tauro@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "Wysocki, Rafael J"
 <rafael.j.wysocki@intel.com>, "Iddamsetty, Aravind"
 <aravind.iddamsetty@intel.com>
Subject: Re: [PATCH v4 2/3] drm/xe: Enable Boot Survivability mode
Message-ID: <Z5IdzsqbgEL-Zl9H@intel.com>
References: <20250123072343.326919-1-riana.tauro@intel.com>
 <20250123072343.326919-3-riana.tauro@intel.com>
 <CY5PR11MB62113B65DF983BA3AFBBF8C595E02@CY5PR11MB6211.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CY5PR11MB62113B65DF983BA3AFBBF8C595E02@CY5PR11MB6211.namprd11.prod.outlook.com>
X-ClientProxiedBy: MW4PR03CA0133.namprd03.prod.outlook.com
 (2603:10b6:303:8c::18) To PH7SPRMB0046.namprd11.prod.outlook.com
 (2603:10b6:510:1f6::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7SPRMB0046:EE_|SJ0PR11MB5769:EE_
X-MS-Office365-Filtering-Correlation-Id: 48c5d919-0339-4471-fc79-08dd3b9b128d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mlU0DV+qgxcWOp8R5OR3h17avEFNSoDpXqI9LKe5g+EdHFkapM+Frj/zmKIg?=
 =?us-ascii?Q?9HZmo9RA0NaOhX6l2zxAT14HYUGMzRk47mLQlvKWQXpKhhPT9pXgKWXaPW9W?=
 =?us-ascii?Q?mBmb+NqYj05MP6bDVICQOWyXKwofjndKpFNTcagWj4e3aZhM9RLaQSLSoRIu?=
 =?us-ascii?Q?r2OUc5p1StRxvLNyAFEHQspCzshyzU2TZf8DgtVCRBSL6n8fnJZGfgHM1A9v?=
 =?us-ascii?Q?UVI43AAGZww5FQxjRy2YJmL/nHo/4ZGIQfpbgwZAUUeBcxadggq6S8AuCN0G?=
 =?us-ascii?Q?GsmZZK+a+UYsMM6MJjAy/2qqR6yVN2S6/bhEPZjo94iaiBnjRKkEVTihs2qc?=
 =?us-ascii?Q?0OKiqQqgreAXNOFxCUmG426zuGaDWp2tVSt3cgkGg6Z+Ay17NWBqdd+EfNU4?=
 =?us-ascii?Q?+Dw2RwbwFlWc68zc2+roJy7Cq78mLz3CwB7EEQBTsH6SHzOlMivY2Z/yTGsk?=
 =?us-ascii?Q?ObDTyuYAjPitpiMGjv7vRWU3HXoa8d6xebYAv7FNIv20mnBvlewXPJQI9Awe?=
 =?us-ascii?Q?06auRzRcvUFfiLF1m5oiBfnm/H5pJT4LY7cPYQwydwQxNYfTqPHsUca9jsMg?=
 =?us-ascii?Q?Q0a2uIp3IW4+yaWguYVArVhUivIb+EFdHnZJXWOPot2+zYh7BjM4aE/AyWwz?=
 =?us-ascii?Q?LfOILgVo05iW7oRIJL/K7zQmscwhGU/JlxSflUeorEQRsEgI37/uJe02tH5s?=
 =?us-ascii?Q?RJzobNJI5gOyhk0Y1/uaHv96CBK9zNkUou3V142Lq2sCTzK49UO0lMa/uA5u?=
 =?us-ascii?Q?oDfmqOrfaxWpenRMzNFAecMqNsFmklBgKwIoi0ABoXWX3eJohevB2WKyxKB/?=
 =?us-ascii?Q?aONxNjpxZR4vl4cvXFceRvaEnn12+nD+GXoJahwTMgof3WwRo+ext05P26BV?=
 =?us-ascii?Q?0/M6mhNWRPvUObt/ep3jL94Tn+Y3qCkIcp9jf3zBglv/PEG00+/fmmqR4IGt?=
 =?us-ascii?Q?YYe3hNYANz6wirMfDwFypizNTC7zlhaU8BzGPbhF8YT+zqB0NJSpBOwEwfy5?=
 =?us-ascii?Q?fPo1ngL65WovHTuFoT0QcFUoVSo18pn2CY3M3m4s2/K5qzYB+LXZrsCx8zQr?=
 =?us-ascii?Q?xVdtm3d5Z8h00B+E5qRIiXiPaXPf7Ha88mvh3sj6gTqBLQwF6oxHhRRhH21n?=
 =?us-ascii?Q?G/P3YFdbMLi1d6AyUH3eSnLX8OVM1adinDljK2iPStFQWr7I9nHxQ9av8mat?=
 =?us-ascii?Q?GTdcpV6ChAF/LAHmt8UL1g6yArp7+fu7xNkfjrBQ0IBbPGbzFDbWlQ2NjEJm?=
 =?us-ascii?Q?B9YOSCDZGDCMnpTRPC4/Zh6zdpnDuPpS0fUCnNKTVKyDOzWxxxOB9Iv+yWkL?=
 =?us-ascii?Q?EVDrpiNVM8mmA/G+eCn463IlR9c+NQcyCnmdVcMXnjeS3OiRuOzsfGXDINE5?=
 =?us-ascii?Q?VoNFAHljXlmqgKtJe8yoTLLzeUFI?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7SPRMB0046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?n2hggKsK0SyNjoP84285tN2o45s3Kz5GaBxu+ZrWYzboMInO6I0cruAzjlxv?=
 =?us-ascii?Q?zbeiTmOE6x43vaO8xtepj6tt+DFItIrzXYK5+YuvNdSeSRLdP6pQf+apvggw?=
 =?us-ascii?Q?ZreQEX9NL9CCMc/K9WBAksuAHlBUBciEzleqIJ+/R7YlEFqwxDCEFMsfJlEn?=
 =?us-ascii?Q?MPHbQBvYWjlFLaA0imcdi8DjgWWWjiTcOBgnZe6+89jJWgD6Wdy67s8Q1ARq?=
 =?us-ascii?Q?lhwC8QXq37FhVGB94PBhLWgLLFy2RdIh6X37VpitrY/9mLRlcyasQT0yWFsY?=
 =?us-ascii?Q?dkaITUQ19Sz8/1cb/zOSfJICb52Rd7Wk/wYyCYBAGv+rhgUbVB/FE4bldWKw?=
 =?us-ascii?Q?FYQ6sXTKSuEuy8Kr/scaCTRkF1S7ejr8gBYdxrhkNo/1WzMLpj8JM23b2Ap/?=
 =?us-ascii?Q?LJl62YtnynQWzaAXEk/98auiIsB5wDCl2vMfsxKYhyoxo5h44ROKrtUO2pPi?=
 =?us-ascii?Q?TmLOxq9RlNKl3VMTob5bHoLHyNUCx+UJ7F7i9ETkffEyeEXC8wmVjl+KhXDU?=
 =?us-ascii?Q?93IlgtW+7DZJ+7OVuy9JUx+/Tn4lEb24o/+L1QFEJ9xPeE9P9Ik1ZjXgcOD7?=
 =?us-ascii?Q?SgAGFwATmt2KtHXOF55pqWJioYAjBHwYXG/+Tcrl2HsprhDTDKGENsjSiayH?=
 =?us-ascii?Q?1SWFb0jlLrTbg4Hlr0tNayaoSknVY5f8dcrHZnZwfexuLnBwxbOeMabh9y3l?=
 =?us-ascii?Q?YnY6zqFcTIuFM6P4whV7uwxG+d7Y9oO3Czs+yIldC9R60QFITMs5Zs97DR+q?=
 =?us-ascii?Q?fL16uDlpZ1InoacwWx9mHn6sUZfsjoyzbSJ401NiEq+d+GvxjlOKIdFUUpJS?=
 =?us-ascii?Q?pFvzhyJxZXqUoH8dH1CqrH7XdXtih3Fu0tvJT4A/ggmiKK/oIScD9TLNuBgV?=
 =?us-ascii?Q?5xNTn4NjfaxC+r5IAxuP5l0vIhGqKXCNosqmXDsLmuWhrFM4T3NKU9ZHBr52?=
 =?us-ascii?Q?b+cSu4svdyyvaGwo/L7q6Ia0usLFwPEAqcXqA4WcIGNi3/Cl8bWRBL66DjlH?=
 =?us-ascii?Q?HCPKNSoQnDn3kzzxsLx3fYyDp5gt1/JWqEI05KJjpnfQIZTKLbeBcCVM54zi?=
 =?us-ascii?Q?9fKgyRZhphVKTV7XDl+qWrL2HW3FLqKESXQdCvLNTTABtn0x7W1ShH0Qvr5o?=
 =?us-ascii?Q?9RqC8N9/lQLLs8D94dyIAXOLBV5/SynA1Hah9MhjPsZQ3G43qdypvrM4x5UF?=
 =?us-ascii?Q?stwjXNzejhRbSzePv0wOxIkv9o9kx3/N2syBJVLNMsfcxZei4pYCTXzBfggQ?=
 =?us-ascii?Q?zD9WXrar1R/YAMCrNam98IV+U5f6WgBLOYAxq7/TY7IRN2SJW8YmpiCmkraw?=
 =?us-ascii?Q?vIUDZ/LXnTJgggTY5JidRH61FGz5SrNBB0kBc0kLKyVGCYjFc+Gd49tCBzdN?=
 =?us-ascii?Q?E03QWKGaFQu4bH6KeFuIf7mDX/hWRdoA5S6HgxANmjY3qDx4Li0fiyqjNoMl?=
 =?us-ascii?Q?ZL1BwZWzTlAKxfhVRaajSqP1zbmQDbstQQGJVZtnP3IJAyp1ND5sZFhx5IWO?=
 =?us-ascii?Q?H2BxBut02tDGzab6kXviAJ+kJYyhFNbDkw1+HwQGVhHvShCEvtHRMFH4uO8X?=
 =?us-ascii?Q?rBVKOvk2DqAkBSALQyvv9N+i+70+2rjZP/LJhr9NHqxBrnzUD7H0p1tRPHM1?=
 =?us-ascii?Q?CA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 48c5d919-0339-4471-fc79-08dd3b9b128d
X-MS-Exchange-CrossTenant-AuthSource: PH7SPRMB0046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2025 10:45:39.0228 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cb4q4jbaSArpgB6NbMC2SkdV66I7B+JWevrX9MvdZxtyC4jk/n0ameoKagjmAHzv1+bWFICrS1ehVXL3yjQyPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5769
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

On Thu, Jan 23, 2025 at 02:45:00AM -0500, Gupta, Anshuman wrote:
> 
> 
> > -----Original Message-----
> > From: Tauro, Riana <riana.tauro@intel.com>
> > Sent: Thursday, January 23, 2025 12:54 PM
> > To: intel-xe@lists.freedesktop.org
> > Cc: Tauro, Riana <riana.tauro@intel.com>; Gupta, Anshuman
> > <anshuman.gupta@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>;
> > Iddamsetty, Aravind <aravind.iddamsetty@intel.com>
> > Subject: [PATCH v4 2/3] drm/xe: Enable Boot Survivability mode
> > 
> > Enable boot survivability mode if pcode initialization fails and if boot status
> > indicates a failure. In this mode, drm card is not exposed and driver probe
> > returns success after loading the bare minimum to allow firmware to be
> > flashed via mei.
> > 
> > v2: abstract survivability mode variable
> >     add BMG check inside function (Jani, Rodrigo)
> > 
> > v3: return -EBUSY during system suspend (Anshuman)
> >     check survivability mode in pci probe only
> >     on error
> > 
> > Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> > Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_device.c             |  7 ++++++-
> >  drivers/gpu/drm/xe/xe_pci.c                | 23 ++++++++++++++++++++--
> >  drivers/gpu/drm/xe/xe_survivability_mode.c | 16 +++++++++++++++
> > drivers/gpu/drm/xe/xe_survivability_mode.h |  1 +
> >  4 files changed, 44 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > index bd6191e1ed3e..0a938bd0e34d 100644
> > --- a/drivers/gpu/drm/xe/xe_device.c
> > +++ b/drivers/gpu/drm/xe/xe_device.c
> > @@ -51,6 +51,7 @@
> >  #include "xe_pm.h"
> >  #include "xe_query.h"
> >  #include "xe_sriov.h"
> > +#include "xe_survivability_mode.h"
> >  #include "xe_tile.h"
> >  #include "xe_ttm_stolen_mgr.h"
> >  #include "xe_ttm_sys_mgr.h"
> > @@ -692,8 +693,12 @@ int xe_device_probe_early(struct xe_device *xe)
> >  	update_device_info(xe);
> > 
> >  	err = xe_pcode_probe_early(xe);
> > -	if (err)
> > +	if (err) {
> > +		if (xe_survivability_mode_required(xe))
> > +			xe_survivability_mode_init(xe);
> > +
> >  		return err;
> > +	}
> > 
> >  	err = wait_for_lmem_ready(xe);
> >  	if (err)
> > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c index
> > e6ad189294c1..b483c5c90132 100644
> > --- a/drivers/gpu/drm/xe/xe_pci.c
> > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > @@ -30,6 +30,7 @@
> >  #include "xe_pm.h"
> >  #include "xe_sriov.h"
> >  #include "xe_step.h"
> > +#include "xe_survivability_mode.h"
> >  #include "xe_tile.h"
> > 
> >  enum toggle_d3cold {
> > @@ -766,6 +767,9 @@ static void xe_pci_remove(struct pci_dev *pdev)
> >  	if (IS_SRIOV_PF(xe))
> >  		xe_pci_sriov_configure(pdev, 0);
> > 
> > +	if (xe_survivability_mode_enabled(xe))
> > +		return xe_survivability_mode_remove(xe);
> > +
> >  	xe_device_remove(xe);
> >  	xe_pm_runtime_fini(xe);
> >  	pci_set_drvdata(pdev, NULL);
> > @@ -838,8 +842,19 @@ static int xe_pci_probe(struct pci_dev *pdev, const
> > struct pci_device_id *ent)
> >  		return err;
> > 
> >  	err = xe_device_probe_early(xe);
> > -	if (err)
> > +
> > +	/*
> > +	 * In Boot Survivability mode, no drm card is exposed
> > +	 * and driver is loaded with bare minimum to allow
> > +	 * for firmware to be flashed through mei. Return
> > +	 * success if survivability mode is enabled.
> > +	 */
> > +	if (err) {
> > +		if (xe_survivability_mode_enabled(xe))
> > +			return 0;
> > +
> >  		return err;
> > +	}
> > 
> >  	err = xe_info_init(xe, desc->graphics, desc->media);
> >  	if (err)
> > @@ -926,9 +941,13 @@ static void d3cold_toggle(struct pci_dev *pdev,
> > enum toggle_d3cold toggle)  static int xe_pci_suspend(struct device *dev)  {
> >  	struct pci_dev *pdev = to_pci_dev(dev);
> > +	struct xe_device *xe = pdev_to_xe_device(pdev);
> >  	int err;
> > 
> > -	err = xe_pm_suspend(pdev_to_xe_device(pdev));
> > +	if (xe_survivability_mode_enabled(xe))
> > +		return -EBUSY;
> @Vivi, Rodrigo how about using pm_stay_awake() to avoid the suspend instead of returning -EBUSY from driver, Let PM Core abort the suspend ?
> and pm_relax() in module unload path.

By the doc it looks like the pm_stay_awake is more for short event handling,
rather than blocking from probe to unload while the driver is only holding
this mode so the IFWI can be flashed.

However, it does seem a more effective way to be honest. I mean, it could
block all the prep work for suspend specially for S4, instead getting to
the driver.

> CC: Rafael to provide if above can be used here.

But yet, I'd like to hear to Rafael.

And also, I don't believe this block this patch. We could merge this
as is and change to pm_stay_awake as a follow up if we decide that
it is a better path.

> Thanks,
> Anshuman
> > +
> > +	err = xe_pm_suspend(xe);
> >  	if (err)
> >  		return err;
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c
> > b/drivers/gpu/drm/xe/xe_survivability_mode.c
> > index 8b7bd6e79eca..14d0ab7b75e5 100644
> > --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
> > +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
> > @@ -144,6 +144,19 @@ static void enable_survivability_mode(struct pci_dev
> > *pdev)
> >  	}
> >  }
> > 
> > +/**
> > + * xe_survivability_mode_enabled - check if survivability mode is
> > +enabled
> > + * @xe: xe device instance
> > + *
> > + * Returns true if in survivability mode, false otherwise  */ bool
> > +xe_survivability_mode_enabled(struct xe_device *xe) {
> > +	struct xe_survivability *survivability = &xe->survivability;
> > +
> > +	return survivability->mode;
> > +}
> > +
> >  /**
> >   * xe_survivability_mode_required - checks if survivability mode is required
> >   * @xe: xe device instance
> > @@ -158,6 +171,9 @@ bool xe_survivability_mode_required(struct
> > xe_device *xe)
> >  	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
> >  	u32 data;
> > 
> > +	if (!IS_DGFX(xe) || xe->info.platform < XE_BATTLEMAGE)
> > +		return false;
> > +
> >  	data = xe_mmio_read32(mmio, PCODE_SCRATCH(0));
> >  	survivability->boot_status = REG_FIELD_GET(BOOT_STATUS, data);
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.h
> > b/drivers/gpu/drm/xe/xe_survivability_mode.h
> > index 410e3ee5f5d1..f530507a22c6 100644
> > --- a/drivers/gpu/drm/xe/xe_survivability_mode.h
> > +++ b/drivers/gpu/drm/xe/xe_survivability_mode.h
> > @@ -12,6 +12,7 @@ struct xe_device;
> > 
> >  void xe_survivability_mode_init(struct xe_device *xe);  void
> > xe_survivability_mode_remove(struct xe_device *xe);
> > +bool xe_survivability_mode_enabled(struct xe_device *xe);
> >  bool xe_survivability_mode_required(struct xe_device *xe);
> > 
> >  #endif /* _XE_SURVIVABILITY_MODE_H_ */
> > --
> > 2.47.1
> 
