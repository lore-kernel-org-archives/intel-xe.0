Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDA56C25B75
	for <intel-xe@archiver.kernel.org>; Mon,  3 Jun 2024 21:03:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DFBE10E3E1;
	Mon,  3 Jun 2024 21:03:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ANj+GDhj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80A2810E3E1
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Jun 2024 21:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717448623; x=1748984623;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=VUePx9xVOOcZYEN+hfAcm5boHhryhZuiO5RzEauTwI4=;
 b=ANj+GDhjtOMB00bRyP+9HOiCq044bboXI9mD4LCpUAakUbn3qm7G0TAi
 Tp8eBSXbdjK5jDJ8kkbDaXMHX+KA+zC5KCrgN1lVGWwLkBN/XOHX/ynvY
 T+H10thY2duxX6z55GXfbmUXB77nyMEmIsRjmzLMribNdDsm9BvUS/gnP
 xml6ebh8IZCiEMUqLXk+Epu0Xtrm7EiPY/KfgYzHYFffGmTLrOt8Snsfc
 6U367qoRfoOS9jJY2vkwlzdWQP9q/pRt/0mws8ZOXJX1rkTlqJwezioK7
 1MfbP03PviLKjVzLcA6tMtAtrFfM4y5H+ja+K5LpkPl96NS4yufsIB9Sg g==;
X-CSE-ConnectionGUID: yeo4YLI5SiuQ9qAze/D3Gg==
X-CSE-MsgGUID: Zz40cSy6TrK6yr3tjUSW4Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="25078754"
X-IronPort-AV: E=Sophos;i="6.08,212,1712646000"; d="scan'208";a="25078754"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2024 14:03:43 -0700
X-CSE-ConnectionGUID: J4B6SOnVR8WZf8pL0QG96w==
X-CSE-MsgGUID: YFa1FsGHQNeSwLR8vPCzuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,212,1712646000"; d="scan'208";a="36887886"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Jun 2024 14:03:42 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 3 Jun 2024 14:03:41 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 3 Jun 2024 14:03:41 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.46) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 3 Jun 2024 14:03:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QDVlwKT7eKojzqPBOp0JRkhZ/GLioBoECYZtDHvYIkhyGyPN2qs0HX+7m/eFPRzTrTuidAW5EqbxZIKR4CvS4ybiywcvn+twtHQFW3lLEXIvR3xJlvxVjrTDVPcK6VUT/IHR3tU4XrFq+sieDmcjUi/JAGTe8Fb+7KfNoF21t03BLKMTcgY48Bsoxm4Yi2SEdvdEFwXOU8Q0d9O7zNSIQy+wTUffZTUuifxpsm5rwFczUKiv2Q+XkH5Fymtp4pq1Ig5XVib6AOCpFLCrvymAk6uFgzvZ9otIKrI+ZOyniHbmtjrqdtm/zwvcxtQeb9Acw+2J7S2rKphkac0vE9vJNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/WaWSFVyF9p9+MyClEDu8ybJZ4Lgmgz8R6v14csTFLE=;
 b=RgZviRJ600eQB35/XpgujZlyFxKWB84bY5jZ5PsRQp49VKNMbMs3Fd4djwnqZznbmGiMKwZonxI2ukkcl2OXwHQ+4XnQBIY8bc51M0c2y6Os1qBI/ARakbPBbkyocrvjxnfb2Hb+jb3+2zcSOEoOXyoJMujDmfYrtUPoxkkeCwhEc3q0xzqAy5j2qW6K5thgeMiGTTERxaFdvNLj6+N5EWVwMTaGhcmzNNy0GFg7mdjISfhzDqxaFWTO6QHPFpYLYwQgI1bRmZt/5dSPAyqOLXVzcLyuRuj4cNln1W2oXnYHiiSsKOrwcfX5sK77jAlGYLjA+PCKt2RGTdzo/a5y3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by LV3PR11MB8507.namprd11.prod.outlook.com (2603:10b6:408:1b0::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.27; Mon, 3 Jun
 2024 21:03:38 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.7633.018; Mon, 3 Jun 2024
 21:03:38 +0000
Date: Mon, 3 Jun 2024 14:03:36 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
CC: "Nilawar, Badal" <badal.nilawar@intel.com>,
 <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH] drm/xe: Fix xe_force_wake_assert_held for enum
 XE_FORCEWAKE_ALL
