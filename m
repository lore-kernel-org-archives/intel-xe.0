Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ECA1CA5FB7
	for <intel-xe@archiver.kernel.org>; Tue, 20 Jan 2026 17:23:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1124C10E639;
	Tue, 20 Jan 2026 17:23:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UIdVdDuP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5220810E639
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Jan 2026 17:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768929821; x=1800465821;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Ho1E32Igb25LGIgQJtqYY3q01tXpjCbLF4WN2yLH0/I=;
 b=UIdVdDuPe1z8rDn+tQ/6Xv+M7PJRL5PXoCjpjU8BgkC+oi4gR0ep/Fle
 8rRg4bQXPaqqaO3kntV3Mhr4LQF+XcCvWRetMHnnun0KnINXpdNqWIoFS
 fhwqkeNB4oSDiB1C6tpBSYHfcW+DEoVx3eT+jaJkxoXA08DLXl5o5p7l0
 lGf66a18owpanbVxBQ+6VCt3c4EymebdcIpBp57bzDBp8RT8qjEEfFd+H
 WQ9jO6nsCMltTAEh7VWkhtUXLyeU2c/A86XZJz7WiIQ5THe4F6qlX3tzt
 1/vhzBDzE+JttpFCxbp8f5CapPNfk0x4bfO3GWsExIdigO988zEUYdo0q w==;
