Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C80ED0EE1C
	for <intel-xe@archiver.kernel.org>; Tue, 25 Nov 2025 19:46:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE7EB10E450;
	Tue, 25 Nov 2025 19:46:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e8VSOIyb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A16310E450
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Nov 2025 19:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764099985; x=1795635985;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Oa5XGETtnpLZTsnaxHtg7kfsuSt0bYNpiifBQTDOQjQ=;
 b=e8VSOIybekPmgwNu9wxAkub48FWZpbUajFCS60SknoVxb7SeKemqX30o
 DuWmKrcGg2Ifdzl91GT63gS7LxyhbNhiFwjEGzuUYwpVSBpMWPsc7f7En
 3i2hWstDvzKhh5oecqvViJHHQpOGPJ3tf+qRF5I4PEhVloWFUlCT/ve2r
 So9OMH4k2Rataf53bwHSs82oVZFGrhSuFVAtOgv7fo93cQXU/W3R02tiz
 t/AP51iwYDYO5Rz46h92QpYAvhNZqx00oLJ1oFpWRPr//bVRHMVIEaav4
 QHQM0bYShXoqt6VqnGDPfNQc2ScsP1L2+nJz26qiCVnx8Ce4qjyyUocgQ A==;
X-CSE-ConnectionGUID: QmPFzOnORbu891UBrRzmmQ==
X-CSE-MsgGUID: 5J8Qko3cRJS0uortiZ4S1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="65129173"
X-IronPort-AV: E=Sophos;i="6.20,226,1758610800"; d="scan'208";a="65129173"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 11:46:24 -0800
X-CSE-ConnectionGUID: +6TORF9RTsSjuULkE59qeA==
X-CSE-MsgGUID: l6PwUnBWTauuiGHacsY8Nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,226,1758610800"; d="scan'208";a="197048411"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 11:46:24 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 25 Nov 2025 11:46:23 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 25 Nov 2025 11:46:23 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.2) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 25 Nov 2025 11:46:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UJx/Khy6fH7ZF8tMD7sWO9vjdX2/v7tDduKRSCLuQKK4zSRHOJum95nRlb/ZbNqqzRH4GrOUU16JWYkpeLKp+UXhLOLHzJw4xgdZHZ8CYhWGZxxRvNbkyCjXsLya7JIYrCCh+vZa19Nw/11iBUtcvDGMz0TwXEeXXkZHtnjLSV9LGTteSpsH/HVL9RLtYGDtTC7947mxz2qVfDhkyHo97//nbxg0kmBBxr/mkzbaipv4esM/QBPoa8s1ufeEMCTBxGyWu/DVnyRJKVtOUNZ8o67XINT731RCuQHYH+tuXWS6D9rGI9NN2VZALaERu7qvQRVRPXAEYSPAfodRbaWGTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D9xDLcqhZ/aUpvibMP5qgrR3UYrD/G2m9hsHg8/O5hU=;
 b=BoiOnbBOp/dWvImLLhRjPmqV58qGndb3qAqqTRGSRx11UZ/cB5fs4gyoXZpDg2IUvw5KD2VTGukeT+Aqsu/P6ramMqbcGSKH+epcC4dXD0lTzvRfG41XjYGdvT8dQocatEdtXBFAJU7jOufCiMeww6PBMILrMW/VddjsEis4DlK1RFtJ8NnOw7CrAFLmOq2Van+PxCRjCxlWV96LY83xsVsTEXEoU838k5qFMdbc7rmsthSPb3/I3xYvOT5nY/NQ0SWFI59cH9FPLkeDeavoxfEkbEilQmwDUEOfqwbMiN5MqGe73snAR1ACEdioo4rpsu0cLd1z324lPoq1ryx3CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB8839.namprd11.prod.outlook.com (2603:10b6:806:467::17)
 by DS4PPF8B2A2E830.namprd11.prod.outlook.com (2603:10b6:f:fc02::39)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.11; Tue, 25 Nov
 2025 19:46:20 +0000
Received: from SA1PR11MB8839.namprd11.prod.outlook.com
 ([fe80::ce6c:3c7f:92ef:1394]) by SA1PR11MB8839.namprd11.prod.outlook.com
 ([fe80::ce6c:3c7f:92ef:1394%5]) with mapi id 15.20.9343.016; Tue, 25 Nov 2025
 19:46:20 +0000
From: "Nguyen, Brian3" <brian3.nguyen@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Upadhyay, Tejas" <tejas.upadhyay@intel.com>, "Lin, Shuicheng"
 <shuicheng.lin@intel.com>, "Summers, Stuart" <stuart.summers@intel.com>
Subject: RE: [PATCH 06/11] drm/xe: Create page reclaim list on unbind
Thread-Topic: [PATCH 06/11] drm/xe: Create page reclaim list on unbind
Thread-Index: AQHcWGqafCc1cGxJfkCPRCmuyqMP+bT/GKGAgAM0OFCAAXaKgIAAAYtAgAAHuACAAAB74A==
Date: Tue, 25 Nov 2025 19:46:20 +0000
Message-ID: <SA1PR11MB88399ACA52B1883BE83A6D40AAD1A@SA1PR11MB8839.namprd11.prod.outlook.com>
References: <20251118090552.246243-1-brian3.nguyen@intel.com>
 <20251118090552.246243-7-brian3.nguyen@intel.com>
 <aSIMb4EREPix3SDK@lstrano-desk.jf.intel.com>
 <SA1PR11MB883987BC9C5A7FCAE239C273AAD1A@SA1PR11MB8839.namprd11.prod.outlook.com>
 <aSX2qxiSvdNrXvbX@lstrano-desk.jf.intel.com>
 <SA1PR11MB88393D5D019B5943600FCBA4AAD1A@SA1PR11MB8839.namprd11.prod.outlook.com>
 <aSX+cMn4sFswa2HE@lstrano-desk.jf.intel.com>
