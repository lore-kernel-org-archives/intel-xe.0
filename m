Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73571C61DCB
	for <intel-xe@archiver.kernel.org>; Fri, 28 Aug 2026 17:29:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0902F10E3FC;
	Fri, 28 Aug 2026 17:29:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kF2VcHhs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 715D010E4BF
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Aug 2026 17:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787938185; x=1819474185;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=MxkPSCGZOtLF+fk+kPqfUfedn7++4SWVk66+uSDGBbA=;
 b=kF2VcHhs3SF8G8PjQ0O01s3ZHmzdjpEEx9WwoRui73jqsPl/Pey3qHN3
 Yh/3DQ+F7e7Bb4elZ73FFYX4gH4gMRyzPmyBJBmTe8+w6buz/7FpjENL7
 4qbMZbIqUOgQGEhqpOhqdwtUE2kyAP589BuzrYenr8pJ6tx/dR9I2oMEV
 /QsaZYJ0FPbVbam7KxWUJooDFJ/Nxi71GkPThQLvPFxgvPMqxuHxmE8pv
 67rqN7ZFwl+DjVE1SaeDorMkfCeRnqEauIoJ/v7ls9/+TKmlJGh8TBcId
 STY7bUXxU+qUUHCRtLJZBzTQTJ3kdwQQ8nbbjD09db5vrTHShW0Z3XYcn A==;
X-CSE-ConnectionGUID: Gk3z5ia3RhaS9Z9F5ct0jQ==
X-CSE-MsgGUID: aLJ0nfSFS2OxEwP9W+fpMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11889"; a="75997804"
X-IronPort-AV: E=Sophos;i="6.25,249,1779174000"; d="scan'208";a="75997804"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2026 10:29:43 -0700
X-CSE-ConnectionGUID: DQIz7F5wRDa80paoNohUJg==
X-CSE-MsgGUID: MEXsj729Q1GLFQ17w84Pmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,249,1779174000"; d="scan'208";a="263933221"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2026 10:29:43 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 28 Aug 2026 10:29:42 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 28 Aug 2026 10:29:42 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.40) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 28 Aug 2026 10:29:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dNNroL5iv/mmJKZIHftA/TtMr/7W5KB4CkFxiUEUu7JAj2eHmLKP5KjwmyK42YcDJZkjBK7iDDQ5081dACtiobURUI0OokE4txH02BPz56Vmzub4MFemtjJQz4pOqEBjS8PbzNlwgo2Cnkxnfkl+k+lOeqgQcscZi8IadK/U/4gIJuaVv+wdeL0nDgDN6JCSMD8iQSCc/MdAa0qcf6dpTlfQkCflWjq0qNffKsfcgrYohKfoc5g7VcX+AK1RcjeIecpgv99TjFqEnCNc+0pVvEA80TLmdpU9Be2+jMtHbD8GnEvxDcZkGbwvQyy7Hgo45HmloQJx/U8W+iyxls+N2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MxkPSCGZOtLF+fk+kPqfUfedn7++4SWVk66+uSDGBbA=;
 b=S4APAxztjKa9N0QepMjPXbJLX+MFIFMTBMDzhjGOXoRLZSNhW6MG4XhUusq9uq9i8d3hC2QgPzDU3jtp5cu5py+/wA+0u0/s1X6iEOtWscGDg8sfHh8FcNK9cZXcc4+Zjm27hiExW4nWgESSxH/Mn2G67uSjyFDNVR+Ujn54r0EO05wfe2AZN5rKh0HRWhoyrS4XOggLAcmSuOhsseHVickJc8piu5fjfc/bJ3MntYTBPBVOt0z47S1VCLUIAUReqZ6nzIQq+JVNl7Yc/X0KPbFKsicGtCgGBLkpt8SwEc6HOHR3bV0h4G7q1B9MT14PEKoQ6ctVIC3ki8qbiy3VWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8718.namprd11.prod.outlook.com (2603:10b6:8:1b9::20)
 by PH8PR11MB9724.namprd11.prod.outlook.com (2603:10b6:510:3a3::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Fri, 28 Aug
 2026 17:29:40 +0000
Received: from DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c]) by DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c%4]) with mapi id 15.21.0360.008; Fri, 28 Aug 2026
 17:29:40 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: Andi Shyti <andi.shyti@kernel.org>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "Wajdeczko, Michal" <michal.wajdeczko@intel.com>,
 "Yadav, Arvind" <arvind.yadav@intel.com>
