Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7206DCD8CB9
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jun 2026 14:17:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D88A10E9A5;
	Wed, 10 Jun 2026 14:17:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mf+nIFZt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDB1F10E9A5
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Jun 2026 14:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781101060; x=1812637060;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=UPQLbCPwALleJObGFz2XKneDBmpRjYCaMKrwG8uVuWA=;
 b=Mf+nIFZtMFwYLcu6KcgCEj2mh3fdBumH0P0dDOD3FF2naVVdrho2wzEZ
 wo5qHQjX2/OlxZJz1IT2TvQ8gWKDKO32v6OcYT2rDhE/YYMquOnhu1/1t
 LsXQ4TYCOMhAPdYpu2/6qbNL9gs1ce5brUioT68n0IfqCJBYPHkAM3GmB
 JXVHdkQq4+ivS75pATVmmUfR1S4qwFycDmMwefQquBgtV3EkIrUiVEsJk
 wkPSNuYLgqFnOdeGuVmLO26NWFzRr1Q4sj1VLaxRusU53DSxgmgu7LIw1
 bbOqwpYzKrtDaeXP7/tEr2l2jFLEw4pOgreZRS9oDtc8ZiKyTwRMWmO2h w==;
X-CSE-ConnectionGUID: j6Pr56hNQM+czWwWVpUS2A==
X-CSE-MsgGUID: BzzXog8SRkmstohvVVDcGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="81801723"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="81801723"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 07:17:40 -0700
X-CSE-ConnectionGUID: ty3Ac7qZT1a1tq8coDIq9g==
X-CSE-MsgGUID: pE/9Z1ITTAKBpfJEWwv+JA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="248050778"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 07:17:39 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 10 Jun 2026 07:17:38 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 10 Jun 2026 07:17:38 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.30) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 10 Jun 2026 07:17:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D7gMlyJC64Pj+yd82AD+GqmuAkBVi/JOLCkO5FUrZjqNdbhT8lqcgzt9i4BDcHps/myl3kEEYvvt6awOioiwppmVbCx3qa0/gkd7gkn7xp0WZr3zZertQe/m60nxOUoEe6h0flnFNJXErqEuzX+tFmMj4rzJOd832mff8OiocGXETWTrT/j2iO2ZNEBuY+VXBmViBOblY96+TJRL3DnAy2ww1QocQurgCwkFDR0d5SUHTPYR7onzWjPe0kOSVKsyF0Bgod0/fLgPMXQX0dw62ELBppFkirBKyePl0Ue6jAwTPz3ctDZkO3hWkYrrqZ4PQ0KRK0sZG5LW6jXwer41vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rRN+5RaUylJ2TVJB0ra78Fb3PfmokZoTP2kToCg/Yfs=;
 b=XBNraFLS/QhwSOsWRD4W3kzuIpTcCo7491TxET4zcqRhfpVpxKG09/TqcRUDEqL2GQy3CWZfUz70mwwreoqMctmz3XfCd4AMRw72rJ7ci9JvRYyS1u9u6y57ebaaB6Ue4Zk79Ecg3KNYhSKMVnyLXXdixYhVnFaVe+v3KM4invclbQIAxtqffb6DKqm7eACoUSOfgkrXdEquYYLfAg12eMpm+a7NZ6J9C1/4O/UTc8VLwPJxpHRXvwOD+YdXcEBKu6sHaVDZtVgpN291Dai3s+0DK9YhtOm1lBBXRm1L50/nKWEHUTZtLfxcPJrnVVQwUUUXD2wGu1a3sUjsA5Lw2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8718.namprd11.prod.outlook.com (2603:10b6:8:1b9::20)
 by LV3PR11MB8674.namprd11.prod.outlook.com (2603:10b6:408:217::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Wed, 10 Jun
 2026 14:17:26 +0000
Received: from DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c]) by DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c%4]) with mapi id 15.21.0092.011; Wed, 10 Jun 2026
 14:17:26 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Souza, Jose"
 <jose.souza@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost, 
 Matthew" <matthew.brost@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>, "Auld, Matthew" <matthew.auld@intel.com>,
 "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>,
 "Mrozek, Michal" <michal.mrozek@intel.com>
Subject: RE: [PATCH V11 11/12] drm/xe/uapi: Expose ban reason in
 EXEC_QUEUE_GET_PROPERTY_BAN
Thread-Topic: [PATCH V11 11/12] drm/xe/uapi: Expose ban reason in
 EXEC_QUEUE_GET_PROPERTY_BAN