In-Reply-To: <aSX+cMn4sFswa2HE@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB8839:EE_|DS4PPF8B2A2E830:EE_
x-ms-office365-filtering-correlation-id: a02f5d5b-2c8f-4a1b-1cb3-08de2c5b4ebc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?sT9ldVJ7EUZ0zej/bqLwacL6T8A1owMU9iB/QPlIq4AOVFi1X0xei+exX9Xx?=
 =?us-ascii?Q?3xrxKjhCG86uYxy8z4Ik3mx03eW57Pz9vikgiI5T8/H4+OzYqEydLGImgVLP?=
 =?us-ascii?Q?z6NOL/2aaKrzv+s1Y7lqMly313lzABiZwFPEDoT8mtkKIQmhpc204VVfW+fP?=
 =?us-ascii?Q?7REMmWTS8BbIX1NFba5zrACGm997YbHYE6lfWy7Jepyqo9cVzpMQePfL5wxH?=
 =?us-ascii?Q?OLLWb+46UP2k1NKCZy9G8ES20LCCTGUe8ouBWSdz53tGvl54StBdwfOt7p4/?=
 =?us-ascii?Q?8TnJS+2tWiDFeGtG2i4AZjvriZ8jhYUtwFU1y2gWk9JTFDNi2ioVtq7Uu69s?=
 =?us-ascii?Q?ZYtCMOrbzGUR244xDqSHk9lj0SiOSalROX0Sf+dI32vfqX4soEomqCzpV9Zg?=
 =?us-ascii?Q?VPAtKoS5o2ocw7451O9RexBkXtYdSDYqbss51RG82F3WXFi61EfnI/wVhU2c?=
 =?us-ascii?Q?96X0hCXYh3wOel4gbia06OmDJhSE8jA8z0NV3R6/wZoU0B444Y8y7R3GjlVD?=
 =?us-ascii?Q?7QpCigPmtVsghlH5lEcivMAU4fn0MAnWM5Fi2naaCOfNfX+ZLt67QMTqx3bv?=
 =?us-ascii?Q?Q3s9cgp8HhuZXNEqjGWD2A21ZmeJnDW+6Wh3Fpwl2yLQndkNHlfp4lCfDzA2?=
 =?us-ascii?Q?z6FPQ/BH6b79nOZ5eW2tUPd6B1iQGLf3X2efKg6nsrgLag7E5dMJZdtQq7XY?=
 =?us-ascii?Q?KIalouFzQ3DofdKm783iRaSZY2DwUlZYcAwqKELijgzP7kKZHEs4ZrX/DneN?=
 =?us-ascii?Q?jdHQT9wPynV6QNU7MfxWU43+UZ5vOs/BNJvNXWXN8w3TPyDmTihCSajoDtgG?=
 =?us-ascii?Q?9423H7dRCS0aL0sADg+uxUzBiyIZZFe3GbX2krFwvZWLOkGJcT8UEK5PdfZ4?=
 =?us-ascii?Q?lnYEVtleMvKP3f/+MrXQoNuFqnnfyGw7/f7LEqZRu3JnyPcQBRASYSffL8CR?=
 =?us-ascii?Q?WatRFHP5UyzY0Et8bU1Xz2jnzQ+R/xnDyrBi9I0HibVd5qJ6KdJ2JOFh+eU2?=
 =?us-ascii?Q?P5CX1kVXtdRGTR9azOL6zSxiEL8KyXmBi/ttdZx6qnE3dbw2zOS4BjFKOlIZ?=
 =?us-ascii?Q?Ubdx4SwhFH80oKtkwvC4sCA7RVCFxZkZCKl06oncr2TmnHYQh7NNQYDLSSeW?=
 =?us-ascii?Q?ebR7qBdlChVHfOQX+9OrgkCOOwL9Zvbk/cALJLzGOED8YkcwOqCbGPTWuw7Z?=
 =?us-ascii?Q?RJCYopVujNXJavaTdacu9tU17Ym8GXKfgpq32vVQTbEqkvJCojNld41kKkCN?=
 =?us-ascii?Q?4KQ0JsZyIQwnuTJjyrKop2gHwFf5OzSm/Ehy1LGt3i7ujoD+KFlY/0KaE2LU?=
 =?us-ascii?Q?WhK20OeleF71OR7HVdhrvdMknBClBpPsa/MlPRvf2BjaxExYUyPWzyq62hu/?=
 =?us-ascii?Q?VsnN6nq9rJhcOz6cq8DVdpCdeY0fMCCVjkyhLuJc4omieNm76/UKoeGFe7sN?=
 =?us-ascii?Q?9Ku0Vf+suIWH7Oed1itJeYGbEm2Q7ns7a/rGBKsgL1u6HK89MAS+reGQ9Pmx?=
 =?us-ascii?Q?OBJBRc8UhR3sY0JMSJr3S9HDObwzgDaEpiC8?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB8839.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?YBWlmNPxUwUMlF4247YsowW9YUXb0ebnjIQhhwsnkCZH4zpq3JV038ffZUaX?=
 =?us-ascii?Q?UQ+upLZqSN+eb0ukRibXOZ6tlNa6iKOAiwSs76mIFZSdQJNvGHzUY0gDWMKE?=
 =?us-ascii?Q?fgYR5LDmsYdU/CQeASwcs26mU4qPbnZWfjeMFrgSMulK23v/GASxoh8mSIwf?=
 =?us-ascii?Q?I3XzIjpGfneHyTUeUVu6676DUGlLTVsuwcI56sdU2Y1x2oMh6+L9BYeEp2AN?=
 =?us-ascii?Q?ZKFyc7u7OAFMs08C7Z7c73uKgSp0QQ0DUQCtXxlc2v8obgWLGsaSlOdQ2hv+?=
 =?us-ascii?Q?7MzCqX/fg0WWbWWefKrHPsbhcgMrCbzDuW4+z8WqBpQrKG4RwF/ytDIF9E8T?=
 =?us-ascii?Q?8I8+zVb648jckTkHWGW214OizhaHbMajFLbN/O+ZXpfVGE2KktjGtjYcx57z?=
 =?us-ascii?Q?3OFKO5IWLJL/CXvs63jIHHDJ6OeSZzd3BUG73+NQT6rEirlXAfsRjGpdpr2i?=
 =?us-ascii?Q?/QumCs8w2iEzuxtNpGThhw0TS68FFxzGBu3fyWmuXn7ZJekvKVuy54kUV1/v?=
 =?us-ascii?Q?cll0JVyRKH+PdrNgqK+LfbkdtMltd72Ev97WLhH3tlf4Qoho69Hsl3SyQJfG?=
 =?us-ascii?Q?cpCO0azPEnyLHRJTKuK6SfcTThqb2bT8KAFWnd6AEpwD2TpX2KaI3a2LOVZk?=
 =?us-ascii?Q?bDAh/NWadFOz/subg5eLt0V1lJ1MiSgNxx6n36noI6gpQ8l3cM1Z+lEDY7AR?=
 =?us-ascii?Q?0ULb1EVKrSSo91jR6mzHhoo856zZ9stQmrh8zBVQ9P4vLLxpAmGAwmjuoot7?=
 =?us-ascii?Q?v8FI6lwpE5AYkgc5v3IroXt/5Tk4kPlfjfb+/RRqhDhhKqDEwxvTjHPoUSFj?=
 =?us-ascii?Q?Rowhi6OT6ug1XmZf4JviGLF8P2S9uMDNF3Cf9BldxAxQa0/fY01BLoMsVp2n?=
 =?us-ascii?Q?Ek3QzCQQqKsv5L0OAa7yY8PHycO5Ew6JCecDxCObl3bq92gtpEGMihQrsYCE?=
 =?us-ascii?Q?6qW3jdiWfi6wa8mTpOjyK/8ZLiVss0OGMLCNf72blm1msF2KEGjuKlYByiWT?=
 =?us-ascii?Q?7FAE4DFRg7TMwcpIVD5KN8/RVuSDQP1XbDpIRxrVilvSaIfWCKiAdaKWxSla?=
 =?us-ascii?Q?6lHPtkdSCT6jIpK2V7Uu7V5Zjpdw5O9GTE0Q4za0hj2XstROnChiEuCLgSpo?=
 =?us-ascii?Q?MF17ZRKztWxCu+5d/Za9Ut8q1FAOy7Dm1yrguxEbPNhVajxQGYu6GDXQtEbG?=
 =?us-ascii?Q?IxDRGPT+SaloBZgCL6t5+0X+aCoF4NWCP9HvXOdHWGPjv5PENlytWGno+PqH?=
 =?us-ascii?Q?bAcEB6pv/PyosXMpz6fZOtgpbSGfpGCtw06vxyVvHM3qVwbJPOF61OTcWIUy?=
 =?us-ascii?Q?lzHviagc5fCoroxzYzfx3/DyWT/3NxnoAUt4AQ9R9/UrEpIG6755M4AUPHnX?=
 =?us-ascii?Q?iXKIzd92V5pTDIVGPX+v3nIh/3i4G239eExkAGX6GbdBd4F7SrGSML63cJ9E?=
 =?us-ascii?Q?sdZzrLTK+VZlUneq41cQUAGpkx/KHpQ8DLvO62rXFRrTeB4gsbj6jbs4EGYG?=
 =?us-ascii?Q?UgOn0lTF0YeqSHcJ4WoO6uMwj87eBYnK/QIW3YkMUgoSfxkLVIrRXz4SvewU?=
 =?us-ascii?Q?Hrfacwg84PROqa7YDO4f5r4QbTK/X+Il6OJwZjEg?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8839.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a02f5d5b-2c8f-4a1b-1cb3-08de2c5b4ebc
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2025 19:46:20.7276 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: z7hrSiUWHRh4KQnwHkmFHINb9/L2ZHvU4h9dQKKQWsjkHj5fpau4z7kJwfoayOrDZ7UAKMW2fz2j4s+zla52BQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF8B2A2E830
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

