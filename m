Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 116ECD46C0F
	for <intel-xe@archiver.kernel.org>; Wed, 28 Jan 2026 22:50:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8A7810E165;
	Wed, 28 Jan 2026 22:50:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kWl1IM5O";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07AEF10E165
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Jan 2026 22:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769640635; x=1801176635;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=O1xFzSAry+f2KqOdRiBSTzogeErCyXTNh9MXS8c3PE0=;
 b=kWl1IM5OufoTCVkIIAbaLj4cXbqNZqTA2PDGQ3jES7aaRp0HvA4/+R9I
 x3dkYhCvY1P+HNTWiHjGXIghnvQmxlxp5CIxFVO6AOB+NI/fvaBWZkcfT
 Th2U++xHtJNxJe9IaqRXAenu2GhC3uag9guKiPlyR8UGMFGQ4djAbAPXC
 0sNzUVHa1kHNi83jEG2XQESemr7jDPejEaLixl2lLr/pUUnTyro91L58G
 NFPuhsJE3FkfV/UKOqUjtgQepNb7/wer4X1YJB9ABPFGE3mnJpK+S8+t0
 yG5C2JfsK3tiWKrjFabldzz7yTqdNqF8UqEodI1t9lyscxA6/0xU5M1XG g==;
X-CSE-ConnectionGUID: 5ZwKbxOvQVKVOGVk9waxMQ==
X-CSE-MsgGUID: IZbpgvDeS/S+Bkxx82cdOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="70769136"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="70769136"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 14:50:35 -0800
X-CSE-ConnectionGUID: ABVuWLfIQQSp/GLQL5T8xA==
X-CSE-MsgGUID: odaa3oL0QRy56c3zW9Eatg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="207637181"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 14:50:34 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 28 Jan 2026 14:50:33 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 28 Jan 2026 14:50:33 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.46) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 28 Jan 2026 14:50:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E078oB9BlZOWtNaG9bF5DQquwG1MsZ2Llyhx4DP2iy8mdsr4rMGadOmdqWu9PLiQpFFBEdlsNSUodEVPbkDDQ/GtRvjTcxEsMufIQG3+Io8p8GGooT6jGc5gLNFszQpkF2jZCIBecWAUKOe5p+PsDduNxV4HEKbg2AOGhW8ckByy/UaR8H4p6o1+hy0a/ewfEZRCSOyVadHDrCsUbOscQNBwUHuT794UhrmPTkQyCFEnTv4gTzwtbcmSIpVqjR3qgZZoaajlw/2rfmNwQ1usoZvGDNnYL9Dh41zjYQixdMkT3JEqyOtTPremAVWUNpP0a1rPCOaE0d+Y+TMqmYvglA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q3xIQXktFeBZcXRcbd3Bqwc5TYhvNObM5SfIn6wRcX4=;
 b=HYzU0p1hzfwtJtKlWp6Mw4AHxHTBxKD69HnnjIBdOqXf+qAg15L+FhI4OL6DCNyuBpVr+yYCSkT3VyeG2kb9+HUtvtQjE2eZha+fBtGiX4wPnV8vfe0lx6ZWdLbPRvcWooR/Liu1D9IXU4KthEl8zEyZ/DwYC4XKdLH3p+BrrwKJ7thSLSV/w1k9jWEkgZZRrATjtP/Bz0MU0CIwE8ZBi37t4ShvdzNeavC+EFkMMBcwV/BT5PBPKP/VPaMdgNanY7AQu07s23ZnJfX6/rRGh5WK91h0QDHvGwXlAPzePt58buM+8DNQJ9OFauGnBYsBiTaFlXrz8KCOtNr6wXAyig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by SA2PR11MB5193.namprd11.prod.outlook.com (2603:10b6:806:fa::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Wed, 28 Jan
 2026 22:50:31 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad%5]) with mapi id 15.20.9564.006; Wed, 28 Jan 2026
 22:50:31 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Vijay, Anoop C" <anoop.c.vijay@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Nerlige Ramappa, Umesh" <umesh.nerlige.ramappa@intel.com>, "Nilawar,
 Badal" <badal.nilawar@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>, "Tauro, Riana"
 <riana.tauro@intel.com>, "Gupta, Anshuman" <anshuman.gupta@intel.com>,
 "Roper, Matthew D" <matthew.d.roper@intel.com>, "Ruhl, Michael J"
 <michael.j.ruhl@intel.com>, "Luse, Paul E" <paul.e.luse@intel.com>, "V,
 Mohamed Mansoor" <mohamed.mansoor.v@intel.com>, "Nasim, Kam"
 <kam.nasim@intel.com>, "Vijay, Anoop C" <anoop.c.vijay@intel.com>
