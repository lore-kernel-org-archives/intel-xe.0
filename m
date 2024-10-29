Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA12DD74943
	for <intel-xe@archiver.kernel.org>; Tue, 29 Oct 2024 21:50:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A65910E3B7;
	Tue, 29 Oct 2024 21:50:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h0SlF+E5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0F4110E3B7
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Oct 2024 21:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730238615; x=1761774615;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=v+mZDeWMsRPdDt0bQc1ME4zbYuQM/q/BqYqgGLnTRlw=;
 b=h0SlF+E5VvA2Ey0f+3s+UdLqH+NXLa5EpHcY9ZXDmRBH93SdolQP7v+8
 Kq9yaSzpPWH0ebYN8yCeWhDL6pcDPOH/VtUIec+8bSiyzzP8nqiqDxCZF
 ygfCjnsf42AxZ+ofR1DJ1vy1Pm2Gjw5Z7aZjC5KeAPhEUObza2MoiRgfv
 /GwMIVyZY+iY3ByVJeZOt56VcBftrlmeKu2nDcohp4qwgPHi3KcY0URuU
 W3jI4Lhr6XS7DZnu9+3SVx7WyizH2gzo32s6jWT0OJDvtHkL94MjNs+Jt
 EdS37vwdIerBlg5Gbca2BBodrAznR7aaRBcwmMtojcUKt3kz0nXhWIt47 Q==;
