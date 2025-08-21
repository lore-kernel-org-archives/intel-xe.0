Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B03ECA0EFA
	for <intel-xe@archiver.kernel.org>; Thu, 21 Aug 2025 23:35:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2CA310E065;
	Thu, 21 Aug 2025 23:35:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UYy11yy6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B994F10E065
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Aug 2025 23:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755819303; x=1787355303;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=epXCFvAmodxynDTpp8Tn2NUy3qwDTs8kP6sM33ed3xg=;
 b=UYy11yy6lGPa0cDBjp7r+G6X+TDc85XUFFOYDytBDIL/o0Qw57kpm3Gs
 BPixmZxepBVWiSpacRQEbX8QtAIlWaQsxoFRfQCni3GdtVMSea1mgVcDv
 1wCF5kc/JoltvTKlPHUtrYZsrIo/FrVF+qL5s3S8gSSTES8dhIPd5DVcO
 k40VT6+Z8MOmfF0P5gQSIJleK4+2ZLj0BqNTSOXiN0TIwFP4CSry4g8bf
 fZegDKWWOCg2roZHC1JJr7+iZEWA2i0MQKcCT30nCNKH0aSyeXnwmCyGT
 MNlz98nNjkVQfNzrFweXSYDX5BaZsdjzo7aRocC7DgIPSAdbcRD2LznKe A==;
X-CSE-ConnectionGUID: BXwv1EdjREmKGQabQHlBVw==
X-CSE-MsgGUID: UQ2tQMdeTYePueefnqKyUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="69561570"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="69561570"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2025 16:35:02 -0700
X-CSE-ConnectionGUID: jnx3h8yVQrWUQhGaWPkUnw==
X-CSE-MsgGUID: HOhU+V9SQtep46frcGuqvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="172808656"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2025 16:35:02 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 21 Aug 2025 16:35:01 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 21 Aug 2025 16:35:01 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.58) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 21 Aug 2025 16:35:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yYvD4hUL57eV60ZRH2EadkiP5QaB7usXrhs4eTxfzTvknPGl6B27ehC7GII7bKOoJPvqPVBpoMtB7ITkSR50aC+610mT2olTmeXjkBx2HZl/9NWeJvfiIT/RJNIN4K4IPkpdf4PmRb0LSQUmte1Bf96yfSMT0AS5vi693KjI/cLpMHbMjY+Bbo4EcuO4UUBwH1f5e/yjW0732aBXgurSc1IT1E6wYw/nW3DUi/bItipiW3kVF+doxm6wL/vjQbXAintSC6QN5AJa4/0YO7wLlGD5bJY/ebJX+X+kCaRInx6dvAYC0e2HN8a2lORogPCTM+Y+JwGWjP8Nv2hUNr41/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=epXCFvAmodxynDTpp8Tn2NUy3qwDTs8kP6sM33ed3xg=;
 b=nsrX6RZGVuETXtfD8fpcyuTM5n1TJnMaQLrHsqzDO7/BXR6K++a8v02HpisBKjxdDA9UfGEbiRohaNvKbFUZxbOM2b/iT6udUML8PgR891KmvbBzPXLJ67G4owjuuTSlrzBlyPznQOv28oKsohatpiXAJJZObf3P4YEJYc3Q6iXWbNKPmGmNcGXC6YjXXt4AXNbO7T09qqc4ujUq64BWeiyQpFh69tMhykA9XeTGUW/3GWNksHuB4rgNP7YkXfShJf6Bppas4HyPPT9uPhOVINAOWft1a1M+UWRF0RmkTcbCxk7WLXU8x3q/RWXb6wImiMfDtlLJWK9qbR8TKOp+ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 BL3PR11MB6436.namprd11.prod.outlook.com (2603:10b6:208:3bc::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.14; Thu, 21 Aug
 2025 23:34:54 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%3]) with mapi id 15.20.9052.014; Thu, 21 Aug 2025
 23:34:53 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Kassabri, Farah" <farah.kassabri@intel.com>
