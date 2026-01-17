Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4842C9830B
	for <intel-xe@archiver.kernel.org>; Sat, 17 Jan 2026 00:00:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7246110E240;
	Sat, 17 Jan 2026 00:00:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bj8hz6Re";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AFB210E240
 for <intel-xe@lists.freedesktop.org>; Sat, 17 Jan 2026 00:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768608032; x=1800144032;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=LHRyEwzO5M17ien3vJBocP4F2ISVflKxB48UodYN8qE=;
 b=bj8hz6RevtGziAJMFgal9hmPKID7BzcLmKOcvDQqMfMtGtF9kFGHHpmJ
 mbkfjPRmfnCGJcOc0QQGRaPw1jA6GFvvIL662DQRTUcs4fsDAbrETv6Xv
 Ws4eFa9moNp2A0CzTKELpX0d6xpVcJAe+R9uK6ijGhNQkK/SGF0RV5kQm
 YYOSKSkeKrryoWcDnkRp95RoSeArsVpMPfFJgkm8HPdc1Byl+cBSNgP6s
 lrGNZLFPdlJqFSNDeS4Cq5ib2wyi7V/bbBmcrc84DG4gU0UhPVZC3o3nS
 8Reh6ZWhXaIVbVuIhhiqHa4sG1RmOBlV3sxOAej9uADq0JCJ+JDLpouPQ Q==;
