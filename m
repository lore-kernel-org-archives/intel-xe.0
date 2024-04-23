Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18386C4345F
	for <intel-xe@archiver.kernel.org>; Tue, 23 Apr 2024 03:27:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D019D113006;
	Tue, 23 Apr 2024 03:27:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EgWTaTxB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92E4A113006
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Apr 2024 03:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713842871; x=1745378871;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4m9hulInk05ukcAcSFg49mxUF2+iL3JmbfblE3WUW60=;
 b=EgWTaTxBa8k7SSRm8WaX0pmx0pEbeHbMfNeSSLayNgpDus7YQQGi0Rg7
 gcqiOkxxyB+jsisdjpbVWvLWKZSO1dGNJ5lSS6UCNaEvuXTTU1dCcJtFE
 Pct1Sz6zExGOjrd05hS7Ubj+dn96BLFjd1X6BowsOfF5I/qs5NfIKb+OV
 B9ZmHXtJCTzGCSPnreE3EnhXqjgDQaqoXI15LOrmsk8tnwvnvonDO/si5
 6WMpS/TTrvdwD1+mC4ejLpPDTWdI/13kpONRA5vS5SNc2nlpLCiFkxTQv
 ws45jQJw1826+WJ4/U6LECGhkNi43umD0GWukFRGoknbLydPxzNxHd4AF A==;
X-CSE-ConnectionGUID: NW9onj31TgqSMGMzW2mNig==
X-CSE-MsgGUID: 0dkeUy+OS3m2xEnHw9TjVA==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="34807753"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="34807753"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2024 20:27:50 -0700
X-CSE-ConnectionGUID: VrsjoofeRzip4n8Bl9aEyg==
X-CSE-MsgGUID: 30750pOPR6KYGPmVFuhdkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="24094297"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Apr 2024 20:27:50 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Apr 2024 20:27:49 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Apr 2024 20:27:49 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 22 Apr 2024 20:27:49 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 22 Apr 2024 20:27:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EPOAgfpL/anHJOJQzn8iQpeSwAbMwfgU12bBuIQj3ltBlL7CbEM/9XiGrhWR2wdrq6L/3ynyKvLNiI5lB/glvv0hKv2IdVuZIL6a7OVur6z/PnErp7UUVB2oSU2WIFuyza/fFWNS9lLVaeZuqg0UgXEuzC2BrClW6IglmEFEqX2hKD9L45TYsDUtb9hFJPq6m3nj9LfqzScBRFywy24xbLDaNY/WwMD3hFU1Th8BJe2UzSgFAk/PBDcoPpBOaQ5zM2jNtj1H0Nmo+4eX3FSrfHK884tqhNxCxnphb6Ct++ft1LRo07XS4e6G2TdCDnAxaCPNDuV9o9ZfLzYSKNDBsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=POvYmvXBN8YspChQgAhHb3uBeBiBWJzeLftqjqcxfpI=;
 b=IQq+O7+XvW3jjRtQvmvrrgTGcZrJ9atp0FRgG7hkBdat+QTNwgmTW8DryKjspdJg4DZeCpktZHPJTogfF8wgVguWqVqHK4QKn3kH9XYSjTfyP03rx1+qZSScc7J/TmjDvowlYi8inaQq+HGsz5styDDzBD3QTuFCi4h/iWI4Xx0P4Dhl+WW8wA6g2a5MZa+psYVb0TkNTyaLaeGSORvNjzSEuewGREYue8zaYXiugIXl4NwTkA25cD4rvrex7E9jW7gKtWLJzN9XTI73wvsEKXSwk+RMO0LANscB7aeTk+b+oFHjVjaUIiwiDCPQhadysFyLIvupRBOi9AQbpUXvhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by LV8PR11MB8560.namprd11.prod.outlook.com (2603:10b6:408:1e7::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.21; Tue, 23 Apr
 2024 03:27:46 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d%5]) with mapi id 15.20.7519.018; Tue, 23 Apr 2024
 03:27:46 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH 07/13] drm/xe: Use xe_vma_ops to implement page fault
 rebinds
Thread-Topic: [PATCH 07/13] drm/xe: Use xe_vma_ops to implement page fault
 rebinds
