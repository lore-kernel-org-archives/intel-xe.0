Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC47CCDB46E
	for <intel-xe@archiver.kernel.org>; Thu, 12 Oct 2023 13:02:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C03610E4D1;
	Thu, 12 Oct 2023 13:02:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CC0010E4D1
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Oct 2023 13:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697115755; x=1728651755;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0XvtlazDBTUnfluFqpMJgG3JbnficTBRZtKaoCf+0t4=;
 b=bkwhrsLZmtyrpPDGNxGVUTji7zvuiAWjo8LQTxg6FDQ5qj1AnAv6pYOj
 YOpeaH9fSCdFWR/vY1i5pc9J5kFzOu5oaJ9NgeG2O5SP34aqSmVOB35q8
 RWOXSXej8vcgAV5ujFbF0wfwbhYxj6ZW3Zb8uXKRfTaubTsof6q/OJBTd
 Pi+QUGGtNb6Ha7ImRKKubHL//czYdio7nUdzpi+KbzaHOTL8nflNyaVWH
 wasnBvAxzM15u+Qv7fAibXnG5wBqYzy/CcFPx0DdP/cRhLcunHpJmFBDJ
 V16rs6c3fjM130zFHuHtpxI+ndAaSPr1Nyggyi9EdY+M0OgRRFLKX57NS Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="365183034"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; d="scan'208";a="365183034"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 06:02:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="878094590"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; d="scan'208";a="878094590"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Oct 2023 06:02:33 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 12 Oct 2023 06:02:33 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 12 Oct 2023 06:02:33 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 12 Oct 2023 06:02:33 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 12 Oct 2023 06:02:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FpxYAqwm5h7CrrEWPqk3PkRRezNIFeCpA6xJ5shh7NWPRB/L5x/vu259vWVjugibkbNAaIfJMKmkW9NQBuO6gnhI/xulzQ7afKOZ8D66BBEdqja/K1jkd7jZmTTL8Lc0vBN7NvVlGwNDUCYSqqbmK5ob5yiFBsEoEEn7BKRxfocncj2RPf//SFvBD+eB/mGA4IkvS4VaUF1EPbtTuXsLIA+gLR8kV1kkDAg8Ch64FOjxwINYv4rbHzrkApH0k44+vWidEzYMh6m4HKztQTbXIyhu384tJ+5PuugDsUS5ytsqXE3I6BBCMa5JLEYTG5ZVnz85RHp3aSgnmdikV4Xsig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i/j9SNzC2ZpNTUW2KICsXwkJP2ko3ZfO9HEgi/L/EHM=;
 b=DcQcqqp9apjJraR3hoZmRlDE1hfcriSyrn9jXbo1ydXa9ZDFUvP7fH1hZ5+zu/lzRJ1iHwKVNRUxgUo2vzliAKZmHNomIUBaPGScZSTp4zpA4bu5jSak3a9R6a/Lc+9oc+N5SHyMEo+NwcWPY++movjvLIb1k5rYZwvp7uKtPYeGlNw//0cT1bZfgeyif+jj2gkYpyJtVjzhFioTiqzLJY80h++PCIptkHhBO9qpGBzJmxUhZxYT5bLTzULEsfWUGwr1gDoMT0UtCS5L6Fjz3tJEMb/VVMNGrNt0oZMO7sTqhvlodcgcHFrvkcFM3jfd+wXnHn6gkCEXgW8eje+SuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by IA0PR11MB7260.namprd11.prod.outlook.com (2603:10b6:208:43b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.45; Thu, 12 Oct
 2023 13:02:30 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::f525:287c:b2c:81c5]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::f525:287c:b2c:81c5%7]) with mapi id 15.20.6863.043; Thu, 12 Oct 2023
 13:02:30 +0000
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [PATCH v2 0/6] Fix compatibility issue for intel_dmc
Thread-Index: AQHZ/MqdlvLrdaUMKUWBrYt2ybIfnrBF3agAgAAc3VCAABJGAIAAEhfQ
Date: Thu, 12 Oct 2023 13:02:30 +0000
Message-ID: <SJ1PR11MB61294D21C69E3A887D22DA82B9D3A@SJ1PR11MB6129.namprd11.prod.outlook.com>
References: <20231012050645.2058219-1-chaitanya.kumar.borah@intel.com>
 <87r0m02op1.fsf@intel.com>
 <SJ1PR11MB612979618F7681A6887D9E68B9D3A@SJ1PR11MB6129.namprd11.prod.outlook.com>
 <87ttqw12bf.fsf@intel.com>
