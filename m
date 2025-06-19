Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A86EC7115A
	for <intel-xe@archiver.kernel.org>; Thu, 19 Jun 2025 12:46:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1BB610EA1C;
	Thu, 19 Jun 2025 12:46:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kwianK4w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00F8910EA1C
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Jun 2025 12:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750337198; x=1781873198;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3iqEGja1ZcZ0vN9FRxUG7wC0z+a7CYEK4FEo3CW0Cqg=;
 b=kwianK4wN9cuUZtxYWHJ3cD+8GRBjUT9PijcEmiaWbDvSnYO41KI+9Jb
 9dp01TJyCiuUmtEQqb50RkQLj7DEOq/W1pvExWupiFRGW/HQvsR2tX3wK
 Sd80sAhX8HPcDvyGwssRe2UZadjfq52beh8tLJJp+GXcdm3gyoGrHUr0u
 8qr/cp79/gQS77QtFd3QVG/6FQnhzyp6c56XbkKjvFSJX37OTgNXe8+M9
 tPvXzHON99VV/oJUl24giNLVE+k2VR1qm62ZXVIH7Y9/VS+pGUO/psr9e
 h27YMqpsVEljYhSxJxB/kc5U1/yDOSrIBfjq7ulQg+bm+qYPNW45RzJmp g==;
X-CSE-ConnectionGUID: +5NdJ3FrS6y2xv/fpk20Dw==
X-CSE-MsgGUID: dzK8RvzBSBuhCiNKyPDvcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="63948751"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; d="scan'208";a="63948751"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2025 05:46:38 -0700
X-CSE-ConnectionGUID: upCSiZR4SIyRdTnsfVZ4Dg==
X-CSE-MsgGUID: XRt7tNeLSweWoNoOw0e3PA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; d="scan'208";a="181511281"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2025 05:46:38 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 19 Jun 2025 05:46:37 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 19 Jun 2025 05:46:37 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.66)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 19 Jun 2025 05:46:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pC6JqD6ebnIMLtwMDvKWWW+AA/BV7aNQNy/cNIYA+6I7gG8c4s/MmgNXTA1yJuAac62CeVA1Yt5h8t7C3Ke2I8XeGcAO3iqkKoj733MAmLKieh29jBkfpao9r2bLkyHv3BFUl9XBVYYwZo2L/cgn3mdRPJ1A0QwxPMt01VkN523O9nKUNdc6btX+ptxfxLS3wMyMeEz8qO/fxfXXDAbSb6mUVcMwyeMnLIjXtiFRmzyKGhYqukrantznhEEkN+zJgs3MmgGSu5Kyaq4bL/VBasquu+/JEsyz4gCC/H8dbsfUw5SsCMBdzEEBfY2jmYXcNxmKGtcTBna2ESb1kqUmAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jYe3ESonDyAR/8OU7zt5TgB/BkJwe+rhubzhrt2bF54=;
 b=Hnjs/DSbvTluZK1WWSLUoeLpXQqylluBWtn0Gn3uHrcJj12RK9YRhox70Ybqfw4Rhtxu4yXnlJbHdsHY+ixi5cewKV5vqvhNrYLKBiZ+5LvK5Bv75RjkUTykRKREeBP0qGUYjCU2eszMI4W2cUnOM829YJOO+mdbkRqd9LlXbTUOLCzfjB5y0uXwRijOP44JQWiOOF3VXoocHd7uDfszT5IZxvc1Y8Q1Am+GCr6G7zE8D/MtyPnRtutKyWZ3PMN0rLwTEHGHmGYVDyX97BS9+3dhnxYpP0zy01MEZVEbvNoG5r8mqdTtc0GFs2TmLdhyU8cgOtXuOdMb8PsovOjDhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by DS7PR11MB7906.namprd11.prod.outlook.com (2603:10b6:8:ec::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Thu, 19 Jun
 2025 12:46:21 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%5]) with mapi id 15.20.8835.026; Thu, 19 Jun 2025
 12:46:21 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>, "Auld, Matthew"
 <matthew.auld@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH] drm/xe: Grab pending job list lock before resubmit
