Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E35BF99C63
	for <intel-xe@archiver.kernel.org>; Fri, 17 Apr 2026 21:25:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DED110EAB3;
	Fri, 17 Apr 2026 21:25:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M3rwocda";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A61C910EAB3
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Apr 2026 21:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776461142; x=1807997142;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pNUIchehJCLwSgUFMZ38noB3MNLFQcPXo/d0fbhI5OQ=;
 b=M3rwocdaLjQb6bDYZTwfIEM51Txp3/rsXm8qt2RRvfhkTZn4fiNVgq5x
 a80Iwzf2Mi3On4rnLW+p8zPrZdEQdd4I5BudeEDYghGC7QXDyo7iE8mfn
 oLaZaWE2FuEspq78sLfWRjZisqYBd1vdFI6ZEa/3w42ARXq5P9kTJyqdK
 u31YT6ydvwPXVk08rCP4ViShb/l/tdCh58iSf4d0eDXN4oVrN+cSKmxUa
 GING0TkIgRjpGsvfHEua3/qibZ8vFaN9jAwzLhCCSDT94ikhkNbCXKdCG
 7c0zMa7dWZZwZbED3Z3mhvtqm3c8PjOlHGX/nu5FPuZepAs+ynmAY1+zN Q==;
X-CSE-ConnectionGUID: 8SUg/DHtRAW9cCTJVQ35Uw==
X-CSE-MsgGUID: YjYWack+R8KRoXJFgtb6CQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="102943616"
X-IronPort-AV: E=Sophos;i="6.23,185,1770624000"; d="scan'208";a="102943616"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2026 14:25:41 -0700
X-CSE-ConnectionGUID: I6PyCq3bQRev7sTKZUOZcA==
X-CSE-MsgGUID: pAtJfiXoRWSHYtYM7VAs3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,185,1770624000"; d="scan'208";a="261535290"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2026 14:25:41 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 17 Apr 2026 14:25:40 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 17 Apr 2026 14:25:40 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.28) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 17 Apr 2026 14:25:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AhTKSjRpztVmvhdfs4U0M223zyJytV72mPfVAtpJ07ByNijtI1n89M/gZ+IOeUBWInih22cwTM/NCgXPB1LEzlEMYVdqWFYwcmQJeppgBVzulYhC60NqmyYC7LoQ5R0aGXvAcEPiK0gpuvxaKwAKDUuaANpA+HXaUoYy/5tPclwXAI00iUKzN0wbdyVmpeiQAT0XGD4uVHw+br+hAL7j8dw1IuQc1vMBqm21r0fQ6XT5Es+sSQqifJGs2lteQPocUIH8NpWVfG/JDKppKwOPaMPOvxDLT9H56+NMYayqUCMLoSWx4yxrMKFpm/N0hnr+uI3O8LoOUafF0LGfgyisJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S1AqoiJ2GmOgS5Qcq20rckTX2pUal+yqozRllLJB22Y=;
 b=S/DihUIp8GgMO3rTBiiCNxHiKC1cyXWZAs/af3LeuR0zxrcp8DlVt/1b1WUhvmNGUcW3/vIyvAjF6nHENz3Ah9awHlWq5bPGCqBMsZjqKeGUWKHXYyV1b+o4wJjohGfAHCQS+QsCHDLWasVxMcXEpSs9XpwZmZkoCkncnd9vB0ixGrplKksxLIkl8QuAQ7hdFzwUowjvK3lSpqfGOHalsswkp9bZdlAHnqCs4arlzPLS66OSA/ExqE2I9zBET7P9HrhZTppRB57l0F47WkR5HQrn6kL54z3AM3BIKKntXCxMpuhTXXCIxKp7/LrixePXK7ZCLLFpSMcReK1lYpnj/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ2PR11MB7619.namprd11.prod.outlook.com (2603:10b6:a03:4d1::6)
 by LV2PR11MB5998.namprd11.prod.outlook.com (2603:10b6:408:17e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Fri, 17 Apr
 2026 21:25:28 +0000
Received: from SJ2PR11MB7619.namprd11.prod.outlook.com
 ([fe80::1768:f463:81b5:b480]) by SJ2PR11MB7619.namprd11.prod.outlook.com
 ([fe80::1768:f463:81b5:b480%7]) with mapi id 15.20.9818.023; Fri, 17 Apr 2026
 21:25:28 +0000
From: "Jadav, Raag" <raag.jadav@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>, "Tauro, Riana"
 <riana.tauro@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Gupta, 
 Anshuman" <anshuman.gupta@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "aravind.iddamsetty@linux.intel.com"
 <aravind.iddamsetty@linux.intel.com>, "Nilawar, Badal"
 <badal.nilawar@intel.com>, "Koppuravuri, Ravi Kishore"
 <ravi.kishore.koppuravuri@intel.com>, "Koujalagi, Mallesh"
 <mallesh.koujalagi@intel.com>, "Purkait, Soham" <soham.purkait@intel.com>
Subject: RE: [PATCH v4 06/13] drm/xe/xe_ras: Add basic structures and commands
 for uncorrectable errors
Thread-Topic: [PATCH v4 06/13] drm/xe/xe_ras: Add basic structures and
 commands for uncorrectable errors
Thread-Index: AQHczkPTG7NzrrqYNkGY0/e2TNLrpLXjhZcAgAA+hxA=
Date: Fri, 17 Apr 2026 21:25:28 +0000
Message-ID: <SJ2PR11MB76194CE5B11F52874CA88CAB8C202@SJ2PR11MB7619.namprd11.prod.outlook.com>
References: <20260417085812.4013309-15-riana.tauro@intel.com>
 <20260417085812.4013309-21-riana.tauro@intel.com>
 <20260417173854.GE7476@mdroper-desk1.amr.corp.intel.com>
In-Reply-To: <20260417173854.GE7476@mdroper-desk1.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR11MB7619:EE_|LV2PR11MB5998:EE_
x-ms-office365-filtering-correlation-id: e462afa7-211a-4b03-4e73-08de9cc7d901
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info: 2C2DxBVoHtH0IAY/2VLJsOb/WvLKxkUObbpiqbwaibErWkjc4tmvdO1HAKq3nxx/Onkm3pU7VjrDz3HliOYrPKTrbQzxQJIWllnWSc2202WSZQzX335KJCAdyCc+3ZQwUynZW6SGbFXz/KXeKZYapsPJxCnyQXCs6xpEt/9eZ/6fj2flQXMQTzDcyCeHpgqaR0nCpjWx3EJtBcSqoLmg/adqGPLJAEp1U50h9x4iWCAkJKejNWatNCEw2w2P6lmLTMbLk3K4U3ywvqW5u93FmiavqvOqBz34jlIzPQZ4DMuVU5ivCiWxZYu9MYCnQcxHdnhLKYLHKTVreludvY6GiZnQ4m7/DA/0Yc35TZEG0uG6yRSX2xqp0Xrb3qkeWI84KPx6n8TYkB+7QG9UfQB9JIs9HGdEcZPLtzfE4Zcs6rHNR83NjPnin88QASAAsKFFWWus3P1t8bpx63TTeO0pZyFzOoLPINgUatT1TeGYcv4JdnogKA/HfxtHIVzEQXRWOeBxLLbrVeOQ3UV/aOowM0D9mdgvIaYgRBcBgMwfia9rpuOkxd1zk03JlKnFkv4Ovc7Ww/SZUvYE4uyDF98BIjegUfDU965q76GPNoFP8Z+pY2QHiXHYvIjUvMRD8RAbed/CAKj6IPi2IfK6wwhnfvdMPIjKQ8fGHvfBukwh0yZt1/Gnf6KL7GSB0OcB/BTaNNNTpyLgjr7TsXPOyGzZH1JkO3LBNChoBclF6ftYxTbghfgxWj65hgmyNZX6D+ER5Hqk079yA88F3QTBm4f72OTMooFyjv6OUDtWUzfrRTg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR11MB7619.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ykT0HqAnVKIy77an1SyIlH5ZJAjg6Vy/BB+AqoIQpG1lP9Zd97rgymh5MdHF?=
 =?us-ascii?Q?MRLY9sn3thz2S8cl2Lrha47W15rFRvlKCryejEAR7vZayyPkl59VmStvmJzI?=
 =?us-ascii?Q?Q11AHVxMel24eKxhcfQ5NgHawfSlTotEFqvs3IuaM2nQaLKIVVQ+kWlyFIOC?=
 =?us-ascii?Q?OcqColYCaZrcwr+JGE2J9skwwUd6rYPrBPz/29tmzbFMy0tqrTXyioVWXLiu?=
 =?us-ascii?Q?/Yp5jMr9Mw67qkWObrvZYDmisu+P1XdGUAxSgmZmaVTdgALqP2XcSTvknI0G?=
 =?us-ascii?Q?1TaKSAJCZGOY2Yx5uWvKdCjMO8h3wNGpoG1v1QV6cm+b0VfUhbtf4zHR/y+8?=
 =?us-ascii?Q?UZ0OAisrWmCzG9yzEXPSUZ3u5I1T7ZPgkH2HHPTIpAs8jjdJ6y2Rsp610voE?=
 =?us-ascii?Q?ptjth7Daw5bn+aeRobPOrdcf+gZtI69hJh5lUhUwOf3qBPtHOsgV11tjARl+?=
 =?us-ascii?Q?m/V1A1UeKw8s9QfiRT9vKebnA1yS6XgLHltVTr0LgW3gC6MNkNeVTifz1dUn?=
 =?us-ascii?Q?q82suHQgPqd4GaM9I9KmGhfn3Sm3HgApK4Ip1/cXMKAvNVEbEtnvdufwYkli?=
 =?us-ascii?Q?3ytIcb8lP6Q0u8sNHsNtgSgmcG6P8897X0AC1bxsBCQIFnhDbrbEf2GoCeTw?=
 =?us-ascii?Q?AJTyNFr94haQMaVMv5B3oQK8ibGkh6NfscZPNYJvgZWHT4dBjEFK/9bV8KhI?=
 =?us-ascii?Q?oP0qNgUSvyPvUoZHNP4E7CIGyl4F+Ozns/ZiDNNSYlq6OO1P61/b0F9LqKzu?=
 =?us-ascii?Q?jGtHZ2f5T0wlTht6VAjse683GQRJ4VzKrzsw+WEyoc0K1e5fVtDyMaq5Kpvp?=
 =?us-ascii?Q?7q/oZo6LZfSW/Jo2vomHQ4RRYnWsjW8ABUyScm0PvI8pyve2yb/lzMo2xaJq?=
 =?us-ascii?Q?7xAm2jtPiZ6ia7hj6m5BilUx4mHFhfQlNWMDKP1S1RhWjooR+/8rwhpMhfsm?=
 =?us-ascii?Q?gmbRpazD82L5hfSYYtZvemszNI5t1JZSrfM6Njeieg0/5O/T83kYcCLp5XNo?=
 =?us-ascii?Q?bjIjTlBQlCfg7fV4vdIVu/9g4giD9jhamrzewTSNWkPVQ0WGJ5zuQRUDl/xU?=
 =?us-ascii?Q?RuqIlipQ6vcmVLWlfUAElxLEQL9t9a/Jzc53aLiFF4geGQNA8RLmlFJHuVhf?=
 =?us-ascii?Q?k7H1+OWVjVcgKXMXQW0qHMaQtp/l7yydC+Zuy+wpCPAcpwwMYh4y2fBR7ki7?=
 =?us-ascii?Q?+ivGDXZbIoq+2uVGR39Go78sl1RpgevWB0BOch+WKXsC38pCQFB1vOJ1fRDj?=
 =?us-ascii?Q?h+gu8YIqzLH5rzC7u6fusGWwX6ZlmH02woQD68iYl2N9MLkUD28bIZrk3Ui3?=
 =?us-ascii?Q?hMlhSwoHCWwm1+uocoJLNewRzAclf7BDm2AFgkFe111l35Uly9BPu463VGi2?=
 =?us-ascii?Q?3KqiVKnBOEOnCZp4D/qFqUeweQkoOy+O2P/ISOsN79OUIYUbjRzUEs2kAGvN?=
 =?us-ascii?Q?6TWzBfuvO8TBtrVdwZelPs/EdrVyNuCIJzGrcqL00HXpACefzB3j6PsMl/b8?=
 =?us-ascii?Q?H4rqtWtFM5J1Mb0pO3b7rx0jugBwZrlxlSxG0/h1ZwIDfy7sqQa5Ir/grQAM?=
 =?us-ascii?Q?JUYwJj6uqK3f7xquRGkY2t8M2iS8GN0/e/x8bD9DQQxO8BRFLppzNApV3LE1?=
 =?us-ascii?Q?RavntIXLJ6J+Znqh04u+V7jZzgew6zq6/UeckW7FVY+akrbrwPjCMoxXabPR?=
 =?us-ascii?Q?oAXHmPi4+gHCkopAl2JcnS9OKUjKkH8i3LJDqB8bo2GVFv/8?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: T/okU/f+M0KGEorM7+HqRNF1Tbzh2PYVXK+DYYB+XK69czBLiKwZlqFIOOXjG4zdH4MD8J6rtLs+4+6XawrdGbt1krHrrHL50Ux+X+70JTpgVFW6miw71oF/zk2/DKPJv9fUV/yklFgb4lGxVmv8mzrbzGYiCoVHn3DvE3ofKplCgkobxyEa02G9sx2lsdEAUILK9V+oi9lXGlEQyvL6YyIUsNbTwbxlkBV7u54/LxuUWOkNn+qevS3/grVSoOSOLc5e34t4torg4oQhZJGKcpcDlvLVwrqfiRR+kOZ53XLVU5md2T3ZawpEPrHZuUYY28OpU3dPbbGHbiideDsx9g==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7619.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e462afa7-211a-4b03-4e73-08de9cc7d901
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Apr 2026 21:25:28.5931 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: d3H1SfzOM0wYHKDR9jPEyxDYch/LbvoV7GpaLgt1D9jJKqFIHp2kLr7ebvNfTcm6cMuj3pd8EWtvu31QFkw7KQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB5998
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
> On Fri, Apr 17, 2026 at 02:28:18PM +0530, Riana Tauro wrote:
> > Add the commands and common structures for the get_soc_error
> > sysctrl command.

...

> > +/* Severity classification of detected errors */
> > +enum xe_ras_severity {
> > +	XE_RAS_SEVERITY_NOT_SUPPORTED =3D 0,
> > +	XE_RAS_SEVERITY_CORRECTABLE,
> > +	XE_RAS_SEVERITY_UNCORRECTABLE,
> > +	XE_RAS_SEVERITY_INFORMATIONAL,
> > +	XE_RAS_SEVERITY_MAX
> > +};
>=20
> Drive-by comment:  I notice that there's a fair amount of common changes
> between this uncorrectable series and Raag's correctable series, e.g.,
> https://lore.kernel.org/all/20260410102744.427150-4-raag.jadav@intel.com/
> However it seems that there have been some minor style differences
> between the two that would be good to reconcile (e.g., this series
> writes out the full XE_RAS_SEVERITY_*, XE_RAS_COMPONENT_*, etc.
> whereas
> Raag's series uses slightly shorter XE_RAS_SEV_*, XE_RAS_COMP_*, etc.
> names).  Similar differences exist on some of the functions like
> severity_to_string (taking both the device and the severity) here vs
> sev_to_string (taking only the serverity) in the other series.
>=20
> We should probably figure out which form we actually want to go with so
> that we don't have last-minute conflicts as we start applying these
> series.

The one's in my series are consistent with uapi, but I'm okay with
either one. My only concern is that we don't invent overly long names
that warrant ugly wrapping while using them in the code.

Raag

