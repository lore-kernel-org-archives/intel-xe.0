Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26990E9A03B
	for <intel-xe@archiver.kernel.org>; Thu, 19 Feb 2026 05:08:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 849C910E1CE;
	Thu, 19 Feb 2026 05:08:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P34RrqaU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3274E10E1CE
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Feb 2026 05:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771477718; x=1803013718;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Wjv6GYg2kW9sXyuMw1f2BIefezIA6od/OQjsULZocB8=;
 b=P34RrqaULMsIIPZlyp+ZRBBhxGkx9ZWiKvR29XWWcnXkYVyl7DYMC0KY
 5haLqCd37hmsZ93IKoAhPqxM0mgJd1C3QX0SW5VNRCyS919NEKLCb0haG
 MWXtEBI97xSa4OBLWygsIa/5rf+mvNdW1ciHK5YiQJTrySLvS6LFCGNs/
 ePs5/pesF0MXJ+76eecDpJSUYldfQ7zK+v59G0P6ZOL8WMdyVJXOoyd4W
 5DZn3CxHyzlFvwZ3Qf4MFj1KQCsKmEg8Hc0Cli+nhjQMVYjYwaUEvrhgk
 wCPmHxE5NTEBq5vof3KMfmsyU6ZjO4ZNaizb2eb5q5ZNOCH7lpKA9p+px A==;