In-Reply-To: <87ttqw12bf.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6129:EE_|IA0PR11MB7260:EE_
x-ms-office365-filtering-correlation-id: 607ba95a-40b5-4527-235c-08dbcb237e60
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: I8d4OeoG3RWGvx78yJoJ2tTZ6XIp29ziC+IXcPhTlAtXp2mJt3ib6jJ5J+wKaHg/P5SkOk4RM6pgHSp9Rhp6YkgltsrhPp/Ry21KakDC9LYmDmGu+iKHfVa8l/imr3f2kCJhip7kWplalSBcctz9EfiFbIOzxmWpPG46+myTLxHzuxw5GTIx+H755RlE0WSRY4FjHZQNSaBp1tQWjulWXYBfgxNsWKNgYS28739xCQvB/m3GIQiC1Gd0m9TmB7Ohg2WhtEMECVRoLxHQPLX880SH7u4lkvXYDvfGRHFPT/tPhPLeFlSnvJf/QSkYCmXJgMv2oD6VcDMw27Y6isSal5RMcMDQYF+Lkyc305Bpv90WNrK/okDz3crc/RdhSAHmgJbAR+Ki6sDDtWwONsK4FrH5lUDOASQvsNvXZmmTDEjy5p+csJMxry/eoO98LCV2fiN4zeOA/au5fEozAXshy5P4kWQVi12XUf5pRLrVYcwHlAKQYbwrE72ZXLTa+zh+YURwmj9tih1RK3pQ3wJJPmoej1IyN0nzn6B90kjWhPFwFtvxpmKlx4W+ixcjzHR82TR9rOCnkpNSQJuuTO9HTk7sgIO5F4OUkdtDssub7Gg7cXvbtus9X63UrWAttFbM
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(366004)(39860400002)(396003)(136003)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(55016003)(6506007)(7696005)(71200400001)(2906002)(478600001)(8676002)(4326008)(8936002)(52536014)(5660300002)(110136005)(66556008)(66946007)(76116006)(316002)(54906003)(64756008)(66446008)(66476007)(41300700001)(83380400001)(33656002)(82960400001)(9686003)(122000001)(53546011)(86362001)(38070700005)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?eNLrnV4ACzpvDQ0odOaP/junfXI8yF0fA7k23pFvgt0bmPi8JDn0LU7cUEMC?=
 =?us-ascii?Q?H6ZVKguhIYRYnJ8aU+arU/3HZhwMfk5DHtan2eUoHeQ4NCggmUklfqe3RZnX?=
 =?us-ascii?Q?Zx0JWTeG7wX1hIto+PZ3bvPnwEF7M4eQIde6RquDREudBwlw1AbJMpPYJ0rO?=
 =?us-ascii?Q?6Ly7xbknu6NOQ1p7+sGfHA6yB5svBsE/U+aeZV4AOyof0hM7J+Evhv9GcH/g?=
 =?us-ascii?Q?5khBuhv8T5QRlzilEVmPnw8JALJOD5/zHmGYLFUtGxsDKzQGl4SaBhqhPdtY?=
 =?us-ascii?Q?T8pWUjFlkzTIQqdz5/ASeoVSqQeVm+5PyuOcvevI/82W7z4fLluoRxHzjtxS?=
 =?us-ascii?Q?7+/QgBsQvpnPes7qZ60XAUm+cJtTqOJJyaUtz7BipRWWqWNqOWA5WmeUnkTJ?=
 =?us-ascii?Q?Wpb3mlLxDBByhFp7B9SnX6CsAWU3+WrY1YTCgPpR0ywisaXkBUwnpnsC27cj?=
 =?us-ascii?Q?OkxNLZJA6ljlhOUW3KzkNmp7g+iRPY+SCpyLGgge0If0OINr8XRdk08gZP9h?=
 =?us-ascii?Q?N7ehXJpLFEYsPXW8he0WbJCZCKsEncSDE/F61NIVDf90kXpXjD6/goaleC37?=
 =?us-ascii?Q?+BbHhY6WQJO7SjccOIq8Dxu3sN7gx2cxO1G/mvQWzbgGBdTmyR3oj9/Nulue?=
 =?us-ascii?Q?KZjyhD73H1FjZhyuxcIwV3BWKkUs/8HtG6ZX2D2jwZsZbTDTzV9TgzfEw1A+?=
 =?us-ascii?Q?A9OSvy+x8Wp+7cIznj+yz7C2A1+AmXc5N5I/2u9yvuG+Flg5ZBhIAfGeD7GY?=
 =?us-ascii?Q?08ReUsNXC3BtXZOLjgu5uwSC2vdnjZ6mjnq6L5LlmPH86v2DrtuiRHEd1PFH?=
 =?us-ascii?Q?kMER/fMdkC5vjSEk0MQEgDx4r9Kirqbjc4gADyQ0TT3+Orr2hWT3xBJn8LES?=
 =?us-ascii?Q?n32KjewiFzP8Uch6Gx5iwVAPh9nuELqVtqtpyapQ5lSQyUTR43H3bf7q3RWb?=
 =?us-ascii?Q?bmaGjW14o0zS7ZH+U58kKVnxd1sJWer4sc3XB6Ii1Wl9Jw4zatPC9aJe5eNo?=
 =?us-ascii?Q?LC/y8gJ4Bxku4+WBPiIVOmrBboV3nPENRDWiWtTyYmaDk5XPX0Hfk52mB+v1?=
 =?us-ascii?Q?od6TH5wFrj3bS9JOcGb9+NlkcyEaearhPwIg4N5psL4FXpGwIukOFiSIw9Jj?=
 =?us-ascii?Q?CJ368+LMLKpr3n0OmeWCpKR1LFK8HuF5mzCssZI6PjRTSdlR+4HjNhLUycmY?=
 =?us-ascii?Q?ZdJadT+C5Vz0eWUeyDm+Y9297mWHB9Jy7pWASOY+AisTmcxdAZmNh8JXjwRv?=
 =?us-ascii?Q?HxThjsqHEIOhHfYFEh+WMJYxpWTHvmLip13mQgQqf4g7gsAY7j9lqQjzTZ/y?=
 =?us-ascii?Q?oKQ8q+Jb5/RGZQjFvsVAdefksH65Tquo4V4sJ8CMQYElEh2R0nRqaXUxkqFC?=
 =?us-ascii?Q?bWMEc5NNkZL7j2QAJUnAzoS1I7uK82W7Xj7ewS18Zq0y4JAwjO2a219eUGjR?=
 =?us-ascii?Q?D5pJZa8ZA7mo4zgKiWnRDK/MU+KRf1U/7ee5S0V4190E8yJ8iNjeHkUoBkyk?=
 =?us-ascii?Q?2NIKsv09V5/crysDsQrjcmVitx91sB/1ffmuUK2tpEYHUKJvT1vZW5NyuD1w?=
 =?us-ascii?Q?uqPJ+vFfr9mcSq8TTng0m747IRKJH9r8HCJgDJ1O?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 607ba95a-40b5-4527-235c-08dbcb237e60
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2023 13:02:30.7184 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iTj/98MwEIygzN3c4CacafL+kbo06oJxnRWiIj8HNY5EujNU6khaboFFgavRRoiaWf08WIFoy31VbtTc99d0YrsWT1craz/30GFSkf4SUDA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7260
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 0/6] Fix compatibility issue for intel_dmc
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

