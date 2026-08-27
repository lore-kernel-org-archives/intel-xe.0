Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A48BC5DF9D
	for <intel-xe@archiver.kernel.org>; Thu, 27 Aug 2026 06:17:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DF1A10EE0E;
	Thu, 27 Aug 2026 06:17:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lh3r8H7t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF5D410EE19
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Aug 2026 06:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787811451; x=1819347451;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=nMRM1qt/QoPf9C2JshS/jL7jQ+6P1ELTbIPNA2L+EVc=;
 b=lh3r8H7tW0gBoISrQ/7Qf4yg/KFZYpgJMnaId26hYeIFcSiP7pzyStvz
 QS0YmSLZQPEI6LGZHtBP/9cZDMMFQu8RXWWVu3Ce06aMDUtUPG7+4veIV
 M9rxWNUdld/OE37koxN+WFfkzSbD5ciNzs0/yZY4nyxqSAsx8iDsAzGW7
 vgJpOhf/1Xn6k/4ArJgsuwccbOei6SMnC8zWS2Yelb8NK5iWHPRrnedil
 q+VbO8y5mpMR3RpjXUi2JP9/ZnlvXoVkWwlxuXP6Dd35Ysqvyl6hihrYL
 BdlAifEPn8XyN5UeOptUHDP3PI4shckAveWRtTrcqQ3mOvSc+zlaUbZpo Q==;
X-CSE-ConnectionGUID: 3nVzBEv9QX+u8GHiWcmErg==
X-CSE-MsgGUID: crlC8QjMRQKir8YBas9CqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="88224549"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="88224549"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 23:17:31 -0700
X-CSE-ConnectionGUID: qEp0RqLgTNyCCxFLQvonUg==
X-CSE-MsgGUID: Hrz95ANFRTWKyS8DSfvyQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="263498213"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 23:17:30 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 26 Aug 2026 23:17:29 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 26 Aug 2026 23:17:29 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.22) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 26 Aug 2026 23:17:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HQyAEfUlwSIypdvKecNIDg73k2hlwC3/6CG91h6hG6uXeWSi/oXAVBoT3VHd+lLZ4/dH1NljTeLH4DMpcpxC9NC4H9kQwsNI0/USvXLN70rY28nLue1gqDVGswlxSqJkC2qNIV2YMUgU1ZvbJ705uK6Y1kG12jG4oCizCTK8ZCprte3/LNcniJxLWOoIIwuVHSPbAGanSMiWQksaxcaWARTB08rU/gTHXWqvg79mx2tLRYrw2iyNrmxgyKECsbupFLaVt1g/rokwyF0NgXFIynt8sAkpI6T2EqO89CpGT3z3P25vZMhsPWnBEL1V1nfROPOFJ/MUJuSRmFpNvr4b5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nMRM1qt/QoPf9C2JshS/jL7jQ+6P1ELTbIPNA2L+EVc=;
 b=hIZfAABbinsDwpVX2Uxng0mxWuSnPIJaxr/vgdm3AOFOc5b1PSLh9CU3SbzGyWAs8C5OxdgIXRghQPj8RWZ2qXyiX+XeYOH6x+XmRt/zjswcL6oJeP5HQEmsx9g39ubBKEO5mjFkF+f7iSjQInZ2sWEXXQPSohyWwi1S/NQOC3EenAvSHsecVAUkGUImHl8OI0/tJbhVf1SennhJ6HAJJMbw4eJIfBq4bWcExdgVbmOKsOX4B0Vx3Q4r9d0EuSDowcioNvSZSnZxJfBBif3oSg9cYIGvwmQxSvQlxSFIKgslo2D72coEBahLOoQBfkgAPGXLdjxfsA2p90w3k5iZuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8718.namprd11.prod.outlook.com (2603:10b6:8:1b9::20)
 by MW4PR11MB7103.namprd11.prod.outlook.com (2603:10b6:303:225::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Thu, 27 Aug
 2026 06:17:22 +0000
Received: from DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c]) by DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c%4]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 06:17:21 +0000
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
Thread-Index: AQHdNWIa8lHAO7PzpUyTi9OWg/AoNraw7aCAgAB+jxA=
Date: Thu, 27 Aug 2026 06:17:21 +0000
Message-ID: <DS0PR11MB8718159BBB829F3009BA9FB281AD2@DS0PR11MB8718.namprd11.prod.outlook.com>
References: <20260826135136.204044-16-tejas.upadhyay@intel.com>
 <20260826135136.204044-19-tejas.upadhyay@intel.com>
 <ao9rmRZlZMf_kqSV@zenone.zhora.eu>
