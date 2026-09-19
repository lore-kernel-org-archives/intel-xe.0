Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 764B7C982DE
	for <intel-xe@archiver.kernel.org>; Sat, 19 Sep 2026 02:13:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECC0A10E0E7;
	Sat, 19 Sep 2026 02:13:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R13AyDVy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57B7E10E059
 for <intel-xe@lists.freedesktop.org>; Sat, 19 Sep 2026 02:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789784034; x=1821320034;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=eWdzZVnZiD49PcUO4puHQLLdS6oITlGeOF6VybDa8Nc=;
 b=R13AyDVytIk408G/Ur6w4ZH4ijtrqB28KVnWQOBUJNJscxvNxj3BkRK3
 NZLNA81hre48Sn6GeUM9CjG03v1Wh9Uj35NfYJPqtvOJ5fsDbiK73HN13
 YV1uXlbRh9byvZbcOAI7sBmLonC9HRr4IZxsCA3izjs0IOxczzFzDVlo+
 JOAPmsekq1x1ZVOGfHvMwyljGFld6jxjriTQDcvbBaFncu1JzYbwroS04
 2fkpTWgkchmEwpSzJ7A8naITEj6a64Fdi3Oda4XYZR+XaetapRflL1P36
 4Fx3PtjwvGfMF78OGoseYud+16VSR8atCnVdFPRskSoC5n2OeVsZpNQ4w g==;
X-CSE-ConnectionGUID: diks2gkkQ8+zf1Oi6Pwu+w==
X-CSE-MsgGUID: MfnrSYi2QFmDhbwWm7G5Jg==
X-IronPort-AV: E=McAfee;i="6800,10657,11909"; a="90338272"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; d="scan'208";a="90338272"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2026 19:13:53 -0700
X-CSE-ConnectionGUID: 1/oN+ZJHThegOiNRsN5uHA==
X-CSE-MsgGUID: NKH02jPCR7OQHYtdEeACZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; d="scan'208";a="268373326"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2026 19:13:53 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 18 Sep 2026 19:13:53 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 18 Sep 2026 19:13:53 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.60) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 18 Sep 2026 19:13:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lzhUFdT+lWSQH5DTJ11o8Pqu1ulZJLvno/1MUKjXCEJ8Hs/auAUv26lZQhi8e3ws1nAgUoczS1jg/f+43VXzLj9s8J35nq2HWizLm1DzYzsJCAStWxUaYaWUFX0ozVuGaToVBkYg17x/bgTnQLcSyi8Qm1yzwLGITVJh4Lq59RheiVRvwi29P06Hep7DgP5PyskRotRFLo6BVhU9jnu8OOvxWD60sEIQobLDKsXNtGq/ClCUP6lT8YRedF8DGgYHFwQsfJCYY8Uvai9m6/N7OSbxTt/6dlM3xllIbcJYpX9Eq+uHD9ffNAOWUMcqa+6L31j8bT9DH0+4+l8PqXR3sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f0pmOPG4S8H7cmHIgTOhnuxRrTi69+6EkwzQm06hZmQ=;
 b=u9zElk0VraE7ETUmnUbwbVeBAbHmtpZ/A5ABdw4l4UWyBzg5joKiFDHPU8u2So+1/ixB+i1VLj829xV3w4F579LXGH5xEoGyBULInoVzfBSAzN+Wv+WM+dkvGRPq02wHcVxyk/zMpl2S8DlZgF5YFw6fop69qn746cibgwUFtI8N50rKlkZ1KcIAbq6yiUNagLbhqdRubZkiEeVLZsQGnv8LQ7PWUModCQdkESMUgcuvpuDP5aIyIw2KN0LbKbbx7OH6nqwYlFF0W/s2QohrN0V5DGC1SNNMzkkAQ1i+mD0g0Ja1A/1rEq73/2mGd1XtbtICbBnHPSJwdcWczVdViQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by MW5PR11MB5810.namprd11.prod.outlook.com (2603:10b6:303:192::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.16; Sat, 19 Sep
 2026 02:13:50 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082%3]) with mapi id 15.21.0428.011; Sat, 19 Sep 2026
 02:13:49 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 =?iso-8859-1?Q?Thomas_Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v6 23/24] drm/xe: Add modparam to enable / disable ULLS on
 migrate queue