Subject: Re: [PATCH 2/9] drm/xe: Cancel pending TLB inval workers on teardown
Thread-Topic: [PATCH 2/9] drm/xe: Cancel pending TLB inval workers on teardown
Thread-Index: AQHcEiqCOSd3Xnn8PU2dwjpLxyYn0bRtrTwAgAAWzgA=
Date: Thu, 21 Aug 2025 23:34:53 +0000
Message-ID: <ea0fcf8ee5cc8eb3f78836538e5fa9517a580077.camel@intel.com>
References: <20250820233057.83894-1-stuart.summers@intel.com>
 <20250820233057.83894-3-stuart.summers@intel.com>
 <aKeZ+JZ3j6hm1vR1@lstrano-desk.jf.intel.com>
In-Reply-To: <aKeZ+JZ3j6hm1vR1@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|BL3PR11MB6436:EE_
x-ms-office365-filtering-correlation-id: b3bf22e3-f242-46be-8469-08dde10b5466
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?NVMrM1IreG5FUWI4UURScHlxWWFpYnFjVEhsMDloV2JjZTkrakJDeUdFUW5n?=
 =?utf-8?B?OThGNVQ5Y1JCV0lCSlFudVpJa1pYSnZOdGdBeGlxZmR5Y2RLNUp0VWtPOVU4?=
 =?utf-8?B?TDgyMkhBNm01Uy9RM21JWVpxaVRGS0ZxTmZrQktYLzlHWHhvRDdPZHlqNjVt?=
 =?utf-8?B?VUlncmxkY2drUzExem1Uamx1RXFTK1JGaUlMVFM3bUx4RHRhWnE2SGE1RUQz?=
 =?utf-8?B?MGk3WUxWVUlVTUNocHFRNmRITXBMUVhZRStDc1hOOTFpc2hBZjZuaHN5akNB?=
 =?utf-8?B?ZExreWxWSHpEcHQyL1d6QWRhUmNWK0ZFK1Z1SUJhMTBlMkE1WENlOXVwVFNr?=
 =?utf-8?B?OHRidzNndi9qNzZTaTYzYzVoYTgwSk5sUFBlb2lkZGt6VEd4a3hENy80T0k4?=
 =?utf-8?B?Y0d5ZmpBZ21nYXh1dkhtSXIxa3F6YUw3dVJRbnVCNnI4Y2hTT2ZCVVNTdy9R?=
 =?utf-8?B?VWlLMkY2YnB3TDZWL0J2a1NwY1p1T0cwUkpGUHZCN1JVSjFONExUdldwZUVi?=
 =?utf-8?B?b2RzVGVUTklpMllIZnJqU1l0aE0wa2V1MTlYYm9yN1N6NGZGSmRGZjZZaWpG?=
 =?utf-8?B?eTZOcUZkZWMvKytpWjN0dmsxdnFBUG1hOEdUdzRLMWs0emxaa0h6bzVxaTY5?=
 =?utf-8?B?ZzNiTHFnaW5CVUFhaGV5NTJvUDZERjh3OXFLUXJMdm5BOUhST2w0QXFaVmVa?=
 =?utf-8?B?UlFsUUZtSFJQRW10UHY3OXpMeFlwUVlocGNGWThZYkIzajVvS1krdlRSZWpK?=
 =?utf-8?B?am9nUTNKci8venI1KzBSNVkvaE5iRHFtdlRydFJOV2FsbTdjV1R4MUZyNVVx?=
 =?utf-8?B?MjZVQXdtemVaakQ0cC9xa1d1cHpOTXJjcVpjTzltZTdVRGhLZnpJSGpFRUdu?=
 =?utf-8?B?UXROeDNMWDE4dWZQLzVBd0NFNVNnZU9CM2c2dll4N0YxcVZXMkVVTlhIb0hm?=
 =?utf-8?B?Yk12ai9WZU9LeFVEYnM3K2ZabXdKR1BhY1M1b2NoL1ZiRy92Lzc2V2I1RE1W?=
 =?utf-8?B?aUFRT3hGeXZQU21lbXpRYkViU3FyQzBlQ1YvOENGbjl6NDJtSWRrSnBnNTA0?=
 =?utf-8?B?bWIwS09Lc21SOFdjOEZodUJoUWdBYlhFamZKZVl6aU16UUEvUEJadlF0TXhH?=
 =?utf-8?B?TDU1cnBkOHlTU3V6M05GOVJxemUxOWdDRjNrMXRzQ3hWdkE1SEVBLy9sRm1F?=
 =?utf-8?B?Qmt2V3ZJd3N5YzRZQmltU1VoUUVxTVBRUGVJQmRnVFVaVEdRSndNdTBpajBo?=
 =?utf-8?B?ZkJIS3FzVE0ycDg0RVFFQXhlbTZpb1ZTQ3U3SFd4b2wrUXFrWlVPdGI1dEF4?=
 =?utf-8?B?bVdtSG0rL0tvT0czalhJd2F4TWVFaWpUcUR4KysxaEpBbUMvQytJMThNeXE1?=
 =?utf-8?B?Z3h3emF1Y29UR2Rua1JXWGUwcWxIcDAvTkJBYnBWUWtyZmtqd2dNSG5zaFdx?=
 =?utf-8?B?QlFOdVJQNEhNZEFweWZCWFJtY0p0WjFCU1VVQ0I2VzhLd1BPaU1WY0l0QVgr?=
 =?utf-8?B?YWtaRTdnelZndWpoWFk0STZWVWNUUkU5YWR3Rlo5UnBqT29OdCtPR0ttSFU4?=
 =?utf-8?B?YkloRDFINDhXclJMcGJyR1diNTdtdGFiSFRDdjRyWENGc0pkaHozbE51cEtn?=
 =?utf-8?B?aVJKcEZ5Y2tjWXUvQUMyTTZMd1QyU3VONWF0QkYzMGpGRUhvaTd0TGx3TXM3?=
 =?utf-8?B?S2tOWGhyU3MvMG1sTmh5cGYzeHpIT3U2S2ovWC9IVFI5Q3B1Q253VmJhclRp?=
 =?utf-8?B?ZXB6YlgrWm05VmY5YTlnNURpeHVnRkZmNmNHVEhOcU5aUXZqUGs4ZHlsb3Uw?=
 =?utf-8?B?SFVUdVUyMVczSjMweG5uMjVGTEVwMDZPSmN1OXM2dFVlbVg4SjI3Sy9maVEx?=
 =?utf-8?B?aGF1b05DQ2lKZENLZGJaK2d3SWwvakFTY01nb3RXUlZDYVVmRW54bU40b2s4?=
 =?utf-8?B?blJZVWNtZkwwQmR5SnJzRFdDc3Q2UTNIRDdWNmhFZ0JHYTZaZG4zMEZUYmU1?=
 =?utf-8?Q?JqnKjvFVNmRzDK1IZqpHG/YdQiZDPg=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y0RsbEk4NDhYSnZNTU91ZTkrWGI3ZGgxL3I2YTk1YzhuRWxSRWVZb0JaZWxp?=
 =?utf-8?B?a0tvTkFNWjdEdm5iSE03SlB2Tlo5WWhFMnQ4K21zaXkxRFI5M0t3eUk2cm0r?=
 =?utf-8?B?aFlvSFVMT0pXUmtmU1dUN0hFYklOWXlrTHoyLzNrTW9kQ0k3cloxVDJZalF6?=
 =?utf-8?B?UVBnRTJCeG5mQjBBdjBkODJ2d3JuNVI0bWpkeSttZmpWUjFqQjluYlk5bkhV?=
 =?utf-8?B?cWN0dTNhaHFBbUNXZGxPMStVSGRwdlhtZFBVMTVUVGNLSnE0WGE4U3UrUWxZ?=
 =?utf-8?B?MzQwc1BCY2ZIK2ltbnJRVTg0M1M5NWZab2tRcjJQT01nWVhhbUlCblVJR2hW?=
 =?utf-8?B?dlJFakg0MkhxSTZhWW5Eb0RlWFUrSXhkbmdjUFJvaFU1WXFpWUtGZ0x5VWky?=
 =?utf-8?B?ekI2WHJTZHoyc2l2OUNRYzhMYXRLa1hadDBMMDlxdGkwVy9LY0kram5SSmhZ?=
 =?utf-8?B?SG1LQlg4blp3eEl4cENLL3lTUHo2RkVDSjZQRDBtcWJaVWRzSk1ZMXlxNkpk?=
 =?utf-8?B?UmIwTTd5MHpYS2cwU1lGMjg5YnluKzdkZUlyM1RoTnk0dHFrRjVEaGkyQWFG?=
 =?utf-8?B?UVdiTmtYYi9udG5KNElBK3l4SzI4RDhHb0xxaFVZUmR2Rit5QXhTWFZjNFkw?=
 =?utf-8?B?LzgyTG5xUmorTTlHaWFPUDEwcUZ6Yk1LNGNjN2NtaGt1VzRuQlo2SnN0NTlI?=
 =?utf-8?B?OEVpOWZac2tMSWhaeGJBMSs3d0FocFpQcmJRM2dLamZQdEp3U0RPcmNmbzNY?=
 =?utf-8?B?WFFGVjIyYUFML290UnZDU3VsN1kxNnRXaUo4dWxjaVVxdU8xd291SFBMWXNV?=
 =?utf-8?B?WTYzemh4WFFLb2dJS3FXdXhDS3d0Sjd1SWU5STY2K2dVOHBHRjYydVIyK3F2?=
 =?utf-8?B?RGtLR25QcXFNVmJoRmtVa1pTYXdHQ3U2dG9xSm5Cc29EWEdRUmg5QmtabkZj?=
 =?utf-8?B?OGl4dUp6elQ3US8zWUlERW0xblZ2SXZJaGV1QjJ3dlhhcTgxTnZCS1BQUzNu?=
 =?utf-8?B?Sm1NZkVadUQvTHFHOHM0VHdKa3dPNDR3SEFOSm9jMWtXUTF0QnVDMVFhTWlx?=
 =?utf-8?B?cnF4aEVXU1RONVQ3enVYdVk3WFY4UTM1WmV6QVk1d2JROVBMR0JtTjREbVJI?=
 =?utf-8?B?Z0swM1E1Z05NS1NOTmZSMFAxUERxL1p1ekNEOUJJNkkrcVdHY1VHOFpSZWNr?=
 =?utf-8?B?eTZoTUpKZUhjT2RjTVJmNFhubnBqcjhnZVNOOCs0Tk1EblR5UHBOSHpwV1NY?=
 =?utf-8?B?NnMzdG8zdWFjOTFXekxpWURETEM2dnVhZ2ZmMXk5THBCaTVxWjdSRFFKOEcr?=
 =?utf-8?B?Y0I5ZHJuYVBrU3RWYlpRWEpBWElDS0dTN2ZCVStaWGlvUVl3WVF5YVB6UzNm?=
 =?utf-8?B?Q2hVV21xYmU3c2FLYjNJRmFMQWZpdURXU0haNElGVVJZbEhRQ05XekxxZGhN?=
 =?utf-8?B?c3BJa2puanFkUzRwSTFxNGpLdnM4Nk9UQ2tNYzVIaW9Ma3JvY1RjbkpzeTM3?=
 =?utf-8?B?UTlnaTdoTlVGeExTdTZRMUNIUjRBSGVUdmVtbGNDTnVvOXA5N3pJeWpESlFK?=
 =?utf-8?B?Q3VHNE1aSk9IYTdvMHhma0F2SHRhdkNkRWFqNTdHYVV6VEFCNDFTNTBPcU9H?=
 =?utf-8?B?L1M5dnBISmx5eU5xWndEQnpSV0RNNkhJTXVTOTg0K3JGTTZraHFpVnNhYTM2?=
 =?utf-8?B?YUVwN0ppeCtyWGJNYStWYXB1YVp5Qnd2RGVVUFlXSlM4TDNReHZ4Zy95bms3?=
 =?utf-8?B?MVhnbFNEclBIU3B0aEVoZW5FbGNDK0l6allpYnA2bDNDVmRkWC9XWXRsbTg1?=
 =?utf-8?B?RUdoTVA1U01rMVRQbFhNWlI5NE1lalIzRnZwMHlsaWtKZXdRWVRpWkZ0cENv?=
 =?utf-8?B?a0RTdk1COUIvRHovUGJZZWtzV1ZFWXEwMUlqTEdxc0FkaVBXdGZmS3Y5bVFT?=
 =?utf-8?B?REIxV3gxMTJUQThRUytPZnZiUW5TWkFyamx0YkJraHBiRHBnTTZwdGdxaFpH?=
 =?utf-8?B?NXBpVjFBd0RsUkxMaFAzMGwrZU5DYU9Ea29iNVZwcWZ5ZGQwTkJQMDhsMVNv?=
 =?utf-8?B?QnVyNmJlK2NXZ3BhblZRYW51dnVqcm95VHQxVGhCS1Y1SlVoQkExSHI2dWdW?=
 =?utf-8?B?N2FwMEhDNER5VUFwcE5OTzhNR1VoMDd4WGJyaUJpVDFYQk5hNEdjVFRLRDg1?=
 =?utf-8?B?Q3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <80D09D327881B14BAFFF30E9E5D36E6C@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3bf22e3-f242-46be-8469-08dde10b5466
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2025 23:34:53.2850 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8BqDaQjdY/TadvVDR26bks9o9Y8qrF75cQAk6puZ1v4p1luc75/EgKJMmu4z6IBwapN0DVaLsJ9k6Hy0ZpPOS9NmH3TuF3pMfJn2YJ8jQp0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6436
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

