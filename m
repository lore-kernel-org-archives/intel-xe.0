Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0913C61DBD
	for <intel-xe@archiver.kernel.org>; Fri, 28 Aug 2026 15:30:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93DBB10E14B;
	Fri, 28 Aug 2026 15:30:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZtysKQSt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBC4F10E14B
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Aug 2026 15:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787931038; x=1819467038;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=eJK52+YoLYkLV8oPa7Q4zhqZ2v0rNoWOMCTnRquIUBc=;
 b=ZtysKQStdxdEPmiClPlX9HYexynHTaTWSB4flJYl3b17hyLoDkzA+Ijz
 Uwp9zVoq1FeSrLsfGsVhgfYMPaTqeJJhB/BP4A6iUUxX3h3vqTMV0rexP
 xAnLXY+D+mY8m20DiPbiPs90kB5S7Q8FUmRYoLoTzQ2oDseLuA3KnwFOW
 +qMmBqESkH+cUJtSWKmZyUozZ0VPnPKdeRLSNlSap3APU5aFl4jt/Qn25
 HqNzBMblEDipIplYORpAGDDiirCFolYsYRmrV30ZeZd7rpFubfitUN5zv
 82IApx5O6wTfGxyRHkdeRLDZx0oYXSLk4D10bpX4A7y3BGsUZlw8uuIyZ A==;
