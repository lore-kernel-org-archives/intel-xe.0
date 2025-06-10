Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3C62C5B552
	for <intel-xe@archiver.kernel.org>; Tue, 10 Jun 2025 13:49:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92D5710E278;
	Tue, 10 Jun 2025 13:49:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VrT73SOG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B28DB10E278
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Jun 2025 13:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749563359; x=1781099359;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ZHeRCo9Qh2k6IC9afkFpBy6igxQIIAKUTASw0i8aFfI=;
 b=VrT73SOG1KMJMox7ALN6G0wrXPxpPVaA5d5chDOnDT1EmTyiYBveb+1v
 HAGV2lMJQDFMjzbRT867r48eIVxaQowt0NvJhoVMLIiceVOC0H5gJM9dG
 15qyVCvnNZBVFHmG1zqsMrTQxx0/AgcUnGNVv9yBivgeDoY1Tllrrh7mr
 j9Ccx3/mJ3IwsWqxJfLK/GtCZ2tT9slXk+kJGrUR9HbrsPr+2ET0F2DBq
 RXlj8n/uec04qxFs1fFXv+6fpbl2M6q6L9Ubw9CjGilciz0kzDXuC5jgu
 lZIJbshhx7aaEjM1QtBRvTESmgzpZ3NOcJkomD3ytNyOk7GkPU2x6qXtx Q==;