Thread-Topic: [PATCH] drm/xe: Grab pending job list lock before resubmit
Thread-Index: AQHb35bcmbEx0KeI6UG7u6BNqNiHWLQHdcCAgAABb4CAAvmqoA==
Date: Thu, 19 Jun 2025 12:46:21 +0000
Message-ID: <SJ1PR11MB6204A6F33EF950142803EA7F817DA@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20250617144753.3177952-1-tejas.upadhyay@intel.com>
 <b049cbbb-9941-440c-ae2d-880e4f420511@intel.com>
 <aFGHcaWirKQRDCEi@lstrano-desk.jf.intel.com>
In-Reply-To: <aFGHcaWirKQRDCEi@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|DS7PR11MB7906:EE_
x-ms-office365-filtering-correlation-id: 0d941a38-db23-4864-57a5-08ddaf2f4b1e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?LGIw/goFvM+chGTlRINJztAzWb5bRSDmfoz0TiPC4TtU2SdbIm5AxVl1+fLu?=
 =?us-ascii?Q?MVHjvjzw5EQirjIF3fmrZnWuw/eUGHfYtbG3bdbRcwZT+uksvaLJIXi70l3N?=
 =?us-ascii?Q?uE8mQxaCQQWS8Yw0VP33D5Q5mFZmX/6c5S59zgth6s02J/VLFJWiKIqDUyRz?=
 =?us-ascii?Q?Ig2wTvAo4BpPvYzFZ/2PIlOPZ05a6jAiMXPz9eNpGQecs/ObJPu1rchIi98q?=
 =?us-ascii?Q?JY66FCZw/UnkTL0PxabL5iC0KRm4pIEtS158Bzmj6YId5gg788bLlwjUZpzJ?=
 =?us-ascii?Q?7JP7EArQF+psQ01oIuNS+jHfsOIWxIgEJeYvgfCNGyc/+Ir2VfXyWxiTOKkY?=
 =?us-ascii?Q?HADiKkdjM4KQ9LDq5KOXMxsM6GP8gwxIj06W+mNr9l+kyVxpl1bBNmbUU3G+?=
 =?us-ascii?Q?8f9C0m5oBAAfJTbeR06kn5RZLklWGLDeKgFg1Y1Ed43E6jEzmw7PirJJos3o?=
 =?us-ascii?Q?2YLbSdPCaRx/pZlJDyqntxhojeIYOSfHGZX+QB7cq+TUqYHKWZT562ETXHzO?=
 =?us-ascii?Q?Y8LyxRPpDAAgPN8fmkXCu00YY5Bfkag4uP4cCMRBerIbkV7Nj+dy4ii6IZVw?=
 =?us-ascii?Q?Xu1h5qoOPbeHMQ5Go+21CCZTlJ1VRhSRI6jdlYNWYtXWRmRtwW0Hpv9LLTE1?=
 =?us-ascii?Q?NdyIc3fyL5eimlsmSHuATeyYGEpGrpAnWvHO9iupFwM/xPMGIEoK6fBSX7+F?=
 =?us-ascii?Q?SMPnHgsVCdfhzajjeQpPbM8+L71+bjhOj6ikU1+/swbVXSiP0A6cjfi2635U?=
 =?us-ascii?Q?QI1DR5t+r4ZMatXkCl2Cz44uIsbmWF8NVsdEyrWzsZ4bZ1zOnXiOZyxoUgXa?=
 =?us-ascii?Q?IB72dY9ff7+qOcRvn/w/8lTGHV5eNPId2akuBzFrLowRC2olfTcdxKYLVnYv?=
 =?us-ascii?Q?KQShIHdcxMEnqZ0vpWLJHpMZly3IT+f6J/qjT4szJw7nfl3zGJn2UXzTUQOh?=
 =?us-ascii?Q?qvPq5fbrdgomi0umsKWn56jLb19+kDr1jbMCcTIJfLWHhowyKmEXCsDp1G2y?=
 =?us-ascii?Q?cqR7l8ySdF0qP2YwiJBDpoT6B+ONqXG1t/RTF33MEC63wvnVERskJWmtiNiB?=
 =?us-ascii?Q?30W/n13KLY6vyuK44FUg4OGvZt7uX76jaZnDjwx2SB3iWUspdkbLhR8J8Cvv?=
 =?us-ascii?Q?Yue6TUv1rKXIH0LxyJ4Q8e9lnhT1b2+oEm8QNaD/1VmTcjMVpAavJJhfwCNm?=
 =?us-ascii?Q?jWMJYrj8XYXh3e3Gs916a4w+kLxbdX7RuAYCy3W1eceQ1naHNKO4CWS+8SM8?=
 =?us-ascii?Q?Qod/CKh06tTSQR7ZBwElNWqUVL7rXYTycEMRSenH39NQD5/t1ojsi5fsLVoW?=
 =?us-ascii?Q?l5bpFzPnY7T+8GiAg/d+K/JZjhX9AKCAaRos1/8YIiCSfsD+byfx4tiAJogl?=
 =?us-ascii?Q?FgeX/0g+MFPxZaRK+EEsu74dHVZCmx0hTHdhls9NGp+hnOmtfZHfIrJzbl47?=
 =?us-ascii?Q?xgHigB7EaxyTMZnoEXq3YkY/da0xgzowj0lCAdIkQi8u3Zq3qDvIKWOt0zn7?=
 =?us-ascii?Q?zGostBdJh6EoSeo=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?fvqaLkVhhJjN/sZMaR9pnyfNJ0Te89QUDt/ta/Mr3XuC51SpeGwewtEYoJDQ?=
 =?us-ascii?Q?4gy2kEaZ2oWII1QvoITjYl1lwS0c3f4Tm+u0X1FLeQ2GnAxa4lZGhMOtbQyu?=
 =?us-ascii?Q?hH7Ijmhq1VCmcOXoSEQBmfge0OXHRJfCHqaHx4yvvi8YKsEyxl7kV/sflmhk?=
 =?us-ascii?Q?kCIYfftm15QHyIR3GRVrirvmCDDnP+c2hjSwqwcifv4bfCvbjVjmrX2gWd2b?=
 =?us-ascii?Q?h6qWa6gQQl3GrDPiz8UKx9KqJQDpiwSHCMnjGT3h+Pad/RO9k3CtjrdLXAR+?=
 =?us-ascii?Q?WZcLMRIwbX80rwfTj4vdEK+K69OF4i+AAtI6mrNgxRBVoz+0CS7Km882J66w?=
 =?us-ascii?Q?Nl0Vk2W0gwcKyjxo+HzN3I35D3pHaosrs2BWflBWsAjsxsan2TPzLjdyvPoP?=
 =?us-ascii?Q?X+GaY+Q68kNpgYq2JsH3RMZ6UZr5EECheEsdgIDB8nJw2BeQXxu94aIri1Wi?=
 =?us-ascii?Q?ya2OJbzK0sO+qlOYYrd0C8+FixD+ce7WX4F5k3Y1xDKIQcApD85+cxVcOD+Z?=
 =?us-ascii?Q?O46fziLsCqFnSf4De1J2DRhbiU9xCWuNyQN3dXGW+7BiIagcFxDCyadNOdu1?=
 =?us-ascii?Q?cxRNOoIGmUdacIEIT7soZAQHCKGDp2Tj5w/8NpBifFkKXAAUeSnGZsGcWG5A?=
 =?us-ascii?Q?7RllKfpGVah+2hGkJTj+DC6N+8OiZfn18GLPYNAldrUd/J/vnSmQUipD7FYB?=
 =?us-ascii?Q?U+kM4tK/CiKbxtxNp5quqGWGTyeg7ELRkhsrAs+2itiOGi1PtXAYF5fNjxwS?=
 =?us-ascii?Q?dK7yjjy2touLUAIeLMNiNMyi8qeOWdvk1KxD/bAh9D94cCSVvAcPjaU8AjJ+?=
 =?us-ascii?Q?IrIPdpa2vrsROHdB15Qipbb/sVh3tnp+/iLREjDbykVSLw4/6bt2ewFuYfs+?=
 =?us-ascii?Q?74ijTdRSh93fWzhKSImGQr7p9FtRzhS2o8hgINO8gdEe2vtWFJOgcHgijUMk?=
 =?us-ascii?Q?q8GcldtbCPE90vf8ivmoOnVhfj25FlRAVpHJ1qzhonk843buOGUNr4iwT6yL?=
 =?us-ascii?Q?SuWN7DSRgyichxwP0OJA4WsUYceOlg3T1QqAHzlNS/HGqhzTEDg7MwckcPM4?=
 =?us-ascii?Q?yn1gug34r04aNLKBANgoM6kKldvGQFB/Ph82OlEnBufVdCXHF+n/sQVUNIN6?=
 =?us-ascii?Q?xMPB9GF3tk4E4Pl6WoEKHg7LmB6KiJcLfTsvHj7+FWvRsgoJk0yZY/3EMG4n?=
 =?us-ascii?Q?T/LCmKr4aY7AuT2Jp+n/vJU5rHQYBf5RNR4k9H8SuHikO/+dns0ldQrJpHJy?=
 =?us-ascii?Q?V3DRJz+iVtQrNEIe/I1P9BJTR7oH7wr9m8NtDmV0RNcjQk9Y6m4jb064zzM5?=
 =?us-ascii?Q?omnHjRlvIqo1Hn9bhkl2w24G01j6qRiRjdl7rJL64AnNNf4cByuRdzSHr86X?=
 =?us-ascii?Q?h02cWBvbB3BeveyEA5l9B/YqMSbvTd/CRzfmRS7dKXWyk8t27xFjKo11/fI5?=
 =?us-ascii?Q?mFqjb2neHQp47hh9ISrsTKzAiS7AVnk/LUCPitTNO9uk47UmcAJk1kGXlr6P?=
 =?us-ascii?Q?Q226mZtYRg1Wyd0hWgvGYihjIwW1GmrXtRc5shNPu3aYNtMvwVWOMAI7Wgon?=
 =?us-ascii?Q?eRRlj/RQXx9NBQfNPjzVD7QlxE5ZUJZm16reMXHZ?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d941a38-db23-4864-57a5-08ddaf2f4b1e
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2025 12:46:21.4935 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wWr4jUJFDK/1cPViB9vMPM2ZcefOJA396rs3OIz0+qW32IKL9Q55DamTqdU6oQfYkXNFRnWVVeQKn3FCqQIwrAwFGwb4/rbmjJdnDcdGkfM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7906
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
> Sent: 17 June 2025 20:49
> To: Auld, Matthew <matthew.auld@intel.com>
> Cc: Upadhyay, Tejas <tejas.upadhyay@intel.com>; intel-
> xe@lists.freedesktop.org
> Subject: Re: [PATCH] drm/xe: Grab pending job list lock before resubmit
>=20
> On Tue, Jun 17, 2025 at 04:14:05PM +0100, Matthew Auld wrote:
> > On 17/06/2025 15:47, Tejas Upadhyay wrote:
> > > Pending job list is protected by pending job lock to avoid any
> > > racing thus grab pending job list lock before resubmitting jobs.
> > >
> > > Fixes: 38fafa9f392f ("drm/xe/sched: stop re-submitting signalled
> > > jobs")
> > > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/xe_gpu_scheduler.h | 2 ++
> > >   1 file changed, 2 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> > > b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> > > index 308061f0cf37..dfdb409da6ba 100644
> > > --- a/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> > > +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> > > @@ -53,6 +53,7 @@ static inline void xe_sched_resubmit_jobs(struct
> xe_gpu_scheduler *sched)
> > >   {
> > >   	struct drm_sched_job *s_job;
> > > +	spin_lock(&sched->base.job_list_lock);
> > >   	list_for_each_entry(s_job, &sched->base.pending_list, list) {
> > >   		struct drm_sched_fence *s_fence =3D s_job->s_fence;
> > >   		struct dma_fence *hw_fence =3D s_fence->parent; @@ -60,6
> +61,7 @@
> > > static inline void xe_sched_resubmit_jobs(struct xe_gpu_scheduler *sc=
hed)
> > >   		if (hw_fence && !dma_fence_is_signaled(hw_fence))
> > >   			sched->base.ops->run_job(s_job);
> >
> > Is this fixing a real issue? There is a sleeping lock and maybe other
> > nasties in run_job() AFAICT, so I don't think this will work as-is,
> > but I don't believe we need this, since sched should be stopped at
> > this point, so nothing else should be modifying pending_list until we
> > start it back up, which is only later?
> >
>=20
> Matt Auld is right - the scheduler is stopped here so AFIAK it should wor=
k
> without &sched->base.job_list_lock lock. This patch itself won't work as
> run_job can grab the CT mutex which lock would not be happy about (i.e., =
you
> cannot hold an non-sleeping lock and then take a sleeping lock).
>=20
> I'd vote for just dropping this patch.

Alright. Did not think it was scheduler stopped here. Thanks for comments. =
Dropping the patch.

Tejas
>=20
> Matt
>=20
> > >   	}
> > > +	spin_unlock(&sched->base.job_list_lock);
> > >   }
> > >   static inline bool
> >