X-CSE-ConnectionGUID: YJBpppLoQL+OalX4Dqv9EA==
X-CSE-MsgGUID: n5pTUvBsRuqUe49QXLTXlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="69162759"
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="69162759"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 09:23:41 -0800
X-CSE-ConnectionGUID: HMqYxf+MRTiS1fvc76M52g==
X-CSE-MsgGUID: eXSfVt1/R/6HN35P0ZdAsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="211044259"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 09:23:40 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 09:23:39 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 20 Jan 2026 09:23:39 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.47) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 09:23:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tKpm43+Lo6k6x64ont+5a7gpIc8qCCr74AKLuHM5pH0LBApQ1pLWZf5Wy6E+HjmaWSLPxSUqebIMjdl2Gfgznfka5Caqx7ZGwcXiZoHK63TEvkIRz//P89O+gy+Z42SCTfP+PgyeBn7P+DJExkPqB7ZXTbSngZsZ5MuL1xpdUEoadWfPRx4AHrEfi3r1m/U6urpxnfxrdo7onrcZ4zQuGe5Ca3ZeE+9MT2foddS7bA6PmdqhZHLmld1opepa76xh5I25IQagoEm+9noxqHfEKpjtQoAjx4+ffpTl8hnpQC+tHL0XzOrUXoXBE1T5tuDbMJEt9b9aVR23d5ECG9nomg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L14zrvQaA+RWtpkXxfhYUXSFELD3RtzpF+Wj6hfeErU=;
 b=dRYFRs7voPNxuAhIOb2Ujh32ImjfDKEW4+jLaEywq04PnD/b5UJvQWLr6b5Yhnlse5yfoOeoOjzKuWnSPYNqhMCR/5+TXGYKch4Qn1aYyJkvCqRts1pgkNu3Ls3EoZOm2z01WORuqL9XCaYu0Lm6Sn30rh1PEg7O0QDvexx1g8dmFUUDmHsM6YGkSFP/TBCKv8er9YSPhC73svfhHxT+7DAqKmAk3Pz9+5JliZY/CqBkW6VuIV7NcnhGdVWimjUoM4IeOuhrovD0Ev2Q50UuvpeV+lS1PWWCAM9iYR57EdzSQPGG66vmmGoNXejZH4ztnRto9rrIFI+98NYJzasE5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY8PR11MB7825.namprd11.prod.outlook.com (2603:10b6:930:71::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 17:23:37 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9456.015; Tue, 20 Jan 2026
 17:23:37 +0000
Date: Tue, 20 Jan 2026 09:23:34 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Arvind Yadav <arvind.yadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <pallavi.mishra@intel.com>
Subject: Re: [PATCH v4 4/8] drm/xe/bo: Handle CPU faults on purged buffer
 objects
Message-ID: <aW+6FnjVuHlE6XSc@lstrano-desk.jf.intel.com>
References: <20260120060900.3137984-1-arvind.yadav@intel.com>
 <20260120060900.3137984-5-arvind.yadav@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260120060900.3137984-5-arvind.yadav@intel.com>
X-ClientProxiedBy: MW4P221CA0003.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::8) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY8PR11MB7825:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c6f6fdb-8845-40d2-5398-08de5848a55d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?ZLTkgF/gzuOIxOk190PBRTBxsxTyMFAtWQ68ayfREAQotA98UCYs2SYHE1?=
 =?iso-8859-1?Q?Vv5HVODMpX1Omz/1GKsT5Yir6jG0OwQvtCXJ/Qv7MVMrDKk77z2bbZK+6F?=
 =?iso-8859-1?Q?ez06nvkEE6x21Nrmalupiijq2z512XbKa18kAxaBg/5bEf55q0oauGBIDP?=
 =?iso-8859-1?Q?f4tNmRLZw/Xtonm4U0LuqQGskE6wMhn/MYB8DBMmLONaHKf5jJZLllz3MM?=
 =?iso-8859-1?Q?lZbZKRtFO1tdW7wMgRbhbFZCDmDM2BuyXY1L1TErbrnOnqD5CW/h7EXQ1T?=
 =?iso-8859-1?Q?Jl9iF0IFqJLkqtm0F/kYsd+i76pdHeZyTEIbihSeYftz9C6m3vnPydOLJp?=
 =?iso-8859-1?Q?sYTX0Zcoa9QR1myJqMX8mJZ2Y/wOMtSxBdgoFqO4wTfxsM0rzgfHODAHjE?=
 =?iso-8859-1?Q?kJjJLOg6+I27hkqQpJBwASJD71QLb7sESltnm14Hx5jvutGZCD/118qk+H?=
 =?iso-8859-1?Q?7NSl27bYIEpzoy1IR6y8SaR09ZHH141+VoVRi9EhmNK6ScCKmJGPdSEOfk?=
 =?iso-8859-1?Q?QcKHzEJm18FV8jhqbE1SIuT+y9dZCRO28S9OSjYCiXNORg3OCneRlGBmuA?=
 =?iso-8859-1?Q?D67oALDteqevE9DM5qvlDH4xr8yCgGezj0emvZXr7nA+bp2vtZotRL2URJ?=
 =?iso-8859-1?Q?gqx9QtP1iV1Pcoie3opbq3uva+Mac2nrrLT8n1RdEjAn1CaVPFcRhwOhLJ?=
 =?iso-8859-1?Q?LfdpV2FLGGv5W8h6HeQe2YNY6FkNesMXOe7LnO+zm7+YKiQ1bkw5R90XKp?=
 =?iso-8859-1?Q?vijYB/uhoNQMG5SqxMTR2jsohA678sUhGE40ikC66w1Brs2X7GV5E5aq7l?=
 =?iso-8859-1?Q?np2zM1GqoLNwuVfekdNe1A3tiXiisSQ58aU9qfVq3laOx+JqtP+5EPLOF2?=
 =?iso-8859-1?Q?ov39vlRESUCu40PO0avoA7a6xmkPz0kqu+dsVyNKUQB9Rne7TFQKE5ZZ3v?=
 =?iso-8859-1?Q?zxmzkrvxPas3oMFC5BwWdGKGWBG8ItmlS+qkDwiq88ZVogfs6XaX4QPP2u?=
 =?iso-8859-1?Q?iDTjZGCYoVqXRAo+QzoBv/dDpuNkRylLXRuxk48KNulvb9E7wSC9nkrWd0?=
 =?iso-8859-1?Q?mIlcTfO8C1M/XD8Yhi8k4v1dHThewdzHZm6HJcDKMtFfOhXK1XgC0zYOmp?=
 =?iso-8859-1?Q?4/sz4XwMYbuN5vfByV54NGybw2N1AQfHUTy/YpiV+hmK5h9h5ewlJk+Ckh?=
 =?iso-8859-1?Q?wY9GogF9tKemQYYNdpLa1HwEK2PWPmZywk4xbhbnAy88l9f1EZSshx5H97?=
 =?iso-8859-1?Q?axSJtpDVhUj8mjTlFH4Zd6acevZZWSe+FC0iBVPh45Juif7+cOdFMMHgF6?=
 =?iso-8859-1?Q?Z0xlwEO/kPtjXZq3t3Ey8i8jVrACryiBbw1SC5CG2C7LW1rS0yRYW0HlfF?=
 =?iso-8859-1?Q?yeKRWNOgyBn5X6YNTLhGnBibmCof42XLCGy42SiNsZSEuSm6IBXerEeDOj?=
 =?iso-8859-1?Q?9Of0fp0sXqujZz1ZjMOYCZSSOqVCQRc/J2Fu/cz9IhNres3KB4kWGF6zFq?=
 =?iso-8859-1?Q?Ny/i7PgH4+ZvdJldRoIe5ETym6CXgrU7ZimAIXyFVsf8hsasV9R7hZ7W4E?=
 =?iso-8859-1?Q?IEGm8A1wEcV00Q8ySlnHC4swB2/+r+3/BVGTZHmatxJvrozHdK6xM8QlMQ?=
 =?iso-8859-1?Q?jH0Lhm9sSiIhI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Nu6Sn/MPw7dL02ry1Nd/ju5YXSjZNBIDOCCr2OBexY3IQj08uKRCQyRQd6?=
 =?iso-8859-1?Q?xPTLSMOr9WINsTA2jg/8Mas/te2I2vqBk3gtFMfgFjoyePVCoxFaAMB4KE?=
 =?iso-8859-1?Q?9SEgToE3JrCFd4nPFdY9ltNEup/sw3ow8BGx6m+1LxocUyovtgQ4XFeboT?=
 =?iso-8859-1?Q?QuUp5vTdITGsDvxO71uPhJtvOIO1e6ebPHfuBznhlUpyKbfA/EO0RVIS6M?=
 =?iso-8859-1?Q?LjIoreRd3kpGb4rjU814SEhdsVlegEvsUv2hfFTOmIZu7lBPV0ADb/sjy8?=
 =?iso-8859-1?Q?zpLFFuDhun06UfeJuaRbbJuK9XpibQryxzBN+DZS5rGf7pC2LKukGyNYwi?=
 =?iso-8859-1?Q?o3MqrruRYx5NVN4i3Wcdi5rCXPv4BVouO7wNUzKv21H++M7+Z+b0EphMHB?=
 =?iso-8859-1?Q?YFHRBbO0BQ3wb8VXZNf7VBFwRQOgJAjrSPzsdMi3eXOPK1BqG5Xwa5shDK?=
 =?iso-8859-1?Q?+C08Gb1mhFMjpKshx9BSBWmf2veKfbrGst7aXoEjQ/ADMl0ogH0I4fUpK7?=
 =?iso-8859-1?Q?O1RePmdopj0pQEw4cNudIs6RdD2LeYXD9shSAqTfMh21l+fw7enTiX/c+0?=
 =?iso-8859-1?Q?T2nhoXo7E7tSydXRtVcTvuFZInWS/87gEVElt02sb2UpYUNj6+QnhnK8vR?=
 =?iso-8859-1?Q?tdui3goORUbja4psCYjGGMEBkULR65+878xAXOimleKlgyob4rCmco0X5T?=
 =?iso-8859-1?Q?XptTsasTwNI0wL5OyZlOvBEBbQ4CFAbvJLNBLRBDbaFNCQYESzBZzJ23s8?=
 =?iso-8859-1?Q?vIxHWoMl93SqFHPvXxVvY/ekrpT/TiVy68j4ItU/gxLD0gOOTvbkSsRyDM?=
 =?iso-8859-1?Q?6uVWVkSvT7dV7D1rrChhAAgybkdQHTkv3h2yYYKxCfSTm05LSL3pMJukNd?=
 =?iso-8859-1?Q?VOQOVHO2x30FJEbbF6oqaGTKwotV4P6hXPgk2eVZuSpxsC+TP5DjeYoaIF?=
 =?iso-8859-1?Q?DHdPzJkZAHmdAvKWwi2j84UTxSyUwxxIGQxILLde/56ZZUBrxyMjUHHJfb?=
 =?iso-8859-1?Q?Y6ZoTu9KhXFrkGJiwozcNLibzsRcYagMHNDD9u0QfxQZlYpnHUvTgU5dxW?=
 =?iso-8859-1?Q?4q9AY/rWxnW7nFsAkYrD3JXI8UEeQR7T8zBVq20oo8FJv/oSzaKvIVTasn?=
 =?iso-8859-1?Q?YK41OHtiiOZoA55afsuRnsVyCniTZMRdtdOORORdZ2WBUq40Lb3d0HxLI2?=
 =?iso-8859-1?Q?LYqeIoCd76rTrVboez/rUM9bK8Jq90HmG8ed3PUuWMx544J8zJRgbP8HpZ?=
 =?iso-8859-1?Q?DOJqmqhXeRZdNIgZoo1bLWXR4Xu5pExRf3VauZ4tWIgkvWrtY6ErDidI6M?=
 =?iso-8859-1?Q?FBIiFdb+Dv/uwTfiYOQialFtPPxy190LqhYLvoi0pgnWVUEUycAigbG50K?=
 =?iso-8859-1?Q?j4lrot7CO34TL90oeGMEX4qnKlA1FlvL+DsoTpqyQRB7nvCHgSbANtKSeD?=
 =?iso-8859-1?Q?vd/TmBYJGLDxdDW43bAxOZxhWN7cXERPEq95LmhEuxm4LtlgW4HH+IvsMY?=
 =?iso-8859-1?Q?4H9pAZRcSH82VVuHs2RP9stqeTjl9Yo1LRYhNkRti/U1NP+XPQlM7p86/b?=
 =?iso-8859-1?Q?B3J5bbaH9Wxzgt07bnlBu5B+bk9pXfcNmywSkTFqrG7c4BVU58zckpzvQr?=
 =?iso-8859-1?Q?9/qfcu5/c25PK9aLYQ/AvbDm5Ku2xG3n0psq5GHBTmMlyXOt8Pv4mWzcwZ?=
 =?iso-8859-1?Q?xEdXfQlwJAxtcj9BpmPLX5FklMO7D4VVx1WsOuq/w+OvqeAS5TPyBoQv4I?=
 =?iso-8859-1?Q?huqhsu32Ighg2aULcGvZRcd8aPAUGsbkaTGwWuhVJHfKsWv3FH6xrGHboq?=
 =?iso-8859-1?Q?vRFWd4vDIgEn9ZbORD7FdaNVeH/LZc4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c6f6fdb-8845-40d2-5398-08de5848a55d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 17:23:36.9693 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rvVJZhdG9tDziQ9E8tXeLiK6eP7TPqS+maLX5vAynkbTDcaO/WA7Q9GQcWGE9DzRAHF4NBWqKZda6fElYsGOXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7825
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