Message-ID: <20240603210336.GA2906448@mdroper-desk1.amr.corp.intel.com>
References: <20240530142533.875437-1-himal.prasad.ghimiray@intel.com>
 <40338a61-40df-4d29-9960-e0f96e9c9e8a@intel.com>
 <00281173-2316-4c6a-b69a-02b6902e08ec@intel.com>
 <b75a1731-8286-4a0f-8eed-015364c32052@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b75a1731-8286-4a0f-8eed-015364c32052@intel.com>
X-ClientProxiedBy: SJ0P220CA0011.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::31) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|LV3PR11MB8507:EE_
X-MS-Office365-Filtering-Correlation-Id: a8817865-b9a3-4e31-5ec8-08dc8410a3f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?XpupTKioI7rDZeidJ0bPkjs+bAq8DrlX3kbevR5SD2vQcrHzl0GaVzettR?=
 =?iso-8859-1?Q?fqjyfb7/DWepMYtqiZQoq2ddXY82NVZUlKrz/kr5PV5dUfEOgIb2Uty8pB?=
 =?iso-8859-1?Q?M14zGb8ODd8e+lTobZH3yYUgNsRytqX+SgQISKFzH9SzlqCs+19RcSlDsS?=
 =?iso-8859-1?Q?+YRoZ+6ak0XGX9gaO0LT3oHoXtqVkmPLp7ozRGGgVptVV9mrLoB6nIgLZA?=
 =?iso-8859-1?Q?4l0gPuvcqJEOhbUd6m9fFh7AkCYuwmRJqWz1QAci1dkLKsWm8AC1JSGPPZ?=
 =?iso-8859-1?Q?To4Pxa7qEb99raBg46v0lR7Ji016m9TI4lQMlXZEz3WsxJo7s0TjVx8oYu?=
 =?iso-8859-1?Q?jxKG1FaoONZ3OxAPAlEOoKiM1szURcQTuGfZHtSSElm2C8rQOmCIrI1pOZ?=
 =?iso-8859-1?Q?TjhFO0IQVy5wTrqGOm22esDQWVTVl/Tb3vRxzXSFkKq91q7iuSqmFsFmeI?=
 =?iso-8859-1?Q?zG7eVPlczpU+0lSmsKOa5NToL25J3QVUeBJX8zJclqUxKnY1v5gt1Sll4k?=
 =?iso-8859-1?Q?v6gGT7aC9eZW6aoz/C7kE5oZFltnInL1E8H9OxrlIF5b6IudJErN3jDJ9y?=
 =?iso-8859-1?Q?xrv/9KN3RLTYp43c9UlU8YC8DicHxfgYHLhsYABtv32hJZKWpqCi6QkpdZ?=
 =?iso-8859-1?Q?av6ScPMC6KlqzGqABKfTuk2cKKoUoH4nLf0ccuOb9i2E1oUX8yVjGwv4nc?=
 =?iso-8859-1?Q?mZH8/4o/4WoFksmk1cQTtYGDqegMY10//YoG9EfIWrBjCmXz/CmS4MSDOR?=
 =?iso-8859-1?Q?OJqNUAeGG7FJjshkqlZgXXjz+DBZF/uerbvk9QbX4EwolDR2TVgHYhs4iq?=
 =?iso-8859-1?Q?O+nWLkcQUkIJBH2PDGqo1O3f1YJOfeiVaVV36LTM0TD+rx6HUPf1nZ02nz?=
 =?iso-8859-1?Q?RJNjd4RStWjxYnNFa7nGAz2hl8OCN4s8oqhlI98kAxxb8km6jaBHszo81m?=
 =?iso-8859-1?Q?tzWs0VXLD0x3ZNlI0sxLLsATBHu18cg6Z+rNfpGvosHYjXle6LGmsZ5ov6?=
 =?iso-8859-1?Q?ebF2Ubk5lRlYK846QVxFDAqE4eZ5APW2R3KwopVriR6rP99R3KYYLs3gU+?=
 =?iso-8859-1?Q?LAuw+6gPhsnMc6qUeozitDbDIsGOohU3AVcbHTp1DqOf7RIQD5irQWRoDy?=
 =?iso-8859-1?Q?00PGSZFaxS3+ujrHXZ9A1mOsPw8nAVVo1jwr4Jtlgsjcz2WKctvfTWX+Gl?=
 =?iso-8859-1?Q?gdqKh7QR9+IDIZJZ72/nOUYONEEoPtrcdR79F/21tHW2ahE0vNEdwfroHe?=
 =?iso-8859-1?Q?BPpph9Z6eKzk1zqMnznhrkIKI1if5V57s9CKj2tCgCA7ZkiO2sTQTFGhW9?=
 =?iso-8859-1?Q?putOtCgJT2njIyfCAi9eYerqGQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Au+7T6MJ3ZhLU08H8WZuI5tzb09+lir8bgqsVEm3RoD9JtbOW32xmT++Aj?=
 =?iso-8859-1?Q?4cFpwCBVMRgAX8EDErGdiWIs0i+eEHZmEyLV3z3/UlueVKGf43fAnpRCOr?=
 =?iso-8859-1?Q?sBfXqpanLY4nQWem8iDV7zVgQqLQMcANRm+KNQFRvyOmkI0+F/odrCwuEU?=
 =?iso-8859-1?Q?cKOdFGpYWME0ayqTqmblz5sWokzIp+d9cNz5NBeXA2qs/ftjBDFoWE6nxb?=
 =?iso-8859-1?Q?YprvUx00E+mC0KccGHQwWzv2nR6UD9Q4TdxX9xCyDU6X9ZqUGwivDfiszm?=
 =?iso-8859-1?Q?3kBdXCeHR0+G8nAdwqSxRmBGI2DjRS6O0jeAhIyTgyUHYTta7Ws5Yu9Lb6?=
 =?iso-8859-1?Q?MaZo3C/CywS2NidFn86StC1wU2dAEZBdPCRghmXkY0pjwsVcroymJdKB7E?=
 =?iso-8859-1?Q?4DenbSBe+NEfCnAhT0KOqzx31u7pwG4XfiPJg8dWYsFmBMci6UZyBqP9U0?=
 =?iso-8859-1?Q?q2/WcpYM35Ag72xsYKv7Vl5gsS9qh+/05QPCNfEQP2Cda7ICCRSXJy26ow?=
 =?iso-8859-1?Q?nD9mJmsbMNjsZUqs8rCxBiWKFvFJdpJWOhLaog3KMkKMCxdN4rvLqTIiqg?=
 =?iso-8859-1?Q?JEy87mGoszzhNPVk9dzwMJuq0Ni7MqmvhlsYC2CO/diGLZJexpUhTxxZeC?=
 =?iso-8859-1?Q?l5zuR/iYedZFpVI477x3J1bPggmhekttSpQw0sJrIyBE9djj58vz3rZRf6?=
 =?iso-8859-1?Q?QZFOJXB/AoXY82HtycE7N/cfLelk/RbYJ1cjDADL7yxF/0D8kvQKFhck39?=
 =?iso-8859-1?Q?C15oMD2HyQaEyLgu1ZyvaqaJ5Uu7z1ttjjhXzCXFfOlU7l7J1rM2wNDz4L?=
 =?iso-8859-1?Q?j7I8qsZI+MiazaD4YZB8PAcbTedKh37iq0myUdznCfRYxSHMpVmp5KN5xN?=
 =?iso-8859-1?Q?UhgYfzHRUIrg+FsIwOS2/Tt8qYvYGJ2HXNW/MAC9hF1oKXi5mQJtS5DSzZ?=
 =?iso-8859-1?Q?9yt3IF8OPUGTRROPdHnIFWj+zboujShIALkI8OQHol/kMt2DTRhIvZ8AcY?=
 =?iso-8859-1?Q?9sfoTexM7d4DXXPoowMpvashsp8Qn3f/SBUDgckURB81aMeMSUxFIoH8EP?=
 =?iso-8859-1?Q?4STz4v8wKC89gtI5rY0NHNE1fyyMOdunQQTxqAB0+npcUlRE3EvWMrpd6h?=
 =?iso-8859-1?Q?hcnIeTEB2KzecCZQDyluhrW4JD5zlGf1CIzn9CSIFVXzbCujJChvxG5HU5?=
 =?iso-8859-1?Q?eObZ/442nIyxGR+qUA0g3aiQIuPQOBnBC4XQ+fZRI4Ri+XCAHfGjRTQ+WY?=
 =?iso-8859-1?Q?ZjECE5SRSfUzoBZOb6+hv5uT30l6l3v6W7EUSjnPEN+5bltaz2LSty3p8b?=
 =?iso-8859-1?Q?CpBCaRnlE+VllZYrbHYgrxfh2lbLaaYnWy6FA21MylIDWRLIxosDKOxXON?=
 =?iso-8859-1?Q?i/Jb1MMCo3hwQ7JTZMMe7ndVKRvf7y+gM1ovDPEp0cCU2nXnMauoAB8GSj?=
 =?iso-8859-1?Q?OlSobHkMrdehPD0PVXpSJVeLsyj2uaSjEuHKNiVF853k0yKkM7mJwBSV11?=
 =?iso-8859-1?Q?pFwJnwnJXJGKVQ0/mYt55p5xoIqe3mcPQ/9wPdr/9+OvixHptWUCeD+zpw?=
 =?iso-8859-1?Q?dZsdhEKMh3BPMOzx/Ixtb6AdYxtrw0I3OzSsz3Qac/vxvo7XFCpNjtBXt5?=
 =?iso-8859-1?Q?4IK/h8+t8LB1VN/F16xKgAkWVZ3mFymFUuc1Ayq7vSeHuOh31ll8MSrg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a8817865-b9a3-4e31-5ec8-08dc8410a3f5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2024 21:03:38.6705 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sj0r8q849nH6I3V3/n/XhfVeD2AfVh9Mdwp2CwSPjh8h+IUyAk6Q2bi9x+NCekP2ldI3FRbSdh+1ZY+lUPRJuuLQnajGGA7vaK37KbTTXes=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8507
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

