Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F211C35274
	for <intel-xe@archiver.kernel.org>; Tue, 19 Dec 2023 03:04:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B2E610E16B;
	Tue, 19 Dec 2023 03:04:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4679F10E16B
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Dec 2023 03:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702955076; x=1734491076;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VcudStVV3/tccUcPaHppnZIaBJlD1UMAj3UUweZbj40=;
 b=kBO5nM2c1dejymEuizKG1sEb61BI+tCZpbwJ0fcBLNjPYvaeC0nWUbi4
 PKuuf48pVk0cev/xDIdvaoAORc0mVSydsnDIGvOKeF6MSWTxOSIT6Arwe
 gWP9AIMDaUsUBhlUfySqLz13LryPjI9Us044p4GD65U6YzNHgFNLI7XE3
 FxV+Xke9MSm2NZoi0QRq7ARs94kHiNXr9F34/EGanfgOywoghj9faPuFs
 rFIsA11Aa3EFEq7TRCN80v4KT9JxVbbwDCqpSWueLhoDIW8od7/CEEQlU
 8BWo0vVbs8Z/+58YtSqT54XTNJVuLBF1c3E95Y09Qa4o/uz1w0Mr/+3cE Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="2423883"
X-IronPort-AV: E=Sophos;i="6.04,287,1695711600"; 
   d="scan'208";a="2423883"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2023 19:04:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="894099707"
