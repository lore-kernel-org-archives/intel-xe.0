Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C51AC52D7C
	for <intel-xe@archiver.kernel.org>; Wed, 21 Aug 2024 19:36:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 456D010E6A3;
	Wed, 21 Aug 2024 19:36:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V9Htg08j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3695910E6A3
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Aug 2024 19:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724268961; x=1755804961;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=SEH26qrTvS3CaggrZcDpcxbx0q5vx6zvMB3Vme3DL6U=;
 b=V9Htg08jBbCZc1KL9VHd0KiXNiIDPmOqyEha/2zGAa9zMTDCoipTghty
 5KtDYJqP3nVdtHVWZRLlqRBaBP9nemrDy3pjDXmEZKVy/0zFxOBD08W22
 Tv8JJIcDNP1mDaEGZLLEGDAK7L4IezMpokU2QAxYYmd753UN5ahxl5hqb
 Lc9DflOkaBPM851EjBH1sqGeJ5DFHgzORdixlNspZ////Njk2PbUijfan
 TdK6r7xkRlQr6trIWSUmwA7yfe6kuzq7ZeEnaH1CkMGWf1fyMHAK4XAFB
 rdLeyitWp8vi4uK19T4iAqeRd4vllhXtGhAMyrMdpCbK0DjOz8IYTr/zt g==;