X-CSE-ConnectionGUID: bbMZyxRNQR+JGa0eoA+Sgg==
X-CSE-MsgGUID: PCLxp7viS7Sv+JUcDfnQ1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11240"; a="41274883"
X-IronPort-AV: E=Sophos;i="6.11,243,1725346800"; d="scan'208";a="41274883"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2024 14:50:15 -0700
X-CSE-ConnectionGUID: qSnKkuZYTqWc3sZN0QGLUw==
X-CSE-MsgGUID: zXJ0NlNIREuFWkXwc+xOng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,243,1725346800"; d="scan'208";a="82015690"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Oct 2024 14:50:14 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 29 Oct 2024 14:50:14 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 29 Oct 2024 14:50:14 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 29 Oct 2024 14:50:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RBGu9BwNOicexzrGCLFwwNHdRMEqg+E3G5qvA2xmyD8DJbDFHEQpCIDG06ssf9oqw7S+EsEI432RYA4MRITBN5u0D5pTvzyUVARj1s89OvYA2AS2XzxyR2cP9iiD2f+BaorVclo2AHeLuY5Vj5nOtg03lXN0ixL5X3wsPgT4WoRK1cVwuz2xT2wWYXOptLw//inKfi+lcU3SgLpevods0AWwWdjU9qgj8JRoq/jjDkPm+tlDo7DLACmS4tkua89+Ui92gS7lB+lyNW6Tki777f/vnb4DgZaQD42FZk98ptOP81URi6N2ggojjaARKTSwkkqPa5+wyWwtzxtL5YIXJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MAUTVWOEcTXSS6mIHJcZWk7y1TJ8O087Aj2dliwneAU=;
 b=RBjoxWcjlD8s9vtoZTRMiKEFijWSHCsJyj7Tz3p1JxM3sYAtP3INYSgp0UN7R1vfMGj2GNoOkup0zJrRBgyhz0BMskMHgMRACek/i+0KWr1z7EwlEivlGrm2AiH9GO5VibI6Oa1iR6hgBHoCFBp0SBZdLXAXh383kyq6P3GVR4dak3mN6UFxOkeIGfMmXg+hItKxSllhISMRd2idWsrF7pC5wOd70Mae3dH1PUxjZw4Y8AYQli6MaQrS64YAHGAO+/NjtUtLrm2YO6vQ8/Q9zgwFxyjsc9VAgdouU4Fi7XF4VjYKfWaWpY5LXbV0MJOr5earbMsDdRh9TBnORTyqSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by CH3PR11MB8706.namprd11.prod.outlook.com (2603:10b6:610:1d1::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Tue, 29 Oct
 2024 21:50:08 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.8093.027; Tue, 29 Oct 2024
 21:50:08 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Nerlige Ramappa, Umesh" <umesh.nerlige.ramappa@intel.com>, "Brost,
 Matthew" <matthew.brost@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v2 3/4] drm/xe: Reword exec_queue.lock doc
Thread-Topic: [PATCH v2 3/4] drm/xe: Reword exec_queue.lock doc
Thread-Index: AQHbKku7uyPBRIVthESrN+ne+EErYrKeRECA
Date: Tue, 29 Oct 2024 21:50:08 +0000
Message-ID: <CH0PR11MB544404FA0C31ECA1A75E7C68E54B2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20241029214351.776293-1-lucas.demarchi@intel.com>
 <20241029214351.776293-4-lucas.demarchi@intel.com>
In-Reply-To: <20241029214351.776293-4-lucas.demarchi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|CH3PR11MB8706:EE_
x-ms-office365-filtering-correlation-id: f83082c5-3b30-4aba-c966-08dcf863a807
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?pct2W1+5vvHGaueqOP4N8SGNeW1MOYiQ6HMk3fSqyVy5n1YN6geczSmxbj/w?=
 =?us-ascii?Q?IpK45BiEWsWXT3pUdlAyjpSzeQAScinpqjlsAXXnlxr3vtR4Hpbybf08AQw4?=
 =?us-ascii?Q?wcJZhZfG1QsddQgEVJFyqeXzIDW8vYIRxgRgbUn/ntKkZfvUGA3ctLyjYx7Z?=
 =?us-ascii?Q?/kBk8ej6fmWatboQTGRt4bRcAgSRoXRAuSSgfn9iWxNLLK160KHC93uX1pPi?=
 =?us-ascii?Q?YZIG5209Me0nCd/aTC85cFFCIdZKgNpVK7IAT4OnyqJZUw2FsM14xjKfv91h?=
 =?us-ascii?Q?B4AD/DUdXbXvtx0N0nyYByLXJX1dc92JcO9fPVQEyhFre+CW2YLXfELuD6sW?=
 =?us-ascii?Q?KSLuQN3I0E/S/SYq/MdzB+3lvlXdvhcAQPTT40BC23+/izRi9FfMOmsWfPCr?=
 =?us-ascii?Q?ygewZ+tRaD+r/sbfx5L9nFpk6dHc5BpNAKjLgIZ1OIh3i6hEfRlIn9al3J13?=
 =?us-ascii?Q?4Hy6sdYkTgXcajO+SMuHgCtzbYhPDLAEdt8IvEUyn+LRmD1uq7I2KDNTC7TQ?=
 =?us-ascii?Q?jDu792pkwq+RQfzDRXoIX9NELPdTgpd7fIf7Z3NbmSUyZe5AP0dtnxpZV22j?=
 =?us-ascii?Q?Jv35cD+rkIWyR3ENiIprA1fQBphJ1XQZuKiYJYiRAkrLY6JRLSBzi/K8N2Zd?=
 =?us-ascii?Q?S7oK/rsSm8BpiAMGIV/5goJr7sI0QmmaGYMvIooirDFb6+6F9emUdvEhCAwB?=
 =?us-ascii?Q?wERBk2rEDLGGGFgdzZcaU5LsN+olJue6cdyJKrIb3KV2YG9XsxpbJjntTfpp?=
 =?us-ascii?Q?NY8+s/iA2YC82HutxWfIjP6p1kj8fSqK8pK+ESoyfzt9/KtUTiwE62KaJjwt?=
 =?us-ascii?Q?ION30ICst/FsKKs21vVLVzqo0zGEE+dThitX5pANOj8ZSlj0yo11d32tgxgr?=
 =?us-ascii?Q?2mJKBayBVPCO7fvOCMCOiAQqQUZMq7cV7e7/Frf7LEGIfg43EBqRWv+zooQR?=
 =?us-ascii?Q?halNW4PCt3j6yeJhO2P1i9AOYuNrFxBSU4Rprm2L9iyKq92OBI23vhu+TTKp?=
 =?us-ascii?Q?vmldwnOoT3r+d3iJMaCoAqNlxJpu7deLEN/AwKoaf7vJne0W2le+3u37QyMF?=
 =?us-ascii?Q?jeBAIj9u5dMw2qM0HPIWveQ2fg4es6FM6Pvnz7KIVID2nWt+1HhvgsHnVIxB?=
 =?us-ascii?Q?RucFTfm73+LLgGvJTHr4A1vpyP+Y21tqLck0qMFE4/9kKh2prXdAdInpypHO?=
 =?us-ascii?Q?ONc5JzfQy6LrDPRKvq3pT44ZqrdPYBM6+Akwv6PA7BgyaSk1eDGTufeFn1Rh?=
 =?us-ascii?Q?ic/fGPYqphEM40PJYEV1KSn9tpaUPZ1VeVZCQGz7TFnEjFVM60oTVQc5Zjfo?=
 =?us-ascii?Q?mOvfHoStpaw6yEfc3eEQle27YmsgRbsfsCY03Ql2UONSdi+CDj5MEtaNxqF6?=
 =?us-ascii?Q?JKdf96A=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?QD2xPAwMP5V1vTgHpoQibdMLAIiws6uDA4MnIRrBR4IqB8Y1YzC7oc0/sHyg?=
 =?us-ascii?Q?zJiFUp+gq35LpwoOUzFjp0XKWhhLBKjqr+yLxryUIWxmWNsmaDOWzM/Np2/J?=
 =?us-ascii?Q?dDSfWOq9zYzcUFKOB/Qlqq404IbZkv98TM4vTgbL22QOCl3YbDcBKLk2TK7p?=
 =?us-ascii?Q?Nt9CrpYk+Q4nh1EdZBh4VYvwsZSJ/MzJvBXA4JxsAyZlJD83VQ1kS+NwT0FY?=
 =?us-ascii?Q?PRrdVx2Gi/uFQzj/NSOHSTBWDj1gt+Oj2sDJNAAjSBrcDkR+2jor/ekCaKiZ?=
 =?us-ascii?Q?ezx/xgjaXUWfgAtGX88+0N8YXpsNTg9/IGdXwHx6J3fiUBUY++oEOmVu8a3e?=
 =?us-ascii?Q?JN0cEkrkS9ISAvnElkdo88nzU0lBPDQx3fcKy67KZs9l+do7cR/T+kqSNUPG?=
 =?us-ascii?Q?WSPF/dG2Ni6C3d3YmjZGyA8dv8H4H7tsTNY9PN6mogaNaNMBXo4vyHK/+iOH?=
 =?us-ascii?Q?O/p/hQmgTKKo6pHygqTI85rULFCWCK3PgIutIwE6LWtAyCJX1F0/oUr+zGfT?=
 =?us-ascii?Q?w0iFLjUfHi60W7lgnlAZ/+qSGPCIda5DSv9GWxkVc5p+CqRqupKnOSXiO5nw?=
 =?us-ascii?Q?rOVVqRVmjAmBYdSGtRT3n9zWMjprieyiuUm16habN4r1+OfB3XpSgxYdcmGd?=
 =?us-ascii?Q?R7pv7xb5Vt9Bw4PK4FbL9CglyHSQs7XFp+jTmg8pq77Hp3PyCD4LA0Xfz2PB?=
 =?us-ascii?Q?YRq90nm7RHMij1zFkdAt131VKetXFkgqtvmoWnt9iCFYTauNs+R3opME2bfR?=
 =?us-ascii?Q?XSWhR3/SlTh+1rBLgRUvmACJTmO1/jLaH6rMMLbCUSOrOnLGit+oHEVNwvFK?=
 =?us-ascii?Q?vlMN+V5iEEf9h/1458lIbLzQfkMj4LwNzgClJ59lvweEf++eDLYo+C7NHojO?=
 =?us-ascii?Q?oCpfrhwhVsqDIQab+9YQYR0HPw1+9JdNGAtJdwlEjlNcr2DMrSJNWWb6Qeya?=
 =?us-ascii?Q?F0sDybijhMqYPANUxUukcsfzDmSj7iNfmSlWk7YL9mscMSCtiy1+rFrjjzCR?=
 =?us-ascii?Q?Z0ebM8Lsz1RkPmL5/R11rwNwkKcfYS2HJdD4AxjU+va6mNDix625vtiKVQqj?=
 =?us-ascii?Q?dw+0uIssHs06B7El4Tb9o60tXoojFgMFibUYYO0Hfn2XLakR+H9rZJxKqG+o?=
 =?us-ascii?Q?17VCQF+JPUdllk06v4arPPHMjoszfMm4ybe4OZBPOTWJJNTizPmpQ02f32D/?=
 =?us-ascii?Q?9PJPD9+XiVYANHkn25e/imN+EceMp7mgvB/0j+lb3kyGGxDb+rak69gkdGF0?=
 =?us-ascii?Q?Ecrpc1T9yxeH/b3jeGhmP/fKkLCmdRtd4dbLopoKlL21xgjvYAMF2/Ii/a0p?=
 =?us-ascii?Q?wmrtK4k/i5tchbDaLgTaPnZgpWL8T1nPAwYqUaqKX+su9GWuAU1VuGvczd9A?=
 =?us-ascii?Q?xTMP3v/VBSmyYuRkTiEgiBKAzB4SXdmxX1vuIGUBIt0OyHzuqyRpp0kMj+jy?=
 =?us-ascii?Q?H7GhAjsX/qnwvLrw1/nlEy2Gh+IS3Lb/fKlfwRq9JLe3QfBjeAsrWoTroHCU?=
 =?us-ascii?Q?PNCPQQ0BxtinCR0qUcgA5jifTubuJvy7K2mt1/8z/ne6kRTV4codV+p/cnvs?=
 =?us-ascii?Q?P6HBZcVVL6FrIi7GYiMqf2HNBrwUmn2JWJZeNPXr?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f83082c5-3b30-4aba-c966-08dcf863a807
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2024 21:50:08.3917 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 11UwVl49AeIbYKoJegkTr44993J6sTW4nVKoTM0s0MBJ1QP3W2mHEI+yqgEcgvXSy3fb88O6HQbdyngJZetd5QmhaNUCEpud27ARbfwDJg4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8706
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

-----Original Message-----
From: De Marchi, Lucas <lucas.demarchi@intel.com>=20
Sent: Tuesday, October 29, 2024 2:44 PM
To: intel-xe@lists.freedesktop.org
Cc: Cavitt, Jonathan <jonathan.cavitt@intel.com>; Nerlige Ramappa, Umesh <u=
mesh.nerlige.ramappa@intel.com>; Brost, Matthew <matthew.brost@intel.com>; =
De Marchi, Lucas <lucas.demarchi@intel.com>
Subject: [PATCH v2 3/4] drm/xe: Reword exec_queue.lock doc
>=20
> Reword documentation to possibly what it meant to be.
>=20
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Yeah, that looks a lot better.
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/xe/xe_device_types.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe=
_device_types.h
> index 85bede4dd6461..ef7412d653d2e 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -597,7 +597,7 @@ struct xe_file {
>  		/** @vm.xe: xarray to store VMs */
>  		struct xarray xa;
>  		/**
> -		 * @vm.lock: Protects VM lookup + reference and removal a from
> +		 * @vm.lock: Protects VM lookup + reference and removal from
>  		 * file xarray. Not an intended to be an outer lock which does
>  		 * thing while being held.
>  		 */
> @@ -610,8 +610,8 @@ struct xe_file {
>  		struct xarray xa;
>  		/**
>  		 * @exec_queue.lock: Protects exec queue lookup + reference and
> -		 * removal a frommfile xarray. Not an intended to be an outer
> -		 * lock which does thing while being held.
> +		 * removal from file xarray. Not intended to be an outer lock
> +		 * which does things while being held.
>  		 */
>  		struct mutex lock;
>  	} exec_queue;
> --=20
> 2.47.0
>=20
>=20
