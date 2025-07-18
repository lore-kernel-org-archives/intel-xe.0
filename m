Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90F82C83F1A
	for <intel-xe@archiver.kernel.org>; Fri, 18 Jul 2025 04:39:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B2F910E0F5;
	Fri, 18 Jul 2025 04:39:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NJ4uW1pG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79F9010E0F5
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Jul 2025 04:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752813584; x=1784349584;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=eT4C1+u7wKPjo09fCSbw9+JH0kE+1zR1zbNMhCrudS0=;
 b=NJ4uW1pGNW/QLYqk+RFUuYe7PxFhUjZmWMkM2uY4qcU0/2d0xNkn6nYG
 JQwd3bAsbV7iteO5zHvLm4bqw655UHotQMqNTFSFnvu9SmvO1nr0jl+4s
 63xzDnQn7uXPQu52FUf9JILS5wPa2naGePl5g8HXHASlHv0u0GR4n34D5
 PUEbO4IM3S0KgygPBfTsWUyBfwQ/5ydPqxmaVu1uFlYKQJ1glBD+lbm0h
 ImbN6qN2+MsXHsc+bSncoHk1MIoKMwWhoECIwBIk7tZtzPb7vf07JOgjL
 9UKCmdwpQWdeuWVx+vKbjZMBV01+f39DeAnQPCFDDYGg3xAM7XeA+sa5r g==;
X-CSE-ConnectionGUID: A0zOFO8WQFOEDwgEfySLkA==
X-CSE-MsgGUID: p+5wXjuQRVK+Ll/Iq9TKBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11495"; a="58914375"
X-IronPort-AV: E=Sophos;i="6.16,320,1744095600"; d="scan'208";a="58914375"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2025 21:39:44 -0700
X-CSE-ConnectionGUID: 89VjyQyCQa21/ZHOngUYsg==
X-CSE-MsgGUID: Ng8xj8z6S1S2sxEE7nsrhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,320,1744095600"; d="scan'208";a="158442184"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2025 21:39:44 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 17 Jul 2025 21:39:43 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Thu, 17 Jul 2025 21:39:43 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.61)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 17 Jul 2025 21:39:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lnIhCSmfv2waPpeCKqe3JUtIadx3SgLCE0An4uNbW4t2G96g9ykyJbAAnnCt5i/fy274kPGES3+za0PCeLbhrLINrIX0nKLGxh7UyY/ZcBfbKEQfJd1h8sn6QxY40CgHhZF15MzbSk4QEu2FRo90t6YwVE8br2hvFPCj6Qt7Gm7Dcx6A5RoOzQOWwEjXgjcVnVCmSlOkt/rZ5X8G+IPG7lSsvOzWCWHF7Qo7Skock//gKPJYYYkg7mJCEkBrk/gdHxGExmDhM+Ax2U6wOtYQ84dTlKaj4l3EEG8Pl2NG6DYXLGShL8oBPHI1xt0DiuAHkHDijdIL6+AKNW6lNqKxMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b1ZkSU+bVM3MrO09sA3o2YX0qpt+iYzprPN1/6G5GNc=;
 b=LWYcH1nKIMpQnVtPbLQKel6SRU+9udpX2SyyXBD9w0oXe2j0N3HuHEIL39TNXUmdh4X6HsDQzaRmVfzT1zPsbY5hQGEtpwOjG8Rnv4xuHfPdunobfLF6Vo/yq/Jn71BScsXTdHolpz6uRg/MGgVtWXqDPBRsojGZUi4D1hcum4GkFsW+vQ3KhQoJOPDvy1ALl/xssChDP0chtBKnsGimsy7nUafTvlDuZFkuUI9boY9FAWBPdZcUkbYv3qCRjdb3pnI91ORoriimDiU9i7zZZEsbwCm8AyQ0nHwzLbqp2mrP9+q5NLYX/SBCLucgHZAOgOyJ6mmCoN2zxDa1ak3q9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by PH0PR11MB4791.namprd11.prod.outlook.com (2603:10b6:510:43::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.35; Fri, 18 Jul
 2025 04:39:38 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%7]) with mapi id 15.20.8880.021; Fri, 18 Jul 2025
 04:39:38 +0000
Date: Thu, 17 Jul 2025 21:41:23 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v1 5/5] drm/pagemap: Allocate folios when possible
Message-ID: <aHnQcwv0qYcP/zis@lstrano-desk.jf.intel.com>
References: <20250717133928.526111-1-francois.dugast@intel.com>
 <20250717133928.526111-6-francois.dugast@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250717133928.526111-6-francois.dugast@intel.com>
