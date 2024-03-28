Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3ECDC54E64
	for <intel-xe@archiver.kernel.org>; Thu, 28 Mar 2024 12:11:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D5CB112405;
	Thu, 28 Mar 2024 12:11:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FfdBgMTj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98048112404
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Mar 2024 12:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711627894; x=1743163894;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=dfnvcfYs91frROJ5qrAMOLiO3+qqG5K6cZw4RESGoLU=;
 b=FfdBgMTjbUYxpKmT8s3MRDQa+sfO6MVY5Jfhml5Af0J2CYDBjb5vg9Ay
 cmcxn9N39qK3BWdrNsSbQ7wyo1+BOGYcjjlAJWmn1MML/Sp4zse+XuAfC
 U8oxRSINxOwrpEn5u3l+T8VXCjYTRKMbtrIknAqOE/E7LtmPs2Wxva5TA
 HFuHws5pSphdvnGt9n1Rbk3V6gdEN6JGKQOAQNJ6J0RsdCxMdzWeaExtU
 VZHsVlMPMtt/vWiVLydlrCWBOPhdo7Isu85QTS0dVUOQoWWnWMvqRSmsL
 zwmetys3d6lvOatNP5d0Sjxd73psSXyCGyhbV0jg5htugIx6StSorz+JJ w==;
X-CSE-ConnectionGUID: mwBom40aQ8yE/7+BvfC9AA==
X-CSE-MsgGUID: +NN6vxjjTtSIqewvg9H7uQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="9732471"
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; 
   d="scan'208";a="9732471"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 05:11:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; d="scan'208";a="54077680"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Mar 2024 05:11:34 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 28 Mar 2024 05:11:33 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 28 Mar 2024 05:11:33 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 28 Mar 2024 05:11:33 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 28 Mar 2024 05:11:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UN3SP1ISvo7SNwcv0KYX2uqBIlizlTLT9rrSgXFA4hkS42lTQ1yqdjTFYuR08YS8g775kFA1p4GspEW2CAAsLq3xWhZPafDeMp5fJzjsbpLi5oNb2Ozs61HQqrRkEHwVFBYXoOdGrTlqBT6ATCFc4/hB3Bm0EI0FcrIFD/G50TkQ8OvY3dZLXiqbziQ5NoSyKh5t19pG0xQ5GFv5Zw+tAItS7F7+GHbDIrDi3CHY94iB73hSbmzWISDQ3ZnUzx2qxJJ5RwtYv1B42IW//5j5Oee3cJtA0pA5RFbiy/E39elPsYv9b3s/hKYcQQUytnLn4nCYk2Y019jlA1XJxJ3sGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7ZcYVmGbgjZp2VJnnDR04pDaEiQ90N9blVXL7/JfXbg=;
 b=F89KjWBEoIwdUfoWF2S5A1Ftab7tXqME4DmL7WyOyDq0oGomiZ+RtGvjyvN24BWrUlq4HxYmgUX2eULiKgaVhmuv55oZQYIQOdw3EqsPsXBvMSbVbtt1mIAWzyEyF1wNiiGvSl5jIzsl+HvxkJNqFeWaRqCvmaM3yQhf3vtJOnd5I9pghMXHgHdBem12elmgnUhc2a5TZ3UIHnqflYeAfB31o7id3ZZ0Sf6J4XfctUBP+7M3gPd+sp49MH5osqMZ2648XFMBb9F++ajLc5O0imrL2mp6RNAGfA52PPwo6uIiVJx/4QEaAnt/7N4TjJXaHl9EawMi0n8AhM692ZmMNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by SN7PR11MB7976.namprd11.prod.outlook.com (2603:10b6:806:2ec::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Thu, 28 Mar
 2024 12:11:24 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::8664:8749:8357:f11a]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::8664:8749:8357:f11a%7]) with mapi id 15.20.7409.031; Thu, 28 Mar 2024
 12:11:24 +0000
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Dixit, 
 Ashutosh" <ashutosh.dixit@intel.com>, "Souza, Jose" <jose.souza@intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Subject: RE: [PATCH v4] drm/xe/xe_devcoredump: Check NULL before dereferencing
Thread-Topic: [PATCH v4] drm/xe/xe_devcoredump: Check NULL before dereferencing
Thread-Index: AQHafHwBC6yO7HNRTUOJL7OZiKsks7FItUSAgARjiKA=
Date: Thu, 28 Mar 2024 12:11:24 +0000
Message-ID: <MW4PR11MB705642DF95C26CC1EA1834A1B33B2@MW4PR11MB7056.namprd11.prod.outlook.com>
References: <20240322172447.3372167-1-himal.prasad.ghimiray@intel.com>
 <20240325170855.GX718896@mdroper-desk1.amr.corp.intel.com>
