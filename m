Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46139C25B76
	for <intel-xe@archiver.kernel.org>; Wed,  5 Jun 2024 22:05:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A59F410E148;
	Wed,  5 Jun 2024 22:05:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kWF7HKho";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 347CE10E148
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Jun 2024 22:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717625122; x=1749161122;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=eQRQ5+qmxbmj83kI6eYVetohvjCeFvcblj9KtqRDDaM=;
 b=kWF7HKho5RjoRjVE2/Jfdx6iM6AuXo+yE5pBG5A0smPyKcW8rdT95WwV
 SvWgcg3kb89Nfl1AA4LBI+LFmFhtaFWgY3pKt1MWtbg3v1XOXrhC5YB6P
 sqvHNPuAC40x9DfIajVSc7n+4B905SmgB9OFS6Zrn3i8qfDOuVhBHhLUJ
 +P1H1tRer7Evf0z/wBHeGJkbPfj1dl1OSDUaWk1xKgR3sfLnfc9p98oU2
 VSldEmqBfClT3wN0eekp5z5LsEnjp6NYUvK3wQmocWW+66pWdxFu3eWQU
 iQK7zjYK8002kjLQyoRFSLxiN9Jqe1Es7z/ugsNQWAk9S8c/J/VgughP0 g==;
X-CSE-ConnectionGUID: pvyE9Ie8SfCKHlLHlBiWuw==
X-CSE-MsgGUID: v3qrPks1Q425ZE7FnbQe7g==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="24918602"
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000"; d="scan'208";a="24918602"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 15:05:20 -0700
X-CSE-ConnectionGUID: RhdjvYmxRsKaqSl9mWh85A==
X-CSE-MsgGUID: qidPXhEYTESANVaf52lSZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000"; d="scan'208";a="42188445"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Jun 2024 15:04:41 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 5 Jun 2024 15:04:40 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 5 Jun 2024 15:04:40 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.45) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 5 Jun 2024 15:04:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SdfQeN+VRJIotwZAGojAtvZsL63Eh/k5IUCIgJvs3v6/iE/50ZCiL/hU/gp08qsUmyMNCsntXD+NNREMfJhlUeaM0CDrHcaq+Fq5aofWDbuklU+BbnlsOsIu2SvbUwgQrjgTHjwslLBBIqEMvdj/4TMAg6yu65cD6TrI/7ZeK2IHXh9RvA+9oUNWoafakuLAJlc8perPZt5q3TC+EV2Ll5TyY+17C4DbAruCAmnUPuIJoHU7qnBPx/fnt/aFqs31pc9IRVl8vhF7TRFYWaye5GxQV22Sfdsg7GmixV5QRUNWPBsFNuP6l2UBF3FUypKFOa9PaZtYSjB8FbNT3TlzhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wrayCNgXP0vgc4IaFYmqcgwGiLusx7sHmrL0Ubggw9M=;
 b=BMhXJgG9o9nT1NygWMN8C4fRKYT7F3pLY6Aqdr2116MC9kri6LQseMekoM/FENfKmCCWi5mkPvmrZcYex9v+3n0+1PXDQ0aw72pd4Ge2J/cX08t9+Snk45ySl4s4iHSCqhNfAzmepNuJhVhKHZLyiMRTTdd2JQfFPWV6/7UfVdJHfMNjpPWPrQkV5PShaBZYTYrgewwFSEcXY6fGsmHO1peBPVHCxFXzYqfcFX9prrsPucbFPqtb5lbySZ+E/aIpa+TnLoFxJUiFJco7zVS/R55ujI95z2lQ9lPSfmI4/7uMdweDLNGJB4AYpMa05rmCmKJrGkyglbiJ7IXwnWKfHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by PH8PR11MB7992.namprd11.prod.outlook.com (2603:10b6:510:25b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.27; Wed, 5 Jun
 2024 22:04:37 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7633.021; Wed, 5 Jun 2024
 22:04:37 +0000
Date: Wed, 5 Jun 2024 18:04:34 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
CC: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Francois
 Dugast" <francois.dugast@intel.com>, "Souza, Jose" <jose.souza@intel.com>
Subject: Re: [PATCH] drm/xe: Drop EXEC_QUEUE_FLAG_BANNED
Message-ID: <ZmDg8mpQ1J0lF9D7@intel.com>
References: <20240604184700.1946918-1-matthew.brost@intel.com>
 <CH0PR11MB5444AE223F9CEA03E93C37E6E5F92@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CH0PR11MB5444AE223F9CEA03E93C37E6E5F92@CH0PR11MB5444.namprd11.prod.outlook.com>
X-ClientProxiedBy: BYAPR11CA0100.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::41) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|PH8PR11MB7992:EE_
X-MS-Office365-Filtering-Correlation-Id: b7e5ce32-e1cb-46c2-3a09-08dc85ab7d4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?WyfCbfZc7Po1zjADFv7Jdi61bFqggw48Wxu5uNGHAYHNwKHArCIQcCSMdg?=
 =?iso-8859-1?Q?qgoiKAKv4B0iioLTsK0BJr59Fd8hB8jSi0xGl84NZVv7/A68NEpOLGiBAP?=
 =?iso-8859-1?Q?5e/OhSp045eNUfGQDXGejeGTaLgZsuvRizX8DfOj0ZUuNJpVgJKIhhrrsH?=
 =?iso-8859-1?Q?VOu7DCOMBdtUsSQSUpIW+3PMLN9N9yzqHD6MURMBhHhbu7Sw3NDo6tTfP9?=
 =?iso-8859-1?Q?5LPm2Bag5qcRmFPRM80RDzcAvKkns8lA0o7Rw/e7gj2+i/4f0VFrA1a/67?=
 =?iso-8859-1?Q?1iP5v2kelcqCPJZhOGB4xp7caY2IJAnvsn7eoKQjRc9gqwBGH4AQOIG0Wj?=
 =?iso-8859-1?Q?3cSyiBTPhzjNx275n03lQTsnYD4Ryww1E2unuogf228+/q83ThvLt08i0P?=
 =?iso-8859-1?Q?TagjLhwm0I77mUzBv2uS8EQ4CVRgzZj1MyryBBZmOFXyL/UyMUwsEsjlOt?=
 =?iso-8859-1?Q?J4ftto3geisir9LUhKtKviyyYIL6jlnTFRyun4LfIP2+9ue5I41FDWuXjI?=
 =?iso-8859-1?Q?gElnBy8ydEj8yc/iVgsxEEVXiLF8LmD129GX2hCXbQ33/vr+w/t8Zi0O5q?=
 =?iso-8859-1?Q?Hj7tKGypolcWbfgZBFI9+f2agkgyqbhxAaEh1/jc8DWX7kXvCo09OJWizJ?=
 =?iso-8859-1?Q?eE6Fnl2NeMzHgen86sXrupTyYsJhVUQF+5j7Jvp6K3xw8RqsVYF0e33a82?=
 =?iso-8859-1?Q?veegicO3jNfVF83qotdxo7WPVPODfk+XiXua47TJEHtVPfR9gP1UoMPOd4?=
 =?iso-8859-1?Q?pjmsCGRGSE72XgXSTJFaf6Lty+LO+0AW046SFrUsBTQCmJX1kAlvctDeDE?=
 =?iso-8859-1?Q?/+wm6OWpL4rEEII075r1trQCSTykvuqqrDT+ZNkSuYqhisgx8iIKfbwiOn?=
 =?iso-8859-1?Q?t/TANt+MH++2fE5K6kZF07L+md8zloUmYyGknWuqg0SA9m1M9mj8ZLp8+G?=
 =?iso-8859-1?Q?hJxtJe/Rs2D6pmsUL2oUB1+ehyT30xkLdKYtiH608677QLMCdSYZHjGMof?=
 =?iso-8859-1?Q?vuatQLCC0+NwIP/CzKDY7NKn27PaCre2UVODIRl1AW8i4wIS+dSDnxcNU9?=
 =?iso-8859-1?Q?k4Qt9hbiv/L17dg8v8tsA87d+gJJwW3LO8o4zMS2ZOzjujak6hBBa5xZ9I?=
 =?iso-8859-1?Q?QgLXknlJhM08/WHIIPfIcJtgh4GFPGqJzGZtXFLffzrhIU4sJ0JVPNe7vl?=
 =?iso-8859-1?Q?wNVo3g2cRBsPX0UUB14d/mw6kI7dvX+SlBoh7KLe2BgKF36zqf9xDmoI4X?=
 =?iso-8859-1?Q?lxhUgvUtmQLEwTzCoa85o7HMhJ4Rn5VeM9G4PKsESsyEOQ4eU6NnApPsax?=
 =?iso-8859-1?Q?1AQlvjwWR3XLJXCoKZsdbi/9rJXhFeLudg3wPUGNr9QdwgWQHnQKyrvHlo?=
 =?iso-8859-1?Q?B+mXxO3mxO?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?bieJuyiKuxzpfT3GWlmHYqnJyB3bn+7g45LOicxLVAry9ZeEM5ZGjjIqoi?=
 =?iso-8859-1?Q?kw/pkS6Wzhwia1qz5bRXXqSouZ0S1xEKYJYi/b0felRHi0vf7U8r/UXaQA?=
 =?iso-8859-1?Q?lRYBsrmGptIaiwGf5wa4yhuwgchjtE0kvAYImF5mNIwmFAsRYyIIuE5p75?=
 =?iso-8859-1?Q?kbIQk9qf0QjwdSnXe8CgmanqwzSI6huZlHPQytIdZQqCHd/sRils/v7oBj?=
 =?iso-8859-1?Q?+uHDWRoeEgUCi5iPnMbZ5yOu5CNDmmUNoABSXycna6Yk+ZORRg22LDKnal?=
 =?iso-8859-1?Q?SWUoLQYXToa6FmdKJuYxyUp+iSuXYi0C8oAncF8CnVsxfPxqz3tFM3qF3e?=
 =?iso-8859-1?Q?5dwfWgAfkE2r9BI4IXicqdhS4XUAXB+hTeSXtNoND2HQGwEU2Ajnn58IKX?=
 =?iso-8859-1?Q?Q6z71vuvxp2k8/wGzyy0CBP9FyRRrgFDFJl5yJSPEYAHNs4cr/cpll3HM9?=
 =?iso-8859-1?Q?ptQ7tITgitVAVTUyvoVEVC8ocSXaiUZ5mXbW4kK1QBXCqamWPQgSnsB1tY?=
 =?iso-8859-1?Q?hcBq1Q34tuasIKbfNvAZpD6K9D2CA+NDwc13I6/Y/l/amUdPqGd/0fRZ0V?=
 =?iso-8859-1?Q?4uXNn+TM4dupjpUm5UXv9Ntivh90JEnpKI9w6xSW/Oc3OBFfbwZ0xZ+sLB?=
 =?iso-8859-1?Q?JSKAvWZ/Pn654djsgpbW/IRSP6VJThxzqcUxY88vIa6e2Fz+4pgkWV+sSx?=
 =?iso-8859-1?Q?mSkQiTvUVLQl6j1OUDxkLOWVqk/BzfKAC1mvsLMwLsw6PCmpr3LMbSimYN?=
 =?iso-8859-1?Q?fVv599ThxAIlP7uZ9rlf0lOeIUBMpGKUI4PsqcE+9Kqm0xD/H9fqSFoEiB?=
 =?iso-8859-1?Q?G0Pv37M3bymxhRs3EDCyuq5PhmxFzoiXd4i1JnXTnSiSYbuNpTzlqkL7xl?=
 =?iso-8859-1?Q?SDp/yuM7Di3U4L1NRAWgwBgf2rGFFG3tO15wdos4QuuCWwLKLDLu7od1BV?=
 =?iso-8859-1?Q?otddw4Xm2X6UimWrs7Lo4O6ZnBaFK5Ha95zWf8gcfWNXj0fp7Jf8rxJ0zT?=
 =?iso-8859-1?Q?1nSvmSeF+AVTEjK2jWz1zG+QsEa0NpwsKtkYaTVD+fKsiOzl0bswC/JfUj?=
 =?iso-8859-1?Q?y7/zyPl1gubBCEL39j9yKPrX2VEPXWqMNw5/mwcGsq7D7PEopzx3Cjp7EB?=
 =?iso-8859-1?Q?9gnFElX5Va8mg4OLSWY5nl+LtHGqGGijEcqFN+e7SKtyJQF/Aaa4KKeLik?=
 =?iso-8859-1?Q?EveVZl3agBvoKxJmDQ7kjd2lDT3RQlUsaFDkZPExnPhkvm37EHIBXFc9HR?=
 =?iso-8859-1?Q?e/GSAk3OXh5Hc9dB2WZ5yKCrs8G41ZOeDyQ8U5sMAPx83jgsrBXQqsIgYF?=
 =?iso-8859-1?Q?452ZTonNAkxCTdSu99JZ75dSk4EVpT97RbmGCpNhnlu/nFm6Sdz9TgEJvZ?=
 =?iso-8859-1?Q?gFZhvNQFg9giHelv+ia5sLfsTioIWHL0oD4btZXKMYJblHe12gFz7tnA1S?=
 =?iso-8859-1?Q?XMh9bZzORgm5B+1zqsiEyNGg3sumskFjvcn4xbgI8idUTKOBEcJNeWSIuW?=
 =?iso-8859-1?Q?UCSi39p4su7WlesxlETJ69oSSah0y1n2MGBrxl+hpE9XTHpCG+AgUi1h4N?=
 =?iso-8859-1?Q?UGmxqg/vFLNqhlKIkYztvJFqqvcryK1y0cwUzz3feHnKOVbQ7TEjZVHlvD?=
 =?iso-8859-1?Q?44npomnEd7+Mk3B3UyBDdiN1IVhAVEyFyR?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b7e5ce32-e1cb-46c2-3a09-08dc85ab7d4f
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2024 22:04:37.1709 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EuQabAGm2n9StaF8cFjNvdBld+4avaLJENkTqE12GR5qw07oCBnDMBqiYtpTsJyTPlLwT0o3S55JN9/GFNutVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7992
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