X-IronPort-AV: E=Sophos;i="6.04,287,1695711600"; d="scan'208";a="894099707"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Dec 2023 19:04:35 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 18 Dec 2023 19:04:35 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 18 Dec 2023 19:04:34 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 18 Dec 2023 19:04:34 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 18 Dec 2023 19:04:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OJuKQZIZnKoE+s8s/FSs2lGwALfTLE4TtIE7xrdIlVLZz8AmU8WxWQoElGsinp1tcBk7IeKP8Ygegbjg3TUtnXpBXZuEDGcnsV6Qa0goUCHf54QpPgrLr9Wa/1AefsGEtmR0KaV5i3WU37Z0/gZlKtA75ZxVyZJmblId8NRup6ZThvOk9zhx4VOHX2SaVzkkBfvybWeCJ+Q22RUCxauWIR2+g2xTh3viRUrxyR2KEAPJXfzPeyy9fv0FsO0Pful+eaaa+zi1fAQWhOgr2Ad53m+U9g+9u8iya/nMA9QRZbnVCpcblBVwRQwC0deFuSIQqKKjSEex1MD7uXXB+97N8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QqUjtc9bh3ce6GagfsY64e4wae61Ahg9cYPSLpsxHY8=;
 b=QFhQ8K+N5pj7SVd/QKPU+3rtMwlO6blHkc89iToQbs7e5vwVohoPqesq1SlZSP5kKRaTimAC6uYIq+kKaDdG/YSSz5cCHXHDdm21GdurZcInCoAWLdk7GLowj3R6PdzqTa8FreDzi8aCo2zLnfdUVx1i3HCyKeaA7AVZ4Qw+XnmLVgAqoHCpTrvPgCBa8xThSjRVDq0Gjt3Nae6J/lR98+C8TuuDSaueiSHP47MCNNcnTZt4hEgatcus/nm2BRNJFq8tvk5RPS89ihsT/tMq8SXqCQDfjz+Uek5DEItTrRZFWkON1FLYCdTgmzY2wP2hAsZnkhBiJnl7c8vI+6PJYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ2PR11MB7427.namprd11.prod.outlook.com (2603:10b6:a03:4c1::15)
 by SA1PR11MB8428.namprd11.prod.outlook.com (2603:10b6:806:38b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.37; Tue, 19 Dec
 2023 03:04:32 +0000
Received: from SJ2PR11MB7427.namprd11.prod.outlook.com
 ([fe80::b300:5357:7b0c:504f]) by SJ2PR11MB7427.namprd11.prod.outlook.com
 ([fe80::b300:5357:7b0c:504f%7]) with mapi id 15.20.7091.034; Tue, 19 Dec 2023
 03:04:32 +0000
From: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: FW: [01/17] drm/xe/perf/uapi: "Perf" layer to support multiple perf
 counter stream types
Thread-Topic: [01/17] drm/xe/perf/uapi: "Perf" layer to support multiple perf
 counter stream types
Thread-Index: AQHaMMWCS5vyUwTUSUi0DMunSsRb6LCvZSyAgACJRNA=
Date: Tue, 19 Dec 2023 03:04:32 +0000
Message-ID: <SJ2PR11MB742781DC4A3F035D3E1F41598697A@SJ2PR11MB7427.namprd11.prod.outlook.com>
References: <202312170845.3BH8jqwL1524331@gzadicario-vm-u22.habana-labs.com>
 <877clavr7y.wl-ashutosh.dixit@intel.com>
In-Reply-To: <877clavr7y.wl-ashutosh.dixit@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR11MB7427:EE_|SA1PR11MB8428:EE_
x-ms-office365-filtering-correlation-id: d8d72950-69af-403b-419a-08dc003f398f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: il32EnzEJBUUfKZCqbFd1ymNSCBm/cJ5X65xjtSHikFNFaR2QZFjaZd4rRxgydQzbcMPw4mr+orT5yE6/4ae+kC2zi2i85AaCCgfuRbYuibtVtlQa2cujKGmmjwVoIH9kFbab7SwkVfP9TAJUfnPGgpU9wpnEIOg+m8pqi15t83SrcO6WI5KsrTwRO72Jw+XhuIz81mI9cFpIndc7oaJpM7h7GfK3zcLlmgAfzBMkRHnAEcF3gmyI1e/kbYkAKC+JkgxIHPF+2P1VPJccQPYISSLdEHaiZkZ0yTPTrLUQFvMI18+y/C7eUQ4QQ+DrbkbPjWMDxt6jQusj9lORBXnnDUCkIXrzzxnZNDzxFtQEXcgdEKhxBpa5+QAhtTbxcBC7Y1g0gtEUOiAGzVm+bldMZWajzQuXeDJXe5TuKpEahEdFngTVbgsR1M3VhebniqFktT473MrYJ2LN0ZJn52pc95IiiV6ZI/++kBDVej5uwnlM65wG9GTEXbuU14oj6BPlt3U28nT6fqlcRrzDMexSohWOJO2XljDzofe+2mlfiVYZA0uy05ckMDy3rq/rviyUrTnl4hlBQA/1LY162beaR52Qz03iajYnyoxjjVtXs7BhZtzs0zifChPYsWi57/b
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR11MB7427.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(39860400002)(346002)(376002)(396003)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(2906002)(5660300002)(38070700009)(41300700001)(33656002)(86362001)(82960400001)(122000001)(38100700002)(26005)(55016003)(66946007)(66556008)(66476007)(66446008)(6916009)(316002)(54906003)(478600001)(64756008)(76116006)(71200400001)(7696005)(6506007)(9686003)(4326008)(8676002)(8936002)(52536014);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?d3B2rupoZmOJXBa6kbQCG3zYrmEdmwOuTbkxtgU+N+e4Y8ROeM7+JfQZvfsJ?=
 =?us-ascii?Q?ntc+X6OLf7R6JKu9lPkS/aBwOiPKA7ZRFSkgJcK6i2TVfGk3i2K6qFHnGyze?=
 =?us-ascii?Q?Fufv1VUwqzx3HuBctbplwc6wShf47vTfEgauqRAry2y4IRxj+LfafG83qbED?=
 =?us-ascii?Q?NxH3nM1sPWfiz9QKmkaB8adzXf0N8/bdwp4iOOvOotYM3cjP/wWoDIpRaCZI?=
 =?us-ascii?Q?HB+6doPr6oOSyLZTTPKLljlkrLFTEjk22oqJqh+K5ai3mq592yOWt1rlSR4d?=
 =?us-ascii?Q?pS75NzOs1hONesvrFabcSZ4fn3INAsBKfDJ8cF6u+Dn/Tpw43FYDBipY2gYr?=
 =?us-ascii?Q?GDs2C1UMigzr1jllwcIBrLZOqEnbdcI44ofhfM0JctlP3Zo0RkjOQGYcEWys?=
 =?us-ascii?Q?tD2wfHO36a5IHQ63K5vntKzZP7svgyKb6znIEscAupZuLO35mQiRhuwyrxyE?=
 =?us-ascii?Q?xCcUbR6qCnDnN/UALeIfSWnYXca465t4GmcNZiXvhZj1XW7Fb7F69rqiVb33?=
 =?us-ascii?Q?59IOqMbKfpnkTU+JglVZL5jJJeT9IlpmPNP4HQDJfV/pt6yo3m97Ei6N8Hbl?=
 =?us-ascii?Q?zJ7V8x0xYeZiOaKLjEc+A7uNEgbI7ab2e6nkRN3UChVx67Dtm1UvGoDyZP9J?=
 =?us-ascii?Q?CBJd1/zyb4JxyFvoo8e3ZsQ4e0MoS5MHgr9kKW6syNzdwGmnPTUCsFXGvZHp?=
 =?us-ascii?Q?Qhhjlsk6nTrBWddsVorb1CEIM4UTMzxRbo+BkqFxjWvXZQJifT8BLpKcZ7j2?=
 =?us-ascii?Q?2Gv0ZSupBTCl2tiqVeLIeWpA3zJbI35RQR2EjquoHqN1k5KuVj48mM2RiQGk?=
 =?us-ascii?Q?exvj+8pCPXxGmZDpsFcWgz5gzIpOygTnt5JQxmXS63RfXdMoHe6/aCgZnwPF?=
 =?us-ascii?Q?t+bHDRM+V5md+cWZN7jDmMFwAxtrGkZKCaoJOHY/bvKBK8FZhh/peDktNudF?=
 =?us-ascii?Q?QQ+Wmy5LLX46ww9zyj+WhEIyWu8/9e84yQ8yJCxsIkHQWluaQ4KYA6KiyYbQ?=
 =?us-ascii?Q?t+sQ7F5dKIfbciXEfNL6ITsYt9rIIdw5jgSk9voSPo2tl3EtnMfPNidqN9dT?=
 =?us-ascii?Q?/QNWzkqCricH4XmyCTNvB+LhA0tsmWuMhJ4ymJGaOeCmMyfOXeXN3UM3qUIq?=
 =?us-ascii?Q?OuvA/hTVPEVYjDfqtSsuMDxTsJwlURPiBw7R7fvU1F8bEqhdxfkFvgbtehTj?=
 =?us-ascii?Q?JJGj+Lo8pMFYfMQVfO2baXRcwBU/NHpL1X03W9DuvErHqI0aYVzCjSqmBmAW?=
 =?us-ascii?Q?6pR4k1UzT7i0mSc6UaSA+06qpcqsS01Wn0AlAAPFa0aYWd0U51uUddvvHL3W?=
 =?us-ascii?Q?/UJzvYKBRjob/1zvwhMFu0HdtmXZiHjZZljhZlPusWmj8TrlZHQMR5oNeySi?=
 =?us-ascii?Q?GP5PLEoq0XeprPEkDrL532EpBNfyHH4+gHj1yk2SOJMbwurF5hBUODyfB0Q4?=
 =?us-ascii?Q?P8HqSSjPMGc7nJfT2xcCfPBBMLuJizdHMPWQUxadwpJyv7cdGKIK4t97khH3?=
 =?us-ascii?Q?AP5HNOiWUmN/HcodisDFitvsos4GZcdmmEOB/e/9f59WOe6ycqxoH1nF0wSz?=
 =?us-ascii?Q?ZuszHTLl6ACx/+XnuWjatbw/lHrrSqB/Xm3cWIFR?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7427.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8d72950-69af-403b-419a-08dc003f398f
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Dec 2023 03:04:32.7872 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g4URli/8hWNM6w1z3rENiK3Y1xWnMELVU+OSRyMNyozl656kDncTKN7Z8Rn8h8D9U7U5BTI22xrXLcqdbJRRv6aOYJ3wiu4ND3cR02s6dCg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8428
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
Cc: "Chegondi,
 Harish" <harish.chegondi@intel.com>, Guy Zadicario <gzadicario@habana.ai>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Sun, 17 Dec 2023 00:45:52 -0800, Guy Zadicario wrote:
>
> ..
>
> >diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> >index eb03a49c17a13..3539e0781d700 100644
> >--- a/include/uapi/drm/xe_drm.h
> >+++ b/include/uapi/drm/xe_drm.h
>
> ..
>
> >+
> >+/**
> >+ * enum drm_xe_perf_ioctls - Perf fd ioctl's
> >+ */
> >+enum drm_xe_perf_ioctls {
> >+	/** @DRM_XE_PERF_IOCTL_ENABLE: Enable data capture for a stream */
> >+	DRM_XE_PERF_IOCTL_ENABLE =3D _IO('i', 0x0),
> >+
> >+	/** @DRM_XE_PERF_IOCTL_DISABLE: Disable data capture for a stream */
> >+	DRM_XE_PERF_IOCTL_DISABLE =3D _IO('i', 0x1),
> >+
> >+	/** @DRM_XE_PERF_IOCTL_CONFIG: Change stream configuration */
> >+	DRM_XE_PERF_IOCTL_CONFIG =3D _IO('i', 0x2),
> >+};
> >+
>

Hi Guy,

Let's discuss this a bit and then decide what to do.

> It apears that in the hwtrace PERF stream I need to pass some arguments
> in the ENABLE/DISABLE ioctls. This is required since firmware will
> implement the enable/disable functionality.  I would suggest to use
> different enums for the stream ioctls, you can rename drm_xe_perf_ioctls
> to drm_xe_oa_ioctls and I will define drm_xe_hwtrace_ioctls.

I meant the above ioctls to be ioctl's which could be common between the
different stream types. A couple of points:

* The above ioctl's do not prevent you from passing in any data. E.g. with:

  static long xe_hwtrace_ioctl(struct file *file, unsigned int cmd, unsigne=
d long arg);

  If 'arg' is a pointer, any data you want can be passed into any of the
  ioctls (enable/disable/config). So there are no restrictions. Each stream
  type is free to do what it needs.

* Each stream type is free to add whatever ioctl's it needs, or ignore
  these common ioctls. E.g. this is possible for HWTRACE:

	#define DRM_XE_PERF_IOCTL_ENABLE   _IO('i', 0x0)
	#define DRM_XE_PERF_IOCTL_DISABLE  _IO('i', 0x1)
	#define DRM_XE_PERF_IOCTL_CONFIG   _IO('i', 0x2)
	#define DRM_XE_HWTRACE_IOCTL_ABC   _IO('i', 0x3)
	#define DRM_XE_HWTRACE_IOCTL_XYZ   _IO('j', 0x4)
	#define DRM_XE_HWTRACE_IOCTL_XYZ1  _IO('q', 0x9)

* Currently we expect to have 3 stream types: OA, EuStall and HwTrace. The
  above ioctl's are used by both OA and Eustall (and also it appears
  HwTrace). EuStall just uses enable/disable, it doesn't have 'config'.

> I'd also like to add another stream ioctl to retrieve the stream status
> and avaialable bytes.

So I believe I have already answered this above.

Maybe having each stream type (OA, EuStall, HwTrace) have its own separate
ioctl's is cleaner, and we can switch to that if people want that. But I
think the current scheme doesn't prevent the sort of operation you want.

Thanks.
--
Ashutosh
