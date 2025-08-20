Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9729DCA0EDC
	for <intel-xe@archiver.kernel.org>; Wed, 20 Aug 2025 04:25:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5417D10E163;
	Wed, 20 Aug 2025 04:25:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jrI3kG5q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D061410E163
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Aug 2025 04:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755663948; x=1787199948;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=gMFnmFPU109Dqe+0ExhkrUNGG7uFeO6pJP0vX933orY=;
 b=jrI3kG5qBnF813x+ZgF7GhAqGps0/3BgNhB2s2WEJQiZaVbiPQu0V8Tl
 vlrVnGeLZmZHjl0m4C6OWvSjpz4J3jFS49zE8pKU/RndMiyOEBwWLlh5Y
 HJXXh7yHLkmqd3TlrLVIV9a10xy8Dms605qEUedU0YrC6R8LU+Ss767PF
 LqaN5LffCWVoNfFhbhBfCGqkTeFSpyZy3Amxb1Qmhi+tUBS1j7dONY9hw
 jmUJF3a5uuC2h7o4BhBqOyrzMsophdvivS1qGsk9BIkgeBjqRXVtdOZLP
 9UX70ncCCv7V5LC/wwq5Li6ZTORjnlslt6piPixzlyy/k275IGkAaPAfb g==;
X-CSE-ConnectionGUID: hAjgFpILRfiE0lIZZ+Bu/w==
X-CSE-MsgGUID: LJrWrmpoSRa3iKIjFfBv/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="61737226"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="61737226"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2025 21:25:48 -0700
X-CSE-ConnectionGUID: IHcGVgITSoyKXVKri+E2Bw==
X-CSE-MsgGUID: 7kS5Rdg/TzWqfjDY4786nQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="168276318"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2025 21:25:48 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 19 Aug 2025 21:25:47 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 19 Aug 2025 21:25:47 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (40.107.102.57)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 19 Aug 2025 21:25:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T/vNwJTOTPwYNqYBPC6+42pzZQ+nC+QfzMzqRZWIcCQ/WTob6ASBRlXBFBFgqErUdH9wOT5Ic96ATHauarros1S0T/KL5PkkAW9a7uOGmg8NQZqfadGMiwOv6j6p6HOgj+J/fc9jzvLPkJNPTIqhtamXsOcMlN3eIDGsPXU6QIlYfhMSO2l/ZZacxbIv/xTqCc6Z3vA6HTO+nx6m8g1iWEjwMTj8qSSvQ/e3rm6EaqLEx1rhKcWvoTKtGHbsxqydS3mciMZV4DvOZLJQIn6w6h10PThz3VTuDicCfT8WzkKQ6eVjrq+3q9d6id5B6NWT33h5C7WRbstNGGozBiHBMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w652zApBhwmRzSPnAe0447nuKevw5zSToYKbca+6P4Q=;
 b=TsJj4ago2GMFrvN9s/03pbhmMhaiS//EeXwtqDyQG74fr6qQJBv8JXCg2DhZRkxL7kA+NHpCF6ff20xcXS3kVC+TjqQ5YJw+ButFRzoUtKfpPVmqh80NHgmrMxxP97BemiUkZNBxqsekQaTNINBL7E0RldgTF9jb4H4zpaIJXyQfRWekZQEZkafHOqZVNiQMJAaKlFaXqRGbAzkJh6kcFhE75R75VuYswJtSVoGkuqHzyJMqjVTxC8FRatzdjoCyi/EXcYOCQrpw4NL2RSsHlfZ9P1mlLzuojhmNue9QO0kxXgDIO6rb6YAKGp4binEiBvdp7tMjK06TXzYZcNGRBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5427.namprd11.prod.outlook.com (2603:10b6:610:d2::14)
 by PH7PR11MB7718.namprd11.prod.outlook.com (2603:10b6:510:2b6::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.13; Wed, 20 Aug
 2025 04:25:44 +0000
Received: from CH0PR11MB5427.namprd11.prod.outlook.com
 ([fe80::7f14:1af5:f26e:4070]) by CH0PR11MB5427.namprd11.prod.outlook.com
 ([fe80::7f14:1af5:f26e:4070%6]) with mapi id 15.20.9031.023; Wed, 20 Aug 2025
 04:25:43 +0000
From: "Sebinraj, S" <s.sebinraj@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Badrappan, Jeevaka" <jeevaka.badrappan@intel.com>
Subject: RE: [PATCH v2] drm/xe: GPU frequency tracing support
Thread-Topic: [PATCH v2] drm/xe: GPU frequency tracing support
Thread-Index: AQHcCps9baOmbuZy6EuoVSX3g0B3UbRd9H6AgA0C5jA=
Date: Wed, 20 Aug 2025 04:25:43 +0000
Message-ID: <CH0PR11MB5427BE3DA4B3078A7514BCB79833A@CH0PR11MB5427.namprd11.prod.outlook.com>
References: <20250811083414.3863103-1-s.sebinraj@intel.com>
 <i6iszloxcdb2olq5hspkzjefimracmqoawpu7t5gwlehgnyudv@usbccibofr7v>
In-Reply-To: <i6iszloxcdb2olq5hspkzjefimracmqoawpu7t5gwlehgnyudv@usbccibofr7v>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5427:EE_|PH7PR11MB7718:EE_
x-ms-office365-filtering-correlation-id: e02a4904-937e-4107-49c9-08dddfa1a0a0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?3jsqJ/NJ5Qd1pFX3mPDcVbrIwLGO710CsHdE/Oh9GE+PHoQOXHKof8cEkmtL?=
 =?us-ascii?Q?NFe2RA95NYjToFHFPWKPzYW/VYPp4TxPU4mQglapa2jf9UGPKaCE5xw+dErQ?=
 =?us-ascii?Q?e1UHvcgxkJyyXDlYyxNWZsaYGiJEUmlOaJWyeo8uP/wjnbkfpLNsk0qy4mtf?=
 =?us-ascii?Q?fzlsfCVNsu3AV6CqTTM/uMaiZCiBOnJJa6eqg/frKZn5/t+9lNAlZb035k0L?=
 =?us-ascii?Q?PBSS1nc3jZZroIi3uvj2EE+dbmbiwTe+josalzCyvFP1qW7yvfxmNiBixEF7?=
 =?us-ascii?Q?lH3LK1BhhrzUq+/b4BNR50WcUcgez8SmoEk3H1bttJMB41qQ3eUzSY00VbNA?=
 =?us-ascii?Q?VSpqJfFEVi2WexqmBEsPs9raUSgvDu5jfDywlp8rGQi4U48BQ36vOiv+zZor?=
 =?us-ascii?Q?l2b1+5Vh4ZDjSUhTaRdn2ETtHcSHjsK/IAwfqNDeF8APlnsy7hF3rkuAWB/s?=
 =?us-ascii?Q?45AnbUoXpopd3her20azWkm3qqD+QEcz1sjCoMvkUYZ+rAYcw0pLkodhJHAX?=
 =?us-ascii?Q?R91LK+n7YpBHKVQw7TzT54osqsF/SdxqzhiiwoIxhw2OdVIiEarnJSCI0BAM?=
 =?us-ascii?Q?5V6zIvf7x4fh9jYIONe6Sdkt17PeGPqosg4q3lrtJZrm6PuVgSqLb4vAjEPh?=
 =?us-ascii?Q?WJBdcA+fobExoWs3qY83H0lW857wVhsJZLlQ8o5/kaiebqZeRdO8EbGXtOzg?=
 =?us-ascii?Q?GAfDCgn24PkkDk/r5lo2GRioAfZXiN1TYyeMBI1EuUNcc79js0FIL80nMi6I?=
 =?us-ascii?Q?DQnWuqBvrDMUX4ElfI+PzjXBEgadviFMLSx0AIc1geF5u9nzDUAdmp2fQVT4?=
 =?us-ascii?Q?AFT8N1+NgYseS9JfZSsXK8Ao0FJqMxoAr5prFjmldeKbO64cT2nxcPM4wwPB?=
 =?us-ascii?Q?S4vf+SOi5bGc1/BiXlQZ6/iTPhuLpxShReggjbEeSSbPaYWgcH7ByA9EQnbj?=
 =?us-ascii?Q?vRhFDHUbRKiv107j0YpTgDuZT3ni/qWO3GAJlPmmhXdz0CXr+E6suqyOqQrk?=
 =?us-ascii?Q?QI735noGVx7yg98TuukSiAq4a9HZ97a75hbeTEv2dtUYzlKajZTOzSmBL6Xs?=
 =?us-ascii?Q?r9xxvF7JaJ+LJQvJAJdvbXzE0/V9x3ZJ7DNvbrxQxn5e/iwvA7Gm+kPYvZnS?=
 =?us-ascii?Q?zrnrXdMqhYNGEArx0+MoVTMIWXIGCVxwXtuDGj5Z6XQc1N7yYCsiibswN43E?=
 =?us-ascii?Q?5jrApSQhjAq38aOmQvaxb0/KfAL65p/7wIrX5yChbKILncQyTwHB3Vx7RAqJ?=
 =?us-ascii?Q?Z4wpdIGmicjrNSjLFfUMlZ999+uYigSfSwVfnitP/tUaeB/FbMWDqMv1vpuj?=
 =?us-ascii?Q?38fh9o72fOtbGXlYpoULawn4FNlG/1ECFjUgGhDCI8hyiiA4cFn2TwKFTkQS?=
 =?us-ascii?Q?mSFV3wQ7hksctfMxisOlRoKfxD9UtRgCG17KurVm5MLbIBEQzUyBgR5vOvdp?=
 =?us-ascii?Q?HCwiQPCHoFI=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5427.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ALyaNnw/D8YbtfCJeN1zfSxrP1SLhrBiJFT3AMTgwdovYKoncpJkn03DZvGX?=
 =?us-ascii?Q?i54GCF95awnpboeRioiuOnadxGvJAA9ZXdEJTtp/ptJXw2VMvFvvJMn99GbU?=
 =?us-ascii?Q?TVmeUabvXkfi6XN8g7Fd0aAmHDfQcOl2lQv2dbUZDqxJXfDaQ387sTljc4tu?=
 =?us-ascii?Q?iinM7NJ7G7nD9oEyg1iBnWDSvlbin+fIMvidpkJfXTfA7JtVDM7nyj44eA3X?=
 =?us-ascii?Q?5WfMt0Obhi6plsydNdXaIvns8Qho19NBo4sQSoiHt0QN9P1+Weblvtn5Jxb3?=
 =?us-ascii?Q?KRwBn7I34lHSO/xUqpdPDGluZI2bOKIsAunJdTK+YDhrTXJ9yK+aIx6B0OcQ?=
 =?us-ascii?Q?iLdWBfWYOvR7N8OwOYvH/dU1NOB5aoa388FdLykZ51yVZMyC5tjKTbPCTWID?=
 =?us-ascii?Q?3BDfV1eqwVxypC6robTsaKehLrjeZCYt68CnfWsmUyq/yssptPaPsvaHDelE?=
 =?us-ascii?Q?W1MAFSe2zlY8wbZsOdcvHcTyZ8FFgUFCeUuazXZgTEsgfcFajcUfBFlzCUv9?=
 =?us-ascii?Q?kBgsZ1/2ImLjohz8eBPFhn8r+EenGCW3SxaAdciCeVSVvsR8nq5ov9RPHgF6?=
 =?us-ascii?Q?w2yRQ3peD7GN5AgYuoKbgPvVz0NHWb1wa6SNml3ZP6ziPldG+TE86FxjO/h9?=
 =?us-ascii?Q?zvUV0TKL5sKpzSotzhlyHxCjVWrAbd+KhcfdQx9fD6p/0uBja+bOU3uBeuKM?=
 =?us-ascii?Q?8mLKaHeV3+AbZP8bYwKIjrhiY6RPmKsOM08gxOb/WuML2CPLbFLuPUJ5EHPz?=
 =?us-ascii?Q?UhedYDZuF3DNFgmNyqxbG/8aKLDlpxrGjdsYAX4eONXf9jMajd5DU++AWnR2?=
 =?us-ascii?Q?Iy0q/wleNeXBMwZIkgQLL3u3JJ+vJfv22/XG+Swel4qF0NmpkINR1BAvUIsf?=
 =?us-ascii?Q?raT3E2QsF5omYvJAmQadZwLMyAQ3mjmyvLzi4n4iwEwP9DAqKbXD78RDACxx?=
 =?us-ascii?Q?9u4+DrA4I31cevvcG6+ZCdSrcaRpl9xuODuVbqvat5Xv/VqDP7/AoKv/jkP1?=
 =?us-ascii?Q?am/pW7B7EBDNn5j9KEYEg5teOyjvaIIzyzTDQMahWODhZJ6VTjHmGmLytWxV?=
 =?us-ascii?Q?qRligxYjjy09UM/Ma/80u+I959n712SarfKYO4rxKS3MdLZd/W3QPRIK+nGa?=
 =?us-ascii?Q?vDIgzoU3AGee4qPIVjWbL5cWGIgyu5/DeP5bsklLgCT5YLmt3ZHaLCtiFBpP?=
 =?us-ascii?Q?ZjwJSKGxNMlkArwu92cSQc34LW2rh5Jkj6FI6YHEBSqwQArrJ5TF5OaYo8uK?=
 =?us-ascii?Q?WMbCmlEH/6TObj60SyL8VlXIx3YVs8KLOsoKaizzt4y1m0Mr/+gLIN9AGBZ2?=
 =?us-ascii?Q?kkeK4poLfK7ObKzHErkPyf6gIvGSQcjPjsUGGvjJC9IhT9p1czdJEiAw7kAM?=
 =?us-ascii?Q?NKr7BolDH5aoyave2a356tJEwwU40xpr898ava3ra6h0/U4q1cNoQKp+eJJS?=
 =?us-ascii?Q?EanvDuOjkKOCRMQGvu8O8/n7r609jOf4W2fAkPDLMdvDueOHYFdUAPW/kkgx?=
 =?us-ascii?Q?VFH0/FL0fwMWANPtxBctXhH/tvpnIrC2p1YPNNfY/oyQEotRZ3dIQ3ZMMWBM?=
 =?us-ascii?Q?k+1U3picX9URey0GmIYmzMInpO5S9Vi7Gbl84ZeC?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5427.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e02a4904-937e-4107-49c9-08dddfa1a0a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2025 04:25:43.3582 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 02d43OskAgllmwb64hr7j9r3Srf435F1Ct3/kSJRuGJcZxQzzE0X0aMjV6c0xxCy4vxjOoO9l/uw884Ad9WAyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7718
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


On Mon, Aug 11, 2025 at 02:04:14PM +0530, S Sebinraj wrote:
>A periodic GPU frequency monitoring and tracing program for the Xe=20
>driver. The implementation provides periodic sampling of GPU frequency=20
>through the Linux ftrace infrastructure.
>
>Key features:
>- Periodic GPU frequency sampling with configurable intervals
>- Immediate frequency change reporting via tracepoints
>- Integration with Linux ftrace subsystem under 'power' events
>- Per-GT (Graphics Technology) monitoring support
>- Dedicated workqueue for non-blocking frequency sampling
>- Configurable via CONFIG_DRM_XE_GPUFREQTRACER kernel option
>- The monitoring interval can be configured at runtime via the sysfs
>  (default 5sec).
>
>The sysfs entry is at:
>/sys/module/xe/parameters/gpufreq_monitoring_interval_ms

This is actually a module parameter, which is global to all devices xe bind=
s to.

>
>The tracepoint is exposed at:
>/sys/kernel/debug/tracing/events/power/gpu_frequency
>
>Format: {unsigned int state, unsigned int gpu_id}
>- state: GPU frequency in KHz
>- gpu_id: GPU clock domain identifier
>
>This enables userspace tools and system monitoring applications to=20
>track GPU frequency changes for power management analysis, performance=20
>tuning, and debugging purposes.
>
>Signed-off-by: S Sebinraj <s.sebinraj@intel.com>
>---
> drivers/gpu/drm/xe/Kconfig                  |  22 ++
> drivers/gpu/drm/xe/Makefile                 |   3 +
> drivers/gpu/drm/xe/xe_device.c              |   7 +
> drivers/gpu/drm/xe/xe_device_types.h        |   4 +
> drivers/gpu/drm/xe/xe_gpufreqtracer.c       | 292 ++++++++++++++++++++
> drivers/gpu/drm/xe/xe_gpufreqtracer.h       |  30 ++
> drivers/gpu/drm/xe/xe_gpufreqtracer_trace.h |  48 ++++
> drivers/gpu/drm/xe/xe_module.c              |  12 +
> drivers/gpu/drm/xe/xe_module.h              |   3 +
> 9 files changed, 421 insertions(+)
> create mode 100644 drivers/gpu/drm/xe/xe_gpufreqtracer.c
> create mode 100644 drivers/gpu/drm/xe/xe_gpufreqtracer.h
> create mode 100644 drivers/gpu/drm/xe/xe_gpufreqtracer_trace.h
>
>diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig=20
>index 714d5702dfd7..d9d07ec69875 100644
>--- a/drivers/gpu/drm/xe/Kconfig
>+++ b/drivers/gpu/drm/xe/Kconfig
>@@ -129,6 +129,28 @@ config DRM_XE_FORCE_PROBE
>
> 	  Use "!*" to block the probe of the driver for all known devices.
>
>+config DRM_XE_GPUFREQTRACER
>+	bool "Enable XE GPU frequency tracing"
>+	depends on DRM_XE && FTRACE
>+	default n
>+	help
>+	  Enable GPU frequency tracing support for Intel XE driver.
>+	  This adds an ftrace tracepoint that reports GPU frequency changes
>+	  at periodic boundaries (default 5 secs, configurable via the
>+	  gpufreq_monitoring_interval_ms module parameter) and
>+	  on direct frequency change events.
>+
>+	  The monitoring interval can be configured at runtime via the sysfs mod=
ule parameter:
>+	  /sys/module/xe/parameters/gpufreq_monitoring_interval_ms
>+
>+	  The tracepoint will be available at:
>+	  /sys/kernel/debug/tracing/events/power/gpu_frequency
>+
>+	  Format: {unsigned int state, unsigned int gpu_id}
>+	  Where state is the frequency in KHz and gpu_id is the GPU clock domain=
.
>+
>+	  If unsure, say N.
>+
> menu "drm/Xe Debugging"
> depends on DRM_XE
> depends on EXPERT
>diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile=20
>index 8e0c3412a757..61d46cc4dc25 100644
>--- a/drivers/gpu/drm/xe/Makefile
>+++ b/drivers/gpu/drm/xe/Makefile
>@@ -170,6 +170,9 @@ xe-$(CONFIG_PCI_IOV) +=3D \
> 	xe_sriov_pf.o \
> 	xe_sriov_pf_service.o
>
>+# GPU frequency tracer
>+xe-$(CONFIG_DRM_XE_GPUFREQTRACER) +=3D xe_gpufreqtracer.o
>+
> # include helpers for tests even when XE is built-in  ifdef=20
>CONFIG_DRM_XE_KUNIT_TEST  xe-y +=3D tests/xe_kunit_helpers.o diff --git=20
>a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c index=20
>57edbc63da6f..88198ceb519b 100644
>--- a/drivers/gpu/drm/xe/xe_device.c
>+++ b/drivers/gpu/drm/xe/xe_device.c
>@@ -34,6 +34,7 @@
> #include "xe_exec_queue.h"
> #include "xe_force_wake.h"
> #include "xe_ggtt.h"
>+#include "xe_gpufreqtracer.h"
> #include "xe_gsc_proxy.h"
> #include "xe_gt.h"
> #include "xe_gt_mcr.h"
>@@ -896,6 +897,12 @@ int xe_device_probe(struct xe_device *xe)
> 	if (err)
> 		return err;
>
>+#if IS_ENABLED(CONFIG_DRM_XE_GPUFREQTRACER)
>+	err =3D xe_gpufreqtracer_init(xe);
>+	if (err)
>+		return err;
>+#endif
>+
> 	err =3D xe_oa_init(xe);
> 	if (err)
> 		return err;
>diff --git a/drivers/gpu/drm/xe/xe_device_types.h=20
>b/drivers/gpu/drm/xe/xe_device_types.h
>index 01e8fa0d2f9f..0634dbbbdc3f 100644
>--- a/drivers/gpu/drm/xe/xe_device_types.h
>+++ b/drivers/gpu/drm/xe/xe_device_types.h
>@@ -35,6 +35,7 @@ struct dram_info;
> struct intel_display;
> struct intel_dg_nvm_dev;
> struct xe_ggtt;
>+struct xe_gpufreqtracer_data;
> struct xe_i2c;
> struct xe_pat_ops;
> struct xe_pxp;
>@@ -529,6 +530,9 @@ struct xe_device {
> 	/** @oa: oa observation subsystem */
> 	struct xe_oa oa;
>
>+	/** @gpufreqtracer_data: GPU frequency tracer data */
>+	struct xe_gpufreqtracer_data *gpufreqtracer_data;
>+
> 	/** @pxp: Encapsulate Protected Xe Path support */
> 	struct xe_pxp *pxp;
>
>diff --git a/drivers/gpu/drm/xe/xe_gpufreqtracer.c=20
>b/drivers/gpu/drm/xe/xe_gpufreqtracer.c
>new file mode 100644
>index 000000000000..07eedfb79e93
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_gpufreqtracer.c
>@@ -0,0 +1,292 @@
>+// SPDX-License-Identifier: GPL-2.0
>+/*
>+ * Copyright (c) 2025 Intel Corporation
>+ */
>+
>+#include "xe_gpufreqtracer.h"
>+
>+#include <linux/workqueue.h>
>+#include <linux/slab.h>
>+#include <linux/jiffies.h>
>+#include <linux/kernel.h>
>+#include <linux/moduleparam.h>
>+#include <linux/types.h>
>+#include <linux/container_of.h>
>+#include <linux/gfp.h>
>+#include <linux/atomic.h>
>+#include <drm/drm_managed.h>
>+
>+#include "xe_device.h"
>+#include "xe_gt.h"
>+#include "xe_gt_types.h"
>+#include "xe_guc_pc.h"
>+#include "xe_module.h"
>+
>+/* GPU frequency monitoring interval constants (in milliseconds) */
>+#define XE_GPUFREQ_MONITORING_MIN_INTERVAL_MS	100
>+#define XE_GPUFREQ_MONITORING_MAX_INTERVAL_MS	10000
>+#define XE_GPUFREQ_MONITORING_DEFAULT_INTERVAL_MS	5000
>+
>+#define CREATE_TRACE_POINTS
>+#include "xe_gpufreqtracer_trace.h"
>+
>+/**
>+ * struct xe_gpufreqtracer_gt_data - Per-GT frequency monitoring data
>+ * @gt: Reference to the GT
>+ * @delayed_work: Delayed work for periodic monitoring
>+ * @last_frequency: Last reported frequency to avoid duplicate reports
>+ * @monitoring_active: Whether monitoring is currently active  */=20
>+struct xe_gpufreqtracer_gt_data {
>+	struct xe_gt *gt;
>+	struct delayed_work delayed_work;
>+	atomic_t last_frequency;
>+	atomic_t monitoring_active;
>+};
>+
>+/**
>+ * struct xe_gpufreqtracer_data - Per-device frequency tracer data
>+ * @xe: Reference to the XE device
>+ * @gt_data: Array of per-GT monitoring data  */ struct=20
>+xe_gpufreqtracer_data {
>+	struct xe_device *xe;
>+	struct xe_gpufreqtracer_gt_data *gt_data; };
>+
>+
>+/**
>+ * xe_gpufreqtracer_sample_work - Worker function to sample GPU frequency=
.
>+ * @work: Pointer to the delayed_work_struct representing the scheduled w=
ork.
>+ *
>+ * This function is executed in a workqueue context to periodically sampl=
e
>+ * the GPU frequency and perform any necessary tracing or logging operati=
ons.
>+ * It reschedules itself for the next sampling interval.
>+ */
>+static void xe_gpufreqtracer_sample_work(struct work_struct *work)

>this looks like a weird abstraction that creates issues (see Matt
>Brost's reply) that are already a solved problem. Why can't the
>userspace interested in it use perf for that? We already sample
>frequency changes there. See drivers/gpu/drm/xe/xe_pmu.c

>Lucas De Marchi

We went for this addition rather than the one in xe_pmu (via perf stat - us=
er space tool),=20
as we have a requirement to have the trace point available at d/evens/power=
/gpu_frequency for Android xTS.=20
In this case the user won't be triggering the perf subsystem for gpu freque=
ncy for gt0, gt1.. even if we add the trace points in xe_pmu.
Other comments from Mathew have been addressed in the next revision https:/=
/patchwork.freedesktop.org/series/152701/#rev3

S Sebinraj