In-Reply-To: <20240325170855.GX718896@mdroper-desk1.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB7056:EE_|SN7PR11MB7976:EE_
x-ms-office365-filtering-correlation-id: b15db1fe-19dd-41a2-0065-08dc4f203028
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wlCCMPi7E+itjxk901rjgqaNi72Dtu24Z2bq5lTcT07wgRJZl9TuA1oEEBHP0wMzFBM/pzx8unRv0nOm7fkBP5VAbnYP+nIZF/mIO6eE5ztZXJ4AHpE8DVqFYa0srpg01xiLzuqS4WsLMe5Rh5xlIU2Tq31agDZeQtF/KmhLzCg8mPcJkkI8TEn4W1p/Y7IaR7/vpGzoTaq48ZO5xA+TWu2f1hYjmA89RXfjTDW618b1tk7MdTWvFsga/MMKSiczQd+4HQEnRMnhWYOjbvFBUU2rK+CpQ/YdDFDzGi5b36q8TD/mWoe25yCbTl2/SvnlzhDRjuORYzxNZ8A5lcze2qX8fc3oH8E5ex/VSWkCON5Xz9zabbK6AqCn5d3Los40PxmSNj577sYDl5ree9wiRwcTv5NnejEQF8UuJJKpZXjrLsnzjsEYLsV6dcp56G83yt27v7sDB7SjGhVx85Io7Ez/4dIYOy+0SRqlfrEL35Ed7xxBh29ajQuD8AQSvjwO9Iz9r6V655Rq7I9hUkY2G7IxnshrkE5L0cuP8fP/0aWIWCyWDdeC0mx2XYqzH+LxIEhBmRkhpLi0c51PJ6sIA+0fyagQz+rpPH6YRKhTQPsL3QoA07Etag4xFIc97p8QwMDm5HqQPDgmsDF09EBkDh4uEfAdKPRkAbSnFTtdNlspgE9yXZfObaQF7EcOOCLcYe9WYib8BPl9drSMmofnU4G1JEw1UAxk6fcrWw2Tntk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?ezlf6Bb/b89vadjr9JHzSu88LtUfHe8PhyUUpHZjJdw43Ghtv39IuRkWbg?=
 =?iso-8859-1?Q?XL4R7UUvkjRbZU7bG+OVC8FJK7KvtVBQ1MJf6s797mUS9iFEnJCXMgTKrQ?=
 =?iso-8859-1?Q?FToez+GBN/TxtS3CZNhmzi4H3ZLY7Rwm8vLyhTptKO4EbE0tPbgD20dBfo?=
 =?iso-8859-1?Q?oFGtRyyRzOYxyhZk9tSEwkCoMGEGb9BA5JBlCkF2gCLZN2DHCr4Eg32rgx?=
 =?iso-8859-1?Q?aELoHqocAC5uPujqquEKbr0xi8qdHjGOtbLVeQV+/nSXcAreo5NojYHaiI?=
 =?iso-8859-1?Q?SfizEyGwyhKCsaPsQiP2CM820vMtqHkB2+vxZ8myGtUACgWelXDbYwojvE?=
 =?iso-8859-1?Q?tXC09pERYYmzN+kIq+7YYjQdYc8uKBtYr/lcBI9/Zm3RkKYi5fZ/JWRoIZ?=
 =?iso-8859-1?Q?u37IGBQesQ4F3iziPU9UR5Y7Trbr17FSfawuTb3iV9LcKsmY/6BzKXFnFG?=
 =?iso-8859-1?Q?wI0sv5Oq/ApHoXaLhyGFoTYU9v2O712lIhZGHC4PzlhycCCtFjMLHADv59?=
 =?iso-8859-1?Q?UMACIF29DQXpVbGEUoS8caBR2I9XstnK6V/vPt30khPlM8ztb4jCBjagwY?=
 =?iso-8859-1?Q?EmVMFQYzKdLyUGY7msYIZjHh1kbCAzXfgA2Iky6m8iOZmKUkKcWRXjsY8Y?=
 =?iso-8859-1?Q?feLEvkFkb8hf6DL8ZT9xPXOO+yVIQZGr+tAmNP+HDYapZntKqf9dP6zh2O?=
 =?iso-8859-1?Q?0MXbeAC2r3UMKGS+k4AOLm7WKFbS/h06pm/BF+okwKM4ZY99AygrGZWW62?=
 =?iso-8859-1?Q?fuOfl6BQQK+nSvfMAz1XPJsSJAwfmokv9bHHXVFDmV/8btjFbM3VGCRtYz?=
 =?iso-8859-1?Q?3g+lZR4NNkgXxevkvXG+57q1ZAFQp2i1m0zuxzpwron0DjDJS717Cl0Ef7?=
 =?iso-8859-1?Q?bD7PrKDug1RiSJc8pwuqNpv6RKTVHjNi4Jwitfdteg/PNy4T+Tn/MCNg9/?=
 =?iso-8859-1?Q?f6MaoHybAEl2tOF46Hgxyhx4ic+fXm0eXhcX+qPz7OD4jU5rn7u3sP2i+G?=
 =?iso-8859-1?Q?a3XAOrSMp6v3YjNAym/av7ixEGBzljWjWYCVdVfCt4pjgh73q2IzxtzuW4?=
 =?iso-8859-1?Q?jIuZn6GbbKwvwOcAVD3JNAVV9q652d6sMYC8VzEsP4mhQ6uEV081VDhVKp?=
 =?iso-8859-1?Q?iB325dePehnQJ5QK+cn9Kb2je8/JcXsYI/RDB0pzJaUGMQwJTDRH8GlDl/?=
 =?iso-8859-1?Q?gYHugbjxI9WpoaT2boifBL7TdBjMp+Yy7G6EbsJJ6rTD2qmthv2TInwgrf?=
 =?iso-8859-1?Q?6cBRQvJP2binR183oUp25EADSkxQS8BjwHyxF8RSzzGqD0J+xq34HHbsXZ?=
 =?iso-8859-1?Q?2Ha6vO9ruYtrF5O15RdJgVy83wQ2X0pwyljHqjBwZ0NnUDvFQRygPY60s1?=
 =?iso-8859-1?Q?o2usTGvw/0NUyci4lTnr3JwbZvkztNYjVI48frRFj5PEo0BAZMkFobP73n?=
 =?iso-8859-1?Q?9ozbhrQ4vxerbrb4MxzGL+Tku3pA6DXHSYn7thgmoxBE8eAklUAr79nYkC?=
 =?iso-8859-1?Q?n/OT3dvQV3MvKUbXA5mDxCYLeDFvFw/yXBq48jhbyGTQmwqPLbipoKbudZ?=
 =?iso-8859-1?Q?M9nm3GdJhHU7R0EARxFiZgfTjpxgW9lw4AaPvcJUTa5MjaEGp3aX3WRQLc?=
 =?iso-8859-1?Q?0ObiDOgKL6LSkHRwZOdribCB8ViLTKTxNJ337q6ojftLQYin+WY992Lw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b15db1fe-19dd-41a2-0065-08dc4f203028
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2024 12:11:24.4791 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vbTgIjPdqgmDgnMxwECxrz+VrEaSCmQIMTk+AuE5weRoEdl5hECVgzU90t60E15xTLmWdZX88H2Uszp6C51DBhhXVBHstwPuN3s4s+BpaN0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7976
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
> From: Roper, Matthew D <matthew.d.roper@intel.com>
> Sent: 25 March 2024 22:39
> To: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Dixit, Ashutosh <ashutosh.dixit@intel=
.com>;
> Souza, Jose <jose.souza@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com=
>
> Subject: Re: [PATCH v4] drm/xe/xe_devcoredump: Check NULL before
> dereferencing
>=20
> On Fri, Mar 22, 2024 at 10:54:47PM +0530, Himal Prasad Ghimiray wrote:
> > Dereference 'coredump' to access 'xe_devcoredump_snapshot' only if
> > 'coredump' is not NULL,
>=20
> There wasn't actually any NULL dereference here, right?
> coredump_to_xe(coredump) is just container_of pointer math and doesn't
> dereference the pointer.  Likewise, &coredump->snapshot is also fine for =
NULL
> pointers.
>=20
> The change looks fine as a general cleanup / future-proofing, the title j=
ust seems
> misleading since it makes it sound like there was a bug being fixed.

