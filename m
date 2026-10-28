Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 305A1606A31A
	for <intel-xe@archiver.kernel.org>; Wed, 28 Oct 2026 05:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bnNnP2IV
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CEEC10E588;
	Wed, 28 Oct 2026 05:40:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A1C710E00B;
 Wed, 28 Oct 2026 05:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793166043; x=1824702043;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8QVIYzK9SdlRmnGBPueNzKy/BFwNaD7LOMsUnDKArFc=;
 b=bnNnP2IVP2+epODpPoK12oquWe4Mf6LibuX+QUW+j5YvaOQfT4wCF8GN
 MfPExZdI6g1mh/h62/TVA1E+w4tjaHfARgfTlYw5G+mCjt9UmQY91kyyU
 9dn7PKkArF82QZufusZYGir6wjBHMyA1zcL4uycl/MNX2VzZU72TAjJ58
 FRt5wMxV6kV2nI2qIFl4VJ8e6kFDW2M3KBjY/dujkow/R2W9NKS7JprpM
 eo1b2fxJSl1sMHo9mb3gWGFPGHp2YRribT4DXMla0LMNU2dhd0Qc6KvEq
 eogPZYhCAAOOtHEfbi0steMxW6kPPw/nZlYy9D+7xfe/1+08NmuY8L0YK A==;