In-Reply-To: <ao9rmRZlZMf_kqSV@zenone.zhora.eu>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB8718:EE_|MW4PR11MB7103:EE_
x-ms-office365-filtering-correlation-id: 94eef615-06c3-43de-d1f9-08df0402dad2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|38070700021|10067099003|56012099006|4143699003|11063799006|18002099003|22082099003;
x-microsoft-antispam-message-info: vF32us4nbYHGd9wHYdiFdPyvd8gwN+8XNTj7IBkt5guYAE6Isurbn0qsOcdYyfOGqkvvACXiuir3HH1oNykpLrKnSh4boMSOyQIKEfezYz88xyYdMyp8Lj8APtTE1+UwI1jDD5fDdqRHrLjdQjKuNKNSwCfilWIv6q8yqLKUPJtKi0vhtNojtxaZT/2ggy2A59XPV5rGLZTOYV58WfmeL+N3o7OZrUaBbrIJ/R9kVOuUJEve7exHq6XYiTKzQ8bnaXpfbb386fhsPh30+N4kWjN1I3RMyH8q7l3odBf3oA74oHQRe/f9hZumZtTCAzhPHftgxe1NbYz6ReJqFvpEq/AZiwJ0QTTIucRmZLnfccxtJlVpM8mK5hclcyamsJAfeyhzV0MTF1eme96KSvHlPSWxgV0oKExUAbo6afJgzKfkQKABLlsN3sk/WijJ2VtrTlMc6LcW+T7dCmwh70RBrFHu63SK0gKmfrxXCMHHcPCj5JUL2V2glhlg2I+uf+xQM4mcZDtpqzZ8jyUqgQSkdMD0ZN2UuxxSlv8i1k4OrahCyiiAr0vQ4q6PNvSxAF5eQXLJ9ls6RnsVd6FZN0ymnfmNX5GD1tgCK2AhttVBrbvXAWsjA9PsNyyf4kl9wHfK7IWzuem7Uew70CpWxglRwbiuaNg+E2YvVEYG8Qv0hVypUQePIvCUkS9FrmnHhximviLZYhnohaKjayuVOqt2YO0Mm4g7TOWxJ3CP9Eff05o=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8718.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(38070700021)(10067099003)(56012099006)(4143699003)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?u+B2BLp99+dvx4+dQIhGvXtAYn4ArEz4taLWRAsq2pu23xCH6OOXiDNKOwQc?=
 =?us-ascii?Q?v2Wb0fz7xCZHzcIG3eKncDPsQHV0PkYDVXBa4O3Naaxu2yD+nijUNNUOVINb?=
 =?us-ascii?Q?eo13TVriFT3U4dVO75zy294Vh8652+g4RgjLbJPUyx+OzZVPLOPhRrluf0zK?=
 =?us-ascii?Q?A69slJyeyvKYk5FZVdqkSMTuMfBo4RP6X/cfOVkg2sBVbGv37HwCqzPq7NnJ?=
 =?us-ascii?Q?W6jjYMqdTU17oK9ANHJ7Y/wh0XHY2E18QXwIIyUudXSx4anLRy3TjFfEHAkm?=
 =?us-ascii?Q?Js0ueSiW6oBpmieb35+MrJmp0KeEvvF7ewWvmgGqvxf9VhmVCBuNh0bT2hQV?=
 =?us-ascii?Q?gWgM45nIm0infAbEz+qOLg+jnxXuzXHifn+DagdhrsESM0iDKmidO5pyaPj/?=
 =?us-ascii?Q?nrJo+70aI7HAEuSry0S2aVQh/QJvJFGuotu5SeXhUp/r1cKmB/VfkWs2uSVY?=
 =?us-ascii?Q?nxmxQ++suTdq7pQPFEJ3eMurw4oj+fL1etZ5jeAPccLZQ4iiFry+GWQNWSmL?=
 =?us-ascii?Q?ndP4fQKJF7x6Nd7OW8rwP8W7bSNnp8T61540Cjz4CnPGY8MM+LAvDQR7cn6K?=
 =?us-ascii?Q?+rRfg16h1Du5Zh4xsbx7Y7CY753KwGOnVEDyNDRBYSXrVTHW/NuhMnHYCRo8?=
 =?us-ascii?Q?kAD2OqkcWkLHcSHYrzSik2tfq3fE5BSd4pZ/1Xy2mE3Uya3vn2ra/szXY93I?=
 =?us-ascii?Q?oBfTxYLzIGb2s3Uq+kB3MuAmqOifYBSrMFzpKq3HK8orSECCoZG9xxeK9ct+?=
 =?us-ascii?Q?Ki5EKxKVimnLkbzCEhGRjKCLCQNtAf2lBX4BnaUs8IALaFe/nlt+GgFCtCA+?=
 =?us-ascii?Q?GT5fOoGoMOh+7F+8pq97k5F7SQ5vtzdCmdbxr3/OpAeG7djgx3CY7oVRebvI?=
 =?us-ascii?Q?kZvF9FMKVuUBaaxAsN3gxmsXDGU6anl8FGTHS0ID+NPeX327GxRERIR4EbHr?=
 =?us-ascii?Q?WOdm9w4+Gm+fb6GmPEbjO7jQXMw34f68cfN8NEfIt5ScqQ/7jHYXdR9/UjnD?=
 =?us-ascii?Q?42VZSzQDBh558+LVoHidufdvZm+aIuvbkUcmBFY93oM7rGxxWSHMEqJNkUrf?=
 =?us-ascii?Q?NQcpglmjrQCT98f5ulyZLmWyLGUI7cBwss9VUS31FPyDIagJFItXzKOQFUYA?=
 =?us-ascii?Q?0CMSJVicX2KgyGUjY0jb+1XS+kMGyEaH3HL308VfgMsXWEnTKiHpQXZB4NOu?=
 =?us-ascii?Q?1MQJL+7034jSzRmocxqWBNCWTDcqmENdVWqXyOdoPZQA0MiweW2owHUXxvKk?=
 =?us-ascii?Q?nHp7kaA+wn+DuzBEDqzvAgZydP8EuhBHdyFCIvKNbkURl1NAdlK+3MfJEZWq?=
 =?us-ascii?Q?9z2u3vjlJWY55KwXUwsHyMn4mES6cjJ2u6DeP8jrqS8NyQmAwb5lAiL0k6p5?=
 =?us-ascii?Q?ko7bkONXFFRz2sIHJ967yvjjzX2IZTQJjSx6Jnacb6SEWo4O+rWpjct6RHKl?=
 =?us-ascii?Q?jwEaKEZvfuPbJovk+XjzSBJKThlaqQU+W2h9OnpdlyAHgZE7Y9pAWcGg8c4z?=
 =?us-ascii?Q?M4yGWyuLJ5Z63AvGbWKm+m1cEqR3NMLpixrS99ePcYYIMVX6ZYdQYpB/qG6c?=
 =?us-ascii?Q?XvhGM5IKBbS6buffSkpEsDzDDtcL2+APkP+5w7zUfWQgh/l38irkA1vlGewu?=
 =?us-ascii?Q?xPzZub0hSEhBYmVRHSel2trK32EeBJAFvbclv+uuib5tb+Dq8jPwvNviEiWd?=
 =?us-ascii?Q?HtHCkKFf/4IK6ODIBpgdvXWG3xw6fM5X+225bSZVlxv7Wc0hOwD9J9GiK8jp?=
 =?us-ascii?Q?5u+kNGG+pw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: WOePgelCY5ClI5qRXz2SDpa/PWxqg+tHwkECHKnLxj6Pg+v/ByjVznDU/jwcsvxQ46SR468Y2la5n745WYiwaobz/2plC9+EulWCHCjwsdUBTI9GHQosiX7537fyhIedpVP7AViZvsXc0zY+Xz2s9mkvVVKLguGf58i3UYmmQgdusN3/3LzUDDckRDTpEzm8w7qtIgI0jFO1rvGR/7Id6qdyYukncFmq8/q/WSncbA8nIWcCCETt3XldxmUdXk1lMIwHw3e+NVcQCtqD/w28odjRjVUXRgD1sfKFqp+cP0KE7RWqTD+nEJpAeJ5RsfNGMLDYFHEslf+Mkek01k5BZw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8718.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94eef615-06c3-43de-d1f9-08df0402dad2
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2026 06:17:21.7202 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T0VkpHSAYfolPDvbkCUgVv4Di25cbm3OHRKaeQiwQEeY9Vb49JIxPPgSYN2HdpQnLwdSI7vrhyqj/s/U7GIMrQeoBWBFk2nu4242HAexF2Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7103
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
> Sent: 27 August 2026 04:13
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
> On Wed, Aug 26, 2026 at 07:21:38PM +0530, Tejas Upadhyay wrote:
> > Recent driver update introduce support for purgeable buffer objects
> > (BOs), extending the API to include VRAM pages to better manage memory
> > pressure and enable memory offlining.
>=20
> this commit description is not really telling anything.

Earlier we were not expecting vram pages getting purged, now with memory pa=
ge off lining we can purge them, thus API modification done.

>=20
> Besides, can we split it in two parts?

Not sure I understand correctly what split mean here, anyhow I will add lit=
tle elaborative comment here.

Tejas
>=20
> Andi
