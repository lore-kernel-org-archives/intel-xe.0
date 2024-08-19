Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B579C3DA4A
	for <intel-xe@archiver.kernel.org>; Mon, 19 Aug 2024 09:33:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED27910E232;
	Mon, 19 Aug 2024 09:33:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IhG2Ow83";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6833F10E232
 for <intel-xe@lists.freedesktop.org>; Mon, 19 Aug 2024 09:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724060032; x=1755596032;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=u8m4pkr1VUkRcLjAo9AkeDGejZsg3OTQ+8s7x6dXsqw=;
 b=IhG2Ow83Ww9ZixaBtCLey8OcRqlGYAbDmuaUMQJz/p8RzfrAVZUl57wS
 PcBG7cFhkTN+Khzcb7YiaPJg20e/9rshYscEK7TUsSxwKpolBkCU9b1nl
 zIyW7rk7k2+EA8wymhxEKDoSdsfhA6gs8293gIbiBlnD2or71kfPxLcW0
 4fHurj4z4TazD7MN2KoxzM/cMGC8UaT2MVzbMpN5mf4DMjVAyLvRFuu2d
 +noqoDbFGv5ABLwBDa1BX7n/QHL+9VoleNHZ8shyy0vOLI5w5BztYB/+3
 d9uUA2e0dOKik8KFtdoe9qPutimc3L9ISY9URIUMh6mGwfcdffo1PUXzs w==;
X-CSE-ConnectionGUID: Oo6lhJDRRrCvZFMLVHzZBA==
X-CSE-MsgGUID: m2d4NXMJQaC774Ho4wp1Bw==
X-IronPort-AV: E=McAfee;i="6700,10204,11168"; a="13089550"
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; d="scan'208";a="13089550"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 02:33:52 -0700
X-CSE-ConnectionGUID: WNeDDs48TZicYj4x3QpHmg==
X-CSE-MsgGUID: tsljfNHYRTuwoaTOaukoVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; d="scan'208";a="83538331"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Aug 2024 02:33:51 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 19 Aug 2024 02:33:51 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 19 Aug 2024 02:33:50 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 19 Aug 2024 02:33:50 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 19 Aug 2024 02:33:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qegtKoF75nm/UTHrikJG3ZOlYPz8rjUHhEZpIQjG0J04vTZmPpehWPev6nxiDWqoNwIFsWd5P9fsECEFl3E/jNcDvteWQcbYV6SOh1S2dUCMLqp+D4AsGTn0nnP9NI9TdAQBevcuG14LUVaEIPjpwH2Xm7Isvy9242zT5wXc3YsjrLdOc4HcumcxFU6CxpnisP4RVo/7vyqQWgTkveXZcyB2mFLBTX2RJaNWM3zfBofIHTQYEf25W4zlddrsOClsxgXBAFO63Chb736iDi0sDkB2gTchm5hHODqPkBP86duBffT4PvPGiN5vVuzWtf8+wrmR2RriOFi7oGRrSYYP3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2XMMOpWoc7iORLqAfc9EycF7tLIA82zloB5/KWz1g3E=;
 b=tYSjPlfynX1Q28fL7JsDLOQdWMVTDEl357TmRnCa7DJUt3BwI9W+xxoD0uMYOFNMw29+2f84geywGK/6I+vBAj5ISZMJi/r7ebhftFd7Fx1j0hZp8f+bKpsY5qV0FlrOYJnaKWznMfijmu9eGHbBRgLEKs6JT2btjA8/uxhuW57eGC04UQ6VGF9iCby1Ku6RcAtml5DH1iwF97HLIteXW30/4aiwkcjC3RGYIX5H8x/akeqqkiXL8IyzIsn/WztirD3uE3W4lrzx57yFMqdtdhaAtsQ2RB1NKKSq1NRoDBfMHRC/ORB6/Nvs5msAfIT4/TLBqSWJZIvdQ+xON+MSWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB6868.namprd11.prod.outlook.com (2603:10b6:930:5c::13)
 by IA1PR11MB7367.namprd11.prod.outlook.com (2603:10b6:208:421::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.20; Mon, 19 Aug
 2024 09:33:48 +0000
Received: from CY8PR11MB6868.namprd11.prod.outlook.com
 ([fe80::1eb4:7d0d:53f:6923]) by CY8PR11MB6868.namprd11.prod.outlook.com
 ([fe80::1eb4:7d0d:53f:6923%4]) with mapi id 15.20.7875.019; Mon, 19 Aug 2024
 09:33:48 +0000
From: "Singh, Apoorva" <apoorva.singh@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH] drm/xe: Add NULL check before deferencing pointer
Thread-Topic: [PATCH] drm/xe: Add NULL check before deferencing pointer
Thread-Index: AQHa8gfRE1kncOljaEOR4JV/PnQ7p7IuR8iAgAACFOA=
Date: Mon, 19 Aug 2024 09:33:48 +0000
Message-ID: <CY8PR11MB68683FF07A61858527ED1C10EE8C2@CY8PR11MB6868.namprd11.prod.outlook.com>
References: <20240819071557.964326-1-apoorva.singh@intel.com>
 <87v7zw6g9m.fsf@intel.com>