On Tue, Jan 20, 2026 at 11:38:50AM +0530, Arvind Yadav wrote:
> Return error when CPU attempts to access a purged buffer object.
> Purged BOs have their backing store reclaimed by the kernel, making
> CPU access invalid. The fault handler returns SIGBUS to userspace,
> matching i915 semantics.
> 
> The purged check is added to both CPU fault paths:
> - Fastpath (xe_bo_cpu_fault_fastpath): Returns error immediately
>   under dma-resv lock, preventing attempts to migrate/validate freed pages
> - Slowpath (xe_bo_cpu_fault): Returns -EFAULT under drm_exec lock,
>   converted to VM_FAULT_SIGBUS
> 
> Without the fastpath check, accessing existing mmap mappings of purged BOs
> would trigger xe_bo_fault_migrate() on freed backing store, causing kernel
> hangs or crashes.
> 
> v2:
>   - Added xe_bo_is_purged(bo) instead of atomic_read.
>   - Avoids leaks and keeps drm_dev_exit() while returning.
> 
> v3:
>   - Move xe_bo_is_purged check under a dma-resv lock (Matthew Brost)
> 
> v4:
>   - Add purged check to fastpath (xe_bo_cpu_fault_fastpath) to prevent
>     hang when accessing existing mmap of purged BO
> 
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index d0a6d340b255..cc547915161d 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -1934,6 +1934,12 @@ static vm_fault_t xe_bo_cpu_fault_fastpath(struct vm_fault *vmf, struct xe_devic
>  	if (!dma_resv_trylock(tbo->base.resv))
>  		goto out_validation;
>  
> +	/* Purged BOs have no backing store - fault to userspace */
> +	if (xe_bo_is_purged(bo)) {
> +		ret = VM_FAULT_SIGBUS;
> +		goto out_unlock;
> +	}
> +
>  	if (xe_ttm_bo_is_imported(tbo)) {
>  		ret = VM_FAULT_SIGBUS;
>  		drm_dbg(&xe->drm, "CPU trying to access an imported buffer object.\n");
> @@ -2024,6 +2030,12 @@ static vm_fault_t xe_bo_cpu_fault(struct vm_fault *vmf)
>  		if (err)
>  			break;
>  
> +		/* Purged BOs have no backing store - fault to userspace */
> +		if (xe_bo_is_purged(bo)) {
> +			err = -EFAULT;
> +			break;
> +		}
> +
>  		if (xe_ttm_bo_is_imported(tbo)) {
>  			err = -EFAULT;
>  			drm_dbg(&xe->drm, "CPU trying to access an imported buffer object.\n");
> -- 
> 2.43.0
> 