Thread-Index: AQHaiwmqfSY5i5CekUmmm75hwPUqw7FvswewgABX2oCABTrjcA==
Date: Tue, 23 Apr 2024 03:27:46 +0000
Message-ID: <SA1PR11MB6991B05B1DC539E145F5B4D092112@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20240410054056.478023-1-matthew.brost@intel.com>
 <20240410054056.478023-8-matthew.brost@intel.com>
 <SA1PR11MB6991E56CAC410886AAFB0A82920D2@SA1PR11MB6991.namprd11.prod.outlook.com>
 <ZiLHE6CMev12xTta@DUT025-TGLU.fm.intel.com>
In-Reply-To: <ZiLHE6CMev12xTta@DUT025-TGLU.fm.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|LV8PR11MB8560:EE_
x-ms-office365-filtering-correlation-id: 79ed3d04-9cb8-4a39-fb7b-08dc6345585e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|1800799015|366007|376005|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?DTJG3dK/mu4XEarwgm1Pc9gts64DKzCBgsM22faukyY5hdAQujJIJmCKzEcL?=
 =?us-ascii?Q?wNP2OrXpalYiip6x/d/6hhkbKdB/Tu9R1HLUxqqL+ep8RZOciLrcPzuIaufp?=
 =?us-ascii?Q?MIuS2HHcQSj4c06T/CuUhgLz4kxZVjBQNxjTH1NRew/due39uEDxPFvZePLH?=
 =?us-ascii?Q?rejZ+3m2LbqSu3AEyKNhXtullAAKhcalprQ/MlwB84AMob+1Jt9y5kAjL4Jw?=
 =?us-ascii?Q?aV68sCFKwG9oej3WkSVui34SOpjxJ3k37v+OT0AjHdveKR4VwL+cE1e72BDp?=
 =?us-ascii?Q?RpIxZZ3b1WJn53lWJgrVvp2tTAE4qO7/hh/6Jcd4CkzUFotiO0MkkwAySdvq?=
 =?us-ascii?Q?qhLHuROMckDoNbyMpM+/VIma7nzJ7KBg0M8fLh6sJTRxXevcGIRHqTqyl9am?=
 =?us-ascii?Q?qDXQ8mIbJ4JbGecuYFsjHV0qjigXvFULW794xe4BV69X/2jjc3hq4K910o9p?=
 =?us-ascii?Q?yGwbrNwIi5GaROK2Zr50+1MEtgrROCcYNcFGEDoz+/xGtR7R1HgygqjZjAWZ?=
 =?us-ascii?Q?ZNKNAkxTtHU4nztdnw/HuiZ3H5oeKVoKiFrrNnzBYpUr4xIu67n+AMXgNSsz?=
 =?us-ascii?Q?dC4CKpzBhFeK+D+h08iYxcfbWdIqfJqDEzz91iZ22O8TrkYlGY0roZbltYkT?=
 =?us-ascii?Q?clyFNLQ6w3AmquNqNjo9ZfdjqFmD3WAI15ceraIoz4QFfhW9RinTYs2VnGpJ?=
 =?us-ascii?Q?clFqokjec94tcQ21NUNOkqlU0OhS9Mp8BtuUbdDfwHXHPZZdUAEMKfTxu6sj?=
 =?us-ascii?Q?s45lxO4rpLYxXNtTZnVt3MEO7hBKFjI1qrNUP6kB+zM+tpvRKnbqKA9OKrQa?=
 =?us-ascii?Q?8sLkm41h0d21O6ZSuvshmiWC9B0yVTFlFkYoeT+fNbA0JfCp7/lZA9C+oKD2?=
 =?us-ascii?Q?WzBskmMSfNZRlDuKS25PbNSKE6pKUdInOzKcLMiqKQAu0LIBTmZZnnT6apz1?=
 =?us-ascii?Q?QekXtiBg7HLxMNuypv2nnN60iTZnmHpvQPzTkb4C8jVTfE5o1lQkYlGgMX87?=
 =?us-ascii?Q?01XtAFuzJ3+FcqNMGetiQSS4/BCDp0QglFVnynwoyZuVHLZQRiXPtWAQQ74D?=
 =?us-ascii?Q?HkspQAtUoGJYrBxh4SGU+g5q/HTEh6DbO2884iUfySwpJCnJhKGeBmfwL6m/?=
 =?us-ascii?Q?DPSjjqz4TI7xZHce+GXB2bynwg983tLnIMTCi9nhxTn8GmvM4aoXBz5p5ydV?=
 =?us-ascii?Q?E2cCX84AbBa2i3pmn4vnUVn/csdvBTPlDVlJgyHr2gVln2ZgQGFRPXcKnddG?=
 =?us-ascii?Q?WkQl7OQoruvdBpVMLPzx2Y/qN22zkvf7PCF0x472cQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?u2QQaTO5LDJbaFltva5/+d2egNK2v+uFaqnYwz11LTuI3ynuAy0jIEkoDunM?=
 =?us-ascii?Q?DS+s00aShrzWGN73mrDg8YOR4CQQiQKnpg9Wt0T69yjzXPbUQWvbuIKGodv/?=
 =?us-ascii?Q?7GJiicF0WpRQmzg0NHHQd8FhsMo51oWlPSqW+Zb6Aw9lV6V/cH9hM7QR45gC?=
 =?us-ascii?Q?67Df8zxDDkfntupy2O3tARXfM3YEHPUHehyhZzwYuYACa17hiYGprV/VOotG?=
 =?us-ascii?Q?UWUqhVPYoK4N4UP6VYqajwaaz9nYY7waWkMaIc+JLcoha6zcagVdabqrOxw1?=
 =?us-ascii?Q?53eSziOMcNczwiPtncJaRHeVOKeNRKsPyCwB3NP/sQMA++eI6xHMz26Xv4Ja?=
 =?us-ascii?Q?SJ1NTevfy+ca6O5YACW1UDEWYNTWMhUWzCYQSRd09Hz/fkpoOyHQ0u634Nl1?=
 =?us-ascii?Q?tyI0uGlJaEGmDRhd/n62EZ53QncG8+D/lPnlIAHPtBNmIdXbAPFfufLHk0GA?=
 =?us-ascii?Q?W8aqGfYJxeBHe/VgQJN1RQMXbNEZBU1C+4aHKmxpAp/1KwRZrWNGyIp8SEra?=
 =?us-ascii?Q?j3Cm5WHVSGjlT4jILQUmR9P8oRDXAh+Px7Ygz+I3Q0q9x4v2HKHnwj+h3Elz?=
 =?us-ascii?Q?pLC/DWgUYk+iiTM9dPNTM9gqnWl8tm2fujfp9BAKm4aYyoAs9VnUChkw+W8o?=
 =?us-ascii?Q?kyhIe2aTNC5e5ALeIVDYxBpVa5QHlbwihJ/lM/s3yrz8lKEp5A5i9bksh1xp?=
 =?us-ascii?Q?U4xuHpawyFxAI+MhxTwXkOLHxDGhFEBi/VdtgVWgoYFATJjJrgkU0A03f3nI?=
 =?us-ascii?Q?8nXA7IHAtHDRHXGQGF+qkN4NsxAsSSM4j2Kfdlo/Al55eX5MPaqTga1U6nTY?=
 =?us-ascii?Q?EMrjrliXk20GAqPXsr8grM8XVIg/RaeuiKVhekPZlHfbD1/vHdG7S1gw0iel?=
 =?us-ascii?Q?r/yO7kmi0L7u+Lbe698jJi5ED5Kg+LXaBtRMIU7DC8uFVmkA5eTBUVG4Z1+r?=
 =?us-ascii?Q?XDr4vSEX23VUeVTD8oikijNamS4hiMeefCb5gQig4jgoA/0sNfKBmNDoPPP9?=
 =?us-ascii?Q?WfNXiCcO+cHdqNu9t/J9QHE7tKzRnF891bkMwJA846dEQH54X6cCZUstG+dE?=
 =?us-ascii?Q?pS/MsQSWt2hwCY54pz85IbUVLk9Y7cOtey8Q8Uokiv2+RCpPwdN6x5bq+QOB?=
 =?us-ascii?Q?paPdF70uO3vPfceiBjsXi30PQCRZdiz2mj8BktrcAxd9zs0XndpRwrfnaFg/?=
 =?us-ascii?Q?h4yucPGgpRfTXG70vyuRuv13cMN48fm8DnoAL4itBHssbTA5fEQ0Ak6T8y21?=
 =?us-ascii?Q?ETAGDUMjRcpA15vT1rnd9Jj4AbHaGwH+Xkh+cZ9NYyR7dCzZGwl86ebeg+vr?=
 =?us-ascii?Q?BntVwA6jmPOSARX6wtmMTRXHFaMAaxpXyMN0dpGy5GVfW+yD9xlVBwYqO763?=
 =?us-ascii?Q?rwL6V99CvpBI2MIeE4TDUESv7kajoGRyVXI2a1PlvPZ/9TnPdPwfhJYoDmcW?=
 =?us-ascii?Q?MCfmBVMdReOfIeTXS8vO/GC7p0lTTIRC5INxFiKKrbO4bd2KM58ScBC5CNnu?=
 =?us-ascii?Q?T4n/gVZTYzV7u5XTcl3gRDZY2oko9ZfPBN9+SgeNkjHY4A5oiz7qQPgbcIAu?=
 =?us-ascii?Q?Q2NMNAUxJFscXJ6x8xo=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79ed3d04-9cb8-4a39-fb7b-08dc6345585e
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Apr 2024 03:27:46.5721 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /GsE/ESNeEVGmZaEl/r6xnVp9wmRQaVzHcfR3xfdYrFRgMmygRlEbAw0LAFou80qMP+z35eInp8e5+EdMkAAeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8560
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
> From: Brost, Matthew <matthew.brost@intel.com>
> Sent: Friday, April 19, 2024 3:34 PM
> To: Zeng, Oak <oak.zeng@intel.com>
> Cc: intel-xe@lists.freedesktop.org
> Subject: Re: [PATCH 07/13] drm/xe: Use xe_vma_ops to implement page
> fault rebinds
>=20
> On Fri, Apr 19, 2024 at 08:22:29AM -0600, Zeng, Oak wrote:
> >
> >
> > > -----Original Message-----
> > > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
> > > Matthew Brost
> > > Sent: Wednesday, April 10, 2024 1:41 AM
> > > To: intel-xe@lists.freedesktop.org
> > > Cc: Brost, Matthew <matthew.brost@intel.com>
> > > Subject: [PATCH 07/13] drm/xe: Use xe_vma_ops to implement page
> fault
> > > rebinds
> > >
> > > All page tables updates are moving to a xe_vma_ops interface to
> > > implement 1 job per VM bind IOCTL.
> >
> > Can you explain why using xe_vma_ops interface is necessary even to bin=
d
> one vma? I understand it make sense to use this interface to bind multipl=
e
> vmas. See also below
> >
>=20
> Essentially once we switch to 1 bind per IOCTL [1] xe_vma_ops is passed
> around throughout all the layers. The xe_vma_ops list a single atomic
> unit for updating the GPUVA state, internal PT, and GPU page tables. If
> at point something fails, xe_vma_ops can be unwound restoring all the
> original state.