Thread-Topic: [PATCH v6 23/24] drm/xe: Add modparam to enable / disable ULLS
 on migrate queue
Thread-Index: AQHdPLK3jO4uWN3ATkSMrSrfK4I1wrbF6gMAgACqAICADqhY8A==
Date: Sat, 19 Sep 2026 02:13:48 +0000
Message-ID: <DM4PR11MB545647D3E160C98BC68452A3EA862@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20260904211613.3934307-1-matthew.brost@intel.com>
 <20260904211613.3934307-24-matthew.brost@intel.com>
 <ede219e02fab3c78c66edfb9cabd0e029de318e6.camel@linux.intel.com>
 <aqGhb9k93U7PoJ1L@gsse-cloud1.jf.intel.com>
In-Reply-To: <aqGhb9k93U7PoJ1L@gsse-cloud1.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|MW5PR11MB5810:EE_
x-ms-office365-filtering-correlation-id: ded45ca0-0cb9-4791-61d3-08df15f3a474
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|10070799003|38070700021|10067099003|11063799006|4143699003|56012099006|18002099003|22082099003;
x-microsoft-antispam-message-info: EaMRVZLhbUQl84U5awTil3WzJfWfzKVfpxjo4y4vZrl8KEbR15pqpgd8De4g9aB8zo9zcCPUb0qvaJtwnDwYHmCXHUGayqm0BeBBAIvG3szJ2AkdYVqRp3EVmhXfBEFI7dICRMBoCtDf32HtMc67KhdgQXWQrNIneoUNy4AVZbfGvhCTdKKPx9YifPvKpLGI21KueTIAgLEBHa6DopUWYcOPCD/N2jAB8SSZ/QIK6DwnGwnhl5fbBkZjVZs8/9Oiu+kXxDTaZVlQdU8xkVWm4/+2uRNXgcus2ZFv/CVYztFjt/D3cIpl9ejOxHizogYtlMnLyxx6nQMtMuJpGjIJAu6yZjPpCbGAR/tGKf5P66y8i+YV3IK9aZp1Y6qkTBb1tLuWmodQD7MtUVO6hmdWMZ/3bNVxTQwa1HgkuQeI2hBv4tRC21j6aPyCB4XxUA0XiPBDF+Zm72LNiDFyY6okOzgKZQNXaoaOyNmL8tZ7z9QxE19eIwN2Nlzf9YEJysE8nE00z8ZuGFBZ3o1rPdr1F0fuzObzh4/Odzdt8hBmQGUPwhJW8QKbTRpQJW7GfS9ryi4N4FPcjFFO1fAGP7G5lqHc5epfALsroWZpsj0FmNmS1MxudSyXmclof0wFfgI5t/BYY5MPAfaFLhQ+4FqZhHOxuh3qLYQkAWtGODTkVMQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(10070799003)(38070700021)(10067099003)(11063799006)(4143699003)(56012099006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?+GDNz8zFLjS37tGztmQgQlW2ae1p7568gBnjPu+rZf9EZOklNDauJLS6il?=
 =?iso-8859-1?Q?LqIdau1itmjDMxrYB1aiJK2JR4mgD9MdFe6q0yX4SQzx9jwh8gD+txVMc5?=
 =?iso-8859-1?Q?dE6ccAIi0xqaiiAWzj3zzPWjFPZRLv9T3a4csgIOWNanbPSOE+PzXGWHpe?=
 =?iso-8859-1?Q?0RyEObd6tpO/0QpZgZAfzeFaL/cvja1scPezdPuf4hB172FhlnYBI2MAuu?=
 =?iso-8859-1?Q?+9fNpNgNbyipuVG6mWA3oUhrMOiejLhu4SAczfV97XIqjcOul9oD437oyF?=
 =?iso-8859-1?Q?0qiF66+T/zf82siDC5ZfSdQLvEbopA3Au2nRRgZUmnfYmhJFccIkuXX/Ew?=
 =?iso-8859-1?Q?mIKG2CtpsoxuRnpd69obSYXxQ/yyRcFiUfbci7pVK6a2BDJOpRlLerE73r?=
 =?iso-8859-1?Q?h4mVnWESATj/Bc8v8Inh3Bj1KGs42RJRYltcK4ocE19pya1k2ITyfUqC7H?=
 =?iso-8859-1?Q?MV/S+oduT1TJKKxJEjTo6u+pOd0Nom9Vl7wQXJKK6MCTWdZaW9BP9JtyA7?=
 =?iso-8859-1?Q?erKTNumJLp4Mqjv/oNnEth9aAz7MRJ/L4prPYeyaDpoPQfTKwik4Jjcgkt?=
 =?iso-8859-1?Q?jJcbJafLAWSsQQDhl/bczpWeyrbVQKZgFLvpUqjUT6x+Zc49HIhHHZp/1j?=
 =?iso-8859-1?Q?g2vyXvcfhcWyFl3LOWTnWoUQvaEBPGBy1thxFMSkpg615fo9uU41nY1Rid?=
 =?iso-8859-1?Q?IVlqTO71ivZ1NqMCG7jTt0WU/TKCkFzfFuvarDhU2qDyhfXZFQybwexpea?=
 =?iso-8859-1?Q?QMd54wE1fHT/JTlgFgYasBmigPH+AsSXySFEDDtR+WYFOhYNlGgnf0advM?=
 =?iso-8859-1?Q?dpsxNMrwZ7EjRKBJwMhqdQt/47wndmXsXs1meuerh/quUlFjDjElE9kfTQ?=
 =?iso-8859-1?Q?kOoANd5lhSSFzqDWt76GMDSjncGxbDAG++2bFidIkoR1r40scjqiJkHsuf?=
 =?iso-8859-1?Q?ZOr6RQclWn20CKj/sxKTLjiG75eY3CDH0O5BHqMICXxjtv81DdMLhOS+xR?=
 =?iso-8859-1?Q?t+tyujCI5PkQXiMzzCKhZ0K4EtGxjpitzumuWn+/Icz7IlOxRaRZxE8+FV?=
 =?iso-8859-1?Q?+aKLnF+3mjBa+KX/mfqFX3Bqc3lZKWY7QJ40HaqOxg3U/XG42NYJLU3K4Y?=
 =?iso-8859-1?Q?BCgaJqcgHHyWLZSKOOk9q2IbQOHavD699997pEDDAnX6V2AKKeRaXGuY1w?=
 =?iso-8859-1?Q?ZdBOAAaIsP2e4GpGJJBTbs3agFjEr8wzq0hqDonEMriV2b7Hx6HATkQWbU?=
 =?iso-8859-1?Q?Lq6oepGWSh/QPQUXMMl5rzUfDLiGNfO8kWTM1GbM50ulvBnHcJX5I9vQuG?=
 =?iso-8859-1?Q?f9EhXWkGbGOeX6z1Q1P/JSv2RkT+WnzFDh6pga/KahxB53QW/XK7+ZUvv2?=
 =?iso-8859-1?Q?qmoIrrFhnFLQ+MjZbyfL+wKAamOIs87sqOA5exvZET8kCTH4fMFuDQGgqu?=
 =?iso-8859-1?Q?DRInuUvlHXiXYy/S0HW93qi69SNzAaHyouf6h/G0tU4aCZ11oqe9vUAHiM?=
 =?iso-8859-1?Q?Wq/tOLEzk1o90xhcSvCAteRK3lMBGGV+kVSXkD6ZMQK31YQcsimn3nhadR?=
 =?iso-8859-1?Q?AG+gc0N8AOv+L2UQCw7d6jNofo24u1uBmaL7kLwzM9UPBk2zdV/NbxOe/d?=
 =?iso-8859-1?Q?QcruPOmuZloDkbJjiIjEioHnQDxDnFSJmEZWdAFyWP4BOfkSHxubpVMRfG?=
 =?iso-8859-1?Q?FlCmq8yGG8PxwSzBeVHThhmutN9LL+ASrj8FO5hR4OOrOTKivCXurBVXiH?=
 =?iso-8859-1?Q?Fjn/8OipFrWFxWrE2ISlgBBjOFdLcTF1/QqVY/ipjQAuuPxmQVSGrrKqau?=
 =?iso-8859-1?Q?JDaDEDljpytEBiL4mlbRvCF4+ggeRbg/WZzAeBkJbCV3uEEdiLzRuVnYNw?=
 =?iso-8859-1?Q?mX?=
x-ms-exchange-antispam-messagedata-1: Koty9Ij2hHWikA==
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: H9BZOZ0PnC4JTi1xD1kH7oXl+8eYRz6KpjAK6hzW0fz1TQIo5tlP2S7Cnl890v6qnw3W8k+qQh8XG88wEa9iGD6xspmNFPq3MaO0629Wn2X4Wmn6xBy+VRM8jkbIgFYM6RLyZl8y7PoTOMSunPsBbM/fOzaAlvpeHcgmbZxCSmC+RI66p4ZixMQMO0unugytBEtiWXL41M4pkSmCdI8c+VlfNL4WGqjA8GxJGt4IpvWXujts8G3VZi2ZttqvbvFnd4PFDtH0noVjAPXQsuQiuxtCbGC4WyVAyVB/KTKgBHaU/qlqgZWAiB3XIHQPRUTuKZMqsHkArquCaeU3vyu8uw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ded45ca0-0cb9-4791-61d3-08df15f3a474
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2026 02:13:49.0064 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tHpKYuf8QW27zc8/qOwTJXq44NtcqCxEkGj1wQqO3hiuV15bxJZ2JWeYv1X0sr4roCqB3m5h25NJ4/HFwNyA7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5810
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

On Wed, Sep 9, 2026 11:12 AM Matthew Brost wrote:
> On Wed, Sep 09, 2026 at 10:03:32AM +0200, Thomas Hellstr=F6m wrote:
> > On Fri, 2026-09-04 at 14:16 -0700, Matthew Brost wrote:
> > > Having modparam to enable / disable ULLS on migrate queue will help
> > > with quick experiments.

Should we move it to configfs instead of modparam?
configfs setting is per device.


> > >
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > Link:
> > > https://patch.msgid.link/20260228013501.106680-26-
> matthew.brost@inte
> > > l.com
> > > Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> > > ---
> > > =A0drivers/gpu/drm/xe/xe_debugfs.c=A0=A0=A0=A0=A0 | 1 +
> > > =A0drivers/gpu/drm/xe/xe_defaults.h=A0=A0=A0=A0 | 1 +
> > > =A0drivers/gpu/drm/xe/xe_device.c=A0=A0=A0=A0=A0=A0 | 1 +
> > > =A0drivers/gpu/drm/xe/xe_device_types.h | 5 +++++
> > > =A0drivers/gpu/drm/xe/xe_migrate.c=A0=A0=A0=A0=A0 | 2 +-
> > > =A0drivers/gpu/drm/xe/xe_module.c=A0=A0=A0=A0=A0=A0 | 4 ++++
> > > =A0drivers/gpu/drm/xe/xe_module.h=A0=A0=A0=A0=A0=A0 | 1 +
> > > =A07 files changed, 14 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_debugfs.c
> > > b/drivers/gpu/drm/xe/xe_debugfs.c index 80f62634fae5..f3f37d116d62
> > > 100644
> > > --- a/drivers/gpu/drm/xe/xe_debugfs.c
> > > +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> > > @@ -222,6 +222,7 @@ static int info(struct seq_file *m, void *data)
> > > =A0	drm_printf(&p, "revid %d\n", xe->info.revid);
> > > =A0	drm_printf(&p, "tile_count %d\n", xe->info.tile_count);
> > > =A0	drm_printf(&p, "vm_max_level %d\n", xe->info.vm_max_level);
> > > +	drm_printf(&p, "ulls_enable %s\n", str_yes_no(xe-
> > > >info.ulls_enable));
> > > =A0	drm_printf(&p, "has_flat_ccs %s\n", str_yes_no(xe-
> > > >info.has_flat_ccs));
> > > =A0	drm_printf(&p, "has_usm %s\n", str_yes_no(xe-
> > > >info.has_usm));
> > > =A0	drm_printf(&p, "skip_guc_pc %s\n", str_yes_no(xe-
> > > >info.skip_guc_pc));
> > > diff --git a/drivers/gpu/drm/xe/xe_defaults.h
> > > b/drivers/gpu/drm/xe/xe_defaults.h
> > > index 0884224ef7c7..9c7e89a169c5 100644
> > > --- a/drivers/gpu/drm/xe/xe_defaults.h
> > > +++ b/drivers/gpu/drm/xe/xe_defaults.h
> > > @@ -14,6 +14,7 @@
> > > =A0#endif
> > >
> > > =A0#define
> > > XE_DEFAULT_PROBE_DISPLAY
> 	IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
> > > +#define XE_DEFAULT_ULLS_ENABLE			true
> > > =A0#define XE_DEFAULT_VRAM_BAR_SIZE		0
> > > =A0#define
> > > XE_DEFAULT_FORCE_PROBE
> 	CONFIG_DRM_XE_FORCE_PROBE
> > > =A0#define XE_DEFAULT_MAX_VFS			~0
> > > diff --git a/drivers/gpu/drm/xe/xe_device.c
> > > b/drivers/gpu/drm/xe/xe_device.c index ade971de1652..9b81759af28a
> > > 100644
> > > --- a/drivers/gpu/drm/xe/xe_device.c
> > > +++ b/drivers/gpu/drm/xe/xe_device.c
> > > @@ -520,6 +520,7 @@ static void xe_device_parse_modparam(struct
> > > xe_device *xe)
> > > =A0	xe->atomic_svm_timeslice_ms =3D 5;
> > > =A0	xe->min_run_period_lr_ms =3D 5;
> > > =A0	xe->info.num_pf_work =3D xe_modparam.num_pf_work;
> > > +	xe->info.ulls_enable =3D xe_modparam.ulls_enable;
> >
> > migrate_ulls_enable?

For me, disable_migrate_ulls is more straightforward, as it can be used to =
do disabling only, not enabling.
But as we already have "enable_multi_queue" in the configfs, which is used =
to disable multi queue only.
I am OK with "migrate_ulls_enable" also.

Shuicheng

> >
> > > =A0	if (xe->info.num_pf_work < 1)
> > > =A0		xe->info.num_pf_work =3D 1;
> > > =A0	else if (xe->info.num_pf_work > XE_PAGEFAULT_WORK_MAX) diff --git
> > > a/drivers/gpu/drm/xe/xe_device_types.h
> > > b/drivers/gpu/drm/xe/xe_device_types.h
> > > index 997ac82fd571..fd4560378f5b 100644
> > > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > > @@ -245,6 +245,11 @@ struct xe_device {
> > > =A0		u8 skip_pcode:1;
> > > =A0		/** @info.needs_shared_vf_gt_wq: needs shared GT WQ on
> VF */
> > > =A0		u8 needs_shared_vf_gt_wq:1;
> > > +		/**
> > > +		 * @info.ulls_enable: Enable ULLS on migration queue
> > > in LR VM
> > > +		 * open
> > > +		 */
> > > +		u8 ulls_enable:1;
> > > =A0	} info;
> > >
> > > =A0	/** @wa_active: keep track of active workarounds */ diff --git
> > > a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> > > index 3e59aeeca614..3bc78f761f23 100644
> > > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > > @@ -523,7 +523,7 @@ void xe_migrate_ulls_enter(struct xe_migrate *m)
> > >
> > > =A0	xe_assert(xe, xe->info.has_usm);
> > >
> > > -	if (!IS_DGFX(xe))
> > > +	if (!IS_DGFX(xe) || !xe->info.ulls_enable)
> > > =A0		return;
> > >
> > > =A0job_alloc:
> > > diff --git a/drivers/gpu/drm/xe/xe_module.c
> > > b/drivers/gpu/drm/xe/xe_module.c index 4bc28dfc1992..a8b546550ead
> > > 100644
> > > --- a/drivers/gpu/drm/xe/xe_module.c
> > > +++ b/drivers/gpu/drm/xe/xe_module.c
> > > @@ -23,6 +23,7 @@
> > >
> > > =A0struct xe_modparam xe_modparam =3D {
> > > =A0	.probe_display =3D	XE_DEFAULT_PROBE_DISPLAY,
> > > +	.ulls_enable =3D		XE_DEFAULT_ULLS_ENABLE,
> > > =A0	.guc_log_level =3D	XE_DEFAULT_GUC_LOG_LEVEL,
> > > =A0	.force_probe =3D		XE_DEFAULT_FORCE_PROBE,
> > > =A0#ifdef CONFIG_PCI_IOV
> > > @@ -44,6 +45,9 @@ MODULE_PARM_DESC(probe_display, "Probe
> display HW,
> > > otherwise it's left untouched
> > > =A0		 "[default=3D" __stringify(XE_DEFAULT_PROBE_DISPLAY)
> > > "])");
> > > =A0#endif
> > >
> > > +module_param_named(ulls_enable, xe_modparam.ulls_enable, bool,
> > > 0444);
> > > +MODULE_PARM_DESC(ulls_enable, "Enable ULLS on migration queue if LR
> > > VM open (default: true)");
> > > +
> > > =A0module_param_named(vram_bar_size,
> xe_modparam.force_vram_bar_size,
> > > int, 0600);
> > > =A0MODULE_PARM_DESC(vram_bar_size, "Set the vram bar size in MiB
> > > (<0=3Ddisable-resize, 0=3Dmax-needed-size, >0=3Dforce-size "
> > > =A0		 "[default=3D" __stringify(XE_DEFAULT_VRAM_BAR_SIZE)
> > > "])");
> > > diff --git a/drivers/gpu/drm/xe/xe_module.h
> > > b/drivers/gpu/drm/xe/xe_module.h index
> 6272d9e41207..5d88448c298a
> > > 100644
> > > --- a/drivers/gpu/drm/xe/xe_module.h
> > > +++ b/drivers/gpu/drm/xe/xe_module.h
> > > @@ -13,6 +13,7 @@ struct work_struct;
> > > =A0/* Module modprobe variables */
> > > =A0struct xe_modparam {
> > > =A0	bool probe_display;
> > > +	bool ulls_enable;
> >
> > Shouldn't this be per device rather than per driver? So sysfs knob,
> > perhaps with a modparam default?
> >
>=20
> I didn't really want to add a userspace ABI, such as a sysfs interface, a=
t this
> point, so I went with a module parameter instead. It also seems a bit odd=
 to
> enable this on some devices but not others.
>=20
> The main reason for having this at all is to allow quick performance
> comparisons and, of course, to give us an easy way to disable it and rete=
st if
> we encounter workloads where kernel jobs appear to hang.
>=20
> I'm open to changing this as the series receives more review and we get c=
loser
> to merging.
>=20
> Matt
>=20
> > Thanks,
> > Thomas
> >
> >
> >
> > > =A0	int force_vram_bar_size;
> > > =A0	int guc_log_level;
> > > =A0	char *guc_firmware_path;