X-CSE-ConnectionGUID: 1aHcykAVSIWUmfpPgc1SQA==
X-CSE-MsgGUID: V3lrn0l+RIOoeToUGS9v5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1771675"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1771675"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 22:40:43 -0700
X-CSE-ConnectionGUID: rDR+CIcwQa2ALLD1nx+2Vw==
X-CSE-MsgGUID: AsgVd1rWTOaod5VJs0ei7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="5083875"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 22:40:42 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 27 Oct 2026 22:40:41 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Tue, 27 Oct 2026 22:40:41 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.61) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 22:40:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ITC9Cz3LwPORmtTP5zgUZpnrfag248FMR+UDL25k/3VLSZKJTkOtWD5arLdTj6sBFuVJim+ZOD9Sal+g/UdTJBxwCBkwj3FbLjFqBk1kdsakV8RqeyZhF/xMYqnpmVlbwNpZCwcDHWr0T03muMGUcJ/ZGP7R68iyFh8ZGQ0e1BEr0WHG4lIWYfXwllomX62H0hbBFwfE8e7hvDfW2PXeJSX6Mhf4jAk4mszVErD5S8PySzVHpYHu4/xsE6xbR2BNWoS9TZTEtKPAhiIi51ZU2InBfv9i+vryOMHyIoNUnWKiHieKlDTpNauMI+dVGnrfUfvd/iNJw591wUEt69ZtNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Tar5KaaBq3BZ/C+RVoWZn3rXklCN+Wm0cnhpTOsi3E=;
 b=C4teZc3CZo5SYO158oy3faPantxQuOgVx+ECSa8McN1zfk4reldrYid0owEkN8s23sNRPhCqS1Hh5Nkq8X9hWeyC81g1wZ13Y95imRW968eIqA1VvZ5TbDPgPNWzvA985EeRnhrIMGdNH/IIxY38vl4rLQXyUYNhYXhNPs8KSOlSdRY2yBSEN770A/y6rPkcUEPb0WJg3TR00FQAfLy+s3TsAWCwwVOsrTbw1pgcCSqTtkeva6av4g1szMzX433xNbG4RbubQKDzeOrjbwTBXvJp1XwtcY5mAiO3VQdBVQB2YhJY36KoyyxJwZyy7wGgMe2qfn+Ky5UNCRDXebO7mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8049.namprd11.prod.outlook.com (2603:10b6:8:116::6) by
 SA2PR11MB4876.namprd11.prod.outlook.com (2603:10b6:806:119::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Wed, 28 Oct
 2026 05:40:38 +0000
Received: from DS0PR11MB8049.namprd11.prod.outlook.com
 ([fe80::603c:772d:6793:d4eb]) by DS0PR11MB8049.namprd11.prod.outlook.com
 ([fe80::603c:772d:6793:d4eb%6]) with mapi id 15.21.0546.021; Wed, 28 Oct 2026
 05:40:38 +0000
From: "Manna, Animesh" <animesh.manna@intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Shankar, Uma" <uma.shankar@intel.com>, Dibin Moolakadan Subrahmanian
 <dibin.moolakadan.subrahmanian@intel.com>
Subject: RE: [PATCH v3 1/1] drm/i915/cmtg: Disable CMTG after encoder disable
 in hsw_crtc_disable()
Thread-Topic: [PATCH v3 1/1] drm/i915/cmtg: Disable CMTG after encoder disable
 in hsw_crtc_disable()
Thread-Index: AQHdZSQaPFBM5Xh8F02+o5XXlDo3fLcRUk0AgAEg5vA=
Date: Wed, 28 Oct 2026 05:40:37 +0000
Message-ID: <DS0PR11MB8049BEE277DFA3E7DE3BE14DF96F2@DS0PR11MB8049.namprd11.prod.outlook.com>
References: <20261026082906.802048-1-animesh.manna@intel.com>
 <20261026082906.802048-2-animesh.manna@intel.com>
 <c3b14e8837b48b0b61923278974f80bdc70ceb9c@intel.com>
In-Reply-To: <c3b14e8837b48b0b61923278974f80bdc70ceb9c@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB8049:EE_|SA2PR11MB4876:EE_
x-ms-office365-filtering-correlation-id: 7391f4ef-9846-4147-1505-08df34b5fed6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|10070799003|366016|261022105027099003|261021121427099003|261021123027099003|261009223027099003|261022075727099003|10067099003|56012099006|261026140227099003|6133799003|18002099003|22082099003|261026121527099003|38070700021|11063799006|4143699003;
x-microsoft-antispam-message-info: SSbl0yxRdl8hHWtn0vlj2AZ45ys+GwpTOSyYfBnRhnGuVNbTUH+ZGggQ4o/Iw774wxhBMDEnCYz3dM1H1u1JCL5NiEZEbL6YYe/2+qcJU+sgRrq3vfatP+PHwLfFdvKcN2wqa+8h7S12i+REuwSvqv9sFiOVruZXF9GiINRDcr8/k+8+O9oVkUwr1wmrB+zMgghyj83LplNDaccszeE8wSNyoeHPhnkmU1O29YSP+PrNSR6KZsR3YCNuUugwAkiAoFtFgGPmdrelqv1GNzVyONByWWN1tV62OUZreAXYgwm3fMsCuDXHaljMCmePDuNP6VmIzMY2o6QRNHvb92K1CmTNV1qnWmQvVaD6I3HVcELwWLMhTYnwoV8cbVMhu7ywKz+mg8HjKVfOHTbIRXe3rCXIrP/UMYqbvTwp6l/nNuKg1gEmg6h9VshJdKLbuYiyY7fK8E3XIG9qeC9Ml6WdffsKsDeBs8IfHuD6tvMahfwjiW+KzJt4pmzZ7V7Ja66Ulz5wm6eFV3C4CG771IyFnzE9KWEEnEBsErlXfm9IXkceD0k2IFmNucEeWARUjjYeiRTjPDF98oh/2Uojj1ZPD5bs0DiNUb+dooNSGvaYVlGB8LEg/dXbW38QTg07z1/aeuO1kVwuiA+zxFyYwyQk1nK+jbabXO5fuxA3CsrsQMKqhpcIhYEvb2kdlLUUaPlYn81927N5pxH8zaYXyk2Zhbx78IDhmaEsJuZNB3E0rFM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8049.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(10070799003)(366016)(261022105027099003)(261021121427099003)(261021123027099003)(261009223027099003)(261022075727099003)(10067099003)(56012099006)(261026140227099003)(6133799003)(18002099003)(22082099003)(261026121527099003)(38070700021)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Ns3DhdBRyMYeriJqKmNd5d0D1vHJMwhdlJbq4SjeN8gDq1WI7m0myw9JIH8X?=
 =?us-ascii?Q?F5wEq+JXe7BhfKVcL/OyBmbJtQ2aVtZcM2puS8GeE+QEb8KMX9wyszuzs+8d?=
 =?us-ascii?Q?YocJfIK9P4++t3Ore22HTT/kN+x6jVaCM6t0ydBaiME0WOHMeLYeu6jLATGZ?=
 =?us-ascii?Q?vd6+ihgXDazWu+zCX+R5zq+huKI9+6cL0Iq/4NGsFDJNeD55h0IhoZB/n03D?=
 =?us-ascii?Q?ys1QcJVJIhfI+L7Zkx+khxHVfoUIEdNwOG2bBJJCVvvQRHkaeVEPxlG24a4M?=
 =?us-ascii?Q?Xebd4bF+lyKg0ZlsH5rCpL4sE2inJNIk2lZJ0bxAVQRNHKu64AT5kMc1JRT7?=
 =?us-ascii?Q?1x8oQGFWQxrUrvts9YVUc/AU03vBnKVIYZjWip9b7BC2UOva08w+4iji3n/j?=
 =?us-ascii?Q?klTpSb2C/2KRKPx2EI9RO8ngMNAujDIhrAHFHdEK10bXTLAl7GXvMmSGMoaW?=
 =?us-ascii?Q?H4jzizoTGw4xmRdO0dLZ5G7FYq/oL0MZtu0dRWDOi7Ow4fGInsyCmlyQ1vD+?=
 =?us-ascii?Q?m5LKOYeSj6Rg4bIiDY+XkPK88cYmfvrl5OiQ3PJS+L66V978rEgbBee4G9h5?=
 =?us-ascii?Q?7kyWO0Dwq/KfyR2f3Me75STC6tMAgjkg1X3wp7uNrymSdh3eUOpxdzylFu3K?=
 =?us-ascii?Q?ZklSb4rj8iOBDRJ38HP7CDzL20DsV0vwRPf7kFTc6nC8C6kVkxae4q14/6W/?=
 =?us-ascii?Q?D44gTf7EPH3odYVqRj2nTnOnYzScQj5qo0Iq4HP8dexfW05UXXleIMgsjDxz?=
 =?us-ascii?Q?SR/VpKiBwWrS+F4mzB3Jn+1VxpvrJ6/a8YjGcILh7VAXQjRHniK7Zrn6K8WA?=
 =?us-ascii?Q?7a4JZlESM68kdMZgmdtcpBC7TM6f0pVgmUKQYwfM8ra2SDegdTFMsgHpdnte?=
 =?us-ascii?Q?6Ng87y4WRjYeKz3tmSZrMl8ulKnHfq8wcnb+fBdCHUdQYXm4AuoBo2X7/6x5?=
 =?us-ascii?Q?8a5UOE01spOzsARo8GCgyBiC2XfU/ZAvPYC/dW7vsGpR71tr9Ku11MrvyRBX?=
 =?us-ascii?Q?5Baig8/JqjYAgaiw+3n/scW33jgZ8AXdRILoAUgPXr2C5cvdPwD3LUQJgsmv?=
 =?us-ascii?Q?/AUTVn/YvX9Toe/uYRgGHl/dvxZEnA0p9OCdm3qsMMK7NYdIN2W2sIl66H2U?=
 =?us-ascii?Q?MPbmPtMqGeTCks+3e3wOuw6VAAdrs7+thn2semYiSPWp9YDQWk2/6nKTm5Gz?=
 =?us-ascii?Q?J2T+hW0l1DqZ9MFYZxss4+lLM9E6clmh7+YDKFgH+AiPydNikPOf0KVavtsR?=
 =?us-ascii?Q?+dIYwB/vMaJajeyGe8vwyCR+of+cdV2OItrf7he6R7G5JYmLNQs9RHnPI63K?=
 =?us-ascii?Q?QBIngDWakPqHc/4U6+0GKYLRhvEU3DLlfLi0tQkXGllfnasVChrJCBwCB4UM?=
 =?us-ascii?Q?+bXq14V9SK3vJNoTxANnEdEJ5ZqAN/cuuDqFkqDDDoF3foqLL1SQljGotMQ3?=
 =?us-ascii?Q?gPOH0WdjWy1NLo1vKHm6iqkmyKLTPq8ZlVhY4ctskW0KTefX85flw4RiNUAs?=
 =?us-ascii?Q?4VoaVM/o7KJCPtagFvsd4cuHxRmLBFJekjDXNPRy9AiVnbUEX9WC/0GwsJsw?=
 =?us-ascii?Q?TooRkAmTjZAtJr14YYPFla2BBp60oAzbkisl4UbaErMWj8Z/cms1JTJ4Ian0?=
 =?us-ascii?Q?AyfYCMVs5+9RLG0HLKdYYLfP9HFVe4aab5hTKCSvRM7WEVOUNT4p0/vSFtgr?=
 =?us-ascii?Q?Acj1HT5iixgrsvG4/xuqSkAONOoT1LleqqIlFO1vg/z4YTuGa2zlfW9rjb73?=
 =?us-ascii?Q?BhssafE1xODET5sF+x1zTiJTf9zbMzg=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 4k5CsuOEoaI+Mdb7zPzTk3rwcjqarNFmL946Y65CFBkkmB56kHmWLuYx+NCFkc6fJrrPsLNVuZkjqgDYDqcJRfWikLsiLkk7NFt9KGHtzFLt3QCnSgW1jrASsaDNstSyxxskiVSYfwlhWQs08u0hT+ZuZNPWLCjgmuQCJeNKBaI7O4jrP3cUwZocHau5i6y4upEq9bgQbuCSZLW39xk4bQmnKv9oUDJkB98GBu5puRgIzNVW2IN9URlmQviDBqgZWsj9jb9dUvmvIfw6MUkmPyHVvQrTdurBEt44UljoH1GK3ilM4Jse+TkCgj6iaoWrZjMaP0X8QX0koZxUUTVOkg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8049.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7391f4ef-9846-4147-1505-08df34b5fed6
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2026 05:40:37.8151 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tvcB6x0qTTxlH0X+pSsKS1NGsD8LLG7FfiBBvRxHd/WSkbl+oWBDJE7ANuuJuauG2bdSYl9srqBk10aY2j7edw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4876
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



> -----Original Message-----
> From: Nikula, Jani <jani.nikula@intel.com>
> Sent: Tuesday, October 27, 2026 5:56 PM
> To: Manna, Animesh <animesh.manna@intel.com>; intel-
> gfx@lists.freedesktop.org; intel-xe@lists.freedesktop.org
> Cc: Shankar, Uma <uma.shankar@intel.com>; Dibin Moolakadan
> Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>; Manna,
> Animesh <animesh.manna@intel.com>
> Subject: Re: [PATCH v3 1/1] drm/i915/cmtg: Disable CMTG after encoder
> disable in hsw_crtc_disable()
>=20
> On Mon, 26 Oct 2026, Animesh Manna <animesh.manna@intel.com> wrote:
> > hsw_crtc_disable() disables CMTG at the very start of the CRTC disable
> > sequence, before intel_encoders_disable(). With this ordering, the
> > wait for CMTG_STATE to clear after CMTG_ENABLE is cleared
> > intermittently times out:
> >
> >   xe 0000:00:02.0: [drm] CMTG: A disable timeout
> >   WARNING: drivers/gpu/drm/i915/display/intel_cmtg.c:205
> > intel_cmtg_disable+0x331/0x3d0 [xe]
> >
> > This is seen with igt@kms_hdr@bpc-switch-suspend, which repeatedly
> > disables and re-enables the eDP across modesets and suspend/resume.
> >
> > Move the CMTG disable after intel_encoders_disable(), so the eDP-side
> > teardown (panel unprepare, ALPM disable, backlight off) has completed,
> > but keep it before intel_encoders_post_disable() and
> > intel_dpll_disable(). The transcoder timing generator, DDI buffer and
> > port PLL are therefore still running while CMTG_STATE is polled, and
> > the requirement to disable CMTG before the transcoder and the port PLL
> > feeding it are turned off is preserved.
> >
> > v2:
> > - Modify commit description regarding PSR exit. [Dibin]
> > - Add fixes tag. [Jani, Dibin]
> > v3:
> > - Add a cover letter with links to v1 and v2 for the review
> >   history. [Dibin]
> >
> > Fixes: c588a324183b ("drm/i915/cmtg: Add trigger to enable/disable
> > cmtg")
> > Signed-off-by: Animesh Manna <animesh.manna@intel.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_display.c | 15 +++++++++++----
> >  1 file changed, 11 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_display.c
> > b/drivers/gpu/drm/i915/display/intel_display.c
> > index afe70e9ce347..5e40487e9ab0 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display.c
> > +++ b/drivers/gpu/drm/i915/display/intel_display.c
> > @@ -1854,15 +1854,22 @@ static void hsw_crtc_disable(struct
> intel_atomic_state *state,
> >  		intel_atomic_get_old_crtc_state(state, crtc);
> >  	struct intel_crtc *pipe_crtc;
> >
> > -	if (crtc->cmtg.enabled && intel_cmtg_is_allowed(old_crtc_state)) {
> > -		intel_cmtg_set_clk_select(old_crtc_state);
> > -		intel_cmtg_disable(old_crtc_state);
> > -	}
> >  	/*
> >  	 * FIXME collapse everything to one hook.
> >  	 * Need care with mst->ddi interactions.
> >  	 */
> >  	intel_encoders_disable(state, crtc);
> > +
> > +	/*
> > +	 * Disable CMTG after the encoders are disabled, but before the
> > +	 * transcoder and port PLL are torn down in
> > +	 * intel_encoders_post_disable()/intel_dpll_disable().
> > +	 */
> > +	if (crtc->cmtg.enabled && intel_cmtg_is_allowed(old_crtc_state)) {
> > +		intel_cmtg_set_clk_select(old_crtc_state);
> > +		intel_cmtg_disable(old_crtc_state);
> > +	}
>=20
> A follow-up patch could move the conditions inside intel_cmtg.c instead o=
f
> having them inline here. Like, we don't have the conditions for
> intel_dpll_disable() below inline here, they're up to the dpll mgr code.

Sure, will float a follow-up soon.

Regards,
Animesh

>=20
> BR,
> Jani.
>=20
> > +
> >  	intel_encoders_post_disable(state, crtc);
> >
> >  	intel_dpll_disable(old_crtc_state);
>=20
> --
> Jani Nikula, Intel