Subject: RE: [PATCH v6 5/6] drm/xe/sysctrl: Integrate System Controller into
 device
Thread-Topic: [PATCH v6 5/6] drm/xe/sysctrl: Integrate System Controller into
 device
Thread-Index: AQHckC5HqfCnn9yCS0Km3JAJATH7ILVoL5aw
Date: Wed, 28 Jan 2026 22:50:31 +0000
Message-ID: <DM4PR11MB5456DA6877B3826FE7A5753FEA91A@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20260128081403.3138456-8-anoop.c.vijay@intel.com>
 <20260128081403.3138456-13-anoop.c.vijay@intel.com>
In-Reply-To: <20260128081403.3138456-13-anoop.c.vijay@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|SA2PR11MB5193:EE_
x-ms-office365-filtering-correlation-id: 57236c1f-c40a-47ce-8451-08de5ebfa3a6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?ulnkFaxyihbXEtWZuCNSRd0pWuvYRLf8o+GWqEk3w47rXYMVG0nVSS57PAKK?=
 =?us-ascii?Q?3Se/MltFYJrecxp2f2bS9stvW9GhtzCHtEt9yK202obvtfywb5rhK49aAB3i?=
 =?us-ascii?Q?HCkve0K6QJoJmBx78hYf0OUvbkoZz7r/SB2AtUSGN0EpCkwl9w2y3OhNB7RA?=
 =?us-ascii?Q?mfYDkRJ6Cj2Mf6a5OEOvBiCOCixUCSHYBn0cLSyjgOjWUwV/UbzTy8+I4DtY?=
 =?us-ascii?Q?1/m0RHo2albRCS77Vz/XIThz50qSJmTP3IQhPsK+B/yqgKKUaOZE9ZO3nlgI?=
 =?us-ascii?Q?N4fJafTUM37jjUGr6uGtU6qaStuA+MJQwdlCvRbn+ZJLAhXbwGl9L0pAzH4n?=
 =?us-ascii?Q?OnRLoSOvYgWkoAdXgd+6Y43UuxOfO/iflewn7Ga7uG9qdbv5Ruy6yROlPMp8?=
 =?us-ascii?Q?orIxuuKajEKzTon1EPsf/8oR6DYfKB6peyKa7or6Ou0Wtk1chQ0UJ9H9t0dZ?=
 =?us-ascii?Q?Rje1EFCXqAjgbtHSBqBt//VxnIYtkK5HaKdTrflhp0uhXYaL4EBzymswgGa3?=
 =?us-ascii?Q?O4154pvxkIoE85788zmIda14EueJ9+DOCdGMj4mcSq3X5DudqV6IgtLnprcQ?=
 =?us-ascii?Q?dvBaDiTA5F2N1SF8sClu3ByachSMjxAchpEjiLfdsHj3H5ooAlcYwV+FObSV?=
 =?us-ascii?Q?erbMh4LH9MtYh/I2b/a9/DedKZJwBnQ2cxIvlcVzfEij5nob9lz6G8gu+kK2?=
 =?us-ascii?Q?2FEKncu3ZTSOhqdOUVlX4E1n63cqYeE+kp7rbBfAyRu8c18wRDdfgqbGIx3g?=
 =?us-ascii?Q?+CTbUyJLiMp4Mrvo9ic9wclbbSDtUVKow2JEYqzkEk4NmV0NGuoGpQKfj3Ge?=
 =?us-ascii?Q?LlI5/sbFzaxiR+eSwW5AuTILnT9aTvmO5jj/gZjkKCPppdd/qZjCD8Jsgpo8?=
 =?us-ascii?Q?TN+gNc8+WUKSmM0Ntv6/Xl7g3fzn9OgGNU4FI9ce7H5szJnctsejx8FUXaFw?=
 =?us-ascii?Q?TgeGVMvmnSUsRePdNOMD2VAF42vtRjdMC7X5VmPE0hXAnlIxanmEe9lMDax1?=
 =?us-ascii?Q?l5UJW2LrR34E7gCx90p4dBgwKWzxuuXovESx7Knq1U02lIvp1bO4XBEilkNt?=
 =?us-ascii?Q?0fBlbVgoqzVL3JR62231fTZDn0DnaMiEXN4hwrbhMj2pGMN0gxmOF7Q36BCV?=
 =?us-ascii?Q?l9zqFFZ6pCauKFynBcd6ZKw+TgkKLgUnzbody/xT30k4LJX3EiCY6TbANVTW?=
 =?us-ascii?Q?TCM+Dw912Y0+tHMkcI/pjkCy+3VIhKW9oZfRYqNtK6JP0ZG6BrT1XPWkke7C?=
 =?us-ascii?Q?YP721GWInkh8Z1Upumfl4IQt6Wto6YP3HGFu4cwNnwPeELSEpIt0exz16MCL?=
 =?us-ascii?Q?e6H/Ua8WAVEwLRblI879jHsDwefUIqoC4gHdt2zCm77zfU4W4XbzfkCHaoqo?=
 =?us-ascii?Q?bU9sgSB+uk6f8WAMZzULwEXvkv9EI9qVCHO2YkM/Y3zKwd2euD+5gdt6wJQX?=
 =?us-ascii?Q?pw7ubG795EXPY0kJmGNcGnSQyWhEJ1kpB1z6WlNLpNM7k/lus9yCC2l+/ZWI?=
 =?us-ascii?Q?W3GYdwvl33wfI/U6t8p/oWzCvvNi/g2Mg+H15ltl9hLyxHd/CyMCTrV7j2a9?=
 =?us-ascii?Q?QQhHktsE4PiaeXhy681YolQhQjnAWQKnc4ZaKEoMB3mLZpRMddQQCj3RiV+1?=
 =?us-ascii?Q?MK4a8JY2R/7ss+FA8dcDm4c=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Jh+8FVorEIOgY3cl9IVVIkj1/waEm4k2nwl25yln1yJEUNBaLoFmMXsDikL5?=
 =?us-ascii?Q?kK00Xht56XenUWMq13udY6Cpj8ASCsFY9EkVzXR56uAb41FIqlkCA//S8CtT?=
 =?us-ascii?Q?rV7rmN9GiuoZQqTSIyLIz12XpWpwtKNWcO1Um8GToNzZy7xTSRwXWNKPLI9u?=
 =?us-ascii?Q?x5K+I1cJ9fjq881C/GhVMj8RH8mJE+bkUjRr9HfK+eaR3Y9UIMyFT1tUKOFw?=
 =?us-ascii?Q?ydX56r2x2bSb3EtwIysYsfhaBWEEJAGAzVRwtXdQPCEMIknOvy03+VsrwNwO?=
 =?us-ascii?Q?jkFMYTTuCRzqdXkdi0yAQICpK3MBQzGGMfASR2/ADfNhQmPLy5XgCCwEhSTv?=
 =?us-ascii?Q?M4TIvkVJnHuqV1Kx/dbj/+mSL0KjgSsteiXzqZ6lhmMkyhgk2StoSfudA14g?=
 =?us-ascii?Q?4rqc+rYPUW80o5/CmuA8lMbnKv6dxXnK0U15LdZPtsoBFleVjoLQvHNhf4Y2?=
 =?us-ascii?Q?Y3ok0/pfstQ4dDhl4vWOY80DbR8Ec7kFguwRToQT7Bge4NmzNHrLf5anfxYo?=
 =?us-ascii?Q?WjIsJRcoVwM6oigBR5iSLXhTw6KAZm6Ium2NcRIcTHdBuV4chm99Uw3xb/gX?=
 =?us-ascii?Q?tYGvKXxFQ358WCtpbZOvvzMaSOdIvUHb1Zt7k5VZtyNqFDsYLdbUQfj3vuNm?=
 =?us-ascii?Q?grbl3nhR9M1tMTnV5TQrw5tKxXnf0+6HM2/tg72dT5f89k16rG5owlSEx86K?=
 =?us-ascii?Q?B9QD5qWhrKcYBRBQd7mrcq0rork8bMmFbdAqILI2tqnImqSRUdn6iEz0bvV9?=
 =?us-ascii?Q?XtRsgzO2tlpKMKgWIZ7Lyz/DECx7jDaV3ry/yZNYxYV5sKpTG778MTjq0NyB?=
 =?us-ascii?Q?tiiuyRXp0mJ3PM6gAUDE0islW40Hk1wzEYLDAZsuhE6bLEIk7CyebkTq2+yy?=
 =?us-ascii?Q?taj1YMivESttvOVDqCxHc6G3jsViIfvqqruJx8YrqtVgSAAU/eS8V/yX4mQn?=
 =?us-ascii?Q?Og0VLTIaLmqS/uh/EWyvxyuUcNnjmK6nICaQ528/UdD4a2TIpdfD+TZxQ3b2?=
 =?us-ascii?Q?coVOO548a1HLMsqitFd37fdwuhjFmaNXcDxmJDd6OCW+/ZKdDt9OcfQxDZkZ?=
 =?us-ascii?Q?tqRSnG+9h+OnabfLwnZsGUH0h8I7znO0GHnDHSM1i9lGyigrDRPlJ5F2rDra?=
 =?us-ascii?Q?KBye8u+Q44RZkNQEJls+mbEj0c5WfqzfGkikg2pZmnT/oRCEglY0rKm1Gjcq?=
 =?us-ascii?Q?tx6JRU/1e3EimgcJQIMsXfF8thFvidBLp5ZKrrGDA4qu+xKYjTwGvgSpMdqr?=
 =?us-ascii?Q?VZnVttaizBWuWOmvU1nxU+ujOmp7bhA4eROGzx0Edl4e9jD7wgAIWjYsA9bL?=
 =?us-ascii?Q?POtgF18lLzeGXgWmIKy3Q1YYVzvXmPQMnw2TmlSHlhWLM84BX69rcWwbwVxv?=
 =?us-ascii?Q?aClcaVSBlbYTFN1BBAO/YjqfvYRkDC50kcSlttvXs9ioAgJQnMPaD/ycxrRe?=
 =?us-ascii?Q?1YafelvI9bN9IALTDltdHuo/3KhYgggLmjzy+nfUSFrTF5ElKBgWSL7GTdWa?=
 =?us-ascii?Q?IW2exPt5cEbEg4XpvZkiHytxivayeYbV8cCASh8+GVzu8hOsmJ1XvUh5yWC7?=
 =?us-ascii?Q?SHun+gURdAOdBdvqsfFJn390nZYqSGne3kdnWmCZXkEjIandQHtam5WBFQuM?=
 =?us-ascii?Q?Ceg1ChiXlXFuQrP+pWzNW3gqCFF3E8kuUtC9jlz9XDVMh4t3SopFWO9ldeeb?=
 =?us-ascii?Q?T0hK/n2Tgud0Rze7lHD4IMEQLVGct8tVR+/xzcTJr8IHLcukBLdC579HTBCh?=
 =?us-ascii?Q?bR2iVkg31A=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57236c1f-c40a-47ce-8451-08de5ebfa3a6
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2026 22:50:31.0378 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ONcmn1VH6bX6hKfK3GpkHvmx01cN3CIewpxUOWp/9V5HxCShgIQ9ro9mVOB3LhsEQNLt0M4oQc7B8D8m+YARYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5193
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

