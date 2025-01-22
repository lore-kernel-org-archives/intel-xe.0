Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 083AEC02182
	for <intel-xe@archiver.kernel.org>; Wed, 22 Jan 2025 22:30:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA25C10E31D;
	Wed, 22 Jan 2025 22:30:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JghME+Xt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 379C010E205
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Jan 2025 22:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737585007; x=1769121007;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=DXBgRqSy+hLQORqCtyzNRnWfqBXqAebDxyW9DEDIKrk=;
 b=JghME+XtmirFe3Lq3W6K6EmA0ioLSeFZRiLoO5yMpEpjkdWoo/3/uzPk
 QWU6Ou/06sOxGiGdO7/AIJ9Mc3Qy4tN49GlzvxM9nyeY66znDktp3Rftd
 +4oAOuS3MuvzePz7JxnxA6QMfToA2e+NrrjvFw0MIpa1XZhXU+NWoG5zJ
 Ojfz6lT0aagWrmNzoL11vYJEPabiscjJrR78EnlBfxZU6+pBMkmofCFE8
 q47SQLJqFvm6iqwfgQpswG/HbUu8OpJDOZ1NB9h+N9QY1YTRehPFE+uwt
 rQpO+IeZ75VV9cZ9dIDWP48Fhy3bsa9I888rz63yHKA1uAFVbrblHxNqh Q==;
X-CSE-ConnectionGUID: q+p88GhtRUubsUao+4p+yw==
X-CSE-MsgGUID: coXN1xnhSv+cN1aa4Djpdw==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="37765324"
X-IronPort-AV: E=Sophos;i="6.13,226,1732608000"; d="scan'208";a="37765324"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 14:30:06 -0800
X-CSE-ConnectionGUID: Gc1IXl1FSMSLkCmm8h+4Og==
X-CSE-MsgGUID: glzKn9b3Roi5j83Uy6NfVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="138145159"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Jan 2025 14:30:06 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 22 Jan 2025 14:30:05 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 22 Jan 2025 14:30:05 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 22 Jan 2025 14:30:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q2ZJNpeHlGYx5jpk+NYCqIzVCC/zmlCgdDzKYKYURr1erJ/zjiuTynxgnux8aQ0ECj8AESPQkGECwufvWf+0sfOV7M9Obh7qZ7edHMP+4I11rqf9fuZvd6z1dOE1HcJ4uegiWemTgepE1CLQdcvF2URMmlIz0O8fqSbSRpZN/KgInFKCxi4qM4RRIaLBEZU94r4so7M+8/ore2rAEMw4dpFc5L1/YtBo1pCODQhaonvAS3PyA341AAkGZ2DV/SUwO1dSN9kqbKFcZWHsP9itLkIQ0zEf5LWX1X1XnIyjcix0jlQZKVTvA7uG16ZsQFnjT2CCvJe8YrPH6IpYYmKIgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5+j0jcguZ7BYRwReP+g/JcOKnlTjawVRp1EQTni3r4A=;
 b=mY/6kX3L1MJ8qlKi2Dc/Oopl3nbg1RL7MWQJANNl9gPlKmV8UGL3Pzqz7Qn6rYJNOAUwP9K2vrYLuS4xCN2jXHyRmg6YKC5fAKiSaA0Jf3vz76NfQH/pkU3RfsKmJtnX4FQPuYRG77kbgKFmfz4M1ehagBXXVhEehq9oEyWRfQafuERqwomoKfCWNogEdnjLzCfCyi2o6R6950CKKlOTnKqPxraSM2imayDLdH2R48L7j3mZI3NmJYLL//9oR3PFIFZCkXai+xhGKfvXzjCI1a5QXAJtcKdAuu0UWa605TmCv8UPInENDZZ/mJs8Da5fMizIuNzCRqPArgtiD0VbAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by PH7PR11MB6699.namprd11.prod.outlook.com (2603:10b6:510:1ad::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Wed, 22 Jan
 2025 22:29:48 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.8356.020; Wed, 22 Jan 2025
 22:29:48 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>,
 =?iso-8859-1?Q?Thomas_Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: RE: [PATCH 1/3] drm/xe/pf: Use GuC Buffer Cache during policy
 provisioning
