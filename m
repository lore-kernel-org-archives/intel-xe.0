Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE428C4345F
	for <intel-xe@archiver.kernel.org>; Fri, 19 Apr 2024 20:15:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B3FB112016;
	Fri, 19 Apr 2024 20:15:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZR+d5sRz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFC77112016
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Apr 2024 20:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713557703; x=1745093703;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zipkLVavNsS5SOTMWRvf4pefZO/FOB0mCYKKs0pA5bg=;
 b=ZR+d5sRzYiaWCnRFwC+BXvhcwcAEcaB1Z5vNwZPA57tQYk2x/NgVP/5K
 ToIjGBrtnMlZ5yQX0lgnCP2Bz5Wqcp7kUXFAX1iE6LxaRkY3XwrH/tIEY
 hatGeaZiRYXlNB4ZXv99e23yXu9kIc1jHyUUG7m7wXPIVQ/JMZvToaN8Z
 Pxo8MMSUJmwpgXPmyGmJ65Ps7ERNSsOg8Fv7B0JowHwry03CTA437+2og
 89w0zkorWeRWBl4QVTRW2StiipGnPFx7xrFAPyuqVBfgknFpX9LR6BVfk
 7KVqswG/Kps5IKNbhWd7prkACXnAIt79qeMtkZM7vzbwUNf3nzrZ8uRBL Q==;
X-CSE-ConnectionGUID: EpOVeLzbQmWSOoeNQsT+Yg==
X-CSE-MsgGUID: eScyra8rTs+yhTcnJaUvog==
X-IronPort-AV: E=McAfee;i="6600,9927,11049"; a="20317404"
X-IronPort-AV: E=Sophos;i="6.07,214,1708416000"; d="scan'208";a="20317404"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2024 13:15:02 -0700
X-CSE-ConnectionGUID: RZPYkECmT1WE0pVxv7r1EQ==
X-CSE-MsgGUID: LHGDLGKqQhuH4lumS8ZUNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,214,1708416000"; d="scan'208";a="28083074"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Apr 2024 13:15:01 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 19 Apr 2024 13:15:01 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 19 Apr 2024 13:15:01 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 19 Apr 2024 13:15:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZEo2+k26Ef+FkWjUsa6eT0hgxR9TaM0JSmYIoTpHDYpMl9SNxnwAjRHUTrE7k2xIAARq/17i0mtfKd5G13bpnr+u1x+VzCHCQfXHZjPOy/0mN2uIKi9qa7ViTx9LGEaIlg+Z8dM7+MWe1FnU+mkQcE5iXDCwE08kCwtBHgKaJYObvIOrk61+0on+lg8cmDIwop5iWV8pHfIMzfOB/aeGyanPcDNzrBbVbtax1k7Sd2CRKLAHcu0ld99c3Acyzo/JUQ9QQ9Q+5U+D+gzIH2JZKhbilBwlby9UAmXbHVlNRQw1vzrEsdQCjLJlXk7jYw1GIx+re0Cs/qtbxWEqSMXMow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5MZlxljtXlls8THNgMsPNKeCTrDduM67TnzMa81hZGo=;
 b=Q7Z4k/lbxFm7IB0s97vTwJvb0oT/3kL2JnrXZXltY6qX0xnfZKoNhvo/aYzKthxwlIVcLum533T52jDq2Lx81yfUj7iSv1QRtQ/SSh1dbIgkQ66U00nEdRCpwE+7YOZebqlEcceIZ9dKTPu+K5sOjWMrXLuW2GhP1wRBHKpiHsNOxKIYquD7MKlFU7Z3FxySKpCjIhwMgoL5CZsHTyEcejf5GubIR/aC59xYakPHhP6dzyz8/LSG6i8UaydKUlYdn5cdXcj1VHfIZJW41cdtPhqX1hF2pQ8zhEmhW8fOlV1Moj0Sft1HUozw/4IZKhiaQ5tmGTtSEr8BFeQoI4B3eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by SN7PR11MB6728.namprd11.prod.outlook.com (2603:10b6:806:264::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.39; Fri, 19 Apr
 2024 20:14:52 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d%5]) with mapi id 15.20.7472.037; Fri, 19 Apr 2024
 20:14:50 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Das, Nirmoy" <nirmoy.das@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Das, Nirmoy" <nirmoy.das@intel.com>