X-ClientProxiedBy: SJ0P220CA0017.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::27) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|PH0PR11MB4791:EE_
X-MS-Office365-Filtering-Correlation-Id: db639cbf-bb61-4b7c-f991-08ddc5b51a61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZURRZVY0bHh0ZkxmbFkwcGgyWUhzVlFJUUNOaERWcDlsRndvTTlHUXBMcHhw?=
 =?utf-8?B?d2pmYytjc2xQZ25MNjZ4ZElNRVYyOFZWc2ZiZ0xpM3pDczk1bjFmSE16aHN3?=
 =?utf-8?B?MVlnRnlJbDBhYXNkK0szMXdNR1lEdStGVndlZE5BTFFWQTZ4VUNIWVFvRW1x?=
 =?utf-8?B?MWpCZTQrVFkrVWEzTmd1VTZBVkRYbklZZ2MrT3BRcng1NndvRzF5ZHYvQVlR?=
 =?utf-8?B?VXR0ai9PaUJpVFIvVlhkUVB6bGFzUnh2L1NjOVdTY2MvTldTck5xSGtsbzRN?=
 =?utf-8?B?Y25QZm5JakFZaUtDSlFBQkExU0k3RzM2bDlNbVFNMFl3L0tLeFhmVjdyYjRn?=
 =?utf-8?B?aEVqWlVqczVMTndyNXNvWG1pOW92UDREZFhIUXg3ZTJuUUpyeE1Ea2NsN3py?=
 =?utf-8?B?ZEVsek91amE3ZWhVbmhhbnRNY1RUZ1FaTnYwcnYwYm1CMlQxQXl3RGMyNDhD?=
 =?utf-8?B?bncwWkI2MXhGMWJVQWdJbFNxMmt0QitlSHBibkc2ZWtadG10SEZ1L09LaXZi?=
 =?utf-8?B?bGczRUpwd0pWRmV1UjlCemZkb2lONW5sMlBIeDk0MVR3UlgxZXdSMmhuL3JU?=
 =?utf-8?B?d2lrUjk3c3E1djgrNC9JcTZiSitnNWQ1U241NytHK1Z4UXB6UC9ZNjBKU3Rs?=
 =?utf-8?B?SExwM2IxY3FpUWlKTEJTbWJxL2ZhaFd6ZmVyT3FMb0Z1dXNFSmVyU2pRODNo?=
 =?utf-8?B?WkJzNlNraGVyVGEyaldVdTdTeXNKNUo4R2RDMHZRTUwrV2V4Rm5mUkt4bXBL?=
 =?utf-8?B?dkhFaVV5cm1BRllzRDV2M0lVVFkwSFNzZHRJV1Rkczd6Zit6Sm1ud2puVjR2?=
 =?utf-8?B?QVZrYlQ3a0ZnR0xDRGxFMWJuMnVieUtqak1zZThVVlJ5MUdWQzVTdzZNak5v?=
 =?utf-8?B?Q3hqdmhBYTIwdWVrSlBMeDVRN3FMcTYwMUFwaUJScmU3SnZsTkRHMXZySWla?=
 =?utf-8?B?SEF6VUpuQVB4eU42dlBRU1dvMmNWUDdLVE1BQVE1MDg0VHNQZkpraVNTZ01n?=
 =?utf-8?B?eUx0ZGQvaElxNlFVZWRRRytjaDYvTGNCaEYzd1R3YkdQYzlJTWJCZTNNRExP?=
 =?utf-8?B?RWJUbXdiaXZ1c2hBdnVSTXlXY0M3a0lETDEvQisrVkpHNkx4ZkhhZVdib2Yz?=
 =?utf-8?B?clJNb3ZrVklvM1VMUlQzSERGaUFtYksyQk9JYU0yNktzdTYrL0FoRDI3N1Fx?=
 =?utf-8?B?ZSt5UnVEU2NaWGQrS3Y2YmxLMHpUaFdnUGJ2bCsyUkZCTFNhc00weXNKVDlQ?=
 =?utf-8?B?dHRHS1hEWGpxL05SL3hhdDdoNk1qRXYxZExOeXdZRU9ZZU45YUVTWDJuWGVY?=
 =?utf-8?B?Z0ZZd2hZVlp1TW5jOFR0WU1NOGRXWnNNZmRkcU9pdXM3ZEN0bXdiZkd1TllB?=
 =?utf-8?B?VTNOVE54YzkyQjI4V0s2TWdrU25NbUhrM2NGNGJKVFBpSDFFUFlmQWs5MEJr?=
 =?utf-8?B?TmxMYjhjWTZTR1lwYkRWSWNNdGNnOWp3ZFZtMGI1dVh5c1QzNUxMV05waEN6?=
 =?utf-8?B?eUVxUUoxTU9HUkpJVFdYYWZKaE9pWVl2R2R4RlZEaE5vMEJ1d05qbEYrZ2RF?=
 =?utf-8?B?bG93ZnZNR0R5aFJVQ1diT3VMelNxUEg4TjNrY3lpTTJBQ3dJUlNzSllhYkRo?=
 =?utf-8?B?SHVxNHdQTlpqMXdKUWR3WFBQWUNEYndITk5sUkI2MXo0T2xKMjBTaUIrMGZT?=
 =?utf-8?B?OGRlS0pzdXlkVTd0K3RpRjZVYzUybFU2TlpPZTdJVGE4WFNmTlpRSUFmMkh6?=
 =?utf-8?B?clBlSGpVdkVqUWRXSXRVUTV5eXlJajM4bmRJN0hXd3JTR25QNUszNlU4VGpW?=
 =?utf-8?B?aXRudUtBM0pZL281WUh0MHNydCsxTTA2T0tndEdxeFlJbVlyZ1h2NS9md1RT?=
 =?utf-8?B?YjdtWFlETU5NWDhZUDFNV2RTQzd1N1FQbE5neDdQNzRkeUFUK0l0VnNzSHA0?=
 =?utf-8?Q?DxhajESdakY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZCtQNDNoZFQ4d0tLdnJwU1N4NzdvK2swL3JGVXN4QmRPNis5SmE2VkxDaXl3?=
 =?utf-8?B?cForeHlYWTRsS0dDZVlvMTlrdm1kejhRaUZFRkRCc1A4czMvQVRMTjdFNFRE?=
 =?utf-8?B?VTlOTXpoT20vNmwwcXpSQUIvQks4bndKNDF4SllQcTJ6SEM2V2VXRDFGS01w?=
 =?utf-8?B?TmQxOE5mRS9Fd1pKQmlqeHc5Y3VlRlh6UmY5SGZxQ2huVzZVQTVCV0J6UGVZ?=
 =?utf-8?B?M1luVkgvckdzdzdWY2YreTBxcFVyUHNEaXJZN2dSVDZHSjJ3djJSN2x2aThI?=
 =?utf-8?B?TlRNRE1hWEVkTjJKR0NVMkVJaEJYR1VqNGtDb0tNbmZJSnU3UzBlRnFMdmdV?=
 =?utf-8?B?QmFOT0kydWRBWGh3V0U4Wmp3U1pBY1VBeERsd2JQTi83NW1KYnJPcU5SZkdt?=
 =?utf-8?B?dFR2cU50ZG14Y1YrU2gxakJJVUVsc1ZXMGZXMTRwVlJibFd0WGpTbmFpY0RJ?=
 =?utf-8?B?KzI4bzhlUy9sMzZXa2VYZzA1MHBJSFVFN0pUekowRFFiaERmYlNhWFR0RGda?=
 =?utf-8?B?Umd0czlUT2VsVVNVQi8ySXZoQ1VmYmpaTTB2OGJjbU51NTlISTVjMi9XYU40?=
 =?utf-8?B?aS8xR0VIaEhDd0RBTldFWEZ2S2ZmeGlCcXpjU3A0SFpVVzlhVG9sNXFhbURa?=
 =?utf-8?B?SG1jS3R4L2RCNGZTM0tNbkRTWlVDUXJ4VXpldUZhWUhmLzd0ejZMK251eXBi?=
 =?utf-8?B?NU1YczZCNVlBWnVQcWNlQmpYUjREdmowMkJrZGhmUTViSzhkUENpM2hsWFRa?=
 =?utf-8?B?Q3VIOWIvMHMyTEtsMGxlK1R2VmRCaEVoQm56ZTN5TFhadTV6enU0VE8vMWlP?=
 =?utf-8?B?NzlueUd1RHJOZytHWnEzYzdkdjEvazFrYmRZQU9IOG8yVGZyYmNQQlk5ajJB?=
 =?utf-8?B?czNQdENUNTltdGgwZEtuaVNUdTJHNzMwTFdLMG5LZVQvMGk3ZjhaeTlIamVV?=
 =?utf-8?B?aldkY1o3NTFLSVlzQUtOVVVBclp2R3ZCUWhmZFRNUTE0dEZDU1FYeGxXclls?=
 =?utf-8?B?UFZMalFWNE9pL3NlRXZ3ZktRSkFEUWs1TVNkM2VkSTloZE9UbXpxSWpOTUZh?=
 =?utf-8?B?UVNVMDlGdFNBYlNjVzZmRDJteXpUbGRUUGc0NTBlb094ZW9nSnpTWjhYVDkv?=
 =?utf-8?B?UEIxSElHM2Exa0IrekFZSzV0Tk9ieVQwY2VEaG52NVhqam1HUFJIMlJhTmFt?=
 =?utf-8?B?ZEVwbkc1bHp3Q0c4SVFZYng5aFU1ZEhZejBtcWg2OUhpbk5va2plSzF1aG5H?=
 =?utf-8?B?c3RNeDlWNnRaMnEyYkxQaXBTLzByMWpEN3FRZVhBUEdMUzJvbjVCR0srTDli?=
 =?utf-8?B?eDJ4MWludEF2Sm5MT1BpOXc0dWNjaTBwakZZZ3NzMnF1ZXpEZWtDMmVHNDNm?=
 =?utf-8?B?MS9iUWhIMlZwdmhGcHlWMGt1RlRSbWtzclpnYjA4V3FITVBJalVkMWdVZ2ZI?=
 =?utf-8?B?aitydk82NUprQWx1YjZheDlCTjJuZUlXcGdXWFJxa2VmbWlVbFFFVHNtOGZS?=
 =?utf-8?B?MVFjYjRIS2hqNEJjNzVXOWphUlRyZG85TkViMzlPNGh3Ly9CaG85M2xrK2wx?=
 =?utf-8?B?RWRGaytTVjZ5dVZicGFXTUdxSlBGMGZ4eWdtS3hRUkptdnlpOU1VRjJhSHN1?=
 =?utf-8?B?aGJuVDkxeEtVSWpEb0NLMjJFNUNFV3lxUW05ZzllMjBwRU4vTm11dGd3VUE1?=
 =?utf-8?B?RXI4R2FOZ1JCenFNZFJYT3JYNml0Mm16d3d5YVl0SDdqVEpuaTZ0UzBuclEv?=
 =?utf-8?B?VDhJSW5SRyt4TkVnSUZ1TUhCMVR0bUQ4bjdGb1c5cjZ0ZzRYbmc0NUR4eUFG?=
 =?utf-8?B?UWhHRjdpZmdTejFLenZMTUZRazY2M21naEF1ZUJmTWh5c01hbWJKUHJ2bE9l?=
 =?utf-8?B?Q3B1eGswK1VTc242aEMxWXd4TXhXTHpoRUgrNlZUSjZzTWxUU3J5amtmSlFK?=
 =?utf-8?B?V28wRW0xdTV5Z1pMdVpHVTZpRDZ1aFpFcEhnRm5KN1VwRWNjczkyVzZpU0xa?=
 =?utf-8?B?dmp2TXI0bURRZ0pHVDdxMSttY0RLQnRFYlBHWDlkZSs1NG1SVXUxQ1VyR2ow?=
 =?utf-8?B?QmZFZHczYjdYMTFtaHJjUXkxWnBYOVUzZTNxQnFSK0hTc0pRcURFMU5YR21W?=
 =?utf-8?B?TEMrcm5uZmsyR2p0OTNkcklnYktubjJ1MzdKQnhrVEZEZWVpSC80UFhxRVVY?=
 =?utf-8?B?Vnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: db639cbf-bb61-4b7c-f991-08ddc5b51a61
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2025 04:39:38.2100 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Enfj880TKUrjgwJ7jcO+3f8P3gqtkdu+o+S9cSCptnLH1mzOFLfG4dA/h1KSEgFM6Tg4ceqmBC2wvCe1n+A0pA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4791
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