Thread-Topic: [PATCH 1/3] drm/xe/pf: Use GuC Buffer Cache during policy
 provisioning
Thread-Index: AQHbbRe9Ds3tSz4QH0qdTfas5sQaELMjW95w
Date: Wed, 22 Jan 2025 22:29:48 +0000
Message-ID: <CH0PR11MB5444B51D20C9C4A5CA179FC8E5E12@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250122214955.632-1-michal.wajdeczko@intel.com>
 <20250122214955.632-2-michal.wajdeczko@intel.com>
In-Reply-To: <20250122214955.632-2-michal.wajdeczko@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|PH7PR11MB6699:EE_
x-ms-office365-filtering-correlation-id: e19ef8d9-a0e4-4e01-3895-08dd3b3447c7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?1q7Ho7i1+YGcH8QyNGhRvtYFGV6b+8i4IFbJRtj6DuwrJxiwIIDLWLrNs1?=
 =?iso-8859-1?Q?TEPtPb343dEsCgIFpOJSSX23h8mUqPWw1gqzPQYKlz3i7USsdIfCYN6yXh?=
 =?iso-8859-1?Q?vERuk0x41tVj448ziNSazIatbBmN6MN++mnzikNJ/fowTayT3rbucAEx5r?=
 =?iso-8859-1?Q?ZYN0IwvGtKKOQV/+c4LtBgHxT4erz2tb7nNS5svRkGS1PHJokNHqQ5jx55?=
 =?iso-8859-1?Q?jq1hBGLVMwkcAkJnDGxl5nAZPRSygNRJu+xPuZvfyGaEvSHpjkII7VkiTb?=
 =?iso-8859-1?Q?jfwK7yOF5L5nhHN+9AYoqj7X8BgfMSOWjLCsBk2nrjgCCtBu08/y9Cok5j?=
 =?iso-8859-1?Q?98wlsYO2OztfIXqiN3k01qNnRx6rQeyuIrhDYOMFWElURmV9cRKzOtwd6U?=
 =?iso-8859-1?Q?itWD1QFyTwIoSC53jzQtYyhH03YecH4RyjTxxc4v3RCDcdITYNRz40A2QQ?=
 =?iso-8859-1?Q?HQGYcbbYVbF+8S40xOKBFM/MEOdg80Fgv+p/miuoqMXThKCE5XIaM+E+jK?=
 =?iso-8859-1?Q?IYl70a3LcL8QO6dMUbfu3Ljg7ZLbZTQk0tvJnKTamhZKDcJPxEkfRwN5Dv?=
 =?iso-8859-1?Q?GcdK68/CWWPEnjyJytlJxU5Zl50vz21Xkh5U6323JF1XWTkaGMHc6UTp32?=
 =?iso-8859-1?Q?pr97SiDmBqm+TqD7uEpe2BZIBoQW+n8S+V7DnY0SlVIK2m7CJcXs6Y6m8v?=
 =?iso-8859-1?Q?XKYLSWJj0fnJpldghWKBzjqQ94jBsOaKXLv3T9Own55hPQsJTob3jrvdEv?=
 =?iso-8859-1?Q?62fwSsdmgzoQUwMxkIrcQCmYErcrbek85i8Tb5GSS0CmdXIt6b+qxFgiTl?=
 =?iso-8859-1?Q?IEUw7GMYpVtAZfTRITiIBrbRLiNY6nn/k1tNEmFPoBQhhxrZ7BVbyw4U2g?=
 =?iso-8859-1?Q?4wJ7i+aAk+PPcQoD/IlKxMykmGk0nJGjjiNllByrlB0n84gBD9m4XJAaNp?=
 =?iso-8859-1?Q?9hxz1HOsW2poN+jVdNp3PF7mZACUN9+nLp2tBigyvHT4iOwQMzcOSZPZnS?=
 =?iso-8859-1?Q?M2d4MiQ6GCMW4fPhTcTbt/Wr2XTRQFFl7V7cDUbQz3ViEhFpDg/Hq+Dqk9?=
 =?iso-8859-1?Q?aaodUozeOhMsCspv4m71QAn4gAgYUmBZDyKbzYpVdD9IjStUD9D2dxQtQg?=
 =?iso-8859-1?Q?JO3P4Hl9KeLrFy1qFJUxaurWkfB/i2yn9h74pU/sNWAfsJdsYw4YeeHo5r?=
 =?iso-8859-1?Q?+m3RTyY2LwilhNvGQQNoLOTJOnN/PHb9hx3qzeTiomYAkyOqHyOUcp32sy?=
 =?iso-8859-1?Q?2WsUlR7codkhqA2hgvVkwTWOasW1k2Fb1P0y7EwYCclQiUhifOQpv7eXqQ?=
 =?iso-8859-1?Q?xj48xViloqjMJF3oNNqOI+BPFXXjeykxYeO0OJFxNuDHNsi6EpmtaeX5Ut?=
 =?iso-8859-1?Q?bFME64EPA+A4GmsxifnxwVFsHqKeTMFZN4GlMWNe91JT8v82TiaBzPWCx/?=
 =?iso-8859-1?Q?qHpmIYEF4r/UIKfsq6P2kkVp9GrNvF74EqxqBE853q5/iEpRFj4mgM1hBS?=
 =?iso-8859-1?Q?rj2gzVbI5zhr+rkBkJI3Ff?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?uXLldLdxycufoD/r4IzbIpOtOC8jdPac9pXogysN30BPbLqjcRRLAS0DUv?=
 =?iso-8859-1?Q?BizySIJBqA4VMxr+3Li4+ZhbL7UZSXC5w4TauMZti99kVKuQmbtJgx9x9l?=
 =?iso-8859-1?Q?2RRLUS616z+QgLFZIfGmoIzWxBjFXbWfd69rqjGQLYbrErZW2zN7FUjnxE?=
 =?iso-8859-1?Q?mwyq4DTIq3BNUFAh5A+qUyFSziWr0xIsgn2zZ5W4eTCrxFzAeJ1fPVRtUq?=
 =?iso-8859-1?Q?uYcGKCEGDbZSpOWedbnvDgKwMHziVPAfdZAHStNHjG6FainQbXNgx6TgPd?=
 =?iso-8859-1?Q?Ti7rk3w3OhUF/8+cO4bNC90/4JCqfeQsbqZdHqdCg+0sQI88+KSY1j56rS?=
 =?iso-8859-1?Q?Z4+bfIOxHSs6jNWpDQyyQncGp9mJvpEh8vue723RyZFZeqw15bkvExzP0y?=
 =?iso-8859-1?Q?mcKJwUKms2k4wWXzTs88jHrVb881bj+IDYVw0ozYZcWMTD6GOuudqYOxLe?=
 =?iso-8859-1?Q?67HEWlGduxph/wX16Vv6fCkrYdWzLAxUnlITkrFn/X1x2EyFhhFlfh5UIw?=
 =?iso-8859-1?Q?n99XYBKP9XsRPj6XM+roCmlZOzH8EeTRog5YhaDX0NfnGqpOyiHZ3PyDb2?=
 =?iso-8859-1?Q?PRlbd81KdsrPrB/X6GgrbTbzLrIZEkjCRZb6g3u9tpLObHDfCbZHt4jJlD?=
 =?iso-8859-1?Q?4w40ldZx7EjDv0CJBMsPnDN/8Q+mATPL9qNdpkcbiFXorELJPIVlfrtxEc?=
 =?iso-8859-1?Q?cUFIxKOoggECvRONP0JrG1VRr2fhLf5SoI2cPZdm9BAxtirXMYzQq2SntW?=
 =?iso-8859-1?Q?zafMFowsKUYGvXVvA+pB4+a76bt43cIj/0eQxnm1v8Z6s9diRX4b9y0ndY?=
 =?iso-8859-1?Q?Doy31ENvh03BAFvVtfSmW/kpRsl9uc5uyQGnyA1NeZ8UEP8iQ/k283DiBJ?=
 =?iso-8859-1?Q?8EV6+bX+FTcIGCwqd1kgwncMhkuLp8/jv/pO/XGjtTZf16vQS2YRKZNq1j?=
 =?iso-8859-1?Q?iJzCf43ZpfDFXFJVIRT8NDd2QA+KZlxwvO/QhiKacJoaCRQ9Slep6BOk0P?=
 =?iso-8859-1?Q?S2ck5g+welfEk0ceLqkklg9CYz4oPMFwmjzEqdFxbHYTQlt63h7mfC6u0q?=
 =?iso-8859-1?Q?jr6lFRfkG+F8E7MjWnWA0r4uFylI3Wp+RYWYUbUe44WLh529N/95y99Q7H?=
 =?iso-8859-1?Q?Bq2TaTqM8zU1Ezk7fe4VGD+mJSAgCK/XvvEMx3O4UVMf0v7R8PahYU3+jP?=
 =?iso-8859-1?Q?S6Q4EGQ6zdkN7TdQuI18DS80WtOasEblOO8zFr+1VMs7z/AQy0OgCFHIar?=
 =?iso-8859-1?Q?Sfx2PXHc9lnguVAxZsHPmsEWARQAU5LIH5J1s0MARHFiYVSWyFyoTzF6R1?=
 =?iso-8859-1?Q?xUJJODpUKhFraN7eY0oTJQv9MzuNhtzcoJ7LC9DzFp0xbBZeGssO/l5iuE?=
 =?iso-8859-1?Q?GhHZ6xQcXYh8DZN9if5uXzp885WwMzWnga4p7SbeQNFEDqRRmCvg16AQ/M?=
 =?iso-8859-1?Q?vR0TFNGZ/z2K3SpzBa/hl2bg1QFO1/KG1r6YtKpYmS9US2WS13skADjrCo?=
 =?iso-8859-1?Q?WKDn3p+PRgB96CH9Lr6SvrEKElDCCxeiYpwwaJEQ5SUhdYT7SmC44TFhG7?=
 =?iso-8859-1?Q?bNQLQCawgqIe5dJSZmYH/gHmZxr85uet+NWNCAZJElOkm2D60CZRInKO9J?=
 =?iso-8859-1?Q?tRS6zK8BdgTBP5eG9QnrcKcCqnVYDIPaS8?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e19ef8d9-a0e4-4e01-3895-08dd3b3447c7
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2025 22:29:48.4605 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JFsbcLfRGfT7CNerVtzCvMght3V+kigmWrLWbXR9akixCQ5nQAx6kj0zFWbJZXQHNx6B9MxJ/DV7l45aK+YOG6IEf7S+R3Amg4DZAfKFLdw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6699
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
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Michal=
 Wajdeczko