On Tuesday, November 25, 2025 11:07 AM, Matthew Brost wrote:
> On Tue, Nov 25, 2025 at 12:01:25PM -0700, Nguyen, Brian3 wrote:
> > On Tuesday, November 25, 2025 10:34 AM, Matthew Brost wrote:
> > > On Tue, Nov 25, 2025 at 04:18:19AM -0700, Nguyen, Brian3 wrote:
> > > > On Saturday, November 22, 2025 11:18 AM, Matthew Brost wrote:
> > > > > On Tue, Nov 18, 2025 at 05:05:47PM +0800, Brian Nguyen wrote:
> > > > > > Page reclaim list (PRL) is preparation work for the page reclai=
m feature.
> > > > > > The PRL is firstly owned by pt_update_ops and all other page
> > > > > > reclaim operations will point back to this PRL. PRL generates
> > > > > > its entries during the unbind page walker, updating the PRL.
> > > > > >
> > > > > > This PRL is restricted to a 4K page, so 512 page entries at mos=
t.
> > > > > >
> > > > > > Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
> > > > > > ---
> > > > > >  drivers/gpu/drm/xe/Makefile           |   1 +
> > > > > >  drivers/gpu/drm/xe/regs/xe_gtt_defs.h |   1 +
> > > > > >  drivers/gpu/drm/xe/xe_page_reclaim.c  |  52 ++++++++++++
> > > > > > drivers/gpu/drm/xe/xe_page_reclaim.h  |  49 ++++++++++++
> > > > > >  drivers/gpu/drm/xe/xe_pt.c            | 109 ++++++++++++++++++=
++++++++
> > > > > >  drivers/gpu/drm/xe/xe_pt_types.h      |   5 ++
> > > > > >  6 files changed, 217 insertions(+)  create mode 100644
> > > > > > drivers/gpu/drm/xe/xe_page_reclaim.c
> > > > > >  create mode 100644 drivers/gpu/drm/xe/xe_page_reclaim.h
> > > > > >
> > > > > > diff --git a/drivers/gpu/drm/xe/Makefile
> > > > > > b/drivers/gpu/drm/xe/Makefile index e4b273b025d2..048e6c93271c
> > > > > > 100644
> > > > > > --- a/drivers/gpu/drm/xe/Makefile
> > > > > > +++ b/drivers/gpu/drm/xe/Makefile
> > > > > > @@ -95,6 +95,7 @@ xe-y +=3D xe_bb.o \
> > > > > >  	xe_oa.o \
> > > > > >  	xe_observation.o \
> > > > > >  	xe_pagefault.o \
> > > > > > +	xe_page_reclaim.o \
> > > > > >  	xe_pat.o \
> > > > > >  	xe_pci.o \
> > > > > >  	xe_pcode.o \
> > > > > > diff --git a/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
> > > > > > b/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
> > > > > > index 4389e5a76f89..4d83461e538b 100644
> > > > > > --- a/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
> > > > > > +++ b/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
> > > > > > @@ -9,6 +9,7 @@
> > > > > >  #define XELPG_GGTT_PTE_PAT0	BIT_ULL(52)
> > > > > >  #define XELPG_GGTT_PTE_PAT1	BIT_ULL(53)
> > > > > >
> > > > > > +#define XE_PTE_ADDR_MASK	GENMASK_ULL(51, 12)
> > > > > >  #define GGTT_PTE_VFID		GENMASK_ULL(11, 2)
> > > > > >
> > > > > >  #define GUC_GGTT_TOP		0xFEE00000
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_page_reclaim.c
> > > > > > b/drivers/gpu/drm/xe/xe_page_reclaim.c
> > > > > > new file mode 100644
> > > > > > index 000000000000..a0d15efff58c
> > > > > > --- /dev/null
> > > > > > +++ b/drivers/gpu/drm/xe/xe_page_reclaim.c
> > > > > > @@ -0,0 +1,52 @@
> > > > > > +// SPDX-License-Identifier: MIT
> > > > > > +/*
> > > > > > + * Copyright (c) 2025 Intel Corporation  */
> > > > > > +
> > > > > > +#include <linux/bitfield.h>
> > > > > > +#include <linux/kref.h>
> > > > > > +#include <linux/mm.h>
> > > > > > +#include <linux/slab.h>
> > > > > > +
> > > > > > +#include "xe_page_reclaim.h"
> > > > > > +
> > > > > > +#include "regs/xe_gt_regs.h"
> > > > > > +#include "xe_assert.h"
> > > > > > +#include "xe_macros.h"
> > > > > > +
> > > > > > +/**
> > > > > > + * xe_page_reclaim_list_invalidate() - Mark a PRL as invalid
> > > > > > + * @prl: Page reclaim list to reset
> > > > > > + *
> > > > > > + * Clears the entries pointer and marks the list as invalid
> > > > > > +so
> > > > > > + * future use know PRL is unusable. It is expected that the
> > > > > > +entries
> > > > > > + * have already been released.
> > > > > > + */
> > > > > > +void xe_page_reclaim_list_invalidate(struct
> > > > > > +xe_page_reclaim_list
> > > > > > +*prl) {
> > > > > > +	prl->entries =3D NULL;
> > > > > > +	prl->num_entries =3D XE_PAGE_RECLAIM_INVALID_LIST; }
> > > > > > +
> > > > > > +/**
> > > > > > + * xe_page_reclaim_list_alloc_entries() - Allocate page
> > > > > > +reclaim list entries
> > > > > > + * @prl: Page reclaim list to allocate entries for
> > > > > > + *
> > > > > > + * Allocate one 4K page for the PRL entries, otherwise assign =
prl->entries to NULL.
> > > > > > + */
> > > > > > +int xe_page_reclaim_list_alloc_entries(struct
> > > > > > +xe_page_reclaim_list
> > > > > > +*prl) {
> > > > > > +	struct page *page;
> > > > > > +
> > > > > > +	XE_WARN_ON(prl->entries !=3D NULL);
> > > > > > +	if (prl->entries)
> > > > > > +		return 0;
> > > > > > +
> > > > > > +	page =3D alloc_page(GFP_KERNEL | __GFP_ZERO);
> > > > > > +	if (page) {
> > > > > > +		prl->entries =3D page_address(page);
> > > > > > +		prl->num_entries =3D 0;
> > > > > > +	}
> > > > > > +
> > > > > > +	return page ? 0 : -ENOMEM;
> > > > > > +}
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_page_reclaim.h
> > > > > > b/drivers/gpu/drm/xe/xe_page_reclaim.h
> > > > > > new file mode 100644
> > > > > > index 000000000000..d066d7d97f79
> > > > > > --- /dev/null
> > > > > > +++ b/drivers/gpu/drm/xe/xe_page_reclaim.h
> > > > > > @@ -0,0 +1,49 @@
> > > > > > +/* SPDX-License-Identifier: MIT */
> > > > > > +/*
> > > > > > + * Copyright (c) 2025 Intel Corporation  */
> > > > > > +
> > > > > > +#ifndef _XE_PAGE_RECLAIM_H_
> > > > > > +#define _XE_PAGE_RECLAIM_H_
> > > > > > +
> > > > > > +#include <linux/kref.h>
> > > > > > +#include <linux/mm.h>
> > > > > > +#include <linux/slab.h>
> > > > > > +#include <linux/types.h>
> > > > > > +#include <linux/workqueue.h>
> > > > > > +
> > > > > > +#define XE_PAGE_RECLAIM_MAX_ENTRIES	512
> > > > > > +#define XE_PAGE_RECLAIM_LIST_MAX_SIZE	SZ_4K
> > > > > > +
> > > > > > +struct xe_guc_page_reclaim_entry {
> > > > > > +	u32 valid:1;
> > > > > > +	u32 reclamation_size:6;
> > > > > > +	u32 reserved:5;
> > > > > > +	u32 address_lo:20;
> > > > > > +	u32 address_hi:20;
> > > > > > +	u32 reserved1:12;
> > > > >
> > > > > This is wire interface with the GuC. Bitfields can based on
> > > > > endianess of the CPU. I know this is a iGPU feature for now but
> > > > > it could possibly change in the future, with that, to future proo=
f can the layout of this be setup via defines / macros?
> > > > >
> > > >
> > > > Sure, I moved over to the typical FIELD_PREP/GENMASK macros used
> > > > elsewhere for the guc interfaces.
> > > >
> > > > > > +} __packed;
> > > > > > +
> > > > > > +struct xe_page_reclaim_list {
> > > > > > +	/** @entries: array of page reclaim entries, page allocated *=
/
> > > > > > +	struct xe_guc_page_reclaim_entry *entries;
> > > > > > +	/** @num_entries: number of entries */
> > > > > > +	int num_entries;
> > > > > > +#define XE_PAGE_RECLAIM_INVALID_LIST	-1
> > > > > > +};
> > > > > > +
> > > > > > +void xe_page_reclaim_list_invalidate(struct
> > > > > > +xe_page_reclaim_list *prl); int
> > > > > > +xe_page_reclaim_list_alloc_entries(struct
> > > > > > +xe_page_reclaim_list *prl); static inline void
> > > > > > +xe_page_reclaim_entries_get(struct xe_guc_page_reclaim_entry *=
entries) {
> > > > > > +	if (entries)
> > > > > > +		get_page(virt_to_page(entries)); }
> > > > > > +
> > > > > > +static inline void xe_page_reclaim_entries_put(struct
> > > > > > +xe_guc_page_reclaim_entry *entries) {
> > > > > > +	if (entries)
> > > > > > +		put_page(virt_to_page(entries)); }
> > > > >
> > > > > Kernel doc for static inlines.
> > > > >
> > > >
> > > > Added.
> > > >
> > > > > > +
> > > > > > +#endif	/* _XE_PAGE_RECLAIM_H_ */
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_pt.c
> > > > > > b/drivers/gpu/drm/xe/xe_pt.c index 884127b4d97d..532a047676d4
> > > > > > 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_pt.c
> > > > > > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > > > > > @@ -12,6 +12,7 @@
> > > > > >  #include "xe_exec_queue.h"
> > > > > >  #include "xe_gt.h"
> > > > > >  #include "xe_migrate.h"
> > > > > > +#include "xe_page_reclaim.h"
> > > > > >  #include "xe_pt_types.h"
> > > > > >  #include "xe_pt_walk.h"
> > > > > >  #include "xe_res_cursor.h"
> > > > > > @@ -1538,6 +1539,9 @@ struct xe_pt_stage_unbind_walk {
> > > > > >  	/* Output */
> > > > > >  	/* @wupd: Structure to track the page-table updates we're bui=
lding */
> > > > > >  	struct xe_walk_update wupd;
> > > > > > +
> > > > > > +	/** @prl: Backing pointer to page reclaim list in pt_update_o=
ps */
> > > > > > +	struct xe_page_reclaim_list *prl;
> > > > > >  };
> > > > > >
> > > > > >  /*
> > > > > > @@ -1572,6 +1576,69 @@ static bool xe_pt_check_kill(u64 addr,
> > > > > > u64 next,
> > > > > unsigned int level,
> > > > > >  	return false;
> > > > > >  }
> > > > > >
> > > > > > +/* Huge 2MB leaf lives directly in a level-1 table and has no
> > > > > > +children */ static bool is_large_pte(struct xe_pt *pte) {
> > > > > > +	return pte->level =3D=3D 1 && !pte->base.children; }
> > > > > > +
> > > > > > +/* page_size =3D 2^(reclamation_size + 12) */ #define
> > > > > > +COMPUTE_RECLAIM_ADDRESS_MASK(page_size)
> > > > > 	\
> > > > > > +({									\
> > > > > > +	BUILD_BUG_ON(!__builtin_constant_p(page_size));			\
> > > > > > +	ilog2(page_size) - 12;						\
> > > > >
> > > > > s/12/XE_PTE_SHIFT ?
> > > > >
> > > >
> > > > Done.
> > > >
> > > > > > +})
> > > > > > +
> > > > > > +static void generate_reclaim_entry(struct xe_tile *tile,
> > > > > > +				   struct xe_page_reclaim_list *prl,
> > > > > > +				   u64 pte,
> > > > > > +				   struct xe_pt *xe_child)
> > > > >
> > > > > Nit, xe_pt can be on the same line as 'u64 pte'.
> > > > >
> > > >
> > > > Done.
> > > >
> > > > > > +{
> > > > > > +	struct xe_guc_page_reclaim_entry *reclaim_entries =3D prl->en=
tries;
> > > > > > +	u64 phys_addr =3D pte & XE_PTE_ADDR_MASK;
> > > > > > +	const u64 field_mask =3D GENMASK_ULL(19, 0);
> > > > > > +	u32 reclamation_size;
> > > > >
> > > > > Nit, I'd make the last variable declared on the stack for readabi=
lity.
> > > > >
> > > >
> > > > Ahh got it, reclamation_size moved to after num_entries.
> > > >
> > > > > > +	const uint max_entries =3D XE_PAGE_RECLAIM_MAX_ENTRIES;
> > > > > > +	int num_entries =3D prl->num_entries;
> > > > > > +
> > > > > > +	xe_tile_assert(tile, xe_child->level <=3D MAX_HUGEPTE_LEVEL);
> > > > > > +	xe_tile_assert(tile, reclaim_entries);
> > > > > > +
> > > > > > +	if (num_entries =3D=3D XE_PAGE_RECLAIM_INVALID_LIST)
> > > > > > +		return;
> > > > > > +
> > > > > > +	/* Overflow: mark as invalid through num_entries */
> > > > > > +	if (num_entries >=3D max_entries) {
> > > > > > +		prl->num_entries =3D XE_PAGE_RECLAIM_INVALID_LIST;
> > > > > > +		return;
> > > > > > +	}
> > > > > > +
> > > > > > +	/**
> > > > > > +	 * reclamation_size indicates the size of the page to be
> > > > > > +	 * invalidated and flushed from non-coherent cache.
> > > > > > +	 * Page size is computed as 2^(reclamation_size+12) bytes.
> > > > > > +	 * Only valid for these specific levels.
> > > > > > +	 */
> > > > > > +
> > > > > > +	if (xe_child->level =3D=3D 0 && !(pte & XE_PTE_PS64))
> > > > > > +		reclamation_size =3D COMPUTE_RECLAIM_ADDRESS_MASK(SZ_4K); /*=
 reclamation_size =3D 0 */
> > > > > > +	else if (xe_child->level =3D=3D 0)
> > > > > > +		reclamation_size =3D COMPUTE_RECLAIM_ADDRESS_MASK(SZ_64K); /=
* reclamation_size =3D 1 */
> > > > > > +	else if (is_large_pte(xe_child))
> > > > > > +		reclamation_size =3D COMPUTE_RECLAIM_ADDRESS_MASK(SZ_2M); /*
> > > > > > +reclamation_size =3D 2 */
> > > > >
> > > > > What happens if we have 1G page? That doesn't seem to be handled.
> > > > >
> > > >
> > > > Page reclamation hardware does not support 1G page. This should be
> > > > handled and fallback to standard TLB invalidation PPC flush. I can
> > > > add
> > >
> > > Make sense that we fallback. I am however not seeing where this fallb=
ack occurs.
> > >
> >
> > !! Ohh I got it now, I silently dropped the 1G pages... My bad. I'll
> > follow the new changes suggested below.
> >
> > > > a comment somewhere discussing this but the format for PRL only
> > > > supports 4K, 64K, and 2M pages to reclaim. I'll add a comment here
> > > > mentioning the HW support being limited to these pages and rename
> > > > the is_large_pte to is_2m_pte.
> > > >
> > > > > > +	else
> > > > > > +		return;
> > >
> > > I would think for the fallback, we'd set prl->num_entries to XE_PAGE_=
RECLAIM_INVALID_LIST here.
> > >
> > > Maybe I'm missing something?
> > >
> > > Matt
> > >
> >
> > Given the 1G page, I'll follow this idea. Invalidate the PRL, and then
> > change the if statement in the
> > generate_reclaim_entry() caller to accept all PTE and invalidate it in =
this function above.
> >
> > > > > > +
> > > > > > +	reclaim_entries[num_entries].valid =3D 1;
> > > > > > +	reclaim_entries[num_entries].reclamation_size =3D
> > > > > > +		reclamation_size;
> > > > > > +	reclaim_entries[num_entries].address_lo =3D
> > > > > > +		FIELD_GET(field_mask, phys_addr);
> > > > > > +	reclaim_entries[num_entries].address_hi =3D
> > > > > > +		FIELD_GET(field_mask, phys_addr >> 20);
> > > > >
> > > > > As suggested above, use macros/defines here to setup the entry.
> > > > >
> > > >
> > > > Got it, moved over to using other standard define macros.
> > > >
> > > > > > +	prl->num_entries++;
> > > > > > +}
> > > > > > +
> > > > > >  static int xe_pt_stage_unbind_entry(struct xe_ptw *parent, pgo=
ff_t offset,
> > > > > >  				    unsigned int level, u64 addr, u64 next,
> > > > > >  				    struct xe_ptw **child, @@ -1579,10 +1646,27 @@ static
> > > > > > int xe_pt_stage_unbind_entry(struct xe_ptw
> > > > > *parent, pgoff_t offset,
> > > > > >  				    struct xe_pt_walk *walk)  {
> > > > > >  	struct xe_pt *xe_child =3D container_of(*child,
> > > > > > typeof(*xe_child), base);
> > > > > > +	struct xe_pt_stage_unbind_walk *xe_walk =3D
> > > > > > +		container_of(walk, typeof(*xe_walk), base);
> > > > > > +	struct xe_device *xe =3D tile_to_xe(xe_walk->tile);
> > > > > >
> > > > > >  	XE_WARN_ON(!*child);
> > > > > >  	XE_WARN_ON(!level);
> > > > > >
> > > > > > +	/* 4K and 64K Pages are level 0, large pte needs additional h=
andling. */
> > > > > > +	if (xe_walk->prl && (xe_child->level =3D=3D 0 ||
> > > > > > +is_large_pte(xe_child))) {
> >
> > So right here, I'll make the change to accept all the leafs of the
> > walker and handle the 1G case in generate_reclaim_entry().
> >
> > Brian
> >
>=20
> It is possible we are even higher up page table tree too (e.g. with 57 bi=
t VAs there are 2 level above 1G, 48 bits one level). We need to
> handle those cases as fallbacks to cache flushing TLB invalidations too.
>=20
> Matt
>=20

Was planning on just making everything else not 4K, 64K, 2M pages default t=
o invalidating PRL.
I believe that will handle these other levels as well? I am assuming these =
other levels with
48 bits and 57bit VA will still just look like leaf PTE with no children so=
 I can use a simple
(!xe_child->base.children)?

> > > > >
> > > > > And also here? 1G pages are unhandled? Please explain.
> > > > >
> > > >
> > > > As stated above, page reclamation only supports 4K, 64K, and 2M pag=
es.
> > > > 1G page will have to fallback to the standard tlb invalidation with=
 PPC flush.
> > > >
> > > > > > +		struct iosys_map *leaf_map =3D &xe_child->bo->vmap;
> > > > > > +		pgoff_t first =3D xe_pt_offset(addr, 0, walk);
> > > > > > +		pgoff_t count =3D xe_pt_num_entries(addr, next, 0, walk);
> > > > > > +
> > > > > > +		for (pgoff_t i =3D 0; i < count; i++) {
> > > > > > +			u64 pte =3D xe_map_rd(xe, leaf_map, (first + i) *
> > > > > > +sizeof(u64),
> > > > > u64);
> > > > > > +
> > > > > > +			generate_reclaim_entry(xe_walk->tile, xe_walk->prl,
> > > > > > +					       pte, xe_child);
> > > > > > +		}
> > > > > > +	}
> > > > > > +
> > > > > >  	xe_pt_check_kill(addr, next, level - 1, xe_child, action,
> > > > > > walk);

Since we're on the topic of this section as well, how will xe_pt_check_kill=
() affect the page
walk here? Do we need to handle some case where the whole directroy is kill=
ed before we
look at the child pte? In that case, worthwhile to just invalidate PRL or a=
ttempt to walk it?

Brian

> > > > > >
> > > > > >  	return 0;
> > > > > > @@ -1654,6 +1738,8 @@ static unsigned int
> > > > > > xe_pt_stage_unbind(struct xe_tile *tile,  {
> > > > > >  	u64 start =3D range ? xe_svm_range_start(range) : xe_vma_star=
t(vma);
> > > > > >  	u64 end =3D range ? xe_svm_range_end(range) : xe_vma_end(vma)=
;
> > > > > > +	struct xe_vm_pgtable_update_op *pt_update_op =3D
> > > > > > +		container_of(entries, struct xe_vm_pgtable_update_op,
> > > > > entries[0]);
> > > > > >  	struct xe_pt_stage_unbind_walk xe_walk =3D {
> > > > > >  		.base =3D {
> > > > > >  			.ops =3D &xe_pt_stage_unbind_ops, @@ -1665,6 +1751,7 @@
> > > > > > static unsigned int xe_pt_stage_unbind(struct xe_tile
> > > > > *tile,
> > > > > >  		.modified_start =3D start,
> > > > > >  		.modified_end =3D end,
> > > > > >  		.wupd.entries =3D entries,
> > > > > > +		.prl =3D pt_update_op->prl,
> > > > > >  	};
> > > > > >  	struct xe_pt *pt =3D vm->pt_root[tile->id];
> > > > > >
> > > > > > @@ -1897,6 +1984,7 @@ static int unbind_op_prepare(struct xe_ti=
le *tile,
> > > > > >  			     struct xe_vm_pgtable_update_ops *pt_update_ops,
> > > > > >  			     struct xe_vma *vma)
> > > > > >  {
> > > > > > +	struct xe_device *xe =3D tile_to_xe(tile);
> > > > > >  	u32 current_op =3D pt_update_ops->current_op;
> > > > > >  	struct xe_vm_pgtable_update_op *pt_op =3D &pt_update_ops-
> > > > > >ops[current_op];
> > > > > >  	int err;
> > > > > > @@ -1914,6 +2002,13 @@ static int unbind_op_prepare(struct xe_t=
ile *tile,
> > > > > >  	pt_op->vma =3D vma;
> > > > > >  	pt_op->bind =3D false;
> > > > > >  	pt_op->rebind =3D false;
> > > > > > +	/* Maintain one PRL located in pt_update_ops that all others
> > > > > > +in unbind op
> > > > > reference */
> > > > > > +	if (xe->info.has_page_reclaim_hw_assist && !pt_update_ops->pr=
l.entries) {
> > > > > > +		err =3D xe_page_reclaim_list_alloc_entries(&pt_update_ops->p=
rl);
> > > > > > +		if (err < 0)
> > > > > > +			xe_page_reclaim_list_invalidate(&pt_update_ops->prl);
> > > > >
> > > > > I don't think you need to call xe_page_reclaim_list_invalidate, r=
ight?
> > > > > If xe_page_reclaim_list_alloc_entries fails the prl should be in =
the init state.
> > > > >
> > > >
> > > > Yes. I'll drop this call for now then.
> > > >
> > > > > > +	}
> > > > > > +	pt_op->prl =3D (pt_update_ops->prl.entries) ? &pt_update_ops-=
>prl :
> > > > > > +NULL;
> > > > > >
> > > > > >  	err =3D vma_reserve_fences(tile_to_xe(tile), vma);
> > > > > >  	if (err)
> > > > > > @@ -1921,6 +2016,13 @@ static int unbind_op_prepare(struct
> > > > > > xe_tile *tile,
> > > > > >
> > > > > >  	pt_op->num_entries =3D xe_pt_stage_unbind(tile, xe_vma_vm(vma=
),
> > > > > >  						vma, NULL, pt_op->entries);
> > > > > > +	/* Free PRL if list declared as invalid */
> > > > > > +	if (pt_update_ops->prl.entries &&
> > > > > > +	    pt_update_ops->prl.num_entries =3D=3D XE_PAGE_RECLAIM_INV=
ALID_LIST) {
> > > > > > +		xe_page_reclaim_entries_put(pt_update_ops->prl.entries);
> > > > > > +		pt_op->prl =3D NULL;
> > > > > > +		pt_update_ops->prl.entries =3D NULL;
> > > > >
> > > > > Call xe_page_reclaim_list_invalidate for clarity?
> > > > >
> > > >
> > > > Updated.
> > > >
> > > > > > +	}
> > > > > >
> > > > > >  	xe_vm_dbg_print_entries(tile_to_xe(tile), pt_op->entries,
> > > > > >  				pt_op->num_entries, false); @@ -1979,6 +2081,7 @@ static
> > > > > > int unbind_range_prepare(struct xe_vm *vm,
> > > > > >  	pt_op->vma =3D XE_INVALID_VMA;
> > > > > >  	pt_op->bind =3D false;
> > > > > >  	pt_op->rebind =3D false;
> > > > > > +	pt_op->prl =3D NULL;
> > > > > >
> > > > > >  	pt_op->num_entries =3D xe_pt_stage_unbind(tile, vm, NULL, ran=
ge,
> > > > > >  						pt_op->entries);
> > > > > > @@ -2096,6 +2199,7 @@ xe_pt_update_ops_init(struct
> > > > > xe_vm_pgtable_update_ops *pt_update_ops)
> > > > > >  	init_llist_head(&pt_update_ops->deferred);
> > > > > >  	pt_update_ops->start =3D ~0x0ull;
> > > > > >  	pt_update_ops->last =3D 0x0ull;
> > > > > > +	xe_page_reclaim_list_invalidate(&pt_update_ops->prl);
> > > > >
> > > > > Can we introduce a function called xe_page_reclaim_list_init for
> > > > > clarity? It might do the same thing as
> > > > > xe_page_reclaim_list_invalidate but it would make this a little
> > > > > more clear. Likewise later in the series when a job is created, y=
ou can call xe_page_reclaim_list_init there too.
> > > > >
> > > >
> > > > Sure, I'll write another helper for this and modify both those PRL =
creation points.
> > > >
> > > > > >  }
> > > > > >
> > > > > >  /**
> > > > > > @@ -2518,6 +2622,11 @@ void xe_pt_update_ops_fini(struct xe_til=
e *tile, struct xe_vma_ops *vops)
> > > > > >  		&vops->pt_update_ops[tile->id];
> > > > > >  	int i;
> > > > > >
> > > > > > +	if (pt_update_ops->prl.entries) {
> > > > > > +		xe_page_reclaim_entries_put(pt_update_ops->prl.entries);
> > > > > > +		xe_page_reclaim_list_invalidate(&pt_update_ops->prl);
> > > > > > +	}
> > > > > > +
> > > > > >  	lockdep_assert_held(&vops->vm->lock);
> > > > > >  	xe_vm_assert_held(vops->vm);
> > > > > >
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_pt_types.h
> > > > > > b/drivers/gpu/drm/xe/xe_pt_types.h
> > > > > > index 881f01e14db8..26e5295f118e 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_pt_types.h
> > > > > > +++ b/drivers/gpu/drm/xe/xe_pt_types.h
> > > > > > @@ -8,6 +8,7 @@
> > > > > >
> > > > > >  #include <linux/types.h>
> > > > > >
> > > > > > +#include "xe_page_reclaim.h"
> > > > > >  #include "xe_pt_walk.h"
> > > > > >
> > > > > >  struct xe_bo;
> > > > > > @@ -85,6 +86,8 @@ struct xe_vm_pgtable_update_op {
> > > > > >  	bool bind;
> > > > > >  	/** @rebind: is a rebind */
> > > > > >  	bool rebind;
> > > > > > +	/** @prl: Backing pointer to page reclaim list of pt_update_o=
ps */
> > > > > > +	struct xe_page_reclaim_list *prl;
> > > > >
> > > > > Can you move this above the bools in the layout of
> > > > > xe_vm_pgtable_update_op, likely just below "struct xe_vma".
> > > > >
> > > >
> > > > Ahh got it. Moved.
> > > >
> > > > > >  };
> > > > > >
> > > > > >  /** struct xe_vm_pgtable_update_ops: page table update
> > > > > > operations */ @@ -119,6 +122,8 @@ struct xe_vm_pgtable_update_o=
ps {
> > > > > >  	 * slots are idle.
> > > > > >  	 */
> > > > > >  	bool wait_vm_kernel;
> > > > > > +	/** @prl: embedded page reclaim list */
> > > > > > +	struct xe_page_reclaim_list prl;
> > > > >
> > > > > Same thing here, move just below "struct xe_exec_queue".
> > > > >
> > > > > Matt
> > > > >
> > > >
> > > > Moved.
> > > >
> > > > Brian
> > > >
> > > > > >  };
> > > > > >
> > > > > >  #endif
> > > > > > --
> > > > > > 2.51.2
> > > > > >
