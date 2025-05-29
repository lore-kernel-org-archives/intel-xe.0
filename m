Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BB6DC54FB3
	for <intel-xe@archiver.kernel.org>; Thu, 29 May 2025 13:05:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B80E110E069;
	Thu, 29 May 2025 13:05:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FPlUORBE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79FD910E069
 for <intel-xe@lists.freedesktop.org>; Thu, 29 May 2025 13:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748523945; x=1780059945;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=FDPaB+wO1GGFkGirGrGAleLeInjBPVQIyah2VnlxjPs=;
 b=FPlUORBEikprJJ99b0+qVjlzDnb36jKT41Zn+EhyDlP7EH6fG5kF8V0w
 EToMspQfUJiolDDrQvUmfivbTYFSb7AsW0GK80S7In3RfoK7tPgb2fG90
 BUk3Lra7e3Wwqt6RDh9m2m9bAfFX8SHavLN9652fWrW0XSyhmQBEx1H3u
 PI6r8ArNAYLCvcX2sqIFcKfQl4RVU1Csr8nnSYPeHT0h1ICwg+FlkJ+Hf
 8YRQMY9S9X69fAhR9kfKUV93encSpKG7CDgYFjawFJ0TsGSK/8oe3+z1B
 LSSr7ziUQVUWFxuIfHL9yVP398hjE5tVhpmni+dmmyLtLRq9/CG00dRPx w==;
X-CSE-ConnectionGUID: nnsfM0e9TOuAoxhTmNHumw==
X-CSE-MsgGUID: SPvw58SkT2urtCtrO0CpJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="68132561"
X-IronPort-AV: E=Sophos;i="6.16,192,1744095600"; d="scan'208";a="68132561"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 06:05:42 -0700
X-CSE-ConnectionGUID: MNI8CO8TQFOFnhW45VjKaA==
X-CSE-MsgGUID: 1oUABUZ4SqaJdzQHXXgUpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,192,1744095600"; d="scan'208";a="174440819"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 06:05:42 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 29 May 2025 06:05:41 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 29 May 2025 06:05:41 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.53)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 29 May 2025 06:05:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UutHR60voVgZoZf4VdyQ2HhsvouQfbJUhM3YVxMXoW1wbosyKJj0bBEsab585lh7PzbOddku8tChD4k2I5+OqUXWBMqYvFX9K5PiH+EzSJ5U9Cn/uxLGIygzppC6P4P4Uup7ppMoC53KGT9TPkArMbsSSI17uBVVs3k2o/sy/W2Rr3B8KMbQfRSG1jYiFtT/VbkUTuOB9L9BNj6Waz/WCRTIa+dGvXzsRri6tdd3KOOTOrUgYzMpcDOJ6z5E16LiPwXMFQN7lJOLFmgnD9Ljv4jgB9cQWStm1LYLgqJ0nPsSzj6WWnWkLPgy3/POr5yWEULEBXcOzEA1k7YhZ5prXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cHAVrtkIt7TPnurr6Z/ceDwV4P5VX6XTwbuftFrlBdo=;
 b=FbjcCv7t1wZ1zSQmQGTpbkxyra1wcJESAtFBlgZ58x6EnrndwyHLMOLZm1Xw7zjURdcqx0sjdx5eAfh3cz4AdQQ+YzghlMb5DFJZvqrdCHiG9tPO21cb+eB8StpY3EnOrxPVlQW8nQxUxLs6+wsM+xMJ0P1VC+acBbG8ypGXPxX6pIQaBvrHiJ/lsoSfEjbT9P81RMJYaTMfX78R1f4TcUkU8KADl/E1BYXYYWdqP/ar+MM8E76s0ITp4nufLvXqqa/kk78WtHlut/FruNPUyYcM9kcteTM878QDMpGY0C92MTqJpyAwQTeaDm261usXHg9S5+MQO6EHq28upLsZWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by IA1PR11MB8801.namprd11.prod.outlook.com (2603:10b6:208:599::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Thu, 29 May
 2025 13:05:39 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%5]) with mapi id 15.20.8769.025; Thu, 29 May 2025
 13:05:38 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Bhadane, Dnyaneshwar" <dnyaneshwar.bhadane@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Chauhan, Shekhar" <shekhar.chauhan@intel.com>, "Bhadane, Dnyaneshwar"
 <dnyaneshwar.bhadane@intel.com>