On Wed, Jan 28, 2026 12:14 AM Anoop Vijay wrote:
> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of,
>=20
> Sent: Wednesday, January 28, 2026 12:14 AM
> To: intel-xe@lists.freedesktop.org
> Cc: Nerlige Ramappa, Umesh <umesh.nerlige.ramappa@intel.com>; Nilawar,
> Badal <badal.nilawar@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>;
> Iddamsetty, Aravind <aravind.iddamsetty@intel.com>; Tauro, Riana
> <riana.tauro@intel.com>; Gupta, Anshuman <anshuman.gupta@intel.com>;
> Roper, Matthew D <matthew.d.roper@intel.com>; Ruhl, Michael J
> <michael.j.ruhl@intel.com>; Luse, Paul E <paul.e.luse@intel.com>; V,
> Mohamed Mansoor <mohamed.mansoor.v@intel.com>; Nasim, Kam
> <kam.nasim@intel.com>; Vijay, Anoop C <anoop.c.vijay@intel.com>
> Subject: [PATCH v6 5/6] drm/xe/sysctrl: Integrate System Controller into
> device
>=20
> From: Anoop Vijay <anoop.c.vijay@intel.com>
>=20
> Add System Controller to the xe_device structure and wire up initializati=
on
> during device probe.
>=20
> Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
>=20
> Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Reviewed-by: Shuicheng Lin <shuicheng.lin@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_device.c       | 5 +++++
>  drivers/gpu/drm/xe/xe_device_types.h | 6 ++++++
>  2 files changed, 11 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_devic=
e.c
> index f4741cbe4c45..e11339e10433 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -66,6 +66,7 @@
>  #include "xe_survivability_mode.h"
>  #include "xe_sriov.h"
>  #include "xe_svm.h"
> +#include "xe_sysctrl.h"
>  #include "xe_tile.h"
>  #include "xe_ttm_stolen_mgr.h"
>  #include "xe_ttm_sys_mgr.h"
> @@ -1027,6 +1028,10 @@ int xe_device_probe(struct xe_device *xe)
>  	if (err)
>  		goto err_unregister_display;
>=20
> +	err =3D xe_sysctrl_init(xe);
> +	if (err)
> +		goto err_unregister_display;
> +
>  	err =3D xe_device_sysfs_init(xe);
>  	if (err)
>  		goto err_unregister_display;
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h
> b/drivers/gpu/drm/xe/xe_device_types.h
> index a85be9ba175e..6295b2c35d4a 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -29,6 +29,7 @@
>  #include "xe_sriov_vf_ccs_types.h"
>  #include "xe_step_types.h"
>  #include "xe_survivability_mode_types.h"
> +#include "xe_sysctrl_types.h"
>  #include "xe_tile_sriov_vf_types.h"
>  #include "xe_validation.h"
>=20
> @@ -340,6 +341,8 @@ struct xe_device {
>  		u8 has_soc_remapper_telem:1;
>  		/** @info.has_sriov: Supports SR-IOV */
>  		u8 has_sriov:1;
> +		/** @info.has_sysctrl: Supports System Controller */
> +		u8 has_sysctrl:1;
>  		/** @info.has_usm: Device has unified shared memory
> support */
>  		u8 has_usm:1;
>  		/** @info.has_64bit_timestamp: Device supports 64-bit
> timestamps */ @@ -606,6 +609,9 @@ struct xe_device {
>  	/** @heci_gsc: graphics security controller */
>  	struct xe_heci_gsc heci_gsc;
>=20
> +	/** @sc: System Controller */
> +	struct xe_sysctrl sc;
> +
>  	/** @nvm: discrete graphics non-volatile memory */
>  	struct intel_dg_nvm_dev *nvm;
>=20
> --
> 2.43.0

