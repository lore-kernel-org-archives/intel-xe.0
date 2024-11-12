Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 321B9D42B88
	for <intel-xe@archiver.kernel.org>; Tue, 12 Nov 2024 14:38:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0160110E048;
	Tue, 12 Nov 2024 14:38:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fjnRoQ/+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36FAE10E048
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Nov 2024 14:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731422292; x=1762958292;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=IvvMEZxqZTjZ7njvv7/71+WEBsGcs+T0xqJBZLWO0y4=;
 b=fjnRoQ/+TwGoRUQsmVJrLjBxXGF/nD4GpfmOb4gQGUp7MbdjijsY5HLt
 WXeZmSp7P0eOWbnbNXqS3pSA9FylJjcRC3cW9Jp9EaLktAxwaPTr7NDD0
 UxT2AFhDJPse0dWF9GGSVfrBmun8GaF1p+tIk0HkUG74GYEb4QPls32eS
 9GQ7cfjTTGKcWHANYqH8gEt248nEK4TmBvnhG5L+l5GwhKkWjV6bKRgta
 AXq47RvheJEDvkAbzx8xXVGEfVca8qXeuyK2aKP00mRkEmEQRNbECgdIW
 Pqxu844qdnmDm5zYHrJPRXomc0LQp7RYnD/41tln5t7bUSEPdCsGLQgGX w==;
X-CSE-ConnectionGUID: J5yIHOfWR1e74dKZXDj/6A==
X-CSE-MsgGUID: BsjxVDe4T9CgOs0VsutE5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="31132658"
X-IronPort-AV: E=Sophos;i="6.12,148,1728975600"; d="scan'208";a="31132658"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 06:38:10 -0800
X-CSE-ConnectionGUID: MXomEPqxRYGMdCCHBG9N/g==
X-CSE-MsgGUID: Azryji02RLe9RH4RUo9sog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,148,1728975600"; d="scan'208";a="87080660"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Nov 2024 06:38:10 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 12 Nov 2024 06:38:09 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 12 Nov 2024 06:38:09 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.42) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 12 Nov 2024 06:38:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SEHCKJgUA843YCuA8NSXxmxKGNlSY8z6Y3YE2XBeN/EDrE6moB4DIOUS0wjXZ5vzX1AbbPvm6eZUwlCnwriYi15KQbTcchcNe19CcqZlJqK0eNjq8HkH6GBqtUu1YiiVsCy0CabixQwEISBMxKV0iC+ixHGYpiHr9CHiQa7N58Von0hz8DugqQhxUH0M9QUxilWfBuJY6YR2wppraJuC6sObIwpQsWgPWv89KdYNZnxaS8N/mFjG7lljBpNc0n6Hzk4CtSEw5tTXTpaiJvThohBgxfba0R4Wjuvo+FiQzQg1LaK0WECrt86ge7oSZs3ILKLG9AXgVy7R24pRPI0nOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/7nzg5MA5kY09dR43c0Uz0xQCbZ1hVAq9z4niUoUpcI=;
 b=i/30DUHGk6Sqk4bBWQgC751o3uvypuPmpCgHcVqOnpBEXDKvUECD4CT6FhUclGcxoTpBUUlcXcEVWiXJF4atSbqwET6xoS7eV77NNyZ47Q2qubsYjwHuavKqZXRE6pv4A3g5KwbWFhdkkIpQlerpO+IO6HhqBUCyjRgzdnok1YD/kqf7e/9KlTqkJOsciim3TXooV59nzr1iCtW+XWyX6+LC55gkn7kQJ2O8U5tYx02ez5uwjKG45alOQuRN4LHkKA12bsYEcXuQf/wc8NG9kbUTNSgI6YY2VPLcuGCRMeU/1kQTi+1iuN6Ke32Oi3CHQg6JXUkg7/3dXhCWvYtBzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by SJ0PR11MB5168.namprd11.prod.outlook.com (2603:10b6:a03:2dc::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Tue, 12 Nov
 2024 14:38:06 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83%7]) with mapi id 15.20.8137.027; Tue, 12 Nov 2024
 14:38:06 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 "david.e.box@linux.intel.com" <david.e.box@linux.intel.com>,
 "ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>,
 "hdegoede@redhat.com" <hdegoede@redhat.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "De Marchi, Lucas" <lucas.demarchi@intel.com>