X-CSE-ConnectionGUID: BaBSrV+NRPa5Fm4moIKD7g==
X-CSE-MsgGUID: vW35sDgFQU+0oCeOakVK4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="57478512"
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; d="scan'208";a="57478512"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 16:00:31 -0800
X-CSE-ConnectionGUID: o5pVRbMRRvuk3FC8UAA+Aw==
X-CSE-MsgGUID: ydUhpGaHRBqVVgVunRxzxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; d="scan'208";a="204977991"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 16:00:31 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 16 Jan 2026 16:00:30 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 16 Jan 2026 16:00:30 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.12)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 16 Jan 2026 16:00:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NXfScctZjXw8Z3jlqvTsaVQ0xYYxd5QSd4vJbP8joUnBseFi+p2ioQyEjIInFLCl5AxfXtHccu6mUiz1+BnCKHkPw7CBvdC7ahaSXfRL2KxPsn8RcAxtlpr3ZKN+q9vC2voqM/zEGRdvrUiQinOtnHD1JvXmvHLDmv5KGiAlDRpSXikdPtKSOcwfZ+UvWqO6ZwD9s9kh9IFBonF+ye51hDdswxwatiW3U9SLzwdLVhLniUrFe4FDT1X3X33QwTWzDtbpgD+662eRo9DZnCw8mF9w/9fALX1Pw40p87GAyWYvEF4eBUEBYdGKqfAcSp/FPUGkO8/IjX2NuIpg/BZUxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=guvfnOlma6ne+mW7wys09yWRjNwNz2hYPwPMQ+JhTF0=;
 b=w7iYJFqOay1N/39+bIUznzQkZL5qgYG4dOMIWKRmku3dUeugCS9kc0adzM1VdBtCB03Lsq88qR42OjT3knsvbVDMrl49+X+kZMDG49DYRGbhfo1pxjaY73NrpovI3wmSHniTBnnmNX+6UY80vUelXUjfKhXQmQYadRMIvMSlSSHK1Y541cFaJSvoCL55Vr1aPx7fLyif7ARX1/Oiai47w/OBvRhPuNCXYr771k0mP0P7nwHWrUOZWXCVx9XkLdBi/z2Y4ljjbZhERZC5dLEV1xoZydwym2tmIPkhL/0Tmo0zcFg3iSkIVFSBORxOQVXpJQYtIKkbf+G69CZL27Pt9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB8839.namprd11.prod.outlook.com (2603:10b6:806:467::17)
 by SN7PR11MB7603.namprd11.prod.outlook.com (2603:10b6:806:32b::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.7; Sat, 17 Jan
 2026 00:00:27 +0000
Received: from SA1PR11MB8839.namprd11.prod.outlook.com
 ([fe80::d917:ef8:5e20:14f3]) by SA1PR11MB8839.namprd11.prod.outlook.com
 ([fe80::d917:ef8:5e20:14f3%4]) with mapi id 15.20.9520.005; Sat, 17 Jan 2026
 00:00:27 +0000
From: "Nguyen, Brian3" <brian3.nguyen@intel.com>
To: "Lin, Shuicheng" <shuicheng.lin@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Gote, Nitin R" <nitin.r.gote@intel.com>, "Usyskin, Alexander"
 <alexander.usyskin@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Subject: RE: [PATCH 2/2] drm/xe/nvm: Fix double-free on aux add failure
Thread-Topic: [PATCH 2/2] drm/xe/nvm: Fix double-free on aux add failure
Thread-Index: AQHchzFbHrxxInDttUinImoVN9xnGrVVWcUw
Date: Sat, 17 Jan 2026 00:00:27 +0000
Message-ID: <SA1PR11MB883904DC846E0A4F87FEDFA7AA8AA@SA1PR11MB8839.namprd11.prod.outlook.com>
References: <20260109220026.2468067-2-shuicheng.lin@intel.com>
 <20260116214055.2882338-4-shuicheng.lin@intel.com>
 <20260116214055.2882338-6-shuicheng.lin@intel.com>
In-Reply-To: <20260116214055.2882338-6-shuicheng.lin@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB8839:EE_|SN7PR11MB7603:EE_
x-ms-office365-filtering-correlation-id: 9f1f70e4-0bcd-4b4a-2170-08de555b6be9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|10070799003|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?dtBw5nq7t8qe31dm4JXcZK7xi8lbf9rsWZ5s6OojIS8MAJLL9kIff8Yaynx0?=
 =?us-ascii?Q?KWrTaBapehXWpAHABsR074nKFmdjqa+VWkMUd/ZA12w1lXdPaP1p9yI0oIL2?=
 =?us-ascii?Q?5dibI4UXcIWX9gYTO/vNH9PmLGe/sH1Ekpr/lKOAXIgKLcvFbkiD9Nzraxee?=
 =?us-ascii?Q?R34lrkcK7o7sy4WeGZvwqJRfCgGggqKBLo4Vtzn6+tF4v5xEbfj7QWhMEJyv?=
 =?us-ascii?Q?amWbWys8tmfOXTKqCVSgkSpRD7HQz7Ape/JUcL4nG8Eg0++EH9Zvj8GSSwvt?=
 =?us-ascii?Q?oOQWli6umejAW8eHosQLT6DMCQQAKvnB+SRNyAL1eR67oo0vK9dgTS+s0T5x?=
 =?us-ascii?Q?Guk1x5wDmn7mXheBsdtO7PstHYfFPkrkgSKN4YPrGiMEM7vb/CeaL0yksT2u?=
 =?us-ascii?Q?Gp/CDycNv2py3FFFkrBrveD4PO3AujPE6rO5aQM/fH/vm6QMY7zShYnrEUTe?=
 =?us-ascii?Q?O9YzD3uBuKqpjpJ6IlvScQW7kiq2x8SWxaUceMH2LdfgrrqmOXubkhn9H+Ni?=
 =?us-ascii?Q?Zp4h1CMPZSyBCoC+Be8fnMkFXlrFd0RZ4QaqM23Ge+ByhzKWIybxK4aqe86v?=
 =?us-ascii?Q?MA3cagQ0eojZI7chocuBmGNdQ6XVSNwER9S4qB8wuX9ztNF07gDKgD1PSwys?=
 =?us-ascii?Q?PklYUeR8xahxRZoFFPSmTVtNKSOpwhfGq1FULVsfuP9b3HgIYOSxUcJrUg8t?=
 =?us-ascii?Q?T/GzH/HJMqKJlTPbgFxtfoKXA4K1cdzBgnwfOHwGXk/HG0mdWVpbY3CV/M+T?=
 =?us-ascii?Q?89GSND9qW7Y8eP+FRiM34CgREfhbmjWGtVaf8jPB1f6Tjt5xeU09Y7FbO4Rj?=
 =?us-ascii?Q?OXvfVNFbf8yWHRasZfXDipIn9pcKDUC8DDiVKX1OsdYAHpqQzamZAZ8+pxGQ?=
 =?us-ascii?Q?c9wHoAERMxHnvOzaMN8PmKW1G66qvhFkywJA6G6UKSTcoT1crZ3dzLGIbYNc?=
 =?us-ascii?Q?4EWr0EErC5L3rXE6bFN/799qDOSUd3aJhsH82mRAXtAHZC2DDpmXna2TVMkg?=
 =?us-ascii?Q?EAPnrL+vqq7/OTJesBD4ph0qkX7ot6hifAVG5+OAAzujkkmCBk5LWw1yG5MH?=
 =?us-ascii?Q?Rsn6ATz7j5QX9tCKRWPJi5iosC/1fVwwCUwKxmjtgiCovebffuADZXNL9I1z?=
 =?us-ascii?Q?n78lvfWjZVwoVhf0mAskk0ioBRItvot8Q/huuaVefFXCHb+prHkdjN+ytK77?=
 =?us-ascii?Q?+7sROuOQ9HhtaIMm/UPIZ+Y47GOuBI/UgtRVHhqlkdi1PxPU/tr6c/SzTp2/?=
 =?us-ascii?Q?bO+iSuWoypJZyKdVs7iAx6M55kQ1kfnBXq3CiHA83vBuNMx/sljvNUa0K0gj?=
 =?us-ascii?Q?hhtFNJEHd9rGxCQKY3qKlNtx8r701U0jJpO1WoWv0TjWJg5T0mjmBv4oHp/r?=
 =?us-ascii?Q?gNHeHhknyqb3GAdnyauUBWRCUHcQe24hM2aC9b5ysURfQSEq2C4313Fdyd9Z?=
 =?us-ascii?Q?POVp6Pl/cDrSRcf7zsjGVnni2z3XtYbtZw497Q2+UJeNpeLGJr2TIEGXjcJx?=
 =?us-ascii?Q?XEbLWQgtiQ455XI4dxm4opsQpHt0gXDd9GvMss6bbDMZ4cbUx7eYYzQ+UAME?=
 =?us-ascii?Q?NpISZ9CJ/skVwTSnmQDNx+L8gJXXlXl9l2+Hst79eXDahQ/pxxLpwc9He9Jl?=
 =?us-ascii?Q?Nj7KaUjgzFzeo+/MaC2Ubs0=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB8839.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(10070799003)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?s8J/jbvJoU9dDmgwqgicRLqzFFku3Tb3+a9dvBRrmx6YxA/20cKBmTKQSl8c?=
 =?us-ascii?Q?CqaYB2Gs6R9gbOB6qrND2TOnvK/iDoBVgPQVkLe8/Z0948L6j78csMQsVA7d?=
 =?us-ascii?Q?qe/mQ2TM+7dNmnXP5rakmEeY7FWwkhl2ACjPIDLmghYhpv4LNCiucA4fh4zj?=
 =?us-ascii?Q?S8WqHNmMYBRZiz6V0UwtKIPWnnpW1EPh41vW6lxXlR0hNTl/FJXQRgmCWpzF?=
 =?us-ascii?Q?oqo3ZRRDTHWhhxYlrR8X59c2AakxjqHxUmFD1qJRED1lhKaJ96f6vAyoPoCx?=
 =?us-ascii?Q?eH+iK+xh9CLpaLBUo56pH5tWgGa0UiEtM9EgIZc4bUOKXyuyV9ap1mikwHRC?=
 =?us-ascii?Q?thgoNRKHGa91f0T6iJU/5ezkJMzQqT2XT2H+qVG4ScpIymMwHJKp2ar7SR4O?=
 =?us-ascii?Q?vtGBB9LLeN0kMTIk/0vjxsYvX/cFXMap1aReZG0aLBk8OOo5KJICaEDtz52O?=
 =?us-ascii?Q?TV7HiQMnuydmvfrp3LF77nIQ1cFqZg4BlAtAIA0mdgVV4C+5E+VN27uvivzT?=
 =?us-ascii?Q?/5MLzl6qVv7sL1nOG6TVQN80AfsXNpCrig2lmPGGD0CcNesi2r/B9dzFV85s?=
 =?us-ascii?Q?DtUOwU0N/ugABv12N7k1tweuHBlmhWnF24AV+3eBtSakI8/SzzghSPIGXO3z?=
 =?us-ascii?Q?nMfQq3oqE+IoPID49LpCQIq99Z/s1HS0K9AUkWH831Oh0QPSncmruI8ug5f2?=
 =?us-ascii?Q?VcF6TmuD+s+E+mSBH09ayfVz1Pt4P/EQOU+PMfccE0EILIgANSlBE+0c0Doy?=
 =?us-ascii?Q?QcDti4qRxRrGKZTc6NLSl2EXUTfC0QRuIRiZkbR8kegoLI46YWVCvsgB7Mwl?=
 =?us-ascii?Q?DMpntzzIGKEWs48+YEgJtW5pZKjSw+uY+TBJ7CkRIhVmOdzISAT8WdLwwXjG?=
 =?us-ascii?Q?sJ6SvT8ukPNY0P2CJbFMjD2pczaImCMfY0cpPOV/eU6yYG+crYyj4RvnbBjs?=
 =?us-ascii?Q?Xi4ZMVlJ5jP4yTueqMe+x7n/5pYUNV21K6gmcDhDTI/Y3lmklyfjzgd80Dln?=
 =?us-ascii?Q?yyp/x7P/SLrzNhZOULjNnsLu1KO+nyoYBKlUt0sfXP89NvzFA5Xv1S5cJiN5?=
 =?us-ascii?Q?fF+x1P3srUhjdnJnuClwS6AC0z1a5VC22muWBBJCbAzDc8KN73Y/xFdtckin?=
 =?us-ascii?Q?dIPPIB2zzBLgqDj6OnF+SFG91aCM3qnCLsmUNdJmN5QK3dtmoXmdtSwYomVu?=
 =?us-ascii?Q?lrtDFI/IBtKULgnIUjJa4dSpaAjgum2/BRNA+agaBkPe7mRkUI90Jy+AMEk/?=
 =?us-ascii?Q?nNEgakz9xAR9vVaQDwcs1YFJVGn0fEfzk1S/NkVJuaWzSzU9MSexl0QFbZzd?=
 =?us-ascii?Q?3W1xGWcyfpv3BdCCFu2qbiWErH/OeL8K44bKuf8HVvRvqG9yUrgt191gGTEv?=
 =?us-ascii?Q?wdQVNJ5SDXYHN3GRBJPC6FHuL9Dm21hCRZc3xViz2u+pTR8zVvdtAmKVy0A6?=
 =?us-ascii?Q?zsF6OsXkhpJVdcvI+fiEvCcEaamOdOG6yfUtBMgQ05mC/DHCtfu4Q0+vZblW?=
 =?us-ascii?Q?uZFgEi8AuTquAWpOJgra2+RMcAELMh7jC20h4AuHgcSzYe13U/l6hyYjkR70?=
 =?us-ascii?Q?Jv5TK79ap8wIJQ7Mae/UNZQJI9VMgBdYpfMfs1txSZz73MoPrbsx+RYBQ+lg?=
 =?us-ascii?Q?0OqkVporjLXdJCsVmTpbudJiqfArl9L+aAchGLQ7rOAkBF57+NbK2i/UggCc?=
 =?us-ascii?Q?1nwUsPF5F5toll+YJNW838ZuKAlRzNTXEIHIu2joOkp1+UASWMRnGFfIDM1d?=
 =?us-ascii?Q?CLWWm/maG9GqZGUqBpCAfDch7a2+rHUXniU1lYF0yMRdCbR6ER5jUsoTDafd?=
x-ms-exchange-antispam-messagedata-1: OlxS7dL2+JduPg==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8839.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f1f70e4-0bcd-4b4a-2170-08de555b6be9
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jan 2026 00:00:27.3728 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Nymu20QFdZF76wuHNLfTdUy4W7TaVG7jsuZTYVCo2MZ/6jl3/0pg0kX8TdOLXNuAl86Edgx+hQpFqrAGY+9xXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7603
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

On Friday, January 16, 2026 1:41 PM, Shuicheng Lin wrote:
> After a successful auxiliary_device_init(), aux_dev->dev.release
> (xe_nvm_release_dev()) is responsible for the kfree(nvm). When there is f=
ailure with auxiliary_device_add(), driver will call
> auxiliary_device_uninit(), which call put_device(). So that the .release =
callback will be triggered to free the memory associated with the
> auxiliary_device.
>=20
> Move the kfree(nvm) into the auxiliary_device_init() failure path and rem=
ove it from the shared err: label to fix below error.
>=20
> "
> [   13.232905] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [   13.232911] BUG: KASAN: double-free in xe_nvm_init+0x751/0xf10 [xe]
> [   13.233112] Free of addr ffff888120635000 by task systemd-udevd/273
>=20
> [   13.233120] CPU: 8 UID: 0 PID: 273 Comm: systemd-udevd Not tainted 6.1=
9.0-rc2-lgci-xe-kernel+ #225 PREEMPT(voluntary)
> ...
> [   13.233125] Call Trace:
> [   13.233126]  <TASK>
> [   13.233127]  dump_stack_lvl+0x7f/0xc0
> [   13.233132]  print_report+0xce/0x610
> [   13.233136]  ? kasan_complete_mode_report_info+0x5d/0x1e0
> [   13.233139]  ? xe_nvm_init+0x751/0xf10 [xe]
> ...
> "
>=20
> Fixes: d4c3ed963e41 ("drm/xe: defer free of NVM auxiliary container to de=
vice release callback")
> Cc: Nitin Gote <nitin.r.gote@intel.com>
> Cc: Alexander Usyskin <alexander.usyskin@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Suggested-by: Brian Nguyen <brian3.nguyen@intel.com>

Reviewed-by: Brian Nguyen <brian3.nguyen@intel.com>

> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_nvm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_nvm.c b/drivers/gpu/drm/xe/xe_nvm.c in=
dex 77856f460770..6d18c775d550 100644
> --- a/drivers/gpu/drm/xe/xe_nvm.c
> +++ b/drivers/gpu/drm/xe/xe_nvm.c
> @@ -164,6 +164,7 @@ int xe_nvm_init(struct xe_device *xe)
>  	ret =3D auxiliary_device_init(aux_dev);
>  	if (ret) {
>  		drm_err(&xe->drm, "xe-nvm aux init failed %d\n", ret);
> +		kfree(nvm);
>  		goto err;
>  	}
>=20
> @@ -176,7 +177,6 @@ int xe_nvm_init(struct xe_device *xe)
>  	return devm_add_action_or_reset(xe->drm.dev, xe_nvm_fini, xe);
>=20
>  err:
> -	kfree(nvm);
>  	xe->nvm =3D NULL;
>  	return ret;
>  }
> --
> 2.50.1