Sent: Wednesday, January 22, 2025 1:50 PM
To: intel-xe@lists.freedesktop.org
Cc: Wajdeczko, Michal <Michal.Wajdeczko@intel.com>; Thomas Hellstr=F6m <tho=
mas.hellstrom@linux.intel.com>
Subject: [PATCH 1/3] drm/xe/pf: Use GuC Buffer Cache during policy provisio=
ning
>=20
> Start using GuC buffer cache for the SRIOV policy configuration
> actions. This is a required step before we could declare SRIOV
> PF as being a reclaim safe.
>=20
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Thomas Hellstr=F6m <thomas.hellstrom@linux.intel.com>

LGTM, though I have to wonder if the pf_send_policy_klvs helper function
is particularly necessary now that it's been mostly gutted.
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c | 50 +++++++++++-----------
>  1 file changed, 24 insertions(+), 26 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c b/drivers/gpu/drm=
/xe/xe_gt_sriov_pf_policy.c
> index c00fb354705f..4445f660e6d1 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
> @@ -10,6 +10,7 @@
>  #include "xe_gt_sriov_pf_helpers.h"
>  #include "xe_gt_sriov_pf_policy.h"
>  #include "xe_gt_sriov_printk.h"
> +#include "xe_guc_buf.h"
>  #include "xe_guc_ct.h"
>  #include "xe_guc_klv_helpers.h"
>  #include "xe_pm.h"
> @@ -34,48 +35,28 @@ static int guc_action_update_vgt_policy(struct xe_guc=
 *guc, u64 addr, u32 size)
