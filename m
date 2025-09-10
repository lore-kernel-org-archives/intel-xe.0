Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF391CA101F
	for <intel-xe@archiver.kernel.org>; Wed, 10 Sep 2025 18:28:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E23A10E9B3;
	Wed, 10 Sep 2025 18:28:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V1xdqn5D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1831A10E9B3
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Sep 2025 18:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757528889; x=1789064889;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/2mXIrtwRNPXAO6aC21tsTdgK3ciX1BmerMqpVH8RVM=;
 b=V1xdqn5DbM7l8A2LpO3bDt8cPG0bLecmwcfE6DCxZTBnAURL0G1p7FuF
 yX9zEfazilAKKBV3gLQO8MbZ6KozqQTAY9/yr+z5IW/QNRfsUlMODNTvQ
 JexfpN9vpJSTQZDzh13uclAlenBg6hEQmHGlMaFl8bT7FbuR03HP73jZ2
 2sK+2na+ywCDkKi7wxf5PKpFYGGTAI6lBukkJUfB1+fSWnnu/bxLMCv85
 82KawVo8AGDQ+kUCG8JmX7fE6U/6aZLpSVO8NrvO5S4ARz5uoemP8jWdU
 zAHcjbHeI0ihmaRSBVeZPr1PJ8xGTaQ6s7ravwoiceCT1rjjpsnEFYl3p A==;
