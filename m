Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 343BBCA1007
	for <intel-xe@archiver.kernel.org>; Wed,  3 Sep 2025 05:54:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E989610E4C1;
	Wed,  3 Sep 2025 05:54:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HLiWnV6n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32AB210E4C1
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Sep 2025 05:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756878849; x=1788414849;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pU9glw70F/2x3g8UdtllVJjtCBvRU5txR75RJG2wgcg=;
 b=HLiWnV6nWSY/8kRw00zUHCmWWj0eyXwu70f5WVbU26jYKdCkih22NCIi
 ikbLrA7V8rjznSiTzDbOc4KMoqqWH6uqeutC4/hpBUPmDQIfea1+BsNvN
 liR9p/Ke7xzT+RQzTgnWb7e7d00BkeWqDO3qKH+fQ40LMsUBYnvH2Uxwf
 hZ+xjONvIl4+1iQuFwelYrfO98oqwlxpAm4rJk0cEyq8CWXHW7dQ2MWJR
 wQC/UcAUZYPGmryZqbwydFYK5raRgLSJmWmCCpfyDd1bJ3U3rNUtHE6Qa
 FIgAW108tBaAe0uAaWvWzXCW8CesvbpzHOGsFsX4ee0q5INOARUa0Wuwz Q==;
X-CSE-ConnectionGUID: LuUoxEDuTFK6KQBm72+ozQ==
X-CSE-MsgGUID: HQ4AekjKQi+zK7iQ/cx5lw==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="59317550"
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; d="scan'208";a="59317550"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 22:54:09 -0700
X-CSE-ConnectionGUID: xSxRozR+R3KJf3igqFY//A==
X-CSE-MsgGUID: uP4vBrwfS3mkoWoToirRRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; d="scan'208";a="208702629"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 22:54:09 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 2 Sep 2025 22:54:08 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 2 Sep 2025 22:54:08 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.46) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 2 Sep 2025 22:54:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xyT0VzT94X/BN8WHbNd1vsybpKL6NK3yjjP3GTmQVjS8PFEOo8VATwhHq4yt7hJGOw6L9ezVxKnG6uhcpdIldfSsHKtSQzEZa92TzHAaNGnMli69Uj7rDGJ1gpEaCK8W7wti6cRGMOlov3RZFDr+Qot0DIoemJNp0PcWXmERbcGzoAHcg+vjVhwdWx8ZHWSjAmZUjzHahry09eGzZBWbeZsN/XGJggaMbGoq31P4Hd1v97wKXtsgn9kp9UxJqW8bw74uW0PrOzF/xxN9HWh8YDPbqGM5yQMmmePvBPql4oxboblBemCpGfX5fpN9by0dea7xOA8yDxFnYzOd1Zik5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pU9glw70F/2x3g8UdtllVJjtCBvRU5txR75RJG2wgcg=;
 b=Gd8dFSM2XQsvxw9Sm2H74Sf1ZQA/fL/xcuGveaoifjH3oaSzm2qEqw+GYF0+s0VhwV6N0Qgy1NdpeBIIEMvtPZMJQZmTafSTit3QkptFHoaNPRLnbJvWcxudgNTkB/xuvfLF77acQ4T+WDndUgCxBM+RZCeTNTtWopy/I6I7iJWBZ5zFf3k+aPM29ujJ+pXwG7Y302q1bSay3YlMVKv85ygCn6lvahXnfLnjxzbTYbQA8W4940myPQfUU9uS4zHOK6xdZ2OE1gvSCIw7wCiFuBLLDnCD4Frw2KmCPM4dUrhz+KxzVVb59A3ZFtLQycMQgAR5GpqqMJbUrn31o3/sEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5427.namprd11.prod.outlook.com (2603:10b6:610:d2::14)
 by SJ2PR11MB7475.namprd11.prod.outlook.com (2603:10b6:a03:4c9::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Wed, 3 Sep
 2025 05:54:04 +0000
Received: from CH0PR11MB5427.namprd11.prod.outlook.com
 ([fe80::a4c2:eb7b:574b:ab2b]) by CH0PR11MB5427.namprd11.prod.outlook.com
 ([fe80::a4c2:eb7b:574b:ab2b%5]) with mapi id 15.20.9073.026; Wed, 3 Sep 2025
 05:54:03 +0000
From: "Sebinraj, S" <s.sebinraj@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Badrappan, Jeevaka" <jeevaka.badrappan@intel.com>
Subject: RE: [PATCH v2] drm/xe: GPU frequency tracing support
Thread-Topic: [PATCH v2] drm/xe: GPU frequency tracing support
Thread-Index: AQHcCps9baOmbuZy6EuoVSX3g0B3UbRd9H6AgA0C5jCABCnJgIAR9png
Date: Wed, 3 Sep 2025 05:54:03 +0000
Message-ID: <CH0PR11MB54279A2311483EA434F938399801A@CH0PR11MB5427.namprd11.prod.outlook.com>
References: <20250811083414.3863103-1-s.sebinraj@intel.com>
 <i6iszloxcdb2olq5hspkzjefimracmqoawpu7t5gwlehgnyudv@usbccibofr7v>
 <CH0PR11MB5427BE3DA4B3078A7514BCB79833A@CH0PR11MB5427.namprd11.prod.outlook.com>
 <ikui4bvcsit4tigoywf5xfjimgh2sxbceqe5dqayyaqzfgpsgg@pza2islxnte4>
In-Reply-To: <ikui4bvcsit4tigoywf5xfjimgh2sxbceqe5dqayyaqzfgpsgg@pza2islxnte4>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5427:EE_|SJ2PR11MB7475:EE_
x-ms-office365-filtering-correlation-id: fa745480-2dbf-4a2f-927e-08ddeaae49a3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?AZSm1pVYg5PWrfRkNu4ZwEeW4+WPZMDqmqpLCVkZOVSaEJ6ZerctwFzNKF/s?=
 =?us-ascii?Q?Vg+GZMrHiLiSrD2bB9RivEV7K1BXLpTsG9busByyhJtR+ISTu0Tz85V3VBIP?=
 =?us-ascii?Q?aHWKtdo1iRQ+cRALkbgLazxK3MXPLUwet3qDGWlKyOTbHGAV701H7DjuduBn?=
 =?us-ascii?Q?jv1rs631LfxWhzOJAcHdy33ene+DJWYunLmZDNlsBabeJJKmEgU3bzxoNSE6?=
 =?us-ascii?Q?wbDB7+EHbmjnPXTjVKCOVqySLPLsow3cJn9QkfEvukFfCY1p5YmzPf8gX2wB?=
 =?us-ascii?Q?PD3rXCjWLkN0gErYlJgDe71u2opfuWApqf0pgDIfj+WlhGK1lImo9TGRqJ2E?=
 =?us-ascii?Q?WBtes0r4oPjiHMSZV+GcOMeong+Nf9T60JqJWxYz4bn/Lqw1F8cTPiP1jjua?=
 =?us-ascii?Q?E5eoqll/w1YuiAYEfLNcNMMznQgYaFksx7hF1geNVSb2SM/5tbFJs9PLUz/w?=
 =?us-ascii?Q?0b8ssZq6MaVj3yR9SFQjS642OHDdAbCSavv4CpQp8oE0R/8ByiReHimAC/wF?=
 =?us-ascii?Q?Zr9vS5g+9VijycX1QB1X2oViCwri9U412f2+SFH2rm9V93kwHVjZUGbXIlZo?=
 =?us-ascii?Q?qmhfo3uI/JnEJ1pz1nDc1WLy6oZx5eceHb849aFYMhY9E91EH9ai1VQyiJ8i?=
 =?us-ascii?Q?z5rC/hb6DIXNdQRqaMAWNOLYAVKxsaYxyHpXoHfuHtP7mv7Rn1ILYCv7WC/A?=
 =?us-ascii?Q?Uz08qfPOyAIwYytEeX/eJLKqadKrxWPwRoAh+nvShM4sTRJl27hmSz9R7NEV?=
 =?us-ascii?Q?DCGWW0ACG16fLUw+YDEcJwiCiV1VKVnLwxvcu4L0lYykNGpstrsPi3NhgL4i?=
 =?us-ascii?Q?cscJZyHOaRINv6Gi8eeqhNjUk83AQgiJiKR16QhbtN2a6h/cvLH0izia4RZ/?=
 =?us-ascii?Q?je41KnmG42dV4swYA58LbxXy+eiFj6uBXb/ojSjVclliBB7stWgDWwUhfgjs?=
 =?us-ascii?Q?kDmSHEj0j4VNv8kYKPoh//OAIL1L6GI20Jj6OYPOdC6/1i88JdE+dcxigRCJ?=
 =?us-ascii?Q?s2guBZNNwkwSyt8Yi6NlMi6V1nUu6PCLwY+FI4DrC491H6DG/5Ibosv4+u8o?=
 =?us-ascii?Q?iQU9+bArpE3gJzNV0GU7lwf3mkuWXgUNGI2BbUqRiHIpd1ejSL6emh7d7P4m?=
 =?us-ascii?Q?DArTJVSYU6Ar6sGzrfK4T5xB1CccamM0W532H4x+iv4oGsxS/Dz9q5paEn51?=
 =?us-ascii?Q?R7LSRXSwDuEGmmB949YdjYF2Ck8T6mF5qoVYzINUycOEkJW+pIfdjcYZoLMx?=
 =?us-ascii?Q?fHZO4Qp+h1ZVqPtYyHvu/Y1QdCVqGm7x6qfgSZHWbcK1K8Rl25MH6WSkmf+5?=
 =?us-ascii?Q?upOb9G59lrG6p1RwpvfEa1vEQ4S0hb2BLumKvhvd8larR7CdzjF6fZKOuVMQ?=
 =?us-ascii?Q?Gj2KkIK/341nlgsGi7p7dz1iNj6JauMApJhwn65X5kimGphu3VisBDN4v6SO?=
 =?us-ascii?Q?1dudVXaHBjY=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5427.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?dvPYwDlLdZaOkZJvJTBpCADUKLzBlnWZv7mM1WEjTClRt3so2C/CRxNpndGc?=
 =?us-ascii?Q?Tc6hPUiIPGWHNjANItQNx1hJfXsm8eb62lWlCsxtYWEj+r/9SfrU7+/hyKB5?=
 =?us-ascii?Q?bOFQl2ozAMEXoeCvP3xytTVPBUCBvY96zVSrmwS2RKBeQ8PHry2wbwQi5bTZ?=
 =?us-ascii?Q?hK8tkxMKR9geo7O5F27DLhHq5Me5r4PUeCcjswNLfJmOdpvu0g8oBlPI1inf?=
 =?us-ascii?Q?jQ0DsAC47qOtGHXcoob899u0TD1bXJ6DmjRhIWrrlWlDBdhmo4OfMXNtCIkz?=
 =?us-ascii?Q?NE2V78irRPuNl+v4UNj6n1SC8BiH65QIfaxyTMrcJk382bl7iOx8AwrZ+nP5?=
 =?us-ascii?Q?Fpd0alC70at7mvHdZBgWV6a9gd1OBrFryBRjmPuOmmQnxEZJxB1jGqAiSWYX?=
 =?us-ascii?Q?H4FfeeC1LFpsf2JsmXpqex0/ujqOqXk54PAWjUYpPS7JNUR6QggcEpgLNuHE?=
 =?us-ascii?Q?2aMQlBrObV8D5HYoqDB4qV6YsAsUuWkxTpXO5Q44yNr+dD7NbuLXiotpVrrk?=
 =?us-ascii?Q?it8M+xpsNC5XTvNe1Ysdux8C1wpMHHTpBnb0YMnQwM1WlvGHbulSNX0EZ+hv?=
 =?us-ascii?Q?tK3pZsSdf19HsocrZybEA3X8dDxGF6C1MFDhUnXyziq465OnXS7YZb7+PBf/?=
 =?us-ascii?Q?CHsXfQ5Agr3z5X1Br10rn0pJhVD3ZTtBq1iubq5zv2LXY5RgBEYqn4Tp85ap?=
 =?us-ascii?Q?DKqCfozDrVb8mY1v3tu5oIaDgh7HsEhJKiVRvoVIpAVVyhKZhoJVK9x7nOoe?=
 =?us-ascii?Q?ZVmWaGg5952YxLbbYyiTQOkP+65sRBKO/cJ1F/AUxAQSYx72+0u10vVIrGmD?=
 =?us-ascii?Q?QQL37ATuivvDTf72sR28sUX8lkusdizdZtL/vs8lYoRTpU5EFIVj7JSPu+qq?=
 =?us-ascii?Q?xf/RFpnLl5pifkdRTvaC+D7+UlSwXMpLg8ToLx/ANhvwg2kovS/4ba9G3KSg?=
 =?us-ascii?Q?Sx/zwxYUisgC01/XBWY7kNHbnulAy48HLOTJSpIONGu74P8BQjwureJN+jSb?=
 =?us-ascii?Q?zgXGMy/dfI45+tFM9TuNl4CAn7nNnZUy4of2vJrd5gqAD+pV1oB5tSnyMGNN?=
 =?us-ascii?Q?4np89XZV0S9kZmDrFHV2hvBwocwJ2YX0/gbNI+0abEJdwW+p72vaLvDOYf2t?=
 =?us-ascii?Q?AhSZjdIul6mt/a9EP5Xejbob2IFQVCfD7S6htzGnCBO0XIgC2AD17r5FIJKo?=
 =?us-ascii?Q?jhvP5h3c05+6rLj1bIgamyPIcGPX+aM5ZZYqJHMJbaaZiW10VE3/yCoWwYWE?=
 =?us-ascii?Q?nSamffuKUfJRPB0dC9MnxwEOMVNimKtjSiU7tQu4B+3jTk/HBdVkbA7oZ2gG?=
 =?us-ascii?Q?cgQF9iD6aLQ7frXZB3JDzEb+WW/8RfPdE3HPzWIc4Ic91D6O1R9nTWUNVUs9?=
 =?us-ascii?Q?Fr6lZcdsfzk96i4MJXNs/EMIEMFpAzr+HzewLf274NsroTiSLD1FNyAFVDg7?=
 =?us-ascii?Q?6VrqKiy2kxZcXTYoIISj0p+APenxIJ2dIU1KsMOTw7fQncb9TBhvcMuT8TeB?=
 =?us-ascii?Q?ZCVhUPvB72U9lmRq5Eu5h7TxYWu3xnDvFN9MbfCZoeS7nzVAwNRt6e/GAXPP?=
 =?us-ascii?Q?EsozXkopPcWzsIOFjj0YC+ob/4zBKZp2bXTC37SW?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5427.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa745480-2dbf-4a2f-927e-08ddeaae49a3
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2025 05:54:03.6674 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0EZgX/6ie1LZer9e++Q8eaT9/RfyKLA0W1MctKTzIAYxa+QB+CUWZnYxLx/ul6vHQvq3cBb/KH5t4wwnMCC12A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7475
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


On Wed, Aug 20, 2025 at 04:25:43AM +0000, Sebinraj, S wrote:
>We went for this addition rather than the one in xe_pmu (via perf stat=20
>- user space tool), as we have a requirement to have the trace point avail=
able at d/evens/power/gpu_frequency for Android xTS.

sorry, but that's not a good justification. We should add code that makes s=
ense overall and can be used by *any* downstream. What am I going to say wh=
en another downstream distro request the frequency to be exported as xyz/ev=
ents/power/gpu_frequency or with a different signature or with a different =
sampling requirement.

The interface is not even generic enough to be useful elsewhere.

>In this case the user won't be triggering the perf subsystem for gpu frequ=
ency for gt0, gt1.. even if we add the trace points in xe_pmu.
>Other comments from Mathew have been addressed in the next revision=20
>https://patchwork.freedesktop.org/series/152701/#rev3

>I don't think they really matter much. Until we figure out how to fulfill =
the android requirement without poluting the codebase like you are doing, w=
e can't merge this. Sorry, but >we can't maintain a perf-subsystem-inside-x=
e for that.

>Lucas De Marchi


Okay got it, I'll try and come up with a generic solution, may be at drm le=
vel.

Sebinraj S
