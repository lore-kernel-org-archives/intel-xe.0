Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 419A5CCF9E3
	for <intel-xe@archiver.kernel.org>; Mon, 10 Nov 2025 22:16:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04B4910E0D6;
	Mon, 10 Nov 2025 22:16:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SssDF1nu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F93E10E0A4
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Nov 2025 22:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762813007; x=1794349007;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=L+Ml8qvnvhK3XbUJlet20+crukUYisWqDFN7vtAhl7o=;
 b=SssDF1nua25usPLuwBjcGkV5I5Yu3bUqbg0Q0FdDNHgjphjwcDT0zemE
 Iv1NzdImgRlJfF9AoelZiY6ay+f39RH54G/mAZjt+osXGwXVmAb+Rm7wM
 j1Czp0cS1Tv3mKH30dEDz6G+kbHvg9wYTOv6krRsgf19V3mOxhiO2LZvE
 RkIyAWhhxafPWDpcY6/M0fHoBd/ioNzkDk1rmg5bPmZvwCREnUpqyhksp
 jhuNJdTMJCw9zUYw+lKw28uwnl4FssOovKhbhN0nneZaDKd7rXYYLH8Cl
 Z6EIPmBdhMoiv4F81T+amU2IJmyXZu/Sx6U39av2+4fnoDt+8f2OLx1oE w==;
X-CSE-ConnectionGUID: K5D0MIeNTouzKmEnedogRQ==
X-CSE-MsgGUID: Hmz/wQDSQ0+n9aSrOWvrdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="64909556"
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="64909556"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 14:16:47 -0800
X-CSE-ConnectionGUID: dzHLJj8xQoCyTfeDmTl4Rw==
X-CSE-MsgGUID: fTn8Jo2SRnSWCIdRlqDzgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="212167993"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 14:16:46 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 14:16:45 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 10 Nov 2025 14:16:45 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.3) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 14:16:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WO5+fSECJ55/c6pv0wQeGkymuaEZNQQM1IEDPQAK079uNDmtiIswBnik38ILR1VzPBFqoTbEIw81sM32L/mKrRJ6EK/WxerI6qur1j9eAqn1YIeZRSvatv7k/79hrMKcXg6pkuBu+zITF7bMssfGaved8PJGH3ov7mvFfn9xwn+nzduJCQJ1pQ/uud3wOEip70EMKjBpmEvqBQtRAm242PPrvdImNiJGZkVutlQ0SmkhmkFQn8xS+7ktM4vghrzhaZaJolM5V9E/tKrh+1UXbqBGWI+9gaxe08fHR+vfBxlN2g30jMnV9TK5TLkWquE3xwGppwec28UUafYSvhEUNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eMLWX1b8AMWMbGvZ6qZzkrwC01T3SLQC8oArZbuyKEM=;
 b=OUG3VR6KzhFAsbW8YICt5BUybPvmrQQw04UOg5N0NpnmEfDAzdHRxOYLuAQSmr0h4TEo13OLkRc5nW/IpXNX0TSzikKCTcwVckeMVoelXvOlo2ijh5jKTvw7M4FW5uxw4MlJnDXpjnZVFbISRs6MtkM4XiPpEfyMTHi6Tulo3SHW3+Z5CpG3E5F4ESCOppiGxxB/lsnQNEbz1uWSDqj71LWFBtd2ejxLman7p31o4ssuxkNLmNEG/7hjTV3UupQ1VFO6c1OOztpOfs4DGh4LjSm09CzB+HcBn+rZuF6prVKGnuKqBfMwon4ZIUXgvctNL1mxmSlUyCyKiLiUCSFD5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA3PR11MB8046.namprd11.prod.outlook.com (2603:10b6:806:2fb::22)
 by PH0PR11MB4903.namprd11.prod.outlook.com (2603:10b6:510:36::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Mon, 10 Nov
 2025 22:16:43 +0000
Received: from SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::f04:d46a:1742:5c3c]) by SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::f04:d46a:1742:5c3c%4]) with mapi id 15.20.9298.015; Mon, 10 Nov 2025
 22:16:43 +0000
From: "Wang, X" <x.wang@intel.com>
To: "Auld, Matthew" <matthew.auld@intel.com>, "Gote, Nitin R"
 <nitin.r.gote@intel.com>, "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Mrozek, Michal" <michal.mrozek@intel.com>, "Yadav, Sanjay Kumar"
 <sanjay.kumar.yadav@intel.com>