>   * Return: number of KLVs that were successfully parsed and saved,
>   *         negative error code on failure.
>   */
> -static int pf_send_policy_klvs(struct xe_gt *gt, const u32 *klvs, u32 nu=
m_dwords)
> +static int pf_send_policy_klvs(struct xe_gt *gt, struct xe_guc_buf buf, =
u32 num_dwords)
>  {
> -	const u32 bytes =3D num_dwords * sizeof(u32);
> -	struct xe_tile *tile =3D gt_to_tile(gt);
> -	struct xe_device *xe =3D tile_to_xe(tile);
>  	struct xe_guc *guc =3D &gt->uc.guc;
> -	struct xe_bo *bo;
> -	int ret;
> =20
> -	bo =3D xe_bo_create_pin_map(xe, tile, NULL,
> -				  ALIGN(bytes, PAGE_SIZE),
> -				  ttm_bo_type_kernel,
> -				  XE_BO_FLAG_VRAM_IF_DGFX(tile) |
> -				  XE_BO_FLAG_GGTT);
> -	if (IS_ERR(bo))
> -		return PTR_ERR(bo);
> -
> -	xe_map_memcpy_to(xe, &bo->vmap, 0, klvs, bytes);
> -
> -	ret =3D guc_action_update_vgt_policy(guc, xe_bo_ggtt_addr(bo), num_dwor=
ds);
> -
> -	xe_bo_unpin_map_no_vm(bo);
> -
> -	return ret;
> +	return guc_action_update_vgt_policy(guc, xe_guc_buf_flush(buf), num_dwo=
rds);
>  }
> =20
>  /*
>   * Return: 0 on success, -ENOKEY if some KLVs were not updated, -EPROTO =
if reply was malformed,
>   *         negative error code on failure.
>   */
> -static int pf_push_policy_klvs(struct xe_gt *gt, u32 num_klvs,
> -			       const u32 *klvs, u32 num_dwords)
> +static int pf_push_policy_buf_klvs(struct xe_gt *gt, u32 num_klvs,
> +				   struct xe_guc_buf buf, u32 num_dwords)
>  {
>  	int ret;
> =20
> -	xe_gt_assert(gt, num_klvs =3D=3D xe_guc_klv_count(klvs, num_dwords));
> -
> -	ret =3D pf_send_policy_klvs(gt, klvs, num_dwords);
> +	ret =3D pf_send_policy_klvs(gt, buf, num_dwords);
> =20
>  	if (ret !=3D num_klvs) {
>  		int err =3D ret < 0 ? ret : ret < num_klvs ? -ENOKEY : -EPROTO;
>  		struct drm_printer p =3D xe_gt_info_printer(gt);
> +		void *klvs =3D xe_guc_buf_cpu_ptr(buf);
> =20
>  		xe_gt_sriov_notice(gt, "Failed to push %u policy KLV%s (%pe)\n",
>  				   num_klvs, str_plural(num_klvs), ERR_PTR(err));
> @@ -86,6 +67,23 @@ static int pf_push_policy_klvs(struct xe_gt *gt, u32 n=
um_klvs,
>  	return 0;
>  }
> =20
> +/*
> + * Return: 0 on success, -ENOBUFS if there is no free buffer for the ind=
irect data,
> + *         negative error code on failure.
> + */
> +static int pf_push_policy_klvs(struct xe_gt *gt, u32 num_klvs,
> +			       const u32 *klvs, u32 num_dwords)
> +{
> +	CLASS(xe_guc_buf_from_data, buf)(&gt->uc.guc.buf, klvs, num_dwords * si=
zeof(u32));
> +
> +	xe_gt_assert(gt, num_klvs =3D=3D xe_guc_klv_count(klvs, num_dwords));
> +
> +	if (!xe_guc_buf_is_valid(buf))
> +		return -ENOBUFS;
> +
> +	return pf_push_policy_buf_klvs(gt, num_klvs, buf, num_dwords);
> +}
> +
>  static int pf_push_policy_u32(struct xe_gt *gt, u16 key, u32 value)
>  {
>  	u32 klv[] =3D {
> --=20
> 2.47.1
>=20
>=20