Thread-Index: AQHc9OhdiHf94t/DTkaXwgqtITCRrrY0tXIAgACxLoCAAnWPAA==
Date: Wed, 10 Jun 2026 14:17:26 +0000
Message-ID: <DS0PR11MB8718ECA4E0D9067E4C41EE51811A2@DS0PR11MB8718.namprd11.prod.outlook.com>
References: <20260605123839.236021-14-tejas.upadhyay@intel.com>
 <20260605123839.236021-25-tejas.upadhyay@intel.com>
 <543ed281612b0f8b1cd289448ae917896f18200c.camel@intel.com>
 <aidgZ1zsihvCPGqq@intel.com>
In-Reply-To: <aidgZ1zsihvCPGqq@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB8718:EE_|LV3PR11MB8674:EE_
x-ms-office365-filtering-correlation-id: c3f7b143-0c5e-4223-2acb-08dec6faff80
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|11063799006|56012099006|4143699003|6133799003|38070700021|18002099003|22082099003;
x-microsoft-antispam-message-info: D1xy9vg4q+i/ra3KTg/A7p53TF83Rfr7ax0MXr32R3PhekLKaVfFHV5TGG4UOsTKQUuME0VppfGGPn/2CinMo2sLi0CVhC91Led7XuGlgnW3N/CLmOAaeD1Gaf0KM5jZBrtGgJ4bsVy4s4fIXJrsauTuKBZUm5GuuRlfmMe3CbcdbngMVHHhXJSKQx+PaRPb2Cel+belph8CeIFi9ylHKWKHJ1fbBUgniX5OLwzQVFXGQXLH2cM+5da5S6H8/ZpkUSVMLXLhKg61poW+laQv8pp5Fk/rhhlHn9jYqMmaFVdLwJS0n6L7ELtX8MpW0v61N/NMEiB22O1ckJO+MouktelRoewt9FKPLAzCMVJAX0+1U8zPhR8pT3/goo11DSTjcwkOx0CL9Oim6p06OXkw8EiAXoZOwmWA6fEnL/PzGfXKpeQFqEkPdYxs2Z5NE8E0b9aaK75Nt1oqVH8aYDCu+7DpyzapNpSXrp607Y30rexrW9IOI0MjJJV4OJqsyAnfMnkeiVn005lIG7Mb7pDynuVcSfIrk63nBHPwPYn1uc47z0oLf6QdQo2AnjoYatOgZeUwSv0VzGv/jaU6v1y9bJqWHf+Piud4TwqNwoNGFTNHkVKD1IofDQDK4O6fF6J1VvX8JU71pl7l6rO+Q3AFLqpVtByStaV6M61bZ1nRYjC79PPIY/hGAvA+yRwlLX8g6Mo3DiE8Qdo0/FpexCvzzQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8718.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(11063799006)(56012099006)(4143699003)(6133799003)(38070700021)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?4EWjYWc8Vr2kbaTINf9yR/J1W1ZCjS1imoNho0TwQTRTwouxrtRT7+h90Z?=
 =?iso-8859-1?Q?XH3SXlwrmlXMJeifPsUkFW9wQWGgZIHtsWZUhMOLXcrkQHIzxiZVFGB8iI?=
 =?iso-8859-1?Q?YYt7AduhV3c1lnlnoDSWCEfu2kC6dhnHXaejhPW7cA+u6IEHA2Z1lOTBiY?=
 =?iso-8859-1?Q?oHbiBoXeW5PbPqMQCnT+9QZ28SsxeA3Rz08yYMRpOFiivKPc7jcCORiQaP?=
 =?iso-8859-1?Q?fVn4X4ML0Jsv4Kj3Y1j6iGqeDIG/trjN0c9TDiCkCgW6iTEoWFxEb9W/rB?=
 =?iso-8859-1?Q?46MxHkYpZBi+x6pOBvcrBeilpWQM7W4wF/NWcdpt3NEkJxka1qFdojKzVW?=
 =?iso-8859-1?Q?Bg7c/67iYLOyNk4E2oAmEqzOUxAZbh/maiRNq9P6inFcUPz9brIhs1ziOR?=
 =?iso-8859-1?Q?Dm3i5M5msNh2OVY5yItbC6v0qX7N+TmUJBE0Usw7f8/2ptfClNErOgICsL?=
 =?iso-8859-1?Q?Xv5J7LqsvWlYB2JieVZt4XzLZeYrzX3qafmIT0EuZWCzrHgmuQL3tpmqRq?=
 =?iso-8859-1?Q?d7KgiGfCIh3Ttc3ys/7RtVm7uNLRCGWn2YYzPSjbY+qeQxOgRxzSZLIeSW?=
 =?iso-8859-1?Q?KHK7ecOfUDDe+wxXgEvxlLHLM9bZX1mAPniEZMPZglYMJezOB7jWOilQ4G?=
 =?iso-8859-1?Q?vkgSYC7tzsOre7S8TlaHshBbGfH6EZwVBP1w4oejuc7+NAMe3SYnftSFGs?=
 =?iso-8859-1?Q?6xJh5BAC8nkMi3tItuSnDVnYb+IEASPqkrlcYdIs+NrvwjdAZqUjjffslN?=
 =?iso-8859-1?Q?Hs8Yh7zRsQUI1aE/uy4UHy4Xq/f1XIE1E3itxVOjRKiDWVpn9fAch+XKnx?=
 =?iso-8859-1?Q?/6Ewq9A9D6zn6AH0D7rOYEck6O0a+h2wtFsPfXG2bDkOhHNoOlLSo4NEQr?=
 =?iso-8859-1?Q?8fuXdtcCWapkTWiUYYsrXE722bFo9uhNA9loOIdna4NNMqolkwDsUkI2AC?=
 =?iso-8859-1?Q?1aBal0kjB0L4GaRtcIE7BC+EOfvXbC4Wq4KvYSig9HHwEWFrYnSa7AHq6V?=
 =?iso-8859-1?Q?KUCHMd5KXyDURdJbEGg67ls92KUZQq003GZcgP57W+KsN/xcRtrdx2rCTh?=
 =?iso-8859-1?Q?tHkdbbA1waanhtZY9IW1i9L69lePLlnfnwK7s0GbF47joF+ADU4vJiozly?=
 =?iso-8859-1?Q?gb6M3S9hcuLNwVzzK4Hb1SSQpF9Z6qr4Y7qKZUi0P3HlXNxejwFvgiFbH1?=
 =?iso-8859-1?Q?7dMsRCw0/TdCWEKyHWyv7S3N0yBUqyUCp4C4vRsYtyyyaXZtmEyzmN7vuX?=
 =?iso-8859-1?Q?wpzgmzHplxId71MsNLNK22y9JFtKRjeF8XKOFK+D5IJw77DUZUVBRfq8el?=
 =?iso-8859-1?Q?fxOMR4tvkhwg5gsDSEBCr2Z9+ZZfxnWkBRttO50E7fm/I9WN5yqMEt5qTU?=
 =?iso-8859-1?Q?SHfuMy+YkNg8FMlyRnRIb27SdTOeHDrHw/4//h81Z3ToQsCqremQVkiGS7?=
 =?iso-8859-1?Q?TPTww4gsq9JAG6IeqVGW/gx6V/iSOm1bD6Vvr3B4ZfgbnSxCbe1xcuaznm?=
 =?iso-8859-1?Q?/9r+MezpdD+PmRU4ntZak6/HVNo1ZXP+fDB4ptGSG1EeRJCPhbvWuEHtYx?=
 =?iso-8859-1?Q?vqch9gEO+2Vfq41U9suq47D+S6ugb0z0KmVZd8p3n9jVTi+NYT/BHpgr5i?=
 =?iso-8859-1?Q?rHJ5q8wfaFTeVZQiK7WDD97Gndd/xUKv/6uguPfCAIhgx1HzulF+4zoYt0?=
 =?iso-8859-1?Q?nl+Iiq7qDE5Avv1eoQwa6CzxLTEUUlQXYvDJeanj6kHYV316xGA0JfSaWW?=
 =?iso-8859-1?Q?MZw+OcAkTnzej8a8qMGq6uaAnkP/e9je7arw33EwqzrS4/mqejwh0dP3VY?=
 =?iso-8859-1?Q?uwT1ssw8rA=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: NjtdqCLxPcLf/IZadXi6LtgEQMU2JGeZuCK9fNK5QmVGqzyD5g3PYf/3URfkL/jRMsLb21EeJcQV8jr8h14IX8e3GwcozAHdB8AZ/tQqECocdvKACO2wkWhsbC2kFTM/0xE/yYIhV8TzFf+c9TdOsNc+17u1eU0PbwyZuiYXi0UMnPVJgmehXbowEoQuSVNHmSJAn3ZE7/ZiUca8rzStVHfnAsns68MaIvw6bon/MjpZMlLRgWtwDjvuh8xcjsDJnMHkEtK2LmGtMjfBfdFkwJmN1YZW6pOHqSJoKwTvMVKSXjCSEPOKPDTo0CoNTKnwSWlLPN6D1vAmkQruUu+BEQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8718.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3f7b143-0c5e-4223-2acb-08dec6faff80
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2026 14:17:26.3857 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9k/Dgdl2+P8vnbyEhxDsxjkkQEB01foMXNc785fAsTqfbbPMm/wmN7efqs6glHAJ4c9wSFdGdZkppHH1f45e+m+PR7v2Mvi3OKhLw4r9S3E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8674
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
> From: Vivi, Rodrigo <rodrigo.vivi@intel.com>
> Sent: 09 June 2026 06:08
> To: Souza, Jose <jose.souza@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Upadhyay, Tejas
> <tejas.upadhyay@intel.com>; Brost, Matthew <matthew.brost@intel.com>;
> Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>; Auld, Matthew
> <matthew.auld@intel.com>; thomas.hellstrom@linux.intel.com; Mrozek,
> Michal <michal.mrozek@intel.com>
> Subject: Re: [PATCH V11 11/12] drm/xe/uapi: Expose ban reason in
> EXEC_QUEUE_GET_PROPERTY_BAN
>=20
> On Mon, Jun 08, 2026 at 10:03:50AM -0400, Souza, Jose wrote:
> > On Fri, 2026-06-05 at 18:08 +0530, Tejas Upadhyay wrote:
> > > Extend DRM_XE_EXEC_QUEUE_GET_PROPERTY_BAN to return a bitmask
> > > indicating the reason for the ban, rather than a simple boolean.
> > > This allows userspace to distinguish between different ban causes:
> > >
> > > - DRM_XE_EXEC_QUEUE_BAN_REASON_GPU_HANG (bit 0): exec queue
> was
> > > banned
> > > =A0 due to a GPU hang or job timeout detected by the TDR.
> > > - DRM_XE_EXEC_QUEUE_BAN_REASON_PAGE_OFFLINE (bit 1): exec
> queue was
> > > =A0 banned because a VRAM page backing its resources was taken offlin=
e.
> > >
> > > The ban_reason field is added to struct xe_exec_queue and set at the
> > > point where the ban is triggered:
> > > - In guc_exec_queue_timedout_job() for GPU hang.
> > > - In xe_ttm_vram_purge_page() for memory page offline, before
> > > calling
> > > =A0 xe_exec_queue_kill() or xe_vm_kill().
> > >
> > > The reset_status op is updated to return u64 with the reason bitmask.
> > > When a queue is banned but no explicit reason was recorded (e.g.,
> > > from a generic CAT error), it defaults to GPU_HANG for backward
> > > compatibility.
> > > A value of 0 means the exec queue is not banned.
> > >
> >
> > Acked-by: Jos=E9 Roberto de Souza <jose.souza@intel.com>
>=20
> Do we already have a userpace change with this?