Hi Matt,
Yes you are right. Will modify the commit message accordingly.

BR
Himal=20
>=20
>=20
> Matt
>=20
> >
> > v2
> > - Fix commit messages.
> >
> > v3
> > - Define variables before code.(Ashutosh/Jose)
> >
> > v4
> > - Drop return check for coredump_to_xe. (Jose/Rodrigo)
> >
> > Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> > Cc: Jos=E9 Roberto de Souza <jose.souza@intel.com>
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_devcoredump.c | 10 ++++++----
> >  1 file changed, 6 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c
> > b/drivers/gpu/drm/xe/xe_devcoredump.c
> > index 3a6263ecff01..a951043b2943 100644
> > --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> > +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> > @@ -77,17 +77,19 @@ static ssize_t xe_devcoredump_read(char *buffer,
> loff_t offset,
> >  				   size_t count, void *data, size_t datalen)  {
> >  	struct xe_devcoredump *coredump =3D data;
> > -	struct xe_device *xe =3D coredump_to_xe(coredump);
> > -	struct xe_devcoredump_snapshot *ss =3D &coredump->snapshot;
> > +	struct xe_device *xe;
> > +	struct xe_devcoredump_snapshot *ss;
> >  	struct drm_printer p;
> >  	struct drm_print_iterator iter;
> >  	struct timespec64 ts;
> >  	int i;
> >
> > -	/* Our device is gone already... */
> > -	if (!data || !coredump_to_xe(coredump))
> > +	if (!coredump)
> >  		return -ENODEV;
> >
> > +	xe =3D coredump_to_xe(coredump);
> > +	ss =3D &coredump->snapshot;
> > +
> >  	/* Ensure delayed work is captured before continuing */
> >  	flush_work(&ss->work);
> >
> > --
> > 2.25.1
> >
>=20
> --
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