In-Reply-To: <87v7zw6g9m.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB6868:EE_|IA1PR11MB7367:EE_
x-ms-office365-filtering-correlation-id: 7b75258e-869f-4171-0ef8-08dcc0320761
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?r3/1ajtZOEenHigyy/iGqqGIEzb8HlqRkO4H9Op6rVRBbeYt5A47N7oJpCGR?=
 =?us-ascii?Q?1N0sKZqr+2BIsAUUdZvI5diQDdc1A2LmF9z9elI/yc8gPFzdAbiokCu3qo2b?=
 =?us-ascii?Q?FisI/+BgnL+PmmIb+iweFxJGz3TNRRYDdK+PIclR4yC1hoiWug2n2Ay9XUL3?=
 =?us-ascii?Q?a0YTIeWYeOQHElthj/eMRw5AEf1BwDkezUcQUT6FkNIHK3VNrVij+zo4g9CY?=
 =?us-ascii?Q?nh+3zcceSKpIkPcrtyya0ULJUVhJ067A/vefx5y19DETu8+Ae09Narw2b19r?=
 =?us-ascii?Q?ed+wTer2qxwRbB1YfpX+nmwUEsLrdiX/PVM5YOlcsWx2vHRtGKGVJloyoGKT?=
 =?us-ascii?Q?qEQ7/PTzoBYrVk8s7rNmZ+J5z9k8VO31pDe99HFqL0hrvQZXk/kc9AY2sUjj?=
 =?us-ascii?Q?ripbZVLkOKwRY2oohIDBj+NeurKOZ4b6b574mJ3+KE88AbuYLHSAXF7bruEx?=
 =?us-ascii?Q?qt4FeCQoaOFm1uPHSSjsnP8bIjvN9AAvsggouzBBvpJeI8uzqf7xSx/VDyCz?=
 =?us-ascii?Q?tW9P/TZie9mBYV3cI1c9sxYrghUT0DWF/S9SfZTu1stkL2zYoJpKRsq7ty9Y?=
 =?us-ascii?Q?41ePCyuQM4VNrZ8Cgm/UBVVAOJo7YVMZvl68UlCML1H7qmrMJXwOrgK+eJ63?=
 =?us-ascii?Q?Pf42qhZSnO1jbmN0EIbNtayxQqpOa8kFImjBAY86KbeWjWn3EmR5Mhakc+fM?=
 =?us-ascii?Q?rk36h0wXyza9UAcyRrkhtEr+1sbSioLNpaQekhLmRKCDI1jesbzFSZ8nd/Ev?=
 =?us-ascii?Q?h+Bdhf2Qh3NJAzxpt0KSlhYgXCXu/orw3445beDefu5t37gn7C8IN3Tp3nVq?=
 =?us-ascii?Q?BKQnJFqNFj570VXkkN1Yu/phkR5W/43CBKAMpF18jqPnebFUipjAMwOUduQ4?=
 =?us-ascii?Q?ohZ1dPAFzTigY+ijnjbG5d7HQpqT4CQX1t1w8cFZfhdD3hMPQyuN+wADLg0J?=
 =?us-ascii?Q?Dh1t70ml2b+vjK+j2tEtkJvRRmbHoSM0ayENVfmgDP4HHJeEqRb2nXhpsvUR?=
 =?us-ascii?Q?knp7w8WYc95D29BMxpepIUGuFYKNYpx666hY6BPFFrv5CHtNprTxB/Ki1u2x?=
 =?us-ascii?Q?+V3i5iVZauu9/YT0gS6V92jeNasa3SrvC9ai+5JHzcsLSnxOqq2U2oI+iaul?=
 =?us-ascii?Q?tt3q2pMW5+aWnBEPJbpPrDYiHXxFB7/sVr1FoRqhtlutmZGVHP7JvipPDRwb?=
 =?us-ascii?Q?dIJZR8Yhk8QnIA8500+8iUCvV4SM1D0Tk4LD6XcvYx1el0foLEMNCuERT5s8?=
 =?us-ascii?Q?m8wlOH8Gpx7nHVbLz45JxgSn0wB1XG0abJ/9F/tShDi5Mt3Disb6CZ+3Aa12?=
 =?us-ascii?Q?F687r17uWa03L9HrPHzEx8HyQ+tXFjxWYuVj8HqhN8O0wvyghjZfMNhqVHk/?=
 =?us-ascii?Q?tejeW7tokrevv92+SMqvkbwqY0dBunc5IyqUEcssIXUn3sWZSQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB6868.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?yLTqK2UhNSfoeAhUVN5L+H43IvNlIRPXMPoZeJrsn7119ljgALFOdIxKFMeS?=
 =?us-ascii?Q?cTidB0rKd9urOpcA42fMOx4gkhQQk5OzKnmoF8Rj4v0WP19ffJGij3ew5KXc?=
 =?us-ascii?Q?A3JC9K6xvX9fasFbFNf+l9t38EAnJsqPUgjx7bGwWlGBR5uSHy0YiudKdTii?=
 =?us-ascii?Q?EnqaahiQLkEaV58hM0gAPV7/KevMA5LhmCZrAk1SMws5wJO9opXdAe6CQnle?=
 =?us-ascii?Q?cPIe58/Us+hl876FymXS1EcOr+oyWAiLPQHII1j7nCZsMW3FmwlZqzOGZDVR?=
 =?us-ascii?Q?EKRc67lnERpozyaMrhve/BBeBTcUVjyW/4TVIuEwTYHRKXB1utYw9sC03t7s?=
 =?us-ascii?Q?OMddGmW2/mdUb8Ic0RGAwAiu4rkfHcnhmYlIoC4AMxNG6u4TB8pNdQqtOMlW?=
 =?us-ascii?Q?tS/+3yATsv/WVMRKoAbF9WrfVnM6ibQ5nfvIKiDZTMPCPgo7JH3KjvGIt5hn?=
 =?us-ascii?Q?9k+N0sI5xRzxamJcdS2jhMrEal3Mnaxapjt4zEXPDWuBJygGOuAYJFGfFzUE?=
 =?us-ascii?Q?un33pLM5Ak7PKoaKcHWAPI/3r+/pwVfm3aynFExPx+wJWi2YoCxJtZlB1yV/?=
 =?us-ascii?Q?6XWSBDpXQiEn38EzX7fq1UkE8n4pIij3UQ/EKFGylAheymL0oxVzi5x7d8g7?=
 =?us-ascii?Q?IBHMnDIVmTRk0YtxGMaKhAnfCtCKR9XVktF5dp/SRbtaMBAp8x+KfI6fdzN4?=
 =?us-ascii?Q?51GwaGeK18EhH/URjH2dF+Zuh/0yjoFZVz7EqMdKWwMsroYe69D/7WsZzgzK?=
 =?us-ascii?Q?FlUXavGlZi9m+jJtWUBGDBK+ZzJwGbHGYGgrjIIKkWASzwFAeBrUJIuqMn3S?=
 =?us-ascii?Q?AmYKUpLLVrXWMrq0ZgvwY83OtRGyiH61HhOBRwb3VsEQs80Ae+ufDoWc3rPE?=
 =?us-ascii?Q?BSFcZDzm9HRK8O23PxmYveFcI61YEjeVnZiwdgF9oNjUJD2ztb3CeVkzmfcd?=
 =?us-ascii?Q?nbRI0Ugo5dgNC76mOQmBmNxEErAtGpxzNoOuq76Se3/xumonHIbmgeef7kF1?=
 =?us-ascii?Q?c/vg7azun1MvbH1LlRt62UzWTsCMPsZZNh8b2EFNTw/LwIs6tVlwtk6pGruF?=
 =?us-ascii?Q?KCUQe3Kc5FfAx093XvL6L5vbnBy87vT6t/zHdorj1Xsxpu06YEt0X8+no378?=
 =?us-ascii?Q?95tA456fiLummkFhBZJVq6/v47SrThWoWFk8k8C96fQBEBC9QiUHLgrnrfYn?=
 =?us-ascii?Q?oGU+9RYy3GSNHQisMFIc0qgKjeAutM0E2LNxuUzXDg8T/YyP2gVV/K5F9Msm?=
 =?us-ascii?Q?6hE9LGguzrcGK1uVUaK/GIEXAkz6B868hHFspzjzDw/yfK1x6UmlOkani23r?=
 =?us-ascii?Q?6sj519ne1ZtbhrYfor+ApiRT6YM8NkOdBnN5g2fO4ZT1fxmukfdHVtwSPAPA?=
 =?us-ascii?Q?QxGza3E6/UPuKgZcbqlHrEjN+IQiMI+rKXwcA7eEvalLefnpLh2oZYPmY4N3?=
 =?us-ascii?Q?skh/VSc0TFAxVPIdHB8g3BQPWJX22o6gUIvfEF+dK3POaUgks0xBE7CKTQE9?=
 =?us-ascii?Q?wJR7+FzfH7k5rdiYUl9AJ0DSPmLWxMN/NhEVQ2Ia/TS2gCaebJbfvw/6a5bn?=
 =?us-ascii?Q?CcmRhKsa4LDxKzPZM6NK16i9qbb5Lx0Cffh1PqZU?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB6868.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b75258e-869f-4171-0ef8-08dcc0320761
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2024 09:33:48.3935 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CrT+k8JBErjf97iJzORmIs116uhdWCYQ9gtQs5KdERgGL/7rw8iIX1biWJgesY0uj2R++b3/96Kp7RYyT4/LKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7367
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
> From: Jani Nikula <jani.nikula@linux.intel.com>
> Sent: Monday, August 19, 2024 2:28 PM
> To: Singh, Apoorva <apoorva.singh@intel.com>; intel-
> xe@lists.freedesktop.org
> Cc: Singh, Apoorva <apoorva.singh@intel.com>
> Subject: Re: [PATCH] drm/xe: Add NULL check before deferencing pointer
>=20
> On Mon, 19 Aug 2024, apoorva.singh@intel.com wrote:
> > From: Apoorva Singh <apoorva.singh@intel.com>
>=20
> *dereferencing typo in the subject. You could also be more specific, that
> subject could refer to anything anywhere in the driver. If you find anoth=
er
> one, what's its subject going to be?