Hello Jani,

> -----Original Message-----
> From: Jani Nikula <jani.nikula@linux.intel.com>
> Sent: Thursday, October 12, 2023 5:27 PM
> To: Borah, Chaitanya Kumar <chaitanya.kumar.borah@intel.com>; intel-
> xe@lists.freedesktop.org
> Cc: Shankar, Uma <uma.shankar@intel.com>; Manna, Animesh
> <animesh.manna@intel.com>
> Subject: RE: [PATCH v2 0/6] Fix compatibility issue for intel_dmc
>=20
> On Thu, 12 Oct 2023, "Borah, Chaitanya Kumar"
> <chaitanya.kumar.borah@intel.com> wrote:
> > Hello Jani,
> >
> >> -----Original Message-----
> >> From: Jani Nikula <jani.nikula@linux.intel.com>
> >> Sent: Thursday, October 12, 2023 2:38 PM
> >> To: Borah, Chaitanya Kumar <chaitanya.kumar.borah@intel.com>; intel-
> >> xe@lists.freedesktop.org
> >> Cc: Shankar, Uma <uma.shankar@intel.com>; Manna, Animesh
> >> <animesh.manna@intel.com>; Borah, Chaitanya Kumar
> >> <chaitanya.kumar.borah@intel.com>
> >> Subject: Re: [PATCH v2 0/6] Fix compatibility issue for intel_dmc
> >>
> >> On Thu, 12 Oct 2023, Chaitanya Kumar Borah
> >> <chaitanya.kumar.borah@intel.com> wrote:
> >> > This series reverts hacky #ifdefs from intel_dmc
> >> >
> >> > v2: Rebase
> >> >
> >> > Acked-by: Jani Nikula <jani.nikula@intel.com>
> >>
> >> Mmh, come to think of it, the last three patches probably also need
> >> to be fixup! drm/xe/display: Implement display support.
> >>
> >
> > Just so that I understand correctly, we need to add the header
> > inclusion as fix ups?
>=20
> I think so yes. Everything under compat-i915-headers has been added in
> "drm/xe/display: Implement display support".
>=20