T24gVGh1LCAyMDI1LTA4LTIxIGF0IDE1OjEzIC0wNzAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOg0K
PiBPbiBXZWQsIEF1ZyAyMCwgMjAyNSBhdCAxMTozMDo1MFBNICswMDAwLCBTdHVhcnQgU3VtbWVy
cyB3cm90ZToNCj4gPiBUaGVyZSBpcyBhIHNtYWxsIHdpbmRvdyBvZiB0aW1lIGR1cmluZyB0aGUg
ZHJpdmVyIHRlYXJkb3duIHdoZXJlDQo+ID4gdGhlIFRMQiBpbnZhbGlkYXRpb24gZmVuY2UtPmd0
IGlzIHNldCB0byBOVUxMIGJ1dCBhbiBpbnZhbGlkYXRpb24NCj4gPiB3b3JrZXIgaXMgc3RpbGwg
YWxpdmUuIFRoaXMgd29uJ3QgY2F1c2UgYW4gaXNzdWUgY3VycmVudGx5IGJlY2F1c2UNCj4gPiB0
aGUgdGxiX2ludmFsaWRhdGlvbiBzdHJ1Y3R1cmUgaXRzZWxmIGlzIHN0aWxsIHByZXNlbnQuIEhv
d2V2ZXIgYXMNCj4gPiBwYXJ0IG9mIGEgZnV0dXJlIHJlZmFjdG9yLCB3ZSBhcmUgbG9va2luZyB0
byBzcGxpdCB0aGF0IHN0cnVjdHVyZQ0KPiA+IG91dC4gVG8gYmUgc2FmZSwgZ28gYWhlYWQgYW5k
IGNhbmNlbCBhbnkgb3V0c3RhbmRpbmcgVExCDQo+ID4gaW52YWxpZGF0aW9uDQo+ID4gZmVuY2Ug
d29ya2VyIHRocmVhZCBvbiBfZmluaSgpIHNpbmNlIGF0IHRoYXQgdGltZSB3ZSBhcmUgYWxyZWFk
eQ0KPiA+IHRlYXJpbmcgZG93biB0aGUgZHJpdmVyd29ya2VyIHRocmVhZCBvbiBfZmluaSgpIHNp
bmNlIGF0IHRoYXQgdGltZQ0KPiA+IHdlDQo+ID4gYXJlIGFscmVhZHkgdGVhcmluZyBkb3duIHRo
ZSBkcml2ZXIgYW5kIGRvbid0IG5lZWQgdG8gY29udGludWUNCj4gPiBtb25pdG9yaW5nIHRoaXMu
DQo+ID4gDQo+ID4gQWRkIGEgbmV3IF9maW5pKCkgcm91dGluZSBvbiB0aGUgR1QgVExCIGludmFs
aWRhdGlvbg0KPiA+IHNpZGUgdG8gaGFuZGxlIHRoaXMgd29ya2VyIGNsZWFudXAgb24gZHJpdmVy
IHRlYXJkb3duLg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IFN0dWFydCBTdW1tZXJzIDxzdHVh
cnQuc3VtbWVyc0BpbnRlbC5jb20+DQo+ID4gLS0tDQo+ID4gwqBkcml2ZXJzL2dwdS9kcm0veGUv
eGVfZ3QuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDIgKysNCj4gPiDC
oGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF90bGJfaW52YWxpZGF0aW9uLmMgfCAyMQ0KPiA+ICsr
KysrKysrKysrKysrKysrKysrKw0KPiA+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X3RsYl9p
bnZhbGlkYXRpb24uaCB8wqAgMSArDQo+ID4gwqAzIGZpbGVzIGNoYW5nZWQsIDI0IGluc2VydGlv
bnMoKykNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0LmMN
Cj4gPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndC5jDQo+ID4gaW5kZXggYTMzOTdmMDRhYmNj
Li5iYmYzZjRkYTdmNTQgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0
LmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3QuYw0KPiA+IEBAIC02OSw2ICs2
OSw4IEBAIHN0YXRpYyB2b2lkIGd0X2Zpbmkoc3RydWN0IGRybV9kZXZpY2UgKmRybSwgdm9pZA0K
PiA+ICphcmcpDQo+ID4gwqB7DQo+ID4gwqDCoMKgwqDCoMKgwqDCoHN0cnVjdCB4ZV9ndCAqZ3Qg
PSBhcmc7DQo+ID4gwqANCj4gPiArwqDCoMKgwqDCoMKgwqB4ZV9ndF90bGJfaW52YWxpZGF0aW9u
X2ZpbmkoZ3QpOw0KPiA+ICsNCj4gPiDCoMKgwqDCoMKgwqDCoMKgZGVzdHJveV93b3JrcXVldWUo
Z3QtPm9yZGVyZWRfd3EpOw0KPiA+IMKgfQ0KPiA+IMKgDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS94ZS94ZV9ndF90bGJfaW52YWxpZGF0aW9uLmMNCj4gPiBiL2RyaXZlcnMvZ3B1
L2RybS94ZS94ZV9ndF90bGJfaW52YWxpZGF0aW9uLmMNCj4gPiBpbmRleCA3NTg1NGI5NjNkNjYu
LjE3MGY2Yzk3MjY4ZiAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3Rf
dGxiX2ludmFsaWRhdGlvbi5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X3Rs
Yl9pbnZhbGlkYXRpb24uYw0KPiA+IEBAIC0xODgsNiArMTg4LDI3IEBAIHZvaWQgeGVfZ3RfdGxi
X2ludmFsaWRhdGlvbl9yZXNldChzdHJ1Y3QgeGVfZ3QNCj4gPiAqZ3QpDQo+ID4gwqDCoMKgwqDC
oMKgwqDCoG11dGV4X3VubG9jaygmZ3QtPnRsYl9pbnZhbGlkYXRpb24uc2Vxbm9fbG9jayk7DQo+
ID4gwqB9DQo+ID4gwqANCj4gPiArLyoqDQo+ID4gKyAqDQo+ID4gKyAqIHhlX2d0X3RsYl9pbnZh
bGlkYXRpb25fZmluaSAtIENsZWFuIHVwIEdUIFRMQiBpbnZhbGlkYXRpb24NCj4gPiBzdGF0ZQ0K
PiA+ICsgKg0KPiA+ICsgKiBDYW5jZWwgcGVuZGluZyBmZW5jZSB3b3JrZXJzIGFuZCBjbGVhbiB1
cCBhbnkgYWRkaXRpb25hbA0KPiA+ICsgKiBHVCBUTEIgaW52YWxpZGF0aW9uIHN0YXRlLg0KPiA+
ICsgKi8NCj4gPiArdm9pZCB4ZV9ndF90bGJfaW52YWxpZGF0aW9uX2Zpbmkoc3RydWN0IHhlX2d0
ICpndCkNCj4gPiArew0KPiA+ICvCoMKgwqDCoMKgwqDCoC8qDQo+ID4gK8KgwqDCoMKgwqDCoMKg
ICogQXQgdGhpcyBwb2ludCwgd2UgZXhwZWN0IGFueSBvdXRzdGFuZGluZyBUTEINCj4gPiB0cmFu
c2FjdGlvbnMNCj4gPiArwqDCoMKgwqDCoMKgwqAgKiB0byBzdGlsbCBzaWduYWwgdGhyb3VnaCB0
aGUgbm9ybWFsIGNoYW5uZWxzIG9mDQo+ID4gaW50ZXJydXB0cw0KPiA+ICvCoMKgwqDCoMKgwqDC
oCAqIG9yIE1NSU8gcG9sbGluZyB1cGRhdGVzLCBldGMuIFRoZXJlIGNvdWxkIGJlIHNvbWUNCj4g
PiB3b3JrZXJzDQo+ID4gK8KgwqDCoMKgwqDCoMKgICogdHJpZ2dlcmVkIGFzIGEgcmVzdWx0IG9m
IHRpbWVvdXRzIGluIHRob3NlIGNoYW5uZWxzLA0KPiA+IHRob3VnaCwNCj4gPiArwqDCoMKgwqDC
oMKgwqAgKiB0aGF0IHdlIHdhbnQgdG8gbWFrZSBzdXJlIGdldCBjbGVhbmVkIHVwIGR1cmluZyBh
bg0KPiA+IHVuYmluZC4NCj4gPiArwqDCoMKgwqDCoMKgwqAgKiBTbyBoZXJlLCBjYW5jZWwgdGhl
IGRlbGF5ZWQgd29yaywgYnV0IGxldCB0aGUgbm9ybWFsDQo+ID4gZmVuY2UNCj4gPiArwqDCoMKg
wqDCoMKgwqAgKiBzaWduYWxpbmcgaGFuZGxlIHRoZSByZXN0Lg0KPiA+ICvCoMKgwqDCoMKgwqDC
oCAqLw0KPiANCj4gWW91IHNob3VsZCBhc3NlcnQgdGhpcyBpcyB0cnVlIHRoZW4sIGUuZy4sIHRo
ZSBwZW5kaW5nIGxpc3QgaXMgZW1wdHkuDQoNClRoZSBwcm9ibGVtIGlzIHRoaXMgc2VlbXMgYSBs
aXR0bGUgcmFjZXkuIEkgZG9uJ3QgdGhpbmsgd2UgY2FuDQpndWFyYW50ZWUgdGhhdCB0aGUgcmVz
cG9uc2VzIGFyZSBiYWNrIGZyb20gR3VDIGJ5IHRoZSB0aW1lIHdlIGhpdCB0aGlzDQpfZmluaSgp
IHJvdXRpbmUuDQoNCj4gDQo+IEkgaGF2ZW4ndCBjaGVja2VkIGJ1dCBsYXRlciBpbiB0aGUgc2Vy
aWVzIHdoZW4gd2UgbW92ZSB0aGlzIHRvIGFuDQo+IGVtYmVkZGVkIHN0cnVjdCwgaXMgdGhlIGZp
bmkgb3duZWQgYnkgdGxiX2ludmFsIGxheWVyIChpLmUuLCBpdCBoYXMNCj4gaXRzDQo+IG93biBk
cm1tIG9yIGRldm0gZmluaSBoYW5kbGVyKT8gVGhhdCB3b3VsZCBiZSBhIGJldHRlciBwbGFjZW1l
bnQgSU1PLg0KDQpPaCBzb3JyeSBJIHNob3VsZCBoYXZlIGJlZW4gbW9yZSBjbGVhciBpbiB0aGUg
Y292ZXIgbGV0dGVyLiBZZXMgSSBhbQ0KZG9pbmcgdGhhdCwgYnV0IEkgdGhvdWdodCBpdCBiZXN0
IHRvIGZpeCB0aGlzIGluZGVwZW5kZW50bHkgZmlyc3QuIEF0DQp0aGUgdGltZSB0aGlzIHNlcmll
cyBzdGFydHMsIHdlIGRvbid0IGhhdmUgYSBnb29kIHBsYWNlIHRvIGluamVjdCBhIG5ldw0KZHJt
bSBmaW5pIGhhbmRsZXIuIEkgbW9kaWZ5IHRoaXMgcGF0aCBsYXRlciBpbiB0aGlzIHNlcmllcyB0
byBkbw0KZXhhY3RseSB0aGF0IChyZW1vdmUgdGhlIGNhbGwgZnJvbSBndF9maW5pKCkgYW5kIGFk
ZCBpdCB0byBhIG5ldw0KdGxiX2ZpbmkoKSB0aGF0IGdldHMgY2FsbGVkIHZpYSB0aGUgZHJtIGxh
eWVyKS4NCg0KVGhhbmtzLA0KU3R1YXJ0DQoNCj4gDQo+IE1hdHQNCj4gDQo+ID4gK8KgwqDCoMKg
wqDCoMKgY2FuY2VsX2RlbGF5ZWRfd29yaygmZ3QtPnRsYl9pbnZhbGlkYXRpb24uZmVuY2VfdGRy
KTsNCj4gPiArfQ0KPiA+ICsNCj4gPiDCoHN0YXRpYyBib29sIHRsYl9pbnZhbGlkYXRpb25fc2Vx
bm9fcGFzdChzdHJ1Y3QgeGVfZ3QgKmd0LCBpbnQNCj4gPiBzZXFubykNCj4gPiDCoHsNCj4gPiDC
oMKgwqDCoMKgwqDCoMKgaW50IHNlcW5vX3JlY3YgPSBSRUFEX09OQ0UoZ3QtDQo+ID4gPnRsYl9p
bnZhbGlkYXRpb24uc2Vxbm9fcmVjdik7DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9ndF90bGJfaW52YWxpZGF0aW9uLmgNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94
ZV9ndF90bGJfaW52YWxpZGF0aW9uLmgNCj4gPiBpbmRleCBmN2YwZjJlYWY0YjUuLjNlNGNmZjM5
MjJkNiAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3RfdGxiX2ludmFs
aWRhdGlvbi5oDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X3RsYl9pbnZhbGlk
YXRpb24uaA0KPiA+IEBAIC0xNiw2ICsxNiw3IEBAIHN0cnVjdCB4ZV92bTsNCj4gPiDCoHN0cnVj
dCB4ZV92bWE7DQo+ID4gwqANCj4gPiDCoGludCB4ZV9ndF90bGJfaW52YWxpZGF0aW9uX2luaXRf
ZWFybHkoc3RydWN0IHhlX2d0ICpndCk7DQo+ID4gK3ZvaWQgeGVfZ3RfdGxiX2ludmFsaWRhdGlv
bl9maW5pKHN0cnVjdCB4ZV9ndCAqZ3QpOw0KPiA+IMKgDQo+ID4gwqB2b2lkIHhlX2d0X3RsYl9p
bnZhbGlkYXRpb25fcmVzZXQoc3RydWN0IHhlX2d0ICpndCk7DQo+ID4gwqBpbnQgeGVfZ3RfdGxi
X2ludmFsaWRhdGlvbl9nZ3R0KHN0cnVjdCB4ZV9ndCAqZ3QpOw0KPiA+IC0tIA0KPiA+IDIuMzQu
MQ0KPiA+IA0KDQo=
