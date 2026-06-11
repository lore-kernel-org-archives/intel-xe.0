Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 602F4CD98D2
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jun 2026 10:56:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14FD310EE74;
	Thu, 11 Jun 2026 10:56:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gcINESEU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A5DC10EE74
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jun 2026 10:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781175362; x=1812711362;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vDYAfl6NprSokms4tfHD/aOoiPUplt0mkDGjbMyu7B4=;
 b=gcINESEUCZR5t9eAAJ3wFpr2r+4OiA+Uyqp0q9xNEGpGm78NP+Bb0jjM
 mJfw3XCn8wtRMOOiILWe8JazVesjH2D/FHY4T+0OaHflQqK6sPccLv1JU
 oKraUThB0U2wpnxcMh0WKz3I9Wce4b0BUierItIykPaT9k2+sJv7mKCZw
 0Tt2PYLyMYyGY0vEOMXwNJg1kd8XoyCdlF2hdqDPufwE5Mbu+AbfA+GuZ
 ZWNqfTCvdJoR1IWUw8BYJF0OT/m6rYftJ3iEaJUivq9ls4AoTcCTydas5
 LgPT8dU2VOBwGWXjAw4sgWQYFdRqafh1Pvr0DPsIo9VsbhQrit8YRVBAB A==;
X-CSE-ConnectionGUID: mr+9rQp1TZ+Z3RdrrzVuyQ==
X-CSE-MsgGUID: 9iKlgGcbSRqyubTYEqmdEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="69529818"
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; d="scan'208";a="69529818"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 03:56:01 -0700
X-CSE-ConnectionGUID: AthboBl6Qt+MNOIKxKix8w==
X-CSE-MsgGUID: Ncx59s4KT92uNLcvNAJmVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; d="scan'208";a="284525648"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 03:56:00 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 11 Jun 2026 03:55:59 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 11 Jun 2026 03:55:59 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.70) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 11 Jun 2026 03:55:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F5smeD0rXpVqLrDxSjsxkxJLZru02KoL7vZ99ULTtbNORpUr/v30oFDSU8AhATUxHvJZRkfIjjJZriM/oDsVY66GsLVXnBxK4aFmX2HXmpBMeOh0CwEMniDhc5fsjaT4Ih5YhfnrAW5qjKhyUeiL6f5YLZttL1hNFUewnlam+SQvFoe8Zwkw4yVdOIAk3lTqToqx6zNMS4X3OXlLtzels48QoNlVXfPWObqguvNL592CRjuuimKpgowG2skHnOFg0mNXleqwBh62oHWC8otr04K4I+m2t96RfimZwUOm8CsgfPkyO9tNiUyGySeS0knq1W3FM/7fnt5jCd80i1TxcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7OaeUWEOFnC15to/z8JzU3jw5jUHsMShiZ8aMQUBDj0=;
 b=aac4sIBFbcbdM2Af6JLfy/NjIMOk5wHN3zJI9cB6piLZdibH40UTmd5U6yq2ZnGVkBxYZuEvtS5jCmtClv8tJOT57SvK2lnLRhq7lSyXby3vYmXyMNkHhasCdQY9R6fn5v7VZ71A+UbuFhauplXcUjb+qObemgZQJjVD+Rf0mQzp1zypy+c/NNpG6+y6S+0bBWbPkWo0Qrq8kFTvfk1rta21QEEDrGw2c4yf9vCyrAukve3Efjuv/LPYm3uRh1U1mdcQWJ7XZyjQgD7jVbxv8LtUxJFr7b1nYHH312KZB2S9a09e6XIiYUbmkfPIghcN/72fq5tYo3F/Yl8NolRyhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8718.namprd11.prod.outlook.com (2603:10b6:8:1b9::20)
 by CO1PR11MB4788.namprd11.prod.outlook.com (2603:10b6:303:97::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Thu, 11 Jun
 2026 10:55:57 +0000
Received: from DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c]) by DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c%4]) with mapi id 15.21.0092.017; Thu, 11 Jun 2026
 10:55:57 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Souza, Jose"
 <jose.souza@intel.com>, "Mrozek, Michal" <michal.mrozek@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost, 
 Matthew" <matthew.brost@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>, "Auld, Matthew" <matthew.auld@intel.com>,
 "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>
Subject: RE: [PATCH V11 11/12] drm/xe/uapi: Expose ban reason in
 EXEC_QUEUE_GET_PROPERTY_BAN
