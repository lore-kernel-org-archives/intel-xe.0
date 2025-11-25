Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBAD9D0EE13
	for <intel-xe@archiver.kernel.org>; Tue, 25 Nov 2025 19:01:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6235810E44B;
	Tue, 25 Nov 2025 19:01:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kP9mbzMK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDCD010E449
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Nov 2025 19:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764097290; x=1795633290;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/OaE8KKApY4Hsr1luU1xLylaTMVr8LUb40PkQqLE/IY=;
 b=kP9mbzMKbXPN7LGo3i1WtO9mt/zd9JgpQawbg0UKgin0gi+3paeWO4eI
 z163xV+oJHJTVisdFSBrdoNyruG+90pf5lcR15FJL8nbWc7MKc3mnQps4
 zZ6PSzPhcspw9zRwVydsir5DMJoFCSxKO2jNKnqF1ViTV4X5C8mAk8o3G
 BdYgstAVYC7MzJIgAv6agOiu+6lihMj2p/cov6TTxTfzgNGo8JK/4MYY6
 J2ZcjMWexLg67vBoDv8TXqv4OCRzPgbvVM+NcfB7HrkPnaIaGlisr5tTd
 Nt50U4DtHOLjUdZwodQGv6s+nBnIpKuaUrMBYqSbSU2Stme+OdDHSUddD A==;
