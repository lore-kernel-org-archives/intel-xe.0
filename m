Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0DA2C54FB3
	for <intel-xe@archiver.kernel.org>; Thu, 29 May 2025 18:01:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 559AE10E02E;
	Thu, 29 May 2025 18:01:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HUuS3fWd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1938410E02E
 for <intel-xe@lists.freedesktop.org>; Thu, 29 May 2025 18:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748541700; x=1780077700;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Rl1D9fun41ri5X5WJ9edHvQHiGMxyXzPjG/yqedVneE=;
 b=HUuS3fWddCo1E0qf81rGAV3tBibWMfHq4rBZdO8NUsoMubz7E7zXT4G4
 Ir7+5Cj9zjpYCSvqRpRZU691+rDGTC1W7ce6+E7oUrSgPQ2vU2ZIJgsUV
 W2ndOcpDMrnSCUma7BizZv1hryX2NPLAljwl+GMkrmXGEz1+dYEeLtecE
 7wi6hPC7aFeA2AC/u2yxhfz8Dkx+Ta+mfXM97l2kXv4IPkEtYIm/a4StX
 hrTOeu3RJmn7jJct6OAT/jfxQ5UpR9wePC124ZMj0jDxBid6drduxuJom
 yQU2ItqZGKZCCjfs+waAtS5QLxJZGzyXZJuclsH0Kx4S/Vxl2NiWKIlsm g==;