Subject: RE: [PATCH v5 3/3] drm/xe: implement VM_BIND decompression in
 vm_bind_ioctl
Thread-Topic: [PATCH v5 3/3] drm/xe: implement VM_BIND decompression in
 vm_bind_ioctl
Thread-Index: AQHcT9hE4mE1qTD2gEavzuFsoXo/prTrz5cAgABxoAA=
Date: Mon, 10 Nov 2025 22:16:43 +0000
Message-ID: <SA3PR11MB80466B275236F3EB8C04D82186CEA@SA3PR11MB8046.namprd11.prod.outlook.com>
References: <20251107114757.561671-5-nitin.r.gote@intel.com>
 <20251107114757.561671-8-nitin.r.gote@intel.com>
 <a6d92296-31b3-41bf-9ae1-d3942bd017c4@intel.com>
In-Reply-To: <a6d92296-31b3-41bf-9ae1-d3942bd017c4@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR11MB8046:EE_|PH0PR11MB4903:EE_
x-ms-office365-filtering-correlation-id: ebeec141-c007-4f97-cee3-08de20a6d4ae
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|42112799006|376014|1800799024|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?6pckFR0+bzs0xIb8aY6ApEhrZw9jsyttKuPK6mXgkKgUsoWsay89E0lCj0Uf?=
 =?us-ascii?Q?9lZ43LjMN354w4olBhiheq23iaPoVawoDilue63VtisQ29SfEmZmV+LphRoG?=
 =?us-ascii?Q?L6/MqNhEexIYPMwvDvVbUq2juJxVAa5Edoj2SZhurDvmwDBSFGYbc8nxQ80f?=
 =?us-ascii?Q?Kgu0+/VciLcnNmgy7EVca5Z9y1nmomtD3ang3E8JN3Uofkl281P61GBwp/Y3?=
 =?us-ascii?Q?D566BLHALCLjwxhFKWf1awKKcu3/5uxf9L/ISTXBZm0/djPKYq/n5g8fDVE1?=
 =?us-ascii?Q?4SB3Hbc5IXOMijkoS6OgwW4upwGrJ//FfKF8VObs1rgN/lZ3I1ZdOrwNe4yR?=
 =?us-ascii?Q?IGm4nfP+WGdFBuqKULaMXsqud69+Ji/eJYXL4dzC4srrOW/GRaQfnFOEXJfb?=
 =?us-ascii?Q?5N/CHC52XKlEC+fmAhQqh5p+Rj15ZB5PqH8bLlFHwQ4E12dgRBMRLrwHMj9s?=
 =?us-ascii?Q?TK/8Gs1VndCjAF/DZBJ2Ow/qP42qUa6EdXHJM642Lm5HVl/VzPx/m+q0Qdhd?=
 =?us-ascii?Q?xWJOozTnOiKQIwwL8NYLx8D7aG4rcSJhTM9tXet+0ZZuYuQu2S1rRkCz0RA6?=
 =?us-ascii?Q?DSfRBejWoP1C1WnlElUcY4qwBAWvFzrnui7yYVEYQ32+6KW17Ej3uxHsO3QN?=
 =?us-ascii?Q?iu0FaPGPEB2WzRK83pTtpTDNxvn99Gp1D/2blJFlm0x0ZaQdgOAMWTGUnpJR?=
 =?us-ascii?Q?0n81nppAdi2EMp1T3aBuSFJhSkmxQxGvrEzuxlC6CbTZQ7gLwEsH4lWBRmb7?=
 =?us-ascii?Q?AxL3S1JVqhbyo3Y+BDO2wBtDaG3LyL+I8aE42TrM54eD272IPq5qDwkBsYyv?=
 =?us-ascii?Q?vzzqVraiL0zmP4fJKk7yBftZ8rhdjRPmgyU2/Mx73B+uLMFjJuthFrsAnov0?=
 =?us-ascii?Q?HXuSXp0lgOYjTcwEMrwrE+Mn6YwcLPVJrse0xMIqhIzfiJpS0VF9kkdB9jV8?=
 =?us-ascii?Q?CG9a+mRMcef+PYNtQ0FCh2Rp7O2ba6S248kJflwsBKJeLzVr35mX1sDlTzzx?=
 =?us-ascii?Q?bpgiFZj0SWvVuzq3XtU6Gc4ncDMnWwYqV83WPK+4K5QTptIGN/GQFtedyK6R?=
 =?us-ascii?Q?uPpTxWjhNmpNWfqy3PBnBbpoB1Q8jfi0XalIFN7dxgYfija5BFbe2s+kiPqW?=
 =?us-ascii?Q?3FVUi0WjX7ECo6OQDGz1hT4yf5BCPNXBJLnXcdDmN/eM0xnoybFVZPpJyerh?=
 =?us-ascii?Q?RfVrYknfLNm6ECGmeBKN5Im9OMb39ohZkQD0IKquAYHs8s/ZMDtSPgHm77Cj?=
 =?us-ascii?Q?GhhEHDnJbxYa52YCe288/02UbpYYYyusRcrtemKAZfGByxX5NyFbanIeU32K?=
 =?us-ascii?Q?0x04tV/Dvk3Tra0fiRYqUzujeTYmy0bXY536vHOe6yWl5eR+ptZfQcSprR8o?=
 =?us-ascii?Q?zOFg4SdI/8of3YmLKNXilDUew9G0xVwwVQvQgnJuVyjHWet/Zg9iZyuPK/Yu?=
 =?us-ascii?Q?Rf4ZVotsOymnqvkBqZwkYqgTIAvQcZmSCpbud0EoelNAhCH4jIn/5Q=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB8046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(42112799006)(376014)(1800799024)(38070700021)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?auzkbGgxDC6Tf5mtBoEqu5mTgXi24FUgVp5s+yvyIQ/ugHLGc3kmZ6hpZp/4?=
 =?us-ascii?Q?ukOrqC8+wpZJvubw2wfzw8VJUvjcj1L87fcHCj2aTVet4K2AYSzZspY7h5GX?=
 =?us-ascii?Q?0kA7OgMCngoUq30JPoTeJ59JtzU2/iKqlEqPSwCBSUrGvtTmemYaMWqfefsR?=
 =?us-ascii?Q?KsbJyz80l1zuMBMY6DSvsXj/dblvyemCw7ID5lotzNRagRZWNCGSfRSjjvYu?=
 =?us-ascii?Q?i/N+NDVY5T2IOeamyED07S/0m9d98hiX9+ni4Wy2fASzZXnjXmK2OCXTqL3u?=
 =?us-ascii?Q?UqO2EFT7c0xIGevq1AmF0ZfE7imn8/lOK5nWyuEkhb5EyW/UZhZN/hUwgsSr?=
 =?us-ascii?Q?MVcyPSQQQj1ptM/s/cnnR6Y701qGJgz1PbNSFN9/xE+neugA75xfgAl/PrBU?=
 =?us-ascii?Q?Hv7jR1W7i0IrdCx7UVae4gxgT0GIUNd/0AtcNtvOHjqcJuVc+6hXvnVWkB8a?=
 =?us-ascii?Q?HtIx/0U7P243AlyAlX8AGBk7ItqsNaOKexrzk+rKE4qH7BKLFSYRv+M49INY?=
 =?us-ascii?Q?7ibV7sATOn2Kc8nT8CtiV+L/wONPb1CXqSUIF5L6tzIRs7XkGcfN38B/dY/E?=
 =?us-ascii?Q?H+UjTiWL5jKxpHWAg0QkD6zuRPbuqHj9c4FZgXjrkaD4+pKcMbwemvm+4EKW?=
 =?us-ascii?Q?LdmzAFwGieSrb2YXe6oUe5/Ok61RjXXjhBO5GLZOPL8NXl8XsDayyB+Cd94G?=
 =?us-ascii?Q?uQvol/MatHKmqHUkFVkxj9R08ZkACK0YSL/1wQHGET+jcRznpk3Ycu3gIlJK?=
 =?us-ascii?Q?6yke5cv8nMvw1w5EwsTDirl9FYKT/Il2QiVNkhvFjMkL6JqSO7lR2NO5STl7?=
 =?us-ascii?Q?EXsA76m+IiwFY9NGKwi+T3mS6uWvXV6SWvA7BuU7A0vvRzFO7x0nNykiN/rn?=
 =?us-ascii?Q?gX8bvI7kD5lgNupKDt9DpYGyFUN9jrMbAnYJGgQEiUOJdNwuanngLUySJjMp?=
 =?us-ascii?Q?jwyc8M68BmTYbqdb2Wqsv8JC/AiawLqwnEP+AW8MLyB5CRXaznHqRbZaZxFi?=
 =?us-ascii?Q?HNjWzaOBfANj8wXO/DSWUi2dyP79u/DCUqDkD/qAH+sUsEWgtNWkyBY4RhQc?=
 =?us-ascii?Q?iVTSxRJjAs7ItK/c+N9KXfCIgmJSHLyWfsW6PIz6hhvjZN7AvhGzD0Nnniz2?=
 =?us-ascii?Q?8wqMiEQ7cEuAMQBZPEcBnbp0dx1+aUR7oxRv2cozCJNji6t9J43CQyH75gZq?=
 =?us-ascii?Q?Kd3/dfUbjMyt/9cEXDwJ9f8l7BpgWa92m17swNJOcKhfQR1oDjcxuVNnKlT+?=
 =?us-ascii?Q?wIVXozgCyFEZe9f/vjnAVA0z3Q5juX+JMB035Doj+ruXPwby1Vp0dr8vxD2G?=
 =?us-ascii?Q?hbvk02h093gFUOqSjGTNKAZwxU9oZhe0DD3UIUI5u1LJwrLeFoXMTp+K92c0?=
 =?us-ascii?Q?TqrendcAFf+TnJUEW4unEdmsh4rL2SGz8rrGcSHBtM4xUCHIgqdqXid881Oq?=
 =?us-ascii?Q?yT1EadRNAbQa61NQe8OZndJFVmgMjdeKL2IZl0UJAsnNKQUdBiLY6YeTL9Le?=
 =?us-ascii?Q?Ldfwyo0tHdb8OxH3td5QwjUbxV8EtpSCW8tsntB2Kl+EucBhNBG3vf1DwVYS?=
 =?us-ascii?Q?aLJMN0+E0uQBTULfFmo=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebeec141-c007-4f97-cee3-08de20a6d4ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2025 22:16:43.7741 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ST3teqxWGpNQNNhkCRWstIOyp1dolfxMgzzOAqKiY+qn0Fq/LEgBDcyLqv6CIshhUHRaER/M34gD2JY5FuGrng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4903
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
> From: Auld, Matthew <matthew.auld@intel.com>
> Sent: Monday, November 10, 2025 03:46
> To: Gote, Nitin R <nitin.r.gote@intel.com>; Brost, Matthew
> <matthew.brost@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Mrozek, Michal
> <michal.mrozek@intel.com>; Yadav, Sanjay Kumar
> <sanjay.kumar.yadav@intel.com>; Wang, X <x.wang@intel.com>
> Subject: Re: [PATCH v5 3/3] drm/xe: implement VM_BIND decompression in
> vm_bind_ioctl
>=20
> On 07/11/2025 11:48, Nitin Gote wrote:
> > Implement handling of VM_BIND(..., DECOMPRESS) in xe_vm_bind_ioctl.
> >
> > Key changes:
> > - Parse and record per-op intent (op->map.request_decompress) when the
> >    DECOMPRESS flag is present.
> > - Introduce xe_pat_index_get_comp_en() helper to check if a PAT index
> >    has compression enabled via the XE2_COMP_EN bit.
> > - Validate DECOMPRESS preconditions in the ioctl path:
> >    - Only valid for MAP ops.
> >    - The provided pat_index must select the device's "no-compression" P=
AT.
> >    - Only meaningful on devices with flat CCS and the required XE2+
> >      otherwise return -EOPNOTSUPP.
> >    - Use XE_IOCTL_DBG for uAPI sanity checks.
> > - Implement xe_bo_decompress():
> >    For VRAM BOs run xe_bo_move_notify(), reserve one fence slot,
> >    schedule xe_migrate_resolve(), and attach the returned fence
> >    with DMA_RESV_USAGE_KERNEL. Non-VRAM cases are silent no-ops.
> > - Wire scheduling into vma_lock_and_validate() so VM_BIND will schedule
> >    decompression when request_decompress is set.
> > - Handle fault-mode VMs by performing decompression synchronously
> during
> >    the bind process, ensuring that the resolve is completed before the =
bind
> >    finishes.
> >
> > This schedules an in-place GPU resolve (xe_migrate_resolve) for
> > decompression.
> >
> > v5: (Matt)
> >     - Correct the condition check of xe_pat_index_get_comp_en
> >
> > v4: (Matt)
> >     - Introduce xe_pat_index_get_comp_en(), which checks
> >       XE2_COMP_EN for the pat_index
> >     - .interruptible should be true, everything else false
> >
> > v3: (Matt)
> >     - s/xe_bo_schedule_decompress/xe_bo_decompress
> >     - skip the decrompress step if the BO isn't in VRAM
> >     - start/size not required in xe_bo_schedule_decompress
> >     - Use xe_bo_move_notify instead of xe_vm_invalidate_vma
> >       with respect to invalidation.
> >     - Nits
> >
> > v2:
> >     - Move decompression work out of vm_bind ioctl. (Matt)
> >     - Put that work in a small helper at the BO/migrate layer invoke it
> >       from vma_lock_and_validate which already runs under drm_exec.
> >     - Move lightweight checks to vm_bind_ioctl_check_args (Matthew
> > Auld)
> >
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Matthew Auld <matthew.auld@intel.com>
> > Acked-by: Michal Mrozek <michal.mrozek@intel.com>
> > Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
> > ---
> > Hi Matt,
> >
> > You're correct. The polarity of the xe_pat_index_get_comp_en check was
> > wrong. I misread it, sorry for the confusion.
> > Corrected it in this version.
> >
> > Thank you,
> > -Nitin
> >
> >
> >   drivers/gpu/drm/xe/xe_bo.c       | 52
> ++++++++++++++++++++++++++++++++
> >   drivers/gpu/drm/xe/xe_bo.h       |  2 ++
> >   drivers/gpu/drm/xe/xe_pat.c      |  6 ++++
> >   drivers/gpu/drm/xe/xe_pat.h      | 10 ++++++
> >   drivers/gpu/drm/xe/xe_vm.c       | 40 +++++++++++++++++-------
> >   drivers/gpu/drm/xe/xe_vm_types.h |  2 ++
> >   6 files changed, 101 insertions(+), 11 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > index b0bd31d14bb9..95331285c418 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > @@ -3330,6 +3330,58 @@ int xe_gem_mmap_offset_ioctl(struct
> drm_device *dev, void *data,
> >   	return 0;
> >   }
> >
> > +/**
> > + * xe_bo_decompress - schedule in-place decompress and install fence
> > + * @bo:   buffer object (caller should hold drm_exec reservations for
> VM+BO)
> > + * @vm:   VM containing the VMA range
> > + *
> > + * Schedules an in-place resolve via the migrate layer and installs
> > +the
> > + * returned dma_fence into the BO kernel reservation slot
> (DMA_RESV_USAGE_KERNEL).
> > + * In preempt fence mode, this operation interrupts hardware
> > +execution
> > + * which is expensive. Page fault mode is recommended for better
> performance.
>=20
> Maybe add a comment somewhere here that this only currently works on
> dgpu? In case someone tries to use this on igpu also, which below will si=
lently
> skip.
>=20
> > + *
> > + * Returns 0 on success, negative errno on error.
> > + */
> > +int xe_bo_decompress(struct xe_bo *bo, struct xe_vm *vm) {
> > +	struct xe_tile *tile =3D xe_device_get_root_tile(vm->xe);
>=20
> Look like we could extract this from the bo instead:
>=20
> xe =3D xe_bo_device(bo);
> xe_device_get_root_tile(xe);
>=20
> And we can then drop the vm arg?
>=20
> > +	struct dma_fence *decomp_fence =3D NULL;
> > +	int err =3D 0;
>=20
> Nit: Please put err at the end of the block. Reverse Christmas tree.
>=20
> > +	struct ttm_operation_ctx op_ctx =3D {
> > +		.interruptible =3D true,
> > +		.no_wait_gpu =3D false,
> > +		.gfp_retry_mayfail =3D false,
> > +	};
> > +
> > +	/* Silently skip decompression for non-VRAM buffers */
> > +	if (!bo->ttm.resource || !mem_type_is_vram(bo->ttm.resource-
> >mem_type))
> > +		return 0;
> > +
> > +	/* Notify before scheduling resolve */
> > +	err =3D xe_bo_move_notify(bo, &op_ctx);
> > +	if (err)
> > +		return err;
> > +
> > +	/* Reserve fence slot before scheduling */
> > +	err =3D dma_resv_reserve_fences(bo->ttm.base.resv, 1);
> > +	if (err)
> > +		return err;
> > +
> > +	/* Schedule the in-place decompression */
> > +	decomp_fence =3D xe_migrate_resolve(tile->migrate,
> > +					  bo,
> > +					  bo->ttm.resource);
> > +
> > +	if (IS_ERR(decomp_fence))
> > +		return PTR_ERR(decomp_fence);
> > +
> > +	/* Install kernel-usage fence */
> > +	dma_resv_add_fence(bo->ttm.base.resv, decomp_fence,
> DMA_RESV_USAGE_KERNEL);
> > +	dma_fence_put(decomp_fence);
> > +
> > +	return 0;
> > +}
> > +
> >   /**
> >    * xe_bo_lock() - Lock the buffer object's dma_resv object
> >    * @bo: The struct xe_bo whose lock is to be taken diff --git
> > a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h index
> > 911d5b90461a..346b50a1247c 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.h
> > +++ b/drivers/gpu/drm/xe/xe_bo.h
> > @@ -309,6 +309,8 @@ int xe_bo_dumb_create(struct drm_file *file_priv,
> >
> >   bool xe_bo_needs_ccs_pages(struct xe_bo *bo);
> >
> > +int xe_bo_decompress(struct xe_bo *bo, struct xe_vm *vm);
> > +
> >   static inline size_t xe_bo_ccs_pages_start(struct xe_bo *bo)
> >   {
> >   	return PAGE_ALIGN(xe_bo_size(bo));
> > diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
> > index 68171cceea18..1b4d5d3def0f 100644
> > --- a/drivers/gpu/drm/xe/xe_pat.c
> > +++ b/drivers/gpu/drm/xe/xe_pat.c
> > @@ -196,6 +196,12 @@ u16 xe_pat_index_get_coh_mode(struct xe_device
> *xe, u16 pat_index)
> >   	return xe->pat.table[pat_index].coh_mode;
> >   }
> >
> > +bool xe_pat_index_get_comp_en(struct xe_device *xe, u16 pat_index) {
> > +	WARN_ON(pat_index >=3D xe->pat.n_entries);
> > +	return !!(xe->pat.table[pat_index].value & XE2_COMP_EN); }
>=20
> Looks like there no now three in-flight series each implementing a helper=
 like
> this. But all slightly different. Also not sure which is going be be merg=
ed first. I
> personally prefer making this the same as coh_mode above, and have a
> comp_en field, but either works.
>=20
> https://patchwork.freedesktop.org/series/156658/
> https://patchwork.freedesktop.org/series/157036/
>=20
> Wondering if it would make sense to split this helper into a separate pat=
ch and
> merge that first, and then have all three series converge on that? Also
> hopefully prevents accidently merging multiple helpers for this, dependin=
g on
> the merge order?
>=20
> + Sanjay & Xin

I prefer to use the current code !!(value & XE2_COMP_EN) to get the compres=
sion information. Since it's compatible with the pre-xe2 also.
I have created the separate patch :  https://patchwork.freedesktop.org/seri=
es/157352/

>=20
> > +
> >   static void program_pat(struct xe_gt *gt, const struct xe_pat_table_e=
ntry
> table[],
> >   			int n_entries)
> >   {
> > diff --git a/drivers/gpu/drm/xe/xe_pat.h b/drivers/gpu/drm/xe/xe_pat.h
> > index 05dae03a5f54..b8559120989e 100644
> > --- a/drivers/gpu/drm/xe/xe_pat.h
> > +++ b/drivers/gpu/drm/xe/xe_pat.h
> > @@ -58,4 +58,14 @@ int xe_pat_dump(struct xe_gt *gt, struct drm_printer
> *p);
> >    */
> >   u16 xe_pat_index_get_coh_mode(struct xe_device *xe, u16 pat_index);
> >
> > +/**
> > + * xe_pat_index_get_comp_en - Extract the compression enable flag for
> > + * the given pat_index.
> > + * @xe: xe device
> > + * @pat_index: The pat_index to query
> > + *
> > + * Return: true if compression is enabled for this pat_index, false ot=
herwise.
> > + */
> > +bool xe_pat_index_get_comp_en(struct xe_device *xe, u16 pat_index);
> > +
> >   #endif
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index 8fb5cc6a69ec..a9927e665ad0 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -2302,6 +2302,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm,
> struct xe_vma_ops *vops,
> >   				op->map.vma_flags |=3D XE_VMA_DUMPABLE;
> >   			if (flags &
> DRM_XE_VM_BIND_FLAG_MADVISE_AUTORESET)
> >   				op->map.vma_flags |=3D
> XE_VMA_MADV_AUTORESET;
> > +			op->map.request_decompress =3D flags &
> > +DRM_XE_VM_BIND_FLAG_DECOMPRESS;
> >   			op->map.pat_index =3D pat_index;
> >   			op->map.invalidate_on_bind =3D
> >   				__xe_vm_needs_clear_scratch_pages(vm,
> flags); @@ -2838,7 +2839,7
> > @@ static void vm_bind_ioctl_ops_unwind(struct xe_vm *vm,
> >   }
> >
> >   static int vma_lock_and_validate(struct drm_exec *exec, struct xe_vma
> *vma,
> > -				 bool res_evict, bool validate)
> > +				 bool res_evict, bool validate, bool
> request_decompress)
> >   {
> >   	struct xe_bo *bo =3D xe_vma_bo(vma);
> >   	struct xe_vm *vm =3D xe_vma_vm(vma);
> > @@ -2851,6 +2852,12 @@ static int vma_lock_and_validate(struct
> drm_exec *exec, struct xe_vma *vma,
> >   			err =3D xe_bo_validate(bo, vm,
> >
> 	     !xe_vm_in_preempt_fence_mode(vm) &&
> >   					     res_evict, exec);
> > +
> > +		if (err)
> > +			return err;
> > +
> > +		if (request_decompress)
> > +			err =3D xe_bo_decompress(bo, vm);
> >   	}
> >
> >   	return err;
> > @@ -2938,7 +2945,8 @@ static int op_lock_and_prep(struct drm_exec
> *exec, struct xe_vm *vm,
> >   			err =3D vma_lock_and_validate(exec, op->map.vma,
> >   						    res_evict,
> >   						    !xe_vm_in_fault_mode(vm)
> ||
> > -						    op->map.immediate);
> > +						    op->map.immediate,
> > +						    op-
> >map.request_decompress);
> >   		break;
> >   	case DRM_GPUVA_OP_REMAP:
> >   		err =3D check_ufence(gpuva_to_vma(op->base.remap.unmap-
> >va));
> > @@ -2947,13 +2955,13 @@ static int op_lock_and_prep(struct drm_exec
> > *exec, struct xe_vm *vm,
> >
> >   		err =3D vma_lock_and_validate(exec,
> >   					    gpuva_to_vma(op-
> >base.remap.unmap->va),
> > -					    res_evict, false);
> > +					    res_evict, false, false);
> >   		if (!err && op->remap.prev)
> >   			err =3D vma_lock_and_validate(exec, op->remap.prev,
> > -						    res_evict, true);
> > +						    res_evict, true, false);
> >   		if (!err && op->remap.next)
> >   			err =3D vma_lock_and_validate(exec, op->remap.next,
> > -						    res_evict, true);
> > +						    res_evict, true, false);
> >   		break;
> >   	case DRM_GPUVA_OP_UNMAP:
> >   		err =3D check_ufence(gpuva_to_vma(op->base.unmap.va));
> > @@ -2962,7 +2970,7 @@ static int op_lock_and_prep(struct drm_exec
> > *exec, struct xe_vm *vm,
> >
> >   		err =3D vma_lock_and_validate(exec,
> >   					    gpuva_to_vma(op-
> >base.unmap.va),
> > -					    res_evict, false);
> > +					    res_evict, false, false);
> >   		break;
> >   	case DRM_GPUVA_OP_PREFETCH:
> >   	{
> > @@ -2977,7 +2985,7 @@ static int op_lock_and_prep(struct drm_exec
> > *exec, struct xe_vm *vm,
> >
> >   		err =3D vma_lock_and_validate(exec,
> >   					    gpuva_to_vma(op-
> >base.prefetch.va),
> > -					    res_evict, false);
> > +					    res_evict, false, false);
> >   		if (!err && !xe_vma_has_no_bo(vma))
> >   			err =3D xe_bo_migrate(xe_vma_bo(vma),
> >   					    region_to_mem_type[region], @@
> -3299,7 +3307,8 @@
> > ALLOW_ERROR_INJECTION(vm_bind_ioctl_ops_execute, ERRNO);
> >   	 DRM_XE_VM_BIND_FLAG_DUMPABLE | \
> >   	 DRM_XE_VM_BIND_FLAG_CHECK_PXP | \
> >   	 DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR | \
> > -	 DRM_XE_VM_BIND_FLAG_MADVISE_AUTORESET)
> > +	 DRM_XE_VM_BIND_FLAG_MADVISE_AUTORESET | \
> > +	 DRM_XE_VM_BIND_FLAG_DECOMPRESS)
> >
> >   #ifdef TEST_VM_OPS_ERROR
> >   #define SUPPORTED_FLAGS	(SUPPORTED_FLAGS_STUB |
> FORCE_OP_ERROR)
> > @@ -3357,6 +3366,7 @@ static int vm_bind_ioctl_check_args(struct
> xe_device *xe, struct xe_vm *vm,
> >   		bool is_null =3D flags & DRM_XE_VM_BIND_FLAG_NULL;
> >   		bool is_cpu_addr_mirror =3D flags &
> >   			DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR;
> > +		bool is_decompress =3D flags &
> DRM_XE_VM_BIND_FLAG_DECOMPRESS;
> >   		u16 pat_index =3D (*bind_ops)[i].pat_index;
> >   		u16 coh_mode;
> >
> > @@ -3391,7 +3401,9 @@ static int vm_bind_ioctl_check_args(struct
> xe_device *xe, struct xe_vm *vm,
> >   		    XE_IOCTL_DBG(xe, obj_offset && (is_null ||
> >   						    is_cpu_addr_mirror)) ||
> >   		    XE_IOCTL_DBG(xe, op !=3D DRM_XE_VM_BIND_OP_MAP &&
> > -				 (is_null || is_cpu_addr_mirror)) ||
> > +				 (is_decompress || is_null ||
> is_cpu_addr_mirror)) ||
> > +		    XE_IOCTL_DBG(xe, is_decompress &&
> > +				 xe_pat_index_get_comp_en(xe, pat_index))
> ||
> >   		    XE_IOCTL_DBG(xe, !obj &&
> >   				 op =3D=3D DRM_XE_VM_BIND_OP_MAP &&
> >   				 !is_null && !is_cpu_addr_mirror) || @@ -
> 3411,8 +3423,8 @@
> > static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm =
*vm,
> >   				 op =3D=3D DRM_XE_VM_BIND_OP_PREFETCH) ||
> >   		    XE_IOCTL_DBG(xe, prefetch_region &&
> >   				 op !=3D DRM_XE_VM_BIND_OP_PREFETCH) ||
> > -		    XE_IOCTL_DBG(xe,  (prefetch_region !=3D
> DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC &&
> > -				       !(BIT(prefetch_region) & xe-
> >info.mem_region_mask))) ||
> > +		    XE_IOCTL_DBG(xe, (prefetch_region !=3D
> DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC &&
> > +				      !(BIT(prefetch_region) & xe-
> >info.mem_region_mask))) ||
>=20
> Is this just fixing whitespace? If so, please consider splitting unrelate=
d
> styling/cosmetic fixes into a separate patch.
>=20
> Otherwise lgtm,
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
>=20
> >   		    XE_IOCTL_DBG(xe, obj &&
> >   				 op =3D=3D DRM_XE_VM_BIND_OP_UNMAP) ||
> >   		    XE_IOCTL_DBG(xe, (flags &
> > DRM_XE_VM_BIND_FLAG_MADVISE_AUTORESET) && @@ -3429,6
> +3441,12 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe, str=
uct
> xe_vm *vm,
> >   			err =3D -EINVAL;
> >   			goto free_bind_ops;
> >   		}
> > +
> > +		if (is_decompress &&
> (XE_IOCTL_DBG(xe, !xe_device_has_flat_ccs(xe)) ||
> > +				      XE_IOCTL_DBG(xe, GRAPHICS_VER(xe) <
> 20))) {
> > +			err =3D -EOPNOTSUPP;
> > +			goto free_bind_ops;
> > +		}
> >   	}
> >
> >   	return 0;
> > diff --git a/drivers/gpu/drm/xe/xe_vm_types.h
> > b/drivers/gpu/drm/xe/xe_vm_types.h
> > index ccd6cc090309..f4962ca0df09 100644
> > --- a/drivers/gpu/drm/xe/xe_vm_types.h
> > +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> > @@ -346,6 +346,8 @@ struct xe_vma_op_map {
> >   	bool immediate;
> >   	/** @read_only: Read only */
> >   	bool invalidate_on_bind;
> > +	/** @request_decompress: schedule decompression for GPU map */
> > +	bool request_decompress;
> >   	/** @pat_index: The pat index to use for this operation. */
> >   	u16 pat_index;
> >   };