Subject: RE: [PATCH v3 4/7] drm/xe: Move vm bind bo validation to a helper
 function
Thread-Topic: [PATCH v3 4/7] drm/xe: Move vm bind bo validation to a helper
 function
Thread-Index: AQHaj0awaWSrdU3rGUe48Ydu97xOdbFwDcyQ
Date: Fri, 19 Apr 2024 20:14:50 +0000
Message-ID: <SA1PR11MB69914ECFCE726341EEF66C56920D2@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20240415145214.25641-1-nirmoy.das@intel.com>
 <20240415145214.25641-5-nirmoy.das@intel.com>
In-Reply-To: <20240415145214.25641-5-nirmoy.das@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|SN7PR11MB6728:EE_
x-ms-office365-filtering-correlation-id: 16ea06c1-2617-4e8d-ad0a-08dc60ad5e66
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: n0jcRwTh2dDOy6R4V4aoFVKHGu9nv/EA0IsnPbmEXt1UUJJtW9W4mDf7gVORJ4lVA26B/gYBy5dsjU9oJPsH5RRwNUWFBSlOG/yxm7VWC0GoqxWgLg5xyJ97wQYGdNqIBxk1WRDVmJ+kQwDS2AeAAaUZ4NmJYKrUZ3EoHWdkxdSVVHrHUKEMcncNDIjrzMhJOkotihINcwXFFnTcSuGADE/hSfOJ+DC0skc1QiYfYOalgbIlLu2K5apF3CosBPhHylnxetP1VxGPO4bQrfdbjkxLOaTnpdySOgCLv1iB/Bcn7CLhChhP/w+610zvN1WH7TxXfQq+QZurNMNwwhXY9vhjP1QDNjhFEaS8CYHwfBmgMzhCrpMU0GzV6KbLaShX6kRn66br4YPFMov1hxAi2r6N/j1h7tQG3xiRbFh5yqNgGCEGOROLw+XmKtwxHbW/d9+aCe5b36/oWfG5ko4ZeLgKXg+C++UxuyKa3zrjWNiZ1gl08r/Ji6r5eQTKfCpIyf7rnwblnNmIyUem2ZdMcWFB03RFmlEFrdT58ioAdvVzTHrzGPyOIzHcIYKz93kDmt5J1auPtvlwBIG/fc+4uVSdgHOJzbsLFuja9VMRbfpJX4M19mWRJjJ7gexGeTOiMd5ADIyCVqrDYVCDANJ8IIGhS4Iv0aJv88uU5LyAisSanJmLR0rv2Ffe0Q9qPr1qc6xcfSNMhcuw/q3WwhvAbPy7D2quf9jEIn1r9LWuInQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Yb8Wo1iZCmaOnP+TcidcvZgtpSQW7SBGaYsJGGN/tJ9WO/NJC2qKiWKtPHdV?=
 =?us-ascii?Q?+jHBNto93+9FCBO1hjVa064KaVY6Vgd8osHXSXpZGsfyI0WmUwoptMy8b/yd?=
 =?us-ascii?Q?o7jFGQi3OAf/C5quS3RdbRiXop1zOXMeI+zHzCZpCnVzfbdSslnI97KEtG96?=
 =?us-ascii?Q?y/7yZfc5EN7I5Afsf68Ai7gDgjvSccL1QOYLX2fCHpTj57SISGGtJzNQQZ9W?=
 =?us-ascii?Q?WDjqHBcxFQHgOSDU1/MliLIPXkqBWGVnegc+zMbL1AdOcZJWufbB2NrqQfI8?=
 =?us-ascii?Q?HlJti/PlSqCRxmqqVNK9qEaDLblRCmgswIN4iqAWQwLt1+Oj/Ft7YGDrI1DV?=
 =?us-ascii?Q?OEEQwmdlFqTK32Auo9qJ4r60N1AkDuvVIkdw4M4Sz3TUVemmAO/4agohe137?=
 =?us-ascii?Q?ErWbFVrG6UAyHeX4JXXVT3CajOA308IN11wU3cq7Yyw9JCnXQ0wa4nesy83t?=
 =?us-ascii?Q?7fEGJh8apurERulCI3i5qtkSu+so0AtzxfM8g5lcjR1A6vcEpcMQBVPRGiOX?=
 =?us-ascii?Q?8EhQckgTWKQCAVtPFSY9ADD86u5j7PKwqtB/Gl6T4Dt1KBhq2WbytuzHfPFH?=
 =?us-ascii?Q?PSD/Z3YJ26YC9KlgF+ads+B9prvBNnamrO5k+V2l8XTpPH5sP6vE1f+g+LQH?=
 =?us-ascii?Q?HVEf9RxrYhRGNwR2tYUC0Lgd0v7G6jIbbuhi0Py0zYdBKKyf0GL+ZDWBu0W5?=
 =?us-ascii?Q?ATdJmU62s3FRkCM1MEvisBl8ngtTJq17O06auHxh/hOEa17+kFtAvqDhAv5m?=
 =?us-ascii?Q?vnkOJFkB0eo+36jBIPDUZGbEgWRb1qClj7cCBKORzH5KEDIJ9mj8RVf1qZmY?=
 =?us-ascii?Q?JrppbjO/cU2QMnvm6zaqfVwNSX4ZQntNr2TDRLh5pxUJEs5euk2qXDhHoROF?=
 =?us-ascii?Q?0KSvm1398REC4+SonTq3UKGDy6zlj0ve1K3AegVisWRNiimLm0VPGtaiXLPw?=
 =?us-ascii?Q?bZmlwiO1gougUICEhSWfzi/JDwmKb2iHcOVtA4I78AMpEnZ2gApT+LAWcskX?=
 =?us-ascii?Q?0MMtzG+VoP/N+TAtPlMlUfLaRWMVtQjQvltk4OX1HwsLinNtDXDYfURPLdPg?=
 =?us-ascii?Q?nGljagQjd233KF+ylispT/d8YnKYBS1LkQvqK4/x9PiXyQfZ7xQjuKlaCYhJ?=
 =?us-ascii?Q?+aLURqqAhCZKcu888WbGbNrT89Xhs86i+ShAWZAPtwtP3JJpAmnMb3F+z+5m?=
 =?us-ascii?Q?ejI0cPG59eLBuum4XP1wKrH+Sr4e+iqXAsIaca6rlEaRdgq4Mq1lg/AqII96?=
 =?us-ascii?Q?gpNmYI9tZbzJeiCAKXAi9rHhwS+ySBRFv9fr6Bin6uLvhD7I37NhRfqhqjCS?=
 =?us-ascii?Q?h5g9bEkwmBE7VWGDYHv6ei2DogJD4iR5DhPNqPFw8gZ/zCcpdAWOmsAAHwNF?=
 =?us-ascii?Q?6X65szUk1Pv8aWQRaer+QHqPIQxQH2ca55qV7N3rgTEYOX/lv6BvLtxQEbQH?=
 =?us-ascii?Q?fmb63K56NiV7W0rr0r8uou74kcDZnZTceondxAfzM89KFRILrSgw+y6q06xW?=
 =?us-ascii?Q?JkIkmH5FkiB0RswD2vSO4RA/dO+BcfTlQ8p7XoRAI31LYRSKGsAk5riQhIVa?=
 =?us-ascii?Q?6qeWGy72pjLEZ9z2pmyifb2tFLsQrVofQIUiiwa4?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16ea06c1-2617-4e8d-ad0a-08dc60ad5e66
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2024 20:14:50.8716 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bAB6CIzvDBm6gOqbFFrARYVA/60gvqmOAsu8+TqL0tz8gCd43otUvQZsyorzlMnKLc7MfpeHb1ayZypvLfsUig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6728
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