On Thu, Jul 17, 2025 at 03:38:27PM +0200, Francois Dugast wrote:
> If the order is greater than zero, allocate a folio when populating the
> RAM PFNs instead of allocating individual pages one after the other. For
> example if 2MB folios are used instead of 4KB pages, this reduces the
> number of calls to the allocation API by 512.
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/drm_pagemap.c | 33 ++++++++++++++++++++++-----------
>  1 file changed, 22 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
> index de15d96f6393..4f67c6173ee5 100644
> --- a/drivers/gpu/drm/drm_pagemap.c
> +++ b/drivers/gpu/drm/drm_pagemap.c
> @@ -438,6 +438,7 @@ EXPORT_SYMBOL_GPL(drm_pagemap_migrate_to_devmem);
>   * @src_mpfn: Source array of migrate PFNs
>   * @mpfn: Array of migrate PFNs to populate
>   * @addr: Start address for PFN allocation
> + * @order: Page order
>   *
>   * This function populates the RAM migrate page frame numbers (PFNs) for the
>   * specified VM area structure. It allocates and locks pages in the VM area for
> @@ -452,35 +453,45 @@ static int drm_pagemap_migrate_populate_ram_pfn(struct vm_area_struct *vas,
>  						unsigned long *mpages,
>  						unsigned long *src_mpfn,
>  						unsigned long *mpfn,
> -						unsigned long addr)
> +						unsigned long addr,
> +						unsigned int order)