X-CSE-ConnectionGUID: 7sVgphFKTc2FIagNtdY+xg==
X-CSE-MsgGUID: g/68ES/GS4ikq3nsGhgwBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="61282300"
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; d="scan'208";a="61282300"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 11:01:40 -0700
X-CSE-ConnectionGUID: Ujak9N9bSnOJIJ5RU0oq4A==
X-CSE-MsgGUID: xrfcH/BATNeq+h75DxmHPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; d="scan'208";a="148924026"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 11:01:40 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 29 May 2025 11:01:38 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 29 May 2025 11:01:38 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.73)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 29 May 2025 11:01:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c5M6kztmRxMioOw/Q+4XtmqQXWfZgc3JC1cavIRrSWyjmyAszMVw4IHMGv/M98oGfGgKrm6wn8KsaCBhv8PX1H2HUmSLCU70BqXjpm4HstT2TzLfUlTXCYnEHFwXyTsw96rwSMmeQh1gNhOWDPng1YSLC3XLBkZV3gTRGF7AZfjYqL99yS2Km5U/S5XxqZJ+00jM0pmAROVefXB+SZHraiToDzYeN/EPLXVTOFrPRlLe7e7igZCODqtmnenpjApVIxIrEtM7t53Nq8DRliqvpNJNuK5ZVf3ymv2vhiZWnDkfHAzxtNmCO1gX8EitPG97708vUn7cb6ZiJXx+VxnRWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UKrIXCOCkAxCEcL+astX7pqkfUpIMnxZr8SawVAePVA=;
 b=kdcFRzdo0jeTU16s9VXH4rUVbpkNBNc02UHj3sf+aGtAYU/Amd0Y0OMJp0CIzSZMo6c5oRU/GI0f7fmF7fkfsLxArD9dH+bZ6iQEGip215QPYQoz7N9Idus3gAZ5P/qiBMzo997xoTFACb28avTKNivKc7xnZrXRpDL5xea9kM0RZpinSOYQnH+m6m8jxka9BvjmJ2K58qpleYPPObebcXlZIh25XwPAlsz815T5TXEM00p0dIbsHcV2g390I12BFDARUSZI3U+hoXF6bR5xL148qt+gnXWnwkDNJw35ndEcRrjvU/s4KK/xVWHFEgRMMAnbIAhUqnj2IBzzXqBJ9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY5PR11MB6259.namprd11.prod.outlook.com (2603:10b6:930:24::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.31; Thu, 29 May
 2025 18:01:34 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8769.029; Thu, 29 May 2025
 18:01:34 +0000
Date: Thu, 29 May 2025 11:03:05 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Souza, Jose" <jose.souza@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH v3 02/19] drm/xe/uapi: Add madvise interface
Message-ID: <aDihWYeSqx4MYHOw@lstrano-desk.jf.intel.com>
References: <20250527164003.1068118-1-himal.prasad.ghimiray@intel.com>
 <20250527164003.1068118-3-himal.prasad.ghimiray@intel.com>
 <70dd9d0b7d94a81468576e51fbdcefa09e75de3f.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <70dd9d0b7d94a81468576e51fbdcefa09e75de3f.camel@intel.com>
X-ClientProxiedBy: MW4PR03CA0235.namprd03.prod.outlook.com
 (2603:10b6:303:b9::30) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY5PR11MB6259:EE_
X-MS-Office365-Filtering-Correlation-Id: a426ad13-5d65-4b17-8fa1-08dd9edad916
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?9+LZ1SgYbW1GK9MjqPFl/20d6kjKXMwEF7CEl1tA0C9JGeiSsn7a9Xssvo?=
 =?iso-8859-1?Q?6MAHWF56ccvxG22By0tndX2tcc4GMgO4ysbhGJl34GOU2/q8s9WzOMBh4F?=
 =?iso-8859-1?Q?N4WXtuPQZUvJyVGKMqC5LPsnGXGZfguVz1TkUfK6Yvk7djYT/ypvNVbWGe?=
 =?iso-8859-1?Q?nSgM7wcOlrW+YbSs6ZjWlrdtHtTlorn1cWun8uOMOcTRGEpTAqtc7EcKB4?=
 =?iso-8859-1?Q?gMCEKeeLUEAJK9cxr3Z4uACaOBwGvVeNOcsgJY0iLWOruoLmhPptMr1X3M?=
 =?iso-8859-1?Q?9cxTVQo8Jad7s/BeuxDhyo03Ab37+AQ8EQlgodMKUsGAqoh1XDUpu6Tqbo?=
 =?iso-8859-1?Q?yGlWlDt1rF6gqkd5g5gEpdnJc7+OczXZUWNhjjUDq1jh9cFD5sj2IM+UEB?=
 =?iso-8859-1?Q?YpyXJJlKE4e+YzfDf8E4tp0Uia5NPRKxQfVdn1egyzb0VbyD6kAVdDuyR5?=
 =?iso-8859-1?Q?1txCAASvu9kEIwmFAgoL3UiDW/l8i/Rb+PYuCXewXyRax8Fs9vsi83gAV+?=
 =?iso-8859-1?Q?Gf0XD5ztV7tl+m/2G7FtoBtAFJDSIsM/reyGG/iSYgJL3ExAKWKR8rTSHI?=
 =?iso-8859-1?Q?Tbw4TTsByPu0/vxPkRbvb255Yp1uXcpgr/yGkuOopxklxlPQ2A2DendG1U?=
 =?iso-8859-1?Q?vvDm8bTyW50AzrunVzqGjFaO8O8hdE1nM5I9YUD19FZuX8Y7NLl2z+32+7?=
 =?iso-8859-1?Q?rXMoBsFB4eJ+m/8g+CYsrlQIfrxxf/DDcA5RBmAQDTL8KK5vjVc2LPk5Xb?=
 =?iso-8859-1?Q?GHgGcYQML0rGBlljC5t8JVYweYAuuwrQ5n5EQGjzcyuDolLn9zrousd89H?=
 =?iso-8859-1?Q?Jgkj7J/2GvxEHb+kgODsjCiDLsnJvgkjWUzrn7WqVFG8qVQRn8Req4/qYl?=
 =?iso-8859-1?Q?VQtWN46ySvJQKbF8+iRtC9V2HxAIb6Hw/6Yz1+dEx87yhcL/VQ57O8opGp?=
 =?iso-8859-1?Q?G5QewSDLqNshkqb8mCPDpnp6vjfc9GBHOCd4T6hZuMCl5koryoYMZIMdvc?=
 =?iso-8859-1?Q?1qd6UaFzUsGPpDpWE6IEUgUUjWEedxKTgQjQE8NxBWY+8F+4hUUlHBc8Q7?=
 =?iso-8859-1?Q?JTjRPUw5EutAW9wL5Q3apOQb8idY5CWpyz8T26Yye3znNbVW+83AWnaEBG?=
 =?iso-8859-1?Q?XJMcBL+3mfqUXLPHJb3Yk8gk0R2WDf6JiF1s1Zd02N4bmDcFjTkuoGz4e1?=
 =?iso-8859-1?Q?ovhcDxR0tR4kND5hdf9LIVO+MScgolgw/HO49oxo9ANcKf0GFFX72sdnwr?=
 =?iso-8859-1?Q?CxDaufRAjz2hQrfjaM68vJjscnhiv+SD0n8cTECLSUtzIi6+dAUZOP40Fw?=
 =?iso-8859-1?Q?Z2NCGWwcMKIyUlzxfCkCqjkQHafC4fGw+IpdvggQAAvX5l1aTxuR+BIZEv?=
 =?iso-8859-1?Q?9PvGMNPeLn8iEysVASqJEbjlYjc5i++njar3cHb4D4GSwHdVJ8c+sfhZAP?=
 =?iso-8859-1?Q?VRVF345Wmzw9x2okOh3yRzCQ5uNpREQknOigHgnhjUdky49WO2nsvGEZeC?=
 =?iso-8859-1?Q?I=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?z0n2f05FASeQsfBAwQRFWyYdaHn4CPKr4sE8xN7SSaCGadiUd7b3aWvtxS?=
 =?iso-8859-1?Q?bx9eXPglO0oKMZNVoVRa51brycW6IeIs9eu63WjGQP/R36aNEK37SDp+51?=
 =?iso-8859-1?Q?8yPVPDfCVAwkCkh0oCAVov5LQqVvBK7sOSYui+Q3AvF9chmmJtvTdq4Kmr?=
 =?iso-8859-1?Q?btd7kLAC4zRhYXxHCD9Tr2pp31YNBHCbQvQyj0/PApsiOVSItvp6offQDb?=
 =?iso-8859-1?Q?L5Irho8ZC8b+ZViJ+8E8MKlecVPecHX24IxE3hZvqyZSiPTqUAyQBuo+Au?=
 =?iso-8859-1?Q?d+8RbK6piMJ0mMbNjHSj4Nt+mCdua9hMlWQiJbXj0cMwVvCxoi79y10otL?=
 =?iso-8859-1?Q?IFJsG6JfTDWjcBUeMc1sUHUeCvuFUzHLp7/xha+5uW9cscAbj6KWqt2QL8?=
 =?iso-8859-1?Q?F4mJ6kwE7DaJkBEQRluM4YbRn9ZXDOQkmrqpPypj2PV9x1P8yleo0+lkDb?=
 =?iso-8859-1?Q?Rzi4BoCqqEW7ivFmvw4pPoQCfJdemKmcgJjTKedCb7wZ1R46IfBriWAAZ1?=
 =?iso-8859-1?Q?vbKHNnaNSD+x5I2omBIaVjkhjrpVDuzes3Wwj5FKXFlT1x1rMY+Fgr6lgH?=
 =?iso-8859-1?Q?UUBTPyMHqix5y9x4ElIRFkP9Cit1ZjU2c2i/GjgKV/yCWaykUUUWqMbyeF?=
 =?iso-8859-1?Q?6/nlo51DzKc5k5J/IS4E9fDMTkx8VBqoAkWO1Z8voYS23MGcWzCmqb0dwq?=
 =?iso-8859-1?Q?GukVh1M//g07ffogoV2k5kx3uiKKusbToFIrlwUpVSJJmOLk9cGNVDeRI/?=
 =?iso-8859-1?Q?DwxcGHEbY/VnG0P6+1rBMV9lF00PV3sQERoCsTn4SeRDtexvJFt864Kp0E?=
 =?iso-8859-1?Q?TiFQ8v1rqutl1W97YtzPZiRc9BbXyFP98sfVGROKqodDiX78fAppgVXhv2?=
 =?iso-8859-1?Q?yhXGcXqnMfdoNZOfuYNRzqFV0Ki1JPY4fv64cFTj8gvSa2QaxltrB4vgAE?=
 =?iso-8859-1?Q?p+nOn4f4sZGcB5OGu4PqBAnTu10/e8zdDce6IZqGPJKrRUnuF0Coztq1Ku?=
 =?iso-8859-1?Q?rj3lJSH1IXj6n4d/qVlSFqYK7OkDLpW2Yrfhr0M1ljSlK8inlShYk+2K8/?=
 =?iso-8859-1?Q?XhX5+BhG+p6FEPq/FEB5cYJFJ7mDBn/3JtxFRfWEBi8hON/RsIYmrO+5Rn?=
 =?iso-8859-1?Q?W/lWm4nN2GeXKMiTBTe2eNNb0w+6zRxm3wfqc3zwQ2pXgpHbPk3S9Uav3J?=
 =?iso-8859-1?Q?JLZ8HFdUURn2F3ZiXOmGwNDVv39C0NF8KSlQ9qP5ecnkC5+pIHD/PVbFaP?=
 =?iso-8859-1?Q?gOARUmO5rQcUGkjPreyLIfkC8/vJGYwv0/uLJjYbErjdoE8BP7KaiWSAIA?=
 =?iso-8859-1?Q?V7T6Kj5Gop7znLcnm7czbUry4XqN0eyeTNdau3gyq1gWA08DpCNPPJNjMr?=
 =?iso-8859-1?Q?XoqVEzuowz+okNdPu7fZsqbgO4HE8DYgrpbxVunSbmREa+VnhGPVPoSypH?=
 =?iso-8859-1?Q?xkEzd80wOjTsBWKE/6x8Tl/gYoaMKAK4v4lllcOyEN4CwUnxoK3C2xNIT+?=
 =?iso-8859-1?Q?nmf5upui7yxqCAJ6Afijx6S/QFZyemXIA7t+oA75T6gCb+kWun7HtpIS9q?=
 =?iso-8859-1?Q?iqayE4i4GDJygshP50xN/yjHPaoH9SOc4dzn74n6OhC5o+DhUZG5+qq218?=
 =?iso-8859-1?Q?DYSgRWYxCod8/w+VxFR6t9vf/fjMc6pYRjxVh0gtCDjbRaYPD+ZckvEQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a426ad13-5d65-4b17-8fa1-08dd9edad916
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2025 18:01:34.0238 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y+/BajiFIZngaDPCKJEN4KGYmPNGU/5O3l/7pTmnxffzIY7vlBJCV657q7oil/le/oJ3EJRqoyvwG/o4DLt5Zw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6259
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

On Wed, May 28, 2025 at 05:03:07PM +0000, Souza, Jose wrote:
> On Tue, 2025-05-27 at 22:09 +0530, Himal Prasad Ghimiray wrote:
> > This commit introduces a new madvise interface to support
> > driver-specific ioctl operations. The madvise interface allows for more
> > efficient memory management by providing hints to the driver about the
> > expected memory usage and pte update policy for gpuvma.
> > 
> > Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > ---
> >  include/uapi/drm/xe_drm.h | 97 +++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 97 insertions(+)
> > 
> > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > index 9c08738c3b91..e0d75226a724 100644
> > --- a/include/uapi/drm/xe_drm.h
> > +++ b/include/uapi/drm/xe_drm.h
> > @@ -81,6 +81,7 @@ extern "C" {
> >   *  - &DRM_IOCTL_XE_EXEC
> >   *  - &DRM_IOCTL_XE_WAIT_USER_FENCE
> >   *  - &DRM_IOCTL_XE_OBSERVATION
> > + *  - &DRM_IOCTL_XE_MADVISE
> >   */
> >  
> >  /*
> > @@ -102,6 +103,7 @@ extern "C" {
> >  #define DRM_XE_EXEC			0x09
> >  #define DRM_XE_WAIT_USER_FENCE		0x0a
> >  #define DRM_XE_OBSERVATION		0x0b
> > +#define DRM_XE_MADVISE			0x0c
> >  
> >  /* Must be kept compact -- no holes */
> >  
> > @@ -117,6 +119,7 @@ extern "C" {
> >  #define DRM_IOCTL_XE_EXEC			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC, struct drm_xe_exec)
> >  #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
> >  #define DRM_IOCTL_XE_OBSERVATION		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_OBSERVATION, struct drm_xe_observation_param)
> > +#define DRM_IOCTL_XE_MADVISE			DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_MADVISE, struct drm_xe_madvise)
> >  
> >  /**
> >   * DOC: Xe IOCTL Extensions
> > @@ -1965,6 +1968,100 @@ struct drm_xe_query_eu_stall {
> >  	__u64 sampling_rates[];
> >  };
> >  
> > +struct drm_xe_madvise_ops {
> > +	/** @start: start of the virtual address range */
> > +	__u64 start;
> > +
> > +	/** @size: size of the virtual address range */
> > +	__u64 range;
> > +
> > +#define DRM_XE_VMA_ATTR_PREFERRED_LOC	0
> > +#define DRM_XE_VMA_ATTR_ATOMIC		1
> > +#define DRM_XE_VMA_ATTR_PAT		2
> > +#define DRM_XE_VMA_ATTR_PURGEABLE_STATE	3
> > +	/** @type: type of attribute */
> > +	__u32 type;
> > +
> > +	/** @pad: MBZ */
> > +	__u32 pad;
> > +
> > +	union {
> > +		struct {
> > +#define DRM_XE_VMA_ATOMIC_UNDEFINED	0
> > +#define DRM_XE_VMA_ATOMIC_DEVICE	1
> > +#define DRM_XE_VMA_ATOMIC_GLOBAL	2
> > +#define DRM_XE_VMA_ATOMIC_CPU		3
> > +		/** @val: value of atomic operation*/
> > +			__u32 val;
> > +
> > +		/** @reserved: Reserved */
> > +			__u32 reserved;
> > +		} atomic;
> > +
> > +		struct {
> > +#define DRM_XE_VMA_PURGEABLE_STATE_WILLNEED	0
> > +#define DRM_XE_VMA_PURGEABLE_STATE_DONTNEED	1
> > +#define DRM_XE_VMA_PURGEABLE_STATE_PURGED	2
> > +		/** @val: value for DRM_XE_VMA_ATTR_PURGEABLE_STATE */
> > +			__u32 val;
> > +
> > +		/** @reserved: Reserved */
> > +			__u32 reserved;
> > +		} purge_state_val;
> 
> The set purgeable uAPI looks good to me, so this part is
> 
> Acked-by: José Roberto de Souza <jose.souza@intel.com>
> 

I suggest pulling the purge_state out in the initial megre if purgable
is not implemented in the series which merge. Good to confirm we have
the bits available in uAPI + Mesa is good with this - we can add these
back in once the implementation lands.

Matt 

> > +
> > +		struct {
> > +			/** @pat_index */
> > +			__u32 val;
> > +
> > +			/** @reserved: Reserved */
> > +			__u32 reserved;
> > +		} pat_index;
> > +#define DRM_XE_PREFERRED_LOC_DEFAULT_DEVMEM_FD 0
> > +		/** @preferred_mem_loc: preferred memory location */
> > +		struct {
> > +			__u32 devmem_fd;
> > +
> > +#define MIGRATE_ALL_PAGES 0
> > +#define MIGRATE_ONLY_SYSTEM_PAGES 1
> > +			__u32 migration_policy;
> > +		} preferred_mem_loc;
> > +	};
> > +
> > +	/** @reserved: Reserved */
> > +	__u64 reserved[2];
> > +};
> > +
> > +/**
> > + * struct drm_xe_madvise - Input of &DRM_IOCTL_XE_MADVISE
> > + *
> > + * Set memory attributes to a virtual address range
> > + */
> > +struct drm_xe_madvise {
> > +	/** @extensions: Pointer to the first extension struct, if any */
> > +	__u64 extensions;
> > +
> > +	/** @vm_id: vm_id of the virtual range */
> > +	__u32 vm_id;
> > +
> > +	/** @num_ops: number of madvises in ioctl */
> > +	__u32 num_ops;
> > +
> > +	union {
> > +		/** @ops: used if num_ops == 1 */
> > +		struct drm_xe_madvise_ops ops;
> > +
> > +		/**
> > +		 * @vector_of_ops: userptr to array of struct
> > +		 * drm_xe_vm_madvise_op if num_ops > 1
> > +		 */
> > +		__u64 vector_of_ops;
> > +	};
> > +
> > +	/** @reserved: Reserved */
> > +	__u64 reserved[2];
> > +
> > +};
> > +
> >  #if defined(__cplusplus)
> >  }
> >  #endif