X-CSE-ConnectionGUID: e4t3RfJjR2qGdXeay1Y/EA==
X-CSE-MsgGUID: Fv865jioQZCEMmscEmdcLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="66079256"
X-IronPort-AV: E=Sophos;i="6.20,226,1758610800"; d="scan'208";a="66079256"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 11:01:29 -0800
X-CSE-ConnectionGUID: lT7nkwYjTNO9mejgAKZC2g==
X-CSE-MsgGUID: 1CeyV4fWR+6tv5lZ40vNog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,226,1758610800"; d="scan'208";a="192508363"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 11:01:30 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 25 Nov 2025 11:01:28 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 25 Nov 2025 11:01:28 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.23) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 25 Nov 2025 11:01:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t7j+px8IT1SlR/A302wcHdli7B/TYk7XNoLgNxeB0y43FsKU4sZGMRVOccMgKtzsxaBwK4aDWqPMwpQJNYPgnRPaLc8gXt2EQdl/Psm5TziejnLlVsAfsjVHN6gfSiCJIGd2pS/LcMX3/wHzPN8EpT4xIKjdiRyPeHGKyCzwFiiOu1Ou04ZwjXJcO+oVxPf82J3lskwS+WTFg8pzklKUii6EaY4IOpoRryKJZv1iwaEhx41HTa/kdU2msXwUKxTxsGvJ+B+f8mBhpgC+5Tk5rIM1NuV8W5IICqmKbLMVanoTLrHXTZdGW8xplAbTqB83wz7tKvrO+I8nqMGEBRpKeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=igPWFebyxmezlQlxn84Y6FCeLZBR7ZQ4pme+UxiW9Oo=;
 b=dr6VhHt1bwc0JTIvtyQTt9apyJtVvbo8YpzxAW3vx6hmbLEhdWXwdnhv3MHDVTjIy2leWxVK2ShqB74O0yscsj+AS356JISS+4t7BlBgoD9OzgDJSyms1952m6YGUN1n4uiBDL5q7LuOF8wkgAhDCKToujyKAsYdbjbAPKlcfcCXKpVxv5Ie6wqlDXdnlU7Km9Q+Qip3/zwi8NTc3RTXxg6q9EFLuIiCKOp2j5Odq1o4wrJPuhTrlUeXrPaliFKUc+gXsZ/qzrdsYAMJMz0RzNk9nbsmLYKo/E2p7q2EOT6yUW22vUE5d8XSXed6Jz5AWrz/ZiqiGR0s3BZA+mNt1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB8839.namprd11.prod.outlook.com (2603:10b6:806:467::17)
 by SA1PR11MB6736.namprd11.prod.outlook.com (2603:10b6:806:25f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.11; Tue, 25 Nov
 2025 19:01:25 +0000
Received: from SA1PR11MB8839.namprd11.prod.outlook.com
 ([fe80::ce6c:3c7f:92ef:1394]) by SA1PR11MB8839.namprd11.prod.outlook.com
 ([fe80::ce6c:3c7f:92ef:1394%5]) with mapi id 15.20.9343.016; Tue, 25 Nov 2025
 19:01:25 +0000
From: "Nguyen, Brian3" <brian3.nguyen@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Upadhyay, Tejas" <tejas.upadhyay@intel.com>, "Lin, Shuicheng"
 <shuicheng.lin@intel.com>, "Summers, Stuart" <stuart.summers@intel.com>
Subject: RE: [PATCH 06/11] drm/xe: Create page reclaim list on unbind
Thread-Topic: [PATCH 06/11] drm/xe: Create page reclaim list on unbind
Thread-Index: AQHcWGqafCc1cGxJfkCPRCmuyqMP+bT/GKGAgAM0OFCAAXaKgIAAAYtA
Date: Tue, 25 Nov 2025 19:01:25 +0000
Message-ID: <SA1PR11MB88393D5D019B5943600FCBA4AAD1A@SA1PR11MB8839.namprd11.prod.outlook.com>
References: <20251118090552.246243-1-brian3.nguyen@intel.com>
 <20251118090552.246243-7-brian3.nguyen@intel.com>
 <aSIMb4EREPix3SDK@lstrano-desk.jf.intel.com>
 <SA1PR11MB883987BC9C5A7FCAE239C273AAD1A@SA1PR11MB8839.namprd11.prod.outlook.com>
 <aSX2qxiSvdNrXvbX@lstrano-desk.jf.intel.com>
In-Reply-To: <aSX2qxiSvdNrXvbX@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB8839:EE_|SA1PR11MB6736:EE_
x-ms-office365-filtering-correlation-id: 6572146b-fd97-4c78-e7d4-08de2c550855
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?1Q8D71V9xWGHxR8FkYn9JwHHfTRdTRTQjLb8Fx1X16LYXbQblVfQZ0jYkbo2?=
 =?us-ascii?Q?/z+SX+WYdHdQnTFKv9Xq4i0NvD+85qM8nprIrpzIktXJYX426ZJ8nEN3A4vr?=
 =?us-ascii?Q?L8XgJPCIMpQPjhz01/JVworxT/F86aEZQYf8M1doEhsQ3hkK94i56Yq6qiWf?=
 =?us-ascii?Q?Qax1Wkf16fXN1vBlH/00xjCkU4elLLnJcgL1h4b8dcPWVFGg2RzloPHFPUK5?=
 =?us-ascii?Q?ZL68IQVg7bGFDm14myais4srhgcNes/xGgad1T3I7K8xbptaMnxAPC12Bp4c?=
 =?us-ascii?Q?upzPpajSjUSe/12Ui4lC2Joi+NfncgWFfcUncPxDs+bj0LqYqgPtAgcp83QN?=
 =?us-ascii?Q?67lt1yipkPue1hYQe5Ty2HmorCa9ahJHqRh+sE8+Vw5fJG6ecNChnR/s2mkm?=
 =?us-ascii?Q?NV+QvCDshVUyD4tTvds0RQJwFT9ZosI1KDtlx0eDC/zP1FtB0V/QL3Gh0KDA?=
 =?us-ascii?Q?MmxrWnd4r4QyNdy7ciTU4MiyKTTZoQU5DzqfqUE1EacTJukn9nroZATCwjAt?=
 =?us-ascii?Q?FAE2yauiZYvV5F2c4om/iOr6gpNdgl23t+fANjt7j6kncQ43Wh3LVOSglJnO?=
 =?us-ascii?Q?CoTRZpoK/iflMBVeH2ciCORgJYswUrcD2Y2Mu1EwEz0b8CaetShj1lAx3R5d?=
 =?us-ascii?Q?JbOm10Xhns3hd5wqpQfQpZmgiHz92+b/etk8xLasNmobNGodmZgwclFbM514?=
 =?us-ascii?Q?p+MAdrmh0IlrYOIRrpNYLT83edrlGiwWMl515k3CpCQxrjs/HCdH7silwuot?=
 =?us-ascii?Q?biBmfvzH2xXn5f86vQS3zrmH0qfp1XJSlhOHdfqeVm9YHfC8R6uGmtkDX1FX?=
 =?us-ascii?Q?rbakUzRSrDBTyANTlkFNYlgvTjkHuWKADRnGkmFsc2/CGxW6o9AnLG9zUP/S?=
 =?us-ascii?Q?75dlqeLn2iRAqGED9EIghzp/K3XMKr/zMQQ6gWrV3K1Fe4jnwUWPfwbVfEeN?=
 =?us-ascii?Q?S32MWTIABXaXrgv/mdGPUxpY/Q+y9xqoNHNPXa6WJuGQcNTLx+ITutcs1E2B?=
 =?us-ascii?Q?ls03O1ZaP+08b1S8TLr91DvQMITRnb0JJ6FniFoHY4Qh4e5joBzRhKzHqMWM?=
 =?us-ascii?Q?G/YNSxThT/828syGg7Lycgt6PlyY2bntY3jtUZQGtX+Lh93DXeGNAFZ4hY7R?=
 =?us-ascii?Q?46x47IMkisFnRQYxOTLlxzE7rXps92l4pkPJJyi6fsPz5AcX7A/Ql81BYank?=
 =?us-ascii?Q?mXVDFXGmwiwWnJpuOyt5YdLGU2vIYovuz0EY+HmDdUQvuxGONbhuX78psGHe?=
 =?us-ascii?Q?6FVaTlzOSe6JB/PCV+DnYro7o2Uyqc5WiMareoZ56cxFaaMdEsQeK6tCqYag?=
 =?us-ascii?Q?/naWhIfskL5gDUSgHbSgvjIJA5GLHzMevMvDGF7Kjwiuc2WKP4PU9W74ykaH?=
 =?us-ascii?Q?Zp61vcz4H6nq3D/y0rmr1TaJoEKfAA+695EOR8Mshed4Iw4kjmeE5PpjGqjo?=
 =?us-ascii?Q?VZY3se4FoNqQDb06KgStNyeqAkJBIBzAG29Ot/OrTDx6SklbswTEX2MxVb9m?=
 =?us-ascii?Q?KeB9Lcviy9byyrL5aiy2uNkRLzTk0Oz/0FO9?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB8839.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?8FmHhOW0mFajTR8fF175CBIbXZ/SLNLBV3QFsP1pKdHIC7P0Jhi4+0T+VgBF?=
 =?us-ascii?Q?EN0Bb3NvNyBdmWv6LtQtXBIaUBxCSeewEPWeoJ5vkmV1+JSpfYeNP43ATUC/?=
 =?us-ascii?Q?SRpOefTARXbkMRXJUaN2uRa2cr51GiLfG+5jQuzKf6fptX/gXE8k0LOFatFU?=
 =?us-ascii?Q?JSy1imkOPzDGHY4xocQt7rRciN1tddZ414CXqTIKWRxEAax0z3lxva4C5Wip?=
 =?us-ascii?Q?N5f1WZh0FKW6K+PBLrOjTsl9Ux9aYT1Yk0E4XI0JS9yQ46iMyShcaSlgxu93?=
 =?us-ascii?Q?drsZydfZhXojXldAENHfKxNP4nfuxTFyY0yyxS6zdkL1SmBvQCxq9K96ipEZ?=
 =?us-ascii?Q?nm60RKiom6le+4q2w/gyM0GA3lVE2UoYu3TMPEM7s7CxX7b0zmAHfvZ5SQC4?=
 =?us-ascii?Q?cxtGXQ4y+H7LhDLG1yAhqIj9weSMNKWn14otcNjqbS8uWTLelEWIidSyXTLX?=
 =?us-ascii?Q?u9t+hD1+Ndcq8mIY2/8S2MMQ546hDzW+SA7vLeD2PHCdSYGN0OL56oUAZLji?=
 =?us-ascii?Q?wu47P6jKJBTUirf2s9R5edQ2nfFQfrE7YKPngqpVOhiPg18rW68fVbJj0E5v?=
 =?us-ascii?Q?T9eMJ7zNOyFjYgrw9uKk/fOVVORFft5p1+DLu91bWu6WVHXZKR4NnoY6QCnd?=
 =?us-ascii?Q?/m7Lp7lZrRS1AoOaXLMnSE2pBu5D2Qu2rQJfAQRRLXNJ4B9tj/Q6xDpxLp9O?=
 =?us-ascii?Q?DVik+A6R1nrZ2bDePkW6qIbDRjejAIvMaOYU26gtLfbbbxvWFxVa/ASZLuJb?=
 =?us-ascii?Q?L3faqmVkIfBmGzjBx0R+fmEDdigLuOOdT8yxnbjk6r1PEMUUZf6Ah4+kxltO?=
 =?us-ascii?Q?jjkGwJxBjsC6Wx5WtDX+AHMam0tVWChRcSiQ4Y/TW0ts4IXDGTEVj3iLxLOw?=
 =?us-ascii?Q?50ecTlISvaneG40hOIOqpyi4rkHuVTOUqpmsRAW2xwz1TJn5S4z8oZcN1f+c?=
 =?us-ascii?Q?Bqk+HXzSC0T/AzGxHNWzMlbNwFfDwB+0gZzxh8F0yPjDjaNZ+ar2mdFX5Zr+?=
 =?us-ascii?Q?beINAeOPlJpIRTdeKFp1E2Qk6Jf4aVFCSAj9BskRiEwvuF0TbkNvzUvuhDcn?=
 =?us-ascii?Q?Nz6NWdK5qbl8gJ0yY4I1UfZobKSii7pigTBQ57E+vUCS8aLd4UPUKhFck2e0?=
 =?us-ascii?Q?bxzD87xX3x1BQxx15chvXtq9y1J24sWuUdILrvxlRdkFMIoaN9Q4Vw4qayLr?=
 =?us-ascii?Q?ttvOWe0RfhsLKnutuC2l/WKj7C6CIH9sMSEz+kC1rILzwfg+NApa2ORiHRWl?=
 =?us-ascii?Q?fU+8R1xR+zR4CNAghs7j1XMp7VIRnleDyIA+rmHhijTep6F54rwfiRrSKIf3?=
 =?us-ascii?Q?auRZ/JlzeBXvseXQAlT91EbPDMhtpP6WOlqs1RxR6cEgzkW0aYd8WadDCSZj?=
 =?us-ascii?Q?F8F4uV9zwHsAUeRlJ6N6rWILfz3EZBwuppx9Xqqaw5cVJ4+SsgBWZpDgYoUx?=
 =?us-ascii?Q?MSoHy16s5yP9F4MeX9+TjQugaYiQodqtegWbg876tDQA1eGYf0rGYU3eiiKF?=
 =?us-ascii?Q?rXg6USIfIa8mQuqVGhaPNAwjgSsK2UZcNSIy3DGXAbkUpq+j1zsqayA6Yjjn?=
 =?us-ascii?Q?1xEarBSvbmPFkXfBIpOkWy0/mUSr1vDU/W34XsRQ?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8839.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6572146b-fd97-4c78-e7d4-08de2c550855
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2025 19:01:25.6613 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3eVYfrBNj5yXPcSaT/tEsbmqJPeWz57hdRL4pujSMvuggqwNpfAt8jL7Q6iBtzlTGvRg87GdB25Tad9m2mzmug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6736
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

On Tuesday, November 25, 2025 10:34 AM, Matthew Brost wrote:
> On Tue, Nov 25, 2025 at 04:18:19AM -0700, Nguyen, Brian3 wrote:
> > On Saturday, November 22, 2025 11:18 AM, Matthew Brost wrote:
> > > On Tue, Nov 18, 2025 at 05:05:47PM +0800, Brian Nguyen wrote:
> > > > Page reclaim list (PRL) is preparation work for the page reclaim fe=
ature.
> > > > The PRL is firstly owned by pt_update_ops and all other page
> > > > reclaim operations will point back to this PRL. PRL generates its
> > > > entries during the unbind page walker, updating the PRL.
> > > >
> > > > This PRL is restricted to a 4K page, so 512 page entries at most.
> > > >
> > > > Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/xe/Makefile           |   1 +
> > > >  drivers/gpu/drm/xe/regs/xe_gtt_defs.h |   1 +
> > > >  drivers/gpu/drm/xe/xe_page_reclaim.c  |  52 ++++++++++++
> > > > drivers/gpu/drm/xe/xe_page_reclaim.h  |  49 ++++++++++++
> > > >  drivers/gpu/drm/xe/xe_pt.c            | 109 ++++++++++++++++++++++=
++++
> > > >  drivers/gpu/drm/xe/xe_pt_types.h      |   5 ++
> > > >  6 files changed, 217 insertions(+)  create mode 100644
> > > > drivers/gpu/drm/xe/xe_page_reclaim.c
> > > >  create mode 100644 drivers/gpu/drm/xe/xe_page_reclaim.h
> > > >
> > > > diff --git a/drivers/gpu/drm/xe/Makefile
> > > > b/drivers/gpu/drm/xe/Makefile index e4b273b025d2..048e6c93271c
> > > > 100644
> > > > --- a/drivers/gpu/drm/xe/Makefile
> > > > +++ b/drivers/gpu/drm/xe/Makefile
> > > > @@ -95,6 +95,7 @@ xe-y +=3D xe_bb.o \
> > > >  	xe_oa.o \
> > > >  	xe_observation.o \
> > > >  	xe_pagefault.o \
> > > > +	xe_page_reclaim.o \
> > > >  	xe_pat.o \
> > > >  	xe_pci.o \
> > > >  	xe_pcode.o \
> > > > diff --git a/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
> > > > b/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
> > > > index 4389e5a76f89..4d83461e538b 100644
> > > > --- a/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
> > > > +++ b/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
> > > > @@ -9,6 +9,7 @@
> > > >  #define XELPG_GGTT_PTE_PAT0	BIT_ULL(52)
> > > >  #define XELPG_GGTT_PTE_PAT1	BIT_ULL(53)
> > > >
> > > > +#define XE_PTE_ADDR_MASK	GENMASK_ULL(51, 12)
> > > >  #define GGTT_PTE_VFID		GENMASK_ULL(11, 2)
> > > >
> > > >  #define GUC_GGTT_TOP		0xFEE00000
> > > > diff --git a/drivers/gpu/drm/xe/xe_page_reclaim.c
> > > > b/drivers/gpu/drm/xe/xe_page_reclaim.c
> > > > new file mode 100644
> > > > index 000000000000..a0d15efff58c
> > > > --- /dev/null
> > > > +++ b/drivers/gpu/drm/xe/xe_page_reclaim.c
> > > > @@ -0,0 +1,52 @@
> > > > +// SPDX-License-Identifier: MIT
> > > > +/*
> > > > + * Copyright (c) 2025 Intel Corporation  */
> > > > +
> > > > +#include <linux/bitfield.h>
> > > > +#include <linux/kref.h>
> > > > +#include <linux/mm.h>
> > > > +#include <linux/slab.h>
> > > > +
> > > > +#include "xe_page_reclaim.h"
> > > > +
> > > > +#include "regs/xe_gt_regs.h"
> > > > +#include "xe_assert.h"
> > > > +#include "xe_macros.h"
> > > > +
> > > > +/**
> > > > + * xe_page_reclaim_list_invalidate() - Mark a PRL as invalid
> > > > + * @prl: Page reclaim list to reset
> > > > + *
> > > > + * Clears the entries pointer and marks the list as invalid so
> > > > + * future use know PRL is unusable. It is expected that the
> > > > +entries
> > > > + * have already been released.
> > > > + */
> > > > +void xe_page_reclaim_list_invalidate(struct xe_page_reclaim_list
> > > > +*prl) {
> > > > +	prl->entries =3D NULL;
> > > > +	prl->num_entries =3D XE_PAGE_RECLAIM_INVALID_LIST; }
> > > > +
> > > > +/**
> > > > + * xe_page_reclaim_list_alloc_entries() - Allocate page reclaim
> > > > +list entries
> > > > + * @prl: Page reclaim list to allocate entries for
> > > > + *
> > > > + * Allocate one 4K page for the PRL entries, otherwise assign prl-=
>entries to NULL.
> > > > + */
> > > > +int xe_page_reclaim_list_alloc_entries(struct
> > > > +xe_page_reclaim_list
> > > > +*prl) {
> > > > +	struct page *page;
> > > > +
> > > > +	XE_WARN_ON(prl->entries !=3D NULL);
> > > > +	if (prl->entries)
> > > > +		return 0;
> > > > +
> > > > +	page =3D alloc_page(GFP_KERNEL | __GFP_ZERO);
> > > > +	if (page) {
> > > > +		prl->entries =3D page_address(page);
> > > > +		prl->num_entries =3D 0;
> > > > +	}
> > > > +
> > > > +	return page ? 0 : -ENOMEM;
> > > > +}
> > > > diff --git a/drivers/gpu/drm/xe/xe_page_reclaim.h
> > > > b/drivers/gpu/drm/xe/xe_page_reclaim.h
> > > > new file mode 100644
> > > > index 000000000000..d066d7d97f79
> > > > --- /dev/null
> > > > +++ b/drivers/gpu/drm/xe/xe_page_reclaim.h
> > > > @@ -0,0 +1,49 @@
> > > > +/* SPDX-License-Identifier: MIT */
> > > > +/*
> > > > + * Copyright (c) 2025 Intel Corporation  */
> > > > +
> > > > +#ifndef _XE_PAGE_RECLAIM_H_
> > > > +#define _XE_PAGE_RECLAIM_H_
> > > > +
> > > > +#include <linux/kref.h>
> > > > +#include <linux/mm.h>
> > > > +#include <linux/slab.h>
> > > > +#include <linux/types.h>
> > > > +#include <linux/workqueue.h>
> > > > +
> > > > +#define XE_PAGE_RECLAIM_MAX_ENTRIES	512
> > > > +#define XE_PAGE_RECLAIM_LIST_MAX_SIZE	SZ_4K
> > > > +
> > > > +struct xe_guc_page_reclaim_entry {
> > > > +	u32 valid:1;
> > > > +	u32 reclamation_size:6;
> > > > +	u32 reserved:5;
> > > > +	u32 address_lo:20;
> > > > +	u32 address_hi:20;
> > > > +	u32 reserved1:12;
> > >
> > > This is wire interface with the GuC. Bitfields can based on
> > > endianess of the CPU. I know this is a iGPU feature for now but it
> > > could possibly change in the future, with that, to future proof can t=
he layout of this be setup via defines / macros?
> > >
> >
> > Sure, I moved over to the typical FIELD_PREP/GENMASK macros used
> > elsewhere for the guc interfaces.
> >
> > > > +} __packed;
> > > > +
> > > > +struct xe_page_reclaim_list {
> > > > +	/** @entries: array of page reclaim entries, page allocated */
> > > > +	struct xe_guc_page_reclaim_entry *entries;
> > > > +	/** @num_entries: number of entries */
> > > > +	int num_entries;
> > > > +#define XE_PAGE_RECLAIM_INVALID_LIST	-1
> > > > +};
> > > > +
> > > > +void xe_page_reclaim_list_invalidate(struct xe_page_reclaim_list
> > > > +*prl); int xe_page_reclaim_list_alloc_entries(struct
> > > > +xe_page_reclaim_list *prl); static inline void
> > > > +xe_page_reclaim_entries_get(struct xe_guc_page_reclaim_entry *entr=
ies) {
> > > > +	if (entries)
> > > > +		get_page(virt_to_page(entries)); }
> > > > +
> > > > +static inline void xe_page_reclaim_entries_put(struct
> > > > +xe_guc_page_reclaim_entry *entries) {
> > > > +	if (entries)
> > > > +		put_page(virt_to_page(entries)); }
> > >
> > > Kernel doc for static inlines.
> > >
> >
> > Added.
> >
> > > > +
> > > > +#endif	/* _XE_PAGE_RECLAIM_H_ */
> > > > diff --git a/drivers/gpu/drm/xe/xe_pt.c
> > > > b/drivers/gpu/drm/xe/xe_pt.c index 884127b4d97d..532a047676d4
> > > > 100644
> > > > --- a/drivers/gpu/drm/xe/xe_pt.c
> > > > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > > > @@ -12,6 +12,7 @@
> > > >  #include "xe_exec_queue.h"
> > > >  #include "xe_gt.h"
> > > >  #include "xe_migrate.h"
> > > > +#include "xe_page_reclaim.h"
> > > >  #include "xe_pt_types.h"
> > > >  #include "xe_pt_walk.h"
> > > >  #include "xe_res_cursor.h"
> > > > @@ -1538,6 +1539,9 @@ struct xe_pt_stage_unbind_walk {
> > > >  	/* Output */
> > > >  	/* @wupd: Structure to track the page-table updates we're buildin=
g */
> > > >  	struct xe_walk_update wupd;
> > > > +
> > > > +	/** @prl: Backing pointer to page reclaim list in pt_update_ops *=
/
> > > > +	struct xe_page_reclaim_list *prl;
> > > >  };
> > > >
> > > >  /*
> > > > @@ -1572,6 +1576,69 @@ static bool xe_pt_check_kill(u64 addr, u64
> > > > next,
> > > unsigned int level,
> > > >  	return false;
> > > >  }
> > > >
> > > > +/* Huge 2MB leaf lives directly in a level-1 table and has no
> > > > +children */ static bool is_large_pte(struct xe_pt *pte) {
> > > > +	return pte->level =3D=3D 1 && !pte->base.children; }
> > > > +
> > > > +/* page_size =3D 2^(reclamation_size + 12) */ #define
> > > > +COMPUTE_RECLAIM_ADDRESS_MASK(page_size)
> > > 	\
> > > > +({									\
> > > > +	BUILD_BUG_ON(!__builtin_constant_p(page_size));			\
> > > > +	ilog2(page_size) - 12;						\
> > >
> > > s/12/XE_PTE_SHIFT ?
> > >
> >
> > Done.
> >
> > > > +})
> > > > +
> > > > +static void generate_reclaim_entry(struct xe_tile *tile,
> > > > +				   struct xe_page_reclaim_list *prl,
> > > > +				   u64 pte,
> > > > +				   struct xe_pt *xe_child)
> > >
> > > Nit, xe_pt can be on the same line as 'u64 pte'.
> > >
> >
> > Done.
> >
> > > > +{
> > > > +	struct xe_guc_page_reclaim_entry *reclaim_entries =3D prl->entrie=
s;
> > > > +	u64 phys_addr =3D pte & XE_PTE_ADDR_MASK;
> > > > +	const u64 field_mask =3D GENMASK_ULL(19, 0);
> > > > +	u32 reclamation_size;
> > >
> > > Nit, I'd make the last variable declared on the stack for readability=
.
> > >
> >
> > Ahh got it, reclamation_size moved to after num_entries.
> >
> > > > +	const uint max_entries =3D XE_PAGE_RECLAIM_MAX_ENTRIES;
> > > > +	int num_entries =3D prl->num_entries;
> > > > +
> > > > +	xe_tile_assert(tile, xe_child->level <=3D MAX_HUGEPTE_LEVEL);
> > > > +	xe_tile_assert(tile, reclaim_entries);
> > > > +
> > > > +	if (num_entries =3D=3D XE_PAGE_RECLAIM_INVALID_LIST)
> > > > +		return;
> > > > +
> > > > +	/* Overflow: mark as invalid through num_entries */
> > > > +	if (num_entries >=3D max_entries) {
> > > > +		prl->num_entries =3D XE_PAGE_RECLAIM_INVALID_LIST;
> > > > +		return;
> > > > +	}
> > > > +
> > > > +	/**
> > > > +	 * reclamation_size indicates the size of the page to be
> > > > +	 * invalidated and flushed from non-coherent cache.
> > > > +	 * Page size is computed as 2^(reclamation_size+12) bytes.
> > > > +	 * Only valid for these specific levels.
> > > > +	 */
> > > > +
> > > > +	if (xe_child->level =3D=3D 0 && !(pte & XE_PTE_PS64))
> > > > +		reclamation_size =3D COMPUTE_RECLAIM_ADDRESS_MASK(SZ_4K); /* rec=
lamation_size =3D 0 */
> > > > +	else if (xe_child->level =3D=3D 0)
> > > > +		reclamation_size =3D COMPUTE_RECLAIM_ADDRESS_MASK(SZ_64K); /* re=
clamation_size =3D 1 */
> > > > +	else if (is_large_pte(xe_child))
> > > > +		reclamation_size =3D COMPUTE_RECLAIM_ADDRESS_MASK(SZ_2M); /*
> > > > +reclamation_size =3D 2 */
> > >
> > > What happens if we have 1G page? That doesn't seem to be handled.
> > >
> >
> > Page reclamation hardware does not support 1G page. This should be
> > handled and fallback to standard TLB invalidation PPC flush. I can add
>=20
> Make sense that we fallback. I am however not seeing where this fallback =
occurs.
>=20

!! Ohh I got it now, I silently dropped the 1G pages... My bad. I'll follow=
 the new
changes suggested below.

> > a comment somewhere discussing this but the format for PRL only
> > supports 4K, 64K, and 2M pages to reclaim. I'll add a comment here
> > mentioning the HW support being limited to these pages and rename the
> > is_large_pte to is_2m_pte.
> >
> > > > +	else
> > > > +		return;
>=20
> I would think for the fallback, we'd set prl->num_entries to XE_PAGE_RECL=
AIM_INVALID_LIST here.
>=20
> Maybe I'm missing something?
>=20
> Matt
>=20

Given the 1G page, I'll follow this idea. Invalidate the PRL, and then chan=
ge the if statement in the
generate_reclaim_entry() caller to accept all PTE and invalidate it in this=
 function above.

> > > > +
> > > > +	reclaim_entries[num_entries].valid =3D 1;
> > > > +	reclaim_entries[num_entries].reclamation_size =3D
> > > > +		reclamation_size;
> > > > +	reclaim_entries[num_entries].address_lo =3D
> > > > +		FIELD_GET(field_mask, phys_addr);
> > > > +	reclaim_entries[num_entries].address_hi =3D
> > > > +		FIELD_GET(field_mask, phys_addr >> 20);
> > >
> > > As suggested above, use macros/defines here to setup the entry.
> > >
> >
> > Got it, moved over to using other standard define macros.
> >
> > > > +	prl->num_entries++;
> > > > +}
> > > > +
> > > >  static int xe_pt_stage_unbind_entry(struct xe_ptw *parent, pgoff_t=
 offset,
> > > >  				    unsigned int level, u64 addr, u64 next,
> > > >  				    struct xe_ptw **child,
> > > > @@ -1579,10 +1646,27 @@ static int xe_pt_stage_unbind_entry(struct
> > > > xe_ptw
> > > *parent, pgoff_t offset,
> > > >  				    struct xe_pt_walk *walk)
> > > >  {
> > > >  	struct xe_pt *xe_child =3D container_of(*child, typeof(*xe_child)=
,
> > > > base);
> > > > +	struct xe_pt_stage_unbind_walk *xe_walk =3D
> > > > +		container_of(walk, typeof(*xe_walk), base);
> > > > +	struct xe_device *xe =3D tile_to_xe(xe_walk->tile);
> > > >
> > > >  	XE_WARN_ON(!*child);
> > > >  	XE_WARN_ON(!level);
> > > >
> > > > +	/* 4K and 64K Pages are level 0, large pte needs additional handl=
ing. */
> > > > +	if (xe_walk->prl && (xe_child->level =3D=3D 0 ||
> > > > +is_large_pte(xe_child))) {

So right here, I'll make the change to accept all the leafs of the walker a=
nd handle
the 1G case in generate_reclaim_entry().

Brian

> > >
> > > And also here? 1G pages are unhandled? Please explain.
> > >
> >
> > As stated above, page reclamation only supports 4K, 64K, and 2M pages.
> > 1G page will have to fallback to the standard tlb invalidation with PPC=
 flush.
> >
> > > > +		struct iosys_map *leaf_map =3D &xe_child->bo->vmap;
> > > > +		pgoff_t first =3D xe_pt_offset(addr, 0, walk);
> > > > +		pgoff_t count =3D xe_pt_num_entries(addr, next, 0, walk);
> > > > +
> > > > +		for (pgoff_t i =3D 0; i < count; i++) {
> > > > +			u64 pte =3D xe_map_rd(xe, leaf_map, (first + i) * sizeof(u64),
> > > u64);
> > > > +
> > > > +			generate_reclaim_entry(xe_walk->tile, xe_walk->prl,
> > > > +					       pte, xe_child);
> > > > +		}
> > > > +	}
> > > > +
> > > >  	xe_pt_check_kill(addr, next, level - 1, xe_child, action, walk);
> > > >
> > > >  	return 0;
> > > > @@ -1654,6 +1738,8 @@ static unsigned int
> > > > xe_pt_stage_unbind(struct xe_tile *tile,  {
> > > >  	u64 start =3D range ? xe_svm_range_start(range) : xe_vma_start(vm=
a);
> > > >  	u64 end =3D range ? xe_svm_range_end(range) : xe_vma_end(vma);
> > > > +	struct xe_vm_pgtable_update_op *pt_update_op =3D
> > > > +		container_of(entries, struct xe_vm_pgtable_update_op,
> > > entries[0]);
> > > >  	struct xe_pt_stage_unbind_walk xe_walk =3D {
> > > >  		.base =3D {
> > > >  			.ops =3D &xe_pt_stage_unbind_ops, @@ -1665,6 +1751,7 @@ static
> > > > unsigned int xe_pt_stage_unbind(struct xe_tile
> > > *tile,
> > > >  		.modified_start =3D start,
> > > >  		.modified_end =3D end,
> > > >  		.wupd.entries =3D entries,
> > > > +		.prl =3D pt_update_op->prl,
> > > >  	};
> > > >  	struct xe_pt *pt =3D vm->pt_root[tile->id];
> > > >
> > > > @@ -1897,6 +1984,7 @@ static int unbind_op_prepare(struct xe_tile *=
tile,
> > > >  			     struct xe_vm_pgtable_update_ops *pt_update_ops,
> > > >  			     struct xe_vma *vma)
> > > >  {
> > > > +	struct xe_device *xe =3D tile_to_xe(tile);
> > > >  	u32 current_op =3D pt_update_ops->current_op;
> > > >  	struct xe_vm_pgtable_update_op *pt_op =3D &pt_update_ops-
> > > >ops[current_op];
> > > >  	int err;
> > > > @@ -1914,6 +2002,13 @@ static int unbind_op_prepare(struct xe_tile =
*tile,
> > > >  	pt_op->vma =3D vma;
> > > >  	pt_op->bind =3D false;
> > > >  	pt_op->rebind =3D false;
> > > > +	/* Maintain one PRL located in pt_update_ops that all others in
> > > > +unbind op
> > > reference */
> > > > +	if (xe->info.has_page_reclaim_hw_assist && !pt_update_ops->prl.en=
tries) {
> > > > +		err =3D xe_page_reclaim_list_alloc_entries(&pt_update_ops->prl);
> > > > +		if (err < 0)
> > > > +			xe_page_reclaim_list_invalidate(&pt_update_ops->prl);
> > >
> > > I don't think you need to call xe_page_reclaim_list_invalidate, right=
?
> > > If xe_page_reclaim_list_alloc_entries fails the prl should be in the =
init state.
> > >
> >
> > Yes. I'll drop this call for now then.
> >
> > > > +	}
> > > > +	pt_op->prl =3D (pt_update_ops->prl.entries) ? &pt_update_ops->prl=
 :
> > > > +NULL;
> > > >
> > > >  	err =3D vma_reserve_fences(tile_to_xe(tile), vma);
> > > >  	if (err)
> > > > @@ -1921,6 +2016,13 @@ static int unbind_op_prepare(struct xe_tile
> > > > *tile,
> > > >
> > > >  	pt_op->num_entries =3D xe_pt_stage_unbind(tile, xe_vma_vm(vma),
> > > >  						vma, NULL, pt_op->entries);
> > > > +	/* Free PRL if list declared as invalid */
> > > > +	if (pt_update_ops->prl.entries &&
> > > > +	    pt_update_ops->prl.num_entries =3D=3D XE_PAGE_RECLAIM_INVALID=
_LIST) {
> > > > +		xe_page_reclaim_entries_put(pt_update_ops->prl.entries);
> > > > +		pt_op->prl =3D NULL;
> > > > +		pt_update_ops->prl.entries =3D NULL;
> > >
> > > Call xe_page_reclaim_list_invalidate for clarity?
> > >
> >
> > Updated.
> >
> > > > +	}
> > > >
> > > >  	xe_vm_dbg_print_entries(tile_to_xe(tile), pt_op->entries,
> > > >  				pt_op->num_entries, false);
> > > > @@ -1979,6 +2081,7 @@ static int unbind_range_prepare(struct xe_vm =
*vm,
> > > >  	pt_op->vma =3D XE_INVALID_VMA;
> > > >  	pt_op->bind =3D false;
> > > >  	pt_op->rebind =3D false;
> > > > +	pt_op->prl =3D NULL;
> > > >
> > > >  	pt_op->num_entries =3D xe_pt_stage_unbind(tile, vm, NULL, range,
> > > >  						pt_op->entries);
> > > > @@ -2096,6 +2199,7 @@ xe_pt_update_ops_init(struct
> > > xe_vm_pgtable_update_ops *pt_update_ops)
> > > >  	init_llist_head(&pt_update_ops->deferred);
> > > >  	pt_update_ops->start =3D ~0x0ull;
> > > >  	pt_update_ops->last =3D 0x0ull;
> > > > +	xe_page_reclaim_list_invalidate(&pt_update_ops->prl);
> > >
> > > Can we introduce a function called xe_page_reclaim_list_init for
> > > clarity? It might do the same thing as
> > > xe_page_reclaim_list_invalidate but it would make this a little more
> > > clear. Likewise later in the series when a job is created, you can ca=
ll xe_page_reclaim_list_init there too.
> > >
> >
> > Sure, I'll write another helper for this and modify both those PRL crea=
tion points.
> >
> > > >  }
> > > >
> > > >  /**
> > > > @@ -2518,6 +2622,11 @@ void xe_pt_update_ops_fini(struct xe_tile *t=
ile, struct xe_vma_ops *vops)
> > > >  		&vops->pt_update_ops[tile->id];
> > > >  	int i;
> > > >
> > > > +	if (pt_update_ops->prl.entries) {
> > > > +		xe_page_reclaim_entries_put(pt_update_ops->prl.entries);
> > > > +		xe_page_reclaim_list_invalidate(&pt_update_ops->prl);
> > > > +	}
> > > > +
> > > >  	lockdep_assert_held(&vops->vm->lock);
> > > >  	xe_vm_assert_held(vops->vm);
> > > >
> > > > diff --git a/drivers/gpu/drm/xe/xe_pt_types.h
> > > > b/drivers/gpu/drm/xe/xe_pt_types.h
> > > > index 881f01e14db8..26e5295f118e 100644
> > > > --- a/drivers/gpu/drm/xe/xe_pt_types.h
> > > > +++ b/drivers/gpu/drm/xe/xe_pt_types.h
> > > > @@ -8,6 +8,7 @@
> > > >
> > > >  #include <linux/types.h>
> > > >
> > > > +#include "xe_page_reclaim.h"
> > > >  #include "xe_pt_walk.h"
> > > >
> > > >  struct xe_bo;
> > > > @@ -85,6 +86,8 @@ struct xe_vm_pgtable_update_op {
> > > >  	bool bind;
> > > >  	/** @rebind: is a rebind */
> > > >  	bool rebind;
> > > > +	/** @prl: Backing pointer to page reclaim list of pt_update_ops *=
/
> > > > +	struct xe_page_reclaim_list *prl;
> > >
> > > Can you move this above the bools in the layout of
> > > xe_vm_pgtable_update_op, likely just below "struct xe_vma".
> > >
> >
> > Ahh got it. Moved.
> >
> > > >  };
> > > >
> > > >  /** struct xe_vm_pgtable_update_ops: page table update operations
> > > > */ @@ -119,6 +122,8 @@ struct xe_vm_pgtable_update_ops {
> > > >  	 * slots are idle.
> > > >  	 */
> > > >  	bool wait_vm_kernel;
> > > > +	/** @prl: embedded page reclaim list */
> > > > +	struct xe_page_reclaim_list prl;
> > >
> > > Same thing here, move just below "struct xe_exec_queue".
> > >
> > > Matt
> > >
> >
> > Moved.
> >
> > Brian
> >
> > > >  };
> > > >
> > > >  #endif
> > > > --
> > > > 2.51.2
> > > >