I don't think an order argument is needed. A better approach would be to
look at the order of the src_mpfn (device) page and allocate based on
that. This would maintain congruence between the initial GPU fault—which
creates device pages either as THP or not—and the migration path back,
where we'd insert a THP or not accordingly. In other words, it would
preserve consistency throughout the entire flow.

Also, if you look at the migrate_vma_* functions for THP, it's never
allowed to upgrade from non-THP to THP—only a downgrade from THP to
non-THP is permitted.

>  {
>  	unsigned long i;
>  
> -	for (i = 0; i < npages; ++i, addr += PAGE_SIZE) {
> +	for (i = 0; i < npages;) {
>  		struct page *page, *src_page;
>  
>  		if (!(src_mpfn[i] & MIGRATE_PFN_MIGRATE))
> -			continue;
> +			goto next;
>  
>  		src_page = migrate_pfn_to_page(src_mpfn[i]);
>  		if (!src_page)
> -			continue;
> +			goto next;
>  
>  		if (fault_page) {
>  			if (src_page->zone_device_data !=
>  			    fault_page->zone_device_data)
> -				continue;
> +				goto next;
>  		}
>  
> -		if (vas)
> -			page = alloc_page_vma(GFP_HIGHUSER, vas, addr);
> -		else
> -			page = alloc_page(GFP_HIGHUSER);
> +		if (order) {
> +			page = folio_page(vma_alloc_folio(GFP_HIGHUSER | __GFP_ZERO,
> +							  order, vas, addr), 0);

                        if (vas)
                                page = folio_page(vma_alloc_folio(GFP_HIGHUSER,
                                                                  order, vas, addr), 0);
                        else
                                page = alloc_pages(GFP_HIGHUSER, order);

We may also want to consider a downgrade path—for example, if THP
allocation fails here, we could fall back to allocating single pages.
That would complicate things across GPU SVM and Xe, so maybe we table it
for now. But eventually, we'll need to handle this as per Nvidia's
comments, THP allocation failure seems possible.

Maybe add a comment indicating that, something like:

/* TODO: Support fallback to single pages if THP allocation fails */

> +		} else {
> +			if (vas)
> +				page = alloc_page_vma(GFP_HIGHUSER, vas, addr);
> +			else
> +				page = alloc_page(GFP_HIGHUSER);
> +		}
>  
>  		if (!page)
>  			goto free_pages;
>  
>  		mpfn[i] = migrate_pfn(page_to_pfn(page));
> +
> +next:
> +		i += 0x1 << order;
> +		addr += page_size(page);
>  	}
>  

The loops below need to be updated to loop based on order too.

Matt

>  	for (i = 0; i < npages; ++i) {
> @@ -554,7 +565,7 @@ int drm_pagemap_evict_to_ram(struct drm_pagemap_devmem *devmem_allocation)
>  		goto err_free;
>  
>  	err = drm_pagemap_migrate_populate_ram_pfn(NULL, NULL, npages, &mpages,
> -						   src, dst, 0);
> +						   src, dst, 0, 0);
>  	if (err || !mpages)
>  		goto err_finalize;
>  
> @@ -690,7 +701,7 @@ static int __drm_pagemap_migrate_to_ram(struct vm_area_struct *vas,
>  
>  	err = drm_pagemap_migrate_populate_ram_pfn(vas, page, npages, &mpages,
>  						   migrate.src, migrate.dst,
> -						   start);
> +						   start, 0);
>  	if (err)
>  		goto err_finalize;
>  
> -- 
> 2.43.0
> 