X-CSE-ConnectionGUID: PA4W5XvZQri45TRXLn7fCQ==
X-CSE-MsgGUID: v03PN4WPR7SVgoEpQphYFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11889"; a="90952337"
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; d="scan'208";a="90952337"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2026 08:30:38 -0700
X-CSE-ConnectionGUID: xVayRnM8ROio9ts55W+IRA==
X-CSE-MsgGUID: KgZhlo3ETqiDmRhhIamUfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; d="scan'208";a="264435391"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2026 08:30:38 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 28 Aug 2026 08:30:38 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 28 Aug 2026 08:30:38 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.12) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 28 Aug 2026 08:30:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s3ROLWXmt6bcF4CnVJ9jp0lcvKq3ULcWZxeONzaf+hJXSYOPrdKBOiZSHIg/Dwoe0wR/fBj87tTTFnoPi04FJPiSDFE/JpmEM3RaqOvSO7PwWHfqRg10QTDDG9zSgy2E7cvovYhMuFIROMXnfKe/jxI964j8dKHhIwA8VTk5yj7sl3Pp3LjfYGGGbEm0z+PCqwTVdMTEC2kAS+VM/2cRmmGYtGZAjbjLdtMYdkXakNqSN0YN8bIzLBy72DBeRiy6Vyu+kJ1dYTR4bDdIh2VEEVB5W0oxX0f2MKuk/iHsCbBBGGalZRaW0+iYUeszeLDn5sVyq6GJQcPOcQvFZwFKIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7/JijudlHtgHvJGZZbB/FZ64fnjVj20Y4Tx+bAPgqd8=;
 b=AhvN/jPnt6srDrfFf79lkRleYCbK3N26Dgk00JYlHMAqPs1DxI00WKsMbrp9Iw45YOed9bFO2/v1aHb6wTcXebpKS6As2Gu4QrOvphCgTRZWI9K/3aJD/j9T0bCcVPWiWv1913cVjrYyn8pv+qbnL7rcpOTymxGMfdSOV/eFH5XvwQIBanW+ld4nvpHdcLj4The8qvDJ0DJBNxwcJHaK2mH7dP9fvTHf0Z4PO58EDuV3Wr1pST/lrqegBCa/V3uoGw5T57AnPAG2OSUA9EOBU+MQLa7QWguVmooVfVzQBqqmWQWSVWRyYt1WHhm7MgFuMSJiziDf5dls2E62A3IoKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by PH7PR11MB7988.namprd11.prod.outlook.com (2603:10b6:510:243::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Fri, 28 Aug
 2026 15:30:35 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0360.008; Fri, 28 Aug 2026
 15:30:35 +0000
Date: Fri, 28 Aug 2026 11:30:26 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <riana.tauro@intel.com>,
 <michal.wajdeczko@intel.com>, <lukasz.laguna@intel.com>,
 <matthew.d.roper@intel.com>, <matthew.brost@intel.com>
Subject: Re: [PATCH v1] drm/xe: Introduce xe_wedge
Message-ID: <apGpkrl2DAaA2Es6@intel.com>
References: <20260825114450.1371821-1-raag.jadav@intel.com>
 <ao9WVAcHmROhGq8E@intel.com> <ao_XGgJYsAyOE7bk@black.igk.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ao_XGgJYsAyOE7bk@black.igk.intel.com>
X-ClientProxiedBy: SJ0PR05CA0140.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::25) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|PH7PR11MB7988:EE_
X-MS-Office365-Filtering-Correlation-Id: 59b4190e-bd84-4cee-28cd-08df05194de9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|366016|376014|13003099007|6133799003|10067099003|11063799006|4143699003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: TK2BPCPRM6fs2vGMK2JtYAi+xK7Hm5s8pA3XYmbchGognPJdGQzBVl1TaUApI4/R87PrEUwmq+8N8oqBIluU/EWQ2W+9Mxx3ezPSwN51ytHvw8TUPFYUC4dEyIUQCrh4uNwsl0t4m5JXn3nhdNL7BE0gBriHNc1TMn23JsZGMaSZiJO7aZzoXsPrZ+RcJlrkCA80cT15Fd8crUV/NYt5qUd3TibWqK61Nh5RZ1zh/S6Rl/LpCBscMQt7CgRiPDATLZr1Z8EIxnX7EAqagMyyY6hgCzWi5ZKhsdtpBd66maT2t/QhWm/VA8KMdjsSzAWn9ytBlT5Aiu1UcRf5XFXnVRVhONl2YEB/tjqkoNMOSTO7r1Q/Z3bvxpI2yU77CVi7Amm4buLzNw2cLxLIi8hin0DFIfpGjqZXWeRTIJDr8i6FxroDbLdC9eWI8Mm/A9cX+nYULlsj3fJpxdTe8nTvkm/16T5WiI9p2irPcIwP9cpR5mpqcblqTHfKwv4a2qDmNO3sUIF4AWjPdQkgfaxD4XsJ+5yXoRccre6Xf+IkNM9knkWvc81ve/qo8WJv4vKAY3ew4soQr6e+Y+07kZxvdgQyheIesdvxkY8RoOHFZqLVbhOFcCYkrTRor9M/fhjX
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7187.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(13003099007)(6133799003)(10067099003)(11063799006)(4143699003)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?RUFCTSW0h+BxmIE1gc4mNy0nVJVmHaqOYMVk4ktlyNWwAAXa/Tcxe0mXDz?=
 =?iso-8859-1?Q?qtmktVPBL1qPjNCwUc8Afz5v1/sai5/IImEUOZ1Xtg09jUXqjmeHf2iEKu?=
 =?iso-8859-1?Q?5RnOulbMi7qoUUQgaTyeFaFtqV5pcnfPZ05WgeVNtxQ1deilka5ECXmu+E?=
 =?iso-8859-1?Q?uuEaTpnyb/LCkMLF5BN9gSccS0tr2SvA9pX/iy9IoGW2nTewG3eg84rV7z?=
 =?iso-8859-1?Q?8Ug8olXKAbuoGedTZ8epBZIGguXRbfCe8RLMOaGXdT/JMYmET2jAnaqQFj?=
 =?iso-8859-1?Q?T/UFAyfL0W3F8TWuy0XFwLp3SiRdn50pe8wRRLUzxhxHTermuObjOAExOI?=
 =?iso-8859-1?Q?b65QeqOzkoV52PmvPi0BmZl5r7+razIu+xR+ILPOdJ8VEdXBSR4R395nBB?=
 =?iso-8859-1?Q?A4TWKAJpj1ZPaJIlq0W2DmLF/zCtZSYtBmzyo1Qzsysql/OEBLcTPSEVFz?=
 =?iso-8859-1?Q?wtSz39ABYN9XzXsl3NDPb4jfYPUlDagKw1rt6df9YXLX0MbjMSlOrL62CV?=
 =?iso-8859-1?Q?1dEJEdpO4kkFKaJ4rRfjUhOS5LqIpx7+o60AuQAyql71rMsmJfRn0woQNx?=
 =?iso-8859-1?Q?SpUkX6OhzOjKoFUx/x/6hfoEoLITrTCTMk5WTPserSTWBUDNH1zOZXy8FA?=
 =?iso-8859-1?Q?nlH4QpJ61ICt4VDtFza/kCBPA7crufSQTOpPidPjjJtmSCVuHu9Fe5cvG8?=
 =?iso-8859-1?Q?AEE/A96c2PCABGWMEx53VjgpeTCzalLzfo84Gx3wuta5lgIXHIV7HtYqZU?=
 =?iso-8859-1?Q?FA39XH748ZHZ4B3VD2t7b2I/o7+l97pRLMKXJJRqgySdHjj6lB4tHKTD2Q?=
 =?iso-8859-1?Q?zMEuKpSaEnTIHxv4dWcJYEwah3BrjbcucavYI//1/ha3lw7MmlPn/NTNdy?=
 =?iso-8859-1?Q?zfdTPW0Rz8r+nTyzqF0lrx1oOqSi4S3+JVvpRtBEYVtwQyvKK+N6ccH0+f?=
 =?iso-8859-1?Q?h4Xbpa5NKrojctKWwOCyv2HDBDJIjDzEgIMoZ73bOfp7il9uBFw8p94NVg?=
 =?iso-8859-1?Q?Ke14Sn/uZrWWLqo4/J200zXgRKqwQEMir4cjDyarEq+zqJBCUZEIFpcfqq?=
 =?iso-8859-1?Q?S7iopo8+am1M61Jr0P3pWCr0G9GrvpfsKBfug7810BhnUYWKzWufJ7buDn?=
 =?iso-8859-1?Q?lPId45tSdEeKemk2KiSao22bjDvyQhoe0fr3U3juZtN2apOgrK7OwvUsrk?=
 =?iso-8859-1?Q?53Xt7dV0SCyOrPYQBBdEi/O0XDT//igUSyBCspaFKw+4TALVA6jKXIx0Gy?=
 =?iso-8859-1?Q?pJsF7DhsSEthXrrfm61P8VS1HY0SNzQ6+xvrHR6dtTwUgQFz0gILIPAzqq?=
 =?iso-8859-1?Q?O8OVXDbCFpo5vp7BjyhrC7ZWjQnU9GLDjNSkPBnq4m37wEyWn76X1PKmPJ?=
 =?iso-8859-1?Q?bX/IjhRKcQ2qKpYariYNAITnpfN4fJd956yRpmVXpmpA71NV5I0OERXrV8?=
 =?iso-8859-1?Q?Xdslj/CsVeAZreb7nnnRZwPsDimCfEmtAlhwv6skPsvCapiVcCtf2wv0Nd?=
 =?iso-8859-1?Q?COsmymrSzy7tsyTRzBV5kt0a5gG4pHAQLWSB2f25v2/7vxUqjK/CZ1p+A0?=
 =?iso-8859-1?Q?HjcuEdbAR2vGjUAWz2ShiAHb5bLHXRp7R7fIQCsa8IRXYTirjfFA/IaTlS?=
 =?iso-8859-1?Q?kafSCARXJnltT8wJNcJwALJVKiigLnZZASV2avedArLan5li8o4SfM9DRu?=
 =?iso-8859-1?Q?8wafMuUD1nNdJ4YB4O9CAFqlcaZZPrkUBnQp8PzadzYfxTuzUyVDVlCEAl?=
 =?iso-8859-1?Q?+834SnftXqtUPOI3spLRv2ZDVG3B2SEnEBnwz48ORPdU2O/mBhJCivkgBO?=
 =?iso-8859-1?Q?VcnOQZGa5Q=3D=3D?=