X-CSE-ConnectionGUID: yro02+v7QfiXbAqtG1TwiQ==
X-CSE-MsgGUID: zEMzJWbtQGOU4lCECjoVzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="33316571"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="33316571"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 12:36:01 -0700
X-CSE-ConnectionGUID: Ruw0/76XRLSqiCD9KWULIQ==
X-CSE-MsgGUID: lZEGwRo8SJulq98pg7pdvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="66020531"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Aug 2024 12:36:01 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 21 Aug 2024 12:35:59 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 21 Aug 2024 12:35:59 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 21 Aug 2024 12:35:59 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 21 Aug 2024 12:35:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qUvr+bxsZpI4GwoHgIeuSl6pwpHzCG0PTRSh9ae4iG+8xz3jdUrl3xwnoDaYwk5xOjI6YtE+Usmfqhps+GiBPmY1PeM3ui1sAh5XFXtTNHMbLcNoLwZswS4pA+msYj7Lh85YapfZUIshJUAySh/ZdpkrCLPtfvpO6qb0XWSg2+RhqPsgvFqVryT7dVh/N0jaTEGyZvzbK0XtusldgBblitgtpGM7tYHqxr2EcVXDu8uPJ5HMwdi/APi5b+Cj6vW1E4Ii34i3U4VzGrQsMXWo2PJFy4Es0g0fSoJqEdPmXtN1ziTucDUzAVPj6GPgmKWcVGsUltOjc5txcKjdCx3MgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xky6vUQOSi1sSyV9OzY5vHDgn1wa5cC6TuB4h9gla54=;
 b=U5AHh2ZnV6cO1KTpyIV7bNH43TFb5LkynAKz3aDI0/OIvwlEFx9sut71DDioyEq1nLKLt4GojVUti+rwYxMOyPKG3qwp/RzlVRNXcma9qMsJ6EO4uAKYyrUCN7IpAqRuVHFsKFFJEqtFSzMgP9GrKVNWi4ifWZJUy7EEr8fke7gGHKw+eDTe+7AtgcMUwdNM3eRGQKSHK+2DLQFPDL6orE4GGcfEOiQQ47Ll0O+MoHVP4VXwuUPefok63j6Uf5VD75OSG9xE/LaACUOBrL44bKiXFn7ZMO2H8dimUM3JuWf6TkRWMzrQy8ic0JTU1yqog+8HqXa8um4eNdUQQStl+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CYYPR11MB8360.namprd11.prod.outlook.com (2603:10b6:930:c3::9)
 by CO1PR11MB5042.namprd11.prod.outlook.com (2603:10b6:303:99::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.18; Wed, 21 Aug
 2024 19:35:51 +0000
Received: from CYYPR11MB8360.namprd11.prod.outlook.com
 ([fe80::4a38:8db0:72da:d89a]) by CYYPR11MB8360.namprd11.prod.outlook.com
 ([fe80::4a38:8db0:72da:d89a%4]) with mapi id 15.20.7897.014; Wed, 21 Aug 2024
 19:35:51 +0000
From: "Cabral, Matias A" <matias.a.cabral@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Chegondi, Harish" <harish.chegondi@intel.com>, "Nerlige Ramappa, Umesh"
 <umesh.nerlige.ramappa@intel.com>, "Degrood, Felix J"
 <felix.j.degrood@intel.com>, "Souza, Jose" <jose.souza@intel.com>, "Ranjan,
 Joshua Santhosh" <joshua.santosh.ranjan@intel.com>, "Kumar, Shubham"
 <shubham.kumar@intel.com>
Subject: RE: [PATCH v2 1/1] drm/xe/eustall: Add support for EU stall sampling
Thread-Topic: [PATCH v2 1/1] drm/xe/eustall: Add support for EU stall sampling
Thread-Index: AQHa8C5c+HX32gF1pkG4mkU3pdLp9rIyILYw
Date: Wed, 21 Aug 2024 19:35:51 +0000
Message-ID: <CYYPR11MB83605299AB7259BC17AF3E38B28E2@CYYPR11MB8360.namprd11.prod.outlook.com>
References: <20240707224141.2865472-1-ashutosh.dixit@intel.com>
 <20240707224141.2865472-2-ashutosh.dixit@intel.com>
 <878qww3xh8.wl-ashutosh.dixit@intel.com>
In-Reply-To: <878qww3xh8.wl-ashutosh.dixit@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CYYPR11MB8360:EE_|CO1PR11MB5042:EE_
x-ms-office365-filtering-correlation-id: 865df4ff-b495-49a1-1eda-08dcc2187726
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?sT5dtAAFsQJMExCgAQbB2kHmH0QFANWq6yZ+s8Cy2eZRQTpdZY/vVoFQ722X?=
 =?us-ascii?Q?hWW+31sCPINeevvto3ggdXbdyp/kOIgR+kfJjKmcnOehAaE73Mvpb+Np9amI?=
 =?us-ascii?Q?R7bUG+fQ/7igAWSudCcnE/ER8C7RY9813xmOrENalv5JpFLH0otrUtZvPD1x?=
 =?us-ascii?Q?neOkfrOhnpgoHvzqA7I1s7XAfSG8zxW5xmMGhc7nyxgvhRpsTkvukc90oxuY?=
 =?us-ascii?Q?aEeq+VbQc2BGyDKFyD4wX3QPCQRU2l4yOoHlkGeyeJ3kNoqqCk7fi+XQDFzW?=
 =?us-ascii?Q?Vzbmmw+tx8kJbj6Qh7uOXCBmuhi/tdBsQX+XMmTsuhwTn0IkRwY18r764kfk?=
 =?us-ascii?Q?HVoaH1Jal8xsMUsuWq60JUTL0IJSnAo+DlpcAoMQzN6VClr5WnZwPQYayUz1?=
 =?us-ascii?Q?axxKSJ72r0XtQ0gp9ZAmk5FdO9dDa1xyNFdzxIeIUy4+9flpe8vvvwLuq/wa?=
 =?us-ascii?Q?aYttkkgpomewNzLquw7D95IT02+X61R0LkrZ0ky9iBPuQX9RCHdQrmuyYGCX?=
 =?us-ascii?Q?O1IocHsRrkh7cmi48LWsVCq7OaV3VidaVfsTsdPcvjHap5U+Nb6CqM9DdHqf?=
 =?us-ascii?Q?tOucyFUz68Bb6JmpSLkrMbS1IPK2G89K8Tc84pUfcG1VRnXNXosz0qcSFsHp?=
 =?us-ascii?Q?uytlhfNsywVuTumwKm0a8c7IgzcXONF5B4xPuJ9GgEfUtbHxsqrxHUD5h/GX?=
 =?us-ascii?Q?uXKRHhs8eOWMRz22Vww1WSFY2+7l3+spK7fzZdmU3Coy5/WSMI2E72uWrqC2?=
 =?us-ascii?Q?KDeWJk5VKvE1l0DeIN8Wk3QPzldTclcPaF0O6EcRLNz+SOZFm3gvjCSHvi2w?=
 =?us-ascii?Q?TRmVZJ6X+FI7TJpb92IlQUnxvDwO6hdfOj2BuGeW/hYZ+Y+2akB+XxInYcQ0?=
 =?us-ascii?Q?1vIpOQgU7AeXE+viZflBt+4jjYh6EycWnUphEFQjlhLxQNUok+x+5Jx3WCHg?=
 =?us-ascii?Q?XfqMv3lhMIgIPK/inXe6AHp/vNhBEYZY3Qvj+Ds3cI1AIGTThv933RbdqMFD?=
 =?us-ascii?Q?DWPMmGWV+EiJj8w50peBednG56WxatPopoHO3V2wGZ6MmdxAH4kx1tDd47q5?=
 =?us-ascii?Q?jsEipATPE8RT4VrLHoxflpIPU3S8uO+T2D9+SziYkRgM4BUW+NGPAA92sLFU?=
 =?us-ascii?Q?rLqRBvm15y0fwXVe2NCve65NIkZAGYnfEkTH15N4/ogM5wGVRsuqWbPeu1um?=
 =?us-ascii?Q?hziBq/Ap25YQ1RruR4Zu7f/XKhffxH1z7ARjotyj+oOdwRRW7gyb34mH1BN6?=
 =?us-ascii?Q?7/ymrsT8/r3qUvUjG48sRSG/fEEWYn42/fqQSAug0xtqn5Z8hwEcrxE7oPpB?=
 =?us-ascii?Q?ZuNY6wsSkLqVpWBrZg//IY8zdk3iamUyrDYj5IU5WNpN7k8hFa7ma5gRpRiX?=
 =?us-ascii?Q?HP8EWOiM4+XVZGnB/g6GghNiQls/k5Klfat9hg0IO4+pKzkdcQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8360.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?vJw9ZipuKZiQh64KZ+B0bov71gc+u2UMLtgNQdS9InSZyBurqjlw9foUyuxi?=
 =?us-ascii?Q?PO5kvx/7gXgKeBVrKTvmccRWoSQNiSUv6TQHBDv2TGL8qG4hKU3nl+giI2Vt?=
 =?us-ascii?Q?ZN9eaJniGDqDNF1VE7VgVKhQr2wagGfu61H6bZbaGBNS5+mBReP2iq08Y4uW?=
 =?us-ascii?Q?OJQa0bzsdqNcVdiukQlg5+1v1n8K9J0QJbfBXeBhcQgPh9SCU3ZD3E1f4AVj?=
 =?us-ascii?Q?dQH5QJeGj52u3KhEzHbU/r3aJ6mOVFYZc76w38PX9w8NvZhGgSXZgZ2B2g15?=
 =?us-ascii?Q?NsVrocg8YEHqKY67FAN7JV57Np+IopF0TpvmeBwXpPx/Y2wqDXARgQnFrBrU?=
 =?us-ascii?Q?yxSNhi3BPMVMNdl9g/O5/TzIs/PfyhWCrcIcf9UX4T82+lO+6+6Fes1zsATK?=
 =?us-ascii?Q?ojbH89iwlaC2qzNNU68sAAjmdKhDGAYU8vXYgUNQBg9Gqb21GhWItIYbzD3x?=
 =?us-ascii?Q?vce0oYO0wvBZeVnfpSnmAhMntPCPQ+EfL0HLG5zRgD5akCbkDwpgVyjezO9b?=
 =?us-ascii?Q?VttLL6A3XuZDtpGrIjilo5cslZFlbFAxir1x8KH3+Mg0FepRh8blvl/88/II?=
 =?us-ascii?Q?Lr+saG1HhcX34vPpEyhIh5bUZEesrOjD9Da4V/6ENadG/r0zs2W/z3pTAl0v?=
 =?us-ascii?Q?1URf5teMi8jHaJKmVAovFibUiqPLwBQ/jN74M4g9s4J1Kz96WHvwVY3KtQVP?=
 =?us-ascii?Q?j6WoMQUKuyTmLLD3a3li7k1CGkyW79vYj4Jgsi+FxqLwpHGreYopBy0rlARW?=
 =?us-ascii?Q?78d3lzQaIePrzL3d75DZIG21ej1bRiUVyR34bliypTzHVVvplSDdcNtBvpo6?=
 =?us-ascii?Q?Lr2uGbzaJRgTl1Qjwzd5fM51L4NA7uFJUpQTBnM9hpWzFLGm543l6dcWS8Q2?=
 =?us-ascii?Q?NhXm6rDJ/W5apJZk51TatsxwnzNwV7AxdMXVoLmcPtwTv1QtzukUGoEbI+ip?=
 =?us-ascii?Q?oyqgrwnCXInIwC8iR7QGmb9bQfGGjR4kgLdWIhI/6nH6b1dZoPq9FbcJZoNa?=
 =?us-ascii?Q?10QjGrXNyohwcLTHwXPDBioPG4fEDovHPKGFXIKpnF5AH7xDt6A0yUmWr/wY?=
 =?us-ascii?Q?TErWPvvbq5pqZBrYZuk4cQQMB3ejG5HoxgG4YuY+R7gk6nLHSoxkPxSjtGrO?=
 =?us-ascii?Q?LKyafgEHaRB9GRd/XP4HcSGP5UB7rTIp5b82pCNEVYUFZZe190wz/ob+3mcN?=
 =?us-ascii?Q?UHHYdfeX64G68Vo0xUNUKpaYCxat2+g5g9Tl5nlls/O18ddOeDu0XezLg3j8?=
 =?us-ascii?Q?xAhDUC8ms1EtLnL8sObsgbIGCrMwCrP+BkGA/D6HR/XcPjwEhqj+7vKDhz3S?=
 =?us-ascii?Q?4NQPuryjD6EheUiesEYAUjqnfTxZKkE03TU0U8UCi6V86EYcBeDZfNEWk0or?=
 =?us-ascii?Q?BEP+vgjKdAJXLbEL829jqDUHmLWhsYcBLIbqnkKLNtUMgQ/LGl8FDLFLLZ21?=
 =?us-ascii?Q?gmvI0xkIMb5oC6cwgOn5ZUeLMG9qPYsAEBMXjiWwtRW/n/XfmLbJPl2877CG?=
 =?us-ascii?Q?yBDHfpmpzxuNcpYqRjL2FBMQGjosf96qD0uff4N2cumv5T8VRszxCY9DJlnf?=
 =?us-ascii?Q?bZYyx1XMqWE6Z3VQwP3ZcMf6F7Ch4ze2stYQKuHu?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 865df4ff-b495-49a1-1eda-08dcc2187726
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2024 19:35:51.3341 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: grKFLTftmjKw8Yqn8A5qRqfKqTvWLNk3NsqfFjJtect0XqyrCSCYqrFCSGsmMEnTuMyC4AoWjVkH133bRAon9+c2VagUNnGNSdQ7/HVkKHU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5042
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

Hi Ashutosh,=20

Some inline questions below [MAC]

Thanks,=20
_MAC

-----Original Message-----
From: Dixit, Ashutosh <ashutosh.dixit@intel.com>=20
Sent: Friday, August 16, 2024 3:38 PM
To: intel-xe@lists.freedesktop.org
Cc: Chegondi, Harish <harish.chegondi@intel.com>; Nerlige Ramappa, Umesh <u=
mesh.nerlige.ramappa@intel.com>; Degrood, Felix J <felix.j.degrood@intel.co=
m>; Souza, Jose <jose.souza@intel.com>; Cabral, Matias A <matias.a.cabral@i=
ntel.com>
Subject: Re: [PATCH v2 1/1] drm/xe/eustall: Add support for EU stall sampli=
ng

On Sun, 07 Jul 2024 15:41:41 -0700, Ashutosh Dixit wrote:

Hi Harish,

Some comments below on just the uapi first, towards finalizing the uapi wit=
h the UMD's who consume this data. And also comparing the uapi with what we=
 did in OA.

>
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h=20
> index 19619d4952a8..343de700d10d 100644

/snip/

> +/**
> + * struct drm_xe_eu_stall_data_header - EU stall data header.
> + * Header with additional information that the driver adds
> + * before EU stall data of each subslice during read().

One question to resolve is if we really need this header and if UMD's are a=
ctually using the information in this header. In OA we dropped the header a=
nd are providing information in the header via different means (see below).

Another option is to actually add a property for the header. So headers are=
 added only when user space requests headers.

> + */
> +struct drm_xe_eu_stall_data_header {
> +	/** @subslice: subslice number from which the following data
> +	 * has been captured.
> +	 */
> +	__u16 subslice;

Do UMD's use this subslice information? We should check with L0 and Mesa ab=
out this.

[MAC] L0 does not currently use this.=20

Also about whether UMD's need or want the header itself. For OA, UMD's were=
 happy not having to parse the header.

> +	/** @flags: flags */
> +	__u16 flags;
> +/* EU stall data dropped by the HW due to memory buffer being full */
> +#define XE_EU_STALL_FLAG_OVERFLOW_DROP	(1 << 0)

In OA such information is returned via DRM_XE_OBSERVATION_IOCTL_STATUS. For=
 EU stall, e.g. we could return a bit mask of subslices which reporting dro=
ps. So similar to OA, we could return -EIO when HW reports drops and usersp=
ace optionally issues DRM_XE_OBSERVATION_IOCTL_STATUS to retrieve which sub=
slices are reporting drops.

[MAC] having a return code to notify of reports drops would be much prefera=
ble. This would allow the UMD detecting this condition during the read phas=
e without needing to process/parse each report.=20

> +	/** @record_size: size of each EU stall data record */
> +	__u16 record_size;

This is static information. Does it need to be in each packet header?
E.g. it can be returned via DRM_XE_OBSERVATION_IOCTL_INFO after a EU Stall =
stream has been opened.

[MAC] since the size is constant, it seems an overhead including the info i=
n every report.=20

The INFO data struct could also include a capabilities field. So if new fea=
tures are added to EU stall in the future, they would be advertized to user=
 space using the capabilities field.

> +	/** @num_records: number of records following the header */
> +	__u16 num_records;

This will not be needed if just return raw EU Stall data without headers. O=
r even otherwise it is probably not needed, it is the total size of returne=
d data minus the size of the header. Provided we return all available data.

[MAC] the KMD will always return atomic units of reports, right? Then this =
is not needed, having UMD the possibility to query report size when opening=
 the stream, the UMD can know how many reports are in each read.=20

> +	/** @reserved: Reserved */
> +	__u16 reserved[4];

This can be handled via 'extensions'. And if headers change they can be adv=
ertized in capabilities.

> +};
> +
>  #if defined(__cplusplus)
>  }
>  #endif
> --
> 2.41.0
>

Thanks.
--
Ashutosh