By userspace you mean IGT or other UMD? I have thought to add simple test t=
o offline and check for BAN reason in xe_exec_basic or somewhere. I have ig=
t tests  https://patchwork.freedesktop.org/patch/714751/for testing mempage=
 offline via debugfs but that does not test complete flow of mempage offlin=
e feature so not extending it with this.

Tejas
>=20
> Cc: Thomas Hellstr=F6m <thomas.hellstrom@linux.intel.com>
>=20
> Thomas, thought on this vs the watch_queue you have or they are
> orthogonal?
>=20
> >
> > > Assisted-by: Copilot:claude-opus-4.6
> > > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > > cc: Mrozek, Michal <michal.mrozek@intel.com>
> > > cc: Jos=E9 Roberto de Souza <jose.souza@intel.com>
> > > cc: Vivi, Rodrigo <rodrigo.vivi@intel.com>
> > > ---
> > > =A0drivers/gpu/drm/xe/xe_exec_queue_types.h |=A0 7 +++++--
> > > =A0drivers/gpu/drm/xe/xe_execlist.c=A0=A0=A0=A0=A0=A0=A0=A0 |=A0 4 ++=
--
> > > =A0drivers/gpu/drm/xe/xe_guc_submit.c=A0=A0=A0=A0=A0=A0 | 24
> > > +++++++++++++++++++---
> > > --
> > > =A0drivers/gpu/drm/xe/xe_ttm_vram_mgr.c=A0=A0=A0=A0 |=A0 7 +++++++
> > > =A0include/uapi/drm/xe_drm.h=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 | 12 +++++++++++-
> > > =A05 files changed, 44 insertions(+), 10 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > > b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > > index 2f5ccf294675..77a621da4487 100644
> > > --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > > @@ -143,6 +143,9 @@ struct xe_exec_queue {
> > > =A0	 */
> > > =A0	unsigned long flags;
> > >
> > > +	/** @ban_reason: Bitmask of ban reasons
> > > (DRM_XE_EXEC_QUEUE_BAN_REASON_*) */
> > > +	u32 ban_reason;
> > > +
> > > =A0	union {
> > > =A0		/** @multi_gt_list: list head for VM bind engines if multi-GT */
> > > =A0		struct list_head multi_gt_list;
> > > @@ -316,8 +319,8 @@ struct xe_exec_queue_ops {
> > > =A0	 * signalled when this function is called.
> > > =A0	 */
> > > =A0	void (*resume)(struct xe_exec_queue *q);
> > > -	/** @reset_status: check exec queue reset status */
> > > -	bool (*reset_status)(struct xe_exec_queue *q);
> > > +	/** @reset_status: check exec queue ban status, returns ban
> > > reason bitmask */
> > > +	u64 (*reset_status)(struct xe_exec_queue *q);
> > > =A0	/** @active: check exec queue is active */
> > > =A0	bool (*active)(struct xe_exec_queue *q);
> > > =A0};
> > > diff --git a/drivers/gpu/drm/xe/xe_execlist.c
> > > b/drivers/gpu/drm/xe/xe_execlist.c
> > > index 9fb99c038ea8..35e6e05ba418 100644
> > > --- a/drivers/gpu/drm/xe/xe_execlist.c
> > > +++ b/drivers/gpu/drm/xe/xe_execlist.c
> > > @@ -452,10 +452,10 @@ static void execlist_exec_queue_resume(struct
> > > xe_exec_queue *q)
> > > =A0	/* NIY */
> > > =A0}
> > >
> > > -static bool execlist_exec_queue_reset_status(struct xe_exec_queue
> > > *q)
> > > +static u64 execlist_exec_queue_reset_status(struct xe_exec_queue
> > > +*q)
> > > =A0{
> > > =A0	/* NIY */
> > > -	return false;
> > > +	return 0;
> > > =A0}
> > >
> > > =A0static bool execlist_exec_queue_active(struct xe_exec_queue *q)
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c
> > > b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > index 4b247a3019d2..ff28eab7cee2 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > @@ -6,6 +6,7 @@
> > > =A0#include "xe_guc_submit.h"
> > >
> > > =A0#include <linux/bitfield.h>
> > > +#include <uapi/drm/xe_drm.h>
> > > =A0#include <linux/bitmap.h>
> > > =A0#include <linux/circ_buf.h>
> > > =A0#include <linux/dma-fence-array.h>
> > > @@ -1530,6 +1531,7 @@ guc_exec_queue_timedout_job(struct
> > > drm_sched_job *drm_job)
> > > =A0	if (!exec_queue_killed(q))
> > > =A0		wedged =3D
> > > guc_submit_hint_wedged(exec_queue_to_guc(q));
> > >
> > > +	q->ban_reason |=3D
> DRM_XE_EXEC_QUEUE_BAN_REASON_GPU_HANG;
> > > =A0	set_exec_queue_banned(q);
> > >
> > > =A0	/* Kick job / queue off hardware */ @@ -2211,13 +2213,25 @@
> static
> > > void guc_exec_queue_resume(struct xe_exec_queue *q)
> > > =A0	xe_sched_msg_unlock(sched);
> > > =A0}
> > >
> > > -static bool guc_exec_queue_reset_status(struct xe_exec_queue *q)
> > > +static u64 guc_exec_queue_reset_status(struct xe_exec_queue *q)
> > > =A0{
> > > -	if (xe_exec_queue_is_multi_queue_secondary(q) &&
> > > -
> > > guc_exec_queue_reset_status(xe_exec_queue_multi_queue_primary(q)))
> > > -		return true;
> > > +	if (xe_exec_queue_is_multi_queue_secondary(q)) {
> > > +		u64 status =3D guc_exec_queue_reset_status(
> > > +				xe_exec_queue_multi_queue_primary(q)
> > > );
> > > +		if (status)
> > > +			return status;
> > > +	}
> > > +
> > > +	if (exec_queue_reset(q) ||
> > > exec_queue_killed_or_banned_or_wedged(q)) {
> > > +		u64 reason =3D q->ban_reason;
> > >
> > > -	return exec_queue_reset(q) ||
> > > exec_queue_killed_or_banned_or_wedged(q);
> > > +		/* If no specific reason was recorded, default to
> > > GPU hang */
> > > +		if (!reason)
> > > +			reason =3D
> > > DRM_XE_EXEC_QUEUE_BAN_REASON_GPU_HANG;
> > > +		return reason;
> > > +	}
> > > +
> > > +	return 0;
> > > =A0}
> > >
> > > =A0static bool guc_exec_queue_active(struct xe_exec_queue *q) diff
> > > --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > > b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > > index 35b5eaf590fa..3765e8fcdcec 100644
> > > --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > > +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > > @@ -7,6 +7,7 @@
> > > =A0#include <drm/drm_managed.h>
> > > =A0#include <drm/drm_drv.h>
> > > =A0#include <drm/drm_buddy.h>
> > > +#include <uapi/drm/xe_drm.h>
> > >
> > > =A0#include <drm/ttm/ttm_placement.h>
> > > =A0#include <drm/ttm/ttm_range_manager.h> @@ -537,10 +538,15 @@
> static
> > > int xe_ttm_vram_purge_page(struct xe_device *xe, struct xe_bo *bo)
> > > =A0	xe_bo_unlock(bo);
> > > =A0	/*=A0 Ban VM if BO is PPGTT */
> > > =A0	if (vm && (flags & XE_BO_FLAG_PAGETABLE)) {
> > > +		struct xe_exec_queue *eq;
> > > +
> > > =A0		down_write(&vm->lock);
> > > +		list_for_each_entry(eq, &vm->preempt.exec_queues,
> > > lr.link)
> > > +			eq->ban_reason |=3D
> > > DRM_XE_EXEC_QUEUE_BAN_REASON_PAGE_OFFLINE;
> > > =A0		xe_vm_kill(vm, true);
> > > =A0		up_write(&vm->lock);
> > > =A0	}
> > > +
> > > =A0	if (vm)
> > > =A0		xe_vm_put(vm);
> > >
> > > @@ -548,6 +554,7 @@ static int xe_ttm_vram_purge_page(struct
> > > xe_device *xe, struct xe_bo *bo)
> > > =A0	/*=A0 Ban exec queue if BO is lrc */
> > > =A0	if (bo->q && xe_exec_queue_get_unless_zero(bo->q)) {
> > > =A0		/* ban queue */
> > > +		bo->q->ban_reason |=3D
> > > DRM_XE_EXEC_QUEUE_BAN_REASON_PAGE_OFFLINE;
> > > =A0		xe_exec_queue_kill(bo->q);
> > > =A0		xe_exec_queue_put(bo->q);
> > > =A0	}
> > > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > > index 48e9f1fdb78d..904d58b039fe 100644
> > > --- a/include/uapi/drm/xe_drm.h
> > > +++ b/include/uapi/drm/xe_drm.h
> > > @@ -1503,7 +1503,17 @@ struct drm_xe_exec_queue_get_property {
> > > =A0	/** @property: property to get */
> > > =A0	__u32 property;
> > >
> > > -	/** @value: property value */
> > > +	/**
> > > +	 * @value: property value
> > > +	 *
> > > +	 * For %DRM_XE_EXEC_QUEUE_GET_PROPERTY_BAN, this is a
> > > bitmask of:
> > > +	 *=A0 - %DRM_XE_EXEC_QUEUE_BAN_REASON_GPU_HANG - banned
> due to
> > > GPU hang/timeout
> > > +	 *=A0 - %DRM_XE_EXEC_QUEUE_BAN_REASON_PAGE_OFFLINE - banned
> > > due to memory page offline
> > > +	 *
> > > +	 * Value of 0 means the exec queue is not banned.
> > > +	 */
> > > +#define DRM_XE_EXEC_QUEUE_BAN_REASON_GPU_HANG
> 	(1 << 0)
> > > +#define DRM_XE_EXEC_QUEUE_BAN_REASON_PAGE_OFFLINE	(1 <<
> 1)
> > > =A0	__u64 value;
> > >
> > > =A0	/** @reserved: Reserved */