Subject: RE: [PATCH 1/2] platform/x86/intel/pmt: allow user offset for PMT
 callbacks
Thread-Topic: [PATCH 1/2] platform/x86/intel/pmt: allow user offset for PMT
 callbacks
Thread-Index: AQHbMhuy67Q7d6WmsUWKDSWYr5FhFLKxxMIAgAH3WZA=
Date: Tue, 12 Nov 2024 14:38:06 +0000
Message-ID: <IA1PR11MB64184E52DA33ABC36329A2FDC1592@IA1PR11MB6418.namprd11.prod.outlook.com>
References: <20241108201955.2048085-1-michael.j.ruhl@intel.com>
 <ZzHBhsJ_J3ARhLu9@smile.fi.intel.com>
In-Reply-To: <ZzHBhsJ_J3ARhLu9@smile.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|SJ0PR11MB5168:EE_
x-ms-office365-filtering-correlation-id: 714d349d-d8ec-4101-0c40-08dd03279f32
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?Vgv22XMAkLX9aZwMCyK3je3Pgx841FER5sGLJouUg+XBTgplsk8lcBf4PHsY?=
 =?us-ascii?Q?/YSbFx9hrN+NpgtIjpvfq8zcEggQG0KvRbUpi8V2rhzpWHKmPofdGVrfTdGM?=
 =?us-ascii?Q?iG0UwQev1kYhlmn66SO2uSgN6b3wPrt2K9rI+6yYshtd5KdQdBWEPqQZlKg+?=
 =?us-ascii?Q?8WkK//gbyTss/9DgmE5IQ6DIIVN/AumdcHc0/9StgJC0uuoA6888FX56zFIR?=
 =?us-ascii?Q?zUYKw8NWpV8fF/Q7FQ9kxphnJcU8/B9c9f2YJIdVVGbB09l1PH3OOYmKCsAg?=
 =?us-ascii?Q?PEpF5sFzhYh4QZG/jE3zmOa+IsgOE+RdTHhNzUlKwFl2odeOv0PCuXHH+8+V?=
 =?us-ascii?Q?hVLosctFVrJmEfmx0+F9P9SPM5Fs/DSQMBw5Ubx5DndaGo1q0InhaMuv5FNK?=
 =?us-ascii?Q?m+6exRZIlU1sub9J7je7U5aY7rc9LespOmcXk8jGZgqi/SLwPPG83zbC/gxy?=
 =?us-ascii?Q?1K27Vt+IclXKjQZGzINQxSwcfUhb/Q1A9pxq6TWQMcy/GhtWUJxx1nQTCc1f?=
 =?us-ascii?Q?1VbWd/Ail8+gyB/MMKxinf2YRhcMrH+G+15vSYFkfpk15LF97Xu2f/g+/RvN?=
 =?us-ascii?Q?CFBMGkxHMByOjavYe9X7jjeGSP22Fa7Y74IvB+2JHqEkAT3Uqv/VptqRxv+7?=
 =?us-ascii?Q?rYIDUdGG8ZE7XV6Fy6ooNdQbEmZWkUQ/wWMK5lCWXHU38ZHIuVO6cxePSKrd?=
 =?us-ascii?Q?wsm7I1SN3+GSKnoERSJmRWMxXF9++Mb25Ah1xHlZo82mV/SqGucg+53YbmUD?=
 =?us-ascii?Q?zRiYpuoFFqhj/9bGX7wJ7Tdrp/m0Hkba1NRh3ShfMQtu7Qtb6bEZ1V6y6ZEu?=
 =?us-ascii?Q?MoJgHBPHvsm03an7qNQ7l4VVVLqaWbMxGVRffsMc06wuwLt93fZ+sw1q8hI0?=
 =?us-ascii?Q?HKwwZq6ZpGNEibvaHP+0TKWlZ6o7rQ9CWslQMwIbKxp/5VQIsc05OAN+9GH4?=
 =?us-ascii?Q?GvcxHHT+EgZP9npofy9TRBbPJ7LVUrfBdKQVt+uACVBpVOr0IEOINZIk8ghB?=
 =?us-ascii?Q?HAfqkC8LwlylufwPSG0N0oR4CkRlQ4g+BJZBh3hHQ/kN7H86XL8xLMSUBO+9?=
 =?us-ascii?Q?zPiSqxxS/S4TEWdkQrgxcQCqHEnl2UHCuUV6Owp7RPEz1lgmKnT5YjJJAQo1?=
 =?us-ascii?Q?/kON4HjL72RQbyF4nTA80U/mnZuH3XSOHkKxyTl1pIhCRuKgmbwEp3ZzJHvW?=
 =?us-ascii?Q?6bmKUb9pVih/H59DkCatsrLj8bM9ErMucIKT+C8ATHsIdxbckrwmimJM1dAJ?=
 =?us-ascii?Q?aM2T/TUc9ItOu9QciYbX6H2wutKb1wrSpIsAIUeLHlR+9PSFrIIJtt0Vd+yg?=
 =?us-ascii?Q?h75EXBSXSXKp37PGYXQcEu994U5kpa6tDRHDUeVzDzj3HBE/jUAd8sXGiykY?=
 =?us-ascii?Q?ZY1fyjA=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6418.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ekvedV/yM5pbkLJst1jqi86k3O2/ccs+7bAA0b5TF17AsLxhriE4RLZKnk0m?=
 =?us-ascii?Q?ITo8UmUEunpeEFUF8Jp86wcUbult2Iv5taOoZAefLKK7LAV2tqCIe0sL5f9C?=
 =?us-ascii?Q?2HYtZAx+faKL5Ox+RQlss9SqDiaWy5b72MJLltdQ1YEYDz/lW6khFtU/16Cn?=
 =?us-ascii?Q?+aO2abXZPLOGqmvV3v8q7jTT9PHHUPANqOcHL6HF+L6Blzmg4Q+/Fe+gVdq1?=
 =?us-ascii?Q?6Tz/YSMHNCACtr+aNt8I770uIRaEnLxqr6NbBewVRva94GsxOxCfcXLJNCoG?=
 =?us-ascii?Q?riYnzkU7zygpr8chZzeBi6uXT7C0IEP3VPw7u59owuG9E1X/hI9+2AQZQ6/4?=
 =?us-ascii?Q?uWvN9yPxB1YJ2lQkgiU6I21X1MuxAPDZqwDtR/HRwcXZ3WwdqXzHscCun0GC?=
 =?us-ascii?Q?guSUcF3Y8vpik0Q/2kxLv+SPPiPvzR6tNuRzOV2NBpDKAESvbT8TybMnSA/9?=
 =?us-ascii?Q?KpVMiO9eaPrQYimFgqKYpPmAY+ALq88Dg4S+nldCyoHDbSiKAAA0UEKGRJm5?=
 =?us-ascii?Q?BwRlyephiWNmg2k0NH4kCvN0YVD33fgIVLdqBVclGDWjx66jjfevEHiamjyE?=
 =?us-ascii?Q?HfCa4/AMm/3LagankRGH48WZmyG6w9RH8Ev67Lh7K6GYx8Xxg873xS0lsyFz?=
 =?us-ascii?Q?d6WRulSWPCn0SFqYhnFdhYqwGsjPL+82pLvPyqbAjPJ2AXtQYopreybLWcli?=
 =?us-ascii?Q?sgSnHj2Qt7nKtrQvW5eWJu4YNVnQKzyo8sfmokmN5jEUqkep0HM6aPQOZEd6?=
 =?us-ascii?Q?gSQfd8ezxYygSfcqUJS4Te5RGyWuc/USkl9k89jBRczCsi9aCvE9iXMOtZWn?=
 =?us-ascii?Q?2d73mw83aAc2alLqNHrVq4xNLDuEzyG9NLS7k13ElyS4wSHcvcE54xf738Wf?=
 =?us-ascii?Q?RKH8P1jteN34m3G5ajCEscYUBHUGcjd0JJO5ENIjmFOqEhwYOSxp+FVdh9Qk?=
 =?us-ascii?Q?2AESi9ltR1voZ8okFlRwe8SPPSUBK0W20t7iEgaYep+U5yO57Uod99iqMtTX?=
 =?us-ascii?Q?SgwrsEhdlj37aSLu9VC49zKPCEMckT8YfusM4yfBpuYTQROfLMLLNd1cSAOz?=
 =?us-ascii?Q?XGTbMYxvuoOh7mAdV+dtNi56Y13ayWWq+eWmo/SoHYk7yYflML/8wrksowI+?=
 =?us-ascii?Q?MQSGRY7sVdf6tqyDCCba9SUNd6MCcaSkbf6Ct+i+9Gu24RQS9k5n4Uc05d/6?=
 =?us-ascii?Q?ZfhNsy550ekawWzntQODnajzB4+M16hZ/MkhwNdnkNWC91So6XYjN8975I5w?=
 =?us-ascii?Q?8ZLcH0dTaM6rSqmlAsavHYBgIOHa5xcvq1i1KX6vTyeoi3P5h2EZRgwF0si8?=
 =?us-ascii?Q?xGpfX5oIt8dNe/kC4oAAqv5FDU4pSbYBKRBYvYdZGBJzTX82JvdfXPJa4rSr?=
 =?us-ascii?Q?pap7xEwzqFQv4yMnGXkDQ/EgfeKvE2seiSbSSiUlRB1Pz9pPm4GmnSYoKJKW?=
 =?us-ascii?Q?Y8K/NOCHv4HhNkOA+pVDV4cP5b7T5b1QbfCwpXbeUByngw0OkpGwTEjCrta6?=
 =?us-ascii?Q?e5FOLawda3/3JTeVaPib6NXNuXlKNQt/xAAbqkkT/uliy+dY8cnRVBJCdJTa?=
 =?us-ascii?Q?X2oD/Cvd+UhjzdU+3FWN7M5sWwLYmfddSThkOKZU?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 714d349d-d8ec-4101-0c40-08dd03279f32
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2024 14:38:06.5638 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W/ewOtZ4tVwB1L2VrawdbqkRs+XVy1o0wjA5UUz+JT5jUbs+3/JhAiw7zjnmtc/h6dTXt6boY7idR4Iw23xPnlKMiAg0zrf5V3WqK4sitrM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5168
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
> From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Sent: Monday, November 11, 2024 3:34 AM
> To: Ruhl, Michael J <michael.j.ruhl@intel.com>
> Cc: intel-xe@lists.freedesktop.org; platform-driver-x86@vger.kernel.org;
> david.e.box@linux.intel.com; ilpo.jarvinen@linux.intel.com;
> hdegoede@redhat.com; Vivi, Rodrigo <rodrigo.vivi@intel.com>; De Marchi,
> Lucas <lucas.demarchi@intel.com>
> Subject: Re: [PATCH 1/2] platform/x86/intel/pmt: allow user offset for PM=
T
> callbacks
>=20
> On Fri, Nov 08, 2024 at 03:19:53PM -0500, Michael J. Ruhl wrote:
> > Usage of the telem sysfs file allows for partial reads at an offset.
> >
> > The current callback method returns the buffer starting from offset 0
> > only.
> >
> > Include the requested offset in the callback.
> > Update the necsessary address calculations with the offset.
>=20
> ...
>=20
> > -	memcpy_fromio(buf, addr, count);
> > +	memcpy_fromio(buf, addr + off, count);

Hi Andy,

> This will give an unaligned IO access in some cases. Is it a problem?

That is a good question.

I moved this value from the caller to this location.

So essentially it is "unchanged" from the current usage.  Does that answer
the question?

M
=20
> --
> With Best Regards,
> Andy Shevchenko
>=20