X-Exchange-RoutingPolicyChecked: g+mtuIWpdKudP9n/sTAaE+1wv03miAmiQ0zGXYz/0+8FwEyXXHPArCqpIHZ1DYV+T18YRd034PW9JkkeFPBMqI/ZMJvZVhtla9Ty6DCfImTX++T1kbr8S/aY3DnhMknNVXIV2sUsMd0DOdMX5TVovAUyq7vc2HdnVB22VDlh/bsBkjPfhvFHVT/KokytD7sAZoNQqV+bbaD4wQz+lKtmdyh28jR2nPfpeCrxEqg3RUlozl+2eUsuNfCEiYAtL2ec7gfXC2DJEbBAFSyHRJRv93QA/XFTDb+ffof/G4zYw0SGig4RMJH4FBbBrPc88MW8PaPrOtcFHDZHxhAxBucifQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 59b4190e-bd84-4cee-28cd-08df05194de9
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 15:30:35.2373 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: twDseTIMBsd7JQRXTdrWOlvxNV5vrwPeH9mpvQ2UIL5lcq46VgPbXP+5e0kBh5sh0xSVOkQm5XU+/pye/aoxCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7988
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

On Thu, Aug 27, 2026 at 08:20:10AM +0200, Raag Jadav wrote:
> On Wed, Aug 26, 2026 at 05:10:44PM -0400, Rodrigo Vivi wrote:
> > On Tue, Aug 25, 2026 at 05:12:43PM +0530, Raag Jadav wrote:
> > > Consolidates all wedging implementation into a dedicated xe_wedge
> > > component. While at it, add a worker to schedule the wedge handling to
> > > be done async making xe_device_declare_wedged() safe for atomic callers.
> > > 
> > > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > > ---
> > > PS: The original intent was a bug fix, but that's just a matter of opinion.
> > 
> > I had thought about this spin-off a very long time ago too...
> > 
> > But please, split into 2 patches, one with the consolidation and one with
> > the worker. This one is painful to review as is right now.
> 
> This was meant more as an RFC and needs a bit of discussion, sorry I
> didn't update the subject prefix.

ack on overall movement...

> 
> xe_pm_runtime_get_noresume() has checks against 'current' task and I'm
> wondering if it's reliable in atomic context?

it should be... it is only not reliable in thread/work-queue contexts...

