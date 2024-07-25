Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 012D8C3DA5D
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jul 2024 05:23:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC5C610E44B;
	Thu, 25 Jul 2024 05:23:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DO375YOP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31C0710E44B
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Jul 2024 05:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721884999; x=1753420999;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=spUNzNLUqs4kk4rHHNlA5jANl9+pFR2mJE6AoKg5E98=;
 b=DO375YOPbkSySELrdAMpiuc/mAslByBeNMVw9/f3JNTtDXA5p28Wgz72
 6dRnnuUMFU1JUKUg/FzhDND4Zb+orzTSlonLab+9etBKlYu1nSlFfVh43
 M2MxbIGswvvNrLtXij/uBbWXx7KMc6Y0PoRlkhXiRV4vYjekV/OfVSFvY
 8qjOToYiV3biI5Pz1BT+MYpPpX4MJ3fabr2Q936qGKIdOghILdNValoBx
 if6z53ZT338VInWXpRefnCxBfp6g0a/U99IlPIJtZmolBNea8o8i9pjoc
 CpyJMWFpvZ3QPn140jnLBGDMIPlPW4UkwHvaKDaBvJlW/W6CFfiHW91Tj w==;
X-CSE-ConnectionGUID: 4rzeljncQUaH+WKFmGNPoA==
X-CSE-MsgGUID: EQsHz+inQSSeLUrdqawp6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11143"; a="30989090"
X-IronPort-AV: E=Sophos;i="6.09,235,1716274800"; d="scan'208";a="30989090"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2024 22:23:18 -0700
X-CSE-ConnectionGUID: AmKSTpYHTQO2pKLdS4UEag==
X-CSE-MsgGUID: CPWli4v1QeeLnu800C9mqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,235,1716274800"; d="scan'208";a="56951982"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Jul 2024 22:23:17 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 24 Jul 2024 22:23:17 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 24 Jul 2024 22:23:16 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 24 Jul 2024 22:23:16 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.47) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 24 Jul 2024 22:23:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VGVo4AKP8FDgFgRoiHPgXgDeIaf6aB9kgKX0BqY+K7d3usPbrVjQM5TMSCEMlR1q3XP2+31ZhtpkwwuKFmkCO2l+Olpa890c54ZTB2NrMe0+n6wYVsjbrovge4/6VRrKUfsWDJhM1C3m+fh7+pW61oKhEfLo+wZcIc4qS/+t47c+YaAivqEx+NE1YDrXfmOSz4HHFPXjmBgY9bqVUPvYQ/bhKiX5lV1124oMfgIDqf/UJrR1tGeegDT/7aiN4N66KLMPwON5/nRqyOxVEVVjk+PngkX5KcnrRacC9qlblGkccioqPjsyk20RJJ3P2G1oPEKXtJjeAhlrLKGoFJAVxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f3Jn3znJWSAXPFOwl49FBLTzelTR6g4LkAJTwrSAquY=;
 b=OJidW3N5Z/YtHl1D2ulReeI/6VrL+a/doXI1B0VZr8eSQpF7PGlXeel3lHC8sljnwQypnT06r5ZfSc09ChRMPInE8Unvl9CS7+getS7Imq2m++ZlOjDVZkJXzvDjvJ+9WUHOLs72L4kL/F0vs8WgG4grVOgT4eeBEVcRbAItGRQ9AHQuVY9XbNvgzvR0oh+V18THuWNwt093q460fJZB0wACdYHIxMKHgy9aXSqdBM6KnvKJWwwPncR/OKaZzupgC3atZmrvCDKYewsOS5dzQNRcLCqnDpdXE8j6pqj6abZC0erC6uX2L7CoVRdSTqTK+IH7NeXJHrQikmNcMHI8bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by SN7PR11MB7667.namprd11.prod.outlook.com (2603:10b6:806:32a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.32; Thu, 25 Jul
 2024 05:23:13 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%4]) with mapi id 15.20.7784.017; Thu, 25 Jul 2024
 05:23:13 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dan.carpenter@linaro.org" <dan.carpenter@linaro.org>