Thread-Topic: [PATCH V11 11/12] drm/xe/uapi: Expose ban reason in
 EXEC_QUEUE_GET_PROPERTY_BAN
Thread-Index: AQHc9OhdiHf94t/DTkaXwgqtITCRrrY0tXIAgACxLoCAAnWPAIAAFkaAgAFBS1A=
Date: Thu, 11 Jun 2026 10:55:56 +0000
Message-ID: <DS0PR11MB871835057D993500ABBB8412811B2@DS0PR11MB8718.namprd11.prod.outlook.com>
References: <20260605123839.236021-14-tejas.upadhyay@intel.com>
 <20260605123839.236021-25-tejas.upadhyay@intel.com>
 <543ed281612b0f8b1cd289448ae917896f18200c.camel@intel.com>
 <aidgZ1zsihvCPGqq@intel.com>
 <DS0PR11MB8718ECA4E0D9067E4C41EE51811A2@DS0PR11MB8718.namprd11.prod.outlook.com>
 <aimDM0CpapzxZP9n@intel.com>
In-Reply-To: <aimDM0CpapzxZP9n@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: jose.souza@intel.com,michal.mrozek@intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB8718:EE_|CO1PR11MB4788:EE_
x-ms-office365-filtering-correlation-id: c82f357e-ce44-49f0-c8ab-08dec7a803f8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|376014|366016|23010399003|38070700021|18002099003|22082099003|4143699003|11063799006|6133799003|56012099006;
x-microsoft-antispam-message-info: q2hZPtWKMMxxqtv3gbRCRTjWP1KYvoZiQcsezX6DxbqBGf9OyIprHRip9u/iCCSih01Bm6uL547IX/7BP778FpdHbWSnPrwx8hac90j0Ms8PUkURVDhGTNxS/jJlrukDPaRUvJSo2lgWADfpHrufU0uhcP7GlrWfZgWA2RXQy3duJHBGdDjhOf7EmJny+eDuZYgC0XRXZxYBzo4L7dmkwW00FsbLfKqnk8Mg3/1MV8D8Wc3Wx+6OJLIUabfU9vmQ6Uk7XRE75VrrMSxp2ZGCrwZINWvqnqb+QgQdIL65CUwQWNjdHilR4AK+2ufbEM/gIBo37k/tJdOucusknZlNlAuxkp017jo7CliIPh9sscTNj5RhchhmNBQ9VQbvA56kuiDiqd2pUnU4dqeXatyNKyDaqRmEjP2c7/JspBE3A7eXNrx2Bu0guznmu1xuGKO9SEHZV+Yaj+/GavYcZ8zivfkATfhJPr+Rp2oJcC2eNRNHpS6kt6kjXCZ9cN+NTpXP+Yky4UtlEc+SYoKhXVlUQjA91No4oIg5kKwO8FM30NpCkHxm40ktHJYcuDj46fb0rwQTnYwDrHChpb8wpd6cYAb809RNf4HsF7JRKbYlmgtKb92Ur5J8/gddQf+mKRhnoFGL6FkGPgDmTaJF1hk9J/Uzu3tazXN4yRjfxKXIfApqbel4awiWYj4YLCc67ssu1duoljyoruVI1qbbYNqY1g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8718.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(376014)(366016)(23010399003)(38070700021)(18002099003)(22082099003)(4143699003)(11063799006)(6133799003)(56012099006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?S8Iy5irIgcD7gH2BpYZSQsfjZLti2WESksU9L26W7ncO4JR4xVdAbJRsrl?=
 =?iso-8859-1?Q?BWbfxd1pCY/jT5CTCW1XYBycl4Y1q27FK1Vk8pRk+8mnM50yBsGOTdRgT+?=
 =?iso-8859-1?Q?PtAfY4z8+6heMfihj3HRlcnOQY6aI9lSUuHSZTGL4xrXwbQtEZyj8QHq5W?=
 =?iso-8859-1?Q?FE6bLI+k5VnI7nGRlIHa0Zin8H7RxYnlc5XNUZpdsIk8UURbLZjjIiQcqx?=
 =?iso-8859-1?Q?Stv8upjLOI9cNdZVeIBX7YhrYS78vMbGV73qYz1N4laiWsnbXbezyaBsbZ?=
 =?iso-8859-1?Q?9u/qoYwazcV0bhN09Xa8pRRW1W2g0N4pk3j04Pz/LYYuiG2UMkaoNkVzrK?=
 =?iso-8859-1?Q?FmroC5yZWQU+cfSPwKoQ2ToTSiNy8LgNCbhIH5uQi1JBEot1x4eko53CO9?=
 =?iso-8859-1?Q?Dg9iO3gi6EBHRbusgpEJrG9zj5qS+N+hukEBDE6T8jGxAdVDnOmoTOxbQz?=
 =?iso-8859-1?Q?6hHJz9koV1jfi74Ek7yuEMzBj/7V4+LIQkYP8ky7V0GoM9+IcZJRyVyWv1?=
 =?iso-8859-1?Q?aULZfLpmqNQZ9B0M9fJeHUjAwPIWzWtSCj/D8UADGZYCOB3CnTJWLfyr1J?=
 =?iso-8859-1?Q?Gr6ThKau5kjsGbQatpqcHTmom/n4t7GCq5rgxKrw83eX4c+EW+GTNwjIRb?=
 =?iso-8859-1?Q?wqWiTHNV+vEn6TGGm/LeY0u3OOSc/xr6vHCWrLMlJYeB2Cyh3SOixSKOBh?=
 =?iso-8859-1?Q?1oaSjagXuZXtO1LM04GRQXERaSHbXr8LKQeixjsWsc7eacCJorrstA9NVx?=
 =?iso-8859-1?Q?V/vBcG3GRdk6EvL5IXeNd/1rv06qmVzWEZkTEBUuyzOrzdDrANxxP+H/TL?=
 =?iso-8859-1?Q?n5VP/zHNb1xW216wmUdRsz1TNyysZMNn8IXuZrMKH2cUtU2DEvxYFHERLs?=
 =?iso-8859-1?Q?QZyBY0/5ULuxd0INelQ4lTIU5EF8/UhJZbZH5Mvuh1CMLzM5pMPGTaPRhn?=
 =?iso-8859-1?Q?0tunSpV0L5htJni7yx6qnH7aJm0ayhl3T5e8ru46Oav/Tnq4u6khjt9kVl?=
 =?iso-8859-1?Q?kXfSmcoN8JpfyhGWL+Q7PNvQIwWxzgPcGTXRzQRIiUw/+r0nQ4BCog+9CQ?=
 =?iso-8859-1?Q?ofZEgNalRfnmwWeRw978loL8512o2Hqg1KdJ6ZHnuJAsvIQL9HZ9sj0EpU?=
 =?iso-8859-1?Q?jBNNqwVBVHBBGUdk0J12b0XSX53ONQ0pEgfKzAzVPbgvFaH0vJ3KEMoAH4?=
 =?iso-8859-1?Q?8q9XsWzVjgigL6Wk6BgX6qcFyPmvn9WIcqM8apbrP3tBcwPA5byKRyEY/B?=
 =?iso-8859-1?Q?RQVUQc2+sj+V6xIHMZ0cUqyg61AlD0EhTDUJ0FVGPFaeilGE9FSETolLXq?=
 =?iso-8859-1?Q?h3Lg/o5Q/EU6W+0F9t3IDIPBF23l0SbM6aZmBA+ElILYwlPzLEh7rLCKAY?=
 =?iso-8859-1?Q?MO1Wx2LcGRGIcI6X0xkdA0f6AWDl56rXiaAvOjPuA9q2uPuO9v5RnzdgfF?=
 =?iso-8859-1?Q?U8kNubFZE1NW27KtdqzW9uKZI/jH+09lzY1Z+qO0dDClGSGk79GxHUaDy9?=
 =?iso-8859-1?Q?2BjjEVfri2fKvNRHx2wUwed/ggDHwoTwa1cet/7Oix0OIceAMw7x9/PD1B?=
 =?iso-8859-1?Q?59Cq+vHTHPLAEv4CiJWrK0m9vFo5i1AKlo4eURuf+fiMF2wzmc6WEnB4Qd?=
 =?iso-8859-1?Q?cmWB6FXVbM17sjqwUTBcL8IgYunE0zP6uXWdMOo+Tj3+7nN+XdIRjpyTzm?=
 =?iso-8859-1?Q?y9emiLiCGegRRThU7ZNm3uuZ0wKLGMRaS28y+SYsxeMl1xiSSwzNUqKIbD?=
 =?iso-8859-1?Q?UVF5y87pTqwvGJQnhL5HDvlxCNj813p/IMV7ULQXJ7Y5zSCba0drOCNqN6?=
 =?iso-8859-1?Q?NQ8w//PBvZqKGTHDQ8xLeXv1HX0Lh9U4aTWBo456SDFFfcTFStkR8ZBhxg?=
 =?iso-8859-1?Q?rv?=
x-ms-exchange-antispam-messagedata-1: 08IadZUaE17mOQ==
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: GWlXvY4UrXM1WQ66TrV4JhKyquJ7yrMoYQhrrzzsr11CFbLYzy+7Y5xfRpltlhh49bNaNdDs+5HNKu/YBct2kbVTv8+AXklm9ebkfdEHaeMkKGkaBaA816SnieDdlzIDKQQEHaXcZi43lI8BGEN60rxwvEIUPq/OLpoKV/JxC62tXVoXzHIdxcYSGEogB4RG7ZUh86jZfgueyxXzHknvfs6l5OFlMvva2ZtKGQGmmrbyiXUknguTILuLYbZWSWrQ+cYdZyImqehfZ+ZaLt5Z1ysKjpaIbtSPy8NWPFjRCm/aTA5YpEypgjEA1vZmYqn3ebUpMLZ8m1LnVqQsr6qF7g==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8718.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c82f357e-ce44-49f0-c8ab-08dec7a803f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2026 10:55:56.7843 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /Mlf+N4Hm65vY3XU4xaAGvx7OiSAyUUekMtyNeaWFMs+9mMHMwIS2ztWyE/49WavxSPu00GbVm80cHRvEWGLcTo/QKgCU+FzccHkILl3CdU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4788
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
> From: Vivi, Rodrigo <rodrigo.vivi@intel.com>
> Sent: 10 June 2026 21:01
> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Cc: Souza, Jose <jose.souza@intel.com>; intel-xe@lists.freedesktop.org; B=
rost,
> Matthew <matthew.brost@intel.com>; Ghimiray, Himal Prasad
> <himal.prasad.ghimiray@intel.com>; Auld, Matthew
> <matthew.auld@intel.com>; thomas.hellstrom@linux.intel.com; Mrozek,
> Michal <michal.mrozek@intel.com>
> Subject: Re: [PATCH V11 11/12] drm/xe/uapi: Expose ban reason in
> EXEC_QUEUE_GET_PROPERTY_BAN
>=20
> On Wed, Jun 10, 2026 at 10:17:26AM -0400, Upadhyay, Tejas wrote:
> >
> >
> > > -----Original Message-----
> > > From: Vivi, Rodrigo <rodrigo.vivi@intel.com>
> > > Sent: 09 June 2026 06:08
> > > To: Souza, Jose <jose.souza@intel.com>
> > > Cc: intel-xe@lists.freedesktop.org; Upadhyay, Tejas
> > > <tejas.upadhyay@intel.com>; Brost, Matthew
> > > <matthew.brost@intel.com>; Ghimiray, Himal Prasad
> > > <himal.prasad.ghimiray@intel.com>; Auld, Matthew
> > > <matthew.auld@intel.com>; thomas.hellstrom@linux.intel.com; Mrozek,
> > > Michal <michal.mrozek@intel.com>
> > > Subject: Re: [PATCH V11 11/12] drm/xe/uapi: Expose ban reason in
> > > EXEC_QUEUE_GET_PROPERTY_BAN
> > >
> > > On Mon, Jun 08, 2026 at 10:03:50AM -0400, Souza, Jose wrote:
> > > > On Fri, 2026-06-05 at 18:08 +0530, Tejas Upadhyay wrote:
> > > > > Extend DRM_XE_EXEC_QUEUE_GET_PROPERTY_BAN to return a
> bitmask
> > > > > indicating the reason for the ban, rather than a simple boolean.
> > > > > This allows userspace to distinguish between different ban causes=
:
> > > > >
> > > > > - DRM_XE_EXEC_QUEUE_BAN_REASON_GPU_HANG (bit 0): exec
> queue
> > > was
> > > > > banned
> > > > > =A0 due to a GPU hang or job timeout detected by the TDR.
> > > > > - DRM_XE_EXEC_QUEUE_BAN_REASON_PAGE_OFFLINE (bit 1): exec
> > > queue was
> > > > > =A0 banned because a VRAM page backing its resources was taken of=
fline.
> > > > >
> > > > > The ban_reason field is added to struct xe_exec_queue and set at
> > > > > the point where the ban is triggered:
> > > > > - In guc_exec_queue_timedout_job() for GPU hang.
> > > > > - In xe_ttm_vram_purge_page() for memory page offline, before
> > > > > calling
> > > > > =A0 xe_exec_queue_kill() or xe_vm_kill().
> > > > >
> > > > > The reset_status op is updated to return u64 with the reason bitm=
ask.
> > > > > When a queue is banned but no explicit reason was recorded
> > > > > (e.g., from a generic CAT error), it defaults to GPU_HANG for
> > > > > backward compatibility.
> > > > > A value of 0 means the exec queue is not banned.
> > > > >
> > > >
> > > > Acked-by: Jos=E9 Roberto de Souza <jose.souza@intel.com>
> > >
> > > Do we already have a userpace change with this?
> >
> > By userspace you mean IGT or other UMD? I have thought to add simple te=
st
> to offline and check for BAN reason in xe_exec_basic or somewhere. I have=
 igt
> tests  https://patchwork.freedesktop.org/patch/714751/for testing
> mempage offline via debugfs but that does not test complete flow of
> mempage offline feature so not extending it with this.
>=20
> I'm missing the end to end flow in here...
>=20
> could you please clarify what this API is used for? Who is using it and h=
ow and
> when?

Ok. This API is used for userspace to know the reason why their created exe=
c queue is banned. Earlier exec queue either can be hang/banned(non zero) o=
r working(zero) fine. Now with this change exec queue can be banned due to =
memory offlining as well, so userspace can now get extra BAN reason when th=
ey query and parse like below to know BAN reason:

if (args.value & DRM_XE_EXEC_QUEUE_BAN_REASON_PAGE_OFFLINE)
    /* page went offline */
if (args.value & DRM_XE_EXEC_QUEUE_BAN_REASON_GPU_HANG)
    /* GPU hang - typical recovery path */

So you are right userspace can check this args.value with adiitional reason=
 case at the same places wherever they are querying right now. @Mrozek, Mic=
hal @Souza, Jose FYI

Tejas=20

>=20
> Thanks,
> Rodrigo.
>=20
> >
> > Tejas
> > >
> > > Cc: Thomas Hellstr=F6m <thomas.hellstrom@linux.intel.com>
> > >
> > > Thomas, thought on this vs the watch_queue you have or they are
> > > orthogonal?
> > >
> > > >
> > > > > Assisted-by: Copilot:claude-opus-4.6
> > > > > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > > > > cc: Mrozek, Michal <michal.mrozek@intel.com>
> > > > > cc: Jos=E9 Roberto de Souza <jose.souza@intel.com>
> > > > > cc: Vivi, Rodrigo <rodrigo.vivi@intel.com>
> > > > > ---
> > > > > =A0drivers/gpu/drm/xe/xe_exec_queue_types.h |=A0 7 +++++--
> > > > > =A0drivers/gpu/drm/xe/xe_execlist.c=A0=A0=A0=A0=A0=A0=A0=A0 |=A0 =
4 ++--
> > > > > =A0drivers/gpu/drm/xe/xe_guc_submit.c=A0=A0=A0=A0=A0=A0 | 24
> > > > > +++++++++++++++++++---
> > > > > --
> > > > > =A0drivers/gpu/drm/xe/xe_ttm_vram_mgr.c=A0=A0=A0=A0 |=A0 7 ++++++=
+
> > > > > =A0include/uapi/drm/xe_drm.h=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 | 12 +++++++++++-
> > > > > =A05 files changed, 44 insertions(+), 10 deletions(-)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > > > > b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > > > > index 2f5ccf294675..77a621da4487 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > > > > +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > > > > @@ -143,6 +143,9 @@ struct xe_exec_queue {
> > > > > =A0	 */
> > > > > =A0	unsigned long flags;
> > > > >
> > > > > +	/** @ban_reason: Bitmask of ban reasons
> > > > > (DRM_XE_EXEC_QUEUE_BAN_REASON_*) */
> > > > > +	u32 ban_reason;
> > > > > +
> > > > > =A0	union {
> > > > > =A0		/** @multi_gt_list: list head for VM bind engines if multi-G=
T */
> > > > > =A0		struct list_head multi_gt_list; @@ -316,8 +319,8 @@ struct
> > > > > xe_exec_queue_ops {
> > > > > =A0	 * signalled when this function is called.
> > > > > =A0	 */
> > > > > =A0	void (*resume)(struct xe_exec_queue *q);
> > > > > -	/** @reset_status: check exec queue reset status */
> > > > > -	bool (*reset_status)(struct xe_exec_queue *q);
> > > > > +	/** @reset_status: check exec queue ban status, returns ban
> > > > > reason bitmask */
> > > > > +	u64 (*reset_status)(struct xe_exec_queue *q);
> > > > > =A0	/** @active: check exec queue is active */
> > > > > =A0	bool (*active)(struct xe_exec_queue *q);
> > > > > =A0};
> > > > > diff --git a/drivers/gpu/drm/xe/xe_execlist.c
> > > > > b/drivers/gpu/drm/xe/xe_execlist.c
> > > > > index 9fb99c038ea8..35e6e05ba418 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_execlist.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_execlist.c
> > > > > @@ -452,10 +452,10 @@ static void
> > > > > execlist_exec_queue_resume(struct xe_exec_queue *q)
> > > > > =A0	/* NIY */
> > > > > =A0}
> > > > >
> > > > > -static bool execlist_exec_queue_reset_status(struct
> > > > > xe_exec_queue
> > > > > *q)
> > > > > +static u64 execlist_exec_queue_reset_status(struct
> > > > > +xe_exec_queue
> > > > > +*q)
> > > > > =A0{
> > > > > =A0	/* NIY */
> > > > > -	return false;
> > > > > +	return 0;
> > > > > =A0}
> > > > >
> > > > > =A0static bool execlist_exec_queue_active(struct xe_exec_queue *q=
)
> > > > > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > > b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > > index 4b247a3019d2..ff28eab7cee2 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > > @@ -6,6 +6,7 @@
> > > > > =A0#include "xe_guc_submit.h"
> > > > >
> > > > > =A0#include <linux/bitfield.h>
> > > > > +#include <uapi/drm/xe_drm.h>
> > > > > =A0#include <linux/bitmap.h>
> > > > > =A0#include <linux/circ_buf.h>
> > > > > =A0#include <linux/dma-fence-array.h> @@ -1530,6 +1531,7 @@
> > > > > guc_exec_queue_timedout_job(struct
> > > > > drm_sched_job *drm_job)
> > > > > =A0	if (!exec_queue_killed(q))
> > > > > =A0		wedged =3D
> > > > > guc_submit_hint_wedged(exec_queue_to_guc(q));
> > > > >
> > > > > +	q->ban_reason |=3D
> > > DRM_XE_EXEC_QUEUE_BAN_REASON_GPU_HANG;
> > > > > =A0	set_exec_queue_banned(q);
> > > > >
> > > > > =A0	/* Kick job / queue off hardware */ @@ -2211,13 +2213,25 @@
> > > static
> > > > > void guc_exec_queue_resume(struct xe_exec_queue *q)
> > > > > =A0	xe_sched_msg_unlock(sched);
> > > > > =A0}
> > > > >
> > > > > -static bool guc_exec_queue_reset_status(struct xe_exec_queue
> > > > > *q)
> > > > > +static u64 guc_exec_queue_reset_status(struct xe_exec_queue *q)
> > > > > =A0{
> > > > > -	if (xe_exec_queue_is_multi_queue_secondary(q) &&
> > > > > -
> > > > >
> guc_exec_queue_reset_status(xe_exec_queue_multi_queue_primary(q)))
> > > > > -		return true;
> > > > > +	if (xe_exec_queue_is_multi_queue_secondary(q)) {
> > > > > +		u64 status =3D guc_exec_queue_reset_status(
> > > > > +
> 	xe_exec_queue_multi_queue_primary(q)
> > > > > );
> > > > > +		if (status)
> > > > > +			return status;
> > > > > +	}
> > > > > +
> > > > > +	if (exec_queue_reset(q) ||
> > > > > exec_queue_killed_or_banned_or_wedged(q)) {
> > > > > +		u64 reason =3D q->ban_reason;
> > > > >
> > > > > -	return exec_queue_reset(q) ||
> > > > > exec_queue_killed_or_banned_or_wedged(q);
> > > > > +		/* If no specific reason was recorded, default to
> > > > > GPU hang */
> > > > > +		if (!reason)
> > > > > +			reason =3D
> > > > > DRM_XE_EXEC_QUEUE_BAN_REASON_GPU_HANG;
> > > > > +		return reason;
> > > > > +	}
> > > > > +
> > > > > +	return 0;
> > > > > =A0}
> > > > >
> > > > > =A0static bool guc_exec_queue_active(struct xe_exec_queue *q) dif=
f
> > > > > --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > > > > b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > > > > index 35b5eaf590fa..3765e8fcdcec 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > > > > @@ -7,6 +7,7 @@
> > > > > =A0#include <drm/drm_managed.h>
> > > > > =A0#include <drm/drm_drv.h>
> > > > > =A0#include <drm/drm_buddy.h>
> > > > > +#include <uapi/drm/xe_drm.h>
> > > > >
> > > > > =A0#include <drm/ttm/ttm_placement.h>
> > > > > =A0#include <drm/ttm/ttm_range_manager.h> @@ -537,10 +538,15 @@
> > > static
> > > > > int xe_ttm_vram_purge_page(struct xe_device *xe, struct xe_bo *bo=
)
> > > > > =A0	xe_bo_unlock(bo);
> > > > > =A0	/*=A0 Ban VM if BO is PPGTT */
> > > > > =A0	if (vm && (flags & XE_BO_FLAG_PAGETABLE)) {
> > > > > +		struct xe_exec_queue *eq;
> > > > > +
> > > > > =A0		down_write(&vm->lock);
> > > > > +		list_for_each_entry(eq, &vm->preempt.exec_queues,
> > > > > lr.link)
> > > > > +			eq->ban_reason |=3D
> > > > > DRM_XE_EXEC_QUEUE_BAN_REASON_PAGE_OFFLINE;
> > > > > =A0		xe_vm_kill(vm, true);
> > > > > =A0		up_write(&vm->lock);
> > > > > =A0	}
> > > > > +
> > > > > =A0	if (vm)
> > > > > =A0		xe_vm_put(vm);
> > > > >
> > > > > @@ -548,6 +554,7 @@ static int xe_ttm_vram_purge_page(struct
> > > > > xe_device *xe, struct xe_bo *bo)
> > > > > =A0	/*=A0 Ban exec queue if BO is lrc */
> > > > > =A0	if (bo->q && xe_exec_queue_get_unless_zero(bo->q)) {
> > > > > =A0		/* ban queue */
> > > > > +		bo->q->ban_reason |=3D
> > > > > DRM_XE_EXEC_QUEUE_BAN_REASON_PAGE_OFFLINE;
> > > > > =A0		xe_exec_queue_kill(bo->q);
> > > > > =A0		xe_exec_queue_put(bo->q);
> > > > > =A0	}
> > > > > diff --git a/include/uapi/drm/xe_drm.h
> > > > > b/include/uapi/drm/xe_drm.h index 48e9f1fdb78d..904d58b039fe
> > > > > 100644
> > > > > --- a/include/uapi/drm/xe_drm.h
> > > > > +++ b/include/uapi/drm/xe_drm.h
> > > > > @@ -1503,7 +1503,17 @@ struct drm_xe_exec_queue_get_property {
> > > > > =A0	/** @property: property to get */
> > > > > =A0	__u32 property;
> > > > >
> > > > > -	/** @value: property value */
> > > > > +	/**
> > > > > +	 * @value: property value
> > > > > +	 *
> > > > > +	 * For %DRM_XE_EXEC_QUEUE_GET_PROPERTY_BAN, this is a
> > > > > bitmask of:
> > > > > +	 *=A0 - %DRM_XE_EXEC_QUEUE_BAN_REASON_GPU_HANG -
> banned
> > > due to
> > > > > GPU hang/timeout
> > > > > +	 *=A0 - %DRM_XE_EXEC_QUEUE_BAN_REASON_PAGE_OFFLINE -
> banned
> > > > > due to memory page offline
> > > > > +	 *
> > > > > +	 * Value of 0 means the exec queue is not banned.
> > > > > +	 */
> > > > > +#define DRM_XE_EXEC_QUEUE_BAN_REASON_GPU_HANG
> > > 	(1 << 0)
> > > > > +#define DRM_XE_EXEC_QUEUE_BAN_REASON_PAGE_OFFLINE	(1 <<
> > > 1)
> > > > > =A0	__u64 value;
> > > > >
> > > > > =A0	/** @reserved: Reserved */