Ok, that make sense to me. Maybe explain this a little in the commit messag=
e? The current commit message doesn't speak why we are moving to xe_vma_ops=
 interface. Anyway, Patch is:

Reviewed-by: Oak Zeng <oak.zeng@intel.com>

>=20
> i.e. __xe_pt_bind_vma is will be deleted and replaces with a function
> that accepts a xe_vma_ops list, ops_execute() is the correct place to
> hook into the software pipeline as we already have the locks and only
> internal PT and GPU page tables need to be updated.
>=20
> [1] https://patchwork.freedesktop.org/patch/582024/?series=3D125608&rev=
=3D5
>=20
> >
> >  Add xe_vma_rebind function which is
> > > implemented using xe_vma_ops interface. Use xe_vma_rebind in page
> > > faults
> > > for rebinds.
> > >
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_gt_pagefault.c | 16 ++++----
> > >  drivers/gpu/drm/xe/xe_vm.c           | 57 +++++++++++++++++++++++---=
-
> -
> > >  drivers/gpu/drm/xe/xe_vm.h           |  2 +
> > >  drivers/gpu/drm/xe/xe_vm_types.h     |  2 +
> > >  4 files changed, 58 insertions(+), 19 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > > b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > > index fa9e9853c53b..040dd142c49c 100644
> > > --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > > +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > > @@ -19,7 +19,6 @@
> > >  #include "xe_guc.h"
> > >  #include "xe_guc_ct.h"
> > >  #include "xe_migrate.h"
> > > -#include "xe_pt.h"
> > >  #include "xe_trace.h"
> > >  #include "xe_vm.h"
> > >
> > > @@ -204,15 +203,14 @@ static int handle_pagefault(struct xe_gt *gt,
> struct
> > > pagefault *pf)
> > >  		drm_exec_retry_on_contention(&exec);
> > >  		if (ret)
> > >  			goto unlock_dma_resv;
> > > -	}
> > >
> > > -	/* Bind VMA only to the GT that has faulted */
> > > -	trace_xe_vma_pf_bind(vma);
> > > -	fence =3D __xe_pt_bind_vma(tile, vma, xe_tile_migrate_engine(tile),
> > > NULL, 0,
> > > -				 vma->tile_present & BIT(tile->id));
> > > -	if (IS_ERR(fence)) {
> > > -		ret =3D PTR_ERR(fence);
> > > -		goto unlock_dma_resv;
> > > +		/* Bind VMA only to the GT that has faulted */
> > > +		trace_xe_vma_pf_bind(vma);
> > > +		fence =3D xe_vma_rebind(vm, vma, BIT(tile->id));
> > > +		if (IS_ERR(fence)) {
> > > +			ret =3D PTR_ERR(fence);
> > > +			goto unlock_dma_resv;
> > > +		}
> > >  	}
> > >
> > >  	/*
> > > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > > index 8f5b24c8f6cd..54a69fbfbb00 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > @@ -815,6 +815,7 @@ static void xe_vm_populate_rebind(struct
> > > xe_vma_op *op, struct xe_vma *vma,
> > >  				  u8 tile_mask)
> > >  {
> > >  	INIT_LIST_HEAD(&op->link);
> > > +	op->tile_mask =3D tile_mask;
> > >  	op->base.op =3D DRM_GPUVA_OP_MAP;
> > >  	op->base.map.va.addr =3D vma->gpuva.va.addr;
> > >  	op->base.map.va.range =3D vma->gpuva.va.range;
> > > @@ -893,6 +894,33 @@ int xe_vm_rebind(struct xe_vm *vm, bool
> > > rebind_worker)
> > >  	return err;
> > >  }
> > >
> > > +struct dma_fence *xe_vma_rebind(struct xe_vm *vm, struct xe_vma
> *vma,
> > > u8 tile_mask)
> >
> >
> > I try to figure out why this function is necessary. We are only binding=
 one
> vma here. Why we need to create xe_vma_ops list? We are only adding one
> vma to this list....
> >
>=20
> See above ability to directly modify page tables without a xe_vma_ops
> list will be removed.
>=20
> Matt
>=20
> > Oak
> >
> > > +{
> > > +	struct dma_fence *fence =3D NULL;
> > > +	struct xe_vma_ops vops;
> > > +	struct xe_vma_op *op, *next_op;
> > > +	int err;
> > > +
> > > +	lockdep_assert_held(&vm->lock);
> > > +	xe_vm_assert_held(vm);
> > > +	xe_assert(vm->xe, xe_vm_in_fault_mode(vm));
> > > +
> > > +	xe_vma_ops_init(&vops);
> > > +
> > > +	err =3D xe_vm_ops_add_rebind(&vops, vma, tile_mask);
> > > +	if (err)
> > > +		return ERR_PTR(err);
> > > +
> > > +	fence =3D ops_execute(vm, &vops);
> > > +
> > > +	list_for_each_entry_safe(op, next_op, &vops.list, link) {
> > > +		list_del(&op->link);
> > > +		kfree(op);
> > > +	}
> > > +
> > > +	return fence;
> > > +}
> > > +
> > >  static void xe_vma_free(struct xe_vma *vma)
> > >  {
> > >  	if (xe_vma_is_userptr(vma))
> > > @@ -1796,7 +1824,7 @@ xe_vm_unbind_vma(struct xe_vma *vma,
> struct
> > > xe_exec_queue *q,
> > >  static struct dma_fence *
> > >  xe_vm_bind_vma(struct xe_vma *vma, struct xe_exec_queue *q,
> > >  	       struct xe_sync_entry *syncs, u32 num_syncs,
> > > -	       bool first_op, bool last_op)
> > > +	       u8 tile_mask, bool first_op, bool last_op)
> > >  {
> > >  	struct xe_tile *tile;
> > >  	struct dma_fence *fence;
> > > @@ -1804,7 +1832,7 @@ xe_vm_bind_vma(struct xe_vma *vma, struct
> > > xe_exec_queue *q,
> > >  	struct dma_fence_array *cf =3D NULL;
> > >  	struct xe_vm *vm =3D xe_vma_vm(vma);
> > >  	int cur_fence =3D 0, i;
> > > -	int number_tiles =3D hweight8(vma->tile_mask);
> > > +	int number_tiles =3D hweight8(tile_mask);
> > >  	int err;
> > >  	u8 id;
> > >
> > > @@ -1818,7 +1846,7 @@ xe_vm_bind_vma(struct xe_vma *vma, struct
> > > xe_exec_queue *q,
> > >  	}
> > >
> > >  	for_each_tile(tile, vm->xe, id) {
> > > -		if (!(vma->tile_mask & BIT(id)))
> > > +		if (!(tile_mask & BIT(id)))
> > >  			goto next;
> > >
> > >  		fence =3D __xe_pt_bind_vma(tile, vma, q ? q : vm->q[id],
> > > @@ -1886,7 +1914,7 @@ find_ufence_get(struct xe_sync_entry *syncs,
> u32
> > > num_syncs)
> > >  static struct dma_fence *
> > >  xe_vm_bind(struct xe_vm *vm, struct xe_vma *vma, struct
> > > xe_exec_queue *q,
> > >  	   struct xe_bo *bo, struct xe_sync_entry *syncs, u32 num_syncs,
> > > -	   bool immediate, bool first_op, bool last_op)
> > > +	   u8 tile_mask, bool immediate, bool first_op, bool last_op)
> > >  {
> > >  	struct dma_fence *fence;
> > >  	struct xe_exec_queue *wait_exec_queue =3D
> > > to_wait_exec_queue(vm, q);
> > > @@ -1902,8 +1930,8 @@ xe_vm_bind(struct xe_vm *vm, struct xe_vma
> > > *vma, struct xe_exec_queue *q,
> > >  	vma->ufence =3D ufence ?: vma->ufence;
> > >
> > >  	if (immediate) {
> > > -		fence =3D xe_vm_bind_vma(vma, q, syncs, num_syncs,
> > > first_op,
> > > -				       last_op);
> > > +		fence =3D xe_vm_bind_vma(vma, q, syncs, num_syncs,
> > > tile_mask,
> > > +				       first_op, last_op);
> > >  		if (IS_ERR(fence))
> > >  			return fence;
> > >  	} else {
> > > @@ -2095,7 +2123,7 @@ xe_vm_prefetch(struct xe_vm *vm, struct
> xe_vma
> > > *vma,
> > >
> > >  	if (vma->tile_mask !=3D (vma->tile_present & ~vma->tile_invalidated=
))
> > > {
> > >  		return xe_vm_bind(vm, vma, q, xe_vma_bo(vma), syncs,
> > > num_syncs,
> > > -				  true, first_op, last_op);
> > > +				  vma->tile_mask, true, first_op, last_op);
> > >  	} else {
> > >  		struct dma_fence *fence =3D
> > >  			xe_exec_queue_last_fence_get(wait_exec_queue,
> > > vm);
> > > @@ -2408,10 +2436,15 @@ static int vm_bind_ioctl_ops_parse(struct
> xe_vm
> > > *vm, struct xe_exec_queue *q,
> > >  	struct xe_device *xe =3D vm->xe;
> > >  	struct xe_vma_op *last_op =3D NULL;
> > >  	struct drm_gpuva_op *__op;
> > > +	struct xe_tile *tile;
> > > +	u8 id, tile_mask =3D 0;
> > >  	int err =3D 0;
> > >
> > >  	lockdep_assert_held_write(&vm->lock);
> > >
> > > +	for_each_tile(tile, vm->xe, id)
> > > +		tile_mask |=3D 0x1 << id;
> > > +
> > >  	drm_gpuva_for_each_op(__op, ops) {
> > >  		struct xe_vma_op *op =3D gpuva_op_to_vma_op(__op);
> > >  		struct xe_vma *vma;
> > > @@ -2428,6 +2461,7 @@ static int vm_bind_ioctl_ops_parse(struct
> xe_vm
> > > *vm, struct xe_exec_queue *q,
> > >  		}
> > >
> > >  		op->q =3D q;
> > > +		op->tile_mask =3D tile_mask;
> > >
> > >  		switch (op->base.op) {
> > >  		case DRM_GPUVA_OP_MAP:
> > > @@ -2574,6 +2608,7 @@ static struct dma_fence *op_execute(struct
> xe_vm
> > > *vm, struct xe_vma *vma,
> > >  		fence =3D xe_vm_bind(vm, vma, op->q, xe_vma_bo(vma),
> > >  				   op->syncs, op->num_syncs,
> > >  				   op->map.immediate
> > > || !xe_vm_in_fault_mode(vm),
> > > +				   op->tile_mask,
> > >  				   op->flags & XE_VMA_OP_FIRST,
> > >  				   op->flags & XE_VMA_OP_LAST);
> > >  		break;
> > > @@ -2600,7 +2635,9 @@ static struct dma_fence *op_execute(struct
> xe_vm
> > > *vm, struct xe_vma *vma,
> > >  			dma_fence_put(fence);
> > >  			fence =3D xe_vm_bind(vm, op->remap.prev, op->q,
> > >  					   xe_vma_bo(op->remap.prev), op-
> > > >syncs,
> > > -					   op->num_syncs, true, false,
> > > +					   op->num_syncs,
> > > +					   op->remap.prev->tile_mask, true,
> > > +					   false,
> > >  					   op->flags & XE_VMA_OP_LAST
> > > && !next);
> > >  			op->remap.prev->gpuva.flags &=3D
> > > ~XE_VMA_LAST_REBIND;
> > >  			if (IS_ERR(fence))
> > > @@ -2614,8 +2651,8 @@ static struct dma_fence *op_execute(struct
> xe_vm
> > > *vm, struct xe_vma *vma,
> > >  			fence =3D xe_vm_bind(vm, op->remap.next, op->q,
> > >  					   xe_vma_bo(op->remap.next),
> > >  					   op->syncs, op->num_syncs,
> > > -					   true, false,
> > > -					   op->flags & XE_VMA_OP_LAST);
> > > +					   op->remap.next->tile_mask, true,
> > > +					   false, op->flags &
> > > XE_VMA_OP_LAST);
> > >  			op->remap.next->gpuva.flags &=3D
> > > ~XE_VMA_LAST_REBIND;
> > >  			if (IS_ERR(fence))
> > >  				break;
> > > diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> > > index 306cd0934a19..204a4ff63f88 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm.h
> > > +++ b/drivers/gpu/drm/xe/xe_vm.h
> > > @@ -208,6 +208,8 @@ int __xe_vm_userptr_needs_repin(struct xe_vm
> > > *vm);
> > >  int xe_vm_userptr_check_repin(struct xe_vm *vm);
> > >
> > >  int xe_vm_rebind(struct xe_vm *vm, bool rebind_worker);
> > > +struct dma_fence *xe_vma_rebind(struct xe_vm *vm, struct xe_vma
> *vma,
> > > +				u8 tile_mask);
> > >
> > >  int xe_vm_invalidate_vma(struct xe_vma *vma);
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_vm_types.h
> > > b/drivers/gpu/drm/xe/xe_vm_types.h
> > > index 149ab892967e..e9cd6da6263a 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> > > @@ -343,6 +343,8 @@ struct xe_vma_op {
> > >  	struct list_head link;
> > >  	/** @flags: operation flags */
> > >  	enum xe_vma_op_flags flags;
> > > +	/** @tile_mask: Tile mask for operation */
> > > +	u8 tile_mask;
> > >
> > >  	union {
> > >  		/** @map: VMA map operation specific data */
> > > --
> > > 2.34.1
> >