Subject: RE: [PATCH 2/3] drm/xe/xe2_hpg: Add PCI IDs for xe2_hpg
Thread-Topic: [PATCH 2/3] drm/xe/xe2_hpg: Add PCI IDs for xe2_hpg
Thread-Index: AQHb0JIi06AUchkX40GZNcnsx1shbbPpk29Q
Date: Thu, 29 May 2025 13:05:38 +0000
Message-ID: <SJ1PR11MB6204CAB33184AEE32FBCF2568166A@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20250529120534.531237-1-dnyaneshwar.bhadane@intel.com>
 <20250529120534.531237-3-dnyaneshwar.bhadane@intel.com>
In-Reply-To: <20250529120534.531237-3-dnyaneshwar.bhadane@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|IA1PR11MB8801:EE_
x-ms-office365-filtering-correlation-id: 25133d2d-a905-47af-5155-08dd9eb1824e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?KjG77dIuAFIdCKuDBNmWJFXnvDivkX0GnW4Tuk20saGYV0BPgOWkn5Cg12tm?=
 =?us-ascii?Q?f1rjPLb2XFgCULa6ITh+xFim2E48ppJjEA/iNtvKZsvkZkUSdl43pQ74awjf?=
 =?us-ascii?Q?Gpwou72pem9iApH5FozNEV2YYr1xrQVi+iNEfZKJ2uScfbxBSkviFbRksxdN?=
 =?us-ascii?Q?3xWlHnSQtbP8jdYr34o3Iz+EczFHGisC4hwFh4cmQ/NAFIYV93qAvSLwPhVN?=
 =?us-ascii?Q?gLJI8GbLmBQplN9B5IaRqJmeUfG7l/A4XPyPOYDWcsqqL7FZQd+XLM9n82j+?=
 =?us-ascii?Q?k126yMidHqrNSL6zzKyeb/BoplDoEP4ZZvt4Yjwi2ALgBqJs1nRp1aiwIybb?=
 =?us-ascii?Q?Zz4vTa3rj3Wh6xXrZ3Ml3tckyJmf/fZgHnbosZKNYZVbcTsj4GfT/f2RFMwy?=
 =?us-ascii?Q?zoDu80VjbK1M3FPHIoX+CWChWw/5nvGs4vuJM9crLiL13tK9tKjAHwhkOBPL?=
 =?us-ascii?Q?xAbO5J2lcSN40DKHOgt0HX6UP06DWkIwtkmA/fpRwGS+m55NwhRsNLcA081R?=
 =?us-ascii?Q?BfOlV+3RvlTAzXHIaThb/a5UNE54XD6TfCVjZaUDK86nTz1PUDiZTMBuAdVI?=
 =?us-ascii?Q?5rvjsx6C3npUmLJ+L8zKcVJI+6nNxVSp+CkqnsBQfFGODI1BUfxIC6BcOOSK?=
 =?us-ascii?Q?/OuRgFOLqO/KXkplC7uKMc0bVqBsWZPacX4QiTpErBho+aUU+kPmIzNf8hz1?=
 =?us-ascii?Q?gtz9Wkxe8xbp2YRlqViTJKgaYpHqAnPT2sdQTzZ2TrhTDJ6xtLjmnwNGBT7E?=
 =?us-ascii?Q?FCZeeKSaoJrH/YAKx/bie4Vq6O1/FK9zOJ7brOZxmM/AeiUjBDBiW1+PL9UH?=
 =?us-ascii?Q?aUCNS7lDuYl0Q6OA9yKJylqnuJ9qDLuf3Dv0eAFwmVe9/zITM9rI4tV/8yXJ?=
 =?us-ascii?Q?wa3kgnS4FkdkqgfVQy42h4zTy5FltgxLLN1vCrKgs+jfZokiDm7OIX1XO+F9?=
 =?us-ascii?Q?su20UZtQ2EEPVh5GrHT+0EB944nLZJdJSnML039A4DHRG3lmB+A0oT3Ootvk?=
 =?us-ascii?Q?F7iav6svZLPocpKfUevYMLzNP3U9tPMxnoRtFBdWz2PoqJNkaN4QrGPb/t78?=
 =?us-ascii?Q?rriYKrSyR/X5gIi+JjGIMvxpbLbz3J30CbehXU83s5R9ByyoZyeyn91v4d+c?=
 =?us-ascii?Q?IO17aaqYUwEIGIDxujAJ5BGZJBxaZNzYe5yzWDLbZ/ACOUVoZY5aqUgE5Fqk?=
 =?us-ascii?Q?345qP0o1ZLBnZTh5v34ebEnyB9c9VHvXh6FWCWEh3RNfhoQnujngc/Sa3i/F?=
 =?us-ascii?Q?GIx/nyoK3Zzcqq9Qjs4jn7jX8/RoBqaanl0C1gYCxQqwsq/o5nmHt1tUxkRD?=
 =?us-ascii?Q?aNfzUpkgmmhhL1xOrs67AqBizB1kW3/EMZOwWVl+b256FMZ2+s+1LurRSsTc?=
 =?us-ascii?Q?LgOUfgcycZ+zukqk4iSol1tdy3IPuQIWDf9sPVt/2cG0PADnYLDPuXYOPALO?=
 =?us-ascii?Q?b406JYS6+WjukSuk55Xpwxx0YS9goo0HSRrXILkQKuVBL+uX/QwiQgnFneBt?=
 =?us-ascii?Q?grMn/qMIosypN2w=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?+f3Pid3fVUDMirBZW35TO9mp7jcgDvKaMSwZXdjqf3SsbqDVjLW/C1x+kIE9?=
 =?us-ascii?Q?J2OGFQf2yNHlGWV2e0TMS5m455KoXAH2oVEAxERvtoGBpgzUnXUM8chH/FRZ?=
 =?us-ascii?Q?0RNJLu7hMVq5YoLTdrqtMYHayOJeF9mfYwmnL4RIdkb+NylTvT0QJnlOKhaE?=
 =?us-ascii?Q?NMNDNM4tHpoIMMWD7S3iizIp5R7eXVNZBIKxdzCbzPqwC1NGeVFLFWl+lfOV?=
 =?us-ascii?Q?+yKzCFF2A9X5gyZ5m2IMC9k/5IhtsAUhvsiTpXnDzEeuDUUaSJBG5evHG/Gr?=
 =?us-ascii?Q?vXinkdePRUtrJTNjURdE8daEuqVZsjCbdr5gxwofu57IyNQzrDg0gqtdYMXh?=
 =?us-ascii?Q?qsMd59J07lqnASvJEmOg1QjzKM2j0rVJVp7tmtBmvABHkvBIWQt45rKZ3ctF?=
 =?us-ascii?Q?9boZCtPtCl85obW33ahrL5+pdDoMY/6+iSiERbTGBb6yzIvhNxMa18n4g0BN?=
 =?us-ascii?Q?rMuZ8GiHnr9Ul+Ec2bVBNNXogJZqGct4/lUsvMTX3Qu7Y0yd7afDB4g57+wC?=
 =?us-ascii?Q?FKbhRObCYJlPGudkr3uNj0cgtJ8WP48Ayn5iG07onsjjLIdDU4Jsa4u5QPHd?=
 =?us-ascii?Q?Owy2wLXP8Qk0N4T5VQVd7l9P94IoFKCf+4rH2h1raDvyYsiwMFPCFOlCSKoP?=
 =?us-ascii?Q?DHqowFWiOAwerIVsHoTHw+QirrdO2rQbdhsgChhqWERkZyb6AqTXwWNCM0Jy?=
 =?us-ascii?Q?H9AwU1q4yTmvXU4dm1qAYwYpRC6tkS920IuwkjMuQQ1XjkkptNcJVhhc7cQ3?=
 =?us-ascii?Q?pv2U1PCPVqGzjOZrCn7I2xJ/AdpyaYlYe/UyqPtHuW7lWUstttdbdWSsy5a1?=
 =?us-ascii?Q?M89QMhLPad6R85v5j2p2GP20MXKSNpf6ktNindmokcI8CLK8AfcxHCsXQrbC?=
 =?us-ascii?Q?Bkuzy6f4MD31CMIg9yzv6F9BLptDeYPQ/Uz6N3S7aIZTj47UdTGLNaSmSKda?=
 =?us-ascii?Q?mmRue2S9dE4LTX1WC9s+vztBE71kvoNbZLRkKFDV3Og8lBP4/s1BxLviG0QX?=
 =?us-ascii?Q?9LBF/OlcPoVwOTf5EZAebunIlwFPYoK7zAU40fzpYVD3iEpAFdPOMx1myZUi?=
 =?us-ascii?Q?CM1FdjSo53jMYyMaOcoAM41PolY3tDXhQATv6LnGhZXqK2L4qLvsudIpvTiE?=
 =?us-ascii?Q?H3MIlcb+E+ze8C2AM+mUX+BWS7Z+s3/BJaB6E2Yoi9E5gQkbCHZHjLoxa0py?=
 =?us-ascii?Q?wxvZcZftHL7r063lJq6N/b5QiBN0exfSF0+v4h+XET3Fwr+hu2ztmFcoqY5o?=
 =?us-ascii?Q?EnBawBskmA82dmwHtggiPAuQLXxVI3EjlX9kdlof46wtO7t/7GwCxT4Up39A?=
 =?us-ascii?Q?J6BNl1C0CRfc944dU3oy/SiD5OA/tI6DvbDb/5dQ5mpFI2FwGMkC0MIiASlT?=
 =?us-ascii?Q?QBOLYmzZdbj7Nd7oWqAmkRkYOfex+Ic1ztK6bktedXnROEB+blhYeGkhT9u/?=
 =?us-ascii?Q?9+fgYx+mL5eLUx2ky0cNv4sXXuWYTx0msN71RZ0U2kBRanMZK5TMQ/3HEKCS?=
 =?us-ascii?Q?i3RxLB8IEIP6F4EiraCYTjRPq8r8OuAHvLOwFSOKGqx0ofUjJkX9C/TqV+/D?=
 =?us-ascii?Q?iBzYEEGPOT4jSqTGf98fHBrP+qyBD33QHr+NHUsW?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25133d2d-a905-47af-5155-08dd9eb1824e
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2025 13:05:38.8936 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Pa2WY8qAiUQwm7/+SyDysbT0vbNs6hwfpu4pY5sDNK6RhMUl0JcTlvvvNRzwwy4UXp5MFuRk7Mt8o7FAecWH9wI/NKqngVffsSW75g8E60A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8801
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
> Dnyaneshwar Bhadane
> Sent: 29 May 2025 17:36
> To: intel-xe@lists.freedesktop.org
> Cc: Chauhan, Shekhar <shekhar.chauhan@intel.com>; Bhadane,
> Dnyaneshwar <dnyaneshwar.bhadane@intel.com>
> Subject: [PATCH 2/3] drm/xe/xe2_hpg: Add PCI IDs for xe2_hpg
>=20
> From: Shekhar Chauhan <shekhar.chauhan@intel.com>
>=20
> As per updated Bspec, Sync PCI IDs for BMG.
>=20
> Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
> Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
> ---
>  include/drm/intel/pciids.h | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>=20
> diff --git a/include/drm/intel/pciids.h b/include/drm/intel/pciids.h inde=
x
> a7ce9523c50d..129c3172aa5f 100644
> --- a/include/drm/intel/pciids.h
> +++ b/include/drm/intel/pciids.h
> @@ -852,8 +852,11 @@
>  	MACRO__(0xE210, ## __VA_ARGS__), \
>  	MACRO__(0xE211, ## __VA_ARGS__), \
>  	MACRO__(0xE212, ## __VA_ARGS__), \
> -	MACRO__(0xE215, ## __VA_ARGS__), \
> -	MACRO__(0xE216, ## __VA_ARGS__)
> +	MACRO__(0xE216, ## __VA_ARGS__), \
> +	MACRO__(0xE220, ## __VA_ARGS__), \
> +	MACRO__(0xE221, ## __VA_ARGS__), \
> +	MACRO__(0xE222, ## __VA_ARGS__), \
> +	MACRO__(0xE223, ## __VA_ARGS__)

Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

>=20
>  /* PTL */
>  #define INTEL_PTL_IDS(MACRO__, ...) \
> --
> 2.34.1