X-CSE-ConnectionGUID: 54+AT+X1SWmEpAZoFxMYDw==
X-CSE-MsgGUID: 8901gNkqQo2lSAWiYCQGIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="70467485"
X-IronPort-AV: E=Sophos;i="6.18,255,1751266800"; d="scan'208";a="70467485"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 11:28:08 -0700
X-CSE-ConnectionGUID: PJ3BxPA3TqulkNNzNB/j9A==
X-CSE-MsgGUID: C86j/VtgRdqeYsiJ/cMHZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,255,1751266800"; d="scan'208";a="204467921"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 11:28:08 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 11:28:07 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 10 Sep 2025 11:28:07 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.70)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 11:28:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kfcSFqFhkxCJnlN3/hdazBPKZ2r2giEZEwFXgKrSww0hUZu0eWvjwbuwk4syPoUEdwhT1EJI0S/jWQqZC7UzhPX04NDc0IszBT8LWbPJ3ySW7eQz6JuEEZuxbqg1j8Kzg0PxeoXgzFG8iFAgS9Y6tM688R9ERjbFzYCQJCEtBfaSujGT1wusVdnaQeLrvMTeHwl2DgLcNsCfY9mLo4NPiRdEULo6Un1RCkjI56JkX3hjEg7W3N6Ng6fcxmnzUm0rHBuyzgV6ZFgPdiCM7IQUZI7XiN9Q3f/9G25E+1DShH2oT3xtBM/9QY8poUNQGotM7EvQl1jqCywb6vB7NlI9BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FSeRouPxpxE/LDmMKoXkm/iZx4OfiGzLPXhQBjfFrEc=;
 b=oYe0Ka1s4LiMHuhkanJur0avEhAjAkjxsqe7+LSmuVacFjgTdV14ZT5Ci96PARUQGHWrk0BQUvzOb9hrWS4/iia8rpJjCQZ4RaRbGUS2RYUeNgJ2hZuPepImjyh8Y/QnKRsyOYPgi8YgzXyYKeZvBuqIZyo6CtjO3b58JoMB25FjRYLZ+i8ozNk4bRz14Sq8A875hiuhqV0OGXOKyl85Y/rIaYEcZqtNSchSu7exmBXJvVlX2HPhT1a4KbTT9WnaICBamZiMf/n2LaaP28vsC6kMzoeanXVoSMeluUq2YyaTT8sOBIN8uXiuqSt41W74lT+e5RzUEZ7VbULoh5uZbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB7539.namprd11.prod.outlook.com (2603:10b6:806:343::6)
 by BL4PR11MB8848.namprd11.prod.outlook.com (2603:10b6:208:5a7::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.18; Wed, 10 Sep
 2025 18:28:05 +0000
Received: from SN7PR11MB7539.namprd11.prod.outlook.com
 ([fe80::75a5:f8d8:935f:d968]) by SN7PR11MB7539.namprd11.prod.outlook.com
 ([fe80::75a5:f8d8:935f:d968%5]) with mapi id 15.20.9094.021; Wed, 10 Sep 2025
 18:28:05 +0000
From: "Bai, Zongyao" <zongyao.bai@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>, "Summers, Stuart"
 <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Lin,
 Shuicheng" <shuicheng.lin@intel.com>
Subject: RE: [PATCH] drm/xe/xe_device_sysfs: add cleanup action in
 xe_device_sysfs_init
Thread-Topic: [PATCH] drm/xe/xe_device_sysfs: add cleanup action in
 xe_device_sysfs_init
Thread-Index: AQHcHq1ftv3awGbUkUWPdrwkeAulfLSFNJSAgAWbxwCAAfGAUA==
Date: Wed, 10 Sep 2025 18:28:04 +0000
Message-ID: <SN7PR11MB7539A964747AEFCD111026A9E00EA@SN7PR11MB7539.namprd11.prod.outlook.com>
References: <20250905213738.2936785-1-zongyao.bai@intel.com>
 <b846e886fbcacb1265a408c8e077a842971e9c1c.camel@intel.com>
 <3tkvzv7krbeuofuew44zm3ibenlntqkfclueq3soazkagwkezg@wtdhq4yvengu>
In-Reply-To: <3tkvzv7krbeuofuew44zm3ibenlntqkfclueq3soazkagwkezg@wtdhq4yvengu>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB7539:EE_|BL4PR11MB8848:EE_
x-ms-office365-filtering-correlation-id: 0e772588-30fd-48ed-9c3e-08ddf097c866
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?Wmpb0BhvJe/5W41eeSuDf2W01TxTpJnsivWL2TTnIMfEHQJKX8LncWgtyc?=
 =?iso-8859-1?Q?WXJ00bpafB/zHtferOI5BrX9Rc37iBGA0zR4In+XvijF5oMm/xI096/DOv?=
 =?iso-8859-1?Q?+Qx4B6rGLZqnlzdVQ1pKeruA75tQvxPVTiEmC2JqU5X+79N4U5ZQhRBY3o?=
 =?iso-8859-1?Q?+ANjh+0Tyv+zvhof2FJ5OJ3Q1oPik6TzfUAhDGC4OPYMKWG6Ib6hqYOOKr?=
 =?iso-8859-1?Q?HIFAkxnpCsojoQ5cHUpMJza7YU7/Ybo6dEbE9ZAXsBudOUx6ezpeBFEbqw?=
 =?iso-8859-1?Q?vQIQZE5eipadd+3WeT9eNYfjI7gtdjcII97qJ3zwB/Xqxg8EN9YO9jNjSB?=
 =?iso-8859-1?Q?SHOO8zYuXJKRL3Rj2/PUE2RsKymfFz4YXqSC+ExRd+wXgIwvlFp0gv0jvX?=
 =?iso-8859-1?Q?qCndZyleTZcEBRBJFxZn6ENZR+lgmKyvVLpLUxpt0lhsId2B/X232gRgzT?=
 =?iso-8859-1?Q?RSY5b15BOONO++iaqDitIKdtCtWqc8FqB8E9Nd6tqRnTncK/pXUux72GE6?=
 =?iso-8859-1?Q?rasHuMboC2/OjQWYnHVcAljPHo5M/q9TjVeG/dfFZDcqGvtqRf1ktFRI2c?=
 =?iso-8859-1?Q?v0gO7X0ggtI1h//aAB588Qu7Hi4NHcnyNDcZ+azD/EC3s5IjfLcl1xHboC?=
 =?iso-8859-1?Q?YEn10Vs9bTIjhJHYPRrc7EdY9/eiL2Wjayvlmm5QTVGvsKf60xMmuZlRTx?=
 =?iso-8859-1?Q?J/En66x3X9ogJULPv/9jia5yIO5Mm6RhCIOgzoDm3PThSrhQGdDHVUPdCH?=
 =?iso-8859-1?Q?cC/Pka9wo9rNT6rCkFQQPcdez9kRFOG3Js02oaxOwcxgPtdMx9J5YY3JJq?=
 =?iso-8859-1?Q?1lsdQgoLVk/hbobkf1g1SLvKeKksDXS99/POcd4cz6SxK1ZGVRCdV/djEO?=
 =?iso-8859-1?Q?zgZdA07FDMdUkN35orI1wxtDl/GNoxa7dpekV8TTIVNLjLT48gIkVbPmjP?=
 =?iso-8859-1?Q?rycqEIxbye3iqMg/DQU+xgiui/3LNwqv3RzfkoOMJVNMRTdH53L1WIrHHa?=
 =?iso-8859-1?Q?IceSNWZOtw4T+M1CIr165X/kTltEPQ6GMHiwVblggpxROyEWiTKhvBMbUb?=
 =?iso-8859-1?Q?XHDUXSbc8vAQcJW8cOzOBVe6AXL3gRqWYVZ/B7pTvYFA1gUFeLgsdEseYL?=
 =?iso-8859-1?Q?+IulyOTK7/eh0MFVuwUOdL5fAh1dlKMNtAeheVgfEDb4tPid9GBKcgT+zr?=
 =?iso-8859-1?Q?U+YDtyGaluk4PT1EEViNC9KZDo1vQUtYjS2w2Z+51JFthB/i3ZWpZVVsrs?=
 =?iso-8859-1?Q?7GyPoEwilQhhNRvwvQOzFzZ/DbGaB49DCtR14xgcKogy7u5OYnrkVzAvsF?=
 =?iso-8859-1?Q?fvT7fQ7bpaaB5LBBKtoaPYc6p1vvbE22hWCr9VjOl4zx00pL8pqJHy/v6i?=
 =?iso-8859-1?Q?6e0VaPIuGT6A4lk//kymuTJWAjOqkroRkHcW7ROrNVjFge4Y28qn+IDz3Y?=
 =?iso-8859-1?Q?mRu/VhtVxzwh1oHj5yg24Kn4qA73s6DBvPxINlWU6mWKRd3fAwEk2LMrCu?=
 =?iso-8859-1?Q?T7tFRVWCMxG8PvUrfj/lHI+YuxwxWJT0GARGQ4bKPN4CB54OsZGhjM44Oy?=
 =?iso-8859-1?Q?kqCQVig=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB7539.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?FWW+WrNB4MWAirvkgM9B6gyJDDUSmjamdqidjIce4SzaYGwXYC6WrstvWt?=
 =?iso-8859-1?Q?AVE0EGe9lhgHqyjbbNPKAQwhliGX0MffBy7xXA2X5poIbDpfYtzWUkIqq2?=
 =?iso-8859-1?Q?uOqs6DNwF/JXOYAQKF5JwOeSxwMdBU4uPwOTaZAZAYkiAfyGdn8LkrZl/B?=
 =?iso-8859-1?Q?5UR4GIPB/c+hQaxSHIINCwwITiNK6lsZLtk27mKD+njGspT0LrEByLZCx3?=
 =?iso-8859-1?Q?nR6jwiDmaCHt9xjv3nZK/ufdqsYtv6OGDLdXZ2M31/VWlGDe6Kzf9VdQVB?=
 =?iso-8859-1?Q?riTSbx/m1jy/xV0jvJIzj6T06qhq/62fooC1KLe4YkmHjdRNMHRxTL/koE?=
 =?iso-8859-1?Q?fArMp7HrQxhkOjZNoJ2yIXOalDzPWbZpK/q5ETxL0355fR/uxtMaqetD9x?=
 =?iso-8859-1?Q?jl3MQig4qhDkyljqFKaMURR7gYMV4hihfuPHCihQkgxXeau7ok5JJk2dbK?=
 =?iso-8859-1?Q?bscUVqqrk3G8bJFzDJKKTTNiwlkVh4CO+Lemie6oQzufvHzahKUdz1DUJB?=
 =?iso-8859-1?Q?JcefEfEwC1Bc3yq+/zNSA5uOXkMPVHkipskjZnXj7v7V6/gxXPE1Zww4vG?=
 =?iso-8859-1?Q?fHixzB6oohnHMi0sVHxZfNsacC185fEWCuLc0vBJmRUaIPp3T18hfSF22w?=
 =?iso-8859-1?Q?2esRmF+w0WMUekJVLeP8xEa1hBpA5pu/T51rle7V8//XGBGPGyEC4thQnw?=
 =?iso-8859-1?Q?Vqw/PksSKHXNb8Ez5ARKiKLbRWTW9URWOvRlKy1Fian5KmlxHSI6Yry8h/?=
 =?iso-8859-1?Q?KEi6RRBiFJQ2wqVW27OenqCyoRUeotF5hxwMUGnWdZutA8R8hD0PTElPHj?=
 =?iso-8859-1?Q?4WJ1ZDjqLX9yycMAYG5z4kOngGXSojNo4A4RRRu8N7eXGuhDcL2FDUVjbj?=
 =?iso-8859-1?Q?SvlgsQfJQjcX9jiP5OG3VMAIw/HkPQAIdwOovGEuNR3MDw7zua8fWWIFx3?=
 =?iso-8859-1?Q?m0UResZM5qczLP2gduHwzXetHEfBgh4kPXrOhTkN0SvMXzvgkS/Ss5QnM4?=
 =?iso-8859-1?Q?JgY4Jh9fLRmxoP5EtT/0BVp3wGHsGrFA+wJv1vUeWohMmsoMc9Vxkkyfpq?=
 =?iso-8859-1?Q?Ovurb9g1x3VhByHhzg7fEklvgLiOzHZixOBvS9KIKUKmZzoe1Nx9wEcSow?=
 =?iso-8859-1?Q?yissyULFCjE3eaZHsvTtfcgEYFgndl+EwLpbu25CqAYZCBNQ0pOmyDKfD8?=
 =?iso-8859-1?Q?/K1Es1rhvy4BM3hlpENuYD8mMHt+UhleLOaI7NX8tGitusT1p794sxrUwv?=
 =?iso-8859-1?Q?6s2UPRar8VbZZAF9xyoOWl1VDXfrPaVt5mSCnjlLA+2cheqw6HVloBUTLb?=
 =?iso-8859-1?Q?QkCzjT0ac9gvX6KwowuKgcm5xETjeIey9JyE05PORjHkLNw7qJWbzCuZKT?=
 =?iso-8859-1?Q?lslRVa9+Mq1mfPp4bm0Ep6ogi0crbYWyFCXwJPZVQagyiu94jcFxbyngYm?=
 =?iso-8859-1?Q?BEsepJb9VT7d2DKNpLAN2tNo2wZLWDrswJ9/kddo2tE+uHpsZ36Yuawkr9?=
 =?iso-8859-1?Q?3S7CXK8atJQq0BMvhsyfCX8T35V+9gj7P7xggIjYSYO7by6Uxkv+UxgBGR?=
 =?iso-8859-1?Q?w//e8r6RvQqU9Q/fMDI54kvnngJg1FCOVC6+ypGw9ftRvQyHiFj8idhffy?=
 =?iso-8859-1?Q?kukniK6ZXmUvvv3jlQvDIjqXpEsmYU/XLo?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7539.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e772588-30fd-48ed-9c3e-08ddf097c866
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2025 18:28:04.9163 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SB5HMOzs3h6J7tDAwrvgOQpzilznHO6ofE2HeE/CUBLBRqzrI++Y+R5+c9BHaN1jt2ZETj+lssspszm4cfDITQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR11MB8848
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

On Tuesday, September 9, 2025 5:40 AM, De Marchi, Lucas wrote:
> On Fri, Sep 05, 2025 at 11:01:09PM +0000, Stuart Summers wrote:
> >On Sat, 2025-09-06 at 05:37 +0800, Zongyao Bai wrote:
> >> xe_device_sysfs_fini(): switch the order of late_bind_remove_files
> >> and sysfs_remove_files to follow the rule that files create latest
> >> deleted first.(LIFO)
> >>
> >> xe_device_sysfs_init(): on partial failure, any sysfs files created
> >> before the failure will be cleaned up via xe_device_sysfs_fini,
> >> ensuring no leaked sysfs entries Add function description comments
> >> for xe_device_sysfs_init().
> >>
> >> Fixes: 0e414bf7ad01 ("drm/xe: Expose PCIe link downgrade attributes")
> >
> >I realize the exact line was added in this patch, but the late binding
> >patch is the one that introduces the ordering issue. So I think you
> >should mark this against:
> >commit cdc36b66cd41d0f6e18e86d7aa50554c852f97e2
>=20
> But the order itself is not the real issue. The real issue is that commit
> 0e414bf7ad01 ("drm/xe: Expose PCIe link downgrade attributes") started
> leaking dev_attr_vram_d3cold_threshold if auto_link_downgrade_attrs faile=
d.
>=20
> We could rather group the attributes in a attribute_group and use one
> function to decide if attr is visible. Then there would be just one call =
to
> sysfs_create_files
>=20
> Lucas De Marchi

Thank you for the comments.
Agree attribute_group is good solution.
But I am not sure if there is a potential dependency between these attribut=
es.
So, I prefer to keep the original way and keep the order of creations.

Zongyao Bai
>=20
> >Author: Raag Jadav <raag.jadav@intel.com>
> >Date:   Wed Jul 9 22:12:24 2025 +0530
> >
> >    drm/xe: Expose fan control and voltage regulator version
> >
> >    Add sysfs attributes for late binding features which expose bound
> >version
> >    to the user.
> >
> >    v2: Rework attribute and macro naming (Badal)
> >    v3: Drop fancy formatting (Rodrigo)
> >    v4: Form version string using local variables (Rodrigo)
> >
> >    Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> >    Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> >    Link:
> >https://lore.kernel.org/r/20250709164224.2676086-1-raag.jadav@intel.com
> >    Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> >
> >
> >> Signed-off-by: Zongyao Bai <zongyao.bai@intel.com>
> >> ---
> >> =A0drivers/gpu/drm/xe/xe_device_sysfs.c | 22 +++++++++++++++++++---
> >> =A01 file changed, 19 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c
> >> b/drivers/gpu/drm/xe/xe_device_sysfs.c
> >> index 6ee422594b56..27b6d90a0009 100644
> >> --- a/drivers/gpu/drm/xe/xe_device_sysfs.c
> >> +++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
> >> @@ -292,11 +292,23 @@ static void xe_device_sysfs_fini(void *arg)
> >> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0sysfs_remove_file(&xe-=
>drm.dev->kobj,
> >> &dev_attr_vram_d3cold_threshold.attr);
> >>
> >> =A0=A0=A0=A0=A0=A0=A0=A0if (xe->info.platform =3D=3D XE_BATTLEMAGE) {
> >> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0sysfs_remove_files(&xe->=
drm.dev->kobj,
> >> auto_link_downgrade_attrs);
> >> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0late_bind_remove_files=
(xe->drm.dev);
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0sysfs_remove_files(&xe->=
drm.dev->kobj,
> >> auto_link_downgrade_attrs);
> >> =A0=A0=A0=A0=A0=A0=A0=A0}
> >> =A0}
> >>
> >> +/**
> >> + * xe_device_sysfs_init - Initialize sysfs attributes for the Xe
> >> device
> >> + * @xe: Pointer to the Xe device structure
> >> + *
> >> + * Creates and registers sysfs attributes for device-specific
> >> controls and status,
> >> + * including VRAM D3cold threshold and PCIe link downgrade
> >> capabilities, depending
> >> + * on device capabilities and platform type.
> >> + *
> >> + * On partial failure, any sysfs files created before the failure
> >> will be cleaned up
> >> + * via xe_device_sysfs_fini.
> >> + */
> >> +
> >> =A0int xe_device_sysfs_init(struct xe_device *xe)
> >> =A0{
> >> =A0=A0=A0=A0=A0=A0=A0=A0struct device *dev =3D xe->drm.dev; @@ -310,12=
 +322,16 @@ int
> >> xe_device_sysfs_init(struct xe_device *xe)
> >>
> >> =A0=A0=A0=A0=A0=A0=A0=A0if (xe->info.platform =3D=3D XE_BATTLEMAGE) {
> >> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0ret =3D sysfs_create_f=
iles(&dev->kobj,
> >> auto_link_downgrade_attrs);
> >> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0if (ret)
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0if (ret) {
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
xe_device_sysfs_fini(xe);
> >
> >IMO it would be better to have a goto here to the error return at the
> >bottom of the function. That saves a line by combining the calls to
> >xe_device_sysfs_fini and moves the return to the end of the function.
> >
> >So:
> >	ret =3D sysfs_create_files()
> >	if (ret)
> >		goto cleanup;
> >
> >	ret =3D late_bind_create_files()
> >	if (ret)
> >		goto cleanup;
> >
> >	return 0;
> >
> >cleanup:
> >	xe_device_sysfs_fini()
> >	return ret;
> >
> >I also see the sysfs create/remove functions within the late_bind
> >routine are in first in/first out order. Should we go ahead and fix
> >that here too?
> >
> >Thanks,
> >Stuart
> >
> >> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0return ret;
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0}
> >>
> >> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0ret =3D late_bind_crea=
te_files(dev);
> >> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0if (ret)
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0if (ret) {
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
xe_device_sysfs_fini(xe);
> >> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0return ret;
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0}
> >> =A0=A0=A0=A0=A0=A0=A0=A0}
> >>
> >> =A0=A0=A0=A0=A0=A0=A0=A0return devm_add_action_or_reset(dev, xe_device=
_sysfs_fini,
> >> xe);
> >