Reviewed-by: Oak Zeng <oak.zeng@intel.com>

> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
> Nirmoy Das
> Sent: Monday, April 15, 2024 10:52 AM
> To: intel-xe@lists.freedesktop.org
> Cc: Das, Nirmoy <nirmoy.das@intel.com>
> Subject: [PATCH v3 4/7] drm/xe: Move vm bind bo validation to a helper
> function
>=20
> Move vm bind bo validation to a helper function to make the
> xe_vm_bind_ioctl() more readable.
>=20
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c | 77 +++++++++++++++++++++-----------------
>  1 file changed, 43 insertions(+), 34 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index b1dcaa35b6cc..8380f1d23074 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2872,6 +2872,46 @@ static int vm_bind_ioctl_signal_fences(struct
> xe_vm *vm,
>  	return err;
>  }
>=20
> +static int xe_vm_bind_ioctl_validate_bo(struct xe_device *xe, struct xe_=
bo
> *bo,
> +					u64 addr, u64 range, u64 obj_offset,
> +					u16 pat_index)
> +{
> +	u16 coh_mode;
> +
> +	if (XE_IOCTL_DBG(xe, range > bo->size) ||
> +	    XE_IOCTL_DBG(xe, obj_offset >
> +			 bo->size - range)) {
> +		return -EINVAL;
> +	}
> +
> +	if (bo->flags & XE_BO_FLAG_INTERNAL_64K) {
> +		if (XE_IOCTL_DBG(xe, obj_offset &
> +				 XE_64K_PAGE_MASK) ||
> +		    XE_IOCTL_DBG(xe, addr & XE_64K_PAGE_MASK) ||
> +		    XE_IOCTL_DBG(xe, range & XE_64K_PAGE_MASK)) {
> +			return  -EINVAL;
> +		}
> +	}
> +
> +	coh_mode =3D xe_pat_index_get_coh_mode(xe, pat_index);
> +	if (bo->cpu_caching) {
> +		if (XE_IOCTL_DBG(xe, coh_mode =3D=3D XE_COH_NONE &&
> +				 bo->cpu_caching =3D=3D
> DRM_XE_GEM_CPU_CACHING_WB)) {
> +			return  -EINVAL;
> +		}
> +	} else if (XE_IOCTL_DBG(xe, coh_mode =3D=3D XE_COH_NONE)) {
> +		/*
> +		 * Imported dma-buf from a different device should
> +		 * require 1way or 2way coherency since we don't know
> +		 * how it was mapped on the CPU. Just assume is it
> +		 * potentially cached on CPU side.
> +		 */
> +		return  -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
>  int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file
> *file)
>  {
>  	struct xe_device *xe =3D to_xe_device(dev);
> @@ -2955,7 +2995,6 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void
> *data, struct drm_file *file)
>  		u32 obj =3D bind_ops[i].obj;
>  		u64 obj_offset =3D bind_ops[i].obj_offset;
>  		u16 pat_index =3D bind_ops[i].pat_index;
> -		u16 coh_mode;
>=20
>  		if (!obj)
>  			continue;
> @@ -2967,40 +3006,10 @@ int xe_vm_bind_ioctl(struct drm_device *dev,
> void *data, struct drm_file *file)
>  		}
>  		bos[i] =3D gem_to_xe_bo(gem_obj);
>=20
> -		if (XE_IOCTL_DBG(xe, range > bos[i]->size) ||
> -		    XE_IOCTL_DBG(xe, obj_offset >
> -				 bos[i]->size - range)) {
> -			err =3D -EINVAL;
> -			goto put_obj;
> -		}
> -
> -		if (bos[i]->flags & XE_BO_FLAG_INTERNAL_64K) {
> -			if (XE_IOCTL_DBG(xe, obj_offset &
> -					 XE_64K_PAGE_MASK) ||
> -			    XE_IOCTL_DBG(xe, addr & XE_64K_PAGE_MASK)
> ||
> -			    XE_IOCTL_DBG(xe, range & XE_64K_PAGE_MASK))
> {
> -				err =3D -EINVAL;
> -				goto put_obj;
> -			}
> -		}
> -
> -		coh_mode =3D xe_pat_index_get_coh_mode(xe, pat_index);
> -		if (bos[i]->cpu_caching) {
> -			if (XE_IOCTL_DBG(xe, coh_mode =3D=3D XE_COH_NONE
> &&
> -					 bos[i]->cpu_caching =3D=3D
> DRM_XE_GEM_CPU_CACHING_WB)) {
> -				err =3D -EINVAL;
> -				goto put_obj;
> -			}
> -		} else if (XE_IOCTL_DBG(xe, coh_mode =3D=3D XE_COH_NONE)) {
> -			/*
> -			 * Imported dma-buf from a different device should
> -			 * require 1way or 2way coherency since we don't
> know
> -			 * how it was mapped on the CPU. Just assume is it
> -			 * potentially cached on CPU side.
> -			 */
> -			err =3D -EINVAL;
> +		err =3D xe_vm_bind_ioctl_validate_bo(xe, bos[i], addr, range,
> +						   obj_offset, pat_index);
> +		if (err)
>  			goto put_obj;
> -		}
>  	}
>=20
>  	if (args->num_syncs) {
> --
> 2.42.0

