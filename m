Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BFF610775E7
	for <intel-xe@archiver.kernel.org>; Wed, 18 Mar 2026 16:59:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA19D10E0FB;
	Wed, 18 Mar 2026 16:59:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JdNs442x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2534310E0FB
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Mar 2026 16:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773853150; x=1805389150;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Ulc4rXJ085Ui7T/hfc7V6VXSwJYA0BQs+gHMlO++CCs=;
 b=JdNs442x69ZIVFq6Mu5smImUl8mlZTi7JT3c3GI3dmqhIGYi6vlqML08
 Stq1GxBgBpCsiCci+NKFIaKws5djXx81LjxXeWwDtFKkQBN52Rw7VnzRa
 rFRhsWohOJZYGA5kuGdygY0y+DsqBpmCh2xhdn6OaqN0au4HpkvRMc3wn
 vygJ4f6rYKC6+AQFNPvPbDcwfm1uZmrAksJoEwsdGCf0ocRe/Ym2MLGtK
 uw2Wh31s4empOlH9ZXFH9BPSr8HwKjWyEwjuTuX8n6Kw/J/6uXedhZzoF
 xmZuF+rJatRHHw7hrni703FtTd6NKH60vYCVjJIRdKq4I1oXkFY1rXi3y A==;
X-CSE-ConnectionGUID: wiWXI82TSUyMHHpkuk2qEg==
X-CSE-MsgGUID: vhP86nwbSJSFUR8h/Ir55g==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="97524494"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="97524494"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 09:59:09 -0700
X-CSE-ConnectionGUID: DWkakONbQUa9i/Yt1Q9Hbw==
X-CSE-MsgGUID: Oevv07vTQvuliWMCC70m4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="227638290"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 09:59:10 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 18 Mar 2026 09:59:08 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 18 Mar 2026 09:59:08 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.69)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 18 Mar 2026 09:59:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cMPuPlR+UIgaI/x3wfSyEq3Tqc4EkMkFxaws75rYmx1SN0Sp5KtGJRbSNYH/rK9v346IdaqqQdahKt2WucGyRLIfjbFCod+vtpbk4diDmEuYYyYNueSVm3o5o7WgNH5Gk+/fL7nq4ScNmKy4NgBPn9i+tbMI1izEIjLbrdJqXLMbkAQrQx4tptDykjIVD+OV2sGaIMQDilpobBQO9K5kCsQzvMzB+Lw4OVGdc7q9gP6iBWPvoCTzkzxmxYu978oVgbMW5snTlW0/KH0nKTNbr8gdy37AjnVFQNKJcZS8owZgJjcTTyuS438hTMeOY6THe9Tdw12O17t4cDxQQB2CKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yl/fqxqUlR6vYVRsIs50TlyebcjwPdDa2r/plILfak0=;
 b=Ao2SyDVq+6rSnzRuvxQM1wpn/oEnp1dR92K1dRfhcr5rhL7clT/ED8UehCx1i3h58gl8FyabihwfCrjaWXhyvMDr9l7HYcFBJx33VRfqVWeWjMpg/+MklmoltCQwZ/N1qyHU2ME0gB885bQzjS6ZnU+AFWGP7kqSpjCLzGX5bRfWpjjCwFX2iyHdQ3SADVZfi7F6x39GV0bd+2kWHFDGl5usZZimH6GwUJ+N3nLLF98bLBnQtBG3FQErUL0Nx8Xf2jRFxqJ5eykkIZYFc+idXOtuJb4+1w1p0LF+lAZX/rseog34gbmMC27TCaiCdEZk+G4o4AN+xtCOeD3TcIf+aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CYYPR11MB8360.namprd11.prod.outlook.com (2603:10b6:930:c3::9)
 by CY5PR11MB6437.namprd11.prod.outlook.com (2603:10b6:930:36::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.6; Wed, 18 Mar
 2026 16:59:05 +0000
Received: from CYYPR11MB8360.namprd11.prod.outlook.com
 ([fe80::d11c:a6f0:d986:827a]) by CYYPR11MB8360.namprd11.prod.outlook.com
 ([fe80::d11c:a6f0:d986:827a%6]) with mapi id 15.20.9723.014; Wed, 18 Mar 2026
 16:59:05 +0000
From: "Cabral, Matias A" <matias.a.cabral@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>, "Chegondi, Harish"
 <harish.chegondi@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Degrood, Felix J" <felix.j.degrood@intel.com>, "Ranjan, Joshua Santhosh"
 <joshua.santosh.ranjan@intel.com>
Subject: RE: [PATCH v2 1/1] drm/xe/eustall: Return EBADFD from read if EU
 stall registers get reset
Thread-Topic: [PATCH v2 1/1] drm/xe/eustall: Return EBADFD from read if EU
 stall registers get reset
Thread-Index: AQHctW6eQLr22lHF6ke4TqP9KhlkObWz3h4AgACnAfA=
Date: Wed, 18 Mar 2026 16:59:04 +0000
Message-ID: <CYYPR11MB8360A705B57CE5CF6CFFCB6BB24EA@CYYPR11MB8360.namprd11.prod.outlook.com>
References: <52d991cc7e8bec514bb582717a1c42033672d4a5.1773683739.git.harish.chegondi@intel.com>
 <87se9xpqub.wl-ashutosh.dixit@intel.com>
In-Reply-To: <87se9xpqub.wl-ashutosh.dixit@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CYYPR11MB8360:EE_|CY5PR11MB6437:EE_
x-ms-office365-filtering-correlation-id: 2e0ebe32-5aa9-4e74-9ef3-08de850fa9a4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700021|22082099003|56012099003|7053199007|18002099003;
x-microsoft-antispam-message-info: oZIVVtaPZZ6KuHHML1xwoMye0rFvZzXYx4BVPGWVyEVAf1eQcC97IdiWcbQIITkgXJABRiqfxuuxVJxRhCAhVkk2MvcTLfbdlf36ukv2r92N493W4KoQbLQ9dVoVMjKIkMImAHTpiyjDCIf5m4pcZi4mNPf7FPf13fzamT1t/JLWwGKiEhj+CgR4wvTHJ94EuXEpUnihRiwvLGUupYzQ1KdYQGadaHOaoDGRB9u6RiopGvIA1PzjpCDJIM/tG3NZDUiR7zjI11gcawglGr6gIaLdhlaSagU097RytZlFF8HqQpLybiLgAIO/Vlb+WxzUIYZy0gJ3GLthPfDprudcOOSKCRiofOst+HygL8dhXGcerxhGQqzFmd8pb+HTBW0Gwt0JPe6JbF61GH2mtVsMjXjNhdQ3YCg2VlQy8Phhcz1oxqtBe6ldbSC+h+OqzejsWZn4FfOUFaQIPsn8ZRwOwvHqNfWA2F1y2bGXl456WcWUz61l4Otmr7Rkx0PxOBwqQgTfiatSutaUn7w6353KIQqSRfrl62zIU/jq6cB75XIH1ikBpbGYpi9rd9FC0p/hmoXtOK97lfv9rnhCE2HBWDfDOapeSTI/WCrSwyP6SL6Qg9XUPkSrjbcLEJj0CjHrcwlm2W5psYqCCgFuSOZbZ6t4pa7OsPTos4b1N0joA7RK5FCtVAA9bRs/Yz2k8OfIOots5yKdS/NVcBY6ioYk1mwAF9i5Ylmws4lwRHuQK5rd3qxdCmJJlHisAtL3qbgiTkl4JdoHvOzdDW7SjxvysfAsFVWlMgcwQwxG+91RVkM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8360.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(22082099003)(56012099003)(7053199007)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Ov2ZGmpSeN212EmxpGzTzRlbWFumKlFIbyHCQ9BzF1OKI6HUm2a+I/glmhs/?=
 =?us-ascii?Q?Bs1agDyydHy1r9Bb1/AeYa11+Zr53gQdZU6Uqo7PGy9W/l/5WfV2mTqPA0nt?=
 =?us-ascii?Q?BVTjrfrV5iYDYH+CZwQH9uQCmeAqIP0+EnT9g45poGhinPyh8B0ghdoUQrIQ?=
 =?us-ascii?Q?zZ+J2GqILR6lJGAtkurRwdYey4Y5x0gYShuappIohI2SvlH0RKGQAZVgNt2n?=
 =?us-ascii?Q?+BHjSWZd1KbzmGTaLs8JY3Ch16J7ObdDA5SS1zk6ci9I7uI2W4QC3ZkD9ylA?=
 =?us-ascii?Q?BZAaZwZarkhu1QbiQVuwCZ47s0NQOgPvye747AjK87NmeXHLcb8xdCn7CDdA?=
 =?us-ascii?Q?TSC5Bz20X9QRLpbq9UTvTHXWO1OUc19wy8xGbbLJd23DyFpGMpngm9CxoK8c?=
 =?us-ascii?Q?L7J2Kti7nZGoxlr1wWyq1ttOfRK7oRJVSzb86/+IqD4OdePhH5vQukllc2Vl?=
 =?us-ascii?Q?jcCt+pGsYZyoYregAxwZgPkZ+cgmF7fp+3KMJ6c7zor7w1U+S6AEiDRpDVPi?=
 =?us-ascii?Q?wA/G2mW3OJgrZGPXHD/GUZeIGxVX/+OxVvFYLbtxg0Woc2YiwdjtZUs4fltG?=
 =?us-ascii?Q?kIFUM7E+lYRuJJUfV5FxepHTrChfsCvqC10NWcENalBK6MgN1KUMdxRuMN4k?=
 =?us-ascii?Q?nLvMMPCLxMiDxJ3yzvv9TJGgNstvBcGoSTGdwPlAo1EMNa4L6EUvx1rpiVhX?=
 =?us-ascii?Q?xbHBlzcHm+9U7ns82RW8/F7kj4NqsNt1/ywvBV4Mcv5i4TMrIWvKZg0OBL29?=
 =?us-ascii?Q?RJSYDQEWxnmv8esEb7T9svmy6YXxzd0BUZT9701xOTDpCapQDScNfJu7MA6y?=
 =?us-ascii?Q?f2VPn+addsANpkiv+ZwaHRxnpbI5Wih9C4mSGwzfUgNDyo1B6qETZ6cI8GrM?=
 =?us-ascii?Q?AJMQnOcIn2sIyWlK1mVXx53a3/GvkTLXfjs2xk3uzGPUr6c4kL1PqNvO5FOi?=
 =?us-ascii?Q?dAhJyPPjtxBjCtOdbd7WPaDmBj307wsPvEnM5E1UvXs0umrBBgfVz7tCZKz+?=
 =?us-ascii?Q?MRfzHSMBZ5zNzN7vZetFdLzQgefIZmpIvmmFTD7zOjT3dzM2C+jDC2k3IooB?=
 =?us-ascii?Q?hdOyw+K7gIdFxW1oGCXMsaVRerumkiXVy469l1e/d9/ALC0R4Z4HIGvqiLOl?=
 =?us-ascii?Q?91oMzul7dmKkH7Bwf0zV/kowZxGHTEdYsAYxeKiIG9Gjtq6ya2wYjwiVrSys?=
 =?us-ascii?Q?TvXv20ovo2OGzSg0MAr8tjCFo9UBEhSxXnhTh3MK9MHP1NaQcxXXPKyC+irB?=
 =?us-ascii?Q?8OXuZJVyatN+EX2vpqmfK11A7rH6fzy71new68w6/zG1JDOd/p7QB3cYd+ZI?=
 =?us-ascii?Q?X6SAdwDgF54eqSkkr3F3G+NhjAZZiaIY5JDZB86Yr88V4wUYndIMxLLnCllB?=
 =?us-ascii?Q?zZ0fjSG49TDuVWknmn9OrPTmoven7Nfr7c+AuPHOxf1QHk1qiJaP28CIlOsT?=
 =?us-ascii?Q?Q+rvKos51Kmn6YnanIQNeP66TrRzWM/zismkU+bE+dhgMLQMnzXTJUUfyCMb?=
 =?us-ascii?Q?v8e+VvO8rRTrXRCgz10kUrgvzCczCoQQCdbjw25yWBd5zXbauhxs3rpy73gu?=
 =?us-ascii?Q?UCew0jJcNUsf/yo8ZXM9gLFbGAqQ4uF2UF8IhRqn0n+oNbJUxUXjXx3k1igj?=
 =?us-ascii?Q?VtjN30TT0YqsGPNZCdZ9xDjD2iUVpE2tzA+ErXV6eYUVvfDED+OABDQ5P86a?=
 =?us-ascii?Q?cOWIUtBDXMllYO12wO0ZyeTx/Z8K8RKv+ZviVc7QyNiuS4aM0b5o1w+DhLpU?=
 =?us-ascii?Q?ClPzs85q6w=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: N105D8qBM5APoRkkbNpNOdbll96g8BkFosEXtD/3RseF6fsHInTlshbWj6UzPi4ftn5Eh0/KG1D66rh67lgYDvUCfXK7QRxVH256smZ3C7F6WQz5ZzwmOuuGu1kf+6RFC1QrbhJnPE3/P3VXtAMULJzh/I6Iqr32x6sZtKxysUwG9XSgWG+43boPBZIUT4qnCyzDSICoZW5y6g7xXfc/s64nuyJO6pT8kqgDyqtNF4UDMN+TJg6lLcQu26j+6Et1NGOrsB29+yQaMC1NgpFHh0X6jLQWwPx3VvCJtR//oTZDdrVPl5S8cwoolRgshO+4o1dIVAK2ahhDwy60Ion+ag==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e0ebe32-5aa9-4e74-9ef3-08de850fa9a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2026 16:59:05.0084 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jbYDVb7Jfm54CSIQtlyKkJb967CQDToW2WiVSxtAR/ZynaTPBaXdMgRzDuKuKgRDIE3UzSrqLrG1x3y3/HnwsfkR8Kb8wbxbG0ceK5zjYO8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6437
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

Hi Harish,

> return -EBADFD;

Is this making the read() syscall return -EBADFD or setting erno to EBADFD =
?  would like to clearly understand how to detect this condition in the UMD=
.=20

Thanks,=20
_Matias

-----Original Message-----
From: Dixit, Ashutosh <ashutosh.dixit@intel.com>=20
Sent: Tuesday, March 17, 2026 11:58 PM
To: Chegondi, Harish <harish.chegondi@intel.com>
Cc: intel-xe@lists.freedesktop.org; Degrood, Felix J <felix.j.degrood@intel=
.com>; Cabral, Matias A <matias.a.cabral@intel.com>; Ranjan, Joshua Santhos=
h <joshua.santosh.ranjan@intel.com>
Subject: Re: [PATCH v2 1/1] drm/xe/eustall: Return EBADFD from read if EU s=
tall registers get reset

On Mon, 16 Mar 2026 10:58:56 -0700, Harish Chegondi wrote:
>
> If a reset (GT or engine) happens during EU stall data sampling, all=20
> the EU stall registers can get reset to 0. This will result in EU=20
> stall data buffers' read and write pointer register values to be out=20
> of sync with the cached values. This will result in read() returning=20
> invalid data. To prevent this, check the value of a EU stall base=20
> register. If it is zero, it indicates a reset may have happened that wipe=
d the register to zero.
> If this happens, return EBADFD from read() upon which the user space=20
> should close the fd and open a new fd for a new EU stall data=20
> collection session.
>
> Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
> ---
> v2: Move base register check from read to the poll function
>
>  drivers/gpu/drm/xe/xe_eu_stall.c | 24 +++++++++++++++++++++++-
>  1 file changed, 23 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_eu_stall.c=20
> b/drivers/gpu/drm/xe/xe_eu_stall.c
> index c34408cfd292..7e14de73a2c9 100644
> --- a/drivers/gpu/drm/xe/xe_eu_stall.c
> +++ b/drivers/gpu/drm/xe/xe_eu_stall.c
> @@ -44,6 +44,7 @@ struct per_xecore_buf {
>  struct xe_eu_stall_data_stream {
>	bool pollin;
>	bool enabled;
> +	bool reset_detected;
>	int wait_num_reports;
>	int sampling_rate_mult;
>	wait_queue_head_t poll_wq;
> @@ -428,6 +429,17 @@ static bool eu_stall_data_buf_poll(struct xe_eu_stal=
l_data_stream *stream)
>			set_bit(xecore, stream->data_drop.mask);
>		xecore_buf->write =3D write_ptr;
>	}
> +	/* If a GT or engine reset happens during EU stall sampling,
> +	 * all EU stall registers get reset to 0 and the cached values of
> +	 * the EU stall data buffers' read pointers are out of sync with
> +	 * the register values. This causes invalid data to be returned
> +	 * from read(). To prevent this, check the value of a EU stall base
> +	 * register. If it is zero, there has been a reset.
> +	 */

As previously discussed, the best way would have been to not have to do thi=
s. We would just plug into the handler for the reset message from GuC, rath=
er than to implement a reset detection here (and in other places such as OA=
). But looks like if we do that, because of the way EUSS registers are rese=
t, we can return bad EUSS data. So looks like there is no way around doing =
this "reset detection" here and a solution with the GuC reset handler would=
 always be racy. Just for the record.

> +	if (unlikely(!xe_gt_mcr_unicast_read_any(gt, XEHPC_EUSTALL_BASE))) {
> +		stream->reset_detected =3D true;
> +		min_data_present =3D true;

I don't believe we need to set 'min_data_present =3D true' if we are settin=
g 'stream->reset_detected =3D true', correct? See if statement at the botto=
m.

Also, since the write pointer itself gets reset during reset, didn't we wan=
t to do this register read only when the write pointer is 0 (to avoid an ex=
tra register read every 5 ms)?

> +	}
>	mutex_unlock(&stream->xecore_buf_lock);
>
>	return min_data_present;
> @@ -554,6 +566,15 @@ static ssize_t xe_eu_stall_stream_read_locked(struct=
 xe_eu_stall_data_stream *st
>		}
>		stream->data_drop.reported_to_user =3D false;
>	}
> +	/* If EU stall registers got reset due to a GT/engine reset,
> +	 * continuing with the read() will return invalid data to
> +	 * the user space. Just return -EBADFD instead.
> +	 */
> +	if (unlikely(stream->reset_detected)) {
> +		xe_gt_dbg(gt, "EU stall base register has been reset\n");
> +		mutex_unlock(&stream->xecore_buf_lock);
> +		return -EBADFD;

The other option is to return -EIO here and implement DRM_XE_OBSERVATION_IO=
CTL_STATUS and return status from that. Let me think some more about this.

> +	}
>
>	for_each_dss_steering(xecore, gt, group, instance) {
>		ret =3D xe_eu_stall_data_buf_read(stream, buf, count, &total_size,  @@=20
>-692,6 +713,7 @@ static int xe_eu_stall_stream_enable(struct xe_eu_stall_d=
ata_stream *stream)
>		xecore_buf->write =3D write_ptr;
>		xecore_buf->read =3D write_ptr;
>	}
> +	stream->reset_detected =3D false;

So after reset, if a stream is disabled and re-enabled, we expect things to=
 work again and EUSS data to be correct (without re-opening a new stream)?

>	stream->data_drop.reported_to_user =3D false;
>	bitmap_zero(stream->data_drop.mask, XE_MAX_DSS_FUSE_BITS);
>
> @@ -717,7 +739,7 @@ static void eu_stall_data_buf_poll_work_fn(struct wor=
k_struct *work)
>		container_of(work, typeof(*stream), buf_poll_work.work);
>	struct xe_gt *gt =3D stream->gt;
>
> -	if (eu_stall_data_buf_poll(stream)) {
> +	if (stream->reset_detected || eu_stall_data_buf_poll(stream)) {
>		stream->pollin =3D true;
>		wake_up(&stream->poll_wq);
>	}
> --
> 2.43.0
>
