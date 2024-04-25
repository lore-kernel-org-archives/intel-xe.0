Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEED8C4345F
	for <intel-xe@archiver.kernel.org>; Thu, 25 Apr 2024 07:20:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81CA611A216;
	Thu, 25 Apr 2024 07:20:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P6yvBRyZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15E9111A217
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Apr 2024 07:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714029603; x=1745565603;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=//J8+5V4pao3TSsf03WzxoYzcST7W8/ATpF/d3KrTlw=;
 b=P6yvBRyZDIKJPQD4IhV+DIFM7RGaH8rV020LvpEBM44GKlbGWD9ImJUH
 wf9bO11j/cmb1gG9xleloNO67ZiNsz4MPNNwKfRZvepWNNmCjusy4Bldy
 DD5N2sCCzntOxegahtOYwO4gF60cNOEoGLTv7OZhcBOqckjLjkKXtMaAS
 j02UwzvgfDbDo+vfOhn3BU+SLoob0MzYDUNLUkGt2qh4mHMOewnlbwpiW
 oCLVW2pbEi3Ig7UrAksRAtLX3n0BdvPtCBYAgMpzXRfYAFcdBL4iftDc7
 T8ZgNL0U2wpzcoaDvkWbEP0GaDcZAjbOZsfBKZ7J2huQamDypGIZXizGu w==;
X-CSE-ConnectionGUID: GK82hBBbQuuip7sS+yCfyQ==
X-CSE-MsgGUID: BQq8z83yTdyR86YWiN6NzQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="9544694"
X-IronPort-AV: E=Sophos;i="6.07,228,1708416000"; 
   d="scan'208";a="9544694"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 00:20:02 -0700