Subject: RE: [PATCH V18 03/14] drm/xe: Extend BO purge to handle vram pages as
 well
Thread-Topic: [PATCH V18 03/14] drm/xe: Extend BO purge to handle vram pages
 as well
Thread-Index: AQHdNWIa8lHAO7PzpUyTi9OWg/AoNraw7aCAgAB+jxCAAI0KgIAA9vpwgAAlr4CAAKS48A==
Date: Fri, 28 Aug 2026 17:29:39 +0000
Message-ID: <DS0PR11MB8718F86110356F2B6B65D88381AC2@DS0PR11MB8718.namprd11.prod.outlook.com>
References: <20260826135136.204044-16-tejas.upadhyay@intel.com>
 <20260826135136.204044-19-tejas.upadhyay@intel.com>
 <ao9rmRZlZMf_kqSV@zenone.zhora.eu>
 <DS0PR11MB8718159BBB829F3009BA9FB281AD2@DS0PR11MB8718.namprd11.prod.outlook.com>
 <apBLqyLbxFisF5xi@zenone.zhora.eu>
 <DS0PR11MB871878E0D13455C28397749A81AC2@DS0PR11MB8718.namprd11.prod.outlook.com>
 <apE6MxxCAuChbNQK@zenone.zhora.eu>
In-Reply-To: <apE6MxxCAuChbNQK@zenone.zhora.eu>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB8718:EE_|PH8PR11MB9724:EE_
x-ms-office365-filtering-correlation-id: 24712c8f-570f-4a79-1b8b-08df0529f0bb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|366016|376014|38070700021|4143699003|10067099003|56012099006|18002099003|22082099003|11063799006;
x-microsoft-antispam-message-info: pYkspH81Kp8O+QpBU5MTo/PLrR/jvYocx75zpmjShBm1lGIVq/w40fyHvWQ9SUhJkfdCyAhx9H0tvArgVAYzbLhxtnM+h6XpAdv7YeO2UohCzCo/o+iB2MIIihP+2yKNmErwMRSVH68FksZVfz8fduJAVUoY/bssq6f+KFIMiU5s0HzPq5WPI3TxhQIMobxWZUHtXxKHQiC4bKHKleulIbYfb0kevDqXlQFHuk7he5S5x/u3ynua2SRjpTkK8Nw8nOBfcXYpdlesa+NVRKrNcT1eP4OB4EwI9T4wO5tOYGSFfsoZm1HdC+2SgFO/tYGyglrvNpD9behbV+KqK7++M+l7kuACG/SfWWBP4NegenRAN7872DhJTL20MwYsjSiw3Mw31iOKnXymkMzr9kXa1f9yqjHIdAq6lzHrzJaGhAyXahvgHUa2EgzuwF7MNDkGBo7fb07D0kSdoq7Nuvr4NhlpuooKVBj85XyDlYNDDyGiIIjzeSYBTh0U/+oEGcsXJhcH2Cto5NY+wgowL2zH/m3Ba4rTjf/CdhLQelyVD2PoyTLMKwIWy2f4jyGPKOkvYmIuuxcU56R9VMW2CP+VjQ5E+OMVXON6X436AY8bKldyFRKSX7EkAyJkJNobk6EGwc01wQrRPmdu335Qd+kGA5HU78ZiqVRvKDLun+0xcI2t7sQWZqWDhxOY5D3vLjM++e68DQUlA58tMtuyKl27eF6mSx0Yb6MRpCypgReRXDA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8718.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(38070700021)(4143699003)(10067099003)(56012099006)(18002099003)(22082099003)(11063799006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?xwfTch64zzZcH0vQsR5XGdIOXBowhVdwggfBxhBsLENv9QcT0oQl3YSzjjOS?=
 =?us-ascii?Q?nnHfjTZJm1JO3JF/A71l8AZYhyC5lRAhaNbhYL0N5AGK6sKOTyrV+u01yKeF?=
 =?us-ascii?Q?8YP9gEw8Ayw6I/yQcHPEvHrfx8SFPS5O13imGU6oiYv8rOxB/A8YVn1WKUE4?=
 =?us-ascii?Q?rFzOFeTI4ADsnE9xC+7Daync+1YaaxwAv662V/CtBhwz+HAlJsLjQ/TiJtWO?=
 =?us-ascii?Q?GFghYz0oQwI0sT06SSDjBiUJsanTosSKee6wlumPjASb2QBzFqbIRJHy07eY?=
 =?us-ascii?Q?SZPgQ9jl/c9/eOU9WsCkKOY+HVPXuOI56x3ddYfF/CF7UcsXLb7+1JZjIm3a?=
 =?us-ascii?Q?yh0JU9lMxq0Xk2NImCDNpXdLsYLN6z0U61hWW1gpUNBVdk+FqzVPzohULgd1?=
 =?us-ascii?Q?iMz6gTecvPtKrLY4rflS+XnY2Kojkr19xKp2Jg/WuWAwUPTQPKuPjFHg79ta?=
 =?us-ascii?Q?9dUfQVHsSSvbDDkXuD++EiMYjVEgbVZdIa9TgSB6aEGFqP/kd4B2nyWuobT5?=
 =?us-ascii?Q?2NKcsX73AkXclG7tAV6sONY752G+MLxZYKZmUEz5cEL5NYIfDS3fjB/CW9IV?=
 =?us-ascii?Q?xatKzWGDRPIgzUwCTCpDA8OZl/qLKLXunK5kAsnDMe7qmZiabfVNc9D7Wj6R?=
 =?us-ascii?Q?7CbWPYnXCKDRNo7l3H7IYGDbw4VEOvzKclxWRepRos8vIIimiW3OJNqcqWT+?=
 =?us-ascii?Q?tvQVZmr/t7EEzNam8gqeftCSaitB+XIwmqbRquqz613QPOmS6uI86Rf2cHvM?=
 =?us-ascii?Q?z6ECGl9gGiNt1yxEULgAIOP5hFHZqaeAmZbf3DjTwwROKCmh1iYydZjTYOyy?=
 =?us-ascii?Q?IM05cH81TS057qXgUQtP5VVpWRnMJMCgokU6ySXm1t4/5lUAReooJMiNPvmb?=
 =?us-ascii?Q?GmjuZvNz3YY+O1u0jv5vorDHWc5GsF4I9/eF6CwmYWRyOjMRAY6o9ub78oKi?=
 =?us-ascii?Q?8xJLedekBfWvRgkKG4QrPIi6YnSqmaP7KY2+XLfZV5vkbvqef5SR6gnjaV24?=
 =?us-ascii?Q?vvqJ4RsBwIVT+0IRf1RJIxS+E+QB4vJxI6Jb0EkByT7XYr6F1N5pYgkalEnk?=
 =?us-ascii?Q?MeWBoDthHahgqlGw+g8BXf0lFuE8kTl8/9Egk/qXuRVmdjJYA3+1/LauBZqd?=
 =?us-ascii?Q?Bg4KgRm+IBHqmXgYpo5uEL35LwB3/U6S2jwrLgf5x0o91+04pGIVc55fPDd3?=
 =?us-ascii?Q?JLmLAiBAn64suBWO0aR1wZY9E6AGFZsJJPewznChU/OrfJNYLzbwScZQCinb?=
 =?us-ascii?Q?Dnpp7y23BYVNzEn7KgmfSZ5L4va4eT/aGLeh7jdZ1N0ht19syArm3uA+10r+?=
 =?us-ascii?Q?hXQBC+L36zyL2ePY8Fkv+yYaP4IlW99ln+Xh1C72e6aj9ViZs1hkroRMz5Is?=
 =?us-ascii?Q?Q70GVpFrVFi11TcK4iJUkdNX1/5xsA2iX6pvAQ0sA6RqPO+x377jCuZ2aO/5?=
 =?us-ascii?Q?8KxuHFaSeM/Yg9l8Rkd7of+y7T9IM37cyO/xjJ3zKbNgHsDDOW+jVHKaYNTY?=
 =?us-ascii?Q?Ak9UtJlPQzxOzsjXRdFji7n9kITEvr47j/efdmJbKctcWA29CuaelLl4ixas?=
 =?us-ascii?Q?6sCIVH4yBT4PMYvO+/BkT5EGvfRuET2Srz1AO28IUz0gac6PEMDEFC/9f4gL?=
 =?us-ascii?Q?KjtIjDixN9h0siIrAIBo7QRRu5AR1e+csk76B7ksnTTTEFqUde9gqvjOpE2T?=
 =?us-ascii?Q?iDnXmGy2oTqIYn16iT0rQAIG9KgFrTS8fgm6gXZfGezfw/ZHeGKH1Vez0BI9?=
 =?us-ascii?Q?ZeBDycJONw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: mFwSBq2I8zwS8wr8x6TXxn5L8yfSrzVLRZSmQ9bwmA/K0eV2qir1u12x4iM/DUfol/HV7J8kENaoOnWnxbguYRB7nJc+8XvPwtVRauAcR8zjx3D8eWvBqpxSW6SCgEdrNOtPP8Hd1HEd1IcHjBxtkFiq22GcLywIubrfqND9u98tuAPi6CTQqcO97hei41so+sePOh9V+XjEUlhTS5vp6GmHMi2M+/fHDz86s2MyZT9ILc1wnOnmAs8nXVT8VbNf3EWqWAiPzwGvTNlwUYE6zd+9lENrAHv6CX1mweqaadd1M3HYNX/NiIwSYL1eykXNFXhNofFQVCBaOxYO7SZqVw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8718.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24712c8f-570f-4a79-1b8b-08df0529f0bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2026 17:29:40.0074 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xuPcJB4XCeka0570rK/ug+cC3oFIEQ3QIlPwqQTtUCEOeKtZkooKSIgtOc8X8NeUZ3N8mqON5H4y7EyXzkYTu17DSUrqUdzm5/ER6nQcx2Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB9724
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
> From: Andi Shyti <andi.shyti@kernel.org>
> Sent: 28 August 2026 13:09
> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Ghimiray, Himal Prasad
> <himal.prasad.ghimiray@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>=
;
> Wajdeczko, Michal <michal.wajdeczko@intel.com>; Yadav, Arvind
> <arvind.yadav@intel.com>
> Subject: Re: [PATCH V18 03/14] drm/xe: Extend BO purge to handle vram
> pages as well
>=20
> Hi Tejas,
>=20
> > > > >
> > > > > Besides, can we split it in two parts?
> > > >
> > > > Not sure I understand correctly what split mean here, anyhow I
> > > > will add little
> > > elaborative comment here.
> > >
> > > we can have one patch that is adding xe_ttm_bo_purge() to the
> > > library and one removing the if statement. They look independent to
> > > me and both are vaguely hinted in the commit log.
> >
> > Hi Andi,
> >
> > I think for such small patch to split does not look good, rather I will=
 make
> more descriptive commit message to explain what all it does. I hope that =
is
> fine.
>=20
> To me, it's good. There is no limit to how small a patch can be, but ther=
e is a
> limitation that patches should contain a single logical change. This patc=
h
> contains two logical changes.

Alirght, let me split the patch in that case.

Thanks,
Tejsa
>=20
> Andi