Thank you for pointing out. I will take care in next revision.
>=20
> > Add NULL check before deferencing of lrc->bo in
> > xe_lrc_snapshot_capture().
> >
> > Free the dynamically allocated memory for snapshot to avoid memory
> > leak
>=20
> We've seen this patch or its variants many times now. Where's the
> changelog? What's going on?

Patch variants happened due to change in subject as per addressing the comm=
ents by Nirmoy and Rodrigo.
But finally, its concluded to not remove the if (lrc->bo) from above and in=
stead add in the position mentioned in this patch.

>=20
> > Signed-off-by: Apoorva Singh <apoorva.singh@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_lrc.c | 32 ++++++++++++++++++--------------
> >  1 file changed, 18 insertions(+), 14 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> > index 974a9cd8c379..e31d9bc64ff6 100644
> > --- a/drivers/gpu/drm/xe/xe_lrc.c
> > +++ b/drivers/gpu/drm/xe/xe_lrc.c
> > @@ -1652,20 +1652,24 @@ struct xe_lrc_snapshot
> *xe_lrc_snapshot_capture(struct xe_lrc *lrc)
> >  	if (lrc->bo && lrc->bo->vm)
> >  		xe_vm_get(lrc->bo->vm);
> >
> > -	snapshot->context_desc =3D xe_lrc_ggtt_addr(lrc);
> > -	snapshot->indirect_context_desc =3D
> xe_lrc_indirect_ring_ggtt_addr(lrc);
> > -	snapshot->head =3D xe_lrc_ring_head(lrc);
> > -	snapshot->tail.internal =3D lrc->ring.tail;
> > -	snapshot->tail.memory =3D xe_lrc_ring_tail(lrc);
> > -	snapshot->start_seqno =3D xe_lrc_start_seqno(lrc);
> > -	snapshot->seqno =3D xe_lrc_seqno(lrc);
> > -	snapshot->lrc_bo =3D xe_bo_get(lrc->bo);
> > -	snapshot->lrc_offset =3D xe_lrc_pphwsp_offset(lrc);
> > -	snapshot->lrc_size =3D lrc->bo->size - snapshot->lrc_offset;
> > -	snapshot->lrc_snapshot =3D NULL;
> > -	snapshot->ctx_timestamp =3D xe_lrc_ctx_timestamp(lrc);
> > -	snapshot->ctx_job_timestamp =3D xe_lrc_ctx_job_timestamp(lrc);
> > -	return snapshot;
> > +	if (lrc->bo) {
>=20
> Please handle error cases in if branches with early returns, and do the h=
appy
> day scenario in the top indentation level.=09

Sure.

Thanks,
Apoorva
>=20
>=20
> BR,
> Jani.
>=20
>=20
> > +		snapshot->context_desc =3D xe_lrc_ggtt_addr(lrc);
> > +		snapshot->indirect_context_desc =3D
> xe_lrc_indirect_ring_ggtt_addr(lrc);
> > +		snapshot->head =3D xe_lrc_ring_head(lrc);
> > +		snapshot->tail.internal =3D lrc->ring.tail;
> > +		snapshot->tail.memory =3D xe_lrc_ring_tail(lrc);
> > +		snapshot->start_seqno =3D xe_lrc_start_seqno(lrc);
> > +		snapshot->seqno =3D xe_lrc_seqno(lrc);
> > +		snapshot->lrc_bo =3D xe_bo_get(lrc->bo);
> > +		snapshot->lrc_offset =3D xe_lrc_pphwsp_offset(lrc);
> > +		snapshot->lrc_size =3D lrc->bo->size - snapshot->lrc_offset;
> > +		snapshot->lrc_snapshot =3D NULL;
> > +		snapshot->ctx_timestamp =3D xe_lrc_ctx_timestamp(lrc);
> > +		snapshot->ctx_job_timestamp =3D
> xe_lrc_ctx_job_timestamp(lrc);
> > +		return snapshot;
> > +	}
> > +	kfree(snapshot);
> > +	return NULL;
> >  }
> >
> >  void xe_lrc_snapshot_capture_delayed(struct xe_lrc_snapshot
> > *snapshot)
>=20
> --
> Jani Nikula, Intel