X-CSE-ConnectionGUID: 3QhIh9ggRQONZNTRJcW97Q==
X-CSE-MsgGUID: M1V0aiueQMGHIpCFZInqJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,228,1708416000"; d="scan'208";a="25074922"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Apr 2024 00:20:02 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 25 Apr 2024 00:20:02 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 25 Apr 2024 00:20:01 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 25 Apr 2024 00:20:01 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 25 Apr 2024 00:20:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LEbYPF6KmBwq70JStGvdhHaHjH7ehgbH728UuDFk2DDZOsZeSA73OoPaApopYxLh0bwLT3MMLnwXTciST90DrzhtxnbXR+OJIM/mxcilXLZTCScGDakgfSWkVTnSkZmdjkRaIO4zHLTwdqTpsp8xF81DLjD8gFWMFblbPTPBuUev5qIuSRW8KTKPQ3XfaRJEYxA6UXROnLZQZ19XJHDwfptZOSLdANNASXKDs18VUwXjxpVVwuKY7M1Acbizl7oIlp9Lunp1qECZeC3TinQ4uXT2TpKeO3ECeyj36sONoJC9q/grwsH9z0iweTKIrhF45oqWMtj35vdOQ6l87ll9Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HPY1oqXGpGpQ61fZO+8WJ2CF2zZquWz/sQheL2X1LKc=;
 b=oeM4AjDfvzpivfj9s1/MIRHo2Yrf10SCdBrTas/DLfbsdMW45nas10qF1zegE73XJUhJ2lDz9tbW6clhOJNZUCXKS6IL/Ba4NU0E0IOnG6RkPWqR1nNbr1EAabOtfagapbqwYkPfFxvSVInD+NukUCsWs+TE1KwNlPqWXgnSkB304h75PFwmWaE+qn9NsNaI8SgElRgMQ9Hc3KQrwhGDTTc2Bx56c4Vkf8j+ZRXBBisDKOCJZBNtoiDgetVx1Y+Mpv4xDPlpVp/zhL5FnP6aqNjB4qGrzKLsNck4f3imrcznd2dFL9QaMjpKTcgGHlEQnl+nNBodEOX1iUtBURWtFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by SJ0PR11MB4909.namprd11.prod.outlook.com (2603:10b6:a03:2af::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.22; Thu, 25 Apr
 2024 07:19:59 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::ff2a:1235:d1ba:4f93]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::ff2a:1235:d1ba:4f93%3]) with mapi id 15.20.7519.021; Thu, 25 Apr 2024
 07:19:59 +0000
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>
Subject: RE: [PATCH] drm/xe: Delete unused GuC submission_state.suspend
Thread-Topic: [PATCH] drm/xe: Delete unused GuC submission_state.suspend
Thread-Index: AQHaltQUzW4a/OWzRk+t5X2oBmdTibF4lDug
Date: Thu, 25 Apr 2024 07:19:59 +0000
Message-ID: <MW4PR11MB7056D5BFD3F0FFFC9387D73EB3172@MW4PR11MB7056.namprd11.prod.outlook.com>
References: <20240425054747.1918811-1-matthew.brost@intel.com>
In-Reply-To: <20240425054747.1918811-1-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB7056:EE_|SJ0PR11MB4909:EE_
x-ms-office365-filtering-correlation-id: 3d6df9cb-68a7-4462-c62e-08dc64f81e16
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|1800799015|376005|366007|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?zJA59sKob6KB3gx59PjH9aXi5xsdVMdzoC4UrGx5MOuJgoH/YUkRqOu8XAV/?=
 =?us-ascii?Q?EEQJxMdjoyvosnwF5fJCHH+b6vX+f8YoSqTNOEuGSwfvNSyWqjjk7LnEsnki?=
 =?us-ascii?Q?EwZJK23qS6ixkAyws3FVzxKdUm4cC4D5hu5B8bO3gnCMASyAr2uYVbogu3X7?=
 =?us-ascii?Q?14kMZ0PhHK8bhxtKsQ+BWyG8tPMXKlSZ4z3yNQZoYY9ccxwQhx3y5kQ1zo71?=
 =?us-ascii?Q?Zh5YKJgHyJKc+k5SP3TQV9/1drnjC45aG8WJJ4DYNibyyWuQf+zBuUOKCEUi?=
 =?us-ascii?Q?tkF/dxCnPFmcpcsNhUxoOo85zfI9+XXCrj19n8pmOHjLpaK5hDERpcO6oQxo?=
 =?us-ascii?Q?d2ZuZARlWgUITMPIEue2f3cthGE1BOjKwSl6QYkG+w3J5XDe6hSZz3v3wbWD?=
 =?us-ascii?Q?a5OFhnUMLodkZqFxATbE2mpD/PdcE9KmKQAGjbW5A8+uvxEvKgKUw+47a3Da?=
 =?us-ascii?Q?P40t/KyH3bE6YBIURRmzbkZ9urZRNdJA5o+d4vG97LvCIwR4gg+19lWictcn?=
 =?us-ascii?Q?jI/ozmD1uRMOEoeghi/IKQkKysFQc0qKuiOAFVO8u5h9t3ooHsnOzPZlsNuk?=
 =?us-ascii?Q?LJ/0ne6201l42eLWo3IaHONajHfm2h0Wbo0W1U6+rTeYNs468ezRg7W/qPC+?=
 =?us-ascii?Q?DdNFMEK+3jBMX67elbwxp6s/EYqZH8eQ5Q2TOCIfmDSXbkYr6gcvf5GlXZJn?=
 =?us-ascii?Q?Ydeo48WIuWXnTFNzG3YJd0r+57kSZA1DI3ZYZ6m+KGlrxZ22kC4kd4+yJJmJ?=
 =?us-ascii?Q?jGaPS0+5tdb9lFGkIVNy3utCf99pb7sOfCPgHIiz2j23DPGzSjwSCvdsMySp?=
 =?us-ascii?Q?czSz6uVZ4QqmNoqbIhNgbZXxtSYa1Nm0vJZmW1k87nknQFGIP4zf02LBdKSc?=
 =?us-ascii?Q?Q6VlhcpzKGtDfU0/Fr1/m9nGK88XL5GSk68SdhBf3ql9yqVfC4yWurVsNTYQ?=
 =?us-ascii?Q?ZW4q8er5+BdQwzqZY3Wrb1E0EDnUx9phS1O5C+EvVc80xYcL5iXRMbTsKKHf?=
 =?us-ascii?Q?wxFx9rkzyezK3SNJRzNGQmiDAAJSmFmLvoaleJNWc4h+XseSJxTJvpeL6ttJ?=
 =?us-ascii?Q?l/GUUpfVnvwCKc18siGdu/d8BwxxWw+s02fFzFfJYcDMFdhS+1ozfOdrK+bw?=
 =?us-ascii?Q?6OL5qbRCnG7YV5jNtdLhLALlEHuRHl29BorugGQkbowYyKjB3OqaeNmXMuqC?=
 =?us-ascii?Q?Mvp6YHtIHbfbgjsrnjVkbfLeW7s53Ex4ZNibv4Isx3oKWSCPIsZstlKR7Y/h?=
 =?us-ascii?Q?QsIw7mmrETT/ktLYEyuhehKVpNUTzpb5D1qdlbILvBlOlEiTpVaO0N9Fmhaz?=
 =?us-ascii?Q?janXSmUs+mCZg9FQukFbHbm3KPlXWh7AJaGekrJ4v6d4bg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?n2b+RMM2O2GGwAg7dxsgQC1mkFMtLMJ8HvA9wrL4Vd/SWvQS4YqADUs9+Vhk?=
 =?us-ascii?Q?Mur5X0FtWWNwvyxsr5gjRs4FbQ5NmBHuQLV2PwbPWsv64gFNyH2Ca8TlRncP?=
 =?us-ascii?Q?LppXEQ7MChr+dGdRiM8ohnmFlUG0MuicMQDc3PDOZeUqH45VqYrVNeEO4cZ+?=
 =?us-ascii?Q?gmuI26zCz/r1LgbksiNQ1cb8KRYXzZg4psMaivmckjLkxab0eIujU92e8xJR?=
 =?us-ascii?Q?R2CslCoqwSZD0qly6RBnW6xMG26i5/8of0kgg35uf8rNAb4Snh3JxUGfUtp4?=
 =?us-ascii?Q?xcCM0Hd8o0sGE+42PjPuw25V7Zlf5Qfbti5eOHGWbR98/m5eCaSGTJKjnVc4?=
 =?us-ascii?Q?Zx0+KLwXikPki5ydlqJjPk7fyOlQddV7YW2XDqs4MtdKOtsOZ/jn+gbk/iid?=
 =?us-ascii?Q?DLbZ51uEQaUyG3W0OmwvgC82Cbvg6BThR4nKfjl0b7sIqCeXGdNezNkZ+gW7?=
 =?us-ascii?Q?GyEQpHnN+2KYC2RepclEvTLbtxDQ3FeYdlHgZ48VrZBD/eBoUAr5aanGR6BX?=
 =?us-ascii?Q?XXP0xLZmRHl93wqUP11xUJB7cVJMRUE/u74UqoaIOtSWIFI1+6C/m/KCty+c?=
 =?us-ascii?Q?9ptQM/aXxuMNymI05VuRzSQph7h3Dw4zKe5eUILPBm0wUT1SyT0fRsnAkiR3?=
 =?us-ascii?Q?lg/SfG/t1UAmjjUYocBUXU+0NXSboAHBcHd6gv/f0ZrGlo/0+5FLCRn7PTRp?=
 =?us-ascii?Q?YhqMjHDjCrXaWgV/PCxW7CEv5so8v/OMpVEqcKVxq0avcuDrAxPfETdCAtbS?=
 =?us-ascii?Q?InVtTDbMK9qT9+jozOKXOXaYuV1N65GUgegUJ+pAjKj6Nb7KH3hUrbB+jZ2x?=
 =?us-ascii?Q?+fac04LOkU7nX6S19j7TkcCjBJq1/d6IfPLmdjt61lQIuXv2kA3iNWpcfOlA?=
 =?us-ascii?Q?hLOh7H2NudMOXHgCj1UkVxABP+ksJZTRcGd1mfCIXq1V23Gr03wzkYFBQ+AS?=
 =?us-ascii?Q?CjOsDqX5yDjQoinABUbEGVmVbajPrlYiw50UBgbU8Si+6xdOAKlfJByf1ymm?=
 =?us-ascii?Q?OOY4a3tqO1NzjmdkWZpR3pHc7sxo9NqkJSMUuHjQ5kzi+aE0tBp2WxDrRoZR?=
 =?us-ascii?Q?I9XQAXbS7C40yjKJAfFVyUYf9CzHIvEqkshEse03RTHxxlvzR8Z0TpQriUPg?=
 =?us-ascii?Q?TlR4+9+JwYrULlPuJQut/YduHfXKGIRJdueZMF9JJshD7s/Y4eacvebvF2aC?=
 =?us-ascii?Q?QuYoII0cFrKSXfVEkFhsj8lk0JDG4p5IbwzrX5Dr+QOoJf/jNZuKhWYQgMYB?=
 =?us-ascii?Q?1mM++eSBggK4TJESEF/jVG1/8IZ6D2atuABBqmdCHwOQzLSfkVgITmoPimKI?=
 =?us-ascii?Q?MmweUXH0zfgYBTr9aqwehom3Bx2LnlvEOEyCxfuBFAxJfd9IwtbC5fnoPrWm?=
 =?us-ascii?Q?VR1gGETZqDEJQZ6VY+sJiyUrhJl0HRyXIuM7NiOZgLwsSuUbUWUu//6Asg5l?=
 =?us-ascii?Q?gtSYelyR24mKck2kGjDZtTSr/AYR/yF2E5T2xzuJ6X3WK3o0jZV/9iKm0yTG?=
 =?us-ascii?Q?+lkrxyejGC+fdsmg30SGrP+qvEqp6ZLJFFadYgStiSG2CGFv4PrPXbEcDF0G?=
 =?us-ascii?Q?7WzTB+8Im56dy05DloWSikMVHtzefClWma6Nc4EHaBu9FdF9qytfYrxKzOXz?=
 =?us-ascii?Q?Cg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d6df9cb-68a7-4462-c62e-08dc64f81e16
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2024 07:19:59.8970 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YqZrTxlZDDWXGgdKpLTK2Wx6rshyoMb+S59l7MTNKK8zSbm/oID+OrDIJy9+xjVT5u+x9UtJYADQHBZ3UlwcKNsKde7UlKM1m4K+lKnW3UY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4909
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



> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
> Matthew Brost
> Sent: 25 April 2024 11:18
> To: intel-xe@lists.freedesktop.org
> Cc: Brost, Matthew <matthew.brost@intel.com>
> Subject: [PATCH] drm/xe: Delete unused GuC submission_state.suspend
>=20
> GuC submission_state.suspend is unused, delete it.
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 4 ----
> drivers/gpu/drm/xe/xe_guc_types.h  | 9 ---------
>  2 files changed, 13 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c
> b/drivers/gpu/drm/xe/xe_guc_submit.c
> index c7d38469fb46..4e78610d1591 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -250,7 +250,6 @@ static void primelockdep(struct xe_guc *guc)
>  	fs_reclaim_acquire(GFP_KERNEL);
>=20
>  	mutex_lock(&guc->submission_state.lock);
> -	might_lock(&guc->submission_state.suspend.lock);
>  	mutex_unlock(&guc->submission_state.lock);
>=20
>  	fs_reclaim_release(GFP_KERNEL);
> @@ -278,9 +277,6 @@ int xe_guc_submit_init(struct xe_guc *guc)
>=20
>  	xa_init(&guc->submission_state.exec_queue_lookup);
>=20
> -	spin_lock_init(&guc->submission_state.suspend.lock);
> -	guc->submission_state.suspend.context =3D
> dma_fence_context_alloc(1);
> -
>  	primelockdep(guc);
>=20
>  	return drmm_add_action_or_reset(&xe->drm, guc_submit_fini, guc);
> diff --git a/drivers/gpu/drm/xe/xe_guc_types.h
> b/drivers/gpu/drm/xe/xe_guc_types.h
> index 82bd93f7867d..546ac6350a31 100644
> --- a/drivers/gpu/drm/xe/xe_guc_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_types.h
> @@ -72,15 +72,6 @@ struct xe_guc {
>  		atomic_t stopped;
>  		/** @submission_state.lock: protects submission state */
>  		struct mutex lock;
> -		/** @submission_state.suspend: suspend fence state */
> -		struct {
> -			/** @submission_state.suspend.lock: suspend
> fences lock */
> -			spinlock_t lock;
> -			/** @submission_state.suspend.context: suspend
> fences context */
> -			u64 context;
> -			/** @submission_state.suspend.seqno: suspend
> fences seqno */
> -			u32 seqno;
> -		} suspend;
>  #ifdef CONFIG_PROVE_LOCKING
>  #define NUM_SUBMIT_WQ	256
>  		/** @submission_state.submit_wq_pool: submission
> ordered workqueues pool */

LGTM
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

> --
> 2.34.1