Subject: RE: [PATCH v2] drm/xe: Fix possible UAF in guc_exec_queue_process_msg
Thread-Topic: [PATCH v2] drm/xe: Fix possible UAF in guc_exec_queue_process_msg
Thread-Index: AQHa3TUdpQIQuInySEqkSQazFSOogLIGBVXggAAA4ACAAOSjQA==
Date: Thu, 25 Jul 2024 05:23:13 +0000
Message-ID: <SJ1PR11MB620404DC41FD52C62C14FDCF81AB2@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20240723191903.1753729-1-matthew.brost@intel.com>
 <SJ1PR11MB620491E5A7575114CD082E2281AA2@SJ1PR11MB6204.namprd11.prod.outlook.com>
 <ZqEhRPvmgg2VgEaB@DUT025-TGLU.fm.intel.com>
In-Reply-To: <ZqEhRPvmgg2VgEaB@DUT025-TGLU.fm.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|SN7PR11MB7667:EE_
x-ms-office365-filtering-correlation-id: 46ab46c2-3d68-41e4-b440-08dcac69e168
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?U9edcd0vn4mj+1xQ2LO+dbsiW9u+JYkwDQBUDavivlCJCnf5mkKkaigksJmU?=
 =?us-ascii?Q?Ltecn67INWVrtMV5ssxHVkJLVBfftsiZMHN+qogI+weTa+I0/084AdtPo43C?=
 =?us-ascii?Q?xKNTLEI5P5xqeKMnP0bzid3kRuG4AkNgyCZpZn+hwDCtZGfj8YvrseSPuQ1K?=
 =?us-ascii?Q?nqcYaZmYVCcqWb9olenhyniurbRrXPeBe12leZc7/Wdo/HG5UxUz123Q18xE?=
 =?us-ascii?Q?vvWY6h3Jdj5rEslG4rpUcDfS/cpcdHO8QDE0daGOTRYcnI5ep7JreTgZOnit?=
 =?us-ascii?Q?K2ctd50W9mKIDJ6YwaIifof5EISd23hj8fwMdmwuF8EoLCE+UEydpAnI9Ppp?=
 =?us-ascii?Q?MVRKqs89+9vWkPDXUbrOwML5MUB4FeYQT/3fb1zwfqsXcDMHZR/dtVVSPqWU?=
 =?us-ascii?Q?hqOrTZeXiBNAKWsEpTwk/ozm4l6jR2EhaBz+WPuIbCrpcnOwj9hR7xaSZQk5?=
 =?us-ascii?Q?/GJ7mRe/NhgcVIOU5tQhOUpId+e2f7YAwvDSrKilyCGKDyWqEHSZ+Hi+hoKz?=
 =?us-ascii?Q?HpyN67RMH8yGgjcLGTGWPhinYBZzlL/iJCps0LiVmhP9PBTMsUK/q8NGoL86?=
 =?us-ascii?Q?cYfQvVpmJjjs64AHOxFy2zBK8KbC5xR9FIC8nF9Pp+2OC1L+7DPRYK71eppn?=
 =?us-ascii?Q?EMTNBvtoj8H7D1LOAzQEjE27xfc5YoMjDX0XjjYE4Ym8YQh/MufM9X9op10u?=
 =?us-ascii?Q?M8BhXZqESNBs/c+7Ib2blT0puiaiDRFThC+QFctIjXPjYBaTpNduXNOPafrU?=
 =?us-ascii?Q?EyQ3+Mcu9m4fkz+hb2+FQGe6xnAtDtk0bR4R6p67Om5ej3i6+fws8X8IdS+1?=
 =?us-ascii?Q?K3eI4e+A035fsl4trRFOpjH6u0X1m/olQ6bVz0pI/WWg9GSYPd4qe+/CTcpS?=
 =?us-ascii?Q?l/m5FXSupfYpQefeos2qS5BSGHX3zqXdHc5KVm3cq0NIPmyRSE5RIadddxjO?=
 =?us-ascii?Q?f71TLEjButpoe/UMSB/uIeMq3Yp8kO/CDYMnWDBop5QJaLZLdnu9KS//NDJf?=
 =?us-ascii?Q?SX5PPjm7JmbqvtZWflWX0OTexDLSxdeWvG9wyKIKAvK+l/46zQgBj/1MuHQW?=
 =?us-ascii?Q?FcYlfynMBU6pk4qMM7ZM/v2Qth6stECA1Xq1uu0TRjs60Jn9KZU8DL4RlW8O?=
 =?us-ascii?Q?FQHYuL/nseVXZy9pJBO2SzoRAbS8yi/WvMba5DpUN6HLKqluY2dJnnGHgjZ/?=
 =?us-ascii?Q?HSG8BlMxl2rtxp8Mt8m9D0m4eIv0pwj8Ko2OnuQwZCQV38C3VAHib+Dt6j4D?=
 =?us-ascii?Q?hNMq/dhE+9gad91YOPqv8LHl6J3zu3FJcMzK58+m/StClthG1pP9vUzhv2UD?=
 =?us-ascii?Q?XmU7MCkzslprHx77iyfNJTBcd4JRtlOt6cgKN65DnqQG4Sbl+QZWpW746RcV?=
 =?us-ascii?Q?edb90h8=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?umnUreifJzfm75QcV2CGxb+RMiUClEdXbdaX2E/+D+TAH28D4auLlDILrG7i?=
 =?us-ascii?Q?BRLU3kkAe4H3BpHYACqKhmK6fNRmK9BZLwXxEcFM+QF4qAyIQltW29cXjr6V?=
 =?us-ascii?Q?SV1yTw4++QGmE4CO/dl7ISZt9qG85QXNOAPMv08SC2ttTP7attO1ShR5RX6t?=
 =?us-ascii?Q?Yh5FJR6qOLKM/3J/ZgxNnThr/2zk5q5Kd2+f1OM+Trl4zCYJhG1Rt7iW9h9V?=
 =?us-ascii?Q?OO/rrpdznPvgrcPCIhYZgS4x1h+C5U9r2nqTiUmOXDAJdOb69QoIiLKV9uH/?=
 =?us-ascii?Q?YGSQdaGXNNRmzwxzkEODe9GwOsWl2tWHWUVk7XmTzZixuYCcodd1dEkMwQqO?=
 =?us-ascii?Q?Ff273ZgaH6fBIAcmNFHdv9Fv500nUfIgCXw50W8XmhUvePl3M6Q7TBDy4ZZ+?=
 =?us-ascii?Q?jb/QJK851pl1oAxEM8kROvk/QKsxtUGHoFFdlBCQmcX/FtGNDDJkkQwt6z4Y?=
 =?us-ascii?Q?eI5K/0K7o4u+79JVDMxt9txgIYRkRQkcidEWNcNg1Tk0VQWRzYUW5E2s7SZ1?=
 =?us-ascii?Q?Hrg50WK/lN5mnoFZ33qTyKsiuj2juf1XjwuRP6Jm/xOUNqTUDTOoc4Mya6zM?=
 =?us-ascii?Q?Vz4o0DfHErUpAk09VfHj2jgkJg57z2QVJzG9XewYO8h5msDzZfj0d0vTbTLi?=
 =?us-ascii?Q?KZv6ss+rU5IHkAoc+IeUZPiqgU5coiuDQ/cyfgY82UxzxD63ksX2pPV/on3d?=
 =?us-ascii?Q?QeFwz0v3+uvkDZgWxbyBXpc/pVE7efmRsUp9cxK5oIKjxuI9zCN6Qr7vf6pB?=
 =?us-ascii?Q?Dh0Yf8Wu5PVvsptrPHMh7HS7bbCS4jg5E/7z0sF18af/xjt4aHCeH4ZDpqBM?=
 =?us-ascii?Q?Q9J2ouAvMelyZb85pZlH/pVmiwFhqcYf9PCnS8T1I+Lh1eNFTPykMpRyGN0f?=
 =?us-ascii?Q?RmCun08qP7QLwjVUJfScVGUiNENwJt5ALJC/03audD/7OI2iJDWth1nS0zcf?=
 =?us-ascii?Q?ibBNSj193JZB4ie2T4kVuSmsRSbQ2uj/s0/XFxfAKCk8Cs0feelYrnHPouTW?=
 =?us-ascii?Q?dXU5/yvhgeA+22KSDW+BtiTPGNebLqFeZ1SB+VDZUtkG5r0tFQeSNhFQtfuE?=
 =?us-ascii?Q?+xt/deRLiXdSKQt0Hy5wNPlGgHj3hSv1IHiJnZCsbk8PjE69UcDP7ArQTtzA?=
 =?us-ascii?Q?UGkZZq69nzUGbtlOjPL69oLu6fRL6gDav5tapJgcy8GBzeFME4rlnbRiCWj5?=
 =?us-ascii?Q?PgaB8zHeV8Ppfk6Nm2DPFsC09yFRilXJSyFZNEqXZflfoao7iSAhHSB3bYIA?=
 =?us-ascii?Q?j1/txpnoCi3VscgdLwwYqs9FLYpYoHtkrwWzfcPGZ1jCrYmbPCgqrUygQOZI?=
 =?us-ascii?Q?0xSQzF10SRItT3OpYrid+NVlPhXDgjsDlix29smRbBlAhU0shEcLkFa44Od1?=
 =?us-ascii?Q?4XW4FhaG2PFs56GTHhoxJC80lb3IY7ZukhlvmnBOJ36mzLTaAp5Zyh5wSGfi?=
 =?us-ascii?Q?mfSeumXbIR1JiKYwccxOfijVlijO/f90T0yWy3ptY4H9waTpKYleUoEnY6HZ?=
 =?us-ascii?Q?dzsZv4h7hckufYl2DWPSnFW1Z3w3fJZvuPUP3mtpGgxeR2unubo8GXYdlX3l?=
 =?us-ascii?Q?BDNngg7sArdepZPsdBZT2soADHzYnf5G+rxFi7CV?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46ab46c2-3d68-41e4-b440-08dcac69e168
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2024 05:23:13.2728 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8ZLzcZn5VNTdbVqEIyokcayeigMB1hOWxHJcbKgcuqA724LKBkg44+1S6XTx8BHoxT7UoZsE2fKYGzokBeTWQ17DTZhMom/Ur54USHooDZk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7667
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
> From: Brost, Matthew <matthew.brost@intel.com>
> Sent: Wednesday, July 24, 2024 9:14 PM
> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Cc: intel-xe@lists.freedesktop.org; dan.carpenter@linaro.org
> Subject: Re: [PATCH v2] drm/xe: Fix possible UAF in
> guc_exec_queue_process_msg
>=20
> On Wed, Jul 24, 2024 at 09:42:11AM -0600, Upadhyay, Tejas wrote:
> >
> >
> > > -----Original Message-----
> > > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
> > > Matthew Brost
> > > Sent: Wednesday, July 24, 2024 12:49 AM
> > > To: intel-xe@lists.freedesktop.org
> > > Cc: dan.carpenter@linaro.org
> > > Subject: [PATCH v2] drm/xe: Fix possible UAF in
> > > guc_exec_queue_process_msg
> > >
> > > Store xe_device ahead of processing message as message can be free'd
> > > in some cases.
> > >
> > > v2:
> > >  - Including missing local changes
> > >
> > > Reported-by: kernel test robot <lkp@intel.com>
> > > Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > > Closes:
> > > https://lore.kernel.org/r/202407231445.rpisd1vA-lkp@intel.com/
> > > Fixes: d930c19fdff3 ("drm/xe: Build PM into GuC CT layer")
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_guc_submit.c | 4 +++-
> > >  1 file changed, 3 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c
> > > b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > index da2ead86b9ae..b8f938539a90 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > @@ -1395,6 +1395,8 @@ static void
> > > __guc_exec_queue_process_msg_resume(struct xe_sched_msg *msg)
> > >
> > >  static void guc_exec_queue_process_msg(struct xe_sched_msg *msg)  {
> > > +	struct xe_device *xe =3D
> > > +guc_to_xe(exec_queue_to_guc(msg->private_data));
> >
> > If msg freed at this point, don't you need to protect against NULL, jus=
t in
> case?
> >
>=20
> The msg is valid here, it can be freed in the below swicth statement henc=
e the
> bug in referencing it after the switch statement.

Ok, LGTM,
Acked-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

Tejas
>=20
> Matt
>=20
> > Thanks,
> > Tejas
> > > +
> > >  	trace_xe_sched_msg_recv(msg);
> > >
> > >  	switch (msg->opcode) {
> > > @@ -1414,7 +1416,7 @@ static void guc_exec_queue_process_msg(struct
> > > xe_sched_msg *msg)
> > >  		XE_WARN_ON("Unknown message type");
> > >  	}
> > >
> > > -	xe_pm_runtime_put(guc_to_xe(exec_queue_to_guc(msg-
> > > >private_data)));
> > > +	xe_pm_runtime_put(xe);
> > >  }
> > >
> > >  static const struct drm_sched_backend_ops drm_sched_ops =3D {
> > > --
> > > 2.34.1
> >
