Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CF0BD262AD
	for <intel-xe@archiver.kernel.org>; Tue, 20 Jan 2026 23:41:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDA0910E66E;
	Tue, 20 Jan 2026 23:41:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AS1lF8R5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3809510E66E
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Jan 2026 23:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768952506; x=1800488506;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VnrmyAU4kUrAF4+FIHxH8xkz1kiSCMaUOCWyTGie5sw=;
 b=AS1lF8R5ax/MADxcwShsq0s6yt3GEjQ4WHZ5Ln7tb8T8UbDnCikhUJF3
 ijE23c9A5HBjXVklJnKnBsRHRnetBwTk/fh+6UABuktC66/x6BmMP8sJ/
 0YdR1TzQ0lBJig+29AoYvQs08EtTNod6d94Su5H/39DoaKqKer7Zc0A5U
 gujOKvSoY1YG0kza5e2r+hdufSyVDcWr/Nsp4Jh9p/V1cbexEAZkoDQK4
 IuypxXQAYRX98RAzO35Lv6vLQvy9u/CnsuiWX55XtG+C/s5axnP//votH
 4zgqMudhlwr/j6voOUHr66asCkK+PITToI0dH6Jbga+F9FyH5ZhAyA1vd w==;
X-CSE-ConnectionGUID: CFcxgnRqTMmSr1mqzaBSwA==
X-CSE-MsgGUID: vOeLlueCQZaDAhiO8PrzoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="81617013"
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="81617013"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 15:41:46 -0800
X-CSE-ConnectionGUID: V8EKqxKeRXufd/4NZpGOOw==
X-CSE-MsgGUID: yVp0JncjSv+nTYSMao/Low==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="210418236"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 15:41:45 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 15:41:45 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 20 Jan 2026 15:41:45 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.26) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 15:41:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RFl27K9Kw37KGuyw/RnOZ8xSAMi6rUMLhFaH+pSjbZxmzrVQKdOzlGtFruoZmblXiBrHlAa+QRdWn2Y/uESpIegesRL7RC7da+7amRM1eg41IZMNJ9MSLgo7skW72eY/9CL6jadGHvYJOynNumBwpNXLLyBFW/ncjs2ngfp6eLMXaM6ana6bFxA16Ez1AAS0aEQOG1lUfgbrtD/lSSPkcIcqNr5+2Zq68oogqZeBb5vgi5zrUfAO0xGiqmXoF9Ok8AZfWXazzJ2/VVBA2wsHvbLXwgD+lHVCD/duWfybH2SWPOgeVi0uWamlS0UPAsholQBxSt1XIJZziNgSh9MEuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i/yZcT9UWtoAyijpjKXMEf9lEw4d3mHycTEHtIWH5b4=;
 b=gRe2Y9HV8oXYpJulIRgrNzuQ+FPZvRXe7OUX5NDFZ09IWdP7XE9dbf671A6HMzntT6Wd02YGLa2366GL5VmCBOaJkGm54c6GIfwZ/0IndauFxGxLHx6/vTEMNnzMIxlL1WD7SKG6qJGW8qmiaBon+YKl025VfNk/PUKuZLoAchsm6z/7fwUMffTk15Dvm1NFsFJptYdELOaJYukJ0xo0oD7fj1FuyUyUJksTfpAltsV11lqLtpmZb14+vf1B9hOnYzW967rm5CD5ygdAG+cICojDw/LS4VvXtPbd3r2IYvvMpGOEYyORYAbqJkhCpiprXoMTLh2qU48sc2OGx+3OLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB8839.namprd11.prod.outlook.com (2603:10b6:806:467::17)
 by SA2PR11MB4857.namprd11.prod.outlook.com (2603:10b6:806:fa::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.10; Tue, 20 Jan
 2026 23:41:42 +0000
Received: from SA1PR11MB8839.namprd11.prod.outlook.com
 ([fe80::d917:ef8:5e20:14f3]) by SA1PR11MB8839.namprd11.prod.outlook.com
 ([fe80::d917:ef8:5e20:14f3%4]) with mapi id 15.20.9542.008; Tue, 20 Jan 2026
 23:41:42 +0000
From: "Nguyen, Brian3" <brian3.nguyen@intel.com>
To: "Lin, Shuicheng" <shuicheng.lin@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Usyskin, Alexander" <alexander.usyskin@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>
Subject: RE: [PATCH v4 3/3] drm/xe/nvm: Defer xe->nvm assignment until init
 succeeds
Thread-Topic: [PATCH v4 3/3] drm/xe/nvm: Defer xe->nvm assignment until init
 succeeds
Thread-Index: AQHcijueaGc11UY+M0iaXLb2drmajrVbfA/A
Date: Tue, 20 Jan 2026 23:41:42 +0000
Message-ID: <SA1PR11MB883996365DC0F653B8F513A3AA89A@SA1PR11MB8839.namprd11.prod.outlook.com>
References: <20260120183239.2966782-5-shuicheng.lin@intel.com>
 <20260120183239.2966782-8-shuicheng.lin@intel.com>
In-Reply-To: <20260120183239.2966782-8-shuicheng.lin@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB8839:EE_|SA2PR11MB4857:EE_
x-ms-office365-filtering-correlation-id: c15f3275-86a0-4c65-7d98-08de587d76f2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?RTpC8b8rh2AMpRlHkKl2B/zyir/3H9Hq1F/QisK3HMgmTUflBgPgCjTx5Bf1?=
 =?us-ascii?Q?ijYoN+a525fXjEY2Qln9YuxBdY7H/y5oge2C6be9staUopU3/u++YNjFz305?=
 =?us-ascii?Q?5XTywefys0tC4Z2bYJdlLUMM/otxMoVUrpaNhxVIzZRn4tn4bC1QOvgffwb6?=
 =?us-ascii?Q?asmdPBT46s3wSfaVEDSGuEjmp3xnOUlNlqkOwMnWIIv+vqzp4xCMEMnbDeCH?=
 =?us-ascii?Q?7GwsLaLi9d6chwMLJT+Zrb28zx4cwCQa8uzg9RW9rO+yi44I43mWhwah1iH9?=
 =?us-ascii?Q?OVDFx5lfVaoFovM0yy5C22kSI+25rjwSyIRYbmdISPKAc9H0h/9HkZotyWou?=
 =?us-ascii?Q?4d7VZF0Aq/TDTtJNH/1m8cizB5Iz8gLPey2VV2nPYQB+/B1wgDPoWyVo53YO?=
 =?us-ascii?Q?RPNyjxsfxaSw+Grf+v8EeSJhkJ4r5x97hNEly1RX6xcUfw0tVBq6HZWF/oSL?=
 =?us-ascii?Q?+cRkuPU4ydk2E4647VpttUGZDuBsUyDBCmM7RxdqT583uroyB2jd+PgmS58h?=
 =?us-ascii?Q?+lvJPTRCSrL1afOZG+6gG3M+0WmqiWAPqxPXwApQGTh6rrN61SQAKhS5CzyN?=
 =?us-ascii?Q?85jn2AyHI2JIhXZSpfMzOkkHGkmvm+QWseZ0Hgn1yT2e346ibtE4Zykhp4HG?=
 =?us-ascii?Q?8v/2w8PKndiGLjQcPHPWU7zj6axcOehwGdhMtyLckZyYyqBq+qVK1Oo/JTIT?=
 =?us-ascii?Q?xjPp78cfaD5KwidEHScKNbF2p3BajKbOS1MlcJjWpRlph4pZqllTDsEt4AYt?=
 =?us-ascii?Q?Owd27IDp83N2y4ikBCiFrY0Vv/s3ZXu3jNznnrz0bQ10tRk6oCTMelyxgW8z?=
 =?us-ascii?Q?y76S74hdG1HTbjqHKVQXlS8sKVSIz4fTrHLQYqFOqBLb2eDcYC60m2xAW47E?=
 =?us-ascii?Q?JYsd6c0lJxZtGThtESTtQ/D7+kJAsKuGfWlkC50wlyUZO0UAem6lbm3g8hkZ?=
 =?us-ascii?Q?yxACX7UFuosVnsjwonVRICHw7nMOc6Cw6o8PgJiWH7NNZk3kBAsYegso3ECv?=
 =?us-ascii?Q?g6UiM3bSLTJR17JrqmKf9cRYdtyhOH6g87jTjZz9WxPXSzuqjfCEzWRztfru?=
 =?us-ascii?Q?N5A5qp1BGHdajjXj2Wk72QtmaRCP/IUdkkOQpOxiEBKZq5lGi6qonZr6528t?=
 =?us-ascii?Q?CU0MaadRBTF94FgplzsCGSxLmsDF6pLyL+QjnjQ4JYG3ixSuP2GDNL5mMgGq?=
 =?us-ascii?Q?hIsJhDm+rWPscutV2E9X24f5jcA13+B3yDSIC9cMQ5CKm5GOsJDEPDyutvTb?=
 =?us-ascii?Q?A4tNoPExx2SipMPUyALzQC7TLp5ZQcGkyi8MI2ckdu73XjWmc8MAh06ZT34R?=
 =?us-ascii?Q?P2RVs9SFpUdHSTqqcToU9bJUQnPmFwrbS2hIycnMg/YMAhob3JKgfXsGji12?=
 =?us-ascii?Q?HQLK4PndNsOovLwsL/fR7OWs3L5EfyUeniE8msHpTLOGAhZZF6fmqhyoihqT?=
 =?us-ascii?Q?3fE0om/tDW9opQKCHcoYeW0boc5PWNoaeIBjDzMzJ4r5k0mgzkxPHUDuf2Pl?=
 =?us-ascii?Q?QTqL6WpLmpkV+NkOmx1SRNDx//TFMgkRIlO99/t5BQDJ7cLFrLcazEAOw8yZ?=
 =?us-ascii?Q?FrOKx8dpLBBxaldhzjSM3rZcWjFZE3ayv4JSA/bSQG3SnwG53Wqzv6LMmgEK?=
 =?us-ascii?Q?DvLkdsRsyFqebcOS5yG92eA=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB8839.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?nw3VuLRxUj2XIZS60EZHZ0WvDs5EXQoFqDG3vRuKGzsuD9kSUWPdvzJJ2gSB?=
 =?us-ascii?Q?s7L0+4Lg4HO61mjUmch86NmzHJtkZCJZhQbbvs5vQ8aVXwYwuDc7kdERpagl?=
 =?us-ascii?Q?bwaX92G/lh/wXMbEv+uW3pszGUoZwSUJisiZ01rCQYXZ50SZEJr3deV+ajB9?=
 =?us-ascii?Q?oIe2vyVpm4+AgsKXKosI6GtaTnPRR81wEXpAzIvkcpZQzrZ2co7n+G/Mo9FJ?=
 =?us-ascii?Q?+BIJpRZWChl7/TQJTUsLahFHIbE1sdIKKvcVbsVHQIuDPX83hea+ddRA9J4X?=
 =?us-ascii?Q?MsZHYBdmZGiZt0XQCg55YNLtljsmPB5gUbwe3i/PlZ4+LLvIRBXuKCVuDkhQ?=
 =?us-ascii?Q?bFjKdoJAG6+s78ewneEgMfldmv9CsSUqbpp5a7VhwO7SEX+5LUhO9FM6e7QB?=
 =?us-ascii?Q?gDoQx1VS8D5sOjNEMIoLg4IDSJynEvtfF003C8arBImsxHjntHm7kR7OItdp?=
 =?us-ascii?Q?ZL3BzhfcdOKjcWJW0x80fT5BvfpB4MUovkYDWyoTcYy4UGWMMYrwTlnFSenZ?=
 =?us-ascii?Q?WZK4I3osSjx97SkBIyOmvMab/EfrinJn0daKmEdtxxCaRH5/GRKak85ctYxD?=
 =?us-ascii?Q?dkLb6ACDp/c0hWbo1da9fjxjIamn9R6vgYgH9+OufJEfAtW6bjj+OhEVxEdc?=
 =?us-ascii?Q?t87V6h26wbQOfj4JY67OwU+fZM91g/CstwJmTrJAjsB6+DiYPTezmr0B1T1t?=
 =?us-ascii?Q?6AgpaWpZL+j6nq9HKy+uN6B+oZ+4CcOxGAskGPimewU2w1jz6ZQqn9Pt9ZxS?=
 =?us-ascii?Q?+F+VDGWsWludvd6oc27sjcm+mRFiUpBQoa9l761ozrJLdLI9iGLoJz13elFw?=
 =?us-ascii?Q?5W7WOJ5VEPGsKAuL6mschcsfFFeRvouaEBmmnbDqfXR2MmGu2dOLTMyRCa3e?=
 =?us-ascii?Q?iB2p4FMH8nEZ8JH5o/5cMT0KHjQsvQzmvSb5GlwYz55+LoB0N7MpnKxIyWMi?=
 =?us-ascii?Q?rjKqI1H2jsZ1cmI0wndmcc/DapYNfzVbZ1PXwafpMEv4EEKsXLrMXDd9aFH4?=
 =?us-ascii?Q?DH/GN+LLxw2K7Dfd31gXOmiY1hvtY+WL4u/LKqpdIR5u9Wxl0holw3udZmdz?=
 =?us-ascii?Q?oxETiwUfOp1kUco3XLVCx6jQMAbjrqGhn4BhyFsHdf6cJEoQaSQPGncRua8G?=
 =?us-ascii?Q?xeXZ9Yb7dt3qGAhNxrW98l9XTqukEtT4cEdP0Sm0zW15/1N9pRB/LUpkG2xT?=
 =?us-ascii?Q?nY0fcbykll+tObYRnO3Jl+s5cPos17uwA4vkhZkkFchwS9gKW7aFSkXB3805?=
 =?us-ascii?Q?I6Jofw5nW9hgAw3zhCMQcZLTSBTNegRhbp6zWAfbuttk2yaJLqph0UoZGkgQ?=
 =?us-ascii?Q?Rjzbf44xRWVvFel3ikN5Eqwv84g82D7ueo1Hprjsd55JsueAFPzhMBnoJbBg?=
 =?us-ascii?Q?pjfNcqQeh+MnsiDJD7em5FiuzG+kGN/JlLJfBT2B7UGxtG4fN8Am0cwBj7u7?=
 =?us-ascii?Q?lLhpKNHU9KnrYd4xCO2riKyLmqCj+2lmg2zDpJN2izY/txb7DYIGoO3xlJcT?=
 =?us-ascii?Q?UbhYO7TjkgKCFw1MGhXM36jsfNr+r8N9+DMpprCa1OiMdL3WhkPYDUXDE3tW?=
 =?us-ascii?Q?I4MyrjalVgnVbF2JZf0hUs6OJj5MdxZYvgUZyjr/B0gwROUJ3BXoI9KSLEox?=
 =?us-ascii?Q?+lXSA2YftpzRX15aKys0ah74EgFYfmODC47xpRpvLYlnGEORoACmiuxlO8GB?=
 =?us-ascii?Q?dGU6sCNrjra8RGUuJZDYyHlVQRpTkWwfD2ujX/F6JUMGLmCJ3RmILpyilxlg?=
 =?us-ascii?Q?blGKaBVHzA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8839.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c15f3275-86a0-4c65-7d98-08de587d76f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2026 23:41:42.2633 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sIhRCHogmscwhsSvRE2+MHo/BodQKRkhoRofEl+wdN00J7j6xA6eTg03zJrNl7VFeVJg/WAUaZLk51j2KCb0uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4857
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

On Tuesday, January 20, 2026 10:33 AM, Shuicheng Lin wrote:
> Allocate and initialize the NVM structure using a local pointer and assig=
n it to xe->nvm only after all initialization steps succeed.
>=20
> This avoids exposing a partially initialized xe->nvm and removes the need=
 to explicitly clear xe->nvm on error paths, simplifying error
> handling and making the lifetime rules clearer.
>=20
> Cc: Alexander Usyskin <alexander.usyskin@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Brian Nguyen <brian3.nguyen@intel.com>

Reviewed-by: Brian Nguyen <brian3.nguyen@intel.com>

> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_nvm.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_nvm.c b/drivers/gpu/drm/xe/xe_nvm.c in=
dex 6f9dd519371c..bc88804de514 100644
> --- a/drivers/gpu/drm/xe/xe_nvm.c
> +++ b/drivers/gpu/drm/xe/xe_nvm.c
> @@ -133,12 +133,10 @@ int xe_nvm_init(struct xe_device *xe)
>  	if (WARN_ON(xe->nvm))
>  		return -EFAULT;
>=20
> -	xe->nvm =3D kzalloc(sizeof(*nvm), GFP_KERNEL);
> -	if (!xe->nvm)
> +	nvm =3D kzalloc(sizeof(*nvm), GFP_KERNEL);
> +	if (!nvm)
>  		return -ENOMEM;
>=20
> -	nvm =3D xe->nvm;
> -
>  	nvm->writable_override =3D xe_nvm_writable_override(xe);
>  	nvm->non_posted_erase =3D xe_nvm_non_posted_erase(xe);
>  	nvm->bar.parent =3D &pdev->resource[0];
> @@ -165,7 +163,6 @@ int xe_nvm_init(struct xe_device *xe)
>  	if (ret) {
>  		drm_err(&xe->drm, "xe-nvm aux init failed %d\n", ret);
>  		kfree(nvm);
> -		xe->nvm =3D NULL;
>  		return ret;
>  	}
>=20
> @@ -173,8 +170,9 @@ int xe_nvm_init(struct xe_device *xe)
>  	if (ret) {
>  		drm_err(&xe->drm, "xe-nvm aux add failed %d\n", ret);
>  		auxiliary_device_uninit(aux_dev);
> -		xe->nvm =3D NULL;
>  		return ret;
>  	}
> +
> +	xe->nvm =3D nvm;
>  	return devm_add_action_or_reset(xe->drm.dev, xe_nvm_fini, xe);  }
> --
> 2.50.1