Understood, thank you for your inputs. I have floated another version.

Regards
Chaitanya

> >
> > Regards
> >
> > Chaitanya
> >
> >> BR,
> >> Jani.
> >>
> >>
> >> >
> >> > Chaitanya Kumar Borah (6):
> >> >   Revert "FIXME: drm/i915/dmc: xe way of getting at stepping"
> >> >   drm/i915: Add wrapper for getting display step
> >> >   fixup! drm/xe/display: Implement display support
> >> >   drm/xe: Add intel_step.h compatibility header
> >> >   drm/xe: Add i915_gpu_error.h compatibility header
> >> >   drm/xe: Add intel_uc_fw.h compatibility header
>=20
> These three.
>=20
>=20
> >> >
> >> >  drivers/gpu/drm/i915/display/intel_dmc.c      | 19 ++--------------=
--
> >> >  drivers/gpu/drm/i915/intel_step.c             |  5 +++++
> >> >  drivers/gpu/drm/i915/intel_step.h             |  1 +
> >> >  .../gpu/drm/xe/compat-i915-headers/i915_drv.h |  4 +++-
> >> >  .../xe/compat-i915-headers/i915_gpu_error.h   | 18
> +++++++++++++++++
> >> >  .../drm/xe/compat-i915-headers/intel_step.h   | 20
> +++++++++++++++++++
> >> >  .../drm/xe/compat-i915-headers/intel_uc_fw.h  | 12 +++++++++++
> >> >  7 files changed, 61 insertions(+), 18 deletions(-)  create mode
> >> > 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_gpu_error.h
> >> >  create mode 100644
> >> > drivers/gpu/drm/xe/compat-i915-headers/intel_step.h
> >> >  create mode 100644
> >> > drivers/gpu/drm/xe/compat-i915-headers/intel_uc_fw.h
> >>
> >> --
> >> Jani Nikula, Intel
>=20
> --
> Jani Nikula, Intel