X-CSE-ConnectionGUID: x5q3idnTRqWNotjddz4hXA==
X-CSE-MsgGUID: VBI8YIQ7RDCZ7xUIFqSWNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="72624691"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="72624691"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 21:08:37 -0800
X-CSE-ConnectionGUID: s3pCLJUeRR+fYRIQVDYpmg==
X-CSE-MsgGUID: dQrrzVE3QU+fbDrtyOPK4g==
X-ExtLoop1: 1
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 21:08:38 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 18 Feb 2026 21:08:37 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 18 Feb 2026 21:08:37 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.54) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 18 Feb 2026 21:08:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aStPc62lmTX8mO/bi9hWZ4lRF0rIqzbJqfIU2KISc7ZTuwc2nvdvyk+Phc1dL1H6a81wT0FEkUqTRrwxReP7pZei88GfDSXBEGYA/vO9FQeNOVA8ZIqnBUWDGaUcZGjkZQRk4U3P32seQJiMl7zQ1sc+huUhhxdv4I9Z2jc9qJ3g8fwXelqtl4z9gprexDOYLuKi1SAHoWR0taZs2lRdVebGCFMD128clNSAUmZ5XCDNliTVeFU/eff44PdMRqyDR4O8JK6FkebUH4b9rpkPV+2Rr2o0mrBmxzUpjDZU5qpdnJf7JKPNJ/AfIcNgEEv/kQxmhu3jgf4bh4AicI3NAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+5g6weiZNLntGvOW1GiGJEUJ0h6MiDTMlF2eiTuYKuw=;
 b=tPr/0JFdg53ihkxrsEtanIuXPszQN2CJJUp4SFyR/bY3u7eCztesIC1wVJiETi7DDKQvCpHFD6cdf5Zfl7X3VoEuJXXEC0T/dKytLQuqaSIwe9+Zj5NGh5QwEHJbXHalindj4TYMaUnDde6O6Fb8wdtCz+7IT06EZWqw7kzz9oddLl210QZQtxOyA2O7r8QF7i7739dLe+PQeKcLTJMAmdEqA7xGCAC72zj5PG/Y9Jv8t48QLV+5qi1G9MThg00p8AtJo9DUEsTs+98zfD4yeQQSSf+VOQ8RWKLPbEL27bsQ35+tCET9khuU3yD7vtsoAj1ILh6k2jQUoiYBfdr+Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB8987.namprd11.prod.outlook.com (2603:10b6:208:574::18)
 by PH7PR11MB7514.namprd11.prod.outlook.com (2603:10b6:510:276::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Thu, 19 Feb
 2026 05:08:35 +0000
Received: from IA3PR11MB8987.namprd11.prod.outlook.com
 ([fe80::f91f:4301:96d7:1925]) by IA3PR11MB8987.namprd11.prod.outlook.com
 ([fe80::f91f:4301:96d7:1925%6]) with mapi id 15.20.9611.008; Thu, 19 Feb 2026
 05:08:35 +0000
From: "Gote, Nitin R" <nitin.r.gote@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
Subject: RE: [PATCH] drm/xe/xe3: Add Wa_14026781792
Thread-Topic: [PATCH] drm/xe/xe3: Add Wa_14026781792
Thread-Index: AQHcnzBwEcLNGUAa+kiANoSlNpCkOLWJEI4AgABpujA=
Date: Thu, 19 Feb 2026 05:08:35 +0000
Message-ID: <IA3PR11MB898749F384207BA3FDE7A938D06BA@IA3PR11MB8987.namprd11.prod.outlook.com>
References: <20260216111141.90541-2-nitin.r.gote@intel.com>
 <20260218223940.GZ4694@mdroper-desk1.amr.corp.intel.com>
In-Reply-To: <20260218223940.GZ4694@mdroper-desk1.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB8987:EE_|PH7PR11MB7514:EE_
x-ms-office365-filtering-correlation-id: 45cbd4f2-e418-4de3-5a99-08de6f74ef26
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?VQ6X49kFPnzHfhryVB26fsB0WPIjUO96dZcNWp50IUNYf/0E/nfn6gQbvfLD?=
 =?us-ascii?Q?EA6IoP7CWv8BkI2MeNEOj3bxeRVWGf1iACZF8/fc8zp/5ym84QvtbXMDjYbo?=
 =?us-ascii?Q?4BgcnIhBMxqDLfkKlq0gXj4KilgYCOW1Vsak2c2CFaNVTOV1KTgMYzGaLSQZ?=
 =?us-ascii?Q?ifEqtASeUNUhJ27Emh2F3CGb27uoR8kYaavzdbHh0MCkjxW4i35Rzw7P4tAp?=
 =?us-ascii?Q?uobhwa4RUZu+vylIBFbZXDnC32nlcyXpA76ZssWpjzhFGcaL8ZQvXAFaF/l+?=
 =?us-ascii?Q?0jXaNfiPPN+lM3jjZe95i/uAh/ZeaoAsbG9lyxvHQvvi5Vg8kDeiNXkSjvE1?=
 =?us-ascii?Q?ifgJ6/bnajF2BMCBKyW0o093LeU1qg9k073l4Q0QQYbo1myTz1R3CDqDkQ+p?=
 =?us-ascii?Q?rhZxDgh0YBJRvL8FOmNAoPjimIDAAfyBzWTJmGZRAY2vQhZG0faMv8q8mKCX?=
 =?us-ascii?Q?q2ll5DGVDJtWhkDx6wjm06cKiLT/HzVAB7ktbbZGwW9yHbuXuziyYZMXeyGB?=
 =?us-ascii?Q?w6x6xMMh0CItWE2W/Mb2K91wR+obVsurYR3Ym7psAciOCiYn+c3hsETDz74I?=
 =?us-ascii?Q?YSpx3wGgfpOcrJAt6DJs8y3gh9f/diSUS//MjLEgck3BQc4pMyfj/oBHCv1X?=
 =?us-ascii?Q?EEVJ2Ic4eeAbwknbj9YIKPxVcqwPhxur1hbKlsPXOOdQDR3xfGjiHR6HFOH2?=
 =?us-ascii?Q?HdgAzxDOhR9PL0OR4AgHDFv6QsELGfSv+8Pf9w3VTiNAPYX4yIHcZ+knwT6a?=
 =?us-ascii?Q?tw57ut+qJsyxb6g0MyNz0ioshCjW0AOv0zCBjEvGSlKufjPDWc3G31WFLu07?=
 =?us-ascii?Q?7suSbAE92ZIWHWhLfWKr7DOEXrC/dw39UJxaRyMHwFdaKfuDRp1umFFtxnBu?=
 =?us-ascii?Q?gJRnfpEHkkp/oSHve1tHyzLfm4x74TlyNDu8znz22WjG+ah+uC0ykn4FAfJx?=
 =?us-ascii?Q?nLcCfcIDkZe+FzurJJg2Mssx0e2pEBBPirs1eWdGD6aQLXW5XaVIHfwL6NO+?=
 =?us-ascii?Q?jiMn6O843lNKAQz68FOQ2A6vD1Ra78IXOCwNKIU2UnhCb6o0ZCwrjxVnYfXT?=
 =?us-ascii?Q?g+qxunpR+jM89dh0EiOSWrifuq6bNUDS3/mqUYV5mhEAaIr2WITicFtLF1wX?=
 =?us-ascii?Q?58qtaTDj7boviitSNs7JEyMcu46zes40QW3UmiGk/bik02A5u/qyG/l4Me64?=
 =?us-ascii?Q?qj4QXlGvc2c5QekIstV2xULuLe4wyHDXkI3r74nlc8stWWd+D3HoMCyphlHc?=
 =?us-ascii?Q?p9Ex97eH35T5UCvnd64Z68rLdVhzrIXTEZcuDtt34ekg2xiWCChJlElH2fBt?=
 =?us-ascii?Q?QU3kMewnsC37HPlld4usfyvFX0jJ4343GZlyqdiAaY6b116oyhfonBmzJIRm?=
 =?us-ascii?Q?fpEs3HLSaw4U0cHkhj3PDn6w6LmfqC+HeDA2+2FPUWAfp/ZnGC0LprfVlIvv?=
 =?us-ascii?Q?1a8xUrR5+FmQH85J+MiFswY+iwZf3Q9Mhxuk91V/uZuyvbSniUXySfpx7DhB?=
 =?us-ascii?Q?V7l+dj0bPMu2NbyRW6IBGR5vpEfrt/d0kDWwaaEIiGlTMYIIBwqp7gOZLrC+?=
 =?us-ascii?Q?lVgr6MueCC4lZg54f+9XUKINQTR5Ew085geLw1pY6qaUFMJokwp0T+wf+CwH?=
 =?us-ascii?Q?N8m6Y6F1MW6NVHCtcpgxSH8=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB8987.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?eA9hPJNB+Y7wLV68GVaBc1lVMqC8HucotugntK0oy4Ejz4yAIhmezkEynhfQ?=
 =?us-ascii?Q?WK4Ymp04HzQVpfRAdClv/Kry5koDLChthRibufYoQ3eGeTUrHfMZ9SMCe5sq?=
 =?us-ascii?Q?jT7axRYyqcZbIuwtZmlhiUluomwBmJLrD24y8DownL2AJ0bvpzYhawXelyAD?=
 =?us-ascii?Q?qXkF38rdp4MMFdn8EyjunPhX7aOlbP91EQtZi66E4YBRz6Zc3oiP/WqqBxjb?=
 =?us-ascii?Q?gRwTZTOd4nf9flopvclmVhHT6cKGUCbzbrhF1TijhczJLKIxuojlS+zxuYrC?=
 =?us-ascii?Q?WAJlHTfudcKmkHAcIln+rwyWZwIRdiyDPMbmTMWSbexEgh35eZ1HorhA70up?=
 =?us-ascii?Q?uQAx7zuWJ8YS3fm4aOqCe/UuhiU5W6i/ETra+bcjpC1nS7d2D/WZYdZca2Td?=
 =?us-ascii?Q?dLYGhlOpl8ND2VoN5C68cc4rpw1BJ1bheRornGCvifBCXppoEvRa3bPJkqVh?=
 =?us-ascii?Q?D9cphVeTw03vRn+8VcyvIXNbKh1b+Lrxl6KNOd8XVf39QtTwhGlmq0n7ERFL?=
 =?us-ascii?Q?VufwLAbBeeoUN8cUagnPVe/5apghBSGq7FnnYlEiIbLq2Gm4umyv936OehME?=
 =?us-ascii?Q?nvg78zqbjhBDgBiTW232VjiovtRCUhIHwxNDkzyGOzFixmgJO3W3HozprgLM?=
 =?us-ascii?Q?WznSJhMwM3mYDuZjp1gRASwXGyvwRNJh/jU+8I0gUlwN0luExEroR2TIN5LE?=
 =?us-ascii?Q?QBGmnlvn0LDn7zhFiybtZkYflAfPgUCqbXAkBoyvNIHByXGgtuWf73YB2PUr?=
 =?us-ascii?Q?pqTrBV0dsDUHwKljDVLMzWFw8fQyVQxqHM81RPXUcQTE7Xhdqc5GpZ5y0syg?=
 =?us-ascii?Q?4QVbaguDUw4hVjU9rqEGz/lRyhuuUssviIb4BSHGb3GzoEdE9o1XhC9woTDV?=
 =?us-ascii?Q?fIMLY7a2Yz0UXYYpjDnYqNqoMdmx+7sWfK45bigPJ5iLsAbArnQ9Vnp0eHPB?=
 =?us-ascii?Q?EtKWIzHn2m4SOR0LbL2RJXn+elD4c1RI8ELUrj4Rgur98clHGxcNhSich0ax?=
 =?us-ascii?Q?YPU2OenaolE2CkDUxBzZPeT1DkY8O8LN93ZBaD5XEoQ0DIJL1aIZ7qtmQ+LR?=
 =?us-ascii?Q?jwju7s3oKGxyTEejF/+lJoTnP9pukYOaOY/B6Nf5bYerwT+25ekRaM19eHlB?=
 =?us-ascii?Q?OGcLAaQH7+ricJ259gMc7/eDd2fcsYJOm7W1KCYj1EOzDYGu8ViYXmGatxNw?=
 =?us-ascii?Q?GBPkap7jtdHVh3im9uw6Hhri+m1umcs8Vn3BUoF/WGH3Tn+2+8O6GvugmS15?=
 =?us-ascii?Q?ZYP9AZbt++xaj13UF8yDTH7T+8iE5uhnc3k1sy0umK7lDMbxSe0N9P4IfY13?=
 =?us-ascii?Q?AClqwCAWwsPERC0i3YOnW+iDgtGVaZLgRNQ+QLdbc5zQ8/cw4Ep+63gr/I2j?=
 =?us-ascii?Q?9bgzxf/oXLGv1Vgt2+1jqwxNh839suCy8Ao6DnsQH+kpkMpwMFfOioTwu0K5?=
 =?us-ascii?Q?rXsa8Onk2F70cagPmuSSdlysgKrnGM40o38s0YebrDh4nMDQSgTlEufGKJuf?=
 =?us-ascii?Q?WZhXgeESt9yR5b6vbIHmU8fL+Gxc8S+aG/MP61SP77KRIHPxp3WDLpDunNlN?=
 =?us-ascii?Q?leQqWbAyOMkuwUCWEAE3xrMT6LXoej3RHZFEcTuoUylqqgPO/b5/gRDijjTY?=
 =?us-ascii?Q?4A/WaPzHr094obyxgdvPkwE9vaqh5foCZ4ctx/88At2FTohtfSlplgt0NXRJ?=
 =?us-ascii?Q?HJur6BasppbJTpYcdcbNtRSPpGzszEORlyZkd5MEUykUfXZJt/twibg0ZP1R?=
 =?us-ascii?Q?uz7X0LeRDg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB8987.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45cbd4f2-e418-4de3-5a99-08de6f74ef26
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Feb 2026 05:08:35.1928 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e4+5Xtpy4l1WpSmO3+m6njPTKg7T87tKvTbO/MyYz/xZO4rPtDr7frpNHBGef0MO9RTnhtgu1EKro8dFrcf7uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7514
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
> Sent: Thursday, February 19, 2026 4:10 AM
> To: Gote, Nitin R <nitin.r.gote@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Upadhyay, Tejas <tejas.upadhyay@intel=
.com>
> Subject: Re: [PATCH] drm/xe/xe3: Add Wa_14026781792
>=20
> On Mon, Feb 16, 2026 at 04:41:42PM +0530, Nitin Gote wrote:
> > Wa_14026781792 applies to xe3lpg and xe3p_lpg.
>=20
> Even though the text description of the workaround indicates that this
> workaround will likely wind up applying to multiple platforms / IPs, at t=
he moment
> the only IP that this workaround is officially approved for in the workar=
ound
> database is 35.10.  Unless we have some clearly reproducible issue that t=
his
> workaround is solving on Xe3 platforms, we should wait until Xe3 releases=
 get
> approved in the database before adding them to the code.  Even if/when Xe=
3_LPG
> does wind up needing this workaround, we don't know yet what subset of th=
e
> individual releases (30.00, 30.01, 30.03, 30.04, and/or 30.05) it will ap=
ply to.
>=20
>=20
> Matt
>=20

Thank you, Matt. Agreed and noted.=20
I will send v2, which removes Xe3_LPG and applies only the workaround for G=
RAPHICS_VERSION(3510), as approved in the database.

Nitin

> >
> > Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
> > ---
> >  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 1 +
> >  drivers/gpu/drm/xe/xe_wa.c           | 5 +++++
> >  2 files changed, 6 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > index a375ffd666ba..90b9017770ea 100644
> > --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > @@ -131,6 +131,7 @@
> >  #define   VS_HIT_MAX_VALUE_MASK			REG_GENMASK(25, 20)
> >  #define   DIS_MESH_PARTIAL_AUTOSTRIP		REG_BIT(16)
> >  #define   DIS_MESH_AUTOSTRIP			REG_BIT(15)
> > +#define   DIS_TE_PATCH_CTRL			REG_BIT(4)
> >
> >  #define VFLSKPD					XE_REG_MCR(0x62a8,
> XE_REG_OPTION_MASKED)
> >  #define   DIS_PARTIAL_AUTOSTRIP			REG_BIT(9)
> > diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> > index 61c4187dc0ae..05d7a0eddbdc 100644
> > --- a/drivers/gpu/drm/xe/xe_wa.c
> > +++ b/drivers/gpu/drm/xe/xe_wa.c
> > @@ -939,6 +939,11 @@ static const struct xe_rtp_entry_sr lrc_was[] =3D =
{
> >  		       ENGINE_CLASS(RENDER)),
> >  	  XE_RTP_ACTIONS(SET(CHICKEN_RASTER_1,
> DIS_CLIP_NEGATIVE_BOUNDING_BOX))
> >  	},
> > +	{ XE_RTP_NAME("14026781792"),
> > +	  XE_RTP_RULES(GRAPHICS_VERSION(3000), ENGINE_CLASS(RENDER),
> OR,
> > +		       GRAPHICS_VERSION(3510), ENGINE_CLASS(RENDER)),
> > +	  XE_RTP_ACTIONS(SET(FF_MODE, DIS_TE_PATCH_CTRL))
> > +	},
> >  };
> >
> >  static __maybe_unused const struct xe_rtp_entry oob_was[] =3D {
> > --
> > 2.50.1
> >
>=20
> --
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