On Wed, Jun 05, 2024 at 09:01:06PM +0000, Cavitt, Jonathan wrote:
> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Matthew Brost
> Sent: Tuesday, June 4, 2024 11:47 AM
> To: intel-xe@lists.freedesktop.org
> Cc: Brost, Matthew <matthew.brost@intel.com>
> Subject: [PATCH] drm/xe: Drop EXEC_QUEUE_FLAG_BANNED

please prefer drm/xe/uapi: when the changes impact uapi.

> > 
> > Clean up laying violation of setting q->flags EXEC_QUEUE_FLAG_BANNED bit
> > in GuC backend. Move banned to GuC owned bit and report banned status to
> > upper layers via reset_status vfunc. This is a slight change in behavior
> > as reset_status returns true if wedged or killed bits set too, but in
> > all of these cases submission to queue is no longer allowed.

This is an uapi change that is in use by mesa and we cannot regress.
We need to ensure that no user space is really using that before we can
apply anything like this.

Cc: José Roberto de Souza <jose.souza@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>

> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_exec.c             |  2 +-
> >  drivers/gpu/drm/xe/xe_exec_queue.c       |  2 +-
> >  drivers/gpu/drm/xe/xe_exec_queue_types.h | 12 +++++-------
> >  drivers/gpu/drm/xe/xe_guc_submit.c       | 10 ++++++----
> >  4 files changed, 13 insertions(+), 13 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> > index 97eeb973e897..4cf6c6ab4866 100644
> > --- a/drivers/gpu/drm/xe/xe_exec.c
> > +++ b/drivers/gpu/drm/xe/xe_exec.c
> > @@ -141,7 +141,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> >  			 q->width != args->num_batch_buffer))
> >  		return -EINVAL;
> >  
> > -	if (XE_IOCTL_DBG(xe, q->flags & EXEC_QUEUE_FLAG_BANNED)) {
> > +	if (XE_IOCTL_DBG(xe, q->ops->reset_status(q))) {
> >  		err = -ECANCELED;
> >  		goto err_exec_queue;
> >  	}
> > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> > index 27215075c799..cf45df0328da 100644
> > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> > @@ -677,7 +677,7 @@ int xe_exec_queue_get_property_ioctl(struct drm_device *dev, void *data,
> >  
> >  	switch (args->property) {
> >  	case DRM_XE_EXEC_QUEUE_GET_PROPERTY_BAN:
> > -		args->value = !!(q->flags & EXEC_QUEUE_FLAG_BANNED);
> > +		args->value = q->ops->reset_status(q);
> 
> LGTM.
> 
> Maybe migrating over to using q->ops->reset_status could be done later, and
> instead we could just check the EXEC_QUEUE_STATE_BANNED flag directly for
> now, saving the change to reset_status for a separate patch.  That way, we'd
> have more room to justify this change in the commit message separately from
> the one made to the EXEC_QUEUE_FLAG_BANNED.  But it's not strictly
> necessary, IMO.
> 
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> -Jonathan Cavitt
> 
> >  		ret = 0;
> >  		break;
> >  	default:
> > diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > index 18d8b2a60928..f0c5f82ce7e3 100644
> > --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > @@ -70,18 +70,16 @@ struct xe_exec_queue {
> >  	 */
> >  	struct dma_fence *last_fence;
> >  
> > -/* queue no longer allowed to submit */
> > -#define EXEC_QUEUE_FLAG_BANNED			BIT(0)
> >  /* queue used for kernel submission only */
> > -#define EXEC_QUEUE_FLAG_KERNEL			BIT(1)
> > +#define EXEC_QUEUE_FLAG_KERNEL			BIT(0)
> >  /* kernel engine only destroyed at driver unload */
> > -#define EXEC_QUEUE_FLAG_PERMANENT		BIT(2)
> > +#define EXEC_QUEUE_FLAG_PERMANENT		BIT(1)
> >  /* for VM jobs. Caller needs to hold rpm ref when creating queue with this flag */
> > -#define EXEC_QUEUE_FLAG_VM			BIT(3)
> > +#define EXEC_QUEUE_FLAG_VM			BIT(2)
> >  /* child of VM queue for multi-tile VM jobs */
> > -#define EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD	BIT(4)
> > +#define EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD	BIT(3)
> >  /* kernel exec_queue only, set priority to highest level */
> > -#define EXEC_QUEUE_FLAG_HIGH_PRIORITY		BIT(5)
> > +#define EXEC_QUEUE_FLAG_HIGH_PRIORITY		BIT(4)
> >  
> >  	/**
> >  	 * @flags: flags for this exec queue, should statically setup aside from ban
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index 47aab04cf34f..4464ba337d12 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -61,6 +61,7 @@ exec_queue_to_guc(struct xe_exec_queue *q)
> >  #define EXEC_QUEUE_STATE_RESET			(1 << 6)
> >  #define EXEC_QUEUE_STATE_KILLED			(1 << 7)
> >  #define EXEC_QUEUE_STATE_WEDGED			(1 << 8)
> > +#define EXEC_QUEUE_STATE_BANNED			(1 << 9)
> >  
> >  static bool exec_queue_registered(struct xe_exec_queue *q)
> >  {
> > @@ -134,12 +135,12 @@ static void set_exec_queue_destroyed(struct xe_exec_queue *q)
> >  
> >  static bool exec_queue_banned(struct xe_exec_queue *q)
> >  {
> > -	return (q->flags & EXEC_QUEUE_FLAG_BANNED);
> > +	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_BANNED;
> >  }
> >  
> >  static void set_exec_queue_banned(struct xe_exec_queue *q)
> >  {
> > -	q->flags |= EXEC_QUEUE_FLAG_BANNED;
> > +	atomic_or(EXEC_QUEUE_STATE_BANNED, &q->guc->state);
> >  }
> >  
> >  static bool exec_queue_suspended(struct xe_exec_queue *q)
> > @@ -189,8 +190,9 @@ static void set_exec_queue_wedged(struct xe_exec_queue *q)
> >  
> >  static bool exec_queue_killed_or_banned_or_wedged(struct xe_exec_queue *q)
> >  {
> > -	return exec_queue_banned(q) || (atomic_read(&q->guc->state) &
> > -		(EXEC_QUEUE_STATE_WEDGED | EXEC_QUEUE_STATE_KILLED));
> > +	return (atomic_read(&q->guc->state) &
> > +		(EXEC_QUEUE_STATE_WEDGED | EXEC_QUEUE_STATE_KILLED |
> > +		 EXEC_QUEUE_STATE_BANNED));
> >  }
> >  
> >  #ifdef CONFIG_PROVE_LOCKING
> > -- 
> > 2.34.1
> > 
> > 