On Thu, May 30, 2024 at 10:09:30PM +0530, Ghimiray, Himal Prasad wrote:
> 
> On 30-05-2024 20:14, Nilawar, Badal wrote:
> > 
> > 
> > On 30-05-2024 19:51, Nilawar, Badal wrote:
> > > 
> > > 
> > > On 30-05-2024 19:55, Himal Prasad Ghimiray wrote:
> > > > Make sure that the assertion condition covers the wakefulness of all
> > > > domains for XE_FORCEWAKE_ALL.
> > > > 
> > > > Fixes: c73acc1eeba5 ("drm/xe: Use Xe assert macros instead of
> > > > XE_WARN_ON macro")
> > > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > > Cc: Badal Nilawar <badal.nilawar@intel.com>
> > > > Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > > > ---
> > > >   drivers/gpu/drm/xe/xe_force_wake.h | 2 +-
> > > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_force_wake.h
> > > > b/drivers/gpu/drm/xe/xe_force_wake.h
> > > > index 83cb157da7cc..9008928b187f 100644
> > > > --- a/drivers/gpu/drm/xe/xe_force_wake.h
> > > > +++ b/drivers/gpu/drm/xe/xe_force_wake.h
> > > > @@ -32,7 +32,7 @@ static inline void
> > > >   xe_force_wake_assert_held(struct xe_force_wake *fw,
> > > >                 enum xe_force_wake_domains domain)
> > > >   {
> > > > -    xe_gt_assert(fw->gt, fw->awake_domains & domain);
> > > > +    xe_gt_assert(fw->gt, (fw->awake_domains & domain) == domain);
> > > This will always assert for when domain FORCEWAKE_ALL (0xFF).
> > > Not all the platforms support all the domains.
> > > e.g. MTL GT0 support GT and RENDER domain. So for forcewake all use
> > > case only bits for GT and RENDER will be set.
> > I think to handle this correctly in struct xe_force_wake you can add new
> > enum xe_force_wake_domains supported_domains to hold bitmap of supported
> > forcewake domains. Use this bit map to check appropriate domains are
> > set.
> 
> Hi Badal,
> 
> Thanks for taking time to review this. Agreed the check should be based on
> supported domains.  Will look into this.

I guess the real question here is why we'd ever be passing
XE_FORCEWAKE_ALL to xe_force_wake_assert_held().  That assertion is used
to sanity check that we're actually holding a necessary power domain
before performing some operation that relies on it.  Nothing in the
hardware should ever actually _need_ every single forcewake to be held
at once; we just tend to grab XE_FORCEWAKE_ALL in some places of the
code because it's simpler to just blindly grab everything at once (even
the ones we don't truly need) than it is to figure out the specific set
of domains that will get used.


Matt

> 
> BR
> 
> Himal
> 
> 
> > 
> > Regards,
> > Badal
> > > 
> > > Regards,
> > > Badal
> > > >   }
> > > >   #endif

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