> 
> > Also, please use 'xe_wedge_' as the new prefix for any non static functions.
> 
> Sure.
> 
> Raag
> 
> > >  Documentation/gpu/xe/xe_device.rst   |   2 +-
> > >  drivers/gpu/drm/xe/Makefile          |   1 +
> > >  drivers/gpu/drm/xe/xe_device.c       | 172 +--------------------
> > >  drivers/gpu/drm/xe/xe_device.h       |  11 +-
> > >  drivers/gpu/drm/xe/xe_device_types.h |  19 +--
> > >  drivers/gpu/drm/xe/xe_wedge.c        | 214 +++++++++++++++++++++++++++
> > >  drivers/gpu/drm/xe/xe_wedge.h        |  24 +++
> > >  drivers/gpu/drm/xe/xe_wedge_types.h  |  25 ++++
> > >  8 files changed, 271 insertions(+), 197 deletions(-)
> > >  create mode 100644 drivers/gpu/drm/xe/xe_wedge.c
> > >  create mode 100644 drivers/gpu/drm/xe/xe_wedge.h
> > >  create mode 100644 drivers/gpu/drm/xe/xe_wedge_types.h
> > > 
> > > diff --git a/Documentation/gpu/xe/xe_device.rst b/Documentation/gpu/xe/xe_device.rst
> > > index d3a022362ade..8baed81580c9 100644
> > > --- a/Documentation/gpu/xe/xe_device.rst
> > > +++ b/Documentation/gpu/xe/xe_device.rst
> > > @@ -6,7 +6,7 @@
> > >  Xe Device Wedging
> > >  ==================
> > >  
> > > -.. kernel-doc:: drivers/gpu/drm/xe/xe_device.c
> > > +.. kernel-doc:: drivers/gpu/drm/xe/xe_wedge.c
> > >     :doc: Xe Device Wedging
> > >  
> > >  ====================
> > > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> > > index adc2de37e768..c739a50b6896 100644
> > > --- a/drivers/gpu/drm/xe/Makefile
> > > +++ b/drivers/gpu/drm/xe/Makefile
> > > @@ -152,6 +152,7 @@ xe-y += xe_bb.o \
> > >  	xe_vsec.o \
> > >  	xe_wa.o \
> > >  	xe_wait_user_fence.o \
> > > +	xe_wedge.o \
> > >  	xe_wopcm.o
> > >  
> > >  xe-$(CONFIG_I2C)	+= xe_i2c.o \
> > > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > > index 74d566693dfd..d3a7034fac01 100644
> > > --- a/drivers/gpu/drm/xe/xe_device.c
> > > +++ b/drivers/gpu/drm/xe/xe_device.c
> > > @@ -829,10 +829,7 @@ int xe_device_probe_early(struct xe_device *xe)
> > >  	 */
> > >  	assert_lmem_ready(xe);
> > >  
> > > -	xe->wedged.mode = xe_device_validate_wedged_mode(xe, xe_modparam.wedged_mode) ?
> > > -			  XE_DEFAULT_WEDGED_MODE : xe_modparam.wedged_mode;
> > > -	drm_dbg(&xe->drm, "wedged_mode: setting mode (%u) %s\n",
> > > -		xe->wedged.mode, xe_wedged_mode_to_string(xe->wedged.mode));
> > > +	xe_device_wedged_init_early(xe);
> > >  
> > >  	err = xe_device_vram_alloc(xe);
> > >  	if (err)
> > > @@ -924,14 +921,6 @@ static void detect_preproduction_hw(struct xe_device *xe)
> > >  	}
> > >  }
> > >  
> > > -static void xe_device_wedged_fini(struct drm_device *drm, void *arg)
> > > -{
> > > -	struct xe_device *xe = arg;
> > > -
> > > -	if (atomic_read(&xe->wedged.flag))
> > > -		xe_pm_runtime_put(xe);
> > > -}
> > > -
> > >  #ifdef CONFIG_DRM_XE_DEBUG_PAGE_SIZE
> > >  static int xe_debug_page_size_alloc_ctrl_init(struct xe_device *xe)
> > >  {
> > > @@ -1148,7 +1137,7 @@ int xe_device_probe(struct xe_device *xe)
> > >  
> > >  	detect_preproduction_hw(xe);
> > >  
> > > -	err = drmm_add_action_or_reset(&xe->drm, xe_device_wedged_fini, xe);
> > > +	err = xe_device_wedged_init(xe);
> > >  	if (err)
> > >  		goto err_unregister_display;
> > >  
> > > @@ -1394,163 +1383,6 @@ u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address)
> > >  	return address & GENMASK_ULL(xe->info.va_bits - 1, 0);
> > >  }
> > >  
> > > -/**
> > > - * DOC: Xe Device Wedging
> > > - *
> > > - * Xe driver uses drm device wedged uevent as documented in Documentation/gpu/drm-uapi.rst.
> > > - * When device is in wedged state, every IOCTL will be blocked and GT cannot
> > > - * be used. The conditions under which the driver declares the device wedged
> > > - * depend on the wedged mode configuration (see &enum xe_wedged_mode). The
> > > - * default recovery method for a wedged state is rebind/bus-reset.
> > > - *
> > > - * Another recovery method is vendor-specific. Below are the cases that send
> > > - * ``WEDGED=vendor-specific`` recovery method in drm device wedged uevent.
> > > - *
> > > - * Case: Firmware Flash
> > > - * --------------------
> > > - *
> > > - * Identification Hint
> > > - * +++++++++++++++++++
> > > - *
> > > - * ``WEDGED=vendor-specific`` drm device wedged uevent with
> > > - * :ref:`Runtime Survivability mode <xe-survivability-mode>` is used to notify
> > > - * admin/userspace consumer about the need for a firmware flash.
> > > - *
> > > - * Recovery Procedure
> > > - * ++++++++++++++++++
> > > - *
> > > - * Once ``WEDGED=vendor-specific`` drm device wedged uevent is received, follow
> > > - * the below steps
> > > - *
> > > - * - Check Runtime Survivability mode sysfs.
> > > - *   If enabled, firmware flash is required to recover the device.
> > > - *
> > > - *   /sys/bus/pci/devices/<device>/survivability_mode
> > > - *
> > > - * - Admin/userspace consumer can use firmware flashing tools like fwupd to flash
> > > - *   firmware and restore device to normal operation.
> > > - */
> > > -
> > > -/**
> > > - * xe_device_set_wedged_method - Set wedged recovery method
> > > - * @xe: xe device instance
> > > - * @method: recovery method to set
> > > - *
> > > - * Set wedged recovery method to be sent in drm wedged uevent.
> > > - */
> > > -void xe_device_set_wedged_method(struct xe_device *xe, unsigned long method)
> > > -{
> > > -	xe->wedged.method = method;
> > > -}
> > > -
> > > -#define WEDGED_URL	"https://docs.kernel.org/gpu/drm-uapi.html#device-wedging"
> > > -#define XE_BUG_URL	"https://gitlab.freedesktop.org/drm/xe/kernel/issues/new"
> > > -
> > > -/**
> > > - * xe_device_declare_wedged - Declare device wedged
> > > - * @xe: xe device instance
> > > - *
> > > - * This is a final state that can only be cleared with the recovery method
> > > - * specified in the drm wedged uevent. The method can be set using
> > > - * xe_device_set_wedged_method before declaring the device as wedged. If no method
> > > - * is set, reprobe (unbind/re-bind) will be sent by default.
> > > - *
> > > - * In this state every IOCTL will be blocked so the GT cannot be used.
> > > - * In general it will be called upon any critical error such as gt reset
> > > - * failure or guc loading failure. Userspace will be notified of this state
> > > - * through device wedged uevent.
> > > - * If xe.wedged module parameter is set to 2, this function will be called
> > > - * on every single execution timeout (a.k.a. GPU hang) right after devcoredump
> > > - * snapshot capture. In this mode, GT reset won't be attempted so the state of
> > > - * the issue is preserved for further debugging.
> > > - */
> > > -void xe_device_declare_wedged(struct xe_device *xe)
> > > -{
> > > -	struct xe_gt *gt;
> > > -	u8 id;
> > > -
> > > -	if (xe->wedged.mode == XE_WEDGED_MODE_NEVER) {
> > > -		drm_dbg(&xe->drm, "Wedged mode is forcibly disabled\n");
> > > -		return;
> > > -	}
> > > -
> > > -	if (!atomic_xchg(&xe->wedged.flag, 1)) {
> > > -		xe->needs_flr_on_fini = true;
> > > -		xe_pm_runtime_get_noresume(xe);
> > > -
> > > -		xe_log_err_fatal(xe, WEDGED, -EIO, "Device declared wedged!\n");
> > > -		xe_err_once(xe, "IOCTLs and executions are now blocked!\n"
> > > -			    "For recovery procedure, refer to %s\n"
> > > -			    "Please file a _new_ bug report at %s\n",
> > > -			    WEDGED_URL, XE_BUG_URL);
> > > -	}
> > > -
> > > -	for_each_gt(gt, xe, id)
> > > -		xe_gt_declare_wedged(gt);
> > > -
> > > -	if (xe_device_wedged(xe)) {
> > > -		/*
> > > -		 * XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET is intended for debugging
> > > -		 * hangs, so wedge the device with 'none' recovery method and have
> > > -		 * it available to the user for debugging.
> > > -		 */
> > > -		if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET)
> > > -			xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_NONE);
> > > -		/* If no wedge recovery method is set, use default */
> > > -		else if (!xe->wedged.method)
> > > -			xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_REBIND |
> > > -						    DRM_WEDGE_RECOVERY_BUS_RESET);
> > > -
> > > -		/* Notify userspace of wedged device */
> > > -		drm_dev_wedged_event(&xe->drm, xe->wedged.method, NULL);
> > > -	}
> > > -}
> > > -
> > > -/**
> > > - * xe_device_validate_wedged_mode - Check if given mode is supported
> > > - * @xe: the &xe_device
> > > - * @mode: requested mode to validate
> > > - *
> > > - * Check whether the provided wedged mode is supported.
> > > - *
> > > - * Return: 0 if mode is supported, error code otherwise.
> > > - */
> > > -int xe_device_validate_wedged_mode(struct xe_device *xe, unsigned int mode)
> > > -{
> > > -	if (mode > XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET) {
> > > -		drm_dbg(&xe->drm, "wedged_mode: invalid value (%u)\n", mode);
> > > -		return -EINVAL;
> > > -	} else if (mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET && (IS_SRIOV_VF(xe) ||
> > > -		   (IS_SRIOV_PF(xe) && !IS_ENABLED(CONFIG_DRM_XE_DEBUG)))) {
> > > -		drm_dbg(&xe->drm, "wedged_mode: (%u) %s mode is not supported for %s\n",
> > > -			mode, xe_wedged_mode_to_string(mode),
> > > -			xe_sriov_mode_to_string(xe_device_sriov_mode(xe)));
> > > -		return -EPERM;
> > > -	}
> > > -
> > > -	return 0;
> > > -}
> > > -
> > > -/**
> > > - * xe_wedged_mode_to_string - Convert enum value to string.
> > > - * @mode: the &xe_wedged_mode to convert
> > > - *
> > > - * Returns: wedged mode as a user friendly string.
> > > - */
> > > -const char *xe_wedged_mode_to_string(enum xe_wedged_mode mode)
> > > -{
> > > -	switch (mode) {
> > > -	case XE_WEDGED_MODE_NEVER:
> > > -		return "never";
> > > -	case XE_WEDGED_MODE_UPON_CRITICAL_ERROR:
> > > -		return "upon-critical-error";
> > > -	case XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET:
> > > -		return "upon-any-hang-no-reset";
> > > -	default:
> > > -		return "<invalid>";
> > > -	}
> > > -}
> > > -
> > >  /**
> > >   * xe_device_asid_to_vm() - Find VM from ASID
> > >   * @xe: the &xe_device
> > > diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> > > index 6c4cfaebc44a..c984972bd0f8 100644
> > > --- a/drivers/gpu/drm/xe/xe_device.h
> > > +++ b/drivers/gpu/drm/xe/xe_device.h
> > > @@ -11,6 +11,7 @@
> > >  #include "xe_device_types.h"
> > >  #include "xe_gt_types.h"
> > >  #include "xe_sriov.h"
> > > +#include "xe_wedge.h"
> > >  
> > >  struct xe_vm;
> > >  
> > > @@ -207,11 +208,6 @@ bool xe_device_is_l2_flush_optimized(struct xe_device *xe);
> > >  void xe_device_td_flush(struct xe_device *xe);
> > >  void xe_device_l2_flush(struct xe_device *xe);
> > >  
> > > -static inline bool xe_device_wedged(struct xe_device *xe)
> > > -{
> > > -	return atomic_read(&xe->wedged.flag);
> > > -}
> > > -
> > >  #ifdef CONFIG_DRM_XE_DEBUG_PAGE_SIZE
> > >  static inline bool xe_debug_page_size_supported(struct xe_device *xe)
> > >  {
> > > @@ -260,11 +256,6 @@ static inline bool xe_debug_page_size_mode_is_mixed(struct xe_device *xe)
> > >  }
> > >  #endif
> > >  
> > > -void xe_device_set_wedged_method(struct xe_device *xe, unsigned long method);
> > > -void xe_device_declare_wedged(struct xe_device *xe);
> > > -int xe_device_validate_wedged_mode(struct xe_device *xe, unsigned int mode);
> > > -const char *xe_wedged_mode_to_string(enum xe_wedged_mode mode);
> > > -
> > >  struct xe_file *xe_file_get(struct xe_file *xef);
> > >  void xe_file_put(struct xe_file *xef);
> > >  
> > > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> > > index 180d450a6deb..f307d7e5e6b6 100644
> > > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > > @@ -30,6 +30,7 @@
> > >  #include "xe_sysctrl_types.h"
> > >  #include "xe_tile_types.h"
> > >  #include "xe_validation.h"
> > > +#include "xe_wedge_types.h"
> > >  
> > >  #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> > >  #define TEST_VM_OPS_ERROR
> > > @@ -45,22 +46,6 @@ struct xe_pxp;
> > >  struct xe_ttm_stolen_mgr;
> > >  struct xe_vram_region;
> > >  
> > > -/**
> > > - * enum xe_wedged_mode - possible wedged modes
> > > - * @XE_WEDGED_MODE_NEVER: Device will never be declared wedged.
> > > - * @XE_WEDGED_MODE_UPON_CRITICAL_ERROR: Device will be declared wedged only
> > > - *	when critical error occurs like GT reset failure or firmware failure.
> > > - *	This is the default mode.
> > > - * @XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET: Device will be declared wedged on
> > > - *	any hang. In this mode, engine resets are disabled to avoid automatic
> > > - *	recovery attempts. This mode is primarily intended for debugging hangs.
> > > - */
> > > -enum xe_wedged_mode {
> > > -	XE_WEDGED_MODE_NEVER = 0,
> > > -	XE_WEDGED_MODE_UPON_CRITICAL_ERROR = 1,
> > > -	XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET = 2,
> > > -};
> > > -
> > >  #ifdef CONFIG_DRM_XE_DEBUG_PAGE_SIZE
> > >  /**
> > >   * enum xe_page_size_alloc_ctrl_mode - User BO page-size allocation control modes
> > > @@ -534,6 +519,8 @@ struct xe_device {
> > >  		unsigned long method;
> > >  		/** @wedged.inconsistent_reset: Inconsistent reset policy state between GTs */
> > >  		bool inconsistent_reset;
> > > +		/** @wedged.work: Worker for wedge handling to be done async */
> > > +		struct work_struct work;
> > >  	} wedged;
> > >  
> > >  	/** @devres_group: devres group */
> > > diff --git a/drivers/gpu/drm/xe/xe_wedge.c b/drivers/gpu/drm/xe/xe_wedge.c
> > > new file mode 100644
> > > index 000000000000..52d4661a2dee
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/xe/xe_wedge.c
> > > @@ -0,0 +1,214 @@
> > > +// SPDX-License-Identifier: MIT
> > > +/*
> > > + * Copyright © 2026 Intel Corporation
> > > + */
> > > +
> > > +#include <drm/drm_drv.h>
> > > +#include <drm/drm_managed.h>
> > > +
> > > +#include "xe_defaults.h"
> > > +#include "xe_device_types.h"
> > > +#include "xe_gt.h"
> > > +#include "xe_log.h"
> > > +#include "xe_module.h"
> > > +#include "xe_pm.h"
> > > +#include "xe_printk.h"
> > > +#include "xe_wedge.h"
> > > +
> > > +/**
> > > + * DOC: Xe Device Wedging
> > > + *
> > > + * Xe driver uses drm device wedged uevent as documented in Documentation/gpu/drm-uapi.rst.
> > > + * When device is in wedged state, every IOCTL will be blocked and GT cannot
> > > + * be used. The conditions under which the driver declares the device wedged
> > > + * depend on the wedged mode configuration (see &enum xe_wedged_mode). The
> > > + * default recovery method for a wedged state is rebind/bus-reset.
> > > + *
> > > + * Another recovery method is vendor-specific. Below are the cases that send
> > > + * ``WEDGED=vendor-specific`` recovery method in drm device wedged uevent.
> > > + *
> > > + * Case: Firmware Flash
> > > + * --------------------
> > > + *
> > > + * Identification Hint
> > > + * +++++++++++++++++++
> > > + *
> > > + * ``WEDGED=vendor-specific`` drm device wedged uevent with
> > > + * :ref:`Runtime Survivability mode <xe-survivability-mode>` is used to notify
> > > + * admin/userspace consumer about the need for a firmware flash.
> > > + *
> > > + * Recovery Procedure
> > > + * ++++++++++++++++++
> > > + *
> > > + * Once ``WEDGED=vendor-specific`` drm device wedged uevent is received, follow
> > > + * the below steps
> > > + *
> > > + * - Check Runtime Survivability mode sysfs.
> > > + *   If enabled, firmware flash is required to recover the device.
> > > + *
> > > + *   /sys/bus/pci/devices/<device>/survivability_mode
> > > + *
> > > + * - Admin/userspace consumer can use firmware flashing tools like fwupd to flash
> > > + *   firmware and restore device to normal operation.
> > > + */
> > > +
> > > +/**
> > > + * xe_device_set_wedged_method() - Set wedged recovery method
> > > + * @xe: xe device instance
> > > + * @method: recovery method to set
> > > + *
> > > + * Set wedged recovery method to be sent in drm wedged uevent.
> > > + */
> > > +void xe_device_set_wedged_method(struct xe_device *xe, unsigned long method)
> > > +{
> > > +	xe->wedged.method = method;
> > > +}
> > > +
> > > +/**
> > > + * xe_device_wedged() - Check for wedged device
> > > + * @xe: xe device instance
> > > + *
> > > + * Returns: %true if device is wedged, %false otherwise.
> > > + */
> > > +bool xe_device_wedged(struct xe_device *xe)
> > > +{
> > > +	return atomic_read(&xe->wedged.flag);
> > > +}
> > > +
> > > +#define WEDGED_URL	"https://docs.kernel.org/gpu/drm-uapi.html#device-wedging"
> > > +#define XE_BUG_URL	"https://gitlab.freedesktop.org/drm/xe/kernel/issues/new"
> > > +
> > > +static void wedged_work(struct work_struct *work)
> > > +{
> > > +	struct xe_device *xe = container_of(work, struct xe_device, wedged.work);
> > > +	struct xe_gt *gt;
> > > +	u8 id;
> > > +
> > > +	for_each_gt(gt, xe, id)
> > > +		xe_gt_declare_wedged(gt);
> > > +
> > > +	/*
> > > +	 * XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET is intended for debugging
> > > +	 * hangs, so wedge the device with 'none' recovery method and have
> > > +	 * it available to the user for debugging.
> > > +	 */
> > > +	if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET)
> > > +		xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_NONE);
> > > +	/* If no wedge recovery method is set, use default */
> > > +	else if (!xe->wedged.method)
> > > +		xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_REBIND |
> > > +					    DRM_WEDGE_RECOVERY_BUS_RESET);
> > > +
> > > +	/* Notify userspace of wedged device */
> > > +	drm_dev_wedged_event(&xe->drm, xe->wedged.method, NULL);
> > > +}
> > > +
> > > +/**
> > > + * xe_device_declare_wedged - Declare device wedged
> > > + * @xe: xe device instance
> > > + *
> > > + * This is a final state that can only be cleared with the recovery method
> > > + * specified in the drm wedged uevent. The method can be set using
> > > + * xe_device_set_wedged_method before declaring the device as wedged. If no method
> > > + * is set, reprobe (unbind/re-bind) will be sent by default.
> > > + *
> > > + * In this state every IOCTL will be blocked so the GT cannot be used.
> > > + * In general it will be called upon any critical error such as gt reset
> > > + * failure or guc loading failure. Userspace will be notified of this state
> > > + * through device wedged uevent.
> > > + * If xe.wedged module parameter is set to 2, this function will be called
> > > + * on every single execution timeout (a.k.a. GPU hang) right after devcoredump
> > > + * snapshot capture. In this mode, GT reset won't be attempted so the state of
> > > + * the issue is preserved for further debugging.
> > > + */
> > > +void xe_device_declare_wedged(struct xe_device *xe)
> > > +{
> > > +	if (xe->wedged.mode == XE_WEDGED_MODE_NEVER) {
> > > +		drm_dbg(&xe->drm, "Wedged mode is forcibly disabled\n");
> > > +		return;
> > > +	}
> > > +
> > > +	if (!atomic_xchg(&xe->wedged.flag, 1)) {
> > > +		xe->needs_flr_on_fini = true;
> > > +		xe_pm_runtime_get_noresume(xe);
> > > +
> > > +		xe_log_err_fatal(xe, WEDGED, -EIO, "Device declared wedged!\n");
> > > +		xe_err_once(xe, "IOCTLs and executions are now blocked!\n"
> > > +			    "For recovery procedure, refer to %s\n"
> > > +			    "Please file a _new_ bug report at %s\n",
> > > +			    WEDGED_URL, XE_BUG_URL);
> > > +
> > > +		schedule_work(&xe->wedged.work);
> > > +	}
> > > +}
> > > +
> > > +/**
> > > + * xe_device_validate_wedged_mode - Check if given mode is supported
> > > + * @xe: the &xe_device
> > > + * @mode: requested mode to validate
> > > + *
> > > + * Check whether the provided wedged mode is supported.
> > > + *
> > > + * Return: 0 if mode is supported, error code otherwise.
> > > + */
> > > +int xe_device_validate_wedged_mode(struct xe_device *xe, unsigned int mode)
> > > +{
> > > +	if (mode > XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET) {
> > > +		drm_dbg(&xe->drm, "wedged_mode: invalid value (%u)\n", mode);
> > > +		return -EINVAL;
> > > +	} else if (mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET && (IS_SRIOV_VF(xe) ||
> > > +		   (IS_SRIOV_PF(xe) && !IS_ENABLED(CONFIG_DRM_XE_DEBUG)))) {
> > > +		drm_dbg(&xe->drm, "wedged_mode: (%u) %s mode is not supported for %s\n",
> > > +			mode, xe_wedged_mode_to_string(mode),
> > > +			xe_sriov_mode_to_string(xe_device_sriov_mode(xe)));
> > > +		return -EPERM;
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +/**
> > > + * xe_wedged_mode_to_string - Convert enum value to string.
> > > + * @mode: the &xe_wedged_mode to convert
> > > + *
> > > + * Returns: wedged mode as a user friendly string.
> > > + */
> > > +const char *xe_wedged_mode_to_string(enum xe_wedged_mode mode)
> > > +{
> > > +	switch (mode) {
> > > +	case XE_WEDGED_MODE_NEVER:
> > > +		return "never";
> > > +	case XE_WEDGED_MODE_UPON_CRITICAL_ERROR:
> > > +		return "upon-critical-error";
> > > +	case XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET:
> > > +		return "upon-any-hang-no-reset";
> > > +	default:
> > > +		return "<invalid>";
> > > +	}
> > > +}
> > > +
> > > +void xe_device_wedged_init_early(struct xe_device *xe)
> > > +{
> > > +	xe->wedged.mode = xe_device_validate_wedged_mode(xe, xe_modparam.wedged_mode) ?
> > > +			  XE_DEFAULT_WEDGED_MODE : xe_modparam.wedged_mode;
> > > +	drm_dbg(&xe->drm, "wedged_mode: setting mode (%u) %s\n",
> > > +		xe->wedged.mode, xe_wedged_mode_to_string(xe->wedged.mode));
> > > +}
> > > +
> > > +static void xe_device_wedged_fini(struct drm_device *drm, void *arg)
> > > +{
> > > +	struct xe_device *xe = arg;
> > > +
> > > +	disable_work_sync(&xe->wedged.work);
> > > +
> > > +	if (atomic_read(&xe->wedged.flag))
> > > +		xe_pm_runtime_put(xe);
> > > +}
> > > +
> > > +int xe_device_wedged_init(struct xe_device *xe)
> > > +{
> > > +	INIT_WORK(&xe->wedged.work, wedged_work);
> > > +
> > > +	return drmm_add_action_or_reset(&xe->drm, xe_device_wedged_fini, xe);
> > > +}
> > > +
> > > diff --git a/drivers/gpu/drm/xe/xe_wedge.h b/drivers/gpu/drm/xe/xe_wedge.h
> > > new file mode 100644
> > > index 000000000000..fedb30c99398
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/xe/xe_wedge.h
> > > @@ -0,0 +1,24 @@
> > > +/* SPDX-License-Identifier: MIT */
> > > +/*
> > > + * Copyright © 2026 Intel Corporation
> > > + */
> > > +
> > > +#ifndef _XE_WEDGE_H_
> > > +#define _XE_WEDGE_H_
> > > +
> > > +#include <linux/atomic.h>
> > > +#include <linux/types.h>
> > > +
> > > +#include "xe_wedge_types.h"
> > > +
> > > +struct xe_device;
> > > +
> > > +void xe_device_wedged_init_early(struct xe_device *xe);
> > > +int xe_device_wedged_init(struct xe_device *xe);
> > > +void xe_device_set_wedged_method(struct xe_device *xe, unsigned long method);
> > > +void xe_device_declare_wedged(struct xe_device *xe);
> > > +bool xe_device_wedged(struct xe_device *xe);
> > > +int xe_device_validate_wedged_mode(struct xe_device *xe, unsigned int mode);
> > > +const char *xe_wedged_mode_to_string(enum xe_wedged_mode mode);
> > > +
> > > +#endif
> > > diff --git a/drivers/gpu/drm/xe/xe_wedge_types.h b/drivers/gpu/drm/xe/xe_wedge_types.h
> > > new file mode 100644
> > > index 000000000000..ffe7f9c64166
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/xe/xe_wedge_types.h
> > > @@ -0,0 +1,25 @@
> > > +/* SPDX-License-Identifier: MIT */
> > > +/*
> > > + * Copyright © 2026 Intel Corporation
> > > + */
> > > +
> > > +#ifndef _XE_WEDGE_TYPES_H_
> > > +#define _XE_WEDGE_TYPES_H_
> > > +
> > > +/**
> > > + * enum xe_wedged_mode - possible wedged modes
> > > + * @XE_WEDGED_MODE_NEVER: Device will never be declared wedged.
> > > + * @XE_WEDGED_MODE_UPON_CRITICAL_ERROR: Device will be declared wedged only
> > > + *	when critical error occurs like GT reset failure or firmware failure.
> > > + *	This is the default mode.
> > > + * @XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET: Device will be declared wedged on
> > > + *	any hang. In this mode, engine resets are disabled to avoid automatic
> > > + *	recovery attempts. This mode is primarily intended for debugging hangs.
> > > + */
> > > +enum xe_wedged_mode {
> > > +	XE_WEDGED_MODE_NEVER = 0,
> > > +	XE_WEDGED_MODE_UPON_CRITICAL_ERROR = 1,
> > > +	XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET = 2,
> > > +};
> > > +
> > > +#endif
> > > -- 
> > > 2.43.0
> > > 