X-CSE-ConnectionGUID: vfQr25GpTj6q7zeUlLnBNA==
X-CSE-MsgGUID: R7wb38fFQFeiOYq1P7SDLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="63027127"
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; d="scan'208";a="63027127"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2025 06:49:05 -0700
X-CSE-ConnectionGUID: ULn356dMQ2iwmUqO7mjjqA==
X-CSE-MsgGUID: iRmQZ16XTcWFLZgLcemmEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; d="scan'208";a="151840698"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2025 06:49:05 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 10 Jun 2025 06:49:04 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 10 Jun 2025 06:49:04 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.83)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 10 Jun 2025 06:49:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hBZSWyZZp/9eH/4SNmjy/st6GBV03jKwAs+6xdoaTZ5pENzQkMALO1dSIKLyevXPFYiFkn2MgYqNiY5jppKKPCgneJxJsbhACFvRgwyOwrdXIwcqql0FxiDpn9/FSp1Q5cmVRdRJpbU4ceJWg3OB6VtPS6p1g5AC6ReZTDRf3DQV09F89AQPMXzVMiAVFXRgHT2Tf7nyXvkZKlHVhVyLYfkkNknqqqjoZ/st+Ln2ESL5Ky+pk6zJaEj80s2Oq9eYlYRGo8xWvSr+NiG9F0QU/gWMYu3d7L5YZv8BofbHVSzwETEbiLRHJbOYXptUAX0QOtDSoi3BP/89+5NS7ojtKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TQKkY1IB8wcoxJdHtrXEDIuxWw9pRd0MvjFT2R2rp2o=;
 b=dMyQSZ4u4bzl7/7PaExJaE34H3EZCQhhQBb1MOSnByxzdTdPlymfXkrC6GAQ0UHhIQbUgC/C1eSGxnzNRobUbID8p0Fo6NOikmMo5yxpTRZWeHxFdMHAq39y1lyFui97S2HTKZGxAV8c/ysHS0D7wDDaGmyuxVVHn+GvYqlXMpGT8vMp3CBZ2fUAysAfn0go52udvA24zLHegNZOWAD0xhvv7bsEnuG/vO19lUOGNIc+hkq55GCRiyyzC3zNo64jxxzf08+ZhQp6AVmAh5ghn3+vV4exD17kv5Ae0e72a+0ZDLDS8+fRF+XKDKDuNi1Xl5edl5n0LcW5K3vbVucR7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6266.namprd11.prod.outlook.com (2603:10b6:208:3e6::12)
 by SN7PR11MB7603.namprd11.prod.outlook.com (2603:10b6:806:32b::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.33; Tue, 10 Jun
 2025 13:49:02 +0000
Received: from IA1PR11MB6266.namprd11.prod.outlook.com
 ([fe80::7f3a:914e:c90e:34fb]) by IA1PR11MB6266.namprd11.prod.outlook.com
 ([fe80::7f3a:914e:c90e:34fb%6]) with mapi id 15.20.8813.021; Tue, 10 Jun 2025
 13:49:01 +0000
From: "Bhadane, Dnyaneshwar" <dnyaneshwar.bhadane@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Taylor, Clinton A" <clinton.a.taylor@intel.com>
Subject: RE: [PATCH 8/9] drm/i915/wcl: C10 phy connected to port A and B
Thread-Topic: [PATCH 8/9] drm/i915/wcl: C10 phy connected to port A and B
Thread-Index: AQHb1xxnPJ3Q5HAPnU2sht2aPIzh1rP68aSAgAF55fA=
Date: Tue, 10 Jun 2025 13:49:01 +0000
Message-ID: <IA1PR11MB62668338EF7E973EBC4AB446E26AA@IA1PR11MB6266.namprd11.prod.outlook.com>
References: <20250606195104.1771715-1-dnyaneshwar.bhadane@intel.com>
 <20250606195104.1771715-9-dnyaneshwar.bhadane@intel.com>
 <20250609150527.GL6239@mdroper-desk1.amr.corp.intel.com>
In-Reply-To: <20250609150527.GL6239@mdroper-desk1.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6266:EE_|SN7PR11MB7603:EE_
x-ms-office365-filtering-correlation-id: 6b88b4ee-4093-4d7c-1f03-08dda8258ecb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?o3asmiBJZPrMGi42OZ4hI+4fHx+Y8ORJSn0pvdx1O3w5S3rt5cd+EEKVHAXU?=
 =?us-ascii?Q?LqBHVXgm/LTFnCuGjY+OQxM5unQC06ICyDt61yPoVzORbDbajk2I/314wBS4?=
 =?us-ascii?Q?pGtvtSdd4vVYCoP/+vSFLRIGcUNnZvP6M43+EzWYRXeJ4gPcnX2IH6tGY6Uw?=
 =?us-ascii?Q?L1Lk8ZV1+uWk3tyr55Y7O7w2VnYazfOiGaAZ3Q03q3WZaVFZkpcQIzBZEzz6?=
 =?us-ascii?Q?/hpjlf2+A8WUljhjBHynsbmfRS26t2q8glm+W+Mc903WKD5wy5y6455pkVPx?=
 =?us-ascii?Q?cjB6TYpi0bE5JV79dTEG2yFabHMjk1VKNv36ASZmZQakE/qkT/nuNkrGQZzH?=
 =?us-ascii?Q?q1KE67ww1JxozOWiZdTzccSEaxeWSeKAm+Z6nDIntUD9kR6dvL5ecACB7/CD?=
 =?us-ascii?Q?llqScNZpraj2LX0DQDOUgDg0Z3py9Wwvrpc2sWRGs42EKYsEkc6MVB9GrYOw?=
 =?us-ascii?Q?GKNwG/xTAkJrZc6G/48UIFUYB/ZKcFBjthn7QS3wiacsM3CcU4l5xffdfr13?=
 =?us-ascii?Q?11wvfy7wiiqmCpAUf7DA3Q0rL/ENWo/oCyBKYyVbcvnlD4TBZGCe8dzs1Jqo?=
 =?us-ascii?Q?CTYlSU6CAZwYtHvqv1MTNuKTfVzQv1SeV62ejXnjNinaBOd5JWLZghF5XnHL?=
 =?us-ascii?Q?A8nf6B3Q/F7kusDZ4R7m+WiJ/9MZ26QTbrEFd31Xf6inu/l1vLF02cwqxm5y?=
 =?us-ascii?Q?URXXy0ZlzVH60pJg+iCekKEYpMMj53Ptj55upP8058dIuc4JQ/nSCxXJmnui?=
 =?us-ascii?Q?rdyRMwfhKuxruRta96r1ozv7hQ0ttBS80j3TCbfgjYNY5pOuZiGWlFw4oTMV?=
 =?us-ascii?Q?Eij0iS5UdXGaEtTLMuCd9aIICXo2aMqgFizC9UG9EeBt7Yzig8MKXF4TUYac?=
 =?us-ascii?Q?IRZIme2L/l+s7mCZJmJONJF3Cc4NYtqvq1B+9vf4/Q2XQ4Dhf7hBJopm1bkU?=
 =?us-ascii?Q?pbKCbV6kkWnizO6NwD181/D+LCHwteEWaFC94pFU2ZZehc0yPLD0jUWfq3KH?=
 =?us-ascii?Q?yCOl9JL++UmWXPgw9m5IdM9yx5aBORcsNOBUn6WtltUq0Xtzr0deIBMg/4ku?=
 =?us-ascii?Q?xeW+151kr7/Q2EC0H+UWq2oBagE7ZKT5Xz3fxAdVbZvJUAMnX+y2EF456jFr?=
 =?us-ascii?Q?Q3ExY2m0/Dok+DsoSEZvyGFJcbm4cfPHmeoI+BpbWAwvyYHcPDKBSqPMiTsK?=
 =?us-ascii?Q?LV4d+1dNemUhXPAl2snx0RWb/ldhH0gpUUXlCMPmCBRdL3e0/yfv4gnBqD1W?=
 =?us-ascii?Q?WTvaCB21MyKQXLiE3ST0Q0J9gZzjWys53mlvXAYg7EyMAxoVtain8j86ivX5?=
 =?us-ascii?Q?m2FUysHukULp7km/teCbLCqwdBG3azOn3eqH072ccTVDuEJz/930RZUTiXJe?=
 =?us-ascii?Q?F0OQl8ND/AI72WxgJRsPI+FophwExiYbvHhtzZrm8Cjvvuj2KCBvIcaSnVLs?=
 =?us-ascii?Q?UgQR5dPEdrAny79BJ91R24DhdQHy7/QuZDGQYfwwj1C2IWqUeVK2sUw1VxeC?=
 =?us-ascii?Q?fXWOqh/N4etb+O4=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6266.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?nwPQ5e5uTC86vyN1nCDJ+FAylDWJMBakCvO47+oCFSYG4n9r8dBc+FlfAWiF?=
 =?us-ascii?Q?qWjq/hipIWqsG+4oLU6CnCUwxHQ22evzfd6alFBq4igSh+IZUaJd3m7SJgcz?=
 =?us-ascii?Q?EQ+0wQj4HTDORaP5teDG0S4f/yDZ+5nk33Jhn8t+GxMirBWsD4hZq7MWSVtB?=
 =?us-ascii?Q?fW9M4eg3t+Bc9yL1fDdczJeyxB+pxaTre4CiDnB/dVUepnPH7/MG60cF07vl?=
 =?us-ascii?Q?IfemANvtpkYoWdt+6pxmioU4gjML5VjEP7ERQpmgwJutIKZra2vQ1fTn52WD?=
 =?us-ascii?Q?s8TMGfNPtJYno/KWvkSmPUFpb1Ad0QmhEhUV+hCgsDPQj931XyTIm+aD5vOI?=
 =?us-ascii?Q?X6NcgnOdpdDLCwYoO9a31a1zRdYLLOFpKLxBP6FPAqSWz4S0zYdk24PiC9Rf?=
 =?us-ascii?Q?YtvxvunQd+zjkm6ehFRn5r/E+Qh3wescWxaRKAlpwUiP5Jfoj6O45EHqLo77?=
 =?us-ascii?Q?Fv214R+AXkVx6JcBLwirfDIfe+FPJpBdIAo1XQvP6FWPDRrbjGET0owzzWUv?=
 =?us-ascii?Q?7hXpYqGuVThE8Ki0r/bpSTijTePnJCW4fSoruSPbgLi8SWoadY0g/OTSxiht?=
 =?us-ascii?Q?YpU/5ske+k+VKeCQ5mRirdAc9EL6ktgKnyjn+aX+5ljvrLpFWZpC1eKGE5Ea?=
 =?us-ascii?Q?FqOKrxPgXjFfVwUJ8ORcJ0KKubbLvkSEq2yYjPCppOU4+5NnnFWYubZ/OE0g?=
 =?us-ascii?Q?E6I2AV1f/rZQ3q5S1ffSU7AhQyALwR2W2tu/6bU6hcZsTj5B7X8s1PXR1v0V?=
 =?us-ascii?Q?2/ndwKzvtpYqrIsAQctHdQDleyU0vW9R1zCiNwsv/+57zCzgiukjgjbfiBJz?=
 =?us-ascii?Q?9YzGrtL6aYMltbCStuxrAm96+nBTI8sBU21gIka8dOkBkQ8ffjYvnbpKv1qg?=
 =?us-ascii?Q?y6emxF/sUtv4QVQXSKc33kg3bs2H/sgcfcQprkqWtH2xp9eeY4xuYPHp86W+?=
 =?us-ascii?Q?qOJ9/JvvS4DoMOB4GS3zVWG/v93aD8d+BMORjeDafm2rwV8mQ5eOay65+iWy?=
 =?us-ascii?Q?bnWTkKoOm9XFcw/o2RzWeuF7dOd6NZTTvodsV6R/MFWE85f+oASd6GsWgX4P?=
 =?us-ascii?Q?zrFQdAKFDA0svm0ERAEN+RxfU03z4SrfgZF9kfw4ycxA0rVmUnL+5dLuXYak?=
 =?us-ascii?Q?M+Ic4taTMonOwu+gbCnkG9XTh/A3MIRluvhNeF3rTnSCannOfOa/ItGtkhgC?=
 =?us-ascii?Q?IMu3hGxnCIxzgrUWKxVxVUAqKjTG+F/4p5S0wUogU++GD7+ZXb7v2/dkRudw?=
 =?us-ascii?Q?vQyfSwVlP9/btjgUmO2au4rvCrZlZ4dGfQAYp0gt45CDvritegNBnnnFL3wE?=
 =?us-ascii?Q?7bgmlDuRDP8Izq3kEYD7GMbchIzOLN9ELU5XBTRZdbeganxUx73Y9sdLgaYm?=
 =?us-ascii?Q?xOfVQJFiRDW6qZAXIq/WebdlhMlNZ4zbmakwX7PN7eAmioky642p7ejKo1ep?=
 =?us-ascii?Q?3GJdjth7cYdEBXhurnw6ySA94R+kvdAcOxljO/iReupMHixX/3bdRqNxk+/J?=
 =?us-ascii?Q?R7uydvSqhamMIOUjcUaLTBQy8j2Iqj4xuc1zqhN8vsUfIETm73iT0S57WBAe?=
 =?us-ascii?Q?d2KWssYsEcMj/Vjgb0OHM8fbMGJg76wa9igDD1VI+9baWHd8T7Z2fKnlXpHT?=
 =?us-ascii?Q?cA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6266.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b88b4ee-4093-4d7c-1f03-08dda8258ecb
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2025 13:49:01.9078 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: InlpxmHnOGjMh/NeAU0uXuZQF+B/Dc0xVE6TQZ4BYspBAAIZQA0D9pmKbkF9d1J6k3Wtvj5pMIeMWSsFntJm6fwv0sIcUCX+J3cQDP7N6TY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7603
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
> Sent: Monday, June 9, 2025 8:35 PM
> To: Bhadane, Dnyaneshwar <dnyaneshwar.bhadane@intel.com>
> Cc: intel-xe@lists.freedesktop.org
> Subject: Re: [PATCH 8/9] drm/i915/wcl: C10 phy connected to port A and B
>=20
> On Sat, Jun 07, 2025 at 01:21:03AM +0530, Dnyaneshwar Bhadane wrote:
> > WCL added a c10 phy connected to port B. PTL code is currently
> > restricting c10 to phy_a only.
>=20
> This seems like it's a characteristic of the platform rather than the IP =
itself.  We
> should probably go ahead and break WCL out into its own display platform =
that
> we can match against rather than assuming WCL only uses display 30.02 and
> vice-versa.  Or maybe we can just update the existing PTL condition if th=
is
> function would never be called on PTL with a non-existent PHY B?
Hi Matt,=20
1. We could add the WCL as display platform. But for now, there is not much=
 reason to add the WCL display platform define for single instance. Thought=
s ?

2. We could not extend the condition directly with display->platform.panthe=
rlake && phy < PHY_C as it will wrongly select the c10 PHY type for the PTL=
 itself.
=09
	But can be done
		 if ((display->platform.pantherlake && phy =3D=3D PHY_A) ||
		 ((DISPLAY_VERx100(display) =3D=3D 3002) && phy =3D=3D PHY_B) )
			return true;

Dnyaneshwar,=20
>=20
>=20
> Matt
>=20
> >
> > Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_cx0_phy.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_cx0_phy.c
> > b/drivers/gpu/drm/i915/display/intel_cx0_phy.c
> > index 75caccb65513..59eee0edef79 100644
> > --- a/drivers/gpu/drm/i915/display/intel_cx0_phy.c
> > +++ b/drivers/gpu/drm/i915/display/intel_cx0_phy.c
> > @@ -40,6 +40,9 @@ bool intel_encoder_is_c10phy(struct intel_encoder
> *encoder)
> >  	struct intel_display *display =3D to_intel_display(encoder);
> >  	enum phy phy =3D intel_encoder_to_phy(encoder);
> >
> > +	if ((DISPLAY_VERx100(display) =3D=3D 3002) && phy < PHY_C)
> > +		return true;
> > +
> >  	if (display->platform.pantherlake && phy =3D=3D PHY_A)
> >  		return true;
> >
> > --
> > 2.34.1
> >
>=20
> --
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
